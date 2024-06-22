-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2018 at 08:12 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sikosan`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1516098020),
('m130524_201442_init', 1516098032),
('m140506_102106_rbac_init', 1516193634),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1516193634);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kos` int(11) NOT NULL,
  `comment` text NOT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_kos` (`id_kos`),
  UNIQUE KEY `id_user` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_kos`
--

CREATE TABLE IF NOT EXISTS `tbl_data_kos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(120) NOT NULL,
  `biaya` int(255) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `fasilitas` text NOT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`create_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tbl_data_kos`
--

INSERT INTO `tbl_data_kos` (`id`, `nama`, `biaya`, `alamat`, `fasilitas`, `create_by`, `update_by`, `create_at`, `update_at`) VALUES
(1, 'Griya Mandiri', 200000, 'Jepara', 'Alakadarnya', NULL, NULL, '2018-01-18 03:11:54', '2018-01-18 03:11:54'),
(3, 'Wisma harmony', 225000, 'Tahunan', 'Kamar isi 2 orang\r\nBantal\r\nGuling\r\nAlmari\r\nKipas angin\r\nDapur\r\nKamar mandi luar\r\nTv umum', 4, 4, '2018-01-18 03:37:35', '2018-01-18 03:37:35'),
(11, 'Griya Abadi', 200000, 'Disini', 'Seperti Itu', 1, 1, '2018-01-18 04:09:12', '2018-01-18 04:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'lutfi0711', 'h1ySjxVZCCDlK-WM9oUBAPssyJpTV-Gj', '$2y$13$.cDULihMEmye4HDAaAQ9mOyykkmQLV.fR8NumzVfo0CIh7r3sLuVy', NULL, 'lutfi0711@yahoo.co.id', 10, 1516098411, 1516098411),
(2, 'hesti', 's_lkhSo8NdVQ4PsEjdUTyZa7T6g3tEmy', '$2y$13$y9.uzRr5pKcwmdIVLrjBMOnyu/biw691qqPijeuZpW9DVUR6Rnb/m', NULL, 'hestimayangsari97@gmail.com', 10, 1516245774, 1516245774),
(3, 'afnan', 'uS26tY4HttYW1swZVdm9ffzK55FbVwMR', '$2y$13$jyK3fuM3TRijOcfdhuH5bu7XSmsYxi4Zr0nPHH9lrcFKmAZ62iE4K', NULL, 'afnanistikmal1593@gmail.com', 10, 1516246043, 1516246043),
(4, 'Khois', 'kc9wQ0Hz1ZEfVbWtay0Y4a6qjhe1JCFg', '$2y$13$lQx4kF6TNQMKySkAF8bPluWNbOtTfFXog1/fHpMvPlsx64LYxhSS.', NULL, 'Khoisrotun@gmail.com', 10, 1516246546, 1516246546),
(5, 'hestim', '7nH2nTS361Te--SIWgCx2d3b3SESELGD', '$2y$13$WGZSMkv2UXhrOYy8GA5K2u2.Di1lBNTAjFU04pefaQdAM7TnynKkK', NULL, 'hestimayangsari6@gmail.com', 10, 1516246574, 1516246574),
(6, 'puput cahyaningsih', 'OY4l9l5ptVu1FzGoNlINs6cgfs62Y02C', '$2y$13$tr3s4btc2xvzC.XI1nvy9.A87iWRxtHySC4RKJRSGQdkfQlkJgtMm', NULL, 'puputcahyaningsih6@gmail.com', 10, 1516246692, 1516246692);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `tbl_comment_ibfk_1` FOREIGN KEY (`id_kos`) REFERENCES `tbl_data_kos` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
