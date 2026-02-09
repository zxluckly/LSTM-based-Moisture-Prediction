-- ========================================
-- 修复土壤墒情系统详情页面404问题
-- ========================================

-- 1. 删除可能存在的旧配置
DELETE FROM sys_role_menu WHERE menu_id IN (2004, 2005, 2006, 2017, 2026, 2027);
DELETE FROM sys_menu WHERE menu_id IN (2004, 2005, 2006, 2017, 2026, 2027);

-- 2. 插入详情页面菜单（隐藏菜单，visible=1表示不在侧边栏显示）
-- 注意：path使用相对路径，不带参数；component指定组件路径
INSERT INTO `sys_menu` VALUES 
(2004, '土壤数据详情', 2001, 8, 'detail', 'soil/data/detail', '', 'SoilDataDetail', 1, 0, 'C', '1', '0', 'soil:data:detail', '#', 'admin', now(), '', NULL, '土壤数据详情页面'),
(2005, '预测结果详情', 2002, 8, 'detail', 'soil/prediction/detail', '', 'SoilPredictionDetail', 1, 0, 'C', '1', '0', 'soil:prediction:detail', '#', 'admin', now(), '', NULL, '预测结果详情页面'),
(2006, '预测趋势分析', 2002, 9, 'trend', 'soil/prediction/trend', '', 'SoilPredictionTrend', 1, 0, 'C', '1', '0', 'soil:prediction:trend', '#', 'admin', now(), '', NULL, '预测趋势分析页面');

-- 3. 插入按钮权限
INSERT INTO `sys_menu` VALUES 
(2017, '土壤数据详情', 2001, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:data:detail', '#', 'admin', now(), '', NULL, '土壤数据详情查看权限'),
(2026, '预测详情', 2002, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:detail', '#', 'admin', now(), '', NULL, '预测结果详情查看权限'),
(2027, '预测趋势', 2002, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'soil:prediction:trend', '#', 'admin', now(), '', NULL, '预测趋势分析权限');

-- 4. 给管理员角色分配权限
INSERT INTO `sys_role_menu` VALUES 
(1, 2004), (1, 2005), (1, 2006),
(1, 2017), (1, 2026), (1, 2027);

-- 5. 提交事务
COMMIT;

-- 6. 验证菜单是否插入成功
SELECT menu_id, menu_name, parent_id, path, component, visible, perms 
FROM sys_menu 
WHERE menu_id IN (2004, 2005, 2006, 2017, 2026, 2027)
ORDER BY menu_id;

-- 说明：
-- 执行此脚本后，需要：
-- 1. 重启后端服务（清除缓存）
-- 2. 重新登录前端（刷新菜单权限）
-- 3. 清除浏览器缓存或使用无痕模式测试
-- 
-- 路由说明：
-- - parent_id=2001的子菜单，完整路径会是 /soil/data/detail
-- - parent_id=2002的子菜单，完整路径会是 /soil/prediction/detail 和 /soil/prediction/trend
-- - visible=1 表示隐藏菜单，不在侧边栏显示，但路由仍然可用

