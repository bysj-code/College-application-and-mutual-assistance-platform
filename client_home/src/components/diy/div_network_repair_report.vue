<template>
	<view class="diy_details diy_div_network_repair_report">
		<view v-if="Object.keys(obj).length!==0" class="warp">
			<view class="container">
				<view class="row">
					<view v-if="$check_field('get','repair_user')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>报修用户:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_repair_user(obj['repair_user']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','full_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>姓名:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["full_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','repair_date')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>报修日期:</span>
						</view>
							<view class="diy_field diy_date">
							<text>
								{{ $toTime(obj["repair_date"],"yyyy-MM-dd") }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','repair_location')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>报修位置:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["repair_location"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','repair_content')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>报修内容:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["repair_content"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','repair_status')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>报修状态:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["repair_status"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','maintenance_records')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>维修记录:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["maintenance_records"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','repair_personnel')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>维修人员:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_repair_personnel(obj['repair_personnel']) }}
							</text>
						</view>
						</view>
				</view>
			</view>
		</view>

	</view>
</template>

<script>
	import mixin from "@/libs/mixins/component.js";
	export default {
		mixins: [mixin],
		props: {
			obj_goods: {
				type: Object,
				default(){
					return {}
				}
			},
			query:{
				type: Object,
				default(){
					return {
						network_repair_report_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
					// 用户列表
				list_user_repair_user: [],
												// 用户列表
				list_user_repair_personnel: [],
				}
		},
		methods: {
			async get_obj_goods_type() {
				var res = await this.$get("~/api/goods_type/get_obj", {
					name: this.obj_goods.type
				})

				if (res.result.obj) {
					this.obj_goods_type = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
			async get_obj_by_goods() {
				var {
					source_table,
					source_field
				} = this.obj_goods_type
				var {
					source_id
				} = this.obj_goods
				var query = {}
				query[source_field] = source_id
				this.$get("~/api/" + source_table + "/get_obj", {}, (res) => {
					if (res.result.obj) {
						this.obj = res.result.obj
					} else {
						console.log("没有请求到商品分类");
					}
				})
			},
			async get_obj_by_id(){
				var res = await this.$get("~/api/network_repair_report/get_obj", {
					network_repair_report_id:this.query.network_repair_report_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
				/**
			 * 获取学生用户用户列表
			 */
			async get_list_user_repair_user() {
				var json = await this.$get("~/api/user/get_list?user_group=学生用户");
				if(json.result && json.result.list){
					this.list_user_repair_user = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_repair_user(id){
				let obj = this.list_user_repair_user;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
											/**
			 * 获取工作人员用户列表
			 */
			async get_list_user_repair_personnel() {
				var json = await this.$get("~/api/user/get_list?user_group=工作人员");
				if(json.result && json.result.list){
					this.list_user_repair_personnel = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_repair_personnel(id){
				let obj = this.list_user_repair_personnel;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
			},
		created() {
				this.get_list_user_repair_user();
											this.get_list_user_repair_personnel();
			},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["network_repair_report_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_network_repair_report_details {}

	.details {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
		border-bottom: 1px solid #eee;
	}

	.left_text {
		flex: 0 0 25%;
	}

	.right_text {
		flex: 0 0 75%;
	}
	.edit_nav{
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}
</style>
