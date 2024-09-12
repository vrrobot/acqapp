# -*- coding: utf8 -*-
#! /usr/bin/env  2.7

"""
采集zk门禁实时验证状态
"""

import json, logging
from twisted.internet.protocol import Protocol
from twisted.internet.protocol import ServerFactory
from twisted.internet import reactor
from twisted.internet import task

import redis

from common import pgmodel, tools
import config

logger = logging.getLogger('acqserver.acprotocol')


class ACProtocol(Protocol):
    """"""

    def __init__(self, factory):
        self.factory = factory
        self.roomname = factory.roomname
        self.roomsign = factory.roomsign
        self.channel = None
        self.rtData = None
        self.errorCounts = 0
        self.user1 = None
        self.user2 = None
        self.ioRecorder1 = None
        self.ioRecorder2 = None
        self.resetDefer = None
        self.errCountDefer = None
        self.action = None
        self.aqfstatus = 5
        
        self.redis_client = None
        self.connectRedis()

    def dataReceived(self, data):
        logger.debug(data)
        if data:
            data = data.strip()
        if data is None or data == '':
            return
        if len(data) == 1 and ord(data[0]) == 1:
            self.transport.write(data)
        else:
            d = json.loads(data.decode('gbk'))
            self.rtData = d[0]
            logger.info(self.rtData)
            self.action = self.rtData.get('action')
            try:
                self.EECheck()
            except Exception as e:
                lmsg = ('服务器发生未知错误：{}').format(e)
                logger.error(lmsg)

        return

    def connectionMade(self):
        self.remote_ip = self.transport.getPeer().host
        self.remote_port = self.transport.getPeer().port
        lmsg = (u'{}机房门禁程序连接成功--[{}:{}]').format(self.roomname, self.remote_ip, self.remote_port)
        logger.info(lmsg)
        self.factory.addChannel(self)
        if self.factory.getChannelNumbers() > 10:
            for ch in self.factory.__class__.CHANNELS:
                ch.transport.loseConnection()
                lmsg = (u'程序主动断开与{}机房门禁程序的连接--[{}:{}]').format(self.roomname, self.remote_ip, self.remote_port)
                logger.warning(lmsg)

    def connectionLost(self, reason):
        self.factory.removeChannel(self)
        self.channel = None
        lmsg = (u'{}机房门禁程序断开连接--[{}:{}]').format(self.roomname, self.remote_ip, self.remote_port)
        logger.warning(lmsg)
        return
    
    def connectRedis(self):
        try:
            self.redis_client = redis.Redis(host='localhost', port=6379,db=0)
            self.redis_client.ping()
            logger.info("连接Redis成功！")
        except Exception as e:
            logger.error("连接Redis失败！")

    def resetErrCount(self):
        self.errorCounts = 0
        if self.errCountDefer is not None:
            if self.errCountDefer.active():
                self.errCountDefer.cancel()
            self.errCountDefer = None
        return

    def resetInfo(self):
        logger.info((u'{}机房重置门禁验证状态').format(self.roomname))
        self.user1 = None
        self.user2 = None
        self.ioRecorder1 = None
        self.ioRecorder2 = None
        if self.resetDefer is not None:
            if self.resetDefer.active():
                self.resetDefer.cancel()
            self.resetDefer = None
        self.redis_client.hset(self.roomsign, 'ENTER_VERIFYING', 'NO')
        self.redis_client.hset(self.roomsign, 'EXIT_VERIFYING', 'NO')

    def EECheck(self):
        """ 进门 """
        self_id = self.rtData['id']
        user = None
        try:
            user = pgmodel.User.get(pgmodel.User.self_id == self_id)
        except Exception as e:
            logger.warn((u'{}用户不存在！').format(self.roomname))

        if not user:
            self.errorCounts += 1
            logger.error((u'{}机房未授权用户！{}').format(self.roomname, self.errorCounts))
            if self.errCountDefer is None:
                self.errCountDefer = reactor.callLater(30.0, self.resetErrCount)
            if self.errorCounts >= 6:
                lmsg = (u'{}机房未授权用户验证数次过多！').format(self.roomname)
                logger.warn(lmsg)
                globalobj.IO_ACQ_PROTOCOLS[self.roomsign].start_alarm(lmsg)
                self.resetErrCount()
                if self.resetDefer is not None:
                    if self.resetDefer.active():
                        self.resetDefer.cancel()
                    self.resetDefer = None
            return
        if self.returnCheck(user) == False:
            return
        else:
            if self.user1 is None:
                self.user1 = user
                self.resetDefer = reactor.callLater(config.config.fp_verify_interval, self.resetInfo)
            elif self.user2 is None:
                self.user2 = user
            if self.user1 is not None and self.user2 is not None:
                if self.user1.id != self.user2.id:
                    if self.resetDefer:
                        if self.resetDefer.active():
                            self.resetDefer.cancel()
                        self.resetDefer = None
                    if self.errCountDefer:
                        if self.errCountDefer.active():
                            self.errCountDefer.cancel()
                        self.errCountDefer = None
                    self.verify()
                else:
                    self.user2 = None
            return

    def returnCheck(self, user):
        """
           反潜回验证
        """
        last_state = user.last_state.strip()
        if self.action == 'Enter' and last_state != 'out':
            msg = (u'{}({}) 进入{}机房违反反潜规则。').format(user.name, user.self_id, self.roomname)
            logger.warning(msg)
            pgmodel.AlarmRecord.insert(desc=msg.encode('utf8'), record_time=tools.nowTime()).execute()
            return False
        if self.action == 'Exit' and last_state != 'in':
            msg = (u'{}({}) 出{}机房违反反潜规则。').format(user.name, user.self_id, self.roomname)
            logger.warning(msg)
            pgmodel.AlarmRecord.insert(desc=msg.encode('utf8'), record_time=tools.nowTime()).execute()
            return False
        return True

    def verify(self):
        if self.user1.group not in ('A', 'B') or self.user2.group not in ('A', 'B') or self.user1.group == self.user2.group:
            msg = (u'{}机房开门用户不是搭档或未分组，开门失败！').format(self.roomname)
            logger.error(msg)
            return
        else:
            logger.info((u'发送开门指令！-- {}机房').format(self.roomname))
            #globalobj.IO_ACQ_PROTOCOLS[self.roomsign].open_door(delayclosetime=10)
            ch = f"DOOR_CTRL:{self.roomsign}"
            self.redis_client.publish(ch, "OPEN")
            lastOpTime = tools.nowTime()
            lastState = None
            if self.action == 'Enter':
                self.redis_client.hset(self.roomsign, 'ENTER_VERIFYING', 'YES')
                self.redis_client.hset(self.roomsign, 'EXIT_VERIFYING', 'NO')
                lastState = 'in'
                self.aqfstatus = 1
            elif self.action == 'Exit':
                self.redis_client.hset(self.roomsign, 'ENTER_VERIFYING', 'NO')
                self.redis_client.hset(self.roomsign, 'EXIT_VERIFYING', 'YES')
                lastState = 'out'
                self.aqfstatus = 0
            else:
                return
            self.user1.last_state = lastState
            self.user1.last_op_time = lastOpTime
            self.user2.last_state = lastState
            self.user2.last_op_time = lastOpTime
            self.user1.save()
            self.user2.save()
            self.ioRecorder1 = pgmodel.OutInRecord(self_id=self.user1.self_id, name=self.user1.name, partner=self.user2.name, optype=lastState, isok=1, verify_mode=self.rtData['verifyMode'], record_time=lastOpTime)
            self.ioRecorder2 = pgmodel.OutInRecord(self_id=self.user2.self_id, name=self.user2.name, partner=self.user1.name, optype=lastState, isok=1, verify_mode=self.rtData['verifyMode'], record_time=lastOpTime)
            logger.debug(u'保存门禁操作记录！')
            self.ioRecorder1.save()
            self.ioRecorder2.save()
            globalobj.HW_STATUS[self.roomsign] = 0
            logger.info((u'{}s后检测人是否进出{}机房').format(config.config.alarm_delay_check_secs, self.roomname))
            reactor.callLater(config.config.alarm_delay_check_secs, self.IOCheck)
            return

    def IOCheck(self):
        """检测人是否进来或出去
        """
        msg = ''
        ok = True
        logger.info((u'机房红外状态({})：{}').format(self.action, globalobj.HW_STATUS[self.roomsign]))
        if self.action == 'Enter':
            if globalobj.HW_STATUS[self.roomsign] == 0:
                ok = False
                self.aqfstatus = -1
                msg = (u'{}和{}进入时候合法开门，人没进来{}机房！{}').format(self.ioRecorder1.name, self.ioRecorder1.partner, self.roomname, self.ioRecorder1.record_time)
            elif globalobj.DOOR_STATUS[self.roomsign] == 0:
                ok = False
                msg = (u'{}和{}进入{}机房关门超时！').format(self.ioRecorder1.name, self.ioRecorder1.partner, self.roomname)
        if self.action == 'Exit':
            if globalobj.HW_STATUS[self.roomsign] == 1:
                ok = False
                self.aqfstatus = -2
                msg = (u'{}和{}出去时候合法开门，有人非法滞留{}机房！{}').format(self.ioRecorder1.name, self.ioRecorder1.partner, self.roomname, self.ioRecorder1.record_time)
            elif globalobj.DOOR_STATUS[self.roomsign] == 0:
                ok = False
                msg = (u'{}和{}出{}机房关门超时！').format(self.ioRecorder1.name, self.ioRecorder1.partner, self.roomname)
        if ok == False:
            self.ioRecorder1.isok = 0
            self.ioRecorder1.save()
            self.ioRecorder2.isok = 0
            self.ioRecorder2.save()
            logger.warning(msg)
            pgmodel.AlarmRecord.insert(desc=msg, record_time=self.ioRecorder1.record_time).execute()
            #globalobj.IO_ACQ_PROTOCOLS[self.roomsign].start_alarm(msg)
            ch = f"ALARM:{self.roomsign}"
            self.redis_client.publish(ch, 'OPEN')
        globalobj.AQF_STATUS[self.roomsign] = self.aqfstatus
        aqfstatusobj = pgmodel.Aqf.get(pgmodel.Aqf.room_sign == self.roomsign)
        aqfstatusobj.status = self.aqfstatus
        aqfstatusobj.save()
        self.resetInfo()


class ACFactory(ServerFactory):
    """门禁采集服务端"""
    CHANNELS = []

    def __init__(self, roomsign, roomname):
        self.roomsign = roomsign
        self.roomname = roomname

    def buildProtocol(self, addr):
        return ACProtocol(self)

    def addChannel(self, channel):
        self.__class__.CHANNELS.append(channel)
        globalobj.AC_ACQ_CLIENTS.append(channel)

    def removeChannel(self, channel):
        if channel in self.__class__.CHANNELS:
            self.__class__.CHANNELS.remove(channel)
        if channel in globalobj.AC_ACQ_CLIENTS:
            globalobj.AC_ACQ_CLIENTS.remove(channel)

    def clearChannel(self):
        del self.__class__.CHANNELS[:]

    def getChannelNumbers(self):
        return len(self.__class__.CHANNELS)


def startACServer(port, roomsign, roomname):
    acFactory = ACFactory(roomsign, roomname)
    reactor.listenTCP(port, acFactory)
    logger.info((u'{}机房门禁采集服务开始运行！').format(roomname))


if __name__ == '__main__':
    startACServer()