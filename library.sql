/*
 Navicat Premium Data Transfer

 Source Server         : mlimit
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 17/05/2023 10:24:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `adminType` int(0) NULL DEFAULT NULL COMMENT '管理员类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', 1);
INSERT INTO `admin` VALUES (2, 'admin1', '123456', 0);
INSERT INTO `admin` VALUES (3, 'admin2', '123456', 0);

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `publish` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `isbn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书籍编号',
  `call_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索书号 定位图书在架位置',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `publish_date` date NULL DEFAULT NULL COMMENT '出版时间',
  `type_id` int(0) NULL DEFAULT NULL COMMENT '书籍类型',
  `status` int(0) NULL DEFAULT 1 COMMENT '状态：1未借出即可借阅，0在借中即不可借阅',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `book_info_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES (1, '高等数学习题精选精解', '张天德', '山东科学技术出版社', '9787533172695', 'I 313.45/872/2014', 21, 49.8, '2007-09-01', 3, 0);
INSERT INTO `book_info` VALUES (2, 'Java Web程序设计', '黑马程序员', '人民邮电出版社', '9787115439469', 'I 313.45/872/2014', 8, 56, '2017-01-01', 1, 0);
INSERT INTO `book_info` VALUES (3, '中国建筑史', '梁思成', '百花文艺出版社', '9787530641682', 'I 313.45/872/2014', 22, 22.5, '2005-05-01', 2, 0);
INSERT INTO `book_info` VALUES (4, '新时代明德大学英语', '王守仁 黄国文', '高等教育出版社', '9787040559514', 'I 313.45/872/2014', 1, 58, '2021-04-01', 9, 0);
INSERT INTO `book_info` VALUES (5, '计算机网络自顶向下方法', '詹姆斯库罗斯', '机械工业出版社', '9787111599715', 'I 313.45/872/2014', 10, 89, '2020-04-01', 1, 1);
INSERT INTO `book_info` VALUES (6, '数据库系统概论(第5版)', '王珊', '北京大学出版社', '9787040406641', 'I 313.45/872/2014', 17, 42, '2014-09-05', 1, 0);
INSERT INTO `book_info` VALUES (7, '操作系统教程(第5版)', '费祥林', '高等教育出版社', '9787040392500', 'I 313.45/872/2014', 3, 43.5, '2014-02-01', 1, 0);
INSERT INTO `book_info` VALUES (8, '你的善良必须有点锋芒', '幕颜歌', '古吴轩出版社', '9787554607237', 'I 313.45/872/2014', 13, 32.8, '2016-09-01', 10, 0);
INSERT INTO `book_info` VALUES (9, '偷影子的人', '[法] 马克·李维', '湖南文艺出版社', '9787540455958', 'I 313.45/872/2014', 20, 29.8, '2012-07-01', 9, 1);
INSERT INTO `book_info` VALUES (10, '人间失格', '(日)太宰治', '作家出版社', '9787506380263', 'I 313.45/872/2014', 8, 25, '2015-08-01', 10, 1);
INSERT INTO `book_info` VALUES (11, '巴菲特全书', '文彦', '中国华侨出版社29.80', '9787511337337', 'I 313.45/872/2014', 10, 29.8, '2013-09-01', 5, 1);
INSERT INTO `book_info` VALUES (12, '高等数学习题精选精解', '张天德', '山东科学技术出版社', '9787533172695', 'I 313.45/872/2014', 21, 49.8, '2007-09-01', 3, 0);
INSERT INTO `book_info` VALUES (13, 'Java Web程序设计', '黑马程序员', '人民邮电出版社', '9787115439469', 'I 313.45/872/2014', 8, 56, '2017-01-01', 1, 1);
INSERT INTO `book_info` VALUES (14, '中国建筑史', '梁思成', '百花文艺出版社', '9787530641682', 'I 313.45/872/2014', 22, 22.5, '2005-05-01', 2, 1);
INSERT INTO `book_info` VALUES (15, '新时代明德大学英语', '王守仁 黄国文', '高等教育出版社', '9787040559514', 'I 313.45/872/2014', 1, 58, '2021-04-01', 9, 1);
INSERT INTO `book_info` VALUES (16, '计算机网络自顶向下方法', '詹姆斯库罗斯', '机械工业出版社', '9787111599715', 'I 313.45/872/2014', 10, 89, '2020-04-01', 1, 1);
INSERT INTO `book_info` VALUES (17, '数据库系统概论(第5版)', '王珊', '北京大学出版社', '9787040406641', 'I 313.45/872/2014', 17, 42, '2014-09-05', 1, 0);
INSERT INTO `book_info` VALUES (18, '操作系统教程(第5版)', '费祥林', '高等教育出版社', '9787040392500', 'I 313.45/872/2014', 3, 43.5, '2014-02-01', 1, 1);
INSERT INTO `book_info` VALUES (19, '你的善良必须有点锋芒', '幕颜歌', '古吴轩出版社', '9787554607237', 'I 313.45/872/2014', 13, 32.8, '2016-09-01', 10, 1);
INSERT INTO `book_info` VALUES (20, '偷影子的人', '[法] 马克·李维', '湖南文艺出版社', '9787540455958', 'I 313.45/872/2014', 20, 29.8, '2012-07-01', 9, 1);
INSERT INTO `book_info` VALUES (21, '人间失格', '(日)太宰治', '作家出版社', '9787506380263', 'I 313.45/872/2014', 8, 25, '2015-08-01', 10, 1);
INSERT INTO `book_info` VALUES (22, '巴菲特全书', '文彦', '中国华侨出版社29.80', '9787511337337', 'I 313.45/872/2014', 10, 29.8, '2013-09-01', 5, 1);
INSERT INTO `book_info` VALUES (23, '考研数学接力题典1800.数学一', '汤家凤', '北京：中国政法大学出版社', '9787576401905', 'I 271.45/872/2021', 1, 82, '2021-12-05', 7, 1);

-- ----------------------------
-- Table structure for lend_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bookId` int(0) NULL DEFAULT NULL COMMENT '图书id',
  `readerId` int(0) NULL DEFAULT NULL COMMENT '读者id',
  `lendDate` datetime(0) NULL DEFAULT NULL COMMENT '借书时间',
  `backDate` datetime(0) NULL DEFAULT NULL COMMENT '还书时间',
  `backType` int(0) NULL DEFAULT 10 COMMENT '归还类型 0：正常还书，1：延迟还书，2：破损还书，3：丢失',
  `exceptRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `lendDays` int(0) NULL DEFAULT NULL COMMENT '已被借阅天数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lend_list_ibfk_bookId`(`bookId`) USING BTREE,
  INDEX `lend_list_ibfk_readerId`(`readerId`) USING BTREE,
  CONSTRAINT `lend_list_ibfk_bookId` FOREIGN KEY (`bookId`) REFERENCES `book_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lend_list_ibfk_readerId` FOREIGN KEY (`readerId`) REFERENCES `reader_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借阅记录（谁在何时借走了什么书，并且有没有归还，归还时间多少）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_list
-- ----------------------------
INSERT INTO `lend_list` VALUES (1, 1, 12, '2022-05-21 10:07:31', '2022-06-03 16:09:27', 0, NULL, 14);
INSERT INTO `lend_list` VALUES (2, 2, 2, '2022-05-21 21:48:17', '2022-06-03 17:50:00', 2, NULL, 14);
INSERT INTO `lend_list` VALUES (3, 3, 3, '2022-05-21 21:50:22', '2022-06-03 21:50:32', 3, NULL, 13);
INSERT INTO `lend_list` VALUES (4, 5, 1, '2022-05-21 21:35:35', '2022-06-03 21:35:47', 1, NULL, 13);
INSERT INTO `lend_list` VALUES (5, 6, 3, '2022-05-21 21:42:35', '2022-06-07 21:52:24', 0, NULL, 18);
INSERT INTO `lend_list` VALUES (6, 1, 12, '2022-05-13 13:20:12', '2022-06-03 13:20:35', 0, NULL, 22);
INSERT INTO `lend_list` VALUES (7, 1, 12, '2022-05-13 13:45:23', NULL, NULL, NULL, 369);
INSERT INTO `lend_list` VALUES (8, 7, 2, '2022-05-13 14:03:59', '2022-06-07 21:52:55', 0, NULL, 26);
INSERT INTO `lend_list` VALUES (9, 2, 12, '2022-06-03 16:08:31', '2022-06-03 21:42:21', 0, NULL, 1);
INSERT INTO `lend_list` VALUES (10, 1, 12, '2022-06-03 16:10:24', '2022-06-03 16:55:49', 2, NULL, 1);
INSERT INTO `lend_list` VALUES (11, 8, 12, '2022-06-03 16:10:55', '2022-06-03 16:55:40', 1, NULL, 1);
INSERT INTO `lend_list` VALUES (12, 1, 12, '2022-06-03 16:40:19', '2022-06-03 16:55:40', 0, NULL, 1);
INSERT INTO `lend_list` VALUES (13, 1, 1, '2022-06-03 18:43:03', '2022-06-07 22:36:09', 0, NULL, 1);
INSERT INTO `lend_list` VALUES (14, 7, 1, '2022-06-03 23:27:38', NULL, NULL, NULL, 348);
INSERT INTO `lend_list` VALUES (15, 3, 1, '2022-06-03 23:31:01', NULL, NULL, NULL, 348);
INSERT INTO `lend_list` VALUES (16, 4, 1, '2022-06-03 23:46:00', NULL, NULL, NULL, 348);
INSERT INTO `lend_list` VALUES (17, 8, 2, '2022-06-03 23:46:43', NULL, NULL, NULL, 348);
INSERT INTO `lend_list` VALUES (18, 1, 2, '2022-06-04 00:29:23', NULL, NULL, NULL, 348);
INSERT INTO `lend_list` VALUES (19, 2, 2, '2022-06-04 00:39:19', NULL, NULL, NULL, 348);
INSERT INTO `lend_list` VALUES (20, 5, 2, '2022-06-04 00:40:52', '2022-06-04 10:44:28', 0, NULL, 1);
INSERT INTO `lend_list` VALUES (21, 6, 3, '2022-06-04 00:51:03', NULL, NULL, NULL, 348);
INSERT INTO `lend_list` VALUES (69, 12, 12, '2022-06-05 11:11:00', NULL, NULL, NULL, 346);
INSERT INTO `lend_list` VALUES (70, 23, 12, '2022-06-05 11:12:18', '2022-06-05 11:15:52', 0, NULL, NULL);
INSERT INTO `lend_list` VALUES (71, 17, 12, '2022-06-05 11:13:05', NULL, NULL, NULL, 346);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告主题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '公告发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '元旦节图书馆放假安排', '元旦节图书馆开放时间', 'admin', '2022-06-01 21:35:53');
INSERT INTO `notice` VALUES (2, '清明节图书馆放假安排', '清明节图书馆开放时间', 'admin1', '2022-06-01 22:38:03');
INSERT INTO `notice` VALUES (3, '劳动节图书馆放假安排', '劳动节图书馆开放时间', 'admin2', '2022-06-02 06:47:54');
INSERT INTO `notice` VALUES (4, '端午节图书馆放假安排', '端午节图书馆开放时间', 'admin2', '2022-06-02 06:48:01');
INSERT INTO `notice` VALUES (5, '暑假图书馆放假安排', '暑假图书馆开放时间', 'admin', '2022-06-02 06:49:03');
INSERT INTO `notice` VALUES (6, '中秋节图书馆放假安排', '中秋节图书馆开放时间', 'admin1', '2022-06-02 07:48:04');

-- ----------------------------
-- Table structure for reader_info
-- ----------------------------
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名（即学号）',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `status` bit(1) NULL DEFAULT NULL COMMENT '读者状态 1:可正常借阅 0:不可借阅',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `registerDate` date NULL DEFAULT NULL COMMENT '入学日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '读者信息（包括登录账号密码等）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader_info
-- ----------------------------
INSERT INTO `reader_info` VALUES (1, '9210607101', '123456', '周家', '男', '2000-11-08', b'0', '13018989121', 'aasdq66@163. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (2, '9210607102', '123456', '苗娟虹', '女', '2000-04-20', b'1', '15657312876', 'tlxbf66@126. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (3, '9210607103', '123456', '杨茹丽', '女', '1999-04-04', b'1', '13018989999', 'tlxbfjcs@126. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (4, '9210607104', '123456', '杨洪', '男', '1999-04-05', b'1', '13018990000', 'tlyzg66@163. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (5, '9210607105', '123456', '苏香华', '男', '1999-06-03', b'1', '13018990001', 'tommy. cui@seakingsoft. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (6, '9210607106', '123456', '陶慧', '男', '1999-06-04', b'1', '13018990002', 'tong_825@hotmail. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (7, '9210607107', '123456', '卫汉', '男', '1999-06-05', b'1', '13018990003', 'tongfangkeji@163. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (8, '9210607108', '123456', '元生祖', '男', '1999-06-06', b'1', '13018990004', 'tonglian_liqun@163. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (9, '9210607109', '123456', '元文俊', '男', '1999-06-07', b'1', '13018990005', 'tongliangfa-ghq@sinosig. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (10, '9210607110', '123456', '戚友', '男', '1999-06-08', b'1', '13018990006', 'tongxin@solutionok. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (11, '9210607111', '123456', '李柏辉', '男', '1999-06-09', b'1', '13018990007', 'tongxiquan@126. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (12, '9210607112', '123456', '木易', '男', '1995-06-10', b'0', '19818007796', '1172507529@qq.com', '2021-09-15');
INSERT INTO `reader_info` VALUES (13, '9210607113', '123456', '昌远隆', '男', '1999-06-11', b'1', '13018990009', 'tongyan@chinaunicom. cn', '2021-09-15');
INSERT INTO `reader_info` VALUES (14, '9210607114', '123456', '冯如云', '女', '1999-06-12', b'1', '13018990010', 'tosin-tech@163. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (15, '9210607115', '123456', '赵宝', '男', '1999-06-13', b'1', '13018990011', 'tqg317@163. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (16, '9210607116', '123456', '唐智远', '男', '1999-06-14', b'1', '13018990012', 'tracyty@sina. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (17, '9210607117', '123456', '岑松柏', '男', '1999-06-15', b'1', '13018990013', 'travolta@126. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (18, '9210607118', '123456', '凤振友', '男', '1999-06-16', b'1', '13018990014', 'tslhzsb@163. com', '2021-09-15');
INSERT INTO `reader_info` VALUES (19, '9210607119', '123456', '于生文', '男', '1999-06-17', b'1', '13018990015', 'tsq_116@live. cn', '2021-09-15');
INSERT INTO `reader_info` VALUES (20, '9210607120', '123456', '邬超兴', '男', '1999-06-18', b'1', '13018990016', 'ttkj13-13@163. com', '2021-09-15');

-- ----------------------------
-- Table structure for type_info
-- ----------------------------
DROP TABLE IF EXISTS `type_info`;
CREATE TABLE `type_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书分类名称',
  `remarks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_info
-- ----------------------------
INSERT INTO `type_info` VALUES (1, '计算机类', ' 选择计算机等于成功');
INSERT INTO `type_info` VALUES (2, '建筑类', '建筑类相关图书');
INSERT INTO `type_info` VALUES (3, '数学类', '高智商人群系列');
INSERT INTO `type_info` VALUES (4, '音乐类', '歌曲改变人生');
INSERT INTO `type_info` VALUES (5, '经济类', '我现在只想搞钱');
INSERT INTO `type_info` VALUES (6, '管理类', '学习统计，天下无敌');
INSERT INTO `type_info` VALUES (7, '体育类', '体育');
INSERT INTO `type_info` VALUES (8, '英语类', '英语');
INSERT INTO `type_info` VALUES (9, '文学类', '文学');
INSERT INTO `type_info` VALUES (10, '考研类', ' 卷死人嘞!');
INSERT INTO `type_info` VALUES (11, '生物类', '');

SET FOREIGN_KEY_CHECKS = 1;
