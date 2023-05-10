-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- 服务器版本: 5.1.29
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '登录密码',
  `name` varchar(20)  NOT NULL COMMENT '姓名',
  `gender` varchar(4)  NOT NULL COMMENT '性别',
  `birthDate` varchar(20)  NULL COMMENT '出生日期',
  `userPhoto` varchar(60)  NOT NULL COMMENT '用户照片',
  `telephone` varchar(20)  NOT NULL COMMENT '联系电话',
  `email` varchar(50)  NOT NULL COMMENT '邮箱',
  `address` varchar(80)  NULL COMMENT '家庭地址',
  `regTime` varchar(20)  NULL COMMENT '注册时间',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_manager` (
  `managerUserName` varchar(20)  NOT NULL COMMENT 'managerUserName',
  `password` varchar(20)  NOT NULL COMMENT '登录密码',
  `name` varchar(20)  NOT NULL COMMENT '姓名',
  `sex` varchar(4)  NOT NULL COMMENT '性别',
  `telephone` varchar(20)  NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`managerUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_projectType` (
  `projectTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目性质id',
  `projectTypeName` varchar(20)  NOT NULL COMMENT '项目性质名称',
  PRIMARY KEY (`projectTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `projectTypeObj` int(11) NOT NULL COMMENT '项目类型',
  `projectName` varchar(20)  NOT NULL COMMENT '项目名称',
  `projectPhoto` varchar(60)  NOT NULL COMMENT '项目主图',
  `mainPerson` varchar(20)  NOT NULL COMMENT '负责人',
  `comeFrom` varchar(20)  NULL COMMENT '项目来源',
  `kydh` varchar(20)  NOT NULL COMMENT '科研代号',
  `startDate` varchar(20)  NULL COMMENT '开始日期',
  `endDate` varchar(20)  NULL COMMENT '结束日期',
  `kyMoney` float NOT NULL COMMENT '科研资金',
  `projectDesc` varchar(5000)  NOT NULL COMMENT '项目介绍',
  `userObj` varchar(30)  NOT NULL COMMENT '提交用户',
  `shzt` varchar(20)  NOT NULL COMMENT '审核状态',
  `shr` varchar(20)  NULL COMMENT '审核人',
  `shsj` varchar(20)  NULL COMMENT '审核时间',
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_thesis` (
  `thesisId` int(11) NOT NULL AUTO_INCREMENT COMMENT '论文id',
  `xkml` varchar(20)  NOT NULL COMMENT '学科门类',
  `name` varchar(20)  NOT NULL COMMENT '论文名称',
  `lwfm` varchar(60)  NOT NULL COMMENT '论文封面图',
  `author` varchar(20)  NOT NULL COMMENT '作者',
  `teacher` varchar(20)  NOT NULL COMMENT '指导老师',
  `publishDate` varchar(20)  NULL COMMENT '发布日期',
  `thesisDesc` varchar(5000)  NOT NULL COMMENT '论文介绍',
  `thesisFile` varchar(60)  NOT NULL COMMENT '论文文件',
  `xgyj` varchar(500)  NULL COMMENT '修改意见',
  `userObj` varchar(30)  NOT NULL COMMENT '提交用户',
  PRIMARY KEY (`thesisId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(80)  NOT NULL COMMENT '标题',
  `content` varchar(5000)  NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20)  NULL COMMENT '发布时间',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_project ADD CONSTRAINT FOREIGN KEY (projectTypeObj) REFERENCES t_projectType(projectTypeId);
ALTER TABLE t_project ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_thesis ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


