import request from '@/utils/request'

// 获取监控大屏总览数据
export function getOverview() {
  return request({
    url: '/soil/dashboard/overview',
    method: 'get'
  })
}

// 获取地块实时数据
export function getRealtimeData(fieldId) {
  return request({
    url: `/soil/dashboard/realtime/${fieldId}`,
    method: 'get'
  })
}

// 获取历史趋势数据
export function getTrendData(fieldId, days = 7) {
  return request({
    url: `/soil/dashboard/trend/${fieldId}`,
    method: 'get',
    params: { days }
  })
}

// 获取多地块对比数据
export function getCompareData(fieldIds) {
  return request({
    url: '/soil/dashboard/compare',
    method: 'get',
    params: { fieldIds: fieldIds.join(',') }
  })
}

// 获取预警信息
export function getAlerts() {
  return request({
    url: '/soil/dashboard/alerts',
    method: 'get'
  })
}

// 获取地图数据
export function getMapData() {
  return request({
    url: '/soil/dashboard/map',
    method: 'get'
  })
}

// 获取统计报表数据
export function getStatistics(days = 30) {
  return request({
    url: '/soil/dashboard/statistics',
    method: 'get',
    params: { days }
  })
}