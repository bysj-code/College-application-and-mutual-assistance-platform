<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','feedback_to_users') || ($check_field('add','feedback_to_users') || $check_field('set','feedback_to_users'))" label="反馈用户" name="feedback_to_users">
                    <uni-data-select
                  id="form_feedback_to_users"
                  v-model="form['feedback_to_users']"
                  :localdata="list_user_feedback_to_users"
                  :clear="!disabledObj['feedback_to_users_isDisabled']"
                  :disabled="disabledObj['feedback_to_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['user_feedback_id'] && $check_field('set','feedback_to_users')) || (!form['user_feedback_id'] && $check_field('add','feedback_to_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['feedback_to_users']"
                  :localdata="list_user_feedback_to_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','feedback_to_users')" id="feedback_to_users"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','student_id') || ($check_field('add','student_id') || $check_field('set','student_id'))" label="学号" name="student_id">
                            <uni-easyinput type="text" v-model="form['student_id']" v-if="user_group === '管理员' || (form['user_feedback_id'] && $check_field('set','student_id')) || (!form['user_feedback_id'] && $check_field('add','student_id'))" :disabled="disabledObj['student_id_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','student_id')">
                  {{ form['student_id'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','full_name') || ($check_field('add','full_name') || $check_field('set','full_name'))" label="姓名" name="full_name">
                            <uni-easyinput type="text" v-model="form['full_name']" v-if="user_group === '管理员' || (form['user_feedback_id'] && $check_field('set','full_name')) || (!form['user_feedback_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','full_name')">
                  {{ form['full_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','feedback_date') || ($check_field('add','feedback_date') || $check_field('set','feedback_date'))" label="反馈日期" name="feedback_date">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['user_feedback_id'] && $check_field('set','feedback_date')) || (!form['user_feedback_id'] && $check_field('add','feedback_date'))" v-model="form['feedback_date']" type="date" :disabled="disabledObj['feedback_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','feedback_date')">
                  {{ form['feedback_date'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','feedback_content') || ($check_field('add','feedback_content') || $check_field('set','feedback_content'))" label="反馈内容" name="feedback_content">
                    <uni-easyinput type="textarea" v-model="form['feedback_content']" v-if="user_group === '管理员' || (form['user_feedback_id'] && $check_field('set','feedback_content')) || (!form['user_feedback_id'] && $check_field('add','feedback_content'))" :disabled="disabledObj['feedback_content_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','feedback_content')">
                  {{ form['feedback_content'] }}
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
      field: "user_feedback_id",
      url_add: "~/api/user_feedback/add?",
      url_set: "~/api/user_feedback/set?",
      url_get_obj: "~/api/user_feedback/get_obj?",
      url_upload: "~/api/user_feedback/upload?",

      query: {
        "user_feedback_id": 0,
      },

      form: {
            "feedback_to_users": 0, // 反馈用户
                    "student_id":  '', // 学号
                    "full_name":  '', // 姓名
                    "feedback_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
                    "feedback_content":  '', // 反馈内容
                        "examine_state": "未审核",
                    "examine_reply": "",
                    "user_feedback_id": 0, // ID
                
              },
          disabledObj:{
                        "feedback_to_users_isDisabled": false,
                                "student_id_isDisabled": false,
                                "full_name_isDisabled": false,
                                "feedback_date_isDisabled": false,
                                "feedback_content_isDisabled": false,
                                  },
                                // 用户列表
            list_user_feedback_to_users: [],
                        // 用户组
            group_user_feedback_to_users: "",
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
            url: _self.$fullUrl('/api/user_feedback/upload?'),
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
            url: _self.$fullUrl('/api/user_feedback/upload?'),
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
                                      if (this.form["feedback_date"] && JSON.stringify(this.form["feedback_date"]).indexOf("-")===-1) {
        this.form["feedback_date"] = this.$toTime(parseInt(this.form["feedback_date"]), "yyyy-MM-dd")
      }
                  uni.db.del("form");
      return param;
    },
            /**
     * 获取学生用户用户列表
     */
    async get_list_user_feedback_to_users() {
      // if(this.user_group !== "管理员" && this.form["feedback_to_users"] === 0) {
      //     this.form["feedback_to_users"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=学生用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_feedback_to_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
    },
            /**
     * 获取学生用户用户组
     */
    async get_group_user_feedback_to_users() {
      this.form["feedback_to_users"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
      if(json.result && json.result.obj){
        this.group_user_feedback_to_users = json.result.obj;
        this.get_user_session_feedback_to_users(this.form['feedback_to_users'])
      }
      else if(json.error){
        console.error(json.error);
      }
    },
    get_user_session_feedback_to_users(id){
      var _this = this;
      var user_id = {"user_id":id}
      var url = "~/api/"+_this.group_user_feedback_to_users.source_table+"/get_obj?"
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
                  if (arr[i] !== "feedback_to_users") {
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
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                      if (this.form["feedback_date"] && JSON.stringify(this.form["feedback_date"]).indexOf("-")===-1) {
        this.form["feedback_date"] = this.$toTime(parseInt(this.form["feedback_date"]),"yyyy-MM-dd")
      }
                },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/user_feedback/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/user_feedback/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/user_feedback/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/user_feedback/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/user_feedback/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
            this.get_list_user_feedback_to_users();
            this.get_group_user_feedback_to_users();
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
