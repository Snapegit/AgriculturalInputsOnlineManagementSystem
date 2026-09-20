import { createRouter, createWebHashHistory } from 'vue-router'
import index from '../views'
import home from '../views/pages/home.vue'
import login from '../views/pages/login.vue'
import nongminList from '@/views/pages/nongmin/list'
import nongminDetail from '@/views/pages/nongmin/formModel'
import nongminAdd from '@/views/pages/nongmin/formAdd'
import nongminRegister from '@/views/pages/nongmin/register'
import nongminCenter from '@/views/pages/nongmin/center'
import nongziqiyeList from '@/views/pages/nongziqiye/list'
import nongziqiyeDetail from '@/views/pages/nongziqiye/formModel'
import nongziqiyeAdd from '@/views/pages/nongziqiye/formAdd'
import fenleiList from '@/views/pages/fenlei/list'
import fenleiDetail from '@/views/pages/fenlei/formModel'
import fenleiAdd from '@/views/pages/fenlei/formAdd'
import shengzishangpinList from '@/views/pages/shengzishangpin/list'
import shengzishangpinDetail from '@/views/pages/shengzishangpin/formModel'
import shengzishangpinAdd from '@/views/pages/shengzishangpin/formAdd'
import nongyezixunList from '@/views/pages/nongyezixun/list'
import nongyezixunDetail from '@/views/pages/nongyezixun/formModel'
import nongyezixunAdd from '@/views/pages/nongyezixun/formAdd'
import storeupList from '@/views/pages/storeup/list'
import fapiaoxinxiList from '@/views/pages/fapiaoxinxi/list'
import fapiaoxinxiDetail from '@/views/pages/fapiaoxinxi/formModel'
import fapiaoxinxiAdd from '@/views/pages/fapiaoxinxi/formAdd'
import messagesList from '@/views/pages/messages/list'
import yonghufankuiList from '@/views/pages/yonghufankui/list'
import yonghufankuiDetail from '@/views/pages/yonghufankui/formModel'
import yonghufankuiAdd from '@/views/pages/yonghufankui/formAdd'
import cartList from '@/views/pages/shop_order/cart'
import addressList from '@/views/pages/shop_address/list'
import order_confirm from '@/views/pages/shop_order/confirm'
import ordersList from '@/views/pages/shop_order/list'

const routes = [{
		path: '/',
		redirect: '/index/home'
	},
	{
		path: '/index',
		component: index,
		children: [{
			path: 'home',
			component: home
		}
		, {
			path: 'nongminList',
			component: nongminList
		}, {
			path: 'nongminDetail',
			component: nongminDetail
		}, {
			path: 'nongminAdd',
			component: nongminAdd
		}
		, {
			path: 'nongminCenter',
			component: nongminCenter
		}
		, {
			path: 'nongziqiyeList',
			component: nongziqiyeList
		}, {
			path: 'nongziqiyeDetail',
			component: nongziqiyeDetail
		}, {
			path: 'nongziqiyeAdd',
			component: nongziqiyeAdd
		}
		, {
			path: 'fenleiList',
			component: fenleiList
		}, {
			path: 'fenleiDetail',
			component: fenleiDetail
		}, {
			path: 'fenleiAdd',
			component: fenleiAdd
		}
		, {
			path: 'shengzishangpinList',
			component: shengzishangpinList
		}, {
			path: 'shengzishangpinDetail',
			component: shengzishangpinDetail
		}, {
			path: 'shengzishangpinAdd',
			component: shengzishangpinAdd
		}
		, {
			path: 'nongyezixunList',
			component: nongyezixunList
		}, {
			path: 'nongyezixunDetail',
			component: nongyezixunDetail
		}, {
			path: 'nongyezixunAdd',
			component: nongyezixunAdd
		}
		, {
			path: 'storeupList',
			component: storeupList
		}
		, {
			path: 'fapiaoxinxiList',
			component: fapiaoxinxiList
		}, {
			path: 'fapiaoxinxiDetail',
			component: fapiaoxinxiDetail
		}, {
			path: 'fapiaoxinxiAdd',
			component: fapiaoxinxiAdd
		}
		, {
			path: 'messagesList',
			component: messagesList
		}
		, {
			path: 'yonghufankuiList',
			component: yonghufankuiList
		}, {
			path: 'yonghufankuiDetail',
			component: yonghufankuiDetail
		}, {
			path: 'yonghufankuiAdd',
			component: yonghufankuiAdd
		}
		, {
			path: 'cartList',
			component: cartList
		}
		, {
			path: 'addressList',
			component: addressList
		}
		, {
			path: 'order_confirm',
			component: order_confirm
		}
		, {
			path: 'ordersList',
			component: ordersList
		}
		]
	},
	{
		path: '/login',
		component: login
	}
	,{
		path: '/nongminRegister',
		component: nongminRegister
	}
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

export default router
