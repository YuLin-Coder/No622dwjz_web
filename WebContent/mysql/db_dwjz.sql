/*
 Navicat Premium Data Transfer

 Source Server         : project
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost:3306
 Source Schema         : db_dwjz

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 16/03/2021 18:30:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物名称',
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物照片',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物种类',
  `state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领养状态（0表示未领养，1表示已经领养,',
  `createTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记日期',
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物昵称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '宠物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of animal
-- ----------------------------
INSERT INTO `animal` VALUES (1, '小狗', '/img/dog.jpg', '哺乳类', '1', '2021-03-02 22:27', '旺財');
INSERT INTO `animal` VALUES (2, '狗子', '/img/dog.jpg', '哺乳类', '1', '2021-03-05 23:47', '黑米');
INSERT INTO `animal` VALUES (7, '大猩猩12', '/img/7aac9840-f022-404e-979d-05a2bb089b8f.jpg', '哺乳类', '1', '2021-03-06 22:45', '黑咪咪12');
INSERT INTO `animal` VALUES (8, '小狗111', '/img/19639f58-196a-4714-aa52-647bda41a758.jpg', '哺乳类', '1', '2021-03-06 22:45', '旺財111');
INSERT INTO `animal` VALUES (9, '老虎', '/img/9445a915-3987-4804-9652-0ef0b461981e.jpg', '哺乳类', '1', '2021-03-11 22:21', 'tiger');

-- ----------------------------
-- Table structure for animal_save_record
-- ----------------------------
DROP TABLE IF EXISTS `animal_save_record`;
CREATE TABLE `animal_save_record`  (
  `lyid` int(11) NOT NULL AUTO_INCREMENT COMMENT '领养记录表id',
  `animal_id` int(11) NOT NULL COMMENT '领养动物id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '领养人id',
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 饲养中 2 已转让  3转让中，待审核',
  PRIMARY KEY (`lyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '领养记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of animal_save_record
-- ----------------------------
INSERT INTO `animal_save_record` VALUES (1, 1, 1, '2021-03-02 22:57', '2');
INSERT INTO `animal_save_record` VALUES (4, 2, 1, '2021-03-07 21:46', '2');
INSERT INTO `animal_save_record` VALUES (5, 1, 21, '2021-03-07 22:55', '1');
INSERT INTO `animal_save_record` VALUES (6, 7, 1, '2021-03-16 16:52', '2');
INSERT INTO `animal_save_record` VALUES (7, 9, 1, '2021-03-16 16:56', '1');
INSERT INTO `animal_save_record` VALUES (8, 7, 21, '2021-03-16 17:07', '1');
INSERT INTO `animal_save_record` VALUES (9, 8, 1, '2021-03-16 18:10', '1');
INSERT INTO `animal_save_record` VALUES (10, 2, 21, '2021-03-16 18:21', '1');

-- ----------------------------
-- Table structure for animal_zr
-- ----------------------------
DROP TABLE IF EXISTS `animal_zr`;
CREATE TABLE `animal_zr`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '转让表主键id',
  `aniaml_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物名称',
  `animal_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物种类',
  `yzr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原主人',
  `yzr_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原主人电话',
  `xzr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新主人',
  `xzr_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新主人电话',
  `zr_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转让方式',
  `createTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转让日期',
  `animal_id` int(10) NULL DEFAULT NULL COMMENT '宠物id',
  `yzr_id` int(10) NULL DEFAULT NULL COMMENT '原主人id',
  `xzr_id` int(10) NULL DEFAULT NULL COMMENT '现主人id',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 审核不通过 1 待被转让用户审核 2待管理员审核 3 审核通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '转让记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of animal_zr
-- ----------------------------
INSERT INTO `animal_zr` VALUES (1, '小狗', '哺乳类', '李庆照', '1234567890', '李庆照', '1234567890', '快递邮寄', '2021-03-11', 1, 1, 21, '2021-03-07 21:47', '3');
INSERT INTO `animal_zr` VALUES (2, '狗子', '哺乳类', '李庆照', '1234567890', '李庆照', '1234567890', '快递邮寄', '2021-03-11', 2, 1, 21, '2021-03-08 21:02', '0');
INSERT INTO `animal_zr` VALUES (3, '狗子', '哺乳类', '李庆照', '1234567890', '李庆照', '1234567890', '快递邮寄', '2021-03-16', 2, 1, 21, '2021-03-16 16:58', '0');
INSERT INTO `animal_zr` VALUES (4, '大猩猩12', '哺乳类', '李庆照', '1234567890', '李庆照', '1234567890', '线下转让', '2021-03-16', 7, 1, 21, '2021-03-16 17:02', '0');
INSERT INTO `animal_zr` VALUES (5, '大猩猩12', '哺乳类', '李庆照', '1234567890', '李庆照', '1234567890', '快递邮寄', '2021-03-16', 7, 1, 21, '2021-03-16 17:06', '3');
INSERT INTO `animal_zr` VALUES (6, '狗子', '哺乳类', '李庆照', '1234567890', '李庆照', '1234567890', '线下转让', '2021-03-16', 2, 1, 21, '2021-03-16 18:20', '3');

-- ----------------------------
-- Table structure for feed
-- ----------------------------
DROP TABLE IF EXISTS `feed`;
CREATE TABLE `feed`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `animal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物姓名',
  `wyfs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '喂养方式',
  `animal_id` int(10) NULL DEFAULT NULL COMMENT '动物表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '喂养方式表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feed
-- ----------------------------
INSERT INTO `feed` VALUES (1, '小狗', 'feedfeedfeed', 1);
INSERT INTO `feed` VALUES (2, '狗子', '狗粮狗粮狗粮狗粮狗粮狗粮狗粮狗粮', 2);
INSERT INTO `feed` VALUES (3, '小狗', NULL, 1);
INSERT INTO `feed` VALUES (4, '小狗', NULL, 1);

-- ----------------------------
-- Table structure for hfjl
-- ----------------------------
DROP TABLE IF EXISTS `hfjl`;
CREATE TABLE `hfjl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物名称',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物类别',
  `director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主人',
  `condation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物状况',
  `hfz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回访者',
  `hfrq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回访日期',
  `director_id` int(11) NULL DEFAULT NULL COMMENT '主人id',
  `animal_id` int(11) NULL DEFAULT NULL COMMENT '动物id',
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '回访记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hfjl
-- ----------------------------
INSERT INTO `hfjl` VALUES (3, '狗子', '1', '狄玉辉', '测试', '狄玉辉', '2021-03-11', 1, 2, '/img/dog.jpg');
INSERT INTO `hfjl` VALUES (4, '狗子', '哺乳类', '狄玉辉1', '22222', '狄玉辉23232', '2021-03-04', 1, 2, '/img/dog.jpg');
INSERT INTO `hfjl` VALUES (5, '小狗', '哺乳类', '狄玉辉1', '测试11111', '狄玉辉1', '2021-03-12', 21, 1, '/img/dog.jpg');
INSERT INTO `hfjl` VALUES (6, '小狗', '哺乳类', '狄玉辉1', '好肥好', '狄玉辉1', '2021-03-13', 21, 1, '/img/dog.jpg');
INSERT INTO `hfjl` VALUES (7, '狗子', '哺乳类', '狄玉辉', '测试', '狄玉辉', '2021-03-06', 1, 2, '/img/dog.jpg');

-- ----------------------------
-- Table structure for user_admin
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_admin
-- ----------------------------
INSERT INTO `user_admin` VALUES (1, 'admin', '123456', '管理员');
INSERT INTO `user_admin` VALUES (3, 'admin123', '123456', '李庆照');
INSERT INTO `user_admin` VALUES (4, 'admin12345', '123456', 'aaaaa');
INSERT INTO `user_admin` VALUES (6, 'ad', '123456', '45454');

-- ----------------------------
-- Table structure for user_love_animal
-- ----------------------------
DROP TABLE IF EXISTS `user_love_animal`;
CREATE TABLE `user_love_animal`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0表示未通过，1表示已经通过，2表示审核中',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属类别，1表示个人，2表示组织',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '爱心人士/收养家庭' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_love_animal
-- ----------------------------
INSERT INTO `user_love_animal` VALUES (1, 'dsadsa@qq.com', '123456', '李庆照', '男', '1234567890', '新街口', '2021-02-26 22:36', '1', '1', 'lqz');
INSERT INTO `user_love_animal` VALUES (21, 'adadada@qq.com', '123456', '霹雳', '男', '1234567890', '新街口102栋', '2021-03-05 22:22', '1', '1', 'han');
INSERT INTO `user_love_animal` VALUES (28, '1152623@qq.com', '123456', '张淋淋', '女', '1234567890', '新街口1212', '2021-03-10 22:39', '1', '1', 'zhanglinlin');

SET FOREIGN_KEY_CHECKS = 1;
