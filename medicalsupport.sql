/*
Navicat MySQL Data Transfer

Source Server         : MedicalSupport
Source Server Version : 50707
Source Host           : localhost:3306
Source Database       : medicalsupport

Target Server Type    : MYSQL
Target Server Version : 50707
File Encoding         : 65001

Date: 2017-03-18 15:19:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `AdminID` int(1) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Purview` int(1) NOT NULL,     -- 权限 1.超级管理员权限 2.员工权限
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `AdminName` (`AdminName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

alter table `admin` add column admintype int DEFAULT 1  -- 管理员类型 1.超级管理员 2.员工管理员

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'aa', 'ddd', '1');
INSERT INTO `admin` VALUES ('2', 'bb', 'bbb', '1');
INSERT INTO `admin` VALUES ('3', 'cc', 'ddd', '1');

-- ----------------------------
-- Table structure for adminloginrecord
-- ----------------------------
DROP TABLE IF EXISTS `adminloginrecord`;
CREATE TABLE `adminloginrecord` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(50) NOT NULL,
  `LoginIP` varchar(50) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `LogoutTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_adminLoginRecord_AdminName` (`AdminName`),
  CONSTRAINT `FK_adminLoginRecord_AdminName` FOREIGN KEY (`AdminName`) REFERENCES `admin` (`AdminName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminloginrecord
-- ----------------------------

-- ----------------------------
-- Table structure for changecard
-- ----------------------------
DROP TABLE IF EXISTS `changecard`;
CREATE TABLE `changecard` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `MemberID` varchar(50) NOT NULL,
  `OldCardNo` varchar(50) NOT NULL,
  `NewCardNo` varchar(50) NOT NULL,
  `Note` text NOT NULL,
  `Creator` varchar(50) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `DeptID` varchar(50) DEFAULT NULL,
  `CompanyID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_changeCard_MemberID` (`MemberID`),
  CONSTRAINT `FK_changeCard_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changecard
-- ----------------------------

-- ----------------------------
-- Table structure for lossrecord
-- ----------------------------
DROP TABLE IF EXISTS `lossrecord`;
CREATE TABLE `lossrecord` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `MemberID` varchar(50) NOT NULL,
  `CardNo` varchar(50) NOT NULL,
  `OperationType` char(1) NOT NULL,
  `Note` text,
  `Creator` varchar(50) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `DeptID` varchar(50) DEFAULT NULL,
  `CompanyID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_lossRecord_MemberID` (`MemberID`),
  CONSTRAINT `FK_lossRecord_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lossrecord
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `MemberID` varchar(50) NOT NULL,
  `CardNo` varchar(50) DEFAULT NULL,
  `CardCode` varchar(50) DEFAULT NULL,
  `CardStatus` char(1) NOT NULL DEFAULT '0',   -- 0,启用;1,未启用
  `CardGrade` char(1) NOT NULL DEFAULT '1',
  `Name` varchar(50) NOT NULL,
  `Sex` char(1) NOT NULL,
  `BirthDate` date NOT NULL,
  `IDCardType` char(1) NOT NULL,
  `IDNumber` varchar(50) NOT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) NOT NULL,
  `EmergencyPhone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) DEFAULT NULL,
  `OpenDate` date NOT NULL,
  `ValidateDate` date DEFAULT NULL,
  `Discount` decimal(10,0) DEFAULT '0',
  `Balance` decimal(10,0) DEFAULT '0',
  `Password` varchar(50) NOT NULL,
  `TotalPoints` int(11) DEFAULT '0',
  `TotalConsumption` decimal(10,0) DEFAULT '0',
  `TotalRecharge` decimal(10,0) DEFAULT '0',
  `TotalCount` int(11) DEFAULT '0',
  `MaxCount` int(11) DEFAULT '0',
  `Portraint` varchar(50) DEFAULT NULL,
  `AttachGUID` varchar(50) DEFAULT NULL,
  `Note` text,
  `Province` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  `Hometown` varchar(50) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `Creator` varchar(50) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `Editor` varchar(50) DEFAULT NULL,
  `EditTime` datetime DEFAULT NULL,
  `DeptID` varchar(50) DEFAULT NULL,
  `CompanyID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('20161214001', '123456789', '82736545', '1', '1', 'adam', '1', '1967-01-03', '1', '361093839837764829', '13847362539', '13827363538', null, null, null, null, '2014-03-05', '2018-03-05', '0', '0', '88888888', '100', '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2014', '3');

-- ----------------------------
-- Table structure for pointexchange
-- ----------------------------
DROP TABLE IF EXISTS `pointexchange`;
CREATE TABLE `pointexchange` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `MemberID` varchar(50) NOT NULL,
  `CardNo` varchar(50) NOT NULL,
  `ExchangeGift` varchar(250) NOT NULL,
  `ExchangePoints` int(11) NOT NULL,
  `Note` text,
  `Creator` varchar(50) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `DeptID` varchar(50) DEFAULT NULL,
  `CompanyID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_pointExchange_MemberID` (`MemberID`),
  CONSTRAINT `FK_pointExchange_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pointexchange
-- ----------------------------

-- ----------------------------
-- Table structure for pointrecord
-- ----------------------------
DROP TABLE IF EXISTS `pointrecord`;
CREATE TABLE `pointrecord` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `MemberID` varchar(50) NOT NULL,
  `CardNo` varchar(50) NOT NULL,
  `OperationType` char(1) NOT NULL,
  `ChangePoints` int(11) NOT NULL,
  `Note` text,
  `Creator` varchar(50) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `DeptID` varchar(50) DEFAULT NULL,
  `CompanyID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_pointRecord_MemberID` (`MemberID`),
  CONSTRAINT `FK_pointRecord_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pointrecord
-- ----------------------------

-- ----------------------------
-- Table structure for rechargerecord
-- ----------------------------
DROP TABLE IF EXISTS `rechargerecord`;
CREATE TABLE `rechargerecord` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `MemberID` varchar(50) NOT NULL,
  `CardNo` varchar(50) NOT NULL,
  `RechargeAmount` decimal(10,0) NOT NULL,
  `exchangepoints` int(11) NOT NULL,
  `Note` text,
  `Creator` varchar(50) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_rechargeRecord_MemberID` (`MemberID`),
  CONSTRAINT `FK_rechargeRecord_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pointinfo
-- ----------------------------

DROP TABLE IF EXISTS `pointinfo`;
CREATE TABLE `pointinfo` (
  `MemberID` varchar(50) NOT NULL,
  `CardNo` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `IDNumber` varchar(50) NOT NULL,
  `leftpoints` int(11) NOT NULL,
  `leftamount` decimal(10,0) not NULL,
  `Creator` varchar(50) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`MemberID`),
  CONSTRAINT `FK_pointinfo_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(50) NOT NULL,
  `departmentCategory` varchar(50) NOT NULL,
  `note` varchar(50),
  `deployment` int(1) ,
  `Creator` varchar(50) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `productname` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `needpoint` int NOT NULL,
  `needcash` decimal(10,2) not NULL,
  `Creator` varchar(50) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



