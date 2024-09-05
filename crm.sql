/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 05/09/2024 20:24:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_contact
-- ----------------------------
DROP TABLE IF EXISTS `t_contact`;
CREATE TABLE `t_contact`  (
  `con_id` int NOT NULL AUTO_INCREMENT,
  `con_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '联系人名字',
  `con_sex` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '联系人性别',
  `con_job` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '联系人职位',
  `con_tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '办公电话',
  `con_phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '联系人手机号',
  `con_note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `cus_id` int NOT NULL COMMENT '客户编号',
  PRIMARY KEY (`con_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_contact
-- ----------------------------
INSERT INTO `t_contact` VALUES (1, '张女士2', '女', '经理', '0234569', '1536254785', '7', 2);
INSERT INTO `t_contact` VALUES (3, '张女士', '女', '经理', '0234569', '1536254785', '1', 9);
INSERT INTO `t_contact` VALUES (4, '张女士', '女', '经理', '0234569', '1536254785', '1', 5);
INSERT INTO `t_contact` VALUES (6, '张女士2', '女', '经理', '0234569', '1536254785', '1', 2);
INSERT INTO `t_contact` VALUES (7, '张女士2', '女', '经理', '0234569', '1536254785', '1', 5);
INSERT INTO `t_contact` VALUES (8, '张女士3', '女', '经理', '0234569', '1536254785', '1', 2);
INSERT INTO `t_contact` VALUES (9, '张女士3', '女', '经理', '0234569', '1536254785', '1', 6);
INSERT INTO `t_contact` VALUES (10, '张先生', '女', '经理', '0234569', '1536254785', '1', 2);
INSERT INTO `t_contact` VALUES (11, '张先生', '女', '经理', '0234569', '1536254785', '1', 2);
INSERT INTO `t_contact` VALUES (12, '张女士4', '女', '经理', '0234569', '1536254785', '1', 9);
INSERT INTO `t_contact` VALUES (13, '张女士5', '女', '经理', '0234569', '1536254785', '1', 9);
INSERT INTO `t_contact` VALUES (15, '张女士6', '1', '1', '', '1', '1', 2);
INSERT INTO `t_contact` VALUES (21, '张女士5', '1', '1', '', '1', '1', 2);
INSERT INTO `t_contact` VALUES (22, '张女士4', '1', '1', '', '1', '1', 2);
INSERT INTO `t_contact` VALUES (23, '1', '1', '1', '1', '1', '1', 1);
INSERT INTO `t_contact` VALUES (24, '1', '1', '1', '1', '1', '1', 2);

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `cus_id` int NOT NULL AUTO_INCREMENT COMMENT '客户编号',
  `cus_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `cus_region` int NULL DEFAULT NULL COMMENT '客户地区。1-东北，2-华北，3-西北，4-西南，5-华南，6-华中，7-华东',
  `cus_industry` int NULL DEFAULT NULL COMMENT '客户行业. 1-金融，2-房地产，3-商业服务，4-运输物流，\r\n   5-生产，6-政府，7-文化传媒，8-其它',
  `cus_level` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户等级. A-重点客户；B-普通客户；C-非优先客户',
  `cus_satisfy` int NULL DEFAULT NULL COMMENT '客户满意度. 1-一级，2-二级，3-三级，4-四级，5-五级',
  `cus_credit` int NULL DEFAULT NULL COMMENT '客户信用度. 1-一级，2-二级，3-三级，4-四级，5-五级',
  `cus_addr` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `cus_zipcode` int NULL DEFAULT NULL COMMENT '客户邮编',
  `cus_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户电话',
  `cus_fax` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户传真',
  `cus_url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户网址',
  `user_id` int NULL DEFAULT NULL COMMENT '客户经理id',
  `cus_status` int NOT NULL DEFAULT 1 COMMENT '客户状态.1-正常，0-流失',
  `cus_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，默认当前时间',
  PRIMARY KEY (`cus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (2, 'Hierarchical', 3, 1, 'B', 2, 3, '12213', 1231, '13299999999', '123', 'http://www/baidu.com', 3, 1, '2023-05-10 20:39:24');
INSERT INTO `t_customer` VALUES (5, '京东', 5, 2, 'A', 3, 2, '成都', 235, '1536', '', '', 1, 1, '2023-05-13 14:49:15');
INSERT INTO `t_customer` VALUES (6, '华为', 4, 3, 'B', 4, 3, '贵州', 1, '1', '1', '1', 1, 0, '2023-05-13 14:49:53');
INSERT INTO `t_customer` VALUES (7, '叫我的实力', 3, 3, 'C', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');
INSERT INTO `t_customer` VALUES (8, '写了', 4, 3, 'B', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:51:01');
INSERT INTO `t_customer` VALUES (9, '叫我的实力', 3, 3, 'C', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');
INSERT INTO `t_customer` VALUES (10, '叫我的实力', 3, 3, 'B', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');
INSERT INTO `t_customer` VALUES (11, '叫我的实力', 3, 3, 'A', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');
INSERT INTO `t_customer` VALUES (12, '叫我的实力', 3, 3, 'C', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');
INSERT INTO `t_customer` VALUES (13, '叫我的实力', 3, 3, 'B', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');
INSERT INTO `t_customer` VALUES (14, '叫我的实力', 3, 3, 'A', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');
INSERT INTO `t_customer` VALUES (15, '叫我的实力', 3, 3, 'C', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');
INSERT INTO `t_customer` VALUES (16, '叫我的实力', 3, 3, 'B', 4, 4, '1', 1, '1', '1', '1', 1, 0, '2023-05-13 14:50:48');

-- ----------------------------
-- Table structure for t_customer_lose
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_lose`;
CREATE TABLE `t_customer_lose`  (
  `lose_id` int NOT NULL AUTO_INCREMENT,
  `cus_id` int NOT NULL COMMENT '客户编号',
  `cus_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户名称',
  `user_id` int NULL DEFAULT NULL COMMENT '客户经理',
  `last_order_time` datetime NULL DEFAULT NULL COMMENT '最近下单时间',
  `delay_lose_measure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '暂缓流失措施',
  `confirm_lose_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认流失原因',
  `confirm_lose_time` datetime NULL DEFAULT NULL COMMENT '确认流失时间',
  `lose_status` int NOT NULL DEFAULT 0 COMMENT '流失状态（0预警、1暂缓、2流失、3挽回）',
  PRIMARY KEY (`lose_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_customer_lose
-- ----------------------------
INSERT INTO `t_customer_lose` VALUES (1, 8, '写了', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_customer_lose` VALUES (2, 12, '微博', 1, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for t_dev_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_dev_plan`;
CREATE TABLE `t_dev_plan`  (
  `dp_id` int NOT NULL AUTO_INCREMENT,
  `dp_plandate` datetime NULL DEFAULT NULL COMMENT '计划日期',
  `dp_plancontent` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '计划内容',
  `dp_execase` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '执行情况',
  `dp_exedate` datetime NULL DEFAULT NULL COMMENT '执行日期',
  `dp_exemanager` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '执行人',
  `sc_id` int NOT NULL COMMENT '销售机会编号',
  PRIMARY KEY (`dp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dev_plan
-- ----------------------------
INSERT INTO `t_dev_plan` VALUES (14, '2023-06-13 09:28:08', '拜访客户', '1.开发中2.开发成功', '2023-06-13 15:16:38', '小王（10010）', 1);
INSERT INTO `t_dev_plan` VALUES (15, '2023-06-14 14:47:44', '', NULL, NULL, NULL, 2);
INSERT INTO `t_dev_plan` VALUES (16, '2023-06-29 00:00:00', '', NULL, NULL, NULL, 4);
INSERT INTO `t_dev_plan` VALUES (18, '2023-06-13 00:00:00', '', NULL, NULL, NULL, 5);
INSERT INTO `t_dev_plan` VALUES (19, '2023-06-21 00:00:00', '', NULL, NULL, NULL, 6);

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
  `order_money` int NOT NULL DEFAULT 0 COMMENT '订单金额',
  `order_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单地址',
  `order_status` int NULL DEFAULT NULL COMMENT '订单状态（0未付款、1已付款、2已发货、3已收货、4已退货）',
  `cus_id` int NOT NULL COMMENT '客户编号',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO `t_orders` VALUES (1, '2022-08-01 20:01:44', 3000, NULL, 1, 8);
INSERT INTO `t_orders` VALUES (2, '2022-11-01 20:02:03', 600, NULL, NULL, 12);
INSERT INTO `t_orders` VALUES (3, '2023-01-01 15:28:19', 2000, NULL, NULL, 12);
INSERT INTO `t_orders` VALUES (4, '2023-02-01 18:02:25', 2000, NULL, NULL, 16);
INSERT INTO `t_orders` VALUES (5, '2023-01-01 16:32:31', 200, NULL, NULL, 8);
INSERT INTO `t_orders` VALUES (6, '2022-09-01 10:50:55', 5000, NULL, NULL, 16);
INSERT INTO `t_orders` VALUES (7, '2022-10-01 10:52:28', 600, NULL, NULL, 8);
INSERT INTO `t_orders` VALUES (8, '2021-11-01 11:28:57', 4000, NULL, NULL, 8);
INSERT INTO `t_orders` VALUES (9, '2020-11-01 11:28:57', 4000, NULL, NULL, 8);
INSERT INTO `t_orders` VALUES (10, '2021-11-01 11:28:57', 3000, NULL, NULL, 12);
INSERT INTO `t_orders` VALUES (11, '2021-11-01 11:28:57', 2800, NULL, NULL, 16);
INSERT INTO `t_orders` VALUES (12, '2020-12-01 11:28:57', 4000, NULL, NULL, 12);
INSERT INTO `t_orders` VALUES (13, '2020-12-01 11:28:57', 3500, NULL, NULL, 16);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `r_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '角色名',
  `r_desc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '销售主管', '销售主管，权限大于客户经理');
INSERT INTO `t_role` VALUES (2, '客户经理', '客户经理是销售主管的下属');

-- ----------------------------
-- Table structure for t_sale_chance
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_chance`;
CREATE TABLE `t_sale_chance`  (
  `sc_id` int NOT NULL AUTO_INCREMENT COMMENT '机会id',
  `sc_cusname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '客户名称',
  `sc_comming` int NULL DEFAULT NULL COMMENT '机会来源（0促销、1广告、2搜索引擎、3线上咨询、4电话咨询、5邮件咨询、6客户介绍）',
  `sc_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '联系人',
  `sc_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '联系电话',
  `sc_success` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '成功几率(%)',
  `sc_message` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '概要',
  `sc_desc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '机会描述',
  `sc_createuserid` int NULL DEFAULT NULL COMMENT '创建人id',
  `sc_createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sc_giveuserid` int NULL DEFAULT NULL COMMENT '指派给谁',
  `sc_givetime` datetime NULL DEFAULT NULL COMMENT '指派时间',
  `sc_status` int NOT NULL DEFAULT 0 COMMENT '状态（0未分配、1已分配、2开发成功、3开发失败、4开发中）',
  PRIMARY KEY (`sc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_sale_chance
-- ----------------------------
INSERT INTO `t_sale_chance` VALUES (1, '我去微软', 2, '', '', '', '', '', 1, '2023-11-14 16:43:38', 11, '2024-06-14 05:52:53', 1);
INSERT INTO `t_sale_chance` VALUES (2, '1231', 1, '王经理123', '026354', '30', 'z', 'x', 1, '2023-11-14 14:12:33', 5, '2024-06-11 05:53:11', 1);
INSERT INTO `t_sale_chance` VALUES (4, 'heiw', 0, 'z', '0236547', '60', '1', '1', 1, '2022-10-27 09:22:14', 3, '2022-11-21 22:45:43', 1);
INSERT INTO `t_sale_chance` VALUES (5, 'oppo', 0, 'y', '036524', '20', '', '', 2, '2023-11-14 14:28:10', 33, '2023-11-14 04:48:03', 1);
INSERT INTO `t_sale_chance` VALUES (6, 'oppo', 3, 'y', '036524', '20', '', '', 2, '2023-11-14 14:48:26', 123, '2023-11-14 05:00:24', 1);
INSERT INTO `t_sale_chance` VALUES (7, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (8, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (9, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (10, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (11, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (12, 'oppo', 2, 'y', '036524', '20', NULL, '123', 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (13, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (14, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (15, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (16, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (17, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (18, 'oppo', 2, 'y', '036524', '20', '', '', 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (19, 'oppo', 2, 'y', '036524', '20', NULL, NULL, 2, '2022-11-21 22:01:40', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (20, 'oppo', 2, 'y', '036524', '20', '', '', 2, '2023-11-14 16:42:43', 123, '2023-11-14 05:01:18', 1);
INSERT INTO `t_sale_chance` VALUES (26, '测试111', 0, '1', '13299999999', '1', '1', '1', 4, '2023-11-07 10:08:33', NULL, NULL, 1);
INSERT INTO `t_sale_chance` VALUES (32, '1123', 0, '1', '13299999999', '1', '1', '123', NULL, '2023-11-15 10:53:36', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (34, '213123', 3, '', '', '', '', '', NULL, '2023-11-15 13:53:54', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (35, '13', 0, '', '', '', '', '', 123, '2023-11-15 13:55:48', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (37, '', NULL, '', '', '', '', '', NULL, '2024-05-31 15:14:28', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (38, '', NULL, '', '', '', '', '', NULL, '2024-05-31 15:15:17', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (39, '', NULL, '', '', '', '', '', NULL, '2024-05-31 15:17:22', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (40, '123', 0, '', '', '', '', '', NULL, '2024-05-31 15:17:29', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (41, '111', NULL, '', '', '', '', '', NULL, '2024-05-31 15:21:53', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (42, '', NULL, '', '', '', '', '', NULL, '2024-05-31 15:22:28', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (43, '', NULL, '', '', '', '', '', NULL, '2024-05-31 15:27:54', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (44, '', NULL, '', '', '', '', '', 1, '2024-05-31 15:29:42', 2, NULL, 1);
INSERT INTO `t_sale_chance` VALUES (45, '', 2, '', '', '', '', '', 1, '2024-05-31 15:35:53', 123, '2024-05-22 12:00:00', 1);
INSERT INTO `t_sale_chance` VALUES (46, '', 0, '', '', '', '', '', 1, '2024-05-31 15:52:43', 2134, '2024-05-14 12:00:00', 1);
INSERT INTO `t_sale_chance` VALUES (50, '', NULL, '', '', '', '', '', 1, '2024-05-31 16:22:34', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (51, '44444', NULL, '', '', '', '', '', 1, '2024-05-31 16:25:18', 3, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (58, '1', 0, '1', '1', '1', '1', '1', 8, '2024-06-11 14:24:14', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (59, '1', 0, '1', '1', '1', '1', '1', 8, '2024-06-11 14:36:32', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (60, '1', 0, '1', '1', '1', '1', '1', 8, '2024-06-11 14:36:50', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (61, '1', 0, '张', '17725876951', '90', '', '', 8, '2024-06-11 14:40:28', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (62, '1', NULL, '1', '1', '11', '1', '1', 8, '2024-06-11 17:33:13', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (63, '1', NULL, '1', '1', '11', '1', '1', 8, '2024-06-11 17:33:41', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (64, '1', NULL, '1', '1', '11', '1', '1', 8, '2024-06-11 17:33:41', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (65, '1', NULL, '1', '1', '11', '1', '1', 8, '2024-06-11 17:33:42', 11, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (66, '1', 1, 'w', '1', '111111111', '1', '1', 8, '2024-06-11 17:34:33', 12, '2024-06-04 12:00:00', 0);
INSERT INTO `t_sale_chance` VALUES (67, '1', 0, '1', '1111', '1', '1', '1', 8, '2024-06-12 21:36:58', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (68, '1', 0, '1', '1', '1', '1', '1', 8, '2024-06-12 21:43:06', 3, '2024-06-12 09:50:59', 1);
INSERT INTO `t_sale_chance` VALUES (69, '1', 0, '1', '1', '1', '1', '1', 7, '2024-06-12 21:44:29', 1, '2024-06-12 10:01:43', 1);
INSERT INTO `t_sale_chance` VALUES (72, '111', 0, '111', '111', '111', '111', '111', 7, '2024-06-12 22:12:30', NULL, NULL, 1);
INSERT INTO `t_sale_chance` VALUES (73, '11', 0, '11', '11', '11', '11', '11', 7, '2024-06-12 22:48:37', NULL, NULL, 1);
INSERT INTO `t_sale_chance` VALUES (74, '111', 0, '1', '1', '1', '1', '1', 11, '2024-06-14 09:09:39', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (75, 'g', NULL, 'g', 'g', 'g', 'g', 'g', 4, '2024-06-14 10:12:14', NULL, NULL, 0);
INSERT INTO `t_sale_chance` VALUES (76, '1111', 0, '11', '11', '11', '11', '1111', 12, '2024-06-14 11:44:55', NULL, NULL, 0);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `u_password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `r_id` int NOT NULL,
  PRIMARY KEY (`u_id`) USING BTREE,
  INDEX `role_id`(`r_id` ASC) USING BTREE,
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `t_role` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '梁主管', '1234', 1);
INSERT INTO `t_user` VALUES (2, '李经理', '1234', 2);
INSERT INTO `t_user` VALUES (3, '杜经理', '1234', 2);
INSERT INTO `t_user` VALUES (4, '1', '1', 1);
INSERT INTO `t_user` VALUES (5, '2', '2', 2);
INSERT INTO `t_user` VALUES (6, '122', '122', 1);
INSERT INTO `t_user` VALUES (7, '123', '122', 1);
INSERT INTO `t_user` VALUES (8, '12345', '12345', 1);
INSERT INTO `t_user` VALUES (9, '222', '222', 1);
INSERT INTO `t_user` VALUES (10, '22', '22', 1);
INSERT INTO `t_user` VALUES (11, 'tom', '111', 2);
INSERT INTO `t_user` VALUES (12, 'tom1', '111', 2);
INSERT INTO `t_user` VALUES (13, 'tom2', '111', 1);

SET FOREIGN_KEY_CHECKS = 1;
