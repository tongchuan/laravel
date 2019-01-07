drop table if exists `t_adv_type`;
create table `t_adv_type` (
  `id` int(11) unsigned auto_increment not null comment 'id 自动增长',
  ``
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `t_news_type`;
create table `t_news_type` (
  `id` int(11) unsigned auto_increment not null  comment 'id 自动增长',
  `parentid` int(11) default null comment '父类id',
  `name` varchar(200) not null default '' comment '名称',
  `cnname` varchar(200) default null comment '中文名称',
  `enname` varchar(200) default null comment '英文名称',
  `link_nav` varchar(200) default null comment '栏目链接地址',
  `content_nav` varchar(1000) default null comment '导读',
  `tags` varchar(200) default null comment '关键字',
  `tags_seo` varchar(200)  default null comment 'seo关键字',
  `keyword` varchar(200)  default null comment '关键字',
  `remark` varchar(1000)  default null comment '备注',
  `small_pic` varchar(200) default null comment '小图片地址',
  `big_pic` varchar(200) default null comment '大图片地址',
  `link` varchar(200) default null comment '链接地址',
  `link_spic` varchar(200) default null comment '小图片链接地址',
  `link_bpic` varchar(200) default null comment '大图片链接地址',
  `show` int(10) default 0 comment '导航是否显示',
  `status` int(10) default 0 comment '状态',
  `hot` tinyint(1) default 0 comment '是否热点',
  `top` tinyint(1) default 0 comment '是否置顶',
  `recommend` tinyint(1) default 0 comment '是否推荐',
  `comm` tinyint(1) default 0 comment '是否点评', 
  `vote` tinyint(1) default 0 comment '是否投票',
  `delete` tinyint(1) default 0 comment '是否删除',
  `create_man` varchar(50)  default null comment '创建人',
  `create_time` TIMESTAMP not null default CURRENT_TIMESTAMP comment '创建时间',
  `modify_man` varchar(50)  default null comment '更新人',
  `modify_time` datetime default null comment '更新时间',
  primary key(`id`),
  constraint `un_t_news_type` unique(`name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `t_news`;
create table `t_news` (
  `id` int(11) unsigned auto_increment not null comment 'id 自动增长',
  `title` varchar(200) not null comment '标题',
  `titles` varchar(200)  default null comment '副标题',
  `title_color` varchar(20)  default null comment '标题颜色',
  `title_seo` varchar(200)  default null comment 'seo标题',
  `tags` varchar(200)  default null comment '关键字',
  `tags_seo` varchar(200)  default null comment 'seo关键字',
  `keyword` varchar(200)  default null comment '关键字',
  `content_nav` varchar(1000)  default null comment '导读',
  `source` varchar(200)  default null comment '来源',
  `remark` varchar(1000)  default null comment '备注',
  `content` text not null comment '内容',
  `description` varchar(500) default null comment '说明',
  `small_pic` varchar(200) default null comment '小图片地址',
  `big_pic` varchar(200) default null comment '大图片地址',
  `link` varchar(200) default null comment '链接地址',
  `link_spic` varchar(200) default null comment '小图片链接地址',
  `link_bpic` varchar(200) default null comment '大图片链接地址',
  `author` varchar(50) default null comment '作者',
  `audit` tinyint(1) default 0 comment '是否审核',
  `hot` tinyint(1) default 0 comment '是否热点',
  `top` tinyint(1)  default 0 comment '是否置顶',
  `recommend` tinyint(1) default 0 comment '是否推荐',
  `comm` tinyint(1)  default 0 comment '是否点评', 
  `vote` tinyint(1)   default 0 comment '是否投票',
  `delete` tinyint(1)  default 0 comment '是否删除',
  `order` double default 0 comment '排序',
  `click` int(11)  default 0 comment '点击次数',
  `status` int(10)  default 0 comment '状态',
  `create_man` varchar(50)  default null comment '创建人',
  `create_time` TIMESTAMP not null default CURRENT_TIMESTAMP comment '创建时间',
  `modify_man` varchar(50)  default null comment '更新人',
  `modify_time` datetime  default null comment '更新时间',
  primary key(`id`),
  constraint `un_t_news_title` unique(`title`),
  CONSTRAINT `t_news_type_id_t_news_1` FOREIGN KEY (`id`) REFERENCES `t_news_type` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;