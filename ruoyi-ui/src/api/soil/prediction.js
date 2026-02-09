import request from '@/utils/request'

// 查询土壤墒情预测列表
export function listPrediction(query) {
  return request({
    url: '/soil/prediction/list',
    method: 'get',
    params: query
  })
}

// 查询土壤墒情预测详细
export function getPrediction(id) {
  return request({
    url: '/soil/prediction/' + id,
    method: 'get'
  })
}

// 新增土壤墒情预测
export function addPrediction(data) {
  return request({
    url: '/soil/prediction',
    method: 'post',
    data: data
  })
}

// 修改土壤墒情预测
export function updatePrediction(data) {
  return request({
    url: '/soil/prediction',
    method: 'put',
    data: data
  })
}

// 删除土壤墒情预测
export function delPrediction(id) {
  return request({
    url: '/soil/prediction/' + id,
    method: 'delete'
  })
}

// 执行LSTM预测
export function predict(fieldId, predictType) {
  return request({
    url: `/soil/prediction/predict/${fieldId}/${predictType}`,
    method: 'post'
  })
}

// 批量预测多个地块
export function batchPredict(data) {
  return request({
    url: '/soil/prediction/batch-predict',
    method: 'post',
    data: data
  })
}

// 获取预测准确度评估
export function getAccuracyEvaluation(fieldId, days = 30) {
  return request({
    url: `/soil/prediction/accuracy/${fieldId}`,
    method: 'get',
    params: { days }
  })
}

// 获取预测趋势分析
export function getPredictionTrend(fieldId) {
  return request({
    url: `/soil/prediction/trend/${fieldId}`,
    method: 'get'
  })
}

// 获取模型性能监控
export function getModelPerformance() {
  return request({
    url: '/soil/prediction/model/performance',
    method: 'get'
  })
}

// 执行自动预测任务
export function executeAutoPrediction() {
  return request({
    url: '/soil/prediction/auto-predict',
    method: 'post'
  })
}

// 获取预测类型说明
export function getPredictTypes() {
  return request({
    url: '/soil/prediction/predict-types',
    method: 'get'
  })
}