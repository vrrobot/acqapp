#!/usr/bin/python
# -*- coding: utf-8 -*-

import os 
import sys
import logging
from logging.handlers import TimedRotatingFileHandler


isFrozen = getattr(sys, 'frozen', False)
currDir = ''
if isFrozen:
    currDir = os.path.dirname(sys.executable)
else:
    currDir = os.path.dirname(__file__)

def createLogger(name):
    logger = logging.getLogger(name)
    logger.setLevel(logging.DEBUG)
    ldir = os.path.abspath(currDir)
    logFile = ldir + "/log/acqserver.log"

    fh = TimedRotatingFileHandler(logFile,
                                  when = 'midnight',
                                  backupCount = 30)
                        
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
