import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},



	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },



	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '公告栏列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '公告栏详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 学生用户路由
	{
		path: '/student_users/table',
		name: 'student_users_table',
		component: () => import('../views/student_users/table.vue'),
		meta: {
			index: 0,
			title: '学生用户列表'
		}
	},
	{
		path: '/student_users/view',
		name: 'student_users_view',
		component: () => import('../views/student_users/view.vue'),
		meta: {
			index: 0,
			title: '学生用户详情'
		}
	},
	// 工作人员路由
	{
		path: '/working_personnel/table',
		name: 'working_personnel_table',
		component: () => import('../views/working_personnel/table.vue'),
		meta: {
			index: 0,
			title: '工作人员列表'
		}
	},
	{
		path: '/working_personnel/view',
		name: 'working_personnel_view',
		component: () => import('../views/working_personnel/view.vue'),
		meta: {
			index: 0,
			title: '工作人员详情'
		}
	},
	// 文章分类路由
	{
		path: '/article_classification/table',
		name: 'article_classification_table',
		component: () => import('../views/article_classification/table.vue'),
		meta: {
			index: 0,
			title: '文章分类列表'
		}
	},
	{
		path: '/article_classification/view',
		name: 'article_classification_view',
		component: () => import('../views/article_classification/view.vue'),
		meta: {
			index: 0,
			title: '文章分类详情'
		}
	},
	// 学生文章路由
	{
		path: '/student_articles/table',
		name: 'student_articles_table',
		component: () => import('../views/student_articles/table.vue'),
		meta: {
			index: 0,
			title: '学生文章列表'
		}
	},
	{
		path: '/student_articles/view',
		name: 'student_articles_view',
		component: () => import('../views/student_articles/view.vue'),
		meta: {
			index: 0,
			title: '学生文章详情'
		}
	},
	// 职工文章路由
	{
		path: '/employee_articles/table',
		name: 'employee_articles_table',
		component: () => import('../views/employee_articles/table.vue'),
		meta: {
			index: 0,
			title: '职工文章列表'
		}
	},
	{
		path: '/employee_articles/view',
		name: 'employee_articles_view',
		component: () => import('../views/employee_articles/view.vue'),
		meta: {
			index: 0,
			title: '职工文章详情'
		}
	},
	// 校园文章路由
	{
		path: '/campus_articles/table',
		name: 'campus_articles_table',
		component: () => import('../views/campus_articles/table.vue'),
		meta: {
			index: 0,
			title: '校园文章列表'
		}
	},
	{
		path: '/campus_articles/view',
		name: 'campus_articles_view',
		component: () => import('../views/campus_articles/view.vue'),
		meta: {
			index: 0,
			title: '校园文章详情'
		}
	},
	// 宿舍报修路由
	{
		path: '/dormitory_repair_report/table',
		name: 'dormitory_repair_report_table',
		component: () => import('../views/dormitory_repair_report/table.vue'),
		meta: {
			index: 0,
			title: '宿舍报修列表'
		}
	},
	{
		path: '/dormitory_repair_report/view',
		name: 'dormitory_repair_report_view',
		component: () => import('../views/dormitory_repair_report/view.vue'),
		meta: {
			index: 0,
			title: '宿舍报修详情'
		}
	},
	// 室内报修路由
	{
		path: '/indoor_repair_report/table',
		name: 'indoor_repair_report_table',
		component: () => import('../views/indoor_repair_report/table.vue'),
		meta: {
			index: 0,
			title: '室内报修列表'
		}
	},
	{
		path: '/indoor_repair_report/view',
		name: 'indoor_repair_report_view',
		component: () => import('../views/indoor_repair_report/view.vue'),
		meta: {
			index: 0,
			title: '室内报修详情'
		}
	},
	// 室外报修路由
	{
		path: '/outdoor_repair_report/table',
		name: 'outdoor_repair_report_table',
		component: () => import('../views/outdoor_repair_report/table.vue'),
		meta: {
			index: 0,
			title: '室外报修列表'
		}
	},
	{
		path: '/outdoor_repair_report/view',
		name: 'outdoor_repair_report_view',
		component: () => import('../views/outdoor_repair_report/view.vue'),
		meta: {
			index: 0,
			title: '室外报修详情'
		}
	},
	// 网络报修路由
	{
		path: '/network_repair_report/table',
		name: 'network_repair_report_table',
		component: () => import('../views/network_repair_report/table.vue'),
		meta: {
			index: 0,
			title: '网络报修列表'
		}
	},
	{
		path: '/network_repair_report/view',
		name: 'network_repair_report_view',
		component: () => import('../views/network_repair_report/view.vue'),
		meta: {
			index: 0,
			title: '网络报修详情'
		}
	},
	// 互助信息路由
	{
		path: '/help_information/table',
		name: 'help_information_table',
		component: () => import('../views/help_information/table.vue'),
		meta: {
			index: 0,
			title: '互助信息列表'
		}
	},
	{
		path: '/help_information/view',
		name: 'help_information_view',
		component: () => import('../views/help_information/view.vue'),
		meta: {
			index: 0,
			title: '互助信息详情'
		}
	},
	// 用户反馈路由
	{
		path: '/user_feedback/table',
		name: 'user_feedback_table',
		component: () => import('../views/user_feedback/table.vue'),
		meta: {
			index: 0,
			title: '用户反馈列表'
		}
	},
	{
		path: '/user_feedback/view',
		name: 'user_feedback_view',
		component: () => import('../views/user_feedback/view.vue'),
		meta: {
			index: 0,
			title: '用户反馈详情'
		}
	},
	// 职工反馈路由
	{
		path: '/employee_feedback/table',
		name: 'employee_feedback_table',
		component: () => import('../views/employee_feedback/table.vue'),
		meta: {
			index: 0,
			title: '职工反馈列表'
		}
	},
	{
		path: '/employee_feedback/view',
		name: 'employee_feedback_view',
		component: () => import('../views/employee_feedback/view.vue'),
		meta: {
			index: 0,
			title: '职工反馈详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "高校报修与互助平台小程序-admin";
	document.title = title;
})

export default router
