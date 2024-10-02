/*
 Navicat Premium Data Transfer

 Source Server         : 本机MySQL
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : shop-test

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 02/10/2024 19:59:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app6_myuser
-- ----------------------------
DROP TABLE IF EXISTS `app6_myuser`;
CREATE TABLE `app6_myuser`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `photo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `weChat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app6_myuser
-- ----------------------------
INSERT INTO `app6_myuser` VALUES (1, 'pbkdf2_sha256$216000$Xt3l6mjw2id2$McXpZwxe7GXFYiSZlaqQkqzhKmtVFwcvKIl1b3oda/E=', '2024-10-02 18:55:32.800560', 1, 'admin', '', '', '222@111.com', 1, 1, '2024-10-01 15:22:14.139730', '', 'yangcoder', '1');
INSERT INTO `app6_myuser` VALUES (2, 'pbkdf2_sha256$216000$Xt3l6mjw2id2$McXpZwxe7GXFYiSZlaqQkqzhKmtVFwcvKIl1b3oda/E=', '2024-10-01 21:01:04.962473', 0, 'test', '', '', '', 0, 1, '2024-10-01 15:46:12.000000', 'balabala', 'balabala', '9');

-- ----------------------------
-- Table structure for app6_myuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `app6_myuser_groups`;
CREATE TABLE `app6_myuser_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `myuser_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app6_myuser_groups_myuser_id_group_id_538b750e_uniq`(`myuser_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `app6_myuser_groups_group_id_eaa8e194_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `app6_myuser_groups_group_id_eaa8e194_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app6_myuser_groups_myuser_id_a43f76d2_fk_app6_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `app6_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app6_myuser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for app6_myuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `app6_myuser_user_permissions`;
CREATE TABLE `app6_myuser_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `myuser_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app6_myuser_user_permiss_myuser_id_permission_id_9df4760b_uniq`(`myuser_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `app6_myuser_user_per_permission_id_733dfd60_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `app6_myuser_user_per_myuser_id_c641c085_fk_app6_myus` FOREIGN KEY (`myuser_id`) REFERENCES `app6_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app6_myuser_user_per_permission_id_733dfd60_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app6_myuser_user_permissions
-- ----------------------------
INSERT INTO `app6_myuser_user_permissions` VALUES (1, 2, 56);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 人员基本信息', 6, 'add_userbaseinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can change 人员基本信息', 6, 'change_userbaseinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 人员基本信息', 6, 'delete_userbaseinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can view 人员基本信息', 6, 'view_userbaseinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add 人员基本信息', 7, 'add_userbaseinfo');
INSERT INTO `auth_permission` VALUES (26, 'Can change 人员基本信息', 7, 'change_userbaseinfo');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 人员基本信息', 7, 'delete_userbaseinfo');
INSERT INTO `auth_permission` VALUES (28, 'Can view 人员基本信息', 7, 'view_userbaseinfo');
INSERT INTO `auth_permission` VALUES (29, 'Can add 部门信息', 8, 'add_departinfo');
INSERT INTO `auth_permission` VALUES (30, 'Can change 部门信息', 8, 'change_departinfo');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 部门信息', 8, 'delete_departinfo');
INSERT INTO `auth_permission` VALUES (32, 'Can view 部门信息', 8, 'view_departinfo');
INSERT INTO `auth_permission` VALUES (33, 'Can add 特长信息', 9, 'add_skillinfo');
INSERT INTO `auth_permission` VALUES (34, 'Can change 特长信息', 9, 'change_skillinfo');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 特长信息', 9, 'delete_skillinfo');
INSERT INTO `auth_permission` VALUES (36, 'Can view 特长信息', 9, 'view_skillinfo');
INSERT INTO `auth_permission` VALUES (37, 'Can add 用户卡信息', 10, 'add_cardinfo');
INSERT INTO `auth_permission` VALUES (38, 'Can change 用户卡信息', 10, 'change_cardinfo');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 用户卡信息', 10, 'delete_cardinfo');
INSERT INTO `auth_permission` VALUES (40, 'Can view 用户卡信息', 10, 'view_cardinfo');
INSERT INTO `auth_permission` VALUES (41, 'Can add 人员扩展信息', 11, 'add_userextrainfo');
INSERT INTO `auth_permission` VALUES (42, 'Can change 人员扩展信息', 11, 'change_userextrainfo');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 人员扩展信息', 11, 'delete_userextrainfo');
INSERT INTO `auth_permission` VALUES (44, 'Can view 人员扩展信息', 11, 'view_userextrainfo');
INSERT INTO `auth_permission` VALUES (45, 'Can add 用户头像信息', 12, 'add_imgfile');
INSERT INTO `auth_permission` VALUES (46, 'Can change 用户头像信息', 12, 'change_imgfile');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 用户头像信息', 12, 'delete_imgfile');
INSERT INTO `auth_permission` VALUES (48, 'Can view 用户头像信息', 12, 'view_imgfile');
INSERT INTO `auth_permission` VALUES (49, 'Can add 人员基本信息', 13, 'add_userbaseinfo');
INSERT INTO `auth_permission` VALUES (50, 'Can change 人员基本信息', 13, 'change_userbaseinfo');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 人员基本信息', 13, 'delete_userbaseinfo');
INSERT INTO `auth_permission` VALUES (52, 'Can view 人员基本信息', 13, 'view_userbaseinfo');
INSERT INTO `auth_permission` VALUES (53, 'Can add user', 14, 'add_myuser');
INSERT INTO `auth_permission` VALUES (54, 'Can change user', 14, 'change_myuser');
INSERT INTO `auth_permission` VALUES (55, 'Can delete user', 14, 'delete_myuser');
INSERT INTO `auth_permission` VALUES (56, 'Can view user', 14, 'view_myuser');
INSERT INTO `auth_permission` VALUES (57, '审核用户信息', 14, 'check_myuser');
INSERT INTO `auth_permission` VALUES (58, 'Can add 商品分类', 15, 'add_goodscategory');
INSERT INTO `auth_permission` VALUES (59, 'Can change 商品分类', 15, 'change_goodscategory');
INSERT INTO `auth_permission` VALUES (60, 'Can delete 商品分类', 15, 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES (61, 'Can view 商品分类', 15, 'view_goodscategory');
INSERT INTO `auth_permission` VALUES (62, 'Can add 商品表', 16, 'add_goods');
INSERT INTO `auth_permission` VALUES (63, 'Can change 商品表', 16, 'change_goods');
INSERT INTO `auth_permission` VALUES (64, 'Can delete 商品表', 16, 'delete_goods');
INSERT INTO `auth_permission` VALUES (65, 'Can view 商品表', 16, 'view_goods');
INSERT INTO `auth_permission` VALUES (66, 'Can add Token', 17, 'add_token');
INSERT INTO `auth_permission` VALUES (67, 'Can change Token', 17, 'change_token');
INSERT INTO `auth_permission` VALUES (68, 'Can delete Token', 17, 'delete_token');
INSERT INTO `auth_permission` VALUES (69, 'Can view Token', 17, 'view_token');
INSERT INTO `auth_permission` VALUES (70, 'Can add token', 18, 'add_tokenproxy');
INSERT INTO `auth_permission` VALUES (71, 'Can change token', 18, 'change_tokenproxy');
INSERT INTO `auth_permission` VALUES (72, 'Can delete token', 18, 'delete_tokenproxy');
INSERT INTO `auth_permission` VALUES (73, 'Can view token', 18, 'view_tokenproxy');
INSERT INTO `auth_permission` VALUES (74, 'Can add 商品分类', 19, 'add_goodscategory');
INSERT INTO `auth_permission` VALUES (75, 'Can change 商品分类', 19, 'change_goodscategory');
INSERT INTO `auth_permission` VALUES (76, 'Can delete 商品分类', 19, 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES (77, 'Can view 商品分类', 19, 'view_goodscategory');
INSERT INTO `auth_permission` VALUES (78, 'Can add 商品表', 20, 'add_goods');
INSERT INTO `auth_permission` VALUES (79, 'Can change 商品表', 20, 'change_goods');
INSERT INTO `auth_permission` VALUES (80, 'Can delete 商品表', 20, 'delete_goods');
INSERT INTO `auth_permission` VALUES (81, 'Can view 商品表', 20, 'view_goods');

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token`  (
  `key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_app6_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `app6_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------
INSERT INTO `authtoken_token` VALUES ('fdf47fd394e7e817ea6b26d7e5c67b0d6c86ce85', '2024-10-02 12:09:18.687750', 1);

-- ----------------------------
-- Table structure for cardinfo
-- ----------------------------
DROP TABLE IF EXISTS `cardinfo`;
CREATE TABLE `cardinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cardno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `CardInfo_user_id_1157fa59_fk_UserBaseInfo4_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `CardInfo_user_id_1157fa59_fk_UserBaseInfo4_id` FOREIGN KEY (`user_id`) REFERENCES `userbaseinfo4` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cardinfo
-- ----------------------------

-- ----------------------------
-- Table structure for d_goods8
-- ----------------------------
DROP TABLE IF EXISTS `d_goods8`;
CREATE TABLE `d_goods8`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `market_price` decimal(8, 2) NOT NULL,
  `price` decimal(8, 2) NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `click_num` int NOT NULL,
  `amount` int NOT NULL,
  `stock_num` int NOT NULL,
  `fav_num` int NOT NULL,
  `status` int NOT NULL,
  `main_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `createDate` datetime(6) NOT NULL,
  `category_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_goods8_category_id_728b8485_fk_d_goods_category8_id`(`category_id` ASC) USING BTREE,
  INDEX `d_goods8_user_id_d2823415_fk_app6_myuser_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `d_goods8_category_id_728b8485_fk_d_goods_category8_id` FOREIGN KEY (`category_id`) REFERENCES `d_goods_category8` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `d_goods8_user_id_d2823415_fk_app6_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `app6_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_goods8
-- ----------------------------
INSERT INTO `d_goods8` VALUES (1, '和田大枣', 89.00, 79.00, '1', 1, 1, 1, 1, 1, '1', 1, '2024-10-01 20:58:00.000000', 1, 1);
INSERT INTO `d_goods8` VALUES (2, '新疆大枣（put 更新）', 59.00, 49.00, NULL, 0, 0, 0, 0, 0, '', 0, '2024-10-01 21:29:42.673884', 1, 1);
INSERT INTO `d_goods8` VALUES (3, '四川大枣', 199.00, 189.00, NULL, 0, 0, 0, 0, 0, '', 0, '2024-10-01 22:11:33.422793', 1, 2);

-- ----------------------------
-- Table structure for d_goods9
-- ----------------------------
DROP TABLE IF EXISTS `d_goods9`;
CREATE TABLE `d_goods9`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `market_price` decimal(8, 2) NOT NULL,
  `price` decimal(8, 2) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_goods9_category_id_46dce46c_fk_d_goods_category9_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `d_goods9_category_id_46dce46c_fk_d_goods_category9_id` FOREIGN KEY (`category_id`) REFERENCES `d_goods_category9` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_goods9
-- ----------------------------

-- ----------------------------
-- Table structure for d_goods_category8
-- ----------------------------
DROP TABLE IF EXISTS `d_goods_category8`;
CREATE TABLE `d_goods_category8`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nav` tinyint(1) NOT NULL,
  `sort` int NOT NULL,
  `parent_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_goods_category8_parent_id_3e4eaf91_fk_d_goods_category8_id`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `d_goods_category8_parent_id_3e4eaf91_fk_d_goods_category8_id` FOREIGN KEY (`parent_id`) REFERENCES `d_goods_category8` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_goods_category8
-- ----------------------------
INSERT INTO `d_goods_category8` VALUES (1, '枣类', '/', 1, 1, NULL);

-- ----------------------------
-- Table structure for d_goods_category9
-- ----------------------------
DROP TABLE IF EXISTS `d_goods_category9`;
CREATE TABLE `d_goods_category9`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_goods_category9
-- ----------------------------

-- ----------------------------
-- Table structure for departinfo
-- ----------------------------
DROP TABLE IF EXISTS `departinfo`;
CREATE TABLE `departinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `departname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departinfo
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_app6_myuser_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app6_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `app6_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2024-10-01 15:47:38.085409', '2', 'test', 1, '[{\"added\": {}}]', 14, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (6, 'app2', 'userbaseinfo');
INSERT INTO `django_content_type` VALUES (10, 'app4', 'cardinfo');
INSERT INTO `django_content_type` VALUES (8, 'app4', 'departinfo');
INSERT INTO `django_content_type` VALUES (9, 'app4', 'skillinfo');
INSERT INTO `django_content_type` VALUES (7, 'app4', 'userbaseinfo');
INSERT INTO `django_content_type` VALUES (11, 'app4', 'userextrainfo');
INSERT INTO `django_content_type` VALUES (12, 'app5', 'imgfile');
INSERT INTO `django_content_type` VALUES (13, 'app5', 'userbaseinfo');
INSERT INTO `django_content_type` VALUES (14, 'app6', 'myuser');
INSERT INTO `django_content_type` VALUES (16, 'app8', 'goods');
INSERT INTO `django_content_type` VALUES (15, 'app8', 'goodscategory');
INSERT INTO `django_content_type` VALUES (20, 'app9', 'goods');
INSERT INTO `django_content_type` VALUES (19, 'app9', 'goodscategory');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (17, 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES (18, 'authtoken', 'tokenproxy');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-10-01 15:13:05.774930');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-10-01 15:13:05.811618');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-10-01 15:13:05.854875');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-10-01 15:13:05.918781');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-10-01 15:13:05.924292');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-10-01 15:13:05.928290');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-10-01 15:13:05.931290');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-10-01 15:13:05.933799');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-10-01 15:13:05.937798');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-10-01 15:13:05.940798');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-10-01 15:13:05.944307');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-10-01 15:13:05.952815');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-10-01 15:13:05.956822');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-10-01 15:13:05.961355');
INSERT INTO `django_migrations` VALUES (15, 'app6', '0001_initial', '2024-10-01 15:13:06.009587');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2024-10-01 15:13:06.065240');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-10-01 15:13:06.086929');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-01 15:13:06.090981');
INSERT INTO `django_migrations` VALUES (19, 'app2', '0001_initial', '2024-10-01 15:26:39.540908');
INSERT INTO `django_migrations` VALUES (20, 'app2', '0002_auto_20240930_2030', '2024-10-01 15:26:39.551417');
INSERT INTO `django_migrations` VALUES (21, 'app2', '0003_auto_20240930_2037', '2024-10-01 15:26:39.561541');
INSERT INTO `django_migrations` VALUES (22, 'app2', '0004_auto_20240930_2051', '2024-10-01 15:26:39.568615');
INSERT INTO `django_migrations` VALUES (23, 'app2', '0005_auto_20240930_2053', '2024-10-01 15:26:39.571615');
INSERT INTO `django_migrations` VALUES (24, 'app4', '0001_initial', '2024-10-01 15:27:17.236576');
INSERT INTO `django_migrations` VALUES (25, 'app4', '0002_cardinfo', '2024-10-01 15:27:17.282723');
INSERT INTO `django_migrations` VALUES (26, 'app4', '0003_auto_20241001_1117', '2024-10-01 15:27:17.309118');
INSERT INTO `django_migrations` VALUES (27, 'app4', '0004_auto_20241001_1119', '2024-10-01 15:27:17.325747');
INSERT INTO `django_migrations` VALUES (28, 'app4', '0005_auto_20241001_1120', '2024-10-01 15:27:17.343450');
INSERT INTO `django_migrations` VALUES (29, 'app4', '0006_auto_20241001_1126', '2024-10-01 15:27:17.383497');
INSERT INTO `django_migrations` VALUES (30, 'app4', '0007_auto_20241001_1132', '2024-10-01 15:27:17.412882');
INSERT INTO `django_migrations` VALUES (31, 'app5', '0001_initial', '2024-10-01 15:27:17.424393');
INSERT INTO `django_migrations` VALUES (32, 'app5', '0002_userbaseinfo', '2024-10-01 15:27:17.438999');
INSERT INTO `django_migrations` VALUES (33, 'sessions', '0001_initial', '2024-10-01 15:27:17.452507');
INSERT INTO `django_migrations` VALUES (34, 'app6', '0002_auto_20241001_1536', '2024-10-01 15:36:28.049077');
INSERT INTO `django_migrations` VALUES (35, 'app8', '0001_initial', '2024-10-01 20:56:19.130974');
INSERT INTO `django_migrations` VALUES (36, 'authtoken', '0001_initial', '2024-10-02 11:36:33.611612');
INSERT INTO `django_migrations` VALUES (37, 'authtoken', '0002_auto_20160226_1747', '2024-10-02 11:36:33.665613');
INSERT INTO `django_migrations` VALUES (38, 'authtoken', '0003_tokenproxy', '2024-10-02 11:36:33.668612');
INSERT INTO `django_migrations` VALUES (39, 'app9', '0001_initial', '2024-10-02 16:53:00.019565');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for my_cache_table
-- ----------------------------
DROP TABLE IF EXISTS `my_cache_table`;
CREATE TABLE `my_cache_table`  (
  `cache_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  PRIMARY KEY (`cache_key`) USING BTREE,
  INDEX `my_cache_table_expires`(`expires` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_cache_table
-- ----------------------------
INSERT INTO `my_cache_table` VALUES (':1:201c139109d4b786bf6e08160fef28ca', 'gAWV2CoAAAAAAABCSCoAAAoKCgo8IURPQ1RZUEUgaHRtbD4KPGh0bWw+CiAgPGhlYWQ+CiAgICAKCiAgICAgIAogICAgICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ii8+CiAgICAgICAgPG1ldGEgbmFtZT0icm9ib3RzIiBjb250ZW50PSJOT05FLE5PQVJDSElWRSIgLz4KICAgICAgCgogICAgICA8dGl0bGU+R29vZHMgTGlzdCDigJMgRGphbmdvIFJFU1QgZnJhbWV3b3JrPC90aXRsZT4KCiAgICAgIAogICAgICAgIAogICAgICAgICAgPGxpbmsgcmVsPSJzdHlsZXNoZWV0IiB0eXBlPSJ0ZXh0L2NzcyIgaHJlZj0iL3N0YXRpYy9yZXN0X2ZyYW1ld29yay9jc3MvYm9vdHN0cmFwLm1pbi5jc3MiLz4KICAgICAgICAgIDxsaW5rIHJlbD0ic3R5bGVzaGVldCIgdHlwZT0idGV4dC9jc3MiIGhyZWY9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvY3NzL2Jvb3RzdHJhcC10d2Vha3MuY3NzIi8+CiAgICAgICAgCgogICAgICAgIDxsaW5rIHJlbD0ic3R5bGVzaGVldCIgdHlwZT0idGV4dC9jc3MiIGhyZWY9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvY3NzL3ByZXR0aWZ5LmNzcyIvPgogICAgICAgIDxsaW5rIHJlbD0ic3R5bGVzaGVldCIgdHlwZT0idGV4dC9jc3MiIGhyZWY9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvY3NzL2RlZmF1bHQuY3NzIi8+CiAgICAgICAgCiAgICAgIAoKICAgIAogIDwvaGVhZD4KCiAgCiAgPGJvZHkgY2xhc3M9IiI+CgogICAgPGRpdiBjbGFzcz0id3JhcHBlciI+CiAgICAgIAogICAgICAgIDxkaXYgY2xhc3M9Im5hdmJhciBuYXZiYXItc3RhdGljLXRvcCBuYXZiYXItaW52ZXJzZSIKICAgICAgICAgICAgIHJvbGU9Im5hdmlnYXRpb24iIGFyaWEtbGFiZWw9Im5hdmJhciI+CiAgICAgICAgICA8ZGl2IGNsYXNzPSJjb250YWluZXIiPgogICAgICAgICAgICA8c3Bhbj4KICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgIDxhIGNsYXNzPSduYXZiYXItYnJhbmQnIHJlbD0ibm9mb2xsb3ciIGhyZWY9J2h0dHBzOi8vd3d3LmRqYW5nby1yZXN0LWZyYW1ld29yay5vcmcvJz4KICAgICAgICAgICAgICAgICAgICBEamFuZ28gUkVTVCBmcmFtZXdvcmsKICAgICAgICAgICAgICAgIDwvYT4KICAgICAgICAgICAgICAKICAgICAgICAgICAgPC9zcGFuPgogICAgICAgICAgICA8dWwgY2xhc3M9Im5hdiBuYXZiYXItbmF2IHB1bGwtcmlnaHQiPgogICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgCiAgICAgICAgICAgIDwvdWw+CiAgICAgICAgICA8L2Rpdj4KICAgICAgICA8L2Rpdj4KICAgICAgCgogICAgICA8ZGl2IGNsYXNzPSJjb250YWluZXIiPgogICAgICAgIAogICAgICAgICAgPHVsIGNsYXNzPSJicmVhZGNydW1iIj4KICAgICAgICAgICAgCiAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iL2FwcDgvIj5BcGkgUm9vdDwvYT48L2xpPgogICAgICAgICAgICAgIAogICAgICAgICAgICAKICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgIDxsaSBjbGFzcz0iYWN0aXZlIj48YSBocmVmPSIvYXBwOC9nb29kc19hbGwvIj5Hb29kcyBMaXN0PC9hPjwvbGk+CiAgICAgICAgICAgICAgCiAgICAgICAgICAgIAogICAgICAgICAgPC91bD4KICAgICAgICAKCiAgICAgICAgPCEtLSBDb250ZW50IC0tPgogICAgICAgIDxkaXYgaWQ9ImNvbnRlbnQiIHJvbGU9Im1haW4iIGFyaWEtbGFiZWw9ImNvbnRlbnQiPgogICAgICAgICAgCgogICAgICAgICAgPGRpdiBjbGFzcz0icmVnaW9uIiAgYXJpYS1sYWJlbD0icmVxdWVzdCBmb3JtIj4KICAgICAgICAgIAoKICAgICAgICAgIAogICAgICAgICAgICA8Zm9ybSBpZD0iZ2V0LWZvcm0iIGNsYXNzPSJwdWxsLXJpZ2h0Ij4KICAgICAgICAgICAgICA8ZmllbGRzZXQ+CiAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0iYnRuLWdyb3VwIGZvcm1hdC1zZWxlY3Rpb24iPgogICAgICAgICAgICAgICAgICAgIDxhIGNsYXNzPSJidG4gYnRuLXByaW1hcnkganMtdG9vbHRpcCIgaHJlZj0iL2FwcDgvZ29vZHNfYWxsLyIgcmVsPSJub2ZvbGxvdyIgdGl0bGU9Ik1ha2UgYSBHRVQgcmVxdWVzdCBvbiB0aGUgR29vZHMgTGlzdCByZXNvdXJjZSI+R0VUPC9hPgoKICAgICAgICAgICAgICAgICAgICA8YnV0dG9uIGNsYXNzPSJidG4gYnRuLXByaW1hcnkgZHJvcGRvd24tdG9nZ2xlIGpzLXRvb2x0aXAiIGRhdGEtdG9nZ2xlPSJkcm9wZG93biIgdGl0bGU9IlNwZWNpZnkgYSBmb3JtYXQgZm9yIHRoZSBHRVQgcmVxdWVzdCI+CiAgICAgICAgICAgICAgICAgICAgICA8c3BhbiBjbGFzcz0iY2FyZXQiPjwvc3Bhbj4KICAgICAgICAgICAgICAgICAgICA8L2J1dHRvbj4KICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImRyb3Bkb3duLW1lbnUiPgogICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgIDxsaT4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YSBjbGFzcz0ianMtdG9vbHRpcCBmb3JtYXQtb3B0aW9uIiBocmVmPSIvYXBwOC9nb29kc19hbGwvP2Zvcm1hdD1qc29uIiByZWw9Im5vZm9sbG93IiB0aXRsZT0iTWFrZSBhIEdFVCByZXF1ZXN0IG9uIHRoZSBHb29kcyBMaXN0IHJlc291cmNlIHdpdGggdGhlIGZvcm1hdCBzZXQgdG8gYGpzb25gIj5qc29uPC9hPgogICAgICAgICAgICAgICAgICAgICAgICA8L2xpPgogICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgIDxsaT4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YSBjbGFzcz0ianMtdG9vbHRpcCBmb3JtYXQtb3B0aW9uIiBocmVmPSIvYXBwOC9nb29kc19hbGwvP2Zvcm1hdD1hcGkiIHJlbD0ibm9mb2xsb3ciIHRpdGxlPSJNYWtlIGEgR0VUIHJlcXVlc3Qgb24gdGhlIEdvb2RzIExpc3QgcmVzb3VyY2Ugd2l0aCB0aGUgZm9ybWF0IHNldCB0byBgYXBpYCI+YXBpPC9hPgogICAgICAgICAgICAgICAgICAgICAgICA8L2xpPgogICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICA8L2ZpZWxkc2V0PgogICAgICAgICAgICA8L2Zvcm0+CiAgICAgICAgICAKCiAgICAgICAgICAKICAgICAgICAgICAgPGZvcm0gY2xhc3M9ImJ1dHRvbi1mb3JtIiBhY3Rpb249Ii9hcHA4L2dvb2RzX2FsbC8iIGRhdGEtbWV0aG9kPSJPUFRJT05TIj4KICAgICAgICAgICAgICA8YnV0dG9uIGNsYXNzPSJidG4gYnRuLXByaW1hcnkganMtdG9vbHRpcCIgdGl0bGU9Ik1ha2UgYW4gT1BUSU9OUyByZXF1ZXN0IG9uIHRoZSBHb29kcyBMaXN0IHJlc291cmNlIj5PUFRJT05TPC9idXR0b24+CiAgICAgICAgICAgIDwvZm9ybT4KICAgICAgICAgIAoKICAgICAgICAgIAoKICAgICAgICAgIAoKICAgICAgICAgIAoKICAgICAgICAgIAogICAgICAgICAgPC9kaXY+CgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJjb250ZW50LW1haW4iIHJvbGU9Im1haW4iICBhcmlhLWxhYmVsPSJtYWluIGNvbnRlbnQiPgogICAgICAgICAgICAgIDxkaXYgY2xhc3M9InBhZ2UtaGVhZGVyIj4KICAgICAgICAgICAgICAgIDxoMT5Hb29kcyBMaXN0PC9oMT4KICAgICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgICAgICA8ZGl2IHN0eWxlPSJmbG9hdDpsZWZ0Ij4KICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICA8cD5saXN0OjxiciAvPiAgICDov5Tlm57miYDmnInmlbDmja4uPGJyIC8+cmV0cmlldmU6PGJyIC8+ICAgIOi/lOWbnuWNleadoeaVsOaNruWunuS+iy48L3A+CiAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICA8L2Rpdj4KCiAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICA8bmF2IHN0eWxlPSJmbG9hdDogcmlnaHQiPgogICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9InBhZ2luYXRpb24iIHN0eWxlPSJtYXJnaW46IDVweCAwIDEwcHggMCI+CiAgCiAgICA8bGkgY2xhc3M9ImRpc2FibGVkIj4KICAgICAgPGEgaHJlZj0iIyIgYXJpYS1sYWJlbD0iUHJldmlvdXMiPgogICAgICAgIDxzcGFuIGFyaWEtaGlkZGVuPSJ0cnVlIj4mbGFxdW87PC9zcGFuPgogICAgICA8L2E+CiAgICA8L2xpPgogIAoKICAKICAgIAogICAgICAKICAgICAgICA8bGkgY2xhc3M9ImFjdGl2ZSI+CiAgICAgICAgICA8YSBocmVmPSJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBwOC9nb29kc19hbGwvIj4xPC9hPgogICAgICAgIDwvbGk+CiAgICAgIAogICAgCiAgCiAgICAKICAgICAgCiAgICAgICAgPGxpPgogICAgICAgICAgPGEgaHJlZj0iaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FwcDgvZ29vZHNfYWxsLz9wYWdlPTIiPjI8L2E+CiAgICAgICAgPC9saT4KICAgICAgCiAgICAKICAKICAgIAogICAgICAKICAgICAgICA8bGk+CiAgICAgICAgICA8YSBocmVmPSJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBwOC9nb29kc19hbGwvP3BhZ2U9MyI+MzwvYT4KICAgICAgICA8L2xpPgogICAgICAKICAgIAogIAoKICAKICAgIDxsaT4KICAgICAgPGEgaHJlZj0iaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FwcDgvZ29vZHNfYWxsLz9wYWdlPTIiIGFyaWEtbGFiZWw9Ik5leHQiPgogICAgICAgIDxzcGFuIGFyaWEtaGlkZGVuPSJ0cnVlIj4mcmFxdW87PC9zcGFuPgogICAgICA8L2E+CiAgICA8L2xpPgogIAo8L3VsPgoKICAgICAgICAgICAgICAgIDwvbmF2PgogICAgICAgICAgICAgIAoKICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJyZXF1ZXN0LWluZm8iIHN0eWxlPSJjbGVhcjogYm90aCIgYXJpYS1sYWJlbD0icmVxdWVzdCBpbmZvIj4KICAgICAgICAgICAgICAgIDxwcmUgY2xhc3M9InByZXR0eXByaW50Ij48Yj5HRVQ8L2I+IC9hcHA4L2dvb2RzX2FsbC88L3ByZT4KICAgICAgICAgICAgICA8L2Rpdj4KCiAgICAgICAgICAgICAgPGRpdiBjbGFzcz0icmVzcG9uc2UtaW5mbyIgYXJpYS1sYWJlbD0icmVzcG9uc2UgaW5mbyI+CiAgICAgICAgICAgICAgICA8cHJlIGNsYXNzPSJwcmV0dHlwcmludCI+PHNwYW4gY2xhc3M9Im1ldGEgbm9jb2RlIj48Yj5IVFRQIDIwMCBPSzwvYj4KPGI+QWxsb3c6PC9iPiA8c3BhbiBjbGFzcz0ibGl0Ij5HRVQsIFBPU1QsIEhFQUQsIE9QVElPTlM8L3NwYW4+CjxiPkNvbnRlbnQtVHlwZTo8L2I+IDxzcGFuIGNsYXNzPSJsaXQiPmFwcGxpY2F0aW9uL2pzb248L3NwYW4+CjxiPlZhcnk6PC9iPiA8c3BhbiBjbGFzcz0ibGl0Ij5BY2NlcHQ8L3NwYW4+Cgo8L3NwYW4+ewogICAgJnF1b3Q7Y29kZSZxdW90OzogMjAwLAogICAgJnF1b3Q7bXNnJnF1b3Q7OiAmcXVvdDtPSyZxdW90OywKICAgICZxdW90O2RhdGEmcXVvdDs6IFsKICAgICAgICB7CiAgICAgICAgICAgICZxdW90O25hbWUmcXVvdDs6ICZxdW90O+WSjOeUsOWkp+aeoyZxdW90OywKICAgICAgICAgICAgJnF1b3Q7Y2F0ZWdvcnkmcXVvdDs6ICZxdW90OzEmcXVvdDssCiAgICAgICAgICAgICZxdW90O21hcmtldF9wcmljZSZxdW90OzogJnF1b3Q7ODkuMDAmcXVvdDssCiAgICAgICAgICAgICZxdW90O3ByaWNlJnF1b3Q7OiAmcXVvdDs3OS4wMCZxdW90OwogICAgICAgIH0KICAgIF0sCiAgICAmcXVvdDtjb3VudCZxdW90OzogMywKICAgICZxdW90O25leHQmcXVvdDs6ICZxdW90OzxhIGhyZWY9Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcHA4L2dvb2RzX2FsbC8/cGFnZT0yIiByZWw9Im5vZm9sbG93Ij5odHRwOi8vbG9jYWxob3N0OjgwMDAvYXBwOC9nb29kc19hbGwvP3BhZ2U9MjwvYT4mcXVvdDssCiAgICAmcXVvdDtwcmV2aW91cyZxdW90OzogbnVsbAp9PC9wcmU+CiAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgIDwvZGl2PgoKICAgICAgICAgICAgCiAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJ0YWJiYWJsZSI+CiAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgIDx1bCBjbGFzcz0ibmF2IG5hdi10YWJzIGZvcm0tc3dpdGNoZXIiPgogICAgICAgICAgICAgICAgICAgICAgPGxpPgogICAgICAgICAgICAgICAgICAgICAgICA8YSBuYW1lPSdodG1sLXRhYicgaHJlZj0iI3Bvc3Qtb2JqZWN0LWZvcm0iIGRhdGEtdG9nZ2xlPSJ0YWIiPkhUTUwgZm9ybTwvYT4KICAgICAgICAgICAgICAgICAgICAgIDwvbGk+CiAgICAgICAgICAgICAgICAgICAgICA8bGk+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhIG5hbWU9J3Jhdy10YWInIGhyZWY9IiNwb3N0LWdlbmVyaWMtY29udGVudC1mb3JtIiBkYXRhLXRvZ2dsZT0idGFiIj5SYXcgZGF0YTwvYT4KICAgICAgICAgICAgICAgICAgICAgIDwvbGk+CiAgICAgICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgICAgICAgCgogICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJ3ZWxsIHRhYi1jb250ZW50Ij4KICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9InRhYi1wYW5lIiBpZD0icG9zdC1vYmplY3QtZm9ybSI+CiAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgIDxmb3JtIGFjdGlvbj0iL2FwcDgvZ29vZHNfYWxsLyIgbWV0aG9kPSJQT1NUIiBlbmN0eXBlPSJtdWx0aXBhcnQvZm9ybS1kYXRhIiBjbGFzcz0iZm9ybS1ob3Jpem9udGFsIiBub3ZhbGlkYXRlPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGZpZWxkc2V0PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJjc3JmbWlkZGxld2FyZXRva2VuIiB2YWx1ZT0iQmlvVVhLU2VwYmR1UUllTVpJdU5MUTJRaGpzdzJtVXNmdEdXczRaTU1kSFJCUVFxUExwV2FRaUZwSHN3TjNZdCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoKICAKICAgIDxkaXYgY2xhc3M9ImZvcm0tZ3JvdXAgIj4KICAKICAgIDxsYWJlbCBjbGFzcz0iY29sLXNtLTIgY29udHJvbC1sYWJlbCAiPgogICAgICBOYW1lCiAgICA8L2xhYmVsPgogIAoKICA8ZGl2IGNsYXNzPSJjb2wtc20tMTAiPgogICAgPGlucHV0IG5hbWU9Im5hbWUiIGNsYXNzPSJmb3JtLWNvbnRyb2wiIHR5cGU9InRleHQiICB2YWx1ZT0iIiA+CgogICAgCgogICAgCiAgPC9kaXY+CjwvZGl2PgoKICAKCiAgCiAgICA8ZGl2IGNsYXNzPSJmb3JtLWdyb3VwICI+CiAgCiAgICA8bGFiZWwgY2xhc3M9ImNvbC1zbS0yIGNvbnRyb2wtbGFiZWwgIj4KICAgICAgQ2F0ZWdvcnkKICAgIDwvbGFiZWw+CiAgCgogIDxkaXYgY2xhc3M9ImNvbC1zbS0xMCI+CiAgICA8aW5wdXQgbmFtZT0iY2F0ZWdvcnkiIGNsYXNzPSJmb3JtLWNvbnRyb2wiIHR5cGU9InRleHQiICB2YWx1ZT0iIiA+CgogICAgCgogICAgCiAgPC9kaXY+CjwvZGl2PgoKICAKCiAgCiAgICA8ZGl2IGNsYXNzPSJmb3JtLWdyb3VwICI+CiAgCiAgICA8bGFiZWwgY2xhc3M9ImNvbC1zbS0yIGNvbnRyb2wtbGFiZWwgIj4KICAgICAgTWFya2V0IHByaWNlCiAgICA8L2xhYmVsPgogIAoKICA8ZGl2IGNsYXNzPSJjb2wtc20tMTAiPgogICAgPGlucHV0IG5hbWU9Im1hcmtldF9wcmljZSIgY2xhc3M9ImZvcm0tY29udHJvbCIgdHlwZT0idGV4dCIgIHZhbHVlPSIiID4KCiAgICAKCiAgICAKICA8L2Rpdj4KPC9kaXY+CgogIAoKICAKICAgIDxkaXYgY2xhc3M9ImZvcm0tZ3JvdXAgIj4KICAKICAgIDxsYWJlbCBjbGFzcz0iY29sLXNtLTIgY29udHJvbC1sYWJlbCAiPgogICAgICBQcmljZQogICAgPC9sYWJlbD4KICAKCiAgPGRpdiBjbGFzcz0iY29sLXNtLTEwIj4KICAgIDxpbnB1dCBuYW1lPSJwcmljZSIgY2xhc3M9ImZvcm0tY29udHJvbCIgdHlwZT0idGV4dCIgIHZhbHVlPSIiID4KCiAgICAKCiAgICAKICA8L2Rpdj4KPC9kaXY+CgogIAoKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9ImZvcm0tYWN0aW9ucyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGJ1dHRvbiBjbGFzcz0iYnRuIGJ0bi1wcmltYXJ5IGpzLXRvb2x0aXAiIHRpdGxlPSJNYWtlIGEgUE9TVCByZXF1ZXN0IG9uIHRoZSBHb29kcyBMaXN0IHJlc291cmNlIj5QT1NUPC9idXR0b24+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9maWVsZHNldD4KICAgICAgICAgICAgICAgICAgICAgICAgICA8L2Zvcm0+CiAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgICAgICAgCgogICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9InRhYi1wYW5lIiBpZD0icG9zdC1nZW5lcmljLWNvbnRlbnQtZm9ybSI+CiAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgPGZvcm0gYWN0aW9uPSIvYXBwOC9nb29kc19hbGwvIiBtZXRob2Q9IlBPU1QiIGNsYXNzPSJmb3JtLWhvcml6b250YWwiPgogICAgICAgICAgICAgICAgICAgICAgICAgIDxmaWVsZHNldD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoKCiAgPGRpdiBjbGFzcz0iZm9ybS1ncm91cCI+CiAgICA8bGFiZWwgZm9yPSJpZF9fY29udGVudF90eXBlIiBjbGFzcz0iY29sLXNtLTIgY29udHJvbC1sYWJlbCI+TWVkaWEgdHlwZTo8L2xhYmVsPgogICAgPGRpdiBjbGFzcz0iY29sLXNtLTEwIj4KICAgICAgPHNlbGVjdCBuYW1lPSJfY29udGVudF90eXBlIiBkYXRhLW92ZXJyaWRlPSJjb250ZW50LXR5cGUiIGlkPSJpZF9fY29udGVudF90eXBlIiBjbGFzcz0iZm9ybS1jb250cm9sIj4KICA8b3B0aW9uIHZhbHVlPSJhcHBsaWNhdGlvbi9qc29uIiBzZWxlY3RlZD5hcHBsaWNhdGlvbi9qc29uPC9vcHRpb24+CgogIDxvcHRpb24gdmFsdWU9ImFwcGxpY2F0aW9uL3gtd3d3LWZvcm0tdXJsZW5jb2RlZCI+YXBwbGljYXRpb24veC13d3ctZm9ybS11cmxlbmNvZGVkPC9vcHRpb24+CgogIDxvcHRpb24gdmFsdWU9Im11bHRpcGFydC9mb3JtLWRhdGEiPm11bHRpcGFydC9mb3JtLWRhdGE8L29wdGlvbj4KCjwvc2VsZWN0PgogICAgICA8c3BhbiBjbGFzcz0iaGVscC1ibG9jayI+PC9zcGFuPgogICAgPC9kaXY+CiAgPC9kaXY+CgogIDxkaXYgY2xhc3M9ImZvcm0tZ3JvdXAiPgogICAgPGxhYmVsIGZvcj0iaWRfX2NvbnRlbnQiIGNsYXNzPSJjb2wtc20tMiBjb250cm9sLWxhYmVsIj5Db250ZW50OjwvbGFiZWw+CiAgICA8ZGl2IGNsYXNzPSJjb2wtc20tMTAiPgogICAgICA8dGV4dGFyZWEgbmFtZT0iX2NvbnRlbnQiIGNvbHM9IjQwIiByb3dzPSIxMCIgZGF0YS1vdmVycmlkZT0iY29udGVudCIgaWQ9ImlkX19jb250ZW50IiBjbGFzcz0iZm9ybS1jb250cm9sIj4KewogICAgJnF1b3Q7bmFtZSZxdW90OzogJnF1b3Q7JnF1b3Q7LAogICAgJnF1b3Q7Y2F0ZWdvcnkmcXVvdDs6ICZxdW90OyZxdW90OywKICAgICZxdW90O21hcmtldF9wcmljZSZxdW90OzogbnVsbCwKICAgICZxdW90O3ByaWNlJnF1b3Q7OiBudWxsCn08L3RleHRhcmVhPgogICAgICA8c3BhbiBjbGFzcz0iaGVscC1ibG9jayI+PC9zcGFuPgogICAgPC9kaXY+CiAgPC9kaXY+CgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9ImZvcm0tYWN0aW9ucyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9ImJ0biBidG4tcHJpbWFyeSBqcy10b29sdGlwIiB0aXRsZT0iTWFrZSBhIFBPU1QgcmVxdWVzdCBvbiB0aGUgR29vZHMgTGlzdCByZXNvdXJjZSI+UE9TVDwvYnV0dG9uPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPC9maWVsZHNldD4KICAgICAgICAgICAgICAgICAgICAgICAgPC9mb3JtPgogICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgCgogICAgICAgICAgICAgIAogICAgICAgICAgICAKICAgICAgICAgIAogICAgICAgIDwvZGl2PjwhLS0gLy5jb250ZW50IC0tPgogICAgICA8L2Rpdj48IS0tIC8uY29udGFpbmVyIC0tPgogICAgPC9kaXY+PCEtLSAuL3dyYXBwZXIgLS0+CgogICAgCgogICAgCiAgICAgIDxzY3JpcHQ+CiAgICAgICAgd2luZG93LmRyZiA9IHsKICAgICAgICAgIGNzcmZIZWFkZXJOYW1lOiAiWC1DU1JGVE9LRU4iLAogICAgICAgICAgY3NyZlRva2VuOiAiQmlvVVhLU2VwYmR1UUllTVpJdU5MUTJRaGpzdzJtVXNmdEdXczRaTU1kSFJCUVFxUExwV2FRaUZwSHN3TjNZdCIKICAgICAgICB9OwogICAgICA8L3NjcmlwdD4KICAgICAgPHNjcmlwdCBzcmM9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvanMvanF1ZXJ5LTMuNS4xLm1pbi5qcyI+PC9zY3JpcHQ+CiAgICAgIDxzY3JpcHQgc3JjPSIvc3RhdGljL3Jlc3RfZnJhbWV3b3JrL2pzL2FqYXgtZm9ybS5qcyI+PC9zY3JpcHQ+CiAgICAgIDxzY3JpcHQgc3JjPSIvc3RhdGljL3Jlc3RfZnJhbWV3b3JrL2pzL2NzcmYuanMiPjwvc2NyaXB0PgogICAgICA8c2NyaXB0IHNyYz0iL3N0YXRpYy9yZXN0X2ZyYW1ld29yay9qcy9ib290c3RyYXAubWluLmpzIj48L3NjcmlwdD4KICAgICAgPHNjcmlwdCBzcmM9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvanMvcHJldHRpZnktbWluLmpzIj48L3NjcmlwdD4KICAgICAgPHNjcmlwdCBzcmM9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvanMvZGVmYXVsdC5qcyI+PC9zY3JpcHQ+CiAgICAgIDxzY3JpcHQ+CiAgICAgICAgJChkb2N1bWVudCkucmVhZHkoZnVuY3Rpb24oKSB7CiAgICAgICAgICAkKCdmb3JtJykuYWpheEZvcm0oKTsKICAgICAgICB9KTsKICAgICAgPC9zY3JpcHQ+CiAgICAKCiAgPC9ib2R5PgogIAo8L2h0bWw+CpRLyH2UKIwMY29udGVudC10eXBllIwMQ29udGVudC1UeXBllIwYdGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04lIaUjAR2YXJ5lIwEVmFyeZSMBkFjY2VwdJSGlIwFYWxsb3eUjAVBbGxvd5SMGEdFVCwgUE9TVCwgSEVBRCwgT1BUSU9OU5SGlHWHlC4=', '2024-10-02 18:34:54.000000');
INSERT INTO `my_cache_table` VALUES (':1:287e50914081a2c35cd23fb2c91e5026', 'gAWV2ygAAAAAAABCPigAAAoKCgo8IURPQ1RZUEUgaHRtbD4KPGh0bWw+CiAgPGhlYWQ+CiAgICAKCiAgICAgIAogICAgICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ii8+CiAgICAgICAgPG1ldGEgbmFtZT0icm9ib3RzIiBjb250ZW50PSJOT05FLE5PQVJDSElWRSIgLz4KICAgICAgCgogICAgICA8dGl0bGU+R29vZHMg4oCTIERqYW5nbyBSRVNUIGZyYW1ld29yazwvdGl0bGU+CgogICAgICAKICAgICAgICAKICAgICAgICAgIDxsaW5rIHJlbD0ic3R5bGVzaGVldCIgdHlwZT0idGV4dC9jc3MiIGhyZWY9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvY3NzL2Jvb3RzdHJhcC5taW4uY3NzIi8+CiAgICAgICAgICA8bGluayByZWw9InN0eWxlc2hlZXQiIHR5cGU9InRleHQvY3NzIiBocmVmPSIvc3RhdGljL3Jlc3RfZnJhbWV3b3JrL2Nzcy9ib290c3RyYXAtdHdlYWtzLmNzcyIvPgogICAgICAgIAoKICAgICAgICA8bGluayByZWw9InN0eWxlc2hlZXQiIHR5cGU9InRleHQvY3NzIiBocmVmPSIvc3RhdGljL3Jlc3RfZnJhbWV3b3JrL2Nzcy9wcmV0dGlmeS5jc3MiLz4KICAgICAgICA8bGluayByZWw9InN0eWxlc2hlZXQiIHR5cGU9InRleHQvY3NzIiBocmVmPSIvc3RhdGljL3Jlc3RfZnJhbWV3b3JrL2Nzcy9kZWZhdWx0LmNzcyIvPgogICAgICAgIAogICAgICAKCiAgICAKICA8L2hlYWQ+CgogIAogIDxib2R5IGNsYXNzPSIiPgoKICAgIDxkaXYgY2xhc3M9IndyYXBwZXIiPgogICAgICAKICAgICAgICA8ZGl2IGNsYXNzPSJuYXZiYXIgbmF2YmFyLXN0YXRpYy10b3AgbmF2YmFyLWludmVyc2UiCiAgICAgICAgICAgICByb2xlPSJuYXZpZ2F0aW9uIiBhcmlhLWxhYmVsPSJuYXZiYXIiPgogICAgICAgICAgPGRpdiBjbGFzcz0iY29udGFpbmVyIj4KICAgICAgICAgICAgPHNwYW4+CiAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICA8YSBjbGFzcz0nbmF2YmFyLWJyYW5kJyByZWw9Im5vZm9sbG93IiBocmVmPSdodHRwczovL3d3dy5kamFuZ28tcmVzdC1mcmFtZXdvcmsub3JnLyc+CiAgICAgICAgICAgICAgICAgICAgRGphbmdvIFJFU1QgZnJhbWV3b3JrCiAgICAgICAgICAgICAgICA8L2E+CiAgICAgICAgICAgICAgCiAgICAgICAgICAgIDwvc3Bhbj4KICAgICAgICAgICAgPHVsIGNsYXNzPSJuYXYgbmF2YmFyLW5hdiBwdWxsLXJpZ2h0Ij4KICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgIAogICAgICAgICAgICA8L3VsPgogICAgICAgICAgPC9kaXY+CiAgICAgICAgPC9kaXY+CiAgICAgIAoKICAgICAgPGRpdiBjbGFzcz0iY29udGFpbmVyIj4KICAgICAgICAKICAgICAgICAgIDx1bCBjbGFzcz0iYnJlYWRjcnVtYiI+CiAgICAgICAgICAgIAogICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9Ii9hcHA4LyI+QXBpIFJvb3Q8L2E+PC9saT4KICAgICAgICAgICAgICAKICAgICAgICAgICAgCiAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICA8bGkgY2xhc3M9ImFjdGl2ZSI+PGEgaHJlZj0iL2FwcDgvZ29vZHMyLyI+R29vZHM8L2E+PC9saT4KICAgICAgICAgICAgICAKICAgICAgICAgICAgCiAgICAgICAgICA8L3VsPgogICAgICAgIAoKICAgICAgICA8IS0tIENvbnRlbnQgLS0+CiAgICAgICAgPGRpdiBpZD0iY29udGVudCIgcm9sZT0ibWFpbiIgYXJpYS1sYWJlbD0iY29udGVudCI+CiAgICAgICAgICAKCiAgICAgICAgICA8ZGl2IGNsYXNzPSJyZWdpb24iICBhcmlhLWxhYmVsPSJyZXF1ZXN0IGZvcm0iPgogICAgICAgICAgCgogICAgICAgICAgCiAgICAgICAgICAgIDxmb3JtIGlkPSJnZXQtZm9ybSIgY2xhc3M9InB1bGwtcmlnaHQiPgogICAgICAgICAgICAgIDxmaWVsZHNldD4KICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJidG4tZ3JvdXAgZm9ybWF0LXNlbGVjdGlvbiI+CiAgICAgICAgICAgICAgICAgICAgPGEgY2xhc3M9ImJ0biBidG4tcHJpbWFyeSBqcy10b29sdGlwIiBocmVmPSIvYXBwOC9nb29kczIvIiByZWw9Im5vZm9sbG93IiB0aXRsZT0iTWFrZSBhIEdFVCByZXF1ZXN0IG9uIHRoZSBHb29kcyByZXNvdXJjZSI+R0VUPC9hPgoKICAgICAgICAgICAgICAgICAgICA8YnV0dG9uIGNsYXNzPSJidG4gYnRuLXByaW1hcnkgZHJvcGRvd24tdG9nZ2xlIGpzLXRvb2x0aXAiIGRhdGEtdG9nZ2xlPSJkcm9wZG93biIgdGl0bGU9IlNwZWNpZnkgYSBmb3JtYXQgZm9yIHRoZSBHRVQgcmVxdWVzdCI+CiAgICAgICAgICAgICAgICAgICAgICA8c3BhbiBjbGFzcz0iY2FyZXQiPjwvc3Bhbj4KICAgICAgICAgICAgICAgICAgICA8L2J1dHRvbj4KICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImRyb3Bkb3duLW1lbnUiPgogICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgIDxsaT4KICAgICAgICAgICAgICAgICAgICAgICAgICA8YSBjbGFzcz0ianMtdG9vbHRpcCBmb3JtYXQtb3B0aW9uIiBocmVmPSIvYXBwOC9nb29kczIvP2Zvcm1hdD1qc29uIiByZWw9Im5vZm9sbG93IiB0aXRsZT0iTWFrZSBhIEdFVCByZXF1ZXN0IG9uIHRoZSBHb29kcyByZXNvdXJjZSB3aXRoIHRoZSBmb3JtYXQgc2V0IHRvIGBqc29uYCI+anNvbjwvYT4KICAgICAgICAgICAgICAgICAgICAgICAgPC9saT4KICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICA8bGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPGEgY2xhc3M9ImpzLXRvb2x0aXAgZm9ybWF0LW9wdGlvbiIgaHJlZj0iL2FwcDgvZ29vZHMyLz9mb3JtYXQ9YXBpIiByZWw9Im5vZm9sbG93IiB0aXRsZT0iTWFrZSBhIEdFVCByZXF1ZXN0IG9uIHRoZSBHb29kcyByZXNvdXJjZSB3aXRoIHRoZSBmb3JtYXQgc2V0IHRvIGBhcGlgIj5hcGk8L2E+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICA8L3VsPgogICAgICAgICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgIDwvZmllbGRzZXQ+CiAgICAgICAgICAgIDwvZm9ybT4KICAgICAgICAgIAoKICAgICAgICAgIAogICAgICAgICAgICA8Zm9ybSBjbGFzcz0iYnV0dG9uLWZvcm0iIGFjdGlvbj0iL2FwcDgvZ29vZHMyLyIgZGF0YS1tZXRob2Q9Ik9QVElPTlMiPgogICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9ImJ0biBidG4tcHJpbWFyeSBqcy10b29sdGlwIiB0aXRsZT0iTWFrZSBhbiBPUFRJT05TIHJlcXVlc3Qgb24gdGhlIEdvb2RzIHJlc291cmNlIj5PUFRJT05TPC9idXR0b24+CiAgICAgICAgICAgIDwvZm9ybT4KICAgICAgICAgIAoKICAgICAgICAgIAogICAgICAgICAgICA8YnV0dG9uIGNsYXNzPSJidG4gYnRuLWRhbmdlciBidXR0b24tZm9ybSBqcy10b29sdGlwIiB0aXRsZT0iTWFrZSBhIERFTEVURSByZXF1ZXN0IG9uIHRoZSBHb29kcyByZXNvdXJjZSIgZGF0YS10b2dnbGU9Im1vZGFsIiBkYXRhLXRhcmdldD0iI2RlbGV0ZU1vZGFsIj5ERUxFVEU8L2J1dHRvbj4KCiAgICAgICAgICAgIDwhLS0gRGVsZXRlIE1vZGFsIC0tPgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJtb2RhbCBmYWRlIiBpZD0iZGVsZXRlTW9kYWwiIHRhYmluZGV4PSItMSIgcm9sZT0iZGlhbG9nIiBhcmlhLWxhYmVsbGVkYnk9Im15TW9kYWxMYWJlbCIgYXJpYS1oaWRkZW49InRydWUiPgogICAgICAgICAgICAgIDxkaXYgY2xhc3M9Im1vZGFsLWRpYWxvZyI+CiAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJtb2RhbC1jb250ZW50Ij4KICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibW9kYWwtYm9keSI+CiAgICAgICAgICAgICAgICAgICAgPGg0IGNsYXNzPSJ0ZXh0LWNlbnRlciI+QXJlIHlvdSBzdXJlIHlvdSB3YW50IHRvIGRlbGV0ZSB0aGlzIEdvb2RzPzwvaDQ+CiAgICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJtb2RhbC1mb290ZXIiPgogICAgICAgICAgICAgICAgICAgIDxidXR0b24gdHlwZT0iYnV0dG9uIiBjbGFzcz0iYnRuIGJ0bi1kZWZhdWx0IiBkYXRhLWRpc21pc3M9Im1vZGFsIj5DYW5jZWw8L2J1dHRvbj4KICAgICAgICAgICAgICAgICAgICA8Zm9ybSBjbGFzcz0iYnV0dG9uLWZvcm0iIGFjdGlvbj0iL2FwcDgvZ29vZHMyLyIgZGF0YS1tZXRob2Q9IkRFTEVURSI+CiAgICAgICAgICAgICAgICAgICAgICA8YnV0dG9uIGNsYXNzPSJidG4gYnRuLWRhbmdlciI+RGVsZXRlPC9idXR0b24+CiAgICAgICAgICAgICAgICAgICAgPC9mb3JtPgogICAgICAgICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgIAoKICAgICAgICAgIAoKICAgICAgICAgIAoKICAgICAgICAgIAogICAgICAgICAgPC9kaXY+CgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJjb250ZW50LW1haW4iIHJvbGU9Im1haW4iICBhcmlhLWxhYmVsPSJtYWluIGNvbnRlbnQiPgogICAgICAgICAgICAgIDxkaXYgY2xhc3M9InBhZ2UtaGVhZGVyIj4KICAgICAgICAgICAgICAgIDxoMT5Hb29kczwvaDE+CiAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgPGRpdiBzdHlsZT0iZmxvYXQ6bGVmdCI+CiAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgPHA+PC9wPgogICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgPC9kaXY+CgogICAgICAgICAgICAgIAoKICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJyZXF1ZXN0LWluZm8iIHN0eWxlPSJjbGVhcjogYm90aCIgYXJpYS1sYWJlbD0icmVxdWVzdCBpbmZvIj4KICAgICAgICAgICAgICAgIDxwcmUgY2xhc3M9InByZXR0eXByaW50Ij48Yj5HRVQ8L2I+IC9hcHA4L2dvb2RzMi88L3ByZT4KICAgICAgICAgICAgICA8L2Rpdj4KCiAgICAgICAgICAgICAgPGRpdiBjbGFzcz0icmVzcG9uc2UtaW5mbyIgYXJpYS1sYWJlbD0icmVzcG9uc2UgaW5mbyI+CiAgICAgICAgICAgICAgICA8cHJlIGNsYXNzPSJwcmV0dHlwcmludCI+PHNwYW4gY2xhc3M9Im1ldGEgbm9jb2RlIj48Yj5IVFRQIDIwMCBPSzwvYj4KPGI+QWxsb3c6PC9iPiA8c3BhbiBjbGFzcz0ibGl0Ij5HRVQsIFBPU1QsIFBVVCwgREVMRVRFLCBIRUFELCBPUFRJT05TPC9zcGFuPgo8Yj5Db250ZW50LVR5cGU6PC9iPiA8c3BhbiBjbGFzcz0ibGl0Ij5hcHBsaWNhdGlvbi9qc29uPC9zcGFuPgo8Yj5WYXJ5OjwvYj4gPHNwYW4gY2xhc3M9ImxpdCI+QWNjZXB0PC9zcGFuPgoKPC9zcGFuPlsKICAgIHsKICAgICAgICAmcXVvdDtuYW1lJnF1b3Q7OiAmcXVvdDvlkoznlLDlpKfmnqMmcXVvdDssCiAgICAgICAgJnF1b3Q7Y2F0ZWdvcnkmcXVvdDs6ICZxdW90OzEmcXVvdDssCiAgICAgICAgJnF1b3Q7bWFya2V0X3ByaWNlJnF1b3Q7OiAmcXVvdDs4OS4wMCZxdW90OywKICAgICAgICAmcXVvdDtwcmljZSZxdW90OzogJnF1b3Q7NzkuMDAmcXVvdDsKICAgIH0sCiAgICB7CiAgICAgICAgJnF1b3Q7bmFtZSZxdW90OzogJnF1b3Q75paw55aG5aSn5p6j77yIcHV0IOabtOaWsO+8iSZxdW90OywKICAgICAgICAmcXVvdDtjYXRlZ29yeSZxdW90OzogJnF1b3Q7MSZxdW90OywKICAgICAgICAmcXVvdDttYXJrZXRfcHJpY2UmcXVvdDs6ICZxdW90OzU5LjAwJnF1b3Q7LAogICAgICAgICZxdW90O3ByaWNlJnF1b3Q7OiAmcXVvdDs0OS4wMCZxdW90OwogICAgfSwKICAgIHsKICAgICAgICAmcXVvdDtuYW1lJnF1b3Q7OiAmcXVvdDvlm5vlt53lpKfmnqMmcXVvdDssCiAgICAgICAgJnF1b3Q7Y2F0ZWdvcnkmcXVvdDs6ICZxdW90OzEmcXVvdDssCiAgICAgICAgJnF1b3Q7bWFya2V0X3ByaWNlJnF1b3Q7OiAmcXVvdDsxOTkuMDAmcXVvdDssCiAgICAgICAgJnF1b3Q7cHJpY2UmcXVvdDs6ICZxdW90OzE4OS4wMCZxdW90OwogICAgfQpdPC9wcmU+CiAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgIDwvZGl2PgoKICAgICAgICAgICAgCiAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICA8ZGl2ID4KICAgICAgICAgICAgICAgICAgCgogICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJ3ZWxsIHRhYi1jb250ZW50Ij4KICAgICAgICAgICAgICAgICAgICAKCiAgICAgICAgICAgICAgICAgICAgPGRpdiAgaWQ9InBvc3QtZ2VuZXJpYy1jb250ZW50LWZvcm0iPgogICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgIDxmb3JtIGFjdGlvbj0iL2FwcDgvZ29vZHMyLyIgbWV0aG9kPSJQT1NUIiBjbGFzcz0iZm9ybS1ob3Jpem9udGFsIj4KICAgICAgICAgICAgICAgICAgICAgICAgICA8ZmllbGRzZXQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAKCgogIDxkaXYgY2xhc3M9ImZvcm0tZ3JvdXAiPgogICAgPGxhYmVsIGZvcj0iaWRfX2NvbnRlbnRfdHlwZSIgY2xhc3M9ImNvbC1zbS0yIGNvbnRyb2wtbGFiZWwiPk1lZGlhIHR5cGU6PC9sYWJlbD4KICAgIDxkaXYgY2xhc3M9ImNvbC1zbS0xMCI+CiAgICAgIDxzZWxlY3QgbmFtZT0iX2NvbnRlbnRfdHlwZSIgZGF0YS1vdmVycmlkZT0iY29udGVudC10eXBlIiBpZD0iaWRfX2NvbnRlbnRfdHlwZSIgY2xhc3M9ImZvcm0tY29udHJvbCI+CiAgPG9wdGlvbiB2YWx1ZT0iYXBwbGljYXRpb24vanNvbiIgc2VsZWN0ZWQ+YXBwbGljYXRpb24vanNvbjwvb3B0aW9uPgoKICA8b3B0aW9uIHZhbHVlPSJhcHBsaWNhdGlvbi94LXd3dy1mb3JtLXVybGVuY29kZWQiPmFwcGxpY2F0aW9uL3gtd3d3LWZvcm0tdXJsZW5jb2RlZDwvb3B0aW9uPgoKICA8b3B0aW9uIHZhbHVlPSJtdWx0aXBhcnQvZm9ybS1kYXRhIj5tdWx0aXBhcnQvZm9ybS1kYXRhPC9vcHRpb24+Cgo8L3NlbGVjdD4KICAgICAgPHNwYW4gY2xhc3M9ImhlbHAtYmxvY2siPjwvc3Bhbj4KICAgIDwvZGl2PgogIDwvZGl2PgoKICA8ZGl2IGNsYXNzPSJmb3JtLWdyb3VwIj4KICAgIDxsYWJlbCBmb3I9ImlkX19jb250ZW50IiBjbGFzcz0iY29sLXNtLTIgY29udHJvbC1sYWJlbCI+Q29udGVudDo8L2xhYmVsPgogICAgPGRpdiBjbGFzcz0iY29sLXNtLTEwIj4KICAgICAgPHRleHRhcmVhIG5hbWU9Il9jb250ZW50IiBjb2xzPSI0MCIgcm93cz0iMTAiIGRhdGEtb3ZlcnJpZGU9ImNvbnRlbnQiIGlkPSJpZF9fY29udGVudCIgY2xhc3M9ImZvcm0tY29udHJvbCI+CjwvdGV4dGFyZWE+CiAgICAgIDxzcGFuIGNsYXNzPSJoZWxwLWJsb2NrIj48L3NwYW4+CiAgICA8L2Rpdj4KICA8L2Rpdj4KCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0iZm9ybS1hY3Rpb25zIj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGJ1dHRvbiBjbGFzcz0iYnRuIGJ0bi1wcmltYXJ5IGpzLXRvb2x0aXAiIHRpdGxlPSJNYWtlIGEgUE9TVCByZXF1ZXN0IG9uIHRoZSBHb29kcyByZXNvdXJjZSI+UE9TVDwvYnV0dG9uPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPC9maWVsZHNldD4KICAgICAgICAgICAgICAgICAgICAgICAgPC9mb3JtPgogICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgCgogICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgPGRpdiA+CiAgICAgICAgICAgICAgICAgIAoKICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0id2VsbCB0YWItY29udGVudCI+CiAgICAgICAgICAgICAgICAgICAgCgogICAgICAgICAgICAgICAgICAgIDxkaXYgIGlkPSJwdXQtZ2VuZXJpYy1jb250ZW50LWZvcm0iPgogICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgIDxmb3JtIGFjdGlvbj0iL2FwcDgvZ29vZHMyLyIgZGF0YS1tZXRob2Q9IlBVVCIgY2xhc3M9ImZvcm0taG9yaXpvbnRhbCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPGZpZWxkc2V0PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgCgoKICA8ZGl2IGNsYXNzPSJmb3JtLWdyb3VwIj4KICAgIDxsYWJlbCBmb3I9ImlkX19jb250ZW50X3R5cGUiIGNsYXNzPSJjb2wtc20tMiBjb250cm9sLWxhYmVsIj5NZWRpYSB0eXBlOjwvbGFiZWw+CiAgICA8ZGl2IGNsYXNzPSJjb2wtc20tMTAiPgogICAgICA8c2VsZWN0IG5hbWU9Il9jb250ZW50X3R5cGUiIGRhdGEtb3ZlcnJpZGU9ImNvbnRlbnQtdHlwZSIgaWQ9ImlkX19jb250ZW50X3R5cGUiIGNsYXNzPSJmb3JtLWNvbnRyb2wiPgogIDxvcHRpb24gdmFsdWU9ImFwcGxpY2F0aW9uL2pzb24iIHNlbGVjdGVkPmFwcGxpY2F0aW9uL2pzb248L29wdGlvbj4KCiAgPG9wdGlvbiB2YWx1ZT0iYXBwbGljYXRpb24veC13d3ctZm9ybS11cmxlbmNvZGVkIj5hcHBsaWNhdGlvbi94LXd3dy1mb3JtLXVybGVuY29kZWQ8L29wdGlvbj4KCiAgPG9wdGlvbiB2YWx1ZT0ibXVsdGlwYXJ0L2Zvcm0tZGF0YSI+bXVsdGlwYXJ0L2Zvcm0tZGF0YTwvb3B0aW9uPgoKPC9zZWxlY3Q+CiAgICAgIDxzcGFuIGNsYXNzPSJoZWxwLWJsb2NrIj48L3NwYW4+CiAgICA8L2Rpdj4KICA8L2Rpdj4KCiAgPGRpdiBjbGFzcz0iZm9ybS1ncm91cCI+CiAgICA8bGFiZWwgZm9yPSJpZF9fY29udGVudCIgY2xhc3M9ImNvbC1zbS0yIGNvbnRyb2wtbGFiZWwiPkNvbnRlbnQ6PC9sYWJlbD4KICAgIDxkaXYgY2xhc3M9ImNvbC1zbS0xMCI+CiAgICAgIDx0ZXh0YXJlYSBuYW1lPSJfY29udGVudCIgY29scz0iNDAiIHJvd3M9IjEwIiBkYXRhLW92ZXJyaWRlPSJjb250ZW50IiBpZD0iaWRfX2NvbnRlbnQiIGNsYXNzPSJmb3JtLWNvbnRyb2wiPgo8L3RleHRhcmVhPgogICAgICA8c3BhbiBjbGFzcz0iaGVscC1ibG9jayI+PC9zcGFuPgogICAgPC9kaXY+CiAgPC9kaXY+CgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9ImZvcm0tYWN0aW9ucyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9ImJ0biBidG4tcHJpbWFyeSBqcy10b29sdGlwIiB0aXRsZT0iTWFrZSBhIFBVVCByZXF1ZXN0IG9uIHRoZSBHb29kcyByZXNvdXJjZSI+UFVUPC9idXR0b24+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgICAgICAgICAgICAgIDwvZmllbGRzZXQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvZm9ybT4KICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgIAogICAgICAgICAgICAKICAgICAgICAgIAogICAgICAgIDwvZGl2PjwhLS0gLy5jb250ZW50IC0tPgogICAgICA8L2Rpdj48IS0tIC8uY29udGFpbmVyIC0tPgogICAgPC9kaXY+PCEtLSAuL3dyYXBwZXIgLS0+CgogICAgCgogICAgCiAgICAgIDxzY3JpcHQ+CiAgICAgICAgd2luZG93LmRyZiA9IHsKICAgICAgICAgIGNzcmZIZWFkZXJOYW1lOiAiWC1DU1JGVE9LRU4iLAogICAgICAgICAgY3NyZlRva2VuOiAiVjM0SEVWTjRBWXNNTWZTeGMwQU5aZ2oxVDl6cWFuNWN6ZW1KOWZVQ1gwVzl4bnViMjN2V29nelExeHpxVjQ5ZCIKICAgICAgICB9OwogICAgICA8L3NjcmlwdD4KICAgICAgPHNjcmlwdCBzcmM9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvanMvanF1ZXJ5LTMuNS4xLm1pbi5qcyI+PC9zY3JpcHQ+CiAgICAgIDxzY3JpcHQgc3JjPSIvc3RhdGljL3Jlc3RfZnJhbWV3b3JrL2pzL2FqYXgtZm9ybS5qcyI+PC9zY3JpcHQ+CiAgICAgIDxzY3JpcHQgc3JjPSIvc3RhdGljL3Jlc3RfZnJhbWV3b3JrL2pzL2NzcmYuanMiPjwvc2NyaXB0PgogICAgICA8c2NyaXB0IHNyYz0iL3N0YXRpYy9yZXN0X2ZyYW1ld29yay9qcy9ib290c3RyYXAubWluLmpzIj48L3NjcmlwdD4KICAgICAgPHNjcmlwdCBzcmM9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvanMvcHJldHRpZnktbWluLmpzIj48L3NjcmlwdD4KICAgICAgPHNjcmlwdCBzcmM9Ii9zdGF0aWMvcmVzdF9mcmFtZXdvcmsvanMvZGVmYXVsdC5qcyI+PC9zY3JpcHQ+CiAgICAgIDxzY3JpcHQ+CiAgICAgICAgJChkb2N1bWVudCkucmVhZHkoZnVuY3Rpb24oKSB7CiAgICAgICAgICAkKCdmb3JtJykuYWpheEZvcm0oKTsKICAgICAgICB9KTsKICAgICAgPC9zY3JpcHQ+CiAgICAKCiAgPC9ib2R5PgogIAo8L2h0bWw+CpRLyH2UKIwMY29udGVudC10eXBllIwMQ29udGVudC1UeXBllIwYdGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04lIaUjAR2YXJ5lIwEVmFyeZSMBkFjY2VwdJSGlIwFYWxsb3eUjAVBbGxvd5SMJUdFVCwgUE9TVCwgUFVULCBERUxFVEUsIEhFQUQsIE9QVElPTlOUhpR1h5Qu', '2024-10-02 18:31:27.000000');
INSERT INTO `my_cache_table` VALUES (':1:views.decorators.cache.cache_header..919e629a7c6afa6f6467104d89993e64.zh-hans', 'gAVdlC4=', '2024-10-02 18:14:23.000000');
INSERT INTO `my_cache_table` VALUES (':1:views.decorators.cache.cache_header..b248ff53f3b2d0c0f3458097d477cb6b.zh-hans', 'gAVdlC4=', '2024-10-02 18:10:43.000000');
INSERT INTO `my_cache_table` VALUES (':1:views.decorators.cache.cache_page..GET.919e629a7c6afa6f6467104d89993e64.d41d8cd98f00b204e9800998ecf8427e.zh-hans', 'gAWV2AMAAAAAAACMFGRqYW5nby5odHRwLnJlc3BvbnNllIwMSHR0cFJlc3BvbnNllJOUKYGUfZQojAhfaGVhZGVyc5R9lCiMDGNvbnRlbnQtdHlwZZSMDENvbnRlbnQtVHlwZZSMGHRleHQvaHRtbDsgY2hhcnNldD11dGYtOJSGlIwHZXhwaXJlc5SMB0V4cGlyZXOUjB1XZWQsIDAyIE9jdCAyMDI0IDEwOjE0OjIzIEdNVJSGlIwNY2FjaGUtY29udHJvbJSMDUNhY2hlLUNvbnRyb2yUjAptYXgtYWdlPTYwlIaUdYwRX3Jlc291cmNlX2Nsb3NlcnOUXZSMDl9oYW5kbGVyX2NsYXNzlE6MB2Nvb2tpZXOUjAxodHRwLmNvb2tpZXOUjAxTaW1wbGVDb29raWWUk5QpgZSMBmNsb3NlZJSJjA5fcmVhc29uX3BocmFzZZROjAhfY2hhcnNldJROjApfY29udGFpbmVylF2UQmUCAADmrKLov45Bbm9ueW1vdXNVc2Vy5p2l5Yiw5ZWG5Z+O57O757uf77yBCgo8YSBocmVmPSIvbXl1c2VyX2xvZ291dC8iPueUqOaIt+mAgOWHujwvYT4KPGJyPgrnlKjmiLfkv6Hmga/liJfooagKPHRhYmxlIGJvcmRlcj0xPgogICAgPHRyPgogICAgICAgIDx0ZD7otKblj7c8L3RkPgogICAgICAgIDx0ZD7nlKjmiLflp5PlkI08L3RkPgogICAgICAgIDx0ZD5lbWFpbDwvdGQ+CiAgICAgICAgPHRkPuaTjeS9nDwvdGQ+CiAgICA8L3RyPgogICAgCiAgICAgICAgPHRyPgogICAgICAgICAgICA8dGQ+YWRtaW48L3RkPgogICAgICAgICAgICA8dGQ+PC90ZD4KICAgICAgICAgICAgPHRkPjIyMkAxMTEuY29tPC90ZD4KICAgICAgICAgICAgPHRkPjxhIGhyZWY9Ii9teXVzZXJfZWRpdC8iPuS/ruaUuTwvYT48L3RkPgogICAgICAgICAgICAKICAgICAgICA8L3RyPgogICAgCiAgICAgICAgPHRyPgogICAgICAgICAgICA8dGQ+dGVzdDwvdGQ+CiAgICAgICAgICAgIDx0ZD48L3RkPgogICAgICAgICAgICA8dGQ+PC90ZD4KICAgICAgICAgICAgPHRkPjxhIGhyZWY9Ii9teXVzZXJfZWRpdC8iPuS/ruaUuTwvYT48L3RkPgogICAgICAgICAgICAKICAgICAgICA8L3RyPgogICAgCjwvdGFibGU+lGF1Yi4=', '2024-10-02 18:14:23.000000');
INSERT INTO `my_cache_table` VALUES (':1:views.decorators.cache.cache_page..GET.b248ff53f3b2d0c0f3458097d477cb6b.d41d8cd98f00b204e9800998ecf8427e.zh-hans', 'gAWV2AMAAAAAAACMFGRqYW5nby5odHRwLnJlc3BvbnNllIwMSHR0cFJlc3BvbnNllJOUKYGUfZQojAhfaGVhZGVyc5R9lCiMDGNvbnRlbnQtdHlwZZSMDENvbnRlbnQtVHlwZZSMGHRleHQvaHRtbDsgY2hhcnNldD11dGYtOJSGlIwHZXhwaXJlc5SMB0V4cGlyZXOUjB1XZWQsIDAyIE9jdCAyMDI0IDEwOjEwOjQzIEdNVJSGlIwNY2FjaGUtY29udHJvbJSMDUNhY2hlLUNvbnRyb2yUjAptYXgtYWdlPTYwlIaUdYwRX3Jlc291cmNlX2Nsb3NlcnOUXZSMDl9oYW5kbGVyX2NsYXNzlE6MB2Nvb2tpZXOUjAxodHRwLmNvb2tpZXOUjAxTaW1wbGVDb29raWWUk5QpgZSMBmNsb3NlZJSJjA5fcmVhc29uX3BocmFzZZROjAhfY2hhcnNldJROjApfY29udGFpbmVylF2UQmUCAADmrKLov45Bbm9ueW1vdXNVc2Vy5p2l5Yiw5ZWG5Z+O57O757uf77yBCgo8YSBocmVmPSIvbXl1c2VyX2xvZ291dC8iPueUqOaIt+mAgOWHujwvYT4KPGJyPgrnlKjmiLfkv6Hmga/liJfooagKPHRhYmxlIGJvcmRlcj0xPgogICAgPHRyPgogICAgICAgIDx0ZD7otKblj7c8L3RkPgogICAgICAgIDx0ZD7nlKjmiLflp5PlkI08L3RkPgogICAgICAgIDx0ZD5lbWFpbDwvdGQ+CiAgICAgICAgPHRkPuaTjeS9nDwvdGQ+CiAgICA8L3RyPgogICAgCiAgICAgICAgPHRyPgogICAgICAgICAgICA8dGQ+YWRtaW48L3RkPgogICAgICAgICAgICA8dGQ+PC90ZD4KICAgICAgICAgICAgPHRkPjIyMkAxMTEuY29tPC90ZD4KICAgICAgICAgICAgPHRkPjxhIGhyZWY9Ii9teXVzZXJfZWRpdC8iPuS/ruaUuTwvYT48L3RkPgogICAgICAgICAgICAKICAgICAgICA8L3RyPgogICAgCiAgICAgICAgPHRyPgogICAgICAgICAgICA8dGQ+dGVzdDwvdGQ+CiAgICAgICAgICAgIDx0ZD48L3RkPgogICAgICAgICAgICA8dGQ+PC90ZD4KICAgICAgICAgICAgPHRkPjxhIGhyZWY9Ii9teXVzZXJfZWRpdC8iPuS/ruaUuTwvYT48L3RkPgogICAgICAgICAgICAKICAgICAgICA8L3RyPgogICAgCjwvdGFibGU+lGF1Yi4=', '2024-10-02 18:10:43.000000');

-- ----------------------------
-- Table structure for skillinfo
-- ----------------------------
DROP TABLE IF EXISTS `skillinfo`;
CREATE TABLE `skillinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `skillname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skillinfo
-- ----------------------------

-- ----------------------------
-- Table structure for user_img
-- ----------------------------
DROP TABLE IF EXISTS `user_img`;
CREATE TABLE `user_img`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `headimg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_img
-- ----------------------------

-- ----------------------------
-- Table structure for user_skill
-- ----------------------------
DROP TABLE IF EXISTS `user_skill`;
CREATE TABLE `user_skill`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `skillinfo_id` int NOT NULL,
  `userbaseinfo_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_skill_skillinfo_id_userextrainfo_id_bb402257_uniq`(`skillinfo_id` ASC, `userbaseinfo_id` ASC) USING BTREE,
  INDEX `user_skill_userbaseinfo_id_422825f1_fk_UserBaseInfo4_id`(`userbaseinfo_id` ASC) USING BTREE,
  CONSTRAINT `user_skill_skillinfo_id_c8628996_fk_SkillInfo_id` FOREIGN KEY (`skillinfo_id`) REFERENCES `skillinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_skill_userbaseinfo_id_422825f1_fk_UserBaseInfo4_id` FOREIGN KEY (`userbaseinfo_id`) REFERENCES `userbaseinfo4` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_skill
-- ----------------------------

-- ----------------------------
-- Table structure for userbaseinfo4
-- ----------------------------
DROP TABLE IF EXISTS `userbaseinfo4`;
CREATE TABLE `userbaseinfo4`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userbaseinfo4
-- ----------------------------

-- ----------------------------
-- Table structure for userbaseinfo5
-- ----------------------------
DROP TABLE IF EXISTS `userbaseinfo5`;
CREATE TABLE `userbaseinfo5`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` int NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userbaseinfo5
-- ----------------------------

-- ----------------------------
-- Table structure for userextrainfo4
-- ----------------------------
DROP TABLE IF EXISTS `userextrainfo4`;
CREATE TABLE `userextrainfo4`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `truename` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` int NOT NULL,
  `salary` decimal(8, 2) NOT NULL,
  `age` int NOT NULL,
  `department` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createDate` datetime(6) NOT NULL,
  `memo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `depart_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `UserExtraInfo4_depart_id_5d017fcf_fk_DepartInfo_id`(`depart_id` ASC) USING BTREE,
  CONSTRAINT `UserExtraInfo4_depart_id_5d017fcf_fk_DepartInfo_id` FOREIGN KEY (`depart_id`) REFERENCES `departinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UserExtraInfo4_user_id_76fbb50c_fk_UserBaseInfo4_id` FOREIGN KEY (`user_id`) REFERENCES `userbaseinfo4` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userextrainfo4
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
