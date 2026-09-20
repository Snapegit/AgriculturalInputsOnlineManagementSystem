<template>
	<div>
		<div class="register_view">
			<div class="outTitle_view">
				<div class="outTilte">{{projectName}}注册</div>
			</div>
			<el-form :model="registerForm" class="register_form">
				<div class="list_item">
					<div class="list_label">企业账号：</div>
					<input class="list_inp"
					 v-model="registerForm.qiyezhanghao" 
					 placeholder="请输入企业账号"
					 type="text"
					 />
				</div>
				<div class="list_item">
					<div class="list_label">密码：</div>
					<input class="list_inp"
					 v-model="registerForm.mima" 
					 placeholder="请输入密码"
					 type="password"
					 />
				</div>
				<div class="list_item">
					<div class="list_label">确认密码：</div>
					<input class="list_inp" v-model="registerForm.mima2" type="password" placeholder="请输入确认密码" />
				</div>
				<div class="list_item">
					<div class="list_label">企业名称：</div>
					<input class="list_inp"
					 v-model="registerForm.qiyemingcheng" 
					 placeholder="请输入企业名称"
					 type="text"
					 />
				</div>
				<div class="list_item">
					<div class="list_label">企业照片：</div>
					<div class="list_file_list">
						<uploads
							action="file/upload" 
							tip="请上传企业照片" 
							:limit="3" 
							style="width: 100%;text-align: left;"
							:fileUrls="registerForm.qiyezhaopian?registerForm.qiyezhaopian:''" 
							@change="qiyezhaopianUploadSuccess">
						</uploads>
					</div>
				</div>
				<div class="list_item">
					<div class="list_label">地址：</div>
					<input class="list_inp"
					 v-model="registerForm.dizhi" 
					 placeholder="请输入地址"
					 type="text"
					 />
				</div>
				<div class="list_item">
					<div class="list_label">执照经营许可证：</div>
					<div class="list_file_list">
						<uploads
							type="file"
							action="file/upload" 
							tip="请上传执照经营许可证" 
							:limit="3" 
							style="width: 100%;text-align: left;"
							:fileUrls="registerForm.zhizhaojingyingxukezheng?registerForm.zhizhaojingyingxukezheng:''" 
							@change="zhizhaojingyingxukezhengUploadSuccess">
						</uploads>
					</div>
				</div>
				<div class="list_item">
					<div class="list_label">联系方式：</div>
					<input class="list_inp"
					 v-model="registerForm.lianxifangshi" 
					 placeholder="请输入联系方式"
					 type="text"
					 />
				</div>
				<div class="list_btn">
					<el-button class="register" type="success" @click="handleRegister">注册</el-button>
					<div class="r-login" @click="close">已有账号，直接登录</div>
				</div>
			</el-form>	
		</div>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const projectName = context?.$project.projectName
	//获取注册类型
	import { useRoute } from 'vue-router';
	const route = useRoute()
	const tableName = ref('nongziqiye')
	
	//公共方法
	const getUUID=()=> {
		return new Date().getTime();
	}
	
	const registerForm = ref({
         sfsh: '待审核',
	})
	const init=()=>{
	}
    const qiyezhaopianUploadSuccess=(fileUrls)=> {
        registerForm.value.qiyezhaopian = fileUrls;
    }
    const zhizhaojingyingxukezhengUploadSuccess=(fileUrls)=> {
        registerForm.value.zhizhaojingyingxukezheng = fileUrls;
    }
	// 多级联动参数
	//注册按钮
	const handleRegister = () => {
		let url = tableName.value +"/register";
		if((!registerForm.value.qiyezhanghao)){
			context?.$toolUtil.message(`企业账号不能为空`,'error')
			return false
		}
		if((!registerForm.value.mima)){
			context?.$toolUtil.message(`密码不能为空`,'error')
			return false
		}
		if(registerForm.value.mima!=registerForm.value.mima2){
			context?.$toolUtil.message('两次密码输入不一致','error')
			return false
		}
		if((!registerForm.value.qiyemingcheng)){
			context?.$toolUtil.message(`企业名称不能为空`,'error')
			return false
		}
		if(registerForm.value.qiyezhaopian!=null){
			registerForm.value.qiyezhaopian = registerForm.value.qiyezhaopian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if(registerForm.value.zhizhaojingyingxukezheng!=null){
			registerForm.value.zhizhaojingyingxukezheng = registerForm.value.zhizhaojingyingxukezheng.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if(registerForm.value.lianxifangshi&&(!context?.$toolUtil.isMobile(registerForm.value.lianxifangshi))){
			context?.$toolUtil.message(`联系方式应输入手机格式`,'error')
			return false
		}
		
		context?.$http({
			url:url,
			method:'post',
			data:registerForm.value
		}).then(res=>{
			context?.$toolUtil.message('注册成功','success', obj=>{
				context?.$router.push({
					path: "/login"
				});
			})
		})
	}
	//返回登录
	const close = () => {
		context?.$router.push({
			path: "/login"
		});
	}
	init()
</script>
<style lang="scss" scoped>
	.register_view {
		background-repeat: no-repeat;
		flex-direction: column;
		background: url(http://clfile.zggen.cn/20240308/a8520d5033dc429e8145452e67cde820.jpg);
		display: flex;
		font-size: 100% 100%;
		min-height: 100vh;
		justify-content: center;
		align-items: center;
		position: relative;
		background-position: center center;
		// 标题盒子
		.outTitle_view {
			border-radius: 20px 50px 0 0;
			padding: 0px;
			margin: 20px 0 0;
			background: #dcebd9;
			display: flex;
			width: 680px;
			border-color: #b4d2ae;
			border-width: 4px 4px 0;
			justify-content: center;
			align-items: center;
			border-style: groove;
			height: 80px;
			.outTilte {
				border: 0px solid #fff;
				border-radius: 0px;
				padding: 10px 20px;
				color: #0b4201;
				font-size: 22px;
			}
		}
		// 表单盒子
		.register_form {
			border-radius: 0 0 20px 50px;
			padding: 0px 80px 30px 40px;
			margin: 0;
			background: url(http://clfile.zggen.cn/20240308/a7d7abd221a84886a0858c7d5a546867.jpg) no-repeat center bottom / 100% auto,#dcebd9;
			display: block;
			width: 680px;
			border-color: #b4d2ae;
			border-width: 0 4px 4px;
			justify-content: center;
			border-style: groove;
			flex-wrap: wrap;
		}
		// item盒子
		.list_item {
			margin: 0 0 12px;
			display: flex;
			width: 100%;
			justify-content: flex-start;
			align-items: center;
			// label
			.list_label {
				color: #333;
				width: 120px;
				font-size: 14px;
				box-sizing: border-box;
				text-align: right;
			}
			// 输入框
			:deep(.list_inp) {
				border: 1px solid #ddd;
				border-radius: 4px;
				padding: 0 10px;
				width: calc(100% - 100px);
				line-height: 36px;
				box-sizing: border-box;
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
		}
		//图片上传样式
		.list_file_list  {
			//提示语
			:deep(.el-upload__tip){
				margin: 7px 0 0;
				color: #999;
				display: flex;
				font-size: 14px;
				justify-content: flex-start;
				align-items: center;
			}
			//外部盒子
			:deep(.el-upload--picture-card){
				border: 1px solid #ddd;
				cursor: pointer;
				background-color: #fff;
				border-radius: 4px;
				width: 160px;
				line-height: 70px;
				text-align: center;
				height: 60px;
				//图标
				.el-icon{
					color: #bbb;
					font-size: 32px;
				}
			}
			:deep(.el-upload-list__item) {
				border: 1px solid #ddd;
				cursor: pointer;
				background-color: #fff;
				border-radius: 4px;
				width: 160px;
				line-height: 70px;
				text-align: center;
				height: 60px;
			}
		}
		//文件上传样式
		:deep(.upload-demo) {
			width: 100%;
			//外部盒子
			.el-upload-dragger {
				border: 1px solid #ddd;
				cursor: pointer;
				padding: 10px 0 20px;
				margin: 0 0 4px;
				display: flex;
				box-sizing: border-box;
				flex-wrap: wrap;
				background-color: #fff;
				border-radius: 4px;
				overflow: hidden;
				width: 360px;
				align-items: center;
				text-align: center;
				height: auto;
			}
			//图标
			.el-icon--upload {
				margin: 0;
				color: rgba(255, 153, 0,1);
				width: 100%;
				font-size: 36px;
				line-height: 32px;
				text-align: center;
			}
			//提示文字
			.el-upload__text {
				margin: 0px 0 0;
				color: #999;
				width: 100%;
				font-size: 14px;
			}
			//提示文字
			.el-upload__tip {
				margin: 0px 0 0;
				color: #999;
				width: 100%;
				font-size: 14px;
				em {
					color: rgba(255, 153, 0,1);
				}
			}
		}
		//按钮盒子
		.list_btn {
			margin: 20px 0 0;
			display: flex;
			width: 100%;
			justify-content: center;
			align-items: center;
			flex-wrap: wrap;
			//注册按钮
			.register {
					border: none;
					border-radius: 4px;
					margin: 0 20px;
					color: #fff;
					background: rgba(255, 153, 0,1);
					width: 120px;
					font-size: 16px;
					height: 40px;
			}
			//注册按钮悬浮样式
			.register:hover {
				border: none;
				border-radius: 4px;
				margin: 0 20px;
				background: rgba(255, 153, 0,1);
				width: 120px;
				font-size: 16px;
				opacity: 1;
				height: 40px;
			}
			//已有账号
			.r-login {
				cursor: pointer;
				padding: 01;
				color: #666;
				width: auto;
				font-size: 14px;
				text-align: right;
			}
		}
	}
</style>