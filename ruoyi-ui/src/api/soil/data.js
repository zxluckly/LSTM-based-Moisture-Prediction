import request from '@/utils/request'

// 查询土壤数据列表
export function listData(query) {
  return request({
    url: '/soil/data/list',
    method: 'get',
    params: query
  })
}

// 查询土壤数据详细
export function getData(id) {
  return request({
    url: '/soil/data/' + id,
    method: 'get'
  })
}

// 新增土壤数据
export function addData(data) {
  return request({
    url: '/soil/data',
    method: 'post',
    data: data
  })
}

// 修改土壤数据
export function updateData(data) {
  return request({
    url: '/soil/data',
    method: 'put',
    data: data
  })
}

// 删除土壤数据
export function delData(id) {
  return request({
    url: '/soil/data/' + id,
    method: 'delete'
  })
}

// 获取历史数据用于LSTM训练
export function getHistoryData(fieldId, days) {
  return request({
    url: `/soil/data/history/${fieldId}/${days}`,
    method: 'get'
  })
}

// 生成模拟数据
export function generateSimulatedData(fieldId, count) {
  return request({
    url: `/soil/data/simulate/${fieldId}/${count}`,
    method: 'post'
  })
}

// 获取实时数据统计
export function getRealTimeStats() {
  return request({
    url: '/soil/data/stats/realtime',
    method: 'get'
  })
}

// 获取数据质量报告
export function getDataQualityReport(fieldId) {
  return request({
    url: `/soil/data/quality/${fieldId}`,
    method: 'get'
  })
}

// 数据预处理
export function preprocessData(data) {
  return request({
    url: '/soil/data/preprocess',
    method: 'post',
    data: data
  })
}

// 数据归一化
export function normalizeData(data) {
  return request({
    url: '/soil/data/normalize',
    method: 'post',
    data: data
  })
}

// 批量导入土壤数据
export function importSoilData(data) {
  return request({
    url: '/soil/data/import',
    method: 'post',
    data: data
  })
}