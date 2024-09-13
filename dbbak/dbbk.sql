--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_control; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.access_control (
    id integer NOT NULL,
    ip character varying(255),
    name character varying(255) NOT NULL,
    port integer,
    remarks character varying(255),
    sm character varying(255),
    ss character varying(255)
);


ALTER TABLE public.access_control OWNER TO aqfadmin;

--
-- Name: alarm_event; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.alarm_event (
    id integer NOT NULL,
    address character varying(255),
    confirm integer,
    confirm_time timestamp without time zone,
    content character varying(255),
    event_type character varying(255),
    level integer,
    point_id integer NOT NULL,
    record_time timestamp without time zone,
    value character varying(255)
);


ALTER TABLE public.alarm_event OWNER TO aqfadmin;

--
-- Name: alarm_event_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.alarm_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alarm_event_id_seq OWNER TO aqfadmin;

--
-- Name: alarm_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.alarm_event_id_seq OWNED BY public.alarm_event.id;


--
-- Name: alarm_level; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.alarm_level (
    color character varying(255),
    id integer NOT NULL,
    level integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.alarm_level OWNER TO aqfadmin;

--
-- Name: alarm_phone; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.alarm_phone (
    id integer NOT NULL,
    is_recv smallint,
    name character varying(255),
    number character varying(255),
    remarks character varying(255)
);


ALTER TABLE public.alarm_phone OWNER TO aqfadmin;

--
-- Name: alarm_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.alarm_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alarm_phone_id_seq OWNER TO aqfadmin;

--
-- Name: alarm_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.alarm_phone_id_seq OWNED BY public.alarm_phone.id;


--
-- Name: alarm_phone_number; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.alarm_phone_number (
    id integer NOT NULL,
    is_accept integer NOT NULL,
    phone_number character varying(255) NOT NULL,
    "user" character varying(255)
);


ALTER TABLE public.alarm_phone_number OWNER TO aqfadmin;

--
-- Name: alarm_phone_number_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.alarm_phone_number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alarm_phone_number_id_seq OWNER TO aqfadmin;

--
-- Name: alarm_phone_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.alarm_phone_number_id_seq OWNED BY public.alarm_phone_number.id;


--
-- Name: alarm_record; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.alarm_record (
    id bigint NOT NULL,
    "desc" character varying(255) NOT NULL,
    record_time timestamp without time zone NOT NULL
);


ALTER TABLE public.alarm_record OWNER TO aqfadmin;

--
-- Name: alarm_record_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.alarm_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alarm_record_id_seq OWNER TO aqfadmin;

--
-- Name: alarm_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.alarm_record_id_seq OWNED BY public.alarm_record.id;


--
-- Name: analog; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.analog (
    id integer NOT NULL,
    high_content character varying(255),
    high_limit real,
    high_range real,
    low_content character varying(255),
    low_limit real,
    low_range real,
    point_id integer
);


ALTER TABLE public.analog OWNER TO aqfadmin;

--
-- Name: analog_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.analog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analog_id_seq OWNER TO aqfadmin;

--
-- Name: analog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.analog_id_seq OWNED BY public.analog.id;


--
-- Name: analog_v; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.analog_v (
    id integer NOT NULL,
    point_id integer,
    record_time timestamp without time zone,
    status integer,
    value real
);


ALTER TABLE public.analog_v OWNER TO aqfadmin;

--
-- Name: analog_v_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.analog_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analog_v_id_seq OWNER TO aqfadmin;

--
-- Name: analog_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.analog_v_id_seq OWNED BY public.analog_v.id;


--
-- Name: aqf; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.aqf (
    id integer NOT NULL,
    name character varying(255),
    room_sign character varying(255) NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.aqf OWNER TO aqfadmin;

--
-- Name: basepoint; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.basepoint (
    high_content character varying(255),
    high_limit real,
    id integer NOT NULL,
    "limit" integer,
    limit_content character varying(255),
    low_content character varying(255),
    low_limit real,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    unit character varying(255)
);


ALTER TABLE public.basepoint OWNER TO aqfadmin;

--
-- Name: card_info; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.card_info (
    id integer NOT NULL
);


ALTER TABLE public.card_info OWNER TO aqfadmin;

--
-- Name: channel; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.channel (
    id integer NOT NULL,
    cmd_interval integer NOT NULL,
    cycle integer NOT NULL,
    ip character varying(255) NOT NULL,
    is_acq smallint,
    port integer NOT NULL,
    station_id integer NOT NULL
);


ALTER TABLE public.channel OWNER TO aqfadmin;

--
-- Name: channel_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_id_seq OWNER TO aqfadmin;

--
-- Name: channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.channel_id_seq OWNED BY public.channel.id;


--
-- Name: device_info; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.device_info (
    id integer NOT NULL,
    is_running smallint,
    location character varying(255),
    model character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    production_date date,
    remarks character varying(255),
    service_life character varying(255),
    use_date date
);


ALTER TABLE public.device_info OWNER TO aqfadmin;

--
-- Name: digit; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.digit (
    id integer NOT NULL,
    limit_content character varying(255),
    limit_value integer,
    point_id integer
);


ALTER TABLE public.digit OWNER TO aqfadmin;

--
-- Name: digit_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.digit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.digit_id_seq OWNER TO aqfadmin;

--
-- Name: digit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.digit_id_seq OWNED BY public.digit.id;


--
-- Name: digit_v; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.digit_v (
    id integer NOT NULL,
    point_id integer,
    record_time timestamp without time zone,
    status integer,
    value integer
);


ALTER TABLE public.digit_v OWNER TO aqfadmin;

--
-- Name: digit_v_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.digit_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.digit_v_id_seq OWNER TO aqfadmin;

--
-- Name: digit_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.digit_v_id_seq OWNED BY public.digit_v.id;


--
-- Name: display; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.display (
    block character varying(255),
    id integer NOT NULL
);


ALTER TABLE public.display OWNER TO aqfadmin;

--
-- Name: door_controller; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.door_controller (
    id integer NOT NULL,
    ip character varying(255) NOT NULL,
    name character varying(255),
    port integer NOT NULL,
    remark character varying(255),
    sn character varying(255),
    station_id integer
);


ALTER TABLE public.door_controller OWNER TO aqfadmin;

--
-- Name: door_op; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.door_op (
    card_id character varying(255),
    door_name character varying(255),
    id bigint NOT NULL,
    op character varying(255),
    op_time timestamp without time zone,
    people character varying(255)
);


ALTER TABLE public.door_op OWNER TO aqfadmin;

--
-- Name: module; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.module (
    id integer NOT NULL,
    addr integer,
    channel_id integer,
    is_acq integer,
    name character varying(255),
    pwd character varying(255),
    remarks character varying(255),
    sign character varying(255),
    type character varying(255)
);


ALTER TABLE public.module OWNER TO aqfadmin;

--
-- Name: module_door; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.module_door (
    id integer NOT NULL,
    ip character varying(255),
    name character varying(255),
    port integer,
    sn character varying(255)
);


ALTER TABLE public.module_door OWNER TO aqfadmin;

--
-- Name: module_event; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.module_event (
    event character varying(255),
    id bigint NOT NULL,
    level integer,
    module_id integer,
    record_time timestamp without time zone
);


ALTER TABLE public.module_event OWNER TO aqfadmin;

--
-- Name: module_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_id_seq OWNER TO aqfadmin;

--
-- Name: module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.module_id_seq OWNED BY public.module.id;


--
-- Name: module_type; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.module_type (
    brand character varying(255),
    id integer NOT NULL,
    model character varying(255),
    name character varying(255) NOT NULL,
    sign character varying(255)
);


ALTER TABLE public.module_type OWNER TO aqfadmin;

--
-- Name: op_log; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.op_log (
    id bigint NOT NULL,
    content character varying(255),
    record_time timestamp without time zone,
    user_id integer
);


ALTER TABLE public.op_log OWNER TO aqfadmin;

--
-- Name: op_log_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.op_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.op_log_id_seq OWNER TO aqfadmin;

--
-- Name: op_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.op_log_id_seq OWNED BY public.op_log.id;


--
-- Name: out_in_record; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.out_in_record (
    id bigint NOT NULL,
    isok smallint NOT NULL,
    name character varying(255) NOT NULL,
    optype character varying(255) NOT NULL,
    partner character varying(255) NOT NULL,
    record_time timestamp without time zone NOT NULL,
    self_id bigint NOT NULL,
    verify_mode character varying(255)
);


ALTER TABLE public.out_in_record OWNER TO aqfadmin;

--
-- Name: out_in_record_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.out_in_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.out_in_record_id_seq OWNER TO aqfadmin;

--
-- Name: out_in_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.out_in_record_id_seq OWNED BY public.out_in_record.id;


--
-- Name: point; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.point (
    id integer NOT NULL,
    alarm_level integer,
    channel character varying(255),
    delay_alarm_time real,
    display_block character varying(255),
    is_alarm integer,
    is_display integer,
    module_id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    type_name character varying(255),
    type_sign character varying(255),
    unit character varying(255),
    val_tablename character varying(255) NOT NULL
);


ALTER TABLE public.point OWNER TO aqfadmin;

--
-- Name: point_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.point_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.point_id_seq OWNER TO aqfadmin;

--
-- Name: point_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.point_id_seq OWNED BY public.point.id;


--
-- Name: point_type; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.point_type (
    high_content character varying(255),
    high_limit real,
    id integer NOT NULL,
    limit_content character varying(255),
    limit_value integer,
    low_content character varying(255),
    low_limit real,
    name character varying(255) NOT NULL,
    sign character varying(255),
    unit character varying(255),
    value_type_name character varying(255)
);


ALTER TABLE public.point_type OWNER TO aqfadmin;

--
-- Name: room; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.room (
    id integer NOT NULL,
    name character varying(255),
    station_id integer
);


ALTER TABLE public.room OWNER TO aqfadmin;

--
-- Name: station; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.station (
    id integer NOT NULL,
    address character varying(255),
    ip character varying(255),
    is_acq smallint,
    name character varying(255),
    remarks character varying(255),
    type character varying(255)
);


ALTER TABLE public.station OWNER TO aqfadmin;

--
-- Name: station_display; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.station_display (
    id integer NOT NULL,
    display_id integer NOT NULL,
    name character varying(255) NOT NULL,
    parent_id integer NOT NULL,
    self_id integer,
    type character varying(255)
);


ALTER TABLE public.station_display OWNER TO aqfadmin;

--
-- Name: station_display_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.station_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.station_display_id_seq OWNER TO aqfadmin;

--
-- Name: station_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.station_display_id_seq OWNED BY public.station_display.id;


--
-- Name: station_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.station_id_seq OWNER TO aqfadmin;

--
-- Name: station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.station_id_seq OWNED BY public.station.id;


--
-- Name: station_set; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.station_set (
    id integer NOT NULL
);


ALTER TABLE public.station_set OWNER TO aqfadmin;

--
-- Name: sys_event; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.sys_event (
    id bigint NOT NULL,
    sys_event character varying(255)
);


ALTER TABLE public.sys_event OWNER TO aqfadmin;

--
-- Name: sys_set; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.sys_set (
    id integer NOT NULL,
    name character varying(255),
    value character varying(255)
);


ALTER TABLE public.sys_set OWNER TO aqfadmin;

--
-- Name: time_sync_op; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.time_sync_op (
    id bigint NOT NULL,
    "desc" character varying(255),
    people character varying(255),
    record_time timestamp without time zone,
    sync_time timestamp without time zone
);


ALTER TABLE public.time_sync_op OWNER TO aqfadmin;

--
-- Name: time_sync_op_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.time_sync_op_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_sync_op_id_seq OWNER TO aqfadmin;

--
-- Name: time_sync_op_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.time_sync_op_id_seq OWNED BY public.time_sync_op.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    department character varying(255),
    "group" character varying(255),
    is_active smallint NOT NULL,
    last_op_time timestamp without time zone NOT NULL,
    last_state character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    partner character varying(255),
    partner_id integer,
    password character varying(255) NOT NULL,
    phone_number character varying(255),
    post character varying(255),
    privileges integer NOT NULL,
    remarks character varying(255),
    self_id bigint NOT NULL
);


ALTER TABLE public."user" OWNER TO aqfadmin;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO aqfadmin;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: verification_log; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.verification_log (
    id bigint NOT NULL,
    record_time timestamp without time zone,
    room character varying(255),
    self_id character varying(255),
    verify_mode integer
);


ALTER TABLE public.verification_log OWNER TO aqfadmin;

--
-- Name: verification_log_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.verification_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verification_log_id_seq OWNER TO aqfadmin;

--
-- Name: verification_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.verification_log_id_seq OWNED BY public.verification_log.id;


--
-- Name: verification_record; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.verification_record (
    id bigint NOT NULL,
    name character varying(255),
    optype integer NOT NULL,
    record_time timestamp without time zone,
    self_id bigint NOT NULL,
    verify_mode character varying(255)
);


ALTER TABLE public.verification_record OWNER TO aqfadmin;

--
-- Name: verification_record_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.verification_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verification_record_id_seq OWNER TO aqfadmin;

--
-- Name: verification_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.verification_record_id_seq OWNED BY public.verification_record.id;


--
-- Name: verify_mode; Type: TABLE; Schema: public; Owner: aqfadmin
--

CREATE TABLE public.verify_mode (
    id integer NOT NULL,
    name character varying(255),
    number integer,
    sign character varying(255)
);


ALTER TABLE public.verify_mode OWNER TO aqfadmin;

--
-- Name: verify_mode_id_seq; Type: SEQUENCE; Schema: public; Owner: aqfadmin
--

CREATE SEQUENCE public.verify_mode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verify_mode_id_seq OWNER TO aqfadmin;

--
-- Name: verify_mode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aqfadmin
--

ALTER SEQUENCE public.verify_mode_id_seq OWNED BY public.verify_mode.id;


--
-- Name: alarm_event id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.alarm_event ALTER COLUMN id SET DEFAULT nextval('public.alarm_event_id_seq'::regclass);


--
-- Name: alarm_phone id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.alarm_phone ALTER COLUMN id SET DEFAULT nextval('public.alarm_phone_id_seq'::regclass);


--
-- Name: alarm_phone_number id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.alarm_phone_number ALTER COLUMN id SET DEFAULT nextval('public.alarm_phone_number_id_seq'::regclass);


--
-- Name: alarm_record id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.alarm_record ALTER COLUMN id SET DEFAULT nextval('public.alarm_record_id_seq'::regclass);


--
-- Name: analog id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.analog ALTER COLUMN id SET DEFAULT nextval('public.analog_id_seq'::regclass);


--
-- Name: analog_v id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.analog_v ALTER COLUMN id SET DEFAULT nextval('public.analog_v_id_seq'::regclass);


--
-- Name: channel id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.channel ALTER COLUMN id SET DEFAULT nextval('public.channel_id_seq'::regclass);


--
-- Name: digit id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.digit ALTER COLUMN id SET DEFAULT nextval('public.digit_id_seq'::regclass);


--
-- Name: digit_v id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.digit_v ALTER COLUMN id SET DEFAULT nextval('public.digit_v_id_seq'::regclass);


--
-- Name: module id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.module ALTER COLUMN id SET DEFAULT nextval('public.module_id_seq'::regclass);


--
-- Name: op_log id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.op_log ALTER COLUMN id SET DEFAULT nextval('public.op_log_id_seq'::regclass);


--
-- Name: out_in_record id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.out_in_record ALTER COLUMN id SET DEFAULT nextval('public.out_in_record_id_seq'::regclass);


--
-- Name: point id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.point ALTER COLUMN id SET DEFAULT nextval('public.point_id_seq'::regclass);


--
-- Name: station id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.station ALTER COLUMN id SET DEFAULT nextval('public.station_id_seq'::regclass);


--
-- Name: station_display id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.station_display ALTER COLUMN id SET DEFAULT nextval('public.station_display_id_seq'::regclass);


--
-- Name: time_sync_op id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.time_sync_op ALTER COLUMN id SET DEFAULT nextval('public.time_sync_op_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: verification_log id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.verification_log ALTER COLUMN id SET DEFAULT nextval('public.verification_log_id_seq'::regclass);


--
-- Name: verification_record id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.verification_record ALTER COLUMN id SET DEFAULT nextval('public.verification_record_id_seq'::regclass);


--
-- Name: verify_mode id; Type: DEFAULT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.verify_mode ALTER COLUMN id SET DEFAULT nextval('public.verify_mode_id_seq'::regclass);


--
-- Data for Name: access_control; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.access_control (id, ip, name, port, remarks, sm, ss) FROM stdin;
1	192.168.1.12	CA机房外门禁	4370	\N	00:17:61:11:d1:52	AGHR192460312
2	192.168.1.13	CA机房内门禁	4370	\N	00:17:61:11:d1:4e	AGHR192460309
5	192.168.1.14	密钥机房外门禁	4370	\N	00:17:61:11:d1:2b	AGHR192460311
6	192.168.1.15	密钥机房内门禁	4370	\N	00:17:61:11:d1:21	AGHR192460310
3	192.168.1.21	信息机房外门禁	4370	\N	00:17:61:10:82:85	AGHR193460301
4	192.168.1.22	信息机房内门禁	4370	\N	00:17:61:10:81:db	AGHR193460332
\.


--
-- Data for Name: alarm_event; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.alarm_event (id, address, confirm, confirm_time, content, event_type, level, point_id, record_time, value) FROM stdin;
\.


--
-- Data for Name: alarm_level; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.alarm_level (color, id, level, name) FROM stdin;
\.


--
-- Data for Name: alarm_phone; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.alarm_phone (id, is_recv, name, number, remarks) FROM stdin;
2	1	侯辉标	13243767557	
6	1	liu	13480712537	
7	1	xiaozhe	15889447702	
1	0	pyz	13922707756	None
\.


--
-- Data for Name: alarm_phone_number; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.alarm_phone_number (id, is_accept, phone_number, "user") FROM stdin;
\.


--
-- Data for Name: alarm_record; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.alarm_record (id, "desc", record_time) FROM stdin;
2	者红鲜和侯辉标进入信息机房关门超时！	2023-02-08 15:43:42
3	者红鲜和侯辉标进入信息机房关门超时！	2023-02-08 15:44:02
4	者红鲜和侯辉标进入信息机房关门超时！	2023-02-16 14:55:06
5	者红鲜和侯辉标进入信息机房关门超时！	2023-02-16 14:55:26
6	侯辉标和者红鲜出信息机房关门超时！	2023-02-16 15:04:50
7	侯辉标(1001) 进入信息机房违反反潜规则。	2023-02-26 13:58:11
8	侯辉标(1001) 进入信息机房违反反潜规则。	2023-02-26 13:58:11
9	曾元首(1007) 进入密钥机房违反反潜规则。	2023-03-02 10:17:38
10	曾元首(1007) 进入密钥机房违反反潜规则。	2023-03-02 10:17:38
11	侯辉标(1001) 进入信息机房违反反潜规则。	2023-03-02 10:18:11
12	曾元首(1007) 出密钥机房违反反潜规则。	2023-03-02 11:42:13
13	密钥机房门没关！	2023-03-02 13:42:10
14	CA机房门没关！	2023-03-02 13:42:50
15	张高明(1003) 进入密钥机房违反反潜规则。	2023-03-06 09:17:25
16	曾元首(1007) 出密钥机房违反反潜规则。	2023-03-06 10:01:38
17	张高明和曾元首出去时候合法开门，有人非法滞留密钥机房！2023-03-06 10:01:38	2023-03-06 10:01:38
18	张高明和曾元首出去时候合法开门，有人非法滞留密钥机房！2023-03-06 10:01:38	2023-03-06 10:01:58
19	侯辉标(1001) 进入信息机房违反反潜规则。	2023-03-09 10:42:16
20	者红鲜(1002) 出信息机房违反反潜规则。	2023-03-09 10:53:30
21	者红鲜(1002) 进入信息机房违反反潜规则。	2023-03-10 15:21:51
22	信息机房门没关！	2023-03-13 15:48:50
23	信息机房门没关！	2023-03-13 15:54:41
24	者红鲜(1002) 进入信息机房违反反潜规则。	2023-03-13 15:57:48
25	侯辉标(1001) 出信息机房违反反潜规则。	2023-03-13 16:20:04
26	者红鲜(1002) 进入信息机房违反反潜规则。	2023-03-13 16:36:06
27	侯辉标(1001) 出信息机房违反反潜规则。	2023-03-13 16:54:35
28	者红鲜和侯辉标进入信息机房关门超时！	2023-03-14 10:47:09
29	者红鲜和侯辉标进入信息机房关门超时！	2023-03-14 10:47:29
30	侯辉标(1001) 出信息机房违反反潜规则。	2023-03-14 10:55:03
31	侯辉标(1001) 进入信息机房违反反潜规则。	2023-03-17 10:10:48
32	者红鲜(1002) 出信息机房违反反潜规则。	2023-03-17 10:22:27
33	侯辉标(1001) 进入信息机房违反反潜规则。	2023-03-22 09:31:41
34	者红鲜(1002) 进入信息机房违反反潜规则。	2023-03-24 09:47:01
35	侯辉标(1001) 出信息机房违反反潜规则。	2023-03-24 09:50:20
36	侯辉标(1001) 进入信息机房违反反潜规则。	2023-03-24 18:43:44
37	侯辉标(1001) 出信息机房违反反潜规则。	2023-03-24 18:50:01
38	密钥机房门没关！	2023-03-28 09:28:22
39	CA机房门没关！	2023-03-28 09:28:54
40	密钥机房门没关！	2023-03-28 13:54:10
41	CA机房门没关！	2023-03-28 13:54:27
42	侯辉标(1001) 出信息机房违反反潜规则。	2023-03-29 14:18:00
43	侯辉标(1001) 进入信息机房违反反潜规则。	2023-03-31 14:59:39
44	侯辉标(1001) 出信息机房违反反潜规则。	2023-03-31 15:03:38
45	者红鲜(1002) 进入信息机房违反反潜规则。	2023-04-04 14:31:23
46	者红鲜(1002) 出信息机房违反反潜规则。	2023-04-04 14:45:14
47	信息机房门没关！	2023-04-05 12:34:31
48	CA机房门没关！	2023-04-05 13:30:52
49	者红鲜和侯辉标出信息机房关门超时！	2023-04-07 09:33:54
50	者红鲜和侯辉标出信息机房关门超时！	2023-04-07 09:34:14
51	潘盛辉和张高明进入时候合法开门，人没进来信息机房！2023-04-17 15:35:00	2023-04-17 15:35:00
52	潘盛辉和张高明进入时候合法开门，人没进来信息机房！2023-04-17 15:35:00	2023-04-17 15:35:20
53	孙艳芳和尹涔出去时候合法开门，有人非法滞留CA机房！2023-04-18 09:38:15	2023-04-18 09:38:15
54	孙艳芳和尹涔出去时候合法开门，有人非法滞留CA机房！2023-04-18 09:38:15	2023-04-18 09:38:35
55	孙艳芳和尹涔出去时候合法开门，有人非法滞留CA机房！2023-04-18 10:24:21	2023-04-18 10:24:21
56	孙艳芳和尹涔出去时候合法开门，有人非法滞留CA机房！2023-04-18 10:24:21	2023-04-18 10:24:41
57	张高明(1003) 进入密钥机房违反反潜规则。	2023-04-18 11:09:08
58	张高明(1003) 进入密钥机房违反反潜规则。	2023-04-18 11:09:20
59	曾元首(1007) 进入密钥机房违反反潜规则。	2023-04-18 11:10:14
60	曾元首和张高明出密钥机房关门超时！	2023-04-18 11:16:25
61	曾元首和张高明出密钥机房关门超时！	2023-04-18 11:16:45
62	尹涔和孙艳芳出去时候合法开门，有人非法滞留CA机房！2023-04-18 14:46:25	2023-04-18 14:46:25
63	尹涔和孙艳芳出去时候合法开门，有人非法滞留CA机房！2023-04-18 14:46:25	2023-04-18 14:46:46
64	CA机房门没关！	2023-04-18 14:52:37
65	CA机房门没关！	2023-04-20 14:55:06
66	CA机房门没关！	2023-04-20 16:25:13
67	密钥机房门没关！	2023-04-26 16:30:50
68	密钥机房门没关！	2023-05-08 14:13:16
69	密钥机房门没关！	2023-05-08 14:37:29
70	密钥机房门没关！	2023-05-08 15:09:02
71	侯辉标和者红鲜出信息机房关门超时！	2023-05-16 10:05:56
72	侯辉标和者红鲜出信息机房关门超时！	2023-05-16 10:06:17
73	CA机房未授权用户验证数次过多！	2023-05-16 10:06:44
74	密钥机房未授权用户验证数次过多！	2023-05-16 10:07:23
75	CA机房门没关！	2023-05-16 15:58:35
76	CA机房门没关！	2023-05-16 16:24:30
77	密钥机房门没关！	2023-05-25 16:23:52
78	曾元首和张高明出去时候合法开门，有人非法滞留密钥机房！2023-05-29 11:18:59	2023-05-29 11:18:59
79	曾元首和张高明出去时候合法开门，有人非法滞留密钥机房！2023-05-29 11:18:59	2023-05-29 11:19:19
80	密钥机房未授权用户验证数次过多！	2023-05-29 14:21:41
81	CA机房未授权用户验证数次过多！	2023-05-29 14:23:32
82	者红鲜(1002) 进入信息机房违反反潜规则。	2023-05-29 14:27:00
83	密钥机房门没关！	2023-05-29 14:33:04
84	CA机房门没关！	2023-05-29 14:45:53
85	CA机房门没关！	2023-05-29 15:44:27
86	CA机房门没关！	2023-05-29 16:05:17
87	密钥机房门没关！	2023-05-30 08:42:15
88	CA机房门没关！	2023-05-30 08:42:39
89	密钥机房门没关！	2023-05-30 18:26:55
90	CA机房门没关！	2023-05-30 18:31:29
91	CA机房门没关！	2023-05-31 14:36:56
92	密钥机房门没关！	2023-05-31 14:37:56
93	CA机房门没关！	2023-05-31 16:45:28
94	密钥机房门没关！	2023-05-31 16:46:02
95	张高明(1003) 进入密钥机房违反反潜规则。	2023-06-01 17:25:19
96	曾元首(1007) 进入密钥机房违反反潜规则。	2023-06-01 17:25:21
97	曾元首(1007) 进入密钥机房违反反潜规则。	2023-06-01 17:25:30
98	张高明(1003) 进入密钥机房违反反潜规则。	2023-06-01 17:25:32
99	张高明(1003) 进入密钥机房违反反潜规则。	2023-06-01 17:25:38
100	曾元首(1007) 进入密钥机房违反反潜规则。	2023-06-01 17:25:40
101	张高明(1003) 进入密钥机房违反反潜规则。	2023-06-01 17:25:45
102	曾元首(1007) 进入密钥机房违反反潜规则。	2023-06-01 17:25:47
103	信息机房门没关！	2023-06-03 10:29:40
104	密钥机房门没关！	2023-06-03 10:35:05
105	信息机房门没关！	2023-06-03 11:20:33
106	密钥机房门没关！	2023-06-03 11:25:27
107	信息机房门没关！	2023-06-04 10:08:42
108	信息机房门没关！	2023-06-04 12:15:52
109	信息机房门没关！	2023-06-04 12:17:00
110	密钥机房门没关！	2023-06-06 15:56:23
111	密钥机房门没关！	2023-06-09 10:24:20
112	信息机房门没关！	2023-06-11 16:25:37
113	CA机房门没关！	2023-06-11 16:27:08
114	信息机房门没关！	2023-06-11 18:44:55
115	信息机房门没关！	2023-06-12 09:25:43
116	密钥机房门没关！	2023-06-12 10:25:27
117	密钥机房门没关！	2023-06-12 16:43:42
118	密钥机房门没关！	2023-06-16 13:50:18
119	信息机房门没关！	2023-06-20 09:00:07
120	信息机房门没关！	2023-06-25 17:32:47
121	信息机房门没关！	2023-06-28 14:02:19
122	信息机房门没关！	2023-07-10 19:18:33
123	密钥机房门没关！	2023-07-10 19:20:39
124	CA机房门没关！	2023-07-10 19:21:54
125	者红鲜(1002) 出信息机房违反反潜规则。	2023-07-11 09:44:34
126	CA机房门没关！	2023-07-24 10:14:39
127	信息机房门没关！	2023-07-28 10:21:05
128	信息机房门没关！	2023-07-28 10:22:33
129	密钥机房门没关！	2023-08-10 09:30:38
130	密钥机房门没关！	2023-08-17 14:09:25
131	CA机房门没关！	2023-08-17 14:15:59
132	侯辉标(1001) 进入信息机房违反反潜规则。	2023-09-11 13:39:32
133	者红鲜(1002) 进入信息机房违反反潜规则。	2023-09-11 13:39:34
134	侯辉标和者红鲜进入时候合法开门，人没进来信息机房！2023-09-11 13:39:21	2023-09-11 13:39:21
135	侯辉标和者红鲜进入时候合法开门，人没进来信息机房！2023-09-11 13:39:21	2023-09-11 13:39:41
136	信息机房有非法人员！	2023-09-11 13:48:18
137	密钥机房未授权用户验证数次过多！	2023-09-19 16:04:38
138	CA机房未授权用户验证数次过多！	2023-09-19 16:07:30
139	信息机房门没关！	2023-09-26 15:19:56
140	者红鲜和侯辉标进入信息机房关门超时！	2023-09-26 16:55:12
141	者红鲜和侯辉标进入信息机房关门超时！	2023-09-26 16:55:32
142	信息机房门没关！	2023-10-09 13:33:16
143	信息机房门没关！	2023-10-10 09:08:23
144	者红鲜和侯辉标进入信息机房关门超时！	2023-10-10 09:10:26
145	信息机房门没关！	2023-10-10 09:29:31
146	信息机房门没关！	2023-10-10 09:42:56
147	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2023-10-10 09:51:29	2023-10-10 09:51:29
148	密钥机房门没关！	2023-10-11 17:34:13
149	信息机房门没关！	2023-10-12 11:12:42
150	信息机房门没关！	2023-10-12 14:19:15
151	密钥机房门没关！	2023-10-12 16:02:39
152	CA机房门没关！	2023-10-12 18:51:07
153	密钥机房门没关！	2023-10-12 20:02:03
154	密钥机房门没关！	2023-10-13 13:37:53
155	信息机房门没关！	2023-10-13 14:11:56
156	密钥机房门没关！	2023-10-13 14:15:11
157	密钥机房门没关！	2023-10-13 14:58:58
158	密钥机房门没关！	2023-10-16 16:22:58
159	侯辉标和者红鲜出去时候合法开门，有人非法滞留信息机房！2023-10-17 09:10:09	2023-10-17 09:10:09
160	侯辉标和者红鲜出去时候合法开门，有人非法滞留信息机房！2023-10-17 09:10:09	2023-10-17 09:10:29
161	密钥机房门没关！	2023-10-30 08:43:01
162	密钥机房门没关！	2023-10-30 09:02:04
163	CA机房门没关！	2023-10-30 09:02:47
164	CA机房门没关！	2023-10-31 15:38:24
165	密钥机房门没关！	2023-11-07 16:18:42
166	CA机房门没关！	2023-11-07 16:20:32
167	CA机房门没关！	2023-11-15 15:52:07
168	信息机房门没关！	2023-11-20 16:25:32
169	信息机房门没关！	2023-11-29 18:45:32
170	信息机房门没关！	2023-12-14 16:22:03
171	CA机房门没关！	2023-12-14 16:34:22
172	密钥机房门没关！	2023-12-14 16:39:48
173	信息机房有非法人员！	2023-12-16 02:12:22
174	者红鲜(1002) 进入信息机房违反反潜规则。	2023-12-25 09:05:23
175	者红鲜和侯辉标出信息机房关门超时！	2023-12-25 09:14:54
176	者红鲜和侯辉标出信息机房关门超时！	2023-12-25 09:15:14
177	密钥机房门没关！	2023-12-25 09:16:12
178	CA机房门没关！	2023-12-25 09:23:46
179	密钥机房门没关！	2024-01-04 10:08:45
180	CA机房门没关！	2024-01-04 10:11:41
181	者红鲜和侯辉标进入信息机房关门超时！	2024-01-04 10:14:21
182	者红鲜和侯辉标进入信息机房关门超时！	2024-01-04 10:14:41
183	CA机房门没关！	2024-01-19 10:43:45
184	信息机房门没关！	2024-01-19 12:05:21
185	CA机房门没关！	2024-01-19 12:07:25
186	密钥机房门没关！	2024-01-19 12:08:21
187	信息机房门没关！	2024-01-19 12:12:55
188	CA机房门没关！	2024-01-19 12:13:48
189	密钥机房门没关！	2024-01-19 12:13:50
190	信息机房门没关！	2024-01-21 09:51:11
191	CA机房门没关！	2024-01-21 09:56:26
192	密钥机房门没关！	2024-01-21 10:32:55
193	信息机房门没关！	2024-01-21 11:33:42
194	信息机房门没关！	2024-01-21 12:10:17
195	CA机房门没关！	2024-01-21 12:10:32
196	信息机房有非法人员！	2024-01-21 12:11:55
197	信息机房门没关！	2024-01-21 13:30:07
198	CA机房门没关！	2024-01-22 16:10:19
199	信息机房门没关！	2024-01-22 17:25:32
200	CA机房门没关！	2024-01-22 17:28:58
201	信息机房门没关！	2024-01-22 17:29:18
202	信息机房门没关！	2024-01-23 08:51:14
203	CA机房门没关！	2024-01-23 08:51:34
204	信息机房门没关！	2024-01-23 11:59:18
205	信息机房门没关！	2024-01-23 12:02:42
206	CA机房门没关！	2024-01-23 12:03:56
207	CA机房门没关！	2024-01-23 17:22:13
208	CA机房门没关！	2024-01-24 11:31:02
209	者红鲜和侯辉标出信息机房关门超时！	2024-03-05 11:11:40
210	者红鲜和侯辉标出信息机房关门超时！	2024-03-05 11:12:00
211	密钥机房门没关！	2024-03-08 09:32:57
212	密钥机房门没关！	2024-03-11 16:43:45
213	信息机房门没关！	2024-03-11 16:44:25
214	密钥机房门没关！	2024-03-14 09:48:07
215	密钥机房门没关！	2024-03-14 13:24:30
216	密钥机房门没关！	2024-03-14 13:30:15
217	CA机房门没关！	2024-03-14 16:40:29
218	者红鲜和侯辉标出信息机房关门超时！	2024-03-19 16:47:03
219	者红鲜和侯辉标出信息机房关门超时！	2024-03-19 16:47:23
220	信息机房门没关！	2024-03-20 15:09:12
221	CA机房门没关！	2024-03-22 15:00:08
222	张高明和曾元首出去时候合法开门，有人非法滞留密钥机房！2024-03-26 09:50:18	2024-03-26 09:50:18
223	张高明和曾元首出去时候合法开门，有人非法滞留密钥机房！2024-03-26 09:50:18	2024-03-26 09:50:38
224	张高明和曾元首进入密钥机房关门超时！	2024-03-26 09:51:42
225	CA机房门没关！	2024-03-26 16:28:03
226	密钥机房门没关！	2024-03-26 16:36:46
227	信息机房门没关！	2024-03-31 17:16:48
228	信息机房门没关！	2024-03-31 17:42:25
229	信息机房门没关！	2024-04-08 11:06:00
230	信息机房门没关！	2024-04-08 11:41:15
231	信息机房门没关！	2024-04-11 08:23:50
232	密钥机房门没关！	2024-04-11 09:32:01
233	CA机房门没关！	2024-04-11 09:35:33
234	密钥机房门没关！	2024-04-11 13:27:35
235	CA机房门没关！	2024-04-11 13:27:54
236	CA机房门没关！	2024-04-11 13:30:08
237	密钥机房门没关！	2024-04-11 13:30:09
238	CA机房门没关！	2024-04-12 16:24:36
239	密钥机房门没关！	2024-04-17 13:44:54
240	CA机房门没关！	2024-04-17 13:45:09
241	信息机房门没关！	2024-04-18 10:41:33
242	者红鲜和侯辉标出信息机房关门超时！	2024-04-22 14:04:44
243	者红鲜和侯辉标出信息机房关门超时！	2024-04-22 14:05:04
244	信息机房门没关！	2024-04-22 14:10:56
245	者红鲜和侯辉标进入信息机房关门超时！	2024-04-22 14:20:39
246	者红鲜和侯辉标进入信息机房关门超时！	2024-04-22 14:20:59
247	CA机房未授权用户验证数次过多！	2024-04-22 14:25:44
248	信息机房门没关！	2024-04-22 14:31:32
249	信息机房门没关！	2024-04-22 14:40:48
250	密钥机房未授权用户验证数次过多！	2024-04-22 14:40:58
251	者红鲜(1002) 进入信息机房违反反潜规则。	2024-04-22 14:49:31
252	侯辉标(1001) 进入信息机房违反反潜规则。	2024-04-22 14:49:35
253	侯辉标和者红鲜进入时候合法开门，人没进来信息机房！2024-04-22 14:50:54	2024-04-22 14:50:54
254	侯辉标和者红鲜进入时候合法开门，人没进来信息机房！2024-04-22 14:50:54	2024-04-22 14:51:18
255	信息机房门没关！	2024-04-22 16:42:52
256	信息机房门没关！	2024-04-23 09:56:17
257	密钥机房未授权用户验证数次过多！	2024-04-23 10:10:46
258	信息机房门没关！	2024-04-23 10:14:54
259	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-04-23 11:29:13	2024-04-23 11:29:13
260	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-04-23 11:29:13	2024-04-23 11:29:33
261	信息机房门没关！	2024-04-23 11:30:43
262	密钥机房门没关！	2024-04-23 16:15:25
263	密钥机房门没关！	2024-04-23 16:23:53
264	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-04-24 11:00:50	2024-04-24 11:00:50
265	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-04-24 11:00:50	2024-04-24 11:01:10
266	者红鲜和侯辉标出信息机房关门超时！	2024-04-25 09:38:39
267	者红鲜和侯辉标出信息机房关门超时！	2024-04-25 09:38:59
268	密钥机房未授权用户验证数次过多！	2024-04-25 09:39:00
269	CA机房门没关！	2024-04-26 10:28:35
270	张潜和温敏进入时候合法开门，人没进来CA机房！2024-04-26 10:28:34	2024-04-26 10:28:34
271	华聪和张高明出去时候合法开门，有人非法滞留密钥机房！2024-04-26 15:01:15	2024-04-26 15:01:15
272	华聪和张高明出去时候合法开门，有人非法滞留密钥机房！2024-04-26 15:01:15	2024-04-26 15:01:35
273	信息机房门没关！	2024-04-26 16:46:12
274	CA机房门没关！	2024-04-26 16:47:01
275	侯辉标和者红鲜出信息机房关门超时！	2024-04-30 10:30:33
276	侯辉标和者红鲜出信息机房关门超时！	2024-04-30 10:30:53
277	CA机房未授权用户验证数次过多！	2024-04-30 10:32:21
278	信息机房门没关！	2024-04-30 10:38:43
279	密钥机房门没关！	2024-04-30 10:44:11
280	密钥机房未授权用户验证数次过多！	2024-04-30 11:15:43
281	信息机房门没关！	2024-04-30 19:21:06
282	信息机房门没关！	2024-05-06 12:11:27
283	CA机房未授权用户验证数次过多！	2024-05-06 14:27:59
284	密钥机房未授权用户验证数次过多！	2024-05-06 14:28:35
285	CA机房有非法人员！	2024-05-07 15:42:44
286	CA机房有非法人员！	2024-05-07 15:50:42
287	CA机房有非法人员！	2024-05-08 10:41:40
288	CA机房门没关！	2024-05-08 10:53:33
289	张潜和温敏进入时候合法开门，人没进来CA机房！2024-05-08 10:55:18	2024-05-08 10:55:18
290	张潜和温敏进入时候合法开门，人没进来CA机房！2024-05-08 10:55:18	2024-05-08 10:55:38
291	张潜(1004731) 进入CA机房违反反潜规则。	2024-05-08 10:56:31
292	温敏(1001985) 进入CA机房违反反潜规则。	2024-05-08 10:56:34
293	密钥机房有非法人员！	2024-05-08 11:22:28
294	胡文(1000333) 进入密钥机房违反反潜规则。	2024-05-08 11:25:03
295	华聪(1000328) 进入密钥机房违反反潜规则。	2024-05-08 11:25:09
296	华聪(1000328) 进入密钥机房违反反潜规则。	2024-05-08 16:52:46
297	胡文(1000333) 进入密钥机房违反反潜规则。	2024-05-08 16:52:49
298	华聪(1000328) 进入密钥机房违反反潜规则。	2024-05-08 16:53:00
299	胡文(1000333) 进入密钥机房违反反潜规则。	2024-05-08 16:53:02
300	密钥机房门没关！	2024-05-08 16:55:58
301	CA机房门没关！	2024-05-09 18:07:58
302	密钥机房门没关！	2024-05-09 18:10:44
303	信息机房门没关！	2024-05-13 12:30:28
304	CA机房门没关！	2024-05-13 15:39:14
305	CA机房门没关！	2024-05-15 11:12:11
306	CA机房门没关！	2024-05-16 12:30:48
307	信息机房门没关！	2024-05-16 17:26:23
308	CA机房门没关！	2024-05-16 17:31:44
309	信息机房门没关！	2024-05-16 17:42:38
310	CA机房门没关！	2024-05-16 17:43:26
311	CA机房门没关！	2024-05-21 14:31:22
312	密钥机房门没关！	2024-05-22 14:05:26
313	张高明(1003) 进入密钥机房违反反潜规则。	2024-05-23 13:54:54
314	华聪(1000328) 进入密钥机房违反反潜规则。	2024-05-23 13:55:05
315	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-05-23 13:54:49	2024-05-23 13:54:49
316	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-05-23 13:54:49	2024-05-23 13:55:14
317	华聪(1000328) 进入密钥机房违反反潜规则。	2024-05-23 13:56:09
318	张高明(1003) 进入密钥机房违反反潜规则。	2024-05-23 13:56:12
319	密钥机房有非法人员！	2024-05-23 13:57:12
320	张高明和华聪进入时候合法开门，人没进来密钥机房！2024-05-23 14:02:26	2024-05-23 14:02:26
321	张高明和华聪进入时候合法开门，人没进来密钥机房！2024-05-23 14:02:26	2024-05-23 14:02:48
322	华聪(1000328) 进入密钥机房违反反潜规则。	2024-05-23 14:03:04
323	张高明(1003) 进入密钥机房违反反潜规则。	2024-05-23 14:03:07
324	张高明(1003) 出密钥机房违反反潜规则。	2024-05-23 14:39:12
325	华聪(1000328) 出密钥机房违反反潜规则。	2024-05-23 14:39:17
326	密钥机房有非法人员！	2024-05-23 14:39:25
327	华聪(1000328) 出密钥机房违反反潜规则。	2024-05-23 14:39:26
328	张高明(1003) 出密钥机房违反反潜规则。	2024-05-23 14:39:30
329	张高明(1003) 出密钥机房违反反潜规则。	2024-05-23 14:41:03
330	华聪(1000328) 出密钥机房违反反潜规则。	2024-05-23 14:41:07
331	CA机房门没关！	2024-05-23 14:45:14
332	CA机房门没关！	2024-05-23 15:38:27
333	密钥机房门没关！	2024-05-23 15:40:55
334	张高明和曾元首出去时候合法开门，有人非法滞留密钥机房！2024-05-24 11:43:13	2024-05-24 11:43:13
335	张高明和曾元首出去时候合法开门，有人非法滞留密钥机房！2024-05-24 11:43:13	2024-05-24 11:43:36
336	密钥机房门没关！	2024-05-24 13:44:39
337	信息机房门没关！	2024-05-27 13:49:25
338	信息机房门没关！	2024-05-27 14:04:31
339	密钥机房门没关！	2024-05-30 08:47:06
340	密钥机房门没关！	2024-05-30 09:32:26
341	密钥机房门没关！	2024-05-30 09:45:54
342	密钥机房门没关！	2024-05-30 12:06:42
343	密钥机房门没关！	2024-05-30 12:08:11
344	信息机房门没关！	2024-06-02 08:38:41
345	信息机房门没关！	2024-06-02 09:35:13
346	CA机房门没关！	2024-06-02 09:36:50
347	CA机房门没关！	2024-06-02 11:03:47
348	CA机房门没关！	2024-06-03 15:06:33
349	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-06-05 16:59:57	2024-06-05 16:59:57
350	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-06-05 16:59:57	2024-06-05 17:00:22
351	者红鲜(1002) 进入信息机房违反反潜规则。	2024-06-07 09:28:16
352	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-06-07 09:37:17	2024-06-07 09:37:17
353	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-06-07 09:37:17	2024-06-07 09:37:39
354	CA机房门没关！	2024-06-07 13:28:40
355	CA机房门没关！	2024-06-08 09:33:11
356	信息机房门没关！	2024-06-10 13:48:43
357	信息机房门没关！	2024-06-10 14:06:08
358	信息机房门没关！	2024-06-11 11:39:46
359	信息机房有非法人员！	2024-06-12 14:29:19
360	信息机房门没关！	2024-06-12 16:56:55
361	信息机房门没关！	2024-06-12 19:19:04
362	信息机房门没关！	2024-06-14 10:33:42
363	密钥机房门没关！	2024-06-14 10:36:07
364	信息机房门没关！	2024-06-20 09:30:08
365	信息机房门没关！	2024-06-20 11:01:45
366	信息机房门没关！	2024-06-24 10:57:08
367	密钥机房门没关！	2024-07-02 16:13:16
368	侯辉标和者红鲜出去时候合法开门，有人非法滞留信息机房！2024-07-15 09:44:34	2024-07-15 09:44:34
369	侯辉标和者红鲜出去时候合法开门，有人非法滞留信息机房！2024-07-15 09:44:34	2024-07-15 09:44:56
370	信息机房门没关！	2024-07-15 15:34:50
371	信息机房门没关！	2024-07-16 16:54:38
372	曾元首(1007) 进入密钥机房违反反潜规则。	2024-07-25 14:34:58
373	张高明(1003) 进入密钥机房违反反潜规则。	2024-07-25 14:35:01
374	张高明和曾元首进入时候合法开门，人没进来密钥机房！2024-07-25 14:34:48	2024-07-25 14:34:48
375	张高明和曾元首进入时候合法开门，人没进来密钥机房！2024-07-25 14:34:48	2024-07-25 14:35:10
376	张高明(1003) 出密钥机房违反反潜规则。	2024-07-25 14:36:42
377	曾元首(1007) 出密钥机房违反反潜规则。	2024-07-25 14:36:46
378	曾元首和张高明出去时候合法开门，有人非法滞留密钥机房！2024-07-25 14:36:35	2024-07-25 14:36:35
379	曾元首(1007) 出密钥机房违反反潜规则。	2024-07-25 14:37:16
380	张高明(1003) 出密钥机房违反反潜规则。	2024-07-25 14:37:16
381	曾元首和张高明出去时候合法开门，有人非法滞留密钥机房！2024-07-25 15:08:47	2024-07-25 15:08:47
382	曾元首和张高明出去时候合法开门，有人非法滞留密钥机房！2024-07-25 15:08:47	2024-07-25 15:09:10
383	密钥机房门没关！	2024-07-25 16:52:38
384	侯辉标和者红鲜进入时候合法开门，人没进来信息机房！2024-07-25 16:54:25	2024-07-25 16:54:25
385	侯辉标和者红鲜进入时候合法开门，人没进来信息机房！2024-07-25 16:54:25	2024-07-25 16:54:50
386	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-07-25 16:55:09	2024-07-25 16:55:09
387	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-07-25 17:11:41	2024-07-25 17:11:41
388	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-07-25 17:11:41	2024-07-25 17:12:05
389	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-07-26 08:43:59	2024-07-26 08:43:59
390	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-07-26 08:43:59	2024-07-26 08:44:24
391	张高明(1003) 进入密钥机房违反反潜规则。	2024-07-26 08:46:45
392	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-07-26 08:46:43	2024-07-26 08:46:43
393	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-07-26 08:46:43	2024-07-26 08:47:05
394	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-07-26 08:50:04	2024-07-26 08:50:04
395	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-07-26 08:50:04	2024-07-26 08:50:28
396	密钥机房门没关！	2024-07-26 08:51:21
397	密钥机房门没关！	2024-07-26 08:52:57
398	张高明和曾元首出去时候合法开门，有人非法滞留密钥机房！2024-07-26 08:58:32	2024-07-26 08:58:32
399	张高明和曾元首出去时候合法开门，有人非法滞留密钥机房！2024-07-26 08:58:32	2024-07-26 08:58:56
400	张高明和曾元首进入时候合法开门，人没进来密钥机房！2024-07-26 09:04:23	2024-07-26 09:04:23
401	张高明和曾元首进入时候合法开门，人没进来密钥机房！2024-07-26 09:04:23	2024-07-26 09:04:48
402	曾元首和张高明出密钥机房关门超时！	2024-07-26 09:07:35
403	曾元首和张高明进入密钥机房关门超时！	2024-07-26 09:08:13
404	侯辉标(1001) 进入信息机房违反反潜规则。	2024-07-26 10:22:38
405	者红鲜(1002) 进入信息机房违反反潜规则。	2024-07-26 10:22:45
406	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-07-26 10:22:26	2024-07-26 10:22:26
407	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-07-26 10:22:26	2024-07-26 10:22:49
408	曾元首和张高明出去时候合法开门，有人非法滞留密钥机房！2024-07-26 10:36:52	2024-07-26 10:36:52
409	曾元首和张高明出去时候合法开门，有人非法滞留密钥机房！2024-07-26 10:36:52	2024-07-26 10:37:17
410	曾元首(1007) 出密钥机房违反反潜规则。	2024-07-26 10:37:19
411	张高明(1003) 出密钥机房违反反潜规则。	2024-07-26 10:37:23
412	信息机房门没关！	2024-07-26 10:38:00
413	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-07-26 10:38:57	2024-07-26 10:38:57
414	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-07-26 10:38:57	2024-07-26 10:39:20
415	信息机房门没关！	2024-07-31 07:59:46
416	信息机房门没关！	2024-07-31 08:32:08
417	信息机房门没关！	2024-08-01 10:22:19
418	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-08-14 13:55:59	2024-08-14 13:55:59
419	者红鲜和侯辉标进入时候合法开门，人没进来信息机房！2024-08-14 13:55:59	2024-08-14 13:56:22
420	潘盛辉(1005) 进入CA机房违反反潜规则。	2024-08-14 14:01:48
421	赵自强(1006) 进入CA机房违反反潜规则。	2024-08-14 14:01:50
422	潘盛辉和赵自强进入时候合法开门，人没进来CA机房！2024-08-14 14:01:34	2024-08-14 14:01:34
423	潘盛辉和赵自强进入时候合法开门，人没进来CA机房！2024-08-14 14:01:34	2024-08-14 14:01:58
424	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-08-15 10:26:15	2024-08-15 10:26:15
425	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-08-15 10:26:15	2024-08-15 10:26:39
426	华聪和张高明出去时候合法开门，有人非法滞留密钥机房！2024-08-15 10:27:15	2024-08-15 10:27:15
427	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-08-15 10:29:14	2024-08-15 10:29:14
428	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-08-15 10:29:14	2024-08-15 10:29:36
429	华聪(1000328) 进入密钥机房违反反潜规则。	2024-08-15 10:29:37
430	张高明(1003) 进入密钥机房违反反潜规则。	2024-08-15 10:29:41
431	密钥机房门没关！	2024-08-15 10:32:46
432	密钥机房门没关！	2024-08-15 10:33:35
433	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-08-15 10:35:06	2024-08-15 10:35:06
434	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-08-15 10:35:06	2024-08-15 10:35:28
435	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-08-15 10:41:42	2024-08-15 10:41:42
436	华聪和张高明进入时候合法开门，人没进来密钥机房！2024-08-15 10:41:42	2024-08-15 10:42:07
437	密钥机房有非法人员！	2024-08-15 10:42:50
438	密钥机房有非法人员！	2024-08-15 10:43:16
439	密钥机房有非法人员！	2024-08-15 11:06:14
440	张高明和华聪出密钥机房关门超时！	2024-08-15 12:03:10
441	CA机房门没关！	2024-08-20 10:14:08
442	密钥机房门没关！	2024-08-20 10:20:51
443	侯辉标和者红鲜进入时候合法开门，人没进来信息机房！2024-08-20 10:25:22	2024-08-20 10:25:22
444	侯辉标和者红鲜进入时候合法开门，人没进来信息机房！2024-08-20 10:25:22	2024-08-20 10:25:46
445	信息机房门没关！	2024-08-30 17:05:43
446	信息机房门没关！	2024-08-30 17:16:34
447	信息机房门没关！	2024-09-02 08:00:31
448	信息机房门没关！	2024-09-02 11:00:42
449	者红鲜(1002) 出信息机房违反反潜规则。	2024-09-03 10:53:29
450	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-09-03 10:53:10	2024-09-03 10:53:10
451	者红鲜和侯辉标出去时候合法开门，有人非法滞留信息机房！2024-09-03 10:53:10	2024-09-03 10:53:33
452	侯辉标(1001) 出信息机房违反反潜规则。	2024-09-03 10:53:33
453	信息机房门没关！	2024-09-03 11:56:49
454	侯辉标和者红鲜进入信息机房关门超时！	2024-09-03 18:22:48
455	侯辉标和者红鲜进入信息机房关门超时！	2024-09-03 18:23:10
456	CA机房门没关！	2024-09-03 18:42:31
457	密钥机房门没关！	2024-09-03 18:55:06
458	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-09-04 08:19:25	2024-09-04 08:19:25
459	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-09-04 08:21:28	2024-09-04 08:21:28
460	者红鲜和侯辉标进入信息机房关门超时！	2024-09-04 08:27:30
461	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-09-04 08:30:28	2024-09-04 08:30:28
462	曾元首和张高明进入时候合法开门，人没进来密钥机房！2024-09-04 10:33:32	2024-09-04 10:33:32
463	者红鲜和侯辉标进入信息机房关门超时！	2024-09-04 10:49:15
\.


--
-- Data for Name: analog; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.analog (id, high_content, high_limit, high_range, low_content, low_limit, low_range, point_id) FROM stdin;
\.


--
-- Data for Name: analog_v; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.analog_v (id, point_id, record_time, status, value) FROM stdin;
\.


--
-- Data for Name: aqf; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.aqf (id, name, room_sign, status) FROM stdin;
1	CA机房	CA	-1
3	密钥机房	KEY	0
2	信息机房	INFO	0
\.


--
-- Data for Name: basepoint; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.basepoint (high_content, high_limit, id, "limit", limit_content, low_content, low_limit, name, type, unit) FROM stdin;
\.


--
-- Data for Name: card_info; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.card_info (id) FROM stdin;
\.


--
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.channel (id, cmd_interval, cycle, ip, is_acq, port, station_id) FROM stdin;
\.


--
-- Data for Name: device_info; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.device_info (id, is_running, location, model, name, production_date, remarks, service_life, use_date) FROM stdin;
\.


--
-- Data for Name: digit; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.digit (id, limit_content, limit_value, point_id) FROM stdin;
\.


--
-- Data for Name: digit_v; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.digit_v (id, point_id, record_time, status, value) FROM stdin;
\.


--
-- Data for Name: display; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.display (block, id) FROM stdin;
\.


--
-- Data for Name: door_controller; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.door_controller (id, ip, name, port, remark, sn, station_id) FROM stdin;
\.


--
-- Data for Name: door_op; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.door_op (card_id, door_name, id, op, op_time, people) FROM stdin;
\.


--
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.module (id, addr, channel_id, is_acq, name, pwd, remarks, sign, type) FROM stdin;
\.


--
-- Data for Name: module_door; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.module_door (id, ip, name, port, sn) FROM stdin;
\.


--
-- Data for Name: module_event; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.module_event (event, id, level, module_id, record_time) FROM stdin;
\.


--
-- Data for Name: module_type; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.module_type (brand, id, model, name, sign) FROM stdin;
\.


--
-- Data for Name: op_log; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.op_log (id, content, record_time, user_id) FROM stdin;
1	管理员远程解除报警	2023-02-07 14:35:02	\N
2	管理员远程解除报警	2023-02-08 15:49:10	\N
3	管理员远程解除报警	2023-02-16 16:01:51	\N
4	管理员远程开门	2023-03-02 13:42:10	\N
5	管理员远程开门	2023-03-02 13:42:50	\N
6	管理员远程解除报警	2023-03-02 18:52:36	\N
7	管理员远程解除报警	2023-03-02 18:52:52	\N
8	管理员远程解除报警	2023-03-06 10:55:34	\N
9	管理员远程开门	2023-03-13 15:48:49	\N
10	管理员远程解除报警	2023-03-13 15:57:30	\N
11	管理员远程解除报警	2023-03-14 10:49:22	\N
12	管理员远程开门	2023-03-28 09:28:21	\N
13	管理员远程开门	2023-03-28 09:28:53	\N
14	管理员远程解除报警	2023-03-28 12:36:59	\N
15	管理员远程解除报警	2023-03-28 12:37:12	\N
16	管理员远程开门	2023-03-28 13:54:09	\N
17	管理员远程开门	2023-03-28 13:54:26	\N
18	管理员远程解除报警	2023-03-28 17:08:10	\N
19	管理员远程解除报警	2023-03-28 17:08:20	\N
20	管理员远程解除报警	2023-04-05 13:26:53	\N
21	管理员远程开门	2023-04-05 13:30:51	\N
22	管理员远程解除报警	2023-04-05 13:31:29	\N
23	管理员远程解除报警	2023-04-07 11:04:14	\N
24	重启管理系统！	2023-04-07 11:13:07	\N
25	重启管理系统！	2023-04-07 11:13:15	\N
26	管理员远程解除报警	2023-04-17 15:38:42	\N
27	管理员远程解除报警	2023-04-18 09:40:21	\N
28	管理员远程开门	2023-04-18 10:26:40	\N
29	管理员远程解除报警	2023-04-18 10:28:04	\N
30	管理员远程解除报警	2023-04-18 11:17:50	\N
31	管理员远程解除报警	2023-04-18 14:52:14	\N
32	管理员远程开门	2023-04-18 14:52:37	\N
33	管理员远程解除报警	2023-04-18 14:53:05	\N
34	管理员远程开门	2023-04-20 14:55:05	\N
35	管理员远程解除报警	2023-04-20 15:05:09	\N
36	管理员远程开门	2023-04-20 16:25:12	\N
37	管理员远程解除报警	2023-04-20 16:38:47	\N
38	管理员远程开门	2023-04-26 16:30:49	\N
39	管理员远程解除报警	2023-04-26 16:48:54	\N
40	重启管理系统！	2023-05-08 14:07:10	\N
41	管理员远程开门	2023-05-08 14:13:15	\N
42	管理员远程解除报警	2023-05-08 14:19:15	\N
43	管理员远程开门	2023-05-08 14:37:28	\N
44	管理员远程解除报警	2023-05-08 14:40:54	\N
45	管理员远程开门	2023-05-08 15:09:01	\N
46	管理员远程解除报警	2023-05-08 15:12:25	\N
47	管理员远程解除报警	2023-05-16 10:08:54	\N
48	管理员远程解除报警	2023-05-16 10:09:04	\N
49	管理员远程解除报警	2023-05-16 10:09:17	\N
50	管理员远程开门	2023-05-16 15:58:34	\N
51	管理员远程解除报警	2023-05-16 16:10:27	\N
52	管理员远程开门	2023-05-16 16:24:29	\N
53	管理员远程解除报警	2023-05-16 16:54:49	\N
54	管理员远程开门	2023-05-25 16:23:51	\N
55	管理员远程解除报警	2023-05-25 16:32:20	\N
56	管理员远程开门	2023-05-29 11:22:06	\N
57	管理员远程解除报警	2023-05-29 11:23:15	\N
58	管理员远程解除报警	2023-05-29 14:22:23	\N
59	管理员远程解除报警	2023-05-29 14:23:53	\N
60	管理员远程开门	2023-05-29 14:33:03	\N
61	管理员远程开门	2023-05-29 14:45:52	\N
62	管理员远程解除报警	2023-05-29 14:55:38	\N
63	管理员远程解除报警	2023-05-29 14:56:07	\N
64	管理员远程开门	2023-05-29 15:44:26	\N
65	管理员远程解除报警	2023-05-29 16:11:42	\N
66	管理员远程开门	2023-05-30 08:42:14	\N
67	管理员远程开门	2023-05-30 08:42:37	\N
68	管理员远程解除报警	2023-05-30 08:43:23	\N
69	管理员远程解除报警	2023-05-30 08:43:38	\N
70	管理员远程开门	2023-05-30 18:26:54	\N
71	管理员远程开门	2023-05-30 18:31:28	\N
72	管理员远程解除报警	2023-05-30 18:33:55	\N
73	管理员远程解除报警	2023-05-30 18:34:11	\N
74	管理员远程开门	2023-05-31 14:36:56	\N
75	管理员远程开门	2023-05-31 14:37:55	\N
76	管理员远程解除报警	2023-05-31 16:48:22	\N
77	管理员远程解除报警	2023-05-31 16:48:51	\N
78	管理员远程开门	2023-06-03 10:29:39	\N
79	管理员远程开门	2023-06-03 10:35:04	\N
80	管理员远程解除报警	2023-06-03 11:21:34	\N
81	管理员远程解除报警	2023-06-03 11:26:39	\N
82	管理员远程解除报警	2023-06-04 12:15:52	\N
83	管理员远程解除报警	2023-06-04 12:16:59	\N
84	管理员远程解除报警	2023-06-04 12:23:24	\N
85	管理员远程开门	2023-06-06 15:56:22	\N
86	管理员远程解除报警	2023-06-06 16:05:06	\N
87	管理员远程开门	2023-06-09 10:24:19	\N
88	管理员远程解除报警	2023-06-09 10:26:28	\N
89	管理员远程开门	2023-06-11 16:25:36	\N
90	管理员远程开门	2023-06-11 16:27:08	\N
91	管理员远程解除报警	2023-06-11 17:15:00	\N
92	管理员远程解除报警	2023-06-11 17:15:10	\N
93	管理员远程开门	2023-06-11 18:44:54	\N
94	管理员远程解除报警	2023-06-11 18:59:46	\N
95	管理员远程解除报警	2023-06-11 18:59:47	\N
96	管理员远程解除报警	2023-06-11 18:59:47	\N
97	管理员远程解除报警	2023-06-11 18:59:48	\N
98	管理员远程解除报警	2023-06-11 18:59:48	\N
99	管理员远程开门	2023-06-12 09:25:42	\N
100	管理员远程解除报警	2023-06-12 10:10:39	\N
101	管理员远程开门	2023-06-12 10:25:26	\N
102	管理员远程解除报警	2023-06-12 11:03:19	\N
103	管理员远程开门	2023-06-12 16:43:41	\N
104	管理员远程解除报警	2023-06-12 16:59:24	\N
105	管理员远程开门	2023-06-16 13:50:18	\N
106	管理员远程开门	2023-06-16 13:50:29	\N
107	管理员远程开门	2023-06-16 13:50:53	\N
108	管理员远程开门	2023-06-16 13:51:45	\N
109	管理员远程解除报警	2023-06-16 13:52:35	\N
110	管理员远程开门	2023-06-20 09:00:06	\N
111	管理员远程解除报警	2023-06-20 09:09:01	\N
112	管理员远程开门	2023-06-25 17:32:46	\N
113	管理员远程解除报警	2023-06-25 17:39:50	\N
114	管理员远程开门	2023-06-28 14:02:19	\N
115	管理员远程解除报警	2023-06-28 14:07:49	\N
116	管理员远程开门	2023-07-10 19:20:38	\N
117	管理员远程开门	2023-07-10 19:21:53	\N
118	管理员远程解除报警	2023-07-10 19:47:14	\N
119	管理员远程解除报警	2023-07-10 19:47:25	\N
120	管理员远程解除报警	2023-07-10 19:59:33	\N
121	管理员远程开门	2023-07-24 10:14:38	\N
122	管理员远程开门	2023-07-24 10:14:40	\N
123	管理员远程解除报警	2023-07-24 10:22:44	\N
124	重启管理系统！	2023-07-28 10:20:27	\N
125	管理员远程开门	2023-07-28 10:21:04	\N
126	管理员远程解除报警	2023-07-28 10:23:33	\N
127	管理员远程开门	2023-08-10 09:30:37	\N
128	管理员远程解除报警	2023-08-10 09:31:54	\N
129	管理员远程开门	2023-08-17 14:09:24	\N
130	管理员远程解除报警	2023-08-17 14:15:41	\N
131	管理员远程开门	2023-08-17 14:15:58	\N
132	管理员远程解除报警	2023-08-17 14:19:54	\N
133	管理员远程开门	2023-09-11 13:40:42	\N
134	管理员远程解除报警	2023-09-11 13:48:18	\N
135	管理员远程解除报警	2023-09-11 14:08:06	\N
136	管理员远程开门	2023-09-19 16:05:13	\N
137	管理员远程开门	2023-09-19 16:07:45	\N
138	管理员远程解除报警	2023-09-19 16:14:28	\N
139	管理员远程解除报警	2023-09-19 16:14:40	\N
140	管理员远程开门	2023-09-26 15:19:55	\N
141	管理员远程解除报警	2023-09-26 16:28:57	\N
142	管理员远程解除报警	2023-09-26 17:26:19	\N
143	管理员远程解除报警	2023-10-09 13:41:54	\N
144	管理员远程解除报警	2023-10-10 10:15:02	\N
145	管理员远程开门	2023-10-11 17:34:13	\N
146	管理员远程解除报警	2023-10-11 17:38:12	\N
147	管理员远程开门	2023-10-12 11:12:41	\N
148	管理员远程解除报警	2023-10-12 12:03:15	\N
149	管理员远程开门	2023-10-12 14:19:14	\N
150	管理员远程开门	2023-10-12 16:02:38	\N
151	管理员远程解除报警	2023-10-12 16:16:31	\N
152	管理员远程开门	2023-10-12 18:51:06	\N
153	管理员远程开门	2023-10-12 18:55:41	\N
154	管理员远程解除报警	2023-10-12 18:59:33	\N
155	管理员远程解除报警	2023-10-12 18:59:44	\N
156	管理员远程开门	2023-10-12 20:02:03	\N
157	管理员远程解除报警	2023-10-12 20:08:19	\N
158	管理员远程开门	2023-10-13 13:37:52	\N
159	管理员远程解除报警	2023-10-13 13:47:27	\N
160	管理员远程开门	2023-10-13 14:11:55	\N
161	管理员远程开门	2023-10-13 14:15:10	\N
162	管理员远程解除报警	2023-10-13 14:21:51	\N
163	管理员远程解除报警	2023-10-13 14:22:01	\N
164	管理员远程开门	2023-10-13 14:58:57	\N
165	管理员远程开门	2023-10-13 15:27:32	\N
166	管理员远程解除报警	2023-10-13 15:45:08	\N
167	管理员远程开门	2023-10-16 16:22:57	\N
168	管理员远程开门	2023-10-16 18:03:32	\N
169	管理员远程解除报警	2023-10-16 18:03:44	\N
170	管理员远程解除报警	2023-10-17 09:14:13	\N
171	管理员远程开门	2023-10-30 08:43:00	\N
172	管理员远程解除报警	2023-10-30 09:02:03	\N
173	管理员远程开门	2023-10-30 09:02:46	\N
174	管理员远程解除报警	2023-10-30 09:22:59	\N
175	管理员远程解除报警	2023-10-30 09:23:17	\N
176	管理员远程开门	2023-10-31 15:38:23	\N
177	管理员远程解除报警	2023-10-31 15:41:20	\N
178	管理员远程开门	2023-11-07 16:18:41	\N
179	管理员远程开门	2023-11-07 16:20:31	\N
180	管理员远程解除报警	2023-11-07 16:22:04	\N
181	管理员远程解除报警	2023-11-07 16:22:21	\N
182	管理员远程开门	2023-11-15 15:52:06	\N
183	管理员远程解除报警	2023-11-15 15:54:12	\N
184	管理员远程开门	2023-11-20 16:25:30	\N
185	管理员远程解除报警	2023-11-20 16:37:08	\N
186	管理员远程开门	2023-11-29 18:45:31	\N
187	管理员远程解除报警	2023-11-29 18:49:10	\N
188	管理员远程开门	2023-12-14 16:22:03	\N
189	管理员远程解除报警	2023-12-14 16:34:00	\N
190	管理员远程开门	2023-12-14 16:34:21	\N
191	管理员远程解除报警	2023-12-14 16:38:10	\N
192	管理员远程开门	2023-12-14 16:39:47	\N
193	管理员远程开门	2023-12-14 16:41:56	\N
194	管理员远程解除报警	2023-12-14 16:42:28	\N
195	管理员远程解除报警	2023-12-16 08:03:43	\N
196	管理员远程开门	2023-12-25 09:16:11	\N
197	管理员远程解除报警	2023-12-25 09:23:12	\N
198	管理员远程解除报警	2023-12-25 09:23:26	\N
199	管理员远程开门	2023-12-25 09:23:45	\N
200	管理员远程解除报警	2023-12-25 09:29:01	\N
201	管理员远程开门	2024-01-04 10:08:44	\N
202	管理员远程解除报警	2024-01-04 10:11:24	\N
203	管理员远程开门	2024-01-04 10:11:40	\N
204	管理员远程解除报警	2024-01-04 10:14:14	\N
205	管理员远程解除报警	2024-01-04 10:17:29	\N
206	管理员远程开门	2024-01-19 10:43:44	\N
207	管理员远程解除报警	2024-01-19 10:47:08	\N
208	管理员远程开门	2024-01-19 12:07:24	\N
209	管理员远程开门	2024-01-19 12:08:20	\N
210	管理员远程解除报警	2024-01-19 12:20:35	\N
211	管理员远程解除报警	2024-01-19 12:20:47	\N
212	管理员远程解除报警	2024-01-19 12:21:07	\N
213	管理员远程开门	2024-01-21 09:56:25	\N
214	管理员远程开门	2024-01-21 10:32:54	\N
215	管理员远程解除报警	2024-01-21 10:36:27	\N
216	管理员远程解除报警	2024-01-21 11:27:52	\N
217	管理员远程解除报警	2024-01-21 11:32:52	\N
218	管理员远程开门	2024-01-21 11:33:41	\N
219	管理员远程解除报警	2024-01-21 11:34:26	\N
220	管理员远程开门	2024-01-21 12:10:16	\N
221	管理员远程开门	2024-01-21 12:10:31	\N
222	管理员远程解除报警	2024-01-21 12:11:14	\N
223	管理员远程解除报警	2024-01-21 12:11:45	\N
224	管理员远程开门	2024-01-21 13:21:38	\N
225	管理员远程解除报警	2024-01-21 14:47:49	\N
226	管理员远程开门	2024-01-22 16:10:17	\N
227	管理员远程解除报警	2024-01-22 16:10:58	\N
228	管理员远程解除报警	2024-01-22 17:28:31	\N
229	管理员远程开门	2024-01-22 17:28:57	\N
230	管理员远程解除报警	2024-01-22 17:31:17	\N
231	管理员远程开门	2024-01-23 08:51:13	\N
232	管理员远程开门	2024-01-23 08:51:33	\N
233	管理员远程解除报警	2024-01-23 10:11:41	\N
234	管理员远程解除报警	2024-01-23 10:11:59	\N
235	管理员远程开门	2024-01-23 11:59:17	\N
236	管理员远程开门	2024-01-23 12:03:55	\N
237	管理员远程解除报警	2024-01-23 12:12:15	\N
238	管理员远程解除报警	2024-01-23 12:12:29	\N
239	管理员远程开门	2024-01-23 17:22:13	\N
240	管理员远程开门	2024-01-23 17:30:41	\N
241	管理员远程开门	2024-01-23 17:32:41	\N
242	管理员远程解除报警	2024-01-23 17:34:01	\N
243	管理员远程开门	2024-01-24 11:31:01	\N
244	管理员远程解除报警	2024-01-24 11:34:06	\N
245	管理员远程解除报警	2024-03-05 11:12:20	\N
246	管理员远程开门	2024-03-08 09:32:56	\N
247	管理员远程解除报警	2024-03-08 09:37:52	\N
248	管理员远程开门	2024-03-11 16:43:44	\N
249	管理员远程解除报警	2024-03-11 16:44:11	\N
250	管理员远程开门	2024-03-11 16:44:24	\N
251	管理员远程解除报警	2024-03-11 16:44:58	\N
252	管理员远程开门	2024-03-14 09:48:06	\N
253	管理员远程解除报警	2024-03-14 12:02:00	\N
254	管理员远程开门	2024-03-14 13:24:29	\N
255	管理员远程开门	2024-03-14 16:40:28	\N
256	管理员远程解除报警	2024-03-14 17:23:07	\N
257	管理员远程解除报警	2024-03-14 17:23:22	\N
258	管理员远程解除报警	2024-03-19 16:48:15	\N
259	管理员远程开门	2024-03-20 15:09:11	\N
260	管理员远程解除报警	2024-03-20 15:22:24	\N
261	管理员远程开门	2024-03-22 15:00:08	\N
262	管理员远程解除报警	2024-03-22 15:51:42	\N
263	管理员远程解除报警	2024-03-26 09:53:15	\N
264	管理员远程开门	2024-03-26 16:28:02	\N
265	管理员远程开门	2024-03-26 16:36:45	\N
266	管理员远程解除报警	2024-03-26 17:00:57	\N
267	管理员远程解除报警	2024-03-26 17:01:10	\N
268	管理员远程开门	2024-03-31 17:16:47	\N
269	管理员远程解除报警	2024-03-31 17:31:58	\N
270	管理员远程开门	2024-03-31 17:42:24	\N
271	管理员远程解除报警	2024-03-31 17:48:10	\N
272	管理员远程开门	2024-04-08 11:05:59	\N
273	管理员远程解除报警	2024-04-08 11:21:34	\N
274	管理员远程开门	2024-04-08 11:41:14	\N
275	管理员远程解除报警	2024-04-08 11:56:26	\N
276	管理员远程开门	2024-04-11 08:23:49	\N
277	管理员远程解除报警	2024-04-11 08:25:23	\N
278	管理员远程开门	2024-04-11 09:32:00	\N
279	管理员远程开门	2024-04-11 09:35:32	\N
280	管理员远程解除报警	2024-04-11 11:58:44	\N
281	管理员远程解除报警	2024-04-11 11:58:57	\N
282	管理员远程开门	2024-04-11 13:27:35	\N
283	管理员远程开门	2024-04-11 13:27:52	\N
284	管理员远程解除报警	2024-04-11 20:40:56	\N
285	管理员远程解除报警	2024-04-11 20:41:11	\N
286	管理员远程开门	2024-04-12 16:24:35	\N
287	管理员远程解除报警	2024-04-12 16:33:46	\N
288	管理员远程开门	2024-04-17 13:44:54	\N
289	管理员远程开门	2024-04-17 13:45:08	\N
290	管理员远程开门	2024-04-17 18:41:54	\N
291	管理员远程解除报警	2024-04-17 18:55:12	\N
292	管理员远程解除报警	2024-04-17 18:55:36	\N
293	管理员远程开门	2024-04-18 10:41:33	\N
294	管理员远程解除报警	2024-04-18 10:46:04	\N
295	管理员远程解除报警	2024-04-22 14:19:16	\N
296	重启管理系统！	2024-04-22 14:19:47	\N
297	管理员远程解除报警	2024-04-22 14:44:36	\N
298	管理员远程解除报警	2024-04-22 14:44:55	\N
299	管理员远程开门	2024-04-22 14:54:00	\N
300	管理员远程解除报警	2024-04-22 14:58:38	\N
301	管理员远程开门	2024-04-22 16:42:51	\N
302	管理员远程解除报警	2024-04-22 16:47:54	\N
303	管理员远程开门	2024-04-23 09:56:16	\N
304	管理员远程解除报警	2024-04-23 11:27:26	\N
305	管理员远程开门	2024-04-23 11:29:48	\N
306	管理员远程解除报警	2024-04-23 11:30:17	\N
307	管理员远程开门	2024-04-23 11:30:42	\N
308	管理员远程解除报警	2024-04-23 11:32:04	\N
309	管理员远程开门	2024-04-23 16:15:24	\N
310	管理员远程解除报警	2024-04-23 16:16:31	\N
311	管理员远程开门	2024-04-23 16:23:52	\N
312	管理员远程解除报警	2024-04-23 16:24:56	\N
313	管理员远程开门	2024-04-24 11:01:40	\N
314	管理员远程解除报警	2024-04-24 11:01:58	\N
315	管理员远程解除报警	2024-04-25 09:54:42	\N
316	管理员远程解除报警	2024-04-25 09:54:57	\N
317	管理员远程解除报警	2024-04-26 10:29:19	\N
318	管理员远程解除报警	2024-04-26 16:37:18	\N
319	管理员远程开门	2024-04-26 16:46:11	\N
320	管理员远程解除报警	2024-04-26 16:46:41	\N
321	管理员远程开门	2024-04-26 16:47:00	\N
322	管理员远程解除报警	2024-04-26 17:00:23	\N
323	重启管理系统！	2024-04-30 10:38:36	\N
324	管理员远程开门	2024-04-30 10:44:10	\N
325	管理员远程解除报警	2024-04-30 10:45:28	\N
326	管理员远程解除报警	2024-04-30 10:52:02	\N
327	管理员远程解除报警	2024-04-30 11:42:05	\N
328	管理员远程开门	2024-04-30 19:21:06	\N
329	管理员远程解除报警	2024-05-06 12:16:08	\N
330	管理员远程开门	2024-05-06 14:31:22	\N
331	管理员远程解除报警	2024-05-06 14:34:50	\N
332	管理员远程解除报警	2024-05-06 14:35:24	\N
333	管理员远程解除报警	2024-05-07 15:48:15	\N
334	管理员远程开门	2024-05-07 15:59:12	\N
335	管理员远程开门	2024-05-07 15:59:17	\N
336	管理员远程解除报警	2024-05-07 16:03:53	\N
337	管理员远程开门	2024-05-08 10:46:18	\N
451	管理员远程开门	2024-07-26 08:50:25	\N
338	管理员远程解除报警	2024-05-08 10:46:59	\N
339	管理员远程开门	2024-05-08 10:53:32	\N
340	管理员远程解除报警	2024-05-08 10:54:59	\N
341	管理员远程开门	2024-05-08 10:57:26	\N
342	管理员远程解除报警	2024-05-08 10:58:46	\N
343	管理员远程开门	2024-05-08 11:23:06	\N
344	管理员远程开门	2024-05-08 11:23:24	\N
345	管理员远程开门	2024-05-08 11:23:57	\N
346	管理员远程解除报警	2024-05-08 11:24:25	\N
347	管理员远程开门	2024-05-08 16:55:57	\N
348	管理员远程解除报警	2024-05-08 16:56:51	\N
349	管理员远程开门	2024-05-09 18:07:57	\N
350	管理员远程开门	2024-05-09 18:10:43	\N
351	管理员远程解除报警	2024-05-09 18:13:03	\N
352	管理员远程解除报警	2024-05-09 18:15:14	\N
353	管理员远程解除报警	2024-05-13 12:49:39	\N
354	管理员远程开门	2024-05-13 15:39:13	\N
355	管理员远程解除报警	2024-05-13 15:42:08	\N
356	管理员远程开门	2024-05-15 11:12:10	\N
357	管理员远程解除报警	2024-05-15 11:21:29	\N
358	管理员远程开门	2024-05-16 12:30:46	\N
359	管理员远程解除报警	2024-05-16 12:39:10	\N
360	管理员远程开门	2024-05-16 17:31:43	\N
361	管理员远程解除报警	2024-05-16 17:47:59	\N
362	管理员远程解除报警	2024-05-16 17:48:13	\N
363	管理员远程开门	2024-05-21 14:31:21	\N
364	管理员远程解除报警	2024-05-21 14:56:11	\N
365	管理员远程开门	2024-05-22 14:05:26	\N
366	管理员远程解除报警	2024-05-22 14:44:00	\N
367	管理员远程开门	2024-05-23 13:56:11	\N
368	管理员远程解除报警	2024-05-23 13:57:11	\N
369	管理员远程解除报警	2024-05-23 14:01:54	\N
370	管理员远程开门	2024-05-23 14:03:16	\N
371	管理员远程解除报警	2024-05-23 14:03:55	\N
372	管理员远程开门	2024-05-23 14:41:23	\N
373	管理员远程开门	2024-05-23 14:44:22	\N
374	管理员远程开门	2024-05-23 14:45:12	\N
375	管理员远程解除报警	2024-05-23 14:47:25	\N
376	管理员远程解除报警	2024-05-23 14:48:11	\N
377	管理员远程开门	2024-05-23 15:38:26	\N
378	管理员远程开门	2024-05-23 15:40:54	\N
379	管理员远程解除报警	2024-05-23 15:51:29	\N
380	管理员远程解除报警	2024-05-23 15:51:43	\N
381	管理员远程解除报警	2024-05-24 11:47:04	\N
382	管理员远程开门	2024-05-24 13:44:38	\N
383	管理员远程解除报警	2024-05-24 13:47:02	\N
384	管理员远程解除报警	2024-05-27 14:00:42	\N
385	管理员远程开门	2024-05-27 14:04:29	\N
386	管理员远程解除报警	2024-05-27 14:10:35	\N
387	管理员远程开门	2024-05-30 08:47:04	\N
388	管理员远程解除报警	2024-05-30 09:27:18	\N
389	管理员远程开门	2024-05-30 09:32:24	\N
390	管理员远程解除报警	2024-05-30 09:45:54	\N
391	管理员远程解除报警	2024-05-30 12:06:41	\N
392	管理员远程解除报警	2024-05-30 12:08:10	\N
393	重启管理系统！	2024-05-30 12:08:23	\N
394	管理员远程开门	2024-06-02 09:36:47	\N
395	管理员远程解除报警	2024-06-02 09:49:35	\N
396	管理员远程解除报警	2024-06-02 09:58:04	\N
397	管理员远程开门	2024-06-02 11:03:45	\N
398	管理员远程解除报警	2024-06-02 11:08:47	\N
399	管理员远程开门	2024-06-03 15:06:32	\N
400	管理员远程解除报警	2024-06-03 15:32:13	\N
401	管理员远程开门	2024-06-05 17:01:02	\N
402	管理员远程解除报警	2024-06-05 17:16:47	\N
403	管理员远程解除报警	2024-06-07 10:48:58	\N
404	管理员远程开门	2024-06-07 13:28:39	\N
405	管理员远程开门	2024-06-08 09:33:10	\N
406	管理员远程解除报警	2024-06-08 09:38:27	\N
407	管理员远程开门	2024-06-10 13:48:42	\N
408	管理员远程开门	2024-06-10 14:20:14	\N
409	管理员远程解除报警	2024-06-10 14:21:21	\N
410	管理员远程开门	2024-06-11 11:39:45	\N
411	管理员远程解除报警	2024-06-11 11:59:14	\N
412	管理员远程开门	2024-06-12 14:29:44	\N
413	管理员远程解除报警	2024-06-12 14:31:11	\N
414	管理员远程开门	2024-06-12 16:56:54	\N
415	管理员远程解除报警	2024-06-12 17:25:02	\N
416	管理员远程开门	2024-06-12 19:19:03	\N
417	管理员远程解除报警	2024-06-12 20:36:13	\N
418	管理员远程开门	2024-06-14 10:33:42	\N
419	管理员远程开门	2024-06-14 10:36:06	\N
420	管理员远程解除报警	2024-06-14 10:49:34	\N
421	管理员远程解除报警	2024-06-14 10:49:49	\N
422	管理员远程开门	2024-06-20 09:30:06	\N
423	管理员远程解除报警	2024-06-20 09:46:21	\N
424	管理员远程开门	2024-06-20 11:01:44	\N
425	管理员远程解除报警	2024-06-20 11:06:15	\N
426	管理员远程开门	2024-06-24 10:57:07	\N
427	管理员远程解除报警	2024-06-24 11:23:12	\N
428	管理员远程开门	2024-07-02 16:13:14	\N
429	管理员远程解除报警	2024-07-02 16:14:23	\N
430	管理员远程开门	2024-07-15 09:45:37	\N
431	管理员远程解除报警	2024-07-15 09:50:52	\N
432	管理员远程开门	2024-07-15 15:34:48	\N
433	管理员远程解除报警	2024-07-15 17:56:55	\N
434	管理员远程开门	2024-07-16 16:54:37	\N
435	管理员远程解除报警	2024-07-16 17:24:02	\N
436	管理员远程开门	2024-07-25 14:36:02	\N
437	管理员远程开门	2024-07-25 14:36:58	\N
438	管理员远程开门	2024-07-25 14:37:38	\N
439	管理员远程解除报警	2024-07-25 14:38:17	\N
440	管理员远程解除报警	2024-07-25 15:09:29	\N
441	管理员远程开门	2024-07-25 16:52:36	\N
442	管理员远程解除报警	2024-07-25 16:54:15	\N
443	管理员远程开门	2024-07-25 16:54:54	\N
444	管理员远程解除报警	2024-07-25 17:02:18	\N
445	重启管理系统！	2024-07-25 17:12:19	\N
446	重启管理系统！	2024-07-26 08:33:07	\N
447	重启管理系统！	2024-07-26 08:33:23	\N
448	管理员远程开门	2024-07-26 08:44:55	\N
449	管理员远程解除报警	2024-07-26 08:46:12	\N
450	重启管理系统！	2024-07-26 08:48:26	\N
452	管理员远程开门	2024-07-26 08:52:18	\N
453	重启管理系统！	2024-07-26 08:52:47	\N
454	管理员远程解除报警	2024-07-26 08:53:47	\N
455	管理员远程开门	2024-07-26 09:00:10	\N
456	管理员远程解除报警	2024-07-26 09:00:37	\N
457	管理员远程开门	2024-07-26 09:05:32	\N
458	管理员远程解除报警	2024-07-26 09:10:11	\N
459	管理员远程解除报警	2024-07-26 10:24:52	\N
460	管理员远程开门	2024-07-26 10:37:58	\N
461	管理员远程解除报警	2024-07-26 10:38:20	\N
462	管理员远程开门	2024-07-26 10:38:32	\N
463	管理员远程开门	2024-07-26 10:39:13	\N
464	管理员远程开门	2024-07-26 10:39:36	\N
465	重启管理系统！	2024-07-26 10:46:56	\N
466	管理员远程开门	2024-07-31 07:59:45	\N
467	管理员远程解除报警	2024-07-31 08:35:58	\N
468	管理员远程解除报警	2024-07-31 08:37:15	\N
469	管理员远程开门	2024-08-01 10:22:18	\N
470	管理员远程开门	2024-08-01 10:26:04	\N
471	管理员远程解除报警	2024-08-01 10:26:35	\N
472	管理员远程开门	2024-08-14 14:04:59	\N
473	管理员远程解除报警	2024-08-14 14:08:47	\N
474	管理员远程解除报警	2024-08-14 14:10:25	\N
475	重启管理系统！	2024-08-14 17:12:52	\N
476	重启管理系统！	2024-08-14 17:13:19	\N
477	重启管理系统！	2024-08-14 17:13:36	\N
478	重启管理系统！	2024-08-15 08:32:42	\N
479	重启管理系统！	2024-08-15 08:33:05	\N
480	管理员远程开门	2024-08-15 10:26:56	\N
481	管理员远程开门	2024-08-15 10:27:40	\N
482	管理员远程解除报警	2024-08-15 10:28:05	\N
483	重启管理系统！	2024-08-15 10:28:16	\N
484	管理员远程开门	2024-08-15 10:29:50	\N
485	管理员远程开门	2024-08-15 10:30:37	\N
486	管理员远程解除报警	2024-08-15 10:31:19	\N
487	管理员远程开门	2024-08-15 10:32:45	\N
488	管理员远程解除报警	2024-08-15 10:33:51	\N
489	管理员远程解除报警	2024-08-15 10:35:52	\N
490	管理员远程开门	2024-08-15 10:41:56	\N
491	管理员远程解除报警	2024-08-15 10:42:49	\N
492	管理员远程解除报警	2024-08-15 10:43:14	\N
493	管理员远程解除报警	2024-08-15 12:04:27	\N
494	管理员远程开门	2024-08-20 10:14:07	\N
495	管理员远程开门	2024-08-20 10:20:49	\N
496	管理员远程开门	2024-08-20 10:25:49	\N
497	管理员远程解除报警	2024-08-20 10:28:31	\N
498	管理员远程解除报警	2024-08-20 10:28:51	\N
499	管理员远程解除报警	2024-08-20 10:29:06	\N
500	管理员远程开门	2024-08-30 17:05:42	\N
501	管理员远程解除报警	2024-08-30 17:11:10	\N
502	管理员远程开门	2024-08-30 17:16:30	\N
503	管理员远程开门	2024-08-30 17:16:31	\N
504	管理员远程解除报警	2024-08-30 17:25:38	\N
505	管理员远程开门	2024-09-02 08:00:30	\N
506	管理员远程开门	2024-09-02 08:28:44	\N
507	管理员远程解除报警	2024-09-02 08:29:10	\N
508	管理员远程开门	2024-09-02 11:00:41	\N
509	管理员远程解除报警	2024-09-02 11:25:41	\N
510	管理员远程开门	2024-09-03 10:54:17	\N
511	管理员远程解除报警	2024-09-03 10:54:53	\N
512	管理员远程开门	2024-09-03 11:56:48	\N
513	管理员远程解除报警	2024-09-03 12:31:43	\N
514	管理员远程开门	2024-09-03 18:42:30	\N
515	管理员远程解除报警	2024-09-03 18:54:47	\N
516	管理员远程开门	2024-09-03 18:55:04	\N
517	管理员远程解除报警	2024-09-03 19:07:04	\N
518	管理员远程解除报警	2024-09-03 19:08:06	\N
519	管理员远程开门	2024-09-04 14:39:54	\N
520	管理员远程开门	2024-09-04 16:51:05	\N
521	管理员远程开门	2024-09-05 08:18:34	\N
522	管理员远程开门	2024-09-06 08:47:32	\N
523	管理员远程开门	2024-09-06 09:52:10	\N
524	管理员远程开门	2024-09-06 11:07:08	\N
525	管理员远程开门	2024-09-06 16:44:23	\N
526	管理员远程开门	2024-09-07 10:05:14	\N
527	管理员远程开门	2024-09-07 10:49:47	\N
528	管理员远程开门	2024-09-07 13:00:49	\N
529	管理员远程开门	2024-09-09 11:16:35	\N
530	管理员远程开门	2024-09-10 08:34:41	\N
531	管理员远程开门	2024-09-10 10:03:11	\N
532	管理员远程开门	2024-09-10 11:08:28	\N
533	管理员远程开门	2024-09-10 15:20:17	\N
534	管理员远程开门	2024-09-11 09:43:16	\N
535	管理员远程开门	2024-09-12 10:00:03	\N
536	管理员远程开门	2024-09-12 17:11:40	\N
537	管理员远程开门	2024-09-12 18:16:40	\N
538	管理员远程开门	2024-09-13 08:52:03	\N
\.


--
-- Data for Name: out_in_record; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.out_in_record (id, isok, name, optype, partner, record_time, self_id, verify_mode) FROM stdin;
2	0	者红鲜	in	侯辉标	2023-02-08 15:43:42	1002	指纹
3	0	侯辉标	in	者红鲜	2023-02-08 15:43:42	1001	指纹
4	1	者红鲜	out	侯辉标	2023-02-08 15:47:21	1002	指纹
5	1	侯辉标	out	者红鲜	2023-02-08 15:47:21	1001	指纹
6	1	者红鲜	in	侯辉标	2023-02-10 15:20:23	1002	指纹
7	1	侯辉标	in	者红鲜	2023-02-10 15:20:23	1001	指纹
8	1	者红鲜	out	侯辉标	2023-02-10 15:27:26	1002	指纹
9	1	侯辉标	out	者红鲜	2023-02-10 15:27:26	1001	指纹
10	1	者红鲜	in	侯辉标	2023-02-13 14:24:57	1002	指纹
11	1	侯辉标	in	者红鲜	2023-02-13 14:24:57	1001	指纹
12	1	侯辉标	out	者红鲜	2023-02-13 14:44:55	1001	指纹
13	1	者红鲜	out	侯辉标	2023-02-13 14:44:55	1002	指纹
14	0	者红鲜	in	侯辉标	2023-02-16 14:55:06	1002	指纹
15	0	侯辉标	in	者红鲜	2023-02-16 14:55:06	1001	指纹
16	0	侯辉标	out	者红鲜	2023-02-16 15:04:50	1001	指纹
17	0	者红鲜	out	侯辉标	2023-02-16 15:04:50	1002	指纹
18	1	侯辉标	in	者红鲜	2023-02-21 14:21:47	1001	指纹
19	1	者红鲜	in	侯辉标	2023-02-21 14:21:47	1002	指纹
20	1	侯辉标	out	者红鲜	2023-02-21 14:40:50	1001	指纹
21	1	者红鲜	out	侯辉标	2023-02-21 14:40:50	1002	指纹
22	1	者红鲜	in	侯辉标	2023-02-24 15:34:36	1002	指纹
23	1	侯辉标	in	者红鲜	2023-02-24 15:34:36	1001	指纹
24	1	者红鲜	out	侯辉标	2023-02-24 15:52:25	1002	指纹
25	1	侯辉标	out	者红鲜	2023-02-24 15:52:25	1001	指纹
26	1	hhb	in	侯辉标	2023-02-26 12:23:55	1008	指纹
27	1	侯辉标	in	hhb	2023-02-26 12:23:55	1001	指纹
28	1	侯辉标	out	hhb	2023-02-26 12:50:52	1001	指纹
29	1	hhb	out	侯辉标	2023-02-26 12:50:52	1008	指纹
30	1	hhb	in	侯辉标	2023-02-26 13:58:08	1008	指纹
31	1	侯辉标	in	hhb	2023-02-26 13:58:08	1001	指纹
32	1	hhb	out	侯辉标	2023-02-26 14:12:28	1008	指纹
33	1	侯辉标	out	hhb	2023-02-26 14:12:28	1001	指纹
34	1	张高明	in	曾元首	2023-03-02 10:17:36	1003	指纹
35	1	曾元首	in	张高明	2023-03-02 10:17:36	1007	指纹
36	1	者红鲜	in	侯辉标	2023-03-02 10:18:11	1002	指纹
37	1	侯辉标	in	者红鲜	2023-03-02 10:18:11	1001	指纹
38	1	者红鲜	out	侯辉标	2023-03-02 10:44:03	1002	指纹
39	1	侯辉标	out	者红鲜	2023-03-02 10:44:03	1001	指纹
40	1	张高明	out	曾元首	2023-03-02 11:42:12	1003	指纹
41	1	曾元首	out	张高明	2023-03-02 11:42:12	1007	指纹
42	1	曾元首	in	张高明	2023-03-06 09:17:24	1007	指纹
43	1	张高明	in	曾元首	2023-03-06 09:17:24	1003	指纹
44	0	张高明	out	曾元首	2023-03-06 10:01:38	1003	指纹
45	0	曾元首	out	张高明	2023-03-06 10:01:38	1007	指纹
46	1	者红鲜	in	侯辉标	2023-03-06 14:57:51	1002	指纹
47	1	侯辉标	in	者红鲜	2023-03-06 14:57:51	1001	指纹
48	1	者红鲜	out	侯辉标	2023-03-06 15:09:43	1002	指纹
49	1	侯辉标	out	者红鲜	2023-03-06 15:09:43	1001	指纹
50	1	者红鲜	in	侯辉标	2023-03-09 10:42:12	1002	指纹
51	1	侯辉标	in	者红鲜	2023-03-09 10:42:12	1001	指纹
52	1	侯辉标	out	者红鲜	2023-03-09 10:53:30	1001	指纹
53	1	者红鲜	out	侯辉标	2023-03-09 10:53:30	1002	指纹
54	1	侯辉标	in	者红鲜	2023-03-10 15:21:49	1001	指纹
55	1	者红鲜	in	侯辉标	2023-03-10 15:21:49	1002	指纹
56	1	侯辉标	out	者红鲜	2023-03-10 15:30:16	1001	指纹
57	1	者红鲜	out	侯辉标	2023-03-10 15:30:16	1002	指纹
58	1	侯辉标	in	者红鲜	2023-03-13 15:57:48	1001	指纹
59	1	者红鲜	in	侯辉标	2023-03-13 15:57:48	1002	指纹
60	1	者红鲜	out	侯辉标	2023-03-13 16:20:04	1002	指纹
61	1	侯辉标	out	者红鲜	2023-03-13 16:20:04	1001	指纹
62	1	侯辉标	in	者红鲜	2023-03-13 16:36:06	1001	指纹
63	1	者红鲜	in	侯辉标	2023-03-13 16:36:06	1002	指纹
64	1	者红鲜	out	侯辉标	2023-03-13 16:54:35	1002	指纹
65	1	侯辉标	out	者红鲜	2023-03-13 16:54:35	1001	指纹
66	0	者红鲜	in	侯辉标	2023-03-14 10:47:09	1002	指纹
67	0	侯辉标	in	者红鲜	2023-03-14 10:47:09	1001	指纹
68	1	者红鲜	out	侯辉标	2023-03-14 10:55:03	1002	指纹
69	1	侯辉标	out	者红鲜	2023-03-14 10:55:03	1001	指纹
70	1	者红鲜	in	侯辉标	2023-03-17 10:10:48	1002	指纹
71	1	侯辉标	in	者红鲜	2023-03-17 10:10:48	1001	指纹
72	1	侯辉标	out	者红鲜	2023-03-17 10:22:27	1001	指纹
73	1	者红鲜	out	侯辉标	2023-03-17 10:22:27	1002	指纹
74	1	者红鲜	in	侯辉标	2023-03-22 09:31:41	1002	指纹
75	1	侯辉标	in	者红鲜	2023-03-22 09:31:41	1001	指纹
76	1	者红鲜	out	侯辉标	2023-03-22 09:37:50	1002	指纹
77	1	侯辉标	out	者红鲜	2023-03-22 09:37:50	1001	指纹
78	1	侯辉标	in	者红鲜	2023-03-24 09:47:01	1001	指纹
79	1	者红鲜	in	侯辉标	2023-03-24 09:47:01	1002	指纹
80	1	者红鲜	out	侯辉标	2023-03-24 09:50:20	1002	指纹
81	1	侯辉标	out	者红鲜	2023-03-24 09:50:20	1001	指纹
82	1	hhb	in	侯辉标	2023-03-24 18:43:44	1008	指纹
83	1	侯辉标	in	hhb	2023-03-24 18:43:44	1001	指纹
84	1	hhb	out	侯辉标	2023-03-24 18:50:01	1008	指纹
85	1	侯辉标	out	hhb	2023-03-24 18:50:01	1001	指纹
86	1	侯辉标	in	者红鲜	2023-03-29 13:58:22	1001	指纹
87	1	者红鲜	in	侯辉标	2023-03-29 13:58:22	1002	指纹
88	1	者红鲜	out	侯辉标	2023-03-29 14:18:00	1002	指纹
89	1	侯辉标	out	者红鲜	2023-03-29 14:18:00	1001	指纹
90	1	者红鲜	in	侯辉标	2023-03-31 14:59:39	1002	指纹
91	1	侯辉标	in	者红鲜	2023-03-31 14:59:39	1001	指纹
92	1	者红鲜	out	侯辉标	2023-03-31 15:03:37	1002	指纹
93	1	侯辉标	out	者红鲜	2023-03-31 15:03:37	1001	指纹
94	1	侯辉标	in	者红鲜	2023-04-04 14:31:23	1001	指纹
95	1	者红鲜	in	侯辉标	2023-04-04 14:31:23	1002	指纹
96	1	侯辉标	out	者红鲜	2023-04-04 14:45:13	1001	指纹
97	1	者红鲜	out	侯辉标	2023-04-04 14:45:13	1002	指纹
98	1	hhb	in	侯辉标	2023-04-05 13:27:12	1008	指纹
99	1	侯辉标	in	hhb	2023-04-05 13:27:12	1001	指纹
100	1	hhb	out	侯辉标	2023-04-05 13:27:40	1008	指纹
101	1	侯辉标	out	hhb	2023-04-05 13:27:40	1001	指纹
102	1	者红鲜	in	侯辉标	2023-04-07 09:20:05	1002	指纹
103	1	侯辉标	in	者红鲜	2023-04-07 09:20:05	1001	指纹
104	0	者红鲜	out	侯辉标	2023-04-07 09:33:54	1002	指纹
105	0	侯辉标	out	者红鲜	2023-04-07 09:33:54	1001	指纹
106	1	侯辉标	in	者红鲜	2023-04-07 11:14:20	1001	指纹
107	1	者红鲜	in	侯辉标	2023-04-07 11:14:20	1002	指纹
108	1	者红鲜	out	侯辉标	2023-04-07 11:37:58	1002	指纹
109	1	侯辉标	out	者红鲜	2023-04-07 11:37:58	1001	指纹
110	1	侯辉标	in	者红鲜	2023-04-10 15:43:39	1001	指纹
111	1	者红鲜	in	侯辉标	2023-04-10 15:43:39	1002	指纹
112	1	侯辉标	out	者红鲜	2023-04-10 16:11:11	1001	指纹
113	1	者红鲜	out	侯辉标	2023-04-10 16:11:11	1002	指纹
114	1	胡文	in	曾元首	2023-04-11 10:13:21	1000333	指纹
115	1	曾元首	in	胡文	2023-04-11 10:13:21	1007	指纹
116	1	曾元首	out	胡文	2023-04-11 11:26:00	1007	指纹
117	1	胡文	out	曾元首	2023-04-11 11:26:00	1000333	指纹
118	1	胡文	in	华聪	2023-04-11 13:53:04	1000333	指纹
119	1	华聪	in	胡文	2023-04-11 13:53:04	1000328	指纹
120	1	尹涔	in	孙艳芳	2023-04-11 13:58:08	1000404	指纹
121	1	孙艳芳	in	尹涔	2023-04-11 13:58:08	1000241	指纹
122	1	孙艳芳	out	尹涔	2023-04-11 14:01:33	1000241	指纹
123	1	尹涔	out	孙艳芳	2023-04-11 14:01:33	1000404	指纹
124	1	胡文	out	华聪	2023-04-11 15:12:18	1000333	指纹
125	1	华聪	out	胡文	2023-04-11 15:12:18	1000328	指纹
126	1	孙艳芳	in	尹涔	2023-04-11 15:14:33	1000241	指纹
127	1	尹涔	in	孙艳芳	2023-04-11 15:14:33	1000404	指纹
128	1	孙艳芳	out	尹涔	2023-04-11 16:21:02	1000241	指纹
129	1	尹涔	out	孙艳芳	2023-04-11 16:21:02	1000404	指纹
130	1	hhb	in	侯辉标	2023-04-11 17:21:33	1008	指纹
131	1	侯辉标	in	hhb	2023-04-11 17:21:33	1001	指纹
132	1	hhb	out	侯辉标	2023-04-11 17:22:55	1008	指纹
133	1	侯辉标	out	hhb	2023-04-11 17:22:55	1001	指纹
134	1	孙艳芳	in	尹涔	2023-04-11 17:29:15	1000241	指纹
135	1	尹涔	in	孙艳芳	2023-04-11 17:29:15	1000404	指纹
136	1	尹涔	out	孙艳芳	2023-04-11 18:19:32	1000404	指纹
137	1	孙艳芳	out	尹涔	2023-04-11 18:19:32	1000241	指纹
138	1	侯辉标	in	者红鲜	2023-04-12 10:07:19	1001	指纹
139	1	者红鲜	in	侯辉标	2023-04-12 10:07:19	1002	指纹
140	1	者红鲜	out	侯辉标	2023-04-12 10:21:53	1002	指纹
141	1	侯辉标	out	者红鲜	2023-04-12 10:21:53	1001	指纹
142	1	胡文	in	华聪	2023-04-13 10:46:27	1000333	指纹
143	1	华聪	in	胡文	2023-04-13 10:46:27	1000328	指纹
144	1	胡文	out	华聪	2023-04-13 11:33:33	1000333	指纹
145	1	华聪	out	胡文	2023-04-13 11:33:33	1000328	指纹
146	1	胡文	in	华聪	2023-04-13 12:47:27	1000333	指纹
147	1	华聪	in	胡文	2023-04-13 12:47:27	1000328	指纹
148	1	胡文	out	华聪	2023-04-13 16:08:24	1000333	指纹
149	1	华聪	out	胡文	2023-04-13 16:08:24	1000328	指纹
150	0	潘盛辉	in	张高明	2023-04-17 15:35:00	1005	指纹
151	0	张高明	in	潘盛辉	2023-04-17 15:35:00	1003	指纹
152	1	蔡满	in	程明涛	2023-04-17 15:39:08	1009	指纹
153	1	程明涛	in	蔡满	2023-04-17 15:39:08	1010	指纹
154	1	程明涛	out	蔡满	2023-04-17 15:44:22	1010	指纹
155	1	蔡满	out	程明涛	2023-04-17 15:44:22	1009	指纹
156	1	孙艳芳	in	尹涔	2023-04-18 09:23:23	1000241	指纹
157	1	尹涔	in	孙艳芳	2023-04-18 09:23:23	1000404	指纹
158	0	孙艳芳	out	尹涔	2023-04-18 09:38:15	1000241	指纹
159	0	尹涔	out	孙艳芳	2023-04-18 09:38:15	1000404	指纹
160	1	孙艳芳	in	尹涔	2023-04-18 09:40:59	1000241	指纹
161	1	尹涔	in	孙艳芳	2023-04-18 09:40:59	1000404	指纹
162	0	孙艳芳	out	尹涔	2023-04-18 10:24:21	1000241	指纹
163	0	尹涔	out	孙艳芳	2023-04-18 10:24:21	1000404	指纹
164	1	曾元首	in	张高明	2023-04-18 11:10:10	1007	指纹
165	1	张高明	in	曾元首	2023-04-18 11:10:10	1003	指纹
166	0	曾元首	out	张高明	2023-04-18 11:16:25	1007	指纹
167	0	张高明	out	曾元首	2023-04-18 11:16:25	1003	指纹
168	1	尹涔	in	孙艳芳	2023-04-18 13:13:40	1000404	指纹
169	1	孙艳芳	in	尹涔	2023-04-18 13:13:40	1000241	指纹
170	0	尹涔	out	孙艳芳	2023-04-18 14:46:25	1000404	指纹
171	0	孙艳芳	out	尹涔	2023-04-18 14:46:25	1000241	指纹
172	1	潘盛辉	in	赵自强	2023-04-19 13:27:31	1005	指纹
173	1	赵自强	in	潘盛辉	2023-04-19 13:27:31	1006	指纹
174	1	赵自强	out	潘盛辉	2023-04-19 13:29:00	1006	指纹
175	1	潘盛辉	out	赵自强	2023-04-19 13:29:00	1005	指纹
176	1	曾元首	in	张高明	2023-04-26 08:23:14	1007	指纹
177	1	张高明	in	曾元首	2023-04-26 08:23:14	1003	指纹
178	1	者红鲜	in	侯辉标	2023-04-26 08:24:18	1002	指纹
179	1	侯辉标	in	者红鲜	2023-04-26 08:24:18	1001	指纹
180	1	曾元首	out	张高明	2023-04-26 08:29:30	1007	指纹
181	1	张高明	out	曾元首	2023-04-26 08:29:30	1003	指纹
182	1	者红鲜	out	侯辉标	2023-04-26 08:30:56	1002	指纹
183	1	侯辉标	out	者红鲜	2023-04-26 08:30:56	1001	指纹
184	1	曾元首	in	张高明	2023-04-26 08:44:37	1007	指纹
185	1	张高明	in	曾元首	2023-04-26 08:44:37	1003	指纹
186	1	曾元首	out	张高明	2023-04-26 09:09:22	1007	指纹
187	1	张高明	out	曾元首	2023-04-26 09:09:22	1003	指纹
188	1	者红鲜	in	侯辉标	2023-05-03 15:37:47	1002	指纹
189	1	侯辉标	in	者红鲜	2023-05-03 15:37:47	1001	指纹
190	1	者红鲜	out	侯辉标	2023-05-03 16:02:46	1002	指纹
191	1	侯辉标	out	者红鲜	2023-05-03 16:02:46	1001	指纹
192	1	侯辉标	in	者红鲜	2023-05-08 14:08:35	1001	指纹
193	1	者红鲜	in	侯辉标	2023-05-08 14:08:35	1002	指纹
194	1	者红鲜	out	侯辉标	2023-05-08 14:11:36	1002	指纹
195	1	侯辉标	out	者红鲜	2023-05-08 14:11:36	1001	指纹
196	1	侯辉标	in	者红鲜	2023-05-15 07:58:04	1001	指纹
197	1	者红鲜	in	侯辉标	2023-05-15 07:58:04	1002	指纹
198	1	者红鲜	out	侯辉标	2023-05-15 08:29:12	1002	指纹
199	1	侯辉标	out	者红鲜	2023-05-15 08:29:12	1001	指纹
200	1	侯辉标	in	者红鲜	2023-05-15 10:26:14	1001	指纹
201	1	者红鲜	in	侯辉标	2023-05-15 10:26:14	1002	指纹
202	1	侯辉标	out	者红鲜	2023-05-15 10:36:01	1001	指纹
203	1	者红鲜	out	侯辉标	2023-05-15 10:36:01	1002	指纹
204	1	者红鲜	in	侯辉标	2023-05-16 09:53:29	1002	指纹
205	1	侯辉标	in	者红鲜	2023-05-16 09:53:29	1001	指纹
206	0	侯辉标	out	者红鲜	2023-05-16 10:05:56	1001	指纹
207	0	者红鲜	out	侯辉标	2023-05-16 10:05:56	1002	指纹
208	1	者红鲜	in	侯辉标	2023-05-26 13:49:30	1002	指纹
209	1	侯辉标	in	者红鲜	2023-05-26 13:49:30	1001	指纹
210	1	者红鲜	out	侯辉标	2023-05-26 14:01:47	1002	指纹
211	1	侯辉标	out	者红鲜	2023-05-26 14:01:47	1001	指纹
212	1	曾元首	in	张高明	2023-05-29 11:15:40	1007	指纹
213	1	张高明	in	曾元首	2023-05-29 11:15:40	1003	指纹
214	0	曾元首	out	张高明	2023-05-29 11:18:59	1007	指纹
215	0	张高明	out	曾元首	2023-05-29 11:18:59	1003	指纹
216	1	侯辉标	in	者红鲜	2023-05-29 14:26:53	1001	指纹
217	1	者红鲜	in	侯辉标	2023-05-29 14:26:53	1002	指纹
218	1	者红鲜	out	侯辉标	2023-05-29 14:30:35	1002	指纹
219	1	侯辉标	out	者红鲜	2023-05-29 14:30:35	1001	指纹
220	1	者红鲜	in	侯辉标	2023-05-30 18:34:21	1002	指纹
221	1	侯辉标	in	者红鲜	2023-05-30 18:34:21	1001	指纹
222	1	者红鲜	out	侯辉标	2023-05-30 18:56:58	1002	指纹
223	1	侯辉标	out	者红鲜	2023-05-30 18:56:58	1001	指纹
224	1	者红鲜	in	侯辉标	2023-05-31 10:37:48	1002	指纹
225	1	侯辉标	in	者红鲜	2023-05-31 10:37:48	1001	指纹
226	1	侯辉标	out	者红鲜	2023-05-31 10:42:48	1001	指纹
227	1	者红鲜	out	侯辉标	2023-05-31 10:42:48	1002	指纹
228	1	曾元首	in	张高明	2023-05-31 17:30:46	1007	指纹
229	1	张高明	in	曾元首	2023-05-31 17:30:46	1003	指纹
230	1	曾元首	out	张高明	2023-05-31 18:11:45	1007	指纹
231	1	张高明	out	曾元首	2023-05-31 18:11:45	1003	指纹
232	1	张高明	in	曾元首	2023-06-01 17:22:10	1003	指纹
233	1	曾元首	in	张高明	2023-06-01 17:22:10	1007	指纹
234	1	张高明	out	曾元首	2023-06-01 17:23:29	1003	指纹
235	1	曾元首	out	张高明	2023-06-01 17:23:29	1007	指纹
236	1	张高明	in	曾元首	2023-06-01 17:25:03	1003	指纹
237	1	曾元首	in	张高明	2023-06-01 17:25:03	1007	指纹
238	1	者红鲜	in	侯辉标	2023-06-09 10:26:35	1002	指纹
239	1	侯辉标	in	者红鲜	2023-06-09 10:26:35	1001	指纹
240	1	侯辉标	out	者红鲜	2023-06-09 10:38:07	1001	指纹
241	1	者红鲜	out	侯辉标	2023-06-09 10:38:07	1002	指纹
242	1	者红鲜	in	侯辉标	2023-06-13 08:44:53	1002	指纹
243	1	侯辉标	in	者红鲜	2023-06-13 08:44:53	1001	指纹
244	1	者红鲜	out	侯辉标	2023-06-13 08:51:16	1002	指纹
245	1	侯辉标	out	者红鲜	2023-06-13 08:51:16	1001	指纹
246	1	侯辉标	in	者红鲜	2023-06-28 10:46:25	1001	指纹
247	1	者红鲜	in	侯辉标	2023-06-28 10:46:25	1002	指纹
248	1	侯辉标	out	者红鲜	2023-06-28 11:01:34	1001	指纹
249	1	者红鲜	out	侯辉标	2023-06-28 11:01:34	1002	指纹
250	1	侯辉标	in	者红鲜	2023-07-07 10:16:46	1001	指纹
251	1	者红鲜	in	侯辉标	2023-07-07 10:16:46	1002	指纹
252	1	者红鲜	out	侯辉标	2023-07-07 10:26:52	1002	指纹
253	1	侯辉标	out	者红鲜	2023-07-07 10:26:52	1001	指纹
254	1	者红鲜	in	侯辉标	2023-07-11 09:33:49	1002	指纹
255	1	侯辉标	in	者红鲜	2023-07-11 09:33:49	1001	指纹
256	1	侯辉标	out	者红鲜	2023-07-11 09:44:32	1001	指纹
257	1	者红鲜	out	侯辉标	2023-07-11 09:44:32	1002	指纹
258	1	者红鲜	in	侯辉标	2023-07-11 11:37:57	1002	指纹
259	1	侯辉标	in	者红鲜	2023-07-11 11:37:57	1001	指纹
260	1	者红鲜	out	侯辉标	2023-07-11 11:45:43	1002	指纹
261	1	侯辉标	out	者红鲜	2023-07-11 11:45:43	1001	指纹
262	1	者红鲜	in	侯辉标	2023-07-18 11:02:20	1002	指纹
263	1	侯辉标	in	者红鲜	2023-07-18 11:02:20	1001	指纹
264	1	侯辉标	out	者红鲜	2023-07-18 11:15:13	1001	指纹
265	1	者红鲜	out	侯辉标	2023-07-18 11:15:13	1002	指纹
266	1	者红鲜	in	侯辉标	2023-07-28 10:23:52	1002	指纹
267	1	侯辉标	in	者红鲜	2023-07-28 10:23:52	1001	指纹
268	1	侯辉标	out	者红鲜	2023-07-28 10:28:02	1001	指纹
269	1	者红鲜	out	侯辉标	2023-07-28 10:28:02	1002	指纹
270	1	者红鲜	in	侯辉标	2023-08-10 09:32:01	1002	指纹
271	1	侯辉标	in	者红鲜	2023-08-10 09:32:01	1001	指纹
272	1	者红鲜	out	侯辉标	2023-08-10 10:07:40	1002	指纹
273	1	侯辉标	out	者红鲜	2023-08-10 10:07:40	1001	指纹
274	1	侯辉标	in	者红鲜	2023-08-17 11:01:08	1001	指纹
275	1	者红鲜	in	侯辉标	2023-08-17 11:01:08	1002	指纹
276	1	者红鲜	out	侯辉标	2023-08-17 11:17:18	1002	指纹
277	1	侯辉标	out	者红鲜	2023-08-17 11:17:18	1001	指纹
278	1	者红鲜	in	侯辉标	2023-08-17 13:49:47	1002	指纹
279	1	侯辉标	in	者红鲜	2023-08-17 13:49:47	1001	指纹
280	1	侯辉标	out	者红鲜	2023-08-17 13:55:49	1001	指纹
281	1	者红鲜	out	侯辉标	2023-08-17 13:55:49	1002	指纹
282	1	侯辉标	in	者红鲜	2023-08-17 13:59:12	1001	指纹
283	1	者红鲜	in	侯辉标	2023-08-17 13:59:12	1002	指纹
284	1	者红鲜	out	侯辉标	2023-08-17 14:08:04	1002	指纹
285	1	侯辉标	out	者红鲜	2023-08-17 14:08:04	1001	指纹
286	1	者红鲜	in	侯辉标	2023-08-23 09:36:39	1002	指纹
287	1	侯辉标	in	者红鲜	2023-08-23 09:36:39	1001	指纹
288	1	者红鲜	out	侯辉标	2023-08-23 09:52:55	1002	指纹
289	1	侯辉标	out	者红鲜	2023-08-23 09:52:55	1001	指纹
290	1	侯辉标	in	者红鲜	2023-08-30 08:51:57	1001	指纹
291	1	者红鲜	in	侯辉标	2023-08-30 08:51:57	1002	指纹
292	1	侯辉标	out	者红鲜	2023-08-30 09:36:30	1001	指纹
293	1	者红鲜	out	侯辉标	2023-08-30 09:36:30	1002	指纹
294	1	侯辉标	in	者红鲜	2023-09-01 13:45:46	1001	指纹
295	1	者红鲜	in	侯辉标	2023-09-01 13:45:46	1002	指纹
296	1	侯辉标	out	者红鲜	2023-09-01 13:56:06	1001	指纹
297	1	者红鲜	out	侯辉标	2023-09-01 13:56:06	1002	指纹
298	1	者红鲜	in	侯辉标	2023-09-05 15:32:57	1002	指纹
299	1	侯辉标	in	者红鲜	2023-09-05 15:32:57	1001	指纹
300	1	者红鲜	out	侯辉标	2023-09-05 16:19:47	1002	指纹
301	1	侯辉标	out	者红鲜	2023-09-05 16:19:47	1001	指纹
302	1	者红鲜	in	侯辉标	2023-09-08 15:21:46	1002	指纹
303	1	侯辉标	in	者红鲜	2023-09-08 15:21:46	1001	指纹
304	1	者红鲜	out	侯辉标	2023-09-08 15:36:18	1002	指纹
305	1	侯辉标	out	者红鲜	2023-09-08 15:36:18	1001	指纹
306	0	侯辉标	in	者红鲜	2023-09-11 13:39:21	1001	指纹
307	0	者红鲜	in	侯辉标	2023-09-11 13:39:21	1002	指纹
308	1	侯辉标	out	者红鲜	2023-09-11 14:06:38	1001	指纹
309	1	者红鲜	out	侯辉标	2023-09-11 14:06:38	1002	指纹
310	1	者红鲜	in	侯辉标	2023-09-15 15:25:03	1002	指纹
311	1	侯辉标	in	者红鲜	2023-09-15 15:25:03	1001	指纹
312	1	者红鲜	out	侯辉标	2023-09-15 15:40:35	1002	指纹
313	1	侯辉标	out	者红鲜	2023-09-15 15:40:35	1001	指纹
314	1	者红鲜	in	侯辉标	2023-09-16 09:57:02	1002	指纹
315	1	侯辉标	in	者红鲜	2023-09-16 09:57:02	1001	指纹
316	1	者红鲜	out	侯辉标	2023-09-16 10:02:34	1002	指纹
317	1	侯辉标	out	者红鲜	2023-09-16 10:02:34	1001	指纹
318	1	者红鲜	in	侯辉标	2023-09-16 10:09:28	1002	指纹
319	1	侯辉标	in	者红鲜	2023-09-16 10:09:28	1001	指纹
320	1	者红鲜	out	侯辉标	2023-09-16 10:18:37	1002	指纹
321	1	侯辉标	out	者红鲜	2023-09-16 10:18:37	1001	指纹
322	1	张高明	in	曾元首	2023-09-19 09:36:08	1003	指纹
323	1	曾元首	in	张高明	2023-09-19 09:36:08	1007	指纹
324	1	张高明	out	曾元首	2023-09-19 10:49:29	1003	指纹
325	1	曾元首	out	张高明	2023-09-19 10:49:29	1007	指纹
326	1	侯辉标	in	者红鲜	2023-09-19 16:00:50	1001	指纹
327	1	者红鲜	in	侯辉标	2023-09-19 16:00:50	1002	指纹
328	1	侯辉标	out	者红鲜	2023-09-19 16:04:02	1001	指纹
329	1	者红鲜	out	侯辉标	2023-09-19 16:04:02	1002	指纹
330	1	者红鲜	in	侯辉标	2023-09-19 16:09:44	1002	指纹
331	1	侯辉标	in	者红鲜	2023-09-19 16:09:44	1001	指纹
332	1	者红鲜	out	侯辉标	2023-09-19 16:10:49	1002	指纹
333	1	侯辉标	out	者红鲜	2023-09-19 16:10:49	1001	指纹
334	1	者红鲜	in	侯辉标	2023-09-20 16:20:28	1002	指纹
335	1	侯辉标	in	者红鲜	2023-09-20 16:20:28	1001	指纹
336	1	侯辉标	out	者红鲜	2023-09-20 16:24:40	1001	指纹
337	1	者红鲜	out	侯辉标	2023-09-20 16:24:40	1002	指纹
338	0	者红鲜	in	侯辉标	2023-09-26 16:55:12	1002	指纹
339	0	侯辉标	in	者红鲜	2023-09-26 16:55:12	1001	指纹
340	1	者红鲜	in	侯辉标	2023-09-27 16:40:47	1002	指纹
341	1	侯辉标	in	者红鲜	2023-09-27 16:40:47	1001	指纹
342	1	侯辉标	out	者红鲜	2023-09-27 16:58:00	1001	指纹
343	1	者红鲜	out	侯辉标	2023-09-27 16:58:00	1002	指纹
344	1	侯辉标	in	者红鲜	2023-10-09 10:09:46	1001	指纹
345	1	者红鲜	in	侯辉标	2023-10-09 10:09:46	1002	指纹
346	1	者红鲜	out	侯辉标	2023-10-09 10:34:38	1002	指纹
347	1	侯辉标	out	者红鲜	2023-10-09 10:34:38	1001	指纹
348	0	者红鲜	in	侯辉标	2023-10-10 09:10:26	1002	指纹
349	0	侯辉标	in	者红鲜	2023-10-10 09:10:26	1001	指纹
350	0	者红鲜	out	侯辉标	2023-10-10 09:51:29	1002	指纹
351	0	侯辉标	out	者红鲜	2023-10-10 09:51:29	1001	指纹
352	1	者红鲜	in	侯辉标	2023-10-17 09:07:27	1002	指纹
353	1	侯辉标	in	者红鲜	2023-10-17 09:07:27	1001	指纹
354	0	侯辉标	out	者红鲜	2023-10-17 09:10:09	1001	指纹
355	0	者红鲜	out	侯辉标	2023-10-17 09:10:09	1002	指纹
356	1	曾元首	in	张高明	2023-10-17 09:20:41	1007	指纹
357	1	张高明	in	曾元首	2023-10-17 09:20:41	1003	指纹
358	1	张高明	out	曾元首	2023-10-17 10:03:54	1003	指纹
359	1	曾元首	out	张高明	2023-10-17 10:03:54	1007	指纹
360	1	者红鲜	in	侯辉标	2023-10-17 14:51:26	1002	指纹
361	1	侯辉标	in	者红鲜	2023-10-17 14:51:26	1001	指纹
362	1	侯辉标	out	者红鲜	2023-10-17 15:15:22	1001	指纹
363	1	者红鲜	out	侯辉标	2023-10-17 15:15:22	1002	指纹
364	1	张高明	in	曾元首	2023-10-18 14:00:33	1003	指纹
365	1	曾元首	in	张高明	2023-10-18 14:00:33	1007	指纹
366	1	曾元首	out	张高明	2023-10-18 14:14:15	1007	指纹
367	1	张高明	out	曾元首	2023-10-18 14:14:15	1003	指纹
368	1	者红鲜	in	侯辉标	2023-10-20 10:09:18	1002	指纹
369	1	侯辉标	in	者红鲜	2023-10-20 10:09:18	1001	指纹
370	1	者红鲜	out	侯辉标	2023-10-20 10:13:26	1002	指纹
371	1	侯辉标	out	者红鲜	2023-10-20 10:13:26	1001	指纹
372	1	者红鲜	in	侯辉标	2023-10-27 13:47:54	1002	指纹
373	1	侯辉标	in	者红鲜	2023-10-27 13:47:54	1001	指纹
374	1	侯辉标	out	者红鲜	2023-10-27 13:55:30	1001	指纹
375	1	者红鲜	out	侯辉标	2023-10-27 13:55:30	1002	指纹
376	1	侯辉标	in	者红鲜	2023-11-03 13:40:47	1001	指纹
377	1	者红鲜	in	侯辉标	2023-11-03 13:40:47	1002	指纹
378	1	者红鲜	out	侯辉标	2023-11-03 13:49:22	1002	指纹
379	1	侯辉标	out	者红鲜	2023-11-03 13:49:22	1001	指纹
380	1	者红鲜	in	侯辉标	2023-11-10 09:37:06	1002	指纹
381	1	侯辉标	in	者红鲜	2023-11-10 09:37:06	1001	指纹
382	1	侯辉标	out	者红鲜	2023-11-10 09:53:37	1001	指纹
383	1	者红鲜	out	侯辉标	2023-11-10 09:53:37	1002	指纹
384	1	者红鲜	in	侯辉标	2023-11-23 15:20:08	1002	指纹
385	1	侯辉标	in	者红鲜	2023-11-23 15:20:08	1001	指纹
386	1	者红鲜	out	侯辉标	2023-11-23 15:41:26	1002	指纹
387	1	侯辉标	out	者红鲜	2023-11-23 15:41:26	1001	指纹
388	1	者红鲜	in	侯辉标	2023-11-30 14:46:13	1002	指纹
389	1	侯辉标	in	者红鲜	2023-11-30 14:46:13	1001	指纹
390	1	者红鲜	out	侯辉标	2023-11-30 14:59:29	1002	指纹
391	1	侯辉标	out	者红鲜	2023-11-30 14:59:29	1001	指纹
392	1	侯辉标	in	者红鲜	2023-12-04 10:44:04	1001	指纹
393	1	者红鲜	in	侯辉标	2023-12-04 10:44:04	1002	指纹
394	1	者红鲜	out	侯辉标	2023-12-04 10:47:56	1002	指纹
395	1	侯辉标	out	者红鲜	2023-12-04 10:47:56	1001	指纹
396	1	者红鲜	in	侯辉标	2023-12-19 15:32:38	1002	指纹
397	1	侯辉标	in	者红鲜	2023-12-19 15:32:38	1001	指纹
398	1	者红鲜	out	侯辉标	2023-12-19 15:48:36	1002	指纹
399	1	侯辉标	out	者红鲜	2023-12-19 15:48:36	1001	指纹
400	1	侯辉标	in	者红鲜	2023-12-25 09:05:21	1001	指纹
401	1	者红鲜	in	侯辉标	2023-12-25 09:05:21	1002	指纹
402	0	者红鲜	out	侯辉标	2023-12-25 09:14:54	1002	指纹
403	0	侯辉标	out	者红鲜	2023-12-25 09:14:54	1001	指纹
404	1	侯辉标	in	者红鲜	2024-01-04 09:45:47	1001	指纹
405	1	者红鲜	in	侯辉标	2024-01-04 09:45:47	1002	指纹
406	1	者红鲜	out	侯辉标	2024-01-04 09:54:42	1002	指纹
407	1	侯辉标	out	者红鲜	2024-01-04 09:54:42	1001	指纹
408	0	者红鲜	in	侯辉标	2024-01-04 10:14:21	1002	指纹
409	0	侯辉标	in	者红鲜	2024-01-04 10:14:21	1001	指纹
410	1	侯辉标	out	者红鲜	2024-01-04 10:16:33	1001	指纹
411	1	者红鲜	out	侯辉标	2024-01-04 10:16:33	1002	指纹
412	1	侯辉标	in	者红鲜	2024-01-06 08:40:29	1001	指纹
413	1	者红鲜	in	侯辉标	2024-01-06 08:40:29	1002	指纹
414	1	者红鲜	out	侯辉标	2024-01-06 08:43:59	1002	指纹
415	1	侯辉标	out	者红鲜	2024-01-06 08:43:59	1001	指纹
416	1	者红鲜	in	侯辉标	2024-01-08 15:21:58	1002	指纹
417	1	侯辉标	in	者红鲜	2024-01-08 15:21:58	1001	指纹
418	1	者红鲜	out	侯辉标	2024-01-08 15:26:11	1002	指纹
419	1	侯辉标	out	者红鲜	2024-01-08 15:26:11	1001	指纹
420	1	者红鲜	in	侯辉标	2024-02-01 15:51:53	1002	指纹
421	1	侯辉标	in	者红鲜	2024-02-01 15:51:53	1001	指纹
422	1	侯辉标	out	者红鲜	2024-02-01 15:57:41	1001	指纹
423	1	者红鲜	out	侯辉标	2024-02-01 15:57:41	1002	指纹
424	1	侯辉标	in	者红鲜	2024-02-19 10:07:02	1001	指纹
425	1	者红鲜	in	侯辉标	2024-02-19 10:07:02	1002	指纹
426	1	侯辉标	out	者红鲜	2024-02-19 10:24:20	1001	指纹
427	1	者红鲜	out	侯辉标	2024-02-19 10:24:20	1002	指纹
428	1	者红鲜	in	侯辉标	2024-02-28 08:48:42	1002	指纹
429	1	侯辉标	in	者红鲜	2024-02-28 08:48:42	1001	指纹
430	1	者红鲜	out	侯辉标	2024-02-28 08:57:04	1002	指纹
431	1	侯辉标	out	者红鲜	2024-02-28 08:57:04	1001	指纹
432	1	者红鲜	in	侯辉标	2024-03-05 10:59:57	1002	指纹
433	1	侯辉标	in	者红鲜	2024-03-05 10:59:57	1001	指纹
434	0	者红鲜	out	侯辉标	2024-03-05 11:11:40	1002	指纹
435	0	侯辉标	out	者红鲜	2024-03-05 11:11:40	1001	指纹
436	1	者红鲜	in	侯辉标	2024-03-13 11:17:02	1002	指纹
437	1	侯辉标	in	者红鲜	2024-03-13 11:17:02	1001	指纹
438	1	者红鲜	out	侯辉标	2024-03-13 11:33:30	1002	指纹
439	1	侯辉标	out	者红鲜	2024-03-13 11:33:30	1001	指纹
440	1	侯辉标	in	者红鲜	2024-03-19 16:42:25	1001	指纹
441	1	者红鲜	in	侯辉标	2024-03-19 16:42:25	1002	指纹
442	0	者红鲜	out	侯辉标	2024-03-19 16:47:03	1002	指纹
443	0	侯辉标	out	者红鲜	2024-03-19 16:47:03	1001	指纹
444	1	张高明	in	曾元首	2024-03-22 13:52:31	1003	指纹
445	1	曾元首	in	张高明	2024-03-22 13:52:31	1007	指纹
446	1	张高明	out	曾元首	2024-03-22 14:06:08	1003	指纹
447	1	曾元首	out	张高明	2024-03-22 14:06:08	1007	指纹
448	1	程明涛	in	侯辉标	2024-03-22 14:09:39	1010	指纹
449	1	侯辉标	in	程明涛	2024-03-22 14:09:39	1001	指纹
450	1	侯辉标	out	程明涛	2024-03-22 14:14:23	1001	指纹
451	1	程明涛	out	侯辉标	2024-03-22 14:14:23	1010	指纹
452	1	潘盛辉	in	赵自强	2024-03-25 11:09:11	1005	指纹
453	1	赵自强	in	潘盛辉	2024-03-25 11:09:11	1006	指纹
454	1	侯辉标	in	者红鲜	2024-03-25 11:09:27	1001	指纹
455	1	者红鲜	in	侯辉标	2024-03-25 11:09:27	1002	指纹
456	1	者红鲜	out	侯辉标	2024-03-25 11:12:26	1002	指纹
457	1	侯辉标	out	者红鲜	2024-03-25 11:12:26	1001	指纹
458	1	潘盛辉	out	赵自强	2024-03-25 11:21:13	1005	指纹
459	1	赵自强	out	潘盛辉	2024-03-25 11:21:13	1006	指纹
460	1	曾元首	in	张高明	2024-03-26 09:18:17	1007	指纹
461	1	张高明	in	曾元首	2024-03-26 09:18:17	1003	指纹
462	0	张高明	out	曾元首	2024-03-26 09:50:18	1003	指纹
463	0	曾元首	out	张高明	2024-03-26 09:50:18	1007	指纹
464	0	张高明	in	曾元首	2024-03-26 09:51:42	1003	指纹
465	0	曾元首	in	张高明	2024-03-26 09:51:42	1007	指纹
466	1	曾元首	out	张高明	2024-03-26 09:52:13	1007	指纹
467	1	张高明	out	曾元首	2024-03-26 09:52:13	1003	指纹
468	1	者红鲜	in	侯辉标	2024-03-26 09:54:31	1002	指纹
469	1	侯辉标	in	者红鲜	2024-03-26 09:54:31	1001	指纹
470	1	侯辉标	out	者红鲜	2024-03-26 10:19:28	1001	指纹
471	1	者红鲜	out	侯辉标	2024-03-26 10:19:28	1002	指纹
472	1	潘盛辉	in	赵自强	2024-03-26 10:38:44	1005	指纹
473	1	赵自强	in	潘盛辉	2024-03-26 10:38:44	1006	指纹
474	1	潘盛辉	out	赵自强	2024-03-26 11:31:08	1005	指纹
475	1	赵自强	out	潘盛辉	2024-03-26 11:31:08	1006	指纹
476	1	侯辉标	in	者红鲜	2024-04-02 14:38:51	1001	指纹
477	1	者红鲜	in	侯辉标	2024-04-02 14:38:51	1002	指纹
478	1	侯辉标	out	者红鲜	2024-04-02 14:45:39	1001	指纹
479	1	者红鲜	out	侯辉标	2024-04-02 14:45:39	1002	指纹
480	1	者红鲜	in	侯辉标	2024-04-08 10:18:07	1002	指纹
481	1	侯辉标	in	者红鲜	2024-04-08 10:18:07	1001	指纹
482	1	侯辉标	out	者红鲜	2024-04-08 10:21:36	1001	指纹
483	1	者红鲜	out	侯辉标	2024-04-08 10:21:36	1002	指纹
484	1	者红鲜	in	侯辉标	2024-04-17 14:23:18	1002	指纹
485	1	侯辉标	in	者红鲜	2024-04-17 14:23:18	1001	指纹
486	1	者红鲜	out	侯辉标	2024-04-17 14:29:16	1002	指纹
487	1	侯辉标	out	者红鲜	2024-04-17 14:29:16	1001	指纹
488	1	者红鲜	in	侯辉标	2024-04-22 13:50:31	1002	指纹
489	1	侯辉标	in	者红鲜	2024-04-22 13:50:31	1001	指纹
490	0	者红鲜	out	侯辉标	2024-04-22 14:04:44	1002	指纹
491	0	侯辉标	out	者红鲜	2024-04-22 14:04:44	1001	指纹
492	0	者红鲜	in	侯辉标	2024-04-22 14:20:39	1002	指纹
493	0	侯辉标	in	者红鲜	2024-04-22 14:20:39	1001	指纹
494	0	侯辉标	in	者红鲜	2024-04-22 14:50:54	1001	指纹
495	0	者红鲜	in	侯辉标	2024-04-22 14:50:54	1002	指纹
496	1	者红鲜	out	侯辉标	2024-04-23 11:26:32	1002	指纹
497	1	侯辉标	out	者红鲜	2024-04-23 11:26:32	1001	指纹
498	1	者红鲜	in	侯辉标	2024-04-23 11:28:39	1002	指纹
499	1	侯辉标	in	者红鲜	2024-04-23 11:28:39	1001	指纹
500	0	者红鲜	out	侯辉标	2024-04-23 11:29:13	1002	指纹
501	0	侯辉标	out	者红鲜	2024-04-23 11:29:13	1001	指纹
502	1	者红鲜	in	侯辉标	2024-04-24 10:54:46	1002	指纹
503	1	侯辉标	in	者红鲜	2024-04-24 10:54:46	1001	指纹
504	0	者红鲜	out	侯辉标	2024-04-24 11:00:50	1002	指纹
505	0	侯辉标	out	者红鲜	2024-04-24 11:00:50	1001	指纹
506	1	侯辉标	in	者红鲜	2024-04-24 11:03:10	1001	指纹
507	1	者红鲜	in	侯辉标	2024-04-24 11:03:10	1002	指纹
508	1	者红鲜	out	侯辉标	2024-04-24 11:07:18	1002	指纹
509	1	侯辉标	out	者红鲜	2024-04-24 11:07:18	1001	指纹
510	1	者红鲜	in	侯辉标	2024-04-25 09:31:27	1002	指纹
511	1	侯辉标	in	者红鲜	2024-04-25 09:31:27	1001	指纹
512	0	者红鲜	out	侯辉标	2024-04-25 09:38:39	1002	指纹
513	0	侯辉标	out	者红鲜	2024-04-25 09:38:39	1001	指纹
514	1	侯辉标	in	者红鲜	2024-04-26 09:28:15	1001	指纹
515	1	者红鲜	in	侯辉标	2024-04-26 09:28:15	1002	指纹
516	1	者红鲜	out	侯辉标	2024-04-26 09:30:09	1002	指纹
517	1	侯辉标	out	者红鲜	2024-04-26 09:30:09	1001	指纹
518	1	温敏	in	张潜	2024-04-26 10:20:27	1001985	指纹
519	1	张潜	in	温敏	2024-04-26 10:20:27	1004731	指纹
520	1	张潜	out	温敏	2024-04-26 10:28:14	1004731	指纹
521	1	温敏	out	张潜	2024-04-26 10:28:14	1001985	指纹
522	0	张潜	in	温敏	2024-04-26 10:28:34	1004731	指纹
523	0	温敏	in	张潜	2024-04-26 10:28:34	1001985	指纹
524	1	张潜	out	温敏	2024-04-26 10:29:03	1004731	指纹
525	1	温敏	out	张潜	2024-04-26 10:29:03	1001985	指纹
526	1	张潜	in	温敏	2024-04-26 10:29:32	1004731	指纹
527	1	温敏	in	张潜	2024-04-26 10:29:32	1001985	指纹
528	1	温敏	out	张潜	2024-04-26 10:30:25	1001985	指纹
529	1	张潜	out	温敏	2024-04-26 10:30:25	1004731	指纹
530	1	张潜	in	温敏	2024-04-26 10:31:31	1004731	指纹
531	1	温敏	in	张潜	2024-04-26 10:31:31	1001985	指纹
532	1	温敏	out	张潜	2024-04-26 10:45:54	1001985	指纹
533	1	张潜	out	温敏	2024-04-26 10:45:54	1004731	指纹
534	1	温敏	in	张潜	2024-04-26 10:50:16	1001985	指纹
535	1	张潜	in	温敏	2024-04-26 10:50:16	1004731	指纹
536	1	温敏	out	张潜	2024-04-26 11:37:46	1001985	指纹
537	1	张潜	out	温敏	2024-04-26 11:37:46	1004731	指纹
538	1	张高明	in	华聪	2024-04-26 13:37:02	1003	指纹
539	1	华聪	in	张高明	2024-04-26 13:37:02	1000328	指纹
540	1	温敏	in	张潜	2024-04-26 14:07:39	1001985	指纹
541	1	张潜	in	温敏	2024-04-26 14:07:39	1004731	指纹
542	1	张潜	out	温敏	2024-04-26 14:18:35	1004731	指纹
543	1	温敏	out	张潜	2024-04-26 14:18:35	1001985	指纹
544	0	华聪	out	张高明	2024-04-26 15:01:15	1000328	指纹
545	0	张高明	out	华聪	2024-04-26 15:01:15	1003	指纹
546	1	侯辉标	in	者红鲜	2024-04-30 09:56:57	1001	指纹
547	1	者红鲜	in	侯辉标	2024-04-30 09:56:57	1002	指纹
548	0	侯辉标	out	者红鲜	2024-04-30 10:30:33	1001	指纹
549	0	者红鲜	out	侯辉标	2024-04-30 10:30:33	1002	指纹
550	1	者红鲜	in	侯辉标	2024-05-06 14:22:48	1002	指纹
551	1	侯辉标	in	者红鲜	2024-05-06 14:22:48	1001	指纹
552	1	者红鲜	out	侯辉标	2024-05-06 14:27:08	1002	指纹
553	1	侯辉标	out	者红鲜	2024-05-06 14:27:08	1001	指纹
554	1	华聪	in	胡文	2024-05-07 13:41:48	1000328	指纹
555	1	胡文	in	华聪	2024-05-07 13:41:48	1000333	指纹
556	1	者红鲜	in	侯辉标	2024-05-07 13:42:26	1002	指纹
557	1	侯辉标	in	者红鲜	2024-05-07 13:42:26	1001	指纹
558	1	者红鲜	out	侯辉标	2024-05-07 13:46:31	1002	指纹
559	1	侯辉标	out	者红鲜	2024-05-07 13:46:31	1001	指纹
560	1	胡文	out	华聪	2024-05-07 14:36:49	1000333	指纹
561	1	华聪	out	胡文	2024-05-07 14:36:49	1000328	指纹
562	1	华聪	in	胡文	2024-05-07 14:37:17	1000328	指纹
563	1	胡文	in	华聪	2024-05-07 14:37:17	1000333	指纹
564	1	华聪	out	胡文	2024-05-07 15:03:19	1000328	指纹
565	1	胡文	out	华聪	2024-05-07 15:03:19	1000333	指纹
566	1	张潜	in	温敏	2024-05-07 15:08:15	1004731	指纹
567	1	温敏	in	张潜	2024-05-07 15:08:15	1001985	指纹
568	1	温敏	out	张潜	2024-05-07 15:42:02	1001985	指纹
569	1	张潜	out	温敏	2024-05-07 15:42:02	1004731	指纹
570	1	温敏	in	张潜	2024-05-07 16:16:36	1001985	指纹
571	1	张潜	in	温敏	2024-05-07 16:16:36	1004731	指纹
572	1	张潜	out	温敏	2024-05-07 16:19:11	1004731	指纹
573	1	温敏	out	张潜	2024-05-07 16:19:11	1001985	指纹
574	1	张潜	in	温敏	2024-05-08 10:21:55	1004731	指纹
575	1	温敏	in	张潜	2024-05-08 10:21:55	1001985	指纹
576	1	温敏	out	张潜	2024-05-08 10:40:31	1001985	指纹
577	1	张潜	out	温敏	2024-05-08 10:40:31	1004731	指纹
578	1	温敏	in	张潜	2024-05-08 10:47:51	1001985	指纹
579	1	张潜	in	温敏	2024-05-08 10:47:51	1004731	指纹
580	1	温敏	out	张潜	2024-05-08 10:54:09	1001985	指纹
581	1	张潜	out	温敏	2024-05-08 10:54:09	1004731	指纹
582	0	张潜	in	温敏	2024-05-08 10:55:18	1004731	指纹
583	0	温敏	in	张潜	2024-05-08 10:55:18	1001985	指纹
584	1	温敏	out	张潜	2024-05-08 10:57:43	1001985	指纹
585	1	张潜	out	温敏	2024-05-08 10:57:43	1004731	指纹
586	1	华聪	in	胡文	2024-05-08 11:00:57	1000328	指纹
587	1	胡文	in	华聪	2024-05-08 11:00:57	1000333	指纹
588	1	华聪	out	胡文	2024-05-08 11:22:02	1000328	指纹
589	1	胡文	out	华聪	2024-05-08 11:22:02	1000333	指纹
590	1	华聪	in	胡文	2024-05-08 11:24:43	1000328	指纹
591	1	胡文	in	华聪	2024-05-08 11:24:43	1000333	指纹
592	1	者红鲜	in	侯辉标	2024-05-08 11:26:12	1002	指纹
593	1	侯辉标	in	者红鲜	2024-05-08 11:26:12	1001	指纹
594	1	者红鲜	out	侯辉标	2024-05-08 11:52:34	1002	指纹
595	1	侯辉标	out	者红鲜	2024-05-08 11:52:34	1001	指纹
596	1	者红鲜	in	侯辉标	2024-05-08 11:54:10	1002	指纹
597	1	侯辉标	in	者红鲜	2024-05-08 11:54:10	1001	指纹
598	1	者红鲜	out	侯辉标	2024-05-08 11:55:55	1002	指纹
599	1	侯辉标	out	者红鲜	2024-05-08 11:55:55	1001	指纹
600	1	张潜	in	温敏	2024-05-08 14:09:28	1004731	指纹
601	1	温敏	in	张潜	2024-05-08 14:09:28	1001985	指纹
602	1	张潜	out	温敏	2024-05-08 16:02:06	1004731	指纹
603	1	温敏	out	张潜	2024-05-08 16:02:06	1001985	指纹
604	1	华聪	out	胡文	2024-05-08 16:56:26	1000328	指纹
605	1	胡文	out	华聪	2024-05-08 16:56:26	1000333	指纹
606	1	华聪	in	胡文	2024-05-08 16:56:59	1000328	指纹
607	1	胡文	in	华聪	2024-05-08 16:56:59	1000333	指纹
608	1	胡文	out	华聪	2024-05-08 18:26:42	1000333	指纹
609	1	华聪	out	胡文	2024-05-08 18:26:42	1000328	指纹
610	1	者红鲜	in	侯辉标	2024-05-10 17:20:08	1002	指纹
611	1	侯辉标	in	者红鲜	2024-05-10 17:20:08	1001	指纹
612	1	者红鲜	out	侯辉标	2024-05-10 17:21:28	1002	指纹
613	1	侯辉标	out	者红鲜	2024-05-10 17:21:28	1001	指纹
614	1	曾元首	in	张高明	2024-05-23 08:34:55	1007	指纹
615	1	张高明	in	曾元首	2024-05-23 08:34:55	1003	指纹
616	1	张高明	out	曾元首	2024-05-23 08:53:19	1003	指纹
617	1	曾元首	out	张高明	2024-05-23 08:53:19	1007	指纹
618	1	华聪	in	张高明	2024-05-23 10:50:25	1000328	指纹
619	1	张高明	in	华聪	2024-05-23 10:50:25	1003	指纹
620	1	张高明	out	华聪	2024-05-23 11:05:24	1003	指纹
621	1	华聪	out	张高明	2024-05-23 11:05:24	1000328	指纹
622	0	华聪	in	张高明	2024-05-23 13:54:49	1000328	指纹
623	0	张高明	in	华聪	2024-05-23 13:54:49	1003	指纹
624	1	华聪	out	张高明	2024-05-23 14:00:44	1000328	指纹
625	1	张高明	out	华聪	2024-05-23 14:00:44	1003	指纹
626	0	张高明	in	华聪	2024-05-23 14:02:26	1003	指纹
627	0	华聪	in	张高明	2024-05-23 14:02:26	1000328	指纹
628	1	华聪	out	张高明	2024-05-23 14:03:41	1000328	指纹
629	1	张高明	out	华聪	2024-05-23 14:03:41	1003	指纹
630	1	张高明	in	华聪	2024-05-23 14:04:04	1003	指纹
631	1	华聪	in	张高明	2024-05-23 14:04:04	1000328	指纹
632	1	张高明	out	华聪	2024-05-23 14:39:02	1003	指纹
633	1	华聪	out	张高明	2024-05-23 14:39:02	1000328	指纹
634	1	曾元首	in	张高明	2024-05-24 10:32:11	1007	指纹
635	1	张高明	in	曾元首	2024-05-24 10:32:11	1003	指纹
636	0	张高明	out	曾元首	2024-05-24 11:43:13	1003	指纹
637	0	曾元首	out	张高明	2024-05-24 11:43:13	1007	指纹
638	1	者红鲜	in	侯辉标	2024-05-30 08:27:17	1002	指纹
639	1	侯辉标	in	者红鲜	2024-05-30 08:27:17	1001	指纹
640	1	侯辉标	out	者红鲜	2024-05-30 08:45:45	1001	指纹
641	1	者红鲜	out	侯辉标	2024-05-30 08:45:45	1002	指纹
642	0	者红鲜	in	侯辉标	2024-06-05 16:59:57	1002	指纹
643	0	侯辉标	in	者红鲜	2024-06-05 16:59:57	1001	指纹
644	1	侯辉标	in	者红鲜	2024-06-07 09:28:14	1001	指纹
645	1	者红鲜	in	侯辉标	2024-06-07 09:28:14	1002	指纹
646	0	者红鲜	out	侯辉标	2024-06-07 09:37:17	1002	指纹
647	0	侯辉标	out	者红鲜	2024-06-07 09:37:17	1001	指纹
648	1	者红鲜	in	侯辉标	2024-06-11 08:50:33	1002	指纹
649	1	侯辉标	in	者红鲜	2024-06-11 08:50:33	1001	指纹
650	1	者红鲜	out	侯辉标	2024-06-11 09:02:25	1002	指纹
651	1	侯辉标	out	者红鲜	2024-06-11 09:02:25	1001	指纹
652	1	者红鲜	in	侯辉标	2024-06-12 14:19:56	1002	指纹
653	1	侯辉标	in	者红鲜	2024-06-12 14:19:56	1001	指纹
654	1	侯辉标	out	者红鲜	2024-06-12 14:28:54	1001	指纹
655	1	者红鲜	out	侯辉标	2024-06-12 14:28:54	1002	指纹
656	1	侯辉标	in	者红鲜	2024-07-02 15:58:30	1001	指纹
657	1	者红鲜	in	侯辉标	2024-07-02 15:58:30	1002	指纹
658	1	者红鲜	out	侯辉标	2024-07-02 16:08:46	1002	指纹
659	1	侯辉标	out	者红鲜	2024-07-02 16:08:46	1001	指纹
660	1	者红鲜	in	侯辉标	2024-07-15 09:40:03	1002	指纹
661	1	侯辉标	in	者红鲜	2024-07-15 09:40:03	1001	指纹
662	0	侯辉标	out	者红鲜	2024-07-15 09:44:34	1001	指纹
663	0	者红鲜	out	侯辉标	2024-07-15 09:44:34	1002	指纹
664	1	侯辉标	in	者红鲜	2024-07-16 16:08:35	1001	指纹
665	1	者红鲜	in	侯辉标	2024-07-16 16:08:35	1002	指纹
666	1	侯辉标	out	者红鲜	2024-07-16 16:12:15	1001	指纹
667	1	者红鲜	out	侯辉标	2024-07-16 16:12:15	1002	指纹
668	1	者红鲜	in	侯辉标	2024-07-17 11:13:17	1002	指纹
669	1	侯辉标	in	者红鲜	2024-07-17 11:13:17	1001	指纹
670	1	者红鲜	out	侯辉标	2024-07-17 11:59:18	1002	指纹
671	1	侯辉标	out	者红鲜	2024-07-17 11:59:18	1001	指纹
672	1	侯辉标	in	者红鲜	2024-07-24 08:58:24	1001	指纹
673	1	者红鲜	in	侯辉标	2024-07-24 08:58:24	1002	指纹
674	1	者红鲜	out	侯辉标	2024-07-24 09:07:14	1002	指纹
675	1	侯辉标	out	者红鲜	2024-07-24 09:07:14	1001	指纹
676	0	张高明	in	曾元首	2024-07-25 14:34:48	1003	指纹
677	0	曾元首	in	张高明	2024-07-25 14:34:48	1007	指纹
678	0	曾元首	out	张高明	2024-07-25 14:36:35	1007	指纹
679	0	张高明	out	曾元首	2024-07-25 14:36:35	1003	指纹
680	1	曾元首	in	张高明	2024-07-25 14:38:36	1007	指纹
681	1	张高明	in	曾元首	2024-07-25 14:38:36	1003	指纹
682	0	曾元首	out	张高明	2024-07-25 15:08:47	1007	指纹
683	0	张高明	out	曾元首	2024-07-25 15:08:47	1003	指纹
684	1	张高明	in	曾元首	2024-07-25 15:09:54	1003	指纹
685	1	曾元首	in	张高明	2024-07-25 15:09:54	1007	指纹
686	1	曾元首	out	张高明	2024-07-25 15:11:05	1007	指纹
687	1	张高明	out	曾元首	2024-07-25 15:11:05	1003	指纹
688	0	侯辉标	in	者红鲜	2024-07-25 16:54:25	1001	指纹
689	0	者红鲜	in	侯辉标	2024-07-25 16:54:25	1002	指纹
690	0	者红鲜	out	侯辉标	2024-07-25 16:55:09	1002	指纹
691	0	侯辉标	out	者红鲜	2024-07-25 16:55:09	1001	指纹
692	0	者红鲜	in	侯辉标	2024-07-25 17:11:41	1002	指纹
693	0	侯辉标	in	者红鲜	2024-07-25 17:11:41	1001	指纹
694	1	侯辉标	in	者红鲜	2024-07-25 17:14:20	1001	指纹
695	1	者红鲜	in	侯辉标	2024-07-25 17:14:20	1002	指纹
696	1	者红鲜	out	侯辉标	2024-07-25 17:15:19	1002	指纹
697	1	侯辉标	out	者红鲜	2024-07-25 17:15:19	1001	指纹
698	0	曾元首	in	张高明	2024-07-26 08:43:59	1007	指纹
699	0	张高明	in	曾元首	2024-07-26 08:43:59	1003	指纹
700	1	曾元首	out	张高明	2024-07-26 08:45:48	1007	指纹
701	1	张高明	out	曾元首	2024-07-26 08:45:48	1003	指纹
702	0	曾元首	in	张高明	2024-07-26 08:46:43	1007	指纹
703	0	张高明	in	曾元首	2024-07-26 08:46:43	1003	指纹
704	0	曾元首	in	张高明	2024-07-26 08:50:04	1007	指纹
705	0	张高明	in	曾元首	2024-07-26 08:50:04	1003	指纹
706	1	曾元首	out	张高明	2024-07-26 08:53:19	1007	指纹
707	1	张高明	out	曾元首	2024-07-26 08:53:19	1003	指纹
708	1	张高明	in	曾元首	2024-07-26 08:54:12	1003	指纹
709	1	曾元首	in	张高明	2024-07-26 08:54:12	1007	指纹
710	1	者红鲜	in	侯辉标	2024-07-26 08:54:59	1002	指纹
711	1	侯辉标	in	者红鲜	2024-07-26 08:54:59	1001	指纹
712	1	曾元首	out	张高明	2024-07-26 08:56:01	1007	指纹
713	1	张高明	out	曾元首	2024-07-26 08:56:01	1003	指纹
714	1	曾元首	in	张高明	2024-07-26 08:56:58	1007	指纹
715	1	张高明	in	曾元首	2024-07-26 08:56:58	1003	指纹
716	0	张高明	out	曾元首	2024-07-26 08:58:32	1003	指纹
717	0	曾元首	out	张高明	2024-07-26 08:58:32	1007	指纹
718	1	者红鲜	out	侯辉标	2024-07-26 08:59:43	1002	指纹
719	1	侯辉标	out	者红鲜	2024-07-26 08:59:43	1001	指纹
720	1	张高明	in	曾元首	2024-07-26 09:01:10	1003	指纹
721	1	曾元首	in	张高明	2024-07-26 09:01:10	1007	指纹
722	1	张高明	out	曾元首	2024-07-26 09:02:56	1003	指纹
723	1	曾元首	out	张高明	2024-07-26 09:02:56	1007	指纹
724	0	张高明	in	曾元首	2024-07-26 09:04:23	1003	指纹
725	0	曾元首	in	张高明	2024-07-26 09:04:23	1007	指纹
726	0	曾元首	out	张高明	2024-07-26 09:07:35	1007	指纹
727	0	张高明	out	曾元首	2024-07-26 09:07:35	1003	指纹
728	0	曾元首	in	张高明	2024-07-26 09:08:13	1007	指纹
729	0	张高明	in	曾元首	2024-07-26 09:08:13	1003	指纹
730	1	曾元首	out	张高明	2024-07-26 09:09:39	1007	指纹
731	1	张高明	out	曾元首	2024-07-26 09:09:39	1003	指纹
732	1	曾元首	in	张高明	2024-07-26 09:11:07	1007	指纹
733	1	张高明	in	曾元首	2024-07-26 09:11:07	1003	指纹
734	1	曾元首	out	张高明	2024-07-26 09:12:17	1007	指纹
735	1	张高明	out	曾元首	2024-07-26 09:12:17	1003	指纹
736	1	张高明	in	曾元首	2024-07-26 09:13:04	1003	指纹
737	1	曾元首	in	张高明	2024-07-26 09:13:04	1007	指纹
738	1	曾元首	out	张高明	2024-07-26 09:14:24	1007	指纹
739	1	张高明	out	曾元首	2024-07-26 09:14:24	1003	指纹
740	0	者红鲜	in	侯辉标	2024-07-26 10:22:26	1002	指纹
741	0	侯辉标	in	者红鲜	2024-07-26 10:22:26	1001	指纹
742	1	曾元首	in	张高明	2024-07-26 10:24:53	1007	指纹
743	1	张高明	in	曾元首	2024-07-26 10:24:53	1003	指纹
744	1	者红鲜	in	侯辉标	2024-07-26 10:30:16	1002	指纹
745	1	侯辉标	in	者红鲜	2024-07-26 10:30:16	1001	指纹
746	1	者红鲜	out	侯辉标	2024-07-26 10:30:43	1002	指纹
747	1	侯辉标	out	者红鲜	2024-07-26 10:30:43	1001	指纹
748	0	曾元首	out	张高明	2024-07-26 10:36:52	1007	指纹
749	0	张高明	out	曾元首	2024-07-26 10:36:52	1003	指纹
750	0	者红鲜	in	侯辉标	2024-07-26 10:38:57	1002	指纹
751	0	侯辉标	in	者红鲜	2024-07-26 10:38:57	1001	指纹
752	1	者红鲜	in	侯辉标	2024-07-26 13:40:57	1002	指纹
753	1	侯辉标	in	者红鲜	2024-07-26 13:40:57	1001	指纹
754	1	侯辉标	out	者红鲜	2024-07-26 13:46:46	1001	指纹
755	1	者红鲜	out	侯辉标	2024-07-26 13:46:46	1002	指纹
756	0	者红鲜	in	侯辉标	2024-08-14 13:55:59	1002	指纹
757	0	侯辉标	in	者红鲜	2024-08-14 13:55:59	1001	指纹
758	1	潘盛辉	in	赵自强	2024-08-14 14:00:10	1005	指纹
759	1	赵自强	in	潘盛辉	2024-08-14 14:00:10	1006	指纹
760	1	潘盛辉	out	赵自强	2024-08-14 14:00:43	1005	指纹
761	1	赵自强	out	潘盛辉	2024-08-14 14:00:43	1006	指纹
762	0	潘盛辉	in	赵自强	2024-08-14 14:01:34	1005	指纹
763	0	赵自强	in	潘盛辉	2024-08-14 14:01:34	1006	指纹
764	1	者红鲜	out	侯辉标	2024-08-14 14:08:05	1002	指纹
765	1	侯辉标	out	者红鲜	2024-08-14 14:08:05	1001	指纹
766	0	华聪	in	张高明	2024-08-15 10:26:15	1000328	指纹
767	0	张高明	in	华聪	2024-08-15 10:26:15	1003	指纹
768	0	华聪	out	张高明	2024-08-15 10:27:15	1000328	指纹
769	0	张高明	out	华聪	2024-08-15 10:27:15	1003	指纹
770	0	华聪	in	张高明	2024-08-15 10:29:14	1000328	指纹
771	0	张高明	in	华聪	2024-08-15 10:29:14	1003	指纹
772	1	华聪	out	张高明	2024-08-15 10:31:00	1000328	指纹
773	1	张高明	out	华聪	2024-08-15 10:31:00	1003	指纹
774	0	华聪	in	张高明	2024-08-15 10:35:06	1000328	指纹
775	0	张高明	in	华聪	2024-08-15 10:35:06	1003	指纹
776	1	华聪	out	张高明	2024-08-15 10:35:28	1000328	指纹
777	1	张高明	out	华聪	2024-08-15 10:35:28	1003	指纹
778	0	华聪	in	张高明	2024-08-15 10:41:42	1000328	指纹
779	0	张高明	in	华聪	2024-08-15 10:41:42	1003	指纹
780	0	张高明	out	华聪	2024-08-15 12:03:10	1003	指纹
781	0	华聪	out	张高明	2024-08-15 12:03:10	1000328	指纹
782	0	侯辉标	in	者红鲜	2024-08-20 10:25:22	1001	指纹
783	0	者红鲜	in	侯辉标	2024-08-20 10:25:22	1002	指纹
784	1	侯辉标	in	者红鲜	2024-08-27 14:39:43	1001	指纹
785	1	者红鲜	in	侯辉标	2024-08-27 14:39:43	1002	指纹
786	1	者红鲜	out	侯辉标	2024-08-27 14:43:46	1002	指纹
787	1	侯辉标	out	者红鲜	2024-08-27 14:43:46	1001	指纹
788	1	者红鲜	in	侯辉标	2024-09-03 10:50:45	1002	指纹
789	1	侯辉标	in	者红鲜	2024-09-03 10:50:45	1001	指纹
790	0	者红鲜	out	侯辉标	2024-09-03 10:53:10	1002	指纹
791	0	侯辉标	out	者红鲜	2024-09-03 10:53:10	1001	指纹
792	0	侯辉标	in	者红鲜	2024-09-03 18:22:48	1001	指纹
793	0	者红鲜	in	侯辉标	2024-09-03 18:22:48	1002	指纹
794	0	曾元首	in	张高明	2024-09-04 08:19:25	1007	指纹
795	0	张高明	in	曾元首	2024-09-04 08:19:25	1003	指纹
796	1	张高明	out	曾元首	2024-09-04 08:20:46	1003	指纹
797	1	曾元首	out	张高明	2024-09-04 08:20:46	1007	指纹
798	0	曾元首	in	张高明	2024-09-04 08:21:28	1007	指纹
799	0	张高明	in	曾元首	2024-09-04 08:21:28	1003	指纹
800	1	张高明	out	曾元首	2024-09-04 08:23:05	1003	指纹
801	1	曾元首	out	张高明	2024-09-04 08:23:05	1007	指纹
802	0	者红鲜	in	侯辉标	2024-09-04 08:27:30	1002	指纹
803	0	侯辉标	in	者红鲜	2024-09-04 08:27:30	1001	指纹
804	1	者红鲜	out	侯辉标	2024-09-04 08:30:22	1002	指纹
805	1	侯辉标	out	者红鲜	2024-09-04 08:30:22	1001	指纹
806	0	曾元首	in	张高明	2024-09-04 08:30:28	1007	指纹
807	0	张高明	in	曾元首	2024-09-04 08:30:28	1003	指纹
808	1	曾元首	out	张高明	2024-09-04 08:47:14	1007	指纹
809	1	张高明	out	曾元首	2024-09-04 08:47:14	1003	指纹
810	0	曾元首	in	张高明	2024-09-04 10:33:32	1007	指纹
811	0	张高明	in	曾元首	2024-09-04 10:33:32	1003	指纹
812	1	张高明	out	曾元首	2024-09-04 10:46:46	1003	指纹
813	1	曾元首	out	张高明	2024-09-04 10:46:46	1007	指纹
814	0	者红鲜	in	侯辉标	2024-09-04 10:49:15	1002	指纹
815	0	侯辉标	in	者红鲜	2024-09-04 10:49:15	1001	指纹
816	1	者红鲜	out	侯辉标	2024-09-04 10:58:09	1002	指纹
817	1	侯辉标	out	者红鲜	2024-09-04 10:58:09	1001	指纹
\.


--
-- Data for Name: point; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.point (id, alarm_level, channel, delay_alarm_time, display_block, is_alarm, is_display, module_id, name, type, type_name, type_sign, unit, val_tablename) FROM stdin;
\.


--
-- Data for Name: point_type; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.point_type (high_content, high_limit, id, limit_content, limit_value, low_content, low_limit, name, sign, unit, value_type_name) FROM stdin;
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.room (id, name, station_id) FROM stdin;
\.


--
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.station (id, address, ip, is_acq, name, remarks, type) FROM stdin;
\.


--
-- Data for Name: station_display; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.station_display (id, display_id, name, parent_id, self_id, type) FROM stdin;
\.


--
-- Data for Name: station_set; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.station_set (id) FROM stdin;
\.


--
-- Data for Name: sys_event; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.sys_event (id, sys_event) FROM stdin;
\.


--
-- Data for Name: sys_set; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.sys_set (id, name, value) FROM stdin;
1	send_data_interval	4
2	saveCount	100
3	centerNumber	13800200500
4	com	COM2
5	alarmNumber	13922707720
7	alarmClientIP	127.0.0.1
8	alarmNumber1	18688118239
10	acq_server_port	9005
14	alarm_delay_time	30
15	sms_server_port	9003
16	alarm_server_port	9009
17	rt_send_port	9007
19	sms_center_port	8901
20	sms_delay_time	1
24	sl_alarm_client_port	18001
25	sl_alarm_seconds	300000000
26	fp_verify_interval	60
28	alarm_seconds	60
29	alarm_delay_check_secs	20
30	reset_alarm_interval	10
27	aqf_status	1
9	acq_server_ip	192.168.1.8
11	web_server_ip	192.168.1.8
12	websocket_server_ip	192.168.1.8
23	sl_alarm_client_ip	192.168.1.8
6	company	新国都
18	sms_center_ip	192.168.1.8
13	video_ip	192.168.1.8
22	video_ip_r	192.168.1.8
21	websocket_server_ip_r	192.168.8.176:8080
31	is_active_slalarm	1
32	is_active_smsalarm	1
\.


--
-- Data for Name: time_sync_op; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.time_sync_op (id, "desc", people, record_time, sync_time) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public."user" (id, department, "group", is_active, last_op_time, last_state, name, partner, partner_id, password, phone_number, post, privileges, remarks, self_id) FROM stdin;
1	\N	\N	1	2023-01-08 19:25:22	in	admin	\N	\N	$2b$12$J7oLxlmsJ2S5j.BjmVlBU.fqztKCaAgbxDQrGRV3iLAaSRh6zdKMa	\N	\N	0	\N	99999
2	\N	\N	1	2023-01-08 19:26:15	in	sa	\N	\N	$2b$12$36vBlqctMX8cHyN/sf7Y0uFL5TqG3.8Is6GNxux53geSbnr/p8WZ6	\N	\N	0	\N	99998
5	CA	A	1	2023-01-09 16:36:14	out	pyz11	\N	\N	1	\N	\N	0	\N	11
3	CA	B	1	2023-01-09 16:36:14	out	pyz1	\N	\N	1	\N	\N	0	\N	1
20	INFO	A	1	2023-04-17 15:44:22	out	蔡满	\N	\N	1	\N	\N	1	\N	1009
4	KEY	A	1	2023-01-09 12:11:05	out	pyz12	\N	\N	1	\N	\N	0	\N	12
13	KEY	A	1	2024-09-04 10:46:46	out	张高明	\N	\N	1	\N	\N	1	\N	1003
12	KEY	B	1	2024-09-04 10:46:46	out	曾元首	\N	\N	1	\N	\N	1	\N	1007
8	CA	B	1	2024-08-14 00:00:00	out	潘盛辉	\N	\N	1	\N	\N	1	\N	1005
9	CA	A	1	2024-08-14 00:00:00	out	赵自强	\N	\N	1	\N	\N	1	\N	1006
11	INFO	B	1	2024-09-04 10:58:09	out	者红鲜	\N	\N	1	\N	\N	1	\N	1002
10	INFO	A	1	2024-09-04 10:58:09	out	侯辉标	\N	\N	1	\N	\N	1	\N	1001
22	CA	B	1	2024-05-08 16:02:06	out	张潜	\N	\N	1	\N	\N	1	\N	1004731
21	CA	A	1	2024-05-08 16:02:06	out	温敏	\N	\N	1	\N	\N	1	\N	1001985
17	KEY	A	1	2024-05-08 18:26:42	out	胡文	\N	\N	1	\N	\N	1	\N	1000333
19	INFO	B	1	2024-03-22 14:14:23	out	程明涛	\N	\N	1	\N	\N	1	\N	1010
18	KEY	B	1	2024-08-15 12:03:10	out	华聪	\N	\N	1	\N	\N	1	\N	1000328
\.


--
-- Data for Name: verification_log; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.verification_log (id, record_time, room, self_id, verify_mode) FROM stdin;
1	2019-08-12 18:59:12	CA机房内门禁	1	1
2	2019-08-12 19:00:02	CA机房内门禁	1	1
3	2019-08-13 19:32:13	CA机房内门禁	1	1
4	2019-08-13 20:24:32	CA机房内门禁	1	1
5	2019-08-14 09:58:16	CA机房内门禁	0	1
6	2019-08-14 09:58:19	CA机房内门禁	1	1
7	2019-08-14 10:00:39	CA机房内门禁	1	1
8	2019-08-14 10:01:30	CA机房内门禁	1	1
9	2019-08-14 10:01:55	CA机房内门禁	0	1
10	2019-08-14 10:02:00	CA机房内门禁	1	1
11	2019-08-14 14:17:41	CA机房内门禁	1	1
12	2019-08-14 14:17:43	CA机房内门禁	0	1
13	2019-08-14 14:19:37	CA机房内门禁	1	1
14	2019-08-14 14:19:39	CA机房内门禁	124	1
15	2019-08-14 14:26:53	CA机房内门禁	1	1
16	2019-08-14 14:29:00	CA机房内门禁	1	1
17	2019-08-14 14:29:03	CA机房内门禁	124	1
18	2019-08-14 14:39:44	CA机房内门禁	1	1
19	2019-08-14 14:41:32	CA机房内门禁	11	1
20	2019-08-14 14:41:34	CA机房内门禁	12	1
21	2019-08-14 15:19:43	CA机房内门禁	11	1
22	2019-08-14 15:19:44	CA机房内门禁	11	1
23	2019-08-14 15:19:46	CA机房内门禁	12	1
24	2019-08-15 09:10:18	CA机房内门禁	11	1
25	2019-08-15 09:10:21	CA机房内门禁	12	1
26	2019-08-15 09:30:17	CA机房内门禁	11	1
27	2019-08-15 09:30:19	CA机房内门禁	12	1
28	2019-08-15 09:41:48	CA机房内门禁	11	1
29	2019-08-15 09:41:50	CA机房内门禁	12	1
30	2019-08-15 10:04:11	CA机房内门禁	1	1
31	2019-08-15 10:04:25	CA机房内门禁	11	1
32	2019-08-15 11:01:02	CA机房内门禁	11	1
33	2019-08-15 11:01:05	CA机房内门禁	12	1
34	2019-08-15 11:47:07	CA机房内门禁	11	1
35	2019-08-15 11:47:09	CA机房内门禁	12	1
36	2019-08-15 11:55:29	CA机房内门禁	11	1
37	2019-08-15 11:55:31	CA机房内门禁	12	1
38	2019-08-15 12:37:14	CA机房内门禁	0	1
39	2019-08-15 18:08:10	CA机房内门禁	11	1
40	2019-08-15 18:08:13	CA机房内门禁	12	1
41	2019-08-15 18:17:49	CA机房内门禁	11	1
42	2019-08-15 18:17:52	CA机房内门禁	12	1
43	2019-08-15 18:46:50	CA机房内门禁	11	1
44	2019-08-15 18:46:52	CA机房内门禁	12	1
45	2019-08-15 19:18:00	CA机房内门禁	11	1
46	2019-08-15 19:18:03	CA机房内门禁	12	1
47	2019-08-22 09:42:01	CA机房内门禁	11	1
48	2019-08-22 09:42:04	CA机房内门禁	12	1
49	2019-08-22 09:48:01	CA机房内门禁	11	1
50	2019-08-22 09:48:02	CA机房内门禁	11	1
51	2019-08-22 09:48:04	CA机房内门禁	12	1
52	2019-08-22 09:56:00	CA机房内门禁	11	1
53	2019-08-22 09:56:03	CA机房内门禁	12	1
54	2019-08-22 10:10:27	CA机房内门禁	11	1
55	2019-08-22 10:10:30	CA机房内门禁	12	1
56	2019-08-22 10:46:06	CA机房内门禁	11	1
57	2019-08-22 10:46:09	CA机房内门禁	12	1
58	2019-08-22 11:05:12	CA机房内门禁	11	1
59	2019-08-22 11:05:15	CA机房内门禁	12	1
60	2019-08-22 11:05:33	CA机房内门禁	11	1
61	2019-08-22 11:05:36	CA机房内门禁	12	1
62	2019-08-22 11:05:45	CA机房内门禁	12	1
63	2019-08-22 11:19:29	CA机房内门禁	11	1
64	2019-08-22 11:19:32	CA机房内门禁	12	1
65	2019-08-22 11:27:09	CA机房内门禁	11	1
66	2019-08-22 11:27:12	CA机房内门禁	12	1
67	2019-08-22 11:42:15	CA机房内门禁	11	1
68	2019-08-22 11:42:18	CA机房内门禁	12	1
69	2019-08-22 14:39:45	CA机房内门禁	11	1
70	2019-08-22 14:39:48	CA机房内门禁	12	1
71	2019-08-22 14:42:21	CA机房内门禁	11	1
72	2019-08-22 14:42:23	CA机房内门禁	12	1
73	2019-08-22 15:03:42	CA机房内门禁	11	1
74	2019-08-22 15:03:45	CA机房内门禁	12	1
75	2019-08-22 15:04:15	CA机房内门禁	11	1
76	2019-08-22 15:04:18	CA机房内门禁	12	1
77	2019-08-22 15:10:17	CA机房内门禁	11	1
78	2019-08-22 15:10:20	CA机房内门禁	12	1
79	2019-08-22 15:23:02	CA机房内门禁	11	1
80	2019-08-22 15:23:06	CA机房内门禁	12	1
81	2019-08-22 15:29:49	CA机房内门禁	11	1
82	2019-08-22 15:29:51	CA机房内门禁	12	1
83	2019-08-22 15:32:55	CA机房内门禁	11	1
84	2019-08-22 15:32:58	CA机房内门禁	12	1
85	2019-08-22 15:56:23	CA机房内门禁	0	1
86	2019-08-22 15:56:27	CA机房内门禁	0	1
87	2019-08-22 15:56:30	CA机房内门禁	0	1
88	2019-08-22 15:56:44	CA机房内门禁	0	1
89	2019-08-22 15:56:47	CA机房内门禁	0	1
90	2019-08-22 15:58:01	CA机房内门禁	2	1
91	2019-08-22 16:04:30	CA机房内门禁	1001	1
92	2019-08-22 16:04:34	CA机房内门禁	1002	1
93	2019-08-22 16:06:39	CA机房内门禁	1002	1
94	2019-08-22 16:06:41	CA机房内门禁	1001	1
95	2019-08-27 11:21:57	CA机房内门禁	0	1
96	2019-08-27 11:22:06	CA机房内门禁	0	1
97	2019-08-27 11:22:27	CA机房内门禁	1001	1
98	2019-08-27 11:22:30	CA机房内门禁	1002	1
99	2019-09-17 22:59:15	CA机房内门禁	11	1
100	2019-09-17 22:59:17	CA机房内门禁	12	1
101	2019-09-17 23:08:25	CA机房内门禁	1	1
102	2019-09-17 23:08:28	CA机房内门禁	12	1
103	2019-09-17 23:10:11	CA机房内门禁	1	1
104	2019-09-17 23:10:23	CA机房内门禁	11	1
105	2019-09-17 23:10:27	CA机房内门禁	12	1
106	2019-09-17 23:20:20	CA机房内门禁	11	1
107	2019-09-17 23:20:22	CA机房内门禁	12	1
108	2019-09-17 23:27:18	CA机房内门禁	11	1
109	2019-09-17 23:27:21	CA机房内门禁	12	1
110	2019-09-17 23:32:52	CA机房内门禁	11	1
111	2019-09-17 23:32:55	CA机房内门禁	12	1
112	2019-09-17 23:38:01	CA机房内门禁	11	1
113	2019-09-17 23:38:03	CA机房内门禁	12	1
114	2019-09-18 00:18:47	CA机房内门禁	11	1
115	2019-09-18 00:18:49	CA机房内门禁	12	1
116	2019-09-18 00:42:34	CA机房内门禁	11	1
117	2019-09-18 00:42:37	CA机房内门禁	12	1
118	2019-09-18 14:43:28	CA机房内门禁	11	1
119	2019-09-18 14:43:30	CA机房内门禁	12	1
120	2019-09-18 14:47:08	CA机房内门禁	11	1
121	2019-09-18 14:47:10	CA机房内门禁	12	1
122	2019-09-18 14:56:53	CA机房内门禁	11	1
123	2019-09-18 14:56:56	CA机房内门禁	12	1
124	2019-09-18 14:59:39	CA机房内门禁	11	1
125	2019-09-18 14:59:40	CA机房内门禁	11	1
126	2019-09-18 14:59:42	CA机房内门禁	12	1
127	2019-09-20 17:33:47	CA机房内门禁	1001	1
128	2019-09-20 17:33:49	CA机房内门禁	1002	1
129	2020-05-14 16:26:36	CA机房内门禁	1001	1
130	2020-05-14 16:26:41	CA机房内门禁	1002	1
131	2020-05-14 16:27:16	CA机房内门禁	0	1
132	2020-05-14 16:27:19	CA机房内门禁	1002	1
133	2020-05-14 16:28:37	CA机房内门禁	1002	1
134	2020-05-14 16:35:45	CA机房内门禁	1002	1
135	2020-05-14 16:35:48	CA机房内门禁	1001	1
136	2020-05-14 16:39:01	CA机房内门禁	1002	1
137	2020-05-14 16:39:04	CA机房内门禁	1001	1
138	2020-05-14 16:44:50	CA机房内门禁	1002	1
139	2020-05-14 16:44:52	CA机房内门禁	1001	1
140	2020-05-15 10:50:59	CA机房内门禁	1002	1
141	2020-05-15 10:51:05	CA机房内门禁	1001	1
142	2020-05-15 10:57:09	CA机房内门禁	1002	1
143	2020-05-15 10:57:14	CA机房内门禁	1001	1
144	2020-05-15 10:59:49	CA机房内门禁	1002	1
145	2020-05-15 10:59:53	CA机房内门禁	1001	1
146	2020-05-15 17:22:20	CA机房内门禁	1001	1
147	2020-05-15 17:22:22	CA机房内门禁	1002	1
148	2020-05-15 17:23:08	CA机房内门禁	1001	1
149	2020-05-15 17:23:11	CA机房内门禁	1002	1
150	2020-05-15 17:24:32	CA机房内门禁	1002	1
151	2020-05-15 17:24:41	CA机房内门禁	1001	1
152	2020-05-15 17:24:50	CA机房内门禁	1002	1
153	2020-05-15 17:26:29	CA机房内门禁	1002	1
154	2020-05-15 17:26:33	CA机房内门禁	1001	1
155	2020-05-16 11:23:50	CA机房内门禁	1000241	1
156	2020-05-16 11:23:54	CA机房内门禁	1000404	1
157	2020-05-16 11:53:21	CA机房内门禁	1000404	1
158	2020-05-16 11:53:25	CA机房内门禁	1000241	1
159	2020-05-16 16:47:14	CA机房内门禁	0	1
160	2020-05-16 16:47:17	CA机房内门禁	1000241	1
161	2020-05-16 16:47:21	CA机房内门禁	1000404	1
162	2020-05-16 17:06:57	CA机房内门禁	1000241	1
163	2020-05-16 17:07:01	CA机房内门禁	1000404	1
164	2020-05-16 17:43:19	CA机房内门禁	1000404	1
165	2020-05-16 17:43:28	CA机房内门禁	1000241	1
166	2020-05-16 17:53:03	CA机房内门禁	1000241	1
167	2020-05-16 17:53:09	CA机房内门禁	1000404	1
168	2020-05-16 17:54:55	CA机房内门禁	1000241	1
169	2020-05-16 17:55:04	CA机房内门禁	1000404	1
170	2020-05-16 17:58:05	CA机房内门禁	1000241	1
171	2020-05-16 17:58:09	CA机房内门禁	1000404	1
172	2020-05-16 18:24:32	CA机房内门禁	1000241	1
173	2020-05-16 18:24:35	CA机房内门禁	1000404	1
174	2020-05-16 18:40:34	CA机房内门禁	1000241	1
175	2020-05-16 18:40:37	CA机房内门禁	1000404	1
176	2020-05-16 18:48:58	CA机房内门禁	0	1
177	2020-05-16 18:49:01	CA机房内门禁	1000241	1
178	2020-05-16 18:49:04	CA机房内门禁	1000404	1
179	2020-05-16 18:57:14	CA机房内门禁	1000404	1
180	2020-05-16 18:57:18	CA机房内门禁	1000241	1
181	2020-05-18 14:07:38	CA机房内门禁	1000404	1
182	2020-05-18 14:07:44	CA机房内门禁	1000241	1
183	2020-05-18 14:54:35	CA机房内门禁	1000404	1
184	2020-05-18 14:54:40	CA机房内门禁	1000241	1
185	2020-05-18 15:12:15	CA机房内门禁	1000241	1
186	2020-05-18 15:12:19	CA机房内门禁	1000404	1
187	2020-05-18 15:15:14	CA机房内门禁	1000241	1
188	2020-05-18 15:15:17	CA机房内门禁	1000404	1
189	2020-05-18 15:17:52	CA机房内门禁	1000241	1
190	2020-05-18 15:17:57	CA机房内门禁	1000404	1
191	2020-05-18 15:20:39	CA机房内门禁	1000241	1
192	2020-05-18 15:20:43	CA机房内门禁	1000404	1
193	2020-05-18 15:22:54	CA机房内门禁	1000241	1
194	2020-05-18 15:22:58	CA机房内门禁	1000404	1
195	2020-05-18 15:25:16	CA机房内门禁	1000404	1
196	2020-05-18 15:25:27	CA机房内门禁	1000241	1
197	2020-05-18 15:44:28	CA机房内门禁	1000404	1
198	2020-05-18 15:44:31	CA机房内门禁	1000241	1
199	2020-05-18 15:46:15	CA机房内门禁	1000241	1
200	2020-05-18 15:47:06	CA机房内门禁	1000241	1
201	2020-05-18 15:47:10	CA机房内门禁	1000404	1
202	2020-05-18 15:48:58	CA机房内门禁	1000404	1
203	2020-05-18 15:49:03	CA机房内门禁	1000241	1
204	2020-05-18 15:51:26	CA机房内门禁	1000241	1
205	2020-05-18 15:51:31	CA机房内门禁	1000404	1
206	2020-05-18 15:52:46	CA机房内门禁	1000241	1
207	2020-05-18 15:52:49	CA机房内门禁	1000404	1
208	2020-05-18 15:53:07	CA机房内门禁	1000241	1
209	2020-05-18 15:53:09	CA机房内门禁	1000404	1
210	2020-05-18 19:59:26	CA机房内门禁	1000241	1
211	2020-05-18 19:59:30	CA机房内门禁	1000404	1
212	2020-05-18 20:00:37	CA机房内门禁	1000241	1
213	2020-05-18 20:00:40	CA机房内门禁	1000404	1
214	2020-05-18 20:01:42	CA机房内门禁	1000241	1
215	2020-05-18 20:01:47	CA机房内门禁	1000404	1
216	2020-05-18 20:02:51	CA机房内门禁	1000241	1
217	2020-05-18 20:02:56	CA机房内门禁	1000404	1
218	2020-05-18 20:03:52	CA机房内门禁	1000241	1
219	2020-05-18 20:03:58	CA机房内门禁	1000404	1
220	2020-05-19 09:24:35	CA机房内门禁	1000241	1
221	2020-05-19 09:24:39	CA机房内门禁	1000404	1
222	2020-05-19 09:25:57	CA机房内门禁	1000241	1
223	2020-05-19 09:26:01	CA机房内门禁	1000404	1
224	2020-05-19 09:28:24	CA机房内门禁	1000241	1
225	2020-05-19 09:28:28	CA机房内门禁	1000404	1
226	2020-05-19 09:34:07	CA机房内门禁	0	1
227	2020-05-19 09:34:09	CA机房内门禁	1000241	1
228	2020-05-19 09:34:12	CA机房内门禁	1000404	1
229	2020-05-19 09:35:32	CA机房内门禁	0	1
230	2020-05-19 09:35:35	CA机房内门禁	1000241	1
231	2020-05-19 09:35:38	CA机房内门禁	1000404	1
232	2020-05-19 09:45:06	CA机房内门禁	1000241	1
233	2020-05-19 09:45:09	CA机房内门禁	1000404	1
234	2020-05-19 09:46:27	CA机房内门禁	1000241	1
235	2020-05-19 09:46:30	CA机房内门禁	1000404	1
236	2020-05-19 09:47:47	CA机房内门禁	1000241	1
237	2020-05-19 09:47:51	CA机房内门禁	1000404	1
238	2020-05-19 09:49:30	CA机房内门禁	1000241	1
239	2020-05-19 09:49:33	CA机房内门禁	1000404	1
240	2020-05-19 09:51:39	CA机房内门禁	1000241	1
241	2020-05-19 09:51:44	CA机房内门禁	1000404	1
242	2020-05-19 09:53:23	CA机房内门禁	1000241	1
243	2020-05-19 09:53:28	CA机房内门禁	1000404	1
244	2020-05-19 09:55:20	CA机房内门禁	1000241	1
245	2020-05-19 09:55:23	CA机房内门禁	1000404	1
246	2020-05-19 10:00:57	CA机房内门禁	1000404	1
247	2020-05-19 10:01:01	CA机房内门禁	1000241	1
248	2020-05-19 10:09:26	CA机房内门禁	1000241	1
249	2020-05-19 10:09:30	CA机房内门禁	1000404	1
250	2020-05-19 10:10:47	CA机房内门禁	1000241	1
251	2020-05-19 10:10:51	CA机房内门禁	1000404	1
252	2020-05-19 13:10:15	CA机房内门禁	1000241	1
253	2020-05-19 13:10:18	CA机房内门禁	1000404	1
254	2020-05-19 13:30:42	CA机房内门禁	1000241	1
255	2020-05-19 13:30:45	CA机房内门禁	1000404	1
256	2020-05-19 13:33:41	CA机房内门禁	1000241	1
257	2020-05-19 13:33:45	CA机房内门禁	1000404	1
258	2020-05-19 13:36:18	CA机房内门禁	1000241	1
259	2020-05-19 13:36:21	CA机房内门禁	1000404	1
260	2020-05-19 13:39:16	CA机房内门禁	1000241	1
261	2020-05-19 13:39:19	CA机房内门禁	1000404	1
262	2020-05-19 13:41:17	CA机房内门禁	1000241	1
263	2020-05-19 13:41:20	CA机房内门禁	1000404	1
264	2020-05-19 13:43:24	CA机房内门禁	1000241	1
265	2020-05-19 13:43:27	CA机房内门禁	1000404	1
266	2020-05-19 15:44:48	CA机房内门禁	1000241	1
267	2020-05-19 15:44:52	CA机房内门禁	1000404	1
268	2020-05-19 15:50:20	CA机房内门禁	1000241	1
269	2020-05-19 15:50:22	CA机房内门禁	1000404	1
270	2020-05-19 16:02:26	CA机房内门禁	1000241	1
271	2020-05-19 16:02:29	CA机房内门禁	1000404	1
272	2020-05-19 17:30:31	CA机房内门禁	1000241	1
273	2020-05-19 17:30:34	CA机房内门禁	1000404	1
274	2020-05-19 17:48:46	CA机房内门禁	1	1
275	2020-05-19 17:48:48	CA机房内门禁	12	1
276	2020-05-19 18:06:18	CA机房内门禁	1	1
277	2020-05-19 18:06:20	CA机房内门禁	12	1
278	2020-05-19 18:30:02	CA机房内门禁	1000241	1
279	2020-05-19 18:30:07	CA机房内门禁	1000404	1
280	2020-05-19 18:32:43	CA机房内门禁	1000241	1
281	2020-05-19 18:32:51	CA机房内门禁	1000404	1
282	2020-05-19 18:44:13	CA机房内门禁	1	1
283	2020-05-19 18:44:16	CA机房内门禁	12	1
284	2020-05-19 18:55:12	CA机房内门禁	1	1
285	2020-05-19 18:55:15	CA机房内门禁	12	1
286	2020-05-19 19:02:00	CA机房内门禁	1	1
287	2020-05-19 19:02:04	CA机房内门禁	12	1
288	2020-05-19 19:06:02	CA机房内门禁	1	1
289	2020-05-19 19:06:05	CA机房内门禁	12	1
290	2020-05-19 19:43:13	CA机房内门禁	0	1
291	2020-05-19 19:43:16	CA机房内门禁	1000241	1
292	2020-05-19 19:43:18	CA机房内门禁	1000404	1
293	2020-05-19 19:45:24	CA机房内门禁	1000241	1
294	2020-05-19 19:45:27	CA机房内门禁	1000404	1
295	2020-05-19 19:46:51	CA机房内门禁	0	1
296	2020-05-19 19:46:54	CA机房内门禁	1000241	1
297	2020-05-19 19:46:58	CA机房内门禁	1000404	1
298	2020-05-19 19:47:11	CA机房内门禁	1000241	1
299	2020-05-19 19:47:14	CA机房内门禁	1000404	1
300	2020-05-19 19:49:01	CA机房内门禁	1000241	1
301	2020-05-19 19:49:06	CA机房内门禁	1000404	1
302	2020-05-19 19:52:00	CA机房内门禁	1000241	1
303	2020-05-19 19:52:03	CA机房内门禁	1000404	1
304	2020-05-19 19:54:34	CA机房内门禁	1000241	1
305	2020-05-19 19:54:38	CA机房内门禁	1000404	1
306	2020-05-19 19:59:12	CA机房内门禁	1000241	1
307	2020-05-19 19:59:14	CA机房内门禁	1000404	1
308	2020-05-20 09:07:19	CA机房内门禁	1000241	1
309	2020-05-20 09:07:22	CA机房内门禁	1000404	1
310	2020-05-20 09:10:36	CA机房内门禁	1000241	1
311	2020-05-20 09:10:41	CA机房内门禁	1000404	1
312	2020-05-20 09:14:35	CA机房内门禁	1000241	1
313	2020-05-20 09:14:39	CA机房内门禁	1000404	1
314	2020-05-20 09:17:17	CA机房内门禁	1000241	1
315	2020-05-20 09:17:19	CA机房内门禁	1000404	1
316	2020-05-20 09:20:46	CA机房内门禁	1000241	1
317	2020-05-20 09:20:51	CA机房内门禁	1000404	1
318	2020-05-20 09:25:59	CA机房内门禁	1000241	1
319	2020-05-20 09:26:03	CA机房内门禁	1000404	1
320	2020-05-20 09:28:33	CA机房内门禁	1000241	1
321	2020-05-20 09:28:35	CA机房内门禁	1000404	1
322	2020-05-20 09:33:21	CA机房内门禁	1000241	1
323	2020-05-20 09:33:24	CA机房内门禁	1000404	1
324	2020-05-20 09:36:11	CA机房内门禁	1000241	1
325	2020-05-20 09:36:16	CA机房内门禁	1000404	1
326	2020-05-20 09:53:06	CA机房内门禁	1000241	1
327	2020-05-20 09:53:09	CA机房内门禁	1000404	1
328	2020-05-20 10:18:23	CA机房内门禁	1000241	1
329	2020-05-20 10:18:26	CA机房内门禁	1000404	1
330	2020-05-20 11:30:27	CA机房内门禁	1	1
331	2020-05-20 11:30:29	CA机房内门禁	12	1
332	2020-05-20 11:31:57	CA机房内门禁	1	1
333	2020-05-20 11:31:59	CA机房内门禁	12	1
334	2020-05-20 11:32:57	CA机房内门禁	1	1
335	2020-05-20 11:32:58	CA机房内门禁	12	1
336	2020-05-20 17:13:29	CA机房内门禁	1	1
337	2020-05-20 17:13:31	CA机房内门禁	12	1
338	2020-05-20 17:15:57	CA机房内门禁	1	1
339	2020-05-20 17:15:59	CA机房内门禁	12	1
340	2020-05-20 17:16:49	CA机房内门禁	1	1
341	2020-05-20 17:16:51	CA机房内门禁	12	1
342	2020-05-20 17:18:21	CA机房内门禁	1	1
343	2020-05-20 17:18:23	CA机房内门禁	12	1
344	2020-05-20 17:25:56	CA机房内门禁	1	1
345	2020-05-20 17:25:59	CA机房内门禁	12	1
346	2020-05-20 17:27:05	CA机房内门禁	1	1
347	2020-05-20 17:27:07	CA机房内门禁	12	1
348	2020-05-20 17:35:36	CA机房内门禁	1000241	1
349	2020-05-20 17:35:38	CA机房内门禁	1000404	1
350	2020-05-20 18:29:25	CA机房内门禁	1000241	1
351	2020-05-20 18:29:27	CA机房内门禁	1000404	1
352	2020-05-20 19:12:04	CA机房内门禁	1000241	1
353	2020-05-20 19:12:09	CA机房内门禁	1000404	1
354	2020-05-20 19:13:33	CA机房内门禁	1000241	1
355	2020-05-20 19:13:36	CA机房内门禁	1000404	1
356	2020-05-20 19:15:01	CA机房内门禁	0	1
357	2020-05-20 19:15:03	CA机房内门禁	1000241	1
358	2020-05-20 19:15:06	CA机房内门禁	1000404	1
359	2020-05-20 19:16:47	CA机房内门禁	1000241	1
360	2020-05-20 19:16:51	CA机房内门禁	1000404	1
361	2020-05-20 19:18:54	CA机房内门禁	1000241	1
362	2020-05-20 19:18:57	CA机房内门禁	1000404	1
363	2020-05-20 19:20:20	CA机房内门禁	1000241	1
364	2020-05-20 19:20:23	CA机房内门禁	1000404	1
365	2020-05-20 19:25:34	CA机房内门禁	1000241	1
366	2020-05-20 19:25:37	CA机房内门禁	1000404	1
367	2020-05-20 21:23:26	CA机房内门禁	1000241	1
368	2020-05-20 21:23:28	CA机房内门禁	1000404	1
369	2020-05-26 09:52:20	CA机房内门禁	0	1
370	2020-05-26 09:52:23	CA机房内门禁	1000241	1
371	2020-05-26 09:52:26	CA机房内门禁	1000404	1
372	2020-05-26 09:59:49	CA机房内门禁	1000241	1
373	2020-05-26 09:59:52	CA机房内门禁	1000404	1
374	2020-05-26 10:06:44	CA机房内门禁	1000241	1
375	2020-05-26 10:06:47	CA机房内门禁	1000404	1
376	2020-05-26 10:08:19	CA机房内门禁	1000241	1
377	2020-05-26 10:08:23	CA机房内门禁	1000404	1
378	2020-05-26 10:24:07	CA机房内门禁	1000241	1
379	2020-05-26 10:24:10	CA机房内门禁	1000404	1
380	2020-05-26 10:48:34	CA机房内门禁	1000241	1
381	2020-05-26 10:48:37	CA机房内门禁	1000404	1
382	2020-05-26 10:55:12	CA机房内门禁	1000241	1
383	2020-05-26 10:55:15	CA机房内门禁	1000404	1
384	2020-05-26 11:11:21	CA机房内门禁	1000241	1
385	2020-05-26 11:11:22	CA机房内门禁	1000404	1
386	2020-05-26 13:53:36	CA机房内门禁	1000241	1
387	2020-05-26 13:53:40	CA机房内门禁	1000404	1
388	2020-05-26 15:28:18	CA机房内门禁	1000241	1
389	2020-05-26 15:28:20	CA机房内门禁	1000404	1
390	2020-05-26 16:03:24	CA机房内门禁	1000241	1
391	2020-05-26 16:03:27	CA机房内门禁	1000404	1
392	2020-05-26 16:16:50	CA机房内门禁	1000241	1
393	2020-05-26 16:16:53	CA机房内门禁	1000404	1
394	2020-05-26 16:57:04	CA机房内门禁	1000241	1
395	2020-05-26 16:57:06	CA机房内门禁	1000404	1
396	2020-06-02 10:15:36	CA机房内门禁	1000241	1
397	2020-06-02 10:15:39	CA机房内门禁	1000404	1
398	2020-06-02 10:17:16	CA机房内门禁	1000241	1
399	2020-06-02 10:17:18	CA机房内门禁	1000404	1
400	2021-12-15 11:42:03	CA机房内门禁	1001	1
401	2021-12-15 11:42:07	CA机房内门禁	1002	1
402	2021-12-15 11:45:27	CA机房内门禁	1002	1
403	2021-12-15 11:45:29	CA机房内门禁	1001	1
404	2021-12-24 16:34:17	CA机房内门禁	1002	1
405	2021-12-24 16:34:20	CA机房内门禁	1001	1
406	2021-12-24 16:50:40	CA机房内门禁	1001	1
407	2021-12-24 16:50:43	CA机房内门禁	1002	1
408	2021-12-29 16:43:35	CA机房内门禁	1005	1
409	2021-12-29 16:43:38	CA机房内门禁	1006	1
410	2021-12-29 17:25:54	CA机房内门禁	1000404	1
411	2021-12-29 17:26:00	CA机房内门禁	10002411	1
412	2021-12-29 17:26:16	CA机房内门禁	1000241	1
413	2022-01-06 09:21:54	CA机房内门禁	1006	1
414	2022-01-06 09:21:56	CA机房内门禁	1005	1
415	2022-01-06 09:23:20	CA机房内门禁	1005	1
416	2022-01-06 09:23:23	CA机房内门禁	1006	1
417	2022-01-06 09:25:08	CA机房内门禁	1005	1
418	2022-01-06 09:25:10	CA机房内门禁	1006	1
419	2022-01-06 09:30:28	CA机房内门禁	1006	1
420	2022-01-06 09:30:30	CA机房内门禁	1005	1
421	2022-01-08 15:33:11	CA机房内门禁	1006	1
422	2022-01-08 15:33:13	CA机房内门禁	1005	1
423	2022-01-08 15:38:40	CA机房内门禁	1005	1
424	2022-01-08 15:38:43	CA机房内门禁	1006	1
425	2022-01-08 15:39:48	CA机房内门禁	1006	1
426	2022-01-08 15:39:51	CA机房内门禁	1005	1
427	2022-01-08 15:40:39	CA机房内门禁	1006	1
428	2022-01-08 15:40:42	CA机房内门禁	1005	1
429	2022-01-08 15:44:04	CA机房内门禁	1005	1
430	2022-01-08 15:44:06	CA机房内门禁	1006	1
431	2022-01-08 15:47:33	CA机房内门禁	1006	1
432	2022-01-08 15:47:35	CA机房内门禁	1005	1
433	2022-01-08 15:51:05	CA机房内门禁	1006	1
434	2022-01-08 15:51:08	CA机房内门禁	1005	1
435	2022-01-08 15:53:25	CA机房内门禁	1006	1
436	2022-01-08 15:53:28	CA机房内门禁	1005	1
437	2022-01-08 15:55:57	CA机房内门禁	1006	1
438	2022-01-08 15:55:59	CA机房内门禁	1005	1
439	2022-01-08 16:01:12	CA机房内门禁	1005	1
440	2022-01-08 16:01:14	CA机房内门禁	1006	1
441	2022-01-08 16:06:36	CA机房内门禁	1006	1
442	2022-01-08 16:06:38	CA机房内门禁	1005	1
443	2022-01-08 16:09:37	CA机房内门禁	1005	1
444	2022-01-08 16:09:39	CA机房内门禁	1006	1
445	2022-03-01 19:24:10	CA机房内门禁	1006	1
446	2022-03-01 19:24:13	CA机房内门禁	1005	1
447	2022-03-01 19:25:20	CA机房内门禁	1005	1
448	2022-03-01 19:25:23	CA机房内门禁	1006	1
449	2022-03-01 19:26:32	CA机房内门禁	1006	1
450	2022-03-01 19:26:35	CA机房内门禁	1005	1
451	2022-03-01 19:27:05	CA机房内门禁	1005	1
452	2022-03-01 19:30:59	CA机房内门禁	1005	1
453	2022-03-01 19:31:01	CA机房内门禁	1006	1
454	2022-03-01 19:32:41	CA机房内门禁	1006	1
455	2022-03-01 19:32:44	CA机房内门禁	1005	1
456	2022-03-01 19:34:45	CA机房内门禁	1006	1
457	2022-03-01 19:34:48	CA机房内门禁	1005	1
458	2022-03-01 19:35:55	CA机房内门禁	1005	1
459	2022-03-01 19:35:57	CA机房内门禁	1006	1
460	2022-03-01 19:44:17	CA机房内门禁	1006	1
461	2022-03-01 19:44:19	CA机房内门禁	1005	1
462	2022-03-01 19:46:14	CA机房内门禁	1006	1
463	2022-03-01 19:46:19	CA机房内门禁	1005	1
464	2022-03-01 19:48:53	CA机房内门禁	1006	1
465	2022-03-01 19:48:57	CA机房内门禁	1005	1
466	2022-03-01 19:49:38	CA机房内门禁	1005	1
467	2022-03-01 19:49:40	CA机房内门禁	1006	1
468	2022-03-01 19:50:48	CA机房内门禁	1006	1
469	2022-03-01 19:51:09	CA机房内门禁	1005	1
470	2022-03-01 19:52:32	CA机房内门禁	1005	1
471	2022-03-01 19:52:34	CA机房内门禁	1006	1
472	2022-03-01 19:53:58	CA机房内门禁	1006	1
473	2022-03-01 19:54:01	CA机房内门禁	1005	1
474	2022-03-01 19:54:27	CA机房内门禁	1005	1
475	2022-03-01 19:54:29	CA机房内门禁	1006	1
476	2022-03-01 19:54:35	CA机房内门禁	1005	1
477	2022-03-01 19:54:37	CA机房内门禁	1006	1
478	2022-03-01 19:58:01	CA机房内门禁	1005	1
479	2022-03-01 19:58:04	CA机房内门禁	1006	1
480	2022-03-05 12:52:25	CA机房内门禁	1005	1
481	2022-03-05 12:52:27	CA机房内门禁	1006	1
482	2022-03-05 13:25:05	CA机房内门禁	1005	1
483	2022-03-05 13:25:15	CA机房内门禁	1006	1
484	2022-03-05 17:36:05	CA机房内门禁	1005	1
485	2022-03-05 17:36:07	CA机房内门禁	1006	1
486	2022-03-05 17:36:09	CA机房内门禁	1001	1
487	2022-03-05 17:51:09	CA机房内门禁	1006	1
488	2022-03-05 17:51:11	CA机房内门禁	1005	1
489	2022-03-07 16:21:56	CA机房内门禁	1006	1
490	2022-03-07 16:21:57	CA机房内门禁	1005	1
491	2022-03-09 08:53:05	CA机房内门禁	1005	1
492	2022-03-09 08:53:07	CA机房内门禁	1006	1
493	2022-03-09 08:54:53	CA机房内门禁	1005	1
494	2022-03-09 08:54:55	CA机房内门禁	1006	1
495	2022-03-09 08:55:42	CA机房内门禁	1005	1
496	2022-03-09 08:55:44	CA机房内门禁	1006	1
497	2022-03-09 08:57:09	CA机房内门禁	1006	1
498	2022-03-09 08:57:12	CA机房内门禁	1005	1
499	2022-03-09 08:58:06	CA机房内门禁	1005	1
500	2022-03-09 08:58:08	CA机房内门禁	1006	1
501	2022-03-09 09:00:07	CA机房内门禁	1005	1
502	2022-03-09 09:00:10	CA机房内门禁	1006	1
503	2022-03-09 09:02:17	CA机房内门禁	1005	1
504	2022-03-09 09:02:19	CA机房内门禁	1006	1
505	2022-03-09 09:05:26	CA机房内门禁	1006	1
506	2022-03-09 09:05:29	CA机房内门禁	1005	1
507	2022-03-09 09:10:01	CA机房内门禁	1006	1
508	2022-03-09 09:10:04	CA机房内门禁	1005	1
509	2022-03-09 09:13:33	CA机房内门禁	1005	1
510	2022-03-09 09:13:35	CA机房内门禁	1006	1
511	2022-03-09 09:18:40	CA机房内门禁	1006	1
512	2022-03-09 09:18:43	CA机房内门禁	1005	1
513	2022-03-09 09:23:13	CA机房内门禁	1006	1
514	2022-03-09 09:23:16	CA机房内门禁	1005	1
515	2022-03-09 09:24:38	CA机房内门禁	1006	1
516	2022-03-09 09:24:41	CA机房内门禁	1005	1
517	2022-03-09 09:26:51	CA机房内门禁	1006	1
518	2022-03-09 09:26:53	CA机房内门禁	1005	1
519	2022-03-09 09:27:06	CA机房内门禁	1006	1
520	2022-03-09 09:27:08	CA机房内门禁	1005	1
521	2022-03-09 09:30:23	CA机房内门禁	1006	1
522	2022-03-09 09:30:26	CA机房内门禁	1005	1
523	2022-03-09 09:33:10	CA机房内门禁	1006	1
524	2022-03-09 09:33:12	CA机房内门禁	1005	1
525	2022-03-09 09:35:50	CA机房内门禁	1005	1
526	2022-03-09 09:35:52	CA机房内门禁	1006	1
527	2022-03-09 09:38:10	CA机房内门禁	1006	1
528	2022-03-09 09:38:12	CA机房内门禁	1005	1
529	2022-03-09 09:40:14	CA机房内门禁	1006	1
530	2022-03-09 09:40:16	CA机房内门禁	1005	1
531	2022-03-24 11:15:26	CA机房内门禁	0	1
532	2022-03-24 16:51:07	CA机房内门禁	1000241	1
533	2022-03-24 16:51:15	CA机房内门禁	10004041	1
534	2022-03-24 16:51:20	CA机房内门禁	1000241	1
535	2022-03-24 16:51:25	CA机房内门禁	10002411	1
536	2022-03-24 16:51:29	CA机房内门禁	1000404	1
537	2022-03-24 17:06:03	CA机房内门禁	10002411	1
538	2022-03-24 17:06:06	CA机房内门禁	1000404	1
539	2022-03-24 17:06:13	CA机房内门禁	10002411	1
540	2022-03-24 17:06:16	CA机房内门禁	1000404	1
541	2022-03-24 17:06:26	CA机房内门禁	10002411	1
542	2022-03-24 17:06:33	CA机房内门禁	10004041	1
543	2022-03-24 17:06:37	CA机房内门禁	1000241	1
544	2022-03-24 17:07:51	CA机房内门禁	10004041	1
545	2022-03-24 17:07:58	CA机房内门禁	1000241	1
546	2022-03-24 17:08:06	CA机房内门禁	10004041	1
547	2022-03-24 17:08:15	CA机房内门禁	1000241	1
548	2022-03-24 17:08:22	CA机房内门禁	10002411	1
549	2022-03-24 17:08:26	CA机房内门禁	1000404	1
550	2022-03-24 17:10:18	CA机房内门禁	10004041	1
551	2022-03-24 17:10:24	CA机房内门禁	1000241	1
552	2022-03-24 17:10:33	CA机房内门禁	1000404	1
553	2022-03-24 17:11:51	CA机房内门禁	1000241	1
554	2022-03-24 17:11:55	CA机房内门禁	1000404	1
555	2022-03-24 18:13:38	CA机房内门禁	0	1
556	2022-03-24 18:13:45	CA机房内门禁	1000241	1
557	2022-03-24 18:13:48	CA机房内门禁	1000404	1
558	2022-03-24 18:17:23	CA机房内门禁	1000241	1
559	2022-03-24 18:17:27	CA机房内门禁	1000404	1
560	2022-03-25 14:21:43	CA机房内门禁	1000241	1
561	2022-03-25 14:21:48	CA机房内门禁	1000404	1
562	2022-03-25 14:28:09	CA机房内门禁	1000241	1
563	2022-03-25 14:28:13	CA机房内门禁	1000404	1
564	2022-03-25 14:45:02	CA机房内门禁	1000241	1
565	2022-03-25 14:45:04	CA机房内门禁	1000404	1
566	2022-03-25 15:25:14	CA机房内门禁	1000241	1
567	2022-03-25 15:25:16	CA机房内门禁	1000404	1
568	2022-03-25 15:28:36	CA机房内门禁	0	1
569	2022-03-25 15:28:40	CA机房内门禁	1000241	1
570	2022-03-25 15:28:44	CA机房内门禁	1000404	1
571	2022-03-25 15:31:21	CA机房内门禁	1000241	1
572	2022-03-25 15:31:24	CA机房内门禁	1000404	1
573	2022-03-25 15:35:30	CA机房内门禁	1000241	1
574	2022-03-25 15:35:34	CA机房内门禁	1000404	1
575	2022-03-25 15:36:34	CA机房内门禁	1000241	1
576	2022-03-25 15:36:37	CA机房内门禁	1000404	1
577	2022-03-25 15:40:52	CA机房内门禁	1000241	1
578	2022-03-25 15:40:55	CA机房内门禁	1000404	1
579	2022-03-25 18:08:29	CA机房内门禁	1000241	1
580	2022-03-25 18:08:31	CA机房内门禁	1000404	1
581	2022-03-25 19:54:51	CA机房内门禁	1000241	1
582	2022-03-25 19:54:53	CA机房内门禁	1000404	1
583	2022-03-26 14:53:26	CA机房内门禁	1000241	1
584	2022-03-26 14:54:19	CA机房内门禁	1000404	1
585	2022-03-26 16:10:15	CA机房内门禁	1000404	1
586	2022-03-26 16:10:20	CA机房内门禁	1000241	1
587	2022-03-26 17:02:52	CA机房内门禁	1000404	1
588	2022-03-26 17:02:58	CA机房内门禁	1000241	1
589	2022-03-26 17:45:00	CA机房内门禁	1000404	1
590	2022-03-26 17:45:03	CA机房内门禁	1000241	1
591	2022-03-28 09:58:33	CA机房内门禁	1000241	1
592	2022-03-28 09:58:37	CA机房内门禁	1000404	1
593	2022-03-28 10:03:18	CA机房内门禁	1000241	1
594	2022-03-28 10:03:20	CA机房内门禁	1000404	1
595	2022-03-28 14:11:48	CA机房内门禁	0	1
596	2022-03-28 14:11:52	CA机房内门禁	1000241	1
597	2022-03-28 14:11:55	CA机房内门禁	1000404	1
598	2022-03-28 17:13:32	CA机房内门禁	1000404	1
599	2022-03-28 17:13:39	CA机房内门禁	1000241	1
600	2022-03-29 11:51:36	CA机房内门禁	1000241	1
601	2022-03-29 11:51:38	CA机房内门禁	1000404	1
602	2022-03-29 11:59:25	CA机房内门禁	1000241	1
603	2022-03-29 11:59:27	CA机房内门禁	1000404	1
604	2022-03-29 16:55:26	CA机房内门禁	1000241	1
605	2022-03-29 16:55:29	CA机房内门禁	1000404	1
606	2022-03-29 16:55:38	CA机房内门禁	1006	1
607	2022-03-29 16:55:40	CA机房内门禁	1005	1
608	2022-03-29 17:01:48	CA机房内门禁	1005	1
609	2022-03-29 17:01:50	CA机房内门禁	1006	1
610	2022-03-29 17:08:40	CA机房内门禁	1005	1
611	2022-03-29 17:08:42	CA机房内门禁	1006	1
612	2022-03-29 17:12:58	CA机房内门禁	1000241	1
613	2022-03-29 17:13:03	CA机房内门禁	1000404	1
614	2022-03-30 15:42:02	CA机房内门禁	1000241	1
615	2022-03-30 15:42:04	CA机房内门禁	1000404	1
616	2022-03-31 16:18:08	CA机房内门禁	1005	1
617	2022-03-31 16:18:10	CA机房内门禁	1006	1
618	2022-04-14 09:55:32	CA机房内门禁	1005	1
619	2022-04-14 09:55:36	CA机房内门禁	1006	1
620	2022-04-19 11:21:38	CA机房内门禁	1005	1
621	2022-04-19 11:21:41	CA机房内门禁	1006	1
622	2022-04-21 14:28:05	CA机房内门禁	1005	1
623	2022-04-21 14:28:07	CA机房内门禁	1006	1
624	2022-04-25 16:23:45	CA机房内门禁	1005	1
625	2022-04-25 16:23:48	CA机房内门禁	1006	1
626	2022-05-17 10:40:20	CA机房内门禁	1005	1
627	2022-05-17 10:40:22	CA机房内门禁	1006	1
628	2022-05-17 11:31:54	CA机房内门禁	1006	1
629	2022-05-17 11:31:56	CA机房内门禁	1005	1
630	2022-05-19 15:38:14	CA机房内门禁	1000404	1
631	2022-05-19 15:38:18	CA机房内门禁	1000241	1
632	2022-05-19 16:02:59	CA机房内门禁	0	1
633	2022-05-19 16:03:16	CA机房内门禁	1000404	1
634	2022-05-19 16:03:21	CA机房内门禁	1000241	1
635	2022-05-19 17:49:47	CA机房内门禁	0	2
636	2022-05-19 17:50:14	CA机房内门禁	1000404	1
637	2022-05-19 17:50:22	CA机房内门禁	1000241	1
638	2023-01-08 14:11:12	CA机房内门禁	1	1
639	2023-01-09 10:59:27	CA机房内门禁	1	1
640	2023-01-09 10:59:29	CA机房内门禁	12	1
641	2023-01-09 11:03:45	CA机房内门禁	1	1
642	2023-01-09 11:03:48	CA机房内门禁	12	1
643	2023-01-09 16:15:09	CA机房内门禁	0	1
644	2023-01-09 16:15:11	CA机房内门禁	0	1
645	2023-01-09 16:15:13	CA机房内门禁	1	1
646	2023-01-09 16:15:15	CA机房内门禁	11	1
647	2023-01-09 17:03:09	CA机房内门禁	1005	1
648	2023-01-09 17:03:11	CA机房内门禁	1006	1
649	2023-01-09 17:07:50	CA机房内门禁	1005	1
650	2023-01-09 17:07:51	CA机房内门禁	1006	1
651	2023-02-06 15:29:04	CA机房内门禁	1006	1
652	2023-02-06 15:29:07	CA机房内门禁	1005	1
653	2023-02-06 15:49:29	CA机房内门禁	1005	1
654	2023-02-06 15:49:33	CA机房内门禁	1006	1
655	2023-02-06 15:59:38	CA机房内门禁	1005	1
656	2023-02-06 15:59:42	CA机房内门禁	1006	1
657	2019-08-07 22:30:47	密钥机房内门禁	1	1
658	2019-08-07 22:30:56	密钥机房内门禁	1	1
659	2019-08-07 22:31:02	密钥机房内门禁	1	1
660	2019-08-07 22:31:07	密钥机房内门禁	1	1
661	2019-08-07 22:41:07	密钥机房内门禁	1	1
662	2019-08-14 15:25:19	密钥机房内门禁	1	1
663	2019-08-16 12:56:03	密钥机房内门禁	11	1
664	2019-08-16 12:56:06	密钥机房内门禁	12	1
665	2019-08-16 14:53:01	密钥机房内门禁	1	1
666	2019-08-22 16:10:28	密钥机房内门禁	1002	1
667	2019-08-22 16:10:30	密钥机房内门禁	1002	1
668	2019-08-22 16:10:33	密钥机房内门禁	1001	1
669	2019-08-27 11:24:28	密钥机房内门禁	1001	1
670	2019-08-27 11:24:30	密钥机房内门禁	1002	1
671	2019-08-27 11:28:17	密钥机房内门禁	0	1
672	2019-08-27 11:28:21	密钥机房内门禁	0	1
673	2019-08-27 11:28:42	密钥机房内门禁	1002	1
674	2019-08-27 11:28:45	密钥机房内门禁	1001	1
675	2019-08-27 15:33:41	密钥机房内门禁	1000143	1
676	2019-08-27 15:33:47	密钥机房内门禁	0	1
677	2019-08-27 15:33:50	密钥机房内门禁	0	1
678	2019-08-27 15:33:52	密钥机房内门禁	1000143	1
679	2019-08-27 15:35:38	密钥机房内门禁	0	1
680	2019-08-27 15:35:40	密钥机房内门禁	0	1
681	2019-08-27 15:35:43	密钥机房内门禁	0	1
682	2019-08-27 15:42:38	密钥机房内门禁	1000143	1
683	2019-08-27 15:49:23	密钥机房内门禁	1000143	1
684	2019-08-27 15:49:29	密钥机房内门禁	1000333	1
685	2019-08-27 15:54:14	密钥机房内门禁	1002331	1
686	2019-08-27 15:54:19	密钥机房内门禁	1000143	1
687	2019-08-27 15:54:30	密钥机房内门禁	1000333	1
688	2019-08-27 15:54:35	密钥机房内门禁	1000143	1
689	2019-08-27 15:56:42	密钥机房内门禁	0	1
690	2019-08-27 15:58:59	密钥机房内门禁	1002331	1
691	2019-08-27 15:59:06	密钥机房内门禁	1000143	1
692	2019-08-27 15:59:15	密钥机房内门禁	1000333	1
693	2019-08-27 15:59:23	密钥机房内门禁	1002331	1
694	2019-08-29 08:58:01	密钥机房内门禁	1002	1
695	2019-08-12 18:55:28	CA机房外门禁	0	1
696	2019-08-12 13:14:17	密钥机房外门禁	0	1
697	2019-08-29 08:58:05	密钥机房内门禁	1001	1
698	2019-08-12 18:58:25	CA机房外门禁	1	1
699	2019-08-12 13:15:32	密钥机房外门禁	1	1
700	2019-08-29 19:25:27	密钥机房内门禁	1000143	1
701	2019-08-12 19:33:38	CA机房外门禁	1	1
702	2019-08-12 13:15:49	密钥机房外门禁	1	1
703	2019-08-29 19:25:30	密钥机房内门禁	1002331	1
704	2019-08-13 15:38:50	CA机房外门禁	1	1
705	2019-08-12 13:16:03	密钥机房外门禁	1	1
706	2019-08-29 19:36:49	密钥机房内门禁	1000143	1
707	2019-08-12 13:21:45	密钥机房外门禁	1	1
708	2019-08-13 18:09:37	CA机房外门禁	1	1
709	2019-08-29 19:36:52	密钥机房内门禁	1002331	1
711	2019-08-13 20:24:42	CA机房外门禁	1	1
710	2019-08-12 17:32:07	密钥机房外门禁	0	1
712	2019-08-29 20:06:24	密钥机房内门禁	1000143	1
713	2019-08-12 17:32:33	密钥机房外门禁	1	1
714	2019-08-13 20:27:43	CA机房外门禁	1	3
715	2019-08-29 20:06:36	密钥机房内门禁	1002331	1
716	2019-08-13 20:28:44	CA机房外门禁	1	3
717	2019-08-13 16:58:07	密钥机房外门禁	1	1
718	2019-08-30 07:26:35	密钥机房内门禁	1001	1
720	2019-08-14 09:12:31	CA机房外门禁	1	1
719	2019-08-13 17:45:33	密钥机房外门禁	0	1
721	2019-08-30 07:26:38	密钥机房内门禁	1002	1
722	2019-08-13 18:09:32	密钥机房外门禁	1	1
723	2019-08-30 08:27:55	密钥机房内门禁	1000143	1
724	2019-08-14 09:58:05	CA机房外门禁	1	1
725	2019-08-13 18:12:10	密钥机房外门禁	0	1
726	2019-08-30 08:28:12	密钥机房内门禁	1002331	1
727	2019-08-14 10:02:08	CA机房外门禁	1	1
728	2019-08-13 19:17:18	密钥机房外门禁	1	1
729	2019-09-16 10:47:49	信息机房内门禁	11	1
730	2019-08-30 08:40:12	密钥机房内门禁	1000143	1
731	2019-08-14 09:46:45	密钥机房外门禁	1	1
732	2019-08-14 10:04:12	CA机房外门禁	1	1
733	2019-09-16 10:47:51	信息机房内门禁	12	1
734	2019-08-30 08:40:17	密钥机房内门禁	1002331	1
735	2019-08-14 10:06:06	CA机房外门禁	1	1
737	2019-08-14 09:51:39	密钥机房外门禁	1	1
736	2019-09-16 10:49:32	信息机房内门禁	11	1
738	2019-08-30 10:02:11	密钥机房内门禁	1000143	1
739	2019-08-14 09:53:03	密钥机房外门禁	1	1
740	2019-08-14 10:08:47	CA机房外门禁	1	1
741	2019-09-16 10:49:34	信息机房内门禁	12	1
742	2019-08-30 10:02:14	密钥机房内门禁	1002331	1
743	2019-09-16 11:03:24	信息机房内门禁	0	1
744	2019-08-14 14:17:19	CA机房外门禁	1	1
745	2019-08-16 12:50:31	密钥机房外门禁	1	1
746	2019-09-04 11:33:25	密钥机房内门禁	1002	1
747	2019-09-16 11:03:28	信息机房内门禁	11	1
748	2019-08-14 14:17:22	CA机房外门禁	124	1
749	2019-08-16 12:55:16	密钥机房外门禁	1	1
750	2019-09-04 11:33:28	密钥机房内门禁	1003	1
751	2019-09-16 11:03:31	信息机房内门禁	12	1
753	2019-08-16 12:55:41	密钥机房外门禁	11	1
752	2019-08-14 14:22:38	CA机房外门禁	1	1
754	2019-09-04 14:05:18	密钥机房内门禁	1002	1
756	2019-08-16 12:55:44	密钥机房外门禁	12	1
760	2019-08-22 16:07:36	密钥机房外门禁	1001	1
764	2019-08-22 16:09:57	密钥机房外门禁	1001	1
768	2019-08-22 16:10:00	密钥机房外门禁	1002	1
771	2019-08-23 11:33:48	密钥机房外门禁	0	1
776	2019-08-27 11:05:59	密钥机房外门禁	1002	1
780	2019-08-27 11:06:02	密钥机房外门禁	1001	1
785	2019-08-27 11:25:42	密钥机房外门禁	1001	1
788	2019-08-27 11:25:44	密钥机房外门禁	1002	1
792	2019-08-27 11:26:12	密钥机房外门禁	1001	1
795	2019-08-27 11:26:19	密钥机房外门禁	1002	1
800	2019-08-27 11:28:25	密钥机房外门禁	1001	1
804	2019-08-27 11:28:28	密钥机房外门禁	1002	1
807	2019-08-27 15:18:02	密钥机房外门禁	0	1
814	2019-08-27 15:18:08	密钥机房外门禁	0	1
817	2019-08-27 15:18:28	密钥机房外门禁	0	1
824	2019-08-27 15:18:32	密钥机房外门禁	0	1
829	2019-08-27 15:18:37	密钥机房外门禁	0	1
833	2019-08-27 15:18:40	密钥机房外门禁	0	1
838	2019-08-27 15:18:43	密钥机房外门禁	0	1
844	2019-08-27 15:24:50	密钥机房外门禁	2	1
848	2019-08-27 15:33:46	密钥机房外门禁	1000143	1
854	2019-08-27 15:36:16	密钥机房外门禁	1002331	1
858	2019-08-27 15:49:04	密钥机房外门禁	1000143	1
863	2019-08-27 15:49:13	密钥机房外门禁	1000333	1
868	2019-08-27 15:50:10	密钥机房外门禁	1000143	1
873	2019-08-27 15:50:14	密钥机房外门禁	1000800	1
879	2019-08-27 15:50:33	密钥机房外门禁	1000143	1
882	2019-08-27 15:50:38	密钥机房外门禁	1000143	1
887	2019-08-27 15:50:44	密钥机房外门禁	1000143	1
892	2019-08-27 15:50:49	密钥机房外门禁	1000143	1
897	2019-08-27 15:50:59	密钥机房外门禁	1000800	1
901	2019-08-27 15:51:05	密钥机房外门禁	1000800	1
904	2019-08-27 15:51:09	密钥机房外门禁	1000143	1
909	2019-08-27 15:52:39	密钥机房外门禁	1000143	1
912	2019-08-27 15:53:12	密钥机房外门禁	1000143	1
916	2019-08-27 15:53:16	密钥机房外门禁	1002331	1
921	2019-08-27 15:53:30	密钥机房外门禁	1000143	1
924	2019-08-27 15:53:36	密钥机房外门禁	1002331	1
928	2019-08-27 15:53:48	密钥机房外门禁	1000143	1
933	2019-08-27 15:53:54	密钥机房外门禁	1000333	1
936	2019-08-27 15:58:56	密钥机房外门禁	1002331	1
941	2019-08-27 15:58:59	密钥机房外门禁	1000333	1
946	2019-08-29 08:51:45	密钥机房外门禁	1002	1
950	2019-08-29 08:53:26	密钥机房外门禁	1001	1
955	2019-08-29 08:53:32	密钥机房外门禁	1002	1
962	2019-08-29 09:22:26	密钥机房外门禁	1001	1
966	2019-08-29 09:22:33	密钥机房外门禁	1002	1
972	2019-08-29 13:37:57	密钥机房外门禁	1001	1
976	2019-08-29 13:38:00	密钥机房外门禁	1000763	1
982	2019-08-29 13:38:26	密钥机房外门禁	1002	1
985	2019-08-29 13:38:27	密钥机房外门禁	0	1
991	2019-08-29 13:40:53	密钥机房外门禁	1001	1
995	2019-08-29 13:40:55	密钥机房外门禁	1000763	1
1000	2019-08-29 19:18:21	密钥机房外门禁	1002331	1
1006	2019-08-29 19:18:24	密钥机房外门禁	1000143	1
1011	2019-08-29 19:26:59	密钥机房外门禁	1002331	1
1016	2019-08-29 19:27:02	密钥机房外门禁	1000143	1
1021	2019-08-29 21:06:27	密钥机房外门禁	1002	1
1027	2019-08-29 21:06:29	密钥机房外门禁	1001	1
1030	2019-08-29 21:59:10	密钥机房外门禁	0	1
1036	2019-08-29 21:59:11	密钥机房外门禁	0	1
1040	2019-08-29 21:59:13	密钥机房外门禁	0	1
1046	2019-08-29 22:28:34	密钥机房外门禁	1001	1
1052	2019-08-29 22:28:36	密钥机房外门禁	1002	1
1055	2019-08-29 23:43:40	密钥机房外门禁	1001	1
1061	2019-08-29 23:43:43	密钥机房外门禁	1002	1
1066	2019-08-30 07:20:52	密钥机房外门禁	1001	1
1071	2019-08-30 07:20:57	密钥机房外门禁	1002	1
1077	2019-08-30 07:23:54	密钥机房外门禁	1001	1
1080	2019-08-30 07:23:56	密钥机房外门禁	1002	1
1087	2019-08-30 08:25:15	密钥机房外门禁	1000143	1
1090	2019-08-30 08:25:21	密钥机房外门禁	1002331	1
1095	2019-08-30 09:29:43	密钥机房外门禁	1000143	1
1100	2019-08-30 09:29:48	密钥机房外门禁	1002331	1
1107	2019-09-04 11:11:58	密钥机房外门禁	2	1
1112	2019-09-04 11:25:35	密钥机房外门禁	0	1
1115	2019-09-04 11:32:58	密钥机房外门禁	1002	1
1122	2019-09-04 11:33:02	密钥机房外门禁	1003	1
1125	2019-09-04 13:58:16	密钥机房外门禁	1002	1
1130	2019-09-04 13:58:18	密钥机房外门禁	1003	1
1137	2019-09-04 13:58:35	密钥机房外门禁	1002	1
1141	2019-09-04 13:58:40	密钥机房外门禁	1003	1
1145	2019-09-04 13:59:03	密钥机房外门禁	1002	1
1150	2019-09-04 13:59:11	密钥机房外门禁	1003	1
1156	2019-09-04 13:59:27	密钥机房外门禁	1003	1
1162	2019-09-04 13:59:30	密钥机房外门禁	1002	1
1166	2019-09-04 13:59:36	密钥机房外门禁	1003	1
1171	2019-09-04 13:59:39	密钥机房外门禁	1003	1
1176	2019-09-04 14:05:07	密钥机房外门禁	1002	1
1180	2019-09-04 14:05:15	密钥机房外门禁	1001	1
1185	2019-09-04 16:14:34	密钥机房外门禁	0	1
1192	2019-09-04 16:14:36	密钥机房外门禁	0	1
1195	2019-09-04 16:14:39	密钥机房外门禁	0	1
1201	2019-09-04 16:18:37	密钥机房外门禁	1002	1
1205	2019-09-04 16:18:40	密钥机房外门禁	1003	1
1212	2019-09-04 16:18:45	密钥机房外门禁	1003	1
1216	2019-09-04 16:18:49	密钥机房外门禁	1003	1
1222	2019-09-04 16:18:52	密钥机房外门禁	1003	1
1227	2019-09-04 16:18:55	密钥机房外门禁	1003	1
1231	2019-09-04 16:19:00	密钥机房外门禁	1003	1
1234	2019-09-04 16:20:39	密钥机房外门禁	1003	1
1239	2019-09-04 16:20:42	密钥机房外门禁	1003	1
1242	2019-09-04 16:20:46	密钥机房外门禁	1002	1
757	2019-08-14 14:24:54	CA机房外门禁	1	1
761	2019-08-14 14:24:57	CA机房外门禁	124	1
763	2019-08-14 14:25:06	CA机房外门禁	1	1
769	2019-08-14 14:25:10	CA机房外门禁	124	1
773	2019-08-14 14:26:32	CA机房外门禁	1	1
775	2019-08-14 14:26:35	CA机房外门禁	124	1
781	2019-08-14 14:38:10	CA机房外门禁	11	1
784	2019-08-14 14:39:29	CA机房外门禁	11	1
787	2019-08-14 14:39:32	CA机房外门禁	12	1
791	2019-08-14 14:59:28	CA机房外门禁	1	1
797	2019-08-14 14:59:31	CA机房外门禁	11	1
799	2019-08-14 14:59:34	CA机房外门禁	12	1
805	2019-08-14 14:59:41	CA机房外门禁	11	1
808	2019-08-14 14:59:44	CA机房外门禁	12	1
812	2019-08-14 15:01:09	CA机房外门禁	11	1
818	2019-08-14 15:01:12	CA机房外门禁	12	1
823	2019-08-14 15:01:24	CA机房外门禁	11	1
827	2019-08-14 15:01:26	CA机房外门禁	0	1
834	2019-08-14 15:01:29	CA机房外门禁	12	1
839	2019-08-14 15:05:30	CA机房外门禁	11	1
842	2019-08-14 15:05:32	CA机房外门禁	12	1
847	2019-08-14 15:18:53	CA机房外门禁	11	1
853	2019-08-14 15:18:56	CA机房外门禁	12	1
857	2019-08-14 15:30:00	CA机房外门禁	11	1
864	2019-08-14 15:30:02	CA机房外门禁	12	1
867	2019-08-15 08:55:01	CA机房外门禁	11	1
872	2019-08-15 08:55:03	CA机房外门禁	0	1
878	2019-08-15 08:55:06	CA机房外门禁	0	1
884	2019-08-15 08:55:09	CA机房外门禁	12	1
888	2019-08-15 09:03:05	CA机房外门禁	11	1
893	2019-08-15 09:03:07	CA机房外门禁	12	1
896	2019-08-15 09:07:09	CA机房外门禁	11	1
900	2019-08-15 09:07:12	CA机房外门禁	0	1
905	2019-08-15 09:07:14	CA机房外门禁	12	1
908	2019-08-15 09:09:13	CA机房外门禁	11	1
913	2019-08-15 09:09:16	CA机房外门禁	12	1
917	2019-08-15 09:28:06	CA机房外门禁	11	1
920	2019-08-15 09:28:07	CA机房外门禁	0	1
925	2019-08-15 09:28:12	CA机房外门禁	12	1
929	2019-08-15 09:31:31	CA机房外门禁	11	1
932	2019-08-15 09:31:33	CA机房外门禁	12	1
937	2019-08-15 09:33:59	CA机房外门禁	11	1
940	2019-08-15 09:34:02	CA机房外门禁	12	1
945	2019-08-15 09:36:07	CA机房外门禁	11	1
952	2019-08-15 09:36:10	CA机房外门禁	0	1
957	2019-08-15 09:36:13	CA机房外门禁	12	1
960	2019-08-15 09:50:19	CA机房外门禁	11	1
965	2019-08-15 09:50:21	CA机房外门禁	0	1
971	2019-08-15 09:50:24	CA机房外门禁	12	1
975	2019-08-15 09:52:35	CA机房外门禁	11	1
980	2019-08-15 09:52:38	CA机房外门禁	0	1
987	2019-08-15 09:52:40	CA机房外门禁	12	1
990	2019-08-15 09:59:21	CA机房外门禁	11	1
996	2019-08-15 09:59:23	CA机房外门禁	12	1
1002	2019-08-15 11:00:39	CA机房外门禁	11	1
1005	2019-08-15 11:00:42	CA机房外门禁	12	1
1012	2019-08-15 11:02:23	CA机房外门禁	11	1
1015	2019-08-15 11:02:25	CA机房外门禁	12	1
1022	2019-08-15 11:35:22	CA机房外门禁	11	1
1025	2019-08-15 11:35:24	CA机房外门禁	12	1
1032	2019-08-15 11:49:45	CA机房外门禁	11	1
1035	2019-08-15 11:49:47	CA机房外门禁	12	1
1041	2019-08-15 12:36:47	CA机房外门禁	11	1
1047	2019-08-15 12:36:49	CA机房外门禁	12	1
1050	2019-08-15 14:46:59	CA机房外门禁	11	1
1057	2019-08-15 14:47:01	CA机房外门禁	12	1
1062	2019-08-15 18:07:02	CA机房外门禁	11	1
1065	2019-08-15 18:07:05	CA机房外门禁	12	1
1070	2019-08-15 18:15:45	CA机房外门禁	11	1
1076	2019-08-15 18:15:48	CA机房外门禁	12	1
1081	2019-08-15 18:38:27	CA机房外门禁	11	1
1086	2019-08-15 18:38:30	CA机房外门禁	12	1
1091	2019-08-15 18:39:13	CA机房外门禁	11	1
1097	2019-08-15 18:39:16	CA机房外门禁	12	1
1102	2019-08-15 18:46:08	CA机房外门禁	11	1
1106	2019-08-15 18:46:11	CA机房外门禁	12	1
1110	2019-08-15 19:00:17	CA机房外门禁	11	1
1116	2019-08-15 19:00:19	CA机房外门禁	12	1
1121	2019-08-15 19:07:00	CA机房外门禁	11	1
1127	2019-08-15 19:07:02	CA机房外门禁	12	1
1132	2019-08-15 19:07:30	CA机房外门禁	11	1
1135	2019-08-15 19:07:32	CA机房外门禁	12	1
1140	2019-08-15 19:16:59	CA机房外门禁	11	1
1146	2019-08-15 19:17:02	CA机房外门禁	12	1
1152	2019-08-16 10:52:37	CA机房外门禁	11	1
1155	2019-08-16 10:52:39	CA机房外门禁	12	1
1160	2019-08-22 09:39:34	CA机房外门禁	11	1
1165	2019-08-22 09:39:37	CA机房外门禁	12	1
1172	2019-08-22 09:40:50	CA机房外门禁	11	1
1177	2019-08-22 09:40:53	CA机房外门禁	12	1
1182	2019-08-22 09:46:44	CA机房外门禁	11	1
1186	2019-08-22 09:46:47	CA机房外门禁	0	1
1191	2019-08-22 09:46:50	CA机房外门禁	12	1
1196	2019-08-22 09:51:09	CA机房外门禁	11	1
1202	2019-08-22 09:51:12	CA机房外门禁	12	1
1206	2019-08-22 10:09:52	CA机房外门禁	11	1
1211	2019-08-22 10:09:56	CA机房外门禁	12	1
1215	2019-08-22 10:36:36	CA机房外门禁	11	1
1220	2019-08-22 10:36:39	CA机房外门禁	12	1
1226	2019-08-22 10:37:20	CA机房外门禁	11	1
1230	2019-08-22 10:37:23	CA机房外门禁	12	1
1233	2019-08-22 10:44:53	CA机房外门禁	11	1
1237	2019-08-22 10:44:55	CA机房外门禁	12	1
1243	2019-08-22 10:58:43	CA机房外门禁	11	1
1247	2019-08-22 10:58:46	CA机房外门禁	12	1
1251	2019-08-22 11:09:50	CA机房外门禁	11	1
1254	2019-08-22 11:09:52	CA机房外门禁	12	1
1259	2019-08-22 11:10:08	CA机房外门禁	11	1
758	2019-09-04 14:05:20	密钥机房内门禁	1003	1
762	2019-09-04 14:05:29	密钥机房内门禁	1002	1
766	2019-09-04 14:05:32	密钥机房内门禁	1001	1
770	2019-09-04 16:23:43	密钥机房内门禁	1003	1
774	2019-09-04 16:23:45	密钥机房内门禁	1003	1
778	2019-09-04 16:23:47	密钥机房内门禁	1003	1
782	2019-09-04 16:23:48	密钥机房内门禁	1003	1
786	2019-09-04 16:23:50	密钥机房内门禁	1003	1
790	2019-09-04 16:23:52	密钥机房内门禁	1003	1
794	2019-09-04 16:23:55	密钥机房内门禁	1003	1
798	2019-09-04 16:24:42	密钥机房内门禁	1001	1
802	2019-09-04 16:24:44	密钥机房内门禁	1002	1
806	2019-09-04 16:34:55	密钥机房内门禁	1002	1
810	2019-09-04 16:34:58	密钥机房内门禁	1001	1
815	2019-09-06 09:40:50	密钥机房内门禁	1002	1
821	2019-09-06 09:40:53	密钥机房内门禁	1001	1
826	2019-09-09 09:56:14	密钥机房内门禁	1002	1
830	2019-09-09 09:56:16	密钥机房内门禁	1001	1
835	2019-09-09 10:03:19	密钥机房内门禁	1001	1
841	2019-09-09 10:03:21	密钥机房内门禁	1002	1
845	2019-09-10 13:59:16	密钥机房内门禁	1001	1
851	2019-09-10 13:59:19	密钥机房内门禁	1002	1
855	2019-09-10 19:17:54	密钥机房内门禁	1001	1
860	2019-09-10 19:17:57	密钥机房内门禁	0	1
865	2019-09-10 19:19:19	密钥机房内门禁	1002	1
871	2019-09-10 19:19:24	密钥机房内门禁	1001	1
875	2019-09-10 19:48:51	密钥机房内门禁	1002	1
881	2019-09-10 19:48:53	密钥机房内门禁	1001	1
886	2019-09-10 20:16:13	密钥机房内门禁	0	1
890	2019-09-10 20:16:29	密钥机房内门禁	1002	1
894	2019-09-10 20:17:57	密钥机房内门禁	1002	1
899	2019-09-10 20:18:00	密钥机房内门禁	1001	1
903	2022-03-26 17:22:54	密钥机房内门禁	1000333	1
907	2022-03-26 17:22:57	密钥机房内门禁	1000328	1
910	2022-03-26 18:35:55	密钥机房内门禁	1000328	1
915	2022-03-26 18:35:58	密钥机房内门禁	1000333	1
919	2022-03-26 18:45:41	密钥机房内门禁	1000333	1
923	2022-03-26 18:45:44	密钥机房内门禁	1000328	1
927	2022-03-26 18:48:50	密钥机房内门禁	1000328	1
931	2022-03-26 18:48:52	密钥机房内门禁	1000333	1
934	2022-03-26 18:51:30	密钥机房内门禁	1000328	1
939	2022-03-26 18:51:32	密钥机房内门禁	1000333	1
943	2022-03-28 12:02:02	密钥机房内门禁	1000328	1
949	2022-03-28 12:02:04	密钥机房内门禁	1000333	1
953	2022-03-28 12:19:28	密钥机房内门禁	1000328	1
958	2022-03-28 12:19:30	密钥机房内门禁	1000333	1
964	2022-03-28 13:27:22	密钥机房内门禁	1000333	1
969	2022-03-28 13:27:25	密钥机房内门禁	1000328	1
974	2022-03-28 16:23:29	密钥机房内门禁	1000328	1
978	2022-03-28 16:23:31	密钥机房内门禁	1000333	1
983	2022-03-29 16:58:48	密钥机房内门禁	1006	1
989	2022-03-29 16:58:51	密钥机房内门禁	1007	1
994	2022-04-14 09:28:45	密钥机房内门禁	1007	1
999	2022-04-14 09:28:49	密钥机房内门禁	1006	1
1004	2022-04-14 09:45:40	密钥机房内门禁	1006	1
1009	2022-04-14 09:45:43	密钥机房内门禁	1007	1
1014	2022-04-19 11:43:33	密钥机房内门禁	1007	1
1019	2022-04-19 11:43:37	密钥机房内门禁	1006	1
1023	2022-04-19 12:50:54	密钥机房内门禁	1006	1
1028	2022-04-19 12:50:56	密钥机房内门禁	1007	1
1033	2022-04-25 16:33:13	密钥机房内门禁	1006	1
1039	2022-04-25 16:33:14	密钥机房内门禁	1007	1
1044	2022-04-25 17:14:43	密钥机房内门禁	0	1
1049	2022-04-25 17:14:48	密钥机房内门禁	1007	1
1054	2022-04-25 17:14:50	密钥机房内门禁	1006	1
1058	2022-05-19 16:35:19	密钥机房内门禁	0	1
1063	2022-05-19 16:35:23	密钥机房内门禁	1007	1
1068	2022-05-19 16:35:25	密钥机房内门禁	1006	1
1073	2022-07-01 16:16:14	密钥机房内门禁	1006	1
1079	2022-07-01 16:16:17	密钥机房内门禁	0	1
1084	2022-07-01 16:16:24	密钥机房内门禁	1007	1
1088	2022-07-04 16:59:02	密钥机房内门禁	1006	1
1094	2022-07-04 16:59:04	密钥机房内门禁	1007	1
1099	2022-07-05 16:34:13	密钥机房内门禁	1006	1
1103	2022-07-05 16:34:15	密钥机房内门禁	1007	1
1109	2022-07-06 16:29:30	密钥机房内门禁	1006	1
1114	2022-07-06 16:29:32	密钥机房内门禁	1007	1
1119	2022-07-07 08:52:02	密钥机房内门禁	1007	1
1123	2022-07-07 08:52:04	密钥机房内门禁	1006	1
1128	2022-07-07 11:00:53	密钥机房内门禁	1007	1
1134	2022-07-07 11:00:56	密钥机房内门禁	1006	1
1138	2022-09-22 17:18:45	密钥机房内门禁	1006	1
1143	2022-09-22 17:18:47	密钥机房内门禁	1007	1
1148	2022-11-24 11:45:44	密钥机房内门禁	1007	1
1154	2022-11-24 11:45:53	密钥机房内门禁	1006	1
1158	2022-12-29 15:11:43	密钥机房内门禁	1007	1
1163	2022-12-29 15:11:45	密钥机房内门禁	1006	1
1169	2023-01-09 11:58:05	密钥机房内门禁	1	1
1174	2023-01-09 11:58:07	密钥机房内门禁	11	1
1179	2023-01-09 16:22:29	密钥机房内门禁	1	1
1184	2023-01-09 16:22:31	密钥机房内门禁	11	1
1189	2023-01-09 16:57:22	密钥机房内门禁	1003	1
1194	2023-01-09 16:57:27	密钥机房内门禁	1007	1
1199	2023-01-09 17:01:08	密钥机房内门禁	1003	1
1203	2023-01-09 17:01:16	密钥机房内门禁	1007	1
1209	2023-02-06 15:07:22	密钥机房内门禁	1007	1
1213	2023-02-06 15:07:26	密钥机房内门禁	1003	1
1218	2023-02-06 15:20:44	密钥机房内门禁	1003	1
1224	2023-02-06 15:20:48	密钥机房内门禁	1007	1
4974	2020-05-18 14:35:16	密钥机房外门禁	10008001	1
4978	2020-05-18 14:35:20	密钥机房外门禁	10008001	1
4980	2020-08-27 10:38:21	信息机房外门禁	1008	1
4984	2020-08-27 10:53:13	信息机房外门禁	1008	1
4989	2020-08-27 10:53:15	信息机房外门禁	1001	1
4991	2020-09-01 10:45:38	信息机房外门禁	1008	1
811	2019-09-15 15:45:20	信息机房外门禁	1	1
816	2019-09-15 19:15:37	信息机房外门禁	0	1
820	2019-09-16 10:45:03	信息机房外门禁	0	1
825	2019-09-16 10:46:20	信息机房外门禁	11	1
831	2019-09-16 10:46:21	信息机房外门禁	0	1
836	2019-09-16 10:46:24	信息机房外门禁	12	1
840	2019-09-16 10:48:32	信息机房外门禁	11	1
846	2019-09-16 10:48:34	信息机房外门禁	12	1
850	2019-09-16 11:04:58	信息机房外门禁	11	1
856	2019-09-16 11:05:00	信息机房外门禁	11	1
861	2019-09-16 11:05:01	信息机房外门禁	12	1
866	2019-09-16 11:05:03	信息机房外门禁	12	1
870	2019-09-16 11:14:08	信息机房外门禁	2	1
876	2019-09-16 11:17:45	信息机房外门禁	1001	1
880	2019-09-16 11:17:49	信息机房外门禁	1002	1
885	2019-09-16 14:20:33	信息机房外门禁	11	1
891	2019-09-16 14:20:34	信息机房外门禁	12	1
895	2019-09-17 13:46:15	信息机房外门禁	1002	1
898	2019-09-17 13:46:18	信息机房外门禁	1001	1
902	2019-09-17 15:27:34	信息机房外门禁	1001	1
906	2019-09-17 15:27:38	信息机房外门禁	1002	1
911	2019-09-17 15:37:43	信息机房外门禁	1001	1
914	2019-09-17 15:37:50	信息机房外门禁	1002	1
918	2019-09-17 16:04:02	信息机房外门禁	1001	1
922	2019-09-17 16:04:04	信息机房外门禁	1002	1
926	2019-09-17 17:27:23	信息机房外门禁	1002	1
930	2019-09-17 17:27:27	信息机房外门禁	1001	1
935	2019-09-17 17:34:50	信息机房外门禁	0	1
938	2019-09-17 17:34:56	信息机房外门禁	0	1
944	2019-09-17 17:35:06	信息机房外门禁	1001	1
948	2019-09-17 17:35:08	信息机房外门禁	1002	1
954	2019-09-17 17:35:40	信息机房外门禁	1002	1
959	2019-09-17 17:35:43	信息机房外门禁	1001	1
963	2019-09-17 19:03:30	信息机房外门禁	1001	1
968	2019-09-17 19:03:33	信息机房外门禁	1002	1
973	2019-09-17 20:08:00	信息机房外门禁	1002	1
979	2019-09-17 20:12:41	信息机房外门禁	2	1
984	2019-09-17 20:14:18	信息机房外门禁	1005	1
988	2019-09-17 20:14:31	信息机房外门禁	0	1
993	2019-09-17 20:14:34	信息机房外门禁	0	1
998	2019-09-17 20:14:35	信息机房外门禁	1004	1
1003	2019-09-17 20:14:42	信息机房外门禁	1005	1
1008	2019-09-17 20:14:47	信息机房外门禁	1004	1
1013	2019-09-17 22:07:45	信息机房外门禁	11	1
1018	2019-09-17 22:07:47	信息机房外门禁	12	1
1024	2019-09-17 23:55:01	信息机房外门禁	0	1
1029	2019-09-17 23:55:04	信息机房外门禁	0	1
1034	2019-09-17 23:55:07	信息机房外门禁	1005	1
1038	2019-09-17 23:55:13	信息机房外门禁	1004	1
1043	2019-09-17 23:59:10	信息机房外门禁	1005	1
1048	2019-09-17 23:59:13	信息机房外门禁	1004	1
1053	2019-09-18 00:01:05	信息机房外门禁	1005	1
1059	2019-09-18 00:01:07	信息机房外门禁	1004	1
1064	2019-09-18 00:01:35	信息机房外门禁	1005	1
1069	2019-09-18 00:01:37	信息机房外门禁	1004	1
1074	2019-09-18 00:04:22	信息机房外门禁	1005	1
1078	2019-09-18 00:04:24	信息机房外门禁	1004	1
1083	2019-09-18 00:05:15	信息机房外门禁	1005	1
1089	2019-09-18 00:05:18	信息机房外门禁	1004	1
1093	2019-09-18 00:05:50	信息机房外门禁	1005	1
1098	2019-09-18 00:05:53	信息机房外门禁	1004	1
1104	2019-09-18 00:06:09	信息机房外门禁	1005	1
1108	2019-09-18 00:06:15	信息机房外门禁	1004	1
1113	2019-09-18 00:07:38	信息机房外门禁	1005	1
1118	2019-09-18 00:07:41	信息机房外门禁	1004	1
1124	2019-09-18 00:14:28	信息机房外门禁	1005	1
1129	2019-09-18 00:14:31	信息机房外门禁	1004	1
1133	2019-09-18 00:15:47	信息机房外门禁	0	1
1139	2019-09-18 00:15:56	信息机房外门禁	1005	1
1144	2019-09-18 00:15:59	信息机房外门禁	1004	1
1149	2019-09-18 00:19:19	信息机房外门禁	1005	1
1153	2019-09-18 00:19:21	信息机房外门禁	1004	1
1159	2019-09-18 00:33:00	信息机房外门禁	1005	1
1164	2019-09-18 00:33:02	信息机房外门禁	1004	1
1168	2019-09-18 00:34:43	信息机房外门禁	1005	1
1173	2019-09-18 00:34:46	信息机房外门禁	1004	1
1178	2019-09-18 00:36:11	信息机房外门禁	1005	1
1183	2019-09-18 00:36:14	信息机房外门禁	1004	1
1188	2019-09-18 00:38:58	信息机房外门禁	1005	1
1193	2019-09-18 00:39:00	信息机房外门禁	1004	1
1198	2019-09-18 00:55:09	信息机房外门禁	1005	1
1204	2019-09-18 00:55:11	信息机房外门禁	1004	1
1208	2019-09-18 00:56:08	信息机房外门禁	1005	1
1214	2019-09-18 00:56:10	信息机房外门禁	1004	1
1219	2019-09-18 00:56:30	信息机房外门禁	1005	1
1223	2019-09-18 01:03:33	信息机房外门禁	1005	1
1228	2019-09-18 01:03:36	信息机房外门禁	1004	1
1232	2019-09-18 01:04:18	信息机房外门禁	1005	1
1236	2019-09-18 01:04:20	信息机房外门禁	1004	1
1240	2019-09-18 08:15:56	信息机房外门禁	1002	1
1244	2019-09-18 08:15:59	信息机房外门禁	1001	1
1248	2019-09-18 08:22:09	信息机房外门禁	1002	1
1252	2019-09-18 08:22:11	信息机房外门禁	1001	1
1256	2019-09-18 11:36:43	信息机房外门禁	1002	1
1260	2019-09-18 11:36:46	信息机房外门禁	1001	1
1264	2019-09-18 15:05:36	信息机房外门禁	11	1
1268	2019-09-18 15:05:39	信息机房外门禁	12	1
1272	2019-09-18 15:21:27	信息机房外门禁	11	1
1276	2019-09-18 15:21:29	信息机房外门禁	12	1
1280	2019-09-18 15:33:34	信息机房外门禁	11	1
1284	2019-09-18 15:33:36	信息机房外门禁	12	1
1288	2019-09-18 15:36:43	信息机房外门禁	11	1
1292	2019-09-18 15:36:47	信息机房外门禁	12	1
1296	2019-09-18 15:55:47	信息机房外门禁	11	1
1300	2019-09-18 15:55:49	信息机房外门禁	12	1
1304	2019-09-18 16:16:54	信息机房外门禁	1002	1
1308	2019-09-18 16:16:58	信息机房外门禁	1001	1
1245	2019-09-04 16:20:49	密钥机房外门禁	1001	1
1250	2019-09-04 16:21:08	密钥机房外门禁	1001	1
1253	2019-09-04 16:21:12	密钥机房外门禁	1002	1
1257	2019-09-04 16:22:39	密钥机房外门禁	1002	1
1261	2019-09-04 16:22:43	密钥机房外门禁	1001	1
1267	2019-09-04 16:32:00	密钥机房外门禁	1001	1
1271	2019-09-04 16:32:04	密钥机房外门禁	1002	1
1274	2019-09-06 09:39:26	密钥机房外门禁	1002	1
1278	2019-09-06 09:39:30	密钥机房外门禁	1001	1
1281	2019-09-09 09:53:49	密钥机房外门禁	1002	1
1286	2019-09-09 09:53:58	密钥机房外门禁	1001	1
1290	2019-09-09 09:54:02	密钥机房外门禁	1002	1
1294	2019-09-09 09:57:16	密钥机房外门禁	1002	1
1299	2019-09-09 09:57:18	密钥机房外门禁	1001	1
1302	2019-09-10 13:57:24	密钥机房外门禁	1001	1
1306	2019-09-10 13:57:29	密钥机房外门禁	1002	1
1311	2019-09-10 19:08:54	密钥机房外门禁	1001	1
1314	2019-09-10 19:13:46	密钥机房外门禁	1002	1
1318	2019-09-10 19:13:48	密钥机房外门禁	1001	1
1323	2019-09-10 19:40:36	密钥机房外门禁	0	1
1327	2019-09-10 19:40:43	密钥机房外门禁	1002	1
1330	2019-09-10 19:40:45	密钥机房外门禁	1001	1
1333	2019-09-10 20:00:15	密钥机房外门禁	1002	1
1338	2019-09-10 20:00:18	密钥机房外门禁	1001	1
1341	2019-09-11 17:35:20	密钥机房外门禁	1001	1
1347	2019-09-11 17:35:22	密钥机房外门禁	1002	1
1351	2019-09-14 15:58:53	密钥机房外门禁	1	1
1354	2019-09-15 18:40:15	密钥机房外门禁	1	1
1359	2019-09-15 18:40:29	密钥机房外门禁	1	1
1363	2019-09-15 19:01:28	密钥机房外门禁	1	1
1365	2019-09-17 15:40:34	密钥机房外门禁	1001	1
1369	2019-09-17 15:40:38	密钥机房外门禁	1002	1
1375	2019-09-17 15:40:54	密钥机房外门禁	1001	1
1379	2019-09-17 15:40:58	密钥机房外门禁	1002	1
1382	2019-09-17 15:43:49	密钥机房外门禁	1001	1
1387	2019-09-17 15:43:52	密钥机房外门禁	1002	1
1389	2019-09-17 15:44:06	密钥机房外门禁	1001	1
1394	2019-09-17 15:44:11	密钥机房外门禁	1002	1
1398	2019-09-17 16:19:36	密钥机房外门禁	1001	1
1403	2019-09-17 16:19:39	密钥机房外门禁	1002	1
1406	2019-09-17 22:09:58	密钥机房外门禁	1005	1
1409	2019-09-17 22:26:32	密钥机房外门禁	1005	1
1413	2019-09-17 22:26:36	密钥机房外门禁	1004	1
1417	2019-09-17 22:30:21	密钥机房外门禁	1005	1
1422	2019-09-17 22:30:24	密钥机房外门禁	1004	1
1425	2019-09-17 22:32:16	密钥机房外门禁	1004	1
1431	2019-09-17 22:32:20	密钥机房外门禁	1005	1
1434	2019-09-17 22:47:14	密钥机房外门禁	1005	1
1439	2019-09-17 22:47:17	密钥机房外门禁	1004	1
1441	2019-09-17 22:49:31	密钥机房外门禁	1005	1
1447	2019-09-17 22:49:33	密钥机房外门禁	1004	1
1451	2019-09-17 22:49:55	密钥机房外门禁	1004	1
1456	2019-09-17 22:49:58	密钥机房外门禁	1005	1
1459	2019-09-17 22:51:54	密钥机房外门禁	1004	1
1465	2019-09-17 22:51:56	密钥机房外门禁	1005	1
1469	2019-09-17 23:45:31	密钥机房外门禁	1004	1
1473	2019-09-17 23:45:34	密钥机房外门禁	1005	1
1477	2019-09-17 23:48:02	密钥机房外门禁	1004	1
1481	2019-09-17 23:48:05	密钥机房外门禁	1005	1
1483	2019-09-18 00:43:18	密钥机房外门禁	1005	1
1489	2019-09-18 00:43:21	密钥机房外门禁	1004	1
1492	2019-09-18 00:44:27	密钥机房外门禁	1004	1
1495	2019-09-18 00:44:29	密钥机房外门禁	1005	1
1500	2019-09-18 01:00:58	密钥机房外门禁	1004	1
1504	2019-09-18 01:01:01	密钥机房外门禁	1005	1
1509	2019-09-18 01:01:40	密钥机房外门禁	1004	1
1512	2019-09-18 01:01:43	密钥机房外门禁	1005	1
1515	2019-09-18 08:20:02	密钥机房外门禁	1002	1
1520	2019-09-18 08:20:22	密钥机房外门禁	1002	1
1524	2019-09-18 08:20:25	密钥机房外门禁	1001	1
1528	2019-09-18 10:14:20	密钥机房外门禁	1000800	1
1533	2019-09-18 10:14:51	密钥机房外门禁	1002331	1
1537	2019-09-18 14:07:00	密钥机房外门禁	1000800	1
1540	2019-09-18 14:07:06	密钥机房外门禁	1002331	1
1545	2019-09-18 14:17:10	密钥机房外门禁	1000800	1
1547	2019-09-18 14:17:13	密钥机房外门禁	1002331	1
1553	2019-09-18 14:37:07	密钥机房外门禁	1000800	1
1555	2019-09-18 14:37:10	密钥机房外门禁	1002331	1
1561	2019-09-18 15:15:57	密钥机房外门禁	1002331	1
1563	2019-09-18 15:16:00	密钥机房外门禁	1000800	1
1567	2019-09-18 15:16:13	密钥机房外门禁	1000800	1
1572	2019-09-18 15:41:34	密钥机房外门禁	1003	1
1575	2019-09-18 15:41:51	密钥机房外门禁	1003	1
1580	2019-09-18 15:41:52	密钥机房外门禁	1003	1
1585	2019-09-18 15:41:54	密钥机房外门禁	1003	1
1587	2019-09-18 15:41:56	密钥机房外门禁	1003	1
1593	2019-09-18 15:41:58	密钥机房外门禁	1003	1
1596	2019-09-18 15:41:59	密钥机房外门禁	1003	1
1599	2019-09-18 15:42:03	密钥机房外门禁	1003	1
1603	2019-09-18 15:42:04	密钥机房外门禁	1003	1
1609	2019-09-18 15:42:06	密钥机房外门禁	1003	1
1613	2019-09-18 15:42:07	密钥机房外门禁	0	1
1617	2019-09-18 15:42:10	密钥机房外门禁	1003	1
1620	2019-09-18 15:42:21	密钥机房外门禁	1	1
1624	2019-09-18 15:42:24	密钥机房外门禁	1	1
1627	2019-09-18 15:42:25	密钥机房外门禁	0	1
1633	2019-09-18 15:42:29	密钥机房外门禁	0	1
1637	2019-09-18 15:42:48	密钥机房外门禁	1003	1
1639	2019-09-18 15:42:53	密钥机房外门禁	1003	1
1645	2019-09-18 15:42:55	密钥机房外门禁	1003	1
1649	2019-09-18 15:42:56	密钥机房外门禁	1003	1
1652	2019-09-18 15:42:58	密钥机房外门禁	1003	1
1656	2019-09-18 15:43:08	密钥机房外门禁	12	1
1660	2019-09-18 15:43:11	密钥机房外门禁	0	1
1664	2019-09-18 15:43:16	密钥机房外门禁	12	1
1668	2019-09-18 15:43:17	密钥机房外门禁	12	1
1263	2019-08-22 11:10:10	CA机房外门禁	12	1
1266	2019-08-22 11:18:19	CA机房外门禁	11	1
1269	2019-08-22 11:18:21	CA机房外门禁	12	1
1275	2019-08-22 11:24:39	CA机房外门禁	11	1
1279	2019-08-22 11:24:42	CA机房外门禁	12	1
1282	2019-08-22 11:41:08	CA机房外门禁	11	1
1287	2019-08-22 11:41:11	CA机房外门禁	12	1
1291	2019-08-22 14:39:14	CA机房外门禁	11	1
1293	2019-08-22 14:39:16	CA机房外门禁	12	1
1298	2019-08-22 14:41:50	CA机房外门禁	11	1
1301	2019-08-22 14:41:53	CA机房外门禁	12	1
1307	2019-08-22 15:02:49	CA机房外门禁	11	1
1309	2019-08-22 15:02:52	CA机房外门禁	12	1
1315	2019-08-22 15:09:15	CA机房外门禁	11	1
1317	2019-08-22 15:09:19	CA机房外门禁	12	1
1322	2019-08-22 15:22:26	CA机房外门禁	11	1
1326	2019-08-22 15:22:29	CA机房外门禁	12	1
1329	2019-08-22 15:28:47	CA机房外门禁	11	1
1334	2019-08-22 15:28:50	CA机房外门禁	12	1
1337	2019-08-22 15:31:07	CA机房外门禁	11	1
1343	2019-08-22 15:31:10	CA机房外门禁	12	1
1345	2019-08-22 15:32:04	CA机房外门禁	11	1
1350	2019-08-22 15:32:06	CA机房外门禁	0	1
1353	2019-08-22 15:32:09	CA机房外门禁	12	1
1357	2019-08-22 15:55:29	CA机房外门禁	1001	1
1362	2019-08-22 15:55:32	CA机房外门禁	1002	1
1367	2019-08-22 16:04:12	CA机房外门禁	2	1
1371	2019-08-22 16:04:16	CA机房外门禁	1002	1
1373	2019-08-22 16:04:20	CA机房外门禁	1001	1
1377	2019-08-22 16:06:06	CA机房外门禁	1002	1
1381	2019-08-22 16:06:11	CA机房外门禁	1001	1
1385	2019-08-23 10:36:04	CA机房外门禁	0	1
1391	2019-08-23 10:44:07	CA机房外门禁	1002	1
1393	2019-08-23 10:44:09	CA机房外门禁	1001	1
1397	2019-08-23 10:44:35	CA机房外门禁	1002	1
1401	2019-08-23 10:44:42	CA机房外门禁	1001	1
1405	2019-08-23 10:45:32	CA机房外门禁	1001	1
1411	2019-08-23 10:45:39	CA机房外门禁	1002	1
1414	2019-08-27 11:21:03	CA机房外门禁	1002	1
1419	2019-08-27 11:21:05	CA机房外门禁	1001	1
1423	2019-08-28 17:53:17	CA机房外门禁	0	1
1427	2019-08-29 09:26:19	CA机房外门禁	1002	1
1430	2019-08-29 09:26:21	CA机房外门禁	1001	1
1435	2019-08-29 23:58:34	CA机房外门禁	1002	1
1438	2019-08-29 23:58:38	CA机房外门禁	1001	1
1443	2019-08-29 23:59:35	CA机房外门禁	1002	1
1449	2019-08-29 23:59:39	CA机房外门禁	1001	1
1453	2019-09-03 14:49:32	CA机房外门禁	1001	1
1457	2019-09-03 14:49:38	CA机房外门禁	1002	1
1461	2019-09-03 14:49:58	CA机房外门禁	1002	1
1463	2019-09-03 14:50:06	CA机房外门禁	1001	1
1467	2019-09-04 16:15:07	CA机房外门禁	0	1
1472	2019-09-04 16:36:59	CA机房外门禁	1001	1
1476	2019-09-04 16:37:02	CA机房外门禁	1002	1
1480	2019-09-11 18:59:56	CA机房外门禁	1001	1
1484	2019-09-11 19:00:14	CA机房外门禁	1002	1
1488	2019-09-17 13:55:31	CA机房外门禁	0	1
1493	2019-09-17 22:38:14	CA机房外门禁	0	1
1497	2019-09-17 22:38:18	CA机房外门禁	1	1
1499	2019-09-17 22:38:21	CA机房外门禁	12	1
1505	2019-09-17 22:39:24	CA机房外门禁	1	1
1507	2019-09-17 22:39:25	CA机房外门禁	0	1
1511	2019-09-17 22:39:31	CA机房外门禁	1	1
1517	2019-09-17 22:39:34	CA机房外门禁	12	1
1519	2019-09-17 22:39:42	CA机房外门禁	1	1
1525	2019-09-17 22:39:45	CA机房外门禁	12	1
1527	2019-09-17 22:40:07	CA机房外门禁	1	1
1531	2019-09-17 22:40:10	CA机房外门禁	12	1
1535	2019-09-17 22:40:41	CA机房外门禁	1	1
1539	2019-09-17 22:40:44	CA机房外门禁	12	1
1544	2019-09-17 22:41:46	CA机房外门禁	1	1
1549	2019-09-17 22:41:50	CA机房外门禁	12	1
1552	2019-09-17 22:44:30	CA机房外门禁	1	1
1556	2019-09-17 22:44:32	CA机房外门禁	12	1
1559	2019-09-17 22:46:21	CA机房外门禁	0	1
1564	2019-09-17 22:47:37	CA机房外门禁	0	1
1569	2019-09-17 22:47:39	CA机房外门禁	11	1
1571	2019-09-17 22:47:42	CA机房外门禁	0	1
1577	2019-09-17 22:47:45	CA机房外门禁	12	1
1581	2019-09-17 23:01:03	CA机房外门禁	11	1
1583	2019-09-17 23:01:06	CA机房外门禁	12	1
1589	2019-09-17 23:15:06	CA机房外门禁	11	1
1591	2019-09-17 23:15:21	CA机房外门禁	11	1
1595	2019-09-17 23:15:24	CA机房外门禁	12	1
1601	2019-09-17 23:26:37	CA机房外门禁	11	1
1605	2019-09-17 23:26:38	CA机房外门禁	0	1
1607	2019-09-17 23:26:40	CA机房外门禁	12	1
1611	2019-09-17 23:30:57	CA机房外门禁	11	1
1615	2019-09-17 23:31:14	CA机房外门禁	11	1
1619	2019-09-17 23:31:18	CA机房外门禁	12	1
1625	2019-09-17 23:32:19	CA机房外门禁	11	1
1628	2019-09-17 23:32:23	CA机房外门禁	12	1
1632	2019-09-17 23:36:14	CA机房外门禁	1	1
1636	2019-09-17 23:36:29	CA机房外门禁	11	1
1640	2019-09-17 23:36:32	CA机房外门禁	12	1
1643	2019-09-17 23:36:44	CA机房外门禁	11	1
1647	2019-09-17 23:37:01	CA机房外门禁	11	1
1651	2019-09-17 23:37:04	CA机房外门禁	12	1
1657	2019-09-18 00:17:57	CA机房外门禁	1	1
1661	2019-09-18 00:17:58	CA机房外门禁	12	1
1663	2019-09-18 00:18:42	CA机房外门禁	1	1
1667	2019-09-18 00:18:44	CA机房外门禁	12	1
1673	2019-09-18 00:19:05	CA机房外门禁	11	1
1676	2019-09-18 00:19:07	CA机房外门禁	12	1
1681	2019-09-18 00:41:04	CA机房外门禁	1	1
1684	2019-09-18 00:41:11	CA机房外门禁	11	1
1688	2019-09-18 00:41:13	CA机房外门禁	12	1
1692	2019-09-18 00:41:41	CA机房外门禁	11	1
1695	2019-09-18 00:41:42	CA机房外门禁	0	1
1700	2019-09-18 00:41:45	CA机房外门禁	12	1
1305	2019-09-25 11:43:17	信息机房内门禁	1008	1
1310	2019-09-26 11:02:15	信息机房内门禁	1001	1
1313	2019-09-26 11:02:17	信息机房内门禁	1008	1
1319	2019-09-26 16:53:04	信息机房内门禁	1001	1
1321	2019-09-26 16:53:07	信息机房内门禁	1008	1
1325	2019-09-26 17:00:52	信息机房内门禁	1001	1
1331	2019-09-26 17:00:54	信息机房内门禁	1008	1
1335	2019-09-27 09:56:26	信息机房内门禁	1001	1
1339	2019-09-27 09:56:28	信息机房内门禁	1008	1
1342	2019-09-27 16:58:12	信息机房内门禁	1001	1
1346	2019-09-27 16:58:14	信息机房内门禁	1008	1
1349	2019-09-27 17:04:10	信息机房内门禁	1008	1
1355	2019-09-27 17:04:12	信息机房内门禁	1001	1
1358	2019-09-28 09:26:29	信息机房内门禁	1001	1
1361	2019-09-28 09:26:30	信息机房内门禁	1008	1
1366	2019-09-28 11:08:50	信息机房内门禁	1001	1
1370	2019-09-28 11:08:52	信息机房内门禁	1008	1
1374	2019-09-29 08:05:11	信息机房内门禁	1001	1
1378	2019-09-29 08:05:13	信息机房内门禁	1008	1
1383	2019-09-29 17:24:35	信息机房内门禁	1001	1
1386	2019-09-29 17:24:37	信息机房内门禁	1008	1
1390	2019-09-29 22:05:02	信息机房内门禁	1003	1
1395	2019-09-29 22:05:05	信息机房内门禁	1009	1
1399	2019-10-12 07:59:47	信息机房内门禁	1001	1
1402	2019-10-12 07:59:50	信息机房内门禁	1008	1
1407	2019-10-12 15:35:52	信息机房内门禁	1002	1
1410	2019-10-12 15:35:56	信息机房内门禁	1001	1
1415	2019-10-12 17:11:50	信息机房内门禁	1001	1
1418	2019-10-12 17:11:52	信息机房内门禁	0	1
1421	2019-10-12 17:11:55	信息机房内门禁	1002	1
1426	2019-10-13 08:06:34	信息机房内门禁	1001	1
1429	2019-10-13 08:06:37	信息机房内门禁	1008	1
1433	2019-10-14 11:22:57	信息机房内门禁	1001	1
1437	2019-10-14 11:22:59	信息机房内门禁	1008	1
1442	2019-10-15 11:26:56	信息机房内门禁	1008	1
1448	2019-10-15 11:26:58	信息机房内门禁	1001	1
1452	2019-10-15 12:02:07	信息机房内门禁	0	1
1455	2019-10-15 12:02:15	信息机房内门禁	1008	1
1460	2019-10-15 12:02:23	信息机房内门禁	1001	1
1464	2019-10-15 15:09:54	信息机房内门禁	1001	1
1468	2019-10-15 15:09:56	信息机房内门禁	1008	1
1471	2019-10-15 16:15:51	信息机房内门禁	1008	1
1475	2019-10-15 16:15:55	信息机房内门禁	1001	1
1479	2019-10-15 21:23:49	信息机房内门禁	1001	1
1485	2019-10-15 21:23:51	信息机房内门禁	1008	1
1487	2019-10-16 14:23:59	信息机房内门禁	1001	1
1491	2019-10-16 14:24:06	信息机房内门禁	1002	1
1496	2019-10-18 07:59:22	信息机房内门禁	1001	1
1501	2019-10-18 08:02:37	信息机房内门禁	1008	1
1503	2019-10-18 08:02:39	信息机房内门禁	1001	1
1508	2019-10-18 08:08:55	信息机房内门禁	1001	1
1513	2019-10-18 08:08:57	信息机房内门禁	1008	1
1516	2019-10-21 08:12:58	信息机房内门禁	1001	1
1521	2019-10-21 08:13:00	信息机房内门禁	1008	1
1523	2019-10-21 11:45:21	信息机房内门禁	1002	1
1529	2019-10-21 11:45:24	信息机房内门禁	1001	1
1532	2019-10-21 11:49:06	信息机房内门禁	1002	1
1536	2019-10-21 11:49:10	信息机房内门禁	1001	1
1541	2019-10-22 08:22:06	信息机房内门禁	1002	1
1543	2019-10-22 08:22:10	信息机房内门禁	1001	1
1548	2019-10-22 14:06:52	信息机房内门禁	1002	1
1551	2019-10-22 14:06:54	信息机房内门禁	1001	1
1557	2019-10-22 15:48:27	信息机房内门禁	1002	1
1560	2019-10-22 15:48:53	信息机房内门禁	1002	1
1565	2019-10-22 15:48:59	信息机房内门禁	1002	1
1568	2019-10-22 15:49:02	信息机房内门禁	1001	1
1573	2019-10-22 20:33:13	信息机房内门禁	1001	1
1576	2019-10-22 20:33:15	信息机房内门禁	1004	1
1579	2019-10-22 20:33:32	信息机房内门禁	1001	1
1584	2019-10-22 20:33:35	信息机房内门禁	1004	1
1588	2019-10-22 20:34:14	信息机房内门禁	1001	1
1592	2019-10-22 20:34:17	信息机房内门禁	1004	1
1597	2019-10-22 20:39:44	信息机房内门禁	1001	1
1600	2019-10-22 20:39:46	信息机房内门禁	1004	1
1604	2019-10-23 17:19:57	信息机房内门禁	1001	1
1608	2019-10-23 17:19:59	信息机房内门禁	1002	1
1612	2019-10-25 15:15:31	信息机房内门禁	1001	1
1616	2019-10-25 15:15:33	信息机房内门禁	1008	1
1621	2019-10-28 10:50:18	信息机房内门禁	1001	1
1623	2019-10-28 10:50:21	信息机房内门禁	1008	1
1629	2019-10-31 08:03:16	信息机房内门禁	1001	1
1631	2019-10-31 08:03:19	信息机房内门禁	1008	1
1635	2019-11-01 23:04:27	信息机房内门禁	1008	1
1641	2019-11-01 23:04:30	信息机房内门禁	1001	1
1644	2019-11-04 17:18:57	信息机房内门禁	1001	1
1648	2019-11-04 17:19:03	信息机房内门禁	1008	1
1653	2019-11-04 19:30:47	信息机房内门禁	1008	1
1655	2019-11-04 19:30:50	信息机房内门禁	0	1
1659	2019-11-04 19:30:56	信息机房内门禁	1001	1
1665	2019-11-07 15:51:33	信息机房内门禁	1001	1
1669	2019-11-07 15:51:35	信息机房内门禁	1008	1
1672	2019-11-08 10:06:29	信息机房内门禁	1003	1
1675	2019-11-08 10:06:32	信息机房内门禁	1009	1
1680	2019-11-14 09:12:06	信息机房内门禁	1001	1
1683	2019-11-14 09:12:08	信息机房内门禁	1008	1
1687	2019-11-14 11:20:30	信息机房内门禁	1008	1
1691	2019-11-14 11:20:33	信息机房内门禁	1001	1
1697	2019-11-18 11:42:30	信息机房内门禁	1001	1
1701	2019-11-18 11:42:31	信息机房内门禁	1008	1
1703	2019-11-19 12:00:29	信息机房内门禁	1001	1
1709	2019-11-19 12:00:31	信息机房内门禁	1008	1
1711	2019-11-27 13:54:29	信息机房内门禁	1001	1
1717	2019-11-27 13:54:32	信息机房内门禁	1008	1
1720	2019-11-27 14:24:22	信息机房内门禁	1001	1
1724	2019-11-27 14:24:24	信息机房内门禁	1008	1
1727	2019-11-27 16:42:54	信息机房内门禁	2	1
1731	2019-11-27 16:43:02	信息机房内门禁	1008	1
1312	2019-09-18 16:18:05	信息机房外门禁	1002	1
1316	2019-09-18 16:18:09	信息机房外门禁	1001	1
1320	2019-09-18 16:26:02	信息机房外门禁	1005	1
1324	2019-09-18 16:28:21	信息机房外门禁	1002	1
1328	2019-09-18 16:28:24	信息机房外门禁	1001	1
1332	2019-09-18 16:34:03	信息机房外门禁	1003	1
1336	2019-09-18 16:34:08	信息机房外门禁	1004	1
1340	2019-09-18 17:45:33	信息机房外门禁	11	1
1344	2019-09-18 17:45:35	信息机房外门禁	12	1
1348	2019-09-19 08:25:26	信息机房外门禁	1002	1
1352	2019-09-19 08:25:31	信息机房外门禁	1001	1
1356	2019-09-19 09:57:36	信息机房外门禁	1001	1
1360	2019-09-19 09:57:42	信息机房外门禁	1003	1
1364	2019-09-20 11:25:11	信息机房外门禁	1001	1
1368	2019-09-20 11:25:13	信息机房外门禁	1002	1
1372	2019-09-20 17:28:44	信息机房外门禁	1001	1
1376	2019-09-20 17:28:47	信息机房外门禁	0	1
1380	2019-09-20 17:28:50	信息机房外门禁	1002	1
1384	2019-09-20 17:34:29	信息机房外门禁	1001	1
1388	2019-09-20 17:34:32	信息机房外门禁	1002	1
1392	2019-09-20 17:34:53	信息机房外门禁	1001	1
1396	2019-09-20 17:35:11	信息机房外门禁	1002	1
1400	2019-09-20 17:35:14	信息机房外门禁	1001	1
1404	2019-09-20 17:37:03	信息机房外门禁	1001	1
1408	2019-09-20 17:37:05	信息机房外门禁	1002	1
1412	2019-09-21 14:52:51	信息机房外门禁	1002	1
1416	2019-09-21 14:52:54	信息机房外门禁	1001	1
1420	2019-09-21 16:40:11	信息机房外门禁	1002	1
1424	2019-09-21 16:40:14	信息机房外门禁	1001	1
1428	2019-09-21 16:44:22	信息机房外门禁	0	1
1432	2019-09-21 16:44:24	信息机房外门禁	1002	1
1436	2019-09-21 16:44:26	信息机房外门禁	1001	1
1440	2019-09-23 08:50:08	信息机房外门禁	0	1
1444	2019-09-23 08:50:10	信息机房外门禁	1001	1
1445	2019-09-23 08:50:12	信息机房外门禁	1002	1
1446	2019-09-23 15:50:02	信息机房外门禁	1002	1
1450	2019-09-23 15:50:04	信息机房外门禁	1001	1
1454	2019-09-24 08:07:58	信息机房外门禁	1001	1
1458	2019-09-24 08:08:02	信息机房外门禁	1002	1
1462	2019-09-24 14:09:49	信息机房外门禁	1001	1
1466	2019-09-24 14:09:53	信息机房外门禁	1002	1
1470	2019-09-25 11:09:46	信息机房外门禁	1001	1
1474	2019-09-25 11:09:48	信息机房外门禁	1008	1
1478	2019-09-25 11:31:40	信息机房外门禁	1001	1
1482	2019-09-25 11:31:42	信息机房外门禁	1008	1
1486	2019-09-25 11:37:33	信息机房外门禁	1001	1
1490	2019-09-25 11:37:35	信息机房外门禁	1008	1
1494	2019-09-26 11:01:46	信息机房外门禁	1001	1
1498	2019-09-26 11:01:48	信息机房外门禁	1008	1
1502	2019-09-26 11:03:24	信息机房外门禁	1008	1
1506	2019-09-26 11:03:26	信息机房外门禁	1001	1
1510	2019-09-26 16:46:47	信息机房外门禁	1008	1
1514	2019-09-26 16:46:48	信息机房外门禁	1001	1
1518	2019-09-26 16:48:26	信息机房外门禁	1008	1
1522	2019-09-26 16:48:28	信息机房外门禁	1001	1
1526	2019-09-26 16:56:49	信息机房外门禁	1008	1
1530	2019-09-26 16:56:51	信息机房外门禁	1001	1
1534	2019-09-27 09:54:44	信息机房外门禁	1008	1
1538	2019-09-27 09:54:46	信息机房外门禁	1001	1
1542	2019-09-27 16:57:15	信息机房外门禁	1008	1
1546	2019-09-27 16:57:17	信息机房外门禁	1001	1
1550	2019-09-27 17:02:59	信息机房外门禁	1001	1
1554	2019-09-27 17:03:01	信息机房外门禁	1008	1
1558	2019-09-28 09:02:48	信息机房外门禁	1008	1
1562	2019-09-28 09:02:49	信息机房外门禁	1001	1
1566	2019-09-28 11:07:40	信息机房外门禁	1001	1
1570	2019-09-28 11:07:42	信息机房外门禁	1008	1
1574	2019-09-29 08:03:22	信息机房外门禁	1008	1
1578	2019-09-29 08:03:24	信息机房外门禁	1001	1
1582	2019-09-29 17:21:35	信息机房外门禁	1003	1
1586	2019-09-29 17:21:38	信息机房外门禁	0	1
1590	2019-09-29 17:21:40	信息机房外门禁	0	1
1594	2019-09-29 17:23:13	信息机房外门禁	1001	1
1598	2019-09-29 17:23:16	信息机房外门禁	1008	1
1602	2019-09-29 22:00:14	信息机房外门禁	0	1
1606	2019-09-29 22:00:17	信息机房外门禁	1003	1
1610	2019-09-29 22:00:19	信息机房外门禁	1009	1
1614	2019-10-10 09:01:08	信息机房外门禁	1008	1
1618	2019-10-10 09:01:10	信息机房外门禁	1001	1
1622	2019-10-10 16:37:51	信息机房外门禁	1008	1
1626	2019-10-10 16:37:53	信息机房外门禁	1001	1
1630	2019-10-12 07:54:54	信息机房外门禁	1001	1
1634	2019-10-12 07:54:56	信息机房外门禁	1008	1
1638	2019-10-12 15:32:36	信息机房外门禁	1002	1
1642	2019-10-12 15:32:37	信息机房外门禁	1002	1
1646	2019-10-12 15:32:39	信息机房外门禁	1008	1
1650	2019-10-12 15:32:48	信息机房外门禁	1002	1
1654	2019-10-12 15:32:51	信息机房外门禁	1001	1
1658	2019-10-12 16:45:01	信息机房外门禁	1002	1
1662	2019-10-12 16:45:03	信息机房外门禁	1001	1
1666	2019-10-13 08:02:23	信息机房外门禁	1008	1
1670	2019-10-13 08:02:25	信息机房外门禁	1001	1
1674	2019-10-13 08:42:48	信息机房外门禁	1008	1
1678	2019-10-13 08:42:50	信息机房外门禁	1001	1
1682	2019-10-14 11:18:09	信息机房外门禁	1001	1
1686	2019-10-14 11:18:11	信息机房外门禁	1008	1
1690	2019-10-14 11:20:16	信息机房外门禁	1001	1
1694	2019-10-14 11:20:18	信息机房外门禁	1008	1
1698	2019-10-14 15:01:54	信息机房外门禁	1008	1
1702	2019-10-14 15:01:56	信息机房外门禁	1001	1
1706	2019-10-14 18:42:13	信息机房外门禁	1008	1
1710	2019-10-14 18:42:15	信息机房外门禁	1001	1
1714	2019-10-15 11:14:18	信息机房外门禁	1008	1
1718	2019-10-15 11:14:20	信息机房外门禁	1001	1
1722	2019-10-15 11:28:27	信息机房外门禁	1001	1
1726	2019-10-15 11:29:51	信息机房外门禁	1001	1
1730	2019-10-15 11:29:53	信息机房外门禁	1008	1
1671	2019-09-18 15:43:19	密钥机房外门禁	12	1
1677	2019-09-18 15:43:21	密钥机房外门禁	12	1
1679	2019-09-18 15:43:22	密钥机房外门禁	12	1
1685	2019-09-18 15:43:25	密钥机房外门禁	12	1
1689	2019-09-18 15:43:26	密钥机房外门禁	12	1
1693	2019-09-18 15:43:29	密钥机房外门禁	12	1
1696	2019-09-18 15:43:31	密钥机房外门禁	12	1
1699	2019-09-18 15:43:35	密钥机房外门禁	12	1
1705	2019-09-18 15:44:12	密钥机房外门禁	1003	1
1708	2019-09-18 15:45:06	密钥机房外门禁	1003	1
1712	2019-09-18 15:45:08	密钥机房外门禁	1003	1
1715	2019-09-18 15:45:09	密钥机房外门禁	1003	1
1719	2019-09-18 15:45:11	密钥机房外门禁	1003	1
1723	2019-09-18 15:45:12	密钥机房外门禁	1003	1
1728	2019-09-18 15:45:14	密钥机房外门禁	1003	1
1732	2019-09-18 15:45:16	密钥机房外门禁	1003	1
1737	2019-09-18 15:45:17	密钥机房外门禁	1003	1
1741	2019-09-18 15:45:20	密钥机房外门禁	1003	1
1745	2019-09-18 15:45:27	密钥机房外门禁	12	1
1747	2019-09-18 15:45:29	密钥机房外门禁	12	1
1750	2019-09-18 15:45:31	密钥机房外门禁	12	1
1754	2019-09-18 15:45:34	密钥机房外门禁	12	1
1756	2019-09-18 15:45:36	密钥机房外门禁	12	1
1759	2019-09-18 15:45:41	密钥机房外门禁	12	1
1763	2019-09-18 15:46:48	密钥机房外门禁	1001	1
1766	2019-09-18 15:46:50	密钥机房外门禁	1001	1
1768	2019-09-18 15:46:53	密钥机房外门禁	1001	1
1772	2019-09-18 15:46:56	密钥机房外门禁	1001	1
1774	2019-09-18 15:46:58	密钥机房外门禁	1001	1
1777	2019-09-18 15:47:01	密钥机房外门禁	1001	1
1781	2019-09-18 15:47:03	密钥机房外门禁	1001	1
1784	2019-09-18 15:47:14	密钥机房外门禁	1003	1
1787	2019-09-18 15:47:16	密钥机房外门禁	1003	1
1790	2019-09-18 15:47:17	密钥机房外门禁	1003	1
1793	2019-09-18 15:47:19	密钥机房外门禁	1003	1
1795	2019-09-18 15:47:21	密钥机房外门禁	1003	1
1798	2019-09-18 15:47:23	密钥机房外门禁	1003	1
1802	2019-09-18 15:47:25	密钥机房外门禁	1003	1
1804	2019-09-18 15:47:28	密钥机房外门禁	1003	1
1807	2019-09-18 15:48:17	密钥机房外门禁	1001	1
1811	2019-09-18 15:48:25	密钥机房外门禁	1003	1
1814	2019-09-18 15:50:09	密钥机房外门禁	1001	1
1817	2019-09-18 15:50:12	密钥机房外门禁	1003	1
1819	2019-09-18 15:50:55	密钥机房外门禁	1003	1
1823	2019-09-18 15:56:28	密钥机房外门禁	1001	1
1826	2019-09-18 15:56:29	密钥机房外门禁	0	1
1828	2019-09-18 15:56:33	密钥机房外门禁	1002	1
1832	2019-09-18 15:56:36	密钥机房外门禁	1001	1
1834	2019-09-18 15:57:32	密钥机房外门禁	1002	1
1838	2019-09-18 15:57:36	密钥机房外门禁	1001	1
1841	2019-09-18 15:58:38	密钥机房外门禁	1002	1
1843	2019-09-18 15:58:41	密钥机房外门禁	1003	1
1847	2019-09-18 15:58:52	密钥机房外门禁	1002	1
1850	2019-09-18 15:58:54	密钥机房外门禁	1003	1
1852	2019-09-18 15:59:01	密钥机房外门禁	1003	1
1856	2019-09-18 15:59:04	密钥机房外门禁	1001	1
1860	2019-09-18 16:01:34	密钥机房外门禁	1	1
1864	2019-09-18 16:01:45	密钥机房外门禁	1	1
1868	2019-09-18 16:01:53	密钥机房外门禁	1003	1
1872	2019-09-18 16:01:56	密钥机房外门禁	1001	1
1877	2019-09-18 16:02:27	密钥机房外门禁	1001	1
1881	2019-09-18 16:02:31	密钥机房外门禁	1003	1
1885	2019-09-18 16:02:49	密钥机房外门禁	1002	1
1889	2019-09-18 16:02:52	密钥机房外门禁	1001	1
1892	2019-09-18 16:03:32	密钥机房外门禁	1001	1
1896	2019-09-18 16:03:34	密钥机房外门禁	1002	1
1901	2019-09-18 16:04:14	密钥机房外门禁	1001	1
1905	2019-09-18 16:04:17	密钥机房外门禁	1003	1
1909	2019-09-18 16:05:12	密钥机房外门禁	1001	1
1913	2019-09-18 16:05:15	密钥机房外门禁	1003	1
1916	2019-09-18 16:05:25	密钥机房外门禁	1001	1
1920	2019-09-18 16:05:28	密钥机房外门禁	1003	1
1931	2019-09-18 16:06:36	密钥机房外门禁	1003	1
1933	2019-09-18 16:06:39	密钥机房外门禁	1001	1
1939	2019-09-18 16:07:36	密钥机房外门禁	1001	1
1942	2019-09-18 16:07:38	密钥机房外门禁	1003	1
1946	2019-09-18 16:08:25	密钥机房外门禁	1003	1
1950	2019-09-18 16:08:27	密钥机房外门禁	1001	1
1955	2019-09-18 16:10:00	密钥机房外门禁	1002	1
1958	2019-09-18 16:10:03	密钥机房外门禁	1003	1
1962	2019-09-18 16:10:15	密钥机房外门禁	1001	1
1966	2019-09-18 16:10:18	密钥机房外门禁	1002	1
1971	2019-09-18 16:11:40	密钥机房外门禁	1004	1
1973	2019-09-18 16:11:45	密钥机房外门禁	1001	1
1978	2019-09-18 16:11:57	密钥机房外门禁	1004	1
1982	2019-09-18 16:12:00	密钥机房外门禁	1002	1
1985	2019-09-18 16:13:00	密钥机房外门禁	1004	1
1990	2019-09-18 16:13:03	密钥机房外门禁	1003	1
1994	2019-09-18 16:14:30	密钥机房外门禁	1002	1
1998	2019-09-18 16:14:32	密钥机房外门禁	1001	1
2001	2019-09-18 16:30:50	密钥机房外门禁	1004	1
2005	2019-09-18 16:30:52	密钥机房外门禁	0	1
2010	2019-09-18 16:30:54	密钥机房外门禁	1002	1
2014	2019-09-18 16:32:29	密钥机房外门禁	1004	1
2018	2019-09-18 16:32:31	密钥机房外门禁	1002	1
2021	2019-09-19 08:23:42	密钥机房外门禁	1002	1
2026	2019-09-19 08:23:45	密钥机房外门禁	1001	1
2030	2019-09-20 11:27:47	密钥机房外门禁	1002	1
2033	2019-09-20 11:27:54	密钥机房外门禁	1001	1
2038	2019-09-20 16:42:44	密钥机房外门禁	1002	1
2042	2019-09-20 16:43:58	密钥机房外门禁	1001	1
2046	2019-09-20 16:44:02	密钥机房外门禁	1002	1
2049	2019-09-20 16:50:23	密钥机房外门禁	1002	1
2053	2019-09-20 16:50:25	密钥机房外门禁	1001	1
2058	2019-09-20 16:55:30	密钥机房外门禁	0	1
2061	2019-09-20 16:55:37	密钥机房外门禁	1002	1
2066	2019-09-20 16:55:39	密钥机房外门禁	1001	1
1704	2019-09-18 00:42:45	CA机房外门禁	11	1
1707	2019-09-18 00:42:48	CA机房外门禁	12	1
1713	2019-09-18 14:33:55	CA机房外门禁	1	1
1716	2019-09-18 14:39:28	CA机房外门禁	11	1
1721	2019-09-18 14:39:32	CA机房外门禁	12	1
1725	2019-09-18 14:41:22	CA机房外门禁	11	1
1729	2019-09-18 14:41:25	CA机房外门禁	12	1
1733	2019-09-18 14:42:53	CA机房外门禁	11	1
1735	2019-09-18 14:43:00	CA机房外门禁	12	1
1740	2019-09-18 14:43:05	CA机房外门禁	11	1
1744	2019-09-18 14:43:40	CA机房外门禁	11	1
1748	2019-09-18 14:43:44	CA机房外门禁	12	1
1751	2019-09-18 14:46:52	CA机房外门禁	11	1
1753	2019-09-18 14:46:55	CA机房外门禁	12	1
1757	2019-09-18 14:55:33	CA机房外门禁	11	1
1760	2019-09-18 14:55:36	CA机房外门禁	12	1
1762	2019-09-18 14:56:49	CA机房外门禁	11	1
1765	2019-09-18 14:56:52	CA机房外门禁	12	1
1769	2019-09-18 14:59:17	CA机房外门禁	11	1
1771	2019-09-18 14:59:20	CA机房外门禁	12	1
1775	2019-09-20 17:32:50	CA机房外门禁	1001	1
1778	2019-09-20 17:32:51	CA机房外门禁	1001	1
1780	2019-09-20 17:32:53	CA机房外门禁	1002	1
1783	2020-04-28 09:55:58	CA机房外门禁	0	1
1786	2020-04-28 09:56:00	CA机房外门禁	0	1
1789	2020-04-28 09:56:09	CA机房外门禁	0	1
1792	2020-04-28 09:56:10	CA机房外门禁	0	1
1796	2020-04-28 09:56:12	CA机房外门禁	0	1
1799	2020-04-28 09:56:14	CA机房外门禁	0	1
1801	2020-04-28 09:56:15	CA机房外门禁	0	1
1805	2020-04-28 09:56:16	CA机房外门禁	0	1
1808	2020-04-28 09:56:17	CA机房外门禁	0	1
1810	2020-04-28 09:56:18	CA机房外门禁	0	1
1813	2020-04-28 09:56:22	CA机房外门禁	0	1
1816	2020-04-28 09:56:26	CA机房外门禁	0	1
1820	2020-04-28 09:56:29	CA机房外门禁	0	1
1822	2020-04-30 10:46:58	CA机房外门禁	1001	1
1825	2020-04-30 10:47:03	CA机房外门禁	1001	1
1829	2020-04-30 10:47:06	CA机房外门禁	0	1
1831	2020-04-30 10:47:12	CA机房外门禁	0	1
1835	2020-04-30 10:47:14	CA机房外门禁	0	1
1837	2020-04-30 10:47:29	CA机房外门禁	1001	1
1840	2020-04-30 10:47:31	CA机房外门禁	1001	1
1844	2020-04-30 10:47:34	CA机房外门禁	1001	1
1846	2020-04-30 10:47:37	CA机房外门禁	1001	1
1849	2020-04-30 10:47:43	CA机房外门禁	0	1
1853	2020-04-30 10:47:44	CA机房外门禁	1001	1
1857	2020-04-30 10:47:46	CA机房外门禁	1001	1
1861	2020-04-30 10:47:50	CA机房外门禁	1001	1
1865	2020-04-30 10:47:51	CA机房外门禁	1001	1
1869	2020-04-30 10:47:53	CA机房外门禁	0	1
1873	2020-04-30 10:47:55	CA机房外门禁	1001	1
1876	2020-04-30 10:47:56	CA机房外门禁	1001	1
1880	2020-04-30 10:47:58	CA机房外门禁	1001	1
1884	2020-04-30 10:48:00	CA机房外门禁	1001	1
1888	2020-04-30 10:48:04	CA机房外门禁	1001	1
1893	2020-04-30 10:48:08	CA机房外门禁	1001	1
1897	2020-04-30 10:48:11	CA机房外门禁	1001	1
1900	2020-04-30 10:48:14	CA机房外门禁	1001	1
1904	2020-04-30 10:48:15	CA机房外门禁	1001	1
1908	2020-04-30 10:48:17	CA机房外门禁	1001	1
1912	2020-04-30 10:48:18	CA机房外门禁	1001	1
1917	2020-04-30 10:48:25	CA机房外门禁	0	1
1927	2020-04-30 10:48:26	CA机房外门禁	1001	1
1929	2020-05-09 16:11:02	CA机房外门禁	0	1
1934	2020-05-11 15:19:19	CA机房外门禁	2	1
1938	2020-05-11 15:19:24	CA机房外门禁	1002	1
1941	2020-05-12 11:14:16	CA机房外门禁	1002	1
1945	2020-05-12 11:14:19	CA机房外门禁	0	1
1949	2020-05-12 11:14:21	CA机房外门禁	1002	1
1953	2020-05-12 11:14:23	CA机房外门禁	0	1
1957	2020-05-12 11:14:27	CA机房外门禁	0	1
1963	2020-05-12 11:14:29	CA机房外门禁	0	1
1967	2020-05-12 11:14:31	CA机房外门禁	0	1
1969	2020-05-12 11:14:33	CA机房外门禁	0	1
1975	2020-05-12 11:14:36	CA机房外门禁	0	1
1980	2020-05-12 11:14:38	CA机房外门禁	0	1
1983	2020-05-12 11:14:40	CA机房外门禁	0	1
1988	2020-05-12 11:14:42	CA机房外门禁	0	1
1991	2020-05-12 11:14:44	CA机房外门禁	0	1
1996	2020-05-12 11:14:46	CA机房外门禁	0	1
2000	2020-05-12 11:14:49	CA机房外门禁	0	1
2004	2020-05-12 11:14:50	CA机房外门禁	0	1
2008	2020-05-12 11:14:52	CA机房外门禁	0	1
2011	2020-05-12 11:14:54	CA机房外门禁	0	1
2016	2020-05-12 11:14:56	CA机房外门禁	0	1
2019	2020-05-12 11:14:58	CA机房外门禁	0	1
2023	2020-05-12 11:15:00	CA机房外门禁	0	1
2028	2020-05-12 11:15:02	CA机房外门禁	0	1
2032	2020-05-12 11:15:04	CA机房外门禁	0	1
2035	2020-05-12 11:15:06	CA机房外门禁	0	1
2040	2020-05-12 11:15:08	CA机房外门禁	0	1
2044	2020-05-12 11:15:11	CA机房外门禁	0	1
2047	2020-05-12 11:15:13	CA机房外门禁	0	1
2051	2020-05-13 15:45:22	CA机房外门禁	1002	1
2055	2020-05-13 15:45:26	CA机房外门禁	0	1
2060	2020-05-13 15:45:28	CA机房外门禁	0	1
2064	2020-05-13 15:45:30	CA机房外门禁	0	1
2067	2020-05-13 15:45:32	CA机房外门禁	0	1
2071	2020-05-13 15:45:36	CA机房外门禁	0	1
2075	2020-05-13 15:45:37	CA机房外门禁	0	1
2079	2020-05-13 15:45:39	CA机房外门禁	0	1
2083	2020-05-13 15:45:43	CA机房外门禁	0	1
2087	2020-05-13 15:45:45	CA机房外门禁	0	1
2092	2020-05-13 15:45:47	CA机房外门禁	0	1
2096	2020-05-13 15:45:48	CA机房外门禁	0	1
2100	2020-05-13 15:46:11	CA机房外门禁	0	1
2103	2020-05-13 15:46:13	CA机房外门禁	0	1
2107	2020-05-13 15:46:15	CA机房外门禁	0	1
2112	2020-05-13 16:12:06	CA机房外门禁	0	1
2116	2020-05-13 16:12:09	CA机房外门禁	0	1
2119	2020-05-13 16:12:11	CA机房外门禁	0	1
2123	2020-05-13 16:12:13	CA机房外门禁	0	1
2127	2020-05-13 16:12:15	CA机房外门禁	0	1
1734	2019-10-15 13:38:27	信息机房外门禁	1001	1
1738	2019-10-15 13:38:29	信息机房外门禁	1008	1
1742	2019-10-15 15:45:36	信息机房外门禁	1001	1
1855	2019-10-15 15:45:38	信息机房外门禁	1008	1
1858	2019-10-15 21:22:32	信息机房外门禁	1001	1
1862	2019-10-15 21:22:34	信息机房外门禁	1008	1
1867	2019-10-16 14:06:05	信息机房外门禁	1002	1
1871	2019-10-16 14:06:08	信息机房外门禁	1001	1
1875	2019-10-18 07:57:35	信息机房外门禁	1008	1
1878	2019-10-18 07:57:36	信息机房外门禁	1001	1
1883	2019-10-18 08:08:10	信息机房外门禁	1001	1
1887	2019-10-18 08:08:12	信息机房外门禁	1008	1
1890	2019-10-21 08:10:52	信息机房外门禁	1001	1
1894	2019-10-21 08:10:54	信息机房外门禁	1008	1
1898	2019-10-21 11:37:05	信息机房外门禁	0	1
1903	2019-10-21 11:37:06	信息机房外门禁	0	1
1907	2019-10-21 11:37:12	信息机房外门禁	0	1
1910	2019-10-21 11:37:14	信息机房外门禁	0	1
1915	2019-10-21 11:37:15	信息机房外门禁	0	1
1919	2019-10-21 11:37:28	信息机房外门禁	1002	1
1922	2019-10-21 11:37:29	信息机房外门禁	1002	1
1923	2019-10-21 11:37:30	信息机房外门禁	0	1
1926	2019-10-21 11:37:31	信息机房外门禁	0	1
1930	2019-10-21 11:37:32	信息机房外门禁	0	1
1935	2019-10-21 11:37:34	信息机房外门禁	0	1
1937	2019-10-21 11:37:35	信息机房外门禁	0	1
1943	2019-10-21 11:37:36	信息机房外门禁	0	1
1947	2019-10-21 11:37:38	信息机房外门禁	0	1
1951	2019-10-21 11:37:39	信息机房外门禁	0	1
1954	2019-10-21 11:37:40	信息机房外门禁	0	1
1959	2019-10-21 11:37:43	信息机房外门禁	0	1
1961	2019-10-21 11:37:44	信息机房外门禁	0	1
1965	2019-10-21 11:37:48	信息机房外门禁	0	1
1970	2019-10-21 11:37:52	信息机房外门禁	0	1
1974	2019-10-21 11:37:54	信息机房外门禁	1002	1
1977	2019-10-21 11:37:56	信息机房外门禁	1002	1
1981	2019-10-21 11:38:08	信息机房外门禁	0	1
1986	2019-10-21 11:38:09	信息机房外门禁	0	1
1989	2019-10-21 11:38:11	信息机房外门禁	0	1
1993	2019-10-21 11:38:13	信息机房外门禁	0	1
1997	2019-10-21 11:38:14	信息机房外门禁	0	1
2002	2019-10-21 11:38:16	信息机房外门禁	0	1
2006	2019-10-21 11:38:17	信息机房外门禁	0	1
2009	2019-10-21 11:38:19	信息机房外门禁	0	1
2013	2019-10-21 11:38:20	信息机房外门禁	0	1
2017	2019-10-21 11:38:23	信息机房外门禁	0	1
2022	2019-10-21 11:38:43	信息机房外门禁	0	1
2025	2019-10-21 11:38:45	信息机房外门禁	0	1
2029	2019-10-21 11:38:46	信息机房外门禁	0	1
2034	2019-10-21 11:38:48	信息机房外门禁	0	1
2037	2019-10-21 11:38:49	信息机房外门禁	0	1
2041	2019-10-21 11:38:50	信息机房外门禁	0	1
2045	2019-10-21 11:38:52	信息机房外门禁	0	1
2050	2019-10-21 11:38:53	信息机房外门禁	0	1
2054	2019-10-21 11:38:55	信息机房外门禁	0	1
2057	2019-10-21 11:38:56	信息机房外门禁	0	1
2062	2019-10-21 11:38:57	信息机房外门禁	0	1
2065	2019-10-21 11:38:59	信息机房外门禁	0	1
2069	2019-10-21 11:39:24	信息机房外门禁	0	1
2073	2019-10-21 11:39:27	信息机房外门禁	0	1
2077	2019-10-21 11:39:36	信息机房外门禁	0	1
2082	2019-10-21 11:39:38	信息机房外门禁	0	1
2086	2019-10-21 11:39:40	信息机房外门禁	0	1
2090	2019-10-21 11:39:42	信息机房外门禁	0	1
2094	2019-10-21 11:39:44	信息机房外门禁	0	1
2097	2019-10-21 11:39:46	信息机房外门禁	0	1
2102	2019-10-21 11:39:50	信息机房外门禁	0	1
2106	2019-10-21 11:39:51	信息机房外门禁	0	1
2110	2019-10-21 11:39:53	信息机房外门禁	0	1
2114	2019-10-21 11:39:54	信息机房外门禁	0	1
2118	2019-10-21 11:39:55	信息机房外门禁	0	1
2121	2019-10-21 11:39:56	信息机房外门禁	0	1
2125	2019-10-21 11:39:57	信息机房外门禁	0	1
2129	2019-10-21 11:39:58	信息机房外门禁	0	1
2134	2019-10-21 11:39:59	信息机房外门禁	0	1
2138	2019-10-21 11:40:00	信息机房外门禁	0	1
2142	2019-10-21 11:40:01	信息机房外门禁	0	1
2145	2019-10-21 11:40:02	信息机房外门禁	0	1
2150	2019-10-21 11:40:03	信息机房外门禁	0	1
2154	2019-10-21 11:40:10	信息机房外门禁	0	1
2158	2019-10-21 11:40:11	信息机房外门禁	0	1
2161	2019-10-21 11:40:45	信息机房外门禁	1002	1
2165	2019-10-21 11:40:47	信息机房外门禁	1002	1
2170	2019-10-21 11:40:48	信息机房外门禁	1002	1
2174	2019-10-21 11:40:50	信息机房外门禁	1002	1
2177	2019-10-21 11:40:54	信息机房外门禁	1001	1
2181	2019-10-21 11:46:13	信息机房外门禁	1002	1
2185	2019-10-21 11:46:16	信息机房外门禁	1001	1
2189	2019-10-22 08:13:29	信息机房外门禁	0	1
2193	2019-10-22 08:13:31	信息机房外门禁	1002	1
2198	2019-10-22 08:13:34	信息机房外门禁	1008	1
2201	2019-10-22 08:13:45	信息机房外门禁	1001	1
2205	2019-10-22 08:13:47	信息机房外门禁	1002	1
2210	2019-10-22 13:58:42	信息机房外门禁	1002	1
2213	2019-10-22 13:58:44	信息机房外门禁	1001	1
2218	2019-10-22 14:07:07	信息机房外门禁	0	1
2221	2019-10-22 14:07:12	信息机房外门禁	0	1
2225	2019-10-22 15:47:10	信息机房外门禁	1002	1
2229	2019-10-22 15:47:14	信息机房外门禁	1001	1
2234	2019-10-22 20:18:55	信息机房外门禁	1004	1
2237	2019-10-22 20:18:58	信息机房外门禁	1001	1
2242	2019-10-23 15:47:22	信息机房外门禁	0	1
2246	2019-10-23 15:47:26	信息机房外门禁	1002	1
2250	2019-10-23 15:47:28	信息机房外门禁	1001	1
2254	2019-10-23 15:47:43	信息机房外门禁	1002	1
2257	2019-10-23 15:49:00	信息机房外门禁	1001	1
2261	2019-10-23 15:49:04	信息机房外门禁	1002	1
1736	2019-11-27 16:43:05	信息机房内门禁	1001	1
1739	2019-11-27 16:43:22	信息机房内门禁	1008	1
1743	2019-11-27 16:43:24	信息机房内门禁	1001	1
1746	2019-11-27 16:43:33	信息机房内门禁	1001	1
1749	2019-11-27 16:43:35	信息机房内门禁	1008	1
1752	2019-11-27 16:45:52	信息机房内门禁	1001	1
1755	2019-11-27 16:45:55	信息机房内门禁	1008	1
1758	2019-11-28 10:29:16	信息机房内门禁	1001	1
1761	2019-11-28 10:29:19	信息机房内门禁	1008	1
1764	2019-11-28 10:48:33	信息机房内门禁	1008	1
1767	2019-11-28 10:48:36	信息机房内门禁	1001	1
1770	2019-11-28 11:27:44	信息机房内门禁	1001	1
1773	2019-11-28 11:27:46	信息机房内门禁	1008	1
1776	2019-11-28 13:56:54	信息机房内门禁	1001	1
1779	2019-11-28 13:56:56	信息机房内门禁	1008	1
1782	2019-11-29 08:35:58	信息机房内门禁	1001	1
1785	2019-11-29 08:36:00	信息机房内门禁	1008	1
1788	2019-12-02 10:03:52	信息机房内门禁	1008	1
1791	2019-12-02 10:03:54	信息机房内门禁	1001	1
1794	2019-12-02 15:15:07	信息机房内门禁	1001	1
1797	2019-12-02 15:15:11	信息机房内门禁	1008	1
1800	2019-12-04 08:29:13	信息机房内门禁	1001	1
1803	2019-12-04 08:29:17	信息机房内门禁	1008	1
1806	2019-12-04 09:25:25	信息机房内门禁	1003	1
1809	2019-12-04 09:25:27	信息机房内门禁	1009	1
1812	2019-12-04 09:28:22	信息机房内门禁	1008	1
1815	2019-12-04 09:28:25	信息机房内门禁	1001	1
1818	2019-12-04 10:34:31	信息机房内门禁	1001	1
1821	2019-12-04 10:34:33	信息机房内门禁	1008	1
1824	2019-12-05 08:26:34	信息机房内门禁	1001	1
1827	2019-12-05 08:26:36	信息机房内门禁	1008	1
1830	2019-12-08 14:52:57	信息机房内门禁	1002	1
1833	2019-12-08 14:52:59	信息机房内门禁	1001	1
1836	2019-12-09 08:35:33	信息机房内门禁	1001	1
1839	2019-12-09 08:35:35	信息机房内门禁	1008	1
1842	2019-12-09 10:07:13	信息机房内门禁	1008	1
1845	2019-12-09 10:07:15	信息机房内门禁	1001	1
1848	2019-12-09 11:29:25	信息机房内门禁	1008	1
1851	2019-12-09 11:29:27	信息机房内门禁	1001	1
1854	2019-12-09 15:58:38	信息机房内门禁	1001	1
1859	2019-12-09 15:58:40	信息机房内门禁	1008	1
1863	2019-12-10 08:13:54	信息机房内门禁	1001	1
1866	2019-12-10 08:13:56	信息机房内门禁	1008	1
1870	2019-12-10 09:02:40	信息机房内门禁	1001	1
1874	2019-12-10 09:02:42	信息机房内门禁	1008	1
1879	2019-12-10 09:51:58	信息机房内门禁	1001	1
1882	2019-12-10 09:52:00	信息机房内门禁	1008	1
1886	2019-12-10 14:17:22	信息机房内门禁	1008	1
1891	2019-12-10 14:17:25	信息机房内门禁	1001	1
1895	2019-12-11 08:33:48	信息机房内门禁	1008	1
1899	2019-12-11 08:33:51	信息机房内门禁	1001	1
1902	2019-12-13 08:13:23	信息机房内门禁	1001	1
1906	2019-12-13 08:13:25	信息机房内门禁	1008	1
1911	2019-12-13 09:25:41	信息机房内门禁	1001	1
1914	2019-12-13 09:25:43	信息机房内门禁	1008	1
1918	2019-12-16 08:17:58	信息机房内门禁	1001	1
1921	2019-12-16 08:18:01	信息机房内门禁	1008	1
1924	2019-12-16 08:40:12	信息机房内门禁	1008	1
1925	2019-12-16 08:40:21	信息机房内门禁	1001	1
1928	2019-12-16 08:40:27	信息机房内门禁	1008	1
1932	2019-12-16 08:40:47	信息机房内门禁	1001	1
1936	2019-12-16 08:40:50	信息机房内门禁	1008	1
1940	2019-12-19 16:24:59	信息机房内门禁	1008	1
1944	2019-12-19 16:25:02	信息机房内门禁	1001	1
1948	2019-12-26 14:06:30	信息机房内门禁	1002	1
1952	2019-12-26 14:06:34	信息机房内门禁	1001	1
1956	2019-12-27 09:40:14	信息机房内门禁	1001	1
1960	2019-12-27 09:40:16	信息机房内门禁	1008	1
1964	2019-12-27 10:53:15	信息机房内门禁	1008	1
1968	2019-12-27 10:53:59	信息机房内门禁	1001	1
1972	2019-12-27 19:38:38	信息机房内门禁	1003	1
1976	2019-12-27 19:38:40	信息机房内门禁	1009	1
1979	2019-12-27 19:47:18	信息机房内门禁	1003	1
1984	2019-12-27 19:47:20	信息机房内门禁	1009	1
1987	2019-12-27 19:56:10	信息机房内门禁	1003	1
1992	2019-12-27 19:56:12	信息机房内门禁	1009	1
1995	2019-12-28 09:16:52	信息机房内门禁	1003	1
1999	2019-12-28 09:16:59	信息机房内门禁	1009	1
2003	2019-12-29 15:20:37	信息机房内门禁	1008	1
2007	2019-12-29 15:20:39	信息机房内门禁	1001	1
2012	2020-01-08 16:15:08	信息机房内门禁	1002	1
2015	2020-01-08 16:15:12	信息机房内门禁	1008	1
2020	2020-01-08 16:15:19	信息机房内门禁	1001	1
2024	2020-01-11 15:11:26	信息机房内门禁	1003	1
2027	2020-01-11 15:11:29	信息机房内门禁	1009	1
2031	2020-01-14 17:09:50	信息机房内门禁	1008	1
2036	2020-01-14 17:09:52	信息机房内门禁	1001	1
2039	2020-01-18 11:00:57	信息机房内门禁	1008	1
2043	2020-01-18 11:00:59	信息机房内门禁	1001	1
2048	2020-01-18 11:13:16	信息机房内门禁	1001	1
2052	2020-01-18 11:13:18	信息机房内门禁	1008	1
2056	2020-03-11 16:20:01	信息机房内门禁	0	1
2059	2020-03-11 16:20:44	信息机房内门禁	1002	1
2063	2020-03-11 16:20:48	信息机房内门禁	1001	1
2068	2020-03-11 16:21:00	信息机房内门禁	1001	1
2072	2020-03-11 16:21:04	信息机房内门禁	1002	1
2076	2020-03-11 16:21:18	信息机房内门禁	1002	1
2080	2020-03-11 16:22:09	信息机房内门禁	1002	1
2084	2020-03-11 16:22:15	信息机房内门禁	0	1
2088	2020-03-11 16:22:17	信息机房内门禁	0	1
2091	2020-03-11 16:22:18	信息机房内门禁	0	1
2095	2020-03-11 16:22:27	信息机房内门禁	1002	1
2099	2020-03-11 16:23:07	信息机房内门禁	0	1
2104	2020-03-11 16:23:10	信息机房内门禁	1002	1
2108	2020-03-11 16:23:14	信息机房内门禁	1001	1
2111	2020-03-12 08:47:06	信息机房内门禁	1001	1
2115	2020-03-12 08:47:08	信息机房内门禁	1008	1
2070	2019-09-21 10:30:23	密钥机房外门禁	1000800	1
2074	2019-09-21 10:30:27	密钥机房外门禁	1002331	1
2078	2019-09-21 11:04:16	密钥机房外门禁	1000800	1
2081	2019-09-21 11:04:42	密钥机房外门禁	1002331	1
2085	2019-09-21 13:43:43	密钥机房外门禁	1000800	1
2089	2019-09-21 13:44:01	密钥机房外门禁	1002331	1
2093	2019-09-21 15:17:54	密钥机房外门禁	1000800	1
2098	2019-09-21 15:18:13	密钥机房外门禁	1002331	1
2101	2019-09-21 15:30:19	密钥机房外门禁	1002331	1
2105	2019-09-21 15:30:21	密钥机房外门禁	1000800	1
2109	2019-09-21 16:00:44	密钥机房外门禁	0	1
2113	2019-09-21 16:00:53	密钥机房外门禁	0	1
2117	2019-09-21 16:01:15	密钥机房外门禁	0	1
2122	2019-09-21 16:01:18	密钥机房外门禁	0	1
2126	2019-09-21 16:01:20	密钥机房外门禁	0	1
2130	2019-09-21 16:01:22	密钥机房外门禁	0	1
2133	2019-09-21 16:01:24	密钥机房外门禁	0	1
2137	2019-09-21 16:01:26	密钥机房外门禁	0	1
2141	2019-09-21 16:01:27	密钥机房外门禁	0	1
2146	2019-09-21 16:01:29	密钥机房外门禁	0	1
2149	2019-09-21 16:01:30	密钥机房外门禁	0	1
2153	2019-09-21 16:01:31	密钥机房外门禁	0	1
2157	2019-09-21 16:01:32	密钥机房外门禁	0	1
2162	2019-09-21 16:01:34	密钥机房外门禁	0	1
2166	2019-09-21 16:01:35	密钥机房外门禁	0	1
2169	2019-09-21 16:01:35	密钥机房外门禁	0	1
2173	2019-09-21 16:01:37	密钥机房外门禁	0	1
2178	2019-09-21 16:01:38	密钥机房外门禁	0	1
2182	2019-09-21 16:01:39	密钥机房外门禁	0	1
2186	2019-09-21 16:01:41	密钥机房外门禁	0	1
2190	2019-09-21 16:01:43	密钥机房外门禁	0	1
2194	2019-09-21 16:01:44	密钥机房外门禁	0	1
2197	2019-09-21 16:01:55	密钥机房外门禁	0	2
2202	2019-09-21 16:02:02	密钥机房外门禁	0	2
2206	2019-09-21 16:02:15	密钥机房外门禁	0	1
2209	2019-09-21 16:04:41	密钥机房外门禁	1003	1
2214	2019-09-21 16:04:42	密钥机房外门禁	1003	1
2217	2019-09-21 16:04:44	密钥机房外门禁	1003	1
2222	2019-09-21 16:04:46	密钥机房外门禁	1003	1
2226	2019-09-21 16:04:48	密钥机房外门禁	1003	1
2230	2019-09-21 16:04:51	密钥机房外门禁	1003	1
2233	2019-09-21 16:05:11	密钥机房外门禁	1002331	1
2238	2019-09-21 16:05:33	密钥机房外门禁	1002331	1
2241	2019-09-21 16:06:18	密钥机房外门禁	1002331	1
2245	2019-09-21 16:07:01	密钥机房外门禁	0	1
2249	2019-09-21 16:07:03	密钥机房外门禁	0	1
2253	2019-09-21 16:07:04	密钥机房外门禁	0	1
2258	2019-09-21 16:07:05	密钥机房外门禁	0	1
2262	2019-09-21 16:07:06	密钥机房外门禁	0	1
2265	2019-09-21 16:07:07	密钥机房外门禁	0	1
2269	2019-09-21 16:07:08	密钥机房外门禁	0	1
2274	2019-09-21 16:07:09	密钥机房外门禁	0	1
2278	2019-09-21 16:07:10	密钥机房外门禁	0	1
2282	2019-09-21 16:07:11	密钥机房外门禁	0	1
2286	2019-09-21 16:07:12	密钥机房外门禁	0	1
2289	2019-09-21 16:07:13	密钥机房外门禁	0	1
2293	2019-09-21 16:07:15	密钥机房外门禁	0	1
2297	2019-09-21 16:07:16	密钥机房外门禁	0	1
2302	2019-09-21 16:07:17	密钥机房外门禁	0	1
2306	2019-09-21 16:07:18	密钥机房外门禁	0	1
2309	2019-09-21 16:07:19	密钥机房外门禁	0	1
2313	2019-09-21 16:07:25	密钥机房外门禁	0	1
2318	2019-09-21 16:07:27	密钥机房外门禁	0	1
2321	2019-09-21 16:07:30	密钥机房外门禁	0	1
2326	2019-09-21 16:07:33	密钥机房外门禁	0	1
2329	2019-09-21 16:07:36	密钥机房外门禁	0	1
2334	2019-09-21 16:07:38	密钥机房外门禁	0	1
2337	2019-09-21 16:07:44	密钥机房外门禁	0	1
2341	2019-09-21 16:07:47	密钥机房外门禁	0	1
2345	2019-09-21 16:07:49	密钥机房外门禁	0	1
2350	2019-09-21 16:07:55	密钥机房外门禁	0	1
2354	2019-09-21 16:07:58	密钥机房外门禁	1003	1
2358	2019-09-21 16:08:13	密钥机房外门禁	0	1
2361	2019-09-21 16:08:15	密钥机房外门禁	0	1
2366	2019-09-21 16:08:16	密钥机房外门禁	0	1
2370	2019-09-21 16:08:18	密钥机房外门禁	0	1
2374	2019-09-21 16:08:19	密钥机房外门禁	0	1
2378	2019-09-21 16:08:21	密钥机房外门禁	0	1
2382	2019-09-21 16:08:23	密钥机房外门禁	1003	1
2386	2019-09-21 16:08:26	密钥机房外门禁	1003	1
2390	2019-09-21 16:08:28	密钥机房外门禁	1003	1
2394	2019-09-21 16:08:30	密钥机房外门禁	1003	1
2398	2019-09-21 16:08:32	密钥机房外门禁	1003	1
2402	2019-09-21 16:08:34	密钥机房外门禁	1003	1
2405	2019-09-21 16:08:37	密钥机房外门禁	1003	1
2409	2019-09-21 16:10:26	密钥机房外门禁	0	1
2413	2019-09-21 16:10:28	密钥机房外门禁	1002	1
2418	2019-09-21 16:10:31	密钥机房外门禁	0	1
2422	2019-09-21 16:10:33	密钥机房外门禁	1002	1
2425	2019-09-21 16:10:34	密钥机房外门禁	1002	1
2430	2019-09-21 16:10:37	密钥机房外门禁	1002	1
2433	2019-09-21 16:10:40	密钥机房外门禁	1002	1
2438	2019-09-21 16:23:02	密钥机房外门禁	1002331	1
2442	2019-09-21 16:23:05	密钥机房外门禁	1000800	1
2445	2019-09-21 16:30:08	密钥机房外门禁	2	1
2449	2019-09-21 16:36:12	密钥机房外门禁	1002331	1
2453	2019-09-21 16:36:15	密钥机房外门禁	1000800	1
2457	2019-09-21 16:37:05	密钥机房外门禁	1002331	1
2462	2019-09-21 16:38:14	密钥机房外门禁	1002331	1
2466	2019-09-21 16:38:21	密钥机房外门禁	1000800	1
2470	2019-09-21 16:39:48	密钥机房外门禁	0	1
2472	2019-09-23 09:27:10	密钥机房外门禁	1000800	1
2476	2019-09-23 09:27:16	密钥机房外门禁	1002331	1
2479	2019-09-23 11:00:15	密钥机房外门禁	1000800	1
5236	2022-01-08 16:21:36	CA机房外门禁	0	1
2120	2020-03-13 17:27:42	信息机房内门禁	1008	1
2124	2020-03-13 17:27:51	信息机房内门禁	1001	1
2128	2020-03-13 22:20:04	信息机房内门禁	1008	1
2131	2020-03-13 22:20:06	信息机房内门禁	1001	1
2136	2020-03-14 11:42:44	信息机房内门禁	1008	1
2140	2020-03-14 11:42:47	信息机房内门禁	1001	1
2144	2020-03-16 10:22:32	信息机房内门禁	1008	1
2148	2020-03-16 10:22:42	信息机房内门禁	1001	1
2151	2020-03-16 12:07:16	信息机房内门禁	1008	1
2156	2020-03-16 12:07:18	信息机房内门禁	1001	1
2159	2020-03-16 22:01:01	信息机房内门禁	1008	1
2163	2020-03-16 22:01:04	信息机房内门禁	1001	1
2167	2020-03-17 08:19:45	信息机房内门禁	1001	1
2172	2020-03-17 08:19:49	信息机房内门禁	1008	1
2175	2020-03-17 09:37:46	信息机房内门禁	1008	1
2180	2020-03-17 09:37:52	信息机房内门禁	1001	1
2183	2020-03-17 09:49:12	信息机房内门禁	1008	1
2187	2020-03-17 09:49:19	信息机房内门禁	1001	1
2191	2020-03-17 10:11:47	信息机房内门禁	1001	1
2196	2020-03-17 10:11:49	信息机房内门禁	1008	1
2200	2020-03-17 19:19:30	信息机房内门禁	1008	1
2204	2020-03-17 19:19:39	信息机房内门禁	1001	1
2207	2020-03-19 08:23:58	信息机房内门禁	1001	1
2211	2020-03-19 08:24:00	信息机房内门禁	1008	1
2216	2020-03-27 14:48:54	信息机房内门禁	1001	1
2220	2020-03-27 14:48:56	信息机房内门禁	1008	1
2224	2020-03-29 09:24:44	信息机房内门禁	1001	1
2228	2020-03-29 09:24:47	信息机房内门禁	1008	1
2231	2020-03-29 09:49:38	信息机房内门禁	1008	1
2235	2020-03-29 09:49:49	信息机房内门禁	1001	1
2240	2020-03-29 10:17:50	信息机房内门禁	1001	1
2243	2020-03-29 10:17:53	信息机房内门禁	1008	1
2247	2020-03-31 13:58:01	信息机房内门禁	1001	1
2251	2020-03-31 13:58:03	信息机房内门禁	1008	1
2255	2020-03-31 15:51:20	信息机房内门禁	1008	1
2260	2020-03-31 15:51:23	信息机房内门禁	1001	1
2263	2020-03-31 16:01:17	信息机房内门禁	1001	1
2268	2020-03-31 16:01:20	信息机房内门禁	1008	1
2272	2020-03-31 19:13:57	信息机房内门禁	1008	1
2276	2020-03-31 19:14:00	信息机房内门禁	1001	1
2279	2020-04-02 13:41:34	信息机房内门禁	1001	1
2283	2020-04-02 13:41:38	信息机房内门禁	1008	1
2288	2020-04-02 13:56:16	信息机房内门禁	1008	1
2291	2020-04-02 13:56:19	信息机房内门禁	1001	1
2295	2020-04-02 13:56:45	信息机房内门禁	1003	1
2300	2020-04-02 13:56:46	信息机房内门禁	0	1
2303	2020-04-02 13:56:49	信息机房内门禁	1009	1
2308	2020-04-02 13:57:40	信息机房内门禁	1003	1
2311	2020-04-02 13:57:43	信息机房内门禁	1009	1
2315	2020-04-02 13:58:02	信息机房内门禁	1003	1
2319	2020-04-02 13:58:04	信息机房内门禁	1009	1
2323	2020-04-22 12:05:27	信息机房内门禁	1008	1
2327	2020-04-22 12:05:29	信息机房内门禁	1001	1
2332	2020-04-28 14:28:53	信息机房内门禁	1002	1
2336	2020-04-28 14:28:56	信息机房内门禁	1001	1
2339	2020-05-12 11:34:38	信息机房内门禁	1002	1
2343	2020-05-12 11:34:41	信息机房内门禁	1001	1
2347	2020-05-14 13:04:03	信息机房内门禁	1001	1
2351	2020-05-14 13:04:05	信息机房内门禁	1008	1
2356	2020-05-14 13:14:07	信息机房内门禁	1001	1
2359	2020-05-14 13:14:09	信息机房内门禁	1002	1
2363	2020-05-15 10:37:29	信息机房内门禁	1002	1
2367	2020-05-15 10:37:33	信息机房内门禁	1001	1
2371	2020-05-15 10:41:16	信息机房内门禁	0	1
2375	2020-05-15 10:41:18	信息机房内门禁	1002	1
2380	2020-05-15 10:41:21	信息机房内门禁	1001	1
2383	2020-05-15 10:43:57	信息机房内门禁	1002	1
2388	2020-05-15 10:44:00	信息机房内门禁	1001	1
2391	2020-05-15 10:45:04	信息机房内门禁	1002	1
2395	2020-05-15 10:45:07	信息机房内门禁	1001	1
2399	2020-05-15 10:46:57	信息机房内门禁	1002	1
2403	2020-05-15 10:47:00	信息机房内门禁	1001	1
2407	2020-05-16 18:38:03	信息机房内门禁	1001	1
2412	2020-05-16 18:38:05	信息机房内门禁	1002	1
2416	2020-05-18 15:34:12	信息机房内门禁	1001	1
2420	2020-05-18 15:34:14	信息机房内门禁	1002	1
2423	2020-05-18 15:59:09	信息机房内门禁	1001	1
2428	2020-05-18 15:59:11	信息机房内门禁	1002	1
2432	2020-05-18 16:29:30	信息机房内门禁	1001	1
2435	2020-05-18 16:29:34	信息机房内门禁	1002	1
2440	2020-05-18 18:35:44	信息机房内门禁	1002	1
2443	2020-05-18 18:35:47	信息机房内门禁	1001	1
2448	2020-05-18 20:29:16	信息机房内门禁	1002	1
2452	2020-05-18 20:29:18	信息机房内门禁	1001	1
2456	2020-05-18 20:40:06	信息机房内门禁	1002	1
2459	2020-05-18 20:40:09	信息机房内门禁	1001	1
2463	2020-05-18 20:44:37	信息机房内门禁	1001	1
2467	2020-05-18 20:44:39	信息机房内门禁	1002	1
2480	2020-05-19 08:23:37	信息机房内门禁	1002	1
2484	2020-05-19 08:23:39	信息机房内门禁	1001	1
2488	2020-05-19 09:10:06	信息机房内门禁	1002	1
2492	2020-05-19 09:10:08	信息机房内门禁	1001	1
2496	2020-05-19 09:13:31	信息机房内门禁	1002	1
2499	2020-05-19 09:13:34	信息机房内门禁	1001	1
2503	2020-05-19 09:21:29	信息机房内门禁	1002	1
2507	2020-05-19 09:21:31	信息机房内门禁	1001	1
2511	2020-05-19 13:17:34	信息机房内门禁	1002	1
2516	2020-05-19 13:17:37	信息机房内门禁	1001	1
2518	2020-05-19 16:08:22	信息机房内门禁	1002	1
2523	2020-05-19 16:08:37	信息机房内门禁	1002	1
2528	2020-05-19 16:09:55	信息机房内门禁	1001	1
2531	2020-05-19 16:09:59	信息机房内门禁	1001	1
2534	2020-05-19 16:10:19	信息机房内门禁	1002	1
2540	2020-05-19 16:10:22	信息机房内门禁	1001	1
2544	2020-05-19 17:14:40	信息机房内门禁	0	1
2547	2020-05-19 17:14:43	信息机房内门禁	1002	1
2551	2020-05-19 17:14:45	信息机房内门禁	1001	1
2132	2020-05-13 16:12:17	CA机房外门禁	0	1
2135	2020-05-13 16:12:22	CA机房外门禁	0	1
2139	2020-05-13 16:12:26	CA机房外门禁	0	1
2143	2020-05-13 16:12:28	CA机房外门禁	0	1
2147	2020-05-13 16:12:29	CA机房外门禁	0	1
2152	2020-05-13 16:20:46	CA机房外门禁	0	1
2155	2020-05-13 16:20:49	CA机房外门禁	0	1
2160	2020-05-13 16:20:51	CA机房外门禁	0	1
2164	2020-05-13 16:20:53	CA机房外门禁	0	1
2168	2020-05-13 16:20:54	CA机房外门禁	0	1
2171	2020-05-13 16:20:56	CA机房外门禁	0	1
2176	2020-05-13 16:20:58	CA机房外门禁	0	1
2179	2020-05-13 16:20:59	CA机房外门禁	0	1
2184	2020-05-13 16:21:01	CA机房外门禁	0	1
2188	2020-05-13 16:21:03	CA机房外门禁	0	1
2192	2020-05-13 16:21:04	CA机房外门禁	0	1
2195	2020-05-13 16:21:06	CA机房外门禁	0	1
2199	2020-05-13 16:21:07	CA机房外门禁	0	1
2203	2020-05-13 16:21:09	CA机房外门禁	0	1
2208	2020-05-13 16:21:11	CA机房外门禁	0	1
2212	2020-05-13 16:21:12	CA机房外门禁	0	1
2215	2020-05-13 16:21:13	CA机房外门禁	0	1
2219	2020-05-13 16:21:15	CA机房外门禁	0	1
2223	2020-05-13 16:21:17	CA机房外门禁	0	1
2227	2020-05-13 16:21:19	CA机房外门禁	0	1
2232	2020-05-13 16:21:20	CA机房外门禁	0	1
2236	2020-05-13 16:21:23	CA机房外门禁	0	1
2239	2020-05-13 16:21:26	CA机房外门禁	0	1
2244	2020-05-13 16:21:28	CA机房外门禁	0	1
2248	2020-05-13 16:21:31	CA机房外门禁	0	1
2252	2020-05-13 16:21:36	CA机房外门禁	0	1
2256	2020-05-13 16:21:39	CA机房外门禁	0	1
2259	2020-05-13 16:21:41	CA机房外门禁	0	1
2264	2020-05-13 16:21:42	CA机房外门禁	0	1
2267	2020-05-13 17:06:56	CA机房外门禁	1001	1
2271	2020-05-13 17:07:04	CA机房外门禁	1001	1
2275	2020-05-13 17:07:06	CA机房外门禁	1001	1
2280	2020-05-13 17:07:07	CA机房外门禁	1001	1
2284	2020-05-13 17:07:09	CA机房外门禁	1001	1
2287	2020-05-13 17:07:11	CA机房外门禁	1001	1
2292	2020-05-13 17:07:12	CA机房外门禁	1001	1
2296	2020-05-13 17:07:17	CA机房外门禁	1001	1
2299	2020-05-13 17:07:20	CA机房外门禁	1001	1
2304	2020-05-13 17:07:23	CA机房外门禁	2	1
2307	2020-05-13 17:07:25	CA机房外门禁	0	1
2312	2020-05-13 17:07:26	CA机房外门禁	0	1
2316	2020-05-13 17:07:27	CA机房外门禁	0	1
2320	2020-05-13 17:07:29	CA机房外门禁	0	1
2324	2020-05-13 17:07:30	CA机房外门禁	0	1
2328	2020-05-13 17:07:31	CA机房外门禁	0	1
2331	2020-05-13 17:07:32	CA机房外门禁	0	1
2335	2020-05-13 17:07:33	CA机房外门禁	0	1
2340	2020-05-13 17:07:34	CA机房外门禁	0	1
2344	2020-05-13 17:07:35	CA机房外门禁	0	1
2348	2020-05-13 17:07:36	CA机房外门禁	0	1
2352	2020-05-13 17:07:38	CA机房外门禁	0	1
2355	2020-05-13 17:07:39	CA机房外门禁	0	1
2360	2020-05-13 17:07:40	CA机房外门禁	0	1
2364	2020-05-13 17:07:42	CA机房外门禁	0	1
2368	2020-05-13 17:07:43	CA机房外门禁	0	1
2372	2020-05-13 17:07:44	CA机房外门禁	0	1
2376	2020-05-13 17:07:45	CA机房外门禁	0	1
2379	2020-05-13 17:07:47	CA机房外门禁	0	1
2384	2020-05-13 17:07:48	CA机房外门禁	0	1
2387	2020-05-13 17:07:49	CA机房外门禁	0	1
2392	2020-05-13 17:07:51	CA机房外门禁	0	1
2396	2020-05-13 17:07:52	CA机房外门禁	0	1
2400	2020-05-13 17:07:54	CA机房外门禁	0	1
2404	2020-05-13 17:07:56	CA机房外门禁	0	1
2408	2020-05-13 17:07:57	CA机房外门禁	0	1
2411	2020-05-13 17:07:58	CA机房外门禁	0	1
2415	2020-05-13 17:08:00	CA机房外门禁	0	1
2419	2020-05-13 17:08:01	CA机房外门禁	0	1
2424	2020-05-13 17:08:02	CA机房外门禁	0	1
2427	2020-05-14 10:35:36	CA机房外门禁	0	1
2431	2020-05-14 10:35:38	CA机房外门禁	0	1
2436	2020-05-14 10:35:40	CA机房外门禁	0	1
2439	2020-05-14 10:35:42	CA机房外门禁	0	1
2444	2020-05-14 10:35:43	CA机房外门禁	0	1
2447	2020-05-14 10:35:45	CA机房外门禁	0	1
2451	2020-05-14 10:35:47	CA机房外门禁	0	1
2455	2020-05-14 10:35:49	CA机房外门禁	0	1
2460	2020-05-14 10:35:51	CA机房外门禁	0	1
2464	2020-05-14 10:35:53	CA机房外门禁	0	1
2468	2020-05-14 10:35:56	CA机房外门禁	0	1
2471	2020-05-14 10:36:00	CA机房外门禁	0	1
2474	2020-05-14 10:36:03	CA机房外门禁	0	1
2477	2020-05-14 10:36:05	CA机房外门禁	0	1
2481	2020-05-14 10:36:07	CA机房外门禁	0	1
2485	2020-05-14 10:36:08	CA机房外门禁	0	1
2489	2020-05-14 10:36:11	CA机房外门禁	0	1
2493	2020-05-14 10:36:13	CA机房外门禁	0	1
2497	2020-05-14 10:37:03	CA机房外门禁	0	1
2501	2020-05-14 10:37:05	CA机房外门禁	0	1
2505	2020-05-14 10:37:08	CA机房外门禁	0	1
2509	2020-05-14 10:37:10	CA机房外门禁	0	1
2513	2020-05-14 10:37:13	CA机房外门禁	0	1
2517	2020-05-14 10:37:15	CA机房外门禁	0	1
2521	2020-05-14 10:37:16	CA机房外门禁	0	1
2525	2020-05-14 10:37:17	CA机房外门禁	0	1
2529	2020-05-14 10:37:19	CA机房外门禁	0	1
2533	2020-05-14 10:37:21	CA机房外门禁	0	1
2537	2020-05-14 10:37:22	CA机房外门禁	0	1
2541	2020-05-14 10:37:24	CA机房外门禁	0	1
2545	2020-05-14 10:37:25	CA机房外门禁	0	1
2549	2020-05-14 10:37:59	CA机房外门禁	1002	1
2553	2020-05-14 10:39:02	CA机房外门禁	1003	1
2557	2020-05-14 10:39:05	CA机房外门禁	1002	1
2561	2020-05-14 10:39:09	CA机房外门禁	1003	1
2565	2020-05-14 10:39:12	CA机房外门禁	1002	1
2569	2020-05-14 10:39:15	CA机房外门禁	1003	1
2573	2020-05-14 10:39:17	CA机房外门禁	1002	1
2577	2020-05-14 10:39:20	CA机房外门禁	1003	1
2581	2020-05-14 10:39:22	CA机房外门禁	1002	1
2585	2020-05-14 10:39:25	CA机房外门禁	1003	1
2589	2020-05-14 10:39:26	CA机房外门禁	1002	1
2593	2020-05-14 10:40:05	CA机房外门禁	1003	1
2266	2019-10-25 14:52:00	信息机房外门禁	1008	1
2270	2019-10-25 14:52:01	信息机房外门禁	1001	1
2273	2019-10-25 15:24:14	信息机房外门禁	1008	1
2277	2019-10-25 15:24:16	信息机房外门禁	1001	1
2281	2019-10-28 10:47:45	信息机房外门禁	1008	1
2285	2019-10-28 10:47:48	信息机房外门禁	1001	1
2290	2019-10-31 07:58:46	信息机房外门禁	1001	1
2294	2019-10-31 07:58:48	信息机房外门禁	1008	1
2298	2019-10-31 08:07:42	信息机房外门禁	1001	1
2301	2019-10-31 08:07:44	信息机房外门禁	1008	1
2305	2019-11-01 23:02:46	信息机房外门禁	1001	1
2310	2019-11-01 23:02:48	信息机房外门禁	1008	1
2314	2019-11-04 16:14:06	信息机房外门禁	1008	1
2317	2019-11-04 16:14:10	信息机房外门禁	1001	1
2322	2019-11-04 19:12:15	信息机房外门禁	1001	1
2325	2019-11-04 19:12:17	信息机房外门禁	1008	1
2330	2019-11-04 19:56:09	信息机房外门禁	1008	1
2333	2019-11-04 19:56:11	信息机房外门禁	1001	1
2338	2019-11-05 16:05:00	信息机房外门禁	1008	1
2342	2019-11-05 16:05:01	信息机房外门禁	1001	1
2346	2019-11-07 15:49:39	信息机房外门禁	1008	1
2349	2019-11-07 15:49:40	信息机房外门禁	1001	1
2353	2019-11-08 10:04:36	信息机房外门禁	1003	1
2357	2019-11-08 10:04:40	信息机房外门禁	0	1
2362	2019-11-08 10:04:42	信息机房外门禁	0	1
2365	2019-11-08 10:04:51	信息机房外门禁	1009	1
2369	2019-11-10 17:30:13	信息机房外门禁	1008	1
2373	2019-11-10 17:30:15	信息机房外门禁	1001	1
2377	2019-11-14 08:07:13	信息机房外门禁	1008	1
2381	2019-11-14 08:07:15	信息机房外门禁	1001	1
2385	2019-11-14 09:07:16	信息机房外门禁	1001	1
2389	2019-11-14 09:07:18	信息机房外门禁	1008	1
2393	2019-11-14 09:14:37	信息机房外门禁	1008	1
2397	2019-11-14 09:14:39	信息机房外门禁	1001	1
2401	2019-11-14 11:15:10	信息机房外门禁	1001	1
2406	2019-11-14 11:15:12	信息机房外门禁	1008	1
2410	2019-11-16 21:27:23	信息机房外门禁	1003	1
2414	2019-11-16 21:27:26	信息机房外门禁	1009	1
2417	2019-11-18 11:33:50	信息机房外门禁	1008	1
2421	2019-11-18 11:33:52	信息机房外门禁	1001	1
2426	2019-11-18 21:39:46	信息机房外门禁	1003	1
2429	2019-11-18 21:39:47	信息机房外门禁	1009	1
2434	2019-11-18 21:39:59	信息机房外门禁	1003	1
2437	2019-11-18 21:40:01	信息机房外门禁	0	1
2441	2019-11-18 21:40:04	信息机房外门禁	1009	1
2446	2019-11-18 21:40:23	信息机房外门禁	1003	1
2450	2019-11-18 21:40:26	信息机房外门禁	1009	1
2454	2019-11-19 11:57:43	信息机房外门禁	1008	1
2458	2019-11-19 11:57:46	信息机房外门禁	1001	1
2461	2019-11-19 15:14:23	信息机房外门禁	1003	1
2465	2019-11-19 15:14:25	信息机房外门禁	1009	1
2469	2019-11-21 09:33:05	信息机房外门禁	1008	1
2473	2019-11-21 09:33:07	信息机房外门禁	1001	1
2475	2019-11-22 09:16:21	信息机房外门禁	1003	1
2478	2019-11-22 09:16:23	信息机房外门禁	0	1
2483	2019-11-22 09:16:26	信息机房外门禁	0	1
2486	2019-11-22 09:16:28	信息机房外门禁	1009	1
2490	2019-11-27 13:39:18	信息机房外门禁	1008	1
2494	2019-11-27 13:39:19	信息机房外门禁	1001	1
2498	2019-11-27 14:14:26	信息机房外门禁	1008	1
2504	2019-11-27 14:14:28	信息机房外门禁	1001	1
2508	2019-11-27 16:31:54	信息机房外门禁	1008	1
2510	2019-11-27 16:31:56	信息机房外门禁	1001	1
2515	2019-11-28 10:20:51	信息机房外门禁	1008	1
2519	2019-11-28 10:20:53	信息机房外门禁	1001	1
2524	2019-11-28 10:43:46	信息机房外门禁	1008	1
2526	2019-11-28 10:43:47	信息机房外门禁	1001	1
2532	2019-11-28 11:10:40	信息机房外门禁	1008	1
2535	2019-11-28 11:10:42	信息机房外门禁	1001	1
2539	2019-11-28 13:35:51	信息机房外门禁	1008	1
2542	2019-11-28 13:35:53	信息机房外门禁	1001	1
2548	2019-11-29 08:32:41	信息机房外门禁	1008	1
2550	2019-11-29 08:32:43	信息机房外门禁	1001	1
2555	2019-12-02 09:43:09	信息机房外门禁	1001	1
2560	2019-12-02 09:43:12	信息机房外门禁	1008	1
2562	2019-12-02 15:12:46	信息机房外门禁	1001	1
2566	2019-12-02 15:12:48	信息机房外门禁	1008	1
2570	2019-12-04 08:22:13	信息机房外门禁	1008	1
2575	2019-12-04 08:22:16	信息机房外门禁	1001	1
2579	2019-12-04 08:33:40	信息机房外门禁	1001	1
2584	2019-12-04 08:33:44	信息机房外门禁	1008	1
2586	2019-12-04 08:51:12	信息机房外门禁	1003	1
2590	2019-12-04 08:51:14	信息机房外门禁	0	1
2594	2019-12-04 08:51:16	信息机房外门禁	0	1
2598	2019-12-04 08:51:18	信息机房外门禁	0	1
2602	2019-12-04 08:51:21	信息机房外门禁	0	1
2606	2019-12-04 08:51:31	信息机房外门禁	1003	1
2610	2019-12-04 08:51:33	信息机房外门禁	1009	1
2614	2019-12-04 10:32:59	信息机房外门禁	1008	1
2618	2019-12-04 10:33:01	信息机房外门禁	1001	1
2623	2019-12-05 08:13:50	信息机房外门禁	1001	1
2627	2019-12-05 08:13:53	信息机房外门禁	1008	1
2632	2019-12-05 17:12:54	信息机房外门禁	1003	1
2635	2019-12-05 17:12:56	信息机房外门禁	0	1
2638	2019-12-05 17:12:58	信息机房外门禁	1009	1
2644	2019-12-05 22:47:29	信息机房外门禁	1001	1
2646	2019-12-05 22:47:32	信息机房外门禁	1008	1
2652	2019-12-08 14:32:53	信息机房外门禁	1001	1
2656	2019-12-08 14:32:54	信息机房外门禁	1002	1
2660	2019-12-09 08:31:53	信息机房外门禁	1008	1
2663	2019-12-09 08:31:56	信息机房外门禁	1001	1
2666	2019-12-09 10:06:08	信息机房外门禁	1008	1
2670	2019-12-09 10:06:10	信息机房外门禁	1001	1
2676	2019-12-09 11:28:01	信息机房外门禁	1008	1
2679	2019-12-09 11:28:03	信息机房外门禁	1001	1
2684	2019-12-09 15:55:20	信息机房外门禁	0	1
2688	2019-12-09 15:55:23	信息机房外门禁	1001	1
2482	2019-09-23 11:00:19	密钥机房外门禁	1002331	1
2487	2019-09-23 13:50:00	密钥机房外门禁	1000800	1
2491	2019-09-23 13:50:04	密钥机房外门禁	0	1
2495	2019-09-23 13:50:07	密钥机房外门禁	1002331	1
2500	2019-09-23 15:21:42	密钥机房外门禁	0	1
2502	2019-09-23 15:21:59	密钥机房外门禁	0	1
2506	2019-09-23 15:26:15	密钥机房外门禁	1002331	1
2512	2019-09-23 15:26:18	密钥机房外门禁	1000800	1
2514	2019-09-23 15:31:19	密钥机房外门禁	1000800	1
2520	2019-09-23 15:31:23	密钥机房外门禁	1002331	1
2522	2019-09-23 17:48:29	密钥机房外门禁	1000800	1
2527	2019-09-23 17:48:34	密钥机房外门禁	1002331	1
2530	2019-09-26 17:00:31	密钥机房外门禁	0	1
2536	2019-10-12 14:49:55	密钥机房外门禁	1003	1
2538	2019-10-12 14:51:23	密钥机房外门禁	0	1
2543	2019-10-12 14:51:30	密钥机房外门禁	0	1
2546	2019-10-12 14:51:36	密钥机房外门禁	0	1
2552	2019-10-12 14:51:48	密钥机房外门禁	1003	1
2556	2019-10-12 14:52:00	密钥机房外门禁	1000763	1
2559	2019-10-12 14:52:05	密钥机房外门禁	1003	1
2564	2019-10-12 14:52:35	密钥机房外门禁	0	1
2568	2019-10-12 14:52:52	密钥机房外门禁	1000763	1
2571	2019-10-12 14:53:59	密钥机房外门禁	1000763	1
2574	2019-10-12 14:54:04	密钥机房外门禁	1003	1
2580	2019-10-12 14:54:17	密钥机房外门禁	0	1
2582	2019-10-12 14:54:21	密钥机房外门禁	0	1
2588	2019-10-12 14:54:55	密钥机房外门禁	1000763	1
2591	2019-10-12 14:54:58	密钥机房外门禁	1003	1
2596	2019-10-18 09:12:26	密钥机房外门禁	0	1
2599	2019-10-18 09:12:28	密钥机房外门禁	0	1
2603	2019-10-18 09:12:39	密钥机房外门禁	0	1
2608	2019-10-18 09:12:48	密钥机房外门禁	1003	1
2612	2019-10-18 09:12:54	密钥机房外门禁	0	1
2616	2019-10-18 09:13:02	密钥机房外门禁	0	1
2620	2019-10-18 09:13:04	密钥机房外门禁	0	1
2622	2019-10-18 09:13:08	密钥机房外门禁	0	1
2626	2019-10-18 09:13:21	密钥机房外门禁	0	1
2630	2019-10-18 09:13:24	密钥机房外门禁	0	1
2636	2019-10-18 09:13:36	密钥机房外门禁	0	1
2640	2019-10-18 09:13:43	密钥机房外门禁	0	1
2642	2019-10-18 09:13:48	密钥机房外门禁	1002	1
2647	2019-10-18 09:13:52	密钥机房外门禁	0	1
2650	2019-10-18 09:13:58	密钥机房外门禁	2	1
2655	2019-10-18 09:15:14	密钥机房外门禁	0	1
2658	2019-10-18 09:15:17	密钥机房外门禁	0	1
2664	2019-10-18 09:17:08	密钥机房外门禁	1002331	1
2668	2019-10-18 09:17:18	密钥机房外门禁	0	1
2671	2019-10-18 09:17:43	密钥机房外门禁	1002331	1
2674	2019-10-18 09:17:49	密钥机房外门禁	1002331	1
2680	2019-10-18 09:18:07	密钥机房外门禁	1003	1
2683	2019-10-18 09:18:19	密钥机房外门禁	1003	1
2686	2019-10-18 09:18:23	密钥机房外门禁	0	1
2691	2019-10-18 09:19:23	密钥机房外门禁	0	1
2695	2019-10-18 09:19:25	密钥机房外门禁	0	1
2698	2019-10-18 09:19:28	密钥机房外门禁	1002331	1
2703	2019-10-18 09:19:34	密钥机房外门禁	0	1
2707	2019-10-18 09:19:37	密钥机房外门禁	1002331	1
2711	2019-10-18 09:19:51	密钥机房外门禁	0	1
2714	2019-10-18 09:19:53	密钥机房外门禁	0	1
2719	2019-10-18 09:19:56	密钥机房外门禁	0	1
2724	2019-10-18 09:19:59	密钥机房外门禁	0	1
2727	2019-10-18 09:20:02	密钥机房外门禁	0	1
2732	2019-10-18 09:20:05	密钥机房外门禁	0	1
2735	2019-10-18 09:20:08	密钥机房外门禁	0	1
2738	2019-10-18 09:20:11	密钥机房外门禁	0	1
2743	2019-10-18 09:20:14	密钥机房外门禁	0	1
2746	2019-10-18 09:23:43	密钥机房外门禁	1002331	1
2750	2019-10-18 09:23:52	密钥机房外门禁	1002331	1
2755	2019-10-18 09:24:02	密钥机房外门禁	1002331	1
2759	2019-10-18 09:24:11	密钥机房外门禁	1002331	1
2762	2019-10-18 09:24:16	密钥机房外门禁	1002331	1
2766	2019-10-18 09:24:54	密钥机房外门禁	1001	1
2772	2019-10-18 09:26:45	密钥机房外门禁	1002331	1
2774	2019-10-18 09:26:48	密钥机房外门禁	1001	1
2780	2019-10-18 09:33:47	密钥机房外门禁	1002331	1
2783	2019-10-18 09:34:18	密钥机房外门禁	1002331	1
2787	2019-10-18 09:34:21	密钥机房外门禁	1001	1
2792	2019-10-18 09:40:48	密钥机房外门禁	1002331	1
2795	2019-10-21 11:35:29	密钥机房外门禁	1002	1
2800	2019-10-21 11:35:31	密钥机房外门禁	1002	1
2803	2019-10-21 11:35:33	密钥机房外门禁	1002	1
2808	2019-10-21 11:35:34	密钥机房外门禁	0	1
2810	2019-10-21 11:35:35	密钥机房外门禁	0	1
2816	2019-10-21 11:35:36	密钥机房外门禁	0	1
2819	2019-10-21 11:35:37	密钥机房外门禁	0	1
2823	2019-10-21 11:35:38	密钥机房外门禁	0	1
2826	2019-10-21 11:35:41	密钥机房外门禁	0	1
2831	2019-10-21 11:35:46	密钥机房外门禁	1002	1
2834	2019-10-21 11:35:48	密钥机房外门禁	1002	1
2840	2019-10-21 11:35:51	密钥机房外门禁	1002	1
2842	2019-10-21 11:35:52	密钥机房外门禁	1002	1
2848	2019-10-22 08:25:00	密钥机房外门禁	0	1
2850	2019-10-22 08:25:03	密钥机房外门禁	0	1
2854	2019-10-22 08:25:07	密钥机房外门禁	0	1
2860	2019-10-22 08:25:11	密钥机房外门禁	1002331	1
2863	2019-10-22 08:25:18	密钥机房外门禁	1002331	1
2867	2019-10-22 08:25:23	密钥机房外门禁	1002331	1
2871	2019-10-22 08:46:42	密钥机房外门禁	1002331	1
2874	2019-10-22 08:46:45	密钥机房外门禁	1000800	1
2879	2019-10-22 14:06:38	密钥机房外门禁	1002	1
2882	2019-10-22 14:06:40	密钥机房外门禁	1001	1
2888	2019-10-22 14:06:59	密钥机房外门禁	1000800	1
2892	2019-10-22 14:07:05	密钥机房外门禁	0	1
5270	2022-01-08 16:22:16	CA机房外门禁	0	1
2554	2020-05-19 17:21:25	信息机房内门禁	11	1
2558	2020-05-19 17:21:27	信息机房内门禁	0	1
2563	2020-05-19 17:21:30	信息机房内门禁	12	1
2567	2020-05-19 21:51:06	信息机房内门禁	1002	1
2572	2020-05-19 21:51:10	信息机房内门禁	1001	1
2576	2020-05-20 08:25:55	信息机房内门禁	1002	1
2578	2020-05-20 08:25:58	信息机房内门禁	1001	1
2583	2020-05-20 08:29:17	信息机房内门禁	1002	1
2587	2020-05-20 08:29:21	信息机房内门禁	1001	1
2592	2020-05-20 08:29:31	信息机房内门禁	1002	1
2595	2020-05-20 08:29:34	信息机房内门禁	1001	1
2600	2020-05-20 09:05:14	信息机房内门禁	1001	1
2604	2020-05-20 09:05:18	信息机房内门禁	1002	1
2607	2020-05-20 09:05:31	信息机房内门禁	1001	1
2611	2020-05-20 09:05:33	信息机房内门禁	1002	1
2615	2020-05-20 09:18:22	信息机房内门禁	11	1
2619	2020-05-20 09:41:49	信息机房内门禁	1002	1
2624	2020-05-20 09:41:51	信息机房内门禁	1001	1
2628	2020-05-20 09:42:02	信息机房内门禁	1001	1
2631	2020-05-20 09:42:04	信息机房内门禁	1002	1
2634	2020-05-20 09:51:32	信息机房内门禁	1001	1
2639	2020-05-20 09:51:34	信息机房内门禁	1002	1
2643	2020-05-20 09:51:39	信息机房内门禁	1002	1
2648	2020-05-20 09:51:45	信息机房内门禁	1001	1
2651	2020-05-20 09:53:25	信息机房内门禁	1001	1
2654	2020-05-20 09:53:31	信息机房内门禁	1002	1
2659	2020-05-20 09:56:27	信息机房内门禁	1002	1
2662	2020-05-20 09:56:30	信息机房内门禁	1001	1
2667	2020-05-20 09:57:50	信息机房内门禁	1002	1
2672	2020-05-20 09:57:56	信息机房内门禁	1001	1
2675	2020-05-20 09:58:04	信息机房内门禁	1002	1
2678	2020-05-20 09:58:10	信息机房内门禁	1001	1
2682	2020-05-20 15:52:58	信息机房内门禁	1002	1
2687	2020-05-20 15:53:01	信息机房内门禁	1001	1
2692	2020-05-20 18:37:57	信息机房内门禁	1002	1
2696	2020-05-20 18:38:00	信息机房内门禁	1001	1
2699	2020-05-20 18:39:51	信息机房内门禁	1002	1
2702	2020-05-20 18:39:56	信息机房内门禁	1001	1
2706	2020-05-20 18:41:07	信息机房内门禁	1002	1
2712	2020-05-20 18:41:10	信息机房内门禁	1001	1
2715	2020-05-25 14:21:19	信息机房内门禁	1002	1
2718	2020-05-25 14:21:21	信息机房内门禁	1001	1
2723	2020-05-26 09:59:12	信息机房内门禁	2	1
2728	2020-05-26 09:59:14	信息机房内门禁	1002	1
2731	2020-05-26 09:59:20	信息机房内门禁	1002	1
2734	2020-05-26 09:59:23	信息机房内门禁	1001	1
2740	2020-05-26 09:59:34	信息机房内门禁	1001	1
2742	2020-05-26 09:59:38	信息机房内门禁	1002	1
2747	2020-05-26 10:00:22	信息机房内门禁	1001	1
2752	2020-05-26 10:00:24	信息机房内门禁	1002	1
2754	2020-05-26 10:15:39	信息机房内门禁	1002	1
2758	2020-05-26 10:15:51	信息机房内门禁	1001	1
2763	2020-05-26 16:15:11	信息机房内门禁	0	1
2767	2020-05-26 16:15:13	信息机房内门禁	1002	1
2770	2020-05-26 16:15:17	信息机房内门禁	1001	1
2776	2020-05-27 17:24:05	信息机房内门禁	1002	1
2778	2020-05-27 17:24:08	信息机房内门禁	1001	1
2784	2020-06-03 16:17:29	信息机房内门禁	1002	1
2786	2020-06-03 16:17:33	信息机房内门禁	1001	1
2791	2020-06-04 11:57:04	信息机房内门禁	1001	1
2794	2020-06-04 11:57:12	信息机房内门禁	1002	1
2798	2020-06-04 15:54:04	信息机房内门禁	1002	1
2802	2020-06-04 15:54:09	信息机房内门禁	1001	1
2806	2020-06-17 11:09:59	信息机房内门禁	1002	1
2811	2020-06-17 11:10:02	信息机房内门禁	1001	1
2815	2020-06-23 10:01:47	信息机房内门禁	1001	1
2820	2020-06-23 10:01:50	信息机房内门禁	1008	1
2822	2020-06-24 11:10:20	信息机房内门禁	0	1
2828	2020-06-24 11:10:22	信息机房内门禁	1001	1
2832	2020-06-24 11:10:24	信息机房内门禁	1002	1
2836	2020-06-30 20:56:21	信息机房内门禁	1001	1
2839	2020-06-30 20:56:23	信息机房内门禁	1008	1
2843	2020-07-01 08:12:51	信息机房内门禁	1008	1
2846	2020-07-01 08:12:53	信息机房内门禁	1001	1
2852	2020-07-03 11:57:51	信息机房内门禁	1001	1
2855	2020-07-03 11:57:53	信息机房内门禁	1008	1
2859	2020-07-03 14:09:52	信息机房内门禁	1008	1
2862	2020-07-03 14:09:55	信息机房内门禁	1001	1
2868	2020-07-07 14:19:35	信息机房内门禁	1001	1
2872	2020-07-07 14:19:37	信息机房内门禁	1008	1
2875	2020-07-15 09:26:57	信息机房内门禁	1008	1
2880	2020-07-15 09:26:59	信息机房内门禁	1001	1
2884	2020-07-15 09:34:37	信息机房内门禁	1001	1
2886	2020-07-15 09:34:39	信息机房内门禁	1008	1
2891	2020-07-16 15:43:09	信息机房内门禁	1008	1
2895	2020-07-16 15:43:12	信息机房内门禁	1001	1
2899	2020-08-06 17:13:34	信息机房内门禁	1008	1
2903	2020-08-06 17:13:37	信息机房内门禁	1001	1
2907	2020-08-06 17:23:46	信息机房内门禁	1008	1
2910	2020-08-06 17:23:48	信息机房内门禁	1001	1
2915	2020-08-09 09:55:51	信息机房内门禁	1008	1
2918	2020-08-09 09:55:53	信息机房内门禁	1001	1
2923	2020-08-13 09:10:18	信息机房内门禁	1001	1
2926	2020-08-13 09:10:20	信息机房内门禁	1008	1
2932	2020-08-13 11:34:33	信息机房内门禁	1001	1
2934	2020-08-13 11:34:35	信息机房内门禁	1008	1
2939	2020-08-18 17:22:18	信息机房内门禁	1001	1
2944	2020-08-18 17:22:21	信息机房内门禁	1008	1
2947	2020-08-18 17:34:11	信息机房内门禁	1008	1
2952	2020-08-18 17:34:13	信息机房内门禁	1001	1
2954	2020-08-19 13:54:21	信息机房内门禁	1001	1
2960	2020-08-19 13:54:23	信息机房内门禁	1008	1
2962	2020-08-24 17:30:03	信息机房内门禁	1008	1
2967	2020-08-24 17:30:06	信息机房内门禁	1001	1
2970	2020-08-27 10:46:17	信息机房内门禁	1001	1
2974	2020-08-27 10:46:19	信息机房内门禁	1008	1
2978	2020-08-27 10:55:09	信息机房内门禁	1001	1
2597	2020-05-14 10:40:07	CA机房外门禁	1002	1
2601	2020-05-14 10:40:10	CA机房外门禁	1003	1
2605	2020-05-14 10:40:12	CA机房外门禁	1002	1
2609	2020-05-14 10:40:15	CA机房外门禁	1003	1
2613	2020-05-14 10:40:17	CA机房外门禁	1002	1
2617	2020-05-14 10:40:19	CA机房外门禁	1003	1
2621	2020-05-14 10:40:22	CA机房外门禁	1002	1
2625	2020-05-14 10:40:24	CA机房外门禁	1003	1
2629	2020-05-14 10:40:26	CA机房外门禁	1002	1
2633	2020-05-14 10:40:33	CA机房外门禁	1002	1
2637	2020-05-14 10:40:35	CA机房外门禁	1002	1
2641	2020-05-14 10:40:37	CA机房外门禁	1002	1
2645	2020-05-14 10:40:39	CA机房外门禁	1002	1
2649	2020-05-14 10:40:41	CA机房外门禁	1002	1
2653	2020-05-14 10:41:25	CA机房外门禁	1003	1
2657	2020-05-14 10:41:27	CA机房外门禁	1002	1
2661	2020-05-14 10:41:29	CA机房外门禁	1003	1
2665	2020-05-14 10:41:32	CA机房外门禁	1002	1
2669	2020-05-14 11:34:28	CA机房外门禁	1003	1
2673	2020-05-14 11:34:30	CA机房外门禁	1002	1
2677	2020-05-14 11:34:33	CA机房外门禁	1002	1
2681	2020-05-14 11:34:35	CA机房外门禁	1003	1
2685	2020-05-14 11:34:37	CA机房外门禁	1003	1
2689	2020-05-14 11:34:39	CA机房外门禁	1003	1
2693	2020-05-14 11:34:41	CA机房外门禁	1003	1
2697	2020-05-14 11:34:43	CA机房外门禁	1003	1
2701	2020-05-14 11:34:45	CA机房外门禁	1003	1
2705	2020-05-14 11:34:46	CA机房外门禁	1003	1
2709	2020-05-14 11:34:48	CA机房外门禁	1003	1
2713	2020-05-14 11:34:50	CA机房外门禁	1003	1
2717	2020-05-14 11:34:52	CA机房外门禁	1003	1
2721	2020-05-14 11:34:54	CA机房外门禁	1003	1
2725	2020-05-14 11:34:56	CA机房外门禁	1003	1
2729	2020-05-14 11:35:21	CA机房外门禁	0	1
2733	2020-05-14 11:35:22	CA机房外门禁	0	1
2737	2020-05-14 11:35:24	CA机房外门禁	0	1
2741	2020-05-14 11:35:26	CA机房外门禁	0	1
2745	2020-05-14 11:35:28	CA机房外门禁	0	1
2749	2020-05-14 11:35:30	CA机房外门禁	0	1
2753	2020-05-14 11:35:31	CA机房外门禁	0	1
2757	2020-05-14 11:35:33	CA机房外门禁	0	1
2761	2020-05-14 11:35:35	CA机房外门禁	0	1
2765	2020-05-14 11:35:37	CA机房外门禁	0	1
2769	2020-05-14 11:35:39	CA机房外门禁	0	1
2773	2020-05-14 11:35:40	CA机房外门禁	0	1
2777	2020-05-14 11:35:42	CA机房外门禁	0	1
2781	2020-05-14 11:35:44	CA机房外门禁	0	1
2785	2020-05-14 11:35:45	CA机房外门禁	0	1
2789	2020-05-14 11:36:05	CA机房外门禁	0	1
2793	2020-05-14 11:36:08	CA机房外门禁	0	1
2797	2020-05-14 11:36:10	CA机房外门禁	0	1
2801	2020-05-14 11:36:12	CA机房外门禁	0	1
2805	2020-05-14 11:36:13	CA机房外门禁	0	1
2809	2020-05-14 11:36:15	CA机房外门禁	0	1
2813	2020-05-14 11:36:17	CA机房外门禁	0	1
2817	2020-05-14 11:36:20	CA机房外门禁	0	1
2821	2020-05-14 11:36:22	CA机房外门禁	0	1
2825	2020-05-14 11:36:24	CA机房外门禁	0	1
2829	2020-05-14 11:36:27	CA机房外门禁	0	1
2833	2020-05-14 11:36:57	CA机房外门禁	0	1
2837	2020-05-14 16:25:25	CA机房外门禁	1002	1
2841	2020-05-14 16:25:28	CA机房外门禁	1001	1
2845	2020-05-14 16:26:43	CA机房外门禁	1002	1
2849	2020-05-14 16:26:45	CA机房外门禁	1001	1
2853	2020-05-14 16:29:35	CA机房外门禁	1001	1
2857	2020-05-14 16:33:26	CA机房外门禁	1001	1
2861	2020-05-14 16:33:32	CA机房外门禁	1002	1
2865	2020-05-14 16:35:29	CA机房外门禁	1001	1
2869	2020-05-14 16:35:31	CA机房外门禁	1002	1
2873	2020-05-14 16:38:38	CA机房外门禁	1001	1
2877	2020-05-14 16:38:41	CA机房外门禁	1002	1
2881	2020-05-14 16:44:16	CA机房外门禁	1002	1
2885	2020-05-14 16:44:20	CA机房外门禁	1001	1
2889	2020-05-15 10:51:09	CA机房外门禁	1002	1
2893	2020-05-15 10:51:12	CA机房外门禁	1001	1
2897	2020-05-15 10:52:26	CA机房外门禁	1002	1
2901	2020-05-15 10:52:29	CA机房外门禁	1001	1
2905	2020-05-15 10:59:21	CA机房外门禁	1001	1
2909	2020-05-15 10:59:24	CA机房外门禁	1002	1
2913	2020-05-15 11:18:24	CA机房外门禁	0	1
2917	2020-05-15 11:18:25	CA机房外门禁	1002	1
2921	2020-05-15 11:18:26	CA机房外门禁	0	1
2925	2020-05-15 11:18:29	CA机房外门禁	1002	1
2929	2020-05-15 11:18:32	CA机房外门禁	1002	1
2933	2020-05-15 11:18:34	CA机房外门禁	0	1
2937	2020-05-15 11:18:36	CA机房外门禁	1002	1
2941	2020-05-15 11:18:37	CA机房外门禁	0	1
2945	2020-05-15 11:18:39	CA机房外门禁	0	1
2949	2020-05-15 11:18:41	CA机房外门禁	1002	1
2953	2020-05-15 11:18:42	CA机房外门禁	0	1
2957	2020-05-15 11:18:44	CA机房外门禁	1002	1
2961	2020-05-15 11:18:45	CA机房外门禁	0	1
2965	2020-05-15 11:18:46	CA机房外门禁	1002	1
2969	2020-05-15 11:18:48	CA机房外门禁	0	1
2973	2020-05-15 11:18:52	CA机房外门禁	1002	1
2977	2020-05-15 11:18:53	CA机房外门禁	0	1
2981	2020-05-15 11:18:55	CA机房外门禁	1002	1
2985	2020-05-15 11:18:59	CA机房外门禁	1002	1
2989	2020-05-15 11:19:01	CA机房外门禁	0	1
2993	2020-05-15 11:19:03	CA机房外门禁	1002	1
2997	2020-05-15 11:19:04	CA机房外门禁	0	1
3001	2020-05-15 11:19:08	CA机房外门禁	1002	1
3005	2020-05-15 11:19:09	CA机房外门禁	0	1
3009	2020-05-15 11:19:10	CA机房外门禁	1002	1
3013	2020-05-15 11:19:12	CA机房外门禁	1002	1
3017	2020-05-15 11:19:14	CA机房外门禁	1002	1
3021	2020-05-15 11:19:16	CA机房外门禁	0	1
3025	2020-05-15 11:19:17	CA机房外门禁	1002	1
3029	2020-05-15 11:19:19	CA机房外门禁	1002	1
3033	2020-05-15 11:19:21	CA机房外门禁	0	1
3037	2020-05-15 11:19:22	CA机房外门禁	1002	1
2690	2019-12-09 15:55:26	信息机房外门禁	1008	1
2694	2019-12-10 08:10:33	信息机房外门禁	0	1
2700	2019-12-10 08:10:36	信息机房外门禁	1001	1
2704	2019-12-10 08:10:38	信息机房外门禁	1008	1
2708	2019-12-10 09:01:31	信息机房外门禁	1008	1
2710	2019-12-10 09:01:33	信息机房外门禁	1001	1
2716	2019-12-10 09:49:28	信息机房外门禁	1001	1
2720	2019-12-10 09:49:30	信息机房外门禁	1008	1
2722	2019-12-10 14:16:19	信息机房外门禁	1008	1
2726	2019-12-10 14:16:21	信息机房外门禁	1001	1
2730	2019-12-10 16:09:00	信息机房外门禁	1008	1
2736	2019-12-10 16:09:02	信息机房外门禁	1001	1
2739	2019-12-11 08:31:23	信息机房外门禁	1008	1
2744	2019-12-11 08:31:26	信息机房外门禁	1001	1
2748	2019-12-13 08:10:40	信息机房外门禁	1008	1
2751	2019-12-13 08:10:42	信息机房外门禁	1001	1
2756	2019-12-13 09:23:15	信息机房外门禁	1008	1
2760	2019-12-13 09:23:17	信息机房外门禁	1001	1
2764	2019-12-16 08:10:35	信息机房外门禁	1008	1
2768	2019-12-16 08:10:37	信息机房外门禁	1001	1
2771	2019-12-16 08:19:27	信息机房外门禁	1008	1
2775	2019-12-16 08:19:30	信息机房外门禁	1001	1
2779	2019-12-19 16:14:50	信息机房外门禁	1008	1
2782	2019-12-19 16:14:52	信息机房外门禁	1001	1
2788	2019-12-26 13:49:05	信息机房外门禁	1001	1
2790	2019-12-26 13:49:07	信息机房外门禁	1002	1
2796	2019-12-27 09:32:56	信息机房外门禁	0	1
2799	2019-12-27 09:32:59	信息机房外门禁	1001	1
2804	2019-12-27 09:33:01	信息机房外门禁	1008	1
2807	2019-12-27 10:07:01	信息机房外门禁	0	1
2812	2019-12-27 10:07:04	信息机房外门禁	1001	1
2814	2019-12-27 10:07:07	信息机房外门禁	1008	1
2818	2019-12-27 17:37:57	信息机房外门禁	1008	1
2824	2019-12-27 17:37:59	信息机房外门禁	1001	1
2827	2019-12-27 19:32:03	信息机房外门禁	1003	1
2830	2019-12-27 19:32:04	信息机房外门禁	1009	1
2835	2019-12-27 19:42:15	信息机房外门禁	1003	1
2838	2019-12-27 19:42:16	信息机房外门禁	1009	1
2844	2019-12-27 19:51:02	信息机房外门禁	1003	1
2847	2019-12-27 19:51:04	信息机房外门禁	0	1
2851	2019-12-27 19:51:06	信息机房外门禁	0	1
2856	2019-12-27 19:51:09	信息机房外门禁	1009	1
2858	2019-12-27 21:30:17	信息机房外门禁	1008	1
2864	2019-12-27 21:30:19	信息机房外门禁	1001	1
2866	2019-12-28 09:13:45	信息机房外门禁	1008	1
2870	2019-12-28 09:13:48	信息机房外门禁	1001	1
2876	2019-12-28 09:14:11	信息机房外门禁	1003	1
2878	2019-12-28 09:14:13	信息机房外门禁	0	1
2883	2019-12-28 09:14:15	信息机房外门禁	0	1
2887	2019-12-28 09:14:18	信息机房外门禁	0	1
2890	2019-12-28 09:14:22	信息机房外门禁	0	1
2894	2019-12-28 09:14:25	信息机房外门禁	0	1
2898	2019-12-28 09:14:29	信息机房外门禁	0	1
2904	2019-12-28 09:14:35	信息机房外门禁	1009	1
2908	2019-12-29 15:19:01	信息机房外门禁	1001	1
2911	2019-12-29 15:19:03	信息机房外门禁	1008	1
2914	2019-12-30 09:17:27	信息机房外门禁	1008	1
2920	2019-12-30 09:17:29	信息机房外门禁	1001	1
2924	2020-01-02 15:47:28	信息机房外门禁	1008	1
2928	2020-01-02 15:47:30	信息机房外门禁	1001	1
2930	2020-01-02 15:47:42	信息机房外门禁	1008	1
2936	2020-01-02 15:47:45	信息机房外门禁	1001	1
2938	2020-01-08 16:07:56	信息机房外门禁	1008	1
2942	2020-01-08 16:07:59	信息机房外门禁	1002	1
2948	2020-01-08 16:09:53	信息机房外门禁	1008	1
2950	2020-01-08 16:09:55	信息机房外门禁	1002	1
2956	2020-01-08 16:10:51	信息机房外门禁	1001	1
2959	2020-01-08 16:10:53	信息机房外门禁	1002	1
2964	2020-01-11 15:09:43	信息机房外门禁	1003	1
2968	2020-01-11 15:09:46	信息机房外门禁	1009	1
2971	2020-01-13 08:26:58	信息机房外门禁	1001	1
2976	2020-01-13 08:27:00	信息机房外门禁	1008	1
2979	2020-01-14 08:04:35	信息机房外门禁	1008	1
2984	2020-01-14 08:04:37	信息机房外门禁	1001	1
2988	2020-01-14 17:07:36	信息机房外门禁	1008	1
2992	2020-01-14 17:07:38	信息机房外门禁	1001	1
2994	2020-01-18 10:59:58	信息机房外门禁	1008	1
2998	2020-01-18 11:00:00	信息机房外门禁	1001	1
3002	2020-01-18 11:51:21	信息机房外门禁	1001	1
3006	2020-01-18 11:51:23	信息机房外门禁	1008	1
3012	2020-03-11 16:03:33	信息机房外门禁	1008	1
3016	2020-03-11 16:03:36	信息机房外门禁	1002	1
3019	2020-03-11 16:06:05	信息机房外门禁	1008	1
3024	2020-03-11 16:06:08	信息机房外门禁	1002	1
3026	2020-03-11 16:06:17	信息机房外门禁	1001	1
3031	2020-03-11 16:06:20	信息机房外门禁	1002	1
3036	2020-03-12 08:44:41	信息机房外门禁	1008	1
3039	2020-03-12 08:44:43	信息机房外门禁	1001	1
3042	2020-03-12 10:14:38	信息机房外门禁	1008	1
3048	2020-03-12 10:14:40	信息机房外门禁	1001	1
3051	2020-03-13 16:59:22	信息机房外门禁	1008	1
3054	2020-03-13 16:59:24	信息机房外门禁	1001	1
3058	2020-03-13 22:11:19	信息机房外门禁	1008	1
3062	2020-03-13 22:11:21	信息机房外门禁	1001	1
3067	2020-03-14 11:40:24	信息机房外门禁	1001	1
3071	2020-03-14 11:40:26	信息机房外门禁	1008	1
3074	2020-03-14 14:16:21	信息机房外门禁	1008	1
3080	2020-03-14 14:16:24	信息机房外门禁	1001	1
3083	2020-03-14 23:54:11	信息机房外门禁	1008	1
3088	2020-03-14 23:54:13	信息机房外门禁	1001	1
3090	2020-03-16 10:18:51	信息机房外门禁	1008	1
3095	2020-03-16 10:18:53	信息机房外门禁	1001	1
3100	2020-03-16 12:03:31	信息机房外门禁	1008	1
3104	2020-03-16 12:03:33	信息机房外门禁	1001	1
3108	2020-03-16 21:59:35	信息机房外门禁	1008	1
3112	2020-03-16 21:59:37	信息机房外门禁	1001	1
3115	2020-03-17 08:14:36	信息机房外门禁	1001	1
2896	2019-10-22 14:07:10	密钥机房外门禁	1002331	1
2900	2020-03-12 09:58:34	密钥机房外门禁	0	1
2902	2020-03-12 09:58:48	密钥机房外门禁	1000763	1
2906	2020-03-12 09:58:53	密钥机房外门禁	0	1
2912	2020-03-12 09:59:01	密钥机房外门禁	0	1
2916	2020-03-12 09:59:07	密钥机房外门禁	0	1
2919	2020-03-12 09:59:12	密钥机房外门禁	0	1
2922	2020-03-12 10:05:49	密钥机房外门禁	1000763	1
2927	2020-03-12 10:05:54	密钥机房外门禁	0	1
2931	2020-03-12 10:06:02	密钥机房外门禁	0	1
2935	2020-04-28 09:54:24	密钥机房外门禁	0	1
2940	2020-04-28 09:54:27	密钥机房外门禁	0	1
2943	2020-04-28 09:54:28	密钥机房外门禁	0	1
2946	2020-04-28 09:54:30	密钥机房外门禁	0	1
2951	2020-04-28 09:54:32	密钥机房外门禁	1002	1
2955	2020-04-28 09:54:34	密钥机房外门禁	1002	1
2958	2020-04-28 14:27:00	密钥机房外门禁	1002	1
2963	2020-04-28 14:27:06	密钥机房外门禁	0	1
2966	2020-04-28 14:27:08	密钥机房外门禁	0	1
2972	2020-04-28 14:27:10	密钥机房外门禁	0	1
2975	2020-04-28 14:27:12	密钥机房外门禁	0	1
2980	2020-04-28 14:27:15	密钥机房外门禁	0	1
2982	2020-04-28 14:27:17	密钥机房外门禁	0	1
2986	2020-04-28 14:27:19	密钥机房外门禁	0	1
2991	2020-04-28 14:27:20	密钥机房外门禁	0	1
2996	2020-04-28 14:27:22	密钥机房外门禁	0	1
2999	2020-04-28 14:27:23	密钥机房外门禁	0	1
3004	2020-04-28 14:27:24	密钥机房外门禁	0	1
3007	2020-04-28 14:27:26	密钥机房外门禁	0	1
3010	2020-04-28 14:27:27	密钥机房外门禁	0	1
3014	2020-04-28 14:27:29	密钥机房外门禁	0	1
3018	2020-04-28 14:27:32	密钥机房外门禁	0	1
3022	2020-04-28 14:27:39	密钥机房外门禁	0	1
3027	2020-04-28 14:27:55	密钥机房外门禁	0	1
3032	2020-04-28 14:27:56	密钥机房外门禁	0	1
3034	2020-04-28 14:27:57	密钥机房外门禁	0	1
3040	2020-04-28 14:27:59	密钥机房外门禁	0	1
3043	2020-04-28 14:28:00	密钥机房外门禁	0	1
3047	2020-04-28 14:28:01	密钥机房外门禁	0	1
3050	2020-04-28 14:28:02	密钥机房外门禁	0	1
3055	2020-04-28 14:28:03	密钥机房外门禁	0	1
3059	2020-04-28 14:28:04	密钥机房外门禁	0	1
3063	2020-04-28 14:28:05	密钥机房外门禁	0	1
3068	2020-04-28 14:28:07	密钥机房外门禁	0	1
3070	2020-04-28 14:28:08	密钥机房外门禁	0	1
3075	2020-04-28 14:28:11	密钥机房外门禁	0	1
3078	2020-04-28 14:28:12	密钥机房外门禁	0	1
3084	2020-04-28 14:28:15	密钥机房外门禁	0	1
3087	2020-04-28 14:28:16	密钥机房外门禁	0	1
3091	2020-04-28 14:28:17	密钥机房外门禁	0	1
3094	2020-04-28 14:28:18	密钥机房外门禁	0	1
3098	2020-04-28 14:28:19	密钥机房外门禁	0	1
3102	2020-04-28 14:28:20	密钥机房外门禁	0	1
3106	2020-04-28 14:28:21	密钥机房外门禁	0	1
3110	2020-04-28 14:28:22	密钥机房外门禁	0	1
3114	2020-04-28 14:28:23	密钥机房外门禁	0	1
3118	2020-04-28 14:28:24	密钥机房外门禁	0	1
3123	2020-04-28 14:28:25	密钥机房外门禁	0	1
3128	2020-04-28 14:28:28	密钥机房外门禁	1002	1
3132	2020-04-28 14:28:30	密钥机房外门禁	1002	1
3134	2020-04-28 14:28:31	密钥机房外门禁	1002	1
3140	2020-04-28 14:28:32	密钥机房外门禁	0	1
3142	2020-04-28 14:28:33	密钥机房外门禁	0	1
3146	2020-04-28 14:28:39	密钥机房外门禁	0	1
3150	2020-04-28 14:28:41	密钥机房外门禁	0	1
3154	2020-04-28 14:28:42	密钥机房外门禁	0	1
3160	2020-04-28 14:28:44	密钥机房外门禁	0	1
3162	2020-04-28 14:28:46	密钥机房外门禁	0	1
3166	2020-04-28 14:28:59	密钥机房外门禁	0	1
3172	2020-04-28 14:29:01	密钥机房外门禁	0	1
3176	2020-04-28 14:29:03	密钥机房外门禁	0	1
3180	2020-04-28 14:29:06	密钥机房外门禁	0	1
3184	2020-04-28 14:29:08	密钥机房外门禁	0	1
3188	2020-04-28 14:29:09	密钥机房外门禁	0	1
3191	2020-04-28 14:29:16	密钥机房外门禁	1002	1
3195	2020-04-28 14:29:21	密钥机房外门禁	1002	1
3198	2020-04-28 14:29:22	密钥机房外门禁	1002	1
3203	2020-04-28 14:29:30	密钥机房外门禁	0	1
3208	2020-04-28 14:29:39	密钥机房外门禁	0	1
3211	2020-05-11 15:18:05	密钥机房外门禁	0	1
3214	2020-05-11 15:18:10	密钥机房外门禁	0	1
3219	2020-05-11 15:18:11	密钥机房外门禁	0	1
3223	2020-05-11 15:18:12	密钥机房外门禁	0	1
3227	2020-05-11 15:18:13	密钥机房外门禁	0	1
3232	2020-05-11 15:18:14	密钥机房外门禁	0	1
3236	2020-05-11 15:18:18	密钥机房外门禁	0	1
3239	2020-05-11 15:18:21	密钥机房外门禁	0	1
3242	2020-05-11 15:18:23	密钥机房外门禁	1002	1
3247	2020-05-11 15:18:24	密钥机房外门禁	1002	1
3250	2020-05-11 15:24:42	密钥机房外门禁	1002	1
3253	2020-05-11 15:24:44	密钥机房外门禁	0	1
3256	2020-05-11 15:24:46	密钥机房外门禁	1002	1
3260	2020-05-11 15:24:48	密钥机房外门禁	0	1
3262	2020-05-11 15:24:49	密钥机房外门禁	1002	1
3266	2020-05-11 15:24:51	密钥机房外门禁	0	1
3268	2020-05-11 15:24:52	密钥机房外门禁	0	1
3271	2020-05-11 15:24:53	密钥机房外门禁	0	1
3275	2020-05-11 15:24:55	密钥机房外门禁	0	1
3277	2020-05-11 15:24:56	密钥机房外门禁	0	1
3280	2020-05-11 15:24:57	密钥机房外门禁	0	1
3284	2020-05-11 15:24:58	密钥机房外门禁	0	1
3287	2020-05-11 15:24:59	密钥机房外门禁	0	1
3289	2020-05-11 15:25:01	密钥机房外门禁	0	1
3293	2020-05-11 15:25:06	密钥机房外门禁	0	1
3295	2020-05-11 15:25:08	密钥机房外门禁	0	1
3298	2020-05-11 15:25:09	密钥机房外门禁	0	1
3301	2020-05-11 15:25:11	密钥机房外门禁	0	1
2983	2020-08-27 10:55:11	信息机房内门禁	1008	1
2987	2020-09-01 10:54:57	信息机房内门禁	1008	1
2990	2020-09-01 10:54:59	信息机房内门禁	1001	1
2995	2020-09-04 14:25:16	信息机房内门禁	1001	1
3000	2020-09-04 14:25:18	信息机房内门禁	1008	1
3003	2020-09-04 15:19:28	信息机房内门禁	1008	1
3008	2020-09-04 15:19:30	信息机房内门禁	1001	1
3011	2020-09-08 17:02:48	信息机房内门禁	1001	1
3015	2020-09-08 17:02:50	信息机房内门禁	1008	1
3020	2020-09-13 13:13:16	信息机房内门禁	1008	1
3023	2020-09-13 13:13:18	信息机房内门禁	1001	1
3028	2020-09-17 14:12:06	信息机房内门禁	1008	1
3030	2020-09-17 14:12:08	信息机房内门禁	1001	1
3035	2020-10-16 17:16:29	信息机房内门禁	1001	1
3038	2020-10-16 17:16:31	信息机房内门禁	1002	1
3044	2020-10-21 11:09:36	信息机房内门禁	1001	1
3046	2020-10-21 11:09:39	信息机房内门禁	1008	1
3052	2020-10-21 13:50:32	信息机房内门禁	1008	1
3056	2020-10-21 13:50:34	信息机房内门禁	1001	1
3060	2020-10-26 10:04:48	信息机房内门禁	1008	1
3064	2020-10-26 10:04:51	信息机房内门禁	1001	1
3066	2020-10-28 14:24:30	信息机房内门禁	1008	1
3072	2020-10-28 14:24:33	信息机房内门禁	1001	1
3076	2020-10-28 14:38:19	信息机房内门禁	1001	1
3079	2020-10-28 14:38:21	信息机房内门禁	1008	1
3082	2020-10-28 15:15:57	信息机房内门禁	1008	1
3086	2020-10-28 15:16:00	信息机房内门禁	1001	1
3092	2020-10-28 15:42:46	信息机房内门禁	0	1
3096	2020-10-28 15:42:49	信息机房内门禁	0	1
3099	2020-10-28 15:42:51	信息机房内门禁	0	1
3103	2020-10-28 15:42:58	信息机房内门禁	1001	1
3107	2020-10-28 15:43:01	信息机房内门禁	1008	1
3111	2020-11-17 14:37:00	信息机房内门禁	1002	1
3116	2020-11-17 14:37:03	信息机房内门禁	1001	1
3119	2020-11-17 15:57:19	信息机房内门禁	1002	1
3122	2020-11-17 16:02:26	信息机房内门禁	1002	1
3126	2020-11-17 16:02:31	信息机房内门禁	1001	1
3131	2020-11-26 14:46:20	信息机房内门禁	1001	1
3135	2020-11-26 14:46:23	信息机房内门禁	1008	1
3138	2020-11-26 16:25:20	信息机房内门禁	1001	1
3144	2020-11-26 16:25:23	信息机房内门禁	1008	1
3148	2020-11-27 15:27:21	信息机房内门禁	1008	1
3151	2020-11-27 15:27:23	信息机房内门禁	1001	1
3155	2020-11-30 20:16:26	信息机房内门禁	1008	1
3159	2020-11-30 20:16:28	信息机房内门禁	1001	1
3163	2020-12-01 08:47:28	信息机房内门禁	1008	1
3167	2020-12-01 08:47:30	信息机房内门禁	1001	1
3171	2020-12-01 23:38:49	信息机房内门禁	1008	1
3175	2020-12-01 23:38:51	信息机房内门禁	1001	1
3179	2020-12-03 10:42:29	信息机房内门禁	1001	1
3182	2020-12-03 10:42:31	信息机房内门禁	1008	1
3187	2020-12-04 09:58:21	信息机房内门禁	1008	1
3190	2020-12-04 09:58:23	信息机房内门禁	1001	1
3196	2020-12-04 10:20:36	信息机房内门禁	1008	1
3199	2020-12-04 10:20:38	信息机房内门禁	1001	1
3204	2020-12-04 11:44:28	信息机房内门禁	1008	1
3207	2020-12-04 11:44:31	信息机房内门禁	1001	1
3212	2020-12-09 11:51:02	信息机房内门禁	1008	1
3216	2020-12-09 11:51:05	信息机房内门禁	1001	1
3218	2020-12-15 22:19:23	信息机房内门禁	1008	1
3224	2020-12-15 22:19:25	信息机房内门禁	1001	1
3228	2020-12-16 09:46:36	信息机房内门禁	1008	1
3230	2020-12-16 09:46:38	信息机房内门禁	1001	1
3235	2020-12-16 14:24:55	信息机房内门禁	1001	1
3238	2020-12-16 14:24:58	信息机房内门禁	1008	1
3243	2020-12-16 17:16:55	信息机房内门禁	1008	1
3246	2020-12-16 17:16:57	信息机房内门禁	1001	1
3251	2020-12-16 19:44:33	信息机房内门禁	1008	1
3254	2020-12-16 19:44:36	信息机房内门禁	1001	1
3257	2020-12-17 09:21:55	信息机房内门禁	1008	1
3259	2020-12-17 09:22:08	信息机房内门禁	1001	1
3263	2020-12-19 08:37:11	信息机房内门禁	1003	1
3265	2020-12-19 08:37:13	信息机房内门禁	1009	1
3269	2020-12-25 09:48:14	信息机房内门禁	1008	1
3272	2020-12-25 09:48:17	信息机房内门禁	1001	1
3274	2020-12-25 10:56:50	信息机房内门禁	1008	1
3278	2020-12-25 10:56:52	信息机房内门禁	1001	1
3281	2020-12-28 15:41:17	信息机房内门禁	1001	1
3283	2020-12-28 15:41:19	信息机房内门禁	1008	1
3286	2020-12-29 15:47:45	信息机房内门禁	1008	1
3290	2020-12-29 15:47:47	信息机房内门禁	1001	1
3292	2020-12-29 21:19:54	信息机房内门禁	1008	1
3296	2020-12-29 21:19:56	信息机房内门禁	1001	1
3299	2020-12-31 13:42:56	信息机房内门禁	1008	1
3302	2020-12-31 13:42:59	信息机房内门禁	1001	1
3305	2021-01-04 14:10:13	信息机房内门禁	1001	1
3307	2021-01-04 14:10:16	信息机房内门禁	1008	1
3311	2021-01-04 14:21:20	信息机房内门禁	1008	1
3313	2021-01-04 14:21:23	信息机房内门禁	1001	1
3317	2021-01-05 16:18:47	信息机房内门禁	1008	1
3319	2021-01-05 16:18:50	信息机房内门禁	1001	1
3323	2021-01-08 08:47:51	信息机房内门禁	1008	1
3326	2021-01-08 08:47:54	信息机房内门禁	1001	1
3328	2021-01-08 08:54:57	信息机房内门禁	1008	1
3332	2021-01-08 08:55:00	信息机房内门禁	1001	1
3333	2021-01-08 09:33:24	信息机房内门禁	1002	1
3334	2021-01-08 09:33:28	信息机房内门禁	1001	1
3335	2021-01-15 14:51:34	信息机房内门禁	1001	1
3336	2021-01-15 14:51:37	信息机房内门禁	1008	1
3338	2021-01-21 14:37:22	信息机房内门禁	1008	1
3341	2021-01-21 14:37:25	信息机房内门禁	1001	1
3344	2021-01-21 14:40:37	信息机房内门禁	1008	1
3347	2021-01-21 14:40:40	信息机房内门禁	1001	1
3350	2021-01-22 15:24:18	信息机房内门禁	1008	1
3353	2021-01-22 15:24:20	信息机房内门禁	1001	1
3356	2021-01-28 09:27:52	信息机房内门禁	1008	1
3359	2021-01-28 09:27:55	信息机房内门禁	1001	1
3041	2020-05-15 11:19:25	CA机房外门禁	0	1
3045	2020-05-15 11:19:27	CA机房外门禁	0	1
3049	2020-05-15 11:19:28	CA机房外门禁	0	1
3053	2020-05-15 11:19:30	CA机房外门禁	0	1
3057	2020-05-15 11:19:31	CA机房外门禁	0	1
3061	2020-05-15 11:19:33	CA机房外门禁	0	1
3065	2020-05-15 17:19:49	CA机房外门禁	1002	1
3069	2020-05-15 17:19:52	CA机房外门禁	1001	1
3073	2020-05-15 17:22:25	CA机房外门禁	1002	1
3077	2020-05-15 17:23:33	CA机房外门禁	1002	1
3081	2020-05-15 17:23:38	CA机房外门禁	1001	1
3085	2020-05-15 17:24:46	CA机房外门禁	1001	1
3089	2020-05-15 17:24:48	CA机房外门禁	1002	1
3093	2020-05-15 17:26:37	CA机房外门禁	1001	1
3097	2020-05-15 17:26:39	CA机房外门禁	1002	1
3101	2020-05-15 21:00:34	CA机房外门禁	2	1
3105	2020-05-15 21:01:32	CA机房外门禁	1004	1
3109	2020-05-15 21:01:34	CA机房外门禁	1004	1
3113	2020-05-15 21:01:36	CA机房外门禁	1004	1
3117	2020-05-15 21:01:39	CA机房外门禁	1004	1
3121	2020-05-15 21:01:41	CA机房外门禁	1004	1
3125	2020-05-15 21:01:44	CA机房外门禁	1004	1
3129	2020-05-16 10:50:21	CA机房外门禁	1000404	1
3133	2020-05-16 10:50:27	CA机房外门禁	1000241	1
3137	2020-05-16 11:25:19	CA机房外门禁	1000404	1
3141	2020-05-16 11:25:24	CA机房外门禁	1000241	1
3145	2020-05-16 16:28:49	CA机房外门禁	1000404	1
3149	2020-05-16 16:28:53	CA机房外门禁	1000241	1
3153	2020-05-16 16:54:40	CA机房外门禁	1000404	1
3157	2020-05-16 16:54:56	CA机房外门禁	1000241	1
3161	2020-05-16 17:37:48	CA机房外门禁	0	1
3165	2020-05-16 17:37:53	CA机房外门禁	1000241	1
3169	2020-05-16 17:37:57	CA机房外门禁	1000404	1
3173	2020-05-16 17:51:53	CA机房外门禁	0	1
3177	2020-05-16 17:52:07	CA机房外门禁	10002411	1
3181	2020-05-16 17:52:17	CA机房外门禁	10002411	1
3185	2020-05-16 17:52:29	CA机房外门禁	10002411	1
3189	2020-05-16 17:52:37	CA机房外门禁	10002411	1
3193	2020-05-16 17:52:42	CA机房外门禁	10002411	1
3197	2020-05-16 17:52:47	CA机房外门禁	10002411	1
3201	2020-05-16 17:53:05	CA机房外门禁	1000241	1
3205	2020-05-16 17:53:11	CA机房外门禁	1000404	1
3209	2020-05-16 17:54:32	CA机房外门禁	1000241	1
3213	2020-05-16 17:54:37	CA机房外门禁	1000404	1
3217	2020-05-16 17:57:34	CA机房外门禁	1000241	1
3221	2020-05-16 17:57:38	CA机房外门禁	1000404	1
3225	2020-05-16 18:08:29	CA机房外门禁	0	1
3229	2020-05-16 18:08:32	CA机房外门禁	0	1
3233	2020-05-16 18:08:39	CA机房外门禁	0	1
3237	2020-05-16 18:08:42	CA机房外门禁	0	1
3241	2020-05-16 18:10:14	CA机房外门禁	0	1
3245	2020-05-16 18:10:20	CA机房外门禁	0	1
3249	2020-05-16 18:23:44	CA机房外门禁	1000241	1
3252	2020-05-16 18:23:49	CA机房外门禁	1000404	1
3255	2020-05-16 18:37:54	CA机房外门禁	1000241	1
3258	2020-05-16 18:37:58	CA机房外门禁	1000404	1
3261	2020-05-16 18:42:06	CA机房外门禁	1000241	1
3264	2020-05-16 18:42:10	CA机房外门禁	1000404	1
3267	2020-05-16 18:51:00	CA机房外门禁	1000241	1
3270	2020-05-16 18:51:03	CA机房外门禁	1000404	1
3273	2020-05-18 13:48:58	CA机房外门禁	1000241	1
3276	2020-05-18 13:49:03	CA机房外门禁	1000404	1
3279	2020-05-18 14:39:35	CA机房外门禁	1000241	1
3282	2020-05-18 14:39:40	CA机房外门禁	1000404	1
3285	2020-05-18 14:56:40	CA机房外门禁	1000241	1
3288	2020-05-18 15:10:46	CA机房外门禁	1000241	1
3291	2020-05-18 15:10:50	CA机房外门禁	1000404	1
3294	2020-05-18 15:14:06	CA机房外门禁	0	1
3297	2020-05-18 15:14:09	CA机房外门禁	1000241	1
3300	2020-05-18 15:14:13	CA机房外门禁	1000404	1
3303	2020-05-18 15:17:25	CA机房外门禁	1000241	1
3306	2020-05-18 15:17:29	CA机房外门禁	1000404	1
3309	2020-05-18 15:20:44	CA机房外门禁	1000241	1
3312	2020-05-18 15:20:49	CA机房外门禁	10004041	1
3315	2020-05-18 15:20:53	CA机房外门禁	1000404	1
3318	2020-05-18 15:22:05	CA机房外门禁	1000241	1
3321	2020-05-18 15:22:11	CA机房外门禁	1000404	1
3324	2020-05-18 15:24:47	CA机房外门禁	1000241	1
3327	2020-05-18 15:24:51	CA机房外门禁	1000404	1
3330	2020-05-18 15:44:15	CA机房外门禁	1000241	1
3337	2020-05-18 15:44:19	CA机房外门禁	1000404	1
3339	2020-05-18 15:46:02	CA机房外门禁	1000241	1
3343	2020-05-18 15:46:07	CA机房外门禁	0	1
3345	2020-05-18 15:46:11	CA机房外门禁	0	1
3348	2020-05-18 15:46:15	CA机房外门禁	1000404	1
3351	2020-05-18 15:48:35	CA机房外门禁	1000241	1
3354	2020-05-18 15:48:40	CA机房外门禁	1000404	1
3357	2020-05-18 15:50:37	CA机房外门禁	1000241	1
3361	2020-05-18 15:50:42	CA机房外门禁	1000404	1
3364	2020-05-18 15:52:40	CA机房外门禁	1000241	1
3369	2020-05-18 15:52:44	CA机房外门禁	1000404	1
3373	2020-05-18 18:43:48	CA机房外门禁	10004041	1
3376	2020-05-18 18:43:51	CA机房外门禁	10004041	1
3381	2020-05-18 18:43:54	CA机房外门禁	10004041	1
3386	2020-05-18 18:43:56	CA机房外门禁	10004041	1
3388	2020-05-18 18:43:59	CA机房外门禁	10004041	1
3392	2020-05-18 18:44:02	CA机房外门禁	0	1
3396	2020-05-18 18:44:05	CA机房外门禁	10004041	1
3400	2020-05-18 18:58:05	CA机房外门禁	1001	1
3405	2020-05-18 18:58:07	CA机房外门禁	1001	1
3409	2020-05-18 18:58:09	CA机房外门禁	1001	1
3412	2020-05-18 18:58:12	CA机房外门禁	1001	1
3416	2020-05-18 18:58:14	CA机房外门禁	1001	1
3421	2020-05-18 18:58:16	CA机房外门禁	1001	1
3425	2020-05-18 18:58:18	CA机房外门禁	1001	1
3430	2020-05-18 18:58:20	CA机房外门禁	1001	1
3432	2020-05-18 18:58:22	CA机房外门禁	1001	1
3437	2020-05-18 18:58:26	CA机房外门禁	10002411	1
3441	2020-05-18 18:58:28	CA机房外门禁	10002411	1
3120	2020-03-17 08:14:38	信息机房外门禁	1008	1
3124	2020-03-17 09:16:17	信息机房外门禁	1008	1
3127	2020-03-17 09:16:21	信息机房外门禁	1001	1
3130	2020-03-17 09:44:21	信息机房外门禁	1008	1
3136	2020-03-17 09:44:25	信息机房外门禁	1001	1
3139	2020-03-17 10:05:24	信息机房外门禁	1008	1
3143	2020-03-17 10:05:26	信息机房外门禁	1001	1
3147	2020-03-17 19:17:11	信息机房外门禁	1001	1
3152	2020-03-17 19:17:13	信息机房外门禁	0	1
3156	2020-03-17 19:17:22	信息机房外门禁	0	1
3158	2020-03-17 19:17:29	信息机房外门禁	1008	1
3164	2020-03-19 08:20:28	信息机房外门禁	1008	1
3168	2020-03-19 08:20:32	信息机房外门禁	1001	1
3170	2020-03-26 15:22:35	信息机房外门禁	1008	1
3174	2020-03-26 15:22:37	信息机房外门禁	1001	1
3178	2020-03-27 15:03:41	信息机房外门禁	1008	1
3183	2020-03-27 15:03:43	信息机房外门禁	1001	1
3186	2020-03-29 09:18:57	信息机房外门禁	1008	1
3192	2020-03-29 09:19:01	信息机房外门禁	1001	1
3194	2020-03-29 09:40:17	信息机房外门禁	1008	1
3200	2020-03-29 09:40:20	信息机房外门禁	1001	1
3202	2020-03-29 10:00:21	信息机房外门禁	1008	1
3206	2020-03-29 10:00:24	信息机房外门禁	1001	1
3210	2020-03-29 10:30:58	信息机房外门禁	1001	1
3215	2020-03-29 10:31:01	信息机房外门禁	1008	1
3220	2020-03-31 09:54:01	信息机房外门禁	1008	1
3222	2020-03-31 09:54:03	信息机房外门禁	1001	1
3226	2020-03-31 13:39:14	信息机房外门禁	1008	1
3231	2020-03-31 13:39:17	信息机房外门禁	1001	1
3234	2020-03-31 15:18:38	信息机房外门禁	1008	1
3240	2020-03-31 15:18:40	信息机房外门禁	1001	1
3244	2020-03-31 19:08:45	信息机房外门禁	0	1
3248	2020-03-31 19:08:47	信息机房外门禁	1001	1
3362	2020-03-31 19:08:50	信息机房外门禁	1008	1
3366	2020-04-01 11:01:29	信息机房外门禁	1008	1
3370	2020-04-01 11:01:33	信息机房外门禁	1001	1
3374	2020-04-01 11:24:15	信息机房外门禁	0	1
3377	2020-04-01 11:24:16	信息机房外门禁	1003	1
3382	2020-04-01 11:24:17	信息机房外门禁	1003	1
3385	2020-04-01 11:24:20	信息机房外门禁	1009	1
3390	2020-04-02 13:32:14	信息机房外门禁	1008	1
3393	2020-04-02 13:32:16	信息机房外门禁	1001	1
3398	2020-04-02 13:52:51	信息机房外门禁	1008	1
3402	2020-04-02 13:52:54	信息机房外门禁	1001	1
3404	2020-04-02 13:55:10	信息机房外门禁	1003	1
3410	2020-04-02 13:55:11	信息机房外门禁	1009	1
3414	2020-04-02 13:55:29	信息机房外门禁	1003	1
3418	2020-04-02 13:55:30	信息机房外门禁	0	1
3420	2020-04-08 13:52:52	信息机房外门禁	1001	1
3424	2020-04-08 13:52:55	信息机房外门禁	1008	1
3429	2020-04-20 14:45:38	信息机房外门禁	1003	1
3434	2020-04-20 14:45:40	信息机房外门禁	1009	1
3436	2020-04-21 11:41:40	信息机房外门禁	1003	1
3442	2020-04-21 11:41:42	信息机房外门禁	1009	1
3446	2020-04-21 11:43:46	信息机房外门禁	1003	1
3448	2020-04-21 11:43:48	信息机房外门禁	0	1
3453	2020-04-21 11:43:50	信息机房外门禁	1009	1
3457	2020-04-21 14:11:17	信息机房外门禁	1003	1
3462	2020-04-21 14:11:19	信息机房外门禁	1009	1
3465	2020-04-21 17:28:30	信息机房外门禁	1003	1
3470	2020-04-21 17:28:32	信息机房外门禁	1009	1
3473	2020-04-22 12:03:12	信息机房外门禁	1008	1
3476	2020-04-22 12:03:14	信息机房外门禁	1001	1
3481	2020-04-28 14:22:50	信息机房外门禁	1002	1
3485	2020-04-28 14:22:54	信息机房外门禁	1001	1
3488	2020-05-06 10:37:20	信息机房外门禁	1008	1
3494	2020-05-06 10:37:22	信息机房外门禁	1001	1
3496	2020-05-11 15:19:06	信息机房外门禁	1002	1
3502	2020-05-11 15:19:08	信息机房外门禁	1002	1
3505	2020-05-11 15:19:10	信息机房外门禁	1002	1
3509	2020-05-11 15:40:09	信息机房外门禁	1002	1
3513	2020-05-11 15:40:14	信息机房外门禁	1001	1
3518	2020-05-12 11:18:51	信息机房外门禁	0	1
3521	2020-05-12 11:18:53	信息机房外门禁	1002	1
3524	2020-05-12 11:18:54	信息机房外门禁	0	1
3530	2020-05-12 11:18:57	信息机房外门禁	0	1
3532	2020-05-12 11:18:59	信息机房外门禁	0	1
3538	2020-05-12 11:19:02	信息机房外门禁	0	1
3540	2020-05-12 11:19:04	信息机房外门禁	0	1
3546	2020-05-12 11:19:06	信息机房外门禁	1002	1
3548	2020-05-12 11:19:07	信息机房外门禁	0	1
3554	2020-05-12 11:19:10	信息机房外门禁	0	1
3558	2020-05-12 11:19:12	信息机房外门禁	0	1
3561	2020-05-12 11:19:14	信息机房外门禁	0	1
3566	2020-05-12 11:19:15	信息机房外门禁	0	1
3568	2020-05-12 11:19:17	信息机房外门禁	0	1
3573	2020-05-12 11:19:19	信息机房外门禁	0	1
3577	2020-05-12 11:19:20	信息机房外门禁	0	1
3581	2020-05-12 11:19:22	信息机房外门禁	0	1
3586	2020-05-12 11:19:25	信息机房外门禁	0	1
3589	2020-05-12 11:19:27	信息机房外门禁	0	1
3594	2020-05-12 11:19:28	信息机房外门禁	0	1
3597	2020-05-12 11:19:30	信息机房外门禁	0	1
3601	2020-05-12 11:19:32	信息机房外门禁	0	1
3606	2020-05-12 11:19:33	信息机房外门禁	0	1
3610	2020-05-12 11:19:35	信息机房外门禁	0	1
3612	2020-05-12 11:19:36	信息机房外门禁	0	1
3617	2020-05-12 11:19:38	信息机房外门禁	0	1
3621	2020-05-12 11:19:39	信息机房外门禁	0	1
3626	2020-05-12 11:19:41	信息机房外门禁	0	1
3630	2020-05-12 11:19:43	信息机房外门禁	0	1
3632	2020-05-12 11:19:44	信息机房外门禁	0	1
3638	2020-05-12 11:19:46	信息机房外门禁	0	1
3641	2020-05-12 11:19:48	信息机房外门禁	0	1
3646	2020-05-12 11:19:49	信息机房外门禁	0	1
3649	2020-05-12 11:19:50	信息机房外门禁	0	1
3653	2020-05-12 11:19:52	信息机房外门禁	0	1
3304	2020-05-11 15:25:13	密钥机房外门禁	0	1
3308	2020-05-11 15:25:14	密钥机房外门禁	0	1
3310	2020-05-11 15:25:15	密钥机房外门禁	0	1
3314	2020-05-11 15:25:16	密钥机房外门禁	0	1
3316	2020-05-11 15:25:19	密钥机房外门禁	0	1
3320	2020-05-11 15:25:20	密钥机房外门禁	0	1
3322	2020-05-11 15:25:21	密钥机房外门禁	0	1
3325	2020-05-11 15:25:24	密钥机房外门禁	0	1
3329	2020-05-11 15:25:25	密钥机房外门禁	0	1
3331	2020-05-11 15:25:27	密钥机房外门禁	0	1
3340	2020-05-11 15:25:28	密钥机房外门禁	0	1
3342	2020-05-11 15:25:29	密钥机房外门禁	0	1
3346	2020-05-11 15:25:30	密钥机房外门禁	0	1
3349	2020-05-11 15:25:31	密钥机房外门禁	0	1
3352	2020-05-11 15:25:33	密钥机房外门禁	0	1
3355	2020-05-11 15:25:34	密钥机房外门禁	0	1
3358	2020-05-11 15:25:35	密钥机房外门禁	0	1
3360	2020-05-11 15:25:36	密钥机房外门禁	0	1
3365	2020-05-11 15:25:37	密钥机房外门禁	0	1
3368	2020-05-11 15:25:38	密钥机房外门禁	0	1
3372	2020-05-11 15:25:39	密钥机房外门禁	0	1
3378	2020-05-11 15:25:46	密钥机房外门禁	0	1
3380	2020-05-11 15:25:48	密钥机房外门禁	0	1
3384	2020-05-11 15:25:53	密钥机房外门禁	0	1
3389	2020-05-11 15:25:55	密钥机房外门禁	0	1
3394	2020-05-11 15:25:56	密钥机房外门禁	0	1
3397	2020-05-11 15:25:57	密钥机房外门禁	0	1
3401	2020-05-11 15:25:59	密钥机房外门禁	0	1
3406	2020-05-11 15:26:01	密钥机房外门禁	1002	1
3408	2020-05-11 15:26:03	密钥机房外门禁	0	1
3413	2020-05-11 15:26:04	密钥机房外门禁	0	1
3417	2020-05-11 15:26:05	密钥机房外门禁	0	1
3422	2020-05-11 15:26:06	密钥机房外门禁	0	1
3426	2020-05-11 15:26:07	密钥机房外门禁	0	1
3428	2020-05-12 11:20:28	密钥机房外门禁	0	1
3433	2020-05-12 11:20:40	密钥机房外门禁	1002	1
3438	2020-05-12 11:20:41	密钥机房外门禁	0	1
3440	2020-05-12 11:20:49	密钥机房外门禁	0	1
3445	2020-05-12 11:20:50	密钥机房外门禁	1002	1
3450	2020-05-12 11:20:52	密钥机房外门禁	0	1
3452	2020-05-12 11:20:53	密钥机房外门禁	1002	1
3458	2020-05-12 11:20:54	密钥机房外门禁	0	1
3460	2020-05-12 11:20:57	密钥机房外门禁	0	1
3466	2020-05-12 11:20:59	密钥机房外门禁	1002	1
3469	2020-05-12 11:21:01	密钥机房外门禁	0	1
3474	2020-05-12 11:21:02	密钥机房外门禁	1002	1
3478	2020-05-12 11:21:03	密钥机房外门禁	0	1
3482	2020-05-12 11:21:04	密钥机房外门禁	0	1
3486	2020-05-12 11:21:06	密钥机房外门禁	0	1
3490	2020-05-12 11:21:07	密钥机房外门禁	1002	1
3493	2020-05-12 11:21:08	密钥机房外门禁	0	1
3497	2020-05-12 11:21:09	密钥机房外门禁	0	1
3500	2020-05-12 11:21:10	密钥机房外门禁	1002	1
3504	2020-05-12 11:21:12	密钥机房外门禁	0	1
3508	2020-05-12 11:21:13	密钥机房外门禁	0	1
3514	2020-05-12 11:21:14	密钥机房外门禁	0	1
3516	2020-05-12 11:21:15	密钥机房外门禁	0	1
3522	2020-05-12 11:21:17	密钥机房外门禁	0	1
3526	2020-05-12 11:21:18	密钥机房外门禁	0	1
3529	2020-05-12 11:21:20	密钥机房外门禁	0	1
3533	2020-05-12 11:21:22	密钥机房外门禁	1002	1
3536	2020-05-12 11:21:24	密钥机房外门禁	1002	1
3541	2020-05-12 11:21:25	密钥机房外门禁	0	1
3544	2020-05-12 11:21:27	密钥机房外门禁	0	1
3550	2020-05-12 11:21:28	密钥机房外门禁	1002	1
3552	2020-05-12 11:21:29	密钥机房外门禁	0	1
3557	2020-05-12 11:21:30	密钥机房外门禁	1002	1
3560	2020-05-12 11:21:32	密钥机房外门禁	0	1
3565	2020-05-12 11:21:33	密钥机房外门禁	0	1
3569	2020-05-12 11:21:34	密钥机房外门禁	1002	1
3574	2020-05-12 11:22:23	密钥机房外门禁	1002	1
3576	2020-05-12 11:22:25	密钥机房外门禁	0	1
3580	2020-05-12 11:22:26	密钥机房外门禁	0	1
3585	2020-05-12 11:22:28	密钥机房外门禁	0	1
3590	2020-05-12 11:22:29	密钥机房外门禁	0	1
3593	2020-05-12 11:22:31	密钥机房外门禁	0	1
3598	2020-05-12 11:22:32	密钥机房外门禁	0	1
3602	2020-05-12 11:22:33	密钥机房外门禁	0	1
3605	2020-05-12 11:22:34	密钥机房外门禁	0	1
3609	2020-05-12 11:22:35	密钥机房外门禁	0	1
3613	2020-05-12 11:22:38	密钥机房外门禁	0	1
3616	2020-05-12 11:22:42	密钥机房外门禁	1002	1
3622	2020-05-12 11:22:43	密钥机房外门禁	0	1
3625	2020-05-12 11:22:47	密钥机房外门禁	0	1
3629	2020-05-12 11:22:50	密钥机房外门禁	0	1
3634	2020-05-12 11:22:51	密钥机房外门禁	0	1
3637	2020-05-12 11:22:52	密钥机房外门禁	0	1
3640	2020-05-12 11:22:53	密钥机房外门禁	0	1
3645	2020-05-12 11:22:54	密钥机房外门禁	0	1
3650	2020-05-12 11:22:56	密钥机房外门禁	0	1
3654	2020-05-12 11:22:57	密钥机房外门禁	0	1
3658	2020-05-12 11:22:58	密钥机房外门禁	0	1
3661	2020-05-12 11:22:59	密钥机房外门禁	0	1
3666	2020-05-12 11:23:01	密钥机房外门禁	0	1
3669	2020-05-12 11:23:03	密钥机房外门禁	0	1
3674	2020-05-12 11:23:07	密钥机房外门禁	0	1
3677	2020-05-12 11:23:08	密钥机房外门禁	0	1
3682	2020-05-12 11:23:10	密钥机房外门禁	0	1
3685	2020-05-12 11:23:12	密钥机房外门禁	0	1
3690	2020-05-12 11:23:13	密钥机房外门禁	0	1
3692	2020-05-12 11:23:15	密钥机房外门禁	0	1
3698	2020-05-12 11:23:18	密钥机房外门禁	0	1
3700	2020-05-12 11:23:23	密钥机房外门禁	0	1
3705	2020-05-12 11:23:24	密钥机房外门禁	0	1
3708	2020-05-12 11:23:25	密钥机房外门禁	0	1
3714	2020-05-12 11:23:27	密钥机房外门禁	0	1
3716	2020-05-12 11:23:28	密钥机房外门禁	0	1
3363	2021-01-28 09:34:49	信息机房内门禁	1008	1
3367	2021-01-28 09:34:52	信息机房内门禁	1001	1
3371	2021-01-28 17:03:36	信息机房内门禁	1002	1
3375	2021-01-28 17:03:37	信息机房内门禁	0	1
3379	2021-01-28 17:03:40	信息机房内门禁	1001	1
3383	2021-02-08 08:04:48	信息机房内门禁	1008	1
3387	2021-02-08 08:04:50	信息机房内门禁	1001	1
3391	2021-02-10 14:49:21	信息机房内门禁	1008	1
3395	2021-02-10 14:49:24	信息机房内门禁	1001	1
3399	2021-02-20 09:36:56	信息机房内门禁	1002	1
3403	2021-02-20 09:37:03	信息机房内门禁	1001	1
3407	2021-02-22 15:04:39	信息机房内门禁	1008	1
3411	2021-02-22 15:04:41	信息机房内门禁	1001	1
3415	2021-02-24 09:11:49	信息机房内门禁	1003	1
3419	2021-02-24 09:11:51	信息机房内门禁	0	1
3423	2021-02-24 09:11:53	信息机房内门禁	1009	1
3427	2021-02-24 09:24:44	信息机房内门禁	1001	1
3431	2021-02-24 09:24:47	信息机房内门禁	1008	1
3435	2021-02-26 09:16:27	信息机房内门禁	1003	1
3439	2021-02-26 09:16:28	信息机房内门禁	1009	1
3443	2021-03-04 19:08:53	信息机房内门禁	1001	1
3447	2021-03-04 19:08:56	信息机房内门禁	1008	1
3451	2021-03-05 09:29:33	信息机房内门禁	1008	1
3455	2021-03-05 09:29:36	信息机房内门禁	1001	1
3459	2021-03-08 11:57:36	信息机房内门禁	1008	1
3463	2021-03-08 11:57:38	信息机房内门禁	1001	1
3467	2021-03-11 09:26:52	信息机房内门禁	1008	1
3471	2021-03-11 09:26:55	信息机房内门禁	1001	1
3475	2021-03-11 14:06:32	信息机房内门禁	1008	1
3479	2021-03-11 14:06:34	信息机房内门禁	1001	1
3483	2021-03-11 14:08:28	信息机房内门禁	1008	1
3487	2021-03-11 14:08:31	信息机房内门禁	1001	1
3491	2021-03-17 17:24:13	信息机房内门禁	1008	1
3495	2021-03-17 17:24:16	信息机房内门禁	1001	1
3499	2021-03-22 15:04:43	信息机房内门禁	1008	1
3503	2021-03-22 15:04:52	信息机房内门禁	1001	1
3507	2021-03-22 15:21:21	信息机房内门禁	1008	1
3511	2021-03-22 15:21:24	信息机房内门禁	1001	1
3515	2021-03-23 08:27:55	信息机房内门禁	1008	1
3519	2021-03-23 08:28:04	信息机房内门禁	1001	1
3523	2021-03-26 03:08:32	信息机房内门禁	1008	1
3527	2021-03-26 03:08:34	信息机房内门禁	1001	1
3531	2021-03-26 08:25:19	信息机房内门禁	1008	1
3535	2021-03-26 08:25:21	信息机房内门禁	1001	1
3539	2021-03-26 09:17:53	信息机房内门禁	1008	1
3543	2021-03-26 09:17:56	信息机房内门禁	1001	1
3547	2021-03-26 09:58:46	信息机房内门禁	1008	1
3551	2021-03-26 09:58:48	信息机房内门禁	1001	1
3555	2021-03-26 12:45:22	信息机房内门禁	1008	1
3559	2021-03-26 12:45:24	信息机房内门禁	1001	1
3563	2021-03-29 08:19:11	信息机房内门禁	1008	1
3567	2021-03-29 08:19:13	信息机房内门禁	1001	1
3571	2021-03-29 17:36:11	信息机房内门禁	1008	1
3575	2021-03-29 17:36:14	信息机房内门禁	1001	1
3579	2021-03-30 09:09:43	信息机房内门禁	1008	1
3583	2021-03-30 09:09:45	信息机房内门禁	1001	1
3587	2021-04-06 13:47:33	信息机房内门禁	1008	1
3591	2021-04-06 13:47:36	信息机房内门禁	1001	1
3595	2021-04-07 16:48:19	信息机房内门禁	1001	1
3599	2021-04-07 16:48:21	信息机房内门禁	1008	1
3603	2021-04-21 10:25:55	信息机房内门禁	1008	1
3607	2021-04-21 10:26:00	信息机房内门禁	1001	1
3611	2021-05-20 10:04:47	信息机房内门禁	1008	1
3615	2021-05-20 10:04:49	信息机房内门禁	1001	1
3619	2021-05-21 10:54:24	信息机房内门禁	1008	1
3623	2021-05-21 10:54:26	信息机房内门禁	1001	1
3627	2021-05-23 15:25:27	信息机房内门禁	1008	1
3631	2021-05-23 15:25:29	信息机房内门禁	1001	1
3635	2021-05-23 16:41:50	信息机房内门禁	1008	1
3639	2021-05-23 16:41:52	信息机房内门禁	1001	1
3643	2021-05-23 17:07:54	信息机房内门禁	1008	1
3647	2021-05-23 17:07:56	信息机房内门禁	1001	1
3651	2021-05-24 08:47:19	信息机房内门禁	1008	1
3655	2021-05-24 08:47:21	信息机房内门禁	1001	1
3659	2021-05-28 14:21:22	信息机房内门禁	1008	1
3663	2021-05-28 14:21:24	信息机房内门禁	1001	1
3667	2021-05-30 10:44:41	信息机房内门禁	1008	1
3671	2021-05-30 10:44:43	信息机房内门禁	1001	1
3675	2021-05-30 17:04:10	信息机房内门禁	1008	1
3679	2021-05-30 17:04:12	信息机房内门禁	1001	1
3683	2021-06-11 16:38:42	信息机房内门禁	1003	1
3687	2021-06-11 16:38:44	信息机房内门禁	1009	1
3691	2021-06-16 14:23:09	信息机房内门禁	1008	1
3695	2021-06-16 14:23:12	信息机房内门禁	1001	1
3699	2021-06-17 10:30:14	信息机房内门禁	1008	1
3703	2021-06-17 10:30:19	信息机房内门禁	1001	1
3707	2021-06-23 11:57:08	信息机房内门禁	1008	1
3711	2021-06-23 11:57:14	信息机房内门禁	1001	1
3715	2021-06-28 11:59:49	信息机房内门禁	1008	1
3719	2021-06-28 11:59:52	信息机房内门禁	1001	1
3723	2021-06-28 15:14:14	信息机房内门禁	1008	1
3727	2021-06-28 15:14:16	信息机房内门禁	1001	1
3731	2021-06-28 15:45:56	信息机房内门禁	1008	1
3735	2021-06-28 15:45:59	信息机房内门禁	1001	1
3739	2021-06-29 08:04:46	信息机房内门禁	1008	1
3743	2021-06-29 08:04:51	信息机房内门禁	1001	1
3747	2021-07-02 10:33:17	信息机房内门禁	1008	1
3751	2021-07-02 10:33:21	信息机房内门禁	1001	1
3755	2021-07-09 20:59:43	信息机房内门禁	1008	1
3759	2021-07-09 20:59:46	信息机房内门禁	1001	1
3763	2021-07-19 16:27:34	信息机房内门禁	1008	1
3767	2021-07-19 16:27:36	信息机房内门禁	1001	1
3771	2021-07-22 11:03:35	信息机房内门禁	1003	1
3775	2021-07-22 11:03:37	信息机房内门禁	1009	1
3779	2021-09-06 21:01:51	信息机房内门禁	1008	1
3783	2021-09-06 21:01:53	信息机房内门禁	1001	1
3787	2021-09-16 20:41:18	信息机房内门禁	1008	1
3444	2020-05-18 18:58:30	CA机房外门禁	10002411	1
3449	2020-05-18 18:58:31	CA机房外门禁	10002411	1
3454	2020-05-18 18:58:33	CA机房外门禁	10002411	1
3456	2020-05-18 18:58:36	CA机房外门禁	10002411	1
3461	2020-05-18 18:58:38	CA机房外门禁	10002411	1
3464	2020-05-18 18:58:40	CA机房外门禁	10002411	1
3468	2020-05-18 18:58:43	CA机房外门禁	10002411	1
3472	2020-05-18 18:58:47	CA机房外门禁	10002411	1
3477	2020-05-18 18:58:50	CA机房外门禁	1000241	1
3480	2020-05-18 18:58:53	CA机房外门禁	10002411	1
3484	2020-05-18 18:58:56	CA机房外门禁	10002411	1
3489	2020-05-18 18:58:58	CA机房外门禁	10002411	1
3492	2020-05-18 18:59:00	CA机房外门禁	10002411	1
3498	2020-05-18 18:59:01	CA机房外门禁	10002411	1
3501	2020-05-18 18:59:03	CA机房外门禁	10002411	1
3506	2020-05-18 18:59:39	CA机房外门禁	0	1
3510	2020-05-18 18:59:41	CA机房外门禁	0	1
3512	2020-05-18 18:59:55	CA机房外门禁	10002411	1
3517	2020-05-18 18:59:57	CA机房外门禁	10002411	1
3520	2020-05-18 18:59:59	CA机房外门禁	10002411	1
3525	2020-05-18 19:00:00	CA机房外门禁	10002411	1
3528	2020-05-18 19:00:02	CA机房外门禁	10002411	1
3534	2020-05-18 19:00:04	CA机房外门禁	10002411	1
3537	2020-05-18 19:00:06	CA机房外门禁	10002411	1
3542	2020-05-18 19:00:08	CA机房外门禁	10002411	1
3545	2020-05-18 19:00:10	CA机房外门禁	10002411	1
3549	2020-05-18 19:00:12	CA机房外门禁	10002411	1
3553	2020-05-18 19:00:14	CA机房外门禁	10002411	1
3556	2020-05-18 19:00:39	CA机房外门禁	1000241	1
3562	2020-05-18 19:00:44	CA机房外门禁	1000404	1
3564	2020-05-18 19:10:55	CA机房外门禁	10002411	1
3570	2020-05-18 19:10:57	CA机房外门禁	10002411	1
3572	2020-05-18 19:10:58	CA机房外门禁	10002411	1
3578	2020-05-18 19:11:00	CA机房外门禁	10002411	1
3582	2020-05-18 19:11:01	CA机房外门禁	10002411	1
3584	2020-05-18 19:11:03	CA机房外门禁	10002411	1
3588	2020-05-18 19:11:05	CA机房外门禁	10002411	1
3592	2020-05-18 19:30:08	CA机房外门禁	10002411	1
3596	2020-05-18 19:30:10	CA机房外门禁	10002411	1
3600	2020-05-18 19:30:11	CA机房外门禁	10002411	1
3604	2020-05-18 19:30:13	CA机房外门禁	10002411	1
3608	2020-05-18 19:30:15	CA机房外门禁	10002411	1
3614	2020-05-18 19:30:17	CA机房外门禁	10002411	1
3618	2020-05-18 19:30:19	CA机房外门禁	10002411	1
3620	2020-05-18 19:30:21	CA机房外门禁	10002411	1
3624	2020-05-18 19:47:30	CA机房外门禁	10004041	1
3628	2020-05-18 19:47:32	CA机房外门禁	10004041	1
3633	2020-05-18 19:47:36	CA机房外门禁	10004041	1
3636	2020-05-18 19:47:38	CA机房外门禁	10004041	1
3642	2020-05-18 19:47:41	CA机房外门禁	10004041	1
3644	2020-05-18 19:59:27	CA机房外门禁	1000404	1
3648	2020-05-18 19:59:30	CA机房外门禁	1000241	1
3652	2020-05-18 20:00:29	CA机房外门禁	1000241	1
3656	2020-05-18 20:00:34	CA机房外门禁	1000404	1
3662	2020-05-18 20:01:45	CA机房外门禁	1000404	1
3665	2020-05-18 20:01:49	CA机房外门禁	1000241	1
3668	2020-05-18 20:02:59	CA机房外门禁	1000241	1
3673	2020-05-18 20:03:01	CA机房外门禁	1000404	1
3676	2020-05-18 20:04:03	CA机房外门禁	1000241	1
3680	2020-05-18 20:04:09	CA机房外门禁	1000404	1
3686	2020-05-18 20:29:43	CA机房外门禁	1001	1
3689	2020-05-18 20:29:45	CA机房外门禁	1001	1
3693	2020-05-18 20:29:47	CA机房外门禁	1001	1
3696	2020-05-18 20:29:49	CA机房外门禁	1001	1
3702	2020-05-18 20:29:52	CA机房外门禁	1001	1
3704	2020-05-18 20:29:54	CA机房外门禁	1001	1
3710	2020-05-18 20:29:57	CA机房外门禁	1001	1
3713	2020-05-18 20:39:23	CA机房外门禁	1002	1
3717	2020-05-18 20:39:25	CA机房外门禁	1002	1
3720	2020-05-18 20:39:27	CA机房外门禁	1002	1
3725	2020-05-18 20:39:28	CA机房外门禁	1002	1
3730	2020-05-18 20:39:30	CA机房外门禁	1002	1
3732	2020-05-18 20:39:31	CA机房外门禁	1002	1
3737	2020-05-18 20:39:33	CA机房外门禁	1002	1
3742	2020-05-19 09:24:46	CA机房外门禁	1000404	1
3746	2020-05-19 09:24:49	CA机房外门禁	1000241	1
3748	2020-05-19 09:25:36	CA机房外门禁	0	1
3753	2020-05-19 09:25:42	CA机房外门禁	1000241	1
3757	2020-05-19 09:25:45	CA机房外门禁	1000404	1
3761	2020-05-19 09:27:09	CA机房外门禁	1000404	1
3766	2020-05-19 09:27:16	CA机房外门禁	0	1
3768	2020-05-19 09:27:18	CA机房外门禁	1000241	1
3774	2020-05-19 09:27:36	CA机房外门禁	1000241	1
3777	2020-05-19 09:33:25	CA机房外门禁	1000241	1
3782	2020-05-19 09:33:30	CA机房外门禁	1000404	1
3785	2020-05-19 09:33:56	CA机房外门禁	0	1
3789	2020-05-19 09:33:59	CA机房外门禁	1000241	1
3793	2020-05-19 09:34:02	CA机房外门禁	1000404	1
3796	2020-05-19 09:44:32	CA机房外门禁	0	1
3801	2020-05-19 09:44:33	CA机房外门禁	0	1
3806	2020-05-19 09:44:38	CA机房外门禁	1000241	1
3809	2020-05-19 09:44:41	CA机房外门禁	1000404	1
3814	2020-05-19 09:46:09	CA机房外门禁	1000404	1
3817	2020-05-19 09:46:12	CA机房外门禁	1000241	1
3822	2020-05-19 09:47:33	CA机房外门禁	1000241	1
3824	2020-05-19 09:47:36	CA机房外门禁	1000404	1
3830	2020-05-19 09:49:11	CA机房外门禁	1000241	1
3834	2020-05-19 09:49:15	CA机房外门禁	1000404	1
3836	2020-05-19 09:51:20	CA机房外门禁	1000241	1
3840	2020-05-19 09:51:23	CA机房外门禁	1000404	1
3844	2020-05-19 09:53:12	CA机房外门禁	1000404	1
3848	2020-05-19 09:53:14	CA机房外门禁	1000241	1
3852	2020-05-19 09:54:35	CA机房外门禁	10002411	1
3857	2020-05-19 09:54:37	CA机房外门禁	10002411	1
3861	2020-05-19 09:54:39	CA机房外门禁	10002411	1
3864	2020-05-19 09:54:41	CA机房外门禁	10002411	1
3869	2020-05-19 09:54:43	CA机房外门禁	10002411	1
3873	2020-05-19 09:54:45	CA机房外门禁	10002411	1
3657	2020-05-12 11:19:54	信息机房外门禁	0	1
3660	2020-05-12 11:19:55	信息机房外门禁	0	1
3664	2020-05-12 11:19:57	信息机房外门禁	0	1
3670	2020-05-12 11:19:59	信息机房外门禁	0	1
3672	2020-05-12 11:20:11	信息机房外门禁	0	1
3678	2020-05-12 11:20:12	信息机房外门禁	0	1
3681	2020-05-12 11:20:13	信息机房外门禁	0	1
3684	2020-05-12 11:20:15	信息机房外门禁	0	1
3688	2020-05-12 11:20:16	信息机房外门禁	0	1
3694	2020-05-12 11:20:18	信息机房外门禁	0	1
3697	2020-05-12 11:20:20	信息机房外门禁	0	1
3701	2020-05-12 11:20:21	信息机房外门禁	0	1
3706	2020-05-12 11:20:22	信息机房外门禁	0	1
3709	2020-05-12 11:20:25	信息机房外门禁	0	1
3712	2020-05-12 11:20:27	信息机房外门禁	0	1
3718	2020-05-12 11:20:28	信息机房外门禁	0	1
3722	2020-05-12 11:20:31	信息机房外门禁	0	1
3726	2020-05-12 11:20:33	信息机房外门禁	0	1
3728	2020-05-12 11:20:34	信息机房外门禁	0	1
3734	2020-05-12 11:20:35	信息机房外门禁	0	1
3738	2020-05-12 11:20:36	信息机房外门禁	0	1
3741	2020-05-12 11:20:37	信息机房外门禁	0	1
3744	2020-05-12 11:20:39	信息机房外门禁	0	1
3750	2020-05-12 11:20:40	信息机房外门禁	0	1
3754	2020-05-12 11:20:42	信息机房外门禁	0	1
3756	2020-05-12 11:20:44	信息机房外门禁	0	1
3762	2020-05-12 11:20:46	信息机房外门禁	0	1
3765	2020-05-12 11:20:47	信息机房外门禁	0	1
3769	2020-05-12 11:20:49	信息机房外门禁	0	1
3772	2020-05-12 11:20:50	信息机房外门禁	0	1
3778	2020-05-12 11:20:51	信息机房外门禁	0	1
3781	2020-05-12 11:20:53	信息机房外门禁	0	1
3786	2020-05-12 11:20:55	信息机房外门禁	0	1
3788	2020-05-12 11:20:56	信息机房外门禁	0	1
3794	2020-05-12 11:20:58	信息机房外门禁	0	1
3797	2020-05-12 11:20:59	信息机房外门禁	0	1
3802	2020-05-12 11:21:01	信息机房外门禁	0	1
3804	2020-05-12 11:21:02	信息机房外门禁	0	1
3808	2020-05-12 11:21:03	信息机房外门禁	0	1
3812	2020-05-12 11:21:05	信息机房外门禁	0	1
3816	2020-05-12 11:21:07	信息机房外门禁	0	1
3821	2020-05-12 11:21:08	信息机房外门禁	0	1
3825	2020-05-12 11:21:09	信息机房外门禁	0	1
3828	2020-05-12 11:21:11	信息机房外门禁	0	1
3833	2020-05-12 11:21:12	信息机房外门禁	0	1
3838	2020-05-12 11:21:13	信息机房外门禁	0	1
3842	2020-05-12 11:21:14	信息机房外门禁	0	1
3845	2020-05-12 11:21:16	信息机房外门禁	0	1
3850	2020-05-12 11:21:17	信息机房外门禁	0	1
3853	2020-05-12 11:21:19	信息机房外门禁	0	1
3858	2020-05-12 11:21:20	信息机房外门禁	0	1
3862	2020-05-12 11:21:21	信息机房外门禁	0	1
3866	2020-05-12 11:21:22	信息机房外门禁	0	1
3868	2020-05-12 11:21:24	信息机房外门禁	0	1
3872	2020-05-12 11:21:25	信息机房外门禁	0	1
3878	2020-05-12 11:21:26	信息机房外门禁	0	1
3882	2020-05-12 11:21:28	信息机房外门禁	0	1
3886	2020-05-12 11:21:29	信息机房外门禁	0	1
3889	2020-05-12 11:21:30	信息机房外门禁	0	1
3894	2020-05-12 11:21:32	信息机房外门禁	0	1
3898	2020-05-12 11:21:33	信息机房外门禁	0	1
3901	2020-05-12 11:21:34	信息机房外门禁	0	1
3904	2020-05-12 11:21:38	信息机房外门禁	0	1
3909	2020-05-12 11:32:33	信息机房外门禁	1001	1
3912	2020-05-12 11:32:35	信息机房外门禁	1002	1
3916	2020-05-12 16:33:30	信息机房外门禁	1001	1
3920	2020-05-12 16:33:31	信息机房外门禁	0	1
3926	2020-05-12 16:33:34	信息机房外门禁	1002	1
3930	2020-05-13 16:28:59	信息机房外门禁	0	1
3934	2020-05-13 16:29:01	信息机房外门禁	0	1
3936	2020-05-13 16:29:02	信息机房外门禁	0	1
3940	2020-05-13 16:29:04	信息机房外门禁	0	1
3946	2020-05-13 16:29:05	信息机房外门禁	0	1
3949	2020-05-13 16:29:07	信息机房外门禁	0	1
3952	2020-05-13 16:29:09	信息机房外门禁	0	1
3957	2020-05-13 16:29:11	信息机房外门禁	1008	1
3961	2020-05-13 16:29:13	信息机房外门禁	0	1
3964	2020-05-13 16:29:15	信息机房外门禁	0	1
3968	2020-05-13 16:29:16	信息机房外门禁	0	1
3973	2020-05-13 16:29:19	信息机房外门禁	0	1
3977	2020-05-13 16:29:20	信息机房外门禁	0	1
3980	2020-05-13 16:29:22	信息机房外门禁	0	1
3983	2020-05-13 16:29:24	信息机房外门禁	0	1
3987	2020-05-13 16:29:26	信息机房外门禁	0	1
3991	2020-05-13 16:29:27	信息机房外门禁	0	1
3994	2020-05-13 16:29:29	信息机房外门禁	0	1
3996	2020-05-13 16:29:30	信息机房外门禁	0	1
4000	2020-05-13 16:29:32	信息机房外门禁	0	1
4005	2020-05-13 16:29:34	信息机房外门禁	0	1
4009	2020-05-13 16:29:35	信息机房外门禁	0	1
4011	2020-05-13 16:29:37	信息机房外门禁	0	1
4017	2020-05-13 16:29:38	信息机房外门禁	0	1
4021	2020-05-13 16:29:40	信息机房外门禁	0	1
4023	2020-05-13 16:29:42	信息机房外门禁	0	1
4027	2020-05-13 16:29:43	信息机房外门禁	0	1
4032	2020-05-13 16:29:45	信息机房外门禁	0	1
4036	2020-05-13 16:29:46	信息机房外门禁	0	1
4041	2020-05-13 16:29:48	信息机房外门禁	0	1
4045	2020-05-13 16:29:50	信息机房外门禁	0	1
4047	2020-05-13 16:29:51	信息机房外门禁	0	1
4053	2020-05-13 16:29:53	信息机房外门禁	0	1
4055	2020-05-13 16:29:55	信息机房外门禁	0	1
4061	2020-05-13 16:29:56	信息机房外门禁	0	1
4064	2020-05-13 16:29:58	信息机房外门禁	0	1
4067	2020-05-13 16:30:00	信息机房外门禁	0	1
4072	2020-05-13 16:30:01	信息机房外门禁	0	1
4077	2020-05-13 16:30:03	信息机房外门禁	0	1
3721	2020-05-12 11:23:30	密钥机房外门禁	0	1
3724	2020-05-12 11:23:31	密钥机房外门禁	0	1
3729	2020-05-12 11:23:32	密钥机房外门禁	0	1
3733	2020-05-12 11:23:35	密钥机房外门禁	0	1
3736	2020-05-12 11:23:38	密钥机房外门禁	0	1
3740	2020-05-12 11:23:39	密钥机房外门禁	0	1
3745	2020-05-12 11:23:40	密钥机房外门禁	0	1
3749	2020-05-12 11:23:42	密钥机房外门禁	0	1
3752	2020-05-12 11:23:43	密钥机房外门禁	0	1
3758	2020-05-12 11:23:45	密钥机房外门禁	0	1
3760	2020-05-12 11:23:47	密钥机房外门禁	0	1
3764	2020-05-12 11:23:48	密钥机房外门禁	0	1
3770	2020-05-12 11:23:50	密钥机房外门禁	0	1
3773	2020-05-12 11:23:53	密钥机房外门禁	0	1
3776	2020-05-12 11:23:57	密钥机房外门禁	1002	1
3780	2020-05-12 11:23:58	密钥机房外门禁	0	1
3784	2020-05-12 11:24:00	密钥机房外门禁	1002	1
3790	2020-05-12 11:24:01	密钥机房外门禁	0	1
3792	2020-05-12 11:24:02	密钥机房外门禁	1002	1
3798	2020-05-12 11:24:09	密钥机房外门禁	0	1
3800	2020-05-12 11:24:10	密钥机房外门禁	1002	1
3805	2020-05-12 11:24:13	密钥机房外门禁	1002	1
3810	2020-05-12 11:24:15	密钥机房外门禁	1002	1
3813	2020-05-12 11:26:26	密钥机房外门禁	1001	1
3818	2020-05-12 11:26:29	密钥机房外门禁	2	1
3820	2020-05-13 16:29:18	密钥机房外门禁	1001	1
3826	2020-05-13 16:29:20	密钥机房外门禁	1001	1
3829	2020-05-13 16:29:22	密钥机房外门禁	2	1
3832	2020-05-13 16:29:24	密钥机房外门禁	0	1
3837	2020-05-13 16:29:26	密钥机房外门禁	1001	1
3841	2020-05-13 16:29:28	密钥机房外门禁	1001	1
3846	2020-05-13 16:29:30	密钥机房外门禁	1001	1
3849	2020-05-13 16:29:31	密钥机房外门禁	1001	1
3854	2020-05-13 16:29:33	密钥机房外门禁	1001	1
3856	2020-05-13 16:29:35	密钥机房外门禁	1001	1
3860	2020-05-13 16:31:27	密钥机房外门禁	0	1
3865	2020-05-13 16:31:29	密钥机房外门禁	0	1
3870	2020-05-13 16:31:31	密钥机房外门禁	0	1
3874	2020-05-13 16:31:32	密钥机房外门禁	0	1
3876	2020-05-13 16:31:34	密钥机房外门禁	0	1
3881	2020-05-13 16:31:36	密钥机房外门禁	0	1
3885	2020-05-13 16:31:37	密钥机房外门禁	0	1
3890	2020-05-13 16:31:39	密钥机房外门禁	0	1
3893	2020-05-13 16:31:40	密钥机房外门禁	0	1
3897	2020-05-13 16:31:42	密钥机房外门禁	0	1
3900	2020-05-13 16:31:44	密钥机房外门禁	0	1
3906	2020-05-13 16:31:46	密钥机房外门禁	0	1
3908	2020-05-13 16:31:47	密钥机房外门禁	0	1
3914	2020-05-13 16:31:49	密钥机房外门禁	0	1
3918	2020-05-13 16:31:51	密钥机房外门禁	0	1
3921	2020-05-13 16:31:52	密钥机房外门禁	0	1
3925	2020-05-13 16:31:54	密钥机房外门禁	0	1
3929	2020-05-13 16:31:55	密钥机房外门禁	0	1
3933	2020-05-13 16:31:57	密钥机房外门禁	0	1
3937	2020-05-13 16:31:59	密钥机房外门禁	0	1
3941	2020-05-13 16:32:00	密钥机房外门禁	0	1
3944	2020-05-13 16:32:02	密钥机房外门禁	0	1
3948	2020-05-13 16:32:04	密钥机房外门禁	0	1
3953	2020-05-13 16:32:06	密钥机房外门禁	0	1
3956	2020-05-13 16:32:07	密钥机房外门禁	0	1
3962	2020-05-13 16:32:09	密钥机房外门禁	0	1
3965	2020-05-13 16:32:11	密钥机房外门禁	0	1
3970	2020-05-13 16:32:12	密钥机房外门禁	0	1
3974	2020-05-13 16:32:14	密钥机房外门禁	0	1
3976	2020-05-13 16:32:15	密钥机房外门禁	0	1
3981	2020-05-13 16:32:17	密钥机房外门禁	0	1
3985	2020-05-13 16:32:19	密钥机房外门禁	0	1
3986	2020-05-13 16:32:20	密钥机房外门禁	0	1
3989	2020-05-13 16:32:22	密钥机房外门禁	0	1
3992	2020-05-13 16:32:23	密钥机房外门禁	0	1
3995	2020-05-13 16:32:25	密钥机房外门禁	0	1
3998	2020-05-13 16:32:27	密钥机房外门禁	0	1
4002	2020-05-13 16:32:28	密钥机房外门禁	0	1
4006	2020-05-13 16:32:29	密钥机房外门禁	0	1
4010	2020-05-13 16:32:31	密钥机房外门禁	0	1
4014	2020-05-13 16:32:32	密钥机房外门禁	0	1
4018	2020-05-13 16:32:34	密钥机房外门禁	0	1
4022	2020-05-13 16:32:35	密钥机房外门禁	0	1
4026	2020-05-13 16:32:37	密钥机房外门禁	0	1
4030	2020-05-13 16:52:27	密钥机房外门禁	1002	1
4034	2020-05-13 16:52:38	密钥机房外门禁	1001	1
4038	2020-05-13 16:52:43	密钥机房外门禁	1002	1
4042	2020-05-13 16:52:44	密钥机房外门禁	1002	1
4046	2020-05-13 16:52:46	密钥机房外门禁	1002	1
4050	2020-05-14 16:16:22	密钥机房外门禁	1001	1
4054	2020-05-14 16:16:26	密钥机房外门禁	1002	1
4058	2020-05-14 16:18:35	密钥机房外门禁	1001	1
4062	2020-05-14 16:18:38	密钥机房外门禁	1002	1
4066	2020-05-14 16:21:11	密钥机房外门禁	1001	1
4070	2020-05-14 16:21:14	密钥机房外门禁	1002	1
4074	2020-05-15 11:06:24	密钥机房外门禁	1002	1
4078	2020-05-15 11:06:54	密钥机房外门禁	1001	1
4082	2020-05-15 11:06:58	密钥机房外门禁	1002	1
4086	2020-05-15 11:08:05	密钥机房外门禁	1002	1
4090	2020-05-15 11:08:47	密钥机房外门禁	1001	1
4094	2020-05-15 11:08:49	密钥机房外门禁	1002	1
4098	2020-05-15 11:10:41	密钥机房外门禁	1002	1
4102	2020-05-15 11:10:44	密钥机房外门禁	1001	1
4106	2020-05-15 11:13:21	密钥机房外门禁	1002	1
4110	2020-05-15 11:13:22	密钥机房外门禁	0	1
4114	2020-05-15 11:13:24	密钥机房外门禁	0	1
4118	2020-05-15 11:13:25	密钥机房外门禁	0	1
4122	2020-05-15 11:13:27	密钥机房外门禁	0	1
4126	2020-05-15 11:13:29	密钥机房外门禁	0	1
4130	2020-05-15 11:13:30	密钥机房外门禁	0	1
4134	2020-05-15 11:13:32	密钥机房外门禁	0	1
4138	2020-05-15 11:13:33	密钥机房外门禁	1002	1
3791	2021-09-16 20:41:20	信息机房内门禁	1001	1
3795	2021-09-23 10:37:32	信息机房内门禁	1008	1
3799	2021-09-23 10:37:34	信息机房内门禁	1001	1
3803	2021-09-24 09:16:47	信息机房内门禁	1008	1
3807	2021-09-24 09:16:49	信息机房内门禁	1001	1
3811	2021-09-26 15:06:36	信息机房内门禁	1002	1
3815	2021-09-26 15:06:44	信息机房内门禁	1001	1
3819	2021-09-26 15:40:55	信息机房内门禁	1002	1
3823	2021-09-26 15:40:57	信息机房内门禁	1001	1
3827	2021-09-26 21:32:40	信息机房内门禁	1002	1
3831	2021-09-26 21:32:43	信息机房内门禁	1001	1
3835	2021-09-26 21:32:49	信息机房内门禁	1001	1
3839	2021-09-26 21:32:51	信息机房内门禁	1002	1
3843	2021-09-26 21:32:59	信息机房内门禁	1002	1
3847	2021-09-26 21:33:01	信息机房内门禁	1001	1
3851	2021-09-26 21:33:38	信息机房内门禁	1001	1
3855	2021-09-26 21:33:41	信息机房内门禁	1002	1
3859	2021-09-26 21:37:11	信息机房内门禁	1001	1
3863	2021-09-26 21:37:14	信息机房内门禁	1002	1
3867	2021-09-26 21:46:58	信息机房内门禁	1008	1
3871	2021-09-26 21:47:02	信息机房内门禁	1002	1
3875	2021-09-26 21:47:12	信息机房内门禁	1002	1
3879	2021-09-26 21:47:15	信息机房内门禁	1001	1
3883	2021-09-27 00:23:55	信息机房内门禁	1002	1
3887	2021-09-27 00:23:58	信息机房内门禁	1001	1
3891	2021-09-27 00:31:55	信息机房内门禁	1002	1
3895	2021-09-27 00:31:57	信息机房内门禁	1001	1
3899	2021-09-27 17:18:56	信息机房内门禁	1002	1
3903	2021-09-27 17:18:58	信息机房内门禁	1001	1
3907	2021-09-28 17:35:42	信息机房内门禁	1008	1
3911	2021-09-28 17:35:45	信息机房内门禁	1001	1
3915	2021-10-15 16:57:43	信息机房内门禁	1008	1
3919	2021-10-15 16:57:46	信息机房内门禁	1001	1
3923	2021-10-29 20:18:56	信息机房内门禁	1008	1
3927	2021-10-29 20:18:58	信息机房内门禁	1001	1
3931	2021-11-01 09:34:33	信息机房内门禁	1008	1
3935	2021-11-01 09:34:36	信息机房内门禁	1001	1
3939	2021-11-01 20:11:04	信息机房内门禁	1008	1
3943	2021-11-01 20:11:07	信息机房内门禁	1001	1
3947	2021-11-15 10:27:52	信息机房内门禁	1008	1
3951	2021-11-15 10:27:55	信息机房内门禁	1001	1
3955	2021-11-15 15:15:00	信息机房内门禁	1008	1
3959	2021-11-15 15:15:02	信息机房内门禁	1001	1
3963	2021-11-17 09:23:37	信息机房内门禁	1008	1
3967	2021-11-17 09:23:42	信息机房内门禁	1001	1
3971	2021-11-17 09:49:48	信息机房内门禁	1008	1
3975	2021-11-17 09:49:53	信息机房内门禁	1001	1
3979	2021-11-17 10:02:08	信息机房内门禁	1001	1
4001	2021-11-17 10:02:11	信息机房内门禁	1008	1
4004	2021-11-17 10:20:38	信息机房内门禁	1008	1
4007	2021-11-17 10:20:42	信息机房内门禁	1001	1
4012	2021-11-22 11:30:53	信息机房内门禁	1008	1
4016	2021-11-22 11:30:55	信息机房内门禁	1001	1
4019	2021-11-23 08:10:01	信息机房内门禁	1008	1
4025	2021-11-23 08:10:04	信息机房内门禁	1001	1
4029	2021-11-25 11:39:44	信息机房内门禁	1008	1
4033	2021-11-25 11:39:50	信息机房内门禁	1001	1
4037	2021-12-02 17:21:45	信息机房内门禁	1008	1
4039	2021-12-02 17:21:47	信息机房内门禁	1001	1
4043	2021-12-03 08:56:46	信息机房内门禁	1008	1
4049	2021-12-03 08:56:48	信息机房内门禁	1001	1
4052	2021-12-03 14:12:00	信息机房内门禁	1008	1
4057	2021-12-03 14:12:03	信息机房内门禁	1001	1
4060	2021-12-07 10:55:54	信息机房内门禁	1008	1
4063	2021-12-07 10:55:58	信息机房内门禁	1001	1
4068	2021-12-07 15:23:36	信息机房内门禁	1008	1
4073	2021-12-07 15:23:38	信息机房内门禁	1001	1
4075	2021-12-07 15:30:36	信息机房内门禁	1008	1
4079	2021-12-07 15:30:38	信息机房内门禁	1001	1
4083	2021-12-10 08:38:30	信息机房内门禁	1002	1
4088	2021-12-10 08:38:34	信息机房内门禁	1001	1
4093	2021-12-14 10:39:08	信息机房内门禁	1001	1
4096	2021-12-14 10:39:12	信息机房内门禁	1002	1
4101	2021-12-15 11:34:52	信息机房内门禁	1002	1
4103	2021-12-15 11:34:56	信息机房内门禁	1001	1
4109	2021-12-16 17:25:53	信息机房内门禁	1001	1
4111	2021-12-16 17:25:55	信息机房内门禁	1002	1
4117	2021-12-21 10:25:08	信息机房内门禁	1002	1
4121	2021-12-21 10:25:11	信息机房内门禁	1001	1
4125	2021-12-27 17:21:07	信息机房内门禁	1002	1
4127	2021-12-27 17:21:12	信息机房内门禁	1001	1
4133	2021-12-29 16:21:30	信息机房内门禁	1005	1
4137	2021-12-29 16:32:10	信息机房内门禁	1001	1
4140	2021-12-29 16:32:15	信息机房内门禁	1002	1
4143	2021-12-29 17:04:36	信息机房内门禁	1005	1
4149	2021-12-29 17:04:40	信息机房内门禁	1002	1
4153	2021-12-29 17:04:58	信息机房内门禁	1002	1
4155	2021-12-29 17:05:18	信息机房内门禁	1001	1
4160	2022-01-06 09:33:18	信息机房内门禁	1002	1
4165	2022-01-06 09:33:43	信息机房内门禁	1002	1
4168	2022-01-06 09:33:46	信息机房内门禁	1001	1
4172	2022-01-06 09:36:29	信息机房内门禁	1001	1
4175	2022-01-06 09:36:32	信息机房内门禁	1002	1
4181	2022-01-06 09:39:07	信息机房内门禁	1002	1
4184	2022-01-06 09:39:10	信息机房内门禁	1001	1
4187	2022-01-06 09:42:57	信息机房内门禁	1002	1
4193	2022-01-06 09:43:08	信息机房内门禁	1001	1
4196	2022-01-06 09:45:27	信息机房内门禁	1002	1
4200	2022-01-06 09:45:29	信息机房内门禁	1001	1
4204	2022-01-08 16:20:54	信息机房内门禁	1002	1
4207	2022-01-08 16:20:56	信息机房内门禁	1001	1
4213	2022-01-08 16:23:49	信息机房内门禁	1002	1
4216	2022-01-08 16:23:52	信息机房内门禁	1001	1
4219	2022-01-08 16:25:01	信息机房内门禁	1001	1
4225	2022-01-08 16:25:05	信息机房内门禁	1002	1
4228	2022-01-08 16:27:18	信息机房内门禁	1002	1
4233	2022-01-08 16:27:21	信息机房内门禁	1001	1
3877	2020-05-19 09:55:12	CA机房外门禁	1000241	1
3880	2020-05-19 09:55:15	CA机房外门禁	1000404	1
3884	2020-05-19 10:00:49	CA机房外门禁	0	1
3888	2020-05-19 10:00:52	CA机房外门禁	0	1
3892	2020-05-19 10:00:55	CA机房外门禁	1000241	1
3896	2020-05-19 10:00:58	CA机房外门禁	1000404	1
3902	2020-05-19 10:09:14	CA机房外门禁	1000404	1
3905	2020-05-19 10:09:16	CA机房外门禁	1000241	1
3910	2020-05-19 10:10:26	CA机房外门禁	1000241	1
3913	2020-05-19 10:10:32	CA机房外门禁	1000404	1
3917	2020-05-19 13:10:01	CA机房外门禁	1000241	1
3922	2020-05-19 13:10:04	CA机房外门禁	1000404	1
3924	2020-05-19 13:30:04	CA机房外门禁	1000241	1
3928	2020-05-19 13:30:07	CA机房外门禁	1000404	1
3932	2020-05-19 13:32:38	CA机房外门禁	1000241	1
3938	2020-05-19 13:32:45	CA机房外门禁	1000404	1
3942	2020-05-19 13:35:36	CA机房外门禁	1000241	1
3945	2020-05-19 13:35:39	CA机房外门禁	1000404	1
3950	2020-05-19 13:38:35	CA机房外门禁	1000241	1
3954	2020-05-19 13:38:38	CA机房外门禁	1000404	1
3958	2020-05-19 13:40:44	CA机房外门禁	1000241	1
3960	2020-05-19 13:40:47	CA机房外门禁	1000404	1
3966	2020-05-19 13:42:48	CA机房外门禁	1000241	1
3969	2020-05-19 13:42:51	CA机房外门禁	1000404	1
3972	2020-05-19 13:54:54	CA机房外门禁	0	1
3978	2020-05-19 14:07:46	CA机房外门禁	1000241	1
3982	2020-05-19 14:07:49	CA机房外门禁	1000404	1
3984	2020-05-19 15:15:29	CA机房外门禁	0	2
3988	2020-05-19 15:49:34	CA机房外门禁	1000241	1
3990	2020-05-19 15:49:38	CA机房外门禁	1000404	1
3993	2020-05-19 16:01:27	CA机房外门禁	1000241	1
3997	2020-05-19 16:01:30	CA机房外门禁	1000404	1
3999	2020-05-19 17:21:08	CA机房外门禁	1000241	1
4003	2020-05-19 17:21:10	CA机房外门禁	1000404	1
4008	2020-05-19 17:40:49	CA机房外门禁	1	1
4013	2020-05-19 17:40:51	CA机房外门禁	12	1
4015	2020-05-19 17:47:25	CA机房外门禁	1	1
4020	2020-05-19 17:47:29	CA机房外门禁	12	1
4024	2020-05-19 17:49:09	CA机房外门禁	1	1
4028	2020-05-19 17:49:12	CA机房外门禁	12	1
4031	2020-05-19 17:53:09	CA机房外门禁	1	1
4035	2020-05-19 17:53:11	CA机房外门禁	12	1
4040	2020-05-19 18:00:28	CA机房外门禁	1	1
4044	2020-05-19 18:00:31	CA机房外门禁	12	1
4048	2020-05-19 18:02:45	CA机房外门禁	1	1
4051	2020-05-19 18:02:48	CA机房外门禁	12	1
4056	2020-05-19 18:15:58	CA机房外门禁	1	1
4059	2020-05-19 18:16:06	CA机房外门禁	0	1
4065	2020-05-19 18:16:10	CA机房外门禁	0	1
4069	2020-05-19 18:16:12	CA机房外门禁	0	1
4071	2020-05-19 18:16:36	CA机房外门禁	0	1
4076	2020-05-19 18:16:44	CA机房外门禁	0	1
4081	2020-05-19 18:16:48	CA机房外门禁	1	1
4084	2020-05-19 18:16:51	CA机房外门禁	0	1
4089	2020-05-19 18:16:55	CA机房外门禁	12	1
4091	2020-05-19 18:27:57	CA机房外门禁	1000241	1
4097	2020-05-19 18:28:05	CA机房外门禁	1000404	1
4100	2020-05-19 18:29:02	CA机房外门禁	1000241	1
4105	2020-05-19 18:29:10	CA机房外门禁	1000404	1
4107	2020-05-19 18:31:26	CA机房外门禁	1000241	1
4112	2020-05-19 18:31:29	CA机房外门禁	1000404	1
4115	2020-05-19 18:35:35	CA机房外门禁	10002411	1
4120	2020-05-19 18:35:37	CA机房外门禁	10002411	1
4123	2020-05-19 18:35:39	CA机房外门禁	10002411	1
4128	2020-05-19 18:35:41	CA机房外门禁	10002411	1
4131	2020-05-19 18:35:43	CA机房外门禁	10002411	1
4136	2020-05-19 18:35:45	CA机房外门禁	10002411	1
4141	2020-05-19 18:43:09	CA机房外门禁	1	1
4144	2020-05-19 18:43:12	CA机房外门禁	12	1
4147	2020-05-19 18:43:51	CA机房外门禁	1	1
4151	2020-05-19 18:43:55	CA机房外门禁	12	1
4157	2020-05-19 18:53:04	CA机房外门禁	1	1
4159	2020-05-19 18:53:07	CA机房外门禁	12	1
4164	2020-05-19 18:54:47	CA机房外门禁	1	1
4167	2020-05-19 18:54:50	CA机房外门禁	12	1
4173	2020-05-19 18:55:05	CA机房外门禁	1	1
4177	2020-05-19 18:55:09	CA机房外门禁	12	1
4180	2020-05-19 18:57:54	CA机房外门禁	1	1
4183	2020-05-19 18:57:57	CA机房外门禁	12	1
4189	2020-05-19 19:05:00	CA机房外门禁	0	1
4191	2020-05-19 19:05:04	CA机房外门禁	0	1
4195	2020-05-19 19:05:07	CA机房外门禁	1	1
4199	2020-05-19 19:05:10	CA机房外门禁	12	1
4203	2020-05-19 19:42:30	CA机房外门禁	1000241	1
4209	2020-05-19 19:42:34	CA机房外门禁	1000404	1
4211	2020-05-19 19:44:35	CA机房外门禁	1000241	1
4217	2020-05-19 19:44:40	CA机房外门禁	1000404	1
4221	2020-05-19 19:46:38	CA机房外门禁	1000241	1
4224	2020-05-19 19:46:43	CA机房外门禁	1000404	1
4227	2020-05-19 19:48:39	CA机房外门禁	1000241	1
4231	2020-05-19 19:48:43	CA机房外门禁	1000404	1
4237	2020-05-19 19:51:03	CA机房外门禁	1000241	1
4239	2020-05-19 19:51:08	CA机房外门禁	0	1
4244	2020-05-19 19:51:11	CA机房外门禁	1000404	1
4249	2020-05-19 19:54:29	CA机房外门禁	1000241	1
4252	2020-05-19 19:54:31	CA机房外门禁	1000404	1
4256	2020-05-19 19:56:47	CA机房外门禁	1000241	1
4260	2020-05-19 19:56:50	CA机房外门禁	1000404	1
4263	2020-05-20 09:06:28	CA机房外门禁	1000241	1
4268	2020-05-20 09:06:31	CA机房外门禁	1000404	1
4271	2020-05-20 09:09:10	CA机房外门禁	1000241	1
4276	2020-05-20 09:09:13	CA机房外门禁	1000404	1
4280	2020-05-20 09:16:37	CA机房外门禁	1000241	1
4284	2020-05-20 09:16:39	CA机房外门禁	1000404	1
4288	2020-05-20 09:19:10	CA机房外门禁	1000241	1
4291	2020-05-20 09:19:13	CA机房外门禁	1000404	1
4295	2020-05-20 09:25:20	CA机房外门禁	1000241	1
4299	2020-05-20 09:25:22	CA机房外门禁	1000404	1
4303	2020-05-20 09:27:46	CA机房外门禁	1000241	1
4309	2020-05-20 09:27:50	CA机房外门禁	1000404	1
4080	2020-05-13 16:30:05	信息机房外门禁	0	1
4085	2020-05-13 16:30:06	信息机房外门禁	0	1
4087	2020-05-13 16:30:08	信息机房外门禁	0	1
4092	2020-05-13 16:30:09	信息机房外门禁	0	1
4095	2020-05-13 16:30:11	信息机房外门禁	0	1
4099	2020-05-13 16:30:14	信息机房外门禁	0	1
4104	2020-05-13 16:30:15	信息机房外门禁	0	1
4108	2020-05-13 16:30:17	信息机房外门禁	1008	1
4113	2020-05-13 16:30:19	信息机房外门禁	1008	1
4116	2020-05-13 16:30:21	信息机房外门禁	1008	1
4119	2020-05-13 16:30:23	信息机房外门禁	1008	1
4124	2020-05-13 16:30:24	信息机房外门禁	1008	1
4129	2020-05-13 16:30:26	信息机房外门禁	1008	1
4132	2020-05-13 16:30:28	信息机房外门禁	1008	1
4135	2020-05-13 16:30:29	信息机房外门禁	1008	1
4139	2020-05-13 16:30:31	信息机房外门禁	1008	1
4145	2020-05-13 16:30:33	信息机房外门禁	1008	1
4148	2020-05-13 16:30:35	信息机房外门禁	1008	1
4152	2020-05-13 16:56:47	信息机房外门禁	0	1
4156	2020-05-13 16:56:51	信息机房外门禁	1002	1
4161	2020-05-13 16:56:55	信息机房外门禁	1001	1
4163	2020-05-14 11:37:00	信息机房外门禁	1001	1
4169	2020-05-14 11:37:02	信息机房外门禁	1008	1
4171	2020-05-15 10:34:46	信息机房外门禁	1002	1
4176	2020-05-15 10:34:49	信息机房外门禁	1001	1
4179	2020-05-15 10:38:26	信息机房外门禁	0	1
4185	2020-05-15 10:38:30	信息机房外门禁	1002	1
4188	2020-05-15 10:38:32	信息机房外门禁	1001	1
4192	2020-05-15 10:42:10	信息机房外门禁	1002	1
4197	2020-05-15 10:42:16	信息机房外门禁	1001	1
4201	2020-05-15 10:43:33	信息机房外门禁	1002	1
4205	2020-05-15 10:43:36	信息机房外门禁	1001	1
4208	2020-05-15 10:44:59	信息机房外门禁	1002	1
4212	2020-05-15 10:45:01	信息机房外门禁	1001	1
4215	2020-05-16 18:25:46	信息机房外门禁	1001	1
4220	2020-05-16 18:25:49	信息机房外门禁	1002	1
4223	2020-05-17 14:52:13	信息机房外门禁	1001	1
4229	2020-05-17 14:52:17	信息机房外门禁	1008	1
4232	2020-05-17 14:52:27	信息机房外门禁	1003	1
4236	2020-05-17 14:52:30	信息机房外门禁	1009	1
4240	2020-05-17 14:53:13	信息机房外门禁	1001	1
4243	2020-05-18 15:30:41	信息机房外门禁	1002	1
4248	2020-05-18 15:30:50	信息机房外门禁	1001	1
4251	2020-05-18 15:55:14	信息机房外门禁	1001	1
4257	2020-05-18 15:55:17	信息机房外门禁	1002	1
4259	2020-05-18 15:58:52	信息机房外门禁	1001	1
4265	2020-05-18 15:58:54	信息机房外门禁	1002	1
4267	2020-05-18 17:33:30	信息机房外门禁	1001	1
4273	2020-05-18 17:33:32	信息机房外门禁	0	1
4277	2020-05-18 17:33:34	信息机房外门禁	1002	1
4279	2020-05-18 17:33:44	信息机房外门禁	1002	1
4283	2020-05-18 17:33:46	信息机房外门禁	1001	1
4289	2020-05-18 18:59:31	信息机房外门禁	0	1
4293	2020-05-18 18:59:33	信息机房外门禁	0	1
4297	2020-05-18 18:59:35	信息机房外门禁	0	1
4300	2020-05-18 18:59:43	信息机房外门禁	0	1
4305	2020-05-18 18:59:44	信息机房外门禁	0	1
4308	2020-05-18 19:34:07	信息机房外门禁	1001	1
4313	2020-05-18 19:34:09	信息机房外门禁	1001	1
4317	2020-05-18 19:34:11	信息机房外门禁	1001	1
4321	2020-05-18 19:34:13	信息机房外门禁	1001	1
4325	2020-05-18 19:34:15	信息机房外门禁	1001	1
4328	2020-05-18 19:34:17	信息机房外门禁	1001	1
4331	2020-05-18 19:34:19	信息机房外门禁	1001	1
4336	2020-05-18 19:34:22	信息机房外门禁	1001	1
4340	2020-05-18 19:34:24	信息机房外门禁	1001	1
4343	2020-05-18 19:34:27	信息机房外门禁	1001	1
4348	2020-05-18 19:34:29	信息机房外门禁	1001	1
4353	2020-05-18 19:34:35	信息机房外门禁	1008	1
4356	2020-05-18 19:34:37	信息机房外门禁	1008	1
4360	2020-05-18 19:34:39	信息机房外门禁	1008	1
4364	2020-05-18 19:34:41	信息机房外门禁	1008	1
4368	2020-05-18 19:34:43	信息机房外门禁	1008	1
4371	2020-05-18 19:34:45	信息机房外门禁	1008	1
4376	2020-05-18 19:34:47	信息机房外门禁	1008	1
4381	2020-05-18 20:21:45	信息机房外门禁	1002	1
4385	2020-05-18 20:21:47	信息机房外门禁	1001	1
4387	2020-05-18 20:32:26	信息机房外门禁	1002	1
4393	2020-05-18 20:37:03	信息机房外门禁	1002	1
4396	2020-05-18 20:37:05	信息机房外门禁	1001	1
4400	2020-05-18 20:42:32	信息机房外门禁	1001	1
4405	2020-05-18 20:42:34	信息机房外门禁	1002	1
4408	2020-05-19 08:17:41	信息机房外门禁	1001	1
4412	2020-05-19 08:17:44	信息机房外门禁	1002	1
4417	2020-05-19 09:08:42	信息机房外门禁	1001	1
4421	2020-05-19 09:08:43	信息机房外门禁	0	1
4425	2020-05-19 09:08:46	信息机房外门禁	1002	1
4427	2020-05-19 09:09:37	信息机房外门禁	1002	1
4433	2020-05-19 09:09:39	信息机房外门禁	1001	1
4437	2020-05-19 09:12:56	信息机房外门禁	1001	1
4439	2020-05-19 09:12:59	信息机房外门禁	1002	1
4445	2020-05-19 13:13:55	信息机房外门禁	1001	1
4449	2020-05-19 13:13:56	信息机房外门禁	1002	1
4453	2020-05-19 13:54:45	信息机房外门禁	0	1
4457	2020-05-19 13:54:46	信息机房外门禁	0	1
4460	2020-05-19 16:03:49	信息机房外门禁	1002	1
4465	2020-05-19 16:03:51	信息机房外门禁	1001	1
4468	2020-05-19 16:10:13	信息机房外门禁	1002	1
4472	2020-05-19 16:10:15	信息机房外门禁	1002	1
4475	2020-05-19 17:07:37	信息机房外门禁	1002	1
4481	2020-05-19 17:07:39	信息机房外门禁	1001	1
4485	2020-05-19 17:07:49	信息机房外门禁	1002	1
4488	2020-05-19 17:07:53	信息机房外门禁	1001	1
4493	2020-05-19 17:12:19	信息机房外门禁	1001	1
4497	2020-05-19 17:12:21	信息机房外门禁	1002	1
4500	2020-05-19 17:16:20	信息机房外门禁	11	1
4505	2020-05-19 17:16:24	信息机房外门禁	12	1
4142	2020-05-15 11:13:35	密钥机房外门禁	0	1
4146	2020-05-15 11:13:37	密钥机房外门禁	1002	1
4150	2020-05-15 11:13:39	密钥机房外门禁	0	1
4154	2020-05-15 11:13:41	密钥机房外门禁	0	1
4158	2020-05-15 11:13:43	密钥机房外门禁	0	1
4162	2020-05-15 11:13:44	密钥机房外门禁	0	1
4166	2020-05-15 11:13:46	密钥机房外门禁	0	1
4170	2020-05-15 11:13:48	密钥机房外门禁	0	1
4174	2020-05-15 11:13:50	密钥机房外门禁	0	1
4178	2020-05-15 11:13:52	密钥机房外门禁	1002	1
4182	2020-05-15 11:13:55	密钥机房外门禁	0	1
4186	2020-05-15 11:13:56	密钥机房外门禁	0	1
4190	2020-05-15 11:13:59	密钥机房外门禁	0	1
4194	2020-05-15 11:14:01	密钥机房外门禁	0	1
4198	2020-05-15 11:14:03	密钥机房外门禁	0	1
4202	2020-05-15 11:14:04	密钥机房外门禁	0	1
4206	2020-05-15 11:14:06	密钥机房外门禁	0	1
4210	2020-05-15 11:14:08	密钥机房外门禁	0	1
4214	2020-05-15 11:14:09	密钥机房外门禁	0	1
4218	2020-05-15 11:14:10	密钥机房外门禁	0	1
4222	2020-05-15 11:14:12	密钥机房外门禁	0	1
4226	2020-05-15 11:14:16	密钥机房外门禁	0	1
4230	2020-05-15 11:14:17	密钥机房外门禁	0	1
4234	2020-05-15 11:14:19	密钥机房外门禁	0	1
4238	2020-05-15 11:14:21	密钥机房外门禁	0	1
4242	2020-05-15 11:14:22	密钥机房外门禁	1002	1
4246	2020-05-15 11:14:23	密钥机房外门禁	0	1
4250	2020-05-15 11:14:25	密钥机房外门禁	0	1
4254	2020-05-15 11:14:27	密钥机房外门禁	0	1
4258	2020-05-15 11:14:29	密钥机房外门禁	0	1
4262	2020-05-15 11:14:30	密钥机房外门禁	0	1
4266	2020-05-15 11:14:32	密钥机房外门禁	0	1
4270	2020-05-15 11:14:33	密钥机房外门禁	0	1
4274	2020-05-15 11:14:35	密钥机房外门禁	0	1
4278	2020-05-15 11:14:36	密钥机房外门禁	0	1
4282	2020-05-15 11:14:39	密钥机房外门禁	0	1
4286	2020-05-15 11:14:40	密钥机房外门禁	0	1
4290	2020-05-15 11:14:42	密钥机房外门禁	0	1
4294	2020-05-15 11:14:43	密钥机房外门禁	0	1
4298	2020-05-15 11:14:45	密钥机房外门禁	0	1
4302	2020-05-15 11:15:08	密钥机房外门禁	1002	1
4306	2020-05-15 11:15:09	密钥机房外门禁	1002	1
4310	2020-05-15 11:15:11	密钥机房外门禁	1002	1
4314	2020-05-15 11:15:12	密钥机房外门禁	1002	1
4318	2020-05-15 11:15:14	密钥机房外门禁	1002	1
4322	2020-05-15 11:15:15	密钥机房外门禁	1002	1
4326	2020-05-15 11:15:17	密钥机房外门禁	1002	1
4330	2020-05-15 11:15:18	密钥机房外门禁	1002	1
4334	2020-05-15 11:15:20	密钥机房外门禁	1002	1
4338	2020-05-15 11:15:22	密钥机房外门禁	1002	1
4342	2020-05-15 11:15:23	密钥机房外门禁	1002	1
4346	2020-05-15 11:15:24	密钥机房外门禁	1002	1
4350	2020-05-15 11:15:26	密钥机房外门禁	1002	1
4354	2020-05-15 11:15:27	密钥机房外门禁	1002	1
4358	2020-05-15 11:15:29	密钥机房外门禁	1002	1
4362	2020-05-15 11:15:30	密钥机房外门禁	1002	1
4366	2020-05-15 11:15:32	密钥机房外门禁	1002	1
4370	2020-05-15 11:15:34	密钥机房外门禁	1002	1
4374	2020-05-15 11:15:35	密钥机房外门禁	1002	1
4378	2020-05-15 11:15:37	密钥机房外门禁	1002	1
4382	2020-05-15 11:15:39	密钥机房外门禁	1002	1
4386	2020-05-15 11:15:40	密钥机房外门禁	1002	1
4390	2020-05-15 11:15:42	密钥机房外门禁	1002	1
4394	2020-05-15 11:15:43	密钥机房外门禁	1002	1
4398	2020-05-15 11:15:45	密钥机房外门禁	1002	1
4402	2020-05-15 11:15:47	密钥机房外门禁	1002	1
4406	2020-05-15 11:15:49	密钥机房外门禁	1002	1
4410	2020-05-15 11:15:50	密钥机房外门禁	1002	1
4414	2020-05-15 11:15:52	密钥机房外门禁	1002	1
4418	2020-05-15 11:15:53	密钥机房外门禁	1002	1
4422	2020-05-15 11:15:55	密钥机房外门禁	1002	1
4426	2020-05-15 11:15:57	密钥机房外门禁	1002	1
4430	2020-05-15 11:15:58	密钥机房外门禁	1002	1
4434	2020-05-15 11:16:00	密钥机房外门禁	1002	1
4438	2020-05-15 11:16:01	密钥机房外门禁	1002	1
4442	2020-05-15 11:16:03	密钥机房外门禁	1002	1
4446	2020-05-15 11:16:04	密钥机房外门禁	1002	1
4450	2020-05-15 11:16:06	密钥机房外门禁	1002	1
4454	2020-05-15 11:16:07	密钥机房外门禁	1002	1
4458	2020-05-15 11:16:09	密钥机房外门禁	1002	1
4462	2020-05-15 11:16:10	密钥机房外门禁	1002	1
4466	2020-05-15 11:16:12	密钥机房外门禁	1002	1
4470	2020-05-15 11:16:13	密钥机房外门禁	1002	1
4474	2020-05-15 11:16:15	密钥机房外门禁	1002	1
4478	2020-05-15 11:16:16	密钥机房外门禁	1002	1
4482	2020-05-15 11:16:18	密钥机房外门禁	1002	1
4486	2020-05-15 11:16:19	密钥机房外门禁	1002	1
4490	2020-05-15 11:16:21	密钥机房外门禁	1002	1
4494	2020-05-15 11:16:22	密钥机房外门禁	1002	1
4498	2020-05-15 11:16:24	密钥机房外门禁	1002	1
4502	2020-05-15 11:16:25	密钥机房外门禁	1002	1
4506	2020-05-15 11:16:27	密钥机房外门禁	1002	1
4510	2020-05-15 11:16:28	密钥机房外门禁	1002	1
4514	2020-05-15 11:16:30	密钥机房外门禁	1002	1
4518	2020-05-15 11:16:31	密钥机房外门禁	1002	1
4522	2020-05-15 11:16:33	密钥机房外门禁	1002	1
4526	2020-05-15 11:16:34	密钥机房外门禁	1002	1
4530	2020-05-15 11:16:36	密钥机房外门禁	1002	1
4534	2020-05-15 11:16:37	密钥机房外门禁	1002	1
4538	2020-05-15 11:16:40	密钥机房外门禁	1002	1
4542	2020-05-15 11:16:41	密钥机房外门禁	1002	1
4546	2020-05-15 11:16:43	密钥机房外门禁	1002	1
4550	2020-05-15 17:27:54	密钥机房外门禁	1002	1
4554	2020-05-15 17:27:56	密钥机房外门禁	1001	1
4558	2020-05-15 17:28:30	密钥机房外门禁	1001	1
4562	2020-05-15 17:28:34	密钥机房外门禁	1002	1
4566	2020-05-15 17:30:25	密钥机房外门禁	1002	1
4235	2022-01-08 16:28:06	信息机房内门禁	1002	1
4241	2022-01-08 16:28:09	信息机房内门禁	1001	1
4245	2022-01-08 16:30:08	信息机房内门禁	1001	1
4247	2022-01-08 16:30:10	信息机房内门禁	1002	1
4253	2022-01-08 16:32:27	信息机房内门禁	1002	1
4255	2022-01-08 16:32:30	信息机房内门禁	1001	1
4261	2022-01-08 16:35:00	信息机房内门禁	1002	1
4264	2022-01-08 16:35:02	信息机房内门禁	1001	1
4269	2022-01-08 16:36:14	信息机房内门禁	1002	1
4272	2022-01-08 16:36:17	信息机房内门禁	1001	1
4275	2022-01-08 16:37:41	信息机房内门禁	1002	1
4281	2022-01-08 16:37:44	信息机房内门禁	1001	1
4285	2022-01-08 16:38:47	信息机房内门禁	1002	1
4287	2022-01-08 16:38:52	信息机房内门禁	1001	1
4292	2022-01-08 16:40:33	信息机房内门禁	1002	1
4296	2022-01-08 16:40:36	信息机房内门禁	1001	1
4301	2022-01-08 16:41:12	信息机房内门禁	1002	1
4304	2022-01-08 16:41:18	信息机房内门禁	1001	1
4307	2022-01-08 16:42:54	信息机房内门禁	1002	1
4312	2022-01-08 16:42:57	信息机房内门禁	1001	1
4316	2022-01-08 16:46:06	信息机房内门禁	1002	1
4320	2022-01-08 16:46:09	信息机房内门禁	1001	1
4324	2022-01-08 16:48:29	信息机房内门禁	1002	1
4327	2022-01-08 16:48:32	信息机房内门禁	1001	1
4333	2022-01-08 16:51:38	信息机房内门禁	1002	1
4337	2022-01-08 16:51:41	信息机房内门禁	1001	1
4341	2022-01-08 16:52:19	信息机房内门禁	1002	1
4344	2022-01-08 16:52:23	信息机房内门禁	1001	1
4347	2022-01-08 16:54:10	信息机房内门禁	1002	1
4352	2022-01-08 16:54:13	信息机房内门禁	1001	1
4357	2022-01-08 16:55:55	信息机房内门禁	1002	1
4359	2022-01-08 16:55:58	信息机房内门禁	1001	1
4365	2022-02-24 14:48:14	信息机房内门禁	1002	1
4369	2022-02-24 14:48:20	信息机房内门禁	1001	1
4372	2022-02-24 15:02:03	信息机房内门禁	1002	1
4377	2022-02-24 15:02:06	信息机房内门禁	1001	1
4380	2022-02-25 10:06:01	信息机房内门禁	1002	1
4384	2022-02-25 10:07:45	信息机房内门禁	1002	1
4389	2022-02-25 10:08:00	信息机房内门禁	0	1
4392	2022-02-25 10:08:07	信息机房内门禁	1001	1
4395	2022-02-25 11:25:44	信息机房内门禁	1002	1
4401	2022-02-25 11:25:48	信息机房内门禁	1001	1
4404	2022-02-25 14:24:19	信息机房内门禁	1002	1
4409	2022-02-25 14:24:30	信息机房内门禁	1001	1
4413	2022-03-01 12:21:37	信息机房内门禁	1002	1
4416	2022-03-01 12:21:39	信息机房内门禁	1002	1
4420	2022-03-01 12:21:41	信息机房内门禁	1001	1
4423	2022-03-01 20:05:26	信息机房内门禁	1002	1
4428	2022-03-01 20:05:30	信息机房内门禁	1001	1
4431	2022-03-01 21:01:19	信息机房内门禁	1002	1
4436	2022-03-01 21:01:22	信息机房内门禁	1001	1
4441	2022-03-01 21:14:35	信息机房内门禁	1001	1
4443	2022-03-01 21:14:37	信息机房内门禁	1002	1
4447	2022-03-01 21:15:37	信息机房内门禁	1001	1
4452	2022-03-01 21:15:40	信息机房内门禁	1002	1
4456	2022-03-01 21:20:45	信息机房内门禁	1002	1
4459	2022-03-01 21:20:48	信息机房内门禁	1001	1
4463	2022-03-03 08:19:19	信息机房内门禁	1002	1
4469	2022-03-03 08:19:23	信息机房内门禁	1001	1
4471	2022-03-05 12:41:26	信息机房内门禁	1002	1
4476	2022-03-05 12:41:32	信息机房内门禁	1001	1
4480	2022-03-05 17:50:32	信息机房内门禁	1002	1
4484	2022-03-05 17:50:42	信息机房内门禁	1001	1
4489	2022-03-07 16:14:47	信息机房内门禁	1002	1
4492	2022-03-07 16:14:50	信息机房内门禁	1001	1
4495	2022-03-09 09:51:34	信息机房内门禁	1002	1
4501	2022-03-09 09:51:37	信息机房内门禁	1001	1
4503	2022-03-09 09:54:24	信息机房内门禁	1001	1
4507	2022-03-09 09:54:27	信息机房内门禁	1002	1
4511	2022-03-09 09:55:42	信息机房内门禁	1002	1
4515	2022-03-09 09:55:45	信息机房内门禁	1001	1
4521	2022-03-09 09:59:47	信息机房内门禁	1001	1
4524	2022-03-09 09:59:50	信息机房内门禁	1002	1
4527	2022-03-09 10:01:31	信息机房内门禁	1001	1
4533	2022-03-09 10:01:34	信息机房内门禁	1002	1
4535	2022-03-09 10:04:24	信息机房内门禁	1001	1
4540	2022-03-09 10:04:27	信息机房内门禁	1002	1
4544	2022-03-09 10:06:21	信息机房内门禁	1002	1
4548	2022-03-09 10:06:23	信息机房内门禁	1001	1
4552	2022-03-09 10:08:32	信息机房内门禁	1001	1
4555	2022-03-09 10:08:36	信息机房内门禁	1002	1
4559	2022-03-09 10:09:38	信息机房内门禁	1002	1
4565	2022-03-09 10:09:41	信息机房内门禁	1001	1
4568	2022-03-09 11:17:59	信息机房内门禁	1002	1
4571	2022-03-09 11:18:01	信息机房内门禁	1001	1
4576	2022-03-09 11:20:19	信息机房内门禁	1002	1
4579	2022-03-09 11:20:27	信息机房内门禁	1001	1
4584	2022-03-09 11:23:48	信息机房内门禁	1001	1
4588	2022-03-09 11:23:51	信息机房内门禁	1002	1
4593	2022-03-09 11:31:15	信息机房内门禁	1002	1
4597	2022-03-09 11:31:19	信息机房内门禁	1001	1
4600	2022-03-09 11:33:09	信息机房内门禁	1002	1
4603	2022-03-09 11:33:12	信息机房内门禁	1001	1
4609	2022-03-09 11:35:25	信息机房内门禁	1001	1
4611	2022-03-09 11:35:28	信息机房内门禁	1002	1
4615	2022-03-24 09:49:07	信息机房内门禁	1002	1
4620	2022-03-24 09:49:14	信息机房内门禁	1001	1
4624	2022-03-24 10:18:00	信息机房内门禁	1002	1
4627	2022-03-24 10:18:02	信息机房内门禁	1001	1
4632	2022-03-24 13:59:50	信息机房内门禁	1002	1
4637	2022-03-24 13:59:52	信息机房内门禁	1001	1
4640	2022-03-26 16:10:19	信息机房内门禁	2	1
4643	2022-03-26 16:39:20	信息机房内门禁	1002	1
4648	2022-03-26 16:39:25	信息机房内门禁	1001	1
4653	2022-03-26 17:08:12	信息机房内门禁	1002	1
4656	2022-03-26 17:08:14	信息机房内门禁	1001	1
4661	2022-03-26 17:08:33	信息机房内门禁	1001	1
4311	2020-05-20 09:32:15	CA机房外门禁	1000241	1
4315	2020-05-20 09:32:18	CA机房外门禁	1000404	1
4319	2020-05-20 09:35:25	CA机房外门禁	1000241	1
4323	2020-05-20 09:35:27	CA机房外门禁	1000404	1
4329	2020-05-20 09:52:19	CA机房外门禁	1000241	1
4332	2020-05-20 09:52:22	CA机房外门禁	1000404	1
4335	2020-05-20 10:16:05	CA机房外门禁	1000241	1
4339	2020-05-20 10:16:08	CA机房外门禁	1000404	1
4345	2020-05-20 11:29:27	CA机房外门禁	0	1
4349	2020-05-20 11:29:31	CA机房外门禁	0	1
4351	2020-05-20 11:29:33	CA机房外门禁	0	1
4355	2020-05-20 11:29:35	CA机房外门禁	1	1
4361	2020-05-20 11:29:41	CA机房外门禁	0	1
4363	2020-05-20 11:29:44	CA机房外门禁	12	1
4367	2020-05-20 17:13:14	CA机房外门禁	1	1
4373	2020-05-20 17:13:16	CA机房外门禁	0	1
4375	2020-05-20 17:13:19	CA机房外门禁	12	1
4379	2020-05-20 17:13:21	CA机房外门禁	12	1
4383	2020-05-20 17:14:44	CA机房外门禁	0	1
4388	2020-05-20 17:14:47	CA机房外门禁	0	1
4391	2020-05-20 17:14:49	CA机房外门禁	1	1
4397	2020-05-20 17:14:53	CA机房外门禁	12	1
4399	2020-05-20 17:15:53	CA机房外门禁	1	1
4403	2020-05-20 17:15:56	CA机房外门禁	12	1
4407	2020-05-20 17:18:05	CA机房外门禁	1	1
4411	2020-05-20 17:18:08	CA机房外门禁	12	1
4415	2020-05-20 17:21:02	CA机房外门禁	1	1
4419	2020-05-20 17:21:05	CA机房外门禁	12	1
4424	2020-05-20 17:25:48	CA机房外门禁	1	1
4429	2020-05-20 17:25:51	CA机房外门禁	12	1
4432	2020-05-20 17:27:03	CA机房外门禁	1	1
4435	2020-05-20 17:27:06	CA机房外门禁	12	1
4440	2020-05-20 17:34:09	CA机房外门禁	1000241	1
4444	2020-05-20 17:34:14	CA机房外门禁	1000404	1
4448	2020-05-20 17:37:14	CA机房外门禁	1000241	1
4451	2020-05-20 17:37:19	CA机房外门禁	1000404	1
4455	2020-05-20 19:11:34	CA机房外门禁	1000241	1
4461	2020-05-20 19:11:38	CA机房外门禁	1000404	1
4464	2020-05-20 19:13:24	CA机房外门禁	1000241	1
4467	2020-05-20 19:13:27	CA机房外门禁	1000404	1
4473	2020-05-20 19:14:46	CA机房外门禁	1000241	1
4477	2020-05-20 19:14:48	CA机房外门禁	1000404	1
4479	2020-05-20 19:16:22	CA机房外门禁	1000241	1
4483	2020-05-20 19:16:24	CA机房外门禁	1000404	1
4487	2020-05-20 19:18:40	CA机房外门禁	1000241	1
4491	2020-05-20 19:18:43	CA机房外门禁	1000404	1
4496	2020-05-20 19:20:18	CA机房外门禁	1000241	1
4499	2020-05-20 19:20:21	CA机房外门禁	1000404	1
4504	2020-05-20 19:25:42	CA机房外门禁	1000241	1
4509	2020-05-20 19:25:46	CA机房外门禁	1000404	1
4513	2020-05-20 20:06:42	CA机房外门禁	1000241	1
4516	2020-05-20 20:06:44	CA机房外门禁	1000404	1
4520	2020-05-26 09:52:09	CA机房外门禁	1000241	1
4525	2020-05-26 09:52:12	CA机房外门禁	1000404	1
4528	2020-05-26 09:55:05	CA机房外门禁	1000241	1
4531	2020-05-26 09:55:10	CA机房外门禁	1000404	1
4536	2020-05-26 10:01:22	CA机房外门禁	1000241	1
4539	2020-05-26 10:01:25	CA机房外门禁	1000404	1
4543	2020-05-26 10:06:46	CA机房外门禁	1000241	1
4549	2020-05-26 10:06:49	CA机房外门禁	1000404	1
4553	2020-05-26 10:22:44	CA机房外门禁	1000241	1
4556	2020-05-26 10:22:49	CA机房外门禁	1000404	1
4561	2020-05-26 10:38:02	CA机房外门禁	1000241	1
4564	2020-05-26 10:38:08	CA机房外门禁	1000404	1
4569	2020-05-26 10:48:20	CA机房外门禁	1000241	1
4572	2020-05-26 10:48:23	CA机房外门禁	1000404	1
4575	2020-05-26 10:55:33	CA机房外门禁	1000241	1
4581	2020-05-26 10:55:38	CA机房外门禁	1000404	1
4585	2020-05-26 13:39:21	CA机房外门禁	1000241	1
4587	2020-05-26 13:39:25	CA机房外门禁	1000404	1
4592	2020-05-26 14:06:33	CA机房外门禁	1000241	1
4596	2020-05-26 14:06:35	CA机房外门禁	1000404	1
4601	2020-05-26 15:32:21	CA机房外门禁	1000241	1
4604	2020-05-26 15:32:23	CA机房外门禁	1000404	1
4607	2020-05-26 16:15:17	CA机房外门禁	1000241	1
4613	2020-05-26 16:15:20	CA机房外门禁	1000404	1
4616	2020-05-26 16:53:15	CA机房外门禁	1000241	1
4619	2020-05-26 16:53:17	CA机房外门禁	1000404	1
4623	2020-06-02 09:52:43	CA机房外门禁	1000241	1
4629	2020-06-02 09:52:45	CA机房外门禁	1000404	1
4631	2020-06-02 10:16:24	CA机房外门禁	1000241	1
4636	2020-06-02 10:16:26	CA机房外门禁	1000404	1
4639	2020-06-17 16:45:20	CA机房外门禁	0	1
4644	2021-12-15 11:31:52	CA机房外门禁	1001	1
4649	2021-12-15 11:31:57	CA机房外门禁	1002	1
4651	2021-12-15 11:47:04	CA机房外门禁	1002	1
4655	2021-12-15 11:47:08	CA机房外门禁	1001	1
4659	2021-12-15 11:49:25	CA机房外门禁	1001	1
4664	2021-12-15 11:49:31	CA机房外门禁	1002	1
4667	2021-12-15 16:28:37	CA机房外门禁	1002	1
4671	2021-12-15 16:28:40	CA机房外门禁	1001	1
4675	2021-12-16 08:58:53	CA机房外门禁	1002	1
4679	2021-12-16 08:59:02	CA机房外门禁	1001	1
4683	2021-12-16 08:59:11	CA机房外门禁	1002	1
4687	2021-12-16 09:14:15	CA机房外门禁	1002	1
4693	2021-12-16 09:14:44	CA机房外门禁	1002	1
4696	2021-12-24 16:39:03	CA机房外门禁	1002	1
4700	2021-12-24 16:39:06	CA机房外门禁	1001	1
4703	2021-12-24 16:45:04	CA机房外门禁	1003	1
4707	2021-12-24 16:45:13	CA机房外门禁	0	1
4712	2021-12-24 16:45:16	CA机房外门禁	0	1
4716	2021-12-24 16:45:18	CA机房外门禁	0	1
4720	2021-12-24 16:45:22	CA机房外门禁	0	1
4725	2021-12-24 16:45:25	CA机房外门禁	0	1
4729	2021-12-24 16:45:29	CA机房外门禁	0	1
4731	2021-12-24 16:51:14	CA机房外门禁	1003	1
4737	2021-12-24 16:51:18	CA机房外门禁	1003	1
4740	2021-12-24 16:51:23	CA机房外门禁	0	1
4744	2021-12-24 16:51:25	CA机房外门禁	1003	1
4747	2021-12-24 16:51:26	CA机房外门禁	0	1
4508	2020-05-19 21:49:24	信息机房外门禁	1002	1
4512	2020-05-19 21:49:26	信息机房外门禁	1001	1
4517	2020-05-20 08:24:24	信息机房外门禁	1002	1
4519	2020-05-20 08:24:27	信息机房外门禁	1001	1
4523	2020-05-20 08:26:30	信息机房外门禁	1002	1
4529	2020-05-20 08:26:33	信息机房外门禁	1001	1
4532	2020-05-20 08:33:55	信息机房外门禁	1002	1
4537	2020-05-20 08:33:57	信息机房外门禁	1001	1
4541	2020-05-20 09:06:03	信息机房外门禁	1001	1
4545	2020-05-20 09:06:06	信息机房外门禁	1002	1
4547	2020-05-20 09:37:26	信息机房外门禁	0	1
4551	2020-05-20 09:37:29	信息机房外门禁	1002	1
4557	2020-05-20 09:37:32	信息机房外门禁	1001	1
4560	2020-05-20 09:39:06	信息机房外门禁	1002	1
4563	2020-05-20 09:39:09	信息机房外门禁	1001	1
4567	2020-05-20 09:49:05	信息机房外门禁	1002	1
4573	2020-05-20 09:49:07	信息机房外门禁	1001	1
4577	2020-05-20 09:51:08	信息机房外门禁	1002	1
4580	2020-05-20 09:51:10	信息机房外门禁	1001	1
4583	2020-05-20 09:54:56	信息机房外门禁	1001	1
4589	2020-05-20 09:55:01	信息机房外门禁	1002	1
4591	2020-05-20 09:55:55	信息机房外门禁	1002	1
4595	2020-05-20 09:55:58	信息机房外门禁	1001	1
4599	2020-05-20 09:56:07	信息机房外门禁	1001	1
4605	2020-05-20 09:56:13	信息机房外门禁	1002	1
4608	2020-05-20 14:07:42	信息机房外门禁	1002	1
4612	2020-05-20 14:07:45	信息机房外门禁	1001	1
4617	2020-05-20 18:35:53	信息机房外门禁	1002	1
4621	2020-05-20 18:35:56	信息机房外门禁	1001	1
4625	2020-05-20 18:38:21	信息机房外门禁	0	1
4628	2020-05-20 18:38:24	信息机房外门禁	1002	1
4633	2020-05-20 18:38:26	信息机房外门禁	1001	1
4635	2020-05-20 18:39:19	信息机房外门禁	1002	1
4641	2020-05-20 18:39:21	信息机房外门禁	1001	1
4645	2020-05-20 20:14:44	信息机房外门禁	0	1
4647	2020-05-20 20:14:47	信息机房外门禁	0	1
4652	2020-05-20 20:14:51	信息机房外门禁	1002	1
4657	2020-05-20 20:14:54	信息机房外门禁	1001	1
4660	2020-05-25 13:57:08	信息机房外门禁	1002	1
4665	2020-05-25 13:57:10	信息机房外门禁	1001	1
4668	2020-05-26 09:55:51	信息机房外门禁	1001	1
4673	2020-05-26 09:55:53	信息机房外门禁	1002	1
4676	2020-05-26 10:08:41	信息机房外门禁	1001	1
4681	2020-05-26 10:08:44	信息机房外门禁	1002	1
4685	2020-05-26 16:10:16	信息机房外门禁	1001	1
4688	2020-05-26 16:10:19	信息机房外门禁	0	1
4691	2020-05-26 16:10:21	信息机房外门禁	1002	1
4697	2020-05-27 17:22:48	信息机房外门禁	1002	1
4701	2020-05-27 17:22:50	信息机房外门禁	1001	1
4704	2020-06-03 16:12:29	信息机房外门禁	1002	1
4709	2020-06-03 16:12:33	信息机房外门禁	1001	1
4711	2020-06-04 11:54:16	信息机房外门禁	1002	1
4715	2020-06-04 11:54:19	信息机房外门禁	1001	1
4719	2020-06-04 15:51:56	信息机房外门禁	1002	1
4723	2020-06-04 15:52:01	信息机房外门禁	1001	1
4728	2020-06-17 11:08:18	信息机房外门禁	1002	1
4733	2020-06-17 11:08:20	信息机房外门禁	1001	1
4735	2020-06-23 09:55:58	信息机房外门禁	1008	1
4739	2020-06-23 09:58:23	信息机房外门禁	1001	1
4743	2020-06-23 09:58:25	信息机房外门禁	1008	1
4749	2020-06-24 11:07:42	信息机房外门禁	1002	1
4752	2020-06-24 11:07:43	信息机房外门禁	1001	1
4757	2020-06-30 20:55:32	信息机房外门禁	1008	1
4759	2020-06-30 20:55:34	信息机房外门禁	1001	1
4765	2020-07-01 08:11:49	信息机房外门禁	1008	1
4768	2020-07-01 08:11:51	信息机房外门禁	1001	1
4771	2020-07-03 11:21:45	信息机房外门禁	1008	1
4776	2020-07-03 11:21:47	信息机房外门禁	1001	1
4779	2020-07-03 12:49:16	信息机房外门禁	1001	1
4783	2020-07-03 12:49:18	信息机房外门禁	1008	1
4789	2020-07-03 14:07:40	信息机房外门禁	1008	1
4793	2020-07-03 14:07:42	信息机房外门禁	1001	1
4796	2020-07-07 14:18:14	信息机房外门禁	1001	1
4799	2020-07-07 14:18:16	信息机房外门禁	1008	1
4804	2020-07-15 09:23:57	信息机房外门禁	1008	1
4808	2020-07-15 09:23:59	信息机房外门禁	1001	1
4813	2020-07-15 09:31:37	信息机房外门禁	1008	1
4815	2020-07-15 09:31:39	信息机房外门禁	1001	1
4821	2020-07-16 15:39:41	信息机房外门禁	1008	1
4824	2020-07-16 15:39:43	信息机房外门禁	1001	1
4827	2020-07-23 15:02:45	信息机房外门禁	1008	1
4833	2020-07-23 15:02:47	信息机房外门禁	1001	1
4837	2020-07-23 15:03:18	信息机房外门禁	1008	1
4840	2020-07-23 15:03:20	信息机房外门禁	1001	1
4844	2020-08-06 17:12:42	信息机房外门禁	1008	1
4847	2020-08-06 17:12:45	信息机房外门禁	1001	1
4853	2020-08-06 17:17:25	信息机房外门禁	1008	1
4856	2020-08-06 17:17:27	信息机房外门禁	1001	1
4859	2020-08-09 09:50:41	信息机房外门禁	1008	1
4864	2020-08-09 09:50:44	信息机房外门禁	1001	1
4867	2020-08-09 23:15:57	信息机房外门禁	1008	1
4873	2020-08-09 23:16:00	信息机房外门禁	1001	1
4875	2020-08-09 23:16:13	信息机房外门禁	1008	1
4880	2020-08-09 23:16:15	信息机房外门禁	1001	1
4885	2020-08-13 08:50:42	信息机房外门禁	1008	1
4889	2020-08-13 08:50:44	信息机房外门禁	1001	1
4893	2020-08-13 11:13:18	信息机房外门禁	1008	1
4897	2020-08-13 11:13:20	信息机房外门禁	1001	1
4901	2020-08-13 11:29:39	信息机房外门禁	1001	1
4903	2020-08-13 11:29:41	信息机房外门禁	1008	1
4908	2020-08-18 16:06:33	信息机房外门禁	0	1
4911	2020-08-18 16:06:37	信息机房外门禁	1001	1
4917	2020-08-18 16:06:39	信息机房外门禁	1008	1
4920	2020-08-18 16:14:23	信息机房外门禁	1003	1
4925	2020-08-18 16:14:25	信息机房外门禁	0	1
4927	2020-08-18 16:14:27	信息机房外门禁	1009	1
4931	2020-08-18 16:14:34	信息机房外门禁	1003	1
4570	2020-05-15 17:30:28	密钥机房外门禁	1001	1
4574	2020-05-15 17:32:55	密钥机房外门禁	1001	1
4578	2020-05-15 17:32:57	密钥机房外门禁	1002	1
4582	2020-05-15 20:56:10	密钥机房外门禁	1010	1
4586	2020-05-15 20:56:13	密钥机房外门禁	1010	1
4590	2020-05-15 20:56:15	密钥机房外门禁	1010	1
4594	2020-05-15 20:56:18	密钥机房外门禁	1010	1
4598	2020-05-15 20:56:20	密钥机房外门禁	1010	1
4602	2020-05-15 20:56:23	密钥机房外门禁	1010	1
4606	2020-05-15 20:56:25	密钥机房外门禁	1010	1
4610	2020-05-15 20:57:53	密钥机房外门禁	1010	1
4614	2020-05-15 20:57:56	密钥机房外门禁	1010	1
4618	2020-05-15 20:57:58	密钥机房外门禁	1010	1
4622	2020-05-15 20:58:01	密钥机房外门禁	1010	1
4626	2020-05-15 20:58:03	密钥机房外门禁	1010	1
4630	2020-05-15 20:58:06	密钥机房外门禁	1010	1
4634	2020-05-16 10:06:55	密钥机房外门禁	0	1
4638	2020-05-16 10:07:02	密钥机房外门禁	0	1
4642	2020-05-16 10:09:56	密钥机房外门禁	0	1
4646	2020-05-16 10:10:02	密钥机房外门禁	0	1
4650	2020-05-16 10:10:05	密钥机房外门禁	1002331	1
4654	2020-05-16 10:10:12	密钥机房外门禁	1002331	1
4658	2020-05-16 10:11:57	密钥机房外门禁	1002331	1
4662	2020-05-16 10:26:09	密钥机房外门禁	0	1
4666	2020-05-16 10:26:16	密钥机房外门禁	1002331	1
4670	2020-05-16 10:27:56	密钥机房外门禁	0	1
4674	2020-05-16 10:27:59	密钥机房外门禁	10023311	1
4678	2020-05-16 10:28:18	密钥机房外门禁	0	1
4682	2020-05-16 10:28:23	密钥机房外门禁	10023311	1
4686	2020-05-16 10:28:47	密钥机房外门禁	1002331	1
4690	2020-05-16 10:30:43	密钥机房外门禁	1000800	1
4694	2020-05-16 10:30:47	密钥机房外门禁	1002331	1
4698	2020-05-16 10:31:09	密钥机房外门禁	10023311	1
4702	2020-05-16 10:31:12	密钥机房外门禁	10008001	1
4706	2020-05-16 10:31:31	密钥机房外门禁	1000800	1
4710	2020-05-16 10:31:33	密钥机房外门禁	10023311	1
4714	2020-05-16 10:32:48	密钥机房外门禁	10008001	1
4718	2020-05-16 10:32:50	密钥机房外门禁	10023311	1
4722	2020-05-16 10:33:04	密钥机房外门禁	10008001	1
4726	2020-05-16 10:33:07	密钥机房外门禁	10023311	1
4730	2020-05-16 10:33:10	密钥机房外门禁	10023311	1
4734	2020-05-16 10:33:12	密钥机房外门禁	0	1
4738	2020-05-16 10:33:19	密钥机房外门禁	10008001	1
4742	2020-05-16 10:33:22	密钥机房外门禁	1002331	1
4746	2020-05-16 10:33:52	密钥机房外门禁	10008001	1
4750	2020-05-16 10:33:56	密钥机房外门禁	10023311	1
4754	2020-05-16 10:34:02	密钥机房外门禁	10023311	1
4758	2020-05-16 10:34:05	密钥机房外门禁	10008001	1
4762	2020-05-16 10:34:09	密钥机房外门禁	10008001	1
4766	2020-05-16 10:34:12	密钥机房外门禁	1002331	1
4770	2020-05-16 10:34:15	密钥机房外门禁	0	1
4774	2020-05-16 10:34:18	密钥机房外门禁	1002331	1
4778	2020-05-16 10:34:21	密钥机房外门禁	10008001	1
4782	2020-05-16 10:34:23	密钥机房外门禁	0	1
4786	2020-05-16 10:34:25	密钥机房外门禁	10023311	1
4790	2020-05-16 11:40:49	密钥机房外门禁	1002331	1
4794	2020-05-16 11:40:54	密钥机房外门禁	1000800	1
4798	2020-05-16 14:23:04	密钥机房外门禁	1000800	1
4802	2020-05-16 14:23:09	密钥机房外门禁	1002331	1
4806	2020-05-16 14:37:45	密钥机房外门禁	1000800	1
4810	2020-05-16 14:37:49	密钥机房外门禁	1000800	1
4814	2020-05-16 14:37:53	密钥机房外门禁	1002331	1
4818	2020-05-16 15:25:18	密钥机房外门禁	1000800	1
4822	2020-05-16 15:25:21	密钥机房外门禁	1002331	1
4826	2020-05-16 16:50:20	密钥机房外门禁	1002331	1
4830	2020-05-16 16:50:22	密钥机房外门禁	1000800	1
4834	2020-05-16 16:53:16	密钥机房外门禁	1002331	1
4838	2020-05-16 16:53:20	密钥机房外门禁	1000800	1
4842	2020-05-16 17:07:04	密钥机房外门禁	1000800	1
4846	2020-05-16 17:07:11	密钥机房外门禁	0	1
4850	2020-05-16 17:07:14	密钥机房外门禁	0	1
4854	2020-05-16 17:07:17	密钥机房外门禁	1002331	1
4858	2020-05-16 17:09:13	密钥机房外门禁	1000800	1
4862	2020-05-16 17:09:18	密钥机房外门禁	1002331	1
4866	2020-05-16 17:34:06	密钥机房外门禁	1002331	1
4870	2020-05-16 17:34:10	密钥机房外门禁	1000800	1
4874	2020-05-16 17:50:54	密钥机房外门禁	1003	1
4878	2020-05-16 17:57:36	密钥机房外门禁	0	1
4882	2020-05-16 17:57:38	密钥机房外门禁	1002331	1
4886	2020-05-16 17:57:42	密钥机房外门禁	1000800	1
4890	2020-05-16 18:15:43	密钥机房外门禁	1002331	1
4894	2020-05-16 18:15:45	密钥机房外门禁	1000800	1
4898	2020-05-16 18:50:10	密钥机房外门禁	1002331	1
4902	2020-05-16 18:50:13	密钥机房外门禁	1000800	1
4906	2020-05-18 13:46:14	密钥机房外门禁	1002331	1
4910	2020-05-18 13:46:17	密钥机房外门禁	1000800	1
4914	2020-05-18 13:46:20	密钥机房外门禁	1000800	1
4918	2020-05-18 14:23:52	密钥机房外门禁	0	1
4922	2020-05-18 14:23:56	密钥机房外门禁	1000800	1
4926	2020-05-18 14:24:05	密钥机房外门禁	1002331	1
4930	2020-05-18 14:25:29	密钥机房外门禁	1002331	1
4934	2020-05-18 14:25:32	密钥机房外门禁	1000800	1
4938	2020-05-18 14:25:54	密钥机房外门禁	1000800	1
4942	2020-05-18 14:25:59	密钥机房外门禁	1002331	1
4946	2020-05-18 14:28:54	密钥机房外门禁	1002331	1
4950	2020-05-18 14:28:56	密钥机房外门禁	1000800	1
4954	2020-05-18 14:30:51	密钥机房外门禁	1002331	1
4958	2020-05-18 14:30:54	密钥机房外门禁	1000800	1
4962	2020-05-18 14:33:39	密钥机房外门禁	1000800	1
4966	2020-05-18 14:34:09	密钥机房外门禁	1000800	1
4663	2022-03-28 14:07:10	信息机房内门禁	1002	1
4669	2022-03-28 14:07:13	信息机房内门禁	1001	1
4672	2022-03-30 12:07:43	信息机房内门禁	1002	1
4677	2022-03-30 12:07:46	信息机房内门禁	1001	1
4680	2022-03-31 16:01:20	信息机房内门禁	1001	1
4684	2022-03-31 16:01:24	信息机房内门禁	1002	1
4689	2022-04-14 09:34:17	信息机房内门禁	1001	1
4692	2022-04-14 09:34:18	信息机房内门禁	1002	1
4695	2022-04-14 10:03:26	信息机房内门禁	1002	1
4699	2022-04-14 10:03:29	信息机房内门禁	1001	1
4705	2022-04-14 10:08:35	信息机房内门禁	1002	1
4708	2022-04-14 10:08:38	信息机房内门禁	1001	1
4713	2022-04-19 10:50:27	信息机房内门禁	1005	1
4717	2022-04-19 10:50:30	信息机房内门禁	1001	1
4721	2022-04-19 14:17:52	信息机房内门禁	1005	1
4724	2022-04-19 14:17:56	信息机房内门禁	1001	1
4727	2022-04-21 14:06:27	信息机房内门禁	1001	1
4732	2022-04-21 14:06:31	信息机房内门禁	1005	1
4736	2022-04-25 16:38:39	信息机房内门禁	1005	1
4741	2022-04-25 16:38:41	信息机房内门禁	1001	1
4745	2022-04-29 10:51:46	信息机房内门禁	1008	1
4748	2022-04-29 10:51:49	信息机房内门禁	1001	1
4751	2022-04-29 15:19:46	信息机房内门禁	1008	1
4756	2022-04-29 15:19:48	信息机房内门禁	1001	1
4761	2022-04-29 15:28:41	信息机房内门禁	1008	1
4764	2022-04-29 15:28:44	信息机房内门禁	1001	1
4769	2022-05-06 16:03:36	信息机房内门禁	1008	1
4772	2022-05-06 16:03:39	信息机房内门禁	1001	1
4775	2022-05-11 16:29:05	信息机房内门禁	1008	1
4780	2022-05-11 16:29:08	信息机房内门禁	1001	1
4785	2022-05-13 15:20:27	信息机房内门禁	1008	1
4787	2022-05-13 15:20:29	信息机房内门禁	1001	1
4792	2022-05-13 17:20:32	信息机房内门禁	1008	1
4795	2022-05-13 17:20:34	信息机房内门禁	1001	1
4801	2022-05-17 18:04:32	信息机房内门禁	1008	1
4805	2022-05-17 18:04:34	信息机房内门禁	1001	1
4809	2022-05-17 18:13:24	信息机房内门禁	1008	1
4812	2022-05-17 18:13:26	信息机房内门禁	1001	1
4816	2022-05-17 18:25:19	信息机房内门禁	1008	1
4820	2022-05-17 18:25:27	信息机房内门禁	1001	1
4823	2022-05-18 14:25:48	信息机房内门禁	1008	1
4828	2022-05-18 14:26:03	信息机房内门禁	1001	1
4831	2022-05-19 11:56:10	信息机房内门禁	1008	1
4835	2022-05-19 11:56:12	信息机房内门禁	1001	1
4839	2022-05-19 11:58:08	信息机房内门禁	1008	1
4845	2022-05-19 11:58:10	信息机房内门禁	1001	1
4849	2022-05-19 13:51:44	信息机房内门禁	1008	1
4851	2022-05-19 13:51:55	信息机房内门禁	1001	1
4857	2022-05-19 14:39:54	信息机房内门禁	1001	1
4860	2022-05-19 14:39:58	信息机房内门禁	0	1
4863	2022-05-19 14:40:00	信息机房内门禁	1006	1
4869	2022-05-19 15:32:59	信息机房内门禁	1001	1
4872	2022-05-19 15:33:01	信息机房内门禁	1008	1
4876	2022-05-25 17:14:04	信息机房内门禁	1008	1
4879	2022-05-25 17:14:07	信息机房内门禁	1001	1
4883	2022-05-27 17:30:20	信息机房内门禁	1008	1
4888	2022-05-27 17:30:25	信息机房内门禁	1001	1
4892	2022-05-27 22:05:30	信息机房内门禁	1001	1
4896	2022-05-27 22:05:32	信息机房内门禁	1008	1
4899	2022-05-27 23:48:21	信息机房内门禁	1008	1
4904	2022-05-27 23:48:24	信息机房内门禁	1001	1
4907	2022-05-27 23:51:04	信息机房内门禁	1008	1
4913	2022-05-27 23:51:06	信息机房内门禁	1001	1
4916	2022-05-28 14:48:30	信息机房内门禁	1008	1
4919	2022-05-28 14:48:32	信息机房内门禁	1001	1
4924	2022-05-28 14:57:48	信息机房内门禁	1008	1
4929	2022-05-28 14:57:51	信息机房内门禁	1001	1
4932	2022-05-28 15:58:38	信息机房内门禁	1008	1
4936	2022-05-28 15:58:40	信息机房内门禁	1001	1
4940	2022-05-30 12:03:08	信息机房内门禁	1008	1
4943	2022-05-30 12:03:11	信息机房内门禁	1001	1
4947	2022-05-30 14:13:49	信息机房内门禁	1008	1
4951	2022-05-30 14:13:52	信息机房内门禁	1001	1
4956	2022-05-30 16:56:56	信息机房内门禁	1008	1
4960	2022-05-30 16:56:58	信息机房内门禁	1001	1
4964	2022-05-31 08:30:03	信息机房内门禁	1008	1
4969	2022-05-31 08:30:05	信息机房内门禁	1001	1
4972	2022-05-31 09:07:12	信息机房内门禁	1001	1
4977	2022-01-08 15:44:47	CA机房外门禁	1006	1
4981	2022-01-08 15:44:49	CA机房外门禁	1005	1
4985	2022-01-08 15:45:34	CA机房外门禁	1006	1
4988	2022-01-08 15:45:38	CA机房外门禁	1005	1
4992	2022-01-08 15:46:53	CA机房外门禁	1006	1
4997	2022-01-08 15:46:58	CA机房外门禁	1005	1
5000	2022-01-08 15:48:15	CA机房外门禁	1005	1
5004	2022-01-08 15:48:18	CA机房外门禁	1006	1
5009	2022-01-08 15:49:36	CA机房外门禁	1006	1
5013	2022-01-08 15:49:38	CA机房外门禁	1005	1
5015	2022-01-08 15:52:06	CA机房外门禁	1005	1
5021	2022-01-08 15:52:09	CA机房外门禁	1006	1
5024	2022-01-08 15:55:14	CA机房外门禁	1006	1
5028	2022-01-08 15:55:20	CA机房外门禁	1005	1
5033	2022-01-08 15:58:36	CA机房外门禁	1006	1
5036	2022-01-08 15:58:40	CA机房外门禁	1005	1
5040	2022-01-08 16:00:25	CA机房外门禁	1006	1
5044	2022-01-08 16:00:27	CA机房外门禁	1005	1
5048	2022-01-08 16:02:16	CA机房外门禁	1005	1
5053	2022-01-08 16:02:20	CA机房外门禁	1006	1
5056	2022-01-08 16:03:54	CA机房外门禁	1006	1
5060	2022-01-08 16:03:57	CA机房外门禁	1005	1
5065	2022-01-08 16:07:34	CA机房外门禁	1005	1
5067	2022-01-08 16:07:36	CA机房外门禁	1006	1
5072	2022-01-08 16:09:19	CA机房外门禁	1006	1
5076	2022-01-08 16:09:22	CA机房外门禁	1005	1
5080	2022-01-08 16:12:58	CA机房外门禁	1006	1
5083	2022-01-08 16:13:01	CA机房外门禁	1005	1
5088	2022-01-08 16:15:16	CA机房外门禁	1006	1
4753	2021-12-24 16:51:33	CA机房外门禁	1003	1
4755	2021-12-24 16:51:35	CA机房外门禁	0	1
4760	2021-12-24 16:51:39	CA机房外门禁	1003	1
4763	2021-12-24 16:52:21	CA机房外门禁	0	1
4767	2021-12-24 16:52:27	CA机房外门禁	0	1
4773	2021-12-24 16:52:38	CA机房外门禁	0	1
4777	2021-12-24 16:52:45	CA机房外门禁	0	1
4781	2021-12-24 16:52:53	CA机房外门禁	0	1
4784	2021-12-24 16:53:04	CA机房外门禁	0	1
4788	2021-12-24 16:53:12	CA机房外门禁	0	1
4791	2021-12-24 16:53:21	CA机房外门禁	0	1
4797	2021-12-24 16:55:56	CA机房外门禁	1001	1
4800	2021-12-24 16:55:59	CA机房外门禁	1002	1
4803	2021-12-29 16:47:05	CA机房外门禁	1005	1
4807	2021-12-29 16:47:10	CA机房外门禁	1006	1
4811	2021-12-29 16:57:18	CA机房外门禁	10002411	1
4817	2021-12-29 16:57:22	CA机房外门禁	1000404	1
4819	2021-12-29 16:57:36	CA机房外门禁	10002411	1
4825	2021-12-29 16:57:40	CA机房外门禁	1000404	1
4829	2021-12-29 16:57:56	CA机房外门禁	1000241	1
4832	2021-12-29 16:58:08	CA机房外门禁	10004041	1
4836	2021-12-29 16:58:15	CA机房外门禁	1000241	1
4841	2021-12-29 16:58:57	CA机房外门禁	1002	1
4843	2021-12-29 16:59:09	CA机房外门禁	1000404	1
4848	2021-12-29 16:59:16	CA机房外门禁	1002	1
4852	2021-12-29 16:59:42	CA机房外门禁	10002411	1
4855	2021-12-29 16:59:53	CA机房外门禁	1000241	1
4861	2021-12-29 16:59:59	CA机房外门禁	10004041	1
4865	2021-12-29 17:14:19	CA机房外门禁	1000241	1
4868	2021-12-29 17:14:22	CA机房外门禁	10004041	1
4871	2021-12-29 17:15:03	CA机房外门禁	10002411	1
4877	2021-12-29 17:15:06	CA机房外门禁	1000404	1
4881	2022-01-06 09:27:50	CA机房外门禁	1005	1
4884	2022-01-06 09:27:55	CA机房外门禁	1006	1
4887	2022-01-06 09:29:02	CA机房外门禁	1005	1
4891	2022-01-06 09:29:05	CA机房外门禁	1006	1
4895	2022-01-06 09:31:30	CA机房外门禁	1005	1
4900	2022-01-06 09:31:33	CA机房外门禁	1006	1
4905	2022-01-06 09:33:17	CA机房外门禁	1006	1
4909	2022-01-06 09:33:20	CA机房外门禁	1005	1
4912	2022-01-06 09:34:41	CA机房外门禁	1006	1
4915	2022-01-06 09:34:43	CA机房外门禁	0	1
4921	2022-01-06 09:34:47	CA机房外门禁	1006	1
4923	2022-01-06 09:34:50	CA机房外门禁	0	1
4928	2022-01-06 09:34:53	CA机房外门禁	1006	1
4933	2022-01-06 09:34:56	CA机房外门禁	0	1
4937	2022-01-06 09:35:03	CA机房外门禁	1006	1
4939	2022-01-06 09:35:06	CA机房外门禁	0	1
4945	2022-01-06 09:35:09	CA机房外门禁	1006	1
4949	2022-01-06 09:35:12	CA机房外门禁	0	1
4953	2022-01-06 09:35:15	CA机房外门禁	1006	1
4955	2022-01-06 09:35:17	CA机房外门禁	0	1
4959	2022-01-06 09:35:46	CA机房外门禁	1006	1
4965	2022-01-06 09:35:48	CA机房外门禁	1005	1
4967	2022-01-08 15:38:51	CA机房外门禁	1005	1
4971	2022-01-08 15:38:53	CA机房外门禁	1006	1
4976	2022-05-31 09:07:18	信息机房内门禁	1005	1
4982	2020-05-18 14:35:23	密钥机房外门禁	10008001	1
4986	2020-05-18 14:35:26	密钥机房外门禁	10008001	1
4990	2020-05-18 14:35:29	密钥机房外门禁	10008001	1
4994	2020-05-18 14:35:32	密钥机房外门禁	10008001	1
4998	2020-05-18 14:35:35	密钥机房外门禁	10008001	1
5002	2020-05-18 18:51:40	密钥机房外门禁	1001	1
5006	2020-05-18 18:51:43	密钥机房外门禁	1001	1
5010	2020-05-18 18:51:45	密钥机房外门禁	1001	1
5014	2020-05-18 18:51:50	密钥机房外门禁	1001	1
5018	2020-05-18 18:51:53	密钥机房外门禁	1001	1
5022	2020-05-18 18:51:57	密钥机房外门禁	1001	1
5026	2020-05-18 18:52:00	密钥机房外门禁	1001	1
5030	2020-05-18 18:56:34	密钥机房外门禁	1001	1
5034	2020-05-18 18:57:24	密钥机房外门禁	1003	1
5038	2020-05-18 18:57:26	密钥机房外门禁	1003	1
5042	2020-05-18 18:57:29	密钥机房外门禁	1003	1
5046	2020-05-18 18:57:31	密钥机房外门禁	1003	1
5050	2020-05-18 18:57:33	密钥机房外门禁	1003	1
5054	2020-05-18 18:57:35	密钥机房外门禁	1003	1
5058	2020-05-18 19:35:23	密钥机房外门禁	1001	1
5062	2020-05-18 19:35:25	密钥机房外门禁	1001	1
5066	2020-05-18 19:35:27	密钥机房外门禁	1001	1
5070	2020-05-18 19:35:29	密钥机房外门禁	1001	1
5074	2020-05-18 19:35:31	密钥机房外门禁	1001	1
5078	2020-05-18 19:35:34	密钥机房外门禁	1001	1
5082	2020-05-18 19:35:36	密钥机房外门禁	1001	1
5086	2020-05-18 19:56:27	密钥机房外门禁	1001	1
5090	2020-05-18 19:56:29	密钥机房外门禁	1001	1
5094	2020-05-18 19:56:31	密钥机房外门禁	1001	1
5098	2020-05-18 19:56:33	密钥机房外门禁	1001	1
5102	2020-05-18 19:56:35	密钥机房外门禁	1001	1
5106	2020-05-18 19:56:37	密钥机房外门禁	1001	1
5110	2020-05-18 19:56:40	密钥机房外门禁	1001	1
5114	2020-05-18 20:07:41	密钥机房外门禁	1001	1
5118	2020-05-18 20:07:43	密钥机房外门禁	1001	1
5122	2020-05-18 20:07:45	密钥机房外门禁	1001	1
5126	2020-05-18 20:07:47	密钥机房外门禁	1001	1
5130	2020-05-18 20:07:49	密钥机房外门禁	1001	1
5134	2020-05-18 20:07:52	密钥机房外门禁	1001	1
5138	2020-05-18 20:07:55	密钥机房外门禁	1001	1
5142	2020-05-18 20:27:22	密钥机房外门禁	1001	1
5146	2020-05-18 20:27:24	密钥机房外门禁	1001	1
5150	2020-05-18 20:27:27	密钥机房外门禁	1001	1
5154	2020-05-18 20:27:29	密钥机房外门禁	1001	1
5158	2020-05-18 20:27:31	密钥机房外门禁	1001	1
5162	2020-05-18 20:27:33	密钥机房外门禁	1001	1
5165	2020-05-18 20:27:35	密钥机房外门禁	1001	1
5174	2020-05-18 20:34:54	密钥机房外门禁	1001	1
5177	2020-05-18 20:34:56	密钥机房外门禁	1001	1
5181	2020-05-18 20:34:58	密钥机房外门禁	1001	1
5184	2020-05-18 20:35:00	密钥机房外门禁	1001	1
4935	2020-08-18 16:14:36	信息机房外门禁	0	1
4941	2020-08-18 16:14:38	信息机房外门禁	0	1
4944	2020-08-18 16:14:40	信息机房外门禁	1009	1
4948	2020-08-18 17:26:10	信息机房外门禁	1001	1
4952	2020-08-18 17:26:12	信息机房外门禁	1008	1
4957	2020-08-19 13:52:28	信息机房外门禁	1001	1
4961	2020-08-19 13:52:30	信息机房外门禁	1008	1
4963	2020-08-24 17:28:21	信息机房外门禁	1008	1
4968	2020-08-24 17:28:23	信息机房外门禁	1001	1
4973	2020-08-27 10:38:17	信息机房外门禁	0	1
4975	2020-08-27 10:38:20	信息机房外门禁	1001	1
4996	2020-09-01 10:45:41	信息机房外门禁	1001	1
4999	2020-09-04 13:59:12	信息机房外门禁	1008	1
5003	2020-09-04 13:59:14	信息机房外门禁	1001	1
5007	2020-09-04 14:38:10	信息机房外门禁	1008	1
5012	2020-09-04 14:38:12	信息机房外门禁	1001	1
5016	2020-09-08 16:48:57	信息机房外门禁	1008	1
5019	2020-09-08 16:48:59	信息机房外门禁	1001	1
5025	2020-09-13 12:59:38	信息机房外门禁	1008	1
5027	2020-09-13 12:59:40	信息机房外门禁	1001	1
5031	2020-09-17 14:01:20	信息机房外门禁	1008	1
5035	2020-09-17 14:01:22	信息机房外门禁	1001	1
5039	2020-10-16 17:10:04	信息机房外门禁	1002	1
5043	2020-10-16 17:10:07	信息机房外门禁	1001	1
5049	2020-10-21 11:06:41	信息机房外门禁	1008	1
5051	2020-10-21 11:06:47	信息机房外门禁	1001	1
5055	2020-10-21 13:42:54	信息机房外门禁	1008	1
5059	2020-10-21 13:42:56	信息机房外门禁	1001	1
5063	2020-10-26 10:00:50	信息机房外门禁	1008	1
5068	2020-10-26 10:00:53	信息机房外门禁	1001	1
5073	2020-10-28 13:54:37	信息机房外门禁	1008	1
5075	2020-10-28 13:54:39	信息机房外门禁	1001	1
5081	2020-10-28 14:27:48	信息机房外门禁	1008	1
5085	2020-10-28 14:27:50	信息机房外门禁	1001	1
5087	2020-10-28 15:14:44	信息机房外门禁	1008	1
5091	2020-10-28 15:14:45	信息机房外门禁	1001	1
5096	2020-10-28 15:37:56	信息机房外门禁	1008	1
5101	2020-10-28 15:37:59	信息机房外门禁	1001	1
5103	2020-11-17 14:32:44	信息机房外门禁	0	1
5109	2020-11-17 14:32:46	信息机房外门禁	1002	1
5112	2020-11-17 14:32:50	信息机房外门禁	1001	1
5116	2020-11-17 15:56:17	信息机房外门禁	1002	1
5120	2020-11-17 15:56:19	信息机房外门禁	1001	1
5124	2020-11-26 14:17:33	信息机房外门禁	1008	1
5129	2020-11-26 14:17:35	信息机房外门禁	1001	1
5132	2020-11-26 14:39:05	信息机房外门禁	1008	1
5136	2020-11-26 14:39:07	信息机房外门禁	1001	1
5139	2020-11-26 16:11:55	信息机房外门禁	1008	1
5144	2020-11-26 16:11:57	信息机房外门禁	1001	1
5147	2020-11-27 15:21:57	信息机房外门禁	1008	1
5151	2020-11-27 15:21:59	信息机房外门禁	1001	1
5157	2020-11-30 15:13:05	信息机房外门禁	1003	1
5160	2020-11-30 15:13:06	信息机房外门禁	1009	1
5163	2020-11-30 15:13:18	信息机房外门禁	1003	1
5166	2020-11-30 15:13:21	信息机房外门禁	1009	1
5169	2020-11-30 15:13:38	信息机房外门禁	1003	1
5172	2020-11-30 15:13:39	信息机房外门禁	0	1
5178	2020-11-30 15:13:42	信息机房外门禁	0	1
5182	2020-11-30 15:13:44	信息机房外门禁	0	1
5186	2020-11-30 15:13:49	信息机房外门禁	1003	1
5189	2020-05-18 20:35:03	密钥机房外门禁	1001	1
5192	2020-05-18 20:35:05	密钥机房外门禁	1001	1
5195	2020-05-18 20:35:07	密钥机房外门禁	1001	1
5197	2020-05-19 09:13:39	密钥机房外门禁	1000800	1
5201	2020-05-19 09:13:52	密钥机房外门禁	1002331	1
5203	2020-05-19 09:18:04	密钥机房外门禁	1003	1
5206	2020-05-19 09:18:11	密钥机房外门禁	1003	1
5209	2020-05-19 09:22:11	密钥机房外门禁	1002331	1
5212	2020-05-19 09:22:14	密钥机房外门禁	1000800	1
5216	2020-05-19 09:24:18	密钥机房外门禁	1002331	1
5218	2020-05-19 09:24:21	密钥机房外门禁	1000800	1
5221	2020-05-19 09:27:46	密钥机房外门禁	0	1
5224	2020-05-19 09:27:49	密钥机房外门禁	0	1
5227	2020-05-19 09:27:54	密钥机房外门禁	1002331	1
5230	2020-05-19 09:27:57	密钥机房外门禁	1000800	1
5234	2020-05-19 09:28:06	密钥机房外门禁	1002331	1
5235	2022-07-07 11:11:50	信息机房内门禁	1001	1
5237	2020-05-19 09:28:10	密钥机房外门禁	1000800	1
5238	2022-07-08 10:33:52	信息机房内门禁	1001	1
5239	2020-05-19 09:32:00	密钥机房外门禁	1002331	1
5240	2022-01-08 16:21:42	CA机房外门禁	1005	1
5241	2022-07-08 10:33:53	信息机房内门禁	1006	1
5242	2020-05-19 09:32:03	密钥机房外门禁	1000800	1
5243	2022-01-08 16:21:45	CA机房外门禁	0	1
5244	2022-07-08 13:35:58	信息机房内门禁	1008	1
5245	2022-01-08 16:21:50	CA机房外门禁	1005	1
5246	2020-05-19 09:35:05	密钥机房外门禁	1000800	1
5247	2022-07-08 13:36:00	信息机房内门禁	1001	1
5248	2022-01-08 16:21:53	CA机房外门禁	0	1
5249	2020-05-19 09:35:08	密钥机房外门禁	1002331	1
5250	2022-07-15 10:11:04	信息机房内门禁	1008	1
5251	2022-01-08 16:21:57	CA机房外门禁	1005	1
5252	2020-05-19 09:38:02	密钥机房外门禁	1000800	1
5253	2022-07-15 10:11:06	信息机房内门禁	1001	1
5254	2022-01-08 16:22:01	CA机房外门禁	0	1
5255	2020-05-19 09:38:06	密钥机房外门禁	1002331	1
5256	2022-07-15 14:36:29	信息机房内门禁	1008	1
5257	2020-05-19 09:39:56	密钥机房外门禁	1002331	1
5258	2022-01-08 16:22:05	CA机房外门禁	1005	1
5259	2022-07-15 14:36:32	信息机房内门禁	1001	1
5260	2020-11-30 15:13:52	信息机房外门禁	0	1
5261	2022-01-08 16:22:10	CA机房外门禁	0	1
5262	2020-05-19 09:39:58	密钥机房外门禁	1000800	1
5264	2020-11-30 15:13:54	信息机房外门禁	1009	1
5263	2022-07-15 15:22:35	信息机房内门禁	1008	1
5266	2022-01-08 16:22:12	CA机房外门禁	1005	1
4970	2020-05-18 14:34:18	密钥机房外门禁	1002331	1
4979	2022-06-01 16:39:07	信息机房内门禁	1008	1
4983	2022-06-01 16:39:13	信息机房内门禁	1001	1
4987	2022-06-02 13:51:30	信息机房内门禁	1008	1
4993	2022-06-02 13:51:32	信息机房内门禁	1001	1
4995	2022-06-04 12:00:41	信息机房内门禁	1008	1
5001	2022-06-04 12:00:43	信息机房内门禁	1001	1
5005	2022-06-06 08:20:49	信息机房内门禁	1008	1
5008	2022-06-06 08:20:52	信息机房内门禁	1001	1
5011	2022-06-06 15:20:37	信息机房内门禁	1001	1
5017	2022-06-06 15:20:39	信息机房内门禁	1008	1
5020	2022-06-07 10:03:24	信息机房内门禁	1008	1
5023	2022-06-07 10:03:26	信息机房内门禁	1001	1
5029	2022-06-08 19:08:00	信息机房内门禁	1001	1
5032	2022-06-08 19:08:02	信息机房内门禁	1008	1
5037	2022-06-09 08:18:48	信息机房内门禁	1008	1
5041	2022-06-09 08:18:50	信息机房内门禁	1001	1
5045	2022-06-09 08:28:28	信息机房内门禁	1008	1
5047	2022-06-09 08:28:30	信息机房内门禁	1001	1
5052	2022-06-09 08:54:26	信息机房内门禁	1008	1
5057	2022-06-09 08:54:30	信息机房内门禁	1001	1
5061	2022-06-09 10:17:26	信息机房内门禁	1008	1
5064	2022-06-09 10:17:28	信息机房内门禁	1001	1
5069	2022-06-09 10:27:03	信息机房内门禁	1008	1
5071	2022-06-09 10:27:05	信息机房内门禁	1001	1
5077	2022-06-09 10:54:51	信息机房内门禁	1008	1
5079	2022-06-09 10:54:54	信息机房内门禁	1001	1
5084	2022-06-15 17:18:44	信息机房内门禁	1008	1
5089	2022-06-15 17:18:47	信息机房内门禁	1001	1
5092	2022-06-16 18:25:57	信息机房内门禁	1008	1
5093	2022-01-08 16:15:18	CA机房外门禁	0	1
5095	2022-01-08 16:15:22	CA机房外门禁	1005	1
5097	2022-06-16 18:26:00	信息机房内门禁	1001	1
5099	2022-06-17 11:08:29	信息机房内门禁	1008	1
5100	2022-01-08 16:16:35	CA机房外门禁	1005	1
5104	2022-01-08 16:16:38	CA机房外门禁	0	1
5105	2022-06-17 11:08:31	信息机房内门禁	1001	1
5107	2022-01-08 16:16:43	CA机房外门禁	1005	1
5108	2022-06-17 17:12:48	信息机房内门禁	1008	1
5111	2022-01-08 16:16:46	CA机房外门禁	0	1
5113	2022-06-17 17:12:50	信息机房内门禁	1001	1
5115	2022-01-08 16:16:50	CA机房外门禁	1005	1
5117	2022-06-18 18:19:17	信息机房内门禁	1008	1
5119	2022-01-08 16:16:52	CA机房外门禁	0	1
5121	2022-06-18 18:19:19	信息机房内门禁	1001	1
5123	2022-06-19 11:29:20	信息机房内门禁	1008	1
5125	2022-01-08 16:16:57	CA机房外门禁	1005	1
5127	2022-01-08 16:17:02	CA机房外门禁	0	1
5128	2022-06-19 11:29:22	信息机房内门禁	1001	1
5131	2022-01-08 16:17:05	CA机房外门禁	1005	1
5133	2022-06-20 09:21:49	信息机房内门禁	1008	1
5135	2022-01-08 16:17:08	CA机房外门禁	0	1
5137	2022-06-20 09:21:52	信息机房内门禁	1001	1
5140	2022-01-08 16:17:11	CA机房外门禁	1005	1
5141	2022-06-23 10:12:07	信息机房内门禁	1008	1
5143	2022-06-23 10:12:10	信息机房内门禁	1001	1
5145	2022-01-08 16:17:13	CA机房外门禁	0	1
5148	2022-01-08 16:17:17	CA机房外门禁	1005	1
5149	2022-06-23 10:39:21	信息机房内门禁	1001	1
5152	2022-06-23 10:39:26	信息机房内门禁	1008	1
5153	2022-01-08 16:17:19	CA机房外门禁	0	1
5155	2022-01-08 16:17:23	CA机房外门禁	1005	1
5156	2022-06-29 11:37:58	信息机房内门禁	1008	1
5159	2022-01-08 16:17:26	CA机房外门禁	0	1
5161	2022-06-29 11:38:00	信息机房内门禁	1001	1
5164	2022-06-30 11:38:39	信息机房内门禁	1001	1
5167	2022-06-30 11:38:41	信息机房内门禁	1008	1
5168	2022-06-30 12:45:45	信息机房内门禁	1008	1
5170	2022-01-08 16:17:30	CA机房外门禁	1005	1
5171	2022-06-30 12:45:59	信息机房内门禁	1001	1
5173	2022-01-08 16:17:32	CA机房外门禁	0	1
5175	2022-06-30 13:29:17	信息机房内门禁	1008	1
5176	2022-01-08 16:17:36	CA机房外门禁	1005	1
5179	2022-06-30 13:29:20	信息机房内门禁	1001	1
5180	2022-01-08 16:17:39	CA机房外门禁	0	1
5183	2022-06-30 17:03:48	信息机房内门禁	1006	1
5185	2022-01-08 16:17:42	CA机房外门禁	1005	1
5187	2022-06-30 17:03:51	信息机房内门禁	1001	1
5188	2022-01-08 16:17:46	CA机房外门禁	0	1
5190	2022-06-30 19:03:16	信息机房内门禁	1006	1
5191	2022-01-08 16:17:49	CA机房外门禁	1005	1
5193	2022-06-30 19:03:20	信息机房内门禁	1001	1
5194	2022-01-08 16:17:53	CA机房外门禁	0	1
5196	2022-07-01 11:36:55	信息机房内门禁	1008	1
5198	2022-01-08 16:18:58	CA机房外门禁	1006	1
5199	2022-07-01 11:36:57	信息机房内门禁	1001	1
5200	2022-01-08 16:19:01	CA机房外门禁	0	1
5202	2022-07-01 14:49:40	信息机房内门禁	1008	1
5204	2022-01-08 16:19:06	CA机房外门禁	1006	1
5205	2022-07-01 14:49:43	信息机房内门禁	1001	1
5207	2022-01-08 16:19:08	CA机房外门禁	0	1
5208	2022-07-01 15:26:36	信息机房内门禁	1008	1
5210	2022-01-08 16:19:13	CA机房外门禁	1006	1
5211	2022-07-01 15:26:38	信息机房内门禁	1001	1
5213	2022-01-08 16:19:18	CA机房外门禁	0	1
5214	2022-07-05 16:15:20	信息机房内门禁	1006	1
5215	2022-01-08 16:19:27	CA机房外门禁	1006	1
5217	2022-07-05 16:15:23	信息机房内门禁	1001	1
5219	2022-01-08 16:19:32	CA机房外门禁	0	1
5220	2022-07-05 16:36:13	信息机房内门禁	1006	1
5222	2022-01-08 16:19:40	CA机房外门禁	1006	1
5223	2022-07-05 16:36:16	信息机房内门禁	1001	1
5225	2022-01-08 16:19:46	CA机房外门禁	0	1
5226	2022-07-06 16:23:25	信息机房内门禁	1006	1
5228	2022-01-08 16:19:51	CA机房外门禁	1006	1
5229	2022-07-06 16:23:28	信息机房内门禁	1001	1
5231	2022-01-08 16:19:57	CA机房外门禁	0	1
5232	2022-07-07 11:11:46	信息机房内门禁	1006	1
5233	2022-01-08 16:21:31	CA机房外门禁	1005	1
755	2019-09-16 11:07:05	信息机房内门禁	11	1
759	2019-09-16 11:07:10	信息机房内门禁	12	1
765	2019-09-16 11:18:30	信息机房内门禁	1002	1
767	2019-09-16 11:18:33	信息机房内门禁	1001	1
772	2019-09-16 14:18:40	信息机房内门禁	0	1
777	2019-09-16 14:18:43	信息机房内门禁	11	1
779	2019-09-16 14:18:45	信息机房内门禁	12	1
783	2019-09-16 14:21:57	信息机房内门禁	11	1
789	2019-09-16 14:21:59	信息机房内门禁	12	1
793	2019-09-16 14:22:11	信息机房内门禁	11	1
796	2019-09-16 14:22:13	信息机房内门禁	12	1
801	2019-09-16 14:27:18	信息机房内门禁	0	1
803	2019-09-16 14:27:39	信息机房内门禁	0	1
809	2019-09-16 14:27:42	信息机房内门禁	11	1
813	2019-09-16 14:27:44	信息机房内门禁	12	1
819	2019-09-17 14:03:47	信息机房内门禁	1002	1
822	2019-09-17 14:03:50	信息机房内门禁	1001	1
828	2019-09-17 14:13:55	信息机房内门禁	0	1
832	2019-09-17 15:36:39	信息机房内门禁	1002	1
837	2019-09-17 15:36:43	信息机房内门禁	1001	1
843	2019-09-17 15:39:03	信息机房内门禁	1001	1
849	2019-09-17 15:39:05	信息机房内门禁	1002	1
852	2019-09-17 16:14:20	信息机房内门禁	1001	1
859	2019-09-17 16:14:22	信息机房内门禁	1002	1
862	2019-09-17 17:29:52	信息机房内门禁	1002	1
869	2019-09-17 17:29:54	信息机房内门禁	1001	1
874	2019-09-17 17:39:05	信息机房内门禁	1001	1
877	2019-09-17 17:39:07	信息机房内门禁	1002	1
883	2019-09-17 19:03:58	信息机房内门禁	1002	1
889	2019-09-17 19:04:00	信息机房内门禁	1001	1
942	2019-09-18 00:00:08	信息机房内门禁	1004	1
947	2019-09-18 00:00:11	信息机房内门禁	1005	1
951	2019-09-18 00:15:03	信息机房内门禁	1004	1
956	2019-09-18 00:15:05	信息机房内门禁	1005	1
961	2019-09-18 00:16:31	信息机房内门禁	1004	1
967	2019-09-18 00:16:34	信息机房内门禁	1005	1
970	2019-09-18 00:33:39	信息机房内门禁	11	1
977	2019-09-18 00:33:42	信息机房内门禁	12	1
981	2019-09-18 00:34:16	信息机房内门禁	1004	1
986	2019-09-18 00:34:18	信息机房内门禁	1005	1
992	2019-09-18 00:35:18	信息机房内门禁	1004	1
997	2019-09-18 00:35:20	信息机房内门禁	1005	1
1001	2019-09-18 00:38:15	信息机房内门禁	1004	1
1007	2019-09-18 00:38:17	信息机房内门禁	1005	1
1010	2019-09-18 00:39:45	信息机房内门禁	1004	1
1017	2019-09-18 00:39:47	信息机房内门禁	1005	1
1020	2019-09-18 00:55:37	信息机房内门禁	1004	1
1026	2019-09-18 00:55:39	信息机房内门禁	1005	1
1031	2019-09-18 00:59:54	信息机房内门禁	1004	1
1037	2019-09-18 00:59:56	信息机房内门禁	1005	1
1042	2019-09-18 01:03:58	信息机房内门禁	1004	1
1045	2019-09-18 01:04:00	信息机房内门禁	1005	1
1051	2019-09-18 01:05:16	信息机房内门禁	1004	1
1056	2019-09-18 01:05:19	信息机房内门禁	1005	1
1060	2019-09-18 08:20:11	信息机房内门禁	0	1
1067	2019-09-18 08:20:15	信息机房内门禁	1002	1
1072	2019-09-18 08:20:20	信息机房内门禁	1001	1
1075	2019-09-18 08:24:42	信息机房内门禁	1002	1
1082	2019-09-18 08:24:46	信息机房内门禁	1001	1
1085	2019-09-18 11:45:39	信息机房内门禁	1002	1
1092	2019-09-18 11:45:41	信息机房内门禁	1001	1
1096	2019-09-18 15:06:32	信息机房内门禁	0	1
1101	2019-09-18 15:06:36	信息机房内门禁	11	1
1105	2019-09-18 15:06:39	信息机房内门禁	12	1
1111	2019-09-18 15:23:28	信息机房内门禁	11	1
1117	2019-09-18 15:23:30	信息机房内门禁	12	1
1120	2019-09-18 15:35:58	信息机房内门禁	11	1
1126	2019-09-18 15:36:03	信息机房内门禁	0	1
1131	2019-09-18 15:36:05	信息机房内门禁	12	1
1136	2019-09-18 15:37:45	信息机房内门禁	11	1
1142	2019-09-18 15:37:51	信息机房内门禁	0	1
1147	2019-09-18 15:37:52	信息机房内门禁	12	1
1151	2019-09-18 16:17:34	信息机房内门禁	1002	1
1157	2019-09-18 16:17:37	信息机房内门禁	1001	1
1161	2019-09-18 16:18:37	信息机房内门禁	1002	1
1167	2019-09-18 16:18:40	信息机房内门禁	1001	1
1170	2019-09-18 16:30:57	信息机房内门禁	1001	1
1175	2019-09-18 16:31:00	信息机房内门禁	1002	1
1181	2019-09-18 16:37:04	信息机房内门禁	1003	1
1187	2019-09-18 16:37:06	信息机房内门禁	1004	1
1190	2019-09-20 11:28:11	信息机房内门禁	1002	1
1197	2019-09-20 11:28:14	信息机房内门禁	1001	1
1200	2019-09-20 17:29:43	信息机房内门禁	1001	1
1207	2019-09-20 17:29:47	信息机房内门禁	1002	1
1210	2019-09-20 17:53:55	信息机房内门禁	1002	1
1217	2019-09-20 17:53:59	信息机房内门禁	1001	1
1221	2019-09-21 15:29:27	信息机房内门禁	1002	1
1225	2019-09-21 15:29:30	信息机房内门禁	1001	1
1229	2019-09-21 16:42:11	信息机房内门禁	1002	1
1235	2019-09-21 16:42:14	信息机房内门禁	1001	1
1238	2019-09-21 16:42:33	信息机房内门禁	1002	1
1241	2019-09-21 16:45:11	信息机房内门禁	1002	1
1246	2019-09-21 16:45:15	信息机房内门禁	1001	1
1249	2019-09-23 08:54:23	信息机房内门禁	1002	1
1255	2019-09-23 08:54:26	信息机房内门禁	1001	1
1258	2019-09-23 16:46:45	信息机房内门禁	1002	1
1262	2019-09-23 16:46:48	信息机房内门禁	1001	1
1265	2019-09-24 08:11:34	信息机房内门禁	1002	1
1270	2019-09-24 08:11:37	信息机房内门禁	1001	1
1273	2019-09-24 14:19:36	信息机房内门禁	1002	1
1277	2019-09-24 14:19:56	信息机房内门禁	1002	1
1283	2019-09-24 14:20:03	信息机房内门禁	1001	1
1285	2019-09-25 11:29:18	信息机房内门禁	1001	1
1289	2019-09-25 11:29:20	信息机房内门禁	1008	1
1295	2019-09-25 11:32:15	信息机房内门禁	1001	1
1297	2019-09-25 11:32:17	信息机房内门禁	1008	1
1303	2019-09-25 11:43:15	信息机房内门禁	1001	1
5265	2020-05-19 09:55:19	密钥机房外门禁	1002331	1
5269	2020-05-19 09:55:23	密钥机房外门禁	1000800	1
5273	2020-05-19 10:02:38	密钥机房外门禁	0	1
5277	2020-05-19 10:02:41	密钥机房外门禁	0	1
5281	2020-05-19 10:02:44	密钥机房外门禁	0	1
5286	2020-05-19 10:02:48	密钥机房外门禁	1000800	1
5290	2020-05-19 10:02:52	密钥机房外门禁	1002331	1
5293	2020-05-19 10:03:11	密钥机房外门禁	1000800	1
5297	2020-05-19 10:03:16	密钥机房外门禁	0	1
5301	2020-05-19 10:03:19	密钥机房外门禁	1002331	1
5306	2020-05-19 10:05:04	密钥机房外门禁	1002331	1
5309	2020-05-19 10:05:06	密钥机房外门禁	1000800	1
5314	2020-05-19 10:57:35	密钥机房外门禁	1002331	1
5318	2020-05-19 10:57:38	密钥机房外门禁	1000800	1
5322	2020-05-19 11:47:38	密钥机房外门禁	1002331	1
5326	2020-05-19 11:47:40	密钥机房外门禁	1000800	1
5329	2020-05-19 11:48:00	密钥机房外门禁	1002331	1
5333	2020-05-19 11:48:03	密钥机房外门禁	1000800	1
5337	2020-05-19 13:08:13	密钥机房外门禁	1002331	1
5342	2020-05-19 13:08:17	密钥机房外门禁	1000800	1
5346	2020-05-19 13:09:21	密钥机房外门禁	1002331	1
5350	2020-05-19 13:09:25	密钥机房外门禁	1000800	1
5354	2020-05-19 13:43:13	密钥机房外门禁	1002331	1
5357	2020-05-19 13:43:15	密钥机房外门禁	1000800	1
5362	2020-05-19 13:45:56	密钥机房外门禁	1002331	1
5365	2020-05-19 13:45:59	密钥机房外门禁	1000800	1
5369	2020-05-19 13:51:40	密钥机房外门禁	1002331	1
5374	2020-05-19 13:51:42	密钥机房外门禁	1000800	1
5377	2020-05-19 13:53:11	密钥机房外门禁	0	1
5381	2020-05-19 13:53:12	密钥机房外门禁	0	1
5385	2020-05-19 17:23:09	密钥机房外门禁	1002331	1
5389	2020-05-19 17:23:12	密钥机房外门禁	1000800	1
5393	2020-05-19 18:25:22	密钥机房外门禁	1002331	1
5397	2020-05-19 18:25:25	密钥机房外门禁	1000800	1
5401	2020-05-19 18:26:00	密钥机房外门禁	1002331	1
5405	2020-05-19 18:26:03	密钥机房外门禁	1000800	1
5409	2020-05-19 18:28:16	密钥机房外门禁	1002331	1
5414	2020-05-19 18:28:19	密钥机房外门禁	1000800	1
5417	2020-05-19 18:30:20	密钥机房外门禁	1000800	1
5421	2020-05-19 18:30:23	密钥机房外门禁	1000800	1
5425	2020-05-19 18:30:26	密钥机房外门禁	1000800	1
5429	2020-05-19 18:30:29	密钥机房外门禁	1000800	1
5434	2020-05-19 18:30:33	密钥机房外门禁	1000800	1
5437	2020-05-19 18:30:37	密钥机房外门禁	1000800	1
5442	2020-05-19 18:30:40	密钥机房外门禁	1000800	1
5445	2020-05-19 18:30:44	密钥机房外门禁	1000800	1
5449	2020-05-19 18:30:48	密钥机房外门禁	1000800	1
5453	2020-05-19 18:30:55	密钥机房外门禁	10008001	1
5458	2020-05-19 18:30:58	密钥机房外门禁	10008001	1
5461	2020-05-19 18:31:03	密钥机房外门禁	10008001	1
5466	2020-05-19 18:31:07	密钥机房外门禁	10008001	1
5469	2020-05-19 18:31:10	密钥机房外门禁	10008001	1
5473	2020-05-19 18:31:13	密钥机房外门禁	10008001	1
5477	2020-05-19 18:31:16	密钥机房外门禁	10008001	1
5481	2020-05-19 18:31:19	密钥机房外门禁	10008001	1
5485	2020-05-19 18:31:23	密钥机房外门禁	10008001	1
5490	2020-05-19 18:34:44	密钥机房外门禁	10008001	1
5494	2020-05-19 18:34:46	密钥机房外门禁	10008001	1
5498	2020-05-19 18:34:49	密钥机房外门禁	10008001	1
5501	2020-05-19 18:34:52	密钥机房外门禁	10008001	1
5505	2020-05-19 18:34:55	密钥机房外门禁	10008001	1
5510	2020-05-19 18:34:57	密钥机房外门禁	10008001	1
5514	2020-05-19 18:35:00	密钥机房外门禁	10008001	1
5518	2020-05-19 18:35:21	密钥机房外门禁	1002331	1
5522	2020-05-19 18:35:23	密钥机房外门禁	1000800	1
5526	2020-05-19 18:36:53	密钥机房外门禁	1002331	1
5530	2020-05-19 18:36:55	密钥机房外门禁	1000800	1
5533	2020-05-19 18:40:13	密钥机房外门禁	1002331	1
5537	2020-05-19 18:40:16	密钥机房外门禁	1000800	1
5542	2020-05-19 19:33:37	密钥机房外门禁	1002331	1
5545	2020-05-19 19:33:40	密钥机房外门禁	1000800	1
5550	2020-05-19 19:34:07	密钥机房外门禁	1002331	1
5553	2020-05-19 19:34:10	密钥机房外门禁	1000800	1
5557	2020-05-19 19:35:51	密钥机房外门禁	1002331	1
5561	2020-05-19 19:35:53	密钥机房外门禁	1000800	1
5566	2020-05-19 19:38:01	密钥机房外门禁	1002331	1
5569	2020-05-19 19:38:03	密钥机房外门禁	1000800	1
5574	2020-05-19 19:39:30	密钥机房外门禁	1002331	1
5578	2020-05-19 19:39:33	密钥机房外门禁	1000800	1
5582	2020-05-19 19:42:26	密钥机房外门禁	1000800	1
5586	2020-05-19 19:42:29	密钥机房外门禁	1002331	1
5590	2020-05-19 19:47:51	密钥机房外门禁	1000800	1
5593	2020-05-19 19:47:54	密钥机房外门禁	0	1
5598	2020-05-19 19:47:57	密钥机房外门禁	1002331	1
5601	2020-05-19 19:52:30	密钥机房外门禁	1002331	1
5605	2020-05-19 19:52:32	密钥机房外门禁	1000800	1
5609	2020-05-19 19:52:42	密钥机房外门禁	1002331	1
5613	2020-05-19 19:52:47	密钥机房外门禁	1000800	1
5618	2020-05-19 19:53:00	密钥机房外门禁	1002331	1
5622	2020-05-19 19:53:04	密钥机房外门禁	1000800	1
5625	2020-05-19 20:00:09	密钥机房外门禁	1002331	1
5630	2020-05-19 20:00:12	密钥机房外门禁	1000800	1
5633	2020-05-19 20:02:00	密钥机房外门禁	1002331	1
5638	2020-05-19 20:02:02	密钥机房外门禁	1000800	1
5642	2020-05-19 20:05:29	密钥机房外门禁	1000800	1
5646	2020-05-19 20:05:34	密钥机房外门禁	1002331	1
5649	2020-05-19 20:07:44	密钥机房外门禁	1002331	1
5653	2020-05-19 20:07:46	密钥机房外门禁	0	1
5268	2020-11-30 15:15:09	信息机房外门禁	1003	1
5271	2020-11-30 15:15:11	信息机房外门禁	1009	1
5276	2020-11-30 15:27:42	信息机房外门禁	1003	1
5279	2020-11-30 15:27:45	信息机房外门禁	1009	1
5284	2020-11-30 19:07:22	信息机房外门禁	1003	1
5287	2020-11-30 19:07:24	信息机房外门禁	1009	1
5292	2020-11-30 20:03:05	信息机房外门禁	1008	1
5295	2020-11-30 20:03:07	信息机房外门禁	1001	1
5299	2020-12-01 08:45:23	信息机房外门禁	1008	1
5304	2020-12-01 08:45:25	信息机房外门禁	1001	1
5308	2020-12-01 23:36:17	信息机房外门禁	1008	1
5312	2020-12-01 23:36:19	信息机房外门禁	1001	1
5316	2020-12-03 10:33:24	信息机房外门禁	1008	1
5320	2020-12-03 10:33:26	信息机房外门禁	1001	1
5324	2020-12-04 09:32:45	信息机房外门禁	1008	1
5328	2020-12-04 09:32:47	信息机房外门禁	1001	1
5331	2020-12-04 10:07:12	信息机房外门禁	1008	1
5336	2020-12-04 10:07:14	信息机房外门禁	1001	1
5340	2020-12-04 11:41:50	信息机房外门禁	1008	1
5343	2020-12-04 11:41:52	信息机房外门禁	1001	1
5348	2020-12-09 11:46:37	信息机房外门禁	1008	1
5351	2020-12-09 11:46:40	信息机房外门禁	1001	1
5355	2020-12-15 22:15:34	信息机房外门禁	1008	1
5359	2020-12-15 22:15:36	信息机房外门禁	1001	1
5364	2020-12-16 09:09:21	信息机房外门禁	1008	1
5367	2020-12-16 09:09:24	信息机房外门禁	1001	1
5371	2020-12-16 14:11:21	信息机房外门禁	1008	1
5376	2020-12-16 14:11:23	信息机房外门禁	1001	1
5380	2020-12-16 17:15:59	信息机房外门禁	1008	1
5384	2020-12-16 17:16:01	信息机房外门禁	1001	1
5387	2020-12-16 19:39:45	信息机房外门禁	1008	1
5391	2020-12-16 19:39:47	信息机房外门禁	1001	1
5396	2020-12-17 09:12:01	信息机房外门禁	1008	1
5400	2020-12-17 09:12:03	信息机房外门禁	1001	1
5403	2020-12-19 08:35:48	信息机房外门禁	1003	1
5408	2020-12-19 08:35:50	信息机房外门禁	0	1
5411	2020-12-19 08:35:51	信息机房外门禁	1009	1
5416	2020-12-25 09:44:07	信息机房外门禁	1008	1
5419	2020-12-25 09:44:09	信息机房外门禁	1001	1
5423	2020-12-25 10:42:37	信息机房外门禁	1008	1
5428	2020-12-25 10:42:40	信息机房外门禁	1001	1
5432	2020-12-28 15:39:46	信息机房外门禁	1008	1
5436	2020-12-28 15:39:48	信息机房外门禁	1001	1
5440	2020-12-29 15:35:25	信息机房外门禁	0	1
5444	2020-12-29 15:35:27	信息机房外门禁	1001	1
5447	2020-12-29 15:35:29	信息机房外门禁	1008	1
5451	2020-12-29 20:43:48	信息机房外门禁	1008	1
5456	2020-12-29 20:43:50	信息机房外门禁	1001	1
5460	2020-12-31 13:40:03	信息机房外门禁	1008	1
5464	2020-12-31 13:40:06	信息机房外门禁	1001	1
5468	2021-01-04 14:04:45	信息机房外门禁	1008	1
5471	2021-01-04 14:04:47	信息机房外门禁	1001	1
5476	2021-01-05 16:16:45	信息机房外门禁	1008	1
5480	2021-01-05 16:16:47	信息机房外门禁	1001	1
5483	2021-01-08 08:41:57	信息机房外门禁	0	1
5487	2021-01-08 08:42:00	信息机房外门禁	1001	1
5492	2021-01-08 08:42:02	信息机房外门禁	1008	1
5495	2021-01-08 08:53:42	信息机房外门禁	1008	1
5499	2021-01-08 08:53:46	信息机房外门禁	1001	1
5504	2021-01-08 09:26:30	信息机房外门禁	1002	1
5508	2021-01-08 09:26:32	信息机房外门禁	1001	1
5512	2021-01-15 14:39:42	信息机房外门禁	1008	1
5516	2021-01-15 14:39:44	信息机房外门禁	1001	1
5520	2021-01-21 14:31:34	信息机房外门禁	1008	1
5524	2021-01-21 14:31:37	信息机房外门禁	1001	1
5527	2021-01-21 14:38:21	信息机房外门禁	1008	1
5532	2021-01-21 14:38:23	信息机房外门禁	1001	1
5535	2021-01-22 15:14:50	信息机房外门禁	1008	1
5539	2021-01-22 15:14:51	信息机房外门禁	1001	1
5544	2021-01-28 09:13:47	信息机房外门禁	1008	1
5547	2021-01-28 09:13:49	信息机房外门禁	1001	1
5552	2021-01-28 09:33:46	信息机房外门禁	1008	1
5555	2021-01-28 09:33:48	信息机房外门禁	1001	1
5559	2021-01-28 16:59:24	信息机房外门禁	1002	1
5564	2021-01-28 16:59:26	信息机房外门禁	1001	1
5567	2021-02-08 08:03:49	信息机房外门禁	1008	1
5571	2021-02-08 08:03:51	信息机房外门禁	1001	1
5575	2021-02-10 14:46:01	信息机房外门禁	1008	1
5579	2021-02-10 14:46:03	信息机房外门禁	1001	1
5583	2021-02-20 09:34:33	信息机房外门禁	1002	1
5587	2021-02-20 09:34:36	信息机房外门禁	1001	1
5592	2021-02-22 15:03:55	信息机房外门禁	1008	1
5595	2021-02-22 15:03:57	信息机房外门禁	1001	1
5600	2021-02-24 09:03:23	信息机房外门禁	1003	1
5604	2021-02-24 09:03:25	信息机房外门禁	0	1
5608	2021-02-24 09:03:27	信息机房外门禁	0	1
5611	2021-02-24 09:03:29	信息机房外门禁	1009	1
5615	2021-02-24 09:23:48	信息机房外门禁	0	1
5619	2021-02-24 09:23:51	信息机房外门禁	1001	1
5624	2021-02-24 09:23:54	信息机房外门禁	1008	1
5628	2021-02-26 09:15:06	信息机房外门禁	1003	1
5632	2021-02-26 09:15:08	信息机房外门禁	1009	1
5635	2021-03-04 19:08:00	信息机房外门禁	1008	1
5640	2021-03-04 19:08:02	信息机房外门禁	1001	1
5643	2021-03-05 09:26:33	信息机房外门禁	1008	1
5647	2021-03-05 09:26:35	信息机房外门禁	1001	1
5652	2021-03-08 11:57:04	信息机房外门禁	1008	1
5656	2021-03-08 11:57:06	信息机房外门禁	1001	1
5660	2021-03-09 17:01:03	信息机房外门禁	1003	1
5664	2021-03-09 17:01:05	信息机房外门禁	0	1
5667	2021-03-09 17:01:07	信息机房外门禁	0	1
5671	2021-03-09 17:01:10	信息机房外门禁	1009	1
5676	2021-03-09 17:37:43	信息机房外门禁	1008	1
5680	2021-03-09 17:37:45	信息机房外门禁	1001	1
5684	2021-03-11 09:22:44	信息机房外门禁	1008	1
5687	2021-03-11 09:22:47	信息机房外门禁	1001	1
5691	2021-03-11 14:01:31	信息机房外门禁	1008	1
5274	2022-01-08 16:22:22	CA机房外门禁	1005	1
5278	2022-01-08 16:22:24	CA机房外门禁	0	1
5282	2022-01-17 14:12:18	CA机房外门禁	1001	1
5285	2022-01-17 14:12:21	CA机房外门禁	1002	1
5289	2022-01-17 14:12:24	CA机房外门禁	1001	1
5294	2022-01-17 14:12:27	CA机房外门禁	1002	1
5298	2022-01-17 14:12:30	CA机房外门禁	1001	1
5302	2022-01-17 14:12:32	CA机房外门禁	1002	1
5305	2022-01-17 14:12:36	CA机房外门禁	1001	1
5310	2022-02-23 13:38:42	CA机房外门禁	1005	1
5313	2022-02-23 13:38:45	CA机房外门禁	1006	1
5317	2022-02-23 13:38:56	CA机房外门禁	1005	1
5321	2022-02-23 13:38:59	CA机房外门禁	1006	1
5325	2022-02-24 14:58:48	CA机房外门禁	1005	1
5330	2022-02-24 14:58:51	CA机房外门禁	1006	1
5334	2022-02-24 14:59:03	CA机房外门禁	1006	1
5338	2022-02-24 14:59:07	CA机房外门禁	1005	1
5341	2022-02-24 15:04:20	CA机房外门禁	1005	1
5345	2022-02-24 15:04:23	CA机房外门禁	1006	1
5349	2022-03-01 19:30:39	CA机房外门禁	1006	1
5353	2022-03-01 19:30:43	CA机房外门禁	1005	1
5358	2022-03-01 19:32:17	CA机房外门禁	1006	1
5361	2022-03-01 19:32:20	CA机房外门禁	1005	1
5366	2022-03-01 19:33:52	CA机房外门禁	1006	1
5370	2022-03-01 19:33:57	CA机房外门禁	1005	1
5373	2022-03-01 19:35:19	CA机房外门禁	1005	1
5378	2022-03-01 19:35:22	CA机房外门禁	1006	1
5382	2022-03-01 19:38:09	CA机房外门禁	1005	1
5386	2022-03-01 19:38:13	CA机房外门禁	1006	1
5390	2022-03-01 19:39:37	CA机房外门禁	1005	1
5394	2022-03-01 19:39:39	CA机房外门禁	1006	1
5398	2022-03-01 19:40:39	CA机房外门禁	1006	1
5402	2022-03-01 19:40:44	CA机房外门禁	0	1
5406	2022-03-01 19:40:49	CA机房外门禁	1006	1
5410	2022-03-01 19:40:52	CA机房外门禁	0	1
5413	2022-03-01 19:40:59	CA机房外门禁	1006	1
5418	2022-03-01 19:41:04	CA机房外门禁	0	1
5422	2022-03-01 19:41:11	CA机房外门禁	1006	1
5426	2022-03-01 19:41:16	CA机房外门禁	0	1
5430	2022-03-01 19:41:20	CA机房外门禁	1006	1
5433	2022-03-01 19:41:26	CA机房外门禁	0	1
5438	2022-03-01 19:41:31	CA机房外门禁	1006	1
5441	2022-03-01 19:41:35	CA机房外门禁	0	1
5446	2022-03-01 19:42:07	CA机房外门禁	1006	1
5450	2022-03-01 19:42:10	CA机房外门禁	1005	1
5454	2022-03-01 19:42:53	CA机房外门禁	1006	1
5457	2022-03-01 19:42:57	CA机房外门禁	1005	1
5462	2022-03-01 19:44:03	CA机房外门禁	1006	1
5465	2022-03-01 19:44:05	CA机房外门禁	1005	1
5470	2022-03-01 19:47:07	CA机房外门禁	1006	1
5474	2022-03-01 19:47:09	CA机房外门禁	1005	1
5478	2022-03-01 19:49:53	CA机房外门禁	1006	1
5482	2022-03-01 19:50:00	CA机房外门禁	1005	1
5486	2022-03-01 19:51:34	CA机房外门禁	1006	1
5489	2022-03-01 19:51:41	CA机房外门禁	1005	1
5493	2022-03-01 19:53:37	CA机房外门禁	1006	1
5497	2022-03-01 19:53:40	CA机房外门禁	1005	1
5502	2022-03-01 19:54:47	CA机房外门禁	1006	1
5506	2022-03-01 19:54:52	CA机房外门禁	0	1
5509	2022-03-01 19:54:57	CA机房外门禁	1006	1
5513	2022-03-01 19:55:06	CA机房外门禁	0	1
5517	2022-03-01 19:55:10	CA机房外门禁	1006	1
5521	2022-03-01 19:55:16	CA机房外门禁	0	1
5525	2022-03-01 19:55:20	CA机房外门禁	1006	1
5529	2022-03-01 19:55:28	CA机房外门禁	0	1
5534	2022-03-01 19:55:32	CA机房外门禁	1006	1
5538	2022-03-01 19:55:36	CA机房外门禁	0	1
5541	2022-03-01 19:55:43	CA机房外门禁	0	1
5546	2022-03-01 19:55:46	CA机房外门禁	1006	1
5549	2022-03-01 19:55:55	CA机房外门禁	0	1
5554	2022-03-01 19:56:00	CA机房外门禁	1006	1
5558	2022-03-01 19:56:10	CA机房外门禁	1005	1
5562	2022-03-01 19:56:16	CA机房外门禁	1006	1
5565	2022-03-01 19:56:55	CA机房外门禁	1006	1
5570	2022-03-01 19:56:57	CA机房外门禁	1005	1
5573	2022-03-01 19:57:48	CA机房外门禁	1006	1
5577	2022-03-01 19:57:54	CA机房外门禁	1005	1
5581	2022-03-01 19:59:18	CA机房外门禁	1006	1
5585	2022-03-01 19:59:20	CA机房外门禁	1005	1
5589	2022-03-01 20:01:23	CA机房外门禁	1006	1
5594	2022-03-01 20:01:26	CA机房外门禁	1005	1
5597	2022-03-01 20:02:35	CA机房外门禁	1006	1
5602	2022-03-01 20:02:38	CA机房外门禁	1005	1
5606	2022-03-01 20:04:53	CA机房外门禁	1006	1
5610	2022-03-01 20:04:57	CA机房外门禁	1005	1
5614	2022-03-01 20:06:52	CA机房外门禁	0	1
5617	2022-03-01 20:06:55	CA机房外门禁	1005	1
5621	2022-03-01 20:07:00	CA机房外门禁	0	1
5626	2022-03-01 20:07:03	CA机房外门禁	1005	1
5629	2022-03-01 20:07:08	CA机房外门禁	0	1
5634	2022-03-01 20:07:11	CA机房外门禁	1005	1
5637	2022-03-01 20:07:16	CA机房外门禁	0	1
5641	2022-03-01 20:07:19	CA机房外门禁	1005	1
5645	2022-03-01 20:07:24	CA机房外门禁	0	1
5650	2022-03-01 20:07:27	CA机房外门禁	1005	1
5654	2022-03-01 20:07:37	CA机房外门禁	0	1
5657	2022-03-01 20:07:41	CA机房外门禁	1005	1
5662	2022-03-01 20:07:50	CA机房外门禁	1005	1
5665	2022-03-01 20:07:53	CA机房外门禁	0	1
5670	2022-03-05 12:56:26	CA机房外门禁	1005	1
5674	2022-03-05 12:56:31	CA机房外门禁	1006	1
5677	2022-03-05 13:22:55	CA机房外门禁	1005	1
5681	2022-03-05 13:22:59	CA机房外门禁	1006	1
5686	2022-03-05 17:00:57	CA机房外门禁	1005	1
5689	2022-03-05 17:00:59	CA机房外门禁	1006	1
5694	2022-03-05 17:48:58	CA机房外门禁	1005	1
5697	2022-03-05 17:49:01	CA机房外门禁	1006	1
5701	2022-03-07 16:26:51	CA机房外门禁	1005	1
5706	2022-03-07 16:26:53	CA机房外门禁	1006	1
5658	2020-05-19 20:07:48	密钥机房外门禁	1000800	1
5661	2020-05-19 20:33:49	密钥机房外门禁	1002331	1
5666	2020-05-19 20:33:51	密钥机房外门禁	1000800	1
5669	2020-05-19 20:36:19	密钥机房外门禁	1002331	1
5673	2020-05-19 20:36:21	密钥机房外门禁	1000800	1
5678	2020-05-19 20:37:52	密钥机房外门禁	1000800	1
5682	2020-05-19 20:37:57	密钥机房外门禁	1002331	1
5685	2020-05-19 20:41:01	密钥机房外门禁	10008001	1
5690	2020-05-19 20:41:04	密钥机房外门禁	10008001	1
5693	2020-05-19 20:41:06	密钥机房外门禁	10008001	1
5698	2020-05-19 20:41:08	密钥机房外门禁	10008001	1
5702	2020-05-19 20:41:11	密钥机房外门禁	10008001	1
5705	2020-05-19 20:41:13	密钥机房外门禁	10008001	1
5709	2020-05-19 20:41:15	密钥机房外门禁	10008001	1
5714	2020-05-19 20:43:04	密钥机房外门禁	1002331	1
5718	2020-05-19 20:43:07	密钥机房外门禁	1000800	1
5722	2020-05-19 20:45:42	密钥机房外门禁	1002331	1
5725	2020-05-19 20:45:44	密钥机房外门禁	1000800	1
5730	2020-05-19 20:47:11	密钥机房外门禁	1002331	1
5733	2020-05-19 20:47:14	密钥机房外门禁	1000800	1
5737	2020-05-19 20:49:32	密钥机房外门禁	1002331	1
5741	2020-05-19 20:49:36	密钥机房外门禁	1000800	1
5745	2020-05-20 09:04:05	密钥机房外门禁	1002331	1
5750	2020-05-20 09:04:08	密钥机房外门禁	1000800	1
5753	2020-05-20 09:05:00	密钥机房外门禁	1002331	1
5758	2020-05-20 09:05:03	密钥机房外门禁	1000800	1
5762	2020-05-20 09:05:15	密钥机房外门禁	1002331	1
5765	2020-05-20 09:05:18	密钥机房外门禁	1000800	1
5770	2020-05-20 09:06:07	密钥机房外门禁	1002331	1
5773	2020-05-20 09:06:10	密钥机房外门禁	1000800	1
5778	2020-05-20 09:08:00	密钥机房外门禁	1002331	1
5782	2020-05-20 09:08:03	密钥机房外门禁	1000800	1
5786	2020-05-20 09:10:29	密钥机房外门禁	1002331	1
5789	2020-05-20 09:10:33	密钥机房外门禁	1000800	1
5794	2020-05-20 09:10:44	密钥机房外门禁	1002331	1
5798	2020-05-20 09:16:16	密钥机房外门禁	1002331	1
5801	2020-05-20 09:16:18	密钥机房外门禁	1000800	1
5806	2020-05-20 09:18:54	密钥机房外门禁	1002331	1
5809	2020-05-20 09:18:56	密钥机房外门禁	1000800	1
5813	2020-05-20 09:20:56	密钥机房外门禁	1002331	1
5818	2020-05-20 09:22:06	密钥机房外门禁	1002331	1
5821	2020-05-20 09:22:09	密钥机房外门禁	1000800	1
5826	2020-05-20 09:24:45	密钥机房外门禁	1002331	1
5829	2020-05-20 09:24:48	密钥机房外门禁	1000800	1
5834	2020-05-20 09:27:46	密钥机房外门禁	0	1
5837	2020-05-20 09:27:53	密钥机房外门禁	1002331	1
5842	2020-05-20 09:27:55	密钥机房外门禁	1000800	1
5846	2020-05-20 09:42:45	密钥机房外门禁	1002331	1
5849	2020-05-20 09:42:48	密钥机房外门禁	1000800	1
5853	2020-05-20 17:35:40	密钥机房外门禁	1002331	1
5857	2020-05-20 17:35:43	密钥机房外门禁	1000800	1
5861	2020-05-20 17:38:19	密钥机房外门禁	1002331	1
5864	2020-05-20 17:38:23	密钥机房外门禁	1000800	1
5867	2020-05-20 17:39:38	密钥机房外门禁	1002331	1
5872	2020-05-20 17:39:40	密钥机房外门禁	1000800	1
5874	2020-05-20 17:40:48	密钥机房外门禁	1002331	1
5879	2020-05-20 17:40:51	密钥机房外门禁	1000800	1
5882	2020-05-20 17:43:53	密钥机房外门禁	1002331	1
5887	2020-05-20 17:43:56	密钥机房外门禁	1000800	1
5891	2020-05-20 17:45:22	密钥机房外门禁	1002331	1
5895	2020-05-20 17:45:27	密钥机房外门禁	1000800	1
5899	2020-05-26 09:49:13	密钥机房外门禁	0	1
5904	2020-05-26 09:53:27	密钥机房外门禁	2	1
5908	2020-06-02 10:18:00	密钥机房外门禁	10023311	1
5910	2020-06-02 10:18:03	密钥机房外门禁	1000800	1
5915	2020-06-02 10:19:13	密钥机房外门禁	10023311	1
5918	2020-06-02 10:19:15	密钥机房外门禁	1000800	1
5922	2020-06-02 10:39:18	密钥机房外门禁	10023311	1
5926	2020-06-02 10:39:23	密钥机房外门禁	0	1
5931	2020-06-02 10:39:26	密钥机房外门禁	0	1
5934	2020-06-02 10:39:28	密钥机房外门禁	0	1
5939	2020-06-02 10:39:36	密钥机房外门禁	0	1
5943	2020-06-02 10:39:39	密钥机房外门禁	0	1
5947	2020-06-02 10:39:46	密钥机房外门禁	0	1
5951	2020-06-02 10:39:50	密钥机房外门禁	1002331	1
5955	2020-06-02 10:40:08	密钥机房外门禁	1000800	1
5959	2020-06-02 11:04:20	密钥机房外门禁	1002331	1
5963	2020-06-02 11:04:23	密钥机房外门禁	1000800	1
5968	2020-06-02 11:09:02	密钥机房外门禁	1002331	1
5970	2020-06-02 11:09:05	密钥机房外门禁	1000800	1
5975	2020-06-02 11:16:45	密钥机房外门禁	1002331	1
5979	2020-06-02 11:16:47	密钥机房外门禁	1000800	1
5983	2020-06-02 11:19:59	密钥机房外门禁	1002331	1
5988	2020-06-02 11:20:01	密钥机房外门禁	1000800	1
5991	2020-06-02 11:22:07	密钥机房外门禁	1000800	1
5996	2020-06-02 11:22:11	密钥机房外门禁	1002331	1
5999	2020-06-02 11:24:27	密钥机房外门禁	1000800	1
6003	2020-06-02 11:24:32	密钥机房外门禁	1002331	1
6007	2020-06-04 13:47:54	密钥机房外门禁	1002331	1
6009	2020-06-04 13:47:57	密钥机房外门禁	1000800	1
6013	2020-06-04 14:04:22	密钥机房外门禁	1000800	1
6015	2020-06-04 14:04:24	密钥机房外门禁	1002331	1
6019	2020-06-04 14:45:26	密钥机房外门禁	1002331	1
6021	2020-06-04 14:45:31	密钥机房外门禁	1000800	1
6025	2021-09-26 21:12:27	密钥机房外门禁	1000800	1
6027	2021-09-26 21:12:30	密钥机房外门禁	1000333	1
6030	2021-09-26 21:14:51	密钥机房外门禁	1000333	1
6034	2021-09-26 21:14:55	密钥机房外门禁	1000800	1
5695	2021-03-11 14:01:33	信息机房外门禁	1001	1
5700	2021-03-11 14:07:35	信息机房外门禁	1008	1
5703	2021-03-11 14:07:37	信息机房外门禁	1001	1
5708	2021-03-17 17:15:55	信息机房外门禁	1008	1
5711	2021-03-17 17:15:57	信息机房外门禁	1001	1
5715	2021-03-22 14:58:36	信息机房外门禁	1008	1
5719	2021-03-22 14:58:41	信息机房外门禁	1001	1
5724	2021-03-22 15:19:33	信息机房外门禁	1001	1
5728	2021-03-22 15:19:35	信息机房外门禁	1008	1
5731	2021-03-23 08:24:51	信息机房外门禁	1008	1
5735	2021-03-23 08:24:56	信息机房外门禁	1001	1
5740	2021-03-26 03:00:16	信息机房外门禁	1008	1
5743	2021-03-26 03:00:18	信息机房外门禁	1001	1
5747	2021-03-26 08:19:07	信息机房外门禁	1008	1
5752	2021-03-26 08:19:09	信息机房外门禁	1001	1
5756	2021-03-26 08:57:28	信息机房外门禁	1008	1
5760	2021-03-26 08:57:31	信息机房外门禁	1001	1
5764	2021-03-26 09:37:05	信息机房外门禁	1008	1
5767	2021-03-26 09:37:07	信息机房外门禁	1001	1
5771	2021-03-26 12:41:44	信息机房外门禁	1008	1
5775	2021-03-26 12:41:46	信息机房外门禁	1001	1
5780	2021-03-29 08:17:29	信息机房外门禁	1008	1
5783	2021-03-29 08:17:31	信息机房外门禁	1001	1
5788	2021-03-29 16:44:15	信息机房外门禁	1008	1
5792	2021-03-29 16:44:17	信息机房外门禁	1001	1
5796	2021-03-29 17:12:10	信息机房外门禁	1008	1
5799	2021-03-29 17:12:12	信息机房外门禁	1001	1
5804	2021-03-29 17:36:51	信息机房外门禁	1008	1
5807	2021-03-29 17:36:53	信息机房外门禁	1001	1
5812	2021-03-30 09:01:32	信息机房外门禁	1008	1
5816	2021-03-30 09:01:34	信息机房外门禁	1001	1
5820	2021-04-06 13:39:06	信息机房外门禁	1008	1
5823	2021-04-06 13:39:08	信息机房外门禁	1001	1
5828	2021-04-07 16:15:06	信息机房外门禁	1008	1
5831	2021-04-07 16:15:09	信息机房外门禁	1001	1
5836	2021-04-21 10:00:07	信息机房外门禁	1008	1
5839	2021-04-21 10:00:10	信息机房外门禁	1001	1
5844	2021-05-20 09:59:37	信息机房外门禁	1008	1
5848	2021-05-20 09:59:39	信息机房外门禁	1001	1
5851	2021-05-21 10:52:51	信息机房外门禁	1008	1
5856	2021-05-21 10:52:53	信息机房外门禁	1001	1
5859	2021-05-23 07:35:31	信息机房外门禁	1008	1
5862	2021-05-23 07:35:33	信息机房外门禁	1001	1
5865	2021-05-23 15:04:36	信息机房外门禁	1008	1
5869	2021-05-23 15:04:39	信息机房外门禁	1001	1
5873	2021-05-23 15:25:29	信息机房外门禁	1008	1
5877	2021-05-23 15:25:32	信息机房外门禁	1001	1
5881	2021-05-23 17:02:38	信息机房外门禁	1008	1
5885	2021-05-23 17:02:40	信息机房外门禁	1001	1
5889	2021-05-24 08:36:58	信息机房外门禁	1008	1
5893	2021-05-24 08:37:00	信息机房外门禁	1001	1
5897	2021-05-28 14:16:04	信息机房外门禁	1008	1
5901	2021-05-28 14:16:06	信息机房外门禁	1001	1
5905	2021-05-30 09:56:15	信息机房外门禁	1008	1
5909	2021-05-30 09:56:17	信息机房外门禁	1001	1
5913	2021-05-30 17:01:28	信息机房外门禁	1008	1
5917	2021-05-30 17:01:30	信息机房外门禁	1001	1
5921	2021-06-11 16:32:45	信息机房外门禁	1003	1
5925	2021-06-11 16:32:46	信息机房外门禁	1009	1
5929	2021-06-16 14:17:39	信息机房外门禁	1008	1
5933	2021-06-16 14:17:41	信息机房外门禁	1001	1
5937	2021-06-17 10:15:58	信息机房外门禁	1008	1
5941	2021-06-17 10:16:00	信息机房外门禁	1001	1
5945	2021-06-23 11:52:04	信息机房外门禁	1008	1
5949	2021-06-23 11:52:06	信息机房外门禁	1001	1
5953	2021-06-23 13:49:34	信息机房外门禁	1008	1
5957	2021-06-23 13:49:37	信息机房外门禁	1001	1
5961	2021-06-28 11:09:41	信息机房外门禁	1008	1
5965	2021-06-28 11:09:43	信息机房外门禁	1001	1
5969	2021-06-28 11:09:52	信息机房外门禁	1008	1
5973	2021-06-28 11:09:58	信息机房外门禁	1001	1
5977	2021-06-28 15:04:15	信息机房外门禁	1008	1
5981	2021-06-28 15:04:17	信息机房外门禁	1001	1
5985	2021-06-28 15:22:11	信息机房外门禁	1008	1
5989	2021-06-28 15:22:14	信息机房外门禁	1001	1
5993	2021-06-29 08:01:58	信息机房外门禁	1008	1
5997	2021-06-29 08:02:00	信息机房外门禁	1001	1
6001	2021-07-02 10:27:13	信息机房外门禁	1008	1
6005	2021-07-02 10:27:15	信息机房外门禁	1001	1
6008	2021-07-09 20:52:54	信息机房外门禁	1008	1
6011	2021-07-09 20:52:57	信息机房外门禁	1001	1
6014	2021-07-19 16:24:44	信息机房外门禁	1008	1
6017	2021-07-19 16:24:46	信息机房外门禁	1001	1
6020	2021-07-22 11:00:29	信息机房外门禁	1003	1
6023	2021-07-22 11:00:31	信息机房外门禁	1009	1
6026	2021-09-06 20:42:14	信息机房外门禁	1008	1
6029	2021-09-06 20:42:16	信息机房外门禁	1001	1
6032	2021-09-16 20:32:12	信息机房外门禁	1008	1
6035	2021-09-16 20:32:14	信息机房外门禁	1001	1
6038	2021-09-20 08:36:07	信息机房外门禁	1008	1
6041	2021-09-20 08:36:09	信息机房外门禁	1001	1
6044	2021-09-22 11:09:09	信息机房外门禁	1008	1
6047	2021-09-22 11:09:10	信息机房外门禁	1001	1
6050	2021-09-22 15:58:18	信息机房外门禁	1008	1
6053	2021-09-22 15:58:20	信息机房外门禁	1001	1
6056	2021-09-23 10:18:19	信息机房外门禁	1008	1
6059	2021-09-23 10:18:21	信息机房外门禁	1001	1
6062	2021-09-24 09:04:24	信息机房外门禁	1008	1
6065	2021-09-24 09:04:26	信息机房外门禁	1001	1
6068	2021-09-26 14:58:39	信息机房外门禁	1002	1
6071	2021-09-26 14:58:41	信息机房外门禁	1001	1
6074	2021-09-26 15:30:33	信息机房外门禁	1002	1
6077	2021-09-26 15:30:35	信息机房外门禁	1001	1
6080	2021-09-26 21:26:11	信息机房外门禁	1008	1
6083	2021-09-26 21:26:15	信息机房外门禁	0	1
6086	2021-09-26 21:26:17	信息机房外门禁	1002	1
6089	2021-09-26 21:26:24	信息机房外门禁	1002	1
5696	2022-11-11 17:00:13	信息机房内门禁	1001	1
5699	2022-11-11 17:00:17	信息机房内门禁	1006	1
5704	2022-11-11 17:07:41	信息机房内门禁	1006	1
5707	2022-11-11 17:07:46	信息机房内门禁	1001	1
5712	2022-11-15 16:13:09	信息机房内门禁	1001	1
5716	2022-11-15 16:13:13	信息机房内门禁	1006	1
5720	2022-11-18 15:44:55	信息机房内门禁	1001	1
5723	2022-11-18 15:44:58	信息机房内门禁	1006	1
5727	2022-11-23 14:59:09	信息机房内门禁	1006	1
5732	2022-11-23 14:59:11	信息机房内门禁	1001	1
5736	2022-11-25 15:34:14	信息机房内门禁	1001	1
5739	2022-11-25 15:34:18	信息机房内门禁	0	1
5744	2022-11-25 15:34:20	信息机房内门禁	1006	1
5748	2022-11-25 15:35:01	信息机房内门禁	1001	1
5751	2022-11-25 15:35:04	信息机房内门禁	0	1
5755	2022-11-25 15:35:07	信息机房内门禁	1006	1
5759	2022-11-29 13:44:05	信息机房内门禁	1006	1
5763	2022-11-29 13:44:06	信息机房内门禁	1006	1
5768	2022-11-29 13:44:22	信息机房内门禁	1001	1
5772	2022-11-30 15:44:16	信息机房内门禁	1001	1
5776	2022-11-30 15:44:24	信息机房内门禁	0	1
5779	2022-11-30 15:44:27	信息机房内门禁	1006	1
5784	2022-12-04 16:40:10	信息机房内门禁	1008	1
5787	2022-12-04 16:40:12	信息机房内门禁	1001	1
5791	2022-12-06 10:50:59	信息机房内门禁	1006	1
5795	2022-12-06 10:52:29	信息机房内门禁	1001	1
5800	2022-12-06 10:52:35	信息机房内门禁	1006	1
5803	2022-12-07 15:51:55	信息机房内门禁	1008	1
5808	2022-12-07 15:51:58	信息机房内门禁	1001	1
5811	2022-12-09 16:13:07	信息机房内门禁	1008	1
5815	2022-12-09 16:13:11	信息机房内门禁	1001	1
5819	2022-12-09 16:16:12	信息机房内门禁	1008	1
5824	2022-12-09 16:16:14	信息机房内门禁	1001	1
5827	2022-12-12 16:39:23	信息机房内门禁	1001	1
5832	2022-12-12 16:39:27	信息机房内门禁	1006	1
5835	2022-12-16 16:06:33	信息机房内门禁	1001	1
5840	2022-12-16 16:06:38	信息机房内门禁	1006	1
5843	2022-12-26 15:09:37	信息机房内门禁	1006	1
5847	2022-12-26 15:09:47	信息机房内门禁	1001	1
5852	2022-12-29 15:29:50	信息机房内门禁	1001	1
5855	2022-12-29 15:29:53	信息机房内门禁	1006	1
5868	2022-12-29 15:30:04	信息机房内门禁	1001	1
5871	2022-12-29 15:30:07	信息机房内门禁	1006	1
5876	2023-01-09 12:10:03	信息机房内门禁	0	1
5878	2023-01-09 12:10:08	信息机房内门禁	0	1
5884	2023-01-09 12:10:15	信息机房内门禁	11	1
5886	2023-01-09 12:10:20	信息机房内门禁	12	1
5890	2023-01-09 12:11:30	信息机房内门禁	11	1
5894	2023-01-09 12:11:34	信息机房内门禁	12	1
5900	2023-01-09 16:22:36	信息机房内门禁	11	1
5903	2023-01-09 16:22:38	信息机房内门禁	0	1
5906	2023-01-09 16:22:41	信息机房内门禁	0	1
5911	2023-01-09 16:22:43	信息机房内门禁	0	1
5916	2023-01-09 16:22:44	信息机房内门禁	0	1
5920	2023-01-09 16:22:45	信息机房内门禁	0	1
5923	2023-01-09 16:22:48	信息机房内门禁	0	1
5927	2023-01-09 16:22:49	信息机房内门禁	0	1
5930	2023-01-09 16:22:54	信息机房内门禁	1	1
5936	2023-01-09 16:51:40	信息机房内门禁	1001	1
5938	2023-01-09 16:51:45	信息机房内门禁	1002	1
5944	2023-01-10 14:16:48	信息机房内门禁	1002	1
5946	2023-01-10 14:16:50	信息机房内门禁	1002	1
5952	2023-01-10 14:16:54	信息机房内门禁	1001	1
5956	2023-01-11 14:25:29	信息机房内门禁	1001	1
5960	2023-01-11 14:25:32	信息机房内门禁	1002	1
5964	2023-01-13 09:40:48	信息机房内门禁	1002	1
5966	2023-01-13 09:40:52	信息机房内门禁	1001	1
5972	2023-01-31 13:53:21	信息机房内门禁	1002	1
5974	2023-01-31 13:53:24	信息机房内门禁	1001	1
5980	2023-02-02 11:28:17	信息机房内门禁	1001	1
5982	2023-02-02 11:28:20	信息机房内门禁	1002	1
5987	2023-02-06 11:23:35	信息机房内门禁	1002	1
5992	2023-02-06 11:23:49	信息机房内门禁	1001	1
5995	2023-02-06 15:09:12	信息机房内门禁	1002	1
6000	2023-02-06 15:09:13	信息机房内门禁	1002	1
6004	2023-02-06 15:09:15	信息机房内门禁	1001	1
7613	2023-01-09 17:10:33	信息机房外门禁	0	1
7614	2023-01-09 17:10:38	信息机房外门禁	0	1
7615	2023-01-09 17:10:39	信息机房外门禁	0	1
7616	2023-01-09 17:10:42	信息机房外门禁	0	1
7617	2023-01-09 17:10:44	信息机房外门禁	0	1
7618	2023-01-09 17:10:46	信息机房外门禁	0	1
7619	2023-01-09 17:10:48	信息机房外门禁	0	1
7620	2023-01-09 17:10:50	信息机房外门禁	0	1
7621	2023-01-10 14:09:11	信息机房外门禁	11	1
7622	2023-01-10 14:09:12	信息机房外门禁	11	1
7623	2023-01-10 14:09:14	信息机房外门禁	12	1
7624	2023-01-10 14:09:29	信息机房外门禁	11	1
7625	2023-01-10 14:09:31	信息机房外门禁	12	1
7626	2023-01-10 14:14:21	信息机房外门禁	1001	1
7627	2023-01-10 14:14:23	信息机房外门禁	1002	1
7628	2023-01-11 14:18:16	信息机房外门禁	1001	1
7629	2023-01-11 14:18:20	信息机房外门禁	1002	1
7630	2023-01-11 14:18:25	信息机房外门禁	1008	1
7631	2023-01-13 09:35:52	信息机房外门禁	1001	1
7632	2023-01-13 09:35:55	信息机房外门禁	1002	1
7633	2023-01-31 13:45:50	信息机房外门禁	1002	1
7634	2023-01-31 13:45:56	信息机房外门禁	1001	1
7635	2023-02-02 10:48:19	信息机房外门禁	1002	1
7636	2023-02-02 10:48:22	信息机房外门禁	1001	1
7637	2023-02-06 10:24:05	信息机房外门禁	1001	1
7638	2023-02-06 10:24:08	信息机房外门禁	1002	1
7639	2023-02-06 15:06:19	信息机房外门禁	1002	1
7640	2023-02-06 15:06:21	信息机房外门禁	1001	1
7642	2023-02-08 15:43:22	信息机房外门禁	1002	1
7643	2023-02-08 15:43:24	信息机房外门禁	1001	1
7648	2023-02-10 15:28:01	信息机房内门禁	1002	1
5710	2022-03-09 09:00:00	CA机房外门禁	1005	1
5713	2022-03-09 09:00:03	CA机房外门禁	1006	1
5717	2022-03-09 09:01:40	CA机房外门禁	1005	1
5721	2022-03-09 09:01:42	CA机房外门禁	1006	1
5726	2022-03-09 09:03:11	CA机房外门禁	1006	1
5729	2022-03-09 09:03:13	CA机房外门禁	1005	1
5734	2022-03-09 09:04:08	CA机房外门禁	1006	1
5738	2022-03-09 09:04:11	CA机房外门禁	1005	1
5742	2022-03-09 09:05:23	CA机房外门禁	1006	1
5746	2022-03-09 09:05:27	CA机房外门禁	1005	1
5749	2022-03-09 09:07:11	CA机房外门禁	1005	1
5754	2022-03-09 09:07:14	CA机房外门禁	1006	1
5757	2022-03-09 09:08:56	CA机房外门禁	1006	1
5761	2022-03-09 09:09:00	CA机房外门禁	1005	1
5766	2022-03-09 09:11:26	CA机房外门禁	1006	1
5769	2022-03-09 09:11:29	CA机房外门禁	1005	1
5774	2022-03-09 09:15:34	CA机房外门禁	1006	1
5777	2022-03-09 09:15:38	CA机房外门禁	1005	1
5781	2022-03-09 09:19:24	CA机房外门禁	1005	1
5785	2022-03-09 09:19:27	CA机房外门禁	1006	1
5790	2022-03-09 09:23:36	CA机房外门禁	1006	1
5793	2022-03-09 09:23:39	CA机房外门禁	1005	1
5797	2022-03-09 09:27:48	CA机房外门禁	1005	1
5802	2022-03-09 09:27:50	CA机房外门禁	1006	1
5805	2022-03-09 09:31:47	CA机房外门禁	1006	1
5810	2022-03-09 09:31:49	CA机房外门禁	1005	1
5814	2022-03-09 09:37:12	CA机房外门禁	1006	1
5817	2022-03-09 09:37:17	CA机房外门禁	1005	1
5822	2022-03-09 09:40:16	CA机房外门禁	1005	1
5825	2022-03-09 09:40:20	CA机房外门禁	1006	1
5830	2022-03-09 09:43:12	CA机房外门禁	1006	1
5833	2022-03-09 09:43:16	CA机房外门禁	1005	1
5838	2022-03-09 09:45:15	CA机房外门禁	1005	1
5841	2022-03-09 09:45:18	CA机房外门禁	1006	1
5845	2022-03-09 09:47:20	CA机房外门禁	1005	1
5850	2022-03-09 09:47:23	CA机房外门禁	1006	1
5854	2022-03-09 09:50:01	CA机房外门禁	0	1
5858	2022-03-09 09:50:03	CA机房外门禁	1006	1
5860	2022-03-09 09:50:12	CA机房外门禁	0	1
5863	2022-03-09 09:50:19	CA机房外门禁	1006	1
5866	2022-03-09 09:50:23	CA机房外门禁	0	1
5870	2022-03-09 09:50:29	CA机房外门禁	1006	1
5875	2022-03-09 09:50:41	CA机房外门禁	1006	1
5880	2022-03-09 09:50:45	CA机房外门禁	0	1
5883	2022-03-09 09:50:52	CA机房外门禁	1006	1
5888	2022-03-09 09:50:54	CA机房外门禁	0	1
5892	2022-03-09 09:50:59	CA机房外门禁	1006	1
5896	2022-03-09 09:51:02	CA机房外门禁	0	1
5898	2022-03-09 09:51:14	CA机房外门禁	0	1
5902	2022-03-09 09:51:51	CA机房外门禁	1006	1
5907	2022-03-09 09:51:54	CA机房外门禁	0	1
5912	2022-03-09 09:52:06	CA机房外门禁	1006	1
5914	2022-03-09 09:52:09	CA机房外门禁	0	1
5919	2022-03-09 09:52:19	CA机房外门禁	1006	1
5924	2022-03-09 09:52:21	CA机房外门禁	0	1
5928	2022-03-09 09:52:33	CA机房外门禁	1006	1
5932	2022-03-09 09:52:37	CA机房外门禁	0	1
5935	2022-03-09 09:52:46	CA机房外门禁	1006	1
5940	2022-03-09 09:52:49	CA机房外门禁	0	1
5942	2022-03-09 09:52:57	CA机房外门禁	1006	1
5948	2022-03-09 09:52:59	CA机房外门禁	0	1
5950	2022-03-09 09:53:10	CA机房外门禁	0	1
5954	2022-03-09 09:53:12	CA机房外门禁	1006	1
5958	2022-03-09 09:53:25	CA机房外门禁	0	1
5962	2022-03-09 09:53:28	CA机房外门禁	1006	1
5967	2022-03-09 09:53:38	CA机房外门禁	0	1
5971	2022-03-09 09:53:41	CA机房外门禁	1006	1
5976	2022-03-09 09:53:51	CA机房外门禁	1006	1
5978	2022-03-09 09:53:53	CA机房外门禁	0	1
5984	2022-03-09 09:54:04	CA机房外门禁	0	1
5986	2022-03-09 09:54:05	CA机房外门禁	1006	1
5990	2022-03-09 09:54:16	CA机房外门禁	0	1
5994	2022-03-09 09:54:18	CA机房外门禁	1006	1
5998	2022-03-12 16:11:45	CA机房外门禁	0	1
6002	2022-03-24 11:17:08	CA机房外门禁	1000404	1
6006	2022-03-24 11:17:12	CA机房外门禁	10002411	1
6010	2022-03-24 16:46:28	CA机房外门禁	1000404	1
6012	2022-03-24 16:46:32	CA机房外门禁	10002411	1
6016	2022-03-24 16:46:45	CA机房外门禁	10002411	1
6018	2022-03-24 16:46:51	CA机房外门禁	10004041	1
6022	2022-03-24 16:47:05	CA机房外门禁	1000241	1
6024	2022-03-24 16:52:38	CA机房外门禁	1000404	1
6028	2022-03-24 16:52:43	CA机房外门禁	10002411	1
6031	2022-03-24 16:52:49	CA机房外门禁	10004041	1
6033	2022-03-24 16:52:54	CA机房外门禁	1000241	1
6037	2022-03-24 17:07:50	CA机房外门禁	10002411	1
6040	2022-03-24 17:07:54	CA机房外门禁	1000404	1
6043	2022-03-24 17:08:03	CA机房外门禁	1000241	1
6045	2022-03-24 17:08:06	CA机房外门禁	10004041	1
6048	2022-03-24 17:09:49	CA机房外门禁	1000241	1
6051	2022-03-24 17:10:01	CA机房外门禁	10004041	1
6054	2022-03-24 17:10:08	CA机房外门禁	10002411	1
6057	2022-03-24 17:10:14	CA机房外门禁	1000241	1
6061	2022-03-24 17:10:19	CA机房外门禁	1000404	1
6063	2022-03-24 17:12:02	CA机房外门禁	1000404	1
6067	2022-03-24 17:12:05	CA机房外门禁	1000241	1
6069	2022-03-24 18:05:28	CA机房外门禁	1000241	1
6073	2022-03-24 18:05:32	CA机房外门禁	1000404	1
6075	2022-03-24 18:15:02	CA机房外门禁	1000241	1
6078	2022-03-24 18:15:05	CA机房外门禁	1000404	1
6082	2022-03-25 14:20:57	CA机房外门禁	1000241	1
6084	2022-03-25 14:20:59	CA机房外门禁	0	1
6088	2022-03-25 14:21:03	CA机房外门禁	1000404	1
6091	2022-03-25 14:23:17	CA机房外门禁	1000241	1
6094	2022-03-25 14:23:22	CA机房外门禁	1000404	1
6096	2022-03-25 14:30:37	CA机房外门禁	1000241	1
6100	2022-03-25 14:30:39	CA机房外门禁	1000404	1
6102	2022-03-25 15:16:51	CA机房外门禁	1000241	1
6105	2022-03-25 15:16:56	CA机房外门禁	1000404	1
6036	2021-09-26 21:33:05	密钥机房外门禁	1000800	1
6039	2021-09-26 21:33:09	密钥机房外门禁	1000333	1
6042	2021-09-27 15:13:42	密钥机房外门禁	1000333	1
6046	2021-09-27 15:13:45	密钥机房外门禁	1000800	1
6049	2021-09-27 16:53:54	密钥机房外门禁	1000333	1
6052	2021-09-27 16:53:56	密钥机房外门禁	1000800	1
6055	2021-12-15 11:20:36	密钥机房外门禁	1002	1
6058	2021-12-15 11:20:41	密钥机房外门禁	1001	1
6060	2021-12-15 11:30:27	密钥机房外门禁	1001	1
6064	2021-12-15 11:30:30	密钥机房外门禁	1002	1
6066	2021-12-15 11:32:58	密钥机房外门禁	1001	1
6070	2021-12-15 11:33:00	密钥机房外门禁	1002	1
6072	2021-12-15 16:10:41	密钥机房外门禁	1002	1
6076	2021-12-15 16:10:44	密钥机房外门禁	1001	1
6079	2021-12-16 09:13:11	密钥机房外门禁	1002	1
6081	2021-12-21 16:17:54	密钥机房外门禁	1000763	1
6085	2021-12-21 16:18:01	密钥机房外门禁	1000763	1
6087	2021-12-29 16:44:15	密钥机房外门禁	1007	1
6090	2021-12-29 16:44:19	密钥机房外门禁	1006	1
6093	2021-12-29 17:06:54	密钥机房外门禁	1007	1
6097	2021-12-29 17:06:57	密钥机房外门禁	1006	1
6099	2022-01-06 15:13:01	密钥机房外门禁	1006	1
6103	2022-01-06 15:13:05	密钥机房外门禁	1007	1
6106	2022-01-06 15:14:44	密钥机房外门禁	1007	1
6109	2022-01-06 15:14:47	密钥机房外门禁	1006	1
6111	2022-01-06 15:16:58	密钥机房外门禁	1007	1
6115	2022-01-06 15:17:02	密钥机房外门禁	1006	1
6118	2022-01-06 15:20:11	密钥机房外门禁	1007	1
6121	2022-01-06 15:20:15	密钥机房外门禁	1006	1
6124	2022-01-06 15:22:05	密钥机房外门禁	1006	1
6127	2022-01-06 15:22:08	密钥机房外门禁	1007	1
6130	2022-01-06 15:25:00	密钥机房外门禁	1007	1
6132	2022-01-06 15:25:06	密钥机房外门禁	1006	1
6135	2022-01-06 15:27:45	密钥机房外门禁	1006	1
6138	2022-01-06 15:27:50	密钥机房外门禁	0	1
6142	2022-01-06 15:27:57	密钥机房外门禁	1006	1
6145	2022-01-06 15:28:00	密钥机房外门禁	0	1
6148	2022-01-06 15:28:03	密钥机房外门禁	1006	1
6150	2022-01-06 15:28:05	密钥机房外门禁	0	1
6153	2022-01-06 15:28:08	密钥机房外门禁	1006	1
6157	2022-01-06 15:28:11	密钥机房外门禁	0	1
6159	2022-01-06 15:28:13	密钥机房外门禁	1006	1
6163	2022-01-06 15:28:16	密钥机房外门禁	0	1
6166	2022-01-06 15:28:18	密钥机房外门禁	1006	1
6168	2022-01-06 15:28:21	密钥机房外门禁	0	1
6171	2022-01-06 15:28:26	密钥机房外门禁	1006	1
6174	2022-01-06 15:28:28	密钥机房外门禁	0	1
6178	2022-01-06 15:28:30	密钥机房外门禁	1006	1
6181	2022-01-06 15:28:33	密钥机房外门禁	0	1
6184	2022-01-06 15:28:35	密钥机房外门禁	1006	1
6186	2022-01-06 15:28:38	密钥机房外门禁	0	1
6190	2022-01-06 15:28:40	密钥机房外门禁	1006	1
6192	2022-01-06 15:28:42	密钥机房外门禁	0	1
6196	2022-01-06 15:28:45	密钥机房外门禁	1006	1
6198	2022-01-06 15:28:47	密钥机房外门禁	0	1
6201	2022-01-06 15:28:49	密钥机房外门禁	1006	1
6204	2022-01-10 15:38:30	密钥机房外门禁	1006	1
6208	2022-01-10 15:38:35	密钥机房外门禁	1007	1
6210	2022-01-10 15:44:23	密钥机房外门禁	1006	1
6214	2022-01-10 15:44:49	密钥机房外门禁	1006	1
6216	2022-01-10 15:44:54	密钥机房外门禁	1007	1
6219	2022-01-10 15:46:30	密钥机房外门禁	1006	1
6223	2022-01-10 15:46:33	密钥机房外门禁	1007	1
6226	2022-01-10 15:47:34	密钥机房外门禁	1006	1
6229	2022-01-10 15:48:03	密钥机房外门禁	1006	1
6232	2022-01-10 15:48:06	密钥机房外门禁	1007	1
6234	2022-01-10 15:48:57	密钥机房外门禁	1007	1
6238	2022-01-10 15:49:04	密钥机房外门禁	1006	1
6240	2022-01-10 15:49:12	密钥机房外门禁	1007	1
6244	2022-01-10 15:50:02	密钥机房外门禁	1007	1
6246	2022-01-10 15:50:05	密钥机房外门禁	1006	1
6250	2022-01-10 15:50:15	密钥机房外门禁	1006	1
6253	2022-01-10 15:50:18	密钥机房外门禁	1007	1
6256	2022-01-10 15:52:09	密钥机房外门禁	1007	1
6259	2022-01-10 15:52:11	密钥机房外门禁	1006	1
6261	2022-01-10 15:53:47	密钥机房外门禁	1006	1
6265	2022-01-10 15:53:53	密钥机房外门禁	1007	1
6267	2022-01-10 15:55:22	密钥机房外门禁	1007	1
6270	2022-01-10 15:55:25	密钥机房外门禁	1006	1
6273	2022-01-10 15:55:54	密钥机房外门禁	1006	1
6277	2022-01-10 15:55:56	密钥机房外门禁	1007	1
6279	2022-01-10 15:57:47	密钥机房外门禁	1007	1
6282	2022-01-10 15:58:13	密钥机房外门禁	1007	1
6285	2022-01-10 15:58:21	密钥机房外门禁	1006	1
6288	2022-01-10 16:00:31	密钥机房外门禁	1006	1
6291	2022-01-10 16:00:34	密钥机房外门禁	1007	1
6294	2022-01-10 16:02:08	密钥机房外门禁	1006	1
6297	2022-01-10 16:02:13	密钥机房外门禁	1007	1
6300	2022-01-10 16:03:49	密钥机房外门禁	1006	1
6303	2022-01-10 16:04:27	密钥机房外门禁	1006	1
6307	2022-01-10 16:04:44	密钥机房外门禁	1006	1
6310	2022-01-10 16:04:48	密钥机房外门禁	1007	1
6312	2022-01-10 16:07:42	密钥机房外门禁	1006	1
6316	2022-01-10 16:07:45	密钥机房外门禁	1007	1
6319	2022-01-10 16:10:18	密钥机房外门禁	1007	1
6322	2022-01-10 16:10:21	密钥机房外门禁	1006	1
6325	2022-01-10 16:10:27	密钥机房外门禁	1006	1
6327	2022-01-10 16:11:09	密钥机房外门禁	1007	1
6330	2022-01-10 16:11:12	密钥机房外门禁	1006	1
6333	2022-01-10 16:13:19	密钥机房外门禁	1007	1
6337	2022-01-10 16:13:22	密钥机房外门禁	1006	1
6340	2022-01-10 16:15:07	密钥机房外门禁	1007	1
6343	2022-01-10 16:15:09	密钥机房外门禁	1006	1
6345	2022-01-10 16:18:04	密钥机房外门禁	0	1
6349	2022-01-10 16:18:05	密钥机房外门禁	0	1
6352	2022-01-10 16:18:13	密钥机房外门禁	1007	1
6092	2021-09-26 21:26:26	信息机房外门禁	1001	1
6095	2021-09-26 21:39:54	信息机房外门禁	1002	1
6098	2021-09-26 21:39:55	信息机房外门禁	1001	1
6101	2021-09-27 00:20:54	信息机房外门禁	1002	1
6104	2021-09-27 00:21:01	信息机房外门禁	1001	1
6107	2021-09-27 00:22:51	信息机房外门禁	1002	1
6110	2021-09-27 00:22:53	信息机房外门禁	1001	1
6113	2021-09-27 17:11:28	信息机房外门禁	1002	1
6116	2021-09-27 17:11:30	信息机房外门禁	1001	1
6119	2021-09-28 17:27:31	信息机房外门禁	1008	1
6122	2021-09-28 17:27:33	信息机房外门禁	1001	1
6125	2021-09-28 17:27:46	信息机房外门禁	1008	1
6128	2021-09-28 17:30:20	信息机房外门禁	1008	1
6131	2021-09-28 17:30:23	信息机房外门禁	1001	1
6134	2021-10-15 16:54:13	信息机房外门禁	1008	1
6137	2021-10-15 16:54:15	信息机房外门禁	1001	1
6140	2021-10-29 09:26:59	信息机房外门禁	1001	1
6143	2021-10-29 09:27:04	信息机房外门禁	1002	1
6146	2021-10-29 09:27:11	信息机房外门禁	1002	1
6149	2021-10-29 09:27:14	信息机房外门禁	1001	1
6152	2021-10-29 09:33:45	信息机房外门禁	1008	1
6155	2021-10-29 09:33:47	信息机房外门禁	1001	1
6158	2021-10-29 10:23:23	信息机房外门禁	1008	1
6161	2021-10-29 10:23:25	信息机房外门禁	1001	1
6164	2021-10-29 19:38:24	信息机房外门禁	1008	1
6167	2021-10-29 19:38:26	信息机房外门禁	1001	1
6170	2021-11-01 09:30:22	信息机房外门禁	1008	1
6173	2021-11-01 09:30:27	信息机房外门禁	1001	1
6176	2021-11-01 20:05:36	信息机房外门禁	1008	1
6179	2021-11-01 20:05:38	信息机房外门禁	1001	1
6182	2021-11-15 10:16:48	信息机房外门禁	1008	1
6185	2021-11-15 10:16:50	信息机房外门禁	1001	1
6188	2021-11-15 14:56:18	信息机房外门禁	1008	1
6191	2021-11-15 14:56:20	信息机房外门禁	1001	1
6194	2021-11-17 08:14:19	信息机房外门禁	1008	1
6197	2021-11-17 08:14:21	信息机房外门禁	1001	1
6200	2021-11-17 09:12:29	信息机房外门禁	1008	1
6203	2021-11-17 09:12:32	信息机房外门禁	1001	1
6206	2021-11-17 09:23:16	信息机房外门禁	1008	1
6209	2021-11-17 09:23:20	信息机房外门禁	1001	1
6212	2021-11-17 09:52:03	信息机房外门禁	1008	1
6215	2021-11-17 09:52:06	信息机房外门禁	1001	1
6218	2021-11-17 10:02:57	信息机房外门禁	1008	1
6221	2021-11-17 10:03:08	信息机房外门禁	1001	1
6224	2021-11-22 11:26:30	信息机房外门禁	1008	1
6227	2021-11-22 11:26:32	信息机房外门禁	1001	1
6230	2021-11-23 08:05:49	信息机房外门禁	1008	1
6233	2021-11-23 08:05:51	信息机房外门禁	1001	1
6236	2021-11-25 11:34:51	信息机房外门禁	1008	1
6239	2021-11-25 11:34:53	信息机房外门禁	1001	1
6242	2021-12-02 17:03:55	信息机房外门禁	1008	1
6245	2021-12-02 17:03:57	信息机房外门禁	1001	1
6248	2021-12-03 08:48:25	信息机房外门禁	1008	1
6251	2021-12-03 08:48:27	信息机房外门禁	1001	1
6254	2021-12-03 14:07:54	信息机房外门禁	1008	1
6257	2021-12-03 14:07:57	信息机房外门禁	1001	1
6260	2021-12-07 10:51:18	信息机房外门禁	1008	1
6263	2021-12-07 10:51:20	信息机房外门禁	1001	1
6266	2021-12-07 15:19:43	信息机房外门禁	1008	1
6269	2021-12-07 15:19:45	信息机房外门禁	1001	1
6272	2021-12-07 15:26:49	信息机房外门禁	1008	1
6275	2021-12-07 15:26:51	信息机房外门禁	1001	1
6278	2021-12-10 08:24:36	信息机房外门禁	1002	1
6281	2021-12-10 08:24:38	信息机房外门禁	1001	1
6284	2021-12-13 15:23:42	信息机房外门禁	1001	1
6287	2021-12-13 15:23:44	信息机房外门禁	1002	1
6290	2021-12-13 16:19:18	信息机房外门禁	1002	1
6293	2021-12-13 16:19:20	信息机房外门禁	1001	1
6296	2021-12-14 10:23:18	信息机房外门禁	1002	1
6299	2021-12-14 10:23:43	信息机房外门禁	1001	1
6302	2021-12-15 11:23:17	信息机房外门禁	1001	1
6305	2021-12-15 11:23:21	信息机房外门禁	1002	1
6308	2021-12-15 16:26:10	信息机房外门禁	1002	1
6311	2021-12-15 16:26:17	信息机房外门禁	1001	1
6314	2021-12-16 09:23:58	信息机房外门禁	1001	1
6317	2021-12-16 09:24:02	信息机房外门禁	1002	1
6320	2021-12-16 17:11:13	信息机房外门禁	1002	1
6323	2021-12-16 17:11:16	信息机房外门禁	1001	1
6326	2021-12-21 10:11:30	信息机房外门禁	1002	1
6329	2021-12-21 10:11:44	信息机房外门禁	1001	1
6332	2021-12-27 17:13:11	信息机房外门禁	1002	1
6335	2021-12-27 17:14:51	信息机房外门禁	1002	1
6338	2021-12-27 17:14:54	信息机房外门禁	1001	1
6341	2021-12-29 16:14:01	信息机房外门禁	2	1
6344	2021-12-29 16:16:29	信息机房外门禁	0	1
6347	2021-12-29 16:16:32	信息机房外门禁	1002	1
6350	2021-12-29 16:16:34	信息机房外门禁	1001	1
6353	2021-12-29 16:55:06	信息机房外门禁	1001	1
6356	2021-12-29 16:55:09	信息机房外门禁	1005	1
6359	2022-01-06 09:29:39	信息机房外门禁	1002	1
6362	2022-01-06 09:29:42	信息机房外门禁	1001	1
6365	2022-01-06 09:31:55	信息机房外门禁	1002	1
6368	2022-01-06 09:31:57	信息机房外门禁	1001	1
6371	2022-01-06 09:34:40	信息机房外门禁	1002	1
6374	2022-01-06 09:34:42	信息机房外门禁	1001	1
6377	2022-01-06 09:39:01	信息机房外门禁	1002	1
6380	2022-01-06 09:39:04	信息机房外门禁	1001	1
6383	2022-01-06 09:41:19	信息机房外门禁	1002	1
6386	2022-01-06 09:41:26	信息机房外门禁	1001	1
6389	2022-01-06 09:44:47	信息机房外门禁	1002	1
6392	2022-01-06 09:44:52	信息机房外门禁	0	1
6395	2022-01-06 09:44:55	信息机房外门禁	1002	1
6398	2022-01-06 09:44:58	信息机房外门禁	0	1
6401	2022-01-06 09:45:01	信息机房外门禁	1002	1
6404	2022-01-06 09:45:03	信息机房外门禁	0	1
6407	2022-01-06 09:45:06	信息机房外门禁	1002	1
6410	2022-01-06 09:45:08	信息机房外门禁	0	1
6108	2022-03-25 15:28:59	CA机房外门禁	1000241	1
6112	2022-03-25 15:29:02	CA机房外门禁	1000404	1
6114	2022-03-25 15:29:57	CA机房外门禁	1000241	1
6117	2022-03-25 15:30:01	CA机房外门禁	1000404	1
6120	2022-03-25 15:30:08	CA机房外门禁	0	1
6123	2022-03-25 15:30:10	CA机房外门禁	1000241	1
6126	2022-03-25 15:33:01	CA机房外门禁	1000241	1
6129	2022-03-25 15:33:04	CA机房外门禁	1000404	1
6133	2022-03-25 15:35:20	CA机房外门禁	1000241	1
6136	2022-03-25 15:35:24	CA机房外门禁	1000404	1
6139	2022-03-25 15:38:02	CA机房外门禁	1000241	1
6141	2022-03-25 15:38:06	CA机房外门禁	1000404	1
6144	2022-03-25 15:40:57	CA机房外门禁	1000241	1
6147	2022-03-25 15:41:03	CA机房外门禁	1000404	1
6151	2022-03-25 15:43:11	CA机房外门禁	10004041	1
6154	2022-03-25 15:43:14	CA机房外门禁	10004041	1
6156	2022-03-25 15:43:16	CA机房外门禁	10004041	1
6160	2022-03-25 15:43:18	CA机房外门禁	10004041	1
6162	2022-03-25 15:43:21	CA机房外门禁	10004041	1
6165	2022-03-25 15:43:23	CA机房外门禁	10004041	1
6169	2022-03-25 17:44:14	CA机房外门禁	1000241	1
6172	2022-03-25 17:44:18	CA机房外门禁	1000404	1
6175	2022-03-25 19:22:35	CA机房外门禁	1000404	1
6177	2022-03-25 19:22:38	CA机房外门禁	1000241	1
6180	2022-03-26 14:38:23	CA机房外门禁	1000241	1
6183	2022-03-26 14:38:25	CA机房外门禁	1000404	1
6187	2022-03-26 15:49:53	CA机房外门禁	1000241	1
6189	2022-03-26 15:49:56	CA机房外门禁	1000404	1
6193	2022-03-26 16:56:45	CA机房外门禁	1000241	1
6195	2022-03-26 16:56:47	CA机房外门禁	1000404	1
6199	2022-03-26 17:09:04	CA机房外门禁	1001	1
6202	2022-03-26 17:29:52	CA机房外门禁	0	1
6205	2022-03-26 17:29:56	CA机房外门禁	1000241	1
6207	2022-03-26 17:29:59	CA机房外门禁	1000404	1
6211	2022-03-28 09:50:41	CA机房外门禁	1000241	1
6213	2022-03-28 09:50:44	CA机房外门禁	1000404	1
6217	2022-03-28 10:01:51	CA机房外门禁	1000241	1
6220	2022-03-28 10:01:54	CA机房外门禁	1000404	1
6222	2022-03-28 13:28:43	CA机房外门禁	0	1
6225	2022-03-28 13:28:54	CA机房外门禁	0	1
6228	2022-03-28 13:30:30	CA机房外门禁	1000143	1
6231	2022-03-28 13:30:34	CA机房外门禁	1000763	1
6235	2022-03-28 14:08:23	CA机房外门禁	1000241	1
6237	2022-03-28 14:08:26	CA机房外门禁	1000404	1
6241	2022-03-28 16:30:23	CA机房外门禁	1000404	1
6243	2022-03-28 16:30:27	CA机房外门禁	1000241	1
6247	2022-03-29 10:10:30	CA机房外门禁	1000404	1
6249	2022-03-29 10:10:34	CA机房外门禁	1000241	1
6252	2022-03-29 11:54:08	CA机房外门禁	1000241	1
6255	2022-03-29 11:54:11	CA机房外门禁	1000404	1
6258	2022-03-29 12:05:27	CA机房外门禁	1000241	1
6262	2022-03-29 12:05:33	CA机房外门禁	1000143	1
6264	2022-03-29 12:05:53	CA机房外门禁	1000143	1
6268	2022-03-29 12:06:22	CA机房外门禁	1000143	1
6271	2022-03-29 12:06:36	CA机房外门禁	1000241	1
6274	2022-03-29 12:06:41	CA机房外门禁	1000143	1
6276	2022-03-29 16:20:33	CA机房外门禁	1005	1
6280	2022-03-29 16:20:37	CA机房外门禁	1006	1
6283	2022-03-29 16:55:57	CA机房外门禁	1005	1
6286	2022-03-29 16:56:00	CA机房外门禁	1006	1
6289	2022-03-29 17:02:10	CA机房外门禁	1005	1
6292	2022-03-29 17:02:17	CA机房外门禁	1006	1
6295	2022-03-29 17:09:25	CA机房外门禁	1000404	1
6298	2022-03-29 17:09:31	CA机房外门禁	1000241	1
6301	2022-03-30 14:03:52	CA机房外门禁	1000404	1
6304	2022-03-30 14:03:55	CA机房外门禁	0	1
6306	2022-03-30 14:04:00	CA机房外门禁	0	1
6309	2022-03-30 14:04:06	CA机房外门禁	0	1
6313	2022-03-30 14:04:16	CA机房外门禁	1000404	1
6315	2022-03-30 14:04:21	CA机房外门禁	1000241	1
6318	2022-03-31 15:51:12	CA机房外门禁	1005	1
6321	2022-03-31 15:51:15	CA机房外门禁	1006	1
6324	2022-04-14 09:48:33	CA机房外门禁	1005	1
6328	2022-04-14 09:48:36	CA机房外门禁	1006	1
6331	2022-04-19 10:54:22	CA机房外门禁	1005	1
6334	2022-04-19 10:54:24	CA机房外门禁	1006	1
6336	2022-04-21 14:23:49	CA机房外门禁	1005	1
6339	2022-04-21 14:23:53	CA机房外门禁	1006	1
6342	2022-04-25 16:10:46	CA机房外门禁	1006	1
6346	2022-04-25 16:10:48	CA机房外门禁	1005	1
6348	2022-05-17 09:25:57	CA机房外门禁	1005	1
6351	2022-05-17 09:26:00	CA机房外门禁	1006	1
6354	2022-05-17 10:46:45	CA机房外门禁	1005	1
6357	2022-05-17 10:46:48	CA机房外门禁	1006	1
6361	2022-05-19 14:35:46	CA机房外门禁	1000404	1
6363	2022-05-19 14:35:53	CA机房外门禁	1000241	1
6366	2022-05-19 15:56:08	CA机房外门禁	1000404	1
6369	2022-05-19 15:56:12	CA机房外门禁	1000241	1
6373	2022-05-19 15:59:01	CA机房外门禁	1000404	1
6375	2022-05-19 15:59:06	CA机房外门禁	0	1
6379	2022-05-19 15:59:12	CA机房外门禁	1000241	1
6382	2022-05-19 15:59:20	CA机房外门禁	1000404	1
6384	2022-05-19 16:03:09	CA机房外门禁	1000404	1
6388	2022-05-19 16:03:13	CA机房外门禁	1000241	1
6391	2022-05-19 16:04:38	CA机房外门禁	1000404	1
6393	2022-05-19 16:04:44	CA机房外门禁	1000241	1
6396	2022-05-19 16:05:06	CA机房外门禁	1000404	1
6399	2022-05-19 16:05:09	CA机房外门禁	1000241	1
6403	2022-05-19 16:05:22	CA机房外门禁	1000404	1
6405	2022-05-19 16:05:26	CA机房外门禁	1000241	1
6408	2022-05-19 16:59:22	CA机房外门禁	1000404	1
6412	2022-05-19 16:59:29	CA机房外门禁	1000241	1
6415	2022-05-19 16:59:48	CA机房外门禁	1000404	1
6417	2022-05-19 16:59:53	CA机房外门禁	1000241	1
6421	2022-05-19 17:00:05	CA机房外门禁	1000404	1
6424	2022-05-19 17:00:10	CA机房外门禁	1000241	1
6427	2022-05-19 17:21:28	CA机房外门禁	1000404	1
6429	2022-05-19 17:21:33	CA机房外门禁	1000241	1
6355	2022-01-10 16:18:15	密钥机房外门禁	0	1
6358	2022-01-10 16:18:20	密钥机房外门禁	1007	1
6360	2022-01-10 16:18:22	密钥机房外门禁	0	1
6364	2022-01-10 16:18:29	密钥机房外门禁	1007	1
6367	2022-01-10 16:18:34	密钥机房外门禁	0	1
6370	2022-01-10 16:18:37	密钥机房外门禁	1007	1
6372	2022-01-10 16:18:41	密钥机房外门禁	0	1
6376	2022-01-10 16:18:43	密钥机房外门禁	1007	1
6378	2022-01-10 16:18:45	密钥机房外门禁	0	1
6381	2022-01-10 16:18:48	密钥机房外门禁	1007	1
6385	2022-01-10 16:18:53	密钥机房外门禁	0	1
6387	2022-01-10 16:18:57	密钥机房外门禁	1007	1
6390	2022-01-10 16:18:59	密钥机房外门禁	1007	1
6394	2022-01-10 16:19:25	密钥机房外门禁	1007	1
6397	2022-01-10 16:19:28	密钥机房外门禁	1006	1
6400	2022-01-10 16:19:30	密钥机房外门禁	1007	1
6402	2022-01-10 16:19:32	密钥机房外门禁	0	1
6406	2022-01-10 16:19:34	密钥机房外门禁	1007	1
6409	2022-01-10 16:19:37	密钥机房外门禁	0	1
6411	2022-01-10 16:19:39	密钥机房外门禁	1007	1
6414	2022-01-10 16:19:42	密钥机房外门禁	0	1
6418	2022-01-10 16:19:45	密钥机房外门禁	1007	1
6420	2022-01-10 16:20:51	密钥机房外门禁	0	1
6423	2022-01-10 16:20:53	密钥机房外门禁	1007	1
6426	2022-01-10 16:20:55	密钥机房外门禁	0	1
6430	2022-01-10 16:20:57	密钥机房外门禁	1007	1
6432	2022-01-10 16:20:59	密钥机房外门禁	0	1
6436	2022-01-10 16:21:00	密钥机房外门禁	1007	1
6438	2022-01-10 16:21:02	密钥机房外门禁	0	1
6442	2022-01-10 16:21:04	密钥机房外门禁	1007	1
6445	2022-01-10 16:21:05	密钥机房外门禁	0	1
6447	2022-01-10 16:21:07	密钥机房外门禁	1007	1
6451	2022-01-10 16:21:08	密钥机房外门禁	0	1
6453	2022-01-10 16:21:10	密钥机房外门禁	1007	1
6457	2022-01-10 16:21:14	密钥机房外门禁	0	1
6460	2022-01-10 16:21:16	密钥机房外门禁	1007	1
6463	2022-01-10 16:21:17	密钥机房外门禁	0	1
6465	2022-01-10 16:22:22	密钥机房外门禁	1007	1
6469	2022-01-10 16:22:27	密钥机房外门禁	0	1
6472	2022-01-10 16:22:33	密钥机房外门禁	0	1
6475	2022-01-10 16:22:35	密钥机房外门禁	1007	1
6477	2022-01-10 16:22:38	密钥机房外门禁	0	1
6481	2022-01-10 16:22:41	密钥机房外门禁	1007	1
6483	2022-01-10 16:22:45	密钥机房外门禁	0	1
6486	2022-01-10 16:22:49	密钥机房外门禁	1007	1
6489	2022-01-10 16:22:51	密钥机房外门禁	0	1
6492	2022-01-10 16:22:54	密钥机房外门禁	1007	1
6496	2022-01-10 16:22:55	密钥机房外门禁	0	1
6498	2022-01-10 16:22:59	密钥机房外门禁	1007	1
6502	2022-01-10 16:23:00	密钥机房外门禁	0	1
6504	2022-01-10 16:23:03	密钥机房外门禁	1007	1
6508	2022-01-17 14:00:25	密钥机房外门禁	1001	1
6510	2022-01-17 14:00:29	密钥机房外门禁	1002	1
6514	2022-01-17 14:00:33	密钥机房外门禁	1001	1
6516	2022-01-17 14:00:35	密钥机房外门禁	1002	1
6519	2022-01-17 14:00:46	密钥机房外门禁	1001	1
6522	2022-01-17 14:00:47	密钥机房外门禁	1002	1
6525	2022-01-25 11:35:41	密钥机房外门禁	1006	1
6529	2022-01-25 11:35:48	密钥机房外门禁	0	1
6531	2022-01-25 11:35:51	密钥机房外门禁	0	1
6535	2022-01-25 11:35:55	密钥机房外门禁	1007	1
6538	2022-03-01 19:27:32	密钥机房外门禁	1001	1
6540	2022-03-01 19:27:38	密钥机房外门禁	0	1
6549	2022-03-01 19:27:42	密钥机房外门禁	2	1
6552	2022-03-01 19:27:48	密钥机房外门禁	1001	1
6555	2022-03-01 19:28:15	密钥机房外门禁	1002	1
6557	2022-03-01 20:08:13	密钥机房外门禁	1006	1
6561	2022-03-01 20:08:16	密钥机房外门禁	1007	1
6564	2022-03-01 20:08:31	密钥机房外门禁	1007	1
6566	2022-03-01 20:08:33	密钥机房外门禁	1006	1
6570	2022-03-01 20:09:10	密钥机房外门禁	1007	1
6572	2022-03-01 20:09:12	密钥机房外门禁	1006	1
6575	2022-03-01 20:11:08	密钥机房外门禁	1006	1
6579	2022-03-01 20:11:10	密钥机房外门禁	1007	1
6582	2022-03-01 20:11:12	密钥机房外门禁	1007	1
6584	2022-03-01 20:14:02	密钥机房外门禁	1006	1
6588	2022-03-01 20:14:05	密钥机房外门禁	1007	1
6590	2022-03-01 20:16:57	密钥机房外门禁	1006	1
6594	2022-03-01 20:17:00	密钥机房外门禁	1007	1
6596	2022-03-01 20:18:30	密钥机房外门禁	1007	1
6599	2022-03-01 20:18:33	密钥机房外门禁	1006	1
6603	2022-03-01 20:20:08	密钥机房外门禁	1006	1
6606	2022-03-01 20:20:30	密钥机房外门禁	1007	1
6609	2022-03-01 20:20:32	密钥机房外门禁	1006	1
6611	2022-03-01 20:22:19	密钥机房外门禁	1007	1
6614	2022-03-01 20:22:21	密钥机房外门禁	1006	1
6617	2022-03-01 20:22:42	密钥机房外门禁	1007	1
6620	2022-03-01 20:22:44	密钥机房外门禁	0	1
6624	2022-03-01 20:23:40	密钥机房外门禁	1007	1
6627	2022-03-01 20:23:42	密钥机房外门禁	0	1
6630	2022-03-01 20:23:46	密钥机房外门禁	1007	1
6632	2022-03-01 20:23:47	密钥机房外门禁	0	1
6635	2022-03-01 20:23:50	密钥机房外门禁	1007	1
6638	2022-03-01 20:23:52	密钥机房外门禁	0	1
6641	2022-03-01 20:23:54	密钥机房外门禁	1007	1
6644	2022-03-01 20:23:59	密钥机房外门禁	0	1
6646	2022-03-01 20:24:01	密钥机房外门禁	1007	1
6648	2022-03-01 20:24:03	密钥机房外门禁	0	1
6650	2022-03-01 20:24:05	密钥机房外门禁	1007	1
6652	2022-03-01 20:24:08	密钥机房外门禁	0	1
6654	2022-03-01 20:24:14	密钥机房外门禁	1007	1
6656	2022-03-01 20:24:16	密钥机房外门禁	0	1
6658	2022-03-01 20:24:27	密钥机房外门禁	1007	1
6660	2022-03-01 20:24:31	密钥机房外门禁	0	1
6662	2022-03-01 20:25:00	密钥机房外门禁	1006	1
6664	2022-03-01 20:25:02	密钥机房外门禁	1007	1
6666	2022-03-01 20:25:20	密钥机房外门禁	1007	1
6413	2022-01-06 09:45:12	信息机房外门禁	1002	1
6416	2022-01-06 09:45:14	信息机房外门禁	0	1
6419	2022-01-06 09:45:17	信息机房外门禁	0	1
6422	2022-01-06 09:45:21	信息机房外门禁	0	1
6425	2022-01-06 09:45:23	信息机房外门禁	0	1
6428	2022-01-06 09:45:26	信息机房外门禁	0	1
6431	2022-01-06 09:45:28	信息机房外门禁	0	1
6434	2022-01-06 09:45:31	信息机房外门禁	1002	1
6437	2022-01-06 09:45:35	信息机房外门禁	0	1
6440	2022-01-06 09:45:41	信息机房外门禁	0	1
6443	2022-01-06 09:45:43	信息机房外门禁	0	1
6446	2022-01-06 09:45:50	信息机房外门禁	0	1
6449	2022-01-06 09:45:53	信息机房外门禁	1002	1
6452	2022-01-06 09:45:57	信息机房外门禁	0	1
6455	2022-01-06 09:46:02	信息机房外门禁	0	1
6458	2022-01-06 09:46:05	信息机房外门禁	1002	1
6461	2022-01-06 09:46:09	信息机房外门禁	0	1
6464	2022-01-06 09:46:12	信息机房外门禁	1002	1
6467	2022-01-06 09:46:16	信息机房外门禁	0	1
6470	2022-01-08 16:15:49	信息机房外门禁	1002	1
6473	2022-01-08 16:15:52	信息机房外门禁	1001	1
6476	2022-01-08 16:20:43	信息机房外门禁	1002	1
6479	2022-01-08 16:20:45	信息机房外门禁	1001	1
6482	2022-01-08 16:21:40	信息机房外门禁	1002	1
6485	2022-01-08 16:21:42	信息机房外门禁	1001	1
6488	2022-01-08 16:23:56	信息机房外门禁	1002	1
6491	2022-01-08 16:23:58	信息机房外门禁	1001	1
6494	2022-01-08 16:25:06	信息机房外门禁	1002	1
6497	2022-01-08 16:25:08	信息机房外门禁	1001	1
6500	2022-01-08 16:26:20	信息机房外门禁	1002	1
6503	2022-01-08 16:26:22	信息机房外门禁	1001	1
6506	2022-01-08 16:28:07	信息机房外门禁	1002	1
6509	2022-01-08 16:28:09	信息机房外门禁	1001	1
6512	2022-01-08 16:30:07	信息机房外门禁	1002	1
6515	2022-01-08 16:30:10	信息机房外门禁	1001	1
6518	2022-01-08 16:31:48	信息机房外门禁	1002	1
6521	2022-01-08 16:31:51	信息机房外门禁	1001	1
6524	2022-01-08 16:32:50	信息机房外门禁	1002	1
6527	2022-01-08 16:32:52	信息机房外门禁	1001	1
6530	2022-01-08 16:34:07	信息机房外门禁	1002	1
6533	2022-01-08 16:34:10	信息机房外门禁	1001	1
6536	2022-01-08 16:35:39	信息机房外门禁	1002	1
6539	2022-01-08 16:35:42	信息机房外门禁	1001	1
6541	2022-01-08 16:37:23	信息机房外门禁	1002	1
6542	2022-01-08 16:37:26	信息机房外门禁	1001	1
6543	2022-01-08 16:39:42	信息机房外门禁	1002	1
6544	2022-01-08 16:39:44	信息机房外门禁	1001	1
6546	2022-01-08 16:41:39	信息机房外门禁	1002	1
6548	2022-01-08 16:41:41	信息机房外门禁	1001	1
6551	2022-01-08 16:44:10	信息机房外门禁	1002	1
6554	2022-01-08 16:44:12	信息机房外门禁	1001	1
6558	2022-01-08 16:46:30	信息机房外门禁	0	1
6560	2022-01-08 16:46:34	信息机房外门禁	1002	1
6563	2022-01-08 16:46:36	信息机房外门禁	1001	1
6567	2022-01-08 16:49:18	信息机房外门禁	1002	1
6569	2022-01-08 16:49:21	信息机房外门禁	1001	1
6573	2022-01-08 16:51:06	信息机房外门禁	1002	1
6576	2022-01-08 16:51:08	信息机房外门禁	1001	1
6578	2022-01-08 16:52:41	信息机房外门禁	1002	1
6581	2022-01-08 16:52:45	信息机房外门禁	1001	1
6585	2022-01-08 16:54:22	信息机房外门禁	1002	1
6587	2022-01-08 16:54:25	信息机房外门禁	0	1
6591	2022-01-08 16:54:27	信息机房外门禁	1002	1
6593	2022-01-08 16:54:30	信息机房外门禁	0	1
6597	2022-01-08 16:54:34	信息机房外门禁	1002	1
6600	2022-01-08 16:54:36	信息机房外门禁	0	1
6602	2022-01-08 16:54:40	信息机房外门禁	1002	1
6605	2022-01-08 16:54:42	信息机房外门禁	0	1
6608	2022-01-08 16:54:48	信息机房外门禁	1002	1
6612	2022-01-08 16:54:51	信息机房外门禁	0	1
6615	2022-01-08 16:54:56	信息机房外门禁	1002	1
6618	2022-01-08 16:54:59	信息机房外门禁	0	1
6621	2022-01-08 16:55:57	信息机房外门禁	1001	1
6623	2022-01-08 16:55:59	信息机房外门禁	0	1
6626	2022-01-08 16:56:04	信息机房外门禁	1001	1
6629	2022-01-08 16:56:08	信息机房外门禁	0	1
6633	2022-01-08 16:56:15	信息机房外门禁	1001	1
6636	2022-01-08 16:56:18	信息机房外门禁	0	1
6639	2022-01-08 16:56:25	信息机房外门禁	1001	1
6642	2022-01-08 16:56:27	信息机房外门禁	0	1
6718	2022-01-08 16:56:34	信息机房外门禁	1001	1
6721	2022-01-08 16:56:38	信息机房外门禁	0	1
6724	2022-01-08 16:56:44	信息机房外门禁	1001	1
6726	2022-01-08 16:56:47	信息机房外门禁	0	1
6730	2022-01-08 16:56:53	信息机房外门禁	1001	1
6733	2022-01-08 16:56:55	信息机房外门禁	0	1
6736	2022-01-08 16:57:36	信息机房外门禁	0	1
6739	2022-01-08 16:57:40	信息机房外门禁	1002	1
6742	2022-01-08 16:57:43	信息机房外门禁	0	1
6744	2022-01-08 16:57:50	信息机房外门禁	1002	1
6748	2022-01-08 16:57:53	信息机房外门禁	0	1
6751	2022-01-08 16:58:00	信息机房外门禁	1002	1
6754	2022-01-08 16:58:02	信息机房外门禁	0	1
6757	2022-01-08 16:58:09	信息机房外门禁	1002	1
6759	2022-01-08 16:58:12	信息机房外门禁	0	1
6763	2022-01-08 16:58:18	信息机房外门禁	1002	1
6765	2022-01-08 16:58:21	信息机房外门禁	0	1
6769	2022-01-08 16:58:29	信息机房外门禁	1002	1
6772	2022-01-08 16:58:32	信息机房外门禁	0	1
6774	2022-01-08 16:58:37	信息机房外门禁	0	1
6778	2022-01-08 16:58:41	信息机房外门禁	0	1
6781	2022-01-08 16:58:45	信息机房外门禁	1002	1
6784	2022-01-08 16:58:49	信息机房外门禁	0	1
6786	2022-02-23 13:32:53	信息机房外门禁	1001	1
6789	2022-02-23 13:33:01	信息机房外门禁	1002	1
6793	2022-02-24 14:41:13	信息机房外门禁	1002	1
6795	2022-02-24 14:41:32	信息机房外门禁	1001	1
6433	2023-01-08 14:09:25	CA机房外门禁	0	1
6435	2023-01-08 14:09:28	CA机房外门禁	1	1
6439	2023-01-08 16:39:07	CA机房外门禁	0	1
6441	2023-01-08 16:39:09	CA机房外门禁	0	1
6444	2023-01-08 16:39:12	CA机房外门禁	0	1
6448	2023-01-08 16:39:15	CA机房外门禁	0	1
6450	2023-01-08 16:39:17	CA机房外门禁	0	1
6454	2023-01-08 16:39:19	CA机房外门禁	0	1
6456	2023-01-08 16:39:32	CA机房外门禁	0	1
6459	2023-01-08 16:39:34	CA机房外门禁	0	1
6462	2023-01-08 16:40:11	CA机房外门禁	0	1
6466	2023-01-08 16:40:14	CA机房外门禁	0	1
6468	2023-01-08 16:40:16	CA机房外门禁	0	1
6471	2023-01-08 16:43:06	CA机房外门禁	0	1
6474	2023-01-08 16:43:09	CA机房外门禁	0	1
6478	2023-01-08 16:44:43	CA机房外门禁	0	1
6480	2023-01-08 16:44:45	CA机房外门禁	0	1
6484	2023-01-08 16:45:12	CA机房外门禁	0	1
6487	2023-01-08 16:45:14	CA机房外门禁	0	1
6490	2023-01-08 16:51:19	CA机房外门禁	0	1
6493	2023-01-08 16:51:33	CA机房外门禁	1	1
6495	2023-01-08 16:51:48	CA机房外门禁	12	1
6499	2023-01-08 16:52:00	CA机房外门禁	0	1
6501	2023-01-08 16:52:02	CA机房外门禁	1	1
6505	2023-01-08 16:53:26	CA机房外门禁	1	1
6507	2023-01-08 16:58:20	CA机房外门禁	1	1
6511	2023-01-08 16:58:25	CA机房外门禁	0	1
6513	2023-01-08 16:58:27	CA机房外门禁	12	1
6517	2023-01-08 16:59:15	CA机房外门禁	0	1
6520	2023-01-08 16:59:18	CA机房外门禁	0	1
6523	2023-01-08 16:59:20	CA机房外门禁	0	1
6526	2023-01-08 16:59:21	CA机房外门禁	0	1
6528	2023-01-08 16:59:23	CA机房外门禁	1	1
6532	2023-01-08 16:59:37	CA机房外门禁	1	1
6534	2023-01-08 16:59:41	CA机房外门禁	0	1
6537	2023-01-08 16:59:46	CA机房外门禁	0	1
6545	2023-01-08 16:59:51	CA机房外门禁	0	1
6547	2023-01-08 16:59:57	CA机房外门禁	1	1
6550	2023-01-08 17:00:13	CA机房外门禁	0	1
6553	2023-01-08 17:00:20	CA机房外门禁	1	1
6556	2023-01-08 17:00:27	CA机房外门禁	0	1
6559	2023-01-08 17:00:29	CA机房外门禁	0	1
6562	2023-01-08 17:00:31	CA机房外门禁	0	1
6565	2023-01-08 17:31:29	CA机房外门禁	0	1
6568	2023-01-08 17:31:31	CA机房外门禁	0	1
6571	2023-01-08 17:31:32	CA机房外门禁	1	1
6574	2023-01-08 17:32:21	CA机房外门禁	0	1
6577	2023-01-08 17:32:22	CA机房外门禁	0	1
6580	2023-01-08 17:32:25	CA机房外门禁	1	1
6583	2023-01-08 17:32:37	CA机房外门禁	0	1
6586	2023-01-08 17:55:43	CA机房外门禁	1	1
6589	2023-01-08 17:55:44	CA机房外门禁	11	1
6592	2023-01-08 17:55:47	CA机房外门禁	0	1
6595	2023-01-08 17:57:08	CA机房外门禁	0	1
6598	2023-01-08 17:57:10	CA机房外门禁	0	1
6601	2023-01-08 17:57:17	CA机房外门禁	0	1
6604	2023-01-08 17:57:19	CA机房外门禁	0	1
6607	2023-01-08 17:57:21	CA机房外门禁	0	1
6610	2023-01-08 17:57:23	CA机房外门禁	0	1
6613	2023-01-08 17:57:25	CA机房外门禁	0	1
6616	2023-01-08 17:57:50	CA机房外门禁	1	1
6619	2023-01-08 17:57:53	CA机房外门禁	12	1
6622	2023-01-08 17:58:06	CA机房外门禁	0	1
6625	2023-01-08 17:58:09	CA机房外门禁	1	1
6628	2023-01-08 17:58:12	CA机房外门禁	0	1
6631	2023-01-08 17:58:14	CA机房外门禁	0	1
6634	2023-01-08 17:58:15	CA机房外门禁	0	1
6637	2023-01-08 17:58:17	CA机房外门禁	0	1
6640	2023-01-08 17:58:18	CA机房外门禁	12	1
6643	2023-01-08 17:58:45	CA机房外门禁	0	1
6645	2023-01-08 17:58:48	CA机房外门禁	1	1
6647	2023-01-08 17:58:51	CA机房外门禁	12	1
6649	2023-01-08 17:59:06	CA机房外门禁	1	1
6651	2023-01-08 17:59:12	CA机房外门禁	12	1
6653	2023-01-08 17:59:29	CA机房外门禁	1	1
6655	2023-01-08 17:59:56	CA机房外门禁	0	1
6657	2023-01-08 17:59:58	CA机房外门禁	12	1
6659	2023-01-08 18:00:44	CA机房外门禁	1	1
6661	2023-01-08 18:00:53	CA机房外门禁	12	1
6663	2023-01-08 18:01:38	CA机房外门禁	1	1
6665	2023-01-08 18:01:51	CA机房外门禁	0	1
6667	2023-01-08 18:01:52	CA机房外门禁	0	1
6669	2023-01-08 18:01:54	CA机房外门禁	0	1
6671	2023-01-08 18:01:56	CA机房外门禁	0	1
6673	2023-01-08 18:01:59	CA机房外门禁	12	1
6675	2023-01-08 18:02:21	CA机房外门禁	1	1
6677	2023-01-08 18:02:27	CA机房外门禁	12	1
6679	2023-01-08 18:02:37	CA机房外门禁	0	1
6681	2023-01-08 18:02:38	CA机房外门禁	0	1
6683	2023-01-08 18:02:40	CA机房外门禁	0	1
6685	2023-01-08 18:02:41	CA机房外门禁	0	1
6687	2023-01-08 18:02:42	CA机房外门禁	0	1
6689	2023-01-08 18:02:43	CA机房外门禁	0	1
6691	2023-01-08 18:02:45	CA机房外门禁	0	1
6693	2023-01-08 18:03:01	CA机房外门禁	1	1
6695	2023-01-08 18:04:09	CA机房外门禁	1	1
6697	2023-01-08 18:11:28	CA机房外门禁	1	1
6699	2023-01-08 18:11:34	CA机房外门禁	0	1
6701	2023-01-08 18:11:36	CA机房外门禁	12	1
6703	2023-01-08 18:11:50	CA机房外门禁	1	1
6705	2023-01-08 18:11:54	CA机房外门禁	12	1
6707	2023-01-08 18:12:54	CA机房外门禁	1	1
6709	2023-01-08 18:12:58	CA机房外门禁	12	1
6711	2023-01-08 19:30:26	CA机房外门禁	1	1
6713	2023-01-08 19:30:29	CA机房外门禁	12	1
6715	2023-01-09 10:57:52	CA机房外门禁	1	1
6717	2023-01-09 10:57:55	CA机房外门禁	12	1
6720	2023-01-09 10:58:56	CA机房外门禁	1	1
6723	2023-01-09 10:58:59	CA机房外门禁	12	1
6727	2023-01-09 11:00:23	CA机房外门禁	0	1
6729	2023-01-09 11:00:24	CA机房外门禁	0	1
6732	2023-01-09 11:00:26	CA机房外门禁	0	1
6735	2023-01-09 11:00:27	CA机房外门禁	0	1
6738	2023-01-09 11:00:29	CA机房外门禁	0	1
6741	2023-01-09 11:00:31	CA机房外门禁	0	1
6745	2023-01-09 11:01:25	CA机房外门禁	1	1
6747	2023-01-09 11:01:28	CA机房外门禁	0	1
6750	2023-01-09 11:01:31	CA机房外门禁	0	1
6668	2022-03-01 20:25:23	密钥机房外门禁	1006	1
6670	2022-03-01 20:26:20	密钥机房外门禁	1007	1
6672	2022-03-01 20:26:22	密钥机房外门禁	1006	1
6674	2022-03-01 20:26:28	密钥机房外门禁	1006	1
6676	2022-03-01 20:26:31	密钥机房外门禁	1007	1
6678	2022-03-01 20:27:25	密钥机房外门禁	1006	1
6680	2022-03-01 20:27:28	密钥机房外门禁	1007	1
6682	2022-03-01 20:29:15	密钥机房外门禁	1006	1
6684	2022-03-01 20:29:21	密钥机房外门禁	1007	1
6686	2022-03-01 20:30:31	密钥机房外门禁	1006	1
6688	2022-03-01 20:30:34	密钥机房外门禁	1007	1
6690	2022-03-01 20:32:01	密钥机房外门禁	1007	1
6692	2022-03-01 20:32:03	密钥机房外门禁	1006	1
6694	2022-03-01 20:35:08	密钥机房外门禁	1006	1
6696	2022-03-01 20:35:11	密钥机房外门禁	1007	1
6698	2022-03-01 20:37:03	密钥机房外门禁	1007	1
6700	2022-03-01 20:37:05	密钥机房外门禁	1006	1
6702	2022-03-01 20:37:41	密钥机房外门禁	1006	1
6704	2022-03-01 20:37:44	密钥机房外门禁	1007	1
6706	2022-03-01 20:38:50	密钥机房外门禁	1006	1
6708	2022-03-01 20:38:53	密钥机房外门禁	1007	1
6710	2022-03-01 20:40:00	密钥机房外门禁	1007	1
6712	2022-03-01 20:40:02	密钥机房外门禁	1006	1
6714	2022-03-01 20:41:59	密钥机房外门禁	1006	1
6716	2022-03-01 20:42:01	密钥机房外门禁	1007	1
6719	2022-03-01 20:43:40	密钥机房外门禁	1007	1
6722	2022-03-01 20:43:42	密钥机房外门禁	1006	1
6725	2022-03-01 20:46:36	密钥机房外门禁	1006	1
6728	2022-03-01 20:46:38	密钥机房外门禁	1007	1
6731	2022-03-01 20:46:49	密钥机房外门禁	1006	1
6734	2022-03-01 20:46:51	密钥机房外门禁	1007	1
6737	2022-03-05 09:39:03	密钥机房外门禁	2	1
6740	2022-03-05 09:45:09	密钥机房外门禁	1000328	1
6743	2022-03-05 09:45:24	密钥机房外门禁	1006	1
6746	2022-03-05 10:05:43	密钥机房外门禁	1006	1
6749	2022-03-05 10:05:46	密钥机房外门禁	1000328	1
6752	2022-03-05 11:34:25	密钥机房外门禁	1000328	1
6755	2022-03-05 11:34:27	密钥机房外门禁	1006	1
6758	2022-03-05 12:46:51	密钥机房外门禁	1000328	1
6761	2022-03-05 12:46:55	密钥机房外门禁	1006	1
6764	2022-03-05 13:19:34	密钥机房外门禁	1006	1
6767	2022-03-05 13:19:40	密钥机房外门禁	1000328	1
6770	2022-03-05 15:01:18	密钥机房外门禁	1000328	1
6773	2022-03-05 15:01:20	密钥机房外门禁	1006	1
6776	2022-03-09 09:39:05	密钥机房外门禁	0	1
6779	2022-03-09 10:25:43	密钥机房外门禁	1007	1
6782	2022-03-09 10:25:46	密钥机房外门禁	0	1
6785	2022-03-09 10:25:49	密钥机房外门禁	1007	1
6788	2022-03-09 10:25:51	密钥机房外门禁	0	1
6791	2022-03-09 10:25:57	密钥机房外门禁	1007	1
6794	2022-03-09 10:25:59	密钥机房外门禁	0	1
6797	2022-03-09 10:26:04	密钥机房外门禁	1007	1
6800	2022-03-09 10:26:06	密钥机房外门禁	0	1
6803	2022-03-09 10:26:09	密钥机房外门禁	1007	1
6806	2022-03-09 10:26:12	密钥机房外门禁	0	1
6809	2022-03-09 10:26:16	密钥机房外门禁	1007	1
6812	2022-03-09 10:26:18	密钥机房外门禁	0	1
6815	2022-03-09 10:26:22	密钥机房外门禁	1007	1
6818	2022-03-09 10:26:24	密钥机房外门禁	0	1
6821	2022-03-09 10:27:14	密钥机房外门禁	1007	1
6824	2022-03-09 10:27:18	密钥机房外门禁	0	1
6827	2022-03-09 10:27:20	密钥机房外门禁	1007	1
6830	2022-03-09 10:27:22	密钥机房外门禁	0	1
6833	2022-03-09 10:27:24	密钥机房外门禁	1007	1
6836	2022-03-09 10:27:26	密钥机房外门禁	0	1
6839	2022-03-09 10:27:28	密钥机房外门禁	1007	1
6842	2022-03-09 10:27:30	密钥机房外门禁	0	1
6845	2022-03-09 10:27:32	密钥机房外门禁	1007	1
6848	2022-03-09 10:27:34	密钥机房外门禁	0	1
6851	2022-03-09 10:27:36	密钥机房外门禁	1007	1
6854	2022-03-09 10:27:38	密钥机房外门禁	0	1
6857	2022-03-09 10:27:40	密钥机房外门禁	1007	1
6860	2022-03-09 10:27:42	密钥机房外门禁	0	1
6863	2022-03-09 10:27:44	密钥机房外门禁	1007	1
6866	2022-03-09 10:27:46	密钥机房外门禁	0	1
6869	2022-03-09 10:27:48	密钥机房外门禁	1007	1
6872	2022-03-09 10:27:50	密钥机房外门禁	0	1
6875	2022-03-09 10:28:54	密钥机房外门禁	1007	1
6878	2022-03-09 10:28:56	密钥机房外门禁	0	1
6881	2022-03-09 10:28:59	密钥机房外门禁	1007	1
6884	2022-03-09 10:29:01	密钥机房外门禁	0	1
6887	2022-03-09 10:29:04	密钥机房外门禁	0	1
6890	2022-03-09 10:29:07	密钥机房外门禁	1006	1
6893	2022-03-09 10:29:16	密钥机房外门禁	0	1
6896	2022-03-09 10:29:21	密钥机房外门禁	1007	1
6899	2022-03-09 10:29:23	密钥机房外门禁	0	1
6902	2022-03-09 10:29:25	密钥机房外门禁	0	1
6905	2022-03-09 10:29:27	密钥机房外门禁	1007	1
6908	2022-03-09 10:29:29	密钥机房外门禁	0	1
6911	2022-03-09 10:29:31	密钥机房外门禁	1007	1
6913	2022-03-09 10:29:33	密钥机房外门禁	0	1
6915	2022-03-09 10:37:31	密钥机房外门禁	1007	1
6917	2022-03-09 10:37:32	密钥机房外门禁	1006	1
6919	2022-03-09 10:38:38	密钥机房外门禁	1007	1
6921	2022-03-09 10:38:40	密钥机房外门禁	1006	1
6923	2022-03-09 10:40:25	密钥机房外门禁	1007	1
6925	2022-03-09 10:40:28	密钥机房外门禁	1006	1
6927	2022-03-09 10:43:14	密钥机房外门禁	1006	1
6929	2022-03-09 10:43:17	密钥机房外门禁	1007	1
6931	2022-03-09 10:44:55	密钥机房外门禁	1007	1
6933	2022-03-09 10:44:58	密钥机房外门禁	1006	1
6935	2022-03-09 10:46:25	密钥机房外门禁	1006	1
6937	2022-03-09 10:46:27	密钥机房外门禁	1007	1
6939	2022-03-09 10:47:36	密钥机房外门禁	1006	1
6941	2022-03-09 10:47:39	密钥机房外门禁	1007	1
6943	2022-03-09 10:48:47	密钥机房外门禁	1006	1
6753	2023-01-09 11:01:33	CA机房外门禁	0	1
6756	2023-01-09 11:01:34	CA机房外门禁	12	1
6760	2023-01-09 11:03:11	CA机房外门禁	1	1
6762	2023-01-09 11:03:14	CA机房外门禁	12	1
6766	2023-01-09 11:07:20	CA机房外门禁	1	1
6768	2023-01-09 11:07:23	CA机房外门禁	0	1
6771	2023-01-09 11:07:24	CA机房外门禁	12	1
6775	2023-01-09 16:08:26	CA机房外门禁	1	1
6777	2023-01-09 16:08:29	CA机房外门禁	11	1
6780	2023-01-09 16:09:35	CA机房外门禁	1	1
6783	2023-01-09 16:09:37	CA机房外门禁	11	1
6787	2023-01-09 16:11:00	CA机房外门禁	1	1
6790	2023-01-09 16:11:02	CA机房外门禁	11	1
6792	2023-01-09 16:11:14	CA机房外门禁	1	1
6796	2023-01-09 16:11:17	CA机房外门禁	0	1
6798	2023-01-09 16:11:19	CA机房外门禁	0	1
6801	2023-01-09 16:11:20	CA机房外门禁	0	1
6804	2023-01-09 16:11:21	CA机房外门禁	0	1
6807	2023-01-09 16:12:22	CA机房外门禁	0	1
6810	2023-01-09 16:12:25	CA机房外门禁	0	1
6813	2023-01-09 16:12:26	CA机房外门禁	0	1
6817	2023-01-09 16:12:28	CA机房外门禁	0	1
6819	2023-01-09 16:12:31	CA机房外门禁	1	1
6823	2023-01-09 16:12:36	CA机房外门禁	11	1
6826	2023-01-09 16:14:15	CA机房外门禁	0	1
6828	2023-01-09 16:14:17	CA机房外门禁	0	1
6831	2023-01-09 16:14:21	CA机房外门禁	1	1
6834	2023-01-09 16:14:24	CA机房外门禁	11	1
6837	2023-01-09 16:52:36	CA机房外门禁	1005	1
6841	2023-01-09 16:58:45	CA机房外门禁	1005	1
6843	2023-01-09 17:01:50	CA机房外门禁	1005	1
6846	2023-01-09 17:01:53	CA机房外门禁	1006	1
6849	2023-01-09 17:05:33	CA机房外门禁	0	1
6852	2023-01-09 17:05:36	CA机房外门禁	0	1
6855	2023-01-09 17:05:39	CA机房外门禁	0	1
6859	2023-01-09 17:05:45	CA机房外门禁	1006	1
6861	2023-01-09 17:05:48	CA机房外门禁	0	1
6865	2023-01-09 17:05:52	CA机房外门禁	1006	1
6867	2023-01-09 17:05:56	CA机房外门禁	1005	1
6870	2023-01-09 17:07:41	CA机房外门禁	1006	1
6874	2023-01-09 17:07:45	CA机房外门禁	1005	1
6876	2023-01-09 17:10:27	CA机房外门禁	0	1
6879	2023-01-09 17:10:28	CA机房外门禁	0	1
6882	2023-01-09 17:10:31	CA机房外门禁	0	1
6885	2023-01-09 17:10:32	CA机房外门禁	0	1
6889	2023-01-09 17:10:34	CA机房外门禁	0	1
6891	2023-01-09 17:10:36	CA机房外门禁	0	1
6895	2023-02-06 15:25:07	CA机房外门禁	1005	1
6897	2023-02-06 15:25:09	CA机房外门禁	1006	1
6900	2023-02-06 15:33:19	CA机房外门禁	1006	1
6903	2023-02-06 15:33:21	CA机房外门禁	1005	1
6906	2023-02-06 15:51:43	CA机房外门禁	1006	1
6910	2023-02-06 15:51:46	CA机房外门禁	1005	1
7644	2023-02-08 15:47:36	信息机房内门禁	1002	1
7645	2023-02-08 15:48:21	信息机房内门禁	1001	1
7649	2023-02-10 15:28:03	信息机房内门禁	0	1
7650	2023-02-10 15:28:08	信息机房内门禁	1002	1
7651	2023-02-10 15:28:30	信息机房内门禁	1001	1
7655	2023-02-13 14:45:57	信息机房内门禁	1001	1
7656	2023-02-13 14:46:02	信息机房内门禁	1002	1
7659	2023-02-16 15:05:58	信息机房内门禁	1001	1
7660	2023-02-16 15:06:00	信息机房内门禁	1002	1
7664	2023-02-21 14:42:02	信息机房内门禁	1001	1
7666	2023-02-24 15:34:37	信息机房外门禁	1002	1
7667	2023-02-24 15:34:40	信息机房外门禁	1001	1
7670	2023-02-26 12:22:16	信息机房外门禁	1008	1
7671	2023-02-26 12:23:17	信息机房外门禁	1001	1
7672	2023-02-26 12:23:58	信息机房外门禁	1008	1
7673	2023-02-26 12:24:01	信息机房外门禁	1001	1
7676	2023-02-26 12:52:12	信息机房内门禁	1001	1
7677	2023-02-26 12:52:14	信息机房内门禁	1008	1
7681	2023-02-26 14:13:47	信息机房内门禁	1008	1
7682	2023-02-26 14:13:50	信息机房内门禁	1001	1
7683	2023-03-02 10:17:21	密钥机房外门禁	1003	1
7684	2023-03-02 10:17:24	密钥机房外门禁	1007	1
7685	2023-03-02 10:17:25	密钥机房外门禁	1007	1
7686	2023-03-02 10:18:20	信息机房外门禁	1002	1
7687	2023-03-02 10:18:23	信息机房外门禁	1001	1
7688	2023-03-02 10:18:20	信息机房外门禁	1002	1
7689	2023-03-02 10:18:23	信息机房外门禁	1001	1
7690	2023-03-02 10:44:51	信息机房内门禁	1002	1
7691	2023-03-02 10:44:51	信息机房内门禁	1002	1
7692	2023-03-02 10:45:29	信息机房内门禁	1001	1
7693	2023-03-02 10:45:29	信息机房内门禁	1001	1
7694	2023-03-02 11:42:21	密钥机房内门禁	1003	1
7695	2023-03-02 11:42:24	密钥机房内门禁	1007	1
7696	2023-03-06 09:17:13	密钥机房外门禁	1007	1
7697	2023-03-06 09:17:16	密钥机房外门禁	1003	1
7698	2023-03-06 10:01:26	密钥机房内门禁	1003	1
7699	2023-03-06 10:01:37	密钥机房内门禁	0	1
7700	2023-03-06 10:01:47	密钥机房内门禁	1003	1
7701	2023-03-06 10:01:49	密钥机房内门禁	0	1
7702	2023-03-06 10:01:55	密钥机房内门禁	1007	1
7703	2023-03-06 14:58:07	信息机房外门禁	1002	1
7704	2023-03-06 14:58:09	信息机房外门禁	1001	1
7705	2023-03-06 14:58:07	信息机房外门禁	1002	1
7706	2023-03-06 14:58:09	信息机房外门禁	1001	1
7707	2023-03-06 15:11:11	信息机房内门禁	1002	1
7708	2023-03-06 15:11:14	信息机房内门禁	1001	1
7709	2023-03-09 10:42:29	信息机房外门禁	1002	1
7710	2023-03-09 10:42:32	信息机房外门禁	1001	1
7711	2023-03-09 10:55:01	信息机房内门禁	1001	1
7712	2023-03-09 10:55:04	信息机房内门禁	1002	1
7713	2023-03-09 10:55:01	信息机房内门禁	1001	1
7714	2023-03-09 10:55:04	信息机房内门禁	1002	1
7715	2023-03-10 15:22:10	信息机房外门禁	1001	1
7716	2023-03-10 15:22:13	信息机房外门禁	1002	1
7717	2023-03-10 15:31:47	信息机房内门禁	1001	1
7718	2023-03-10 15:31:52	信息机房内门禁	1002	1
7719	2023-03-13 15:56:41	信息机房外门禁	1001	1
6799	2022-02-24 14:48:47	信息机房外门禁	1002	1
6802	2022-02-24 14:48:52	信息机房外门禁	1001	1
6805	2022-02-25 09:49:40	信息机房外门禁	1001	1
6808	2022-02-25 09:49:49	信息机房外门禁	1002	1
6811	2022-02-25 11:12:51	信息机房外门禁	1001	1
6814	2022-02-25 11:12:55	信息机房外门禁	1002	1
6816	2022-02-25 13:54:39	信息机房外门禁	1001	1
6820	2022-02-25 13:54:43	信息机房外门禁	1002	1
6822	2022-03-01 11:52:11	信息机房外门禁	1001	1
6825	2022-03-01 11:52:14	信息机房外门禁	1002	1
6829	2022-03-01 20:01:21	信息机房外门禁	1002	1
6832	2022-03-01 20:01:24	信息机房外门禁	1001	1
6835	2022-03-01 20:56:16	信息机房外门禁	1002	1
6838	2022-03-01 20:56:27	信息机房外门禁	1001	1
6840	2022-03-01 20:58:24	信息机房外门禁	1002	1
6844	2022-03-01 20:58:28	信息机房外门禁	1001	1
6847	2022-03-01 21:10:33	信息机房外门禁	1002	1
6850	2022-03-01 21:10:40	信息机房外门禁	1001	1
6853	2022-03-01 21:11:55	信息机房外门禁	1002	1
6856	2022-03-01 21:11:58	信息机房外门禁	1001	1
6858	2022-03-01 21:13:35	信息机房外门禁	0	1
6862	2022-03-01 21:13:38	信息机房外门禁	1002	1
6864	2022-03-01 21:13:42	信息机房外门禁	0	1
6868	2022-03-01 21:13:52	信息机房外门禁	1001	1
6871	2022-03-01 21:16:22	信息机房外门禁	1002	1
6873	2022-03-01 21:16:25	信息机房外门禁	1001	1
6877	2022-03-01 21:18:42	信息机房外门禁	1002	1
6880	2022-03-01 21:18:47	信息机房外门禁	0	1
6883	2022-03-01 21:18:49	信息机房外门禁	0	1
6886	2022-03-01 21:18:51	信息机房外门禁	0	1
6888	2022-03-01 21:18:54	信息机房外门禁	1002	1
6892	2022-03-01 21:18:56	信息机房外门禁	0	1
6894	2022-03-01 21:18:58	信息机房外门禁	0	1
6898	2022-03-01 21:19:01	信息机房外门禁	0	1
6901	2022-03-01 21:19:03	信息机房外门禁	0	1
6904	2022-03-01 21:19:06	信息机房外门禁	0	1
6907	2022-03-01 21:19:07	信息机房外门禁	0	1
6909	2022-03-01 21:19:11	信息机房外门禁	0	1
6912	2022-03-01 21:20:23	信息机房外门禁	0	1
6914	2022-03-01 21:20:26	信息机房外门禁	1001	1
6916	2022-03-01 21:20:28	信息机房外门禁	1002	1
6918	2022-03-03 08:10:26	信息机房外门禁	0	1
6920	2022-03-03 08:10:31	信息机房外门禁	1002	1
6922	2022-03-03 08:10:34	信息机房外门禁	1001	1
6924	2022-03-05 11:50:33	信息机房外门禁	0	1
6926	2022-03-05 11:50:36	信息机房外门禁	1002	1
6928	2022-03-05 11:50:39	信息机房外门禁	1001	1
6930	2022-03-05 17:36:42	信息机房外门禁	0	1
6932	2022-03-05 17:36:45	信息机房外门禁	1002	1
6934	2022-03-05 17:36:47	信息机房外门禁	1001	1
6936	2022-03-07 15:55:47	信息机房外门禁	1002	1
6938	2022-03-07 15:55:50	信息机房外门禁	1001	1
6940	2022-03-09 09:46:49	信息机房外门禁	1002	1
6942	2022-03-09 09:46:53	信息机房外门禁	1001	1
6944	2022-03-09 09:50:34	信息机房外门禁	1002	1
6946	2022-03-09 09:50:53	信息机房外门禁	1001	1
6948	2022-03-09 09:51:40	信息机房外门禁	0	1
6950	2022-03-09 09:51:42	信息机房外门禁	0	1
6952	2022-03-09 09:51:46	信息机房外门禁	1002	1
6954	2022-03-09 09:51:48	信息机房外门禁	1001	1
6956	2022-03-09 09:54:42	信息机房外门禁	1002	1
6958	2022-03-09 09:54:46	信息机房外门禁	1001	1
6960	2022-03-09 09:57:15	信息机房外门禁	1002	1
6962	2022-03-09 09:57:17	信息机房外门禁	1001	1
6964	2022-03-09 09:59:44	信息机房外门禁	1002	1
6966	2022-03-09 09:59:58	信息机房外门禁	1001	1
6968	2022-03-09 10:01:59	信息机房外门禁	0	1
6970	2022-03-09 10:02:02	信息机房外门禁	0	1
6972	2022-03-09 10:02:05	信息机房外门禁	1002	1
6974	2022-03-09 10:02:08	信息机房外门禁	1001	1
6976	2022-03-09 10:04:09	信息机房外门禁	1002	1
6978	2022-03-09 10:04:11	信息机房外门禁	1001	1
6980	2022-03-09 10:05:58	信息机房外门禁	1002	1
6982	2022-03-09 10:06:00	信息机房外门禁	1001	1
6984	2022-03-09 11:14:19	信息机房外门禁	1002	1
6986	2022-03-09 11:14:21	信息机房外门禁	1001	1
6988	2022-03-09 11:16:14	信息机房外门禁	1002	1
6990	2022-03-09 11:16:17	信息机房外门禁	1001	1
6992	2022-03-09 11:18:36	信息机房外门禁	1002	1
6994	2022-03-09 11:18:38	信息机房外门禁	1001	1
6996	2022-03-09 11:20:56	信息机房外门禁	1002	1
6998	2022-03-09 11:20:59	信息机房外门禁	1001	1
7000	2022-03-09 11:22:44	信息机房外门禁	1001	1
7002	2022-03-09 11:22:46	信息机房外门禁	1002	1
7004	2022-03-09 11:25:08	信息机房外门禁	1001	1
7006	2022-03-09 11:25:11	信息机房外门禁	1002	1
7008	2022-03-09 11:27:28	信息机房外门禁	1001	1
7010	2022-03-09 11:27:30	信息机房外门禁	0	1
7012	2022-03-09 11:27:33	信息机房外门禁	1002	1
7014	2022-03-09 11:29:22	信息机房外门禁	1001	1
7016	2022-03-09 11:29:25	信息机房外门禁	1002	1
7018	2022-03-09 11:31:24	信息机房外门禁	1002	1
7020	2022-03-09 11:31:26	信息机房外门禁	1001	1
7022	2022-03-09 11:33:39	信息机房外门禁	1002	1
7024	2022-03-09 11:33:43	信息机房外门禁	0	1
7026	2022-03-09 11:33:46	信息机房外门禁	0	1
7028	2022-03-09 11:33:49	信息机房外门禁	0	1
7030	2022-03-09 11:33:53	信息机房外门禁	1002	1
7032	2022-03-09 11:33:56	信息机房外门禁	0	1
7034	2022-03-09 11:33:59	信息机房外门禁	1002	1
7036	2022-03-09 11:34:02	信息机房外门禁	0	1
7038	2022-03-09 11:34:04	信息机房外门禁	1002	1
7040	2022-03-09 11:34:07	信息机房外门禁	0	1
7042	2022-03-09 11:34:09	信息机房外门禁	1002	1
7044	2022-03-09 11:34:14	信息机房外门禁	0	1
7046	2022-03-09 11:34:16	信息机房外门禁	1002	1
7048	2022-03-09 11:34:19	信息机房外门禁	0	1
6945	2022-03-09 10:48:50	密钥机房外门禁	1007	1
6947	2022-03-09 10:50:58	密钥机房外门禁	1006	1
6949	2022-03-09 10:51:01	密钥机房外门禁	1007	1
6951	2022-03-09 10:52:04	密钥机房外门禁	1006	1
6953	2022-03-09 10:52:09	密钥机房外门禁	1007	1
6955	2022-03-09 10:53:49	密钥机房外门禁	1006	1
6957	2022-03-09 10:53:54	密钥机房外门禁	1007	1
6959	2022-03-09 10:56:13	密钥机房外门禁	1007	1
6961	2022-03-09 10:56:15	密钥机房外门禁	1006	1
6963	2022-03-09 10:57:54	密钥机房外门禁	1007	1
6965	2022-03-09 10:57:57	密钥机房外门禁	1006	1
6967	2022-03-09 10:59:39	密钥机房外门禁	1007	1
6969	2022-03-09 10:59:42	密钥机房外门禁	1006	1
6971	2022-03-09 11:00:59	密钥机房外门禁	1006	1
6973	2022-03-09 11:01:01	密钥机房外门禁	1007	1
6975	2022-03-09 11:02:19	密钥机房外门禁	1006	1
6977	2022-03-09 11:02:23	密钥机房外门禁	1007	1
6979	2022-03-09 11:04:09	密钥机房外门禁	1006	1
6981	2022-03-09 11:04:12	密钥机房外门禁	1007	1
6983	2022-03-09 11:06:14	密钥机房外门禁	1006	1
6985	2022-03-09 11:06:17	密钥机房外门禁	1007	1
6987	2022-03-09 11:08:29	密钥机房外门禁	1006	1
6989	2022-03-09 11:08:32	密钥机房外门禁	1007	1
6991	2022-03-12 15:46:12	密钥机房外门禁	0	1
6993	2022-03-12 15:46:15	密钥机房外门禁	0	1
6995	2022-03-24 09:27:12	密钥机房外门禁	1000328	1
6997	2022-03-24 09:27:15	密钥机房外门禁	1000333	1
6999	2022-03-24 10:59:01	密钥机房外门禁	1000143	1
7001	2022-03-24 11:07:57	密钥机房外门禁	1000763	1
7003	2022-03-24 11:08:04	密钥机房外门禁	1000763	1
7005	2022-03-24 13:38:57	密钥机房外门禁	1000333	1
7007	2022-03-24 13:39:39	密钥机房外门禁	1000328	1
7009	2022-03-24 13:39:42	密钥机房外门禁	1000333	1
7011	2022-03-24 18:02:35	密钥机房外门禁	1000328	1
7013	2022-03-24 18:02:38	密钥机房外门禁	1000333	1
7015	2022-03-24 18:11:59	密钥机房外门禁	1000328	1
7017	2022-03-24 18:12:02	密钥机房外门禁	1000333	1
7019	2022-03-25 10:25:29	密钥机房外门禁	1000333	1
7021	2022-03-25 10:25:36	密钥机房外门禁	1000328	1
7023	2022-03-25 10:28:10	密钥机房外门禁	1000333	1
7025	2022-03-25 10:28:13	密钥机房外门禁	1000328	1
7027	2022-03-25 11:03:20	密钥机房外门禁	1000328	1
7029	2022-03-25 11:03:23	密钥机房外门禁	1000333	1
7031	2022-03-25 15:43:19	密钥机房外门禁	1000328	1
7033	2022-03-25 15:43:26	密钥机房外门禁	1000333	1
7035	2022-03-25 15:44:13	密钥机房外门禁	1000328	1
7037	2022-03-25 15:44:18	密钥机房外门禁	1000333	1
7039	2022-03-25 15:45:12	密钥机房外门禁	1000328	1
7041	2022-03-25 15:45:14	密钥机房外门禁	1000333	1
7043	2022-03-25 15:45:36	密钥机房外门禁	1000328	1
7045	2022-03-25 15:47:32	密钥机房外门禁	1000328	1
7047	2022-03-25 15:47:35	密钥机房外门禁	1000333	1
7049	2022-03-25 15:49:00	密钥机房外门禁	1000328	1
7051	2022-03-25 15:49:04	密钥机房外门禁	1000333	1
7053	2022-03-25 15:52:23	密钥机房外门禁	1000328	1
7055	2022-03-25 15:52:26	密钥机房外门禁	1000333	1
7057	2022-03-25 15:55:57	密钥机房外门禁	1000328	1
7059	2022-03-25 15:56:00	密钥机房外门禁	1000333	1
7061	2022-03-25 15:58:37	密钥机房外门禁	1000328	1
7063	2022-03-25 15:58:39	密钥机房外门禁	1000333	1
7065	2022-03-25 16:01:28	密钥机房外门禁	2	1
7067	2022-03-25 16:02:35	密钥机房外门禁	10003281	1
7069	2022-03-25 16:02:40	密钥机房外门禁	10003281	1
7071	2022-03-25 16:02:45	密钥机房外门禁	10003281	1
7073	2022-03-25 16:02:50	密钥机房外门禁	10003281	1
7075	2022-03-25 16:02:55	密钥机房外门禁	10003281	1
7077	2022-03-25 16:03:00	密钥机房外门禁	10003281	1
7079	2022-03-25 16:03:32	密钥机房外门禁	1010	1
7081	2022-03-25 16:03:37	密钥机房外门禁	0	1
7083	2022-03-25 16:03:44	密钥机房外门禁	0	1
7085	2022-03-25 16:03:47	密钥机房外门禁	0	1
7087	2022-03-25 16:03:49	密钥机房外门禁	0	1
7089	2022-03-25 16:03:52	密钥机房外门禁	0	1
7091	2022-03-25 16:03:54	密钥机房外门禁	0	1
7093	2022-03-25 16:03:57	密钥机房外门禁	0	1
7095	2022-03-25 18:52:56	密钥机房外门禁	1000333	1
7097	2022-03-25 18:53:00	密钥机房外门禁	1000328	1
7099	2022-03-26 15:37:30	密钥机房外门禁	1000333	1
7101	2022-03-26 15:37:33	密钥机房外门禁	1000328	1
7103	2022-03-26 16:45:32	密钥机房外门禁	1000328	1
7105	2022-03-26 16:45:35	密钥机房外门禁	1000333	1
7107	2022-03-26 17:01:35	密钥机房外门禁	1000328	1
7109	2022-03-26 17:01:38	密钥机房外门禁	1000333	1
7111	2022-03-26 17:21:33	密钥机房外门禁	1000328	1
7113	2022-03-26 17:21:35	密钥机房外门禁	1000333	1
7115	2022-03-26 18:30:58	密钥机房外门禁	1000328	1
7117	2022-03-26 18:31:08	密钥机房外门禁	1000333	1
7119	2022-03-26 18:31:14	密钥机房外门禁	1000328	1
7121	2022-03-26 18:31:22	密钥机房外门禁	1000328	1
7123	2022-03-26 18:31:27	密钥机房外门禁	1000333	1
7125	2022-03-26 18:31:42	密钥机房外门禁	1000328	1
7127	2022-03-26 18:31:45	密钥机房外门禁	1000333	1
7129	2022-03-26 18:36:28	密钥机房外门禁	1000328	1
7131	2022-03-26 18:36:31	密钥机房外门禁	1000333	1
7133	2022-03-26 18:47:45	密钥机房外门禁	1000328	1
7135	2022-03-26 18:47:47	密钥机房外门禁	1000333	1
7137	2022-03-26 18:50:09	密钥机房外门禁	1000328	1
7139	2022-03-26 18:50:11	密钥机房外门禁	1000333	1
7141	2022-03-28 11:04:40	密钥机房外门禁	1000328	1
7143	2022-03-28 11:04:42	密钥机房外门禁	1000333	1
7050	2022-03-09 11:34:23	信息机房外门禁	1002	1
7052	2022-03-09 11:34:26	信息机房外门禁	0	1
7054	2022-03-09 11:34:43	信息机房外门禁	0	1
7056	2022-03-09 11:34:46	信息机房外门禁	1001	1
7058	2022-03-09 11:34:48	信息机房外门禁	0	1
7060	2022-03-09 11:34:52	信息机房外门禁	1001	1
7062	2022-03-09 11:34:55	信息机房外门禁	0	1
7064	2022-03-09 11:34:58	信息机房外门禁	1001	1
7066	2022-03-09 11:35:00	信息机房外门禁	0	1
7068	2022-03-09 11:35:03	信息机房外门禁	1001	1
7070	2022-03-09 11:35:05	信息机房外门禁	0	1
7072	2022-03-09 11:35:08	信息机房外门禁	1001	1
7074	2022-03-09 11:35:10	信息机房外门禁	0	1
7076	2022-03-09 11:35:12	信息机房外门禁	1001	1
7078	2022-03-09 11:35:14	信息机房外门禁	0	1
7080	2022-03-09 11:35:17	信息机房外门禁	1001	1
7082	2022-03-09 11:35:18	信息机房外门禁	0	1
7084	2022-03-09 11:35:21	信息机房外门禁	1001	1
7086	2022-03-09 11:35:23	信息机房外门禁	0	1
7088	2022-03-09 11:35:27	信息机房外门禁	1001	1
7090	2022-03-09 11:35:29	信息机房外门禁	0	1
7092	2022-03-09 11:35:32	信息机房外门禁	1001	1
7094	2022-03-24 09:31:44	信息机房外门禁	1001	1
7096	2022-03-24 09:31:46	信息机房外门禁	1002	1
7098	2022-03-24 09:55:08	信息机房外门禁	1001	1
7100	2022-03-24 09:55:11	信息机房外门禁	1002	1
7102	2022-03-24 11:01:49	信息机房外门禁	0	1
7104	2022-03-24 11:10:08	信息机房外门禁	0	1
7106	2022-03-24 13:44:08	信息机房外门禁	1002	1
7108	2022-03-24 13:44:11	信息机房外门禁	1001	1
7110	2022-03-26 15:48:32	信息机房外门禁	1002	1
7112	2022-03-26 15:48:34	信息机房外门禁	1001	1
7114	2022-03-26 16:55:32	信息机房外门禁	1002	1
7116	2022-03-26 16:55:43	信息机房外门禁	1001	1
7118	2022-03-28 14:03:12	信息机房外门禁	0	1
7120	2022-03-28 14:03:14	信息机房外门禁	1002	1
7122	2022-03-28 14:03:17	信息机房外门禁	1001	1
7124	2022-03-30 11:19:38	信息机房外门禁	1002	1
7126	2022-03-30 11:19:41	信息机房外门禁	1001	1
7128	2022-03-31 15:58:43	信息机房外门禁	1002	1
7130	2022-03-31 15:58:45	信息机房外门禁	1001	1
7132	2022-04-14 09:31:02	信息机房外门禁	0	1
7134	2022-04-14 09:31:04	信息机房外门禁	1002	1
7136	2022-04-14 09:31:06	信息机房外门禁	1001	1
7138	2022-04-14 09:58:58	信息机房外门禁	1001	1
7140	2022-04-14 09:59:02	信息机房外门禁	0	1
7142	2022-04-14 09:59:05	信息机房外门禁	0	1
7144	2022-04-14 09:59:08	信息机房外门禁	0	1
7146	2022-04-14 09:59:12	信息机房外门禁	1002	1
7148	2022-04-14 10:05:28	信息机房外门禁	1002	1
7150	2022-04-14 10:05:31	信息机房外门禁	1001	1
7152	2022-04-19 10:49:35	信息机房外门禁	1005	1
7154	2022-04-19 10:49:38	信息机房外门禁	1001	1
7156	2022-04-19 14:10:00	信息机房外门禁	1005	1
7158	2022-04-19 14:10:04	信息机房外门禁	1001	1
7160	2022-04-21 14:00:28	信息机房外门禁	1005	1
7162	2022-04-21 14:00:31	信息机房外门禁	1001	1
7164	2022-04-25 16:36:40	信息机房外门禁	1001	1
7166	2022-04-25 16:36:42	信息机房外门禁	1005	1
7168	2022-04-29 10:39:25	信息机房外门禁	1008	1
7170	2022-04-29 10:40:22	信息机房外门禁	1008	1
7172	2022-04-29 10:40:24	信息机房外门禁	1001	1
7174	2022-04-29 15:14:04	信息机房外门禁	1008	1
7176	2022-04-29 15:14:07	信息机房外门禁	1001	1
7178	2022-04-29 15:27:35	信息机房外门禁	1008	1
7180	2022-04-29 15:27:37	信息机房外门禁	1001	1
7182	2022-05-06 15:57:18	信息机房外门禁	1008	1
7184	2022-05-06 15:57:20	信息机房外门禁	1001	1
7186	2022-05-10 13:51:55	信息机房外门禁	1001	1
7188	2022-05-10 13:51:58	信息机房外门禁	1008	1
7190	2022-05-11 16:22:40	信息机房外门禁	1008	1
7192	2022-05-11 16:22:42	信息机房外门禁	1001	1
7194	2022-05-13 15:15:56	信息机房外门禁	1008	1
7196	2022-05-13 15:15:57	信息机房外门禁	1001	1
7198	2022-05-13 17:02:27	信息机房外门禁	1008	1
7200	2022-05-13 17:02:30	信息机房外门禁	1001	1
7202	2022-05-17 17:58:51	信息机房外门禁	1008	1
7204	2022-05-17 17:58:53	信息机房外门禁	1001	1
7206	2022-05-17 18:12:31	信息机房外门禁	1008	1
7208	2022-05-17 18:12:33	信息机房外门禁	1001	1
7210	2022-05-17 18:23:59	信息机房外门禁	1008	1
7212	2022-05-17 18:24:02	信息机房外门禁	1001	1
7214	2022-05-18 14:01:07	信息机房外门禁	1008	1
7216	2022-05-18 14:01:10	信息机房外门禁	1001	1
7218	2022-05-19 11:54:28	信息机房外门禁	1008	1
7220	2022-05-19 11:54:30	信息机房外门禁	1001	1
7222	2022-05-19 11:57:29	信息机房外门禁	1008	1
7224	2022-05-19 11:57:31	信息机房外门禁	1001	1
7226	2022-05-19 13:51:09	信息机房外门禁	1008	1
7228	2022-05-19 13:51:11	信息机房外门禁	1001	1
7230	2022-05-19 14:38:48	信息机房外门禁	1001	1
7232	2022-05-19 14:38:52	信息机房外门禁	0	1
7234	2022-05-19 14:38:55	信息机房外门禁	1006	1
7236	2022-05-19 15:31:45	信息机房外门禁	1008	1
7238	2022-05-19 15:31:47	信息机房外门禁	1001	1
7240	2022-05-25 17:12:58	信息机房外门禁	1008	1
7242	2022-05-25 17:13:00	信息机房外门禁	1001	1
7244	2022-05-27 17:29:06	信息机房外门禁	1008	1
7246	2022-05-27 17:29:08	信息机房外门禁	1001	1
7248	2022-05-27 20:54:10	信息机房外门禁	1008	1
7250	2022-05-27 20:54:12	信息机房外门禁	1001	1
7252	2022-05-27 23:05:55	信息机房外门禁	1008	1
7254	2022-05-27 23:05:57	信息机房外门禁	1001	1
7256	2022-05-27 23:50:35	信息机房外门禁	1008	1
7258	2022-05-27 23:50:37	信息机房外门禁	1001	1
7260	2022-05-28 14:42:45	信息机房外门禁	1008	1
7262	2022-05-28 14:42:47	信息机房外门禁	1001	1
7145	2022-03-28 12:03:26	密钥机房外门禁	1000328	1
7147	2022-03-28 12:03:28	密钥机房外门禁	1000333	1
7149	2022-03-28 13:25:45	密钥机房外门禁	1000328	1
7151	2022-03-28 13:25:47	密钥机房外门禁	1000333	1
7153	2022-03-28 13:27:57	密钥机房外门禁	1000143	1
7155	2022-03-28 13:28:07	密钥机房外门禁	1000763	1
7157	2022-03-28 13:37:58	密钥机房外门禁	1000328	1
7159	2022-03-28 13:38:01	密钥机房外门禁	1000333	1
7161	2022-03-29 12:07:17	密钥机房外门禁	2	1
7163	2022-03-29 16:33:48	密钥机房外门禁	1006	1
7165	2022-03-29 16:33:51	密钥机房外门禁	1007	1
7167	2022-04-14 09:12:29	密钥机房外门禁	1006	1
7169	2022-04-14 09:12:32	密钥机房外门禁	1007	1
7171	2022-04-14 09:40:17	密钥机房外门禁	1006	1
7173	2022-04-14 09:40:19	密钥机房外门禁	1007	1
7175	2022-04-19 11:29:46	密钥机房外门禁	1007	1
7177	2022-04-19 11:29:48	密钥机房外门禁	1006	1
7179	2022-04-19 11:44:10	密钥机房外门禁	1006	1
7181	2022-04-19 11:44:12	密钥机房外门禁	1007	1
7183	2022-04-25 16:24:55	密钥机房外门禁	1007	1
7185	2022-04-25 16:24:57	密钥机房外门禁	1006	1
7187	2022-04-25 16:58:00	密钥机房外门禁	1007	1
7189	2022-04-25 16:58:03	密钥机房外门禁	1006	1
7191	2022-05-19 16:12:29	密钥机房外门禁	1006	1
7193	2022-05-19 16:12:31	密钥机房外门禁	1006	1
7195	2022-05-19 16:12:37	密钥机房外门禁	1007	1
7197	2022-05-19 16:12:59	密钥机房外门禁	1006	1
7199	2022-05-19 16:13:04	密钥机房外门禁	1007	1
7201	2022-05-19 16:13:22	密钥机房外门禁	1006	1
7203	2022-05-19 16:13:25	密钥机房外门禁	1007	1
7205	2022-05-19 16:18:32	密钥机房外门禁	1007	1
7207	2022-05-19 16:18:35	密钥机房外门禁	1006	1
7209	2022-06-30 16:58:03	密钥机房外门禁	1006	1
7211	2022-06-30 16:58:06	密钥机房外门禁	1007	1
7213	2022-07-01 16:14:11	密钥机房外门禁	1006	1
7215	2022-07-01 16:14:14	密钥机房外门禁	1007	1
7217	2022-07-04 16:50:15	密钥机房外门禁	1007	1
7219	2022-07-04 16:50:16	密钥机房外门禁	1006	1
7221	2022-07-05 16:25:29	密钥机房外门禁	1006	1
7223	2022-07-05 16:25:32	密钥机房外门禁	1007	1
7225	2022-07-06 16:18:02	密钥机房外门禁	1006	1
7227	2022-07-06 16:18:05	密钥机房外门禁	1007	1
7229	2022-07-07 08:43:43	密钥机房外门禁	1007	1
7231	2022-07-07 08:43:46	密钥机房外门禁	1006	1
7233	2022-07-07 10:53:54	密钥机房外门禁	1007	1
7235	2022-07-07 10:53:56	密钥机房外门禁	1006	1
7237	2022-09-22 17:02:24	密钥机房外门禁	1007	1
7239	2022-09-22 17:02:26	密钥机房外门禁	1006	1
7241	2022-11-24 11:37:29	密钥机房外门禁	1006	1
7243	2022-11-24 11:37:35	密钥机房外门禁	1007	1
7245	2022-11-24 11:39:29	密钥机房外门禁	1007	1
7247	2022-11-24 11:39:31	密钥机房外门禁	1006	1
7249	2022-11-24 11:43:37	密钥机房外门禁	1007	1
7251	2022-11-24 11:43:41	密钥机房外门禁	1006	1
7253	2022-12-29 15:10:44	密钥机房外门禁	1007	1
7255	2022-12-29 15:10:46	密钥机房外门禁	1006	1
7257	2023-01-09 11:17:18	密钥机房外门禁	1	1
7259	2023-01-09 11:49:33	密钥机房外门禁	1	1
7261	2023-01-09 11:49:35	密钥机房外门禁	11	1
7263	2023-01-09 11:55:24	密钥机房外门禁	1	1
7265	2023-01-09 11:55:26	密钥机房外门禁	11	1
7267	2023-01-09 11:57:11	密钥机房外门禁	1	1
7269	2023-01-09 11:57:14	密钥机房外门禁	11	1
7271	2023-01-09 12:10:54	密钥机房外门禁	1	1
7273	2023-01-09 12:10:56	密钥机房外门禁	11	1
7275	2023-01-09 16:21:41	密钥机房外门禁	1	1
7277	2023-01-09 16:21:44	密钥机房外门禁	11	1
7279	2023-01-09 16:51:22	密钥机房外门禁	1007	1
7281	2023-01-09 16:52:28	密钥机房外门禁	1006	1
7283	2023-01-09 16:55:33	密钥机房外门禁	1007	1
7285	2023-01-09 16:55:36	密钥机房外门禁	1003	1
7287	2023-01-09 16:57:32	密钥机房外门禁	1003	1
7289	2023-01-09 16:57:38	密钥机房外门禁	1007	1
7291	2023-01-09 16:59:32	密钥机房外门禁	1003	1
7293	2023-01-09 16:59:39	密钥机房外门禁	1007	1
7295	2023-01-09 17:09:01	密钥机房外门禁	0	1
7297	2023-01-09 17:09:03	密钥机房外门禁	0	1
7299	2023-01-09 17:09:08	密钥机房外门禁	0	1
7301	2023-01-09 17:09:11	密钥机房外门禁	0	1
7303	2023-01-09 17:09:13	密钥机房外门禁	0	1
7305	2023-01-09 17:09:16	密钥机房外门禁	0	1
7307	2023-01-09 17:09:20	密钥机房外门禁	0	1
7309	2023-01-09 17:09:22	密钥机房外门禁	0	1
7311	2023-02-06 15:04:02	密钥机房外门禁	1003	1
7313	2023-02-06 15:04:06	密钥机房外门禁	1007	1
7315	2023-02-06 15:04:09	密钥机房外门禁	1003	1
7317	2023-02-06 15:09:31	密钥机房外门禁	1003	1
7319	2023-02-06 15:09:39	密钥机房外门禁	1007	1
7646	2023-02-10 15:20:05	信息机房外门禁	1002	1
7647	2023-02-10 15:20:07	信息机房外门禁	1001	1
7652	2023-02-13 14:24:40	信息机房外门禁	0	1
7653	2023-02-13 14:24:43	信息机房外门禁	1002	1
7654	2023-02-13 14:24:46	信息机房外门禁	1001	1
7657	2023-02-16 14:54:54	信息机房外门禁	1002	1
7658	2023-02-16 14:54:59	信息机房外门禁	1001	1
7661	2023-02-21 14:20:06	信息机房外门禁	1002	1
7662	2023-02-21 14:21:41	信息机房外门禁	1001	1
7663	2023-02-21 14:21:47	信息机房外门禁	1002	1
7665	2023-02-21 14:42:06	信息机房内门禁	1002	1
7668	2023-02-24 15:53:43	信息机房内门禁	1002	1
7669	2023-02-24 15:53:45	信息机房内门禁	1001	1
7674	2023-02-26 12:52:12	信息机房内门禁	1001	1
7675	2023-02-26 12:52:14	信息机房内门禁	1008	1
7678	2023-02-26 13:58:09	信息机房外门禁	1008	1
7679	2023-02-26 13:58:11	信息机房外门禁	1001	1
7680	2023-02-26 13:58:17	信息机房外门禁	1001	1
7264	2022-05-28 14:51:14	信息机房外门禁	1008	1
7266	2022-05-28 14:51:17	信息机房外门禁	1001	1
7268	2022-05-28 15:19:22	信息机房外门禁	1008	1
7270	2022-05-28 15:19:24	信息机房外门禁	1001	1
7272	2022-05-30 11:45:14	信息机房外门禁	1008	1
7274	2022-05-30 11:45:16	信息机房外门禁	1001	1
7276	2022-05-30 14:00:33	信息机房外门禁	1008	1
7278	2022-05-30 14:00:35	信息机房外门禁	1001	1
7280	2022-05-30 16:37:06	信息机房外门禁	1008	1
7282	2022-05-30 16:37:07	信息机房外门禁	1001	1
7284	2022-05-31 08:10:03	信息机房外门禁	1008	1
7286	2022-05-31 08:10:05	信息机房外门禁	1001	1
7288	2022-05-31 09:06:38	信息机房外门禁	1005	1
7290	2022-05-31 09:06:41	信息机房外门禁	1001	1
7292	2022-06-01 15:45:17	信息机房外门禁	1008	1
7294	2022-06-01 15:45:19	信息机房外门禁	1001	1
7296	2022-06-02 13:43:15	信息机房外门禁	1008	1
7298	2022-06-02 13:43:17	信息机房外门禁	1001	1
7300	2022-06-04 11:45:58	信息机房外门禁	1008	1
7302	2022-06-04 11:46:01	信息机房外门禁	1001	1
7304	2022-06-06 08:15:45	信息机房外门禁	1001	1
7306	2022-06-06 08:15:48	信息机房外门禁	1008	1
7308	2022-06-06 15:12:56	信息机房外门禁	1008	1
7310	2022-06-06 15:12:58	信息机房外门禁	1001	1
7312	2022-06-07 09:54:24	信息机房外门禁	1008	1
7314	2022-06-07 09:54:26	信息机房外门禁	1001	1
7316	2022-06-08 19:06:56	信息机房外门禁	1008	1
7318	2022-06-08 19:06:58	信息机房外门禁	1001	1
7320	2022-06-09 08:16:21	信息机房外门禁	1008	1
7321	2022-06-09 08:16:23	信息机房外门禁	1001	1
7322	2022-06-09 08:25:45	信息机房外门禁	1008	1
7323	2022-06-09 08:25:47	信息机房外门禁	1001	1
7324	2022-06-09 08:43:30	信息机房外门禁	1008	1
7325	2022-06-09 08:43:35	信息机房外门禁	1001	1
7326	2022-06-09 10:15:50	信息机房外门禁	1008	1
7327	2022-06-09 10:15:52	信息机房外门禁	1001	1
7328	2022-06-09 10:25:07	信息机房外门禁	1008	1
7329	2022-06-09 10:25:10	信息机房外门禁	1001	1
7330	2022-06-09 10:53:11	信息机房外门禁	1008	1
7331	2022-06-09 10:53:13	信息机房外门禁	1001	1
7332	2022-06-15 17:01:36	信息机房外门禁	1008	1
7333	2022-06-15 17:01:39	信息机房外门禁	1001	1
7334	2022-06-16 18:19:28	信息机房外门禁	1008	1
7335	2022-06-16 18:19:30	信息机房外门禁	1001	1
7336	2022-06-17 11:05:59	信息机房外门禁	1008	1
7337	2022-06-17 11:06:01	信息机房外门禁	1001	1
7338	2022-06-17 17:08:52	信息机房外门禁	1008	1
7339	2022-06-17 17:08:54	信息机房外门禁	1001	1
7340	2022-06-18 18:18:13	信息机房外门禁	1008	1
7341	2022-06-18 18:18:15	信息机房外门禁	1001	1
7342	2022-06-19 11:02:56	信息机房外门禁	1008	1
7343	2022-06-19 11:02:59	信息机房外门禁	1001	1
7344	2022-06-20 09:08:19	信息机房外门禁	1008	1
7345	2022-06-20 09:08:21	信息机房外门禁	1001	1
7346	2022-06-23 10:05:48	信息机房外门禁	1008	1
7347	2022-06-23 10:05:50	信息机房外门禁	1001	1
7348	2022-06-23 10:30:00	信息机房外门禁	1008	1
7349	2022-06-23 10:30:02	信息机房外门禁	1001	1
7350	2022-06-29 11:33:04	信息机房外门禁	1008	1
7351	2022-06-29 11:33:06	信息机房外门禁	1001	1
7352	2022-06-30 11:24:50	信息机房外门禁	1008	1
7353	2022-06-30 11:24:52	信息机房外门禁	1001	1
7354	2022-06-30 12:19:52	信息机房外门禁	1008	1
7355	2022-06-30 12:19:54	信息机房外门禁	1001	1
7356	2022-06-30 12:46:46	信息机房外门禁	1008	1
7357	2022-06-30 12:46:50	信息机房外门禁	1001	1
7358	2022-06-30 17:01:26	信息机房外门禁	0	1
7359	2022-06-30 17:01:28	信息机房外门禁	0	1
7360	2022-06-30 17:01:35	信息机房外门禁	1006	1
7361	2022-06-30 17:01:38	信息机房外门禁	1001	1
7362	2022-06-30 18:51:47	信息机房外门禁	1006	1
7363	2022-06-30 18:51:50	信息机房外门禁	1001	1
7364	2022-07-01 11:25:53	信息机房外门禁	1008	1
7365	2022-07-01 11:25:55	信息机房外门禁	1001	1
7366	2022-07-01 14:47:08	信息机房外门禁	1008	1
7367	2022-07-01 14:47:09	信息机房外门禁	1001	1
7368	2022-07-01 15:11:50	信息机房外门禁	1008	1
7369	2022-07-01 15:11:52	信息机房外门禁	1001	1
7370	2022-07-01 16:13:59	信息机房外门禁	1006	1
7371	2022-07-01 16:14:01	信息机房外门禁	1001	1
7372	2022-07-05 16:14:12	信息机房外门禁	1001	1
7373	2022-07-05 16:14:16	信息机房外门禁	1006	1
7374	2022-07-05 16:35:13	信息机房外门禁	1001	1
7375	2022-07-05 16:35:15	信息机房外门禁	1006	1
7376	2022-07-06 16:19:04	信息机房外门禁	1006	1
7377	2022-07-06 16:19:06	信息机房外门禁	1001	1
7378	2022-07-07 11:03:27	信息机房外门禁	1006	1
7379	2022-07-07 11:03:34	信息机房外门禁	1001	1
7380	2022-07-08 10:32:04	信息机房外门禁	1006	1
7381	2022-07-08 10:32:10	信息机房外门禁	1001	1
7382	2022-07-08 13:21:24	信息机房外门禁	1008	1
7383	2022-07-08 13:21:26	信息机房外门禁	1001	1
7384	2022-07-15 10:04:49	信息机房外门禁	1008	1
7385	2022-07-15 10:04:52	信息机房外门禁	1001	1
7386	2022-07-15 14:20:16	信息机房外门禁	1008	1
7387	2022-07-15 14:20:18	信息机房外门禁	1001	1
7388	2022-07-15 15:17:56	信息机房外门禁	1008	1
7389	2022-07-15 15:17:58	信息机房外门禁	1001	1
7390	2022-07-15 15:31:24	信息机房外门禁	1008	1
7391	2022-07-15 15:31:26	信息机房外门禁	1001	1
7392	2022-07-15 15:45:26	信息机房外门禁	1008	1
7393	2022-07-15 15:45:28	信息机房外门禁	1001	1
7394	2022-07-15 18:51:09	信息机房外门禁	1008	1
7395	2022-07-15 18:51:12	信息机房外门禁	1001	1
7396	2022-07-19 13:40:50	信息机房外门禁	0	1
7397	2022-07-19 13:40:54	信息机房外门禁	2	1
7398	2022-07-19 13:42:26	信息机房外门禁	1005	1
7399	2022-07-19 13:42:36	信息机房外门禁	1001	1
7400	2022-07-19 13:51:10	信息机房外门禁	1001	1
7401	2022-07-19 13:51:14	信息机房外门禁	1003	1
7402	2022-07-19 13:51:23	信息机房外门禁	1006	1
7403	2022-07-19 13:52:39	信息机房外门禁	1003	1
7404	2022-07-19 13:52:43	信息机房外门禁	0	1
7405	2022-07-19 13:52:48	信息机房外门禁	1006	1
7406	2022-07-20 09:59:12	信息机房外门禁	1008	1
7407	2022-07-20 09:59:14	信息机房外门禁	1001	1
7408	2022-07-20 10:03:39	信息机房外门禁	1008	1
7409	2022-07-20 10:03:41	信息机房外门禁	1001	1
7410	2022-07-20 15:49:49	信息机房外门禁	1008	1
7411	2022-07-20 15:49:51	信息机房外门禁	1001	1
7412	2022-07-22 09:10:25	信息机房外门禁	1008	1
7413	2022-07-22 09:10:28	信息机房外门禁	1001	1
7414	2022-07-22 10:01:18	信息机房外门禁	1008	1
7415	2022-07-22 10:01:19	信息机房外门禁	1001	1
7416	2022-07-22 13:35:43	信息机房外门禁	1008	1
7417	2022-07-22 13:35:44	信息机房外门禁	1001	1
7418	2022-07-23 16:38:49	信息机房外门禁	1008	1
7419	2022-07-23 16:38:51	信息机房外门禁	1001	1
7420	2022-07-23 18:51:30	信息机房外门禁	1008	1
7421	2022-07-23 18:51:32	信息机房外门禁	1001	1
7422	2022-07-24 07:21:47	信息机房外门禁	1008	1
7423	2022-07-24 07:21:48	信息机房外门禁	1001	1
7424	2022-07-29 15:35:42	信息机房外门禁	1008	1
7425	2022-07-29 15:35:45	信息机房外门禁	1001	1
7426	2022-08-02 15:29:00	信息机房外门禁	1008	1
7427	2022-08-02 15:29:02	信息机房外门禁	1001	1
7428	2022-08-02 15:35:45	信息机房外门禁	1008	1
7429	2022-08-02 15:35:46	信息机房外门禁	1001	1
7430	2022-08-02 16:01:44	信息机房外门禁	1008	1
7431	2022-08-02 16:01:46	信息机房外门禁	1001	1
7432	2022-08-02 16:19:53	信息机房外门禁	1008	1
7433	2022-08-02 16:19:56	信息机房外门禁	1001	1
7434	2022-08-03 13:39:23	信息机房外门禁	1008	1
7435	2022-08-03 13:39:25	信息机房外门禁	1001	1
7436	2022-08-08 15:24:09	信息机房外门禁	0	1
7437	2022-08-08 15:24:12	信息机房外门禁	0	1
7438	2022-08-08 15:24:14	信息机房外门禁	1006	1
7439	2022-08-08 15:25:58	信息机房外门禁	1006	1
7440	2022-08-08 15:26:01	信息机房外门禁	1001	1
7441	2022-08-15 16:11:51	信息机房外门禁	0	1
7442	2022-08-15 16:13:37	信息机房外门禁	1006	1
7443	2022-08-15 16:13:39	信息机房外门禁	1001	1
7444	2022-08-15 16:32:48	信息机房外门禁	1001	1
7445	2022-08-15 16:32:51	信息机房外门禁	1006	1
7446	2022-08-16 16:45:48	信息机房外门禁	1008	1
7447	2022-08-16 16:45:50	信息机房外门禁	1001	1
7448	2022-08-19 16:44:50	信息机房外门禁	1006	1
7449	2022-08-19 16:44:52	信息机房外门禁	1001	1
7450	2022-08-22 10:56:20	信息机房外门禁	1006	1
7451	2022-08-22 10:56:33	信息机房外门禁	1001	1
7452	2022-08-22 13:53:29	信息机房外门禁	1008	1
7453	2022-08-22 13:53:31	信息机房外门禁	1001	1
7454	2022-08-24 15:03:11	信息机房外门禁	1006	1
7455	2022-08-24 15:03:18	信息机房外门禁	1001	1
7456	2022-08-26 16:32:38	信息机房外门禁	1008	1
7457	2022-08-26 16:32:40	信息机房外门禁	1001	1
7458	2022-08-26 17:08:19	信息机房外门禁	1001	1
7459	2022-08-26 17:08:23	信息机房外门禁	1006	1
7460	2022-08-31 09:40:40	信息机房外门禁	1006	1
7461	2022-08-31 09:41:01	信息机房外门禁	1001	1
7462	2022-08-31 09:41:07	信息机房外门禁	1006	1
7463	2022-08-31 09:43:12	信息机房外门禁	1006	1
7464	2022-08-31 09:43:15	信息机房外门禁	1001	1
7465	2022-09-06 18:26:29	信息机房外门禁	1006	1
7466	2022-09-06 18:26:41	信息机房外门禁	1001	1
7467	2022-09-09 14:02:59	信息机房外门禁	0	1
7468	2022-09-09 14:03:01	信息机房外门禁	1006	1
7469	2022-09-09 14:03:13	信息机房外门禁	1001	1
7470	2022-09-14 08:27:32	信息机房外门禁	1006	1
7471	2022-09-14 08:27:46	信息机房外门禁	1001	1
7472	2022-09-14 08:27:52	信息机房外门禁	0	1
7473	2022-09-14 08:27:54	信息机房外门禁	0	1
7474	2022-09-14 08:27:56	信息机房外门禁	1006	1
7475	2022-09-16 09:39:26	信息机房外门禁	1006	1
7476	2022-09-16 09:39:39	信息机房外门禁	1001	1
7477	2022-09-19 14:11:06	信息机房外门禁	1006	1
7478	2022-09-19 14:11:08	信息机房外门禁	1001	1
7479	2022-09-21 09:59:34	信息机房外门禁	1006	1
7480	2022-09-21 09:59:36	信息机房外门禁	1001	1
7481	2022-09-21 14:17:38	信息机房外门禁	1006	1
7482	2022-09-21 14:17:41	信息机房外门禁	1001	1
7483	2022-09-27 09:23:57	信息机房外门禁	1006	1
7484	2022-09-27 09:24:16	信息机房外门禁	1001	1
7485	2022-09-27 09:31:13	信息机房外门禁	1001	1
7486	2022-09-27 09:31:17	信息机房外门禁	0	1
7487	2022-09-27 09:31:19	信息机房外门禁	1006	1
7488	2022-09-30 14:21:46	信息机房外门禁	0	1
7489	2022-09-30 14:21:47	信息机房外门禁	0	1
7490	2022-09-30 14:21:49	信息机房外门禁	0	1
7491	2022-09-30 14:21:52	信息机房外门禁	1006	1
7492	2022-09-30 14:21:55	信息机房外门禁	1001	1
7493	2022-10-08 14:57:05	信息机房外门禁	1001	1
7494	2022-10-08 14:57:08	信息机房外门禁	1006	1
7495	2022-10-08 15:01:34	信息机房外门禁	1006	1
7496	2022-10-08 15:09:19	信息机房外门禁	1006	1
7497	2022-10-08 15:09:20	信息机房外门禁	1006	1
7498	2022-10-08 15:09:22	信息机房外门禁	1001	1
7499	2022-10-10 16:01:15	信息机房外门禁	0	1
7500	2022-10-10 16:01:17	信息机房外门禁	1006	1
7501	2022-10-10 16:01:37	信息机房外门禁	1001	1
7502	2022-10-14 15:27:04	信息机房外门禁	1006	1
7503	2022-10-14 15:27:23	信息机房外门禁	1001	1
7504	2022-10-16 10:26:43	信息机房外门禁	1008	1
7505	2022-10-16 10:26:45	信息机房外门禁	1001	1
7506	2022-10-16 11:06:52	信息机房外门禁	1008	1
7507	2022-10-16 11:06:54	信息机房外门禁	1001	1
7508	2022-10-16 14:35:15	信息机房外门禁	1008	1
7509	2022-10-16 14:35:18	信息机房外门禁	1001	1
7510	2022-10-17 16:31:02	信息机房外门禁	1006	1
7511	2022-10-17 16:31:58	信息机房外门禁	1001	1
7512	2022-10-21 09:06:53	信息机房外门禁	1006	1
7513	2022-10-21 09:07:08	信息机房外门禁	1001	1
7514	2022-10-24 15:41:05	信息机房外门禁	1006	1
7515	2022-10-24 15:41:19	信息机房外门禁	1001	1
7516	2022-10-27 15:43:21	信息机房外门禁	0	1
7517	2022-10-27 15:43:23	信息机房外门禁	1006	1
7518	2022-10-27 15:43:34	信息机房外门禁	1001	1
7519	2022-11-01 13:39:25	信息机房外门禁	1006	1
7520	2022-11-01 13:39:28	信息机房外门禁	1001	1
7521	2022-11-01 13:40:27	信息机房外门禁	1001	1
7522	2022-11-01 13:40:30	信息机房外门禁	1006	1
7523	2022-11-01 13:40:56	信息机房外门禁	1006	1
7524	2022-11-01 13:41:00	信息机房外门禁	1001	1
7525	2022-11-04 10:50:01	信息机房外门禁	1006	1
7526	2022-11-04 10:50:16	信息机房外门禁	1001	1
7527	2022-11-04 10:50:29	信息机房外门禁	1001	1
7528	2022-11-11 16:49:42	信息机房外门禁	1006	1
7529	2022-11-11 16:49:44	信息机房外门禁	1001	1
7530	2022-11-11 17:05:27	信息机房外门禁	1006	1
7531	2022-11-11 17:05:31	信息机房外门禁	1001	1
7532	2022-11-15 16:06:51	信息机房外门禁	1006	1
7533	2022-11-15 16:06:54	信息机房外门禁	1001	1
7534	2022-11-18 15:40:11	信息机房外门禁	1001	1
7535	2022-11-18 15:40:16	信息机房外门禁	1006	1
7536	2022-11-23 14:52:35	信息机房外门禁	1006	1
7537	2022-11-23 14:52:37	信息机房外门禁	1001	1
7538	2022-11-25 15:17:16	信息机房外门禁	1006	1
7539	2022-11-25 15:17:19	信息机房外门禁	1001	1
7540	2022-11-25 15:33:33	信息机房外门禁	0	1
7541	2022-11-25 15:33:35	信息机房外门禁	1006	1
7542	2022-11-25 15:33:37	信息机房外门禁	1006	1
7543	2022-11-25 15:33:39	信息机房外门禁	1001	1
7544	2022-11-25 15:33:40	信息机房外门禁	1001	1
7545	2022-11-29 13:34:57	信息机房外门禁	1006	1
7546	2022-11-29 13:35:12	信息机房外门禁	1001	1
7547	2022-11-30 15:23:41	信息机房外门禁	0	1
7548	2022-11-30 15:23:43	信息机房外门禁	0	1
7549	2022-11-30 15:23:44	信息机房外门禁	1006	1
7550	2022-11-30 15:23:48	信息机房外门禁	1001	1
7551	2022-12-04 13:10:44	信息机房外门禁	1008	1
7552	2022-12-04 13:10:46	信息机房外门禁	1001	1
7553	2022-12-04 16:31:04	信息机房外门禁	1008	1
7554	2022-12-04 16:31:07	信息机房外门禁	1001	1
7555	2022-12-06 10:48:33	信息机房外门禁	1001	1
7556	2022-12-06 10:48:36	信息机房外门禁	1006	1
7557	2022-12-07 15:49:46	信息机房外门禁	1008	1
7558	2022-12-07 15:49:48	信息机房外门禁	1001	1
7559	2022-12-09 16:03:53	信息机房外门禁	1008	1
7560	2022-12-09 16:03:56	信息机房外门禁	1001	1
7561	2022-12-09 16:12:54	信息机房外门禁	1008	1
7562	2022-12-09 16:12:56	信息机房外门禁	1001	1
7563	2022-12-12 16:25:28	信息机房外门禁	1006	1
7564	2022-12-12 16:25:31	信息机房外门禁	1001	1
7565	2022-12-16 16:02:31	信息机房外门禁	1006	1
7566	2022-12-16 16:02:32	信息机房外门禁	1006	1
7567	2022-12-16 16:02:34	信息机房外门禁	1001	1
7568	2022-12-26 15:06:03	信息机房外门禁	1006	1
7569	2022-12-26 15:06:06	信息机房外门禁	1001	1
7570	2022-12-29 15:21:13	信息机房外门禁	1006	1
7571	2022-12-29 15:21:27	信息机房外门禁	1001	1
7572	2023-01-06 11:36:30	信息机房外门禁	1008	1
7573	2023-01-06 11:36:32	信息机房外门禁	1001	1
7574	2023-01-07 20:28:45	信息机房外门禁	11	1
7575	2023-01-09 11:28:58	信息机房外门禁	11	1
7576	2023-01-09 11:29:23	信息机房外门禁	11	1
7577	2023-01-09 11:48:02	信息机房外门禁	11	1
7578	2023-01-09 11:48:07	信息机房外门禁	11	1
7579	2023-01-09 11:58:26	信息机房外门禁	11	1
7580	2023-01-09 11:58:29	信息机房外门禁	0	1
7581	2023-01-09 11:58:32	信息机房外门禁	0	1
7582	2023-01-09 11:58:33	信息机房外门禁	0	1
7583	2023-01-09 11:58:35	信息机房外门禁	0	1
7584	2023-01-09 11:58:40	信息机房外门禁	0	1
7585	2023-01-09 11:58:41	信息机房外门禁	0	1
7586	2023-01-09 11:58:45	信息机房外门禁	12	1
7587	2023-01-09 12:01:12	信息机房外门禁	11	1
7588	2023-01-09 12:01:17	信息机房外门禁	0	1
7589	2023-01-09 12:01:18	信息机房外门禁	0	1
7590	2023-01-09 12:01:19	信息机房外门禁	0	1
7591	2023-01-09 12:01:23	信息机房外门禁	12	1
7592	2023-01-09 12:06:54	信息机房外门禁	11	1
7593	2023-01-09 12:06:58	信息机房外门禁	12	1
7594	2023-01-09 12:07:58	信息机房外门禁	11	1
7595	2023-01-09 12:08:01	信息机房外门禁	12	1
7596	2023-01-09 12:09:21	信息机房外门禁	11	1
7597	2023-01-09 12:09:24	信息机房外门禁	12	1
7598	2023-01-09 14:36:08	信息机房外门禁	11	1
7599	2023-01-09 14:36:10	信息机房外门禁	12	1
7600	2023-01-09 16:15:44	信息机房外门禁	1001	1
7601	2023-01-09 16:15:54	信息机房外门禁	1008	1
7602	2023-01-09 16:20:35	信息机房外门禁	1	1
7603	2023-01-09 16:20:38	信息机房外门禁	11	1
7604	2023-01-09 16:35:06	信息机房外门禁	11	1
7605	2023-01-09 16:35:07	信息机房外门禁	11	1
7606	2023-01-09 16:35:10	信息机房外门禁	0	1
7607	2023-01-09 16:35:11	信息机房外门禁	0	1
7608	2023-01-09 16:35:14	信息机房外门禁	1	1
7609	2023-01-09 16:39:11	信息机房外门禁	1001	1
7610	2023-01-09 16:39:18	信息机房外门禁	1006	1
7611	2023-01-09 16:45:53	信息机房外门禁	1001	1
7612	2023-01-09 16:45:55	信息机房外门禁	1002	1
5267	2022-07-15 15:22:37	信息机房内门禁	1001	1
5272	2022-07-15 15:32:30	信息机房内门禁	1008	1
5275	2022-07-15 15:32:35	信息机房内门禁	1001	1
5280	2022-07-15 19:18:15	信息机房内门禁	1001	1
5283	2022-07-15 19:18:28	信息机房内门禁	1008	1
5288	2022-07-19 13:44:05	信息机房内门禁	1001	1
5291	2022-07-19 13:44:08	信息机房内门禁	1005	1
5296	2022-07-19 13:52:50	信息机房内门禁	1006	1
5300	2022-07-19 13:52:53	信息机房内门禁	1003	1
5303	2022-07-19 13:52:59	信息机房内门禁	1001	1
5307	2022-07-19 13:53:43	信息机房内门禁	1006	1
5311	2022-07-19 13:53:50	信息机房内门禁	1003	1
5315	2022-07-19 13:55:39	信息机房内门禁	0	1
5319	2022-07-19 13:55:41	信息机房内门禁	1006	1
5323	2022-07-19 13:55:45	信息机房内门禁	1003	1
5327	2022-07-20 10:03:36	信息机房内门禁	1008	1
5332	2022-07-20 10:03:38	信息机房内门禁	1001	1
5335	2022-07-20 10:11:14	信息机房内门禁	1001	1
5339	2022-07-20 10:11:16	信息机房内门禁	1008	1
5344	2022-07-20 15:59:23	信息机房内门禁	1001	1
5347	2022-07-20 15:59:27	信息机房内门禁	1008	1
5352	2022-07-22 14:24:40	信息机房内门禁	1008	1
5356	2022-07-22 14:24:43	信息机房内门禁	1001	1
5360	2022-07-23 19:03:33	信息机房内门禁	1008	1
5363	2022-07-23 19:03:35	信息机房内门禁	1001	1
5368	2022-07-29 15:44:37	信息机房内门禁	1008	1
5372	2022-07-29 15:44:39	信息机房内门禁	1001	1
5375	2022-08-02 15:32:57	信息机房内门禁	1008	1
5379	2022-08-02 15:32:59	信息机房内门禁	1001	1
5383	2022-08-02 16:16:06	信息机房内门禁	1008	1
5388	2022-08-02 16:16:08	信息机房内门禁	1001	1
5392	2022-08-02 16:33:19	信息机房内门禁	1008	1
5395	2022-08-02 16:33:22	信息机房内门禁	1001	1
5399	2022-08-03 13:42:23	信息机房内门禁	1008	1
5404	2022-08-03 13:42:26	信息机房内门禁	1001	1
5407	2022-08-08 15:28:19	信息机房内门禁	1001	1
5412	2022-08-08 15:28:25	信息机房内门禁	1006	1
5415	2022-08-15 16:18:41	信息机房内门禁	1001	1
5420	2022-08-15 16:18:44	信息机房内门禁	1006	1
5424	2022-08-15 16:44:03	信息机房内门禁	1001	1
5427	2022-08-15 16:44:06	信息机房内门禁	1006	1
5431	2022-08-16 17:26:13	信息机房内门禁	1008	1
5435	2022-08-16 17:26:15	信息机房内门禁	1001	1
5439	2022-08-22 11:01:13	信息机房内门禁	1006	1
5443	2022-08-22 11:01:18	信息机房内门禁	1001	1
5448	2022-08-22 13:56:19	信息机房内门禁	1008	1
5452	2022-08-22 13:56:21	信息机房内门禁	1001	1
5455	2022-08-24 15:29:05	信息机房内门禁	0	1
5459	2022-08-24 15:29:07	信息机房内门禁	1006	1
5463	2022-08-24 15:29:11	信息机房内门禁	1001	1
5467	2022-08-26 17:07:11	信息机房内门禁	1008	1
5472	2022-08-26 17:07:13	信息机房内门禁	1001	1
5475	2022-08-31 09:46:47	信息机房内门禁	1001	1
5479	2022-08-31 09:46:52	信息机房内门禁	1006	1
5484	2022-09-06 18:30:16	信息机房内门禁	1001	1
5488	2022-09-06 18:30:20	信息机房内门禁	0	1
5491	2022-09-06 18:30:22	信息机房内门禁	1006	1
5496	2022-09-09 14:05:34	信息机房内门禁	1006	1
5500	2022-09-09 14:07:39	信息机房内门禁	1001	1
5503	2022-09-09 14:07:45	信息机房内门禁	1006	1
5507	2022-09-16 09:50:58	信息机房内门禁	1001	1
5511	2022-09-16 09:51:01	信息机房内门禁	0	1
5515	2022-09-16 09:51:03	信息机房内门禁	1006	1
5519	2022-09-19 14:14:47	信息机房内门禁	1006	1
5523	2022-09-19 14:14:58	信息机房内门禁	1001	1
5528	2022-09-21 10:07:21	信息机房内门禁	1006	1
5531	2022-09-21 10:07:23	信息机房内门禁	1001	1
5536	2022-09-21 14:22:16	信息机房内门禁	1006	1
5540	2022-09-21 14:22:19	信息机房内门禁	1001	1
5543	2022-09-27 09:28:21	信息机房内门禁	1006	1
5548	2022-09-27 09:28:25	信息机房内门禁	1001	1
5551	2022-09-27 09:51:33	信息机房内门禁	1006	1
5556	2022-09-27 09:51:36	信息机房内门禁	1001	1
5560	2022-09-30 14:26:36	信息机房内门禁	1006	1
5563	2022-09-30 14:26:46	信息机房内门禁	1001	1
5568	2022-10-08 15:05:36	信息机房内门禁	1001	1
5572	2022-10-08 15:05:39	信息机房内门禁	1006	1
5576	2022-10-08 15:10:41	信息机房内门禁	1006	1
5580	2022-10-08 15:10:43	信息机房内门禁	1001	1
5584	2022-10-10 16:08:35	信息机房内门禁	1001	1
5588	2022-10-10 16:08:38	信息机房内门禁	1006	1
5591	2022-10-14 15:33:32	信息机房内门禁	1001	1
5596	2022-10-14 15:33:45	信息机房内门禁	0	1
5599	2022-10-14 15:33:47	信息机房内门禁	0	1
5603	2022-10-14 15:33:49	信息机房内门禁	1006	1
5607	2022-10-16 11:06:02	信息机房内门禁	1008	1
5612	2022-10-16 11:06:05	信息机房内门禁	1001	1
5616	2022-10-16 11:09:46	信息机房内门禁	1008	1
5620	2022-10-16 11:09:48	信息机房内门禁	1001	1
5623	2022-10-16 15:18:08	信息机房内门禁	1008	1
5627	2022-10-16 15:18:10	信息机房内门禁	1001	1
5631	2022-10-17 16:36:49	信息机房内门禁	1001	1
5636	2022-10-17 16:36:52	信息机房内门禁	0	1
5639	2022-10-17 16:36:54	信息机房内门禁	1006	1
5644	2022-10-21 09:12:10	信息机房内门禁	1001	1
5648	2022-10-21 09:12:18	信息机房内门禁	0	1
5651	2022-10-21 09:12:19	信息机房内门禁	1006	1
5655	2022-10-21 09:12:21	信息机房内门禁	1006	1
5659	2022-10-24 15:44:59	信息机房内门禁	0	1
5663	2022-10-24 15:45:01	信息机房内门禁	1006	1
5668	2022-10-24 15:45:17	信息机房内门禁	1001	1
5672	2022-10-27 15:46:58	信息机房内门禁	1006	1
5675	2022-10-27 15:47:06	信息机房内门禁	1001	1
5679	2022-11-01 13:45:46	信息机房内门禁	1001	1
5683	2022-11-01 13:45:51	信息机房内门禁	0	1
5688	2022-11-01 13:45:52	信息机房内门禁	0	1
5692	2022-11-01 13:45:53	信息机房内门禁	1006	1
7720	2023-03-13 15:56:44	信息机房外门禁	1002	1
7721	2023-03-13 16:20:34	信息机房内门禁	1002	1
7722	2023-03-13 16:20:42	信息机房内门禁	1001	1
7723	2023-03-13 16:34:59	信息机房外门禁	1001	1
7724	2023-03-13 16:34:59	信息机房外门禁	1001	1
7725	2023-03-13 16:35:02	信息机房外门禁	1002	1
7726	2023-03-13 16:54:31	信息机房内门禁	1002	1
7727	2023-03-13 16:55:13	信息机房内门禁	1001	1
7728	2023-03-14 10:46:01	信息机房外门禁	1002	1
7729	2023-03-14 10:46:07	信息机房外门禁	1001	1
7730	2023-03-14 10:55:28	信息机房内门禁	1002	1
7731	2023-03-14 10:55:41	信息机房内门禁	1001	1
7732	2023-03-14 10:55:41	信息机房内门禁	1001	1
7733	2023-03-17 10:09:47	信息机房外门禁	1002	1
7734	2023-03-17 10:09:49	信息机房外门禁	1001	1
7735	2023-03-17 10:23:04	信息机房内门禁	1001	1
7736	2023-03-17 10:23:09	信息机房内门禁	1002	1
7737	2023-03-17 10:23:09	信息机房内门禁	1002	1
7738	2023-03-22 09:30:46	信息机房外门禁	1002	1
7739	2023-03-22 09:30:49	信息机房外门禁	1001	1
7740	2023-03-22 09:38:27	信息机房内门禁	1002	1
7741	2023-03-22 09:38:38	信息机房内门禁	1001	1
7742	2023-03-24 09:42:22	密钥机房外门禁	1001	1
7743	2023-03-24 09:42:56	信息机房外门禁	2	1
7744	2023-03-24 09:46:09	信息机房外门禁	1001	1
7745	2023-03-24 09:46:12	信息机房外门禁	1002	1
7746	2023-03-24 09:51:06	信息机房内门禁	1002	1
7747	2023-03-24 09:51:10	信息机房内门禁	1001	1
7748	2023-03-24 18:42:54	信息机房外门禁	1008	1
7749	2023-03-24 18:42:57	信息机房外门禁	1001	1
7750	2023-03-24 18:50:49	信息机房内门禁	1008	1
7751	2023-03-24 18:50:52	信息机房内门禁	1001	1
7752	2023-03-29 13:57:35	信息机房外门禁	1001	1
7753	2023-03-29 13:57:38	信息机房外门禁	0	1
7754	2023-03-29 13:57:41	信息机房外门禁	1002	1
7755	2023-03-29 14:18:36	信息机房内门禁	1002	1
7756	2023-03-29 14:18:56	信息机房内门禁	1001	1
7757	2023-03-31 14:58:57	信息机房外门禁	1002	1
7758	2023-03-31 15:04:29	信息机房内门禁	1002	1
7759	2023-03-31 15:04:35	信息机房内门禁	1001	1
7760	2023-03-31 14:59:00	信息机房外门禁	1001	1
7761	2023-04-04 14:30:45	信息机房外门禁	1001	1
7762	2023-04-04 14:30:50	信息机房外门禁	1002	1
7763	2023-04-04 14:46:13	信息机房内门禁	1001	1
7764	2023-04-04 14:46:16	信息机房内门禁	1002	1
7765	2023-04-05 13:26:05	信息机房外门禁	1008	1
7766	2023-04-05 13:26:07	信息机房外门禁	1001	1
7767	2023-04-05 13:28:20	信息机房内门禁	1008	1
7768	2023-04-05 13:28:23	信息机房内门禁	1001	1
7769	2023-04-07 09:18:58	信息机房外门禁	1002	1
7770	2023-04-07 09:19:02	信息机房外门禁	1001	1
7771	2023-04-07 09:34:36	信息机房内门禁	1002	1
7772	2023-04-07 09:34:38	信息机房内门禁	1001	1
7773	2023-04-07 11:09:33	信息机房外门禁	1008	1
7774	2023-04-07 11:09:36	信息机房外门禁	1002	1
7775	2023-04-07 11:09:45	信息机房外门禁	1001	1
7776	2023-04-07 11:09:52	信息机房外门禁	1002	1
7777	2023-04-07 11:11:11	信息机房外门禁	1001	1
7778	2023-04-07 11:11:14	信息机房外门禁	1002	1
7779	2023-04-07 11:13:13	信息机房外门禁	1001	1
7780	2023-04-07 11:13:18	信息机房外门禁	1002	1
7781	2023-04-07 11:38:28	信息机房内门禁	1002	1
7782	2023-04-07 11:38:42	信息机房内门禁	1001	1
7783	2023-04-10 15:42:38	信息机房外门禁	1001	1
7784	2023-04-10 15:42:41	信息机房外门禁	1002	1
7785	2023-04-10 16:11:56	信息机房内门禁	1001	1
7786	2023-04-10 16:11:59	信息机房内门禁	1002	1
7787	2023-04-11 10:09:53	密钥机房外门禁	1000333	1
7788	2023-04-11 10:09:59	密钥机房外门禁	1007	1
7789	2023-04-11 10:11:54	密钥机房外门禁	1000333	1
7790	2023-04-11 10:11:57	密钥机房外门禁	1007	1
7791	2023-04-11 11:25:15	密钥机房内门禁	1007	1
7792	2023-04-11 11:25:18	密钥机房内门禁	1000333	1
7793	2023-04-11 13:50:27	密钥机房外门禁	1000143	1
7794	2023-04-11 13:51:36	密钥机房外门禁	1000333	1
7795	2023-04-11 13:51:40	密钥机房外门禁	1000328	1
7796	2023-04-11 13:57:38	CA机房外门禁	1000404	1
7797	2023-04-11 13:57:42	CA机房外门禁	10002411	1
7798	2023-04-11 13:57:57	CA机房外门禁	1000404	1
7799	2023-04-11 13:58:01	CA机房外门禁	1000241	1
7800	2023-04-11 14:00:49	CA机房内门禁	1000241	1
7801	2023-04-11 14:00:55	CA机房内门禁	1000404	1
7802	2023-04-11 15:11:34	密钥机房内门禁	1000333	1
7803	2023-04-11 15:11:36	密钥机房内门禁	1000328	1
7804	2023-04-11 15:11:36	密钥机房内门禁	1000328	1
7805	2023-04-11 15:14:23	CA机房外门禁	1000241	1
7806	2023-04-11 15:14:26	CA机房外门禁	1000404	1
7807	2023-04-11 15:14:26	CA机房外门禁	1000404	1
7808	2023-04-11 16:20:22	CA机房内门禁	1000241	1
7809	2023-04-11 16:20:22	CA机房内门禁	1000241	1
7810	2023-04-11 16:20:24	CA机房内门禁	1000404	1
7811	2023-04-11 17:20:34	信息机房外门禁	1008	1
7812	2023-04-11 17:20:37	信息机房外门禁	1001	1
7813	2023-04-11 17:23:43	信息机房内门禁	1008	1
7814	2023-04-11 17:23:45	信息机房内门禁	1001	1
7815	2023-04-11 17:29:03	CA机房外门禁	1000241	1
7816	2023-04-11 17:29:08	CA机房外门禁	1000404	1
7817	2023-04-11 18:18:50	CA机房内门禁	1000404	1
7818	2023-04-11 18:18:53	CA机房内门禁	1000241	1
7819	2023-04-12 10:06:21	信息机房外门禁	1001	1
7820	2023-04-12 10:06:23	信息机房外门禁	1002	1
7821	2023-04-12 10:22:07	信息机房内门禁	1002	1
7822	2023-04-12 10:22:44	信息机房内门禁	1001	1
7823	2023-04-13 10:44:57	密钥机房外门禁	1000333	1
7824	2023-04-13 10:45:05	密钥机房外门禁	1000328	1
7825	2023-04-13 11:32:49	密钥机房内门禁	1000333	1
7826	2023-04-13 11:32:54	密钥机房内门禁	1000328	1
7827	2023-04-13 12:46:01	密钥机房外门禁	1000333	1
7828	2023-04-13 12:46:05	密钥机房外门禁	1000328	1
7829	2023-04-13 16:07:42	密钥机房内门禁	1000333	1
7830	2023-04-13 16:07:45	密钥机房内门禁	1000328	1
7831	2023-04-17 15:32:45	信息机房外门禁	2	1
7832	2023-04-17 15:33:57	信息机房外门禁	0	1
7833	2023-04-17 15:34:00	信息机房外门禁	0	1
7834	2023-04-17 15:34:03	信息机房外门禁	1005	1
7835	2023-04-17 15:34:11	信息机房外门禁	1003	1
7836	2023-04-17 15:38:15	信息机房外门禁	1009	1
7837	2023-04-17 15:38:20	信息机房外门禁	1010	1
7838	2023-04-17 15:42:13	信息机房内门禁	1005	1
7839	2023-04-17 15:45:15	信息机房内门禁	1010	1
7840	2023-04-17 15:45:18	信息机房内门禁	1009	1
7841	2023-04-18 09:23:25	CA机房外门禁	1000241	1
7842	2023-04-18 09:23:28	CA机房外门禁	1000404	1
7843	2023-04-18 09:37:36	CA机房内门禁	1000241	1
7844	2023-04-18 09:37:40	CA机房内门禁	1000404	1
7845	2023-04-18 09:41:01	CA机房外门禁	1000241	1
7846	2023-04-18 09:41:04	CA机房外门禁	1000404	1
7847	2023-04-18 10:23:44	CA机房内门禁	1000241	1
7848	2023-04-18 10:23:46	CA机房内门禁	1000404	1
7849	2023-04-18 11:07:52	密钥机房外门禁	1003	1
7850	2023-04-18 11:07:55	密钥机房外门禁	1007	1
7851	2023-04-18 11:08:04	密钥机房外门禁	1003	1
7852	2023-04-18 11:08:13	密钥机房外门禁	1007	1
7853	2023-04-18 11:08:54	密钥机房外门禁	1003	1
7854	2023-04-18 11:08:58	密钥机房外门禁	1007	1
7855	2023-04-18 11:15:50	密钥机房内门禁	1007	1
7856	2023-04-18 11:15:53	密钥机房内门禁	1003	1
7857	2023-04-18 13:13:42	CA机房外门禁	1000404	1
7858	2023-04-18 13:13:46	CA机房外门禁	1000241	1
7859	2023-04-18 14:45:48	CA机房内门禁	1000404	1
7860	2023-04-18 14:45:51	CA机房内门禁	1000241	1
7861	2023-04-19 13:27:36	CA机房外门禁	1005	1
7862	2023-04-19 13:27:38	CA机房外门禁	1006	1
7863	2023-04-19 13:28:24	CA机房内门禁	1006	1
7864	2023-04-19 13:28:26	CA机房内门禁	1005	1
7865	2023-04-26 08:22:06	密钥机房外门禁	1007	1
7866	2023-04-26 08:22:08	密钥机房外门禁	1003	1
7867	2023-04-26 08:23:36	信息机房外门禁	1002	1
7868	2023-04-26 08:23:40	信息机房外门禁	1001	1
7869	2023-04-26 08:29:04	密钥机房内门禁	1007	1
7870	2023-04-26 08:29:08	密钥机房内门禁	1003	1
7871	2023-04-26 08:31:59	信息机房内门禁	1002	1
7872	2023-04-26 08:32:02	信息机房内门禁	1001	1
7873	2023-04-26 08:43:28	密钥机房外门禁	1007	1
7874	2023-04-26 08:43:30	密钥机房外门禁	1003	1
7875	2023-04-26 09:08:57	密钥机房内门禁	1007	1
7876	2023-04-26 09:09:00	密钥机房内门禁	1003	1
7877	2023-05-03 15:37:15	信息机房外门禁	1002	1
7878	2023-05-03 15:37:18	信息机房外门禁	1001	1
7879	2023-05-03 16:03:45	信息机房内门禁	1002	1
7880	2023-05-03 16:04:01	信息机房内门禁	1001	1
7881	2023-05-08 14:04:57	信息机房外门禁	1001	1
7882	2023-05-08 14:05:00	信息机房外门禁	1002	1
7883	2023-05-08 14:08:09	信息机房外门禁	1001	1
7884	2023-05-08 14:08:12	信息机房外门禁	1002	1
7885	2023-05-08 14:12:40	信息机房内门禁	1002	1
7886	2023-05-08 14:12:56	信息机房内门禁	1001	1
7887	2023-05-15 07:57:50	信息机房外门禁	1001	1
7888	2023-05-15 07:57:53	信息机房外门禁	1002	1
7889	2023-05-15 08:30:20	信息机房内门禁	1002	1
7890	2023-05-15 08:30:21	信息机房内门禁	1002	1
7891	2023-05-15 08:30:41	信息机房内门禁	1001	1
7892	2023-05-15 10:26:02	信息机房外门禁	1001	1
7893	2023-05-15 10:26:05	信息机房外门禁	1002	1
7894	2023-05-15 10:37:29	信息机房内门禁	1001	1
7895	2023-05-15 10:37:31	信息机房内门禁	1002	1
7896	2023-05-16 09:53:18	信息机房外门禁	1002	1
7897	2023-05-16 09:53:21	信息机房外门禁	1001	1
7898	2023-05-16 10:06:19	信息机房内门禁	0	1
7899	2023-05-16 10:06:27	信息机房内门禁	0	1
7900	2023-05-16 10:06:41	信息机房内门禁	0	1
7901	2023-05-16 10:06:45	信息机房内门禁	0	1
7902	2023-05-16 10:06:51	信息机房内门禁	0	1
7903	2023-05-16 10:06:54	信息机房内门禁	0	1
7904	2023-05-16 10:06:57	信息机房内门禁	0	1
7905	2023-05-16 10:06:59	信息机房内门禁	0	1
7906	2023-05-16 10:07:02	信息机房内门禁	0	1
7907	2023-05-16 10:07:19	信息机房内门禁	1001	1
7908	2023-05-16 10:07:23	信息机房内门禁	1002	1
7909	2023-05-16 10:07:10	CA机房外门禁	0	1
7910	2023-05-16 10:07:13	CA机房外门禁	0	1
7911	2023-05-16 10:07:21	CA机房外门禁	0	1
7912	2023-05-16 10:05:50	密钥机房外门禁	0	1
7913	2023-05-16 10:07:25	CA机房外门禁	0	1
7914	2023-05-16 10:07:28	CA机房外门禁	0	1
7915	2023-05-16 10:05:53	密钥机房外门禁	0	1
7916	2023-05-16 10:07:39	CA机房外门禁	0	1
7917	2023-05-16 10:05:57	密钥机房外门禁	0	1
7918	2023-05-16 10:06:02	密钥机房外门禁	0	1
7919	2023-05-16 10:06:02	密钥机房外门禁	0	1
7920	2023-05-16 10:06:27	密钥机房外门禁	0	1
7921	2023-05-16 10:06:28	密钥机房外门禁	0	1
7922	2023-05-16 10:06:30	密钥机房外门禁	0	1
7923	2023-05-16 10:06:31	密钥机房外门禁	0	1
7924	2023-05-16 10:06:33	密钥机房外门禁	0	1
7925	2023-05-16 10:06:36	密钥机房外门禁	0	1
7926	2023-05-16 10:06:40	密钥机房外门禁	0	1
7927	2023-05-16 10:06:40	密钥机房外门禁	0	1
7928	2023-05-26 13:49:19	信息机房外门禁	1002	1
7929	2023-05-26 13:49:35	信息机房外门禁	1001	1
7930	2023-05-26 14:03:12	信息机房内门禁	1001	1
7931	2023-05-26 14:03:29	信息机房内门禁	1001	1
7932	2023-05-29 11:15:11	密钥机房外门禁	1007	1
7933	2023-05-29 11:15:14	密钥机房外门禁	1003	1
7934	2023-05-29 11:19:18	密钥机房内门禁	1007	1
7935	2023-05-29 11:19:21	密钥机房内门禁	1003	1
7936	2023-05-29 14:20:53	密钥机房外门禁	0	1
7937	2023-05-29 14:20:56	密钥机房外门禁	0	1
7938	2023-05-29 14:21:01	密钥机房外门禁	0	1
7939	2023-05-29 14:21:05	密钥机房外门禁	0	1
7940	2023-05-29 14:21:08	密钥机房外门禁	0	1
7941	2023-05-29 14:21:13	密钥机房外门禁	0	1
7942	2023-05-29 14:24:33	CA机房外门禁	0	1
7943	2023-05-29 14:24:35	CA机房外门禁	0	1
7944	2023-05-29 14:24:39	CA机房外门禁	0	1
7945	2023-05-29 14:24:40	CA机房外门禁	0	1
7946	2023-05-29 14:24:44	CA机房外门禁	0	1
7947	2023-05-29 14:24:47	CA机房外门禁	0	1
7948	2023-05-29 14:24:49	CA机房外门禁	0	1
7949	2023-05-29 14:26:16	信息机房外门禁	1002	1
7950	2023-05-29 14:26:57	信息机房外门禁	1001	1
7951	2023-05-29 14:27:02	信息机房外门禁	1002	1
7952	2023-05-29 14:27:04	信息机房外门禁	1002	1
7953	2023-05-29 14:32:13	信息机房内门禁	1002	1
7954	2023-05-29 14:32:15	信息机房内门禁	1001	1
7955	2023-05-29 16:42:39	CA机房外门禁	2	1
7956	2023-05-30 18:33:42	信息机房外门禁	1002	1
7957	2023-05-30 18:34:13	信息机房外门禁	1001	1
7958	2023-05-30 18:58:30	信息机房内门禁	1002	1
7959	2023-05-30 18:58:45	信息机房内门禁	1001	1
7960	2023-05-31 10:37:42	信息机房外门禁	1002	1
7961	2023-05-31 10:37:44	信息机房外门禁	1001	1
7962	2023-05-31 10:44:29	信息机房内门禁	1001	1
7963	2023-05-31 10:44:36	信息机房内门禁	1002	1
7964	2023-05-31 17:30:37	密钥机房外门禁	1007	1
7965	2023-05-31 17:30:41	密钥机房外门禁	1003	1
7966	2023-05-31 18:10:55	密钥机房内门禁	1007	1
7967	2023-05-31 18:10:57	密钥机房内门禁	1003	1
7968	2023-06-01 17:22:03	密钥机房外门禁	1003	1
7969	2023-06-01 17:22:06	密钥机房外门禁	1007	1
7970	2023-06-01 17:22:38	密钥机房内门禁	1003	1
7971	2023-06-01 17:22:42	密钥机房内门禁	1007	1
7972	2023-06-01 17:24:56	密钥机房外门禁	1003	1
7973	2023-06-01 17:24:59	密钥机房外门禁	1007	1
7974	2023-06-01 17:25:15	密钥机房外门禁	1003	1
7975	2023-06-01 17:25:17	密钥机房外门禁	1007	1
7976	2023-06-01 17:25:17	密钥机房外门禁	1007	1
7977	2023-06-01 17:25:26	密钥机房外门禁	1007	1
7978	2023-06-01 17:25:28	密钥机房外门禁	1003	1
7979	2023-06-01 17:25:28	密钥机房外门禁	1003	1
7980	2023-06-01 17:25:34	密钥机房外门禁	1003	1
7981	2023-06-01 17:25:36	密钥机房外门禁	1007	1
7982	2023-06-01 17:25:41	密钥机房外门禁	1003	1
7983	2023-06-01 17:25:43	密钥机房外门禁	1007	1
7984	2023-06-09 10:26:17	信息机房外门禁	1002	1
7985	2023-06-09 10:26:36	信息机房外门禁	1001	1
7986	2023-06-09 10:26:36	信息机房外门禁	1001	1
7987	2023-06-09 10:39:01	信息机房内门禁	1001	1
7988	2023-06-09 10:39:08	信息机房内门禁	1002	1
7989	2023-06-13 08:44:56	信息机房外门禁	1002	1
7990	2023-06-13 08:44:59	信息机房外门禁	1001	1
7991	2023-06-13 08:52:18	信息机房内门禁	1002	1
7992	2023-06-13 08:52:21	信息机房内门禁	1001	1
7993	2023-06-28 10:46:49	信息机房外门禁	1001	1
7994	2023-06-28 10:46:51	信息机房外门禁	1002	1
7995	2023-06-28 11:02:53	信息机房内门禁	1001	1
7996	2023-06-28 11:02:56	信息机房内门禁	1002	1
7997	2023-07-07 10:17:22	信息机房外门禁	1001	1
7998	2023-07-07 10:28:03	信息机房内门禁	1002	1
7999	2023-07-07 10:28:25	信息机房内门禁	1001	1
8000	2023-07-07 10:17:24	信息机房外门禁	1002	1
8001	2023-07-11 09:33:36	信息机房外门禁	1002	1
8002	2023-07-11 09:33:37	信息机房外门禁	1002	1
8003	2023-07-11 09:33:39	信息机房外门禁	1001	1
8004	2023-07-11 09:45:29	信息机房内门禁	1001	1
8005	2023-07-11 09:45:29	信息机房内门禁	1001	1
8006	2023-07-11 09:45:33	信息机房内门禁	1002	1
8007	2023-07-11 09:45:35	信息机房内门禁	1002	1
8008	2023-07-11 11:37:45	信息机房外门禁	1002	1
8009	2023-07-11 11:37:47	信息机房外门禁	1001	1
8010	2023-07-11 11:46:42	信息机房内门禁	1002	1
8011	2023-07-11 11:46:45	信息机房内门禁	1001	1
8012	2023-07-18 11:02:18	信息机房外门禁	1002	1
8013	2023-07-18 11:02:20	信息机房外门禁	1001	1
8014	2023-07-18 11:16:20	信息机房内门禁	1001	1
8015	2023-07-18 11:16:23	信息机房内门禁	1002	1
8016	2023-07-28 10:23:35	信息机房外门禁	1002	1
8017	2023-07-28 10:23:39	信息机房外门禁	1001	1
8018	2023-07-28 10:29:01	信息机房内门禁	1001	1
8019	2023-07-28 10:29:04	信息机房内门禁	1002	1
8020	2023-08-10 09:31:46	信息机房外门禁	1002	1
8021	2023-08-10 09:32:06	信息机房外门禁	1001	1
8022	2023-08-10 09:32:06	信息机房外门禁	1001	1
8023	2023-08-10 10:08:29	信息机房内门禁	1002	1
8024	2023-08-10 10:08:58	信息机房内门禁	1001	1
8025	2023-08-17 11:01:19	信息机房外门禁	1001	1
8026	2023-08-17 11:01:22	信息机房外门禁	1002	1
8027	2023-08-17 11:18:41	信息机房内门禁	1002	1
8028	2023-08-17 11:18:41	信息机房内门禁	1002	1
8029	2023-08-17 11:18:43	信息机房内门禁	1001	1
8030	2023-08-17 13:49:58	信息机房外门禁	1002	1
8031	2023-08-17 13:50:01	信息机房外门禁	1001	1
8032	2023-08-17 13:50:01	信息机房外门禁	1001	1
8033	2023-08-17 13:57:10	信息机房内门禁	1001	1
8034	2023-08-17 13:57:14	信息机房内门禁	1002	1
8035	2023-08-17 13:59:23	信息机房外门禁	1001	1
8036	2023-08-17 13:59:26	信息机房外门禁	1002	1
8037	2023-08-17 14:09:22	信息机房内门禁	1002	1
8038	2023-08-17 14:09:30	信息机房内门禁	1001	1
8039	2023-08-23 09:36:58	信息机房外门禁	1002	1
8040	2023-08-23 09:37:00	信息机房外门禁	1001	1
8041	2023-08-23 09:54:24	信息机房内门禁	1002	1
8042	2023-08-23 09:54:27	信息机房内门禁	1001	1
8043	2023-08-30 08:52:26	信息机房外门禁	1001	1
8044	2023-08-30 08:52:29	信息机房外门禁	1002	1
8045	2023-08-30 08:52:29	信息机房外门禁	1002	1
8046	2023-08-30 09:38:06	信息机房内门禁	1001	1
8047	2023-08-30 09:38:11	信息机房内门禁	1002	1
8048	2023-09-01 13:46:18	信息机房外门禁	1001	1
8049	2023-09-01 13:46:21	信息机房外门禁	1002	1
8050	2023-09-01 13:57:46	信息机房内门禁	1001	1
8051	2023-09-01 13:57:49	信息机房内门禁	1002	1
8052	2023-09-05 15:33:34	信息机房外门禁	1002	1
8053	2023-09-05 15:33:37	信息机房外门禁	1001	1
8054	2023-09-05 16:21:12	信息机房内门禁	1002	1
8055	2023-09-05 16:21:35	信息机房内门禁	1001	1
8056	2023-09-08 15:22:26	信息机房外门禁	1002	1
8057	2023-09-08 15:22:30	信息机房外门禁	1001	1
8058	2023-09-08 15:37:48	信息机房内门禁	0	1
8059	2023-09-08 15:37:59	信息机房内门禁	1002	1
8060	2023-09-08 15:38:00	信息机房内门禁	1002	1
8061	2023-09-08 15:38:10	信息机房内门禁	1001	1
8062	2023-09-11 13:40:08	信息机房外门禁	1001	1
8063	2023-09-11 13:40:10	信息机房外门禁	1002	1
8064	2023-09-11 13:40:10	信息机房外门禁	1002	1
8065	2023-09-11 13:40:20	信息机房外门禁	1001	1
8066	2023-09-11 13:40:22	信息机房外门禁	1002	1
8067	2023-09-11 14:08:29	信息机房内门禁	1001	1
8068	2023-09-11 14:08:32	信息机房内门禁	1002	1
8069	2023-09-15 15:25:55	信息机房外门禁	1002	1
8070	2023-09-15 15:25:57	信息机房外门禁	1001	1
8071	2023-09-15 15:42:01	信息机房内门禁	1002	1
8072	2023-09-15 15:42:34	信息机房内门禁	1001	1
8073	2023-09-16 09:57:51	信息机房外门禁	0	1
8074	2023-09-16 09:57:54	信息机房外门禁	1002	1
8075	2023-09-16 09:57:56	信息机房外门禁	1001	1
8076	2023-09-16 10:04:30	信息机房内门禁	1002	1
8077	2023-09-16 10:04:34	信息机房内门禁	1001	1
8078	2023-09-16 10:10:21	信息机房外门禁	1002	1
8079	2023-09-16 10:10:23	信息机房外门禁	1001	1
8080	2023-09-16 10:20:22	信息机房内门禁	0	1
8081	2023-09-16 10:20:27	信息机房内门禁	1002	1
8082	2023-09-16 10:20:37	信息机房内门禁	1001	1
8083	2023-09-19 09:36:47	密钥机房外门禁	1003	1
8084	2023-09-19 09:36:50	密钥机房外门禁	1007	1
8085	2023-09-19 10:49:37	密钥机房内门禁	1003	1
8086	2023-09-19 10:49:41	密钥机房内门禁	0	1
8087	2023-09-19 10:49:48	密钥机房内门禁	1007	1
8088	2023-09-19 16:01:49	信息机房外门禁	1001	1
8089	2023-09-19 16:01:50	信息机房外门禁	1002	1
8090	2023-09-19 16:05:59	信息机房内门禁	0	1
8091	2023-09-19 16:06:02	信息机房内门禁	1001	1
8092	2023-09-19 16:06:03	信息机房内门禁	0	1
8093	2023-09-19 16:06:06	信息机房内门禁	1002	1
8094	2023-09-19 16:05:05	密钥机房外门禁	0	1
8095	2023-09-19 16:05:07	密钥机房外门禁	0	1
8096	2023-09-19 16:05:10	密钥机房外门禁	0	1
8097	2023-09-19 16:05:13	密钥机房外门禁	0	1
8098	2023-09-19 16:05:15	密钥机房外门禁	0	1
8099	2023-09-19 16:05:19	密钥机房外门禁	0	1
8100	2023-09-19 16:08:43	CA机房外门禁	0	1
8101	2023-09-19 16:08:45	CA机房外门禁	0	1
8102	2023-09-19 16:08:48	CA机房外门禁	0	1
8103	2023-09-19 16:08:50	CA机房外门禁	0	1
8104	2023-09-19 16:08:52	CA机房外门禁	0	1
8105	2023-09-19 16:08:56	CA机房外门禁	0	1
8106	2023-09-19 16:09:01	CA机房外门禁	0	1
8107	2023-09-19 16:10:41	信息机房外门禁	1002	1
8108	2023-09-19 16:10:44	信息机房外门禁	1001	1
8109	2023-09-19 16:12:50	信息机房内门禁	1002	1
8110	2023-09-19 16:12:54	信息机房内门禁	1001	1
8111	2023-09-20 16:21:26	信息机房外门禁	1002	1
8112	2023-09-20 16:21:29	信息机房外门禁	1001	1
8113	2023-09-20 16:26:44	信息机房内门禁	1001	1
8114	2023-09-20 16:26:45	信息机房内门禁	1002	1
8115	2023-09-26 16:56:14	信息机房外门禁	1002	1
8116	2023-09-26 16:56:21	信息机房外门禁	1001	1
8117	2023-09-27 16:39:15	信息机房外门禁	1002	1
8118	2023-09-27 16:41:55	信息机房外门禁	1002	1
8119	2023-09-27 16:41:58	信息机房外门禁	1001	1
8120	2023-09-27 17:00:11	信息机房内门禁	1001	1
8121	2023-09-27 17:00:14	信息机房内门禁	1002	1
8122	2023-10-09 10:11:06	信息机房外门禁	1001	1
8123	2023-10-09 10:11:11	信息机房外门禁	0	1
8124	2023-10-09 10:11:13	信息机房外门禁	1002	1
8125	2023-10-09 10:37:04	信息机房内门禁	1002	1
8126	2023-10-09 10:37:07	信息机房内门禁	1001	1
8127	2023-10-10 09:11:48	信息机房外门禁	0	1
8128	2023-10-10 09:11:52	信息机房外门禁	1002	1
8129	2023-10-10 09:11:55	信息机房外门禁	1001	1
8130	2023-10-10 09:11:55	信息机房外门禁	1001	1
8131	2023-10-10 09:52:42	信息机房内门禁	1002	1
8132	2023-10-10 09:52:47	信息机房内门禁	1001	1
8133	2023-10-17 09:07:08	信息机房外门禁	1002	1
8134	2023-10-17 09:07:18	信息机房外门禁	1001	1
8135	2023-10-17 09:11:31	信息机房内门禁	1001	1
8136	2023-10-17 09:11:36	信息机房内门禁	1002	1
8137	2023-10-17 09:20:04	密钥机房外门禁	1007	1
8138	2023-10-17 09:20:10	密钥机房外门禁	1003	1
8139	2023-10-17 10:03:11	密钥机房内门禁	1003	1
8140	2023-10-17 10:03:17	密钥机房内门禁	1007	1
8141	2023-10-17 14:51:14	信息机房外门禁	1002	1
8142	2023-10-17 14:51:17	信息机房外门禁	1001	1
8143	2023-10-17 15:16:43	信息机房内门禁	1001	1
8144	2023-10-17 15:16:48	信息机房内门禁	1002	1
8145	2023-10-18 14:00:00	密钥机房外门禁	1003	1
8146	2023-10-18 14:00:03	密钥机房外门禁	1007	1
8147	2023-10-18 14:13:37	密钥机房内门禁	1007	1
8148	2023-10-18 14:13:39	密钥机房内门禁	1003	1
8149	2023-10-20 10:09:10	信息机房外门禁	1002	1
8150	2023-10-20 10:09:13	信息机房外门禁	1001	1
8151	2023-10-20 10:14:53	信息机房内门禁	1002	1
8152	2023-10-20 10:14:53	信息机房内门禁	1002	1
8153	2023-10-20 10:14:55	信息机房内门禁	1001	1
8154	2023-10-27 13:47:53	信息机房外门禁	1002	1
8155	2023-10-27 13:47:58	信息机房外门禁	1001	1
8156	2023-10-27 13:57:05	信息机房内门禁	1001	1
8157	2023-10-27 13:57:08	信息机房内门禁	1002	1
8158	2023-11-03 13:40:59	信息机房外门禁	1001	1
8159	2023-11-03 13:41:01	信息机房外门禁	1002	1
8160	2023-11-03 13:51:04	信息机房内门禁	1002	1
8161	2023-11-03 13:51:05	信息机房内门禁	1002	1
8162	2023-11-03 13:51:08	信息机房内门禁	1001	1
8163	2023-11-10 09:37:28	信息机房外门禁	1002	1
8164	2023-11-10 09:37:28	信息机房外门禁	1002	1
8165	2023-11-10 09:37:30	信息机房外门禁	1001	1
8166	2023-11-10 09:55:27	信息机房内门禁	1001	1
8167	2023-11-10 09:55:31	信息机房内门禁	1002	1
8168	2023-11-23 15:20:46	信息机房外门禁	1002	1
8169	2023-11-23 15:20:50	信息机房外门禁	1001	1
8170	2023-11-23 15:43:32	信息机房内门禁	1002	1
8171	2023-11-23 15:43:35	信息机房内门禁	1001	1
8172	2023-11-23 15:43:35	信息机房内门禁	1001	1
8173	2023-11-30 14:47:02	信息机房外门禁	1002	1
8174	2023-11-30 14:47:05	信息机房外门禁	1001	1
8175	2023-11-30 15:01:43	信息机房内门禁	1002	1
8176	2023-11-30 15:01:46	信息机房内门禁	1001	1
8177	2023-12-04 10:44:59	信息机房外门禁	1001	1
8178	2023-12-04 10:45:01	信息机房外门禁	1002	1
8179	2023-12-04 10:50:13	信息机房内门禁	1002	1
8180	2023-12-04 10:50:13	信息机房内门禁	1002	1
8181	2023-12-04 10:50:17	信息机房内门禁	1001	1
8182	2023-12-19 15:33:52	信息机房外门禁	1002	1
8183	2023-12-19 15:33:56	信息机房外门禁	1001	1
8184	2023-12-19 15:50:50	信息机房内门禁	1002	1
8185	2023-12-19 15:50:51	信息机房内门禁	0	1
8186	2023-12-19 15:50:54	信息机房内门禁	1002	1
8187	2023-12-19 15:51:14	信息机房内门禁	1001	1
8188	2023-12-25 09:05:07	信息机房外门禁	1002	1
8189	2023-12-25 09:06:41	信息机房外门禁	1001	1
8190	2023-12-25 09:06:47	信息机房外门禁	1002	1
8191	2023-12-25 09:06:48	信息机房外门禁	1002	1
8192	2023-12-25 09:17:31	信息机房内门禁	1002	1
8193	2023-12-25 09:17:39	信息机房内门禁	1001	1
8194	2024-01-04 09:47:25	信息机房外门禁	1001	1
8195	2024-01-04 09:47:26	信息机房外门禁	1002	1
8196	2024-01-04 09:57:34	信息机房内门禁	1002	1
8197	2024-01-04 09:57:38	信息机房内门禁	1001	1
8198	2024-01-04 10:09:04	密钥机房外门禁	0	1
8199	2024-01-04 10:10:33	CA机房外门禁	0	1
8200	2024-01-04 10:15:57	信息机房外门禁	1002	1
8201	2024-01-04 10:16:00	信息机房外门禁	1001	1
8202	2024-01-04 10:19:26	信息机房内门禁	1001	1
8203	2024-01-04 10:19:28	信息机房内门禁	1002	1
8204	2024-01-06 08:42:10	信息机房外门禁	1001	1
8205	2024-01-06 08:42:12	信息机房外门禁	1002	1
8206	2024-01-06 08:46:42	信息机房内门禁	1002	1
8207	2024-01-06 08:46:42	信息机房内门禁	1002	1
8208	2024-01-06 08:46:58	信息机房内门禁	1001	1
8209	2024-01-08 15:23:03	信息机房外门禁	1002	1
8210	2024-01-08 15:23:30	信息机房外门禁	1001	1
8211	2024-01-08 15:23:36	信息机房外门禁	1002	1
8212	2024-01-08 15:23:44	信息机房外门禁	1001	1
8213	2024-01-08 15:29:10	信息机房内门禁	1002	1
8214	2024-01-08 15:29:13	信息机房内门禁	1001	1
8215	2024-02-01 15:51:40	信息机房外门禁	1002	1
8216	2024-02-01 15:51:43	信息机房外门禁	1001	1
8217	2024-02-01 15:59:28	信息机房内门禁	1001	1
8218	2024-02-01 15:59:31	信息机房内门禁	1002	1
8219	2024-02-19 10:07:14	信息机房外门禁	1001	1
8220	2024-02-19 10:07:16	信息机房外门禁	1002	1
8221	2024-02-19 10:26:29	信息机房内门禁	1001	1
8222	2024-02-19 10:26:31	信息机房内门禁	1002	1
8223	2024-02-28 08:48:59	信息机房外门禁	1002	1
8224	2024-02-28 08:49:07	信息机房外门禁	1001	1
8225	2024-02-28 08:59:08	信息机房内门禁	1002	1
8226	2024-02-28 08:59:24	信息机房内门禁	1001	1
8227	2024-03-05 11:00:29	信息机房外门禁	1002	1
8228	2024-03-05 11:00:32	信息机房外门禁	1001	1
8229	2024-03-05 11:14:04	信息机房内门禁	1002	1
8230	2024-03-05 11:14:07	信息机房内门禁	1001	1
8231	2024-03-13 11:17:46	信息机房外门禁	1002	1
8232	2024-03-13 11:17:48	信息机房外门禁	1001	1
8233	2024-03-13 11:36:05	信息机房内门禁	1002	1
8234	2024-03-13 11:36:08	信息机房内门禁	1001	1
8235	2024-03-19 16:43:17	信息机房外门禁	1001	1
8236	2024-03-19 16:43:19	信息机房外门禁	1002	1
8237	2024-03-19 16:49:45	信息机房内门禁	1002	1
8238	2024-03-19 16:49:47	信息机房内门禁	1001	1
8239	2024-03-22 13:52:39	密钥机房外门禁	1003	1
8240	2024-03-22 13:52:41	密钥机房外门禁	1007	1
8241	2024-03-22 14:03:33	密钥机房内门禁	1003	1
8242	2024-03-22 14:03:33	密钥机房内门禁	1003	1
8243	2024-03-22 14:06:40	密钥机房内门禁	1003	1
8244	2024-03-22 14:06:48	密钥机房内门禁	1007	1
8245	2024-03-22 14:10:27	信息机房外门禁	0	1
8246	2024-03-22 14:10:31	信息机房外门禁	0	1
8247	2024-03-22 14:10:34	信息机房外门禁	1010	1
8248	2024-03-22 14:10:38	信息机房外门禁	1001	1
8249	2024-03-22 14:17:09	信息机房内门禁	1001	1
8250	2024-03-22 14:17:12	信息机房内门禁	1010	1
8251	2024-03-25 11:11:00	CA机房外门禁	1005	1
8252	2024-03-25 11:11:03	CA机房外门禁	1006	1
8253	2024-03-25 11:10:28	信息机房外门禁	1001	1
8254	2024-03-25 11:10:30	信息机房外门禁	1002	1
8255	2024-03-25 11:15:15	信息机房内门禁	1002	1
8256	2024-03-25 11:15:18	信息机房内门禁	1001	1
8257	2024-03-25 11:20:42	CA机房内门禁	1005	1
8258	2024-03-25 11:20:44	CA机房内门禁	1006	1
8259	2024-03-26 09:18:30	密钥机房外门禁	1007	1
8260	2024-03-26 09:18:33	密钥机房外门禁	1003	1
8261	2024-03-26 09:51:01	密钥机房内门禁	1003	1
8262	2024-03-26 09:51:03	密钥机房内门禁	1007	1
8263	2024-03-26 09:51:56	密钥机房外门禁	1003	1
8264	2024-03-26 09:51:58	密钥机房外门禁	1007	1
8265	2024-03-26 09:52:54	密钥机房内门禁	1007	1
8266	2024-03-26 09:52:58	密钥机房内门禁	1003	1
8267	2024-03-26 09:55:32	信息机房外门禁	1002	1
8268	2024-03-26 09:55:35	信息机房外门禁	1001	1
8269	2024-03-26 10:22:18	信息机房内门禁	1001	1
8270	2024-03-26 10:22:18	信息机房内门禁	1001	1
8271	2024-03-26 10:22:21	信息机房内门禁	1002	1
8272	2024-03-26 10:40:34	CA机房外门禁	1005	1
8273	2024-03-26 10:40:37	CA机房外门禁	1006	1
8274	2024-03-26 11:30:37	CA机房内门禁	1005	1
8275	2024-03-26 11:30:39	CA机房内门禁	1006	1
8276	2024-04-02 14:40:01	信息机房外门禁	1001	1
8277	2024-04-02 14:40:05	信息机房外门禁	1002	1
8278	2024-04-02 14:48:35	信息机房内门禁	1001	1
8279	2024-04-02 14:48:40	信息机房内门禁	1002	1
8280	2024-04-08 10:19:27	信息机房外门禁	1002	1
8281	2024-04-08 10:19:29	信息机房外门禁	1001	1
8282	2024-04-08 10:24:42	信息机房内门禁	1001	1
8283	2024-04-08 10:24:42	信息机房内门禁	1001	1
8284	2024-04-08 10:24:45	信息机房内门禁	1002	1
8285	2024-04-08 11:41:51	信息机房外门禁	1008	1
8286	2024-04-08 11:41:53	信息机房外门禁	1001	1
8287	2024-04-11 09:34:15	密钥机房外门禁	2	1
8288	2024-04-17 14:23:16	信息机房外门禁	1002	1
8289	2024-04-17 14:23:18	信息机房外门禁	1001	1
8290	2024-04-17 14:32:06	信息机房内门禁	1002	1
8291	2024-04-17 14:32:36	信息机房内门禁	1001	1
8292	2024-04-17 14:32:36	信息机房内门禁	1001	1
8293	2024-04-22 13:50:34	信息机房外门禁	1002	1
8294	2024-04-22 13:50:37	信息机房外门禁	1001	1
8295	2024-04-22 14:08:07	信息机房内门禁	1002	1
8296	2024-04-22 14:08:10	信息机房内门禁	1001	1
8297	2024-04-22 14:20:41	信息机房外门禁	1002	1
8298	2024-04-22 14:20:46	信息机房外门禁	1001	1
8299	2024-04-22 14:22:09	密钥机房外门禁	0	2
8300	2024-04-22 14:25:35	CA机房外门禁	0	1
8301	2024-04-22 14:25:42	CA机房外门禁	0	1
8302	2024-04-22 14:25:49	CA机房外门禁	0	1
8303	2024-04-22 14:25:50	CA机房外门禁	0	1
8304	2024-04-22 14:25:51	CA机房外门禁	0	1
8305	2024-04-22 14:25:57	CA机房外门禁	0	1
8306	2024-04-22 14:26:02	CA机房外门禁	0	1
8307	2024-04-22 14:26:12	CA机房外门禁	0	1
8308	2024-04-22 14:26:19	CA机房外门禁	0	1
8309	2024-04-22 14:26:26	CA机房外门禁	0	1
8310	2024-04-22 14:26:34	CA机房外门禁	0	1
8311	2024-04-22 14:26:41	CA机房外门禁	0	1
8312	2024-04-22 14:22:11	密钥机房外门禁	0	2
8313	2024-04-22 14:22:13	密钥机房外门禁	0	1
8314	2024-04-22 14:22:14	密钥机房外门禁	0	1
8315	2024-04-22 14:22:16	密钥机房外门禁	0	1
8316	2024-04-22 14:22:18	密钥机房外门禁	0	1
8317	2024-04-22 14:22:22	密钥机房外门禁	0	1
8318	2024-04-22 14:22:24	密钥机房外门禁	0	1
8319	2024-04-22 14:22:25	密钥机房外门禁	0	1
8320	2024-04-22 14:22:30	密钥机房外门禁	0	1
8321	2024-04-22 14:22:32	密钥机房外门禁	0	1
8322	2024-04-22 14:22:35	密钥机房外门禁	0	1
8323	2024-04-22 14:22:49	密钥机房外门禁	0	1
8324	2024-04-22 14:22:51	密钥机房外门禁	0	1
8325	2024-04-22 14:22:57	密钥机房外门禁	0	1
8326	2024-04-22 14:23:30	密钥机房外门禁	0	2
8327	2024-04-22 14:23:37	密钥机房外门禁	0	2
8328	2024-04-22 14:23:45	密钥机房外门禁	0	2
8329	2024-04-22 14:23:52	密钥机房外门禁	0	2
8330	2024-04-22 14:24:00	密钥机房外门禁	0	2
8331	2024-04-22 14:24:06	密钥机房外门禁	0	1
8332	2024-04-22 14:24:27	密钥机房外门禁	0	2
8333	2024-04-22 14:24:33	密钥机房外门禁	0	1
8334	2024-04-22 14:24:36	密钥机房外门禁	0	1
8335	2024-04-22 14:24:50	密钥机房外门禁	0	1
8336	2024-04-22 14:24:58	密钥机房外门禁	0	2
8337	2024-04-22 14:25:01	密钥机房外门禁	0	2
8338	2024-04-22 14:22:11	密钥机房外门禁	0	2
8339	2024-04-22 14:22:13	密钥机房外门禁	0	1
8340	2024-04-22 14:22:14	密钥机房外门禁	0	1
8341	2024-04-22 14:22:16	密钥机房外门禁	0	1
8342	2024-04-22 14:22:18	密钥机房外门禁	0	1
8343	2024-04-22 14:22:22	密钥机房外门禁	0	1
8344	2024-04-22 14:22:24	密钥机房外门禁	0	1
8345	2024-04-22 14:22:25	密钥机房外门禁	0	1
8346	2024-04-22 14:22:30	密钥机房外门禁	0	1
8347	2024-04-22 14:22:32	密钥机房外门禁	0	1
8348	2024-04-22 14:22:35	密钥机房外门禁	0	1
8349	2024-04-22 14:22:49	密钥机房外门禁	0	1
8350	2024-04-22 14:22:51	密钥机房外门禁	0	1
8351	2024-04-22 14:22:57	密钥机房外门禁	0	1
8352	2024-04-22 14:23:30	密钥机房外门禁	0	2
8353	2024-04-22 14:23:37	密钥机房外门禁	0	2
8354	2024-04-22 14:23:45	密钥机房外门禁	0	2
8355	2024-04-22 14:23:52	密钥机房外门禁	0	2
8356	2024-04-22 14:24:00	密钥机房外门禁	0	2
8357	2024-04-22 14:24:06	密钥机房外门禁	0	1
8358	2024-04-22 14:24:27	密钥机房外门禁	0	2
8359	2024-04-22 14:24:33	密钥机房外门禁	0	1
8360	2024-04-22 14:24:36	密钥机房外门禁	0	1
8361	2024-04-22 14:24:50	密钥机房外门禁	0	1
8362	2024-04-22 14:24:58	密钥机房外门禁	0	2
8363	2024-04-22 14:25:01	密钥机房外门禁	0	2
8364	2024-04-22 14:32:50	密钥机房外门禁	0	1
8365	2024-04-22 14:32:53	密钥机房外门禁	0	1
8366	2024-04-22 14:32:57	密钥机房外门禁	0	1
8367	2024-04-22 14:33:01	密钥机房外门禁	0	1
8368	2024-04-22 14:33:04	密钥机房外门禁	0	1
8369	2024-04-22 14:33:09	密钥机房外门禁	0	1
8370	2024-04-22 14:33:15	密钥机房外门禁	0	1
8371	2024-04-22 14:33:21	密钥机房外门禁	0	1
8372	2024-04-22 14:33:26	密钥机房外门禁	0	1
8373	2024-04-22 14:33:29	密钥机房外门禁	0	1
8374	2024-04-22 14:33:32	密钥机房外门禁	0	1
8375	2024-04-22 14:32:50	密钥机房外门禁	0	1
8376	2024-04-22 14:32:53	密钥机房外门禁	0	1
8377	2024-04-22 14:32:57	密钥机房外门禁	0	1
8378	2024-04-22 14:33:01	密钥机房外门禁	0	1
8379	2024-04-22 14:33:04	密钥机房外门禁	0	1
8380	2024-04-22 14:33:09	密钥机房外门禁	0	1
8381	2024-04-22 14:33:15	密钥机房外门禁	0	1
8382	2024-04-22 14:33:21	密钥机房外门禁	0	1
8383	2024-04-22 14:33:26	密钥机房外门禁	0	1
8384	2024-04-22 14:33:29	密钥机房外门禁	0	1
8385	2024-04-22 14:33:32	密钥机房外门禁	0	1
8386	2024-04-22 14:49:37	信息机房外门禁	1002	1
8387	2024-04-22 14:49:42	信息机房外门禁	1001	1
8388	2024-04-22 14:50:57	信息机房外门禁	1001	1
8389	2024-04-22 14:50:59	信息机房外门禁	1002	1
8390	2024-04-22 14:53:07	信息机房外门禁	0	2
8391	2024-04-23 10:10:26	密钥机房外门禁	0	1
8392	2024-04-23 10:10:31	密钥机房外门禁	0	1
8393	2024-04-23 10:10:36	密钥机房外门禁	0	1
8394	2024-04-23 10:10:43	密钥机房外门禁	0	1
8395	2024-04-23 10:10:48	密钥机房外门禁	0	1
8396	2024-04-23 10:10:52	密钥机房外门禁	0	1
8397	2024-04-23 10:10:57	密钥机房外门禁	0	1
8398	2024-04-23 11:29:56	信息机房内门禁	1002	1
8399	2024-04-23 11:29:59	信息机房内门禁	1001	1
8400	2024-04-23 11:28:44	信息机房外门禁	1002	1
8401	2024-04-23 11:28:46	信息机房外门禁	1001	1
8402	2024-04-23 11:32:35	信息机房内门禁	1002	1
8403	2024-04-23 11:32:40	信息机房内门禁	1001	1
8404	2024-04-24 10:54:52	信息机房外门禁	1002	1
8405	2024-04-24 10:54:55	信息机房外门禁	1001	1
8406	2024-04-24 11:04:05	信息机房内门禁	1002	1
8407	2024-04-24 11:04:18	信息机房内门禁	1001	1
8408	2024-04-24 11:03:17	信息机房外门禁	1001	1
8409	2024-04-24 11:03:19	信息机房外门禁	1002	1
8410	2024-04-24 11:10:44	信息机房内门禁	1002	1
8411	2024-04-24 11:10:46	信息机房内门禁	1001	1
8412	2024-04-25 09:31:29	信息机房外门禁	0	1
8413	2024-04-25 09:31:32	信息机房外门禁	1002	1
8414	2024-04-25 09:31:38	信息机房外门禁	1001	1
8415	2024-04-25 09:42:06	信息机房内门禁	1002	1
8416	2024-04-25 09:42:08	信息机房内门禁	1001	1
8417	2024-04-25 09:39:04	密钥机房外门禁	0	1
8418	2024-04-25 09:39:06	密钥机房外门禁	0	1
8419	2024-04-25 09:39:09	密钥机房外门禁	0	1
8420	2024-04-25 09:39:10	密钥机房外门禁	0	1
8421	2024-04-25 09:39:12	密钥机房外门禁	0	1
8422	2024-04-25 09:39:13	密钥机房外门禁	0	1
8423	2024-04-25 09:39:15	密钥机房外门禁	0	1
8424	2024-04-25 09:39:17	密钥机房外门禁	0	1
8425	2024-04-25 09:39:18	密钥机房外门禁	0	1
8426	2024-04-26 09:28:24	信息机房外门禁	1001	1
8427	2024-04-26 09:28:26	信息机房外门禁	1002	1
8428	2024-04-26 09:33:34	信息机房内门禁	1002	1
8429	2024-04-26 09:33:40	信息机房内门禁	1001	1
8430	2024-04-26 10:20:47	CA机房外门禁	1001985	1
8431	2024-04-26 10:20:50	CA机房外门禁	1004731	1
8432	2024-04-26 10:28:02	CA机房内门禁	1004731	1
8433	2024-04-26 10:28:05	CA机房内门禁	1001985	1
8434	2024-04-26 10:28:54	CA机房外门禁	1004731	1
8435	2024-04-26 10:28:57	CA机房外门禁	1001985	1
8436	2024-04-26 10:28:51	CA机房内门禁	1004731	1
8437	2024-04-26 10:28:53	CA机房内门禁	1001985	1
8438	2024-04-26 10:29:52	CA机房外门禁	1004731	1
8439	2024-04-26 10:29:56	CA机房外门禁	1001985	1
8440	2024-04-26 10:30:14	CA机房内门禁	1001985	1
8441	2024-04-26 10:30:16	CA机房内门禁	1004731	1
8442	2024-04-26 10:31:52	CA机房外门禁	1004731	1
8443	2024-04-26 10:31:54	CA机房外门禁	1001985	1
8444	2024-04-26 10:45:40	CA机房内门禁	1001985	1
8445	2024-04-26 10:45:44	CA机房内门禁	1004731	1
8446	2024-04-26 10:50:36	CA机房外门禁	1001985	1
8447	2024-04-26 10:50:40	CA机房外门禁	1004731	1
8448	2024-04-26 11:37:34	CA机房内门禁	1001985	1
8449	2024-04-26 11:37:36	CA机房内门禁	1004731	1
8450	2024-04-26 13:37:15	密钥机房外门禁	1003	1
8451	2024-04-26 13:37:15	密钥机房外门禁	1003	1
8452	2024-04-26 13:37:18	密钥机房外门禁	1000328	1
8453	2024-04-26 14:08:00	CA机房外门禁	1001985	1
8454	2024-04-26 14:08:02	CA机房外门禁	1004731	1
8455	2024-04-26 14:18:23	CA机房内门禁	1004731	1
8456	2024-04-26 14:18:23	CA机房内门禁	1004731	1
8457	2024-04-26 14:18:26	CA机房内门禁	1001985	1
8458	2024-04-26 15:02:35	密钥机房内门禁	1000328	1
8459	2024-04-26 15:02:35	密钥机房内门禁	1000328	1
8460	2024-04-26 15:02:39	密钥机房内门禁	1003	1
8461	2024-04-30 09:57:11	信息机房外门禁	1001	1
8462	2024-04-30 09:57:11	信息机房外门禁	1001	1
8463	2024-04-30 09:57:14	信息机房外门禁	1002	1
8464	2024-04-30 10:34:05	信息机房内门禁	1001	1
8465	2024-04-30 10:34:08	信息机房内门禁	1002	1
8466	2024-04-30 10:31:49	密钥机房外门禁	0	2
8467	2024-04-30 10:32:41	CA机房外门禁	0	1
8468	2024-04-30 10:32:43	CA机房外门禁	0	1
8469	2024-04-30 10:32:45	CA机房外门禁	0	1
8470	2024-04-30 10:32:47	CA机房外门禁	0	1
8471	2024-04-30 10:32:49	CA机房外门禁	0	1
8472	2024-04-30 10:32:51	CA机房外门禁	0	1
8473	2024-04-30 10:32:51	CA机房外门禁	0	1
8474	2024-04-30 10:32:53	CA机房外门禁	0	1
8475	2024-04-30 10:32:56	CA机房外门禁	0	1
8476	2024-04-30 10:31:52	密钥机房外门禁	0	1
8477	2024-04-30 10:31:54	密钥机房外门禁	0	1
8478	2024-04-30 10:31:57	密钥机房外门禁	0	1
8479	2024-04-30 10:31:59	密钥机房外门禁	0	1
8480	2024-04-30 10:32:02	密钥机房外门禁	0	1
8481	2024-04-30 10:32:04	密钥机房外门禁	0	1
8482	2024-04-30 10:32:07	密钥机房外门禁	0	1
8483	2024-04-30 10:32:11	密钥机房外门禁	0	1
8484	2024-04-30 10:32:14	密钥机房外门禁	0	1
8485	2024-04-30 10:33:02	密钥机房外门禁	0	1
8486	2024-04-30 10:33:08	密钥机房外门禁	0	1
8487	2024-04-30 10:33:11	密钥机房外门禁	0	1
8488	2024-04-30 10:33:14	密钥机房外门禁	0	1
8489	2024-04-30 10:33:17	密钥机房外门禁	0	1
8490	2024-04-30 10:33:19	密钥机房外门禁	0	1
8491	2024-04-30 10:33:24	密钥机房外门禁	0	1
8492	2024-04-30 10:33:27	密钥机房外门禁	0	1
8493	2024-04-30 10:33:31	密钥机房外门禁	0	1
8494	2024-04-30 10:33:55	密钥机房外门禁	0	1
8495	2024-04-30 10:33:58	密钥机房外门禁	0	1
8496	2024-04-30 10:34:05	密钥机房外门禁	0	1
8497	2024-04-30 10:34:07	密钥机房外门禁	0	1
8498	2024-04-30 10:34:11	密钥机房外门禁	0	1
8499	2024-04-30 10:34:13	密钥机房外门禁	0	1
8500	2024-04-30 10:34:14	密钥机房外门禁	0	1
8501	2024-04-30 10:34:17	密钥机房外门禁	0	1
8502	2024-04-30 10:34:19	密钥机房外门禁	0	1
8503	2024-04-30 10:34:21	密钥机房外门禁	0	1
8504	2024-04-30 10:34:22	密钥机房外门禁	0	1
8505	2024-04-30 10:34:23	密钥机房外门禁	0	1
8506	2024-04-30 10:34:24	密钥机房外门禁	0	1
8507	2024-04-30 10:34:25	密钥机房外门禁	0	1
8508	2024-04-30 10:34:47	密钥机房外门禁	1001	1
8509	2024-04-30 10:34:52	密钥机房外门禁	1001	1
8510	2024-04-30 10:34:55	密钥机房外门禁	1001	1
8511	2024-04-30 10:34:58	密钥机房外门禁	1001	1
8512	2024-04-30 10:35:02	密钥机房外门禁	1001	1
8513	2024-04-30 10:35:05	密钥机房外门禁	1001	1
8514	2024-04-30 10:35:09	密钥机房外门禁	1001	1
8515	2024-04-30 10:35:13	密钥机房外门禁	1001	1
8516	2024-04-30 10:35:16	密钥机房外门禁	1001	1
8517	2024-04-30 10:35:20	密钥机房外门禁	1001	1
8518	2024-04-30 10:35:22	密钥机房外门禁	1001	1
8519	2024-04-30 10:35:27	密钥机房外门禁	1001	1
8520	2024-04-30 10:35:31	密钥机房外门禁	1001	1
8521	2024-04-30 10:35:34	密钥机房外门禁	1001	1
8522	2024-04-30 10:35:37	密钥机房外门禁	1001	1
8523	2024-04-30 10:37:11	密钥机房外门禁	0	1
8524	2024-04-30 10:37:14	密钥机房外门禁	0	1
8525	2024-04-30 10:37:19	密钥机房外门禁	0	1
8526	2024-04-30 10:37:21	密钥机房外门禁	0	1
8527	2024-04-30 10:37:25	密钥机房外门禁	0	1
8528	2024-04-30 10:37:30	密钥机房外门禁	0	1
8529	2024-04-30 10:37:34	密钥机房外门禁	0	1
8530	2024-04-30 10:37:37	密钥机房外门禁	0	1
8531	2024-04-30 10:37:38	密钥机房外门禁	0	1
8532	2024-04-30 10:37:41	密钥机房外门禁	0	1
8533	2024-04-30 10:37:43	密钥机房外门禁	0	1
8534	2024-04-30 10:37:44	密钥机房外门禁	0	1
8535	2024-04-30 10:37:46	密钥机房外门禁	0	1
8536	2024-04-30 10:37:48	密钥机房外门禁	0	1
8537	2024-04-30 10:37:49	密钥机房外门禁	0	1
8538	2024-04-30 10:37:51	密钥机房外门禁	0	1
8539	2024-04-30 10:37:52	密钥机房外门禁	0	1
8540	2024-04-30 10:37:54	密钥机房外门禁	0	1
8541	2024-04-30 10:37:55	密钥机房外门禁	0	1
8542	2024-04-30 10:37:58	密钥机房外门禁	0	1
8543	2024-04-30 10:38:00	密钥机房外门禁	0	1
8544	2024-04-30 10:38:27	密钥机房外门禁	0	2
8545	2024-04-30 10:38:31	密钥机房外门禁	0	2
8546	2024-04-30 10:44:05	密钥机房外门禁	0	2
8547	2024-04-30 10:44:23	密钥机房外门禁	0	2
8548	2024-04-30 10:31:54	密钥机房外门禁	0	1
8549	2024-04-30 10:31:57	密钥机房外门禁	0	1
8550	2024-04-30 10:31:59	密钥机房外门禁	0	1
8551	2024-04-30 10:32:02	密钥机房外门禁	0	1
8552	2024-04-30 10:32:04	密钥机房外门禁	0	1
8553	2024-04-30 10:32:07	密钥机房外门禁	0	1
8554	2024-04-30 10:32:11	密钥机房外门禁	0	1
8555	2024-04-30 10:32:14	密钥机房外门禁	0	1
8556	2024-04-30 10:33:02	密钥机房外门禁	0	1
8557	2024-04-30 10:33:08	密钥机房外门禁	0	1
8558	2024-04-30 10:33:11	密钥机房外门禁	0	1
8559	2024-04-30 10:33:14	密钥机房外门禁	0	1
8560	2024-04-30 10:33:17	密钥机房外门禁	0	1
8561	2024-04-30 10:33:19	密钥机房外门禁	0	1
8562	2024-04-30 10:33:24	密钥机房外门禁	0	1
8563	2024-04-30 10:33:27	密钥机房外门禁	0	1
8564	2024-04-30 10:33:31	密钥机房外门禁	0	1
8565	2024-04-30 10:33:55	密钥机房外门禁	0	1
8566	2024-04-30 10:33:58	密钥机房外门禁	0	1
8567	2024-04-30 10:34:05	密钥机房外门禁	0	1
8568	2024-04-30 10:34:07	密钥机房外门禁	0	1
8569	2024-04-30 10:34:11	密钥机房外门禁	0	1
8570	2024-04-30 10:34:13	密钥机房外门禁	0	1
8571	2024-04-30 10:34:14	密钥机房外门禁	0	1
8572	2024-04-30 10:34:17	密钥机房外门禁	0	1
8573	2024-04-30 10:34:19	密钥机房外门禁	0	1
8574	2024-04-30 10:34:21	密钥机房外门禁	0	1
8575	2024-04-30 10:34:22	密钥机房外门禁	0	1
8576	2024-04-30 10:34:23	密钥机房外门禁	0	1
8577	2024-04-30 10:34:24	密钥机房外门禁	0	1
8578	2024-04-30 10:34:25	密钥机房外门禁	0	1
8579	2024-04-30 10:34:47	密钥机房外门禁	1001	1
8580	2024-04-30 10:34:52	密钥机房外门禁	1001	1
8581	2024-04-30 10:34:55	密钥机房外门禁	1001	1
8582	2024-04-30 10:34:58	密钥机房外门禁	1001	1
8583	2024-04-30 10:35:02	密钥机房外门禁	1001	1
8584	2024-04-30 10:35:05	密钥机房外门禁	1001	1
8585	2024-04-30 10:35:09	密钥机房外门禁	1001	1
8586	2024-04-30 10:35:13	密钥机房外门禁	1001	1
8587	2024-04-30 10:35:16	密钥机房外门禁	1001	1
8588	2024-04-30 10:35:20	密钥机房外门禁	1001	1
8589	2024-04-30 10:35:22	密钥机房外门禁	1001	1
8590	2024-04-30 10:35:27	密钥机房外门禁	1001	1
8591	2024-04-30 10:35:31	密钥机房外门禁	1001	1
8592	2024-04-30 10:35:34	密钥机房外门禁	1001	1
8593	2024-04-30 10:35:37	密钥机房外门禁	1001	1
8594	2024-04-30 10:37:11	密钥机房外门禁	0	1
8595	2024-04-30 10:37:14	密钥机房外门禁	0	1
8596	2024-04-30 10:37:19	密钥机房外门禁	0	1
8597	2024-04-30 10:37:21	密钥机房外门禁	0	1
8598	2024-04-30 10:37:25	密钥机房外门禁	0	1
8599	2024-04-30 10:37:30	密钥机房外门禁	0	1
8600	2024-04-30 10:37:34	密钥机房外门禁	0	1
8601	2024-04-30 10:37:37	密钥机房外门禁	0	1
8602	2024-04-30 10:37:38	密钥机房外门禁	0	1
8603	2024-04-30 10:37:41	密钥机房外门禁	0	1
8604	2024-04-30 10:37:43	密钥机房外门禁	0	1
8605	2024-04-30 10:37:44	密钥机房外门禁	0	1
8606	2024-04-30 10:37:46	密钥机房外门禁	0	1
8607	2024-04-30 10:37:48	密钥机房外门禁	0	1
8608	2024-04-30 10:37:49	密钥机房外门禁	0	1
8609	2024-04-30 10:37:51	密钥机房外门禁	0	1
8610	2024-04-30 10:37:52	密钥机房外门禁	0	1
8611	2024-04-30 10:37:54	密钥机房外门禁	0	1
8612	2024-04-30 10:37:55	密钥机房外门禁	0	1
8613	2024-04-30 10:37:58	密钥机房外门禁	0	1
8614	2024-04-30 10:38:00	密钥机房外门禁	0	1
8615	2024-04-30 10:38:27	密钥机房外门禁	0	2
8616	2024-04-30 10:38:31	密钥机房外门禁	0	2
8617	2024-04-30 10:44:05	密钥机房外门禁	0	2
8618	2024-04-30 10:44:23	密钥机房外门禁	0	2
8619	2024-05-06 14:22:30	信息机房外门禁	1002	1
8620	2024-05-06 14:22:31	信息机房外门禁	1002	1
8621	2024-05-06 14:22:31	信息机房外门禁	1002	1
8622	2024-05-06 14:22:38	信息机房外门禁	1001	1
8623	2024-05-06 14:29:02	信息机房内门禁	1002	1
8624	2024-05-06 14:29:09	信息机房内门禁	1001	1
8625	2024-05-06 14:27:44	CA机房外门禁	0	1
8626	2024-05-06 14:27:46	CA机房外门禁	0	1
8627	2024-05-06 14:27:47	CA机房外门禁	0	1
8628	2024-05-06 14:27:49	CA机房外门禁	0	1
8629	2024-05-06 14:27:51	CA机房外门禁	0	1
8630	2024-05-06 14:27:53	CA机房外门禁	0	1
8631	2024-05-06 14:27:55	CA机房外门禁	0	1
8632	2024-05-06 14:28:15	密钥机房外门禁	0	1
8633	2024-05-06 14:28:15	密钥机房外门禁	0	1
8634	2024-05-06 14:28:17	密钥机房外门禁	0	1
8635	2024-05-06 14:28:19	密钥机房外门禁	0	1
8636	2024-05-06 14:28:21	密钥机房外门禁	0	1
8637	2024-05-06 14:28:23	密钥机房外门禁	0	1
8638	2024-05-06 14:28:24	密钥机房外门禁	0	1
8639	2024-05-07 13:41:34	密钥机房外门禁	1000328	1
8640	2024-05-07 13:41:41	密钥机房外门禁	1000333	1
8641	2024-05-07 13:42:14	信息机房外门禁	1002	1
8642	2024-05-07 13:42:16	信息机房外门禁	1002	1
8643	2024-05-07 13:42:17	信息机房外门禁	1001	1
8644	2024-05-07 13:48:14	信息机房内门禁	1002	1
8645	2024-05-07 13:48:33	信息机房内门禁	1001	1
8646	2024-05-07 14:36:06	密钥机房内门禁	1000333	1
8647	2024-05-07 14:36:09	密钥机房内门禁	1000328	1
8648	2024-05-07 14:37:07	密钥机房外门禁	1000328	1
8649	2024-05-07 14:37:10	密钥机房外门禁	1000333	1
8650	2024-05-07 15:02:36	密钥机房内门禁	1000328	1
8651	2024-05-07 15:02:38	密钥机房内门禁	1000333	1
8652	2024-05-07 15:08:08	CA机房外门禁	1004731	1
8653	2024-05-07 15:08:14	CA机房外门禁	1001985	1
8654	2024-05-07 15:40:48	CA机房内门禁	1001985	1
8655	2024-05-07 15:40:48	CA机房内门禁	1001985	1
8656	2024-05-07 15:40:50	CA机房内门禁	1004731	1
8657	2024-05-07 16:16:30	CA机房外门禁	1001985	1
8658	2024-05-07 16:16:35	CA机房外门禁	1004731	1
8659	2024-05-07 16:17:56	CA机房内门禁	1004731	1
8660	2024-05-07 16:17:59	CA机房内门禁	1001985	1
8661	2024-05-08 10:21:41	CA机房外门禁	1004731	1
8662	2024-05-08 10:21:41	CA机房外门禁	1004731	1
8663	2024-05-08 10:21:55	CA机房外门禁	1001985	1
8664	2024-05-08 10:39:17	CA机房内门禁	1001985	1
8665	2024-05-08 10:39:20	CA机房内门禁	1004731	1
8666	2024-05-08 10:47:49	CA机房外门禁	1001985	1
8667	2024-05-08 10:47:49	CA机房外门禁	1001985	1
8668	2024-05-08 10:47:52	CA机房外门禁	1004731	1
8669	2024-05-08 10:50:14	CA机房内门禁	0	1
8670	2024-05-08 10:52:54	CA机房内门禁	1001985	1
8671	2024-05-08 10:52:57	CA机房内门禁	1004731	1
8672	2024-05-08 10:55:15	CA机房外门禁	1004731	1
8673	2024-05-08 10:55:15	CA机房外门禁	1004731	1
8674	2024-05-08 10:55:18	CA机房外门禁	1001985	1
8675	2024-05-08 10:56:32	CA机房外门禁	1004731	1
8676	2024-05-08 10:56:34	CA机房外门禁	1001985	1
8677	2024-05-08 10:56:28	CA机房内门禁	1001985	1
8678	2024-05-08 10:56:31	CA机房内门禁	1004731	1
8679	2024-05-08 10:59:06	CA机房外门禁	0	1
8680	2024-05-08 10:59:09	CA机房外门禁	0	1
8681	2024-05-08 10:59:49	CA机房外门禁	0	1
8682	2024-05-08 10:59:53	CA机房外门禁	0	1
8683	2024-05-08 10:59:53	CA机房外门禁	0	1
8684	2024-05-08 11:00:48	密钥机房外门禁	1000328	1
8685	2024-05-08 11:00:51	密钥机房外门禁	1000333	1
8686	2024-05-08 11:21:18	密钥机房内门禁	1000328	1
8687	2024-05-08 11:21:18	密钥机房内门禁	1000328	1
8688	2024-05-08 11:21:23	密钥机房内门禁	1000333	1
8689	2024-05-08 11:21:23	密钥机房内门禁	1000333	1
8690	2024-05-08 11:24:35	密钥机房外门禁	1000328	1
8691	2024-05-08 11:24:37	密钥机房外门禁	1000333	1
8692	2024-05-08 11:24:57	密钥机房外门禁	1000333	1
8693	2024-05-08 11:25:04	密钥机房外门禁	1000328	1
8694	2024-05-08 11:25:49	信息机房外门禁	0	1
8695	2024-05-08 11:25:52	信息机房外门禁	0	1
8696	2024-05-08 11:26:00	信息机房外门禁	1002	1
8697	2024-05-08 11:26:05	信息机房外门禁	1001	1
8698	2024-05-08 11:53:29	信息机房内门禁	1002	1
8699	2024-05-08 11:54:34	信息机房内门禁	1002	1
8700	2024-05-08 11:54:37	信息机房内门禁	1001	1
8701	2024-05-08 11:54:01	信息机房外门禁	1002	1
8702	2024-05-08 11:54:03	信息机房外门禁	1001	1
8703	2024-05-08 11:57:56	信息机房内门禁	1002	1
8704	2024-05-08 11:57:58	信息机房内门禁	1001	1
8705	2024-05-08 11:57:58	信息机房内门禁	1001	1
8706	2024-05-08 14:09:26	CA机房外门禁	1004731	1
8707	2024-05-08 14:09:26	CA机房外门禁	1004731	1
8708	2024-05-08 14:09:29	CA机房外门禁	1001985	1
8709	2024-05-08 16:00:52	CA机房内门禁	1004731	1
8710	2024-05-08 16:00:55	CA机房内门禁	1001985	1
8711	2024-05-08 16:52:40	密钥机房外门禁	1000328	1
8712	2024-05-08 16:52:43	密钥机房外门禁	1000333	1
8713	2024-05-08 16:52:54	密钥机房外门禁	1000328	1
8714	2024-05-08 16:52:57	密钥机房外门禁	1000333	1
8715	2024-05-08 16:55:44	密钥机房内门禁	1000328	1
8716	2024-05-08 16:55:46	密钥机房内门禁	1000333	1
8717	2024-05-08 16:56:51	密钥机房外门禁	1000328	1
8718	2024-05-08 16:56:54	密钥机房外门禁	1000333	1
8719	2024-05-08 18:26:00	密钥机房内门禁	1000333	1
8720	2024-05-08 18:26:03	密钥机房内门禁	1000328	1
8721	2024-05-10 17:20:01	信息机房外门禁	1002	1
8722	2024-05-10 17:20:03	信息机房外门禁	1001	1
8723	2024-05-10 17:23:31	信息机房内门禁	1002	1
8724	2024-05-10 17:23:34	信息机房内门禁	1001	1
8725	2024-05-23 08:34:47	密钥机房外门禁	1007	1
8726	2024-05-23 08:34:51	密钥机房外门禁	1003	1
8727	2024-05-23 08:52:43	密钥机房内门禁	1003	1
8728	2024-05-23 08:52:45	密钥机房内门禁	1007	1
8729	2024-05-23 10:50:20	密钥机房外门禁	1000328	1
8730	2024-05-23 10:50:22	密钥机房外门禁	1003	1
8731	2024-05-23 11:04:14	密钥机房内门禁	1003	1
8732	2024-05-23 11:04:47	密钥机房内门禁	1003	1
8733	2024-05-23 11:04:47	密钥机房内门禁	1003	1
8734	2024-05-23 11:04:49	密钥机房内门禁	1000328	1
8735	2024-05-23 13:54:41	密钥机房外门禁	1000328	1
8736	2024-05-23 13:54:46	密钥机房外门禁	1003	1
8737	2024-05-23 13:54:46	密钥机房外门禁	1003	1
8738	2024-05-23 13:54:51	密钥机房外门禁	1003	1
8739	2024-05-23 13:55:02	密钥机房外门禁	1000328	1
8740	2024-05-23 13:56:05	密钥机房外门禁	1000328	1
8741	2024-05-23 13:56:08	密钥机房外门禁	1003	1
8742	2024-05-23 14:00:06	密钥机房内门禁	1000328	1
8743	2024-05-23 14:00:11	密钥机房内门禁	1003	1
8744	2024-05-23 14:02:19	密钥机房外门禁	1003	1
8745	2024-05-23 14:02:21	密钥机房外门禁	1000328	1
8746	2024-05-23 14:03:01	密钥机房外门禁	1000328	1
8747	2024-05-23 14:03:03	密钥机房外门禁	1003	1
8748	2024-05-23 14:03:00	密钥机房内门禁	1000328	1
8749	2024-05-23 14:03:07	密钥机房内门禁	1003	1
8750	2024-05-23 14:03:58	密钥机房外门禁	1003	1
8751	2024-05-23 14:04:01	密钥机房外门禁	1000328	1
8752	2024-05-23 14:38:25	密钥机房内门禁	1003	1
8753	2024-05-23 14:38:28	密钥机房内门禁	1000328	1
8754	2024-05-23 14:38:38	密钥机房内门禁	1003	1
8755	2024-05-23 14:38:42	密钥机房内门禁	1000328	1
8756	2024-05-23 14:38:52	密钥机房内门禁	1000328	1
8757	2024-05-23 14:38:55	密钥机房内门禁	1003	1
8758	2024-05-23 14:40:30	密钥机房内门禁	1003	1
8759	2024-05-23 14:40:32	密钥机房内门禁	1000328	1
8760	2024-05-24 10:32:05	密钥机房外门禁	1007	1
8761	2024-05-24 10:32:08	密钥机房外门禁	1003	1
8762	2024-05-24 11:42:37	密钥机房内门禁	1003	1
8763	2024-05-24 11:42:39	密钥机房内门禁	1007	1
8764	2024-05-24 11:42:39	密钥机房内门禁	1007	1
8765	2024-05-30 08:27:06	信息机房外门禁	1002	1
8766	2024-05-30 08:27:09	信息机房外门禁	1001	1
8767	2024-05-30 08:47:50	信息机房内门禁	1001	1
8768	2024-05-30 08:47:50	信息机房内门禁	1001	1
8769	2024-05-30 08:47:53	信息机房内门禁	1002	1
8770	2024-06-05 16:59:46	信息机房外门禁	1002	1
8771	2024-06-05 16:59:48	信息机房外门禁	1001	1
8772	2024-06-07 09:28:05	信息机房外门禁	1001	1
8773	2024-06-07 09:28:08	信息机房外门禁	1002	1
8774	2024-06-07 09:28:10	信息机房外门禁	1002	1
8775	2024-06-07 09:39:25	信息机房内门禁	1002	1
8776	2024-06-07 09:39:30	信息机房内门禁	1001	1
8777	2024-06-11 08:50:29	信息机房外门禁	1002	1
8778	2024-06-11 08:50:32	信息机房外门禁	1001	1
8779	2024-06-11 09:04:40	信息机房内门禁	1002	1
8780	2024-06-11 09:04:43	信息机房内门禁	1001	1
8781	2024-06-12 14:19:54	信息机房外门禁	1002	1
8782	2024-06-12 14:19:56	信息机房外门禁	1001	1
8783	2024-06-12 14:29:45	信息机房内门禁	1002	1
8784	2024-06-12 14:31:07	信息机房内门禁	1001	1
8785	2024-06-12 14:31:13	信息机房内门禁	1002	1
8786	2024-07-02 15:58:53	信息机房外门禁	1001	1
8787	2024-07-02 15:58:55	信息机房外门禁	1002	1
8788	2024-07-02 16:11:25	信息机房内门禁	1002	1
8789	2024-07-02 16:11:26	信息机房内门禁	1002	1
8790	2024-07-02 16:11:28	信息机房内门禁	1001	1
8791	2024-07-15 09:40:42	信息机房外门禁	1002	1
8792	2024-07-15 09:47:28	信息机房内门禁	1001	1
8793	2024-07-15 09:47:28	信息机房内门禁	1001	1
8794	2024-07-15 09:47:30	信息机房内门禁	1002	1
8795	2024-07-15 09:40:45	信息机房外门禁	1001	1
8796	2024-07-16 16:09:15	信息机房外门禁	1001	1
8797	2024-07-16 16:09:21	信息机房外门禁	1002	1
8798	2024-07-16 16:14:46	信息机房内门禁	1001	1
8799	2024-07-16 16:15:13	信息机房内门禁	1002	1
8800	2024-07-17 11:13:46	信息机房外门禁	1002	1
8801	2024-07-17 11:13:47	信息机房外门禁	1002	1
8802	2024-07-17 11:14:04	信息机房外门禁	1001	1
8803	2024-07-17 12:01:35	信息机房内门禁	1002	1
8804	2024-07-17 12:02:17	信息机房内门禁	1001	1
8805	2024-07-24 08:59:15	信息机房外门禁	1001	1
8806	2024-07-24 08:59:18	信息机房外门禁	1002	1
8807	2024-07-24 09:10:18	信息机房内门禁	1002	1
8808	2024-07-24 09:10:22	信息机房内门禁	1001	1
8809	2024-07-25 14:35:29	密钥机房外门禁	1003	1
8810	2024-07-25 14:35:31	密钥机房外门禁	1007	1
8811	2024-07-25 14:35:41	密钥机房外门禁	1007	1
8812	2024-07-25 14:35:43	密钥机房外门禁	1003	1
8813	2024-07-25 14:36:54	密钥机房内门禁	1007	1
8814	2024-07-25 14:36:57	密钥机房内门禁	1003	1
8815	2024-07-25 14:37:05	密钥机房内门禁	1003	1
8816	2024-07-25 14:37:08	密钥机房内门禁	1007	1
8817	2024-07-25 14:37:37	密钥机房内门禁	1007	1
8818	2024-07-25 14:37:39	密钥机房内门禁	1003	1
8819	2024-07-25 14:39:14	密钥机房外门禁	1007	1
8820	2024-07-25 14:39:17	密钥机房外门禁	0	1
8821	2024-07-25 14:39:20	密钥机房外门禁	1003	1
8822	2024-07-25 15:09:05	密钥机房内门禁	1007	1
8823	2024-07-25 15:09:08	密钥机房内门禁	1003	1
8824	2024-07-25 15:10:35	密钥机房外门禁	1003	1
8825	2024-07-25 15:10:38	密钥机房外门禁	1007	1
8826	2024-07-25 15:10:38	密钥机房外门禁	1007	1
8827	2024-07-25 15:11:13	密钥机房内门禁	0	1
8828	2024-07-25 15:11:15	密钥机房内门禁	0	1
8829	2024-07-25 15:11:15	密钥机房内门禁	0	1
8830	2024-07-25 15:11:25	密钥机房内门禁	1007	1
8831	2024-07-25 15:11:27	密钥机房内门禁	1003	1
8832	2024-07-25 16:55:19	信息机房外门禁	1001	1
8833	2024-07-25 16:55:22	信息机房外门禁	1002	1
8834	2024-07-25 16:58:10	信息机房内门禁	1002	1
8835	2024-07-25 16:58:17	信息机房内门禁	1001	1
8836	2024-07-25 17:12:35	信息机房外门禁	1002	1
8837	2024-07-25 17:12:37	信息机房外门禁	1001	1
8838	2024-07-25 17:12:37	信息机房外门禁	1001	1
8839	2024-07-25 17:15:14	信息机房外门禁	1001	1
8840	2024-07-25 17:15:16	信息机房外门禁	1002	1
8841	2024-07-25 17:18:26	信息机房内门禁	1002	1
8842	2024-07-25 17:18:29	信息机房内门禁	1001	1
8843	2024-07-25 17:18:29	信息机房内门禁	1001	1
8844	2024-07-26 08:44:38	密钥机房外门禁	1007	1
8845	2024-07-26 08:44:43	密钥机房外门禁	1003	1
8846	2024-07-26 08:44:58	信息机房外门禁	1002	1
8847	2024-07-26 08:46:08	密钥机房内门禁	1007	1
8848	2024-07-26 08:46:10	密钥机房内门禁	1003	1
8849	2024-07-26 08:47:20	密钥机房外门禁	1007	1
8850	2024-07-26 08:47:23	密钥机房外门禁	0	1
8851	2024-07-26 08:47:27	密钥机房外门禁	1003	1
8852	2024-07-26 08:47:28	密钥机房外门禁	1003	1
8853	2024-07-26 08:50:46	密钥机房外门禁	1007	1
8854	2024-07-26 08:50:48	密钥机房外门禁	1003	1
8855	2024-07-26 08:50:56	密钥机房内门禁	0	1
8856	2024-07-26 08:51:03	密钥机房内门禁	1007	1
8857	2024-07-26 08:51:07	密钥机房内门禁	1003	1
8858	2024-07-26 08:52:21	密钥机房内门禁	1007	1
8859	2024-07-26 08:52:24	密钥机房内门禁	1003	1
8860	2024-07-26 08:52:24	密钥机房内门禁	1003	1
8861	2024-07-26 08:53:33	密钥机房外门禁	1003	1
8862	2024-07-26 08:53:36	密钥机房外门禁	1007	1
8863	2024-07-26 08:55:54	信息机房外门禁	1002	1
8864	2024-07-26 08:55:57	信息机房外门禁	1001	1
8865	2024-07-26 08:55:03	密钥机房内门禁	1007	1
8866	2024-07-26 08:55:06	密钥机房内门禁	1003	1
8867	2024-07-26 08:56:20	密钥机房外门禁	1007	1
8868	2024-07-26 08:56:23	密钥机房外门禁	1003	1
8869	2024-07-26 08:57:30	密钥机房内门禁	1003	1
8870	2024-07-26 08:57:36	密钥机房内门禁	1007	1
8871	2024-07-26 09:02:44	信息机房内门禁	1002	1
8872	2024-07-26 09:02:52	信息机房内门禁	1001	1
8873	2024-07-26 09:00:30	密钥机房外门禁	1003	1
8874	2024-07-26 09:00:34	密钥机房外门禁	1007	1
8875	2024-07-26 09:01:53	密钥机房内门禁	1003	1
8876	2024-07-26 09:02:00	密钥机房内门禁	1007	1
8877	2024-07-26 09:03:38	密钥机房外门禁	1003	1
8878	2024-07-26 09:03:47	密钥机房外门禁	1007	1
8879	2024-07-26 09:06:35	密钥机房内门禁	1007	1
8880	2024-07-26 09:06:41	密钥机房内门禁	1003	1
8881	2024-07-26 09:07:35	密钥机房外门禁	1007	1
8882	2024-07-26 09:07:37	密钥机房外门禁	1003	1
8883	2024-07-26 09:08:42	密钥机房内门禁	1007	1
8884	2024-07-26 09:08:45	密钥机房内门禁	1003	1
8885	2024-07-26 09:10:28	密钥机房外门禁	1007	1
8886	2024-07-26 09:10:31	密钥机房外门禁	1003	1
8887	2024-07-26 09:11:19	密钥机房内门禁	1007	1
8888	2024-07-26 09:11:22	密钥机房内门禁	1003	1
8889	2024-07-26 09:12:20	密钥机房外门禁	1003	1
8890	2024-07-26 09:12:29	密钥机房外门禁	1007	1
8891	2024-07-26 09:13:27	密钥机房内门禁	1007	1
8892	2024-07-26 09:13:27	密钥机房内门禁	1007	1
8893	2024-07-26 09:13:30	密钥机房内门禁	1003	1
8894	2024-07-26 10:23:19	信息机房外门禁	1002	1
8895	2024-07-26 10:23:24	信息机房外门禁	1001	1
8896	2024-07-26 10:23:36	信息机房外门禁	1001	1
8897	2024-07-26 10:23:43	信息机房外门禁	1002	1
8898	2024-07-26 10:24:15	密钥机房外门禁	1007	1
8899	2024-07-26 10:24:17	密钥机房外门禁	1003	1
8900	2024-07-26 10:31:10	信息机房外门禁	1002	1
8901	2024-07-26 10:31:13	信息机房外门禁	1001	1
8902	2024-07-26 10:33:49	信息机房内门禁	1002	1
8903	2024-07-26 10:33:53	信息机房内门禁	1001	1
8904	2024-07-26 10:35:53	密钥机房内门禁	1007	1
8905	2024-07-26 10:35:56	密钥机房内门禁	1003	1
8906	2024-07-26 10:36:24	密钥机房内门禁	1007	1
8907	2024-07-26 10:36:27	密钥机房内门禁	1003	1
8908	2024-07-26 10:39:52	信息机房外门禁	1002	1
8909	2024-07-26 10:39:52	信息机房外门禁	1002	1
8910	2024-07-26 10:39:56	信息机房外门禁	1001	1
8911	2024-07-26 13:41:47	信息机房外门禁	1002	1
8912	2024-07-26 13:41:55	信息机房外门禁	1001	1
8913	2024-07-26 13:49:53	信息机房内门禁	1001	1
8914	2024-07-26 13:49:57	信息机房内门禁	1002	1
8915	2024-07-26 13:49:57	信息机房内门禁	1002	1
8916	2024-08-14 13:57:20	信息机房外门禁	1002	1
8917	2024-08-14 13:57:23	信息机房外门禁	1001	1
8918	2024-08-14 14:02:13	CA机房外门禁	1005	1
8919	2024-08-14 14:02:16	CA机房外门禁	1006	1
8920	2024-08-14 14:00:08	CA机房内门禁	1005	1
8921	2024-08-14 14:00:10	CA机房内门禁	1006	1
8922	2024-08-14 14:03:38	CA机房外门禁	1005	1
8923	2024-08-14 14:03:40	CA机房外门禁	1006	1
8924	2024-08-14 14:03:54	CA机房外门禁	1005	1
8925	2024-08-14 14:03:56	CA机房外门禁	1006	1
8926	2024-08-14 14:09:37	信息机房内门禁	1002	1
8927	2024-08-14 14:11:32	信息机房内门禁	1002	1
8928	2024-08-14 14:11:36	信息机房内门禁	1001	1
8929	2024-08-15 10:25:59	密钥机房外门禁	1000328	1
8930	2024-08-15 10:26:03	密钥机房外门禁	1003	1
8931	2024-08-15 10:26:43	密钥机房内门禁	1000328	1
8932	2024-08-15 10:26:46	密钥机房内门禁	1003	1
8933	2024-08-15 10:28:58	密钥机房外门禁	1000328	1
8934	2024-08-15 10:29:00	密钥机房外门禁	1003	1
8935	2024-08-15 10:29:25	密钥机房外门禁	1000328	1
8936	2024-08-15 10:29:28	密钥机房外门禁	1003	1
8937	2024-08-15 10:30:28	密钥机房内门禁	1000328	1
8938	2024-08-15 10:30:32	密钥机房内门禁	1003	1
8939	2024-08-15 10:33:26	密钥机房外门禁	1000328	1
8940	2024-08-15 10:33:29	密钥机房外门禁	1003	1
8941	2024-08-15 10:34:22	密钥机房外门禁	1000328	1
8942	2024-08-15 10:34:26	密钥机房外门禁	1003	1
8943	2024-08-15 10:34:30	密钥机房内门禁	1000328	1
8944	2024-08-15 10:34:34	密钥机房内门禁	1003	1
8945	2024-08-15 10:40:56	密钥机房外门禁	1000328	1
8946	2024-08-15 10:40:57	密钥机房外门禁	0	1
8947	2024-08-15 10:41:01	密钥机房外门禁	1003	1
8948	2024-08-15 12:02:10	密钥机房内门禁	1003	1
8949	2024-08-15 12:02:18	密钥机房内门禁	1000328	1
8950	2024-08-20 10:26:50	信息机房外门禁	1001	1
8951	2024-08-20 10:26:54	信息机房外门禁	1002	1
8952	2024-08-27 14:41:15	信息机房外门禁	1001	1
8953	2024-08-27 14:41:24	信息机房外门禁	1002	1
8954	2024-08-27 14:47:21	信息机房内门禁	1002	1
8955	2024-08-27 14:47:33	信息机房内门禁	1001	1
8956	2024-09-03 10:52:24	信息机房外门禁	1002	1
8957	2024-09-03 10:52:36	信息机房外门禁	1001	1
8958	2024-09-03 10:57:01	信息机房内门禁	1002	1
8959	2024-09-03 10:57:04	信息机房内门禁	1001	1
8960	2024-09-03 10:57:24	信息机房内门禁	1002	1
8961	2024-09-03 10:57:27	信息机房内门禁	1001	1
8962	2024-09-03 18:24:35	信息机房外门禁	1001	1
8963	2024-09-03 18:24:38	信息机房外门禁	1002	1
8964	2024-09-04 08:19:05	密钥机房外门禁	1007	1
8965	2024-09-04 08:19:09	密钥机房外门禁	1003	1
8966	2024-09-04 08:20:17	密钥机房内门禁	1003	1
8967	2024-09-04 08:20:20	密钥机房内门禁	1007	1
8968	2024-09-04 08:21:08	密钥机房外门禁	1007	1
8969	2024-09-04 08:21:11	密钥机房外门禁	1003	1
8970	2024-09-04 08:22:36	密钥机房内门禁	1003	1
8971	2024-09-04 08:22:40	密钥机房内门禁	1007	1
8972	2024-09-04 08:26:46	信息机房外门禁	1002	1
8973	2024-09-04 08:29:17	信息机房外门禁	1002	1
8974	2024-09-04 08:29:21	信息机房外门禁	1001	1
8975	2024-09-04 08:34:15	信息机房内门禁	1002	1
8976	2024-09-04 08:30:08	密钥机房外门禁	1007	1
8977	2024-09-04 08:34:18	信息机房内门禁	1001	1
8978	2024-09-04 08:30:12	密钥机房外门禁	1003	1
8979	2024-09-04 08:46:45	密钥机房内门禁	1007	1
8980	2024-09-04 08:46:48	密钥机房内门禁	1003	1
8981	2024-09-04 10:33:12	密钥机房外门禁	1007	1
8982	2024-09-04 10:33:15	密钥机房外门禁	1003	1
8983	2024-09-04 10:46:16	密钥机房内门禁	1003	1
8984	2024-09-04 10:46:20	密钥机房内门禁	1007	1
8985	2024-09-04 10:51:00	信息机房外门禁	1002	1
8986	2024-09-04 10:51:07	信息机房外门禁	1001	1
8987	2024-09-04 11:00:50	信息机房内门禁	1002	1
8988	2024-09-04 11:00:50	信息机房内门禁	1002	1
8989	2024-09-04 11:02:00	信息机房内门禁	1002	1
8990	2024-09-04 11:02:04	信息机房内门禁	1001	1
\.


--
-- Data for Name: verification_record; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.verification_record (id, name, optype, record_time, self_id, verify_mode) FROM stdin;
1	Pengyz	0	2023-02-08 15:43:40	1002	指纹
2	Pengyz	0	2023-02-08 15:43:42	1001	指纹
3	Pengyz	0	2023-02-08 15:46:34	1002	指纹
4	Pengyz	0	2023-02-08 15:47:21	1001	指纹
5	Pengyz	0	2023-02-10 15:20:20	1002	指纹
6	Pengyz	0	2023-02-10 15:20:23	1001	指纹
7	Pengyz	0	2023-02-10 15:26:58	1002	指纹
8	Pengyz	0	2023-02-10 15:27:05	1002	指纹
9	Pengyz	0	2023-02-10 15:27:26	1001	指纹
10	Pengyz	0	2023-02-13 14:24:54	1002	指纹
11	Pengyz	0	2023-02-13 14:24:57	1001	指纹
12	Pengyz	0	2023-02-13 14:44:50	1001	指纹
13	Pengyz	0	2023-02-13 14:44:55	1002	指纹
14	Pengyz	0	2023-02-16 14:55:03	1002	指纹
15	Pengyz	0	2023-02-16 14:55:04	1002	指纹
16	Pengyz	0	2023-02-16 14:55:06	1001	指纹
17	Pengyz	0	2023-02-16 15:04:47	1001	指纹
18	Pengyz	0	2023-02-16 15:04:49	1002	指纹
19	Pengyz	0	2023-02-21 14:20:06	1002	指纹
20	Pengyz	0	2023-02-21 14:21:44	1001	指纹
21	Pengyz	0	2023-02-21 14:21:47	1002	指纹
22	Pengyz	0	2023-02-21 14:40:46	1001	指纹
23	Pengyz	0	2023-02-21 14:40:50	1002	指纹
24	Pengyz	0	2023-02-24 15:34:33	1002	指纹
25	Pengyz	0	2023-02-24 15:34:36	1001	指纹
26	Pengyz	0	2023-02-24 15:52:22	1002	指纹
27	Pengyz	0	2023-02-24 15:52:25	1001	指纹
28	Pengyz	0	2023-02-26 12:23:11	1001	指纹
29	Pengyz	0	2023-02-26 12:23:14	1008	指纹
30	Pengyz	0	2023-02-26 12:23:14	1008	指纹
31	Pengyz	0	2023-02-26 12:23:14	1008	指纹
32	Pengyz	0	2023-02-26 12:23:51	1008	指纹
33	Pengyz	0	2023-02-26 12:23:51	1008	指纹
34	Pengyz	0	2023-02-26 12:23:55	1001	指纹
35	Pengyz	0	2023-02-26 12:23:55	1001	指纹
36	Pengyz	0	2023-02-26 12:50:50	1001	指纹
37	Pengyz	0	2023-02-26 12:50:50	1001	指纹
38	Pengyz	0	2023-02-26 12:50:52	1008	指纹
39	Pengyz	0	2023-02-26 12:50:52	1008	指纹
40	Pengyz	0	2023-02-26 13:58:02	1008	指纹
41	Pengyz	0	2023-02-26 13:58:05	1001	指纹
42	Pengyz	0	2023-02-26 13:58:05	1001	指纹
43	Pengyz	0	2023-02-26 13:58:08	1001	指纹
44	Pengyz	0	2023-02-26 13:58:11	1001	指纹
45	Pengyz	0	2023-02-26 13:58:11	1001	指纹
46	Pengyz	0	2023-02-26 14:12:25	1008	指纹
47	Pengyz	0	2023-02-26 14:12:26	1008	指纹
48	Pengyz	0	2023-02-26 14:12:28	1001	指纹
49	Pengyz	0	2023-02-26 14:12:28	1001	指纹
50	Pengyz	0	2023-03-02 10:17:33	1003	指纹
51	Pengyz	0	2023-03-02 10:17:34	1003	指纹
52	Pengyz	0	2023-03-02 10:17:36	1007	指纹
53	Pengyz	0	2023-03-02 10:17:36	1007	指纹
54	Pengyz	0	2023-03-02 10:17:38	1007	指纹
55	Pengyz	0	2023-03-02 10:17:38	1007	指纹
56	Pengyz	0	2023-03-02 10:18:08	1002	指纹
57	Pengyz	0	2023-03-02 10:18:09	1002	指纹
58	Pengyz	0	2023-03-02 10:18:11	1001	指纹
59	Pengyz	0	2023-03-02 10:18:11	1001	指纹
60	Pengyz	0	2023-03-02 10:43:24	1002	指纹
61	Pengyz	0	2023-03-02 10:43:24	1002	指纹
62	Pengyz	0	2023-03-02 10:44:02	1001	指纹
63	Pengyz	0	2023-03-02 10:44:02	1001	指纹
64	Pengyz	0	2023-03-02 11:42:09	1003	指纹
65	Pengyz	0	2023-03-02 11:42:09	1003	指纹
66	Pengyz	0	2023-03-02 11:42:12	1007	指纹
67	Pengyz	0	2023-03-02 11:42:12	1007	指纹
68	Pengyz	0	2023-03-06 09:17:20	1007	指纹
69	Pengyz	0	2023-03-06 09:17:21	1007	指纹
70	Pengyz	0	2023-03-06 09:17:24	1003	指纹
71	Pengyz	0	2023-03-06 09:17:24	1003	指纹
72	Pengyz	0	2023-03-06 10:01:08	1003	指纹
73	Pengyz	0	2023-03-06 10:01:08	1003	指纹
74	Pengyz	0	2023-03-06 10:01:30	1003	指纹
75	Pengyz	0	2023-03-06 10:01:30	1003	指纹
76	Pengyz	0	2023-03-06 10:01:38	1007	指纹
77	Pengyz	0	2023-03-06 10:01:38	1007	指纹
78	Pengyz	0	2023-03-06 14:57:48	1002	指纹
79	Pengyz	0	2023-03-06 14:57:49	1002	指纹
80	Pengyz	0	2023-03-06 14:57:50	1001	指纹
81	Pengyz	0	2023-03-06 14:57:51	1001	指纹
82	Pengyz	0	2023-03-06 15:09:39	1002	指纹
83	Pengyz	0	2023-03-06 15:09:40	1002	指纹
84	Pengyz	0	2023-03-06 15:09:43	1001	指纹
85	Pengyz	0	2023-03-06 15:09:43	1001	指纹
86	Pengyz	0	2023-03-09 10:42:07	1002	指纹
87	Pengyz	0	2023-03-09 10:42:08	1002	指纹
88	Pengyz	0	2023-03-09 10:42:12	1001	指纹
89	Pengyz	0	2023-03-09 10:42:16	1001	指纹
90	Pengyz	0	2023-03-09 10:53:27	1001	指纹
91	Pengyz	0	2023-03-09 10:53:27	1001	指纹
92	Pengyz	0	2023-03-09 10:53:30	1002	指纹
93	Pengyz	0	2023-03-09 10:53:30	1002	指纹
94	Pengyz	0	2023-03-10 15:21:47	1001	指纹
95	Pengyz	0	2023-03-10 15:21:48	1001	指纹
96	Pengyz	0	2023-03-10 15:21:49	1002	指纹
97	Pengyz	0	2023-03-10 15:21:51	1002	指纹
98	Pengyz	0	2023-03-10 15:30:12	1001	指纹
99	Pengyz	0	2023-03-10 15:30:14	1001	指纹
100	Pengyz	0	2023-03-10 15:30:16	1002	指纹
101	Pengyz	0	2023-03-10 15:30:16	1002	指纹
102	Pengyz	0	2023-03-13 15:57:45	1001	指纹
103	Pengyz	0	2023-03-13 15:57:45	1001	指纹
104	Pengyz	0	2023-03-13 15:57:48	1002	指纹
105	Pengyz	0	2023-03-13 15:57:48	1002	指纹
106	Pengyz	0	2023-03-13 16:19:56	1002	指纹
107	Pengyz	0	2023-03-13 16:19:56	1002	指纹
108	Pengyz	0	2023-03-13 16:20:04	1001	指纹
109	Pengyz	0	2023-03-13 16:20:04	1001	指纹
110	Pengyz	0	2023-03-13 16:36:02	1001	指纹
111	Pengyz	0	2023-03-13 16:36:02	1001	指纹
112	Pengyz	0	2023-03-13 16:36:05	1002	指纹
113	Pengyz	0	2023-03-13 16:36:05	1002	指纹
114	Pengyz	0	2023-03-13 16:53:53	1002	指纹
115	Pengyz	0	2023-03-13 16:53:53	1002	指纹
116	Pengyz	0	2023-03-13 16:54:35	1001	指纹
117	Pengyz	0	2023-03-13 16:54:35	1001	指纹
118	Pengyz	0	2023-03-14 10:47:04	1002	指纹
119	Pengyz	0	2023-03-14 10:47:04	1002	指纹
120	Pengyz	0	2023-03-14 10:47:09	1001	指纹
121	Pengyz	0	2023-03-14 10:47:09	1001	指纹
122	Pengyz	0	2023-03-14 10:54:50	1002	指纹
123	Pengyz	0	2023-03-14 10:54:50	1002	指纹
124	Pengyz	0	2023-03-14 10:55:03	1001	指纹
125	Pengyz	0	2023-03-14 10:55:03	1001	指纹
126	Pengyz	0	2023-03-17 10:10:45	1002	指纹
127	Pengyz	0	2023-03-17 10:10:45	1002	指纹
128	Pengyz	0	2023-03-17 10:10:48	1001	指纹
129	Pengyz	0	2023-03-17 10:10:48	1001	指纹
130	Pengyz	0	2023-03-17 10:22:22	1001	指纹
131	Pengyz	0	2023-03-17 10:22:22	1001	指纹
132	Pengyz	0	2023-03-17 10:22:27	1002	指纹
133	Pengyz	0	2023-03-17 10:22:27	1002	指纹
134	Pengyz	0	2023-03-22 09:31:38	1002	指纹
135	Pengyz	0	2023-03-22 09:31:38	1002	指纹
136	Pengyz	0	2023-03-22 09:31:41	1001	指纹
137	Pengyz	0	2023-03-22 09:31:41	1001	指纹
138	Pengyz	0	2023-03-22 09:37:39	1002	指纹
139	Pengyz	0	2023-03-22 09:37:39	1002	指纹
140	Pengyz	0	2023-03-22 09:37:40	1002	指纹
141	Pengyz	0	2023-03-22 09:37:41	1002	指纹
142	Pengyz	0	2023-03-22 09:37:50	1001	指纹
143	Pengyz	0	2023-03-22 09:37:50	1001	指纹
144	Pengyz	0	2023-03-24 09:43:37	1001	指纹
145	Pengyz	0	2023-03-24 09:43:37	1001	指纹
146	Pengyz	0	2023-03-24 09:46:58	1001	指纹
147	Pengyz	0	2023-03-24 09:46:58	1001	指纹
148	Pengyz	0	2023-03-24 09:47:01	1002	指纹
149	Pengyz	0	2023-03-24 09:47:01	1002	指纹
150	Pengyz	0	2023-03-24 09:50:16	1002	指纹
151	Pengyz	0	2023-03-24 09:50:17	1002	指纹
152	Pengyz	0	2023-03-24 09:50:20	1001	指纹
153	Pengyz	0	2023-03-24 09:50:20	1001	指纹
154	Pengyz	0	2023-03-24 18:43:42	1008	指纹
155	Pengyz	0	2023-03-24 18:43:42	1008	指纹
156	Pengyz	0	2023-03-24 18:43:44	1001	指纹
157	Pengyz	0	2023-03-24 18:43:44	1001	指纹
158	Pengyz	0	2023-03-24 18:49:58	1008	指纹
159	Pengyz	0	2023-03-24 18:49:59	1008	指纹
160	Pengyz	0	2023-03-24 18:50:01	1001	指纹
161	Pengyz	0	2023-03-24 18:50:01	1001	指纹
162	Pengyz	0	2023-03-29 13:58:16	1001	指纹
163	Pengyz	0	2023-03-29 13:58:16	1001	指纹
164	Pengyz	0	2023-03-29 13:58:22	1002	指纹
165	Pengyz	0	2023-03-29 13:58:22	1002	指纹
166	Pengyz	0	2023-03-29 14:17:40	1002	指纹
167	Pengyz	0	2023-03-29 14:17:40	1002	指纹
168	Pengyz	0	2023-03-29 14:18:00	1001	指纹
169	Pengyz	0	2023-03-29 14:18:00	1001	指纹
170	Pengyz	0	2023-03-31 14:59:35	1002	指纹
171	Pengyz	0	2023-03-31 14:59:36	1002	指纹
172	Pengyz	0	2023-03-31 14:59:39	1001	指纹
173	Pengyz	0	2023-03-31 14:59:39	1001	指纹
174	Pengyz	0	2023-03-31 15:03:30	1002	指纹
175	Pengyz	0	2023-03-31 15:03:30	1002	指纹
176	Pengyz	0	2023-03-31 15:03:37	1001	指纹
177	Pengyz	0	2023-03-31 15:03:37	1001	指纹
178	Pengyz	0	2023-04-04 14:31:18	1001	指纹
179	Pengyz	0	2023-04-04 14:31:18	1001	指纹
180	Pengyz	0	2023-04-04 14:31:23	1002	指纹
181	Pengyz	0	2023-04-04 14:31:23	1002	指纹
182	Pengyz	0	2023-04-04 14:45:10	1001	指纹
183	Pengyz	0	2023-04-04 14:45:12	1001	指纹
184	Pengyz	0	2023-04-04 14:45:13	1002	指纹
185	Pengyz	0	2023-04-04 14:45:14	1002	指纹
186	Pengyz	0	2023-04-05 13:27:10	1008	指纹
187	Pengyz	0	2023-04-05 13:27:12	1001	指纹
188	Pengyz	0	2023-04-05 13:27:38	1008	指纹
189	Pengyz	0	2023-04-05 13:27:40	1001	指纹
190	Pengyz	0	2023-04-07 09:20:00	1002	指纹
191	Pengyz	0	2023-04-07 09:20:05	1001	指纹
192	Pengyz	0	2023-04-07 09:33:52	1002	指纹
193	Pengyz	0	2023-04-07 09:33:54	1001	指纹
194	Pengyz	0	2023-04-07 11:10:35	1008	指纹
195	Pengyz	0	2023-04-07 11:10:37	1002	指纹
196	Pengyz	0	2023-04-07 11:10:47	1001	指纹
197	Pengyz	0	2023-04-07 11:10:54	1002	指纹
198	Pengyz	0	2023-04-07 11:12:13	1001	指纹
199	Pengyz	0	2023-04-07 11:12:16	1002	指纹
200	Pengyz	0	2023-04-07 11:14:15	1001	指纹
201	Pengyz	0	2023-04-07 11:14:20	1002	指纹
202	Pengyz	0	2023-04-07 11:37:43	1002	指纹
203	Pengyz	0	2023-04-07 11:37:58	1001	指纹
204	Pengyz	0	2023-04-10 15:43:36	1001	指纹
205	Pengyz	0	2023-04-10 15:43:39	1002	指纹
206	Pengyz	0	2023-04-10 16:11:08	1001	指纹
207	Pengyz	0	2023-04-10 16:11:11	1002	指纹
208	Pengyz	0	2023-04-11 10:11:23	1007	指纹
209	Pengyz	0	2023-04-11 10:13:18	1000333	指纹
210	Pengyz	0	2023-04-11 10:13:21	1007	指纹
211	Pengyz	0	2023-04-11 11:25:57	1007	指纹
212	Pengyz	0	2023-04-11 11:26:00	1000333	指纹
213	Pengyz	0	2023-04-11 13:53:00	1000333	指纹
214	Pengyz	0	2023-04-11 13:53:04	1000328	指纹
215	Pengyz	0	2023-04-11 13:57:45	1000404	指纹
216	Pengyz	0	2023-04-11 13:58:04	1000404	指纹
217	Pengyz	0	2023-04-11 13:58:08	1000241	指纹
218	Pengyz	0	2023-04-11 14:01:28	1000241	指纹
219	Pengyz	0	2023-04-11 14:01:33	1000404	指纹
220	Pengyz	0	2023-04-11 15:12:15	1000333	指纹
221	Pengyz	0	2023-04-11 15:12:18	1000328	指纹
222	Pengyz	0	2023-04-11 15:14:30	1000241	指纹
223	Pengyz	0	2023-04-11 15:14:33	1000404	指纹
224	Pengyz	0	2023-04-11 16:21:00	1000241	指纹
225	Pengyz	0	2023-04-11 16:21:02	1000404	指纹
226	Pengyz	0	2023-04-11 17:21:31	1008	指纹
227	Pengyz	0	2023-04-11 17:21:33	1001	指纹
228	Pengyz	0	2023-04-11 17:22:53	1008	指纹
229	Pengyz	0	2023-04-11 17:22:55	1001	指纹
230	Pengyz	0	2023-04-11 17:29:10	1000241	指纹
231	Pengyz	0	2023-04-11 17:29:15	1000404	指纹
232	Pengyz	0	2023-04-11 18:19:29	1000404	指纹
233	Pengyz	0	2023-04-11 18:19:32	1000241	指纹
234	Pengyz	0	2023-04-12 10:07:17	1001	指纹
235	Pengyz	0	2023-04-12 10:07:18	1002	指纹
236	Pengyz	0	2023-04-12 10:21:17	1002	指纹
237	Pengyz	0	2023-04-12 10:21:53	1001	指纹
238	Pengyz	0	2023-04-13 10:46:19	1000333	指纹
239	Pengyz	0	2023-04-13 10:46:27	1000328	指纹
240	Pengyz	0	2023-04-13 11:33:28	1000333	指纹
241	Pengyz	0	2023-04-13 11:33:33	1000328	指纹
242	Pengyz	0	2023-04-13 12:47:23	1000333	指纹
243	Pengyz	0	2023-04-13 12:47:27	1000328	指纹
244	Pengyz	0	2023-04-13 16:08:21	1000333	指纹
245	Pengyz	0	2023-04-13 16:08:24	1000328	指纹
246	Pengyz	0	2023-04-17 15:34:51	1005	指纹
247	Pengyz	0	2023-04-17 15:35:00	1003	指纹
248	Pengyz	0	2023-04-17 15:39:03	1009	指纹
249	Pengyz	0	2023-04-17 15:39:08	1010	指纹
250	Pengyz	0	2023-04-17 15:41:17	1005	指纹
251	Pengyz	0	2023-04-17 15:44:19	1010	指纹
252	Pengyz	0	2023-04-17 15:44:22	1009	指纹
253	Pengyz	0	2023-04-18 09:23:20	1000241	指纹
254	Pengyz	0	2023-04-18 09:23:23	1000404	指纹
255	Pengyz	0	2023-04-18 09:38:11	1000241	指纹
256	Pengyz	0	2023-04-18 09:38:15	1000404	指纹
257	Pengyz	0	2023-04-18 09:40:56	1000241	指纹
258	Pengyz	0	2023-04-18 09:40:59	1000404	指纹
259	Pengyz	0	2023-04-18 10:24:18	1000241	指纹
260	Pengyz	0	2023-04-18 10:24:21	1000404	指纹
261	Pengyz	0	2023-04-18 11:09:08	1003	指纹
262	Pengyz	0	2023-04-18 11:09:11	1007	指纹
263	Pengyz	0	2023-04-18 11:09:20	1003	指纹
264	Pengyz	0	2023-04-18 11:09:29	1007	指纹
265	Pengyz	0	2023-04-18 11:10:10	1003	指纹
266	Pengyz	0	2023-04-18 11:10:14	1007	指纹
267	Pengyz	0	2023-04-18 11:16:23	1007	指纹
268	Pengyz	0	2023-04-18 11:16:25	1003	指纹
269	Pengyz	0	2023-04-18 13:13:37	1000404	指纹
270	Pengyz	0	2023-04-18 13:13:40	1000241	指纹
271	Pengyz	0	2023-04-18 14:46:23	1000404	指纹
272	Pengyz	0	2023-04-18 14:46:25	1000241	指纹
273	Pengyz	0	2023-04-19 13:27:28	1005	指纹
274	Pengyz	0	2023-04-19 13:27:31	1006	指纹
275	Pengyz	0	2023-04-19 13:28:58	1006	指纹
276	Pengyz	0	2023-04-19 13:29:00	1005	指纹
277	Pengyz	0	2023-04-26 08:23:12	1007	指纹
278	Pengyz	0	2023-04-26 08:23:14	1003	指纹
279	Pengyz	0	2023-04-26 08:24:13	1002	指纹
280	Pengyz	0	2023-04-26 08:24:18	1001	指纹
281	Pengyz	0	2023-04-26 08:29:26	1007	指纹
282	Pengyz	0	2023-04-26 08:29:30	1003	指纹
283	Pengyz	0	2023-04-26 08:30:53	1002	指纹
284	Pengyz	0	2023-04-26 08:30:56	1001	指纹
285	Pengyz	0	2023-04-26 08:44:35	1007	指纹
286	Pengyz	0	2023-04-26 08:44:37	1003	指纹
287	Pengyz	0	2023-04-26 09:09:19	1007	指纹
288	Pengyz	0	2023-04-26 09:09:22	1003	指纹
289	Pengyz	0	2023-05-03 15:37:41	1002	指纹
290	Pengyz	0	2023-05-03 15:37:47	1001	指纹
291	Pengyz	0	2023-05-03 16:02:31	1002	指纹
292	Pengyz	0	2023-05-03 16:02:46	1001	指纹
293	Pengyz	0	2023-05-08 14:05:19	1002	指纹
294	Pengyz	0	2023-05-08 14:05:19	1002	指纹
295	Pengyz	0	2023-05-08 14:08:29	1001	指纹
296	Pengyz	0	2023-05-08 14:08:35	1002	指纹
297	Pengyz	0	2023-05-08 14:11:19	1002	指纹
298	Pengyz	0	2023-05-08 14:11:36	1001	指纹
299	Pengyz	0	2023-05-15 07:57:59	1001	指纹
300	Pengyz	0	2023-05-15 07:58:04	1002	指纹
301	Pengyz	0	2023-05-15 08:28:52	1002	指纹
302	Pengyz	0	2023-05-15 08:28:59	1002	指纹
303	Pengyz	0	2023-05-15 08:29:12	1001	指纹
304	Pengyz	0	2023-05-15 10:26:11	1001	指纹
305	Pengyz	0	2023-05-15 10:26:14	1002	指纹
306	Pengyz	0	2023-05-15 10:36:00	1001	指纹
307	Pengyz	0	2023-05-15 10:36:01	1002	指纹
308	Pengyz	0	2023-05-16 09:53:26	1002	指纹
309	Pengyz	0	2023-05-16 09:53:29	1001	指纹
310	Pengyz	0	2023-05-16 10:05:49	1001	指纹
311	Pengyz	0	2023-05-16 10:05:56	1002	指纹
312	Pengyz	0	2023-05-26 13:49:19	1002	指纹
313	Pengyz	0	2023-05-26 13:49:30	1001	指纹
314	Pengyz	0	2023-05-26 14:01:33	1002	指纹
315	Pengyz	0	2023-05-26 14:01:33	1002	指纹
316	Pengyz	0	2023-05-26 14:01:47	1001	指纹
317	Pengyz	0	2023-05-29 11:15:38	1007	指纹
318	Pengyz	0	2023-05-29 11:15:40	1003	指纹
319	Pengyz	0	2023-05-29 11:18:57	1007	指纹
320	Pengyz	0	2023-05-29 11:18:59	1003	指纹
321	Pengyz	0	2023-05-29 14:26:10	1001	指纹
322	Pengyz	0	2023-05-29 14:26:10	1001	指纹
323	Pengyz	0	2023-05-29 14:26:47	1001	指纹
324	Pengyz	0	2023-05-29 14:26:53	1002	指纹
325	Pengyz	0	2023-05-29 14:27:00	1002	指纹
326	Pengyz	0	2023-05-29 14:30:27	1002	指纹
327	Pengyz	0	2023-05-29 14:30:35	1001	指纹
328	Pengyz	0	2023-05-30 18:33:45	1002	指纹
329	Pengyz	0	2023-05-30 18:34:21	1001	指纹
330	Pengyz	0	2023-05-30 18:56:44	1002	指纹
331	Pengyz	0	2023-05-30 18:56:58	1001	指纹
332	Pengyz	0	2023-05-31 10:37:45	1002	指纹
333	Pengyz	0	2023-05-31 10:37:48	1001	指纹
334	Pengyz	0	2023-05-31 10:42:46	1001	指纹
335	Pengyz	0	2023-05-31 10:42:48	1002	指纹
336	Pengyz	0	2023-05-31 17:30:42	1007	指纹
337	Pengyz	0	2023-05-31 17:30:46	1003	指纹
338	Pengyz	0	2023-05-31 18:11:43	1007	指纹
339	Pengyz	0	2023-05-31 18:11:45	1003	指纹
340	Pengyz	0	2023-06-01 17:22:07	1003	指纹
341	Pengyz	0	2023-06-01 17:22:10	1007	指纹
342	Pengyz	0	2023-06-01 17:23:25	1003	指纹
343	Pengyz	0	2023-06-01 17:23:29	1007	指纹
344	Pengyz	0	2023-06-01 17:25:00	1003	指纹
345	Pengyz	0	2023-06-01 17:25:03	1007	指纹
346	Pengyz	0	2023-06-01 17:25:19	1003	指纹
347	Pengyz	0	2023-06-01 17:25:21	1007	指纹
348	Pengyz	0	2023-06-01 17:25:30	1007	指纹
349	Pengyz	0	2023-06-01 17:25:32	1003	指纹
350	Pengyz	0	2023-06-01 17:25:38	1003	指纹
351	Pengyz	0	2023-06-01 17:25:40	1007	指纹
352	Pengyz	0	2023-06-01 17:25:45	1003	指纹
353	Pengyz	0	2023-06-01 17:25:47	1007	指纹
354	Pengyz	0	2023-06-09 10:26:17	1002	指纹
355	Pengyz	0	2023-06-09 10:26:35	1001	指纹
356	Pengyz	0	2023-06-09 10:38:00	1001	指纹
357	Pengyz	0	2023-06-09 10:38:07	1002	指纹
358	Pengyz	0	2023-06-13 08:44:50	1002	指纹
359	Pengyz	0	2023-06-13 08:44:53	1001	指纹
360	Pengyz	0	2023-06-13 08:51:14	1002	指纹
361	Pengyz	0	2023-06-13 08:51:16	1001	指纹
362	Pengyz	0	2023-06-28 10:46:23	1001	指纹
363	Pengyz	0	2023-06-28 10:46:25	1002	指纹
364	Pengyz	0	2023-06-28 11:01:31	1001	指纹
365	Pengyz	0	2023-06-28 11:01:34	1002	指纹
366	Pengyz	0	2023-07-07 10:16:43	1001	指纹
367	Pengyz	0	2023-07-07 10:16:46	1002	指纹
368	Pengyz	0	2023-07-07 10:26:31	1002	指纹
369	Pengyz	0	2023-07-07 10:26:52	1001	指纹
370	Pengyz	0	2023-07-11 09:33:46	1002	指纹
371	Pengyz	0	2023-07-11 09:33:47	1002	指纹
372	Pengyz	0	2023-07-11 09:33:49	1001	指纹
373	Pengyz	0	2023-07-11 09:44:28	1001	指纹
374	Pengyz	0	2023-07-11 09:44:32	1002	指纹
375	Pengyz	0	2023-07-11 09:44:34	1002	指纹
376	Pengyz	0	2023-07-11 11:37:55	1002	指纹
377	Pengyz	0	2023-07-11 11:37:57	1001	指纹
378	Pengyz	0	2023-07-11 11:45:40	1002	指纹
379	Pengyz	0	2023-07-11 11:45:43	1001	指纹
380	Pengyz	0	2023-07-18 11:02:18	1002	指纹
381	Pengyz	0	2023-07-18 11:02:20	1001	指纹
382	Pengyz	0	2023-07-18 11:15:10	1001	指纹
383	Pengyz	0	2023-07-18 11:15:13	1002	指纹
384	Pengyz	0	2023-07-28 10:23:48	1002	指纹
385	Pengyz	0	2023-07-28 10:23:52	1001	指纹
386	Pengyz	0	2023-07-28 10:27:58	1001	指纹
387	Pengyz	0	2023-07-28 10:28:02	1002	指纹
388	Pengyz	0	2023-08-10 09:31:41	1002	指纹
389	Pengyz	0	2023-08-10 09:32:01	1001	指纹
390	Pengyz	0	2023-08-10 10:07:11	1002	指纹
391	Pengyz	0	2023-08-10 10:07:40	1001	指纹
392	Pengyz	0	2023-08-17 11:01:05	1001	指纹
393	Pengyz	0	2023-08-17 11:01:08	1002	指纹
394	Pengyz	0	2023-08-17 11:17:15	1002	指纹
395	Pengyz	0	2023-08-17 11:17:18	1001	指纹
396	Pengyz	0	2023-08-17 13:49:43	1002	指纹
397	Pengyz	0	2023-08-17 13:49:47	1001	指纹
398	Pengyz	0	2023-08-17 13:55:44	1001	指纹
399	Pengyz	0	2023-08-17 13:55:49	1002	指纹
400	Pengyz	0	2023-08-17 13:59:09	1001	指纹
401	Pengyz	0	2023-08-17 13:59:12	1002	指纹
402	Pengyz	0	2023-08-17 14:07:56	1002	指纹
403	Pengyz	0	2023-08-17 14:08:04	1001	指纹
404	Pengyz	0	2023-08-23 09:36:35	1002	指纹
405	Pengyz	0	2023-08-23 09:36:39	1001	指纹
406	Pengyz	0	2023-08-23 09:52:52	1002	指纹
407	Pengyz	0	2023-08-23 09:52:55	1001	指纹
408	Pengyz	0	2023-08-30 08:51:54	1001	指纹
409	Pengyz	0	2023-08-30 08:51:57	1002	指纹
410	Pengyz	0	2023-08-30 09:36:25	1001	指纹
411	Pengyz	0	2023-08-30 09:36:30	1002	指纹
412	Pengyz	0	2023-09-01 13:45:43	1001	指纹
413	Pengyz	0	2023-09-01 13:45:46	1002	指纹
414	Pengyz	0	2023-09-01 13:56:03	1001	指纹
415	Pengyz	0	2023-09-01 13:56:06	1002	指纹
416	Pengyz	0	2023-09-05 15:32:54	1002	指纹
417	Pengyz	0	2023-09-05 15:32:57	1001	指纹
418	Pengyz	0	2023-09-05 16:19:24	1002	指纹
419	Pengyz	0	2023-09-05 16:19:47	1001	指纹
420	Pengyz	0	2023-09-08 15:21:42	1002	指纹
421	Pengyz	0	2023-09-08 15:21:45	1001	指纹
422	Pengyz	0	2023-09-08 15:36:07	1002	指纹
423	Pengyz	0	2023-09-08 15:36:09	1002	指纹
424	Pengyz	0	2023-09-08 15:36:18	1001	指纹
425	Pengyz	0	2023-09-11 13:39:20	1001	指纹
426	Pengyz	0	2023-09-11 13:39:21	1002	指纹
427	Pengyz	0	2023-09-11 13:39:32	1001	指纹
428	Pengyz	0	2023-09-11 13:39:33	1002	指纹
429	Pengyz	0	2023-09-11 14:06:35	1001	指纹
430	Pengyz	0	2023-09-11 14:06:37	1002	指纹
431	Pengyz	0	2023-09-15 15:25:01	1002	指纹
432	Pengyz	0	2023-09-15 15:25:03	1001	指纹
433	Pengyz	0	2023-09-15 15:40:02	1002	指纹
434	Pengyz	0	2023-09-15 15:40:35	1001	指纹
435	Pengyz	0	2023-09-16 09:56:59	1002	指纹
436	Pengyz	0	2023-09-16 09:57:01	1001	指纹
437	Pengyz	0	2023-09-16 10:02:30	1002	指纹
438	Pengyz	0	2023-09-16 10:02:34	1001	指纹
439	Pengyz	0	2023-09-16 10:09:26	1002	指纹
440	Pengyz	0	2023-09-16 10:09:28	1001	指纹
441	Pengyz	0	2023-09-16 10:18:27	1002	指纹
442	Pengyz	0	2023-09-16 10:18:37	1001	指纹
443	Pengyz	0	2023-09-19 09:36:06	1003	指纹
444	Pengyz	0	2023-09-19 09:36:08	1007	指纹
445	Pengyz	0	2023-09-19 10:49:19	1003	指纹
446	Pengyz	0	2023-09-19 10:49:29	1007	指纹
447	Pengyz	0	2023-09-19 16:00:49	1001	指纹
448	Pengyz	0	2023-09-19 16:00:50	1002	指纹
449	Pengyz	0	2023-09-19 16:03:58	1001	指纹
450	Pengyz	0	2023-09-19 16:04:02	1002	指纹
451	Pengyz	0	2023-09-19 16:09:41	1002	指纹
452	Pengyz	0	2023-09-19 16:09:44	1001	指纹
453	Pengyz	0	2023-09-19 16:10:46	1002	指纹
454	Pengyz	0	2023-09-19 16:10:49	1001	指纹
455	Pengyz	0	2023-09-20 16:20:25	1002	指纹
456	Pengyz	0	2023-09-20 16:20:28	1001	指纹
457	Pengyz	0	2023-09-20 16:24:38	1001	指纹
458	Pengyz	0	2023-09-20 16:24:40	1002	指纹
459	Pengyz	0	2023-09-26 16:55:04	1002	指纹
460	Pengyz	0	2023-09-26 16:55:12	1001	指纹
461	Pengyz	0	2023-09-27 16:38:04	1002	指纹
462	Pengyz	0	2023-09-27 16:40:44	1002	指纹
463	Pengyz	0	2023-09-27 16:40:47	1001	指纹
464	Pengyz	0	2023-09-27 16:57:57	1001	指纹
465	Pengyz	0	2023-09-27 16:58:00	1002	指纹
466	Pengyz	0	2023-10-09 10:09:38	1001	指纹
467	Pengyz	0	2023-10-09 10:09:46	1002	指纹
468	Pengyz	0	2023-10-09 10:34:35	1002	指纹
469	Pengyz	0	2023-10-09 10:34:38	1001	指纹
470	Pengyz	0	2023-10-10 09:10:23	1002	指纹
471	Pengyz	0	2023-10-10 09:10:26	1001	指纹
472	Pengyz	0	2023-10-10 09:51:24	1002	指纹
473	Pengyz	0	2023-10-10 09:51:29	1001	指纹
474	Pengyz	0	2023-10-17 09:07:17	1002	指纹
475	Pengyz	0	2023-10-17 09:07:27	1001	指纹
476	Pengyz	0	2023-10-17 09:10:05	1001	指纹
477	Pengyz	0	2023-10-17 09:10:09	1002	指纹
478	Pengyz	0	2023-10-17 09:20:36	1007	指纹
479	Pengyz	0	2023-10-17 09:20:41	1003	指纹
480	Pengyz	0	2023-10-17 10:03:48	1003	指纹
481	Pengyz	0	2023-10-17 10:03:54	1007	指纹
482	Pengyz	0	2023-10-17 14:51:23	1002	指纹
483	Pengyz	0	2023-10-17 14:51:26	1001	指纹
484	Pengyz	0	2023-10-17 15:15:16	1001	指纹
485	Pengyz	0	2023-10-17 15:15:22	1002	指纹
486	Pengyz	0	2023-10-18 14:00:31	1003	指纹
487	Pengyz	0	2023-10-18 14:00:33	1007	指纹
488	Pengyz	0	2023-10-18 14:14:12	1007	指纹
489	Pengyz	0	2023-10-18 14:14:14	1003	指纹
490	Pengyz	0	2023-10-20 10:09:15	1002	指纹
491	Pengyz	0	2023-10-20 10:09:18	1001	指纹
492	Pengyz	0	2023-10-20 10:13:23	1002	指纹
493	Pengyz	0	2023-10-20 10:13:26	1001	指纹
494	Pengyz	0	2023-10-27 13:47:49	1002	指纹
495	Pengyz	0	2023-10-27 13:47:54	1001	指纹
496	Pengyz	0	2023-10-27 13:55:27	1001	指纹
497	Pengyz	0	2023-10-27 13:55:30	1002	指纹
498	Pengyz	0	2023-11-03 13:40:45	1001	指纹
499	Pengyz	0	2023-11-03 13:40:47	1002	指纹
500	Pengyz	0	2023-11-03 13:49:18	1002	指纹
501	Pengyz	0	2023-11-03 13:49:19	1002	指纹
502	Pengyz	0	2023-11-03 13:49:22	1001	指纹
503	Pengyz	0	2023-11-10 09:37:04	1002	指纹
504	Pengyz	0	2023-11-10 09:37:06	1001	指纹
505	Pengyz	0	2023-11-10 09:53:33	1001	指纹
506	Pengyz	0	2023-11-10 09:53:37	1002	指纹
507	Pengyz	0	2023-11-23 15:20:04	1002	指纹
508	Pengyz	0	2023-11-23 15:20:08	1001	指纹
509	Pengyz	0	2023-11-23 15:41:23	1002	指纹
510	Pengyz	0	2023-11-23 15:41:26	1001	指纹
511	Pengyz	0	2023-11-30 14:46:10	1002	指纹
512	Pengyz	0	2023-11-30 14:46:13	1001	指纹
513	Pengyz	0	2023-11-30 14:59:26	1002	指纹
514	Pengyz	0	2023-11-30 14:59:29	1001	指纹
515	Pengyz	0	2023-12-04 10:44:02	1001	指纹
516	Pengyz	0	2023-12-04 10:44:04	1002	指纹
517	Pengyz	0	2023-12-04 10:47:52	1002	指纹
518	Pengyz	0	2023-12-04 10:47:56	1001	指纹
519	Pengyz	0	2023-12-19 15:32:35	1002	指纹
520	Pengyz	0	2023-12-19 15:32:38	1001	指纹
521	Pengyz	0	2023-12-19 15:48:12	1002	指纹
522	Pengyz	0	2023-12-19 15:48:16	1002	指纹
523	Pengyz	0	2023-12-19 15:48:36	1001	指纹
524	Pengyz	0	2023-12-25 09:03:41	1002	指纹
525	Pengyz	0	2023-12-25 09:05:15	1001	指纹
526	Pengyz	0	2023-12-25 09:05:21	1002	指纹
527	Pengyz	0	2023-12-25 09:05:23	1002	指纹
528	Pengyz	0	2023-12-25 09:14:46	1002	指纹
529	Pengyz	0	2023-12-25 09:14:54	1001	指纹
530	Pengyz	0	2024-01-04 09:45:45	1001	指纹
531	Pengyz	0	2024-01-04 09:45:47	1002	指纹
532	Pengyz	0	2024-01-04 09:54:38	1002	指纹
533	Pengyz	0	2024-01-04 09:54:42	1001	指纹
534	Pengyz	0	2024-01-04 10:14:18	1002	指纹
535	Pengyz	0	2024-01-04 10:14:21	1001	指纹
536	Pengyz	0	2024-01-04 10:16:30	1001	指纹
537	Pengyz	0	2024-01-04 10:16:32	1002	指纹
538	Pengyz	0	2024-01-06 08:40:28	1001	指纹
539	Pengyz	0	2024-01-06 08:40:29	1002	指纹
540	Pengyz	0	2024-01-06 08:43:43	1002	指纹
541	Pengyz	0	2024-01-06 08:43:59	1001	指纹
542	Pengyz	0	2024-01-08 15:21:18	1002	指纹
543	Pengyz	0	2024-01-08 15:21:53	1002	指纹
544	Pengyz	0	2024-01-08 15:21:53	1002	指纹
545	Pengyz	0	2024-01-08 15:21:58	1001	指纹
546	Pengyz	0	2024-01-08 15:26:08	1002	指纹
547	Pengyz	0	2024-01-08 15:26:11	1001	指纹
548	Pengyz	0	2024-02-01 15:51:49	1002	指纹
549	Pengyz	0	2024-02-01 15:51:53	1001	指纹
550	Pengyz	0	2024-02-01 15:57:38	1001	指纹
551	Pengyz	0	2024-02-01 15:57:41	1002	指纹
552	Pengyz	0	2024-02-19 10:07:00	1001	指纹
553	Pengyz	0	2024-02-19 10:07:02	1002	指纹
554	Pengyz	0	2024-02-19 10:24:18	1001	指纹
555	Pengyz	0	2024-02-19 10:24:20	1002	指纹
556	Pengyz	0	2024-02-28 08:48:33	1002	指纹
557	Pengyz	0	2024-02-28 08:48:42	1001	指纹
558	Pengyz	0	2024-02-28 08:56:48	1002	指纹
559	Pengyz	0	2024-02-28 08:57:04	1001	指纹
560	Pengyz	0	2024-03-05 10:59:55	1002	指纹
561	Pengyz	0	2024-03-05 10:59:57	1001	指纹
562	Pengyz	0	2024-03-05 11:11:36	1002	指纹
563	Pengyz	0	2024-03-05 11:11:40	1001	指纹
564	Pengyz	0	2024-03-13 11:17:00	1002	指纹
565	Pengyz	0	2024-03-13 11:17:02	1001	指纹
566	Pengyz	0	2024-03-13 11:33:26	1002	指纹
567	Pengyz	0	2024-03-13 11:33:30	1001	指纹
568	Pengyz	0	2024-03-19 16:42:23	1001	指纹
569	Pengyz	0	2024-03-19 16:42:25	1002	指纹
570	Pengyz	0	2024-03-19 16:47:01	1002	指纹
571	Pengyz	0	2024-03-19 16:47:03	1001	指纹
572	Pengyz	0	2024-03-22 13:52:28	1003	指纹
573	Pengyz	0	2024-03-22 13:52:31	1007	指纹
574	Pengyz	0	2024-03-22 14:02:53	1003	指纹
575	Pengyz	0	2024-03-22 14:06:00	1003	指纹
576	Pengyz	0	2024-03-22 14:06:08	1007	指纹
577	Pengyz	0	2024-03-22 14:09:36	1010	指纹
578	Pengyz	0	2024-03-22 14:09:39	1001	指纹
579	Pengyz	0	2024-03-22 14:14:21	1001	指纹
580	Pengyz	0	2024-03-22 14:14:23	1010	指纹
581	Pengyz	0	2024-03-25 11:09:09	1005	指纹
582	Pengyz	0	2024-03-25 11:09:11	1006	指纹
583	Pengyz	0	2024-03-25 11:09:25	1001	指纹
584	Pengyz	0	2024-03-25 11:09:27	1002	指纹
585	Pengyz	0	2024-03-25 11:12:24	1002	指纹
586	Pengyz	0	2024-03-25 11:12:26	1001	指纹
587	Pengyz	0	2024-03-25 11:21:11	1005	指纹
588	Pengyz	0	2024-03-25 11:21:13	1006	指纹
589	Pengyz	0	2024-03-26 09:18:14	1007	指纹
590	Pengyz	0	2024-03-26 09:18:17	1003	指纹
591	Pengyz	0	2024-03-26 09:50:16	1003	指纹
592	Pengyz	0	2024-03-26 09:50:18	1007	指纹
593	Pengyz	0	2024-03-26 09:51:40	1003	指纹
594	Pengyz	0	2024-03-26 09:51:42	1007	指纹
595	Pengyz	0	2024-03-26 09:52:09	1007	指纹
596	Pengyz	0	2024-03-26 09:52:13	1003	指纹
597	Pengyz	0	2024-03-26 09:54:29	1002	指纹
598	Pengyz	0	2024-03-26 09:54:31	1001	指纹
599	Pengyz	0	2024-03-26 10:19:25	1001	指纹
600	Pengyz	0	2024-03-26 10:19:28	1002	指纹
601	Pengyz	0	2024-03-26 10:38:41	1005	指纹
602	Pengyz	0	2024-03-26 10:38:44	1006	指纹
603	Pengyz	0	2024-03-26 11:31:05	1005	指纹
604	Pengyz	0	2024-03-26 11:31:08	1006	指纹
605	Pengyz	0	2024-04-02 14:38:47	1001	指纹
606	Pengyz	0	2024-04-02 14:38:51	1002	指纹
607	Pengyz	0	2024-04-02 14:45:34	1001	指纹
608	Pengyz	0	2024-04-02 14:45:39	1002	指纹
609	Pengyz	0	2024-04-08 10:18:05	1002	指纹
610	Pengyz	0	2024-04-08 10:18:07	1001	指纹
611	Pengyz	0	2024-04-08 10:21:33	1001	指纹
612	Pengyz	0	2024-04-08 10:21:36	1002	指纹
613	Pengyz	0	2024-04-08 11:40:31	1001	指纹
614	Pengyz	0	2024-04-17 14:23:16	1002	指纹
615	Pengyz	0	2024-04-17 14:23:18	1001	指纹
616	Pengyz	0	2024-04-17 14:28:46	1002	指纹
617	Pengyz	0	2024-04-17 14:29:16	1001	指纹
618	Pengyz	0	2024-04-22 13:50:28	1002	指纹
619	Pengyz	0	2024-04-22 13:50:31	1001	指纹
620	Pengyz	0	2024-04-22 14:04:41	1002	指纹
621	Pengyz	0	2024-04-22 14:04:44	1001	指纹
622	Pengyz	0	2024-04-22 14:20:35	1002	指纹
623	Pengyz	0	2024-04-22 14:20:39	1001	指纹
624	Pengyz	0	2024-04-22 14:49:30	1002	指纹
625	Pengyz	0	2024-04-22 14:49:35	1001	指纹
626	Pengyz	0	2024-04-22 14:50:50	1001	指纹
627	Pengyz	0	2024-04-22 14:50:52	1002	指纹
628	Pengyz	0	2024-04-23 11:26:29	1002	指纹
629	Pengyz	0	2024-04-23 11:26:32	1001	指纹
630	Pengyz	0	2024-04-23 11:28:37	1002	指纹
631	Pengyz	0	2024-04-23 11:28:39	1001	指纹
632	Pengyz	0	2024-04-23 11:29:08	1002	指纹
633	Pengyz	0	2024-04-23 11:29:13	1001	指纹
634	Pengyz	0	2024-04-24 10:54:43	1002	指纹
635	Pengyz	0	2024-04-24 10:54:46	1001	指纹
636	Pengyz	0	2024-04-24 11:00:37	1002	指纹
637	Pengyz	0	2024-04-24 11:00:50	1001	指纹
638	Pengyz	0	2024-04-24 11:03:08	1001	指纹
639	Pengyz	0	2024-04-24 11:03:10	1002	指纹
640	Pengyz	0	2024-04-24 11:07:15	1002	指纹
641	Pengyz	0	2024-04-24 11:07:18	1001	指纹
642	Pengyz	0	2024-04-25 09:31:22	1002	指纹
643	Pengyz	0	2024-04-25 09:31:27	1001	指纹
644	Pengyz	0	2024-04-25 09:38:37	1002	指纹
645	Pengyz	0	2024-04-25 09:38:39	1001	指纹
646	Pengyz	0	2024-04-26 09:28:13	1001	指纹
647	Pengyz	0	2024-04-26 09:28:15	1002	指纹
648	Pengyz	0	2024-04-26 09:30:04	1002	指纹
649	Pengyz	0	2024-04-26 09:30:09	1001	指纹
650	Pengyz	0	2024-04-26 10:20:24	1001985	指纹
651	Pengyz	0	2024-04-26 10:20:27	1004731	指纹
652	Pengyz	0	2024-04-26 10:28:11	1004731	指纹
653	Pengyz	0	2024-04-26 10:28:14	1001985	指纹
654	Pengyz	0	2024-04-26 10:28:31	1004731	指纹
655	Pengyz	0	2024-04-26 10:28:34	1001985	指纹
656	Pengyz	0	2024-04-26 10:29:00	1004731	指纹
657	Pengyz	0	2024-04-26 10:29:03	1001985	指纹
658	Pengyz	0	2024-04-26 10:29:29	1004731	指纹
659	Pengyz	0	2024-04-26 10:29:32	1001985	指纹
660	Pengyz	0	2024-04-26 10:30:23	1001985	指纹
661	Pengyz	0	2024-04-26 10:30:25	1004731	指纹
662	Pengyz	0	2024-04-26 10:31:28	1004731	指纹
663	Pengyz	0	2024-04-26 10:31:31	1001985	指纹
664	Pengyz	0	2024-04-26 10:45:49	1001985	指纹
665	Pengyz	0	2024-04-26 10:45:54	1004731	指纹
666	Pengyz	0	2024-04-26 10:50:12	1001985	指纹
667	Pengyz	0	2024-04-26 10:50:16	1004731	指纹
668	Pengyz	0	2024-04-26 11:37:43	1001985	指纹
669	Pengyz	0	2024-04-26 11:37:46	1004731	指纹
670	Pengyz	0	2024-04-26 13:36:59	1003	指纹
671	Pengyz	0	2024-04-26 13:37:02	1000328	指纹
672	Pengyz	0	2024-04-26 14:07:36	1001985	指纹
673	Pengyz	0	2024-04-26 14:07:39	1004731	指纹
674	Pengyz	0	2024-04-26 14:18:32	1004731	指纹
675	Pengyz	0	2024-04-26 14:18:35	1001985	指纹
676	Pengyz	0	2024-04-26 15:01:11	1000328	指纹
677	Pengyz	0	2024-04-26 15:01:15	1003	指纹
678	Pengyz	0	2024-04-30 09:56:54	1001	指纹
679	Pengyz	0	2024-04-30 09:56:57	1002	指纹
680	Pengyz	0	2024-04-30 10:30:29	1001	指纹
681	Pengyz	0	2024-04-30 10:30:33	1002	指纹
682	Pengyz	0	2024-04-30 10:34:27	1001	指纹
683	Pengyz	0	2024-04-30 10:34:31	1001	指纹
684	Pengyz	0	2024-04-30 10:34:35	1001	指纹
685	Pengyz	0	2024-04-30 10:34:38	1001	指纹
686	Pengyz	0	2024-04-30 10:34:42	1001	指纹
687	Pengyz	0	2024-04-30 10:34:45	1001	指纹
688	Pengyz	0	2024-04-30 10:34:49	1001	指纹
689	Pengyz	0	2024-04-30 10:34:53	1001	指纹
690	Pengyz	0	2024-04-30 10:34:56	1001	指纹
691	Pengyz	0	2024-04-30 10:34:59	1001	指纹
692	Pengyz	0	2024-04-30 10:35:02	1001	指纹
693	Pengyz	0	2024-04-30 10:35:07	1001	指纹
694	Pengyz	0	2024-04-30 10:35:11	1001	指纹
695	Pengyz	0	2024-04-30 10:35:14	1001	指纹
696	Pengyz	0	2024-04-30 10:35:16	1001	指纹
697	Pengyz	0	2024-05-06 14:22:40	1002	指纹
698	Pengyz	0	2024-05-06 14:22:41	1002	指纹
699	Pengyz	0	2024-05-06 14:22:48	1001	指纹
700	Pengyz	0	2024-05-06 14:27:01	1002	指纹
701	Pengyz	0	2024-05-06 14:27:08	1001	指纹
702	Pengyz	0	2024-05-07 13:41:41	1000328	指纹
703	Pengyz	0	2024-05-07 13:41:48	1000333	指纹
704	Pengyz	0	2024-05-07 13:42:23	1002	指纹
705	Pengyz	0	2024-05-07 13:42:24	1002	指纹
706	Pengyz	0	2024-05-07 13:42:26	1001	指纹
707	Pengyz	0	2024-05-07 13:46:11	1002	指纹
708	Pengyz	0	2024-05-07 13:46:31	1001	指纹
709	Pengyz	0	2024-05-07 14:36:47	1000333	指纹
710	Pengyz	0	2024-05-07 14:36:49	1000328	指纹
711	Pengyz	0	2024-05-07 14:37:14	1000328	指纹
712	Pengyz	0	2024-05-07 14:37:17	1000333	指纹
713	Pengyz	0	2024-05-07 15:03:16	1000328	指纹
714	Pengyz	0	2024-05-07 15:03:19	1000333	指纹
715	Pengyz	0	2024-05-07 15:08:09	1004731	指纹
716	Pengyz	0	2024-05-07 15:08:15	1001985	指纹
717	Pengyz	0	2024-05-07 15:42:00	1001985	指纹
718	Pengyz	0	2024-05-07 15:42:02	1004731	指纹
719	Pengyz	0	2024-05-07 16:16:31	1001985	指纹
720	Pengyz	0	2024-05-07 16:16:36	1004731	指纹
721	Pengyz	0	2024-05-07 16:19:08	1004731	指纹
722	Pengyz	0	2024-05-07 16:19:11	1001985	指纹
723	Pengyz	0	2024-05-08 10:21:40	1004731	指纹
724	Pengyz	0	2024-05-08 10:21:55	1001985	指纹
725	Pengyz	0	2024-05-08 10:40:28	1001985	指纹
726	Pengyz	0	2024-05-08 10:40:31	1004731	指纹
727	Pengyz	0	2024-05-08 10:47:49	1001985	指纹
728	Pengyz	0	2024-05-08 10:47:51	1004731	指纹
729	Pengyz	0	2024-05-08 10:54:06	1001985	指纹
730	Pengyz	0	2024-05-08 10:54:09	1004731	指纹
731	Pengyz	0	2024-05-08 10:55:15	1004731	指纹
732	Pengyz	0	2024-05-08 10:55:18	1001985	指纹
733	Pengyz	0	2024-05-08 10:56:31	1004731	指纹
734	Pengyz	0	2024-05-08 10:56:34	1001985	指纹
735	Pengyz	0	2024-05-08 10:57:40	1001985	指纹
736	Pengyz	0	2024-05-08 10:57:43	1004731	指纹
737	Pengyz	0	2024-05-08 11:00:54	1000328	指纹
738	Pengyz	0	2024-05-08 11:00:57	1000333	指纹
739	Pengyz	0	2024-05-08 11:21:57	1000328	指纹
740	Pengyz	0	2024-05-08 11:22:02	1000333	指纹
741	Pengyz	0	2024-05-08 11:24:41	1000328	指纹
742	Pengyz	0	2024-05-08 11:24:43	1000333	指纹
743	Pengyz	0	2024-05-08 11:25:03	1000333	指纹
744	Pengyz	0	2024-05-08 11:25:09	1000328	指纹
745	Pengyz	0	2024-05-08 11:26:07	1002	指纹
746	Pengyz	0	2024-05-08 11:26:12	1001	指纹
747	Pengyz	0	2024-05-08 11:51:25	1002	指纹
748	Pengyz	0	2024-05-08 11:52:31	1002	指纹
749	Pengyz	0	2024-05-08 11:52:34	1001	指纹
750	Pengyz	0	2024-05-08 11:54:08	1002	指纹
751	Pengyz	0	2024-05-08 11:54:10	1001	指纹
752	Pengyz	0	2024-05-08 11:55:52	1002	指纹
753	Pengyz	0	2024-05-08 11:55:55	1001	指纹
754	Pengyz	0	2024-05-08 14:09:25	1004731	指纹
755	Pengyz	0	2024-05-08 14:09:28	1001985	指纹
756	Pengyz	0	2024-05-08 16:02:03	1004731	指纹
757	Pengyz	0	2024-05-08 16:02:06	1001985	指纹
758	Pengyz	0	2024-05-08 16:52:46	1000328	指纹
759	Pengyz	0	2024-05-08 16:52:49	1000333	指纹
760	Pengyz	0	2024-05-08 16:53:00	1000328	指纹
761	Pengyz	0	2024-05-08 16:53:02	1000333	指纹
762	Pengyz	0	2024-05-08 16:56:23	1000328	指纹
763	Pengyz	0	2024-05-08 16:56:26	1000333	指纹
764	Pengyz	0	2024-05-08 16:56:57	1000328	指纹
765	Pengyz	0	2024-05-08 16:56:59	1000333	指纹
766	Pengyz	0	2024-05-08 18:26:39	1000333	指纹
767	Pengyz	0	2024-05-08 18:26:42	1000328	指纹
768	Pengyz	0	2024-05-10 17:20:05	1002	指纹
769	Pengyz	0	2024-05-10 17:20:08	1001	指纹
770	Pengyz	0	2024-05-10 17:21:25	1002	指纹
771	Pengyz	0	2024-05-10 17:21:28	1001	指纹
772	Pengyz	0	2024-05-23 08:34:50	1007	指纹
773	Pengyz	0	2024-05-23 08:34:54	1003	指纹
774	Pengyz	0	2024-05-23 08:53:17	1003	指纹
775	Pengyz	0	2024-05-23 08:53:19	1007	指纹
776	Pengyz	0	2024-05-23 10:50:23	1000328	指纹
777	Pengyz	0	2024-05-23 10:50:25	1003	指纹
778	Pengyz	0	2024-05-23 11:04:48	1003	指纹
779	Pengyz	0	2024-05-23 11:05:21	1003	指纹
780	Pengyz	0	2024-05-23 11:05:23	1000328	指纹
781	Pengyz	0	2024-05-23 13:54:45	1000328	指纹
782	Pengyz	0	2024-05-23 13:54:49	1003	指纹
783	Pengyz	0	2024-05-23 13:54:54	1003	指纹
784	Pengyz	0	2024-05-23 13:55:05	1000328	指纹
785	Pengyz	0	2024-05-23 13:56:08	1000328	指纹
786	Pengyz	0	2024-05-23 13:56:11	1003	指纹
787	Pengyz	0	2024-05-23 14:00:40	1000328	指纹
788	Pengyz	0	2024-05-23 14:00:44	1003	指纹
789	Pengyz	0	2024-05-23 14:02:22	1003	指纹
790	Pengyz	0	2024-05-23 14:02:24	1000328	指纹
791	Pengyz	0	2024-05-23 14:03:04	1000328	指纹
792	Pengyz	0	2024-05-23 14:03:07	1003	指纹
793	Pengyz	0	2024-05-23 14:03:33	1000328	指纹
794	Pengyz	0	2024-05-23 14:03:40	1003	指纹
795	Pengyz	0	2024-05-23 14:04:01	1003	指纹
796	Pengyz	0	2024-05-23 14:04:04	1000328	指纹
797	Pengyz	0	2024-05-23 14:38:59	1003	指纹
798	Pengyz	0	2024-05-23 14:39:02	1000328	指纹
799	Pengyz	0	2024-05-23 14:39:12	1003	指纹
800	Pengyz	0	2024-05-23 14:39:17	1000328	指纹
801	Pengyz	0	2024-05-23 14:39:25	1000328	指纹
802	Pengyz	0	2024-05-23 14:39:28	1003	指纹
803	Pengyz	0	2024-05-23 14:41:03	1003	指纹
804	Pengyz	0	2024-05-23 14:41:06	1000328	指纹
805	Pengyz	0	2024-05-24 10:32:07	1007	指纹
806	Pengyz	0	2024-05-24 10:32:10	1003	指纹
807	Pengyz	0	2024-05-24 11:43:09	1003	指纹
808	Pengyz	0	2024-05-24 11:43:12	1007	指纹
809	Pengyz	0	2024-05-30 08:27:14	1002	指纹
810	Pengyz	0	2024-05-30 08:27:17	1001	指纹
811	Pengyz	0	2024-05-30 08:45:42	1001	指纹
812	Pengyz	0	2024-05-30 08:45:44	1002	指纹
813	Pengyz	0	2024-06-05 16:59:55	1002	指纹
814	Pengyz	0	2024-06-05 16:59:56	1001	指纹
815	Pengyz	0	2024-06-07 09:28:11	1001	指纹
816	Pengyz	0	2024-06-07 09:28:14	1002	指纹
817	Pengyz	0	2024-06-07 09:28:16	1002	指纹
818	Pengyz	0	2024-06-07 09:37:12	1002	指纹
819	Pengyz	0	2024-06-07 09:37:16	1001	指纹
820	Pengyz	0	2024-06-11 08:50:29	1002	指纹
821	Pengyz	0	2024-06-11 08:50:32	1001	指纹
822	Pengyz	0	2024-06-11 09:02:21	1002	指纹
823	Pengyz	0	2024-06-11 09:02:25	1001	指纹
824	Pengyz	0	2024-06-12 14:19:53	1002	指纹
825	Pengyz	0	2024-06-12 14:19:55	1001	指纹
826	Pengyz	0	2024-06-12 14:27:25	1002	指纹
827	Pengyz	0	2024-06-12 14:28:48	1001	指纹
828	Pengyz	0	2024-06-12 14:28:53	1002	指纹
829	Pengyz	0	2024-07-02 15:58:29	1001	指纹
830	Pengyz	0	2024-07-02 15:58:30	1002	指纹
831	Pengyz	0	2024-07-02 16:08:44	1002	指纹
832	Pengyz	0	2024-07-02 16:08:45	1002	指纹
833	Pengyz	0	2024-07-02 16:08:46	1001	指纹
834	Pengyz	0	2024-07-15 09:39:58	1002	指纹
835	Pengyz	0	2024-07-15 09:40:01	1001	指纹
836	Pengyz	0	2024-07-15 09:44:31	1001	指纹
837	Pengyz	0	2024-07-15 09:44:33	1002	指纹
838	Pengyz	0	2024-07-16 16:08:29	1001	指纹
839	Pengyz	0	2024-07-16 16:08:35	1002	指纹
840	Pengyz	0	2024-07-16 16:11:47	1001	指纹
841	Pengyz	0	2024-07-16 16:12:15	1002	指纹
842	Pengyz	0	2024-07-17 11:12:59	1002	指纹
843	Pengyz	0	2024-07-17 11:13:00	1002	指纹
844	Pengyz	0	2024-07-17 11:13:17	1001	指纹
845	Pengyz	0	2024-07-17 11:58:35	1002	指纹
846	Pengyz	0	2024-07-17 11:59:18	1001	指纹
847	Pengyz	0	2024-07-24 08:58:19	1001	指纹
848	Pengyz	0	2024-07-24 08:58:23	1002	指纹
849	Pengyz	0	2024-07-24 09:07:10	1002	指纹
850	Pengyz	0	2024-07-24 09:07:14	1001	指纹
851	Pengyz	0	2024-07-25 14:34:46	1003	指纹
852	Pengyz	0	2024-07-25 14:34:47	1007	指纹
853	Pengyz	0	2024-07-25 14:34:57	1007	指纹
854	Pengyz	0	2024-07-25 14:34:59	1003	指纹
855	Pengyz	0	2024-07-25 14:36:32	1007	指纹
856	Pengyz	0	2024-07-25 14:36:34	1003	指纹
857	Pengyz	0	2024-07-25 14:36:42	1003	指纹
858	Pengyz	0	2024-07-25 14:36:45	1007	指纹
859	Pengyz	0	2024-07-25 14:37:15	1007	指纹
860	Pengyz	0	2024-07-25 14:37:16	1003	指纹
861	Pengyz	0	2024-07-25 14:38:30	1007	指纹
862	Pengyz	0	2024-07-25 14:38:36	1003	指纹
863	Pengyz	0	2024-07-25 15:08:42	1007	指纹
864	Pengyz	0	2024-07-25 15:08:46	1003	指纹
865	Pengyz	0	2024-07-25 15:09:51	1003	指纹
866	Pengyz	0	2024-07-25 15:09:54	1007	指纹
867	Pengyz	0	2024-07-25 15:11:02	1007	指纹
868	Pengyz	0	2024-07-25 15:11:05	1003	指纹
869	Pengyz	0	2024-07-25 16:54:21	1001	指纹
870	Pengyz	0	2024-07-25 16:54:24	1002	指纹
871	Pengyz	0	2024-07-25 16:55:01	1002	指纹
872	Pengyz	0	2024-07-25 16:55:08	1001	指纹
873	Pengyz	0	2024-07-25 17:11:37	1002	指纹
874	Pengyz	0	2024-07-25 17:11:40	1001	指纹
875	Pengyz	0	2024-07-25 17:14:17	1001	指纹
876	Pengyz	0	2024-07-25 17:14:19	1002	指纹
877	Pengyz	0	2024-07-25 17:15:17	1002	指纹
878	Pengyz	0	2024-07-25 17:15:19	1001	指纹
879	Pengyz	0	2024-07-26 08:43:54	1007	指纹
880	Pengyz	0	2024-07-26 08:43:58	1003	指纹
881	Pengyz	0	2024-07-26 08:43:59	1002	指纹
882	Pengyz	0	2024-07-26 08:45:44	1007	指纹
883	Pengyz	0	2024-07-26 08:45:47	1003	指纹
884	Pengyz	0	2024-07-26 08:46:35	1007	指纹
885	Pengyz	0	2024-07-26 08:46:42	1003	指纹
886	Pengyz	0	2024-07-26 08:46:43	1003	指纹
887	Pengyz	0	2024-07-26 08:50:01	1007	指纹
888	Pengyz	0	2024-07-26 08:50:03	1003	指纹
889	Pengyz	0	2024-07-26 08:53:16	1007	指纹
890	Pengyz	0	2024-07-26 08:53:18	1003	指纹
891	Pengyz	0	2024-07-26 08:54:08	1003	指纹
892	Pengyz	0	2024-07-26 08:54:11	1007	指纹
893	Pengyz	0	2024-07-26 08:54:55	1002	指纹
894	Pengyz	0	2024-07-26 08:54:59	1001	指纹
895	Pengyz	0	2024-07-26 08:55:58	1007	指纹
896	Pengyz	0	2024-07-26 08:56:01	1003	指纹
897	Pengyz	0	2024-07-26 08:56:55	1007	指纹
898	Pengyz	0	2024-07-26 08:56:58	1003	指纹
899	Pengyz	0	2024-07-26 08:58:25	1003	指纹
900	Pengyz	0	2024-07-26 08:58:31	1007	指纹
901	Pengyz	0	2024-07-26 08:59:34	1002	指纹
902	Pengyz	0	2024-07-26 08:59:42	1001	指纹
903	Pengyz	0	2024-07-26 09:01:05	1003	指纹
904	Pengyz	0	2024-07-26 09:01:09	1007	指纹
905	Pengyz	0	2024-07-26 09:02:48	1003	指纹
906	Pengyz	0	2024-07-26 09:02:55	1007	指纹
907	Pengyz	0	2024-07-26 09:04:13	1003	指纹
908	Pengyz	0	2024-07-26 09:04:22	1007	指纹
909	Pengyz	0	2024-07-26 09:07:29	1007	指纹
910	Pengyz	0	2024-07-26 09:07:35	1003	指纹
911	Pengyz	0	2024-07-26 09:08:10	1007	指纹
912	Pengyz	0	2024-07-26 09:08:12	1003	指纹
913	Pengyz	0	2024-07-26 09:09:37	1007	指纹
914	Pengyz	0	2024-07-26 09:09:39	1003	指纹
915	Pengyz	0	2024-07-26 09:11:03	1007	指纹
916	Pengyz	0	2024-07-26 09:11:07	1003	指纹
917	Pengyz	0	2024-07-26 09:12:14	1007	指纹
918	Pengyz	0	2024-07-26 09:12:16	1003	指纹
919	Pengyz	0	2024-07-26 09:12:55	1003	指纹
920	Pengyz	0	2024-07-26 09:13:04	1007	指纹
921	Pengyz	0	2024-07-26 09:14:22	1007	指纹
922	Pengyz	0	2024-07-26 09:14:24	1003	指纹
923	Pengyz	0	2024-07-26 10:22:20	1002	指纹
924	Pengyz	0	2024-07-26 10:22:25	1001	指纹
925	Pengyz	0	2024-07-26 10:22:37	1001	指纹
926	Pengyz	0	2024-07-26 10:22:44	1002	指纹
927	Pengyz	0	2024-07-26 10:24:50	1007	指纹
928	Pengyz	0	2024-07-26 10:24:52	1003	指纹
929	Pengyz	0	2024-07-26 10:30:12	1002	指纹
930	Pengyz	0	2024-07-26 10:30:14	1001	指纹
931	Pengyz	0	2024-07-26 10:30:39	1002	指纹
932	Pengyz	0	2024-07-26 10:30:43	1001	指纹
933	Pengyz	0	2024-07-26 10:36:48	1007	指纹
934	Pengyz	0	2024-07-26 10:36:51	1003	指纹
935	Pengyz	0	2024-07-26 10:37:18	1007	指纹
936	Pengyz	0	2024-07-26 10:37:22	1003	指纹
937	Pengyz	0	2024-07-26 10:38:54	1002	指纹
938	Pengyz	0	2024-07-26 10:38:57	1001	指纹
939	Pengyz	0	2024-07-26 13:40:49	1002	指纹
940	Pengyz	0	2024-07-26 13:40:56	1001	指纹
941	Pengyz	0	2024-07-26 13:46:43	1001	指纹
942	Pengyz	0	2024-07-26 13:46:46	1002	指纹
943	Pengyz	0	2024-08-14 13:55:57	1002	指纹
944	Pengyz	0	2024-08-14 13:55:59	1001	指纹
945	Pengyz	0	2024-08-14 14:00:08	1005	指纹
946	Pengyz	0	2024-08-14 14:00:10	1006	指纹
947	Pengyz	0	2024-08-14 14:00:41	1005	指纹
948	Pengyz	0	2024-08-14 14:00:43	1006	指纹
949	Pengyz	0	2024-08-14 14:01:32	1005	指纹
950	Pengyz	0	2024-08-14 14:01:34	1006	指纹
951	Pengyz	0	2024-08-14 14:01:48	1005	指纹
952	Pengyz	0	2024-08-14 14:01:50	1006	指纹
953	Pengyz	0	2024-08-14 14:06:05	1002	指纹
954	Pengyz	0	2024-08-14 14:08:01	1002	指纹
955	Pengyz	0	2024-08-14 14:08:04	1001	指纹
956	Pengyz	0	2024-08-15 10:26:11	1000328	指纹
957	Pengyz	0	2024-08-15 10:26:14	1003	指纹
958	Pengyz	0	2024-08-15 10:27:12	1000328	指纹
959	Pengyz	0	2024-08-15 10:27:14	1003	指纹
960	Pengyz	0	2024-08-15 10:29:10	1000328	指纹
961	Pengyz	0	2024-08-15 10:29:12	1003	指纹
962	Pengyz	0	2024-08-15 10:29:37	1000328	指纹
963	Pengyz	0	2024-08-15 10:29:40	1003	指纹
964	Pengyz	0	2024-08-15 10:30:56	1000328	指纹
965	Pengyz	0	2024-08-15 10:31:00	1003	指纹
966	Pengyz	0	2024-08-15 10:35:02	1000328	指纹
967	Pengyz	0	2024-08-15 10:35:06	1003	指纹
968	Pengyz	0	2024-08-15 10:35:22	1000328	指纹
969	Pengyz	0	2024-08-15 10:35:26	1003	指纹
970	Pengyz	0	2024-08-15 10:41:36	1000328	指纹
971	Pengyz	0	2024-08-15 10:41:41	1003	指纹
972	Pengyz	0	2024-08-15 12:03:01	1003	指纹
973	Pengyz	0	2024-08-15 12:03:10	1000328	指纹
974	Pengyz	0	2024-08-20 10:25:18	1001	指纹
975	Pengyz	0	2024-08-20 10:25:22	1002	指纹
976	Pengyz	0	2024-08-27 14:39:33	1001	指纹
977	Pengyz	0	2024-08-27 14:39:42	1002	指纹
978	Pengyz	0	2024-08-27 14:43:35	1002	指纹
979	Pengyz	0	2024-08-27 14:43:46	1001	指纹
980	Pengyz	0	2024-09-03 10:50:33	1002	指纹
981	Pengyz	0	2024-09-03 10:50:45	1001	指纹
982	Pengyz	0	2024-09-03 10:53:07	1002	指纹
983	Pengyz	0	2024-09-03 10:53:09	1001	指纹
984	Pengyz	0	2024-09-03 10:53:29	1002	指纹
985	Pengyz	0	2024-09-03 10:53:32	1001	指纹
986	Pengyz	0	2024-09-03 18:22:44	1001	指纹
987	Pengyz	0	2024-09-03 18:22:47	1002	指纹
988	Pengyz	0	2024-09-04 08:19:23	1007	指纹
989	Pengyz	0	2024-09-04 08:19:25	1003	指纹
990	Pengyz	0	2024-09-04 08:20:42	1003	指纹
991	Pengyz	0	2024-09-04 08:20:45	1007	指纹
992	Pengyz	0	2024-09-04 08:21:24	1007	指纹
993	Pengyz	0	2024-09-04 08:21:28	1003	指纹
994	Pengyz	0	2024-09-04 08:23:02	1003	指纹
995	Pengyz	0	2024-09-04 08:23:05	1007	指纹
996	Pengyz	0	2024-09-04 08:24:55	1002	指纹
997	Pengyz	0	2024-09-04 08:27:26	1002	指纹
998	Pengyz	0	2024-09-04 08:27:30	1001	指纹
999	Pengyz	0	2024-09-04 08:30:19	1002	指纹
1000	Pengyz	0	2024-09-04 08:30:22	1001	指纹
1001	Pengyz	0	2024-09-04 08:30:25	1007	指纹
1002	Pengyz	0	2024-09-04 08:30:28	1003	指纹
1003	Pengyz	0	2024-09-04 08:47:11	1007	指纹
1004	Pengyz	0	2024-09-04 08:47:13	1003	指纹
1005	Pengyz	0	2024-09-04 10:33:29	1007	指纹
1006	Pengyz	0	2024-09-04 10:33:31	1003	指纹
1007	Pengyz	0	2024-09-04 10:46:42	1003	指纹
1008	Pengyz	0	2024-09-04 10:46:46	1007	指纹
1009	Pengyz	0	2024-09-04 10:49:08	1002	指纹
1010	Pengyz	0	2024-09-04 10:49:15	1001	指纹
1011	Pengyz	0	2024-09-04 10:56:55	1002	指纹
1012	Pengyz	0	2024-09-04 10:58:04	1002	指纹
1013	Pengyz	0	2024-09-04 10:58:08	1001	指纹
\.


--
-- Data for Name: verify_mode; Type: TABLE DATA; Schema: public; Owner: aqfadmin
--

COPY public.verify_mode (id, name, number, sign) FROM stdin;
\.


--
-- Name: alarm_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.alarm_event_id_seq', 1, false);


--
-- Name: alarm_phone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.alarm_phone_id_seq', 7, true);


--
-- Name: alarm_phone_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.alarm_phone_number_id_seq', 1, false);


--
-- Name: alarm_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.alarm_record_id_seq', 463, true);


--
-- Name: analog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.analog_id_seq', 1, false);


--
-- Name: analog_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.analog_v_id_seq', 1, false);


--
-- Name: channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.channel_id_seq', 1, false);


--
-- Name: digit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.digit_id_seq', 1, false);


--
-- Name: digit_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.digit_v_id_seq', 1, false);


--
-- Name: module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.module_id_seq', 1, false);


--
-- Name: op_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.op_log_id_seq', 538, true);


--
-- Name: out_in_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.out_in_record_id_seq', 817, true);


--
-- Name: point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.point_id_seq', 1, false);


--
-- Name: station_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.station_display_id_seq', 1, false);


--
-- Name: station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.station_id_seq', 1, false);


--
-- Name: time_sync_op_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.time_sync_op_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.user_id_seq', 22, true);


--
-- Name: verification_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.verification_log_id_seq', 8990, true);


--
-- Name: verification_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.verification_record_id_seq', 1013, true);


--
-- Name: verify_mode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aqfadmin
--

SELECT pg_catalog.setval('public.verify_mode_id_seq', 1, false);


--
-- Name: alarm_event alarm_event_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.alarm_event
    ADD CONSTRAINT alarm_event_pkey PRIMARY KEY (id);


--
-- Name: alarm_phone_number alarm_phone_number_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.alarm_phone_number
    ADD CONSTRAINT alarm_phone_number_pkey PRIMARY KEY (id);


--
-- Name: alarm_phone alarm_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.alarm_phone
    ADD CONSTRAINT alarm_phone_pkey PRIMARY KEY (id);


--
-- Name: alarm_record alarm_record_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.alarm_record
    ADD CONSTRAINT alarm_record_pkey PRIMARY KEY (id);


--
-- Name: analog analog_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.analog
    ADD CONSTRAINT analog_pkey PRIMARY KEY (id);


--
-- Name: analog_v analog_v_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.analog_v
    ADD CONSTRAINT analog_v_pkey PRIMARY KEY (id);


--
-- Name: channel channel_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (id);


--
-- Name: digit digit_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.digit
    ADD CONSTRAINT digit_pkey PRIMARY KEY (id);


--
-- Name: digit_v digit_v_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.digit_v
    ADD CONSTRAINT digit_v_pkey PRIMARY KEY (id);


--
-- Name: module module_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.module
    ADD CONSTRAINT module_pkey PRIMARY KEY (id);


--
-- Name: op_log op_log_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.op_log
    ADD CONSTRAINT op_log_pkey PRIMARY KEY (id);


--
-- Name: out_in_record out_in_record_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.out_in_record
    ADD CONSTRAINT out_in_record_pkey PRIMARY KEY (id);


--
-- Name: point point_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.point
    ADD CONSTRAINT point_pkey PRIMARY KEY (id);


--
-- Name: station_display station_display_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.station_display
    ADD CONSTRAINT station_display_pkey PRIMARY KEY (id);


--
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (id);


--
-- Name: time_sync_op time_sync_op_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.time_sync_op
    ADD CONSTRAINT time_sync_op_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: verification_log verification_log_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.verification_log
    ADD CONSTRAINT verification_log_pkey PRIMARY KEY (id);


--
-- Name: verification_record verification_record_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.verification_record
    ADD CONSTRAINT verification_record_pkey PRIMARY KEY (id);


--
-- Name: verify_mode verify_mode_pkey; Type: CONSTRAINT; Schema: public; Owner: aqfadmin
--

ALTER TABLE ONLY public.verify_mode
    ADD CONSTRAINT verify_mode_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: aqfadmin
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO aqfadmin;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

