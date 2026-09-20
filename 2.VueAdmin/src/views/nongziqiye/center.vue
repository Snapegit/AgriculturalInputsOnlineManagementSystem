
<template>
	<div>
		<div class="app-contain">
			<el-form class="userinfo_form" ref="userinfoFormRef" :model="form" label-width="$template2.back.add.form.base.labelWidth">
				<el-row>
					<el-col :span="12">
						<el-form-item label="企业账号" prop="qiyezhanghao">
							<el-input class="list_inp" v-model="user.qiyezhanghao" readonly placeholder="企业账号" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="企业名称" prop="qiyemingcheng">
							<el-input class="list_inp" v-model="user.qiyemingcheng"  placeholder="企业名称" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="企业照片" prop="qiyezhaopian">
							<uploads
								action="file/upload" 
								tip="请上传企业照片" 
								:limit="3" 
								style="width: 100%;text-align: left;"
								:fileUrls="user.qiyezhaopian?user.qiyezhaopian:''" 
								@change="nongziqiyeqiyezhaopianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="地址" prop="dizhi">
							<el-input class="list_inp" v-model="user.dizhi"  placeholder="地址" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="执照经营许可证" prop="zhizhaojingyingxukezheng">
							<uploads
								type="file"
								action="file/upload" 
								tip="请上传执照经营许可证" 
								:limit="3" 
								style="width: 100%;text-align: left;"
								:fileUrls="user.zhizhaojingyingxukezheng?user.zhizhaojingyingxukezheng:''" 
								@change="nongziqiyezhizhaojingyingxukezhengUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="联系方式" prop="lianxifangshi">
							<el-input class="list_inp" v-model="user.lianxifangshi"  placeholder="联系方式" clearable />
						</el-form-item>
					</el-col>
					<span class="userinfo_form_btn_box">
						<el-button class='userinfo_confirm' type="primary" @click="onSubmit">保存</el-button>
					</span>
				</el-row>
			</el-form>
		</div>
	</div>
</template>

<script setup>
	import { isNumber,isIntNumer,isEmail,isMobile,isPhone,isURL,checkIdCard } from "@/utils/toolUtil";
	import {
		reactive,
		ref,
		getCurrentInstance
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const tableName = ref('nongziqiye')
	const user = ref({})
	const init = () => {
	}
	const nongziqiyeqiyezhaopianUploadSuccess=(fileUrls)=> {
	    user.value.qiyezhaopian = fileUrls;
	}
	const nongziqiyezhizhaojingyingxukezhengUploadSuccess=(fileUrls)=> {
	    user.value.zhizhaojingyingxukezheng = fileUrls;
	}
	const onSubmit = () => {
		if((!user.value.qiyezhanghao)){
			context?.$toolUtil.message(`企业账号不能为空`,'error')
			return false
		}
		if((!user.value.mima)){
			context?.$toolUtil.message(`密码不能为空`,'error')
			return false
		}
		if((!user.value.qiyemingcheng)){
			context?.$toolUtil.message(`企业名称不能为空`,'error')
			return false
		}
		if(user.value.qiyezhaopian!=null){
			user.value.qiyezhaopian = user.value.qiyezhaopian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if(user.value.zhizhaojingyingxukezheng!=null){
			user.value.zhizhaojingyingxukezheng = user.value.zhizhaojingyingxukezheng.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if((user.value.lianxifangshi)&&(!context?.$toolUtil.isMobile(user.value.lianxifangshi))){
			context?.$toolUtil.message(`联系方式应输入手机格式`,'error')
			return false
		}
		context?.$http({
			url: `${tableName.value}/update`,
			method: 'post',
			data: user.value
		}).then(res => {
			context?.$toolUtil.message('修改成功','success')
		})

	}
	const getInfo = () => {
		context?.$http({
			url: `${tableName.value}/session`,
			method: 'get'
		}).then(res => {
			user.value = res.data.data
			init()
		})
	}
	getInfo()
</script>

<style lang="scss" scoped>
	// 表单
	.userinfo_form {
		border: 0px solid #ddd;
		border-radius: 4px;
		padding: 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 150px 20px 0;
			background: none;
			display: flex;
			// 内容盒子
			.el-form-item__content{
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
			}
			// 输入框
			.list_inp {
				border: 1px solid #7da06630;
				border-radius: 0 0 20px 20px;
				padding: 0 10px;
				background: #7da06610;
				width: auto;
				line-height: 36px;
				box-sizing: border-box;
				min-width: 250px;
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
					border: 1px solid #7da06630;
					cursor: pointer;
					background-color: #7da06610;
					border-radius: 0 0 20px 20px;
					width: 120px;
					line-height: 70px;
					text-align: center;
					height: 60px;
					//图标
					.el-icon{
						color: #999;
						font-size: 26px;
					}
				}
				.el-upload-list__item {
					border: 1px solid #7da06630;
					cursor: pointer;
					background-color: #7da06610;
					border-radius: 0 0 20px 20px;
					width: 120px;
					line-height: 70px;
					text-align: center;
					height: 60px;
				}
			}
			//文件上传样式
			.upload-demo {
				width: 100%;
				//外部盒子
				.el-upload-dragger {
					border: 1px solid #7da06630;
					cursor: pointer;
					background-color: #7da06610;
					border-radius: 0 0 20px 20px;
					overflow: hidden;
					width: 360px;
					box-sizing: border-box;
					text-align: center;
					height: auto;
				}
				//图标
				.el-icon--upload {
					margin: 0;
					color: #7da066;
					font-size: 48px;
					line-height: 48px;
				}
				//提示文字
				.el-upload__text {
					margin: 0px 0 0;
					color: #999;
					font-size: 14px;
				}
				//提示文字
				.el-upload__tip {
					margin: 0px 0 0;
					color: #999;
					font-size: 14px;
				}
				em {
					color: #7da066;
				}
			}

		}
		// 按钮盒子
		.userinfo_form_btn_box {
			padding: 10px 0 20px 150px;
			display: flex;
			width: 100%;
			align-items: center;
			// 确定按钮
			.userinfo_confirm {
				border: 0;
				cursor: pointer;
				border-radius: 0 0 20px 20px;
				padding: 0 20px;
				margin: 0 20px 0 0;
				color: #fff;
				background: #7ca065;
				width: auto;
				font-size: 16px;
				min-width: 100px;
				height: 50px;
			}
			// 确定按钮-悬浮
			.userinfo_confirm:hover {
			}
		}
	}
</style>
