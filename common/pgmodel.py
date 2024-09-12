#!/usr/bin/env python
# -*- coding: utf-8 -*-

from common import tools
from peewee import *

dbType, dbHost, dbPort, dbName, dbUser, dbPassword = tools.getDatabaseInfo()

# db = PostgresqlDatabase('aqfsm', **{'password': 'DCadmin@123', 'user': 'aqfadmin'})

db = PostgresqlDatabase(dbName, user=dbUser, password=dbPassword, host=dbHost, port=dbPort)

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = db

class AccessControl(BaseModel):
    id = IntegerField(primary_key=True)
    ip = CharField(null=True)
    name = CharField()
    port = IntegerField(null=True)
    remarks = CharField(null=True)

    class Meta:
        table_name = 'access_control'

class AlarmEvent(BaseModel):
    address = CharField(null=True)
    confirm = IntegerField(null=True)
    confirm_time = DateTimeField(null=True)
    content = CharField(null=True)
    event_type = CharField(null=True)
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('alarm_event_id_seq'::regclass)")])
    level = IntegerField(null=True)
    point_id = IntegerField()
    record_time = DateTimeField(null=True)
    value = CharField(null=True)

    class Meta:
        table_name = 'alarm_event'

class AlarmLevel(BaseModel):
    color = CharField(null=True)
    id = IntegerField()
    level = IntegerField()
    name = CharField()

    class Meta:
        table_name = 'alarm_level'
        primary_key = False

class AlarmPhone(BaseModel):
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('alarm_phone_id_seq'::regclass)")])
    is_recv = SmallIntegerField(null=True)
    name = CharField(null=True)
    number = CharField(null=True)
    remarks = CharField(null=True)

    class Meta:
        table_name = 'alarm_phone'

class AlarmPhoneNumber(BaseModel):
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('alarm_phone_number_id_seq'::regclass)")])
    is_accept = IntegerField()
    phone_number = CharField()
    user = CharField(null=True)

    class Meta:
        table_name = 'alarm_phone_number'

class AlarmRecord(BaseModel):
    desc = CharField()
    id = BigIntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('alarm_record_id_seq'::regclass)")])
    record_time = DateTimeField()

    class Meta:
        table_name = 'alarm_record'

class Analog(BaseModel):
    high_content = CharField(null=True)
    high_limit = FloatField(null=True)
    high_range = FloatField(null=True)
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('analog_id_seq'::regclass)")])
    low_content = CharField(null=True)
    low_limit = FloatField(null=True)
    low_range = FloatField(null=True)
    point_id = IntegerField(null=True)

    class Meta:
        table_name = 'analog'

class AnalogV(BaseModel):
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('analog_v_id_seq'::regclass)")])
    point_id = IntegerField(null=True)
    record_time = DateTimeField(null=True)
    status = IntegerField(null=True)
    value = FloatField(null=True)

    class Meta:
        table_name = 'analog_v'

class Aqf(BaseModel):
    id = IntegerField(primary_key=True)
    status = IntegerField()
    room_sign = CharField()
    name = CharField(null=True)

    class Meta:
        table_name = 'aqf'

class Basepoint(BaseModel):
    high_content = CharField(null=True)
    high_limit = FloatField(null=True)
    id = IntegerField(primary_key=True)
    limit = IntegerField(null=True)
    limit_content = CharField(null=True)
    low_content = CharField(null=True)
    low_limit = FloatField(null=True)
    name = CharField()
    type = CharField()
    unit = CharField(null=True)

    class Meta:
        table_name = 'basepoint'

class CardInfo(BaseModel):
    id = IntegerField()

    class Meta:
        table_name = 'card_info'
        primary_key = False

class Channel(BaseModel):
    cmd_interval = IntegerField()
    cycle = IntegerField()
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('channel_id_seq'::regclass)")])
    ip = CharField()
    is_acq = SmallIntegerField(null=True)
    port = IntegerField()
    station_id = IntegerField()

    class Meta:
        table_name = 'channel'

class DeviceInfo(BaseModel):
    id = IntegerField(primary_key=True)
    is_running = SmallIntegerField(null=True)
    location = CharField(null=True)
    model = CharField()
    name = CharField()
    production_date = DateField(null=True)
    remarks = CharField(null=True)
    service_life = CharField(null=True)
    use_date = DateField(null=True)

    class Meta:
        table_name = 'device_info'

class Digit(BaseModel):
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('digit_id_seq'::regclass)")])
    limit_content = CharField(null=True)
    limit_value = IntegerField(null=True)
    point_id = IntegerField(null=True)

    class Meta:
        table_name = 'digit'

class DigitV(BaseModel):
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('digit_v_id_seq'::regclass)")])
    point_id = IntegerField(null=True)
    record_time = DateTimeField(null=True)
    status = IntegerField(null=True)
    value = IntegerField(null=True)

    class Meta:
        table_name = 'digit_v'

class Display(BaseModel):
    block = CharField(null=True)
    id = IntegerField(primary_key=True)

    class Meta:
        table_name = 'display'

class DoorController(BaseModel):
    id = IntegerField(primary_key=True)
    ip = CharField()
    name = CharField(null=True)
    port = IntegerField()
    remark = CharField(null=True)
    sn = CharField(null=True)
    station_id = IntegerField(null=True)

    class Meta:
        table_name = 'door_controller'

class DoorOp(BaseModel):
    card_id = CharField(null=True)
    door_name = CharField(null=True)
    id = BigIntegerField(primary_key=True)
    op = CharField(null=True)
    op_time = DateTimeField(null=True)
    people = CharField(null=True)

    class Meta:
        table_name = 'door_op'

class Module(BaseModel):
    addr = IntegerField(null=True)
    channel_id = IntegerField(null=True)
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('module_id_seq'::regclass)")])
    is_acq = IntegerField(null=True)
    name = CharField(null=True)
    pwd = CharField(null=True)
    remarks = CharField(null=True)
    sign = CharField(null=True)
    type = CharField(null=True)

    class Meta:
        table_name = 'module'

class ModuleDoor(BaseModel):
    id = IntegerField(primary_key=True)
    ip = CharField(null=True)
    name = CharField(null=True)
    port = IntegerField(null=True)
    sn = CharField(null=True)

    class Meta:
        table_name = 'module_door'

class ModuleEvent(BaseModel):
    event = CharField(null=True)
    id = BigIntegerField(primary_key=True)
    level = IntegerField(null=True)
    module_id = IntegerField(null=True)
    record_time = DateTimeField(null=True)

    class Meta:
        table_name = 'module_event'

class ModuleType(BaseModel):
    brand = CharField(null=True)
    id = IntegerField(primary_key=True)
    model = CharField(null=True)
    name = CharField()
    sign = CharField(null=True)

    class Meta:
        table_name = 'module_type'

class OpLog(BaseModel):
    content = CharField(null=True)
    id = BigIntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('op_log_id_seq'::regclass)")])
    record_time = DateTimeField(null=True)
    user_id = IntegerField(null=True)

    class Meta:
        table_name = 'op_log'

class OutInRecord(BaseModel):
    id = BigIntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('out_in_record_id_seq'::regclass)")])
    isok = SmallIntegerField()
    name = CharField()
    optype = CharField()
    partner = CharField()
    record_time = DateTimeField()
    self_id = BigIntegerField()
    verify_mode = CharField(null=True)

    class Meta:
        table_name = 'out_in_record'

class Point(BaseModel):
    alarm_level = IntegerField(null=True)
    channel = CharField(null=True)
    delay_alarm_time = FloatField(null=True)
    display_block = CharField(null=True)
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('point_id_seq'::regclass)")])
    is_alarm = IntegerField(null=True)
    is_display = IntegerField(null=True)
    module_id = IntegerField()
    name = CharField(null=True)
    type = CharField(null=True)
    type_name = CharField(null=True)
    type_sign = CharField(null=True)
    unit = CharField(null=True)
    val_tablename = CharField()

    class Meta:
        table_name = 'point'
        # primary_key = False

class PointType(BaseModel):
    high_content = CharField(null=True)
    high_limit = FloatField(null=True)
    id = IntegerField(primary_key=True)
    limit_content = CharField(null=True)
    limit_value = IntegerField(null=True)
    low_content = CharField(null=True)
    low_limit = FloatField(null=True)
    name = CharField()
    sign = CharField(null=True)
    unit = CharField(null=True)
    value_type_name = CharField(null=True)

    class Meta:
        table_name = 'point_type'

class Room(BaseModel):
    id = IntegerField(primary_key=True)
    name = CharField(null=True)
    station_id = IntegerField(null=True)

    class Meta:
        table_name = 'room'

class Station(BaseModel):
    address = CharField(null=True)
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('station_id_seq'::regclass)")])
    ip = CharField(null=True)
    is_acq = SmallIntegerField(null=True)
    name = CharField(null=True)
    remarks = CharField(null=True)
    type = CharField(null=True)

    class Meta:
        table_name = 'station'

class StationDisplay(BaseModel):
    display_id = IntegerField()
    id = IntegerField(primary_key=True, constraints=[SQL("DEFAULT nextval('station_display_id_seq'::regclass)")])
    name = CharField()
    parent_id = IntegerField()
    self_id = IntegerField(null=True)
    type = CharField(null=True)

    class Meta:
        table_name = 'station_display'

class StationSet(BaseModel):
    id = IntegerField()

    class Meta:
        table_name = 'station_set'
        primary_key = False

class SysEvent(BaseModel):
    id = BigIntegerField(primary_key=True)
    sys_event = CharField(null=True)

    class Meta:
        table_name = 'sys_event'

class SysSet(BaseModel):
    id = IntegerField(primary_key=True)
    name = CharField(null=True)
    value = CharField(null=True)

    class Meta:
        table_name = 'sys_set'

class SystemLog(BaseModel):
    content = CharField(null=True)
    id = BigIntegerField(primary_key=True)
    level = IntegerField()
    record_time = DateTimeField(null=True)
    systype = CharField()

    class Meta:
        table_name = 'system_log'

class User(BaseModel):
    department = CharField(null=True)
    group = CharField(null=True)
    is_active = SmallIntegerField()
    last_op_time = DateTimeField()
    last_state = CharField()
    name = CharField()
    partner = CharField(null=True)
    partner_id = IntegerField(null=True)
    password = CharField()
    phone_number = CharField(null=True)
    post = CharField(null=True)
    privileges = IntegerField()
    remarks = CharField(null=True)
    self_id = BigIntegerField()

    class Meta:
        table_name = 'user'

class VerificationRecord(BaseModel):
    id = BigAutoField(primary_key=True)
    name = CharField(null=True)
    optype = IntegerField()
    record_time = DateTimeField(null=True)
    self_id = BigIntegerField()
    verify_mode = CharField(null=True)

    class Meta:
        table_name = 'verification_record'

class VerificationLog(BaseModel):
    id = BigAutoField(primary_key=True)
    self_id = CharField(null=True)
    verify_mode = IntegerField()
    record_time = DateTimeField(null=True)
    room = CharField(null=True)

    class Meta:
        table_name = 'verification_log'
    
class TimeSyncOp(BaseModel):
    id = BigAutoField(primary_key=True)
    desc = CharField(null=True)
    sync_time = DateTimeField(null=True)
    record_time = DateTimeField(null=True)
    people = CharField(null=True)

    class Meta:
        table_name = 'time_sync_op'

class SmsSendLog(BaseModel):
    id = BigAutoField(primary_key=True)
    desc = CharField(null=True)
    sms_content = CharField(null=True)
    is_success = BooleanField(null=True)
    record_time = DateTimeField(null=True)

    class Meta:
        table_name = 'sms_send_log'

class ValA1(BaseModel):
    record_time = DateTimeField()
    val = FloatField()
    status = IntegerField()

    class Meta:
        table_name = 'val_a1'

class ValA2(BaseModel):
    record_time = DateTimeField()
    val = FloatField()
    status = IntegerField()

    class Meta:
        table_name = 'val_a2'

import tornado.util
def row_to_dict(row, cur):
    d = {}
    d = tornado.util.ObjectDict()
    for val, desc in zip(row, cur.description):
        d[desc.name] = val
    return d

def query(sql):
    cur = db.execute_sql(sql)
    return [row_to_dict(row, cur) for row in cur.fetchall()]

def queryone(sql):
    results = query(sql)
    if len(results) == 0:
        raise ValueError("Has no result!")
    elif len(results) > 1:
        raise ValueError("Expected 1 result, got %d" % len(results))
    return results[0]

def get(sql):
    results = query(sql)
    if len(results) == 0:
        raise ValueError("Has no result!")
    elif len(results) > 1:
        raise ValueError("Expected 1 result, got %d" % len(results))
    return results[0]

def execute(sql):
    cur = db.execute_sql(sql)

def insert(sql):
    cur = db.execute_sql(sql)
    return db.last_insert_id(cur)


if __name__ == '__main__':
	pass
    

