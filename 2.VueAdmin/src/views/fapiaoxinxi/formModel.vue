<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="50%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="发票号码" prop="fapiaohaoma">
							<el-input class="list_inp" v-model="form.fapiaohaoma" :readonly="true" placeholder="发票号码" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="开票日期" prop="kaipiaoriqi">
							<el-date-picker
								class="list_date"
								v-model="form.kaipiaoriqi"
								format="YYYY 年 MM 月 DD 日"
								value-format="YYYY-MM-DD"
								type="datetime"
								:readonly="!isAdd||disabledForm.kaipiaoriqi?true:false"
								placeholder="请选择开票日期" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="购买账号" prop="nongminzhanghao">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.nongminzhanghao?true:false"
								v-model="form.nongminzhanghao" 
								placeholder="请选择购买账号"
								@change="nongminzhanghaoChange">
								<el-option v-for="(item,index) in nongminzhanghaoLists" :label="item" :value="item">
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="开票名称" prop="nongminxingming">
							<el-input class="list_inp" v-model="form.nongminxingming" placeholder="开票名称"
								 type="text" 								:readonly="!isAdd||disabledForm.nongminxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="商品名称" prop="shangpinmingcheng">
							<el-input class="list_inp" v-model="form.shangpinmingcheng" placeholder="商品名称"
								 type="text" 								:readonly="!isAdd||disabledForm.shangpinmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="数量" prop="shuliang">
							<el-input class="list_inp" v-model.number="form.shuliang" placeholder="数量"
								 type="text" 								:readonly="!isAdd||disabledForm.shuliang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="含税单价" prop="hanshuidanjia">
							<el-input class="list_inp" v-model.number="form.hanshuidanjia" placeholder="含税单价"
								 type="number" 								:readonly="!isAdd||disabledForm.hanshuidanjia?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="税率" prop="shuilv">
							<el-input class="list_inp" v-model="form.shuilv" placeholder="税率"
								 type="text" 								:readonly="!isAdd||disabledForm.shuilv?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="开票金额" prop="kaipiaojine">
							<el-input class="list_inp" v-model="kaipiaojine" :readonly="true" placeholder="开票金额" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="企业账号" prop="qiyezhanghao">
							<el-input class="list_inp" v-model="form.qiyezhanghao" placeholder="企业账号"
								 type="text" 								:readonly="!isAdd||disabledForm.qiyezhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="开票企业名称" prop="kaipiaoqiyemingcheng">
							<el-input class="list_inp" v-model="form.kaipiaoqiyemingcheng" placeholder="开票企业名称"
								 type="text" 								:readonly="!isAdd||disabledForm.kaipiaoqiyemingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="备注" prop="beizhu">
							<el-input v-model="form.beizhu" placeholder="备注" type="textarea"
							:readonly="!isAdd||disabledForm.beizhu?true:false"
							/>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'fapiaoxinxi'
	const formName = '发票信息'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		fapiaohaoma : false,
		kaipiaoriqi : false,
		nongminzhanghao : false,
		nongminxingming : false,
		shangpinmingcheng : false,
		shuliang : false,
		hanshuidanjia : false,
		shuilv : false,
		kaipiaojine : false,
		qiyezhanghao : false,
		kaipiaoqiyemingcheng : false,
		beizhu : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
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
		fapiaohaoma: [
		],
		kaipiaoriqi: [
		],
		nongminzhanghao: [
		],
		nongminxingming: [
		],
		shangpinmingcheng: [
		],
		shuliang: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		hanshuidanjia: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		shuilv: [
		],
		kaipiaojine: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		qiyezhanghao: [
		],
		kaipiaoqiyemingcheng: [
		],
		beizhu: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//购买账号列表
	const nongminzhanghaoLists = ref([])
	const kaipiaojine =computed(()=>{
		let c = form.value
		let a = c.shuliang*c.hanshuidanjia
		form.value.kaipiaojine = a?a.toFixed(2) : 0
		return a?a.toFixed(2) : 0
	})
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			fapiaohaoma: getUUID(),
			kaipiaoriqi: '',
			nongminzhanghao: '',
			nongminxingming: '',
			shangpinmingcheng: '',
			shuliang: '',
			hanshuidanjia: '',
			shuilv: '',
			kaipiaojine: '',
			qiyezhanghao: '',
			kaipiaoqiyemingcheng: '',
			beizhu: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
			form.value.kaipiaoriqi = context?.$toolUtil.getCurDate()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='fapiaohaoma'){
					form.value.fapiaohaoma = row[x];
					disabledForm.value.fapiaohaoma = true;
					continue;
				}
				if(x=='kaipiaoriqi'){
					form.value.kaipiaoriqi = row[x];
					disabledForm.value.kaipiaoriqi = true;
					continue;
				}
				if(x=='nongminzhanghao'){
					form.value.nongminzhanghao = row[x];
					disabledForm.value.nongminzhanghao = true;
					continue;
				}
				if(x=='nongminxingming'){
					form.value.nongminxingming = row[x];
					disabledForm.value.nongminxingming = true;
					continue;
				}
				if(x=='shangpinmingcheng'){
					form.value.shangpinmingcheng = row[x];
					disabledForm.value.shangpinmingcheng = true;
					continue;
				}
				if(x=='shuliang'){
					form.value.shuliang = row[x];
					disabledForm.value.shuliang = true;
					continue;
				}
				if(x=='hanshuidanjia'){
					form.value.hanshuidanjia = row[x];
					disabledForm.value.hanshuidanjia = true;
					continue;
				}
				if(x=='shuilv'){
					form.value.shuilv = row[x];
					disabledForm.value.shuilv = true;
					continue;
				}
				if(x=='kaipiaojine'){
					form.value.kaipiaojine = row[x];
					disabledForm.value.kaipiaojine = true;
					continue;
				}
				if(x=='qiyezhanghao'){
					form.value.qiyezhanghao = row[x];
					disabledForm.value.qiyezhanghao = true;
					continue;
				}
				if(x=='kaipiaoqiyemingcheng'){
					form.value.kaipiaoqiyemingcheng = row[x];
					disabledForm.value.kaipiaoqiyemingcheng = true;
					continue;
				}
				if(x=='beizhu'){
					form.value.beizhu = row[x];
					disabledForm.value.beizhu = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('qiyezhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.qiyezhanghao = json.qiyezhanghao
				disabledForm.value.qiyezhanghao = true;
			}
			if(json.hasOwnProperty('qiyemingcheng')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.kaipiaoqiyemingcheng = json.qiyemingcheng
				disabledForm.value.kaipiaoqiyemingcheng = true;
			}
		})
		context?.$http({
			url: `option/nongmin/nongminzhanghao`,
			method: 'get'
		}).then(res=>{
			nongminzhanghaoLists.value = res.data.data
		})
		//由上级字段带出不可改
		disabledForm.value.nongminxingming = true;
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	const nongminzhanghaoChange=()=>{
		context?.$http({
			url: `follow/nongmin/nongminzhanghao?columnValue=` + form.value.nongminzhanghao,
			method: 'get'
		}).then(res=>{
			if(res.data.data.nongminxingming){
				form.value.nongminxingming = res.data.data.nongminxingming
			}
		})
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								emit('formModelChange')
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						emit('formModelChange')
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
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
			//label
			.el-form-item__label {
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: 150px;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
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
				//日期选择器
				.list_date {
					border: 1px solid #7da06630;
					border-radius: 0 0 20px 20px;
					background: #7da06610;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 250px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				// 下拉框
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
								padding: 0;
							}
							.is-focus {
								box-shadow: none !important;
							}
						}
					}
				}
				// 长文本
				.el-textarea__inner {
					border: 1px solid #7da06630;
					border-radius: 0 0 20px 20px;
					padding: 12px 24px;
					color: #333;
					background: #7da06610;
					width: auto;
					font-size: 14px;
					min-height: 120px;
					min-width: 400px;
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		padding: 10px 0 20px 150px;
		display: flex;
		width: 100%;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 0 0 20px 20px;
			padding: 0 20px;
			margin: 0 20px 0 0;
			color: #fff;
			background: #b0a59a;
			width: auto;
			font-size: 16px;
			min-width: 100px;
			height: 50px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
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
		.formModel_confirm:hover {
		}
	}
</style>