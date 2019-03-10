/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100133
 Source Host           : localhost:3306
 Source Schema         : accman

 Target Server Type    : MySQL
 Target Server Version : 100133
 File Encoding         : 65001

 Date: 10/03/2019 12:39:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `lastUpdateDate` datetime(0) NULL DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_department`(`departmentId`) USING BTREE,
  CONSTRAINT `fk_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (4, 'takashato', '$2y$08$Y0FvQWlhS3RBOGNaLzlOS.VhBVIhtrQmC9Nm1k8i6IJKMH4pU9naG', 'takashato@gmail.com', 'Bành Thanh Sơn', 1, '1999-12-31', '2019-03-07 19:00:27', '2019-03-10 12:36:49', 2);
INSERT INTO `account` VALUES (6, 'admin', '$2y$08$M3RMcWpIQzgxci9VRndJNucUQk1eJqapqymOugjWXheldURampJAe', 'admin@localhost', 'Aoyama Takashato', 1, '1999-12-31', '2019-03-07 19:19:07', '2019-03-10 12:35:23', 5);
INSERT INTO `account` VALUES (7, 'aoyama', '$2y$08$QnRFK0lMd3hWcFlQRVduT.Pm/qn/26XG727XKHXsh8ax4iwB4za3S', 'admin@gmail.com', 'Nguyễn Văn A', 1, '1999-12-31', '2019-03-10 02:59:01', '2019-03-10 10:41:15', 1);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'Human Resources');
INSERT INTO `department` VALUES (2, 'IT');
INSERT INTO `department` VALUES (3, 'Accounting');
INSERT INTO `department` VALUES (5, 'Technical Support');

SET FOREIGN_KEY_CHECKS = 1;
