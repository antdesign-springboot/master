/*
 Navicat Premium Data Transfer

 Source Server         : zsk
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : master_admin

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 15/02/2019 09:55:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('MasterScheduler', 'TASK_4', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('MasterScheduler', 'TASK_4', 'DEFAULT', NULL, 'com.winnerdt.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720031636F6D2E77696E6E657264742E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001689DDA533C7874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000004740005746573743274000B7873786173786173787378740009647363736463736373737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MasterScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MasterScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MasterScheduler', 'DESKTOP-CUD9MR51550195593938', 1550195703052, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('MasterScheduler', 'TASK_4', 'DEFAULT', 'TASK_4', 'DEFAULT', NULL, 1550196000000, -1, 5, 'WAITING', 'CRON', 1548836557000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720031636F6D2E77696E6E657264742E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001689DDA54B07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000004740005746573743274000B7873786173786173787378740009647363736463736373737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (4, 'testTask', 'test2', 'xsxasxasxsx', '0 0/30 * * * ?', 0, 'dscsdcscs', '2019-01-30 16:22:38');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1087620886778900653 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1087620886778900507, 3, 'testTask333', 'test2eee333', '1111111111', 1, 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'testTask333\' available', 46, '2019-01-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900526, 3, 'testTask', 'test', '1111111111', 0, NULL, 1004, '2019-01-24 18:41:35');
INSERT INTO `schedule_job_log` VALUES (1087620886778900594, 3, 'testTask', 'test', '1111111111', 0, NULL, 1037, '2019-01-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900595, 3, 'testTask', 'test', '1111111111', 0, NULL, 1022, '2019-01-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900596, 3, 'testTask', 'test', '1111111111', 0, NULL, 1006, '2019-01-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900597, 3, 'testTask', 'test', '1111111111', 0, NULL, 1024, '2019-01-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900598, 3, 'testTask', 'test', '1111111111', 0, NULL, 1034, '2019-01-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900599, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 0, '2019-01-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900600, 3, 'testTask', 'test', '1111111111', 0, NULL, 1008, '2019-01-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900601, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-01-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900602, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 4, '2019-01-30 17:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900603, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-01-30 18:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900604, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 4, '2019-01-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900605, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 37, '2019-02-12 10:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900606, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900607, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900608, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900609, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 0, '2019-02-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900610, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900611, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900612, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900613, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900614, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 45, '2019-02-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900615, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 5, '2019-02-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900616, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-12 15:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900617, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900618, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 14, '2019-02-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900619, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900620, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-12 17:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900621, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900622, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 127, '2019-02-13 10:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900623, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-13 11:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900624, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-13 11:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900625, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-13 12:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900626, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-13 12:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900627, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-13 13:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900628, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-13 13:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900629, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-13 14:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900630, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900631, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900632, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900633, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900634, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900635, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-13 17:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900636, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-13 18:00:22');
INSERT INTO `schedule_job_log` VALUES (1087620886778900637, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 28, '2019-02-14 10:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900638, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-14 10:33:05');
INSERT INTO `schedule_job_log` VALUES (1087620886778900639, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-14 11:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900640, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-14 12:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900641, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-14 12:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900642, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-14 13:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900643, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-14 13:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900644, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-14 14:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900645, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 1, '2019-02-14 14:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900646, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 29, '2019-02-14 15:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900647, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-14 15:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900648, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 42, '2019-02-14 16:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900649, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 2, '2019-02-14 16:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900650, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 3, '2019-02-14 17:00:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900651, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 22, '2019-02-14 17:30:00');
INSERT INTO `schedule_job_log` VALUES (1087620886778900652, 4, 'testTask', 'test2', 'xsxasxasxsx', 1, 'java.lang.NoSuchMethodException: com.winnerdt.modules.job.task.TestTask.test2(java.lang.String)', 4, '2019-02-14 18:00:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":0,\"qiniuDomain\":\"http://pm2vkbv1m.bkt.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"qg1BFsLRVadWHtyGYW2yVzz0ZVJGzLFmwTqhi0ZU\",\"qiniuSecretKey\":\"LGyVEEN_DL1M_NIydnCZlXXifPlE2Ng1RuEvsxkg\",\"qiniuBucketName\":\"master-test\"}', 0, '云存储配置信息');
INSERT INTO `sys_config` VALUES (3, '323233', '33333232', 1, '323');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '人人开源集团', 0, 0);
INSERT INTO `sys_dept` VALUES (2, 1, '长沙分公司', 1, 0);
INSERT INTO `sys_dept` VALUES (3, 1, '上海分公司', 2, 0);
INSERT INTO `sys_dept` VALUES (4, 3, '技术部', 0, 0);
INSERT INTO `sys_dept` VALUES (5, 3, '销售部', 1, 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典码',
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (2, '性别', 'sex', '1', '男', 1, '性别', 0);
INSERT INTO `sys_dict` VALUES (3, '性别', 'sex', '2', '未知', 3, '性别', 0);
INSERT INTO `sys_dict` VALUES (4, '34', '43', '43', '43', 43, '443', 0);

-- ----------------------------
-- Table structure for sys_icon
-- ----------------------------
DROP TABLE IF EXISTS `sys_icon`;
CREATE TABLE `sys_icon`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标代码',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标类型',
  `status` int(10) NULL DEFAULT NULL COMMENT '0：不启用，1：启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 299 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_icon
-- ----------------------------
INSERT INTO `sys_icon` VALUES (1, 'step-forward', '图标', 1);
INSERT INTO `sys_icon` VALUES (2, 'step-backward', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (3, 'forward', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (4, 'backward', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (5, 'caret-right', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (6, 'caret-left', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (7, 'caret-down', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (8, 'caret-up', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (9, 'right-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (10, 'left-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (11, 'up-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (12, 'down-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (13, 'right-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (14, 'left-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (15, 'up-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (16, 'down-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (17, 'vertical-left', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (18, 'vertical-right', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (19, 'back', '常用图标', 0);
INSERT INTO `sys_icon` VALUES (20, 'retweet', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (21, 'shrink', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (22, 'arrow-salt', '常用图标', 0);
INSERT INTO `sys_icon` VALUES (23, 'double-right', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (24, 'double-left', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (25, 'arrow-down', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (26, 'arrow-up', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (27, 'arrow-right', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (28, 'arrow-left', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (29, 'down', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (30, 'up', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (31, 'right', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (32, 'left', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (33, 'minus-square-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (34, 'minus-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (35, 'minus-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (36, 'minus', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (37, 'plus-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (38, 'plus-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (39, 'plus', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (40, 'info-cirlce', '常用图标', 0);
INSERT INTO `sys_icon` VALUES (41, 'info-cirlce-o', '常用图标', 0);
INSERT INTO `sys_icon` VALUES (42, 'info', '常用图标', 0);
INSERT INTO `sys_icon` VALUES (43, 'exclamation', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (44, 'exclamation-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (45, 'exclamation-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (46, 'close-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (47, 'close-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (48, 'check-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (49, 'check-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (50, 'check', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (51, 'close', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (52, 'customer-service', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (53, 'credit-card', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (54, 'code-square-o', '常用图标', 0);
INSERT INTO `sys_icon` VALUES (55, 'book', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (56, 'barschart', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (57, 'bars', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (58, 'question', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (59, 'question-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (60, 'question-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (61, 'pause', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (62, 'pause-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (63, 'pause-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (64, 'clock-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (65, 'clock-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (66, 'swap', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (67, 'swap-left', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (68, 'swap-right', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (69, 'pluss-quare-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (70, 'frown', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (71, 'menufold', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (72, 'mail', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (73, 'link', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (74, 'area-chart', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (75, 'line-chart', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (76, 'home', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (77, 'laptop', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (78, 'star', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (79, 'staro', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (80, 'filter', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (81, 'meho', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (82, 'meh', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (83, 'shoppingcart', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (84, 'save', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (85, 'user', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (86, 'videocamera', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (87, 'totop', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (88, 'team', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (89, 'sharealt', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (90, 'setting', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (91, 'picture', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (92, 'phone', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (93, 'paperclip', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (94, 'notification', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (95, 'menuunfold', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (96, 'inbox', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (97, 'lock', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (98, 'qrcode', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (99, 'tags', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (100, 'tagso', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (101, 'cloudo', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (102, 'cloud', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (103, 'cloud-upload', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (104, 'cloud-download', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (105, 'cloud-downloado', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (106, 'cloud-uploado', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (107, 'enviroment', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (108, 'enviromento', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (109, 'eye', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (110, 'eye-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (111, 'camera', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (112, 'camera-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (113, 'windows', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (114, 'export2', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (115, 'export', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (116, 'circle-downo', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (117, 'circle-down', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (118, 'hdd', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (119, 'ie', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (120, 'delete', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (121, 'enter', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (122, 'pushpino', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (123, 'pushpin', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (124, 'heart', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (125, 'hearto', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (126, 'smile-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (127, 'smileo', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (128, 'frowno', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (129, 'calculator', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (130, 'chrome', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (131, 'github', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (132, 'iconfont-desktop', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (133, 'caret-circle-o-up', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (134, 'upload', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (135, 'download', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (136, 'piechart', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (137, 'lock1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (138, 'unlock', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (139, 'windows-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (140, 'dotchart', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (141, 'barchart', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (142, 'code-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (143, 'plus-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (144, 'minus-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (145, 'close-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (146, 'closes-quare-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (147, 'check-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (148, 'checks-quare-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (149, 'fast-backward', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (150, 'fast-forward', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (151, 'up-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (152, 'down-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (153, 'lefts-quare', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (154, 'right-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (155, 'right-square-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (156, 'left-square-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (157, 'down-square-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (158, 'up-square-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (159, 'play', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (160, 'play-circle-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (161, 'tag', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (162, 'tago', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (163, 'addfile', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (164, 'folder1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (165, 'file1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (166, 'switcher', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (167, 'add-folder', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (168, 'fold-eropen', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (169, 'search1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (170, 'ellipsis1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (171, 'calendar', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (172, 'filetext1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (173, 'copy1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (174, 'jpgfile1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (175, 'pdffile1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (176, 'exclefile1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (177, 'pptfile1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (178, 'unknowfile1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (179, 'wordfile1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (180, 'dingding', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (181, 'dingding-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (182, 'mobile1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (183, 'tablet1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (184, 'bells', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (185, 'disconnect', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (186, 'database', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (187, 'barcode', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (188, 'hourglass', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (189, 'key', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (190, 'flag', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (191, 'layout', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (192, 'printer', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (193, 'USB', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (194, 'skin', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (195, 'tool', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (196, 'car', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (197, 'addusergroup', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (198, 'carryout', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (199, 'deleteuser', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (200, 'deleteusergroup', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (201, 'man', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (202, 'isv', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (203, 'gift', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (204, 'idcard', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (205, 'medicinebox', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (206, 'redenvelopes', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (207, 'rest', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (208, 'Safety', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (209, 'wallet', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (210, 'woman', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (211, 'adduser', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (212, 'bank', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (213, 'Trophy', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (214, 'loading1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (215, 'loading2', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (216, 'like2', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (217, 'dislike2', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (218, 'like1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (219, 'dislike1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (220, 'bulb1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (221, 'rocket1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (222, 'select1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (223, 'apple1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (224, 'apple-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (225, 'android1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (226, 'android', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (227, 'aliwangwang-o1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (228, 'aliwangwang', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (229, 'pay-circle1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (230, 'pay-circle-o1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (231, 'poweroff', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (232, 'trademark', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (233, 'find', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (234, 'copyright', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (235, 'sound', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (236, 'earth', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (237, 'wifi', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (238, 'sync', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (239, 'login', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (240, 'logout', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (241, 'reload1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (242, 'message1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (243, 'shake', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (244, 'API', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (245, 'appstore-o', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (246, 'appstore1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (247, 'scan1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (248, 'exception1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (249, 'contacts', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (250, 'solution1', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (251, 'fork', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (252, 'edit', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (253, 'form', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (254, 'warning', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (255, 'table', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (256, 'profile', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (257, 'dashboard', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (258, 'indent-left', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (259, 'indent-right', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (260, 'menu-unfold', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (261, 'menu-fold', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (262, 'antdesign', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (263, 'alipay-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (264, 'codepen-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (265, 'google', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (266, 'amazon', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (267, 'codepen', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (268, 'facebook-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (269, 'dropbox', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (270, 'googleplus', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (271, 'linkedin-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (272, 'medium-monogram', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (273, 'gitlab', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (274, 'medium-wordmark', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (275, 'QQ', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (276, 'skype', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (277, 'taobao-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (278, 'alipay-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (279, 'youtube', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (280, 'wechat', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (281, 'twitter', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (282, 'weibo', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (283, 'HTML', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (284, 'taobao-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (285, 'weibo-circle', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (286, 'weibo-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (287, 'Code-Sandbox', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (288, 'aliyun', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (289, 'zhihu', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (290, 'behance', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (291, 'dribbble', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (292, 'dribbble-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (293, 'behance-square', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (294, 'file-markdown', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (295, 'instagram', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (296, 'yuque', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (297, 'slack', '常用图标', 1);
INSERT INTO `sys_icon` VALUES (298, 'slack-square', '常用图标', 1);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1087620602598027312 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"test\",\"deptId\":2,\"deptName\":\"长沙分公司\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40],\"deptIdList\":[],\"createTime\":\"Jan 7, 2019 6:28:32 PM\"}', 341, '0:0:0:0:0:0:0:1', '2019-01-07 18:28:33');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"testone\",\"remark\":\"你好\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40],\"deptIdList\":[],\"createTime\":\"Jan 14, 2019 10:49:02 AM\"}', 260, '0:0:0:0:0:0:0:1', '2019-01-14 10:49:03');
INSERT INTO `sys_log` VALUES (3, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":3,\"username\":\"wenbin\",\"password\":\"11783beb5df0a36ecbc528d065bf770a41b3f9ed3b8d5eedee52293766f0e16b\",\"salt\":\"AFoFb1JPfe1Pjw0aDSWI\",\"email\":\"we@qq.com\",\"mobile\":\"13333333333\",\"status\":0,\"roleIdList\":[1,2],\"createTime\":\"Jan 16, 2019 2:38:21 PM\",\"deptId\":4}', 2846, '192.168.199.192', '2019-01-16 14:38:22');
INSERT INTO `sys_log` VALUES (4, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":4,\"username\":\"we\",\"password\":\"e6f5531e21e8361f013262a414da5ec9f78ae5e0d3c46cc143751de93ca6f190\",\"salt\":\"IQcUwEmdXnfVmK2zK37P\",\"email\":\"we@qq.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 16, 2019 2:41:11 PM\",\"deptId\":1}', 155, '192.168.199.192', '2019-01-16 14:41:12');
INSERT INTO `sys_log` VALUES (5, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[4]', 3425, '192.168.199.192', '2019-01-16 17:05:44');
INSERT INTO `sys_log` VALUES (6, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":5,\"username\":\"5454\",\"password\":\"b700b7a585143d4011604abd0b39b2090a3a7eda20d91c1a9bfa361e51a4fc0c\",\"salt\":\"fRBUsbLPzAeI4VGsZC8K\",\"email\":\"wb@qq.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 16, 2019 5:06:29 PM\",\"deptId\":1}', 224, '192.168.199.192', '2019-01-16 17:06:30');
INSERT INTO `sys_log` VALUES (7, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[1]', 748, '192.168.199.192', '2019-01-16 17:37:09');
INSERT INTO `sys_log` VALUES (8, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[3]', 8155, '192.168.199.192', '2019-01-16 17:39:57');
INSERT INTO `sys_log` VALUES (9, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":6,\"username\":\"vrfitz\",\"password\":\"7aa3c0121c0e15625dd4a01b3c104ca11378c873e52e65e27328fdd207ceaab6\",\"salt\":\"E4fKgh2PFz8w2uys1vdk\",\"email\":\"303316861@qq.com\",\"mobile\":\"18838987007\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 16, 2019 5:44:30 PM\",\"deptId\":1}', 208, '0:0:0:0:0:0:0:1', '2019-01-16 17:44:31');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":7,\"username\":\"444\",\"password\":\"37d9d4a321e28ecf3e3dac697d0cf5aae3e0b57e338b834b9d444cb8db9fccbf\",\"salt\":\"KRjekSc8TxNhzWG8hf9o\",\"email\":\"e@qq.com\",\"mobile\":\"44444\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Jan 16, 2019 5:45:04 PM\",\"deptId\":1}', 93, '192.168.199.192', '2019-01-16 17:45:05');
INSERT INTO `sys_log` VALUES (11, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":9,\"username\":\"10110\",\"password\":\"40f946cdb52ff116c2564a6f30588417cad68ff5dbc4e45622f3911eef3be38f\",\"salt\":\"3QRrook7TBEnstEBWfLj\",\"email\":\"303316861@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 16, 2019 5:50:07 PM\",\"deptId\":1}', 302, '0:0:0:0:0:0:0:1', '2019-01-16 17:50:08');
INSERT INTO `sys_log` VALUES (12, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":10,\"username\":\"额外\",\"password\":\"3d01fb9722966cd20019dcdbb901df8ad75b1543c973dd6a49ac0fe3c0e25858\",\"salt\":\"FEQnjt2jqc6ya6vuGIJb\",\"email\":\"w@qq.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 16, 2019 5:53:33 PM\",\"deptId\":1}', 90, '192.168.199.192', '2019-01-16 17:53:33');
INSERT INTO `sys_log` VALUES (13, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[10]', 5718, '0:0:0:0:0:0:0:1', '2019-01-17 10:20:10');
INSERT INTO `sys_log` VALUES (14, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[2]', 49, '0:0:0:0:0:0:0:1', '2019-01-17 10:22:47');
INSERT INTO `sys_log` VALUES (15, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[5]', 42, '0:0:0:0:0:0:0:1', '2019-01-17 10:22:53');
INSERT INTO `sys_log` VALUES (16, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[6]', 40, '0:0:0:0:0:0:0:1', '2019-01-17 10:23:28');
INSERT INTO `sys_log` VALUES (17, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":11,\"username\":\"test\",\"password\":\"1c5d92efa82f4a86362aba89f027de55a3d387a77c8f3ef81e8478a09ca29471\",\"salt\":\"E0yVJqRxX3yj2FOJG22W\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 17, 2019 10:28:04 AM\",\"deptId\":2}', 226, '0:0:0:0:0:0:0:1', '2019-01-17 10:28:05');
INSERT INTO `sys_log` VALUES (18, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":12,\"username\":\"2222222222\",\"password\":\"fafd4fe36803a70890270ebc4bc3298b8bbae5bf8bb59362bb62ce450f3ecfdd\",\"salt\":\"6JTjdbIGuM8RE208d7CI\",\"email\":\"we@qq.com\",\"mobile\":\"22222\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Jan 17, 2019 10:42:20 AM\",\"deptId\":1}', 147, '192.168.199.192', '2019-01-17 10:42:21');
INSERT INTO `sys_log` VALUES (19, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":13,\"username\":\"role\",\"password\":\"111656e0142498622f922b87f221ca2806544461c99c2f2c16c2aebe43fc8a45\",\"salt\":\"94jjeqYjkdwciGGaDRLA\",\"email\":\"wenbin@qq.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Jan 17, 2019 11:20:57 AM\",\"deptId\":1}', 166, '192.168.199.192', '2019-01-17 11:20:58');
INSERT INTO `sys_log` VALUES (20, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":16,\"username\":\"re\",\"password\":\"5fb776e77188274de62bff5eb75d4e07384cf88b6d0791400849363d5a52b692\",\"salt\":\"Xs7FKHdpcuvESDuzn5Cj\",\"email\":\"rr2@qq.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Jan 17, 2019 11:55:10 AM\",\"deptId\":1}', 49, '192.168.199.192', '2019-01-17 11:55:11');
INSERT INTO `sys_log` VALUES (21, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":17,\"username\":\"4555555555\",\"password\":\"fb22651b04152d65e706ba506cee4e7a85be9fdcf40abf498346e9a6f728ef9a\",\"salt\":\"9EjTbk7h6OYg5qJ8Lhah\",\"email\":\"we@11.VOM\",\"mobile\":\"EEEEEEEEEEEEE\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 17, 2019 12:03:58 PM\",\"deptId\":1}', 60, '192.168.199.192', '2019-01-17 12:03:59');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":17,\"username\":\"4555555555\",\"password\":\"1facc402b7d81be1fa3f6091f140ea5de67772756b8eca195e8400162e852858\",\"email\":\"we@11.VOM\",\"mobile\":\"EEEEEEEEEEEEE\",\"status\":0,\"roleIdList\":[1],\"deptId\":3}', 21111, '192.168.199.192', '2019-01-17 13:05:30');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":16,\"username\":\"88888\",\"password\":\"136b74dba70da246ceb60e725476d1ac0cbac6ac772307a43bd8cb6f5fa1d7ca\",\"email\":\"rr2@qq.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[1,2],\"deptId\":1}', 60, '192.168.199.192', '2019-01-17 13:06:10');
INSERT INTO `sys_log` VALUES (24, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":17,\"username\":\"4555555555\",\"password\":\"45e81d8107ee55b129de751ff38aaf0b92a851de8a42a79886ed56f6f995d164\",\"email\":\"we@11.com\",\"mobile\":\"EEEEEEEEEEEEE\",\"status\":1,\"roleIdList\":[1,2],\"deptId\":4}', 157, '192.168.199.192', '2019-01-17 13:06:58');
INSERT INTO `sys_log` VALUES (25, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[1]', 2, '192.168.199.192', '2019-01-17 13:07:35');
INSERT INTO `sys_log` VALUES (26, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[7]', 33, '192.168.199.192', '2019-01-17 13:26:28');
INSERT INTO `sys_log` VALUES (27, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[12]', 45, '192.168.199.192', '2019-01-17 13:26:35');
INSERT INTO `sys_log` VALUES (28, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[17]', 39, '192.168.199.192', '2019-01-17 13:29:16');
INSERT INTO `sys_log` VALUES (29, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":18,\"username\":\"2222222\",\"password\":\"3d0ba82f8401fb44a9b9d50b26717e2478c335abd98b2b327538dca307894c9d\",\"salt\":\"Uxrj9kaovoYd5pFH1l8M\",\"email\":\"2222222222222@qq.com\",\"mobile\":\"13333333333\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 17, 2019 1:31:34 PM\",\"deptId\":1}', 58, '192.168.199.192', '2019-01-17 13:31:34');
INSERT INTO `sys_log` VALUES (30, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[16]', 31, '192.168.199.192', '2019-01-17 13:45:58');
INSERT INTO `sys_log` VALUES (31, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":19,\"username\":\"ssssssssssssss\",\"password\":\"8099d37bae56ef33fa407d57d26e615dd6ff38e98f195fc07abe8324171c55aa\",\"salt\":\"DLdaBHZB9IC10gzM9yXt\",\"email\":\"we@qq.com\",\"mobile\":\"1333333333333333\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Jan 17, 2019 1:46:50 PM\",\"deptId\":1}', 72, '192.168.199.192', '2019-01-17 13:46:51');
INSERT INTO `sys_log` VALUES (32, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":20,\"username\":\"233333333333\",\"password\":\"681859eb2f4f672cf332ebdd2042be2bb8c5d97873205ca8f13f7af5e6c7c1ba\",\"salt\":\"eHGxfLDdZMRxTzAq9iVg\",\"email\":\"3222222222222@qq.com\",\"mobile\":\"23333\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Jan 17, 2019 1:47:43 PM\",\"deptId\":1}', 84, '192.168.199.192', '2019-01-17 13:47:44');
INSERT INTO `sys_log` VALUES (33, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":21,\"username\":\"1222222\",\"password\":\"c2e970fad3805937fc8538db4a88e3d267ee3c562b5828fba789108ac1852d50\",\"salt\":\"L4ceOhpascuPvwEFaQlS\",\"email\":\"4444444444@qq.com\",\"mobile\":\"444444\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Jan 17, 2019 1:55:29 PM\",\"deptId\":1}', 64, '192.168.199.192', '2019-01-17 13:55:30');
INSERT INTO `sys_log` VALUES (34, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[20]', 12713, '192.168.199.192', '2019-01-17 14:53:53');
INSERT INTO `sys_log` VALUES (35, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[13]', 34, '192.168.199.192', '2019-01-17 14:55:18');
INSERT INTO `sys_log` VALUES (36, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[1]', 1, '192.168.199.192', '2019-01-17 14:58:52');
INSERT INTO `sys_log` VALUES (37, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[18]', 35, '192.168.199.192', '2019-01-17 14:59:02');
INSERT INTO `sys_log` VALUES (38, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[9]', 57, '192.168.199.192', '2019-01-17 15:01:18');
INSERT INTO `sys_log` VALUES (39, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":22,\"username\":\"322222222222222\",\"password\":\"c20892092cce2f76d92d5d58e755537549bc83066e9cde27be6d584fe1d18932\",\"salt\":\"V2xy87xLtPeDzE9H1Q5M\",\"email\":\"wenbin@qq.com\",\"mobile\":\"wenbin111\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Jan 17, 2019 3:01:51 PM\",\"deptId\":1}', 181, '192.168.199.192', '2019-01-17 15:01:52');
INSERT INTO `sys_log` VALUES (40, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[19]', 58, '192.168.199.192', '2019-01-17 15:08:07');
INSERT INTO `sys_log` VALUES (41, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[22]', 34, '192.168.199.192', '2019-01-17 15:09:52');
INSERT INTO `sys_log` VALUES (42, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":23,\"username\":\"2333333333333\",\"password\":\"e47d65470233fd5f4568e05d749e8d06332641dd3d66d33c15448585f918c22f\",\"salt\":\"45LGefBkC3QhTbomCzvp\",\"email\":\"W2@qq.com\",\"mobile\":\"wwwwwwwwwwww\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 17, 2019 3:10:26 PM\",\"deptId\":1}', 191, '192.168.199.192', '2019-01-17 15:10:26');
INSERT INTO `sys_log` VALUES (43, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[23]', 50, '192.168.199.192', '2019-01-17 15:11:05');
INSERT INTO `sys_log` VALUES (44, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin1\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"deptId\":1}', 237, '192.168.199.192', '2019-01-18 16:58:49');
INSERT INTO `sys_log` VALUES (45, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"deptId\":1}', 46, '192.168.199.192', '2019-01-18 17:02:33');
INSERT INTO `sys_log` VALUES (1087285106692923393, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087285105996668930,\"username\":\"11111\",\"password\":\"320594afee0773bc6619d9169f9aae080a7a33288cc4daf9f3f2954ae42afa01\",\"salt\":\"tduZkruunFp26f6KXFXz\",\"email\":\"980680177@qq.com\",\"mobile\":\"18838987007\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 21, 2019 5:45:44 PM\",\"deptId\":1}', 456, '192.168.199.109', '2019-01-21 17:45:45');
INSERT INTO `sys_log` VALUES (1087285137487503361, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087285136321486849,\"roleName\":\"32\",\"remark\":\"32\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 21, 2019 5:45:51 PM\"}', 3891, '192.168.199.192', '2019-01-21 17:45:52');
INSERT INTO `sys_log` VALUES (1087285828201291777, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087285827949633538,\"username\":\"222222\",\"password\":\"793c619d3458968f0e83df9cdb54f274b02a6132fa2654f9777d1eb9a1307f0d\",\"salt\":\"440bBqVfa2ZZpyzdKda6\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2,1],\"createTime\":\"Jan 21, 2019 5:48:36 PM\",\"deptId\":1}', 60, '192.168.199.109', '2019-01-21 17:48:37');
INSERT INTO `sys_log` VALUES (1087285979733106689, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087285979368202242,\"username\":\"323\",\"password\":\"9746f83f0e18509065a856c9a07c42999e598418605523654d2e857ebc024708\",\"salt\":\"ykh88znZgL4GCuqDiOOh\",\"email\":\"11111@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[1087285136321486800,2],\"createTime\":\"Jan 21, 2019 5:49:12 PM\",\"deptId\":2}', 89, '192.168.199.192', '2019-01-21 17:49:13');
INSERT INTO `sys_log` VALUES (1087286174797602818, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1087285979368202200,\"email\":\"11111@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[2,1087285136321486800],\"deptId\":2}', 68, '192.168.199.192', '2019-01-21 17:50:00');
INSERT INTO `sys_log` VALUES (1087287784919646209, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087287784269529090,\"username\":\"1111\",\"password\":\"4a74dade8466d1e241f63f7f290621dacaf0dad7d21055842d8675eb7a17bdbe\",\"salt\":\"iuLmo7i9pG5MUv4pZ8uS\",\"email\":\"303316861@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[1087285136321486800,2],\"createTime\":\"Jan 21, 2019 5:56:23 PM\",\"deptId\":1}', 393, '192.168.199.109', '2019-01-21 17:56:23');
INSERT INTO `sys_log` VALUES (1087288267323277314, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087288266488610817,\"roleName\":\"43\",\"remark\":\"43\",\"deptId\":2,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 21, 2019 5:58:18 PM\"}', 366, '192.168.199.192', '2019-01-21 17:58:18');
INSERT INTO `sys_log` VALUES (1087288986608631810, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"username\":\"111\",\"password\":\"e787cad246f0498096e887e3b0b6bbee9e455e599d94dbd7c198b7fbbd1639b8\",\"salt\":\"xLhaxr3Ty0kMg4pY48CQ\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2,1],\"createTime\":\"Jan 21, 2019 6:01:09 PM\",\"deptId\":1}', 376, '192.168.199.109', '2019-01-21 18:01:10');
INSERT INTO `sys_log` VALUES (1087289141986623490, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"username\":\"32\",\"password\":\"e1643229b02e9c68de5cb38299f876475ad5b00f913dbeba5e71062f38df6f10\",\"salt\":\"0AwkwXbV0pKgIS0f8CkT\",\"email\":\"qq@337.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 21, 2019 6:01:46 PM\",\"deptId\":2}', 81, '192.168.199.192', '2019-01-21 18:01:47');
INSERT INTO `sys_log` VALUES (1087289374523031554, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"username\":\"1232222\",\"password\":\"292c5c9508e67e714709ce60c665e3905ab530a439f52327a7a5418029710ea7\",\"salt\":\"JBIo2xrUASMRJVYcu4Ff\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 21, 2019 6:02:42 PM\",\"deptId\":1}', 48, '192.168.199.109', '2019-01-21 18:02:42');
INSERT INTO `sys_log` VALUES (1087290458645757953, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"username\":\"00001\",\"password\":\"b692589a028bcfe91ede435f9c63850d504679fdd397d122c53ad7001cd5a0a7\",\"salt\":\"wVP86OUu7a5p6ANRJZuw\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 21, 2019 6:06:29 PM\",\"deptId\":1}', 39308, '192.168.199.109', '2019-01-21 18:07:01');
INSERT INTO `sys_log` VALUES (1087290815669108738, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"username\":\"2221\",\"password\":\"aef18414b812f15b51796b09199764cb15ee93af076527c16847aecb08e6c297\",\"salt\":\"LyDVtwSlArEOOtdgkALH\",\"email\":\"980680177@qq.com\",\"mobile\":\"18838987007\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 21, 2019 6:08:25 PM\",\"deptId\":1}', 5634, '192.168.199.109', '2019-01-21 18:08:26');
INSERT INTO `sys_log` VALUES (1087291914710974465, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"username\":\"13112\",\"password\":\"dbc0a806e3c39ec1333146c958b71686cf5cf5679922b0dab7d2f3333795a5f3\",\"salt\":\"tRS2ScQKYjHpMbycOlLt\",\"email\":\"980680177@qq.com\",\"mobile\":\"18838987007\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 21, 2019 6:12:47 PM\",\"deptId\":1}', 78, '192.168.199.109', '2019-01-21 18:12:48');
INSERT INTO `sys_log` VALUES (1087292147373211649, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"username\":\"00024\",\"password\":\"80f5fd00e9a78446cffa7dde9c49cf73ecd55bd00cefe322f8984cebe85f18d8\",\"salt\":\"wGrli2wUe188lZ7CD5uL\",\"email\":\"980680177@qq.com\",\"mobile\":\"18801474720\",\"status\":1,\"roleIdList\":[1087285136321486800],\"createTime\":\"Jan 21, 2019 6:13:43 PM\",\"deptId\":3}', 100, '192.168.199.109', '2019-01-21 18:13:44');
INSERT INTO `sys_log` VALUES (1087292289195212802, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087292288461209601,\"roleName\":\"43444\",\"remark\":\"444\",\"deptId\":4,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 21, 2019 6:14:17 PM\"}', 181, '192.168.199.192', '2019-01-21 18:14:17');
INSERT INTO `sys_log` VALUES (1087293656399994882, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087293655963787265,\"username\":\"101\",\"password\":\"555d015beb89d3e826686dbd8916a252979e8d8ccadfd1a0de7f58ed9db5dea9\",\"salt\":\"aenbCmDexth7YPoVkdoY\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[1087285136321486800],\"createTime\":\"Jan 21, 2019 6:19:43 PM\",\"deptId\":1}', 353, '192.168.199.109', '2019-01-21 18:19:43');
INSERT INTO `sys_log` VALUES (1087294954386087937, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087294953782108161,\"username\":\"4343\",\"password\":\"2a75a09848fed0d5e9479b37397fa093b93ee63413c19aa1e323fda9b73e0f44\",\"salt\":\"ZtAHRGEsFJzIaKZ6IZnZ\",\"email\":\"wenbin@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[2,1087285136321486800],\"createTime\":\"Jan 21, 2019 6:24:52 PM\",\"deptId\":2}', 145, '192.168.199.192', '2019-01-21 18:24:53');
INSERT INTO `sys_log` VALUES (1087295186016526337, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087295185181859842,\"username\":\"11111111\",\"password\":\"79aaaa5ea187b4e2df1a224a21ef4a88644c5f128ea3e8d0b0e711eac944ea04\",\"salt\":\"rQv9LLM1Ets07R0NmxoZ\",\"email\":\"111111@qq.com\",\"mobile\":\"32323333333\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 21, 2019 6:25:47 PM\",\"deptId\":1}', 199, '192.168.199.192', '2019-01-21 18:25:48');
INSERT INTO `sys_log` VALUES (1087530556087865346, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087530554628247553,\"roleName\":\"3333\",\"remark\":\"3333\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 10:01:04 AM\"}', 434, '192.168.199.192', '2019-01-22 10:01:05');
INSERT INTO `sys_log` VALUES (1087538766165364738, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087538765888540674,\"username\":\"123\",\"password\":\"0c5fc843d6824ded941319ffe6bff0296b274c0e5c21efc9d0712ede39416e1a\",\"salt\":\"mdABojOln8PFyn3RvCuC\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 22, 2019 10:33:41 AM\",\"deptId\":1}', 290, '192.168.199.109', '2019-01-22 10:33:42');
INSERT INTO `sys_log` VALUES (1087545051510263809, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087545051317325825,\"username\":\"111\",\"password\":\"e77756a2072aeacf53ad9ac8cab09364097871e42773c827aae13b8e7f4192c9\",\"salt\":\"s5EcUsAowNtRnmkA2TW1\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 22, 2019 10:58:40 AM\",\"deptId\":1}', 45, '192.168.199.109', '2019-01-22 10:58:41');
INSERT INTO `sys_log` VALUES (1087587445597323265, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1087530554628247600,\"roleName\":\"666\",\"remark\":\"6666\",\"deptId\":2,\"menuIdList\":[3,5,19,20,21,22,29,30,36,37,38,39,40,41],\"deptIdList\":[]}', 341, '192.168.199.192', '2019-01-22 13:47:08');
INSERT INTO `sys_log` VALUES (1087588029243113473, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1087530554628247600,\"roleName\":\"666\",\"remark\":\"666\",\"deptId\":1,\"menuIdList\":[4,5,6,7,8,9,10,11,12,13,14,23,24,25,26,27,29,30,36,37,38,39,40,41],\"deptIdList\":[2]}', 79532, '192.168.199.192', '2019-01-22 13:49:27');
INSERT INTO `sys_log` VALUES (1087588313549815809, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1087530554628247600,\"roleName\":\"3333\",\"remark\":\"3333999\",\"deptId\":1,\"menuIdList\":[],\"deptIdList\":[1,2,3,4,5]}', 27171, '192.168.199.192', '2019-01-22 13:50:35');
INSERT INTO `sys_log` VALUES (1087588771383263233, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"test\",\"remark\":\"767676\",\"deptId\":2,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40],\"deptIdList\":[1,2,3,4,5]}', 20358, '192.168.199.192', '2019-01-22 13:52:24');
INSERT INTO `sys_log` VALUES (1087588952598167554, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"test\",\"remark\":\"65656\",\"deptId\":2,\"menuIdList\":[],\"deptIdList\":[1,2,3,4,5]}', 166, '192.168.199.192', '2019-01-22 13:53:07');
INSERT INTO `sys_log` VALUES (1087589032549990401, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"testone\",\"remark\":\"878787\",\"deptId\":4,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40],\"deptIdList\":[1,2,3,4,5]}', 227, '192.168.199.192', '2019-01-22 13:53:26');
INSERT INTO `sys_log` VALUES (1087589069673775106, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1087285136321486800,\"roleName\":\"32\",\"remark\":\"878787\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[]}', 48, '192.168.199.192', '2019-01-22 13:53:35');
INSERT INTO `sys_log` VALUES (1087608018847211522, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":1087608018549415937,\"username\":\"1111\",\"password\":\"eadd0b6a12515072b7a2bc458277358f21e53297f824396b010ac36c0ecb0276\",\"salt\":\"myH6s48LiPKyQ7dhWcA7\",\"email\":\"980680177@qq.com\",\"mobile\":\"13354782455\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jan 22, 2019 3:08:52 PM\",\"deptId\":1}', 299, '192.168.199.109', '2019-01-22 15:08:53');
INSERT INTO `sys_log` VALUES (1087609022770630657, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleName\":\"123\",\"remark\":\"123\",\"deptId\":1,\"menuIdList\":[2,15,16,17,18],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 3:12:52 PM\"}', 281, '192.168.199.109', '2019-01-22 15:12:52');
INSERT INTO `sys_log` VALUES (1087611769905545218, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087611769540640769,\"roleName\":\"11111\",\"remark\":\"11111\",\"deptId\":1,\"menuIdList\":[],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 3:23:47 PM\"}', 274, '192.168.199.109', '2019-01-22 15:23:47');
INSERT INTO `sys_log` VALUES (1087611769905545219, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087611769540640770,\"roleName\":\"111\",\"remark\":\"111\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 3:32:12 PM\"}', 194, '192.168.199.109', '2019-01-22 15:32:13');
INSERT INTO `sys_log` VALUES (1087611769905545220, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087611769540640771,\"roleName\":\"121\",\"remark\":\"1222\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 3:33:42 PM\"}', 198, '192.168.199.109', '2019-01-22 15:33:43');
INSERT INTO `sys_log` VALUES (1087620602598027265, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876609,\"roleName\":\"123\",\"remark\":\"111\",\"deptId\":1,\"menuIdList\":[],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 3:58:53 PM\"}', 299, '192.168.199.109', '2019-01-22 15:58:53');
INSERT INTO `sys_log` VALUES (1087620602598027266, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876610,\"roleName\":\"123222\",\"remark\":\"22222\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 4:01:47 PM\"}', 400, '192.168.199.109', '2019-01-22 16:01:48');
INSERT INTO `sys_log` VALUES (1087620602598027267, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876611,\"roleName\":\"0001\",\"remark\":\"11110\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 4:05:39 PM\"}', 182, '192.168.199.109', '2019-01-22 16:05:40');
INSERT INTO `sys_log` VALUES (1087620602598027268, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876612,\"roleName\":\"aa\",\"remark\":\"ssss\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 4:44:39 PM\"}', 213, '192.168.199.109', '2019-01-22 16:44:40');
INSERT INTO `sys_log` VALUES (1087620602598027269, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"test\",\"remark\":\"65656\",\"deptId\":2,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5]}', 145, '192.168.199.192', '2019-01-22 17:45:50');
INSERT INTO `sys_log` VALUES (1087620602598027270, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[1087530554628247554]', 39, '192.168.199.192', '2019-01-22 17:46:00');
INSERT INTO `sys_log` VALUES (1087620602598027271, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876613,\"roleName\":\"54\",\"remark\":\"54\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 22, 2019 6:11:19 PM\"}', 126, '192.168.199.192', '2019-01-22 18:11:19');
INSERT INTO `sys_log` VALUES (1087620602598027272, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1087620602119876613,\"roleName\":\"54\",\"remark\":\"54666\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[]}', 96, '192.168.199.192', '2019-01-22 18:11:39');
INSERT INTO `sys_log` VALUES (1087620602598027273, 'admin', '保存定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":3,\"beanName\":\"testTask\",\"methodName\":\"test2\",\"params\":\"\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"无参数测试\",\"createTime\":\"Jan 24, 2019 5:47:56 PM\"}', 276, '192.168.199.239', '2019-01-24 17:47:57');
INSERT INTO `sys_log` VALUES (1087620602598027274, 'admin', '修改定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":3,\"beanName\":\"testTask\",\"methodName\":\"test2\",\"params\":\"1111111111\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"有参数测试\",\"createTime\":\"Jan 24, 2019 5:47:56 PM\"}', 340, '192.168.199.239', '2019-01-24 17:48:14');
INSERT INTO `sys_log` VALUES (1087620602598027275, 'admin', '修改定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":3,\"beanName\":\"testTask\",\"methodName\":\"test2eee\",\"params\":\"1111111111\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"有参数测试\",\"createTime\":\"Jan 24, 2019 5:47:56 PM\"}', 254, '192.168.199.239', '2019-01-24 17:57:01');
INSERT INTO `sys_log` VALUES (1087620602598027276, 'admin', '修改定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":3,\"beanName\":\"testTask333\",\"methodName\":\"test2eee333\",\"params\":\"1111111111\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"有参数测试\",\"createTime\":\"Jan 24, 2019 5:47:56 PM\"}', 159, '192.168.199.239', '2019-01-24 17:58:16');
INSERT INTO `sys_log` VALUES (1087620602598027277, 'admin', '修改定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":3,\"beanName\":\"testTask33354545\",\"methodName\":\"test2eee33354545\",\"params\":\"1111111111\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"有参数测试\",\"createTime\":\"Jan 24, 2019 5:47:56 PM\"}', 210, '192.168.199.239', '2019-01-24 18:00:36');
INSERT INTO `sys_log` VALUES (1087620602598027278, 'admin', '暂停定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.pause()', '[3]', 135, '192.168.199.239', '2019-01-24 18:35:30');
INSERT INTO `sys_log` VALUES (1087620602598027279, 'admin', '恢复定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.resume()', '[3]', 96, '192.168.199.239', '2019-01-24 18:36:25');
INSERT INTO `sys_log` VALUES (1087620602598027280, 'admin', '立即执行任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.run()', '[3]', 88, '192.168.199.239', '2019-01-24 18:36:46');
INSERT INTO `sys_log` VALUES (1087620602598027281, 'admin', '修改定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":3,\"beanName\":\"testTask\",\"methodName\":\"test\",\"params\":\"1111111111\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"有参数测试\",\"createTime\":\"Jan 24, 2019 5:47:56 PM\"}', 63, '192.168.199.239', '2019-01-24 18:37:49');
INSERT INTO `sys_log` VALUES (1087620602598027282, 'admin', '立即执行任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.run()', '[3]', 36, '192.168.199.239', '2019-01-24 18:38:01');
INSERT INTO `sys_log` VALUES (1087620602598027283, 'admin', '修改定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":3,\"beanName\":\"testTask\",\"methodName\":\"test\",\"params\":\"1111111111\",\"cronExpression\":\"0/5 * * * * ?\",\"status\":0,\"remark\":\"有参数测试\",\"createTime\":\"Jan 24, 2019 5:47:56 PM\"}', 157, '192.168.199.239', '2019-01-24 18:40:12');
INSERT INTO `sys_log` VALUES (1087620602598027284, 'admin', '修改定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":3,\"beanName\":\"testTask\",\"methodName\":\"test\",\"params\":\"1111111111\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"有参数测试\",\"createTime\":\"Jan 24, 2019 5:47:56 PM\"}', 123, '192.168.199.239', '2019-01-24 18:42:33');
INSERT INTO `sys_log` VALUES (1087620602598027285, 'admin', '修改菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理0\",\"path\":\"/system-manager\",\"type\":0,\"icon\":\"setting\",\"orderNum\":0}', 43, '192.168.199.239', '2019-01-24 18:43:00');
INSERT INTO `sys_log` VALUES (1087620602598027286, 'admin', '修改菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"path\":\"/system-manager\",\"type\":0,\"icon\":\"setting\",\"orderNum\":0}', 52, '0:0:0:0:0:0:0:1', '2019-01-25 16:48:24');
INSERT INTO `sys_log` VALUES (1087620602598027287, 'admin', '保存配置', 'com.winnerdt.modules.sys.controller.SysConfigController.save()', '{\"id\":3,\"paramKey\":\"323233\",\"paramValue\":\"33333232\",\"remark\":\"323\"}', 51, '192.168.199.192', '2019-01-28 15:10:43');
INSERT INTO `sys_log` VALUES (1087620602598027288, 'admin', '保存角色', 'com.winnerdt.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876614,\"roleName\":\"65\",\"remark\":\"666\",\"deptId\":1,\"menuIdList\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41],\"deptIdList\":[1,2,3,4,5],\"createTime\":\"Jan 28, 2019 3:14:46 PM\"}', 302, '192.168.199.192', '2019-01-28 15:14:46');
INSERT INTO `sys_log` VALUES (1087620602598027289, 'admin', '保存用户', 'com.winnerdt.modules.sys.controller.SysUserController.save()', '{\"userId\":1087608018549415938,\"username\":\"111112\",\"password\":\"cac949cc797a864cd8f6e8a832817d827d42943f2e790ba76262808013105832\",\"salt\":\"X8f0wYhZDMMoKa1S1cuW\",\"email\":\"303314582@qq.com\",\"mobile\":\"12322548654\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jan 29, 2019 3:01:22 PM\",\"deptId\":1}', 95, '0:0:0:0:0:0:0:1', '2019-01-29 15:01:23');
INSERT INTO `sys_log` VALUES (1087620602598027290, 'admin', '删除用户', 'com.winnerdt.modules.sys.controller.SysUserController.delete()', '[1087608018549415938]', 64, '0:0:0:0:0:0:0:1', '2019-01-29 15:01:53');
INSERT INTO `sys_log` VALUES (1087620602598027291, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":42,\"parentId\":30,\"name\":\"查看\",\"perms\":\"sys:oss:list\",\"type\":2,\"orderNum\":1}', 50, '192.168.199.109', '2019-01-30 15:16:45');
INSERT INTO `sys_log` VALUES (1087620602598027292, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":43,\"parentId\":30,\"name\":\"新增\",\"perms\":\"sys:oss:save\",\"type\":2,\"orderNum\":2}', 32, '192.168.199.109', '2019-01-30 15:17:20');
INSERT INTO `sys_log` VALUES (1087620602598027293, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":44,\"parentId\":30,\"name\":\"上传\",\"perms\":\"sys:oss:upload\",\"type\":2,\"orderNum\":3}', 37, '192.168.199.109', '2019-01-30 15:17:51');
INSERT INTO `sys_log` VALUES (1087620602598027294, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":45,\"parentId\":30,\"name\":\"删除\",\"perms\":\"sys:oss:delete\",\"type\":2,\"orderNum\":4}', 33, '192.168.199.109', '2019-01-30 15:18:19');
INSERT INTO `sys_log` VALUES (1087620602598027295, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":46,\"parentId\":27,\"name\":\"查看\",\"perms\":\"sys:config:list,sys:config:info\",\"type\":2,\"orderNum\":1}', 49, '192.168.199.192', '2019-01-30 15:44:36');
INSERT INTO `sys_log` VALUES (1087620602598027296, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":47,\"parentId\":27,\"name\":\"删除\",\"perms\":\"sys:config:delete\",\"type\":2,\"orderNum\":1}', 46, '192.168.199.192', '2019-01-30 15:45:21');
INSERT INTO `sys_log` VALUES (1087620602598027297, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":48,\"parentId\":27,\"name\":\"修改\",\"perms\":\"sys:config:update\",\"type\":2,\"orderNum\":1}', 49, '192.168.199.192', '2019-01-30 15:45:56');
INSERT INTO `sys_log` VALUES (1087620602598027298, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":49,\"parentId\":27,\"name\":\"添加\",\"perms\":\"sys:config:save\",\"type\":2,\"orderNum\":1}', 41, '192.168.199.192', '2019-01-30 15:46:30');
INSERT INTO `sys_log` VALUES (1087620602598027299, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":50,\"parentId\":29,\"name\":\"查看\",\"perms\":\"sys:log:list\",\"type\":2,\"orderNum\":1}', 28, '192.168.199.192', '2019-01-30 15:53:10');
INSERT INTO `sys_log` VALUES (1087620602598027300, 'admin', '保存定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":4,\"beanName\":\"testTask\",\"methodName\":\"test2\",\"params\":\"xsxasxasxsx\",\"cronExpression\":\"0 0/30 * * * ?\",\"status\":0,\"remark\":\"dscsdcscs\",\"createTime\":\"Jan 30, 2019 4:22:37 PM\"}', 465, '192.168.199.192', '2019-01-30 16:22:38');
INSERT INTO `sys_log` VALUES (1087620602598027301, 'admin', '暂停定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.pause()', '[3]', 220, '192.168.199.192', '2019-01-30 16:55:02');
INSERT INTO `sys_log` VALUES (1087620602598027302, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":51,\"parentId\":41,\"name\":\"查看\",\"perms\":\"sys:oss:list\",\"type\":2,\"icon\":\"step-forward\",\"orderNum\":12}', 111, '0:0:0:0:0:0:0:1', '2019-02-12 10:03:16');
INSERT INTO `sys_log` VALUES (1087620602598027303, 'admin', '保存菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.save()', '{\"menuId\":52,\"parentId\":41,\"name\":\"te\",\"perms\":\"ds\",\"type\":2,\"icon\":\"caret-up\",\"orderNum\":1}', 75, '192.168.199.192', '2019-02-12 10:13:24');
INSERT INTO `sys_log` VALUES (1087620602598027304, 'admin', '删除定时任务', 'com.winnerdt.modules.job.controller.ScheduleJobController.delete()', '[3]', 345, '192.168.199.192', '2019-02-12 10:14:48');
INSERT INTO `sys_log` VALUES (1087620602598027305, 'admin', '修改菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.update()', '{\"menuId\":52,\"parentId\":41,\"name\":\"tetttt\",\"perms\":\"ds\",\"type\":2,\"icon\":\"caret-up\",\"orderNum\":1}', 45, '192.168.199.192', '2019-02-12 10:15:29');
INSERT INTO `sys_log` VALUES (1087620602598027306, 'admin', '删除菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.delete()', '51', 51, '0:0:0:0:0:0:0:1', '2019-02-12 10:19:26');
INSERT INTO `sys_log` VALUES (1087620602598027307, 'admin', '删除菜单', 'com.winnerdt.modules.sys.controller.SysMenuController.delete()', '52', 47, '0:0:0:0:0:0:0:1', '2019-02-12 10:20:31');
INSERT INTO `sys_log` VALUES (1087620602598027308, 'admin', '保存角色', 'com.winnerdt.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876615,\"roleName\":\"test\",\"deptId\":0,\"menuIdList\":[],\"deptIdList\":[],\"createTime\":\"Feb 14, 2019 1:40:41 PM\"}', 398, '192.168.199.192', '2019-02-14 13:40:42');
INSERT INTO `sys_log` VALUES (1087620602598027309, 'admin', '保存角色', 'com.winnerdt.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876616,\"roleName\":\"test\",\"deptId\":0,\"menuIdList\":[],\"deptIdList\":[],\"createTime\":\"Feb 14, 2019 1:42:36 PM\"}', 83, '192.168.199.192', '2019-02-14 13:42:36');
INSERT INTO `sys_log` VALUES (1087620602598027310, 'admin', '保存角色', 'com.winnerdt.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876617,\"roleName\":\"ctest\",\"deptId\":0,\"menuIdList\":[],\"deptIdList\":[],\"createTime\":\"Feb 14, 2019 1:46:10 PM\"}', 56, '192.168.199.192', '2019-02-14 13:46:11');
INSERT INTO `sys_log` VALUES (1087620602598027311, 'admin', '保存角色', 'com.winnerdt.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1087620602119876618,\"roleName\":\"tests\",\"deptId\":0,\"menuIdList\":[],\"deptIdList\":[],\"createTime\":\"Feb 14, 2019 1:46:47 PM\"}', 117, '192.168.199.192', '2019-02-14 13:46:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '给前台使用的，具体作用不明',
  `exact` int(10) NULL DEFAULT 0 COMMENT '给前台使用的，具体作用不明,boolean类型',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system-manager', NULL, 0, 'setting', 0, 'menu.systemManager', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员管理', '/system-manager/admin-manager', NULL, 1, 'user', 1, 'menu.systemManager.adminManager', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', '/system-manager/role-manager', NULL, 1, 'tool', 2, 'menu.systemManager.roleManager', 1);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', '/system-manager/menu-manager', NULL, 1, 'tool', 3, 'menu.systemManager.menuManager', 1);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', '/system-manager/sql-manager', NULL, 1, 'tool', 4, 'menu.systemManager.sqlManager', 1);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', '/system-manager/timing-manager', NULL, 1, 'tool', 5, 'menu.systemManager.timingManager', 1);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', '/system-manager/parameter-manager', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'tool', 6, 'menu.systemManager.parameterManager', 1);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', '/system-manager/system-log', 'sys:log:list', 1, 'tool', 7, 'menu.systemManager.systemLog', 1);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', '/system-manager/file-upload', 'sys:oss:list', 1, 'tool', 6, 'menu.systemManager.fileUpload', 1);
INSERT INTO `sys_menu` VALUES (31, 1, '部门管理', '/system-manager/department-manager', NULL, 1, 'tool', 1, 'menu.systemManager.departmentManager', 1);
INSERT INTO `sys_menu` VALUES (32, 31, '查看', NULL, 'sys:dept:list,sys:dept:info', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (33, 31, '新增', NULL, 'sys:dept:save,sys:dept:select', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (34, 31, '修改', NULL, 'sys:dept:update,sys:dept:select', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (35, 31, '删除', NULL, 'sys:dept:delete', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (36, 1, '字典管理', '/system-manager/dictionary-manager', NULL, 1, 'tool', 6, 'menu.systemManager.dictionaryManager', 1);
INSERT INTO `sys_menu` VALUES (37, 36, '查看', NULL, 'sys:dict:list,sys:dict:info', 2, NULL, 6, NULL, 1);
INSERT INTO `sys_menu` VALUES (38, 36, '新增', NULL, 'sys:dict:save', 2, NULL, 6, NULL, 1);
INSERT INTO `sys_menu` VALUES (39, 36, '修改', NULL, 'sys:dict:update', 2, NULL, 6, NULL, 1);
INSERT INTO `sys_menu` VALUES (40, 36, '删除', NULL, 'sys:dict:delete', 2, NULL, 6, NULL, 1);
INSERT INTO `sys_menu` VALUES (41, 1, '测试页面', '/system-manager/system-test', NULL, 1, 'tool', 1, 'menu.systemManager.testPage', 1);
INSERT INTO `sys_menu` VALUES (42, 30, '查看', NULL, 'sys:oss:list', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (43, 30, '新增', NULL, 'sys:oss:save', 2, NULL, 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (44, 30, '上传', NULL, 'sys:oss:upload', 2, NULL, 3, NULL, 0);
INSERT INTO `sys_menu` VALUES (45, 30, '删除', NULL, 'sys:oss:delete', 2, NULL, 4, NULL, 0);
INSERT INTO `sys_menu` VALUES (46, 27, '查看', NULL, 'sys:config:list,sys:config:info', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (47, 27, '删除', NULL, 'sys:config:delete', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (48, 27, '修改', NULL, 'sys:config:update', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (49, 27, '添加', NULL, 'sys:config:save', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (50, 29, '查看', NULL, 'sys:log:list', 2, NULL, 1, NULL, 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `bucket_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储空间',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES (79, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/2fb361592b77489caae8cf82018a4cdb.png', 'master-test', 'upload/20190130/2fb361592b77489caae8cf82018a4cdb.png', '2019-01-30 15:30:04');
INSERT INTO `sys_oss` VALUES (80, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/1357e652e7134b8f94726d471b776519.png', 'master-test', 'upload/20190130/1357e652e7134b8f94726d471b776519.png', '2019-01-30 15:30:04');
INSERT INTO `sys_oss` VALUES (81, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/621779f9cbd8447489ab5c1063919e40.png', 'master-test', 'upload/20190130/621779f9cbd8447489ab5c1063919e40.png', '2019-01-30 15:30:05');
INSERT INTO `sys_oss` VALUES (82, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/0188acb13161465993e92fca152b2c6b.png', 'master-test', 'upload/20190130/0188acb13161465993e92fca152b2c6b.png', '2019-01-30 15:30:06');
INSERT INTO `sys_oss` VALUES (83, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/64d6e61ca521466fae2976cefbfdad7c.png', 'master-test', 'upload/20190130/64d6e61ca521466fae2976cefbfdad7c.png', '2019-01-30 15:30:06');
INSERT INTO `sys_oss` VALUES (84, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/d7235fe00a9b450d9113320403de0d78.png', 'master-test', 'upload/20190130/d7235fe00a9b450d9113320403de0d78.png', '2019-01-30 15:30:07');
INSERT INTO `sys_oss` VALUES (85, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/2b9f54a3806e41d1a4f838340d99365c.png', 'master-test', 'upload/20190130/2b9f54a3806e41d1a4f838340d99365c.png', '2019-01-30 15:30:07');
INSERT INTO `sys_oss` VALUES (86, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/3663ed20b1aa4ae59e9c5c4648fdd47c.png', 'master-test', 'upload/20190130/3663ed20b1aa4ae59e9c5c4648fdd47c.png', '2019-01-30 15:30:08');
INSERT INTO `sys_oss` VALUES (87, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/50d9a2b6eb0b44888efd43ad206faad5.jpg', 'master-test', 'upload/20190130/50d9a2b6eb0b44888efd43ad206faad5.jpg', '2019-01-30 15:30:08');
INSERT INTO `sys_oss` VALUES (88, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/1fe7e32fa8b641a5b13112514919f1ae.png', 'master-test', 'upload/20190130/1fe7e32fa8b641a5b13112514919f1ae.png', '2019-01-30 15:30:08');
INSERT INTO `sys_oss` VALUES (89, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/67862baaf63c491c9f387f4327c03da2.jpg', 'master-test', 'upload/20190130/67862baaf63c491c9f387f4327c03da2.jpg', '2019-01-30 15:30:09');
INSERT INTO `sys_oss` VALUES (90, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/33fed781629b4b90be1ce49fb1e6bc57.jpg', 'master-test', 'upload/20190130/33fed781629b4b90be1ce49fb1e6bc57.jpg', '2019-01-30 15:30:09');
INSERT INTO `sys_oss` VALUES (91, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/243167b2b85544a18a41a90bfde2c8e4.jpg', 'master-test', 'upload/20190130/243167b2b85544a18a41a90bfde2c8e4.jpg', '2019-01-30 15:30:09');
INSERT INTO `sys_oss` VALUES (92, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/8c82147f4f2c4582a997c0b2aa362faf.png', 'master-test', 'upload/20190130/8c82147f4f2c4582a997c0b2aa362faf.png', '2019-01-30 15:30:10');
INSERT INTO `sys_oss` VALUES (93, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/89e19054c00642899e38fdb68bd8f5a4.png', 'master-test', 'upload/20190130/89e19054c00642899e38fdb68bd8f5a4.png', '2019-01-30 15:30:10');
INSERT INTO `sys_oss` VALUES (94, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/c26745a811754b758b4fe116620e3582.png', 'master-test', 'upload/20190130/c26745a811754b758b4fe116620e3582.png', '2019-01-30 15:30:10');
INSERT INTO `sys_oss` VALUES (95, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/28b70b0983594ac5a11e9878c1bad0b2.png', 'master-test', 'upload/20190130/28b70b0983594ac5a11e9878c1bad0b2.png', '2019-01-30 15:30:11');
INSERT INTO `sys_oss` VALUES (96, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/768d3a96dfcc4fc88acfa21541c1ea5b.png', 'master-test', 'upload/20190130/768d3a96dfcc4fc88acfa21541c1ea5b.png', '2019-01-30 15:30:11');
INSERT INTO `sys_oss` VALUES (97, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/5a25c9511d964a3e8a6ae76c8c20273e.png', 'master-test', 'upload/20190130/5a25c9511d964a3e8a6ae76c8c20273e.png', '2019-01-30 15:30:11');
INSERT INTO `sys_oss` VALUES (98, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/e4591eb7ba3948f79cf9eb15760c58c4.png', 'master-test', 'upload/20190130/e4591eb7ba3948f79cf9eb15760c58c4.png', '2019-01-30 15:30:12');
INSERT INTO `sys_oss` VALUES (99, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/5f3cc3d665834bfaa81f9ea582b7811e.png', 'master-test', 'upload/20190130/5f3cc3d665834bfaa81f9ea582b7811e.png', '2019-01-30 15:30:12');
INSERT INTO `sys_oss` VALUES (100, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/4c7e150c830e4e3490649527999ea5ab.png', 'master-test', 'upload/20190130/4c7e150c830e4e3490649527999ea5ab.png', '2019-01-30 15:30:12');
INSERT INTO `sys_oss` VALUES (101, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/1ad950d8bffa4373a978d8a91ce77c72.png', 'master-test', 'upload/20190130/1ad950d8bffa4373a978d8a91ce77c72.png', '2019-01-30 15:30:12');
INSERT INTO `sys_oss` VALUES (102, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/36412eba0aba4ea19c06bd25e4dfe8ae.png', 'master-test', 'upload/20190130/36412eba0aba4ea19c06bd25e4dfe8ae.png', '2019-01-30 15:30:13');
INSERT INTO `sys_oss` VALUES (103, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/bb9ead7362114e978a3ef755ef0a4a3a.png', 'master-test', 'upload/20190130/bb9ead7362114e978a3ef755ef0a4a3a.png', '2019-01-30 15:30:13');
INSERT INTO `sys_oss` VALUES (104, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/2559e1aad3a64ca09e4de90dca29bc8b.png', 'master-test', 'upload/20190130/2559e1aad3a64ca09e4de90dca29bc8b.png', '2019-01-30 15:30:13');
INSERT INTO `sys_oss` VALUES (105, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/5324c89668564d158f02e3e1ee149b45.png', 'master-test', 'upload/20190130/5324c89668564d158f02e3e1ee149b45.png', '2019-01-30 15:30:14');
INSERT INTO `sys_oss` VALUES (106, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/941f376c887a4ef8a05ae73d8528e555.png', 'master-test', 'upload/20190130/941f376c887a4ef8a05ae73d8528e555.png', '2019-01-30 15:30:14');
INSERT INTO `sys_oss` VALUES (107, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/f1fefab6f04a42789a68aba82742e8bb.png', 'master-test', 'upload/20190130/f1fefab6f04a42789a68aba82742e8bb.png', '2019-01-30 15:30:14');
INSERT INTO `sys_oss` VALUES (108, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/c9b4fd9a591b4ad9bf175278907e11f8.png', 'master-test', 'upload/20190130/c9b4fd9a591b4ad9bf175278907e11f8.png', '2019-01-30 15:30:15');
INSERT INTO `sys_oss` VALUES (109, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/b0bff630f1c6467e8f60ff4e501d8c47.png', 'master-test', 'upload/20190130/b0bff630f1c6467e8f60ff4e501d8c47.png', '2019-01-30 15:30:15');
INSERT INTO `sys_oss` VALUES (110, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/4b701a890148475bb241a6f44c9f9f0f.png', 'master-test', 'upload/20190130/4b701a890148475bb241a6f44c9f9f0f.png', '2019-01-30 15:30:15');
INSERT INTO `sys_oss` VALUES (111, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/51d071972a3d4e7487e4c7919f7cc1f8.png', 'master-test', 'upload/20190130/51d071972a3d4e7487e4c7919f7cc1f8.png', '2019-01-30 15:30:15');
INSERT INTO `sys_oss` VALUES (112, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/f65b75fdec554cafad3a84ba872771c5.png', 'master-test', 'upload/20190130/f65b75fdec554cafad3a84ba872771c5.png', '2019-01-30 15:30:16');
INSERT INTO `sys_oss` VALUES (113, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/c7d8a2e338d6447fb62599c1a3954897.png', 'master-test', 'upload/20190130/c7d8a2e338d6447fb62599c1a3954897.png', '2019-01-30 15:30:16');
INSERT INTO `sys_oss` VALUES (114, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/c7245d54caa1462bb6eb8bf2d7ce6a82.png', 'master-test', 'upload/20190130/c7245d54caa1462bb6eb8bf2d7ce6a82.png', '2019-01-30 15:30:16');
INSERT INTO `sys_oss` VALUES (115, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/8ae11ea6287f442ebf4c2358f3ad60ef.png', 'master-test', 'upload/20190130/8ae11ea6287f442ebf4c2358f3ad60ef.png', '2019-01-30 15:30:16');
INSERT INTO `sys_oss` VALUES (116, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/62f4cd654dcd400a9af4ae59d5c7c00a.png', 'master-test', 'upload/20190130/62f4cd654dcd400a9af4ae59d5c7c00a.png', '2019-01-30 15:30:17');
INSERT INTO `sys_oss` VALUES (117, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/a16ba61fe2f1404987c9140269a7b37e.png', 'master-test', 'upload/20190130/a16ba61fe2f1404987c9140269a7b37e.png', '2019-01-30 15:30:17');
INSERT INTO `sys_oss` VALUES (118, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/99140c49b7524b40878feeb70d75a478.png', 'master-test', 'upload/20190130/99140c49b7524b40878feeb70d75a478.png', '2019-01-30 15:30:17');
INSERT INTO `sys_oss` VALUES (119, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/a81f587365dc41708b3576af57771e1a.png', 'master-test', 'upload/20190130/a81f587365dc41708b3576af57771e1a.png', '2019-01-30 15:30:18');
INSERT INTO `sys_oss` VALUES (120, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/41451d66cd8243a3afc86067df99952f.jpg', 'master-test', 'upload/20190130/41451d66cd8243a3afc86067df99952f.jpg', '2019-01-30 15:30:18');
INSERT INTO `sys_oss` VALUES (121, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/e99bb7b2625842c1810c154ef41940db.png', 'master-test', 'upload/20190130/e99bb7b2625842c1810c154ef41940db.png', '2019-01-30 15:30:18');
INSERT INTO `sys_oss` VALUES (122, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/ea501a7e8d9746b5834191009e4b705c.png', 'master-test', 'upload/20190130/ea501a7e8d9746b5834191009e4b705c.png', '2019-01-30 15:30:18');
INSERT INTO `sys_oss` VALUES (123, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/f9d015268044403da5e7cfad0a8d81aa.png', 'master-test', 'upload/20190130/f9d015268044403da5e7cfad0a8d81aa.png', '2019-01-30 15:30:19');
INSERT INTO `sys_oss` VALUES (124, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/48c04388255c47a789b0d512a3a6fc73.png', 'master-test', 'upload/20190130/48c04388255c47a789b0d512a3a6fc73.png', '2019-01-30 15:30:19');
INSERT INTO `sys_oss` VALUES (125, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/a88eff67f2014d1c960ab7ad21d725ea.png', 'master-test', 'upload/20190130/a88eff67f2014d1c960ab7ad21d725ea.png', '2019-01-30 15:30:19');
INSERT INTO `sys_oss` VALUES (126, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/696e57bf1d9c453fb470147af1a26728.png', 'master-test', 'upload/20190130/696e57bf1d9c453fb470147af1a26728.png', '2019-01-30 15:30:20');
INSERT INTO `sys_oss` VALUES (127, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/392e3cd7c2034e14a2ccb1383e7d4e73.jpg', 'master-test', 'upload/20190130/392e3cd7c2034e14a2ccb1383e7d4e73.jpg', '2019-01-30 15:30:20');
INSERT INTO `sys_oss` VALUES (128, 'http://pm2vkbv1m.bkt.clouddn.com/upload/20190130/c8a0f719f09c4f14a53e88352da69a70.jpg', 'master-test', 'upload/20190130/c8a0f719f09c4f14a53e88352da69a70.jpg', '2019-01-30 15:30:20');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1087620602119876619 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'test', '65656', 2, '2019-01-07 18:28:33');
INSERT INTO `sys_role` VALUES (1087620602119876614, '65', '666', 1, '2019-01-28 15:14:46');
INSERT INTO `sys_role` VALUES (1087620602119876615, 'test', NULL, 0, '2019-02-14 13:40:42');
INSERT INTO `sys_role` VALUES (1087620602119876616, 'test', NULL, 0, '2019-02-14 13:42:36');
INSERT INTO `sys_role` VALUES (1087620602119876617, 'ctest', NULL, 0, '2019-02-14 13:46:11');
INSERT INTO `sys_role` VALUES (1087620602119876618, 'tests', NULL, 0, '2019-02-14 13:46:47');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1087620602212151323 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与部门对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (1087620602212151318, 1087620602119876614, 1);
INSERT INTO `sys_role_dept` VALUES (1087620602212151319, 1087620602119876614, 2);
INSERT INTO `sys_role_dept` VALUES (1087620602212151320, 1087620602119876614, 3);
INSERT INTO `sys_role_dept` VALUES (1087620602212151321, 1087620602119876614, 4);
INSERT INTO `sys_role_dept` VALUES (1087620602212151322, 1087620602119876614, 5);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1087609022518972740 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1087609022518972700, 1087620602119876614, 1);
INSERT INTO `sys_role_menu` VALUES (1087609022518972701, 1087620602119876614, 2);
INSERT INTO `sys_role_menu` VALUES (1087609022518972702, 1087620602119876614, 3);
INSERT INTO `sys_role_menu` VALUES (1087609022518972703, 1087620602119876614, 4);
INSERT INTO `sys_role_menu` VALUES (1087609022518972704, 1087620602119876614, 5);
INSERT INTO `sys_role_menu` VALUES (1087609022518972705, 1087620602119876614, 6);
INSERT INTO `sys_role_menu` VALUES (1087609022518972706, 1087620602119876614, 7);
INSERT INTO `sys_role_menu` VALUES (1087609022518972707, 1087620602119876614, 8);
INSERT INTO `sys_role_menu` VALUES (1087609022518972708, 1087620602119876614, 9);
INSERT INTO `sys_role_menu` VALUES (1087609022518972709, 1087620602119876614, 10);
INSERT INTO `sys_role_menu` VALUES (1087609022518972710, 1087620602119876614, 11);
INSERT INTO `sys_role_menu` VALUES (1087609022518972711, 1087620602119876614, 12);
INSERT INTO `sys_role_menu` VALUES (1087609022518972712, 1087620602119876614, 13);
INSERT INTO `sys_role_menu` VALUES (1087609022518972713, 1087620602119876614, 14);
INSERT INTO `sys_role_menu` VALUES (1087609022518972714, 1087620602119876614, 15);
INSERT INTO `sys_role_menu` VALUES (1087609022518972715, 1087620602119876614, 16);
INSERT INTO `sys_role_menu` VALUES (1087609022518972716, 1087620602119876614, 17);
INSERT INTO `sys_role_menu` VALUES (1087609022518972717, 1087620602119876614, 18);
INSERT INTO `sys_role_menu` VALUES (1087609022518972718, 1087620602119876614, 19);
INSERT INTO `sys_role_menu` VALUES (1087609022518972719, 1087620602119876614, 20);
INSERT INTO `sys_role_menu` VALUES (1087609022518972720, 1087620602119876614, 21);
INSERT INTO `sys_role_menu` VALUES (1087609022518972721, 1087620602119876614, 22);
INSERT INTO `sys_role_menu` VALUES (1087609022518972722, 1087620602119876614, 23);
INSERT INTO `sys_role_menu` VALUES (1087609022518972723, 1087620602119876614, 24);
INSERT INTO `sys_role_menu` VALUES (1087609022518972724, 1087620602119876614, 25);
INSERT INTO `sys_role_menu` VALUES (1087609022518972725, 1087620602119876614, 26);
INSERT INTO `sys_role_menu` VALUES (1087609022518972726, 1087620602119876614, 27);
INSERT INTO `sys_role_menu` VALUES (1087609022518972727, 1087620602119876614, 29);
INSERT INTO `sys_role_menu` VALUES (1087609022518972728, 1087620602119876614, 30);
INSERT INTO `sys_role_menu` VALUES (1087609022518972729, 1087620602119876614, 31);
INSERT INTO `sys_role_menu` VALUES (1087609022518972730, 1087620602119876614, 32);
INSERT INTO `sys_role_menu` VALUES (1087609022518972731, 1087620602119876614, 33);
INSERT INTO `sys_role_menu` VALUES (1087609022518972732, 1087620602119876614, 34);
INSERT INTO `sys_role_menu` VALUES (1087609022518972733, 1087620602119876614, 35);
INSERT INTO `sys_role_menu` VALUES (1087609022518972734, 1087620602119876614, 36);
INSERT INTO `sys_role_menu` VALUES (1087609022518972735, 1087620602119876614, 37);
INSERT INTO `sys_role_menu` VALUES (1087609022518972736, 1087620602119876614, 38);
INSERT INTO `sys_role_menu` VALUES (1087609022518972737, 1087620602119876614, 39);
INSERT INTO `sys_role_menu` VALUES (1087609022518972738, 1087620602119876614, 40);
INSERT INTO `sys_role_menu` VALUES (1087609022518972739, 1087620602119876614, 41);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'defaultAvatar.png' COMMENT '头像',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座右铭',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'master', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, 'ef561538-5fc3-498f-aaf3-a1977a659db5.jpeg', '今天也是充满希望的一天', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1087608018633302019 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1087608018633302018, 1087608018549415938, 1);

SET FOREIGN_KEY_CHECKS = 1;
