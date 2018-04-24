/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : schoolmanagement

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-04-24 10:18:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `class_name` varchar(10) DEFAULT NULL COMMENT '班级名称',
  `faculty_id` int(11) NOT NULL COMMENT '院系id',
  `class_counsellorid` int(11) DEFAULT NULL COMMENT '辅导员id',
  `class_schedule_card` varchar(50) DEFAULT NULL COMMENT '课程表图片地址',
  `class_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `class_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`),
  KEY `faculty_id` (`faculty_id`),
  KEY `class_counsellorid` (`class_counsellorid`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `class_ibfk_2` FOREIGN KEY (`class_counsellorid`) REFERENCES `teacher` (`teach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '云时代1班', '3', '4', 'ysd/ysd1.jpg', '2018-04-15 21:14:12', '2018-04-23 16:54:33');
INSERT INTO `class` VALUES ('2', '云时代2班', '3', '5', 'ysd/ysd2.jpg', '2018-04-15 21:14:32', '2018-04-19 23:47:46');
INSERT INTO `class` VALUES ('3', '云时代3班', '3', '6', 'ysd/ysd3.jpg', '2018-04-15 21:14:44', '2018-04-19 23:47:48');
INSERT INTO `class` VALUES ('4', '普通电商1班', '4', '6', null, '2018-04-20 17:50:01', '2018-04-20 17:50:01');
INSERT INTO `class` VALUES ('5', '会计1班', '5', '9', null, '2018-04-22 22:05:51', '2018-04-22 22:44:59');
INSERT INTO `class` VALUES ('6', '会计2班', '5', '16', null, '2018-04-22 22:44:41', '2018-04-22 22:44:41');

-- ----------------------------
-- Table structure for curriculum
-- ----------------------------
DROP TABLE IF EXISTS `curriculum`;
CREATE TABLE `curriculum` (
  `curriculum_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程表',
  `curriculum_name` varchar(10) NOT NULL,
  `curriculum_teacher` varchar(5) DEFAULT NULL,
  `curriculum_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `curriculum_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `curriculum_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`curriculum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of curriculum
-- ----------------------------
INSERT INTO `curriculum` VALUES ('1', '电子商务英语', '王猛', '。。。', '2018-04-19 23:39:16', '2018-04-23 17:30:42');
INSERT INTO `curriculum` VALUES ('2', 'java基础', '栗梧桐', '无', '2018-04-15 21:17:05', '2018-04-22 20:30:20');
INSERT INTO `curriculum` VALUES ('3', '大学语文', '路畅通', '无', '2018-04-15 21:17:10', '2018-04-22 20:30:20');
INSERT INTO `curriculum` VALUES ('4', '思想品德', '张三', '无', '2018-04-15 21:17:21', '2018-04-22 20:30:20');
INSERT INTO `curriculum` VALUES ('5', '体育', '李四', '无', '2018-04-15 21:17:24', '2018-04-22 20:30:20');
INSERT INTO `curriculum` VALUES ('6', '音乐鉴赏', '王麻子', null, '2018-04-15 21:17:29', '2018-04-19 23:39:57');
INSERT INTO `curriculum` VALUES ('7', 'spring', '张晨苹', '', '2018-04-20 14:50:28', '2018-04-20 16:15:05');
INSERT INTO `curriculum` VALUES ('8', '健美操', '李家辉', '', '2018-04-20 16:42:09', '2018-04-20 16:42:09');
INSERT INTO `curriculum` VALUES ('9', '没课', '没老师', '无', '2018-04-20 16:44:17', '2018-04-22 20:30:20');
INSERT INTO `curriculum` VALUES ('10', '1', '1', '无', '2018-04-20 16:49:22', '2018-04-22 20:30:20');
INSERT INTO `curriculum` VALUES ('11', '2', '2', '', '2018-04-20 16:49:58', '2018-04-20 16:49:58');
INSERT INTO `curriculum` VALUES ('12', '课程测试', '测试老师', '无', '2018-04-21 08:06:10', '2018-04-22 20:30:20');
INSERT INTO `curriculum` VALUES ('13', '地下城走位', '吕筱南', '中国网络游戏编年史作者', '2018-04-22 22:46:23', '2018-04-22 22:46:23');

-- ----------------------------
-- Table structure for curriculum_class
-- ----------------------------
DROP TABLE IF EXISTS `curriculum_class`;
CREATE TABLE `curriculum_class` (
  `curriculum_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculum_id` int(11) NOT NULL COMMENT '角色',
  `class_id` int(11) NOT NULL COMMENT '模块',
  `curriculum_class_remark` varchar(255) DEFAULT NULL,
  `curriculum_class_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `curriculum_class_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`curriculum_class_id`),
  KEY `role _id` (`curriculum_id`),
  KEY `module _id` (`class_id`),
  CONSTRAINT `curriculum_class_ibfk_1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`curriculum_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `curriculum_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of curriculum_class
-- ----------------------------
INSERT INTO `curriculum_class` VALUES ('1', '1', '1', '有', '2018-04-15 21:17:49', '2018-04-22 22:06:43');
INSERT INTO `curriculum_class` VALUES ('2', '2', '1', '无', '2018-04-15 21:17:54', '2018-04-22 22:06:43');
INSERT INTO `curriculum_class` VALUES ('3', '3', '1', '无', '2018-04-15 21:18:00', '2018-04-22 22:06:43');
INSERT INTO `curriculum_class` VALUES ('4', '4', '1', '无', '2018-04-15 21:18:04', '2018-04-22 22:06:43');
INSERT INTO `curriculum_class` VALUES ('5', '5', '1', '无', '2018-04-15 21:18:08', '2018-04-22 22:06:43');
INSERT INTO `curriculum_class` VALUES ('6', '1', '2', ' ', '2018-04-15 21:18:14', '2018-04-22 20:55:31');
INSERT INTO `curriculum_class` VALUES ('7', '2', '2', '123', '2018-04-15 21:18:20', '2018-04-22 20:52:27');
INSERT INTO `curriculum_class` VALUES ('8', '3', '2', null, '2018-04-15 21:18:28', '2018-04-15 21:18:28');
INSERT INTO `curriculum_class` VALUES ('9', '1', '3', null, '2018-04-15 21:18:34', '2018-04-15 21:18:34');
INSERT INTO `curriculum_class` VALUES ('10', '2', '3', null, '2018-04-15 21:18:47', '2018-04-15 21:18:47');
INSERT INTO `curriculum_class` VALUES ('11', '9', '1', '无', '2018-04-20 23:52:14', '2018-04-22 22:06:43');
INSERT INTO `curriculum_class` VALUES ('12', '12', '1', '无', '2018-04-21 08:06:49', '2018-04-22 21:19:05');
INSERT INTO `curriculum_class` VALUES ('13', '10', '1', '无', '2018-04-22 19:07:08', '2018-04-22 21:19:05');
INSERT INTO `curriculum_class` VALUES ('14', '12', '5', '没有老师', '2018-04-22 22:06:54', '2018-04-22 22:15:19');
INSERT INTO `curriculum_class` VALUES ('15', '1', '1', '11', '2018-04-22 22:08:32', '2018-04-22 22:08:37');
INSERT INTO `curriculum_class` VALUES ('16', '7', '1', null, '2018-04-22 22:09:08', '2018-04-22 22:09:08');
INSERT INTO `curriculum_class` VALUES ('17', '13', '4', null, '2018-04-22 22:47:10', '2018-04-22 22:47:10');

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '院系id',
  `text` varchar(10) NOT NULL COMMENT '院系名称',
  `faculty_parentid` int(11) NOT NULL COMMENT '该院系父节点',
  `faculty_remark` varchar(100) DEFAULT NULL COMMENT '院系备注',
  `faculty_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `faculty_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faculty
-- ----------------------------
INSERT INTO `faculty` VALUES ('2', '管理学院', '0', '', '2018-04-15 18:42:33', '2018-04-19 16:41:30');
INSERT INTO `faculty` VALUES ('3', '经济管理系', '2', '', '2018-04-15 21:00:51', '2018-04-19 16:41:38');
INSERT INTO `faculty` VALUES ('4', '电子商务系', '2', '', '2018-04-17 08:37:45', '2018-04-20 16:53:47');
INSERT INTO `faculty` VALUES ('5', '会计系', '2', '', '2018-04-17 08:37:57', '2018-04-19 16:43:01');
INSERT INTO `faculty` VALUES ('6', '航空学院', '0', '', '2018-04-17 08:38:19', '2018-04-19 16:42:29');
INSERT INTO `faculty` VALUES ('7', '开飞机系', '6', '', '2018-04-17 08:38:30', '2018-04-19 16:42:31');
INSERT INTO `faculty` VALUES ('8', '修飞机系', '6', '', '2018-04-17 08:39:03', '2018-04-19 16:42:32');
INSERT INTO `faculty` VALUES ('10', '卖飞机系', '6', '', '2018-04-19 16:29:51', '2018-04-19 16:42:34');

-- ----------------------------
-- Table structure for faculty_teacher
-- ----------------------------
DROP TABLE IF EXISTS `faculty_teacher`;
CREATE TABLE `faculty_teacher` (
  `faculty_teacher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '老师跟院系表（管理院系负责人）',
  `faculty_id` int(11) NOT NULL COMMENT '院系id',
  `teach_id` int(11) NOT NULL COMMENT '老师id',
  `class_teacher_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `class_teacher_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`faculty_teacher_id`),
  KEY `faculty _id` (`faculty_id`),
  KEY `teach_id` (`teach_id`),
  CONSTRAINT `faculty_teacher_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `faculty_teacher_ibfk_2` FOREIGN KEY (`teach_id`) REFERENCES `teacher` (`teach_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faculty_teacher
-- ----------------------------
INSERT INTO `faculty_teacher` VALUES ('3', '3', '1', '2018-04-15 18:42:52', '2018-04-15 21:02:15');
INSERT INTO `faculty_teacher` VALUES ('4', '3', '2', '2018-04-15 21:02:27', '2018-04-15 21:02:27');
INSERT INTO `faculty_teacher` VALUES ('5', '3', '3', '2018-04-15 21:02:34', '2018-04-15 21:02:34');

-- ----------------------------
-- Table structure for modular
-- ----------------------------
DROP TABLE IF EXISTS `modular`;
CREATE TABLE `modular` (
  `modular_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(10) NOT NULL COMMENT '模块名',
  `modular_remark` varchar(255) DEFAULT NULL,
  `modular_parentid` int(11) NOT NULL,
  `modular_url` varchar(255) DEFAULT NULL,
  `checked` varchar(20) DEFAULT NULL,
  `faculty_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `faculty_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`modular_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modular
-- ----------------------------
INSERT INTO `modular` VALUES ('2', '院系管理', null, '9', 'teacher/faculty.jsp', null, '2018-04-15 21:22:20', '2018-04-17 08:19:07');
INSERT INTO `modular` VALUES ('3', '班级管理', null, '9', 'teacher/stuClass.jsp', null, '2018-04-15 21:22:36', '2018-04-20 21:56:06');
INSERT INTO `modular` VALUES ('4', '教师管理', null, '9', null, null, '2018-04-15 21:22:46', '2018-04-16 14:45:43');
INSERT INTO `modular` VALUES ('5', '学生管理', null, '9', 'teacher/student.jsp', null, '2018-04-15 21:23:09', '2018-04-16 19:51:30');
INSERT INTO `modular` VALUES ('6', '课程管理', null, '9', 'teacher/curriculum.jsp', null, '2018-04-15 21:23:15', '2018-04-20 21:56:14');
INSERT INTO `modular` VALUES ('7', '职务管理', null, '4', null, null, '2018-04-15 21:25:32', '2018-04-15 21:25:32');
INSERT INTO `modular` VALUES ('8', '老师管理', null, '4', null, null, '2018-04-15 21:25:41', '2018-04-15 21:25:41');
INSERT INTO `modular` VALUES ('9', '管理员管理', null, '0', null, null, '2018-04-16 14:45:30', '2018-04-16 14:45:30');
INSERT INTO `modular` VALUES ('10', '学生登陆', null, '0', null, null, '2018-04-16 14:46:21', '2018-04-16 14:46:21');
INSERT INTO `modular` VALUES ('11', '我的信息', null, '10', null, null, '2018-04-16 14:47:19', '2018-04-16 14:47:19');
INSERT INTO `modular` VALUES ('12', '我的成绩', null, '10', null, null, '2018-04-16 14:47:28', '2018-04-16 14:47:28');
INSERT INTO `modular` VALUES ('13', '选课', null, '10', null, null, '2018-04-16 14:47:56', '2018-04-16 14:47:56');
INSERT INTO `modular` VALUES ('14', '我的课程表', null, '10', null, null, '2018-04-16 14:52:54', '2018-04-16 14:52:54');

-- ----------------------------
-- Table structure for module_role
-- ----------------------------
DROP TABLE IF EXISTS `module_role`;
CREATE TABLE `module_role` (
  `module_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色',
  `module_id` int(11) NOT NULL COMMENT '模块',
  `module_role_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `module_role_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_role_id`),
  KEY `role _id` (`role_id`),
  KEY `module _role_ibfk_2` (`module_id`),
  CONSTRAINT `module_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `module_role_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modular` (`modular_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module_role
-- ----------------------------
INSERT INTO `module_role` VALUES ('2', '1', '2', '2018-04-15 21:26:52', '2018-04-15 21:26:52');
INSERT INTO `module_role` VALUES ('3', '1', '3', '2018-04-15 21:26:55', '2018-04-15 21:26:55');
INSERT INTO `module_role` VALUES ('4', '1', '4', '2018-04-15 21:26:59', '2018-04-15 21:26:59');
INSERT INTO `module_role` VALUES ('5', '1', '5', '2018-04-15 21:27:02', '2018-04-15 21:27:02');
INSERT INTO `module_role` VALUES ('6', '1', '6', '2018-04-15 21:27:06', '2018-04-15 21:27:06');
INSERT INTO `module_role` VALUES ('7', '1', '7', '2018-04-15 21:27:10', '2018-04-15 21:27:10');
INSERT INTO `module_role` VALUES ('8', '1', '8', '2018-04-15 21:27:12', '2018-04-15 21:27:12');
INSERT INTO `module_role` VALUES ('9', '1', '9', '2018-04-16 14:52:19', '2018-04-16 14:52:19');
INSERT INTO `module_role` VALUES ('10', '2', '10', '2018-04-16 14:52:24', '2018-04-16 14:52:24');
INSERT INTO `module_role` VALUES ('13', '2', '11', '2018-04-16 14:53:06', '2018-04-16 14:53:06');
INSERT INTO `module_role` VALUES ('14', '2', '12', '2018-04-16 14:53:10', '2018-04-16 14:53:10');
INSERT INTO `module_role` VALUES ('15', '2', '13', '2018-04-16 14:53:14', '2018-04-16 14:53:14');
INSERT INTO `module_role` VALUES ('16', '2', '14', '2018-04-16 14:53:17', '2018-04-16 14:53:17');

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(10) NOT NULL COMMENT '缴费名称',
  `pay_money` decimal(10,2) NOT NULL COMMENT '金额',
  `post_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `pay_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pay_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES ('1', '学费', '3600.00', '云时代', '2018-04-15 21:27:27', '2018-04-15 21:27:55');
INSERT INTO `pay` VALUES ('2', '职业技能费', '6300.00', '云时代', '2018-04-15 21:27:49', '2018-04-15 21:27:58');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(10) NOT NULL COMMENT '职务名称',
  `post_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `post_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `post_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '辅导员', null, '2018-04-15 21:28:21', '2018-04-15 21:28:21');
INSERT INTO `post` VALUES ('2', '老师', null, '2018-04-15 21:28:27', '2018-04-15 21:28:27');
INSERT INTO `post` VALUES ('3', '校长', null, '2018-04-15 21:28:35', '2018-04-15 21:28:35');
INSERT INTO `post` VALUES ('4', '经管系主任', null, '2018-04-15 21:28:49', '2018-04-15 21:28:49');
INSERT INTO `post` VALUES ('5', '管理院院长', null, '2018-04-15 21:29:00', '2018-04-15 21:29:00');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(10) NOT NULL,
  `role_remark` varchar(255) DEFAULT NULL,
  `role_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '管理员', null, '2018-04-15 21:26:31', '2018-04-15 21:26:31');
INSERT INTO `roles` VALUES ('2', '学生', null, '2018-04-16 14:51:52', '2018-04-16 14:51:52');

-- ----------------------------
-- Table structure for schoolstatus
-- ----------------------------
DROP TABLE IF EXISTS `schoolstatus`;
CREATE TABLE `schoolstatus` (
  `school_stunum` varchar(50) NOT NULL COMMENT '学号',
  `school_name` varchar(10) NOT NULL COMMENT '学生姓名',
  `school_birthday` datetime NOT NULL,
  `school_nation` varchar(20) NOT NULL,
  `school_sex` char(2) NOT NULL,
  `school_testnum` int(11) DEFAULT NULL COMMENT '考生号',
  `school_schoolname` varchar(20) NOT NULL COMMENT '就读院校',
  `school_admission` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入学日期',
  `school_arrangement` varchar(10) NOT NULL COMMENT '层次（大专、本科、研究生）',
  `school_longtime` varchar(10) NOT NULL COMMENT '几年制',
  `school_faculty` varchar(20) NOT NULL COMMENT '学院系别',
  `school_professional` varchar(20) NOT NULL COMMENT '专业名称',
  `school_class` varchar(20) NOT NULL COMMENT '班级名',
  `school_state` varchar(10) NOT NULL COMMENT '学籍状态',
  `school_img` varchar(255) DEFAULT NULL,
  `student_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `student_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  PRIMARY KEY (`school_stunum`),
  UNIQUE KEY `school_stunum` (`school_stunum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolstatus
-- ----------------------------
INSERT INTO `schoolstatus` VALUES ('2016040538', '王聪豪', '2018-04-13 21:30:43', '汉族', '男', '2200391', '安阳职业技术学院', '2018-04-24 08:14:14', '研究生', '3年', '经管系', '电子商务', '1603', '未毕业', '1524528854378.jpg', '2018-04-15 21:33:05', '2018-04-24 08:14:14');
INSERT INTO `schoolstatus` VALUES ('2016040539', '王弱', '2018-04-13 21:30:43', '汉族', '男', '220031554', '安阳职业技术学院', '2018-04-24 08:59:59', '大专', '3年', '经管系', '电子商务', '1603', '以毕业', '1524531599358.jpg', '2018-04-24 08:28:20', '2018-04-24 08:59:59');
INSERT INTO `schoolstatus` VALUES ('2016040540', '路畅通', '2018-04-13 21:30:43', '汉族', '男', null, '安阳职业技术学院', '2018-04-24 09:57:16', '研究生', '3年', '经管系', '电子商务', '1603', '未毕业', '1524535036803.jpg', '2018-04-24 09:09:38', '2018-04-24 09:57:16');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `student_num` varchar(50) DEFAULT NULL COMMENT '学号',
  `student_name` varchar(10) NOT NULL COMMENT '学生名',
  `student_phone` varchar(11) NOT NULL COMMENT '学生电话',
  `student_qq` varchar(15) DEFAULT NULL COMMENT '学生qq',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `faculty_id` int(11) NOT NULL,
  `student_remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `student_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `student_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '2016040538', '李五通', '18722642741', '932875723', '1', '3', 's', '2018-04-15 21:35:56', '2018-04-19 10:20:24');
INSERT INTO `student` VALUES ('2', '2016040539', '路不通', '18337295927', '1242184781', '1', '3', null, '2018-04-15 22:12:34', '2018-04-24 08:22:40');
INSERT INTO `student` VALUES ('3', '2016040540', '王弱', '18654855621', '854254524', '1', '3', '', '2018-04-17 08:44:52', '2018-04-24 08:22:47');
INSERT INTO `student` VALUES ('4', '2016040541', '刘二彬', '15688559981', '487546331', '1', '3', null, '2018-04-17 08:46:40', '2018-04-24 08:22:57');
INSERT INTO `student` VALUES ('5', '2016040542', '赵地短', '15642546841', '456887412', '1', '3', null, '2018-04-17 08:47:04', '2018-04-24 08:23:01');
INSERT INTO `student` VALUES ('6', '2016040543', '胡鑫扁', '15875565561', '557845355', '1', '3', null, '2018-04-17 08:47:34', '2018-04-24 08:23:05');
INSERT INTO `student` VALUES ('7', '2016040544', '李佳慧', '12312341234', '12312312331', '2', '3', null, '2018-04-17 21:23:43', '2018-04-24 08:23:08');
INSERT INTO `student` VALUES ('8', '2016040545', '12312', '18337295927', '958474738', '2', '3', null, '2018-04-17 21:26:52', '2018-04-24 08:23:12');
INSERT INTO `student` VALUES ('9', '2016040546', '1231', '18337295927', '958474738', '2', '3', null, '2018-04-19 08:46:02', '2018-04-24 10:02:16');
INSERT INTO `student` VALUES ('10', '2016040547', '毕割接', '15155682235', '568424568', '3', '3', null, '2018-04-19 11:48:14', '2018-04-24 10:02:20');
INSERT INTO `student` VALUES ('11', '2016040548', '刘三彬', '18565478564', '236598', '4', '4', null, '2018-04-19 16:47:14', '2018-04-24 10:02:23');
INSERT INTO `student` VALUES ('12', '2016040549', '是多少', '15341231234', '545785', '4', '4', null, '2018-04-19 16:50:56', '2018-04-24 10:02:26');
INSERT INTO `student` VALUES ('13', '2016040550', '1232', '18337295927', '1242184781', '4', '4', null, '2018-04-19 23:49:00', '2018-04-24 10:02:32');
INSERT INTO `student` VALUES ('14', '2016040551', '吕绍鹏', '18337295927', '943984139', '4', '4', null, '2018-04-20 17:57:59', '2018-04-24 10:02:35');
INSERT INTO `student` VALUES ('15', '2016040552', '会计测试1', '18337295927', '942658425', '4', '4', null, '2018-04-21 08:05:02', '2018-04-24 10:02:40');
INSERT INTO `student` VALUES ('16', '2016040553', '吕小南', '18337295927', '94984123', '6', '5', null, '2018-04-24 09:16:14', '2018-04-24 10:02:42');
INSERT INTO `student` VALUES ('17', '2016040554', '必过姐', '18223722238', '1242184781', '6', '5', null, '2018-04-24 10:01:54', '2018-04-24 10:02:46');

-- ----------------------------
-- Table structure for student_curriculum
-- ----------------------------
DROP TABLE IF EXISTS `student_curriculum`;
CREATE TABLE `student_curriculum` (
  `student_curriculum_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `student_curriculum_score` int(11) NOT NULL,
  `student_curriculum_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `student_curriculum_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_curriculum_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_curriculum_id`),
  KEY `student_id` (`student_id`),
  KEY `curriculum_id` (`curriculum_id`),
  CONSTRAINT `student_curriculum_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE,
  CONSTRAINT `student_curriculum_ibfk_2` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`curriculum_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_curriculum
-- ----------------------------
INSERT INTO `student_curriculum` VALUES ('1', '1', '2', '58', '2018-04-17 23:26:55', '2018-04-18 22:49:06', '作弊成绩无效');
INSERT INTO `student_curriculum` VALUES ('2', '2', '2', '99', '2018-04-17 23:28:21', '2018-04-19 15:46:02', '作弊 无效');
INSERT INTO `student_curriculum` VALUES ('3', '3', '2', '99', '2018-04-17 23:28:28', '2018-04-17 23:28:28', null);
INSERT INTO `student_curriculum` VALUES ('4', '4', '2', '60', '2018-04-17 23:28:35', '2018-04-17 23:28:35', null);
INSERT INTO `student_curriculum` VALUES ('5', '1', '3', '58', '2018-04-18 13:11:43', '2018-04-18 22:49:06', '作弊成绩无效');
INSERT INTO `student_curriculum` VALUES ('6', '1', '1', '25', '2018-04-18 23:36:24', '2018-04-18 23:36:24', '没有');
INSERT INTO `student_curriculum` VALUES ('7', '1', '5', '66', '2018-04-18 23:36:35', '2018-04-18 23:36:35', '完美');
INSERT INTO `student_curriculum` VALUES ('8', '2', '3', '123', '2018-04-18 23:38:13', '2018-04-18 23:38:13', '22');
INSERT INTO `student_curriculum` VALUES ('9', '2', '5', '123', '2018-04-18 23:38:25', '2018-04-18 23:38:25', '22');
INSERT INTO `student_curriculum` VALUES ('11', '3', '3', '22', '2018-04-18 23:39:40', '2018-04-18 23:39:40', '22');
INSERT INTO `student_curriculum` VALUES ('13', '8', '2', '123', '2018-04-18 23:55:11', '2018-04-18 23:55:11', '123');
INSERT INTO `student_curriculum` VALUES ('14', '8', '3', '123', '2018-04-18 23:58:46', '2018-04-18 23:58:46', '123');
INSERT INTO `student_curriculum` VALUES ('15', '6', '4', '0', '2018-04-19 08:05:45', '2018-04-19 08:05:45', '');
INSERT INTO `student_curriculum` VALUES ('16', '10', '2', '99', '2018-04-19 11:48:34', '2018-04-19 11:48:34', '作弊无效');
INSERT INTO `student_curriculum` VALUES ('17', '2', '4', '0', '2018-04-19 15:46:23', '2018-04-19 15:46:23', '思想道德败坏');
INSERT INTO `student_curriculum` VALUES ('18', '13', '2', '1', '2018-04-19 23:49:09', '2018-04-19 23:49:09', '1');

-- ----------------------------
-- Table structure for student_pay
-- ----------------------------
DROP TABLE IF EXISTS `student_pay`;
CREATE TABLE `student_pay` (
  `student_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `pay_id` int(11) NOT NULL,
  `student_pay_payok` char(2) DEFAULT NULL COMMENT '是否已经交钱',
  `student_pay_realmoney` decimal(10,2) DEFAULT NULL,
  `student_pay_payno` decimal(10,2) DEFAULT NULL COMMENT '欠款金额',
  `student_pay_remark` varchar(255) DEFAULT NULL,
  `student_pay_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `student_pay_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_pay
-- ----------------------------
INSERT INTO `student_pay` VALUES ('1', '1', '1', '否', '600.00', '3000.00', null, '2018-04-15 22:12:54', '2018-04-15 22:15:14');
INSERT INTO `student_pay` VALUES ('2', '2', '1', '是', '3600.00', '0.00', null, '2018-04-15 22:13:19', '2018-04-15 22:15:18');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teach_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '老师id',
  `teach_name` varchar(10) DEFAULT NULL COMMENT '老师名字',
  `teach_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '老师加入时间',
  `teach_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改',
  PRIMARY KEY (`teach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '王猛', '2018-04-15 18:41:19', '2018-04-15 21:01:39');
INSERT INTO `teacher` VALUES ('2', '路畅通', '2018-04-15 21:01:45', '2018-04-15 21:01:45');
INSERT INTO `teacher` VALUES ('3', '栗梧桐', '2018-04-15 21:01:57', '2018-04-15 21:01:57');
INSERT INTO `teacher` VALUES ('4', '张三', '2018-04-19 23:38:43', '2018-04-19 23:38:43');
INSERT INTO `teacher` VALUES ('5', '李四', '2018-04-19 23:38:47', '2018-04-19 23:38:47');
INSERT INTO `teacher` VALUES ('6', '王麻子', '2018-04-19 23:38:59', '2018-04-19 23:38:59');
INSERT INTO `teacher` VALUES ('9', '必过姐', '2018-04-20 16:13:15', '2018-04-20 16:13:15');
INSERT INTO `teacher` VALUES ('10', '张晨苹', '2018-04-20 16:15:00', '2018-04-20 16:15:00');
INSERT INTO `teacher` VALUES ('11', '李家辉', '2018-04-20 16:41:53', '2018-04-20 16:41:53');
INSERT INTO `teacher` VALUES ('16', '测试老师', '2018-04-21 08:06:07', '2018-04-21 08:06:07');
INSERT INTO `teacher` VALUES ('17', '吕筱南', '2018-04-22 22:46:09', '2018-04-22 22:46:09');

-- ----------------------------
-- Table structure for teacher_post
-- ----------------------------
DROP TABLE IF EXISTS `teacher_post`;
CREATE TABLE `teacher_post` (
  `teachpost_id` int(11) NOT NULL AUTO_INCREMENT,
  `teach_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `teachpost_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `teachpost_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`teachpost_id`),
  KEY `teach_id` (`teach_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `teacher_post_ibfk_1` FOREIGN KEY (`teach_id`) REFERENCES `teacher` (`teach_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_post
-- ----------------------------
INSERT INTO `teacher_post` VALUES ('1', '1', '1', '2018-04-15 22:15:36', '2018-04-15 22:15:36');
INSERT INTO `teacher_post` VALUES ('2', '1', '2', '2018-04-15 22:15:43', '2018-04-15 22:15:43');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) NOT NULL COMMENT '名字',
  `user_pass` varchar(8) NOT NULL,
  `user_islockout` char(2) NOT NULL,
  `user_lastlogintime` datetime DEFAULT NULL,
  `user_psdwrongtime` int(11) DEFAULT NULL,
  `user_locktime` datetime DEFAULT NULL,
  `user_protectemail` varchar(50) DEFAULT NULL,
  `user_protectmtel` int(11) NOT NULL,
  `user_remark` varchar(255) DEFAULT NULL,
  `user_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '张三', '123', '否', '2018-04-19 22:16:02', '2', null, '123@qq.com', '1238727342', null, '2018-04-15 22:16:24', '2018-04-15 22:16:24');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_role_creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_role_updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_role_id`),
  KEY `user _id` (`user_id`),
  KEY `role _id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1', '2018-04-15 22:16:42', '2018-04-15 22:16:42');

-- ----------------------------
-- View structure for v_class_student_faculty
-- ----------------------------
DROP VIEW IF EXISTS `v_class_student_faculty`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_class_student_faculty` AS select `student`.`student_id` AS `student_id`,`faculty`.`faculty_name` AS `faculty_name`,`class`.`class_name` AS `class_name`,`student`.`student_name` AS `student_name`,`student`.`student_phone` AS `student_phone`,`student`.`student_qq` AS `student_qq`,`student`.`class_id` AS `class_id`,`student`.`student_remark` AS `student_remark`,`student`.`faculty_creattime` AS `faculty_creattime` from ((`class` join `faculty` on((`class`.`faculty_id` = `faculty`.`faculty_id`))) join `student` on((`student`.`class_id` = `class`.`class_id`))) ;
