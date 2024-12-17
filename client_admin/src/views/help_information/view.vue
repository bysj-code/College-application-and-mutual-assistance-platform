<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','help_title') || $check_field('add','help_title') || $check_field('set','help_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="求助标题" prop="help_title">
												<el-input id="help_title" v-model="form['help_title']" placeholder="请输入求助标题"
							  v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','help_title')) || (!form['help_information_id'] && $check_field('add','help_title'))" :disabled="disabledObj['help_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','help_title')">{{form['help_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','type_of_help_sought') || $check_field('add','type_of_help_sought') || $check_field('set','type_of_help_sought')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="求助类型" prop="type_of_help_sought">
												<el-input id="type_of_help_sought" v-model="form['type_of_help_sought']" placeholder="请输入求助类型"
							  v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','type_of_help_sought')) || (!form['help_information_id'] && $check_field('add','type_of_help_sought'))" :disabled="disabledObj['type_of_help_sought_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','type_of_help_sought')">{{form['type_of_help_sought']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','date_of_assistance') || $check_field('add','date_of_assistance') || $check_field('set','date_of_assistance')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="求助日期" prop="date_of_assistance">
								<el-date-picker :disabled="disabledObj['date_of_assistance_isDisabled']" v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','date_of_assistance')) || (!form['help_information_id'] && $check_field('add','date_of_assistance'))" id="date_of_assistance"
						v-model="form['date_of_assistance']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','date_of_assistance')">{{form['date_of_assistance']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','publish_users') || $check_field('add','publish_users') || $check_field('set','publish_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布用户" prop="publish_users">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_publish_users(form['publish_users']) }}
							<!--<el-input id="business_name" v-model="form['publish_users']" placeholder="请输入发布用户"-->
							<!--v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','publish_users')) || (!form['help_information_id'] && $check_field('add','publish_users'))" :disabled="disabledObj['publish_users_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','publish_users')">{{form['publish_users']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','publish_users')) || (!form['help_information_id'] && $check_field('add','publish_users'))" id="publish_users" v-model="form['publish_users']" :disabled="disabledObj['publish_users_isDisabled']">
								<el-option v-for="o in list_user_publish_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','publish_users')" id="publish_users" v-model="form['publish_users']" :disabled="true">
								<el-option v-for="o in list_user_publish_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="publish_users" v-model="form['publish_users']" :disabled="disabledObj['publish_users_isDisabled']">
							<el-option v-for="o in list_user_publish_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','help_content') || $check_field('add','help_content') || $check_field('set','help_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="求助内容" prop="help_content">
								<el-input type="textarea" id="help_content" v-model="form['help_content']" placeholder="请输入求助内容"
						v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','help_content')) || (!form['help_information_id'] && $check_field('add','help_content'))" :disabled="disabledObj['help_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','help_content')">{{form['help_content']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','remarks') || $check_field('add','remarks') || $check_field('set','remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="备注信息" prop="remarks">
								<el-select id="remarks" v-model="form['remarks']"
						v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','remarks')) || (!form['help_information_id'] && $check_field('add','remarks'))">
						<el-option v-for="o in list_remarks" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','remarks')">{{form['remarks']}}</div>
							</el-form-item>
			</el-col>
							<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
				</el-form-item>
			</el-col>
	
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "help_information_id",
				url_add: "~/api/help_information/add?",
				url_set: "~/api/help_information/set?",
				url_get_obj: "~/api/help_information/get_obj?",
				url_upload: "~/api/help_information/upload?",

				query: {
					"help_information_id": 0,
				},

				form: {
								"help_title":  '', // 求助标题
										"type_of_help_sought":  '', // 求助类型
										"date_of_assistance":  '', // 求助日期
										"publish_users": 0, // 发布用户
										"help_content":  '', // 求助内容
										"remarks":  '', // 备注信息
									"examine_state": "未审核",
							"examine_reply": "",
							"help_information_id": 0, // ID
						
				},
				disabledObj:{
								"help_title_isDisabled": false,
										"type_of_help_sought_isDisabled": false,
										"date_of_assistance_isDisabled": false,
										"publish_users_isDisabled": false,
										"help_content_isDisabled": false,
										"remarks_isDisabled": false,
										},

	
		
		
		
					// 用户列表
				list_user_publish_users: [],
						// 用户组
				group_user_publish_users: "",
				
						// 备注信息选项列表
				list_remarks: ['已完成','未完成'],
	
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
				/**
			 * 获取学生用户用户列表
			 */
			async get_list_user_publish_users() {
                // if(this.user_group !== "管理员" && this.form["publish_users"] === 0) {
                //     this.form["publish_users"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=学生用户");
                if(json.result && json.result.list){
                    this.list_user_publish_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取学生用户用户组
			 */
			async get_group_user_publish_users() {
							this.form["publish_users"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
				if(json.result && json.result.obj){
					this.group_user_publish_users = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_publish_users(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_publish_users.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["publish_users"] = id
									_this.disabledObj['publish_users' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "publish_users") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_publish_users(id){
				var obj = this.list_user_publish_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
													
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
						        if (this.form["date_of_assistance"].indexOf("-")===-1){
          this.form["date_of_assistance"] = this.$toTime(parseInt(this.form["date_of_assistance"]),"yyyy-MM-dd")
        }
											$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


								        if(this.form["date_of_assistance"]=="0000-00-00"){
          this.form["date_of_assistance"] = null;
        }
				if(parseInt(this.form["date_of_assistance"]) > 9999){
					this.form["date_of_assistance"] = this.$toTime(parseInt(this.form["date_of_assistance"]),"yyyy-MM-dd")
				}
											


			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																								return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/help_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/help_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/help_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/help_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/help_information/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
											this.get_list_user_publish_users();
					this.get_group_user_publish_users();
									},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
