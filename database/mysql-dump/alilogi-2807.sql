# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.5-10.4.6-MariaDB)
# Database: rongdo-transport
# Generation Time: 2020-07-28 04:25:46 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES
	(1,0,1,'Dashboard','fa-bar-chart','/','dashboard',NULL,'2020-07-27 09:04:16'),
	(2,0,19,'Admin','fa-tasks','',NULL,NULL,'2020-07-23 09:43:21'),
	(3,2,20,'Users','fa-users','auth/users',NULL,NULL,'2020-07-23 09:43:21'),
	(4,2,21,'Roles','fa-user','auth/roles',NULL,NULL,'2020-07-23 09:43:21'),
	(5,2,22,'Permission','fa-ban','auth/permissions',NULL,NULL,'2020-07-23 09:43:21'),
	(6,2,23,'Menu','fa-bars','auth/menu',NULL,NULL,'2020-07-23 09:43:21'),
	(7,2,24,'Operation log','fa-history','auth/logs',NULL,NULL,'2020-07-23 09:43:21'),
	(8,0,10,'Danh sách khách hàng','fa-users','customers','customers','2020-06-01 11:35:10','2020-07-27 09:37:12'),
	(9,0,11,'Kho','fa-home','warehouses','*','2020-06-01 16:12:25','2020-07-23 09:34:38'),
	(10,0,9,'Danh sách mã vận đơn','fa-cab','transport_order_items','order.items','2020-06-01 16:24:11','2020-07-27 09:15:53'),
	(11,0,13,'Báo cáo','fa-area-chart',NULL,'reports','2020-06-02 11:28:14','2020-07-27 09:03:56'),
	(12,11,14,'Báo cáo công nợ','fa-bars','/reports/oweds','reports','2020-06-02 11:29:33','2020-07-27 09:08:24'),
	(14,11,15,'Thống kê hoàn tiền','fa-refresh','/reports/refunds','reports','2020-06-02 11:30:36','2020-07-27 09:08:30'),
	(16,11,16,'Thống kê nạp tiền khách hàng','fa-plus-square-o','/reports/recharges','reports','2020-06-02 11:35:02','2020-07-27 09:08:37'),
	(17,11,17,'Thống kê trừ tiền tài khoản','fa-long-arrow-down','/reports/deductions','reports','2020-06-02 11:35:36','2020-07-27 09:08:45'),
	(18,11,18,'Thống kê chi tiết khách hàng','fa-users','/reports/customers','reports','2020-06-02 15:19:44','2020-07-27 09:09:02'),
	(19,0,8,'Đơn hàng vận chuyển','fa-train','/transport_orders','order.payments','2020-06-02 22:34:48','2020-07-27 09:17:27'),
	(20,0,2,'Khách hàng','fa-cube',NULL,'customer','2020-06-15 14:24:01','2020-06-15 14:43:25'),
	(21,20,4,'Thông tin người dùng','fa-blind','/profiles/information','customer','2020-06-15 14:24:49','2020-07-23 09:34:38'),
	(22,20,5,'Danh sách mã vận đơn','fa-history','/profiles/list-items','customer','2020-06-15 14:25:39','2020-07-23 09:34:38'),
	(24,20,3,'Lịch sử ví tiền','fa-money','/profiles/wallet','customer','2020-06-15 15:12:10','2020-07-23 09:34:38'),
	(25,20,6,'Danh sách đơn hàng','fa-bars','/profiles/list-orders',NULL,'2020-07-23 09:34:26','2020-07-23 09:34:43'),
	(26,0,12,'Hòm thư góp ý','fa-wechat','messages','messages','2020-07-23 09:43:06','2020-07-27 09:10:27');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES
	(1,'[Tất cả] - Full quyền hạn','*','','*',NULL,'2020-07-27 08:55:46'),
	(2,'[Tất cả] - Bảng điều khiển','dashboard','GET','/',NULL,'2020-07-27 08:56:02'),
	(3,'[Tất cả] - Login','auth.login','','/auth/login\r\n/auth/logout',NULL,'2020-07-27 08:56:13'),
	(4,'[Tất cả] -  Chỉnh sửa thông tin cá nhân','auth.setting','GET,PUT','/auth/setting',NULL,'2020-07-27 09:06:48'),
	(5,'[Admin] - Quản trị','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs\r\n/auth/users',NULL,'2020-07-27 08:54:54'),
	(6,'[Khách hàng] - Thông tin tài khoản khách hàng','customer','','/profiles*','2020-06-15 14:37:10','2020-07-27 09:01:28'),
	(7,'[Admin] - Báo cáo hệ thống','reports','','/reports*','2020-07-27 09:00:17','2020-07-27 09:00:17'),
	(8,'[Tất cả] - Hòm thư góp ý','messages','','/messages*','2020-07-27 09:10:01','2020-07-27 09:10:11'),
	(9,'[Admin] - Danh sách mã vận đơn','order.items','','/transport_order_items','2020-07-27 09:15:42','2020-07-27 09:15:42'),
	(10,'[Admin] - Đơn hàng vận chuyển','order.payments','','/transport_orders','2020-07-27 09:17:18','2020-07-27 09:17:18'),
	(12,'[Admin] - Xem chi tiết đơn hàng vận chuyển','order.detail','',NULL,'2020-07-27 09:23:20','2020-07-27 09:23:33'),
	(13,'[Admin] - Xoá đơn hàng vận chuyển','order.delete','',NULL,'2020-07-27 09:26:01','2020-07-27 09:26:01'),
	(14,'[Admin] - Đơn hàng Trung quốc nhận','order.china','',NULL,'2020-07-27 09:29:51','2020-07-27 09:29:51'),
	(15,'[Admin] - Đơn hàng Việt nam nhận','order.vietnam','',NULL,'2020-07-27 09:30:09','2020-07-27 09:30:09'),
	(16,'[Admin] - Thanh toán đơn hàng','order.payment','',NULL,'2020-07-27 09:30:28','2020-07-27 09:30:28'),
	(17,'[Admin] - Xuất Excel đơn hàng','order.export','',NULL,'2020-07-27 09:31:40','2020-07-27 09:31:40'),
	(18,'[Admin] - Danh sách khách hàng','customers','','/customers*','2020-07-27 09:36:49','2020-07-27 09:37:55');

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL),
	(1,9,NULL,NULL),
	(1,21,NULL,NULL),
	(1,22,NULL,NULL),
	(2,21,NULL,NULL),
	(2,22,NULL,NULL),
	(1,24,NULL,NULL),
	(2,24,NULL,NULL),
	(2,25,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,2,NULL,NULL),
	(2,6,NULL,NULL),
	(2,4,NULL,NULL),
	(2,8,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,4,NULL,NULL),
	(2,411,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Admin tổng','administrator','2020-05-26 10:26:38','2020-07-27 09:02:51'),
	(2,'Khách hàng vận chuyển','customer','2020-06-15 14:35:15','2020-06-15 14:35:15');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;

INSERT INTO `admin_user_permissions` (`user_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_customer` int(11) DEFAULT 1,
  `symbol_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ware_house_id` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`, `email`, `phone_number`, `wallet`, `address`, `is_customer`, `symbol_name`, `ware_house_id`, `is_active`)
VALUES
	(1,'admin','$2y$10$DY3yo0q9y6LmhF4kDws8WOYrCMpgOPmknuIuTceDdiAz61n3QJCdW','Administrator',NULL,'t5p6eWl7YiMjqGNjMMArIi7V8n06xTuk6pZfExTtxNvsOmjpdfPhAUzisXcl','2020-05-26 10:26:38','2020-06-01 16:15:46','13123123','123123123','2194529','Ha Noi, Viet Nam',0,NULL,NULL,1),
	(411,'daothanhtung','$2y$12$BvJMrFRRlncdSBLSUCY4oOjArEeZsOYYABBGaE6V1xwS7TSv2pSYO','Dao Thanh Tung',NULL,'Z8Oq815gDg7LEuGCUYfXumuxzss5tLHLu40x27zjNdwirj2v7ffvyyTDVlN5','2020-07-20 11:28:03','2020-07-22 15:27:45','thanhtung.atptit@gmail.com','0345513889','-24335400','Van phuc, Ha dong',1,'TUNGDT.BAV',2,1),
	(412,'nguyen-van-a-1595348066','$2y$10$GMnnFVLwWPu6rhbHJ.IU1eQkECtmJAfO5MzH1fBbqUxhHOAB1/VdW','Nguyễn Văn A',NULL,NULL,'2020-07-21 23:14:26','2020-07-21 23:33:53','nguyenvana@gmail.com','0345513888','2000000','Hai phong',1,'nguyenvana',3,1);

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ten danh muc',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Kinh tế','kinh-te','2019-08-21 22:54:18','2019-08-21 22:54:18'),
	(2,'Xuất nhập khẩu','xuat-nhap-khau','2019-08-21 22:54:18','2019-08-21 22:54:18'),
	(3,'Đặt hàng','dat-hang','2019-08-21 22:54:18','2019-08-21 22:54:18'),
	(4,'Chứng khoản','chung-khoan','2019-08-21 22:54:18','2019-08-21 22:54:18'),
	(5,'Tỉ giá hối đoái','ti-gia-hoi-doai','2019-08-21 22:54:18','2019-08-21 22:54:18');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_pages`;

CREATE TABLE `cms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Không hoạt động; 1: Hoạt động',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'id menu cha, null la menu cha',
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'link menu, vd: /blogs',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;

INSERT INTO `cms_pages` (`id`, `name`, `title`, `content`, `created_by`, `slug`, `is_active`, `created_at`, `updated_at`, `parent_id`, `route`)
VALUES
	(20,'BÁO GIÁ','BÁO GIÁ','<p>B&Aacute;O GI&Aacute; R&Ocirc;NG ĐỎ LOGISTICS</p>',1,'bao-gia',1,'2019-11-07 23:43:36','2019-11-07 23:43:36',NULL,NULL),
	(21,'TIN TỨC','TIN TỨC','<p>TIN TỨC</p>',1,'tin-tuc',1,'2019-11-07 23:44:48','2019-11-07 23:44:48',NULL,NULL),
	(23,'DỊCH VỤ','DỊCH VỤ','<p>DỊCH VỤ</p>',1,'dich-vu',1,'2019-11-07 23:46:10','2019-11-07 23:46:10',NULL,NULL),
	(26,'GIỚI THIỆU','GIỚI THIỆU','<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;C&ocirc;ng ty Rồng Đỏ Logistic&nbsp;th&agrave;nh lập từ năm 2012. Trải qua 5 năm hoạt động trong lĩnh vực x&uacute;c tiến thương mại h&agrave;ng h&oacute;a giữa Việt Nam v&agrave; Trung Quốc, ch&uacute;ng t&ocirc;i đ&atilde; x&acirc;y dựng cho m&igrave;nh một đội ngũ nh&acirc;n vi&ecirc;n chuy&ecirc;n nghiệp, am hiểu thị trường, c&oacute; kinh nghiệm trong khai th&aacute;c nguồn h&agrave;ng v&agrave; vận chuyển h&agrave;ng h&oacute;a, th&agrave;nh thạo tiếng Trung Quốc, bắt nhịp nhanh với thay đổi v&agrave; tr&agrave;o lưu thị trường.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;C&ugrave;ng với sự ph&aacute;t triển của thương mại điện tử, việc đặt mua h&agrave;ng qua mạng đ&atilde; trở th&agrave;nh một xu thế mới. Xu thế n&agrave;y được cả c&aacute;c nh&agrave; bu&ocirc;n, c&aacute;c cửa h&agrave;ng b&aacute;n lẻ v&agrave; người ti&ecirc;u d&ugrave;ng c&aacute; nh&acirc;n hưởng ứng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Đối với nh&agrave; bu&ocirc;n, thay v&igrave; việc phải&nbsp; sang tận nơi t&igrave;m h&agrave;ng, đặt mua, chuyển h&agrave;ng th&igrave; giờ đ&acirc;y, chỉ cần ở nh&agrave;, click chuột l&agrave; bạn đ&atilde; c&oacute; thể t&igrave;m cho m&igrave;nh những nguồn h&agrave;ng ưng &yacute;, tiết kiệm được cả thời gian, c&ocirc;ng sức, tiền bạc. C&ocirc;ng nghệ th&ocirc;ng tin v&agrave; sự ph&aacute;t triển của mạng internet đ&atilde; gi&uacute;p họ d&agrave;nh nhiều thời gian hơn tập trung v&agrave;o kh&aacute;ch h&agrave;ng m&agrave; kh&ocirc;ng phải đau đầu về việc nhập h&agrave;ng. Bởi mỗi lần đi &ldquo;đ&aacute;nh h&agrave;ng&rdquo; l&agrave; họ phải lo lắng b&ecirc; trễ c&ocirc;ng việc ở nh&agrave;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Đối với c&aacute;c cửa h&agrave;ng b&aacute;n lẻ, việc tự t&igrave;m mua h&agrave;ng tận gốc đ&atilde; gi&uacute;p họ giải quyết hai vấn đề: một l&agrave;, thay v&igrave; phải mua tại c&aacute;c đầu mối ở H&agrave; Nội với gi&aacute; cao th&igrave; họ đ&atilde; c&oacute; thể tự t&igrave;m nguồn h&agrave;ng tận gốc, giảm chi ph&iacute; nhập h&agrave;ng; hai l&agrave;, nếu nhập h&agrave;ng ngay tại Việt Nam (một thị trường nhỏ) th&igrave; họ đ&atilde; c&oacute; thể t&igrave;m h&agrave;ng tại Trung Quốc (một thị trường lớn gấp v&agrave;i chục lần) gi&uacute;p họ kh&ocirc;ng phải lo lắng về việc nhập &ldquo;đụng h&agrave;ng&rdquo;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Đối với người ti&ecirc;u d&ugrave;ng c&aacute; nh&acirc;n, thay v&igrave; th&uacute; vui đi dạo c&aacute;c cửa h&agrave;ng trước đ&acirc;y, giờ họ c&oacute; th&ecirc;m th&uacute; vui mới &ldquo;shopping tr&ecirc;n mạng&rdquo;. Shopping tr&ecirc;n mạng mở ra một thế giới mua sắm đa dạng, nhiều lựa chọn. Trung Quốc đ&atilde; rất th&agrave;nh c&ocirc;ng trong việc x&acirc;y dựng v&agrave; ph&aacute;t triển c&aacute;c trang web b&aacute;n h&agrave;ng nổi tiếng như Alibaba,Taobao,Tmaill, v.v&hellip;Giờ đ&acirc;y, chỉ cần dạo qua c&aacute;c trang n&agrave;y, bạn đ&atilde; c&oacute; thể t&igrave;m kiếm được bất k&igrave; thứ g&igrave; m&igrave;nh cần v&agrave; c&oacute; thể nhanh ch&oacute;ng cập nhật những kiểu d&aacute;ng mới nhất, sản phẩm thời thượng nhất.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Đứng trước tr&agrave;o lưu n&agrave;y, Rồng Đỏ Logistic đ&atilde; x&acirc;y dựng v&agrave; đ&agrave;o tạo một đội ngũ chuy&ecirc;n tr&aacute;ch về vận chuyển h&agrave;ng h&oacute;a v&agrave; order h&agrave;ng Trung Quốc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Về vận chuyển h&agrave;ng h&oacute;a, ch&uacute;ng t&ocirc;i mang đến những giải ph&aacute;p hợp l&iacute; về vận chuyển nhằm quản l&iacute; v&agrave; theo d&otilde;i đơn h&agrave;ng vận chuyển một c&aacute;ch khoa học, gi&uacute;p kh&aacute;ch h&agrave;ng hiểu r&otilde; h&agrave;ng h&oacute;a của m&igrave;nh đang ở đ&acirc;u, bao giờ về đến Việt Nam, từ đ&oacute; chủ động trong việc kinh doanh bu&ocirc;n b&aacute;n. Ch&uacute;ng t&ocirc;i cũng đặc biệt hỗ trợ kh&aacute;ch h&agrave;ng l&agrave; chủ order trong việc thu gom h&agrave;ng nhằm tiết giảm chi ph&iacute; vận chuyển, đảm bảo an to&agrave;n h&agrave;ng h&oacute;a, tr&aacute;nh thất lạc h&agrave;ng h&oacute;a.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Về order h&agrave;ng, ch&uacute;ng t&ocirc;i cung cấp dịch vụ order h&agrave;ng tr&ecirc;n c&aacute;c trang web lớn v&agrave; uy t&iacute;n của Trung Quốc như Alibaba, Taobao, Paipai, Tmaill cũng như khai th&aacute;c trực tiếp nguồn h&agrave;ng nh&agrave; m&aacute;y. Với đội ngũ tư vấn vi&ecirc;n chuy&ecirc;n nghiệp với tinh thần l&agrave;m việc chuy&ecirc;n nghiệp v&agrave; th&aacute;i độ th&acirc;n thiện, ch&uacute;ng t&ocirc;i tin rằng sẽ l&agrave;m Qu&yacute; kh&aacute;ch h&agrave;ng h&agrave;i l&ograve;ng, t&igrave;m kiếm được những sản phẩm, nguồn h&agrave;ng ưng &yacute;, tiết kiệm chi ph&iacute;, nhanh ch&oacute;ng v&agrave; hiệu quả.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Rồng Đỏ Logistic xin tr&acirc;n trọng cảm ơn Qu&yacute; kh&aacute;ch h&agrave;ng đ&atilde; tin tưởng lựa chọn dịch vụ của ch&uacute;ng t&ocirc;i. Ch&uacute;ng t&ocirc;i hiểu rằng, sự tin cậy của Qu&yacute; kh&aacute;ch h&agrave;ng l&agrave; t&agrave;i sản v&ocirc; gi&aacute; gi&uacute;p ch&uacute;ng t&ocirc;i x&acirc;y dựng thương hiệu của m&igrave;nh. Ch&uacute;ng t&ocirc;i sẽ kh&ocirc;ng ngừng ho&agrave;n thiện, n&acirc;ng cao chất lượng dịch vụ nhằm đ&aacute;p lại sự tin tưởng, ủng hộ v&agrave; hợp t&aacute;c của Qu&yacute; kh&aacute;ch h&agrave;ng.</p>',1,'gioi-thieu',1,'2019-11-08 00:20:33','2019-11-08 00:20:33',NULL,'gioi-thieu'),
	(32,'Liên Hệ','Liên Hệ','<p style=\"text-align:center\"><strong>HOTLINE:</strong></p>\r\n\r\n<p style=\"text-align:center\">0971.22.66.01 &ndash; 0971.22.66.02 (ZALO)</p>\r\n\r\n<p style=\"text-align:center\">******</p>\r\n\r\n<p style=\"text-align:center\"><strong>KINH DOANH/ CSKH:</strong></p>\r\n\r\n<p style=\"text-align:center\">0971.22.66.04 (ZALO)</p>\r\n\r\n<p style=\"text-align:center\">086.71.71.001 (ZALO)</p>\r\n\r\n<p style=\"text-align:center\">086.71.71.003 (ZALO)</p>\r\n\r\n<p style=\"text-align:center\">******</p>\r\n\r\n<p style=\"text-align:center\"><strong>ĐIỀU PHỐI VẬN CHUYỂN:</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>(KHO HAI B&Agrave; TRƯNG)</strong></p>\r\n\r\n<p style=\"text-align:center\">0971.22.66.05 (VẬN CHUYỂN) - 086.71.71.008 (ORDER)</p>\r\n\r\n<p style=\"text-align:center\">-------------------------------------------</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;<strong>(KHO CẦU GIẤY)</strong></p>\r\n\r\n<p style=\"text-align:center\">0971.22.66.04</p>\r\n\r\n<p style=\"text-align:center\">-------------------------------------------</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;<strong>(KHO THANH XU&Acirc;N &ndash; H&Agrave; Đ&Ocirc;NG)</strong></p>\r\n\r\n<p style=\"text-align:center\">086.71.71.002 (VẬN CHUYỂN) - 086.71.71.009 (ORDER)</p>\r\n\r\n<p style=\"text-align:center\">--------------------------------------------</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;<strong>(KHO HỒ CH&Iacute; MINH)</strong></p>\r\n\r\n<p style=\"text-align:center\">086.71.71.005</p>',1,'lien-he',1,'2019-11-08 00:54:06','2019-11-08 00:54:06',NULL,'lien-he'),
	(33,'HƯỚNG DẪN','HƯỚNG DẪN','<p>T&agrave;i khoản nhận đặt cọc Order Rongdologistics.com:</p>\r\n\r\n<p>- VCB Hanoi: 0011004235539 L&Ecirc; LONG HẢI</p>\r\n\r\n<p>- Techcombank Thang Long: 19032066328661 L&Ecirc; LONG HẢI</p>\r\n\r\n<p>- BIDV Hanoi: 21610000503033 L&Ecirc; LONG HẢI</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Tiền vận chuyển k&iacute; gửi: Vietcombank Hanoi: 0021000425941 L&Ecirc; LONG HẢI</p>',1,'huong-dan',1,'2020-02-26 11:41:55','2020-02-26 11:41:55',NULL,'huong-dan');

/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_profiles`;

CREATE TABLE `customer_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `gender` tinyint(4) DEFAULT NULL COMMENT '0 : Nữ; 1 : Nam; 2 : Khác',
  `birthday` date DEFAULT NULL,
  `bank_account` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_owner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_sector` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remaining_amount` double(15,3) DEFAULT NULL,
  `avatar_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 : Không hoạt động; 1 : Hoạt động',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `symbol_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_percent` int(11) DEFAULT NULL,
  `price_weight_default` double(11,2) DEFAULT NULL,
  `supporter_id` int(11) DEFAULT NULL,
  `ware_house_id` int(11) DEFAULT NULL,
  `orderer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_number_unique` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone_number`, `is_active`, `remember_token`, `created_at`, `updated_at`, `symbol_name`, `service_percent`, `price_weight_default`, `supporter_id`, `ware_house_id`, `orderer_id`)
VALUES
	(1,'Ta Quảng','taquang2222@gmail.com','$2y$10$ChjvQLulcRxej/ltzXyRNezoIHYfkua7qwUrE3jOUjIFYHCEzYrnm','03213654741',1,'02slo6S2Yw17kAdfKwgyO5hBVMzwkKeMspmyCLhJsoxSTQOa47Nnxy23rAgO','2019-08-21 23:14:57','2020-02-21 21:11:49','quangit1',NULL,0.00,4,2,NULL),
	(2,'phambin','phambin@gmail.com','$2y$10$8rBkG5/m2vxucjAn9nyYCenf/6isg5v8fiYdPGAHkpTiGfrrzomwi','0392836868',1,NULL,'2019-08-30 21:54:20','2019-11-19 15:35:02','binbun',1,0.00,24,4,NULL),
	(3,'vchhbduy0','oo@gmail.com','$2y$10$BqfXBd1GQ6RNfgEM/MpsvORFNSxDAz4BVZvvm5uJBAw5mKfwe2.GW','0966990000',1,NULL,'2019-09-11 16:13:20','2019-09-11 16:13:20',NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'Ptvinh','ptvinh2008@gmail.com','$2y$10$T46bGihftXcsmH3N41N6aOxWqdgHiDdv63ixrdUJarVGqYdgjDjqS','0961988190',1,'R7l4kFaR4nWuslnA3tFiJurStPW2tmHZpJpmogZ2f1O0o2FC7cXo47mNmjI0','2019-09-13 02:01:09','2019-11-19 15:34:56','HDPTVinh',NULL,0.00,24,4,5),
	(5,'Nguyễn Quỳnh','nguyenquynh@gmail.com','$2y$10$.Kl3j3zKm7Lan9gX2F1wOeFlWxbM52XqSzI88UXbRK2WuzMMm0uPu','0911965266',1,'kK0Zrlm69uQqv41sZ6OAploNeMdPgB7AjjpGvNB9cdZSV4pCmbJ7E24622sm','2019-09-13 14:43:13','2019-11-27 09:07:06','#NgQuynh.',1,14000.00,24,2,5),
	(6,'Văn Tuyết Nhung','tuyetnhung@gmail.com','$2y$10$mIltwJp7jhFf0DJbf26c9.7zMTEegwwrdb9wTpoUFCXnCP/FOnXly','0945556788',1,'akS0kmeZRLI2Odf0EWicXlItPUjOgGOzPcM6fHdrSf1TOjl3YrLO3aWMwUNM','2019-09-13 15:28:13','2019-12-13 12:25:50','tuyetnhung-3',NULL,0.00,4,2,5),
	(7,'Dolly Nguyễn','dollynguyen@gmail.com','$2y$10$cpEFkVW5s9MvNApx1iSEfegm7/fmA1T0ArVNBeffdYn0wItfoTm6W','0917450250',1,'fhkV2tcNgkYx487mtS3MQTYImlgrJJYpu239hO4FVQwrFGjU4MaLxr9chu0J','2019-09-16 12:57:54','2019-12-20 11:53:25','#SGDoly.',1,0.00,4,5,20),
	(8,'Ngọc Anh','nacun2911@gmail.com','$2y$10$eyds27jJNpbIFlWd.wVzK.QCth8Cl690AeC3rtbjvOP.Gl2iAPJHq','0902341993',1,'iL9G0RmptAwMm6yCAx3m99q1K0wADjiNOjeJVXgho0EGmPUBdU2JnYK83TTZ','2019-09-17 00:28:13','2019-11-18 08:39:18','ngocanh',NULL,0.00,NULL,2,20),
	(9,'Nhung Đỗ','mrs.rose.911@gmail.com','$2y$10$9ebOdbM.gduLIPPQ/lVFau2za.GSabLunsIFsXRMMwOemnUOu3aKC','0902080608',1,NULL,'2019-09-17 15:08:15','2020-03-30 12:55:14','HDNhungDo-001.',1,0.00,29,4,20),
	(10,'Nguyễn Trọng Toàn','toannguyentrong@gmail.com','$2y$10$POH9Zpzo21mPjUtyhxw0muuLJYdOpVcqU94.7B9.6EIAXYlgW9Pd6','0969295950',1,'JcHjE7PukFH3ppNFlCxlwKoe8qtGJ8sS0ktj4vGfR4C2l7EM7k7TCozkZFyJ','2019-09-17 15:22:56','2020-03-27 14:46:46','#trongtoan-001',NULL,0.00,29,2,5),
	(11,'Trí Nghĩa','thichdaolong@gmail.com','$2y$10$9ZOGKWL7EB0MfXcYJKyOC.ej2Dn2yjiffD0M7tFetKnmCCnqZFOdG','0961901188',1,'xyofeSuCHIXeKETIWTuLYgG0lFPGpRUEELiAU5Jr2Wd5Kvn11j6kdmTHQNiw','2019-09-18 10:14:23','2019-12-13 12:25:55','TriNghia',NULL,0.00,NULL,3,5),
	(12,'Nguyễn dương anh tuấn','anhtuan1111996@gmail.com','$2y$10$dBI.KCVmFtASq2Paj1xzvuDAohEaRXgDOx0z0pDC5AK0svV4FIyU6','0908072300',1,'Mp3o5QZHfGSqwRInfkQphVxZcKPGxtPGdyFK8pMFTHJITZinJQxCk2C9qpvT','2019-09-18 14:24:30','2019-11-18 08:35:59','#SGTuan-3',NULL,33000.00,4,5,20),
	(13,'langtusaymen','hoapham2621985@gmail.com','$2y$10$n.GBdS1Y2rnSiwqZlSp2WevaLY1yCfAzAQx9eVzQBbhvAn1sfSMV2','0359833901',1,NULL,'2019-09-18 16:27:54','2020-03-30 12:55:21','anhHoa-001',NULL,0.00,29,2,5),
	(14,'Trần Thị Nguyên Thảo','nguyenthao@gmail.com','$2y$10$Aq6zW8fZsob9MnvodGe8a.WNPMqmnMHMaNIzeTeaJ65WvjNOXwrje','0905727373',1,'cK7tt1CzIqg9KzWyFbrFU2anb3q9AaWGb4H0uGCpvWFYox6C5BUYw5MiL7JD','2019-09-18 16:43:22','2019-11-18 08:39:04','ThaoDN-3',NULL,0.00,4,2,20),
	(15,'trangduong','trangdt0109@gmail.com','$2y$10$51M/IBK9DHBAtO1R21rb2Ot/blvHo2Wvxh8jXMaRgijC8bZiPnkhW','0904541804',1,'hTyQ0Vr2ZEZRzvWwuBB5qWhr87e4jTyNhbwYmGIUxgCIXA54TXmOLmpbJDDx','2019-09-18 16:49:50','2019-12-13 12:26:29','TRANGORD',NULL,0.00,NULL,2,5),
	(16,'lương hồng giang','lhgiang8597@gmail.com','$2y$10$aVSmjaqmY.NrZmLGSuCjXOX.kRxPlz2fHe64kWSliCf4h1LjE1Vci','0369029097',1,'UZXmLbJnXlbW7UkwmjAwHdg3NhLHBn3mvyW6hJza2u2BbOaaOjuWw1j8aXl6','2019-09-18 17:01:53','2020-02-07 12:06:03','HDLHGIANG-3',NULL,0.00,4,4,20),
	(17,'vũ thị dương uyên','moso.kidswear@gmail.com','$2y$10$2H730O9ycB8M8F9tERDdvekksGrpRYnT309ZeVwnUnz/ret2ajEGa','023054906014',1,NULL,'2019-09-18 17:35:09','2019-11-18 08:38:36','SGUyenVu',NULL,0.00,NULL,5,5),
	(18,'Minh Quân','minhquan@gmail.com','$2y$10$leLgDILkzVaYy1uY/IZ4U.DPoW.ugrs.R4w4xTHtCgIftsmETAGOi','0975685451',1,'TOi7Ngg3YhEqXa4HG1lr2acbYYrcJ3Ul80PMOuYX9sCN828s0laIZ1eHe0aa','2019-09-19 00:09:36','2020-03-24 09:51:12','QuanGhe',NULL,0.00,24,2,5),
	(19,'Pham Hong An','zachihandmade@gmail.com','$2y$10$G7YB36AX4xKwxvJEnyyBeuQRViA2Jh8UvK1JEhe/Jmx3n3SIKkESu','0936952727',1,NULL,'2019-09-19 12:33:59','2019-11-19 10:25:20','SGHONGAN',NULL,0.00,24,5,20),
	(20,'thùy khanh','kennje_lv901@yahoo.com.vn','$2y$10$C9Sy92j9ba3vRQCDwSLoEu41fwbafKRCUiiHYa8627pHteBymx58.','0936965223',1,'Y6aqxKw9w63DB8GEZ2mWKxjJTP9D7kMpBzuUMYE4PT0dRt9O1lwhKJJiJHAy','2019-09-19 13:43:37','2019-12-13 12:26:38','tkhanh-3',NULL,0.00,4,2,5),
	(21,'Ngô Thanh Thư','bemeo2209@gmail.com','$2y$10$wesyOKg5.j9Tm4YbzFGhn.za3OS13ykOQhTSHYdzWlti7Sn0K6e8G','0358239554',1,'OQYyG2ZBgo6DFbvr9TnxdhshwNhAlKXpTKCSDBkvfKLuHKip4YVoJPrO7p7i','2019-09-19 13:51:19','2020-03-27 14:46:35','thanhthu-001',NULL,0.00,29,2,5),
	(22,'kngan95','0908nkn@gmail.com','$2y$10$zAY17F.ow2GP1joT6EPwPOFxwtSwbAzhDNpXFw2aFcSRcUxsGOTmy','0972587185',1,'MK0phiHEiZ3hZfUppm6Q3gU4xuuYRs1olAhHWh319tZk4yDzTMwd3osUPLTv','2019-09-19 14:06:52','2020-03-27 14:46:26','kngan95-001',NULL,0.00,29,2,5),
	(23,'Nguyễn thị mai phương','phuong.ntm91@gmail.com','$2y$10$3xbyrgQ17MvhWl.z.lXLSeszxdFm7w/dp09lIfRgmPG1sHlwl69J.','0982926363',1,'pog2pgwbkUSi29fAlh5hxulkRh5QTHKHItAZKeUskz5x9EctseSfMsZ43SQu','2019-09-19 15:21:53','2020-03-12 16:52:19','MPhuong-3',NULL,0.00,4,2,5),
	(24,'Nguyễn Văn Hiếu','HieuNguyen@gmail.com','$2y$10$PD78RZY3gzOh3stYHTCVh.Xg54ZI5hAjrZFsdvn9sMBb7FM4OsFpe','0961248397',1,'W018FhwicvYFAApUBCgiNcV0BxbULqv78I2s4lkCYTOKDKrycqH0h03IYp0C','2019-09-19 15:25:50','2019-12-13 12:26:54','HSNVHieu',5,0.00,NULL,3,5),
	(25,'Nguyễn Thị Ngọc Linh','linhngocnguyen3993@gmail.com','$2y$10$tkAFrZlG3i4Rkh4tnTXowudTPxzWeSic9.v7cOJ.qgJgRXZ7sxQMG','0983023993',1,'VLf3JGx7wXJjBgus4yRTHrGuIQcpiO6BVhwrVGH8sGBfLxEmv2F0lXn1n1Bi','2019-09-19 16:04:06','2020-03-30 12:55:28','hslinhtit-001',NULL,0.00,29,3,5),
	(26,'Phạm Thụy Tường Vân','phamthuytuongvan@gmail.com','$2y$10$yOSv0O736xyabE9mnRtP3u0LZ7h7T9eOKrL4Cp9SEkVK.ElFPhn5i','0906795765',1,'QO3qDZiERJ3uI0hOfSkgz83LZAgOjOxklKdr9BPCeo1HZIEFsNsA0E0FwlPF','2019-09-19 17:21:03','2019-12-13 12:49:06','SGTUONGVAN-3',NULL,0.00,4,5,5),
	(27,'Song Tín','songtin3979@gmail.com','$2y$10$5/UjZQar4ddgAg1fSRiu7utilmpgOPBNap2iZ2UOEPhyz15xuPN3m','0984002222',1,'Bq45GV7RfJeyxYDs05yWgfOmpCx6QYzxIuF6hwv47JyikCOVGnpuoYP30vVo','2019-09-20 10:10:39','2019-11-08 16:42:12','SongTin',NULL,0.00,NULL,5,NULL),
	(28,'Nguyễn Kiều Chinh','kieuchinhnguyen98@gmail.com','$2y$10$gYhbPCh5G3Wiq2/7Lqrz2Om7CF1arKAaGVHLAnyUoUgailmTDbC.e','0354938411',1,'sTVRBt0Y8DoRdlD7fbHlS65d5udnrDuKxFnxBSEq0wmrSwCVc4vrywEbcsHl','2019-09-20 11:04:11','2020-03-30 12:55:37','KChinh11-001',NULL,0.00,29,2,5),
	(29,'Dương Bảo Yến','yendby@gmail.com','$2y$10$Cjy1rdUVaVVMmPGojMGD/ORp4Td7YsIKoG.2ZYU68K7uABtWyUv62','0948809993',1,NULL,'2019-09-20 11:27:54','2019-09-20 11:27:54',NULL,NULL,NULL,NULL,NULL,NULL),
	(30,'Tran Anh Tuan','tuantrancdnuce96@gmail.cim','$2y$10$gYXsbpwKi1aLpaWAcm/WBOnqZZsE/s.6Vy.xva6twQYOsCD8u/wfO','0968467596',1,'YpaezOTPaHKEztGMOB5M1HHueHpI7PuRFvy3boMQDFoOT6bRQKAmEFBwHkb1','2019-09-20 15:12:41','2020-03-30 12:55:44','hdtuantran-001',NULL,0.00,29,4,5),
	(31,'cao thanh phương','caophuong1302@gmail.com','$2y$10$r2R.G15BzZW7j4TBRUNmGO16SDMtcUZKolX09Y2oFA1NyfEwYZMPG','0385234326',1,NULL,'2019-09-20 18:17:54','2020-03-30 12:55:51','caophuong-001',NULL,0.00,29,NULL,20),
	(32,'My Linh Ngo','linhbong196@gmail.com','$2y$10$/Ok7OQ9MLaeasx2.sP3oXuNupaIzW/cHpsFKJ6bQt47zfwUjcai6i','0902168257',1,'TrjdKqEoC9dvqVxhf1Cr0wnrCZYaqXlZqIBIs7sVz60VhESqRQ7vGQroBhBQ','2019-09-20 18:24:54','2020-03-27 14:46:14','Linhbong-001',NULL,0.00,29,2,20),
	(33,'Tran Thi Ngoc Anh','maiduyen612@gmail.com','$2y$10$sXTuKhrZo2avwQZe9llvpOeFIhQD2JCPeooDkdIDVgAhW0O6j5ZFa','0943292269',1,'wyP4smvK4vSdUpV7hkMJlrQVMJxVXdSsWUz8EGeHVQxH1vMvHlkIKLh5aW9a','2019-09-20 22:52:19','2020-03-30 12:56:05','hdanh69-001',NULL,0.00,29,4,5),
	(34,'Vũ','nguyentuanvu92@gmail.com','$2y$10$RT92irKU3tNs5Od4yLAsYOaPSBXl8Yt4Vam6xGSmUX.bVfADzqr/6','0378406866',1,'OPs5bw2DQNBeyJ4bGOt3J7On3NOeWgqvOjzVtd0fxHI50UdqbHGkhppJwW2K','2019-09-21 18:10:51','2020-03-27 14:45:35','#TuanVu-001.',1,0.00,29,2,20),
	(35,'Tinhsuchi','tinhsuchi@gmail.com','$2y$10$QPyxMeRY3fSmrhAJHsy3zu4QH4qrxphReCT4k/gof7nFz67UXibf.','0909591111',1,'2K4ZsJcLCjzSii2up91XBFLZb10XrAZe6CZTouQ1vs6b28Kwy7vcbI9IRDMI','2019-09-22 11:56:38','2020-03-30 12:56:16','#SGKY-001..',2,0.00,29,5,5),
	(36,'Trần Minh Dương','minhduongtran95@gmail.com','$2y$10$saJrR5XRb0o/9ki2wvMhq.nihIRu8ZIxaaq0kgr11JfGalgl9IxQe','0789769888',1,'zPGCEJp1PYH9Rz9L3ruBfWYUrVe7o7BzKVvAyrvQURbzGj0j4O1jay2jHM6z','2019-09-23 09:57:07','2019-11-19 15:31:59','#SGDuong',NULL,0.00,24,5,20),
	(37,'Pham Thi Uyen nhung','phamthiuyennhung@gmail.com','$2y$10$gEJgBXrfiFEXme2pFCsdBeYuDtrnQdtPbFCaNYFsfSEZcny7djIFy','0849734892',1,'48s4GMK206DmVLiLftqmJWpq2KgBidDMuoLvhNfJZevI1qWU6jQ8T43XxRrQ','2019-09-23 10:32:48','2020-03-30 12:56:25','reushop-001',NULL,0.00,29,2,5),
	(38,'Nguyễn Việt Anh','anhnguyen.rai@gmail.com','$2y$10$6Y8KrLG6RtR2MMwGuWc2JeQJzWUFr9MJMW1sXWEACztNXbdEdxEH.','0946545394',1,'eNvgex7ECWgpglJQzJ9ell1KAzcQHchmDt6IFiFFVd8S51b5KHLbzYmI42iJ','2019-09-23 10:57:19','2020-03-27 14:45:21','vanh-001',NULL,0.00,29,2,20),
	(39,'NGUYỄN THỊ THÙY VI','nguyenthithuyvi0212@gmail.com','$2y$10$FK9xuGx9i71kHiE8B2VcCeAzgyy2YtDFa17NJX.6PjcljHvoAJARG','0937900033',1,'ISwEvnXIyfBBPkRyAMK24FkZPWk8V1Ej47NiSL5pq0YjBqtJG0Xl1uWa66U6','2019-09-23 11:12:18','2020-03-30 12:56:32','thuyvi-001',NULL,0.00,29,2,5),
	(40,'Lưu Quang Dũng','Dungpiter3181993@gmail.com','$2y$10$rFCDY.kLpB/gxrg/bdxVYu6dGVJBjNOe6yiIoCOQEz.E4.5k7.rDO','0936934356',1,'Tqo55NRRFu8lYaZnKOG3s6d0F3l8pR260U73wvpocPPt5x0vVrKy10m9zagi','2019-09-23 12:46:48','2020-03-31 16:36:06','DungBN-3',NULL,0.00,4,4,5),
	(41,'Trịnh Thu Linh','calisalon91@gmail.com','$2y$10$.0XcsWm7.EYHblhTswJ/1.88mp2uIh0KJBF3mOnaOv1ubnCojwL.i','0978943259',1,'haDyaxCrTxPuxkL7fHz3ap43GZeSsi7u4tmXYi1BNcQ2MAhAZBHOoagtsxtr','2019-09-23 12:59:42','2019-11-19 15:34:44','HSLinh91',NULL,0.00,24,3,20),
	(42,'Uyen229','vivienbee265@gmail.com','$2y$10$OORGlhX8msFTqctHHZ6rvuOQOb/aGWZtnTuTfdFntANNWhvIIjZz.','0368661996',1,'IiQ42Vt9OH98XzoJ5jxWiS7NIaiUW0DRaaDPssUqLED3H6kGOtsRNh6ZzqCT','2019-09-23 15:46:07','2020-03-20 18:08:41','uyen229-3',NULL,0.00,4,2,20),
	(43,'Ly','hathilymuny@gmail.com','$2y$10$/COcIAa1sZuG8I.BZQpDfuTJV1Ut3xPZ.NDeebxA.dJ37s.XbdQqK','0965973064',1,'vZk30XbUjcZepvRlVqudanQvU3H2L9LVYwkMSg23dO6x8iGj6WeJCfVi8V1F','2019-09-23 17:42:14','2020-03-30 12:56:39','DDLYHA-001',NULL,0.00,29,5,5),
	(44,'nguyễn đức toàn','andreswilliams593@gmail.com','$2y$10$TpN1o25vgPjkZCZgzqyqK.KOk9JoL7Zv6geIBr8wXIjAC6W/EMXre','0942501113',1,'buhZRcWkx14Sz2vCfUWNr6zrr8rcTkkdcibStZMbalxcGF3ySwet7j4X5J53','2019-09-23 22:21:17','2020-03-27 14:45:10','toanship-001',NULL,0.00,29,2,20),
	(45,'Dương Thị Nam','duongnam96tn@gmail.com','$2y$10$OVIqxqbQA5hPDG9bQ2wde.3DDlKKZsf27jZYkwuYblhUTcIeqpgni','0375639375',1,'xn9RhJdABoNArVAvfCEfRD4wZVDkHjFLYOad2s0nv03qn9Q1tEox85BwQY5c','2019-09-23 22:33:48','2020-04-01 11:45:34','DDduongnam-001',NULL,0.00,29,5,20),
	(46,'Pham Thu Ngan','blackshark0708@yahoo.com','$2y$10$UHt.ZWO5p6/h1.FTRda3fOboH0DHR.ktTrVtLG/j.Gc.oyCTcgmva','0983830001',1,NULL,'2019-09-24 08:23:19','2020-03-27 14:45:00','nganbe-001',NULL,0.00,29,2,5),
	(47,'Lê Long Hải','llh393939@gmail.com','$2y$10$jtjh9hAGqyMG1C7bMMa.xejHE8PvL60b.0y5QQtwcl9vzdAcAswHi','0968794926',1,'cGCRSlsFYP1aSNTgxRfesLLA0m7CtonKMDZg4zdQCteWE4NqdXSemrKqJedg','2019-09-24 09:42:45','2020-04-04 14:43:15','LLH510-04',NULL,0.00,15,2,5),
	(48,'nguyen ha','nguyenhalibra91@gmail.com','$2y$10$zc8E8hmMGlpzu6VuMJ5EO.I1f9dKaZgG81O/MZvKvfrOGYMj7aeH2','0867171001',1,'34Az6mcNncAmR9nbVRGan5HYRMyl40DyBZWEUh8PyxG1lg2JKi2rzKLafEIt','2019-09-24 10:20:43','2019-09-24 10:33:13',NULL,NULL,NULL,NULL,NULL,NULL),
	(49,'Duc Truong Tuan','ducvatgia68@gmail.com','$2y$10$PecK96PMZ7Dgz5Ekh/vAGOIhG3IitJGLPvFr8rDUypqfBZfL8m4Bi','0904779663',1,'GhIvXblZt2E4jFB2qqu1aQ97p3zx8AlaGv53m7zm7B8PEnIqzJpcFJusGatw','2019-09-24 12:07:19','2020-03-27 14:48:52','DDDUCCO-001',NULL,0.00,29,5,20),
	(50,'thuthao.vn','lekhacnhu@hotmail.com','$2y$10$Ix.EVJcwLP0Y6qeBW2zA8ObPFgn1llIfr.MsmktyEPQDp212WV21y','0977097135',1,'7GQSL7uOTo4hbCZwhlg6FAe4ejkQvt0NFgDGwQseu5NLg4EDvALVm2bVa4Ot','2019-09-24 13:54:00','2019-11-05 14:22:44','thaobg',NULL,0.00,NULL,2,NULL),
	(51,'Cấn Trần Ngọc Vũ','cantranngocvu@gmail.com','$2y$10$q/Oq/TI0GWs6FU5la/cIwejXsxBUpRAW6xyYj5FlXjpAmOul2SxWm','0788888259',1,'yP15CaRtfU6Vni73a16idqJg2Bh87EbeiYfnNwJcLkxo17UHisQ8VnOOBx5X','2019-09-24 14:20:17','2020-03-30 12:56:56','HDVINCENT-001',NULL,0.00,29,4,5),
	(52,'Nguyen Kim Chi','kimchi19012001@gmail.com','$2y$10$Ja9VudAby6hEy6e/UeSxAugcejunVBRd5qcEuWFUkcUqN41bikL0a','0904633443',1,'m3HksCsvtR4cIrdhfRFVu7MgoVQBrIl5UiQtQZJxvKACV7LcEumOoFjMKAKx','2019-09-24 15:57:56','2019-12-26 12:29:30','hdchistop-3',NULL,0.00,4,4,20),
	(53,'trengtreng','tranght.yec@gmail.com','$2y$10$FaciZY8gkpaU1r2Zgga1U.9k44jcYJs3BMiYEpDJ1wxXKxfFD/7US','0888941295',1,'bRsLotM5VaNRDr9cwj6zzhUb166B3xh4UnUBL5Jbfgq2JcEWeuTLK9ufz4CI','2019-09-24 18:23:05','2020-03-30 12:57:03','treng-001',NULL,16000.00,29,2,20),
	(54,'bùi phương uyên','phuonguyen19f1@gmail.com','$2y$10$tkNo3R79umlzxh1IfByviOv9mrFp7uS4iW3JGbAr1e9ClK.xvUN/2','0983366899',1,NULL,'2019-09-24 19:07:12','2019-09-24 19:07:57',NULL,NULL,NULL,NULL,NULL,NULL),
	(55,'Lý Từ Ý','lytuy87@yahoo.com','$2y$10$TOrLiGP3iCqgLRUZgclvU.mOWWjUB2YZwD7C6bS6NlweaiXBUXBiW','0904159804',1,NULL,'2019-09-24 22:49:06','2020-03-30 12:57:10','SGY-001',NULL,0.00,29,5,20),
	(56,'Hiệp Y','ceo.giapvanhiep@gmail.com','$2y$10$4/Xhfp3DO1Lyqa0v.hOdVOFkd.XknFjl1lMPLYSa1/9K6cEzQrpoW','0356981891',1,'kHfakhf0qj0GwnLDL3FRYXsjNG3s4uCHaUHa0gNooDHn86vMhwDLTA3unCRK','2019-09-25 11:59:59','2020-03-30 12:57:16','hiep91-001',NULL,0.00,29,2,5),
	(57,'Lý Mỹ Linh','mylinhly93@gmail.com','$2y$10$rnGB/oEBUj7rn42FNETwQOQ.6rBZapeXhXYeHSTcP89kE9qGT6x4O','0795715591',1,'bNSbjdzBnXYD76KDqUotCZqhV4yL3wafLoBiCJGEEE0LNArAxgPz56fR3Qsp','2019-09-25 17:04:34','2020-03-30 12:57:23','#SGMyLinh-001',NULL,0.00,29,5,20),
	(58,'Phạm Ngọc Việt','phamviethrm@gmail.com','$2y$10$ikM2YXMbbk.DhB7CV2QJUuu38fjAlxgQ7c0iXM8B4dEGaOUSeprv2','0969188406',1,NULL,'2019-09-26 11:15:00','2020-03-30 12:57:29','HDVietHRM-001',NULL,0.00,29,4,20),
	(59,'lê thu trang','tranglt.fnc@gmail.com','$2y$10$2kyvJqAlHkHzyHFwHCgWKOvIVQx0ncQ2E3GyGhZsUuRuXPE0A1e3.','0982178136',1,'HlbvjPwx0f5rm4DFGcHYiRg9WZU0YFF0Ei36OL0ZTJWiO5NYrpfQWlhd4dOJ','2019-09-26 11:21:35','2019-11-19 10:26:15','LTTRANG-3',NULL,0.00,4,2,20),
	(60,'ngocbichgem','donggiangvietnam47@gmail.com','$2y$10$mjDFyRbrJh9pUzXB7JTnFe30GHeby8WaA84phUU52aaL1MoYdlllm','0972753581',1,'V6CAPhaXYlozexcMawkFJqBovuGv6oIySACD3VvCgqSuAuqTA2ksjQerIFqo','2019-09-26 13:55:44','2019-11-19 10:27:40','HDbichgem',NULL,0.00,24,4,20),
	(61,'Nguyễn Lan Anh','lanhanhzo19@gmail.com','$2y$10$n4Fgu35YLmWr29UWr3oZMur6E.Nj5cia/Ozzq07x58LLae4.a2FN.','0948052296',1,'qcW2FRnMSpCEosJ4vEZMbJ5tUNg2hxpOFhZU5bP5zhs9boqHW77B2j9uQ4uB','2019-09-26 17:14:08','2019-12-13 12:50:19','bon99',NULL,0.00,24,2,5),
	(62,'Phạm Công Duy','Phduy198@gmail.com','$2y$10$MMIkFFmgpvk0MB/1V7GibOh/mt2/U0L80QnhT3Zn7Ga2ggVFFqFka','0359722198',1,'eajSFZd3f3BGV1Mw5k8iWTdDDOxHA75QwzDyluyEGZ8vafNuAxAExHNp19aA','2019-09-26 17:29:29','2020-03-27 14:44:37','duy98-001',NULL,0.00,29,2,5),
	(63,'Đỗ Mạnh Đức','plav.socks@gmail.com','$2y$10$Rh8tB3/283u5nB3c42vnB.bmEcf9oiORoLxs7M/VTpVkX9ZrK7NzS','0888141993',1,'IxxZY6lvUzSTC63DYstfUjMNp2EvdhvSta7L1A4tysPJ6s9U8xQA0gY5zqOD','2019-09-26 17:48:49','2019-12-13 12:50:27','#Ductat',1,16000.00,4,2,5),
	(64,'Thu Huyền','thuhuyen2109hd@gmail.com','$2y$10$TjKFSCM7ENRdJEI/CGIEuejloKVeKLxDEjqXJAwzMEdLVe6aG4nu.','0837767662',1,'cBcntUpy33VG3evOBmtiC1jP3HYNcpsU7cpOy7JRgpMm8rDcuKbon5c8hWyj','2019-09-26 17:51:36','2020-03-02 15:19:00','HDTHUHUYEN-3',NULL,0.00,4,4,5),
	(65,'Vu Duc Tung','vuductungktqd@Gmail.com','$2y$10$fZukNJyQo9kNOYK6NHImWOabvFP/S9S7rjq2OQyBA.OkHYePbIUWe','0975149612',1,'vJeaJNhmYBpMPauROPewtMDQxNezx0gcNgBZAjPqFVxVmXbon4ktTmqcFVXO','2019-09-27 08:48:37','2019-11-26 09:29:30','#HDTungkk',1,15000.00,24,4,20),
	(66,'Thùy Linh','xiaoling3010@gmail.com','$2y$10$KLY9rAKoGaAAdIBjH8HB3OTo9poditCdF4oMjtDIFcGK/WeVF1t/W','0914423000',1,'ZHewNIL4IAr0U9Iu2KaAAXCMp9mnZrhSoBWqKILV7bQliumOgnOSSrfNUgHv','2019-09-27 12:00:06','2019-11-04 11:07:33',NULL,NULL,NULL,NULL,NULL,NULL),
	(67,'thang','wwluffy96ww@gmail.com','$2y$10$Knqa3aoWCZTrI/41FuFZdu1RE1cQbv8xqFgowIT1XlxD.lC0DuRPO','0376803292',1,'v0UAtsKQIZBEax9Btq1AK3xfr5Xe9xOKZYjmCYFwDEzDrxDbw0qEduNH5zmE','2019-09-27 12:15:33','2019-12-13 12:50:56','HSKAI',NULL,0.00,24,3,5),
	(68,'Telephone Number','taquang22@gmail.com','$2y$10$7hPkLVvpZ1TGGBUIRgAqf.srlz0ZIp1iuEhmvxWVi5Brb.7C9Bfq2','02210665275',1,'pn2nANNVFtlt81iNfjGWbUhd0J0Hkr6Pk8w4XuPj8YByQSUQxiL5APjRzWMN','2019-09-27 13:07:10','2019-09-27 13:07:10',NULL,NULL,NULL,NULL,NULL,NULL),
	(69,'uyen phuong','uyenphuog262@gmail.com','$2y$10$Z04Jbl0DxlCai2grmdHdWO.GbggHQ5tQ8dAVGkYBrPMx6fg8Ac/yK','0905132728',1,'kL4uawkXtXe36ZS44nfhKdoRBlfSQdRU0QLLM6PS4hDXNgapMOs1ZV55kQlC','2019-09-28 10:00:14','2020-03-30 12:57:35','sgphuong-001',2,0.00,29,5,5),
	(70,'tuấn anh','tuananh.ttba.1108@gmail.com','$2y$10$Fu.WaS/OUkucsALC5pHiu.kMiYjB/nPafpUFcLnTy5zcxtzV0CnKC','0971890998',0,'mO5RgrGPz5hUfDz7xNQrJEHdz8vPmWV2xZDHr0fDGcU7w5kPytjzVUCzfyzB','2019-09-28 16:08:07','2019-12-06 11:47:17','TUANANH',NULL,0.00,NULL,2,NULL),
	(71,'văn trường','truonghainghinmot@gmail.com','$2y$10$WqTndkhFpzzRZPRrRlHKzOCU3Z5Zb9i79EbCImtTBzFhlMXNYpgIm','0923628314',0,'AM8sDW8BBDLCpupA76U8K4jSs5dwF6nmKmm9D4Fdkwdx9OTPInqulCuDJM7O','2019-09-28 16:24:17','2019-12-21 17:32:30','truongkho',NULL,0.00,NULL,2,NULL),
	(72,'thảo nguyễn','nguyenphuongthao230590@gmail.com','$2y$10$gt/oHoCY9YODCqGculQPqu8IO2CWDvKQPA4cjzY1sdznHqYA3iJWi','0947306603',1,'YUdgyFjdnmWzEvgRjI0Q8F3sN4gGp85lHa040Yp2Ox4PECvlR1iYyHquRsoT','2019-09-30 16:11:24','2019-11-19 15:34:29','#sgduoimo',NULL,0.00,24,5,5),
	(73,'Hoàng Xuân Thu','thuden3721@gmail.com','$2y$10$.mttrW6VueHW5sON89Pmau8KNdQSJd9cqni1astI8N3eQCV3ziBGa','0912488882',1,'ICnmpknemRtme0mxLKmCBN9Ua6220SAtOtqjBe2SgLs8O0bmwjAWIMANQguy','2019-10-01 14:42:05','2019-11-18 08:29:10','chiThu',NULL,0.00,4,2,20),
	(74,'Trần Thị Phương','Myt.alone98@gmail.com','$2y$10$35UltRApxwYgjds4wCuw.e33SOJIBDr5WXBtjJkP9HwO/ED.I6Xoa','0904039077',1,'BAdJfUBT7Gn325vOP0gCZbOUTNWCBz51aEg95n6QucNLJDnPrteXo25qVrPB','2019-10-01 16:37:57','2020-03-30 12:57:42','hdbang77-001',NULL,0.00,29,4,20),
	(75,'Dung','phandung.hlu@gmail.com','$2y$10$U6tf3FzN41Fzy7dsIlRbdeLSHx3KWju29Zd5s..QOTFOOq9rhLDB.','0358189540',1,'v1par2JeUwZWii6cdptOG17kDSqX2OYktmumjjrH3Mhj3zXUMDmH2fe2nbHN','2019-10-02 09:34:09','2019-11-18 08:28:44','Dung03-3',NULL,0.00,4,2,20),
	(76,'Đàm Hải Nam','damhainam2886@gmail.com','$2y$10$PDAsDkYw2mxF4ZVjYtAWEuBhEy/E74UN/FMqlA37HlHMnlXjLoZOq','0905062886',1,'JqOsQqjYrUbGognGDEAxeVEt8Rj3q5TyfsZFyHqXZiYrGxx3hYMGYZtutDtR','2019-10-02 09:50:16','2020-03-30 12:57:50','HDHAINAM-001',NULL,0.00,29,4,20),
	(77,'Vũ Minh Tú','minhtu.vuminh@gmail.com','$2y$10$anTZ6MvEXfXOiG29ORi7jOJVlcOX7nvrCruG6kx2RXL/FvBW61mwi','0866981198',1,'WC2FPE7C5WyWfzEmdPTzpZg93xxHEGGboguNaMS5YfTMNmRpt8Z0dN1i3R6Z','2019-10-02 09:58:39','2020-03-30 12:58:00','HDMinhTu-001..',2,0.00,29,4,5),
	(78,'Nguyễn Thị Thúy Vân','nguyenthithuyvan@gmail.com','$2y$10$Z.MRrUda1o7grLjxaeZ49Our/0AIjgqIHII9yf68.kWrTyA//mT3u','0904798444',1,'rmS2fkS0WLC6F6yf9Tx70b3Awg92WQMZXxFuqB4VGH1UNfjKuLqpSHFojMkP','2019-10-02 15:09:08','2019-11-18 08:28:31','HDTHUYVAN-3',NULL,0.00,4,4,20),
	(79,'Quân Nến','Quannen@gmail.com','$2y$10$Ga0DihdJlFEmbDvZgrQDU.3.iHLe4ehqpEXh1Vx1X4kUAtm8bbJpi','0974821967',1,'SJHKDgxXOxFVp3wm0v2FgFSzfTrCRTJWA6L2exrc9VJLcaqidt0Y3ExJEpiN','2019-10-02 16:36:33','2020-02-08 09:55:20','DDQuanNen',NULL,0.00,4,5,NULL),
	(80,'Lê Tuấn','letuan@gmail.com','$2y$10$NeVmK.el5mAxsRgHI.omhuqLTLz65bMrC/SFCMI1R1.2VLcm8zjM.','0978580096',1,'7jHKP08BmhYmMmSMdY7q2KjTemZZgsiQEtuNHIy8oajL5iDxmPIOal7zAS26','2019-10-03 15:58:10','2019-11-19 09:32:37','HDLeTuan',NULL,0.00,24,4,5),
	(81,'Ba Ha','Bephathanh.vn@gmail.com','$2y$10$ry6aSnSla1NhziKI3cGqFO879tzz9RI/uvzEVgT6/SfnOtnf2VXBS','0385356116',1,'DNQ7ihpXho4ORkNcBKcAhKlcXUTNj6YBTOQojnEYzkM2QfuJvhvns33vlafL','2019-10-03 16:01:36','2019-11-18 08:28:11','HDBaHa-3',NULL,0.00,4,4,5),
	(82,'Nguyễn Phương Linh','p.linh1901@gmail.com','$2y$10$FvNfym51eBaWoV5fXTal0ukx0pDvwys5yrOLsIi/b4vLlgc5ifiM.','0913354231',1,'IOHEKIe6euWCyEa3BFuTm8VkUeQaSz27BMiDCxj5v3NPC8zympK1P0QWaiRs','2019-10-03 16:06:40','2020-03-27 14:44:24','plinh1901-001',NULL,0.00,29,2,5),
	(83,'Nguyễn Văn Dũng','dungconp1@gmail.com','$2y$10$wrjE5oVC5dATIT5A2ZBrB.jdD.WZlwM5Y.Uh0fEXC.8bwEgpqz4xG','0902220370',1,'3LXYad1QU986gqr6tnuHo4Y33a2nspEgXM1LlswG3PQCZLTAP3IT80djW3IT','2019-10-04 22:22:09','2019-11-19 10:21:40','#SGDungNg',NULL,0.00,24,5,5),
	(84,'Huyền Ngọc','kunny147@gmail.com','$2y$10$7EkJIlWIToKHqupEXOkV3ewIzCkNgNxHAzshxYn4ON7CMjhJLZPAq','0836688877',1,'iF6Ih5EShjhErSUFo2yAtr0W0Y9XHZpzuIPPcvILN3VF4ABHpeQZSPW2Uyfe','2019-10-05 15:25:35','2020-03-30 12:58:09','DDKUNNY-001',NULL,0.00,29,5,5),
	(85,'NGUYỄN MẠNH CƯỜNG','mynghedongnama@gmail.com','$2y$10$r.4D34OT96oGZubkCeaizO0jPtCcGfQB80./Km9QIIFLicYkntA..','0902109229',1,'NP6Q1QKRhxbNmmUE4G3NAQRa4t9LYaeJ6dLHYOnYnRyKl6tpiGhauh2N0q2V','2019-10-06 14:58:19','2019-11-19 15:34:17','#HDCuong626..',2,19000.00,24,4,20),
	(86,'Nguyễn Đăng Nghĩa','nguyendangnghia2020@gmail.com','$2y$10$5nLNoVJ.1Jua2taOnRTfd.ytYLH4sLOXfVNIqVoa1SjkeGdWpKVni','0368057798',1,'T2OrLUrFBcFa5hoNWS09ReGz3abzuMec2dezSv65HdbaNjjzCf6XmYHUBePR','2019-10-07 12:36:39','2020-04-03 14:16:15','#SGNGHIA-3',NULL,0.00,4,5,20),
	(87,'Nguyễn Thị Thuỷ','thuy.ella@gmail.com','$2y$10$i032NXpXPkm9Cqk2LFlfEeZ2ijaSrHDQVYnCJF.HLWAiQuB1LS9bi','0905902901',1,NULL,'2019-10-07 15:25:45','2019-10-31 10:46:19',NULL,1,0.00,15,NULL,NULL),
	(88,'Thuyella2510','thudory0708@gmail.com','$2y$10$E/dv4Z5guLnGUqIu.IeT.uXWQsyJKuXkLuZc7KqGcY1nxlpVuZRde','0935826501',1,'96hH8aQwC7hxSFjFclhIuX5BeqVamUsE7BoP0a5oaQsfN3I1PO2hQxnkWRDv','2019-10-07 16:11:16','2020-03-30 12:58:25','THUYDN-001',1,0.00,29,2,20),
	(89,'khang bin','khangbin1989@gmail.com','$2y$10$n6f2AinquBqeeNDr8396r.J90C0donsmOYdIQ8GZBbZq3hPdZHTNm','0981063025',1,NULL,'2019-10-08 13:37:59','2019-11-19 15:34:07','#khangbin',0,17000.00,24,3,20),
	(90,'Nguyễn Tiến Trung','trungnguyentien85@gmail.com','$2y$10$exPwsOyb.kuJXmN50TNfo.SKmnHRjtmnExJ.CE.MfF1IurmSrTpy6','0973626643',1,'p9jiac21xSXqmJXgllLVXSercRIhcE3A5HEbzF6VBx1jvz4uTTu2j3t2zEei','2019-10-08 15:37:26','2020-01-31 10:07:45','#DDTrung85',0,0.00,24,2,5),
	(91,'Bùi minh đức','ducqueenkts@hmail.com','$2y$10$V8t5biFBrXEw1l4K1cHol.kGJsJG0NdnVQ3o/TijnHYjyp4XhpPEG','0984311880',1,NULL,'2019-10-09 08:06:24','2019-10-09 08:06:24',NULL,NULL,NULL,NULL,NULL,NULL),
	(92,'lien ngoc','tuyet.kt14@gmail.com','$2y$10$aWCFDPOJzKNECHnEJyyg2.kH4eyIOuasLJ72EuKwk00SjexeuDklG','0914856824',1,'TqfCObNczgQ9oJFbpWRekLjmx87nOqzWcaxmMWtt2edDrUFAkuyq7WDZMgbr','2019-10-09 10:24:29','2019-12-13 12:51:30','HSLienNgoc',NULL,0.00,24,3,5),
	(93,'PHAN THI MINH NGUYET','phanthiminh.nguyet@yahoo.com.vn','$2y$10$U87CUhvgKfi4USNv5nb8k.fBhtU7YR4lQ40YS.lbZPwwBs7BMBViq','0988086531',1,'XRaiP6u9emGOgPcepiDcgfdybqW5V8FhvBOzW5PqSrajfPTT5eDgS6SMxm1o','2019-10-09 11:17:23','2019-12-19 19:29:03','#HDNguyetBS',1,14000.00,24,4,20),
	(94,'nguyễn thị nhung','nhungnguyen9796@gmail.com','$2y$10$a53kd98z3Rl4N0JMnRfmBOzHsoHJ5ypRxbwXHXGejwtQbmDc7TMp6','0976095412',1,'PcvzO8ltTSWRYvZhCFfpEv90lq0MwN4YTr6S4V5oZZdb0seSf8uGM3VAwSWz','2019-10-09 11:19:17','2020-03-11 14:29:21','NTN-3',NULL,0.00,4,2,5),
	(95,'Nguyễn Thu Hương','thuhuong90vn@gmail.com','$2y$10$FfS6CdfZc9cHvmbGoyevjuYhs7wVhdo60WN.ZnDH81wmzWLH5mOKS','0906662691',1,NULL,'2019-10-09 15:51:35','2019-10-09 15:51:35',NULL,NULL,NULL,NULL,NULL,NULL),
	(96,'thanhbg2404','thaobg2405@gmail.com','$2y$10$nPiMIWBRGfvhJZAo4e.emuaSVPumlfe3dIlXIO1MVWUI6wt0ejCP6','0988427732',1,'HIYrQIJKsjJRdD93jKntvZ4QNkMOCjPyQCupa4Sa2dn94Htt9C39emM0l7VY','2019-10-09 16:36:47','2019-12-13 12:51:39','thangbg-3',NULL,0.00,4,2,5),
	(97,'thuyquynhhn','quynh.meiroom@gmail.com','$2y$10$uzoy1l6RIOiludL2XMSpkOgf6.qQgcmsCB2uCWm9Kbxfdqy/yXmoe','0343034621',1,'IoL8DuDeNlxSvIoTgA532RvkoJ13a3zLjDFYayuq8GzFxqHpzgGWtdRoxDSy','2019-10-10 08:59:18','2020-03-02 15:59:22','#HDBQ-3',NULL,15000.00,4,4,5),
	(98,'Lê Thuỳ Dương','thuyduongle2507@gmail.com','$2y$10$kHwhjE6iG78mMRBeX.wJ.eBObHX4Fav8OcYjVqQCnzrLslfwm2/pS','0359636567',1,'7m2ZdWG5gBR5mEpvL4HwUxDdY5hjln5aGhIpsbJDvJGmH1EVbuefBhcE2Y84','2019-10-10 10:17:56','2020-03-30 12:58:37','HDLeDuong-001',NULL,0.00,29,4,20),
	(99,'ĐINH THỊ HIỀN','hoangdvlts@gmail.com','$2y$10$2JdOBcxLR6Zt//d0Sj27CeFPePCgN/pea10qJ3My0F7Eb8neyvjSS','0332161992',1,'8kAzOsheemZKEOsl5dcAgEC8pihJhCHCsFxMFm9Zrs4xl2N198PcJZ54Ks97','2019-10-10 10:46:41','2019-12-13 12:51:47','Damitu',NULL,0.00,24,2,5),
	(100,'Tuvan','o0twan0o@gmail.com','$2y$10$NuQMsJH2wQgDSAR34JbOm.LLX3ubX.PH9pyTyUo2FF3C5NZq8JHLa','0386770439',1,'7mLCm1iQffdCMN1lTk4pUoOmBx59K8i4K12awTya4jxWCMnpAxsm8dOnNFwj','2019-10-10 12:13:17','2019-11-18 08:26:28','SGTUVAN-3',NULL,0.00,4,5,20),
	(101,'Sunny','anh.nguyenngoc189@gmail.com','$2y$10$s7h7H4w9UghVsPhgcOPuceJCtXUzwiOrnFcjTxfTGvRN8OGNCkpH.','0936343863',1,NULL,'2019-10-10 14:29:22','2019-12-13 12:51:52','Sunny',NULL,0.00,NULL,2,5),
	(102,'trinh quyet thang','trungmuoi89@gmail.com','$2y$10$gLHagFEvF8Ytr1QR.WHehOJjoj9hZBdp2BbOrMRUV3jy9Kzcc4S3m','0966782486',1,'oGxBCKkN5lPcpUDvdjqe5oD2DWQ2qst2Op9dso5JFgKM6rT0IMchLcwnXuhR','2019-10-10 14:42:54','2019-12-13 12:51:56','Thang89-3',NULL,0.00,4,2,5),
	(103,'Giavu','vanphongtubaogiavu@gmail.com','$2y$10$HXmJsqck6qWshpvvaI4KCujcIunEZbRfAX1LyXbBJpdgxwqtt2W3W','0906226926',1,'7Bz3i5t8wnOLiNoUd3epT5rkdhMLu5Q91d1DsqRoBm7tlWxy4PqC6l0uKgXm','2019-10-10 15:22:36','2019-11-26 13:54:02','#HDGiaVu-3',1,15000.00,4,4,5),
	(104,'an.nguyen96','liingliing1996@gmail.com','$2y$10$OE7CU/5kb57l2TQ82qin6ebxfdUVETcgKogDiy2EXjqoyd/atlLhO','0965467103',1,NULL,'2019-10-10 20:57:29','2019-12-13 12:52:00','an96-3',NULL,0.00,4,2,5),
	(105,'Thái An','thaian391999@gmail.com','$2y$10$OCNKD1kWMgYCtqnVu7HMhOWwPmdWaExdAdbHAVakIP3m7CD3SHX7u','0374399986',1,'AlrNzcwnsv25yKqnB0D24AmRozd2oULkYLeyjJZDEBW7YGSG9rQbYhisgWsR','2019-10-11 10:26:57','2020-03-30 12:58:44','hsan99-001',NULL,0.00,29,3,5),
	(106,'Nga','tuxaxan@gmail.com','$2y$10$X4fF7Dxxufvb5DI.9RUyaunjMCIpypSDAEn.KjDacJ5P4T47wPh8a','0589296717',1,'UJa7pDQOxELstuejJBQ3oOK6tawkQSOhtHRAQfknUe2yi5il9S0DGGPBkXtp','2019-10-11 16:08:53','2019-11-08 16:47:34',NULL,NULL,0.00,NULL,5,NULL),
	(107,'Lương Ngọc Trâm Anh','tramanh060195@gmail.com','$2y$10$kJOLi6Rpu7.cJCRh9OSUPuYs.VujNBioFKVxUw14/uDQw5IEK/Rk.','0931831858',1,'zJUCEDucdxlrGFt3BKDLB0frGnGK6daWPHoZ13QZcF4CAnMt9zEj8DlJdc3A','2019-10-11 16:14:53','2019-12-13 12:52:13','#SGTramAnh-3',NULL,0.00,4,5,5),
	(108,'Nguyen Nga','ctfxpro@gmail.com','$2y$10$LEjI60z0YNDU5bGKjNHlqe847wVV8jch1fo1CUuZmV9mqjfGQWfpe','0377857478',1,'jAISmK98Jx5tsQiivIAgma3wtVTsB7mAVVdbM5o7aZdcUwpQ0QC1BK3VC7dr','2019-10-11 17:07:03','2019-12-07 10:54:26','SGNGA',NULL,0.00,24,5,NULL),
	(109,'Yến Đỗ','yendokids@gmail.com','$2y$10$cD8/93ld7OSEP5Fev/5QKefUdFmACZq/2DtgXu0fUxICL7r0pKRLi','0962955330',1,'mB1KDDGI2m8EePFKwhSEcpFlf0nzKPoQ1vrY84LiTL0leamMhnjerfDffOu4','2019-10-12 13:45:16','2019-11-19 15:33:44','hdyendo',NULL,0.00,24,4,20),
	(110,'SaoMai','maiktkh@gmail.com','$2y$10$RiUcBXzbCE1/faWKP2D7OuP79ZXrxJfkaP6VTZ53FB4KpYpi1ghDK','0922214882',1,'GAax5KljCS5HaRrt0JnZtkid3CQOM5GJQyjCBNxWxU7wRZMuqsmQZj9NTHgn','2019-10-12 17:23:34','2019-11-26 13:53:55','#saomai-3',1,13000.00,4,2,20),
	(111,'doãn thị hải','haidoan153@gmail.com','$2y$10$Z8fQKr4g5imWkkc6as.jruQ8i5rGdEyjx5bkUSAyV.XcZoUfSLnL.','0385433902',1,NULL,'2019-10-13 15:34:49','2019-10-13 15:34:49',NULL,NULL,NULL,NULL,NULL,NULL),
	(112,'Lê Văn Bình','vanbinh87@gmail.com','$2y$10$XckwmbGFG4LaXSUvKghCTuHsVZu80AJbeniMPX0GwWLSNZrh/l79a','0985560837',1,'hVUdSAek8zhKMOWZnaVHbesuzx5vYPOd08cgUSBk6hvo8rmom6bdnPaAE6OL','2019-10-13 21:58:17','2019-12-13 12:52:16','#sgbinh87-3',NULL,0.00,4,5,5),
	(113,'Nguyễn Bá Đô','nguyenbado1107@gmail.com','$2y$10$nSPxFMRulqjLdlvUPzm5vecqzeX.SwllscHEsJw/RjWrMAmZQz0qu','0865868691',1,'fc7QNiKX39aTKhiMguY8hUlYHUh0fR1kcc3yxFdPXRuoKqWwkZamiw04MMTL','2019-10-14 09:41:07','2019-12-13 12:52:20','bado-3',NULL,0.00,4,2,5),
	(114,'hoai dao','hoaisus@gmail.com','$2y$10$4mY9w8Yp/pJe0OinfpyYGOtCkTUN6IaBabsK.33WTKwgtKXPVxfeS','0934392430',1,'24KfMuTnjrvTiplLtcgizfb81L0AHkV6dHrKBQf7e1opgRnP62xmE1623tve','2019-10-14 10:38:42','2019-12-13 12:52:24','sghoai',NULL,0.00,24,5,5),
	(115,'Phạm Thu Hiền','hienptftu@gmail.com','$2y$10$rbYgeVkhprkB.AZEi9tgDOLFJ5sIynehQNkK2ltEM2qwKRICRCLHq','0914274701',1,NULL,'2019-10-14 14:06:03','2019-11-05 09:55:35',NULL,NULL,0.00,NULL,4,NULL),
	(116,'Bùi Dũng','buidung.work@gmail.com','$2y$10$gGDjNn.OIBdntoONC1.UqOQYWPeyceaejcskze26jpyBRKxaWCTT.','0933333078',1,NULL,'2019-10-14 17:13:04','2019-11-05 09:55:27',NULL,NULL,0.00,NULL,2,NULL),
	(117,'đặng thị sâm','samdia91@gmail.com','$2y$10$ZGlc0r3VwiTofYmgzzWZFOPvWLBmeLoZ918U.KNU4cn0Cct0lBjiy','0779748128',1,'szOant4UmnCKYfioAbvSYSo9lspldpG9f1rbEcVhPOcFxgoJbf3fF3iRTVCJ','2019-10-15 12:29:11','2019-11-19 15:33:28','#SGSAM',1,0.00,24,5,5),
	(118,'Lê Cương','lecuong@gmail.com','$2y$10$LUHKiF1lxWOLdjc9vPDzHuwW6lfpnCft.KE6XTCfwaiz4gS7qDmBS','0947899600',1,'51UZpHuCH2BvhssQ7UcqW8zgPEOCss7q4Sol1DJlgt8fgUkDlUWXiQ2TvIrd','2019-10-15 14:31:34','2019-12-13 12:52:30','#SGLeCuong',NULL,33000.00,24,5,5),
	(119,'Ngminhthu129','ngminhthu129@gmail.com','$2y$10$9WO/tk//NkVvJh7FkzNym.BJZzB5BGDyLmJhEO2eCNtF3TgH6ZhVG','0986090269',1,'UYULvTxyMumk1ElAtQBh5pkjL4GDvcIn5kOCPZRE9ytsYEmcsIEbpgr84Kbh','2019-10-15 18:15:10','2019-12-27 03:02:52','Thu129-3',NULL,0.00,4,2,5),
	(120,'Nguyễn Hồng Anh','n.h.anh93@gmail.com','$2y$10$ONsuBi9s3uYh5pkD2C721OgM.dn.Gfx.sqdmgOfVejsD8FhtlKnDm','0948839288',1,NULL,'2019-10-15 18:41:25','2019-10-15 18:41:25',NULL,NULL,NULL,NULL,NULL,NULL),
	(121,'Hoa mẫu đơn','lethiphuongthanh34567@gmail.com','$2y$10$b0xGtQ7uY0IjjzzGK6HCnO98I.1spQS7Q0lZzOpN/u7vvoqwflsHa','0935513132',1,'LCqdPrxtP1f7ApWAp8MSNBLBPvyl1Y0TvhBlcTmYnvVGaka3UH7OnFpgWcYW','2019-10-16 10:33:51','2019-11-05 09:53:15',NULL,NULL,0.00,NULL,4,NULL),
	(122,'gonnie','nguyenphilong09091994@gmail.com','$2y$10$L9m9bV6orC17dBQwJoLToe36Mwy.N.nbFSJwFeoZgICq9J5/5VCiy','0943891009',1,'KMjQpaKPerZQLBM0NLPiVIKXP1PviTEcb3nxvQkqODOWuo6XZpLikVQupl5s','2019-10-16 11:29:11','2019-11-18 08:24:46','SGLONG-3',NULL,0.00,4,5,20),
	(123,'Đinh Gia Hân','giahandinh2601@gmail.com','$2y$10$sUgRsssjEEmwKUkPxjsT8.W2GlXCKWmBFcDitaHwD83YrMbmmmmO.','0374371341',1,'c8tSuQIFuwiSFJp3RmxA66juoZ3JVHqQPfWAEhWTXagGKhckz7hUAwjuAPJJ','2019-10-17 09:50:20','2019-11-18 08:24:41','HDGiaHan-3',NULL,0.00,4,4,20),
	(124,'Trần Thị Thu Hà','hoasua2988@gmail.com','$2y$10$S.zvMNgFfstKQGQfUrzoYuJBj0nzTdvibEv3/927oXZWvEuFo5D7y','0976323923',1,NULL,'2019-10-18 11:11:27','2019-11-18 08:24:35','HDHaBN',NULL,0.00,4,4,20),
	(125,'Trần Linh CHi','linhchi.un@gmail.com','$2y$10$qIk2dK2AoYdOwzTJ97ixHeztyFs4u8gEwz2MRsF17gFG6dGdXPxHS','0866502392',1,NULL,'2019-10-18 11:56:32','2020-02-03 11:56:12','DDmimi',NULL,0.00,24,5,5),
	(126,'Vũ Văn Hiếu','binhandsome90@gmail.com','$2y$10$8ddGcuK/w9CwY4OC9/zcWudfZq0EtvlkRlQi7sU.m/sHsdWJikVFi','0931224224',1,'OKW8Tir2a08ZUT1ddajHYTbMs08DEti0BLIRiXGfShbtescZikc5VwoYekKe','2019-10-18 14:21:56','2019-11-21 17:01:47','#sghieu',NULL,35000.00,24,5,5),
	(127,'Huỳnh Thị Tuyết Nhi','hoangtuyetnhi411@gmail.com','$2y$10$vO8Ksxph0IeBU9khE/GjmueTGRm9CL/Wu4vLvzDps0EkhSrj1LRD.','0905184039',1,'ROKokGssESolhOsyTc8m1ILbK8bSc6nlhWbZ7WdoQq5GiF4QSoGpWtM1ygLS','2019-10-18 15:45:44','2019-11-26 17:29:23',NULL,NULL,0.00,23,3,NULL),
	(128,'Vũ Thuỳ Dương','vuthuyduong195@gmail.com','$2y$10$Ijo2IUDCzipMPZn8BkJGHeqt3l1dKJOR5crTOa6Wv5q8PKsW97wEy','0394614309',1,'RvFhRr2JUo2YwLnfpjl1oeYwWM1CbIU4Wc4vxvkrzspNLG6m2C0p6rC25sMV','2019-10-18 16:07:30','2019-11-05 09:32:21',NULL,NULL,0.00,NULL,3,NULL),
	(129,'Trương Phương Thanh','nhanmathichcuoi@gmail.com','$2y$10$BdAMF42VK5ggN9oh/mIL6.p4P9m5HjvbxEJffZW9PqI1zkKHqtZiS','0908757911',1,'7iLEHaivGaPhBKYmuxPutIOryxRCB4m2ud93O8NTLLW8pKXiQ86b7dYHphfC','2019-10-20 00:35:07','2019-12-13 12:52:44','SGHANTY-3',NULL,0.00,4,5,5),
	(130,'Thạch Thảo','thachthao2404@gmail.com','$2y$10$tIGZa6qhR9ah633xmYydOuhZfBttSCUG7xi20EmdNLQMUeNrVyW0C','0905738073',1,'DghwlRBk1pkL4rX59O39D7ap9b3nlbHXDjx75UD7eravMpuxusz93EWRZiJY','2019-10-20 17:54:50','2019-11-05 09:32:09',NULL,NULL,0.00,NULL,2,NULL),
	(131,'Đỗ Thảo Nguyên','chunki303@gmail.com','$2y$10$K35en6f0keo7cfmu0HUVMuW0Ej6uCzuyVDNRcaVwEQZEMUUdMhQ6O','0394546668',1,'EUIX8i0E1OX2IieW82Gm9Avdzvd47OcKzgD0koraJzo6t3uJpJD5vZoP9XqL','2019-10-21 09:56:24','2019-11-18 08:20:27','HDchunki-3',NULL,0.00,4,4,20),
	(133,'Lê Tiểu An','antieu34@gmail.com','$2y$10$53iOaVlh6t.4iKwmUcP13OdKTfs0.FM5W234Zj0qdWYYQA62k7VpG','0389070004',1,'QS3nFmddIyHQIPtHV6ebsX9wcSImC3MRES7Eossoa9dkbYInEAcA1BfVHJqB','2019-10-21 10:00:24','2020-03-30 12:58:54','SGAN-001',NULL,0.00,29,5,20),
	(134,'Đức','lazadaein@gmail.com','$2y$10$eBK/RNkS.CBWKoAtt./9yul8CpOtMa8M6e.iBkO1vtpsFb6w1VEiS','0367655029',1,NULL,'2019-10-21 15:45:58','2019-11-05 09:31:22',NULL,NULL,0.00,NULL,4,NULL),
	(135,'Nguyễn Thuỳ Dương','ctkpmn@gmail.com','$2y$10$uCst/FC/suYO6kXdJT5ve.ulzXMIWH9duqm0y/BqfdsDaydylevYS','0384690102',1,'jr0Y1xa3Ggks1Kztxwcypjfl3USDHYhDKzuup2TkUfmHAcpRmQh6ZHZ35wCL','2019-10-21 17:22:08','2020-03-30 12:59:01','HDmina-001',NULL,0.00,29,4,5),
	(136,'Trịnh Thị Cẩm Nhung','camnhunghlu@gmail.com','$2y$10$LkwHs2g1OhetmqD0gm8hn.fpXsR1AOtQmW2PPC7wNcd/DrzJGpexi','0969891699',1,NULL,'2019-10-22 10:28:08','2019-11-05 09:31:03',NULL,NULL,0.00,NULL,4,NULL),
	(137,'Hải Hà','havianh.hn@gmail.com','$2y$10$RpzB/i8djIVaXDoJBXPP/eCEkJeXNE7ZO1scrb3C6AybjYmks9fC.','0912662286',1,'2U28u4eBOH798TsIOSDEoga6jsVhftAQ3dx0jjesu2TIFCoqrGHOkxANiiA3','2019-10-22 14:05:21','2019-11-22 09:54:52','#HDHaiHa.-3',1,15000.00,4,4,20),
	(138,'Trần Vũ Nam','tranvunam@gmail.com','$2y$10$BfZhTbBDBiEVwWoFgeNnc.CWG91PhUWsR5U0dN4DedpYveKlCXdsq','0971226602',1,'rB2zyH0uJVJMy64UYw00R6JBglXXvRLDypHzuOtlyiGG9HaAIojOPE60HyNg','2019-10-22 23:57:17','2019-11-26 12:42:57','nam02',NULL,0.00,24,4,20),
	(139,'Đỗ Lam Ngọc','dolamngoc1998@gmail.com','$2y$10$fuqQlllRjtFJ8i1ktGJvFeKJdtf3B9onaGQg/mTDRzgFz9gImS89q','0945589286',1,'0Etr17tG0ioMyxIJzeChTna6broDUBdTcoeLHCYybSoznMYskTpu1Eq1V0ME','2019-10-23 09:55:59','2019-12-13 12:52:53','ngoc98-3',NULL,0.00,4,2,5),
	(140,'Hoàng Vân','van95ht.ls@gmail.com','$2y$10$Q7.UsKp1NnC8fj/X2XOJgetgEj7i/ErwHtoj/NQYfCEid4/njuxFe','0984420084',1,'pu6p0c2ALjdgzhftlZlLoliP5GDAqRLD2qqL1qmp3aadYc0m6VPAE0E4N1sK','2019-10-23 11:35:39','2020-03-04 16:17:26','HDVanNA',NULL,0.00,24,4,20),
	(141,'Phạm Tú Lệ','tulepham98@gmail.com','$2y$10$eerfDTYolRUG/F5jl8bmteXuUI6fhf/b1d.Ekyj9Ui9kIcl47Xyk2','0339262669',1,'uPrEAZ5NZMtWTGrFDsEFUBl9CPkJE1bxw7rvGaqbNnMEgfXu4pb58crgytVL','2019-10-23 13:09:43','2020-03-30 12:59:07','HDPhamLe-001',NULL,0.00,29,4,5),
	(142,'Hải','thehai.2401@gmail.com','$2y$10$zAYrsJ/PTqwgMIOiFQTO8uEA2reyRGlI7pvwjBaCO6MHC6JgkS3TW','0977797300',1,'QvzyTgKsh3ECdK4fJYi2jTZOcgLdWDsTT0I0dUAzw4U4r4mjXspxPyduLkMx','2019-10-23 15:49:07','2019-11-05 09:29:30',NULL,NULL,0.00,NULL,4,NULL),
	(143,'Bui Phuong Khanh','khanhphuong_udic@yahoo.com.vn','$2y$10$.UXF6VCFgqR8LShaGj9n5.OqNB3zsq0mCY4FvNCOTCkBET.GiUlBm','0972648471',1,'m2LZ6Cx4zMKRbZ6iJGdUHSJVHmVcsftY4XaB9JzMxkiDhiJXznevBpkhY2pE','2019-10-23 16:17:36','2020-04-01 13:38:55','ddkhanhbui-3',NULL,0.00,4,5,20),
	(144,'Lam Tan Tai','ragon1993@gmail.com','$2y$10$vKL4VxOV13HGP6f7fAVCbO7Y03dnu7Vd97m55Hn7joseY.0XywTj2','0328555970',1,NULL,'2019-10-24 09:32:27','2019-10-24 09:35:23',NULL,NULL,NULL,NULL,NULL,NULL),
	(145,'Nguyễn Việt Hưng','viethung.gdd@gmail.com','$2y$10$XbuaiavmyQ9FeJh5u7DQvuZq9QZ8RWnSEm2xE98D6ER4F0nHuSBhK','0966275848',1,'J2PtfKU5eQPAWCzDKb6EP04noBniSb0aIuSYf5Q4518Glb1iWYEYkUNAIo3I','2019-10-24 11:40:06','2019-11-05 09:29:01',NULL,NULL,0.00,NULL,2,NULL),
	(147,'Thi Thu Trang','trangthinh1610@gmail.com','$2y$10$e.0ztLs7Ma9hhASXV7QFIOaeicrLRyFiETcYjQ8bZSpf0dO.0iVxq','0985620584',1,'fdXtxwM4PdwYPtd4kBWDCOhBfRK1hFGsgSQhYMiJy88E06c4xCHH0tNtR3O8','2019-10-24 14:11:29','2020-03-30 12:59:14','tranghp-001',NULL,0.00,29,2,20),
	(148,'Nguyễn kiều trang','nguyentranglc@gmail.com','$2y$10$cOUjTDjbGeNm41SGLyGwlOpX9VUYnKkHMsraidRF7cjlQQCruziKW','0983234767',1,'v8KxenqNJEth39hew81hqxwFVnNzb4QRNoWKX9w0sv563hOSafnn6kRrtH1i','2019-10-24 16:46:38','2020-03-30 12:59:20','#HDTN-001',2,16000.00,29,4,20),
	(149,'Trương Văn Minh','vanminhtruong90@gmail.com','$2y$10$Zidq/V67kB9I9nLgU/WNPOYazif0yaCEgGt6zSau2Q9bgydsA0sMG','0969777703',1,'6Mx81cOjOfuaXR8anPwjkxwcKf3Z7EbyLu0YSR1YMbEnIhqnnQ6GdqywyvWK','2019-10-24 19:03:05','2019-11-05 09:28:23',NULL,NULL,0.00,NULL,4,NULL),
	(150,'Nguyễn Chí Tuấn','tuannc6293@gmail.com','$2y$10$QsNwz.9mUMg5yUkLJiRVQe/HhdidUvj3l0X8Zqbak8W5T53F//RHC','0984424493',1,'fDJD17VbBLv1vVK8v6ul2XDUIjBd3AxjEgbLyJcq7ITDXVZPP3ffY4hh1cqS','2019-10-25 14:43:18','2019-12-10 16:30:10','tuannc-3',NULL,0.00,4,2,20),
	(151,'Đinh Mỹ Hạnh','myhanhnhim@gmail.com','$2y$10$z2sgz.EZrpgeWThpd48E5OdkmH1XbwSMywYov2EcQ1V2khLxtLAsi','0342991997',1,'r69Mnk11kvmLy5tEwxFWbeeHsn5dqDTl2YrIDrbXODn6yoiU6TSg045VzVjK','2019-10-25 14:45:25','2020-03-30 12:59:26','HDMyHanh-001',NULL,0.00,29,4,5),
	(152,'Carol Nguyen','carolnguyen689@gmail.com','$2y$10$Vx3kJ11I6B.WMngh.pTNUuEapR7Wpx/.MsavmMbmmsvVyPPciUgM6','0869036689',1,NULL,'2019-10-25 15:50:54','2019-12-13 12:53:05','Carol-3',NULL,0.00,4,2,5),
	(153,'Đàm Vi Quân','viquandam@gmail.com','$2y$10$eLDWcy/j0Ezerh8fw9uo1eaMrPHCvI3/nYQPLHpBckmPpybDe8YUa','0909131094',1,'erMfVIxQTG1Kn6ZQhyEeRa8os8yAnTgnhdoDiAMgciWJBHQGD4lBhvwUdMnQ','2019-10-25 16:01:33','2019-11-18 08:19:53','SGDamQuan-3',NULL,0.00,4,5,20),
	(154,'Tiên Tiên','titi.thu113@gmail.com','$2y$10$q2ANzwwR6vrkn27plpUY8OC.lRkq8TYsDoGj598yeX2ngrYBvyg1m','0328852507',1,'0zHGoboDQwiaVuMF3GmwQfjEyHyhRhExsqBAgqb1BxqZ8kY2AzOYvSGMBZrR','2019-10-26 01:28:03','2019-11-19 15:32:54','SGTien',NULL,0.00,24,5,20),
	(155,'Nguyễn Dương','Duongnguyen020392@gmail.com','$2y$10$8.kS5Nfwn0hf0iXfD5frCe/rJcFQPV5WJ6ete7eC/NwQ42KK2h6oq','0919483992',1,'Esu0jxkBHWGM6ptAkGsqwEqd2aGchCfOziXCoPE68TiImLWA692Qizea4PNi','2019-10-26 15:48:23','2020-03-30 12:59:38','HDDuongnhi-001',NULL,0.00,29,4,20),
	(156,'Nguyễn Tiến Hiệp','hiepkun1993@gmail.com','$2y$10$D4cWJN/1eMpgpOoj7wYMkezuRHGHr3hKiFm.bSeVIWZ.MsyrlGUuO','0973731293',1,'DSG05MfytEKQDyEH8OLx8euM1RDxpPh4Zy6hdSOncJ9d0ob1RN06Mua821u5','2019-10-26 15:51:44','2020-03-30 12:59:46','#DDHiepKun-001',0,17000.00,29,2,20),
	(157,'Nguyễn Thị Hồng Ngọc','alyssa.lys92@gmail.com','$2y$10$iRRbdxF0f/6BqJVsPqvVtOzj7dgvT.SRhZmeWx1HV2.bmSxbCgYQq','0337933033',1,'SEiLn0clh2HB8eX2IRy3JA79DbGCaYnxLP35ucAQ4wo7hl6BYHMQMysRiq6m','2019-10-27 17:26:44','2019-12-13 12:53:08','Ngocmauve',NULL,0.00,24,2,5),
	(158,'Trần Thảo Ngân','nganngan4444@gmail.com','$2y$10$ywK7VPY0zBUy2Frh0sg25uDpzcs3rC8BkhJgEo6k4UTPQq9jym1LW','0587780996',1,'3q4TxPag5spandDzXeWEF7esx7PIvr3eTkf5aR9Rt5FNB1mLYtGX6XePMren','2019-10-28 11:50:42','2019-11-19 10:27:22','HDThaoNgan',NULL,0.00,24,4,20),
	(159,'Nguyễn Hải Nhi','hainhi160899@gmail.com','$2y$10$e9rVAP2ATB6uTnNgkTv0j.hRCah4znvOfEJgrrxllWdLtrKBtLcNq','0925514091',1,NULL,'2019-10-28 12:52:39','2019-11-05 09:22:30',NULL,NULL,0.00,NULL,4,NULL),
	(160,'thung95','hung56955@gmail.com','$2y$10$aMkTkJui96.7XDeKtEKh7ulPx06Fld0rkHiVljrX19pGkWrYWADXi','0347572425',1,'5ilEAvozI6yptpAauJPayGRJ07KVRHtBMGbWMzUGL6QLkAPvcr6wcxWuvSIU','2019-10-28 14:12:08','2020-01-31 10:06:03','HDThung95',NULL,0.00,24,4,5),
	(161,'Nguyễn Hà Phương','nhphuong.0601@gmail.com','$2y$10$H0R9COyOUPiaxo..g1NhuuVruz6Zg28y2.dM76Vjc2UJ9yOAZxyka','0944838389',1,'UtLr1e5m2KKLGfL5vNCyJtmlwqM38Y8QKU31bXHmpaKGeYpRamTX1GaIWilB','2019-10-28 14:36:08','2020-03-30 12:59:52','hsphuong0601-001',NULL,0.00,29,3,5),
	(162,'Hanh Le','babylazyls@live.com','$2y$10$UA9e.0uGNvUs5JFtHjZLDOsSpASLqA9dRz94XBbP.7EvuyJ67u8zC','0367033177',1,'Zn38nIWY3saOAGNYFgelkeyM8FfZ4NJubGIMuFc5MvLB4irvAOge0xuBhh1j','2019-10-28 19:03:09','2019-11-05 09:21:28',NULL,NULL,0.00,NULL,4,NULL),
	(163,'Trần Ngọc Lan Khanh','tieuloan90@gmail.com','$2y$10$HSxaTfcp77Q0EyXwtKnYrOvkwW5.ClgVbLrYnh2.T7sfKaE8cunhC','0763906215',1,'tPgea1gIwDYywD4dotqjhSmbMCwSfGVVPy4rKDt660cOAv29v62gaV7mw8fY','2019-10-29 05:09:33','2020-03-11 00:36:17','#SGLAKA.-3',1,22000.00,4,5,20),
	(164,'Huong Nhung','Huongnhung1005@gmail.com','$2y$10$y5JMy7xPBKs1YrCWUtGOsOsySiQFFOHXRv/ujQhrLG0Pk3YDdD7rK','0965554586',1,NULL,'2019-10-29 09:33:30','2019-11-05 09:21:22',NULL,NULL,0.00,NULL,4,NULL),
	(165,'Ngô Hoàng anh','hoanganh174202@gmail.com','$2y$10$wRmJ.vJnnEcnEbzdEzRC2OH3xQICuu0MuY9EBGnkrP0SNQyUMZiHq','0372475363',1,'tO9Ntr7Y4yC4TMxXGUymgBbAPGynn2OOunBFJ4v68Wltda0V0vOYjKdQ7or4','2019-10-29 11:16:43','2019-11-19 15:32:48','HDanhdaklak',NULL,0.00,24,4,20),
	(166,'NGUYEN THI LOAN','bacokhotinh24@yahoo.com','$2y$10$2EsDifXAVOYB2U.5pfCJSuqPoGtea8w7CfQUsEDkZa/4kIwkBZF9m','0988612906',1,NULL,'2019-10-30 11:30:14','2019-11-05 09:21:04',NULL,NULL,0.00,NULL,3,NULL),
	(167,'Nguyễn Việt Quang','thanhquangmta@gmail.com','$2y$10$OLSYAYJfQPoByDqQmA9IUOl8RLzxVIiRxz3AEtlcJbN7kxcBMa4cS','0334421869',1,'KvAZ29ew6IashDhQwp3C3wq9dxiG8BWw2LLnAy5UqyCy01Js9SqCQeJBHffZ','2019-10-30 16:44:28','2019-11-18 08:18:50','HSTQUANG-3',NULL,0.00,4,3,20),
	(168,'Thanhquangmta','quangnv1902@gmail.com','$2y$10$Detq.dh2.bYEHqsOdEWMBey3ocuFUiu/gRYEUAr9kk1bjTrjFdw2.','0386017669',1,NULL,'2019-10-30 16:52:49','2019-11-05 09:19:19',NULL,NULL,0.00,NULL,2,NULL),
	(169,'Uyên','u_mju_kul@yahoo.com','$2y$10$b7ZVC4QwMAY9auatSzBUNO2HRf6GTENnrTd0zFytT2ukRQycF5n1.','0367106416',1,NULL,'2019-10-30 17:39:06','2019-10-30 17:39:06',NULL,NULL,NULL,NULL,NULL,NULL),
	(170,'Nguyễn Việt hà','ng.vietha88@gmail.com','$2y$10$FUQickzT5gsbIL2LmUaxK.YLmgfo0xVjvtYEPyi..KLADqu36VHby','0976119283',1,'fVZCL0DqXQ9ZmHjr50WMTLoNgqIiSrTHW9KhlcdfRXeYhL3xVgIPAm75crrY','2019-10-31 08:58:46','2019-12-13 12:53:43','NVHA88-3',NULL,0.00,4,2,5),
	(171,'Nguyễn Thị Hồng Vân','vanchuancmn1990@gmail.com','$2y$10$kGZSqQP/x5v8yJ4q2RXUo.HJ819xZjUmNWwY2GtO7OZZQEdM.Ye3i','0984511588',1,'76lxRViUhnNmVKM08nmKLUK5FASgdcsBV6CVTPEPQj2XFdoQbFS1jW5c5hT1','2019-10-31 09:12:32','2020-03-30 13:00:03','ddhongvan-001',NULL,0.00,29,3,5),
	(172,'Nguyễn Thúy','thuynh.neu@gmail.com','$2y$10$LKHuV9m4zO3VpvqmDn2nrOvnQPwU5rHLMJp7ifvXPb0pyBYxKMfz6','0974765198',1,'ZLwb7czYJxp6c4R90ewzLlq4HIY1ZJNH0pWHkqUfjAm5PGfoYXgENgGT0cCa','2019-10-31 09:23:13','2019-12-13 12:53:54','NgThuy',NULL,0.00,24,2,5),
	(173,'Truong Lam','truonglamtx@gmail.com','$2y$10$Qsb3bGovdYTl9/Cs6RCIAe5FufMx5drqrTxqHyzoJDTvn3oT.t0J6','0983347872',1,NULL,'2019-10-31 14:45:27','2019-12-13 12:54:02','hdtruonglam-3',NULL,0.00,4,4,5),
	(174,'my','buithaomy242@gmail.com','$2y$10$Gnu7ydsfAXFwmNJZNNAH3eVbm5IyopXbbzUKVaoEqWaULvWgDGQAG','0967969693',1,'4WFfSZfEs0oOl3g0x9PGBrnDP9Px0B6a3vsYfGlq7C8cfO5B1leWo57X0Yyn','2019-10-31 15:07:17','2019-11-18 08:18:12','hdmy94-3',NULL,0.00,4,4,20),
	(175,'Trần Linh','tranlinh5120@gmail.com','$2y$10$.FV7Pu7NqZsG39/8pPqaaupO8oFhTgMLPMVVDp46C7osBBSqF6Pgy','0975879339',1,'MiBSRKI6uL7LiXYBiznG8OdDMZeWrr3oESlJRBbh7OoHCAcKYv9FjkRHW8ER','2019-11-01 14:19:11','2020-03-05 13:46:33','HDLT-3',NULL,0.00,4,4,27),
	(176,'Đỗ Như Hương','huongdonhu@gmail.com','$2y$10$zabTZUtu99r7v8r6B/GCneYskPn3aShZU6acuYWWVgBA7kg9oEcI.','0917625307',1,NULL,'2019-11-01 15:26:37','2020-03-30 13:00:10','DNH-001',NULL,0.00,29,2,5),
	(177,'Phạm Thị Lan Phương','lanphuongrn96@gmail.com','$2y$10$DCV0bqfULcRm2wKEoyMYd.vbEEKLQi6yWwf3s/j6xeaq6pKJZUUl2','0702218647',1,'dJ51gJYNUXikIq2xdPnosCrGxnRxfoAEEdXugu3rtNxp3CUpWtqhniJDd43A','2019-11-01 16:31:13','2019-12-16 15:46:13','PHUONGORD-3',NULL,0.00,4,2,20),
	(178,'Ngô văn thông','ngovanthong@gmail.com','$2y$10$YX.6NyZvBkKRpbExXH65P.1oLnU8c6T.XeGIuCRpEuJQWRGxv65rS','0869835568',1,NULL,'2019-11-01 19:58:21','2019-11-08 16:46:20',NULL,NULL,0.00,NULL,4,NULL),
	(179,'Hoàng Hải','haihoang1203@gmail.com','$2y$10$I4EgZdneFKI1JQkaNmx42uWhhNlv8NEFah6O51qVH8bznjkvt1kWC','0348380992',1,'5G8cf9nNsOuobsZ9AXpUO5EaUDYGbIRTs9RRyDXJrmpB5c0CyCli8ezznNnI','2019-11-01 22:16:14','2019-12-13 12:54:20','hai1203-3',NULL,0.00,4,2,5),
	(180,'leminh','letuanminh084@gmail.com','$2y$10$TSHtr2wnENClR0/XQ6AGVedBHmGREKCoEIK5ypLp8qLBmmCMhuD6.','0848292898',1,'ZrAHtY5dK9OPK56CmmefZppLD6diDG9xqRTsh3jzuCLPEvIBT8XhK67SirUz','2019-11-02 09:29:46','2019-11-08 16:46:11',NULL,NULL,0.00,NULL,2,NULL),
	(181,'Hoàng Thị Bảo Ngọc','hoangthibaongoc1182002@gmail.com','$2y$10$mKPylU0I.4K/xaN75QzTmesaa/g7oyhHTCgI4E.T5YyB5jcV.l4hK','0911128926',1,NULL,'2019-11-02 11:23:52','2019-11-05 12:40:41',NULL,NULL,0.00,NULL,4,NULL),
	(182,'Nguyễn Hồng Sim','hongsim2002@gmail.com','$2y$10$8VQDeRfX.JIAPwMrNGcnV.uqc16aff3beBSCnG1hSUuPmRWe2jRJe','0943003366',1,NULL,'2019-11-02 11:37:36','2019-11-08 16:46:04',NULL,NULL,0.00,NULL,3,NULL),
	(183,'đặng anh tuấn','anhtuan29101989@gmail.com','$2y$10$3NLPKn1RedF1Q2eNAJqNKeUzoKbPBM5ICJJZuWtDh3RRqcJAiqy2K','0985287664',1,NULL,'2019-11-02 12:13:18','2019-11-18 08:17:08','sgdangtuan-3',NULL,0.00,4,5,20),
	(184,'Đỗ Hà Diệu Trâm','tramdo.06012001@gmail.com','$2y$10$naj7ZKZaTgWKhF71QBNO0eTiIdvBkVzvPpEExUONIVQd6r2zcr3/W','0947516487',1,'e8vkkkctUEbzLLkuMRBKWxANikY6EvyFomgFFrN64aDH6t97UNoavaEq39VA','2019-11-03 22:34:44','2019-12-13 12:54:25','SGDieuTram',NULL,0.00,24,5,5),
	(185,'Chu Tuấn Linh','chuotyeugao9389@gmail.com','$2y$10$rbSnbUgamOrUQgnupNYH1.TOob7HfLsneenn4/XysDUxk/BvblM9m','0944525535',1,NULL,'2019-11-03 22:41:17','2019-11-05 08:55:12',NULL,NULL,0.00,NULL,2,NULL),
	(186,'Phạm kim Anh','kimanh021088@gmail.com','$2y$10$RcENkhY85HYDEKoWCwTXweWc/g7yzdfw3mZeLfev7Fd6po4s6f1n2','0933556088',1,'xo2RhCCAtA1OoUakxhmvm3CmFvFTyXonpNq4USMpY5c2R17hqVmrVLz1fwMH','2019-11-04 11:16:05','2020-04-03 14:59:32','DDKimanh-3',NULL,0.00,4,5,27),
	(187,'Vũ Thanh Hà','rainontheblueriver@gmail.com','$2y$10$tOsB50wk8xDCpwXChP4rluUv15Intg9JNU4fiOffIB5QNWJUUG4wq','0583481441',1,'0lKDKBPv7IdRlibCADZGV3U5ZSdnakhRWTJgIYwR20ujc8498nRQoDpHr8s3','2019-11-04 23:15:16','2019-12-13 12:54:34','thanhha',NULL,0.00,NULL,2,5),
	(188,'Vũ Thế Trung','trungvt1509@gmail.com','$2y$10$cWg7KP2xRpcAL76kl5.GS.ogNO/GTeEMUKJEZOv7/CUqBaqMXMeZS','0904788296',1,'QhZbO6IWak8EqahbmPIPqscSRW9By3PBngZ3Gqyz3e19fZJG1H2pF0PUCAQn','2019-11-05 09:47:56','2019-12-13 12:54:39','VTT-3',NULL,0.00,4,2,5),
	(189,'nguyễn thị thùy trang','nguyentrang270196hubt@gmail.com','$2y$10$1s.A/i9kpuhaR.u8Vu/.juWShWvurWO2qmGbJnGKxIwu.xVP/gviG','0989274846',1,'RFqm1O80fQECQaOXkuRGLMTR1uW0zvhWIShjgtmjiTYMo1zmVnhIJzjhPGfT','2019-11-05 14:17:02','2019-12-04 10:42:40','trang-3',NULL,0.00,4,2,20),
	(190,'do xuan hoan','hoando7@gmail.com','$2y$10$OSlMhkRI8MbrqebF8364x.yz9fJKuVoNQ99Z8nrd7otl7I0gm/84q','0968900377',1,'yfMqFOh9wcdDVGThJBukXZiQrwOZG7hTHtKh61yoxPLdaMC0FD0Prju7PQwk','2019-11-06 10:27:42','2019-11-19 10:27:34','hddriver-3',NULL,0.00,4,4,20),
	(191,'Đặng Hằng','hanghyuk@gmail.com','$2y$10$8oFPBn7vLt/w8igqVdiZM.8Rz.OEppkFydnQ0aPcfZiHyc8xLr4V6','0979143843',1,'IS13Dm3KtVj4WsVn4mSBXZktK2t2smcIBQ6avu3VKFCKqqD0aPJxRSFV7iht','2019-11-06 16:17:58','2020-01-11 16:11:36','DangHang-3',NULL,0.00,4,2,NULL),
	(192,'Hoàng Thanh Vi','itime.xo@gmail.com','$2y$10$067kgFHjAxUOvND2lvZyseJd7aJVct.6QNJRPI4qYN5PEQoGsULSm','0774327132',1,'p2IV4zm2D8dcMJwiP8dVh7mGIYXHfv4zmqwhzv79sQ3jX1vuorJgUDUCE2v2','2019-11-06 16:43:34','2019-12-13 12:54:43','SGVi-3',NULL,0.00,4,5,5),
	(193,'Ha Nam','lexlutho33@gmail.com','$2y$10$x28c/qjytFAGFGRIYTa51uBxX02joT6agLm.FOqUi/0jGAHS0RHbW','0949902509',1,NULL,'2019-11-06 21:09:37','2019-11-08 16:45:25',NULL,NULL,0.00,NULL,2,NULL),
	(194,'Hoàn Vũ','vuvanhoan.hd@gmail.com','$2y$10$QHj9j/1D5U4krS/0G15Bi.VjhXzR39ENjqw8lg19z.evqkZlwXCia','0386622682',1,'1dWvoPm7V2iTcA73p6J0Cn7ITBCu6Z5V4jkI9T5ZAtH9pRT0tudbzBIM7h26','2019-11-07 10:51:58','2019-11-08 16:45:21',NULL,NULL,0.00,NULL,4,NULL),
	(195,'Phùng Thị Hoa','marketing.bebe11@gmail.com','$2y$10$Y.SZRyEFx8ttH8rlIlAJjePJCDh.asGZvijojpMDaX80tYABrZ9TO','0944322356',1,NULL,'2019-11-07 11:14:45','2019-11-08 16:45:12',NULL,NULL,0.00,NULL,2,NULL),
	(196,'nguyenthituyet','tuyettuyet@gmail.com','$2y$10$XnrLIcWPwWEjLU4MuSkXxepebXeoqDmVAvKqNqRrqhE3.qxsiR1/e','0989286395',1,NULL,'2019-11-07 11:23:13','2019-11-08 16:45:06',NULL,NULL,0.00,NULL,4,NULL),
	(197,'nông thị mai','nongmai263@gmil.com','$2y$10$UYy3L1oFjwzwV63pftetPeDrVOT6n/HnLSQ1wriBqjN2YlqBlLJee','0986163844',1,'HKARyJnWfwoILZKzdVSEpXt7QUGOsjO4IgeozLveYta1iOonI5b9LQoBZ5kC','2019-11-07 11:26:46','2019-11-07 11:26:46',NULL,NULL,NULL,NULL,NULL,NULL),
	(198,'Trần Nhật Linh','nhatlinhtran080993@gmail.com','$2y$10$ttQzNgX8TZw6uf8tM5X/x.UQjmsGXq6L3Gb4KYb4Qtl3JLBihylBe','0372149162',1,'hS1xNIOuHEFqv95Ip1safwaQyomuughEirwiguNTvLRjmG8vOdmFyBGpCEHD','2019-11-07 14:10:52','2019-12-13 12:54:47','HDlinh-3',NULL,0.00,4,4,5),
	(199,'Lại Tùng Dương','laitungduong@gmail.com','$2y$10$s5Oahyi0Gu0bkKriECfgGO9POhO3zihXLDiB5twelThrNj6B8FLzC','0984356500',1,NULL,'2019-11-07 23:09:20','2019-11-08 16:44:51',NULL,NULL,0.00,NULL,2,NULL),
	(200,'eMcpxvdKZHB','jackatkinson3148@gmail.com','$2y$10$7cqmMRhlZd4E0thhuiQ0XueTIVjwSeIpHKCPTsJSdTtQtqIMkk2Fi','3515716845',1,NULL,'2019-11-07 23:46:03','2019-11-07 23:46:03',NULL,NULL,NULL,NULL,NULL,NULL),
	(201,'Hứa Thị Thùy','xushichui@gmail.com','$2y$10$nwDlprFQMH8oMZ08KC8X2OHPBW1MjvzNECvZ.5juKTTY0WkCgNAUq','0917821913',1,NULL,'2019-11-08 08:51:08','2019-11-08 08:51:08',NULL,NULL,NULL,NULL,NULL,NULL),
	(202,'Nguyen Thi Kim Ngan','ngank800@yahoo.com','$2y$10$IiQsbodrweJtTAMM6Eur.e2cpaZzr/Im8NHMBpbWhlEDgaaNACwFe','0786830800',1,'1XaJne30AVW4c4wdLzlI2bBKzeFY5SHnhfX96xiO0xxdLbCHQ4aIlm4E8oH1','2019-11-08 09:31:20','2020-03-30 13:00:23','sgkngan-3',NULL,0.00,4,5,20),
	(203,'nguyễn hữu an','nguyenhuuan01656566783@gmail.com','$2y$10$pTd5kAs17Jb0WFvgZJd07.XEk.d0GccS2PjsKbbvqAgn9qKSgHuwO','0967535633',1,NULL,'2019-11-08 13:09:50','2019-11-18 08:15:39','hdan-3',NULL,0.00,4,4,20),
	(204,'phạm thị mai','maicee0147@gmail.com','$2y$10$q1/i2UyQXT/57gy5OExaMOLZOBbVWtPvYf1TlNEwsFY69g8WCEwim','0374110036',1,'jiI1ZlhiKPOBOYLEFu2ZLzTaCsydksvlhr0xwAbuBnyeiSn31majqBMVd5Ft','2019-11-08 13:35:53','2019-12-13 12:54:52','HSPhamMai',NULL,0.00,24,3,5),
	(205,'Thu ánh','shopdientuhd@gmail.com','$2y$10$/zVRlSqvQ/Gi9HFvClOrGe6wk9o8TTanTr9FApAfVhuUelG0jJn3y','0399879521',1,NULL,'2019-11-09 10:48:53','2019-11-09 10:48:53',NULL,NULL,NULL,NULL,NULL,NULL),
	(206,'Hau238','quyhau020612@gmail.com','$2y$10$HFkWlXQ6noK9NKMvv0XYU.MrEKa4hkKoOGMNuj41h89MCI8Mf7SgO','0373838238',1,NULL,'2019-11-10 14:24:02','2019-11-13 10:00:00',NULL,NULL,0.00,NULL,5,NULL),
	(207,'Lê Thị Kim Yến','kimyen@gmail.com','$2y$10$O/vGXxGWMk0GMIbVYSTNMugXMtgI1XHqzz2TIEh266cm9cNyNfGH2','0916720222',1,'B4rkABZNIhG4AOUFcP2PhODIt5WystOTV4fm2qWr37MBpRRukeoff7dg9xhi','2019-11-10 16:41:36','2019-11-27 14:13:27','SGYENLE-3',NULL,0.00,4,5,20),
	(208,'Phạm Bảo Ngân','phambaongan216@gmail.com','$2y$10$p/PVCDPjwp0C1BgkBPE2Sel4Icho7Qvt1nxw1VNTRmTupn5kGDmcW','0921759979',1,'gOwSULxeSwRxNY3bEzmqZdlVuUhb9Bpcp3QW2ppA3T55XQfMwmEpJ0OGhEcd','2019-11-10 17:41:07','2019-12-13 12:54:55','HSNganPham-3',NULL,0.00,4,3,5),
	(209,'long','long@gmail.com','$2y$10$Gy6QVq/Yhme5wWJMGETL4emm8agSYd2qWnQ59JMRR4.obQtyCmBJa','0123456789',1,NULL,'2019-11-10 21:07:16','2019-11-10 21:07:16',NULL,NULL,NULL,NULL,NULL,NULL),
	(210,'Nguyễn Hường','genshiseikou.92@gmail.com','$2y$10$kmbSNA/t/U92/MqGNrHuHe6kOnwT46K.Z8I86UleIkGHT64ZLvvFC','0949047847',1,'t1ySIzIclf9fK6TrbAjHwJMub6Kr1ZZEMMsSqDWWpNZKs4uAxqmrLh9xp4WJ','2019-11-10 23:03:42','2019-12-13 12:54:59','HDGenshi',NULL,0.00,NULL,4,5),
	(211,'DO THI HONG MI','hongmido@gmail.com','$2y$10$IKMuiv6CN.7ZR6aDlamQHO5ioY5jKIRv5fNiUdS.Ali8WV4qo9Nzq','0983650745',1,'HMXznWeRsIyxkV2cDrnufVbt3Pzh0RzvNKOGUyq0qFK9JaZ0ZSjoQbmIW5wR','2019-11-11 09:32:41','2020-03-30 13:00:30','DDHongMi-001',NULL,0.00,29,5,5),
	(212,'Tăng thị bảo châu','tangbaochau131@yahoo.com.vn','$2y$10$.gIGLrDrsy4G9LsXXi1CaOFrYwkwc8/8km3eaCPBW3Hhiluqs6ue2','0906892586',1,'DluEIglTAqNFpz9Wta4tqZT6QOp82M5Kz8CH92STlQ2xErA8r7cWtugS8NbE','2019-11-11 11:19:31','2019-12-06 17:51:22','SGBaoChau-3',NULL,0.00,4,5,20),
	(213,'Đinh Quang Huệ','quanghue1989@gmail.com','$2y$10$LwMdv03pswg5QlEENJeyiepTxRuoVh/dJJhGweA5QM/LpcXIqz.fy','0988210016',1,'Se9kEoRKnFOnei62sEuUf3XKWrbj2wj5VXN6xKxphf9Cn28gtf2T1FZg6xr5','2019-11-11 11:28:46','2020-03-30 13:00:37','HSHUE89-001',NULL,0.00,29,3,20),
	(214,'Nguyễn Đức Huy','huy260291@gmail.com','$2y$10$Nsqv27n/oLZmQcacRHpaROBw4SPZ4xZdxP1ymnzy1wP1ws3jyyAQi','0942260291',1,'1VA4TLeO18axkb5yzhIxEiKP9a27FqrkgXxSjprfIqh1PMAugc7tRsU6TIuS','2019-11-11 12:38:10','2020-02-06 19:34:17','HDAHUY-3',NULL,0.00,4,4,5),
	(215,'Phạm Thi Trang','trangphamm2203@gmail.com','$2y$10$2/Kkz0wLNJ3Muo9VeSV2R.Odt/O6Z0weJC9qhwRemS3ysZuUpjElG','0839258161',1,NULL,'2019-11-11 21:57:59','2019-11-11 21:57:59',NULL,NULL,NULL,NULL,NULL,NULL),
	(216,'phamtrungmy','phamtrungmy@hoangmaimedia.vn','$2y$10$2oJiJmwQYaOE/D3vaaXEnuhmgADKlGITWA0f31WftLhyjBQnq6tRO','0904634986',1,'1tq8UTTZOUmqYPHOF7pKSrSNom7pOEuAuYWklaHxD0SyHrMyUzX6qvwBOYI2','2019-11-13 09:17:05','2020-03-30 13:01:02','DDMyle86-001',NULL,0.00,29,3,5),
	(217,'Lana','lanavux@gmail.com','$2y$10$ExmwU2rvyLJPy0p.SRPY7.Ri28fQLHA9hGgrZcCEYzskYuIOlQb8.','0967729389',1,NULL,'2019-11-13 10:11:06','2019-11-13 10:11:06',NULL,NULL,NULL,NULL,NULL,NULL),
	(218,'nguyen11minh','nguyenminh29385@gmail.com','$2y$10$Zg5VigAfWER/WWosGp5FAO5R0nPh.VkWLOWM5kjGblbQLwzoFZmqe','0985698595',1,'IdTVwCu3860gsYWypfvKJDe5DUDixCFJZge2svHjfEBXMzEw5u8wCuNSZWJG','2019-11-13 20:13:02','2020-03-14 11:38:43','Minh11-3',NULL,0.00,4,2,20),
	(219,'Nguyễn Ngọc Tú','Tunguyencivil1990@gmail.com','$2y$10$ZtXuU.SNYachmKRytomHfOHg6aO/LrnShZYYGzHIgoDR9xFG1TX.S','0979944190',1,NULL,'2019-11-14 10:48:00','2019-11-19 10:25:51','NgocTu',NULL,0.00,24,NULL,20),
	(220,'NAMNIE MAGIC','namniemagician@gmail.com','$2y$10$JqrK3dQxT8K0Q4np6yF19OSAntTVR58HfGpHChPYk/2iF2xMVo0IC','0368787857',1,'AUw6Pz1go64VHcQjmEBe3g7h91Ycq3bNyp6bBneQ0rppWZ67AehTd8nKZ85m','2019-11-14 13:31:01','2020-02-01 14:52:09','DDHoaiNam..',2,0.00,24,3,5),
	(221,'Mai thị kim chung','nbchung@gmail.com','$2y$10$twWJ0KvA2wCTnZBHfmD4vuccOIlPPgvrGRI07gAR7CVtD7VoRQpBe','0355669777',1,'3A7z2Nvlibb8HMO1ktMdPizUku0qZ2r6h32ih1BR1mil6pt9BBL2t6Kko4NB','2019-11-15 18:02:32','2019-12-13 12:55:40','HDNBChung',NULL,0.00,24,4,5),
	(222,'VŨ THỊ HƯƠNG GIANG','giangvth90@gmail.com','$2y$10$e8O/bEg0zQBvwqoGJ.HH8Ot2yGA8OA1HdRpyzEfUOVaFGuKKEbZEe','0979908897',1,'t6iMq1Zp5AIeaFHOl2VO73zfUcQYGgA3XJAmXw4riAiwA9BGjjGEa899ca1s','2019-11-16 02:12:46','2020-03-30 13:01:11','GIANG88-001.',1,15000.00,29,4,NULL),
	(223,'phamthao','vanthao0359696@gmail.com','$2y$10$dM1PgPdHBtb/wpuHe3aGZuA78tEhzxBXS0c0G7s/WS0vZPOydBW5e','0987898765',1,NULL,'2019-11-16 09:35:31','2019-11-16 09:35:31',NULL,NULL,NULL,NULL,NULL,NULL),
	(224,'Hau97','hauden97@icloud.com','$2y$10$5tyIxKmdLG4Skw8sH/OyOuEsQqnzZocWW9b5izcnD9sBVIfftctuW','0364942405',1,'cz0Z56U6fAQizSpyhvtxmVQaazjNiJx5czzJjpCgi66jH02pbJUCHjlIL4Nu','2019-11-16 10:54:16','2019-11-19 15:32:16','Hau97-3',NULL,0.00,4,2,NULL),
	(225,'Nguyễn Minh Đức','nguyenminhducmba@gmail.com','$2y$10$K6fh3WuaWZOp.cmcBKBF6uXJzrgIGhJ4Hf6/zn/R8ful16lZ5ehYu','0938688783',1,'LPjDXwYkrnlKDgIGB1vUDMZbrLAxU9SoMZKuXcxlMjHFvwAqF82zKO4BxaUO','2019-11-16 16:11:25','2019-12-17 10:12:26','SGNMD-3',NULL,0.00,4,5,20),
	(226,'Mai Thành Duy','thanhduymtd@gmail.com','$2y$10$.vW0Pzb7GZExcjICcSFD2e.QKZZo5n0/TiSnTFrB.djzlvk3JdTxq','0778184122',1,'jK4btUoM51rVvSTN5XHIxRT1osRkLRtLBCcvdheBae5mNZpgXfXg96oNZCWb','2019-11-17 14:19:11','2020-03-30 13:01:20','SGDuy-001',NULL,0.00,29,5,NULL),
	(227,'Trần Thị Tần','tranfthijtan2810@gmail.com','$2y$10$XeMfwjpGCV8QknrBvvpT0eIbUUTDDdd3PaVA9naXYEUaDEaSCEFkq','0965596605',1,NULL,'2019-11-17 21:34:51','2019-11-17 21:34:51',NULL,NULL,NULL,NULL,NULL,NULL),
	(228,'NGKHAI','Nguyenkhai.Vns@gmail.com','$2y$10$u/fiCn985J1m0iXyf7wKsulCZnoHhlYGewylCsh/5hkjE6HGuOCrK','0967829998',1,'RhgA4AgUPCFlpjJojuyQmUqWauWKterEuAjuBdmwjstEX7GisRvdEIW1BSXs','2019-11-18 10:25:25','2019-11-18 15:08:28','HDNGKHAI-3',NULL,0.00,4,4,20),
	(229,'Chu Tuan Anh','tuananhhchu@gmail.com','$2y$10$bhHc1ievfeaoGd71ZZkejuFyfpT6uuSr10pRm0beOupuHQ8SMgt46','0813101036',1,'YOIfbdPRUlDslhPUuYz0LSzF6iFWhWQHic5aOkU1kGnudGPGEDHjpfcWCE4a','2019-11-18 13:26:55','2020-02-03 15:54:24','AnhChuCU-3',NULL,0.00,4,2,NULL),
	(230,'Tống Bình','tongbinh@gmail.com','$2y$10$VQNqcdTuru8sM4JSRJ5tq.um/7Qh87QVS7sPbx./.YS95bQt2n7n.','0906234749',1,'WX2S4aN4fusu49Z0LRvubOzRWmEQcwk2vTmrFeW3pCLyBH6k0LKPj0imRvTp','2019-11-18 13:46:24','2019-11-18 16:43:10','HDTongBinh',NULL,0.00,24,4,20),
	(231,'Ngọc Lan','tathuyhd@gmail.com','$2y$10$uqxFLuaBNzNr1AOW00l3I.4y03FrAORLrYHqXAwhPeaEqumLkHXcO','0981187558',1,'H5aUaayFCHGmyRT96YA3zI2qNKH3QJX0CJr2eC0cELoVEXdUy06qWLHyjZ1M','2019-11-18 14:19:02','2020-04-04 10:33:00','#NgocLAN.',1,15000.00,24,2,20),
	(232,'Nguyễn Thị Hoa','quynhnt85@gmail.com','$2y$10$ygUrlWR6gn3Mp0TDkK/MG.wzPySQaiDwQ59EZOjFhRW1dW8.igxbe','0967988886',1,NULL,'2019-11-18 15:29:54','2019-12-04 09:41:40','HDHoaMon',NULL,0.00,24,4,20),
	(233,'Trang Nguyen','kybo.mymy@gmail.com','$2y$10$4z1nb7HEC69P1Vvt9Mw/..qAPp1Aeb0vPaiMD42Z8pfbMy5mzWSO2','0967784627',1,'e9ShWTVGeM7GwKvxhAVJINH4mUOMA5o8UDb4mrZuX0GYWVMVPbIpAaeUV44o','2019-11-18 17:25:04','2019-12-13 12:55:44','SGTRANGNG-3',NULL,0.00,4,5,5),
	(234,'Hoàng Thị Ninh','hoangninh106@gmail.com','$2y$10$Rs/L8//NQzREla52RB6eguQsCI9CCYeSIjPjKFKn2hb4l9sTtCjFG','0975947516',1,'cZIpm99oA7o4G71nd241rDq8nTJ1LMqURDuXTPoTqfllkkGDuhhJyzqaZ7rA','2019-11-18 18:00:45','2019-12-13 12:55:48','#HDLuvmichi-3',NULL,15000.00,4,4,5),
	(235,'2','hallo441@hotmail.de','$2y$10$Cg1JXjC8bGTymKJxYZyQ3.liVR1rWRmP/UeGN8jN7KophC3T/zQgW','0922222222',0,NULL,'2019-11-18 19:41:19','2019-11-19 12:20:31',NULL,NULL,0.00,NULL,NULL,NULL),
	(236,'0','prettymijin1@yahoo.de','$2y$10$BfJ7FqEOkqK3XvtH1qMxjOEdkr5VYFxieuZLVb7zPyWmHY0sVZ992','0911111111',0,NULL,'2019-11-19 06:25:33','2019-11-19 12:20:12',NULL,NULL,0.00,NULL,NULL,NULL),
	(237,'Vũ Xuân Tuyến','vutuyennan89@gmail.com','$2y$10$xQcvrwYC/5c67rKbfBqTuuYoH/4PJ53XfgU1jSPBDagf0auQSPDD6','0973150300',1,'AayFMnALSNR3uVE6nauLY0AjkeP6d42MVRgjVlFHG76Y2HIoyp95sWvJif9r','2019-11-19 09:30:06','2020-01-02 16:31:06','VuTuyen-3',NULL,0.00,4,2,NULL),
	(238,'Binary options + Cryptocurrency = $ 5266 per week: https://1borsa.com/getmillionsdollars46437','lisaah.hoogma@gmx.de','$2y$10$pHaYJ1YW3FDLadzyLcyqYe43Zu3Vo9B8YoKTSPzSpwQ.JAcdh4xuS','82613345645',0,NULL,'2019-11-19 16:13:49','2019-11-26 15:50:38',NULL,NULL,0.00,NULL,NULL,NULL),
	(239,'How to Make $6411 FAST,  Rapid  Loan, The Busy Budgeter: https://make-3-btc-per-day.blogspot.se?v=66','szalay.bertram@gmx.at','$2y$10$3Ui9Qlo3DcAqKYVrDtjGZufY3k7SVM4pcIt1Is9GPs7oI/wJy/iQu','86828583926',0,NULL,'2019-11-20 04:21:06','2019-11-26 15:50:35',NULL,NULL,0.00,NULL,NULL,NULL),
	(240,'Just how to Make $5939 FAST, Fast  Cash, The Busy Budgeter: https://get-3-btc-per-day.blogspot.com.ar?f=14','mariarosaria-91@hotmail.it','$2y$10$KeSmfg/FBJc/ORjaFsSF2ezjzqwIM6e61FwYn3kE2g2BSfhQ1LBZC','81178836935',0,NULL,'2019-11-20 05:50:03','2019-11-26 15:50:32',NULL,NULL,0.00,NULL,NULL,NULL),
	(241,'Paid Surveys:  Make $7931 Or More Per Week: https://make-5-btc-per-day.blogspot.com.tr?s=80','lkirq@gmx.de','$2y$10$7jfBZ8OzwDarqlSNQywzaOPPOHr.eSGjl.fjE0RT/4Ed1IZBLM1xC','88136742384',0,NULL,'2019-11-20 07:06:40','2019-11-26 15:50:29',NULL,NULL,0.00,NULL,NULL,NULL),
	(242,'Nguyen Nhung','nguyennhung@gmail.com','$2y$10$pflr4Ag4N/B/vA9vSD4bAediVQMhqNFz2yUZMN0FAaNuSYa9C2Jqi','0849982000',1,NULL,'2019-11-20 09:51:39','2019-11-20 09:51:39',NULL,NULL,NULL,NULL,NULL,NULL),
	(243,'huy','huykinlong@gmail.com','$2y$10$dgZ4fdL9cuPErUNr1vZQE.C7zLPUKK5hPXiMdcq/FL4bSenTl8gQC','0976420999',1,NULL,'2019-11-20 10:36:37','2019-11-20 10:36:37',NULL,NULL,NULL,NULL,NULL,NULL),
	(244,'Just how  would certainly you  utilize $84166 to make more  loan: https://earn-5btc-per-day.blogspot.tw?t=48','ewam@gmx.de','$2y$10$IqOHrBAENVHs8scMgI5uteNT4ztNcwM8czS3EfQoXcQTWIrPacjta','81736214117',0,NULL,'2019-11-20 11:52:00','2019-11-26 15:50:23',NULL,NULL,0.00,NULL,NULL,NULL),
	(245,'chu hạnh linh','linhinnocent@gmail.com','$2y$10$A2aCg7OEaunDQ40g4Rj3DeSQOZFnMnDQPaRX.lJ65Zogj.WtmQh.K','0943969936',1,'jh5pdrqL8dY2YjxqjaoZiuYOrBx6kLu23gOZ1kRvtDeDTUzFFpQR0PAvoE7B','2019-11-20 12:13:24','2019-11-30 15:48:04',NULL,NULL,0.00,NULL,2,NULL),
	(246,'Nguyen Thi Dung','gemi.kt@gmail.com','$2y$10$ocyn4JOOdlUN/gFfedcM4uKlj9/FvCS2Qmy9R6YCFPq.wsGNBtnN6','0985238881',1,'xjTz5W1M3PKRNfkUzDfjJ2R4SgExyAY0AVShXMnYhgFH3bJrLisj2wnk3GBE','2019-11-20 13:53:33','2019-11-21 10:18:38','gemi-3',NULL,0.00,4,2,NULL),
	(247,'How would you use $53569 to make  even more  cash: https://us-au-ca.blogspot.kr?ub=12','imlb@ive.it','$2y$10$TJ7/IrS6bqB.eV.Pt2Fp3uPbFAxnVInpfVZbOInUvNiPukta8U0Zy','83386689972',0,NULL,'2019-11-20 15:02:38','2019-11-26 15:50:18',NULL,NULL,0.00,NULL,NULL,NULL),
	(248,'Invest $ 4123 in Bitcoin once and get $ 72474 passive income per month: https://make-4-btc-per-day.blogspot.be?a=98','walter.schmidt@uni-bayreuth.de','$2y$10$4RCxr2DEyuF44QfYfmQ5vuE8WzppN3.jmpKlhBZS3rAeSy5Az6NFO','86733622787',0,NULL,'2019-11-20 22:16:14','2019-11-26 15:50:14',NULL,NULL,0.00,NULL,NULL,NULL),
	(249,'Forex + Cryptocurrency = $ 2323 per week: https://earn-4btc-per-day.blogspot.dk?k=95','polkom21@web.de','$2y$10$6xl703nZ3wzl1C0sWuYG3ODK4cw7dqRXuwSad.oiXo8CBHurSGmRu','86771142876',0,NULL,'2019-11-21 00:05:32','2019-11-26 15:50:10',NULL,NULL,0.00,NULL,NULL,NULL),
	(250,'Binary options + Cryptocurrency = $ 5976 per week: https://make-3-btc-per-day.blogspot.se?i=58','cpt-tonio72@hotmail.fr','$2y$10$rQX5kU7nl7Sxz1ORf33kDONN6zBhn7ZokO5Niaoo2Sna/Fy4BMe0i','82628944693',0,NULL,'2019-11-21 00:19:05','2019-11-26 15:50:06',NULL,NULL,0.00,NULL,NULL,NULL),
	(251,'How to earn 0,786 BTC per week: https://rr-t-ui.blogspot.ie?ej=86','fatih1907@live.at','$2y$10$1JziydLFwi0gy5czKXFC/uNyFUXs8PZhPRbA4DwKVjPMXPX2HSSsW','87757599254',0,NULL,'2019-11-21 05:54:07','2019-11-26 15:52:28',NULL,NULL,0.00,NULL,NULL,NULL),
	(252,'Than Van Mien','dieucay689@gmail.com','$2y$10$phBoL93YSrp4ZTIQ2DuVhu6vr8N/P4l4yqva5NkgZucJntpzmKzNe','0962570823',1,'5iCGnQV8NSdrYQyzsVh73kVHvSYDOTYtrReNfHqv6d0QU0Ovrao8Cj7wyxaG','2019-11-21 09:27:02','2019-12-06 17:52:17','HDMIENBG-3',NULL,0.00,4,4,20),
	(253,'SonTran','tran.bson@gmail.com','$2y$10$bLDEtlJmj8zSyTYml6WNaueHKYwe3Q5MuIGa9AHgrfwFOgsf69ANm','0984045769',1,'K2x5lSt2vopPzHq1VspJDo4Mw9bScjniNfQKtvJpBVcjXelWjfSP4YGBDF70','2019-11-21 10:06:24','2020-02-08 11:38:57','HDSonTran-3',NULL,0.00,4,4,20),
	(254,'How to earn on investments in Bitcoin from $ 3977 per day: https://make-2-btc-per-day.blogspot.com.es?s=18','joe.beya@yahoo.com.ua','$2y$10$0ySiICWW24711C/M8eJdO.E9ajaaTGzOaHOsGR/mFMZt7MvlHHZ66','86687761122',0,NULL,'2019-11-21 11:15:17','2019-11-26 15:50:01',NULL,NULL,0.00,NULL,NULL,NULL),
	(255,'Paid  Studies: Earn $7971 Or  Even more  Each week: https://earn-1btc-per-day.blogspot.co.il?l=52','vincenzo_fun@gmx.de','$2y$10$fUbJJ4SSujQcrtp3ccitPOONSsk36PJRJcUNtfwvh5HJ.nMBFOnlC','85673414322',0,NULL,'2019-11-21 15:27:11','2019-11-26 15:49:58',NULL,NULL,0.00,NULL,NULL,NULL),
	(256,'How to invest in Cryptocurrency and receive from $ 4924 per day: https://ss-d-ff.blogspot.no?cz=19','aniamanhonecosta@hotmail.com','$2y$10$Tk/RFfwSQAVFH2A5U1Kz/eODKT91NbYFDk45K1Wq16UfSotxn8Keu','87746755971',0,NULL,'2019-11-21 18:35:32','2019-11-26 15:49:50',NULL,NULL,0.00,NULL,NULL,NULL),
	(257,'Paid  Studies:  Gain $8684 Or  Even more  Weekly: https://hy-ju-ki.blogspot.ae?oa=99','amurz@hotmail.com','$2y$10$1yT7qyyhtznVJRLsJrYzkOvP4Xa0uUhDw7Qu1CnNqUyUdgdCenkbu','89737529717',0,NULL,'2019-11-21 20:27:19','2019-11-26 15:49:45',NULL,NULL,0.00,NULL,NULL,NULL),
	(258,'Invest $ 9384 and get $ 5168 every month: https://get-5-btc-per-day.blogspot.nl?e=58','faulkner-c1@sky.com','$2y$10$oE6/2FyIhqvolrjaoqdCMeVApPyzbHU59KOBcfV/9oxHJKP1UmtOq','88851541566',0,NULL,'2019-11-21 22:05:43','2019-11-26 15:49:41',NULL,NULL,0.00,NULL,NULL,NULL),
	(259,'How to Make $8349 FAST,  Quick  Cash, The Busy Budgeter: https://earn-2btc-per-day.blogspot.ca?p=31','thamir-osman@gmx.de','$2y$10$jj/ytN2WdmEb4FGdlWXLXOZ1SzhdpSWU4gn5WQcO9DJgT0ydRMkMW','85352325119',0,NULL,'2019-11-22 01:11:50','2019-11-26 15:49:36',NULL,NULL,0.00,NULL,NULL,NULL),
	(260,'How to Make $7742 FAST,  Quick  Loan, The Busy Budgeter: https://qq-au-sa.blogspot.fi?io=95','coonrapids@hotmail.com','$2y$10$gxDSw2HqH8QG7STRcyix5OZ5cMq8R8syzZwUYVicDPwj6AB632xMS','81584998225',0,NULL,'2019-11-22 03:49:35','2019-11-26 15:49:31',NULL,NULL,0.00,NULL,NULL,NULL),
	(261,'Just how to Make $6863 FAST, Fast Money, The Busy Budgeter: https://earn-4btc-per-day.blogspot.co.il?d=02','coyle19@msn.com','$2y$10$RUGg.4WBr1r6gnPAjRLfbO9iQ1e0rbbMNMYEaKN81wRPWiKWn2REu','81956157738',0,NULL,'2019-11-22 04:44:29','2019-11-26 15:49:28',NULL,NULL,0.00,NULL,NULL,NULL),
	(262,'How to invest in Bitcoin $ 6182 - get a return of up to 4964%: https://make-3-btc-per-day.blogspot.com.au?a=65','rachialscott@yahoo.com','$2y$10$z4KVkdIvghYyu4ZwCEGRSOqhItym5olJ8NlBgCOWEwaCs7UJ/Hn22','88183452562',0,NULL,'2019-11-22 09:29:40','2019-11-26 15:49:24',NULL,NULL,0.00,NULL,NULL,NULL),
	(263,'Trần Việt Hà','habui0205@gmail.com','$2y$10$QXySeO5666uIfn.8bM07QesxvAYdiP5LYHyLa.kH.Z7T5Ta6ny7TS','0373581758',1,NULL,'2019-11-22 09:40:42','2019-11-22 09:40:42',NULL,NULL,NULL,NULL,NULL,NULL),
	(264,'Huỳnh Kiến Thư','laiguanlinismine@gmai.com','$2y$10$UW6b2gieVQTgjWCxgZq9CeuFIqtpaefEKxObJKeGDfpqUS5ND1YUi','0932935085',1,NULL,'2019-11-22 10:32:15','2019-11-22 10:32:15',NULL,NULL,NULL,NULL,NULL,NULL),
	(265,'What&#039;s the  simplest way to earn $56518 a month: https://hh-k-lo.blogspot.tw?qs=02','mukesh.swarnik@gmail.com','$2y$10$1opVwZW4DUAYGAICyO5.QuUVD/0lMfXrAxtBB9f/593TMhpx9PYxK','88774822411',0,NULL,'2019-11-22 12:29:40','2019-11-26 15:49:14',NULL,NULL,0.00,NULL,NULL,NULL),
	(266,'Just how would you  make use of $97283 to make  even more  loan: https://earn-5btc-per-day.blogspot.ae?g=32','pekarse20@hotmail.com','$2y$10$d4YziJXuIbGLJOr4UGGoouUQY35zGykvDRRw.iN.FqnDn/F6RETBe','86179167119',0,NULL,'2019-11-22 13:37:32','2019-11-26 15:49:08',NULL,NULL,0.00,NULL,NULL,NULL),
	(267,'Phạm Công Tuấn','Tuancnh@gmail.com','$2y$10$.7/1hfxlb9yYERSzlT/haOaSChrviZrFeXlGW7QTkf1KvqQqYlhUO','0935358387',1,'UW7L2PuaTxbqs3Vz2jCkmklKl6ldNfeUYTBE3AYSFzlR9hw0TeAikipYaiVS','2019-11-22 14:11:22','2020-03-28 16:44:22','CongTuan',NULL,0.00,24,2,20),
	(268,'Phan Xuân Trường','Truongkie@gmail.com','$2y$10$WQ773VsXLxkfzXDXSGJfTebfmjE5ElAe4rFe5aTWHlIApxHMpkfW6','0348449859',1,NULL,'2019-11-22 14:16:48','2019-12-13 12:55:52','TRUONGPHAN-3',NULL,0.00,4,NULL,5),
	(269,'Meet a beautiful girl for sex right now: http://alparabuck.tk/1qbqu','paulwright74@hotmail.com','$2y$10$VX/2tc80s5UTjeYVyxXjBuPLmNs561TnCTDR6glqS7eu.QSGpMXSq','85754195195',0,NULL,'2019-11-22 18:56:24','2019-11-26 15:49:02',NULL,NULL,0.00,NULL,NULL,NULL),
	(270,'How to get 0,589 Bitcoin per day: https://get-3-btc-per-day.blogspot.co.at?c=67','carolynengel@hotmail.com','$2y$10$w9fwBd9g7Pre4Wu5ph/do.D5WSyi8tMypcRmU5XbuYEaqZCItXHN6','88249545364',0,NULL,'2019-11-22 19:09:22','2019-11-26 15:48:56',NULL,NULL,0.00,NULL,NULL,NULL),
	(271,'Adult american dating free online: http://qojadefo.ml/otj2v','marc.chuchle@seznam.cz','$2y$10$K//w88X7.eEvF8zFKhb.zeuz/bewiwxAhVZgWKymXux17enUv9W5.','86241762553',0,NULL,'2019-11-23 03:27:49','2019-11-26 15:48:48',NULL,NULL,0.00,NULL,NULL,NULL),
	(272,'Beautiful girls for sex in your city: http://tooiprefagpo.tk/zmr3p','alvin_wjh@yahoo.com','$2y$10$JWmphPSBCseUfaCtIbHxe.c38rm2KLz4HkciGJT4OTyLhPmhIq93q','81162786377',0,NULL,'2019-11-23 05:30:48','2019-11-26 15:48:43',NULL,NULL,0.00,NULL,NULL,NULL),
	(273,'Đào Lan Huong','dlanhuong@gmail.com','$2y$10$Kh6Pn0OWykfzKxEkUiGMVe/sDCZ8FDwlFzjzjnOc4jXCQXNp09HSa','0902290246',1,'dvDX8TZtmjjAI9XCsxVoYRRmAdHg6zd2PvZrIkpLYXeGOUWbgcFYIbRM4wGQ','2019-11-23 13:48:08','2019-11-23 13:48:54','HuongDao KVC',NULL,0.00,NULL,2,NULL),
	(274,'Find yourself a girl for the night in your city UK: http://raduqudyriby.tk/xs9j1','simplicity_emo@yahoo.com','$2y$10$RSq/TqPrL1JJin.RTEyhl.9PcvNeAfvQrpWNoPY7cor5ur4vycP6m','83686491378',0,NULL,'2019-11-23 13:50:24','2019-11-26 15:48:36',NULL,NULL,0.00,NULL,NULL,NULL),
	(275,'NGUYỄN PHAN HOÀNG','hoang.phan.ng@gmail.com','$2y$10$KLHb.pzqJOp7OaBmOmmMb.EZeH8BBYumrqIOizPM20rd5PQB1.EJa','0969796689',1,'aBI2pQ8inAzxcgssaJidt7B2XGEwxQJlhDLCky47pJtjD9V7CSi7q9puOzDf','2019-11-23 14:24:40','2019-12-13 12:55:56','PhanHoang-3',NULL,0.00,4,2,5),
	(276,'Anh Thắng','Anhthang@gmail.com','$2y$10$O6lvBe88XfvQkcXalBiI4ukdQnZl2B/KqK0HD562RM/xDesh0Jguq','0966595916',1,NULL,'2019-11-23 14:51:44','2019-11-27 09:35:50','HSAThang',NULL,0.00,NULL,3,5),
	(277,'Sexy girls in your city are looking for dating: http://lordmuvara.tk/edzx','vtmiles@msn.com','$2y$10$ZjMVsWCMoXbMYVC/gsj1PO9S.jblHOW6KwwEJAqdyNJApX9fWHZb.','89262921374',0,NULL,'2019-11-23 14:59:56','2019-11-26 15:48:27',NULL,NULL,0.00,NULL,NULL,NULL),
	(278,'Long thong','longthong@gmail.com','$2y$10$pGNxWcuUtLdSUv7nZG65ce2zvo.XmpE3dxwhKRXPzM2z9vN0OAN62','01678420334',1,NULL,'2019-11-23 16:11:39','2019-11-23 16:11:39',NULL,NULL,NULL,NULL,NULL,NULL),
	(279,'Adult dating sites in east london eastern cape: http://paradybuxiwu.tk/zjnv','syn5234@naver.com','$2y$10$ZZ72V8kXOkaDtz9ZuKKVXu9TaX8FMPKROX.KecdFatEYqw06ejV36','82563851926',0,NULL,'2019-11-24 00:37:27','2019-11-25 17:38:17',NULL,NULL,0.00,NULL,NULL,NULL),
	(280,'Быстрый и Большой заработок в интернете от 6003 rub. в день http://speedfacviatam.tk/4bzm','matvey.gavrilov.2015@mail.ru','$2y$10$q0DlMrlcNRh6Gs5ijo.vg.UKXhyJqekC9.P5geap5TinvXBeZfM9m','87172813141',0,NULL,'2019-11-25 05:33:02','2019-11-25 17:38:12',NULL,NULL,0.00,NULL,NULL,NULL),
	(281,'Phạm Hương','phamluusa@gmail.com','$2y$10$OlVhbj5mljfIWSOoNo8GnuBItkvuWCZWH4bD3THpEzkgySPE0oNHq','0984986699',1,'ompy2dLxYkdBqPdxAqZBY42lCdoe5fYs6hBVlncLWysLNoF0E6r7cWU6Dyzb','2019-11-25 13:00:20','2019-12-13 12:55:59','Huong99-3',NULL,0.00,4,2,5),
	(282,'trần châu uyên','chauyen2@gmail.com','$2y$10$Rm807H9VGzKSy08mXOuGK.9I2CF80kt.42sHQzk3.69fn1.PX.BAa','0905800706',1,NULL,'2019-11-28 14:32:36','2019-11-28 14:32:36',NULL,NULL,NULL,NULL,NULL,NULL),
	(283,'Huỳnh Đạt','huynh01dat@gmail.com','$2y$10$VmW122jY.eRqBhgDCqKpguYReIINkwpedf3u9yFZjMNdQbUAbWNB6','0968217431',1,NULL,'2019-11-29 18:07:33','2019-11-29 18:07:33',NULL,NULL,NULL,NULL,NULL,NULL),
	(284,'Nguyễn Thị Thanh Hà','thanhha10186@gmail.com','$2y$10$Eu8c2Wv29l9ulJzvx.aZr.bzaPlLOZvelsSakLSer2iCU4kNm1Myq','0989235279',1,NULL,'2019-11-30 10:49:21','2019-11-30 10:49:21',NULL,NULL,NULL,NULL,NULL,NULL),
	(285,'Minh Tran','tranminh.miniwood@gmail.com','$2y$10$e76Ojh9AzlL.uy0jXnImaOlV9brk2VdFkPE0SpelAFHWatMU7fmQq','0987705799',1,'cndv6AiIN8HbG11CoaF0zLf9ip0pwwIqQr5DXclHv7fdSW7Rm5w2RvS9REM2','2019-11-30 15:22:49','2020-02-06 17:49:10','HSMinhTran',NULL,0.00,24,3,NULL),
	(286,'tuan anh chu','tuananhchu@gmail.com','$2y$10$NY2qfDXRoPpuaTpcfXDufeNZKix/9kygd5U0V8UANeRXcZUswpSj2','0852727777',1,'eP1MK0XSieHUM1P0jVQXwPrqRnCCiKgbxV174BtmFCxWWhrcN4QDoXx9aWv1','2019-11-30 17:43:40','2020-02-03 15:43:42','anhchu-3',NULL,0.00,4,2,NULL),
	(287,'Phạm Việt Anh','phamvietanh72@gmail.com','$2y$10$IUxdG/nT1UwpRG84rz7/RuToNznE9MXvqjYoBp65e0f8sIkDWdiPO','0987652318',1,'TTaA6qV2C7wMjZ8OVvm1R8b2EaWyaU47peKr8rbFdTOZ87ui3VhGKmIZQhzG','2019-12-01 23:15:19','2019-12-18 14:58:17','HDVietAnh-3',NULL,0.00,4,4,20),
	(288,'Trần Thị Ngọc Thảo','tntthongoc1@gmail.com','$2y$10$3Zx5JcK/PQ86pNIuuAdiPOhHKbdSGORhZAvDCKgafA6Qx1hbkubEO','0933871611',1,'LxXnexQ5hnTalZAeSWXqOXSr65gZmp5sLvnEA5yNqoGSHV9Aco0ApQO3Mq7v','2019-12-02 01:54:05','2019-12-02 18:04:03','SGNgocThao',NULL,0.00,4,5,20),
	(289,'Lê Trần Phương Linh','ltplinh3003@gmail.com','$2y$10$9rk7A8slIKB/iFG3T9mVSOh.UzuEdvqmRFv6Sl8IfKV5guRNasKb6','0987473003',1,'alSsylAZSSR2nj3XiEwy162uyVceWQc5NtAxz9tvFbIZc8pbYNpWd2UJplr5','2019-12-03 09:26:16','2019-12-13 14:46:02','Linh95',NULL,0.00,15,2,NULL),
	(290,'Vũ Thị Thu','vtthu1998@gmail.com','$2y$10$hoRSKqZsXF7hNHEZEi5iNuWK.AwfpVCQEJ3KapVK7xlOe5HwmTvZi','0562412646',1,'eL9mEGdyA69LpC2Q9x0eLRJwWPqvM3dyINXk2Q1hkajqxYz0liP8b1jbVwpb','2019-12-03 12:05:15','2019-12-03 12:05:15',NULL,NULL,NULL,NULL,NULL,NULL),
	(291,'LÂM PHƯƠNG THẢO LY','THAOLY17121992@GMAIL.COM','$2y$10$/WHvTd7javF4VuXVZVvb3OWd5Jx6Z1zXWs6vsX2BYfnb38bfY7yr.','0905701239',1,'DO0OcT14uLSIAVxbp56O1nOxgknFdKPIwNpxRPT5jxssk6WXs0Zr3Ex1LMAx','2019-12-04 09:15:58','2019-12-04 10:06:48',NULL,NULL,NULL,NULL,NULL,NULL),
	(292,'Thảo Ly','thaoly@gmail.com','$2y$10$VbqZv2aE7sz.u2Vty3bg1.A854PlXzNGkqeALlmzqKTr8VoIWWUdm','0337583871',1,'rXtygeCV6Y2wsxbDCb9G5Fd9sdGc4BHIZV6d65Rk62elz2OvIp1p9m2jxozP','2019-12-04 10:04:34','2019-12-04 10:04:34',NULL,NULL,NULL,NULL,NULL,NULL),
	(293,'Thùy Linh','linhhngo97@gmail.com','$2y$10$9E2t7M2pj0/WM6QoJ/1MUOS0Id0uZbI3w76m0lQvJu3wluiF9Vkfi','0962343066',1,'OzDDCJafKUjfnRs0rI0Bd85r7VALqZSbvvlauDA4DBExb7PZwelFhiYbCXy6','2019-12-04 10:30:29','2020-03-30 13:01:39','HDTLinh-001',NULL,0.00,29,NULL,5),
	(294,'Trần Đức Mạnh','tranducmanh310794@gmail.com','$2y$10$pk2TJw2cltlo.M/xJlF2BuErDNHme7r4jqYFOq.jCyj02S91Cbg5a','0363691636',1,'X5byTuv0tZw2vdOT3ASoJufhVSHFgOYud9dg55MjMnfofiGgRKz5Ohe79aPb','2019-12-06 20:03:57','2019-12-06 20:03:57',NULL,NULL,NULL,NULL,NULL,NULL),
	(295,'Vũ Phương Ngọc','Vuphuongngoc24121996@gmail.com','$2y$10$Ge7JutSSSRnHZ1TIAb2LW.uYMkiV95VnkwVApLa8olZUnlK1oBWmq','0977223796',1,'BFXS2MTA4ZKEUAUR1hZLxDuUfS0BySHwMzeXPHIaIGhasaci3zb6YKg6WpaW','2019-12-06 20:07:36','2020-03-30 13:01:46','HSVPNgoc-001',2,0.00,29,3,20),
	(296,'Lê Hữu Hiếu','liyouxiaoh2@gmail.com','$2y$10$s6EGS3g7k2BXKSSpgeDlgur7cZHWw2rdFthqh/s5bPlg29Gv.GKrK','0904665591',1,'693tNp8wcGUWZQG8VU2oUuJQTHC1EePKMsSEVQ9cq3AJpo8GxhaJThbMuurz','2019-12-07 14:58:37','2019-12-07 16:19:37','LeHieu',NULL,0.00,26,2,20),
	(297,'Pham Huy Thang','thanghand@gmail.com','$2y$10$oZCrYTK9.Ox1Ok4lFTz5HupaODyWuvuQbq9GR2slCpi.tosH0RPru','0973999386',1,'xrm3UTs7qoPa3w4gkNOS6133Z3WGvE8uGP1wg7YF4t7dK3uq3Zk5muQFfEgW','2019-12-08 22:40:04','2019-12-31 11:48:47','HDHuyThang',NULL,0.00,NULL,4,NULL),
	(298,'mai trung','ttrinhmai@gmail.com','$2y$10$l3fyTfm1Q4sFNtJppd997..mdurV7Eago8GJ9FKaTlQU5.TxFc5SO','0373728002',1,'ZFVrRORoevinFIH4Sn0pf1vNwUJ4WIABceiIhnKsgSTKX76Kl4yP7cHWrS5b','2019-12-10 10:28:21','2019-12-10 10:33:26',NULL,NULL,NULL,NULL,NULL,NULL),
	(299,'Hoa Thuong','hoathuong.ftu@gmail.com','$2y$10$4vNt0UKlCJmZR2VmNZkTWeAMEGGTj5VE6IuabYXPYkCJXl9.9.vMC','0986276966',1,'WuONURYqUWfHsXGOenSLHIwdkjgU105S2ucMCDCgZ7tF0eAzVzmph0H0FWui','2019-12-11 14:22:42','2020-03-30 13:01:53','hoathuong-001',NULL,0.00,29,2,NULL),
	(300,'Nguyễn Thị Lê HOa','nguyenlehoa2000@yahoo.com','$2y$10$fBX5KwEsmOnWNGvAUCuakuhAA.hG9QN4PXeB4grIFikufx9bfMuJG','0909828686',1,NULL,'2019-12-12 15:56:21','2019-12-17 17:55:34','HDLeHoa',NULL,0.00,24,4,NULL),
	(301,'trần văn thông','tranvanthong.thong85@gmail.com','$2y$10$uKxDER/H2Orm.e8z/Iw2IuEVQXndGS0pkRNShwnQhM/HCIrDJvxOK','0974662704',1,NULL,'2019-12-13 10:23:10','2019-12-13 10:23:10',NULL,NULL,NULL,NULL,NULL,NULL),
	(302,'Tran Hang','hang070696@gmail.com','$2y$10$VlRG0ThP/IEToBK/FWPG/.uYjIT1CEHxGDKT/A.yn990lQb3RjgGW','0943724530',1,'EFKUu97rrBP2kpg9m5FJtdOqlH2WrOvVflaZRHIF9hd3McnEUSAMhNhD7fRH','2019-12-14 16:04:17','2020-03-07 09:03:00','DDTranHang-3',NULL,0.00,4,5,NULL),
	(303,'vi đức duy','ravishopgiay@gmail.com','$2y$10$poGqfLINN8MMqTToCDBSVusqX2js3eOTkl5nG29bvN0ntBriuI2L2','0368187614',1,'UnuwDGtltPSbSl1OlJS66wZRDwAzk8Dmo1NfMWjfSGGDG8AKmf8nK4H1Q0i8','2019-12-14 23:50:07','2019-12-17 09:48:16','HSDUCDUY',NULL,0.00,24,3,5),
	(304,'Huong','holiday1668@gmail.com','$2y$10$OMI8761t5vTenAk2Jh0T1.P6srxVlfbEL3wil8GxCWGhEyl5eky1S','+84933117078',1,NULL,'2019-12-16 12:34:16','2019-12-16 12:34:16',NULL,NULL,NULL,NULL,NULL,NULL),
	(305,'Thanh Nguyen','nguyenthanh1811996@gmail.com','$2y$10$ESQGZs2cOES6.vVpBFznZets9sNjL8zAEs967pkLmONT9RNQr7t8.','0339891318',1,NULL,'2019-12-16 20:22:39','2019-12-16 20:22:39',NULL,NULL,NULL,NULL,NULL,NULL),
	(306,'Trần ngọc cường','ngoctrancuong@gmail.com','$2y$10$8JMPW7mra/S0vRq7ubApv.0BHurPNNaQ1/e8PSViQtvuFtx9TZ6jW','0899805999',1,'bPNP2jQMyGW1jg0dFizlJYr4iLwZQNt2jWJgM11rtdBB1oPUEP7AOMMgrSpE','2019-12-17 10:48:24','2019-12-27 12:08:35','HDCuongYB-3',NULL,0.00,4,NULL,NULL),
	(307,'Nguyen Huong Giang','minhgiang188@gmail.com','$2y$10$e69Sfg7Ky00jt72u.ws7KOSG260pOpbFEZjDEEssRuW1h6D0kwwCm','0915005599',1,'5FN2zUzgz0J2PeE9kkn2NZmg0fj0gybhmAbOMAxsTtSifeqrs6GExTRcvd64','2019-12-20 10:48:34','2019-12-23 09:41:01','GiangNguyen',NULL,0.00,NULL,2,NULL),
	(308,'SƠN NGUYỄN','nuelnguyen50@gmail.com','$2y$10$fbI7gykvdzQk3ZlXGxA10u/9zMGRWX0omSYkSQnP99FwL4pntPnVy','0921259281',1,'HCN0T6yBgTnO973czJpQLilLgWZHNnZSPE3f0pWSqjrzwiNkibIo9eWBYCBy','2019-12-20 10:54:12','2019-12-20 10:54:12',NULL,NULL,NULL,NULL,NULL,NULL),
	(309,'Lương Ngọc Anh','ngocanh.senmuoi1119@gmail.com','$2y$10$vd7LrkLLJYqUMs.uRXe2f.AatGGGZqEgVjBNpvIfbs1PkwEftPODq','0377552468',1,NULL,'2019-12-20 11:18:56','2019-12-20 11:18:56',NULL,NULL,NULL,NULL,NULL,NULL),
	(310,'Lan Anh','callmelananh@gmail.com','$2y$10$417xR8PcZC/v0zrJIc4GHOmogs1eDrCO5SKsndxqLv7A9eunhJCfK','0365978203',1,'SvtwvdY81No6mTUy41xyHCBx4ukZHiefqwJjcej4W2zsUv1K4D65lXsqnJi3','2019-12-20 17:17:27','2020-01-03 17:10:06','HDLanAnh',NULL,0.00,4,4,NULL),
	(311,'Lưu Hoàng Giang','hgiangluu@gmail.com','$2y$10$i9rG3bV24GcmZEBPCUnCDuhIMKGtCGsRmDeu3KaLQxIheWTYBTXUO','0816804996',1,'I92RFwp5maBPDgqUH62LRklKzZp2BH4deRgFzy7U08mCw9bDlCVfcKzOVMOq','2019-12-20 19:03:37','2019-12-23 12:17:50','GiangLuu',NULL,0.00,24,2,5),
	(312,'Lynhtran','tranglinh1003@gmail.com','$2y$10$sQJ0tNTQjRcyRNgXYsS14u.K4fj9.oX6eJORT/k0KWJJwphcW25TS','0979571665',1,'KMu1HGQBjzXss2AFMD4INm1beQFCjLaCEHS7YwP6i7poav02l2ZLan6YCTZ0','2019-12-20 22:17:14','2020-03-30 13:02:01','lynhtran-001',NULL,0.00,29,2,NULL),
	(313,'tran xuan vu','vutran.nuce@gmail.com','$2y$10$KjAQpTkbkK/BeuLHGErFR.QI4Ab1dE7xTLt8A4U3kf4M8LbIwJTJy','0332253166',1,'d1ZG4pjCWRxv2THIQoZAA1Py2KkkRi32MBhi2UY19N3nUib6j05SV2skCamW','2019-12-21 13:52:17','2019-12-21 14:09:02','VuTran-3',NULL,0.00,4,2,NULL),
	(314,'thaodat','thaobeiby03111995@gmail.com','$2y$10$DRcl9NpfoT8LxdQ8cR0xNOtgJwcsVCOg8B2xjy7dy3df52HiiM4aS','0338333009',1,'OeqUFAKgmjbKHWPA2uiSK8yEgRT3uuVv0kQj3cth3jHk5vf06PU9z0ht4HDY','2019-12-21 15:57:52','2019-12-23 09:41:39','thaodat-3',NULL,0.00,4,2,NULL),
	(315,'đỗ văn trường','truonghainghin1@gmail.com','$2y$10$7E6pON7mykM2Ci28hJCe/OHj6eD5oGrOUiepZ.wfx617B2Shnr2/q','0867171002',1,NULL,'2019-12-21 17:33:15','2019-12-24 11:18:01','HDTruong',NULL,0.00,NULL,4,NULL),
	(316,'Ann Nguyễn','annann102797@gmail.com','$2y$10$xENOVy.rlgTQQoAcIx5XietrEvAxpCCfevaftoa9MXPBf0GgJWPmG','0397978058',1,'ER0bPHUNtvkhTPOMHoLrtGNPa3YDcAy7Ag0vw88k5mH6ltx75j44pKVd2ThH','2019-12-23 10:34:16','2019-12-23 10:34:16',NULL,NULL,NULL,NULL,NULL,NULL),
	(317,'Nguyễn Trung Hiếu','hieutrung.tg@gmail.com','$2y$10$3Um1LNRNg8py.5UygYoNpeqpwR3.Zn73p3eqWUglmV3UD9QNbcLHe','0904566391',1,'H2Orh8IjvFaOOecPWFmsT6zdEryUVEGSHZ4uWXMGJRANwPdIBziUAop0gg6d','2019-12-23 15:29:03','2019-12-31 12:19:54','TrungHieu',NULL,0.00,4,2,5),
	(318,'Vũ Thị Quyên','vuquyen170795@gmail.com','$2y$10$prw.N1ns3LhHQdvtI1ggW.dldtMvoQlqbRSr5q9CNAm63BCVEXJX2','0354491012',1,NULL,'2019-12-23 16:29:47','2019-12-23 16:29:47',NULL,NULL,NULL,NULL,NULL,NULL),
	(319,'Tạ Thị Minh ANH','tathiminhanh2601@gmail.com','$2y$10$sAzML3EE9XUmOzL28be.jeehNyCfUOzWMiuxg3jMaF6LtuUwKXjf6','0934671703',1,'DUa40mON2K7JhT8omw4XhxaWBbzRm3MYMIUmXqWx0qXNbLyUBX2E6E9NSoSL','2019-12-25 00:53:36','2020-02-10 10:33:37','HDMANH-3',NULL,0.00,4,4,20),
	(320,'Cao Duc Minh','minhkeo83@yahoo.com','$2y$10$2GBbOtuxQqjoz3pmhOUZ7uumO62.Iqd0TrYDAjLgKtPp6HmkW67Iq','0983310383',1,'thpARazVxTR5dGwJnP98nPoPp2J5Gpx18IY2EEz2zYhxQfAuedDMbZbGbQBo','2019-12-27 09:00:44','2019-12-27 09:57:11','CaoMinh',NULL,0.00,24,2,NULL),
	(321,'PHAN DUY CUONG','cuongp89@gmail.com','$2y$10$mBQlrNZFdYYqYZfNhh7nG.4FjRiQBNvRTqE3Nh/RUxVH3nZr13naC','0984837830',1,NULL,'2019-12-27 16:32:16','2019-12-31 18:31:38','CuongLB',NULL,0.00,4,2,NULL),
	(322,'LE TRAN THUY ANH','ami.lee92@gmail.com','$2y$10$p/OSDRATQWgHG3GyHxzcu.RiIUgWhb9pA9ybOsvb/Fj2awBgRtbwu','0985503898',1,NULL,'2019-12-27 16:53:01','2019-12-27 16:53:01',NULL,NULL,NULL,NULL,NULL,NULL),
	(323,'Lý Trung Dũng','trungdungly95@gmail.com','$2y$10$MNUrS.9FX7lNFR3UDzAj..OGeOST77Xxf1RB8MaH5TZjRvZZfA892','0989803995',1,NULL,'2019-12-27 17:15:21','2019-12-27 17:15:21',NULL,NULL,NULL,NULL,NULL,NULL),
	(324,'Thoa Phuong','thoaphuong.1307@gmail.com','$2y$10$usFZwTNatz4aJp7w.WuUCOZ4XfArFBVHskBAG2swiwjPi02lzbXMW','0348242353',1,'PxcQC6JMOco5Q5UYQNf6gCetV08jb7uQtdrp8TURFGeBGuJQ02tLHtBigoV9','2019-12-28 11:14:27','2019-12-30 11:26:21','PThoa-3',NULL,0.00,4,2,NULL),
	(325,'Hà Hưng','hatrunghung2307@gmail.com','$2y$10$CaV33FLZWXeFf3MKuFcBPOU4.0DKssRnFe1neShxvMPwJWbIfStbu','0337995584',1,'Ruqn9zfjI3GOtFSMxQLWzMJZFf6c1WDwNMEo6QGomQVYTDFvxiowWFntRJpD','2019-12-28 17:38:57','2019-12-28 17:40:27',NULL,NULL,NULL,NULL,NULL,NULL),
	(326,'nguyễn cao uyên phương','uyenphuon262@gmail.com','$2y$10$d1LJJXKI9r9wtrz79VCq0OwCbttZIlXECrbj1n1nm.UceRxP4xoxK','0969432321',1,'LRzlsByPxzWw12oiromLgKbPsKln51sGFEEEHRiOBs7h2vfkJbKHlh7OwlkQ','2019-12-30 20:19:43','2020-03-30 13:02:09','SGUyenPhuong-001',NULL,0.00,29,5,NULL),
	(327,'Nguyễn Thị Tố Dung','Dungdzuidze_nt@yahoo.com','$2y$10$8DxRDC7f0OPxAFbs0xUXB.vkJkY0CgQ3NmJN9VO5QuIUPJvcIIqmi','0834432112',1,'YGPoDRKYQ1nlwR578QfOIXKRj1kVA83R11UBphu68KemVlHnMzxbtaz3i8EZ','2019-12-31 11:24:05','2019-12-31 11:59:31','ToDung',NULL,0.00,4,2,5),
	(328,'nguyen hong thai an','annieluvmonkey@gmail.com','$2y$10$E0UUqoLVXSKlVS4QYOXa2eyw0TiMwCray95nB3Z0w9UgIn.4VwZ5W','0907613950',1,'jU673IU60ucx7Nt7fnFiULQGOisaWpmz3T6hYMRQX9td91rFuafNFlmzcyVP','2019-12-31 13:06:29','2020-02-04 16:30:15','SGBaoBoi-3',NULL,0.00,4,5,NULL),
	(329,'Diem Quynh Vu','diemquynhvu140997@gmail.com','$2y$10$AM7wI.6sX0Jqf7yLtBIaOuJZfoIrAE5mJTw3KeYT8TIdrpiuYNocW','0984099766',1,'XXBnsLhM81NF4ibiHGK485juwylZOldVXLQgvAVi831KX8Gj03WMaT08tqqK','2019-12-31 16:41:18','2019-12-31 17:28:56','HDQuynhVu-3',NULL,0.00,4,4,NULL),
	(330,'Mỹ linh','thienhao_luu@yahoo.com','$2y$10$cxQ7/paYd/dCEo7roKOJdejKadKr4PvZ2fhUO3vvpiqNfwf5z1doq','0902366838',1,NULL,'2019-12-31 18:10:58','2019-12-31 18:10:58',NULL,NULL,NULL,NULL,NULL,NULL),
	(331,'Đinh Linh','dinh.linh.ftu.ht@gmail.com','$2y$10$XCUaKRciSEOFKYxsCOkHB..Qi2JBJlH.CfNA1C8IP14Gl455ZzKx2','0356346720',1,NULL,'2020-01-02 13:41:13','2020-01-02 13:41:13',NULL,NULL,NULL,NULL,NULL,NULL),
	(332,'Tôn Phúc Vân','vantp.ibc56@gmail.com','$2y$10$5BN9WCEtDRea/o0tp61gmOO/w2XebuiPTuSSd0KkH3p71U2451d2m','0357921486',1,NULL,'2020-01-02 14:53:21','2020-03-30 13:02:16','HDPhucVan-001',NULL,0.00,29,4,NULL),
	(333,'Linh Hoàng','Linhhoang0986@gmail.com','$2y$10$N/gk22LDMRgJU.EUnsEIm.52HSj085JEP/Whi3ehrNGXucV//1DTq','0948666188',1,'QrIx18UMWHu03DYsVbXKlQ0YdZhqDG7IiSYs3DBRHTw1Tu004qVI04LG0eaC','2020-01-03 09:35:57','2020-04-04 16:11:28','HDlinhhoang-3',NULL,0.00,4,4,NULL),
	(334,'Nguyễn Thiện Thi','thisay@gmail.com','$2y$10$Pof1.TRjno1X8043zSGjnOGe.SFGiixUMtVtmp.MWjhPgkuAn5twK','0865980880',1,'DOiHD2ma5pgJknUEQYLBXxuk9SvzZ7VjSiRujE6XNnHi2sOTYNsqUbSj2awo','2020-01-03 15:20:38','2020-02-08 09:57:10','DDThiSay',NULL,0.00,4,5,20),
	(335,'Khánh Ly','khanhly25893@gmail.com','$2y$10$1MTZmrJ3JKqJN2APnDTROePYAG91cTa4wBHZVNMgmIIt8cP4mk6py','0888423535',1,NULL,'2020-01-05 11:38:49','2020-01-05 11:38:49',NULL,NULL,NULL,NULL,NULL,NULL),
	(336,'Nguyễn Thanh Hoa','hoa.nt31088@gmail.com','$2y$10$fkTow1DvI/C/udWYf5tnbOUFU3jxJcjhTUm6Er9x3JHF7fp.9fneq','0977411552',1,NULL,'2020-01-07 08:30:15','2020-03-23 16:39:30','HDHOA-3',NULL,0.00,4,4,NULL),
	(337,'Lương Nguyễn Thu Trang','btjunior159@gmail.com','$2y$10$dr21MTzgNTYIkjSH9DjEz.ivGmR/f9ukl.I19kQQD3z31Pw4K4ZkW','0914902917',1,NULL,'2020-01-12 19:34:44','2020-01-12 19:34:44',NULL,NULL,NULL,NULL,NULL,NULL),
	(338,'Nguyễn Hữu Hoàn','h2hoan89@gmail.com','$2y$10$zzvQ6t2ucvOSo9hZfucOieuAiIMkDmUf67KSvfK8wyYUE7NLPSco2','0973998191',1,NULL,'2020-01-14 14:46:48','2020-01-14 14:46:48',NULL,NULL,NULL,NULL,NULL,NULL),
	(339,'phan duy cuong','mrtrainheartnet@gmail.com','$2y$10$XE6p4.jnYF1DNpaZki07YudLMHj4PQWXUAdaa1e8MFLFe1fGnbM3m','0984834830',1,'g0Zam3g3hAoTCrYY0xUgT3LM32DTVfH5Bj3TmNDXOSiZBtBnz5uQJsoBkxGt','2020-01-15 23:27:08','2020-03-31 16:48:27','CUONGDG',NULL,0.00,4,NULL,NULL),
	(340,'Hoang Hong Trang','nuppi2011@gmail.com','$2y$10$65OwQbI3Rm/kAT2oCsnOteSGuU6knTl8h28k96uUzFiJu9cduBUwO','0911980880',1,'mHF3dgKC1ClvTspKEyB6IJ9s6uKyPmkNKeE31qetdkgN5nbdVBZ6wpUKGLdO','2020-01-16 16:51:12','2020-02-12 15:57:52','DDHoangTrang',NULL,0.00,4,5,20),
	(341,'nguyễn thành','nguyentthanh98@gmail.com','$2y$10$Ak9CGHpjzqOPjYxgUFG6Je3HI1KPhUb7hTI0MvWrmvMXs3i7TW4Sq','0947258988',1,NULL,'2020-01-28 22:04:14','2020-01-28 22:04:14',NULL,NULL,NULL,NULL,NULL,NULL),
	(342,'Hoàng Kim','vph268@gmail.com','$2y$10$xRQWJZiP8nyg3EzrFpQLq.NiC5jstqWVMQPENCy7Y/3Y4801cmkZi','0972389712',1,'yVVxAaHc83BiQdA3hFZb7nPEdxFMrEkVWEgJre4feR0PCptJjhRPdzoMQTwY','2020-02-01 10:49:22','2020-02-22 20:27:23',NULL,NULL,NULL,NULL,NULL,NULL),
	(343,'Nguyễn Thị Bích Hà','bichha11092011@gmail.com','$2y$10$hZkAfn10L3HYYIbG7.nYXePVpHVQwNSHyxvq5uJ2trMTXwgkbt8GK','0966636808',1,'vft7Coqud18eBfjZLj76POUqW4cmIR9XzLaWkyQ30uXIXeIlpYFi2UtZzKJq','2020-02-01 13:12:26','2020-02-01 14:23:38','BichHa-3',NULL,0.00,4,2,NULL),
	(344,'Thuy Anh','thuyanh1497@gmail.com','$2y$10$D5ZrLgo0Tyy0jx11ky5zi.BvyWQ6xebI3tjeaXHOJuagp6k78otG6','0963110497',1,'j9Osoe7zR5JZtyNZK4EPROFankz4FEfcwc1nh4DsUqii1Ux22p2M82Pd0OOE','2020-02-03 11:35:56','2020-02-03 16:07:01','HDThuyAnh-3',NULL,0.00,4,4,NULL),
	(345,'Nguyễn Thị Phương','phuongbrisky@gmail.com','$2y$10$AnuchgBJasIMR8cJNj5pIu4iF2zzDHnzYt4rZUZVBmHIOVfv4dNau','0396212596',1,'ZO7US3trsEGa4hLbmuKP8D1c27st1QXRgLgh8Zdp3srsSNHTRqK59A79mkcH','2020-02-03 15:50:15','2020-02-03 16:08:10','DDPHUONG',NULL,0.00,NULL,5,NULL),
	(346,'Hồ Thảo Anh','thaoanh276@gmail.com','$2y$10$OsQwFFX/S3eOeFSVHDlQz.UUoxtx/G8PO5fa6BhTAXnLfdMc9YR6e','0847846093',1,'oOzuPtIKgSlNm6UtSihwvfeJNe4LmZr1MfZcNdX1IPLD2xTbzvg9cDECwWWu','2020-02-06 13:12:19','2020-02-06 13:42:04','SGHoanh-3',NULL,0.00,4,5,NULL),
	(347,'Lê Thị Thanh Huyền','thanhhuyen.hy174@gmail.com','$2y$10$EgVzqvbCNcxqAM70Ocp4I.OIPJbn0ct10UiwTRNo348vvj64mHJGK','0966374180',1,'jjNbTPajwQSS12HdxOkhrabAVkaXj6MTfyeXg8NIcOXo5WSSiArqIkSGXXsj','2020-02-08 09:42:46','2020-03-24 08:23:57',NULL,NULL,NULL,NULL,NULL,NULL),
	(348,'HANG88','min.auth09@gmail.com','$2y$10$cwNoX43AXWItLLEehI.7yOjQY0j4EL8T6gyhIN.oVuc4J.mmhW20G','+84979120989',1,NULL,'2020-02-10 09:40:21','2020-02-10 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),
	(349,'Nguyen Huu Van','nguyenhuuvan@gmail.com','$2y$10$UfAEUPM1Oofuww7vw9093eEe9KkQojKeL8Zq.FxuRtNd1ZFCJc/hu','09118821117',1,'SbzaXQoP3S2euvuucBCZlqIXI2ARI9z5gm75jB8HShUTlWX02GXAsU40LYOh','2020-02-10 16:01:23','2020-02-10 16:01:23',NULL,NULL,NULL,NULL,NULL,NULL),
	(350,'Trần Thị Thu Phương','phuongtran27794@gmail.com','$2y$10$FqWWccKf8a.dx78H0BSAFO.34qBL9wKvRDlzqnmKT9pWA9rR8RWzq','0963726383',1,NULL,'2020-02-10 16:53:55','2020-02-10 16:53:55',NULL,NULL,NULL,NULL,NULL,NULL),
	(351,'Le Hong Phuong','lehongphuong1901@gmail.com','$2y$10$uioo.jhxQ9Ch90BP9GBgb.ftWbP35oRn8qEkuCSJLTkBFhNekl8bu','0326748675',1,'09fxQYnMpQSzvR7raDL821G0YneXwiCnpzFxTRoazQb7AhqSUppnhbWDDhuV','2020-02-10 21:31:49','2020-04-03 22:48:38',NULL,NULL,NULL,NULL,NULL,NULL),
	(352,'Mai Minh Đức','ducmami@gmail.com','$2y$10$VppeZnP4NqGH3xWx0JVzNOdS2XAEEkcrd9/FcrTcX1CwE2JElfZLu','0982633388',1,NULL,'2020-02-12 08:47:02','2020-02-12 08:47:02',NULL,NULL,NULL,NULL,NULL,NULL),
	(353,'Phạm Xuân Chiến','mtchienkhanh@gmail.com','$2y$10$teDE6za0K5Id4PpSwteDh.I5ImrOb3hhUD1Upix7EQFsnxO44GF4a','0962910450',1,NULL,'2020-02-16 14:45:41','2020-02-16 14:45:41',NULL,NULL,NULL,NULL,NULL,NULL),
	(354,'Trần Quang Hải','tranquanghai74@gmail.com','$2y$10$L6IVa8UGlnkDX90Jx.AfreEKWRB8U0z36DkKftL7QdbHQw.5R5SAC','0352223263',1,'9e7MZmJbrgjlicBaJB5cfXMetH4Jvr1VBCcWLLNz5mvyYchqgpiHwbUDJeup','2020-02-20 13:27:38','2020-02-20 14:59:56','SGHAI-3',NULL,0.00,4,5,NULL),
	(355,'Phạm Thu Hiền','chenyuzan94@gmail.com','$2y$10$CtXvUZCzBbgOinZZ6z/nEuiZIUr54OlEqW43eFnws4/t7LXTcJO.G','0985572701',1,'3QKZl02a7UwkBEIDpfhzUKrtx6sVgFfpfeyATyyv3I9h8xJaFqEGK1KMr6ao','2020-02-20 13:42:43','2020-04-01 11:46:31','DDPHien',NULL,0.00,24,4,NULL),
	(356,'phạm hùng','phamhung7574@gmail.com','$2y$10$wIIP1wa5v4q1XunJ1TPgBOn4UtNbw0t3.JO10jo5nYkIm7bwd17TK','0909097574',1,NULL,'2020-02-22 10:58:20','2020-02-22 15:03:57',NULL,NULL,0.00,4,5,NULL),
	(357,'Phạm Hùng','phamhung2211@gmail.com','$2y$10$Doqir5Vlgxnu5MQ.Fq4Rye9StHWMvjtGbhcyg.6tg3Wb.s4Is5hL6','0867171003',1,'LVN03grnSa9PuteH6C3swmfZKfPwky3U2xixLZT8qXjjyGcOXFSLK20A3BYl','2020-02-22 14:28:34','2020-02-22 15:04:10','SGHUNG2211-3',NULL,0.00,4,NULL,NULL),
	(358,'Mamuc','toolasttolive@gmail.com','$2y$10$NpGjUkDEvrH2SHdrHGkCc.IqZVfcAePKQa7qTOBgMjzfvfdZJ61jK','0943218939',1,NULL,'2020-02-24 02:14:15','2020-02-24 02:14:15',NULL,NULL,NULL,NULL,NULL,NULL),
	(359,'TRẦN KHÁNH HẬU','hautrankhanh@gmail.com','$2y$10$GBwTFHDyM7hM91SXkQ6ba.fnm.zrUCWiKTVhJnp34A1eZzcbBGMfS','0964237423',1,'SoZCuTUEARBiMBfh7jDtTIZ6Hi7CeuOcWJmDsd6P945XzgK0hGcIQKdXAMhP','2020-02-24 11:12:54','2020-04-04 10:35:38','DDHAU-3',NULL,0.00,4,5,NULL),
	(360,'Tien viet','tienvietkt44@gmail.com','$2y$10$QQlFNj.P5WgVyXcpHEWUV.YgmgNyOFhRWBcLD299wOw7LkQun0rOe','0961101290',1,NULL,'2020-02-25 16:14:48','2020-02-25 16:50:34','HDTVIET',NULL,0.00,4,4,NULL),
	(361,'Hải Bùi','haibv2089@gmail.com','$2y$10$9F75Ri2Mo1CTRFu0XmI7o.GOSBY6jN6JJN6lYu/Y3PjyMLF.UEKYK','0705657930',1,NULL,'2020-02-26 22:21:40','2020-02-26 22:21:40',NULL,NULL,NULL,NULL,NULL,NULL),
	(362,'Phan Thị Lan Anh','Lananh711@gamil.com','$2y$10$6er7PmvDIyB2JtyEYBpcF.8Xh9tSDPHiJq64mAP4p2l3ShFJwYinC','0975905423',1,NULL,'2020-02-27 12:41:26','2020-02-27 12:41:26',NULL,NULL,NULL,NULL,NULL,NULL),
	(363,'Phương Võ','PhuongVo@gmail.com','$2y$10$3rSFLmbgFbUx3HZgs2wPRuPdDfXnhLDTHLKCETFnymikVIqPd8kGC','0964419019',1,'66s7wgAHUmXEC8A5S8vzgOxfxuCzsjZ1EhYbwNqqJ3MmRMLTzaTEQjFrS2gy','2020-03-04 09:19:23','2020-03-04 09:19:23',NULL,NULL,NULL,NULL,NULL,NULL),
	(364,'Thích Đạo Khôi','thichdaokhoi@gmail.com','$2y$10$ffJKucfUmBuFtQeC5bb7quGcja6S0TwHROZiMWzC1dIuSTyjmdCE6','0969901188',1,NULL,'2020-03-04 11:17:10','2020-03-27 15:33:43','ThichDaoKhoi',NULL,0.00,4,2,NULL),
	(365,'NGUYỄN THU GIANG','GIANGBAOANH27@GMAIL.COM','$2y$10$cnvUvOrKqN1qs3mOsXQswuwkEUvUqUBlW0Z70CFQ2uVW1hp2/LhOi','0903425254',1,NULL,'2020-03-05 13:43:40','2020-03-06 09:15:16','GIAGIA',NULL,0.00,24,NULL,NULL),
	(366,'An House','binhan.anbinhvn@gmail.com','$2y$10$paLhSwkW1dJf6c2p4Oy9AuNdjee3ur3vU0i699sifAJIOMvKIhlhq','0979275985',1,'MC71onUl8OxqyiEDazUIRxBRWVpWH4gilavpuN5glkp0v3LhyqVN1ul1Q6zr','2020-03-05 15:51:39','2020-03-05 16:46:24','AnHouse-3',NULL,0.00,4,2,NULL),
	(367,'vu thin quynh anh','vuthiquynhanh1188@gmail.com','$2y$10$P1o7Kt8X8GhZ8VrZ6g0c3OBed1K2DxEm/5xf3TtWd8FrbPA0jcA5K','0385121616',1,NULL,'2020-03-05 16:34:53','2020-03-05 16:34:53',NULL,NULL,NULL,NULL,NULL,NULL),
	(368,'le anh tu','susifc2013@gmail.com','$2y$10$LKIYatg0Wa.GIv0K6xl6neK05QPDbfAoHjjdYwOI9npkMdnhrBe..','0375502222',1,NULL,'2020-03-06 14:20:46','2020-03-13 16:01:59','DDLETU-3',NULL,0.00,4,5,NULL),
	(369,'tuyet123','abc@gmail.com','$2y$10$TXSMXFXFSPuXKk6oyjCF.u6NqpjQGs6gkkCiAswh4viPAsn.pqhtW','1234567890',1,NULL,'2020-03-07 14:06:46','2020-03-07 14:06:46',NULL,NULL,NULL,NULL,NULL,NULL),
	(370,'Nguyễn Hoàng Phương Thảo','nhpthao000@gmail.com','$2y$10$OpnMwtf38KwG17G/I7KMIOuDRjKdQ9gy.m0kf/cTEo80y3C3DU0A6','0938357867',1,NULL,'2020-03-09 16:26:44','2020-03-09 16:28:11',NULL,NULL,NULL,NULL,NULL,NULL),
	(371,'Cồ Hải','nguyenxuanhai9001@gmail.com','$2y$10$E2qrtrX8IYHHro0MgDFrEe//bZ1XZGbnRKyD/jROfMX6FYCjTkQWK','0976200910',1,NULL,'2020-03-10 07:19:16','2020-03-10 07:19:16',NULL,NULL,NULL,NULL,NULL,NULL),
	(372,'Phạm Xuân chiến','thukhoithuyen@gmail.com','$2y$10$0FpWYCiyHKqVcDeGyrrAUOVNEiCvZJCuAxHncnwhkTq5NrGg3YzF2','0941169699',1,NULL,'2020-03-10 08:18:55','2020-03-10 08:18:55',NULL,NULL,NULL,NULL,NULL,NULL),
	(373,'Vũ Thảo','vuthaoblabla@gmail.com','$2y$10$hfTKtwvoLWfeDyy2ZbW5Oue/W2Qh3LEwu7y33OhxuLi9rqF8DgjSu','0345177931',1,NULL,'2020-03-10 15:43:11','2020-03-10 15:43:11',NULL,NULL,NULL,NULL,NULL,NULL),
	(374,'Nguyễn Minh Ngọc','Ngocczy16@gmail.com','$2y$10$Jo4zI84qBZE84wZGqgirnO6ZfIFH7j1PHYae3DfpiIgZJd4/joV9K','0372958370',1,'kBPviGED9ylQNMmyuylX1D8a1f6lNm0rePN5uafuk6iVi3jIHiTHOguhdWtP','2020-03-11 11:04:44','2020-03-27 15:39:17','MNgoc',NULL,0.00,4,2,NULL),
	(375,'Bùi Thị Trà My','buitramy.2701@gmail.com','$2y$10$RM5.urRv5krxnT2y8VcpQ.3ZueYeksF4lDucS3PhmmJhiE.a1Iit.','0973601219',1,'B5l68USqxvRfiPPdS9k9pxPKBZqVFajkf3nAmi8LwwHsFvSi0CdLSrgmRzOi','2020-03-11 14:06:27','2020-03-11 14:21:15',NULL,NULL,NULL,NULL,NULL,NULL),
	(376,'Lữ Thu Hằng','luthuhang182@gmail.com','$2y$10$tJTnzM2/kKxGgVAdwkv8mOfEZ/PSLAh7CCZoF57eqfLRcn2vuS6My','0582111481',1,'zNuIH4YkL1ckoVMUNo7SDjSAsncZIpr8FakVBz1LkHyWtm61KnRzU9o2CEu8','2020-03-11 16:12:09','2020-03-14 09:39:44','HANGORDER',NULL,0.00,NULL,2,NULL),
	(377,'TRAN HONG THU','phonglinh468@gmail.com','$2y$10$OjtsQvk3qWLWejFJDb0C4eK2ObzE8q3vx7nGn1AHfdJrIIWBeTse.','0363605376',1,NULL,'2020-03-15 09:32:29','2020-03-15 09:32:29',NULL,NULL,NULL,NULL,NULL,NULL),
	(378,'Lê vân anh','vananh30011998@gmail.com','$2y$10$8wUdK9tdu4pSQla/vuq0Ju8L2bispBbV4ZHYTvScAdC6iNG9hnPBS','0971714398',1,'pv0YCSccinvtP8Y8seqZJVFSU1fxsd9mCl0S0nyxyhA0vIOPycTLB28wPmVI','2020-03-15 12:20:07','2020-03-15 12:20:07',NULL,NULL,NULL,NULL,NULL,NULL),
	(379,'Nguyễn Thị Luyên','Loveparadise281097@gmail.com','$2y$10$1l.CeYWjA2Q/Ur8GiSh2duaHOZjKX3n6WRqwYksrgZya/98YPsQhK','0379902898',1,'p3NuTkPObXYJqu3qUbGg8JPARJC97cNJQoNYM5b78XApbpMKnk7jwiqsB6xh','2020-03-15 19:36:43','2020-03-22 15:13:40',NULL,NULL,NULL,NULL,NULL,NULL),
	(380,'Nguyễn Vân','vanchip.10@gmail.com','$2y$10$1/Tl9nqyPh3b0kFLEJDjWO6uyrdtdfj1LgeGUrxNwxrUHewpAl5MG','0977905543',1,'QzOcs4kTWP9GF0mGH876fNC8wZ14tHW0NHyEOeQNREo0XBcd0VRHAlRcofcT','2020-03-16 09:40:39','2020-03-16 09:40:39',NULL,NULL,NULL,NULL,NULL,NULL),
	(381,'Nguyễn Tiến Kiên','kiennguyentien5@gmail.com','$2y$10$Vaf/WWJXJWejCDVHhrivGeaGh/F45QknGYXIhrai5krDn/sjDK6mq','0989280654',1,'SCLmQjJej06cpuIhvmwkWtWAKmCj1PEY9VFeMvlkJjbSdCE8FRrPS75SoNsD','2020-03-16 11:11:04','2020-04-04 10:13:08','DDTKIEN',NULL,0.00,4,5,NULL),
	(382,'Nguyễn mai','mainguyen25101990@gmail.com','$2y$10$sH21FLvSqUBSA0IpaY4lEeER9RBb1jfZoqT07tIR.XXhP6l9CBihG','0982437551',1,NULL,'2020-03-16 12:56:38','2020-03-16 12:56:38',NULL,NULL,NULL,NULL,NULL,NULL),
	(383,'THƯ TRẦN','lannguyen5120@gmail.com','$2y$10$/0/VRE23luyT5l9ICTuyw.FhmQXcwJ3oQyIJScxBUepGv7VN9VFY2','0977085791',1,'ERq3baTc1hSWCuJuidA8ltb6iTRNLOC1iP2hQ31ej3CVEfIHzFmZYHNI0zIp','2020-03-17 14:22:48','2020-03-17 15:03:16','ThuThu-3',NULL,0.00,4,2,NULL),
	(384,'TRẦN THỊ HUỆ','Huedung2222@gmail.com','$2y$10$1KD7vjYVq8PFGh20uH7WWubbEVZGgDCg11xX.mZSNN/wbjp74tnce','0869188692',1,'uwAF8RfIiSexkWXNiVH7hFYR3ird2QFts5VI6nBCzyKfZHwipw7T0Lttdd2K','2020-03-18 13:11:22','2020-03-18 16:40:41','HueBN-3',NULL,0.00,4,2,NULL),
	(385,'Đỗ Huyền trang','cobehattieu965@gmail.com','$2y$10$zntiam0ZlwuBGFtrDdsREOs.F9li.SKKFGRouDORvbUC2BJTHDx.G','0977196816',1,NULL,'2020-03-18 15:21:31','2020-03-18 15:21:31',NULL,NULL,NULL,NULL,NULL,NULL),
	(386,'Nguyễn Thị Thanh Hoa','tina81184@yahoo.com','$2y$10$Qr404ahyLk6tgq/dmkZBqOX2KOIkp4bhAzaQliKn/gXTXC/O/c0Xi','0904595950',1,NULL,'2020-03-18 16:46:12','2020-03-27 14:48:16','tinahoa-001',NULL,0.00,29,NULL,NULL),
	(387,'Hung123','qn.hihi@gmail.com','$2y$10$Oj7Rz5yR7cC.PITu7P4shufDzaiFTmMyUHS6Wz1h3MV8uHAfKsFna','0974392239',1,'ThNIw4b63nbNNRdbDkbpl6lElsovzo0NZu3KSNBt7FCwOIkU6G6BSDWGMrjm','2020-03-21 13:39:17','2020-03-23 08:57:28','Hung123',NULL,0.00,NULL,NULL,NULL),
	(388,'Chu hồng phương','chuhobgphuong1990@gmail.com','$2y$10$Bez2y6oraiaNVTXTaANpVOCOREGJftyqValA81ioyxuLgOWgIusH2','0978687418',1,NULL,'2020-03-21 17:33:46','2020-03-21 17:33:46',NULL,NULL,NULL,NULL,NULL,NULL),
	(389,'Hồ Thị Huyền Trang','thothihuyen@gamil.com','$2y$10$fuGKk73lKwjZnSAKec6nGesnr/2Ey1thp3lj1SE6IPcnXoNwLSeia','0337348985',1,NULL,'2020-03-21 22:30:53','2020-03-21 22:30:53',NULL,NULL,NULL,NULL,NULL,NULL),
	(390,'hồng nhung','Vukimngan13062004@icloud.com','$2y$10$PWHuZzbBCEM9C1lmzlSU7utgIIHeIyRZh5qFHUefFR/v9PfxRQmFi','0584647929',1,NULL,'2020-03-22 14:49:26','2020-03-22 14:49:26',NULL,NULL,NULL,NULL,NULL,NULL),
	(391,'Hồ Thị Huyền Trang','thothihuyen@gmail.com','$2y$10$0/t3w0sDfAIQzly45vkCrOId70qywV2aGQsCq1wgZQSI6j9FywsL.','0349266129',1,NULL,'2020-03-22 19:33:53','2020-03-28 13:35:44','HDHT-001',NULL,0.00,29,NULL,NULL),
	(392,'Nguyễn Hoàng Vĩnh Phúc','vinhphucnhk17.gsc@gmail.com','$2y$10$Z52cwyCWN2g0eYQvrXlty.1.KS4RNaM.W/QlY/YoTHYBSr0givwi2','0962370321',1,'TB9xNist8YBiMsyGFnH5RV8FUHlpWHzvmnuM6sn15XXhjZiQiBXGKMQ4fWdK','2020-03-22 22:47:51','2020-03-22 22:47:51',NULL,NULL,NULL,NULL,NULL,NULL),
	(393,'Ngô Thị Sáu','hoanghontim18@gmail.com','$2y$10$mEQlnPaZQKzrwbNMt/OlZuN1SapymoWrzbj9o3K.AkTdObvPvtrKO','0934655634',1,'AKkXgwrFOTjojGnMUgQiNDZoyH5zcc6ikxIwfCH0YWsJwtXfssQ94fHqPQ0B','2020-03-23 11:26:08','2020-03-23 14:18:38','SGSAU-3',NULL,0.00,4,5,NULL),
	(394,'Nguyễn Thảo Phương','phuongkt994@gmail.com','$2y$10$4yI.Zq8j.VXXacTTh.YbUelAc.t1SL2d.Z49I43b/jUDXosnUA6uC','0911030327',1,NULL,'2020-03-24 09:34:52','2020-03-25 14:49:34','HDPH327',NULL,0.00,29,NULL,NULL),
	(395,'Đình Nguyên','dinhnguyen3094@gmail.com','$2y$10$KvnYM.VrHLNJzcwiQUGNmu9B8GPunAVMa0WHCGAleeo2tYojA4UsW','0918175879',1,NULL,'2020-03-25 00:25:44','2020-03-25 00:25:44',NULL,NULL,NULL,NULL,NULL,NULL),
	(396,'Mãn như quỳnh','quynhanhls2000@gmail.com','$2y$10$ogY.n7x.nkGV7zkES2a9jeuHyPCID86eDXyCe/9jPaIhAam1OSYry','0982833035',1,NULL,'2020-03-25 13:12:42','2020-03-25 13:12:42',NULL,NULL,NULL,NULL,NULL,NULL),
	(397,'Mai Hoang Yen','maihoangyen8x@gmail.com','$2y$10$EjkNXcjSmaZJ1L5ZuygT2eMXf9ze5y5lJsJC97G9NbfVPkypMAIYi','0934585445',1,'Zjml50MsbUjGtyhA6giY6ndy40X7QJ81XcAAHzgy7ztsj1sQ7YMu1GkJKfq6','2020-03-25 18:22:32','2020-03-25 18:22:32',NULL,NULL,NULL,NULL,NULL,NULL),
	(398,'Đỗ Mạnh Trường','doxuanphuc731995@gmail.com','$2y$10$6VYsuiMNuxACDz8qSOT2YuTKBQQcnl3xJYMp95SpP93k1Glmslwoy','0886669666',1,'uZoPF9gyA1GzNYVR4oiZsn3Ql0qH4z3Y61IHNrHlrnEC9c5UPp3JIPzcZ1KA','2020-03-26 14:44:57','2020-03-26 14:44:57',NULL,NULL,NULL,NULL,NULL,NULL),
	(399,'Hoàng Nhật Thành','nhatthanh.medlatec@gmail.com','$2y$10$hLqsDmecNrujWK.FNn5TM.dzKaU.ln78sOryX4r9hnIhM4mBldrCm','0915901466',1,NULL,'2020-03-26 17:07:55','2020-03-26 17:07:55',NULL,NULL,NULL,NULL,NULL,NULL),
	(400,'Nguyễn phương hà','phuongha028@gmail.com','$2y$10$rUbXrRfoY4EyeihYHajw2.tQQUW3DgYckGU8wrI3RNVQs19YXQwIG','0917988282',1,'LVzcx3CN9BmgkPATVKf5eG7Dw5e2kgUseBIO7SkvgKqa0RXq8EpAeEf4Wn5U','2020-03-26 21:23:14','2020-03-26 21:23:14',NULL,NULL,NULL,NULL,NULL,NULL),
	(401,'Tạ Minh Xuân','taminhxuan1410@gmail.com','$2y$10$3.gd1E2/rdYa5YxpEbC.ReXrRQy5zHQrq22.It8kY/3Uwm8Qyr9MO','0969115516',1,'bUHldOJwVogK6hv2h0gyCbgjFrc2XGl3vKAgK1VbgtuXYuFqT22cVxOPxkaQ','2020-03-27 12:16:42','2020-03-27 12:16:42',NULL,NULL,NULL,NULL,NULL,NULL),
	(402,'Nguyễn Đình Đông','Donght1980@gmail.com','$2y$10$/rq7HCzkbv3Q8k9XAvzx0.w2NE7Is0emgUYCIDCHs00viKGGZKHtK','0912803835',1,'0WZWDGTys1SrN3wjq0Ruf0UjmArcmIvnEMbVb8fuJBAvuCuxJA5fJmZfbRCc','2020-03-27 13:09:42','2020-03-27 13:09:42',NULL,NULL,NULL,NULL,NULL,NULL),
	(403,'Trường Khuê','lexlutho11@gmail.com','$2y$10$u4zmR3gwNOapZcCmw.mobOjNayPNZA8FqbMUqy0DEkLa2SnWk/zQy','0355222010',1,NULL,'2020-04-01 08:38:18','2020-04-01 08:38:18',NULL,NULL,NULL,NULL,NULL,NULL),
	(404,'huynam','hunghohp@gmail.com','$2y$10$aqGvGiKm3f/Wdt43BGL9WedWs702epLA7OlfjMOQbLLyK6uctYfPC','0838056886',1,NULL,'2020-04-01 11:25:45','2020-04-01 11:25:45',NULL,NULL,NULL,NULL,NULL,NULL),
	(405,'Phan Thảo Ngọc','Phanthaongoc98@gmail.com','$2y$10$9WUOaj9q9qV6db00NFogtuRfpkRKg2zJVuczJySvUPMmMt7KMLowC','0982550598',1,NULL,'2020-04-01 15:57:32','2020-04-03 13:38:48','NGOCLB-001',NULL,0.00,29,2,NULL),
	(406,'Trịnh Thuý Hằng','trinhthuyhang081095@gmail.com','$2y$10$alHRF8An3wxyPxrJoTfqv.IwLvswCZRC/Jsp/z.Sfvu49oiHfoaey','0989204766',1,NULL,'2020-04-04 12:55:26','2020-04-04 12:55:26',NULL,NULL,NULL,NULL,NULL,NULL),
	(407,'Trịnh công thành','trinhcongthanh1987@gmail.com','$2y$10$1n9vIxCzPJNT310buqfXPOT4WlTb3TvqFkrD84svgxvQMknLNuDKm','0976361939',1,NULL,'2020-04-04 12:56:18','2020-04-04 12:56:18',NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table delivery_addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `delivery_addresses`;

CREATE TABLE `delivery_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commune` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Không sử dụng, 1: Sử dụng',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exchange_rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exchange_rates`;

CREATE TABLE `exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vnd` double(11,2) unsigned NOT NULL,
  `ndt` double(11,2) unsigned NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 : Không hoạt động, 1 : Hoạt động',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exchange_rates` WRITE;
/*!40000 ALTER TABLE `exchange_rates` DISABLE KEYS */;

INSERT INTO `exchange_rates` (`id`, `vnd`, `ndt`, `is_active`, `created_at`, `updated_at`)
VALUES
	(1,3500.00,1.00,0,'2019-08-21 23:02:37','2019-10-04 22:06:17'),
	(2,3350.00,1.00,0,'2019-09-09 09:32:17','2019-11-07 13:02:24'),
	(5,3390.00,1.00,0,'2019-11-07 13:02:16','2019-12-25 12:15:32'),
	(6,3420.00,1.00,0,'2019-12-25 12:15:24','2020-03-21 17:13:52'),
	(7,3440.00,1.00,1,'2020-03-21 17:12:14','2020-03-21 17:13:52');

/*!40000 ALTER TABLE `exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table home_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `home_menus`;

CREATE TABLE `home_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ideas_box
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ideas_box`;

CREATE TABLE `ideas_box` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `user_id_reply` int(10) unsigned DEFAULT NULL,
  `idea` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Y kien gop y cua khach hang',
  `content_reply` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Noi dung reply cua admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Chưa đọc; 1: Đã đọc',
  `customer_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Chưa đọc; 1: Đã đọc',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;

INSERT INTO `messages` (`id`, `customer_id`, `title`, `content`, `created_at`, `updated_at`)
VALUES
	(1,412,'Hotline Hà Nội','Hotline Hà Nội','2020-07-23 09:49:28','2020-07-23 09:50:09'),
	(2,411,'test','stestset','2020-07-27 09:12:34','2020-07-27 09:12:34');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2017_11_04_103444_create_laravel_logger_activity_table',1),
	(4,'2018_10_03_030142_create_exchange_rates_table',1),
	(5,'2018_10_05_152948_create_delivery_addresses_table',1),
	(6,'2018_10_05_153033_create_customers_table',1),
	(7,'2018_10_06_090542_create_customer_profiles_table',1),
	(8,'2018_10_08_091930_create_orders_table',1),
	(9,'2018_10_08_091945_create_order_addresses_table',1),
	(10,'2018_10_08_092142_create_purchase_order_items_table',1),
	(11,'2018_10_09_074104_create_order_temps_table',1),
	(12,'2018_10_10_225528_create_slides_table',1),
	(13,'2018_10_12_163624_create_feedback_table',1),
	(14,'2018_10_16_155402_create_blogs_table',1),
	(15,'2018_10_16_174227_create_permission_tables',1),
	(16,'2018_10_18_145729_create_cms_pages_table',1),
	(17,'2018_10_18_154634_create_notifications_table',1),
	(18,'2018_10_19_111101_create_website_configs_table',1),
	(19,'2018_10_23_154946_create_service_fees_table',1),
	(20,'2018_11_23_082344_create_order_groups_table',1),
	(21,'2018_11_24_094738_create_transport_order_items_table',1),
	(22,'2018_12_07_090414_add_display_name_column_to_website_configs_order',1),
	(23,'2018_12_11_141409_add_via_border_transport_fee_to_transport_order_items_table',1),
	(24,'2018_12_11_152723_add_order_id_column_to_purchase_order_items_table',1),
	(25,'2018_12_20_150002_add_current_rate_column_to_purchase_order_items_table',1),
	(26,'2018_12_21_142831_create_transaction_histories_table',1),
	(27,'2019_01_02_150404_change_content_nullable',1),
	(28,'2019_05_16_233442_create_ware_housers_table',1),
	(29,'2019_05_29_223811_add_column_parent_id_to_cms_pages_table',1),
	(30,'2019_05_29_234623_add_column_route_to_cms_pages_table',1),
	(31,'2019_06_02_231702_update_column_product_name_to_purchase_order_items_table',1),
	(32,'2019_06_02_232411_add_column_username_to_customers_table',1),
	(33,'2019_06_03_221445_create_categories_table',1),
	(34,'2019_06_06_231929_create_recharge_requests_table',1),
	(35,'2019_06_06_232057_add_column_purchase_vn_transport_fee_to_purchase_order_items_table',1),
	(36,'2019_06_07_231252_add_service_percent_column_to_customers_table',1),
	(37,'2019_06_08_235705_add_order_at_to_vn_at_column_to_orders_table',1),
	(38,'2019_06_10_215920_add_size_product_column_to_transport_order_items_table',1),
	(39,'2019_06_10_225612_add_transport_size_product_column_to_orders_table',1),
	(40,'2019_06_11_115639_add_type_column_to_recharge_requests_table',1),
	(41,'2019_06_15_172831_add_columns_to_recharge_requests_table',1),
	(42,'2019_06_16_085929_create_ideas_box_table',1),
	(43,'2019_06_22_211357_add_remove_columns_in_orders_table',1),
	(44,'2019_06_23_091052_add_qty_reality_column_to_purchase_order_items_table',1),
	(45,'2019_06_23_091351_add_column_size_color_to_order_temps_table',1),
	(46,'2019_06_23_100631_add_column_size_color_to_purchase_order_items_table',1),
	(47,'2019_06_30_162826_add_price_weight_default_column_to_customers_table',1),
	(48,'2019_07_03_231035_add_price_negotiate_column_to_orders_table',1),
	(49,'2019_07_06_133905_create_transport_customers_table',1),
	(50,'2019_07_06_134036_add_column_to_transport_order_items_table',1),
	(51,'2019_07_07_145424_add_column_is_payment_to_transport_order_items_table',1),
	(52,'2019_07_07_153939_change_nullable_customer_id_orders_table',1),
	(53,'2019_07_10_085920_add_deposit_default_column_to_orders_table',1),
	(54,'2019_07_11_231808_add_shop_name_column_to_purchase_order_items_table',1),
	(55,'2019_07_14_075508_add_column_transport_cublic_meter_to_table_orders',1),
	(56,'2019_07_14_080856_add_column_mobile_address_table',1),
	(57,'2019_07_14_142218_add_column_user_id_updated_to_transport_order_items_table',1),
	(58,'2019_07_14_154313_change_lenght_column_volumn_kg_transport_order_items_table',1),
	(59,'2019_07_14_164124_add_column_payment_type_transport_order_items',1),
	(60,'2019_07_14_164909_add_column_cublic_meter_to_transport_order_items',1),
	(61,'2019_07_14_172327_change_lenght_column_transport_volumn_orders_table',1),
	(62,'2019_07_27_105626_add_type_column_to_purchase_order_items_table',1),
	(63,'2019_08_08_143942_add_supporter_id_column_to_customers_table',1),
	(64,'2019_08_13_221819_add_columns_to_ideas_box_table',1),
	(65,'2019_08_13_231205_add_address_column_to_customer_profiles_table',1),
	(66,'2019_08_13_235200_add_percent_service_feeto_orders_table',1),
	(67,'2019_09_13_114833_add_column_note_order_items_table',2),
	(68,'2019_09_19_164952_edit_column_in_purchase_item_orders_table',3),
	(69,'2019_10_06_165533_change_type_column_transport_advance_drag_orders_table',4),
	(70,'2019_10_10_235224_add_column_user_created_id_to_orders_table',5),
	(71,'2019_10_23_152739_add_columns_to_orders_table',6),
	(72,'2019_10_27_222409_add_column_note_internal_to_orders_table',7),
	(73,'2019_10_27_222502_add_column_note_internal_to_purchase_order_items_table',7),
	(74,'2019_10_31_200417_add_ware_house_id_column_to_customers_table',8),
	(75,'2019_11_06_223859_change_nullable_column_payment_date_transport_order_items_table',9),
	(76,'2019_11_07_001607_add_column_customer_name_user_created_name_to_oders_table',9),
	(77,'2019_11_15_192727_add_orderer_id_column_to_customers_table',10),
	(78,'2019_11_21_232639_add_column_discount_transport_orders_table',11),
	(79,'2019_12_01_112729_add_success_at_column_to_orders',12),
	(85,'2020_06_01_112255_add_column_to_admin_users_table',13),
	(86,'2020_06_01_151831_add_column_is_active_to_admin_users_table',14),
	(87,'2020_06_01_225340_create_transport_recharges_table',15),
	(89,'2020_07_20_150404_create_transport_order_items_table',16),
	(90,'2020_07_22_083254_add_column_payment_to_orders_table',17),
	(91,'2020_07_22_090022_add_columns_to_orders_table',18),
	(92,'2020_07_22_091321_add_column__transport_customer_id_to_orders_table',19),
	(93,'2020_07_23_094430_create_messages_table',20);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table order_addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_addresses`;

CREATE TABLE `order_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commune` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table order_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_groups`;

CREATE TABLE `order_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `shop_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table order_temps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_temps`;

CREATE TABLE `order_temps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `price` double(12,2) NOT NULL,
  `total_price` double(14,2) NOT NULL,
  `price_range` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supporter_id` int(10) unsigned DEFAULT NULL,
  `transport_receive_type` tinyint(4) DEFAULT NULL,
  `purchase_cn_transport_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_vn_transport_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_total_items_price` double(14,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `confirm_date` datetime DEFAULT NULL,
  `purchase_service_fee` double(11,2) DEFAULT NULL,
  `purchase_cn_transport_fee` double(11,2) DEFAULT NULL,
  `purchase_vn_transport_fee` double(11,2) DEFAULT NULL,
  `purchase_cn_to_vn_fee` double(11,2) DEFAULT NULL,
  `final_total_price` double(15,2) DEFAULT NULL,
  `min_deposit` double(5,2) DEFAULT NULL,
  `deposited` double(15,2) DEFAULT NULL,
  `admin_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` tinyint(4) NOT NULL COMMENT '1: Mua hộ, 2: Vận chuyển',
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surcharge` double(11,2) DEFAULT NULL COMMENT 'Phụ phí',
  `warehouse_id` int(11) DEFAULT NULL,
  `is_count` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Không kiểm hàng, 1: Có kiểm hàng',
  `is_close_wood` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Không đóng gỗ, 1: Có đóng gỗ',
  `transport_price_service` int(11) DEFAULT NULL COMMENT 'Giá 1 kg/thể tích đơn vận chuyển',
  `transport_kg` double(11,2) DEFAULT NULL,
  `transport_volume` decimal(11,4) DEFAULT NULL,
  `transport_pay_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Tính theo kg; 1: Theo volume',
  `transport_advance_drag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Ứng/ kéo cho khách',
  `transport_vn_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã vận đơn VN của đơn vận chuyển',
  `current_rate` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_at` datetime DEFAULT NULL,
  `to_vn_at` datetime DEFAULT NULL,
  `transport_size_product` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Chiều dài x chiều rộng x chiều cao: json',
  `support_warehouse_id` int(10) unsigned DEFAULT NULL COMMENT 'Nhân viên kho',
  `supporter_order_id` int(10) unsigned DEFAULT NULL COMMENT 'Nhân viên đặt hàng',
  `price_weight` double(11,2) DEFAULT NULL COMMENT 'Giá cân nặng của các item',
  `price_negotiate` double(15,2) DEFAULT NULL COMMENT 'Giá thương lượng',
  `deposit_default` double(15,2) DEFAULT NULL,
  `transport_cublic_meter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_service_fee_percent` int(11) DEFAULT NULL,
  `user_created_id` int(11) DEFAULT NULL,
  `payment_customer_id` int(11) DEFAULT NULL,
  `deposited_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_created_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_discounted` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transport_customer_id` int(11) DEFAULT NULL COMMENT 'Khách hàng theo đơn hàng',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `order_number`, `customer_id`, `supporter_id`, `transport_receive_type`, `purchase_cn_transport_code`, `purchase_vn_transport_code`, `purchase_total_items_price`, `status`, `confirm_date`, `purchase_service_fee`, `purchase_cn_transport_fee`, `purchase_vn_transport_fee`, `purchase_cn_to_vn_fee`, `final_total_price`, `min_deposit`, `deposited`, `admin_note`, `customer_note`, `order_type`, `shop_name`, `surcharge`, `warehouse_id`, `is_count`, `is_close_wood`, `transport_price_service`, `transport_kg`, `transport_volume`, `transport_pay_type`, `transport_advance_drag`, `transport_vn_code`, `current_rate`, `created_at`, `updated_at`, `order_at`, `to_vn_at`, `transport_size_product`, `support_warehouse_id`, `supporter_order_id`, `price_weight`, `price_negotiate`, `deposit_default`, `transport_cublic_meter`, `purchase_service_fee_percent`, `user_created_id`, `payment_customer_id`, `deposited_at`, `internal_note`, `user_created_name`, `customer_name`, `discount_value`, `discount_method`, `discount_type`, `success_at`, `is_discounted`, `transport_customer_id`)
VALUES
	(3,'A0001',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,28541400.00,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,0,0,NULL,25.00,41.6700,0,'258000',NULL,NULL,'2020-07-22 09:49:03','2020-07-22 10:24:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1800',NULL,1,411,NULL,'Thanh toán 123','Administrator',NULL,'15',NULL,'0',NULL,NULL,411),
	(4,'A0002',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,40068800.00,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,0,0,NULL,0.00,2000.0000,0,'68800',NULL,NULL,'2020-07-22 14:51:30','2020-07-22 14:51:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,411,NULL,'Thanh toán','Administrator',NULL,'0',NULL,'1',NULL,NULL,411),
	(14,'A0003',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,28735400.00,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,0,0,NULL,0.00,1433.3300,0,'68800',NULL,NULL,'2020-07-22 15:07:34','2020-07-22 15:07:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,411,NULL,'Thanh toán','Administrator',NULL,'0',NULL,'1',NULL,NULL,411),
	(15,'A0004',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,600000.00,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,0,0,NULL,30.00,0.0000,0,'0',NULL,NULL,'2020-07-22 15:27:45','2020-07-27 09:20:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,1,411,NULL,'Thanh toán 123','Administrator',NULL,'20',NULL,'1',NULL,NULL,411);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'create_users','Thêm mới người dùng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(2,'edit_users','Sửa thông tin người dùng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(3,'delete_users','Xóa người dùng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(4,'create_exchange_rates','Thêm mới tỷ giá','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(5,'edit_exchange_rates','Sửa tỷ giá','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(6,'delete_exchange_rates','Xóa tỷ giá','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(7,'view_all_transport_orders','Xem tất cả đơn hàng vận chuyển','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(8,'create_transport_orders','Thêm mới đơn hàng vận chuyển','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(9,'edit_transport_orders','Sửa đơn hàng vận chuyển','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(10,'import_transport_orders_tq','Import mã vận đơn đơn hàng vận chuyển (Kho TQ)','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(11,'import_transport_orders_vn','Import mã vận đơn đơn hàng đã giao (Kho VN)','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(12,'edit_orders','Sửa đơn hàng mua hộ','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(13,'edit_money_orders','Sửa tiền đơn hàng mua hộ','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(14,'view_all_purchase_orders','Xem tất cả đơn hàng mua hộ','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(15,'create_purchase_item','Thêm mới danh sách sản phẩm mua hộ','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(16,'address_delivery','Xem địa chỉ giao hàng đơn mua hộ','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(17,'view_purchase_item','Xem danh sách sản phẩm mua hộ','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(18,'edit_purchase_item_of_order','Sửa sản phẩm của ĐH mua hộ','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(19,'import_purchase_item','Import mã vận đơn sản phẩm mua hộ','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(20,'edit_transport_code_and_note','Sửa mã vận đơn và ghi chú','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(21,'edit_supporter','Sửa nhân viên chăm sóc, kho của đơn hàng MH','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(22,'view_customer_info','Xem thông tin khách hàng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(23,'create_customers','Thêm khách hàng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(24,'edit_customers','Sửa khách hàng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(25,'popup_customers','Nạp tiền cho khách hàng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(26,'view_feedback','Xem hòm thư góp ý','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(27,'create_blogs','Thêm mới bài viết','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(28,'edit_blogs','Sửa bài viết','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(29,'delete_blogs','Xóa bài viết','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(30,'create_roles','Thêm mới vai trò','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(31,'edit_roles','Sửa vai trò','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(32,'delete_roles','Xóa vai trò','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(33,'edit_website_configs','Sửa cấu hình website','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(34,'create_pages','Thêm page','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(35,'edit_pages','Sửa page','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(36,'delete_pages','Xóa page','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(37,'view_reports','Xem báo cáo','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(38,'view_warehouse','Xem kho','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(39,'create_warehouse','Thêm kho','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(40,'update_warehouse','Sửa kho','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(41,'delete_warehouse','Xóa kho','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(42,'view_categories','Xem danh mục','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(43,'create_categories','Thêm danh mục','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(44,'update_categories','Sửa danh mục','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(45,'delete_categories','Xóa danh mục','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(46,'view_history_action','Xem lịch sử hoạt động','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(47,'view_recharge_request','Quản lý nạp tiền','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(48,'view_backup_data','Backup database','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(49,'payment_transport_orders','Thanh toán đơn hàng vận chuyển','web','2019-08-21 22:54:17','2019-08-21 22:54:17');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchase_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order_items`;

CREATE TABLE `purchase_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `price` double(14,2) NOT NULL,
  `customer_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_range` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_transport_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0: Chưa về kho VN, 1: Đã về kho VN',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `current_rate` double(11,2) NOT NULL,
  `purchase_cn_transport_fee` double DEFAULT NULL,
  `qty_reality` int(11) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL COMMENT 'Kg',
  `product_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `internal_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_date` date DEFAULT NULL COMMENT 'Ngày nhập cân nặng',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table recharge_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recharge_requests`;

CREATE TABLE `recharge_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Id khach hang',
  `money` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'So tien muon nap',
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Noi dung kem theo, co the dinh kem anh',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: pending, 1: confirm, 2: reject',
  `reject_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ly do tu choi duyet',
  `user_id_confirm` int(10) unsigned DEFAULT NULL COMMENT 'id nguoi duyet yeu cau, 0: Khách tự đặt cọc',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0: Trừ tiền, 1: Cộng tiền',
  `order_id` int(11) DEFAULT NULL,
  `amount_before` int(11) DEFAULT NULL COMMENT 'Số tiền trước khi cộng/ trừ tiền',
  `amount_after` int(11) DEFAULT NULL COMMENT 'Số tiền sau khi cộng/ trừ tiền',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','Quản trị hệ thống','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(2,'accountant','Kế toán','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(3,'care_staff_sales','Nhân viên chăm sóc - bán hàng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(4,'warehouse_manager','Quản lý kho','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(5,'orderer','Nhân viên đặt hàng','web','2019-08-21 22:54:17','2019-08-21 22:54:17'),
	(6,'payment-transport','Thanh toán đơn hàng vận chuyển','web','2019-08-21 22:54:17','2019-10-11 00:37:47');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service_fees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_fees`;

CREATE TABLE `service_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_price` double(12,2) DEFAULT NULL,
  `to_price` double(12,2) DEFAULT NULL,
  `fee` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table slides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `slides`;

CREATE TABLE `slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transaction_histories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transaction_histories`;

CREATE TABLE `transaction_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `amount_before` double(12,2) NOT NULL,
  `amount_topup` double(12,2) NOT NULL,
  `amount_after` double(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transport_customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_customers`;

CREATE TABLE `transport_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `transport_customers` WRITE;
/*!40000 ALTER TABLE `transport_customers` DISABLE KEYS */;

INSERT INTO `transport_customers` (`id`, `name`, `created_at`, `updated_at`, `mobile`, `address`)
VALUES
	(1,'mumi','2019-09-08 14:34:47','2019-09-08 14:34:47',NULL,NULL),
	(2,'hanh212','2019-09-08 14:37:03','2019-09-08 14:37:03',NULL,NULL),
	(3,'RDNHUNGDO','2019-09-08 14:39:35','2019-09-08 14:39:35',NULL,NULL),
	(7,'RDMYLE86','2019-09-08 14:42:52','2019-09-08 14:42:52',NULL,NULL),
	(10,'RDHSTHUNG95','2019-09-08 14:44:29','2019-09-08 14:44:29',NULL,NULL),
	(12,'RDHSTHUHUYEN','2019-09-08 14:45:21','2019-09-08 14:45:21',NULL,NULL),
	(13,'RDZYN','2019-09-08 14:47:06','2019-09-08 14:47:06',NULL,NULL),
	(14,'RDVANH','2019-09-08 14:48:33','2019-09-08 14:48:33',NULL,NULL),
	(15,'2709','2019-09-08 14:48:49','2019-09-08 14:48:49',NULL,NULL),
	(16,'RDBON99','2019-09-08 14:49:34','2019-09-08 14:49:34',NULL,NULL),
	(17,'RDKNGAN95','2019-09-08 14:50:04','2019-09-08 14:50:04',NULL,NULL),
	(18,'RDUYEN229','2019-09-08 14:50:23','2019-09-08 14:50:23',NULL,NULL),
	(19,'RDTHU129','2019-09-08 14:50:40','2019-09-08 14:50:40',NULL,NULL),
	(21,'RDTHAODN','2019-09-08 14:51:23','2019-09-08 14:51:23',NULL,NULL),
	(22,'RDNTRAN','2019-09-08 14:51:53','2019-09-08 14:51:53',NULL,NULL),
	(23,'hoa475','2019-09-08 14:52:19','2019-09-08 14:52:19',NULL,NULL),
	(24,'phungly','2019-09-08 14:53:24','2019-09-08 14:53:24',NULL,NULL),
	(25,'HUONG907','2019-09-08 14:54:03','2019-09-08 14:54:03',NULL,NULL),
	(26,'LINHLINH1311','2019-09-08 14:55:22','2019-09-08 14:55:22',NULL,NULL),
	(27,'vietanh','2019-09-08 14:55:37','2019-09-08 14:55:37',NULL,NULL),
	(28,'phamduc','2019-09-08 14:56:41','2019-09-08 14:56:41',NULL,NULL),
	(30,'RDSGDUONG','2019-09-08 15:00:11','2019-09-08 15:00:11',NULL,NULL),
	(31,'RDSGLAKA','2019-09-08 15:00:39','2019-09-08 15:00:39',NULL,NULL),
	(32,'RDSGKY','2019-09-08 15:01:08','2019-09-08 15:01:08',NULL,NULL),
	(33,'RDSGDUOIMO','2019-09-08 15:01:39','2019-09-08 15:01:39',NULL,NULL),
	(34,'RDTRENG','2019-09-08 15:02:06','2019-09-08 15:02:06',NULL,NULL),
	(36,'RDHUNG123','2019-09-08 15:02:42','2019-09-08 15:02:42',NULL,NULL),
	(37,'HANH01','2019-09-08 15:03:01','2019-09-08 15:03:01',NULL,NULL),
	(38,'RDHSQUANGHE','2019-09-08 15:04:22','2019-09-08 15:04:22',NULL,NULL),
	(39,'RDHSHONGMI','2019-09-08 15:04:48','2019-09-08 15:04:48',NULL,NULL),
	(40,'NGA667','2019-09-08 15:05:51','2019-09-08 15:05:51',NULL,NULL),
	(41,'RDDUCTAT','2019-09-08 15:09:50','2019-09-08 15:09:50',NULL,NULL),
	(42,'VU88','2019-09-08 15:11:28','2019-09-08 15:11:28',NULL,NULL),
	(43,'HAIYEN776','2019-09-08 15:16:48','2019-09-08 15:16:48',NULL,NULL),
	(44,'DONHUNG11','2019-09-08 15:19:05','2019-09-08 15:19:05',NULL,NULL),
	(45,'HUNGSUNO','2019-09-08 15:20:25','2019-09-08 15:20:25',NULL,NULL),
	(46,'HSTHIEN','2019-09-08 15:21:00','2019-09-08 15:21:00',NULL,NULL),
	(47,'UYENHN','2019-09-08 15:21:19','2019-09-08 15:21:19',NULL,NULL),
	(48,'NGANNG','2019-09-08 15:21:33','2019-09-08 15:21:33',NULL,NULL),
	(49,'SGANH','2019-09-08 15:21:45','2019-09-08 15:21:45',NULL,NULL),
	(50,'NHY22','2019-09-08 15:21:55','2019-09-08 15:21:55',NULL,NULL),
	(51,'HUYLY','2019-09-08 15:22:06','2019-09-08 15:22:06',NULL,NULL),
	(52,'LINHWON','2019-09-08 15:22:27','2019-09-08 15:22:27',NULL,NULL),
	(53,'LENGOC','2019-09-08 15:22:43','2019-09-08 15:22:43',NULL,NULL),
	(54,'SHUSHU','2019-09-08 15:23:08','2019-09-08 15:23:08',NULL,NULL),
	(55,'THIEN876','2019-09-08 15:23:45','2019-09-08 15:23:45',NULL,NULL),
	(57,'THANH','2019-09-08 15:24:42','2019-09-08 15:24:42',NULL,NULL),
	(58,'HIEU88','2019-09-08 15:25:04','2019-09-08 15:25:04',NULL,NULL),
	(59,'HSNVDUNG','2019-09-08 15:26:17','2019-09-08 15:26:17',NULL,NULL),
	(60,'PTP','2019-09-08 15:27:18','2019-09-08 15:27:18',NULL,NULL),
	(61,'THAO005','2019-09-08 15:29:10','2019-09-08 15:29:10',NULL,NULL),
	(62,'HSCAMTU','2019-09-08 15:29:55','2019-09-08 15:29:55',NULL,NULL),
	(63,'HIN','2019-09-08 15:36:40','2019-09-08 15:36:40',NULL,NULL),
	(64,'YEN75','2019-09-08 15:37:37','2019-09-08 15:37:37',NULL,NULL),
	(65,'MOLY','2019-09-08 15:38:11','2019-09-08 15:38:11',NULL,NULL),
	(66,'KIDO','2019-09-08 15:39:08','2019-09-08 15:39:08',NULL,NULL),
	(67,'YUMY29','2019-09-08 15:39:58','2019-09-08 15:39:58',NULL,NULL),
	(68,'RDHONGMI','2019-09-08 15:40:37','2019-09-08 15:40:37',NULL,NULL),
	(69,'THANHTU','2019-09-08 15:42:07','2019-09-08 15:42:07',NULL,NULL),
	(70,'SGPQT','2019-09-08 15:42:28','2019-09-08 15:42:28',NULL,NULL),
	(71,'DUYKHANH','2019-09-08 15:43:18','2019-09-08 15:43:18',NULL,NULL),
	(72,'LHTHU95','2019-09-08 15:43:23','2019-09-08 15:43:23',NULL,NULL),
	(73,'LUYEN','2019-09-08 15:43:59','2019-09-08 15:43:59',NULL,NULL),
	(74,'NGOCHOA','2019-09-08 15:44:38','2019-09-08 15:44:38',NULL,NULL),
	(75,'HSDUONGMD','2019-09-08 15:46:30','2019-09-08 15:46:30',NULL,NULL),
	(76,'TTL92','2019-09-08 15:50:31','2019-09-08 15:50:31',NULL,NULL),
	(77,'BAONGOC','2019-09-08 15:52:18','2019-09-08 15:52:18',NULL,NULL),
	(78,'MAITDT','2019-09-08 15:54:39','2019-09-08 15:54:39',NULL,NULL),
	(79,'DTT677','2019-09-08 15:56:06','2019-09-08 15:56:06',NULL,NULL),
	(80,'TEST','2019-09-08 15:57:23','2019-09-08 15:57:23',NULL,NULL),
	(81,'PTL42','2019-09-08 15:59:56','2019-09-08 15:59:56',NULL,NULL),
	(82,'ANHDE','2019-09-08 16:25:20','2019-09-08 16:25:20',NULL,NULL),
	(83,'TUANANH','2019-09-08 16:26:16','2019-09-08 16:26:16',NULL,NULL),
	(84,'HANGHP','2019-09-08 16:29:09','2019-09-08 16:29:09',NULL,NULL),
	(85,'MINHNGOC','2019-09-08 16:35:06','2019-09-08 16:35:06',NULL,NULL),
	(86,'PHUONG90','2019-09-08 16:40:18','2019-09-08 16:40:18',NULL,NULL),
	(87,'HADONG','2019-09-08 16:42:26','2019-09-08 16:42:26',NULL,NULL),
	(88,'KT','2019-09-08 16:48:18','2019-09-08 16:48:18',NULL,NULL),
	(89,'MUMMY','2019-09-08 17:20:11','2019-09-08 17:20:11',NULL,NULL),
	(90,'RDTRANGMOON','2019-09-09 13:53:48','2019-09-09 13:53:48',NULL,NULL),
	(91,'RSHSQUANGHE','2019-09-09 14:00:04','2019-09-09 14:00:04',NULL,NULL),
	(92,'RDDOLY','2019-09-09 14:20:34','2019-09-09 14:20:34',NULL,NULL),
	(93,'SGDUONG','2019-09-09 14:38:02','2019-09-09 14:38:02',NULL,NULL),
	(94,'RDSGQUYEN','2019-09-09 14:41:13','2019-09-09 14:41:13',NULL,NULL),
	(95,'RDHSKUNNY','2019-09-09 14:42:11','2019-09-09 14:42:11',NULL,NULL),
	(96,'daothanhtung','2019-09-09 21:59:26','2019-09-09 21:59:26',NULL,NULL),
	(97,'RDTKHANH','2019-09-10 13:58:26','2019-09-10 13:58:26',NULL,NULL),
	(98,'RDANH69','2019-09-10 13:58:57','2019-09-10 13:58:57',NULL,NULL),
	(99,'RDHSBQ','2019-09-10 13:59:32','2019-09-10 13:59:32',NULL,NULL),
	(100,'RDTRONGTOAN','2019-09-10 14:04:06','2019-09-10 14:04:06',NULL,NULL),
	(101,'RDSAOMAI','2019-09-10 14:52:26','2019-09-10 14:52:26',NULL,NULL),
	(102,'RDNGQUYNH','2019-09-10 14:59:38','2019-09-10 14:59:38',NULL,NULL),
	(103,'NGQUYNH','2019-09-10 15:00:58','2019-09-10 15:00:58',NULL,NULL),
	(104,'RDHSVINCENT','2019-09-10 15:09:51','2019-09-10 15:09:51',NULL,NULL),
	(105,'RDHSCYZ','2019-09-10 15:10:28','2019-09-10 15:10:28',NULL,NULL),
	(106,'RDTHANHTHU','2019-09-10 15:21:55','2019-09-10 15:21:55',NULL,NULL),
	(107,'RDSGBINH','2019-09-10 15:23:28','2019-09-10 15:23:28',NULL,NULL),
	(108,'RDHONGAN','2019-09-10 15:24:02','2019-09-10 15:24:02',NULL,NULL),
	(109,'RDTUANTRAN','2019-09-10 15:24:55','2019-09-10 15:24:55',NULL,NULL),
	(110,'RDPLINH1901','2019-09-10 15:26:11','2019-09-10 15:26:11',NULL,NULL),
	(111,'RDHATHI','2019-09-10 15:28:36','2019-09-10 15:28:36',NULL,NULL),
	(112,'RDNGOCMAUVE','2019-09-10 15:28:48','2019-09-10 15:28:48',NULL,NULL),
	(113,'RDLYHA','2019-09-10 15:29:33','2019-09-10 15:29:33',NULL,NULL),
	(114,'RDBNCONG','2019-09-10 15:36:08','2019-09-10 15:36:08',NULL,NULL),
	(115,'RDUYENGAU','2019-09-10 15:38:49','2019-09-10 15:38:49',NULL,NULL),
	(116,'RDPTVINH','2019-09-10 15:45:14','2019-09-10 15:45:14',NULL,NULL),
	(117,'RDHSTUANTRAN','2019-09-10 15:46:23','2019-09-10 15:46:23',NULL,NULL),
	(118,'RDTOANSHIP','2019-09-10 15:50:02','2019-09-10 15:50:02',NULL,NULL),
	(119,'RDMPHUONG','2019-09-10 15:51:03','2019-09-10 15:51:03',NULL,NULL),
	(120,'RDSGVUI','2019-09-10 15:51:13','2019-09-10 15:51:13',NULL,NULL),
	(121,'RDSGLONG','2019-09-10 15:52:04','2019-09-10 15:52:04',NULL,NULL),
	(122,'RDDAMITU','2019-09-10 16:03:00','2019-09-10 16:03:00',NULL,NULL),
	(123,'HATHI','2019-09-10 16:31:21','2019-09-10 16:31:21',NULL,NULL),
	(124,'RDSGBINH87','2019-09-10 17:19:13','2019-09-10 17:19:13',NULL,NULL),
	(125,'RDPLINH','2019-09-10 17:19:35','2019-09-10 17:19:35',NULL,NULL),
	(126,'RDDUY98','2019-09-10 17:36:00','2019-09-10 17:36:00',NULL,NULL),
	(127,'RSHONGMI','2019-09-10 17:48:23','2019-09-10 17:48:23',NULL,NULL),
	(128,'RDTUYETNHUNG','2019-09-10 17:48:43','2019-09-10 17:48:43',NULL,NULL),
	(129,'RDHSTQUANG','2019-09-10 17:49:21','2019-09-10 17:49:21',NULL,NULL),
	(130,'RDSGHIEU4M','2019-09-10 17:49:30','2019-09-10 17:49:30',NULL,NULL),
	(131,'RDTHAOBN','2019-09-10 17:50:13','2019-09-10 17:50:13',NULL,NULL),
	(132,'RDSGHONGAN','2019-09-11 09:11:12','2019-09-11 09:11:12',NULL,NULL),
	(134,'VCPHUONG90','2019-09-11 13:36:30','2019-09-11 13:36:30',NULL,NULL),
	(135,'VCPTL42','2019-09-11 13:44:13','2019-09-11 13:44:13',NULL,NULL),
	(136,'VCCANH142','2019-09-11 13:49:28','2019-09-11 13:49:28',NULL,NULL),
	(137,'VCHADONG','2019-09-11 13:56:56','2019-09-11 13:56:56',NULL,NULL),
	(138,'VCDTT677','2019-09-11 14:02:29','2019-09-11 14:02:29',NULL,NULL),
	(139,'VCHAIYEN','2019-09-11 14:05:03','2019-09-11 14:05:03',NULL,NULL),
	(140,'VC2709','2019-09-11 14:05:29','2019-09-11 14:05:29',NULL,NULL),
	(141,'VCHUONG907','2019-09-11 14:06:21','2019-09-11 14:06:21',NULL,NULL),
	(142,'VCHANH01','2019-09-11 14:07:09','2019-09-11 14:07:09',NULL,NULL),
	(143,'VCHANH212','2019-09-11 14:08:45','2019-09-11 14:08:45',NULL,NULL),
	(144,'VCPTP','2019-09-11 14:10:32','2019-09-11 14:10:32',NULL,NULL),
	(145,'VCHAIANH','2019-09-11 14:12:03','2019-09-11 14:12:03',NULL,NULL),
	(146,'VCVITHAN','2019-09-11 14:15:14','2019-09-11 14:15:14',NULL,NULL),
	(147,'VCTHANHTU','2019-09-11 14:17:00','2019-09-11 14:17:00',NULL,NULL),
	(148,'VCHNHUE','2019-09-11 14:17:22','2019-09-11 14:17:22',NULL,NULL),
	(149,'VCHIEU88','2019-09-11 14:17:44','2019-09-11 14:17:44',NULL,NULL),
	(150,'RDSGAN','2019-09-11 14:19:24','2019-09-11 14:19:24',NULL,NULL),
	(151,'VCTHIEN876','2019-09-11 14:19:24','2019-09-11 14:19:24',NULL,NULL),
	(152,'VCSHUSHU','2019-09-11 14:19:43','2019-09-11 14:19:43',NULL,NULL),
	(153,'RSSGTHUCV','2019-09-11 14:20:08','2019-09-11 14:20:08',NULL,NULL),
	(154,'VCPHAMDUC','2019-09-11 14:20:33','2019-09-11 14:20:33',NULL,NULL),
	(155,'VCBAONGOC','2019-09-11 14:21:38','2019-09-11 14:21:38',NULL,NULL),
	(156,'VCHOA475','2019-09-11 14:23:04','2019-09-11 14:23:04',NULL,NULL),
	(157,'VCHSNTHUYEN','2019-09-11 14:23:47','2019-09-11 14:23:47',NULL,NULL),
	(158,'VCLINHLINH','2019-09-11 14:24:09','2019-09-11 14:24:09',NULL,NULL),
	(159,'VCPHUNGLY','2019-09-11 14:24:37','2019-09-11 14:24:37',NULL,NULL),
	(160,'VCVHSFANGHOANG','2019-09-11 14:24:58','2019-09-11 14:24:58',NULL,NULL),
	(161,'RDREUSHOP','2019-09-11 14:25:09','2019-09-11 14:25:09',NULL,NULL),
	(162,'VCHSTHIEN','2019-09-11 14:25:10','2019-09-11 14:25:10',NULL,NULL),
	(163,'VCTRINH892','2019-09-11 14:25:25','2019-09-11 14:25:25',NULL,NULL),
	(164,'VCVYVY','2019-09-11 14:25:37','2019-09-11 14:25:37',NULL,NULL),
	(165,'VCNGA667','2019-09-11 14:26:05','2019-09-11 14:26:05',NULL,NULL),
	(166,'VCMDIEP','2019-09-11 14:26:15','2019-09-11 14:26:15',NULL,NULL),
	(167,'VCSGPQT','2019-09-11 14:26:28','2019-09-11 14:26:28',NULL,NULL),
	(168,'VCHUYLY','2019-09-11 14:26:41','2019-09-11 14:26:41',NULL,NULL),
	(169,'VCHSVANANH','2019-09-11 14:27:07','2019-09-11 14:27:07',NULL,NULL),
	(170,'VCHBDUYO','2019-09-11 14:27:23','2019-09-11 14:27:23',NULL,NULL),
	(171,'VCPHUNGSG','2019-09-11 14:27:34','2019-09-11 14:27:34',NULL,NULL),
	(172,'RDNGALE','2019-09-11 14:27:45','2019-09-11 14:27:45',NULL,NULL),
	(173,'VCNHY22','2019-09-11 14:27:46','2019-09-11 14:27:46',NULL,NULL),
	(174,'VCTTL92','2019-09-11 14:27:55','2019-09-11 14:27:55',NULL,NULL),
	(175,'VCVIT','2019-09-11 14:28:04','2019-09-11 14:28:04',NULL,NULL),
	(176,'RDLINHBONG','2019-09-11 14:28:26','2019-09-11 14:28:26',NULL,NULL),
	(177,'VCHSDUONGMD','2019-09-11 14:28:30','2019-09-11 14:28:30',NULL,NULL),
	(178,'VCMINHDUC','2019-09-11 14:28:47','2019-09-11 14:28:47',NULL,NULL),
	(179,'VCHSNVDUNG','2019-09-11 14:29:10','2019-09-11 14:29:10',NULL,NULL),
	(180,'VCSGTIEN89','2019-09-11 14:29:40','2019-09-11 14:29:40',NULL,NULL),
	(181,'RDCAOPHUONG','2019-09-11 14:29:43','2019-09-11 14:29:43',NULL,NULL),
	(182,'VCTHUYNGA','2019-09-11 14:29:56','2019-09-11 14:29:56',NULL,NULL),
	(183,'VCNGANNG','2019-09-11 14:32:27','2019-09-11 14:32:27',NULL,NULL),
	(184,'VCVU88','2019-09-11 14:32:55','2019-09-11 14:32:55',NULL,NULL),
	(185,'VCKIDO','2019-09-11 14:33:05','2019-09-11 14:33:05',NULL,NULL),
	(186,'VCTHULE','2019-09-11 14:33:25','2019-09-11 14:33:25',NULL,NULL),
	(187,'VCMUMMY','2019-09-11 14:33:37','2019-09-11 14:33:37',NULL,NULL),
	(188,'VCMAITDT','2019-09-11 14:33:54','2019-09-11 14:33:54',NULL,NULL),
	(189,'VCHOAI18','2019-09-11 14:34:19','2019-09-11 14:34:19',NULL,NULL),
	(190,'VCHIN','2019-09-11 14:34:51','2019-09-11 14:34:51',NULL,NULL),
	(191,'VCVIETANH','2019-09-11 14:36:31','2019-09-11 14:36:31',NULL,NULL),
	(192,'VCPTHAO473','2019-09-11 14:37:41','2019-09-11 14:37:41',NULL,NULL),
	(193,'VCLHTHU95','2019-09-11 14:38:14','2019-09-11 14:38:14',NULL,NULL),
	(194,'VCSGANH','2019-09-11 14:39:24','2019-09-11 14:39:24',NULL,NULL),
	(195,'VCDONHUNG11','2019-09-11 14:40:42','2019-09-11 14:40:42',NULL,NULL),
	(196,'VCHANGHP','2019-09-11 14:41:56','2019-09-11 14:41:56',NULL,NULL),
	(197,'VCQUYNH','2019-09-11 14:42:14','2019-09-11 14:42:14',NULL,NULL),
	(198,'VCNGOCHOA','2019-09-11 14:42:51','2019-09-11 14:42:51',NULL,NULL),
	(199,'VCHANHLE','2019-09-11 14:43:13','2019-09-11 14:43:13',NULL,NULL),
	(200,'VCMOLY','2019-09-11 14:45:25','2019-09-11 14:45:25',NULL,NULL),
	(201,'VCHUYEN94','2019-09-11 14:46:02','2019-09-11 14:46:02',NULL,NULL),
	(202,'VCDUYKHANH','2019-09-11 14:46:29','2019-09-11 14:46:29',NULL,NULL),
	(203,'VCTUANANH','2019-09-11 14:46:55','2019-09-11 14:46:55',NULL,NULL),
	(204,'VCLUYEN','2019-09-11 17:00:39','2019-09-11 17:00:39',NULL,NULL),
	(205,'TRANG84','2019-09-11 17:10:03','2019-09-11 17:10:03',NULL,NULL),
	(206,'VCNGUYET','2019-09-12 10:27:58','2019-09-12 10:27:58',NULL,NULL),
	(207,'RDSGPHUONG','2019-09-12 11:28:29','2019-09-12 11:28:29',NULL,NULL),
	(208,'RDSGHANTY','2019-09-12 11:28:38','2019-09-12 11:28:38',NULL,NULL),
	(209,'RDTN','2019-09-12 11:36:18','2019-09-12 11:36:18',NULL,NULL),
	(210,'RDTUNGKK','2019-09-12 11:38:29','2019-09-12 11:38:29',NULL,NULL),
	(211,'RDMANH03','2019-09-12 11:39:28','2019-09-12 11:39:28',NULL,NULL),
	(212,'VCANHDESG','2019-09-12 13:33:55','2019-09-12 13:33:55',NULL,NULL),
	(213,'VCHSHUYEN','2019-09-12 13:35:11','2019-09-12 13:35:11',NULL,NULL),
	(214,'VCLENGOC','2019-09-12 13:54:47','2019-09-12 13:54:47',NULL,NULL),
	(215,'VCTIEN308','2019-09-12 14:04:43','2019-09-12 14:04:43',NULL,NULL),
	(216,'VCTRIEU20','2019-09-12 14:06:50','2019-09-12 14:06:50',NULL,NULL),
	(217,'VCBERRY','2019-09-12 14:07:03','2019-09-12 14:07:03',NULL,NULL),
	(218,'VCHSTHUY25','2019-09-12 14:07:23','2019-09-12 14:07:23',NULL,NULL),
	(219,'VCXULE998','2019-09-12 14:07:40','2019-09-12 14:07:40',NULL,NULL),
	(220,'VCHSFANGHOANG','2019-09-12 14:08:34','2019-09-12 14:08:34',NULL,NULL),
	(221,'VCUYENHN','2019-09-12 14:09:06','2019-09-12 14:09:06',NULL,NULL),
	(222,'VCMANHTRUNG','2019-09-12 14:09:30','2019-09-12 14:09:30',NULL,NULL),
	(223,'VCHSMTHU03','2019-09-12 14:10:00','2019-09-12 14:10:00',NULL,NULL),
	(224,'VCMINHCHI','2019-09-12 14:12:02','2019-09-12 14:12:02',NULL,NULL),
	(225,'VCTRANGXUAN','2019-09-12 14:12:20','2019-09-12 14:12:20',NULL,NULL),
	(226,'VCDUYLONG','2019-09-12 14:12:34','2019-09-12 14:12:34',NULL,NULL),
	(227,'VCPI','2019-09-12 14:12:59','2019-09-12 14:12:59',NULL,NULL),
	(228,'VCPTHAO','2019-09-12 14:13:59','2019-09-12 14:13:59',NULL,NULL),
	(229,'VCTRANG84','2019-09-12 14:22:43','2019-09-12 14:22:43',NULL,NULL),
	(230,'VCHAIYEN776','2019-09-12 14:29:20','2019-09-12 14:29:20',NULL,NULL),
	(231,'VCHSMINH','2019-09-12 14:31:00','2019-09-12 14:31:00',NULL,NULL),
	(232,'VCHSMIN','2019-09-12 16:43:20','2019-09-12 16:43:20',NULL,NULL),
	(233,'RDTDUONG','2019-09-13 15:46:53','2019-09-13 15:46:53',NULL,NULL),
	(234,'RDANHCHU','2019-09-13 15:54:47','2019-09-13 15:54:47',NULL,NULL),
	(235,'VCTATUYET','2019-09-13 16:00:52','2019-09-13 16:00:52',NULL,NULL),
	(236,'VCANHNGUYEN','2019-09-13 16:02:46','2019-09-13 16:02:46',NULL,NULL),
	(237,'VCNGUYENANH','2019-09-13 16:03:10','2019-09-13 16:03:10',NULL,NULL),
	(238,'VCMINHTTP','2019-09-13 16:03:34','2019-09-13 16:03:34',NULL,NULL),
	(239,'VCHSNY8820','2019-09-13 16:03:57','2019-09-13 16:03:57',NULL,NULL),
	(240,'VCTHAO005','2019-09-13 16:09:22','2019-09-13 16:09:22',NULL,NULL),
	(241,'VCMTHU03','2019-09-13 16:12:47','2019-09-13 16:12:47',NULL,NULL),
	(242,'HSMTHU03','2019-09-13 16:13:33','2019-09-13 16:13:33',NULL,NULL),
	(243,'VCMINHNGOC','2019-09-13 16:14:52','2019-09-13 16:14:52',NULL,NULL),
	(244,'VCSGTRANG56','2019-09-13 16:14:52','2019-09-13 16:14:52',NULL,NULL),
	(245,'VCHUNGSUNO','2019-09-13 16:15:51','2019-09-13 16:15:51',NULL,NULL),
	(246,'VCSGVY79','2019-09-13 16:16:10','2019-09-13 16:16:10',NULL,NULL),
	(247,'VCHAIDOAN','2019-09-13 16:16:35','2019-09-13 16:16:35',NULL,NULL),
	(248,'VCHSYN8820','2019-09-13 16:17:02','2019-09-13 16:17:02',NULL,NULL),
	(249,'VCRDSGLONG','2019-09-13 16:17:58','2019-09-13 16:17:58',NULL,NULL),
	(250,'VCMUMI','2019-09-13 18:03:25','2019-09-13 18:03:25',NULL,NULL),
	(251,'VCTUNGNGUYEN','2019-09-14 14:00:34','2019-09-14 14:00:34',NULL,NULL),
	(252,'TATQ','2019-09-14 14:11:20','2019-09-14 14:11:20',NULL,NULL),
	(253,'RDGIAVU','2019-09-14 14:55:12','2019-09-14 14:55:12',NULL,NULL),
	(254,'RDBAHA','2019-09-14 15:46:37','2019-09-14 15:46:37',NULL,NULL),
	(255,'RDSGQHAI','2019-09-14 15:52:21','2019-09-14 15:52:21',NULL,NULL),
	(256,'RDSGVAN','2019-09-14 15:53:25','2019-09-14 15:53:25',NULL,NULL),
	(257,'RDTRUNG85','2019-09-14 15:54:13','2019-09-14 15:54:13',NULL,NULL),
	(258,'RDANHDAKLAK','2019-09-14 15:55:58','2019-09-14 15:55:58',NULL,NULL),
	(259,'RDDUNGBN','2019-09-14 15:57:28','2019-09-14 15:57:28',NULL,NULL),
	(260,'RDLLH510','2019-09-14 16:00:58','2019-09-14 16:00:58',NULL,NULL),
	(261,'RDMY94','2019-09-14 16:01:12','2019-09-14 16:01:12',NULL,NULL),
	(262,'RDMY780','2019-09-14 16:01:21','2019-09-14 16:01:21',NULL,NULL),
	(263,'RDMINA','2019-09-14 16:01:28','2019-09-14 16:01:28',NULL,NULL),
	(264,'RDKHANHBUI','2019-09-14 16:01:45','2019-09-14 16:01:45',NULL,NULL),
	(265,'RDHSLYHA','2019-09-14 16:04:11','2019-09-14 16:04:11',NULL,NULL),
	(266,'VCNMH567','2019-09-14 16:05:19','2019-09-14 16:05:19',NULL,NULL),
	(267,'HSVANANH','2019-09-14 16:38:34','2019-09-14 16:38:34',NULL,NULL),
	(268,'VCHSBNGOC','2019-09-14 16:42:38','2019-09-14 16:42:38',NULL,NULL),
	(269,'VCSGTRUNG','2019-09-14 16:45:50','2019-09-14 16:45:50',NULL,NULL),
	(270,'VCDONHUNG','2019-09-14 16:53:59','2019-09-14 16:53:59',NULL,NULL),
	(271,'VCDYY677','2019-09-14 16:55:37','2019-09-14 16:55:37',NULL,NULL),
	(272,'SGVAN','2019-09-14 16:58:14','2019-09-14 16:58:14',NULL,NULL),
	(273,'VCHUNG284','2019-09-14 17:00:53','2019-09-14 17:00:53',NULL,NULL),
	(274,'VCYUMY29','2019-09-14 17:08:26','2019-09-14 17:08:26',NULL,NULL),
	(275,'VCANHDE','2019-09-14 17:08:33','2019-09-14 17:08:33',NULL,NULL),
	(276,'VCHIEU2000','2019-09-14 17:16:46','2019-09-14 17:16:46',NULL,NULL),
	(277,'VCYEN75','2019-09-14 17:24:46','2019-09-14 17:24:46',NULL,NULL),
	(278,'VCTRANGTRAN','2019-09-14 17:25:39','2019-09-14 17:25:39',NULL,NULL),
	(279,'VCDIEUTHUY','2019-09-14 17:26:16','2019-09-14 17:26:16',NULL,NULL),
	(280,'VCHOANGKIN','2019-09-14 17:29:50','2019-09-14 17:29:50',NULL,NULL),
	(281,'VCTVAN94','2019-09-14 17:42:32','2019-09-14 17:42:32',NULL,NULL),
	(282,'SGHTP','2019-09-14 18:05:15','2019-09-14 18:05:15',NULL,NULL),
	(283,'VCTHANH','2019-09-14 18:06:35','2019-09-14 18:06:35',NULL,NULL),
	(284,'RDSGDUNGNG','2019-09-14 18:12:13','2019-09-14 18:12:13',NULL,NULL),
	(285,'RDDUCCO','2019-09-16 10:46:05','2019-09-16 10:46:05',NULL,NULL),
	(286,'RDTHAOBG','2019-09-16 10:49:19','2019-09-16 10:49:19',NULL,NULL),
	(287,'VCHSDUONG341','2019-09-16 11:12:58','2019-09-16 11:12:58',NULL,NULL),
	(288,'VCHSLUUHANH','2019-09-16 11:13:13','2019-09-16 11:13:13',NULL,NULL),
	(289,'VCMIDORI','2019-09-16 11:30:38','2019-09-16 11:30:38',NULL,NULL),
	(290,'VCSGHTP','2019-09-16 11:31:45','2019-09-16 11:31:45',NULL,NULL),
	(291,'VCBERRYPHAM','2019-09-16 11:40:05','2019-09-16 11:40:05',NULL,NULL),
	(292,'VCTUNG536','2019-09-16 11:40:44','2019-09-16 11:40:44',NULL,NULL),
	(293,'VCTRANGLE','2019-09-16 11:42:22','2019-09-16 11:42:22',NULL,NULL),
	(294,'VCTRING892','2019-09-16 11:43:10','2019-09-16 11:43:10',NULL,NULL),
	(295,'VCNVQ','2019-09-16 11:43:55','2019-09-16 11:43:55',NULL,NULL),
	(296,'VCHU8NGSUNO','2019-09-16 11:44:54','2019-09-16 11:44:54',NULL,NULL),
	(297,'SGTRANG56','2019-09-16 11:45:32','2019-09-16 11:45:32',NULL,NULL),
	(298,'VCYUMMY29','2019-09-16 11:46:43','2019-09-16 11:46:43',NULL,NULL),
	(299,'VCDIEPTQ','2019-09-16 11:47:15','2019-09-16 11:47:15',NULL,NULL),
	(300,'ADONG835','2019-09-16 11:47:37','2019-09-16 11:47:37',NULL,NULL),
	(301,'ATSK','2019-09-16 11:47:52','2019-09-16 11:47:52',NULL,NULL),
	(302,'VCTHUYELLA','2019-09-16 14:01:00','2019-09-16 14:01:00',NULL,NULL),
	(303,'RDTRANG01','2019-09-16 15:17:12','2019-09-16 15:17:12',NULL,NULL),
	(304,'RDHOAINAM','2019-09-16 16:02:08','2019-09-16 16:02:08',NULL,NULL),
	(305,'VCHSDUONG','2019-09-16 16:54:17','2019-09-16 16:54:17',NULL,NULL),
	(306,'VCLINHWON','2019-09-16 17:32:05','2019-09-16 17:32:05',NULL,NULL),
	(307,'VCLHA969','2019-09-16 17:32:32','2019-09-16 17:32:32',NULL,NULL),
	(308,'VCHUONGDAO','2019-09-16 17:37:55','2019-09-16 17:37:55',NULL,NULL),
	(309,'VCTONY','2019-09-16 17:40:01','2019-09-16 17:40:01',NULL,NULL),
	(310,'RDBINHND','2019-09-16 17:41:39','2019-09-16 17:41:39',NULL,NULL),
	(311,'RDNTN','2019-09-16 17:42:13','2019-09-16 17:42:13',NULL,NULL),
	(312,'RDTHANG89','2019-09-16 17:42:55','2019-09-16 17:42:55',NULL,NULL),
	(313,'RDUNGBN','2019-09-16 17:45:58','2019-09-16 17:45:58',NULL,NULL),
	(314,'RDPANDA','2019-09-16 17:46:21','2019-09-16 17:46:21',NULL,NULL),
	(315,'RDGEMI','2019-09-16 17:47:56','2019-09-16 17:47:56',NULL,NULL),
	(316,'VCBTRANG','2019-09-16 20:30:20','2019-09-16 20:30:20',NULL,NULL),
	(317,'VCATOAN','2019-09-16 20:33:03','2019-09-16 20:33:03',NULL,NULL),
	(318,'VCXULE','2019-09-16 20:41:08','2019-09-16 20:41:08',NULL,NULL),
	(319,'VCKT','2019-09-16 20:41:30','2019-09-16 20:41:30',NULL,NULL),
	(320,'VCPHANH','2019-09-16 20:43:42','2019-09-16 20:43:42',NULL,NULL),
	(321,'VCHSMAYTQ','2019-09-16 20:45:02','2019-09-16 20:45:02',NULL,NULL),
	(322,'VCSGHA702','2019-09-16 20:48:34','2019-09-16 20:48:34',NULL,NULL),
	(323,'VCSGDUYEN','2019-09-16 20:57:58','2019-09-16 20:57:58',NULL,NULL),
	(324,'VCATSK','2019-09-16 21:01:34','2019-09-16 21:01:34',NULL,NULL),
	(325,'VCNGOAHOA','2019-09-16 21:06:58','2019-09-16 21:06:58',NULL,NULL),
	(326,'VCDUCCO','2019-09-16 21:12:53','2019-09-16 21:12:53',NULL,NULL),
	(327,'VCKANGNAM','2019-09-17 13:33:27','2019-09-17 13:33:27',NULL,NULL),
	(328,'RDSONTRAN','2019-09-17 14:17:18','2019-09-17 14:17:18',NULL,NULL),
	(329,'RDDUY87','2019-09-17 14:25:26','2019-09-17 14:25:26',NULL,NULL),
	(330,'VCSGPHUNG','2019-09-17 14:48:00','2019-09-17 14:48:00',NULL,NULL),
	(331,'VCTAMY','2019-09-17 14:59:13','2019-09-17 14:59:13',NULL,NULL),
	(332,'VCSGHUY308','2019-09-17 15:02:03','2019-09-17 15:02:03',NULL,NULL),
	(333,'VCQNGA75','2019-09-17 15:04:17','2019-09-17 15:04:17',NULL,NULL),
	(334,'VCCHUOT','2019-09-17 15:06:55','2019-09-17 15:06:55',NULL,NULL),
	(335,'RDLETUAN','2019-09-18 10:43:57','2019-09-18 10:43:57',NULL,NULL),
	(336,'RDGIAHAN','2019-09-18 11:16:26','2019-09-18 11:16:26',NULL,NULL),
	(337,'RDPHAMLE','2019-09-18 11:17:35','2019-09-18 11:17:35',NULL,NULL),
	(338,'RDHONGVAN','2019-09-18 11:41:22','2019-09-18 11:41:22',NULL,NULL),
	(339,'VCTHIEN879','2019-09-18 11:56:51','2019-09-18 11:56:51',NULL,NULL),
	(340,'rdkunny','2019-09-18 13:35:08','2019-09-18 13:35:08',NULL,NULL),
	(341,'RDHSAN99','2019-09-18 13:36:38','2019-09-18 13:36:38',NULL,NULL),
	(342,'VCHSTRINH892','2019-09-18 13:39:40','2019-09-18 13:39:40',NULL,NULL),
	(343,'VCHSLAMHUNG','2019-09-18 13:40:56','2019-09-18 13:40:56',NULL,NULL),
	(344,'HSKT','2019-09-18 13:42:03','2019-09-18 13:42:03',NULL,NULL),
	(345,'VCDTT','2019-09-18 13:47:03','2019-09-18 13:47:03',NULL,NULL),
	(346,'VCFTL42','2019-09-18 13:48:21','2019-09-18 13:48:21',NULL,NULL),
	(347,'VCVAVLE','2019-09-18 13:51:21','2019-09-18 13:51:21',NULL,NULL),
	(348,'VCSGGAUMEO','2019-09-18 13:51:39','2019-09-18 13:51:39',NULL,NULL),
	(349,'VCTRANG','2019-09-18 13:52:48','2019-09-18 13:52:48',NULL,NULL),
	(350,'VCHANH','2019-09-18 13:53:19','2019-09-18 13:53:19',NULL,NULL),
	(351,'VCNASM','2019-09-18 13:53:30','2019-09-18 13:53:30',NULL,NULL),
	(352,'VCMAYTQ','2019-09-18 13:54:02','2019-09-18 13:54:02',NULL,NULL),
	(353,'TDHSTHUNG95','2019-09-18 13:54:15','2019-09-18 13:54:15',NULL,NULL),
	(354,'VCSGANHDE','2019-09-18 13:58:53','2019-09-18 13:58:53',NULL,NULL),
	(355,'VCADONG835','2019-09-18 13:59:24','2019-09-18 13:59:24',NULL,NULL),
	(356,'VCTHHANHTU','2019-09-18 14:07:38','2019-09-18 14:07:38',NULL,NULL),
	(357,'VCTUNGLUYEN','2019-09-18 14:09:02','2019-09-18 14:09:02',NULL,NULL),
	(358,'NỘI BỘ','2019-09-18 15:38:17','2019-09-18 15:38:17',NULL,NULL),
	(359,'VCSAOMAI','2019-09-18 17:18:07','2019-09-18 17:18:07',NULL,NULL),
	(360,'VCVANLE','2019-09-18 18:30:59','2019-09-18 18:30:59',NULL,NULL),
	(361,'VCKEANGNAM','2019-09-19 14:12:40','2019-09-19 14:12:40',NULL,NULL),
	(362,'VCTRI','2019-09-19 14:43:14','2019-09-19 14:43:14',NULL,NULL),
	(363,'RDSGHIEU','2019-09-19 15:13:18','2019-09-19 15:13:18',NULL,NULL),
	(364,'RDSGNGHIA','2019-09-19 15:48:26','2019-09-19 15:48:26',NULL,NULL),
	(365,'RDQUANGHE','2019-09-20 10:30:43','2019-09-20 10:30:43',NULL,NULL),
	(366,'VCSONGTIN','2019-09-20 11:50:37','2019-09-20 11:50:37',NULL,NULL),
	(367,'HSYN8820','2019-09-20 13:40:57','2019-09-20 13:40:57',NULL,NULL),
	(368,'RDCHISTOP','2019-09-20 13:54:45','2019-09-20 13:54:45',NULL,NULL),
	(369,'RDHAINAM','2019-09-20 13:55:18','2019-09-20 13:55:18',NULL,NULL),
	(370,'VCADONG85','2019-09-20 16:04:40','2019-09-20 16:04:40',NULL,NULL),
	(371,'SGHUY308','2019-09-21 11:11:32','2019-09-21 11:11:32',NULL,NULL),
	(372,'VCCBINH','2019-09-21 11:31:11','2019-09-21 11:31:11',NULL,NULL),
	(373,'RDTRINGHIA','2019-09-21 13:10:43','2019-09-21 13:10:43',NULL,NULL),
	(374,'RDSGHOAI','2019-09-21 13:20:07','2019-09-21 13:20:07',NULL,NULL),
	(375,'RDSGTHUTHAO','2019-09-21 13:20:41','2019-09-21 13:20:41',NULL,NULL),
	(376,'RDBUIKIEN','2019-09-21 13:25:41','2019-09-21 13:25:41',NULL,NULL),
	(377,'VCHOA75','2019-09-21 13:29:06','2019-09-21 13:29:06',NULL,NULL),
	(378,'VCBRA','2019-09-21 14:11:35','2019-09-21 14:11:35',NULL,NULL),
	(379,'VCSGBRA','2019-09-21 14:48:59','2019-09-21 14:48:59',NULL,NULL),
	(380,'VCGIANGTQ','2019-09-21 16:08:44','2019-09-21 16:08:44',NULL,NULL),
	(381,'SGBRA','2019-09-21 16:18:43','2019-09-21 16:18:43',NULL,NULL),
	(382,'VCDUCTAT','2019-09-21 16:44:52','2019-09-21 16:44:52',NULL,NULL),
	(383,'RDKT','2019-09-21 17:24:44','2019-09-21 17:24:44',NULL,NULL),
	(384,'RDKCHINH','2019-09-23 10:55:44','2019-09-23 10:55:44',NULL,NULL),
	(385,'RDHIEP91','2019-09-23 11:00:12','2019-09-23 11:00:12',NULL,NULL),
	(386,'RDTHUTHAO','2019-09-23 11:02:33','2019-09-23 11:02:33',NULL,NULL),
	(387,'RDTNT','2019-09-23 11:02:42','2019-09-23 11:02:42',NULL,NULL),
	(388,'RDHIEPKUN','2019-09-23 11:02:50','2019-09-23 11:02:50',NULL,NULL),
	(389,'RDDUONGNAM','2019-09-23 11:03:07','2019-09-23 11:03:07',NULL,NULL),
	(390,'VCNGANHUYEN','2019-09-23 11:35:11','2019-09-23 11:35:11',NULL,NULL),
	(391,'VCMINHANH','2019-09-23 11:36:12','2019-09-23 11:36:12',NULL,NULL),
	(392,'VCTHO705','2019-09-23 11:36:28','2019-09-23 11:36:28',NULL,NULL),
	(393,'VCBACH','2019-09-23 12:01:50','2019-09-23 12:01:50',NULL,NULL),
	(394,'VCHATHI','2019-09-23 12:03:46','2019-09-23 12:03:46',NULL,NULL),
	(395,'RDSGHOA','2019-09-23 14:10:47','2019-09-23 14:10:47',NULL,NULL),
	(396,'RDCHISTROP','2019-09-23 14:13:26','2019-09-23 14:13:26',NULL,NULL),
	(397,'VSHSVANANH','2019-09-23 14:14:37','2019-09-23 14:14:37',NULL,NULL),
	(398,'RDHSLINH91','2019-09-23 14:17:13','2019-09-23 14:17:13',NULL,NULL),
	(399,'VCTHUYHA','2019-09-23 14:21:38','2019-09-23 14:21:38',NULL,NULL),
	(400,'VCHSKT','2019-09-23 14:23:02','2019-09-23 14:23:02',NULL,NULL),
	(401,'SGGAUMEO','2019-09-23 14:30:19','2019-09-23 14:30:19',NULL,NULL),
	(402,'VCHBDUY0','2019-09-23 14:33:33','2019-09-23 14:33:33',NULL,NULL),
	(403,'VCUPINUS','2019-09-23 14:38:38','2019-09-23 14:38:38',NULL,NULL),
	(404,'VCTRANG56','2019-09-23 16:24:06','2019-09-23 16:24:06',NULL,NULL),
	(405,'VCVANH','2019-09-23 16:38:08','2019-09-23 16:38:08',NULL,NULL),
	(406,'VCSGBONBON','2019-09-23 16:39:31','2019-09-23 16:39:31',NULL,NULL),
	(407,'tung test thanh toan','2019-09-23 17:06:39','2019-09-23 17:06:39',NULL,NULL),
	(408,'VCSGKHOA','2019-09-23 17:45:40','2019-09-23 17:45:40',NULL,NULL),
	(409,'VCQUANG979','2019-09-24 09:20:05','2019-09-24 09:20:05',NULL,NULL),
	(410,'RDNGANBE','2019-09-24 11:39:24','2019-09-24 11:39:24',NULL,NULL),
	(411,'RDKIEUNGA','2019-09-24 11:42:19','2019-09-24 11:42:19',NULL,NULL),
	(412,'RDMYLINH','2019-09-24 11:43:50','2019-09-24 11:43:50',NULL,NULL),
	(413,'RDSGMYLINH','2019-09-24 11:51:35','2019-09-24 11:51:35',NULL,NULL),
	(414,'RDNGOCANH','2019-09-24 12:05:05','2019-09-24 12:05:05',NULL,NULL),
	(415,'VCHSLYHA','2019-09-24 13:50:27','2019-09-24 13:50:27',NULL,NULL),
	(416,'VCBVTHANG','2019-09-24 14:19:39','2019-09-24 14:19:39',NULL,NULL),
	(417,'RDMYLE','2019-09-24 14:30:31','2019-09-24 14:30:31',NULL,NULL),
	(418,'VCTHIEN875','2019-09-24 15:00:44','2019-09-24 15:00:44',NULL,NULL),
	(419,'RDLINH91','2019-09-24 16:13:49','2019-09-24 16:13:49',NULL,NULL),
	(420,'VCHSHUAN','2019-09-24 16:15:12','2019-09-24 16:15:12',NULL,NULL),
	(421,'VCELA','2019-09-25 11:41:22','2019-09-25 11:41:22',NULL,NULL),
	(422,'RDSGQUUYEN','2019-09-25 13:47:38','2019-09-25 13:47:38',NULL,NULL),
	(423,'SGTHUTHAO','2019-09-25 14:11:30','2019-09-25 14:11:30',NULL,NULL),
	(424,'VCHMA','2019-09-25 14:17:02','2019-09-25 14:17:02',NULL,NULL),
	(425,'VCKEMBUTI','2019-09-25 14:31:44','2019-09-25 14:31:44',NULL,NULL),
	(426,'VCLYLY','2019-09-25 14:33:57','2019-09-25 14:33:57',NULL,NULL),
	(427,'VCUYENVU','2019-09-25 14:35:24','2019-09-25 14:35:24',NULL,NULL),
	(428,'VCANGOC','2019-09-25 16:14:44','2019-09-25 16:14:44',NULL,NULL),
	(429,'VCHSTHAO92','2019-09-25 16:28:48','2019-09-25 16:28:48',NULL,NULL),
	(430,'RDLINHTIT','2019-09-26 09:22:47','2019-09-26 09:22:47',NULL,NULL),
	(431,'RDSGTUAN','2019-09-26 12:30:12','2019-09-26 12:30:12',NULL,NULL),
	(432,'RDUYENVU','2019-09-26 13:55:47','2019-09-26 13:55:47',NULL,NULL),
	(433,'VCTATQ','2019-09-26 14:19:21','2019-09-26 14:19:21',NULL,NULL),
	(434,'RDTUANVU','2019-09-26 14:20:15','2019-09-26 14:20:15',NULL,NULL),
	(435,'VCMRHIEP','2019-09-26 14:47:49','2019-09-26 14:47:49',NULL,NULL),
	(436,'VCTHAOHA','2019-09-26 14:48:05','2019-09-26 14:48:05',NULL,NULL),
	(437,'VCSGBQT','2019-09-26 15:19:31','2019-09-26 15:19:31',NULL,NULL),
	(438,'VCYOUMY29','2019-09-26 15:27:23','2019-09-26 15:27:23',NULL,NULL),
	(439,'VCSON88','2019-09-26 15:28:35','2019-09-26 15:28:35',NULL,NULL),
	(440,'VCSGTRAM','2019-09-26 15:35:03','2019-09-26 15:35:03',NULL,NULL),
	(441,'SGDUYENVU','2019-09-27 09:16:03','2019-09-27 09:16:03',NULL,NULL),
	(442,'RDSGUYENVU','2019-09-27 09:16:19','2019-09-27 09:16:19',NULL,NULL),
	(443,'VCDUONGMD','2019-09-27 09:46:15','2019-09-27 09:46:15',NULL,NULL),
	(444,'RDAN','2019-09-27 11:01:09','2019-09-27 11:01:09',NULL,NULL),
	(445,'VCTHUTRANG','2019-09-27 11:07:33','2019-09-27 11:07:33',NULL,NULL),
	(446,'VCBELLA','2019-09-27 11:07:46','2019-09-27 11:07:46',NULL,NULL),
	(447,'VCHIEPHD','2019-09-27 11:09:57','2019-09-27 11:09:57',NULL,NULL),
	(448,'VCTRONGTOAN','2019-09-27 11:10:21','2019-09-27 11:10:21',NULL,NULL),
	(449,'VCHSHOA','2019-09-27 11:30:25','2019-09-27 11:30:25',NULL,NULL),
	(450,'RDCYZ16','2019-09-27 11:31:13','2019-09-27 11:31:13',NULL,NULL),
	(451,'VCSAO','2019-09-27 11:45:48','2019-09-27 11:45:48',NULL,NULL),
	(452,'VCTHUTRA','2019-09-27 14:54:04','2019-09-27 14:54:04',NULL,NULL),
	(453,'VC6THIEN876','2019-09-28 10:33:10','2019-09-28 10:33:10',NULL,NULL),
	(454,'VCXULE88','2019-09-28 10:38:06','2019-09-28 10:38:06',NULL,NULL),
	(455,'VCDUONGMDHS','2019-09-28 11:01:16','2019-09-28 11:01:16',NULL,NULL),
	(456,'VCNGOCMINH','2019-09-28 11:10:01','2019-09-28 11:10:01',NULL,NULL),
	(457,'VCHANA','2019-09-28 11:15:24','2019-09-28 11:15:24',NULL,NULL),
	(458,'VCYUMY','2019-09-28 11:16:09','2019-09-28 11:16:09',NULL,NULL),
	(459,'VCBVTRANG','2019-09-28 11:19:52','2019-09-28 11:19:52',NULL,NULL),
	(460,'VCTHUYLINH','2019-09-28 11:20:28','2019-09-28 11:20:28',NULL,NULL),
	(461,'VCMY92','2019-09-28 11:20:55','2019-09-28 11:20:55',NULL,NULL),
	(462,'RDHSLINHTIT','2019-09-28 11:38:14','2019-09-28 11:38:14',NULL,NULL),
	(463,'VCHSHOAN','2019-09-28 14:53:56','2019-09-28 14:53:56',NULL,NULL),
	(464,'HSBQ','2019-09-28 15:42:10','2019-09-28 15:42:10',NULL,NULL),
	(465,'VCHSLILLIUM','2019-09-28 15:45:43','2019-09-28 15:45:43',NULL,NULL),
	(466,'HSBQRD','2019-09-28 15:47:27','2019-09-28 15:47:27',NULL,NULL),
	(467,'VCHSMOCHA','2019-09-28 15:56:05','2019-09-28 15:56:05',NULL,NULL),
	(468,'VCHBKEMBUTI','2019-09-28 16:14:53','2019-09-28 16:14:53',NULL,NULL),
	(469,'RDAN96','2019-09-30 14:34:31','2019-09-30 14:34:31',NULL,NULL),
	(470,'VCTHANHThU','2019-09-30 14:48:36','2019-09-30 14:48:36',NULL,NULL),
	(471,'VCTV94','2019-10-02 14:09:07','2019-10-02 14:09:07',NULL,NULL),
	(472,'HSVINCENT','2019-10-02 15:59:02','2019-10-02 15:59:02',NULL,NULL),
	(473,'SG','2019-10-07 23:01:41','2019-10-07 23:01:41',NULL,NULL),
	(474,'DDINHBVT','2019-10-09 09:55:50','2019-10-09 09:55:50',NULL,NULL),
	(475,'VCPHUON90','2019-10-09 10:35:31','2019-10-09 10:35:31',NULL,NULL),
	(476,'RDSGY','2019-10-09 10:53:49','2019-10-09 10:53:49',NULL,NULL),
	(477,'RDCUONG626','2019-10-09 11:04:35','2019-10-09 11:04:35',NULL,NULL),
	(478,'RDVIETHRM','2019-10-09 11:04:56','2019-10-09 11:04:56',NULL,NULL),
	(479,'RDHPTUNG','2019-10-09 11:09:07','2019-10-09 11:09:07',NULL,NULL),
	(480,'RDLHGIANG','2019-10-09 11:10:22','2019-10-09 11:10:22',NULL,NULL),
	(481,'RDANHHOA','2019-10-09 11:10:31','2019-10-09 11:10:31',NULL,NULL),
	(482,'RDTHUYVI','2019-10-09 14:18:19','2019-10-09 14:18:19',NULL,NULL),
	(483,'VCMINGNGOC','2019-10-09 14:25:24','2019-10-09 14:25:24',NULL,NULL),
	(484,'RDTHUNG95','2019-10-09 14:25:52','2019-10-09 14:25:52',NULL,NULL),
	(485,'RDHSCYZ16','2019-10-09 14:28:41','2019-10-09 14:28:41',NULL,NULL),
	(486,'VCHOA574','2019-10-09 14:38:42','2019-10-09 14:38:42',NULL,NULL),
	(487,'VCBACNGUYEN','2019-10-09 14:47:29','2019-10-09 14:47:29',NULL,NULL),
	(488,'VCTL92','2019-10-09 15:03:09','2019-10-09 15:03:09',NULL,NULL),
	(489,'VCSGQUYNH95','2019-10-09 15:08:24','2019-10-09 15:08:24',NULL,NULL),
	(490,'VCHIEUCAMPHA','2019-10-09 15:08:48','2019-10-09 15:08:48',NULL,NULL),
	(491,'VCSGHUY','2019-10-09 15:18:11','2019-10-09 15:18:11',NULL,NULL),
	(492,'VCVANTHUAN','2019-10-09 15:19:16','2019-10-09 15:19:16',NULL,NULL),
	(493,'VCLTHU95','2019-10-09 18:22:32','2019-10-09 18:22:32',NULL,NULL),
	(494,'RDHSHONGVAN','2019-10-10 09:46:48','2019-10-10 09:46:48',NULL,NULL),
	(495,'RDTHUYVAN','2019-10-10 13:43:15','2019-10-10 13:43:15',NULL,NULL),
	(496,'RDSGBNH87','2019-10-10 13:46:40','2019-10-10 13:46:40',NULL,NULL),
	(497,'RDLIENNGOC','2019-10-10 13:57:20','2019-10-10 13:57:20',NULL,NULL),
	(498,'RDHSKAI','2019-10-10 14:57:47','2019-10-10 14:57:47',NULL,NULL),
	(499,'VCHSVANAANH','2019-10-10 14:58:07','2019-10-10 14:58:07',NULL,NULL),
	(500,'VCMINHG','2019-10-10 15:07:16','2019-10-10 15:07:16',NULL,NULL),
	(501,'RDDUONGNHI','2019-10-10 16:09:03','2019-10-10 16:09:03',NULL,NULL),
	(502,'VCLANANHTQ','2019-10-10 16:31:09','2019-10-10 16:31:09',NULL,NULL),
	(503,'VCNGA677','2019-10-10 16:43:23','2019-10-10 16:43:23',NULL,NULL),
	(504,'RDHSNGOCMAUVE','2019-10-10 17:13:47','2019-10-10 17:13:47',NULL,NULL),
	(505,'RDBICHGEM','2019-10-10 17:17:35','2019-10-10 17:17:35',NULL,NULL),
	(506,'RDQUANNEN','2019-10-11 11:30:26','2019-10-11 11:30:26',NULL,NULL),
	(507,'RDMINHTU','2019-10-11 11:30:49','2019-10-11 11:30:49',NULL,NULL),
	(508,'RDBANG77','2019-10-11 11:50:02','2019-10-11 11:50:02',NULL,NULL),
	(509,'RDSGBAOBOI','2019-10-11 11:59:36','2019-10-11 11:59:36',NULL,NULL),
	(510,'VCTHO','2019-10-11 14:17:23','2019-10-11 14:17:23',NULL,NULL),
	(511,'RSHSLYHA','2019-10-11 15:51:48','2019-10-11 15:51:48',NULL,NULL),
	(512,'RDTHUYDN','2019-10-11 16:18:32','2019-10-11 16:18:32',NULL,NULL),
	(513,'VCHUYNGA75','2019-10-11 18:01:16','2019-10-11 18:01:16',NULL,NULL),
	(514,'VCLETRANG','2019-10-11 18:23:58','2019-10-11 18:23:58',NULL,NULL),
	(515,'VCDUNGHN','2019-10-11 18:52:05','2019-10-11 18:52:05',NULL,NULL),
	(516,'VCCHINH892','2019-10-11 18:52:32','2019-10-11 18:52:32',NULL,NULL),
	(517,'VCQA98','2019-10-11 18:53:23','2019-10-11 18:53:23',NULL,NULL),
	(518,'VCHAI','2019-10-11 18:56:32','2019-10-11 18:56:32',NULL,NULL),
	(519,'VCALONG','2019-10-11 18:58:12','2019-10-11 18:58:12',NULL,NULL),
	(520,'VCSGVANTHUAN','2019-10-11 21:20:07','2019-10-11 21:20:07',NULL,NULL),
	(521,'RDNAHIENLN','2019-10-11 21:44:27','2019-10-11 21:44:27',NULL,NULL),
	(522,'RSHdLYHA','2019-10-12 10:01:41','2019-10-12 10:01:41',NULL,NULL),
	(523,'RDSGLAK','2019-10-12 11:28:39','2019-10-12 11:28:39',NULL,NULL),
	(524,'RDSGHONGVAN','2019-10-12 11:40:19','2019-10-12 11:40:19',NULL,NULL),
	(525,'VCKENGNAM','2019-10-12 15:10:26','2019-10-12 15:10:26',NULL,NULL),
	(526,'RDSGHOANGAN','2019-10-12 15:45:33','2019-10-12 15:45:33',NULL,NULL),
	(527,'VCHBDUY','2019-10-12 19:54:14','2019-10-12 19:54:14',NULL,NULL),
	(528,'RDNVHIEU','2019-10-12 19:56:34','2019-10-12 19:56:34',NULL,NULL),
	(529,'VCANSM','2019-10-12 20:08:32','2019-10-12 20:08:32',NULL,NULL),
	(530,'VCTHAO473','2019-10-12 20:11:05','2019-10-12 20:11:05',NULL,NULL),
	(531,'VCANHTRUONGHN','2019-10-12 20:35:46','2019-10-12 20:35:46',NULL,NULL),
	(532,'VCQUYNHHN','2019-10-12 20:37:43','2019-10-12 20:37:43',NULL,NULL),
	(533,'VCASTOAN','2019-10-12 20:39:04','2019-10-12 20:39:04',NULL,NULL),
	(534,'VCSGVY','2019-10-12 20:44:58','2019-10-12 20:44:58',NULL,NULL),
	(535,'RDLTTRANG','2019-10-14 10:28:33','2019-10-14 10:28:33',NULL,NULL),
	(536,'VCPGUONG90','2019-10-14 10:30:44','2019-10-14 10:30:44',NULL,NULL),
	(537,'RDSGSAM','2019-10-14 10:45:27','2019-10-14 10:45:27',NULL,NULL),
	(538,'VCSGVYVY79','2019-10-14 13:49:02','2019-10-14 13:49:02',NULL,NULL),
	(539,'v','2019-10-14 14:16:08','2019-10-14 14:16:08',NULL,NULL),
	(540,'RDTUANANH','2019-10-14 15:22:44','2019-10-14 15:22:44',NULL,NULL),
	(541,'VCHSDUONG84','2019-10-14 15:42:47','2019-10-14 15:42:47',NULL,NULL),
	(542,'VCHSBIN','2019-10-14 15:46:17','2019-10-14 15:46:17',NULL,NULL),
	(543,'RDSGANH','2019-10-14 15:48:54','2019-10-14 15:48:54',NULL,NULL),
	(544,'VCHSCAMTU','2019-10-14 15:49:35','2019-10-14 15:49:35',NULL,NULL),
	(545,'RDANHDE','2019-10-14 15:50:14','2019-10-14 15:50:14',NULL,NULL),
	(546,'VCANHTRUONG','2019-10-14 15:56:10','2019-10-14 15:56:10',NULL,NULL),
	(547,'RDSONGTIN','2019-10-14 21:13:28','2019-10-14 21:13:28',NULL,NULL),
	(548,'RDBSNGUYET','2019-10-14 21:29:56','2019-10-14 21:29:56',NULL,NULL),
	(549,'RDNAMHAI','2019-10-14 21:31:47','2019-10-14 21:31:47',NULL,NULL),
	(550,'VCTRUNG','2019-10-14 21:32:50','2019-10-14 21:32:50',NULL,NULL),
	(551,'VCSGQUYNH','2019-10-14 22:11:15','2019-10-14 22:11:15',NULL,NULL),
	(552,'VCHUYEN93','2019-10-14 22:11:45','2019-10-14 22:11:45',NULL,NULL),
	(553,'VCANH88','2019-10-14 22:58:25','2019-10-14 22:58:25',NULL,NULL),
	(554,'VCTIFFANY','2019-10-14 23:03:29','2019-10-14 23:03:29',NULL,NULL),
	(555,'VCELLA','2019-10-14 23:09:25','2019-10-14 23:09:25',NULL,NULL),
	(556,'VCPQT','2019-10-15 12:56:07','2019-10-15 12:56:07',NULL,NULL),
	(557,'RDNGHIA','2019-10-15 15:37:56','2019-10-15 15:37:56',NULL,NULL),
	(558,'VCSGSAM','2019-10-15 16:01:09','2019-10-15 16:01:09',NULL,NULL),
	(559,'RDSGSAMYT4129963082572','2019-10-15 16:02:27','2019-10-15 16:02:27',NULL,NULL),
	(560,'RDVA34','2019-10-15 16:07:24','2019-10-15 16:07:24',NULL,NULL),
	(561,'VCAKHANH','2019-10-15 16:17:08','2019-10-15 16:17:08',NULL,NULL),
	(562,'VCLINH09','2019-10-15 16:26:05','2019-10-15 16:26:05',NULL,NULL),
	(563,'VCPTHAP473','2019-10-15 16:27:27','2019-10-15 16:27:27',NULL,NULL),
	(564,'VCVITHAN-3-3','2019-10-15 17:01:44','2019-10-15 17:01:44',NULL,NULL),
	(565,'RDAHOA','2019-10-16 12:33:07','2019-10-16 12:33:07',NULL,NULL),
	(566,'RDHSANH69','2019-10-16 14:14:00','2019-10-16 14:14:00',NULL,NULL),
	(567,'RSHSKUNNY','2019-10-16 14:15:41','2019-10-16 14:15:41',NULL,NULL),
	(568,'VCHSTHUHUYEN','2019-10-16 14:22:31','2019-10-16 14:22:31',NULL,NULL),
	(569,'RDLEDUONG','2019-10-16 14:59:05','2019-10-16 14:59:05',NULL,NULL),
	(570,'RDSGTUVAN','2019-10-16 15:02:58','2019-10-16 15:02:58',NULL,NULL),
	(571,'hskt khăn trải bàn','2019-10-16 15:40:26','2019-10-16 15:40:26',NULL,NULL),
	(572,'HSKT 2 TÚI GẤU','2019-10-16 15:44:59','2019-10-16 15:44:59',NULL,NULL),
	(573,'HSKT   NHIỀU TUID BỘT ĐEN  NÂU','2019-10-16 15:54:13','2019-10-16 15:54:13',NULL,NULL),
	(574,'HSKT   NHIỀU TÚI BỘT ĐEN  NÂU','2019-10-16 15:54:20','2019-10-16 15:54:20',NULL,NULL),
	(575,'VCBAACNGUYEN','2019-10-16 16:29:22','2019-10-16 16:29:22',NULL,NULL),
	(576,'VCTNL69','2019-10-17 09:20:32','2019-10-17 09:20:32',NULL,NULL),
	(577,'VCHSXIANG191','2019-10-17 09:54:03','2019-10-17 09:54:03',NULL,NULL),
	(578,'VCMUMMY\\','2019-10-17 11:55:12','2019-10-17 11:55:12',NULL,NULL),
	(579,'VCLMH567','2019-10-17 12:04:48','2019-10-17 12:04:48',NULL,NULL),
	(580,'VCYUMMY','2019-10-17 14:24:30','2019-10-17 14:24:30',NULL,NULL),
	(581,'VCHANH212`','2019-10-17 15:23:21','2019-10-17 15:23:21',NULL,NULL),
	(582,'VCANHDAKLAK','2019-10-17 15:54:14','2019-10-17 15:54:14',NULL,NULL),
	(583,'VCTHIEN','2019-10-18 09:11:15','2019-10-18 09:11:15',NULL,NULL),
	(584,'VCHAD0NG','2019-10-20 10:43:28','2019-10-20 10:43:28',NULL,NULL),
	(585,'VCSGTRAM033','2019-10-20 10:50:30','2019-10-20 10:50:30',NULL,NULL),
	(586,'RDSGTRAMANH','2019-10-20 11:00:54','2019-10-20 11:00:54',NULL,NULL),
	(587,'RDSGDYNGNG','2019-10-20 11:02:57','2019-10-20 11:02:57',NULL,NULL),
	(588,'VCTANGHUY','2019-10-20 14:36:06','2019-10-20 14:36:06',NULL,NULL),
	(589,'VCHOAMAUDON','2019-10-20 14:36:31','2019-10-20 14:36:31',NULL,NULL),
	(590,'RDSGBONBON','2019-10-20 14:38:00','2019-10-20 14:38:00',NULL,NULL),
	(591,'RDSGPHUNGSG','2019-10-20 14:39:15','2019-10-20 14:39:15',NULL,NULL),
	(592,'VCDIPQ','2019-10-20 14:47:53','2019-10-20 14:47:53',NULL,NULL),
	(593,'VCLEDUNG','2019-10-20 14:55:21','2019-10-20 14:55:21',NULL,NULL),
	(594,'VCSGPHUNGSG','2019-10-20 15:48:12','2019-10-20 15:48:12',NULL,NULL),
	(595,'VCVUHN','2019-10-21 11:59:06','2019-10-21 11:59:06',NULL,NULL),
	(596,'VCLIENNGOC','2019-10-21 12:01:03','2019-10-21 12:01:03',NULL,NULL),
	(597,'RDBADO','2019-10-21 12:03:13','2019-10-21 12:03:13',NULL,NULL),
	(598,'RDYENDO','2019-10-22 11:56:29','2019-10-22 11:56:29',NULL,NULL),
	(599,'HDKT','2019-10-22 13:31:28','2019-10-22 13:31:28',NULL,NULL),
	(600,'RDSGNGA','2019-10-22 13:49:39','2019-10-22 13:49:39',NULL,NULL),
	(601,'RDHDTUNGKK','2019-10-22 13:57:52','2019-10-22 13:57:52',NULL,NULL),
	(602,'RDHDNHUNGDO','2019-10-22 13:58:10','2019-10-22 13:58:10',NULL,NULL),
	(603,'RDHDTRONGTOAN','2019-10-22 13:59:07','2019-10-22 13:59:07',NULL,NULL),
	(604,'RDHDLINHBONG','2019-10-22 14:17:27','2019-10-22 14:17:27',NULL,NULL),
	(605,'HDHADONG','2019-10-23 09:05:08','2019-10-23 09:05:08',NULL,NULL),
	(606,'SGPHANH','2019-10-23 09:06:51','2019-10-23 09:06:51',NULL,NULL),
	(607,'SGBONBON','2019-10-23 09:30:03','2019-10-23 09:30:03',NULL,NULL),
	(608,'SGFRANK','2019-10-23 09:32:35','2019-10-23 09:32:35',NULL,NULL),
	(609,'VCCHUTUOC','2019-10-23 16:51:24','2019-10-23 16:51:24',NULL,NULL),
	(610,'VCLINHLINH1131','2019-10-23 16:51:44','2019-10-23 16:51:44',NULL,NULL),
	(611,'HSHOA475','2019-10-24 09:17:51','2019-10-24 09:17:51',NULL,NULL),
	(612,'VCHNHIEU','2019-10-24 11:26:31','2019-10-24 11:26:31',NULL,NULL),
	(613,'RDKHANGBIN','2019-10-24 15:36:36','2019-10-24 15:36:36',NULL,NULL),
	(614,'VSHSTHUY25','2019-10-24 16:24:04','2019-10-24 16:24:04',NULL,NULL),
	(615,'RDHDSONTRAN','2019-10-24 17:24:21','2019-10-24 17:24:21',NULL,NULL),
	(616,'VCSGKA','2019-10-26 13:40:09','2019-10-26 13:40:09',NULL,NULL),
	(617,'RDMIMI','2019-10-26 14:07:54','2019-10-26 14:07:54',NULL,NULL),
	(618,'RDUYEN29','2019-10-26 14:08:10','2019-10-26 14:08:10',NULL,NULL),
	(619,'RDTHUHABN','2019-10-26 14:10:08','2019-10-26 14:10:08',NULL,NULL),
	(620,'RDHDGIAHAN','2019-10-26 14:28:01','2019-10-26 14:28:01',NULL,NULL),
	(621,'VCNAM85','2019-10-28 11:00:12','2019-10-28 11:00:12',NULL,NULL),
	(622,'VCHDPI','2019-10-28 11:00:59','2019-10-28 11:00:59',NULL,NULL),
	(623,'RDCHUNKI','2019-10-28 11:15:45','2019-10-28 11:15:45',NULL,NULL),
	(624,'VCHDUNG89','2019-10-28 13:14:56','2019-10-28 13:14:56',NULL,NULL),
	(625,'VCHUNGSUN0','2019-10-28 14:51:46','2019-10-28 14:51:46',NULL,NULL),
	(626,'VCKIMPHUNG','2019-10-28 16:02:35','2019-10-28 16:02:35',NULL,NULL),
	(627,'VCNGOCHN','2019-10-28 16:07:08','2019-10-28 16:07:08',NULL,NULL),
	(628,'VCSGFRANK','2019-10-28 16:09:29','2019-10-28 16:09:29',NULL,NULL),
	(629,'VCHOANGVAN','2019-10-28 16:21:07','2019-10-28 16:21:07',NULL,NULL),
	(630,'VCABINH','2019-10-28 16:21:33','2019-10-28 16:21:33',NULL,NULL),
	(631,'VCNHUYENVAN','2019-10-28 16:21:59','2019-10-28 16:21:59',NULL,NULL),
	(632,'VCSGYUKI','2019-10-28 16:22:12','2019-10-28 16:22:12',NULL,NULL),
	(633,'VCTHABG','2019-10-28 16:24:00','2019-10-28 16:24:00',NULL,NULL),
	(634,'VCNGUYENVAN','2019-10-28 17:43:46','2019-10-28 17:43:46',NULL,NULL),
	(635,'VCTHAOBG','2019-10-29 14:58:47','2019-10-29 14:58:47',NULL,NULL),
	(636,'VCTHAO92','2019-10-29 15:03:40','2019-10-29 15:03:40',NULL,NULL),
	(637,'VCCHILAN','2019-10-29 15:39:26','2019-10-29 15:39:26',NULL,NULL),
	(638,'VCHDCHILAN','2019-10-29 15:59:33','2019-10-29 15:59:33',NULL,NULL),
	(639,'VCHSPA915','2019-10-29 17:39:35','2019-10-29 17:39:35',NULL,NULL),
	(640,'VCTH888','2019-10-30 12:02:23','2019-10-30 12:02:23',NULL,NULL),
	(641,'RDTRANGHP','2019-10-30 13:53:53','2019-10-30 13:53:53',NULL,NULL),
	(642,'RDLYMINH','2019-10-30 14:04:00','2019-10-30 14:04:00',NULL,NULL),
	(643,'VCNGHIATQ','2019-10-30 14:16:50','2019-10-30 14:16:50',NULL,NULL),
	(644,'VCSGVAN','2019-10-30 14:26:34','2019-10-30 14:26:34',NULL,NULL),
	(645,'VCHĐUONGMD','2019-10-30 14:41:02','2019-10-30 14:41:02',NULL,NULL),
	(646,'RDVANNA','2019-10-30 15:02:27','2019-10-30 15:02:27',NULL,NULL),
	(647,'RĐUNGBN','2019-10-30 15:02:56','2019-10-30 15:02:56',NULL,NULL),
	(648,'RDHSTRUNG85','2019-10-30 16:04:49','2019-10-30 16:04:49',NULL,NULL),
	(649,'VCLYMINH','2019-10-30 16:34:07','2019-10-30 16:34:07',NULL,NULL),
	(650,'VCHDDUNG89','2019-10-31 11:20:03','2019-10-31 11:20:03',NULL,NULL),
	(651,'VCM','2019-10-31 14:41:27','2019-10-31 14:41:27',NULL,NULL),
	(652,'RDHDANH69','2019-10-31 17:39:42','2019-10-31 17:39:42',NULL,NULL),
	(653,'RDHDVANNA','2019-10-31 17:40:26','2019-10-31 17:40:26',NULL,NULL),
	(654,'RDHDDUNGBN','2019-10-31 17:42:33','2019-10-31 17:42:33',NULL,NULL),
	(655,'VCCAOT93','2019-11-01 11:06:54','2019-11-01 11:06:54',NULL,NULL),
	(656,'VCTUAN','2019-11-01 11:07:09','2019-11-01 11:07:09',NULL,NULL),
	(657,'RDHDBAHA','2019-11-01 13:11:42','2019-11-01 13:11:42',NULL,NULL),
	(658,'HBDUY0','2019-11-01 14:45:10','2019-11-01 14:45:10',NULL,NULL),
	(659,'VCNGUYEN','2019-11-01 14:47:05','2019-11-01 14:47:05',NULL,NULL),
	(660,'VCTHONGTRUNG','2019-11-01 14:49:32','2019-11-01 14:49:32',NULL,NULL),
	(661,'RDHDCUONG626','2019-11-01 15:51:47','2019-11-01 15:51:47',NULL,NULL),
	(662,'VCGIAVU','2019-11-02 08:48:00','2019-11-02 08:48:00',NULL,NULL),
	(663,'RDNGOC98','2019-11-02 11:17:30','2019-11-02 11:17:30',NULL,NULL),
	(664,'VCGAUMEO','2019-11-02 11:27:56','2019-11-02 11:27:56',NULL,NULL),
	(665,'VCXUAN88','2019-11-02 11:33:18','2019-11-02 11:33:18',NULL,NULL),
	(666,'VCXUAN82','2019-11-02 12:23:38','2019-11-02 12:23:38',NULL,NULL),
	(667,'VCDUONG84','2019-11-02 14:29:58','2019-11-02 14:29:58',NULL,NULL),
	(668,'VCHSURBAN','2019-11-02 17:00:47','2019-11-02 17:00:47',NULL,NULL),
	(669,'RDHSCAROL','2019-11-02 17:03:09','2019-11-02 17:03:09',NULL,NULL),
	(670,'VCHSTHAO02','2019-11-02 17:05:06','2019-11-02 17:05:06',NULL,NULL),
	(671,'RDHDTN','2019-11-04 09:19:28','2019-11-04 09:19:28',NULL,NULL),
	(672,'VCCA0OT93','2019-11-04 09:35:37','2019-11-04 09:35:37',NULL,NULL),
	(673,'RDNAM02','2019-11-04 10:40:14','2019-11-04 10:40:14',NULL,NULL),
	(674,'VCQUYNH282','2019-11-04 11:04:58','2019-11-04 11:04:58',NULL,NULL),
	(675,'VCHDANH05','2019-11-04 11:38:18','2019-11-04 11:38:18',NULL,NULL),
	(676,'VCHDCHINH','2019-11-04 11:38:31','2019-11-04 11:38:31',NULL,NULL),
	(677,'VCHDQ12','2019-11-04 12:56:15','2019-11-04 12:56:15',NULL,NULL),
	(678,'RDCAROL','2019-11-04 14:05:30','2019-11-04 14:05:30',NULL,NULL),
	(679,'VCHSCAMTHU','2019-11-04 14:05:30','2019-11-04 14:05:30',NULL,NULL),
	(680,'VCHSVANHANH','2019-11-04 14:06:25','2019-11-04 14:06:25',NULL,NULL),
	(681,'RDTRANGORD','2019-11-04 14:30:38','2019-11-04 14:30:38',NULL,NULL),
	(682,'VCTHANHTHANH','2019-11-04 14:45:21','2019-11-04 14:45:21',NULL,NULL),
	(683,'VCLINDA','2019-11-04 14:53:11','2019-11-04 14:53:11',NULL,NULL),
	(684,'VCMINHHOA','2019-11-05 11:51:19','2019-11-05 11:51:19',NULL,NULL),
	(685,'VCSGTIEN','2019-11-05 11:53:03','2019-11-05 11:53:03',NULL,NULL),
	(686,'VCLHA','2019-11-05 11:57:57','2019-11-05 11:57:57',NULL,NULL),
	(687,'VCTIEN','2019-11-05 12:03:59','2019-11-05 12:03:59',NULL,NULL),
	(688,'VCHD91','2019-11-05 12:18:33','2019-11-05 12:18:33',NULL,NULL),
	(689,'RDHSTHUTHUYEN','2019-11-05 15:51:53','2019-11-05 15:51:53',NULL,NULL),
	(690,'RDSGTIEN','2019-11-06 09:36:27','2019-11-06 09:36:27',NULL,NULL),
	(691,'RDVNHA88','2019-11-06 11:09:20','2019-11-06 11:09:20',NULL,NULL),
	(692,'VCLOANNGUYEN','2019-11-06 11:12:18','2019-11-06 11:12:18',NULL,NULL),
	(693,'VCATIEN','2019-11-06 11:36:40','2019-11-06 11:36:40',NULL,NULL),
	(694,'VCLA','2019-11-06 11:39:52','2019-11-06 11:39:52',NULL,NULL),
	(695,'VCHSTHUND3110','2019-11-06 14:09:07','2019-11-06 14:09:07',NULL,NULL),
	(696,'VCHUE87','2019-11-07 10:29:26','2019-11-07 10:29:26',NULL,NULL),
	(697,'VCLACDU','2019-11-07 11:52:56','2019-11-07 11:52:56',NULL,NULL),
	(698,'BTThuy606','2019-11-07 15:17:19','2019-11-07 15:17:19',NULL,NULL),
	(699,'RDNVHA88','2019-11-08 10:42:41','2019-11-08 10:42:41',NULL,NULL),
	(700,'RDSGDANGTUAN','2019-11-08 10:49:09','2019-11-08 10:49:09',NULL,NULL),
	(701,'RDANH88','2019-11-08 10:54:48','2019-11-08 10:54:48',NULL,NULL),
	(702,'RDVTT','2019-11-08 10:55:43','2019-11-08 10:55:43',NULL,NULL),
	(703,'VCPHUONGTHAO473','2019-11-08 11:07:13','2019-11-08 11:07:13',NULL,NULL),
	(704,'VCHHUNGSUNO','2019-11-08 11:07:57','2019-11-08 11:07:57',NULL,NULL),
	(705,'HDQ12','2019-11-08 11:23:12','2019-11-08 11:23:12',NULL,NULL),
	(706,'VCTHAOTAN','2019-11-09 11:17:11','2019-11-09 11:17:11',NULL,NULL),
	(707,'RDHAI1203','2019-11-09 11:45:43','2019-11-09 11:45:43',NULL,NULL),
	(708,'VCHSLUHANH','2019-11-09 13:27:09','2019-11-09 13:27:09',NULL,NULL),
	(709,'VCHSMINHCHI','2019-11-09 13:28:16','2019-11-09 13:28:16',NULL,NULL),
	(710,'RDHDBANG77','2019-11-09 13:31:41','2019-11-09 13:31:41',NULL,NULL),
	(711,'RDTHANHHA','2019-11-11 09:42:38','2019-11-11 09:42:38',NULL,NULL),
	(712,'RDSGLECUONG','2019-11-11 09:44:07','2019-11-11 09:44:07',NULL,NULL),
	(713,'VCTRAMPH','2019-11-11 09:54:24','2019-11-11 09:54:24',NULL,NULL),
	(714,'VCUDYKHANH','2019-11-11 10:08:30','2019-11-11 10:08:30',NULL,NULL),
	(715,'VCHHONG907','2019-11-11 10:09:22','2019-11-11 10:09:22',NULL,NULL),
	(716,'RDHDDRIVER','2019-11-11 10:42:53','2019-11-11 10:42:53',NULL,NULL),
	(717,'RDHDLHGIANG','2019-11-11 10:43:13','2019-11-11 10:43:13',NULL,NULL),
	(718,'RDHDLEDUONG','2019-11-11 10:45:02','2019-11-11 10:45:02',NULL,NULL),
	(719,'594963209-5','2019-11-11 10:58:10','2019-11-11 10:58:10',NULL,NULL),
	(720,'VCHDMOLY','2019-11-11 10:59:13','2019-11-11 10:59:13',NULL,NULL),
	(721,'HDPHUONG90','2019-11-11 11:21:16','2019-11-11 11:21:16',NULL,NULL),
	(722,'RDHSANH88','2019-11-11 13:56:59','2019-11-11 13:56:59',NULL,NULL),
	(723,'RDKIMANH','2019-11-11 14:27:51','2019-11-11 14:27:51',NULL,NULL),
	(724,'RDHSKIMANH','2019-11-11 14:33:35','2019-11-11 14:33:35',NULL,NULL),
	(725,'RDALONG','2019-11-11 14:39:29','2019-11-11 14:39:29',NULL,NULL),
	(726,'RDDIEUTRAM','2019-11-11 15:35:14','2019-11-11 15:35:14',NULL,NULL),
	(727,'VCCONGSON','2019-11-11 15:39:20','2019-11-11 15:39:20',NULL,NULL),
	(728,'VCHAOMAUDON','2019-11-11 15:39:29','2019-11-11 15:39:29',NULL,NULL),
	(729,'VCLONGNGUYEN','2019-11-11 15:39:38','2019-11-11 15:39:38',NULL,NULL),
	(730,'RDHDLT','2019-11-11 16:26:36','2019-11-11 16:26:36',NULL,NULL),
	(731,'RDHDCHISTOP','2019-11-11 16:27:14','2019-11-11 16:27:14',NULL,NULL),
	(732,'VCNHUNG285','2019-11-12 10:26:25','2019-11-12 10:26:25',NULL,NULL),
	(733,'RDHDMINA','2019-11-12 13:13:57','2019-11-12 13:13:57',NULL,NULL),
	(734,'RĐIEUTRAM','2019-11-12 13:52:45','2019-11-12 13:52:45',NULL,NULL),
	(735,'VCHSMT','2019-11-12 14:02:24','2019-11-12 14:02:24',NULL,NULL),
	(736,'VCSGTVAN','2019-11-12 14:13:07','2019-11-12 14:13:07',NULL,NULL),
	(737,'VCLINHKEO','2019-11-12 14:19:34','2019-11-12 14:19:34',NULL,NULL),
	(738,'RDHDPTVINH','2019-11-12 14:20:05','2019-11-12 14:20:05',NULL,NULL),
	(739,'RDSGKNGAN','2019-11-14 11:50:38','2019-11-14 11:50:38',NULL,NULL),
	(740,'RDHDHAINAM','2019-11-14 12:11:59','2019-11-14 12:11:59',NULL,NULL),
	(741,'RDHDLINH','2019-11-14 12:13:40','2019-11-14 12:13:40',NULL,NULL),
	(742,'RDHDTRANG','2019-11-14 12:16:47','2019-11-14 12:16:47',NULL,NULL),
	(743,'VCHUNGTN','2019-11-14 13:44:55','2019-11-14 13:44:55',NULL,NULL),
	(744,'VCLEHUYEN','2019-11-14 14:44:43','2019-11-14 14:44:43',NULL,NULL),
	(745,'VCTHT977','2019-11-14 14:46:13','2019-11-14 14:46:13',NULL,NULL),
	(746,'VCHSLNLEN','2019-11-14 15:58:47','2019-11-14 15:58:47',NULL,NULL),
	(747,'TH888','2019-11-15 10:53:02','2019-11-15 10:53:02',NULL,NULL),
	(748,'VCTIEN89','2019-11-15 11:58:51','2019-11-15 11:58:51',NULL,NULL),
	(749,'VCPHUGSG','2019-11-15 12:07:15','2019-11-15 12:07:15',NULL,NULL),
	(750,'VCPHUONGHD','2019-11-15 13:10:45','2019-11-15 13:10:45',NULL,NULL),
	(751,'VCANH05','2019-11-15 13:24:34','2019-11-15 13:24:34',NULL,NULL),
	(752,'VCHSDUONGLINH','2019-11-15 13:45:28','2019-11-15 13:45:28',NULL,NULL),
	(753,'VCHSMINHCHI1','2019-11-15 13:54:06','2019-11-15 13:54:06',NULL,NULL),
	(754,'VCHUNGSHUNO','2019-11-15 13:59:10','2019-11-15 13:59:10',NULL,NULL),
	(755,'VCHSPHAMMAI','2019-11-15 14:00:53','2019-11-15 14:00:53',NULL,NULL),
	(756,'VCHOANHUYNH','2019-11-15 14:06:43','2019-11-15 14:06:43',NULL,NULL),
	(757,'RDHSPHAMMAI','2019-11-15 14:08:24','2019-11-15 14:08:24',NULL,NULL),
	(758,'VCHSTUNGNGUYEN','2019-11-15 14:23:57','2019-11-15 14:23:57',NULL,NULL),
	(759,'VCTHUYKSC','2019-11-15 14:41:16','2019-11-15 14:41:16',NULL,NULL),
	(760,'VCPMA','2019-11-15 14:51:37','2019-11-15 14:51:37',NULL,NULL),
	(761,'VCCANH114','2019-11-15 14:53:00','2019-11-15 14:53:00',NULL,NULL),
	(762,'VCHSMT93','2019-11-15 14:53:35','2019-11-15 14:53:35',NULL,NULL),
	(763,'VCHDLEDUNG','2019-11-16 11:06:15','2019-11-16 11:06:15',NULL,NULL),
	(764,'ORHDDRIVE','2019-11-16 11:23:34','2019-11-16 11:23:34',NULL,NULL),
	(765,'ORHDPTVINH','2019-11-16 11:24:28','2019-11-16 11:24:28',NULL,NULL),
	(766,'ORHDGIANG','2019-11-16 11:24:45','2019-11-16 11:24:45',NULL,NULL),
	(767,'ORTN','2019-11-16 11:25:45','2019-11-16 11:25:45',NULL,NULL),
	(768,'RDTRANG','2019-11-16 11:26:08','2019-11-16 11:26:08',NULL,NULL),
	(769,'RDHDGENSHI','2019-11-16 11:32:18','2019-11-16 11:32:18',NULL,NULL),
	(770,'RDHDDRIVE','2019-11-16 11:32:34','2019-11-16 11:32:34',NULL,NULL),
	(771,'RDHDGIANG','2019-11-16 11:34:04','2019-11-16 11:34:04',NULL,NULL),
	(772,'VCTHAONGAN','2019-11-16 13:31:54','2019-11-16 13:31:54',NULL,NULL),
	(773,'RDHDDUNG','2019-11-16 13:33:01','2019-11-16 13:33:01',NULL,NULL),
	(774,'RDSGDAMQUAN','2019-11-16 13:59:24','2019-11-16 13:59:24',NULL,NULL),
	(775,'RDNGTHUY','2019-11-16 14:05:33','2019-11-16 14:05:33',NULL,NULL),
	(776,'RDYENLE','2019-11-16 14:06:29','2019-11-16 14:06:29',NULL,NULL),
	(777,'RDSGFRANK','2019-11-16 14:14:20','2019-11-16 14:14:20',NULL,NULL),
	(778,'VCHSHATHI','2019-11-16 14:40:57','2019-11-16 14:40:57',NULL,NULL),
	(779,'VCANHHAI','2019-11-16 14:45:41','2019-11-16 14:45:41',NULL,NULL),
	(780,'VCHSKHANHBUI','2019-11-16 14:58:49','2019-11-16 14:58:49',NULL,NULL),
	(781,'RDHDTHAONGAN','2019-11-16 15:27:58','2019-11-16 15:27:58',NULL,NULL),
	(782,'VCHDDUNG','2019-11-16 15:31:15','2019-11-16 15:31:15',NULL,NULL),
	(783,'RDHSDUCTAT','2019-11-18 10:59:22','2019-11-18 10:59:22',NULL,NULL),
	(784,'RDHDPHAMLE','2019-11-18 11:15:36','2019-11-18 11:15:36',NULL,NULL),
	(785,'RDHDAN','2019-11-18 11:16:16','2019-11-18 11:16:16',NULL,NULL),
	(786,'VCHANH21','2019-11-18 11:50:04','2019-11-18 11:50:04',NULL,NULL),
	(787,'RDSGTRENG','2019-11-18 13:43:28','2019-11-18 13:43:28',NULL,NULL),
	(788,'VCTUANHANH','2019-11-18 14:23:26','2019-11-18 14:23:26',NULL,NULL),
	(789,'RDHSHUE89','2019-11-18 15:43:00','2019-11-18 15:43:00',NULL,NULL),
	(790,'RDDUNG03','2019-11-18 15:48:28','2019-11-18 15:48:28',NULL,NULL),
	(791,'RDHSKHANHBUI','2019-11-18 15:48:58','2019-11-18 15:48:58',NULL,NULL),
	(792,'RDPHUONGORD','2019-11-18 15:49:55','2019-11-18 15:49:55',NULL,NULL),
	(793,'VCHSCONGSON','2019-11-18 16:00:58','2019-11-18 16:00:58',NULL,NULL),
	(794,'RDSGYENLE','2019-11-18 17:13:42','2019-11-18 17:13:42',NULL,NULL),
	(795,'VCKSC','2019-11-18 17:26:34','2019-11-18 17:26:34',NULL,NULL),
	(796,'VCDUONGNHI','2019-11-18 17:47:32','2019-11-18 17:47:32',NULL,NULL),
	(797,'VCCANH','2019-11-18 20:06:54','2019-11-18 20:06:54',NULL,NULL),
	(798,'VCTHIEN86','2019-11-18 20:26:28','2019-11-18 20:26:28',NULL,NULL),
	(799,'VCHUEHN','2019-11-18 20:35:22','2019-11-18 20:35:22',NULL,NULL),
	(800,'VCTHAO','2019-11-18 22:40:48','2019-11-18 22:40:48',NULL,NULL),
	(801,'VCNGOCHHOA','2019-11-18 22:41:12','2019-11-18 22:41:12',NULL,NULL),
	(802,'VCVANDUONG','2019-11-18 22:43:11','2019-11-18 22:43:11',NULL,NULL),
	(803,'VCNGOVAN','2019-11-18 22:55:50','2019-11-18 22:55:50',NULL,NULL),
	(804,'VCLONG039','2019-11-18 22:57:49','2019-11-18 22:57:49',NULL,NULL),
	(805,'VCHA109','2019-11-18 23:03:40','2019-11-18 23:03:40',NULL,NULL),
	(806,'VCVC7HA','2019-11-18 23:04:05','2019-11-18 23:04:05',NULL,NULL),
	(807,'VCHDHOAN','2019-11-19 10:35:03','2019-11-19 10:35:03',NULL,NULL),
	(808,'RDHDVIETHRM','2019-11-19 10:50:00','2019-11-19 10:50:00',NULL,NULL),
	(809,'VCSAOPHAM','2019-11-19 11:21:40','2019-11-19 11:21:40',NULL,NULL),
	(810,'RDHDNGUYETBS','2019-11-19 13:58:02','2019-11-19 13:58:02',NULL,NULL),
	(811,'rdhdhaiha','2019-11-19 16:37:34','2019-11-19 16:37:34',NULL,NULL),
	(812,'RDHDHAIHAH','2019-11-19 16:37:40','2019-11-19 16:37:40',NULL,NULL),
	(813,'RDHAIHA','2019-11-19 16:38:48','2019-11-19 16:38:48',NULL,NULL),
	(814,'VCPHAMMAI','2019-11-19 18:08:20','2019-11-19 18:08:20',NULL,NULL),
	(815,'VCTRUONGMANH','2019-11-19 18:14:05','2019-11-19 18:14:05',NULL,NULL),
	(816,'RDKCHINH11','2019-11-20 12:28:37','2019-11-20 12:28:37',NULL,NULL),
	(817,'RDHDBSNGUYET','2019-11-20 13:53:45','2019-11-20 13:53:45',NULL,NULL),
	(818,'RDHDMY94','2019-11-20 14:00:11','2019-11-20 14:00:11',NULL,NULL),
	(819,'VCDONGOC','2019-11-20 14:21:44','2019-11-20 14:21:44',NULL,NULL),
	(820,'VC MANHTRUNF','2019-11-20 14:43:36','2019-11-20 14:43:36',NULL,NULL),
	(821,'VCTLN69','2019-11-20 15:10:18','2019-11-20 15:10:18',NULL,NULL),
	(822,'RDANHOA','2019-11-20 15:53:55','2019-11-20 15:53:55',NULL,NULL),
	(823,'VC MANHTRUNG','2019-11-20 15:54:00','2019-11-20 15:54:00',NULL,NULL),
	(824,'RDHSNGANPHAM','2019-11-20 16:01:30','2019-11-20 16:01:30',NULL,NULL),
	(825,'VCNGA75','2019-11-20 16:20:19','2019-11-20 16:20:19',NULL,NULL),
	(826,'VCHAIDANG','2019-11-20 16:24:47','2019-11-20 16:24:47',NULL,NULL),
	(827,'VCMUMY','2019-11-20 16:46:37','2019-11-20 16:46:37',NULL,NULL),
	(828,'VCLI93','2019-11-20 16:59:43','2019-11-20 16:59:43',NULL,NULL),
	(829,'VCNGIATQ','2019-11-20 17:00:12','2019-11-20 17:00:12',NULL,NULL),
	(830,'VCQUNHHN','2019-11-20 17:11:07','2019-11-20 17:11:07',NULL,NULL),
	(831,'VCLANA','2019-11-20 17:22:39','2019-11-20 17:22:39',NULL,NULL),
	(832,'VNHANGHP','2019-11-20 19:15:22','2019-11-20 19:15:22',NULL,NULL),
	(833,'VCHSUYEN','2019-11-21 16:21:37','2019-11-21 16:21:37',NULL,NULL),
	(834,'RDHSMYLE86','2019-11-21 16:25:07','2019-11-21 16:25:07',NULL,NULL),
	(835,'VCSGSANH','2019-11-21 17:37:34','2019-11-21 17:37:34',NULL,NULL),
	(836,'VCHOA','2019-11-21 17:39:19','2019-11-21 17:39:19',NULL,NULL),
	(837,'VCMINHDUC`','2019-11-21 17:43:15','2019-11-21 17:43:15',NULL,NULL),
	(838,'RDHDAHUY','2019-11-21 17:46:08','2019-11-21 17:46:08',NULL,NULL),
	(839,'VCDINHMO','2019-11-21 17:51:18','2019-11-21 17:51:18',NULL,NULL),
	(840,'NB','2019-11-21 20:06:13','2019-11-21 20:06:13',NULL,NULL),
	(841,'RDNBCHUNG','2019-11-22 13:52:45','2019-11-22 13:52:45',NULL,NULL),
	(842,'VCHSCUONGYB','2019-11-22 14:46:54','2019-11-22 14:46:54',NULL,NULL),
	(843,'vchskimanh','2019-11-22 15:18:02','2019-11-22 15:18:02',NULL,NULL),
	(844,'rdhskimanh\\','2019-11-22 15:18:06','2019-11-22 15:18:06',NULL,NULL),
	(845,'VCPHUONGHD4302303603203','2019-11-22 15:57:15','2019-11-22 15:57:15',NULL,NULL),
	(846,'VCHSHIEN','2019-11-22 16:24:25','2019-11-22 16:24:25',NULL,NULL),
	(847,'VCLONG309','2019-11-22 16:46:12','2019-11-22 16:46:12',NULL,NULL),
	(848,'VCCUONGYB','2019-11-22 16:47:39','2019-11-22 16:47:39',NULL,NULL),
	(849,'VCHOACM','2019-11-23 14:27:11','2019-11-23 14:27:11',NULL,NULL),
	(850,'VCHDTAM','2019-11-23 15:55:20','2019-11-23 15:55:20',NULL,NULL),
	(851,'VCSHASHI','2019-11-23 15:56:58','2019-11-23 15:56:58',NULL,NULL),
	(852,'RDHDAINAM','2019-11-23 16:09:11','2019-11-23 16:09:11',NULL,NULL),
	(853,'RĐUCTAT','2019-11-23 16:26:50','2019-11-23 16:26:50',NULL,NULL),
	(854,'RDSGTRANGNG','2019-11-23 16:31:20','2019-11-23 16:31:20',NULL,NULL),
	(855,'RDHDNGKHAI','2019-11-23 16:41:14','2019-11-23 16:41:14',NULL,NULL),
	(856,'VCHIEN','2019-11-23 16:43:55','2019-11-23 16:43:55',NULL,NULL),
	(857,'RDHDNBCHUNG','2019-11-23 16:44:02','2019-11-23 16:44:02',NULL,NULL),
	(858,'RDHDTONGBINH','2019-11-23 16:45:04','2019-11-23 16:45:04',NULL,NULL),
	(859,'RDHSHOAINAM','2019-11-23 17:19:20','2019-11-23 17:19:20',NULL,NULL),
	(860,'VCCTY','2019-11-24 15:54:02','2019-11-24 15:54:02',NULL,NULL),
	(861,'VCNGANGUYEN','2019-11-24 16:08:04','2019-11-24 16:08:04',NULL,NULL),
	(862,'VCLY93','2019-11-24 16:15:01','2019-11-24 16:15:01',NULL,NULL),
	(863,'VCLT93','2019-11-24 16:15:08','2019-11-24 16:15:08',NULL,NULL),
	(864,'VCHDAHUY','2019-11-25 11:30:24','2019-11-25 11:30:24',NULL,NULL),
	(865,'VCTRINH982','2019-11-25 13:55:51','2019-11-25 13:55:51',NULL,NULL),
	(866,'RDHAU97','2019-11-25 14:15:27','2019-11-25 14:15:27',NULL,NULL),
	(867,'RDLUVMICHI','2019-11-25 15:02:22','2019-11-25 15:02:22',NULL,NULL),
	(868,'SGDUNGNG','2019-11-25 16:30:50','2019-11-25 16:30:50',NULL,NULL),
	(869,'VCLAPHUONG','2019-11-25 17:19:02','2019-11-25 17:19:02',NULL,NULL),
	(870,'VCTAM','2019-11-25 17:21:42','2019-11-25 17:21:42',NULL,NULL),
	(871,'RDSGVI','2019-11-26 11:49:59','2019-11-26 11:49:59',NULL,NULL),
	(872,'RDHDLUVMICHI','2019-11-26 13:06:13','2019-11-26 13:06:13',NULL,NULL),
	(873,'RDHDLETUAN','2019-11-26 13:11:41','2019-11-26 13:11:41',NULL,NULL),
	(874,'VCLUVMICHI','2019-11-26 14:01:27','2019-11-26 14:01:27',NULL,NULL),
	(875,'VCSGAR','2019-11-26 14:11:39','2019-11-26 14:11:39',NULL,NULL),
	(876,'VCSAM','2019-11-26 14:14:44','2019-11-26 14:14:44',NULL,NULL),
	(877,'VCNTD','2019-11-26 14:16:10','2019-11-26 14:16:10',NULL,NULL),
	(878,'RDHDMIENBG','2019-11-26 14:21:05','2019-11-26 14:21:05',NULL,NULL),
	(879,'RDHOAMON','2019-11-26 15:23:36','2019-11-26 15:23:36',NULL,NULL),
	(880,'VCBDHOAN','2019-11-26 16:09:09','2019-11-26 16:09:09',NULL,NULL),
	(881,'VCLAN','2019-11-27 11:05:59','2019-11-27 11:05:59',NULL,NULL),
	(882,'RDTRUONGPHAN','2019-11-27 14:05:44','2019-11-27 14:05:44',NULL,NULL),
	(883,'RDSGBAOCHAU','2019-11-27 14:17:25','2019-11-27 14:17:25',NULL,NULL),
	(884,'VCKATY','2019-11-27 14:52:24','2019-11-27 14:52:24',NULL,NULL),
	(885,'HS test','2019-11-28 13:38:51','2019-11-28 13:38:51',NULL,NULL),
	(886,'RDAMINH','2019-11-28 14:06:04','2019-11-28 14:06:04',NULL,NULL),
	(887,'VCTHHIEN876','2019-11-28 14:59:13','2019-11-28 14:59:13',NULL,NULL),
	(888,'ATHANG','2019-11-28 16:08:24','2019-11-28 16:08:24',NULL,NULL),
	(889,'RDHDHOAMON','2019-11-29 09:17:44','2019-11-29 09:17:44',NULL,NULL),
	(890,'VCHDDINHMO','2019-11-29 10:40:02','2019-11-29 10:40:02',NULL,NULL),
	(891,'VCHANHGHP','2019-11-29 11:39:43','2019-11-29 11:39:43',NULL,NULL),
	(892,'VCDIEN09','2019-11-29 11:49:16','2019-11-29 11:49:16',NULL,NULL),
	(893,'RDMINH11','2019-11-29 12:03:35','2019-11-29 12:03:35',NULL,NULL),
	(894,'VCHDSHASHI','2019-11-29 12:40:15','2019-11-29 12:40:15',NULL,NULL),
	(895,'VCHSPAA915','2019-11-29 14:28:42','2019-11-29 14:28:42',NULL,NULL),
	(896,'RDHSLIENNGOC','2019-11-29 14:33:29','2019-11-29 14:33:29',NULL,NULL),
	(897,'VCSGANH75315126783276','2019-11-29 15:23:50','2019-11-29 15:23:50',NULL,NULL),
	(898,'VCKATY87','2019-11-30 12:02:39','2019-11-30 12:02:39',NULL,NULL),
	(899,'VCSAMIRA','2019-11-30 12:04:24','2019-11-30 12:04:24',NULL,NULL),
	(900,'rdsgdang','2019-12-02 09:17:21','2019-12-02 09:17:21',NULL,NULL),
	(901,'VCTBTHANG','2019-12-02 10:55:01','2019-12-02 10:55:01',NULL,NULL),
	(902,'RDHDNGOCLAN','2019-12-02 11:06:20','2019-12-02 11:06:20',NULL,NULL),
	(903,'VCHSPM111','2019-12-02 12:53:25','2019-12-02 12:53:25',NULL,NULL),
	(904,'VCTBHANG145','2019-12-02 14:02:00','2019-12-02 14:02:00',NULL,NULL),
	(905,'VCDUCHANH','2019-12-02 14:12:43','2019-12-02 14:12:43',NULL,NULL),
	(906,'VCDIEMKIEU','2019-12-02 14:19:53','2019-12-02 14:19:53',NULL,NULL),
	(907,'VCHSHUEHAN','2019-12-02 16:28:24','2019-12-02 16:28:24',NULL,NULL),
	(908,'RDAN69','2019-12-02 16:44:51','2019-12-02 16:44:51',NULL,NULL),
	(909,'RDTHUYDL','2019-12-02 16:47:54','2019-12-02 16:47:54',NULL,NULL),
	(910,'VCHUNGSG','2019-12-02 18:02:58','2019-12-02 18:02:58',NULL,NULL),
	(911,'VCKHOAITAY','2019-12-02 18:06:42','2019-12-02 18:06:42',NULL,NULL),
	(912,'VCLONG029','2019-12-02 18:08:46','2019-12-02 18:08:46',NULL,NULL),
	(913,'VCTRAM003','2019-12-02 18:27:20','2019-12-02 18:27:20',NULL,NULL),
	(914,'VCTRAM033','2019-12-02 19:50:46','2019-12-02 19:50:46',NULL,NULL),
	(915,'RDSDDUONG','2019-12-03 13:52:47','2019-12-03 13:52:47',NULL,NULL),
	(916,'VCTANGHUY776','2019-12-03 13:55:13','2019-12-03 13:55:13',NULL,NULL),
	(917,'VCNAMQUOC','2019-12-03 14:04:15','2019-12-03 14:04:15',NULL,NULL),
	(918,'VCHOANGLAN','2019-12-03 14:11:48','2019-12-03 14:11:48',NULL,NULL),
	(919,'VCPHAMHUONG','2019-12-04 14:26:16','2019-12-04 14:26:16',NULL,NULL),
	(920,'RDHDCONGTUAN','2019-12-04 14:36:26','2019-12-04 14:36:26',NULL,NULL),
	(921,'VCNHAMKHO','2019-12-04 16:07:37','2019-12-04 16:07:37',NULL,NULL),
	(922,'RDPHANHOANG','2019-12-05 12:59:14','2019-12-05 12:59:14',NULL,NULL),
	(923,'VCSGVIOLA','2019-12-05 13:39:28','2019-12-05 13:39:28',NULL,NULL),
	(924,'RDHSMINHTRAN','2019-12-05 13:40:08','2019-12-05 13:40:08',NULL,NULL),
	(925,'RETRENG','2019-12-06 11:51:00','2019-12-06 11:51:00',NULL,NULL),
	(926,'VCHANHP','2019-12-06 15:07:15','2019-12-06 15:07:15',NULL,NULL),
	(927,'VCHDCHUC','2019-12-06 15:51:20','2019-12-06 15:51:20',NULL,NULL),
	(928,'VCGEM','2019-12-06 15:52:34','2019-12-06 15:52:34',NULL,NULL),
	(929,'VCKHAI30','2019-12-07 14:26:55','2019-12-07 14:26:55',NULL,NULL),
	(930,'VCTIFFANI','2019-12-07 14:29:57','2019-12-07 14:29:57',NULL,NULL),
	(931,'VCHDTHAO92','2019-12-07 14:45:32','2019-12-07 14:45:32',NULL,NULL),
	(932,'RDSGTUONGVAN','2019-12-09 09:09:13','2019-12-09 09:09:13',NULL,NULL),
	(933,'RDSGDIEUTRAM','2019-12-09 09:09:32','2019-12-09 09:09:32',NULL,NULL),
	(934,'RDSGNGOCTHAO','2019-12-09 09:10:50','2019-12-09 09:10:50',NULL,NULL),
	(935,'VCHDGEM','2019-12-09 10:13:33','2019-12-09 10:13:33',NULL,NULL),
	(936,'RDHDVIETANH','2019-12-09 10:39:37','2019-12-09 10:39:37',NULL,NULL),
	(937,'RDHDGIANG88','2019-12-09 10:40:11','2019-12-09 10:40:11',NULL,NULL),
	(938,'RDPHAMHUONG','2019-12-10 13:55:42','2019-12-10 13:55:42',NULL,NULL),
	(939,'VCTHUKG','2019-12-10 14:24:03','2019-12-10 14:24:03',NULL,NULL),
	(940,'RDHDMYHANH','2019-12-10 14:58:04','2019-12-10 14:58:04',NULL,NULL),
	(941,'RDHDHDLINH','2019-12-10 14:59:58','2019-12-10 14:59:58',NULL,NULL),
	(942,'VCPTL92','2019-12-10 16:11:11','2019-12-10 16:11:11',NULL,NULL),
	(943,'VCACONG','2019-12-10 17:44:23','2019-12-10 17:44:23',NULL,NULL),
	(944,'RDHDTLINH','2019-12-11 11:21:59','2019-12-11 11:21:59',NULL,NULL),
	(945,'RDSGDOLY','2019-12-11 13:42:07','2019-12-11 13:42:07',NULL,NULL),
	(946,'VCMNH567','2019-12-11 15:42:25','2019-12-11 15:42:25',NULL,NULL),
	(947,'RDHDBICHGEM','2019-12-12 14:25:18','2019-12-12 14:25:18',NULL,NULL),
	(948,'VCTHU129','2019-12-12 14:26:38','2019-12-12 14:26:38',NULL,NULL),
	(949,'RDLEHIEU','2019-12-12 14:27:43','2019-12-12 14:27:43',NULL,NULL),
	(950,'RDHDDUONGNHI','2019-12-12 15:34:05','2019-12-12 15:34:05',NULL,NULL),
	(951,'VCNHUNGPHAM','2019-12-12 16:09:11','2019-12-12 16:09:11',NULL,NULL),
	(952,'VCDNB','2019-12-13 15:00:53','2019-12-13 15:00:53',NULL,NULL),
	(953,'VCHBHUY','2019-12-13 15:46:01','2019-12-13 15:46:01',NULL,NULL),
	(954,'VCHSUYEN230','2019-12-16 11:04:18','2019-12-16 11:04:18',NULL,NULL),
	(955,'RDHSVPNGOC','2019-12-16 11:11:51','2019-12-16 11:11:51',NULL,NULL),
	(956,'VCHOA47','2019-12-16 13:41:26','2019-12-16 13:41:26',NULL,NULL),
	(957,'VCPINSTORE','2019-12-16 13:50:18','2019-12-16 13:50:18',NULL,NULL),
	(958,'RDSGNGOC','2019-12-16 14:59:14','2019-12-16 14:59:14',NULL,NULL),
	(959,'RDGUNG03','2019-12-16 15:03:10','2019-12-16 15:03:10',NULL,NULL),
	(960,'HDPI','2019-12-16 15:44:47','2019-12-16 15:44:47',NULL,NULL),
	(961,'VCTBHANG','2019-12-16 16:10:23','2019-12-16 16:10:23',NULL,NULL),
	(962,'VCKIEUANHTQ','2019-12-16 16:19:52','2019-12-16 16:19:52',NULL,NULL),
	(963,'VCVCBERRYPHAM','2019-12-16 16:21:58','2019-12-16 16:21:58',NULL,NULL),
	(964,'VCTVTHANG','2019-12-16 16:30:29','2019-12-16 16:30:29',NULL,NULL),
	(965,'VCCONGTRIEU','2019-12-16 16:48:05','2019-12-16 16:48:05',NULL,NULL),
	(966,'VCLENGOCJ','2019-12-16 17:15:25','2019-12-16 17:15:25',NULL,NULL),
	(967,'VCLTMH','2019-12-16 17:18:31','2019-12-16 17:18:31',NULL,NULL),
	(968,'VCLOAN63','2019-12-16 22:10:43','2019-12-16 22:10:43',NULL,NULL),
	(969,'VCHSHAIDOAN','2019-12-17 11:30:03','2019-12-17 11:30:03',NULL,NULL),
	(970,'VCNINH98','2019-12-17 12:43:16','2019-12-17 12:43:16',NULL,NULL),
	(971,'RDTHANHTU','2019-12-17 16:23:46','2019-12-17 16:23:46',NULL,NULL),
	(972,'RDTUANNC','2019-12-17 16:25:02','2019-12-17 16:25:02',NULL,NULL),
	(973,'RDPHUONG99','2019-12-17 16:30:50','2019-12-17 16:30:50',NULL,NULL),
	(974,'VCPHUNBGLY','2019-12-17 17:46:42','2019-12-17 17:46:42',NULL,NULL),
	(975,'VCVANANH','2019-12-17 17:53:26','2019-12-17 17:53:26',NULL,NULL),
	(976,'RDHDLEHOA','2019-12-17 17:56:25','2019-12-17 17:56:25',NULL,NULL),
	(977,'RDHUONG99','2019-12-18 15:40:09','2019-12-18 15:40:09',NULL,NULL),
	(978,'RDHOATHUONG','2019-12-18 15:41:58','2019-12-18 15:41:58',NULL,NULL),
	(979,'VCCHU15','2019-12-18 16:32:09','2019-12-18 16:32:09',NULL,NULL),
	(980,'VCNHUYEN10','2019-12-18 16:34:49','2019-12-18 16:34:49',NULL,NULL),
	(981,'VCHDMINHCHI','2019-12-18 17:06:36','2019-12-18 17:06:36',NULL,NULL),
	(982,'VCLAPGUONG','2019-12-18 17:49:46','2019-12-18 17:49:46',NULL,NULL),
	(983,'RDHDTUANTRAN','2019-12-18 17:56:15','2019-12-18 17:56:15',NULL,NULL),
	(984,'RDHOANGTHUONG','2019-12-19 09:52:17','2019-12-19 09:52:17',NULL,NULL),
	(985,'SGTVAN','2019-12-19 13:47:06','2019-12-19 13:47:06',NULL,NULL),
	(986,'RDLINH95','2019-12-19 13:59:44','2019-12-19 13:59:44',NULL,NULL),
	(987,'VCHDKHOAITAY','2019-12-19 14:31:45','2019-12-19 14:31:45',NULL,NULL),
	(988,'VCQ12','2019-12-19 14:44:22','2019-12-19 14:44:22',NULL,NULL),
	(989,'VCHHOAMAUDON','2019-12-19 15:03:52','2019-12-19 15:03:52',NULL,NULL),
	(990,'VCHUONDAO','2019-12-19 15:22:42','2019-12-19 15:22:42',NULL,NULL),
	(991,'VCTHUTRA94','2019-12-19 15:42:33','2019-12-19 15:42:33',NULL,NULL),
	(992,'KHẠCHHADONG','2019-12-19 16:58:01','2019-12-19 16:58:01',NULL,NULL),
	(993,'RDTRANHANG','2019-12-20 14:47:08','2019-12-20 14:47:08',NULL,NULL),
	(994,'VCHSDONGANH','2019-12-20 14:51:20','2019-12-20 14:51:20',NULL,NULL),
	(995,'VCHSNHUNGPHAM','2019-12-20 15:00:04','2019-12-20 15:00:04',NULL,NULL),
	(996,'HIENHN','2019-12-20 16:57:33','2019-12-20 16:57:33',NULL,NULL),
	(997,'RDLYBON99','2019-12-21 14:00:57','2019-12-21 14:00:57',NULL,NULL),
	(998,'RDLYTRANHANG','2019-12-21 14:01:18','2019-12-21 14:01:18',NULL,NULL),
	(999,'RDLYPLINH1901','2019-12-21 14:01:37','2019-12-21 14:01:37',NULL,NULL),
	(1000,'RDLYNGANBE','2019-12-21 14:01:54','2019-12-21 14:01:54',NULL,NULL),
	(1001,'RDLYTUANANH','2019-12-21 14:15:01','2019-12-21 14:15:01',NULL,NULL),
	(1002,'VCHONGANH','2019-12-22 11:00:04','2019-12-22 11:00:04',NULL,NULL),
	(1003,'RDLYSAOMAI','2019-12-22 14:49:00','2019-12-22 14:49:00',NULL,NULL),
	(1004,'RDLYTHANHTHU','2019-12-22 14:50:01','2019-12-22 14:50:01',NULL,NULL),
	(1005,'RDLYHIEPKUN','2019-12-22 14:50:58','2019-12-22 14:50:58',NULL,NULL),
	(1006,'RDLYPHUONGORD','2019-12-22 14:51:39','2019-12-22 14:51:39',NULL,NULL),
	(1007,'RDLYNGQUYNH','2019-12-22 14:53:00','2019-12-22 14:53:00',NULL,NULL),
	(1008,'RDLYDUNG03','2019-12-22 14:54:51','2019-12-22 14:54:51',NULL,NULL),
	(1009,'RDLYNGOC98','2019-12-22 14:55:28','2019-12-22 14:55:28',NULL,NULL),
	(1010,'RDLYTHANG89','2019-12-22 14:55:43','2019-12-22 14:55:43',NULL,NULL),
	(1011,'RDLYTHU129','2019-12-22 14:56:03','2019-12-22 14:56:03',NULL,NULL),
	(1012,'RDLYMPHUONG','2019-12-22 14:58:56','2019-12-22 14:58:56',NULL,NULL),
	(1013,'RDLYUYEN229','2019-12-22 14:59:17','2019-12-22 14:59:17',NULL,NULL),
	(1014,'RDLYTUANVU','2019-12-22 15:02:25','2019-12-22 15:02:25',NULL,NULL),
	(1015,'RDLYMIMI','2019-12-22 15:05:39','2019-12-22 15:05:39',NULL,NULL),
	(1016,'VCTIFANI','2019-12-22 15:45:35','2019-12-22 15:45:35',NULL,NULL),
	(1017,'VCTTN24','2019-12-22 15:59:05','2019-12-22 15:59:05',NULL,NULL),
	(1018,'VCHSVPNGOC','2019-12-23 15:06:21','2019-12-23 15:06:21',NULL,NULL),
	(1019,'RDLYBADO','2019-12-23 15:44:42','2019-12-23 15:44:42',NULL,NULL),
	(1020,'RDLYPHANHOANG','2019-12-23 15:46:27','2019-12-23 15:46:27',NULL,NULL),
	(1021,'RDLYVANH','2019-12-23 15:46:49','2019-12-23 15:46:49',NULL,NULL),
	(1022,'RDLYQUANGHE','2019-12-23 15:49:41','2019-12-23 15:49:41',NULL,NULL),
	(1023,'RDLYTRUNG85','2019-12-23 15:51:04','2019-12-23 15:51:04',NULL,NULL),
	(1024,'VCPHAN98','2019-12-23 16:24:20','2019-12-23 16:24:20',NULL,NULL),
	(1025,'VCDUONGCUU','2019-12-23 16:43:59','2019-12-23 16:43:59',NULL,NULL),
	(1026,'VCTHUYVAN','2019-12-23 16:49:24','2019-12-23 16:49:24',NULL,NULL),
	(1027,'RDYPLINH1901','2019-12-23 17:23:35','2019-12-23 17:23:35',NULL,NULL),
	(1028,'VCSGTRAM003','2019-12-24 15:00:48','2019-12-24 15:00:48',NULL,NULL),
	(1029,'RDSGNMD','2019-12-24 15:04:40','2019-12-24 15:04:40',NULL,NULL),
	(1030,'VCVYVVY','2019-12-24 15:28:50','2019-12-24 15:28:50',NULL,NULL),
	(1031,'RDLYDUCTAT','2019-12-24 15:47:43','2019-12-24 15:47:43',NULL,NULL),
	(1032,'RDLYNVHA88','2019-12-24 16:00:42','2019-12-24 16:00:42',NULL,NULL),
	(1033,'RDLYTRENG','2019-12-24 16:10:12','2019-12-24 16:10:12',NULL,NULL),
	(1034,'VCLACOSTE','2019-12-25 13:42:43','2019-12-25 13:42:43',NULL,NULL),
	(1035,'VCTH88','2019-12-25 16:42:11','2019-12-25 16:42:11',NULL,NULL),
	(1036,'VCHANH201','2019-12-25 17:05:53','2019-12-25 17:05:53',NULL,NULL),
	(1037,'RDLYTHUYDN','2019-12-25 17:32:40','2019-12-25 17:32:40',NULL,NULL),
	(1038,'RDLYNVH88','2019-12-25 17:38:34','2019-12-25 17:38:34',NULL,NULL),
	(1039,'RDLYLYNHTRAN','2019-12-25 17:38:55','2019-12-25 17:38:55',NULL,NULL),
	(1040,'RDLYDUCCO','2019-12-25 17:39:52','2019-12-25 17:39:52',NULL,NULL),
	(1041,'VCHUCHANH','2019-12-25 18:40:03','2019-12-25 18:40:03',NULL,NULL),
	(1042,'6028340452','2019-12-26 10:44:41','2019-12-26 10:44:41',NULL,NULL),
	(1043,'VCHSMINHTTP','2019-12-26 10:54:52','2019-12-26 10:54:52',NULL,NULL),
	(1044,'VCHSMR','2019-12-26 17:01:11','2019-12-26 17:01:11',NULL,NULL),
	(1045,'VCHSK65','2019-12-26 17:06:22','2019-12-26 17:06:22',NULL,NULL),
	(1046,'RDLYLTTRANG','2019-12-26 17:09:46','2019-12-26 17:09:46',NULL,NULL),
	(1047,'VCLYTRUNG85','2019-12-26 17:15:25','2019-12-26 17:15:25',NULL,NULL),
	(1048,'VCVISA','2019-12-26 17:58:39','2019-12-26 17:58:39',NULL,NULL),
	(1049,'VCMOLYHDKT','2019-12-27 09:20:27','2019-12-27 09:20:27',NULL,NULL),
	(1050,'RDLYVUTRAN','2019-12-27 09:24:39','2019-12-27 09:24:39',NULL,NULL),
	(1051,'VCPHUONG73','2019-12-27 14:21:23','2019-12-27 14:21:23',NULL,NULL),
	(1052,'VCAQ98','2019-12-27 14:21:49','2019-12-27 14:21:49',NULL,NULL),
	(1053,'VCLHTHU95YT9086586047595','2019-12-27 14:28:03','2019-12-27 14:28:03',NULL,NULL),
	(1054,'VCAN77','2019-12-27 14:44:08','2019-12-27 14:44:08',NULL,NULL),
	(1055,'VCHDNTD','2019-12-27 14:57:12','2019-12-27 14:57:12',NULL,NULL),
	(1056,'RDLYTUANNC','2019-12-27 15:10:31','2019-12-27 15:10:31',NULL,NULL),
	(1057,'RDLYTRONGTOAN','2019-12-27 15:14:48','2019-12-27 15:14:48',NULL,NULL),
	(1058,'RDLYVUTUYET','2019-12-27 15:15:33','2019-12-27 15:15:33',NULL,NULL),
	(1059,'RDHSMINHTU','2019-12-27 15:46:54','2019-12-27 15:46:54',NULL,NULL),
	(1060,'VCHDLEHOA','2019-12-27 15:52:52','2019-12-27 15:52:52',NULL,NULL),
	(1061,'VCLEHOA86','2019-12-28 13:41:41','2019-12-28 13:41:41',NULL,NULL),
	(1062,'RDSGLOLY','2019-12-28 15:44:15','2019-12-28 15:44:15',NULL,NULL),
	(1063,'RDLYNTN','2019-12-28 15:55:53','2019-12-28 15:55:53',NULL,NULL),
	(1064,'RDLYUYEN229`','2019-12-28 15:57:09','2019-12-28 15:57:09',NULL,NULL),
	(1065,'RDLYVUTUYEN','2019-12-28 16:15:02','2019-12-28 16:15:02',NULL,NULL),
	(1066,'RDLYGIANGLUU','2019-12-28 16:15:30','2019-12-28 16:15:30',NULL,NULL),
	(1067,'VCHUYENTRANG','2019-12-29 13:28:26','2019-12-29 13:28:26',NULL,NULL),
	(1068,'RDHSFANGHOANG','2019-12-30 11:42:20','2019-12-30 11:42:20',NULL,NULL),
	(1069,'VCHSLACLAC','2019-12-30 11:46:13','2019-12-30 11:46:13',NULL,NULL),
	(1070,'RDLYGIANGNGUYEN','2019-12-30 11:55:29','2019-12-30 11:55:29',NULL,NULL),
	(1071,'RDLYTHAODAT','2019-12-30 11:55:50','2019-12-30 11:55:50',NULL,NULL),
	(1072,'RDHDTRUONG','2019-12-30 12:21:08','2019-12-30 12:21:08',NULL,NULL),
	(1073,'VCEMNGAN','2019-12-30 12:22:16','2019-12-30 12:22:16',NULL,NULL),
	(1074,'VCANHTRUNG','2019-12-30 12:25:59','2019-12-30 12:25:59',NULL,NULL),
	(1075,'VCHIEU','2019-12-30 12:27:22','2019-12-30 12:27:22',NULL,NULL),
	(1076,'RDLYUYEN229\\','2019-12-30 13:52:48','2019-12-30 13:52:48',NULL,NULL),
	(1077,'RDSGHOAIYT4309719','2019-12-30 14:48:44','2019-12-30 14:48:44',NULL,NULL),
	(1078,'RDLYNTL','2019-12-30 15:52:16','2019-12-30 15:52:16',NULL,NULL),
	(1079,'KTHS','2019-12-30 16:04:14','2019-12-30 16:04:14',NULL,NULL),
	(1080,'RDLYTRANG','2019-12-31 11:36:35','2019-12-31 11:36:35',NULL,NULL),
	(1081,'RDLYMANH','2019-12-31 11:42:20','2019-12-31 11:42:20',NULL,NULL),
	(1082,'VCHALE','2019-12-31 12:03:20','2019-12-31 12:03:20',NULL,NULL),
	(1083,'VCHNG','2019-12-31 12:07:11','2019-12-31 12:07:11',NULL,NULL),
	(1084,'A LONG','2019-12-31 13:13:55','2019-12-31 13:13:55',NULL,NULL),
	(1085,'VCLEHOA','2019-12-31 13:16:53','2019-12-31 13:16:53',NULL,NULL),
	(1086,'VCMOLEY','2019-12-31 15:17:08','2019-12-31 15:17:08',NULL,NULL),
	(1087,'RDHDCUONGYB','2019-12-31 15:35:06','2019-12-31 15:35:06',NULL,NULL),
	(1088,'RDHSMANH','2019-12-31 16:27:43','2019-12-31 16:27:43',NULL,NULL),
	(1089,'hskt - > LY','2020-01-02 10:59:05','2020-01-02 10:59:05',NULL,NULL),
	(1090,'RDLYTHANHHA','2020-01-02 11:07:42','2020-01-02 11:07:42',NULL,NULL),
	(1091,'RDLYMINH11','2020-01-02 11:10:38','2020-01-02 11:10:38',NULL,NULL),
	(1092,'VCH50','2020-01-02 11:35:26','2020-01-02 11:35:26',NULL,NULL),
	(1093,'RDHDLECUONG','2020-01-02 12:02:40','2020-01-02 12:02:40',NULL,NULL),
	(1094,'VCDUYCUONG','2020-01-02 12:09:29','2020-01-02 12:09:29',NULL,NULL),
	(1095,'VCANH87','2020-01-02 12:11:27','2020-01-02 12:11:27',NULL,NULL),
	(1096,'VCHSUYENMIU','2020-01-02 13:37:58','2020-01-02 13:37:58',NULL,NULL),
	(1097,'ss1070840802823-2.2','2020-01-02 15:39:59','2020-01-02 15:39:59',NULL,NULL),
	(1098,'HSCANH142','2020-01-03 11:15:41','2020-01-03 11:15:41',NULL,NULL),
	(1099,'NHAMKHO','2020-01-03 13:59:54','2020-01-03 13:59:54',NULL,NULL),
	(1100,'RDLYKCHINH11','2020-01-03 15:30:20','2020-01-03 15:30:20',NULL,NULL),
	(1101,'RDLYANHHOA','2020-01-03 15:31:00','2020-01-03 15:31:00',NULL,NULL),
	(1102,'RDLYNGOCMAUVE','2020-01-03 15:33:08','2020-01-03 15:33:08',NULL,NULL),
	(1103,'RDLYTRANGHP','2020-01-03 15:34:40','2020-01-03 15:34:40',NULL,NULL),
	(1104,'RDLYCUONGLB','2020-01-03 15:35:51','2020-01-03 15:35:51',NULL,NULL),
	(1105,'VCHUNG','2020-01-03 15:57:33','2020-01-03 15:57:33',NULL,NULL),
	(1106,'VCMINHHN','2020-01-03 16:18:40','2020-01-03 16:18:40',NULL,NULL),
	(1107,'VCHSNGOCDUNG','2020-01-03 16:54:28','2020-01-03 16:54:28',NULL,NULL),
	(1108,'VCHST98','2020-01-03 17:03:13','2020-01-03 17:03:13',NULL,NULL),
	(1109,'VCHĐUCHANH','2020-01-03 17:06:13','2020-01-03 17:06:13',NULL,NULL),
	(1110,'VCHSNDUNG','2020-01-03 17:08:52','2020-01-03 17:08:52',NULL,NULL),
	(1111,'VCHSPA91','2020-01-03 17:10:53','2020-01-03 17:10:53',NULL,NULL),
	(1112,'VCHDMAITPT','2020-01-03 17:13:26','2020-01-03 17:13:26',NULL,NULL),
	(1113,'VCHDHUNG284','2020-01-03 17:19:14','2020-01-03 17:19:14',NULL,NULL),
	(1114,'CVHDQ12','2020-01-03 17:27:45','2020-01-03 17:27:45',NULL,NULL),
	(1115,'VCHDUCHANH','2020-01-06 16:24:35','2020-01-06 16:24:35',NULL,NULL),
	(1116,'RDLYTUYETNHUNG','2020-01-07 14:13:23','2020-01-07 14:13:23',NULL,NULL),
	(1117,'RDLYVTT','2020-01-07 14:14:23','2020-01-07 14:14:23',NULL,NULL),
	(1118,'RDLYTODUNG','2020-01-07 14:29:56','2020-01-07 14:29:56',NULL,NULL),
	(1119,'RDLYPTHOA','2020-01-07 14:31:38','2020-01-07 14:31:38',NULL,NULL),
	(1120,'RDLYTOANSHIP','2020-01-07 14:32:52','2020-01-07 14:32:52',NULL,NULL),
	(1121,'RDLYDOLY','2020-01-07 14:40:30','2020-01-07 14:40:30',NULL,NULL),
	(1122,'VCYEN93','2020-01-07 15:47:26','2020-01-07 15:47:26',NULL,NULL),
	(1123,'RDHDLYHA','2020-01-07 16:06:26','2020-01-07 16:06:26',NULL,NULL),
	(1124,'VCCHILE','2020-01-07 16:39:27','2020-01-07 16:39:27',NULL,NULL),
	(1125,'VCMANH290','2020-01-07 16:46:56','2020-01-07 16:46:56',NULL,NULL),
	(1126,'RDSGTHAIAN','2020-01-08 21:03:47','2020-01-08 21:03:47',NULL,NULL),
	(1127,'RDLYKNGAN95','2020-01-08 21:29:49','2020-01-08 21:29:49',NULL,NULL),
	(1128,'RDLYTRUNGHIEU','2020-01-08 21:33:10','2020-01-08 21:33:10',NULL,NULL),
	(1129,'RDLYHUONG99','2020-01-08 21:36:24','2020-01-08 21:36:24',NULL,NULL),
	(1130,'RDLYCAOMINH','2020-01-08 21:36:42','2020-01-08 21:36:42',NULL,NULL),
	(1131,'RDLYKCHINH','2020-01-08 21:42:02','2020-01-08 21:42:02',NULL,NULL),
	(1132,'VCVIETTANH','2020-01-08 22:07:14','2020-01-08 22:07:14',NULL,NULL),
	(1133,'VCSGYOYO','2020-01-08 22:16:03','2020-01-08 22:16:03',NULL,NULL),
	(1134,'VCNTGIANG','2020-01-08 22:30:21','2020-01-08 22:30:21',NULL,NULL),
	(1135,'VCHIENHN','2020-01-09 00:17:48','2020-01-09 00:17:48',NULL,NULL),
	(1136,'VCCHITHUHN','2020-01-09 00:20:42','2020-01-09 00:20:42',NULL,NULL),
	(1137,'VCANHPHUCHCM','2020-01-09 00:21:09','2020-01-09 00:21:09',NULL,NULL),
	(1138,'RDLYGIANGLY','2020-01-09 09:40:06','2020-01-09 09:40:06',NULL,NULL),
	(1139,'VCXUANHUY','2020-01-09 09:41:43','2020-01-09 09:41:43',NULL,NULL),
	(1140,'VCVCHDNTDNTD','2020-01-09 10:13:36','2020-01-09 10:13:36',NULL,NULL),
	(1141,'NOIBO','2020-01-09 10:31:57','2020-01-09 10:31:57',NULL,NULL),
	(1142,'VCNVDUNG','2020-01-09 11:30:28','2020-01-09 11:30:28',NULL,NULL),
	(1143,'RDHDPHUCVAN','2020-01-09 11:44:33','2020-01-09 11:44:33',NULL,NULL),
	(1144,'RDHDLINHHOAN','2020-01-09 11:46:33','2020-01-09 11:46:33',NULL,NULL),
	(1145,'RDHDQUYNVU','2020-01-09 11:47:28','2020-01-09 11:47:28',NULL,NULL),
	(1146,'RDHDHUYTHANG','2020-01-09 11:47:52','2020-01-09 11:47:52',NULL,NULL),
	(1147,'RDHDQUYNHVU','2020-01-09 11:48:09','2020-01-09 11:48:09',NULL,NULL),
	(1148,'VCHSCANH142','2020-01-09 13:12:11','2020-01-09 13:12:11',NULL,NULL),
	(1149,'VCHSTT9293','2020-01-09 13:12:38','2020-01-09 13:12:38',NULL,NULL),
	(1150,'VCMANH','2020-01-09 16:08:51','2020-01-09 16:08:51',NULL,NULL),
	(1151,'VCKOT93','2020-01-09 16:19:10','2020-01-09 16:19:10',NULL,NULL),
	(1152,'VCHDTND','2020-01-09 16:24:01','2020-01-09 16:24:01',NULL,NULL),
	(1153,'RDHSNGTHU','2020-01-09 16:35:09','2020-01-09 16:35:09',NULL,NULL),
	(1154,'RDLYDANGHANG','2020-01-10 12:46:28','2020-01-10 12:46:28',NULL,NULL),
	(1155,'VCDHUNG89','2020-01-10 17:00:01','2020-01-10 17:00:01',NULL,NULL),
	(1156,'VCNAM852','2020-01-10 19:53:44','2020-01-10 19:53:44',NULL,NULL),
	(1157,'RDHDLANANH','2020-01-10 21:07:52','2020-01-10 21:07:52',NULL,NULL),
	(1158,'RDLYAN96','2020-01-10 21:17:59','2020-01-10 21:17:59',NULL,NULL),
	(1159,'RDHDLINHOAN','2020-01-10 21:18:58','2020-01-10 21:18:58',NULL,NULL),
	(1160,'RDLYHOATHUONG','2020-01-10 21:25:09','2020-01-10 21:25:09',NULL,NULL),
	(1161,'VCHIEU200','2020-01-10 22:59:51','2020-01-10 22:59:51',NULL,NULL),
	(1162,'rdhsducduy','2020-01-11 09:53:00','2020-01-11 09:53:00',NULL,NULL),
	(1163,'VCHSTIEN308','2020-01-11 11:06:00','2020-01-11 11:06:00',NULL,NULL),
	(1164,'RDHSTRINGHIA','2020-01-11 13:34:24','2020-01-11 13:34:24',NULL,NULL),
	(1165,'RDHSNGTHI','2020-01-11 13:37:12','2020-01-11 13:37:12',NULL,NULL),
	(1166,'VCHNNHAT','2020-01-11 15:27:50','2020-01-11 15:27:50',NULL,NULL),
	(1167,'RRDHSDUCDUY','2020-01-11 16:54:06','2020-01-11 16:54:06',NULL,NULL),
	(1168,'RDLYDAMITU','2020-01-12 17:22:51','2020-01-12 17:22:51',NULL,NULL),
	(1169,'RDLYDANGHAWNG','2020-01-12 17:24:42','2020-01-12 17:24:42',NULL,NULL),
	(1170,'RDLYLECUONG','2020-01-12 17:36:52','2020-01-12 17:36:52',NULL,NULL),
	(1171,'VCSGDOLY','2020-01-12 18:15:33','2020-01-12 18:15:33',NULL,NULL),
	(1172,'VCNDB','2020-01-12 18:32:13','2020-01-12 18:32:13',NULL,NULL),
	(1173,'VCANH','2020-01-12 19:09:58','2020-01-12 19:09:58',NULL,NULL),
	(1174,'VCHIEN8286','2020-01-12 19:17:38','2020-01-12 19:17:38',NULL,NULL),
	(1175,'VCTTIEN98','2020-01-12 19:21:56','2020-01-12 19:21:56',NULL,NULL),
	(1176,'RDHDCHISTOPtt66','2020-01-13 16:38:37','2020-01-13 16:38:37',NULL,NULL),
	(1177,'SGTRAM','2020-01-14 10:39:54','2020-01-14 10:39:54',NULL,NULL),
	(1178,'VCHSKHANHLY1','2020-01-14 13:43:01','2020-01-14 13:43:01',NULL,NULL),
	(1179,'RDSGDAMITU','2020-01-14 14:03:45','2020-01-14 14:03:45',NULL,NULL),
	(1180,'VCTTL24','2020-01-14 14:44:24','2020-01-14 14:44:24',NULL,NULL),
	(1181,'VCTBHANG45','2020-01-14 14:45:28','2020-01-14 14:45:28',NULL,NULL),
	(1182,'VCADONG853','2020-01-15 11:58:42','2020-01-15 11:58:42',NULL,NULL),
	(1183,'RDLANANH','2020-01-15 12:57:39','2020-01-15 12:57:39',NULL,NULL),
	(1184,'VCHSNGTHI','2020-01-16 10:10:25','2020-01-16 10:10:25',NULL,NULL),
	(1185,'VCHSMANH','2020-01-16 14:06:38','2020-01-16 14:06:38',NULL,NULL),
	(1186,'LT','2020-01-18 12:28:37','2020-01-18 12:28:37',NULL,NULL),
	(1187,'ATUANGL','2020-01-20 09:04:17','2020-01-20 09:04:17',NULL,NULL),
	(1188,'RDDDTHISAY','2020-03-02 13:05:46','2020-03-02 13:05:46',NULL,NULL),
	(1189,'VCSGVT','2020-03-02 13:09:00','2020-03-02 13:09:00',NULL,NULL),
	(1190,'VCLYDTT','2020-03-02 13:11:39','2020-03-02 13:11:39',NULL,NULL),
	(1191,'SGKT','2020-03-02 13:12:03','2020-03-02 13:12:03',NULL,NULL),
	(1192,'VCLYMAITDT','2020-03-02 13:15:54','2020-03-02 13:15:54',NULL,NULL),
	(1193,'VCLYDUYLONG','2020-03-02 13:16:41','2020-03-02 13:16:41',NULL,NULL),
	(1194,'RDDDHOANGTRANG','2020-03-02 13:17:20','2020-03-02 13:17:20',NULL,NULL),
	(1195,'RDHDTHUNG95','2020-03-02 13:20:14','2020-03-02 13:20:14',NULL,NULL),
	(1196,'RDDDHONGVAN','2020-03-02 13:21:37','2020-03-02 13:21:37',NULL,NULL),
	(1197,'VCLYHUONGDAO','2020-03-02 13:23:24','2020-03-02 13:23:24',NULL,NULL),
	(1198,'VCHDMAITDT','2020-03-02 13:27:09','2020-03-02 13:27:09',NULL,NULL),
	(1199,'RDDDPHIEN','2020-03-02 13:29:24','2020-03-02 13:29:24',NULL,NULL),
	(1200,'VCLYTUANANH','2020-03-02 13:32:44','2020-03-02 13:32:44',NULL,NULL),
	(1201,'VCLYHAIANH','2020-03-02 13:34:21','2020-03-02 13:34:21',NULL,NULL),
	(1202,'VCLYXULE998','2020-03-02 13:35:14','2020-03-02 13:35:14',NULL,NULL),
	(1203,'VCLYHIN','2020-03-02 13:36:32','2020-03-02 13:36:32',NULL,NULL),
	(1204,'VCLYHANH01','2020-03-02 13:38:01','2020-03-02 13:38:01',NULL,NULL),
	(1205,'VCHDHIEHD','2020-03-02 13:38:56','2020-03-02 13:38:56',NULL,NULL),
	(1206,'VCLYVITHAN','2020-03-02 13:39:07','2020-03-02 13:39:07',NULL,NULL),
	(1207,'VCLYHANGHP','2020-03-02 13:41:09','2020-03-02 13:41:09',NULL,NULL),
	(1208,'VCDDMINHTTP','2020-03-02 13:42:29','2020-03-02 13:42:29',NULL,NULL),
	(1209,'VCLYTTL92','2020-03-02 13:43:27','2020-03-02 13:43:27',NULL,NULL),
	(1210,'VCLYHBDUY0','2020-03-02 13:44:01','2020-03-02 13:44:01',NULL,NULL),
	(1211,'VCHDYUMMY','2020-03-02 13:44:37','2020-03-02 13:44:37',NULL,NULL),
	(1212,'VCLYPHANH','2020-03-02 13:45:42','2020-03-02 13:45:42',NULL,NULL),
	(1213,'VCLYHOAMAUDON','2020-03-02 13:46:24','2020-03-02 13:46:24',NULL,NULL),
	(1214,'VCLYMUMMY','2020-03-02 13:47:29','2020-03-02 13:47:29',NULL,NULL),
	(1215,'VCLYVYVY','2020-03-02 13:49:10','2020-03-02 13:49:10',NULL,NULL),
	(1218,'VCHDHUY21','2020-03-02 13:53:11','2020-03-02 13:53:11',NULL,NULL),
	(1219,'VCDDMT93','2020-03-02 13:54:39','2020-03-02 13:54:39',NULL,NULL),
	(1220,'VCDDNGOCDUNG','2020-03-02 13:55:07','2020-03-02 13:55:07',NULL,NULL),
	(1221,'VCLYANH88','2020-03-02 13:55:09','2020-03-02 13:55:09',NULL,NULL),
	(1222,'VCDDLY93','2020-03-02 13:56:03','2020-03-02 13:56:03',NULL,NULL),
	(1223,'VCDDFANGHOANG','2020-03-02 13:58:15','2020-03-02 13:58:15',NULL,NULL),
	(1224,'VCDDCONGSON','2020-03-02 13:58:45','2020-03-02 13:58:45',NULL,NULL),
	(1225,'VCLYUYENHN','2020-03-02 13:59:33','2020-03-02 13:59:33',NULL,NULL),
	(1226,'VCLYPHAN98','2020-03-02 14:00:11','2020-03-02 14:00:11',NULL,NULL),
	(1227,'VCDDTHIEN','2020-03-02 14:00:48','2020-03-02 14:00:48',NULL,NULL),
	(1228,'VCHDHANG88','2020-03-02 14:01:32','2020-03-02 14:01:32',NULL,NULL),
	(1229,'VCLYLINDA','2020-03-02 14:02:41','2020-03-02 14:02:41',NULL,NULL),
	(1230,'VCLYBAONGOC','2020-03-02 14:03:19','2020-03-02 14:03:19',NULL,NULL),
	(1231,'VCDDSHASHI','2020-03-02 14:05:51','2020-03-02 14:05:51',NULL,NULL),
	(1232,'VCLYTRANGXUAN','2020-03-02 14:10:58','2020-03-02 14:10:58',NULL,NULL),
	(1233,'VCLY2709','2020-03-02 14:11:16','2020-03-02 14:11:16',NULL,NULL),
	(1234,'VCHDPHAMHUONG','2020-03-02 14:11:42','2020-03-02 14:11:42',NULL,NULL),
	(1235,'VCHDPTP','2020-03-02 14:11:59','2020-03-02 14:11:59',NULL,NULL),
	(1236,'VCLYHNHUE','2020-03-02 14:12:14','2020-03-02 14:12:14',NULL,NULL),
	(1237,'VCLYNGOCHN','2020-03-02 14:12:40','2020-03-02 14:12:40',NULL,NULL),
	(1238,'VCLYTHANHTU','2020-03-02 14:13:05','2020-03-02 14:13:05',NULL,NULL),
	(1239,'VCLYMDIEP','2020-03-02 14:13:19','2020-03-02 14:13:19',NULL,NULL),
	(1240,'VCLYLANA','2020-03-02 14:13:42','2020-03-02 14:13:42',NULL,NULL),
	(1241,'VCLYLANANHTQ','2020-03-02 14:13:59','2020-03-02 14:13:59',NULL,NULL),
	(1242,'VCLYTTL24','2020-03-02 14:14:17','2020-03-02 14:14:17',NULL,NULL),
	(1243,'VCLYHBKEMBUTI','2020-03-02 14:14:34','2020-03-02 14:14:34',NULL,NULL),
	(1244,'VCLYHANH212','2020-03-02 14:15:10','2020-03-02 14:15:10',NULL,NULL),
	(1245,'VCLYQNGA75','2020-03-02 14:15:21','2020-03-02 14:15:21',NULL,NULL),
	(1246,'VCLYATSK','2020-03-02 14:15:36','2020-03-02 14:15:36',NULL,NULL),
	(1247,'VCLYTRINH911','2020-03-02 14:16:04','2020-03-02 14:16:04',NULL,NULL),
	(1248,'VCLYHUONG907','2020-03-02 14:16:20','2020-03-02 14:16:20',NULL,NULL),
	(1249,'VCLYQUYNHQB','2020-03-02 14:16:51','2020-03-02 14:16:51',NULL,NULL),
	(1250,'VCLYQUYNH282','2020-03-02 14:17:02','2020-03-02 14:17:02',NULL,NULL),
	(1251,'VCLYCHU15','2020-03-02 14:17:36','2020-03-02 14:17:36',NULL,NULL),
	(1252,'VCLYKT','2020-03-02 14:19:27','2020-03-02 14:19:27',NULL,NULL),
	(1253,'VCDDLI93','2020-03-02 14:30:00','2020-03-02 14:30:00',NULL,NULL),
	(1254,'VCDDTH888','2020-03-03 11:15:16','2020-03-03 11:15:16',NULL,NULL),
	(1255,'VCLYKENGNAM','2020-03-03 11:48:01','2020-03-03 11:48:01',NULL,NULL),
	(1256,'VCLYXULE','2020-03-05 09:38:45','2020-03-05 09:38:45',NULL,NULL),
	(1257,'VCLYMINHNGOC','2020-03-05 09:39:46','2020-03-05 09:39:46',NULL,NULL),
	(1258,'VCLYTHUYLINH','2020-03-05 09:43:44','2020-03-05 09:43:44',NULL,NULL),
	(1259,'VCLYTHANHTHANH','2020-03-05 09:44:02','2020-03-05 09:44:02',NULL,NULL),
	(1260,'VCLYLONG039','2020-03-05 09:45:10','2020-03-05 09:45:10',NULL,NULL),
	(1261,'VCLYHBTUNG','2020-03-05 09:45:58','2020-03-05 09:45:58',NULL,NULL),
	(1262,'VCLYNGHIATQ','2020-03-05 09:47:06','2020-03-05 09:47:06',NULL,NULL),
	(1263,'VCLYNGOCHOA','2020-03-05 09:47:24','2020-03-05 09:47:24',NULL,NULL),
	(1264,'VCLYLHTHU95','2020-03-05 09:47:42','2020-03-05 09:47:42',NULL,NULL),
	(1265,'VCLYAN77','2020-03-05 09:47:56','2020-03-05 09:47:56',NULL,NULL),
	(1266,'VCLYMINHDUC','2020-03-05 09:48:09','2020-03-05 09:48:09',NULL,NULL),
	(1267,'VCLYPLNHI','2020-03-05 09:48:31','2020-03-05 09:48:31',NULL,NULL),
	(1268,'VCLYHUYLY','2020-03-05 09:48:44','2020-03-05 09:48:44',NULL,NULL),
	(1269,'VCLYDNB','2020-03-05 09:49:40','2020-03-05 09:49:40',NULL,NULL),
	(1270,'VCLYKANGNAM','2020-03-05 09:49:58','2020-03-05 09:49:58',NULL,NULL),
	(1271,'VCLYTRINH892','2020-03-05 09:50:05','2020-03-05 09:50:05',NULL,NULL),
	(1272,'VCLYDNTRANG39','2020-03-05 09:50:47','2020-03-05 09:50:47',NULL,NULL),
	(1273,'VCLYPHUNGLY','2020-03-05 09:51:01','2020-03-05 09:51:01',NULL,NULL),
	(1274,'VCLYMANHTRUNG','2020-03-05 09:51:36','2020-03-05 09:51:36',NULL,NULL),
	(1275,'VCLYTTN24','2020-03-05 09:53:18','2020-03-05 09:53:18',NULL,NULL),
	(1276,'VCLYMIDORI','2020-03-05 09:53:45','2020-03-05 09:53:45',NULL,NULL),
	(1277,'VCLYMRHUNG135','2020-03-05 09:55:01','2020-03-05 09:55:01',NULL,NULL),
	(1278,'VCLYPHUNGSG','2020-03-05 09:55:19','2020-03-05 09:55:19',NULL,NULL),
	(1279,'VCHDHIEPHD','2020-03-05 09:57:17','2020-03-05 09:57:17',NULL,NULL),
	(1280,'VCLYCHUOT','2020-03-05 10:04:17','2020-03-05 10:04:17',NULL,NULL),
	(1281,'VCLYDN51','2020-03-05 10:05:43','2020-03-05 10:05:43',NULL,NULL),
	(1282,'VCHDPHUONGHD','2020-03-05 10:53:53','2020-03-05 10:53:53',NULL,NULL),
	(1283,'VCHDYUMMY29','2020-03-05 10:59:27','2020-03-05 10:59:27',NULL,NULL),
	(1284,'VCLYQUYNHHN','2020-03-05 11:22:41','2020-03-05 11:22:41',NULL,NULL),
	(1285,'VCHDLEHOA86','2020-03-05 11:23:48','2020-03-05 11:23:48',NULL,NULL),
	(1286,'VCHDDUCHANH','2020-03-05 11:24:16','2020-03-05 11:24:16',NULL,NULL),
	(1287,'RDSGUYENPHUONG','2020-03-05 11:24:21','2020-03-05 11:24:21',NULL,NULL),
	(1288,'VCHDNAM85','2020-03-05 11:24:54','2020-03-05 11:24:54',NULL,NULL),
	(1289,'RDSGHAI','2020-03-05 11:25:16','2020-03-05 11:25:16',NULL,NULL),
	(1290,'RDHDKHANHBUI','2020-03-05 11:26:20','2020-03-05 11:26:20',NULL,NULL),
	(1291,'RDDDBQ','2020-03-05 11:30:32','2020-03-05 11:30:32',NULL,NULL),
	(1292,'RDDDMYLE86','2020-03-05 11:31:58','2020-03-05 11:31:58',NULL,NULL),
	(1293,'VCDDQHUY91','2020-03-05 11:46:19','2020-03-05 11:46:19',NULL,NULL),
	(1294,'VCDDMR','2020-03-05 11:48:13','2020-03-05 11:48:13',NULL,NULL),
	(1295,'VCDDTIEN308','2020-03-05 11:48:48','2020-03-05 11:48:48',NULL,NULL),
	(1296,'VCDDVANANH','2020-03-05 11:49:18','2020-03-05 11:49:18',NULL,NULL),
	(1297,'VCDDDONGANH','2020-03-05 11:50:00','2020-03-05 11:50:00',NULL,NULL),
	(1298,'VCDDK65','2020-03-05 11:50:52','2020-03-05 11:50:52',NULL,NULL),
	(1299,'VCDDDUYLONG','2020-03-05 11:51:28','2020-03-05 11:51:28',NULL,NULL),
	(1300,'VCDDPA915','2020-03-05 11:52:07','2020-03-05 11:52:07',NULL,NULL),
	(1301,'VCDDHUEHAN','2020-03-05 11:53:05','2020-03-05 11:53:05',NULL,NULL),
	(1302,'VCDDKT','2020-03-05 11:54:42','2020-03-05 11:54:42',NULL,NULL),
	(1303,'VCDDNVDUNG','2020-03-05 11:58:08','2020-03-05 11:58:08',NULL,NULL),
	(1304,'VCLYBELLA','2020-03-05 12:44:47','2020-03-05 12:44:47',NULL,NULL),
	(1305,'RDHDBQ','2020-03-05 14:17:44','2020-03-05 14:17:44',NULL,NULL),
	(1306,'VCLYGIANGTQ','2020-03-07 11:47:00','2020-03-07 11:47:00',NULL,NULL),
	(1307,'KTMC','2020-03-07 13:30:54','2020-03-07 13:30:54',NULL,NULL),
	(1308,'VCMCMUMMY','2020-03-07 13:33:18','2020-03-07 13:33:18',NULL,NULL),
	(1309,'VCMCNHN1703','2020-03-07 13:40:46','2020-03-07 13:40:46',NULL,NULL),
	(1310,'RDMCNGQUYNH','2020-03-07 14:04:12','2020-03-07 14:04:12',NULL,NULL),
	(1311,'VCHDYMMY29','2020-03-09 13:46:12','2020-03-09 13:46:12',NULL,NULL),
	(1312,'VCLYVANDUONG','2020-03-12 08:30:50','2020-03-12 08:30:50',NULL,NULL),
	(1313,'VCHDPHUONG90','2020-03-12 14:54:30','2020-03-12 14:54:30',NULL,NULL),
	(1314,'RDDDKIMANH','2020-03-12 15:07:34','2020-03-12 15:07:34',NULL,NULL),
	(1315,'RDDDHOAINAM','2020-03-12 15:14:21','2020-03-12 15:14:21',NULL,NULL),
	(1316,'RDHDTHUYANH','2020-03-12 15:23:00','2020-03-12 15:23:00',NULL,NULL),
	(1317,'RDDDLYHA','2020-03-12 15:23:59','2020-03-12 15:23:59',NULL,NULL),
	(1318,'RDDDTRUNG85','2020-03-12 15:33:38','2020-03-12 15:33:38',NULL,NULL),
	(1319,'RDSGHUY308','2020-03-12 15:47:20','2020-03-12 15:47:20',NULL,NULL),
	(1320,'RDSGHOANH','2020-03-12 15:50:21','2020-03-12 15:50:21',NULL,NULL),
	(1321,'RDHDHAU','2020-03-12 16:01:43','2020-03-12 16:01:43',NULL,NULL),
	(1322,'RDDDMIMI','2020-03-12 16:02:28','2020-03-12 16:02:28',NULL,NULL),
	(1323,'VCLYMINHTTP','2020-03-12 17:21:43','2020-03-12 17:21:43',NULL,NULL),
	(1324,'RDDDHIEPKUN','2020-03-12 17:22:08','2020-03-12 17:22:08',NULL,NULL),
	(1325,'RDSGBING87','2020-03-12 17:25:41','2020-03-12 17:25:41',NULL,NULL),
	(1326,'VCLYTRANGLE','2020-03-12 17:26:32','2020-03-12 17:26:32',NULL,NULL),
	(1327,'VCLYLENGOC','2020-03-12 17:33:13','2020-03-12 17:33:13',NULL,NULL),
	(1328,'VCLYPTL42','2020-03-12 17:41:07','2020-03-12 17:41:07',NULL,NULL),
	(1329,'VCLYHIEU2000','2020-03-12 18:13:13','2020-03-12 18:13:13',NULL,NULL),
	(1330,'VCLYHN51','2020-03-12 18:18:11','2020-03-12 18:18:11',NULL,NULL),
	(1331,'VCLY HUONGDAO','2020-03-12 18:24:28','2020-03-12 18:24:28',NULL,NULL),
	(1332,'VCDDMTHU03','2020-03-12 18:28:30','2020-03-12 18:28:30',NULL,NULL),
	(1333,'VCLYPKHANH','2020-03-12 18:28:58','2020-03-12 18:28:58',NULL,NULL),
	(1334,'VCLYPHAMDUC','2020-03-12 18:32:12','2020-03-12 18:32:12',NULL,NULL),
	(1335,'VCLYTUYENNGOC','2020-03-12 18:36:16','2020-03-12 18:36:16',NULL,NULL),
	(1336,'VCLYTHUTRA','2020-03-12 18:38:15','2020-03-12 18:38:15',NULL,NULL),
	(1337,'VCLYTRUNGDO','2020-03-12 18:40:30','2020-03-12 18:40:30',NULL,NULL),
	(1338,'LYKT','2020-03-12 18:56:06','2020-03-12 18:56:06',NULL,NULL),
	(1339,'RDHDTHANHBUI','2020-03-12 20:05:23','2020-03-12 20:05:23',NULL,NULL),
	(1340,'VCLYTHAOHA','2020-03-12 20:16:19','2020-03-12 20:16:19',NULL,NULL),
	(1341,'RDHDTHUHUYEN','2020-03-12 21:31:29','2020-03-12 21:31:29',NULL,NULL),
	(1342,'VCLYHBDUYO','2020-03-12 21:44:42','2020-03-12 21:44:42',NULL,NULL),
	(1343,'VCLYHBTUNGCHE','2020-03-12 21:45:52','2020-03-12 21:45:52',NULL,NULL),
	(1344,'RDDDKUNNY','2020-03-12 21:46:14','2020-03-12 21:46:14',NULL,NULL),
	(1345,'VCLYMANH290','2020-03-12 21:53:13','2020-03-12 21:53:13',NULL,NULL),
	(1346,'VCLYHUYEN93','2020-03-12 21:54:24','2020-03-12 21:54:24',NULL,NULL),
	(1347,'RDDDVINCENT','2020-03-12 21:59:51','2020-03-12 21:59:51',NULL,NULL),
	(1348,'RDLYANHCHU','2020-03-12 22:07:14','2020-03-12 22:07:14',NULL,NULL),
	(1349,'VCLYSAOMAI','2020-03-12 22:10:03','2020-03-12 22:10:03',NULL,NULL),
	(1350,'VCLYUPINUS','2020-03-12 22:16:19','2020-03-12 22:16:19',NULL,NULL),
	(1351,'VCLYNVQ','2020-03-12 22:22:09','2020-03-12 22:22:09',NULL,NULL),
	(1352,'VCLYLI93','2020-03-12 22:23:49','2020-03-12 22:23:49',NULL,NULL),
	(1353,'VCLYVU88','2020-03-12 22:24:16','2020-03-12 22:24:16',NULL,NULL),
	(1354,'VCSGANHDAKLAK','2020-03-12 22:24:34','2020-03-12 22:24:34',NULL,NULL),
	(1355,'VCHSVAN','2020-03-12 22:27:05','2020-03-12 22:27:05',NULL,NULL),
	(1356,'VCLYLINHWON','2020-03-12 22:28:14','2020-03-12 22:28:14',NULL,NULL),
	(1357,'VCLYDIEN09','2020-03-12 22:28:15','2020-03-12 22:28:15',NULL,NULL),
	(1358,'VCLYMTHU03','2020-03-12 22:31:12','2020-03-12 22:31:12',NULL,NULL),
	(1359,'VCLYHIEUCAMPHA','2020-03-12 22:32:32','2020-03-12 22:32:32',NULL,NULL),
	(1360,'VCLYAKHANH','2020-03-12 22:34:08','2020-03-12 22:34:08',NULL,NULL),
	(1361,'VCLYT98','2020-03-12 22:34:48','2020-03-12 22:34:48',NULL,NULL),
	(1362,'VCLYKHUYEN','2020-03-12 22:35:20','2020-03-12 22:35:20',NULL,NULL),
	(1363,'VCLYHANA','2020-03-12 22:35:43','2020-03-12 22:35:43',NULL,NULL),
	(1364,'VCLYQA98','2020-03-12 22:36:56','2020-03-12 22:36:56',NULL,NULL),
	(1365,'VCLYQHUY91','2020-03-12 22:37:15','2020-03-12 22:37:15',NULL,NULL),
	(1366,'VCLYQUYNHQP','2020-03-12 22:37:39','2020-03-12 22:37:39',NULL,NULL),
	(1367,'VCLYDONHUNG11','2020-03-12 22:38:04','2020-03-12 22:38:04',NULL,NULL),
	(1368,'VCLYTHAO92','2020-03-12 22:38:36','2020-03-12 22:38:36',NULL,NULL),
	(1369,'VCLYK65','2020-03-12 22:39:45','2020-03-12 22:39:45',NULL,NULL),
	(1370,'VCLYNGANHUYEN','2020-03-12 22:40:06','2020-03-12 22:40:06',NULL,NULL),
	(1371,'VCLYTIEN308','2020-03-12 22:40:23','2020-03-12 22:40:23',NULL,NULL),
	(1372,'VCLYLUYEN','2020-03-12 22:41:13','2020-03-12 22:41:13',NULL,NULL),
	(1373,'VCLYNGA667','2020-03-12 22:41:41','2020-03-12 22:41:41',NULL,NULL),
	(1374,'VCLYTHIEN876','2020-03-12 22:43:11','2020-03-12 22:43:11',NULL,NULL),
	(1375,'DDKT','2020-03-12 22:43:38','2020-03-12 22:43:38',NULL,NULL),
	(1376,'VCLYNTGIANG','2020-03-12 22:44:19','2020-03-12 22:44:19',NULL,NULL),
	(1377,'VCLYTUAN','2020-03-12 22:46:20','2020-03-12 22:46:20',NULL,NULL),
	(1378,'VCLYCAOT93','2020-03-12 22:46:40','2020-03-12 22:46:40',NULL,NULL),
	(1379,'VCHSPHANHOANG','2020-03-12 22:46:58','2020-03-12 22:46:58',NULL,NULL),
	(1380,'VCLYTRAN','2020-03-12 22:48:00','2020-03-12 22:48:00',NULL,NULL),
	(1381,'VCLYDUCCO','2020-03-12 22:48:24','2020-03-12 22:48:24',NULL,NULL),
	(1382,'VCLYMUMI','2020-03-12 22:48:40','2020-03-12 22:48:40',NULL,NULL),
	(1383,'VCLYTATQ','2020-03-12 22:50:39','2020-03-12 22:50:39',NULL,NULL),
	(1384,'VCLYLHA','2020-03-12 22:51:49','2020-03-12 22:51:49',NULL,NULL),
	(1385,'VCLYHSMINHTTP','2020-03-12 22:55:56','2020-03-12 22:55:56',NULL,NULL),
	(1386,'VCLYLHA969','2020-03-13 08:28:47','2020-03-13 08:28:47',NULL,NULL),
	(1387,'VCLYTRI','2020-03-13 09:15:43','2020-03-13 09:15:43',NULL,NULL),
	(1388,'VCHDCHIEN','2020-03-13 09:33:59','2020-03-13 09:33:59',NULL,NULL),
	(1389,'VCHDHEOPEO','2020-03-13 09:36:00','2020-03-13 09:36:00',NULL,NULL),
	(1390,'VCHDHOA475','2020-03-13 09:43:42','2020-03-13 09:43:42',NULL,NULL),
	(1391,'VCLYHOA883','2020-03-13 09:44:15','2020-03-13 09:44:15',NULL,NULL),
	(1392,'VCHDHADONG','2020-03-13 10:41:00','2020-03-13 10:41:00',NULL,NULL),
	(1393,'VCHDHADONG','2020-03-13 10:41:00','2020-03-13 10:41:00',NULL,NULL),
	(1394,'VCHDHANGHB','2020-03-13 10:48:02','2020-03-13 10:48:02',NULL,NULL),
	(1395,'VCLYSGANHDE','2020-03-13 11:25:34','2020-03-13 11:25:34',NULL,NULL),
	(1396,'RDSGHUNG','2020-03-13 11:34:37','2020-03-13 11:34:37',NULL,NULL),
	(1397,'RDLYDUY98','2020-03-13 11:56:36','2020-03-13 11:56:36',NULL,NULL),
	(1398,'RDDDPHUONG','2020-03-13 12:10:23','2020-03-13 12:10:23',NULL,NULL),
	(1399,'VCLYHUE87','2020-03-13 13:38:48','2020-03-13 13:38:48',NULL,NULL),
	(1400,'VCLYANHNGUYEN','2020-03-13 13:39:47','2020-03-13 13:39:47',NULL,NULL),
	(1401,'VCLYHANHLE','2020-03-13 13:41:48','2020-03-13 13:41:48',NULL,NULL),
	(1402,'VCLYBERRY','2020-03-13 13:46:58','2020-03-13 13:46:58',NULL,NULL),
	(1403,'VCLYSHUSHU','2020-03-13 13:48:28','2020-03-13 13:48:28',NULL,NULL),
	(1404,'VCLYANHDAKLAK','2020-03-13 13:51:57','2020-03-13 13:51:57',NULL,NULL),
	(1405,'VCLYNGUYET','2020-03-13 13:52:14','2020-03-13 13:52:14',NULL,NULL),
	(1406,'VCLYATKS','2020-03-13 13:55:35','2020-03-13 13:55:35',NULL,NULL),
	(1407,'VCLYMRHUNG','2020-03-13 13:58:22','2020-03-13 13:58:22',NULL,NULL),
	(1408,'VCHDTBHANG','2020-03-13 14:27:23','2020-03-13 14:27:23',NULL,NULL),
	(1409,'VCHDHANGHP','2020-03-13 14:37:29','2020-03-13 14:37:29',NULL,NULL),
	(1410,'RDHDMANH','2020-03-13 15:51:47','2020-03-13 15:51:47',NULL,NULL),
	(1411,'RDHDVIET','2020-03-13 15:57:35','2020-03-13 15:57:35',NULL,NULL),
	(1412,'VCLYLAN96','2020-03-13 20:29:57','2020-03-13 20:29:57',NULL,NULL),
	(1413,'VCDDKHANHLY','2020-03-13 20:30:27','2020-03-13 20:30:27',NULL,NULL),
	(1414,'VCDDDUONG341','2020-03-13 20:31:40','2020-03-13 20:31:40',NULL,NULL),
	(1415,'VCLYDDQHUY91','2020-03-13 20:44:01','2020-03-13 20:44:01',NULL,NULL),
	(1416,'VCDDHUYEN','2020-03-13 20:53:59','2020-03-13 20:53:59',NULL,NULL),
	(1417,'VCDDVAN','2020-03-14 08:58:55','2020-03-14 08:58:55',NULL,NULL),
	(1418,'VCDDLUUHANH','2020-03-14 08:59:03','2020-03-14 08:59:03',NULL,NULL),
	(1419,'VCHDKT','2020-03-14 09:51:58','2020-03-14 09:51:58',NULL,NULL),
	(1420,'VCLYHUEHAN','2020-03-14 12:19:28','2020-03-14 12:19:28',NULL,NULL),
	(1421,'VCHDHDUNG89','2020-03-14 13:46:55','2020-03-14 13:46:55',NULL,NULL),
	(1422,'RDDMIMI','2020-03-14 14:17:18','2020-03-14 14:17:18',NULL,NULL),
	(1423,'RDHDPHIEN','2020-03-14 15:53:10','2020-03-14 15:53:10',NULL,NULL),
	(1424,'VCLYVIETANH','2020-03-16 10:16:44','2020-03-16 10:16:44',NULL,NULL),
	(1425,'RDBTQUANGHE','2020-03-17 12:14:04','2020-03-17 12:14:04',NULL,NULL),
	(1426,'VCLYXIAN88','2020-03-17 16:17:56','2020-03-17 16:17:56',NULL,NULL),
	(1427,'KTDD','2020-03-17 16:36:20','2020-03-17 16:36:20',NULL,NULL),
	(1428,'VCLYNGANNG','2020-03-18 12:20:23','2020-03-18 12:20:23',NULL,NULL),
	(1429,'KTLY','2020-03-20 14:07:14','2020-03-20 14:07:14',NULL,NULL),
	(1430,'KTLY-MC','2020-03-21 10:53:40','2020-03-21 10:53:40',NULL,NULL),
	(1431,'RDDDQUANNEN','2020-03-22 09:39:45','2020-03-22 09:39:45',NULL,NULL),
	(1432,'vcltminhngoc','2020-03-22 11:20:00','2020-03-22 11:20:00',NULL,NULL),
	(1433,'VCLYTHIEN','2020-03-22 11:29:02','2020-03-22 11:29:02',NULL,NULL),
	(1434,'RDDDDUONGNAM','2020-03-22 11:39:53','2020-03-22 11:39:53',NULL,NULL),
	(1435,'VCLYBACNGUYEN','2020-03-22 12:09:57','2020-03-22 12:09:57',NULL,NULL),
	(1436,'VCDDUYENMIU','2020-03-22 15:52:44','2020-03-22 15:52:44',NULL,NULL),
	(1437,'VCLYTANGHUY','2020-03-22 16:20:24','2020-03-22 16:20:24',NULL,NULL),
	(1438,'VCLYNGOCDUNG','2020-03-22 16:21:10','2020-03-22 16:21:10',NULL,NULL),
	(1439,'VCLYDONHUNG','2020-03-22 16:21:35','2020-03-22 16:21:35',NULL,NULL),
	(1440,'VCLYXUANHUY','2020-03-22 16:22:34','2020-03-22 16:22:34',NULL,NULL),
	(1441,'VCHSMOLY','2020-03-22 16:26:17','2020-03-22 16:26:17',NULL,NULL),
	(1442,'VCDDPHANHOANG','2020-03-22 16:30:24','2020-03-22 16:30:24',NULL,NULL),
	(1443,'VCLYHOANMAUDON','2020-03-22 16:30:51','2020-03-22 16:30:51',NULL,NULL),
	(1444,'VCLYLYMINH','2020-03-22 16:35:55','2020-03-22 16:35:55',NULL,NULL),
	(1445,'VCLYPHUONGYEN','2020-03-22 16:37:53','2020-03-22 16:37:53',NULL,NULL),
	(1446,'VCLYSHASHI','2020-03-22 16:39:09','2020-03-22 16:39:09',NULL,NULL),
	(1447,'VCLYTH888','2020-03-22 16:39:21','2020-03-22 16:39:21',NULL,NULL),
	(1448,'VCLYTHIEN308','2020-03-22 16:39:35','2020-03-22 16:39:35',NULL,NULL),
	(1449,'VCLYHANG88','2020-03-22 16:40:48','2020-03-22 16:40:48',NULL,NULL),
	(1450,'VCLYPEO17','2020-03-22 16:41:05','2020-03-22 16:41:05',NULL,NULL),
	(1451,'VCLYNML','2020-03-22 16:41:22','2020-03-22 16:41:22',NULL,NULL),
	(1452,'VCLYDDKIMANH','2020-03-22 16:41:41','2020-03-22 16:41:41',NULL,NULL),
	(1453,'VCLYPA91','2020-03-22 16:42:29','2020-03-22 16:42:29',NULL,NULL),
	(1454,'VCDDHUAN','2020-03-22 16:43:31','2020-03-22 16:43:31',NULL,NULL),
	(1455,'VCHDVANANH','2020-03-22 17:19:34','2020-03-22 17:19:34',NULL,NULL),
	(1456,'RDHSCUONG626','2020-03-22 17:27:48','2020-03-22 17:27:48',NULL,NULL),
	(1457,'RDHDMINHTU','2020-03-22 17:32:43','2020-03-22 17:32:43',NULL,NULL),
	(1458,'RDLYLINHBONG','2020-03-22 20:07:05','2020-03-22 20:07:05',NULL,NULL),
	(1459,'VCLYEDDINHBV','2020-03-22 20:26:42','2020-03-22 20:26:42',NULL,NULL),
	(1460,'VCLYKIDO','2020-03-22 20:27:01','2020-03-22 20:27:01',NULL,NULL),
	(1461,'VCLYTNL69','2020-03-22 20:28:36','2020-03-22 20:28:36',NULL,NULL),
	(1462,'VCLYNHTRANG72','2020-03-22 20:31:42','2020-03-22 20:31:42',NULL,NULL),
	(1463,'VCLYNAM','2020-03-22 20:32:25','2020-03-22 20:32:25',NULL,NULL),
	(1464,'RDDDMYLE','2020-03-22 20:34:18','2020-03-22 20:34:18',NULL,NULL),
	(1465,'VCLYNMH567','2020-03-22 20:34:54','2020-03-22 20:34:54',NULL,NULL),
	(1466,'RDLYGIAGIA','2020-03-22 22:12:34','2020-03-22 22:12:34',NULL,NULL),
	(1467,'VCLYHA702','2020-03-22 22:27:13','2020-03-22 22:27:13',NULL,NULL),
	(1468,'VCLYNNT','2020-03-22 22:48:05','2020-03-22 22:48:05',NULL,NULL),
	(1469,'VCDDUYEN','2020-03-22 22:50:50','2020-03-22 22:50:50',NULL,NULL),
	(1470,'VCLYPTHAO473','2020-03-22 22:52:41','2020-03-22 22:52:41',NULL,NULL),
	(1471,'VCLYMANHT','2020-03-22 22:52:57','2020-03-22 22:52:57',NULL,NULL),
	(1472,'VCLYPA915','2020-03-22 22:55:04','2020-03-22 22:55:04',NULL,NULL),
	(1473,'VCLYHAPHAM','2020-03-22 23:02:46','2020-03-22 23:02:46',NULL,NULL),
	(1474,'VCHDTBHANG145','2020-03-23 11:09:39','2020-03-23 11:09:39',NULL,NULL),
	(1475,'RDHDCCHISTOP','2020-03-23 12:17:11','2020-03-23 12:17:11',NULL,NULL),
	(1476,'RDLYHOANGTRANG','2020-03-23 16:05:35','2020-03-23 16:05:35',NULL,NULL),
	(1477,'VCHDTB145','2020-03-23 16:23:37','2020-03-23 16:23:37',NULL,NULL),
	(1478,'VCLUKANGNAM','2020-03-23 17:03:25','2020-03-23 17:03:25',NULL,NULL),
	(1479,'VCDDT98','2020-03-23 17:16:36','2020-03-23 17:16:36',NULL,NULL),
	(1480,'VCDDPHUONG','2020-03-23 17:23:02','2020-03-23 17:23:02',NULL,NULL),
	(1481,'VCLYHUYEN94','2020-03-23 17:25:20','2020-03-23 17:25:20',NULL,NULL),
	(1482,'VCLYLDVA920','2020-03-23 17:34:50','2020-03-23 17:34:50',NULL,NULL),
	(1483,'VCLYNAMQUOC','2020-03-23 17:36:10','2020-03-23 17:36:10',NULL,NULL),
	(1484,'VCLYLYLY','2020-03-23 17:36:44','2020-03-23 17:36:44',NULL,NULL),
	(1485,'VCDDTT9293','2020-03-23 17:55:31','2020-03-23 17:55:31',NULL,NULL),
	(1486,'RDHDTHICHDAOKHOI','2020-03-23 19:14:04','2020-03-23 19:14:04',NULL,NULL),
	(1487,'RDDDLINHBONG','2020-03-23 19:59:55','2020-03-23 19:59:55',NULL,NULL),
	(1488,'VCLYDUONGLINH','2020-03-23 20:55:34','2020-03-23 20:55:34',NULL,NULL),
	(1489,'VCDDUYEN230','2020-03-23 20:58:07','2020-03-23 20:58:07',NULL,NULL),
	(1490,'VCLYMOLY','2020-03-23 21:20:26','2020-03-23 21:20:26',NULL,NULL),
	(1491,'VCNGOCDUNG','2020-03-24 10:01:43','2020-03-24 10:01:43',NULL,NULL),
	(1492,'VCHDPHUNGYEN','2020-03-24 11:06:04','2020-03-24 11:06:04',NULL,NULL),
	(1493,'RDDDHAU','2020-03-24 13:30:15','2020-03-24 13:30:15',NULL,NULL),
	(1494,'RDHDVINCENT','2020-03-24 13:55:07','2020-03-24 13:55:07',NULL,NULL),
	(1495,'VCHDGEN','2020-03-24 15:54:09','2020-03-24 15:54:09',NULL,NULL),
	(1496,'VCLYNVDUNG','2020-03-26 10:16:48','2020-03-26 10:16:48',NULL,NULL),
	(1497,'RDLYHAU','2020-03-26 13:08:14','2020-03-26 13:08:14',NULL,NULL),
	(1498,'RDDDHONGMI','2020-03-26 21:01:27','2020-03-26 21:01:27',NULL,NULL),
	(1499,'RDDDTRANHANG','2020-03-26 21:09:41','2020-03-26 21:09:41',NULL,NULL),
	(1500,'RDDDLINH91','2020-03-26 21:10:22','2020-03-26 21:10:22',NULL,NULL),
	(1501,'RDDDLETU','2020-03-26 21:11:07','2020-03-26 21:11:07',NULL,NULL),
	(1502,'RDLYHANGORDER','2020-03-26 21:13:01','2020-03-26 21:13:01',NULL,NULL),
	(1503,'VCDDNHUNGTRAN','2020-03-26 21:25:58','2020-03-26 21:25:58',NULL,NULL),
	(1504,'VCLYTHUTRANG','2020-03-26 21:30:49','2020-03-26 21:30:49',NULL,NULL),
	(1505,'VCLYGIANGDU','2020-03-26 21:31:26','2020-03-26 21:31:26',NULL,NULL),
	(1506,'VCDDHOA','2020-03-26 21:31:57','2020-03-26 21:31:57',NULL,NULL),
	(1507,'VCLYNHY22','2020-03-26 21:32:24','2020-03-26 21:32:24',NULL,NULL),
	(1508,'VCLYSON88','2020-03-26 21:34:46','2020-03-26 21:34:46',NULL,NULL),
	(1509,'VCLYBOM','2020-03-26 21:35:17','2020-03-26 21:35:17',NULL,NULL),
	(1510,'VCLYTHULE','2020-03-26 21:35:42','2020-03-26 21:35:42',NULL,NULL),
	(1511,'VCHDTHUKG','2020-03-26 22:28:16','2020-03-26 22:28:16',NULL,NULL),
	(1512,'VCHDTT9293','2020-03-26 22:29:39','2020-03-26 22:29:39',NULL,NULL),
	(1513,'VCHDNGHIATQ','2020-03-26 22:47:54','2020-03-26 22:47:54',NULL,NULL),
	(1514,'RDLYCUONGDG','2020-03-26 23:42:48','2020-03-26 23:42:48',NULL,NULL),
	(1515,'RDHDLINHHOANG','2020-03-26 23:48:41','2020-03-26 23:48:41',NULL,NULL),
	(1516,'RDLYTHICHDAOKHOI','2020-03-26 23:53:33','2020-03-26 23:53:33',NULL,NULL),
	(1517,'RDLYLLH510','2020-03-26 23:55:50','2020-03-26 23:55:50',NULL,NULL),
	(1518,'VCLYDIEPTQ','2020-03-27 00:13:08','2020-03-27 00:13:08',NULL,NULL),
	(1519,'VCDDYN8820','2020-03-27 00:13:40','2020-03-27 00:13:40',NULL,NULL),
	(1520,'RDLYLENGOC','2020-03-27 00:13:52','2020-03-27 00:13:52',NULL,NULL),
	(1521,'RDLYNGA667','2020-03-27 00:14:10','2020-03-27 00:14:10',NULL,NULL),
	(1522,'VCLYBERRYPHAM','2020-03-27 00:15:40','2020-03-27 00:15:40',NULL,NULL),
	(1523,'VCLYLA','2020-03-27 00:16:20','2020-03-27 00:16:20',NULL,NULL),
	(1524,'VCLYTRIEU20','2020-03-27 00:24:38','2020-03-27 00:24:38',NULL,NULL),
	(1525,'VCLYCONGSON','2020-03-27 00:24:55','2020-03-27 00:24:55',NULL,NULL),
	(1526,'VCLYGIANGNAMBAC','2020-03-27 00:30:51','2020-03-27 00:30:51',NULL,NULL),
	(1527,'VCDDHIEN','2020-03-27 00:31:17','2020-03-27 00:31:17',NULL,NULL),
	(1528,'VCLYTATUYET','2020-03-27 00:31:32','2020-03-27 00:31:32',NULL,NULL),
	(1529,'VCHDQ21','2020-03-27 09:56:39','2020-03-27 09:56:39',NULL,NULL),
	(1530,'VCHDPÍNTORE','2020-03-27 10:10:11','2020-03-27 10:10:11',NULL,NULL),
	(1531,'VCHDHUAN','2020-03-27 10:10:38','2020-03-27 10:10:38',NULL,NULL),
	(1532,'VCHDYUCCA','2020-03-27 10:11:53','2020-03-27 10:11:53',NULL,NULL),
	(1533,'VCHDPÍNSTORE','2020-03-27 10:56:29','2020-03-27 10:56:29',NULL,NULL),
	(1534,'VCHDHOA4757','2020-03-27 11:29:55','2020-03-27 11:29:55',NULL,NULL),
	(1535,'RDDDNVHA88','2020-03-27 15:39:35','2020-03-27 15:39:35',NULL,NULL),
	(1536,'VCDDBIN','2020-03-27 16:10:58','2020-03-27 16:10:58',NULL,NULL),
	(1537,'VCLYCH91','2020-03-27 16:17:06','2020-03-27 16:17:06',NULL,NULL),
	(1538,'RDLYANHOUSE','2020-03-27 17:07:13','2020-03-27 17:07:13',NULL,NULL),
	(1539,'VCHDPHUONGYEN','2020-03-27 17:08:36','2020-03-27 17:08:36',NULL,NULL),
	(1540,'VCLYANHDE','2020-03-27 18:44:14','2020-03-27 18:44:14',NULL,NULL),
	(1541,'VCLYMANH','2020-03-27 20:44:42','2020-03-27 20:44:42',NULL,NULL),
	(1542,'VCLYLINHLINH','2020-03-27 20:46:30','2020-03-27 20:46:30',NULL,NULL),
	(1543,'VCLYPHUONG','2020-03-27 20:51:43','2020-03-27 20:51:43',NULL,NULL),
	(1544,'VCLYTATUET','2020-03-27 20:53:20','2020-03-27 20:53:20',NULL,NULL),
	(1545,'VCLYXUAN82','2020-03-27 20:55:09','2020-03-27 20:55:09',NULL,NULL),
	(1546,'VCHDHDHOAN','2020-03-28 10:33:26','2020-03-28 10:33:26',NULL,NULL),
	(1547,'VCLYTAKP','2020-03-28 11:46:32','2020-03-28 11:46:32',NULL,NULL),
	(1548,'VCLYHOA475','2020-03-28 15:21:21','2020-03-28 15:21:21',NULL,NULL),
	(1549,'VCMCLYMUMMY','2020-03-30 08:49:09','2020-03-30 08:49:09',NULL,NULL),
	(1550,'RDLYANHDE','2020-03-30 12:32:56','2020-03-30 12:32:56',NULL,NULL),
	(1551,'RDLYSGDUOIMO','2020-03-30 12:38:48','2020-03-30 12:38:48',NULL,NULL),
	(1552,'VCDDHAIDOAN','2020-03-30 14:05:58','2020-03-30 14:05:58',NULL,NULL),
	(1553,'VCLYTRANG84','2020-03-30 14:10:04','2020-03-30 14:10:04',NULL,NULL),
	(1554,'VCLYBACH','2020-03-30 14:25:10','2020-03-30 14:25:10',NULL,NULL),
	(1555,'VCDDMIN','2020-03-30 14:32:07','2020-03-30 14:32:07',NULL,NULL),
	(1556,'VCDDLINH91','2020-03-30 15:06:29','2020-03-30 15:06:29',NULL,NULL),
	(1557,'VCLYLN44','2020-03-30 15:09:57','2020-03-30 15:09:57',NULL,NULL),
	(1558,'VCLYTVAN94','2020-03-30 17:58:06','2020-03-30 17:58:06',NULL,NULL),
	(1559,'VCHDBICHGEM','2020-03-30 18:01:14','2020-03-30 18:01:14',NULL,NULL),
	(1560,'RDHDHADONG','2020-03-30 18:03:35','2020-03-30 18:03:35',NULL,NULL),
	(1561,'VCLYVANLE','2020-03-30 20:25:02','2020-03-30 20:25:02',NULL,NULL),
	(1562,'VCLYNHUNGTRAN','2020-03-30 20:40:40','2020-03-30 20:40:40',NULL,NULL),
	(1563,'VCLYKANGNGAM','2020-03-31 10:33:56','2020-03-31 10:33:56',NULL,NULL),
	(1564,'VCHDQA94','2020-03-31 10:58:17','2020-03-31 10:58:17',NULL,NULL),
	(1565,'VCLYALONG','2020-03-31 11:02:23','2020-03-31 11:02:23',NULL,NULL),
	(1566,'VCLTGIANGTQ','2020-03-31 11:17:46','2020-03-31 11:17:46',NULL,NULL),
	(1567,'VCLYKHANH','2020-03-31 11:50:13','2020-03-31 11:50:13',NULL,NULL),
	(1568,'VCHDQA84','2020-03-31 14:46:29','2020-03-31 14:46:29',NULL,NULL),
	(1569,'MCKT','2020-03-31 23:10:59','2020-03-31 23:10:59',NULL,NULL),
	(1570,'VCDN51','2020-04-01 10:44:27','2020-04-01 10:44:27',NULL,NULL),
	(1571,'VCLYHUG','2020-04-01 13:26:49','2020-04-01 13:26:49',NULL,NULL),
	(1572,'VCMCLYHUG','2020-04-01 14:00:31','2020-04-01 14:00:31',NULL,NULL),
	(1573,'VCBTLYKANGNAM','2020-04-03 09:29:07','2020-04-03 09:29:07',NULL,NULL),
	(1574,'VCBTKANGNAM','2020-04-03 09:49:23','2020-04-03 09:49:23',NULL,NULL),
	(1575,'VCBTDONHUNG','2020-04-03 10:03:50','2020-04-03 10:03:50',NULL,NULL),
	(1576,'VCBTHOAMAUDON','2020-04-03 10:05:27','2020-04-03 10:05:27',NULL,NULL),
	(1577,'VCBTTTL92','2020-04-03 10:07:57','2020-04-03 10:07:57',NULL,NULL),
	(1578,'VCBTMTHU03','2020-04-03 10:08:43','2020-04-03 10:08:43',NULL,NULL),
	(1579,'VCBTTUANANH','2020-04-03 10:09:44','2020-04-03 10:09:44',NULL,NULL),
	(1580,'VCBTHANH01','2020-04-03 10:11:01','2020-04-03 10:11:01',NULL,NULL),
	(1581,'VCBTDONGANH','2020-04-03 10:11:54','2020-04-03 10:11:54',NULL,NULL),
	(1582,'VCBTMANHTRUNG','2020-04-03 10:12:17','2020-04-03 10:12:17',NULL,NULL),
	(1583,'VCBTTHIEN','2020-04-03 10:13:52','2020-04-03 10:13:52',NULL,NULL),
	(1584,'VCBTMDIEP','2020-04-03 10:14:29','2020-04-03 10:14:29',NULL,NULL),
	(1585,'VCBTYN8820','2020-04-03 10:15:13','2020-04-03 10:15:13',NULL,NULL),
	(1586,'VCBTDUYLONG','2020-04-03 10:15:46','2020-04-03 10:15:46',NULL,NULL),
	(1587,'VCBTTRINH892','2020-04-03 10:17:14','2020-04-03 10:17:14',NULL,NULL),
	(1588,'VCBTDIEPTQ','2020-04-03 10:17:42','2020-04-03 10:17:42',NULL,NULL),
	(1589,'VCBTTONY','2020-04-03 10:18:25','2020-04-03 10:18:25',NULL,NULL),
	(1590,'VCBTXULE998','2020-04-03 10:20:09','2020-04-03 10:20:09',NULL,NULL),
	(1591,'VCBTMINHTTP','2020-04-03 10:21:47','2020-04-03 10:21:47',NULL,NULL),
	(1592,'VCBTPTL42','2020-04-03 10:27:44','2020-04-03 10:27:44',NULL,NULL),
	(1593,'VCBTVYVY','2020-04-03 10:28:42','2020-04-03 10:28:42',NULL,NULL),
	(1594,'VCBTHNHUE','2020-04-03 10:29:07','2020-04-03 10:29:07',NULL,NULL),
	(1595,'VCBTPHUNGYEN','2020-04-03 10:29:47','2020-04-03 10:29:47',NULL,NULL),
	(1596,'VCBTQNGA75','2020-04-03 10:30:12','2020-04-03 10:30:12',NULL,NULL),
	(1597,'VCBTCHIHUONG','2020-04-03 10:30:43','2020-04-03 10:30:43',NULL,NULL),
	(1598,'VCBTBAONGOC','2020-04-03 10:30:57','2020-04-03 10:30:57',NULL,NULL),
	(1599,'VCBTHUYEN94','2020-04-03 10:31:20','2020-04-03 10:31:20',NULL,NULL),
	(1600,'VCBTMOLY','2020-04-03 10:31:37','2020-04-03 10:31:37',NULL,NULL),
	(1601,'VCBTLINHLINH','2020-04-03 10:31:51','2020-04-03 10:31:51',NULL,NULL),
	(1602,'VCBTDIEUTHUY','2020-04-03 10:32:11','2020-04-03 10:32:11',NULL,NULL),
	(1603,'VCBTTIKI','2020-04-03 10:32:39','2020-04-03 10:32:39',NULL,NULL),
	(1604,'VCBTHONGNHUNG','2020-04-03 10:32:56','2020-04-03 10:32:56',NULL,NULL),
	(1605,'VCBTATHANG','2020-04-03 10:36:21','2020-04-03 10:36:21',NULL,NULL),
	(1606,'KTBT','2020-04-03 10:38:44','2020-04-03 10:38:44',NULL,NULL),
	(1607,'RDBTTIKI','2020-04-03 10:56:27','2020-04-03 10:56:27',NULL,NULL),
	(1608,'VCBTPHUNGSG','2020-04-03 11:15:31','2020-04-03 11:15:31',NULL,NULL),
	(1609,'RDBTSGAN','2020-04-03 11:17:47','2020-04-03 11:17:47',NULL,NULL),
	(1610,'RDSGBTPHUONG','2020-04-03 11:24:58','2020-04-03 11:24:58',NULL,NULL),
	(1611,'RDSGBTDUONG','2020-04-03 11:25:18','2020-04-03 11:25:18',NULL,NULL),
	(1612,'VCSGBTPQT','2020-04-03 11:25:41','2020-04-03 11:25:41',NULL,NULL),
	(1613,'VCBTANHDE','2020-04-03 11:27:33','2020-04-03 11:27:33',NULL,NULL),
	(1614,'RDDDBTTIKI','2020-04-03 11:29:08','2020-04-03 11:29:08',NULL,NULL),
	(1615,'RDBTTUANVU','2020-04-03 11:30:42','2020-04-03 11:30:42',NULL,NULL),
	(1616,'RDBTNGQUYNH','2020-04-03 11:37:15','2020-04-03 11:37:15',NULL,NULL),
	(1617,'RDBTKNGAN95','2020-04-03 11:53:56','2020-04-03 11:53:56',NULL,NULL),
	(1618,'RDBTTHU129','2020-04-03 11:54:33','2020-04-03 11:54:33',NULL,NULL),
	(1619,'RDBTDANGHANG','2020-04-03 11:56:25','2020-04-03 11:56:25',NULL,NULL),
	(1620,'RDDDBTLINH91','2020-04-03 11:57:27','2020-04-03 11:57:27',NULL,NULL),
	(1621,'VCBTHDTBHANG145','2020-04-03 13:52:06','2020-04-03 13:52:06',NULL,NULL),
	(1622,'VCBTHDGEM','2020-04-03 13:52:37','2020-04-03 13:52:37',NULL,NULL),
	(1623,'VCBTHDHADONG','2020-04-03 13:59:22','2020-04-03 13:59:22',NULL,NULL),
	(1624,'VCLYDUYCUONG','2020-04-03 14:08:56','2020-04-03 14:08:56',NULL,NULL),
	(1625,'VCBTHDHOA475','2020-04-03 14:14:49','2020-04-03 14:14:49',NULL,NULL),
	(1626,'VCLYFANGHOANG','2020-04-03 14:47:55','2020-04-03 14:47:55',NULL,NULL),
	(1627,'VCLYQUANG979','2020-04-03 14:55:23','2020-04-03 14:55:23',NULL,NULL),
	(1628,'VCBTNHY22','2020-04-03 16:45:17','2020-04-03 16:45:17',NULL,NULL),
	(1629,'RDSGSAU','2020-04-03 17:57:55','2020-04-03 17:57:55',NULL,NULL),
	(1630,'RDLYHUNG123','2020-04-03 18:22:05','2020-04-03 18:22:05',NULL,NULL),
	(1631,'RDLYHUEBN','2020-04-03 18:31:58','2020-04-03 18:31:58',NULL,NULL),
	(1632,'VCLYMR','2020-04-03 18:58:27','2020-04-03 18:58:27',NULL,NULL),
	(1633,'VCLYTRANHOA','2020-04-03 19:03:56','2020-04-03 19:03:56',NULL,NULL),
	(1634,'VCLYKIMPHUNG','2020-04-03 19:04:51','2020-04-03 19:04:51',NULL,NULL),
	(1635,'VCLYTHUYNGA','2020-04-03 19:09:22','2020-04-03 19:09:22',NULL,NULL),
	(1636,'VCLYDUYKHANH','2020-04-03 19:09:57','2020-04-03 19:09:57',NULL,NULL),
	(1637,'VCLYHOA','2020-04-03 19:13:15','2020-04-03 19:13:15',NULL,NULL),
	(1638,'VCLYDUONGCUU','2020-04-03 19:21:24','2020-04-03 19:21:24',NULL,NULL),
	(1639,'VCHDNGOC','2020-04-03 19:33:45','2020-04-03 19:33:45',NULL,NULL),
	(1640,'VCLYPHUONGVY','2020-04-03 19:38:55','2020-04-03 19:38:55',NULL,NULL),
	(1641,'VCLYSG12','2020-04-03 19:41:32','2020-04-03 19:41:32',NULL,NULL),
	(1642,'VCLYMRCONG','2020-04-03 19:42:16','2020-04-03 19:42:16',NULL,NULL),
	(1643,'RDHDPH237','2020-04-03 20:21:00','2020-04-03 20:21:00',NULL,NULL),
	(1644,'RDDDBTTKIEN','2020-04-04 10:14:57','2020-04-04 10:14:57',NULL,NULL),
	(1645,'BTHOA475','2020-04-04 11:50:11','2020-04-04 11:50:11',NULL,NULL),
	(1646,'BTYMMY29','2020-04-04 11:51:27','2020-04-04 11:51:27',NULL,NULL),
	(1647,'BTTBHANG145','2020-04-04 11:55:45','2020-04-04 11:55:45',NULL,NULL),
	(1648,'BTGEM','2020-04-04 11:56:44','2020-04-04 11:56:44',NULL,NULL),
	(1649,'RDBTTRUNG85','2020-04-04 11:58:47','2020-04-04 11:58:47',NULL,NULL),
	(1650,'VCBTHOA475','2020-04-04 12:02:23','2020-04-04 12:02:23',NULL,NULL),
	(1651,'VCBTGEM','2020-04-04 12:02:47','2020-04-04 12:02:47',NULL,NULL),
	(1652,'VCBTTBHANG145','2020-04-04 12:03:48','2020-04-04 12:03:48',NULL,NULL),
	(1653,'VCBTYMMY29','2020-04-04 12:05:03','2020-04-04 12:05:03',NULL,NULL),
	(1654,'VCBTHADONG','2020-04-04 12:06:40','2020-04-04 12:06:40',NULL,NULL),
	(1655,'RDBTTRONGTOAN','2020-04-04 12:07:22','2020-04-04 12:07:22',NULL,NULL),
	(1656,'RDBTTHUTHU','2020-04-04 12:08:20','2020-04-04 12:08:20',NULL,NULL),
	(1657,'RDHDBTHAIHA','2020-04-04 12:10:12','2020-04-04 12:10:12',NULL,NULL),
	(1658,'RDHDBTTHUHUYEN','2020-04-04 12:11:11','2020-04-04 12:11:11',NULL,NULL),
	(1659,'RDHDBTMINHTU','2020-04-04 12:11:40','2020-04-04 12:11:40',NULL,NULL),
	(1660,'VCMCHUG','2020-04-04 12:19:03','2020-04-04 12:19:03',NULL,NULL),
	(1661,'RDSGBTAN','2020-04-04 12:24:16','2020-04-04 12:24:16',NULL,NULL),
	(1662,'RDDDBTHONGVAN','2020-04-04 12:25:50','2020-04-04 12:25:50',NULL,NULL),
	(1663,'RDBTSAOMAI','2020-04-04 12:26:58','2020-04-04 12:26:58',NULL,NULL),
	(1664,'VCBTHUONGDAO','2020-04-04 12:36:31','2020-04-04 12:36:31',NULL,NULL),
	(1665,'VCBTNPTHAO','2020-04-04 12:41:29','2020-04-04 12:41:29',NULL,NULL),
	(1666,'VCBTHUEHAN','2020-04-04 12:41:43','2020-04-04 12:41:43',NULL,NULL),
	(1667,'VCBTLUUHANH','2020-04-04 12:42:18','2020-04-04 12:42:18',NULL,NULL),
	(1668,'VCBTNGUYENANH','2020-04-04 12:42:44','2020-04-04 12:42:44',NULL,NULL),
	(1669,'VCBTHANHLE','2020-04-04 12:43:58','2020-04-04 12:43:58',NULL,NULL),
	(1670,'VCBTHANA','2020-04-04 12:45:34','2020-04-04 12:45:34',NULL,NULL),
	(1671,'VCBTTATQ','2020-04-04 12:53:52','2020-04-04 12:53:52',NULL,NULL),
	(1672,'VCBTNGA667','2020-04-04 12:56:26','2020-04-04 12:56:26',NULL,NULL),
	(1673,'VCBTMUMMY','2020-04-04 14:19:40','2020-04-04 14:19:40',NULL,NULL),
	(1674,'VCLYADONG835','2020-04-04 14:23:27','2020-04-04 14:23:27',NULL,NULL),
	(1678,'bav','2020-06-26 11:12:06','2020-06-26 11:12:06',NULL,NULL),
	(1681,'thanh tung','2020-06-27 22:27:28','2020-06-27 22:27:28',NULL,NULL),
	(1682,'tungbav','2020-06-29 17:31:03','2020-06-29 17:31:03',NULL,NULL);

/*!40000 ALTER TABLE `transport_customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transport_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_order_items`;

CREATE TABLE `transport_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `cn_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `kg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cublic_meter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_drag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `warehouse_cn` int(11) DEFAULT 0 COMMENT '0: chua ve kho tq, 1: da ve kho tq',
  `warehouse_cn_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_vn` int(11) DEFAULT 0 COMMENT '0: chua ve kho vn, 1: da ve kho vn',
  `warehouse_vn_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_width` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_height` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_length` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transport_customer_id` int(11) DEFAULT NULL,
  `is_payment` int(11) DEFAULT 0 COMMENT '0: chua thanh toan, 1: da thanh toan',
  `user_id_updated` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `transport_order_items` WRITE;
/*!40000 ALTER TABLE `transport_order_items` DISABLE KEYS */;

INSERT INTO `transport_order_items` (`id`, `order_id`, `cn_code`, `price_service`, `kg`, `volume`, `cublic_meter`, `advance_drag`, `total_price`, `warehouse_cn`, `warehouse_cn_date`, `warehouse_vn`, `warehouse_vn_date`, `product_width`, `product_height`, `product_length`, `transport_customer_id`, `is_payment`, `user_id_updated`, `payment_type`, `note`, `created_at`, `updated_at`)
VALUES
	(11,3,'bav01','18000','10','120','0.720','10','180000',1,'2020-07-21 22:20:37',1,'2020-07-21 22:48:02','120','200','30',411,1,1,1,'HN nhận','2020-07-21 22:20:37','2020-07-22 09:49:03'),
	(12,3,'bav012','20000','5','41.67','0.250','15','833400',1,'2020-07-21 22:29:22',1,'2020-07-21 22:48:02','50','100','50',411,1,1,0,'0','2020-07-21 22:29:22','2020-07-22 09:49:03'),
	(13,3,'bav013','15000','50','300000','1800','50','27000000',1,'2020-07-21 22:29:46',1,'2020-07-21 22:50:19','1500','1200','1000',411,1,1,-1,'HN nhận','2020-07-21 22:29:46','2020-07-22 09:49:03'),
	(15,NULL,'bav04','0','0','0.00','0.000','0.00','0',1,'2020-07-22 11:36:10',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:36:10','2020-07-22 11:36:10'),
	(16,NULL,'bav045','0','2000','133.33','0.800','20.00','0',1,'2020-07-22 11:42:47',0,NULL,'20','2000','20',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:42:47','2020-07-22 11:42:47'),
	(17,NULL,'bav05','0','0','0.00','0.000','0.00','0',1,'2020-07-22 11:42:57',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:42:57','2020-07-22 11:42:57'),
	(18,NULL,'bav051','0','2000','1,333.33','8.000','0','0',1,'2020-07-22 11:44:09',0,NULL,'200','200','200',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:44:09','2020-07-22 11:44:09'),
	(19,NULL,'bav0126','0','0','0.00','0.000','0.00','0',1,'2020-07-22 11:44:26',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:44:26','2020-07-22 11:44:26'),
	(20,NULL,'bav91','0','0','0.00','0.000','0.00','0',1,'2020-07-22 11:46:15',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:46:15','2020-07-22 11:46:15'),
	(21,NULL,'bav81','0','0','0.00','0.000','0.00','0',1,'2020-07-22 11:47:04',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:47:04','2020-07-22 11:47:04'),
	(22,NULL,'bav82','0','0','0.00','0.000','0.00','0',1,'2020-07-22 11:47:24',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:47:24','2020-07-22 11:47:24'),
	(23,NULL,'bav823','0','0','0.00','0.000','0.00','0',1,'2020-07-22 11:49:07',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 11:49:07','2020-07-22 11:49:07'),
	(24,NULL,'bav999','0','0','0.00','0.000','0.00','0',1,'2020-07-22 13:50:45',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 13:50:45','2020-07-22 13:50:45'),
	(25,15,'bav1239','20000','50','0','0','0','1000000',1,'2020-07-22 13:51:55',1,'2020-07-22 15:27:04','0','0','0',411,1,1,1,'HN nhận','2020-07-22 13:51:55','2020-07-22 15:27:45'),
	(26,NULL,'bav23234234','0','0','0.00','0.000','0.00','0',1,'2020-07-22 14:37:01',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 14:37:01','2020-07-22 14:37:01'),
	(27,14,'bav12392','20000','20','1433.33','8.600','20','28666600',1,'2020-07-22 14:45:10',1,'2020-07-22 15:00:31','200','430','100',411,1,1,0,'HN nhận','2020-07-22 14:45:10','2020-07-22 15:07:34'),
	(28,4,'tung1','0','10','2000.0000','12.0000','20','0',1,'2020-07-22 14:48:14',1,'2020-07-22 14:48:27','200','300','200',411,1,1,0,'HN nhận','2020-07-22 14:48:14','2020-07-22 14:51:30'),
	(29,NULL,'bav9998','0','0','0.00','0.000','0.00','0',1,'2020-07-22 16:06:57',0,NULL,'0','0','0',NULL,0,1,NULL,'TQ nhận','2020-07-22 16:06:57','2020-07-22 16:06:57');

/*!40000 ALTER TABLE `transport_order_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transport_recharges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_recharges`;

CREATE TABLE `transport_recharges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `user_id_created` int(11) DEFAULT NULL,
  `money` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_recharge` int(11) NOT NULL DEFAULT 1 COMMENT '0   =>  ''Nạp tiền mặt'',\n                1   =>  ''Nạp tiền chuyển khoản'',\n                2   =>  ''Hoàn tiền'',\n                3   =>  ''Trừ tiền''',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `transport_recharges` WRITE;
/*!40000 ALTER TABLE `transport_recharges` DISABLE KEYS */;

INSERT INTO `transport_recharges` (`id`, `customer_id`, `user_id_created`, `money`, `type_recharge`, `content`, `created_at`, `updated_at`)
VALUES
	(24,411,1,'5000000',1,'Nạp tiền vào ví khách hàng thông qua hình thức chuyển khoản.','2020-07-20 11:28:30','2020-07-20 11:28:30'),
	(25,412,1,'2000000',1,'Nạp tiền vào ví khách hàng thông qua hình thức chuyển khoản.','2020-07-21 23:33:53','2020-07-21 23:33:53');

/*!40000 ALTER TABLE `transport_recharges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_active`, `phone_number`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin@gmail.com','$2y$10$QPGGFa5uGXUEtX7tNYqW/eXokuZswt0kgLdCeEU6tspUGVhWQZeU2',1,'0123456789','huztZ9w8M8bqiRadD3VXGztREGxrqaiGsC8D1YQyeefdmzIA6TfRHtFNPTUY','2019-08-21 22:54:16','2019-11-14 08:32:21'),
	(2,'Kế toán','ketoan@gmail.com','$2y$10$Dyx6M272E1PRMyw..Mol4eBt9VdZ3n8PJA2WdA8GDKTrEZpnIKHeS',1,'0123456781','UmZMJA7kSVzwhVbhFHWy9HmADtcHsI2Tw5GszyAyBpmqiXcWaRPU1hXHkx0X','2019-08-21 22:54:16','2019-09-17 17:02:22'),
	(3,'KhoTQ','kho@gmail.com','$2y$10$6Bnsei.B7prqBMUOAHWnI.KaEQb2PpYjlVy./E/p1nmI9yraX.ZZW',1,'0122456789','PrLLOFT70SAr91nTEl6KrLcra0QdJvpTqmbOxl7dTNfxFCdG1i3eFF18AIRT','2019-08-21 22:54:16','2019-09-13 17:27:20'),
	(4,'DUNG 03','chamsoc@gmail.com','$2y$10$Nq31L0RIkGaDnaQ3GyARyOMcUDa3QxjVjG8nDwSmdOkHcUSQIEfwG',1,'0123453892','BqJO8ddhRkt4cOCGjYfGBktcZU3gAhjh3SnXQhiHPPnWlIGpHvrVh5GZI527','2019-08-21 22:54:16','2019-11-06 11:14:24'),
	(5,'LONG ORDER','dathang@gmail.com','$2y$10$yHH.P055t/sbjn2UPJmcXeBfcXsoqEtD2HcxY7jWmQYVqHz4sO/gu',1,'01234532789','6r9duO5FxUT5GC9RusgMkFmcSUOl0iqDQ5BWWVGVj0OouTyAR8CZ5Ewrlbq3','2019-08-21 22:54:17','2019-09-17 17:54:13'),
	(6,'ketoankho','ketoankho@gmail.com','$2y$10$B9Ob3n4qBwwvd9YXCeOc6.DhhSYioDfI.8cCwWNBOH0vdU8RjabKu',1,'01230123012','6PmIie7QOEvrgpEyiB8DZ8ET2jYWEZPhoD1jaBvz24KZXE1BiS2KmJIiHybr','2019-08-22 18:43:58','2019-08-22 18:45:46'),
	(7,'kho2@gmail.com','kho2@gmail.com','$2y$10$sp01tlQLb1PNnUZ7K/TPoOI9GiytnEbmhsxFVRTJ2BM14sEmoVr22',1,'1231231234','EhZoV20IW9YCj7EcZoeYM9avoJaqhN4Edj2FQuMJ8ZNhO4R117Y0aVeK4bxK','2019-08-30 21:42:32','2019-08-30 21:42:32'),
	(8,'NGOCLONG','ngoclong187@gmail.com','$2y$10$yPx/7SwHMfbMqE./DDjRd.GH/AtAWQrQSw.mrpmset5Xqcn3RiLei',1,'0932225055','IS90bcLAFCcjB567wO2H0xnWBiihYLBB21RPdxMlBF26POPg5HCeJydFjQCm','2019-09-04 22:21:14','2019-09-04 22:21:14'),
	(9,'6322 Phạm Văn Hòa','hoapham2621985@gmail.com','$2y$10$GZ9mg/vH6Fto0Qz.Townj.SPy6vVbArvIGP6dsM3fSNUXgeBQ.yNy',1,'0359833901','vq4NT9OVSJ8dlb2J9L2F0jAy8KfEZu4UabMLi5REGSKrdl0mJA5kPJKRTxCW','2019-09-08 14:29:33','2019-11-05 13:49:30'),
	(10,'6322 C TRANG','Trangkhoorder@gmail.com','$2y$10$TLvIGDBtSerQjkZdzj2/f.vaBfF2wnMOgrHBTPcClxFlLrDfTqltG',1,'0867171008','vANuenkGMp1umS8r5VLnv09Z0l3ezF0LYm6TTkg5VVmY1N1GWr5ABzSJIGn7','2019-09-08 14:29:51','2019-11-21 10:35:25'),
	(11,'1305 Giang','lhgiang8597@gmail.com','$2y$10$Ujlghm.PaOkktKEXdbZjjONVv1MoLXjPdlz1PTCSYsRcH.m1DkCP2',1,'0867171009','FoXAIJOhilALCfcjowPNNUpoe6qIwT6LCWXnauQ054sUdKc5F0VfDwjG8BNN','2019-09-08 14:34:58','2019-11-05 13:48:59'),
	(12,'6322VC Hoàng Xuân Thu','hoangxuanthu@gmail.com','$2y$10$w8OMez0Q0NGEqv9kgoVngOtwvl0buj/Z4NFOiVfp18QZoZWDp7CiO',1,'0912488882','gOdJR5MVstfFHn9QvU4nHifGfzsCNOnF7QCExmWzKhHOZzBMU4WoZVqweaT7','2019-09-08 14:47:10','2019-11-05 13:48:34'),
	(13,'NgAnh','NgAnh@gmail.com','$2y$10$4tLk5.hkByel8yYuNIH/c.S4o2UFb5O3vs8Tn.ES9bjyszKr4kriW',0,'0377552468','0AYGhAoqNLzhAS2bVLu0O2s1ksBTUPf4MywsY2CH2zc6n88fAuJmyB903dGd','2019-09-10 13:04:34','2019-11-06 10:38:03'),
	(14,'1427 LONG HẢI','llh262626@gmail.com','$2y$10$fm64.CpDWztPq25VEj/ly.qj2rlmIoBsl0yX7V3aW6o2uVNmvbpA6',1,'0971226604','c2Laa2RO5GhWT6ufGel95dBPhSMdVMWvqtguuQ9sSdbAdWH7xVPomCkUnTFF','2019-09-12 17:47:53','2019-11-05 13:48:12'),
	(15,'LONG HẢI SALE','llh262626sale@gmail.com','$2y$10$DvPe9PRsXp/Yo7euXqaKL.u5Zuyta2j8saglt.P7IXwDznEP8UYwK',1,'0968794926','yqUP6H7e5x62JZDLYPRGgjvEh9t5Bm36nPTrysHRwkp3tpxQyOBMTJJXvdJS','2019-09-17 17:31:10','2019-10-22 23:35:41'),
	(16,'test ke toan','testketoan@gmail.com','$2y$10$BVUOxxiNxUx/BxJdC.9qFOKrUl5SCBUnN5AyuL4UjdCzddbzXfSha',1,'01324569873',NULL,'2019-09-18 14:02:59','2019-09-18 14:02:59'),
	(17,'DƯƠNG THU TRANG','trangdt0109@gmail.com','$2y$10$AvAhmml.uXzuSK3t1eaiYe2WOLjY1E2xnvzbcJWRF9EJ6izEa/Msy',0,'0904541804','3IH3KTcTLEbVkPA0JvCsbGHzgxUqqPqN64XoQbaEWOu8WvGABhOwpJeJlKkN','2019-09-24 11:28:22','2020-02-13 12:50:53'),
	(18,'6322 Tuấn Anh','TuanAnh@gmail.com','$2y$10$NhoCy9stD4sUB55Xff.vougbKshOD9YeNsZnselqa6eB3QSPsZuGK',0,'0971890998','0419hbjBTvh8QnbyGatLPWIvUGX4Bez4VVL2vX1DAQaVQhbZWwPZMB3HTrd3','2019-09-25 09:18:20','2019-12-02 15:01:17'),
	(19,'DungCSKH','phandung.hlu@gmail.com','$2y$10$fdo0jA2HuzvPNyfURXgPZOt7k6/8YwkiV2NX/Kc0Nm/n39DN5.5gW',1,'0358189540','tliHGqzVBgadmmdiTmAOXvAz1gcWI7g5PEfGMNlALc4v1KlnCbAwHhUPpeTz','2019-10-04 17:32:25','2019-10-04 17:32:25'),
	(20,'LAN PHƯƠNG','ptlphuongrn@gmail.com','$2y$10$ouWKB08lrSUqbbAKtPLMAuCZa4sGqENDA2uBwpAZR4ARYVFUT5am2',1,'0702218647','C7xru2r4xDTnyicKK3gt6lZatEtCoP7mRJjBtXOOKP9QLAGDT9Dg2CHhHoA7','2019-10-23 13:57:31','2019-10-23 13:57:41'),
	(21,'ĐỖ VĂN TRƯỜNG','Truongkhoorder@gmail.com','$2y$10$bfHtR0rEHEl7HnSL18Cote4WCUNLOwpUPk3hW1GVz0H/SmUgYnXbG',1,'0923628314','pqKF18AcDqomDlq2WabO6MntqkPZH76j4TayULJnTeOGJcSM1oDiCKPstHG2','2019-10-26 13:42:23','2019-10-26 13:42:23'),
	(22,'VC Trang Bé','trang.rdo@gmai.com','$2y$10$E8NZE1exXfdxdKe.cCyrvO8BMcXCx0z9MHMmUTDdJHGA7dpNZoaoy',1,'0867171002','9V3nxfzySCkvCo2VNce5VbA7E3pZSf71wE4MZZHijqwMkG9w3h0nNzvrr9v9','2019-10-28 09:48:55','2019-11-26 12:39:34'),
	(23,'Lê Tuấn Minh','minhlt.rongdologistics@gmail.com','$2y$10$Qru2VVcPLhstqx8aXUIhmepA3OmHXUsshlaPGD.JXhFUBQD5XcGgK',1,'0848292898','dHG4MG3g1wweWkUGMGaBXC5NT1pIl9JRGAyG5d9FmS9otjJUSHCPBqCRiiQL','2019-11-06 11:21:23','2019-11-11 11:37:45'),
	(24,'Vinh SALE','Vinhsale@gmail.com','$2y$10$pSm5VcrafoEeVUenqxXKmO.LHcTtRAaSC/g1KQgXvjEWY5V2f7wES',1,'0971226602',NULL,'2019-11-18 14:35:44','2019-11-18 14:35:44'),
	(25,'1305 Kho Order HĐ','khoorderhd@gmail.com','$2y$10$j/wOSrDof2AB/5zK3b0NJ.vZcwISo.wj7T4ZqumfibDgHCFV4eNMu',1,'0123456788','p2K8wMRZ1QwU4Nrkpe3QDHP4Xs0GTzGnMpUdeOo91SMRFHDuKdXXQ992Cohl','2019-11-26 10:24:51','2019-11-26 17:58:48'),
	(26,'Long sale','Ngoclong@gmail.com','$2y$10$uE4da3hgGdVZrwGmpEadheBUPeXk9nMVyYfS6slXBv3.E7OrL1zLK',1,'0971226601',NULL,'2019-12-01 23:49:56','2019-12-01 23:49:56'),
	(27,'Lữ Thu Hằng','luthuhang182@gmail.com','$2y$10$OYbgG4ikRKNfn3TgvhILye3F4FbLXfNlo/6gPxHxsVN8eJ5W6vjG.',1,'0582111481','bwHVvwN3RYurXGiWwi7oB3qQ2GTro4AvnKMrQmAb465Udt1T2MI8cqGCiFkd','2020-02-13 12:52:02','2020-02-13 12:52:02'),
	(28,'ÁNH NGỌC','anhngoc@gmail.com','$2y$10$WMD.jtf6p0uTqG27vI32.O7TLyzcejaeCeaBaP0BFdBLM/ZE0v9bW',1,'1133556699','Ao80H0qk2b2aOctkZRbNTGKoiS6RA4aV8Hp3T5g44dsLZQ48Z5Inke8w5Zei','2020-03-03 16:34:08','2020-03-03 16:34:08'),
	(29,'Vân Sale 001','vanchip.10@gmail.com','$2y$10$bp0HfFwob5VCK5vKlsXkUe.mb6N3W7tQUeCOogW7LEuFul39saP5q',1,'0977905543','gZbRskthMsHsEkbHGJY6kMq92u7Gu3cRqGKZcG4iUidqkkdCyUtMptwqLlwc','2020-03-16 15:35:32','2020-03-16 15:35:32'),
	(30,'CHỊ TĨNH BẰNG TƯỜNG','bt@gmail.com','$2y$10$0BRe3q9y1falWDMTrvZumuHUOInG0K/kzB1SXW23/v/mpgnQ2pgAq',1,'19978135229',NULL,'2020-03-24 23:43:42','2020-03-24 23:43:42');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ware_houses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ware_houses`;

CREATE TABLE `ware_houses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Không sử dụng, 1: có sử dụng',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ware_houses` WRITE;
/*!40000 ALTER TABLE `ware_houses` DISABLE KEYS */;

INSERT INTO `ware_houses` (`id`, `name`, `address`, `is_active`, `created_at`, `updated_at`)
VALUES
	(1,'Hà Nội','Hà Nội',0,'2019-08-21 23:02:55','2020-07-22 14:26:23'),
	(2,'HBT 6322',NULL,1,'2019-11-04 21:39:03','2019-11-26 17:33:14'),
	(3,'CẦU GIẤY 1427',NULL,1,'2019-11-04 21:39:46','2019-11-26 17:33:06'),
	(4,'THANH XUÂN 1305',NULL,1,'2019-11-04 21:40:37','2019-11-26 17:32:57'),
	(5,'DD - HCM 1708',NULL,1,'2019-11-05 13:39:54','2020-02-03 11:56:36');

/*!40000 ALTER TABLE `ware_houses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table website_configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `website_configs`;

CREATE TABLE `website_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_configs_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `website_configs` WRITE;
/*!40000 ALTER TABLE `website_configs` DISABLE KEYS */;

INSERT INTO `website_configs` (`id`, `name`, `content`, `created_at`, `updated_at`, `display_name`, `link`)
VALUES
	(1,'hotline','0392836868','2019-08-21 22:54:17','2019-09-13 01:23:15','Đường dây nóng',NULL),
	(2,'facebook_url','https://facebook.com','2019-08-21 22:54:17','2019-08-21 22:54:17','Đường dẫn facebook',NULL),
	(3,'email','Rongdo.order@gmail.com','2019-08-21 22:54:17','2019-09-13 01:48:57','Địa chỉ email',NULL),
	(4,'payment_cash','<p>0971.22.66.05</p>','2019-08-21 22:54:17','2019-11-08 00:23:25','Thanh toán tiền mặt',NULL),
	(5,'payment_transfer','<p>- VCB Hanoi: 0011004235539 LE LONG HAI</p>\n\n<p>- Techcombank Thang Long: 19032066328661 LE LONG HAI</p>\n\n<p>- BIDV Hanoi: 21610000503033 LE LONG HAI</p>','2019-08-21 22:54:17','2019-09-13 01:48:06','Thanh toán chuyển khoản',NULL),
	(6,'popup_image','1583138258.png','2019-08-21 22:54:17','2020-03-02 15:37:43','Popup Quảng cáo',NULL);

/*!40000 ALTER TABLE `website_configs` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
