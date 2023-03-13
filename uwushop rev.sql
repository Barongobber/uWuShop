/*
 Navicat Premium Data Transfer

 Source Server         : No
 Source Server Type    : MySQL
 Source Server Version : 100110
 Source Host           : localhost:3306
 Source Schema         : uwushop

 Target Server Type    : MySQL
 Target Server Version : 100110
 File Encoding         : 65001

 Date: 04/02/2021 06:42:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admintable
-- ----------------------------
DROP TABLE IF EXISTS `admintable`;
CREATE TABLE `admintable`  (
  `adminid` int NOT NULL AUTO_INCREMENT,
  `adminname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  PRIMARY KEY (`adminid`) USING BTREE,
  UNIQUE INDEX `adminname`(`adminname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admintable
-- ----------------------------
INSERT INTO `admintable` VALUES (1, 'admin', 'first admin', 'adminpertama');
INSERT INTO `admintable` VALUES (2, 'aaa', 'aa', 'aa');
INSERT INTO `admintable` VALUES (3, 'archaenum', 'archaenum', 'yoi');

-- ----------------------------
-- Table structure for campaign
-- ----------------------------
DROP TABLE IF EXISTS `campaign`;
CREATE TABLE `campaign`  (
  `campaign_id` int NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `campaign_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_recipients` int NULL DEFAULT NULL,
  `blasted_on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`campaign_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaign
-- ----------------------------

-- ----------------------------
-- Table structure for carouseltable
-- ----------------------------
DROP TABLE IF EXISTS `carouseltable`;
CREATE TABLE `carouseltable`  (
  `carouselID` int NOT NULL AUTO_INCREMENT,
  `imgsrc` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`carouselID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carouseltable
-- ----------------------------
INSERT INTO `carouseltable` VALUES (1, 'hawaiinew.jpg');
INSERT INTO `carouseltable` VALUES (2, 'hawaishirt.jpg');
INSERT INTO `carouseltable` VALUES (3, 'download.webp');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `price` int NOT NULL,
  `qty_order` int NOT NULL,
  `pymt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shipping_price` int NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Pending','On Delivery','Cancelled','Success','Approved') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_fk`(`userid`) USING BTREE,
  INDEX `status_fk`(`status`) USING BTREE,
  INDEX `product_fk`(`product_id`) USING BTREE,
  CONSTRAINT `product_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_fk` FOREIGN KEY (`userid`) REFERENCES `usertable` (`userid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 5, 300, 1, 'Transfer', 20, '30-Jan-21', 'Success', 1);
INSERT INTO `order` VALUES (2, 6, 100, 1, 'Transfer', 20, '04-Feb-21', 'Pending', 1);
INSERT INTO `order` VALUES (3, 4, 200, 2, 'COD', 20, '02-Feb-21', 'On Delivery', 1);
INSERT INTO `order` VALUES (4, 2, 50, 10, 'Credit Card', 20, '01-Feb-21', 'Success', 4);
INSERT INTO `order` VALUES (5, 3, 60, 1, 'Credit Card', 10, '04-Feb-21', 'Pending', 4);
INSERT INTO `order` VALUES (6, 1, 30, 5, 'Credit Card', 10, '30-Jan-21', 'Cancelled', 6);
INSERT INTO `order` VALUES (7, 5, 300, 30, 'Credit Card', 10, '29-Jan-21', 'Success', 11);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `productname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `adminid` int NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `admin_id_fk`(`adminid`) USING BTREE,
  CONSTRAINT `admin_id_fk` FOREIGN KEY (`adminid`) REFERENCES `admintable` (`adminid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Plain White T- Shirt', 'T-Shirt', 30, 195, 'Plain white shirt. Nothing special, nothing bad. Just plain, pure, and easy on the eyes', 'sahil-moosa-m1MRYp556Ew-unsplash.jpg', 1);
INSERT INTO `product` VALUES (2, 'Plaid Tartan Pattern Shirt', 'Shirt', 50, 140, 'Made from the best quality material. Comfortable to wear.', 'deepak-choudhary-FPMu69Sbm5k-unsplash.jpg', 1);
INSERT INTO `product` VALUES (3, 'Hawaiian Shirt', 'Shirt', 60, 149, 'A must have shirt for the beach. Always be ready for the sandy shore.', 'antoine-da-cunha-r8AEmsxbf1A-unsplash.jpg', 1);
INSERT INTO `product` VALUES (4, 'Gray Ripped Jeans', 'Pants', 200, 98, 'You don\'t need to be afraid of ripping your jeans anymore, because it has already been ripped for you!', 'nathan-dumlao-ItYfrGlARis-unsplash.jpg', 1);
INSERT INTO `product` VALUES (5, 'The One Ring to Rule Them All', 'Accessories', 300, 69, 'Sauron\'s ultimate creation. The one ring, it corrupts your soul it awakens the greed within you.', 'the one ring.jpg', 1);
INSERT INTO `product` VALUES (6, 'Dragon Tooth Necklace', 'Accessories', 100, 99, 'The dragon slayers worked so hard to yank out a dragon\'s tooth. The exoticism alone compels you to buy the thing.', 'LargeBaseAlpha-Straightdown_Compressed_698x.png', 2);
INSERT INTO `product` VALUES (7, 'Camera Crew T-Shirt', 'T-Shirt', 30, 200, 'Be a camera crew', 'jose-pedro-ortiz-jXywvr0Odxg-unsplash.jpg', 2);

-- ----------------------------
-- Table structure for usertable
-- ----------------------------
DROP TABLE IF EXISTS `usertable`;
CREATE TABLE `usertable`  (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(130) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phonenum` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `crmsubs` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usertable
-- ----------------------------
INSERT INTO `usertable` VALUES (1, 'shopper', 'Baron', 'todopsain11@gmail.com', 'ruwet', '028903', 'ruwet', 1);
INSERT INTO `usertable` VALUES (2, 'ruwet', 'ngelu', 'todopsain11@gmail.com', 'mumet', '42069', 'nggliyeng', 1);
INSERT INTO `usertable` VALUES (3, 'wangkrik', 'jangkrik', 'shikifujin11@protonmail.ch', 'jangkrikkrikkrik', '6942069', 'mboh', 1);
INSERT INTO `usertable` VALUES (4, 'shikifujin11', 'Shiki Fujin', 'shikifujin11@protonmail.ch', 'Hell', '55556666', 'shikifujin11', 1);
INSERT INTO `usertable` VALUES (5, 'tahoe', 'tahoe', 'technoinfosys05@gmail.com', 'mbek', 'tahoe', 'tahoe', 0);
INSERT INTO `usertable` VALUES (6, 'rowan', 'wowowowo', 'technoinfosys05@gmail.com', 'mmmm', 'rowan', 'rowan', 0);
INSERT INTO `usertable` VALUES (7, 'acecen', 'bicabueacon', 'cheonryong11@cloud.nesia.my.id', 'bicabiue', 'cabiuaeniu', 'aa', 1);
INSERT INTO `usertable` VALUES (8, 'mumet', 'ruwet', 'cheonryong11@cloud.nesia.my.id', 'mumet', 'mumet', 'mumet', 1);
INSERT INTO `usertable` VALUES (9, 'juenius', 'fuuu', 'zerefthemaster@gmail.com', 'aaa', 'aaa', 'aaa', 0);
INSERT INTO `usertable` VALUES (10, 'Baron', 'baron gobi', 'gobi.baron@gmail.com', 'Karawang', '0318293718', 'lkw454da78', 1);
INSERT INTO `usertable` VALUES (11, 'snoopdogg', 'snoopdog', 'snoopdog@weedman.com', 'jamaica', '420', '69420', 1);
INSERT INTO `usertable` VALUES (12, 'pablo', 'pablo', 'pablo@pablo.com', 'pablo', '111', 'pablo', 1);

SET FOREIGN_KEY_CHECKS = 1;
