- ----------------------------
-- Table structure for `quartz_task_informations`
-- ----------------------------
DROP TABLE IF EXISTS `t_qrtz_task_informations`;
DROP TABLE IF EXISTS `t_qrtz_task_errors`;
DROP TABLE IF EXISTS `t_qrtz_task_records`;

CREATE TABLE `t_qrtz_task_informations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL COMMENT '版本号',
  `taskNo` varchar(64) NOT NULL COMMENT '任务序列号',
  `taskName` varchar(64) NOT NULL COMMENT '任务名称',
  `schedulerRule` varchar(64) NOT NULL COMMENT '调度计划',
  `frozenStatus` varchar(16) NOT NULL COMMENT '冻结状态',
  `executorNo` varchar(128) NOT NULL COMMENT '执行编号',
  `frozenTime` bigint(13) DEFAULT NULL COMMENT '冻结时间',
  `unfrozenTime` bigint(13) DEFAULT NULL COMMENT '解冻时间',
  `createTime` bigint(13) NOT NULL COMMENT '创建时间',
  `lastModifyTime` bigint(13) DEFAULT NULL COMMENT '最后修改时间',
  `sendType` varchar(64) DEFAULT NULL COMMENT '发送类型',
  `url` varchar(64) DEFAULT NULL COMMENT '地址',
  `executeParamter` varchar(2000) DEFAULT NULL COMMENT '执行参数',
  `timeKey` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='id';


CREATE TABLE `t_qrtz_task_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taskNo` varchar(64) NOT NULL COMMENT '任务序列号',
  `timeKeyValue` varchar(32) DEFAULT NULL COMMENT '任务key',
  `executeTime` bigint(13) NOT NULL COMMENT '执行时间',
  `taskStatus` varchar(16) NOT NULL COMMENT '任务状态',
  `failcount` int(10) DEFAULT NULL COMMENT '失败次数',
  `failReason` varchar(64) DEFAULT NULL COMMENT '失败原因',
  `createTime` bigint(13) NOT NULL COMMENT '创建时间',
  `lastModifyTime` bigint(13) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_task_records_taskno` (`taskNo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='id';


CREATE TABLE `t_qrtz_task_errors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taskExecuteRecordId` varchar(64) NOT NULL COMMENT '记录id',
  `errorKey` varchar(1024) NOT NULL COMMENT '错误key',
  `errorValue` text COMMENT '错误',
  `createTime` bigint(13) NOT NULL COMMENT '创建时间',
  `lastModifyTime` bigint(13) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='id';

-- 集群表
DROP TABLE IF EXISTS T_QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS T_QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS T_QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS T_QRTZ_LOCKS;
DROP TABLE IF EXISTS T_QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS T_QRTZ_SIMPROP_TRIGGERS;
DROP TABLE IF EXISTS T_QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS T_QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS T_QRTZ_TRIGGERS;
DROP TABLE IF EXISTS T_QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS T_QRTZ_CALENDARS;


CREATE TABLE T_QRTZ_JOB_DETAILS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    JOB_CLASS_NAME   VARCHAR(250) NOT NULL,
    IS_DURABLE VARCHAR(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE T_QRTZ_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    NEXT_FIRE_TIME BIGINT(13) NULL,
    PREV_FIRE_TIME BIGINT(13) NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME BIGINT(13) NOT NULL,
    END_TIME BIGINT(13) NULL,
    CALENDAR_NAME VARCHAR(200) NULL,
    MISFIRE_INSTR SMALLINT(2) NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
        REFERENCES T_QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE T_QRTZ_SIMPLE_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    REPEAT_COUNT BIGINT(7) NOT NULL,
    REPEAT_INTERVAL BIGINT(12) NOT NULL,
    TIMES_TRIGGERED BIGINT(10) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES T_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE T_QRTZ_CRON_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    CRON_EXPRESSION VARCHAR(200) NOT NULL,
    TIME_ZONE_ID VARCHAR(80),
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES T_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE T_QRTZ_SIMPROP_TRIGGERS
  (          
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
    REFERENCES T_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE T_QRTZ_BLOB_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES T_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE T_QRTZ_CALENDARS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    CALENDAR_NAME  VARCHAR(200) NOT NULL,
    CALENDAR BLOB NOT NULL,
    PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);

CREATE TABLE T_QRTZ_PAUSED_TRIGGER_GRPS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR(200) NOT NULL, 
    PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);

CREATE TABLE T_QRTZ_FIRED_TRIGGERS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    FIRED_TIME BIGINT(13) NOT NULL,
    SCHED_TIME BIGINT(13) NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(200) NULL,
    JOB_GROUP VARCHAR(200) NULL,
    IS_NONCONCURRENT VARCHAR(1) NULL,
    REQUESTS_RECOVERY VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

CREATE TABLE T_QRTZ_SCHEDULER_STATE
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
    CHECKIN_INTERVAL BIGINT(13) NOT NULL,
    PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);

CREATE TABLE T_QRTZ_LOCKS
  (
    SCHED_NAME VARCHAR(120) NOT NULL,
    LOCK_NAME  VARCHAR(40) NOT NULL, 
    PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);


commit;

