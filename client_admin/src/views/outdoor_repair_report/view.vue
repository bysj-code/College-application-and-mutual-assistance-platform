<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','repair_user') || $check_field('add','repair_user') || $check_field('set','repair_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报修用户" prop="repair_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_repair_user(form['repair_user']) }}
							<!--<el-input id="business_name" v-model="form['repair_user']" placeholder="请输入报修用户"-->
							<!--v-if="user_group === '管理员' || (form['outdoor_repair_report_id'] && $check_field('set','repair_user')) || (!form['outdoor_repair_report_id'] && $check_field('add','repair_user'))" :disabled="disabledObj['repair_user_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','repair_user')">{{form['repair_user']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['outdoor_repair_report_id'] && $check_field('set','repair_user')) || (!form['outdoor_repair_report_id'] && $check_field('add','repair_user'))" id="repair_user" v-model="form['repair_user']" :disabled="disabledObj['repair_user_isDisabled']">
								<el-option v-for="o in list_user_repair_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','repair_user')" id="repair_user" v-model="form['repair_user']" :disabled="true">
								<el-option v-for="o in list_user_repair_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="repair_user" v-model="form['repair_user']" :disabled="disabledObj['repair_user_isDisabled']">
							<el-option v-for="o in list_user_repair_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','full_name') || $check_field('add','full_name') || $check_field('set','full_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="姓名" prop="full_name">
												<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"
							  v-if="user_group === '管理员' || (form['outdoor_repair_report_id'] && $check_field('set','full_name')) || (!form['outdoor_repair_report_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','repair_date') || $check_field('add','repair_date') || $check_field('set','repair_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报修日期" prop="repair_date">
								<el-date-picker :disabled="disabledObj['repair_date_isDisabled']" v-if="user_group === '管理员' || (form['outdoor_repair_report_id'] && $check_field('set','repair_date')) || (!form['outdoor_repair_report_id'] && $check_field('add','repair_date'))" id="repair_date"
						v-model="form['repair_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','repair_date')">{{form['repair_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','repair_content') || $check_field('add','repair_content') || $check_field('set','repair_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报修内容" prop="repair_content">
												<el-input id="repair_content" v-model="form['repair_content']" placeholder="请输入报修内容"
							  v-if="user_group === '管理员' || (form['outdoor_repair_report_id'] && $check_field('set','repair_content')) || (!form['outdoor_repair_report_id'] && $check_field('add','repair_content'))" :disabled="disabledObj['repair_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','repair_content')">{{form['repair_content']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','repair_status') || $check_field('add','repair_status') || $check_field('set','repair_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报修状态" prop="repair_status">
								<el-select id="repair_status" v-model="form['repair_status']"
						v-if="user_group === '管理员' || (form['outdoor_repair_report_id'] && $check_field('set','repair_status')) || (!form['outdoor_repair_report_id'] && $check_field('add','repair_status'))">
						<el-option v-for="o in list_repair_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','repair_status')">{{form['repair_status']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','maintenance_records') || $check_field('add','maintenance_records') || $check_field('set','maintenance_records')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="维修记录" prop="maintenance_records">
												<el-input id="maintenance_records" v-model="form['maintenance_records']" placeholder="请输入维修记录"
							  v-if="user_group === '管理员' || (form['outdoor_repair_report_id'] && $check_field('set','maintenance_records')) || (!form['outdoor_repair_report_id'] && $check_field('add','maintenance_records'))" :disabled="disabledObj['maintenance_records_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','maintenance_records')">{{form['maintenance_records']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','repair_personnel') || $check_field('add','repair_personnel') || $check_field('set','repair_personnel')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="维修人员" prop="repair_personnel">
													<el-select v-if="user_group === '管理员' || (form['outdoor_repair_report_id'] && $check_field('set','repair_personnel')) || (!form['outdoor_repair_report_id'] && $check_field('add','repair_personnel'))" id="repair_personnel" v-model="form['repair_personnel']" :disabled="disabledObj['repair_personnel_isDisabled']">
							<el-option v-for="o in list_user_repair_personnel" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','repair_personnel')" id="repair_personnel" v-model="form['repair_personnel']" :disabled="true">
							<el-option v-for="o in list_user_repair_personnel" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
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
	
	
	
				<el-col
					v-if="user_group === '管理员' || $check_action('/outdoor_repair_report/view', 'set') || $check_action('/outdoor_repair_report/view', 'add')"
					:xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="当前位置" prop="location_address">
					<el-input style="width: 80%" id="location_address" v-model="form['location_address']"
							  :disabled="true"></el-input>
					<el-button size="mini" @click="getLongitudeLatitude()">定位</el-button>
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
				field: "outdoor_repair_report_id",
				url_add: "~/api/outdoor_repair_report/add?",
				url_set: "~/api/outdoor_repair_report/set?",
				url_get_obj: "~/api/outdoor_repair_report/get_obj?",
				url_upload: "~/api/outdoor_repair_report/upload?",

				query: {
					"outdoor_repair_report_id": 0,
				},

				form: {
								"repair_user": 0, // 报修用户
										"full_name":  '', // 姓名
										"repair_date":  '', // 报修日期
										"repair_content":  '', // 报修内容
										"repair_status":  '', // 报修状态
										"maintenance_records":  '', // 维修记录
										"repair_personnel": 0, // 维修人员
									"examine_state": "未审核",
							"examine_reply": "",
							"outdoor_repair_report_id": 0, // ID
							"location_address": "", // 定位地址
					"location_lng": "", // 定位地址经度
					"location_lat": "", // 定位地址纬度
					
				},
				disabledObj:{
								"repair_user_isDisabled": false,
										"full_name_isDisabled": false,
										"repair_date_isDisabled": false,
										"repair_content_isDisabled": false,
										"repair_status_isDisabled": false,
										"maintenance_records_isDisabled": false,
										"repair_personnel_isDisabled": false,
										},

	
					// 用户列表
				list_user_repair_user: [],
						// 用户组
				group_user_repair_user: "",
				
		
		
						// 报修状态选项列表
				list_repair_status: ['待维修','维修中','已完成'],
	
		
		
					// 用户列表
				list_user_repair_personnel: [],
			
			}
		},
		methods: {


	
	
				/**
			 * 获取学生用户用户列表
			 */
			async get_list_user_repair_user() {
                // if(this.user_group !== "管理员" && this.form["repair_user"] === 0) {
                //     this.form["repair_user"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=学生用户");
                if(json.result && json.result.list){
                    this.list_user_repair_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取学生用户用户组
			 */
			async get_group_user_repair_user() {
							this.form["repair_user"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
				if(json.result && json.result.obj){
					this.group_user_repair_user = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_repair_user(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_repair_user.source_table+"/get_obj?"
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
												_this.form["repair_user"] = id
									_this.disabledObj['repair_user' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "repair_user") {
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
					get_user_repair_user(id){
				var obj = this.list_user_repair_user.getObj({"user_id":id});
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
			 * 获取工作人员用户列表
			 */
			async get_list_user_repair_personnel() {
                // if(this.user_group !== "管理员" && this.form["repair_personnel"] === 0) {
                //     this.form["repair_personnel"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=工作人员");
                if(json.result && json.result.list){
                    this.list_user_repair_personnel = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_repair_personnel(id){
				var obj = this.list_user_repair_personnel.getObj({"user_id":id});
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
						        if (this.form["repair_date"].indexOf("-")===-1){
          this.form["repair_date"] = this.$toTime(parseInt(this.form["repair_date"]),"yyyy-MM-dd")
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


								        if(this.form["repair_date"]=="0000-00-00"){
          this.form["repair_date"] = null;
        }
				if(parseInt(this.form["repair_date"]) > 9999){
					this.form["repair_date"] = this.$toTime(parseInt(this.form["repair_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/outdoor_repair_report/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/outdoor_repair_report/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/outdoor_repair_report/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/outdoor_repair_report/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/outdoor_repair_report/view','get');
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
			getLongitudeLatitude() {
				let _this = this;
				_this.form.location_address = "广东省深圳市南山区科技园";
				_this.form.location_lng = "113.946782";
				_this.form.location_lat = "22.556481";
				//如果该对象存在，那么地理位置服务可用。
				if ('geolocation' in navigator) {
					/* 地理位置服务可用 */
					let options = {
						enableHighAccuracy: true, //布尔值，表示系统是否使用最高精度来表示结果，注意，这会导致较慢的响应时间或者增加电量消耗（比如对于支持gps的移动设备来说）。如果值为false ，设备会通过更快响应以及/或者使用更少的电量等方法来尽可能的节约资源。默认值fasle
						timeout: 5000, //它表明的是设备必须在多长时间（单位毫秒）内返回一个位置。默认直到获取到位置才会返回值。
						maximumAge: 0 //表明可以返回多长时间（即最长年龄，单位毫秒）内的可获取的缓存位置。如果设置为 0, 说明设备不能使用一个缓存位置，而且必须去获取一个真实的当前位置。默认0
					}
					function success(position) {
						//position.coords (只读) 返回一个定义了当前位置的Coordinates对象。
						//position.timestamp (只读) 返回一个时间戳DOMTimeStamp， 这个时间戳表示获取到的位置的时间。
						let lat = position.coords.latitude //当前位置的纬度
						let lng = position.coords.longitude //当前位置精度
						let location=lng+","+lat;
						let url = "http://restapi.amap.com/v3/geocode/regeo?key=b6eb2819a6ba4c5119591614272fe7ca&location="+location;
						_this.$axios.get(url, {
						}).then((res) => {
							if (res.status===200){
								let data = res.data;
								if (data.status==='1'){
									_this.form.location_address = data.regeocode.formatted_address;
									_this.form.location_lng = JSON.stringify(lng);
									_this.form.location_lat = JSON.stringify(lat);
								}else {
									console.log(data.info)
								}
							}
						}).catch((res) => {
							console.log(res);
						});
					}
					function error(err) {
						let errorType = ['您拒绝共享位置信息', '获取不到位置信息', '获取位置信息超时']
						console.log(errorType[err.code - 1])
					}
					navigator.geolocation.getCurrentPosition(success, error, options)
				} else {
					/* 地理位置服务不可用 */
					console.log('无法获取您的位置，请检查定位是否开启或刷新重试')
				}
			},

		},
		created() {
					this.get_list_user_repair_user();
					this.get_group_user_repair_user();
																		this.get_list_user_repair_personnel();
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
