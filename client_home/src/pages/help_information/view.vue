<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','help_title') || ($check_field('add','help_title') || $check_field('set','help_title'))" label="求助标题" name="help_title">
                            <uni-easyinput type="text" v-model="form['help_title']" v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','help_title')) || (!form['help_information_id'] && $check_field('add','help_title'))" :disabled="disabledObj['help_title_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','help_title')">
                  {{ form['help_title'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','type_of_help_sought') || ($check_field('add','type_of_help_sought') || $check_field('set','type_of_help_sought'))" label="求助类型" name="type_of_help_sought">
                            <uni-easyinput type="text" v-model="form['type_of_help_sought']" v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','type_of_help_sought')) || (!form['help_information_id'] && $check_field('add','type_of_help_sought'))" :disabled="disabledObj['type_of_help_sought_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','type_of_help_sought')">
                  {{ form['type_of_help_sought'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','date_of_assistance') || ($check_field('add','date_of_assistance') || $check_field('set','date_of_assistance'))" label="求助日期" name="date_of_assistance">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','date_of_assistance')) || (!form['help_information_id'] && $check_field('add','date_of_assistance'))" v-model="form['date_of_assistance']" type="date" :disabled="disabledObj['date_of_assistance_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','date_of_assistance')">
                  {{ form['date_of_assistance'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','publish_users') || ($check_field('add','publish_users') || $check_field('set','publish_users'))" label="发布用户" name="publish_users">
                    <uni-data-select
                  id="form_publish_users"
                  v-model="form['publish_users']"
                  :localdata="list_user_publish_users"
                  :clear="!disabledObj['publish_users_isDisabled']"
                  :disabled="disabledObj['publish_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','publish_users')) || (!form['help_information_id'] && $check_field('add','publish_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['publish_users']"
                  :localdata="list_user_publish_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','publish_users')" id="publish_users"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','help_content') || ($check_field('add','help_content') || $check_field('set','help_content'))" label="求助内容" name="help_content">
                    <uni-easyinput type="textarea" v-model="form['help_content']" v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','help_content')) || (!form['help_information_id'] && $check_field('add','help_content'))" :disabled="disabledObj['help_content_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','help_content')">
                  {{ form['help_content'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','remarks') || ($check_field('add','remarks') || $check_field('set','remarks'))" label="备注信息" name="remarks">
                    <uni-data-select
                  v-model="form.remarks"
                  :localdata="list_remarks"
                  :clear="!disabledObj['remarks_isDisabled']"
                  :disabled="disabledObj['remarks_isDisabled']"
                  v-if="user_group === '管理员' || (form['help_information_id'] && $check_field('set','remarks')) || (!form['help_information_id'] && $check_field('add','remarks'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','remarks')">
                  {{ form['remarks'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item label="审核状态" name="examine_state">
                <uni-data-select
                    v-model="form['examine_state']"
                    :localdata="list_examine_state"
                    v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())"
                ></uni-data-select>
                <text v-else>{{form["examine_state"]}}</text>
              </uni-forms-item>
              <uni-forms-item label="审核回复" name="examine_reply">
                <uni-easyinput type="text" placeholder="请输入审核回复" v-model="form['examine_reply']"
                               v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())" />
                <!-- 仅查看 -->
                <text v-else>{{form["examine_reply"]}}</text>
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
                    "date_of_assistance": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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
          list_remarks: [],
                                  list_examine_state:[{value:"未审核",text:"未审核"},{value:"已通过",text:"已通过"},{value:"未通过",text:"未通过"}],
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
            url: _self.$fullUrl('/api/help_information/upload?'),
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
            url: _self.$fullUrl('/api/help_information/upload?'),
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
                              if (this.form["date_of_assistance"] && JSON.stringify(this.form["date_of_assistance"]).indexOf("-")===-1) {
        this.form["date_of_assistance"] = this.$toTime(parseInt(this.form["date_of_assistance"]), "yyyy-MM-dd")
      }
                                  uni.db.del("form");
      return param;
    },
        
            
            
                /**
     * 获取学生用户用户列表
     */
    async get_list_user_publish_users() {
      // if(this.user_group !== "管理员" && this.form["publish_users"] === 0) {
      //     this.form["publish_users"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=学生用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_publish_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
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
        this.get_user_session_publish_users(this.form['publish_users'])
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
            
            
            /**
     * 获取备注信息列表
     */
    async get_list_remarks() {
          ['已完成','未完成'].map((o) => this.list_remarks.push({value:o,text:o}));
            },
        
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                              if (this.form["date_of_assistance"] && JSON.stringify(this.form["date_of_assistance"]).indexOf("-")===-1) {
        this.form["date_of_assistance"] = this.$toTime(parseInt(this.form["date_of_assistance"]),"yyyy-MM-dd")
      }
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

  },
  created() {
                                    this.get_list_user_publish_users();
            this.get_group_user_publish_users();
                            this.get_list_remarks();
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
