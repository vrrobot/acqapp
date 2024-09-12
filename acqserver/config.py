# -*- coding: utf-8 -*-

import os
import sys

import logging

def getCurrentDir():
    fdir = ''
    if getattr(sys, 'frozen', False):
        fdir = os.path.dirname(sys.executable)
    else:
        fdir = os.path.dirname(__file__)
    return fdir

currDir = getCurrentDir()
pdir = os.path.abspath(os.path.join(currDir, '../common'))
sys.path.append(pdir)

import tools
import pgmodel as db

#----------------------------------------------------------------------------#

class Config:

    def __init__(self, db):
        self.db = db
        self.acq_server_port = 9001
        self.alarm_delay_time = 0
        self.send_data_interval = 1
        self.value_save_counts = 100
        self.sms_center_number = ''    # 短信中心号码
        self.alarm_phone_numbers = []  # 短信告警号码
        self.sms_server_port = 9003
        self.alarm_server_port = 9005
        self.door_modules = []
        self.rt_send_port = 9007
        self.sms_center_ip = ""
        self.sms_center_port = 8901
        self.sl_alarm_client_ip = ""  # shengguangbaojing
        self.sl_alarm_client_port = 18001 

        self.sl_alarm_seconds = 300  #

        self.out_ac_ip = ""
        self.out_ac_port = 4370
        self.in_ac_ip = ""
        self.in_ac_port = 4370

        self.fp_verify_interval = 30 #10s
        self.aqf_status = 0
        self.alarm_seconds = 300
        self.alarm_delay_check_secs = 30
        self.reset_alarm_interval = 30
        self.is_active_slalarm = True
        self.is_active_smsalarm = True
        
        
        self.init()
        self.initDoor()
        #self.initAC()

    def init(self):
        sql = "SELECT value FROM sys_set WHERE name=\'acq_server_port\'"
        self.acq_server_port = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'alarm_delay_time\'"
        self.alarm_delay_time = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'fp_verify_interval\'"
        self.fp_verify_interval = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'aqf_status\'"
        self.aqf_status = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'send_data_interval\'"
        self.send_data_interval = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'centerNumber\'"
        self.sms_center_number = self.db.get(sql).value.encode('gbk')

        sql = "SELECT value FROM sys_set WHERE name=\'saveCount\'"
        self.value_save_counts = int(self.db.get(sql).value)

        sql = "SELECT number FROM alarm_phone WHERE is_recv=1"
        pns = self.db.query(sql)
        for pn in pns:
            self.alarm_phone_numbers.append(pn.number.encode('gbk'))

        sql = "SELECT value FROM sys_set WHERE name=\'sms_server_port\'"
        self.sms_server_port = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'rt_send_port\'"
        self.rt_send_port = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'alarm_server_port\'"
        self.alarm_server_port = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'sms_center_ip\'"
        self.sms_center_ip = str(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'sms_center_port\'"
        self.sms_center_port = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'sl_alarm_client_ip\'"
        self.sl_alarm_client_ip = str(self.db.get(sql).value)
        sql = "SELECT value FROM sys_set WHERE name=\'sl_alarm_client_port\'"
        self.sl_alarm_client_port = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'sl_alarm_seconds\'"
        self.sl_alarm_seconds = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'alarm_delay_check_secs\'"
        self.alarm_delay_check_secs = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'reset_alarm_interval\'"
        self.reset_alarm_interval = int(self.db.get(sql).value)

        sql = "SELECT value FROM sys_set WHERE name=\'is_active_slalarm\'"
        self.is_active_slalarm = bool(int(self.db.get(sql).value))

        sql = "SELECT value FROM sys_set WHERE name=\'is_active_smsalarm\'"
        self.is_active_smsalarm = bool(int(self.db.get(sql).value))

    def initDoor(self):
        sql = "SELECT * FROM module_door"
        self.door_modules = tools.u2s(self.db.query(sql))

    def initAC(self):
        sql = "SELECT * FROM access_control WHERE name=\'门外\'"
        self.out_ac_ip = str(self.db.get(sql).ip)
        self.out_ac_port = (self.db.get(sql).port)

        sql = "SELECT * FROM access_control WHERE name=\'门内\'"
        self.in_ac_ip = str(self.db.get(sql).ip)
        self.in_ac_port = (self.db.get(sql).port)

#config = Config(tools.DBConn[0])
config = Config(db)
