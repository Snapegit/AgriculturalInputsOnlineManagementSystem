<template>
	<div class="app-contain" :style='{"width":"1200px","padding":"0","margin":"0 auto 30px","position":"relative","borderRadius":"0","background":"none"}'>
		<div class="section_title">
			{{formName}}
		</div>
		<div class="usersView">
			<div class="usersTabView">
				<div class="usersTab" :class="tabIndex=='center'?'usersTabActive':''" @click="tabClick({tableName:'center'})">个人中心</div>
				<div class="usersTab " :class="tabIndex=='updatepassword'?'usersTabActive':''" @click="tabClick({tableName:'updatepassword'})">修改密码</div>
				<template v-for="(item,index) in menuList">
					<div v-if="item.child.length>1" class="usersTab" @mouseenter="usersTabHover(index)"
						 @mouseleave="usersTabLeave">
						{{item.menu}}
						<el-collapse-transition>
							<div class="usersTabHoverView" v-if="usersTabIndex==index">
								<div class="usersTabHoverTab" v-for="(items,indexs) in item.child" @click="tabClick(items)">
									{{items.menu}}</div>
							</div>
						</el-collapse-transition>
					</div>
					<div v-else class="usersTab" @click="tabClick(item.child[0])">
						{{item.child[0].menu}}
					</div>
				</template>
			</div>
			<div class="usersBox" v-if="tabIndex=='center'">
				<el-form class="usersForm" ref="userFormRef" :model="userForm" label-width="120px" :rules="rules">
					<el-row>
						<el-col :span="24">
							<el-form-item prop="qiyezhanghao" label="企业账号">
								<el-input class="list_inp" v-model="userForm.qiyezhanghao" placeholder="企业账号" readonly></el-input>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item prop="mima" label="密码">
								<el-input class="list_inp" v-model="userForm.mima" placeholder="密码" type="password"></el-input>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item prop="qiyemingcheng" label="企业名称">
								<el-input class="list_inp" v-model="userForm.qiyemingcheng" placeholder="企业名称" ></el-input>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item prop="qiyezhaopian" label="企业照片">
								<uploads
									action="file/upload" 
									tip="请上传企业照片" 
									:limit="1" 
									style="width: 100%;text-align: left;"
									:fileUrls="userForm.qiyezhaopian?userForm.qiyezhaopian:''" 
									@change="qiyezhaopianUploadSuccess">
								</uploads>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item prop="dizhi" label="地址">
								<el-input class="list_inp" v-model="userForm.dizhi" placeholder="地址" ></el-input>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item prop="zhizhaojingyingxukezheng" label="执照经营许可证">
								<uploads
									type="file"
									action="file/upload" 
									tip="请上传执照经营许可证" 
									:limit="1" 
									style="width: 100%;text-align: left;"
									:fileUrls="userForm.zhizhaojingyingxukezheng?userForm.zhizhaojingyingxukezheng:''" 
									@change="zhizhaojingyingxukezhengUploadSuccess">
								</uploads>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item prop="lianxifangshi" label="联系方式">
								<el-input class="list_inp" v-model="userForm.lianxifangshi" placeholder="联系方式" ></el-input>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item label="企业简介" prop="qiyejianjie">
								<editor :value="userForm.qiyejianjie" placeholder="请输入企业简介" :readonly="!isAdd"
									class="list_editor" @change="(e)=>editorChange(e,'qiyejianjie')"></editor>
							</el-form-item>
						</el-col>
					</el-row>
					<div class="formModel_btn_box">
						<el-button class="formModel_confirm" @click="updateSession">更新信息</el-button>
						<el-button class="formModel_cancel" @click="loginout" type="danger">退出登录</el-button>
					</div>
				</el-form>
			</div>
			<div class="usersBox" v-if="tabIndex=='updatepassword'">
				<el-form class="usersForm" ref="passwordFormRef" :model="passwordForm" label-width="120px"
					:rules="passwordRules">
					<el-row>
						<el-col :span="24">
							<el-form-item label="原密码" prop="mima">
								<el-input class="list_inp" v-model="passwordForm.mima" placeholder="原密码"
									type="password"></el-input>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item label="新密码" prop="newmima">
								<el-input class="list_inp" v-model="passwordForm.newmima" placeholder="新密码"
									type="password"></el-input>
							</el-form-item>
						</el-col>
						<el-col :span="24">
							<el-form-item label="确认密码" prop="newmima2">
								<el-input class="list_inp" v-model="passwordForm.newmima2" placeholder="确认密码"
									type="password"></el-input>
							</el-form-item>
						</el-col>
					</el-row>
					<div class="formModel_btn_box">
						<el-button class="formModel_confirm" @click="updatePassword">修改密码</el-button>
					</div>
				</el-form>
			</div>
		</div>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
	} from 'vue';
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	import menu from '@/utils/menu'
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'nongziqiye'
	const formName = '个人中心'
	//基础信息
	//个人信息
	const userFormRef = ref(null)
	const userForm = ref({})
	//修改密码
	const passwordFormRef = ref(null)
	const passwordForm = ref({
		mima: '',
		newmima: '',
		newmima2: ''
	})
	const passwordRules = ref({
		mima: [{
			required: true,
			message: '请输入',
			trigger: 'blur'
		}, ],
		newmima: [{
			required: true,
			message: '请输入',
			trigger: 'blur'
		}, ],
		newmima2: [{
			required: true,
			message: '请输入',
			trigger: 'blur'
		}, ],
	})
	//验证规则
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		qiyezhanghao: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		mima: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		qiyemingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		qiyezhaopian: [
		],
		dizhi: [
		],
		zhizhaojingyingxukezheng: [
		],
		lianxifangshi: [
			{ validator: validateMobile, trigger: 'blur' },
		],
		qiyejianjie: [
		],
		sfsh: [
		],
		shhf: [
		],
	})
	const getSession = () =>{
		context?.$http({
			url: `${context?.$toolUtil.storageGet('frontSessionTable')}/session`,
			method:'get'
		}).then(res=>{
			context?.$toolUtil.storageSet('userid',res.data.data.id)
			context?.$toolUtil.storageSet("frontName", res.data.data.qiyezhanghao)
			context?.$toolUtil.storageSet('headportrait',res.data.data.qiyezhaopian)
			userForm.value = res.data.data
		})
	}
	//菜单跳转
	const tabIndex = ref('center')
	const tabClick = (item) => {
		if (item.tableName == 'center') {
			tabIndex.value = 'center'
			return false
		}
		if (item.tableName == 'updatepassword') {
			passwordForm.value = {
				mima: '',
				newmima: '',
				newmima2: ''
			}
			tabIndex.value = 'updatepassword'
			return false
		}
		if(item.tableName=='examrecord'&&item.menuJump=='22'){
			router.push(`/index/examfailrecord?centerType=1`)
			return false
		}
		if(item.tableName=='forum'&&item.menuJump=='14'){
			router.push(`/index/forumList?centerType=1&&myType=1`)
			return false
		}
		switch (item.menu) {
			case '我的收藏':
				router.push(`/index/storeupList?centerType=1&&type=1`)
				break;
			default:
				router.push(`/index/${item.tableName}List?centerType=1`)
		}
	}
	// 修改密码
	const updatePassword = async ()=>{
		passwordFormRef.value.validate(async (valid) => {
			if (valid) {
				var nowpassword = ''
				await context?.$http({
					url:'encrypt/md5?text=' + passwordForm.value.mima,
					method: 'get'
				}).then(res=>{
					nowpassword = res.data.data
				})
				if(nowpassword != userForm.value.mima){
					context?.$toolUtil.message('原密码不正确', 'error')
					return false
				}
				if(passwordForm.value.newmima != passwordForm.value.newmima2){
					context?.$toolUtil.message('两次密码输入不正确', 'error')
					return false
				}
				userForm.value.mima = passwordForm.value.newmima
				context?.$http({
					url: `${tableName}/update`,
					method: 'post',
					data: userForm.value
				}).then(res => {
					context?.$toolUtil.message('更新成功', 'success', () => {
						passwordForm.value = {
							mima: '',
							newmima: '',
							newmima2: ''
						}
						getSession()
					})
				})
			}
		})
	}
	//菜单
	const menuList = ref([])
	const role = ref('')
	//企业照片上传回调
	const qiyezhaopianUploadSuccess=(e)=>{
		userForm.value.qiyezhaopian = e
	}
	//执照经营许可证上传回调
	const zhizhaojingyingxukezhengUploadSuccess=(e)=>{
		userForm.value.zhizhaojingyingxukezheng = e
	}
	//初始化
	const init = () => {
		const menus = menu.list()
		let arr = []
		if (menus) {
			menuList.value = menus
		}
		role.value = context?.$toolUtil.storageGet('frontRole')
		for (let i = 0; i < menuList.value.length; i++) {
			if (menuList.value[i].roleName == role.value) {
				arr = menuList.value[i].backMenu
				break;
			}
		}
		for(let x in arr){
			if(arr[x].child){
				if(arr[x].child[0].tableName == 'orders'){
					arr[x].child = [{
						...arr[x].child[0],
						menu:arr[x].menu
					}]
				}
			}
		}
		menuList.value = arr
		getSession()
	}
	//菜单悬浮的显示与隐藏
	const usersTabIndex = ref(-1)
	const usersTabHover = (index) => {
		usersTabIndex.value = index
	}
	const usersTabLeave = () => {
		usersTabIndex.value = -1
	}
	//富文本
	const editorChange = (e,name) =>{
		userForm.value[name] = e
	}
	//保存
	const updateSession = () => {
		userFormRef.value.validate((valid)=>{
			if(valid){
				if(userForm.value.qiyezhaopian!=null){
					userForm.value.qiyezhaopian = userForm.value.qiyezhaopian.replace(new RegExp(context?.$config.url,"g"),"");
				}
				if(userForm.value.zhizhaojingyingxukezheng!=null){
					userForm.value.zhizhaojingyingxukezheng = userForm.value.zhizhaojingyingxukezheng.replace(new RegExp(context?.$config.url,"g"),"");
				}
				context?.$http({
					url: `${tableName}/update`,
					method: 'post',
					data: userForm.value
				}).then(res=>{
					context?.$toolUtil.message('更新成功','success',()=>{
						getSession()
					})
				})
			}
		})
	}
	//退出登录
	const loginout = () => {
		context?.$toolUtil.message('退出成功', 'success')
		context?.$toolUtil.storageClear()
		router.replace('/index/home')
	}
	init()
</script>

<style lang="scss" scoped>
	.usersView {
		padding: 0;
		margin: 0px 0;
		overflow: hidden;
		background: none;
		display: flex;
		width: 100%;
		border-color: #eee;
		border-width: 0px;
		justify-content: space-between;
		align-items: flex-start;
		border-style: solid;
		flex-wrap: wrap;

		.usersTabView {
			padding: 20px 10px 0;
			margin: 0px 40px 0 0;
			background: #e4efe2;
			display: flex;
			width: 200px;
			border-color: #cfe4ba;
			border-width: 1px;
			justify-content: center;
			box-sizing: border-box;
			border-style: solid;
			flex-wrap: wrap;

			.usersTab {
				cursor: pointer;
				padding: 10px 5px;
				margin: 0 0px 10px 0;
				color: #666;
				display: inline-block;
				font-size: 14px;
				border-color: #27bacc30;
				float: left;
				transition: all 0.3s;
				border-radius: 0;
				background: url(http://clfile.zggen.cn/20240307/678968d767d2445cb0720394d5fb1cdf.png) no-repeat left center / 100% 100%;
				width: 100%;
				border-width: 0 0 0px;
				position: relative;
				border-style: solid;
				text-align: center;
				min-width: 80px;

				.usersTabHoverView {
					border: 1px solid rgb(136, 179, 1);
					padding: 10px 10px 0;
					z-index: 999;
					box-sizing: border-box;
					transition: all 0s;
					border-radius: 8px;
					box-shadow: 0 0px 0px rgba(0, 0, 0, .1);
					top: calc(100% + -40px);
					left: 100%;
					background: #fff;
					width: auto;
					position: absolute;
					min-width: 100%;
					.usersTabHoverTab {
						border: 0px solid #eee;
						border-radius: 4px;
						padding: 0px 0;
						margin: 0 0 10px;
						color: rgb(136, 179, 1);
						background: #fff;
						font-size: 14px;
						line-height: 36px;
						text-align: center;
					}
					.usersTabHoverTab:hover {
						border-radius: 0;
						color: #fff;
						background: rgb(136, 179, 1);
					}
				}
			}
			.usersTab:hover {
				padding: 10px 5px;
				color: #fff;
				background: url(http://clfile.zggen.cn/20240307/55c08714af994a4c8b39c464c455ddeb.png) no-repeat left center / 100% 100%;
				font-size: 14px;
				border-color: #27bacc;
				border-width: 0 0 0px;
				border-style: solid;
			}
			.usersTabActive {
				padding: 10px 5px;
				margin: 0 0px 10px 0;
				color: #fff;
				display: inline-block;
				font-size: 14px;
				border-color: #27bacc;
				float: left;
				border-radius: 0;
				background: url(http://clfile.zggen.cn/20240307/55c08714af994a4c8b39c464c455ddeb.png) no-repeat left center / 100% 100%;
				width: 100%;
				border-width: 0 0 0px;
				border-style: solid;
				text-align: center;
			}
		}

		.usersBox {
			border: 1px solid rgba(136, 179, 1,.2);
			border-radius: 0px;
			padding: 40px 0;
			margin: 0px;
			background: url(http://clfile.zggen.cn/20240307/f6af397e09384c93ab2775253322f8be.jpg) no-repeat center bottom / 100% auto,#f3f8f4;
			flex: 1;
			width: calc(100% - 240px);
			box-sizing: border-box;
			float: right;
			.usersForm {
				border: 0px dotted rgba(136, 179, 1,.5);
				border-radius: 4px;
				padding: 20px 20px;
				background: none;
				width: 100%;
				// form item
				:deep(.el-form-item) {
					border: 0px solid #eee;
					border-radius: 4px;
					padding: 0px 0;
					margin: 0 2% 20px 0;
					background: none;
					display: flex;
					width: 90%;
					flex-wrap: wrap;
					//label
					.el-form-item__label {
						background: none;
						display: block;
						width: auto;
						min-width: 200px;
						text-align: right;
					}
					// 内容盒子
					.el-form-item__content {
						display: flex;
						width: calc(100% - 200px);
						justify-content: flex-start;
						align-items: center;
						flex-wrap: wrap;
						// 输入框
						.list_inp {
							padding: 0 10px;
							background: #fff;
							width: auto;
							border-color: #ddd;
							border-width: 1px;
							line-height: 36px;
							box-sizing: border-box;
							border-style: solid;
							min-width: 100%;
							height: 36px;
							//去掉默认样式
							.el-input__wrapper{
								border: none;
								box-shadow: none;
								background: none;
								border-radius: 0;
								height: 100%;
								padding: 0;
							}
							.is-focus {
								box-shadow: none !important;
							}
						}
						// 富文本
						.list_editor {
							border-radius: 0;
							padding: 0;
							margin: 0;
							background: #fff;
							width: 100%;
							min-height: 250px;
							border-color: #ddd;
							border-width: 1px;
							border-style: solid;
							height: auto;
						}
						//图片上传样式
						.el-upload-list  {
							//提示语
							.el-upload__tip {
								margin: 7px 0 0;
								color: #999;
								display: flex;
								font-size: 14px;
								justify-content: flex-start;
								align-items: center;
							}
							//外部盒子
							.el-upload--picture-card {
								border: 1px solid #ddd;
								cursor: pointer;
								border-radius: 0px;
								background: #fff;
								display: flex;
								width: 150px;
								line-height: 90px;
								justify-content: center;
								align-items: center;
								text-align: center;
								height: 80px;
								//图标
								.el-icon{
									color: #999;
									font-size: 24px;
								}
							}
							.el-upload-list__item {
								border: 1px solid #ddd;
								cursor: pointer;
								border-radius: 0px;
								background: #fff;
								display: flex;
								width: 150px;
								line-height: 90px;
								justify-content: center;
								align-items: center;
								text-align: center;
								height: 80px;
							}
						}
						//文件上传样式
						.upload-demo {
							width: 100%;
							//外部盒子
							.el-upload-dragger {
								border: 1px solid #ddd;
								cursor: pointer;
								border-radius: 0px;
								padding: 6px 0;
								margin: 0;
								overflow: hidden;
								background: #fff;
								width: 360px;
								box-sizing: border-box;
								text-align: center;
								height: auto;
							}
							//图标
							.el-icon--upload {
								padding: 0;
								margin: 0;
								color: rgba(136, 179, 1,.8);
								font-size: 48px;
								line-height: auto;
							}
							//提示文字
							.el-upload__text {
								padding: 0;
								margin: 0;
								color: #999;
								font-size: 14px;
								em {
									color: rgba(136, 179, 1,.8);
								}
							}
							//提示文字
							.el-upload__tip {
								padding: 0;
								margin: 0;
								color: #999;
								font-size: 14px;
							}
						}
					}
				}
			}
		}
		// 按钮盒子
		.formModel_btn_box {
				padding: 0 0 0 200px;
				display: flex;
				width: 100%;
				justify-content: flex-start;
				align-items: center;
			.formModel_cancel {
				border: 0px solid #ddd;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 30px;
				margin: 0 10px 0 0;
				color: #fff;
				background: rgba(136, 179, 1,.8);
				width: auto;
				font-size: 14px;
				height: 40px;
			}
			.formModel_cancel:hover {
				opacity: 0.8;
			}
		
			.formModel_confirm {
				border: 0;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 30px;
				margin: 0 20px 0 0;
				color: #fff;
				background: rgba(255, 153, 0,1);
				width: auto;
				font-size: 14px;
				height: 40px;
			}
			.formModel_confirm:hover {
				opacity: 0.8;
			}
		}
	}
</style>