<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','repair_user') || ($check_field('add','repair_user') || $check_field('set','repair_user'))" label="报修用户" name="repair_user">
                    <uni-data-select
                  id="form_repair_user"
                  v-model="form['repair_user']"
                  :localdata="list_user_repair_user"
                  :clear="!disabledObj['repair_user_isDisabled']"
                  :disabled="disabledObj['repair_user_isDisabled']"
                  v-if="user_group === '管理员' || (form['dormitory_repair_report_id'] && $check_field('set','repair_user')) || (!form['dormitory_repair_report_id'] && $check_field('add','repair_user'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['repair_user']"
                  :localdata="list_user_repair_user"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','repair_user')" id="repair_user"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','full_name') || ($check_field('add','full_name') || $check_field('set','full_name'))" label="姓名" name="full_name">
                            <uni-easyinput type="text" v-model="form['full_name']" v-if="user_group === '管理员' || (form['dormitory_repair_report_id'] && $check_field('set','full_name')) || (!form['dormitory_repair_report_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','full_name')">
                  {{ form['full_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','dormitory_number') || ($check_field('add','dormitory_number') || $check_field('set','dormitory_number'))" label="宿舍号" name="dormitory_number">
                            <uni-easyinput type="text" v-model="form['dormitory_number']" v-if="user_group === '管理员' || (form['dormitory_repair_report_id'] && $check_field('set','dormitory_number')) || (!form['dormitory_repair_report_id'] && $check_field('add','dormitory_number'))" :disabled="disabledObj['dormitory_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','dormitory_number')">
                  {{ form['dormitory_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','repair_date') || ($check_field('add','repair_date') || $check_field('set','repair_date'))" label="报修日期" name="repair_date">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['dormitory_repair_report_id'] && $check_field('set','repair_date')) || (!form['dormitory_repair_report_id'] && $check_field('add','repair_date'))" v-model="form['repair_date']" type="date" :disabled="disabledObj['repair_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','repair_date')">
                  {{ form['repair_date'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','repair_content') || ($check_field('add','repair_content') || $check_field('set','repair_content'))" label="报修内容" name="repair_content">
                    <uni-easyinput type="textarea" v-model="form['repair_content']" v-if="user_group === '管理员' || (form['dormitory_repair_report_id'] && $check_field('set','repair_content')) || (!form['dormitory_repair_report_id'] && $check_field('add','repair_content'))" :disabled="disabledObj['repair_content_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','repair_content')">
                  {{ form['repair_content'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','repair_status') || ($check_field('add','repair_status') || $check_field('set','repair_status'))" label="报修状态" name="repair_status">
                    <uni-data-select
                  v-model="form.repair_status"
                  :localdata="list_repair_status"
                  :clear="!disabledObj['repair_status_isDisabled']"
                  :disabled="disabledObj['repair_status_isDisabled']"
                  v-if="user_group === '管理员' || (form['dormitory_repair_report_id'] && $check_field('set','repair_status')) || (!form['dormitory_repair_report_id'] && $check_field('add','repair_status'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','repair_status')">
                  {{ form['repair_status'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','maintenance_records') || ($check_field('add','maintenance_records') || $check_field('set','maintenance_records'))" label="维修记录" name="maintenance_records">
                            <uni-easyinput type="text" v-model="form['maintenance_records']" v-if="user_group === '管理员' || (form['dormitory_repair_report_id'] && $check_field('set','maintenance_records')) || (!form['dormitory_repair_report_id'] && $check_field('add','maintenance_records'))" :disabled="disabledObj['maintenance_records_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','maintenance_records')">
                  {{ form['maintenance_records'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','repair_personnel') || ($check_field('add','repair_personnel') || $check_field('set','repair_personnel'))" label="维修人员" name="repair_personnel">
                    <uni-data-select
                  id="form_repair_personnel"
                  v-model="form['repair_personnel']"
                  :localdata="list_user_repair_personnel"
                  :clear="!disabledObj['repair_personnel_isDisabled']"
                  :disabled="disabledObj['repair_personnel_isDisabled']"
                  v-if="user_group === '管理员' || (form['dormitory_repair_report_id'] && $check_field('set','repair_personnel')) || (!form['dormitory_repair_report_id'] && $check_field('add','repair_personnel'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['repair_personnel']"
                  :localdata="list_user_repair_personnel"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','repair_personnel')" id="repair_personnel"
                ></uni-data-select>
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
      field: "dormitory_repair_report_id",
      url_add: "~/api/dormitory_repair_report/add?",
      url_set: "~/api/dormitory_repair_report/set?",
      url_get_obj: "~/api/dormitory_repair_report/get_obj?",
      url_upload: "~/api/dormitory_repair_report/upload?",

      query: {
        "dormitory_repair_report_id": 0,
      },

      form: {
            "repair_user": 0, // 报修用户
                    "full_name":  '', // 姓名
                    "dormitory_number":  '', // 宿舍号
                    "repair_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
                    "repair_content":  '', // 报修内容
                    "repair_status":  '', // 报修状态
                    "maintenance_records":  '', // 维修记录
                    "repair_personnel": 0, // 维修人员
                        "examine_state": "未审核",
                    "examine_reply": "",
                    "dormitory_repair_report_id": 0, // ID
                
              },
          disabledObj:{
                        "repair_user_isDisabled": false,
                                "full_name_isDisabled": false,
                                "dormitory_number_isDisabled": false,
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
          list_repair_status: [],
                                                                    // 用户列表
            list_user_repair_personnel: [],
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
            url: _self.$fullUrl('/api/dormitory_repair_report/upload?'),
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
            url: _self.$fullUrl('/api/dormitory_repair_report/upload?'),
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
                                      if (this.form["repair_date"] && JSON.stringify(this.form["repair_date"]).indexOf("-")===-1) {
        this.form["repair_date"] = this.$toTime(parseInt(this.form["repair_date"]), "yyyy-MM-dd")
      }
                                          uni.db.del("form");
      return param;
    },
            /**
     * 获取学生用户用户列表
     */
    async get_list_user_repair_user() {
      // if(this.user_group !== "管理员" && this.form["repair_user"] === 0) {
      //     this.form["repair_user"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=学生用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_repair_user.push({value:o.user_id,text:o.nickname + '-' + o.username}));
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
        this.get_user_session_repair_user(this.form['repair_user'])
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
            
            
            
            
            
            /**
     * 获取报修状态列表
     */
    async get_list_repair_status() {
          ['待维修','维修中','已完成'].map((o) => this.list_repair_status.push({value:o,text:o}));
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
        json.result.list.map((o) => this.list_user_repair_personnel.push({value:o.user_id,text:o.nickname + '-' + o.username}));
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
                                      if (this.form["repair_date"] && JSON.stringify(this.form["repair_date"]).indexOf("-")===-1) {
        this.form["repair_date"] = this.$toTime(parseInt(this.form["repair_date"]),"yyyy-MM-dd")
      }
                                        },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/dormitory_repair_report/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/dormitory_repair_report/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/dormitory_repair_report/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/dormitory_repair_report/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/dormitory_repair_report/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
            this.get_list_user_repair_user();
            this.get_group_user_repair_user();
                                                    this.get_list_repair_status();
                            this.get_list_user_repair_personnel();
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
