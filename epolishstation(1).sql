-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 04, 2021 at 10:24 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epolishstation`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_email_address_id_5b7f8c58` (`email_address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

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
(25, 'Can add signup', 7, 'add_signup'),
(26, 'Can change signup', 7, 'change_signup'),
(27, 'Can delete signup', 7, 'delete_signup'),
(28, 'Can view signup', 7, 'view_signup'),
(29, 'Can add feedback', 8, 'add_feedback'),
(30, 'Can change feedback', 8, 'change_feedback'),
(31, 'Can delete feedback', 8, 'delete_feedback'),
(32, 'Can view feedback', 8, 'view_feedback'),
(33, 'Can add case', 9, 'add_case'),
(34, 'Can change case', 9, 'change_case'),
(35, 'Can delete case', 9, 'delete_case'),
(36, 'Can view case', 9, 'view_case'),
(37, 'Can add contactmodel', 10, 'add_contactmodel'),
(38, 'Can change contactmodel', 10, 'change_contactmodel'),
(39, 'Can delete contactmodel', 10, 'delete_contactmodel'),
(40, 'Can view contactmodel', 10, 'view_contactmodel'),
(41, 'Can add emergencynumbermodel', 11, 'add_emergencynumbermodel'),
(42, 'Can change emergencynumbermodel', 11, 'change_emergencynumbermodel'),
(43, 'Can delete emergencynumbermodel', 11, 'delete_emergencynumbermodel'),
(44, 'Can view emergencynumbermodel', 11, 'view_emergencynumbermodel'),
(45, 'Can add casestatus', 12, 'add_casestatus'),
(46, 'Can change casestatus', 12, 'change_casestatus'),
(47, 'Can delete casestatus', 12, 'delete_casestatus'),
(48, 'Can view casestatus', 12, 'view_casestatus'),
(49, 'Can add site', 13, 'add_site'),
(50, 'Can change site', 13, 'change_site'),
(51, 'Can delete site', 13, 'delete_site'),
(52, 'Can view site', 13, 'view_site'),
(53, 'Can add email address', 14, 'add_emailaddress'),
(54, 'Can change email address', 14, 'change_emailaddress'),
(55, 'Can delete email address', 14, 'delete_emailaddress'),
(56, 'Can view email address', 14, 'view_emailaddress'),
(57, 'Can add email confirmation', 15, 'add_emailconfirmation'),
(58, 'Can change email confirmation', 15, 'change_emailconfirmation'),
(59, 'Can delete email confirmation', 15, 'delete_emailconfirmation'),
(60, 'Can view email confirmation', 15, 'view_emailconfirmation'),
(61, 'Can add social account', 16, 'add_socialaccount'),
(62, 'Can change social account', 16, 'change_socialaccount'),
(63, 'Can delete social account', 16, 'delete_socialaccount'),
(64, 'Can view social account', 16, 'view_socialaccount'),
(65, 'Can add social application', 17, 'add_socialapp'),
(66, 'Can change social application', 17, 'change_socialapp'),
(67, 'Can delete social application', 17, 'delete_socialapp'),
(68, 'Can view social application', 17, 'view_socialapp'),
(69, 'Can add social application token', 18, 'add_socialtoken'),
(70, 'Can change social application token', 18, 'change_socialtoken'),
(71, 'Can delete social application token', 18, 'delete_socialtoken'),
(72, 'Can view social application token', 18, 'view_socialtoken'),
(73, 'Can add commisnermodel', 19, 'add_commisnermodel'),
(74, 'Can change commisnermodel', 19, 'change_commisnermodel'),
(75, 'Can delete commisnermodel', 19, 'delete_commisnermodel'),
(76, 'Can view commisnermodel', 19, 'view_commisnermodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$4UdzgE2NtNhe$/vRfo9zIsT42jT78Q5Z7JKC51DlOzpUPeGvOEZAs0KY=', '2021-02-23 17:48:46.576628', 1, 'admin', '', '', 'pythondjango13@gmail.com', 1, 1, '2021-02-23 15:10:03.981619'),
(2, '!CGokXfw9JUsb7U87bfNkJDdQxLdic4NQENcW4dyb', '2021-03-03 05:06:54.298656', 0, 'python', 'Python', 'Django', '', 0, 1, '2021-02-23 15:23:47.056487'),
(3, 'pbkdf2_sha256$216000$CmKonN9LXtBI$jTkcicxL+EapH/mtT7fHHWneeDC1c/keleEx8sOuU0A=', '2021-02-28 12:36:37.261988', 1, 'admin111', '', '', 'pythondjango13@gmail.com', 1, 1, '2021-02-28 12:36:12.168968'),
(4, 'pbkdf2_sha256$216000$5IigfovFY0BK$7+lpDDfBY0FHiFb9CMEqwy4MVmJXYA2GoiMC0dUB3y8=', '2021-03-03 05:13:09.478002', 1, 'nehal', '', '', 'nehal.pan17@gmail.com', 1, 1, '2021-03-03 05:12:37.529565');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-02-23 15:18:06.191476', '1', 'facebook_Auth', 1, '[{\"added\": {}}]', 17, 1),
(2, '2021-02-23 15:19:51.328985', '2', 'insta_auth', 1, '[{\"added\": {}}]', 17, 1),
(3, '2021-02-23 15:23:18.979166', '3', 'google_auth', 1, '[{\"added\": {}}]', 17, 1),
(4, '2021-02-23 16:28:43.296260', '1', 'comminser12@gmail.com', 1, '[{\"added\": {}}]', 19, 1),
(5, '2021-02-23 17:49:53.402770', '1', 'police', 1, '[{\"added\": {}}]', 11, 1),
(6, '2021-02-28 12:36:59.214469', '2', 'comminser@gmail.com', 1, '[{\"added\": {}}]', 19, 3),
(7, '2021-03-03 05:14:04.095548', '3', 'comminserindia@gmail.com', 1, '[{\"added\": {}}]', 19, 4),
(8, '2021-03-03 05:14:23.485397', '2', 'comminser@gmail.com', 3, '', 19, 4),
(9, '2021-03-03 05:14:23.500387', '1', 'comminser12@gmail.com', 3, '', 19, 4);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'epolishstation', 'signup'),
(8, 'epolishstation', 'feedback'),
(9, 'epolishstation', 'case'),
(10, 'epolishstation', 'contactmodel'),
(11, 'epolishstation', 'emergencynumbermodel'),
(12, 'epolishstation', 'casestatus'),
(13, 'sites', 'site'),
(14, 'account', 'emailaddress'),
(15, 'account', 'emailconfirmation'),
(16, 'socialaccount', 'socialaccount'),
(17, 'socialaccount', 'socialapp'),
(18, 'socialaccount', 'socialtoken'),
(19, 'epolishstation', 'commisnermodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-23 14:27:21.951479'),
(2, 'auth', '0001_initial', '2021-02-23 14:27:22.217096'),
(3, 'admin', '0001_initial', '2021-02-23 14:27:22.878700'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-23 14:27:22.998324'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-23 14:27:23.028108'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-23 14:27:23.120877'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-23 14:27:23.161896'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-02-23 14:27:23.207794'),
(9, 'auth', '0004_alter_user_username_opts', '2021-02-23 14:27:23.223415'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-02-23 14:27:23.270289'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-02-23 14:27:23.276150'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-23 14:27:23.292751'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-02-23 14:27:23.340601'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-23 14:27:23.395288'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-02-23 14:27:23.454853'),
(16, 'auth', '0011_update_proxy_permissions', '2021-02-23 14:27:23.469503'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-23 14:27:23.511494'),
(18, 'epolishstation', '0001_initial', '2021-02-23 14:27:23.559347'),
(19, 'epolishstation', '0002_feedback', '2021-02-23 14:27:23.607197'),
(20, 'epolishstation', '0003_auto_20210216_1614', '2021-02-23 14:27:23.631612'),
(21, 'epolishstation', '0004_case', '2021-02-23 14:27:23.658951'),
(22, 'epolishstation', '0005_contactmodel', '2021-02-23 14:27:23.697035'),
(23, 'epolishstation', '0006_emergencynumbermodel', '2021-02-23 14:27:23.736094'),
(24, 'epolishstation', '0007_auto_20210220_1355', '2021-02-23 14:27:23.741957'),
(25, 'epolishstation', '0008_casestatus', '2021-02-23 14:27:23.791761'),
(26, 'epolishstation', '0009_delete_casestatus', '2021-02-23 14:27:23.801528'),
(27, 'epolishstation', '0010_casestatus', '2021-02-23 14:27:23.839612'),
(28, 'sessions', '0001_initial', '2021-02-23 14:27:23.879650'),
(29, 'sites', '0001_initial', '2021-02-23 14:27:23.985112'),
(30, 'sites', '0002_alter_domain_unique', '2021-02-23 14:27:24.023202'),
(31, 'account', '0001_initial', '2021-02-23 14:57:29.876098'),
(32, 'account', '0002_email_max_length', '2021-02-23 14:57:30.173944'),
(33, 'socialaccount', '0001_initial', '2021-02-23 14:57:30.445907'),
(34, 'socialaccount', '0002_token_max_lengths', '2021-02-23 14:57:30.883394'),
(35, 'socialaccount', '0003_extra_data_default_dict', '2021-02-23 14:57:30.908298'),
(36, 'epolishstation', '0011_commisnermodel', '2021-02-23 16:10:04.548197');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('g726wcfponnq3ia820b0bmyk1ofkgcpc', '.eJxVjDsOwjAQBe_iGll2_Eso6TmDtetd4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIstDj9bgjpwXUHdId6azK1ui4zyl2RB-3y2oifl8P9OyjQy7f2g9UIhNZ5Deg4Wx4dIBkLCpMhGqYA4NgkysTKWfSj0QGCyhMrTeL9AQg7ONc:1lEbni:20G-Yy9M-To_Q_6dmLkbwyk3hWKpzJEQldFX8gte2Zc', '2021-03-09 17:48:46.607879'),
('12ea1b8v0banygjw8ttmu4w9iiwynblo', '.eJxVjk0OgjAQhe_StSFOmUw77vQiZDptUyIpiZQV8e6CYaHL9_flbWaQtZVhXdJrGKO5GWsuv14QfaZ6BDJNh92J6rzW1n07Z7x0912l2kaVNs71ca7-UEWWsnPiFfsQMvRAkQVdUkKv0UcMzFYyoSVPEJhcjpZ6lGSBnQcWzqiwQ4-j8P4AYzI9pg:1lEZho:ufQD2zbgACrtvtmUknBuD4B1Evv-1ZZhGVj1ToJewpU', '2021-03-09 15:34:32.147383'),
('5qyzav2pfrm47rsp6umnhlg6lnr1q7ru', '.eJxVjDsOwjAQBe_iGll2_Eso6TmDtetd4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIstDj9bgjpwXUHdId6azK1ui4zyl2RB-3y2oifl8P9OyjQy7f2g9UIhNZ5Deg4Wx4dIBkLCpMhGqYA4NgkysTKWfSj0QGCyhMrTeL9AQg7ONc:1lEaEg:RrAUEgehOvpTiN1KDYQMjlMxPOYOAWoEJuPas6CBZhs', '2021-03-09 16:08:30.848273'),
('twmmmiz24kwnxze6shiahlo9kodjlc05', 'eyJjX3VuYW1lIjoiY29tbWluc2VyQGdtYWlsLmNvbSIsImlkIjoyfQ:1lGLiw:ixdKSmYhF-zAFOgQgNlrPDaSvY2AW8GBECi3F3-KxlE', '2021-03-14 13:03:02.060885'),
('7hmbw26aduxnmtka0ynxrkr0k810veog', '.eJyrVkqOL81LzE1VslJKzs_NzcwrTi1ySM9NzMzRA_KVdJQyU5SsjHSUYIoKMvMSc4oTkzISKxOR1NUCAKe9GWg:1lGN2o:Yu9XAT8vnrHuDOe57cfEvvS2Gr6ONlzSTWYHoGoat8o', '2021-03-14 14:27:38.004475'),
('6ualjelzicpwcg50z5et0fi2qwfbm9g5', 'eyJpZCI6MiwiY191bmFtZSI6ImNvbW1pbnNlckBnbWFpbC5jb20ifQ:1lGNEH:Q_oxPR3N-imvafZr3yB-Q9DkkybxiKVrsvtX849B_LI', '2021-03-14 14:39:29.661390'),
('71m2lwoykcj5u69bxk3sh68wpdon5ww9', '.eJxVjjkOwyAURO9CbVmstkkVpc8Z0IcPNkkAyUsV5e4ByUXSzvJm3sTAsS_m2PxqIpILkaT71Sy4p8_NwAfkufSu5H2Ntm-R_nS3_l7Qv25n9g-wwLbUtnNeIldSBEZl0OgFZxqV4iiQcWA0iCAmSifBQQ_K4SidZN5rPQ6BWVuh7Z7oiDNHhuQbs6QUcx2JGSNc5wTxVf8l8vkCoLNGlg:1lHkgs:6RWv7-L8xEMXuJDSx4aKSnehlqh41aY5R8FzmcNuSGg', '2021-03-18 09:54:42.426035'),
('klaigs4nu3wzyv0vjyscymns93ygw9bk', '.eJxVjEEOgzAMBP-Sc4XqYJm4t_YjkeMkCioKUgkn1L8XKi4cd3Z3NjNG84Cb8bK24tclffxBjDUXFkTfqR6FTNOBO1Gd19q6_-asl-65p1TbqNLGub7O10VVZCm7J96xDyFDDxRZcEhK6DS6iIHZSia05AgC05CjpR4lWeDBAQtnVDDfH-7sPaY:1lHJio:GJrQ8F3EXQwCxGuXB2HLf6Boi29PRscatuOZZhwmp_w', '2021-03-17 05:06:54.319640');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `epolishstation_case`
--

DROP TABLE IF EXISTS `epolishstation_case`;
CREATE TABLE IF NOT EXISTS `epolishstation_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `complains` varchar(900) NOT NULL,
  `aadhar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `epolishstation_casestatus`
--

DROP TABLE IF EXISTS `epolishstation_casestatus`;
CREATE TABLE IF NOT EXISTS `epolishstation_casestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `complains` varchar(900) NOT NULL,
  `aadhar` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `epolishstation_casestatus`
--

INSERT INTO `epolishstation_casestatus` (`id`, `uname`, `complains`, `aadhar`, `status`) VALUES
(3, 'pinalsabhaya@gmail.com', 'still my mobile phone near by indira circle in rajkot', 'upload/lap_9WfRVGJ.jpg', 'running'),
(5, 'comminser@gmail.com', 'proper work', 'upload/images_nV4Vvso.jpg', 'running');

-- --------------------------------------------------------

--
-- Table structure for table `epolishstation_commisnermodel`
--

DROP TABLE IF EXISTS `epolishstation_commisnermodel`;
CREATE TABLE IF NOT EXISTS `epolishstation_commisnermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_uname` varchar(70) NOT NULL,
  `c_password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `epolishstation_commisnermodel`
--

INSERT INTO `epolishstation_commisnermodel` (`id`, `c_uname`, `c_password`) VALUES
(3, 'comminserindia@gmail.com', 'comminser@india');

-- --------------------------------------------------------

--
-- Table structure for table `epolishstation_contactmodel`
--

DROP TABLE IF EXISTS `epolishstation_contactmodel`;
CREATE TABLE IF NOT EXISTS `epolishstation_contactmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `msg` varchar(800) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `epolishstation_contactmodel`
--

INSERT INTO `epolishstation_contactmodel` (`id`, `name`, `uname`, `msg`) VALUES
(1, 'nirali', 'mirudobariya18@gmail.com', 'crimefile'),
(2, 'pinal sabhaya', 'pinalsabhaya@gmail.com', 'still my mobile phone near by indira circle in rajkot');

-- --------------------------------------------------------

--
-- Table structure for table `epolishstation_emergencynumbermodel`
--

DROP TABLE IF EXISTS `epolishstation_emergencynumbermodel`;
CREATE TABLE IF NOT EXISTS `epolishstation_emergencynumbermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `info` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `epolishstation_emergencynumbermodel`
--

INSERT INTO `epolishstation_emergencynumbermodel` (`id`, `number`, `info`) VALUES
(6, 112, 'NATIONAL EMERGENCY NUMBER'),
(2, 108, 'Emergency ambulance..........'),
(3, 112, 'NATIONAL EMERGENCY NUMBER...'),
(4, 1073, 'Road Accident Emergency Service'),
(5, 1072, 'Railway Accident Emergency Service');

-- --------------------------------------------------------

--
-- Table structure for table `epolishstation_feedback`
--

DROP TABLE IF EXISTS `epolishstation_feedback`;
CREATE TABLE IF NOT EXISTS `epolishstation_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `cmnt` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `epolishstation_feedback`
--

INSERT INTO `epolishstation_feedback` (`id`, `uname`, `cmnt`) VALUES
(1, 'nehal.pan17@gmail.com', 'good'),
(2, 'pinalsabhaya@gmail.comn', 'usefullsite');

-- --------------------------------------------------------

--
-- Table structure for table `epolishstation_signup`
--

DROP TABLE IF EXISTS `epolishstation_signup`;
CREATE TABLE IF NOT EXISTS `epolishstation_signup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(15) NOT NULL,
  `zipcode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `epolishstation_signup`
--

INSERT INTO `epolishstation_signup` (`id`, `fname`, `lname`, `uname`, `password`, `city`, `state`, `zipcode`) VALUES
(1, 'nehal', 'panasuriya', 'nehal.pan17@gmail.com', 'nehal123', 'junagadh', 'Gujarat', 9876),
(2, 'pinal', 'sabhaya', 'pinalsabhaya@gmail.com', 'pinal', 'jamanagar', 'Gujarat', 362020),
(4, 'krishana', 'patel', 'lahenpatel1310@gmail.com', 'nnnnn', 'jmnagar', 'Gujarat', 88888),
(9, 'krishana', 'panasuriya', 'nehalmmm.pan17@gmail.com', 'qqqqq', 'junagadh', 'Gujarat', 1111),
(10, 'krishana', 'panasuriya', 'nehalq.pan17@gmail.com', 'qqqqq', 'junagadh', 'Gujarat', 8976);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialaccount_socialaccount`
--

INSERT INTO `socialaccount_socialaccount` (`id`, `provider`, `uid`, `last_login`, `date_joined`, `extra_data`, `user_id`) VALUES
(1, 'google', '103650828110209932628', '2021-03-03 05:06:54.278380', '2021-02-23 15:23:47.087737', '{\"id\": \"103650828110209932628\", \"name\": \"Python Django\", \"given_name\": \"Python\", \"family_name\": \"Django\", \"picture\": \"https://lh5.googleusercontent.com/-4DUEZlMB5yQ/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclerwZld468bZqOE-JBWTSHHxLf0g/s96-c/photo.jpg\", \"locale\": \"en-GB\"}', 2);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialaccount_socialapp`
--

INSERT INTO `socialaccount_socialapp` (`id`, `provider`, `name`, `client_id`, `secret`, `key`) VALUES
(1, 'facebook', 'facebook_Auth', '225935805869772', 'App Secret a85cc276bdf65376ce1c3bb5ece1669c', ''),
(2, 'instagram', 'insta_auth', '225935805869772', 'a85cc276bdf65376ce1c3bb5ece1669c', ''),
(3, 'google', 'google_auth', '968312904081-q9bsetutn504c1jbeg8ih7voeudin0lb.apps.googleusercontent.com', 'yLSmLhkQt2CVD_v9fxE-2iXi', '');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_socialapp_id_97fb6e7d` (`socialapp_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

INSERT INTO `socialaccount_socialapp_sites` (`id`, `socialapp_id`, `site_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_socialtoken_account_id_951f210e` (`account_id`),
  KEY `socialaccount_socialtoken_app_id_636a42d7` (`app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialaccount_socialtoken`
--

INSERT INTO `socialaccount_socialtoken` (`id`, `token`, `token_secret`, `expires_at`, `account_id`, `app_id`) VALUES
(1, 'ya29.A0AfH6SMBu4LY498eMURu4Iucf3Wowi7GYo26uhTUgFVzlVk0tDXwmfhnCKG6mXlf4gzdXC0CAzflRJfHfWxnAdF5hTnbalAQ6vV9X-bwVPliUtRDfhSzRlBtJp6AtVJ7nBFqRP8AirXHmiPJ9YIfiHCUItiRt', '', '2021-03-03 06:06:53.061211', 1, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
