#!/usr/bin/python
# -*- coding: utf-8 -*-

"""有人网络USR-IO模块
"""

import logging

from twisted.internet.protocol import Protocol
from twisted.internet.protocol import ServerFactory
from twisted.internet import reactor
from twisted.internet import task

import redis

from common import tools, acqlog


ACQ_INPUT_STATUS_CMD  = '\x11\x02\x00\x20\x00\x04\x7A\x93'  # 查询输入状态
ACQ_OUTPUT_STATUS_CMD = '\x11\x01\x00\x00\x00\x04\x3F\x59'  # 查询输出状态

OPEN_DOOR_CMD  = '\x11\x05\x00\x01\xFF\x00\xDF\x6A'  # 开门
CLOSE_DOOR_CMD = '\x11\x05\x00\x01\x00\x00\x9E\x9A'  # 关门

START_ALARM_CMD = '\x11\x05\x00\x00\xFF\x00\x8E\xAA'  # 开启报警器
END_ALARM_CMD   = '\x11\x05\x00\x00\x00\x00\xCF\x5A'  # 关闭报警器

logger = logging.get.Logger("acqserver.usrio")

class IOProtocol(Protocol):
    """USR-IO模块
    """
    DELAY_CMD_TIME = 0.2

    def __init__(self, factory):
        self.factory = factory
        self.roomname = factory.roomname
        self.roomsign = factory.roomsign
        self.channel = None
        self.loopAcqInputStatus = None
        self.loopInterval = 2

        self.redis_client = None
        self.connectRedis()

        self.hwstatus = 0  #红外状态，1为有人
        self.dmstatus = 1  #门磁状态，0为开门
        self.esstatus = 0  #紧急开关状态，1为异常
        self.fcstatus = 1  # 红外防拆状态，0为拆除

    def dataReceived(self, data):
        if data is None or data == '':
            return
        dLen = len(data)
        if dLen == 17:
            if ord(data[7]) == 0x42:
                data = data[6:]
        ndata = tools.a2n(data)
        sndata = ''
        for nd in ndata:
            sndata = sndata + '%02X' % nd + ' '
        lmsg = u"{}--IO模块 {}-{}收到数据：{}".format(self.roomname, self.remote_ip, 
                                                     self.remote_port, sndata)
        logger.info(lmsg)
        if not tools.isok_crc16(ndata):
            logger.error(u"%s机房-IO模块数据校验出错！"%self.roomname)
            return

        cmdType = ndata[1]

        # 输入状态
        # 主动上报输入状态       11 42 00 20 00 08 02 0A 00 ED 29
        if cmdType == 0x42 or cmdType == 0x2:
            nstatus = 0
            if cmdType == 0x42:
                nstatus = ndata[7]
            else:
                nstatus = ndata[3]

            self.hwstatus = nstatus & 0b1
            self.dmstatus = nstatus >> 1 & 0b1
            self.esstatus = nstatus >> 2 & 0b1
            self.fcstatus = nstatus >> 3 & 0b1

            if self.esstatus == 1:
                lmsg = "{}机房紧急开关被触动！".format(self.roomname)
                logger.warning(lmsg)
                self.start_alarm(lmsg)

            if self.fcstatus == 0:
                lmsg = "{}机房红外传感器被破坏！".format(self.roomname)
                logger.warning(lmsg)
                self.start_alarm(lmsg)

            self.redis_client.hset(self.roomsign, 'dmstatus', self.dmstatus)

        
        # 门禁不是处于正在验证的状态
        if globalobj.ENTER_VERIFYING[self.roomsign] == False and \
            globalobj.EXIT_VERIFYING[self.roomsign] == False:
            # 门已打开状态
            if self.dmstatus == 0:
                # 发送关门指令
                msg = u"{}机房门没关！".format(self.roomname)
                logger.warning(msg)

                # 如果报警还没启动
                lmsg = u"{}启动报警！".format(self.roomname)
                self.start_alarm(msg)
                
            # 红外检测到有人，但是安全房状态是不处于合法有人的状态
            if self.hwstatus == 1 and globalobj.AQF_STATUS[self.roomsign] != 1:
                msg = u"{}机房有非法人员！".format(self.roomname)
                logger.warn(msg)

                # 如果报警还没启动
                lmsg = u"{}启动报警！".format(self.roomname)
                self.start_alarm(msg)

    def connectionMade(self):
        self.remote_ip = self.transport.getPeer().host
        self.remote_port = self.transport.getPeer().port

        lmsg = u'%s-IO模块连接成功--[%s : %d]' % (self.roomname, self.remote_ip, self.remote_port)
        logger.info(lmsg)

        self.factory.addChannel(self)

        reactor.callLater(.5, self.close_sl_alarm)
        reactor.callLater(1.5, self.close_door)

        # 结束已有的循环，重新开始
        self.clearAcqInputStatusLoop()
        self.startAcqInputStatusLoop()

    def connectionLost(self, reason):
        self.factory.removeChannel(self)
        self.channel = None

        lmsg = u'%s-断开连接--[%s : %d]' % (self.roomname, self.remote_ip, self.remote_port)
        logger.warn(lmsg)

        self.clearAcqInputStatusLoop()

    def connectRedis(self):
        try:
            self.redis_client = redis.Redis(host='localhost', port=6379,db=0)
            self.redis_client.ping()
            logger.info("连接Redis成功！")
        except Exception as e:
            logger.error("连接Redis失败！")

    def stopAcqInputStatusLoop(self):
        """
           停止输入状态采集
        """
        logger.debug(u"停止输入IO采集")
    
        if self.loopAcqInputStatus is not None:
            if self.loopAcqInputStatus.running:
                self.loopAcqInputStatus.stop()

    def startAcqInputStatusLoop(self):
        """
           开始输入状态采集
        """
        if self.loopAcqInputStatus is not None:
            if not self.loopAcqInputStatus.running:
                self.loopAcqInputStatus.start(self.loopInterval, now=False)
        else:
            self.loopAcqInputStatus = task.LoopingCall(self.acq_input_status,)
            self.loopAcqInputStatus.start(self.loopInterval, now=False)
    
    def clearAcqInputStatusLoop(self):
        """
           清除已有的采集循环
        """
        if self.loopAcqInputStatus is not None:
            if self.loopAcqInputStatus.running:
                self.loopAcqInputStatus.stop()
            self.loopAcqInputStatus = None

    def open_sl_alarm(self):
        """ 
           开启声光报警 
        """
        self.stopAcqInputStatusLoop()
        self.delay_send_cmd(START_ALARM_CMD)
        self.startAcqInputStatusLoop()
        
    def close_sl_alarm(self):
        """ 
           关闭声光报警 
        """
        globalobj.CAN_ALARM[self.roomsign] = True
        self.stopAcqInputStatusLoop()
        self.delay_send_cmd(END_ALARM_CMD)
        self.startAcqInputStatusLoop()

    def start_alarm(self, msg=None):

        if globalobj.CAN_ALARM[self.roomsign] == False:
            return
        else:
            globalobj.CAN_ALARM[self.roomsign] = False

        mmsg = ''
        if msg is not None:
            nTime = tools.nowTime()
            mmsg = msg + "--" + nTime
            pgmodel.AlarmRecord.insert(desc=msg, record_time=nTime).execute()
            
            if config.config.is_active_smsalarm:
                logger.info(u"开始短信报警！")
                if len(globalobj.SMS_ALARM_SVR) > 0:
                    globalobj.SMS_ALARM_SVR[0].addSMS(mmsg)
            else:
                logger.warn(u"短信报警没有开启")

        if config.config.is_active_slalarm:
            logger.info(u"开启声光报警！")
            self.open_sl_alarm()
            if globalobj.IO_ACQ_PROTOCOLS['ALL'] is not None:
                globalobj.IO_ACQ_PROTOCOLS['ALL'].start_alarm()
        else:
            logger.warn(u"声光报警没有开启")
    
    def delay_send_cmd(self, cmd):
        logger.debug(u"发送指令")
        reactor.callLater(self.__class__.DELAY_CMD_TIME, self.transport.write, cmd)

    def open_door(self, delayclosetime=10):
        """
           开门
        """
        logger.info(u"开门--{}机房".format(self.roomname))
        self.stopAcqInputStatusLoop()
        self.delay_send_cmd(OPEN_DOOR_CMD)
        self.startAcqInputStatusLoop()

        # 开门后延时关门，类似点动控制
        if delayclosetime > 0:
            reactor.callLater(delayclosetime, self.close_door,)
    
    def close_door(self):
        """
           关门
        """
        logger.info(u"关门--{}机房".format(self.roomname))
        self.stopAcqInputStatusLoop()
        self.delay_send_cmd(CLOSE_DOOR_CMD)
        self.startAcqInputStatusLoop()

    def acq_input_status(self):
        """
           获取开关量输入状态
        """
        self.transport.write(ACQ_INPUT_STATUS_CMD)

class IOFactory(ServerFactory):
    """数据采集服务端"""
    CHANNELS = []

    def __init__(self, rs, rn):
        self.roomsign = rs
        self.roomname = rn

    def buildProtocol(self, addr):
        return IOProtocol(self)

    def addChannel(self, channel):
        self.__class__.CHANNELS.append(channel)
        globalobj.IO_ACQ_CLIENTS.append(channel)
        globalobj.IO_ACQ_PROTOCOLS[self.roomsign] = channel
    
    def removeChannel(self, channel):
        globalobj.IO_ACQ_PROTOCOLS[self.roomsign] = None

        if channel in self.__class__.CHANNELS:
            self.__class__.CHANNELS.remove(channel)
        
        if channel in globalobj.IO_ACQ_CLIENTS:
            globalobj.IO_ACQ_CLIENTS.remove(channel)
    
    def clearChannel(self):
        del self.__class__.CHANNELS[:]

#-----------------------------------------------------------------------------#

PORT = 9501
def startIOServer(port, roomsign, roomname):
    ioFactory = IOFactory(roomsign, roomname)
    reactor.listenTCP(port, ioFactory)
    logger.info("IO采集服务开始运行！-- {}机房".format(roomname))

if __name__ == "__main__":
    startIOServer()