<template>
	<div>
		<div class="home_box">
			<!-- 农业资讯首页展示 -->
			<div class="homeList_view">
				<div class="homeList_title">农业资讯展示</div>
				<div class="home_list_five">
					<div v-for="(item,index) in nongyezixunHomeList" :class="'home_list_five_item' + (Number(index) + 1)" @click="detailClick('nongyezixun',item.id)">
						<div class="img_box">
							<img class="home_img" v-if="isHttp(item.tupian)" :src="item.tupian.split(',')[0]" alt="">
							<img class="home_img" v-else :src="item.tupian?$config.url + item.tupian.split(',')[0]:''" alt="">
						</div>
						<div class="homeList_content">
							<div class="homeList_title1">
								{{item.wenzhangbiaoti}}
							</div>
						</div>
					</div>
				</div>
				<div class="homeList_more_view" @click="moreClick('nongyezixun')">
					<span class="homeList_more_text">更多</span>
					<el-icon><DArrowRight /></el-icon>
				</div>
			</div>
		</div>
	</div>
</template>

<script setup>
	import {
		ref,
		getCurrentInstance
	} from 'vue';
	import {
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const router = useRouter()
	//农业资讯首页展示
	const nongyezixunHomeList = ref([])
	const getnongyezixunHomeList = () => {
		context?.$http({
			url: 'nongyezixun/list',
			method: 'get',
			params: {
				page: 1,
				limit: 8
			}
		}).then(res => {
			nongyezixunHomeList.value = res.data.data.list
		})
	}
	//判断图片链接是否带http
	const isHttp = (str) => {
        return str && str.substr(0,4)=='http';
    }
	//跳转详情
	const detailClick = (table,id) => {
		router.push(`/index/${table}Detail?id=${id}`)
	}
	const moreClick = (table) => {
		router.push(`/index/${table}List`)
	}
	const init = () => {
		//农业资讯首页展示
		getnongyezixunHomeList()
	}
	init()
</script>

<style lang="scss">
	.home_box {
		border-radius: 4px;
		padding: 0px;
		margin: 0 auto;
		background: none;
		display: flex;
		width: 100%;
		justify-content: space-between;
		align-items: flex-start;
		flex-wrap: wrap;
	}
	
	// 推荐
	.recomList_view {
		padding: 40px calc((100% - 1200px)/2) 60px;
		margin: 0px auto 0;
		background: #dcebd9;
		width: 100%;
		position: relative;
		order: 4;
		.recomList_title {
			padding: 0 0 0 16px;
			margin: 0;
			color: #0b4201;
			background: url(http://clfile.zggen.cn/20240307/688965e5e4274598a1f89356f36a74c5.png) repeat-x center bottom;
			font-weight: 600;
			width: 100%;
			font-size: 20px;
			border-color: #666;
			border-width: 0 0 0px;
			line-height: 58px;
			border-style: solid;
			text-align: left;
		}
		// list
		.recommend_list_two {
			padding: 0 20px;
			margin: 30px 0 0;
			display: flex;
			width: 100%;
			flex-wrap: wrap;
			.recommend_item {
				cursor: pointer;
				margin: 0;
				background: none;
				width: 100%;
				.recommend_img_box {
					margin: 0 0 6px;
					width: 100%;
					height: 200px;
					.recommend_img {
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.recommend_content {
					.recommend_title {
						overflow: hidden;
						color: #333;
						white-space: nowrap;
						background: none;
						font-weight: 500;
						width: 100%;
						font-size: 14px;
						line-height: 24px;
						text-overflow: ellipsis;
						text-align: left;
					}
					.recommend_price {
						color: #c00;
						font-weight: 500;
						width: 100%;
						font-size: 14px;
						line-height: 1;
						text-align: right;
					}
				}
			}
		}
		// list
		// animation
		.animation_box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		.animation_box img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box img:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		// animation
		// 更多
		.recommend_more_view {
			cursor: pointer;
			border: 0px solid #ddd;
			padding: 0;
			margin: 0;
			color: #333;
			line-height: 38px;
			right: calc((100% - 1200px)/2 + 20px);
			border-radius: 0px;
			top: 50px;
			background: none;
			width: 89px;
			position: absolute;
			text-align: right;
			height: 38px;
			.recommend_more_text {
				color: #5d8e00;
			}
			.el-icon {
				color: #5d8e00;
			}
		}
	}
	// 推荐
	// 新闻资讯
	.newsList_view {
		padding: 30px calc((100% - 1200px)/2)  60px;
		margin: 0 auto;
		background: url(http://clfile.zggen.cn/20240307/f79ce980ee44465ca4520e24c7409517.jpg) repeat-x center bottom,#fff;
		width: calc(100% - 0px);
		position: relative;
		order: 3;
		height: auto;

		.newsList_title {
			padding: 0 0 0 16px;
			margin: 0 auto 20px;
			color: #0b4201;
			background: url(http://clfile.zggen.cn/20240307/688965e5e4274598a1f89356f36a74c5.png) repeat-x center bottom;
			font-weight: 600;
			width: 100%;
			font-size: 20px;
			border-color: #666;
			border-width:  0 0 0px;
			line-height: 58px;
			border-style: solid;
			text-align: left;
		}
		// list
		.news_list_one {
			padding: 0px 20px 20px;
			margin: 30px 0 0;
			background: none;
			display: block;
			width: 100%;
			min-height: 280px;
			justify-content: space-between;
			align-items: flex-start;
			flex-wrap: wrap;
			.news_item {
				cursor: pointer;
				padding: 0 0 10px;
				margin: 0 20px 20px 0;
				background: none;
				display: inline-block;
				width: calc(50% - 20px);
				border-color: #0c420130;
				border-width: 0 0 1px;
				align-items: center;
				border-style: dashed;
				.news_img_box {
					display: none;
					width: 100px;
					height: 100px;
					.news_img {
						border: 6px solid #ebe9dd;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.news_content {
					margin: 0 0 0 0px;
					display: flex;
					width: calc(100% - 80px);
					flex-wrap: wrap;
					.news_title {
						padding: 0 0 0 15px;
						margin: 0 0 0px;
						overflow: hidden;
						color: #0c4201;
						white-space: nowrap;
						background: url(http://clfile.zggen.cn/20240307/e7b9c71aa3ca4d1f9f684dcefdc162cc.jpg) no-repeat left center;
						font-weight: 500;
						width: 100%;
						font-size: 14px;
						text-overflow: ellipsis;
						text-align: left;
						order: 2;
					}
					.news_text {
						padding: 0 10px 0 0;
						overflow: hidden;
						display: none;
						font-size: 14px;
						line-height: 24px;
						height: 48px;
						order: 3;
					}
					.news_time {
						color: #333;
						font-weight: 600;
						display: none;
						width: 100%;
						text-align: left;
					}
				}
			}
		}
		// list
		// animation
		.animation_box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(10px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		.animation_box img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box img:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		// animation
		// 更多
		.news_more_view {
			cursor: pointer;
			border: 0px solid #ddd;
			padding: 0px 0;
			margin: 0;
			color: #5d8e00;
			line-height: 38px;
			right: calc((100% - 1200px)/2 + 20px);
			border-radius: 0px;
			top: 50px;
			background: none;
			width: 89px;
			position: absolute;
			text-align: right;
			height: 38px;
			.news_more_text {
				color: #5d8e00;
			}
			.el-icon {
				color: #5d8e00;
			}
		}
	}
	// 新闻资讯
	// 首页展示
	.homeList_view {
		padding: 40px calc((100% - 1200px)/2) 40px;
		margin: 0;
		background: url(http://clfile.zggen.cn/20240307/6cf649beff894b22b30184400b101e56.jpg) no-repeat center / 100% 100%;
		width: 100%;
		position: relative;
		order: 2;

		.homeList_title {
			padding: 0 0 0 16px;
			margin: 0 0 30px;
			color: #cbe5a3;
			background: url(http://clfile.zggen.cn/20240307/2cee4e17a9854b38adcdde80fa68f3d6.jpg) repeat-x center bottom;
			font-weight: 600;
			width: 100%;
			font-size: 20px;
			border-color: #666;
			border-width: 0 0 0px;
			line-height: 48px;
			border-style: solid;
			text-align: left;
		}
		// list
		.home_list_five {
			display: flex;
			width: 100%;
			align-items: flex-start;
			flex-wrap: wrap;
			.home_list_five_item1 {
				padding: 10px;
				margin: 0 5px 10px;
				background: url(http://clfile.zggen.cn/20240307/e7496c7bc009426f98bf1f82414c7995.jpg) no-repeat center top / 100% 100%;
				width: calc(25% - 10px);
				.img_box {
					object-fit: cover;
					width: 100%;
					height: 200px;
					.home_img {
						box-shadow: 0px 16px 16px -16px #000;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.homeList_content {
					padding: 10px;
					background: none;
					display: flex;
					flex-wrap: wrap;
					.homeList_title1 {
						width: 100%;
						text-align: center;
					}
					.homeList_title2 {
						width: 100%;
						text-align: center;
					}
					.homeList_title3 {
						width: 100%;
						text-align: center;
					}
					.homeList_title4 {
						width: 100%;
						text-align: center;
					}
					.homeList_title5 {
						width: 100%;
						text-align: center;
					}
				}
			}
			.home_list_five_item1:hover {
				cursor: pointer;
				transition: all 0s;
				.img_box {
					.home_img {
					}
				}
				.homeList_content {
					width: 100%;
					height: 100%;
					.homeList_title1 {
						color: #fff;
					}
					.homeList_title2 {
						color: #fff;
					}
					.homeList_title3 {
						color: #fff;
					}
					.homeList_title4 {
						color: #fff;
					}
					.homeList_title5 {
						color: #fff;
					}
				}
			}
			.home_list_five_item2 {
				padding: 10px;
				margin: 0 5px 10px;
				background: url(http://clfile.zggen.cn/20240307/e7496c7bc009426f98bf1f82414c7995.jpg) no-repeat center top / 100% 100%;
				width: calc(25% - 10px);
				.img_box {
					object-fit: cover;
					width: 100%;
					height: 200px;
					.home_img {
						box-shadow: 0px 16px 16px -16px #000;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.homeList_content {
					padding: 10px;
					background: none;
					display: flex;
					flex-wrap: wrap;
					.homeList_title1 {
						width: 100%;
						text-align: center;
					}
					.homeList_title2 {
						width: 100%;
						text-align: center;
					}
					.homeList_title3 {
						width: 100%;
						text-align: center;
					}
					.homeList_title4 {
						width: 100%;
						text-align: center;
					}
					.homeList_title5 {
						width: 100%;
						text-align: center;
					}
				}
			}
			.home_list_five_item2:hover {
				cursor: pointer;
				transition: all 0s;
				.img_box {
					.home_img {
					}
				}
				.homeList_content {
					width: 100%;
					height: 100%;
					.homeList_title1 {
						color: #fff;
					}
					.homeList_title2 {
						color: #fff;
					}
					.homeList_title3 {
						color: #fff;
					}
					.homeList_title4 {
						color: #fff;
					}
					.homeList_title5 {
						color: #fff;
					}
				}
			}
			.home_list_five_item3 {
				padding: 10px;
				margin: 0 5px 10px;
				background: url(http://clfile.zggen.cn/20240307/e7496c7bc009426f98bf1f82414c7995.jpg) no-repeat center top / 100% 100%;
				width: calc(25% - 10px);
				.img_box {
					object-fit: cover;
					width: 100%;
					height: 200px;
					.home_img {
						box-shadow: 0px 16px 16px -16px #000;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.homeList_content {
					padding: 10px;
					background: none;
					display: flex;
					flex-wrap: wrap;
					.homeList_title1 {
						width: 100%;
						text-align: center;
					}
					.homeList_title2 {
						width: 100%;
						text-align: center;
					}
					.homeList_title3 {
						width: 100%;
						text-align: center;
					}
					.homeList_title4 {
						width: 100%;
						text-align: center;
					}
					.homeList_title5 {
						width: 100%;
						text-align: center;
					}
				}
			}
			.home_list_five_item3:hover {
				cursor: pointer;
				transition: all 0s;
				.img_box {
					.home_img {
					}
				}
				.homeList_content {
					width: 100%;
					height: 100%;
					.homeList_title1 {
						color: #fff;
					}
					.homeList_title2 {
						color: #fff;
					}
					.homeList_title3 {
						color: #fff;
					}
					.homeList_title4 {
						color: #fff;
					}
					.homeList_title5 {
						color: #fff;
					}
				}
			}
			.home_list_five_item4 {
				padding: 10px;
				margin: 0 5px 10px;
				background: url(http://clfile.zggen.cn/20240307/e7496c7bc009426f98bf1f82414c7995.jpg) no-repeat center top / 100% 100%;
				width: calc(25% - 10px);
				.img_box {
					object-fit: cover;
					width: 100%;
					height: 200px;
					.home_img {
						box-shadow: 0px 16px 16px -16px #000;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.homeList_content {
					padding: 10px;
					background: none;
					display: flex;
					flex-wrap: wrap;
					.homeList_title1 {
						width: 100%;
						text-align: center;
					}
					.homeList_title2 {
						width: 100%;
						text-align: center;
					}
					.homeList_title3 {
						width: 100%;
						text-align: center;
					}
					.homeList_title4 {
						width: 100%;
						text-align: center;
					}
					.homeList_title5 {
						width: 100%;
						text-align: center;
					}
				}
			}
			.home_list_five_item4:hover {
				cursor: pointer;
				transition: all 0s;
				.img_box {
					.home_img {
					}
				}
				.homeList_content {
					width: 100%;
					height: 100%;
					.homeList_title1 {
						color: #fff;
					}
					.homeList_title2 {
						color: #fff;
					}
					.homeList_title3 {
						color: #fff;
					}
					.homeList_title4 {
						color: #fff;
					}
					.homeList_title5 {
						color: #fff;
					}
				}
			}
			.home_list_five_item5 {
				padding: 10px;
				margin: 0 5px 10px;
				background: url(http://clfile.zggen.cn/20240307/e7496c7bc009426f98bf1f82414c7995.jpg) no-repeat center top / 100% 100%;
				width: calc(25% - 10px);
				.img_box {
					object-fit: cover;
					width: 100%;
					height: 200px;
					.home_img {
						box-shadow: 0px 16px 16px -16px #000;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.homeList_content {
					padding: 10px;
					background: none;
					display: flex;
					flex-wrap: wrap;
					.homeList_title1 {
						width: 100%;
						text-align: center;
					}
					.homeList_title2 {
						width: 100%;
						text-align: center;
					}
					.homeList_title3 {
						width: 100%;
						text-align: center;
					}
					.homeList_title4 {
						width: 100%;
						text-align: center;
					}
					.homeList_title5 {
						width: 100%;
						text-align: center;
					}
				}
			}
			.home_list_five_item5:hover {
				cursor: pointer;
				transition: all 0s;
				.img_box {
					.home_img {
					}
				}
				.homeList_content {
					width: 100%;
					height: 100%;
					.homeList_title1 {
						color: #fff;
					}
					.homeList_title2 {
						color: #fff;
					}
					.homeList_title3 {
						color: #fff;
					}
					.homeList_title4 {
						color: #fff;
					}
					.homeList_title5 {
						color: #fff;
					}
				}
			}
			.home_list_five_item6 {
				padding: 10px;
				margin: 0 5px 10px;
				background: url(http://clfile.zggen.cn/20240307/e7496c7bc009426f98bf1f82414c7995.jpg) no-repeat center top / 100% 100%;
				width: calc(25% - 10px);
				.img_box {
					object-fit: cover;
					width: 100%;
					height: 200px;
					.home_img {
						box-shadow: 0px 16px 16px -16px #000;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.homeList_content {
					padding: 10px;
					background: none;
					display: flex;
					flex-wrap: wrap;
					.homeList_title1 {
						width: 100%;
						text-align: center;
					}
					.homeList_title2 {
						width: 100%;
						text-align: center;
					}
					.homeList_title3 {
						width: 100%;
						text-align: center;
					}
					.homeList_title4 {
						width: 100%;
						text-align: center;
					}
					.homeList_title5 {
						width: 100%;
						text-align: center;
					}
				}
			}
			.home_list_five_item6:hover {
				cursor: pointer;
				transition: all 0s;
				.img_box {
					.home_img {
					}
				}
				.homeList_content {
					width: 100%;
					height: 100%;
					.homeList_title1 {
						color: #fff;
					}
					.homeList_title2 {
						color: #fff;
					}
					.homeList_title3 {
						color: #fff;
					}
					.homeList_title4 {
						color: #fff;
					}
					.homeList_title5 {
						color: #fff;
					}
				}
			}
			.home_list_five_item7 {
				padding: 10px;
				margin: 0 5px 10px;
				background: url(http://clfile.zggen.cn/20240307/e7496c7bc009426f98bf1f82414c7995.jpg) no-repeat center top / 100% 100%;
				width: calc(25% - 10px);
				.img_box {
					object-fit: cover;
					width: 100%;
					height: 200px;
					.home_img {
						box-shadow: 0px 16px 16px -16px #000;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.homeList_content {
					padding: 10px;
					background: none;
					display: flex;
					flex-wrap: wrap;
					.homeList_title1 {
						width: 100%;
						text-align: center;
					}
					.homeList_title2 {
						width: 100%;
						text-align: center;
					}
					.homeList_title3 {
						width: 100%;
						text-align: center;
					}
					.homeList_title4 {
						width: 100%;
						text-align: center;
					}
					.homeList_title5 {
						width: 100%;
						text-align: center;
					}
				}
			}
			.home_list_five_item7:hover {
				cursor: pointer;
				transition: all 0s;
				.img_box {
					.home_img {
					}
				}
				.homeList_content {
					width: 100%;
					height: 100%;
					.homeList_title1 {
						color: #fff;
					}
					.homeList_title2 {
						color: #fff;
					}
					.homeList_title3 {
						color: #fff;
					}
					.homeList_title4 {
						color: #fff;
					}
					.homeList_title5 {
						color: #fff;
					}
				}
			}
			.home_list_five_item8 {
				padding: 10px;
				margin: 0 5px 10px;
				background: url(http://clfile.zggen.cn/20240307/e7496c7bc009426f98bf1f82414c7995.jpg) no-repeat center top / 100% 100%;
				width: calc(25% - 10px);
				.img_box {
					object-fit: cover;
					width: 100%;
					height: 200px;
					.home_img {
						box-shadow: 0px 16px 16px -16px #000;
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
				}
				.homeList_content {
					padding: 10px;
					background: none;
					display: flex;
					flex-wrap: wrap;
					.homeList_title1 {
						width: 100%;
						text-align: center;
					}
					.homeList_title2 {
						width: 100%;
						text-align: center;
					}
					.homeList_title3 {
						width: 100%;
						text-align: center;
					}
					.homeList_title4 {
						width: 100%;
						text-align: center;
					}
					.homeList_title5 {
						width: 100%;
						text-align: center;
					}
				}
			}
			.home_list_five_item8:hover {
				cursor: pointer;
				transition: all 0s;
				.img_box {
					.home_img {
					}
				}
				.homeList_content {
					width: 100%;
					height: 100%;
					.homeList_title1 {
						color: #fff;
					}
					.homeList_title2 {
						color: #fff;
					}
					.homeList_title3 {
						color: #fff;
					}
					.homeList_title4 {
						color: #fff;
					}
					.homeList_title5 {
						color: #fff;
					}
				}
			}
		}
		// list
		// animation
		.animation_box {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		.animation_box img {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			z-index: initial;
		}
		.animation_box img:hover {
			transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			-webkit-perspective: 1000px;
			perspective: 1000px;
			transition: 0.3s;
		}
		// animation
		// 更多
		.homeList_more_view {
			cursor: pointer;
			border: 0px solid #ddd;
			padding: 0;
			margin: 0;
			z-index: 9;
			color: #fff;
			line-height: 38px;
			right: calc((100% - 1200px)/2 + 20px);
			border-radius: 0px;
			top: 46px;
			background: none;
			width: 89px;
			position: absolute;
			text-align: right;
			height: 38px;
			.homeList_more_text {
				color: #92b864;
			}
			.el-icon {
				color: #92b864;
			}
		}
	}
	// 首页展示
</style>