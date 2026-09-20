	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import address from '@/views/address/list'
	import nongziqiye from '@/views/nongziqiye/list'
	import discussshengzishangpin from '@/views/discussshengzishangpin/list'
	import yonghufankui from '@/views/yonghufankui/list'
	import storeup from '@/views/storeup/list'
	import nongmin from '@/views/nongmin/list'
	import nongyezixun from '@/views/nongyezixun/list'
	import users from '@/views/users/list'
	import fenlei from '@/views/fenlei/list'
	import shengzishangpin from '@/views/shengzishangpin/list'
	import discussnongziqiye from '@/views/discussnongziqiye/list'
	import messages from '@/views/messages/list'
	import orders from '@/views/orders/list'
	import config from '@/views/config/list'
	import discussnongyezixun from '@/views/discussnongyezixun/list'
	import fapiaoxinxi from '@/views/fapiaoxinxi/list'
	import nongziqiyeRegister from '@/views/nongziqiye/register'
	import nongziqiyeCenter from '@/views/nongziqiye/center'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/nongziqiyeCenter',
			name: '农资企业个人中心',
			component: nongziqiyeCenter
		}
		,{
			path: '/address',
			name: '地址',
			component: address
		}
		,{
			path: '/nongziqiye',
			name: '农资企业',
			component: nongziqiye
		}
		,{
			path: '/discussshengzishangpin',
			name: '生资商品评论评论',
			component: discussshengzishangpin
		}
		,{
			path: '/yonghufankui',
			name: '用户反馈',
			component: yonghufankui
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/nongmin',
			name: '农民',
			component: nongmin
		}
		,{
			path: '/nongyezixun',
			name: '农业资讯',
			component: nongyezixun
		}
		,{
			path: '/users',
			name: '管理员',
			component: users
		}
		,{
			path: '/fenlei',
			name: '分类',
			component: fenlei
		}
		,{
			path: '/shengzishangpin',
			name: '生资商品',
			component: shengzishangpin
		}
		,{
			path: '/discussnongziqiye',
			name: '农资企业评论评论',
			component: discussnongziqiye
		}
		,{
			path: '/messages',
			name: '留言板',
			component: messages
		}
		,{
			path: '/orders',
			name: '订单管理',
			component: orders
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/discussnongyezixun',
			name: '农业资讯评论评论',
			component: discussnongyezixun
		}
		,{
			path: '/fapiaoxinxi',
			name: '发票信息',
			component: fapiaoxinxi
		}
		]
	},
	{
		path: '/nongziqiyeRegister',
		name: '农资企业注册',
		component: nongziqiyeRegister
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
