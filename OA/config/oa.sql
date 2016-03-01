/*
Navicat MySQL Data Transfer

Source Server         : Students
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : itcastoa_20120216

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-09-05 10:42:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `itcast_department`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_department`;
CREATE TABLE `itcast_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB56F87C7729C9286` (`parentId`),
  CONSTRAINT `FKB56F87C7729C9286` FOREIGN KEY (`parentId`) REFERENCES `itcast_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_department
-- ----------------------------

-- ----------------------------
-- Table structure for `itcast_forum`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_forum`;
CREATE TABLE `itcast_forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `topicCount` int(11) DEFAULT NULL,
  `articleCount` int(11) DEFAULT NULL,
  `lastTopicId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lastTopicId` (`lastTopicId`),
  KEY `FK903A938C1D89DB14` (`lastTopicId`),
  CONSTRAINT `FK903A938C1D89DB14` FOREIGN KEY (`lastTopicId`) REFERENCES `itcast_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_forum
-- ----------------------------
INSERT INTO `itcast_forum` VALUES ('4', 'java', '11', '4', '12', '12', '13');

-- ----------------------------
-- Table structure for `itcast_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_privilege`;
CREATE TABLE `itcast_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A54CF9CE7D51427` (`parentId`),
  CONSTRAINT `FK2A54CF9CE7D51427` FOREIGN KEY (`parentId`) REFERENCES `itcast_privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_privilege
-- ----------------------------
INSERT INTO `itcast_privilege` VALUES ('1', null, '系统管理', 'FUNC20082.gif', null);
INSERT INTO `itcast_privilege` VALUES ('2', 'roleAction_list', '岗位管理', null, '1');
INSERT INTO `itcast_privilege` VALUES ('3', 'departmentAction_list', '部门管理', null, '1');
INSERT INTO `itcast_privilege` VALUES ('4', 'userAction_list', '用户管理', null, '1');
INSERT INTO `itcast_privilege` VALUES ('5', 'roleAction_list', '岗位列表', null, '2');
INSERT INTO `itcast_privilege` VALUES ('6', 'roleAction_delete', '岗位删除', null, '2');
INSERT INTO `itcast_privilege` VALUES ('7', 'roleAction_add', '岗位添加', null, '2');
INSERT INTO `itcast_privilege` VALUES ('8', 'roleAction_edit', '岗位修改', null, '2');
INSERT INTO `itcast_privilege` VALUES ('9', 'departmentAction_list', '部门列表', null, '3');
INSERT INTO `itcast_privilege` VALUES ('10', 'departmentAction_delete', '部门删除', null, '3');
INSERT INTO `itcast_privilege` VALUES ('11', 'departmentAction_add', '部门添加', null, '3');
INSERT INTO `itcast_privilege` VALUES ('12', 'departmentAction_edit', '部门修改', null, '3');
INSERT INTO `itcast_privilege` VALUES ('13', 'userAction_list', '用户列表', null, '4');
INSERT INTO `itcast_privilege` VALUES ('14', 'userAction_delete', '用户删除', null, '4');
INSERT INTO `itcast_privilege` VALUES ('15', 'userAction_add', '用户添加', null, '4');
INSERT INTO `itcast_privilege` VALUES ('16', 'userAction_edit', '用户修改', null, '4');
INSERT INTO `itcast_privilege` VALUES ('17', 'userAction_initPassword', '用户初始化密码', null, '4');
INSERT INTO `itcast_privilege` VALUES ('18', null, '网上交流', 'FUNC20064.gif', null);
INSERT INTO `itcast_privilege` VALUES ('19', 'forumManageAction_list', '论坛管理', null, '18');
INSERT INTO `itcast_privilege` VALUES ('20', 'forumAction_list', '论坛', null, '18');
INSERT INTO `itcast_privilege` VALUES ('21', null, '审批流转', 'FUNC20057.gif', null);
INSERT INTO `itcast_privilege` VALUES ('22', 'processDefinitionAction_list', '审批流程管理', null, '21');
INSERT INTO `itcast_privilege` VALUES ('23', 'applicationTemplateAction_list', '申请模板管理', null, '21');
INSERT INTO `itcast_privilege` VALUES ('24', 'flowAction_applicationTemplateList', '起草申请', null, '21');
INSERT INTO `itcast_privilege` VALUES ('25', 'flowAction_myTaskList', '待我审批', null, '21');
INSERT INTO `itcast_privilege` VALUES ('26', 'flowAction_myApplicationList', '我的申请查询', null, '21');

-- ----------------------------
-- Table structure for `itcast_reply`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_reply`;
CREATE TABLE `itcast_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `faceIcon` varchar(255) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  `authorId` bigint(20) DEFAULT NULL,
  `topicId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90DF19551074626A` (`topicId`),
  KEY `FK90DF1955479FFEE0` (`authorId`),
  CONSTRAINT `FK90DF19551074626A` FOREIGN KEY (`topicId`) REFERENCES `itcast_topic` (`id`),
  CONSTRAINT `FK90DF1955479FFEE0` FOREIGN KEY (`authorId`) REFERENCES `itcast_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_reply
-- ----------------------------
INSERT INTO `itcast_reply` VALUES ('121', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `itcast_role`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_role`;
CREATE TABLE `itcast_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_role
-- ----------------------------
INSERT INTO `itcast_role` VALUES ('9', 'chengxuyuan', 'sasa');
INSERT INTO `itcast_role` VALUES ('10', 'fsdf', 'fss');

-- ----------------------------
-- Table structure for `itcast_role_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_role_privilege`;
CREATE TABLE `itcast_role_privilege` (
  `roleId` bigint(20) NOT NULL,
  `privilegeId` bigint(20) NOT NULL,
  PRIMARY KEY (`privilegeId`,`roleId`),
  KEY `FK350BD81DB0E19C6E` (`privilegeId`),
  KEY `FK350BD81DBB0AE3B6` (`roleId`),
  CONSTRAINT `FK350BD81DB0E19C6E` FOREIGN KEY (`privilegeId`) REFERENCES `itcast_privilege` (`id`),
  CONSTRAINT `FK350BD81DBB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `itcast_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_role_privilege
-- ----------------------------
INSERT INTO `itcast_role_privilege` VALUES ('9', '5');
INSERT INTO `itcast_role_privilege` VALUES ('9', '6');

-- ----------------------------
-- Table structure for `itcast_topic`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_topic`;
CREATE TABLE `itcast_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `faceIcon` varchar(255) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  `authorId` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `replyCount` int(11) DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `forumId` bigint(20) DEFAULT NULL,
  `lastReplyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lastReplyId` (`lastReplyId`),
  KEY `FK90FFD39AA28DE3CA` (`lastReplyId`),
  KEY `FK90FFD39A479FFEE0` (`authorId`),
  KEY `FK90FFD39A2B39ADCE` (`forumId`),
  CONSTRAINT `FK90FFD39A2B39ADCE` FOREIGN KEY (`forumId`) REFERENCES `itcast_forum` (`id`),
  CONSTRAINT `FK90FFD39A479FFEE0` FOREIGN KEY (`authorId`) REFERENCES `itcast_user` (`id`),
  CONSTRAINT `FK90FFD39AA28DE3CA` FOREIGN KEY (`lastReplyId`) REFERENCES `itcast_reply` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_topic
-- ----------------------------
INSERT INTO `itcast_topic` VALUES ('1', 'da jia hao', 'qwsqw', '7', '2015-09-01 20:25:22', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-01 20:25:22', null, null);
INSERT INTO `itcast_topic` VALUES ('2', 'aa', 'aa<br />', null, '2015-09-03 23:41:30', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:41:30', '4', null);
INSERT INTO `itcast_topic` VALUES ('3', 'bb', 'bb<br />', null, '2015-09-03 23:41:38', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:41:38', '4', null);
INSERT INTO `itcast_topic` VALUES ('4', 'ccc', 'ccc<br />', null, '2015-09-03 23:41:47', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:41:47', '4', null);
INSERT INTO `itcast_topic` VALUES ('5', 'dd', 'dd<br />', null, '2015-09-03 23:41:52', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:41:52', '4', null);
INSERT INTO `itcast_topic` VALUES ('6', 'ee', 'ee<br />', null, '2015-09-03 23:41:57', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:41:57', '4', null);
INSERT INTO `itcast_topic` VALUES ('7', 'ff', 'ff<br />', null, '2015-09-03 23:42:04', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:42:04', '4', null);
INSERT INTO `itcast_topic` VALUES ('8', 'ee', 'ee<br />', null, '2015-09-03 23:42:17', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:42:17', '4', null);
INSERT INTO `itcast_topic` VALUES ('9', 'gg', 'gg<br />', null, '2015-09-03 23:42:28', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:42:28', '4', null);
INSERT INTO `itcast_topic` VALUES ('10', 'qq', 'qq<br />', null, '2015-09-03 23:42:40', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:42:40', '4', null);
INSERT INTO `itcast_topic` VALUES ('11', 'rr', 'rrr<br />', null, '2015-09-03 23:42:46', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:42:46', '4', null);
INSERT INTO `itcast_topic` VALUES ('12', 'tt', 'tt<br />', null, '2015-09-03 23:42:50', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-03 23:42:50', '4', null);
INSERT INTO `itcast_topic` VALUES ('13', '哈啊 啊', '<div style=\"margin-left: 40px\"><img alt=\"\" src=\"http://localhost:8080/ItcastOA/fckeditor/editor/images/smiley/wangwang/0.gif\" /><span style=\"background-color: #ff6600\"><span style=\"font-size: 36px\">好好学习天天向上</span></span></div>', '7', '2015-09-04 10:24:14', '0:0:0:0:0:0:0:1', '9', '0', '0', '2015-09-04 10:24:14', '4', null);

-- ----------------------------
-- Table structure for `itcast_user`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_user`;
CREATE TABLE `itcast_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ADEC00F49BC32E` (`departmentId`),
  CONSTRAINT `FK4ADEC00F49BC32E` FOREIGN KEY (`departmentId`) REFERENCES `itcast_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_user
-- ----------------------------
INSERT INTO `itcast_user` VALUES ('9', '超级管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, null, null, null);
INSERT INTO `itcast_user` VALUES ('10', '小黄', 'xiaohuang', '81dc9bdb52d04dc20036dbd8313ed055', '男', '13750840029', '462608915@qq,com', 'aa', null);
INSERT INTO `itcast_user` VALUES ('11', '', 'f asf ', '81dc9bdb52d04dc20036dbd8313ed055', null, '', '', '', null);

-- ----------------------------
-- Table structure for `itcast_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_user_role`;
CREATE TABLE `itcast_user_role` (
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `FK9C95CD55BB0AE3B6` (`roleId`),
  KEY `FK9C95CD55C0603920` (`userId`),
  CONSTRAINT `FK9C95CD55BB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `itcast_role` (`id`),
  CONSTRAINT `FK9C95CD55C0603920` FOREIGN KEY (`userId`) REFERENCES `itcast_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_user_role
-- ----------------------------
INSERT INTO `itcast_user_role` VALUES ('10', '9');
