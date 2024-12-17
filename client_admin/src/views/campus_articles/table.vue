<template>
	<el-main class="bg table_wrap">
		<el-form label-position="right" :model="query" class="form p_4" label-width="120">
			<el-row>


							<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="文章标题">
									<el-input v-model="query.article_title"></el-input>
								</el-form-item>
				</el-col>
												<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="文章类型">
									<el-select v-model="query.article_type">
											<el-option v-for="o in list_article_type" :key="o.article_type" :label="o.article_type"
								:value="o.article_type">
							</el-option>
										</el-select>
								</el-form-item>
				</el-col>
																<el-col :xs="24" :sm="10" :lg="8" class="search_btn_wrap_1">
					<el-form-item>
						<el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
						<el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
						<router-link v-if="user_group == '管理员' || $check_action('/campus_articles/table','add') || $check_action('/campus_articles/view','add')" class="el-button el-button--default el-button--primary search_btn_add" to="./view?">添加
						</router-link>
            			<el-button v-if="user_group == '管理员' || $check_action('/campus_articles/table','del') || $check_action('/campus_articles/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
					</el-form-item>
				</el-col>

			</el-row>
		</el-form>
		<el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
			<el-table-column fixed type="selection" tooltip-effect="dark" width="55">
			</el-table-column>
				<el-table-column prop="article_title" @sort-change="$sortChange" label="文章标题"
				v-if="user_group == '管理员' || $check_field('get','article_title')" min-width="200">
					</el-table-column>
					<el-table-column prop="release_date" @sort-change="$sortChange" label="发布日期"
				v-if="user_group == '管理员' || $check_field('get','release_date')" min-width="200">
		                <template slot-scope="scope">
                	{{ $toTime(scope.row["release_date"],"yyyy-MM-dd") }}
                </template>
					</el-table-column>
					<el-table-column prop="article_type" @sort-change="$sortChange" label="文章类型"
				v-if="user_group == '管理员' || $check_field('get','article_type')" min-width="200">
					</el-table-column>
					<el-table-column prop="article_cover" @sort-change="$sortChange" label="文章封面"
				v-if="user_group == '管理员' || $check_field('get','article_cover')" min-width="200">
						<template slot-scope="scope">
					<el-image style="width: 100px; height: 100px" :src="$fullUrl(scope.row['article_cover'])"
						:preview-src-list="[$fullUrl(scope.row['article_cover'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</template>
					</el-table-column>
					<el-table-column prop="publish_users" @sort-change="$sortChange" label="发布用户"
				v-if="user_group == '管理员' || $check_field('get','publish_users')" min-width="200">
					</el-table-column>
					<el-table-column prop="article_content" @sort-change="$sortChange" label="文章内容"
				v-if="user_group == '管理员' || $check_field('get','article_content')" min-width="200">
					</el-table-column>
	



            <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["create_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
            </el-table-column>

			<el-table-column sortable prop="update_time" label="更新时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["update_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
			</el-table-column>







			<el-table-column fixed="right" label="操作" min-width="120" v-if="user_group == '管理员' || $check_action('/campus_articles/table','set') || $check_action('/campus_articles/view','set') || $check_action('/campus_articles/view','get') || $check_action('//table','add') || $check_action('//view','add')" >


				<template slot-scope="scope">
					<router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
					v-if="user_group == '管理员' || $check_action('/campus_articles/table','set') || $check_action('/campus_articles/view','set') || $check_action('/campus_articles/view','get')"
						:to="'./view?' + field + '=' + scope.row[field]"
						 size="small">
						<span>详情</span>
					</router-link>
				</template>
			</el-table-column>

		</el-table>

		<!-- 分页器 -->
		<div class="mt text_center">
			<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
				:current-page="query.page" :page-sizes="[7, 10, 30, 100]" :page-size="query.size"
				layout="total, sizes, prev, pager, next, jumper" :total="count">
			</el-pagination>
		</div>
		<!-- /分页器 -->

						
		<div class="modal_wrap" v-if="showModal">
			<div class="modal_box">
				<!-- <div class="modal_box_close" @click="closeModal">X</div> -->
				<p class="modal_box_title">重要提醒</p>
				<p class="modal_box_text">当前有数据达到预警值！</p>
				<div class="btn_box">
					<span @click="closeModal">取消</span>
					<span @click="closeModal">确定</span>
				</div>
			</div>
		</div>


	</el-main>
</template>
<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				// 弹框
				showModal: false,
				// 获取数据地址
				url_get_list: "~/api/campus_articles/get_list?like=0",
				url_del: "~/api/campus_articles/del?",

				// 字段ID
				field: "campus_articles_id",

				// 查询
				query: {
					"size": 7,
					"page": 1,
								"article_title": "",
												"article_type": "",
											"login_time": "",
					"create_time": "",
					"orderby": `create_time desc`
				},

				// 数据
				list: [],
															// 文章类型列表
				list_article_type: [""],
											}
		},
		methods: {
			// 关闭弹框
			closeModal(){
				this.showModal = false;
				},


								/**
			 * 获取文章类型列表
			 */
			async get_list_article_type() {
				var json = await this.$get("~/api/article_classification/get_list?");
				if(json.result){
					this.list_article_type = json.result.list;
				}else if (json.error){
					console.log(json.error);
				}
			},
								



															deleteRow(index, rows) {
				rows.splice(index, 1);
			}

		},
		created() {
								// 初始化文章类型列表
			this.get_list_article_type();
										}
	}
</script>

<style type="text/css">
	.bg {
		background: white;
	}

	.form.p_4 {
		padding: 1rem;
	}

	.form .el-input {
		width: initial;
	}

	.mt {
		margin-top: 1rem;
	}

	.text_center {
		text-align: center;
	}

	.float-right {
		float: right;
	}


	.modal_wrap{
		width: 100vw;
		height: 100vh;
		position: fixed;
		top: 0;
		left: 0;
		background: rgba(0,0,0,0.5);
		z-index: 9999999999;
	}
	.modal_wrap .modal_box{
		width: 400px;
		height: 200px;
		background: url("../../assets/modal_bg.jpg") no-repeat center;
		background-size: cover;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -200px;
		margin-top: -100px;
		border-radius: 10px;
		}
	.modal_wrap .modal_box .modal_box_close{
		font-size: 20px;
		position: absolute;
		top: 10px;
		right: 10px;
		cursor: pointer;
		}
	.modal_wrap .modal_box .modal_box_title{
	  text-align: center;
    font-size: 18px;
    margin: 16px auto;
    color: #fff;
    border-bottom: 1px solid rgba(117, 116, 116,0.5);
    padding-bottom: 16px;
    width: 356px;
		}
	.modal_wrap .modal_box .modal_box_text{
			text-align: center;
		font-size: 15px;
		color: #fff;
		margin-top: 25px;
		}
	.modal_wrap .modal_box .btn_box{
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin-top: 42px;
		}
			.modal_wrap .modal_box .btn_box span{
				display: inline-block;
				width: 80px;
				height: 30px;
				line-height: 30px;
				text-align: center;
				border: 1px solid #ccc;
				font-size: 14px;
				cursor: pointer;
				color: #fff;
			}
	.modal_wrap .modal_box .btn_box span:nth-child(2){
		background: #409EFF;
		color: #fff;
		border-color: #409EFF;
		margin-left: 15px;
	}
</style>
