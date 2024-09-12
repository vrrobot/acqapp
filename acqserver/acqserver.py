#!/usr/bin/python
# -*- coding: utf-8 -*-

from twisted.internet import reactor

from common import acqlog

logger = acqlog.createLogger("acqserver")

def main():

    logger.info("安全房管理系统开始运行！")
    reactor.run()
    logger.info("关闭安全房管理系统！")

if __name__ == "__main__":
    main()