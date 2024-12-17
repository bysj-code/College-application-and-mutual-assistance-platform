<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','article_title') || $check_field('add','article_title') || $check_field('set','article_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="文章标题" prop="article_title">
												<el-input id="article_title" v-model="form['article_title']" placeholder="请输入文章标题"
							  v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','article_title')) || (!form['campus_articles_id'] && $check_field('add','article_title'))" :disabled="disabledObj['article_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','article_title')">{{form['article_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','release_date') || $check_field('add','release_date') || $check_field('set','release_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布日期" prop="release_date">
								<el-date-picker :disabled="disabledObj['release_date_isDisabled']" v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','release_date')) || (!form['campus_articles_id'] && $check_field('add','release_date'))" id="release_date"
						v-model="form['release_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','release_date')">{{form['release_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','article_type') || $check_field('add','article_type') || $check_field('set','article_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="文章类型" prop="article_type">
								<el-select id="article_type" v-model="form['article_type']"
						v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','article_type')) || (!form['campus_articles_id'] && $check_field('add','article_type'))">
						<el-option v-for="o in list_article_type" :key="o['article_type']" :label="o['article_type']"
							:value="o['article_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','article_type')">{{form['article_type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','article_cover') || $check_field('add','article_cover') || $check_field('set','article_cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="文章封面" prop="article_cover">
								<el-upload :disabled="disabledObj['article_cover_isDisabled']" id="article_cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_article_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','article_cover')) || (!form['campus_articles_id'] && $check_field('add','article_cover'))">
						<img v-if="form['article_cover']" :src="$fullUrl(form['article_cover'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','article_cover')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['article_cover'])" :preview-src-list="[$fullUrl(form['article_cover'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','publish_users') || $check_field('add','publish_users') || $check_field('set','publish_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布用户" prop="publish_users">
												<el-input id="publish_users" v-model="form['publish_users']" placeholder="请输入发布用户"
							  v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','publish_users')) || (!form['campus_articles_id'] && $check_field('add','publish_users'))" :disabled="disabledObj['publish_users_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','publish_users')">{{form['publish_users']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','article_content') || $check_field('add','article_content') || $check_field('set','article_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="文章内容" prop="article_content">
								<el-input type="textarea" id="article_content" v-model="form['article_content']" placeholder="请输入文章内容"
						v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','article_content')) || (!form['campus_articles_id'] && $check_field('add','article_content'))" :disabled="disabledObj['article_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','article_content')">{{form['article_content']}}</div>
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
				field: "campus_articles_id",
				url_add: "~/api/campus_articles/add?",
				url_set: "~/api/campus_articles/set?",
				url_get_obj: "~/api/campus_articles/get_obj?",
				url_upload: "~/api/campus_articles/upload?",

				query: {
					"campus_articles_id": 0,
				},

				form: {
								"article_title":  '', // 文章标题
										"release_date":  '', // 发布日期
										"article_type":  '', // 文章类型
										"article_cover":  '', // 文章封面
										"publish_users":  '', // 发布用户
										"article_content":  '', // 文章内容
											"campus_articles_id": 0, // ID
						
				},
				disabledObj:{
								"article_title_isDisabled": false,
										"release_date_isDisabled": false,
										"article_type_isDisabled": false,
										"article_cover_isDisabled": false,
										"publish_users_isDisabled": false,
										"article_content_isDisabled": false,
										},

	
		
						// 文章类型选项列表
				list_article_type: [""],
	
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
				/**
			 * 获取文章类型列表
			 */
			async get_list_article_type() {
				var json = await this.$get("~/api/article_classification/get_list?");
				if(json.result && json.result.list){
					this.list_article_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
						/**
			 * 上传文章封面
			 * @param {Object} param 图片参数
			 */
			upload_article_cover(param){
						this.uploadFile(param.file, "article_cover");
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
				        if (this.form["release_date"].indexOf("-")===-1){
          this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
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


					        if(this.form["release_date"]=="0000-00-00"){
          this.form["release_date"] = null;
        }
				if(parseInt(this.form["release_date"]) > 9999){
					this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/campus_articles/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/campus_articles/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/campus_articles/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/campus_articles/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/campus_articles/view','get');
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
								this.get_list_article_type();
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
