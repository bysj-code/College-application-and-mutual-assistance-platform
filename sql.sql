DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-05-04 16:42:42.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-05-30 17:35:13.0');
DROP TABLE IF EXISTS `student_users`;
CREATE TABLE `student_users`(student_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '学生用户ID',
`student_id` varchar(64) NOT NULL UNIQUE comment '学号',
`full_name` varchar(64) comment '姓名',
`gender` varchar(64) comment '性别',
`dormitory_number` varchar(64) comment '宿舍号',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (student_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生用户';

DROP TABLE IF EXISTS `working_personnel`;
CREATE TABLE `working_personnel`(working_personnel_id int(11) NOT NULL AUTO_INCREMENT COMMENT '工作人员ID',
`job_id` varchar(64) NOT NULL UNIQUE comment '工号',
`full_name` varchar(64) comment '姓名',
`gender` varchar(64) comment '性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (working_personnel_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '工作人员';

DROP TABLE IF EXISTS `article_classification`;
CREATE TABLE `article_classification`(article_classification_id int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类ID',
`article_type` varchar(64) comment '文章类型',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (article_classification_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '文章分类';
insert into `article_classification` values (1,'文章类型1',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `article_classification` values (2,'文章类型2',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `article_classification` values (3,'文章类型3',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `article_classification` values (4,'文章类型4',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `article_classification` values (5,'文章类型5',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `article_classification` values (6,'文章类型6',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `article_classification` values (7,'文章类型7',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `article_classification` values (8,'文章类型8',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');

DROP TABLE IF EXISTS `student_articles`;
CREATE TABLE `student_articles`(student_articles_id int(11) NOT NULL AUTO_INCREMENT COMMENT '学生文章ID',
`article_title` varchar(64) comment '文章标题',
`release_date` date comment '发布日期',
`article_type` varchar(64) comment '文章类型',
`article_cover` varchar(255) comment '文章封面',
`release_students` int(11) DEFAULT 0 comment '发布学生',
`article_content` text comment '文章内容',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (student_articles_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生文章';
insert into `student_articles` values (1,'文章标题1','2023-05-12','文章类型1','/api/upload/1605383363164635137.jpg',0,'文章内容1',634,345,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `student_articles` values (2,'文章标题2','2023-05-12','文章类型2','/api/upload/1605383752110833664.jpg',0,'文章内容2',470,406,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `student_articles` values (3,'文章标题3','2023-05-12','文章类型3','/api/upload/1605383480412209152.jpg',0,'文章内容3',26,187,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `student_articles` values (4,'文章标题4','2023-05-12','文章类型4','/api/upload/1605383598666416128.jpg',0,'文章内容4',944,831,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `student_articles` values (5,'文章标题5','2023-05-12','文章类型5','/api/upload/1605383857165565952.jpg',0,'文章内容5',418,508,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `student_articles` values (6,'文章标题6','2023-05-12','文章类型6','/api/upload/1605383431808614401.jpg',0,'文章内容6',36,122,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `student_articles` values (7,'文章标题7','2023-05-12','文章类型7','/api/upload/1605383529531703297.jpg',0,'文章内容7',377,729,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `student_articles` values (8,'文章标题8','2023-05-12','文章类型8','/api/upload/1605383309079085056.jpg',0,'文章内容8',324,522,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');

DROP TABLE IF EXISTS `employee_articles`;
CREATE TABLE `employee_articles`(employee_articles_id int(11) NOT NULL AUTO_INCREMENT COMMENT '职工文章ID',
`article_title` varchar(64) comment '文章标题',
`release_date` date comment '发布日期',
`article_type` varchar(64) comment '文章类型',
`article_cover` varchar(255) comment '文章封面',
`release_employees` int(11) DEFAULT 0 comment '发布职工',
`article_content` text comment '文章内容',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (employee_articles_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '职工文章';
insert into `employee_articles` values (1,'文章标题1','2023-05-12','文章类型1','/api/upload/1637721783035494400.jpg',0,'文章内容1',785,64,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `employee_articles` values (2,'文章标题2','2023-05-12','文章类型2','/api/upload/1637721887305891841.jpg',0,'文章内容2',308,49,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `employee_articles` values (3,'文章标题3','2023-05-12','文章类型3','/api/upload/1637721721249202177.jpg',0,'文章内容3',957,887,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `employee_articles` values (4,'文章标题4','2023-05-12','文章类型4','/api/upload/1637722022781911040.jpg',0,'文章内容4',131,940,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `employee_articles` values (5,'文章标题5','2023-05-12','文章类型5','/api/upload/1637721934781218816.jpg',0,'文章内容5',724,234,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `employee_articles` values (6,'文章标题6','2023-05-12','文章类型6','/api/upload/1637721422597980160.jpg',0,'文章内容6',158,876,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `employee_articles` values (7,'文章标题7','2023-05-12','文章类型7','/api/upload/1637721976518737921.jpg',0,'文章内容7',858,561,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `employee_articles` values (8,'文章标题8','2023-05-12','文章类型8','/api/upload/1637721843311837184.jpg',0,'文章内容8',955,214,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');

DROP TABLE IF EXISTS `campus_articles`;
CREATE TABLE `campus_articles`(campus_articles_id int(11) NOT NULL AUTO_INCREMENT COMMENT '校园文章ID',
`article_title` varchar(64) comment '文章标题',
`release_date` date comment '发布日期',
`article_type` varchar(64) comment '文章类型',
`article_cover` varchar(255) comment '文章封面',
`publish_users` varchar(64) comment '发布用户',
`article_content` text comment '文章内容',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (campus_articles_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '校园文章';
insert into `campus_articles` values (1,'文章标题1','2023-05-12','文章类型1','/api/upload/1637721422597980160.jpg','发布用户1','文章内容1',585,124,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `campus_articles` values (2,'文章标题2','2023-05-12','文章类型2','/api/upload/1637721934781218816.jpg','发布用户2','文章内容2',837,616,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `campus_articles` values (3,'文章标题3','2023-05-12','文章类型3','/api/upload/1637721721249202177.jpg','发布用户3','文章内容3',697,523,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `campus_articles` values (4,'文章标题4','2023-05-12','文章类型4','/api/upload/1637721887305891841.jpg','发布用户4','文章内容4',118,349,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `campus_articles` values (5,'文章标题5','2023-05-12','文章类型5','/api/upload/1637721976518737921.jpg','发布用户5','文章内容5',511,631,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `campus_articles` values (6,'文章标题6','2023-05-12','文章类型6','/api/upload/1637721843311837184.jpg','发布用户6','文章内容6',879,459,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `campus_articles` values (7,'文章标题7','2023-05-12','文章类型7','/api/upload/1637721783035494400.jpg','发布用户7','文章内容7',587,595,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `campus_articles` values (8,'文章标题8','2023-05-12','文章类型8','/api/upload/1637722022781911040.jpg','发布用户8','文章内容8',189,196,0,'2023-05-12 23:55:57','2023-05-12 23:55:57');

DROP TABLE IF EXISTS `dormitory_repair_report`;
CREATE TABLE `dormitory_repair_report`(dormitory_repair_report_id int(11) NOT NULL AUTO_INCREMENT COMMENT '宿舍报修ID',
`repair_user` int(11) DEFAULT 0 comment '报修用户',
`full_name` varchar(64) comment '姓名',
`dormitory_number` varchar(64) comment '宿舍号',
`repair_date` date comment '报修日期',
`repair_content` text comment '报修内容',
`repair_status` varchar(64) comment '报修状态',
`maintenance_records` varchar(64) comment '维修记录',
`repair_personnel` int(11) DEFAULT 0 comment '维修人员',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (dormitory_repair_report_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '宿舍报修';
insert into `dormitory_repair_report` values (1,0,'姓名1','宿舍号1','2023-05-12','报修内容1','报修状态1','维修记录1',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `dormitory_repair_report` values (2,0,'姓名2','宿舍号2','2023-05-12','报修内容2','报修状态2','维修记录2',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `dormitory_repair_report` values (3,0,'姓名3','宿舍号3','2023-05-12','报修内容3','报修状态3','维修记录3',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `dormitory_repair_report` values (4,0,'姓名4','宿舍号4','2023-05-12','报修内容4','报修状态4','维修记录4',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `dormitory_repair_report` values (5,0,'姓名5','宿舍号5','2023-05-12','报修内容5','报修状态5','维修记录5',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `dormitory_repair_report` values (6,0,'姓名6','宿舍号6','2023-05-12','报修内容6','报修状态6','维修记录6',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `dormitory_repair_report` values (7,0,'姓名7','宿舍号7','2023-05-12','报修内容7','报修状态7','维修记录7',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `dormitory_repair_report` values (8,0,'姓名8','宿舍号8','2023-05-12','报修内容8','报修状态8','维修记录8',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');

DROP TABLE IF EXISTS `indoor_repair_report`;
CREATE TABLE `indoor_repair_report`(indoor_repair_report_id int(11) NOT NULL AUTO_INCREMENT COMMENT '室内报修ID',
`repair_user` int(11) DEFAULT 0 comment '报修用户',
`full_name` varchar(64) comment '姓名',
`repair_date` date comment '报修日期',
`select_region` varchar(64) comment '选择区域',
`specific_location` varchar(64) comment '具体位置',
`repair_content` varchar(64) comment '报修内容',
`repair_status` varchar(64) comment '报修状态',
`maintenance_records` varchar(64) comment '维修记录',
`repair_personnel` int(11) DEFAULT 0 comment '维修人员',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (indoor_repair_report_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '室内报修';
insert into `indoor_repair_report` values (1,0,'姓名1','2023-05-12','选择区域1','具体位置1','报修内容1','报修状态1','维修记录1',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `indoor_repair_report` values (2,0,'姓名2','2023-05-12','选择区域2','具体位置2','报修内容2','报修状态2','维修记录2',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `indoor_repair_report` values (3,0,'姓名3','2023-05-12','选择区域3','具体位置3','报修内容3','报修状态3','维修记录3',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `indoor_repair_report` values (4,0,'姓名4','2023-05-12','选择区域4','具体位置4','报修内容4','报修状态4','维修记录4',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `indoor_repair_report` values (5,0,'姓名5','2023-05-12','选择区域5','具体位置5','报修内容5','报修状态5','维修记录5',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `indoor_repair_report` values (6,0,'姓名6','2023-05-12','选择区域6','具体位置6','报修内容6','报修状态6','维修记录6',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `indoor_repair_report` values (7,0,'姓名7','2023-05-12','选择区域7','具体位置7','报修内容7','报修状态7','维修记录7',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `indoor_repair_report` values (8,0,'姓名8','2023-05-12','选择区域8','具体位置8','报修内容8','报修状态8','维修记录8',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');

DROP TABLE IF EXISTS `outdoor_repair_report`;
CREATE TABLE `outdoor_repair_report`(outdoor_repair_report_id int(11) NOT NULL AUTO_INCREMENT COMMENT '室外报修ID',
`repair_user` int(11) DEFAULT 0 comment '报修用户',
`full_name` varchar(64) comment '姓名',
`repair_date` date comment '报修日期',
`repair_content` varchar(64) comment '报修内容',
`repair_status` varchar(64) comment '报修状态',
`maintenance_records` varchar(64) comment '维修记录',
`repair_personnel` int(11) DEFAULT 0 comment '维修人员',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`location_address` varchar(64) DEFAULT NULL comment '当前位置',
`location_lng` varchar(64) DEFAULT NULL comment '当前位置经度',
`location_lat` varchar(64) DEFAULT NULL comment '当前位置纬度',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (outdoor_repair_report_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '室外报修';
insert into `outdoor_repair_report` values (1,0,'姓名1','2023-05-12','报修内容1','报修状态1','维修记录1',0,'未审核','',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `outdoor_repair_report` values (2,0,'姓名2','2023-05-12','报修内容2','报修状态2','维修记录2',0,'未审核','',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `outdoor_repair_report` values (3,0,'姓名3','2023-05-12','报修内容3','报修状态3','维修记录3',0,'未审核','',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `outdoor_repair_report` values (4,0,'姓名4','2023-05-12','报修内容4','报修状态4','维修记录4',0,'未审核','',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `outdoor_repair_report` values (5,0,'姓名5','2023-05-12','报修内容5','报修状态5','维修记录5',0,'未审核','',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `outdoor_repair_report` values (6,0,'姓名6','2023-05-12','报修内容6','报修状态6','维修记录6',0,'未审核','',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `outdoor_repair_report` values (7,0,'姓名7','2023-05-12','报修内容7','报修状态7','维修记录7',0,'未审核','',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `outdoor_repair_report` values (8,0,'姓名8','2023-05-12','报修内容8','报修状态8','维修记录8',0,'未审核','',0,'广东省深圳市南山区科技园','113.946782','22.556481','2023-05-12 23:55:57','2023-05-12 23:55:57');

DROP TABLE IF EXISTS `network_repair_report`;
CREATE TABLE `network_repair_report`(network_repair_report_id int(11) NOT NULL AUTO_INCREMENT COMMENT '网络报修ID',
`repair_user` int(11) DEFAULT 0 comment '报修用户',
`full_name` varchar(64) comment '姓名',
`repair_date` date comment '报修日期',
`repair_location` varchar(64) comment '报修位置',
`repair_content` varchar(64) comment '报修内容',
`repair_status` varchar(64) comment '报修状态',
`maintenance_records` varchar(64) comment '维修记录',
`repair_personnel` int(11) DEFAULT 0 comment '维修人员',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (network_repair_report_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '网络报修';
insert into `network_repair_report` values (1,0,'姓名1','2023-05-12','报修位置1','报修内容1','报修状态1','维修记录1',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `network_repair_report` values (2,0,'姓名2','2023-05-12','报修位置2','报修内容2','报修状态2','维修记录2',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `network_repair_report` values (3,0,'姓名3','2023-05-12','报修位置3','报修内容3','报修状态3','维修记录3',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `network_repair_report` values (4,0,'姓名4','2023-05-12','报修位置4','报修内容4','报修状态4','维修记录4',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `network_repair_report` values (5,0,'姓名5','2023-05-12','报修位置5','报修内容5','报修状态5','维修记录5',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `network_repair_report` values (6,0,'姓名6','2023-05-12','报修位置6','报修内容6','报修状态6','维修记录6',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `network_repair_report` values (7,0,'姓名7','2023-05-12','报修位置7','报修内容7','报修状态7','维修记录7',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');
insert into `network_repair_report` values (8,0,'姓名8','2023-05-12','报修位置8','报修内容8','报修状态8','维修记录8',0,'未审核','',0,'2023-05-12 23:55:57','2023-05-12 23:55:57');

DROP TABLE IF EXISTS `help_information`;
CREATE TABLE `help_information`(help_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '互助信息ID',
`help_title` varchar(64) comment '求助标题',
`type_of_help_sought` varchar(64) comment '求助类型',
`date_of_assistance` date comment '求助日期',
`publish_users` int(11) DEFAULT 0 comment '发布用户',
`help_content` text comment '求助内容',
`remarks` varchar(64) comment '备注信息',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (help_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '互助信息';
insert into `help_information` values (1,'求助标题1','求助类型1','2023-05-12',0,'求助内容1','备注信息1','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `help_information` values (2,'求助标题2','求助类型2','2023-05-12',0,'求助内容2','备注信息2','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `help_information` values (3,'求助标题3','求助类型3','2023-05-12',0,'求助内容3','备注信息3','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `help_information` values (4,'求助标题4','求助类型4','2023-05-12',0,'求助内容4','备注信息4','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `help_information` values (5,'求助标题5','求助类型5','2023-05-12',0,'求助内容5','备注信息5','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `help_information` values (6,'求助标题6','求助类型6','2023-05-12',0,'求助内容6','备注信息6','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `help_information` values (7,'求助标题7','求助类型7','2023-05-12',0,'求助内容7','备注信息7','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `help_information` values (8,'求助标题8','求助类型8','2023-05-12',0,'求助内容8','备注信息8','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');

DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback`(user_feedback_id int(11) NOT NULL AUTO_INCREMENT COMMENT '用户反馈ID',
`feedback_to_users` int(11) DEFAULT 0 comment '反馈用户',
`student_id` varchar(64) comment '学号',
`full_name` varchar(64) comment '姓名',
`feedback_date` date comment '反馈日期',
`feedback_content` text comment '反馈内容',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (user_feedback_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户反馈';
insert into `user_feedback` values (1,0,'学号1','姓名1','2023-05-12','反馈内容1','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `user_feedback` values (2,0,'学号2','姓名2','2023-05-12','反馈内容2','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `user_feedback` values (3,0,'学号3','姓名3','2023-05-12','反馈内容3','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `user_feedback` values (4,0,'学号4','姓名4','2023-05-12','反馈内容4','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `user_feedback` values (5,0,'学号5','姓名5','2023-05-12','反馈内容5','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `user_feedback` values (6,0,'学号6','姓名6','2023-05-12','反馈内容6','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `user_feedback` values (7,0,'学号7','姓名7','2023-05-12','反馈内容7','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `user_feedback` values (8,0,'学号8','姓名8','2023-05-12','反馈内容8','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');

DROP TABLE IF EXISTS `employee_feedback`;
CREATE TABLE `employee_feedback`(employee_feedback_id int(11) NOT NULL AUTO_INCREMENT COMMENT '职工反馈ID',
`feedback_to_users` int(11) DEFAULT 0 comment '反馈用户',
`full_name` varchar(64) comment '姓名',
`feedback_date` date comment '反馈日期',
`feedback_content` text comment '反馈内容',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (employee_feedback_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '职工反馈';
insert into `employee_feedback` values (1,0,'姓名1','2023-05-12','反馈内容1','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `employee_feedback` values (2,0,'姓名2','2023-05-12','反馈内容2','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `employee_feedback` values (3,0,'姓名3','2023-05-12','反馈内容3','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `employee_feedback` values (4,0,'姓名4','2023-05-12','反馈内容4','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `employee_feedback` values (5,0,'姓名5','2023-05-12','反馈内容5','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `employee_feedback` values (6,0,'姓名6','2023-05-12','反馈内容6','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `employee_feedback` values (7,0,'姓名7','2023-05-12','反馈内容7','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');
insert into `employee_feedback` values (8,0,'姓名8','2023-05-12','反馈内容8','未审核','',0,'2023-05-12 23:55:58','2023-05-12 23:55:58');

insert into `auth` values ('1','管理员','学生用户','student_users','学生用户','/student_users/table','','_blank','1','1','1','1','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('2','管理员','学生用户','student_users','学生用户详情','/student_users/view','','_blank','1','1','1','1','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('3','管理员','工作人员','working_personnel','工作人员','/working_personnel/table','','_blank','1','1','1','1','job_id,full_name,gender','job_id,full_name,gender','job_id,full_name,gender',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('4','管理员','工作人员','working_personnel','工作人员详情','/working_personnel/view','','_blank','1','1','1','1','job_id,full_name,gender','job_id,full_name,gender','job_id,full_name,gender',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('5','管理员','文章分类','article_classification','文章分类','/article_classification/table','','_blank','1','1','1','1','article_type','article_type','article_type',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('6','管理员','文章分类','article_classification','文章分类详情','/article_classification/view','','_blank','1','1','1','1','article_type','article_type','article_type',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('7','管理员','学生文章','student_articles','学生文章','/student_articles/table','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('8','管理员','学生文章','student_articles','学生文章详情','/student_articles/view','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('9','管理员','学生文章','student_articles','学生文章','/student_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('10','管理员','学生文章','student_articles','学生文章详情','/student_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('11','管理员','职工文章','employee_articles','职工文章','/employee_articles/table','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('12','管理员','职工文章','employee_articles','职工文章详情','/employee_articles/view','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('13','管理员','职工文章','employee_articles','职工文章','/employee_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('14','管理员','职工文章','employee_articles','职工文章详情','/employee_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('15','管理员','校园文章','campus_articles','校园文章','/campus_articles/table','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('16','管理员','校园文章','campus_articles','校园文章详情','/campus_articles/view','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('17','管理员','校园文章','campus_articles','校园文章','/campus_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('18','管理员','校园文章','campus_articles','校园文章详情','/campus_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('19','管理员','宿舍报修','dormitory_repair_report','宿舍报修','/dormitory_repair_report/table','','_blank','1','1','1','1','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":true}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('20','管理员','宿舍报修','dormitory_repair_report','宿舍报修详情','/dormitory_repair_report/view','','_blank','1','1','1','1','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('21','管理员','室内报修','indoor_repair_report','室内报修','/indoor_repair_report/table','','_blank','1','1','1','1','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":true}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('22','管理员','室内报修','indoor_repair_report','室内报修详情','/indoor_repair_report/view','','_blank','1','1','1','1','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('23','管理员','室外报修','outdoor_repair_report','室外报修','/outdoor_repair_report/table','','_blank','1','1','1','1','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":true}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('24','管理员','室外报修','outdoor_repair_report','室外报修详情','/outdoor_repair_report/view','','_blank','1','1','1','1','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('25','管理员','网络报修','network_repair_report','网络报修','/network_repair_report/table','','_blank','1','1','1','1','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":true}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('26','管理员','网络报修','network_repair_report','网络报修详情','/network_repair_report/view','','_blank','1','1','1','1','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('27','管理员','互助信息','help_information','互助信息','/help_information/table','','_blank','1','1','1','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{"examine":true,"can_show_comment":true}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('28','管理员','互助信息','help_information','互助信息','/help_information/view','','_blank','1','1','1','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('29','管理员','互助信息','help_information','互助信息','/help_information/list','top','_blank','1','1','1','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('30','管理员','互助信息','help_information','互助信息','/help_information/details','','_blank','1','1','1','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('31','管理员','用户反馈','user_feedback','用户反馈','/user_feedback/table','','_blank','1','1','1','1','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content',null,'0','{"examine":true}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('32','管理员','用户反馈','user_feedback','用户反馈详情','/user_feedback/view','','_blank','1','1','1','1','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('33','管理员','职工反馈','employee_feedback','职工反馈','/employee_feedback/table','','_blank','1','1','1','1','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content',null,'0','{"examine":true}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('34','管理员','职工反馈','employee_feedback','职工反馈详情','/employee_feedback/view','','_blank','1','1','1','1','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('35','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('36','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('37','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('38','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('39','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('40','管理员','公告','notice','公告列表','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('41','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('42','管理员','公告','notice','公告栏','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('43','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('44','游客','学生用户','student_users','学生用户','/student_users/table','','_blank','1','0','0','0','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('45','游客','学生用户','student_users','学生用户详情','/student_users/view','','_blank','1','0','0','0','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('46','游客','工作人员','working_personnel','工作人员','/working_personnel/table','','_blank','1','0','0','0','job_id,full_name,gender','job_id,full_name,gender','job_id,full_name,gender',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('47','游客','工作人员','working_personnel','工作人员详情','/working_personnel/view','','_blank','1','0','0','0','job_id,full_name,gender','job_id,full_name,gender','job_id,full_name,gender',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('48','游客','文章分类','article_classification','文章分类','/article_classification/table','','_blank','0','0','0','0','article_type','article_type','article_type',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('49','游客','文章分类','article_classification','文章分类详情','/article_classification/view','','_blank','0','0','0','0','article_type','article_type','article_type',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('50','游客','学生文章','student_articles','学生文章','/student_articles/table','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('51','游客','学生文章','student_articles','学生文章详情','/student_articles/view','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('52','游客','学生文章','student_articles','学生文章','/student_articles/list','top','_blank','0','0','0','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('53','游客','学生文章','student_articles','学生文章详情','/student_articles/details','','_blank','0','0','0','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('54','游客','职工文章','employee_articles','职工文章','/employee_articles/table','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('55','游客','职工文章','employee_articles','职工文章详情','/employee_articles/view','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('56','游客','职工文章','employee_articles','职工文章','/employee_articles/list','top','_blank','0','0','0','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('57','游客','职工文章','employee_articles','职工文章详情','/employee_articles/details','','_blank','0','0','0','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('58','游客','校园文章','campus_articles','校园文章','/campus_articles/table','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('59','游客','校园文章','campus_articles','校园文章详情','/campus_articles/view','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('60','游客','校园文章','campus_articles','校园文章','/campus_articles/list','top','_blank','0','0','0','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('61','游客','校园文章','campus_articles','校园文章详情','/campus_articles/details','','_blank','0','0','0','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('62','游客','宿舍报修','dormitory_repair_report','宿舍报修','/dormitory_repair_report/table','','_blank','0','0','0','0','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('63','游客','宿舍报修','dormitory_repair_report','宿舍报修详情','/dormitory_repair_report/view','','_blank','0','0','0','0','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('64','游客','室内报修','indoor_repair_report','室内报修','/indoor_repair_report/table','','_blank','0','0','0','0','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('65','游客','室内报修','indoor_repair_report','室内报修详情','/indoor_repair_report/view','','_blank','0','0','0','0','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('66','游客','室外报修','outdoor_repair_report','室外报修','/outdoor_repair_report/table','','_blank','0','0','0','0','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('67','游客','室外报修','outdoor_repair_report','室外报修详情','/outdoor_repair_report/view','','_blank','0','0','0','0','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('68','游客','网络报修','network_repair_report','网络报修','/network_repair_report/table','','_blank','0','0','0','0','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('69','游客','网络报修','network_repair_report','网络报修详情','/network_repair_report/view','','_blank','0','0','0','0','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('70','游客','互助信息','help_information','求助信息','/help_information/table','','_blank','0','0','0','0','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{"examine":false,"can_show_comment":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('71','游客','互助信息','help_information','求助信息详情','/help_information/view','','_blank','0','0','0','0','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('72','游客','互助信息','help_information','求助信息','/help_information/list','top','_blank','0','0','0','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('73','游客','互助信息','help_information','求助信息详情','/help_information/details','','_blank','0','0','0','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('74','游客','用户反馈','user_feedback','用户反馈','/user_feedback/table','','_blank','0','0','0','0','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('75','游客','用户反馈','user_feedback','用户反馈详情','/user_feedback/view','','_blank','0','0','0','0','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('76','游客','职工反馈','employee_feedback','职工反馈','/employee_feedback/table','','_blank','0','0','0','0','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('77','游客','职工反馈','employee_feedback','职工反馈详情','/employee_feedback/view','','_blank','0','0','0','0','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('78','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('79','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('80','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('81','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('82','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('83','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('84','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('85','游客','公告','notice','公告栏','/notice/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('86','游客','公告','notice','公告详情','/notice/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('87','学生用户','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('88','学生用户','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('89','学生用户','工作人员','working_personnel','工作人员','/working_personnel/table','','_blank','0','0','0','0','job_id,full_name,gender','job_id,full_name,gender','job_id,full_name,gender',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('90','学生用户','工作人员','working_personnel','工作人员详情','/working_personnel/view','','_blank','0','0','0','0','job_id,full_name,gender','job_id,full_name,gender','job_id,full_name,gender',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('91','学生用户','文章分类','article_classification','文章分类','/article_classification/table','','_blank','0','0','0','0','article_type','article_type','article_type',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('92','学生用户','文章分类','article_classification','文章分类详情','/article_classification/view','','_blank','0','0','0','0','article_type','article_type','article_type',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('93','学生用户','学生文章','student_articles','学生文章','/student_articles/table','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('94','学生用户','学生文章','student_articles','学生文章详情','/student_articles/view','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('95','学生用户','学生文章','student_articles','学生文章','/student_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('96','学生用户','学生文章','student_articles','学生文章详情','/student_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('97','学生用户','职工文章','employee_articles','职工文章','/employee_articles/table','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('98','学生用户','职工文章','employee_articles','职工文章详情','/employee_articles/view','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('99','学生用户','职工文章','employee_articles','职工文章','/employee_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('100','学生用户','职工文章','employee_articles','职工文章详情','/employee_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('101','学生用户','校园文章','campus_articles','校园文章','/campus_articles/table','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('102','学生用户','校园文章','campus_articles','校园文章详情','/campus_articles/view','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('103','学生用户','校园文章','campus_articles','校园文章','/campus_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('104','学生用户','校园文章','campus_articles','校园文章详情','/campus_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('105','学生用户','宿舍报修','dormitory_repair_report','宿舍报修','/dormitory_repair_report/table','','_blank','1','0','0','1','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('106','学生用户','宿舍报修','dormitory_repair_report','宿舍报修详情','/dormitory_repair_report/view','','_blank','1','0','0','1','repair_user,full_name,dormitory_number,repair_date,repair_content','repair_user,full_name,dormitory_number,repair_date,repair_content','repair_status,maintenance_records,repair_personnel,repair_user,full_name,dormitory_number,repair_date,repair_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('107','学生用户','室内报修','indoor_repair_report','室内报修','/indoor_repair_report/table','','_blank','1','0','0','1','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('108','学生用户','室内报修','indoor_repair_report','室内报修详情','/indoor_repair_report/view','','_blank','1','0','0','1','repair_user,full_name,repair_date,select_region,specific_location,repair_content','repair_user,full_name,repair_date,select_region,specific_location,repair_content','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('109','学生用户','室外报修','outdoor_repair_report','室外报修','/outdoor_repair_report/table','','_blank','1','0','0','1','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('110','学生用户','室外报修','outdoor_repair_report','室外报修详情','/outdoor_repair_report/view','','_blank','1','0','0','1','repair_user,full_name,repair_date,repair_content','repair_user,full_name,repair_date,repair_content','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('111','学生用户','网络报修','network_repair_report','网络报修','/network_repair_report/table','','_blank','1','0','0','1','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('112','学生用户','网络报修','network_repair_report','网络报修详情','/network_repair_report/view','','_blank','1','0','0','1','repair_user,full_name,repair_date,repair_location,repair_content','repair_user,full_name,repair_date,repair_location,repair_content','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('113','学生用户','互助信息','help_information','互助信息','/help_information/table','','_blank','1','0','0','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{"examine":false,"can_show_comment":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('114','学生用户','互助信息','help_information','互助信息','/help_information/view','','_blank','1','0','0','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('115','学生用户','互助信息','help_information','互助信息','/help_information/list','top','_blank','1','1','1','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('116','学生用户','互助信息','help_information','互助信息','/help_information/details','','_blank','1','1','1','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('117','学生用户','用户反馈','user_feedback','用户反馈','/user_feedback/table','','_blank','1','0','0','1','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('118','学生用户','用户反馈','user_feedback','用户反馈详情','/user_feedback/view','','_blank','1','0','0','1','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('119','学生用户','职工反馈','employee_feedback','职工反馈','/employee_feedback/table','','_blank','0','0','0','0','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('120','学生用户','职工反馈','employee_feedback','职工反馈详情','/employee_feedback/view','','_blank','0','0','0','0','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('121','学生用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('122','学生用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('123','学生用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('124','学生用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('125','学生用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('126','学生用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('127','学生用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('128','学生用户','公告','notice','公告栏','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('129','学生用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('130','工作人员','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('131','工作人员','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number','student_id,full_name,gender,dormitory_number',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('132','工作人员','工作人员','working_personnel','工作人员','/working_personnel/table','','_blank','0','0','0','0','job_id,full_name,gender','job_id,full_name,gender','job_id,full_name,gender',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('133','工作人员','工作人员','working_personnel','工作人员详情','/working_personnel/view','','_blank','0','0','0','0','job_id,full_name,gender','job_id,full_name,gender','job_id,full_name,gender',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('134','工作人员','文章分类','article_classification','文章分类','/article_classification/table','','_blank','0','0','0','0','article_type','article_type','article_type',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('135','工作人员','文章分类','article_classification','文章分类详情','/article_classification/view','','_blank','0','0','0','0','article_type','article_type','article_type',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('136','工作人员','学生文章','student_articles','学生文章','/student_articles/table','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('137','工作人员','学生文章','student_articles','学生文章详情','/student_articles/view','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('138','工作人员','学生文章','student_articles','学生文章','/student_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('139','工作人员','学生文章','student_articles','学生文章详情','/student_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content','article_title,release_date,article_type,article_cover,release_students,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('140','工作人员','职工文章','employee_articles','职工文章','/employee_articles/table','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('141','工作人员','职工文章','employee_articles','职工文章详情','/employee_articles/view','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('142','工作人员','职工文章','employee_articles','职工文章','/employee_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('143','工作人员','职工文章','employee_articles','职工文章详情','/employee_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content','article_title,release_date,article_type,article_cover,release_employees,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('144','工作人员','校园文章','campus_articles','校园文章','/campus_articles/table','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('145','工作人员','校园文章','campus_articles','校园文章详情','/campus_articles/view','','_blank','0','0','0','0','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('146','工作人员','校园文章','campus_articles','校园文章','/campus_articles/list','top','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('147','工作人员','校园文章','campus_articles','校园文章详情','/campus_articles/details','','_blank','1','1','1','1','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content','article_title,release_date,article_type,article_cover,publish_users,article_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('148','工作人员','宿舍报修','dormitory_repair_report','宿舍报修','/dormitory_repair_report/table','','_blank','0','0','1','1','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('149','工作人员','宿舍报修','dormitory_repair_report','宿舍报修详情','/dormitory_repair_report/view','','_blank','0','0','1','1','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_status,maintenance_records','repair_user,full_name,dormitory_number,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('150','工作人员','室内报修','indoor_repair_report','室内报修','/indoor_repair_report/table','','_blank','0','0','1','1','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('151','工作人员','室内报修','indoor_repair_report','室内报修详情','/indoor_repair_report/view','','_blank','0','0','1','1','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_status,maintenance_records','repair_user,full_name,repair_date,select_region,specific_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('152','工作人员','室外报修','outdoor_repair_report','室外报修','/outdoor_repair_report/table','','_blank','0','0','1','1','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('153','工作人员','室外报修','outdoor_repair_report','室外报修详情','/outdoor_repair_report/view','','_blank','0','0','1','1','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel','repair_status,maintenance_records','repair_user,full_name,repair_date,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('154','工作人员','网络报修','network_repair_report','网络报修','/network_repair_report/table','','_blank','0','0','1','1','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('155','工作人员','网络报修','network_repair_report','网络报修详情','/network_repair_report/view','','_blank','0','0','1','1','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel','repair_status,maintenance_records','repair_user,full_name,repair_date,repair_location,repair_content,repair_status,maintenance_records,repair_personnel',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('156','工作人员','互助信息','help_information','求助信息','/help_information/table','','_blank','0','0','0','0','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{"examine":false,"can_show_comment":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('157','工作人员','互助信息','help_information','求助信息详情','/help_information/view','','_blank','0','0','0','0','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('158','工作人员','互助信息','help_information','互助信息','/help_information/list','top','_blank','1','1','1','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('159','工作人员','互助信息','help_information','互助信息','/help_information/details','','_blank','1','1','1','1','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks','help_title,type_of_help_sought,date_of_assistance,publish_users,help_content,remarks',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('160','工作人员','用户反馈','user_feedback','用户反馈','/user_feedback/table','','_blank','0','0','0','0','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('161','工作人员','用户反馈','user_feedback','用户反馈详情','/user_feedback/view','','_blank','0','0','0','0','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content','feedback_to_users,student_id,full_name,feedback_date,feedback_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('162','工作人员','职工反馈','employee_feedback','职工反馈','/employee_feedback/table','','_blank','1','0','0','1','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content',null,'0','{"examine":false}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('163','工作人员','职工反馈','employee_feedback','职工反馈详情','/employee_feedback/view','','_blank','1','0','0','1','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content','feedback_to_users,full_name,feedback_date,feedback_content',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('164','工作人员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('165','工作人员','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('166','工作人员','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('167','工作人员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('168','工作人员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('169','工作人员','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('170','工作人员','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('171','工作人员','公告','notice','公告栏','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `auth` values ('172','工作人员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `user_group` values ('3','100','学生用户',null,'student_users','student_users_id','0','3','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `user_group` values ('4','100','工作人员',null,'working_personnel','working_personnel_id','0','3','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1565526092209455105.jpg','281','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1565524124921495553.jpg','889','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1565526499723837441.jpg','519','2023-05-12 23:55:58.0','2023-05-12 23:55:58.0');
