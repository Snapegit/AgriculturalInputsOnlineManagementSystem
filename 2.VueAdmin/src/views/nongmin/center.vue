
<template>
	<div>
		<div class="app-contain">
			<el-form class="userinfo_form" ref="userinfoFormRef" :model="form" label-width="$template2.back.add.form.base.labelWidth">
				<el-row>
					<el-col :span="12">
						<el-form-item label="农民账号" prop="nongminzhanghao">
							<el-input class="list_inp" v-model="user.nongminzhanghao" readonly placeholder="农民账号" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="农民姓名" prop="nongminxingming">
							<el-input class="list_inp" v-model="user.nongminxingming"  placeholder="农民姓名" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="家庭住址" prop="jiatingzhuzhi">
							<el-input class="list_inp" v-model="user.jiatingzhuzhi"  placeholder="家庭住址" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="联系方式" prop="lianxifangshi">
							<el-input class="list_inp" v-model="user.lianxifangshi"  placeholder="联系方式" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="地块名称" prop="dikuaimingcheng">
							<el-input class="list_inp" v-model="user.dikuaimingcheng"  placeholder="地块名称" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="地块类型" prop="dikuaileixing">
							<el-select 
								class="list_sel" 
								v-model="user.dikuaileixing" 
								placeholder="请选择地块类型"
								>
								<el-option v-for="item in nongmindikuaileixingLists" :label="item" :value="item"></el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="土地面积" prop="tudimianji">
							<el-input class="list_inp" v-model="user.tudimianji"  placeholder="土地面积" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="头像" prop="touxiang">
							<uploads
								action="file/upload" 
								tip="请上传头像" 
								:limit="3" 
								style="width: 100%;text-align: left;"
								:fileUrls="user.touxiang?user.touxiang:''" 
								@change="nongmintouxiangUploadSuccess">
							</uploads>
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
	const tableName = ref('nongmin')
	const user = ref({})
	const nongmindikuaileixingLists = ref([])
	const init = () => {
		nongmindikuaileixingLists.value = "大田,大棚,果园".split(',')
	}
	const nongmintouxiangUploadSuccess=(fileUrls)=> {
	    user.value.touxiang = fileUrls;
	}
	const onSubmit = () => {
		if(user.value.touxiang!=null){
			user.value.touxiang = user.value.touxiang.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if((user.value.money)&&(!context?.$toolUtil.isNumber(user.value.money))){
			context?.$toolUtil.message(`余额应输入数字`,'error')
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
			//下拉框样式
			.list_sel {
				border: 1px solid #7da06630;
				border-radius: 0 0 20px 20px;
				padding: 0 10px;
				background: #7da06610;
				width: auto;
				line-height: 36px;
				box-sizing: border-box;
				min-width: 250px;
				//去掉默认样式
				.select-trigger{
					height: 100%;
					.el-input{
						height: 100%;
						.el-input__wrapper{
							border: none;
							box-shadow: none;
							background: none;
							border-radius: 0;
							height: 100%;
						}
						.is-focus {
							box-shadow: none !important;
						}
					}
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
