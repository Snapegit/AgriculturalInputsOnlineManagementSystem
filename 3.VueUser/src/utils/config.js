const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
			menuList:[
				{
					name: '农资企业',
					icon: 'icon-common1',
					child:[
						{
							name:'农资企业',
							url:'/index/nongziqiyeList'
						},
					]
				},
				{
					name: '生资商品',
					icon: 'icon-common44',
					child:[
						{
							name:'生资商品',
							url:'/index/shengzishangpinList'
						},
					]
				},
				{
					name: '生态农业资讯',
					icon: 'icon-chat--fill2',
					child:[
						{
							name:'农业资讯',
							url:'/index/nongyezixunList'
						},
					]
				},
				{
					name: '留言板管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'留言板',
							url:'/index/messagesList'
						},
					]
				},
				{
					name: '购物车管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'购物车',
							url:'/index/cartList'
						},
					]
				},
			]
        }
    },
    getProjectName(){
        return {
            projectName: "农场投入品运营线上管理系统"
        } 
    }
}
export default config
