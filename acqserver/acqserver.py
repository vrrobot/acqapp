#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys

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

curdir = getFileDir()
curdir = os.path.abspath(curdir)
fdir = os.path.abspath(os.path.join(curdir, os.pardir))
sys.path.append(fdir)


from twisted.internet import reactor
from common import acqlog
from protocol import usrio, acprotocol

logger = acqlog.createLogger("acqserver")

def main():

    port = 9501
    roomsign = 'CA'
    roomname = 'CA'
    usrio.startIOServer(port, roomsign, roomname)
    port = 9801
    acprotocol.startACServer(port, roomsign, roomname)

    logger.info("安全房管理系统开始运行！")
    reactor.run()
    logger.info("关闭安全房管理系统！")

if __name__ == "__main__":
    main()