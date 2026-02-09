/*
 Navicat Premium Dump SQL

 Source Server         : zx
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : soil

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 09/02/2026 16:36:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for soil_alert_record
-- ----------------------------
DROP TABLE IF EXISTS `soil_alert_record`;
CREATE TABLE `soil_alert_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rule_id` bigint NOT NULL COMMENT '规则ID',
  `field_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地块编号',
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备编号',
  `parameter_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数类型',
  `current_value` decimal(10, 3) NULL DEFAULT NULL COMMENT '当前值',
  `threshold_value` decimal(10, 3) NULL DEFAULT NULL COMMENT '阈值',
  `alert_level` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '预警级别',
  `alert_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预警消息',
  `alert_time` datetime NOT NULL COMMENT '预警时间',
  `handle_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '处理状态(0未处理 1已处理 2已忽略)',
  `handle_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理人',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `handle_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rule_id`(`rule_id` ASC) USING BTREE,
  INDEX `idx_field_id`(`field_id` ASC) USING BTREE,
  INDEX `idx_alert_time`(`alert_time` ASC) USING BTREE,
  INDEX `idx_handle_status`(`handle_status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '预警记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soil_alert_record
-- ----------------------------

-- ----------------------------
-- Table structure for soil_alert_rule
-- ----------------------------
DROP TABLE IF EXISTS `soil_alert_rule`;
CREATE TABLE `soil_alert_rule`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则名称',
  `field_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地块编号(为空表示全局规则)',
  `parameter_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参数类型(temperature/humidity/ec/ph)',
  `min_value` decimal(10, 3) NULL DEFAULT NULL COMMENT '最小值',
  `max_value` decimal(10, 3) NULL DEFAULT NULL COMMENT '最大值',
  `alert_level` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '预警级别(1提醒 2警告 3严重)',
  `alert_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预警消息模板',
  `notification_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'system' COMMENT '通知方式(system/email/sms)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态(0启用 1禁用)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_field_id`(`field_id` ASC) USING BTREE,
  INDEX `idx_parameter_type`(`parameter_type` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '预警规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soil_alert_rule
-- ----------------------------
INSERT INTO `soil_alert_rule` VALUES (1, '土壤湿度过低预警', NULL, 'humidity', 30.000, NULL, '2', '土壤湿度过低({current_value}%)，建议及时灌溉', 'system', '0', '2026-01-19 16:37:49', NULL);
INSERT INTO `soil_alert_rule` VALUES (2, '土壤湿度过高预警', NULL, 'humidity', NULL, 80.000, '2', '土壤湿度过高({current_value}%)，注意排水防涝', 'system', '0', '2026-01-19 16:37:49', NULL);
INSERT INTO `soil_alert_rule` VALUES (3, '土壤温度异常预警', NULL, 'temperature', 5.000, 35.000, '1', '土壤温度异常({current_value}°C)，请关注作物生长状况', 'system', '0', '2026-01-19 16:37:49', NULL);
INSERT INTO `soil_alert_rule` VALUES (4, '土壤pH值异常预警', NULL, 'ph', 6.000, 8.000, '2', '土壤pH值异常({current_value})，建议调节土壤酸碱度', 'system', '0', '2026-01-19 16:37:49', NULL);
INSERT INTO `soil_alert_rule` VALUES (5, '土壤EC值过高预警', NULL, 'ec', NULL, 3.000, '2', '土壤盐分过高(EC:{current_value}mS/cm)，注意盐害防治', 'system', '0', '2026-01-19 16:37:49', NULL);

-- ----------------------------
-- Table structure for soil_data
-- ----------------------------
DROP TABLE IF EXISTS `soil_data`;
CREATE TABLE `soil_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备编号',
  `field_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地块编号',
  `temperature` decimal(5, 2) NULL DEFAULT NULL COMMENT '土壤温度(°C)',
  `humidity` decimal(5, 2) NULL DEFAULT NULL COMMENT '土壤湿度(%)',
  `ec_value` decimal(6, 3) NULL DEFAULT NULL COMMENT '电导率EC值(mS/cm)',
  `ph_value` decimal(4, 2) NULL DEFAULT NULL COMMENT '酸碱度pH值',
  `collect_time` datetime NOT NULL COMMENT '采集时间',
  `data_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '数据状态(0正常 1异常)',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `altitude` decimal(8, 2) NULL DEFAULT NULL COMMENT '海拔高度(m)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_field_id`(`field_id` ASC) USING BTREE,
  INDEX `idx_device_id`(`device_id` ASC) USING BTREE,
  INDEX `idx_collect_time`(`collect_time` ASC) USING BTREE,
  INDEX `idx_data_status`(`data_status` ASC) USING BTREE,
  INDEX `idx_soil_data_field_time`(`field_id` ASC, `collect_time` ASC) USING BTREE,
  INDEX `idx_soil_data_status_time`(`data_status` ASC, `collect_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '土壤数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soil_data
-- ----------------------------
INSERT INTO `soil_data` VALUES (1, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.36, 55.03, 0.915, 6.31, '2026-01-19 16:12:45', '0', 116.389514, 39.910205, 44.47, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (2, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.40, 56.87, 0.986, 5.76, '2026-01-19 15:12:45', '0', 116.411174, 39.901004, 45.76, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (3, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.20, 58.57, 1.002, 6.70, '2026-01-19 14:12:45', '0', 116.408164, 39.910147, 43.32, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (4, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.34, 58.27, 1.321, 6.77, '2026-01-19 13:12:45', '0', 116.406240, 39.909457, 47.14, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (5, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.08, 74.65, 1.200, 6.08, '2026-01-19 12:12:45', '0', 116.388611, 39.886258, 32.86, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (6, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.21, 61.54, 1.312, 6.19, '2026-01-19 11:12:45', '0', 116.391679, 39.895087, 36.08, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (7, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.88, 57.93, 0.396, 6.81, '2026-01-19 10:12:45', '0', 116.374196, 39.916871, 77.28, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (8, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.69, 61.62, 1.412, 5.09, '2026-01-19 09:12:45', '0', 116.402273, 39.898653, 55.74, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (9, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.77, 71.06, 1.064, 7.12, '2026-01-19 08:12:45', '0', 116.392829, 39.907748, 54.34, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (10, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.50, 60.21, 1.006, 5.49, '2026-01-19 07:12:45', '0', 116.395807, 39.917769, 48.45, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (11, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.67, 58.68, 1.401, 6.38, '2026-01-19 06:12:45', '0', 116.411984, 39.889666, 49.46, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (12, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.32, 74.21, 1.707, 5.88, '2026-01-19 05:12:45', '0', 116.406616, 39.914107, 33.44, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (13, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.85, 74.06, 1.578, 5.88, '2026-01-19 04:12:45', '0', 116.384937, 39.909478, 37.68, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (14, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.58, 78.14, 0.907, 6.59, '2026-01-19 03:12:45', '0', 116.398375, 39.907911, 46.19, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (15, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.67, 70.37, 1.311, 6.36, '2026-01-19 02:12:45', '0', 116.383306, 39.908851, 53.97, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (16, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.33, 62.65, 1.521, 5.67, '2026-01-19 01:12:45', '0', 116.414213, 39.921402, 43.60, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (17, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.88, 74.56, 1.011, 7.04, '2026-01-19 00:12:45', '0', 116.381310, 39.908853, 64.50, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (18, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.34, 70.17, 1.443, 6.34, '2026-01-18 23:12:45', '0', 116.409837, 39.902598, 52.49, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (19, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.90, 66.46, 1.352, 6.75, '2026-01-18 22:12:45', '0', 116.391459, 39.929435, 48.88, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (20, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.24, 74.87, 1.721, 5.96, '2026-01-18 21:12:45', '0', 116.400938, 39.904174, 50.33, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (21, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.46, 74.09, 1.358, 5.80, '2026-01-18 20:12:45', '0', 116.402299, 39.887089, 66.69, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (22, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.88, 76.81, 1.527, 6.25, '2026-01-18 19:12:45', '0', 116.406245, 39.915611, 49.11, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (23, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.06, 78.30, 1.818, 6.58, '2026-01-18 18:12:45', '0', 116.413910, 39.916869, 63.99, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (24, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.74, 75.04, 1.400, 5.67, '2026-01-18 17:12:45', '0', 116.389250, 39.911643, 54.46, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (25, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.76, 72.06, 1.342, 7.17, '2026-01-18 16:12:45', '0', 116.398498, 39.895413, 43.31, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (26, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.69, 65.71, 1.560, 7.13, '2026-01-18 15:12:45', '0', 116.388442, 39.909725, 79.08, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (27, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.28, 69.83, 0.737, 6.83, '2026-01-18 14:12:45', '0', 116.391774, 39.914287, 64.51, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (28, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.97, 79.53, 1.252, 5.75, '2026-01-18 13:12:45', '0', 116.399147, 39.919671, 64.43, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (29, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.33, 72.21, 1.183, 7.17, '2026-01-18 12:12:45', '0', 116.402965, 39.895554, 49.11, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (30, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.20, 81.12, 1.572, 6.70, '2026-01-18 11:12:45', '0', 116.390489, 39.926742, 39.75, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (31, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.97, 80.98, 1.877, 5.13, '2026-01-18 10:12:45', '0', 116.398348, 39.892796, 48.37, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (32, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.90, 66.57, 0.860, 7.21, '2026-01-18 09:12:45', '0', 116.393416, 39.918583, 49.65, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (33, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.55, 80.46, 1.284, 6.27, '2026-01-18 08:12:45', '0', 116.393184, 39.896453, 62.67, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (34, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.30, 71.23, 1.515, 6.30, '2026-01-18 07:12:45', '0', 116.401328, 39.903277, 57.41, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (35, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.03, 75.68, 0.689, 6.85, '2026-01-18 06:12:45', '0', 116.402392, 39.922981, 38.66, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (36, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.66, 87.40, 1.094, 5.63, '2026-01-18 05:12:45', '0', 116.392779, 39.897109, 45.36, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (37, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.54, 67.90, 1.344, 6.57, '2026-01-18 04:12:45', '0', 116.390205, 39.905172, 52.34, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (38, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.99, 79.87, 0.847, 5.75, '2026-01-18 03:12:45', '0', 116.397263, 39.915652, 54.43, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (39, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.26, 90.68, 0.824, 7.19, '2026-01-18 02:12:45', '0', 116.378705, 39.896144, 56.48, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (40, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.64, 77.08, 1.567, 7.03, '2026-01-18 01:12:45', '0', 116.397858, 39.929898, 60.03, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (41, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.66, 73.65, 1.037, 6.49, '2026-01-18 00:12:45', '0', 116.402896, 39.890809, 52.23, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (42, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.08, 81.10, 1.279, 6.83, '2026-01-17 23:12:45', '0', 116.393501, 39.908962, 67.89, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (43, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.96, 78.36, 1.276, 6.24, '2026-01-17 22:12:45', '0', 116.365302, 39.891247, 56.52, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (44, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.20, 76.09, 1.165, 5.59, '2026-01-17 21:12:45', '0', 116.388776, 39.919847, 62.34, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (45, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.46, 75.95, 1.332, 5.46, '2026-01-17 20:12:45', '0', 116.368878, 39.909747, 41.53, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (46, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.13, 84.34, 1.250, 6.84, '2026-01-17 19:12:45', '0', 116.408588, 39.910732, 64.09, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (47, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.97, 72.03, 1.800, 6.65, '2026-01-17 18:12:45', '0', 116.387481, 39.906843, 39.91, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (48, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.51, 78.20, 1.058, 6.47, '2026-01-17 17:12:45', '0', 116.398418, 39.913011, 57.82, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (49, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.45, 77.09, 1.148, 6.53, '2026-01-17 16:12:45', '0', 116.389516, 39.934533, 38.93, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (50, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.05, 73.60, 1.590, 6.48, '2026-01-17 15:12:45', '0', 116.401585, 39.924145, 47.94, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (51, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.70, 80.79, 1.728, 5.98, '2026-01-17 14:12:45', '0', 116.403831, 39.903697, 40.25, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (52, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.63, 83.58, 1.353, 5.22, '2026-01-17 13:12:45', '0', 116.417403, 39.906724, 63.42, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (53, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.50, 78.37, 0.965, 6.24, '2026-01-17 12:12:45', '0', 116.394936, 39.892155, 47.96, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (54, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.19, 76.88, 1.830, 6.90, '2026-01-17 11:12:45', '0', 116.376123, 39.908495, 59.17, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (55, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.66, 80.24, 1.457, 6.27, '2026-01-17 10:12:45', '0', 116.408693, 39.898997, 44.35, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (56, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.79, 85.65, 1.461, 6.17, '2026-01-17 09:12:45', '0', 116.374090, 39.909130, 45.22, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (57, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.56, 78.08, 1.565, 6.80, '2026-01-17 08:12:45', '0', 116.400265, 39.911940, 41.03, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (58, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.79, 73.55, 1.224, 7.38, '2026-01-17 07:12:45', '0', 116.416113, 39.904164, 52.14, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (59, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.35, 78.65, 1.691, 7.31, '2026-01-17 06:12:45', '0', 116.398055, 39.920657, 48.49, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (60, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.08, 80.78, 1.234, 6.10, '2026-01-17 05:12:45', '0', 116.392780, 39.902927, 33.39, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (61, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.36, 78.98, 0.937, 6.16, '2026-01-17 04:12:45', '0', 116.385231, 39.917219, 45.72, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (62, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.97, 66.26, 1.204, 7.23, '2026-01-17 03:12:45', '0', 116.424819, 39.906110, 36.65, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (63, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.75, 73.26, 1.371, 6.16, '2026-01-17 02:12:45', '0', 116.420346, 39.897402, 51.14, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (64, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.28, 66.34, 1.438, 5.91, '2026-01-17 01:12:45', '0', 116.384060, 39.915249, 46.58, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (65, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.16, 74.44, 1.069, 6.55, '2026-01-17 00:12:45', '0', 116.375809, 39.897297, 34.01, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (66, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.72, 59.23, 0.740, 5.94, '2026-01-16 23:12:45', '0', 116.378810, 39.933657, 34.41, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (67, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.86, 68.93, 1.094, 5.59, '2026-01-16 22:12:45', '0', 116.404098, 39.911016, 27.18, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (68, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.68, 67.77, 1.085, 6.14, '2026-01-16 21:12:45', '0', 116.386870, 39.908351, 52.97, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (69, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.04, 70.78, 0.685, 6.94, '2026-01-16 20:12:45', '0', 116.401380, 39.907146, 39.14, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (70, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.89, 72.97, 1.260, 6.16, '2026-01-16 19:12:45', '0', 116.399600, 39.912307, 42.42, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (71, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.30, 64.44, 1.619, 6.08, '2026-01-16 18:12:45', '0', 116.423260, 39.898193, 59.46, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (72, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.14, 64.99, 1.292, 6.35, '2026-01-16 17:12:45', '0', 116.397974, 39.914000, 39.60, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (73, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.87, 66.21, 1.234, 7.14, '2026-01-16 16:12:45', '0', 116.381844, 39.912596, 56.66, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (74, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.15, 66.10, 1.568, 7.22, '2026-01-16 15:12:45', '0', 116.408203, 39.910893, 44.74, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (75, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.40, 74.89, 1.255, 6.06, '2026-01-16 14:12:45', '0', 116.392874, 39.912884, 58.41, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (76, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.54, 69.05, 0.981, 5.79, '2026-01-16 13:12:45', '0', 116.381038, 39.907287, 71.24, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (77, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.73, 65.93, 1.141, 6.60, '2026-01-16 12:12:45', '0', 116.395820, 39.900657, 63.65, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (78, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.92, 59.87, 2.012, 6.73, '2026-01-16 11:12:45', '0', 116.409582, 39.888033, 35.71, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (79, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.38, 62.85, 0.710, 5.94, '2026-01-16 10:12:45', '0', 116.415811, 39.906664, 39.02, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (80, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.16, 59.83, 1.619, 6.29, '2026-01-16 09:12:45', '0', 116.396628, 39.906873, 40.68, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (81, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.61, 58.26, 1.037, 6.83, '2026-01-16 08:12:45', '0', 116.391558, 39.925541, 53.38, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (82, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.44, 59.07, 1.112, 6.23, '2026-01-16 07:12:45', '0', 116.398216, 39.914054, 57.92, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (83, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.00, 63.94, 1.321, 7.48, '2026-01-16 06:12:45', '0', 116.404178, 39.904291, 45.79, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (84, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.88, 50.83, 1.352, 7.04, '2026-01-16 05:12:45', '0', 116.406228, 39.915348, 70.54, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (85, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.66, 58.86, 1.552, 7.08, '2026-01-16 04:12:45', '0', 116.409696, 39.904100, 61.58, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (86, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.73, 60.93, 1.135, 6.55, '2026-01-16 03:12:45', '0', 116.378383, 39.887926, 49.68, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (87, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.10, 61.20, 0.956, 5.88, '2026-01-16 02:12:45', '0', 116.396042, 39.913128, 49.86, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (88, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.78, 71.73, 0.975, 5.88, '2026-01-16 01:12:45', '0', 116.389981, 39.904130, 37.00, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (89, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.95, 49.52, 1.315, 7.15, '2026-01-16 00:12:45', '0', 116.412728, 39.892009, 55.40, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (90, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.52, 53.12, 0.746, 6.40, '2026-01-15 23:12:45', '0', 116.400354, 39.902574, 39.12, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (91, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.57, 52.47, 1.560, 7.02, '2026-01-15 22:12:45', '0', 116.403956, 39.896283, 66.46, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (92, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.59, 52.64, 1.211, 7.13, '2026-01-15 21:12:45', '0', 116.401409, 39.902646, 62.44, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (93, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.23, 57.30, 1.250, 6.25, '2026-01-15 20:12:45', '0', 116.391267, 39.916782, 47.62, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (94, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.99, 60.62, 1.333, 6.55, '2026-01-15 19:12:45', '0', 116.385276, 39.915062, 29.96, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (95, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.14, 60.33, 1.184, 5.76, '2026-01-15 18:12:45', '0', 116.381289, 39.908120, 39.00, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (96, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.60, 50.72, 1.264, 5.63, '2026-01-15 17:12:45', '0', 116.388323, 39.923797, 47.93, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (97, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.16, 49.88, 1.249, 5.87, '2026-01-15 16:12:45', '0', 116.392068, 39.905657, 48.37, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (98, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.33, 57.46, 1.469, 6.97, '2026-01-15 15:12:45', '0', 116.411483, 39.901442, 67.82, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (99, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.85, 44.79, 1.249, 6.69, '2026-01-15 14:12:45', '0', 116.390195, 39.914894, 41.92, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (100, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.54, 47.94, 1.513, 7.02, '2026-01-15 13:12:45', '0', 116.402334, 39.891470, 56.86, '2026-01-19 17:12:44', NULL);
INSERT INTO `soil_data` VALUES (101, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.80, 64.21, 1.067, 6.38, '2026-01-19 16:18:21', '0', 116.397768, 39.913769, 47.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (102, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.51, 59.40, 0.879, 5.93, '2026-01-19 15:18:21', '0', 116.391943, 39.911561, 33.44, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (103, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.30, 56.32, 1.107, 6.80, '2026-01-19 14:18:21', '0', 116.389759, 39.906050, 41.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (104, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.60, 51.79, 1.297, 7.03, '2026-01-19 13:18:21', '0', 116.388629, 39.915066, 67.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (105, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.88, 67.19, 0.942, 6.45, '2026-01-19 12:18:21', '0', 116.419323, 39.916957, 55.73, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (106, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.54, 57.23, 1.557, 5.22, '2026-01-19 11:18:21', '0', 116.404980, 39.910674, 70.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (107, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.20, 59.18, 1.019, 6.48, '2026-01-19 10:18:21', '0', 116.413560, 39.921834, 37.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (108, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.54, 62.86, 1.580, 6.38, '2026-01-19 09:18:21', '0', 116.391100, 39.918407, 50.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (109, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.12, 68.32, 1.424, 6.80, '2026-01-19 08:18:21', '0', 116.384003, 39.917282, 50.47, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (110, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.11, 59.90, 1.144, 7.66, '2026-01-19 07:18:21', '0', 116.385822, 39.915069, 57.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (111, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.32, 74.21, 1.354, 6.22, '2026-01-19 06:18:21', '0', 116.402849, 39.908706, 46.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (112, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.05, 65.24, 1.461, 6.52, '2026-01-19 05:18:21', '0', 116.390195, 39.909330, 53.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (113, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.92, 63.71, 1.132, 6.99, '2026-01-19 04:18:21', '0', 116.405845, 39.911524, 54.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (114, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.47, 72.56, 1.373, 5.70, '2026-01-19 03:18:21', '0', 116.413019, 39.905081, 44.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (115, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.86, 74.44, 0.883, 6.57, '2026-01-19 02:18:21', '0', 116.401405, 39.914839, 48.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (116, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.72, 62.73, 1.429, 6.05, '2026-01-19 01:18:21', '0', 116.404618, 39.921329, 43.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (117, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.20, 67.80, 1.334, 6.68, '2026-01-19 00:18:21', '0', 116.407066, 39.903702, 60.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (118, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.46, 70.00, 1.635, 5.20, '2026-01-18 23:18:21', '0', 116.386289, 39.898710, 59.47, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (119, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.47, 77.35, 1.608, 6.16, '2026-01-18 22:18:21', '0', 116.404374, 39.895107, 55.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (120, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.44, 73.82, 1.337, 6.07, '2026-01-18 21:18:21', '0', 116.392726, 39.914953, 60.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (121, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.60, 72.90, 1.457, 6.56, '2026-01-18 20:18:21', '0', 116.387717, 39.913615, 65.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (122, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.69, 78.76, 1.021, 5.98, '2026-01-18 19:18:21', '0', 116.416412, 39.914211, 52.23, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (123, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.42, 81.66, 0.631, 6.48, '2026-01-18 18:18:21', '0', 116.411062, 39.896954, 33.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (124, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.44, 73.39, 1.373, 6.92, '2026-01-18 17:18:21', '0', 116.388525, 39.895984, 51.12, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (125, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.73, 85.78, 1.435, 7.34, '2026-01-18 16:18:21', '0', 116.390730, 39.894708, 52.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (126, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.47, 69.09, 1.041, 6.00, '2026-01-18 15:18:21', '0', 116.378371, 39.919335, 31.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (127, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.16, 84.57, 1.243, 6.76, '2026-01-18 14:18:21', '0', 116.388585, 39.900109, 58.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (128, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.36, 89.88, 1.529, 6.04, '2026-01-18 13:18:21', '0', 116.390247, 39.893804, 52.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (129, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.97, 75.44, 0.416, 7.01, '2026-01-18 12:18:21', '0', 116.392822, 39.915509, 54.04, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (130, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.03, 88.74, 0.517, 5.47, '2026-01-18 11:18:21', '0', 116.395247, 39.905848, 40.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (131, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.49, 75.49, 1.246, 6.65, '2026-01-18 10:18:21', '0', 116.386855, 39.907394, 71.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (132, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.13, 76.66, 1.102, 7.18, '2026-01-18 09:18:21', '0', 116.396252, 39.911707, 55.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (133, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.06, 77.87, 0.776, 6.39, '2026-01-18 08:18:21', '0', 116.395043, 39.906038, 59.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (134, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.11, 88.73, 1.998, 6.37, '2026-01-18 07:18:21', '0', 116.397652, 39.921032, 49.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (135, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.66, 70.28, 1.985, 6.09, '2026-01-18 06:18:21', '0', 116.386025, 39.926538, 53.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (136, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.79, 80.07, 1.150, 5.72, '2026-01-18 05:18:21', '0', 116.395674, 39.899955, 49.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (137, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.82, 84.54, 0.745, 6.79, '2026-01-18 04:18:21', '0', 116.391263, 39.925418, 43.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (138, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.25, 73.61, 1.038, 5.60, '2026-01-18 03:18:21', '0', 116.382089, 39.912149, 44.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (139, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.46, 88.26, 1.273, 5.97, '2026-01-18 02:18:21', '0', 116.392874, 39.921433, 56.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (140, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.81, 69.53, 1.651, 6.48, '2026-01-18 01:18:21', '0', 116.392547, 39.898446, 58.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (141, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.32, 85.68, 1.375, 5.70, '2026-01-18 00:18:21', '0', 116.400971, 39.905952, 34.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (142, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.31, 73.63, 1.185, 6.54, '2026-01-17 23:18:21', '0', 116.405471, 39.926954, 66.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (143, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.34, 83.81, 1.103, 5.91, '2026-01-17 22:18:21', '0', 116.406593, 39.908495, 43.53, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (144, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.30, 79.21, 1.039, 6.19, '2026-01-17 21:18:21', '0', 116.389245, 39.911391, 41.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (145, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.00, 82.89, 1.330, 7.43, '2026-01-17 20:18:21', '0', 116.385954, 39.914106, 46.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (146, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.94, 80.68, 0.771, 6.71, '2026-01-17 19:18:21', '0', 116.406602, 39.907873, 41.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (147, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.04, 90.29, 1.270, 5.03, '2026-01-17 18:18:21', '0', 116.399805, 39.912415, 48.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (148, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.26, 86.17, 0.958, 6.11, '2026-01-17 17:18:21', '0', 116.403780, 39.908509, 39.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (149, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.15, 77.95, 1.784, 6.80, '2026-01-17 16:18:21', '0', 116.393561, 39.916268, 53.19, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (150, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.62, 77.77, 1.529, 7.03, '2026-01-17 15:18:21', '0', 116.426069, 39.911037, 69.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (151, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.37, 65.38, 0.678, 6.29, '2026-01-17 14:18:21', '0', 116.396917, 39.913974, 61.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (152, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.22, 75.53, 1.670, 6.12, '2026-01-17 13:18:21', '0', 116.385335, 39.901828, 49.28, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (153, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.80, 83.17, 1.705, 6.42, '2026-01-17 12:18:21', '0', 116.403656, 39.908222, 57.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (154, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.73, 77.32, 0.886, 6.17, '2026-01-17 11:18:21', '0', 116.401809, 39.884309, 56.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (155, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.78, 74.85, 1.123, 7.07, '2026-01-17 10:18:21', '0', 116.382781, 39.910016, 55.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (156, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.91, 84.87, 1.367, 6.69, '2026-01-17 09:18:21', '0', 116.404240, 39.916797, 58.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (157, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.16, 77.43, 1.623, 5.70, '2026-01-17 08:18:21', '0', 116.400241, 39.918128, 47.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (158, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.56, 82.40, 1.334, 6.98, '2026-01-17 07:18:21', '0', 116.397312, 39.901088, 36.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (159, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.80, 78.83, 1.045, 7.07, '2026-01-17 06:18:21', '0', 116.379801, 39.890947, 60.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (160, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.86, 73.53, 1.550, 7.51, '2026-01-17 05:18:21', '0', 116.409407, 39.900188, 35.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (161, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.12, 70.30, 1.769, 7.18, '2026-01-17 04:18:21', '0', 116.401173, 39.915008, 44.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (162, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.70, 80.45, 0.753, 5.99, '2026-01-17 03:18:21', '0', 116.393150, 39.895936, 64.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (163, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.62, 81.01, 1.460, 7.13, '2026-01-17 02:18:21', '0', 116.392862, 39.903603, 55.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (164, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.70, 77.28, 1.042, 5.98, '2026-01-17 01:18:21', '0', 116.394541, 39.911968, 48.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (165, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.27, 78.97, 1.217, 6.05, '2026-01-17 00:18:21', '0', 116.389437, 39.900269, 53.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (166, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.16, 76.66, 0.789, 6.88, '2026-01-16 23:18:21', '0', 116.400513, 39.923902, 59.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (167, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.34, 75.02, 0.941, 6.09, '2026-01-16 22:18:21', '0', 116.397604, 39.913668, 52.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (168, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.33, 61.05, 1.357, 7.70, '2026-01-16 21:18:21', '0', 116.403930, 39.897352, 44.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (169, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.94, 59.72, 1.637, 7.66, '2026-01-16 20:18:21', '0', 116.396934, 39.900790, 40.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (170, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.47, 72.78, 1.340, 6.99, '2026-01-16 19:18:21', '0', 116.391271, 39.915861, 40.06, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (171, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.23, 65.12, 1.540, 6.61, '2026-01-16 18:18:21', '0', 116.414649, 39.899973, 38.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (172, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.52, 72.51, 1.174, 6.29, '2026-01-16 17:18:21', '0', 116.384058, 39.895204, 56.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (173, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.77, 68.37, 1.543, 6.15, '2026-01-16 16:18:21', '0', 116.405538, 39.907460, 49.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (174, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.64, 68.25, 0.399, 6.67, '2026-01-16 15:18:21', '0', 116.390667, 39.910271, 35.11, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (175, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.67, 67.20, 1.400, 6.36, '2026-01-16 14:18:21', '0', 116.388578, 39.905691, 55.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (176, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.64, 61.26, 1.473, 5.93, '2026-01-16 13:18:21', '0', 116.383788, 39.898661, 50.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (177, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.23, 62.60, 1.427, 6.61, '2026-01-16 12:18:21', '0', 116.400695, 39.908112, 54.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (178, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.90, 63.51, 1.572, 6.49, '2026-01-16 11:18:21', '0', 116.401090, 39.910479, 38.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (179, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.82, 54.49, 1.093, 6.34, '2026-01-16 10:18:21', '0', 116.394130, 39.925714, 47.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (180, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.00, 53.99, 1.397, 6.55, '2026-01-16 09:18:21', '0', 116.407258, 39.907014, 54.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (181, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.86, 61.79, 1.717, 6.42, '2026-01-16 08:18:21', '0', 116.400980, 39.903269, 39.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (182, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.28, 68.25, 1.085, 6.91, '2026-01-16 07:18:21', '0', 116.401819, 39.895843, 63.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (183, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.38, 64.99, 0.953, 6.01, '2026-01-16 06:18:21', '0', 116.381795, 39.916251, 42.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (184, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.95, 61.59, 1.000, 6.39, '2026-01-16 05:18:21', '0', 116.399926, 39.911383, 35.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (185, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.52, 61.76, 0.673, 6.72, '2026-01-16 04:18:21', '0', 116.374745, 39.914373, 62.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (186, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.90, 52.81, 0.882, 6.91, '2026-01-16 03:18:21', '0', 116.387891, 39.915375, 61.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (187, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.97, 59.71, 1.633, 6.27, '2026-01-16 02:18:21', '0', 116.400423, 39.892593, 48.27, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (188, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.90, 53.64, 1.332, 6.06, '2026-01-16 01:18:21', '0', 116.382877, 39.911191, 41.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (189, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.10, 54.47, 1.162, 6.48, '2026-01-16 00:18:21', '0', 116.391597, 39.906956, 48.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (190, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.48, 56.23, 1.502, 6.66, '2026-01-15 23:18:21', '0', 116.396803, 39.907271, 58.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (191, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.01, 54.75, 1.300, 7.17, '2026-01-15 22:18:21', '0', 116.388897, 39.916104, 46.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (192, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.61, 53.78, 1.590, 7.63, '2026-01-15 21:18:21', '0', 116.403944, 39.931822, 59.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (193, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.55, 51.31, 1.166, 6.38, '2026-01-15 20:18:21', '0', 116.391590, 39.909539, 42.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (194, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.30, 55.01, 0.894, 5.37, '2026-01-15 19:18:21', '0', 116.388138, 39.921921, 36.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (195, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.77, 58.58, 1.312, 6.71, '2026-01-15 18:18:21', '0', 116.401862, 39.900954, 52.17, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (196, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.95, 50.38, 0.878, 6.41, '2026-01-15 17:18:21', '0', 116.393624, 39.913964, 47.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (197, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.56, 49.23, 0.888, 7.41, '2026-01-15 16:18:21', '0', 116.414199, 39.923616, 39.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (198, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.31, 44.84, 1.173, 7.22, '2026-01-15 15:18:21', '0', 116.390154, 39.894599, 50.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (199, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.25, 42.78, 1.719, 6.64, '2026-01-15 14:18:21', '0', 116.412653, 39.914369, 54.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (200, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.88, 57.35, 1.089, 6.59, '2026-01-15 13:18:21', '0', 116.395046, 39.892631, 50.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (201, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.65, 54.42, 0.711, 6.67, '2026-01-15 12:18:21', '0', 116.380912, 39.918772, 40.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (202, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.15, 48.95, 0.898, 5.92, '2026-01-15 11:18:21', '0', 116.418113, 39.913992, 52.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (203, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.13, 51.16, 1.531, 6.91, '2026-01-15 10:18:21', '0', 116.395798, 39.911710, 45.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (204, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.18, 39.27, 1.046, 6.04, '2026-01-15 09:18:21', '0', 116.403999, 39.897836, 47.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (205, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.37, 46.64, 1.206, 6.46, '2026-01-15 08:18:21', '0', 116.402907, 39.916088, 59.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (206, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.13, 54.89, 1.753, 7.07, '2026-01-15 07:18:21', '0', 116.395698, 39.888734, 52.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (207, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.72, 49.34, 1.466, 6.44, '2026-01-15 06:18:21', '0', 116.390172, 39.913915, 52.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (208, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.49, 46.73, 1.239, 5.80, '2026-01-15 05:18:21', '0', 116.386042, 39.905030, 58.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (209, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.79, 54.55, 1.224, 6.46, '2026-01-15 04:18:21', '0', 116.397088, 39.926271, 59.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (210, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.06, 35.41, 1.164, 5.66, '2026-01-15 03:18:21', '0', 116.392331, 39.905425, 57.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (211, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.87, 49.13, 1.681, 7.25, '2026-01-15 02:18:21', '0', 116.401051, 39.902885, 42.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (212, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.61, 47.75, 1.280, 5.63, '2026-01-15 01:18:21', '0', 116.409968, 39.919400, 62.00, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (213, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.94, 37.73, 1.163, 6.49, '2026-01-15 00:18:21', '0', 116.408739, 39.917311, 54.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (214, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.21, 46.63, 1.321, 6.14, '2026-01-14 23:18:21', '0', 116.383381, 39.905048, 57.11, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (215, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.89, 44.09, 1.198, 6.34, '2026-01-14 22:18:21', '0', 116.393635, 39.900267, 33.41, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (216, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.32, 41.73, 1.167, 6.60, '2026-01-14 21:18:21', '0', 116.399733, 39.894855, 57.05, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (217, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.72, 35.28, 0.847, 6.51, '2026-01-14 20:18:21', '0', 116.384185, 39.905230, 33.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (218, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.85, 50.19, 1.481, 6.15, '2026-01-14 19:18:21', '0', 116.403838, 39.895558, 45.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (219, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.87, 45.28, 1.150, 6.47, '2026-01-14 18:18:21', '0', 116.409252, 39.918837, 49.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (220, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.15, 46.38, 0.746, 6.84, '2026-01-14 17:18:21', '0', 116.383990, 39.918246, 31.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (221, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.55, 47.80, 1.608, 5.13, '2026-01-14 16:18:21', '0', 116.391926, 39.923743, 67.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (222, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.33, 48.38, 1.265, 5.84, '2026-01-14 15:18:21', '0', 116.393655, 39.931609, 47.44, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (223, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.75, 43.53, 1.351, 7.22, '2026-01-14 14:18:21', '0', 116.397749, 39.907609, 51.47, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (224, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.16, 42.04, 1.764, 5.97, '2026-01-14 13:18:21', '0', 116.405342, 39.912043, 60.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (225, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.90, 38.02, 0.536, 6.36, '2026-01-14 12:18:21', '0', 116.401796, 39.912427, 67.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (226, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.02, 33.16, 1.314, 7.24, '2026-01-14 11:18:21', '0', 116.377913, 39.927324, 46.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (227, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.47, 48.10, 1.045, 6.69, '2026-01-14 10:18:21', '0', 116.385884, 39.908085, 64.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (228, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.71, 39.35, 1.667, 6.29, '2026-01-14 09:18:21', '0', 116.392881, 39.895958, 67.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (229, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.78, 39.36, 1.445, 6.70, '2026-01-14 08:18:21', '0', 116.412448, 39.916580, 64.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (230, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.75, 47.75, 1.440, 6.15, '2026-01-14 07:18:21', '0', 116.389540, 39.895450, 55.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (231, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.94, 31.85, 1.009, 6.29, '2026-01-14 06:18:21', '0', 116.400872, 39.920724, 66.00, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (232, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.11, 44.83, 1.451, 7.68, '2026-01-14 05:18:21', '0', 116.390447, 39.922192, 51.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (233, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.26, 45.80, 1.383, 6.38, '2026-01-14 04:18:21', '0', 116.395801, 39.900623, 46.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (234, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.38, 40.30, 1.355, 6.48, '2026-01-14 03:18:21', '0', 116.408972, 39.906350, 52.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (235, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.68, 35.75, 1.596, 6.73, '2026-01-14 02:18:21', '0', 116.381488, 39.896413, 47.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (236, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.17, 43.80, 1.543, 7.33, '2026-01-14 01:18:21', '0', 116.395971, 39.930779, 52.81, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (237, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.82, 36.28, 0.975, 6.29, '2026-01-14 00:18:21', '0', 116.365632, 39.913831, 50.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (238, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.85, 43.34, 1.188, 6.27, '2026-01-13 23:18:21', '0', 116.410684, 39.891377, 52.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (239, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.54, 35.81, 0.785, 6.89, '2026-01-13 22:18:21', '0', 116.407837, 39.904115, 51.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (240, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.50, 46.02, 1.110, 7.60, '2026-01-13 21:18:21', '0', 116.405271, 39.904931, 46.81, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (241, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.46, 36.07, 1.345, 6.68, '2026-01-13 20:18:21', '0', 116.392967, 39.902257, 51.05, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (242, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.41, 44.86, 1.381, 6.21, '2026-01-13 19:18:21', '0', 116.393405, 39.917800, 42.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (243, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.45, 46.03, 1.356, 6.23, '2026-01-13 18:18:21', '0', 116.398681, 39.923179, 55.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (244, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.66, 49.29, 1.136, 5.73, '2026-01-13 17:18:21', '0', 116.403851, 39.906236, 53.17, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (245, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.83, 50.75, 1.315, 8.51, '2026-01-13 16:18:21', '0', 116.402826, 39.901501, 44.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (246, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.42, 45.11, 1.276, 5.90, '2026-01-13 15:18:21', '0', 116.382701, 39.918526, 56.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (247, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.81, 40.32, 1.219, 6.83, '2026-01-13 14:18:21', '0', 116.398897, 39.917458, 59.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (248, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.77, 51.23, 1.159, 7.57, '2026-01-13 13:18:21', '0', 116.377351, 39.907628, 51.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (249, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.11, 40.81, 0.951, 6.82, '2026-01-13 12:18:21', '0', 116.392281, 39.925395, 49.14, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (250, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.91, 48.38, 1.606, 7.54, '2026-01-13 11:18:21', '0', 116.380749, 39.922051, 51.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (251, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.84, 49.39, 1.529, 6.56, '2026-01-13 10:18:21', '0', 116.394559, 39.912685, 51.81, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (252, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.98, 48.86, 1.191, 7.37, '2026-01-13 09:18:21', '0', 116.392679, 39.909566, 49.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (253, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.26, 43.15, 1.192, 6.06, '2026-01-13 08:18:21', '0', 116.391513, 39.923847, 67.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (254, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.45, 43.18, 0.978, 7.10, '2026-01-13 07:18:21', '0', 116.387386, 39.920047, 57.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (255, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.45, 44.91, 1.629, 6.39, '2026-01-13 06:18:21', '0', 116.397924, 39.898057, 42.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (256, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.25, 48.55, 0.826, 6.95, '2026-01-13 05:18:21', '0', 116.413921, 39.900138, 44.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (257, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.44, 60.90, 1.456, 5.60, '2026-01-13 04:18:21', '0', 116.401049, 39.904999, 48.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (258, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.77, 49.16, 1.075, 6.26, '2026-01-13 03:18:21', '0', 116.393346, 39.913539, 60.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (259, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.01, 49.81, 0.926, 7.12, '2026-01-13 02:18:21', '0', 116.398193, 39.887429, 34.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (260, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.33, 52.02, 1.216, 7.99, '2026-01-13 01:18:21', '0', 116.398138, 39.916116, 26.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (261, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.79, 45.08, 1.630, 6.74, '2026-01-13 00:18:21', '0', 116.398123, 39.888258, 51.00, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (262, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.12, 50.69, 0.654, 6.45, '2026-01-12 23:18:21', '0', 116.384914, 39.906857, 42.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (263, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.11, 59.54, 1.158, 7.21, '2026-01-12 22:18:21', '0', 116.391270, 39.895472, 62.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (264, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.81, 62.59, 1.531, 5.69, '2026-01-12 21:18:21', '0', 116.385957, 39.906248, 43.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (265, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.66, 49.01, 1.542, 6.66, '2026-01-12 20:18:21', '0', 116.395203, 39.919691, 53.55, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (266, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.63, 64.73, 1.032, 6.69, '2026-01-12 19:18:21', '0', 116.390468, 39.919007, 41.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (267, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.70, 49.86, 1.183, 6.60, '2026-01-12 18:18:21', '0', 116.401143, 39.906550, 51.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (268, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.33, 54.60, 1.304, 6.32, '2026-01-12 17:18:21', '0', 116.394360, 39.926031, 62.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (269, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.19, 59.28, 0.575, 6.05, '2026-01-12 16:18:21', '0', 116.399688, 39.904855, 36.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (270, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.69, 56.44, 1.292, 6.12, '2026-01-12 15:18:21', '0', 116.400397, 39.897643, 35.14, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (271, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.22, 65.45, 1.409, 6.96, '2026-01-12 14:18:21', '0', 116.381693, 39.912090, 24.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (272, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.49, 66.20, 0.703, 6.24, '2026-01-12 13:18:21', '0', 116.394319, 39.917532, 55.71, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (273, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.14, 57.88, 1.001, 6.55, '2026-01-12 12:18:21', '0', 116.401633, 39.913426, 51.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (274, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.54, 74.32, 0.977, 6.38, '2026-01-12 11:18:21', '0', 116.389523, 39.924602, 25.94, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (275, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.26, 66.01, 1.148, 6.48, '2026-01-12 10:18:21', '0', 116.401986, 39.889827, 56.11, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (276, 'DEVICE_FIELD_002_001', 'FIELD_002', 33.12, 73.22, 0.853, 6.67, '2026-01-12 09:18:21', '0', 116.402543, 39.906488, 41.44, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (277, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.72, 71.75, 1.538, 6.27, '2026-01-12 08:18:21', '0', 116.378848, 39.907448, 65.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (278, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.67, 60.33, 1.055, 7.30, '2026-01-12 07:18:21', '0', 116.415892, 39.920433, 49.53, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (279, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.16, 70.74, 1.678, 7.00, '2026-01-12 06:18:21', '0', 116.397847, 39.918583, 45.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (280, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.06, 67.56, 1.446, 5.96, '2026-01-12 05:18:21', '0', 116.380495, 39.917869, 43.99, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (281, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.99, 65.73, 0.661, 6.00, '2026-01-12 04:18:21', '0', 116.390869, 39.896260, 36.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (282, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.91, 60.97, 1.115, 6.85, '2026-01-12 03:18:21', '0', 116.408924, 39.910567, 55.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (283, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.05, 68.72, 0.958, 6.24, '2026-01-12 02:18:21', '0', 116.410865, 39.895662, 43.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (284, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.23, 64.17, 0.998, 6.11, '2026-01-12 01:18:21', '0', 116.411842, 39.895766, 40.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (285, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.69, 75.51, 0.865, 5.87, '2026-01-12 00:18:21', '0', 116.423106, 39.896958, 45.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (286, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.49, 64.02, 1.333, 6.85, '2026-01-11 23:18:21', '0', 116.404145, 39.924315, 56.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (287, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.46, 66.05, 1.738, 6.63, '2026-01-11 22:18:21', '0', 116.386299, 39.896031, 41.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (288, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.12, 80.43, 1.419, 6.23, '2026-01-11 21:18:21', '0', 116.395839, 39.906248, 62.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (289, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.55, 70.93, 0.784, 6.45, '2026-01-11 20:18:21', '0', 116.393265, 39.908251, 52.35, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (290, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.37, 78.96, 1.760, 6.67, '2026-01-11 19:18:21', '0', 116.381367, 39.912407, 41.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (291, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.23, 75.31, 1.361, 6.67, '2026-01-11 18:18:21', '0', 116.394833, 39.906913, 59.99, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (292, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.27, 68.91, 1.398, 6.59, '2026-01-11 17:18:21', '0', 116.373135, 39.919570, 48.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (293, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.01, 77.71, 1.223, 6.54, '2026-01-11 16:18:21', '0', 116.395382, 39.921874, 53.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (294, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.73, 79.82, 1.067, 6.07, '2026-01-11 15:18:21', '0', 116.405035, 39.898585, 45.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (295, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.65, 77.07, 1.119, 6.87, '2026-01-11 14:18:21', '0', 116.405918, 39.899173, 46.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (296, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.77, 69.38, 1.042, 6.38, '2026-01-11 13:18:21', '0', 116.392476, 39.914666, 51.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (297, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.04, 88.50, 1.646, 6.67, '2026-01-11 12:18:21', '0', 116.383379, 39.909966, 50.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (298, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.92, 88.40, 2.033, 6.39, '2026-01-11 11:18:21', '0', 116.392215, 39.903148, 40.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (299, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.02, 71.91, 1.569, 6.37, '2026-01-11 10:18:21', '0', 116.376488, 39.911290, 61.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (300, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.20, 78.36, 1.187, 6.86, '2026-01-11 09:18:21', '0', 116.399932, 39.910926, 46.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (301, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.62, 71.22, 1.391, 6.40, '2026-01-11 08:18:21', '0', 116.385644, 39.915705, 48.11, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (302, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.67, 82.38, 0.753, 7.07, '2026-01-11 07:18:21', '0', 116.403676, 39.935196, 32.55, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (303, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.27, 84.11, 1.089, 7.52, '2026-01-11 06:18:21', '0', 116.415796, 39.920604, 51.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (304, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.44, 70.71, 1.158, 6.00, '2026-01-11 05:18:21', '0', 116.405968, 39.905068, 46.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (305, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.74, 85.60, 1.000, 6.81, '2026-01-11 04:18:21', '0', 116.396369, 39.910851, 62.04, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (306, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.29, 89.28, 1.331, 5.43, '2026-01-11 03:18:21', '0', 116.398527, 39.890316, 34.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (307, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.19, 83.86, 0.777, 6.75, '2026-01-11 02:18:21', '0', 116.402782, 39.897218, 67.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (308, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.88, 81.17, 1.858, 6.42, '2026-01-11 01:18:21', '0', 116.393510, 39.908369, 47.75, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (309, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.77, 74.25, 1.015, 6.52, '2026-01-11 00:18:21', '0', 116.383613, 39.907678, 49.42, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (310, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.89, 74.36, 1.451, 6.46, '2026-01-10 23:18:21', '0', 116.388425, 39.918583, 68.27, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (311, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.01, 93.70, 0.999, 5.98, '2026-01-10 22:18:21', '0', 116.411859, 39.937297, 50.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (312, 'DEVICE_FIELD_002_001', 'FIELD_002', 6.93, 73.08, 1.269, 6.21, '2026-01-10 21:18:21', '0', 116.406950, 39.897708, 44.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (313, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.98, 85.55, 1.664, 6.60, '2026-01-10 20:18:21', '0', 116.400608, 39.919094, 37.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (314, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.89, 75.24, 1.024, 6.58, '2026-01-10 19:18:21', '0', 116.391601, 39.910603, 43.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (315, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.27, 73.07, 1.206, 6.54, '2026-01-10 18:18:21', '0', 116.390901, 39.926951, 41.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (316, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.37, 75.58, 1.286, 6.18, '2026-01-10 17:18:21', '0', 116.397541, 39.909012, 36.19, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (317, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.70, 75.03, 1.369, 6.54, '2026-01-10 16:18:21', '0', 116.395340, 39.901106, 49.02, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (318, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.46, 86.15, 1.209, 7.32, '2026-01-10 15:18:21', '0', 116.373001, 39.899479, 63.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (319, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.60, 81.56, 0.833, 5.60, '2026-01-10 14:18:21', '0', 116.417666, 39.914957, 68.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (320, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.25, 73.55, 2.048, 6.58, '2026-01-10 13:18:21', '0', 116.415106, 39.892099, 46.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (321, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.24, 74.99, 1.575, 6.00, '2026-01-10 12:18:21', '0', 116.414396, 39.908048, 69.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (322, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.49, 71.03, 1.475, 6.79, '2026-01-10 11:18:21', '0', 116.391829, 39.895656, 48.99, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (323, 'DEVICE_FIELD_002_001', 'FIELD_002', 35.15, 81.12, 1.474, 5.76, '2026-01-10 10:18:21', '0', 116.397437, 39.900568, 28.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (324, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.50, 78.36, 1.305, 6.19, '2026-01-10 09:18:21', '0', 116.401251, 39.902251, 46.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (325, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.17, 73.31, 0.948, 7.08, '2026-01-10 08:18:21', '0', 116.381854, 39.915253, 31.24, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (326, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.18, 79.00, 1.103, 6.74, '2026-01-10 07:18:21', '0', 116.403659, 39.910656, 56.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (327, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.88, 75.04, 1.153, 7.10, '2026-01-10 06:18:21', '0', 116.400504, 39.897759, 33.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (328, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.80, 72.32, 1.137, 6.84, '2026-01-10 05:18:21', '0', 116.414898, 39.917155, 48.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (329, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.25, 70.57, 1.020, 6.88, '2026-01-10 04:18:21', '0', 116.390963, 39.899623, 49.06, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (330, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.04, 73.04, 1.404, 6.99, '2026-01-10 03:18:21', '0', 116.392078, 39.903031, 47.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (331, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.34, 73.29, 1.062, 4.88, '2026-01-10 02:18:21', '0', 116.394455, 39.916257, 45.04, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (332, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.75, 83.82, 1.525, 7.27, '2026-01-10 01:18:21', '0', 116.382181, 39.914139, 51.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (333, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.87, 71.48, 1.265, 5.93, '2026-01-10 00:18:21', '0', 116.391321, 39.914867, 56.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (334, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.15, 66.77, 1.437, 6.70, '2026-01-09 23:18:21', '0', 116.415259, 39.910293, 26.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (335, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.28, 72.42, 1.273, 6.77, '2026-01-09 22:18:21', '0', 116.392233, 39.910114, 36.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (336, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.05, 67.86, 1.762, 6.17, '2026-01-09 21:18:21', '0', 116.401778, 39.929957, 66.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (337, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.20, 70.93, 1.643, 6.67, '2026-01-09 20:18:21', '0', 116.391443, 39.908551, 43.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (338, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.61, 72.23, 0.789, 6.65, '2026-01-09 19:18:21', '0', 116.398901, 39.908485, 65.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (339, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.21, 64.96, 1.333, 6.45, '2026-01-09 18:18:21', '0', 116.389864, 39.915358, 60.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (340, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.80, 75.25, 1.389, 5.88, '2026-01-09 17:18:21', '0', 116.416226, 39.931146, 43.02, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (341, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.38, 72.63, 1.298, 6.88, '2026-01-09 16:18:21', '0', 116.417965, 39.917266, 38.20, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (342, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.68, 82.43, 1.863, 6.98, '2026-01-09 15:18:21', '0', 116.384918, 39.903656, 57.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (343, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.38, 63.67, 1.480, 6.04, '2026-01-09 14:18:21', '0', 116.372461, 39.892660, 52.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (344, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.10, 71.08, 0.906, 6.82, '2026-01-09 13:18:21', '0', 116.396865, 39.916874, 26.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (345, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.87, 68.39, 1.356, 6.86, '2026-01-09 12:18:21', '0', 116.395070, 39.916214, 45.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (346, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.85, 60.17, 1.224, 6.30, '2026-01-09 11:18:21', '0', 116.389205, 39.891607, 50.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (347, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.41, 61.11, 1.127, 5.93, '2026-01-09 10:18:21', '0', 116.405256, 39.902379, 44.20, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (348, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.83, 62.72, 1.066, 6.82, '2026-01-09 09:18:21', '0', 116.403099, 39.932772, 45.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (349, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.61, 68.47, 1.269, 7.18, '2026-01-09 08:18:21', '0', 116.393938, 39.921873, 50.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (350, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.08, 63.30, 1.327, 6.14, '2026-01-09 07:18:21', '0', 116.414201, 39.901341, 51.12, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (351, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.28, 63.32, 1.455, 6.28, '2026-01-09 06:18:21', '0', 116.395873, 39.919607, 44.35, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (352, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.37, 68.21, 1.096, 7.18, '2026-01-09 05:18:21', '0', 116.404895, 39.916863, 52.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (353, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.05, 66.93, 1.374, 7.69, '2026-01-09 04:18:21', '0', 116.404974, 39.916757, 38.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (354, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.47, 58.25, 1.399, 6.15, '2026-01-09 03:18:21', '0', 116.380304, 39.916824, 42.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (355, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.36, 57.63, 1.441, 5.99, '2026-01-09 02:18:21', '0', 116.402023, 39.907099, 25.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (356, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.47, 55.60, 0.907, 6.74, '2026-01-09 01:18:21', '0', 116.394046, 39.889156, 50.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (357, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.80, 56.36, 1.131, 6.10, '2026-01-09 00:18:21', '0', 116.396368, 39.897686, 43.00, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (358, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.52, 45.24, 1.043, 6.10, '2026-01-08 23:18:21', '0', 116.400120, 39.913606, 58.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (359, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.63, 61.96, 1.090, 7.10, '2026-01-08 22:18:21', '0', 116.390371, 39.891689, 43.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (360, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.84, 48.14, 1.223, 6.85, '2026-01-08 21:18:21', '0', 116.390337, 39.924981, 52.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (361, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.64, 55.83, 0.939, 6.75, '2026-01-08 20:18:21', '0', 116.400355, 39.913607, 55.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (362, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.59, 58.73, 1.120, 6.58, '2026-01-08 19:18:21', '0', 116.412047, 39.892561, 51.02, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (363, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.42, 50.77, 0.782, 6.72, '2026-01-08 18:18:21', '0', 116.402559, 39.905905, 46.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (364, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.26, 49.58, 0.550, 5.65, '2026-01-08 17:18:21', '0', 116.399348, 39.909682, 58.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (365, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.56, 54.30, 1.331, 6.58, '2026-01-08 16:18:21', '0', 116.392190, 39.916025, 61.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (366, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.42, 51.27, 1.136, 6.52, '2026-01-08 15:18:21', '0', 116.375771, 39.928578, 48.28, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (367, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.28, 51.88, 0.923, 7.02, '2026-01-08 14:18:21', '0', 116.395394, 39.917051, 46.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (368, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.69, 57.35, 1.227, 6.26, '2026-01-08 13:18:21', '0', 116.381995, 39.905142, 59.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (369, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.62, 52.86, 0.915, 7.06, '2026-01-08 12:18:21', '0', 116.391605, 39.909550, 50.17, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (370, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.99, 54.47, 1.353, 6.34, '2026-01-08 11:18:21', '0', 116.406398, 39.909775, 39.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (371, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.89, 36.46, 0.606, 6.10, '2026-01-08 10:18:21', '0', 116.403214, 39.904184, 59.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (372, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.86, 39.51, 0.789, 5.52, '2026-01-08 09:18:21', '0', 116.396824, 39.918856, 47.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (373, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.98, 43.20, 0.874, 6.63, '2026-01-08 08:18:21', '0', 116.404606, 39.911357, 65.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (374, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.09, 47.23, 1.142, 6.15, '2026-01-08 07:18:21', '0', 116.405121, 39.900545, 65.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (375, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.09, 46.44, 0.974, 6.96, '2026-01-08 06:18:21', '0', 116.400111, 39.904802, 39.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (376, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.50, 43.93, 0.999, 6.36, '2026-01-08 05:18:21', '0', 116.390997, 39.897476, 48.42, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (377, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.24, 47.63, 1.244, 6.35, '2026-01-08 04:18:21', '0', 116.398073, 39.906552, 49.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (378, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.24, 49.52, 1.253, 5.96, '2026-01-08 03:18:21', '0', 116.402686, 39.915411, 48.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (379, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.42, 42.15, 1.817, 7.05, '2026-01-08 02:18:21', '0', 116.410783, 39.900750, 42.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (380, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.26, 40.13, 1.220, 6.69, '2026-01-08 01:18:21', '0', 116.380606, 39.908052, 44.36, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (381, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.61, 37.64, 0.896, 6.54, '2026-01-08 00:18:21', '0', 116.399907, 39.910167, 50.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (382, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.46, 40.65, 0.981, 6.27, '2026-01-07 23:18:21', '0', 116.395784, 39.901300, 57.81, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (383, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.47, 45.27, 0.873, 6.40, '2026-01-07 22:18:21', '0', 116.398298, 39.908145, 56.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (384, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.38, 46.42, 1.196, 6.50, '2026-01-07 21:18:21', '0', 116.396091, 39.924199, 46.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (385, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.54, 36.82, 1.049, 6.49, '2026-01-07 20:18:21', '0', 116.386634, 39.905004, 49.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (386, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.05, 42.16, 0.840, 6.99, '2026-01-07 19:18:21', '0', 116.390015, 39.898282, 58.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (387, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.41, 30.85, 1.604, 6.33, '2026-01-07 18:18:21', '0', 116.399912, 39.913910, 65.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (388, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.89, 44.52, 1.281, 5.42, '2026-01-07 17:18:21', '0', 116.400268, 39.900208, 65.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (389, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.01, 38.96, 0.982, 6.96, '2026-01-07 16:18:21', '0', 116.390584, 39.886308, 65.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (390, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.27, 40.36, 0.859, 6.05, '2026-01-07 15:18:21', '0', 116.394956, 39.909937, 59.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (391, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.12, 43.36, 1.386, 6.55, '2026-01-07 14:18:21', '0', 116.398311, 39.923336, 52.66, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (392, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.56, 40.52, 1.736, 7.52, '2026-01-07 13:18:21', '0', 116.411445, 39.893504, 52.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (393, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.98, 38.10, 0.702, 6.32, '2026-01-07 12:18:21', '0', 116.388054, 39.901101, 55.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (394, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.95, 48.63, 1.089, 7.25, '2026-01-07 11:18:21', '0', 116.398191, 39.897328, 70.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (395, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.03, 39.13, 1.235, 6.89, '2026-01-07 10:18:21', '0', 116.402688, 39.896488, 51.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (396, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.59, 41.23, 1.361, 6.01, '2026-01-07 09:18:21', '0', 116.391418, 39.917563, 65.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (397, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.06, 31.52, 1.814, 6.79, '2026-01-07 08:18:21', '0', 116.401944, 39.910116, 45.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (398, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.57, 42.07, 1.845, 7.77, '2026-01-07 07:18:21', '0', 116.401782, 39.912108, 38.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (399, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.61, 39.68, 1.124, 6.51, '2026-01-07 06:18:21', '0', 116.396737, 39.926239, 64.19, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (400, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.04, 36.42, 1.408, 6.70, '2026-01-07 05:18:21', '0', 116.382536, 39.889548, 48.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (401, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.82, 38.99, 1.521, 6.53, '2026-01-07 04:18:21', '0', 116.404975, 39.925508, 49.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (402, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.46, 43.35, 0.991, 6.65, '2026-01-07 03:18:21', '0', 116.387845, 39.912747, 59.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (403, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.26, 42.33, 0.495, 7.06, '2026-01-07 02:18:21', '0', 116.400335, 39.914632, 36.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (404, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.41, 45.11, 0.995, 6.88, '2026-01-07 01:18:21', '0', 116.395347, 39.922633, 58.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (405, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.94, 32.80, 1.329, 6.03, '2026-01-07 00:18:21', '0', 116.382890, 39.913524, 46.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (406, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.96, 47.98, 1.316, 6.55, '2026-01-06 23:18:21', '0', 116.397841, 39.906109, 39.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (407, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.05, 48.61, 0.720, 6.47, '2026-01-06 22:18:21', '0', 116.402833, 39.895839, 66.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (408, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.12, 51.37, 0.902, 6.16, '2026-01-06 21:18:21', '0', 116.397239, 39.914019, 48.19, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (409, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.92, 44.84, 1.596, 6.40, '2026-01-06 20:18:21', '0', 116.391345, 39.907557, 46.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (410, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.49, 41.10, 1.459, 7.00, '2026-01-06 19:18:21', '0', 116.393048, 39.908321, 46.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (411, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.32, 41.68, 1.235, 6.25, '2026-01-06 18:18:21', '0', 116.387591, 39.916489, 42.02, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (412, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.29, 43.51, 0.965, 6.77, '2026-01-06 17:18:21', '0', 116.395344, 39.919015, 45.17, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (413, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.42, 44.65, 1.554, 6.77, '2026-01-06 16:18:21', '0', 116.403837, 39.916683, 53.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (414, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.97, 47.02, 1.225, 6.75, '2026-01-06 15:18:21', '0', 116.395956, 39.908445, 43.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (415, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.49, 43.00, 1.568, 5.53, '2026-01-06 14:18:21', '0', 116.393395, 39.921885, 35.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (416, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.58, 43.31, 1.042, 5.52, '2026-01-06 13:18:21', '0', 116.405731, 39.908876, 49.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (417, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.44, 48.30, 1.758, 6.47, '2026-01-06 12:18:21', '0', 116.398847, 39.900398, 34.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (418, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.83, 54.50, 0.873, 6.72, '2026-01-06 11:18:21', '0', 116.383915, 39.913246, 60.28, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (419, 'DEVICE_FIELD_002_001', 'FIELD_002', 33.31, 50.85, 1.327, 6.01, '2026-01-06 10:18:21', '0', 116.408134, 39.921587, 39.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (420, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.97, 46.86, 0.948, 6.86, '2026-01-06 09:18:21', '0', 116.388388, 39.919594, 43.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (421, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.63, 49.73, 1.193, 6.31, '2026-01-06 08:18:21', '0', 116.404515, 39.907485, 42.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (422, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.57, 43.53, 1.312, 6.51, '2026-01-06 07:18:21', '0', 116.369938, 39.911687, 48.53, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (423, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.79, 55.46, 1.619, 6.42, '2026-01-06 06:18:21', '0', 116.393510, 39.892795, 46.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (424, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.80, 57.76, 0.850, 6.65, '2026-01-06 05:18:21', '0', 116.379796, 39.919297, 50.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (425, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.88, 44.78, 1.098, 6.91, '2026-01-06 04:18:21', '0', 116.395098, 39.894103, 26.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (426, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.99, 50.33, 1.086, 6.91, '2026-01-06 03:18:21', '0', 116.411826, 39.926247, 47.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (427, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.18, 41.15, 1.489, 5.63, '2026-01-06 02:18:21', '0', 116.394374, 39.893910, 43.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (428, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.72, 51.84, 1.090, 6.41, '2026-01-06 01:18:21', '0', 116.418921, 39.899181, 54.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (429, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.64, 60.58, 1.171, 6.20, '2026-01-06 00:18:21', '0', 116.383221, 39.908326, 55.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (430, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.45, 60.76, 1.468, 6.94, '2026-01-05 23:18:21', '0', 116.395038, 39.917159, 50.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (431, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.14, 54.65, 1.212, 6.02, '2026-01-05 22:18:21', '0', 116.402558, 39.905851, 30.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (432, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.51, 57.67, 1.375, 5.66, '2026-01-05 21:18:21', '0', 116.382579, 39.913185, 51.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (433, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.66, 52.27, 1.251, 7.04, '2026-01-05 20:18:21', '0', 116.404669, 39.903625, 49.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (434, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.66, 60.43, 1.070, 6.27, '2026-01-05 19:18:21', '0', 116.394682, 39.910342, 63.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (435, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.50, 57.82, 0.494, 7.16, '2026-01-05 18:18:21', '0', 116.388433, 39.910866, 60.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (436, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.99, 63.13, 0.947, 7.22, '2026-01-05 17:18:21', '0', 116.385663, 39.918540, 44.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (437, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.78, 56.37, 0.679, 6.70, '2026-01-05 16:18:21', '0', 116.391701, 39.898470, 49.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (438, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.03, 56.96, 1.636, 7.38, '2026-01-05 15:18:21', '0', 116.400178, 39.902163, 47.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (439, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.78, 61.25, 1.612, 6.29, '2026-01-05 14:18:21', '0', 116.401246, 39.897067, 54.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (440, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.97, 55.34, 0.941, 5.97, '2026-01-05 13:18:21', '0', 116.415328, 39.908150, 50.05, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (441, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.10, 51.13, 0.954, 6.66, '2026-01-05 12:18:21', '0', 116.378336, 39.915175, 53.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (442, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.39, 62.84, 1.278, 5.89, '2026-01-05 11:18:21', '0', 116.381093, 39.930055, 44.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (443, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.80, 61.94, 1.681, 5.50, '2026-01-05 10:18:21', '0', 116.400871, 39.915548, 28.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (444, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.83, 55.80, 1.422, 6.08, '2026-01-05 09:18:21', '0', 116.405654, 39.906732, 67.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (445, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.64, 60.45, 1.078, 6.06, '2026-01-05 08:18:21', '0', 116.393009, 39.916385, 57.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (446, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.13, 66.51, 1.048, 6.82, '2026-01-05 07:18:21', '0', 116.394398, 39.891716, 26.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (447, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.62, 64.26, 1.112, 5.72, '2026-01-05 06:18:21', '0', 116.384381, 39.887951, 54.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (448, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.91, 71.21, 0.931, 6.63, '2026-01-05 05:18:21', '0', 116.405089, 39.900113, 60.73, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (449, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.06, 73.19, 1.020, 5.92, '2026-01-05 04:18:21', '0', 116.409050, 39.922308, 53.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (450, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.20, 77.05, 1.096, 6.80, '2026-01-05 03:18:21', '0', 116.400467, 39.911470, 45.71, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (451, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.64, 72.67, 0.694, 7.26, '2026-01-05 02:18:21', '0', 116.411817, 39.907692, 62.36, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (452, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.96, 68.13, 0.929, 7.27, '2026-01-05 01:18:21', '0', 116.397451, 39.903824, 53.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (453, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.22, 75.07, 1.084, 7.11, '2026-01-05 00:18:21', '0', 116.386707, 39.917007, 40.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (454, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.30, 70.45, 0.953, 7.17, '2026-01-04 23:18:21', '0', 116.380160, 39.917053, 62.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (455, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.12, 64.02, 1.510, 6.54, '2026-01-04 22:18:21', '0', 116.412495, 39.923844, 46.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (456, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.12, 74.80, 1.523, 6.55, '2026-01-04 21:18:21', '0', 116.394311, 39.916532, 52.41, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (457, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.61, 67.44, 0.451, 6.42, '2026-01-04 20:18:21', '0', 116.389391, 39.907055, 42.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (458, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.95, 74.48, 1.573, 5.79, '2026-01-04 19:18:21', '0', 116.387369, 39.912286, 43.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (459, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.54, 78.86, 1.095, 6.02, '2026-01-04 18:18:21', '0', 116.410581, 39.903384, 43.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (460, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.81, 79.32, 1.453, 6.84, '2026-01-04 17:18:21', '0', 116.401469, 39.904129, 59.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (461, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.10, 70.28, 1.441, 6.71, '2026-01-04 16:18:21', '0', 116.403541, 39.890195, 37.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (462, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.66, 75.38, 1.407, 7.20, '2026-01-04 15:18:21', '0', 116.418047, 39.896358, 50.23, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (463, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.10, 76.69, 0.959, 6.13, '2026-01-04 14:18:21', '0', 116.388202, 39.904387, 59.55, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (464, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.98, 79.27, 1.564, 6.55, '2026-01-04 13:18:21', '0', 116.397553, 39.918933, 50.81, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (465, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.69, 77.24, 1.900, 6.47, '2026-01-04 12:18:21', '0', 116.398361, 39.912857, 55.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (466, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.79, 86.25, 0.882, 6.95, '2026-01-04 11:18:21', '0', 116.394354, 39.891922, 57.05, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (467, 'DEVICE_FIELD_002_001', 'FIELD_002', 33.58, 76.29, 1.238, 6.69, '2026-01-04 10:18:21', '0', 116.400756, 39.919038, 62.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (468, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.11, 80.93, 1.047, 6.09, '2026-01-04 09:18:21', '0', 116.416491, 39.930659, 49.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (469, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.53, 77.23, 0.756, 6.74, '2026-01-04 08:18:21', '0', 116.391058, 39.911236, 39.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (470, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.82, 85.18, 1.483, 6.12, '2026-01-04 07:18:21', '0', 116.397825, 39.904269, 53.24, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (471, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.48, 76.47, 1.075, 6.38, '2026-01-04 06:18:21', '0', 116.402902, 39.909638, 46.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (472, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.28, 72.94, 1.189, 6.70, '2026-01-04 05:18:21', '0', 116.393855, 39.920156, 50.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (473, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.33, 91.64, 1.065, 6.55, '2026-01-04 04:18:21', '0', 116.389260, 39.917240, 63.55, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (474, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.07, 81.85, 1.649, 6.90, '2026-01-04 03:18:21', '0', 116.387140, 39.928250, 36.04, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (475, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.94, 84.59, 1.475, 7.08, '2026-01-04 02:18:21', '0', 116.384371, 39.901822, 40.04, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (476, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.01, 81.69, 0.775, 6.72, '2026-01-04 01:18:21', '0', 116.402692, 39.934143, 44.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (477, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.10, 88.16, 1.629, 7.37, '2026-01-04 00:18:21', '0', 116.388325, 39.899539, 59.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (478, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.37, 83.83, 1.104, 6.49, '2026-01-03 23:18:21', '0', 116.399547, 39.924595, 46.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (479, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.51, 79.71, 1.640, 6.08, '2026-01-03 22:18:21', '0', 116.408143, 39.903244, 47.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (480, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.70, 77.85, 0.615, 6.87, '2026-01-03 21:18:21', '0', 116.377046, 39.932857, 52.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (481, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.71, 80.76, 1.024, 6.94, '2026-01-03 20:18:21', '0', 116.395066, 39.901452, 45.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (482, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.42, 79.70, 1.119, 5.92, '2026-01-03 19:18:21', '0', 116.396319, 39.907229, 39.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (483, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.26, 80.61, 1.506, 6.02, '2026-01-03 18:18:21', '0', 116.405129, 39.909506, 43.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (484, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.02, 77.07, 0.746, 6.18, '2026-01-03 17:18:21', '0', 116.399146, 39.893936, 44.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (485, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.13, 86.23, 0.951, 7.46, '2026-01-03 16:18:21', '0', 116.406774, 39.899515, 51.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (486, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.83, 80.40, 1.674, 6.82, '2026-01-03 15:18:21', '0', 116.372391, 39.921579, 64.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (487, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.06, 75.94, 0.919, 6.88, '2026-01-03 14:18:21', '0', 116.412755, 39.907743, 62.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (488, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.25, 79.40, 1.438, 5.61, '2026-01-03 13:18:21', '0', 116.406034, 39.906114, 47.19, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (489, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.36, 82.29, 1.132, 6.50, '2026-01-03 12:18:21', '0', 116.394302, 39.903821, 41.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (490, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.64, 79.93, 1.587, 6.38, '2026-01-03 11:18:21', '0', 116.405298, 39.903285, 48.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (491, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.10, 77.11, 1.482, 6.15, '2026-01-03 10:18:21', '0', 116.405303, 39.920555, 57.41, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (492, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.11, 83.97, 1.336, 6.12, '2026-01-03 09:18:21', '0', 116.392972, 39.906836, 55.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (493, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.51, 79.49, 0.724, 6.73, '2026-01-03 08:18:21', '0', 116.394511, 39.913240, 44.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (494, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.39, 74.51, 0.769, 6.49, '2026-01-03 07:18:21', '0', 116.407850, 39.912590, 23.53, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (495, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.65, 76.74, 1.407, 6.96, '2026-01-03 06:18:21', '0', 116.392089, 39.915612, 47.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (496, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.56, 76.47, 1.134, 6.59, '2026-01-03 05:18:21', '0', 116.389167, 39.915620, 42.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (497, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.50, 76.06, 1.109, 5.74, '2026-01-03 04:18:21', '0', 116.413574, 39.912606, 49.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (498, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.46, 74.31, 1.016, 6.92, '2026-01-03 03:18:21', '0', 116.371699, 39.909323, 68.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (499, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.07, 68.19, 0.756, 6.14, '2026-01-03 02:18:21', '0', 116.398539, 39.903308, 56.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (500, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.82, 73.39, 1.177, 7.00, '2026-01-03 01:18:21', '0', 116.405130, 39.919033, 47.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (501, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.08, 77.83, 0.854, 6.98, '2026-01-03 00:18:21', '0', 116.398666, 39.909624, 52.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (502, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.85, 70.39, 1.602, 7.00, '2026-01-02 23:18:21', '0', 116.404898, 39.903262, 49.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (503, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.23, 74.50, 1.247, 5.68, '2026-01-02 22:18:21', '0', 116.414972, 39.917992, 55.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (504, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.39, 78.09, 0.893, 6.25, '2026-01-02 21:18:21', '0', 116.415428, 39.896001, 55.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (505, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.05, 68.22, 1.061, 6.27, '2026-01-02 20:18:21', '0', 116.412958, 39.911262, 67.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (506, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.47, 67.84, 1.465, 6.66, '2026-01-02 19:18:21', '0', 116.399784, 39.921179, 56.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (507, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.86, 72.57, 1.456, 6.66, '2026-01-02 18:18:21', '0', 116.399306, 39.910532, 71.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (508, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.01, 71.63, 1.274, 6.45, '2026-01-02 17:18:21', '0', 116.390379, 39.922131, 55.44, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (509, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.12, 77.95, 1.127, 6.17, '2026-01-02 16:18:21', '0', 116.395031, 39.915161, 36.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (510, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.69, 70.92, 1.360, 7.22, '2026-01-02 15:18:21', '0', 116.403102, 39.919046, 36.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (511, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.47, 71.45, 0.010, 5.36, '2026-01-02 14:18:21', '0', 116.384646, 39.900364, 50.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (512, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.22, 64.10, 1.252, 5.46, '2026-01-02 13:18:21', '0', 116.390114, 39.905565, 43.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (513, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.19, 74.67, 1.099, 6.01, '2026-01-02 12:18:21', '0', 116.397430, 39.893399, 50.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (514, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.16, 62.27, 0.722, 6.67, '2026-01-02 11:18:21', '0', 116.411204, 39.913061, 42.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (515, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.76, 63.98, 1.221, 6.97, '2026-01-02 10:18:21', '0', 116.403546, 39.901692, 46.71, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (516, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.15, 63.12, 1.484, 6.85, '2026-01-02 09:18:21', '0', 116.398288, 39.908678, 37.02, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (517, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.68, 68.62, 1.633, 6.92, '2026-01-02 08:18:21', '0', 116.409270, 39.908804, 58.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (518, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.40, 65.83, 0.889, 6.67, '2026-01-02 07:18:21', '0', 116.397680, 39.913427, 51.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (519, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.26, 58.88, 1.730, 6.12, '2026-01-02 06:18:21', '0', 116.393997, 39.915559, 40.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (520, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.45, 62.01, 1.111, 6.80, '2026-01-02 05:18:21', '0', 116.401450, 39.913520, 44.20, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (521, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.21, 54.67, 1.100, 5.97, '2026-01-02 04:18:21', '0', 116.392100, 39.897503, 61.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (522, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.27, 57.08, 1.507, 6.33, '2026-01-02 03:18:21', '0', 116.393406, 39.914470, 60.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (523, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.56, 57.59, 1.379, 6.14, '2026-01-02 02:18:21', '0', 116.417930, 39.905878, 60.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (524, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.46, 50.97, 1.472, 6.01, '2026-01-02 01:18:21', '0', 116.411818, 39.895287, 42.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (525, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.13, 63.38, 1.635, 6.10, '2026-01-02 00:18:21', '0', 116.407370, 39.901986, 68.35, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (526, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.65, 56.62, 1.601, 6.53, '2026-01-01 23:18:21', '0', 116.403326, 39.899393, 41.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (527, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.71, 58.64, 1.262, 6.11, '2026-01-01 22:18:21', '0', 116.385773, 39.926599, 40.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (528, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.83, 57.67, 1.039, 6.47, '2026-01-01 21:18:21', '0', 116.395438, 39.917689, 40.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (529, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.76, 54.41, 1.638, 6.60, '2026-01-01 20:18:21', '0', 116.409102, 39.903685, 59.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (530, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.22, 54.11, 1.394, 6.16, '2026-01-01 19:18:21', '0', 116.406303, 39.893712, 48.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (531, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.18, 57.88, 1.547, 7.17, '2026-01-01 18:18:21', '0', 116.393190, 39.920122, 54.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (532, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.91, 50.82, 1.466, 6.14, '2026-01-01 17:18:21', '0', 116.401923, 39.895623, 44.12, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (533, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.12, 42.33, 1.413, 6.35, '2026-01-01 16:18:21', '0', 116.404269, 39.910829, 36.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (534, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.03, 48.25, 0.789, 6.73, '2026-01-01 15:18:21', '0', 116.402614, 39.906453, 44.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (535, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.87, 47.71, 1.491, 6.65, '2026-01-01 14:18:21', '0', 116.387599, 39.907034, 52.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (536, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.26, 46.09, 1.383, 6.68, '2026-01-01 13:18:21', '0', 116.396718, 39.911245, 66.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (537, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.44, 50.77, 0.891, 5.90, '2026-01-01 12:18:21', '0', 116.406413, 39.904009, 48.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (538, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.70, 47.20, 1.128, 6.70, '2026-01-01 11:18:21', '0', 116.368862, 39.903993, 45.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (539, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.36, 46.67, 1.327, 6.41, '2026-01-01 10:18:21', '0', 116.375539, 39.919628, 31.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (540, 'DEVICE_FIELD_002_001', 'FIELD_002', 33.86, 59.48, 1.515, 6.48, '2026-01-01 09:18:21', '0', 116.393722, 39.901771, 55.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (541, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.58, 41.50, 1.211, 5.72, '2026-01-01 08:18:21', '0', 116.392320, 39.902031, 52.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (542, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.23, 44.83, 1.408, 7.31, '2026-01-01 07:18:21', '0', 116.402309, 39.916680, 45.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (543, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.66, 39.09, 1.273, 6.39, '2026-01-01 06:18:21', '0', 116.382441, 39.909512, 47.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (544, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.47, 43.05, 0.706, 6.99, '2026-01-01 05:18:21', '0', 116.410723, 39.911595, 45.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (545, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.21, 47.38, 1.270, 6.42, '2026-01-01 04:18:21', '0', 116.416711, 39.910711, 51.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (546, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.56, 40.38, 1.148, 6.45, '2026-01-01 03:18:21', '0', 116.394063, 39.905059, 42.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (547, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.63, 30.53, 1.300, 5.79, '2026-01-01 02:18:21', '0', 116.382268, 39.912214, 42.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (548, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.93, 44.10, 1.263, 7.57, '2026-01-01 01:18:21', '0', 116.394539, 39.891361, 42.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (549, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.67, 41.50, 1.170, 7.31, '2026-01-01 00:18:21', '0', 116.381619, 39.934180, 67.42, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (550, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.47, 46.36, 1.438, 6.37, '2025-12-31 23:18:21', '0', 116.395137, 39.900491, 72.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (551, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.49, 48.92, 1.039, 6.90, '2025-12-31 22:18:21', '0', 116.403751, 39.905304, 34.11, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (552, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.78, 42.60, 1.024, 6.60, '2025-12-31 21:18:21', '0', 116.390126, 39.905876, 22.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (553, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.61, 35.33, 1.466, 5.22, '2025-12-31 20:18:21', '0', 116.402433, 39.907328, 64.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (554, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.61, 47.71, 1.105, 6.75, '2025-12-31 19:18:21', '0', 116.399330, 39.922294, 32.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (555, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.18, 41.42, 0.867, 6.56, '2025-12-31 18:18:21', '0', 116.391880, 39.895645, 36.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (556, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.56, 34.21, 1.177, 5.99, '2025-12-31 17:18:21', '0', 116.396960, 39.888499, 30.49, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (557, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.96, 36.61, 0.859, 6.73, '2025-12-31 16:18:21', '0', 116.416037, 39.918065, 50.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (558, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.37, 46.60, 1.559, 5.89, '2025-12-31 15:18:21', '0', 116.395561, 39.914586, 49.06, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (559, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.92, 44.09, 1.288, 6.43, '2025-12-31 14:18:21', '0', 116.392958, 39.901535, 41.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (560, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.12, 33.80, 1.026, 5.99, '2025-12-31 13:18:21', '0', 116.394262, 39.902453, 39.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (561, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.08, 45.43, 0.415, 6.96, '2025-12-31 12:18:21', '0', 116.405032, 39.918858, 67.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (562, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.85, 31.37, 0.762, 6.26, '2025-12-31 11:18:21', '0', 116.400228, 39.913668, 47.17, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (563, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.22, 38.26, 1.184, 7.46, '2025-12-31 10:18:21', '0', 116.379880, 39.917012, 64.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (564, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.70, 47.28, 1.211, 6.72, '2025-12-31 09:18:21', '0', 116.412418, 39.908673, 39.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (565, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.18, 42.73, 1.428, 6.71, '2025-12-31 08:18:21', '0', 116.391757, 39.907055, 36.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (566, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.87, 40.10, 1.131, 5.50, '2025-12-31 07:18:21', '0', 116.379995, 39.900493, 63.02, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (567, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.57, 38.86, 1.178, 8.21, '2025-12-31 06:18:21', '0', 116.398193, 39.893041, 71.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (568, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.72, 48.11, 1.539, 7.08, '2025-12-31 05:18:21', '0', 116.387007, 39.887380, 54.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (569, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.33, 42.33, 1.460, 6.65, '2025-12-31 04:18:21', '0', 116.406272, 39.908784, 47.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (570, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.59, 46.64, 1.485, 6.32, '2025-12-31 03:18:21', '0', 116.403021, 39.908490, 52.24, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (571, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.58, 44.83, 1.161, 6.50, '2025-12-31 02:18:21', '0', 116.413815, 39.904174, 52.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (572, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.61, 44.59, 1.418, 6.66, '2025-12-31 01:18:21', '0', 116.389505, 39.922011, 70.14, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (573, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.63, 42.50, 0.938, 6.43, '2025-12-31 00:18:21', '0', 116.405788, 39.913720, 39.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (574, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.14, 40.19, 0.923, 6.69, '2025-12-30 23:18:21', '0', 116.382691, 39.904969, 31.79, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (575, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.96, 49.02, 1.560, 6.25, '2025-12-30 22:18:21', '0', 116.388046, 39.906891, 53.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (576, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.30, 36.83, 1.306, 6.23, '2025-12-30 21:18:21', '0', 116.387208, 39.911638, 64.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (577, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.71, 45.49, 1.150, 6.33, '2025-12-30 20:18:21', '0', 116.406342, 39.909541, 43.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (578, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.80, 42.60, 1.125, 6.65, '2025-12-30 19:18:21', '0', 116.401845, 39.925594, 51.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (579, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.01, 46.55, 1.403, 5.45, '2025-12-30 18:18:21', '0', 116.397508, 39.906532, 50.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (580, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.11, 39.35, 0.850, 6.85, '2025-12-30 17:18:21', '0', 116.405135, 39.904004, 55.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (581, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.14, 46.05, 1.051, 6.47, '2025-12-30 16:18:21', '0', 116.391399, 39.902113, 49.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (582, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.51, 51.09, 0.976, 5.92, '2025-12-30 15:18:21', '0', 116.400338, 39.911032, 38.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (583, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.52, 43.14, 1.402, 6.50, '2025-12-30 14:18:21', '0', 116.403631, 39.914145, 54.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (584, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.15, 50.00, 1.179, 6.87, '2025-12-30 13:18:21', '0', 116.397407, 39.925826, 51.12, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (585, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.18, 46.32, 1.078, 5.93, '2025-12-30 12:18:21', '0', 116.396603, 39.930722, 53.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (586, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.10, 41.66, 1.582, 6.26, '2025-12-30 11:18:21', '0', 116.388565, 39.931813, 47.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (587, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.62, 53.32, 0.596, 7.17, '2025-12-30 10:18:21', '0', 116.397472, 39.908308, 45.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (588, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.91, 45.96, 1.009, 6.73, '2025-12-30 09:18:21', '0', 116.395320, 39.910698, 60.20, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (589, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.21, 46.05, 0.783, 6.64, '2025-12-30 08:18:21', '0', 116.406610, 39.921402, 39.41, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (590, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.32, 52.25, 1.521, 6.08, '2025-12-30 07:18:21', '0', 116.394683, 39.926557, 49.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (591, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.82, 49.62, 1.124, 6.69, '2025-12-30 06:18:21', '0', 116.396247, 39.902620, 37.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (592, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.93, 41.21, 1.504, 6.74, '2025-12-30 05:18:21', '0', 116.395944, 39.898529, 55.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (593, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.11, 50.46, 1.178, 7.02, '2025-12-30 04:18:21', '0', 116.390056, 39.914613, 65.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (594, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.73, 47.14, 1.446, 7.04, '2025-12-30 03:18:21', '0', 116.405809, 39.888647, 39.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (595, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.50, 57.40, 1.112, 6.20, '2025-12-30 02:18:21', '0', 116.399825, 39.910116, 50.79, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (596, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.33, 54.96, 1.682, 6.95, '2025-12-30 01:18:21', '0', 116.380707, 39.906815, 52.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (597, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.10, 63.69, 0.768, 7.04, '2025-12-30 00:18:21', '0', 116.384213, 39.892210, 70.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (598, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.81, 64.64, 1.002, 6.28, '2025-12-29 23:18:21', '0', 116.399783, 39.888498, 55.35, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (599, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.59, 56.65, 0.961, 7.09, '2025-12-29 22:18:21', '0', 116.402896, 39.897527, 49.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (600, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.88, 44.01, 0.940, 6.86, '2025-12-29 21:18:21', '0', 116.406109, 39.890433, 61.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (601, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.45, 67.33, 1.562, 6.90, '2025-12-29 20:18:21', '0', 116.382368, 39.915782, 53.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (602, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.53, 51.26, 1.078, 6.13, '2025-12-29 19:18:21', '0', 116.401722, 39.909757, 49.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (603, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.49, 52.85, 1.392, 6.61, '2025-12-29 18:18:21', '0', 116.416601, 39.909368, 37.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (604, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.39, 58.63, 1.263, 5.91, '2025-12-29 17:18:21', '0', 116.400094, 39.904158, 67.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (605, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.30, 68.07, 1.224, 6.65, '2025-12-29 16:18:21', '0', 116.395461, 39.900470, 46.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (606, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.21, 67.74, 1.051, 6.85, '2025-12-29 15:18:21', '0', 116.411454, 39.903975, 44.19, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (607, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.04, 63.95, 1.013, 6.29, '2025-12-29 14:18:21', '0', 116.380967, 39.912080, 44.06, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (608, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.44, 60.73, 1.645, 5.81, '2025-12-29 13:18:21', '0', 116.413216, 39.924823, 75.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (609, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.37, 53.80, 0.727, 6.60, '2025-12-29 12:18:21', '0', 116.396906, 39.909737, 66.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (610, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.76, 69.22, 1.223, 6.92, '2025-12-29 11:18:21', '0', 116.386820, 39.898506, 36.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (611, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.82, 72.39, 1.211, 6.82, '2025-12-29 10:18:21', '0', 116.417957, 39.898883, 32.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (612, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.47, 59.04, 0.973, 6.41, '2025-12-29 09:18:21', '0', 116.411284, 39.901669, 38.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (613, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.27, 69.95, 0.977, 5.38, '2025-12-29 08:18:21', '0', 116.382153, 39.903371, 60.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (614, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.57, 68.90, 1.500, 5.99, '2025-12-29 07:18:21', '0', 116.402401, 39.898261, 62.49, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (615, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.00, 63.07, 0.895, 6.71, '2025-12-29 06:18:21', '0', 116.387550, 39.915046, 41.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (616, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.77, 70.38, 1.195, 5.96, '2025-12-29 05:18:21', '0', 116.393383, 39.907642, 46.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (617, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.24, 66.75, 0.971, 6.92, '2025-12-29 04:18:21', '0', 116.393367, 39.902014, 52.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (618, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.19, 67.85, 0.975, 6.42, '2025-12-29 03:18:21', '0', 116.398285, 39.923009, 60.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (619, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.09, 69.26, 1.614, 7.01, '2025-12-29 02:18:21', '0', 116.396319, 39.920345, 47.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (620, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.95, 72.93, 0.943, 6.03, '2025-12-29 01:18:21', '0', 116.393192, 39.925983, 47.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (621, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.81, 81.02, 1.166, 6.76, '2025-12-29 00:18:21', '0', 116.406000, 39.900785, 54.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (622, 'DEVICE_FIELD_002_001', 'FIELD_002', 6.31, 74.14, 1.169, 5.75, '2025-12-28 23:18:21', '0', 116.404473, 39.921168, 58.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (623, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.33, 71.35, 1.555, 6.19, '2025-12-28 22:18:21', '0', 116.406483, 39.902248, 49.49, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (624, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.12, 68.94, 1.637, 6.15, '2025-12-28 21:18:21', '0', 116.400028, 39.892109, 41.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (625, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.11, 69.16, 0.962, 6.32, '2025-12-28 20:18:21', '0', 116.401284, 39.907467, 53.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (626, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.31, 76.60, 0.926, 6.43, '2025-12-28 19:18:21', '0', 116.379519, 39.926454, 28.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (627, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.28, 82.20, 1.374, 6.51, '2025-12-28 18:18:21', '0', 116.407778, 39.901512, 61.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (628, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.56, 75.15, 1.693, 6.81, '2025-12-28 17:18:21', '0', 116.389852, 39.898075, 54.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (629, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.17, 73.03, 1.323, 5.63, '2025-12-28 16:18:21', '0', 116.390247, 39.902501, 66.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (630, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.05, 78.31, 1.333, 6.59, '2025-12-28 15:18:21', '0', 116.398819, 39.917739, 63.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (631, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.14, 76.98, 1.015, 6.33, '2025-12-28 14:18:21', '0', 116.396795, 39.892248, 54.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (632, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.82, 77.31, 1.175, 6.12, '2025-12-28 13:18:21', '0', 116.395810, 39.896693, 48.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (633, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.48, 75.77, 1.355, 6.72, '2025-12-28 12:18:21', '0', 116.395975, 39.901226, 62.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (634, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.39, 82.32, 1.148, 6.40, '2025-12-28 11:18:21', '0', 116.410770, 39.912902, 61.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (635, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.49, 76.53, 0.700, 7.00, '2025-12-28 10:18:21', '0', 116.408521, 39.924728, 52.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (636, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.65, 82.28, 1.225, 6.75, '2025-12-28 09:18:21', '0', 116.399186, 39.915917, 30.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (637, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.88, 83.02, 1.192, 6.21, '2025-12-28 08:18:21', '0', 116.390043, 39.914548, 73.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (638, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.87, 79.27, 1.176, 6.72, '2025-12-28 07:18:21', '0', 116.399433, 39.915903, 51.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (639, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.69, 84.32, 1.291, 6.42, '2025-12-28 06:18:21', '0', 116.401508, 39.897773, 38.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (640, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.22, 81.87, 0.888, 6.18, '2025-12-28 05:18:21', '0', 116.379653, 39.903448, 57.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (641, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.81, 81.44, 1.471, 5.09, '2025-12-28 04:18:21', '0', 116.395450, 39.912743, 62.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (642, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.53, 79.75, 1.700, 6.65, '2025-12-28 03:18:21', '0', 116.414402, 39.917790, 51.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (643, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.75, 78.24, 1.235, 6.86, '2025-12-28 02:18:21', '0', 116.392347, 39.894714, 54.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (644, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.26, 74.28, 1.223, 6.06, '2025-12-28 01:18:21', '0', 116.394109, 39.904152, 42.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (645, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.46, 83.27, 1.271, 6.87, '2025-12-28 00:18:21', '0', 116.400071, 39.916335, 54.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (646, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.24, 85.19, 1.087, 5.09, '2025-12-27 23:18:21', '0', 116.376323, 39.906451, 49.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (647, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.11, 84.01, 1.597, 7.45, '2025-12-27 22:18:21', '0', 116.399713, 39.906777, 47.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (648, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.61, 89.58, 0.808, 6.69, '2025-12-27 21:18:21', '0', 116.393315, 39.896773, 53.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (649, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.66, 80.32, 0.657, 6.21, '2025-12-27 20:18:21', '0', 116.403258, 39.915292, 76.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (650, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.38, 81.87, 0.987, 6.44, '2025-12-27 19:18:21', '0', 116.413001, 39.912822, 41.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (651, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.92, 79.43, 1.062, 6.08, '2025-12-27 18:18:21', '0', 116.397375, 39.911592, 53.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (652, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.91, 73.29, 1.239, 6.46, '2025-12-27 17:18:21', '0', 116.409822, 39.900079, 43.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (653, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.43, 74.78, 1.609, 5.98, '2025-12-27 16:18:21', '0', 116.393437, 39.909737, 58.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (654, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.29, 78.51, 1.141, 6.73, '2025-12-27 15:18:21', '0', 116.384753, 39.893741, 47.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (655, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.43, 77.27, 1.594, 6.83, '2025-12-27 14:18:21', '0', 116.406024, 39.911961, 60.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (656, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.73, 75.14, 0.722, 6.41, '2025-12-27 13:18:21', '0', 116.378145, 39.891341, 50.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (657, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.53, 73.13, 1.241, 6.61, '2025-12-27 12:18:21', '0', 116.409912, 39.913843, 52.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (658, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.14, 69.89, 1.020, 6.59, '2025-12-27 11:18:21', '0', 116.388037, 39.908116, 67.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (659, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.96, 82.16, 1.482, 6.78, '2025-12-27 10:18:21', '0', 116.393428, 39.895542, 56.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (660, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.08, 77.03, 0.763, 6.64, '2025-12-27 09:18:21', '0', 116.386810, 39.926012, 42.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (661, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.84, 70.88, 1.354, 6.99, '2025-12-27 08:18:21', '0', 116.399491, 39.915678, 31.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (662, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.20, 84.15, 1.358, 6.56, '2025-12-27 07:18:21', '0', 116.407301, 39.904327, 50.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (663, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.14, 75.96, 1.178, 6.17, '2025-12-27 06:18:21', '0', 116.382942, 39.919605, 65.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (664, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.08, 82.11, 1.359, 6.93, '2025-12-27 05:18:21', '0', 116.387929, 39.898603, 46.05, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (665, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.62, 80.74, 1.305, 6.52, '2025-12-27 04:18:21', '0', 116.419069, 39.899575, 69.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (666, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.92, 77.24, 0.979, 6.81, '2025-12-27 03:18:21', '0', 116.407196, 39.916732, 52.94, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (667, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.08, 76.23, 1.621, 6.29, '2025-12-27 02:18:21', '0', 116.379106, 39.926061, 42.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (668, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.22, 78.05, 1.458, 7.19, '2025-12-27 01:18:21', '0', 116.403356, 39.922368, 54.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (669, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.44, 72.07, 0.834, 5.68, '2025-12-27 00:18:21', '0', 116.409881, 39.894499, 59.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (670, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.81, 73.17, 1.478, 6.44, '2025-12-26 23:18:21', '0', 116.387954, 39.932000, 36.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (671, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.16, 71.03, 1.408, 6.70, '2025-12-26 22:18:21', '0', 116.389929, 39.913546, 43.53, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (672, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.30, 74.87, 1.520, 6.63, '2025-12-26 21:18:21', '0', 116.399680, 39.910336, 48.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (673, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.54, 73.05, 1.372, 7.10, '2025-12-26 20:18:21', '0', 116.393660, 39.926167, 52.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (674, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.36, 62.11, 0.721, 6.12, '2025-12-26 19:18:21', '0', 116.393767, 39.922572, 29.14, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (675, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.46, 73.37, 1.014, 6.62, '2025-12-26 18:18:21', '0', 116.406126, 39.917148, 50.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (676, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.44, 74.32, 1.315, 6.39, '2025-12-26 17:18:21', '0', 116.380816, 39.917120, 52.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (677, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.11, 69.66, 1.223, 6.47, '2025-12-26 16:18:21', '0', 116.396270, 39.920200, 46.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (678, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.52, 69.67, 1.342, 6.00, '2025-12-26 15:18:21', '0', 116.395893, 39.903854, 50.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (679, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.35, 61.47, 1.172, 6.39, '2025-12-26 14:18:21', '0', 116.400460, 39.916712, 51.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (680, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.82, 70.92, 1.003, 6.56, '2025-12-26 13:18:21', '0', 116.401113, 39.900212, 31.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (681, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.94, 60.18, 0.919, 7.06, '2025-12-26 12:18:21', '0', 116.392530, 39.919032, 54.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (682, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.23, 65.81, 0.389, 6.73, '2025-12-26 11:18:21', '0', 116.403858, 39.905935, 46.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (683, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.84, 54.22, 1.701, 6.40, '2025-12-26 10:18:21', '0', 116.393072, 39.888080, 52.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (684, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.81, 60.74, 1.770, 6.23, '2025-12-26 09:18:21', '0', 116.401377, 39.892742, 58.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (685, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.58, 67.64, 1.719, 6.09, '2025-12-26 08:18:21', '0', 116.388071, 39.913289, 66.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (686, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.81, 64.69, 1.297, 6.76, '2025-12-26 07:18:21', '0', 116.389888, 39.888529, 41.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (687, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.85, 64.66, 1.317, 6.29, '2025-12-26 06:18:21', '0', 116.382583, 39.902142, 51.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (688, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.23, 58.04, 0.813, 6.90, '2025-12-26 05:18:21', '0', 116.389262, 39.902548, 46.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (689, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.78, 60.82, 1.417, 6.07, '2025-12-26 04:18:21', '0', 116.407272, 39.906502, 66.47, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (690, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.51, 46.80, 1.346, 5.64, '2025-12-26 03:18:21', '0', 116.386461, 39.896205, 59.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (691, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.73, 52.19, 0.910, 6.33, '2025-12-26 02:18:21', '0', 116.410552, 39.913606, 47.14, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (692, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.27, 62.83, 1.367, 5.83, '2025-12-26 01:18:21', '0', 116.398088, 39.905715, 37.36, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (693, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.65, 54.50, 1.288, 6.75, '2025-12-26 00:18:21', '0', 116.401071, 39.903108, 56.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (694, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.27, 62.00, 1.107, 6.12, '2025-12-25 23:18:21', '0', 116.403840, 39.895310, 66.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (695, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.51, 57.38, 1.138, 5.62, '2025-12-25 22:18:21', '0', 116.371256, 39.906969, 63.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (696, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.21, 60.31, 1.334, 7.03, '2025-12-25 21:18:21', '0', 116.401852, 39.896666, 53.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (697, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.90, 51.02, 0.915, 6.69, '2025-12-25 20:18:21', '0', 116.405093, 39.903025, 45.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (698, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.38, 51.96, 1.687, 6.50, '2025-12-25 19:18:21', '0', 116.405339, 39.925420, 41.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (699, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.90, 51.52, 0.835, 6.56, '2025-12-25 18:18:21', '0', 116.397751, 39.901292, 41.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (700, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.93, 56.82, 1.258, 5.70, '2025-12-25 17:18:21', '0', 116.397873, 39.888010, 45.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (701, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.32, 53.70, 1.214, 6.78, '2025-12-25 16:18:21', '0', 116.394561, 39.916054, 44.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (702, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.16, 50.31, 0.770, 5.98, '2025-12-25 15:18:21', '0', 116.401023, 39.922334, 47.49, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (703, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.34, 50.16, 0.738, 6.72, '2025-12-25 14:18:21', '0', 116.381757, 39.902026, 57.47, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (704, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.60, 50.28, 1.385, 6.65, '2025-12-25 13:18:21', '0', 116.391650, 39.921658, 41.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (705, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.82, 57.28, 0.978, 6.98, '2025-12-25 12:18:21', '0', 116.400994, 39.927105, 61.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (706, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.97, 51.17, 1.562, 7.02, '2025-12-25 11:18:21', '0', 116.369249, 39.888083, 44.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (707, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.91, 47.49, 1.129, 6.62, '2025-12-25 10:18:21', '0', 116.386580, 39.904481, 72.27, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (708, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.81, 39.31, 1.806, 6.45, '2025-12-25 09:18:21', '0', 116.408428, 39.919675, 52.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (709, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.53, 50.90, 0.742, 5.76, '2025-12-25 08:18:21', '0', 116.407725, 39.917441, 45.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (710, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.44, 42.09, 1.503, 6.87, '2025-12-25 07:18:21', '0', 116.401518, 39.885766, 47.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (711, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.42, 42.73, 0.831, 6.35, '2025-12-25 06:18:21', '0', 116.403982, 39.901506, 40.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (712, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.66, 37.29, 1.182, 6.95, '2025-12-25 05:18:21', '0', 116.383143, 39.903466, 54.06, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (713, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.78, 45.69, 1.177, 6.97, '2025-12-25 04:18:21', '0', 116.405397, 39.906203, 48.57, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (714, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.04, 37.86, 1.729, 7.16, '2025-12-25 03:18:21', '0', 116.420363, 39.911698, 42.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (715, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.97, 42.63, 1.489, 6.60, '2025-12-25 02:18:21', '0', 116.394223, 39.906189, 48.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (716, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.31, 52.92, 0.809, 5.71, '2025-12-25 01:18:21', '0', 116.408994, 39.909052, 54.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (717, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.85, 41.20, 0.601, 6.43, '2025-12-25 00:18:21', '0', 116.389427, 39.911487, 33.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (718, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.44, 35.73, 1.233, 5.50, '2025-12-24 23:18:21', '0', 116.405242, 39.905096, 61.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (719, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.34, 44.18, 1.292, 7.33, '2025-12-24 22:18:21', '0', 116.399037, 39.903398, 44.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (720, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.79, 50.84, 1.067, 7.32, '2025-12-24 21:18:21', '0', 116.374451, 39.900045, 56.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (721, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.34, 41.02, 1.246, 6.73, '2025-12-24 20:18:21', '0', 116.402870, 39.910208, 50.35, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (722, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.66, 38.49, 1.127, 6.52, '2025-12-24 19:18:21', '0', 116.388177, 39.898331, 45.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (723, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.49, 41.36, 1.211, 5.61, '2025-12-24 18:18:21', '0', 116.408255, 39.911291, 65.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (724, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.96, 39.53, 1.331, 6.05, '2025-12-24 17:18:21', '0', 116.396145, 39.908861, 52.20, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (725, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.82, 40.72, 1.342, 6.54, '2025-12-24 16:18:21', '0', 116.399690, 39.903522, 58.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (726, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.60, 38.70, 1.789, 6.41, '2025-12-24 15:18:21', '0', 116.400264, 39.900154, 34.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (727, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.96, 37.79, 1.006, 6.81, '2025-12-24 14:18:21', '0', 116.403214, 39.913597, 43.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (728, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.29, 48.72, 1.198, 7.16, '2025-12-24 13:18:21', '0', 116.405433, 39.907100, 48.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (729, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.13, 46.38, 1.314, 7.21, '2025-12-24 12:18:21', '0', 116.391283, 39.923085, 67.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (730, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.69, 46.19, 1.153, 6.28, '2025-12-24 11:18:21', '0', 116.397576, 39.913603, 46.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (731, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.71, 39.36, 0.357, 6.42, '2025-12-24 10:18:21', '0', 116.392052, 39.902620, 51.47, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (732, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.24, 39.25, 1.607, 6.44, '2025-12-24 09:18:21', '0', 116.400257, 39.912386, 47.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (733, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.59, 48.20, 1.457, 6.49, '2025-12-24 08:18:21', '0', 116.406104, 39.921383, 45.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (734, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.36, 43.05, 1.084, 5.70, '2025-12-24 07:18:21', '0', 116.407441, 39.896471, 48.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (735, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.74, 31.49, 1.167, 6.87, '2025-12-24 06:18:21', '0', 116.408926, 39.930671, 40.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (736, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.14, 38.54, 1.453, 6.53, '2025-12-24 05:18:21', '0', 116.402804, 39.923091, 51.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (737, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.91, 50.93, 1.294, 5.30, '2025-12-24 04:18:21', '0', 116.399949, 39.905012, 64.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (738, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.28, 46.25, 0.908, 6.83, '2025-12-24 03:18:21', '0', 116.408049, 39.905566, 52.06, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (739, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.50, 35.84, 1.195, 6.56, '2025-12-24 02:18:21', '0', 116.384683, 39.909769, 39.42, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (740, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.25, 44.02, 1.030, 5.98, '2025-12-24 01:18:21', '0', 116.379347, 39.906227, 57.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (741, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.70, 47.07, 1.413, 7.00, '2025-12-24 00:18:21', '0', 116.384599, 39.911209, 56.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (742, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.84, 36.26, 1.220, 6.50, '2025-12-23 23:18:21', '0', 116.404252, 39.913526, 48.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (743, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.32, 43.93, 1.093, 6.89, '2025-12-23 22:18:21', '0', 116.404464, 39.894796, 61.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (744, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.09, 42.35, 1.139, 6.67, '2025-12-23 21:18:21', '0', 116.407199, 39.898623, 54.17, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (745, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.64, 60.04, 1.104, 6.74, '2025-12-23 20:18:21', '0', 116.386656, 39.899048, 64.05, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (746, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.14, 40.60, 0.938, 6.41, '2025-12-23 19:18:21', '0', 116.406359, 39.923644, 48.17, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (747, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.80, 35.58, 0.738, 6.39, '2025-12-23 18:18:21', '0', 116.426363, 39.913809, 66.27, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (748, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.90, 37.21, 1.227, 6.45, '2025-12-23 17:18:21', '0', 116.392679, 39.909131, 57.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (749, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.01, 40.84, 1.287, 6.49, '2025-12-23 16:18:21', '0', 116.415518, 39.911952, 41.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (750, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.80, 41.73, 0.755, 6.78, '2025-12-23 15:18:21', '0', 116.397460, 39.935207, 46.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (751, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.62, 45.50, 1.255, 6.44, '2025-12-23 14:18:21', '0', 116.388570, 39.906909, 54.42, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (752, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.06, 47.56, 1.661, 6.66, '2025-12-23 13:18:21', '0', 116.394920, 39.923347, 45.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (753, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.80, 47.45, 1.818, 6.59, '2025-12-23 12:18:21', '0', 116.405172, 39.930166, 44.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (754, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.90, 49.69, 1.434, 6.66, '2025-12-23 11:18:21', '0', 116.379377, 39.900634, 35.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (755, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.39, 44.72, 1.178, 6.02, '2025-12-23 10:18:21', '0', 116.402840, 39.906361, 52.06, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (756, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.50, 50.21, 1.186, 6.44, '2025-12-23 09:18:21', '0', 116.409362, 39.912434, 44.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (757, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.22, 50.11, 1.019, 6.51, '2025-12-23 08:18:21', '0', 116.420970, 39.908498, 53.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (758, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.74, 48.29, 1.167, 5.79, '2025-12-23 07:18:21', '0', 116.425961, 39.919183, 44.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (759, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.73, 48.18, 1.695, 7.18, '2025-12-23 06:18:21', '0', 116.404306, 39.902819, 59.73, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (760, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.95, 48.58, 1.326, 7.30, '2025-12-23 05:18:21', '0', 116.394370, 39.910235, 46.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (761, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.14, 51.33, 1.468, 6.54, '2025-12-23 04:18:21', '0', 116.396229, 39.906643, 61.44, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (762, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.40, 47.57, 1.014, 5.43, '2025-12-23 03:18:21', '0', 116.400328, 39.901418, 59.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (763, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.85, 53.07, 0.925, 7.80, '2025-12-23 02:18:21', '0', 116.400040, 39.909107, 57.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (764, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.14, 61.16, 1.047, 7.06, '2025-12-23 01:18:21', '0', 116.402207, 39.917284, 46.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (765, 'DEVICE_FIELD_002_001', 'FIELD_002', 6.80, 54.37, 1.293, 6.23, '2025-12-23 00:18:21', '0', 116.402921, 39.926377, 58.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (766, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.16, 53.87, 1.196, 5.77, '2025-12-22 23:18:21', '0', 116.386472, 39.904378, 62.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (767, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.49, 55.06, 1.304, 6.99, '2025-12-22 22:18:21', '0', 116.379650, 39.904991, 36.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (768, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.20, 62.48, 1.153, 6.82, '2025-12-22 21:18:21', '0', 116.391321, 39.920345, 45.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (769, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.95, 65.49, 0.594, 5.89, '2025-12-22 20:18:21', '0', 116.405050, 39.901820, 60.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (770, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.66, 63.52, 1.778, 7.08, '2025-12-22 19:18:21', '0', 116.396415, 39.916998, 56.41, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (771, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.36, 59.20, 0.797, 6.60, '2025-12-22 18:18:21', '0', 116.404536, 39.916813, 40.11, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (772, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.70, 58.41, 0.613, 6.05, '2025-12-22 17:18:21', '0', 116.397903, 39.907075, 44.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (773, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.25, 62.13, 1.703, 6.72, '2025-12-22 16:18:21', '0', 116.386895, 39.892436, 34.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (774, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.49, 60.02, 0.942, 6.66, '2025-12-22 15:18:21', '0', 116.389765, 39.911119, 58.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (775, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.75, 59.26, 1.607, 6.48, '2025-12-22 14:18:21', '0', 116.415717, 39.911606, 49.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (776, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.38, 57.44, 0.650, 6.82, '2025-12-22 13:18:21', '0', 116.399188, 39.924688, 55.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (777, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.85, 65.07, 1.130, 7.28, '2025-12-22 12:18:21', '0', 116.400847, 39.897700, 45.23, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (778, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.25, 63.19, 1.510, 6.93, '2025-12-22 11:18:21', '0', 116.375872, 39.906488, 51.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (779, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.70, 59.99, 1.142, 6.19, '2025-12-22 10:18:21', '0', 116.405504, 39.910911, 27.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (780, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.56, 62.51, 0.926, 5.88, '2025-12-22 09:18:21', '0', 116.415295, 39.903567, 40.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (781, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.58, 68.79, 1.373, 6.93, '2025-12-22 08:18:21', '0', 116.410259, 39.911868, 52.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (782, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.20, 73.86, 1.491, 5.89, '2025-12-22 07:18:21', '0', 116.406868, 39.891743, 37.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (783, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.33, 63.63, 1.414, 7.42, '2025-12-22 06:18:21', '0', 116.391596, 39.905443, 41.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (784, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.71, 71.71, 1.085, 6.88, '2025-12-22 05:18:21', '0', 116.387722, 39.918066, 45.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (785, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.96, 59.69, 1.373, 6.57, '2025-12-22 04:18:21', '0', 116.407711, 39.891924, 33.55, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (786, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.51, 73.20, 1.039, 6.56, '2025-12-22 03:18:21', '0', 116.378624, 39.908427, 28.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (787, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.32, 69.65, 1.082, 6.74, '2025-12-22 02:18:21', '0', 116.401243, 39.900860, 53.11, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (788, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.99, 71.51, 1.240, 7.19, '2025-12-22 01:18:21', '0', 116.403188, 39.891507, 24.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (789, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.59, 72.42, 1.848, 5.38, '2025-12-22 00:18:21', '0', 116.419045, 39.903878, 43.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (790, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.08, 84.05, 1.285, 6.40, '2025-12-21 23:18:21', '0', 116.389896, 39.902622, 50.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (791, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.77, 72.50, 1.366, 7.50, '2025-12-21 22:18:21', '0', 116.390105, 39.917724, 46.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (792, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.19, 74.68, 0.831, 6.24, '2025-12-21 21:18:21', '0', 116.396971, 39.906118, 34.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (793, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.83, 80.27, 1.487, 6.53, '2025-12-21 20:18:21', '0', 116.404064, 39.910976, 43.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (794, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.54, 70.82, 1.380, 5.64, '2025-12-21 19:18:21', '0', 116.391946, 39.905289, 39.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (795, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.92, 69.69, 1.225, 6.03, '2025-12-21 18:18:21', '0', 116.394076, 39.900987, 35.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (796, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.81, 78.36, 1.049, 5.75, '2025-12-21 17:18:21', '0', 116.398132, 39.910839, 57.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (797, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.84, 75.72, 0.817, 5.94, '2025-12-21 16:18:21', '0', 116.404610, 39.917138, 34.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (798, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.41, 64.70, 1.024, 5.94, '2025-12-21 15:18:21', '0', 116.400143, 39.919992, 58.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (799, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.43, 84.42, 1.074, 7.21, '2025-12-21 14:18:21', '0', 116.399152, 39.934534, 59.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (800, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.68, 87.95, 1.254, 6.26, '2025-12-21 13:18:21', '0', 116.387415, 39.908636, 43.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (801, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.88, 71.65, 1.009, 6.31, '2025-12-21 12:18:21', '0', 116.407804, 39.907508, 47.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (802, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.52, 71.41, 0.630, 6.38, '2025-12-21 11:18:21', '0', 116.385980, 39.897408, 48.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (803, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.59, 77.50, 1.120, 5.92, '2025-12-21 10:18:21', '0', 116.388879, 39.923183, 45.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (804, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.14, 87.29, 1.108, 6.81, '2025-12-21 09:18:21', '0', 116.391517, 39.897443, 46.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (805, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.26, 77.95, 1.188, 6.76, '2025-12-21 08:18:21', '0', 116.402949, 39.891540, 39.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (806, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.14, 69.72, 0.797, 7.10, '2025-12-21 07:18:21', '0', 116.400677, 39.889167, 42.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (807, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.47, 80.01, 1.536, 6.01, '2025-12-21 06:18:21', '0', 116.390980, 39.915279, 61.27, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (808, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.56, 85.80, 1.414, 6.32, '2025-12-21 05:18:21', '0', 116.414554, 39.904600, 43.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (809, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.39, 89.77, 0.905, 5.51, '2025-12-21 04:18:21', '0', 116.420423, 39.892347, 75.99, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (810, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.50, 79.13, 1.435, 6.97, '2025-12-21 03:18:21', '0', 116.388767, 39.912905, 58.04, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (811, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.40, 74.18, 1.686, 6.53, '2025-12-21 02:18:21', '0', 116.410401, 39.914694, 70.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (812, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.47, 75.37, 1.073, 5.74, '2025-12-21 01:18:21', '0', 116.368282, 39.910970, 57.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (813, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.46, 87.30, 1.510, 6.82, '2025-12-21 00:18:21', '0', 116.392026, 39.904789, 50.49, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (814, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.12, 82.19, 1.072, 6.39, '2025-12-20 23:18:21', '0', 116.381406, 39.913273, 55.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (815, 'DEVICE_FIELD_002_001', 'FIELD_002', 3.51, 79.50, 1.433, 7.02, '2025-12-20 22:18:21', '0', 116.390667, 39.903257, 70.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (816, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.75, 83.11, 1.109, 7.44, '2025-12-20 21:18:21', '0', 116.392606, 39.908293, 40.71, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (817, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.87, 78.99, 1.253, 6.30, '2025-12-20 20:18:21', '0', 116.398517, 39.905915, 56.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (818, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.76, 80.75, 0.864, 6.31, '2025-12-20 19:18:21', '0', 116.401009, 39.923001, 56.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (819, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.76, 76.09, 1.884, 6.60, '2025-12-20 18:18:21', '0', 116.396758, 39.909700, 71.41, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (820, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.44, 87.63, 1.374, 6.58, '2025-12-20 17:18:21', '0', 116.396323, 39.907523, 59.35, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (821, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.33, 84.21, 1.516, 5.95, '2025-12-20 16:18:21', '0', 116.389565, 39.915481, 41.00, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (822, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.67, 76.49, 1.184, 6.57, '2025-12-20 15:18:21', '0', 116.404778, 39.898287, 39.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (823, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.96, 69.45, 1.280, 5.99, '2025-12-20 14:18:21', '0', 116.395085, 39.917454, 26.75, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (824, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.12, 80.39, 1.245, 6.27, '2025-12-20 13:18:21', '0', 116.397601, 39.895552, 80.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (825, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.72, 84.65, 1.489, 6.48, '2025-12-20 12:18:21', '0', 116.396296, 39.894708, 36.14, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (826, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.73, 81.02, 1.367, 7.24, '2025-12-20 11:18:21', '0', 116.412663, 39.910212, 46.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (827, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.55, 83.94, 1.682, 6.49, '2025-12-20 10:18:21', '0', 116.392704, 39.910837, 60.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (828, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.47, 73.26, 1.062, 7.07, '2025-12-20 09:18:21', '0', 116.400953, 39.899695, 49.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (829, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.22, 80.04, 1.173, 5.97, '2025-12-20 08:18:21', '0', 116.396455, 39.908053, 45.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (830, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.75, 85.98, 1.066, 7.01, '2025-12-20 07:18:21', '0', 116.395390, 39.917456, 46.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (831, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.12, 81.81, 1.343, 6.85, '2025-12-20 06:18:21', '0', 116.407368, 39.892905, 50.51, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (832, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.05, 81.05, 0.591, 6.09, '2025-12-20 05:18:21', '0', 116.398004, 39.895491, 39.73, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (833, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.40, 74.08, 1.260, 5.88, '2025-12-20 04:18:21', '0', 116.407704, 39.897094, 44.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (834, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.98, 68.95, 1.321, 6.51, '2025-12-20 03:18:21', '0', 116.390350, 39.898030, 70.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (835, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.11, 72.72, 1.432, 6.34, '2025-12-20 02:18:21', '0', 116.390452, 39.913959, 41.75, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (836, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.49, 66.09, 1.148, 6.11, '2025-12-20 01:18:21', '0', 116.418504, 39.917779, 59.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (837, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.16, 72.82, 1.130, 6.87, '2025-12-20 00:18:21', '0', 116.385216, 39.912587, 38.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (838, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.27, 70.96, 1.315, 6.71, '2025-12-19 23:18:21', '0', 116.391282, 39.915253, 36.75, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (839, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.45, 78.02, 1.160, 5.93, '2025-12-19 22:18:21', '0', 116.402276, 39.919829, 60.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (840, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.94, 72.41, 0.909, 6.98, '2025-12-19 21:18:21', '0', 116.384100, 39.916605, 35.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (841, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.21, 70.03, 1.706, 6.32, '2025-12-19 20:18:21', '0', 116.402008, 39.903305, 52.49, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (842, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.64, 68.27, 1.642, 7.00, '2025-12-19 19:18:21', '0', 116.388739, 39.916100, 37.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (843, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.86, 67.61, 1.679, 5.94, '2025-12-19 18:18:21', '0', 116.404893, 39.918156, 40.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (844, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.96, 65.22, 0.671, 6.47, '2025-12-19 17:18:21', '0', 116.387233, 39.931659, 43.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (845, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.50, 65.59, 0.820, 6.57, '2025-12-19 16:18:21', '0', 116.395460, 39.921323, 41.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (846, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.47, 72.53, 0.765, 6.42, '2025-12-19 15:18:21', '0', 116.394114, 39.908867, 77.08, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (847, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.53, 74.57, 1.778, 6.25, '2025-12-19 14:18:21', '0', 116.386275, 39.901278, 45.55, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (848, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.38, 67.72, 1.281, 7.07, '2025-12-19 13:18:21', '0', 116.401260, 39.904943, 36.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (849, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.65, 66.99, 1.632, 6.52, '2025-12-19 12:18:21', '0', 116.406226, 39.934113, 42.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (850, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.04, 56.60, 0.964, 6.60, '2025-12-19 11:18:21', '0', 116.393645, 39.903108, 42.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (851, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.30, 60.78, 1.198, 6.59, '2025-12-19 10:18:21', '0', 116.393880, 39.899326, 55.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (852, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.63, 54.58, 0.803, 6.96, '2025-12-19 09:18:21', '0', 116.388399, 39.898217, 55.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (853, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.41, 62.47, 1.403, 6.96, '2025-12-19 08:18:21', '0', 116.400554, 39.906086, 19.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (854, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.13, 59.38, 1.952, 5.84, '2025-12-19 07:18:21', '0', 116.398945, 39.916404, 43.94, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (855, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.40, 53.64, 1.551, 5.64, '2025-12-19 06:18:21', '0', 116.408327, 39.892326, 26.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (856, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.72, 61.89, 1.167, 6.45, '2025-12-19 05:18:21', '0', 116.412844, 39.893906, 37.30, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (857, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.79, 50.38, 1.391, 6.43, '2025-12-19 04:18:21', '0', 116.392335, 39.899551, 66.99, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (858, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.35, 59.64, 1.277, 6.18, '2025-12-19 03:18:21', '0', 116.414462, 39.909341, 41.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (859, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.84, 58.55, 0.855, 5.62, '2025-12-19 02:18:21', '0', 116.384353, 39.891373, 60.55, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (860, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.80, 58.80, 1.571, 5.98, '2025-12-19 01:18:21', '0', 116.390613, 39.892177, 44.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (861, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.67, 59.37, 0.958, 7.33, '2025-12-19 00:18:21', '0', 116.397187, 39.906224, 49.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (862, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.36, 56.49, 1.247, 7.24, '2025-12-18 23:18:21', '0', 116.383341, 39.896264, 34.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (863, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.45, 57.16, 1.178, 6.63, '2025-12-18 22:18:21', '0', 116.404758, 39.907641, 51.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (864, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.01, 61.55, 0.900, 6.67, '2025-12-18 21:18:21', '0', 116.402616, 39.900055, 46.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (865, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.91, 51.17, 1.160, 6.86, '2025-12-18 20:18:21', '0', 116.404182, 39.914608, 48.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (866, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.20, 50.76, 1.157, 6.58, '2025-12-18 19:18:21', '0', 116.395514, 39.906542, 55.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (867, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.88, 55.12, 1.365, 6.12, '2025-12-18 18:18:21', '0', 116.373702, 39.896175, 44.99, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (868, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.35, 46.61, 1.876, 6.08, '2025-12-18 17:18:21', '0', 116.406339, 39.886419, 39.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (869, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.85, 50.87, 0.919, 7.19, '2025-12-18 16:18:21', '0', 116.407786, 39.902425, 47.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (870, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.34, 49.98, 0.974, 6.29, '2025-12-18 15:18:21', '0', 116.392218, 39.915515, 49.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (871, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.87, 48.73, 0.939, 6.62, '2025-12-18 14:18:21', '0', 116.411124, 39.910846, 64.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (872, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.54, 57.85, 1.126, 6.59, '2025-12-18 13:18:21', '0', 116.392630, 39.915666, 39.12, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (873, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.03, 45.63, 0.783, 6.06, '2025-12-18 12:18:21', '0', 116.378673, 39.923052, 53.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (874, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.62, 55.61, 1.187, 6.61, '2025-12-18 11:18:21', '0', 116.392467, 39.917596, 45.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (875, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.11, 37.55, 1.148, 6.42, '2025-12-18 10:18:21', '0', 116.383413, 39.919469, 58.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (876, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.55, 48.68, 1.182, 6.23, '2025-12-18 09:18:21', '0', 116.389447, 39.903102, 43.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (877, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.01, 49.39, 0.926, 5.74, '2025-12-18 08:18:21', '0', 116.397950, 39.900900, 56.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (878, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.34, 49.83, 1.185, 6.76, '2025-12-18 07:18:21', '0', 116.387475, 39.921453, 65.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (879, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.48, 52.74, 1.220, 6.88, '2025-12-18 06:18:21', '0', 116.394822, 39.902560, 57.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (880, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.68, 47.31, 1.245, 6.52, '2025-12-18 05:18:21', '0', 116.386357, 39.904197, 47.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (881, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.72, 54.15, 0.822, 6.89, '2025-12-18 04:18:21', '0', 116.409222, 39.906858, 58.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (882, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.96, 42.60, 1.375, 7.59, '2025-12-18 03:18:21', '0', 116.395516, 39.920941, 60.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (883, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.92, 35.10, 1.207, 5.86, '2025-12-18 02:18:21', '0', 116.404885, 39.901303, 62.28, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (884, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.49, 35.10, 1.374, 6.58, '2025-12-18 01:18:21', '0', 116.390786, 39.907141, 62.94, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (885, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.11, 43.91, 1.810, 6.47, '2025-12-18 00:18:21', '0', 116.391198, 39.913133, 61.73, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (886, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.23, 44.91, 0.873, 6.46, '2025-12-17 23:18:21', '0', 116.393786, 39.908932, 59.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (887, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.44, 46.10, 1.950, 6.98, '2025-12-17 22:18:21', '0', 116.384200, 39.916430, 46.12, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (888, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.71, 37.76, 1.043, 6.13, '2025-12-17 21:18:21', '0', 116.375301, 39.918335, 53.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (889, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.68, 52.47, 1.129, 6.03, '2025-12-17 20:18:21', '0', 116.400595, 39.894589, 35.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (890, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.35, 39.38, 1.183, 6.68, '2025-12-17 19:18:21', '0', 116.417800, 39.909550, 48.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (891, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.72, 41.31, 1.029, 7.23, '2025-12-17 18:18:21', '0', 116.386759, 39.906073, 58.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (892, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.99, 39.87, 1.697, 6.68, '2025-12-17 17:18:21', '0', 116.386531, 39.914963, 58.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (893, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.33, 38.99, 0.496, 6.11, '2025-12-17 16:18:21', '0', 116.403130, 39.918005, 64.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (894, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.01, 32.19, 1.432, 5.72, '2025-12-17 15:18:21', '0', 116.381104, 39.913712, 64.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (895, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.10, 25.55, 0.718, 7.05, '2025-12-17 14:18:21', '0', 116.403895, 39.905546, 56.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (896, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.14, 30.86, 1.138, 6.94, '2025-12-17 13:18:21', '0', 116.408434, 39.934511, 33.02, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (897, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.72, 38.90, 0.941, 7.24, '2025-12-17 12:18:21', '0', 116.387318, 39.905855, 59.49, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (898, 'DEVICE_FIELD_002_001', 'FIELD_002', 34.27, 39.67, 1.317, 6.57, '2025-12-17 11:18:21', '0', 116.404857, 39.905188, 58.17, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (899, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.95, 33.44, 1.768, 7.01, '2025-12-17 10:18:21', '0', 116.380508, 39.916076, 76.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (900, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.07, 43.02, 1.113, 7.22, '2025-12-17 09:18:21', '0', 116.390265, 39.915213, 45.66, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (901, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.85, 31.08, 0.968, 6.39, '2025-12-17 08:18:21', '0', 116.381811, 39.929021, 41.19, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (902, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.46, 39.65, 1.650, 6.70, '2025-12-17 07:18:21', '0', 116.396316, 39.897358, 61.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (903, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.51, 37.68, 1.460, 6.33, '2025-12-17 06:18:21', '0', 116.386163, 39.919417, 46.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (904, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.30, 36.51, 1.332, 6.13, '2025-12-17 05:18:21', '0', 116.404260, 39.919354, 57.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (905, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.66, 46.59, 1.738, 6.10, '2025-12-17 04:18:21', '0', 116.384794, 39.899582, 41.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (906, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.42, 40.27, 1.762, 5.77, '2025-12-17 03:18:21', '0', 116.405626, 39.903490, 48.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (907, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.38, 39.67, 1.448, 6.85, '2025-12-17 02:18:21', '0', 116.387232, 39.901549, 45.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (908, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.44, 37.33, 1.154, 5.47, '2025-12-17 01:18:21', '0', 116.406296, 39.915306, 63.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (909, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.91, 43.05, 0.938, 5.64, '2025-12-17 00:18:21', '0', 116.403797, 39.917469, 45.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (910, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.37, 37.88, 1.864, 5.72, '2025-12-16 23:18:21', '0', 116.420871, 39.903518, 26.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (911, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.38, 39.77, 1.318, 6.31, '2025-12-16 22:18:21', '0', 116.394231, 39.923097, 46.36, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (912, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.78, 37.55, 1.307, 5.62, '2025-12-16 21:18:21', '0', 116.399328, 39.914325, 67.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (913, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.86, 40.82, 1.078, 6.92, '2025-12-16 20:18:21', '0', 116.405257, 39.902816, 62.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (914, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.26, 36.92, 1.118, 6.22, '2025-12-16 19:18:21', '0', 116.396796, 39.894116, 48.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (915, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.74, 46.30, 1.203, 6.30, '2025-12-16 18:18:21', '0', 116.397736, 39.886964, 37.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (916, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.71, 41.96, 0.951, 6.84, '2025-12-16 17:18:21', '0', 116.401046, 39.918552, 40.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (917, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.44, 45.79, 1.348, 6.29, '2025-12-16 16:18:21', '0', 116.394579, 39.897843, 52.01, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (918, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.59, 41.81, 1.289, 7.27, '2025-12-16 15:18:21', '0', 116.396670, 39.907410, 48.44, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (919, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.33, 52.85, 0.715, 7.48, '2025-12-16 14:18:21', '0', 116.399578, 39.887741, 55.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (920, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.96, 50.10, 1.075, 6.52, '2025-12-16 13:18:21', '0', 116.384613, 39.923599, 61.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (921, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.93, 43.75, 1.637, 6.21, '2025-12-16 12:18:21', '0', 116.403165, 39.906649, 59.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (922, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.66, 49.68, 1.279, 6.59, '2025-12-16 11:18:21', '0', 116.398753, 39.911610, 44.75, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (923, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.19, 43.96, 1.041, 6.85, '2025-12-16 10:18:21', '0', 116.402361, 39.914170, 39.25, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (924, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.65, 49.72, 1.542, 6.59, '2025-12-16 09:18:21', '0', 116.405764, 39.900072, 55.67, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (925, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.86, 43.61, 1.000, 6.87, '2025-12-16 08:18:21', '0', 116.393995, 39.897881, 44.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (926, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.52, 47.14, 1.355, 7.11, '2025-12-16 07:18:21', '0', 116.409188, 39.916471, 51.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (927, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.48, 51.42, 1.268, 6.52, '2025-12-16 06:18:21', '0', 116.396788, 39.903991, 66.14, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (928, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.33, 43.76, 0.929, 7.04, '2025-12-16 05:18:21', '0', 116.386693, 39.899614, 41.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (929, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.23, 44.75, 1.619, 5.67, '2025-12-16 04:18:21', '0', 116.405001, 39.923223, 63.62, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (930, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.94, 56.40, 1.554, 6.27, '2025-12-16 03:18:21', '0', 116.380597, 39.919743, 34.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (931, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.24, 52.68, 1.164, 5.83, '2025-12-16 02:18:21', '0', 116.408497, 39.889498, 43.05, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (932, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.16, 46.65, 1.177, 7.63, '2025-12-16 01:18:21', '0', 116.425590, 39.907649, 62.73, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (933, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.23, 56.64, 1.102, 6.82, '2025-12-16 00:18:21', '0', 116.383428, 39.899184, 43.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (934, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.66, 58.17, 1.116, 6.91, '2025-12-15 23:18:21', '0', 116.402859, 39.914823, 57.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (935, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.42, 61.65, 1.278, 6.15, '2025-12-15 22:18:21', '0', 116.397944, 39.890298, 55.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (936, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.45, 66.18, 1.088, 6.57, '2025-12-15 21:18:21', '0', 116.403937, 39.915209, 57.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (937, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.52, 63.05, 0.955, 6.71, '2025-12-15 20:18:21', '0', 116.394636, 39.917957, 34.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (938, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.87, 54.80, 1.427, 5.84, '2025-12-15 19:18:21', '0', 116.399723, 39.911495, 46.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (939, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.32, 59.04, 1.587, 7.23, '2025-12-15 18:18:21', '0', 116.410777, 39.891411, 56.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (940, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.84, 60.66, 1.076, 6.81, '2025-12-15 17:18:21', '0', 116.389555, 39.908590, 34.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (941, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.36, 54.87, 1.140, 6.67, '2025-12-15 16:18:21', '0', 116.409877, 39.912640, 45.02, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (942, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.25, 58.48, 1.685, 6.32, '2025-12-15 15:18:21', '0', 116.396059, 39.901792, 63.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (943, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.99, 60.74, 0.737, 6.24, '2025-12-15 14:18:21', '0', 116.397778, 39.925564, 26.27, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (944, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.52, 63.06, 1.398, 6.40, '2025-12-15 13:18:21', '0', 116.419712, 39.921581, 55.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (945, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.60, 60.92, 1.553, 6.39, '2025-12-15 12:18:21', '0', 116.394324, 39.917294, 55.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (946, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.38, 59.01, 1.242, 6.21, '2025-12-15 11:18:21', '0', 116.388766, 39.905923, 47.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (947, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.58, 70.24, 1.105, 6.48, '2025-12-15 10:18:21', '0', 116.408116, 39.914495, 56.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (948, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.09, 60.92, 1.397, 6.64, '2025-12-15 09:18:21', '0', 116.398521, 39.911807, 58.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (949, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.98, 65.48, 1.087, 6.65, '2025-12-15 08:18:21', '0', 116.393781, 39.906789, 41.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (950, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.57, 69.67, 1.557, 7.10, '2025-12-15 07:18:21', '0', 116.415095, 39.908336, 48.29, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (951, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.94, 67.40, 1.004, 6.47, '2025-12-15 06:18:21', '0', 116.405359, 39.896300, 49.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (952, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.73, 64.52, 1.335, 6.60, '2025-12-15 05:18:21', '0', 116.395228, 39.925170, 37.44, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (953, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.26, 70.28, 0.929, 6.49, '2025-12-15 04:18:21', '0', 116.400744, 39.911900, 61.00, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (954, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.77, 78.15, 0.832, 6.48, '2025-12-15 03:18:21', '0', 116.399674, 39.888008, 61.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (955, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.03, 72.34, 1.226, 5.85, '2025-12-15 02:18:21', '0', 116.394892, 39.908106, 44.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (956, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.87, 63.76, 1.542, 6.70, '2025-12-15 01:18:21', '0', 116.413941, 39.897584, 50.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (957, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.13, 66.63, 0.958, 6.42, '2025-12-15 00:18:21', '0', 116.388766, 39.911066, 73.41, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (958, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.40, 63.52, 1.978, 6.73, '2025-12-14 23:18:21', '0', 116.413458, 39.892202, 54.23, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (959, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.80, 65.73, 1.179, 6.26, '2025-12-14 22:18:21', '0', 116.381277, 39.911697, 42.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (960, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.32, 75.03, 0.750, 7.03, '2025-12-14 21:18:21', '0', 116.392527, 39.908481, 43.12, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (961, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.86, 80.01, 0.840, 6.91, '2025-12-14 20:18:21', '0', 116.401370, 39.910072, 46.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (962, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.31, 73.81, 1.262, 5.83, '2025-12-14 19:18:21', '0', 116.378468, 39.917577, 47.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (963, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.68, 70.50, 1.549, 6.16, '2025-12-14 18:18:21', '0', 116.399802, 39.914824, 55.77, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (964, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.34, 74.98, 0.491, 5.21, '2025-12-14 17:18:21', '0', 116.382751, 39.915899, 57.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (965, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.69, 76.69, 1.236, 7.01, '2025-12-14 16:18:21', '0', 116.386206, 39.921780, 31.69, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (966, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.95, 71.19, 1.193, 6.35, '2025-12-14 15:18:21', '0', 116.423951, 39.926812, 59.79, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (967, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.12, 85.42, 1.021, 6.85, '2025-12-14 14:18:21', '0', 116.393726, 39.910514, 55.80, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (968, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.24, 76.71, 1.320, 5.84, '2025-12-14 13:18:21', '0', 116.377934, 39.899255, 44.27, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (969, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.10, 82.22, 1.260, 6.40, '2025-12-14 12:18:21', '0', 116.399457, 39.898888, 50.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (970, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.61, 77.85, 1.260, 5.86, '2025-12-14 11:18:21', '0', 116.391817, 39.924553, 39.92, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (971, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.09, 78.09, 1.125, 5.22, '2025-12-14 10:18:21', '0', 116.397810, 39.906225, 61.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (972, 'DEVICE_FIELD_002_001', 'FIELD_002', 34.17, 80.50, 1.570, 6.67, '2025-12-14 09:18:21', '0', 116.405668, 39.906261, 53.55, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (973, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.11, 86.47, 1.317, 7.04, '2025-12-14 08:18:21', '0', 116.398607, 39.922446, 45.81, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (974, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.15, 83.76, 1.799, 6.40, '2025-12-14 07:18:21', '0', 116.404206, 39.916422, 59.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (975, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.57, 86.95, 1.594, 6.40, '2025-12-14 06:18:21', '0', 116.392670, 39.903401, 56.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (976, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.85, 70.17, 0.828, 6.43, '2025-12-14 05:18:21', '0', 116.392151, 39.910619, 45.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (977, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.59, 70.44, 1.218, 5.98, '2025-12-14 04:18:21', '0', 116.394661, 39.905144, 46.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (978, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.28, 78.11, 1.152, 6.09, '2025-12-14 03:18:21', '0', 116.390330, 39.913441, 61.58, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (979, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.40, 80.48, 0.948, 5.86, '2025-12-14 02:18:21', '0', 116.391915, 39.904220, 66.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (980, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.20, 78.51, 1.184, 5.55, '2025-12-14 01:18:21', '0', 116.398174, 39.906169, 54.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (981, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.45, 74.82, 1.377, 6.10, '2025-12-14 00:18:21', '0', 116.388738, 39.900986, 56.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (982, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.86, 69.34, 1.037, 6.26, '2025-12-13 23:18:21', '0', 116.398224, 39.909881, 62.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (983, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.47, 78.41, 1.319, 5.55, '2025-12-13 22:18:21', '0', 116.400432, 39.904681, 54.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (984, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.81, 74.63, 1.887, 5.67, '2025-12-13 21:18:21', '0', 116.418360, 39.917608, 45.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (985, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.79, 81.22, 1.487, 6.24, '2025-12-13 20:18:21', '0', 116.395173, 39.914616, 62.71, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (986, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.51, 78.89, 1.171, 6.37, '2025-12-13 19:18:21', '0', 116.409581, 39.915715, 68.48, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (987, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.80, 74.77, 1.286, 6.76, '2025-12-13 18:18:21', '0', 116.385877, 39.921354, 46.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (988, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.23, 74.15, 1.042, 5.80, '2025-12-13 17:18:21', '0', 116.403214, 39.918390, 49.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (989, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.21, 78.85, 1.356, 6.00, '2025-12-13 16:18:21', '0', 116.399057, 39.907938, 46.75, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (990, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.99, 78.69, 1.456, 6.62, '2025-12-13 15:18:21', '0', 116.398715, 39.896241, 44.45, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (991, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.44, 79.39, 1.619, 6.63, '2025-12-13 14:18:21', '0', 116.395966, 39.906555, 37.04, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (992, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.27, 81.22, 1.442, 6.95, '2025-12-13 13:18:21', '0', 116.412785, 39.929144, 61.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (993, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.59, 75.27, 1.439, 7.04, '2025-12-13 12:18:21', '0', 116.390735, 39.900481, 54.53, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (994, 'DEVICE_FIELD_002_001', 'FIELD_002', 35.58, 80.42, 1.388, 6.24, '2025-12-13 11:18:21', '0', 116.403891, 39.894617, 54.54, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (995, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.85, 81.53, 1.131, 7.40, '2025-12-13 10:18:21', '0', 116.402061, 39.903666, 47.05, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (996, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.77, 80.41, 1.108, 6.34, '2025-12-13 09:18:21', '0', 116.396015, 39.906907, 41.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (997, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.35, 72.53, 1.088, 5.96, '2025-12-13 08:18:21', '0', 116.400074, 39.900359, 53.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (998, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.74, 80.20, 1.297, 6.04, '2025-12-13 07:18:21', '0', 116.405873, 39.924821, 53.49, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (999, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.28, 74.78, 1.148, 5.98, '2025-12-13 06:18:21', '0', 116.410393, 39.901738, 50.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1000, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.37, 85.99, 1.150, 6.35, '2025-12-13 05:18:21', '0', 116.402066, 39.916167, 34.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1001, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.52, 72.19, 1.105, 5.79, '2025-12-13 04:18:21', '0', 116.392770, 39.900749, 48.81, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1002, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.07, 79.23, 1.131, 5.71, '2025-12-13 03:18:21', '0', 116.400069, 39.935171, 53.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1003, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.46, 76.66, 1.510, 6.81, '2025-12-13 02:18:21', '0', 116.415843, 39.892410, 45.74, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1004, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.09, 72.59, 1.240, 7.05, '2025-12-13 01:18:21', '0', 116.405290, 39.892680, 46.16, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1005, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.65, 70.62, 1.130, 7.33, '2025-12-13 00:18:21', '0', 116.390904, 39.906210, 40.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1006, 'DEVICE_FIELD_002_001', 'FIELD_002', 8.16, 64.45, 1.421, 6.86, '2025-12-12 23:18:21', '0', 116.399043, 39.910935, 37.52, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1007, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.44, 75.16, 0.767, 5.95, '2025-12-12 22:18:21', '0', 116.398651, 39.908757, 37.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1008, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.41, 75.02, 1.171, 7.19, '2025-12-12 21:18:21', '0', 116.395114, 39.919724, 49.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1009, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.74, 58.88, 1.418, 6.41, '2025-12-12 20:18:21', '0', 116.397920, 39.897648, 75.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1010, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.69, 72.79, 0.941, 6.38, '2025-12-12 19:18:21', '0', 116.398052, 39.902603, 38.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1011, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.65, 72.36, 1.495, 6.45, '2025-12-12 18:18:21', '0', 116.410606, 39.927981, 40.06, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1012, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.44, 69.10, 0.541, 6.20, '2025-12-12 17:18:21', '0', 116.387294, 39.921304, 59.36, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1013, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.01, 80.55, 0.998, 5.94, '2025-12-12 16:18:21', '0', 116.403913, 39.898051, 52.09, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1014, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.15, 64.77, 1.266, 6.93, '2025-12-12 15:18:21', '0', 116.381957, 39.904387, 61.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1015, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.99, 66.73, 1.415, 7.05, '2025-12-12 14:18:21', '0', 116.398348, 39.916170, 42.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1016, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.14, 54.43, 1.513, 6.08, '2025-12-12 13:18:21', '0', 116.387577, 39.903659, 51.42, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1017, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.11, 61.82, 1.533, 6.59, '2025-12-12 12:18:21', '0', 116.391723, 39.905770, 57.26, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1018, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.85, 58.40, 1.234, 5.82, '2025-12-12 11:18:21', '0', 116.402403, 39.902374, 46.10, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1019, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.09, 60.26, 1.074, 5.67, '2025-12-12 10:18:21', '0', 116.386017, 39.886262, 56.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1020, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.15, 64.41, 1.223, 6.55, '2025-12-12 09:18:21', '0', 116.391647, 39.899917, 38.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1021, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.00, 61.45, 1.026, 6.39, '2025-12-12 08:18:21', '0', 116.399867, 39.916313, 42.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1022, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.19, 63.02, 0.939, 6.31, '2025-12-12 07:18:21', '0', 116.414335, 39.918380, 53.61, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1023, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.99, 63.06, 1.656, 6.86, '2025-12-12 06:18:21', '0', 116.414194, 39.894408, 52.22, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1024, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.61, 65.16, 1.239, 6.77, '2025-12-12 05:18:21', '0', 116.405275, 39.913558, 49.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1025, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.45, 57.60, 0.809, 6.54, '2025-12-12 04:18:21', '0', 116.390657, 39.911821, 43.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1026, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.62, 59.09, 1.645, 6.05, '2025-12-12 03:18:21', '0', 116.420505, 39.915913, 42.53, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1027, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.64, 54.66, 1.011, 6.05, '2025-12-12 02:18:21', '0', 116.386003, 39.887859, 31.32, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1028, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.05, 56.72, 0.815, 6.50, '2025-12-12 01:18:21', '0', 116.407470, 39.912492, 69.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1029, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.00, 65.88, 0.812, 5.51, '2025-12-12 00:18:21', '0', 116.395010, 39.900283, 45.11, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1030, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.50, 61.54, 1.462, 6.41, '2025-12-11 23:18:21', '0', 116.410941, 39.922250, 50.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1031, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.39, 59.03, 1.225, 6.73, '2025-12-11 22:18:21', '0', 116.396313, 39.908364, 60.00, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1032, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.45, 46.43, 0.384, 5.79, '2025-12-11 21:18:21', '0', 116.398269, 39.909566, 56.60, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1033, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.96, 49.30, 1.002, 6.47, '2025-12-11 20:18:21', '0', 116.404099, 39.910374, 54.24, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1034, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.78, 50.92, 0.764, 5.77, '2025-12-11 19:18:21', '0', 116.405425, 39.896712, 33.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1035, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.50, 50.03, 1.095, 6.33, '2025-12-11 18:18:21', '0', 116.399764, 39.902806, 57.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1036, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.29, 43.36, 1.169, 6.57, '2025-12-11 17:18:21', '0', 116.397296, 39.911413, 53.98, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1037, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.48, 61.19, 0.890, 7.41, '2025-12-11 16:18:21', '0', 116.406670, 39.918146, 26.68, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1038, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.46, 51.04, 0.852, 6.61, '2025-12-11 15:18:21', '0', 116.402999, 39.934692, 43.13, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1039, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.77, 51.10, 0.975, 7.26, '2025-12-11 14:18:21', '0', 116.397651, 39.904728, 53.15, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1040, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.65, 54.77, 0.906, 6.21, '2025-12-11 13:18:21', '0', 116.408982, 39.926217, 46.18, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1041, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.20, 54.73, 1.590, 7.07, '2025-12-11 12:18:21', '0', 116.396112, 39.909433, 49.31, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1042, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.70, 46.15, 1.628, 5.77, '2025-12-11 11:18:21', '0', 116.395649, 39.918478, 45.94, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1043, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.08, 51.06, 1.406, 6.77, '2025-12-11 10:18:21', '0', 116.410242, 39.915517, 43.38, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1044, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.60, 56.16, 1.220, 5.77, '2025-12-11 09:18:21', '0', 116.384229, 39.915998, 42.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1045, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.25, 45.80, 0.895, 6.84, '2025-12-11 08:18:21', '0', 116.397813, 39.900493, 61.89, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1046, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.56, 47.60, 1.723, 6.38, '2025-12-11 07:18:21', '0', 116.412172, 39.907205, 56.64, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1047, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.16, 38.46, 1.233, 6.68, '2025-12-11 06:18:21', '0', 116.402881, 39.921846, 51.14, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1048, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.15, 45.51, 1.136, 5.99, '2025-12-11 05:18:21', '0', 116.401741, 39.906946, 57.37, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1049, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.89, 37.66, 1.433, 6.77, '2025-12-11 04:18:21', '0', 116.403040, 39.912229, 54.70, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1050, 'DEVICE_FIELD_002_001', 'FIELD_002', 17.06, 46.14, 1.153, 6.57, '2025-12-11 03:18:21', '0', 116.392384, 39.916266, 44.07, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1051, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.98, 51.76, 1.222, 7.37, '2025-12-11 02:18:21', '0', 116.400215, 39.914361, 69.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1052, 'DEVICE_FIELD_002_001', 'FIELD_002', 14.45, 38.21, 0.541, 6.68, '2025-12-11 01:18:21', '0', 116.410265, 39.892637, 36.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1053, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.57, 43.76, 1.469, 6.68, '2025-12-11 00:18:21', '0', 116.391835, 39.914536, 46.65, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1054, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.96, 48.10, 1.150, 6.25, '2025-12-10 23:18:21', '0', 116.401481, 39.892919, 51.84, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1055, 'DEVICE_FIELD_002_001', 'FIELD_002', 10.29, 45.72, 1.534, 5.84, '2025-12-10 22:18:21', '0', 116.395538, 39.911037, 51.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1056, 'DEVICE_FIELD_002_001', 'FIELD_002', 11.32, 37.64, 0.606, 6.06, '2025-12-10 21:18:21', '0', 116.398461, 39.921946, 38.56, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1057, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.26, 39.44, 1.524, 6.36, '2025-12-10 20:18:21', '0', 116.398581, 39.917053, 65.21, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1058, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.35, 42.93, 0.534, 6.72, '2025-12-10 19:18:21', '0', 116.390243, 39.928954, 45.91, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1059, 'DEVICE_FIELD_002_001', 'FIELD_002', 16.19, 46.72, 1.278, 6.73, '2025-12-10 18:18:21', '0', 116.397461, 39.894711, 51.43, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1060, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.56, 36.16, 1.393, 6.78, '2025-12-10 17:18:21', '0', 116.399100, 39.906426, 65.81, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1061, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.97, 45.75, 1.433, 6.13, '2025-12-10 16:18:21', '0', 116.400415, 39.912680, 48.34, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1062, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.70, 35.50, 1.336, 6.46, '2025-12-10 15:18:21', '0', 116.394394, 39.888220, 60.79, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1063, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.35, 33.95, 1.477, 6.19, '2025-12-10 14:18:21', '0', 116.396650, 39.916513, 45.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1064, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.40, 48.52, 1.106, 5.78, '2025-12-10 13:18:21', '0', 116.398785, 39.920736, 43.36, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1065, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.61, 35.50, 0.622, 7.24, '2025-12-10 12:18:21', '0', 116.399878, 39.910243, 63.39, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1066, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.71, 37.11, 1.600, 6.92, '2025-12-10 11:18:21', '0', 116.384339, 39.909272, 52.97, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1067, 'DEVICE_FIELD_002_001', 'FIELD_002', 32.34, 43.14, 0.941, 6.58, '2025-12-10 10:18:21', '0', 116.405024, 39.911298, 52.76, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1068, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.55, 40.61, 1.595, 6.57, '2025-12-10 09:18:21', '0', 116.410409, 39.912888, 50.20, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1069, 'DEVICE_FIELD_002_001', 'FIELD_002', 31.44, 28.77, 1.313, 5.71, '2025-12-10 08:18:21', '0', 116.384218, 39.909599, 56.53, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1070, 'DEVICE_FIELD_002_001', 'FIELD_002', 29.25, 43.29, 0.963, 7.40, '2025-12-10 07:18:21', '0', 116.389854, 39.905435, 49.73, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1071, 'DEVICE_FIELD_002_001', 'FIELD_002', 28.32, 38.60, 0.970, 6.43, '2025-12-10 06:18:21', '0', 116.392269, 39.895817, 50.03, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1072, 'DEVICE_FIELD_002_001', 'FIELD_002', 24.07, 43.36, 0.783, 5.59, '2025-12-10 05:18:21', '0', 116.403220, 39.904841, 30.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1073, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.76, 36.79, 1.611, 6.47, '2025-12-10 04:18:21', '0', 116.410047, 39.909883, 47.99, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1074, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.94, 32.26, 0.757, 6.00, '2025-12-10 03:18:21', '0', 116.384774, 39.909004, 52.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1075, 'DEVICE_FIELD_002_001', 'FIELD_002', 21.42, 40.33, 0.932, 6.44, '2025-12-10 02:18:21', '0', 116.399774, 39.919146, 51.12, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1076, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.73, 30.95, 1.187, 6.16, '2025-12-10 01:18:21', '0', 116.397059, 39.923881, 58.19, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1077, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.63, 43.29, 0.764, 6.72, '2025-12-10 00:18:21', '0', 116.413463, 39.905234, 51.50, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1078, 'DEVICE_FIELD_002_001', 'FIELD_002', 7.84, 46.33, 1.397, 6.85, '2025-12-09 23:18:21', '0', 116.397803, 39.889459, 43.96, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1079, 'DEVICE_FIELD_002_001', 'FIELD_002', 9.07, 38.55, 1.169, 7.30, '2025-12-09 22:18:21', '0', 116.411695, 39.911464, 47.33, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1080, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.18, 42.20, 1.199, 7.81, '2025-12-09 21:18:21', '0', 116.391966, 39.915458, 63.78, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1081, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.28, 37.72, 0.808, 5.51, '2025-12-09 20:18:21', '0', 116.390392, 39.893068, 46.46, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1082, 'DEVICE_FIELD_002_001', 'FIELD_002', 13.48, 42.29, 1.527, 6.67, '2025-12-09 19:18:21', '0', 116.391211, 39.913488, 28.87, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1083, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.97, 49.14, 1.243, 6.09, '2025-12-09 18:18:21', '0', 116.389482, 39.892549, 61.59, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1084, 'DEVICE_FIELD_002_001', 'FIELD_002', 19.22, 37.16, 0.418, 6.80, '2025-12-09 17:18:21', '0', 116.407210, 39.905256, 55.94, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1085, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.34, 35.50, 1.746, 6.17, '2025-12-09 16:18:21', '0', 116.399824, 39.919590, 27.83, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1086, 'DEVICE_FIELD_002_001', 'FIELD_002', 23.81, 44.51, 1.149, 7.26, '2025-12-09 15:18:21', '0', 116.390519, 39.912209, 48.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1087, 'DEVICE_FIELD_002_001', 'FIELD_002', 27.43, 53.72, 0.923, 6.45, '2025-12-09 14:18:21', '0', 116.395234, 39.902690, 46.86, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1088, 'DEVICE_FIELD_002_001', 'FIELD_002', 26.75, 42.68, 1.017, 6.73, '2025-12-09 13:18:21', '0', 116.394305, 39.916094, 67.93, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1089, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.15, 38.92, 1.361, 6.24, '2025-12-09 12:18:21', '0', 116.402964, 39.909785, 58.63, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1090, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.98, 47.93, 1.217, 6.42, '2025-12-09 11:18:21', '0', 116.396036, 39.912269, 54.82, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1091, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.64, 51.45, 0.905, 5.98, '2025-12-09 10:18:21', '0', 116.395269, 39.913301, 43.95, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1092, 'DEVICE_FIELD_002_001', 'FIELD_002', 30.69, 44.86, 0.675, 6.37, '2025-12-09 09:18:21', '0', 116.384820, 39.915451, 55.27, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1093, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.99, 52.42, 1.073, 6.53, '2025-12-09 08:18:21', '0', 116.397372, 39.917083, 54.24, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1094, 'DEVICE_FIELD_002_001', 'FIELD_002', 25.59, 51.95, 1.269, 6.35, '2025-12-09 07:18:21', '0', 116.404797, 39.909281, 71.94, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1095, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.89, 47.44, 1.053, 5.73, '2025-12-09 06:18:21', '0', 116.403467, 39.919755, 58.99, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1096, 'DEVICE_FIELD_002_001', 'FIELD_002', 22.36, 51.13, 1.416, 6.29, '2025-12-09 05:18:21', '0', 116.402628, 39.922262, 39.85, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1097, 'DEVICE_FIELD_002_001', 'FIELD_002', 20.15, 40.24, 1.653, 6.05, '2025-12-09 04:18:21', '0', 116.385492, 39.896492, 51.40, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1098, 'DEVICE_FIELD_002_001', 'FIELD_002', 18.20, 64.91, 1.089, 5.22, '2025-12-09 03:18:21', '0', 116.410809, 39.900781, 57.90, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1099, 'DEVICE_FIELD_002_001', 'FIELD_002', 15.68, 55.64, 0.798, 7.17, '2025-12-09 02:18:21', '0', 116.397122, 39.909394, 31.72, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1100, 'DEVICE_FIELD_002_001', 'FIELD_002', 12.86, 55.80, 1.367, 6.45, '2025-12-09 01:18:21', '0', 116.394504, 39.901529, 52.88, '2026-01-19 17:18:21', NULL);
INSERT INTO `soil_data` VALUES (1101, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.29, 60.38, 1.353, 6.39, '2026-01-19 16:18:35', '0', 116.407844, 39.913490, 43.82, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1102, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.44, 55.60, 0.859, 6.67, '2026-01-19 15:18:35', '0', 116.408581, 39.905569, 43.41, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1103, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.34, 57.08, 1.115, 7.05, '2026-01-19 14:18:35', '0', 116.395085, 39.913405, 52.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1104, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.59, 60.92, 0.919, 6.23, '2026-01-19 13:18:35', '0', 116.399459, 39.926913, 47.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1105, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.03, 61.66, 1.310, 7.23, '2026-01-19 12:18:35', '0', 116.392232, 39.912149, 52.53, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1106, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.93, 60.74, 1.373, 5.52, '2026-01-19 11:18:35', '0', 116.397698, 39.905659, 45.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1107, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.72, 64.64, 1.208, 7.02, '2026-01-19 10:18:35', '0', 116.407477, 39.913219, 65.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1108, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.33, 67.52, 1.211, 6.23, '2026-01-19 09:18:35', '0', 116.405868, 39.911459, 47.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1109, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.54, 67.04, 1.101, 6.44, '2026-01-19 08:18:35', '0', 116.392643, 39.904378, 54.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1110, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.27, 63.84, 1.390, 6.32, '2026-01-19 07:18:35', '0', 116.413451, 39.911190, 62.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1111, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.56, 69.31, 1.284, 7.10, '2026-01-19 06:18:35', '0', 116.403629, 39.912642, 40.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1112, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.54, 67.38, 1.127, 6.45, '2026-01-19 05:18:35', '0', 116.400594, 39.913745, 37.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1113, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.40, 61.62, 1.139, 6.99, '2026-01-19 04:18:35', '0', 116.394785, 39.904837, 51.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1114, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.16, 68.28, 1.266, 5.70, '2026-01-19 03:18:35', '0', 116.385221, 39.906008, 60.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1115, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.49, 66.00, 1.903, 7.12, '2026-01-19 02:18:35', '0', 116.384685, 39.908308, 58.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1116, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.85, 66.70, 1.077, 6.66, '2026-01-19 01:18:35', '0', 116.398678, 39.917334, 56.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1117, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.61, 76.78, 1.264, 5.75, '2026-01-19 00:18:35', '0', 116.386661, 39.895546, 41.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1118, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.69, 73.09, 0.900, 6.19, '2026-01-18 23:18:35', '0', 116.404698, 39.912085, 34.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1119, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.88, 75.16, 1.252, 7.74, '2026-01-18 22:18:35', '0', 116.395476, 39.893374, 55.78, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1120, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.73, 76.13, 1.238, 6.45, '2026-01-18 21:18:35', '0', 116.397260, 39.909351, 29.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1121, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.59, 76.78, 0.748, 5.93, '2026-01-18 20:18:35', '0', 116.426001, 39.916236, 37.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1122, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.67, 73.86, 1.035, 6.02, '2026-01-18 19:18:35', '0', 116.404518, 39.905572, 56.69, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1123, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.24, 74.02, 1.261, 5.61, '2026-01-18 18:18:35', '0', 116.396033, 39.907816, 67.11, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1124, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.11, 64.68, 1.010, 5.69, '2026-01-18 17:18:35', '0', 116.402863, 39.896809, 55.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1125, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.71, 72.25, 1.377, 7.20, '2026-01-18 16:18:35', '0', 116.407456, 39.901182, 34.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1126, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.10, 76.61, 1.618, 6.94, '2026-01-18 15:18:35', '0', 116.400473, 39.923202, 40.37, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1127, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.34, 75.04, 1.460, 6.03, '2026-01-18 14:18:35', '0', 116.387735, 39.922812, 48.56, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1128, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.07, 74.69, 1.385, 6.63, '2026-01-18 13:18:35', '0', 116.412030, 39.895139, 46.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1129, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.54, 79.52, 1.020, 5.98, '2026-01-18 12:18:35', '0', 116.397043, 39.919863, 46.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1130, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.14, 75.71, 1.022, 6.89, '2026-01-18 11:18:35', '0', 116.368511, 39.898170, 51.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1131, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.05, 71.93, 1.449, 6.84, '2026-01-18 10:18:35', '0', 116.390665, 39.902528, 56.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1132, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.77, 74.95, 1.391, 6.85, '2026-01-18 09:18:35', '0', 116.383906, 39.906591, 57.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1133, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.00, 79.25, 1.509, 6.29, '2026-01-18 08:18:35', '0', 116.406264, 39.907577, 26.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1134, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.01, 72.55, 1.305, 6.57, '2026-01-18 07:18:35', '0', 116.394890, 39.894470, 51.15, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1135, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.56, 79.14, 1.192, 6.23, '2026-01-18 06:18:35', '0', 116.408020, 39.925460, 41.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1136, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.12, 76.85, 0.865, 7.22, '2026-01-18 05:18:35', '0', 116.395142, 39.907186, 31.39, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1137, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.38, 80.45, 0.975, 6.43, '2026-01-18 04:18:35', '0', 116.385937, 39.906384, 48.35, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1138, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.02, 70.17, 0.866, 6.24, '2026-01-18 03:18:35', '0', 116.388163, 39.907410, 56.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1139, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.78, 83.36, 1.442, 6.93, '2026-01-18 02:18:35', '0', 116.368947, 39.906045, 55.76, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1140, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.92, 81.49, 1.724, 6.44, '2026-01-18 01:18:35', '0', 116.393314, 39.902773, 56.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1141, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.96, 79.69, 1.064, 6.41, '2026-01-18 00:18:35', '0', 116.383145, 39.905979, 52.96, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1142, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.21, 78.67, 0.972, 7.01, '2026-01-17 23:18:35', '0', 116.401963, 39.926273, 41.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1143, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.50, 76.34, 1.055, 5.76, '2026-01-17 22:18:35', '0', 116.397778, 39.903652, 36.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1144, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.27, 76.88, 1.549, 6.69, '2026-01-17 21:18:35', '0', 116.393981, 39.920178, 41.45, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1145, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.13, 80.14, 1.181, 6.53, '2026-01-17 20:18:35', '0', 116.386876, 39.902927, 60.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1146, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.45, 72.69, 1.166, 6.25, '2026-01-17 19:18:35', '0', 116.398720, 39.920041, 57.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1147, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.07, 87.83, 1.240, 6.32, '2026-01-17 18:18:35', '0', 116.398692, 39.915262, 43.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1148, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.09, 71.70, 0.913, 6.97, '2026-01-17 17:18:35', '0', 116.399527, 39.902430, 51.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1149, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.03, 78.04, 0.864, 6.84, '2026-01-17 16:18:35', '0', 116.399286, 39.909985, 65.76, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1150, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.78, 81.93, 1.346, 6.51, '2026-01-17 15:18:35', '0', 116.401326, 39.908850, 54.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1151, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.02, 73.87, 0.901, 6.31, '2026-01-17 14:18:35', '0', 116.389203, 39.903910, 37.00, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1152, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.09, 88.22, 0.956, 7.13, '2026-01-17 13:18:35', '0', 116.400354, 39.898950, 48.58, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1153, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.27, 72.85, 0.867, 6.87, '2026-01-17 12:18:35', '0', 116.403474, 39.907087, 52.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1154, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.88, 85.28, 1.362, 6.16, '2026-01-17 11:18:35', '0', 116.404466, 39.933841, 48.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1155, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.80, 71.16, 1.265, 6.49, '2026-01-17 10:18:35', '0', 116.385855, 39.910636, 53.53, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1156, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.34, 81.44, 1.255, 6.47, '2026-01-17 09:18:35', '0', 116.405251, 39.909151, 42.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1157, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.88, 85.00, 1.202, 6.56, '2026-01-17 08:18:35', '0', 116.388063, 39.906176, 42.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1158, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.28, 89.54, 1.883, 7.02, '2026-01-17 07:18:35', '0', 116.393891, 39.899667, 45.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1159, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.45, 70.71, 0.846, 5.74, '2026-01-17 06:18:35', '0', 116.388542, 39.921201, 48.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1160, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.23, 76.47, 1.108, 6.32, '2026-01-17 05:18:35', '0', 116.382735, 39.920540, 51.42, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1161, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.83, 73.85, 1.065, 6.81, '2026-01-17 04:18:35', '0', 116.392241, 39.916557, 63.33, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1162, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.22, 79.34, 1.668, 7.94, '2026-01-17 03:18:35', '0', 116.377443, 39.913968, 45.15, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1163, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.98, 72.83, 1.026, 6.59, '2026-01-17 02:18:35', '0', 116.407880, 39.900201, 43.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1164, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.77, 80.04, 1.337, 6.93, '2026-01-17 01:18:35', '0', 116.399603, 39.902819, 55.56, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1165, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.67, 71.82, 1.207, 6.90, '2026-01-17 00:18:35', '0', 116.407369, 39.907692, 59.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1166, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.85, 76.37, 1.139, 6.67, '2026-01-16 23:18:35', '0', 116.398780, 39.913791, 54.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1167, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.50, 73.62, 0.756, 6.80, '2026-01-16 22:18:35', '0', 116.403342, 39.905462, 42.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1168, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.60, 75.47, 1.320, 6.11, '2026-01-16 21:18:35', '0', 116.400345, 39.913686, 30.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1169, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.61, 74.45, 0.904, 6.49, '2026-01-16 20:18:35', '0', 116.386970, 39.900285, 48.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1170, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.89, 64.32, 0.932, 5.96, '2026-01-16 19:18:35', '0', 116.401754, 39.918072, 57.58, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1171, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.34, 73.84, 1.547, 6.54, '2026-01-16 18:18:35', '0', 116.406040, 39.916604, 40.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1172, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.30, 71.95, 0.723, 6.60, '2026-01-16 17:18:35', '0', 116.386844, 39.908288, 51.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1173, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.36, 62.01, 0.880, 6.03, '2026-01-16 16:18:35', '0', 116.406804, 39.907814, 49.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1174, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.63, 76.68, 1.653, 5.98, '2026-01-16 15:18:35', '0', 116.387847, 39.891962, 26.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1175, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.93, 72.34, 1.418, 6.73, '2026-01-16 14:18:35', '0', 116.384196, 39.907905, 42.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1176, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.25, 65.74, 0.900, 6.87, '2026-01-16 13:18:35', '0', 116.406976, 39.920329, 48.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1177, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.55, 65.46, 0.665, 7.35, '2026-01-16 12:18:35', '0', 116.404709, 39.920307, 55.69, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1178, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.79, 68.09, 1.416, 6.33, '2026-01-16 11:18:35', '0', 116.403193, 39.905827, 51.69, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1179, 'DEVICE_FIELD_001_001', 'FIELD_001', 33.11, 72.43, 0.891, 7.20, '2026-01-16 10:18:35', '0', 116.380824, 39.896970, 50.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1180, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.56, 59.35, 1.310, 6.20, '2026-01-16 09:18:35', '0', 116.384327, 39.908770, 26.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1181, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.75, 56.38, 1.005, 6.83, '2026-01-16 08:18:35', '0', 116.400639, 39.898121, 44.96, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1182, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.07, 62.83, 1.435, 7.18, '2026-01-16 07:18:35', '0', 116.386964, 39.927517, 37.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1183, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.97, 60.23, 1.074, 6.36, '2026-01-16 06:18:35', '0', 116.398158, 39.896484, 25.56, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1184, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.98, 59.85, 1.219, 7.36, '2026-01-16 05:18:35', '0', 116.390328, 39.914628, 60.28, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1185, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.82, 59.50, 1.955, 6.65, '2026-01-16 04:18:35', '0', 116.408724, 39.921368, 55.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1186, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.84, 60.11, 1.284, 6.40, '2026-01-16 03:18:35', '0', 116.398275, 39.903230, 60.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1187, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.08, 61.49, 0.790, 6.23, '2026-01-16 02:18:35', '0', 116.407148, 39.925512, 41.41, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1188, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.76, 50.99, 1.114, 7.00, '2026-01-16 01:18:35', '0', 116.409478, 39.912842, 40.78, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1189, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.17, 56.13, 1.340, 6.68, '2026-01-16 00:18:35', '0', 116.392089, 39.894117, 54.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1190, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.29, 57.44, 1.374, 6.12, '2026-01-15 23:18:35', '0', 116.406068, 39.905442, 51.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1191, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.63, 55.63, 0.918, 5.96, '2026-01-15 22:18:35', '0', 116.388258, 39.907914, 39.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1192, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.30, 52.00, 1.545, 7.05, '2026-01-15 21:18:35', '0', 116.400466, 39.918577, 29.00, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1193, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.89, 48.30, 1.570, 6.82, '2026-01-15 20:18:35', '0', 116.412324, 39.907319, 40.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1194, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.30, 58.16, 1.463, 5.63, '2026-01-15 19:18:35', '0', 116.388211, 39.906342, 41.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1195, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.98, 48.21, 0.750, 5.94, '2026-01-15 18:18:35', '0', 116.397446, 39.924228, 46.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1196, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.59, 38.38, 1.420, 6.59, '2026-01-15 17:18:35', '0', 116.409709, 39.907089, 40.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1197, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.86, 45.62, 1.192, 6.70, '2026-01-15 16:18:35', '0', 116.395759, 39.898082, 41.11, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1198, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.73, 48.70, 1.297, 6.77, '2026-01-15 15:18:35', '0', 116.391151, 39.903564, 33.15, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1199, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.80, 51.53, 1.372, 5.88, '2026-01-15 14:18:35', '0', 116.391595, 39.905075, 43.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1200, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.06, 49.47, 1.282, 7.49, '2026-01-15 13:18:35', '0', 116.408402, 39.939025, 51.21, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1201, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.76, 56.93, 1.144, 6.61, '2026-01-15 12:18:35', '0', 116.404999, 39.915829, 48.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1202, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.38, 45.88, 0.858, 6.21, '2026-01-15 11:18:35', '0', 116.419727, 39.920109, 57.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1203, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.30, 47.20, 1.645, 7.11, '2026-01-15 10:18:35', '0', 116.386717, 39.928209, 49.35, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1204, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.62, 45.84, 1.074, 6.92, '2026-01-15 09:18:35', '0', 116.412307, 39.904556, 60.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1205, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.83, 44.07, 1.268, 5.85, '2026-01-15 08:18:35', '0', 116.387252, 39.913502, 51.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1206, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.77, 45.22, 1.111, 7.75, '2026-01-15 07:18:35', '0', 116.387167, 39.895221, 28.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1207, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.48, 40.75, 1.132, 5.84, '2026-01-15 06:18:35', '0', 116.390254, 39.922466, 46.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1208, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.02, 46.57, 0.945, 6.81, '2026-01-15 05:18:35', '0', 116.400556, 39.917359, 34.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1209, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.08, 42.68, 1.350, 6.04, '2026-01-15 04:18:35', '0', 116.410789, 39.907519, 43.85, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1210, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.79, 31.75, 1.586, 6.72, '2026-01-15 03:18:35', '0', 116.397435, 39.922735, 57.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1211, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.41, 48.91, 1.504, 6.85, '2026-01-15 02:18:35', '0', 116.393390, 39.906147, 43.37, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1212, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.20, 39.07, 0.642, 7.08, '2026-01-15 01:18:35', '0', 116.404284, 39.909036, 52.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1213, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.78, 32.56, 1.300, 6.15, '2026-01-15 00:18:35', '0', 116.386681, 39.928997, 54.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1214, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.89, 49.64, 0.846, 6.72, '2026-01-14 23:18:35', '0', 116.403197, 39.927268, 44.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1215, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.02, 44.87, 1.133, 6.73, '2026-01-14 22:18:35', '0', 116.400090, 39.912976, 58.18, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1216, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.44, 38.96, 1.341, 7.56, '2026-01-14 21:18:35', '0', 116.401994, 39.917010, 51.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1217, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.54, 46.35, 1.385, 5.84, '2026-01-14 20:18:35', '0', 116.386601, 39.891410, 53.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1218, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.19, 41.06, 1.318, 6.94, '2026-01-14 19:18:35', '0', 116.396671, 39.906613, 51.56, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1219, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.27, 38.21, 1.449, 6.34, '2026-01-14 18:18:35', '0', 116.397643, 39.924866, 61.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1220, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.89, 33.30, 1.232, 6.56, '2026-01-14 17:18:35', '0', 116.390016, 39.913541, 39.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1221, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.65, 35.79, 1.174, 6.73, '2026-01-14 16:18:35', '0', 116.383317, 39.909650, 51.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1222, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.93, 44.73, 0.795, 7.24, '2026-01-14 15:18:35', '0', 116.403818, 39.913127, 65.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1223, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.63, 46.52, 1.166, 7.28, '2026-01-14 14:18:35', '0', 116.411504, 39.920168, 51.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1224, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.53, 39.68, 1.845, 6.37, '2026-01-14 13:18:35', '0', 116.407630, 39.908477, 37.40, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1225, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.85, 42.95, 1.153, 6.27, '2026-01-14 12:18:35', '0', 116.396326, 39.910835, 22.01, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1226, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.53, 37.44, 1.261, 7.04, '2026-01-14 11:18:35', '0', 116.385487, 39.897578, 48.00, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1227, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.74, 31.02, 1.051, 7.54, '2026-01-14 10:18:35', '0', 116.390691, 39.901988, 51.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1228, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.27, 46.13, 0.896, 6.97, '2026-01-14 09:18:35', '0', 116.408731, 39.912410, 58.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1229, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.30, 34.29, 0.913, 7.04, '2026-01-14 08:18:35', '0', 116.410297, 39.894808, 54.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1230, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.38, 44.94, 1.142, 6.99, '2026-01-14 07:18:35', '0', 116.395030, 39.905739, 43.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1231, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.14, 35.08, 1.447, 6.28, '2026-01-14 06:18:35', '0', 116.395984, 39.910785, 35.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1232, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.38, 42.18, 1.024, 5.87, '2026-01-14 05:18:35', '0', 116.397804, 39.886909, 48.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1233, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.47, 35.93, 1.375, 6.42, '2026-01-14 04:18:35', '0', 116.396668, 39.923749, 51.32, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1234, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.55, 43.76, 1.656, 6.59, '2026-01-14 03:18:35', '0', 116.389679, 39.909881, 54.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1235, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.62, 36.37, 1.249, 6.58, '2026-01-14 02:18:35', '0', 116.389681, 39.906187, 68.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1236, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.85, 35.77, 1.226, 5.99, '2026-01-14 01:18:35', '0', 116.393462, 39.914045, 53.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1237, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.12, 48.77, 1.056, 5.99, '2026-01-14 00:18:35', '0', 116.402089, 39.905225, 49.82, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1238, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.82, 48.96, 0.904, 6.15, '2026-01-13 23:18:35', '0', 116.410634, 39.917549, 42.40, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1239, 'DEVICE_FIELD_001_001', 'FIELD_001', 6.10, 44.91, 1.381, 6.93, '2026-01-13 22:18:35', '0', 116.399909, 39.893595, 52.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1240, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.63, 43.92, 1.320, 6.13, '2026-01-13 21:18:35', '0', 116.386502, 39.903370, 54.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1241, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.54, 35.37, 1.101, 6.21, '2026-01-13 20:18:35', '0', 116.388471, 39.920704, 49.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1242, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.09, 43.56, 0.923, 6.69, '2026-01-13 19:18:35', '0', 116.386397, 39.915564, 54.21, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1243, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.37, 37.28, 0.782, 6.84, '2026-01-13 18:18:35', '0', 116.399104, 39.893154, 66.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1244, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.64, 40.52, 1.484, 6.34, '2026-01-13 17:18:35', '0', 116.373537, 39.921348, 54.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1245, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.63, 41.90, 0.247, 6.01, '2026-01-13 16:18:35', '0', 116.385157, 39.924138, 65.08, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1246, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.06, 37.16, 0.872, 6.02, '2026-01-13 15:18:35', '0', 116.391648, 39.916605, 30.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1247, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.71, 55.11, 0.814, 6.36, '2026-01-13 14:18:35', '0', 116.397574, 39.901306, 52.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1248, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.69, 50.80, 1.206, 6.93, '2026-01-13 13:18:35', '0', 116.400751, 39.908061, 37.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1249, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.56, 52.00, 1.406, 7.53, '2026-01-13 12:18:35', '0', 116.405952, 39.917135, 51.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1250, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.30, 48.63, 1.136, 7.04, '2026-01-13 11:18:35', '0', 116.391691, 39.885589, 45.62, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1251, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.22, 45.35, 1.458, 6.27, '2026-01-13 10:18:35', '0', 116.402111, 39.910338, 46.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1252, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.25, 56.34, 1.170, 6.18, '2026-01-13 09:18:35', '0', 116.385969, 39.890690, 51.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1253, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.65, 51.35, 0.904, 5.93, '2026-01-13 08:18:35', '0', 116.408480, 39.912762, 49.25, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1254, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.19, 53.53, 1.489, 6.82, '2026-01-13 07:18:35', '0', 116.412573, 39.900805, 63.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1255, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.08, 47.35, 1.255, 5.82, '2026-01-13 06:18:35', '0', 116.395189, 39.907489, 56.25, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1256, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.25, 45.01, 0.744, 7.51, '2026-01-13 05:18:35', '0', 116.391025, 39.904372, 51.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1257, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.49, 57.23, 1.669, 6.46, '2026-01-13 04:18:35', '0', 116.396257, 39.921007, 55.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1258, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.62, 54.72, 1.466, 6.43, '2026-01-13 03:18:35', '0', 116.403286, 39.881274, 55.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1259, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.97, 55.85, 1.405, 6.04, '2026-01-13 02:18:35', '0', 116.389132, 39.919860, 25.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1260, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.79, 52.80, 1.382, 7.02, '2026-01-13 01:18:35', '0', 116.399380, 39.913574, 35.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1261, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.05, 48.04, 1.399, 6.78, '2026-01-13 00:18:35', '0', 116.381499, 39.922695, 43.39, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1262, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.62, 56.86, 1.347, 7.47, '2026-01-12 23:18:35', '0', 116.379267, 39.923975, 56.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1263, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.30, 53.49, 0.695, 6.11, '2026-01-12 22:18:35', '0', 116.408926, 39.908681, 44.42, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1264, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.01, 61.03, 0.974, 6.37, '2026-01-12 21:18:35', '0', 116.380271, 39.919705, 56.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1265, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.77, 63.09, 1.156, 6.43, '2026-01-12 20:18:35', '0', 116.390445, 39.906572, 44.91, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1266, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.11, 59.19, 1.570, 6.07, '2026-01-12 19:18:35', '0', 116.385360, 39.912910, 35.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1267, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.02, 55.99, 1.033, 6.32, '2026-01-12 18:18:35', '0', 116.387437, 39.913706, 44.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1268, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.47, 67.47, 1.179, 6.44, '2026-01-12 17:18:35', '0', 116.387047, 39.911026, 59.94, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1269, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.80, 63.57, 0.727, 7.04, '2026-01-12 16:18:35', '0', 116.386379, 39.914309, 26.69, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1270, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.53, 62.46, 1.224, 5.75, '2026-01-12 15:18:35', '0', 116.393674, 39.917514, 47.45, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1271, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.14, 66.83, 1.164, 6.71, '2026-01-12 14:18:35', '0', 116.404191, 39.920491, 64.10, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1272, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.03, 64.45, 1.252, 6.91, '2026-01-12 13:18:35', '0', 116.392461, 39.900092, 58.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1273, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.30, 49.52, 0.778, 6.82, '2026-01-12 12:18:35', '0', 116.397980, 39.905232, 68.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1274, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.82, 59.62, 1.167, 6.73, '2026-01-12 11:18:35', '0', 116.389539, 39.901760, 47.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1275, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.23, 65.50, 1.108, 6.44, '2026-01-12 10:18:35', '0', 116.406895, 39.902860, 62.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1276, 'DEVICE_FIELD_001_001', 'FIELD_001', 33.99, 67.05, 0.591, 5.83, '2026-01-12 09:18:35', '0', 116.407852, 39.911421, 47.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1277, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.46, 64.66, 0.587, 7.25, '2026-01-12 08:18:35', '0', 116.410579, 39.909681, 55.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1278, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.76, 62.29, 0.788, 7.11, '2026-01-12 07:18:35', '0', 116.386308, 39.895016, 36.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1279, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.00, 70.52, 1.253, 6.97, '2026-01-12 06:18:35', '0', 116.395949, 39.917511, 35.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1280, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.94, 61.02, 1.076, 6.47, '2026-01-12 05:18:35', '0', 116.404508, 39.902790, 60.36, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1281, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.22, 72.47, 1.340, 5.95, '2026-01-12 04:18:35', '0', 116.409431, 39.921434, 64.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1282, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.10, 69.75, 0.600, 6.33, '2026-01-12 03:18:35', '0', 116.383272, 39.921683, 38.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1283, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.64, 65.06, 1.308, 6.45, '2026-01-12 02:18:35', '0', 116.383793, 39.898775, 50.21, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1284, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.70, 76.02, 0.904, 6.64, '2026-01-12 01:18:35', '0', 116.400062, 39.922102, 56.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1285, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.89, 78.20, 1.060, 6.73, '2026-01-12 00:18:35', '0', 116.383248, 39.904780, 56.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1286, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.39, 78.75, 1.051, 6.31, '2026-01-11 23:18:35', '0', 116.406228, 39.900839, 52.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1287, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.33, 71.26, 0.971, 6.74, '2026-01-11 22:18:35', '0', 116.410061, 39.897726, 40.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1288, 'DEVICE_FIELD_001_001', 'FIELD_001', 6.98, 69.46, 1.017, 5.91, '2026-01-11 21:18:35', '0', 116.400396, 39.921052, 44.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1289, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.22, 75.28, 1.857, 5.75, '2026-01-11 20:18:35', '0', 116.394537, 39.896922, 51.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1290, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.34, 79.70, 1.546, 6.04, '2026-01-11 19:18:35', '0', 116.399252, 39.905322, 30.11, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1291, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.10, 75.39, 1.347, 6.96, '2026-01-11 18:18:35', '0', 116.392291, 39.915693, 59.82, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1292, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.15, 75.03, 0.592, 6.92, '2026-01-11 17:18:35', '0', 116.380667, 39.914717, 45.41, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1293, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.77, 72.60, 1.189, 6.50, '2026-01-11 16:18:35', '0', 116.398347, 39.909030, 39.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1294, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.61, 79.47, 1.827, 6.80, '2026-01-11 15:18:35', '0', 116.387479, 39.918992, 56.37, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1295, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.61, 83.33, 1.417, 6.21, '2026-01-11 14:18:35', '0', 116.398416, 39.910234, 47.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1296, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.55, 76.99, 1.560, 6.06, '2026-01-11 13:18:35', '0', 116.391679, 39.918477, 48.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1297, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.33, 78.61, 1.227, 6.19, '2026-01-11 12:18:35', '0', 116.399584, 39.905206, 45.15, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1298, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.12, 81.64, 1.332, 6.96, '2026-01-11 11:18:35', '0', 116.382936, 39.928270, 54.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1299, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.14, 76.12, 0.726, 6.25, '2026-01-11 10:18:35', '0', 116.386055, 39.926431, 56.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1300, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.00, 78.11, 0.964, 6.02, '2026-01-11 09:18:35', '0', 116.379223, 39.905135, 61.58, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1301, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.27, 78.90, 0.881, 6.59, '2026-01-11 08:18:35', '0', 116.420581, 39.905628, 47.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1302, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.18, 78.79, 1.638, 7.01, '2026-01-11 07:18:35', '0', 116.381736, 39.912832, 61.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1303, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.28, 75.27, 0.605, 7.29, '2026-01-11 06:18:35', '0', 116.381846, 39.902951, 61.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1304, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.73, 81.83, 1.416, 6.98, '2026-01-11 05:18:35', '0', 116.407471, 39.906308, 66.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1305, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.28, 86.20, 1.588, 6.20, '2026-01-11 04:18:35', '0', 116.397174, 39.898125, 56.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1306, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.99, 82.00, 1.481, 6.90, '2026-01-11 03:18:35', '0', 116.387782, 39.894993, 52.60, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1307, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.43, 86.38, 1.369, 6.21, '2026-01-11 02:18:35', '0', 116.401419, 39.898848, 20.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1308, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.80, 87.44, 1.127, 6.82, '2026-01-11 01:18:35', '0', 116.397329, 39.907306, 60.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1309, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.45, 81.85, 0.942, 5.86, '2026-01-11 00:18:35', '0', 116.404241, 39.908591, 56.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1310, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.45, 78.76, 1.434, 6.05, '2026-01-10 23:18:35', '0', 116.391293, 39.905839, 47.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1311, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.50, 88.05, 1.342, 6.37, '2026-01-10 22:18:35', '0', 116.391673, 39.914916, 63.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1312, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.63, 81.49, 1.309, 7.16, '2026-01-10 21:18:35', '0', 116.398222, 39.904998, 34.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1313, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.72, 79.58, 1.371, 7.46, '2026-01-10 20:18:35', '0', 116.393518, 39.906179, 50.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1314, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.57, 84.40, 1.054, 6.36, '2026-01-10 19:18:35', '0', 116.397357, 39.919316, 46.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1315, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.90, 83.46, 1.180, 5.95, '2026-01-10 18:18:35', '0', 116.378729, 39.907103, 46.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1316, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.49, 73.38, 0.926, 6.28, '2026-01-10 17:18:35', '0', 116.418516, 39.915650, 42.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1317, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.92, 81.07, 1.299, 6.08, '2026-01-10 16:18:35', '0', 116.385197, 39.914403, 37.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1318, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.56, 81.31, 1.429, 5.99, '2026-01-10 15:18:35', '0', 116.404704, 39.901771, 58.30, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1319, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.65, 83.83, 1.417, 5.61, '2026-01-10 14:18:35', '0', 116.411568, 39.905739, 65.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1320, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.48, 89.93, 1.131, 6.10, '2026-01-10 13:18:35', '0', 116.395722, 39.931681, 32.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1321, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.35, 78.88, 1.296, 7.04, '2026-01-10 12:18:35', '0', 116.394303, 39.919161, 53.94, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1322, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.74, 71.21, 1.141, 6.08, '2026-01-10 11:18:35', '0', 116.392357, 39.897482, 61.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1323, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.72, 77.70, 1.266, 6.89, '2026-01-10 10:18:35', '0', 116.387233, 39.899722, 45.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1324, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.80, 74.15, 1.392, 6.17, '2026-01-10 09:18:35', '0', 116.385088, 39.905545, 55.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1325, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.44, 76.91, 0.935, 6.77, '2026-01-10 08:18:35', '0', 116.388495, 39.919794, 63.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1326, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.13, 79.24, 0.870, 6.84, '2026-01-10 07:18:35', '0', 116.396039, 39.898077, 46.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1327, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.14, 78.41, 1.592, 6.25, '2026-01-10 06:18:35', '0', 116.392770, 39.916876, 50.37, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1328, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.45, 78.32, 0.992, 6.23, '2026-01-10 05:18:35', '0', 116.391880, 39.906513, 34.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1329, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.97, 71.58, 1.609, 6.44, '2026-01-10 04:18:35', '0', 116.388597, 39.917223, 40.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1330, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.99, 71.17, 0.854, 6.91, '2026-01-10 03:18:35', '0', 116.398846, 39.899652, 66.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1331, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.15, 73.74, 1.218, 7.17, '2026-01-10 02:18:35', '0', 116.408516, 39.924811, 55.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1332, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.17, 70.22, 0.929, 7.19, '2026-01-10 01:18:35', '0', 116.403109, 39.893420, 53.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1333, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.33, 73.29, 1.352, 6.35, '2026-01-10 00:18:35', '0', 116.406759, 39.912713, 53.60, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1334, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.58, 72.52, 0.711, 5.45, '2026-01-09 23:18:35', '0', 116.392612, 39.904617, 46.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1335, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.55, 63.79, 1.175, 6.99, '2026-01-09 22:18:35', '0', 116.419185, 39.888244, 57.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1336, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.18, 72.79, 1.493, 6.31, '2026-01-09 21:18:35', '0', 116.394975, 39.915096, 50.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1337, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.06, 77.75, 1.001, 7.48, '2026-01-09 20:18:35', '0', 116.395206, 39.904612, 56.25, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1338, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.42, 63.49, 1.110, 5.92, '2026-01-09 19:18:35', '0', 116.409934, 39.928787, 43.78, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1339, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.80, 80.23, 1.162, 7.30, '2026-01-09 18:18:35', '0', 116.408859, 39.909174, 64.63, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1340, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.28, 66.74, 0.708, 6.28, '2026-01-09 17:18:35', '0', 116.401792, 39.921254, 34.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1341, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.75, 64.16, 1.483, 6.38, '2026-01-09 16:18:35', '0', 116.390485, 39.905191, 57.21, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1342, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.44, 77.99, 1.106, 6.07, '2026-01-09 15:18:35', '0', 116.393651, 39.900381, 51.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1343, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.02, 68.44, 0.437, 6.90, '2026-01-09 14:18:35', '0', 116.401209, 39.890924, 40.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1344, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.94, 66.57, 1.091, 6.92, '2026-01-09 13:18:35', '0', 116.390409, 39.916658, 61.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1345, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.90, 72.97, 1.512, 6.43, '2026-01-09 12:18:35', '0', 116.393628, 39.909791, 55.62, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1346, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.52, 61.69, 1.242, 6.28, '2026-01-09 11:18:35', '0', 116.397510, 39.921560, 41.60, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1347, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.77, 67.27, 1.675, 5.67, '2026-01-09 10:18:35', '0', 116.399163, 39.908237, 34.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1348, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.26, 63.91, 1.019, 5.93, '2026-01-09 09:18:35', '0', 116.405881, 39.917617, 38.40, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1349, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.33, 61.07, 1.034, 6.77, '2026-01-09 08:18:35', '0', 116.401687, 39.908130, 56.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1350, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.29, 55.56, 1.328, 6.83, '2026-01-09 07:18:35', '0', 116.390335, 39.894041, 55.30, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1351, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.54, 68.77, 0.593, 6.66, '2026-01-09 06:18:35', '0', 116.372507, 39.912212, 58.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1352, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.15, 61.67, 1.279, 6.45, '2026-01-09 05:18:35', '0', 116.414894, 39.918210, 71.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1353, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.83, 56.09, 1.446, 6.85, '2026-01-09 04:18:35', '0', 116.403762, 39.905923, 46.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1354, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.52, 55.29, 1.054, 6.54, '2026-01-09 03:18:35', '0', 116.404658, 39.894257, 59.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1355, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.12, 62.15, 1.075, 6.89, '2026-01-09 02:18:35', '0', 116.383547, 39.885461, 54.60, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1356, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.02, 53.15, 1.434, 6.28, '2026-01-09 01:18:35', '0', 116.386162, 39.908785, 50.36, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1357, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.46, 58.26, 1.202, 7.25, '2026-01-09 00:18:35', '0', 116.402413, 39.910598, 51.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1358, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.98, 50.80, 0.979, 6.63, '2026-01-08 23:18:35', '0', 116.398968, 39.913557, 49.41, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1359, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.30, 52.70, 1.238, 6.11, '2026-01-08 22:18:35', '0', 116.395593, 39.906716, 55.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1360, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.62, 52.70, 1.327, 6.74, '2026-01-08 21:18:35', '0', 116.394742, 39.890911, 45.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1361, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.03, 52.04, 1.074, 5.79, '2026-01-08 20:18:35', '0', 116.378468, 39.920331, 52.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1362, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.46, 50.50, 1.026, 5.46, '2026-01-08 19:18:35', '0', 116.386681, 39.909002, 37.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1363, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.03, 47.95, 1.089, 7.58, '2026-01-08 18:18:35', '0', 116.401880, 39.908954, 48.18, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1364, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.44, 52.93, 1.214, 6.21, '2026-01-08 17:18:35', '0', 116.404589, 39.903941, 56.62, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1365, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.07, 50.19, 1.632, 7.86, '2026-01-08 16:18:35', '0', 116.394943, 39.910558, 58.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1366, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.18, 57.23, 1.096, 6.75, '2026-01-08 15:18:35', '0', 116.393374, 39.911550, 55.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1367, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.20, 51.09, 1.086, 6.12, '2026-01-08 14:18:35', '0', 116.388829, 39.884043, 48.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1368, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.08, 51.14, 0.793, 6.76, '2026-01-08 13:18:35', '0', 116.378677, 39.916569, 34.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1369, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.49, 51.35, 1.193, 5.87, '2026-01-08 12:18:35', '0', 116.398337, 39.906626, 28.96, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1370, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.90, 48.00, 1.278, 6.88, '2026-01-08 11:18:35', '0', 116.401902, 39.921247, 58.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1371, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.44, 47.38, 1.036, 6.86, '2026-01-08 10:18:35', '0', 116.401941, 39.922302, 55.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1372, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.54, 49.64, 1.760, 6.44, '2026-01-08 09:18:35', '0', 116.386837, 39.914320, 39.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1373, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.85, 50.62, 1.388, 6.36, '2026-01-08 08:18:35', '0', 116.388441, 39.926019, 23.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1374, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.96, 47.86, 0.969, 5.97, '2026-01-08 07:18:35', '0', 116.411308, 39.918340, 43.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1375, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.81, 38.68, 1.493, 6.47, '2026-01-08 06:18:35', '0', 116.399135, 39.904340, 66.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1376, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.97, 44.69, 1.688, 5.73, '2026-01-08 05:18:35', '0', 116.393303, 39.923149, 56.24, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1377, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.62, 53.71, 1.388, 7.04, '2026-01-08 04:18:35', '0', 116.399356, 39.915559, 51.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1378, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.20, 46.63, 0.653, 6.19, '2026-01-08 03:18:35', '0', 116.380105, 39.906705, 57.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1379, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.87, 39.51, 0.873, 6.37, '2026-01-08 02:18:35', '0', 116.388525, 39.910139, 45.17, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1380, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.32, 47.41, 1.620, 5.81, '2026-01-08 01:18:35', '0', 116.421207, 39.920743, 60.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1381, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.82, 43.53, 1.043, 5.99, '2026-01-08 00:18:35', '0', 116.380689, 39.908369, 38.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1382, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.43, 36.01, 1.040, 6.30, '2026-01-07 23:18:35', '0', 116.370646, 39.891299, 63.28, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1383, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.30, 40.15, 1.414, 6.45, '2026-01-07 22:18:35', '0', 116.392297, 39.916760, 48.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1384, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.31, 29.12, 0.988, 7.47, '2026-01-07 21:18:35', '0', 116.387223, 39.898700, 46.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1385, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.59, 43.61, 1.108, 5.83, '2026-01-07 20:18:35', '0', 116.381803, 39.903367, 49.53, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1386, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.53, 46.64, 0.985, 6.14, '2026-01-07 19:18:35', '0', 116.388870, 39.917118, 31.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1387, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.91, 40.02, 0.604, 7.09, '2026-01-07 18:18:35', '0', 116.397972, 39.919228, 47.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1388, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.10, 41.72, 1.333, 7.34, '2026-01-07 17:18:35', '0', 116.406156, 39.906611, 54.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1389, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.67, 44.20, 1.040, 6.34, '2026-01-07 16:18:35', '0', 116.379311, 39.905654, 61.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1390, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.56, 29.51, 1.387, 6.75, '2026-01-07 15:18:35', '0', 116.394491, 39.918470, 59.60, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1391, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.58, 40.01, 1.013, 5.82, '2026-01-07 14:18:35', '0', 116.386730, 39.903809, 61.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1392, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.57, 32.17, 1.620, 7.03, '2026-01-07 13:18:35', '0', 116.394065, 39.896700, 51.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1393, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.13, 37.88, 1.672, 6.73, '2026-01-07 12:18:35', '0', 116.398929, 39.910270, 29.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1394, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.19, 41.72, 1.412, 5.51, '2026-01-07 11:18:35', '0', 116.388170, 39.904174, 57.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1395, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.68, 36.52, 0.868, 6.15, '2026-01-07 10:18:35', '0', 116.397314, 39.914028, 49.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1396, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.65, 44.95, 1.221, 6.72, '2026-01-07 09:18:35', '0', 116.404213, 39.903870, 36.91, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1397, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.00, 39.92, 0.817, 7.19, '2026-01-07 08:18:35', '0', 116.391810, 39.908995, 35.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1398, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.37, 39.34, 1.291, 5.64, '2026-01-07 07:18:35', '0', 116.384107, 39.900720, 33.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1399, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.05, 43.96, 1.244, 5.43, '2026-01-07 06:18:35', '0', 116.404337, 39.902512, 33.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1400, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.77, 35.71, 0.891, 5.87, '2026-01-07 05:18:35', '0', 116.411688, 39.914034, 64.39, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1401, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.62, 40.01, 1.160, 7.33, '2026-01-07 04:18:35', '0', 116.377207, 39.904469, 37.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1402, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.12, 33.99, 0.858, 7.16, '2026-01-07 03:18:35', '0', 116.391336, 39.900070, 49.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1403, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.58, 38.65, 1.003, 7.03, '2026-01-07 02:18:35', '0', 116.409116, 39.913506, 52.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1404, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.84, 53.36, 0.841, 7.12, '2026-01-07 01:18:35', '0', 116.390884, 39.887568, 46.35, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1405, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.44, 39.63, 0.841, 5.71, '2026-01-07 00:18:35', '0', 116.408850, 39.901988, 68.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1406, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.35, 36.57, 1.357, 6.77, '2026-01-06 23:18:35', '0', 116.395097, 39.893189, 42.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1407, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.82, 37.06, 0.683, 6.36, '2026-01-06 22:18:35', '0', 116.395044, 39.921987, 43.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1408, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.93, 45.73, 1.374, 6.80, '2026-01-06 21:18:35', '0', 116.386476, 39.900137, 49.32, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1409, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.80, 43.99, 1.096, 6.98, '2026-01-06 20:18:35', '0', 116.395378, 39.913661, 39.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1410, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.57, 39.21, 0.634, 6.17, '2026-01-06 19:18:35', '0', 116.393521, 39.899823, 70.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1411, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.56, 44.85, 1.034, 6.28, '2026-01-06 18:18:35', '0', 116.415800, 39.919249, 67.14, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1412, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.21, 42.40, 1.043, 5.82, '2026-01-06 17:18:35', '0', 116.397317, 39.915350, 58.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1413, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.76, 44.88, 1.363, 6.72, '2026-01-06 16:18:35', '0', 116.395400, 39.902161, 64.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1414, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.60, 50.02, 1.447, 6.79, '2026-01-06 15:18:35', '0', 116.397352, 39.926285, 66.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1415, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.89, 47.13, 0.736, 6.08, '2026-01-06 14:18:35', '0', 116.399932, 39.903588, 60.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1416, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.65, 41.46, 0.817, 6.57, '2026-01-06 13:18:35', '0', 116.407259, 39.913119, 69.17, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1417, 'DEVICE_FIELD_001_001', 'FIELD_001', 33.14, 41.17, 1.690, 6.93, '2026-01-06 12:18:35', '0', 116.391579, 39.903809, 50.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1418, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.12, 48.82, 1.305, 7.16, '2026-01-06 11:18:35', '0', 116.412219, 39.918045, 35.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1419, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.62, 47.27, 1.570, 6.31, '2026-01-06 10:18:35', '0', 116.377434, 39.900229, 41.76, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1420, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.83, 43.51, 1.643, 7.09, '2026-01-06 09:18:35', '0', 116.421111, 39.909199, 64.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1421, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.97, 46.00, 1.265, 6.54, '2026-01-06 08:18:35', '0', 116.385876, 39.911297, 49.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1422, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.65, 41.04, 0.677, 6.38, '2026-01-06 07:18:35', '0', 116.401387, 39.900199, 50.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1423, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.21, 56.20, 1.247, 6.53, '2026-01-06 06:18:35', '0', 116.383268, 39.897975, 79.36, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1424, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.58, 45.15, 0.552, 7.46, '2026-01-06 05:18:35', '0', 116.382630, 39.903086, 54.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1425, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.82, 51.11, 1.167, 6.52, '2026-01-06 04:18:35', '0', 116.419944, 39.911759, 65.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1426, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.63, 48.79, 1.964, 6.41, '2026-01-06 03:18:35', '0', 116.384442, 39.912960, 67.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1427, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.36, 56.71, 0.862, 6.51, '2026-01-06 02:18:35', '0', 116.398071, 39.913681, 34.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1428, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.11, 49.08, 1.417, 6.69, '2026-01-06 01:18:35', '0', 116.403510, 39.918440, 61.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1429, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.70, 50.92, 1.287, 6.38, '2026-01-06 00:18:35', '0', 116.389885, 39.918161, 34.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1430, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.41, 56.26, 1.368, 6.90, '2026-01-05 23:18:35', '0', 116.401659, 39.914909, 49.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1431, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.98, 55.46, 0.686, 6.81, '2026-01-05 22:18:35', '0', 116.407732, 39.915758, 46.24, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1432, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.98, 46.63, 0.974, 6.62, '2026-01-05 21:18:35', '0', 116.387302, 39.921179, 45.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1433, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.67, 51.05, 1.180, 6.53, '2026-01-05 20:18:35', '0', 116.393389, 39.907908, 28.35, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1434, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.49, 63.36, 2.050, 6.17, '2026-01-05 19:18:35', '0', 116.399639, 39.906619, 49.30, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1435, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.37, 61.04, 1.792, 6.45, '2026-01-05 18:18:35', '0', 116.417969, 39.923326, 51.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1436, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.66, 61.20, 1.579, 6.49, '2026-01-05 17:18:35', '0', 116.398105, 39.920796, 22.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1437, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.24, 55.56, 0.990, 6.81, '2026-01-05 16:18:35', '0', 116.396316, 39.895364, 56.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1438, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.78, 48.90, 1.315, 6.85, '2026-01-05 15:18:35', '0', 116.383830, 39.904811, 45.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1439, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.75, 57.30, 0.925, 5.91, '2026-01-05 14:18:35', '0', 116.416378, 39.890478, 24.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1440, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.44, 56.51, 1.440, 6.41, '2026-01-05 13:18:35', '0', 116.395648, 39.902764, 57.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1441, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.38, 62.61, 0.848, 7.00, '2026-01-05 12:18:35', '0', 116.394841, 39.907573, 48.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1442, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.54, 55.25, 0.874, 5.91, '2026-01-05 11:18:35', '0', 116.390513, 39.909913, 50.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1443, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.46, 58.84, 1.370, 7.58, '2026-01-05 10:18:35', '0', 116.396436, 39.907959, 39.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1444, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.90, 66.38, 1.055, 7.09, '2026-01-05 09:18:35', '0', 116.392945, 39.907210, 42.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1445, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.18, 66.03, 1.091, 6.18, '2026-01-05 08:18:35', '0', 116.375921, 39.904837, 65.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1446, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.12, 59.09, 1.239, 5.44, '2026-01-05 07:18:35', '0', 116.403683, 39.919599, 64.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1447, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.11, 67.73, 0.986, 5.76, '2026-01-05 06:18:35', '0', 116.385446, 39.914793, 56.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1448, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.70, 66.17, 0.967, 6.98, '2026-01-05 05:18:35', '0', 116.400803, 39.912863, 59.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1449, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.21, 72.51, 1.231, 6.65, '2026-01-05 04:18:35', '0', 116.401123, 39.885005, 48.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1450, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.98, 71.93, 1.214, 6.95, '2026-01-05 03:18:35', '0', 116.397691, 39.916319, 36.36, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1451, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.51, 76.71, 1.124, 7.14, '2026-01-05 02:18:35', '0', 116.391850, 39.925798, 56.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1452, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.01, 66.25, 0.874, 6.08, '2026-01-05 01:18:35', '0', 116.388021, 39.920253, 65.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1453, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.59, 70.92, 0.999, 7.18, '2026-01-05 00:18:35', '0', 116.385836, 39.911973, 58.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1454, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.95, 76.68, 1.839, 6.01, '2026-01-04 23:18:35', '0', 116.391779, 39.921333, 49.91, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1455, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.16, 83.47, 1.500, 5.71, '2026-01-04 22:18:35', '0', 116.384864, 39.932498, 48.00, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1456, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.50, 70.32, 1.248, 6.52, '2026-01-04 21:18:35', '0', 116.390333, 39.888012, 36.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1457, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.69, 73.80, 0.643, 6.00, '2026-01-04 20:18:35', '0', 116.396735, 39.900962, 59.96, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1458, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.02, 78.02, 1.021, 6.38, '2026-01-04 19:18:35', '0', 116.396345, 39.918848, 42.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1459, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.25, 74.17, 0.854, 6.71, '2026-01-04 18:18:35', '0', 116.392350, 39.899616, 65.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1460, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.36, 73.70, 1.313, 6.86, '2026-01-04 17:18:35', '0', 116.398186, 39.906550, 44.01, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1461, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.73, 79.76, 1.596, 6.11, '2026-01-04 16:18:35', '0', 116.412772, 39.904408, 47.53, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1462, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.94, 79.48, 1.292, 6.32, '2026-01-04 15:18:35', '0', 116.377456, 39.904457, 54.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1463, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.49, 67.17, 1.213, 7.20, '2026-01-04 14:18:35', '0', 116.392580, 39.906145, 54.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1464, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.89, 75.29, 1.090, 6.59, '2026-01-04 13:18:35', '0', 116.412494, 39.917078, 57.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1465, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.09, 76.34, 0.872, 6.46, '2026-01-04 12:18:35', '0', 116.408847, 39.904619, 59.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1466, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.80, 82.81, 1.187, 6.36, '2026-01-04 11:18:35', '0', 116.420244, 39.899894, 48.39, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1467, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.23, 77.78, 1.844, 6.92, '2026-01-04 10:18:35', '0', 116.394873, 39.912929, 49.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1468, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.63, 82.55, 1.333, 6.67, '2026-01-04 09:18:35', '0', 116.397731, 39.890891, 55.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1469, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.33, 76.72, 1.732, 6.16, '2026-01-04 08:18:35', '0', 116.393347, 39.922246, 57.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1470, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.13, 73.04, 1.663, 6.58, '2026-01-04 07:18:35', '0', 116.410834, 39.918079, 67.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1471, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.23, 84.59, 1.104, 6.56, '2026-01-04 06:18:35', '0', 116.405412, 39.921744, 31.91, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1472, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.77, 75.37, 1.176, 6.45, '2026-01-04 05:18:35', '0', 116.405449, 39.911150, 40.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1473, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.60, 90.24, 1.072, 6.20, '2026-01-04 04:18:35', '0', 116.399507, 39.896917, 52.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1474, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.38, 87.86, 1.176, 6.97, '2026-01-04 03:18:35', '0', 116.376464, 39.914416, 44.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1475, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.28, 79.80, 1.886, 6.71, '2026-01-04 02:18:35', '0', 116.397952, 39.880482, 39.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1476, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.74, 72.45, 1.290, 6.33, '2026-01-04 01:18:35', '0', 116.412008, 39.907908, 39.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1477, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.92, 81.13, 1.510, 6.71, '2026-01-04 00:18:35', '0', 116.379441, 39.890919, 38.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1478, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.46, 78.05, 0.532, 6.51, '2026-01-03 23:18:35', '0', 116.403612, 39.902229, 60.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1479, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.00, 90.12, 1.315, 6.95, '2026-01-03 22:18:35', '0', 116.389467, 39.941968, 40.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1480, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.89, 81.50, 1.064, 6.65, '2026-01-03 21:18:35', '0', 116.405867, 39.920865, 60.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1481, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.55, 80.74, 0.933, 6.73, '2026-01-03 20:18:35', '0', 116.387494, 39.903264, 51.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1482, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.27, 73.90, 1.484, 6.52, '2026-01-03 19:18:35', '0', 116.390561, 39.901498, 56.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1483, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.10, 76.09, 0.805, 6.74, '2026-01-03 18:18:35', '0', 116.407957, 39.918165, 56.85, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1484, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.80, 83.72, 1.553, 6.74, '2026-01-03 17:18:35', '0', 116.399249, 39.922511, 46.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1485, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.64, 84.18, 1.237, 5.61, '2026-01-03 16:18:35', '0', 116.413076, 39.912873, 63.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1486, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.43, 81.11, 1.745, 6.63, '2026-01-03 15:18:35', '0', 116.414308, 39.918595, 47.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1487, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.06, 80.79, 1.720, 6.88, '2026-01-03 14:18:35', '0', 116.397959, 39.890172, 38.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1488, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.93, 84.27, 0.915, 6.39, '2026-01-03 13:18:35', '0', 116.382922, 39.924429, 55.08, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1489, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.87, 73.58, 1.077, 6.36, '2026-01-03 12:18:35', '0', 116.413169, 39.921059, 51.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1490, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.35, 79.06, 1.184, 6.38, '2026-01-03 11:18:35', '0', 116.406150, 39.911148, 48.62, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1491, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.29, 77.78, 0.688, 7.08, '2026-01-03 10:18:35', '0', 116.410234, 39.922227, 54.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1492, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.46, 74.25, 1.204, 5.91, '2026-01-03 09:18:35', '0', 116.387640, 39.912121, 39.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1493, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.13, 76.66, 0.871, 6.27, '2026-01-03 08:18:35', '0', 116.408711, 39.902560, 33.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1494, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.16, 75.18, 1.426, 7.04, '2026-01-03 07:18:35', '0', 116.384949, 39.918610, 43.85, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1495, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.60, 76.21, 1.458, 6.96, '2026-01-03 06:18:35', '0', 116.393567, 39.914750, 39.85, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1496, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.15, 76.14, 1.143, 6.50, '2026-01-03 05:18:35', '0', 116.391837, 39.913212, 60.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1497, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.35, 73.80, 1.297, 7.37, '2026-01-03 04:18:35', '0', 116.398987, 39.914101, 40.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1498, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.95, 73.38, 1.155, 7.05, '2026-01-03 03:18:35', '0', 116.409212, 39.903341, 54.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1499, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.54, 77.18, 0.868, 6.79, '2026-01-03 02:18:35', '0', 116.395798, 39.916545, 42.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1500, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.49, 75.30, 1.024, 6.64, '2026-01-03 01:18:35', '0', 116.407631, 39.924208, 54.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1501, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.29, 70.50, 1.410, 6.72, '2026-01-03 00:18:35', '0', 116.393104, 39.906966, 52.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1502, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.54, 67.67, 1.458, 6.92, '2026-01-02 23:18:35', '0', 116.392522, 39.912079, 39.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1503, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.85, 75.53, 1.386, 6.06, '2026-01-02 22:18:35', '0', 116.420256, 39.897983, 52.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1504, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.43, 86.44, 1.598, 7.08, '2026-01-02 21:18:35', '0', 116.387900, 39.902362, 55.58, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1505, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.99, 68.91, 0.837, 6.23, '2026-01-02 20:18:35', '0', 116.396159, 39.893246, 40.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1506, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.82, 61.19, 0.875, 7.02, '2026-01-02 19:18:35', '0', 116.390788, 39.911927, 40.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1507, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.01, 71.07, 1.343, 6.58, '2026-01-02 18:18:35', '0', 116.392282, 39.920296, 67.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1508, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.31, 63.10, 1.321, 6.03, '2026-01-02 17:18:35', '0', 116.388071, 39.897340, 44.32, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1509, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.04, 65.27, 0.609, 5.83, '2026-01-02 16:18:35', '0', 116.391809, 39.907706, 64.82, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1510, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.11, 73.81, 1.562, 7.03, '2026-01-02 15:18:35', '0', 116.389866, 39.892545, 61.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1511, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.10, 68.36, 1.171, 6.03, '2026-01-02 14:18:35', '0', 116.393645, 39.907179, 55.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1512, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.80, 72.21, 1.518, 6.53, '2026-01-02 13:18:35', '0', 116.400429, 39.896519, 52.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1513, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.33, 65.91, 1.015, 6.27, '2026-01-02 12:18:35', '0', 116.380061, 39.897538, 40.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1514, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.48, 62.72, 1.823, 7.43, '2026-01-02 11:18:35', '0', 116.397661, 39.906056, 44.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1515, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.84, 60.96, 1.099, 6.18, '2026-01-02 10:18:35', '0', 116.399400, 39.914073, 35.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1516, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.74, 63.40, 0.883, 6.86, '2026-01-02 09:18:35', '0', 116.379630, 39.914230, 50.01, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1517, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.84, 70.09, 1.237, 5.62, '2026-01-02 08:18:35', '0', 116.395206, 39.900668, 52.14, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1518, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.35, 61.78, 0.923, 6.62, '2026-01-02 07:18:35', '0', 116.388692, 39.906111, 52.85, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1519, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.53, 65.28, 1.585, 6.92, '2026-01-02 06:18:35', '0', 116.385508, 39.901861, 57.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1520, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.65, 59.44, 0.868, 6.54, '2026-01-02 05:18:35', '0', 116.389924, 39.933755, 39.25, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1521, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.17, 59.32, 1.502, 6.53, '2026-01-02 04:18:35', '0', 116.392699, 39.898563, 30.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1522, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.26, 44.58, 1.394, 6.24, '2026-01-02 03:18:35', '0', 116.403512, 39.901172, 39.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1523, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.57, 56.40, 1.508, 7.00, '2026-01-02 02:18:35', '0', 116.407307, 39.899079, 44.39, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1524, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.44, 50.23, 1.158, 7.17, '2026-01-02 01:18:35', '0', 116.386283, 39.925806, 58.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1525, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.26, 50.44, 1.400, 5.00, '2026-01-02 00:18:35', '0', 116.400612, 39.915981, 46.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1526, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.62, 45.46, 0.958, 6.33, '2026-01-01 23:18:35', '0', 116.405737, 39.892890, 42.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1527, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.32, 52.60, 0.991, 6.37, '2026-01-01 22:18:35', '0', 116.391729, 39.908162, 44.35, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1528, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.19, 58.18, 1.407, 6.67, '2026-01-01 21:18:35', '0', 116.397152, 39.926861, 40.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1529, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.75, 47.33, 1.634, 6.90, '2026-01-01 20:18:35', '0', 116.404511, 39.904704, 43.91, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1530, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.66, 44.05, 1.087, 7.65, '2026-01-01 19:18:35', '0', 116.401363, 39.916360, 58.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1531, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.30, 57.33, 1.037, 6.64, '2026-01-01 18:18:35', '0', 116.399489, 39.898605, 64.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1532, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.80, 53.17, 1.154, 6.34, '2026-01-01 17:18:35', '0', 116.414536, 39.896198, 53.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1533, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.83, 52.46, 1.169, 6.64, '2026-01-01 16:18:35', '0', 116.399599, 39.897281, 43.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1534, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.21, 55.59, 0.894, 5.98, '2026-01-01 15:18:35', '0', 116.400911, 39.903037, 56.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1535, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.64, 47.13, 1.486, 6.74, '2026-01-01 14:18:35', '0', 116.394429, 39.934754, 45.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1536, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.79, 66.58, 1.322, 7.32, '2026-01-01 13:18:35', '0', 116.403081, 39.916012, 57.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1537, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.04, 46.30, 1.442, 6.92, '2026-01-01 12:18:35', '0', 116.411411, 39.923647, 43.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1538, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.01, 42.16, 1.380, 6.20, '2026-01-01 11:18:35', '0', 116.388261, 39.911082, 44.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1539, 'DEVICE_FIELD_001_001', 'FIELD_001', 34.69, 48.63, 1.148, 6.68, '2026-01-01 10:18:35', '0', 116.382879, 39.909588, 41.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1540, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.18, 47.91, 0.841, 5.87, '2026-01-01 09:18:35', '0', 116.387088, 39.890498, 34.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1541, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.71, 48.32, 1.456, 7.42, '2026-01-01 08:18:35', '0', 116.407935, 39.903573, 49.08, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1542, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.76, 47.28, 1.085, 7.60, '2026-01-01 07:18:35', '0', 116.385471, 39.905303, 48.69, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1543, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.51, 45.25, 1.737, 5.88, '2026-01-01 06:18:35', '0', 116.389232, 39.882129, 49.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1544, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.28, 43.49, 1.364, 6.71, '2026-01-01 05:18:35', '0', 116.409932, 39.921264, 60.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1545, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.59, 47.49, 1.507, 6.01, '2026-01-01 04:18:35', '0', 116.408229, 39.922277, 42.42, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1546, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.74, 34.59, 1.067, 6.11, '2026-01-01 03:18:35', '0', 116.402949, 39.904438, 39.01, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1547, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.08, 46.15, 1.586, 5.57, '2026-01-01 02:18:35', '0', 116.397776, 39.913504, 36.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1548, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.86, 44.27, 1.051, 6.97, '2026-01-01 01:18:35', '0', 116.392341, 39.911260, 26.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1549, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.01, 40.42, 1.219, 6.39, '2026-01-01 00:18:35', '0', 116.395669, 39.911758, 55.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1550, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.60, 40.77, 1.499, 7.12, '2025-12-31 23:18:35', '0', 116.387033, 39.893986, 43.40, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1551, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.04, 46.40, 1.484, 6.54, '2025-12-31 22:18:35', '0', 116.390404, 39.900875, 44.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1552, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.54, 48.69, 1.470, 6.78, '2025-12-31 21:18:35', '0', 116.402178, 39.910909, 54.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1553, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.10, 38.36, 0.936, 7.18, '2025-12-31 20:18:35', '0', 116.406829, 39.905549, 58.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1554, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.63, 48.25, 0.452, 5.47, '2025-12-31 19:18:35', '0', 116.402091, 39.910189, 65.00, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1555, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.10, 46.79, 0.910, 5.63, '2025-12-31 18:18:35', '0', 116.385094, 39.919094, 38.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1556, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.05, 35.67, 1.731, 7.06, '2025-12-31 17:18:35', '0', 116.410423, 39.906665, 52.56, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1557, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.80, 34.26, 1.096, 6.52, '2025-12-31 16:18:35', '0', 116.407891, 39.937451, 59.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1558, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.19, 41.29, 0.904, 7.32, '2025-12-31 15:18:35', '0', 116.377842, 39.921106, 60.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1559, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.34, 43.72, 1.488, 6.14, '2025-12-31 14:18:35', '0', 116.390406, 39.901387, 43.32, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1560, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.97, 41.61, 1.112, 5.71, '2025-12-31 13:18:35', '0', 116.410377, 39.905499, 53.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1561, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.57, 35.64, 0.950, 6.77, '2025-12-31 12:18:35', '0', 116.390877, 39.919535, 50.33, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1562, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.68, 38.14, 0.851, 6.12, '2025-12-31 11:18:35', '0', 116.399101, 39.918567, 36.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1563, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.85, 46.94, 1.181, 7.22, '2025-12-31 10:18:35', '0', 116.395868, 39.890417, 71.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1564, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.74, 44.05, 0.942, 7.14, '2025-12-31 09:18:35', '0', 116.404005, 39.894536, 49.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1565, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.02, 39.41, 0.979, 5.87, '2025-12-31 08:18:35', '0', 116.424513, 39.905127, 41.33, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1566, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.13, 37.50, 1.494, 5.55, '2025-12-31 07:18:35', '0', 116.376495, 39.889270, 48.17, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1567, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.50, 50.76, 0.982, 6.29, '2025-12-31 06:18:35', '0', 116.392262, 39.909234, 32.91, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1568, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.70, 34.49, 1.150, 6.99, '2025-12-31 05:18:35', '0', 116.391000, 39.908051, 72.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1569, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.06, 47.53, 1.193, 6.94, '2025-12-31 04:18:35', '0', 116.403638, 39.887613, 47.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1570, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.06, 42.64, 1.108, 6.23, '2025-12-31 03:18:35', '0', 116.401105, 39.926319, 57.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1571, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.10, 42.45, 0.951, 6.24, '2025-12-31 02:18:35', '0', 116.397471, 39.926212, 26.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1572, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.24, 40.81, 1.140, 5.93, '2025-12-31 01:18:35', '0', 116.405687, 39.916538, 56.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1573, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.05, 38.08, 1.195, 6.94, '2025-12-31 00:18:35', '0', 116.401929, 39.898913, 54.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1574, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.95, 43.99, 1.097, 7.05, '2025-12-30 23:18:35', '0', 116.400027, 39.910130, 39.24, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1575, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.48, 40.78, 0.743, 6.00, '2025-12-30 22:18:35', '0', 116.409970, 39.930954, 49.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1576, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.55, 28.49, 1.378, 5.94, '2025-12-30 21:18:35', '0', 116.404941, 39.916122, 61.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1577, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.27, 34.02, 0.992, 6.27, '2025-12-30 20:18:35', '0', 116.406903, 39.902776, 47.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1578, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.81, 44.19, 1.177, 5.59, '2025-12-30 19:18:35', '0', 116.402057, 39.896453, 54.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1579, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.37, 39.01, 1.090, 7.00, '2025-12-30 18:18:35', '0', 116.397998, 39.901444, 37.40, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1580, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.47, 39.15, 1.041, 5.78, '2025-12-30 17:18:35', '0', 116.398813, 39.907085, 51.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1581, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.43, 43.87, 1.271, 6.59, '2025-12-30 16:18:35', '0', 116.397340, 39.894045, 42.18, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1582, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.57, 34.03, 0.783, 6.51, '2025-12-30 15:18:35', '0', 116.382940, 39.915006, 44.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1583, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.54, 48.10, 0.702, 6.37, '2025-12-30 14:18:35', '0', 116.401977, 39.905602, 58.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1584, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.65, 45.49, 0.634, 6.49, '2025-12-30 13:18:35', '0', 116.392276, 39.907532, 48.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1585, 'DEVICE_FIELD_001_001', 'FIELD_001', 33.19, 39.61, 1.730, 6.36, '2025-12-30 12:18:35', '0', 116.391519, 39.917024, 48.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1586, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.90, 55.00, 1.322, 5.35, '2025-12-30 11:18:35', '0', 116.408273, 39.909079, 68.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1587, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.59, 48.45, 1.490, 5.79, '2025-12-30 10:18:35', '0', 116.396710, 39.914324, 44.60, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1588, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.06, 46.13, 1.348, 7.45, '2025-12-30 09:18:35', '0', 116.390591, 39.913989, 59.94, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1589, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.06, 47.94, 1.207, 6.87, '2025-12-30 08:18:35', '0', 116.421908, 39.929860, 42.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1590, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.27, 58.48, 1.229, 6.93, '2025-12-30 07:18:35', '0', 116.399207, 39.900031, 37.96, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1591, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.14, 50.15, 0.925, 6.02, '2025-12-30 06:18:35', '0', 116.377695, 39.925520, 49.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1592, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.04, 41.96, 1.234, 7.05, '2025-12-30 05:18:35', '0', 116.394328, 39.899979, 47.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1593, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.83, 55.96, 0.702, 6.76, '2025-12-30 04:18:35', '0', 116.403310, 39.906671, 48.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1594, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.52, 55.07, 0.969, 7.52, '2025-12-30 03:18:35', '0', 116.405942, 39.911131, 56.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1595, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.18, 54.80, 0.903, 5.55, '2025-12-30 02:18:35', '0', 116.400024, 39.918575, 37.25, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1596, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.79, 54.43, 1.351, 6.66, '2025-12-30 01:18:35', '0', 116.404998, 39.909888, 58.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1597, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.84, 56.15, 0.670, 5.53, '2025-12-30 00:18:35', '0', 116.394017, 39.899509, 48.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1598, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.66, 58.69, 1.210, 6.26, '2025-12-29 23:18:35', '0', 116.379656, 39.909991, 31.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1599, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.50, 57.37, 0.843, 6.87, '2025-12-29 22:18:35', '0', 116.400070, 39.928422, 36.35, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1600, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.16, 56.80, 1.438, 6.65, '2025-12-29 21:18:35', '0', 116.401600, 39.922027, 51.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1601, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.12, 63.53, 1.443, 6.63, '2025-12-29 20:18:35', '0', 116.414241, 39.904333, 63.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1602, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.12, 64.00, 1.982, 7.26, '2025-12-29 19:18:35', '0', 116.385909, 39.891838, 58.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1603, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.55, 60.09, 1.588, 6.79, '2025-12-29 18:18:35', '0', 116.384725, 39.917089, 57.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1604, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.77, 59.17, 0.622, 7.08, '2025-12-29 17:18:35', '0', 116.384629, 39.911962, 42.41, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1605, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.15, 58.06, 0.765, 5.86, '2025-12-29 16:18:35', '0', 116.378778, 39.891364, 43.43, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1606, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.69, 62.48, 1.124, 6.84, '2025-12-29 15:18:35', '0', 116.407097, 39.924737, 48.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1607, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.04, 66.53, 0.828, 6.86, '2025-12-29 14:18:35', '0', 116.403900, 39.908444, 34.37, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1608, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.61, 58.95, 1.175, 6.10, '2025-12-29 13:18:35', '0', 116.391853, 39.885125, 57.58, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1609, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.58, 58.58, 1.631, 6.92, '2025-12-29 12:18:35', '0', 116.408736, 39.914207, 46.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1610, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.79, 67.24, 1.434, 6.10, '2025-12-29 11:18:35', '0', 116.404087, 39.906710, 46.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1611, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.04, 64.06, 1.068, 6.76, '2025-12-29 10:18:35', '0', 116.409332, 39.908166, 55.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1612, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.95, 78.87, 1.154, 6.80, '2025-12-29 09:18:35', '0', 116.401597, 39.906266, 46.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1613, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.74, 63.24, 1.294, 6.86, '2025-12-29 08:18:35', '0', 116.401183, 39.908793, 61.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1614, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.59, 68.29, 1.549, 7.15, '2025-12-29 07:18:35', '0', 116.394720, 39.897463, 43.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1615, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.50, 72.29, 0.691, 7.09, '2025-12-29 06:18:35', '0', 116.410647, 39.911175, 57.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1616, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.74, 69.49, 1.443, 7.39, '2025-12-29 05:18:35', '0', 116.398160, 39.934190, 30.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1617, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.80, 68.47, 1.034, 6.36, '2025-12-29 04:18:35', '0', 116.387056, 39.902976, 53.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1618, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.20, 69.02, 1.190, 6.73, '2025-12-29 03:18:35', '0', 116.400051, 39.906055, 56.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1619, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.00, 71.30, 1.822, 6.50, '2025-12-29 02:18:35', '0', 116.405947, 39.907275, 45.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1620, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.57, 72.78, 0.836, 6.00, '2025-12-29 01:18:35', '0', 116.380509, 39.902035, 40.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1621, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.07, 64.13, 1.202, 7.12, '2025-12-29 00:18:35', '0', 116.400811, 39.899717, 54.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1622, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.48, 75.95, 0.887, 7.29, '2025-12-28 23:18:35', '0', 116.381115, 39.901363, 46.18, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1623, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.58, 65.13, 1.513, 5.12, '2025-12-28 22:18:35', '0', 116.392325, 39.903183, 68.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1624, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.18, 80.40, 1.228, 5.89, '2025-12-28 21:18:35', '0', 116.386740, 39.925880, 52.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1625, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.84, 74.32, 1.322, 6.87, '2025-12-28 20:18:35', '0', 116.392309, 39.906123, 59.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1626, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.28, 70.92, 1.087, 7.55, '2025-12-28 19:18:35', '0', 116.404837, 39.921407, 33.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1627, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.98, 74.20, 1.056, 6.32, '2025-12-28 18:18:35', '0', 116.376235, 39.892541, 43.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1628, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.43, 75.68, 1.438, 7.09, '2025-12-28 17:18:35', '0', 116.408925, 39.905607, 56.25, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1629, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.37, 77.72, 1.421, 6.74, '2025-12-28 16:18:35', '0', 116.393232, 39.911173, 37.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1630, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.29, 79.85, 1.095, 5.91, '2025-12-28 15:18:35', '0', 116.424778, 39.888081, 24.45, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1631, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.90, 73.57, 0.942, 6.37, '2025-12-28 14:18:35', '0', 116.394793, 39.896531, 50.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1632, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.10, 73.06, 1.669, 5.69, '2025-12-28 13:18:35', '0', 116.392342, 39.917524, 46.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1633, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.61, 79.34, 1.453, 6.56, '2025-12-28 12:18:35', '0', 116.391687, 39.914231, 39.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1634, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.22, 73.49, 0.858, 6.22, '2025-12-28 11:18:35', '0', 116.389406, 39.920156, 33.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1635, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.24, 77.71, 1.215, 6.57, '2025-12-28 10:18:35', '0', 116.385660, 39.915060, 51.01, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1636, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.46, 81.72, 1.363, 6.00, '2025-12-28 09:18:35', '0', 116.387211, 39.920120, 59.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1637, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.80, 78.12, 0.784, 5.69, '2025-12-28 08:18:35', '0', 116.392796, 39.915745, 35.53, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1638, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.97, 83.42, 1.428, 5.81, '2025-12-28 07:18:35', '0', 116.388528, 39.910100, 34.43, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1639, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.95, 84.02, 0.693, 6.05, '2025-12-28 06:18:35', '0', 116.398605, 39.882651, 50.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1640, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.57, 75.41, 1.724, 6.68, '2025-12-28 05:18:35', '0', 116.385330, 39.892014, 41.82, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1641, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.19, 76.80, 1.893, 6.33, '2025-12-28 04:18:35', '0', 116.393318, 39.913711, 62.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1642, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.72, 79.50, 1.285, 6.38, '2025-12-28 03:18:35', '0', 116.401553, 39.916719, 53.94, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1643, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.30, 80.15, 1.155, 5.94, '2025-12-28 02:18:35', '0', 116.414020, 39.903957, 54.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1644, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.49, 77.62, 1.074, 5.86, '2025-12-28 01:18:35', '0', 116.387089, 39.893614, 50.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1645, 'DEVICE_FIELD_001_001', 'FIELD_001', 5.96, 66.34, 0.924, 5.84, '2025-12-28 00:18:35', '0', 116.408649, 39.918262, 37.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1646, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.72, 81.83, 1.208, 6.65, '2025-12-27 23:18:35', '0', 116.388770, 39.903025, 36.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1647, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.31, 75.60, 1.097, 6.70, '2025-12-27 22:18:35', '0', 116.386801, 39.902947, 42.40, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1648, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.02, 77.80, 1.206, 5.93, '2025-12-27 21:18:35', '0', 116.390893, 39.921438, 31.14, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1649, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.57, 74.86, 1.059, 6.37, '2025-12-27 20:18:35', '0', 116.404718, 39.913278, 64.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1650, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.52, 82.00, 1.234, 6.08, '2025-12-27 19:18:35', '0', 116.387454, 39.920911, 60.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1651, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.41, 75.28, 1.333, 7.28, '2025-12-27 18:18:35', '0', 116.378745, 39.915938, 60.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1652, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.30, 80.39, 1.203, 6.30, '2025-12-27 17:18:35', '0', 116.388095, 39.920315, 57.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1653, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.49, 81.10, 1.273, 5.70, '2025-12-27 16:18:35', '0', 116.399763, 39.894946, 48.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1654, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.82, 90.20, 1.170, 6.12, '2025-12-27 15:18:35', '0', 116.404536, 39.904109, 56.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1655, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.80, 84.02, 1.362, 7.14, '2025-12-27 14:18:35', '0', 116.398432, 39.915370, 55.30, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1656, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.20, 71.98, 1.031, 6.44, '2025-12-27 13:18:35', '0', 116.392057, 39.894889, 18.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1657, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.36, 78.40, 0.931, 6.24, '2025-12-27 12:18:35', '0', 116.405763, 39.910836, 53.82, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1658, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.40, 79.55, 1.338, 6.45, '2025-12-27 11:18:35', '0', 116.408182, 39.921189, 43.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1659, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.79, 69.15, 1.185, 6.87, '2025-12-27 10:18:35', '0', 116.402265, 39.920035, 54.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1660, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.42, 81.93, 1.293, 7.09, '2025-12-27 09:18:35', '0', 116.394918, 39.892509, 54.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1661, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.43, 68.83, 1.057, 6.49, '2025-12-27 08:18:35', '0', 116.419844, 39.913619, 52.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1662, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.46, 82.16, 0.806, 6.61, '2025-12-27 07:18:35', '0', 116.372664, 39.918691, 56.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1663, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.48, 71.04, 1.625, 6.95, '2025-12-27 06:18:35', '0', 116.394274, 39.899896, 52.43, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1664, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.29, 79.42, 1.648, 7.16, '2025-12-27 05:18:35', '0', 116.384794, 39.897736, 60.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1665, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.03, 69.02, 1.441, 6.37, '2025-12-27 04:18:35', '0', 116.395288, 39.916479, 50.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1666, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.54, 77.92, 1.004, 6.82, '2025-12-27 03:18:35', '0', 116.402739, 39.909309, 52.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1667, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.06, 81.48, 1.656, 5.51, '2025-12-27 02:18:35', '0', 116.400221, 39.901818, 56.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1668, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.76, 74.37, 1.501, 6.71, '2025-12-27 01:18:35', '0', 116.393029, 39.928826, 56.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1669, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.56, 81.34, 1.604, 6.45, '2025-12-27 00:18:35', '0', 116.395690, 39.902312, 50.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1670, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.69, 64.45, 1.010, 6.53, '2025-12-26 23:18:35', '0', 116.399087, 39.918091, 49.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1671, 'DEVICE_FIELD_001_001', 'FIELD_001', 6.51, 68.52, 1.302, 6.99, '2025-12-26 22:18:35', '0', 116.396820, 39.920430, 52.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1672, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.03, 70.96, 1.250, 6.62, '2025-12-26 21:18:35', '0', 116.392669, 39.881624, 56.30, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1673, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.37, 60.75, 1.234, 7.04, '2025-12-26 20:18:35', '0', 116.399960, 39.925480, 60.01, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1674, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.22, 74.90, 1.074, 7.41, '2025-12-26 19:18:35', '0', 116.378460, 39.899187, 72.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1675, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.72, 68.81, 0.901, 6.78, '2025-12-26 18:18:35', '0', 116.400102, 39.906391, 51.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1676, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.43, 61.60, 0.978, 6.72, '2025-12-26 17:18:35', '0', 116.407565, 39.917041, 56.14, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1677, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.74, 70.10, 1.384, 6.71, '2025-12-26 16:18:35', '0', 116.411239, 39.908119, 51.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1678, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.85, 65.64, 1.209, 5.79, '2025-12-26 15:18:35', '0', 116.398210, 39.905972, 42.62, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1679, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.93, 67.85, 0.684, 6.25, '2025-12-26 14:18:35', '0', 116.412794, 39.904647, 60.85, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1680, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.57, 66.11, 1.494, 6.85, '2025-12-26 13:18:35', '0', 116.398717, 39.899898, 57.58, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1681, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.89, 62.91, 1.348, 6.22, '2025-12-26 12:18:35', '0', 116.392095, 39.911022, 54.41, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1682, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.65, 63.78, 1.201, 6.33, '2025-12-26 11:18:35', '0', 116.410414, 39.911287, 48.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1683, 'DEVICE_FIELD_001_001', 'FIELD_001', 35.02, 76.24, 1.821, 6.54, '2025-12-26 10:18:35', '0', 116.405178, 39.913094, 27.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1684, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.59, 67.81, 1.541, 5.43, '2025-12-26 09:18:35', '0', 116.386050, 39.912386, 79.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1685, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.31, 69.18, 1.113, 6.20, '2025-12-26 08:18:35', '0', 116.395799, 39.889147, 59.63, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1686, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.34, 51.70, 0.842, 6.97, '2025-12-26 07:18:35', '0', 116.403057, 39.923146, 44.56, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1687, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.98, 61.36, 0.849, 6.60, '2025-12-26 06:18:35', '0', 116.397810, 39.910682, 53.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1688, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.28, 69.10, 1.436, 6.84, '2025-12-26 05:18:35', '0', 116.405444, 39.909674, 49.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1689, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.28, 54.29, 1.390, 6.28, '2025-12-26 04:18:35', '0', 116.400596, 39.914219, 67.10, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1690, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.38, 53.74, 0.940, 6.20, '2025-12-26 03:18:35', '0', 116.400054, 39.909701, 46.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1691, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.11, 52.04, 1.196, 6.51, '2025-12-26 02:18:35', '0', 116.364538, 39.899157, 68.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1692, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.01, 61.95, 0.574, 6.52, '2025-12-26 01:18:35', '0', 116.384845, 39.909177, 34.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1693, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.30, 48.68, 0.688, 6.37, '2025-12-26 00:18:35', '0', 116.396864, 39.927008, 63.39, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1694, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.32, 52.09, 0.748, 6.68, '2025-12-25 23:18:35', '0', 116.386656, 39.900012, 47.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1695, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.24, 52.20, 1.346, 6.39, '2025-12-25 22:18:35', '0', 116.397301, 39.903875, 46.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1696, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.12, 47.02, 0.767, 6.90, '2025-12-25 21:18:35', '0', 116.392214, 39.920755, 38.76, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1697, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.40, 59.24, 0.876, 6.62, '2025-12-25 20:18:35', '0', 116.401532, 39.910875, 49.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1698, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.27, 51.39, 0.715, 6.46, '2025-12-25 19:18:35', '0', 116.381053, 39.903976, 44.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1699, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.94, 58.34, 0.881, 6.46, '2025-12-25 18:18:35', '0', 116.418796, 39.893323, 57.11, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1700, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.13, 59.71, 0.521, 7.48, '2025-12-25 17:18:35', '0', 116.387103, 39.906827, 29.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1701, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.55, 51.23, 1.286, 7.07, '2025-12-25 16:18:35', '0', 116.390227, 39.902888, 35.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1702, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.72, 51.68, 1.386, 7.03, '2025-12-25 15:18:35', '0', 116.415926, 39.914648, 44.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1703, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.02, 50.34, 1.150, 6.93, '2025-12-25 14:18:35', '0', 116.368451, 39.907778, 45.34, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1704, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.93, 45.77, 1.057, 6.88, '2025-12-25 13:18:35', '0', 116.400998, 39.911726, 55.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1705, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.63, 49.73, 1.436, 6.45, '2025-12-25 12:18:35', '0', 116.405756, 39.904510, 34.41, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1706, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.76, 47.41, 0.937, 6.51, '2025-12-25 11:18:35', '0', 116.393270, 39.934572, 45.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1707, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.57, 52.16, 1.278, 6.39, '2025-12-25 10:18:35', '0', 116.388425, 39.932351, 51.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1708, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.30, 50.77, 1.162, 6.60, '2025-12-25 09:18:35', '0', 116.415918, 39.914198, 42.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1709, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.57, 46.43, 0.918, 6.98, '2025-12-25 08:18:35', '0', 116.404945, 39.914209, 55.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1710, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.29, 40.41, 1.113, 5.43, '2025-12-25 07:18:35', '0', 116.414044, 39.914371, 47.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1711, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.69, 44.83, 1.069, 6.53, '2025-12-25 06:18:35', '0', 116.405725, 39.911734, 64.91, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1712, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.16, 50.94, 1.302, 6.74, '2025-12-25 05:18:35', '0', 116.388850, 39.905942, 44.78, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1713, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.11, 46.99, 1.645, 6.93, '2025-12-25 04:18:35', '0', 116.411314, 39.899178, 39.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1714, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.53, 36.91, 1.740, 5.80, '2025-12-25 03:18:35', '0', 116.410352, 39.918626, 53.10, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1715, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.61, 42.19, 1.647, 5.72, '2025-12-25 02:18:35', '0', 116.403927, 39.912196, 55.11, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1716, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.26, 38.29, 1.594, 6.34, '2025-12-25 01:18:35', '0', 116.395465, 39.889648, 61.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1717, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.37, 40.55, 0.934, 6.62, '2025-12-25 00:18:35', '0', 116.406850, 39.881903, 57.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1718, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.65, 42.40, 1.532, 5.79, '2025-12-24 23:18:35', '0', 116.396035, 39.904768, 49.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1719, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.19, 47.08, 1.511, 7.34, '2025-12-24 22:18:35', '0', 116.381525, 39.905519, 42.18, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1720, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.41, 42.01, 1.062, 6.44, '2025-12-24 21:18:35', '0', 116.390409, 39.905281, 47.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1721, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.86, 40.24, 1.070, 7.13, '2025-12-24 20:18:35', '0', 116.411990, 39.907752, 46.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1722, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.10, 45.17, 1.189, 6.70, '2025-12-24 19:18:35', '0', 116.405209, 39.913251, 45.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1723, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.58, 34.54, 0.932, 5.90, '2025-12-24 18:18:35', '0', 116.393431, 39.917369, 43.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1724, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.27, 41.24, 1.910, 5.93, '2025-12-24 17:18:35', '0', 116.410662, 39.908182, 60.40, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1725, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.45, 34.60, 1.323, 6.82, '2025-12-24 16:18:35', '0', 116.396822, 39.929128, 50.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1726, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.98, 48.48, 1.255, 6.40, '2025-12-24 15:18:35', '0', 116.406140, 39.923789, 40.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1727, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.07, 32.79, 0.927, 6.60, '2025-12-24 14:18:35', '0', 116.381025, 39.915563, 52.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1728, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.18, 35.02, 1.321, 6.72, '2025-12-24 13:18:35', '0', 116.396736, 39.899296, 53.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1729, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.97, 32.95, 0.932, 6.70, '2025-12-24 12:18:35', '0', 116.378063, 39.928749, 55.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1730, 'DEVICE_FIELD_001_001', 'FIELD_001', 34.41, 41.57, 1.076, 5.80, '2025-12-24 11:18:35', '0', 116.401106, 39.909871, 44.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1731, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.35, 33.91, 1.243, 6.52, '2025-12-24 10:18:35', '0', 116.388966, 39.917169, 53.62, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1732, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.74, 43.02, 1.783, 6.06, '2025-12-24 09:18:35', '0', 116.418856, 39.909613, 46.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1733, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.08, 42.03, 1.158, 6.66, '2025-12-24 08:18:35', '0', 116.396662, 39.883819, 59.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1734, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.46, 39.40, 0.948, 6.82, '2025-12-24 07:18:35', '0', 116.401531, 39.910489, 52.94, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1735, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.62, 33.15, 1.494, 6.63, '2025-12-24 06:18:35', '0', 116.400485, 39.924560, 60.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1736, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.42, 39.58, 0.983, 6.57, '2025-12-24 05:18:35', '0', 116.411144, 39.896427, 55.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1737, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.27, 45.71, 1.526, 6.80, '2025-12-24 04:18:35', '0', 116.405004, 39.914308, 55.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1738, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.45, 41.84, 1.391, 6.79, '2025-12-24 03:18:35', '0', 116.404293, 39.913143, 50.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1739, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.12, 36.06, 1.087, 7.27, '2025-12-24 02:18:35', '0', 116.397202, 39.924540, 66.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1740, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.63, 42.66, 1.228, 6.19, '2025-12-24 01:18:35', '0', 116.411613, 39.902386, 43.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1741, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.59, 37.75, 1.198, 6.77, '2025-12-24 00:18:35', '0', 116.398529, 39.921158, 72.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1742, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.68, 41.02, 1.172, 6.69, '2025-12-23 23:18:35', '0', 116.387597, 39.923063, 63.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1743, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.71, 37.30, 1.230, 7.12, '2025-12-23 22:18:35', '0', 116.403809, 39.905793, 52.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1744, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.16, 41.39, 1.053, 6.33, '2025-12-23 21:18:35', '0', 116.404488, 39.895110, 69.01, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1745, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.60, 56.50, 1.506, 5.61, '2025-12-23 20:18:35', '0', 116.396364, 39.895912, 53.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1746, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.55, 38.92, 1.390, 7.21, '2025-12-23 19:18:35', '0', 116.411037, 39.904441, 35.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1747, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.60, 39.26, 1.136, 6.96, '2025-12-23 18:18:35', '0', 116.389040, 39.907891, 30.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1748, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.88, 37.29, 0.823, 6.98, '2025-12-23 17:18:35', '0', 116.395714, 39.920533, 48.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1749, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.06, 45.57, 1.672, 6.26, '2025-12-23 16:18:35', '0', 116.392706, 39.919507, 51.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1750, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.46, 36.37, 1.696, 5.94, '2025-12-23 15:18:35', '0', 116.399870, 39.921515, 50.63, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1751, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.33, 47.31, 0.988, 6.60, '2025-12-23 14:18:35', '0', 116.401302, 39.896649, 59.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1752, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.50, 37.77, 1.434, 6.19, '2025-12-23 13:18:35', '0', 116.401319, 39.910476, 68.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1753, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.42, 49.08, 0.964, 7.22, '2025-12-23 12:18:35', '0', 116.400413, 39.912784, 35.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1754, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.09, 46.99, 1.077, 6.40, '2025-12-23 11:18:35', '0', 116.409400, 39.903101, 62.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1755, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.05, 52.48, 1.534, 6.89, '2025-12-23 10:18:35', '0', 116.411645, 39.902253, 51.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1756, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.24, 48.01, 0.896, 6.95, '2025-12-23 09:18:35', '0', 116.398350, 39.885321, 66.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1757, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.20, 49.83, 1.611, 6.54, '2025-12-23 08:18:35', '0', 116.390958, 39.888680, 47.28, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1758, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.60, 41.45, 1.183, 5.68, '2025-12-23 07:18:35', '0', 116.387514, 39.911696, 52.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1759, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.06, 52.07, 1.379, 6.86, '2025-12-23 06:18:35', '0', 116.404996, 39.922919, 45.42, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1760, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.24, 48.61, 0.951, 6.17, '2025-12-23 05:18:35', '0', 116.385833, 39.894827, 36.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1761, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.42, 57.19, 1.000, 6.46, '2025-12-23 04:18:35', '0', 116.383277, 39.905476, 46.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1762, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.10, 48.26, 1.246, 6.01, '2025-12-23 03:18:35', '0', 116.403885, 39.898903, 51.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1763, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.50, 60.07, 1.233, 6.08, '2025-12-23 02:18:35', '0', 116.402406, 39.903221, 49.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1764, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.68, 50.11, 1.233, 7.15, '2025-12-23 01:18:35', '0', 116.407078, 39.924906, 44.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1765, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.14, 50.70, 1.360, 6.14, '2025-12-23 00:18:35', '0', 116.387595, 39.913771, 44.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1766, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.00, 55.65, 0.854, 6.92, '2025-12-22 23:18:35', '0', 116.391061, 39.899481, 67.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1767, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.83, 60.75, 1.287, 5.94, '2025-12-22 22:18:35', '0', 116.386358, 39.898248, 63.63, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1768, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.21, 56.25, 1.484, 6.63, '2025-12-22 21:18:35', '0', 116.391174, 39.892053, 47.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1769, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.53, 63.57, 0.970, 6.56, '2025-12-22 20:18:35', '0', 116.398341, 39.908643, 57.24, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1770, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.09, 68.64, 0.978, 6.44, '2025-12-22 19:18:35', '0', 116.394532, 39.904839, 41.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1771, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.10, 57.02, 1.658, 6.24, '2025-12-22 18:18:35', '0', 116.382508, 39.891413, 54.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1772, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.24, 58.70, 1.236, 6.22, '2025-12-22 17:18:35', '0', 116.392807, 39.911415, 62.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1773, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.99, 59.32, 1.018, 6.78, '2025-12-22 16:18:35', '0', 116.385095, 39.917008, 38.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1774, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.13, 62.76, 1.000, 6.83, '2025-12-22 15:18:35', '0', 116.400152, 39.924926, 42.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1775, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.13, 59.42, 0.889, 6.92, '2025-12-22 14:18:35', '0', 116.394869, 39.903252, 48.62, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1776, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.53, 71.33, 1.393, 6.57, '2025-12-22 13:18:35', '0', 116.390789, 39.917189, 32.91, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1777, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.01, 62.85, 0.887, 6.43, '2025-12-22 12:18:35', '0', 116.403740, 39.911906, 48.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1778, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.64, 66.43, 1.522, 5.86, '2025-12-22 11:18:35', '0', 116.383073, 39.912881, 59.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1779, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.28, 62.28, 0.873, 7.09, '2025-12-22 10:18:35', '0', 116.407437, 39.910265, 56.28, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1780, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.64, 67.05, 1.519, 7.31, '2025-12-22 09:18:35', '0', 116.403388, 39.903625, 63.78, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1781, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.91, 66.98, 1.709, 7.35, '2025-12-22 08:18:35', '0', 116.411227, 39.912986, 48.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1782, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.16, 68.88, 1.117, 6.65, '2025-12-22 07:18:35', '0', 116.407884, 39.898564, 66.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1783, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.60, 68.23, 1.358, 6.57, '2025-12-22 06:18:35', '0', 116.391769, 39.907517, 74.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1784, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.86, 66.81, 1.511, 6.52, '2025-12-22 05:18:35', '0', 116.392420, 39.892661, 72.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1785, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.35, 70.75, 0.604, 6.86, '2025-12-22 04:18:35', '0', 116.408846, 39.908738, 58.30, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1786, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.50, 63.33, 1.872, 6.01, '2025-12-22 03:18:35', '0', 116.403777, 39.935469, 40.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1787, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.13, 69.92, 1.062, 6.80, '2025-12-22 02:18:35', '0', 116.392105, 39.911807, 43.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1788, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.90, 61.37, 1.244, 6.75, '2025-12-22 01:18:35', '0', 116.391824, 39.909169, 44.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1789, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.14, 67.32, 0.899, 5.93, '2025-12-22 00:18:35', '0', 116.409589, 39.895432, 48.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1790, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.62, 64.78, 1.534, 6.04, '2025-12-21 23:18:35', '0', 116.392729, 39.894735, 39.30, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1791, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.55, 73.08, 1.420, 6.05, '2025-12-21 22:18:35', '0', 116.405840, 39.916096, 47.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1792, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.18, 66.84, 1.130, 5.73, '2025-12-21 21:18:35', '0', 116.395732, 39.915549, 42.74, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1793, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.19, 64.77, 1.491, 6.20, '2025-12-21 20:18:35', '0', 116.398369, 39.908072, 60.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1794, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.48, 80.14, 1.548, 6.42, '2025-12-21 19:18:35', '0', 116.402581, 39.925918, 47.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1795, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.92, 78.96, 1.650, 6.41, '2025-12-21 18:18:35', '0', 116.398261, 39.910069, 61.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1796, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.05, 72.66, 1.205, 5.71, '2025-12-21 17:18:35', '0', 116.386336, 39.915257, 56.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1797, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.97, 83.78, 0.742, 6.05, '2025-12-21 16:18:35', '0', 116.416499, 39.906765, 50.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1798, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.99, 79.42, 1.129, 6.83, '2025-12-21 15:18:35', '0', 116.381967, 39.910932, 47.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1799, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.26, 78.09, 1.048, 5.66, '2025-12-21 14:18:35', '0', 116.401902, 39.927071, 57.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1800, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.05, 77.73, 2.230, 6.30, '2025-12-21 13:18:35', '0', 116.397314, 39.886104, 47.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1801, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.66, 76.96, 1.682, 6.02, '2025-12-21 12:18:35', '0', 116.395956, 39.895865, 35.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1802, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.72, 77.84, 0.879, 5.76, '2025-12-21 11:18:35', '0', 116.407339, 39.913304, 48.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1803, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.93, 77.10, 0.584, 6.91, '2025-12-21 10:18:35', '0', 116.404819, 39.917014, 43.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1804, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.74, 81.98, 1.690, 5.57, '2025-12-21 09:18:35', '0', 116.408704, 39.907254, 38.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1805, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.83, 77.15, 1.350, 6.25, '2025-12-21 08:18:35', '0', 116.388537, 39.914099, 35.14, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1806, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.10, 78.17, 1.030, 6.14, '2025-12-21 07:18:35', '0', 116.398809, 39.926852, 42.89, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1807, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.90, 70.36, 1.133, 6.31, '2025-12-21 06:18:35', '0', 116.395828, 39.908584, 58.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1808, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.68, 76.37, 0.947, 7.13, '2025-12-21 05:18:35', '0', 116.386341, 39.901455, 53.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1809, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.83, 88.33, 1.293, 6.69, '2025-12-21 04:18:35', '0', 116.397102, 39.915315, 48.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1810, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.70, 77.01, 1.200, 6.76, '2025-12-21 03:18:35', '0', 116.374468, 39.901087, 51.18, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1811, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.09, 80.84, 1.109, 6.73, '2025-12-21 02:18:35', '0', 116.386024, 39.906765, 52.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1812, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.83, 92.17, 1.650, 7.10, '2025-12-21 01:18:35', '0', 116.407325, 39.918054, 69.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1813, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.05, 90.94, 1.453, 7.03, '2025-12-21 00:18:35', '0', 116.410964, 39.922889, 49.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1814, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.69, 76.42, 1.135, 6.40, '2025-12-20 23:18:35', '0', 116.397256, 39.912506, 45.28, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1815, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.80, 79.56, 1.100, 6.48, '2025-12-20 22:18:35', '0', 116.409837, 39.912099, 62.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1816, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.99, 82.30, 1.193, 6.26, '2025-12-20 21:18:35', '0', 116.409602, 39.914049, 60.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1817, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.21, 89.72, 1.362, 5.80, '2025-12-20 20:18:35', '0', 116.401834, 39.888731, 36.96, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1818, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.45, 78.67, 1.098, 6.06, '2025-12-20 19:18:35', '0', 116.389777, 39.906605, 61.00, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1819, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.12, 92.64, 1.308, 7.66, '2025-12-20 18:18:35', '0', 116.383687, 39.912882, 39.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1820, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.85, 81.92, 1.502, 5.69, '2025-12-20 17:18:35', '0', 116.391246, 39.910741, 36.83, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1821, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.58, 84.77, 1.338, 6.21, '2025-12-20 16:18:35', '0', 116.403185, 39.903887, 35.56, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1822, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.23, 94.24, 1.191, 6.00, '2025-12-20 15:18:35', '0', 116.386899, 39.918614, 64.09, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1823, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.17, 82.04, 1.134, 7.38, '2025-12-20 14:18:35', '0', 116.394559, 39.934082, 59.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1824, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.78, 78.92, 1.067, 6.42, '2025-12-20 13:18:35', '0', 116.386135, 39.914644, 45.76, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1825, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.84, 81.05, 1.433, 6.36, '2025-12-20 12:18:35', '0', 116.383428, 39.905698, 39.76, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1826, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.78, 72.73, 1.119, 6.32, '2025-12-20 11:18:35', '0', 116.372443, 39.902481, 45.33, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1827, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.30, 69.45, 0.831, 7.35, '2025-12-20 10:18:35', '0', 116.389418, 39.895094, 64.90, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1828, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.03, 73.41, 0.955, 7.35, '2025-12-20 09:18:35', '0', 116.391735, 39.909266, 54.45, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1829, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.15, 81.08, 0.972, 6.21, '2025-12-20 08:18:35', '0', 116.388785, 39.908831, 51.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1830, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.78, 73.06, 1.632, 5.14, '2025-12-20 07:18:35', '0', 116.394600, 39.907092, 48.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1831, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.07, 81.08, 1.324, 6.12, '2025-12-20 06:18:35', '0', 116.403088, 39.913225, 45.41, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1832, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.94, 83.07, 1.156, 6.93, '2025-12-20 05:18:35', '0', 116.402208, 39.900261, 40.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1833, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.97, 76.81, 1.830, 6.30, '2025-12-20 04:18:35', '0', 116.407803, 39.897487, 44.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1834, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.35, 73.14, 1.706, 6.36, '2025-12-20 03:18:35', '0', 116.379229, 39.909655, 55.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1835, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.59, 75.48, 0.834, 6.70, '2025-12-20 02:18:35', '0', 116.391032, 39.923015, 49.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1836, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.09, 64.22, 1.295, 6.66, '2025-12-20 01:18:35', '0', 116.391362, 39.913563, 50.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1837, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.27, 69.97, 1.106, 5.99, '2025-12-20 00:18:35', '0', 116.394360, 39.927935, 44.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1838, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.20, 75.14, 1.210, 6.69, '2025-12-19 23:18:35', '0', 116.398369, 39.901505, 46.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1839, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.39, 76.42, 1.238, 7.29, '2025-12-19 22:18:35', '0', 116.403912, 39.909857, 50.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1840, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.57, 75.32, 1.586, 5.91, '2025-12-19 21:18:35', '0', 116.395884, 39.909492, 57.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1841, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.87, 76.51, 1.576, 6.89, '2025-12-19 20:18:35', '0', 116.399630, 39.904765, 45.94, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1842, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.64, 65.28, 1.450, 6.34, '2025-12-19 19:18:35', '0', 116.398176, 39.916494, 68.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1843, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.93, 64.20, 1.825, 6.38, '2025-12-19 18:18:35', '0', 116.396765, 39.912066, 59.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1844, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.43, 69.20, 1.261, 6.45, '2025-12-19 17:18:35', '0', 116.395875, 39.908107, 63.85, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1845, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.74, 66.00, 1.341, 6.62, '2025-12-19 16:18:35', '0', 116.383621, 39.921311, 38.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1846, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.14, 69.96, 1.187, 5.76, '2025-12-19 15:18:35', '0', 116.386343, 39.897381, 62.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1847, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.33, 68.48, 1.250, 5.57, '2025-12-19 14:18:35', '0', 116.384752, 39.925229, 43.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1848, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.41, 64.57, 0.994, 6.43, '2025-12-19 13:18:35', '0', 116.372334, 39.917778, 38.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1849, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.82, 67.37, 1.614, 7.01, '2025-12-19 12:18:35', '0', 116.401145, 39.919814, 39.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1850, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.83, 55.41, 0.787, 6.22, '2025-12-19 11:18:35', '0', 116.381952, 39.915575, 47.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1851, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.07, 56.00, 0.834, 6.50, '2025-12-19 10:18:35', '0', 116.410963, 39.900911, 50.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1852, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.98, 68.73, 1.007, 6.82, '2025-12-19 09:18:35', '0', 116.388952, 39.915484, 60.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1853, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.95, 64.22, 1.313, 5.78, '2025-12-19 08:18:35', '0', 116.393340, 39.899924, 50.25, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1854, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.53, 55.03, 1.182, 7.70, '2025-12-19 07:18:35', '0', 116.398321, 39.918342, 54.40, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1855, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.13, 58.24, 1.192, 5.87, '2025-12-19 06:18:35', '0', 116.397265, 39.890519, 51.27, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1856, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.01, 57.91, 1.503, 6.37, '2025-12-19 05:18:35', '0', 116.401373, 39.906299, 54.75, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1857, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.59, 64.03, 1.097, 6.25, '2025-12-19 04:18:35', '0', 116.389470, 39.907927, 37.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1858, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.47, 52.93, 1.327, 6.22, '2025-12-19 03:18:35', '0', 116.392878, 39.911401, 72.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1859, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.04, 58.43, 1.155, 5.61, '2025-12-19 02:18:35', '0', 116.397457, 39.917296, 31.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1860, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.49, 67.24, 1.124, 6.84, '2025-12-19 01:18:35', '0', 116.412176, 39.901833, 68.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1861, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.91, 46.99, 0.625, 6.13, '2025-12-19 00:18:35', '0', 116.410997, 39.899843, 37.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1862, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.57, 55.75, 1.285, 6.65, '2025-12-18 23:18:35', '0', 116.404799, 39.896765, 39.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1863, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.00, 48.63, 0.948, 6.48, '2025-12-18 22:18:35', '0', 116.383474, 39.905689, 36.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1864, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.12, 58.54, 0.725, 6.55, '2025-12-18 21:18:35', '0', 116.412847, 39.908536, 67.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1865, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.27, 54.23, 1.272, 5.71, '2025-12-18 20:18:35', '0', 116.395909, 39.907510, 42.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1866, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.44, 53.93, 1.278, 6.35, '2025-12-18 19:18:35', '0', 116.397002, 39.918385, 49.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1867, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.77, 54.59, 1.484, 6.36, '2025-12-18 18:18:35', '0', 116.405675, 39.916751, 47.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1868, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.70, 48.93, 1.169, 5.39, '2025-12-18 17:18:35', '0', 116.401882, 39.906363, 77.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1869, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.87, 55.61, 1.556, 6.55, '2025-12-18 16:18:35', '0', 116.409156, 39.929326, 57.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1870, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.85, 50.12, 1.005, 6.10, '2025-12-18 15:18:35', '0', 116.378299, 39.906560, 42.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1871, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.79, 50.05, 1.245, 6.94, '2025-12-18 14:18:35', '0', 116.390379, 39.904366, 37.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1872, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.71, 46.57, 0.859, 6.48, '2025-12-18 13:18:35', '0', 116.393707, 39.899707, 28.10, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1873, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.21, 46.42, 0.556, 6.21, '2025-12-18 12:18:35', '0', 116.390912, 39.910761, 52.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1874, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.81, 48.44, 1.445, 6.77, '2025-12-18 11:18:35', '0', 116.386493, 39.906020, 51.62, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1875, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.08, 40.84, 1.043, 5.95, '2025-12-18 10:18:35', '0', 116.402255, 39.910342, 52.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1876, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.03, 51.19, 1.607, 6.45, '2025-12-18 09:18:35', '0', 116.398523, 39.938254, 56.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1877, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.72, 48.14, 1.309, 6.69, '2025-12-18 08:18:35', '0', 116.399958, 39.905810, 44.50, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1878, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.66, 44.08, 1.307, 6.16, '2025-12-18 07:18:35', '0', 116.399316, 39.902278, 49.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1879, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.52, 38.96, 0.602, 5.81, '2025-12-18 06:18:35', '0', 116.394211, 39.906687, 62.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1880, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.61, 47.73, 1.290, 6.09, '2025-12-18 05:18:35', '0', 116.387358, 39.906231, 52.10, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1881, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.73, 43.87, 1.302, 5.89, '2025-12-18 04:18:35', '0', 116.402352, 39.919302, 50.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1882, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.72, 51.88, 1.379, 6.14, '2025-12-18 03:18:35', '0', 116.405589, 39.909054, 37.82, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1883, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.33, 42.68, 1.348, 7.62, '2025-12-18 02:18:35', '0', 116.388761, 39.904509, 45.05, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1884, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.04, 51.94, 1.336, 6.40, '2025-12-18 01:18:35', '0', 116.389983, 39.924889, 57.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1885, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.12, 44.30, 1.162, 6.31, '2025-12-18 00:18:35', '0', 116.397171, 39.902178, 42.00, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1886, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.83, 42.88, 0.988, 5.90, '2025-12-17 23:18:35', '0', 116.395301, 39.910117, 34.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1887, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.32, 40.13, 0.870, 5.86, '2025-12-17 22:18:35', '0', 116.399087, 39.909835, 54.77, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1888, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.09, 35.69, 0.817, 6.36, '2025-12-17 21:18:35', '0', 116.403602, 39.917219, 59.19, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1889, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.38, 40.80, 0.810, 6.02, '2025-12-17 20:18:35', '0', 116.388010, 39.909197, 49.45, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1890, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.95, 51.16, 1.228, 6.67, '2025-12-17 19:18:35', '0', 116.411182, 39.906218, 50.73, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1891, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.12, 38.50, 1.502, 5.75, '2025-12-17 18:18:35', '0', 116.391114, 39.912414, 66.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1892, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.02, 44.68, 1.050, 5.59, '2025-12-17 17:18:35', '0', 116.401922, 39.904002, 54.76, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1893, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.09, 44.38, 1.342, 6.62, '2025-12-17 16:18:35', '0', 116.395816, 39.925836, 57.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1894, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.09, 42.16, 1.520, 5.95, '2025-12-17 15:18:35', '0', 116.406936, 39.916771, 34.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1895, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.31, 46.62, 0.665, 5.94, '2025-12-17 14:18:35', '0', 116.395892, 39.919754, 36.60, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1896, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.55, 48.70, 1.203, 6.97, '2025-12-17 13:18:35', '0', 116.397463, 39.906482, 53.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1897, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.92, 36.48, 0.890, 6.36, '2025-12-17 12:18:35', '0', 116.403296, 39.905998, 43.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1898, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.08, 43.26, 0.967, 6.83, '2025-12-17 11:18:35', '0', 116.403315, 39.908966, 34.06, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1899, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.35, 45.48, 1.071, 6.21, '2025-12-17 10:18:35', '0', 116.384147, 39.897891, 51.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1900, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.57, 40.29, 1.566, 6.37, '2025-12-17 09:18:35', '0', 116.419782, 39.901216, 45.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1901, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.89, 39.90, 1.460, 6.87, '2025-12-17 08:18:35', '0', 116.378465, 39.911040, 49.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1902, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.06, 40.18, 1.097, 6.51, '2025-12-17 07:18:35', '0', 116.412373, 39.902257, 57.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1903, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.44, 42.71, 0.933, 7.60, '2025-12-17 06:18:35', '0', 116.383061, 39.916738, 57.28, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1904, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.55, 46.42, 0.781, 6.62, '2025-12-17 05:18:35', '0', 116.388545, 39.904071, 46.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1905, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.51, 40.44, 0.860, 7.57, '2025-12-17 04:18:35', '0', 116.402099, 39.911523, 45.51, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1906, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.04, 37.61, 1.119, 7.14, '2025-12-17 03:18:35', '0', 116.398626, 39.909994, 49.65, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1907, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.95, 37.56, 0.848, 5.61, '2025-12-17 02:18:35', '0', 116.405713, 39.906545, 59.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1908, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.68, 39.71, 1.002, 6.24, '2025-12-17 01:18:35', '0', 116.412751, 39.902429, 52.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1909, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.11, 45.49, 1.377, 6.16, '2025-12-17 00:18:35', '0', 116.410908, 39.905159, 66.80, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1910, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.43, 44.31, 1.145, 6.64, '2025-12-16 23:18:35', '0', 116.411342, 39.916046, 54.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1911, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.26, 51.02, 0.833, 6.23, '2025-12-16 22:18:35', '0', 116.404653, 39.908241, 50.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1912, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.65, 39.62, 1.298, 6.16, '2025-12-16 21:18:35', '0', 116.393037, 39.905609, 58.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1913, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.32, 44.93, 1.723, 6.56, '2025-12-16 20:18:35', '0', 116.395145, 39.904831, 39.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1914, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.14, 41.43, 1.106, 6.01, '2025-12-16 19:18:35', '0', 116.405468, 39.917716, 46.11, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1915, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.27, 46.32, 1.166, 6.58, '2025-12-16 18:18:35', '0', 116.394600, 39.905791, 39.94, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1916, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.12, 42.56, 0.428, 6.99, '2025-12-16 17:18:35', '0', 116.403671, 39.917250, 51.88, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1917, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.27, 40.81, 0.890, 6.81, '2025-12-16 16:18:35', '0', 116.389456, 39.905399, 35.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1918, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.99, 43.05, 0.679, 6.97, '2025-12-16 15:18:35', '0', 116.405431, 39.905074, 56.67, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1919, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.14, 51.61, 1.584, 6.93, '2025-12-16 14:18:35', '0', 116.397720, 39.916742, 49.84, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1920, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.67, 43.21, 1.051, 7.79, '2025-12-16 13:18:35', '0', 116.412183, 39.911704, 47.35, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1921, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.82, 51.27, 1.055, 6.16, '2025-12-16 12:18:35', '0', 116.414476, 39.925118, 37.79, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1922, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.34, 47.23, 1.752, 6.66, '2025-12-16 11:18:35', '0', 116.398111, 39.897735, 36.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1923, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.31, 43.90, 1.504, 6.39, '2025-12-16 10:18:35', '0', 116.388657, 39.909578, 43.17, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1924, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.44, 47.17, 1.108, 7.03, '2025-12-16 09:18:35', '0', 116.367933, 39.919097, 50.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1925, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.49, 57.29, 1.481, 6.30, '2025-12-16 08:18:35', '0', 116.401154, 39.911375, 69.93, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1926, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.16, 45.56, 0.928, 6.21, '2025-12-16 07:18:35', '0', 116.400383, 39.917530, 42.36, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1927, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.26, 43.87, 1.438, 7.28, '2025-12-16 06:18:35', '0', 116.398944, 39.902480, 50.18, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1928, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.47, 48.31, 0.987, 6.98, '2025-12-16 05:18:35', '0', 116.397863, 39.912030, 44.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1929, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.51, 56.16, 1.291, 6.60, '2025-12-16 04:18:35', '0', 116.389391, 39.913043, 57.30, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1930, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.86, 49.29, 1.252, 6.17, '2025-12-16 03:18:35', '0', 116.416046, 39.909245, 65.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1931, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.96, 43.16, 1.258, 6.78, '2025-12-16 02:18:35', '0', 116.401315, 39.892570, 49.52, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1932, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.36, 53.77, 1.135, 5.87, '2025-12-16 01:18:35', '0', 116.417843, 39.928038, 73.37, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1933, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.15, 55.05, 1.516, 7.00, '2025-12-16 00:18:35', '0', 116.385619, 39.928133, 67.12, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1934, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.32, 52.57, 0.741, 7.32, '2025-12-15 23:18:35', '0', 116.418478, 39.890816, 59.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1935, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.31, 51.03, 1.596, 5.85, '2025-12-15 22:18:35', '0', 116.390062, 39.930890, 60.46, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1936, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.86, 53.55, 1.010, 5.13, '2025-12-15 21:18:35', '0', 116.394834, 39.908764, 62.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1937, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.80, 60.87, 1.537, 6.76, '2025-12-15 20:18:35', '0', 116.405259, 39.908071, 56.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1938, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.32, 50.40, 1.431, 6.63, '2025-12-15 19:18:35', '0', 116.384510, 39.919948, 33.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1939, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.57, 64.68, 0.970, 6.88, '2025-12-15 18:18:35', '0', 116.375838, 39.908410, 59.43, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1940, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.05, 60.03, 1.518, 6.84, '2025-12-15 17:18:35', '0', 116.380162, 39.915156, 77.26, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1941, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.75, 47.50, 1.056, 7.32, '2025-12-15 16:18:35', '0', 116.374679, 39.913124, 63.44, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1942, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.09, 61.46, 1.126, 6.48, '2025-12-15 15:18:35', '0', 116.404791, 39.907621, 61.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1943, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.14, 62.48, 1.074, 6.98, '2025-12-15 14:18:35', '0', 116.399213, 39.902702, 51.66, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1944, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.86, 63.44, 1.194, 7.27, '2025-12-15 13:18:35', '0', 116.408025, 39.919293, 51.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1945, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.41, 63.44, 0.778, 7.87, '2025-12-15 12:18:35', '0', 116.404687, 39.925361, 55.11, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1946, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.92, 67.20, 1.317, 6.66, '2025-12-15 11:18:35', '0', 116.391870, 39.912438, 49.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1947, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.26, 66.92, 0.943, 6.41, '2025-12-15 10:18:35', '0', 116.412840, 39.901765, 44.58, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1948, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.98, 69.76, 1.195, 7.03, '2025-12-15 09:18:35', '0', 116.389828, 39.911733, 49.38, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1949, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.36, 51.34, 1.331, 6.08, '2025-12-15 08:18:35', '0', 116.400693, 39.902618, 62.87, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1950, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.66, 66.95, 1.362, 6.61, '2025-12-15 07:18:35', '0', 116.397149, 39.929898, 63.03, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1951, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.51, 71.75, 1.635, 5.59, '2025-12-15 06:18:35', '0', 116.411232, 39.917248, 31.04, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1952, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.82, 74.87, 1.358, 6.64, '2025-12-15 05:18:35', '0', 116.411419, 39.913222, 44.63, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1953, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.22, 64.56, 1.356, 6.40, '2025-12-15 04:18:35', '0', 116.371233, 39.903736, 55.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1954, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.92, 68.77, 1.529, 6.20, '2025-12-15 03:18:35', '0', 116.414479, 39.913445, 62.25, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1955, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.63, 87.44, 1.214, 6.45, '2025-12-15 02:18:35', '0', 116.405218, 39.915373, 47.47, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1956, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.42, 69.03, 1.188, 5.77, '2025-12-15 01:18:35', '0', 116.402341, 39.909155, 42.08, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1957, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.16, 76.87, 1.421, 6.35, '2025-12-15 00:18:35', '0', 116.396932, 39.910998, 30.53, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1958, 'DEVICE_FIELD_001_001', 'FIELD_001', 7.92, 73.07, 1.415, 6.64, '2025-12-14 23:18:35', '0', 116.396562, 39.907075, 58.49, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1959, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.09, 76.57, 1.173, 6.26, '2025-12-14 22:18:35', '0', 116.375174, 39.906837, 43.16, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1960, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.51, 67.48, 1.135, 7.02, '2025-12-14 21:18:35', '0', 116.407100, 39.905440, 67.02, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1961, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.31, 76.30, 1.746, 6.02, '2025-12-14 20:18:35', '0', 116.396205, 39.912343, 59.13, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1962, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.65, 67.58, 1.449, 6.44, '2025-12-14 19:18:35', '0', 116.397583, 39.917988, 35.99, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1963, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.17, 87.06, 1.114, 6.64, '2025-12-14 18:18:35', '0', 116.375865, 39.908229, 45.20, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1964, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.01, 77.04, 1.265, 5.38, '2025-12-14 17:18:35', '0', 116.393900, 39.900374, 46.70, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1965, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.79, 77.70, 1.172, 6.71, '2025-12-14 16:18:35', '0', 116.411758, 39.910631, 42.64, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1966, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.24, 77.82, 1.644, 6.89, '2025-12-14 15:18:35', '0', 116.396375, 39.909875, 38.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1967, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.25, 81.60, 1.136, 7.12, '2025-12-14 14:18:35', '0', 116.389760, 39.931599, 50.68, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1968, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.67, 71.15, 1.458, 6.73, '2025-12-14 13:18:35', '0', 116.401258, 39.922801, 48.33, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1969, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.67, 69.86, 1.284, 6.83, '2025-12-14 12:18:35', '0', 116.410566, 39.927486, 45.55, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1970, 'DEVICE_FIELD_001_001', 'FIELD_001', 33.73, 75.01, 1.114, 6.69, '2025-12-14 11:18:35', '0', 116.408121, 39.921780, 54.01, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1971, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.66, 80.04, 1.121, 6.87, '2025-12-14 10:18:35', '0', 116.418076, 39.897958, 34.60, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1972, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.03, 75.79, 0.587, 6.19, '2025-12-14 09:18:35', '0', 116.410463, 39.903006, 61.76, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1973, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.52, 73.36, 1.473, 7.15, '2025-12-14 08:18:35', '0', 116.409487, 39.897020, 50.53, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1974, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.52, 72.53, 1.677, 6.11, '2025-12-14 07:18:35', '0', 116.401899, 39.895430, 34.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1975, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.81, 80.38, 0.537, 6.23, '2025-12-14 06:18:35', '0', 116.410303, 39.906593, 43.24, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1976, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.91, 84.17, 1.493, 6.50, '2025-12-14 05:18:35', '0', 116.401881, 39.900110, 50.48, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1977, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.56, 81.36, 1.219, 6.21, '2025-12-14 04:18:35', '0', 116.396381, 39.911465, 47.07, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1978, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.87, 81.23, 0.846, 6.85, '2025-12-14 03:18:35', '0', 116.378353, 39.907925, 55.59, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1979, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.38, 77.73, 0.712, 6.67, '2025-12-14 02:18:35', '0', 116.411383, 39.910631, 66.28, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1980, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.22, 89.58, 1.600, 6.11, '2025-12-14 01:18:35', '0', 116.406450, 39.915260, 34.23, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1981, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.15, 71.39, 1.365, 6.76, '2025-12-14 00:18:35', '0', 116.405629, 39.923754, 49.98, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1982, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.63, 73.24, 1.329, 6.87, '2025-12-13 23:18:35', '0', 116.401041, 39.894094, 49.81, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1983, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.49, 78.12, 1.192, 5.79, '2025-12-13 22:18:35', '0', 116.405097, 39.903713, 29.54, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1984, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.57, 83.39, 1.109, 6.70, '2025-12-13 21:18:35', '0', 116.388953, 39.909395, 60.57, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1985, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.35, 83.53, 1.121, 6.21, '2025-12-13 20:18:35', '0', 116.402575, 39.901284, 54.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1986, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.53, 80.66, 0.698, 6.67, '2025-12-13 19:18:35', '0', 116.414060, 39.895139, 52.29, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1987, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.20, 86.62, 1.575, 6.89, '2025-12-13 18:18:35', '0', 116.388915, 39.906348, 44.39, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1988, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.47, 73.42, 1.417, 5.84, '2025-12-13 17:18:35', '0', 116.396617, 39.916331, 30.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1989, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.83, 82.67, 1.441, 6.60, '2025-12-13 16:18:35', '0', 116.411397, 39.922871, 78.86, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1990, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.13, 70.30, 1.155, 6.97, '2025-12-13 15:18:35', '0', 116.411623, 39.907614, 44.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1991, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.88, 75.88, 1.321, 6.04, '2025-12-13 14:18:35', '0', 116.410295, 39.926029, 51.92, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1992, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.50, 88.42, 1.105, 7.52, '2025-12-13 13:18:35', '0', 116.414147, 39.907374, 48.94, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1993, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.59, 81.06, 1.151, 6.64, '2025-12-13 12:18:35', '0', 116.397749, 39.894701, 47.95, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1994, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.22, 80.29, 1.157, 7.61, '2025-12-13 11:18:35', '0', 116.386676, 39.913088, 43.97, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1995, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.92, 82.96, 1.479, 6.95, '2025-12-13 10:18:35', '0', 116.401604, 39.917472, 49.72, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1996, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.72, 70.17, 1.368, 6.21, '2025-12-13 09:18:35', '0', 116.387765, 39.912677, 61.22, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1997, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.70, 70.77, 0.850, 6.31, '2025-12-13 08:18:35', '0', 116.403063, 39.902962, 44.61, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1998, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.75, 84.43, 1.549, 5.78, '2025-12-13 07:18:35', '0', 116.402344, 39.909861, 49.31, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (1999, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.71, 79.40, 2.003, 6.51, '2025-12-13 06:18:35', '0', 116.393326, 39.919348, 51.71, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (2000, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.36, 69.40, 1.194, 6.40, '2025-12-13 05:18:35', '0', 116.391387, 39.899735, 46.43, '2026-01-19 17:18:34', NULL);
INSERT INTO `soil_data` VALUES (2001, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.39, 56.92, 1.184, 7.21, '2026-01-19 16:18:47', '0', 116.397695, 39.891799, 55.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2002, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.34, 61.56, 2.060, 7.28, '2026-01-19 15:18:47', '0', 116.413636, 39.905227, 61.57, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2003, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.48, 57.72, 1.127, 6.01, '2026-01-19 14:18:47', '0', 116.402746, 39.888852, 31.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2004, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.77, 51.32, 1.144, 6.47, '2026-01-19 13:18:47', '0', 116.384130, 39.929114, 37.35, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2005, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.88, 62.02, 1.211, 7.54, '2026-01-19 12:18:47', '0', 116.401554, 39.918036, 49.57, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2006, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.71, 64.92, 0.846, 5.97, '2026-01-19 11:18:47', '0', 116.426410, 39.911826, 42.57, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2007, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.02, 64.57, 1.033, 6.33, '2026-01-19 10:18:47', '0', 116.397792, 39.918439, 54.60, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2008, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.95, 72.33, 1.310, 5.42, '2026-01-19 09:18:47', '0', 116.399051, 39.915682, 68.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2009, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.33, 64.31, 1.579, 6.54, '2026-01-19 08:18:47', '0', 116.406655, 39.929198, 53.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2010, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.73, 72.50, 0.893, 6.63, '2026-01-19 07:18:47', '0', 116.407119, 39.904185, 26.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2011, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.18, 68.57, 1.670, 6.91, '2026-01-19 06:18:47', '0', 116.378930, 39.911866, 40.23, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2012, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.88, 65.94, 1.127, 6.25, '2026-01-19 05:18:47', '0', 116.392708, 39.901652, 64.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2013, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.32, 66.10, 0.600, 7.11, '2026-01-19 04:18:47', '0', 116.382536, 39.906354, 65.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2014, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.73, 70.93, 1.332, 6.48, '2026-01-19 03:18:47', '0', 116.404620, 39.913872, 52.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2015, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.37, 74.77, 1.085, 7.22, '2026-01-19 02:18:47', '0', 116.403516, 39.926278, 43.48, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2016, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.43, 60.62, 1.277, 6.45, '2026-01-19 01:18:47', '0', 116.394393, 39.907878, 44.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2017, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.71, 76.44, 1.386, 6.11, '2026-01-19 00:18:47', '0', 116.382030, 39.927836, 60.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2018, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.64, 69.00, 1.168, 6.45, '2026-01-18 23:18:47', '0', 116.393446, 39.902606, 58.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2019, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.60, 62.77, 1.025, 6.07, '2026-01-18 22:18:47', '0', 116.394797, 39.910636, 46.14, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2020, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.54, 78.39, 1.011, 6.18, '2026-01-18 21:18:47', '0', 116.394178, 39.905949, 55.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2021, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.98, 58.34, 0.898, 6.64, '2026-01-18 20:18:47', '0', 116.392954, 39.898938, 34.48, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2022, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.62, 68.84, 1.077, 6.37, '2026-01-18 19:18:47', '0', 116.385624, 39.918068, 40.64, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2023, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.61, 71.58, 1.262, 7.26, '2026-01-18 18:18:47', '0', 116.398121, 39.911910, 39.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2024, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.77, 79.73, 1.340, 5.82, '2026-01-18 17:18:47', '0', 116.388754, 39.892616, 66.29, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2025, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.58, 70.41, 0.945, 5.93, '2026-01-18 16:18:47', '0', 116.386610, 39.914697, 64.45, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2026, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.96, 73.93, 1.426, 6.61, '2026-01-18 15:18:47', '0', 116.416623, 39.888438, 48.60, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2027, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.78, 70.62, 1.855, 6.59, '2026-01-18 14:18:47', '0', 116.396711, 39.897831, 70.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2028, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.99, 73.46, 1.415, 6.20, '2026-01-18 13:18:47', '0', 116.395190, 39.922632, 41.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2029, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.93, 86.28, 1.733, 6.60, '2026-01-18 12:18:47', '0', 116.392612, 39.904548, 41.48, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2030, 'DEVICE_FIELD_003_001', 'FIELD_003', 34.25, 77.56, 1.200, 6.39, '2026-01-18 11:18:47', '0', 116.378315, 39.898501, 48.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2031, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.84, 82.33, 0.851, 5.67, '2026-01-18 10:18:47', '0', 116.403552, 39.911739, 50.98, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2032, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.32, 82.90, 1.364, 6.45, '2026-01-18 09:18:47', '0', 116.398100, 39.911843, 68.88, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2033, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.18, 81.49, 1.245, 6.39, '2026-01-18 08:18:47', '0', 116.385877, 39.889909, 62.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2034, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.74, 80.61, 1.444, 6.34, '2026-01-18 07:18:47', '0', 116.392536, 39.904612, 39.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2035, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.26, 78.35, 1.542, 6.96, '2026-01-18 06:18:47', '0', 116.391988, 39.915571, 41.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2036, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.54, 76.82, 0.540, 5.80, '2026-01-18 05:18:47', '0', 116.400491, 39.905209, 54.94, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2037, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.52, 78.09, 0.949, 6.69, '2026-01-18 04:18:47', '0', 116.397015, 39.901010, 55.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2038, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.85, 85.67, 1.345, 5.89, '2026-01-18 03:18:47', '0', 116.403492, 39.919176, 53.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2039, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.95, 82.66, 1.552, 5.99, '2026-01-18 02:18:47', '0', 116.394169, 39.912176, 41.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2040, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.20, 80.18, 1.032, 7.89, '2026-01-18 01:18:47', '0', 116.379024, 39.916865, 38.94, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2041, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.37, 71.25, 1.187, 6.53, '2026-01-18 00:18:47', '0', 116.382697, 39.898461, 50.98, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2042, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.80, 75.38, 1.059, 6.79, '2026-01-17 23:18:47', '0', 116.389051, 39.912116, 55.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2043, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.41, 74.96, 1.694, 7.29, '2026-01-17 22:18:47', '0', 116.396787, 39.906453, 51.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2044, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.97, 81.41, 1.434, 6.02, '2026-01-17 21:18:47', '0', 116.388062, 39.907588, 58.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2045, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.00, 74.04, 1.211, 5.39, '2026-01-17 20:18:47', '0', 116.416250, 39.888445, 47.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2046, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.41, 74.46, 0.796, 7.38, '2026-01-17 19:18:47', '0', 116.404489, 39.892465, 45.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2047, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.05, 89.35, 0.654, 6.55, '2026-01-17 18:18:47', '0', 116.390127, 39.911745, 21.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2048, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.70, 76.45, 1.515, 7.74, '2026-01-17 17:18:47', '0', 116.397204, 39.898079, 40.55, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2049, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.76, 76.66, 1.195, 6.00, '2026-01-17 16:18:47', '0', 116.386462, 39.914299, 49.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2050, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.38, 87.32, 0.994, 6.01, '2026-01-17 15:18:47', '0', 116.394791, 39.931164, 57.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2051, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.62, 79.10, 0.930, 6.21, '2026-01-17 14:18:47', '0', 116.402814, 39.926256, 57.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2052, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.46, 77.53, 0.942, 5.93, '2026-01-17 13:18:47', '0', 116.410439, 39.919697, 46.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2053, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.70, 78.16, 0.529, 7.17, '2026-01-17 12:18:47', '0', 116.393909, 39.911011, 40.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2054, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.16, 73.68, 1.290, 6.02, '2026-01-17 11:18:47', '0', 116.415004, 39.908385, 43.98, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2055, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.74, 75.27, 1.363, 6.87, '2026-01-17 10:18:47', '0', 116.395663, 39.919657, 43.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2056, 'DEVICE_FIELD_003_001', 'FIELD_003', 34.49, 83.70, 1.516, 6.02, '2026-01-17 09:18:47', '0', 116.404218, 39.906180, 37.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2057, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.04, 81.74, 0.950, 6.01, '2026-01-17 08:18:47', '0', 116.394161, 39.922913, 66.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2058, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.60, 74.73, 0.983, 7.28, '2026-01-17 07:18:47', '0', 116.397535, 39.901483, 44.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2059, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.54, 79.55, 1.184, 6.70, '2026-01-17 06:18:47', '0', 116.393773, 39.901979, 51.89, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2060, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.82, 76.39, 0.936, 6.63, '2026-01-17 05:18:47', '0', 116.405436, 39.918786, 53.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2061, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.54, 78.08, 1.025, 5.83, '2026-01-17 04:18:47', '0', 116.394906, 39.891328, 47.20, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2062, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.28, 75.76, 1.209, 6.54, '2026-01-17 03:18:47', '0', 116.393763, 39.907799, 47.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2063, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.82, 69.77, 1.799, 7.09, '2026-01-17 02:18:47', '0', 116.390323, 39.913219, 35.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2064, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.41, 80.18, 1.324, 6.52, '2026-01-17 01:18:47', '0', 116.393590, 39.906899, 44.48, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2065, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.40, 70.61, 0.968, 8.71, '2026-01-17 00:18:47', '0', 116.400396, 39.913239, 59.75, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2066, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.57, 76.95, 1.775, 7.21, '2026-01-16 23:18:47', '0', 116.394442, 39.910924, 55.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2067, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.24, 72.48, 1.566, 5.90, '2026-01-16 22:18:47', '0', 116.392754, 39.911964, 57.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2068, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.73, 67.22, 1.448, 6.53, '2026-01-16 21:18:47', '0', 116.393861, 39.908512, 60.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2069, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.74, 74.68, 1.838, 7.30, '2026-01-16 20:18:47', '0', 116.396985, 39.915348, 30.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2070, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.60, 71.28, 1.322, 6.79, '2026-01-16 19:18:47', '0', 116.412533, 39.906831, 46.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2071, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.13, 67.75, 0.944, 6.53, '2026-01-16 18:18:47', '0', 116.387738, 39.900599, 75.64, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2072, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.29, 61.41, 0.921, 6.70, '2026-01-16 17:18:47', '0', 116.415644, 39.904233, 45.67, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2073, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.22, 67.30, 2.000, 6.51, '2026-01-16 16:18:47', '0', 116.397709, 39.923572, 52.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2074, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.53, 69.94, 0.657, 6.19, '2026-01-16 15:18:47', '0', 116.384152, 39.926978, 42.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2075, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.04, 61.85, 1.290, 6.19, '2026-01-16 14:18:47', '0', 116.395300, 39.906793, 67.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2076, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.65, 71.39, 1.121, 7.09, '2026-01-16 13:18:47', '0', 116.404629, 39.904408, 40.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2077, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.26, 67.65, 0.775, 4.97, '2026-01-16 12:18:47', '0', 116.417461, 39.896974, 53.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2078, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.18, 66.79, 1.177, 6.32, '2026-01-16 11:18:47', '0', 116.401169, 39.912286, 33.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2079, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.99, 71.22, 1.159, 6.35, '2026-01-16 10:18:47', '0', 116.389225, 39.909013, 42.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2080, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.66, 59.67, 1.405, 6.08, '2026-01-16 09:18:47', '0', 116.382927, 39.913987, 55.75, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2081, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.07, 64.21, 1.495, 6.72, '2026-01-16 08:18:47', '0', 116.390228, 39.899256, 59.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2082, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.03, 55.06, 1.098, 6.42, '2026-01-16 07:18:47', '0', 116.396266, 39.882360, 55.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2083, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.61, 59.03, 1.558, 5.57, '2026-01-16 06:18:47', '0', 116.415600, 39.915765, 43.46, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2084, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.97, 61.38, 1.413, 5.74, '2026-01-16 05:18:47', '0', 116.404967, 39.905889, 53.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2085, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.36, 53.04, 1.532, 6.57, '2026-01-16 04:18:47', '0', 116.390622, 39.913279, 43.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2086, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.56, 60.41, 0.890, 5.79, '2026-01-16 03:18:47', '0', 116.406228, 39.925937, 53.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2087, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.43, 58.63, 1.187, 6.43, '2026-01-16 02:18:47', '0', 116.401665, 39.895967, 33.63, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2088, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.88, 54.47, 1.163, 6.16, '2026-01-16 01:18:47', '0', 116.381073, 39.906744, 39.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2089, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.36, 58.38, 1.287, 6.34, '2026-01-16 00:18:47', '0', 116.384972, 39.912022, 40.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2090, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.36, 53.26, 0.654, 6.60, '2026-01-15 23:18:47', '0', 116.396604, 39.905850, 54.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2091, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.75, 61.61, 1.020, 6.55, '2026-01-15 22:18:47', '0', 116.401398, 39.901968, 40.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2092, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.30, 61.09, 1.155, 6.84, '2026-01-15 21:18:47', '0', 116.386562, 39.910981, 26.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2093, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.30, 50.79, 1.829, 6.70, '2026-01-15 20:18:47', '0', 116.400556, 39.906995, 64.98, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2094, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.83, 56.19, 1.240, 6.48, '2026-01-15 19:18:47', '0', 116.390036, 39.910649, 23.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2095, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.74, 42.66, 1.045, 6.50, '2026-01-15 18:18:47', '0', 116.405453, 39.911672, 57.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2096, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.84, 49.34, 0.911, 7.30, '2026-01-15 17:18:47', '0', 116.414347, 39.909484, 57.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2097, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.58, 53.94, 1.476, 6.86, '2026-01-15 16:18:47', '0', 116.390532, 39.901927, 68.62, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2098, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.37, 46.10, 1.261, 6.36, '2026-01-15 15:18:47', '0', 116.389436, 39.914951, 41.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2099, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.67, 48.14, 1.009, 6.64, '2026-01-15 14:18:47', '0', 116.392350, 39.897254, 59.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2100, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.94, 44.33, 1.545, 6.70, '2026-01-15 13:18:47', '0', 116.384122, 39.902616, 57.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2101, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.93, 45.62, 0.727, 6.68, '2026-01-15 12:18:47', '0', 116.412997, 39.916325, 52.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2102, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.28, 42.32, 0.817, 6.48, '2026-01-15 11:18:47', '0', 116.403900, 39.903902, 39.33, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2103, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.42, 48.80, 1.527, 6.91, '2026-01-15 10:18:47', '0', 116.397489, 39.912357, 63.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2104, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.18, 48.37, 0.957, 6.42, '2026-01-15 09:18:47', '0', 116.393783, 39.908668, 44.06, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2105, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.97, 40.43, 1.174, 6.84, '2026-01-15 08:18:47', '0', 116.376329, 39.916977, 45.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2106, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.43, 44.78, 0.969, 6.72, '2026-01-15 07:18:47', '0', 116.405184, 39.907129, 46.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2107, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.18, 40.57, 1.404, 7.00, '2026-01-15 06:18:47', '0', 116.393351, 39.893555, 61.20, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2108, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.73, 44.55, 1.274, 6.34, '2026-01-15 05:18:47', '0', 116.385265, 39.913445, 67.77, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2109, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.52, 34.42, 1.316, 6.75, '2026-01-15 04:18:47', '0', 116.407605, 39.924566, 61.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2110, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.17, 42.25, 1.363, 6.80, '2026-01-15 03:18:47', '0', 116.388977, 39.901642, 43.12, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2111, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.78, 45.18, 1.372, 6.52, '2026-01-15 02:18:47', '0', 116.399152, 39.917225, 50.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2112, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.16, 43.75, 1.245, 7.09, '2026-01-15 01:18:47', '0', 116.406951, 39.918262, 51.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2113, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.81, 41.92, 1.503, 5.79, '2026-01-15 00:18:47', '0', 116.389697, 39.907779, 74.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2114, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.44, 54.16, 1.356, 7.44, '2026-01-14 23:18:47', '0', 116.389111, 39.903546, 31.41, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2115, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.54, 41.99, 1.129, 6.21, '2026-01-14 22:18:47', '0', 116.401203, 39.915285, 49.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2116, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.69, 47.38, 0.991, 7.33, '2026-01-14 21:18:47', '0', 116.400307, 39.908817, 38.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2117, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.26, 38.57, 0.804, 6.47, '2026-01-14 20:18:47', '0', 116.411367, 39.896197, 48.62, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2118, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.27, 49.17, 0.843, 6.84, '2026-01-14 19:18:47', '0', 116.408836, 39.924383, 43.20, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2119, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.99, 40.06, 1.257, 6.09, '2026-01-14 18:18:47', '0', 116.398108, 39.921029, 51.46, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2120, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.36, 36.80, 0.701, 7.07, '2026-01-14 17:18:47', '0', 116.384182, 39.902767, 57.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2121, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.23, 34.15, 1.227, 7.61, '2026-01-14 16:18:47', '0', 116.406467, 39.910620, 57.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2122, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.71, 41.43, 0.980, 5.81, '2026-01-14 15:18:47', '0', 116.402284, 39.893417, 31.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2123, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.73, 42.64, 1.010, 6.90, '2026-01-14 14:18:47', '0', 116.388878, 39.897907, 34.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2124, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.54, 41.00, 1.129, 6.91, '2026-01-14 13:18:47', '0', 116.409601, 39.918272, 44.31, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2125, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.13, 44.94, 1.445, 6.45, '2026-01-14 12:18:47', '0', 116.399965, 39.916644, 40.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2126, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.77, 36.27, 1.130, 6.29, '2026-01-14 11:18:47', '0', 116.377024, 39.907056, 48.73, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2127, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.05, 46.99, 1.199, 6.31, '2026-01-14 10:18:47', '0', 116.400905, 39.916996, 49.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2128, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.71, 34.55, 1.193, 6.12, '2026-01-14 09:18:47', '0', 116.383979, 39.906098, 26.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2129, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.41, 42.74, 1.258, 6.01, '2026-01-14 08:18:47', '0', 116.403996, 39.892438, 45.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2130, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.53, 44.66, 0.950, 6.83, '2026-01-14 07:18:47', '0', 116.385467, 39.906517, 59.07, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2131, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.99, 33.31, 1.544, 6.17, '2026-01-14 06:18:47', '0', 116.387645, 39.903834, 51.46, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2132, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.61, 34.95, 1.358, 6.70, '2026-01-14 05:18:47', '0', 116.406040, 39.891558, 70.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2133, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.02, 40.60, 1.005, 7.25, '2026-01-14 04:18:47', '0', 116.398347, 39.916723, 51.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2134, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.90, 39.62, 1.163, 6.81, '2026-01-14 03:18:47', '0', 116.401565, 39.908156, 62.87, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2135, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.00, 34.21, 0.910, 5.30, '2026-01-14 02:18:47', '0', 116.400392, 39.916027, 50.89, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2136, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.18, 30.55, 1.755, 6.96, '2026-01-14 01:18:47', '0', 116.402061, 39.921398, 46.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2137, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.54, 41.85, 1.513, 6.53, '2026-01-14 00:18:47', '0', 116.403803, 39.913503, 61.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2138, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.65, 47.09, 1.278, 6.26, '2026-01-13 23:18:47', '0', 116.397334, 39.913764, 44.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2139, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.48, 40.59, 1.066, 5.83, '2026-01-13 22:18:47', '0', 116.386749, 39.901977, 50.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2140, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.13, 45.18, 1.400, 6.49, '2026-01-13 21:18:47', '0', 116.389657, 39.890890, 57.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2141, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.18, 37.73, 0.759, 6.39, '2026-01-13 20:18:47', '0', 116.399627, 39.906926, 57.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2142, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.71, 35.81, 1.214, 6.85, '2026-01-13 19:18:47', '0', 116.402616, 39.910330, 56.55, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2143, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.78, 39.46, 1.165, 5.75, '2026-01-13 18:18:47', '0', 116.381688, 39.922396, 44.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2144, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.32, 48.37, 0.967, 5.64, '2026-01-13 17:18:47', '0', 116.395992, 39.895903, 63.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2145, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.42, 55.26, 0.638, 6.75, '2026-01-13 16:18:47', '0', 116.384954, 39.924009, 45.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2146, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.07, 44.99, 0.841, 7.23, '2026-01-13 15:18:47', '0', 116.420339, 39.923662, 72.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2147, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.56, 44.24, 0.881, 6.43, '2026-01-13 14:18:47', '0', 116.408895, 39.911018, 58.23, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2148, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.05, 43.05, 1.726, 7.34, '2026-01-13 13:18:47', '0', 116.390989, 39.901678, 62.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2149, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.09, 43.19, 1.174, 6.43, '2026-01-13 12:18:47', '0', 116.391043, 39.897177, 50.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2150, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.90, 40.22, 1.230, 6.73, '2026-01-13 11:18:47', '0', 116.397967, 39.912803, 56.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2151, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.45, 38.59, 1.014, 6.96, '2026-01-13 10:18:47', '0', 116.407583, 39.920131, 41.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2152, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.71, 57.18, 1.196, 5.89, '2026-01-13 09:18:47', '0', 116.393559, 39.917096, 34.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2153, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.50, 45.59, 1.206, 6.10, '2026-01-13 08:18:47', '0', 116.401633, 39.891245, 48.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2154, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.51, 42.32, 1.857, 6.76, '2026-01-13 07:18:47', '0', 116.396353, 39.898023, 59.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2155, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.65, 42.71, 1.166, 6.04, '2026-01-13 06:18:47', '0', 116.395736, 39.911066, 45.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2156, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.40, 51.02, 1.416, 7.38, '2026-01-13 05:18:47', '0', 116.392240, 39.903161, 31.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2157, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.34, 55.05, 1.697, 6.25, '2026-01-13 04:18:47', '0', 116.400210, 39.897877, 53.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2158, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.87, 40.43, 0.614, 5.79, '2026-01-13 03:18:47', '0', 116.387627, 39.921565, 74.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2159, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.09, 60.53, 1.439, 6.43, '2026-01-13 02:18:47', '0', 116.392077, 39.908696, 56.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2160, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.28, 54.63, 0.887, 6.00, '2026-01-13 01:18:47', '0', 116.403625, 39.915343, 52.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2161, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.62, 51.54, 1.001, 6.55, '2026-01-13 00:18:47', '0', 116.392638, 39.922584, 56.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2162, 'DEVICE_FIELD_003_001', 'FIELD_003', 6.69, 65.60, 1.585, 7.01, '2026-01-12 23:18:47', '0', 116.381262, 39.898904, 41.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2163, 'DEVICE_FIELD_003_001', 'FIELD_003', 5.71, 49.19, 1.236, 6.57, '2026-01-12 22:18:47', '0', 116.394973, 39.903618, 54.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2164, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.42, 57.41, 1.290, 6.65, '2026-01-12 21:18:47', '0', 116.384530, 39.905001, 46.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2165, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.72, 49.83, 1.230, 6.42, '2026-01-12 20:18:47', '0', 116.402172, 39.904364, 46.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2166, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.78, 61.79, 1.501, 6.27, '2026-01-12 19:18:47', '0', 116.395297, 39.920251, 46.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2167, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.91, 55.34, 2.006, 6.29, '2026-01-12 18:18:47', '0', 116.392841, 39.886568, 58.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2168, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.21, 65.17, 1.281, 6.65, '2026-01-12 17:18:47', '0', 116.401433, 39.927207, 48.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2169, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.23, 55.72, 1.109, 6.70, '2026-01-12 16:18:47', '0', 116.394938, 39.898093, 63.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2170, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.30, 66.70, 1.186, 6.35, '2026-01-12 15:18:47', '0', 116.398172, 39.921442, 54.51, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2171, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.43, 60.72, 1.262, 6.16, '2026-01-12 14:18:47', '0', 116.400210, 39.894115, 58.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2172, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.82, 70.13, 1.114, 6.57, '2026-01-12 13:18:47', '0', 116.388533, 39.900514, 65.75, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2173, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.45, 70.38, 1.357, 7.26, '2026-01-12 12:18:47', '0', 116.407532, 39.903731, 56.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2174, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.66, 66.45, 1.062, 5.53, '2026-01-12 11:18:47', '0', 116.393043, 39.917601, 34.60, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2175, 'DEVICE_FIELD_003_001', 'FIELD_003', 35.16, 74.21, 1.333, 6.54, '2026-01-12 10:18:47', '0', 116.406492, 39.910791, 41.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2176, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.92, 70.45, 1.388, 7.74, '2026-01-12 09:18:47', '0', 116.401113, 39.913178, 35.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2177, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.75, 69.37, 1.434, 6.79, '2026-01-12 08:18:47', '0', 116.392193, 39.919113, 45.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2178, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.46, 66.08, 1.365, 6.35, '2026-01-12 07:18:47', '0', 116.407233, 39.910653, 46.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2179, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.87, 67.15, 0.855, 6.31, '2026-01-12 06:18:47', '0', 116.398523, 39.911751, 50.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2180, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.13, 67.48, 1.371, 6.12, '2026-01-12 05:18:47', '0', 116.420546, 39.901018, 52.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2181, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.55, 74.59, 0.894, 6.12, '2026-01-12 04:18:47', '0', 116.402655, 39.902854, 43.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2182, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.02, 72.71, 1.147, 6.88, '2026-01-12 03:18:47', '0', 116.410427, 39.916106, 55.14, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2183, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.90, 65.82, 0.750, 7.42, '2026-01-12 02:18:47', '0', 116.391590, 39.906534, 42.87, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2184, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.66, 72.63, 0.984, 6.71, '2026-01-12 01:18:47', '0', 116.386500, 39.911678, 57.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2185, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.91, 67.44, 0.958, 7.02, '2026-01-12 00:18:47', '0', 116.399532, 39.910033, 39.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2186, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.11, 72.01, 1.532, 6.69, '2026-01-11 23:18:47', '0', 116.414588, 39.907070, 42.88, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2187, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.53, 64.80, 1.447, 6.91, '2026-01-11 22:18:47', '0', 116.391768, 39.895494, 37.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2188, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.87, 73.32, 1.267, 6.89, '2026-01-11 21:18:47', '0', 116.376639, 39.893660, 41.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2189, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.71, 76.05, 0.990, 6.07, '2026-01-11 20:18:47', '0', 116.406536, 39.906926, 51.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2190, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.15, 71.26, 0.819, 6.83, '2026-01-11 19:18:47', '0', 116.411569, 39.921151, 50.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2191, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.56, 69.89, 1.019, 5.18, '2026-01-11 18:18:47', '0', 116.388381, 39.903589, 44.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2192, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.75, 86.40, 0.994, 5.83, '2026-01-11 17:18:47', '0', 116.402514, 39.891928, 40.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2193, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.43, 77.40, 1.350, 6.74, '2026-01-11 16:18:47', '0', 116.396992, 39.910989, 21.14, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2194, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.84, 75.61, 1.256, 6.87, '2026-01-11 15:18:47', '0', 116.383989, 39.882586, 55.98, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2195, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.52, 78.89, 1.396, 6.61, '2026-01-11 14:18:47', '0', 116.387909, 39.917988, 49.33, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2196, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.04, 79.08, 1.123, 6.95, '2026-01-11 13:18:47', '0', 116.383391, 39.913211, 49.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2197, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.05, 73.43, 1.239, 5.80, '2026-01-11 12:18:47', '0', 116.385564, 39.912419, 45.22, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2198, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.89, 75.06, 1.166, 5.95, '2026-01-11 11:18:47', '0', 116.414204, 39.895603, 58.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2199, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.02, 74.13, 1.148, 6.26, '2026-01-11 10:18:47', '0', 116.410968, 39.909059, 44.78, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2200, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.67, 75.13, 0.804, 5.63, '2026-01-11 09:18:47', '0', 116.397691, 39.917258, 58.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2201, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.81, 80.33, 0.798, 6.19, '2026-01-11 08:18:47', '0', 116.394890, 39.905096, 47.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2202, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.11, 81.02, 1.817, 6.75, '2026-01-11 07:18:47', '0', 116.380873, 39.930933, 41.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2203, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.76, 75.03, 1.318, 6.86, '2026-01-11 06:18:47', '0', 116.389445, 39.904343, 60.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2204, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.65, 79.77, 0.943, 5.57, '2026-01-11 05:18:47', '0', 116.404050, 39.923993, 52.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2205, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.61, 72.43, 1.111, 6.50, '2026-01-11 04:18:47', '0', 116.404194, 39.915957, 49.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2206, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.99, 73.43, 0.989, 6.13, '2026-01-11 03:18:47', '0', 116.397874, 39.903695, 59.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2207, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.29, 75.96, 0.698, 6.50, '2026-01-11 02:18:47', '0', 116.383622, 39.911363, 53.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2208, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.67, 91.12, 1.273, 5.74, '2026-01-11 01:18:47', '0', 116.395200, 39.905652, 33.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2209, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.34, 78.58, 0.787, 6.19, '2026-01-11 00:18:47', '0', 116.400046, 39.892865, 37.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2210, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.61, 81.77, 1.456, 6.65, '2026-01-10 23:18:47', '0', 116.384579, 39.896287, 35.64, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2211, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.11, 82.44, 1.314, 6.53, '2026-01-10 22:18:47', '0', 116.379668, 39.899815, 45.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2212, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.08, 76.06, 1.484, 6.22, '2026-01-10 21:18:47', '0', 116.391800, 39.907561, 47.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2213, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.67, 71.66, 1.204, 7.35, '2026-01-10 20:18:47', '0', 116.399802, 39.919762, 55.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2214, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.81, 76.47, 1.686, 6.05, '2026-01-10 19:18:47', '0', 116.407612, 39.908264, 39.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2215, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.19, 76.25, 1.466, 6.07, '2026-01-10 18:18:47', '0', 116.385934, 39.912953, 48.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2216, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.15, 81.36, 1.705, 6.53, '2026-01-10 17:18:47', '0', 116.387891, 39.925469, 44.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2217, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.01, 75.53, 0.965, 6.28, '2026-01-10 16:18:47', '0', 116.401227, 39.918488, 61.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2218, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.55, 80.44, 1.138, 5.83, '2026-01-10 15:18:47', '0', 116.372765, 39.906380, 56.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2219, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.71, 75.58, 1.607, 6.34, '2026-01-10 14:18:47', '0', 116.402406, 39.888684, 62.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2220, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.36, 75.82, 1.329, 6.73, '2026-01-10 13:18:47', '0', 116.400246, 39.898142, 71.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2221, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.16, 80.61, 1.268, 7.42, '2026-01-10 12:18:47', '0', 116.401630, 39.913065, 51.41, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2222, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.71, 83.14, 1.129, 4.77, '2026-01-10 11:18:47', '0', 116.384189, 39.903144, 49.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2223, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.79, 74.12, 1.041, 6.55, '2026-01-10 10:18:47', '0', 116.387089, 39.887277, 44.20, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2224, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.95, 84.88, 1.075, 7.29, '2026-01-10 09:18:47', '0', 116.401612, 39.923104, 53.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2225, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.56, 81.27, 1.128, 6.83, '2026-01-10 08:18:47', '0', 116.389077, 39.924807, 69.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2226, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.61, 74.08, 1.126, 6.96, '2026-01-10 07:18:47', '0', 116.386870, 39.927302, 41.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2227, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.40, 71.64, 1.105, 6.39, '2026-01-10 06:18:47', '0', 116.399539, 39.901358, 50.20, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2228, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.00, 80.70, 1.046, 7.13, '2026-01-10 05:18:47', '0', 116.389186, 39.914478, 49.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2229, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.09, 67.31, 1.444, 6.52, '2026-01-10 04:18:47', '0', 116.392039, 39.921647, 41.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2230, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.22, 79.11, 1.277, 6.88, '2026-01-10 03:18:47', '0', 116.404916, 39.899232, 35.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2231, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.52, 79.86, 0.598, 5.73, '2026-01-10 02:18:47', '0', 116.389283, 39.908414, 43.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2232, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.90, 76.71, 1.020, 6.30, '2026-01-10 01:18:47', '0', 116.409639, 39.924574, 48.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2233, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.20, 69.21, 1.347, 6.45, '2026-01-10 00:18:47', '0', 116.395718, 39.915217, 49.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2234, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.58, 76.69, 0.700, 6.36, '2026-01-09 23:18:47', '0', 116.382477, 39.903177, 79.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2235, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.44, 69.21, 0.980, 6.40, '2026-01-09 22:18:47', '0', 116.402044, 39.918160, 57.23, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2236, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.83, 70.08, 0.755, 6.40, '2026-01-09 21:18:47', '0', 116.398377, 39.909342, 48.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2237, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.85, 70.06, 1.027, 7.06, '2026-01-09 20:18:47', '0', 116.402530, 39.917226, 39.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2238, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.11, 68.37, 1.394, 6.64, '2026-01-09 19:18:47', '0', 116.385820, 39.903937, 43.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2239, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.59, 77.50, 1.214, 6.63, '2026-01-09 18:18:47', '0', 116.381286, 39.908709, 28.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2240, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.14, 74.48, 1.170, 6.04, '2026-01-09 17:18:47', '0', 116.389211, 39.914724, 55.75, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2241, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.89, 59.10, 1.040, 7.27, '2026-01-09 16:18:47', '0', 116.401159, 39.924975, 61.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2242, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.09, 61.45, 1.079, 6.31, '2026-01-09 15:18:47', '0', 116.383985, 39.890220, 42.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2243, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.25, 65.73, 0.855, 5.72, '2026-01-09 14:18:47', '0', 116.400461, 39.888444, 37.26, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2244, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.00, 68.60, 1.511, 6.01, '2026-01-09 13:18:47', '0', 116.377775, 39.882576, 61.62, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2245, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.83, 68.79, 1.602, 6.41, '2026-01-09 12:18:47', '0', 116.411560, 39.912091, 44.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2246, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.36, 65.01, 0.599, 6.23, '2026-01-09 11:18:47', '0', 116.393639, 39.925511, 35.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2247, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.50, 76.62, 1.379, 5.96, '2026-01-09 10:18:47', '0', 116.395265, 39.907461, 40.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2248, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.81, 67.67, 0.559, 6.44, '2026-01-09 09:18:47', '0', 116.401212, 39.898244, 55.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2249, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.88, 66.93, 1.094, 6.75, '2026-01-09 08:18:47', '0', 116.407273, 39.907869, 39.48, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2250, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.19, 57.59, 1.152, 6.21, '2026-01-09 07:18:47', '0', 116.387080, 39.906501, 39.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2251, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.04, 58.67, 1.306, 5.32, '2026-01-09 06:18:47', '0', 116.396439, 39.902590, 46.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2252, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.82, 63.08, 1.849, 6.02, '2026-01-09 05:18:47', '0', 116.402262, 39.936769, 56.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2253, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.04, 59.66, 1.262, 6.87, '2026-01-09 04:18:47', '0', 116.401092, 39.917701, 54.88, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2254, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.42, 50.45, 1.283, 6.44, '2026-01-09 03:18:47', '0', 116.421671, 39.909825, 54.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2255, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.43, 60.42, 1.411, 6.80, '2026-01-09 02:18:47', '0', 116.407072, 39.914045, 37.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2256, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.02, 58.06, 0.773, 6.79, '2026-01-09 01:18:47', '0', 116.408564, 39.905745, 48.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2257, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.87, 60.60, 1.367, 6.02, '2026-01-09 00:18:47', '0', 116.379805, 39.909235, 27.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2258, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.97, 50.45, 0.657, 6.60, '2026-01-08 23:18:47', '0', 116.404658, 39.932882, 42.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2259, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.42, 59.92, 0.785, 6.28, '2026-01-08 22:18:47', '0', 116.405549, 39.903038, 44.55, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2260, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.06, 58.33, 1.386, 6.05, '2026-01-08 21:18:47', '0', 116.389276, 39.893500, 59.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2261, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.21, 50.98, 1.088, 5.03, '2026-01-08 20:18:47', '0', 116.383071, 39.907803, 46.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2262, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.27, 50.81, 1.141, 5.94, '2026-01-08 19:18:47', '0', 116.395081, 39.904088, 54.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2263, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.02, 53.26, 1.443, 7.25, '2026-01-08 18:18:47', '0', 116.406597, 39.896645, 35.73, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2264, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.91, 48.54, 1.402, 7.07, '2026-01-08 17:18:47', '0', 116.401852, 39.903758, 45.07, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2265, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.70, 61.05, 1.411, 6.52, '2026-01-08 16:18:47', '0', 116.385774, 39.897807, 51.45, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2266, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.94, 45.95, 0.769, 6.36, '2026-01-08 15:18:47', '0', 116.396631, 39.913794, 55.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2267, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.82, 46.05, 0.971, 6.46, '2026-01-08 14:18:47', '0', 116.382009, 39.920029, 42.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2268, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.60, 44.77, 1.350, 6.19, '2026-01-08 13:18:47', '0', 116.384817, 39.904597, 44.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2269, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.30, 50.84, 1.229, 6.93, '2026-01-08 12:18:47', '0', 116.385062, 39.903842, 55.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2270, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.35, 53.50, 1.339, 6.20, '2026-01-08 11:18:47', '0', 116.407547, 39.918673, 41.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2271, 'DEVICE_FIELD_003_001', 'FIELD_003', 33.78, 46.11, 1.023, 6.33, '2026-01-08 10:18:47', '0', 116.391827, 39.912769, 38.26, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2272, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.26, 43.22, 1.165, 6.22, '2026-01-08 09:18:47', '0', 116.398642, 39.910199, 55.78, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2273, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.14, 49.38, 1.738, 5.11, '2026-01-08 08:18:47', '0', 116.409897, 39.911298, 37.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2274, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.55, 46.29, 1.273, 7.41, '2026-01-08 07:18:47', '0', 116.400684, 39.902404, 32.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2275, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.91, 46.30, 1.302, 6.51, '2026-01-08 06:18:47', '0', 116.395034, 39.915005, 43.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2276, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.58, 38.41, 1.222, 6.54, '2026-01-08 05:18:47', '0', 116.390916, 39.908893, 37.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2277, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.74, 44.39, 2.147, 6.02, '2026-01-08 04:18:47', '0', 116.397493, 39.924024, 43.89, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2278, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.88, 34.29, 0.721, 6.44, '2026-01-08 03:18:47', '0', 116.386735, 39.923610, 55.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2279, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.63, 43.40, 0.915, 6.00, '2026-01-08 02:18:47', '0', 116.399271, 39.902099, 49.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2280, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.22, 42.95, 1.112, 6.13, '2026-01-08 01:18:47', '0', 116.395001, 39.901341, 48.87, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2281, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.97, 40.12, 1.278, 6.02, '2026-01-08 00:18:47', '0', 116.409673, 39.904489, 32.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2282, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.03, 50.36, 0.718, 6.60, '2026-01-07 23:18:47', '0', 116.399957, 39.916130, 64.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2283, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.47, 42.33, 1.434, 6.85, '2026-01-07 22:18:47', '0', 116.413009, 39.911180, 45.41, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2284, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.58, 34.21, 1.319, 5.70, '2026-01-07 21:18:47', '0', 116.393530, 39.919572, 58.23, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2285, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.38, 37.92, 1.092, 5.72, '2026-01-07 20:18:47', '0', 116.399749, 39.894898, 59.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2286, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.18, 42.65, 0.621, 6.13, '2026-01-07 19:18:47', '0', 116.401612, 39.896358, 43.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2287, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.63, 41.93, 1.362, 6.51, '2026-01-07 18:18:47', '0', 116.413993, 39.914355, 54.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2288, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.02, 45.98, 1.484, 7.12, '2026-01-07 17:18:47', '0', 116.422230, 39.918485, 49.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2289, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.26, 37.33, 1.136, 5.79, '2026-01-07 16:18:47', '0', 116.407852, 39.911656, 49.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2290, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.28, 33.68, 1.208, 6.13, '2026-01-07 15:18:47', '0', 116.398064, 39.912261, 44.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2291, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.77, 36.95, 1.422, 6.14, '2026-01-07 14:18:47', '0', 116.389813, 39.912196, 58.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2292, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.69, 43.90, 1.427, 5.76, '2026-01-07 13:18:47', '0', 116.403575, 39.916144, 47.06, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2293, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.98, 41.12, 1.134, 6.50, '2026-01-07 12:18:47', '0', 116.389098, 39.916308, 68.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2294, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.35, 32.84, 1.422, 5.37, '2026-01-07 11:18:47', '0', 116.404326, 39.908181, 61.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2295, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.62, 45.58, 0.977, 5.45, '2026-01-07 10:18:47', '0', 116.375267, 39.919422, 62.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2296, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.82, 39.18, 1.179, 6.18, '2026-01-07 09:18:47', '0', 116.394946, 39.908089, 58.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2297, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.04, 37.76, 1.773, 7.24, '2026-01-07 08:18:47', '0', 116.404704, 39.917568, 60.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2298, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.02, 41.53, 1.054, 6.66, '2026-01-07 07:18:47', '0', 116.405504, 39.900146, 51.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2299, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.03, 40.78, 0.891, 6.33, '2026-01-07 06:18:47', '0', 116.400768, 39.897943, 50.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2300, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.96, 38.73, 1.651, 5.81, '2026-01-07 05:18:47', '0', 116.381644, 39.898490, 47.94, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2301, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.29, 42.34, 0.962, 5.55, '2026-01-07 04:18:47', '0', 116.390169, 39.929392, 67.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2302, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.94, 38.82, 1.125, 7.05, '2026-01-07 03:18:47', '0', 116.397720, 39.910208, 45.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2303, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.48, 37.13, 0.972, 6.07, '2026-01-07 02:18:47', '0', 116.382954, 39.903289, 35.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2304, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.21, 47.22, 1.316, 6.12, '2026-01-07 01:18:47', '0', 116.400633, 39.886020, 51.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2305, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.53, 49.31, 0.801, 6.06, '2026-01-07 00:18:47', '0', 116.396681, 39.907716, 48.67, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2306, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.24, 39.39, 1.570, 5.30, '2026-01-06 23:18:47', '0', 116.402756, 39.908317, 56.98, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2307, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.13, 42.96, 1.159, 7.20, '2026-01-06 22:18:47', '0', 116.417665, 39.907633, 47.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2308, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.08, 37.03, 1.732, 6.36, '2026-01-06 21:18:47', '0', 116.401163, 39.936923, 54.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2309, 'DEVICE_FIELD_003_001', 'FIELD_003', 6.51, 51.84, 1.802, 5.87, '2026-01-06 20:18:47', '0', 116.398591, 39.908959, 45.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2310, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.64, 34.00, 0.767, 5.74, '2026-01-06 19:18:47', '0', 116.410113, 39.902016, 62.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2311, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.93, 43.84, 0.692, 6.23, '2026-01-06 18:18:47', '0', 116.399386, 39.920426, 58.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2312, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.25, 48.60, 0.925, 6.42, '2026-01-06 17:18:47', '0', 116.403354, 39.904450, 43.29, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2313, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.16, 40.73, 0.760, 6.66, '2026-01-06 16:18:47', '0', 116.408688, 39.938395, 44.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2314, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.23, 45.09, 1.427, 6.40, '2026-01-06 15:18:47', '0', 116.400100, 39.919750, 48.06, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2315, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.87, 43.82, 1.107, 7.44, '2026-01-06 14:18:47', '0', 116.389631, 39.915169, 39.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2316, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.17, 52.02, 1.188, 6.25, '2026-01-06 13:18:47', '0', 116.387463, 39.914820, 42.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2317, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.07, 43.81, 0.933, 6.72, '2026-01-06 12:18:47', '0', 116.429312, 39.912332, 67.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2318, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.67, 45.16, 1.351, 5.61, '2026-01-06 11:18:47', '0', 116.405275, 39.895694, 49.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2319, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.71, 47.64, 1.262, 5.63, '2026-01-06 10:18:47', '0', 116.393320, 39.903025, 62.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2320, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.74, 48.41, 1.342, 6.15, '2026-01-06 09:18:47', '0', 116.395668, 39.903346, 40.35, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2321, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.06, 50.47, 1.211, 6.46, '2026-01-06 08:18:47', '0', 116.390253, 39.898863, 22.46, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2322, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.10, 48.96, 1.013, 6.73, '2026-01-06 07:18:47', '0', 116.409755, 39.913047, 39.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2323, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.36, 55.28, 0.840, 6.32, '2026-01-06 06:18:47', '0', 116.384302, 39.921989, 50.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2324, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.47, 44.93, 1.638, 6.25, '2026-01-06 05:18:47', '0', 116.412937, 39.906627, 34.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2325, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.30, 47.97, 0.784, 6.70, '2026-01-06 04:18:47', '0', 116.392010, 39.902673, 33.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2326, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.27, 58.20, 1.570, 5.92, '2026-01-06 03:18:47', '0', 116.411527, 39.910842, 62.75, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2327, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.30, 50.63, 1.110, 6.65, '2026-01-06 02:18:47', '0', 116.389655, 39.919105, 51.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2328, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.05, 53.99, 1.176, 6.42, '2026-01-06 01:18:47', '0', 116.383574, 39.889259, 35.64, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2329, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.88, 49.47, 1.334, 6.78, '2026-01-06 00:18:47', '0', 116.392414, 39.917064, 50.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2330, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.57, 46.82, 0.618, 6.93, '2026-01-05 23:18:47', '0', 116.417048, 39.910448, 50.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2331, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.84, 47.80, 0.529, 6.79, '2026-01-05 22:18:47', '0', 116.397553, 39.903347, 54.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2332, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.66, 56.74, 0.792, 6.77, '2026-01-05 21:18:47', '0', 116.394286, 39.909772, 47.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2333, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.66, 54.32, 1.445, 6.39, '2026-01-05 20:18:47', '0', 116.400850, 39.917793, 50.22, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2334, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.14, 60.11, 1.536, 5.61, '2026-01-05 19:18:47', '0', 116.393294, 39.916224, 55.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2335, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.73, 56.56, 1.217, 5.28, '2026-01-05 18:18:47', '0', 116.395175, 39.908862, 37.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2336, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.91, 53.88, 2.053, 6.49, '2026-01-05 17:18:47', '0', 116.409109, 39.910246, 35.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2337, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.07, 69.27, 1.092, 7.70, '2026-01-05 16:18:47', '0', 116.408535, 39.905597, 47.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2338, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.63, 62.41, 1.410, 6.54, '2026-01-05 15:18:47', '0', 116.399532, 39.915674, 61.75, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2339, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.60, 60.65, 1.732, 6.80, '2026-01-05 14:18:47', '0', 116.395628, 39.909208, 51.48, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2340, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.99, 68.35, 1.151, 5.82, '2026-01-05 13:18:47', '0', 116.410713, 39.892393, 36.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2341, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.31, 61.22, 1.139, 5.85, '2026-01-05 12:18:47', '0', 116.413371, 39.892082, 51.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2342, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.74, 65.95, 1.180, 6.74, '2026-01-05 11:18:47', '0', 116.383582, 39.892987, 55.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2343, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.66, 67.99, 1.031, 7.06, '2026-01-05 10:18:47', '0', 116.406564, 39.918341, 42.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2344, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.92, 62.87, 1.378, 6.19, '2026-01-05 09:18:47', '0', 116.388124, 39.904756, 57.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2345, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.30, 67.86, 1.515, 6.27, '2026-01-05 08:18:47', '0', 116.399678, 39.906780, 45.12, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2346, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.61, 57.14, 0.981, 5.87, '2026-01-05 07:18:47', '0', 116.391684, 39.902168, 60.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2347, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.66, 64.09, 1.254, 6.78, '2026-01-05 06:18:47', '0', 116.394946, 39.920887, 47.77, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2348, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.23, 68.70, 1.356, 6.16, '2026-01-05 05:18:47', '0', 116.400042, 39.908516, 55.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2349, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.51, 72.41, 0.945, 6.14, '2026-01-05 04:18:47', '0', 116.379672, 39.896999, 59.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2350, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.54, 65.97, 1.251, 6.69, '2026-01-05 03:18:47', '0', 116.407243, 39.911910, 57.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2351, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.10, 67.28, 1.237, 6.78, '2026-01-05 02:18:47', '0', 116.397771, 39.887070, 55.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2352, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.74, 65.29, 1.208, 5.80, '2026-01-05 01:18:47', '0', 116.385038, 39.902664, 50.60, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2353, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.30, 72.11, 1.317, 7.02, '2026-01-05 00:18:47', '0', 116.380726, 39.891486, 55.98, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2354, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.84, 67.46, 1.126, 5.95, '2026-01-04 23:18:47', '0', 116.409941, 39.907195, 49.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2355, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.62, 72.03, 1.185, 6.73, '2026-01-04 22:18:47', '0', 116.397841, 39.893702, 44.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2356, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.43, 61.98, 1.415, 6.21, '2026-01-04 21:18:47', '0', 116.385212, 39.886157, 57.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2357, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.66, 73.77, 1.257, 7.16, '2026-01-04 20:18:47', '0', 116.402326, 39.901546, 43.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2358, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.03, 62.45, 1.465, 7.23, '2026-01-04 19:18:47', '0', 116.383234, 39.901186, 33.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2359, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.61, 69.33, 1.544, 7.00, '2026-01-04 18:18:47', '0', 116.410853, 39.901323, 51.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2360, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.27, 76.07, 1.387, 6.70, '2026-01-04 17:18:47', '0', 116.407705, 39.920940, 48.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2361, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.14, 76.40, 1.338, 6.72, '2026-01-04 16:18:47', '0', 116.392828, 39.929697, 53.44, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2362, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.69, 81.74, 0.576, 6.77, '2026-01-04 15:18:47', '0', 116.401786, 39.898807, 40.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2363, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.46, 72.50, 1.190, 6.27, '2026-01-04 14:18:47', '0', 116.372123, 39.909308, 43.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2364, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.68, 71.17, 1.084, 6.14, '2026-01-04 13:18:47', '0', 116.413996, 39.908580, 59.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2365, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.19, 73.91, 1.148, 6.88, '2026-01-04 12:18:47', '0', 116.387179, 39.911139, 43.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2366, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.52, 74.67, 1.223, 6.98, '2026-01-04 11:18:47', '0', 116.397212, 39.890728, 36.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2367, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.44, 77.84, 1.163, 7.06, '2026-01-04 10:18:47', '0', 116.388539, 39.903437, 30.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2368, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.93, 81.45, 1.016, 6.34, '2026-01-04 09:18:47', '0', 116.381521, 39.921102, 39.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2369, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.28, 75.07, 1.624, 7.08, '2026-01-04 08:18:47', '0', 116.389545, 39.906584, 47.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2370, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.12, 86.68, 1.158, 6.53, '2026-01-04 07:18:47', '0', 116.386570, 39.917649, 47.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2371, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.06, 76.74, 1.632, 6.97, '2026-01-04 06:18:47', '0', 116.402658, 39.921781, 32.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2372, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.94, 81.92, 1.459, 6.79, '2026-01-04 05:18:47', '0', 116.392660, 39.925262, 45.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2373, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.54, 76.29, 1.782, 6.95, '2026-01-04 04:18:47', '0', 116.403028, 39.922881, 35.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2374, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.30, 66.31, 1.062, 6.83, '2026-01-04 03:18:47', '0', 116.397111, 39.917994, 64.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2375, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.39, 87.38, 0.691, 5.43, '2026-01-04 02:18:47', '0', 116.386814, 39.914961, 37.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2376, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.11, 79.05, 1.029, 7.29, '2026-01-04 01:18:47', '0', 116.378779, 39.902127, 59.41, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2377, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.12, 84.81, 0.795, 6.30, '2026-01-04 00:18:47', '0', 116.378297, 39.897543, 64.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2378, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.50, 76.35, 2.122, 6.62, '2026-01-03 23:18:47', '0', 116.391230, 39.908457, 75.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2379, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.91, 82.84, 1.110, 6.14, '2026-01-03 22:18:47', '0', 116.375726, 39.905954, 35.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2380, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.34, 86.90, 1.194, 7.23, '2026-01-03 21:18:47', '0', 116.394093, 39.910306, 52.98, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2381, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.09, 77.18, 1.391, 6.07, '2026-01-03 20:18:47', '0', 116.407885, 39.922909, 65.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2382, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.18, 78.02, 0.571, 6.83, '2026-01-03 19:18:47', '0', 116.400903, 39.909453, 60.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2383, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.05, 75.90, 1.227, 6.78, '2026-01-03 18:18:47', '0', 116.391146, 39.911598, 65.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2384, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.23, 85.83, 1.257, 7.49, '2026-01-03 17:18:47', '0', 116.400165, 39.908431, 62.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2385, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.29, 74.25, 0.586, 7.46, '2026-01-03 16:18:47', '0', 116.393490, 39.904056, 56.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2386, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.17, 76.79, 1.708, 6.38, '2026-01-03 15:18:47', '0', 116.377911, 39.907252, 42.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2387, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.88, 86.79, 1.515, 6.79, '2026-01-03 14:18:47', '0', 116.401440, 39.888267, 21.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2388, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.57, 69.10, 1.194, 5.71, '2026-01-03 13:18:47', '0', 116.412816, 39.923391, 47.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2389, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.22, 76.23, 1.284, 6.76, '2026-01-03 12:18:47', '0', 116.412556, 39.918026, 66.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2390, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.67, 73.31, 0.611, 7.18, '2026-01-03 11:18:47', '0', 116.417889, 39.927025, 46.67, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2391, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.99, 86.02, 1.306, 6.84, '2026-01-03 10:18:47', '0', 116.383597, 39.915692, 52.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2392, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.03, 78.28, 1.495, 6.85, '2026-01-03 09:18:47', '0', 116.393814, 39.901975, 48.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2393, 'DEVICE_FIELD_003_001', 'FIELD_003', 34.11, 84.09, 1.243, 6.35, '2026-01-03 08:18:47', '0', 116.389188, 39.886907, 48.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2394, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.74, 78.28, 1.417, 6.27, '2026-01-03 07:18:47', '0', 116.390861, 39.918639, 58.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2395, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.62, 78.20, 1.011, 6.68, '2026-01-03 06:18:47', '0', 116.408368, 39.901592, 56.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2396, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.46, 82.60, 1.340, 6.97, '2026-01-03 05:18:47', '0', 116.402606, 39.886048, 60.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2397, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.74, 70.25, 1.500, 6.05, '2026-01-03 04:18:47', '0', 116.399512, 39.909884, 35.14, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2398, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.50, 82.72, 0.957, 6.23, '2026-01-03 03:18:47', '0', 116.394353, 39.896126, 52.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2399, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.39, 76.65, 1.658, 6.52, '2026-01-03 02:18:47', '0', 116.400232, 39.913540, 44.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2400, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.14, 77.79, 1.425, 6.72, '2026-01-03 01:18:47', '0', 116.402920, 39.902635, 65.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2401, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.49, 74.88, 1.148, 6.14, '2026-01-03 00:18:47', '0', 116.399397, 39.902069, 59.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2402, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.67, 63.95, 1.511, 6.85, '2026-01-02 23:18:47', '0', 116.391070, 39.894713, 73.87, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2403, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.40, 72.07, 1.520, 6.14, '2026-01-02 22:18:47', '0', 116.367339, 39.914452, 48.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2404, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.60, 74.87, 1.301, 6.95, '2026-01-02 21:18:47', '0', 116.403765, 39.896163, 60.57, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2405, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.90, 66.71, 1.176, 6.32, '2026-01-02 20:18:47', '0', 116.407009, 39.922262, 40.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2406, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.77, 73.28, 0.924, 7.35, '2026-01-02 19:18:47', '0', 116.382646, 39.888035, 50.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2407, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.25, 68.88, 0.658, 6.83, '2026-01-02 18:18:47', '0', 116.391695, 39.914046, 51.75, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2408, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.81, 70.71, 0.780, 6.28, '2026-01-02 17:18:47', '0', 116.409364, 39.919970, 26.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2409, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.97, 72.16, 0.435, 7.07, '2026-01-02 16:18:47', '0', 116.397562, 39.910196, 46.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2410, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.28, 64.04, 1.043, 6.11, '2026-01-02 15:18:47', '0', 116.406480, 39.911935, 58.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2411, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.34, 70.12, 1.197, 6.26, '2026-01-02 14:18:47', '0', 116.371578, 39.892067, 48.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2412, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.60, 60.35, 0.596, 5.34, '2026-01-02 13:18:47', '0', 116.404645, 39.908867, 57.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2413, 'DEVICE_FIELD_003_001', 'FIELD_003', 33.11, 65.53, 1.076, 6.45, '2026-01-02 12:18:47', '0', 116.386640, 39.908306, 42.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2414, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.25, 56.63, 0.946, 7.15, '2026-01-02 11:18:47', '0', 116.388404, 39.906098, 37.94, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2415, 'DEVICE_FIELD_003_001', 'FIELD_003', 33.16, 62.10, 1.606, 6.40, '2026-01-02 10:18:47', '0', 116.407091, 39.910189, 41.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2416, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.54, 62.46, 1.209, 6.61, '2026-01-02 09:18:47', '0', 116.398320, 39.917432, 49.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2417, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.74, 63.59, 0.977, 7.32, '2026-01-02 08:18:47', '0', 116.396141, 39.903938, 48.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2418, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.54, 68.06, 1.893, 6.54, '2026-01-02 07:18:47', '0', 116.398309, 39.932546, 47.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2419, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.05, 60.70, 1.181, 6.72, '2026-01-02 06:18:47', '0', 116.395988, 39.901797, 33.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2420, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.95, 62.17, 0.678, 6.96, '2026-01-02 05:18:47', '0', 116.402954, 39.923349, 33.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2421, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.99, 54.99, 0.967, 6.18, '2026-01-02 04:18:47', '0', 116.405724, 39.915681, 49.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2422, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.64, 63.64, 0.890, 5.98, '2026-01-02 03:18:47', '0', 116.392619, 39.924239, 53.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2423, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.99, 59.63, 1.071, 7.07, '2026-01-02 02:18:47', '0', 116.402004, 39.908527, 58.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2424, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.71, 49.69, 1.302, 6.39, '2026-01-02 01:18:47', '0', 116.404370, 39.903371, 56.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2425, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.11, 54.37, 1.575, 6.34, '2026-01-02 00:18:47', '0', 116.384998, 39.883874, 40.78, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2426, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.57, 58.38, 1.820, 6.17, '2026-01-01 23:18:47', '0', 116.401228, 39.904890, 52.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2427, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.64, 49.81, 1.184, 7.32, '2026-01-01 22:18:47', '0', 116.384883, 39.919151, 47.45, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2428, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.05, 56.86, 1.126, 6.72, '2026-01-01 21:18:47', '0', 116.382168, 39.901725, 44.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2429, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.62, 57.39, 1.042, 6.64, '2026-01-01 20:18:47', '0', 116.405988, 39.915300, 49.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2430, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.36, 55.81, 1.232, 7.18, '2026-01-01 19:18:47', '0', 116.399487, 39.911619, 42.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2431, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.53, 55.52, 1.042, 7.16, '2026-01-01 18:18:47', '0', 116.406158, 39.905464, 65.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2432, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.39, 62.33, 1.037, 7.10, '2026-01-01 17:18:47', '0', 116.383097, 39.899390, 54.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2433, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.17, 55.66, 1.296, 6.42, '2026-01-01 16:18:47', '0', 116.399420, 39.906119, 60.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2434, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.21, 48.05, 1.585, 7.54, '2026-01-01 15:18:47', '0', 116.404116, 39.907901, 56.51, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2435, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.41, 47.73, 1.306, 6.31, '2026-01-01 14:18:47', '0', 116.383131, 39.913746, 39.89, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2436, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.57, 41.72, 0.942, 5.69, '2026-01-01 13:18:47', '0', 116.399685, 39.886079, 72.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2437, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.44, 43.43, 1.712, 6.09, '2026-01-01 12:18:47', '0', 116.399247, 39.925673, 54.67, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2438, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.17, 44.72, 1.335, 6.02, '2026-01-01 11:18:47', '0', 116.398110, 39.892216, 48.45, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2439, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.38, 38.19, 1.190, 6.62, '2026-01-01 10:18:47', '0', 116.378274, 39.903067, 36.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2440, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.60, 45.94, 1.225, 6.13, '2026-01-01 09:18:47', '0', 116.388408, 39.899025, 38.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2441, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.08, 41.27, 1.022, 6.18, '2026-01-01 08:18:47', '0', 116.385850, 39.921466, 43.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2442, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.39, 50.20, 1.008, 6.27, '2026-01-01 07:18:47', '0', 116.391685, 39.909489, 51.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2443, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.54, 50.58, 1.038, 6.32, '2026-01-01 06:18:47', '0', 116.399779, 39.906366, 37.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2444, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.35, 35.01, 1.375, 6.34, '2026-01-01 05:18:47', '0', 116.390709, 39.915676, 62.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2445, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.78, 47.93, 1.177, 6.07, '2026-01-01 04:18:47', '0', 116.380608, 39.907728, 65.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2446, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.28, 49.71, 1.099, 6.47, '2026-01-01 03:18:47', '0', 116.386559, 39.902445, 47.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2447, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.82, 44.50, 1.295, 6.44, '2026-01-01 02:18:47', '0', 116.401084, 39.906058, 43.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2448, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.88, 39.61, 0.848, 7.03, '2026-01-01 01:18:47', '0', 116.397508, 39.911163, 34.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2449, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.13, 34.58, 1.020, 7.44, '2026-01-01 00:18:47', '0', 116.393374, 39.892187, 43.29, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2450, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.13, 38.97, 0.984, 7.28, '2025-12-31 23:18:47', '0', 116.394197, 39.930065, 53.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2451, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.90, 33.38, 1.207, 6.14, '2025-12-31 22:18:47', '0', 116.382735, 39.901565, 51.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2452, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.35, 41.00, 1.096, 6.78, '2025-12-31 21:18:47', '0', 116.417330, 39.913050, 46.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2453, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.39, 44.35, 1.222, 6.95, '2025-12-31 20:18:47', '0', 116.375017, 39.912659, 58.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2454, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.47, 34.08, 1.182, 6.65, '2025-12-31 19:18:47', '0', 116.390339, 39.926242, 46.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2455, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.00, 44.41, 1.321, 6.36, '2025-12-31 18:18:47', '0', 116.394639, 39.925523, 55.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2456, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.24, 38.44, 1.402, 6.41, '2025-12-31 17:18:47', '0', 116.398566, 39.927323, 58.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2457, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.09, 37.01, 1.034, 6.96, '2025-12-31 16:18:47', '0', 116.396196, 39.908705, 46.77, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2458, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.52, 38.81, 1.581, 7.31, '2025-12-31 15:18:47', '0', 116.395131, 39.907232, 39.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2459, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.67, 45.61, 1.091, 6.87, '2025-12-31 14:18:47', '0', 116.392232, 39.912404, 53.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2460, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.72, 40.41, 1.593, 6.74, '2025-12-31 13:18:47', '0', 116.393842, 39.911735, 37.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2461, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.70, 39.99, 1.183, 7.04, '2025-12-31 12:18:47', '0', 116.394840, 39.901334, 56.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2462, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.08, 37.86, 0.697, 6.94, '2025-12-31 11:18:47', '0', 116.404766, 39.890274, 57.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2463, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.83, 43.01, 1.357, 7.03, '2025-12-31 10:18:47', '0', 116.390768, 39.906130, 56.57, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2464, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.44, 44.68, 0.713, 7.41, '2025-12-31 09:18:47', '0', 116.407845, 39.909436, 50.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2465, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.95, 45.79, 1.329, 6.94, '2025-12-31 08:18:47', '0', 116.399701, 39.911607, 58.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2466, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.33, 42.48, 1.494, 6.83, '2025-12-31 07:18:47', '0', 116.392418, 39.914576, 55.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2467, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.36, 36.34, 0.984, 6.52, '2025-12-31 06:18:47', '0', 116.391172, 39.908643, 41.73, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2468, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.01, 40.63, 1.514, 6.02, '2025-12-31 05:18:47', '0', 116.400654, 39.890917, 47.29, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2469, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.60, 48.56, 0.952, 5.98, '2025-12-31 04:18:47', '0', 116.394521, 39.906971, 42.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2470, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.32, 39.08, 0.920, 6.71, '2025-12-31 03:18:47', '0', 116.388855, 39.919542, 40.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2471, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.53, 41.22, 1.232, 5.90, '2025-12-31 02:18:47', '0', 116.381611, 39.911911, 42.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2472, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.73, 39.69, 0.730, 5.03, '2025-12-31 01:18:47', '0', 116.386292, 39.899787, 50.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2473, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.92, 40.35, 1.106, 7.23, '2025-12-31 00:18:47', '0', 116.410069, 39.913108, 52.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2474, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.71, 43.50, 1.753, 6.29, '2025-12-30 23:18:47', '0', 116.406808, 39.914595, 45.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2475, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.31, 38.30, 1.292, 5.87, '2025-12-30 22:18:47', '0', 116.399522, 39.923156, 55.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2476, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.83, 47.39, 1.181, 6.45, '2025-12-30 21:18:47', '0', 116.397478, 39.918087, 36.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2477, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.82, 46.85, 1.083, 8.14, '2025-12-30 20:18:47', '0', 116.378570, 39.914694, 45.33, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2478, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.83, 47.56, 1.688, 5.82, '2025-12-30 19:18:47', '0', 116.374452, 39.910672, 65.44, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2479, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.97, 34.16, 0.956, 5.86, '2025-12-30 18:18:47', '0', 116.404606, 39.916771, 35.87, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2480, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.38, 37.54, 1.205, 7.29, '2025-12-30 17:18:47', '0', 116.401767, 39.933904, 35.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2481, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.80, 45.08, 0.932, 6.92, '2025-12-30 16:18:47', '0', 116.395822, 39.917329, 49.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2482, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.70, 42.14, 1.621, 6.13, '2025-12-30 15:18:47', '0', 116.386459, 39.922318, 48.07, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2483, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.85, 42.06, 1.564, 6.06, '2025-12-30 14:18:47', '0', 116.406953, 39.924556, 60.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2484, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.46, 47.18, 1.024, 7.17, '2025-12-30 13:18:47', '0', 116.410258, 39.912058, 46.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2485, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.70, 36.78, 1.601, 6.24, '2025-12-30 12:18:47', '0', 116.395451, 39.925384, 69.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2486, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.30, 36.66, 0.998, 7.16, '2025-12-30 11:18:47', '0', 116.403344, 39.912468, 56.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2487, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.79, 42.57, 1.281, 6.44, '2025-12-30 10:18:47', '0', 116.392674, 39.916323, 56.29, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2488, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.56, 56.39, 1.729, 6.79, '2025-12-30 09:18:47', '0', 116.387532, 39.898262, 48.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2489, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.28, 54.64, 1.660, 6.59, '2025-12-30 08:18:47', '0', 116.404045, 39.903774, 56.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2490, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.29, 58.56, 1.201, 5.64, '2025-12-30 07:18:47', '0', 116.412138, 39.917459, 56.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2491, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.85, 48.92, 1.176, 6.55, '2025-12-30 06:18:47', '0', 116.390345, 39.917003, 48.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2492, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.25, 45.70, 1.263, 6.63, '2025-12-30 05:18:47', '0', 116.386665, 39.903023, 63.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2493, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.31, 54.74, 0.915, 5.89, '2025-12-30 04:18:47', '0', 116.395643, 39.887741, 38.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2494, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.39, 56.53, 1.049, 5.83, '2025-12-30 03:18:47', '0', 116.410808, 39.910818, 48.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2495, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.62, 56.73, 1.238, 7.20, '2025-12-30 02:18:47', '0', 116.388175, 39.909299, 49.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2496, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.00, 52.47, 0.984, 6.32, '2025-12-30 01:18:47', '0', 116.414400, 39.915130, 60.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2497, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.87, 58.39, 0.841, 6.32, '2025-12-30 00:18:47', '0', 116.401144, 39.904555, 57.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2498, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.95, 61.28, 1.245, 6.09, '2025-12-29 23:18:47', '0', 116.398453, 39.894065, 47.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2499, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.16, 49.71, 1.224, 6.45, '2025-12-29 22:18:47', '0', 116.414294, 39.913528, 47.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2500, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.49, 58.66, 1.442, 5.29, '2025-12-29 21:18:47', '0', 116.399348, 39.907671, 62.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2501, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.32, 59.74, 0.980, 7.32, '2025-12-29 20:18:47', '0', 116.390240, 39.895507, 61.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2502, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.70, 50.64, 1.220, 6.41, '2025-12-29 19:18:47', '0', 116.394896, 39.901972, 30.22, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2503, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.97, 60.42, 1.309, 6.36, '2025-12-29 18:18:47', '0', 116.395845, 39.906060, 26.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2504, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.88, 54.57, 1.283, 7.10, '2025-12-29 17:18:47', '0', 116.374736, 39.924024, 70.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2505, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.55, 61.44, 1.083, 6.48, '2025-12-29 16:18:47', '0', 116.404112, 39.918792, 61.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2506, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.75, 67.10, 0.755, 5.35, '2025-12-29 15:18:47', '0', 116.395314, 39.913557, 39.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2507, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.97, 68.08, 1.234, 6.44, '2025-12-29 14:18:47', '0', 116.380762, 39.894335, 55.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2508, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.82, 65.60, 1.287, 6.27, '2025-12-29 13:18:47', '0', 116.401667, 39.915717, 41.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2509, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.18, 57.11, 1.579, 6.38, '2025-12-29 12:18:47', '0', 116.404760, 39.911115, 57.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2510, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.49, 63.90, 1.145, 6.36, '2025-12-29 11:18:47', '0', 116.401461, 39.915002, 54.31, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2511, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.58, 64.68, 1.308, 5.96, '2025-12-29 10:18:47', '0', 116.399392, 39.925246, 74.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2512, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.14, 57.83, 0.773, 6.12, '2025-12-29 09:18:47', '0', 116.405071, 39.893827, 50.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2513, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.62, 60.33, 0.975, 5.75, '2025-12-29 08:18:47', '0', 116.394983, 39.909039, 60.12, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2514, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.47, 61.74, 0.788, 6.54, '2025-12-29 07:18:47', '0', 116.395969, 39.908548, 58.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2515, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.05, 66.63, 1.431, 6.18, '2025-12-29 06:18:47', '0', 116.397639, 39.903674, 63.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2516, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.64, 63.99, 1.561, 6.41, '2025-12-29 05:18:47', '0', 116.394307, 39.905150, 62.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2517, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.06, 64.05, 0.864, 6.77, '2025-12-29 04:18:47', '0', 116.422303, 39.906189, 55.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2518, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.39, 75.11, 0.897, 6.46, '2025-12-29 03:18:47', '0', 116.400238, 39.886777, 48.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2519, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.01, 71.02, 1.255, 6.84, '2025-12-29 02:18:47', '0', 116.405590, 39.923314, 54.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2520, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.27, 75.69, 2.018, 7.35, '2025-12-29 01:18:47', '0', 116.385984, 39.895397, 67.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2521, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.35, 64.60, 0.836, 5.97, '2025-12-29 00:18:47', '0', 116.388241, 39.921856, 42.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2522, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.32, 73.69, 1.459, 6.03, '2025-12-28 23:18:47', '0', 116.396356, 39.904812, 53.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2523, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.33, 74.60, 1.117, 6.61, '2025-12-28 22:18:47', '0', 116.399439, 39.922724, 71.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2524, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.11, 71.46, 1.099, 6.61, '2025-12-28 21:18:47', '0', 116.399447, 39.899075, 39.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2525, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.16, 78.89, 1.166, 7.10, '2025-12-28 20:18:47', '0', 116.382040, 39.908683, 44.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2526, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.42, 77.05, 1.391, 7.02, '2025-12-28 19:18:47', '0', 116.400008, 39.908299, 45.06, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2527, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.28, 72.15, 1.744, 5.60, '2025-12-28 18:18:47', '0', 116.395976, 39.924996, 63.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2528, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.15, 77.78, 1.732, 5.56, '2025-12-28 17:18:47', '0', 116.393733, 39.913564, 55.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2529, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.16, 83.13, 1.089, 6.22, '2025-12-28 16:18:47', '0', 116.387893, 39.896143, 48.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2530, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.68, 66.88, 0.836, 6.86, '2025-12-28 15:18:47', '0', 116.409006, 39.908260, 51.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2531, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.34, 71.17, 1.084, 6.52, '2025-12-28 14:18:47', '0', 116.405943, 39.920826, 59.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2532, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.04, 80.47, 1.103, 5.58, '2025-12-28 13:18:47', '0', 116.390345, 39.913272, 46.88, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2533, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.21, 71.23, 1.163, 6.56, '2025-12-28 12:18:47', '0', 116.395765, 39.897299, 36.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2534, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.82, 80.86, 1.495, 6.88, '2025-12-28 11:18:47', '0', 116.397691, 39.906836, 59.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2535, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.12, 80.80, 1.023, 6.42, '2025-12-28 10:18:47', '0', 116.398419, 39.917492, 65.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2536, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.01, 81.57, 1.314, 6.87, '2025-12-28 09:18:47', '0', 116.399206, 39.920882, 64.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2537, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.83, 83.51, 1.365, 6.80, '2025-12-28 08:18:47', '0', 116.394831, 39.911419, 50.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2538, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.90, 80.51, 1.448, 5.62, '2025-12-28 07:18:47', '0', 116.412157, 39.911172, 42.77, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2539, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.17, 77.07, 0.762, 5.49, '2025-12-28 06:18:47', '0', 116.393814, 39.910221, 47.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2540, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.45, 78.81, 1.214, 6.19, '2025-12-28 05:18:47', '0', 116.400997, 39.910705, 49.23, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2541, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.06, 77.15, 1.742, 7.16, '2025-12-28 04:18:47', '0', 116.402701, 39.898874, 49.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2542, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.02, 77.00, 1.157, 6.28, '2025-12-28 03:18:47', '0', 116.372096, 39.907595, 62.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2543, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.39, 81.66, 0.897, 5.71, '2025-12-28 02:18:47', '0', 116.399179, 39.890965, 47.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2544, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.47, 78.89, 1.090, 6.27, '2025-12-28 01:18:47', '0', 116.404096, 39.918518, 45.63, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2545, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.09, 78.49, 1.762, 6.53, '2025-12-28 00:18:47', '0', 116.393922, 39.906971, 43.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2546, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.12, 81.06, 1.059, 6.30, '2025-12-27 23:18:47', '0', 116.390944, 39.911623, 44.22, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2547, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.64, 77.34, 1.048, 6.41, '2025-12-27 22:18:47', '0', 116.393482, 39.909308, 49.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2548, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.88, 82.25, 0.684, 6.54, '2025-12-27 21:18:47', '0', 116.387662, 39.907658, 63.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2549, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.03, 78.10, 1.468, 6.32, '2025-12-27 20:18:47', '0', 116.387840, 39.894490, 78.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2550, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.75, 77.22, 1.615, 7.08, '2025-12-27 19:18:47', '0', 116.410870, 39.915539, 53.29, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2551, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.08, 83.06, 0.990, 6.91, '2025-12-27 18:18:47', '0', 116.397858, 39.898722, 45.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2552, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.97, 87.26, 1.185, 7.26, '2025-12-27 17:18:47', '0', 116.402210, 39.897505, 54.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2553, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.03, 76.62, 1.832, 6.50, '2025-12-27 16:18:47', '0', 116.405995, 39.902441, 72.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2554, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.22, 80.73, 1.471, 5.40, '2025-12-27 15:18:47', '0', 116.379599, 39.910391, 58.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2555, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.55, 84.85, 1.561, 7.49, '2025-12-27 14:18:47', '0', 116.402888, 39.900447, 34.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2556, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.15, 76.95, 0.909, 6.03, '2025-12-27 13:18:47', '0', 116.403124, 39.906674, 45.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2557, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.17, 80.48, 1.209, 7.21, '2025-12-27 12:18:47', '0', 116.428180, 39.905032, 56.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2558, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.24, 79.87, 1.439, 5.72, '2025-12-27 11:18:47', '0', 116.406110, 39.890204, 43.12, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2559, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.99, 87.24, 1.087, 6.49, '2025-12-27 10:18:47', '0', 116.401816, 39.899407, 54.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2560, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.83, 79.38, 0.978, 5.80, '2025-12-27 09:18:47', '0', 116.400016, 39.897821, 46.26, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2561, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.97, 67.93, 1.140, 6.37, '2025-12-27 08:18:47', '0', 116.394802, 39.894704, 53.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2562, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.54, 76.80, 1.278, 7.07, '2025-12-27 07:18:47', '0', 116.401224, 39.927139, 27.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2563, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.16, 82.40, 1.118, 6.84, '2025-12-27 06:18:47', '0', 116.404335, 39.889401, 43.07, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2564, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.32, 77.77, 1.153, 5.65, '2025-12-27 05:18:47', '0', 116.409409, 39.905881, 37.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2565, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.64, 76.19, 1.064, 5.03, '2025-12-27 04:18:47', '0', 116.397565, 39.897188, 55.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2566, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.02, 67.62, 1.080, 5.83, '2025-12-27 03:18:47', '0', 116.408861, 39.911275, 18.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2567, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.94, 74.55, 1.151, 6.51, '2025-12-27 02:18:47', '0', 116.391971, 39.909781, 48.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2568, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.00, 86.64, 1.353, 7.30, '2025-12-27 01:18:47', '0', 116.390246, 39.899452, 37.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2569, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.45, 73.46, 1.003, 7.37, '2025-12-27 00:18:47', '0', 116.395005, 39.922122, 46.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2570, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.12, 70.71, 0.952, 5.80, '2025-12-26 23:18:47', '0', 116.404399, 39.907975, 22.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2571, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.80, 71.12, 0.544, 5.60, '2025-12-26 22:18:47', '0', 116.405311, 39.901344, 38.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2572, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.85, 67.59, 1.045, 7.19, '2025-12-26 21:18:47', '0', 116.382259, 39.916841, 54.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2573, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.61, 62.74, 1.156, 6.44, '2025-12-26 20:18:47', '0', 116.394778, 39.918256, 36.31, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2574, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.17, 71.00, 1.427, 6.95, '2025-12-26 19:18:47', '0', 116.392076, 39.904180, 53.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2575, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.44, 70.47, 0.979, 6.03, '2025-12-26 18:18:47', '0', 116.386691, 39.892146, 43.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2576, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.95, 56.51, 0.768, 6.81, '2025-12-26 17:18:47', '0', 116.403730, 39.898021, 54.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2577, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.91, 66.73, 1.438, 6.63, '2025-12-26 16:18:47', '0', 116.402253, 39.887953, 46.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2578, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.53, 64.39, 1.033, 7.14, '2025-12-26 15:18:47', '0', 116.403928, 39.914165, 40.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2579, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.20, 63.03, 1.236, 6.53, '2025-12-26 14:18:47', '0', 116.404723, 39.905475, 25.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2580, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.72, 60.61, 1.603, 6.55, '2025-12-26 13:18:47', '0', 116.401741, 39.906929, 45.82, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2581, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.21, 62.50, 1.024, 6.64, '2025-12-26 12:18:47', '0', 116.397833, 39.915752, 60.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2582, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.81, 57.64, 0.927, 6.33, '2025-12-26 11:18:47', '0', 116.398677, 39.921009, 34.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2583, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.64, 58.06, 0.693, 6.68, '2025-12-26 10:18:47', '0', 116.376046, 39.908694, 36.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2584, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.90, 62.04, 1.291, 6.60, '2025-12-26 09:18:47', '0', 116.393560, 39.900992, 44.75, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2585, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.80, 63.25, 0.755, 7.12, '2025-12-26 08:18:47', '0', 116.406059, 39.921312, 28.45, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2586, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.62, 62.21, 0.953, 6.70, '2025-12-26 07:18:47', '0', 116.384124, 39.896269, 47.63, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2587, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.85, 63.62, 1.137, 6.12, '2025-12-26 06:18:47', '0', 116.394130, 39.929318, 57.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2588, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.15, 58.60, 1.056, 5.22, '2025-12-26 05:18:47', '0', 116.392172, 39.915406, 62.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2589, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.11, 55.82, 1.075, 6.30, '2025-12-26 04:18:47', '0', 116.392275, 39.928837, 43.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2590, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.41, 59.60, 1.220, 7.16, '2025-12-26 03:18:47', '0', 116.394606, 39.907533, 47.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2591, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.70, 57.05, 1.159, 6.63, '2025-12-26 02:18:47', '0', 116.417265, 39.895712, 41.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2592, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.68, 59.90, 1.103, 7.08, '2025-12-26 01:18:47', '0', 116.413491, 39.914588, 60.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2593, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.81, 52.27, 1.326, 5.94, '2025-12-26 00:18:47', '0', 116.407473, 39.904316, 52.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2594, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.00, 54.97, 1.105, 6.62, '2025-12-25 23:18:47', '0', 116.382416, 39.926099, 42.35, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2595, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.32, 65.08, 0.765, 5.55, '2025-12-25 22:18:47', '0', 116.404236, 39.925258, 61.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2596, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.37, 56.47, 1.520, 6.00, '2025-12-25 21:18:47', '0', 116.400878, 39.890695, 42.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2597, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.82, 52.62, 0.735, 7.29, '2025-12-25 20:18:47', '0', 116.373647, 39.892736, 58.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2598, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.20, 55.58, 1.287, 6.53, '2025-12-25 19:18:47', '0', 116.412798, 39.914945, 52.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2599, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.49, 46.14, 1.469, 7.39, '2025-12-25 18:18:47', '0', 116.393351, 39.906614, 57.48, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2600, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.18, 44.61, 1.325, 6.76, '2025-12-25 17:18:47', '0', 116.406830, 39.901517, 32.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2601, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.34, 54.04, 1.226, 6.57, '2025-12-25 16:18:47', '0', 116.401580, 39.891963, 51.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2602, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.74, 44.23, 1.167, 5.65, '2025-12-25 15:18:47', '0', 116.415335, 39.907605, 69.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2603, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.66, 38.61, 0.996, 6.62, '2025-12-25 14:18:47', '0', 116.391023, 39.917988, 40.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2604, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.63, 44.97, 1.494, 7.05, '2025-12-25 13:18:47', '0', 116.394800, 39.922335, 69.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2605, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.89, 58.73, 1.233, 6.58, '2025-12-25 12:18:47', '0', 116.379537, 39.904374, 57.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2606, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.28, 53.17, 1.316, 6.44, '2025-12-25 11:18:47', '0', 116.399376, 39.923182, 59.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2607, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.95, 51.96, 1.359, 6.37, '2025-12-25 10:18:47', '0', 116.395173, 39.898423, 63.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2608, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.99, 48.57, 0.827, 6.87, '2025-12-25 09:18:47', '0', 116.396004, 39.931060, 57.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2609, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.86, 45.46, 1.692, 7.24, '2025-12-25 08:18:47', '0', 116.402563, 39.924682, 35.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2610, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.44, 57.36, 1.584, 6.53, '2025-12-25 07:18:47', '0', 116.395897, 39.910602, 54.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2611, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.17, 42.02, 1.242, 6.15, '2025-12-25 06:18:47', '0', 116.391387, 39.905715, 49.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2612, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.26, 48.96, 1.554, 7.37, '2025-12-25 05:18:47', '0', 116.404649, 39.894820, 51.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2613, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.42, 43.15, 1.018, 6.23, '2025-12-25 04:18:47', '0', 116.403146, 39.899326, 46.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2614, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.11, 45.04, 1.020, 6.93, '2025-12-25 03:18:47', '0', 116.408170, 39.922031, 60.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2615, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.08, 35.23, 1.290, 5.82, '2025-12-25 02:18:47', '0', 116.388066, 39.906834, 46.88, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2616, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.74, 33.64, 1.292, 6.33, '2025-12-25 01:18:47', '0', 116.408326, 39.899614, 49.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2617, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.06, 47.82, 1.046, 6.90, '2025-12-25 00:18:47', '0', 116.380983, 39.903383, 59.88, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2618, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.82, 47.06, 0.897, 6.75, '2025-12-24 23:18:47', '0', 116.412401, 39.898640, 48.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2619, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.58, 36.53, 0.873, 6.54, '2025-12-24 22:18:47', '0', 116.410828, 39.901261, 64.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2620, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.38, 48.08, 1.670, 6.69, '2025-12-24 21:18:47', '0', 116.382444, 39.897307, 51.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2621, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.20, 40.71, 0.711, 6.10, '2025-12-24 20:18:47', '0', 116.385488, 39.908336, 59.41, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2622, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.49, 38.57, 1.007, 6.19, '2025-12-24 19:18:47', '0', 116.380574, 39.896044, 55.67, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2623, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.08, 43.53, 1.884, 6.16, '2025-12-24 18:18:47', '0', 116.417351, 39.908249, 44.29, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2624, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.41, 35.58, 0.608, 7.21, '2025-12-24 17:18:47', '0', 116.407271, 39.915786, 56.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2625, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.48, 44.40, 0.397, 5.87, '2025-12-24 16:18:47', '0', 116.391735, 39.903142, 24.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2626, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.39, 42.58, 1.414, 7.00, '2025-12-24 15:18:47', '0', 116.413030, 39.904247, 43.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2627, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.80, 40.13, 1.587, 6.39, '2025-12-24 14:18:47', '0', 116.404283, 39.921001, 54.67, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2628, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.34, 42.49, 1.171, 7.09, '2025-12-24 13:18:47', '0', 116.388528, 39.912390, 57.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2629, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.47, 34.66, 1.425, 6.38, '2025-12-24 12:18:47', '0', 116.399237, 39.913419, 55.07, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2630, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.23, 45.80, 1.131, 7.08, '2025-12-24 11:18:47', '0', 116.409266, 39.900698, 44.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2631, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.57, 41.55, 1.064, 6.97, '2025-12-24 10:18:47', '0', 116.385745, 39.909363, 50.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2632, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.51, 40.00, 0.941, 7.00, '2025-12-24 09:18:47', '0', 116.390810, 39.908601, 64.44, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2633, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.33, 38.18, 0.545, 6.43, '2025-12-24 08:18:47', '0', 116.382231, 39.895358, 45.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2634, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.23, 47.82, 0.704, 6.60, '2025-12-24 07:18:47', '0', 116.405682, 39.896767, 58.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2635, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.35, 41.15, 0.900, 7.11, '2025-12-24 06:18:47', '0', 116.394610, 39.913132, 57.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2636, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.82, 40.79, 1.345, 5.90, '2025-12-24 05:18:47', '0', 116.417064, 39.908073, 61.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2637, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.42, 48.65, 1.122, 6.87, '2025-12-24 04:18:47', '0', 116.391642, 39.918437, 48.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2638, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.66, 31.41, 1.169, 7.03, '2025-12-24 03:18:47', '0', 116.402258, 39.902258, 49.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2639, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.62, 47.76, 0.922, 6.37, '2025-12-24 02:18:47', '0', 116.395946, 39.912580, 51.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2640, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.32, 45.50, 1.440, 5.46, '2025-12-24 01:18:47', '0', 116.398974, 39.909529, 54.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2641, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.49, 36.23, 1.093, 6.36, '2025-12-24 00:18:47', '0', 116.400498, 39.921242, 38.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2642, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.02, 40.64, 1.064, 6.44, '2025-12-23 23:18:47', '0', 116.381790, 39.886859, 29.14, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2643, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.75, 34.09, 1.742, 6.80, '2025-12-23 22:18:47', '0', 116.390431, 39.896390, 42.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2644, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.66, 37.13, 1.436, 6.59, '2025-12-23 21:18:47', '0', 116.405490, 39.920260, 54.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2645, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.84, 36.28, 1.106, 5.46, '2025-12-23 20:18:47', '0', 116.371752, 39.915966, 59.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2646, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.94, 39.32, 1.416, 7.39, '2025-12-23 19:18:47', '0', 116.386083, 39.899027, 58.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2647, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.86, 40.32, 1.134, 7.25, '2025-12-23 18:18:47', '0', 116.396816, 39.899395, 60.34, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2648, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.13, 30.41, 1.517, 6.42, '2025-12-23 17:18:47', '0', 116.404395, 39.920082, 72.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2649, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.13, 41.58, 0.837, 6.99, '2025-12-23 16:18:47', '0', 116.412161, 39.933327, 71.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2650, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.85, 48.89, 0.700, 6.22, '2025-12-23 15:18:47', '0', 116.395441, 39.898843, 62.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2651, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.56, 43.91, 1.583, 7.47, '2025-12-23 14:18:47', '0', 116.401380, 39.912615, 74.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2652, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.73, 49.13, 1.202, 6.14, '2025-12-23 13:18:47', '0', 116.399279, 39.930988, 51.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2653, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.26, 45.08, 1.664, 5.37, '2025-12-23 12:18:47', '0', 116.416432, 39.902017, 48.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2654, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.88, 39.40, 0.793, 6.68, '2025-12-23 11:18:47', '0', 116.406283, 39.910565, 45.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2655, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.70, 42.06, 0.891, 6.47, '2025-12-23 10:18:47', '0', 116.404102, 39.921536, 63.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2656, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.60, 52.88, 1.405, 6.26, '2025-12-23 09:18:47', '0', 116.410277, 39.915725, 48.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2657, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.02, 52.30, 1.349, 6.91, '2025-12-23 08:18:47', '0', 116.387472, 39.900526, 51.33, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2658, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.40, 53.14, 0.852, 6.95, '2025-12-23 07:18:47', '0', 116.401117, 39.908721, 24.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2659, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.07, 49.53, 1.254, 6.73, '2025-12-23 06:18:47', '0', 116.413075, 39.926143, 60.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2660, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.40, 50.39, 1.032, 6.48, '2025-12-23 05:18:47', '0', 116.398215, 39.899872, 57.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2661, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.71, 56.76, 1.403, 6.04, '2025-12-23 04:18:47', '0', 116.406674, 39.919908, 62.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2662, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.17, 53.03, 1.021, 6.40, '2025-12-23 03:18:47', '0', 116.397881, 39.912937, 56.94, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2663, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.99, 53.05, 1.181, 6.92, '2025-12-23 02:18:47', '0', 116.404774, 39.900832, 48.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2664, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.28, 53.17, 0.618, 7.00, '2025-12-23 01:18:47', '0', 116.406372, 39.924998, 50.60, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2665, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.95, 53.61, 1.202, 7.20, '2025-12-23 00:18:47', '0', 116.385625, 39.894391, 49.78, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2666, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.41, 67.16, 1.182, 6.34, '2025-12-22 23:18:47', '0', 116.409014, 39.911088, 47.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2667, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.35, 58.60, 0.853, 7.58, '2025-12-22 22:18:47', '0', 116.387201, 39.909023, 37.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2668, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.38, 60.19, 1.422, 6.06, '2025-12-22 21:18:47', '0', 116.378591, 39.909421, 54.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2669, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.03, 58.34, 1.197, 7.19, '2025-12-22 20:18:47', '0', 116.404349, 39.906352, 70.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2670, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.93, 57.67, 1.055, 7.48, '2025-12-22 19:18:47', '0', 116.409457, 39.916210, 44.63, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2671, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.51, 58.68, 1.432, 5.63, '2025-12-22 18:18:47', '0', 116.394870, 39.920773, 44.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2672, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.54, 61.21, 1.220, 6.80, '2025-12-22 17:18:47', '0', 116.391506, 39.900215, 41.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2673, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.56, 62.49, 1.581, 7.04, '2025-12-22 16:18:47', '0', 116.393508, 39.906699, 50.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2674, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.41, 63.40, 1.180, 7.27, '2025-12-22 15:18:47', '0', 116.406415, 39.923905, 52.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2675, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.64, 61.92, 1.165, 5.53, '2025-12-22 14:18:47', '0', 116.417311, 39.905720, 56.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2676, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.77, 68.88, 0.769, 6.78, '2025-12-22 13:18:47', '0', 116.385519, 39.923827, 57.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2677, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.16, 61.45, 0.218, 7.01, '2025-12-22 12:18:47', '0', 116.397943, 39.913879, 49.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2678, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.12, 66.44, 1.147, 6.59, '2025-12-22 11:18:47', '0', 116.388933, 39.908505, 53.33, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2679, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.25, 72.76, 1.381, 6.03, '2025-12-22 10:18:47', '0', 116.402970, 39.908023, 49.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2680, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.43, 67.54, 1.514, 6.66, '2025-12-22 09:18:47', '0', 116.380636, 39.908200, 45.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2681, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.40, 60.13, 1.117, 6.34, '2025-12-22 08:18:47', '0', 116.387480, 39.912553, 53.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2682, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.59, 61.99, 1.109, 6.67, '2025-12-22 07:18:47', '0', 116.392048, 39.919903, 51.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2683, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.85, 60.42, 1.731, 6.89, '2025-12-22 06:18:47', '0', 116.391005, 39.918600, 56.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2684, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.03, 74.83, 1.208, 6.50, '2025-12-22 05:18:47', '0', 116.398978, 39.920266, 58.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2685, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.65, 67.56, 0.952, 6.25, '2025-12-22 04:18:47', '0', 116.400519, 39.932044, 21.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2686, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.39, 70.59, 1.301, 6.27, '2025-12-22 03:18:47', '0', 116.384750, 39.908466, 57.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2687, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.01, 71.82, 1.004, 6.32, '2025-12-22 02:18:47', '0', 116.414602, 39.911089, 50.63, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2688, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.39, 60.82, 1.913, 5.37, '2025-12-22 01:18:47', '0', 116.395411, 39.917358, 42.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2689, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.73, 81.08, 0.666, 6.44, '2025-12-22 00:18:47', '0', 116.401872, 39.924014, 52.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2690, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.21, 63.31, 0.778, 5.63, '2025-12-21 23:18:47', '0', 116.376113, 39.922562, 55.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2691, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.38, 72.52, 0.461, 6.72, '2025-12-21 22:18:47', '0', 116.402170, 39.900534, 60.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2692, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.49, 70.03, 1.242, 6.07, '2025-12-21 21:18:47', '0', 116.423847, 39.903034, 42.94, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2693, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.17, 76.16, 1.051, 6.36, '2025-12-21 20:18:47', '0', 116.391505, 39.908055, 42.31, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2694, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.46, 70.97, 1.110, 6.50, '2025-12-21 19:18:47', '0', 116.389602, 39.899247, 49.89, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2695, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.87, 77.68, 1.287, 5.92, '2025-12-21 18:18:47', '0', 116.404493, 39.907096, 51.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2696, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.22, 79.36, 1.128, 6.49, '2025-12-21 17:18:47', '0', 116.403325, 39.903617, 57.65, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2697, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.54, 70.41, 1.247, 7.05, '2025-12-21 16:18:47', '0', 116.400313, 39.915801, 63.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2698, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.49, 77.13, 1.170, 6.28, '2025-12-21 15:18:47', '0', 116.398977, 39.901850, 45.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2699, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.54, 78.22, 0.465, 6.32, '2025-12-21 14:18:47', '0', 116.385445, 39.877473, 52.57, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2700, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.99, 69.34, 1.303, 6.71, '2025-12-21 13:18:47', '0', 116.398698, 39.906724, 52.23, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2701, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.40, 79.83, 1.014, 6.90, '2025-12-21 12:18:47', '0', 116.397989, 39.898043, 34.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2702, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.70, 86.10, 1.373, 6.26, '2025-12-21 11:18:47', '0', 116.397195, 39.899878, 52.28, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2703, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.11, 81.19, 1.061, 5.75, '2025-12-21 10:18:47', '0', 116.414893, 39.903453, 47.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2704, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.37, 81.43, 1.419, 6.50, '2025-12-21 09:18:47', '0', 116.388320, 39.915909, 35.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2705, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.56, 85.82, 1.087, 5.84, '2025-12-21 08:18:47', '0', 116.407778, 39.915797, 49.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2706, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.46, 80.54, 1.476, 7.25, '2025-12-21 07:18:47', '0', 116.389738, 39.907281, 50.88, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2707, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.13, 79.33, 1.424, 6.83, '2025-12-21 06:18:47', '0', 116.392800, 39.897148, 38.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2708, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.25, 72.00, 1.219, 6.09, '2025-12-21 05:18:47', '0', 116.396982, 39.912794, 46.77, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2709, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.48, 79.59, 1.141, 7.07, '2025-12-21 04:18:47', '0', 116.397530, 39.916807, 58.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2710, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.35, 74.78, 1.099, 6.82, '2025-12-21 03:18:47', '0', 116.383054, 39.905547, 45.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2711, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.25, 80.58, 1.019, 5.95, '2025-12-21 02:18:47', '0', 116.390634, 39.903388, 41.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2712, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.00, 84.26, 1.491, 6.39, '2025-12-21 01:18:47', '0', 116.407068, 39.925530, 57.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2713, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.70, 76.98, 0.858, 7.80, '2025-12-21 00:18:47', '0', 116.388634, 39.896261, 45.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2714, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.26, 83.41, 1.151, 6.41, '2025-12-20 23:18:47', '0', 116.380300, 39.910072, 46.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2715, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.44, 76.39, 0.949, 6.75, '2025-12-20 22:18:47', '0', 116.385457, 39.897759, 67.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2716, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.17, 81.49, 1.329, 6.41, '2025-12-20 21:18:47', '0', 116.396449, 39.890346, 55.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2717, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.85, 81.17, 0.685, 6.96, '2025-12-20 20:18:47', '0', 116.403627, 39.900671, 39.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2718, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.25, 76.07, 1.182, 6.26, '2025-12-20 19:18:47', '0', 116.353769, 39.931002, 57.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2719, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.21, 82.64, 1.222, 6.01, '2025-12-20 18:18:47', '0', 116.403393, 39.914615, 60.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2720, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.50, 83.17, 1.440, 7.01, '2025-12-20 17:18:47', '0', 116.403541, 39.917323, 60.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2721, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.17, 79.14, 1.285, 6.15, '2025-12-20 16:18:47', '0', 116.400641, 39.917089, 42.22, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2722, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.03, 81.02, 1.191, 6.05, '2025-12-20 15:18:47', '0', 116.395672, 39.902955, 46.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2723, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.74, 71.38, 0.941, 6.04, '2025-12-20 14:18:47', '0', 116.402377, 39.914305, 48.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2724, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.26, 85.67, 1.341, 6.39, '2025-12-20 13:18:47', '0', 116.395238, 39.903602, 44.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2725, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.53, 78.62, 0.711, 6.67, '2025-12-20 12:18:47', '0', 116.405087, 39.915954, 56.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2726, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.71, 88.75, 0.663, 6.46, '2025-12-20 11:18:47', '0', 116.416644, 39.916279, 53.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2727, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.74, 77.19, 1.375, 6.82, '2025-12-20 10:18:47', '0', 116.395157, 39.907485, 42.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2728, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.06, 78.98, 1.293, 6.30, '2025-12-20 09:18:47', '0', 116.416462, 39.897334, 45.67, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2729, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.13, 75.37, 0.583, 6.74, '2025-12-20 08:18:47', '0', 116.409316, 39.918989, 52.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2730, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.67, 70.43, 0.805, 6.86, '2025-12-20 07:18:47', '0', 116.391689, 39.922332, 48.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2731, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.50, 83.80, 1.337, 6.06, '2025-12-20 06:18:47', '0', 116.403720, 39.902827, 56.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2732, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.01, 76.23, 1.178, 5.17, '2025-12-20 05:18:47', '0', 116.401029, 39.898399, 46.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2733, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.91, 77.95, 0.845, 6.41, '2025-12-20 04:18:47', '0', 116.414456, 39.921084, 54.22, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2734, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.29, 71.30, 1.292, 5.97, '2025-12-20 03:18:47', '0', 116.405305, 39.910887, 45.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2735, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.10, 78.27, 0.876, 6.47, '2025-12-20 02:18:47', '0', 116.385306, 39.920217, 65.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2736, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.90, 83.23, 1.714, 5.16, '2025-12-20 01:18:47', '0', 116.389793, 39.907190, 43.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2737, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.83, 69.55, 1.450, 6.97, '2025-12-20 00:18:47', '0', 116.417430, 39.919581, 19.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2738, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.54, 78.36, 1.569, 5.87, '2025-12-19 23:18:47', '0', 116.382159, 39.916666, 52.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2739, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.76, 63.51, 0.964, 6.62, '2025-12-19 22:18:47', '0', 116.408096, 39.897519, 68.35, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2740, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.09, 70.66, 1.464, 6.20, '2025-12-19 21:18:47', '0', 116.394684, 39.893970, 70.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2741, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.50, 71.87, 0.806, 7.00, '2025-12-19 20:18:47', '0', 116.418252, 39.911432, 45.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2742, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.31, 72.77, 1.222, 6.97, '2025-12-19 19:18:47', '0', 116.399926, 39.906745, 41.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2743, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.19, 65.43, 1.505, 7.35, '2025-12-19 18:18:47', '0', 116.394983, 39.904573, 48.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2744, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.15, 73.36, 1.181, 6.39, '2025-12-19 17:18:47', '0', 116.404283, 39.916323, 50.81, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2745, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.69, 69.87, 1.306, 6.05, '2025-12-19 16:18:47', '0', 116.402428, 39.923475, 55.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2746, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.55, 76.10, 1.383, 6.53, '2025-12-19 15:18:47', '0', 116.391533, 39.917404, 55.34, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2747, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.10, 67.40, 1.491, 6.52, '2025-12-19 14:18:47', '0', 116.403584, 39.900496, 49.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2748, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.71, 65.43, 1.290, 5.92, '2025-12-19 13:18:47', '0', 116.388949, 39.909793, 48.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2749, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.09, 65.65, 1.352, 6.76, '2025-12-19 12:18:47', '0', 116.410027, 39.926725, 44.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2750, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.92, 70.12, 1.156, 7.08, '2025-12-19 11:18:47', '0', 116.390209, 39.913176, 64.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2751, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.33, 64.15, 1.154, 6.35, '2025-12-19 10:18:47', '0', 116.399443, 39.905893, 40.20, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2752, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.92, 58.25, 1.347, 6.67, '2025-12-19 09:18:47', '0', 116.401114, 39.903368, 60.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2753, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.31, 60.08, 1.855, 6.96, '2025-12-19 08:18:47', '0', 116.408198, 39.914648, 49.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2754, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.54, 67.29, 1.078, 6.20, '2025-12-19 07:18:47', '0', 116.395023, 39.913106, 53.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2755, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.30, 51.50, 1.185, 6.54, '2025-12-19 06:18:47', '0', 116.403696, 39.898805, 79.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2756, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.05, 68.76, 0.920, 6.81, '2025-12-19 05:18:47', '0', 116.405756, 39.914096, 34.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2757, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.91, 59.14, 1.680, 6.17, '2025-12-19 04:18:47', '0', 116.414822, 39.903396, 46.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2758, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.83, 51.70, 0.968, 6.37, '2025-12-19 03:18:47', '0', 116.390283, 39.906127, 36.73, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2759, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.00, 49.48, 1.624, 6.70, '2025-12-19 02:18:47', '0', 116.394354, 39.914863, 45.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2760, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.22, 57.92, 1.299, 6.76, '2025-12-19 01:18:47', '0', 116.402488, 39.912677, 47.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2761, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.39, 56.59, 0.570, 6.94, '2025-12-19 00:18:47', '0', 116.411905, 39.919141, 39.62, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2762, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.38, 55.14, 0.375, 6.38, '2025-12-18 23:18:47', '0', 116.388967, 39.913608, 48.77, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2763, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.95, 55.02, 1.337, 5.74, '2025-12-18 22:18:47', '0', 116.393076, 39.896136, 59.44, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2764, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.70, 52.36, 1.341, 6.29, '2025-12-18 21:18:47', '0', 116.386535, 39.907893, 35.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2765, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.39, 46.80, 0.925, 6.35, '2025-12-18 20:18:47', '0', 116.394153, 39.919989, 42.31, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2766, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.08, 57.97, 1.049, 6.09, '2025-12-18 19:18:47', '0', 116.397358, 39.913482, 56.44, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2767, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.87, 56.08, 0.849, 6.43, '2025-12-18 18:18:47', '0', 116.414350, 39.900980, 34.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2768, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.92, 49.65, 0.859, 6.91, '2025-12-18 17:18:47', '0', 116.407423, 39.899360, 45.64, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2769, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.76, 43.70, 0.966, 6.22, '2025-12-18 16:18:47', '0', 116.383853, 39.912106, 36.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2770, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.70, 47.81, 1.373, 6.23, '2025-12-18 15:18:47', '0', 116.388491, 39.896835, 56.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2771, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.34, 58.65, 1.006, 7.73, '2025-12-18 14:18:47', '0', 116.389760, 39.897165, 33.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2772, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.78, 52.22, 1.032, 6.00, '2025-12-18 13:18:47', '0', 116.399293, 39.913059, 54.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2773, 'DEVICE_FIELD_003_001', 'FIELD_003', 33.49, 50.62, 1.110, 5.80, '2025-12-18 12:18:47', '0', 116.409408, 39.917074, 58.64, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2774, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.23, 48.62, 1.052, 5.73, '2025-12-18 11:18:47', '0', 116.389863, 39.904304, 42.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2775, 'DEVICE_FIELD_003_001', 'FIELD_003', 33.44, 52.03, 1.236, 6.01, '2025-12-18 10:18:47', '0', 116.396852, 39.913911, 33.94, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2776, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.40, 44.99, 1.818, 6.69, '2025-12-18 09:18:47', '0', 116.388608, 39.907829, 53.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2777, 'DEVICE_FIELD_003_001', 'FIELD_003', 33.17, 48.84, 0.760, 5.80, '2025-12-18 08:18:47', '0', 116.406251, 39.888952, 39.20, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2778, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.75, 45.98, 0.931, 6.31, '2025-12-18 07:18:47', '0', 116.398425, 39.902754, 50.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2779, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.89, 43.84, 1.470, 6.79, '2025-12-18 06:18:47', '0', 116.388717, 39.910119, 45.31, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2780, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.08, 52.15, 1.036, 6.04, '2025-12-18 05:18:47', '0', 116.413175, 39.905497, 46.22, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2781, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.81, 47.80, 0.733, 6.20, '2025-12-18 04:18:47', '0', 116.413595, 39.902411, 61.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2782, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.60, 48.95, 1.653, 7.30, '2025-12-18 03:18:47', '0', 116.411393, 39.910491, 44.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2783, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.73, 36.74, 1.054, 6.49, '2025-12-18 02:18:47', '0', 116.385580, 39.911990, 58.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2784, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.82, 48.59, 1.099, 6.85, '2025-12-18 01:18:47', '0', 116.392366, 39.919361, 53.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2785, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.29, 53.91, 1.431, 7.11, '2025-12-18 00:18:47', '0', 116.391182, 39.907340, 50.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2786, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.57, 44.01, 0.918, 5.85, '2025-12-17 23:18:47', '0', 116.398244, 39.909649, 42.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2787, 'DEVICE_FIELD_003_001', 'FIELD_003', 5.59, 28.01, 0.861, 7.01, '2025-12-17 22:18:47', '0', 116.387827, 39.914873, 57.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2788, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.82, 41.16, 0.964, 6.76, '2025-12-17 21:18:47', '0', 116.384739, 39.905412, 62.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2789, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.89, 43.25, 1.513, 7.34, '2025-12-17 20:18:47', '0', 116.388554, 39.903508, 51.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2790, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.61, 39.71, 1.176, 6.28, '2025-12-17 19:18:47', '0', 116.386244, 39.904778, 46.12, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2791, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.68, 36.11, 1.146, 6.94, '2025-12-17 18:18:47', '0', 116.411744, 39.905387, 58.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2792, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.80, 41.87, 1.225, 6.48, '2025-12-17 17:18:47', '0', 116.393732, 39.909834, 46.35, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2793, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.20, 47.48, 1.470, 6.91, '2025-12-17 16:18:47', '0', 116.411212, 39.903833, 50.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2794, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.15, 43.66, 1.071, 7.94, '2025-12-17 15:18:47', '0', 116.369314, 39.891311, 31.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2795, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.03, 37.38, 0.854, 6.42, '2025-12-17 14:18:47', '0', 116.400125, 39.901521, 43.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2796, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.64, 44.74, 1.240, 6.27, '2025-12-17 13:18:47', '0', 116.396486, 39.909871, 47.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2797, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.00, 36.96, 1.760, 6.05, '2025-12-17 12:18:47', '0', 116.395555, 39.905022, 55.62, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2798, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.87, 46.59, 1.401, 6.37, '2025-12-17 11:18:47', '0', 116.389546, 39.919496, 47.73, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2799, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.96, 44.96, 1.356, 6.60, '2025-12-17 10:18:47', '0', 116.395197, 39.903872, 54.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2800, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.72, 40.67, 1.426, 6.44, '2025-12-17 09:18:47', '0', 116.397926, 39.913389, 53.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2801, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.21, 35.24, 1.145, 6.61, '2025-12-17 08:18:47', '0', 116.401157, 39.892109, 74.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2802, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.31, 36.38, 1.414, 6.93, '2025-12-17 07:18:47', '0', 116.410311, 39.906535, 59.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2803, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.71, 42.19, 1.621, 6.67, '2025-12-17 06:18:47', '0', 116.406969, 39.898668, 59.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2804, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.54, 46.73, 1.528, 6.57, '2025-12-17 05:18:47', '0', 116.387990, 39.910318, 47.90, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2805, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.40, 45.44, 1.357, 6.94, '2025-12-17 04:18:47', '0', 116.398943, 39.905414, 50.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2806, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.67, 34.63, 1.133, 6.01, '2025-12-17 03:18:47', '0', 116.382593, 39.905186, 47.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2807, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.70, 40.07, 1.169, 6.54, '2025-12-17 02:18:47', '0', 116.391970, 39.907063, 45.15, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2808, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.03, 41.04, 1.225, 5.86, '2025-12-17 01:18:47', '0', 116.391470, 39.910589, 45.41, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2809, 'DEVICE_FIELD_003_001', 'FIELD_003', 2.62, 37.97, 1.165, 5.81, '2025-12-17 00:18:47', '0', 116.410257, 39.899103, 42.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2810, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.51, 44.16, 0.973, 5.86, '2025-12-16 23:18:47', '0', 116.396125, 39.910405, 59.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2811, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.62, 40.98, 1.200, 5.93, '2025-12-16 22:18:47', '0', 116.388516, 39.900450, 33.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2812, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.94, 41.68, 0.879, 7.63, '2025-12-16 21:18:47', '0', 116.397946, 39.921658, 59.26, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2813, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.78, 47.73, 0.838, 6.85, '2025-12-16 20:18:47', '0', 116.400643, 39.907760, 68.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2814, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.39, 45.45, 0.503, 5.86, '2025-12-16 19:18:47', '0', 116.384388, 39.903436, 39.53, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2815, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.46, 46.09, 1.027, 6.04, '2025-12-16 18:18:47', '0', 116.400978, 39.904775, 57.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2816, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.53, 48.68, 1.303, 6.19, '2025-12-16 17:18:47', '0', 116.395364, 39.915381, 60.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2817, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.77, 39.70, 1.295, 6.78, '2025-12-16 16:18:47', '0', 116.398360, 39.916692, 40.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2818, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.63, 43.27, 1.425, 6.34, '2025-12-16 15:18:47', '0', 116.397790, 39.922270, 25.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2819, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.39, 46.10, 0.611, 6.49, '2025-12-16 14:18:47', '0', 116.421806, 39.903764, 52.34, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2820, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.36, 47.28, 1.901, 7.36, '2025-12-16 13:18:47', '0', 116.408520, 39.919302, 62.56, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2821, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.74, 44.55, 0.988, 6.78, '2025-12-16 12:18:47', '0', 116.381146, 39.905680, 70.79, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2822, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.83, 46.52, 1.208, 6.59, '2025-12-16 11:18:47', '0', 116.376476, 39.904714, 47.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2823, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.63, 45.57, 1.669, 6.56, '2025-12-16 10:18:47', '0', 116.399569, 39.902319, 41.91, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2824, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.47, 46.38, 1.645, 6.68, '2025-12-16 09:18:47', '0', 116.390797, 39.912142, 45.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2825, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.41, 53.80, 0.966, 6.76, '2025-12-16 08:18:47', '0', 116.399231, 39.929143, 43.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2826, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.33, 47.70, 0.932, 6.71, '2025-12-16 07:18:47', '0', 116.399165, 39.899537, 44.21, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2827, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.66, 56.19, 1.165, 7.28, '2025-12-16 06:18:47', '0', 116.394011, 39.908960, 50.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2828, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.32, 42.89, 0.742, 6.80, '2025-12-16 05:18:47', '0', 116.396788, 39.906087, 56.45, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2829, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.64, 56.64, 1.434, 6.76, '2025-12-16 04:18:47', '0', 116.402756, 39.919360, 50.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2830, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.50, 49.70, 1.071, 6.74, '2025-12-16 03:18:47', '0', 116.387418, 39.898811, 42.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2831, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.24, 49.27, 1.049, 6.57, '2025-12-16 02:18:47', '0', 116.383084, 39.895322, 46.46, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2832, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.28, 55.64, 1.114, 6.21, '2025-12-16 01:18:47', '0', 116.399372, 39.914856, 61.14, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2833, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.96, 49.95, 1.240, 6.37, '2025-12-16 00:18:47', '0', 116.410118, 39.894800, 40.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2834, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.07, 55.10, 1.322, 6.68, '2025-12-15 23:18:47', '0', 116.381748, 39.913302, 54.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2835, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.63, 56.65, 0.910, 7.26, '2025-12-15 22:18:47', '0', 116.403620, 39.911205, 46.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2836, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.01, 56.46, 1.213, 6.63, '2025-12-15 21:18:47', '0', 116.399434, 39.908083, 36.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2837, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.85, 49.11, 0.552, 5.73, '2025-12-15 20:18:47', '0', 116.411228, 39.914973, 56.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2838, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.51, 52.30, 1.111, 6.03, '2025-12-15 19:18:47', '0', 116.406990, 39.912176, 47.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2839, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.16, 64.50, 1.358, 6.93, '2025-12-15 18:18:47', '0', 116.387713, 39.906839, 54.33, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2840, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.27, 56.20, 1.378, 6.20, '2025-12-15 17:18:47', '0', 116.394421, 39.916653, 42.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2841, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.90, 57.89, 1.683, 7.00, '2025-12-15 16:18:47', '0', 116.394410, 39.899431, 53.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2842, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.84, 60.84, 0.981, 6.32, '2025-12-15 15:18:47', '0', 116.391582, 39.908335, 58.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2843, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.17, 64.69, 1.218, 6.06, '2025-12-15 14:18:47', '0', 116.404217, 39.900433, 52.97, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2844, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.82, 55.46, 1.321, 6.85, '2025-12-15 13:18:47', '0', 116.377053, 39.929068, 48.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2845, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.14, 56.22, 1.463, 7.05, '2025-12-15 12:18:47', '0', 116.396824, 39.901900, 60.14, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2846, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.12, 71.36, 1.102, 5.89, '2025-12-15 11:18:47', '0', 116.371314, 39.907924, 50.77, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2847, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.48, 59.26, 1.389, 7.38, '2025-12-15 10:18:47', '0', 116.405794, 39.913521, 64.37, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2848, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.60, 65.25, 1.481, 6.82, '2025-12-15 09:18:47', '0', 116.411333, 39.898858, 45.12, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2849, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.75, 68.51, 1.865, 6.14, '2025-12-15 08:18:47', '0', 116.399742, 39.917575, 40.93, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2850, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.53, 64.08, 1.429, 6.93, '2025-12-15 07:18:47', '0', 116.374671, 39.930039, 39.87, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2851, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.58, 66.05, 0.849, 7.18, '2025-12-15 06:18:47', '0', 116.412090, 39.916010, 61.61, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2852, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.19, 74.08, 1.342, 6.82, '2025-12-15 05:18:47', '0', 116.407269, 39.923896, 58.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2853, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.02, 66.59, 1.336, 6.92, '2025-12-15 04:18:47', '0', 116.411204, 39.900475, 56.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2854, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.11, 70.62, 1.135, 6.68, '2025-12-15 03:18:47', '0', 116.416665, 39.907746, 53.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2855, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.80, 69.86, 0.931, 6.29, '2025-12-15 02:18:47', '0', 116.389332, 39.906760, 56.45, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2856, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.90, 74.06, 0.870, 5.73, '2025-12-15 01:18:47', '0', 116.398719, 39.905399, 58.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2857, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.22, 69.10, 0.774, 6.29, '2025-12-15 00:18:47', '0', 116.399654, 39.921478, 46.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2858, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.85, 63.43, 1.431, 6.45, '2025-12-14 23:18:47', '0', 116.379941, 39.904535, 57.89, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2859, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.05, 82.20, 1.208, 6.41, '2025-12-14 22:18:47', '0', 116.415843, 39.914362, 35.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2860, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.35, 74.49, 1.173, 6.07, '2025-12-14 21:18:47', '0', 116.388972, 39.897484, 53.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2861, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.62, 69.49, 1.293, 6.16, '2025-12-14 20:18:47', '0', 116.401807, 39.910684, 37.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2862, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.94, 70.84, 1.190, 5.72, '2025-12-14 19:18:47', '0', 116.378986, 39.901020, 49.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2863, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.10, 70.70, 0.948, 6.69, '2025-12-14 18:18:47', '0', 116.395648, 39.898113, 28.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2864, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.55, 77.81, 1.604, 5.84, '2025-12-14 17:18:47', '0', 116.398408, 39.913740, 66.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2865, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.77, 79.17, 1.359, 6.73, '2025-12-14 16:18:47', '0', 116.400027, 39.899902, 55.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2866, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.09, 73.33, 0.811, 6.02, '2025-12-14 15:18:47', '0', 116.398597, 39.889023, 40.46, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2867, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.77, 80.42, 1.239, 5.49, '2025-12-14 14:18:47', '0', 116.393328, 39.898140, 54.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2868, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.61, 77.41, 0.675, 6.01, '2025-12-14 13:18:47', '0', 116.374777, 39.896017, 41.09, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2869, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.57, 75.84, 1.010, 6.23, '2025-12-14 12:18:47', '0', 116.397081, 39.914206, 45.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2870, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.31, 82.30, 1.727, 6.89, '2025-12-14 11:18:47', '0', 116.387251, 39.913545, 48.69, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2871, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.43, 83.66, 1.485, 6.95, '2025-12-14 10:18:47', '0', 116.390421, 39.906184, 55.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2872, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.92, 70.01, 0.654, 6.26, '2025-12-14 09:18:47', '0', 116.403522, 39.901231, 42.60, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2873, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.98, 70.24, 1.100, 5.69, '2025-12-14 08:18:47', '0', 116.410603, 39.918694, 62.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2874, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.36, 80.53, 1.486, 6.97, '2025-12-14 07:18:47', '0', 116.401707, 39.903170, 47.29, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2875, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.43, 79.33, 1.489, 6.53, '2025-12-14 06:18:47', '0', 116.404726, 39.910947, 71.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2876, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.92, 89.35, 0.999, 5.76, '2025-12-14 05:18:47', '0', 116.402055, 39.901617, 59.33, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2877, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.98, 77.14, 1.419, 5.49, '2025-12-14 04:18:47', '0', 116.414595, 39.914433, 43.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2878, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.82, 74.19, 0.976, 6.83, '2025-12-14 03:18:47', '0', 116.389603, 39.907795, 63.96, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2879, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.20, 84.07, 1.682, 6.06, '2025-12-14 02:18:47', '0', 116.417772, 39.901641, 50.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2880, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.36, 88.36, 1.720, 6.31, '2025-12-14 01:18:47', '0', 116.392575, 39.911576, 48.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2881, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.21, 81.03, 1.179, 6.83, '2025-12-14 00:18:47', '0', 116.395834, 39.900183, 40.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2882, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.43, 77.18, 0.814, 6.58, '2025-12-13 23:18:47', '0', 116.393601, 39.926670, 49.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2883, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.39, 81.68, 1.796, 7.33, '2025-12-13 22:18:47', '0', 116.385838, 39.916814, 37.35, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2884, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.45, 82.26, 1.158, 7.30, '2025-12-13 21:18:47', '0', 116.388500, 39.909402, 69.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2885, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.71, 79.27, 1.187, 6.47, '2025-12-13 20:18:47', '0', 116.392879, 39.897454, 45.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2886, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.50, 80.92, 0.839, 6.05, '2025-12-13 19:18:47', '0', 116.375807, 39.913779, 47.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2887, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.32, 80.12, 1.392, 6.52, '2025-12-13 18:18:47', '0', 116.416327, 39.901460, 45.66, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2888, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.57, 84.00, 1.386, 6.49, '2025-12-13 17:18:47', '0', 116.402821, 39.906022, 62.18, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2889, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.19, 82.54, 1.448, 6.52, '2025-12-13 16:18:47', '0', 116.391930, 39.892369, 50.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2890, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.59, 76.72, 1.723, 5.91, '2025-12-13 15:18:47', '0', 116.408555, 39.908646, 50.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2891, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.88, 80.78, 1.332, 6.49, '2025-12-13 14:18:47', '0', 116.418534, 39.908347, 56.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2892, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.41, 74.76, 0.843, 6.78, '2025-12-13 13:18:47', '0', 116.398594, 39.924163, 55.63, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2893, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.22, 75.01, 1.130, 6.70, '2025-12-13 12:18:47', '0', 116.399690, 39.886907, 55.92, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2894, 'DEVICE_FIELD_003_001', 'FIELD_003', 33.95, 86.49, 1.338, 5.95, '2025-12-13 11:18:47', '0', 116.382745, 39.906035, 44.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2895, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.21, 69.78, 1.102, 5.71, '2025-12-13 10:18:47', '0', 116.414885, 39.909574, 50.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2896, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.78, 80.32, 0.821, 7.04, '2025-12-13 09:18:47', '0', 116.389820, 39.906219, 49.14, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2897, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.01, 77.72, 1.074, 6.49, '2025-12-13 08:18:47', '0', 116.389625, 39.905743, 34.39, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2898, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.54, 69.40, 1.139, 7.18, '2025-12-13 07:18:47', '0', 116.388636, 39.892473, 48.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2899, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.24, 75.86, 1.031, 6.47, '2025-12-13 06:18:47', '0', 116.408666, 39.925269, 65.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2900, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.51, 71.69, 1.023, 6.77, '2025-12-13 05:18:47', '0', 116.392192, 39.898887, 50.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2901, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.30, 78.30, 1.126, 6.88, '2025-12-13 04:18:47', '0', 116.387691, 39.914734, 62.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2902, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.09, 84.46, 1.635, 7.13, '2025-12-13 03:18:47', '0', 116.391326, 39.915387, 31.22, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2903, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.48, 70.32, 0.795, 6.60, '2025-12-13 02:18:47', '0', 116.384017, 39.907915, 65.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2904, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.93, 71.52, 0.871, 6.08, '2025-12-13 01:18:47', '0', 116.403320, 39.894256, 46.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2905, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.01, 78.06, 1.288, 6.11, '2025-12-13 00:18:47', '0', 116.396701, 39.924135, 44.55, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2906, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.28, 78.36, 1.010, 6.55, '2025-12-12 23:18:47', '0', 116.403082, 39.907228, 38.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2907, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.80, 82.79, 1.171, 6.21, '2025-12-12 22:18:47', '0', 116.405825, 39.893164, 46.78, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2908, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.72, 75.38, 1.556, 6.56, '2025-12-12 21:18:47', '0', 116.398699, 39.906204, 39.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2909, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.42, 70.68, 1.301, 6.39, '2025-12-12 20:18:47', '0', 116.397951, 39.908490, 70.05, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2910, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.83, 70.89, 1.324, 5.99, '2025-12-12 19:18:47', '0', 116.400290, 39.908270, 60.02, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2911, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.82, 74.31, 0.927, 6.20, '2025-12-12 18:18:47', '0', 116.404259, 39.905854, 57.06, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2912, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.27, 72.84, 1.189, 5.86, '2025-12-12 17:18:47', '0', 116.394899, 39.919850, 51.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2913, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.76, 73.18, 0.963, 6.02, '2025-12-12 16:18:47', '0', 116.410160, 39.903320, 62.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2914, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.14, 72.84, 1.435, 6.61, '2025-12-12 15:18:47', '0', 116.382998, 39.919926, 32.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2915, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.87, 67.28, 1.450, 6.88, '2025-12-12 14:18:47', '0', 116.407970, 39.901819, 67.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2916, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.81, 60.13, 1.205, 6.19, '2025-12-12 13:18:47', '0', 116.396645, 39.907465, 64.89, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2917, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.64, 63.58, 1.198, 7.52, '2025-12-12 12:18:47', '0', 116.389624, 39.914525, 53.48, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2918, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.69, 60.04, 0.882, 6.72, '2025-12-12 11:18:47', '0', 116.385949, 39.913519, 50.33, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2919, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.70, 78.23, 1.000, 7.10, '2025-12-12 10:18:47', '0', 116.402894, 39.897503, 49.49, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2920, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.52, 67.51, 1.086, 6.61, '2025-12-12 09:18:47', '0', 116.407568, 39.916899, 47.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2921, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.62, 59.43, 1.270, 6.73, '2025-12-12 08:18:47', '0', 116.388362, 39.915313, 57.31, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2922, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.44, 54.33, 1.263, 6.05, '2025-12-12 07:18:47', '0', 116.379687, 39.922710, 31.58, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2923, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.54, 58.81, 1.700, 6.85, '2025-12-12 06:18:47', '0', 116.409475, 39.906100, 42.86, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2924, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.50, 67.53, 1.775, 6.36, '2025-12-12 05:18:47', '0', 116.380184, 39.914648, 45.23, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2925, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.50, 60.91, 1.230, 6.79, '2025-12-12 04:18:47', '0', 116.385486, 39.922558, 50.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2926, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.63, 67.45, 1.351, 6.22, '2025-12-12 03:18:47', '0', 116.390943, 39.917608, 49.17, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2927, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.61, 52.42, 1.621, 5.55, '2025-12-12 02:18:47', '0', 116.400926, 39.908876, 44.30, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2928, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.07, 66.57, 1.216, 5.55, '2025-12-12 01:18:47', '0', 116.400551, 39.912170, 42.31, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2929, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.84, 56.89, 1.206, 6.95, '2025-12-12 00:18:47', '0', 116.387699, 39.925333, 42.59, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2930, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.72, 56.99, 1.184, 6.42, '2025-12-11 23:18:47', '0', 116.395351, 39.891014, 55.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2931, 'DEVICE_FIELD_003_001', 'FIELD_003', 7.81, 58.10, 1.761, 6.67, '2025-12-11 22:18:47', '0', 116.395447, 39.892791, 52.99, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2932, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.90, 55.44, 1.887, 6.03, '2025-12-11 21:18:47', '0', 116.383363, 39.908665, 51.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2933, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.37, 50.88, 0.904, 7.24, '2025-12-11 20:18:47', '0', 116.393005, 39.896131, 39.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2934, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.93, 53.95, 1.577, 6.10, '2025-12-11 19:18:47', '0', 116.404529, 39.910038, 52.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2935, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.07, 58.56, 0.380, 6.42, '2025-12-11 18:18:47', '0', 116.417738, 39.912548, 39.13, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2936, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.73, 62.13, 0.521, 6.72, '2025-12-11 17:18:47', '0', 116.395575, 39.902698, 45.51, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2937, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.61, 55.04, 1.216, 7.32, '2025-12-11 16:18:47', '0', 116.403656, 39.901410, 48.87, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2938, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.47, 53.62, 1.130, 7.07, '2025-12-11 15:18:47', '0', 116.388743, 39.911297, 45.52, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2939, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.20, 49.02, 0.890, 6.05, '2025-12-11 14:18:47', '0', 116.406073, 39.901468, 40.55, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2940, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.37, 55.06, 1.274, 6.53, '2025-12-11 13:18:47', '0', 116.387142, 39.912189, 47.73, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2941, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.58, 47.08, 1.710, 7.16, '2025-12-11 12:18:47', '0', 116.397113, 39.914956, 59.83, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2942, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.86, 45.83, 1.631, 6.56, '2025-12-11 11:18:47', '0', 116.404634, 39.910086, 28.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2943, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.77, 46.01, 1.514, 7.59, '2025-12-11 10:18:47', '0', 116.390287, 39.910486, 43.08, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2944, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.05, 38.63, 1.086, 5.67, '2025-12-11 09:18:47', '0', 116.403308, 39.898961, 52.70, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2945, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.23, 40.42, 1.362, 6.06, '2025-12-11 08:18:47', '0', 116.412460, 39.900298, 49.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2946, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.74, 50.99, 1.088, 6.56, '2025-12-11 07:18:47', '0', 116.386856, 39.905156, 64.43, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2947, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.08, 44.05, 1.281, 6.50, '2025-12-11 06:18:47', '0', 116.401294, 39.913114, 44.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2948, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.28, 48.58, 1.101, 5.43, '2025-12-11 05:18:47', '0', 116.382202, 39.916146, 51.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2949, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.63, 45.74, 1.488, 6.12, '2025-12-11 04:18:47', '0', 116.382451, 39.904802, 71.77, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2950, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.47, 51.61, 1.351, 5.66, '2025-12-11 03:18:47', '0', 116.389287, 39.916364, 38.32, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2951, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.83, 40.56, 1.081, 6.30, '2025-12-11 02:18:47', '0', 116.383362, 39.893890, 44.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2952, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.95, 39.26, 1.107, 6.15, '2025-12-11 01:18:47', '0', 116.384738, 39.914957, 45.74, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2953, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.68, 45.68, 1.050, 5.99, '2025-12-11 00:18:47', '0', 116.399852, 39.925013, 54.44, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2954, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.16, 36.79, 1.582, 7.64, '2025-12-10 23:18:47', '0', 116.402140, 39.900066, 52.19, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2955, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.87, 36.25, 0.716, 6.08, '2025-12-10 22:18:47', '0', 116.392372, 39.901251, 53.88, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2956, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.74, 39.62, 0.645, 6.38, '2025-12-10 21:18:47', '0', 116.399656, 39.898040, 67.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2957, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.63, 41.76, 1.221, 6.06, '2025-12-10 20:18:47', '0', 116.411857, 39.914113, 67.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2958, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.96, 45.13, 0.826, 5.71, '2025-12-10 19:18:47', '0', 116.401529, 39.919514, 44.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2959, 'DEVICE_FIELD_003_001', 'FIELD_003', 15.50, 38.13, 1.190, 5.97, '2025-12-10 18:18:47', '0', 116.386307, 39.912463, 50.63, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2960, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.97, 47.18, 1.555, 5.92, '2025-12-10 17:18:47', '0', 116.407731, 39.915221, 47.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2961, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.85, 47.49, 0.699, 5.84, '2025-12-10 16:18:47', '0', 116.390265, 39.901661, 50.68, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2962, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.09, 37.36, 1.372, 6.03, '2025-12-10 15:18:47', '0', 116.401178, 39.897933, 53.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2963, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.21, 41.27, 1.051, 5.70, '2025-12-10 14:18:47', '0', 116.407454, 39.908273, 51.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2964, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.86, 41.10, 0.917, 7.70, '2025-12-10 13:18:47', '0', 116.398052, 39.901454, 42.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2965, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.65, 32.77, 1.126, 5.74, '2025-12-10 12:18:47', '0', 116.399828, 39.929776, 54.41, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2966, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.43, 34.91, 1.019, 6.23, '2025-12-10 11:18:47', '0', 116.406887, 39.937828, 55.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2967, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.52, 45.04, 1.803, 7.49, '2025-12-10 10:18:47', '0', 116.388862, 39.927812, 62.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2968, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.64, 42.05, 1.575, 6.41, '2025-12-10 09:18:47', '0', 116.401552, 39.896005, 74.04, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2969, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.09, 34.99, 1.095, 6.23, '2025-12-10 08:18:47', '0', 116.394838, 39.907274, 55.40, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2970, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.16, 39.26, 1.244, 6.47, '2025-12-10 07:18:47', '0', 116.402476, 39.907001, 35.65, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2971, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.46, 42.87, 1.221, 6.67, '2025-12-10 06:18:47', '0', 116.397917, 39.894889, 60.42, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2972, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.03, 33.80, 1.703, 6.95, '2025-12-10 05:18:47', '0', 116.384222, 39.918672, 68.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2973, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.03, 34.29, 0.606, 6.51, '2025-12-10 04:18:47', '0', 116.405094, 39.901522, 40.23, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2974, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.18, 29.55, 1.464, 6.51, '2025-12-10 03:18:47', '0', 116.402874, 39.905930, 57.51, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2975, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.57, 34.82, 0.379, 5.93, '2025-12-10 02:18:47', '0', 116.386150, 39.906242, 35.03, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2976, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.51, 43.91, 1.041, 5.58, '2025-12-10 01:18:47', '0', 116.399472, 39.902933, 42.72, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2977, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.22, 39.31, 1.114, 5.45, '2025-12-10 00:18:47', '0', 116.383159, 39.898727, 53.25, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2978, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.27, 43.36, 0.961, 6.96, '2025-12-09 23:18:47', '0', 116.395376, 39.913131, 56.47, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2979, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.71, 47.20, 1.692, 6.20, '2025-12-09 22:18:47', '0', 116.401614, 39.920148, 57.85, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2980, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.46, 46.73, 1.140, 6.30, '2025-12-09 21:18:47', '0', 116.405866, 39.907500, 40.41, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2981, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.25, 36.00, 1.243, 7.06, '2025-12-09 20:18:47', '0', 116.393119, 39.921309, 71.36, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2982, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.51, 43.88, 1.410, 6.08, '2025-12-09 19:18:47', '0', 116.392262, 39.911622, 64.84, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2983, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.85, 42.73, 1.186, 7.39, '2025-12-09 18:18:47', '0', 116.395845, 39.892286, 51.50, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2984, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.50, 40.74, 1.346, 6.70, '2025-12-09 17:18:47', '0', 116.415813, 39.908563, 67.10, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2985, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.42, 45.27, 0.635, 5.69, '2025-12-09 16:18:47', '0', 116.401314, 39.913331, 43.54, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2986, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.04, 42.88, 0.613, 6.65, '2025-12-09 15:18:47', '0', 116.428656, 39.917626, 60.01, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2987, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.80, 50.96, 1.409, 6.70, '2025-12-09 14:18:47', '0', 116.402296, 39.907759, 54.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2988, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.09, 49.98, 1.522, 7.36, '2025-12-09 13:18:47', '0', 116.391019, 39.917751, 73.11, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2989, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.64, 44.79, 0.997, 5.45, '2025-12-09 12:18:47', '0', 116.403025, 39.907653, 54.00, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2990, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.94, 41.26, 0.892, 6.65, '2025-12-09 11:18:47', '0', 116.399253, 39.913219, 46.57, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2991, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.53, 49.11, 0.960, 6.44, '2025-12-09 10:18:47', '0', 116.402384, 39.919762, 57.95, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2992, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.99, 46.24, 1.660, 6.69, '2025-12-09 09:18:47', '0', 116.382261, 39.904999, 45.76, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2993, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.08, 44.52, 1.267, 6.17, '2025-12-09 08:18:47', '0', 116.414593, 39.897494, 52.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2994, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.94, 49.40, 1.429, 6.14, '2025-12-09 07:18:47', '0', 116.384151, 39.906208, 56.16, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2995, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.67, 49.42, 1.004, 6.32, '2025-12-09 06:18:47', '0', 116.406707, 39.915265, 63.27, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2996, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.69, 49.98, 1.129, 6.81, '2025-12-09 05:18:47', '0', 116.384254, 39.899110, 39.71, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2997, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.60, 51.46, 1.516, 6.34, '2025-12-09 04:18:47', '0', 116.395298, 39.918053, 60.80, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2998, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.14, 57.27, 1.393, 6.38, '2025-12-09 03:18:47', '0', 116.400699, 39.921247, 34.38, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (2999, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.02, 44.91, 1.000, 6.61, '2025-12-09 02:18:47', '0', 116.377471, 39.918487, 49.44, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (3000, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.89, 59.61, 0.807, 5.78, '2025-12-09 01:18:47', '0', 116.388377, 39.909260, 55.24, '2026-01-19 17:18:47', NULL);
INSERT INTO `soil_data` VALUES (3001, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.52, 69.67, 1.082, 6.91, '2026-01-19 16:53:54', '0', 116.389581, 39.907161, 68.46, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3002, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.67, 61.97, 1.469, 6.32, '2026-01-19 15:53:54', '0', 116.391682, 39.891345, 50.41, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3003, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.74, 59.96, 0.318, 6.97, '2026-01-19 14:53:54', '0', 116.392759, 39.917721, 60.47, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3004, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.99, 63.49, 1.508, 6.44, '2026-01-19 13:53:54', '0', 116.399961, 39.914355, 37.82, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3005, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.82, 71.53, 1.212, 6.24, '2026-01-19 12:53:54', '0', 116.393077, 39.900237, 39.20, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3006, 'DEVICE_FIELD_001_001', 'FIELD_001', 32.40, 53.87, 1.025, 6.83, '2026-01-19 11:53:54', '0', 116.401201, 39.910186, 43.14, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3007, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.21, 61.56, 1.404, 6.54, '2026-01-19 10:53:54', '0', 116.385343, 39.907827, 53.62, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3008, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.18, 61.44, 1.175, 6.17, '2026-01-19 09:53:54', '0', 116.390734, 39.905663, 57.66, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3009, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.93, 69.89, 1.289, 6.60, '2026-01-19 08:53:54', '0', 116.398686, 39.919231, 51.88, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3010, 'DEVICE_FIELD_001_001', 'FIELD_001', 34.73, 63.56, 1.491, 6.44, '2026-01-19 07:53:54', '0', 116.401749, 39.897161, 49.65, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3011, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.08, 61.91, 1.184, 6.37, '2026-01-19 06:53:54', '0', 116.413887, 39.906954, 57.04, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3012, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.81, 73.57, 1.122, 5.99, '2026-01-19 05:53:54', '0', 116.400868, 39.898088, 35.12, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3013, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.31, 69.36, 1.075, 6.72, '2026-01-19 04:53:54', '0', 116.387932, 39.902608, 40.76, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3014, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.58, 69.48, 0.768, 6.84, '2026-01-19 03:53:54', '0', 116.387214, 39.910504, 51.26, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3015, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.30, 76.08, 1.040, 6.88, '2026-01-19 02:53:54', '0', 116.410601, 39.914788, 21.21, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3016, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.40, 73.14, 1.051, 6.28, '2026-01-19 01:53:54', '0', 116.397121, 39.907334, 61.75, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3017, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.94, 70.19, 0.767, 6.67, '2026-01-19 00:53:54', '0', 116.393969, 39.899146, 43.95, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3018, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.60, 79.24, 1.012, 7.10, '2026-01-18 23:53:54', '0', 116.402190, 39.911747, 43.33, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3019, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.37, 69.53, 1.455, 7.05, '2026-01-18 22:53:54', '0', 116.403343, 39.903453, 61.27, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3020, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.71, 60.41, 1.062, 5.80, '2026-01-18 21:53:54', '0', 116.397181, 39.903313, 41.86, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3021, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.68, 70.19, 1.369, 6.17, '2026-01-18 20:53:54', '0', 116.407554, 39.895528, 56.07, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3022, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.76, 76.73, 0.671, 5.86, '2026-01-18 19:53:54', '0', 116.396011, 39.886953, 45.53, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3023, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.04, 72.34, 1.077, 6.36, '2026-01-18 18:53:54', '0', 116.395703, 39.913806, 35.22, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3024, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.82, 76.74, 1.971, 6.84, '2026-01-18 17:53:54', '0', 116.394096, 39.925464, 68.23, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3025, 'DEVICE_FIELD_001_001', 'FIELD_001', 21.41, 73.19, 0.834, 6.45, '2026-01-18 16:53:54', '0', 116.403811, 39.915079, 35.15, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3026, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.22, 76.46, 1.259, 6.50, '2026-01-18 15:53:54', '0', 116.412521, 39.898415, 43.99, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3027, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.64, 71.63, 1.134, 5.96, '2026-01-18 14:53:54', '0', 116.392321, 39.910040, 55.26, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3028, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.55, 80.57, 1.111, 7.05, '2026-01-18 13:53:54', '0', 116.413537, 39.921932, 61.16, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3029, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.76, 79.90, 1.254, 6.94, '2026-01-18 12:53:54', '0', 116.388138, 39.891500, 53.23, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3030, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.83, 73.48, 1.396, 7.25, '2026-01-18 11:53:54', '0', 116.402478, 39.917850, 46.72, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3031, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.05, 80.57, 1.310, 6.61, '2026-01-18 10:53:54', '0', 116.398068, 39.901553, 57.22, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3032, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.56, 80.95, 1.064, 7.01, '2026-01-18 09:53:54', '0', 116.398600, 39.919054, 48.30, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3033, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.06, 78.24, 1.449, 5.62, '2026-01-18 08:53:54', '0', 116.391787, 39.910027, 56.16, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3034, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.85, 86.41, 1.689, 6.51, '2026-01-18 07:53:54', '0', 116.413604, 39.922490, 41.71, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3035, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.20, 78.11, 1.064, 5.94, '2026-01-18 06:53:54', '0', 116.405348, 39.899770, 54.24, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3036, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.78, 74.15, 1.370, 6.77, '2026-01-18 05:53:54', '0', 116.379991, 39.904590, 63.32, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3037, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.72, 76.49, 1.104, 7.61, '2026-01-18 04:53:54', '0', 116.381703, 39.913005, 42.03, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3038, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.07, 80.44, 1.507, 6.79, '2026-01-18 03:53:54', '0', 116.410021, 39.916234, 39.61, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3039, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.50, 84.58, 0.895, 6.27, '2026-01-18 02:53:54', '0', 116.389321, 39.886498, 60.38, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3040, 'DEVICE_FIELD_001_001', 'FIELD_001', 13.99, 86.99, 1.174, 6.54, '2026-01-18 01:53:54', '0', 116.398840, 39.916943, 53.22, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3041, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.54, 83.32, 1.325, 7.12, '2026-01-18 00:53:54', '0', 116.421021, 39.913528, 55.77, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3042, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.31, 83.83, 1.112, 6.17, '2026-01-17 23:53:54', '0', 116.399271, 39.918623, 47.66, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3043, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.47, 77.94, 1.399, 6.11, '2026-01-17 22:53:54', '0', 116.389499, 39.906114, 65.12, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3044, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.44, 82.12, 1.757, 5.90, '2026-01-17 21:53:54', '0', 116.392685, 39.908544, 50.27, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3045, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.95, 77.64, 1.108, 7.22, '2026-01-17 20:53:54', '0', 116.392215, 39.905865, 47.49, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3046, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.04, 73.82, 1.048, 6.16, '2026-01-17 19:53:54', '0', 116.393604, 39.904254, 50.60, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3047, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.07, 83.99, 1.141, 7.98, '2026-01-17 18:53:54', '0', 116.413172, 39.896154, 52.19, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3048, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.44, 87.23, 1.221, 7.29, '2026-01-17 17:53:54', '0', 116.381821, 39.925363, 50.92, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3049, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.81, 73.58, 0.716, 6.44, '2026-01-17 16:53:54', '0', 116.413686, 39.908394, 51.94, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3050, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.47, 78.83, 1.164, 6.46, '2026-01-17 15:53:54', '0', 116.382107, 39.899679, 56.30, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3051, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.15, 72.29, 1.086, 5.14, '2026-01-17 14:53:54', '0', 116.388328, 39.920261, 67.97, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3052, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.61, 80.11, 1.707, 6.32, '2026-01-17 13:53:54', '0', 116.385345, 39.902378, 48.62, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3053, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.60, 84.07, 1.302, 5.65, '2026-01-17 12:53:54', '0', 116.403479, 39.905688, 49.33, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3054, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.97, 77.92, 1.222, 7.24, '2026-01-17 11:53:54', '0', 116.393374, 39.907823, 38.88, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3055, 'DEVICE_FIELD_001_001', 'FIELD_001', 31.35, 79.94, 1.542, 6.97, '2026-01-17 10:53:54', '0', 116.403220, 39.923849, 41.87, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3056, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.47, 73.62, 1.573, 6.70, '2026-01-17 09:53:54', '0', 116.394903, 39.910253, 47.37, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3057, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.84, 79.76, 1.185, 7.09, '2026-01-17 08:53:54', '0', 116.417304, 39.915274, 39.62, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3058, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.42, 79.76, 0.932, 6.07, '2026-01-17 07:53:54', '0', 116.396477, 39.904714, 27.29, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3059, 'DEVICE_FIELD_001_001', 'FIELD_001', 28.05, 80.97, 1.378, 7.18, '2026-01-17 06:53:54', '0', 116.408758, 39.911645, 50.69, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3060, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.91, 77.82, 1.168, 5.88, '2026-01-17 05:53:54', '0', 116.401148, 39.909324, 46.22, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3061, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.64, 69.48, 1.017, 6.96, '2026-01-17 04:53:54', '0', 116.404936, 39.898841, 52.66, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3062, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.70, 73.51, 1.188, 5.85, '2026-01-17 03:53:54', '0', 116.400953, 39.927634, 51.75, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3063, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.59, 67.28, 1.310, 7.23, '2026-01-17 02:53:54', '0', 116.411359, 39.912039, 51.88, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3064, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.95, 77.91, 1.149, 6.96, '2026-01-17 01:53:54', '0', 116.394227, 39.916089, 65.68, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3065, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.65, 69.96, 0.933, 6.29, '2026-01-17 00:53:54', '0', 116.415110, 39.901883, 41.86, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3066, 'DEVICE_FIELD_001_001', 'FIELD_001', 8.39, 65.17, 0.867, 6.48, '2026-01-16 23:53:54', '0', 116.415122, 39.894829, 42.66, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3067, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.48, 71.06, 1.356, 7.07, '2026-01-16 22:53:54', '0', 116.403649, 39.915483, 50.58, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3068, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.17, 66.45, 1.594, 6.40, '2026-01-16 21:53:54', '0', 116.418883, 39.904920, 50.13, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3069, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.63, 61.19, 1.003, 6.53, '2026-01-16 20:53:54', '0', 116.395412, 39.893239, 60.09, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3070, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.93, 80.70, 1.180, 6.50, '2026-01-16 19:53:54', '0', 116.390224, 39.920433, 60.07, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3071, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.00, 70.56, 1.112, 6.71, '2026-01-16 18:53:54', '0', 116.413033, 39.918187, 61.97, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3072, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.32, 75.92, 1.077, 6.59, '2026-01-16 17:53:54', '0', 116.407860, 39.914052, 48.94, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3073, 'DEVICE_FIELD_001_001', 'FIELD_001', 20.19, 67.97, 1.075, 6.29, '2026-01-16 16:53:54', '0', 116.408539, 39.905517, 39.49, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3074, 'DEVICE_FIELD_001_001', 'FIELD_001', 23.34, 74.41, 1.912, 5.57, '2026-01-16 15:53:54', '0', 116.387599, 39.903065, 56.35, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3075, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.72, 68.73, 0.728, 6.33, '2026-01-16 14:53:54', '0', 116.398835, 39.906202, 46.83, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3076, 'DEVICE_FIELD_001_001', 'FIELD_001', 26.80, 70.01, 2.227, 6.89, '2026-01-16 13:53:54', '0', 116.393554, 39.918483, 38.42, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3077, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.84, 62.05, 1.335, 6.11, '2026-01-16 12:53:54', '0', 116.384634, 39.919831, 59.37, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3078, 'DEVICE_FIELD_001_001', 'FIELD_001', 29.56, 68.02, 1.488, 7.07, '2026-01-16 11:53:54', '0', 116.397744, 39.905560, 51.97, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3079, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.84, 54.22, 0.740, 6.34, '2026-01-16 10:53:54', '0', 116.401422, 39.900282, 39.39, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3080, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.57, 62.15, 1.123, 5.96, '2026-01-16 09:53:54', '0', 116.393347, 39.926071, 56.20, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3081, 'DEVICE_FIELD_001_001', 'FIELD_001', 30.07, 60.92, 1.267, 6.52, '2026-01-16 08:53:54', '0', 116.398269, 39.896472, 53.34, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3082, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.08, 55.36, 1.714, 7.61, '2026-01-16 07:53:54', '0', 116.391416, 39.901287, 59.08, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3083, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.14, 67.18, 1.490, 6.85, '2026-01-16 06:53:54', '0', 116.410518, 39.927420, 48.59, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3084, 'DEVICE_FIELD_001_001', 'FIELD_001', 24.16, 65.23, 1.136, 6.47, '2026-01-16 05:53:54', '0', 116.402806, 39.910084, 47.61, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3085, 'DEVICE_FIELD_001_001', 'FIELD_001', 19.02, 55.55, 1.559, 6.60, '2026-01-16 04:53:54', '0', 116.409534, 39.913217, 35.16, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3086, 'DEVICE_FIELD_001_001', 'FIELD_001', 16.09, 61.78, 1.277, 5.79, '2026-01-16 03:53:54', '0', 116.390053, 39.900945, 32.25, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3087, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.59, 59.11, 1.285, 6.19, '2026-01-16 02:53:54', '0', 116.405585, 39.907884, 39.18, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3088, 'DEVICE_FIELD_001_001', 'FIELD_001', 14.16, 53.80, 1.108, 6.49, '2026-01-16 01:53:54', '0', 116.381558, 39.895301, 62.13, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3089, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.38, 42.21, 1.347, 6.27, '2026-01-16 00:53:54', '0', 116.412381, 39.893502, 49.22, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3090, 'DEVICE_FIELD_001_001', 'FIELD_001', 12.74, 56.51, 1.491, 6.34, '2026-01-15 23:53:54', '0', 116.415985, 39.902011, 51.41, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3091, 'DEVICE_FIELD_001_001', 'FIELD_001', 9.49, 45.47, 1.116, 5.97, '2026-01-15 22:53:54', '0', 116.398686, 39.894269, 46.01, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3092, 'DEVICE_FIELD_001_001', 'FIELD_001', 10.49, 51.48, 1.193, 6.53, '2026-01-15 21:53:54', '0', 116.417775, 39.904175, 51.01, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3093, 'DEVICE_FIELD_001_001', 'FIELD_001', 15.67, 48.77, 1.120, 6.88, '2026-01-15 20:53:54', '0', 116.408600, 39.926595, 43.18, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3094, 'DEVICE_FIELD_001_001', 'FIELD_001', 11.37, 58.97, 1.548, 5.98, '2026-01-15 19:53:54', '0', 116.401951, 39.914850, 51.01, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3095, 'DEVICE_FIELD_001_001', 'FIELD_001', 18.61, 58.58, 1.384, 6.24, '2026-01-15 18:53:54', '0', 116.401226, 39.912825, 67.81, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3096, 'DEVICE_FIELD_001_001', 'FIELD_001', 17.80, 52.09, 1.047, 7.15, '2026-01-15 17:53:54', '0', 116.391970, 39.902502, 47.93, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3097, 'DEVICE_FIELD_001_001', 'FIELD_001', 22.08, 43.02, 1.349, 6.78, '2026-01-15 16:53:54', '0', 116.397338, 39.915851, 56.30, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3098, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.46, 53.18, 0.976, 5.11, '2026-01-15 15:53:54', '0', 116.390480, 39.912233, 46.23, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3099, 'DEVICE_FIELD_001_001', 'FIELD_001', 27.07, 45.26, 0.799, 6.04, '2026-01-15 14:53:54', '0', 116.389440, 39.895621, 70.53, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3100, 'DEVICE_FIELD_001_001', 'FIELD_001', 25.73, 47.25, 1.247, 6.08, '2026-01-15 13:53:54', '0', 116.396570, 39.890924, 62.94, '2026-01-19 17:53:53', NULL);
INSERT INTO `soil_data` VALUES (3101, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.58, 58.73, 1.148, 6.42, '2026-01-19 18:08:05', '0', 116.375634, 39.894134, 54.48, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3102, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.11, 66.88, 1.482, 6.40, '2026-01-19 17:08:05', '0', 116.398096, 39.920672, 39.66, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3103, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.44, 68.22, 1.248, 7.54, '2026-01-19 16:08:05', '0', 116.396639, 39.903533, 60.87, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3104, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.16, 66.26, 1.196, 5.27, '2026-01-19 15:08:05', '0', 116.392751, 39.897550, 49.92, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3105, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.75, 61.32, 1.334, 6.24, '2026-01-19 14:08:05', '0', 116.390649, 39.921846, 52.07, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3106, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.92, 70.04, 1.464, 5.69, '2026-01-19 13:08:05', '0', 116.406735, 39.897811, 48.91, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3107, 'DEVICE_FIELD_003_001', 'FIELD_003', 34.05, 61.69, 1.678, 6.48, '2026-01-19 12:08:05', '0', 116.396293, 39.922680, 59.60, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3108, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.83, 62.61, 0.870, 5.60, '2026-01-19 11:08:05', '0', 116.381117, 39.909361, 38.04, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3109, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.01, 67.45, 1.316, 7.11, '2026-01-19 10:08:05', '0', 116.406053, 39.925853, 52.56, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3110, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.54, 69.70, 1.374, 6.49, '2026-01-19 09:08:05', '0', 116.400096, 39.929615, 40.62, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3111, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.86, 62.74, 1.368, 6.71, '2026-01-19 08:08:05', '0', 116.398070, 39.922610, 50.28, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3112, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.43, 72.66, 0.847, 5.82, '2026-01-19 07:08:05', '0', 116.402629, 39.919583, 48.00, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3113, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.67, 66.47, 0.991, 6.03, '2026-01-19 06:08:05', '0', 116.404125, 39.912944, 38.63, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3114, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.24, 71.58, 1.154, 6.45, '2026-01-19 05:08:05', '0', 116.383683, 39.892077, 47.11, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3115, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.59, 69.90, 1.033, 6.34, '2026-01-19 04:08:05', '0', 116.387788, 39.902050, 45.73, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3116, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.23, 70.34, 1.505, 6.40, '2026-01-19 03:08:05', '0', 116.401458, 39.913274, 36.72, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3117, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.03, 65.01, 1.262, 7.34, '2026-01-19 02:08:05', '0', 116.403218, 39.928201, 40.33, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3118, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.77, 70.55, 1.157, 6.92, '2026-01-19 01:08:05', '0', 116.398621, 39.899540, 64.65, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3119, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.28, 78.11, 0.886, 7.42, '2026-01-19 00:08:05', '0', 116.385039, 39.895446, 57.68, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3120, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.90, 66.69, 0.787, 7.21, '2026-01-18 23:08:05', '0', 116.400180, 39.897262, 41.16, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3121, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.10, 67.63, 0.842, 6.85, '2026-01-18 22:08:05', '0', 116.403291, 39.920402, 48.21, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3122, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.43, 68.50, 1.018, 6.29, '2026-01-18 21:08:05', '0', 116.371560, 39.904077, 41.82, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3123, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.03, 70.79, 1.337, 6.56, '2026-01-18 20:08:05', '0', 116.400049, 39.925565, 21.62, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3124, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.73, 73.83, 1.011, 6.81, '2026-01-18 19:08:05', '0', 116.384706, 39.911665, 60.20, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3125, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.69, 74.55, 1.467, 5.85, '2026-01-18 18:08:05', '0', 116.375966, 39.894603, 68.02, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3126, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.20, 76.99, 1.220, 5.95, '2026-01-18 17:08:05', '0', 116.395736, 39.916745, 51.11, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3127, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.13, 74.43, 1.040, 6.69, '2026-01-18 16:08:05', '0', 116.389554, 39.909636, 43.27, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3128, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.06, 76.83, 1.141, 6.75, '2026-01-18 15:08:05', '0', 116.415023, 39.918923, 61.44, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3129, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.00, 82.02, 1.439, 6.49, '2026-01-18 14:08:05', '0', 116.380447, 39.906945, 59.98, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3130, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.61, 85.49, 1.651, 7.11, '2026-01-18 13:08:05', '0', 116.393834, 39.908058, 56.49, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3131, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.99, 79.76, 1.177, 6.59, '2026-01-18 12:08:05', '0', 116.392293, 39.908030, 40.64, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3132, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.74, 88.05, 1.181, 6.50, '2026-01-18 11:08:05', '0', 116.403226, 39.918722, 67.27, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3133, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.33, 78.76, 1.257, 7.26, '2026-01-18 10:08:05', '0', 116.405394, 39.897774, 50.00, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3134, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.07, 77.45, 0.980, 6.72, '2026-01-18 09:08:05', '0', 116.392341, 39.918892, 38.66, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3135, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.90, 80.08, 1.058, 6.03, '2026-01-18 08:08:05', '0', 116.407748, 39.920103, 64.16, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3136, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.17, 81.08, 1.481, 6.32, '2026-01-18 07:08:05', '0', 116.397191, 39.908672, 55.68, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3137, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.99, 77.34, 0.855, 6.68, '2026-01-18 06:08:05', '0', 116.395002, 39.917133, 21.72, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3138, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.99, 84.06, 1.172, 6.65, '2026-01-18 05:08:05', '0', 116.397156, 39.923569, 43.61, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3139, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.99, 62.19, 1.336, 7.29, '2026-01-18 04:08:05', '0', 116.402098, 39.900469, 53.12, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3140, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.14, 82.96, 0.481, 6.35, '2026-01-18 03:08:05', '0', 116.391865, 39.913810, 51.15, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3141, 'DEVICE_FIELD_003_001', 'FIELD_003', 10.30, 83.03, 0.889, 6.32, '2026-01-18 02:08:05', '0', 116.403714, 39.906230, 50.75, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3142, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.35, 82.62, 1.180, 7.11, '2026-01-18 01:08:05', '0', 116.399764, 39.917408, 57.02, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3143, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.73, 81.76, 1.026, 7.12, '2026-01-18 00:08:05', '0', 116.394131, 39.909674, 42.13, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3144, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.90, 79.16, 1.639, 6.82, '2026-01-17 23:08:05', '0', 116.395669, 39.912055, 47.10, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3145, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.98, 80.04, 1.040, 6.83, '2026-01-17 22:08:05', '0', 116.389279, 39.921441, 35.75, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3146, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.21, 81.69, 1.330, 5.80, '2026-01-17 21:08:05', '0', 116.409579, 39.896765, 56.80, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3147, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.45, 79.14, 1.003, 6.13, '2026-01-17 20:08:05', '0', 116.382235, 39.914857, 58.49, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3148, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.36, 78.45, 1.133, 6.41, '2026-01-17 19:08:05', '0', 116.394620, 39.903605, 72.46, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3149, 'DEVICE_FIELD_003_001', 'FIELD_003', 23.30, 81.66, 1.411, 5.99, '2026-01-17 18:08:05', '0', 116.419146, 39.925100, 49.67, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3150, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.10, 84.04, 1.866, 6.51, '2026-01-17 17:08:05', '0', 116.393274, 39.893184, 50.32, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3151, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.22, 78.57, 0.955, 6.32, '2026-01-17 16:08:05', '0', 116.410916, 39.906306, 26.01, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3152, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.68, 85.19, 1.705, 5.75, '2026-01-17 15:08:05', '0', 116.403815, 39.903255, 51.84, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3153, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.24, 80.72, 1.541, 5.50, '2026-01-17 14:08:05', '0', 116.387949, 39.899066, 47.76, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3154, 'DEVICE_FIELD_003_001', 'FIELD_003', 29.96, 84.81, 1.245, 6.87, '2026-01-17 13:08:05', '0', 116.374509, 39.912467, 39.95, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3155, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.20, 79.13, 1.325, 6.81, '2026-01-17 12:08:05', '0', 116.367854, 39.901348, 54.03, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3156, 'DEVICE_FIELD_003_001', 'FIELD_003', 32.28, 69.90, 0.929, 6.78, '2026-01-17 11:08:05', '0', 116.389614, 39.911939, 52.98, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3157, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.42, 72.60, 1.162, 6.19, '2026-01-17 10:08:05', '0', 116.403030, 39.916894, 73.19, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3158, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.74, 74.37, 1.029, 6.92, '2026-01-17 09:08:05', '0', 116.376769, 39.912807, 43.47, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3159, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.96, 82.66, 1.149, 6.82, '2026-01-17 08:08:05', '0', 116.387818, 39.906312, 40.00, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3160, 'DEVICE_FIELD_003_001', 'FIELD_003', 25.70, 80.93, 1.089, 7.23, '2026-01-17 07:08:05', '0', 116.411826, 39.911914, 50.67, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3161, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.23, 76.21, 0.941, 7.78, '2026-01-17 06:08:05', '0', 116.386339, 39.911570, 55.67, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3162, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.56, 72.46, 1.070, 6.11, '2026-01-17 05:08:05', '0', 116.407029, 39.909452, 45.89, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3163, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.76, 74.00, 1.100, 5.95, '2026-01-17 04:08:05', '0', 116.406220, 39.911647, 57.37, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3164, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.93, 81.08, 1.168, 6.03, '2026-01-17 03:08:05', '0', 116.406522, 39.910616, 56.75, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3165, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.15, 64.14, 1.198, 6.80, '2026-01-17 02:08:05', '0', 116.393640, 39.901786, 37.42, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3166, 'DEVICE_FIELD_003_001', 'FIELD_003', 5.29, 68.16, 0.530, 6.93, '2026-01-17 01:08:05', '0', 116.398844, 39.909161, 37.18, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3167, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.85, 72.95, 1.300, 6.97, '2026-01-17 00:08:05', '0', 116.396191, 39.919188, 60.20, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3168, 'DEVICE_FIELD_003_001', 'FIELD_003', 8.04, 72.44, 1.285, 6.41, '2026-01-16 23:08:05', '0', 116.407198, 39.898050, 51.91, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3169, 'DEVICE_FIELD_003_001', 'FIELD_003', 6.53, 73.90, 0.969, 5.78, '2026-01-16 22:08:05', '0', 116.413676, 39.905845, 37.95, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3170, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.51, 71.36, 1.035, 7.12, '2026-01-16 21:08:05', '0', 116.391291, 39.909979, 49.90, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3171, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.09, 72.27, 1.493, 6.42, '2026-01-16 20:08:05', '0', 116.399569, 39.919703, 59.08, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3172, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.81, 80.08, 1.052, 6.70, '2026-01-16 19:08:05', '0', 116.393948, 39.909051, 51.12, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3173, 'DEVICE_FIELD_003_001', 'FIELD_003', 19.18, 66.42, 1.432, 6.69, '2026-01-16 18:08:05', '0', 116.404329, 39.892826, 48.05, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3174, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.76, 66.66, 0.835, 7.76, '2026-01-16 17:08:05', '0', 116.403024, 39.912643, 70.53, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3175, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.03, 69.36, 1.012, 6.33, '2026-01-16 16:08:05', '0', 116.389968, 39.907821, 42.49, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3176, 'DEVICE_FIELD_003_001', 'FIELD_003', 28.75, 66.52, 1.660, 5.64, '2026-01-16 15:08:05', '0', 116.395231, 39.911250, 58.50, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3177, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.47, 57.80, 0.592, 6.58, '2026-01-16 14:08:05', '0', 116.395407, 39.932762, 55.95, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3178, 'DEVICE_FIELD_003_001', 'FIELD_003', 33.25, 67.88, 1.407, 6.02, '2026-01-16 13:08:05', '0', 116.403410, 39.913462, 41.46, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3179, 'DEVICE_FIELD_003_001', 'FIELD_003', 30.30, 61.29, 1.027, 6.37, '2026-01-16 12:08:05', '0', 116.390772, 39.903511, 55.60, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3180, 'DEVICE_FIELD_003_001', 'FIELD_003', 31.01, 65.96, 1.741, 6.36, '2026-01-16 11:08:05', '0', 116.387455, 39.899882, 45.59, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3181, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.96, 63.84, 0.751, 6.97, '2026-01-16 10:08:05', '0', 116.375504, 39.896424, 42.98, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3182, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.58, 65.28, 1.152, 7.06, '2026-01-16 09:08:05', '0', 116.393292, 39.916858, 43.55, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3183, 'DEVICE_FIELD_003_001', 'FIELD_003', 26.45, 58.08, 0.920, 6.17, '2026-01-16 08:08:05', '0', 116.409139, 39.913824, 48.89, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3184, 'DEVICE_FIELD_003_001', 'FIELD_003', 20.82, 56.98, 1.535, 6.82, '2026-01-16 07:08:05', '0', 116.392363, 39.919860, 53.82, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3185, 'DEVICE_FIELD_003_001', 'FIELD_003', 22.52, 59.13, 1.193, 6.50, '2026-01-16 06:08:05', '0', 116.383138, 39.904903, 52.85, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3186, 'DEVICE_FIELD_003_001', 'FIELD_003', 18.86, 66.74, 1.444, 6.88, '2026-01-16 05:08:05', '0', 116.376757, 39.894827, 46.58, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3187, 'DEVICE_FIELD_003_001', 'FIELD_003', 16.39, 60.09, 1.121, 7.02, '2026-01-16 04:08:05', '0', 116.388291, 39.896193, 57.67, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3188, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.70, 57.43, 1.387, 5.96, '2026-01-16 03:08:05', '0', 116.393931, 39.915030, 46.18, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3189, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.26, 60.17, 1.511, 7.44, '2026-01-16 02:08:05', '0', 116.388048, 39.928446, 51.03, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3190, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.78, 50.29, 1.663, 6.96, '2026-01-16 01:08:05', '0', 116.402008, 39.899038, 44.68, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3191, 'DEVICE_FIELD_003_001', 'FIELD_003', 11.06, 63.67, 1.485, 6.51, '2026-01-16 00:08:05', '0', 116.388320, 39.919075, 54.82, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3192, 'DEVICE_FIELD_003_001', 'FIELD_003', 9.85, 57.33, 1.050, 6.45, '2026-01-15 23:08:05', '0', 116.408453, 39.909633, 57.46, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3193, 'DEVICE_FIELD_003_001', 'FIELD_003', 12.66, 55.97, 1.617, 6.12, '2026-01-15 22:08:05', '0', 116.395948, 39.905642, 78.17, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3194, 'DEVICE_FIELD_003_001', 'FIELD_003', 13.99, 55.40, 1.049, 6.45, '2026-01-15 21:08:05', '0', 116.406332, 39.912782, 47.73, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3195, 'DEVICE_FIELD_003_001', 'FIELD_003', 14.66, 54.53, 1.349, 6.27, '2026-01-15 20:08:05', '0', 116.404819, 39.911622, 51.48, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3196, 'DEVICE_FIELD_003_001', 'FIELD_003', 17.88, 46.37, 1.449, 6.50, '2026-01-15 19:08:05', '0', 116.389411, 39.916222, 54.37, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3197, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.38, 48.73, 1.304, 6.11, '2026-01-15 18:08:05', '0', 116.409869, 39.914814, 51.50, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3198, 'DEVICE_FIELD_003_001', 'FIELD_003', 21.12, 46.18, 1.172, 7.17, '2026-01-15 17:08:05', '0', 116.397003, 39.893498, 52.00, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3199, 'DEVICE_FIELD_003_001', 'FIELD_003', 24.27, 51.10, 1.408, 6.70, '2026-01-15 16:08:05', '0', 116.384680, 39.907251, 55.51, '2026-01-19 19:08:05', NULL);
INSERT INTO `soil_data` VALUES (3200, 'DEVICE_FIELD_003_001', 'FIELD_003', 27.65, 52.40, 1.051, 6.35, '2026-01-15 15:08:05', '0', 116.390429, 39.892754, 52.40, '2026-01-19 19:08:05', NULL);

-- ----------------------------
-- Table structure for soil_device
-- ----------------------------
DROP TABLE IF EXISTS `soil_device`;
CREATE TABLE `soil_device`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备编号',
  `device_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备名称',
  `device_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备类型',
  `field_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属地块',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '设备经度',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '设备纬度',
  `install_time` datetime NULL DEFAULT NULL COMMENT '安装时间',
  `last_online_time` datetime NULL DEFAULT NULL COMMENT '最后在线时间',
  `battery_level` int NULL DEFAULT NULL COMMENT '电池电量(%)',
  `signal_strength` int NULL DEFAULT NULL COMMENT '信号强度',
  `firmware_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '固件版本',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '设备状态(0正常 1故障 2离线)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_device_id`(`device_id` ASC) USING BTREE,
  INDEX `idx_field_id`(`field_id` ASC) USING BTREE,
  INDEX `idx_device_type`(`device_type` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设备信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soil_device
-- ----------------------------
INSERT INTO `soil_device` VALUES (1, 'DEVICE_001_001', '东区A田传感器1', '土壤多参数传感器', 'FIELD_001', 116.397400, 39.909300, '2024-01-01 10:00:00', NULL, 85, 90, 'v2.1.0', '0', '2026-01-19 16:37:49', NULL);
INSERT INTO `soil_device` VALUES (2, 'DEVICE_002_001', '西区B田传感器1', '土壤多参数传感器', 'FIELD_002', 116.387400, 39.919300, '2024-01-01 10:30:00', NULL, 78, 85, 'v2.1.0', '0', '2026-01-19 16:37:49', NULL);
INSERT INTO `soil_device` VALUES (3, 'DEVICE_003_001', '南区C田传感器1', '土壤多参数传感器', 'FIELD_003', 116.407400, 39.899300, '2024-01-01 11:00:00', NULL, 92, 88, 'v2.1.0', '0', '2026-01-19 16:37:49', NULL);

-- ----------------------------
-- Table structure for soil_field
-- ----------------------------
DROP TABLE IF EXISTS `soil_field`;
CREATE TABLE `soil_field`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `field_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地块编号',
  `field_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地块名称',
  `field_area` decimal(10, 2) NULL DEFAULT NULL COMMENT '地块面积(亩)',
  `crop_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作物类型',
  `soil_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '土壤类型',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '中心经度',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '中心纬度',
  `altitude` decimal(8, 2) NULL DEFAULT NULL COMMENT '海拔高度(m)',
  `owner_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人姓名',
  `owner_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人电话',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '地块描述',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态(0正常 1停用)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_field_id`(`field_id` ASC) USING BTREE,
  INDEX `idx_field_name`(`field_name` ASC) USING BTREE,
  INDEX `idx_crop_type`(`crop_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '地块信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soil_field
-- ----------------------------
INSERT INTO `soil_field` VALUES (1, 'FIELD_001', '东区试验田A', 50.00, '小麦', '壤土', 116.397400, 39.909300, 50.00, '张三', '13800138001', '东区主要试验田，用于小麦种植试验', '0', '2026-01-19 16:37:49', NULL);
INSERT INTO `soil_field` VALUES (2, 'FIELD_002', '西区试验田B', 75.50, '玉米', '砂壤土', 116.387400, 39.919300, 45.00, '李四', '13800138002', '西区试验田，主要种植玉米', '0', '2026-01-19 16:37:49', NULL);
INSERT INTO `soil_field` VALUES (3, 'FIELD_003', '南区试验田C', 30.25, '大豆', '粘土', 116.407400, 39.899300, 55.00, '王五', '13800138003', '南区小面积试验田，用于大豆品种试验', '0', '2026-01-19 16:37:49', NULL);

-- ----------------------------
-- Table structure for soil_prediction
-- ----------------------------
DROP TABLE IF EXISTS `soil_prediction`;
CREATE TABLE `soil_prediction`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `field_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地块编号',
  `predict_time` datetime NOT NULL COMMENT '预测时间',
  `predicted_humidity` decimal(5, 2) NULL DEFAULT NULL COMMENT '预测湿度值(%)',
  `predicted_temperature` decimal(5, 2) NULL DEFAULT NULL COMMENT '预测温度值(°C)',
  `predicted_ec_value` decimal(6, 3) NULL DEFAULT NULL COMMENT '预测EC值(mS/cm)',
  `predicted_ph_value` decimal(4, 2) NULL DEFAULT NULL COMMENT '预测pH值',
  `accuracy` decimal(5, 2) NULL DEFAULT NULL COMMENT '预测准确度(%)',
  `model_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型版本',
  `predict_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '预测类型(1小时 2天 3周)',
  `rmse_error` decimal(8, 4) NULL DEFAULT NULL COMMENT 'RMSE误差',
  `mae_error` decimal(8, 4) NULL DEFAULT NULL COMMENT 'MAE误差',
  `confidence` decimal(5, 2) NULL DEFAULT NULL COMMENT '置信度(%)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_field_id`(`field_id` ASC) USING BTREE,
  INDEX `idx_predict_time`(`predict_time` ASC) USING BTREE,
  INDEX `idx_predict_type`(`predict_type` ASC) USING BTREE,
  INDEX `idx_model_version`(`model_version` ASC) USING BTREE,
  INDEX `idx_soil_prediction_field_time`(`field_id` ASC, `predict_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '土壤墒情预测表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of soil_prediction
-- ----------------------------
INSERT INTO `soil_prediction` VALUES (1, 'FIELD_001', '2026-01-19 17:13:25', 0.09, -0.17, -0.006, -0.02, 81.97, 'v1.0', '1', 0.1018, 0.0464, 84.78, '2026-01-19 17:13:25', NULL);
INSERT INTO `soil_prediction` VALUES (2, 'FIELD_002', '2026-01-19 17:19:24', 0.12, -0.22, 0.005, -0.02, 89.02, 'v1.0', '3', 0.1332, 0.0591, 76.53, '2026-01-19 17:19:24', NULL);
INSERT INTO `soil_prediction` VALUES (3, 'FIELD_002', '2026-01-19 17:19:31', 0.12, -0.20, 0.005, -0.02, 83.62, 'v1.0', '2', 0.1317, 0.1026, 80.68, '2026-01-19 17:19:31', NULL);
INSERT INTO `soil_prediction` VALUES (4, 'FIELD_001', '2026-01-19 17:30:10', 0.09, -0.18, -0.001, -0.03, 88.37, 'v1.0', '3', 0.0949, 0.0808, 87.18, '2026-01-19 17:30:10', NULL);
INSERT INTO `soil_prediction` VALUES (5, 'FIELD_003', '2026-01-19 17:30:11', 0.12, -0.21, 0.004, -0.03, 86.70, 'v1.0', '3', 0.1046, 0.1178, 85.70, '2026-01-19 17:30:11', NULL);
INSERT INTO `soil_prediction` VALUES (6, 'FIELD_002', '2026-01-19 17:30:11', 0.12, -0.22, 0.005, -0.02, 75.09, 'v1.0', '3', 0.0732, 0.0707, 76.35, '2026-01-19 17:30:11', NULL);
INSERT INTO `soil_prediction` VALUES (7, 'FIELD_002', '2026-01-19 17:38:43', 0.12, -0.19, -0.001, -0.03, 80.49, 'v1.0', '1', 0.1367, 0.0651, 74.14, '2026-01-19 17:38:43', NULL);
INSERT INTO `soil_prediction` VALUES (8, 'FIELD_003', '2026-01-19 17:38:43', 0.11, -0.20, 0.002, -0.02, 91.34, 'v1.0', '1', 0.1037, 0.0391, 79.95, '2026-01-19 17:38:43', NULL);
INSERT INTO `soil_prediction` VALUES (9, 'FIELD_001', '2026-01-19 17:38:43', 0.11, -0.18, 0.001, -0.04, 90.26, 'v1.0', '1', 0.1383, 0.0680, 76.64, '2026-01-19 17:38:43', NULL);
INSERT INTO `soil_prediction` VALUES (10, 'FIELD_002', '2026-01-19 19:08:59', 0.12, -0.20, 0.005, -0.02, 91.70, 'v1.0', '2', 0.1251, 0.0802, 86.92, '2026-01-19 19:08:59', NULL);
INSERT INTO `soil_prediction` VALUES (11, 'FIELD_001', '2026-01-19 19:09:16', 0.08, -0.19, 0.001, -0.03, 77.45, 'v1.0', '3', 0.1087, 0.0409, 76.67, '2026-01-19 19:09:16', NULL);
INSERT INTO `soil_prediction` VALUES (12, 'FIELD_002', '2026-01-19 19:09:17', 0.12, -0.22, 0.005, -0.02, 84.17, 'v1.0', '3', 0.0559, 0.1031, 82.14, '2026-01-19 19:09:17', NULL);
INSERT INTO `soil_prediction` VALUES (13, 'FIELD_003', '2026-01-19 19:09:17', 0.12, -0.20, 0.010, -0.04, 88.79, 'v1.0', '3', 0.1136, 0.1198, 88.39, '2026-01-19 19:09:17', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-01-19 16:15:05', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-01-19 16:15:05', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-01-19 16:15:05', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2026-01-19 16:15:05', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-01-19 16:15:05', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-01-19 16:15:05', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-01-19 16:15:05', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-01-19 16:15:05', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'xx科技', 0, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '正常', '0', 'soil_data_status', '', 'success', 'N', '0', 'admin', '2026-01-19 16:37:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (101, 2, '异常', '1', 'soil_data_status', '', 'danger', 'N', '0', 'admin', '2026-01-19 16:37:45', '', NULL, '异常状态');
INSERT INTO `sys_dict_data` VALUES (102, 1, '小时级预测', '1', 'soil_predict_type', '', 'success', 'N', '0', 'admin', '2026-01-19 16:37:45', '', NULL, '小时级预测');
INSERT INTO `sys_dict_data` VALUES (103, 2, '天级预测', '2', 'soil_predict_type', '', 'warning', 'N', '0', 'admin', '2026-01-19 16:37:45', '', NULL, '天级预测');
INSERT INTO `sys_dict_data` VALUES (104, 3, '周级预测', '3', 'soil_predict_type', '', 'info', 'N', '0', 'admin', '2026-01-19 16:37:45', '', NULL, '周级预测');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '土壤数据状态', 'soil_data_status', '0', 'admin', '2026-01-19 16:37:45', '', NULL, '土壤数据状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '土壤预测类型', 'soil_predict_type', '0', 'admin', '2026-01-19 16:37:45', '', NULL, '土壤墒情预测类型列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-01-19 16:15:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-19 16:32:57');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-19 19:01:28');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-19 19:07:38');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-19 19:52:19');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2032 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-01-19 16:15:05', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-01-19 16:15:05', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-01-19 16:15:05', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-01-19 16:15:05', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-01-19 16:15:05', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-01-19 16:15:05', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-01-19 16:15:05', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-01-19 16:15:05', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-01-19 16:15:05', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-01-19 16:15:05', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-01-19 16:15:05', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-01-19 16:15:05', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-01-19 16:15:05', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-01-19 16:15:05', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-01-19 16:15:05', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-01-19 16:15:05', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-01-19 16:15:05', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-01-19 16:15:05', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '1', '0', 'tool:build:list', 'build', 'admin', '2026-01-19 16:15:05', 'admin', '2026-01-19 19:55:32', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '1', '0', 'tool:gen:list', 'code', 'admin', '2026-01-19 16:15:05', 'admin', '2026-01-19 19:55:24', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-01-19 16:15:05', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-01-19 16:15:05', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-01-19 16:15:05', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '土壤墒情系统', 0, 5, 'soil', NULL, '', 'Soil', 1, 0, 'M', '0', '0', '', 'tree', 'admin', '2026-01-19 16:37:45', '', NULL, '土壤墒情预测系统');
INSERT INTO `sys_menu` VALUES (2001, '土壤数据管理', 2000, 1, 'data', 'soil/data/index', '', 'SoilData', 1, 0, 'C', '0', '0', 'soil:data:list', 'form', 'admin', '2026-01-19 16:37:45', '', NULL, '土壤数据管理菜单');
INSERT INTO `sys_menu` VALUES (2002, '预测管理', 2000, 2, 'prediction', 'soil/prediction/index', '', 'SoilPrediction', 1, 0, 'C', '0', '0', 'soil:prediction:list', 'chart', 'admin', '2026-01-19 16:37:45', '', NULL, '土壤墒情预测管理菜单');
INSERT INTO `sys_menu` VALUES (2003, '监控大屏', 2000, 3, 'dashboard', 'soil/dashboard/index', '', 'SoilDashboard', 1, 0, 'C', '0', '0', 'soil:dashboard:view', 'monitor', 'admin', '2026-01-19 16:37:45', '', NULL, '土壤墒情监控大屏');
INSERT INTO `sys_menu` VALUES (2004, '土壤数据详情', 2001, 8, 'detail', 'soil/data/detail', '', 'SoilDataDetail', 1, 0, 'C', '1', '0', 'soil:data:detail', '#', 'admin', '2026-01-19 18:54:51', '', NULL, '土壤数据详情页面');
INSERT INTO `sys_menu` VALUES (2005, '预测结果详情', 2002, 8, 'detail', 'soil/prediction/detail', '', 'SoilPredictionDetail', 1, 0, 'C', '1', '0', 'soil:prediction:detail', '#', 'admin', '2026-01-19 18:54:51', '', NULL, '预测结果详情页面');
INSERT INTO `sys_menu` VALUES (2006, '预测趋势分析', 2002, 9, 'trend', 'soil/prediction/trend', '', 'SoilPredictionTrend', 1, 0, 'C', '1', '0', 'soil:prediction:trend', '#', 'admin', '2026-01-19 18:54:51', '', NULL, '预测趋势分析页面');
INSERT INTO `sys_menu` VALUES (2011, '土壤数据查询', 2001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:query', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '土壤数据新增', 2001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:add', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '土壤数据修改', 2001, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:edit', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '土壤数据删除', 2001, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:remove', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '土壤数据导出', 2001, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:export', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '土壤数据导入', 2001, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:import', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '土壤数据详情', 2001, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:detail', '#', 'admin', '2026-01-19 18:54:51', '', NULL, '土壤数据详情查看权限');
INSERT INTO `sys_menu` VALUES (2021, '预测查询', 2002, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:query', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '执行预测', 2002, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:predict', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '预测修改', 2002, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:edit', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '预测删除', 2002, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:remove', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '预测导出', 2002, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:export', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '预测详情', 2002, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:detail', '#', 'admin', '2026-01-19 18:54:51', '', NULL, '预测结果详情查看权限');
INSERT INTO `sys_menu` VALUES (2027, '预测趋势', 2002, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:trend', '#', 'admin', '2026-01-19 18:54:51', '', NULL, '预测趋势分析权限');
INSERT INTO `sys_menu` VALUES (2031, '大屏查看', 2003, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:dashboard:view', '#', 'admin', '2026-01-19 16:37:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 xx新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-01-19 16:15:06', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 xx系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-01-19 16:15:06', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-01-19 16:33:22', 21);
INSERT INTO `sys_oper_log` VALUES (101, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_001/100', '127.0.0.1', '内网IP', '\"FIELD_001\" 100 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":false,\"message\":\"导入失败：nested exception is org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [soilDataList, param1]\"}}', 0, NULL, '2026-01-19 17:04:43', 23);
INSERT INTO `sys_oper_log` VALUES (102, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_001/100', '127.0.0.1', '内网IP', '\"FIELD_001\" 100 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":false,\"message\":\"导入失败：nested exception is org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [soilDataList, param1]\"}}', 0, NULL, '2026-01-19 17:04:51', 2);
INSERT INTO `sys_oper_log` VALUES (103, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_001/100', '127.0.0.1', '内网IP', '\"FIELD_001\" 100 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":false,\"message\":\"导入失败：nested exception is org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [soilDataList, param1]\"}}', 0, NULL, '2026-01-19 17:04:56', 3);
INSERT INTO `sys_oper_log` VALUES (104, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_001/100', '127.0.0.1', '内网IP', '\"FIELD_001\" 100 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":false,\"message\":\"导入失败：nested exception is org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [soilDataList, param1]\"}}', 0, NULL, '2026-01-19 17:05:53', 1);
INSERT INTO `sys_oper_log` VALUES (105, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_001/100', '127.0.0.1', '内网IP', '\"FIELD_001\" 100 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":false,\"message\":\"导入失败：nested exception is org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [soilDataList, param1]\"}}', 0, NULL, '2026-01-19 17:06:08', 1);
INSERT INTO `sys_oper_log` VALUES (106, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_001/100', '127.0.0.1', '内网IP', '\"FIELD_001\" 100 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":true,\"successCount\":100,\"totalCount\":100,\"message\":\"成功导入 100 条数据，共 100 条\"}}', 0, NULL, '2026-01-19 17:12:44', 45);
INSERT INTO `sys_oper_log` VALUES (107, 'LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.predict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/predict/FIELD_002/2', '127.0.0.1', '内网IP', '\"FIELD_002\" \"2\" ', '{\"msg\":\"预测失败: 预测失败: 历史数据不足，无法进行预测\",\"code\":500}', 0, NULL, '2026-01-19 17:13:01', 5);
INSERT INTO `sys_oper_log` VALUES (108, 'LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.predict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/predict/FIELD_002/3', '127.0.0.1', '内网IP', '\"FIELD_002\" \"3\" ', '{\"msg\":\"预测失败: 预测失败: 历史数据不足，无法进行预测\",\"code\":500}', 0, NULL, '2026-01-19 17:13:18', 5);
INSERT INTO `sys_oper_log` VALUES (109, 'LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.predict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/predict/FIELD_002/1', '127.0.0.1', '内网IP', '\"FIELD_002\" \"1\" ', '{\"msg\":\"预测失败: 预测失败: 历史数据不足，无法进行预测\",\"code\":500}', 0, NULL, '2026-01-19 17:13:21', 5);
INSERT INTO `sys_oper_log` VALUES (110, 'LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.predict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/predict/FIELD_001/1', '127.0.0.1', '内网IP', '\"FIELD_001\" \"1\" ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"accuracy\":81.96814618609298,\"confidence\":84.77904875883866,\"createTime\":\"2026-01-19 17:13:25\",\"fieldId\":\"FIELD_001\",\"id\":1,\"maeError\":0.046407020805908465,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:13:25\",\"predictType\":\"1\",\"predictedEcValue\":-0.006074358243495226,\"predictedHumidity\":0.09120825678110123,\"predictedPhValue\":-0.02466553822159767,\"predictedTemperature\":-0.17297568917274475,\"rmseError\":0.1017963187828615}}', 0, NULL, '2026-01-19 17:13:25', 813);
INSERT INTO `sys_oper_log` VALUES (111, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_002/1000', '127.0.0.1', '内网IP', '\"FIELD_002\" 1000 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":true,\"successCount\":1000,\"totalCount\":1000,\"message\":\"成功导入 1000 条数据，共 1000 条\"}}', 0, NULL, '2026-01-19 17:18:21', 144);
INSERT INTO `sys_oper_log` VALUES (112, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_001/900', '127.0.0.1', '内网IP', '\"FIELD_001\" 900 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":true,\"successCount\":900,\"totalCount\":900,\"message\":\"成功导入 900 条数据，共 900 条\"}}', 0, NULL, '2026-01-19 17:18:34', 113);
INSERT INTO `sys_oper_log` VALUES (113, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_003/1000', '127.0.0.1', '内网IP', '\"FIELD_003\" 1000 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":true,\"successCount\":1000,\"totalCount\":1000,\"message\":\"成功导入 1000 条数据，共 1000 条\"}}', 0, NULL, '2026-01-19 17:18:47', 119);
INSERT INTO `sys_oper_log` VALUES (114, 'LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.predict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/predict/FIELD_002/3', '127.0.0.1', '内网IP', '\"FIELD_002\" \"3\" ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"accuracy\":89.021659102824,\"confidence\":76.52770341153474,\"createTime\":\"2026-01-19 17:19:23\",\"fieldId\":\"FIELD_002\",\"id\":2,\"maeError\":0.05911928078612156,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:19:23\",\"predictType\":\"3\",\"predictedEcValue\":0.005038482137024403,\"predictedHumidity\":0.11996754258871078,\"predictedPhValue\":-0.021877311170101166,\"predictedTemperature\":-0.2152899205684662,\"rmseError\":0.1331542358830492}}', 0, NULL, '2026-01-19 17:19:23', 108);
INSERT INTO `sys_oper_log` VALUES (115, 'LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.predict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/predict/FIELD_002/2', '127.0.0.1', '内网IP', '\"FIELD_002\" \"2\" ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"accuracy\":83.62318807892478,\"confidence\":80.6761142746266,\"createTime\":\"2026-01-19 17:19:30\",\"fieldId\":\"FIELD_002\",\"id\":3,\"maeError\":0.10259571206880305,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:19:30\",\"predictType\":\"2\",\"predictedEcValue\":0.004891831427812576,\"predictedHumidity\":0.11863178014755249,\"predictedPhValue\":-0.02487439289689064,\"predictedTemperature\":-0.20352932810783386,\"rmseError\":0.13169914032771052}}', 0, NULL, '2026-01-19 17:19:30', 101);
INSERT INTO `sys_oper_log` VALUES (116, '批量LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.batchPredict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/batch-predict', '127.0.0.1', '内网IP', '{\"fieldIds\":[\"FIELD_001\",\"FIELD_003\",\"FIELD_002\"],\"predictType\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"accuracy\":88.36697003694455,\"confidence\":87.17661263617464,\"createTime\":\"2026-01-19 17:30:10\",\"fieldId\":\"FIELD_001\",\"id\":4,\"maeError\":0.08083734315126809,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:30:10\",\"predictType\":\"3\",\"predictedEcValue\":-0.0012248303974047303,\"predictedHumidity\":0.0923057347536087,\"predictedPhValue\":-0.033210355788469315,\"predictedTemperature\":-0.18168652057647705,\"rmseError\":0.09489981209787413},{\"accuracy\":86.69617560269661,\"confidence\":85.69997280469862,\"createTime\":\"2026-01-19 17:30:10\",\"fieldId\":\"FIELD_003\",\"id\":5,\"maeError\":0.11782570228024736,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:30:10\",\"predictType\":\"3\",\"predictedEcValue\":0.003670702688395977,\"predictedHumidity\":0.1150098592042923,\"predictedPhValue\":-0.025361288338899612,\"predictedTemperature\":-0.2107299566268921,\"rmseError\":0.10463041669382694},{\"accuracy\":75.08857538510408,\"confidence\":76.34664924623769,\"createTime\":\"2026-01-19 17:30:10\",\"fieldId\":\"FIELD_002\",\"id\":6,\"maeError\":0.07067246651632751,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:30:10\",\"predictType\":\"3\",\"predictedEcValue\":0.005038482137024403,\"predictedHumidity\":0.11996754258871078,\"predictedPhValue\":-0.021877311170101166,\"predictedTemperature\":-0.2152899205684662,\"rmseError\":0.07317618337285703}]}', 0, NULL, '2026-01-19 17:30:10', 349);
INSERT INTO `sys_oper_log` VALUES (117, '批量LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.batchPredict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/batch-predict', '127.0.0.1', '内网IP', '{\"fieldIds\":[\"FIELD_002\",\"FIELD_003\",\"FIELD_001\"],\"predictType\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"accuracy\":80.4882160449254,\"confidence\":74.14379323357818,\"createTime\":\"2026-01-19 17:38:43\",\"fieldId\":\"FIELD_002\",\"id\":7,\"maeError\":0.0651342290872076,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:38:43\",\"predictType\":\"1\",\"predictedEcValue\":-0.0009564101346768439,\"predictedHumidity\":0.12121372669935226,\"predictedPhValue\":-0.02865779958665371,\"predictedTemperature\":-0.19452962279319763,\"rmseError\":0.13667279752536732},{\"accuracy\":91.34426046864223,\"confidence\":79.94525427999281,\"createTime\":\"2026-01-19 17:38:43\",\"fieldId\":\"FIELD_003\",\"id\":8,\"maeError\":0.03906203700976252,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:38:43\",\"predictType\":\"1\",\"predictedEcValue\":0.0023080212995409966,\"predictedHumidity\":0.11040240526199341,\"predictedPhValue\":-0.024536000564694405,\"predictedTemperature\":-0.2032802551984787,\"rmseError\":0.10365269577596051},{\"accuracy\":90.26260647411448,\"confidence\":76.63923482556393,\"createTime\":\"2026-01-19 17:38:43\",\"fieldId\":\"FIELD_001\",\"id\":9,\"maeError\":0.06798973596499588,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 17:38:43\",\"predictType\":\"1\",\"predictedEcValue\":0.0009582913480699062,\"predictedHumidity\":0.10593412816524506,\"predictedPhValue\":-0.03904879465699196,\"predictedTemperature\":-0.18031568825244904,\"rmseError\":0.1383255387554379}]}', 0, NULL, '2026-01-19 17:38:43', 253);
INSERT INTO `sys_oper_log` VALUES (118, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_001/100', '127.0.0.1', '内网IP', '\"FIELD_001\" 100 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":true,\"successCount\":100,\"totalCount\":100,\"message\":\"成功导入 100 条数据，共 100 条\"}}', 0, NULL, '2026-01-19 17:53:53', 161);
INSERT INTO `sys_oper_log` VALUES (119, '土壤数据', 5, 'com.ruoyi.web.controller.soil.SoilDataController.export()', 'POST', 1, 'admin', '研发部门', '/soil/data/export', '127.0.0.1', '内网IP', '{\"id\":\"101\"}', NULL, 0, NULL, '2026-01-19 19:00:39', 2291);
INSERT INTO `sys_oper_log` VALUES (120, '生成模拟数据', 1, 'com.ruoyi.web.controller.soil.SoilDataController.generateSimulatedData()', 'POST', 1, 'admin', '研发部门', '/soil/data/simulate/FIELD_003/100', '127.0.0.1', '内网IP', '\"FIELD_003\" 100 ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"success\":true,\"successCount\":100,\"totalCount\":100,\"message\":\"成功导入 100 条数据，共 100 条\"}}', 0, NULL, '2026-01-19 19:08:05', 58);
INSERT INTO `sys_oper_log` VALUES (121, '土壤数据', 5, 'com.ruoyi.web.controller.soil.SoilDataController.export()', 'POST', 1, 'admin', '研发部门', '/soil/data/export', '127.0.0.1', '内网IP', '{\"id\":\"3101\"}', NULL, 0, NULL, '2026-01-19 19:08:16', 828);
INSERT INTO `sys_oper_log` VALUES (122, 'LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.predict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/predict/FIELD_002/2', '127.0.0.1', '内网IP', '\"FIELD_002\" \"2\" ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"accuracy\":91.70355138862588,\"confidence\":86.91882388423495,\"createTime\":\"2026-01-19 19:08:58\",\"fieldId\":\"FIELD_002\",\"id\":10,\"maeError\":0.08015914041467473,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 19:08:58\",\"predictType\":\"2\",\"predictedEcValue\":0.004891831427812576,\"predictedHumidity\":0.11863178014755249,\"predictedPhValue\":-0.02487439289689064,\"predictedTemperature\":-0.20352932810783386,\"rmseError\":0.12505891735110802}}', 0, NULL, '2026-01-19 19:08:58', 946);
INSERT INTO `sys_oper_log` VALUES (123, '批量LSTM预测', 0, 'com.ruoyi.web.controller.soil.SoilPredictionController.batchPredict()', 'POST', 1, 'admin', '研发部门', '/soil/prediction/batch-predict', '127.0.0.1', '内网IP', '{\"fieldIds\":[\"FIELD_001\",\"FIELD_002\",\"FIELD_003\"],\"predictType\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"accuracy\":77.45413823371747,\"confidence\":76.67122999760667,\"createTime\":\"2026-01-19 19:09:16\",\"fieldId\":\"FIELD_001\",\"id\":11,\"maeError\":0.040887128560497456,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 19:09:16\",\"predictType\":\"3\",\"predictedEcValue\":0.0006996332667768002,\"predictedHumidity\":0.08428526669740677,\"predictedPhValue\":-0.02952040173113346,\"predictedTemperature\":-0.18647968769073486,\"rmseError\":0.10874443943600746},{\"accuracy\":84.17078927978108,\"confidence\":82.13998229407677,\"createTime\":\"2026-01-19 19:09:16\",\"fieldId\":\"FIELD_002\",\"id\":12,\"maeError\":0.10314426368956592,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 19:09:16\",\"predictType\":\"3\",\"predictedEcValue\":0.005038482137024403,\"predictedHumidity\":0.11996754258871078,\"predictedPhValue\":-0.021877311170101166,\"predictedTemperature\":-0.2152899205684662,\"rmseError\":0.05591307654057126},{\"accuracy\":88.79274282789356,\"confidence\":88.38832573547995,\"createTime\":\"2026-01-19 19:09:17\",\"fieldId\":\"FIELD_003\",\"id\":13,\"maeError\":0.11983901794917888,\"modelVersion\":\"v1.0\",\"params\":{},\"predictTime\":\"2026-01-19 19:09:17\",\"predictType\":\"3\",\"predictedEcValue\":0.009641164913773537,\"predictedHumidity\":0.12225095927715302,\"predictedPhValue\":-0.035978566855192184,\"predictedTemperature\":-0.20277154445648193,\"rmseError\":0.11358354820389026}]}', 0, NULL, '2026-01-19 19:09:17', 1002);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tool/gen/index\",\"createTime\":\"2026-01-19 16:15:05\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":116,\"menuName\":\"代码生成\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":3,\"path\":\"gen\",\"perms\":\"tool:gen:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-19 19:55:24', 20);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tool/build/index\",\"createTime\":\"2026-01-19 16:15:05\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":115,\"menuName\":\"表单构建\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"build\",\"perms\":\"tool:build:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-19 19:55:32', 16);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-01-19 16:15:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-01-19 16:15:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-01-19 16:15:05', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2001);
INSERT INTO `sys_role_menu` VALUES (1, 2002);
INSERT INTO `sys_role_menu` VALUES (1, 2003);
INSERT INTO `sys_role_menu` VALUES (1, 2004);
INSERT INTO `sys_role_menu` VALUES (1, 2005);
INSERT INTO `sys_role_menu` VALUES (1, 2006);
INSERT INTO `sys_role_menu` VALUES (1, 2011);
INSERT INTO `sys_role_menu` VALUES (1, 2012);
INSERT INTO `sys_role_menu` VALUES (1, 2013);
INSERT INTO `sys_role_menu` VALUES (1, 2014);
INSERT INTO `sys_role_menu` VALUES (1, 2015);
INSERT INTO `sys_role_menu` VALUES (1, 2016);
INSERT INTO `sys_role_menu` VALUES (1, 2017);
INSERT INTO `sys_role_menu` VALUES (1, 2021);
INSERT INTO `sys_role_menu` VALUES (1, 2022);
INSERT INTO `sys_role_menu` VALUES (1, 2023);
INSERT INTO `sys_role_menu` VALUES (1, 2024);
INSERT INTO `sys_role_menu` VALUES (1, 2025);
INSERT INTO `sys_role_menu` VALUES (1, 2026);
INSERT INTO `sys_role_menu` VALUES (1, 2027);
INSERT INTO `sys_role_menu` VALUES (1, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'xx', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-01-19 19:52:20', '2026-01-19 16:15:05', 'admin', '2026-01-19 16:15:05', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'xx', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-01-19 16:15:05', '2026-01-19 16:15:05', 'admin', '2026-01-19 16:15:05', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- View structure for v_latest_soil_data
-- ----------------------------
DROP VIEW IF EXISTS `v_latest_soil_data`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_latest_soil_data` AS select `sd`.`id` AS `id`,`sd`.`device_id` AS `device_id`,`sd`.`field_id` AS `field_id`,`sd`.`temperature` AS `temperature`,`sd`.`humidity` AS `humidity`,`sd`.`ec_value` AS `ec_value`,`sd`.`ph_value` AS `ph_value`,`sd`.`collect_time` AS `collect_time`,`sd`.`data_status` AS `data_status`,`sd`.`longitude` AS `longitude`,`sd`.`latitude` AS `latitude`,`sd`.`altitude` AS `altitude`,`sd`.`create_time` AS `create_time`,`sd`.`update_time` AS `update_time`,`sf`.`field_name` AS `field_name`,`sf`.`crop_type` AS `crop_type`,`sf`.`soil_type` AS `soil_type`,`dev`.`device_name` AS `device_name`,`dev`.`device_type` AS `device_type` from (((`soil_data` `sd` join (select `soil_data`.`field_id` AS `field_id`,max(`soil_data`.`collect_time`) AS `max_time` from `soil_data` where (`soil_data`.`data_status` = '0') group by `soil_data`.`field_id`) `latest` on(((`sd`.`field_id` = `latest`.`field_id`) and (`sd`.`collect_time` = `latest`.`max_time`)))) left join `soil_field` `sf` on((`sd`.`field_id` = `sf`.`field_id`))) left join `soil_device` `dev` on((`sd`.`device_id` = `dev`.`device_id`))) where (`sd`.`data_status` = '0');

-- ----------------------------
-- Procedure structure for CleanOldData
-- ----------------------------
DROP PROCEDURE IF EXISTS `CleanOldData`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CleanOldData`(IN days_to_keep INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    -- 清理超过指定天数的土壤数据（保留异常数据）
    DELETE FROM soil_data 
    WHERE collect_time < DATE_SUB(NOW(), INTERVAL days_to_keep DAY)
    AND data_status = '0';
    
    -- 清理超过指定天数的预测数据
    DELETE FROM soil_prediction 
    WHERE predict_time < DATE_SUB(NOW(), INTERVAL days_to_keep DAY);
    
    -- 清理超过指定天数的已处理预警记录
    DELETE FROM soil_alert_record 
    WHERE alert_time < DATE_SUB(NOW(), INTERVAL days_to_keep DAY)
    AND handle_status IN ('1', '2');
    
    COMMIT;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
