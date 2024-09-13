#!/usr/bin/python
# -*- coding: utf-8 -*-

import os 
import sys
import logging
from logging.handlers import TimedRotatingFileHandler

from common import tools

isFrozen = getattr(sys, 'frozen', False)
currDir = tools.getFileDir()

def createLogger(name):
    logger = logging.getLogger(name)
    logger.setLevel(logging.DEBUG)
    pdir = os.path.abspath(currDir)
    pdir = os.path.abspath(os.path.join(pdir, os.pardir))
    logFile = pdir + "/acqserver/log/acqserver.log"

    fh = TimedRotatingFileHandler(logFile,
                                  when = 'midnight',
                                  backupCount = 30,
                                  encoding='utf-8',
                                  )
                        
    fmt = logging.Formatter('%(asctime)s %(name)s - %(levelname)s - %(message)s', 
                            '%Y-%m-%d %H:%M:%S')
    fh.setFormatter(fmt)
    fh.setLevel(logging.INFO)
    logger.addHandler(fh)

    if not isFrozen:
        ch = logging.StreamHandler()
        ch.setLevel(logging.DEBUG)
        cfmt = logging.Formatter('%(asctime)s %(name)s - %(levelname)s - %(message)s', 
                            '%Y-%m-%d %H:%M:%S')
        ch.setFormatter(cfmt)
        logger.addHandler(ch)
    else:
        ch = logging.StreamHandler()
        ch.setLevel(logging.INFO)
        cfmt = logging.Formatter('%(asctime)s %(name)s - %(levelname)s - %(message)s', 
                            '%Y-%m-%d %H:%M:%S')
        ch.setFormatter(cfmt)
        logger.addHandler(ch)
    
    return logger
