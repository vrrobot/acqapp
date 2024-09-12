#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys
sys.path.append(r"d:\dciotai\acqapp")

from twisted.internet import reactor

from common import acqlog

logger = acqlog.createLogger("acqserver")

from protocol import usrio, acprotocol

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