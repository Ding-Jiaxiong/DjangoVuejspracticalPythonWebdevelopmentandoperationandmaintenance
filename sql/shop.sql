/*
 Navicat Premium Data Transfer

 Source Server         : 本机MySQL
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 02/10/2024 19:59:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户配送地址', 6, 'add_address');
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户配送地址', 6, 'change_address');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户配送地址', 6, 'delete_address');
INSERT INTO `auth_permission` VALUES (24, 'Can view 用户配送地址', 6, 'view_address');
INSERT INTO `auth_permission` VALUES (25, 'Can add 商品信息', 7, 'add_goods');
INSERT INTO `auth_permission` VALUES (26, 'Can change 商品信息', 7, 'change_goods');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 商品信息', 7, 'delete_goods');
INSERT INTO `auth_permission` VALUES (28, 'Can view 商品信息', 7, 'view_goods');
INSERT INTO `auth_permission` VALUES (29, 'Can add 首页轮播', 8, 'add_slide');
INSERT INTO `auth_permission` VALUES (30, 'Can change 首页轮播', 8, 'change_slide');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 首页轮播', 8, 'delete_slide');
INSERT INTO `auth_permission` VALUES (32, 'Can view 首页轮播', 8, 'view_slide');
INSERT INTO `auth_permission` VALUES (33, 'Can add 商品分类', 9, 'add_goodscategory');
INSERT INTO `auth_permission` VALUES (34, 'Can change 商品分类', 9, 'change_goodscategory');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 商品分类', 9, 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES (36, 'Can view 商品分类', 9, 'view_goodscategory');
INSERT INTO `auth_permission` VALUES (37, 'Can add 购物车', 10, 'add_cart');
INSERT INTO `auth_permission` VALUES (38, 'Can change 购物车', 10, 'change_cart');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 购物车', 10, 'delete_cart');
INSERT INTO `auth_permission` VALUES (40, 'Can view 购物车', 10, 'view_cart');
INSERT INTO `auth_permission` VALUES (41, 'Can add 订单信息', 11, 'add_order');
INSERT INTO `auth_permission` VALUES (42, 'Can change 订单信息', 11, 'change_order');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 订单信息', 11, 'delete_order');
INSERT INTO `auth_permission` VALUES (44, 'Can view 订单信息', 11, 'view_order');
INSERT INTO `auth_permission` VALUES (45, 'Can add 订单商品信息', 12, 'add_ordergoods');
INSERT INTO `auth_permission` VALUES (46, 'Can change 订单商品信息', 12, 'change_ordergoods');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 订单商品信息', 12, 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES (48, 'Can view 订单商品信息', 12, 'view_ordergoods');
INSERT INTO `auth_permission` VALUES (49, 'Can add user', 13, 'add_myuser');
INSERT INTO `auth_permission` VALUES (50, 'Can change user', 13, 'change_myuser');
INSERT INTO `auth_permission` VALUES (51, 'Can delete user', 13, 'delete_myuser');
INSERT INTO `auth_permission` VALUES (52, 'Can view user', 13, 'view_myuser');
INSERT INTO `auth_permission` VALUES (53, '审核用户信息', 13, 'check_myuser');

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token`  (
  `key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------

-- ----------------------------
-- Table structure for d_address
-- ----------------------------
DROP TABLE IF EXISTS `d_address`;
CREATE TABLE `d_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_default` int NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_address_user_id_6adca837_fk`(`user_id` ASC) USING BTREE,
  CONSTRAINT `d_address_user_id_6adca837_fk` FOREIGN KEY (`user_id`) REFERENCES `users_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_address
-- ----------------------------
INSERT INTO `d_address` VALUES (1, '甘肃省', '兰州市', '城关区', '兰州大学', '帅哥', '18799991111', 1, '2024-10-02 16:07:00.000000', 1);

-- ----------------------------
-- Table structure for d_cart
-- ----------------------------
DROP TABLE IF EXISTS `d_cart`;
CREATE TABLE `d_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_num` int NOT NULL,
  `goods_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_cart_goods_id_9008947b_fk`(`goods_id` ASC) USING BTREE,
  INDEX `d_cart_user_id_521359d3_fk`(`user_id` ASC) USING BTREE,
  CONSTRAINT `d_cart_goods_id_9008947b_fk` FOREIGN KEY (`goods_id`) REFERENCES `d_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `d_cart_user_id_521359d3_fk` FOREIGN KEY (`user_id`) REFERENCES `users_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_cart
-- ----------------------------
INSERT INTO `d_cart` VALUES (1, 10, 1, 1);

-- ----------------------------
-- Table structure for d_goods
-- ----------------------------
DROP TABLE IF EXISTS `d_goods`;
CREATE TABLE `d_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `market_price` decimal(8, 2) NOT NULL,
  `price` decimal(8, 2) NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `click_num` int NOT NULL,
  `amount` int NOT NULL,
  `stock_num` int NOT NULL,
  `fav_num` int NOT NULL,
  `goods_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `main_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `createDate` datetime(6) NOT NULL,
  `category_id` int NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_goods_category_id_18894d8a_fk_d_goods_category_id`(`category_id` ASC) USING BTREE,
  INDEX `d_goods_user_id_242127ca_fk`(`user_id` ASC) USING BTREE,
  CONSTRAINT `d_goods_category_id_18894d8a_fk_d_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `d_goods_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `d_goods_user_id_242127ca_fk` FOREIGN KEY (`user_id`) REFERENCES `users_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_goods
-- ----------------------------
INSERT INTO `d_goods` VALUES (1, 'Django开发', 19.99, 9.99, '元', 122, 12, 221, 23, '商品描述', 1, '/', 1, '2024-10-01 19:23:07.000000', 8, 1);

-- ----------------------------
-- Table structure for d_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `d_goods_category`;
CREATE TABLE `d_goods_category`  (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nav` tinyint(1) NOT NULL,
  `sort` int NOT NULL,
  `parent_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_goods_category_parent_id_2e7771cf_fk_d_goods_category_id`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `d_goods_category_parent_id_2e7771cf_fk_d_goods_category_id` FOREIGN KEY (`parent_id`) REFERENCES `d_goods_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_goods_category
-- ----------------------------
INSERT INTO `d_goods_category` VALUES ('2024-10-01 18:57:15.000000', '2024-10-01 18:57:17.000000', 1, '程序类', 'uploads/goods_img/android.png', 1, 1, NULL);
INSERT INTO `d_goods_category` VALUES ('2024-10-01 18:58:14.000000', '2024-10-01 18:58:15.000000', 2, '食物类', 'uploads/goods_img/mysql.png', 1, 2, NULL);
INSERT INTO `d_goods_category` VALUES ('2024-10-01 18:58:43.000000', '2024-10-01 18:58:44.000000', 3, '枣类', 'uploads/goods_img/vue.png', 1, 1, 2);
INSERT INTO `d_goods_category` VALUES ('2024-10-01 19:04:34.049372', '2024-10-01 19:04:34.049372', 7, 'Java类', 'uploads/goods_img/java.png', 0, 2, 1);
INSERT INTO `d_goods_category` VALUES ('2024-10-01 19:06:15.757913', '2024-10-01 19:06:15.757913', 8, 'Python类', 'uploads/goods_img/python.png', 0, 3, 1);
INSERT INTO `d_goods_category` VALUES ('2024-10-02 17:57:51.415822', '2024-10-02 17:57:51.415822', 9, '新疆特级大枣', 'uploads/goods_img/test.jpg', 0, 5, 1);

-- ----------------------------
-- Table structure for d_order
-- ----------------------------
DROP TABLE IF EXISTS `d_order`;
CREATE TABLE `d_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_total` int NOT NULL,
  `order_price` decimal(10, 2) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pay_method` int NOT NULL,
  `memo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_order_user_id_968adaf8_fk`(`user_id` ASC) USING BTREE,
  CONSTRAINT `d_order_user_id_968adaf8_fk` FOREIGN KEY (`user_id`) REFERENCES `users_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_order
-- ----------------------------

-- ----------------------------
-- Table structure for d_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `d_order_goods`;
CREATE TABLE `d_order_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_num` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `goods_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_order_goods_goods_id_339ad2ea_fk`(`goods_id` ASC) USING BTREE,
  INDEX `d_order_goods_order_id_a1443f91_fk`(`order_id` ASC) USING BTREE,
  CONSTRAINT `d_order_goods_goods_id_339ad2ea_fk` FOREIGN KEY (`goods_id`) REFERENCES `d_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `d_order_goods_order_id_a1443f91_fk` FOREIGN KEY (`order_id`) REFERENCES `d_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for d_slide
-- ----------------------------
DROP TABLE IF EXISTS `d_slide`;
CREATE TABLE `d_slide`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `images` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_slide_goods_id_a02b02bf_fk`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `d_slide_goods_id_a02b02bf_fk` FOREIGN KEY (`goods_id`) REFERENCES `d_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_slide
-- ----------------------------
INSERT INTO `d_slide` VALUES (1, 'slide/Django.png', 1, '2024-10-02 15:41:00.000000', 1);

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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `users_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2024-10-02 17:57:51.417859', '9', '新疆特级大枣', 1, '[{\"added\": {}}]', 9, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (6, 'basic', 'address');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'goods', 'goods');
INSERT INTO `django_content_type` VALUES (9, 'goods', 'goodscategory');
INSERT INTO `django_content_type` VALUES (8, 'goods', 'slide');
INSERT INTO `django_content_type` VALUES (10, 'order', 'cart');
INSERT INTO `django_content_type` VALUES (11, 'order', 'order');
INSERT INTO `django_content_type` VALUES (12, 'order', 'ordergoods');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (13, 'users', 'myuser');

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-10-01 17:07:29.812824');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-10-01 17:07:29.854552');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-10-01 17:07:29.897449');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-10-01 17:07:29.958107');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-10-01 17:07:29.963111');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-10-01 17:07:29.967620');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-10-01 17:07:29.971122');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-10-01 17:07:29.972744');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-10-01 17:07:29.976666');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-10-01 17:07:29.979983');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-10-01 17:07:29.983981');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-10-01 17:07:29.991995');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-10-01 17:07:29.996501');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-10-01 17:07:30.000506');
INSERT INTO `django_migrations` VALUES (15, 'users', '0001_initial', '2024-10-01 17:07:30.054610');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2024-10-01 17:07:30.107806');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-10-01 17:07:30.129883');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-01 17:07:30.135885');
INSERT INTO `django_migrations` VALUES (19, 'basic', '0001_initial', '2024-10-01 17:07:30.151455');
INSERT INTO `django_migrations` VALUES (20, 'basic', '0002_address_user', '2024-10-01 17:07:30.184982');
INSERT INTO `django_migrations` VALUES (21, 'goods', '0001_initial', '2024-10-01 17:07:30.262295');
INSERT INTO `django_migrations` VALUES (22, 'goods', '0002_goods_user', '2024-10-01 17:07:30.311480');
INSERT INTO `django_migrations` VALUES (23, 'order', '0001_initial', '2024-10-01 17:07:30.356894');
INSERT INTO `django_migrations` VALUES (24, 'order', '0002_auto_20241001_1707', '2024-10-01 17:07:30.479125');
INSERT INTO `django_migrations` VALUES (25, 'sessions', '0001_initial', '2024-10-01 17:07:30.490146');
INSERT INTO `django_migrations` VALUES (26, 'basic', '0003_alter_address_id', '2024-10-01 17:33:00.627317');
INSERT INTO `django_migrations` VALUES (27, 'goods', '0003_alter_goods_id_alter_slide_id', '2024-10-01 17:33:00.855971');
INSERT INTO `django_migrations` VALUES (28, 'order', '0003_alter_cart_id_alter_order_id_alter_ordergoods_id', '2024-10-01 17:33:01.007423');
INSERT INTO `django_migrations` VALUES (29, 'users', '0002_alter_myuser_id', '2024-10-01 17:33:01.388514');
INSERT INTO `django_migrations` VALUES (30, 'users', '0003_myuser_nickname', '2024-10-01 17:50:12.499547');
INSERT INTO `django_migrations` VALUES (31, 'authtoken', '0001_initial', '2024-10-02 14:42:07.688634');

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
INSERT INTO `django_session` VALUES ('0y21ydnrlwvvmto9rruf1n0p5g6pmz6x', '.eJxVi0EOAiEMRe_C2hBpZSgunYOQlqlhYtSJDLow3l1JXOjyv__e0yRua0mt6i3Nk9kbZza_TDif9NIPXpZqO6v2Puuj2rHV9Xo-fIW_qnAtn0RxCAx-SwA5IJOQhAjsiDAKxT5UQBSROWQ8AoVJUZxHGDzQzrzeQPUzPA:1svw4F:_YMk0BquaSTutBodVQEL47yL8VxSS5NKwFTQjfn_h7Y', '2024-10-16 17:54:47.401667');
INSERT INTO `django_session` VALUES ('3yrfzq5b1m0f8m9eo6j8y0dfci1zpm6c', '.eJxVi0EOAiEMRe_C2hBpZSgunYOQlqlhYtSJDLow3l1JXOjyv__e0yRua0mt6i3Nk9kbZza_TDif9NIPXpZqO6v2Puuj2rHV9Xo-fIW_qnAtn0RxCAx-SwA5IJOQhAjsiDAKxT5UQBSROWQ8AoVJUZxHGDzQzrzeQPUzPA:1svw6P:St6U2neypPkwt14zFwCajMJnInrafP6tM2Gh-EX2Y68', '2024-10-16 17:57:01.264529');
INSERT INTO `django_session` VALUES ('91nth9b2flne3uwu40j78twvowaz029v', '.eJxVi0EOAiEMRe_C2hBpZSgunYOQlqlhYtSJDLow3l1JXOjyv__e0yRua0mt6i3Nk9kbZza_TDif9NIPXpZqO6v2Puuj2rHV9Xo-fIW_qnAtn0RxCAx-SwA5IJOQhAjsiDAKxT5UQBSROWQ8AoVJUZxHGDzQzrzeQPUzPA:1svw2r:kI7A8lsTp1YfEllDevBP_WPNkyktWjdL0gBuQJVshkk', '2024-10-16 17:53:21.155427');
INSERT INTO `django_session` VALUES ('pwg87g9hvz6to13qq9zxftzdi3gzhosi', '.eJxVi0EOAiEMRe_C2hBpZSgunYOQlqlhYtSJDLow3l1JXOjyv__e0yRua0mt6i3Nk9kbZza_TDif9NIPXpZqO6v2Puuj2rHV9Xo-fIW_qnAtn0RxCAx-SwA5IJOQhAjsiDAKxT5UQBSROWQ8AoVJUZxHGDzQzrzeQPUzPA:1svw5d:U_QJYn2WoKvnsvb128n1DdRd-Qv2O82Mg6OAnSDyok4', '2024-10-16 17:56:13.216432');
INSERT INTO `django_session` VALUES ('u6dp3zbuva8aen8r792mjzfc7ruqbk9p', '.eJxVi0EOAiEMRe_C2hBpZSgunYOQlqlhYtSJDLow3l1JXOjyv__e0yRua0mt6i3Nk9kbZza_TDif9NIPXpZqO6v2Puuj2rHV9Xo-fIW_qnAtn0RxCAx-SwA5IJOQhAjsiDAKxT5UQBSROWQ8AoVJUZxHGDzQzrzeQPUzPA:1svw74:Wsi5iIIdmfKooM1a8YBKsC5T_RCJskPHy20SIPyGH-M', '2024-10-16 17:57:42.898880');

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

-- ----------------------------
-- Table structure for users_myuser
-- ----------------------------
DROP TABLE IF EXISTS `users_myuser`;
CREATE TABLE `users_myuser`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `truename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` int NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `user_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` int NOT NULL,
  `status` int NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_myuser
-- ----------------------------
INSERT INTO `users_myuser` VALUES (1, 'pbkdf2_sha256$216000$10CzT9W61MMc$mUdGoBeofRkf+Fyh+c4z3PLvDpt4w8RESvxel6DRdbY=', '2024-10-02 17:57:42.896847', 1, 'dingding', '', '', 'ding@ding.com', 1, 1, '2024-10-01 17:14:25.956595', '帅比', '19999999999', 0, '1999-10-01', 'user_img/mytouxiang.jpg', 2, 0, '2024-10-01 17:14:25.956595', '2024-10-01 17:14:25.956595', 'admin');
INSERT INTO `users_myuser` VALUES (2, 'pbkdf2_sha256$600000$kC4is6yXK6vrj5mt6rQOXm$JDAg37OTJHpUU86CPwb6INkmhsKqtxK2EEkota48PIY=', NULL, 0, 'dingjiaxiong', '', '', 'ding@xiong.com', 1, 1, '2024-10-01 17:52:08.309408', '大帅哥', '13908360500', 0, '1999-10-02', 'user_img/mytouxiang.jpg', 4, 0, '2024-10-01 17:52:08.309408', '2024-10-01 17:52:08.309408', 'dingding');
INSERT INTO `users_myuser` VALUES (3, 'pbkdf2_sha256$600000$2iQHsoat0DmE4zI01ej5KY$LQp8gLFtAAdAek/mq5mQEWW9R99PrdfWLUK+ZuSSXf4=', NULL, 0, 'javajavajava', '', '', 'java@java.com', 1, 1, '2024-10-01 18:19:03.916209', 'java', '13219991999', 0, '2024-10-01', 'user_img/java.png', 4, 0, '2024-10-01 18:19:03.916209', '2024-10-01 18:19:03.916209', 'javajava');

-- ----------------------------
-- Table structure for users_myuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_myuser_groups`;
CREATE TABLE `users_myuser_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `myuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_myuser_groups_myuser_id_group_id_701de95c_uniq`(`myuser_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `users_myuser_groups_group_id_320a3e7b_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `users_myuser_groups_group_id_320a3e7b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_myuser_groups_myuser_id_6c79e2c5_fk` FOREIGN KEY (`myuser_id`) REFERENCES `users_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_myuser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_myuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_myuser_user_permissions`;
CREATE TABLE `users_myuser_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `myuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_myuser_user_permis_myuser_id_permission_id_bfff4a24_uniq`(`myuser_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `users_myuser_user_pe_permission_id_6f8831ec_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `users_myuser_user_pe_permission_id_6f8831ec_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_myuser_user_permissions_myuser_id_7135c2f9_fk` FOREIGN KEY (`myuser_id`) REFERENCES `users_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_myuser_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
