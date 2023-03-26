-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 29, 2022 at 03:30 PM
-- Server version: 8.0.27
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermart`
--
CREATE DATABASE IF NOT EXISTS `supermart` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `supermart`;

-- --------------------------------------------------------

--
-- Table structure for table `administration_category`
--

DROP TABLE IF EXISTS `administration_category`;
CREATE TABLE IF NOT EXISTS `administration_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `administration_category`
--

INSERT INTO `administration_category` (`id`, `name`, `caption`, `logo`) VALUES
(1, 'Fish & Meat', 'fresh meat', 'category/4f9ba3fd-caa9-48d5-88b4-e288fc80fcca.png'),
(2, 'Fruits & Vegetables', 'fresh F&V', 'category/281437872025201.webp'),
(3, 'Dairy', 'Dairy', 'category/1002ca36-ce03-4b7f-aafd-193d58ef1eb9.png'),
(4, 'Toiletries', 'toiletries', 'category/download.png'),
(5, 'Household & Cleaning', 'Household/cleaning', 'category/download_1.png'),
(6, 'Frozen prepared foods', 'Frozen prepared foods', 'category/180212_Frozen_Slimzone_Meals_Bundle.jfif'),
(7, 'Bakery', 'bakery', 'category/shutterstock_176646242.jpg'),
(8, 'Soft Drinks', 'Coca-Cola. Pepsi. Diet Coke.', 'category/resize.webp');

-- --------------------------------------------------------

--
-- Table structure for table `administration_city`
--

DROP TABLE IF EXISTS `administration_city`;
CREATE TABLE IF NOT EXISTS `administration_city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `pincode` int NOT NULL,
  `deliverable` varchar(3) NOT NULL,
  `district` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administration_city_city_7d8d18c9_uniq` (`city`),
  UNIQUE KEY `administration_city_city_district_pincode_7d3e8b45_uniq` (`city`,`district`,`pincode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `administration_city`
--

INSERT INTO `administration_city` (`id`, `city`, `pincode`, `deliverable`, `district`) VALUES
(1, 'Adivaram', 686582, 'NO', 'Kottayam'),
(2, 'Adukkam', 686580, 'NO', 'Kottayam'),
(3, 'Amalagiri', 686561, 'YES', 'Kottayam'),
(4, 'Apporkara', 686008, 'YES', 'Kottayam'),
(5, 'Arunapuram', 686574, 'YES', 'Kottayam'),
(6, 'Aruvikuzhy', 686503, 'YES', 'Kottayam'),
(7, 'Bharananganam', 686578, 'YES', 'Kottayam'),
(8, 'Brahmamangalam', 686605, 'YES', 'Kottayam'),
(9, 'Chakkampuzha', 686574, 'YES', 'Kottayam'),
(10, 'Changanacherry', 686101, 'YES', 'Kottayam'),
(11, 'Chempilavu B.O', 686584, 'YES', 'Kottayam'),
(12, 'Chengalam', 686585, 'YES', 'Kottayam'),
(13, 'Devagiri', 686555, 'YES', 'Kottayam');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add order', 7, 'add_order'),
(26, 'Can change order', 7, 'change_order'),
(27, 'Can delete order', 7, 'delete_order'),
(28, 'Can view order', 7, 'view_order'),
(29, 'Can add order items', 8, 'add_orderitems'),
(30, 'Can change order items', 8, 'change_orderitems'),
(31, 'Can delete order items', 8, 'delete_orderitems'),
(32, 'Can view order items', 8, 'view_orderitems'),
(33, 'Can add review', 9, 'add_review'),
(34, 'Can change review', 9, 'change_review'),
(35, 'Can delete review', 9, 'delete_review'),
(36, 'Can view review', 9, 'view_review'),
(37, 'Can add online order', 10, 'add_onlineorder'),
(38, 'Can change online order', 10, 'change_onlineorder'),
(39, 'Can delete online order', 10, 'delete_onlineorder'),
(40, 'Can view online order', 10, 'view_onlineorder'),
(41, 'Can add online order items', 11, 'add_onlineorderitems'),
(42, 'Can change online order items', 11, 'change_onlineorderitems'),
(43, 'Can delete online order items', 11, 'delete_onlineorderitems'),
(44, 'Can view online order items', 11, 'view_onlineorderitems'),
(45, 'Can add query', 12, 'add_query'),
(46, 'Can change query', 12, 'change_query'),
(47, 'Can delete query', 12, 'delete_query'),
(48, 'Can view query', 12, 'view_query'),
(49, 'Can add complaint_query', 13, 'add_complaint_query'),
(50, 'Can change complaint_query', 13, 'change_complaint_query'),
(51, 'Can delete complaint_query', 13, 'delete_complaint_query'),
(52, 'Can view complaint_query', 13, 'view_complaint_query'),
(53, 'Can add customer', 14, 'add_customer'),
(54, 'Can change customer', 14, 'change_customer'),
(55, 'Can delete customer', 14, 'delete_customer'),
(56, 'Can view customer', 14, 'view_customer'),
(57, 'Can add shipping', 15, 'add_shipping'),
(58, 'Can change shipping', 15, 'change_shipping'),
(59, 'Can delete shipping', 15, 'delete_shipping'),
(60, 'Can view shipping', 15, 'view_shipping'),
(61, 'Can add product', 16, 'add_product'),
(62, 'Can change product', 16, 'change_product'),
(63, 'Can delete product', 16, 'delete_product'),
(64, 'Can view product', 16, 'view_product'),
(65, 'Can add product image', 17, 'add_productimage'),
(66, 'Can change product image', 17, 'change_productimage'),
(67, 'Can delete product image', 17, 'delete_productimage'),
(68, 'Can view product image', 17, 'view_productimage'),
(69, 'Can add city', 18, 'add_city'),
(70, 'Can change city', 18, 'change_city'),
(71, 'Can delete city', 18, 'delete_city'),
(72, 'Can view city', 18, 'view_city'),
(73, 'Can add category', 19, 'add_category'),
(74, 'Can change category', 19, 'change_category'),
(75, 'Can delete category', 19, 'delete_category'),
(76, 'Can view category', 19, 'view_category'),
(77, 'Can add staff', 20, 'add_staff'),
(78, 'Can change staff', 20, 'change_staff'),
(79, 'Can delete staff', 20, 'delete_staff'),
(80, 'Can view staff', 20, 'view_staff');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$iICaULcIB0DzVCUA89tjET$n0gQ3uFxvAZc8ZiVmmfmuk7zq9wc/DdQjWa9c5oiHcs=', '2022-04-29 15:27:23.459328', 1, 'admin', '', '', 'admin@supermart.com', 1, 1, '2022-04-29 14:56:48.698729'),
(2, 'pbkdf2_sha256$260000$0AJhg2XLqpCC2SH9QzGujU$dy6jPPDjJWtOyL7/PebmJ+f86t8WFEquZ+RS2w7jfZA=', '2022-04-29 15:09:18.837015', 0, 'jess', 'Jeslin', 'George', 'jess@gmail.com', 1, 1, '2022-04-29 15:04:06.054055'),
(3, 'pbkdf2_sha256$260000$RFR1etQ60JSiZhUaRC0fMV$UkyU7OxyGbMdqbH8xcXdNDhrUTn/EdpMIdB+zIzc1kg=', '2022-04-29 15:27:11.920898', 0, 'tomin', 'Tomin', 'James', 'tominjames@live.com', 0, 1, '2022-04-29 15:07:50.992929');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(19, 'administration', 'category'),
(18, 'administration', 'city'),
(20, 'administration', 'staff'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(13, 'e_commerce', 'complaint_query'),
(10, 'e_commerce', 'onlineorder'),
(11, 'e_commerce', 'onlineorderitems'),
(7, 'e_commerce', 'order'),
(8, 'e_commerce', 'orderitems'),
(12, 'e_commerce', 'query'),
(9, 'e_commerce', 'review'),
(16, 'product_manager', 'product'),
(17, 'product_manager', 'productimage'),
(6, 'sessions', 'session'),
(14, 'user_manager', 'customer'),
(15, 'user_manager', 'shipping');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-29 14:56:09.583824'),
(2, 'auth', '0001_initial', '2022-04-29 14:56:10.448297'),
(3, 'admin', '0001_initial', '2022-04-29 14:56:10.638307'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-29 14:56:10.649641'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-29 14:56:10.668303'),
(6, 'administration', '0001_initial', '2022-04-29 14:56:10.698544'),
(7, 'administration', '0002_auto_20210411_2344', '2022-04-29 14:56:10.718412'),
(8, 'administration', '0003_auto_20210412_0938', '2022-04-29 14:56:10.748886'),
(9, 'administration', '0004_auto_20210412_0941', '2022-04-29 14:56:10.818490'),
(10, 'administration', '0005_city_status', '2022-04-29 14:56:10.848572'),
(11, 'administration', '0006_auto_20210412_1000', '2022-04-29 14:56:10.868417'),
(12, 'administration', '0007_city_district', '2022-04-29 14:56:10.898412'),
(13, 'administration', '0008_auto_20210412_1906', '2022-04-29 14:56:10.919379'),
(14, 'administration', '0009_category', '2022-04-29 14:56:10.958460'),
(15, 'administration', '0010_product', '2022-04-29 14:56:10.999432'),
(16, 'administration', '0011_delete_product', '2022-04-29 14:56:11.018280'),
(17, 'administration', '0012_staff', '2022-04-29 14:56:11.228330'),
(18, 'administration', '0013_staff_mobile', '2022-04-29 14:56:11.269954'),
(19, 'administration', '0014_auto_20210529_1134', '2022-04-29 14:56:11.445521'),
(20, 'administration', '0015_auto_20210529_1221', '2022-04-29 14:56:11.573337'),
(21, 'administration', '0016_staff_city', '2022-04-29 14:56:11.668306'),
(22, 'contenttypes', '0002_remove_content_type_name', '2022-04-29 14:56:11.810529'),
(23, 'auth', '0002_alter_permission_name_max_length', '2022-04-29 14:56:11.890874'),
(24, 'auth', '0003_alter_user_email_max_length', '2022-04-29 14:56:11.986296'),
(25, 'auth', '0004_alter_user_username_opts', '2022-04-29 14:56:11.998655'),
(26, 'auth', '0005_alter_user_last_login_null', '2022-04-29 14:56:12.068608'),
(27, 'auth', '0006_require_contenttypes_0002', '2022-04-29 14:56:12.082336'),
(28, 'auth', '0007_alter_validators_add_error_messages', '2022-04-29 14:56:12.093569'),
(29, 'auth', '0008_alter_user_username_max_length', '2022-04-29 14:56:12.184722'),
(30, 'auth', '0009_alter_user_last_name_max_length', '2022-04-29 14:56:12.274286'),
(31, 'auth', '0010_alter_group_name_max_length', '2022-04-29 14:56:12.358622'),
(32, 'auth', '0011_update_proxy_permissions', '2022-04-29 14:56:12.373469'),
(33, 'auth', '0012_alter_user_first_name_max_length', '2022-04-29 14:56:12.468299'),
(34, 'product_manager', '0001_initial', '2022-04-29 14:56:12.718783'),
(35, 'product_manager', '0002_auto_20210410_1511', '2022-04-29 14:56:12.768360'),
(36, 'product_manager', '0003_auto_20210411_1857', '2022-04-29 14:56:12.812287'),
(37, 'product_manager', '0004_auto_20210512_1937', '2022-04-29 14:56:13.019781'),
(38, 'product_manager', '0005_auto_20210512_2019', '2022-04-29 14:56:13.228725'),
(39, 'product_manager', '0006_auto_20210528_1858', '2022-04-29 14:56:13.473338'),
(40, 'product_manager', '0007_auto_20210528_1900', '2022-04-29 14:56:13.558449'),
(41, 'product_manager', '0008_auto_20210528_1929', '2022-04-29 14:56:13.588632'),
(42, 'product_manager', '0009_product_price', '2022-04-29 14:56:13.628649'),
(43, 'e_commerce', '0001_initial', '2022-04-29 14:56:13.868513'),
(44, 'e_commerce', '0002_review', '2022-04-29 14:56:13.998288'),
(45, 'e_commerce', '0003_auto_20210605_2008', '2022-04-29 14:56:14.150769'),
(46, 'e_commerce', '0004_review_title', '2022-04-29 14:56:14.188666'),
(47, 'e_commerce', '0005_alter_review_picture', '2022-04-29 14:56:14.198623'),
(48, 'e_commerce', '0006_review_user', '2022-04-29 14:56:14.310335'),
(49, 'e_commerce', '0007_alter_review_user', '2022-04-29 14:56:14.485503'),
(50, 'e_commerce', '0008_alter_review_unique_together', '2022-04-29 14:56:14.518852'),
(51, 'e_commerce', '0009_alter_review_rating', '2022-04-29 14:56:14.664273'),
(52, 'e_commerce', '0010_onlineorder_onlineorderitems', '2022-04-29 14:56:15.030284'),
(53, 'e_commerce', '0011_onlineorder_is_shipped', '2022-04-29 14:56:15.078421'),
(54, 'e_commerce', '0012_onlineorderitems_uprice', '2022-04-29 14:56:15.178397'),
(55, 'e_commerce', '0013_rename_product_id_onlineorderitems_product', '2022-04-29 14:56:15.361306'),
(56, 'e_commerce', '0014_auto_20210712_1305', '2022-04-29 14:56:15.378526'),
(57, 'e_commerce', '0015_query', '2022-04-29 14:56:15.508678'),
(58, 'e_commerce', '0016_complaint_query', '2022-04-29 14:56:15.632276'),
(59, 'product_manager', '0010_product_modified_on', '2022-04-29 14:56:15.693370'),
(60, 'sessions', '0001_initial', '2022-04-29 14:56:15.744346'),
(61, 'user_manager', '0001_initial', '2022-04-29 14:56:16.089656'),
(62, 'user_manager', '0002_auto_20210411_2344', '2022-04-29 14:56:16.128378'),
(63, 'user_manager', '0003_auto_20210605_0856', '2022-04-29 14:56:16.298698'),
(64, 'user_manager', '0004_alter_customer_address', '2022-04-29 14:56:16.388286'),
(65, 'user_manager', '0005_alter_customer_user', '2022-04-29 14:56:16.598511');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `e_commerce_complaint_query`
--

DROP TABLE IF EXISTS `e_commerce_complaint_query`;
CREATE TABLE IF NOT EXISTS `e_commerce_complaint_query` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `e_commerce_complaint_query_user_id_f4819de0_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `e_commerce_onlineorder`
--

DROP TABLE IF EXISTS `e_commerce_onlineorder`;
CREATE TABLE IF NOT EXISTS `e_commerce_onlineorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_dt` datetime(6) NOT NULL,
  `shipping_address` longtext NOT NULL,
  `billing_address` longtext NOT NULL,
  `grandtotal` double NOT NULL,
  `user_id` int NOT NULL,
  `is_shipped` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `e_commerce_onlineorder_user_id_bbd1bb3c_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `e_commerce_onlineorder`
--

INSERT INTO `e_commerce_onlineorder` (`id`, `order_dt`, `shipping_address`, `billing_address`, `grandtotal`, `user_id`, `is_shipped`) VALUES
(1, '2022-04-29 15:08:31.782691', 'Tharappel, Thomas Villa,\nAthirampuzha P.O,\nKottayam\nKerala pincode:686582', 'Tomin James, Tharappel, Thomas Villa,\nAthirampuzha P.O,\nKottayam\nKerala pincode:686582', 75, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `e_commerce_onlineorderitems`
--

DROP TABLE IF EXISTS `e_commerce_onlineorderitems`;
CREATE TABLE IF NOT EXISTS `e_commerce_onlineorderitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) NOT NULL,
  `quanitiy` int NOT NULL,
  `totalprice` double NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `uprice` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `e_commerce_onlineord_order_id_3617e5fe_fk_e_commerc` (`order_id`),
  KEY `e_commerce_onlineorderitems_product_id_0d2ba611_fk_Products_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `e_commerce_onlineorderitems`
--

INSERT INTO `e_commerce_onlineorderitems` (`id`, `product_name`, `quanitiy`, `totalprice`, `order_id`, `product_id`, `uprice`) VALUES
(1, 'Milk', 3, 75, 1, 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `e_commerce_order`
--

DROP TABLE IF EXISTS `e_commerce_order`;
CREATE TABLE IF NOT EXISTS `e_commerce_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_mobile` varchar(10) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `order_total_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `e_commerce_order`
--

INSERT INTO `e_commerce_order` (`id`, `customer_mobile`, `order_date`, `order_total_price`) VALUES
(1, '8281935649', '2022-04-29 15:04:51.204647', 75);

-- --------------------------------------------------------

--
-- Table structure for table `e_commerce_orderitems`
--

DROP TABLE IF EXISTS `e_commerce_orderitems`;
CREATE TABLE IF NOT EXISTS `e_commerce_orderitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) NOT NULL,
  `unit_price` double NOT NULL,
  `count` int NOT NULL,
  `price` double NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `e_commerce_orderitems_order_id_1f38ea44_fk_e_commerce_order_id` (`order_id`),
  KEY `e_commerce_orderitems_product_id_fdfa911d_fk_Products_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `e_commerce_orderitems`
--

INSERT INTO `e_commerce_orderitems` (`id`, `product_name`, `unit_price`, `count`, `price`, `order_id`, `product_id`) VALUES
(1, 'Milk', 25, 3, 75, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `e_commerce_query`
--

DROP TABLE IF EXISTS `e_commerce_query`;
CREATE TABLE IF NOT EXISTS `e_commerce_query` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `e_commerce_query_user_id_9cbdb635_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `e_commerce_query`
--

INSERT INTO `e_commerce_query` (`id`, `title`, `image`, `description`, `user_id`) VALUES
(1, 'Service is too bad', '', 'Broken Package', 3);

-- --------------------------------------------------------

--
-- Table structure for table `e_commerce_review`
--

DROP TABLE IF EXISTS `e_commerce_review`;
CREATE TABLE IF NOT EXISTS `e_commerce_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `picture` varchar(100) DEFAULT NULL,
  `rating` double NOT NULL,
  `review` longtext NOT NULL,
  `reviewed_dt` datetime(6) NOT NULL,
  `product_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e_commerce_review_product_id_user_id_4f8998f8_uniq` (`product_id`,`user_id`),
  KEY `e_commerce_review_user_id_3d660eef` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
CREATE TABLE IF NOT EXISTS `productimages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_manager_prod_product_id_9cfc899c_fk_product_m` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`id`, `image`, `product_id`) VALUES
(1, 'product/images/weZ33UEzkXZO6UpWh4X0_tNPusTB_vh6s2Gu.jpg', 1),
(2, 'product/images/milma-milk-500-ml-blue_L1HIjlI.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `reorder_lvl` int NOT NULL,
  `unit_of_measure` varchar(10) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `stock` int NOT NULL,
  `tags` varchar(250) NOT NULL,
  `category_id` int NOT NULL,
  `price` double NOT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Products_sku_4f2f8ae5_uniq` (`sku`),
  KEY `product_manager_prod_category_id_be29f6d7_fk_administr` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `reorder_lvl`, `unit_of_measure`, `created_date`, `stock`, `tags`, `category_id`, `price`, `modified_on`) VALUES
(1, 'Milk', '1011', 100, 'PACKET', '2022-04-29 15:00:39.368581', 194, 'dairy,milk, every day', 3, 25, '2022-04-29 15:08:31.792797');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
CREATE TABLE IF NOT EXISTS `staffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `user_id` int DEFAULT NULL,
  `mobile` varchar(10) NOT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `staffs_city_id_f5c017c8_fk_administration_city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `avatar`, `address`, `user_id`, `mobile`, `district`, `city_id`) VALUES
(1, 'staff/profile_pic/card-profile1-square_hv61eRa.jpg', 'Tharappel,\r\nThomas Villa,\r\nAthirampuzha P.O,\r\nKottayam', 2, '8281935647', 'Kottayam', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_manager_customer`
--

DROP TABLE IF EXISTS `user_manager_customer`;
CREATE TABLE IF NOT EXISTS `user_manager_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `city_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_manager_customer_mobile_f2ffc845_uniq` (`mobile`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_manager_customer_city_id_ec45f043_fk_administration_city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_manager_customer`
--

INSERT INTO `user_manager_customer` (`id`, `profile_pic`, `address`, `mobile`, `city_id`, `user_id`, `district`) VALUES
(1, 'users/profile_pics/269026892005201.jpg', 'Tharappel, Thomas Villa,\r\nAthirampuzha P.O,\r\nKottayam\r\nKerala', '8281935649', 1, 3, 'Kottayam');

-- --------------------------------------------------------

--
-- Table structure for table `user_manager_shipping`
--

DROP TABLE IF EXISTS `user_manager_shipping`;
CREATE TABLE IF NOT EXISTS `user_manager_shipping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` longtext NOT NULL,
  `address_line_2` longtext,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_manager_shipping_city_id_e420db70_fk_administration_city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `e_commerce_complaint_query`
--
ALTER TABLE `e_commerce_complaint_query`
  ADD CONSTRAINT `e_commerce_complaint_query_user_id_f4819de0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `e_commerce_onlineorder`
--
ALTER TABLE `e_commerce_onlineorder`
  ADD CONSTRAINT `e_commerce_onlineorder_user_id_bbd1bb3c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `e_commerce_onlineorderitems`
--
ALTER TABLE `e_commerce_onlineorderitems`
  ADD CONSTRAINT `e_commerce_onlineord_order_id_3617e5fe_fk_e_commerc` FOREIGN KEY (`order_id`) REFERENCES `e_commerce_onlineorder` (`id`),
  ADD CONSTRAINT `e_commerce_onlineorderitems_product_id_0d2ba611_fk_Products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `e_commerce_orderitems`
--
ALTER TABLE `e_commerce_orderitems`
  ADD CONSTRAINT `e_commerce_orderitems_order_id_1f38ea44_fk_e_commerce_order_id` FOREIGN KEY (`order_id`) REFERENCES `e_commerce_order` (`id`),
  ADD CONSTRAINT `e_commerce_orderitems_product_id_fdfa911d_fk_Products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `e_commerce_query`
--
ALTER TABLE `e_commerce_query`
  ADD CONSTRAINT `e_commerce_query_user_id_9cbdb635_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `e_commerce_review`
--
ALTER TABLE `e_commerce_review`
  ADD CONSTRAINT `e_commerce_review_product_id_246cb4ce_fk_Products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `e_commerce_review_user_id_3d660eef_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `product_manager_prod_product_id_9cfc899c_fk_product_m` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_manager_prod_category_id_be29f6d7_fk_administr` FOREIGN KEY (`category_id`) REFERENCES `administration_category` (`id`);

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_city_id_f5c017c8_fk_administration_city_id` FOREIGN KEY (`city_id`) REFERENCES `administration_city` (`id`),
  ADD CONSTRAINT `staffs_user_id_abfc51df_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_manager_customer`
--
ALTER TABLE `user_manager_customer`
  ADD CONSTRAINT `user_manager_customer_city_id_ec45f043_fk_administration_city_id` FOREIGN KEY (`city_id`) REFERENCES `administration_city` (`id`),
  ADD CONSTRAINT `user_manager_customer_user_id_bc26ec41_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_manager_shipping`
--
ALTER TABLE `user_manager_shipping`
  ADD CONSTRAINT `user_manager_shipping_city_id_e420db70_fk_administration_city_id` FOREIGN KEY (`city_id`) REFERENCES `administration_city` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
