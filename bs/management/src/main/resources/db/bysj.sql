/*
 Navicat MySQL Data Transfer

 Source Server         : remote
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 119.29.214.244:3306
 Source Schema         : bysj

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 04/05/2018 13:34:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjustment
-- ----------------------------
DROP TABLE IF EXISTS `adjustment`;
CREATE TABLE `adjustment`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(11) NULL DEFAULT NULL COMMENT '员工ID',
  `origin` bigint(20) NULL DEFAULT NULL COMMENT '原部门',
  `arrive` bigint(20) NULL DEFAULT NULL COMMENT '转到部门',
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adjustment_apply
-- ----------------------------
DROP TABLE IF EXISTS `adjustment_apply`;
CREATE TABLE `adjustment_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) NULL DEFAULT NULL COMMENT '员工ID',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `text` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请原因',
  `origin` bigint(20) NULL DEFAULT NULL COMMENT '源部门ID',
  `arrive` bigint(20) NULL DEFAULT NULL COMMENT '到达部门ID',
  `status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请状态',
  `origin_deal_time` datetime(0) NULL DEFAULT NULL COMMENT '原部门主管处理时间',
  `origin_approve` bigint(20) NULL DEFAULT NULL COMMENT '原部门审批人',
  `origin_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原部门备注',
  `arrive_deal_time` datetime(0) NULL DEFAULT NULL COMMENT '到达部门审批时间',
  `arrive_approve` bigint(20) NULL DEFAULT NULL COMMENT '到达部门审批人',
  `arrive_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到达部门备注',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位调整申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adjustment_apply
-- ----------------------------
INSERT INTO `adjustment_apply` VALUES (4, 3, '2018-04-28 22:17:52', '这个人嘴皮子好，去干销售', 12, 11, '3', NULL, NULL, '哈哈，这人我要了', '2018-05-02 13:26:08', 11, '来来来，都是我的', '2018-04-28 22:17:52', '王宏', '2018-05-02 13:26:08', '王立');
INSERT INTO `adjustment_apply` VALUES (5, 3, '2018-05-02 13:40:41', '这人有问题，你还是拿走吧', 11, 12, '3', '2018-05-02 13:40:41', 11, '拜拜', '2018-05-02 13:41:22', 12, '还是回来吧', '2018-05-02 13:40:41', '王立', '2018-05-02 13:41:22', '王宏');
INSERT INTO `adjustment_apply` VALUES (6, 33, '2018-05-02 13:43:38', '这人拿去，不谢', 12, 11, '4', '2018-05-02 13:43:38', 12, '哈哈', '2018-05-02 13:44:03', 11, '不要', '2018-05-02 13:43:38', '王宏', '2018-05-02 13:44:03', '王立');

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(11) NULL DEFAULT NULL COMMENT '员工ID',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '上班时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '下班时间',
  `date_uuid` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期标识',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1024 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考勤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (4, 1, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (5, 1, '2018-04-02 08:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (6, 1, '2018-04-03 09:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (7, 1, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (8, 1, '2018-04-05 08:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (9, 1, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (10, 1, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (11, 1, '2018-04-08 09:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (12, 1, '2018-04-09 09:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (13, 1, '2018-04-10 09:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (14, 1, '2018-04-11 09:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (15, 1, '2018-04-12 08:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (16, 1, '2018-04-13 09:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (17, 1, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (18, 1, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (19, 1, '2018-04-16 09:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (20, 1, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (21, 1, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (22, 1, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (23, 1, '2018-04-20 08:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (24, 1, '2018-04-21 08:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (25, 1, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (26, 1, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (27, 1, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (28, 1, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (29, 1, '2018-04-26 09:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (30, 1, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (31, 1, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (32, 1, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (33, 1, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (34, 2, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (35, 2, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (36, 2, '2018-04-03 08:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (37, 2, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (38, 2, '2018-04-05 09:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (39, 2, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (40, 2, '2018-04-07 09:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (41, 2, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (42, 2, '2018-04-09 08:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (43, 2, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (44, 2, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (45, 2, '2018-04-12 08:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (46, 2, '2018-04-13 09:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (47, 2, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (48, 2, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (49, 2, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (50, 2, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (51, 2, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (52, 2, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (53, 2, '2018-04-20 08:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (54, 2, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (55, 2, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (56, 2, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (57, 2, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (58, 2, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (59, 2, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (60, 2, '2018-04-27 08:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (61, 2, '2018-04-28 08:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (62, 2, '2018-04-29 09:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (63, 2, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (64, 3, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (65, 3, '2018-04-02 09:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (66, 3, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (67, 3, '2018-04-04 09:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (68, 3, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (69, 3, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (70, 3, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (71, 3, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (72, 3, '2018-04-09 08:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (73, 3, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (74, 3, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (75, 3, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (76, 3, '2018-04-13 08:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (77, 3, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (78, 3, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (79, 3, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (80, 3, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (81, 3, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (82, 3, '2018-04-19 09:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (83, 3, '2018-04-20 08:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (84, 3, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (85, 3, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (86, 3, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (87, 3, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (88, 3, '2018-04-25 08:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (89, 3, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (90, 3, '2018-04-27 08:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (91, 3, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (92, 3, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (93, 3, '2018-04-30 09:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (94, 4, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (95, 4, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (96, 4, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (97, 4, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (98, 4, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (99, 4, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (100, 4, '2018-04-07 09:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (101, 4, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (102, 4, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (103, 4, '2018-04-10 09:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (104, 4, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (105, 4, '2018-04-12 09:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (106, 4, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (107, 4, '2018-04-14 09:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (108, 4, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (109, 4, '2018-04-16 09:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (110, 4, '2018-04-17 09:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (111, 4, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (112, 4, '2018-04-19 09:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (113, 4, '2018-04-20 08:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (114, 4, '2018-04-21 09:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (115, 4, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (116, 4, '2018-04-23 08:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (117, 4, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (118, 4, '2018-04-25 08:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (119, 4, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (120, 4, '2018-04-27 08:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (121, 4, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (122, 4, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (123, 4, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (124, 5, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (125, 5, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (126, 5, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (127, 5, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (128, 5, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (129, 5, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (130, 5, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (131, 5, '2018-04-08 08:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (132, 5, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (133, 5, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (134, 5, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (135, 5, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (136, 5, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (137, 5, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (138, 5, '2018-04-15 09:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (139, 5, '2018-04-16 09:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (140, 5, '2018-04-17 09:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (141, 5, '2018-04-18 08:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (142, 5, '2018-04-19 09:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (143, 5, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (144, 5, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (145, 5, '2018-04-22 09:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (146, 5, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (147, 5, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (148, 5, '2018-04-25 08:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (149, 5, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (150, 5, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (151, 5, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (152, 5, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (153, 5, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (154, 6, '2018-04-01 08:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (155, 6, '2018-04-02 09:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (156, 6, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (157, 6, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (158, 6, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (159, 6, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (160, 6, '2018-04-07 08:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (161, 6, '2018-04-08 08:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (162, 6, '2018-04-09 08:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (163, 6, '2018-04-10 09:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (164, 6, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (165, 6, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (166, 6, '2018-04-13 09:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (167, 6, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (168, 6, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (169, 6, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (170, 6, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (171, 6, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (172, 6, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (173, 6, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (174, 6, '2018-04-21 08:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (175, 6, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (176, 6, '2018-04-23 08:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (177, 6, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (178, 6, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (179, 6, '2018-04-26 08:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (180, 6, '2018-04-27 08:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (181, 6, '2018-04-28 08:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (182, 6, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (183, 6, '2018-04-30 08:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (184, 7, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (185, 7, '2018-04-02 09:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (186, 7, '2018-04-03 08:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (187, 7, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (188, 7, '2018-04-05 08:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (189, 7, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (190, 7, '2018-04-07 09:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (191, 7, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (192, 7, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (193, 7, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (194, 7, '2018-04-11 08:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (195, 7, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (196, 7, '2018-04-13 08:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (197, 7, '2018-04-14 08:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (198, 7, '2018-04-15 08:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (199, 7, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (200, 7, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (201, 7, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (202, 7, '2018-04-19 09:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (203, 7, '2018-04-20 08:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (204, 7, '2018-04-21 08:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (205, 7, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (206, 7, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (207, 7, '2018-04-24 08:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (208, 7, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (209, 7, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (210, 7, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (211, 7, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (212, 7, '2018-04-29 09:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (213, 7, '2018-04-30 08:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (214, 8, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (215, 8, '2018-04-02 08:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (216, 8, '2018-04-03 09:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (217, 8, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (218, 8, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (219, 8, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (220, 8, '2018-04-07 08:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (221, 8, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (222, 8, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (223, 8, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (224, 8, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (225, 8, '2018-04-12 09:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (226, 8, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (227, 8, '2018-04-14 08:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (228, 8, '2018-04-15 08:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (229, 8, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (230, 8, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (231, 8, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (232, 8, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (233, 8, '2018-04-20 08:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (234, 8, '2018-04-21 08:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (235, 8, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (236, 8, '2018-04-23 08:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (237, 8, '2018-04-24 09:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (238, 8, '2018-04-25 08:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (239, 8, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (240, 8, '2018-04-27 08:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (241, 8, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (242, 8, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (243, 8, '2018-04-30 08:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (244, 9, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (245, 9, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (246, 9, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (247, 9, '2018-04-04 08:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (248, 9, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (249, 9, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (250, 9, '2018-04-07 08:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (251, 9, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (252, 9, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (253, 9, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (254, 9, '2018-04-11 08:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (255, 9, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (256, 9, '2018-04-13 09:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (257, 9, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (258, 9, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (259, 9, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (260, 9, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (261, 9, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (262, 9, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (263, 9, '2018-04-20 09:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (264, 9, '2018-04-21 08:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (265, 9, '2018-04-22 09:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (266, 9, '2018-04-23 08:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (267, 9, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (268, 9, '2018-04-25 08:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (269, 9, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (270, 9, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (271, 9, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (272, 9, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (273, 9, '2018-04-30 08:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (274, 10, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (275, 10, '2018-04-02 08:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (276, 10, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (277, 10, '2018-04-04 09:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (278, 10, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (279, 10, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (280, 10, '2018-04-07 08:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (281, 10, '2018-04-08 08:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (282, 10, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (283, 10, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (284, 10, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (285, 10, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (286, 10, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (287, 10, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (288, 10, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (289, 10, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (290, 10, '2018-04-17 09:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (291, 10, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (292, 10, '2018-04-19 09:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (293, 10, '2018-04-20 09:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (294, 10, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (295, 10, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (296, 10, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (297, 10, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (298, 10, '2018-04-25 08:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (299, 10, '2018-04-26 08:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (300, 10, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (301, 10, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (302, 10, '2018-04-29 09:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (303, 10, '2018-04-30 08:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (304, 11, '2018-04-01 08:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (305, 11, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (306, 11, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (307, 11, '2018-04-04 08:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (308, 11, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (309, 11, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (310, 11, '2018-04-07 08:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (311, 11, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (312, 11, '2018-04-09 09:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (313, 11, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (314, 11, '2018-04-11 08:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (315, 11, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (316, 11, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (317, 11, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (318, 11, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (319, 11, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (320, 11, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (321, 11, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (322, 11, '2018-04-19 09:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (323, 11, '2018-04-20 08:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (324, 11, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (325, 11, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (326, 11, '2018-04-23 08:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (327, 11, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (328, 11, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (329, 11, '2018-04-26 09:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (330, 11, '2018-04-27 08:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (331, 11, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (332, 11, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (333, 11, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (334, 12, '2018-04-01 09:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (335, 12, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (336, 12, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (337, 12, '2018-04-04 09:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (338, 12, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (339, 12, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (340, 12, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (341, 12, '2018-04-08 09:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (342, 12, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (343, 12, '2018-04-10 08:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (344, 12, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (345, 12, '2018-04-12 08:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (346, 12, '2018-04-13 08:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (347, 12, '2018-04-14 08:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (348, 12, '2018-04-15 09:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (349, 12, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (350, 12, '2018-04-17 09:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (351, 12, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (352, 12, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (353, 12, '2018-04-20 08:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (354, 12, '2018-04-21 08:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (355, 12, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (356, 12, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (357, 12, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (358, 12, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (359, 12, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (360, 12, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (361, 12, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (362, 12, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (363, 12, '2018-04-30 08:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (364, 13, '2018-04-01 09:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (365, 13, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (366, 13, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (367, 13, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (368, 13, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (369, 13, '2018-04-06 09:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (370, 13, '2018-04-07 08:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (371, 13, '2018-04-08 08:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (372, 13, '2018-04-09 09:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (373, 13, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (374, 13, '2018-04-11 08:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (375, 13, '2018-04-12 09:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (376, 13, '2018-04-13 09:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (377, 13, '2018-04-14 09:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (378, 13, '2018-04-15 09:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (379, 13, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (380, 13, '2018-04-17 08:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (381, 13, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (382, 13, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (383, 13, '2018-04-20 09:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (384, 13, '2018-04-21 08:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (385, 13, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (386, 13, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (387, 13, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (388, 13, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (389, 13, '2018-04-26 09:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (390, 13, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (391, 13, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (392, 13, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (393, 13, '2018-04-30 09:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (394, 14, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (395, 14, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (396, 14, '2018-04-03 09:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (397, 14, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (398, 14, '2018-04-05 08:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (399, 14, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (400, 14, '2018-04-07 08:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (401, 14, '2018-04-08 08:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (402, 14, '2018-04-09 09:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (403, 14, '2018-04-10 08:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (404, 14, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (405, 14, '2018-04-12 09:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (406, 14, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (407, 14, '2018-04-14 08:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (408, 14, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (409, 14, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (410, 14, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (411, 14, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (412, 14, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (413, 14, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (414, 14, '2018-04-21 09:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (415, 14, '2018-04-22 09:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (416, 14, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (417, 14, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (418, 14, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (419, 14, '2018-04-26 09:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (420, 14, '2018-04-27 08:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (421, 14, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (422, 14, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (423, 14, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (424, 15, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (425, 15, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (426, 15, '2018-04-03 09:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (427, 15, '2018-04-04 08:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (428, 15, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (429, 15, '2018-04-06 09:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (430, 15, '2018-04-07 08:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (431, 15, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (432, 15, '2018-04-09 09:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (433, 15, '2018-04-10 08:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (434, 15, '2018-04-11 09:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (435, 15, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (436, 15, '2018-04-13 09:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (437, 15, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (438, 15, '2018-04-15 08:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (439, 15, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (440, 15, '2018-04-17 08:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (441, 15, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (442, 15, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (443, 15, '2018-04-20 09:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (444, 15, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (445, 15, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (446, 15, '2018-04-23 08:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (447, 15, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (448, 15, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (449, 15, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (450, 15, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (451, 15, '2018-04-28 08:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (452, 15, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (453, 15, '2018-04-30 09:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (454, 16, '2018-04-01 08:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (455, 16, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (456, 16, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (457, 16, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (458, 16, '2018-04-05 09:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (459, 16, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (460, 16, '2018-04-07 08:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (461, 16, '2018-04-08 08:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (462, 16, '2018-04-09 08:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (463, 16, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (464, 16, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (465, 16, '2018-04-12 09:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (466, 16, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (467, 16, '2018-04-14 09:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (468, 16, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (469, 16, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (470, 16, '2018-04-17 08:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (471, 16, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (472, 16, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (473, 16, '2018-04-20 09:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (474, 16, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (475, 16, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (476, 16, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (477, 16, '2018-04-24 08:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (478, 16, '2018-04-25 08:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (479, 16, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (480, 16, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (481, 16, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (482, 16, '2018-04-29 09:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (483, 16, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (484, 17, '2018-04-01 08:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (485, 17, '2018-04-02 09:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (486, 17, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (487, 17, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (488, 17, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (489, 17, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (490, 17, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (491, 17, '2018-04-08 09:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (492, 17, '2018-04-09 08:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (493, 17, '2018-04-10 08:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (494, 17, '2018-04-11 09:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (495, 17, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (496, 17, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (497, 17, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (498, 17, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (499, 17, '2018-04-16 09:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (500, 17, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (501, 17, '2018-04-18 08:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (502, 17, '2018-04-19 09:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (503, 17, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (504, 17, '2018-04-21 08:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (505, 17, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (506, 17, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (507, 17, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (508, 17, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (509, 17, '2018-04-26 09:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (510, 17, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (511, 17, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (512, 17, '2018-04-29 09:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (513, 17, '2018-04-30 08:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (514, 18, '2018-04-01 08:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (515, 18, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (516, 18, '2018-04-03 08:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (517, 18, '2018-04-04 08:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (518, 18, '2018-04-05 08:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (519, 18, '2018-04-06 09:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (520, 18, '2018-04-07 08:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (521, 18, '2018-04-08 09:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (522, 18, '2018-04-09 09:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (523, 18, '2018-04-10 08:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (524, 18, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (525, 18, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (526, 18, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (527, 18, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (528, 18, '2018-04-15 09:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (529, 18, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (530, 18, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (531, 18, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (532, 18, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (533, 18, '2018-04-20 08:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (534, 18, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (535, 18, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (536, 18, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (537, 18, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (538, 18, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (539, 18, '2018-04-26 08:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (540, 18, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (541, 18, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (542, 18, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (543, 18, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (544, 19, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (545, 19, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (546, 19, '2018-04-03 08:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (547, 19, '2018-04-04 08:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (548, 19, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (549, 19, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (550, 19, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (551, 19, '2018-04-08 08:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (552, 19, '2018-04-09 09:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (553, 19, '2018-04-10 08:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (554, 19, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (555, 19, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (556, 19, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (557, 19, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (558, 19, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (559, 19, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (560, 19, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (561, 19, '2018-04-18 08:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (562, 19, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (563, 19, '2018-04-20 09:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (564, 19, '2018-04-21 08:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (565, 19, '2018-04-22 09:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (566, 19, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (567, 19, '2018-04-24 09:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (568, 19, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (569, 19, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (570, 19, '2018-04-27 08:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (571, 19, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (572, 19, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (573, 19, '2018-04-30 08:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (574, 20, '2018-04-01 08:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (575, 20, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (576, 20, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (577, 20, '2018-04-04 09:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (578, 20, '2018-04-05 09:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (579, 20, '2018-04-06 09:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (580, 20, '2018-04-07 08:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (581, 20, '2018-04-08 08:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (582, 20, '2018-04-09 09:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (583, 20, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (584, 20, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (585, 20, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (586, 20, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (587, 20, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (588, 20, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (589, 20, '2018-04-16 09:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (590, 20, '2018-04-17 09:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (591, 20, '2018-04-18 08:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (592, 20, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (593, 20, '2018-04-20 08:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (594, 20, '2018-04-21 08:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (595, 20, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (596, 20, '2018-04-23 08:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (597, 20, '2018-04-24 09:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (598, 20, '2018-04-25 08:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (599, 20, '2018-04-26 09:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (600, 20, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (601, 20, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (602, 20, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (603, 20, '2018-04-30 08:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (604, 21, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (605, 21, '2018-04-02 09:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (606, 21, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (607, 21, '2018-04-04 08:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (608, 21, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (609, 21, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (610, 21, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (611, 21, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (612, 21, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (613, 21, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (614, 21, '2018-04-11 09:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (615, 21, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (616, 21, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (617, 21, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (618, 21, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (619, 21, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (620, 21, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (621, 21, '2018-04-18 08:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (622, 21, '2018-04-19 09:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (623, 21, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (624, 21, '2018-04-21 08:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (625, 21, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (626, 21, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (627, 21, '2018-04-24 08:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (628, 21, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (629, 21, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (630, 21, '2018-04-27 08:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (631, 21, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (632, 21, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (633, 21, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (634, 22, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (635, 22, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (636, 22, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (637, 22, '2018-04-04 08:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (638, 22, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (639, 22, '2018-04-06 08:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (640, 22, '2018-04-07 09:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (641, 22, '2018-04-08 08:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (642, 22, '2018-04-09 09:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (643, 22, '2018-04-10 09:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (644, 22, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (645, 22, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (646, 22, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (647, 22, '2018-04-14 09:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (648, 22, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (649, 22, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (650, 22, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (651, 22, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (652, 22, '2018-04-19 09:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (653, 22, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (654, 22, '2018-04-21 09:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (655, 22, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (656, 22, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (657, 22, '2018-04-24 09:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (658, 22, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (659, 22, '2018-04-26 08:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (660, 22, '2018-04-27 08:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (661, 22, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (662, 22, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (663, 22, '2018-04-30 09:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (664, 23, '2018-04-01 08:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (665, 23, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (666, 23, '2018-04-03 08:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (667, 23, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (668, 23, '2018-04-05 09:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (669, 23, '2018-04-06 09:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (670, 23, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (671, 23, '2018-04-08 09:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (672, 23, '2018-04-09 09:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (673, 23, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (674, 23, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (675, 23, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (676, 23, '2018-04-13 09:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (677, 23, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (678, 23, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (679, 23, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (680, 23, '2018-04-17 08:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (681, 23, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (682, 23, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (683, 23, '2018-04-20 09:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (684, 23, '2018-04-21 08:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (685, 23, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (686, 23, '2018-04-23 08:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (687, 23, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (688, 23, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (689, 23, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (690, 23, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (691, 23, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (692, 23, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (693, 23, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (694, 24, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (695, 24, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (696, 24, '2018-04-03 09:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (697, 24, '2018-04-04 08:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (698, 24, '2018-04-05 09:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (699, 24, '2018-04-06 09:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (700, 24, '2018-04-07 09:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (701, 24, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (702, 24, '2018-04-09 09:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (703, 24, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (704, 24, '2018-04-11 08:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (705, 24, '2018-04-12 08:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (706, 24, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (707, 24, '2018-04-14 08:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (708, 24, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (709, 24, '2018-04-16 09:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (710, 24, '2018-04-17 08:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (711, 24, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (712, 24, '2018-04-19 09:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (713, 24, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (714, 24, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (715, 24, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (716, 24, '2018-04-23 08:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (717, 24, '2018-04-24 08:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (718, 24, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (719, 24, '2018-04-26 08:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (720, 24, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (721, 24, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (722, 24, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (723, 24, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (724, 25, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (725, 25, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (726, 25, '2018-04-03 08:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (727, 25, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (728, 25, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (729, 25, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (730, 25, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (731, 25, '2018-04-08 09:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (732, 25, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (733, 25, '2018-04-10 09:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (734, 25, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (735, 25, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (736, 25, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (737, 25, '2018-04-14 09:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (738, 25, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (739, 25, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (740, 25, '2018-04-17 08:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (741, 25, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (742, 25, '2018-04-19 09:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (743, 25, '2018-04-20 08:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (744, 25, '2018-04-21 09:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (745, 25, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (746, 25, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (747, 25, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (748, 25, '2018-04-25 08:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (749, 25, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (750, 25, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (751, 25, '2018-04-28 08:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (752, 25, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (753, 25, '2018-04-30 08:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (754, 26, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (755, 26, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (756, 26, '2018-04-03 09:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (757, 26, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (758, 26, '2018-04-05 09:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (759, 26, '2018-04-06 09:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (760, 26, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (761, 26, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (762, 26, '2018-04-09 09:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (763, 26, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (764, 26, '2018-04-11 08:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (765, 26, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (766, 26, '2018-04-13 08:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (767, 26, '2018-04-14 08:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (768, 26, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (769, 26, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (770, 26, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (771, 26, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (772, 26, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (773, 26, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (774, 26, '2018-04-21 08:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (775, 26, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (776, 26, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (777, 26, '2018-04-24 08:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (778, 26, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (779, 26, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (780, 26, '2018-04-27 08:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (781, 26, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (782, 26, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (783, 26, '2018-04-30 08:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (784, 27, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (785, 27, '2018-04-02 09:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (786, 27, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (787, 27, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (788, 27, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (789, 27, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (790, 27, '2018-04-07 08:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (791, 27, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (792, 27, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (793, 27, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (794, 27, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (795, 27, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (796, 27, '2018-04-13 09:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (797, 27, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (798, 27, '2018-04-15 08:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (799, 27, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (800, 27, '2018-04-17 09:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (801, 27, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (802, 27, '2018-04-19 09:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (803, 27, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (804, 27, '2018-04-21 08:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (805, 27, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (806, 27, '2018-04-23 08:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (807, 27, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (808, 27, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (809, 27, '2018-04-26 09:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (810, 27, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (811, 27, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (812, 27, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (813, 27, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (814, 28, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (815, 28, '2018-04-02 09:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (816, 28, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (817, 28, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (818, 28, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (819, 28, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (820, 28, '2018-04-07 09:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (821, 28, '2018-04-08 08:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (822, 28, '2018-04-09 09:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (823, 28, '2018-04-10 09:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (824, 28, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (825, 28, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (826, 28, '2018-04-13 08:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (827, 28, '2018-04-14 09:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (828, 28, '2018-04-15 08:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (829, 28, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (830, 28, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (831, 28, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (832, 28, '2018-04-19 09:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (833, 28, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (834, 28, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (835, 28, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (836, 28, '2018-04-23 08:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (837, 28, '2018-04-24 09:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (838, 28, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (839, 28, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (840, 28, '2018-04-27 08:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (841, 28, '2018-04-28 09:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (842, 28, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (843, 28, '2018-04-30 08:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (844, 29, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (845, 29, '2018-04-02 09:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (846, 29, '2018-04-03 08:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (847, 29, '2018-04-04 08:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 08:00:00', 'api', '2018-04-04 08:00:00', 'api');
INSERT INTO `attendance` VALUES (848, 29, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (849, 29, '2018-04-06 08:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (850, 29, '2018-04-07 08:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (851, 29, '2018-04-08 08:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (852, 29, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (853, 29, '2018-04-10 08:00:00', '2018-04-10 16:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (854, 29, '2018-04-11 08:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (855, 29, '2018-04-12 08:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (856, 29, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (857, 29, '2018-04-14 08:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (858, 29, '2018-04-15 09:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (859, 29, '2018-04-16 08:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (860, 29, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (861, 29, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (862, 29, '2018-04-19 09:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (863, 29, '2018-04-20 08:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (864, 29, '2018-04-21 08:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (865, 29, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (866, 29, '2018-04-23 09:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (867, 29, '2018-04-24 08:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (868, 29, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (869, 29, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (870, 29, '2018-04-27 08:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (871, 29, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (872, 29, '2018-04-29 08:00:00', '2018-04-29 17:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (873, 29, '2018-04-30 08:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (874, 30, '2018-04-01 09:00:00', '2018-04-01 16:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (875, 30, '2018-04-02 08:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (876, 30, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (877, 30, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (878, 30, '2018-04-05 08:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (879, 30, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (880, 30, '2018-04-07 09:00:00', '2018-04-07 17:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (881, 30, '2018-04-08 08:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (882, 30, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (883, 30, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (884, 30, '2018-04-11 09:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (885, 30, '2018-04-12 08:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (886, 30, '2018-04-13 09:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 09:00:00', 'api', '2018-04-13 09:00:00', 'api');
INSERT INTO `attendance` VALUES (887, 30, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (888, 30, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (889, 30, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (890, 30, '2018-04-17 09:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (891, 30, '2018-04-18 09:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (892, 30, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (893, 30, '2018-04-20 09:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (894, 30, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (895, 30, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (896, 30, '2018-04-23 08:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (897, 30, '2018-04-24 08:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (898, 30, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (899, 30, '2018-04-26 09:00:00', '2018-04-26 17:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (900, 30, '2018-04-27 08:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 08:00:00', 'api', '2018-04-27 08:00:00', 'api');
INSERT INTO `attendance` VALUES (901, 30, '2018-04-28 08:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (902, 30, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (903, 30, '2018-04-30 09:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (904, 31, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (905, 31, '2018-04-02 09:00:00', '2018-04-02 16:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 09:00:00', 'api', '2018-04-02 09:00:00', 'api');
INSERT INTO `attendance` VALUES (906, 31, '2018-04-03 09:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (907, 31, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (908, 31, '2018-04-05 09:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (909, 31, '2018-04-06 09:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (910, 31, '2018-04-07 08:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 08:00:00', 'api', '2018-04-07 08:00:00', 'api');
INSERT INTO `attendance` VALUES (911, 31, '2018-04-08 09:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 09:00:00', 'api', '2018-04-08 09:00:00', 'api');
INSERT INTO `attendance` VALUES (912, 31, '2018-04-09 08:00:00', '2018-04-09 16:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (913, 31, '2018-04-10 09:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 09:00:00', 'api', '2018-04-10 09:00:00', 'api');
INSERT INTO `attendance` VALUES (914, 31, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (915, 31, '2018-04-12 08:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (916, 31, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (917, 31, '2018-04-14 08:00:00', '2018-04-14 16:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (918, 31, '2018-04-15 09:00:00', '2018-04-15 17:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 09:00:00', 'api', '2018-04-15 09:00:00', 'api');
INSERT INTO `attendance` VALUES (919, 31, '2018-04-16 08:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 08:00:00', 'api', '2018-04-16 08:00:00', 'api');
INSERT INTO `attendance` VALUES (920, 31, '2018-04-17 09:00:00', '2018-04-17 16:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (921, 31, '2018-04-18 09:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 09:00:00', 'api', '2018-04-18 09:00:00', 'api');
INSERT INTO `attendance` VALUES (922, 31, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (923, 31, '2018-04-20 08:00:00', '2018-04-20 16:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (924, 31, '2018-04-21 09:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (925, 31, '2018-04-22 09:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (926, 31, '2018-04-23 08:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (927, 31, '2018-04-24 09:00:00', '2018-04-24 16:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (928, 31, '2018-04-25 08:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 08:00:00', 'api', '2018-04-25 08:00:00', 'api');
INSERT INTO `attendance` VALUES (929, 31, '2018-04-26 08:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 08:00:00', 'api', '2018-04-26 08:00:00', 'api');
INSERT INTO `attendance` VALUES (930, 31, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (931, 31, '2018-04-28 08:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (932, 31, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (933, 31, '2018-04-30 09:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (934, 32, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (935, 32, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (936, 32, '2018-04-03 09:00:00', '2018-04-03 17:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 09:00:00', 'api', '2018-04-03 09:00:00', 'api');
INSERT INTO `attendance` VALUES (937, 32, '2018-04-04 09:00:00', '2018-04-04 16:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (938, 32, '2018-04-05 08:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 08:00:00', 'api', '2018-04-05 08:00:00', 'api');
INSERT INTO `attendance` VALUES (939, 32, '2018-04-06 08:00:00', '2018-04-06 17:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 08:00:00', 'api', '2018-04-06 08:00:00', 'api');
INSERT INTO `attendance` VALUES (940, 32, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (941, 32, '2018-04-08 08:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (942, 32, '2018-04-09 08:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (943, 32, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (944, 32, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (945, 32, '2018-04-12 08:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 08:00:00', 'api', '2018-04-12 08:00:00', 'api');
INSERT INTO `attendance` VALUES (946, 32, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (947, 32, '2018-04-14 08:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 08:00:00', 'api', '2018-04-14 08:00:00', 'api');
INSERT INTO `attendance` VALUES (948, 32, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (949, 32, '2018-04-16 09:00:00', '2018-04-16 16:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (950, 32, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (951, 32, '2018-04-18 08:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (952, 32, '2018-04-19 09:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 09:00:00', 'api', '2018-04-19 09:00:00', 'api');
INSERT INTO `attendance` VALUES (953, 32, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (954, 32, '2018-04-21 09:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (955, 32, '2018-04-22 08:00:00', '2018-04-22 16:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (956, 32, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (957, 32, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (958, 32, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (959, 32, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (960, 32, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (961, 32, '2018-04-28 09:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 09:00:00', 'api', '2018-04-28 09:00:00', 'api');
INSERT INTO `attendance` VALUES (962, 32, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (963, 32, '2018-04-30 09:00:00', '2018-04-30 17:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 09:00:00', 'api', '2018-04-30 09:00:00', 'api');
INSERT INTO `attendance` VALUES (964, 33, '2018-04-01 08:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 08:00:00', 'api', '2018-04-01 08:00:00', 'api');
INSERT INTO `attendance` VALUES (965, 33, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (966, 33, '2018-04-03 08:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (967, 33, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (968, 33, '2018-04-05 09:00:00', '2018-04-05 17:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (969, 33, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (970, 33, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (971, 33, '2018-04-08 08:00:00', '2018-04-08 17:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (972, 33, '2018-04-09 09:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 09:00:00', 'api', '2018-04-09 09:00:00', 'api');
INSERT INTO `attendance` VALUES (973, 33, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (974, 33, '2018-04-11 08:00:00', '2018-04-11 17:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 08:00:00', 'api', '2018-04-11 08:00:00', 'api');
INSERT INTO `attendance` VALUES (975, 33, '2018-04-12 09:00:00', '2018-04-12 17:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (976, 33, '2018-04-13 08:00:00', '2018-04-13 17:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (977, 33, '2018-04-14 09:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (978, 33, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (979, 33, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (980, 33, '2018-04-17 09:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 09:00:00', 'api', '2018-04-17 09:00:00', 'api');
INSERT INTO `attendance` VALUES (981, 33, '2018-04-18 08:00:00', '2018-04-18 16:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (982, 33, '2018-04-19 08:00:00', '2018-04-19 17:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (983, 33, '2018-04-20 08:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 08:00:00', 'api', '2018-04-20 08:00:00', 'api');
INSERT INTO `attendance` VALUES (984, 33, '2018-04-21 09:00:00', '2018-04-21 17:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 09:00:00', 'api', '2018-04-21 09:00:00', 'api');
INSERT INTO `attendance` VALUES (985, 33, '2018-04-22 09:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 09:00:00', 'api', '2018-04-22 09:00:00', 'api');
INSERT INTO `attendance` VALUES (986, 33, '2018-04-23 08:00:00', '2018-04-23 17:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 08:00:00', 'api', '2018-04-23 08:00:00', 'api');
INSERT INTO `attendance` VALUES (987, 33, '2018-04-24 08:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 08:00:00', 'api', '2018-04-24 08:00:00', 'api');
INSERT INTO `attendance` VALUES (988, 33, '2018-04-25 09:00:00', '2018-04-25 16:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (989, 33, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (990, 33, '2018-04-27 09:00:00', '2018-04-27 17:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (991, 33, '2018-04-28 08:00:00', '2018-04-28 17:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (992, 33, '2018-04-29 08:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 08:00:00', 'api', '2018-04-29 08:00:00', 'api');
INSERT INTO `attendance` VALUES (993, 33, '2018-04-30 08:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');
INSERT INTO `attendance` VALUES (994, 34, '2018-04-01 09:00:00', '2018-04-01 17:00:00', 'a675154463d47e82e91ff9ecf51ddb89', '2018-04-01 09:00:00', 'api', '2018-04-01 09:00:00', 'api');
INSERT INTO `attendance` VALUES (995, 34, '2018-04-02 08:00:00', '2018-04-02 17:00:00', 'de03eeb24cb1e047fc2a93d91289713f', '2018-04-02 08:00:00', 'api', '2018-04-02 08:00:00', 'api');
INSERT INTO `attendance` VALUES (996, 34, '2018-04-03 08:00:00', '2018-04-03 16:00:00', 'c90baae94751996facd3e799e2275e68', '2018-04-03 08:00:00', 'api', '2018-04-03 08:00:00', 'api');
INSERT INTO `attendance` VALUES (997, 34, '2018-04-04 09:00:00', '2018-04-04 17:00:00', '9cf4ed9bbbcb1fc12f7917e24e3914c6', '2018-04-04 09:00:00', 'api', '2018-04-04 09:00:00', 'api');
INSERT INTO `attendance` VALUES (998, 34, '2018-04-05 09:00:00', '2018-04-05 16:00:00', 'a5b2507e95a4b1aadff2f76aab435a98', '2018-04-05 09:00:00', 'api', '2018-04-05 09:00:00', 'api');
INSERT INTO `attendance` VALUES (999, 34, '2018-04-06 09:00:00', '2018-04-06 16:00:00', '580cec9205acb5d9ab941cff51206401', '2018-04-06 09:00:00', 'api', '2018-04-06 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1000, 34, '2018-04-07 09:00:00', '2018-04-07 16:00:00', 'd87cb29a8272212a36e3c2cac54a7215', '2018-04-07 09:00:00', 'api', '2018-04-07 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1001, 34, '2018-04-08 08:00:00', '2018-04-08 16:00:00', '4d57bc3297a71923b7a1be9f9c316f06', '2018-04-08 08:00:00', 'api', '2018-04-08 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1002, 34, '2018-04-09 08:00:00', '2018-04-09 17:00:00', '5029a52a54ed12e8cd642771c4ad3dee', '2018-04-09 08:00:00', 'api', '2018-04-09 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1003, 34, '2018-04-10 08:00:00', '2018-04-10 17:00:00', 'f4fced0d3a212ec7dcb406477e65bda4', '2018-04-10 08:00:00', 'api', '2018-04-10 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1004, 34, '2018-04-11 09:00:00', '2018-04-11 16:00:00', '5db174afe8fb4767b66e6333d83feba4', '2018-04-11 09:00:00', 'api', '2018-04-11 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1005, 34, '2018-04-12 09:00:00', '2018-04-12 16:00:00', '57e2b8a68aaa0db34b597b683993d5ad', '2018-04-12 09:00:00', 'api', '2018-04-12 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1006, 34, '2018-04-13 08:00:00', '2018-04-13 16:00:00', '0c3529d38adc096238d13731bca11f31', '2018-04-13 08:00:00', 'api', '2018-04-13 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1007, 34, '2018-04-14 09:00:00', '2018-04-14 17:00:00', 'cc5fda572ed529f977aebe8e31340e6f', '2018-04-14 09:00:00', 'api', '2018-04-14 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1008, 34, '2018-04-15 08:00:00', '2018-04-15 16:00:00', 'c67e2a7c00d10c98e11e3ae0d6e3093a', '2018-04-15 08:00:00', 'api', '2018-04-15 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1009, 34, '2018-04-16 09:00:00', '2018-04-16 17:00:00', 'e28f78445fbcf7adb2828dd765cfa784', '2018-04-16 09:00:00', 'api', '2018-04-16 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1010, 34, '2018-04-17 08:00:00', '2018-04-17 17:00:00', '9d2facf29677b4b75184a4df6569164b', '2018-04-17 08:00:00', 'api', '2018-04-17 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1011, 34, '2018-04-18 08:00:00', '2018-04-18 17:00:00', 'e0d194bb81ff989d2cc87e9495287fdb', '2018-04-18 08:00:00', 'api', '2018-04-18 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1012, 34, '2018-04-19 08:00:00', '2018-04-19 16:00:00', '815140c6cccd3dc7e732f36e2bcaaa54', '2018-04-19 08:00:00', 'api', '2018-04-19 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1013, 34, '2018-04-20 09:00:00', '2018-04-20 17:00:00', '1c6ddb59e679125df50a45847a22385f', '2018-04-20 09:00:00', 'api', '2018-04-20 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1014, 34, '2018-04-21 08:00:00', '2018-04-21 16:00:00', 'faa076d5d96d530513a258dd74e0bb3c', '2018-04-21 08:00:00', 'api', '2018-04-21 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1015, 34, '2018-04-22 08:00:00', '2018-04-22 17:00:00', '09c200b996b355bf50f9df7da1eb485f', '2018-04-22 08:00:00', 'api', '2018-04-22 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1016, 34, '2018-04-23 09:00:00', '2018-04-23 16:00:00', 'afd06dc73ed6157793cd9719d3d5cdbc', '2018-04-23 09:00:00', 'api', '2018-04-23 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1017, 34, '2018-04-24 09:00:00', '2018-04-24 17:00:00', 'a3bd5c9d35f11c87ea1f922c4e7f2139', '2018-04-24 09:00:00', 'api', '2018-04-24 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1018, 34, '2018-04-25 09:00:00', '2018-04-25 17:00:00', 'ff8a1517cc9f9dea70d3dfe659293f19', '2018-04-25 09:00:00', 'api', '2018-04-25 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1019, 34, '2018-04-26 09:00:00', '2018-04-26 16:00:00', 'adf882e9798ae7a9cbb2a6eca1a2604a', '2018-04-26 09:00:00', 'api', '2018-04-26 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1020, 34, '2018-04-27 09:00:00', '2018-04-27 16:00:00', '8d3223c240990e957ad4bcdc5631e0b1', '2018-04-27 09:00:00', 'api', '2018-04-27 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1021, 34, '2018-04-28 08:00:00', '2018-04-28 16:00:00', '88a21e902950c9116f0fb615e1b61b69', '2018-04-28 08:00:00', 'api', '2018-04-28 08:00:00', 'api');
INSERT INTO `attendance` VALUES (1022, 34, '2018-04-29 09:00:00', '2018-04-29 16:00:00', '883cd0255d08c794c9f3248fdc6908b0', '2018-04-29 09:00:00', 'api', '2018-04-29 09:00:00', 'api');
INSERT INTO `attendance` VALUES (1023, 34, '2018-04-30 08:00:00', '2018-04-30 16:00:00', 'baa5e452b799f2876654cd9cb8acc2a6', '2018-04-30 08:00:00', 'api', '2018-04-30 08:00:00', 'api');

-- ----------------------------
-- Table structure for attendance_key
-- ----------------------------
DROP TABLE IF EXISTS `attendance_key`;
CREATE TABLE `attendance_key`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance_key
-- ----------------------------
INSERT INTO `attendance_key` VALUES (1, 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for attendance_time
-- ----------------------------
DROP TABLE IF EXISTS `attendance_time`;
CREATE TABLE `attendance_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` time(0) NULL DEFAULT NULL,
  `end_time` time(0) NULL DEFAULT NULL,
  `department_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance_time
-- ----------------------------
INSERT INTO `attendance_time` VALUES (1, '08:00:00', '17:00:00', 12);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `department_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `master` bigint(20) NULL DEFAULT NULL COMMENT '部门经理ID',
  `introduce` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门简介',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (9, '市场部', 9, '市场部是一个企业中营销组织架构的重要组成部分，通常包含产品市场部、市场开发部、市场宣传部和销售支持部，在企业中具有巨大的作用。', '2018-04-04 23:45:30', '1001', '2018-04-04 23:45:34', '1001');
INSERT INTO `department` VALUES (11, '客服部', 11, '主要体现了一种以客户为导向的价值观，它整合及管理在预先设定的最优成本——服务组合中的客户界面的所有要素。广义而言，任何能提高客户满意度的内容都属于客户服务的范围。', '2018-04-04 23:47:38', '1001', '2018-04-04 23:47:42', '1001');
INSERT INTO `department` VALUES (12, '生产部', 12, '负责对各种设备事故、工伤、伤亡事故、急性中毒事故以及环境污染事故的调查处理，并制订改进措施计划', '2018-04-04 23:49:01', '1001', '2018-04-04 23:49:06', '1001');
INSERT INTO `department` VALUES (13, '采购部', 13, '公司中生产中负责生产物资采购的部门。', '2018-04-04 23:49:48', '1001', '2018-04-04 23:49:53', '1001');
INSERT INTO `department` VALUES (16, '车间生产', 16, '五金制品，出现在经济生活、政治生活以及军事活动的各个角落。五金类产品种类繁多，规格各异，但是五金类产品在现代生活中又起着不可替代的作用，选择好的五金配件可以使很多结构件使用起来更安全、便捷。', '2018-04-04 23:53:08', '1001', '2018-04-04 23:53:12', '1001');
INSERT INTO `department` VALUES (19, '物流中心', 19, '物流中心是物流系统中的基础设施。它的规划、筹建、运行与完善，涉及交通、物资、商业、外贸、工业、建筑、农业、金融等多个部门、多个行业的企业。不同部门及企业对其内涵及外延的理解不尽一致。', '2018-04-04 23:57:55', '1001', '2018-04-04 23:57:59', '1001');
INSERT INTO `department` VALUES (20, '仓库', 20, '存储成品与物料', '2018-04-04 23:58:38', '1001', '2018-04-04 23:58:53', '1001');
INSERT INTO `department` VALUES (23, '人事部', 23, '人事部是一个企业或者团体的人力资源和企业公共事务的管理部门 。现在为强化人的重要性，分离出人力资源部门。一般意义上人力资源部门应该是人事部的发展，但不能说人事部本身具有缺陷，只是一般意义上的解说歪曲了人事部的意义。人力资源的意义发展是其本身职能的发展而非部门名称的原因，因此人事部并没有过时之说。其本身职能的变化和发展应该具有时代意义。', '2018-04-05 00:01:36', '1001', '2018-04-05 00:01:40', '1001');
INSERT INTO `department` VALUES (24, '后勤部', 24, '后勤部就是以后勤保障为主要工作的部门。该部门直接作用于团体内部其它部门，对其它部门的正常运作具有至关重要的作用，对实现团体目标任务起间接作用；简言之，后勤部是为其它各部门职能能够顺利实现提供物质服务的一个部门。在中国人民解放军队伍里，后勤部是师以上单位后勤机关部门，是主管部队后勤工作的机构。当前军队后勤保障主要有“指挥、保障合一型”与“指挥、保障分离”型两种。前者指的是后勤领导机关与后勤部队合而为一，后者则是后勤领导机关与后勤部队相互分离。', '2018-04-05 00:02:23', '1001', '2018-04-05 00:02:27', '1001');
INSERT INTO `department` VALUES (25, '培训部', 25, '根据公司业务发展节奏完成启动培训和项目培训以及新员工岗前培训，根据公司领导要求制定培训计划，编制培训资料，包括课件以及文档资料', '2018-04-05 00:03:51', '1001', '2018-04-05 00:03:55', '1001');
INSERT INTO `department` VALUES (26, '财务部', 26, '财务部门是利用会计部门收集的信息进行再加工、分析和决策支持,它主要是为企业内部经营者服务的部门。财务部门负责人务必将财务部门塑造成企业的核心部门，无论是集团公司财务部，还是生产型企业财务部。因为财务部门是企业资金控制的最后环节，一旦现金流出，发生的损失要挽回就相当的困难了。', '2018-04-05 00:04:46', '1001', '2018-04-05 00:04:51', '1001');
INSERT INTO `department` VALUES (28, '董事会', 29, '董事会，是由董事组成的、对内掌管公司事务、对外代表公司的经营决策和业务执行机构，公司设董事会，由股东（大）会选举。董事会设董事长一人，副董事长，董事长、副董事长的产生办法由公司章程规定，一般由董事会选举产生。董事任期三年，任期届满，可连选连任，董事在任期届满前，股东会不得无故解除其职务。', '2018-04-05 00:06:49', '1001', '2018-04-05 00:06:53', '1001');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '工号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `join_time` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `politics` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话1',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `school` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `education` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `last_login` datetime(0) NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `department_id` bigint(20) NULL DEFAULT NULL COMMENT '部门',
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `ready` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否正式员工',
  `del_flg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, '王辉', 28, '50a4ba9facde4f69bf6c573fd77dd788', '男', '2018-04-27 16:13:09', '汉', '党员', '重庆市渝北区大竹林街道斑竹路12号', '1990-08-17', '13345671234', 'wanghui@depth.com', '西南大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 10:02:34', '1001', '2018-04-27 16:13:09', '王宏');
INSERT INTO `emp` VALUES (2, '李勤', 27, '98e41bf5b03b5855c06b7899e8a30dfb', '男', '2018-04-27 16:13:12', '汉', '党员', '重庆市渝中区瑞泰路10号', '1991-07-10', '18112345678', 'liqin@depth.com', '西南大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:05:49', '1001', '2018-04-27 16:13:12', '王宏');
INSERT INTO `emp` VALUES (3, '赵力', 27, 'e79ee87f6b5524c5be7a17ed4268ef4b', '男', '2018-04-27 16:13:06', '汉', '团员', '重庆市沙坪坝区小龙坎街道156号', '1991-06-05', '15578945623', 'zhaoli@depth.com', '重庆大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:08:11', '1001', '2018-05-02 13:41:22', '王宏');
INSERT INTO `emp` VALUES (4, '陈宇涵', 28, NULL, '男', '2018-04-06 11:08:55', '汉', '团员', '重庆市沙坪坝区小龙坎街道189号', '1990-04-07', '18822224545', 'chenyuhan@depth.com', '重庆交通大学', '本科', NULL, NULL, 12, '普通职员', '0', '0', '2018-04-07 11:10:23', '1001', '2018-04-07 11:10:32', '1001');
INSERT INTO `emp` VALUES (5, '程晨', 27, NULL, '女', '2018-04-07 11:11:11', '汉', '团员', '重庆市南岸区镇西街道45号', '1991-03-14', '15688887474', 'chengchen@depth.com', '重庆文理学院', '本科', NULL, NULL, 12, '普通职员', '0', '0', '2018-04-07 11:12:32', '1001', '2018-04-07 11:12:38', '1001');
INSERT INTO `emp` VALUES (6, '王华', 28, '1961799428c5c46f2b3d75df06cdd92e', '男', '2018-04-27 16:13:18', '汉', '团员', '重庆市江北区盘溪街道78号', '1991-07-10', '16678784545', 'wanghua@depth.com', '华南大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:18:06', '1001', '2018-04-27 16:13:18', '王宏');
INSERT INTO `emp` VALUES (7, '张珊', 28, NULL, '女', '2018-04-05 11:03:23', '汉', '团员', '重庆市江北区盘溪街道178号', '1991-07-10', '16678784545', 'wanghua@depth.com', '华南大学', '本科', NULL, NULL, 12, '普通职员', '0', '0', '2018-04-07 11:20:13', '1001', '2018-04-07 11:20:13', '1001');
INSERT INTO `emp` VALUES (8, '张静', 28, '1961799428c5c46f2b3d75df06cdd92e', '女', '2018-04-27 16:13:21', '汉', '团员', '重庆市江南区高昂街道17号', '1991-07-10', '16678784545', 'zhangjing@depth.com', '华南大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:23:00', '1001', '2018-04-27 16:13:21', '王宏');
INSERT INTO `emp` VALUES (9, '张云', 28, '1961799428c5c46f2b3d75df06cdd92e', '男', '2018-04-05 11:03:23', '汉', '团员', '重庆市江南区高昂街道147号', '1991-07-10', '16678784545', 'zhangyun@depth.com', '华南大学', '本科', NULL, NULL, 9, '经理', '1', '0', '2018-04-07 11:23:32', '1001', '2018-04-07 11:23:32', '1001');
INSERT INTO `emp` VALUES (10, '张宇', 28, '1961799428c5c46f2b3d75df06cdd92e', '男', '2018-04-26 21:18:27', '汉', '团员', '重庆市江南区高昂街道14号', '1991-07-10', '16678784545', 'zhangyu@depth.com', '华东大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:24:10', '1001', '2018-04-26 21:18:27', '王宏');
INSERT INTO `emp` VALUES (11, '王立', 28, '1961799428c5c46f2b3d75df06cdd92e', '男', '2018-04-05 11:03:23', '汉', '团员', '重庆市江南区高昂街道104号', '1991-07-10', '16678784545', 'wangli@depth.com', '华东大学', '本科', NULL, NULL, 11, '经理', '1', '0', '2018-04-07 11:24:39', '1001', '2018-04-07 11:24:39', '1001');
INSERT INTO `emp` VALUES (12, '王宏', 28, '1961799428c5c46f2b3d75df06cdd92e', '男', '2018-04-05 11:03:23', '汉', '汉', '重庆市渝北区高斯街道4号', '1991-07-10', '16678784545', 'wanghong@depth.com', '华东大学', '本科', NULL, NULL, 12, '经理', '1', '0', '2018-04-07 11:25:25', '1001', '2018-04-27 16:06:46', '王宏');
INSERT INTO `emp` VALUES (13, '李林', 28, '', '女', '2018-04-05 11:03:23', '汉', '党员', '重庆市渝北区高斯街道40号', '1991-07-10', '16678784545', 'lilin@depth.com', '西南大学', '本科', NULL, NULL, 13, '经理', '1', '0', '2018-04-07 11:26:02', '1001', '2018-04-07 11:26:02', '1001');
INSERT INTO `emp` VALUES (14, '胡丽', 28, '1961799428c5c46f2b3d75df06cdd92e', '女', '2018-04-27 16:13:25', '汉', '党员', '重庆市渝南区高斯街道40号', '1991-07-10', '16678784545', 'huli@depth.com', '西南大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:26:42', '1001', '2018-04-27 16:13:25', '王宏');
INSERT INTO `emp` VALUES (15, '胡户', 28, 'dbcfabaa2ef238bb3bea1b0cb0628ef8', '女', '2018-04-27 16:13:27', '汉', '党员', '重庆市渝南区高斯街道40号', '1991-07-10', '15978004545', 'huhu@depth.com', '成都大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:33:41', '1001', '2018-04-27 16:13:27', '王宏');
INSERT INTO `emp` VALUES (16, '胡旺', 28, '', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市江北区阿斯街道4号', '1991-07-10', '15978004545', 'huwang@depth.com', '成都大学', '本科', NULL, NULL, 16, '经理', '1', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES (17, '柳云龙', 28, 'dbcfabaa2ef238bb3bea1b0cb0628ef8', '男', '2018-04-27 16:12:50', '汉', '党员', '重庆市渝南区高斯街道40号', '1992-07-10', '15978004545', 'liuyunlong@depth.com', '四川师范大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:33:41', '1001', '2018-04-27 16:12:50', '王宏');
INSERT INTO `emp` VALUES (18, '王妮', 28, '', '女', '2018-05-15 11:03:23', '汉', '党员', '重庆市沙坪坝小龙坎街道40号', '1991-07-10', '18978004545', 'wangni@depth.com', '重庆大学', '本科', NULL, NULL, 12, '普通职员', '0', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES (19, '张兰', 28, '', '女', '2018-02-05 11:03:23', '汉', '党员', '重庆市沙坪坝区高斯街道40号', '1990-07-10', '15978004545', 'zhanglan@depth.com', '西南大学', '本科', NULL, NULL, 19, '经理', '1', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES (20, '杨云', 28, '', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市江南区高斯街道40号', '1992-07-10', '18778004545', 'yangyun@depth.com', '复旦大学', '本科', NULL, NULL, 20, '经理', '1', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES (21, '杨和兰', 28, 'dbcfabaa2ef238bb3bea1b0cb0628ef8', '女', '2018-04-27 16:12:46', '汉', '党员', '重庆市沙坪坝区高斯街道40号', '1991-07-10', '15978004545', 'huhu@depth.com', '复旦大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:33:41', '1001', '2018-04-27 16:12:46', '王宏');
INSERT INTO `emp` VALUES (22, '马思怡', 28, '', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市荣昌区昌源街道40号', '1991-07-10', '13358004545', 'masiyi@depth.com', '成都大学', '本科', NULL, NULL, 12, '普通职员', '0', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES (23, '胡宇', 28, 'd651075d95b0fa4e3344cfa884fc0082', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市荣昌区惠民街道4号', '1991-06-12', '15978004545', 'huyu@depth.com', '成都大学', '本科', NULL, NULL, 23, '经理', '1', '0', '2018-04-20 13:58:40', '1001', '2018-04-24 19:42:01', '胡宇');
INSERT INTO `emp` VALUES (24, '马沂峰', 28, NULL, '男', '2018-05-05 11:03:23', '汉', '党员', '重庆市荣昌区高斯街道40号', '1992-07-18', '15978004545', 'mayufeng@depth.com', '四川师范大学', '本科', NULL, NULL, 24, '经理', '1', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES (25, '王器', 28, NULL, '女', '2018-05-15 11:03:23', '汉', '党员', '重庆市荣昌区昌源街道40号', '1991-07-19', '18978004545', 'wangqi@depth.com', '重庆大学', '本科', NULL, NULL, 25, '经理', '1', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES (26, '吴宇', 28, NULL, '女', '2018-02-05 11:03:23', '汉', '党员', '重庆市荣昌区黄金港40号', '1990-02-10', '15878004545', 'wuyu@depth.com', '西南大学', '本科', NULL, NULL, 26, '经理', '1', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES (27, '杨辉', 28, 'ee6cb383bb8816b7792d673182d6ee1d', '女', '2018-04-27 16:12:44', '汉', '党员', '重庆市荣昌区打勾街道40号', '1992-01-10', '17578004545', 'yanghui@depth.com', '复旦大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-07 11:39:27', '1001', '2018-04-27 16:12:44', '王宏');
INSERT INTO `emp` VALUES (28, '马易', 28, NULL, '男', '2018-03-05 11:03:23', '汉', '党员', '重庆市荣昌区水口街道40号', '1991-11-10', '15378004545', 'mayi@depth.com', '复旦大学', '本科', NULL, NULL, 12, '普通职员', '0', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES (29, '甄鑫', 22, NULL, '男', NULL, '汉', '团员', '重庆市綦江区虹桥路32号', '1995-07-12', '15956568888', 'zhenxin@depth.com', '西南大学', '本科', NULL, NULL, 12, '普通职员', '0', '0', '2018-04-21 00:51:27', '胡宇', '2018-04-21 00:51:27', '胡宇');
INSERT INTO `emp` VALUES (30, '王远', 30, NULL, '男', NULL, '汉', '团员', '重庆市渝中区人和路22号', '1988-02-03', '13156568989', 'wangyuan@depth.com', '华北大学', '本科', NULL, NULL, 12, '普通职员', '0', '0', '2018-04-23 10:38:04', '胡宇', '2018-04-23 10:38:04', '胡宇');
INSERT INTO `emp` VALUES (31, '张三风', 32, '1ecabe6d32a1247afe024d3ee0da2719', '男', '2018-04-26 21:18:35', '汉', '汉', '重庆市章叁区刘家路19号', '1994-02-10', '13123562356', 'zhangsanfeng@depth.com', '加里敦大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-23 14:27:01', '胡宇', '2018-04-27 16:11:52', '王宏');
INSERT INTO `emp` VALUES (32, '约翰', 25, NULL, '男', NULL, '汉', '团员', '重庆市南岸区步行街32号', '1994-02-11', '15589892323', 'yuehan@depth.com', '新疆大学', '本科', NULL, NULL, 13, '普通职员', '0', '0', '2018-04-23 14:35:49', '胡宇', '2018-04-23 14:35:49', '胡宇');
INSERT INTO `emp` VALUES (33, '王大锤', 35, 'a8b6cdcb8d2fb22d3bbf4a1b0943cd17', '男', '2018-04-24 22:54:03', '汉', '团员', '重庆市浦江区天桥路32号', '1989-02-08', '13156238989', 'wangdachui@depth.com', '某某大学', '本科', NULL, NULL, 12, '普通职员', '1', '0', '2018-04-23 21:24:08', '胡宇', '2018-04-24 22:54:03', '王宏');
INSERT INTO `emp` VALUES (34, '李想', 22, NULL, '男', NULL, '汉', '党员', '重庆市綦江区虹桥路32号', '1990-06-12', '13156562323', 'lixiang@depth.com', '四川大学', '本科', NULL, NULL, 9, '普通职员', '0', '0', '2018-04-23 22:53:55', '胡宇', '2018-04-23 22:53:55', '胡宇');

-- ----------------------------
-- Table structure for invite_post
-- ----------------------------
DROP TABLE IF EXISTS `invite_post`;
CREATE TABLE `invite_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) NULL DEFAULT NULL COMMENT '员工ID',
  `emp_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `department_id` bigint(11) NULL DEFAULT NULL,
  `department_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approver` bigint(20) NULL DEFAULT NULL COMMENT '审批人',
  `entry_time` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '招聘表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invite_post
-- ----------------------------
INSERT INTO `invite_post` VALUES (1, 32, '约翰', '0', 13, '采购部', 23, '2018-04-23 14:35:49', '2018-04-23 14:35:49', '胡宇', '2018-04-23 14:35:49', '胡宇');
INSERT INTO `invite_post` VALUES (2, 33, '王大锤', '1', 12, '生产部', 12, '2018-04-23 21:24:08', '2018-04-23 21:24:08', '胡宇', '2018-04-24 22:54:03', '王宏');
INSERT INTO `invite_post` VALUES (3, 34, '李想', '0', 9, '市场部', 23, '2018-04-23 22:53:55', '2018-04-23 22:53:55', '胡宇', '2018-04-23 22:53:55', '胡宇');
INSERT INTO `invite_post` VALUES (4, 1, '王辉', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:09', '王宏');
INSERT INTO `invite_post` VALUES (5, 2, '李勤', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:11', '王宏');
INSERT INTO `invite_post` VALUES (6, 3, '赵力', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:06', '王宏');
INSERT INTO `invite_post` VALUES (7, 4, '陈宇涵', '2', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:14', '王宏');
INSERT INTO `invite_post` VALUES (8, 5, '程晨', '2', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-26 09:50:45', '王宏');
INSERT INTO `invite_post` VALUES (9, 6, '王华', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:17', '王宏');
INSERT INTO `invite_post` VALUES (10, 7, '张珊', '2', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:19', '王宏');
INSERT INTO `invite_post` VALUES (11, 8, '张静', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:21', '王宏');
INSERT INTO `invite_post` VALUES (12, 10, '张宇', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-26 21:18:28', '王宏');
INSERT INTO `invite_post` VALUES (13, 14, '胡丽', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:24', '王宏');
INSERT INTO `invite_post` VALUES (14, 15, '胡户', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:13:26', '王宏');
INSERT INTO `invite_post` VALUES (15, 17, '柳云龙', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:12:50', '王宏');
INSERT INTO `invite_post` VALUES (16, 18, '王妮', '0', 12, '生产部', 23, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-24 21:49:13', '胡宇');
INSERT INTO `invite_post` VALUES (17, 21, '杨和兰', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:12:46', '王宏');
INSERT INTO `invite_post` VALUES (18, 22, '马思怡', '0', 12, '生产部', 23, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-24 21:49:13', '胡宇');
INSERT INTO `invite_post` VALUES (19, 27, '杨辉', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-27 16:12:43', '王宏');
INSERT INTO `invite_post` VALUES (21, 30, '王远', '0', 12, '生产部', 23, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-24 21:49:13', '胡宇');
INSERT INTO `invite_post` VALUES (22, 31, '张三丰', '1', 12, '生产部', 12, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-26 21:18:36', '王宏');
INSERT INTO `invite_post` VALUES (23, 28, '马易', '0', 12, '生产部', 23, '2018-04-24 21:49:13', '2018-04-24 21:49:13', '胡宇', '2018-04-24 21:49:13', '胡宇');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(11) NULL DEFAULT NULL COMMENT '员工ID',
  `base` int(11) NULL DEFAULT 0 COMMENT '基本工资',
  `bonus` int(11) NULL DEFAULT 0 COMMENT '奖金',
  `subsidy` int(11) NULL DEFAULT 0 COMMENT '补贴',
  `comment` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '薪资表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (35, 1, 6000, 0, 0, '给你涨工资啦', '2018-05-03 09:13:44', '111', '2018-05-03 15:16:54', '王宏');
INSERT INTO `salary` VALUES (36, 2, 5000, 0, 0, NULL, '2018-05-03 09:13:45', '111', '2018-05-03 09:13:45', '111');
INSERT INTO `salary` VALUES (37, 3, 5000, 200, 0, NULL, '2018-05-03 09:13:45', '111', '2018-05-03 16:53:34', '王宏');
INSERT INTO `salary` VALUES (38, 4, 5000, 0, 0, NULL, '2018-05-03 09:13:45', '111', '2018-05-03 09:13:45', '111');
INSERT INTO `salary` VALUES (39, 5, 5000, 0, 0, NULL, '2018-05-03 09:13:45', '111', '2018-05-03 09:13:45', '111');
INSERT INTO `salary` VALUES (40, 6, 5000, 0, 0, NULL, '2018-05-03 09:13:45', '111', '2018-05-03 09:13:45', '111');
INSERT INTO `salary` VALUES (41, 7, 5000, 0, 0, NULL, '2018-05-03 09:13:45', '111', '2018-05-03 09:13:45', '111');
INSERT INTO `salary` VALUES (42, 8, 5000, 200, 0, NULL, '2018-05-03 09:13:46', '111', '2018-05-03 16:54:28', '王宏');
INSERT INTO `salary` VALUES (43, 9, 6000, 0, 0, NULL, '2018-05-03 09:13:46', '111', '2018-05-03 09:13:46', '111');
INSERT INTO `salary` VALUES (44, 10, 5000, 0, 0, NULL, '2018-05-03 09:13:46', '111', '2018-05-03 09:13:46', '111');
INSERT INTO `salary` VALUES (45, 11, 6000, 0, 0, NULL, '2018-05-03 09:13:46', '111', '2018-05-03 09:13:46', '111');
INSERT INTO `salary` VALUES (46, 12, 6000, 0, 0, NULL, '2018-05-03 09:13:46', '111', '2018-05-03 09:13:46', '111');
INSERT INTO `salary` VALUES (47, 13, 6000, 0, 0, NULL, '2018-05-03 09:13:46', '111', '2018-05-03 09:13:46', '111');
INSERT INTO `salary` VALUES (48, 14, 5000, 0, 0, NULL, '2018-05-03 09:13:46', '111', '2018-05-03 09:13:46', '111');
INSERT INTO `salary` VALUES (49, 15, 5000, 0, 0, NULL, '2018-05-03 09:13:47', '111', '2018-05-03 09:13:47', '111');
INSERT INTO `salary` VALUES (50, 16, 6000, 0, 0, NULL, '2018-05-03 09:13:47', '111', '2018-05-03 09:13:47', '111');
INSERT INTO `salary` VALUES (51, 17, 5000, 0, 0, NULL, '2018-05-03 09:13:47', '111', '2018-05-03 09:13:47', '111');
INSERT INTO `salary` VALUES (52, 18, 5000, 0, 0, NULL, '2018-05-03 09:13:47', '111', '2018-05-03 09:13:47', '111');
INSERT INTO `salary` VALUES (53, 19, 6000, 0, 0, NULL, '2018-05-03 09:13:47', '111', '2018-05-03 09:13:47', '111');
INSERT INTO `salary` VALUES (54, 20, 6000, 0, 0, NULL, '2018-05-03 09:13:47', '111', '2018-05-03 09:13:47', '111');
INSERT INTO `salary` VALUES (55, 21, 5000, 0, 0, NULL, '2018-05-03 09:13:47', '111', '2018-05-03 09:13:47', '111');
INSERT INTO `salary` VALUES (56, 22, 5000, 0, 0, NULL, '2018-05-03 09:13:48', '111', '2018-05-03 09:13:48', '111');
INSERT INTO `salary` VALUES (57, 23, 6000, 0, 0, NULL, '2018-05-03 09:13:48', '111', '2018-05-03 09:13:48', '111');
INSERT INTO `salary` VALUES (58, 24, 6000, 0, 0, NULL, '2018-05-03 09:13:48', '111', '2018-05-03 09:13:48', '111');
INSERT INTO `salary` VALUES (59, 25, 6000, 0, 0, NULL, '2018-05-03 09:13:48', '111', '2018-05-03 09:13:48', '111');
INSERT INTO `salary` VALUES (60, 26, 6000, 0, 0, NULL, '2018-05-03 09:13:48', '111', '2018-05-03 09:13:48', '111');
INSERT INTO `salary` VALUES (61, 27, 5000, 0, 0, NULL, '2018-05-03 09:13:48', '111', '2018-05-03 09:13:48', '111');
INSERT INTO `salary` VALUES (62, 28, 5000, 0, 0, NULL, '2018-05-03 09:13:48', '111', '2018-05-03 09:13:48', '111');
INSERT INTO `salary` VALUES (63, 29, 6000, 0, 0, NULL, '2018-05-03 09:13:49', '111', '2018-05-03 09:13:49', '111');
INSERT INTO `salary` VALUES (64, 30, 5000, 0, 0, NULL, '2018-05-03 09:13:49', '111', '2018-05-03 09:13:49', '111');
INSERT INTO `salary` VALUES (65, 31, 5000, 0, 0, NULL, '2018-05-03 09:13:49', '111', '2018-05-03 09:13:49', '111');
INSERT INTO `salary` VALUES (66, 32, 5000, 0, 0, NULL, '2018-05-03 09:13:49', '111', '2018-05-03 09:13:49', '111');
INSERT INTO `salary` VALUES (67, 33, 5000, 0, 0, NULL, '2018-05-03 09:13:49', '111', '2018-05-03 09:13:49', '111');
INSERT INTO `salary` VALUES (68, 34, 5000, 0, 0, NULL, '2018-05-03 09:13:49', '111', '2018-05-03 09:13:49', '111');

-- ----------------------------
-- Table structure for salary_history
-- ----------------------------
DROP TABLE IF EXISTS `salary_history`;
CREATE TABLE `salary_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) NULL DEFAULT NULL COMMENT '员工ID',
  `salary` decimal(10, 0) NULL DEFAULT NULL COMMENT '薪资',
  `comment` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 416 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '历史薪资表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary_history
-- ----------------------------
INSERT INTO `salary_history` VALUES (8, 1, 5500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (9, 1, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (10, 1, 10500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (11, 1, 5000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (12, 1, 8500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (13, 1, 8000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (14, 1, 10500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (15, 1, 7000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (16, 1, 5500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (17, 1, 9000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (18, 1, 9500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (19, 1, 15000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (20, 2, 2500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (21, 2, 8000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (22, 2, 5500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (23, 2, 5000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (24, 2, 3500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (25, 2, 10000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (26, 2, 12500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (27, 2, 7000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (28, 2, 6500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (29, 2, 11000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (30, 2, 6500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (31, 2, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (32, 3, 6500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (33, 3, 4000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (34, 3, 5500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (35, 3, 3000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (36, 3, 3500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (37, 3, 4000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (38, 3, 7500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (39, 3, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (40, 3, 12500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (41, 3, 9000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (42, 3, 6500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (43, 3, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (44, 4, 2500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (45, 4, 2000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (46, 4, 3500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (47, 4, 6000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (48, 4, 6500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (49, 4, 5000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (50, 4, 4500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (51, 4, 7000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (52, 4, 5500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (53, 4, 10000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (54, 4, 10500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (55, 4, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (56, 5, 2500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (57, 5, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (58, 5, 2500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (59, 5, 6000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (60, 5, 4500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (61, 5, 4000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (62, 5, 5500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (63, 5, 11000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (64, 5, 5500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (65, 5, 13000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (66, 5, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (67, 5, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (68, 6, 5500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (69, 6, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (70, 6, 2500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (71, 6, 4000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (72, 6, 11500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (73, 6, 12000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (74, 6, 5500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (75, 6, 7000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (76, 6, 7500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (77, 6, 10000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (78, 6, 9500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (79, 6, 14000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (80, 7, 3500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (81, 7, 9000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (82, 7, 7500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (83, 7, 5000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (84, 7, 6500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (85, 7, 8000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (86, 7, 5500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (87, 7, 8000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (88, 7, 9500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (89, 7, 14000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (90, 7, 10500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (91, 7, 12000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (92, 8, 5500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (93, 8, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (94, 8, 3500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (95, 8, 10000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (96, 8, 6500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (97, 8, 4000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (98, 8, 5500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (99, 8, 8000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (100, 8, 10500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (101, 8, 14000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (102, 8, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (103, 8, 9000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (104, 9, 3500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (105, 9, 2000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (106, 9, 6500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (107, 9, 7000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (108, 9, 7500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (109, 9, 4000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (110, 9, 8500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (111, 9, 7000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (112, 9, 7500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (113, 9, 6000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (114, 9, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (115, 9, 13000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (116, 10, 5500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (117, 10, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (118, 10, 5500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (119, 10, 3000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (120, 10, 3500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (121, 10, 5000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (122, 10, 5500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (123, 10, 12000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (124, 10, 13500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (125, 10, 10000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (126, 10, 14500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (127, 10, 8000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (128, 11, 7500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (129, 11, 4000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (130, 11, 6500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (131, 11, 7000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (132, 11, 3500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (133, 11, 6000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (134, 11, 9500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (135, 11, 11000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (136, 11, 7500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (137, 11, 9000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (138, 11, 10500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (139, 11, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (140, 12, 8500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (141, 12, 8000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (142, 12, 3500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (143, 12, 7000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (144, 12, 7500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (145, 12, 6000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (146, 12, 7500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (147, 12, 6000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (148, 12, 10500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (149, 12, 11000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (150, 12, 8500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (151, 12, 8000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (152, 13, 6500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (153, 13, 2000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (154, 13, 10500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (155, 13, 11000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (156, 13, 3500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (157, 13, 4000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (158, 13, 10500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (159, 13, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (160, 13, 9500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (161, 13, 10000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (162, 13, 6500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (163, 13, 7000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (164, 14, 9500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (165, 14, 5000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (166, 14, 10500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (167, 14, 3000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (168, 14, 9500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (169, 14, 5000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (170, 14, 10500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (171, 14, 11000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (172, 14, 7500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (173, 14, 7000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (174, 14, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (175, 14, 8000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (176, 15, 5500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (177, 15, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (178, 15, 6500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (179, 15, 11000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (180, 15, 7500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (181, 15, 11000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (182, 15, 5500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (183, 15, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (184, 15, 7500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (185, 15, 6000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (186, 15, 10500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (187, 15, 10000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (188, 16, 2500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (189, 16, 2000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (190, 16, 3500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (191, 16, 10000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (192, 16, 9500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (193, 16, 6000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (194, 16, 5500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (195, 16, 7000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (196, 16, 11500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (197, 16, 9000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (198, 16, 10500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (199, 16, 12000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (200, 17, 1500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (201, 17, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (202, 17, 4500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (203, 17, 6000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (204, 17, 5500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (205, 17, 4000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (206, 17, 8500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (207, 17, 7000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (208, 17, 9500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (209, 17, 13000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (210, 17, 14500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (211, 17, 15000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (212, 18, 6500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (213, 18, 7000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (214, 18, 2500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (215, 18, 7000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (216, 18, 3500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (217, 18, 10000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (218, 18, 6500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (219, 18, 13000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (220, 18, 11500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (221, 18, 11000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (222, 18, 8500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (223, 18, 8000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (224, 19, 4500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (225, 19, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (226, 19, 3500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (227, 19, 6000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (228, 19, 3500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (229, 19, 8000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (230, 19, 7500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (231, 19, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (232, 19, 12500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (233, 19, 8000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (234, 19, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (235, 19, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (236, 20, 1500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (237, 20, 2000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (238, 20, 4500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (239, 20, 5000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (240, 20, 4500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (241, 20, 11000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (242, 20, 6500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (243, 20, 6000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (244, 20, 13500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (245, 20, 10000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (246, 20, 12500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (247, 20, 12000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (248, 21, 1500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (249, 21, 4000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (250, 21, 2500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (251, 21, 6000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (252, 21, 5500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (253, 21, 8000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (254, 21, 8500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (255, 21, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (256, 21, 6500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (257, 21, 10000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (258, 21, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (259, 21, 10000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (260, 22, 5500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (261, 22, 8000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (262, 22, 7500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (263, 22, 11000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (264, 22, 10500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (265, 22, 12000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (266, 22, 5500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (267, 22, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (268, 22, 8500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (269, 22, 13000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (270, 22, 10500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (271, 22, 8000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (272, 23, 6500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (273, 23, 2000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (274, 23, 3500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (275, 23, 5000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (276, 23, 10500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (277, 23, 5000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (278, 23, 6500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (279, 23, 5000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (280, 23, 12500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (281, 23, 7000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (282, 23, 8500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (283, 23, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (284, 24, 6500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (285, 24, 3000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (286, 24, 6500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (287, 24, 5000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (288, 24, 4500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (289, 24, 4000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (290, 24, 11500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (291, 24, 13000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (292, 24, 8500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (293, 24, 14000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (294, 24, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (295, 24, 10000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (296, 25, 9500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (297, 25, 3000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (298, 25, 2500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (299, 25, 11000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (300, 25, 11500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (301, 25, 6000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (302, 25, 7500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (303, 25, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (304, 25, 12500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (305, 25, 6000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (306, 25, 12500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (307, 25, 9000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (308, 26, 3500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (309, 26, 9000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (310, 26, 2500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (311, 26, 11000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (312, 26, 6500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (313, 26, 10000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (314, 26, 8500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (315, 26, 7000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (316, 26, 8500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (317, 26, 9000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (318, 26, 9500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (319, 26, 9000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (320, 27, 3500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (321, 27, 3000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (322, 27, 2500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (323, 27, 7000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (324, 27, 7500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (325, 27, 5000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (326, 27, 12500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (327, 27, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (328, 27, 8500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (329, 27, 7000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (330, 27, 6500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (331, 27, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (332, 28, 7500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (333, 28, 7000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (334, 28, 6500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (335, 28, 10000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (336, 28, 3500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (337, 28, 5000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (338, 28, 4500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (339, 28, 6000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (340, 28, 6500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (341, 28, 10000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (342, 28, 10500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (343, 28, 11000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (344, 29, 4500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (345, 29, 9000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (346, 29, 10500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (347, 29, 3000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (348, 29, 6500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (349, 29, 7000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (350, 29, 4500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (351, 29, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (352, 29, 5500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (353, 29, 9000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (354, 29, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (355, 29, 9000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (356, 30, 2500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (357, 30, 9000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (358, 30, 8500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (359, 30, 3000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (360, 30, 11500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (361, 30, 8000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (362, 30, 4500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (363, 30, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (364, 30, 9500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (365, 30, 10000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (366, 30, 12500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (367, 30, 7000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (368, 31, 9500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (369, 31, 2000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (370, 31, 4500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (371, 31, 3000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (372, 31, 7500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (373, 31, 8000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (374, 31, 4500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (375, 31, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (376, 31, 5500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (377, 31, 7000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (378, 31, 13500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (379, 31, 7000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (380, 32, 3500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (381, 32, 7000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (382, 32, 5500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (383, 32, 8000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (384, 32, 10500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (385, 32, 10000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (386, 32, 8500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (387, 32, 11000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (388, 32, 7500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (389, 32, 11000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (390, 32, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (391, 32, 9000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (392, 33, 8500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (393, 33, 7000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (394, 33, 7500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (395, 33, 5000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (396, 33, 5500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (397, 33, 7000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (398, 33, 7500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (399, 33, 9000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (400, 33, 8500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (401, 33, 9000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (402, 33, 14500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (403, 33, 9000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (404, 34, 4500, NULL, '2017-01-01 00:00:00', '111', '2017-01-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (405, 34, 6000, NULL, '2017-02-01 00:00:00', '111', '2017-02-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (406, 34, 6500, NULL, '2017-03-01 00:00:00', '111', '2017-03-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (407, 34, 9000, NULL, '2017-04-01 00:00:00', '111', '2017-04-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (408, 34, 5500, NULL, '2017-05-01 00:00:00', '111', '2017-05-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (409, 34, 6000, NULL, '2017-06-01 00:00:00', '111', '2017-06-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (410, 34, 8500, NULL, '2017-07-01 00:00:00', '111', '2017-07-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (411, 34, 5000, NULL, '2017-08-01 00:00:00', '111', '2017-08-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (412, 34, 9500, NULL, '2017-09-01 00:00:00', '111', '2017-09-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (413, 34, 11000, NULL, '2017-10-01 00:00:00', '111', '2017-10-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (414, 34, 7500, NULL, '2017-11-01 00:00:00', '111', '2017-11-01 00:00:00', '111');
INSERT INTO `salary_history` VALUES (415, 34, 7000, NULL, '2017-12-01 00:00:00', '111', '2017-12-01 00:00:00', '111');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限URL',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序',
  `permission` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限字符',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 0, '招聘管理', NULL, 1, 'invitepost', '2018-04-07 12:36:36', '1001', '2018-04-07 12:36:41', '1001');
INSERT INTO `sys_permission` VALUES (2, 1, '入职申请', '/invitePost/newApply', 2, 'invitepost:newapply', '2018-04-07 13:12:51', '1001', '2018-04-07 13:12:57', '1001');
INSERT INTO `sys_permission` VALUES (3, 1, '面试管理', '/invitePost/interview', 3, 'invitepost:interview', '2018-04-07 20:21:03', '1001', '2018-04-07 20:21:07', '1001');
INSERT INTO `sys_permission` VALUES (4, 1, '职位分配', '/invitePost/allot', 4, 'invitepost:allot', '2018-04-07 20:23:09', '1001', '2018-04-07 20:23:13', '1001');
INSERT INTO `sys_permission` VALUES (5, 0, '员工管理', NULL, 1, 'empmanage', '2018-04-07 20:24:01', '1001', '2018-04-07 20:24:04', '1001');
INSERT INTO `sys_permission` VALUES (6, 5, '员工信息管理', '/emp/detail', 1, 'empmanage:detail', '2018-04-07 20:25:38', '1001', '2018-04-07 20:25:42', '1001');
INSERT INTO `sys_permission` VALUES (7, 5, '请假管理', '/emp/holiday', 1, 'empmanage:holiday', '2018-04-07 20:27:46', '1001', '2018-04-07 20:27:50', '1001');
INSERT INTO `sys_permission` VALUES (8, 0, '请假申请', '/emp/holidayApply', 1, 'empmanage:holiday:apply', '2018-04-07 20:30:06', '1001', '2018-04-07 20:30:10', '1001');
INSERT INTO `sys_permission` VALUES (9, 5, '岗位调度', '/emp/adjustment', 1, 'empmanage:adjustment', '2018-04-07 20:31:14', '1001', '2018-04-07 20:31:18', '1001');
INSERT INTO `sys_permission` VALUES (10, 5, '培训管理', '/emp/train', 1, 'empmanage:train', '2018-04-07 20:32:01', '1001', '2018-04-07 20:32:05', '1001');
INSERT INTO `sys_permission` VALUES (11, 0, '工资管理', NULL, 1, 'salary', '2018-04-07 20:32:52', '1001', '2018-04-07 20:32:55', '1001');
INSERT INTO `sys_permission` VALUES (12, 11, '工资概况', '/salary/base', 1, 'salary:base', '2018-04-07 20:33:40', '1001', '2018-04-07 20:33:44', '1001');
INSERT INTO `sys_permission` VALUES (13, 11, '奖金', '/salary/bonus', 1, 'salary:bonus', '2018-04-07 20:34:23', '1001', '2018-04-07 20:34:27', '1001');
INSERT INTO `sys_permission` VALUES (14, 11, '考勤', '/salary/attendance', 1, 'salary:attendance', '2018-04-07 20:35:29', '1001', '2018-04-07 20:35:33', '1001');
INSERT INTO `sys_permission` VALUES (15, 0, '数据分析', NULL, 0, 'analyze', '2018-04-07 20:36:28', '1001', '2018-04-07 20:36:32', '1001');
INSERT INTO `sys_permission` VALUES (16, 15, '入职率、离职率', '/analyze/probability', 1, 'analyze:probability', '2018-04-07 20:37:28', '1001', '2018-04-07 20:37:31', '1001');
INSERT INTO `sys_permission` VALUES (17, 15, '平均值', '/analyze/average', 1, 'analyze:average', '2018-04-07 20:38:19', '1001', '2018-04-07 20:38:23', '1001');
INSERT INTO `sys_permission` VALUES (18, 0, '部门管理', NULL, 2, 'department', '2018-04-07 20:39:10', '1001', '2018-04-07 20:39:13', '1001');
INSERT INTO `sys_permission` VALUES (19, 18, '部门信息', '/department/detail', 2, 'department:detail', '2018-04-07 20:39:57', '1001', '2018-04-07 20:40:01', '1001');
INSERT INTO `sys_permission` VALUES (20, 18, '部门调整', '/department/adjustment', 2, 'department:adjustment', '2018-04-07 20:41:13', '1001', '2018-04-07 20:41:16', '1001');
INSERT INTO `sys_permission` VALUES (21, 0, '考勤查看', '/salary/attendance/view', 1, 'salary:attendance:view', '2018-04-07 20:42:34', '1001', '2018-04-07 20:42:38', '1001');
INSERT INTO `sys_permission` VALUES (22, 0, '工资查看', '/salary/view', 1, 'salary:view', '2018-04-07 20:43:50', '1001', '2018-04-07 20:43:53', '1001');
INSERT INTO `sys_permission` VALUES (23, 0, '信息查看', '/emp/view', 1, 'empmanage:view', '2018-04-07 20:45:21', '1001', '2018-04-07 20:45:25', '1001');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '2018-04-07 20:47:50', '1001', '2018-04-07 20:47:54', '1001');
INSERT INTO `sys_role` VALUES (2, '员工', '2018-04-07 20:48:13', '1001', '2018-04-07 20:48:17', '1001');
INSERT INTO `sys_role` VALUES (3, '经理', '2018-04-07 20:48:28', '1001', '2018-04-07 20:48:32', '1001');
INSERT INTO `sys_role` VALUES (4, '人事部', '2018-04-24 21:33:47', '1001', '2018-04-24 21:33:38', '1001');

-- ----------------------------
-- Table structure for sys_role_emp
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_emp`;
CREATE TABLE `sys_role_emp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) NULL DEFAULT NULL COMMENT '员工ID',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_emp
-- ----------------------------
INSERT INTO `sys_role_emp` VALUES (1, 1, 2, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (2, 2, 2, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (3, 3, 2, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (4, 4, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (5, 5, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (6, 6, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (7, 7, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (8, 8, 2, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (9, 9, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (10, 10, 2, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (11, 11, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (12, 12, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (13, 13, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (14, 14, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (15, 15, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (16, 16, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (17, 17, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (18, 18, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (19, 19, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (20, 20, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (21, 21, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (22, 22, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (23, 23, 4, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (24, 24, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (25, 25, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (26, 26, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (27, 27, 1, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (28, 28, 3, '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES (29, 33, 2, '2018-05-02 13:47:01', '111', '2018-05-02 13:47:05', '111');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `permission_id` int(11) NULL DEFAULT NULL COMMENT '权限ID',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色-权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1, 1, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (2, 1, 2, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (3, 1, 3, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (4, 1, 4, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (5, 1, 5, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (6, 1, 6, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (7, 1, 7, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (8, 1, 9, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (9, 1, 10, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (10, 1, 11, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (11, 1, 12, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (12, 1, 13, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (13, 1, 14, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (14, 1, 15, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (15, 1, 16, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (16, 1, 17, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (17, 1, 18, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (18, 1, 19, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (19, 1, 20, '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES (20, 2, 8, '2018-04-07 20:58:27', '1001', '2018-04-07 20:58:35', '1001');
INSERT INTO `sys_role_permission` VALUES (21, 2, 21, '2018-04-07 20:58:30', '1001', '2018-04-07 20:58:40', '1001');
INSERT INTO `sys_role_permission` VALUES (22, 2, 22, '2018-04-07 20:58:44', '1001', '2018-04-07 20:58:49', '1001');
INSERT INTO `sys_role_permission` VALUES (23, 2, 23, '2018-04-07 20:58:47', '1001', '2018-04-07 20:58:52', '1001');
INSERT INTO `sys_role_permission` VALUES (24, 3, 1, '2018-04-24 21:35:48', '111', '2018-04-24 21:35:53', '111');
INSERT INTO `sys_role_permission` VALUES (25, 3, 3, '2018-04-24 21:36:17', '111', '2018-04-24 21:36:20', '111');
INSERT INTO `sys_role_permission` VALUES (26, 3, 5, '2018-04-24 21:38:54', '333', '2018-04-24 21:38:57', '333');
INSERT INTO `sys_role_permission` VALUES (27, 3, 6, '2018-04-24 21:39:06', '333', '2018-04-24 21:39:09', '333');
INSERT INTO `sys_role_permission` VALUES (28, 3, 7, '2018-04-24 21:39:16', '555', '2018-04-24 21:39:19', '555');
INSERT INTO `sys_role_permission` VALUES (30, 3, 9, '2018-04-24 21:39:36', '777', '2018-04-24 21:39:39', '666');
INSERT INTO `sys_role_permission` VALUES (31, 3, 10, '2018-04-24 21:39:48', '666', '2018-04-24 21:39:52', '666');
INSERT INTO `sys_role_permission` VALUES (32, 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (33, 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (34, 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (35, 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (36, 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (37, 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (38, 3, 17, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (39, 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (40, 3, 19, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (41, 3, 20, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (42, 4, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (43, 4, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_permission` VALUES (44, 4, 3, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (45, 4, 4, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (46, 4, 5, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (47, 4, 6, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (48, 4, 7, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (50, 4, 9, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (51, 4, 10, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (52, 4, 11, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (53, 4, 12, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (54, 4, 13, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (55, 4, 14, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (56, 4, 15, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (57, 4, 16, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (58, 4, 17, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (59, 4, 18, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (60, 4, 19, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');
INSERT INTO `sys_role_permission` VALUES (61, 4, 20, '2018-04-24 21:55:02', '111', '2018-04-24 21:55:02', '111');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `publisher` bigint(20) NULL DEFAULT NULL COMMENT '发布者',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培训表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES (3, '新技能培训', '一起get新技能', '2018-05-01 00:00:00', '2018-05-31 00:00:00', 12, '2018-05-02 20:39:29', '王宏', '2018-05-02 23:14:02', '王宏');
INSERT INTO `train` VALUES (5, '来来俩', '一起培训', '2018-05-01 00:00:00', '2018-05-31 00:00:00', 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train` VALUES (6, '新技能大培训', '为了适应祖国的需要', '2018-05-01 00:00:00', '2018-05-15 00:00:00', 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');

-- ----------------------------
-- Table structure for train_emp
-- ----------------------------
DROP TABLE IF EXISTS `train_emp`;
CREATE TABLE `train_emp`  (
  `emp_id` bigint(20) NOT NULL COMMENT '员工ID',
  `train_id` bigint(20) NOT NULL COMMENT '培训ID',
  `status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `approver` bigint(20) NULL DEFAULT NULL COMMENT '审批人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`, `train_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培训--员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train_emp
-- ----------------------------
INSERT INTO `train_emp` VALUES (1, 3, '0', NULL, 12, '2018-05-02 23:14:03', '王宏', '2018-05-02 23:14:03', '王宏');
INSERT INTO `train_emp` VALUES (1, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (1, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (2, 3, '0', NULL, 12, '2018-05-02 23:14:03', '王宏', '2018-05-02 23:14:03', '王宏');
INSERT INTO `train_emp` VALUES (2, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (2, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (3, 3, '0', NULL, 12, '2018-05-02 23:14:03', '王宏', '2018-05-02 23:14:03', '王宏');
INSERT INTO `train_emp` VALUES (3, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (3, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (6, 3, '0', NULL, 12, '2018-05-02 23:14:03', '王宏', '2018-05-02 23:14:03', '王宏');
INSERT INTO `train_emp` VALUES (6, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (6, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (8, 3, '0', NULL, 12, '2018-05-02 23:14:03', '王宏', '2018-05-02 23:14:03', '王宏');
INSERT INTO `train_emp` VALUES (8, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (8, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (10, 3, '0', NULL, 12, '2018-05-02 23:14:03', '王宏', '2018-05-02 23:14:03', '王宏');
INSERT INTO `train_emp` VALUES (10, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (10, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (12, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (12, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (14, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (14, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (15, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (15, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (17, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (17, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (21, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (21, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (27, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (27, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (31, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (31, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');
INSERT INTO `train_emp` VALUES (33, 5, '0', NULL, 12, '2018-05-02 23:16:32', '王宏', '2018-05-02 23:16:32', '王宏');
INSERT INTO `train_emp` VALUES (33, 6, '0', NULL, 12, '2018-05-03 08:56:13', '王宏', '2018-05-03 08:56:13', '王宏');

-- ----------------------------
-- Table structure for vacate
-- ----------------------------
DROP TABLE IF EXISTS `vacate`;
CREATE TABLE `vacate`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请假内容',
  `emp_id` bigint(11) NULL DEFAULT NULL COMMENT '请假者',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `up_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `deal_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请状态',
  `department_id` bigint(20) NULL DEFAULT NULL,
  `approve_id` bigint(11) NULL DEFAULT NULL COMMENT '审批人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '请假表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacate
-- ----------------------------
INSERT INTO `vacate` VALUES (1, '生病了，我要请假！！！', 8, '2018-04-27 00:00:00', '2018-04-30 00:00:00', '2018-04-27 21:55:05', NULL, '0', 12, NULL, '2018-04-27 21:55:05', '张静', '2018-04-27 21:55:05', '张静');
INSERT INTO `vacate` VALUES (2, '我就是要请假！！！', 3, '2018-04-27 00:00:00', '2018-04-30 00:00:00', '2018-04-27 22:01:21', '2018-04-28 14:37:59', '2', 12, 12, '2018-04-27 22:01:21', '赵力', '2018-04-28 14:37:59', '王宏');
INSERT INTO `vacate` VALUES (3, '我也要请假！！！', 2, '2018-04-27 00:00:00', '2018-04-30 00:00:00', '2018-04-27 22:04:35', '2018-05-01 18:25:45', '2', 12, 12, '2018-04-27 22:04:35', '李勤', '2018-05-01 18:25:45', '王宏');
INSERT INTO `vacate` VALUES (4, '我又生病了，给我请假吧', 8, '2018-04-28 00:00:00', '2018-05-01 00:00:00', '2018-04-28 15:14:44', '2018-04-28 15:15:40', '1', 12, 12, '2018-04-28 15:14:44', '张静', '2018-04-28 15:15:40', '王宏');

SET FOREIGN_KEY_CHECKS = 1;
