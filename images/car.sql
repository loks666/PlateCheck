/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : localhost:3306
 Source Schema         : car

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 05/09/2024 03:50:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，自动递增',
  `license_plate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '车牌号',
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '车辆类型',
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '车辆品牌',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '车辆颜色',
  `speed` int NULL DEFAULT NULL COMMENT '行驶速度，单位：km/h',
  `over_speed` tinyint(1) NULL DEFAULT NULL COMMENT '是否超速',
  `illegal_driving` tinyint(1) NULL DEFAULT NULL COMMENT '是否违规驾驶',
  `time` datetime NULL DEFAULT NULL COMMENT '检测时间',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '车辆状态 (可疑, 套牌车, 非套牌车, 存疑)',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '车辆图片路径',
  `street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '街道信息',
  `intersection` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路口信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '车辆信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (1, '川A 71134', '面包车', '本田', '白色', 118, 0, 1, '2024-01-06 05:49:04', NULL, '/images/car/car1.png', 'C街道', '乙路口');
INSERT INTO `car` VALUES (2, '川A 27852', '卡车', '奔驰', '红色', 52, 1, 0, '2024-07-12 13:38:05', '存疑', '/images/car/car2.png', 'B街道', '甲路口');
INSERT INTO `car` VALUES (3, '川A 87414', 'SUV', '丰田', '银色', 61, 1, 0, '2024-01-30 00:09:04', NULL, '/images/car/car3.png', 'B街道', '甲路口');
INSERT INTO `car` VALUES (4, '川A 63390', '卡车', '一汽大众', '红色', 73, 0, 0, '2024-06-04 18:43:52', NULL, '/images/car/car4.png', 'C街道', '丙路口');
INSERT INTO `car` VALUES (5, '川A 42974', '面包车', '本田', '黑色', 91, 0, 1, '2024-04-19 09:08:13', NULL, '/images/car/car5.png', 'B街道', '丙路口');
INSERT INTO `car` VALUES (6, '川A 43766', '面包车', '宝马', '蓝色', 71, 0, 1, '2024-02-12 08:30:13', NULL, '/images/car/car6.png', 'C街道', '丙路口');
INSERT INTO `car` VALUES (7, '川A 79310', 'SUV', '日产', '蓝色', 45, 1, 1, '2024-07-02 02:11:35', NULL, '/images/car/car7.png', 'A街道', '乙路口');
INSERT INTO `car` VALUES (8, '川A 23497', '面包车', '奔驰', '银色', 106, 0, 0, '2024-07-18 10:50:23', NULL, '/images/car/car8.png', 'C街道', '丙路口');
INSERT INTO `car` VALUES (9, '川A 32476', 'SUV', '宝马', '银色', 120, 0, 0, '2024-06-07 02:16:31', NULL, '/images/car/car9.png', 'B街道', '乙路口');
INSERT INTO `car` VALUES (10, '川A 51752', '卡车', '奔驰', '黑色', 59, 1, 0, '2024-03-05 00:30:27', NULL, '/images/car/car10.png', 'D街道', '甲路口');
INSERT INTO `car` VALUES (11, '川A 40045', '轿车', '一汽大众', '黑色', 87, 0, 1, '2024-01-30 07:31:35', NULL, '/images/car/car11.png', 'D街道', '甲路口');
INSERT INTO `car` VALUES (12, '川A 36552', '轿车', '一汽大众', '红色', 96, 0, 0, '2024-05-08 22:09:14', NULL, '/images/car/car12.png', 'A街道', '乙路口');
INSERT INTO `car` VALUES (13, '川A 42135', 'SUV', '本田', '银色', 97, 0, 0, '2024-07-10 04:25:27', NULL, '/images/car/car13.png', 'B街道', '甲路口');
INSERT INTO `car` VALUES (14, '川A 31948', '卡车', '宝马', '银色', 111, 1, 1, '2024-05-13 00:11:09', NULL, '/images/car/car14.png', 'C街道', '丙路口');
INSERT INTO `car` VALUES (15, '川A 59864', '卡车', '一汽大众', '白色', 92, 1, 0, '2024-06-24 05:16:24', NULL, '/images/car/car15.png', 'B街道', '乙路口');
INSERT INTO `car` VALUES (16, '川A 70336', '卡车', '本田', '红色', 40, 0, 0, '2024-03-21 23:57:40', NULL, '/images/car/car16.png', 'D街道', '乙路口');
INSERT INTO `car` VALUES (17, '川A 77701', '轿车', '奔驰', '红色', 119, 0, 0, '2024-07-14 18:01:56', NULL, '/images/car/car17.png', 'C街道', '丙路口');
INSERT INTO `car` VALUES (18, '川A 21771', '卡车', '一汽大众', '蓝色', 79, 0, 0, '2024-08-22 03:28:09', NULL, '/images/car/car18.png', 'A街道', '甲路口');
INSERT INTO `car` VALUES (19, '川A 21645', '卡车', '奔驰', '红色', 43, 1, 0, '2024-08-16 04:47:54', NULL, '/images/car/car19.png', 'A街道', '丙路口');
INSERT INTO `car` VALUES (20, '川A 77188', 'SUV', '宝马', '黑色', 63, 0, 0, '2024-03-02 19:57:31', NULL, '/images/car/car20.png', 'B街道', '乙路口');
INSERT INTO `car` VALUES (21, '川A 76004', '卡车', '宝马', '红色', 108, 1, 1, '2024-02-19 10:59:57', NULL, '/images/car/car21.png', 'C街道', '甲路口');
INSERT INTO `car` VALUES (22, '川A 75024', '卡车', '一汽大众', '红色', 114, 1, 1, '2024-08-27 09:55:43', NULL, '/images/car/car22.png', 'B街道', '甲路口');
INSERT INTO `car` VALUES (23, '川A 88139', '面包车', '本田', '白色', 61, 0, 1, '2024-08-21 22:40:48', NULL, '/images/car/car23.png', 'D街道', '乙路口');
INSERT INTO `car` VALUES (24, '川A 31654', '卡车', '奔驰', '白色', 40, 0, 1, '2024-08-30 20:41:39', NULL, '/images/car/car24.png', 'B街道', '丙路口');
INSERT INTO `car` VALUES (25, '川A 14171', '卡车', '本田', '红色', 120, 1, 1, '2024-08-04 13:36:09', NULL, '/images/car/car25.png', 'A街道', '乙路口');
INSERT INTO `car` VALUES (26, '川A 28226', '轿车', '日产', '银色', 116, 0, 0, '2024-07-30 07:36:21', NULL, '/images/car/car26.png', 'C街道', '乙路口');
INSERT INTO `car` VALUES (27, '川A 89093', '轿车', '一汽大众', '银色', 101, 0, 0, '2024-02-28 20:07:26', NULL, '/images/car/car27.png', 'A街道', '甲路口');
INSERT INTO `car` VALUES (28, '川A 20101', '面包车', '日产', '蓝色', 71, 0, 1, '2024-01-28 19:40:57', NULL, '/images/car/car28.png', 'C街道', '乙路口');
INSERT INTO `car` VALUES (29, '川A 58940', '轿车', '一汽大众', '黑色', 117, 0, 0, '2024-03-17 13:20:13', NULL, '/images/car/car29.png', 'B街道', '丙路口');
INSERT INTO `car` VALUES (30, '川A 74203', '面包车', '一汽大众', '蓝色', 113, 0, 1, '2024-07-04 04:46:06', NULL, '/images/car/car30.png', 'D街道', '乙路口');
INSERT INTO `car` VALUES (31, '川A 38070', '面包车', '丰田', '红色', 96, 1, 1, '2024-03-18 13:39:26', NULL, '/images/car/car31.png', 'B街道', '乙路口');
INSERT INTO `car` VALUES (32, '川A 12409', '轿车', '丰田', '蓝色', 63, 1, 1, '2024-05-31 06:40:10', NULL, '/images/car/car32.png', 'A街道', '丙路口');
INSERT INTO `car` VALUES (33, '川A 58934', 'SUV', '丰田', '红色', 107, 1, 0, '2024-06-14 01:33:30', NULL, '/images/car/car33.png', 'B街道', '乙路口');
INSERT INTO `car` VALUES (34, '川A 49366', '面包车', '一汽大众', '银色', 64, 0, 1, '2024-03-30 12:48:54', NULL, '/images/car/car34.png', 'C街道', '乙路口');
INSERT INTO `car` VALUES (35, '川A 40762', '卡车', '本田', '银色', 86, 1, 1, '2024-03-10 13:05:27', NULL, '/images/car/car35.png', 'B街道', '甲路口');
INSERT INTO `car` VALUES (36, '川A 89327', '面包车', '日产', '银色', 118, 0, 1, '2024-01-23 14:32:28', NULL, '/images/car/car36.png', 'A街道', '丙路口');
INSERT INTO `car` VALUES (37, '川A 10176', '卡车', '奔驰', '红色', 74, 0, 0, '2024-04-12 04:42:20', NULL, '/images/car/car37.png', 'B街道', '乙路口');
INSERT INTO `car` VALUES (38, '川A 58403', '卡车', '本田', '黑色', 94, 0, 0, '2024-06-21 03:23:26', NULL, '/images/car/car38.png', 'B街道', '丙路口');
INSERT INTO `car` VALUES (39, '川A 95458', '卡车', '日产', '银色', 87, 1, 0, '2024-07-18 08:51:23', NULL, '/images/car/car39.png', 'A街道', '丙路口');
INSERT INTO `car` VALUES (40, '川A 69516', '轿车', '奔驰', '黑色', 108, 0, 0, '2024-06-27 19:51:10', NULL, '/images/car/car40.png', 'D街道', '乙路口');
INSERT INTO `car` VALUES (41, '川A 43772', '面包车', '奔驰', '红色', 81, 1, 0, '2024-08-17 19:20:07', NULL, '/images/car/car41.png', 'D街道', '丙路口');
INSERT INTO `car` VALUES (42, '川A 67208', '卡车', '一汽大众', '黑色', 61, 1, 1, '2024-04-14 09:33:15', NULL, '/images/car/car42.png', 'B街道', '丙路口');
INSERT INTO `car` VALUES (43, '川A 41289', '轿车', '一汽大众', '蓝色', 86, 0, 0, '2024-08-02 22:09:14', NULL, '/images/car/car43.png', 'A街道', '乙路口');
INSERT INTO `car` VALUES (44, '川A 99257', '面包车', '丰田', '蓝色', 113, 1, 0, '2024-01-22 19:58:48', NULL, '/images/car/car44.png', 'B街道', '丙路口');
INSERT INTO `car` VALUES (45, '川A 52670', '卡车', '奔驰', '红色', 105, 1, 1, '2024-05-27 22:57:05', NULL, '/images/car/car45.png', 'C街道', '丙路口');
INSERT INTO `car` VALUES (46, '川A 31152', '面包车', '本田', '黑色', 70, 0, 1, '2024-01-18 11:43:20', NULL, '/images/car/car46.png', 'D街道', '甲路口');
INSERT INTO `car` VALUES (47, '川A 18501', '轿车', '宝马', '蓝色', 81, 0, 1, '2024-07-20 13:46:34', NULL, '/images/car/car47.png', 'B街道', '甲路口');
INSERT INTO `car` VALUES (48, '川A 52681', 'SUV', '日产', '白色', 106, 1, 0, '2024-02-24 18:31:22', NULL, '/images/car/car48.png', 'A街道', '乙路口');
INSERT INTO `car` VALUES (49, '川A 20490', '轿车', '一汽大众', '红色', 95, 1, 1, '2024-05-22 09:43:09', NULL, '/images/car/car49.png', 'A街道', '甲路口');
INSERT INTO `car` VALUES (50, '川A 54254', '卡车', '宝马', '银色', 48, 1, 0, '2024-01-21 22:16:07', NULL, '/images/car/car50.png', 'C街道', '丙路口');

SET FOREIGN_KEY_CHECKS = 1;
