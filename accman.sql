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

 Date: 07/03/2019 20:00:43
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (4, 'takashato', '$2y$08$Y0FvQWlhS3RBOGNaLzlOS.VhBVIhtrQmC9Nm1k8i6IJKMH4pU9naG', 'takashato@gmail.com', 'Bành Thanh Sơn', 1, '1999-12-31', '2019-03-07 19:00:27', '2019-03-07 19:00:27');
INSERT INTO `account` VALUES (6, 'admin', '$2y$08$M3RMcWpIQzgxci9VRndJNucUQk1eJqapqymOugjWXheldURampJAe', 'admin@localhost', 'Aoyama Takashato', 1, '1999-12-31', '2019-03-07 19:19:07', '2019-03-07 19:31:05');

SET FOREIGN_KEY_CHECKS = 1;
