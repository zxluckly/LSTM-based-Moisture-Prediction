import Layout from '@/layout'

const soilRouter = {
  path: '/soil',
  component: Layout,
  redirect: '/soil/data',
  name: 'Soil',
  meta: {
    title: '土壤墒情系统',
    icon: 'tree'
  },
  children: [
    {
      path: 'data',
      component: () => import('@/views/soil/data/index'),
      name: 'SoilData',
      meta: {
        title: '土壤数据管理',
        icon: 'form'
      }
    },
    {
      path: 'prediction',
      component: () => import('@/views/soil/prediction/index'),
      name: 'SoilPrediction',
      meta: {
        title: '预测管理',
        icon: 'chart'
      }
    },
    {
      path: 'dashboard',
      component: () => import('@/views/soil/dashboard/index'),
      name: 'SoilDashboard',
      meta: {
        title: '监控大屏',
        icon: 'monitor'
      }
    }
  ]
}

export default soilRouter