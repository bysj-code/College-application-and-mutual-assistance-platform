<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','article_title') || ($check_field('add','article_title') || $check_field('set','article_title'))" label="文章标题" name="article_title">
                            <uni-easyinput type="text" v-model="form['article_title']" v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','article_title')) || (!form['campus_articles_id'] && $check_field('add','article_title'))" :disabled="disabledObj['article_title_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','article_title')">
                  {{ form['article_title'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','release_date') || ($check_field('add','release_date') || $check_field('set','release_date'))" label="发布日期" name="release_date">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','release_date')) || (!form['campus_articles_id'] && $check_field('add','release_date'))" v-model="form['release_date']" type="date" :disabled="disabledObj['release_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','release_date')">
                  {{ form['release_date'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','article_type') || ($check_field('add','article_type') || $check_field('set','article_type'))" label="文章类型" name="article_type">
                    <uni-data-select
                  v-model="form.article_type"
                  :localdata="list_article_type"
                  :clear="!disabledObj['article_type_isDisabled']"
                  :disabled="disabledObj['article_type_isDisabled']"
                  v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','article_type')) || (!form['campus_articles_id'] && $check_field('add','article_type'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','article_type')">
                  {{ form['article_type'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','article_cover') || ($check_field('add','article_cover') || $check_field('set','article_cover'))" label="文章封面" name="article_cover">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['article_cover'] && $check_field('set','article_cover')">
                  <image v-if="disabledObj['article_cover_isDisabled']" :src="$fullUrl(form['article_cover'])" />
                  <image v-if="!disabledObj['article_cover_isDisabled']" :src="$fullUrl(form['article_cover'])" @click="change_img('article_cover')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['article_cover'] && $check_field('add','article_cover')">
                  <view v-if="disabledObj['article_cover_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['article_cover_isDisabled']" class="btn_add_img" @click="change_img('article_cover')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','article_cover')">
                  <image :src="$fullUrl(form['article_cover'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','publish_users') || ($check_field('add','publish_users') || $check_field('set','publish_users'))" label="发布用户" name="publish_users">
                            <uni-easyinput type="text" v-model="form['publish_users']" v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','publish_users')) || (!form['campus_articles_id'] && $check_field('add','publish_users'))" :disabled="disabledObj['publish_users_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','publish_users')">
                  {{ form['publish_users'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','article_content') || ($check_field('add','article_content') || $check_field('set','article_content'))" label="文章内容" name="article_content">
                    <uni-easyinput type="textarea" v-model="form['article_content']" v-if="user_group === '管理员' || (form['campus_articles_id'] && $check_field('set','article_content')) || (!form['campus_articles_id'] && $check_field('add','article_content'))" :disabled="disabledObj['article_content_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','article_content')">
                  {{ form['article_content'] }}
                </text>
                  </uni-forms-item>


            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()" class="primary_btn">提交</button>
              <button size="mini" @click="cancel()">取消</button>
            </view>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import mixin from "@/libs/mixins/page.js";

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
                    "release_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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
          list_article_type: [],
                                                                                                  }
  },
  methods: {
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/campus_articles/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
      var _self = this;
      _self.upload_img_flag = false
      // 选择图像方法
      uni.chooseImage({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/campus_articles/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 获取对象后获取缓存表单
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_before(param){
      var form = uni.db.get("form");
      if (form) {
        delete(form.examine_state)
        delete(form.examine_reply)
        this.obj = uni.push(this.obj ,form);
        this.form = uni.push(this.form ,form);
      }
      var arr = []
      for (let key in form) {
        arr.push(key)
      }
      for (var i=0;i<arr.length;i++){
        this.disabledObj[arr[i] + '_isDisabled'] = true
      }
                      if (this.form["release_date"] && JSON.stringify(this.form["release_date"]).indexOf("-")===-1) {
        this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]), "yyyy-MM-dd")
      }
                                          uni.db.del("form");
      return param;
    },
        
            
            /**
     * 获取文章类型列表
     */
    async get_list_article_type() {
              var json = await this.$get("~/api/article_classification/get_list?");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_article_type.push({value:o.article_type,text:o.article_type}));
      }
      else if(json.error){
        console.error(json.error);
      }
        },
        
            
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                      if (this.form["release_date"] && JSON.stringify(this.form["release_date"]).indexOf("-")===-1) {
        this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
      }
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

  },
  created() {
                        this.get_list_article_type();
                                  },
}
</script>

<style scoped>
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

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline:none;
}

.query_option{
  width: 100%;
}

.btn_add_img{
  color: #D3D3D3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text{
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.form_button {
  padding-bottom: 15px;
  display: flex;
}
.form_button button {
  width: 40%;
}
.query_select {
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline: none;
}

.query_option {
  width: 100%;
}

.btn_add_img {
  color: #d3d3d3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text {
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
/*新样式*/
.uni-forms{
padding-top:1rem;
}
.uni-forms-item {
	padding: 6px 10px;
    background: #f8f6fc;
}
.uni-forms .is-input-border{
	border: 0;
}
.container{
	    -webkit-box-shadow: 0px 0px 0px #888888;
	    box-shadow: 0px 0px 0px #888888;
}
.form_button .primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
</style>
