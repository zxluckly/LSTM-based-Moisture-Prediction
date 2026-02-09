-- ========================================
-- 土壤墒情预测系统 - 菜单权限初始化脚本
-- ========================================

-- 删除已存在的土壤墒情系统菜单（如果需要重新初始化）
-- DELETE FROM sys_role_menu WHERE menu_id >= 2000 AND menu_id < 2100;
-- DELETE FROM sys_menu WHERE menu_id >= 2000 AND menu_id < 2100;

-- 插入土壤墒情系统菜单
INSERT INTO `sys_menu` VALUES 
-- 主菜单：土壤墒情系统
(2000, '土壤墒情系统', 0, 5, 'soil', NULL, '', 'Soil', 1, 0, 'M', '0', '0', '', 'tree', 'admin', now(), '', NULL, '土壤墒情预测系统'),

-- 子菜单：土壤数据管理
(2001, '土壤数据管理', 2000, 1, 'data', 'soil/data/index', '', 'SoilData', 1, 0, 'C', '0', '0', 'soil:data:list', 'form', 'admin', now(), '', NULL, '土壤数据管理菜单'),

-- 子菜单：预测管理
(2002, '预测管理', 2000, 2, 'prediction', 'soil/prediction/index', '', 'SoilPrediction', 1, 0, 'C', '0', '0', 'soil:prediction:list', 'chart', 'admin', now(), '', NULL, '土壤墒情预测管理菜单'),

-- 子菜单：监控大屏
(2003, '监控大屏', 2000, 3, 'dashboard', 'soil/dashboard/index', '', 'SoilDashboard', 1, 0, 'C', '0', '0', 'soil:dashboard:view', 'monitor', 'admin', now(), '', NULL, '土壤墒情监控大屏'),

-- 隐藏的详情页面（不在侧边栏显示，但需要路由）
(2004, '土壤数据详情', 2001, 8, 'detail', 'soil/data/detail', '', 'SoilDataDetail', 1, 0, 'C', '1', '0', 'soil:data:detail', '#', 'admin', now(), '', NULL, '土壤数据详情页面'),
(2005, '预测结果详情', 2002, 8, 'detail', 'soil/prediction/detail', '', 'SoilPredictionDetail', 1, 0, 'C', '1', '0', 'soil:prediction:detail', '#', 'admin', now(), '', NULL, '预测结果详情页面'),
(2006, '预测趋势分析', 2002, 9, 'trend', 'soil/prediction/trend', '', 'SoilPredictionTrend', 1, 0, 'C', '1', '0', 'soil:prediction:trend', '#', 'admin', now(), '', NULL, '预测趋势分析页面'),

-- 土壤数据管理按钮权限
(2011, '土壤数据查询', 2001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:query', '#', 'admin', now(), '', NULL, ''),
(2012, '土壤数据新增', 2001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:add', '#', 'admin', now(), '', NULL, ''),
(2013, '土壤数据修改', 2001, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:edit', '#', 'admin', now(), '', NULL, ''),
(2014, '土壤数据删除', 2001, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:remove', '#', 'admin', now(), '', NULL, ''),
(2015, '土壤数据导出', 2001, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:export', '#', 'admin', now(), '', NULL, ''),
(2016, '土壤数据导入', 2001, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:import', '#', 'admin', now(), '', NULL, ''),
(2017, '土壤数据详情', 2001, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:detail', '#', 'admin', now(), '', NULL, '土壤数据详情查看权限'),

-- 预测管理按钮权限
(2021, '预测查询', 2002, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:query', '#', 'admin', now(), '', NULL, ''),
(2022, '执行预测', 2002, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:predict', '#', 'admin', now(), '', NULL, ''),
(2023, '预测修改', 2002, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:edit', '#', 'admin', now(), '', NULL, ''),
(2024, '预测删除', 2002, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:remove', '#', 'admin', now(), '', NULL, ''),
(2025, '预测导出', 2002, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:export', '#', 'admin', now(), '', NULL, ''),
(2026, '预测详情', 2002, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:detail', '#', 'admin', now(), '', NULL, '预测结果详情查看权限'),
(2027, '预测趋势', 2002, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:trend', '#', 'admin', now(), '', NULL, '预测趋势分析权限'),

-- 监控大屏按钮权限
(2031, '大屏查看', 2003, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:dashboard:view', '#', 'admin', now(), '', NULL, '');

-- 给管理员角色分配土壤墒情系统权限
INSERT INTO `sys_role_menu` VALUES 
(1, 2000), (1, 2001), (1, 2002), (1, 2003), (1, 2004), (1, 2005), (1, 2006),
(1, 2011), (1, 2012), (1, 2013), (1, 2014), (1, 2015), (1, 2016), (1, 2017),
(1, 2021), (1, 2022), (1, 2023), (1, 2024), (1, 2025), (1, 2026), (1, 2027),
(1, 2031);

-- 插入字典类型
INSERT INTO `sys_dict_type` VALUES 
(100, '土壤数据状态', 'soil_data_status', '0', 'admin', now(), '', NULL, '土壤数据状态列表'),
(101, '土壤预测类型', 'soil_predict_type', '0', 'admin', now(), '', NULL, '土壤墒情预测类型列表');

-- 插入字典数据
INSERT INTO `sys_dict_data` VALUES 
(100, 1, '正常', '0', 'soil_data_status', '', 'success', 'N', '0', 'admin', now(), '', NULL, '正常状态'),
(101, 2, '异常', '1', 'soil_data_status', '', 'danger', 'N', '0', 'admin', now(), '', NULL, '异常状态'),
(102, 1, '小时级预测', '1', 'soil_predict_type', '', 'success', 'N', '0', 'admin', now(), '', NULL, '小时级预测'),
(103, 2, '天级预测', '2', 'soil_predict_type', '', 'warning', 'N', '0', 'admin', now(), '', NULL, '天级预测'),
(104, 3, '周级预测', '3', 'soil_predict_type', '', 'info', 'N', '0', 'admin', now(), '', NULL, '周级预测');

-- 提交事务
COMMIT;

-- 查询验证菜单是否插入成功
SELECT menu_id, menu_name, parent_id, path, component, perms 
FROM sys_menu 
WHERE menu_id >= 2000 AND menu_id < 2100 
ORDER BY menu_id;