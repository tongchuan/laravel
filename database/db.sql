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



DROP TABLE IF EXISTS `taddonarticle`;
CREATE TABLE `taddonarticle` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `body` mediumtext,
  `redirecturl` varchar(255) NOT NULL default '',
  `templet` varchar(30) NOT NULL default '',
  `userip` char(15) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `typeid` (`typeid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `taddonimages`;
CREATE TABLE `taddonimages` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `pagestyle` smallint(6) NOT NULL default '1',
  `maxwidth` smallint(6) NOT NULL default '600',
  `imgurls` text,
  `row` smallint(6) NOT NULL default '0',
  `col` smallint(6) NOT NULL default '0',
  `isrm` smallint(6) NOT NULL default '0',
  `ddmaxwidth` smallint(6) NOT NULL default '200',
  `pagepicnum` smallint(6) NOT NULL default '12',
  `templet` varchar(30) NOT NULL default '',
  `userip` char(15) NOT NULL default '',
  `redirecturl` varchar(255) NOT NULL default '',
  `body` mediumtext,
  PRIMARY KEY  (`id`),
  KEY `imagesMain` (`typeid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `taddoninfos`;
CREATE TABLE `taddoninfos` (
  `id` int(11) NOT NULL default '0',
  `typeid` int(11) NOT NULL default '0',
  `channel` smallint(6) NOT NULL default '0',
  `arcrank` smallint(6) NOT NULL default '0',
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `click` int(10) unsigned NOT NULL default '0',
  `title` varchar(60) NOT NULL default '',
  `litpic` varchar(60) NOT NULL default '',
  `userip` varchar(15) NOT NULL default ' ',
  `senddate` int(11) NOT NULL default '0',
  `flag` set('c','h','p','f','s','j','a','b') default NULL,
  `lastpost` int(10) unsigned NOT NULL default '0',
  `scores` mediumint(8) NOT NULL default '0',
  `goodpost` mediumint(8) unsigned NOT NULL default '0',
  `badpost` mediumint(8) unsigned NOT NULL default '0',
  `nativeplace` smallint(5) unsigned NOT NULL default '0',
  `infotype` char(20) NOT NULL default '0',
  `body` mediumtext,
  `endtime` int(11) NOT NULL default '0',
  `tel` varchar(50) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `address` varchar(100) NOT NULL default '',
  `linkman` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `typeid` (`typeid`,`nativeplace`,`infotype`),
  KEY `channel` (`channel`,`arcrank`,`mid`,`click`,`title`,`litpic`,`senddate`,`flag`,`endtime`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `taddonshop`;
CREATE TABLE `taddonshop` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `body` mediumtext,
  `price` float NOT NULL default '0',
  `trueprice` float NOT NULL default '0',
  `brand` varchar(250) NOT NULL default '',
  `units` varchar(250) NOT NULL default '',
  `templet` varchar(30) NOT NULL,
  `userip` char(15) NOT NULL,
  `redirecturl` varchar(255) NOT NULL,
  `vocation` char(20) NOT NULL default '0',
  `infotype` char(20) NOT NULL default '0',
  `uptime` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `typeid` (`typeid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `taddonsoft`;
CREATE TABLE `taddonsoft` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `filetype` varchar(10) NOT NULL default '',
  `language` varchar(10) NOT NULL default '',
  `softtype` varchar(10) NOT NULL default '',
  `accredit` varchar(10) NOT NULL default '',
  `os` varchar(30) NOT NULL default '',
  `softrank` mediumint(8) unsigned NOT NULL default '0',
  `officialUrl` varchar(30) NOT NULL default '',
  `officialDemo` varchar(50) NOT NULL default '',
  `softsize` varchar(10) NOT NULL default '',
  `softlinks` text,
  `introduce` text,
  `daccess` smallint(5) NOT NULL default '0',
  `needmoney` smallint(5) NOT NULL default '0',
  `templet` varchar(30) NOT NULL default '',
  `userip` char(15) NOT NULL default '',
  `redirecturl` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `softMain` (`typeid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `taddonspec`;
CREATE TABLE `taddonspec` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `note` text,
  `templet` varchar(30) NOT NULL default '',
  `userip` char(15) NOT NULL default '',
  `redirecturl` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `typeid` (`typeid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `tadmin`;
CREATE TABLE `tadmin` (
  `id` int(10) unsigned NOT NULL,
  `usertype` float unsigned default '0',
  `userid` char(30) NOT NULL default '',
  `pwd` char(32) NOT NULL default '',
  `uname` char(20) NOT NULL default '',
  `tname` char(30) NOT NULL default '',
  `email` char(30) NOT NULL default '',
  `typeid` text,
  `logintime` int(10) unsigned NOT NULL default '0',
  `loginip` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tadmintype`;
CREATE TABLE `tadmintype` (
  `rank` float NOT NULL default '1',
  `typename` varchar(30) NOT NULL default '',
  `system` smallint(6) NOT NULL default '0',
  `purviews` text,
  PRIMARY KEY  (`rank`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tadvancedsearch`;
CREATE TABLE `tadvancedsearch` (
  `mid` int(11) NOT NULL,
  `maintable` varchar(256) NOT NULL default '',
  `mainfields` text,
  `addontable` varchar(256) default NULL,
  `addonfields` text,
  `forms` text,
  `template` varchar(256) NOT NULL default '',
  UNIQUE KEY `mid` (`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tarcatt`;
CREATE TABLE `tarcatt` (
  `sortid` smallint(6) NOT NULL default '0',
  `att` char(10) NOT NULL default '',
  `attname` char(30) NOT NULL default '',
  PRIMARY KEY  (`att`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tarccache`;
CREATE TABLE `tarccache` (
  `md5hash` char(32) NOT NULL default '',
  `uptime` int(11) NOT NULL default '0',
  `cachedata` mediumtext,
  PRIMARY KEY  (`md5hash`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tarchives`;
CREATE TABLE `tarchives` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `typeid2` varchar(90) NOT NULL default '0',
  `sortrank` int(10) unsigned NOT NULL default '0',
  `flag` set('c','h','p','f','s','j','a','b') default NULL,
  `ismake` smallint(6) NOT NULL default '0',
  `channel` smallint(6) NOT NULL default '1',
  `arcrank` smallint(6) NOT NULL default '0',
  `click` mediumint(8) unsigned NOT NULL default '0',
  `money` smallint(6) NOT NULL default '0',
  `title` char(60) NOT NULL default '',
  `shorttitle` char(36) NOT NULL default '',
  `color` char(7) NOT NULL default '',
  `writer` char(20) NOT NULL default '',
  `source` char(30) NOT NULL default '',
  `litpic` char(100) NOT NULL default '',
  `pubdate` int(10) unsigned NOT NULL default '0',
  `senddate` int(10) unsigned NOT NULL default '0',
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `keywords` char(30) NOT NULL default '',
  `lastpost` int(10) unsigned NOT NULL default '0',
  `scores` mediumint(8) NOT NULL default '0',
  `goodpost` mediumint(8) unsigned NOT NULL default '0',
  `badpost` mediumint(8) unsigned NOT NULL default '0',
  `voteid` mediumint(8) NOT NULL,
  `notpost` tinyint(1) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `filename` varchar(40) NOT NULL default '',
  `dutyadmin` mediumint(8) unsigned NOT NULL default '0',
  `tackid` int(10) NOT NULL default '0',
  `mtype` mediumint(8) unsigned NOT NULL default '0',
  `weight` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `sortrank` (`sortrank`),
  KEY `mainindex` (`arcrank`,`typeid`,`channel`,`flag`,`mid`),
  KEY `lastpost` (`lastpost`,`scores`,`goodpost`,`badpost`,`notpost`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `tarcmulti`;
CREATE TABLE `tarcmulti` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `tagid` char(60) NOT NULL default '',
  `uptime` int(11) NOT NULL default '0',
  `innertext` varchar(255) NOT NULL default '',
  `pagesize` int(11) NOT NULL default '0',
  `arcids` text NOT NULL,
  `ordersql` varchar(255) default NULL,
  `addfieldsSql` varchar(255) default NULL,
  `addfieldsSqlJoin` varchar(255) default NULL,
  `attstr` text,
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tarcrank`;
CREATE TABLE `tarcrank` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `rank` smallint(6) NOT NULL default '0',
  `membername` char(20) NOT NULL default '',
  `adminrank` smallint(6) NOT NULL default '0',
  `money` smallint(8) unsigned NOT NULL default '500',
  `scores` mediumint(8) NOT NULL default '0',
  `purviews` mediumtext,
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tarctiny`;
CREATE TABLE `tarctiny` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `typeid2` varchar(90) NOT NULL default '0',
  `arcrank` smallint(6) NOT NULL default '0',
  `channel` smallint(5) NOT NULL default '1',
  `senddate` int(10) unsigned NOT NULL default '0',
  `sortrank` int(10) unsigned NOT NULL default '0',
  `mid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `sortrank` (`sortrank`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tarctype`;
CREATE TABLE `tarctype` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `reid` smallint(5) unsigned NOT NULL default '0',
  `topid` smallint(5) unsigned NOT NULL default '0',
  `sortrank` smallint(5) unsigned NOT NULL default '50',
  `typename` char(30) NOT NULL default '',
  `typedir` char(60) NOT NULL default '',
  `isdefault` smallint(6) NOT NULL default '0',
  `defaultname` char(15) NOT NULL default 'index.html',
  `issend` smallint(6) NOT NULL default '0',
  `channeltype` smallint(6) default '1',
  `maxpage` smallint(6) NOT NULL default '-1',
  `ispart` smallint(6) NOT NULL default '0',
  `corank` smallint(6) NOT NULL default '0',
  `tempindex` char(50) NOT NULL default '',
  `templist` char(50) NOT NULL default '',
  `temparticle` char(50) NOT NULL default '',
  `namerule` char(50) NOT NULL default '',
  `namerule2` char(50) NOT NULL default '',
  `modname` char(20) NOT NULL default '',
  `description` char(150) NOT NULL default '',
  `keywords` varchar(60) NOT NULL default '',
  `seotitle` varchar(80) NOT NULL default '',
  `moresite` tinyint(1) unsigned NOT NULL default '0',
  `sitepath` char(60) NOT NULL default '',
  `siteurl` char(50) NOT NULL default '',
  `ishidden` smallint(6) NOT NULL default '0',
  `cross` tinyint(1) NOT NULL default '0',
  `crossid` text,
  `content` text,
  `smalltypes` text,
  PRIMARY KEY  (`id`),
  KEY `reid` (`reid`,`isdefault`,`channeltype`,`ispart`,`corank`,`topid`,`ishidden`),
  KEY `sortrank` (`sortrank`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tarea`;
CREATE TABLE `tarea` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL default '',
  `reid` int(10) unsigned NOT NULL default '0',
  `disorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tchanneltype`;
CREATE TABLE `tchanneltype` (
  `id` smallint(6) NOT NULL default '0',
  `nid` varchar(20) NOT NULL default '',
  `typename` varchar(30) NOT NULL default '',
  `maintable` varchar(50) NOT NULL default 'tarchives',
  `addtable` varchar(50) NOT NULL default '',
  `addcon` varchar(30) NOT NULL default '',
  `mancon` varchar(30) NOT NULL default '',
  `editcon` varchar(30) NOT NULL default '',
  `useraddcon` varchar(30) NOT NULL default '',
  `usermancon` varchar(30) NOT NULL default '',
  `usereditcon` varchar(30) NOT NULL default '',
  `fieldset` text,
  `listfields` text,
  `allfields` text,
  `issystem` smallint(6) NOT NULL default '0',
  `isshow` smallint(6) NOT NULL default '1',
  `issend` smallint(6) NOT NULL default '0',
  `arcsta` smallint(6) NOT NULL default '-1',
  `usertype` char(10) NOT NULL default '',
  `sendrank` smallint(6) NOT NULL default '10',
  `isdefault` smallint(6) NOT NULL default '0',
  `needdes` tinyint(1) NOT NULL default '1',
  `needpic` tinyint(1) NOT NULL default '1',
  `titlename` varchar(20) NOT NULL default '标题',
  `onlyone` smallint(6) NOT NULL default '0',
  `dfcid` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `nid` (`nid`,`isshow`,`arcsta`,`sendrank`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tco_htmls`;
CREATE TABLE `tco_htmls` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `nid` mediumint(8) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(60) NOT NULL default '',
  `litpic` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `dtime` int(10) unsigned NOT NULL default '0',
  `isdown` tinyint(1) unsigned NOT NULL default '0',
  `isexport` tinyint(1) NOT NULL default '0',
  `result` mediumtext,
  PRIMARY KEY  (`aid`),
  KEY `nid` (`nid`),
  KEY `typeid` (`typeid`,`title`,`url`,`dtime`,`isdown`,`isexport`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tco_mediaurls`;
CREATE TABLE `tco_mediaurls` (
  `nid` mediumint(8) unsigned NOT NULL default '0',
  `hash` char(32) NOT NULL default '',
  `tofile` char(60) NOT NULL default '',
  KEY `hash` (`hash`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tco_note`;
CREATE TABLE `tco_note` (
  `nid` mediumint(8) unsigned NOT NULL auto_increment,
  `channelid` smallint(5) unsigned NOT NULL default '0',
  `notename` varchar(50) NOT NULL default '',
  `sourcelang` varchar(10) NOT NULL default 'gb2312',
  `uptime` int(10) unsigned NOT NULL default '0',
  `cotime` int(10) unsigned NOT NULL default '0',
  `pnum` smallint(5) unsigned NOT NULL default '0',
  `isok` tinyint(1) unsigned NOT NULL default '0',
  `usemore` tinyint(1) unsigned NOT NULL default '0',
  `listconfig` text,
  `itemconfig` text,
  PRIMARY KEY  (`nid`),
  KEY `isok` (`isok`,`channelid`,`cotime`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tco_onepage`;
CREATE TABLE `tco_onepage` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(60) NOT NULL default '',
  `title` varchar(60) NOT NULL default '',
  `issource` smallint(6) NOT NULL default '1',
  `lang` varchar(10) NOT NULL default 'gb2312',
  `rule` text,
  PRIMARY KEY  (`id`),
  KEY `url` (`url`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tco_urls`;
CREATE TABLE `tco_urls` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `nid` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tdiyforms`;
CREATE TABLE `tdiyforms` (
  `diyid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `posttemplate` varchar(50) NOT NULL,
  `viewtemplate` varchar(50) NOT NULL,
  `listtemplate` varchar(50) NOT NULL,
  `table` varchar(50) NOT NULL default '',
  `info` text,
  `public` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`diyid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tdownloads`;
CREATE TABLE `tdownloads` (
  `hash` char(32) NOT NULL,
  `id` int(10) unsigned NOT NULL default '0',
  `downloads` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`hash`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `terradd`;
CREATE TABLE `terradd` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `aid` mediumint(8) unsigned NOT NULL,
  `mid` mediumint(8) unsigned default NULL,
  `title` char(60) NOT NULL default '',
  `type` smallint(6) NOT NULL default '0',
  `errtxt` mediumtext,
  `oktxt` mediumtext,
  `sendtime` int(10) unsigned NOT NULL default '0',
  KEY `id` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tfeedback`;
CREATE TABLE `tfeedback` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `aid` mediumint(8) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL default '',
  `arctitle` varchar(60) NOT NULL default '',
  `ip` char(15) NOT NULL default '',
  `ischeck` smallint(6) NOT NULL default '0',
  `dtime` int(10) unsigned NOT NULL default '0',
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `bad` mediumint(8) unsigned NOT NULL default '0',
  `good` mediumint(8) unsigned NOT NULL default '0',
  `ftype` set('feedback','good','bad') NOT NULL default 'feedback',
  `face` smallint(5) unsigned NOT NULL default '0',
  `msg` text,
  PRIMARY KEY  (`id`),
  KEY `aid` (`aid`,`ischeck`,`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tflink`;
CREATE TABLE `tflink` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `sortrank` smallint(6) NOT NULL default '0',
  `url` char(60) NOT NULL default '',
  `webname` char(30) NOT NULL default '',
  `msg` char(200) NOT NULL default '',
  `email` char(50) NOT NULL default '',
  `logo` char(60) NOT NULL default '',
  `dtime` int(10) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `ischeck` smallint(6) NOT NULL default '1',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tflinktype`;
CREATE TABLE `tflinktype` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `typename` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tfreelist`;
CREATE TABLE `tfreelist` (
  `aid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `namerule` varchar(50) NOT NULL default '',
  `listdir` varchar(60) NOT NULL default '',
  `defaultpage` varchar(20) NOT NULL default '',
  `nodefault` smallint(6) NOT NULL default '0',
  `templet` varchar(50) NOT NULL default '',
  `edtime` int(11) NOT NULL default '0',
  `maxpage` smallint(5) unsigned NOT NULL default '100',
  `click` int(11) NOT NULL default '1',
  `listtag` mediumtext,
  `keywords` varchar(100) NOT NULL default '',
  `description` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`aid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `thomepageset`;
CREATE TABLE `thomepageset` (
  `templet` char(50) NOT NULL default '',
  `position` char(30) NOT NULL default '',
  `showmod` tinyint(2) NOT NULL default '1'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tkeywords`;
CREATE TABLE `tkeywords` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `keyword` char(16) NOT NULL default '',
  `rank` mediumint(8) unsigned NOT NULL default '0',
  `sta` smallint(6) NOT NULL default '1',
  `rpurl` char(60) NOT NULL default '',
  PRIMARY KEY  (`aid`),
  KEY `keyword` (`keyword`,`rank`,`sta`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tlog`;
CREATE TABLE `tlog` (
  `lid` mediumint(8) unsigned NOT NULL auto_increment,
  `adminid` smallint(8) unsigned NOT NULL default '0',
  `filename` char(60) NOT NULL default '',
  `method` char(10) NOT NULL default '',
  `query` char(200) NOT NULL default '',
  `cip` char(15) NOT NULL default '',
  `dtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`lid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember`;
CREATE TABLE `tmember` (
  `mid` mediumint(8) unsigned NOT NULL auto_increment,
  `mtype` varchar(20) NOT NULL default '个人',
  `userid` char(20) NOT NULL default '',
  `pwd` char(32) NOT NULL default '',
  `uname` char(36) NOT NULL default '',
  `sex` enum('男','女','保密') NOT NULL default '保密',
  `rank` smallint(5) unsigned NOT NULL default '0',
  `uptime` int(11) NOT NULL default '0',
  `exptime` smallint(6) NOT NULL default '0',
  `money` mediumint(8) unsigned NOT NULL default '0',
  `email` char(50) NOT NULL default '',
  `scores` mediumint(8) unsigned NOT NULL default '0',
  `matt` smallint(5) unsigned NOT NULL default '0',
  `spacesta` smallint(6) NOT NULL default '0',
  `face` char(50) NOT NULL default '',
  `safequestion` smallint(5) unsigned NOT NULL default '0',
  `safeanswer` char(30) NOT NULL default '',
  `jointime` int(10) unsigned NOT NULL default '0',
  `joinip` char(16) NOT NULL default '',
  `logintime` int(10) unsigned NOT NULL default '0',
  `loginip` char(16) NOT NULL default '',
  `checkmail` smallint(6) NOT NULL default '-1',
  PRIMARY KEY  (`mid`),
  KEY `userid` (`userid`,`sex`),
  KEY `logintime` (`logintime`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_company`;
CREATE TABLE `tmember_company` (
  `mid` mediumint(8) NOT NULL auto_increment,
  `company` varchar(36) NOT NULL default '',
  `product` varchar(50) NOT NULL default '',
  `place` smallint(5) unsigned NOT NULL default '0',
  `vocation` smallint(5) unsigned NOT NULL default '0',
  `cosize` smallint(5) unsigned NOT NULL default '0',
  `tel` varchar(30) NOT NULL default '',
  `fax` varchar(30) NOT NULL default '',
  `linkman` varchar(20) NOT NULL default '',
  `address` varchar(50) NOT NULL default '',
  `mobile` varchar(30) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `url` varchar(50) NOT NULL default '',
  `uptime` int(10) unsigned NOT NULL default '0',
  `checked` tinyint(1) unsigned NOT NULL default '0',
  `introduce` text,
  `comface` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_feed`;
CREATE TABLE `tmember_feed` (
  `fid` mediumint(8) unsigned NOT NULL auto_increment,
  `mid` smallint(8) unsigned NOT NULL default '0',
  `userid` char(20) NOT NULL default '',
  `uname` char(36) NOT NULL default '',
  `type` char(20) character set gb2312 NOT NULL default '0',
  `aid` mediumint(8) NOT NULL default '0',
  `dtime` int(10) unsigned NOT NULL default '0',
  `title` char(253) NOT NULL,
  `note` char(200) NOT NULL default '',
  `ischeck` smallint(6) NOT NULL,
  PRIMARY KEY  (`fid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_flink`;
CREATE TABLE `tmember_flink` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `title` varchar(30) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`aid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_friends`;
CREATE TABLE `tmember_friends` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fid` mediumint(8) unsigned NOT NULL default '0',
  `floginid` char(20) NOT NULL default '',
  `funame` char(36) NOT NULL default '',
  `mid` mediumint(8) NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `ftype` tinyint(4) NOT NULL default '0',
  `groupid` int(8) NOT NULL default '1',
  `description` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fid` (`fid`,`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_group`;
CREATE TABLE `tmember_group` (
  `id` int(10) NOT NULL auto_increment,
  `groupname` varchar(50) NOT NULL,
  `mid` int(8) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_guestbook`;
CREATE TABLE `tmember_guestbook` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `gid` varchar(20) NOT NULL default '0',
  `title` varchar(60) NOT NULL default '',
  `uname` varchar(50) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `qq` varchar(50) NOT NULL default '',
  `tel` varchar(50) NOT NULL default '',
  `ip` varchar(20) NOT NULL default '',
  `dtime` int(10) unsigned NOT NULL default '0',
  `msg` text,
  PRIMARY KEY  (`aid`),
  KEY `mid` (`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_model`;
CREATE TABLE `tmember_model` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `table` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `state` int(2) NOT NULL default '0',
  `issystem` int(2) NOT NULL default '0',
  `info` text NOT NULL,
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_msg`;
CREATE TABLE `tmember_msg` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `userid` char(20) NOT NULL default '',
  `ip` char(15) NOT NULL default '',
  `ischeck` smallint(6) NOT NULL default '0',
  `dtime` int(10) unsigned NOT NULL default '0',
  `msg` text,
  PRIMARY KEY  (`id`),
  KEY `id` (`ischeck`,`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_operation`;
CREATE TABLE `tmember_operation` (
  `aid` int(11) NOT NULL auto_increment,
  `buyid` varchar(80) NOT NULL default '',
  `pname` varchar(50) NOT NULL default '',
  `product` varchar(10) NOT NULL default '',
  `money` int(11) NOT NULL default '0',
  `mtime` int(11) NOT NULL default '0',
  `pid` int(11) NOT NULL default '0',
  `mid` int(11) NOT NULL default '0',
  `sta` int(11) NOT NULL default '0',
  `oldinfo` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`aid`),
  KEY `buyid` (`buyid`),
  KEY `pid` (`pid`,`mid`,`sta`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_person`;
CREATE TABLE `tmember_person` (
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `onlynet` tinyint(1) unsigned NOT NULL default '1',
  `sex` enum('男','女','保密') NOT NULL default '男',
  `uname` char(30) NOT NULL default '',
  `qq` char(12) NOT NULL default '',
  `msn` char(50) NOT NULL default '',
  `tel` varchar(15) NOT NULL default '',
  `mobile` varchar(15) NOT NULL default '',
  `place` smallint(5) unsigned NOT NULL default '0',
  `oldplace` smallint(5) unsigned NOT NULL default '0',
  `birthday` date NOT NULL default '1980-01-01',
  `star` smallint(6) unsigned NOT NULL default '1',
  `income` smallint(6) NOT NULL default '0',
  `education` smallint(6) NOT NULL default '0',
  `height` smallint(5) unsigned NOT NULL default '160',
  `bodytype` smallint(6) NOT NULL default '0',
  `blood` smallint(6) NOT NULL default '0',
  `vocation` smallint(6) NOT NULL default '0',
  `smoke` smallint(6) NOT NULL default '0',
  `marital` smallint(6) NOT NULL default '0',
  `house` smallint(6) NOT NULL default '0',
  `drink` smallint(6) NOT NULL default '0',
  `datingtype` smallint(6) NOT NULL default '0',
  `language` set('普通话','上海话','广东话','英语','日语','韩语','法语','意大利语','德语','西班牙语','俄语','阿拉伯语') default NULL,
  `nature` set('性格外向','性格内向','活泼开朗','豪放不羁','患得患失','冲动','幽默','稳重','轻浮','沉默寡言','多愁善感','时喜时悲','附庸风雅','能说会道','坚强','脆弱','幼稚','成熟','快言快语','损人利己','狡猾善变','交际广泛','优柔寡断','自私','真诚','独立','依赖','难以琢磨','悲观消极','郁郁寡欢','胆小怕事','乐观向上','任性','自负','自卑','拜金','温柔体贴','小心翼翼','暴力倾向','逆来顺受','不拘小节','暴躁','倔强','豪爽','害羞','婆婆妈妈','敢做敢当','助人为乐','耿直','虚伪','孤僻','老实','守旧','敏感','迟钝','婆婆妈妈','武断','果断','刻薄') default NULL,
  `lovemsg` varchar(100) NOT NULL default '',
  `address` varchar(50) NOT NULL default '',
  `uptime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_pms`;
CREATE TABLE `tmember_pms` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `floginid` varchar(20) NOT NULL default '',
  `fromid` mediumint(8) unsigned NOT NULL default '0',
  `toid` mediumint(8) unsigned NOT NULL default '0',
  `tologinid` char(20) NOT NULL default '',
  `folder` enum('inbox','outbox') default 'inbox',
  `subject` varchar(60) NOT NULL default '',
  `sendtime` int(10) unsigned NOT NULL default '0',
  `writetime` int(10) unsigned NOT NULL default '0',
  `hasview` tinyint(1) unsigned NOT NULL default '0',
  `isadmin` tinyint(1) NOT NULL default '0',
  `message` text,
  PRIMARY KEY  (`id`),
  KEY `sendtime` (`sendtime`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_snsmsg`;
CREATE TABLE `tmember_snsmsg` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `userid` varchar(20) NOT NULL,
  `sendtime` int(10) unsigned NOT NULL default '0',
  `msg` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_space`;
CREATE TABLE `tmember_space` (
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `pagesize` smallint(5) unsigned NOT NULL default '10',
  `matt` smallint(6) NOT NULL default '0',
  `spacename` varchar(50) NOT NULL default '',
  `spacelogo` varchar(50) NOT NULL default '',
  `spacestyle` varchar(20) NOT NULL default '',
  `sign` varchar(100) NOT NULL default '没签名',
  `spacenews` text,
  PRIMARY KEY  (`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_stow`;
CREATE TABLE `tmember_stow` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `aid` mediumint(8) unsigned NOT NULL default '0',
  `title` char(60) NOT NULL default '',
  `addtime` int(10) unsigned NOT NULL default '0',
  `type` varchar(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `uid` (`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_stowtype`;
CREATE TABLE `tmember_stowtype` (
  `stowname` varchar(30) NOT NULL,
  `indexname` varchar(30) NOT NULL,
  `indexurl` varchar(50) NOT NULL,
  PRIMARY KEY  (`stowname`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_tj`;
CREATE TABLE `tmember_tj` (
  `mid` mediumint(8) NOT NULL auto_increment,
  `article` smallint(5) unsigned NOT NULL default '0',
  `album` smallint(5) unsigned NOT NULL default '0',
  `archives` smallint(5) unsigned NOT NULL default '0',
  `homecount` int(10) unsigned NOT NULL default '0',
  `pagecount` int(10) unsigned NOT NULL default '0',
  `feedback` mediumint(8) unsigned NOT NULL default '0',
  `friend` smallint(5) unsigned NOT NULL default '0',
  `stow` smallint(5) unsigned NOT NULL default '0',
  `soft` int(10) NOT NULL default '0',
  `info` int(10) NOT NULL default '0',
  `shop` int(10) NOT NULL default '0',
  PRIMARY KEY  (`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_type`;
CREATE TABLE `tmember_type` (
  `aid` int(11) NOT NULL auto_increment,
  `rank` int(11) NOT NULL default '0',
  `pname` varchar(50) NOT NULL default '',
  `money` int(11) NOT NULL default '0',
  `exptime` int(11) NOT NULL default '30',
  PRIMARY KEY  (`aid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmember_vhistory`;
CREATE TABLE `tmember_vhistory` (
  `id` int(10) NOT NULL auto_increment,
  `mid` mediumint(8) unsigned NOT NULL default '0',
  `loginid` char(20) NOT NULL default '',
  `vid` mediumint(8) unsigned NOT NULL default '0',
  `vloginid` char(20) NOT NULL default '',
  `count` smallint(5) unsigned NOT NULL default '0',
  `vip` char(15) NOT NULL default '',
  `vtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `vtime` (`vtime`),
  KEY `mid` (`mid`,`vid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmoneycard_record`;
CREATE TABLE `tmoneycard_record` (
  `aid` int(11) NOT NULL auto_increment,
  `ctid` int(11) NOT NULL default '0',
  `cardid` varchar(50) NOT NULL default '',
  `uid` int(11) NOT NULL default '0',
  `isexp` smallint(6) NOT NULL default '0',
  `mtime` int(11) NOT NULL default '0',
  `utime` int(11) NOT NULL default '0',
  `money` int(11) NOT NULL default '0',
  `num` int(11) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  KEY `ctid` (`ctid`),
  KEY `cardid` (`cardid`),
  KEY `uid` (`uid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmoneycard_type`;
CREATE TABLE `tmoneycard_type` (
  `tid` int(11) NOT NULL auto_increment,
  `num` int(11) NOT NULL default '500',
  `money` int(11) NOT NULL default '50',
  `pname` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`tid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmtypes`;
CREATE TABLE `tmtypes` (
  `mtypeid` mediumint(8) unsigned NOT NULL auto_increment,
  `mtypename` char(40) NOT NULL,
  `channelid` smallint(6) NOT NULL default '1',
  `mid` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mtypeid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmultiserv_config`;
CREATE TABLE `tmultiserv_config` (
  `remoteuploads` smallint(6) NOT NULL default '0',
  `remoteupUrl` text NOT NULL,
  `rminfo` text,
  `servinfo` mediumtext,
  PRIMARY KEY  (`remoteuploads`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmyad`;
CREATE TABLE `tmyad` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `clsid` smallint(5) NOT NULL default 0,
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `tagname` varchar(30) NOT NULL default '',
  `adname` varchar(60) NOT NULL default '',
  `timeset` smallint(6) NOT NULL default '0',
  `starttime` int(10) unsigned NOT NULL default '0',
  `endtime` int(10) unsigned NOT NULL default '0',
  `normbody` text,
  `expbody` text,
  PRIMARY KEY  (`aid`),
  KEY `tagname` (`tagname`,`typeid`,`timeset`,`endtime`,`starttime`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmytag`;
CREATE TABLE `tmytag` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `tagname` varchar(30) NOT NULL default '',
  `timeset` smallint(6) NOT NULL default '0',
  `starttime` int(10) unsigned NOT NULL default '0',
  `endtime` int(10) unsigned NOT NULL default '0',
  `normbody` text,
  `expbody` text,
  PRIMARY KEY  (`aid`),
  KEY `tagname` (`tagname`,`typeid`,`timeset`,`endtime`,`starttime`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tpayment`;
CREATE TABLE `tpayment` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `code` varchar(20) NOT NULL default '',
  `name` varchar(120) NOT NULL default '',
  `fee` varchar(10) NOT NULL default '0',
  `description` text NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL default '0',
  `config` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `cod` tinyint(1) unsigned NOT NULL default '0',
  `online` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tplus`;
CREATE TABLE `tplus` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `plusname` varchar(30) NOT NULL default '',
  `menustring` varchar(200) NOT NULL default '',
  `mainurl` varchar(50) NOT NULL default '',
  `writer` varchar(30) NOT NULL default '',
  `isshow` smallint(6) NOT NULL default '1',
  `filelist` text,
  PRIMARY KEY  (`aid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tpurview`;
CREATE TABLE `tpurview` (
  `mid` mediumint(8) default '0',
  `typeid` smallint(5) default '0',
  `rank` smallint(6) default NULL,
  `pkey` varchar(30) character set latin1 NOT NULL,
  `pvalue` text NOT NULL,
  KEY `pkey` USING BTREE (`pkey`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tpwd_tmp`;
CREATE TABLE `tpwd_tmp` (
  `mid` mediumint(8) NOT NULL,
  `membername` char(16) NOT NULL default '',
  `pwd` char(32) NOT NULL default '',
  `mailtime` int(10) NOT NULL default '0',
  PRIMARY KEY  (`mid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tratings`;
CREATE TABLE `tratings` (
  `id` varchar(11) NOT NULL,
  `total_votes` int(11) NOT NULL default '0',
  `total_value` int(11) NOT NULL default '0',
  `used_ips` longtext,
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tscores`;
CREATE TABLE `tscores` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `titles` char(15) NOT NULL,
  `icon` smallint(6) unsigned default '0',
  `integral` int(10) NOT NULL default '0',
  `isdefault` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `integral` (`integral`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsearch_cache`;
CREATE TABLE `tsearch_cache` (
  `hash` char(32) NOT NULL,
  `lasttime` int(10) unsigned NOT NULL default '0',
  `rsnum` mediumint(8) unsigned NOT NULL default '0',
  `ids` mediumtext,
  PRIMARY KEY  (`hash`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsearch_keywords`;
CREATE TABLE `tsearch_keywords` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `keyword` char(30) NOT NULL default '',
  `spwords` char(50) NOT NULL default '',
  `count` mediumint(8) unsigned NOT NULL default '1',
  `result` mediumint(8) unsigned NOT NULL default '0',
  `lasttime` int(10) unsigned NOT NULL default '0',
  `channelid` smallint(5) unsigned NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`aid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsgpage`;
CREATE TABLE `tsgpage` (
  `aid` smallint(5) unsigned NOT NULL auto_increment,
  `title` varchar(60) NOT NULL default '',
  `ismake` smallint(6) NOT NULL default '1',
  `filename` varchar(60) NOT NULL default '',
  `keywords` varchar(30) NOT NULL default '',
  `template` varchar(30) NOT NULL default '',
  `likeid` varchar(20) NOT NULL default '',
  `description` varchar(250) NOT NULL default '',
  `uptime` int(10) unsigned NOT NULL default '0',
  `body` mediumtext,
  PRIMARY KEY  (`aid`),
  KEY `ismake` (`ismake`,`uptime`),
  KEY `likeid` (`likeid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tshops_delivery`;
CREATE TABLE `tshops_delivery` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `dname` char(80) NOT NULL,
  `price` float(13,2) NOT NULL default '0.00',
  `des` char(255) default NULL,
  `orders` int(10) NOT NULL default '0',
  PRIMARY KEY  (`pid`),
  KEY `orders` (`orders`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tshops_orders`;
CREATE TABLE `tshops_orders` (
  `oid` varchar(80) NOT NULL,
  `userid` int(10) NOT NULL,
  `pid` int(10) NOT NULL default '0',
  `paytype` tinyint(2) NOT NULL default '1',
  `cartcount` int(10) NOT NULL default '0',
  `dprice` float(13,2) NOT NULL default '0.00',
  `price` float(13,2) NOT NULL default '0.00',
  `priceCount` float(13,2) NOT NULL,
  `state` tinyint(1) NOT NULL default '0',
  `ip` char(15) NOT NULL default '',
  `stime` int(10) NOT NULL default '0',
  KEY `stime` (`stime`),
  KEY `userid` (`userid`),
  KEY `oid` (`oid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tshops_products`;
CREATE TABLE `tshops_products` (
  `aid` mediumint(8) NOT NULL default '0',
  `oid` varchar(80) NOT NULL default '',
  `userid` int(10) NOT NULL,
  `title` varchar(80) NOT NULL default '',
  `price` float(13,2) NOT NULL default '0.00',
  `buynum` int(10) NOT NULL default '9',
  KEY `oid` (`oid`),
  KEY `userid` (`userid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tshops_userinfo`;
CREATE TABLE `tshops_userinfo` (
  `userid` int(10) NOT NULL,
  `oid` varchar(80) NOT NULL default '',
  `consignee` char(15) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `zip` int(10) NOT NULL default '0',
  `tel` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `des` varchar(255) NOT NULL default '',
  KEY `oid` (`oid`),
  KEY `userid` (`userid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsoftconfig`;
CREATE TABLE `tsoftconfig` (
  `downtype` smallint(6) NOT NULL default '0',
  `ismoresite` smallint(6) NOT NULL default '0',
  `gotojump` smallint(6) NOT NULL default '0',
  `islocal` smallint(5) unsigned NOT NULL default '1',
  `sites` text,
  `downmsg` text,
  `moresitedo` smallint(5) unsigned NOT NULL default '1',
  `dfrank` smallint(5) unsigned NOT NULL default '0',
  `dfywboy` smallint(5) unsigned NOT NULL default '0',
  `argrange` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`downtype`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsphinx`;
CREATE TABLE `tsphinx` (
  `countid` int(11) unsigned NOT NULL,
  `maxaid` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`countid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tstepselect`;
CREATE TABLE `tstepselect` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `itemname` char(30) default NULL,
  `egroup` char(20) default NULL,
  `issign` tinyint(1) unsigned default '0',
  `issystem` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_enum`;
CREATE TABLE `tsys_enum` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `ename` char(30) NOT NULL default '',
  `evalue` char(20) NOT NULL default '0',
  `egroup` char(20) NOT NULL default '',
  `disorder` smallint(5) unsigned NOT NULL default '0',
  `issign` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_module`;
CREATE TABLE `tsys_module` (
  `id` int(11) NOT NULL auto_increment,
  `hashcode` char(32) NOT NULL default '',
  `modname` varchar(30) NOT NULL default '',
  `indexname` varchar(20) NOT NULL default '',
  `indexurl` varchar(30) NOT NULL default '',
  `ismember` tinyint(4) NOT NULL default '1',
  `menustring` text,
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_set`;
CREATE TABLE `tsys_set` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `sname` char(20) NOT NULL default '',
  `items` text,
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_task`;
CREATE TABLE `tsys_task` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `taskname` varchar(50) NOT NULL,
  `dourl` varchar(100) NOT NULL,
  `islock` tinyint(1) unsigned NOT NULL default '0',
  `runtype` tinyint(1) unsigned NOT NULL default '0',
  `runtime` varchar(10) default '0000',
  `starttime` int(10) unsigned NOT NULL default '0',
  `endtime` int(10) unsigned NOT NULL default '0',
  `freq` tinyint(2) unsigned NOT NULL default '0',
  `lastrun` int(10) unsigned NOT NULL default '0',
  `description` varchar(250) NOT NULL,
  `parameter` text,
  `settime` int(10) unsigned NOT NULL default '0',
  `sta` enum('运行','成功','失败') default NULL,
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsysconfig`;
CREATE TABLE `tsysconfig` (
  `aid` smallint(8) unsigned NOT NULL default '0',
  `varname` varchar(20) NOT NULL default '',
  `info` varchar(100) NOT NULL default '',
  `groupid` smallint(6) NOT NULL default '1',
  `type` varchar(10) NOT NULL default 'string',
  `value` text,
  PRIMARY KEY  (`varname`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ttagindex`;
CREATE TABLE `ttagindex` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tag` char(12) NOT NULL default '',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `count` int(10) unsigned NOT NULL default '0',
  `total` int(10) unsigned NOT NULL default '0',
  `weekcc` int(10) unsigned NOT NULL default '0',
  `monthcc` int(10) unsigned NOT NULL default '0',
  `weekup` int(10) unsigned NOT NULL default '0',
  `monthup` int(10) unsigned NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ttaglist`;
CREATE TABLE `ttaglist` (
  `tid` int(10) unsigned NOT NULL default '0',
  `aid` int(10) unsigned NOT NULL default '0',
  `arcrank` smallint(6) NOT NULL default '0',
  `typeid` smallint(5) unsigned NOT NULL default '0',
  `tag` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`tid`,`aid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tuploads`;
CREATE TABLE `tuploads` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `arcid` mediumint(8) unsigned NOT NULL default '0',
  `title` char(60) NOT NULL default '',
  `url` char(80) NOT NULL default '',
  `mediatype` smallint(6) NOT NULL default '1',
  `width` char(10) NOT NULL default '',
  `height` char(10) NOT NULL default '',
  `playtime` char(10) NOT NULL default '',
  `filesize` mediumint(8) unsigned NOT NULL default '0',
  `uptime` int(10) unsigned NOT NULL default '0',
  `mid` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  KEY `memberid` (`mid`),
  KEY `arcid` (`arcid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tverifies`;
CREATE TABLE `tverifies` (
  `nameid` char(32) NOT NULL default '',
  `cthash` varchar(32) NOT NULL default '',
  `method` enum('local','official') NOT NULL default 'official',
  `filename` varchar(254) NOT NULL default '',
  PRIMARY KEY  (`nameid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tvote`;
CREATE TABLE `tvote` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `votename` varchar(50) NOT NULL default '',
  `starttime` int(10) unsigned NOT NULL default '0',
  `endtime` int(10) unsigned NOT NULL default '0',
  `totalcount` mediumint(8) unsigned NOT NULL default '0',
  `ismore` tinyint(6) NOT NULL default '0',
  `isallow` tinyint(6) NOT NULL default '0',
  `view` tinyint(6) NOT NULL default '0',
  `spec` int(20) unsigned NOT NULL default '0',
  `isenable` tinyint(6) NOT NULL default '0',
  `votenote` text,
  PRIMARY KEY  (`aid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tvote_member`;
CREATE TABLE `tvote_member` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `voteid` int(10) unsigned NOT NULL default '0',
  `userid` varchar(50) NOT NULL default '',
  `uptime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tdl_log`;
CREATE TABLE `tdl_log` (
  `id` mediumint(10) unsigned NOT NULL auto_increment,
  `ip` char(16) NOT NULL,
  `lang` char(6) NOT NULL,
  `dtype` varchar(10) NOT NULL,
  `dltime` int(10) unsigned NOT NULL default '0',
  `referrer` varchar(255) NOT NULL default '',
  `user_agent` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `dltime` (`dltime`),
  KEY `dl_ip` (`ip`,`dltime`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tmyadtype`;
CREATE TABLE `tmyadtype` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `typename` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tplus_seoinfo`;
CREATE TABLE `tplus_seoinfo` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`create_time` INT(11) NULL DEFAULT NULL,
	`alexa_num` VARCHAR(50) NULL DEFAULT NULL,
	`alexa_area_num` VARCHAR(50) NULL DEFAULT NULL,
	`baidu_count` VARCHAR(50) NULL DEFAULT NULL,
	`sogou_count` VARCHAR(50) NULL DEFAULT NULL,
	`haosou360_count` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tplus_mda_setting`;
CREATE TABLE `tplus_mda_setting` (
	`skey` VARCHAR(255) NOT NULL DEFAULT '',
	`svalue` TEXT NOT NULL,
	`stime` INT(10) NOT NULL,
	PRIMARY KEY (`skey`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;