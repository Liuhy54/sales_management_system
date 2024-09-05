import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../starte/SignIn.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {//注册路由
      path: '/register',
      name: 'register',
      component: () => import('../starte/Register.vue')
    },
    {//主页路由
      path: '/saleChance',
      name: 'saleChance',
      component: () => import('../views/Wellcome.vue'),
      children: [
        {//销售机会管理路由
          path: '/saleChance',
          name: 'saleChance',
          component: () => import('../views/children/saleChance.vue')
        },
        {//客户信息管理路由
          path: '/customer',
          name: 'customer',
          component: () => import('../views/children/customer.vue')
        },
        {//管理客户联系人路由
          path: '/contact',
          name: 'contact',
          component: () => import('../views/children/contact.vue')
        },
        {
          path: '/ClientGrade',
          name: 'ClientGrade',
          component: () => import('../views/children/ClientGrade.vue')
        },
        {
          path: '/ClientArea',
          name: 'ClientArea',
          component: () => import('../views/children/ClientArea.vue')
        },
        {
          path: '/ClientIndustry',
          name: 'ClientIndustry',
          component: () => import('../views/children/ClientIndustry.vue')
        },
      ]
    },
    {
      path: '/',
      name: 'SignIn',
      component: HomeView,
    }
  ]
})

export default router
