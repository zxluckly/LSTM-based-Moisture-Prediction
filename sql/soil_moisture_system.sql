-- 土壤墒情预测系统数据库表结构

-- 土壤数据表
DROP TABLE IF EXISTS `soil_data`;
CREATE TABLE `soil_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `device_id` varchar(50) NOT NULL COMMENT '设备编号',
  `field_id` varchar(50) NOT NULL COMMENT '地块编号',
  `temperature` decimal(5,2) DEFAULT NULL COMMENT '土壤温度(°C)',
  `humidity` decimal(5,2) DEFAULT NULL COMMENT '土壤湿度(%)',
  `ec_value` decimal(6,3) DEFAULT NULL COMMENT '电导率EC值(mS/cm)',
  `ph_value` decimal(4,2) DEFAULT NULL COMMENT '酸碱度pH值',
  `collect_time` datetime NOT NULL COMMENT '采集时间',
  `data_status` char(1) DEFAULT '0' COMMENT '数据状态(0正常 1异常)',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `altitude` decimal(8,2) DEFAULT NULL COMMENT '海拔高度(m)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_field_id` (`field_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_collect_time` (`collect_time`),
  KEY `idx_data_status` (`data_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='土壤数据表';

-- 土壤墒情预测表
DROP TABLE IF EXISTS `soil_prediction`;
CREATE TABLE `soil_prediction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `field_id` varchar(50) NOT NULL COMMENT '地块编号',
  `predict_time` datetime NOT NULL COMMENT '预测时间',
  `predicted_humidity` decimal(5,2) DEFAULT NULL COMMENT '预测湿度值(%)',
  `predicted_temperature` decimal(5,2) DEFAULT NULL COMMENT '预测温度值(°C)',
  `predicted_ec_value` decimal(6,3) DEFAULT NULL COMMENT '预测EC值(mS/cm)',
  `predicted_ph_value` decimal(4,2) DEFAULT NULL COMMENT '预测pH值',
  `accuracy` decimal(5,2) DEFAULT NULL COMMENT '预测准确度(%)',
  `model_version` varchar(50) DEFAULT NULL COMMENT '模型版本',
  `predict_type` char(1) DEFAULT '1' COMMENT '预测类型(1小时 2天 3周)',
  `rmse_error` decimal(8,4) DEFAULT NULL COMMENT 'RMSE误差',
  `mae_error` decimal(8,4) DEFAULT NULL COMMENT 'MAE误差',
  `confidence` decimal(5,2) DEFAULT NULL COMMENT '置信度(%)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_field_id` (`field_id`),
  KEY `idx_predict_time` (`predict_time`),
  KEY `idx_predict_type` (`predict_type`),
  KEY `idx_model_version` (`model_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='土壤墒情预测表';

-- 地块信息表
DROP TABLE IF EXISTS `soil_field`;
CREATE TABLE `soil_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `field_id` varchar(50) NOT NULL COMMENT '地块编号',
  `field_name` varchar(100) NOT NULL COMMENT '地块名称',
  `field_area` decimal(10,2) DEFAULT NULL COMMENT '地块面积(亩)',
  `crop_type` varchar(50) DEFAULT NULL COMMENT '作物类型',
  `soil_type` varchar(50) DEFAULT NULL COMMENT '土壤类型',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '中心经度',
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '中心纬度',
  `altitude` decimal(8,2) DEFAULT NULL COMMENT '海拔高度(m)',
  `owner_name` varchar(100) DEFAULT NULL COMMENT '负责人姓名',
  `owner_phone` varchar(20) DEFAULT NULL COMMENT '负责人电话',
  `description` text COMMENT '地块描述',
  `status` char(1) DEFAULT '0' COMMENT '状态(0正常 1停用)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_field_id` (`field_id`),
  KEY `idx_field_name` (`field_name`),
  KEY `idx_crop_type` (`crop_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地块信息表';

-- 设备信息表
DROP TABLE IF EXISTS `soil_device`;
CREATE TABLE `soil_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `device_id` varchar(50) NOT NULL COMMENT '设备编号',
  `device_name` varchar(100) NOT NULL COMMENT '设备名称',
  `device_type` varchar(50) DEFAULT NULL COMMENT '设备类型',
  `field_id` varchar(50) NOT NULL COMMENT '所属地块',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '设备经度',
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '设备纬度',
  `install_time` datetime DEFAULT NULL COMMENT '安装时间',
  `last_online_time` datetime DEFAULT NULL COMMENT '最后在线时间',
  `battery_level` int(3) DEFAULT NULL COMMENT '电池电量(%)',
  `signal_strength` int(3) DEFAULT NULL COMMENT '信号强度',
  `firmware_version` varchar(20) DEFAULT NULL COMMENT '固件版本',
  `status` char(1) DEFAULT '0' COMMENT '设备状态(0正常 1故障 2离线)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_device_id` (`device_id`),
  KEY `idx_field_id` (`field_id`),
  KEY `idx_device_type` (`device_type`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备信息表';

-- 预警规则表
DROP TABLE IF EXISTS `soil_alert_rule`;
CREATE TABLE `soil_alert_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rule_name` varchar(100) NOT NULL COMMENT '规则名称',
  `field_id` varchar(50) DEFAULT NULL COMMENT '地块编号(为空表示全局规则)',
  `parameter_type` varchar(20) NOT NULL COMMENT '参数类型(temperature/humidity/ec/ph)',
  `min_value` decimal(10,3) DEFAULT NULL COMMENT '最小值',
  `max_value` decimal(10,3) DEFAULT NULL COMMENT '最大值',
  `alert_level` char(1) DEFAULT '1' COMMENT '预警级别(1提醒 2警告 3严重)',
  `alert_message` varchar(500) DEFAULT NULL COMMENT '预警消息模板',
  `notification_method` varchar(50) DEFAULT 'system' COMMENT '通知方式(system/email/sms)',
  `status` char(1) DEFAULT '0' COMMENT '状态(0启用 1禁用)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_field_id` (`field_id`),
  KEY `idx_parameter_type` (`parameter_type`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='预警规则表';

-- 预警记录表
DROP TABLE IF EXISTS `soil_alert_record`;
CREATE TABLE `soil_alert_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rule_id` bigint(20) NOT NULL COMMENT '规则ID',
  `field_id` varchar(50) NOT NULL COMMENT '地块编号',
  `device_id` varchar(50) DEFAULT NULL COMMENT '设备编号',
  `parameter_type` varchar(20) NOT NULL COMMENT '参数类型',
  `current_value` decimal(10,3) DEFAULT NULL COMMENT '当前值',
  `threshold_value` decimal(10,3) DEFAULT NULL COMMENT '阈值',
  `alert_level` char(1) DEFAULT '1' COMMENT '预警级别',
  `alert_message` varchar(500) DEFAULT NULL COMMENT '预警消息',
  `alert_time` datetime NOT NULL COMMENT '预警时间',
  `handle_status` char(1) DEFAULT '0' COMMENT '处理状态(0未处理 1已处理 2已忽略)',
  `handle_user` varchar(50) DEFAULT NULL COMMENT '处理人',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `handle_remark` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_rule_id` (`rule_id`),
  KEY `idx_field_id` (`field_id`),
  KEY `idx_alert_time` (`alert_time`),
  KEY `idx_handle_status` (`handle_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='预警记录表';

-- 插入示例数据

-- 地块信息
INSERT INTO `soil_field` (`field_id`, `field_name`, `field_area`, `crop_type`, `soil_type`, `longitude`, `latitude`, `altitude`, `owner_name`, `owner_phone`, `description`) VALUES
('FIELD_001', '东区试验田A', 50.00, '小麦', '壤土', 116.397400, 39.909300, 50.00, '张三', '13800138001', '东区主要试验田，用于小麦种植试验'),
('FIELD_002', '西区试验田B', 75.50, '玉米', '砂壤土', 116.387400, 39.919300, 45.00, '李四', '13800138002', '西区试验田，主要种植玉米'),
('FIELD_003', '南区试验田C', 30.25, '大豆', '粘土', 116.407400, 39.899300, 55.00, '王五', '13800138003', '南区小面积试验田，用于大豆品种试验');

-- 设备信息
INSERT INTO `soil_device` (`device_id`, `device_name`, `device_type`, `field_id`, `longitude`, `latitude`, `install_time`, `battery_level`, `signal_strength`, `firmware_version`) VALUES
('DEVICE_001_001', '东区A田传感器1', '土壤多参数传感器', 'FIELD_001', 116.397400, 39.909300, '2024-01-01 10:00:00', 85, 90, 'v2.1.0'),
('DEVICE_002_001', '西区B田传感器1', '土壤多参数传感器', 'FIELD_002', 116.387400, 39.919300, '2024-01-01 10:30:00', 78, 85, 'v2.1.0'),
('DEVICE_003_001', '南区C田传感器1', '土壤多参数传感器', 'FIELD_003', 116.407400, 39.899300, '2024-01-01 11:00:00', 92, 88, 'v2.1.0');

-- 预警规则
INSERT INTO `soil_alert_rule` (`rule_name`, `field_id`, `parameter_type`, `min_value`, `max_value`, `alert_level`, `alert_message`, `notification_method`) VALUES
('土壤湿度过低预警', NULL, 'humidity', 30.000, NULL, '2', '土壤湿度过低({current_value}%)，建议及时灌溉', 'system'),
('土壤湿度过高预警', NULL, 'humidity', NULL, 80.000, '2', '土壤湿度过高({current_value}%)，注意排水防涝', 'system'),
('土壤温度异常预警', NULL, 'temperature', 5.000, 35.000, '1', '土壤温度异常({current_value}°C)，请关注作物生长状况', 'system'),
('土壤pH值异常预警', NULL, 'ph', 6.000, 8.000, '2', '土壤pH值异常({current_value})，建议调节土壤酸碱度', 'system'),
('土壤EC值过高预警', NULL, 'ec', NULL, 3.000, '2', '土壤盐分过高(EC:{current_value}mS/cm)，注意盐害防治', 'system');

-- 创建索引优化查询性能
CREATE INDEX idx_soil_data_field_time ON soil_data(field_id, collect_time);
CREATE INDEX idx_soil_prediction_field_time ON soil_prediction(field_id, predict_time);
CREATE INDEX idx_soil_data_status_time ON soil_data(data_status, collect_time);

-- 创建视图便于数据查询
CREATE VIEW v_latest_soil_data AS
SELECT 
    sd.*,
    sf.field_name,
    sf.crop_type,
    sf.soil_type,
    dev.device_name,
    dev.device_type
FROM soil_data sd
INNER JOIN (
    SELECT field_id, MAX(collect_time) as max_time
    FROM soil_data 
    WHERE data_status = '0'
    GROUP BY field_id
) latest ON sd.field_id = latest.field_id AND sd.collect_time = latest.max_time
LEFT JOIN soil_field sf ON sd.field_id = sf.field_id
LEFT JOIN soil_device dev ON sd.device_id = dev.device_id
WHERE sd.data_status = '0';

-- 创建存储过程用于数据清理
DELIMITER $$
CREATE PROCEDURE CleanOldData(IN days_to_keep INT)
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
END$$
DELIMITER ;

-- 创建定时任务清理数据（需要开启事件调度器）
-- SET GLOBAL event_scheduler = ON;
-- CREATE EVENT IF NOT EXISTS clean_old_data_event
-- ON SCHEDULE EVERY 1 DAY
-- STARTS CURRENT_TIMESTAMP
-- DO CALL CleanOldData(90); -- 保留90天数据

-- ========================================
-- 菜单权限配置
-- ========================================

-- 插入土壤墒情系统菜单
INSERT INTO `sys_menu` VALUES 
-- 主菜单：土壤墒情系统
(2000, '土壤墒情系统', 0, 5, 'soil', NULL, '', 'Soil', 1, 0, 'M', '0', '0', '', 'tree', 'admin', sysdate(), '', NULL, '土壤墒情预测系统'),

-- 子菜单：土壤数据管理
(2001, '土壤数据管理', 2000, 1, 'data', 'soil/data/index', '', 'SoilData', 1, 0, 'C', '0', '0', 'soil:data:list', 'form', 'admin', sysdate(), '', NULL, '土壤数据管理菜单'),

-- 子菜单：预测管理
(2002, '预测管理', 2000, 2, 'prediction', 'soil/prediction/index', '', 'SoilPrediction', 1, 0, 'C', '0', '0', 'soil:prediction:list', 'chart', 'admin', sysdate(), '', NULL, '土壤墒情预测管理菜单'),

-- 子菜单：监控大屏
(2003, '监控大屏', 2000, 3, 'dashboard', 'soil/dashboard/index', '', 'SoilDashboard', 1, 0, 'C', '0', '0', 'soil:dashboard:view', 'monitor', 'admin', sysdate(), '', NULL, '土壤墒情监控大屏'),

-- 土壤数据管理按钮权限
(2011, '土壤数据查询', 2001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:query', '#', 'admin', sysdate(), '', NULL, ''),
(2012, '土壤数据新增', 2001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:add', '#', 'admin', sysdate(), '', NULL, ''),
(2013, '土壤数据修改', 2001, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:edit', '#', 'admin', sysdate(), '', NULL, ''),
(2014, '土壤数据删除', 2001, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:remove', '#', 'admin', sysdate(), '', NULL, ''),
(2015, '土壤数据导出', 2001, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:export', '#', 'admin', sysdate(), '', NULL, ''),
(2016, '土壤数据导入', 2001, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:import', '#', 'admin', sysdate(), '', NULL, ''),

-- 预测管理按钮权限
(2021, '预测查询', 2002, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:query', '#', 'admin', sysdate(), '', NULL, ''),
(2022, '执行预测', 2002, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:predict', '#', 'admin', sysdate(), '', NULL, ''),
(2023, '预测修改', 2002, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:edit', '#', 'admin', sysdate(), '', NULL, ''),
(2024, '预测删除', 2002, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:remove', '#', 'admin', sysdate(), '', NULL, ''),
(2025, '预测导出', 2002, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:export', '#', 'admin', sysdate(), '', NULL, ''),

-- 监控大屏按钮权限
(2031, '大屏查看', 2003, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:dashboard:view', '#', 'admin', sysdate(), '', NULL, '');

-- 给管理员角色分配土壤墒情系统权限
INSERT INTO `sys_role_menu` VALUES 
(1, 2000), (1, 2001), (1, 2002), (1, 2003),
(1, 2011), (1, 2012), (1, 2013), (1, 2014), (1, 2015), (1, 2016),
(1, 2021), (1, 2022), (1, 2023), (1, 2024), (1, 2025),
(1, 2031);

-- 插入字典类型
INSERT INTO `sys_dict_type` VALUES 
(100, '土壤数据状态', 'soil_data_status', '0', 'admin', sysdate(), '', NULL, '土壤数据状态列表'),
(101, '土壤预测类型', 'soil_predict_type', '0', 'admin', sysdate(), '', NULL, '土壤墒情预测类型列表');

-- 插入字典数据
INSERT INTO `sys_dict_data` VALUES 
(100, 1, '正常', '0', 'soil_data_status', '', 'success', 'N', '0', 'admin', sysdate(), '', NULL, '正常状态'),
(101, 2, '异常', '1', 'soil_data_status', '', 'danger', 'N', '0', 'admin', sysdate(), '', NULL, '异常状态'),
(102, 1, '小时级预测', '1', 'soil_predict_type', '', 'success', 'N', '0', 'admin', sysdate(), '', NULL, '小时级预测'),
(103, 2, '天级预测', '2', 'soil_predict_type', '', 'warning', 'N', '0', 'admin', sysdate(), '', NULL, '天级预测'),
(104, 3, '周级预测', '3', 'soil_predict_type', '', 'info', 'N', '0', 'admin', sysdate(), '', NULL, '周级预测');