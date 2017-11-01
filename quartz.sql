- ----------------------------
-- Table structure for `quartz_task_informations`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_informations`;
CREATE TABLE `quartz_task_informations` (
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


-- ----------------------------
-- Table structure for `quartz_task_records`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_records`;
CREATE TABLE `quartz_task_records` (
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


-- ----------------------------
-- Table structure for `quartz_task_errors`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_errors`;
CREATE TABLE `quartz_task_errors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taskExecuteRecordId` varchar(64) NOT NULL COMMENT '记录id',
  `errorKey` varchar(1024) NOT NULL COMMENT '错误key',
  `errorValue` text COMMENT '错误',
  `createTime` bigint(13) NOT NULL COMMENT '创建时间',
  `lastModifyTime` bigint(13) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='id';
