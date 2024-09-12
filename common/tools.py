#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import json
import time
import socket
import signal

import torndb
import psutil
#import psycopg2

MYSQL = False
POSTGRESQL = True

def killProcess(name):
    for p in psutil.process_iter():
        if p.name() == name:
            #pid = p.pid
            p.send_signal(signal.SIGTERM)

def getLocalIP():
    return socket.gethostbyname(socket.gethostname())

def getFileDir():
    filedir = None
    if getattr(sys, 'frozen', False):
        # The application is frozen
        filedir = os.path.dirname(sys.executable)
    else:
        # The application is not frozen
        # Change this bit to match where you store your data files:
        filedir = os.path.dirname(__file__)
    
    return filedir

def getFilePath(filename):
    return os.path.join(getFileDir(), filename)

def getDatabaseInfo():
    fileName = getFilePath("config.json")
    dbType = ""
    dbHost = ""
    dbPort = -1
    dbName = ""
    dbUser = ""
    dbPassword = ""
    with open(fileName, 'r') as configFile:
        configData = json.load(configFile)
        configObj = u2s(configData)
        dbType = configObj["database"]["dbtype"]
        dbHost = configObj["database"]["host"]
        dbPort = configObj["database"]["port"]
        dbName = configObj["database"]["name"]
        dbUser = configObj["database"]["user"]
        dbPassword = configObj["database"]["password"]
        return (dbType, dbHost, dbPort, dbName, dbUser, dbPassword)

def connectDatabase():
    dtype, host, dport, name, user, password = getDatabaseInfo()
    conn = None
    if MYSQL:
        dhost = "%s:%d" % (host, dport)
        conn = torndb.Connection(dhost, 
                                 name, 
                                 user=user, 
                                 password=password)
    
    if POSTGRESQL:
        #conn = psycopg2.connect(database=name, user=user, password=password)
        conn  = None
    return conn

    
def nowTime():
    return time.strftime("%Y-%m-%d %H:%M:%S")

def printHex(data):
    """
       打印16进制数据
       data 为str类型
    """
    if not data:
        return

    for i in range(len(data)):
        print('%02X' % ord(data[i]),)

    print

def hex2str(data):
    """
       二进制转成字符串
    """
    l = []
    for i in range(len(data)):
        l.append('%02X ' % ord(data[i]))
    return ''.join(l)


def u2s(data, coding='cp936'):
    """unicode => str"""
    if isinstance(data, dict):
        return { u2s(key): u2s(value) for key, value in data.iteritems() }
    elif isinstance(data, list):
        return [ u2s(elem) for elem in data ]
    elif isinstance(data, unicode):
        return data.encode(coding)
    else:
        return data

def s2u(s):
    if type(s) is str:
        s = s.encode('utf8')
    return s

def s2u_4B(s):
        """
        把字符串转为4位Unicode对应的码位
        比如：主机房1温度过高 -> 4E3B673A623F00316E295EA68FC79AD8
        """
        us = ''
        if type(s) is not unicode:
            us = s.decode('utf8')
        else:
            us = s
        usLen = len(us)
        
        rets = ''
        for i in range(usLen):
            rets += '%04X' % ord(us[i])
        
        return rets

#Modbus crc16校验码，返回List
def crc16(xList):
    """
       xList -> list()
    """
    a = 0xFFFF
    b = 0xA001
    for byte in xList:
        a = a^byte
        for i in range(8):
            last = a % 2
            a = a >> 1
            if last == 1:
                a = a ^ b
    aa = '0'*(6 - len(hex(a))) + hex(a)[2:]
    l, h = int(aa[:2], 16), int(aa[2:], 16)
    return [h, l]

def packCommand(listCommand):
    """
       listCommand = [0x01, 0x03, ...]
    """
    listCommand = listCommand + crc16(listCommand)
    strCommand = ''.join(chr(i) for i in listCommand)
    return strCommand

def a2n(data):
    """ascii转数字，输出list
    """
    
    return [ord(c) for c in data]

def isok_crc16(data):
    """判断list数据的crc16校验是否正确，返回bool
       data -> [0x01, 0x03, 0x00, 0x21, 0xA3,..., 0x81, 0xB9]
       data 长度不能小于2
       最后两位是校验码
    """
    if data is None or len(data) < 2:
        return False
    return crc16(data[:-2]) == data[-2:]


DBConn = [connectDatabase()]

def main():
    x = [0x01, 0x03, 0x00, 0x00, 0x00, 0x02]
    strcmd = packCommand(x)
    printHex(strcmd)


if __name__ == '__main__':
    main()