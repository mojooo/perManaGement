/*
Navicat MySQL Data Transfer

Source Server         : My_root
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : permanagement

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-29 10:58:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `attendanceinfo`
-- ----------------------------
DROP TABLE IF EXISTS `attendanceinfo`;
CREATE TABLE `attendanceinfo` (
  `attendId` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤编号',
  `empId` char(10) NOT NULL COMMENT '员工编号',
  `attendTime` datetime NOT NULL COMMENT '考勤时间',
  `attendState` int(1) NOT NULL DEFAULT '0' COMMENT '考勤状态',
  PRIMARY KEY (`attendId`),
  KEY `Fk_attendEmpId` (`empId`),
  CONSTRAINT `Fk_attendEmpId` FOREIGN KEY (`empId`) REFERENCES `employeeinfo` (`empId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendanceinfo
-- ----------------------------
INSERT INTO `attendanceinfo` VALUES ('1', '20050119', '2013-08-22 09:00:00', '1');
INSERT INTO `attendanceinfo` VALUES ('2', '20050119', '2013-08-23 00:00:00', '1');
INSERT INTO `attendanceinfo` VALUES ('3', '20050318', '2013-08-22 00:00:00', '1');
INSERT INTO `attendanceinfo` VALUES ('4', '20050318', '2013-08-23 00:00:00', '1');
INSERT INTO `attendanceinfo` VALUES ('5', '20050119', '2013-08-15 00:00:00', '2');
INSERT INTO `attendanceinfo` VALUES ('6', '20130826', '2013-08-27 16:35:57', '1');
INSERT INTO `attendanceinfo` VALUES ('7', '20050318', '2013-08-27 16:42:45', '1');
INSERT INTO `attendanceinfo` VALUES ('8', '20130826', '2013-08-28 10:06:42', '1');
INSERT INTO `attendanceinfo` VALUES ('9', '20050318', '2013-08-28 10:13:19', '1');
INSERT INTO `attendanceinfo` VALUES ('10', '20050119', '2013-08-28 10:13:48', '1');

-- ----------------------------
-- Table structure for `departmentinfo`
-- ----------------------------
DROP TABLE IF EXISTS `departmentinfo`;
CREATE TABLE `departmentinfo` (
  `departId` char(4) NOT NULL COMMENT '部门编号',
  `departName` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `departNum` int(5) DEFAULT '0' COMMENT '部门人数',
  `departDesc` text COMMENT '部门描述',
  PRIMARY KEY (`departId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departmentinfo
-- ----------------------------
INSERT INTO `departmentinfo` VALUES ('0001', '人事部', '1', '工资处理, 人事调度\r\n人员招聘');
INSERT INTO `departmentinfo` VALUES ('0002', '技术部', '2', '开发软件,做技术');
INSERT INTO `departmentinfo` VALUES ('0003', '生产部', '0', '普通职工\r\n职工要求不高');
INSERT INTO `departmentinfo` VALUES ('0004', '销售部', '0', '销售公司自主研发各种产品');

-- ----------------------------
-- Table structure for `employeeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `employeeinfo`;
CREATE TABLE `employeeinfo` (
  `empId` char(10) NOT NULL COMMENT '职工编码',
  `empName` varchar(50) NOT NULL COMMENT '职工姓名',
  `empSex` char(2) NOT NULL COMMENT '职工性别',
  `empBirth` date NOT NULL COMMENT '职工生日',
  `empEmail` varchar(50) NOT NULL COMMENT '职工邮箱',
  `departId` char(4) NOT NULL COMMENT '所属部门编号',
  `empRoll` varchar(50) NOT NULL COMMENT '职工职位',
  `empSalary` decimal(8,2) NOT NULL COMMENT '基本工资',
  `empTel` varchar(20) NOT NULL COMMENT '职工电话',
  `empPic` varchar(100) DEFAULT NULL COMMENT '头像路径',
  `empBio` text COMMENT '职工简历',
  `empState` decimal(1,0) DEFAULT '0' COMMENT '在职状态',
  PRIMARY KEY (`empId`),
  KEY `Pk_departId` (`departId`),
  CONSTRAINT `Pk_departId` FOREIGN KEY (`departId`) REFERENCES `departmentinfo` (`departId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeeinfo
-- ----------------------------
INSERT INTO `employeeinfo` VALUES ('20050119', '王强', '男', '1986-10-01', 'cuiguoqiang.123@163.com', '0002', '副部长', '2000.00', '03152593555', 'impimage/default.png', '张亮的个aaaaaaaaaaaaaa人简历', '0');
INSERT INTO `employeeinfo` VALUES ('20050318', '王亮', '男', '1986-11-01', 'cuiqiang.123@163.com', '0001', '正部长', '2500.00', '03152593343', 'impimage/default.png', '王亮的个人简历啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '0');
INSERT INTO `employeeinfo` VALUES ('20130826', 'LiuYong', '男', '1990-09-26', 'lyayzh@live.com', '0002', '技术总监', '12000.00', '12345678901', 'impimage/liu.png', '屌丝一枚！！！！！！！！！！！！！！', '1');

-- ----------------------------
-- Table structure for `extrawork`
-- ----------------------------
DROP TABLE IF EXISTS `extrawork`;
CREATE TABLE `extrawork` (
  `extraId` int(11) NOT NULL AUTO_INCREMENT COMMENT '加班表编号',
  `empId` char(10) NOT NULL COMMENT '员工编号',
  `workTime` datetime NOT NULL COMMENT '加班时间',
  `executes` varchar(500) NOT NULL COMMENT '加班原因',
  `workHours` int(11) NOT NULL,
  PRIMARY KEY (`extraId`),
  KEY `Fk_extraempId` (`empId`),
  CONSTRAINT `Fk_extraempId` FOREIGN KEY (`empId`) REFERENCES `employeeinfo` (`empId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of extrawork
-- ----------------------------
INSERT INTO `extrawork` VALUES ('1', '20130826', '2013-08-01 14:51:33', '赶项目', '4');
INSERT INTO `extrawork` VALUES ('2', '20050119', '2013-08-16 14:52:13', '写生产计划', '2');
INSERT INTO `extrawork` VALUES ('3', '20050119', '2013-08-12 00:00:00', '义务加班', '2');
INSERT INTO `extrawork` VALUES ('4', '20050318', '2013-08-27 00:00:00', '没事加班好玩', '0');

-- ----------------------------
-- Table structure for `holsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `holsinfo`;
CREATE TABLE `holsinfo` (
  `holsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '请假编号',
  `empId` char(10) NOT NULL DEFAULT '' COMMENT '员工编号',
  `applyTime` datetime NOT NULL COMMENT '申请时间',
  `startTime` date NOT NULL COMMENT '开始时间',
  `endTime` date NOT NULL COMMENT '结束时间',
  `holdays` decimal(2,0) NOT NULL COMMENT '请假天数',
  `executes` varchar(500) NOT NULL DEFAULT '' COMMENT '请假原因',
  `holsState` decimal(1,0) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`holsId`),
  KEY `FK_holsempId` (`empId`),
  CONSTRAINT `FK_holsempId` FOREIGN KEY (`empId`) REFERENCES `employeeinfo` (`empId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of holsinfo
-- ----------------------------
INSERT INTO `holsinfo` VALUES ('1', '20050318', '2008-08-08 00:00:00', '2008-08-20', '2008-09-15', '27', '生病住院', '1');
INSERT INTO `holsinfo` VALUES ('3', '20050119', '2013-08-25 16:04:57', '2013-08-01', '2013-08-09', '9', '生病住院', '3');
INSERT INTO `holsinfo` VALUES ('4', '20130826', '2013-08-29 09:39:21', '2013-08-29', '2013-08-30', '2', '有急事处理', '1');

-- ----------------------------
-- Table structure for `salaryinfo`
-- ----------------------------
DROP TABLE IF EXISTS `salaryinfo`;
CREATE TABLE `salaryinfo` (
  `salaryId` int(11) NOT NULL AUTO_INCREMENT COMMENT '薪资表编号',
  `empId` char(10) NOT NULL COMMENT '职工编号',
  `syear` char(4) NOT NULL COMMENT '年',
  `smonth` char(2) NOT NULL COMMENT '月',
  `sBase` decimal(8,2) NOT NULL COMMENT '基本工资',
  `sExtra` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '加班费',
  `sHoliday` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '请假费用',
  `sAbsence` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '缺勤费',
  `sTotal` decimal(6,2) NOT NULL COMMENT '小计',
  `sState` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`salaryId`),
  KEY `FK_salempId` (`empId`),
  CONSTRAINT `FK_salempId` FOREIGN KEY (`empId`) REFERENCES `employeeinfo` (`empId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salaryinfo
-- ----------------------------
INSERT INTO `salaryinfo` VALUES ('1', '20050119', '2013', '07', '2000.00', '500.00', '100.00', '100.00', '2300.00', '1');
INSERT INTO `salaryinfo` VALUES ('2', '20050119', '2013', '08', '2000.00', '600.00', '0.00', '0.00', '2600.00', '0');
INSERT INTO `salaryinfo` VALUES ('3', '20050119', '2013', '09', '2000.00', '500.00', '100.00', '0.00', '2400.00', '0');
INSERT INTO `salaryinfo` VALUES ('4', '20050119', '2013', '04', '2000.00', '800.00', '0.00', '0.00', '2800.00', '1');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `empId` char(10) NOT NULL COMMENT '职工编号',
  `pwd` char(10) NOT NULL COMMENT '密码',
  `empRight` int(1) DEFAULT '2' COMMENT '权限',
  PRIMARY KEY (`empId`),
  CONSTRAINT `Fk_userempId` FOREIGN KEY (`empId`) REFERENCES `employeeinfo` (`empId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('20050119', '20050119', '0');
INSERT INTO `userinfo` VALUES ('20050318', '20050318', '1');
