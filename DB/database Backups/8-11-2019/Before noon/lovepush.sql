-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2019 at 05:57 AM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.1.32-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lovepush`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capture_distance` int(11) NOT NULL DEFAULT '0' COMMENT 'NotUsed (in meters) distance range for other members profiles capture not used',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'used for forgot password',
  `verify_code_created_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `image`, `password`, `capture_distance`, `remember_token`, `verify_code`, `verify_code_created_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@love-push.com', '7814817171', '1555586888.jpg', '$2y$10$oALoe/ZsdJCnM91RPUYkFOS.2tP2X/vTdmuJ5xqusIras5gP3hcj.', 100, 'fK3TNidoCoInWAZvvUZh68cedKK81XTHj4A1hAvcIcLbo0vLqQxwNvzBkf12', '774846', '2018-10-04 19:04:55', '2018-06-27 05:06:26', '2019-04-18 05:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `app_links`
--

CREATE TABLE `app_links` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_links`
--

INSERT INTO `app_links` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'android', 'bit.ly/LovePushAndroid', '2019-11-06 13:18:39', '2019-11-06 13:25:53'),
(2, 'ios', 'bit.ly/LovePushApple', '2019-11-06 13:18:39', '2019-11-06 13:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `block_list`
--

CREATE TABLE `block_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_requests`
--

CREATE TABLE `chat_requests` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `status` enum('S','A','R','') NOT NULL COMMENT 'S=Send, A=Accept, R=Reject request',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_status`
--

CREATE TABLE `chat_status` (
  `id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isDeleted` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_status`
--

INSERT INTO `chat_status` (`id`, `match_id`, `user_id`, `isDeleted`, `created_at`, `updated_at`) VALUES
(497, 447, 501, '0', '2019-11-05 15:33:43', '2019-11-05 15:33:43'),
(498, 447, 506, '0', '2019-11-05 15:33:43', '2019-11-05 15:33:43'),
(499, 447, 501, '0', '2019-11-05 15:36:57', '2019-11-05 15:36:57'),
(500, 447, 506, '0', '2019-11-05 15:36:57', '2019-11-05 15:36:57'),
(501, 447, 501, '0', '2019-11-05 15:40:44', '2019-11-05 15:40:44'),
(502, 447, 506, '0', '2019-11-05 15:40:44', '2019-11-05 15:40:44'),
(503, 447, 501, '0', '2019-11-05 15:41:50', '2019-11-05 15:41:50'),
(504, 447, 506, '0', '2019-11-05 15:41:50', '2019-11-05 15:41:50'),
(513, 455, 526, '0', '2019-11-06 12:26:53', '2019-11-06 12:26:53'),
(514, 455, 529, '0', '2019-11-06 12:26:53', '2019-11-06 12:26:53'),
(515, 455, 526, '0', '2019-11-06 12:29:28', '2019-11-06 12:29:28'),
(516, 455, 529, '0', '2019-11-06 12:29:28', '2019-11-06 12:29:28'),
(517, 455, 526, '0', '2019-11-06 12:29:32', '2019-11-06 12:29:32'),
(518, 455, 529, '0', '2019-11-06 12:29:32', '2019-11-06 12:29:32'),
(519, 455, 526, '0', '2019-11-06 12:29:43', '2019-11-06 12:29:43'),
(520, 455, 529, '0', '2019-11-06 12:29:43', '2019-11-06 12:29:43'),
(521, 456, 514, '0', '2019-11-06 12:29:47', '2019-11-06 12:29:47'),
(522, 456, 526, '0', '2019-11-06 12:29:47', '2019-11-06 12:29:47'),
(523, 457, 526, '0', '2019-11-06 12:56:05', '2019-11-06 12:56:05'),
(524, 457, 503, '0', '2019-11-06 12:56:05', '2019-11-06 12:56:05'),
(525, 460, 530, '0', '2019-11-07 06:58:40', '2019-11-07 06:58:40'),
(526, 460, 515, '0', '2019-11-07 06:58:40', '2019-11-07 06:58:40'),
(527, 464, 546, '0', '2019-11-07 07:18:49', '2019-11-07 07:18:49'),
(528, 464, 523, '0', '2019-11-07 07:18:49', '2019-11-07 07:18:49'),
(529, 465, 549, '0', '2019-11-07 09:20:28', '2019-11-07 09:20:28'),
(530, 465, 548, '0', '2019-11-07 09:20:28', '2019-11-07 09:20:28'),
(531, 471, 551, '0', '2019-11-07 11:13:12', '2019-11-07 11:13:12'),
(532, 471, 523, '0', '2019-11-07 11:13:12', '2019-11-07 11:13:12'),
(533, 473, 504, '0', '2019-11-07 11:13:25', '2019-11-07 11:13:25'),
(534, 473, 549, '0', '2019-11-07 11:13:25', '2019-11-07 11:13:25'),
(535, 453, 509, '0', '2019-11-07 22:27:36', '2019-11-07 22:27:36'),
(536, 453, 522, '0', '2019-11-07 22:27:36', '2019-11-07 22:27:36'),
(537, 470, 548, '0', '2019-11-08 04:56:19', '2019-11-08 04:56:19'),
(538, 470, 523, '0', '2019-11-08 04:56:19', '2019-11-08 04:56:19'),
(539, 466, 548, '0', '2019-11-08 04:56:29', '2019-11-08 04:56:29'),
(540, 466, 504, '0', '2019-11-08 04:56:29', '2019-11-08 04:56:29');

-- --------------------------------------------------------

--
-- Table structure for table `connect_requests`
--

CREATE TABLE `connect_requests` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `status` enum('S','A','R','') NOT NULL COMMENT 'S=Send, A=Accept, R=Reject request',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connect_requests`
--

INSERT INTO `connect_requests` (`id`, `from_user_id`, `to_user_id`, `status`, `created_at`, `updated_at`) VALUES
(978, 509, 515, 'A', '2019-11-06 07:46:58', '2019-11-06 13:29:56'),
(982, 529, 513, 'S', '2019-11-06 12:11:22', '2019-11-06 12:11:22'),
(983, 529, 510, 'S', '2019-11-06 12:11:24', '2019-11-06 12:11:24'),
(984, 529, 503, 'A', '2019-11-06 12:11:25', '2019-11-06 12:52:32'),
(986, 526, 513, 'S', '2019-11-06 12:12:18', '2019-11-06 12:12:18'),
(987, 526, 510, 'S', '2019-11-06 12:12:19', '2019-11-06 12:12:19'),
(989, 526, 503, 'A', '2019-11-06 12:12:21', '2019-11-06 12:52:28'),
(990, 526, 529, 'A', '2019-11-06 12:12:23', '2019-11-06 12:15:31'),
(991, 526, 515, 'A', '2019-11-06 12:12:24', '2019-11-06 13:29:55'),
(992, 526, 523, 'A', '2019-11-06 12:12:27', '2019-11-06 12:57:47'),
(994, 526, 509, 'A', '2019-11-06 12:12:28', '2019-11-06 20:59:21'),
(995, 526, 501, 'S', '2019-11-06 12:12:29', '2019-11-06 12:12:29'),
(996, 526, 522, 'R', '2019-11-06 12:12:29', '2019-11-07 07:11:41'),
(997, 530, 515, 'A', '2019-11-06 13:15:46', '2019-11-06 13:29:53'),
(998, 530, 519, 'S', '2019-11-06 13:15:50', '2019-11-06 13:15:50'),
(999, 504, 515, 'S', '2019-11-06 13:35:52', '2019-11-06 13:35:52'),
(1000, 546, 523, 'A', '2019-11-07 07:18:12', '2019-11-07 07:18:29'),
(1001, 504, 531, 'S', '2019-11-07 07:45:24', '2019-11-07 07:45:24'),
(1002, 548, 504, 'A', '2019-11-07 07:54:41', '2019-11-07 09:39:30'),
(1003, 548, 515, 'S', '2019-11-07 07:55:48', '2019-11-07 07:55:48'),
(1004, 548, 541, 'S', '2019-11-07 07:55:54', '2019-11-07 07:55:54'),
(1005, 548, 535, 'S', '2019-11-07 07:55:56', '2019-11-07 07:55:56'),
(1006, 548, 540, 'S', '2019-11-07 07:55:57', '2019-11-07 07:55:57'),
(1007, 548, 513, 'S', '2019-11-07 07:55:59', '2019-11-07 07:55:59'),
(1008, 548, 531, 'S', '2019-11-07 07:59:00', '2019-11-07 07:59:00'),
(1009, 548, 532, 'S', '2019-11-07 07:59:03', '2019-11-07 07:59:03'),
(1010, 548, 510, 'S', '2019-11-07 07:59:04', '2019-11-07 07:59:04'),
(1011, 548, 530, 'S', '2019-11-07 07:59:05', '2019-11-07 07:59:05'),
(1012, 548, 514, 'S', '2019-11-07 09:18:55', '2019-11-07 09:18:55'),
(1013, 548, 503, 'S', '2019-11-07 09:18:57', '2019-11-07 09:18:57'),
(1014, 548, 506, 'S', '2019-11-07 09:36:29', '2019-11-07 09:36:29'),
(1015, 548, 546, 'A', '2019-11-07 09:36:31', '2019-11-07 09:48:05'),
(1016, 548, 523, 'A', '2019-11-07 09:36:32', '2019-11-07 09:53:20'),
(1017, 548, 509, 'A', '2019-11-07 09:36:33', '2019-11-07 12:43:44'),
(1018, 548, 522, 'S', '2019-11-07 09:36:38', '2019-11-07 09:36:38'),
(1019, 548, 550, 'A', '2019-11-07 09:36:40', '2019-11-08 05:09:59'),
(1020, 548, 534, 'S', '2019-11-07 09:36:41', '2019-11-07 09:36:41'),
(1021, 548, 501, 'S', '2019-11-07 09:36:43', '2019-11-07 09:36:43'),
(1022, 548, 547, 'S', '2019-11-07 09:36:44', '2019-11-07 09:36:44'),
(1023, 504, 510, 'S', '2019-11-07 09:39:42', '2019-11-07 09:39:42'),
(1024, 504, 513, 'S', '2019-11-07 09:39:44', '2019-11-07 09:39:44'),
(1025, 504, 532, 'S', '2019-11-07 09:39:47', '2019-11-07 09:39:47'),
(1026, 504, 519, 'S', '2019-11-07 09:39:49', '2019-11-07 09:39:49'),
(1027, 504, 530, 'S', '2019-11-07 09:39:53', '2019-11-07 09:39:53'),
(1028, 504, 503, 'S', '2019-11-07 09:40:01', '2019-11-07 09:40:01'),
(1029, 504, 506, 'S', '2019-11-07 09:40:02', '2019-11-07 09:40:02'),
(1030, 504, 550, 'A', '2019-11-07 09:40:03', '2019-11-08 05:10:00'),
(1031, 504, 549, 'A', '2019-11-07 09:40:04', '2019-11-07 11:11:21'),
(1032, 504, 526, 'S', '2019-11-07 09:40:06', '2019-11-07 09:40:06'),
(1033, 504, 546, 'A', '2019-11-07 09:40:07', '2019-11-07 09:48:02'),
(1034, 504, 523, 'A', '2019-11-07 09:40:08', '2019-11-07 09:53:18'),
(1035, 504, 509, 'A', '2019-11-07 09:40:10', '2019-11-07 12:43:47'),
(1036, 504, 522, 'S', '2019-11-07 09:40:29', '2019-11-07 09:40:29'),
(1037, 551, 523, 'A', '2019-11-07 10:43:54', '2019-11-07 10:44:10'),
(1038, 509, 534, 'S', '2019-11-07 12:44:46', '2019-11-07 12:44:46'),
(1039, 548, 552, 'S', '2019-11-07 13:24:47', '2019-11-07 13:24:47'),
(1040, 549, 515, 'S', '2019-11-07 13:25:33', '2019-11-07 13:25:33'),
(1041, 549, 531, 'S', '2019-11-07 13:28:03', '2019-11-07 13:28:03'),
(1042, 549, 541, 'S', '2019-11-07 13:28:05', '2019-11-07 13:28:05'),
(1043, 549, 532, 'S', '2019-11-07 13:28:06', '2019-11-07 13:28:06'),
(1044, 549, 535, 'S', '2019-11-07 13:28:07', '2019-11-07 13:28:07'),
(1045, 549, 513, 'S', '2019-11-07 13:28:09', '2019-11-07 13:28:09'),
(1046, 549, 519, 'S', '2019-11-07 13:28:11', '2019-11-07 13:28:11'),
(1047, 549, 510, 'S', '2019-11-07 13:28:12', '2019-11-07 13:28:12'),
(1048, 549, 540, 'S', '2019-11-07 13:28:13', '2019-11-07 13:28:13'),
(1049, 549, 503, 'S', '2019-11-07 13:28:15', '2019-11-07 13:28:15'),
(1050, 549, 530, 'S', '2019-11-07 13:28:16', '2019-11-07 13:28:16'),
(1051, 549, 528, 'S', '2019-11-07 13:28:17', '2019-11-07 13:28:17'),
(1052, 549, 529, 'S', '2019-11-07 13:28:19', '2019-11-07 13:28:19'),
(1053, 549, 514, 'S', '2019-11-07 13:28:21', '2019-11-07 13:28:21'),
(1054, 549, 506, 'S', '2019-11-07 13:28:22', '2019-11-07 13:28:22'),
(1055, 549, 550, 'A', '2019-11-07 13:28:24', '2019-11-08 05:10:03'),
(1056, 512, 530, 'S', '2019-11-08 04:52:14', '2019-11-08 04:52:14'),
(1057, 512, 510, 'S', '2019-11-08 04:52:16', '2019-11-08 04:52:16'),
(1058, 512, 532, 'S', '2019-11-08 04:52:18', '2019-11-08 04:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_accounts`
--

CREATE TABLE `deleted_accounts` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `reasons` text,
  `description` longtext,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_accounts`
--

INSERT INTO `deleted_accounts` (`id`, `lang_id`, `name`, `username`, `email`, `phone_code`, `phone`, `reasons`, `description`, `created_at`, `updated_at`) VALUES
(12, 1, 'Vipin Sharma', 'vipinsharma813@gmail.com', 'vipinsharma813@gmail.com', '+1', '9412141950', 'Freezing,Bad User Experience,Intrusive ads,Privacy concerns,Forced social logins,Disinterest,Little activity in my area,Other', 'Enter description here', '2019-11-05 14:40:23', '2019-11-05 14:40:23'),
(13, 1, 'Jorden Kayuri', 'Jorden', 'jorden@mailinator.com', '+91', '123456789452', 'Bad User Experience, Little activity in my area', 'This is my description.', '2019-11-06 06:52:08', '2019-11-06 06:52:08'),
(14, 1, 'Kalsa Kusti', 'Kalsa', 'kalsa@mailinator.com', '+91', '1234567894', 'Freezing,Intrusive ads', 'Enter description here', '2019-11-06 07:39:16', '2019-11-06 07:39:16'),
(15, 1, 'Jorde Msdkl', 'Jorden', 'jorden@mailinator.com', '+91', '1234567894', 'Disinterest,Privacy concerns', 'Enter description here', '2019-11-06 07:50:53', '2019-11-06 07:50:53'),
(16, 0, 'Manish', 'manishpreet', 'manishpreet0186@gmail.com', '+1', '4949484040', 'Disinterest', 'Ffcvv', '2019-11-06 10:29:15', '2019-11-06 10:29:15'),
(17, 0, 'Manish', 'manishpreet', 'manishpreet.xicom@gmail.com', '+1', '66588', 'Forced Social logins', 'Yy', '2019-11-06 11:02:20', '2019-11-06 11:02:20'),
(18, 0, 'nithin', 'nitin', 'nitin@mailinator.com', '+1', '12345567806', 'Privacy Concerns', 'I have some personal issues ?', '2019-11-06 11:48:55', '2019-11-06 11:48:55'),
(19, 1, 'dolly', 'doll', 'doll@mailinator.com', '+1', '1234567899', 'Bad User Experience, Little activity in my area', 'This is my description.', '2019-11-06 11:59:53', '2019-11-06 11:59:53'),
(20, 1, 'Marshal Erickk', 'marshal', 'xicomtest11@gmail.com', '+1', '1234545455', 'Intrusive ads,Forced social logins,Bad User Experience', 'Enter description here', '2019-11-06 13:22:57', '2019-11-06 13:22:57'),
(21, 2, 'Stefan', 'Officer Red', 'stefan-fauth@vodafone.de', '+49', '1717745476', 'Other', 'Enter description here', '2019-11-07 03:26:10', '2019-11-07 03:26:10'),
(22, 0, 'Manish', 'manishpreet', 'manishpreet.xicom@gmail.com', '+1', '66866666999', 'Forced Social logins', 'Gggg', '2019-11-07 05:31:56', '2019-11-07 05:31:56'),
(23, 1, 'LKM TPMS', 'LKM', 'lkm@mailinator.com', '+91', '1234567895', 'Bad User Experience,Forced social logins', 'Enter description here', '2019-11-07 06:36:27', '2019-11-07 06:36:27'),
(24, 1, 'LKM TPDSD', 'LKM', 'lkm@mailinator.com', '+91', '123456456123', 'Freezing,Intrusive ads,Forced social logins', 'D gdsfgdegertret', '2019-11-07 06:43:53', '2019-11-07 06:43:53'),
(25, 0, 'Manish', 'uv', 'manishpreet.xicom@gmail.com', '+1', '5555555774558', 'Disinterest', 'Fgg', '2019-11-07 06:57:44', '2019-11-07 06:57:44'),
(26, 0, 'Manish', 'gg', 'manishpreet.xicom@gmail.com', '+1', '6554458008788', 'Forced Social logins', 'Dff', '2019-11-07 06:58:56', '2019-11-07 06:58:56'),
(27, 0, 'za', 'createffect', 'hellzone302@gmail.com', '+1', '', 'Other', 'hjnnkmn', '2019-11-07 12:39:49', '2019-11-07 12:39:49'),
(28, 1, 'Karike van Eeden', 'Kriekie9', 'karikevaneeden@yahoo.com', '+27', '0713632733', 'Disinterest', 'Enter description here', '2019-11-07 19:06:17', '2019-11-07 19:06:17');

-- --------------------------------------------------------

--
-- Table structure for table `est_scores`
--

CREATE TABLE `est_scores` (
  `id` int(11) NOT NULL DEFAULT '0',
  `test_id_1` int(11) NOT NULL,
  `test_id_2` int(11) NOT NULL,
  `scores` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `ques_type` varchar(255) NOT NULL,
  `question` longtext NOT NULL,
  `answer` longtext NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `language_id`, `ques_type`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', 'What is Love Push?', 'We help you to connect quickly and easily with new people in your area or\r\naround the world.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(2, 1, 'General', 'How can I use Love Push?', 'You can install the app from Android and iOS App Stores.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(3, 1, 'General', 'Can Love Push be used anywhere in the world?', 'Yes, you can use the app worldwide!', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(4, 1, 'General', 'What is the minimum age to sign up?', 'The minimum age to sign up for LovePush is 18 years.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(5, 1, 'Registration and first steps', 'Can I register without Facebook/Instagram/G+?', 'Yes, you can also sign in with your mobile number.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(6, 1, 'Registration and first steps', 'How can I edit my profile?', 'You can edit your profile by clicking on your profile picture in the menu.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(7, 1, 'Registration and first steps', 'Where do I adjust my search settings?', 'You can change your search settings in the menu under Settings ? Filter.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(8, 1, 'Account', 'Where do I set the language?', 'Set your language by selecting \"Language\" in the settings.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(9, 1, 'Account', 'Can I deactivate message requests?', 'Yes, if you only want to be contacted by matches deactivate message requests in the settings under \"stop private messaging\".', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(10, 1, 'Account', 'Can I deactivate my account temporarily?', 'Temporarily deactivate your account by selecting \"Hide me from search\" in the settings.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(11, 1, 'Account', 'How do I delete my account?', 'Delete your account in the settings under \"Delete Account\".', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(12, 1, 'Account', 'How do I add images and how do I delete images of myself?', 'You can add and delete your pictures in the profile editing.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(13, 1, 'Features LovePush', 'Profile & Posts', 'Create an interesting and real profile!\r\nYou can also post pictures in your profile - pictures say more than 1000 words!', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(14, 1, 'Features LovePush', 'Swipe', 'You can choose between \"next\", \"connect\" or \"date\" request.\r\nAfter you have matched, you can start chatting.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(15, 1, 'Features LovePush', 'Radar', 'You have an overview of all people near you. Visit their profile and connect!', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(16, 1, 'Features LovePush', 'Love & Connect Ads', 'Publish Love or Connect ads in your chosen city and meet the right people in the right place.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(17, 1, 'Features LovePush', 'Personal Matching', 'You get suggestions for people who fit your character and who have the same interests as you.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(18, 1, 'Features LovePush', 'Around', 'Our integrated Google API allows you to explore the hottest bars, restaurants, festivals & concerts in your area and invite your contacts directly to them.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(19, 1, 'Features LovePush', 'Live Streams', 'Start or join a live session in your area and watch, comment or join!', '1', '2019-10-07 16:12:41', '2019-10-07 16:22:23'),
(20, 1, 'Memberships', 'Free & V.I.P Pass', 'With our V.I.P. Pass you can use all our functions nearly unlimited and earn money with our affiliate program.\r\nFurther information can be found in the price information.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(21, 1, 'Memberships', 'Free Trial', 'For 3 days you can test the V.I.P. Pass and all features unlimited!', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(22, 1, 'Memberships', 'Love Points', 'Not another membership?\r\nWith the LovePoints you are completely free!\r\nGet as many Points as you want without recurring payments.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(23, 1, 'Memberships', 'Payment methods', 'The V.I.P. Pass can be purchased by PayPal, credit card and mobile phone number.\r\nYou can also secure LovePoints with Online Banking.\r\nThe membership fee is debited on the first day of each billing period.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(24, 1, 'Memberships', 'Renewal of membership', 'Your membership will be extended by one month at the end of each membership period.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(25, 1, 'Memberships', 'Cancellation of Membership', 'To cancel for the following month send your cancellation at least 5 days before your membership expires to termination@love-push.com or cancel directly in the app.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(26, 1, 'Memberships', 'Right of Withdrawal', 'Send us the right of withdrawal at the latest 14 days after conclusion of your membership to termination@love-push.com.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(27, 1, 'Affiliate', 'How do I become a Love Push Affiliate?', 'Agree to the Affiliate Terms & Conditions and owe an active V.I.P. Pass.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(28, 1, 'Affiliate', 'How do I get Team Partner?', 'All you must do is copy your referral code in the Affiliate Overview and send it to your friends.\r\nYou can also use it to advertise on social media.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(29, 1, 'Affiliate', 'From what date can I earn commissions?', 'You can use the time until the new year to build up your team.\r\nFrom January 2020 you will be able to earn your first commissions.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(30, 1, 'Affiliate', 'What is the compensation model?', 'You will be compensated on 5 levels, you can find the exact model in the Affiliate Information.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(31, 1, 'Affiliate', 'When do I have to request a withdrawal?', 'Until the 24th of each month in affiliate menu „Withdrawal “, if you have a minimum pay-out balance of 25$.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(32, 1, 'Affiliate', 'Where and when do I get my commissions paid?', 'If you have successfully applied for your pay-out you will get your commission paid to your PayPal account on the 1st of every month.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(33, 1, 'Affiliate', 'Do I have to take care of taxes myself?', 'Yes, Love Push pays you the commissions incl. Taxes to your PayPal account.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(34, 2, 'Allgemein', 'Was ist Love Push?', 'Mithilfe einzigartiger Funktionen helfen wir dir, schnell und einfach mit neuen Menschen in deiner Stadt oder auf der ganzen Welt in Kontakt zu treten!', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(35, 2, 'Allgemein', 'Wie kann ich Love Push nutzen?', 'Unsere App kannst du in den App Stores auf Android und iOS installieren.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(36, 2, 'Allgemein', 'Ist Love Push überall auf der Welt nutzbar?', 'Ja, du kannst die App weltweit nutzen!', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(37, 2, 'Allgemein', 'Was ist das Mindestalter, um sich anzumelden?', 'Das Mindestalter um sich bei LovePush anzumelden ist 18 Jahre.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(38, 2, 'Anmeldung und erste Schritte', 'Kann ich mich auch ohne Facebook/Instagram/G+ anmelden?', 'Ja, du kannst dich auch mit deiner', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(39, 2, 'Anmeldung und erste Schritte', 'Wie kann ich mein Profil bearbeiten?', 'Dein Profil bearbeitest du, indem du im Menü auf dein Profilbild klickst.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(40, 2, 'Anmeldung und erste Schritte', 'Wo stelle ich meine Sucheinstellungen ein?', 'Deine Sucheinstellungen stellst du im Menü unter Einstellungen ? Filter ein.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(41, 2, 'Account', 'Wo stelle ich die Sprache ein?', 'Stelle deine Sprache in den Einstellungen unter „Sprache“ ein.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(42, 2, 'Account', 'Kann ich Nachrichtenanfragen deaktivieren?', 'Ja, wenn du nur von Matches angeschrieben werden willst deaktiviere Nachrichtenanfragen in den Einstellungen unter „stop private messaging“.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(43, 2, 'Account', 'Kann ich meinen Account vorrübergehend deaktivieren?', 'Deaktiviere deinen Account vorrübergehend, indem du in den Einstellungen unter „Hide me from search“.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(44, 2, 'Account', 'Wie lösche ich meinen Account?', 'Lösche deinen Account in den Einstellungen unter „Delete Account“.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(45, 2, 'Account', 'Wie füge ich Bilder hinzu und wie lösche ich Bilder von mir?', 'Deine Bilder kannst du in der Profilbearbeitung hinzufügen und löschen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(46, 2, 'Features LovePush', 'Profil & Posts', 'Gestalte ein interessantes und echtes Profil!\r\nZudem kannst du Bilder in deinem Profil posten - Bilder sagen mehr als 1000 Worte!', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(47, 2, 'Features LovePush', 'Swipe', 'Du kannst zwischen \"next\", \"connect\" oder \"date\" Request entscheiden. \r\nNachdem du gematcht hast, kannst du mit dem Chatten beginnen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(48, 2, 'Features LovePush', 'Radar', 'Du hast einen Überblick über alle Personen in deiner Nähe. Besuche ihr Profil und connecte dich!', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(49, 2, 'Features LovePush', 'Love & Connect Ads', 'Veröffentliche Love- oder Connect-Anzeigen in deiner ausgewählten Stadt und lerne die richtigen Personen am richtigen Ort kennen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(50, 2, 'Features LovePush', 'Personal Matching', 'Du erhältst Vorschläge für Menschen, die zu deinem Charakter passen und welche die gleichen Interessen haben wie du.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(51, 2, 'Features LovePush', 'Around', 'Durch die von uns integrierte Google API hast du die Möglichkeit, die angesagtesten Bars, Restaurants, Festivals & Konzerte in deiner Umgebung zu erkunden und deine Kontakte direkt zu ihnen einzuladen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(52, 2, 'Features LovePush', 'Live Streams', 'Starte oder nehme an einer Live-Session von Leuten in deiner Umgebung teil und schau zu, kommentiere oder nimm daran teil!', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(53, 2, 'Mitgliedschaften', 'Free & V.I.P Pass', 'Mit unserem V.I.P. Pass kannst du alle unsere Funktionen unbegrenzt nutzen und zudem mit unserem Partnerprogramm Geld verdienen. \r\nWeitere Informationen findest du in den Preisinformationen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(54, 2, 'Mitgliedschaften', 'Free Trial', '3 Tage kannst du den V.I.P. Pass und somit alle Features unbegrenzt testen!', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(55, 2, 'Mitgliedschaften', 'Love Points', 'Nicht schon wieder eine Mitgliedschaft?\r\nMit den LovePoints bist du völlig ungebunden!\r\nErhalte so viele Points, wie du kaufst ohne wiederkehrende Zahlungen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(56, 2, 'Mitgliedschaften', 'Zahlungsmöglichkeiten', 'Den V.I.P. Pass kannst du per PayPal, Kreditkarte und mit deiner Handynummer erwerben.\r\nLovePoints kannst du dir zudem noch mit Sofortüberweisung sichern.\r\nDie Mitgliedsgebühr wird jeweils am ersten Tag eines Abrechnungszeitraums abgebucht.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(57, 2, 'Mitgliedschaften', 'Verlängerung der Mitgliedschaft', 'Deine Mitgliedschaft verlängert sich jeweils zum Ende deines Mitgliedsstarts um einen Monat.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(58, 2, 'Mitgliedschaften', 'Kündigung der Mitgliedschaft', 'Um für den Folgemonat zu kündigen sende die Kündigung bis spätestens 5 Tage vor Ablauf deiner Mitgliedschaft an termination@love-push.com oder kündige direkt in der App.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(59, 2, 'Mitgliedschaften', 'Widerrufsrecht', 'Sende uns das Widerrufsrecht bis spätestens 14 Tagen nach Abschluss deiner Mitgliedschaft an termination@love-push.com .', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(60, 2, 'Affiliate', 'Wie werde ich Love Affiliate?', 'Alles, was du tun musst, ist, die Affiliate AGB\'s zu akzeptieren und einen aktiven V.I.P. Pass zu besitzen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(61, 2, 'Affiliate', 'Wie bekomme ich Teampartner?', 'Kopiere deinen Empfehlungscode in der Affiliate Overview und sende ihn an deine Freunde.\r\nDu kannst damit auch auf Social Media werben.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(62, 2, 'Affiliate', 'Ab welchem Datum kann ich Provisionen verdienen?', 'Du kannst die Zeit bis zum neuen Jahr nutzen, um dein Team aufzubauen.\r\nAb Januar 2020 kannst du die ersten Provisionen verdienen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(63, 2, 'Affiliate', 'Wie ist das Vergütungsmodell?', 'Du wirst auf 5 Ebenen vergütet, das genaue Modell finden Sie in den Partnerinformationen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(64, 2, 'Affiliate', 'Bis wann muss eine Auszahlung beantragt werden?', 'Bis zum 24. eines jeden Monats im Affiliate Menü unter „Withdrawal“, wenn Sie ein Mindestauszahlungssaldo von 25$ haben.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(65, 2, 'Affiliate', 'Wo und wann bekomme ich meine Provisionen ausgezahlt?', 'Wenn Sie Ihre Auszahlung erfolgreich beantragt haben, erhalten Sie Ihre Provision am 1. eines jeden Monats auf Ihr PayPal-Konto ausgezahlt.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
(66, 2, 'Affiliate', 'Muss ich mich selbst um die Steuern kümmern?', 'Ja, Love Push zahlt Ihnen die Provisionen inkl. Steuern auf Ihr PayPal-Konto.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `intentions`
--

CREATE TABLE `intentions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intentions`
--

INSERT INTO `intentions` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'relationship', 1, '2019-05-02 14:50:32', '2019-05-02 14:50:32'),
(2, 'friendship', 1, '2019-05-02 14:50:32', '2019-05-02 14:50:32'),
(3, 'daily activities', 1, '2019-05-02 14:50:55', '2019-05-02 14:50:55'),
(4, 'no expectations', 1, '2019-05-02 14:50:55', '2019-05-24 18:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1=Like,0=Dislike',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `from_user_id`, `to_user_id`, `status`, `created_at`, `updated_at`) VALUES
(2062, 506, 501, 1, '2019-11-05 15:33:05', '2019-11-05 15:33:05'),
(2063, 501, 506, 1, '2019-11-05 15:33:23', '2019-11-05 15:33:23'),
(2064, 509, 503, 0, '2019-11-05 15:43:35', '2019-11-05 15:43:35'),
(2077, 522, 509, 1, '2019-11-06 09:17:58', '2019-11-06 09:17:58'),
(2085, 509, 522, 1, '2019-11-06 11:26:07', '2019-11-06 11:26:07'),
(2087, 529, 519, 1, '2019-11-06 12:11:28', '2019-11-06 12:11:28'),
(2088, 526, 519, 1, '2019-11-06 12:12:21', '2019-11-06 12:12:21'),
(2089, 526, 528, 1, '2019-11-06 12:12:22', '2019-11-06 12:12:22'),
(2090, 526, 506, 1, '2019-11-06 12:12:24', '2019-11-06 12:12:24'),
(2091, 526, 514, 1, '2019-11-06 12:12:26', '2019-11-06 12:12:26'),
(2093, 514, 526, 1, '2019-11-06 12:24:00', '2019-11-06 12:24:00'),
(2094, 523, 515, 0, '2019-11-06 13:13:44', '2019-11-06 13:13:44'),
(2095, 503, 514, 0, '2019-11-06 13:36:45', '2019-11-06 13:36:45'),
(2096, 503, 528, 0, '2019-11-06 13:40:23', '2019-11-06 13:40:23'),
(2097, 503, 504, 0, '2019-11-06 13:40:25', '2019-11-06 13:40:25'),
(2098, 503, 515, 0, '2019-11-06 13:41:46', '2019-11-06 13:41:46'),
(2099, 503, 509, 0, '2019-11-06 13:42:02', '2019-11-06 13:42:02'),
(2100, 503, 501, 0, '2019-11-06 13:42:04', '2019-11-06 13:42:04'),
(2101, 503, 522, 0, '2019-11-06 13:42:04', '2019-11-06 13:42:04'),
(2102, 503, 510, 0, '2019-11-06 13:47:22', '2019-11-06 13:47:22'),
(2103, 531, 519, 0, '2019-11-06 15:19:09', '2019-11-06 15:19:09'),
(2104, 548, 519, 1, '2019-11-07 07:55:52', '2019-11-07 07:55:52'),
(2105, 548, 526, 1, '2019-11-07 08:00:19', '2019-11-07 08:00:19'),
(2106, 548, 529, 1, '2019-11-07 08:00:21', '2019-11-07 08:00:21'),
(2107, 548, 528, 1, '2019-11-07 09:10:25', '2019-11-07 09:10:25'),
(2108, 548, 549, 1, '2019-11-07 09:18:59', '2019-11-07 09:18:59'),
(2109, 549, 548, 1, '2019-11-07 09:19:06', '2019-11-07 09:19:06'),
(2110, 504, 541, 1, '2019-11-07 09:39:45', '2019-11-07 09:39:45'),
(2111, 504, 540, 1, '2019-11-07 09:39:48', '2019-11-07 09:39:48'),
(2112, 504, 535, 1, '2019-11-07 09:39:51', '2019-11-07 09:39:51'),
(2113, 504, 528, 1, '2019-11-07 09:39:56', '2019-11-07 09:39:56'),
(2114, 504, 529, 1, '2019-11-07 09:39:57', '2019-11-07 09:39:57'),
(2115, 504, 514, 1, '2019-11-07 09:39:59', '2019-11-07 09:39:59'),
(2116, 504, 534, 1, '2019-11-07 09:40:31', '2019-11-07 09:40:31'),
(2117, 504, 547, 1, '2019-11-07 09:40:32', '2019-11-07 09:40:32'),
(2118, 504, 501, 1, '2019-11-07 09:40:34', '2019-11-07 09:40:34'),
(2119, 546, 535, 0, '2019-11-07 09:55:35', '2019-11-07 09:55:35'),
(2120, 546, 531, 0, '2019-11-07 09:55:36', '2019-11-07 09:55:36'),
(2121, 546, 519, 0, '2019-11-07 09:55:37', '2019-11-07 09:55:37'),
(2122, 546, 513, 0, '2019-11-07 09:55:38', '2019-11-07 09:55:38'),
(2123, 546, 541, 0, '2019-11-07 09:55:39', '2019-11-07 09:55:39'),
(2124, 546, 510, 0, '2019-11-07 09:55:40', '2019-11-07 09:55:40'),
(2125, 546, 540, 0, '2019-11-07 09:55:42', '2019-11-07 09:55:42'),
(2126, 546, 532, 0, '2019-11-07 09:55:42', '2019-11-07 09:55:42'),
(2127, 546, 514, 0, '2019-11-07 09:55:43', '2019-11-07 09:55:43'),
(2128, 546, 515, 0, '2019-11-07 09:55:44', '2019-11-07 09:55:44'),
(2129, 546, 528, 0, '2019-11-07 09:55:45', '2019-11-07 09:55:45'),
(2130, 546, 530, 0, '2019-11-07 09:55:46', '2019-11-07 09:55:46'),
(2131, 546, 529, 0, '2019-11-07 09:55:47', '2019-11-07 09:55:47'),
(2132, 546, 503, 0, '2019-11-07 09:55:48', '2019-11-07 09:55:48'),
(2133, 546, 549, 0, '2019-11-07 09:55:50', '2019-11-07 09:55:50'),
(2134, 546, 506, 0, '2019-11-07 10:05:45', '2019-11-07 10:05:45'),
(2135, 546, 550, 0, '2019-11-07 10:05:46', '2019-11-07 10:05:46'),
(2136, 546, 526, 0, '2019-11-07 10:05:48', '2019-11-07 10:05:48'),
(2137, 546, 509, 0, '2019-11-07 10:05:50', '2019-11-07 10:05:50'),
(2138, 546, 522, 0, '2019-11-07 10:05:51', '2019-11-07 10:05:51'),
(2139, 546, 534, 0, '2019-11-07 10:05:53', '2019-11-07 10:05:53'),
(2140, 546, 501, 0, '2019-11-07 10:05:54', '2019-11-07 10:05:54'),
(2141, 546, 547, 0, '2019-11-07 10:05:56', '2019-11-07 10:05:56'),
(2142, 548, 551, 1, '2019-11-07 10:50:29', '2019-11-07 10:50:29'),
(2143, 551, 548, 1, '2019-11-07 10:59:36', '2019-11-07 10:59:36'),
(2144, 523, 531, 0, '2019-11-07 11:16:02', '2019-11-07 11:16:02'),
(2145, 523, 535, 0, '2019-11-07 11:16:03', '2019-11-07 11:16:03'),
(2146, 523, 513, 0, '2019-11-07 11:16:04', '2019-11-07 11:16:04'),
(2147, 523, 540, 0, '2019-11-07 11:16:05', '2019-11-07 11:16:05'),
(2148, 523, 510, 0, '2019-11-07 11:16:08', '2019-11-07 11:16:08'),
(2149, 523, 519, 0, '2019-11-07 11:16:09', '2019-11-07 11:16:09'),
(2150, 523, 541, 0, '2019-11-07 11:16:11', '2019-11-07 11:16:11'),
(2151, 523, 532, 0, '2019-11-07 11:16:12', '2019-11-07 11:16:12'),
(2152, 523, 514, 0, '2019-11-07 11:16:13', '2019-11-07 11:16:13'),
(2153, 523, 528, 0, '2019-11-07 11:16:14', '2019-11-07 11:16:14'),
(2154, 523, 530, 0, '2019-11-07 11:16:15', '2019-11-07 11:16:15'),
(2155, 523, 529, 0, '2019-11-07 11:16:16', '2019-11-07 11:16:16'),
(2156, 523, 503, 0, '2019-11-07 11:16:18', '2019-11-07 11:16:18'),
(2157, 523, 549, 0, '2019-11-07 11:16:20', '2019-11-07 11:16:20'),
(2158, 523, 506, 0, '2019-11-07 11:16:22', '2019-11-07 11:16:22'),
(2159, 551, 540, 0, '2019-11-07 11:24:16', '2019-11-07 11:24:16'),
(2160, 551, 510, 0, '2019-11-07 11:24:46', '2019-11-07 11:24:46'),
(2161, 551, 541, 1, '2019-11-07 11:24:54', '2019-11-07 11:24:54'),
(2162, 551, 519, 0, '2019-11-07 11:25:21', '2019-11-07 11:25:21'),
(2163, 551, 531, 1, '2019-11-07 11:25:37', '2019-11-07 11:25:37'),
(2164, 551, 513, 0, '2019-11-07 11:26:03', '2019-11-07 11:26:03'),
(2165, 551, 532, 0, '2019-11-07 11:26:33', '2019-11-07 11:26:33'),
(2166, 551, 535, 0, '2019-11-07 11:26:43', '2019-11-07 11:26:43'),
(2167, 551, 547, 1, '2019-11-07 11:26:54', '2019-11-07 11:26:54'),
(2168, 551, 501, 1, '2019-11-07 11:27:18', '2019-11-07 11:27:18'),
(2169, 551, 534, 1, '2019-11-07 11:27:20', '2019-11-07 11:27:20'),
(2170, 551, 522, 1, '2019-11-07 11:27:23', '2019-11-07 11:27:23'),
(2171, 551, 509, 1, '2019-11-07 11:27:28', '2019-11-07 11:27:28'),
(2172, 551, 546, 1, '2019-11-07 11:27:30', '2019-11-07 11:27:30'),
(2173, 551, 504, 1, '2019-11-07 11:27:34', '2019-11-07 11:27:34'),
(2174, 551, 515, 1, '2019-11-07 11:27:36', '2019-11-07 11:27:36'),
(2175, 551, 514, 1, '2019-11-07 11:27:52', '2019-11-07 11:27:52'),
(2176, 551, 528, 1, '2019-11-07 11:27:54', '2019-11-07 11:27:54'),
(2177, 551, 529, 1, '2019-11-07 11:27:56', '2019-11-07 11:27:56'),
(2178, 551, 506, 1, '2019-11-07 11:27:58', '2019-11-07 11:27:58'),
(2179, 551, 526, 1, '2019-11-07 11:28:01', '2019-11-07 11:28:01'),
(2180, 551, 503, 0, '2019-11-07 11:28:43', '2019-11-07 11:28:43'),
(2181, 551, 530, 0, '2019-11-07 11:28:55', '2019-11-07 11:28:55'),
(2182, 551, 550, 0, '2019-11-07 11:28:59', '2019-11-07 11:28:59'),
(2183, 551, 549, 0, '2019-11-07 11:29:38', '2019-11-07 11:29:38'),
(2184, 523, 509, 0, '2019-11-07 12:19:36', '2019-11-07 12:19:36'),
(2185, 523, 522, 0, '2019-11-07 12:19:36', '2019-11-07 12:19:36'),
(2186, 523, 501, 0, '2019-11-07 12:19:38', '2019-11-07 12:19:38'),
(2187, 523, 550, 1, '2019-11-07 12:20:00', '2019-11-07 12:20:00'),
(2188, 523, 534, 1, '2019-11-07 12:20:02', '2019-11-07 12:20:02'),
(2189, 523, 547, 1, '2019-11-07 12:20:03', '2019-11-07 12:20:03'),
(2191, 509, 551, 1, '2019-11-07 12:43:48', '2019-11-07 12:43:48'),
(2192, 552, 531, 0, '2019-11-07 12:53:25', '2019-11-07 12:53:25'),
(2193, 552, 541, 1, '2019-11-07 12:59:04', '2019-11-07 12:59:04'),
(2194, 552, 535, 1, '2019-11-07 12:59:04', '2019-11-07 12:59:04'),
(2195, 552, 519, 1, '2019-11-07 12:59:05', '2019-11-07 12:59:05'),
(2196, 552, 513, 1, '2019-11-07 12:59:05', '2019-11-07 12:59:05'),
(2197, 552, 510, 1, '2019-11-07 12:59:06', '2019-11-07 12:59:06'),
(2198, 552, 540, 1, '2019-11-07 12:59:07', '2019-11-07 12:59:07'),
(2199, 552, 532, 1, '2019-11-07 12:59:08', '2019-11-07 12:59:08'),
(2200, 552, 504, 0, '2019-11-07 12:59:23', '2019-11-07 12:59:23'),
(2201, 552, 515, 0, '2019-11-07 12:59:24', '2019-11-07 12:59:24'),
(2202, 552, 528, 0, '2019-11-07 12:59:25', '2019-11-07 12:59:25'),
(2203, 552, 529, 0, '2019-11-07 12:59:26', '2019-11-07 12:59:26'),
(2204, 552, 548, 0, '2019-11-07 12:59:27', '2019-11-07 12:59:27'),
(2205, 552, 549, 0, '2019-11-07 12:59:29', '2019-11-07 12:59:29'),
(2206, 552, 522, 1, '2019-11-07 13:01:04', '2019-11-07 13:01:04'),
(2207, 552, 526, 0, '2019-11-07 13:05:08', '2019-11-07 13:05:08'),
(2208, 552, 509, 0, '2019-11-07 13:05:10', '2019-11-07 13:05:10'),
(2209, 552, 503, 1, '2019-11-07 13:05:14', '2019-11-07 13:05:14'),
(2210, 552, 501, 1, '2019-11-07 13:05:21', '2019-11-07 13:05:21'),
(2211, 504, 551, 1, '2019-11-07 13:21:29', '2019-11-07 13:21:29'),
(2212, 549, 526, 1, '2019-11-07 13:28:25', '2019-11-07 13:28:25'),
(2213, 549, 551, 1, '2019-11-07 13:28:27', '2019-11-07 13:28:27'),
(2214, 549, 546, 1, '2019-11-07 13:28:28', '2019-11-07 13:28:28'),
(2215, 549, 552, 0, '2019-11-07 13:33:21', '2019-11-07 13:33:21'),
(2216, 549, 523, 0, '2019-11-07 13:33:23', '2019-11-07 13:33:23'),
(2217, 549, 509, 0, '2019-11-07 13:33:24', '2019-11-07 13:33:24'),
(2218, 549, 522, 0, '2019-11-07 13:33:25', '2019-11-07 13:33:25'),
(2219, 549, 534, 0, '2019-11-07 13:33:26', '2019-11-07 13:33:26'),
(2220, 549, 501, 0, '2019-11-07 13:33:27', '2019-11-07 13:33:27'),
(2221, 549, 547, 0, '2019-11-07 13:33:29', '2019-11-07 13:33:29'),
(2222, 523, 552, 0, '2019-11-07 13:36:24', '2019-11-07 13:36:24'),
(2223, 551, 552, 0, '2019-11-07 13:38:28', '2019-11-07 13:38:28'),
(2224, 523, 550, 0, '2019-11-07 13:44:04', '2019-11-07 13:44:04'),
(2225, 523, 534, 0, '2019-11-07 13:44:06', '2019-11-07 13:44:06'),
(2226, 523, 547, 0, '2019-11-07 13:44:06', '2019-11-07 13:44:06'),
(2240, 554, 519, 0, '2019-11-08 01:27:15', '2019-11-08 01:27:15'),
(2241, 554, 532, 0, '2019-11-08 01:27:17', '2019-11-08 01:27:17'),
(2242, 554, 510, 0, '2019-11-08 01:27:18', '2019-11-08 01:27:18'),
(2243, 554, 540, 0, '2019-11-08 01:27:19', '2019-11-08 01:27:19'),
(2244, 512, 541, 0, '2019-11-08 04:54:07', '2019-11-08 04:54:07'),
(2245, 512, 535, 0, '2019-11-08 04:54:09', '2019-11-08 04:54:09'),
(2246, 512, 531, 0, '2019-11-08 04:54:15', '2019-11-08 04:54:15'),
(2247, 512, 519, 0, '2019-11-08 04:54:16', '2019-11-08 04:54:16'),
(2248, 548, 554, 1, '2019-11-08 04:57:06', '2019-11-08 04:57:06'),
(2249, 550, 523, 1, '2019-11-08 05:10:02', '2019-11-08 05:10:02'),
(2250, 550, 532, 0, '2019-11-08 05:13:10', '2019-11-08 05:13:10'),
(2251, 550, 535, 0, '2019-11-08 05:13:14', '2019-11-08 05:13:14'),
(2252, 550, 519, 0, '2019-11-08 05:13:19', '2019-11-08 05:13:19'),
(2253, 550, 540, 0, '2019-11-08 05:13:22', '2019-11-08 05:13:22'),
(2254, 550, 513, 0, '2019-11-08 05:13:24', '2019-11-08 05:13:24'),
(2255, 550, 531, 0, '2019-11-08 05:13:26', '2019-11-08 05:13:26'),
(2256, 550, 510, 0, '2019-11-08 05:13:29', '2019-11-08 05:13:29'),
(2257, 550, 541, 0, '2019-11-08 05:13:30', '2019-11-08 05:13:30'),
(2258, 550, 509, 0, '2019-11-08 05:13:31', '2019-11-08 05:13:31'),
(2259, 550, 522, 0, '2019-11-08 05:13:32', '2019-11-08 05:13:32'),
(2260, 550, 514, 0, '2019-11-08 05:13:34', '2019-11-08 05:13:34'),
(2261, 550, 529, 0, '2019-11-08 05:13:35', '2019-11-08 05:13:35'),
(2262, 550, 528, 0, '2019-11-08 05:13:36', '2019-11-08 05:13:36'),
(2263, 550, 530, 0, '2019-11-08 05:13:37', '2019-11-08 05:13:37'),
(2264, 550, 515, 0, '2019-11-08 05:13:39', '2019-11-08 05:13:39'),
(2265, 550, 503, 0, '2019-11-08 05:13:40', '2019-11-08 05:13:40'),
(2266, 550, 506, 0, '2019-11-08 05:13:41', '2019-11-08 05:13:41'),
(2267, 550, 526, 0, '2019-11-08 05:13:42', '2019-11-08 05:13:42'),
(2268, 550, 552, 0, '2019-11-08 05:13:43', '2019-11-08 05:13:43'),
(2269, 550, 551, 0, '2019-11-08 05:13:44', '2019-11-08 05:13:44'),
(2270, 550, 546, 0, '2019-11-08 05:13:45', '2019-11-08 05:13:45'),
(2271, 550, 554, 0, '2019-11-08 05:13:57', '2019-11-08 05:13:57'),
(2272, 550, 501, 0, '2019-11-08 05:13:58', '2019-11-08 05:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `event_type` enum('L','C','M') NOT NULL COMMENT 'match found by L=Like, C=Connect req, M=by chat messaging req',
  `user_id` int(11) DEFAULT NULL COMMENT 'second like user_id',
  `like_by_me` int(11) DEFAULT NULL COMMENT 'first like user_id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=match, 0=unmatch',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `event_type`, `user_id`, `like_by_me`, `status`, `created_at`, `updated_at`) VALUES
(447, 'L', 501, 506, 1, '2019-11-05 15:33:23', '2019-11-05 15:33:23'),
(453, 'L', 509, 522, 1, '2019-11-06 11:26:07', '2019-11-06 11:26:07'),
(455, 'C', 526, 529, 1, '2019-11-06 12:15:31', '2019-11-06 12:15:31'),
(456, 'L', 514, 526, 1, '2019-11-06 12:24:00', '2019-11-06 12:24:00'),
(457, 'C', 526, 503, 1, '2019-11-06 12:52:28', '2019-11-06 12:52:28'),
(458, 'C', 529, 503, 1, '2019-11-06 12:52:32', '2019-11-06 12:52:32'),
(459, 'C', 526, 523, 1, '2019-11-06 12:57:47', '2019-11-06 12:57:47'),
(460, 'C', 530, 515, 1, '2019-11-06 13:29:53', '2019-11-06 13:29:53'),
(461, 'C', 526, 515, 1, '2019-11-06 13:29:55', '2019-11-06 13:29:55'),
(462, 'C', 509, 515, 1, '2019-11-06 13:29:56', '2019-11-06 13:29:56'),
(463, 'C', 526, 509, 1, '2019-11-06 20:59:21', '2019-11-06 20:59:21'),
(464, 'C', 546, 523, 1, '2019-11-07 07:18:29', '2019-11-07 07:18:29'),
(465, 'L', 549, 548, 1, '2019-11-07 09:19:06', '2019-11-07 09:19:06'),
(466, 'C', 548, 504, 1, '2019-11-07 09:39:30', '2019-11-07 09:39:30'),
(467, 'C', 504, 546, 1, '2019-11-07 09:48:02', '2019-11-07 09:48:02'),
(468, 'C', 548, 546, 1, '2019-11-07 09:48:05', '2019-11-07 09:48:05'),
(469, 'C', 504, 523, 1, '2019-11-07 09:53:18', '2019-11-07 09:53:18'),
(470, 'C', 548, 523, 1, '2019-11-07 09:53:20', '2019-11-07 09:53:20'),
(471, 'C', 551, 523, 1, '2019-11-07 10:44:10', '2019-11-07 10:44:10'),
(472, 'L', 551, 548, 1, '2019-11-07 10:59:36', '2019-11-07 10:59:36'),
(473, 'C', 504, 549, 1, '2019-11-07 11:11:21', '2019-11-07 11:11:21'),
(474, 'C', 548, 509, 1, '2019-11-07 12:43:44', '2019-11-07 12:43:44'),
(475, 'C', 504, 509, 1, '2019-11-07 12:43:47', '2019-11-07 12:43:47'),
(476, 'L', 509, 551, 1, '2019-11-07 12:43:48', '2019-11-07 12:43:48'),
(477, 'L', 504, 551, 1, '2019-11-07 13:21:29', '2019-11-07 13:21:29'),
(478, 'C', 548, 550, 1, '2019-11-08 05:09:59', '2019-11-08 05:09:59'),
(479, 'C', 504, 550, 1, '2019-11-08 05:10:00', '2019-11-08 05:10:00'),
(480, 'L', 550, 523, 1, '2019-11-08 05:10:02', '2019-11-08 05:10:02'),
(481, 'C', 549, 550, 1, '2019-11-08 05:10:03', '2019-11-08 05:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '2014_10_12_000000_create_users_table', 1),
(27, '2014_10_12_100000_create_password_resets_table', 1),
(28, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(29, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(30, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(31, '2016_06_01_000004_create_oauth_clients_table', 1),
(32, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(33, '2019_01_15_133005_create_post_ads_table', 1),
(34, '2019_01_16_074723_add_image_to_users_table', 1),
(35, '2019_01_16_075955_create_user_profile_images_table', 1),
(36, '2019_01_16_125501_add_role_to_users_table', 1),
(37, '2019_01_17_070145_add_city_country_to_users_table', 1),
(38, '2019_01_18_102128_create_user_requests_table', 1),
(39, '2019_01_18_103857_create_notifications_table', 1),
(40, '2019_01_21_072426_create_personality_questions_table', 2),
(41, '2019_01_21_072803_create_personality_questions_options_table', 2),
(42, '2019_01_21_095504_create_personality_tests_table', 2),
(43, '2019_01_22_042411_change_radius_to_post_ads_table', 3),
(44, '2019_01_23_093446_add_otp_to_users_table', 4),
(45, '2019_01_24_101128_create_feeds_table', 5),
(46, '2019_01_25_091432_add_seetingsparam_to_users_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `event_type` enum('L','S_C_R','A_C_R','R_C_R','S_M_R','A_M_R','R_M_R','S_L_R','A_L_R','P_L_R') NOT NULL COMMENT 'L=like, S_C_R=send connect request, A_C_R=accept connect request, R_C_R=reject connect request, S_M_R=send messaging request, A_M_R=accept messaging request, R_M_R=reject messaging request',
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `isRead` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `event_type`, `event_id`, `user_id`, `to_user_id`, `status`, `isRead`, `created_at`, `updated_at`) VALUES
(2581, 'S_L_R', 2062, 506, 501, 0, 1, '2019-11-05 15:33:05', '2019-11-05 15:33:23'),
(2582, 'A_L_R', 2063, 501, 506, 1, 1, '2019-11-05 15:33:23', '2019-11-05 15:34:29'),
(2603, 'S_C_R', 978, 509, 515, 0, 1, '2019-11-06 07:46:58', '2019-11-06 13:29:56'),
(2605, 'S_L_R', 2077, 522, 509, 0, 1, '2019-11-06 09:17:58', '2019-11-06 11:26:07'),
(2616, 'A_L_R', 2085, 509, 522, 0, 1, '2019-11-06 11:26:07', '2019-11-07 07:10:56'),
(2620, 'S_C_R', 982, 529, 513, 1, 0, '2019-11-06 12:11:22', '2019-11-06 12:11:22'),
(2621, 'S_C_R', 983, 529, 510, 1, 0, '2019-11-06 12:11:24', '2019-11-06 12:11:24'),
(2622, 'S_C_R', 984, 529, 503, 0, 1, '2019-11-06 12:11:25', '2019-11-06 12:52:32'),
(2623, 'S_L_R', 2087, 529, 519, 1, 0, '2019-11-06 12:11:28', '2019-11-06 12:11:28'),
(2625, 'S_C_R', 986, 526, 513, 1, 0, '2019-11-06 12:12:18', '2019-11-06 12:12:18'),
(2626, 'S_C_R', 987, 526, 510, 1, 0, '2019-11-06 12:12:19', '2019-11-06 12:12:19'),
(2628, 'S_L_R', 2088, 526, 519, 1, 0, '2019-11-06 12:12:21', '2019-11-06 12:12:21'),
(2629, 'S_C_R', 989, 526, 503, 0, 1, '2019-11-06 12:12:21', '2019-11-06 12:52:28'),
(2630, 'S_L_R', 2089, 526, 528, 1, 0, '2019-11-06 12:12:22', '2019-11-06 12:12:22'),
(2631, 'S_C_R', 990, 526, 529, 0, 1, '2019-11-06 12:12:23', '2019-11-06 12:15:31'),
(2632, 'S_L_R', 2090, 526, 506, 1, 0, '2019-11-06 12:12:24', '2019-11-06 12:12:24'),
(2633, 'S_C_R', 991, 526, 515, 0, 1, '2019-11-06 12:12:24', '2019-11-06 13:29:55'),
(2634, 'S_L_R', 2091, 526, 514, 0, 1, '2019-11-06 12:12:26', '2019-11-06 12:24:00'),
(2635, 'S_C_R', 992, 526, 523, 0, 1, '2019-11-06 12:12:27', '2019-11-06 12:57:47'),
(2637, 'S_C_R', 994, 526, 509, 0, 1, '2019-11-06 12:12:28', '2019-11-06 20:59:21'),
(2638, 'S_C_R', 995, 526, 501, 1, 1, '2019-11-06 12:12:29', '2019-11-07 07:31:53'),
(2639, 'S_C_R', 996, 526, 522, 0, 1, '2019-11-06 12:12:29', '2019-11-07 07:11:41'),
(2640, 'S_L_R', 2092, 529, 526, 0, 1, '2019-11-06 12:12:34', '2019-11-06 12:20:15'),
(2641, 'A_C_R', 990, 529, 526, 1, 1, '2019-11-06 12:15:31', '2019-11-06 12:20:11'),
(2642, 'A_L_R', 2093, 514, 526, 1, 1, '2019-11-06 12:24:00', '2019-11-06 12:25:02'),
(2643, 'A_C_R', 989, 503, 526, 1, 1, '2019-11-06 12:52:28', '2019-11-06 12:52:57'),
(2644, 'A_C_R', 984, 503, 529, 1, 0, '2019-11-06 12:52:32', '2019-11-06 12:52:32'),
(2645, 'A_C_R', 992, 523, 526, 1, 1, '2019-11-06 12:57:47', '2019-11-06 12:58:05'),
(2646, 'S_C_R', 997, 530, 515, 0, 1, '2019-11-06 13:15:46', '2019-11-06 13:29:53'),
(2647, 'S_C_R', 998, 530, 519, 1, 0, '2019-11-06 13:15:50', '2019-11-06 13:15:50'),
(2648, 'A_C_R', 997, 515, 530, 0, 1, '2019-11-06 13:29:53', '2019-11-06 14:55:19'),
(2649, 'A_C_R', 991, 515, 526, 1, 1, '2019-11-06 13:29:55', '2019-11-06 13:31:45'),
(2650, 'A_C_R', 978, 515, 509, 1, 1, '2019-11-06 13:29:56', '2019-11-06 20:59:19'),
(2651, 'S_C_R', 999, 504, 515, 1, 0, '2019-11-06 13:35:52', '2019-11-06 13:35:52'),
(2652, 'A_C_R', 994, 509, 526, 1, 1, '2019-11-06 20:59:21', '2019-11-07 06:04:59'),
(2653, 'P_L_R', 165, 522, 509, 1, 1, '2019-11-07 07:11:17', '2019-11-07 12:43:37'),
(2654, 'S_C_R', 1000, 546, 523, 0, 1, '2019-11-07 07:18:12', '2019-11-07 07:18:29'),
(2655, 'A_C_R', 1000, 523, 546, 1, 1, '2019-11-07 07:18:29', '2019-11-07 09:08:40'),
(2656, 'S_C_R', 1001, 504, 531, 1, 0, '2019-11-07 07:45:24', '2019-11-07 07:45:24'),
(2657, 'S_C_R', 1002, 548, 504, 0, 1, '2019-11-07 07:54:41', '2019-11-07 09:39:31'),
(2658, 'S_C_R', 1003, 548, 515, 1, 0, '2019-11-07 07:55:48', '2019-11-07 07:55:48'),
(2659, 'S_L_R', 2104, 548, 519, 1, 0, '2019-11-07 07:55:52', '2019-11-07 07:55:52'),
(2660, 'S_C_R', 1004, 548, 541, 1, 0, '2019-11-07 07:55:54', '2019-11-07 07:55:54'),
(2661, 'S_C_R', 1005, 548, 535, 1, 0, '2019-11-07 07:55:56', '2019-11-07 07:55:56'),
(2662, 'S_C_R', 1006, 548, 540, 1, 0, '2019-11-07 07:55:57', '2019-11-07 07:55:57'),
(2663, 'S_C_R', 1007, 548, 513, 1, 0, '2019-11-07 07:55:59', '2019-11-07 07:55:59'),
(2664, 'S_C_R', 1008, 548, 531, 1, 0, '2019-11-07 07:59:00', '2019-11-07 07:59:00'),
(2665, 'S_C_R', 1009, 548, 532, 1, 0, '2019-11-07 07:59:03', '2019-11-07 07:59:03'),
(2666, 'S_C_R', 1010, 548, 510, 1, 0, '2019-11-07 07:59:04', '2019-11-07 07:59:04'),
(2667, 'S_C_R', 1011, 548, 530, 1, 0, '2019-11-07 07:59:05', '2019-11-07 07:59:05'),
(2668, 'S_L_R', 2105, 548, 526, 1, 0, '2019-11-07 08:00:19', '2019-11-07 08:00:19'),
(2669, 'S_L_R', 2106, 548, 529, 1, 0, '2019-11-07 08:00:21', '2019-11-07 08:00:21'),
(2670, 'S_L_R', 2107, 548, 528, 1, 0, '2019-11-07 09:10:25', '2019-11-07 09:10:25'),
(2671, 'S_C_R', 1012, 548, 514, 1, 0, '2019-11-07 09:18:55', '2019-11-07 09:18:55'),
(2672, 'S_C_R', 1013, 548, 503, 1, 0, '2019-11-07 09:18:57', '2019-11-07 09:18:57'),
(2673, 'S_L_R', 2108, 548, 549, 0, 1, '2019-11-07 09:18:59', '2019-11-07 09:19:06'),
(2674, 'A_L_R', 2109, 549, 548, 1, 1, '2019-11-07 09:19:06', '2019-11-07 09:19:19'),
(2675, 'S_C_R', 1014, 548, 506, 1, 0, '2019-11-07 09:36:29', '2019-11-07 09:36:29'),
(2676, 'S_C_R', 1015, 548, 546, 0, 1, '2019-11-07 09:36:31', '2019-11-07 09:48:05'),
(2677, 'S_C_R', 1016, 548, 523, 0, 1, '2019-11-07 09:36:32', '2019-11-07 09:53:20'),
(2678, 'S_C_R', 1017, 548, 509, 0, 1, '2019-11-07 09:36:33', '2019-11-07 12:43:44'),
(2679, 'S_C_R', 1018, 548, 522, 1, 1, '2019-11-07 09:36:38', '2019-11-07 13:19:13'),
(2680, 'S_C_R', 1019, 548, 550, 0, 1, '2019-11-07 09:36:40', '2019-11-08 05:09:59'),
(2681, 'S_C_R', 1020, 548, 534, 1, 0, '2019-11-07 09:36:41', '2019-11-07 09:36:41'),
(2682, 'S_C_R', 1021, 548, 501, 1, 0, '2019-11-07 09:36:43', '2019-11-07 09:36:43'),
(2683, 'S_C_R', 1022, 548, 547, 1, 0, '2019-11-07 09:36:44', '2019-11-07 09:36:44'),
(2684, 'A_C_R', 1002, 504, 548, 1, 1, '2019-11-07 09:39:30', '2019-11-07 10:17:51'),
(2685, 'S_C_R', 1023, 504, 510, 1, 0, '2019-11-07 09:39:42', '2019-11-07 09:39:42'),
(2686, 'S_C_R', 1024, 504, 513, 1, 0, '2019-11-07 09:39:44', '2019-11-07 09:39:44'),
(2687, 'S_L_R', 2110, 504, 541, 1, 0, '2019-11-07 09:39:45', '2019-11-07 09:39:45'),
(2688, 'S_C_R', 1025, 504, 532, 1, 0, '2019-11-07 09:39:47', '2019-11-07 09:39:47'),
(2689, 'S_L_R', 2111, 504, 540, 1, 0, '2019-11-07 09:39:48', '2019-11-07 09:39:48'),
(2690, 'S_C_R', 1026, 504, 519, 1, 0, '2019-11-07 09:39:49', '2019-11-07 09:39:49'),
(2691, 'S_L_R', 2112, 504, 535, 1, 0, '2019-11-07 09:39:51', '2019-11-07 09:39:51'),
(2692, 'S_C_R', 1027, 504, 530, 1, 0, '2019-11-07 09:39:53', '2019-11-07 09:39:53'),
(2693, 'S_L_R', 2113, 504, 528, 1, 0, '2019-11-07 09:39:56', '2019-11-07 09:39:56'),
(2694, 'S_L_R', 2114, 504, 529, 1, 0, '2019-11-07 09:39:57', '2019-11-07 09:39:57'),
(2695, 'S_L_R', 2115, 504, 514, 1, 0, '2019-11-07 09:39:59', '2019-11-07 09:39:59'),
(2696, 'S_C_R', 1028, 504, 503, 1, 0, '2019-11-07 09:40:01', '2019-11-07 09:40:01'),
(2697, 'S_C_R', 1029, 504, 506, 1, 0, '2019-11-07 09:40:02', '2019-11-07 09:40:02'),
(2698, 'S_C_R', 1030, 504, 550, 0, 1, '2019-11-07 09:40:03', '2019-11-08 05:10:00'),
(2699, 'S_C_R', 1031, 504, 549, 0, 1, '2019-11-07 09:40:04', '2019-11-07 11:11:21'),
(2700, 'S_C_R', 1032, 504, 526, 1, 0, '2019-11-07 09:40:06', '2019-11-07 09:40:06'),
(2701, 'S_C_R', 1033, 504, 546, 0, 1, '2019-11-07 09:40:07', '2019-11-07 09:48:02'),
(2702, 'S_C_R', 1034, 504, 523, 0, 1, '2019-11-07 09:40:08', '2019-11-07 09:53:19'),
(2703, 'S_C_R', 1035, 504, 509, 0, 1, '2019-11-07 09:40:10', '2019-11-07 12:43:47'),
(2704, 'S_C_R', 1036, 504, 522, 1, 1, '2019-11-07 09:40:29', '2019-11-07 13:19:13'),
(2705, 'S_L_R', 2116, 504, 534, 1, 0, '2019-11-07 09:40:31', '2019-11-07 09:40:31'),
(2706, 'S_L_R', 2117, 504, 547, 1, 0, '2019-11-07 09:40:32', '2019-11-07 09:40:32'),
(2707, 'S_L_R', 2118, 504, 501, 1, 0, '2019-11-07 09:40:34', '2019-11-07 09:40:34'),
(2708, 'A_C_R', 1033, 546, 504, 1, 1, '2019-11-07 09:48:02', '2019-11-07 13:21:25'),
(2709, 'A_C_R', 1015, 546, 548, 1, 1, '2019-11-07 09:48:05', '2019-11-07 10:17:51'),
(2710, 'P_L_R', 171, 546, 523, 0, 1, '2019-11-07 09:52:25', '2019-11-07 09:53:23'),
(2711, 'P_L_R', 173, 523, 526, 1, 0, '2019-11-07 09:52:41', '2019-11-07 09:52:41'),
(2712, 'A_C_R', 1034, 523, 504, 1, 1, '2019-11-07 09:53:18', '2019-11-07 13:21:25'),
(2713, 'A_C_R', 1016, 523, 548, 1, 1, '2019-11-07 09:53:20', '2019-11-07 10:17:51'),
(2714, 'P_L_R', 174, 546, 548, 1, 1, '2019-11-07 09:55:57', '2019-11-07 10:17:51'),
(2715, 'P_L_R', 174, 523, 548, 1, 1, '2019-11-07 09:56:16', '2019-11-07 10:17:51'),
(2716, 'P_L_R', 170, 523, 526, 1, 0, '2019-11-07 09:56:27', '2019-11-07 09:56:27'),
(2717, 'S_C_R', 1037, 551, 523, 0, 1, '2019-11-07 10:43:54', '2019-11-07 10:44:10'),
(2718, 'A_C_R', 1037, 523, 551, 1, 1, '2019-11-07 10:44:10', '2019-11-07 10:44:27'),
(2719, 'P_L_R', 171, 551, 523, 1, 1, '2019-11-07 10:44:33', '2019-11-07 10:44:42'),
(2720, 'S_L_R', 2142, 548, 551, 0, 1, '2019-11-07 10:50:29', '2019-11-07 10:59:36'),
(2721, 'P_L_R', 176, 523, 551, 0, 1, '2019-11-07 10:58:58', '2019-11-07 11:15:18'),
(2722, 'A_L_R', 2143, 551, 548, 1, 1, '2019-11-07 10:59:36', '2019-11-07 11:06:05'),
(2723, 'A_C_R', 1031, 549, 504, 1, 1, '2019-11-07 11:11:21', '2019-11-07 13:21:25'),
(2724, 'P_L_R', 169, 551, 523, 1, 1, '2019-11-07 11:12:37', '2019-11-07 11:14:18'),
(2725, 'S_L_R', 2161, 551, 541, 1, 0, '2019-11-07 11:24:55', '2019-11-07 11:24:55'),
(2726, 'S_L_R', 2163, 551, 531, 1, 0, '2019-11-07 11:25:37', '2019-11-07 11:25:37'),
(2727, 'S_L_R', 2167, 551, 547, 1, 0, '2019-11-07 11:26:54', '2019-11-07 11:26:54'),
(2728, 'S_L_R', 2168, 551, 501, 1, 0, '2019-11-07 11:27:18', '2019-11-07 11:27:18'),
(2729, 'S_L_R', 2169, 551, 534, 1, 0, '2019-11-07 11:27:20', '2019-11-07 11:27:20'),
(2730, 'S_L_R', 2170, 551, 522, 1, 1, '2019-11-07 11:27:23', '2019-11-07 13:19:13'),
(2731, 'S_L_R', 2171, 551, 509, 0, 1, '2019-11-07 11:27:28', '2019-11-07 12:43:48'),
(2732, 'S_L_R', 2172, 551, 546, 1, 0, '2019-11-07 11:27:30', '2019-11-07 11:27:30'),
(2733, 'S_L_R', 2173, 551, 504, 0, 1, '2019-11-07 11:27:34', '2019-11-07 13:21:29'),
(2734, 'S_L_R', 2174, 551, 515, 1, 0, '2019-11-07 11:27:36', '2019-11-07 11:27:36'),
(2735, 'S_L_R', 2175, 551, 514, 1, 0, '2019-11-07 11:27:52', '2019-11-07 11:27:52'),
(2736, 'S_L_R', 2176, 551, 528, 1, 0, '2019-11-07 11:27:54', '2019-11-07 11:27:54'),
(2737, 'S_L_R', 2177, 551, 529, 1, 0, '2019-11-07 11:27:56', '2019-11-07 11:27:56'),
(2738, 'S_L_R', 2178, 551, 506, 1, 0, '2019-11-07 11:27:58', '2019-11-07 11:27:58'),
(2739, 'S_L_R', 2179, 551, 526, 1, 0, '2019-11-07 11:28:01', '2019-11-07 11:28:01'),
(2740, 'S_L_R', 2187, 523, 550, 0, 1, '2019-11-07 12:20:00', '2019-11-08 05:10:02'),
(2741, 'S_L_R', 2188, 523, 534, 1, 0, '2019-11-07 12:20:02', '2019-11-07 12:20:02'),
(2742, 'S_L_R', 2189, 523, 547, 1, 0, '2019-11-07 12:20:03', '2019-11-07 12:20:03'),
(2743, 'A_C_R', 1017, 509, 548, 1, 1, '2019-11-07 12:43:44', '2019-11-08 04:55:57'),
(2744, 'A_C_R', 1035, 509, 504, 1, 1, '2019-11-07 12:43:47', '2019-11-07 13:21:25'),
(2745, 'A_L_R', 2191, 509, 551, 1, 0, '2019-11-07 12:43:48', '2019-11-07 12:43:48'),
(2746, 'S_C_R', 1038, 509, 534, 1, 0, '2019-11-07 12:44:46', '2019-11-07 12:44:46'),
(2747, 'S_L_R', 2193, 552, 541, 1, 0, '2019-11-07 12:59:04', '2019-11-07 12:59:04'),
(2748, 'S_L_R', 2194, 552, 535, 1, 0, '2019-11-07 12:59:04', '2019-11-07 12:59:04'),
(2749, 'S_L_R', 2195, 552, 519, 1, 0, '2019-11-07 12:59:05', '2019-11-07 12:59:05'),
(2750, 'S_L_R', 2196, 552, 513, 1, 0, '2019-11-07 12:59:05', '2019-11-07 12:59:05'),
(2751, 'S_L_R', 2197, 552, 510, 1, 0, '2019-11-07 12:59:06', '2019-11-07 12:59:06'),
(2752, 'S_L_R', 2198, 552, 540, 1, 0, '2019-11-07 12:59:07', '2019-11-07 12:59:07'),
(2753, 'S_L_R', 2199, 552, 532, 1, 0, '2019-11-07 12:59:08', '2019-11-07 12:59:08'),
(2754, 'S_L_R', 2206, 552, 522, 1, 1, '2019-11-07 13:01:04', '2019-11-07 13:19:13'),
(2755, 'S_L_R', 2209, 552, 503, 1, 0, '2019-11-07 13:05:14', '2019-11-07 13:05:14'),
(2756, 'S_L_R', 2210, 552, 501, 1, 0, '2019-11-07 13:05:21', '2019-11-07 13:05:21'),
(2757, 'A_L_R', 2211, 504, 551, 1, 0, '2019-11-07 13:21:29', '2019-11-07 13:21:29'),
(2758, 'P_L_R', 165, 551, 509, 1, 1, '2019-11-07 13:22:06', '2019-11-07 22:26:16'),
(2759, 'P_L_R', 168, 551, 509, 1, 1, '2019-11-07 13:22:12', '2019-11-07 22:26:16'),
(2760, 'S_C_R', 1039, 548, 552, 1, 0, '2019-11-07 13:24:47', '2019-11-07 13:24:47'),
(2761, 'S_C_R', 1040, 549, 515, 1, 0, '2019-11-07 13:25:33', '2019-11-07 13:25:33'),
(2762, 'S_C_R', 1041, 549, 531, 1, 0, '2019-11-07 13:28:03', '2019-11-07 13:28:03'),
(2763, 'S_C_R', 1042, 549, 541, 1, 0, '2019-11-07 13:28:05', '2019-11-07 13:28:05'),
(2764, 'S_C_R', 1043, 549, 532, 1, 0, '2019-11-07 13:28:06', '2019-11-07 13:28:06'),
(2765, 'S_C_R', 1044, 549, 535, 1, 0, '2019-11-07 13:28:07', '2019-11-07 13:28:07'),
(2766, 'S_C_R', 1045, 549, 513, 1, 0, '2019-11-07 13:28:09', '2019-11-07 13:28:09'),
(2767, 'S_C_R', 1046, 549, 519, 1, 0, '2019-11-07 13:28:11', '2019-11-07 13:28:11'),
(2768, 'S_C_R', 1047, 549, 510, 1, 0, '2019-11-07 13:28:12', '2019-11-07 13:28:12'),
(2769, 'S_C_R', 1048, 549, 540, 1, 0, '2019-11-07 13:28:13', '2019-11-07 13:28:13'),
(2770, 'S_C_R', 1049, 549, 503, 1, 0, '2019-11-07 13:28:15', '2019-11-07 13:28:15'),
(2771, 'S_C_R', 1050, 549, 530, 1, 0, '2019-11-07 13:28:16', '2019-11-07 13:28:16'),
(2772, 'S_C_R', 1051, 549, 528, 1, 0, '2019-11-07 13:28:17', '2019-11-07 13:28:17'),
(2773, 'S_C_R', 1052, 549, 529, 1, 0, '2019-11-07 13:28:19', '2019-11-07 13:28:19'),
(2774, 'S_C_R', 1053, 549, 514, 1, 0, '2019-11-07 13:28:21', '2019-11-07 13:28:21'),
(2775, 'S_C_R', 1054, 549, 506, 1, 0, '2019-11-07 13:28:22', '2019-11-07 13:28:22'),
(2776, 'S_C_R', 1055, 549, 550, 0, 1, '2019-11-07 13:28:24', '2019-11-08 05:10:03'),
(2777, 'S_L_R', 2212, 549, 526, 1, 0, '2019-11-07 13:28:25', '2019-11-07 13:28:25'),
(2778, 'S_L_R', 2213, 549, 551, 1, 0, '2019-11-07 13:28:27', '2019-11-07 13:28:27'),
(2779, 'S_L_R', 2214, 549, 546, 1, 0, '2019-11-07 13:28:28', '2019-11-07 13:28:28'),
(2780, 'S_C_R', 1056, 512, 530, 1, 0, '2019-11-08 04:52:14', '2019-11-08 04:52:14'),
(2781, 'S_C_R', 1057, 512, 510, 1, 0, '2019-11-08 04:52:16', '2019-11-08 04:52:16'),
(2782, 'S_C_R', 1058, 512, 532, 1, 0, '2019-11-08 04:52:18', '2019-11-08 04:52:18'),
(2783, 'S_L_R', 2248, 548, 554, 1, 0, '2019-11-08 04:57:06', '2019-11-08 04:57:06'),
(2784, 'A_C_R', 1019, 550, 548, 1, 0, '2019-11-08 05:09:59', '2019-11-08 05:09:59'),
(2785, 'A_C_R', 1030, 550, 504, 1, 0, '2019-11-08 05:10:00', '2019-11-08 05:10:00'),
(2786, 'A_L_R', 2249, 550, 523, 1, 0, '2019-11-08 05:10:02', '2019-11-08 05:10:02'),
(2787, 'A_C_R', 1055, 550, 549, 1, 0, '2019-11-08 05:10:03', '2019-11-08 05:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `notification_descs`
--

CREATE TABLE `notification_descs` (
  `notification_id` int(11) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '1',
  `message` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_descs`
--

INSERT INTO `notification_descs` (`notification_id`, `language_id`, `message`, `created_at`, `updated_at`) VALUES
(2581, 1, 'Micheal Johns has sent you Date Request.', '2019-11-05 15:33:05', '2019-11-05 15:33:05'),
(2581, 2, 'Micheal Johns hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 15:33:05', '2019-11-05 15:33:05'),
(2582, 1, 'Devin Dalkis has accepted your Date Request.', '2019-11-05 15:33:23', '2019-11-05 15:33:23'),
(2582, 2, 'Devin Dalkis hat Ihre Terminanfrage angenommen.', '2019-11-05 15:33:23', '2019-11-05 15:33:23'),
(2603, 1, 'Zaib rajput has sent you Connect Request', '2019-11-06 07:46:58', '2019-11-06 07:46:58'),
(2603, 2, 'Zaib rajput hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 07:46:58', '2019-11-06 07:46:58'),
(2605, 1, 'Benny Reschl has sent you Date Request.', '2019-11-06 09:17:58', '2019-11-06 09:17:58'),
(2605, 2, 'Benny Reschl hat Ihnen eine Terminanfrage gesendet.', '2019-11-06 09:17:58', '2019-11-06 09:17:58'),
(2616, 1, 'Zaib rajput has accepted your Date Request.', '2019-11-06 11:26:07', '2019-11-06 11:26:07'),
(2616, 2, 'Zaib rajput hat Ihre Terminanfrage angenommen.', '2019-11-06 11:26:07', '2019-11-06 11:26:07'),
(2620, 1, 'AISHWARYA SRIVASTAVA has sent you Connect Request', '2019-11-06 12:11:22', '2019-11-06 12:11:22'),
(2620, 2, 'AISHWARYA SRIVASTAVA hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:11:22', '2019-11-06 12:11:22'),
(2621, 1, 'AISHWARYA SRIVASTAVA has sent you Connect Request', '2019-11-06 12:11:24', '2019-11-06 12:11:24'),
(2621, 2, 'AISHWARYA SRIVASTAVA hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:11:24', '2019-11-06 12:11:24'),
(2622, 1, 'AISHWARYA SRIVASTAVA has sent you Connect Request', '2019-11-06 12:11:25', '2019-11-06 12:11:25'),
(2622, 2, 'AISHWARYA SRIVASTAVA hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:11:25', '2019-11-06 12:11:25'),
(2623, 1, 'AISHWARYA SRIVASTAVA has sent you Date Request.', '2019-11-06 12:11:28', '2019-11-06 12:11:28'),
(2623, 2, 'AISHWARYA SRIVASTAVA hat Ihnen eine Terminanfrage gesendet.', '2019-11-06 12:11:28', '2019-11-06 12:11:28'),
(2625, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:18', '2019-11-06 12:12:18'),
(2625, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:18', '2019-11-06 12:12:18'),
(2626, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:19', '2019-11-06 12:12:19'),
(2626, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:19', '2019-11-06 12:12:19'),
(2628, 1, 'harry singh has sent you Date Request.', '2019-11-06 12:12:21', '2019-11-06 12:12:21'),
(2628, 2, 'harry singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-06 12:12:21', '2019-11-06 12:12:21'),
(2629, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:21', '2019-11-06 12:12:21'),
(2629, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:21', '2019-11-06 12:12:21'),
(2630, 1, 'harry singh has sent you Date Request.', '2019-11-06 12:12:22', '2019-11-06 12:12:22'),
(2630, 2, 'harry singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-06 12:12:22', '2019-11-06 12:12:22'),
(2631, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:23', '2019-11-06 12:12:23'),
(2631, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:23', '2019-11-06 12:12:23'),
(2632, 1, 'harry singh has sent you Date Request.', '2019-11-06 12:12:24', '2019-11-06 12:12:24'),
(2632, 2, 'harry singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-06 12:12:24', '2019-11-06 12:12:24'),
(2633, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:24', '2019-11-06 12:12:24'),
(2633, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:24', '2019-11-06 12:12:24'),
(2634, 1, 'harry singh has sent you Date Request.', '2019-11-06 12:12:26', '2019-11-06 12:12:26'),
(2634, 2, 'harry singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-06 12:12:26', '2019-11-06 12:12:26'),
(2635, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:27', '2019-11-06 12:12:27'),
(2635, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:27', '2019-11-06 12:12:27'),
(2637, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:28', '2019-11-06 12:12:28'),
(2637, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:28', '2019-11-06 12:12:28'),
(2638, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:29', '2019-11-06 12:12:29'),
(2638, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:29', '2019-11-06 12:12:29'),
(2639, 1, 'harry singh has sent you Connect Request', '2019-11-06 12:12:29', '2019-11-06 12:12:29'),
(2639, 2, 'harry singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 12:12:29', '2019-11-06 12:12:29'),
(2640, 1, 'AISHWARYA SRIVASTAVA has sent you Date Request.', '2019-11-06 12:12:34', '2019-11-06 12:12:34'),
(2640, 2, 'AISHWARYA SRIVASTAVA hat Ihnen eine Terminanfrage gesendet.', '2019-11-06 12:12:34', '2019-11-06 12:12:34'),
(2641, 1, 'AISHWARYA SRIVASTAVA accepted a connect request.', '2019-11-06 12:15:31', '2019-11-06 12:15:31'),
(2641, 2, 'AISHWARYA SRIVASTAVA hat eine Verbindungsanforderung angenommen.', '2019-11-06 12:15:31', '2019-11-06 12:15:31'),
(2642, 1, 'James Smith has accepted your Date Request.', '2019-11-06 12:24:00', '2019-11-06 12:24:00'),
(2642, 2, 'James Smith hat Ihre Terminanfrage angenommen.', '2019-11-06 12:24:00', '2019-11-06 12:24:00'),
(2643, 1, 'Rahul accepted a connect request.', '2019-11-06 12:52:28', '2019-11-06 12:52:28'),
(2643, 2, 'Rahul hat eine Verbindungsanforderung angenommen.', '2019-11-06 12:52:28', '2019-11-06 12:52:28'),
(2644, 1, 'Rahul accepted a connect request.', '2019-11-06 12:52:32', '2019-11-06 12:52:32'),
(2644, 2, 'Rahul hat eine Verbindungsanforderung angenommen.', '2019-11-06 12:52:32', '2019-11-06 12:52:32'),
(2645, 1, 'Manish accepted a connect request.', '2019-11-06 12:57:47', '2019-11-06 12:57:47'),
(2645, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-06 12:57:47', '2019-11-06 12:57:47'),
(2646, 1, 'James has sent you Connect Request', '2019-11-06 13:15:46', '2019-11-06 13:15:46'),
(2646, 2, 'James hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 13:15:46', '2019-11-06 13:15:46'),
(2647, 1, 'James has sent you Connect Request', '2019-11-06 13:15:50', '2019-11-06 13:15:50'),
(2647, 2, 'James hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 13:15:50', '2019-11-06 13:15:50'),
(2648, 1, 'AISHWARYA accepted a connect request.', '2019-11-06 13:29:53', '2019-11-06 13:29:53'),
(2648, 2, 'AISHWARYA hat eine Verbindungsanforderung angenommen.', '2019-11-06 13:29:53', '2019-11-06 13:29:53'),
(2649, 1, 'AISHWARYA accepted a connect request.', '2019-11-06 13:29:55', '2019-11-06 13:29:55'),
(2649, 2, 'AISHWARYA hat eine Verbindungsanforderung angenommen.', '2019-11-06 13:29:55', '2019-11-06 13:29:55'),
(2650, 1, 'AISHWARYA accepted a connect request.', '2019-11-06 13:29:56', '2019-11-06 13:29:56'),
(2650, 2, 'AISHWARYA hat eine Verbindungsanforderung angenommen.', '2019-11-06 13:29:56', '2019-11-06 13:29:56'),
(2651, 1, 'Aishwarya Srivastava has sent you Connect Request', '2019-11-06 13:35:52', '2019-11-06 13:35:52'),
(2651, 2, 'Aishwarya Srivastava hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-06 13:35:52', '2019-11-06 13:35:52'),
(2652, 1, 'Zaib rajput accepted a connect request.', '2019-11-06 20:59:21', '2019-11-06 20:59:21'),
(2652, 2, 'Zaib rajput hat eine Verbindungsanforderung angenommen.', '2019-11-06 20:59:21', '2019-11-06 20:59:21'),
(2653, 1, 'Benny Reschl has liked your post.', '2019-11-07 07:11:17', '2019-11-07 07:11:17'),
(2653, 2, 'Benny Reschl hat Ihren Beitrag gefallen.', '2019-11-07 07:11:17', '2019-11-07 07:11:17'),
(2654, 1, 'Manish has sent you Connect Request', '2019-11-07 07:18:12', '2019-11-07 07:18:12'),
(2654, 2, 'Manish hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:18:12', '2019-11-07 07:18:12'),
(2655, 1, 'Manish accepted a connect request.', '2019-11-07 07:18:29', '2019-11-07 07:18:29'),
(2655, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-07 07:18:29', '2019-11-07 07:18:29'),
(2656, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 07:45:24', '2019-11-07 07:45:24'),
(2656, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:45:24', '2019-11-07 07:45:24'),
(2657, 1, 'mitra has sent you Connect Request', '2019-11-07 07:54:41', '2019-11-07 07:54:41'),
(2657, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:54:42', '2019-11-07 07:54:42'),
(2658, 1, 'mitra has sent you Connect Request', '2019-11-07 07:55:48', '2019-11-07 07:55:48'),
(2658, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:55:48', '2019-11-07 07:55:48'),
(2659, 1, 'mitra has sent you Date Request.', '2019-11-07 07:55:52', '2019-11-07 07:55:52'),
(2659, 2, 'mitra hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 07:55:52', '2019-11-07 07:55:52'),
(2660, 1, 'mitra has sent you Connect Request', '2019-11-07 07:55:54', '2019-11-07 07:55:54'),
(2660, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:55:54', '2019-11-07 07:55:54'),
(2661, 1, 'mitra has sent you Connect Request', '2019-11-07 07:55:56', '2019-11-07 07:55:56'),
(2661, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:55:56', '2019-11-07 07:55:56'),
(2662, 1, 'mitra has sent you Connect Request', '2019-11-07 07:55:57', '2019-11-07 07:55:57'),
(2662, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:55:57', '2019-11-07 07:55:57'),
(2663, 1, 'mitra has sent you Connect Request', '2019-11-07 07:55:59', '2019-11-07 07:55:59'),
(2663, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:55:59', '2019-11-07 07:55:59'),
(2664, 1, 'mitra has sent you Connect Request', '2019-11-07 07:59:00', '2019-11-07 07:59:00'),
(2664, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:59:00', '2019-11-07 07:59:00'),
(2665, 1, 'mitra has sent you Connect Request', '2019-11-07 07:59:03', '2019-11-07 07:59:03'),
(2665, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:59:03', '2019-11-07 07:59:03'),
(2666, 1, 'mitra has sent you Connect Request', '2019-11-07 07:59:04', '2019-11-07 07:59:04'),
(2666, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:59:04', '2019-11-07 07:59:04'),
(2667, 1, 'mitra has sent you Connect Request', '2019-11-07 07:59:05', '2019-11-07 07:59:05'),
(2667, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 07:59:05', '2019-11-07 07:59:05'),
(2668, 1, 'mitra has sent you Date Request.', '2019-11-07 08:00:19', '2019-11-07 08:00:19'),
(2668, 2, 'mitra hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 08:00:19', '2019-11-07 08:00:19'),
(2669, 1, 'mitra has sent you Date Request.', '2019-11-07 08:00:21', '2019-11-07 08:00:21'),
(2669, 2, 'mitra hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 08:00:21', '2019-11-07 08:00:21'),
(2670, 1, 'mitra has sent you Date Request.', '2019-11-07 09:10:25', '2019-11-07 09:10:25'),
(2670, 2, 'mitra hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:10:25', '2019-11-07 09:10:25'),
(2671, 1, 'mitra has sent you Connect Request', '2019-11-07 09:18:55', '2019-11-07 09:18:55'),
(2671, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:18:55', '2019-11-07 09:18:55'),
(2672, 1, 'mitra has sent you Connect Request', '2019-11-07 09:18:57', '2019-11-07 09:18:57'),
(2672, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:18:57', '2019-11-07 09:18:57'),
(2673, 1, 'mitra has sent you Date Request.', '2019-11-07 09:18:59', '2019-11-07 09:18:59'),
(2673, 2, 'mitra hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:18:59', '2019-11-07 09:18:59'),
(2674, 1, 'neenu has accepted your Date Request.', '2019-11-07 09:19:06', '2019-11-07 09:19:06'),
(2674, 2, 'neenu hat Ihre Terminanfrage angenommen.', '2019-11-07 09:19:06', '2019-11-07 09:19:06'),
(2675, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:29', '2019-11-07 09:36:29'),
(2675, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:29', '2019-11-07 09:36:29'),
(2676, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:31', '2019-11-07 09:36:31'),
(2676, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:31', '2019-11-07 09:36:31'),
(2677, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:32', '2019-11-07 09:36:32'),
(2677, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:32', '2019-11-07 09:36:32'),
(2678, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:33', '2019-11-07 09:36:33'),
(2678, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:33', '2019-11-07 09:36:33'),
(2679, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:38', '2019-11-07 09:36:38'),
(2679, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:38', '2019-11-07 09:36:38'),
(2680, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:40', '2019-11-07 09:36:40'),
(2680, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:40', '2019-11-07 09:36:40'),
(2681, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:41', '2019-11-07 09:36:41'),
(2681, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:41', '2019-11-07 09:36:41'),
(2682, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:43', '2019-11-07 09:36:43'),
(2682, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:43', '2019-11-07 09:36:43'),
(2683, 1, 'mitra has sent you Connect Request', '2019-11-07 09:36:44', '2019-11-07 09:36:44'),
(2683, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:36:45', '2019-11-07 09:36:45'),
(2684, 1, 'Aishwarya accepted a connect request.', '2019-11-07 09:39:30', '2019-11-07 09:39:30'),
(2684, 2, 'Aishwarya hat eine Verbindungsanforderung angenommen.', '2019-11-07 09:39:30', '2019-11-07 09:39:30'),
(2685, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:39:42', '2019-11-07 09:39:42'),
(2685, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:39:42', '2019-11-07 09:39:42'),
(2686, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:39:44', '2019-11-07 09:39:44'),
(2686, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:39:44', '2019-11-07 09:39:44'),
(2687, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:39:45', '2019-11-07 09:39:45'),
(2687, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:39:45', '2019-11-07 09:39:45'),
(2688, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:39:47', '2019-11-07 09:39:47'),
(2688, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:39:47', '2019-11-07 09:39:47'),
(2689, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:39:48', '2019-11-07 09:39:48'),
(2689, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:39:48', '2019-11-07 09:39:48'),
(2690, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:39:50', '2019-11-07 09:39:50'),
(2690, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:39:50', '2019-11-07 09:39:50'),
(2691, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:39:52', '2019-11-07 09:39:52'),
(2691, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:39:52', '2019-11-07 09:39:52'),
(2692, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:39:53', '2019-11-07 09:39:53'),
(2692, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:39:53', '2019-11-07 09:39:53'),
(2693, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:39:56', '2019-11-07 09:39:56'),
(2693, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:39:56', '2019-11-07 09:39:56'),
(2694, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:39:57', '2019-11-07 09:39:57'),
(2694, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:39:57', '2019-11-07 09:39:57'),
(2695, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:39:59', '2019-11-07 09:39:59'),
(2695, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:39:59', '2019-11-07 09:39:59'),
(2696, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:01', '2019-11-07 09:40:01'),
(2696, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:01', '2019-11-07 09:40:01'),
(2697, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:02', '2019-11-07 09:40:02'),
(2697, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:02', '2019-11-07 09:40:02'),
(2698, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:03', '2019-11-07 09:40:03'),
(2698, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:03', '2019-11-07 09:40:03'),
(2699, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:04', '2019-11-07 09:40:04'),
(2699, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:04', '2019-11-07 09:40:04'),
(2700, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:06', '2019-11-07 09:40:06'),
(2700, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:06', '2019-11-07 09:40:06'),
(2701, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:07', '2019-11-07 09:40:07'),
(2701, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:07', '2019-11-07 09:40:07'),
(2702, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:09', '2019-11-07 09:40:09'),
(2702, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:09', '2019-11-07 09:40:09'),
(2703, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:10', '2019-11-07 09:40:10'),
(2703, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:10', '2019-11-07 09:40:10'),
(2704, 1, 'Aishwarya has sent you Connect Request', '2019-11-07 09:40:29', '2019-11-07 09:40:29'),
(2704, 2, 'Aishwarya hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 09:40:29', '2019-11-07 09:40:29'),
(2705, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:40:31', '2019-11-07 09:40:31'),
(2705, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:40:31', '2019-11-07 09:40:31'),
(2706, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:40:32', '2019-11-07 09:40:32'),
(2706, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:40:32', '2019-11-07 09:40:32'),
(2707, 1, 'Aishwarya has sent you Date Request.', '2019-11-07 09:40:34', '2019-11-07 09:40:34'),
(2707, 2, 'Aishwarya hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 09:40:34', '2019-11-07 09:40:34'),
(2708, 1, 'Manish accepted a connect request.', '2019-11-07 09:48:02', '2019-11-07 09:48:02'),
(2708, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-07 09:48:02', '2019-11-07 09:48:02'),
(2709, 1, 'Manish accepted a connect request.', '2019-11-07 09:48:05', '2019-11-07 09:48:05'),
(2709, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-07 09:48:05', '2019-11-07 09:48:05'),
(2710, 1, 'Manish has liked your post.', '2019-11-07 09:52:25', '2019-11-07 09:52:25'),
(2710, 2, 'Manish hat Ihren Beitrag gefallen.', '2019-11-07 09:52:25', '2019-11-07 09:52:25'),
(2711, 1, 'Manish has liked your post.', '2019-11-07 09:52:41', '2019-11-07 09:52:41'),
(2711, 2, 'Manish hat Ihren Beitrag gefallen.', '2019-11-07 09:52:41', '2019-11-07 09:52:41'),
(2712, 1, 'Manish accepted a connect request.', '2019-11-07 09:53:19', '2019-11-07 09:53:19'),
(2712, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-07 09:53:19', '2019-11-07 09:53:19'),
(2713, 1, 'Manish accepted a connect request.', '2019-11-07 09:53:20', '2019-11-07 09:53:20'),
(2713, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-07 09:53:20', '2019-11-07 09:53:20'),
(2714, 1, 'Manish has liked your post.', '2019-11-07 09:55:57', '2019-11-07 09:55:57'),
(2714, 2, 'Manish hat Ihren Beitrag gefallen.', '2019-11-07 09:55:57', '2019-11-07 09:55:57'),
(2715, 1, 'Manish has liked your post.', '2019-11-07 09:56:16', '2019-11-07 09:56:16'),
(2715, 2, 'Manish hat Ihren Beitrag gefallen.', '2019-11-07 09:56:16', '2019-11-07 09:56:16'),
(2716, 1, 'Manish has liked your post.', '2019-11-07 09:56:27', '2019-11-07 09:56:27'),
(2716, 2, 'Manish hat Ihren Beitrag gefallen.', '2019-11-07 09:56:27', '2019-11-07 09:56:27'),
(2717, 1, 'Manish Singh has sent you Connect Request', '2019-11-07 10:43:54', '2019-11-07 10:43:54'),
(2717, 2, 'Manish Singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 10:43:54', '2019-11-07 10:43:54'),
(2718, 1, 'Manish accepted a connect request.', '2019-11-07 10:44:10', '2019-11-07 10:44:10'),
(2718, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-07 10:44:10', '2019-11-07 10:44:10'),
(2719, 1, 'Manish Singh has liked your post.', '2019-11-07 10:44:33', '2019-11-07 10:44:33'),
(2719, 2, 'Manish Singh hat Ihren Beitrag gefallen.', '2019-11-07 10:44:33', '2019-11-07 10:44:33'),
(2720, 1, 'mitra has sent you Date Request.', '2019-11-07 10:50:29', '2019-11-07 10:50:29'),
(2720, 2, 'mitra hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 10:50:29', '2019-11-07 10:50:29'),
(2721, 1, 'Manish has liked your post.', '2019-11-07 10:58:58', '2019-11-07 10:58:58'),
(2721, 2, 'Manish hat Ihren Beitrag gefallen.', '2019-11-07 10:58:58', '2019-11-07 10:58:58'),
(2722, 1, 'Manish Singh has accepted your Date Request.', '2019-11-07 10:59:36', '2019-11-07 10:59:36'),
(2722, 2, 'Manish Singh hat Ihre Terminanfrage angenommen.', '2019-11-07 10:59:36', '2019-11-07 10:59:36'),
(2723, 1, 'neenu accepted a connect request.', '2019-11-07 11:11:21', '2019-11-07 11:11:21'),
(2723, 2, 'neenu hat eine Verbindungsanforderung angenommen.', '2019-11-07 11:11:21', '2019-11-07 11:11:21'),
(2724, 1, 'Manish Singh has liked your post.', '2019-11-07 11:12:37', '2019-11-07 11:12:37'),
(2724, 2, 'Manish Singh hat Ihren Beitrag gefallen.', '2019-11-07 11:12:37', '2019-11-07 11:12:37'),
(2725, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:24:55', '2019-11-07 11:24:55'),
(2725, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:24:55', '2019-11-07 11:24:55'),
(2726, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:25:37', '2019-11-07 11:25:37'),
(2726, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:25:37', '2019-11-07 11:25:37'),
(2727, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:26:54', '2019-11-07 11:26:54'),
(2727, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:26:54', '2019-11-07 11:26:54'),
(2728, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:18', '2019-11-07 11:27:18'),
(2728, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:18', '2019-11-07 11:27:18'),
(2729, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:20', '2019-11-07 11:27:20'),
(2729, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:20', '2019-11-07 11:27:20'),
(2730, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:23', '2019-11-07 11:27:23'),
(2730, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:23', '2019-11-07 11:27:23'),
(2731, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:28', '2019-11-07 11:27:28'),
(2731, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:28', '2019-11-07 11:27:28'),
(2732, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:30', '2019-11-07 11:27:30'),
(2732, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:30', '2019-11-07 11:27:30'),
(2733, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:34', '2019-11-07 11:27:34'),
(2733, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:34', '2019-11-07 11:27:34'),
(2734, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:36', '2019-11-07 11:27:36'),
(2734, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:37', '2019-11-07 11:27:37'),
(2735, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:52', '2019-11-07 11:27:52'),
(2735, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:52', '2019-11-07 11:27:52'),
(2736, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:54', '2019-11-07 11:27:54'),
(2736, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:54', '2019-11-07 11:27:54'),
(2737, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:56', '2019-11-07 11:27:56'),
(2737, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:56', '2019-11-07 11:27:56'),
(2738, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:27:58', '2019-11-07 11:27:58'),
(2738, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:27:58', '2019-11-07 11:27:58'),
(2739, 1, 'Manish Singh has sent you Date Request.', '2019-11-07 11:28:01', '2019-11-07 11:28:01'),
(2739, 2, 'Manish Singh hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 11:28:01', '2019-11-07 11:28:01'),
(2740, 1, 'Manish has sent you Date Request.', '2019-11-07 12:20:01', '2019-11-07 12:20:01'),
(2740, 2, 'Manish hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:20:01', '2019-11-07 12:20:01'),
(2741, 1, 'Manish has sent you Date Request.', '2019-11-07 12:20:02', '2019-11-07 12:20:02'),
(2741, 2, 'Manish hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:20:02', '2019-11-07 12:20:02'),
(2742, 1, 'Manish has sent you Date Request.', '2019-11-07 12:20:03', '2019-11-07 12:20:03'),
(2742, 2, 'Manish hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:20:03', '2019-11-07 12:20:03'),
(2743, 1, 'Zaib rajput accepted a connect request.', '2019-11-07 12:43:44', '2019-11-07 12:43:44'),
(2743, 2, 'Zaib rajput hat eine Verbindungsanforderung angenommen.', '2019-11-07 12:43:44', '2019-11-07 12:43:44'),
(2744, 1, 'Zaib rajput accepted a connect request.', '2019-11-07 12:43:47', '2019-11-07 12:43:47'),
(2744, 2, 'Zaib rajput hat eine Verbindungsanforderung angenommen.', '2019-11-07 12:43:47', '2019-11-07 12:43:47'),
(2745, 1, 'Zaib rajput has accepted your Date Request.', '2019-11-07 12:43:48', '2019-11-07 12:43:48'),
(2745, 2, 'Zaib rajput hat Ihre Terminanfrage angenommen.', '2019-11-07 12:43:48', '2019-11-07 12:43:48'),
(2746, 1, 'Zaib rajput has sent you Connect Request', '2019-11-07 12:44:46', '2019-11-07 12:44:46'),
(2746, 2, 'Zaib rajput hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 12:44:46', '2019-11-07 12:44:46'),
(2747, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 12:59:04', '2019-11-07 12:59:04'),
(2747, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:59:04', '2019-11-07 12:59:04'),
(2748, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 12:59:04', '2019-11-07 12:59:04'),
(2748, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:59:04', '2019-11-07 12:59:04'),
(2749, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 12:59:05', '2019-11-07 12:59:05'),
(2749, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:59:05', '2019-11-07 12:59:05'),
(2750, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 12:59:05', '2019-11-07 12:59:05'),
(2750, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:59:05', '2019-11-07 12:59:05'),
(2751, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 12:59:06', '2019-11-07 12:59:06'),
(2751, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:59:06', '2019-11-07 12:59:06'),
(2752, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 12:59:07', '2019-11-07 12:59:07'),
(2752, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:59:07', '2019-11-07 12:59:07'),
(2753, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 12:59:08', '2019-11-07 12:59:08'),
(2753, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 12:59:08', '2019-11-07 12:59:08'),
(2754, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 13:01:04', '2019-11-07 13:01:04'),
(2754, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 13:01:04', '2019-11-07 13:01:04'),
(2755, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 13:05:14', '2019-11-07 13:05:14'),
(2755, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 13:05:14', '2019-11-07 13:05:14'),
(2756, 1, 'Flutter Lovers has sent you Date Request.', '2019-11-07 13:05:21', '2019-11-07 13:05:21'),
(2756, 2, 'Flutter Lovers hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 13:05:21', '2019-11-07 13:05:21'),
(2757, 1, 'Aishwarya has accepted your Date Request.', '2019-11-07 13:21:29', '2019-11-07 13:21:29'),
(2757, 2, 'Aishwarya hat Ihre Terminanfrage angenommen.', '2019-11-07 13:21:29', '2019-11-07 13:21:29'),
(2758, 1, 'Manish Singh has liked your post.', '2019-11-07 13:22:06', '2019-11-07 13:22:06'),
(2758, 2, 'Manish Singh hat Ihren Beitrag gefallen.', '2019-11-07 13:22:06', '2019-11-07 13:22:06'),
(2759, 1, 'Manish Singh has liked your post.', '2019-11-07 13:22:12', '2019-11-07 13:22:12'),
(2759, 2, 'Manish Singh hat Ihren Beitrag gefallen.', '2019-11-07 13:22:12', '2019-11-07 13:22:12'),
(2760, 1, 'mitra has sent you Connect Request', '2019-11-07 13:24:47', '2019-11-07 13:24:47'),
(2760, 2, 'mitra hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:24:47', '2019-11-07 13:24:47'),
(2761, 1, 'neenu has sent you Connect Request', '2019-11-07 13:25:33', '2019-11-07 13:25:33'),
(2761, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:25:33', '2019-11-07 13:25:33'),
(2762, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:03', '2019-11-07 13:28:03'),
(2762, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:03', '2019-11-07 13:28:03'),
(2763, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:05', '2019-11-07 13:28:05'),
(2763, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:05', '2019-11-07 13:28:05'),
(2764, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:06', '2019-11-07 13:28:06'),
(2764, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:06', '2019-11-07 13:28:06'),
(2765, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:08', '2019-11-07 13:28:08'),
(2765, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:08', '2019-11-07 13:28:08'),
(2766, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:09', '2019-11-07 13:28:09'),
(2766, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:09', '2019-11-07 13:28:09'),
(2767, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:11', '2019-11-07 13:28:11'),
(2767, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:11', '2019-11-07 13:28:11'),
(2768, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:12', '2019-11-07 13:28:12'),
(2768, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:12', '2019-11-07 13:28:12'),
(2769, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:13', '2019-11-07 13:28:13'),
(2769, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:13', '2019-11-07 13:28:13'),
(2770, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:15', '2019-11-07 13:28:15'),
(2770, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:15', '2019-11-07 13:28:15'),
(2771, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:16', '2019-11-07 13:28:16'),
(2771, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:16', '2019-11-07 13:28:16'),
(2772, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:17', '2019-11-07 13:28:17'),
(2772, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:17', '2019-11-07 13:28:17'),
(2773, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:19', '2019-11-07 13:28:19'),
(2773, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:19', '2019-11-07 13:28:19'),
(2774, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:21', '2019-11-07 13:28:21'),
(2774, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:21', '2019-11-07 13:28:21'),
(2775, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:22', '2019-11-07 13:28:22'),
(2775, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:22', '2019-11-07 13:28:22'),
(2776, 1, 'neenu has sent you Connect Request', '2019-11-07 13:28:24', '2019-11-07 13:28:24'),
(2776, 2, 'neenu hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-07 13:28:24', '2019-11-07 13:28:24'),
(2777, 1, 'neenu has sent you Date Request.', '2019-11-07 13:28:25', '2019-11-07 13:28:25'),
(2777, 2, 'neenu hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 13:28:25', '2019-11-07 13:28:25'),
(2778, 1, 'neenu has sent you Date Request.', '2019-11-07 13:28:27', '2019-11-07 13:28:27'),
(2778, 2, 'neenu hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 13:28:27', '2019-11-07 13:28:27'),
(2779, 1, 'neenu has sent you Date Request.', '2019-11-07 13:28:28', '2019-11-07 13:28:28'),
(2779, 2, 'neenu hat Ihnen eine Terminanfrage gesendet.', '2019-11-07 13:28:28', '2019-11-07 13:28:28'),
(2780, 1, 'Aishwarya Srivastava has sent you Connect Request', '2019-11-08 04:52:14', '2019-11-08 04:52:14'),
(2780, 2, 'Aishwarya Srivastava hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-08 04:52:14', '2019-11-08 04:52:14'),
(2781, 1, 'Aishwarya Srivastava has sent you Connect Request', '2019-11-08 04:52:16', '2019-11-08 04:52:16'),
(2781, 2, 'Aishwarya Srivastava hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-08 04:52:16', '2019-11-08 04:52:16'),
(2782, 1, 'Aishwarya Srivastava has sent you Connect Request', '2019-11-08 04:52:18', '2019-11-08 04:52:18'),
(2782, 2, 'Aishwarya Srivastava hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-08 04:52:18', '2019-11-08 04:52:18'),
(2783, 1, 'mitra has sent you Date Request.', '2019-11-08 04:57:06', '2019-11-08 04:57:06'),
(2783, 2, 'mitra hat Ihnen eine Terminanfrage gesendet.', '2019-11-08 04:57:06', '2019-11-08 04:57:06'),
(2784, 1, 'Marshal accepted a connect request.', '2019-11-08 05:09:59', '2019-11-08 05:09:59'),
(2784, 2, 'Marshal hat eine Verbindungsanforderung angenommen.', '2019-11-08 05:09:59', '2019-11-08 05:09:59'),
(2785, 1, 'Marshal accepted a connect request.', '2019-11-08 05:10:00', '2019-11-08 05:10:00'),
(2785, 2, 'Marshal hat eine Verbindungsanforderung angenommen.', '2019-11-08 05:10:00', '2019-11-08 05:10:00'),
(2786, 1, 'Marshal has accepted your Date Request.', '2019-11-08 05:10:02', '2019-11-08 05:10:02'),
(2786, 2, 'Marshal hat Ihre Terminanfrage angenommen.', '2019-11-08 05:10:02', '2019-11-08 05:10:02'),
(2787, 1, 'Marshal accepted a connect request.', '2019-11-08 05:10:03', '2019-11-08 05:10:03'),
(2787, 2, 'Marshal hat eine Verbindungsanforderung angenommen.', '2019-11-08 05:10:03', '2019-11-08 05:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('014807ccecce0a902946ad5140be106ff80fdd79d230e774051c2ebf37b07151efaf286f29f6a131', 471, 1, 'user', '[]', 1, '2019-11-05 05:29:28', '2019-11-05 05:29:28', '2020-11-05 05:29:28'),
('01c7027f4c60ba5159edbed3a971b622fa511c05e3870b42c873ca3e7eb05d6d89296fa387f0602a', 448, 1, 'user', '[]', 0, '2019-11-02 15:04:58', '2019-11-02 15:04:58', '2020-11-02 15:04:58'),
('01d6091a7a7cdbbc4660de0d972c3251ba15c347b5bad25c10819fdd8f45e56039d0f28dc97ec778', 482, 1, 'user', '[]', 1, '2019-11-05 06:54:22', '2019-11-05 06:54:22', '2020-11-05 06:54:22'),
('02d6a852656d0128effbdd903c1ad930be86ae1db22f0e4626fe32de243f78e70d308a2d00a53bc0', 484, 1, 'user', '[]', 0, '2019-11-05 05:03:52', '2019-11-05 05:03:52', '2020-11-05 05:03:52'),
('03dbcf8d6ddba459b184fb83f39727a4422b22d71deb069a614af4a66d00ec86d954c48b71176160', 478, 1, 'user', '[]', 0, '2019-11-05 01:28:15', '2019-11-05 01:28:15', '2020-11-05 01:28:15'),
('04343807b15405c97766ef868dd8b88fef26e13fa4468190709cc6aa8b46d7bd0e715f2699af6948', 479, 1, 'user', '[]', 1, '2019-11-05 06:10:30', '2019-11-05 06:10:30', '2020-11-05 06:10:30'),
('04bb46424143c77434d0b27be1d10f31f3727abf2f17a90ce22acb3b5e7dcf10efe851c759c01b77', 463, 1, 'user', '[]', 0, '2019-11-04 14:23:21', '2019-11-04 14:23:21', '2020-11-04 14:23:21'),
('05d01ca14940765a217992f37ac9d54ef4b08ef9b869214fe2c8584280b871274d51069b2a88ab6a', 494, 1, 'user', '[]', 0, '2019-11-05 11:31:40', '2019-11-05 11:31:40', '2020-11-05 11:31:40'),
('06190f8caa8fec48837fbba74a4cd64742a670fd30c8ccc50cd6dd576de639a26fab9465e309107e', 534, 1, 'user', '[]', 0, '2019-11-07 05:41:56', '2019-11-07 05:41:56', '2020-11-07 05:41:56'),
('08035a2b516b854b6b0d437e316f6b37ed34131ff4db3396d8884737d880ffc8b170ab7d0f0c0216', 482, 1, 'user', '[]', 0, '2019-11-05 04:58:59', '2019-11-05 04:58:59', '2020-11-05 04:58:59'),
('083e75a92c2d62a9bb78c37d32256b6b399d3b02e11a7496f541c676409a1e05f770ed5ed11b6cd0', 482, 1, 'user', '[]', 1, '2019-11-05 05:13:19', '2019-11-05 05:13:19', '2020-11-05 05:13:19'),
('08e6e070a67e7d9af5a189872109f7b2ba4677f6f5a11c45f97d53d6bc586aa856e8d88068e2bf86', 548, 1, 'user', '[]', 0, '2019-11-07 10:20:31', '2019-11-07 10:20:31', '2020-11-07 10:20:31'),
('0a052163928effb6bd1044a0a1fdd4e838e62dc4615b1aea81881640dbd31b5bec501fb4903bdda9', 459, 1, 'user', '[]', 0, '2019-11-04 11:16:12', '2019-11-04 11:16:12', '2020-11-04 11:16:12'),
('0b073b3df4d4535792dc0954ef217db6e878bf3dbbc23da9dd6908a80942fbaadf2fd3a0032ca88b', 548, 1, 'user', '[]', 0, '2019-11-07 11:05:42', '2019-11-07 11:05:42', '2020-11-07 11:05:42'),
('0cbcacf66df538a4043c00b8c55669437710ee77a89d728c202c677989d24035a2710cef8827abb0', 445, 1, 'user', '[]', 0, '2019-10-31 09:52:19', '2019-10-31 09:52:19', '2020-10-31 09:52:19'),
('0ee498448cfcbcbff7ea0ec39dbdea609e2dfc48bddf0a945ea6ac3b901991b95a10df85b2d46327', 481, 1, 'user', '[]', 0, '2019-11-05 04:30:50', '2019-11-05 04:30:50', '2020-11-05 04:30:50'),
('0fba25ce78aafa6f57c55212174dfbedff5711a5a8ec48857fb468dab64fa48a3928166b1edce2b2', 482, 1, 'user', '[]', 1, '2019-11-05 04:59:10', '2019-11-05 04:59:10', '2020-11-05 04:59:10'),
('0fce49ddb10731914a9dbcb488a8640b0c9efa732a00d4b333909a41f650b73681b7fb064b025f12', 448, 1, 'user', '[]', 0, '2019-11-02 15:08:05', '2019-11-02 15:08:05', '2020-11-02 15:08:05'),
('0fe9a0018c0f76edf07ad73650f714474285ccd6ce31f8b508629b54baa3f3ee6f7ad0134c46bf69', 526, 1, 'user', '[]', 1, '2019-11-06 12:49:19', '2019-11-06 12:49:19', '2020-11-06 12:49:19'),
('108bbdd2518b576b0fa3044b5d6a2b613598f643e29314fe2635e3d96b80477523be48a267e14369', 512, 1, 'user', '[]', 0, '2019-11-06 05:16:54', '2019-11-06 05:16:54', '2020-11-06 05:16:54'),
('10b251c4ef05f4986de27a7955764b35f959b5a1bac5effa6d4fb86d920cbe1d4a4a8b091f019e61', 453, 1, 'user', '[]', 0, '2019-11-03 15:08:55', '2019-11-03 15:08:55', '2020-11-03 15:08:55'),
('10bd39719f829cf1931d213f6345ca2095c2318e553ee4ec6832bb55a934c40cfa9c9c2ce38f1431', 530, 1, 'user', '[]', 0, '2019-11-06 13:31:55', '2019-11-06 13:31:55', '2020-11-06 13:31:55'),
('10c3bbf46fe9e027393d1be32a1d52d2a83aaa6d24649150c1741965233e88fd6eccca00e6a9f361', 474, 1, 'user', '[]', 0, '2019-11-05 00:30:24', '2019-11-05 00:30:24', '2020-11-05 00:30:24'),
('10d8f86e17a2375a5611cf874a2a142a5502abb47b3c426d96a1a611740531ae1e4b342098b8e638', 532, 1, 'user', '[]', 0, '2019-11-06 15:20:20', '2019-11-06 15:20:20', '2020-11-06 15:20:20'),
('12270e41a49766239c9723ec928960d9dfe5b955e757e789d20f097e2b256b0a6a32e650cd324c8a', 548, 1, 'user', '[]', 0, '2019-11-07 11:09:28', '2019-11-07 11:09:28', '2020-11-07 11:09:28'),
('125c374bbbc3e87cf06026b07c6e54133773841f666f9134a7b2ba70abe9581ca2e9cf22f23ea511', 554, 1, 'user', '[]', 0, '2019-11-08 01:25:52', '2019-11-08 01:25:52', '2020-11-08 01:25:52'),
('127768a1107e74e2f32a2ce7f3d286e918daf3158cfdc7211fc3c5ff099ac5bd75821ff5143561f4', 535, 1, 'user', '[]', 0, '2019-11-06 17:21:17', '2019-11-06 17:21:17', '2020-11-06 17:21:17'),
('127d6e0809b3a6e6a2e2f1697beca165aedfa2d7474a7217b6f5e0a41cbcb1d90015aacdb79d3053', 458, 1, 'user', '[]', 0, '2019-11-04 11:14:08', '2019-11-04 11:14:08', '2020-11-04 11:14:08'),
('12abad1b96bb7e508ac5dd9a2377704d2d1f07424c60e318de1a53f6be53ee5ae1280c74ab1be7df', 487, 1, 'user', '[]', 0, '2019-11-05 07:37:31', '2019-11-05 07:37:31', '2020-11-05 07:37:31'),
('137afae03343f7c45b3c57cad137f7ea4aa9601b96ee4a253fcab612ca741c12db161c84f49299d9', 529, 1, 'user', '[]', 0, '2019-11-06 12:46:48', '2019-11-06 12:46:48', '2020-11-06 12:46:48'),
('13b0ef74af0f11b0b94d359012fb44370e79b7cd18ee61096852a4ffdee4a7dfffd1cd4e2e577e27', 550, 1, 'user', '[]', 1, '2019-11-08 05:26:41', '2019-11-08 05:26:41', '2020-11-08 05:26:41'),
('13c65beaa5326b69c64344362d2b831124cbba3155b5fc400b2cd6fbe90c837414883b4d0d2ce579', 551, 1, 'user', '[]', 0, '2019-11-07 10:42:28', '2019-11-07 10:42:28', '2020-11-07 10:42:28'),
('14f0a36c3258387df34875db17544b042aeca8602ea68dd57349d8a659cca5b538d660b3494ef534', 482, 1, 'user', '[]', 1, '2019-11-05 05:31:21', '2019-11-05 05:31:21', '2020-11-05 05:31:21'),
('1530819d93fd197b72d58c9b293d075b62586d154f7bc863947025aa00f2dd240b539db3f7b304ae', 483, 1, 'user', '[]', 1, '2019-11-05 05:00:26', '2019-11-05 05:00:26', '2020-11-05 05:00:26'),
('167ed0742f88a25f40132e5f6a01bb66a63d0725063911f79211e67bfdef369e6648f1d68e1ebb16', 531, 1, 'user', '[]', 0, '2019-11-06 15:17:52', '2019-11-06 15:17:52', '2020-11-06 15:17:52'),
('171d1b21414c7f25430559e9dc1a144d5eef8f27c75342763d85e3fca2407269b2c2398e8e10123d', 501, 1, 'user', '[]', 0, '2019-11-05 14:59:07', '2019-11-05 14:59:07', '2020-11-05 14:59:07'),
('184e7bdb4150887070735b9a5a3d5cb8f82018dcc4c975ccb49355b70b5aa2ee24da16754e263862', 539, 1, 'user', '[]', 0, '2019-11-06 21:17:13', '2019-11-06 21:17:13', '2020-11-06 21:17:13'),
('191472b3c19e17e6571e92c577eb54680116ec72d4bcebb54db2a00fbc9c8fb4dfbd0355e0980ab9', 452, 1, 'user', '[]', 0, '2019-11-03 03:39:46', '2019-11-03 03:39:46', '2020-11-03 03:39:46'),
('191c91778137e6dd02c7df9b66e178a641f5af9ea9a96a39eafdf1a0a9c13a531cecb0fbde24d684', 513, 1, 'user', '[]', 0, '2019-11-06 05:43:31', '2019-11-06 05:43:31', '2020-11-06 05:43:31'),
('1923e689cd877808013fad7805cdc174076b56b4ab28437bd43130c7b03f119877a5c60b7b8b6d9f', 548, 1, 'user', '[]', 1, '2019-11-07 13:34:40', '2019-11-07 13:34:40', '2020-11-07 13:34:40'),
('1a1c62c9de55e4197092c6e9296c3137d159b6f9b193e9fba18f0f5f8389735a70dabe74c23688eb', 506, 1, 'user', '[]', 0, '2019-11-05 15:32:21', '2019-11-05 15:32:21', '2020-11-05 15:32:21'),
('1a4250c6efb84acb0367093fa2c34b8bbd1b85aab5c0fc71611d620b67045f4704123dd95f00fc7e', 465, 1, 'user', '[]', 0, '2019-11-04 16:24:00', '2019-11-04 16:24:00', '2020-11-04 16:24:00'),
('1a58ab89676a8234c2caa9256dc2db86459eb6317e5fb6f65bf9a9674d5cca63bd7a17c2867acb44', 546, 1, 'user', '[]', 0, '2019-11-07 06:59:40', '2019-11-07 06:59:40', '2020-11-07 06:59:40'),
('1b46fb040c938460c56a5d85cb2e852db0923d10892fd8fd2e99dcc4c3f27ed7a38282bd2bc3fdfb', 513, 1, 'user', '[]', 0, '2019-11-06 05:44:08', '2019-11-06 05:44:08', '2020-11-06 05:44:08'),
('1b5ec64d1b985db2592409877bbfa9c4088fc1bae7dcfaac7b933b48948609eee38fa28e2425c512', 506, 1, 'user', '[]', 1, '2019-11-05 15:49:36', '2019-11-05 15:49:36', '2020-11-05 15:49:36'),
('1bac5263c9ca98cc2375519344aa627d19a77bdb5298af30a3b12bbfeb3bc81bc5671d0e6750c0a7', 501, 1, 'user', '[]', 0, '2019-11-05 14:51:31', '2019-11-05 14:51:31', '2020-11-05 14:51:31'),
('1c3b0766a1d93110de7d9cbbba096c4f2e7d36defbfb31503931a86fd5b81f67214ab0f004e07542', 538, 1, 'user', '[]', 0, '2019-11-06 20:47:33', '2019-11-06 20:47:33', '2020-11-06 20:47:33'),
('1d6569a9ece9b45cbb5a440ea9933c47a2a8531e7edc505ec158f86f037b70f93392457c2fb9a6c1', 551, 1, 'user', '[]', 1, '2019-11-07 12:34:08', '2019-11-07 12:34:08', '2020-11-07 12:34:08'),
('1e491319f8732c52aa2793bfed9414fb0ee0b66a3c722c5b44e3ad8835c25c224f04ebf8a632aa6d', 497, 1, 'user', '[]', 0, '2019-11-05 13:10:19', '2019-11-05 13:10:19', '2020-11-05 13:10:19'),
('1ecf33c216671a0d2bec56042e2bf99dbc720ecc81cf58022272c9b85591f6a69730527d53a26d56', 480, 1, 'user', '[]', 1, '2019-11-05 06:31:37', '2019-11-05 06:31:37', '2020-11-05 06:31:37'),
('1ee104a2c28245ee4918fec8647bac3b29ac4afb58e086e4f467b5aaa9d1dbf5696894f9d6b8c6f5', 484, 1, 'user', '[]', 0, '2019-11-05 05:34:35', '2019-11-05 05:34:35', '2020-11-05 05:34:35'),
('1f2e2838a9cbe4905c4d672cda417c76db2ee8379bc365f6f408aae98cde185cc67396d01060c957', 462, 1, 'user', '[]', 0, '2019-11-04 14:16:16', '2019-11-04 14:16:16', '2020-11-04 14:16:16'),
('20ee5a31deeb68b25d113fd3873c806f3ddcde12303b74eeebd9ad26eff2f66731d0f5ed378fe909', 470, 1, 'user', '[]', 0, '2019-11-04 18:38:00', '2019-11-04 18:38:00', '2020-11-04 18:38:00'),
('210763738cf4daa946ab4e348a4a136e6813e5d550b0e4e485ba5a76229d05a7014e39de255dd0bc', 475, 1, 'user', '[]', 0, '2019-11-05 00:44:27', '2019-11-05 00:44:27', '2020-11-05 00:44:27'),
('21c7ee95a5ea235aaa43f834e20bf9798cbf4c7427ecc7a21b243fd0fec73eb7a7c358f87a079cd4', 480, 1, 'user', '[]', 1, '2019-11-05 06:15:55', '2019-11-05 06:15:55', '2020-11-05 06:15:55'),
('220978856dba5d355a81dcb868e8419b92e4d1533c371178f06b5580a74557b7b0f59216a2575b35', 474, 1, 'user', '[]', 0, '2019-11-05 00:31:04', '2019-11-05 00:31:04', '2020-11-05 00:31:04'),
('23ddb813a788b0218e4541f3b1aefc8d0111312467664fd85609967764dbbbb5b274a84fd5e9412f', 552, 1, 'user', '[]', 1, '2019-11-07 12:52:36', '2019-11-07 12:52:36', '2020-11-07 12:52:36'),
('240b9d28d777619bea4b6c49de20c4f57312583c114fdc373449c805c850d6e0d4ed9448422b6ed2', 503, 1, 'user', '[]', 0, '2019-11-06 12:51:22', '2019-11-06 12:51:22', '2020-11-06 12:51:22'),
('2483cb78c6291b24b6186a6db5b40794d841208b85fde6a75caa28b4267edc3daeab285d85e0abd6', 480, 1, 'user', '[]', 1, '2019-11-05 05:22:03', '2019-11-05 05:22:03', '2020-11-05 05:22:03'),
('254ccbff815125a33d232f0a433f80bd51d14e32578e3ef79666e483c51c0027af621a4a488b387c', 510, 1, 'user', '[]', 0, '2019-11-05 16:09:58', '2019-11-05 16:09:58', '2020-11-05 16:09:58'),
('274b7f8d2afdb591a8c2fad227b386e7ccce7f95cc7d2e47e3b1e8b7b3c4d39a2b4c1826fde3ba20', 501, 1, 'user', '[]', 1, '2019-11-05 14:55:53', '2019-11-05 14:55:53', '2020-11-05 14:55:53'),
('27af3a4864083b89dcf2d96ef8658bb697143f22ee4b265513308c1d68100b452f968a34e2c6fe36', 474, 1, 'user', '[]', 0, '2019-11-05 00:31:44', '2019-11-05 00:31:44', '2020-11-05 00:31:44'),
('27bba79495cb626c9e82aa7fa8caa1abfad2df8afd5cb9c1d42293e9607d588df40bd6c97ab433a6', 443, 1, 'user', '[]', 1, '2019-10-31 09:44:05', '2019-10-31 09:44:05', '2020-10-31 09:44:05'),
('28be911f4571ab40654ec965fda52068e0d5ae35a859a9ea9821cd9eb38fe78ade34f405bb425418', 484, 1, 'user', '[]', 1, '2019-11-05 06:21:01', '2019-11-05 06:21:01', '2020-11-05 06:21:01'),
('292fe220d33ab201d29bff6b75bf9f4c930bc81d3c72f68d1673716d4647a77c64648300fa53dab9', 549, 1, 'user', '[]', 1, '2019-11-07 09:07:50', '2019-11-07 09:07:50', '2020-11-07 09:07:50'),
('29e5aafab8cc9b28cb3875cb7781ac93a1932a10a4b81aecab89a3a1f20dd37731ddb9e1fd7ae767', 484, 1, 'user', '[]', 0, '2019-11-05 05:03:05', '2019-11-05 05:03:05', '2020-11-05 05:03:05'),
('2a806977b005eae5c8b2f5eb4c25fda95a2c89f83d4ea63283fd10a13dbe7281c7c08c0394c7ab7c', 534, 1, 'user', '[]', 0, '2019-11-07 05:43:06', '2019-11-07 05:43:06', '2020-11-07 05:43:06'),
('2b21191d668f9316168895c829cbe2850dc9459df872b2ffe29899fd2eea63d958bf2ef05a4c0360', 459, 1, 'user', '[]', 0, '2019-11-04 12:08:41', '2019-11-04 12:08:41', '2020-11-04 12:08:41'),
('2bd5c0426b480242df7f8883e997a6f9472f1a03d5122434ada0f8cac0cfede68292e673520946ce', 504, 1, 'user', '[]', 0, '2019-11-05 15:28:49', '2019-11-05 15:28:49', '2020-11-05 15:28:49'),
('2d69db58d9ec0a6ad3dcb8c308eb368de4326bce7b97c58ac3c23d51c970b980bdac4638005b4501', 501, 1, 'user', '[]', 0, '2019-11-05 15:51:57', '2019-11-05 15:51:57', '2020-11-05 15:51:57'),
('30ebe30f4f1bd1c6555b6ab3a0c45f34d5c88b7d22e1d4971489fdfb42bf06713ca4a5adf5cb3f8f', 466, 1, 'user', '[]', 0, '2019-11-04 17:34:24', '2019-11-04 17:34:24', '2020-11-04 17:34:24'),
('315779cf0fad8aa2fd54af492b803103108e9b09103575377f86aff74ad2701a8075fa55624f4cdc', 479, 1, 'user', '[]', 1, '2019-11-05 03:56:04', '2019-11-05 03:56:04', '2020-11-05 03:56:04'),
('3290e69c438f1f5f7ebf5797983f8317bafdd6384c2706e4f33d047ce9e0792881ba2ed70184c197', 493, 1, 'user', '[]', 1, '2019-11-05 10:59:17', '2019-11-05 10:59:17', '2020-11-05 10:59:17'),
('32e7b63fe09137f3806d9374e5b653567828f48e86e4b2e029efda86e01ecbf803ceb519dfe7cce0', 445, 1, 'user', '[]', 0, '2019-11-01 06:35:59', '2019-11-01 06:35:59', '2020-11-01 06:35:59'),
('348025dce2c737397acdcce54761c562937fb9a1bdec908461b3172ded8929f54dbe98be7ff72e83', 512, 1, 'user', '[]', 1, '2019-11-06 13:29:24', '2019-11-06 13:29:24', '2020-11-06 13:29:24'),
('34a058a7ae116a5298af03ef44412f6e318ae535994b897cd035655e204e8dce65a70ae95f7b3725', 504, 1, 'user', '[]', 0, '2019-11-06 13:24:10', '2019-11-06 13:24:10', '2020-11-06 13:24:10'),
('34dd0d2f2ffd93fe986a3313f8e72dcfb42f1f99e16bbe9bace9f3f2f308964467dff6d1d63c4324', 480, 1, 'user', '[]', 0, '2019-11-05 07:55:08', '2019-11-05 07:55:08', '2020-11-05 07:55:08'),
('35f3721aedc9837efe78a97201cb57b01a2c09770c198e0d48b1c9c3526424e11d6d5c88d91cb129', 548, 1, 'user', '[]', 0, '2019-11-07 07:52:39', '2019-11-07 07:52:39', '2020-11-07 07:52:39'),
('36ba37e18343de5ac32003435aa4f7c865a0f1b259a82798557822e500f77198036db630922df7b1', 467, 1, 'user', '[]', 0, '2019-11-04 17:44:41', '2019-11-04 17:44:41', '2020-11-04 17:44:41'),
('37469f4e6eaf2450dce5ddedc27337e70b53700d08d7872ef2f5c4a22ac1e0ce4ceb69622ba35003', 530, 1, 'user', '[]', 0, '2019-11-06 13:06:26', '2019-11-06 13:06:26', '2020-11-06 13:06:26'),
('389a31f5034d75368300807dce46762d2c86464eeec5dfd57ab54826e291e64bd90363b5e34c0e84', 444, 1, 'user', '[]', 0, '2019-10-31 09:44:28', '2019-10-31 09:44:28', '2020-10-31 09:44:28'),
('38b580073f25f1a5001755375a0187bc1be3592bdb3358b1466178eab334b8dfe057998800d7dcb9', 549, 1, 'user', '[]', 0, '2019-11-07 09:06:29', '2019-11-07 09:06:29', '2020-11-07 09:06:29'),
('394a86848aff725123e68d1f0b3b33a21207aff84cc2c317a1de1462f47413707b402e79a9f03d04', 509, 1, 'user', '[]', 0, '2019-11-07 12:43:14', '2019-11-07 12:43:14', '2020-11-07 12:43:14'),
('39f31e07bb1d3dc02e4ee5ef92aa458d6e61d06b1cb021e83e06968aa44f430acc3080b65f8ada3a', 446, 1, 'user', '[]', 0, '2019-10-31 09:57:28', '2019-10-31 09:57:28', '2020-10-31 09:57:28'),
('3c78f0f1cb8f33946b2c3c8eb32ea34f9988b3cacb81d8e2464f3c4bcce340a9aecb023bb71f0760', 472, 1, 'user', '[]', 0, '2019-11-04 20:41:02', '2019-11-04 20:41:02', '2020-11-04 20:41:02'),
('3cbd83d470102fdfd28830c883a11c72f884c8f5b2f0901a73062083d5d81942efa284ad29dfa116', 446, 1, 'user', '[]', 0, '2019-10-31 09:54:51', '2019-10-31 09:54:51', '2020-10-31 09:54:51'),
('3e1c72bc3c36ab217ce1d764df4fed31ad2cb4e91b103701fc96d30551c95acc6621518283821eb2', 504, 1, 'user', '[]', 1, '2019-11-07 13:20:47', '2019-11-07 13:20:47', '2020-11-07 13:20:47'),
('3e6ab7bdbe1dc684df7a42dcb36b690d0436d3c867bba8e92c0d9159563bb3bb1d619b5d261ca35a', 483, 1, 'user', '[]', 0, '2019-11-05 04:59:52', '2019-11-05 04:59:52', '2020-11-05 04:59:52'),
('3e8869a9fafaefb4142f6b2c169db149479847c2664f3c8d2135d5b389cade614d5cf5f04bc5db85', 471, 1, 'user', '[]', 0, '2019-11-04 18:52:15', '2019-11-04 18:52:15', '2020-11-04 18:52:15'),
('3f84c6677f5dba1fea4a5a7377ab7a6f748c22d19faf7f26a7df7493a92d47382912a35a2ec45389', 479, 1, 'user', '[]', 1, '2019-11-05 03:34:15', '2019-11-05 03:34:15', '2020-11-05 03:34:15'),
('4077d504940b650709c83867afe9f9c5b10889715b26a3c13cab44a6c04cb4755204bd6e1200d3f3', 485, 1, 'user', '[]', 1, '2019-11-05 06:19:13', '2019-11-05 06:19:13', '2020-11-05 06:19:13'),
('40ad5ce02b67860a20fd1190d87b8e712e73eff5d188422aa65872c1352d2781c70e7662a756f78c', 495, 1, 'user', '[]', 0, '2019-11-05 12:02:42', '2019-11-05 12:02:42', '2020-11-05 12:02:42'),
('40b039301fedc95fbae4eae11d78f713103d9dde40df5271b60791b9f82c7199760495b2c0ae07d7', 523, 1, 'user', '[]', 0, '2019-11-07 09:52:06', '2019-11-07 09:52:06', '2020-11-07 09:52:06'),
('410239105baa30d5bc15a1c60078ca93d99753f461ffa6e5fdb50dc4a1764d3371c6cd608ecf2090', 480, 1, 'user', '[]', 1, '2019-11-05 06:48:09', '2019-11-05 06:48:09', '2020-11-05 06:48:09'),
('410c28f4c6a6fb38aa4b6d90c687083d892c998427a593c7f82d0ff434a77dc47b8d96e67ce5d6e8', 471, 1, 'user', '[]', 1, '2019-11-04 18:53:12', '2019-11-04 18:53:12', '2020-11-04 18:53:12'),
('439410a8e00e166d67f4e3c51cf346ea7d329c7a6d5bfc3eb0346ebb4ebba1858bda333fd2edac05', 488, 1, 'user', '[]', 0, '2019-11-05 07:15:00', '2019-11-05 07:15:00', '2020-11-05 07:15:00'),
('43cf8a2cc13d9f74d1156cd5a489d4bf23613ec3b51973416240cfdc56ff1901b6af545e731e6af4', 443, 1, 'user', '[]', 1, '2019-10-31 09:38:17', '2019-10-31 09:38:17', '2020-10-31 09:38:17'),
('44b6cf6f2640ba03759f773124c1ca5f390f868fceaced0579485c610d69be21d69f496cf7de92d1', 486, 1, 'user', '[]', 1, '2019-11-05 07:10:10', '2019-11-05 07:10:10', '2020-11-05 07:10:10'),
('4538b0f07ab8d95e770b9fcc8f144c8f9dee70063039d22c8d09b9587cbb7d86213041ed2e418cea', 515, 1, 'user', '[]', 1, '2019-11-06 13:29:41', '2019-11-06 13:29:41', '2020-11-06 13:29:41'),
('455ee86b5dad489dda3bce507cc103ad1c41f2b5aa7034d068695a3bd8f6d2c34d7e84995bd08e84', 546, 1, 'user', '[]', 0, '2019-11-07 06:59:15', '2019-11-07 06:59:15', '2020-11-07 06:59:15'),
('4560e454d2f9c72a5e1638ddbfb8bd9a68a8bcc10ccca999e7962aface739527c67b34892fa127ed', 477, 1, 'user', '[]', 0, '2019-11-05 01:10:09', '2019-11-05 01:10:09', '2020-11-05 01:10:09'),
('459812fe4b3f374543a829742757cededd916504b157c0af8013c22b6d45beb1350ae92ba47d4273', 550, 1, 'user', '[]', 0, '2019-11-08 05:09:25', '2019-11-08 05:09:25', '2020-11-08 05:09:25'),
('49e634eb18d70507016fcfd3980f59ad0a6de4f8c7e4fd6efec592393db8f34b105ea45bb1009747', 514, 1, 'user', '[]', 0, '2019-11-06 06:01:37', '2019-11-06 06:01:37', '2020-11-06 06:01:37'),
('4a417c9b6d0af27d495975a9c27667cb4ce74328ba6554832a50adb0ecc130571d0dab1bd713a823', 493, 1, 'user', '[]', 0, '2019-11-05 10:59:11', '2019-11-05 10:59:11', '2020-11-05 10:59:11'),
('4a8ae85a35d200a381ccad3fe8eb0cccafa623cc1f665321342e1a6e800e8f150be55963e3b851d2', 480, 1, 'user', '[]', 0, '2019-11-05 04:17:53', '2019-11-05 04:17:53', '2020-11-05 04:17:53'),
('4b18b6c0ece419374cb6099a7e825eab8084686d4ff39d1f7e1500db5b20a74ef8aa66b45c0f7967', 548, 1, 'user', '[]', 1, '2019-11-07 13:23:24', '2019-11-07 13:23:24', '2020-11-07 13:23:24'),
('4b7e2047266a94ba20a3da9db0a642ac769791578827fee6cc0497bd7b3e0dde48ec772c4ad3eedf', 501, 1, 'user', '[]', 0, '2019-11-05 14:51:42', '2019-11-05 14:51:42', '2020-11-05 14:51:42'),
('4bd4388b3b8afb037bf72c49d39a3f2452832dbf75a9d90b425d110617ce1419ded9180ff6917a70', 525, 1, 'user', '[]', 0, '2019-11-06 11:13:45', '2019-11-06 11:13:45', '2020-11-06 11:13:45'),
('4ca69e7da5b57478bb24bcf870bfa2fb3829b567c3f76def521dcdd2482c8302b45523c5bfefae2d', 495, 1, 'user', '[]', 0, '2019-11-05 11:55:48', '2019-11-05 11:55:48', '2020-11-05 11:55:48'),
('4cf449d53b71a6b91a919ed0dbab3799beeb572deb6eb62726e100769662bdd4e754f3e0690509be', 482, 1, 'user', '[]', 1, '2019-11-05 06:18:08', '2019-11-05 06:18:08', '2020-11-05 06:18:08'),
('4d6baae28d05b4425746253ce426f6107cae08b462562ba870c01e45107ec7ec6c0bd4b60ffbe033', 522, 1, 'user', '[]', 0, '2019-11-06 09:13:42', '2019-11-06 09:13:42', '2020-11-06 09:13:42'),
('4e1ae94d23eb3f73b78af85761b287a3ad7328fd8a927a5b6cd08a188400cecfc174e923e8f459c0', 480, 1, 'user', '[]', 1, '2019-11-05 04:56:41', '2019-11-05 04:56:41', '2020-11-05 04:56:41'),
('4e50fb4272af299f7c4d5d126413a9bc65cbb0f729953e602b6d16d653ebb7d8edd472ec552de0a9', 473, 1, 'user', '[]', 0, '2019-11-04 22:13:55', '2019-11-04 22:13:55', '2020-11-04 22:13:55'),
('4fe3a6b6e66f3711b3f7c774d3f5aadff461245b0616b8705a86c2ba9a131de15621c98110e6a985', 512, 1, 'user', '[]', 1, '2019-11-06 05:40:09', '2019-11-06 05:40:09', '2020-11-06 05:40:09'),
('509e68ef74e7e76f4f2beeb589e9cd4983bd693d85e36c1aaa32854c4819c18262d0f6a131570d8a', 463, 1, 'user', '[]', 0, '2019-11-04 14:23:40', '2019-11-04 14:23:40', '2020-11-04 14:23:40'),
('510b767e04088073e6c77758a1203cd88efa16b52806b09b70a4db280d2e181f7d9c358c62be393f', 471, 1, 'user', '[]', 1, '2019-11-05 04:02:14', '2019-11-05 04:02:14', '2020-11-05 04:02:14'),
('513329223021978df4703546576f984453f05384f79731ca987e6cf115807acc21b64e28c300dcf7', 479, 1, 'user', '[]', 1, '2019-11-05 06:17:25', '2019-11-05 06:17:25', '2020-11-05 06:17:25'),
('5159000a0296c21d46cd788d9290101d2baf738b13e61fe2631f7105ad47f4f7bc5b41ce4166f4bd', 501, 1, 'user', '[]', 1, '2019-11-06 05:56:55', '2019-11-06 05:56:55', '2020-11-06 05:56:55'),
('51a951707ef084c65a43476fb688a67f84e4c6d11c6f8744ea9831865eb9c24a6e285b338b8d7bb4', 497, 1, 'user', '[]', 0, '2019-11-05 13:09:50', '2019-11-05 13:09:50', '2020-11-05 13:09:50'),
('51ab0a1cb0d8edf4e9e05a3d4d2bd695c040e8ff1b2816a95e642aa148a3382b80650ebbfa8fabf1', 449, 1, 'user', '[]', 1, '2019-11-02 15:03:48', '2019-11-02 15:03:48', '2020-11-02 15:03:48'),
('528dd22316c38a68f7383a8d8054746ed4cbef4fc9519d247ec01c2af37520cda95cf5194128650f', 489, 1, 'user', '[]', 0, '2019-11-05 07:19:03', '2019-11-05 07:19:03', '2020-11-05 07:19:03'),
('532fe6b183f53cf5cdc0ebf513ce33fe018d84cff24e20aaee608cc1acc0fb8638fb5b36cfba54d5', 504, 1, 'user', '[]', 0, '2019-11-06 12:56:52', '2019-11-06 12:56:52', '2020-11-06 12:56:52'),
('53547cb52973edb7f977adc2493c03db2f1c7fe8ed722e3d0895922ae41213ab43a952a021a3703b', 450, 1, 'user', '[]', 0, '2019-11-02 17:34:37', '2019-11-02 17:34:37', '2020-11-02 17:34:37'),
('537a12e7f2a68e7fe6f3882d2f283aedd618eb93b5d04cc09cd52be945c43430a6f20760115dfdd2', 481, 1, 'user', '[]', 0, '2019-11-05 06:40:02', '2019-11-05 06:40:02', '2020-11-05 06:40:02'),
('55733e766a9587cc4200895c3f71e5a50bcb7a9e09c293ac51d50fd150c63623b18f85401e71c0dc', 480, 1, 'user', '[]', 0, '2019-11-05 04:18:04', '2019-11-05 04:18:04', '2020-11-05 04:18:04'),
('55ada6db96db23241459ae20946abc106633aade89d2066f247806d9158c5a02d0046eacaec721f0', 512, 1, 'user', '[]', 0, '2019-11-08 04:50:01', '2019-11-08 04:50:01', '2020-11-08 04:50:01'),
('569c25df14b7aac328b861a669ab48149d5723f46e9e8c1378680e2525a08e60df021b99c7ff88c9', 482, 1, 'user', '[]', 0, '2019-11-05 05:10:27', '2019-11-05 05:10:27', '2020-11-05 05:10:27'),
('57afcc12053dd4f4c85c4bb81ff9f12bf70a4f701061191d625061e302cf484e8caf12c2b57c0c38', 497, 1, 'user', '[]', 0, '2019-11-05 13:11:22', '2019-11-05 13:11:22', '2020-11-05 13:11:22'),
('57f8222b1d008e5011c3916a4ff677fafc9020d30f13e27ef39bf1c3b17630fccc7b6b707bd885bf', 551, 1, 'user', '[]', 0, '2019-11-07 10:43:27', '2019-11-07 10:43:27', '2020-11-07 10:43:27'),
('591e86e90291d0c9e94561c69a38afca0390b3f2db13e2189828502b9dc09dcf94f9f773315aa14b', 469, 1, 'user', '[]', 0, '2019-11-04 18:08:17', '2019-11-04 18:08:17', '2020-11-04 18:08:17'),
('5b999333ab0a62b74319a9e42fa6159eaed42c5a60301583e98be9ce97e5c3bbf4d04f383d4f08a1', 530, 1, 'user', '[]', 0, '2019-11-06 14:48:29', '2019-11-06 14:48:29', '2020-11-06 14:48:29'),
('5c84241a44703fc1720ebe461cbd88bfd4ebbaf5a3f972bc22a252297ad1c26fdf596091a5bd5634', 549, 1, 'user', '[]', 0, '2019-11-07 11:25:28', '2019-11-07 11:25:28', '2020-11-07 11:25:28'),
('5cac16dc1ea66b17d60cdd01c44832bf39c095ca5bbe5d2fcb932aabe44ee3a781848a98e43ff1c2', 457, 1, 'user', '[]', 0, '2019-11-04 08:02:11', '2019-11-04 08:02:11', '2020-11-04 08:02:11'),
('5d7541b6c79fb966dfceecaf51b4b6e2aa787db9a06df390688ac83d50eff107a3cf3b0c7d51bb13', 483, 1, 'user', '[]', 1, '2019-11-05 05:14:07', '2019-11-05 05:14:07', '2020-11-05 05:14:07'),
('5e482613c12719123bc11023fc50f35eb79f3ef6a0fb8a13c218aec66c350d9eb696b5c5eac54b37', 472, 1, 'user', '[]', 0, '2019-11-04 20:44:18', '2019-11-04 20:44:18', '2020-11-04 20:44:18'),
('5e6ace80ccad94d3374e81a06febfc757aeb6f7041257cd0dad9207a2f7b85f9a2153854146f7697', 477, 1, 'user', '[]', 0, '2019-11-05 01:12:37', '2019-11-05 01:12:37', '2020-11-05 01:12:37'),
('5ef31650bbf8f32aaf49dce6bf6dcdefab347212e8914d3caf0887f7197b3005f48aea62985b1fa1', 510, 1, 'user', '[]', 0, '2019-11-05 16:00:06', '2019-11-05 16:00:06', '2020-11-05 16:00:06'),
('60a17e1fa7030d12825580dfd213fd05b94b94360ed108c82bbbf6bec21a862892b8c534c83ef07d', 506, 1, 'user', '[]', 1, '2019-11-05 15:44:22', '2019-11-05 15:44:22', '2020-11-05 15:44:22'),
('6309c28165f3f7f7f3d4a3e06f2ba6e5f946aa455f7e0748ca8a0d238cb4ab5617e660ba05ab3316', 462, 1, 'user', '[]', 0, '2019-11-04 14:19:00', '2019-11-04 14:19:00', '2020-11-04 14:19:00'),
('63868fa6d8abf6d47a6d73cfaba5cc2319549eaa0e3010ee420431b5264ef9ded15a3c44736dd015', 526, 1, 'user', '[]', 0, '2019-11-06 10:47:19', '2019-11-06 10:47:19', '2020-11-06 10:47:19'),
('6457efde2ead9559087f92ba656dfb17a75b9c417208f708fb4ed8e248387887c66e79b466c78370', 550, 1, 'user', '[]', 0, '2019-11-08 05:09:38', '2019-11-08 05:09:38', '2020-11-08 05:09:38'),
('64ace1ea57e8d936d829f04f72a6629bf1f359bf7f125400788f5bcd5263d4d305198b81677b2548', 450, 1, 'user', '[]', 0, '2019-11-02 17:40:19', '2019-11-02 17:40:19', '2020-11-02 17:40:19'),
('658ccb697c2e27bb841d6ba6f61a8feb620d7093d2781600eaf738e75f6e5d52bcda592d0283ba9c', 461, 1, 'user', '[]', 0, '2019-11-04 14:00:57', '2019-11-04 14:00:57', '2020-11-04 14:00:57'),
('673ae7d7a468a0496db95f3fd87b4af523c3e8e96efd37263fbc407a2edaf4f56b7323ca264245ba', 471, 1, 'user', '[]', 1, '2019-11-05 07:06:17', '2019-11-05 07:06:17', '2020-11-05 07:06:17'),
('686d371fc0bc741a67755081a662baa442759ce899a742db4eea7091ab1aa11336ced3ec02e4c94c', 528, 1, 'user', '[]', 0, '2019-11-06 12:06:31', '2019-11-06 12:06:31', '2020-11-06 12:06:31'),
('689c64fc69ee28a094543ba5b137ac26f5ef2b138030239cad5182abd111794e9cde2c31ddaefefa', 481, 1, 'user', '[]', 0, '2019-11-05 04:26:13', '2019-11-05 04:26:13', '2020-11-05 04:26:13'),
('692197af446c1d4b1d18f420be22bdcc6102ec3a18ddd12773229c78557dc4fa2c31483e4d1b7190', 457, 1, 'user', '[]', 0, '2019-11-04 08:00:57', '2019-11-04 08:00:57', '2020-11-04 08:00:57'),
('696594ef43caa4c5c1334880f9d5dd4bbfcfe0a823ffe2fca1a4ac38d16e13a9382677c65807099f', 514, 1, 'user', '[]', 1, '2019-11-06 07:07:25', '2019-11-06 07:07:25', '2020-11-06 07:07:25'),
('69fd87eaec8de1c76bac394fd889c9b748f84f72b5f4d746a92a12e01403262c1d1bfcc3ad2a9442', 501, 1, 'user', '[]', 0, '2019-11-05 15:31:24', '2019-11-05 15:31:24', '2020-11-05 15:31:24'),
('6c29d47e8c5e021daad1009d64bdf57805538be69e73aaafe156808815b8ed56e649f5cd073f7ca9', 506, 1, 'user', '[]', 1, '2019-11-05 15:32:52', '2019-11-05 15:32:52', '2020-11-05 15:32:52'),
('6c3ff1e8135ba06cb7a5eed14d446a30400120899b17769431430f020a494cf3147cecfdd9c07d95', 504, 1, 'user', '[]', 0, '2019-11-06 12:58:26', '2019-11-06 12:58:26', '2020-11-06 12:58:26'),
('6d0eb3c3da617594a1f8084a93eac6327e0ecbfb2b4f7428d5d80dc4b103661c5927fdd8f10015e8', 482, 1, 'user', '[]', 1, '2019-11-05 07:39:38', '2019-11-05 07:39:38', '2020-11-05 07:39:38'),
('6dbf1d68456ecbbeb2e92c35dbe18d2fcf995b425bac9d8cda219d7f9612ec44ff6f3da20b53a3eb', 501, 1, 'user', '[]', 1, '2019-11-05 14:49:03', '2019-11-05 14:49:03', '2020-11-05 14:49:03'),
('6e20e5857ba6beb8bcff4229af256f24828d8a691a95d8bb7a1ed3f1dea4bba2518fecb5b29299d7', 532, 1, 'user', '[]', 0, '2019-11-06 15:21:00', '2019-11-06 15:21:00', '2020-11-06 15:21:00'),
('6e3f84ed3eaef38b7292c3cc42ce612096560e35663edf5673a910b2021799fdd71d6f42608feb23', 446, 1, 'user', '[]', 1, '2019-11-01 04:43:10', '2019-11-01 04:43:10', '2020-11-01 04:43:10'),
('6e55bd5997cb638dce7e2343b1b814ff10a0786249bc34544d87e45c03b1dd0dc23ff0c1d90accfb', 448, 1, 'user', '[]', 0, '2019-11-02 15:07:18', '2019-11-02 15:07:18', '2020-11-02 15:07:18'),
('6ebe5dd5758392e67e2787aaf5860cc28bcdfd5f46635ffe213987a10f9353396535272cd8861901', 468, 1, 'user', '[]', 0, '2019-11-04 17:57:50', '2019-11-04 17:57:50', '2020-11-04 17:57:50'),
('6eed6a2010ee9662b5a8676c365937c5dc8cca7a3527d087774428e6aa1e792c76a6a0c1ef9fd771', 546, 1, 'user', '[]', 0, '2019-11-07 07:17:11', '2019-11-07 07:17:11', '2020-11-07 07:17:11'),
('6f029c5b1c03796381e84f42ce8b1c50538a03a64840abf5ee003efa7b0e797aa1a52d6ac77c526d', 525, 1, 'user', '[]', 0, '2019-11-06 10:40:41', '2019-11-06 10:40:41', '2020-11-06 10:40:41'),
('6f405ca016cc89b07bcfac3cd19d0afa97b71cc83de37c89b2be169827288913a4dc19ad2cab350a', 467, 1, 'user', '[]', 0, '2019-11-04 17:45:40', '2019-11-04 17:45:40', '2020-11-04 17:45:40'),
('7037376c80628dc6e92888e213feeb75eecd0a6eef2d3e5e4f2ebc7dad6679e16fcf84c12772d119', 480, 1, 'user', '[]', 1, '2019-11-05 04:18:16', '2019-11-05 04:18:16', '2020-11-05 04:18:16'),
('705c0cf739e285e43fcdf1ef5a76418700b354c1fc1fbd67cc0f7e5766b1eb81a2627fdba6c12a14', 549, 1, 'user', '[]', 1, '2019-11-07 10:30:35', '2019-11-07 10:30:35', '2020-11-07 10:30:35'),
('72fc939d41f4e8df3e117bc590f826e2c1576b077ef59f07aa7230f451cd6b720a448ec8c55efdd8', 548, 1, 'user', '[]', 0, '2019-11-08 04:55:40', '2019-11-08 04:55:40', '2020-11-08 04:55:40'),
('75d86e06b087385cbc88871e767ad4fac05bf67f40c804a7301044dd2aceabcfd4aee8ae2e3f0f1a', 488, 1, 'user', '[]', 0, '2019-11-05 07:33:34', '2019-11-05 07:33:34', '2020-11-05 07:33:34'),
('7647f50b63a0a6b169ac40f6aeb933be9454637f24e531bcea4344a1246a44b03bf0ff397287832d', 483, 1, 'user', '[]', 0, '2019-11-05 05:00:19', '2019-11-05 05:00:19', '2020-11-05 05:00:19'),
('76be61e1a708229ee5e64347f63459b3d027169d6b2c6f07c865cfe6424756fed1bfa800100b9c32', 456, 1, 'user', '[]', 0, '2019-11-04 06:04:56', '2019-11-04 06:04:56', '2020-11-04 06:04:56'),
('76e02168b8104ad8c50b9dd4f18db55b54b6f864bb41b06c41a9806daaf461d2924e3cb59cfcc19a', 540, 1, 'user', '[]', 0, '2019-11-07 03:35:47', '2019-11-07 03:35:47', '2020-11-07 03:35:47'),
('77a3b2498e8d17667b284be3552a49b4e170d4de6531c0cc4395a55b414070b12ff4ac42ba85e55e', 513, 1, 'user', '[]', 0, '2019-11-06 07:08:02', '2019-11-06 07:08:02', '2020-11-06 07:08:02'),
('78a79900f7efced7050021bdc0cef06fd372251840baeab854325534108a7660875dc8b6be60b31c', 507, 1, 'user', '[]', 0, '2019-11-05 15:38:39', '2019-11-05 15:38:39', '2020-11-05 15:38:39'),
('79042078b34cc7a1b7d68a42d7e8d30f42ec48b44d88b36a75b957fde0a24970daa72fbe2a8cd64b', 448, 1, 'user', '[]', 0, '2019-11-02 15:07:54', '2019-11-02 15:07:54', '2020-11-02 15:07:54'),
('795910de561a88d49d2339f7446b1202ab393fe98dfcfea43124eac28985777fe5816b6efb6d872f', 530, 1, 'user', '[]', 0, '2019-11-06 13:07:13', '2019-11-06 13:07:13', '2020-11-06 13:07:13'),
('7a3a3a8d8ceba9b840147b46ec57831b196f9c9c70e76fb02a5798d9dd1007d3aed051c25eb60aae', 476, 1, 'user', '[]', 0, '2019-11-05 00:54:12', '2019-11-05 00:54:12', '2020-11-05 00:54:12'),
('7a555cc0c13af18c65e8dea65628e4747504c50bfb0f3dba490beb0e1562163379590e7f1f0f0931', 533, 1, 'user', '[]', 0, '2019-11-06 16:53:16', '2019-11-06 16:53:16', '2020-11-06 16:53:16'),
('7bedb183b39a622ec662da4512b6df9e8b57a90d139305246bb813e61f3d970d3d7df65dab5d4e1e', 548, 1, 'user', '[]', 1, '2019-11-07 10:26:47', '2019-11-07 10:26:47', '2020-11-07 10:26:47'),
('7bf13cc7f970c72ad90b633bd6cab60b71352d49e966047c9fedcb4f2d0ca48dc826efd55c10dae7', 534, 1, 'user', '[]', 0, '2019-11-06 16:59:50', '2019-11-06 16:59:50', '2020-11-06 16:59:50'),
('7e014de590e7f014c155accdade509e27b4d3bb56632ae66d783441b20c148ca48c6cce966d235ec', 514, 1, 'user', '[]', 1, '2019-11-06 12:05:35', '2019-11-06 12:05:35', '2020-11-06 12:05:35'),
('7e1fc9bf749bb308a87310972b0ca9c4793a0ca3e1322a6c59bd4bb48775a62cc1ff62b54bf05825', 552, 1, 'user', '[]', 0, '2019-11-07 12:51:50', '2019-11-07 12:51:50', '2020-11-07 12:51:50'),
('7e603266c87ef5ba56a5beaf3d6c70263c6a169229e2150321fcc0cd5eb31ddba820fd56e8f00546', 523, 1, 'user', '[]', 0, '2019-11-07 13:41:39', '2019-11-07 13:41:39', '2020-11-07 13:41:39'),
('7ea69d5927e4daf2071df3184f1881105f0d431b326b130f4e8d7cd5ffd70f37184149edce80eb98', 523, 1, 'user', '[]', 0, '2019-11-06 10:29:39', '2019-11-06 10:29:39', '2020-11-06 10:29:39'),
('7f140aa4b758db79387cd69786c94c4a3859bea77a1c81d53bb7de9975a43c8c651bdce716cb05df', 523, 1, 'user', '[]', 0, '2019-11-06 11:15:09', '2019-11-06 11:15:09', '2020-11-06 11:15:09'),
('7f94bc428d1e0c617d00232af2efdbd74c2862366653e791bced40a5923561f4b05ac4e12db4e97e', 515, 1, 'user', '[]', 1, '2019-11-06 06:08:13', '2019-11-06 06:08:13', '2020-11-06 06:08:13'),
('8046081ba75dbd32d457600ffd2548a336279d2179c6bf3beecbfedc31d2c1743f9d354bde162263', 523, 1, 'user', '[]', 1, '2019-11-07 13:36:02', '2019-11-07 13:36:02', '2020-11-07 13:36:02'),
('805141e1569fc299b0f53df53749f9fd5a981b36433165e49120872724b25e7532205ed7a0363437', 461, 1, 'user', '[]', 0, '2019-11-04 14:20:27', '2019-11-04 14:20:27', '2020-11-04 14:20:27'),
('8086c0f62c444d48efd7638bbbcf80b78e45dc259b55dce9a645c74633152db26f59b9d3567561e9', 541, 1, 'user', '[]', 0, '2019-11-07 05:03:29', '2019-11-07 05:03:29', '2020-11-07 05:03:29'),
('809f0b340b7ebaef4148069e06a9bc80168fe6ecb6ee8109a8d5041783902850653d80b54eaaf0fe', 503, 1, 'user', '[]', 0, '2019-11-06 12:51:46', '2019-11-06 12:51:46', '2020-11-06 12:51:46'),
('8171dea61fd8574742b67162df6752320be8cfc1b907df10ab3c6baf1a4887506b1dd074bbcc17c9', 550, 1, 'user', '[]', 0, '2019-11-08 05:09:01', '2019-11-08 05:09:01', '2020-11-08 05:09:01'),
('8223d40e1fd7f14d7dcd640d117e09b20832b77c4ce806391ea32fec572e860927e9e37a436b8642', 523, 1, 'user', '[]', 1, '2019-11-06 11:29:14', '2019-11-06 11:29:14', '2020-11-06 11:29:14'),
('827f201d0feb8f34ebd0cc3fe08d2d3f766d4a2d4a8b687978806a4457fcca88a70eb43ea3df68f2', 495, 1, 'user', '[]', 0, '2019-11-05 12:00:55', '2019-11-05 12:00:55', '2020-11-05 12:00:55'),
('83d9568562e36ebb6adf9d3cca686e87f1672ff20724c4f05e76553c381bf3654d30f0a29679f727', 506, 1, 'user', '[]', 1, '2019-11-06 05:56:09', '2019-11-06 05:56:09', '2020-11-06 05:56:09'),
('8439bba994c0434f44c2c4d6c80a137c2238588b87281a62213a20e8cde66c0f015e36620d21eae0', 481, 1, 'user', '[]', 0, '2019-11-05 04:26:50', '2019-11-05 04:26:50', '2020-11-05 04:26:50'),
('8526063e90a49a6743ea321413515315952ebda0846a286e2172db21487d4bc99e85be7f3c37a5c3', 549, 1, 'user', '[]', 0, '2019-11-07 10:41:18', '2019-11-07 10:41:18', '2020-11-07 10:41:18'),
('85f4edaee4ae182a82c40123041a7a297f83c28b381027a0021f897ec707a88c7ed60206294ef185', 499, 1, 'user', '[]', 0, '2019-11-05 14:25:59', '2019-11-05 14:25:59', '2020-11-05 14:25:59'),
('86768b70f70dff6d0d3c6520e09b76cd8220cb267f1e7e9729949fdd0adba571cb89055dfc501822', 485, 1, 'user', '[]', 0, '2019-11-05 06:18:36', '2019-11-05 06:18:36', '2020-11-05 06:18:36'),
('8686bc32456521559b91620f44d59fd5b1babf31672b0d754a2a5d5343b0a7541e7305aa702f53e0', 504, 1, 'user', '[]', 1, '2019-11-06 12:58:37', '2019-11-06 12:58:37', '2020-11-06 12:58:37'),
('8738721c8765147efb6a9f030b7e5d38e5c23b7948788a68b035e8f5719adf1e91c74638688f2b41', 546, 1, 'user', '[]', 0, '2019-11-07 06:59:05', '2019-11-07 06:59:05', '2020-11-07 06:59:05'),
('875c441b86e184f5fc88029889ea65e29b78ec75ce71d012df1f1a5b77d03fbdac93c4a0cb9fe8a4', 471, 1, 'user', '[]', 1, '2019-11-05 04:29:25', '2019-11-05 04:29:25', '2020-11-05 04:29:25'),
('875f98307ea7988d17dd57adbcc9835149a238080c97909d0f84284d37d1ccf48b0490243679509a', 451, 1, 'user', '[]', 0, '2019-11-03 03:35:23', '2019-11-03 03:35:23', '2020-11-03 03:35:23'),
('87993eb19ebfb2398512368afcdbb32376d7a29edf172f29abd1313fce991daba59d348e0b1d19ad', 459, 1, 'user', '[]', 0, '2019-11-04 12:06:27', '2019-11-04 12:06:27', '2020-11-04 12:06:27'),
('89324c404a2e410b307309fc28202d7b9ab2c28c6a2a09c144ba1a9fe9807125f1eea58eb4a22afa', 509, 1, 'user', '[]', 0, '2019-11-05 15:39:59', '2019-11-05 15:39:59', '2020-11-05 15:39:59'),
('8986b6f40f27f59f0ddf652581f90264b2184238f677b01a5288128632b6089c3378206819301e15', 451, 1, 'user', '[]', 0, '2019-11-03 03:37:44', '2019-11-03 03:37:44', '2020-11-03 03:37:44'),
('899420ace11e7dcbc9825eabe69e0ede9d454274d7ca7cfbbfa62f4285bb5aad10d21aefee9f479d', 501, 1, 'user', '[]', 0, '2019-11-05 14:47:20', '2019-11-05 14:47:20', '2020-11-05 14:47:20'),
('89db3138d892ff224b8bf1909f4c28d260df04ce6f55927b38088956b5abb1dc453ce831e726b561', 485, 1, 'user', '[]', 0, '2019-11-05 06:18:52', '2019-11-05 06:18:52', '2020-11-05 06:18:52'),
('8aaec7be9e340252f9263b1af0e55bd97dbb9eee389e3b5f541d6d62ae40e0afd472bd3f6eaa3c37', 479, 1, 'user', '[]', 0, '2019-11-05 03:33:34', '2019-11-05 03:33:34', '2020-11-05 03:33:34'),
('8b06e738474b33b46ee9c53a608e7852a900c651552ca66dcb188c2c66309aca9bf7db92e8e82537', 513, 1, 'user', '[]', 0, '2019-11-06 05:46:02', '2019-11-06 05:46:02', '2020-11-06 05:46:02'),
('8cebd3e2ea3dd804d0eb33a39aca6e75f3e65e755736f02ed5acd9dae22e42bda2e0d146823733d3', 456, 1, 'user', '[]', 0, '2019-11-04 06:01:20', '2019-11-04 06:01:20', '2020-11-04 06:01:20'),
('8d63120d270b3c14c9db503084a8745e359ffdc10c79a65e0b0bd2f469645d515b3c6d716502ee11', 530, 1, 'user', '[]', 1, '2019-11-06 13:08:00', '2019-11-06 13:08:00', '2020-11-06 13:08:00'),
('8e8cec69533b125662810579b25ddd45141f86a14dab10046ea2f357041173c0c0dcd79a6749a53c', 492, 1, 'user', '[]', 0, '2019-11-05 10:49:55', '2019-11-05 10:49:55', '2020-11-05 10:49:55'),
('8e9653c3028f1679cd4a6f2605a5fd132967f05673c4049efbdc0dbdd7ad094ca9e8f79e119db54c', 481, 1, 'user', '[]', 1, '2019-11-05 04:27:14', '2019-11-05 04:27:14', '2020-11-05 04:27:14'),
('8ee66712b6a4f59ab2b024b3c23f12f83199fc0b0484446e6262ba8bcc56c4f1084f3f496071fe8d', 444, 1, 'user', '[]', 1, '2019-10-31 09:43:00', '2019-10-31 09:43:00', '2020-10-31 09:43:00'),
('91116f3a3a13a113141c564c2c50d3bf4ff38e974fcab1cadc5c99c7c1521c8b90dcda43fbff667e', 547, 1, 'user', '[]', 0, '2019-11-07 07:35:36', '2019-11-07 07:35:36', '2020-11-07 07:35:36'),
('91eb2499e47ca6f9382740780c54c6265bf9138c7e923a2d9ce448b4539e4e6db6c39e8be70f227d', 529, 1, 'user', '[]', 1, '2019-11-06 12:11:04', '2019-11-06 12:11:04', '2020-11-06 12:11:04'),
('9256f280a78eaf2689f95aec2585e46899d9a26a0f5097502c619af374d1e7e8f58121ae0aab5fc6', 481, 1, 'user', '[]', 1, '2019-11-05 05:11:06', '2019-11-05 05:11:06', '2020-11-05 05:11:06'),
('93132be2c44944ff78ae7a244b7583e700e499dba107ad14c80e5209712eba1990d52c2726d43a1b', 471, 1, 'user', '[]', 0, '2019-11-05 13:52:24', '2019-11-05 13:52:24', '2020-11-05 13:52:24'),
('93afffb80307b01ca71f64d4551a8385f938ab7baa6764ca1e34d129b31e44ce8581343a82dd82c4', 551, 1, 'user', '[]', 0, '2019-11-07 10:41:36', '2019-11-07 10:41:36', '2020-11-07 10:41:36'),
('93eda0fca0d9df852794f90efdc1a5a335190c66196bd63b4fcc1cd30f7bee524bbe0a1bac5744ba', 448, 1, 'user', '[]', 0, '2019-11-02 14:54:51', '2019-11-02 14:54:51', '2020-11-02 14:54:51'),
('94c5a11b56ddca11229205bdca441ed764601aab6722886bc5f859146aaf275825ec8940e96062d0', 514, 1, 'user', '[]', 1, '2019-11-06 12:23:07', '2019-11-06 12:23:07', '2020-11-06 12:23:07'),
('965cec22defad52f6c5a6542264d92236795b290e54a60f7735c49ae8a1d4e7e60f493d0cc821d56', 492, 1, 'user', '[]', 0, '2019-11-05 10:42:48', '2019-11-05 10:42:48', '2020-11-05 10:42:48'),
('97574afaeeb828245cf77213da19088691bdeb8cd7e5ecd5d05f5fa372216e753fcd8068fc63269d', 446, 1, 'user', '[]', 1, '2019-10-31 09:55:10', '2019-10-31 09:55:10', '2020-10-31 09:55:10'),
('98589fb4e40fca1c508248d606fede844f5a06f2d9d70380daf4829a2d640ee5d075c9948a0898db', 548, 1, 'user', '[]', 1, '2019-11-07 10:46:37', '2019-11-07 10:46:37', '2020-11-07 10:46:37'),
('994fb053e4cef98feab5fdd59481c4a84b70890bc804230ccddefa2750839d7a9dd0ebdcdf740e5a', 548, 1, 'user', '[]', 0, '2019-11-07 10:56:38', '2019-11-07 10:56:38', '2020-11-07 10:56:38'),
('9a3a055f935fe1161a5126f171efcff64c1568871b5cc3df11d4654d190a8475eaa3b2225e949178', 461, 1, 'user', '[]', 0, '2019-11-04 14:18:40', '2019-11-04 14:18:40', '2020-11-04 14:18:40'),
('9a9672d83b2d053e9fcd22a3f37abbae9748d318d7177fb5ed85d01b203b539fa09f6b9cf3115f15', 499, 1, 'user', '[]', 0, '2019-11-05 14:26:22', '2019-11-05 14:26:22', '2020-11-05 14:26:22'),
('9b9ae957b42c6c0c80dd92c38552b0879290be74fb7865411bce079aaca267630a323138cf88fc1f', 526, 1, 'user', '[]', 1, '2019-11-06 13:12:50', '2019-11-06 13:12:50', '2020-11-06 13:12:50'),
('9dbca649e94f4cbd621f7444080e8a3f510526255881057f1cfe81dc2bd58ff4aa978e8a86127614', 447, 1, 'user', '[]', 0, '2019-10-31 09:56:14', '2019-10-31 09:56:14', '2020-10-31 09:56:14'),
('9f0b7734ec464e3f38b169b76e810697fc5f6d757d95f28be947101848b705f8c5dcdb3edbc9d3b5', 528, 1, 'user', '[]', 1, '2019-11-06 12:07:35', '2019-11-06 12:07:35', '2020-11-06 12:07:35'),
('9fcbd03340b34be00abf4afdfe85e4203986139b957dfd9b5e4cb14862bb2d71905df0b3751c88ce', 473, 1, 'user', '[]', 0, '2019-11-04 22:11:32', '2019-11-04 22:11:32', '2020-11-04 22:11:32'),
('a07f81bc74bbc33e004f3fe47a180476ce749289d5f4b6bc2e1ab19f816da58c7f095ed86d659987', 501, 1, 'user', '[]', 1, '2019-11-05 14:54:23', '2019-11-05 14:54:23', '2020-11-05 14:54:23'),
('a0faa1ba30f110aafc6161c2941b6a299bc38370df98aae19161feac3bd091a85c9b52e35d97d64b', 496, 1, 'user', '[]', 0, '2019-11-05 11:56:49', '2019-11-05 11:56:49', '2020-11-05 11:56:49'),
('a18479764be909e5e2c2524771f9977e85d6deee2413fc985123b6e4876be61525ad90466c5fc70a', 506, 1, 'user', '[]', 1, '2019-11-05 15:40:41', '2019-11-05 15:40:41', '2020-11-05 15:40:41'),
('a27a9299dcd8b2b38a85ff708310dce5ef1819b8c05ff248c753b37a2cd245b216234bbd680718e0', 486, 1, 'user', '[]', 0, '2019-11-05 07:09:19', '2019-11-05 07:09:19', '2020-11-05 07:09:19'),
('a2bdd5403ffadaf701b504d21d6e860598dc1bd3ffcb5ecbc0bc0cd819739f577a3bc916922116c2', 513, 1, 'user', '[]', 0, '2019-11-06 05:41:06', '2019-11-06 05:41:06', '2020-11-06 05:41:06'),
('a314d00c0924fe4c57abc1cc3a1585fdb7fafee950781c542febd913985376786a29f6ed3bcdc2db', 449, 1, 'user', '[]', 0, '2019-11-02 15:01:22', '2019-11-02 15:01:22', '2020-11-02 15:01:22'),
('a401c6cf470d914cbae6cec00fcfd4d1102d70125a56df6b1cc3d8f31713ca5be9d8d04928a26ac1', 493, 1, 'user', '[]', 0, '2019-11-05 10:58:37', '2019-11-05 10:58:37', '2020-11-05 10:58:37'),
('a41c6df4c889bf078f8a9b94bda2a1364204813374cbaa85f7435a719e6e5db78407f36543813e28', 503, 1, 'user', '[]', 0, '2019-11-06 12:51:57', '2019-11-06 12:51:57', '2020-11-06 12:51:57'),
('a6591c0a2591b068a7cb11264f1f4851f40c41895fbc532ac7ee80f03d1ae34468ff9b14333cb3d4', 501, 1, 'user', '[]', 1, '2019-11-07 07:31:50', '2019-11-07 07:31:50', '2020-11-07 07:31:50'),
('a6b87925935cf5ad484b1f503a5d820746207b86ffd101b2d410d2fce0781213eefb768dba9608a4', 483, 1, 'user', '[]', 1, '2019-11-05 05:24:53', '2019-11-05 05:24:53', '2020-11-05 05:24:53'),
('a6bd61bcc408c59a3ed948c4b4e37f7b68543c0cb6e959dc8d9f5ea09386e66efe18bed04c4b590d', 461, 1, 'user', '[]', 0, '2019-11-04 14:19:42', '2019-11-04 14:19:42', '2020-11-04 14:19:42'),
('a77318097247df7b4c2f664263e7b2c4512f7805dccafe5a47541741babceba88776467a358e97d3', 482, 1, 'user', '[]', 0, '2019-11-05 09:23:11', '2019-11-05 09:23:11', '2020-11-05 09:23:11'),
('a77f6862f8d399c2ae4573e7cbc846bbc63f19af68b9ee6750db4fe1429c9b9fa9a365993965945a', 523, 1, 'user', '[]', 0, '2019-11-06 11:50:54', '2019-11-06 11:50:54', '2020-11-06 11:50:54'),
('a7902842103a8cdeb5842dec4495013a29cfd86b243e69062fc6111b4509efafdf55cfaf57a8c9bb', 528, 1, 'user', '[]', 0, '2019-11-06 12:06:06', '2019-11-06 12:06:06', '2020-11-06 12:06:06'),
('a8953b5e484399f4318b5c6f3ac669b5dbfa885e27a2662517eccf8f7c872f631290dee064ae1cbb', 529, 1, 'user', '[]', 0, '2019-11-06 13:41:08', '2019-11-06 13:41:08', '2020-11-06 13:41:08'),
('a94fb2946c96cc61a24dd4eaacb8db2fa0ff39916c36370de8be1224b294205a27f37c0c69c460fe', 523, 1, 'user', '[]', 1, '2019-11-06 11:48:33', '2019-11-06 11:48:33', '2020-11-06 11:48:33'),
('a985c2e476ab54d4d61e2528ca19bbce895f8d61d69da7d7933e17f4bf19b50c9948821f7e0a5133', 531, 1, 'user', '[]', 0, '2019-11-06 14:39:50', '2019-11-06 14:39:50', '2020-11-06 14:39:50'),
('ac67dae0498ca73bc23f18b6619d676f265a9452fde50367e34304f313fdfaa0aa269a7ea21d97dd', 529, 1, 'user', '[]', 0, '2019-11-06 12:10:23', '2019-11-06 12:10:23', '2020-11-06 12:10:23'),
('ac898b39302136ec0ff11b465b72ee91c47967dd5f234dab8d461859a62925b2270755421f552608', 503, 1, 'user', '[]', 0, '2019-11-05 15:27:14', '2019-11-05 15:27:14', '2020-11-05 15:27:14'),
('ac8c914cf46b9eda906de602656048786ff995b970a9589ab32a6d73c25812b12f1c700bbf8cb243', 506, 1, 'user', '[]', 0, '2019-11-05 15:32:46', '2019-11-05 15:32:46', '2020-11-05 15:32:46'),
('aca73dc8af357ba12f9d2d2d39902ece28d25ca1d36303c786742dd608b8306f65df9cb48d11e608', 464, 1, 'user', '[]', 0, '2019-11-04 15:28:09', '2019-11-04 15:28:09', '2020-11-04 15:28:09'),
('ad0f0364b12b51dad8e986004d3c2c58f1cc6210bd0259ee3fa0f8b6aaec76671b57b31fb00d9757', 523, 1, 'user', '[]', 0, '2019-11-07 07:17:53', '2019-11-07 07:17:53', '2020-11-07 07:17:53'),
('ad11bf0ae9bc5be5699dfd91ade47a9337e30f9903ecf6172fd223dfa38809af67dfeffbdb94ce9d', 523, 1, 'user', '[]', 1, '2019-11-06 11:15:17', '2019-11-06 11:15:17', '2020-11-06 11:15:17'),
('adfb3e10b7be3f7a39528ef51c8fb8d4075c059abd103f2e7e598875c57c9204ec2b991fb8247e59', 549, 1, 'user', '[]', 0, '2019-11-07 13:27:24', '2019-11-07 13:27:24', '2020-11-07 13:27:24'),
('ae43bd81cdf13983baa02df399d0c1002169ad42db5f6897836ec561769d76fee29c088f5a783a7f', 523, 1, 'user', '[]', 0, '2019-11-06 11:14:34', '2019-11-06 11:14:34', '2020-11-06 11:14:34'),
('b2065d33eb237fd613cc5dc917420a673c7892f39eebf618a54266675ec80e3d5e4827679116069a', 555, 1, 'user', '[]', 0, '2019-11-08 05:28:03', '2019-11-08 05:28:03', '2020-11-08 05:28:03'),
('b46b263d4f82e2e0c349dc6fb837e87acb884eed90e4ed4e75b92b99e33014105f704c04f88eceaf', 484, 1, 'user', '[]', 1, '2019-11-05 05:04:18', '2019-11-05 05:04:18', '2020-11-05 05:04:18'),
('b4f8e9bfc22c12efa20c5becdc95ff66e649c697f8dcf6b06a1d689b638accf74b96e8b5fffef825', 546, 1, 'user', '[]', 0, '2019-11-07 09:42:26', '2019-11-07 09:42:26', '2020-11-07 09:42:26'),
('b686f42aaffdb1e018bc05606e1f998c196b775eaad06632ccb6e573aaaa5a75dd56b42b680d7267', 482, 1, 'user', '[]', 0, '2019-11-05 04:58:22', '2019-11-05 04:58:22', '2020-11-05 04:58:22'),
('b85012c60493eb50b9471c486637b4e7f506f71d08c8387ea1d37f576c03d22429eaa60e096eb50a', 504, 1, 'user', '[]', 0, '2019-11-06 12:57:35', '2019-11-06 12:57:35', '2020-11-06 12:57:35'),
('b8c21d01e46054ff4fe9c4008fb64b9b493cc404294773f72d208141b538fdd37c5fb8ec662e9b55', 501, 1, 'user', '[]', 0, '2019-11-05 14:51:23', '2019-11-05 14:51:23', '2020-11-05 14:51:23'),
('b909c0d22ce5dc8273e2ad2b6ed282af48df0abb1414814dc976a42be6d8131557d0e82663707d70', 504, 1, 'user', '[]', 0, '2019-11-06 13:00:41', '2019-11-06 13:00:41', '2020-11-06 13:00:41'),
('b95abe16c93ef9245b0f9389b11f86ab76f20eb5771ff8976061a5ace73b5bf15ecf20412733ed37', 529, 1, 'user', '[]', 0, '2019-11-06 12:09:46', '2019-11-06 12:09:46', '2020-11-06 12:09:46'),
('ba7e37faa2d19e8f587866d26824cdbc6475e54d1c922620c02aebd1d3631569aa933dac40770929', 482, 1, 'user', '[]', 1, '2019-11-05 06:53:36', '2019-11-05 06:53:36', '2020-11-05 06:53:36'),
('bace5bdc3d1cccc84866bb56ba42a50d287a3352ea356514678470cb89e18e214c1a66175e2c4d08', 475, 1, 'user', '[]', 0, '2019-11-05 00:47:20', '2019-11-05 00:47:20', '2020-11-05 00:47:20'),
('bc5f305912c8775a8671be550e577c784051273bb571da2f23ed9752323785a332b828af8d6554fa', 494, 1, 'user', '[]', 0, '2019-11-05 11:31:57', '2019-11-05 11:31:57', '2020-11-05 11:31:57'),
('bc93f4683c5f1375217d1a077f89e177637236f96381a9b8c2f647a491c728f42615ec61093eb1ad', 515, 1, 'user', '[]', 1, '2019-11-06 06:07:57', '2019-11-06 06:07:57', '2020-11-06 06:07:57'),
('bd31030fbfda3b993d38ecb0d76fa8453695749ce1611d20513c1ab69dfe8bd9882f2eaa3d57cbd0', 479, 1, 'user', '[]', 0, '2019-11-05 07:30:05', '2019-11-05 07:30:05', '2020-11-05 07:30:05'),
('bdb543af182572b4f0b481aaece1e4e88f97989686ad49e91e0aa057232435dcd7957a5601eff0fb', 531, 1, 'user', '[]', 1, '2019-11-06 15:18:39', '2019-11-06 15:18:39', '2020-11-06 15:18:39'),
('bdfe0f38f338314d65c89e5cfa83c6bf8cd25e209bb4fd719ddd4c566848974062845ef610654d6f', 509, 1, 'user', '[]', 1, '2019-11-05 15:41:04', '2019-11-05 15:41:04', '2020-11-05 15:41:04'),
('be41b2a98d75fb274b36dd1682f55be0135559477a8bfc952135618aeb3ee1de8f238ca1a8241514', 528, 1, 'user', '[]', 1, '2019-11-06 12:06:45', '2019-11-06 12:06:45', '2020-11-06 12:06:45'),
('bf2526bda8e38b5883099264be1e7e2a87148c8b3ccaea5f534dc085e164bad1a1575c289c1317b3', 466, 1, 'user', '[]', 0, '2019-11-04 17:36:15', '2019-11-04 17:36:15', '2020-11-04 17:36:15'),
('bf4aa5449a1cd112ebd1ad8b33f456b59b1e4967b38c6b9a5c2fe04300a8d4d428f1709516ee2bc4', 522, 1, 'user', '[]', 0, '2019-11-06 09:16:36', '2019-11-06 09:16:36', '2020-11-06 09:16:36'),
('bfc59d84abc256bd63aa52c4a113eee9dd46ce37c79bd29c3c289d977767ad7d81781c6dabc6c9e2', 504, 1, 'user', '[]', 1, '2019-11-07 07:44:49', '2019-11-07 07:44:49', '2020-11-07 07:44:49'),
('bfda5596154d9dc97084273f923a663410afe4f18d92ad907990600f3d09f5bc5ba7717c6bce2e0c', 510, 1, 'user', '[]', 0, '2019-11-05 16:02:23', '2019-11-05 16:02:23', '2020-11-05 16:02:23'),
('c13505d14a2d7c676f8133d88bcd36ad6e84b9ccd53f606dc2ece94f38e5065e88fa1ccf48556fb1', 455, 1, 'user', '[]', 0, '2019-11-04 04:57:37', '2019-11-04 04:57:37', '2020-11-04 04:57:37'),
('c1c67a291387ae7246a78942e2992ce642bbc45d34aaae6e88066f3ed56c7d81b2be1914898817a7', 501, 1, 'user', '[]', 0, '2019-11-05 22:35:53', '2019-11-05 22:35:53', '2020-11-05 22:35:53'),
('c1ddc95e981221067bc34a203a4524c8ee925780c69a635135d2f7b35fc7869d755b7dbe1d0dc0e9', 448, 1, 'user', '[]', 0, '2019-11-02 15:04:41', '2019-11-02 15:04:41', '2020-11-02 15:04:41'),
('c37a5dd163aa27516f4b37f41d3ccf1d33696dab2a99b907271215ee42c12ea2b0bd4dbde348cde2', 526, 1, 'user', '[]', 1, '2019-11-06 13:31:00', '2019-11-06 13:31:00', '2020-11-06 13:31:00'),
('c3dd5b3b55da8f6377544f0703f11e966e037f960f6a5f872d268bebafc9a28487e4f90dd8401cd0', 550, 1, 'user', '[]', 0, '2019-11-08 05:09:01', '2019-11-08 05:09:01', '2020-11-08 05:09:01'),
('c45972e45deac30cfbb0ba0434cdf1df624959f75db5b685ce4128d4d9ef9a72fe87e8d626eadd8a', 550, 1, 'user', '[]', 0, '2019-11-07 09:36:35', '2019-11-07 09:36:35', '2020-11-07 09:36:35'),
('c5f6901930fcd29c861027900d65e9de5fe020ecac5345f3e677eea6d3dfb6198639b95adfb0ac89', 514, 1, 'user', '[]', 0, '2019-11-06 06:02:24', '2019-11-06 06:02:24', '2020-11-06 06:02:24'),
('c6458c02e270b56d47bcfb5188260e438925d6897dfbe57d3a1ee60069c02fe8b18a627b8659cfbe', 481, 1, 'user', '[]', 1, '2019-11-05 04:53:55', '2019-11-05 04:53:55', '2020-11-05 04:53:55'),
('c74aed203d5c47094d8f87eccfb141e3c066519360abfa1b0bdaf5f9c55039221ad3c2019774a6db', 513, 1, 'user', '[]', 0, '2019-11-06 05:45:34', '2019-11-06 05:45:34', '2020-11-06 05:45:34');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('c7e3c558120452bd0224ea1e5fd9ff658ff6ea6007d4981b89eedadb1d17154896b66337fc5ec38a', 515, 1, 'user', '[]', 0, '2019-11-06 06:07:20', '2019-11-06 06:07:20', '2020-11-06 06:07:20'),
('c7fe7d2de878e47743c6e56f561e3cdca27655920c7df5cb8485e166a11cc9739674837c66f7c704', 479, 1, 'user', '[]', 1, '2019-11-05 03:59:34', '2019-11-05 03:59:34', '2020-11-05 03:59:34'),
('c81db66717221ff6f8e25ee577e72d4287d06e6cffa2ed077735a20d89a895ac1a95aa7392c66caa', 504, 1, 'user', '[]', 1, '2019-11-07 09:39:17', '2019-11-07 09:39:17', '2020-11-07 09:39:17'),
('c97a81c132b53fa9bc70f10c0ada14aae16832e92adf7e564e4879d97bee628f59959555465b793e', 454, 1, 'user', '[]', 0, '2019-11-03 21:00:23', '2019-11-03 21:00:23', '2020-11-03 21:00:23'),
('ca989bd3c5bc72a7b947a5c1e8fc3d43877b58e340011045f35c261b9ea54977f442bda15c0e201f', 549, 1, 'user', '[]', 1, '2019-11-07 10:46:31', '2019-11-07 10:46:31', '2020-11-07 10:46:31'),
('cc14387d855e320e170d41d273ed46a5ed6170847b99aa36cfe3697eb22c0b9def59024d970351f5', 444, 1, 'user', '[]', 0, '2019-10-31 09:42:26', '2019-10-31 09:42:26', '2020-10-31 09:42:26'),
('ce0aeb190bda3ad5203c0938dba74cce83f22de121a4aa8f5ce50e82d5a3716481c9cbc17baee668', 549, 1, 'user', '[]', 0, '2019-11-07 13:22:18', '2019-11-07 13:22:18', '2020-11-07 13:22:18'),
('ce7461d895c9549de2f66602b257c3e1abf7e602a77c5b2cef78ca94b5d9f04a3fc563563ba60910', 554, 1, 'user', '[]', 0, '2019-11-08 01:24:38', '2019-11-08 01:24:38', '2020-11-08 01:24:38'),
('ce7968ebbdfd59471d32a2a78edb4435146312d686dbd7486034b7cb574ba155f934ac456af9db91', 530, 1, 'user', '[]', 1, '2019-11-06 13:28:26', '2019-11-06 13:28:26', '2020-11-06 13:28:26'),
('ceaf89fa67423c5968c111a7f9974998ae3ad63be308e2792e2bada17ef8c2a30a8cc9814e22ef1a', 445, 1, 'user', '[]', 1, '2019-10-31 09:53:18', '2019-10-31 09:53:18', '2020-10-31 09:53:18'),
('cee7647f3978f4fcaf6ff875166b314aa41f630a4a2f019a3b434dd9cfb76e3fb9119fe80ee0806a', 453, 1, 'user', '[]', 0, '2019-11-03 15:07:12', '2019-11-03 15:07:12', '2020-11-03 15:07:12'),
('cf531307d07dea7235035ad1ff265cf09000e61c29f4ca06020432c9f87c1b7c9347b386914737af', 466, 1, 'user', '[]', 0, '2019-11-04 17:36:41', '2019-11-04 17:36:41', '2020-11-04 17:36:41'),
('d024c6c6e9a782f57fba3b2c7e93c77ca0d57a4bb4d76d6e9957f2582711f285e2f07e2bc4220bb3', 554, 1, 'user', '[]', 0, '2019-11-08 01:26:56', '2019-11-08 01:26:56', '2020-11-08 01:26:56'),
('d0c8ed1aae61b462b1dd8898e43674652d5046bd2e153f56ea3e88e78f0b3c57c976a1061bd99d62', 447, 1, 'user', '[]', 1, '2019-10-31 09:56:38', '2019-10-31 09:56:38', '2020-10-31 09:56:38'),
('d123186ed50abeffdf23a8a5b6fc00035931364ff47f2c89db0a0b9e66e3ca1e1d4f2832f0da2567', 504, 1, 'user', '[]', 0, '2019-11-06 13:48:29', '2019-11-06 13:48:29', '2020-11-06 13:48:29'),
('d192e169a6d4da06034c252f492e4f4bed62ea891030f4b66d2ee6191f10215d85da79409b997991', 463, 1, 'user', '[]', 0, '2019-11-04 14:24:14', '2019-11-04 14:24:14', '2020-11-04 14:24:14'),
('d1d50e144a2e4cf7d5fddad78fe3312a2ce6b4ac6526a32d6998abaeb9ff1c6a91322e50e91e013d', 495, 1, 'user', '[]', 0, '2019-11-05 11:59:42', '2019-11-05 11:59:42', '2020-11-05 11:59:42'),
('d29446b49dc2e2db4a80d1893d898d841c93bde15e745b2fe15c0d1c6e6d8aed7738d9650c06f65a', 523, 1, 'user', '[]', 1, '2019-11-07 12:40:16', '2019-11-07 12:40:16', '2020-11-07 12:40:16'),
('d2eafa4e9eb4c79fb25eedbd0b5d8514b35622ff9b35f20a47dbd30d20918b382ece537d8484150f', 469, 1, 'user', '[]', 0, '2019-11-04 18:04:54', '2019-11-04 18:04:54', '2020-11-04 18:04:54'),
('d39cf0c667ca9f647b3a1b4db3acebc98fad35a427f7b635badc290a56680b5a48ef150c772cc1d5', 460, 1, 'user', '[]', 0, '2019-11-04 11:22:36', '2019-11-04 11:22:36', '2020-11-04 11:22:36'),
('d3c13cbd57240f935d3590726af2763b73a5ebf2ccba8413876fd1096031d59ffc1fd6a2d58f9fc8', 478, 1, 'user', '[]', 0, '2019-11-05 02:21:56', '2019-11-05 02:21:56', '2020-11-05 02:21:56'),
('d3c9961f38ba5f6dbad73ab658a70ad2484aa1dacab15b97edf8720628ae945af7edf1d02dc9fbed', 534, 1, 'user', '[]', 0, '2019-11-06 17:01:40', '2019-11-06 17:01:40', '2020-11-06 17:01:40'),
('d58ca66312dce4f5de00e41015215b93339b85c96472407a43f14adb110f64e60c893c4e0505c065', 465, 1, 'user', '[]', 0, '2019-11-04 16:20:29', '2019-11-04 16:20:29', '2020-11-04 16:20:29'),
('d65d1f7aea6a7064b4240af805244fc89be7bb500700a1be381033037496f22264d75536457b090a', 513, 1, 'user', '[]', 0, '2019-11-06 05:40:40', '2019-11-06 05:40:40', '2020-11-06 05:40:40'),
('d79457a8e6c4473e839c0c9e8838bdce4c48e41363d11207cf32d58e1d4e1d314905242e6c52f3b8', 481, 1, 'user', '[]', 1, '2019-11-05 05:43:44', '2019-11-05 05:43:44', '2020-11-05 05:43:44'),
('d81d3deaecaa48938e3fd62e81fcbced98b0d34d149d46671fe92c0e1c0ff9e44163bb96213fae74', 484, 1, 'user', '[]', 1, '2019-11-05 05:18:06', '2019-11-05 05:18:06', '2020-11-05 05:18:06'),
('d82bca930b62eb37d4b22d3f4938eb53e72021af9ff492c839d334779534f252ed1ea5e8e897fc0d', 513, 1, 'user', '[]', 0, '2019-11-06 05:43:49', '2019-11-06 05:43:49', '2020-11-06 05:43:49'),
('d89325c13dfbf3b32f16e33cba3894e9e596f63ba28d5cb160ef3e7bb04717b281a487bf6beb046d', 494, 1, 'user', '[]', 0, '2019-11-05 11:31:14', '2019-11-05 11:31:14', '2020-11-05 11:31:14'),
('d8a41d3d881237bb71b6b0da2d9d51a33d20be487d2ea36ec473dfef24f9b8153f6378db995fa444', 464, 1, 'user', '[]', 0, '2019-11-04 15:30:25', '2019-11-04 15:30:25', '2020-11-04 15:30:25'),
('d9645e0623224374675d68b06de49247f62e4c20b13023c47d0fbd103e643e2b348cdea6c89caa36', 523, 1, 'user', '[]', 1, '2019-11-07 11:11:55', '2019-11-07 11:11:55', '2020-11-07 11:11:55'),
('d97d8f79844406e5035f8d34a297edf5bad2f5ce94a5534edc05d083814759a17dde654ffb2f60cc', 487, 1, 'user', '[]', 0, '2019-11-05 07:13:33', '2019-11-05 07:13:33', '2020-11-05 07:13:33'),
('da97bb12019c10587e2901bf3023fa651f34f4ffd78cce75941a2234d7806578a9cb6ee178f04360', 481, 1, 'user', '[]', 0, '2019-11-05 06:29:24', '2019-11-05 06:29:24', '2020-11-05 06:29:24'),
('de14b0f1c15d4e779f5df5f278ee0cfe7c42f2cee6fff8f2cc7c2da6d5ead3e7a69fb1c75296ce73', 480, 1, 'user', '[]', 1, '2019-11-05 06:03:22', '2019-11-05 06:03:22', '2020-11-05 06:03:22'),
('de92270a93da2ead6e3d216be0dd569d2684de8bcbb55af99f1098f74ebfb117f6a4f286919983fb', 522, 1, 'user', '[]', 0, '2019-11-06 09:12:25', '2019-11-06 09:12:25', '2020-11-06 09:12:25'),
('deafe9c7944c9d3f0cc33b54fd5b0f9369de23c6c59380405f93727371d05d489db75ed6b7d3b248', 523, 1, 'user', '[]', 1, '2019-11-06 11:55:08', '2019-11-06 11:55:08', '2020-11-06 11:55:08'),
('deb2322d360a3687a7a5d9e3b71f30beef186c440857f48641d0a0fdcb1fe5f53ba7f202151cfef0', 531, 1, 'user', '[]', 0, '2019-11-06 15:18:23', '2019-11-06 15:18:23', '2020-11-06 15:18:23'),
('df261b26ca4969be208634ca1ddbfda47128b135156f7a0c7278f7768a4c20c327baebeced4fd774', 481, 1, 'user', '[]', 1, '2019-11-05 04:35:10', '2019-11-05 04:35:10', '2020-11-05 04:35:10'),
('e07458e75a18ca7388965be53147b70c8bc4619fce864b12280a000ad382560c529a2e9787432172', 519, 1, 'user', '[]', 0, '2019-11-06 06:57:57', '2019-11-06 06:57:57', '2020-11-06 06:57:57'),
('e0b89bfa7f094e4629a4ea24d2348976e2d9ea89bfad06f587fae05ddc50dca646d2411378cb5ee3', 443, 1, 'user', '[]', 0, '2019-10-31 09:36:40', '2019-10-31 09:36:40', '2020-10-31 09:36:40'),
('e436d10cb325ef064d47b83dea51ccad2b07f14b5f8de73fc1c1bb499d5ea475dd8063e6e05e1e6f', 489, 1, 'user', '[]', 1, '2019-11-05 07:19:36', '2019-11-05 07:19:36', '2020-11-05 07:19:36'),
('e533c5b28565525ae34f6bb6ec99806755ae0aec108a57d711b9cd07d0c3b4b1c0f3eecbe99d7626', 526, 1, 'user', '[]', 1, '2019-11-06 12:12:13', '2019-11-06 12:12:13', '2020-11-06 12:12:13'),
('e5c068ded213e678a40872bf3d0b13491aea5bc38b46404e863947c798859c5d9dc8db71c7637fe6', 487, 1, 'user', '[]', 0, '2019-11-05 07:12:43', '2019-11-05 07:12:43', '2020-11-05 07:12:43'),
('e5c90406cf25f4bddbb156eb9aaf789e2f9ffa6d9fcf7a82f46a22a9819e3426560aef849b5cffc5', 476, 1, 'user', '[]', 0, '2019-11-05 00:58:50', '2019-11-05 00:58:50', '2020-11-05 00:58:50'),
('e6b9c3d6fb32baf60995b1772f84394c64246c83dc56589eb55dd397a896d8419722466b84718bd8', 480, 1, 'user', '[]', 1, '2019-11-05 04:55:50', '2019-11-05 04:55:50', '2020-11-05 04:55:50'),
('e78a6d61f27b8c25833a16b9ab99d78ef650c200909911b554ede19faeec51f74c2dcaf6f936d1b2', 526, 1, 'user', '[]', 1, '2019-11-06 10:53:32', '2019-11-06 10:53:32', '2020-11-06 10:53:32'),
('e876617e21b4fdf199798efad4b7da415da407b3ed38141ee5265f90a9ee0cb262566a084134ef61', 458, 1, 'user', '[]', 0, '2019-11-04 11:17:05', '2019-11-04 11:17:05', '2020-11-04 11:17:05'),
('e906160d26233982cd37309e72eacabe58da79cb49c2ea186fd742884a9b786b52e344cceec01ef1', 487, 1, 'user', '[]', 0, '2019-11-05 07:13:49', '2019-11-05 07:13:49', '2020-11-05 07:13:49'),
('e9b084724885885409fe3ac9923da29df5ee66effedbd774cb32165423f92347faa7cc3f273c6c40', 445, 1, 'user', '[]', 0, '2019-10-31 20:05:00', '2019-10-31 20:05:00', '2020-10-31 20:05:00'),
('ea02d3209f271104d564583e80a1a11ca3b0a0b9c1989bcdee2fe107cb5d58bb872b1982f6ab41cc', 472, 1, 'user', '[]', 0, '2019-11-04 20:43:16', '2019-11-04 20:43:16', '2020-11-04 20:43:16'),
('eb06ca53a9ae2bcc62400d649b1607507c667dc54abe5235499009760c9c8e67528c3c5491fbf1e9', 548, 1, 'user', '[]', 1, '2019-11-07 07:53:59', '2019-11-07 07:53:59', '2020-11-07 07:53:59'),
('eb10d722d6619fc9f9dd87bfc8de94e29d55f407dbf9a68203d1345aa742a07eca74f8e5713c5a58', 491, 1, 'user', '[]', 0, '2019-11-05 09:41:21', '2019-11-05 09:41:21', '2020-11-05 09:41:21'),
('eb37a6b443ef6b252e01aa024053d6a2b0090f48f7cf928d0de32b278d166846dab4bfa5b389963a', 480, 1, 'user', '[]', 1, '2019-11-05 09:23:58', '2019-11-05 09:23:58', '2020-11-05 09:23:58'),
('eb6570ca0a59beb69612da73cefa25eeb2e1283a653c98193ec95d916b394d5081f06117fc89d279', 550, 1, 'user', '[]', 1, '2019-11-08 05:09:38', '2019-11-08 05:09:38', '2020-11-08 05:09:38'),
('ebdefd5ed68858db64d82f7b82c18851ec74bfef99c60ddce4d01aa5a609913f1563215d74e5f7d3', 530, 1, 'user', '[]', 0, '2019-11-06 13:06:52', '2019-11-06 13:06:52', '2020-11-06 13:06:52'),
('ec08adefe43b5a103cd597974e8da100ae24f2ee9b42b09f3d31b49919babefe73ebb8629936d3e0', 531, 1, 'user', '[]', 0, '2019-11-06 14:39:04', '2019-11-06 14:39:04', '2020-11-06 14:39:04'),
('ee1b3e7775510b8dddecd97a1b269d52b5d7f2422f86df10b828b909647e98e32524571d27d41014', 512, 1, 'user', '[]', 0, '2019-11-06 05:17:40', '2019-11-06 05:17:40', '2020-11-06 05:17:40'),
('ef40a086d575c319c15216bd5e516c2a425fcef9d6e9d32e0cbf21bd866c15ae7ba00d39cbeab696', 555, 1, 'user', '[]', 1, '2019-11-08 05:28:57', '2019-11-08 05:28:57', '2020-11-08 05:28:57'),
('ef7c4e5a0233ea4d6803698ade24fbf7d6de6776880bc7e8f6ae195ad97220ec4aa45eccccd11233', 550, 1, 'user', '[]', 0, '2019-11-08 05:18:45', '2019-11-08 05:18:45', '2020-11-08 05:18:45'),
('f0c4fca405577764ad70044ce404c57375018cbfef4e6335565e13bb1454f57716bc2f60984dbe89', 537, 1, 'user', '[]', 0, '2019-11-06 19:33:17', '2019-11-06 19:33:17', '2020-11-06 19:33:17'),
('f13dc7b5281eb3535d708300ab6acfd05d831f049e3640259f5c98b30b0192f29d873d00527b4686', 548, 1, 'user', '[]', 1, '2019-11-07 10:17:12', '2019-11-07 10:17:12', '2020-11-07 10:17:12'),
('f1cee1230e0ba78c26fac03d6b94f5752cecaf516952325322fac386f8b6a7301630a9cdc9b93494', 481, 1, 'user', '[]', 1, '2019-11-05 04:42:29', '2019-11-05 04:42:29', '2020-11-05 04:42:29'),
('f3e90da762a4f818dbbc68dfcceed385ffa4bad6d5f7e694a7ff94cde61ecdec048067aec3ff920e', 476, 1, 'user', '[]', 0, '2019-11-05 00:55:17', '2019-11-05 00:55:17', '2020-11-05 00:55:17'),
('f58c66f21720f4b948286cdfd774eb4dd3f659b14536a51ce3442ea1150e3bfc0683b3c18e3d43f9', 463, 1, 'user', '[]', 0, '2019-11-04 14:23:21', '2019-11-04 14:23:21', '2020-11-04 14:23:21'),
('f882be0537168fb681f9037bc63e60c3f8ef7a4e7fc7881e5e622af8f1ce5879851b6b0795dfd450', 534, 1, 'user', '[]', 0, '2019-11-07 05:42:51', '2019-11-07 05:42:51', '2020-11-07 05:42:51'),
('f8d3a4760452c1ede6d628854081767756f7c1400d1576ae50d2be6027e0aa5fbe0fe2f3a895dffa', 504, 1, 'user', '[]', 1, '2019-11-06 12:59:15', '2019-11-06 12:59:15', '2020-11-06 12:59:15'),
('f8ef1de3b19208219e9728fe31e88d399aa2884d186d78b3ebe3bd4a5c2742e5ee02fb368f95c8cf', 491, 1, 'user', '[]', 0, '2019-11-05 09:42:08', '2019-11-05 09:42:08', '2020-11-05 09:42:08'),
('f97f56b4c29c854a2de50a16078bc84e0549f42424aa4b062d69a3d0065e9754d311d012583f2d30', 549, 1, 'user', '[]', 1, '2019-11-07 13:33:01', '2019-11-07 13:33:01', '2020-11-07 13:33:01'),
('f9b3b7a0347ca3103ccc6e64c6e780952a7d75f5ac381e607cc7dd490de18f319e6013d75ad3e35d', 468, 1, 'user', '[]', 0, '2019-11-04 17:51:09', '2019-11-04 17:51:09', '2020-11-04 17:51:09'),
('fa1c59b902549daf8fdc4aeba817914963307735c8502e1185f56f9aaf241fbfca3007b668dfee19', 501, 1, 'user', '[]', 0, '2019-11-05 14:51:12', '2019-11-05 14:51:12', '2020-11-05 14:51:12'),
('fa1e9f8272106d52f79b7ad1af4f3f7ebbc3babe97cce3be7dc6dc8add9e86fee79aaa643ff2655e', 481, 1, 'user', '[]', 1, '2019-11-05 04:28:35', '2019-11-05 04:28:35', '2020-11-05 04:28:35'),
('fabe8b6f29b0c8c469fb6bd804ec2f271219c28ff90a4cc3ae394ad2630fb79e1ee6ce37c721fdef', 457, 1, 'user', '[]', 0, '2019-11-04 08:02:57', '2019-11-04 08:02:57', '2020-11-04 08:02:57'),
('fac5588414ffd6eb8b308e920b8358d2a16326397c141b4595a335855fbb407af735eb32d20f5952', 514, 1, 'user', '[]', 1, '2019-11-06 06:06:39', '2019-11-06 06:06:39', '2020-11-06 06:06:39'),
('fac6885a8cc86e1264da7741d9c8f9e719d460ac952124122920bb4a0ed098ae31ed023fcf5d4bfb', 515, 1, 'user', '[]', 0, '2019-11-06 06:07:43', '2019-11-06 06:07:43', '2020-11-06 06:07:43'),
('fb09670c132a599d70d6849380b2bbdcf4016d54368e79bc12bfcc605ff91b43b0d1c0c9e75f6eda', 532, 1, 'user', '[]', 0, '2019-11-06 15:21:19', '2019-11-06 15:21:19', '2020-11-06 15:21:19'),
('fb569d5b613421c0e9f736e73a545823eb440c02e2ec0ab052067c3d905f91fc6b678c3e28526ef8', 502, 1, 'user', '[]', 0, '2019-11-05 15:01:54', '2019-11-05 15:01:54', '2020-11-05 15:01:54'),
('fb7fe9f0ef8dd97e0bd28e978286faca8a896abc30def0975f8b564400a5ba177cb4b2cddcfab1cb', 470, 1, 'user', '[]', 0, '2019-11-04 18:41:00', '2019-11-04 18:41:00', '2020-11-04 18:41:00'),
('fb87a2b4a77e40aa8a86d3a37488a26d8ddeb8e9ae99c775c3beabe9f26cd919930d95767a26a759', 479, 1, 'user', '[]', 1, '2019-11-05 06:05:57', '2019-11-05 06:05:57', '2020-11-05 06:05:57'),
('fbc95f2de8a2c7006e6b35d34e0abb79d443977f46137e4dc88883230a3ceb34d6dd2a8f41cf761a', 475, 1, 'user', '[]', 0, '2019-11-05 00:42:56', '2019-11-05 00:42:56', '2020-11-05 00:42:56'),
('fd1f72621621d5ad77399d5a8b339129b04170a2b6b845d3b03a9ff04e95f3d5d5e0d37f3954dbf6', 537, 1, 'user', '[]', 0, '2019-11-06 19:33:49', '2019-11-06 19:33:49', '2020-11-06 19:33:49'),
('fde211b379caf935f9e34d16d908a556b649bc93bf6941d4bbca18988eb121e7b20faf0e16c330ed', 501, 1, 'user', '[]', 0, '2019-11-05 14:50:59', '2019-11-05 14:50:59', '2020-11-05 14:50:59'),
('fea1132f89b3ba536db607cf12b25598f9dae6b99d87393339e781d931c802e62bcd1beb9ff09d5e', 534, 1, 'user', '[]', 0, '2019-11-06 17:01:22', '2019-11-06 17:01:22', '2020-11-06 17:01:22'),
('feba05972b59734641ae8887f8822d13a5bff790fbf9d67559465a19eceb3db1b5eae98338c7e503', 513, 1, 'user', '[]', 0, '2019-11-06 05:42:40', '2019-11-06 05:42:40', '2020-11-06 05:42:40'),
('ff14ef27696604ca361ccda7b41575a3ba09a4fc01ac9a48b2b74ac8f7605f67f84f9ea890ff60b1', 466, 1, 'user', '[]', 0, '2019-11-04 17:37:09', '2019-11-04 17:37:09', '2020-11-04 17:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Love Push Personal Access Client', 'Abxmt0kiTkWqZT8Bg9s3BdqoGBlkq2T2nRS3tTrm', 'http://localhost', 1, 0, 0, '2019-01-21 04:55:50', '2019-01-21 04:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-01-21 04:55:50', '2019-01-21 04:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_post_anonymously` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> show, 0=> profile hidden',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> active, 0=> not active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `description`, `image`, `is_post_anonymously`, `status`, `created_at`, `updated_at`) VALUES
(165, 509, 'Fiⷴnͯaⷥlͤlͫyͧ 😍😘😍', NULL, '1572968607.png', 0, 1, '2019-11-05 15:43:27', '2019-11-05 15:43:27'),
(168, 509, '😍😍😘😉', NULL, '1573039675.png', 0, 1, '2019-11-06 11:27:55', '2019-11-06 11:27:55'),
(169, 523, 'testing', 'Hcchchbbcbchc', '1573042190.png', 0, 1, '2019-11-06 12:09:50', '2019-11-06 12:09:50'),
(170, 526, 'post', 'Ghjj', '1573044054.png', 1, 1, '2019-11-06 12:40:54', '2019-11-06 12:40:54'),
(171, 523, 'testing', 'Cnnvvnnvnv\nHkjgjg', '1573045100.png', 0, 1, '2019-11-06 12:58:20', '2019-11-06 12:58:20'),
(172, 530, 'hry', 'idkdo', '1573047146.png', 0, 1, '2019-11-06 13:32:26', '2019-11-06 13:32:26'),
(173, 526, 'dfg dg', 'Df gdsgd', '1573106803.png', 1, 1, '2019-11-07 06:06:43', '2019-11-07 06:06:43'),
(174, 548, 'hyyu', 'ghjk', '1573113698.png', 0, 1, '2019-11-07 08:01:38', '2019-11-07 08:01:38'),
(175, 549, 'hiii', 'Description', '1573117720.png', 1, 1, '2019-11-07 09:08:40', '2019-11-07 09:08:40'),
(176, 551, 'gbv', 'btbg', '1573124328.png', 0, 1, '2019-11-07 10:58:48', '2019-11-07 10:58:48'),
(177, 509, 'D-Evil 🙂', NULL, '1573165715.png', 0, 1, '2019-11-07 22:28:35', '2019-11-07 22:28:35');

-- --------------------------------------------------------

--
-- Table structure for table `post_ads`
--

CREATE TABLE `post_ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> love ad, 2=> connect ad',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_post_anonymously` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> show, 0=> profile hidden',
  `radius` decimal(8,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> active, 0=> not active',
  `approval` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` bigint(20) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=like, 0=unlike',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(127, 165, 509, 1, '2019-11-05 16:08:09', '2019-11-05 16:08:09'),
(129, 168, 509, 1, '2019-11-06 11:28:12', '2019-11-06 11:28:12'),
(131, 165, 522, 1, '2019-11-07 07:11:17', '2019-11-07 07:11:17'),
(132, 171, 546, 1, '2019-11-07 09:52:25', '2019-11-07 09:53:05'),
(133, 173, 523, 0, '2019-11-07 09:52:41', '2019-11-07 09:57:41'),
(134, 171, 523, 1, '2019-11-07 09:52:49', '2019-11-07 09:52:49'),
(135, 174, 546, 1, '2019-11-07 09:55:57', '2019-11-07 09:55:57'),
(136, 174, 523, 1, '2019-11-07 09:56:16', '2019-11-07 09:57:47'),
(137, 169, 523, 1, '2019-11-07 09:56:24', '2019-11-07 09:56:24'),
(138, 170, 523, 1, '2019-11-07 09:56:27', '2019-11-07 09:56:27'),
(139, 171, 551, 1, '2019-11-07 10:44:33', '2019-11-07 11:12:25'),
(140, 176, 523, 1, '2019-11-07 10:58:58', '2019-11-07 11:14:55'),
(141, 169, 551, 1, '2019-11-07 11:12:37', '2019-11-07 13:20:49'),
(142, 176, 551, 1, '2019-11-07 13:20:38', '2019-11-07 13:20:38'),
(143, 165, 551, 1, '2019-11-07 13:22:06', '2019-11-07 13:22:06'),
(144, 168, 551, 1, '2019-11-07 13:22:12', '2019-11-07 13:22:12');

-- --------------------------------------------------------

--
-- Table structure for table `qb_chat_dialog_ids`
--

CREATE TABLE `qb_chat_dialog_ids` (
  `id` int(11) NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `qb_dialog_id` varchar(255) DEFAULT NULL,
  `chat_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=on, 0=off',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qb_chat_dialog_ids`
--

INSERT INTO `qb_chat_dialog_ids` (`id`, `match_id`, `qb_dialog_id`, `chat_status`, `created_at`, `updated_at`) VALUES
(479, 447, '5dc19829a28f9a4685a9feaf', 1, '2019-11-05 15:41:50', '2019-11-05 15:41:50'),
(489, 457, '5dc2c254a0eb47278a90c416', 1, '2019-11-06 12:56:05', '2019-11-06 12:56:05'),
(490, 460, '5dc3c099a28f9a5aa3a9feac', 1, '2019-11-07 06:58:40', '2019-11-07 06:58:40'),
(491, 464, '5dc3c54ba0eb47202790c415', 1, '2019-11-07 07:18:49', '2019-11-07 07:18:49'),
(492, 465, '5dc3e1dba28f9a2cf6a9feaa', 1, '2019-11-07 09:20:28', '2019-11-07 09:20:28'),
(493, 471, '5dc3fc3da28f9a479ba9feaa', 1, '2019-11-07 11:13:12', '2019-11-07 11:13:12'),
(494, 473, '5dc3fc55a28f9a4803a9feaa', 1, '2019-11-07 11:13:25', '2019-11-07 11:13:25'),
(495, 453, '5dc49a4da0eb477b9c29ee45', 1, '2019-11-07 22:27:36', '2019-11-07 22:27:36'),
(496, 470, '5dc4f56ea28f9a7126cbb177', 1, '2019-11-08 04:56:19', '2019-11-08 04:56:19'),
(497, 466, '5dc41a64a28f9a5637a9feaa', 1, '2019-11-08 04:56:29', '2019-11-08 04:56:29');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  `max_scores` int(11) DEFAULT NULL,
  `max_answers` int(11) DEFAULT NULL,
  `score_multiple` float NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `status`, `max_scores`, `max_answers`, `score_multiple`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 3, 1, '2019-04-30 15:31:17', '2019-06-06 16:00:53'),
(2, 1, NULL, 1, 1, '2019-04-30 15:31:17', '2019-05-06 16:12:27'),
(3, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:17:13'),
(4, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:17:43'),
(5, 1, 80, 2, 2, '2019-04-30 15:31:17', '2019-04-30 16:19:26'),
(6, 1, 40, 2, 1, '2019-04-30 15:31:17', '2019-04-30 16:19:43'),
(7, 1, 40, 3, 1, '2019-04-30 15:31:17', '2019-04-30 16:19:59'),
(8, 0, 30, 2, 1, '2019-04-30 15:31:17', '2019-09-24 15:03:15'),
(9, 0, 9, 3, 0.15, '2019-04-30 15:31:17', '2019-09-24 15:03:23'),
(10, 0, 20, 1, 1, '2019-04-30 15:31:17', '2019-09-24 15:03:27'),
(11, 0, 20, 1, 1, '2019-04-30 15:31:17', '2019-09-24 15:03:30'),
(12, 0, 20, 1, 1, '2019-04-30 15:31:17', '2019-09-24 15:03:35'),
(13, 1, 60, 3, 1, '2019-04-30 15:31:17', '2019-04-30 16:23:38'),
(14, 0, 20, 1, 1, '2019-04-30 15:31:17', '2019-09-24 15:03:51'),
(15, 1, 60, 3, 1, '2019-04-30 15:31:17', '2019-04-30 16:25:36'),
(16, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:25:46'),
(17, 0, 20, 1, 1, '2019-04-30 15:31:17', '2019-09-24 15:03:55'),
(18, 0, 20, 1, 1, '2019-04-30 15:31:17', '2019-09-24 15:03:59'),
(19, 0, NULL, NULL, 1, '2019-04-30 15:31:17', '2019-04-30 15:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `question_descs`
--

CREATE TABLE `question_descs` (
  `question_id` int(11) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=English,2=German',
  `question` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_descs`
--

INSERT INTO `question_descs` (`question_id`, `language_id`, `question`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'What are you looking for on Love Push?', 1, '2019-04-30 15:30:10', '2019-06-03 19:43:57'),
(1, 2, 'Wonach suchst du bei Love Push?', 1, '2019-04-30 15:30:10', '2019-06-03 19:44:07'),
(2, 1, 'What are your ambitions?', 1, '2019-04-30 15:33:28', '2019-06-03 19:45:27'),
(2, 2, 'Was sind Ihre Ziele?', 1, '2019-04-30 15:33:28', '2019-06-03 19:45:37'),
(3, 1, 'What is your favourite spot?', 1, '2019-04-30 15:33:28', '2019-09-24 15:13:08'),
(3, 2, 'Was ist dein Lieblingsplatz?', 1, '2019-04-30 15:33:28', '2019-06-03 19:49:08'),
(4, 1, 'Your fashion styles?', 1, '2019-04-30 15:33:28', '2019-10-30 06:10:46'),
(4, 2, 'Deine Modestile?', 1, '2019-04-30 15:33:28', '2019-09-24 15:14:16'),
(5, 1, 'What are your reasons for meeting new people?', 1, '2019-04-30 15:33:28', '2019-09-24 15:14:39'),
(5, 2, 'Was sind Ihre Gründe, neue Leute kennenzulernen?', 1, '2019-04-30 15:33:28', '2019-09-24 15:14:52'),
(6, 1, 'How would you describe yourself?', 1, '2019-04-30 15:33:28', '2019-10-21 12:09:58'),
(6, 2, 'Wie würdest du dich selbst beschreiben?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(7, 1, 'How do you spend your weekends?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(7, 2, 'Wie verbringst du deine Wochenenden?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(8, 1, 'How do you prefer to get your food?', 0, '2019-04-30 15:33:28', '2019-09-24 14:59:36'),
(8, 2, 'kochen, bestellen oder essen gehen?', 0, '2019-04-30 15:33:28', '2019-09-24 14:59:40'),
(9, 1, 'Which national cuisine do you prefer?', 0, '2019-04-30 15:33:28', '2019-09-24 14:59:46'),
(9, 2, 'Welche Mahlzeiten bevorzugen Sie?', 0, '2019-04-30 15:33:28', '2019-09-24 14:59:50'),
(10, 1, 'What morning guy are you?', 0, '2019-04-30 15:33:28', '2019-09-24 14:59:54'),
(10, 2, 'Wenn du schlafen kannst, wann stehst du auf?', 0, '2019-04-30 15:33:28', '2019-09-24 14:59:57'),
(11, 1, 'Which animal do you prefer?', 0, '2019-04-30 15:33:28', '2019-09-24 15:00:02'),
(11, 2, 'Welches Tier bevorzugst du?', 0, '2019-04-30 15:33:28', '2019-09-24 15:00:09'),
(12, 1, 'What is your level of education?', 0, '2019-04-30 15:33:28', '2019-09-24 15:00:13'),
(12, 2, 'Was ist Ihr Bildungsstand?', 0, '2019-04-30 15:33:28', '2019-09-24 15:00:18'),
(13, 1, 'What are your favourite free time activities?', 1, '2019-04-30 15:33:28', '2019-06-04 16:47:39'),
(13, 2, 'Was sind Ihre Lieblingsfreizeitbeschäftigungen?', 1, '2019-04-30 15:33:28', '2019-06-04 16:47:58'),
(14, 1, 'If you win a trip from Love Push, where would it be?', 0, '2019-04-30 15:33:28', '2019-09-24 15:00:28'),
(14, 2, 'Wenn Sie eine Reise von Love Push gewinnen, wo würde es sein?', 0, '2019-04-30 15:33:28', '2019-09-24 15:00:32'),
(15, 1, 'What is most important referring to your dream partner?', 1, '2019-04-30 15:33:28', '2019-09-24 15:16:43'),
(15, 2, 'Was ist für Ihren Traumpartner am wichtigsten?', 1, '2019-04-30 15:33:28', '2019-09-24 15:16:53'),
(16, 1, 'How important is sex for you in a relationship?', 1, '2019-04-30 15:33:28', '2019-10-30 06:13:46'),
(16, 2, 'Wie wichtig ist Sex in einer Beziehung für dich?', 1, '2019-04-30 15:33:28', '2019-04-30 15:55:37'),
(17, 1, 'Are you planning to have kids with your partner?', 0, '2019-04-30 15:33:28', '2019-09-24 15:01:29'),
(17, 2, 'Planen Sie Kinder mit Ihrem Partner zu haben?', 0, '2019-04-30 15:33:28', '2019-09-24 15:01:33'),
(18, 1, 'Can you imagine getting married?', 0, '2019-04-30 15:33:28', '2019-09-24 15:01:21'),
(18, 2, 'Kannst du dir vorstellen zu heiraten?', 0, '2019-04-30 15:33:28', '2019-09-24 15:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `ques_options`
--

CREATE TABLE `ques_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ques_options`
--

INSERT INTO `ques_options` (`id`, `question_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-04-30 17:02:46', '2019-04-30 17:02:46'),
(2, 1, 1, '2019-04-30 17:02:46', '2019-04-30 17:04:16'),
(3, 1, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:18'),
(4, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(5, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(6, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(7, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(8, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(9, 3, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(10, 3, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(11, 3, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(12, 3, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(13, 4, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(14, 4, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(15, 4, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(16, 4, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(17, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(18, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(19, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(20, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(21, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(22, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(23, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(24, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(25, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(26, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(27, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(28, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(29, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(30, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(31, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(32, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(33, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(34, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(35, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(36, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(37, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(38, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(39, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(40, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(41, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(42, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(43, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(44, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(45, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(46, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(47, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(48, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(49, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(50, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(51, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(52, 10, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(53, 10, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(54, 10, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(55, 11, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(56, 11, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(57, 11, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(58, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(59, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(60, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(61, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(62, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(63, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(64, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(65, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(66, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(67, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(68, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(69, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(70, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(71, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(72, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(73, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(74, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(75, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(76, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(77, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(78, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(79, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(80, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(81, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(82, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(83, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(84, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(85, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(86, 16, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(87, 16, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(88, 16, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(89, 16, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(90, 17, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(91, 17, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(92, 17, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(93, 18, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(94, 18, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(95, 18, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `ques_option_descs`
--

CREATE TABLE `ques_option_descs` (
  `ques_option_id` int(11) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=English, 2=German',
  `option` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ques_option_descs`
--

INSERT INTO `ques_option_descs` (`ques_option_id`, `language_id`, `option`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Man', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(1, 2, 'Mann', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(2, 1, 'Woman', 1, '0000-00-00 00:00:00', '2019-07-05 11:13:26'),
(2, 2, 'Frau', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(3, 1, 'Other', 1, '0000-00-00 00:00:00', '2019-10-30 06:14:42'),
(3, 2, 'Andere', 1, '0000-00-00 00:00:00', '2019-10-23 18:26:57'),
(4, 1, 'Love', 1, '0000-00-00 00:00:00', '2019-06-03 19:47:57'),
(4, 2, 'Love', 1, '0000-00-00 00:00:00', '2019-06-03 19:48:03'),
(5, 1, 'Flirts', 1, '0000-00-00 00:00:00', '2019-06-03 19:48:07'),
(5, 2, 'Flirts', 1, '0000-00-00 00:00:00', '2019-06-03 19:48:10'),
(6, 1, 'Friends', 1, '0000-00-00 00:00:00', '2019-06-03 19:48:15'),
(6, 2, 'Friends', 1, '0000-00-00 00:00:00', '2019-06-03 19:48:18'),
(7, 1, 'Travel buddy\'s', 1, '0000-00-00 00:00:00', '2019-10-30 06:25:54'),
(7, 2, 'Reisepartner', 1, '0000-00-00 00:00:00', '2019-10-30 06:30:12'),
(8, 1, 'Open minded', 1, '0000-00-00 00:00:00', '2019-06-03 19:48:37'),
(8, 2, 'Open minded', 1, '0000-00-00 00:00:00', '2019-06-03 19:48:39'),
(9, 1, 'Outside I love to move and be in nature', 1, '0000-00-00 00:00:00', '2019-10-23 18:35:50'),
(9, 2, 'Draußen mag ich mich bewegen und in der Natur sein', 1, '0000-00-00 00:00:00', '2019-10-23 18:36:05'),
(10, 1, 'My home is my temple', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(10, 2, 'Mein Zuhause ist mein Tempel', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(11, 1, 'Everywhere surrounded by nice people', 1, '0000-00-00 00:00:00', '2019-06-03 19:53:48'),
(11, 2, 'Orte, an denen ich neue interessante Leute kennenlernen kann', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(12, 1, 'Places for inspiration', 1, '0000-00-00 00:00:00', '2019-06-03 19:53:58'),
(12, 2, 'Ein Ort, an dem ich nachdenken und neue Ideen finden kann', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(13, 1, 'Casual', 1, '0000-00-00 00:00:00', '2019-06-03 19:54:37'),
(13, 2, 'Casual', 1, '0000-00-00 00:00:00', '2019-06-03 19:54:45'),
(14, 1, 'Glamorous', 1, '0000-00-00 00:00:00', '2019-10-23 18:36:58'),
(14, 2, 'Glamorous', 1, '0000-00-00 00:00:00', '2019-10-23 18:37:16'),
(15, 1, 'Comfortable', 1, '0000-00-00 00:00:00', '2019-06-03 19:55:09'),
(15, 2, 'Comfortable', 1, '0000-00-00 00:00:00', '2019-06-03 19:55:12'),
(16, 1, 'Different', 1, '0000-00-00 00:00:00', '2019-06-03 19:55:18'),
(16, 2, 'Different', 1, '0000-00-00 00:00:00', '2019-06-03 19:55:21'),
(17, 1, 'Love and security', 1, '0000-00-00 00:00:00', '2019-04-30 17:40:17'),
(17, 2, 'Liebe und Sicherheit', 1, '0000-00-00 00:00:00', '2019-04-30 17:40:25'),
(18, 1, 'Money and status', 1, '0000-00-00 00:00:00', '2019-04-30 17:40:39'),
(18, 2, 'Geld und Status', 1, '0000-00-00 00:00:00', '2019-04-30 17:40:46'),
(19, 1, 'Free time activities and hobby’s', 1, '0000-00-00 00:00:00', '2019-10-30 06:31:20'),
(19, 2, 'Freizeitaktivitäten und Hobby', 1, '0000-00-00 00:00:00', '2019-10-23 18:38:32'),
(20, 1, 'Creating good memories', 1, '0000-00-00 00:00:00', '2019-09-24 15:22:55'),
(20, 2, 'Gute Erinnerungen schaffen', 1, '0000-00-00 00:00:00', '2019-09-24 15:23:06'),
(21, 1, 'Becoming old together', 1, '0000-00-00 00:00:00', '2019-09-24 15:23:29'),
(21, 2, 'Gemeinsam alt werden', 1, '0000-00-00 00:00:00', '2019-09-24 15:23:41'),
(22, 1, 'Shy', 1, '0000-00-00 00:00:00', '2019-09-24 15:24:24'),
(22, 2, 'Schüchtern', 1, '0000-00-00 00:00:00', '2019-09-24 15:24:32'),
(23, 1, 'Depending on my mood', 1, '0000-00-00 00:00:00', '2019-09-24 15:24:41'),
(23, 2, 'Abhängig von meiner Stimmung', 1, '0000-00-00 00:00:00', '2019-09-24 15:25:05'),
(24, 1, 'Open minded', 1, '0000-00-00 00:00:00', '2019-09-24 15:25:15'),
(24, 2, 'Offen', 1, '0000-00-00 00:00:00', '2019-09-24 15:25:22'),
(25, 1, 'Humorous', 1, '0000-00-00 00:00:00', '2019-09-24 15:25:31'),
(25, 2, 'Humorvoll', 1, '0000-00-00 00:00:00', '2019-09-24 15:25:39'),
(26, 1, 'Sensitive', 1, '0000-00-00 00:00:00', '2019-10-23 18:40:10'),
(26, 2, 'Empfindlich', 1, '0000-00-00 00:00:00', '2019-10-23 18:41:23'),
(27, 1, 'Emotional', 1, '0000-00-00 00:00:00', '2019-10-23 18:40:05'),
(27, 2, 'Emotional', 1, '0000-00-00 00:00:00', '2019-10-23 18:41:35'),
(28, 1, 'Optimistic', 1, '0000-00-00 00:00:00', '2019-10-23 18:40:35'),
(28, 2, 'Optimistisch', 1, '0000-00-00 00:00:00', '2019-10-23 18:41:46'),
(29, 1, 'Pessimistic', 1, '0000-00-00 00:00:00', '2019-10-23 18:41:02'),
(29, 2, 'Pessimistisch', 1, '0000-00-00 00:00:00', '2019-10-23 18:41:10'),
(30, 1, 'Netflix & TV', 1, '0000-00-00 00:00:00', '2019-04-30 17:56:30'),
(30, 2, 'Netflix & TV', 1, '0000-00-00 00:00:00', '2019-04-30 17:56:39'),
(31, 1, 'Bar hopping with friends', 1, '0000-00-00 00:00:00', '2019-04-30 17:56:47'),
(31, 2, 'Barhopping mit Freunden', 1, '0000-00-00 00:00:00', '2019-04-30 17:56:55'),
(32, 1, 'Club or other Party locations', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:05'),
(32, 2, 'Club- oder andere Partyorte', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:13'),
(33, 1, 'Short trip', 1, '0000-00-00 00:00:00', '2019-10-23 18:42:27'),
(33, 2, 'Kurzausflug', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:31'),
(34, 1, 'Wellness', 1, '0000-00-00 00:00:00', '2019-10-23 18:42:43'),
(34, 2, 'Wellness', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:48'),
(35, 1, 'Go out for dinner', 1, '0000-00-00 00:00:00', '2019-10-23 18:42:56'),
(35, 2, 'Essen gehen', 1, '0000-00-00 00:00:00', '2019-04-30 17:58:06'),
(36, 1, 'Sports', 1, '0000-00-00 00:00:00', '2019-09-24 15:29:51'),
(36, 2, 'Sport', 1, '0000-00-00 00:00:00', '2019-09-24 15:29:59'),
(37, 1, 'With my family', 1, '0000-00-00 00:00:00', '2019-10-23 18:43:14'),
(37, 2, 'Mit meiner Familie', 1, '0000-00-00 00:00:00', '2019-10-23 18:43:24'),
(38, 1, 'I like to cook at home', 1, '0000-00-00 00:00:00', '2019-04-30 18:19:53'),
(38, 2, 'Ich koche gerne zu Hause', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:11'),
(39, 1, 'I like to get cooks', 1, '0000-00-00 00:00:00', '2019-06-03 19:56:26'),
(39, 2, 'Ich mag es, Köche zu bekommen', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:25'),
(40, 1, 'ready meals at home', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:46'),
(40, 2, 'Fertiggerichte zu Hause', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:54'),
(41, 1, 'delivery service', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:03'),
(41, 2, 'Lieferservice', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:13'),
(42, 1, 'Fast food', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:22'),
(42, 2, 'Fast Food', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:31'),
(43, 1, 'restaurans', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:57'),
(43, 2, 'Restaurants', 1, '0000-00-00 00:00:00', '2019-04-30 18:22:03'),
(44, 1, 'German', 1, '0000-00-00 00:00:00', '2019-04-30 18:36:13'),
(44, 2, 'German', 1, '0000-00-00 00:00:00', '2019-04-30 18:36:15'),
(45, 1, 'Italian', 1, '0000-00-00 00:00:00', '2019-04-30 18:36:06'),
(45, 2, 'Italian', 1, '0000-00-00 00:00:00', '2019-04-30 18:36:04'),
(46, 1, 'Asian', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:57'),
(46, 2, 'Asian', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:54'),
(47, 1, 'African', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:48'),
(47, 2, 'African', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:46'),
(48, 1, 'american', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:41'),
(48, 2, 'american', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:39'),
(49, 1, 'greek', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:31'),
(49, 2, 'greek', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:28'),
(50, 1, 'oriental', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:19'),
(50, 2, 'oriental', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:23'),
(51, 1, 'international', 1, '0000-00-00 00:00:00', '2019-04-30 18:34:56'),
(51, 2, 'International', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:09'),
(52, 1, 'The early bird', 1, '0000-00-00 00:00:00', '2019-06-03 19:57:57'),
(52, 2, 'Der Wecker klingelt um 6 Uhr, damit ich den Tag optimal nutzen kann', 1, '0000-00-00 00:00:00', '2019-04-30 18:39:28'),
(53, 1, 'The easy way', 1, '0000-00-00 00:00:00', '2019-06-03 19:58:05'),
(53, 2, 'Ich stehe auf, wenn ich aufwache', 1, '0000-00-00 00:00:00', '2019-04-30 18:39:47'),
(54, 1, 'The long sleeper', 1, '0000-00-00 00:00:00', '2019-06-03 19:58:10'),
(54, 2, 'Keine Möglichkeit, mich vor 12 Uhr aus dem Bett zu bekommen', 1, '0000-00-00 00:00:00', '2019-04-30 18:40:05'),
(55, 1, 'dog', 1, '0000-00-00 00:00:00', '2019-04-30 18:42:32'),
(55, 2, 'Hund', 1, '0000-00-00 00:00:00', '2019-04-30 18:42:41'),
(56, 1, 'cat', 1, '0000-00-00 00:00:00', '2019-04-30 18:42:47'),
(56, 2, 'Katze', 1, '0000-00-00 00:00:00', '2019-04-30 18:42:55'),
(57, 1, 'I don\'t like animals at all', 1, '0000-00-00 00:00:00', '2019-04-30 18:43:25'),
(57, 2, 'Ich mag keine Tiere', 1, '0000-00-00 00:00:00', '2019-04-30 18:43:15'),
(58, 1, 'no degree', 1, '0000-00-00 00:00:00', '2019-05-20 13:20:55'),
(58, 2, 'kein Abschluss', 1, '0000-00-00 00:00:00', '2019-05-20 13:21:40'),
(59, 1, 'certificate of secondary Education', 1, '0000-00-00 00:00:00', '2019-05-20 13:20:55'),
(59, 2, 'Abschluss des Sekundarbereichs', 1, '0000-00-00 00:00:00', '2019-05-20 13:21:40'),
(60, 1, 'General certificate of secondary Education', 1, '0000-00-00 00:00:00', '2019-05-20 13:20:55'),
(60, 2, 'Allgemeiner Sekundarschulabschluss', 1, '0000-00-00 00:00:00', '2019-05-20 13:21:40'),
(61, 1, 'Highschool / university-entrance-diploma', 1, '0000-00-00 00:00:00', '2019-05-20 13:20:55'),
(61, 2, 'Abitur / Hochschuldiplom', 1, '0000-00-00 00:00:00', '2019-05-20 13:21:40'),
(62, 1, 'professional education', 1, '0000-00-00 00:00:00', '2019-05-20 13:20:55'),
(62, 2, 'berufliche Bildung', 1, '0000-00-00 00:00:00', '2019-05-20 13:21:40'),
(63, 1, 'Bachelor / Masterdegree', 1, '0000-00-00 00:00:00', '2019-05-20 13:20:55'),
(63, 2, 'Bachelor / Master-Abschluss', 1, '0000-00-00 00:00:00', '2019-05-20 13:21:40'),
(64, 1, 'Doctor / Diploma', 1, '0000-00-00 00:00:00', '2019-05-20 13:20:55'),
(64, 2, 'Doktor / Diplom', 1, '0000-00-00 00:00:00', '2019-05-20 13:21:40'),
(65, 1, 'Sports and nature', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:01'),
(65, 2, 'Sports and nature', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:04'),
(66, 1, 'Relaxing on the couch', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:12'),
(66, 2, 'Relaxing on the couch', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:16'),
(67, 1, 'Meeting with friends', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:22'),
(67, 2, 'Meeting with friends', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:24'),
(68, 1, 'Shopping', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:31'),
(68, 2, 'Shopping', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:34'),
(69, 1, 'Reading books', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:41'),
(69, 2, 'Reading books', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:45'),
(70, 1, 'Creative things (art & music)', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:53'),
(70, 2, 'Creative things (art & music)', 1, '0000-00-00 00:00:00', '2019-06-04 16:49:56'),
(71, 1, 'Spirituality & Self care', 1, '0000-00-00 00:00:00', '2019-10-30 06:36:12'),
(71, 2, 'Spiritualität & Selbstpflege', 1, '0000-00-00 00:00:00', '2019-10-30 06:36:29'),
(72, 1, 'PC & Video Games', 1, '0000-00-00 00:00:00', '2019-06-04 16:50:15'),
(72, 2, 'PC & Video Games', 1, '0000-00-00 00:00:00', '2019-06-04 16:50:18'),
(73, 1, 'Business', 1, '0000-00-00 00:00:00', '2019-10-30 06:36:56'),
(73, 2, 'Geschäft', 1, '0000-00-00 00:00:00', '2019-10-30 06:37:08'),
(74, 1, 'just at the ocean', 1, '0000-00-00 00:00:00', '2019-04-30 19:02:47'),
(74, 2, 'just at the ocean', 1, '0000-00-00 00:00:00', '2019-04-30 19:02:49'),
(75, 1, 'to the mountains for hiking or skiing', 1, '0000-00-00 00:00:00', '2019-04-30 19:02:56'),
(75, 2, 'to the mountains for hiking or skiing', 1, '0000-00-00 00:00:00', '2019-04-30 19:02:58'),
(76, 1, 'Sightseeing Tour and Museums', 1, '0000-00-00 00:00:00', '2019-05-24 18:48:19'),
(76, 2, 'Besichtigungstour und Museen', 1, '0000-00-00 00:00:00', '2019-05-24 18:48:31'),
(77, 1, 'Adventure holdiays', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:28'),
(77, 2, 'Adventure holdiays', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:30'),
(78, 1, 'I don’t need to go on vacation, I like to stay at home', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:36'),
(78, 2, 'I don’t need to go on vacation, I like to stay at home', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:39'),
(79, 1, 'Attractive appearance', 1, '0000-00-00 00:00:00', '2019-09-24 15:31:52'),
(79, 2, 'Attraktives Aussehen', 1, '0000-00-00 00:00:00', '2019-09-24 15:32:00'),
(80, 1, 'Common interests', 1, '0000-00-00 00:00:00', '2019-10-23 18:46:06'),
(80, 2, 'gemeinsame Interessen', 1, '0000-00-00 00:00:00', '2019-09-24 15:35:18'),
(81, 1, 'Intelligence', 1, '0000-00-00 00:00:00', '2019-10-23 18:45:57'),
(81, 2, 'Intelligenz', 1, '0000-00-00 00:00:00', '2019-09-24 15:35:34'),
(82, 1, 'Status and Money', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:16'),
(82, 2, 'Status und Geld', 1, '0000-00-00 00:00:00', '2019-09-24 15:35:45'),
(83, 1, 'Empathy', 1, '0000-00-00 00:00:00', '2019-05-24 18:49:30'),
(83, 2, 'Empathie', 1, '0000-00-00 00:00:00', '2019-05-24 18:49:39'),
(84, 1, 'Loyalty', 1, '0000-00-00 00:00:00', '2019-04-30 19:09:51'),
(84, 2, 'Loyalität', 1, '0000-00-00 00:00:00', '2019-09-24 15:36:01'),
(85, 1, 'Honesty', 1, '0000-00-00 00:00:00', '2019-10-23 18:46:27'),
(85, 2, 'Ehrlichkeit', 1, '0000-00-00 00:00:00', '2019-09-24 15:33:10'),
(86, 1, 'As often as possible', 1, '0000-00-00 00:00:00', '2019-09-24 15:32:43'),
(86, 2, 'So oft wie möglich', 1, '0000-00-00 00:00:00', '2019-09-24 15:32:53'),
(87, 1, 'Sometime a week', 1, '0000-00-00 00:00:00', '2019-09-24 15:34:05'),
(87, 2, 'Irgendwann in der Woche', 1, '0000-00-00 00:00:00', '2019-09-24 15:34:10'),
(88, 1, 'In the right circumstances', 1, '0000-00-00 00:00:00', '2019-09-24 15:34:22'),
(88, 2, 'Unter den richtigen Umständen', 1, '0000-00-00 00:00:00', '2019-09-24 15:34:33'),
(89, 1, 'I don\'t care', 1, '0000-00-00 00:00:00', '2019-09-24 15:34:46'),
(89, 2, 'Ist mir egal', 1, '0000-00-00 00:00:00', '2019-09-24 15:34:53'),
(90, 1, 'Yes, when the time has come', 1, '0000-00-00 00:00:00', '2019-06-04 16:57:17'),
(90, 2, 'Yes, when the time has come', 1, '0000-00-00 00:00:00', '2019-06-04 16:57:27'),
(91, 1, 'no', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:14'),
(91, 2, 'no', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:16'),
(92, 1, 'What goes comes around', 1, '0000-00-00 00:00:00', '2019-06-04 16:57:37'),
(92, 2, 'What goes comes around', 1, '0000-00-00 00:00:00', '2019-06-04 16:57:39'),
(93, 1, 'Yes with the right partner', 1, '0000-00-00 00:00:00', '2019-06-04 16:57:52'),
(93, 2, 'Yes with the right partner', 1, '0000-00-00 00:00:00', '2019-06-04 16:57:55'),
(94, 1, 'no', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:14'),
(94, 2, 'no', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:16'),
(95, 1, 'Let\'s see', 1, '0000-00-00 00:00:00', '2019-06-04 16:58:01'),
(95, 2, 'Let\'s see', 1, '0000-00-00 00:00:00', '2019-06-04 16:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `report_chat`
--

CREATE TABLE `report_chat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reported_user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `report_status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE `static_pages` (
  `id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_heading` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `static_pages`
--

INSERT INTO `static_pages` (`id`, `page_name`, `page_heading`, `content`, `created_at`, `updated_at`) VALUES
(1, 'community_guidelines', 'Community Guidelines', '\n<p align=\"center\"><span style=\"color: #000000;\">Welcome to the LovePush Community! </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">In case you\'re straightforward, kind and aware to other people, you\'ll generally be welcome here. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">On the off chance that you decide not to be, you may not last. We will probably enable clients to convey what needs be uninhibitedly as long as it doesn\'t affront others. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Everybody is held to a similar standard on LovePush. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">We\'re requesting that you be chivalrous, think before you act, and comply with our locale rules both on and disconnected. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">You heard that right: your disconnected conduct can prompt end of your LovePush Account. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">The following is a rundown of our locale arrangements. In the event that you abuse any of these strategies, you may be restricted from LovePush. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Truly, don\'t make us Swipe Left on you&mdash;in light of the fact that there will be no second chances once we do. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">We energize you to&nbsp;report&nbsp;any conduct that damages our approaches. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Love Push isn\'t for: </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Nudity/Sexual Content</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">We\'re not requesting that you brush your hair to the other side or even talk in full sentences; however please keep it tasteful and suitable for open utilization. No nakedness, no explicitly unequivocal substance, and don\'t narrative the majority of your sexual wants in your profile. Keep it clean. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Harassment</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Try not to draw in, or urge others to connect with, in any focused on maltreatment or badgering against some other client. This incorporates sending any spontaneous sexual substance to your matches. Reports of stalking, dangers, tormenting, or terrorizing, are paid attention to very. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Violence and Physical Harm</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">We don\'t endure vicious, realistic, or violent substance on Love Push, or any activities or substance that supporter for or undermine brutality of any kind, including compromising or advancing fear based oppression. Physical strike, intimidation, and any demonstrations of brutality are carefully denied. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Content that supporters for or extols suicide or self-hurt is additionally not permitted. In these circumstances, we may find a way to help the client, incorporating connecting with emergency assets. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Hate Speech</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Any substance that advances, advocates for, or overlooks prejudice, dogmatism, scorn, or brutality against people or gatherings dependent on variables like (yet not restricted to) race, ethnicity, strict alliance, handicap, sex, age, national inception, sexual direction, or sex character isn\'t permitted. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Private Information</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Don\'t openly communicate any private data, yours or anybody else\'s. This incorporates standardized savings numbers, travel papers, passwords, money related data or unlisted contact data, for example, telephone numbers, email addresses, home/place of business. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Spam</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Try not to be phony. Be genuine. Try not to utilize Love Push to drive individuals to outside sites by means of a connection or something else. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Promotion or Solicitation</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Requesting different clients is precluded on Love Push. It\'s fine to welcome your matches to something that you\'re doing, yet on the off chance that the motivation behind your profile is to publicize your occasion or business, non-benefit, political crusade, challenge, or to lead explore, we may erase your record. While we\'re energized that you\'re doing a parody appear one week from now, kindly don\'t utilize Love Push to advance it. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Prostitution and Trafficking</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Advancing or pushing for business sexual administrations, human dealing or other non-consensual sexual acts is carefully disallowed and will bring about your record being prohibited from Love Push. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Scamming</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Love Push has a zero-resistance arrangement on savage conduct of any sort. Anybody endeavoring to get other clients\' private data for false or criminal behavior might be restricted. Any client found sharing their very own budgetary record data (PayPal, Venmo, and so forth.) to get cash from different clients may likewise be prohibited from Love Push. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Impersonation</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Act naturally! Try not to claim to be another person. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Try not to mimic, or generally distort alliance, association or relationship with, any individual or element. This incorporates farce accounts. While we think your Mike Pence profile is diverting, you aren\'t Mike Pence. What\'s more, on the off chance that you are, what are you doing on Love Push? </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Minors</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">You should be 18 years old or more established to utilize Love Push. In that capacity, we don\'t permit pictures of unaccompanied minors. On the off chance that you need to post photographs of your youngsters, if it\'s not too much trouble ensure that you are in the photograph also. On the off chance that you see a profile that incorporates an unaccompanied minor, urges damage to a minor, or delineates a minor in a sexual or intriguing manner, if it\'s not too much trouble report it right away. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Copyright and Trademark Infringement</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">On the off chance that it\'s not yours, don\'t post it. On the off chance that your Love Push profile incorporates any work that is copyrighted or trademarked by others, don\'t show it, except if you are permitted to do as such. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Illegal Usage</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Try not to utilize Love Push to do anything illicit. In the event that it\'s illicit IRL, it\'s unlawful on Love Push. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>One Person, One Account</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Love Push records can\'t have different proprietors, so don\'t make a record with your companion or noteworthy other. Furthermore, kindly don\'t keep up different Love Push accounts. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Third Party Apps</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">The utilization of any applications made by anybody other than Love Push that guarantee to offer our administration or open extraordinary Love Push highlights (like auto-swipers) isn\'t permitted. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\">Account Dormancy</span></span></strong></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Love Push is enjoyable to utilize... constantly! Use Love Push at the lake, use Love Push while eating cake. Use Love Push when you\'re out, use Love Push if all else fails! In any case, on the off chance that you don\'t sign in to your Love Push account in 2 years, we may erase your record for inertia.</span></p>', '2019-09-04 14:50:10', '2019-09-04 14:50:10');
INSERT INTO `static_pages` (`id`, `page_name`, `page_heading`, `content`, `created_at`, `updated_at`) VALUES
(2, 'legacy', 'Legacy', '<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>SIGNING UP TERMS AND CONDITIONS</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Love-Push is a social media app provided as a platform for meeting and connecting with new people, a forum to have discussions and to share images, live streaming, and other information. We designed it to be a fun place to access and visit, and it is paramount to us to make the Love-Push community continually safe and friendly atmosphere, therefore you agree that you will only use Love-Push in ways that are constantly with the purpose which Love-Push was found and in accordance with these governing terms and conditions, as well as the Love-Push Privacy policy and other subordinate terms. For the purpose of these terms, Love-Push, mean the App and all the affiliated applications or websites (Read Privacy Policy).</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">These Terms shall be interpreted as a legal agreement between you as user \n(\"you\") and the Love-Push Company (\"us\" or \"we\"). </span></p>\n<p align=\"left\"><span style=\"color: #000000;\">These Terms shall apply whenever you access and visit Love-Push, whether or not you have chosen to sign up with us, therefore please read and understand the terms carefully. By visiting, accessing, using, signing up or receiving services offered through Love-Push, you are accepting and consenting to be bound by these Terms. </span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">IF YOU DISAGREE WITH ANY OR ALL THE TERMS OF THIS APP THEN YOU \nMUST NOT ACCESS OR/AND USE THE APP. </span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>APP USE AND CONTENT POSTING</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Age Limitations:</strong> For an individual to qualify to access and use Love-Push, the \nindividual must be at least 18/21(in some states) years of age. If an individual is above 18/21(in some states) years of age, but below 18/21(in some states) years, it will be required that such individual seek the consent of your parent or legal guardian’s permission to access and use Love-Push and to agree to the Terms and Conditions.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Personal Use:</strong> By agreeing to these Terms and Conditions, you consent not to \nuse Love-Push for private business purposes; you can only use the Services for non-commercial, own purposes. </span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Your Conduct:</strong> Don\'t abuse Love-Push. You are permitted to use the Services \nprovided as permitted by the applicable law, including export and re-export control regulations and laws. You are solely liable for your conduct and your content (and information) stored in Love-Push servers, and you must conform to our policy. </span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Your Content:</strong>  You retain the ownership of any property rights that you possess \nthrough any content posted via this service. In actual words, what is yours remains yours. </span></p>\n\n\n<p align=\"left\"><span style=\"color: #000000;\">When you submit, upload, store, send and receive content to or via Love-Push, \nyou give us a worldwide license to host, use, modify reproduce, store, create derivative works (which includes those resulting from adaptations, translations or other changes we make in relation with your content so that they fit perfectly with our Services), publish, communicate, distribute and publicly display or perform such content. </span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">The license you grant to us is for a limited purpose which is intended for smooth \nrunning, operating, promoting and enhancing our Services and to develop new programs and services. </span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Love-Push Services:</strong>  Using Love-Push does not grant you the right of ownership \nto any intellectual property rights in Love-Push or that of the content you access. You may not use the content you acquired from us unless you obtain the prior written permission from the original owner of the content or you are otherwise permitted to do so by the law. These Terms and Conditions do not allow you or grant you the right to use any logos, branding or any other identity used in Love-Push. You are also not allowed to alter, obscure or remove any legal notices displayed in or in connection with Love-Push. </span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Prohibited Use</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">You are not permitted to use or access the App for any unlawful or unsanctioned purpose apart from the purpose approved and made available by Love-Push. The App is strictly for the user\'s personal use and may not be used in connection with any commercial activities apart from those are sanctioned or approved by Love-Push.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">In case of any prohibited activities involving a user, Love-Push reserves the exclusive right to suspend, terminate, block or deactivate the user\'s profile and prohibit the user for further access and use of the service. All Ads and profiles \nthat violate this section will be deleted by the Support, and the Love Points will NOT be refunded.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Prohibited activities during live streams and love and connection including but not limited to the following: criminal activity, including child pornography (or molestation), sales or advertisement, racism, insults, swear words, sexism, \nrequests for illegal actions, financial crime, trafficking in obscene material, illegal business, gambling, harassment, stalking, spamming, copyright breach, patent violation, or theft of trade ideas; advertising to, or solicitation of, any user to buy or sell any products or services, unless authorized by Love-Push.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">You consent that the outcome of commercial use of the content or materials found on Love-Push may lead to huge financial compensation that is deemed satisfactory as a remedy and that Love-Push will be entitled to temporary or permanent injunctive relief to prohibit and caution such use.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>USER\'S CONDUCT</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">You consent that under no circumstances shall you post, upload, transmit or host \nany content or ad that:</span></p>\n<ul style=\"padding-left: 30px;\">\n<li align=\"left\"><span style=\"color: #000000;\">is illegal or support illegal activities;</li>\n<li align=\"left\"><span style=\"color: #000000;\">is or contains sexually explicit material;</li>\n<li align=\"left\"><span style=\"color: #000000;\">is defamatory, libelous, religious, racism, fraudulent or personally offencive;</li>\n<li align=\"left\"><span style=\"color: #000000;\">impersonates or imitate a person, brand or company with the intent to confuse, deceive or scam others;</li>\n<li align=\"left\"><span style=\"color: #000000;\">contains any viruses, corrupt files, spyware, worm programmes or other harmful or malicious code intended to damage, interrupt or limit the functionality or effectiveness of or disrupt any hardware, software, \nnetworks, servers, telecommunications, or other Love-Push equipment, Trojan horse or any other content or material constructed to damage, interfere with, wrongly expropriate or intercept any data or personal data whether from Love-Push or otherwise;</li>\n<li align=\"left\"><span style=\"color: #000000;\">is prejudiced or intolerant toward any individual or group;</li>\n<li align=\"left\"><span style=\"color: #000000;\">contains any active or current malware or viruses, or uses the platform for exploits and exploit delivery (such as part of a command and control system); or</li>\n<li align=\"left\"><span style=\"color: #000000;\">Using of abusive language is strictly prohibited.</li>\n</ul>\n\n<p align=\"left\"><span style=\"color: #000000;\">violates any intellectual proprietary right of any party, including trademark, copyright, patent, trade secret, publicity rights, or other rights.	You Account will be suspended if you violates any policy,</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong style=\"font-style:italic;\">All such content or ad posted will be deleted and spent LovePoints used in posting won\'t be refunded</strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Intellectual Property Right</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">The content of the App including trademarks, logos, and service marks contained therein (collectively called \"Marks\") are possessed by or licensed to Love-Push, and are subject to copyright and other intellectual property rights in the United \nArab Emirates and applicable international conventions. All source codes, functionality, databases, software, website design, text, video, audio, images, graphics and photographs (collectively called \"Love-Push Content\") are providedto the user on \"AS IS\" basis which is meant for the personal use of the user only. Love-Push Content may not be copied, used, published, reproduced, shared, transmitted, broadcasted, displayed, sold, licensed, or otherwise exploited for any other purposes whatsoever without the prior written consent of Love-Push. Systematic retrieval of information or other details from the App to compile or create, whether directly or indirectly, a compilation, database, collection, or directory without prior written prior permission of Love-Push is hereby prohibited.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>External Links</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">To further serve you better, the App may provide some links that direct to external websites which may or may not be affiliated with Love-Push. Love-Pushis not liable or accountable for the content of any website established and control by any other entity apart from Love-Push. These external websites or apps may collect your personal information and additional information pertaining to your \nonline involvement through the use of web beacons, cookies and other similar technologies in a bid to understand your interests and to deliver to \nadvertisements in accordance with your interests. Please be notified that we do not own the websites, and as such, we do not have access to or exercise any control over the information collected by these external websites or services. The information practices of these external websites are not included in this Privacy Policy.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>LIMITATION OF LIABILITY</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">YOU UNDERSTAND THAT, LOVE-PUSH, ITS, DIRECTORS, AFFILIATES, EMPLOYEES, MEMBERS, OR AGENTS WILL NOT, UNDER ANY SITUATION, BE LIABLE OR RESPONSIBLE FOR INDIRECT DAMAGE, BE IT UNUSUAL, OR CONSEQUENTIAL, WHETHER IN CONTRACT OR AN ACTION INCLUDING \nBUT NOT LIMITED TO LOSS OF DATA, LOSS OF USE AND/OR LOSS OF PROFITS; WHETHER INCLUDING BUT NOT LIMITED TO NEGLIGENCE OR, ARISING FROM USAGE OR LACK OF ABILITY TO USE OUR SERVICES AND PROPRIETARY MATERIALS ACCESSED THROUGH OUR SERVICE.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">YOU CANNOT HOLD US RESPONSIBLE OR LIABLE FOR ANY DAMAGE THAT RESULTS FROM OR IS CAUSED BY RELIANCE ON ANY INFORMATION THAT USERS OBTAIN FROM LOVE-PUSH, OR THAT RESULTS FROM MISTAKES, OMISSIONS, INTERRUPTIONS, DELAYS IN TRANSMISSION OR OPERATION \nOR ANY PERFORMANCE FAILURE, DELETION OF FILES, EMAIL DEFECTS, ERRORS, VIRUSES, WHETHER OR NOT IT RESULTS FROM ACTS OF GOD, \nTHEFT, COMMUNICATIONS FAILURE, DESTRUCTION OR ACCESS BY UNAUTHORIZED ENTITIES, TO DATA, PROGRAMS OR SERVICES, MATERIALS AND CONTENT ON LOVE-PUSH \'S APP.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">LOVE-PUSH\'S CUMULATIVE LIABILITY, IN ANY FORM OF ACTION WHATSOEVER, IN CONNECTION WITH THE USE OF OUR SERVICES OR THIS AGREEMENT WILL NOT EXCEED THE CUMULATIVE AMOUNT OF FEES FOR PAID SERVICES THAT YOU PAID NOT LATER THAN SIX MONTHS - THIS IS \nAPPLICABLE UNDER ANY CIRCUMSTANCE AS IT RELATES WITH THE USAGE OF OUR SERVICES.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">TO THE FULL EXTENT PERMISSIBLE BY RELEVANT JURIDICAL LAWS, AND UNDER NO CIRCUMSTANCE SHALL THE COMPANY BE LIABLE FOR ANY DAMAGES WHATSOEVER, WHETHER COMPENSATORY, GENERAL, SPECIAL, INDIRECT, DIRECT, INCIDENTAL AND/OR CONSEQUENTIAL, THAT RELATES \nTO YOUR USE OF THE SERVICES OR THAT OF THE USERS ON THE PLATFORM, THIS IS INCLUDING BUT WITHOUT LIMITATION TO EMOTIONAL DISTRESS, BODILY INJURY, IDENTITY THEFT AND/OR ANY OTHER DAMAGES THAT MAY POSSIBLY RESULT FROM INTERACTIONS AND COMMUNICATIONS WITH OTHER USERS ON OUR APP AND FROM THE \nCONDUCT OF USERS WHO MAY HAVE REGISTERED UNDER FALSE PRETENSES, INCLUDING THOSE WHO MAY ATTEMPT TO DEFRAUD OR HARM YOU.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">IF YOUR COUNTRY AND JURISDICTION DOES NOT ALLOW THE EXCLUSION OF LIABILITY IN CONTRACTS OR LIMITATION WITH CONSUMERS, THE CONTENTS OF THIS SECTION MAY NOT APPLY TO YOU.</span></p>\n\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>DISCLAIMER AND WARRANTY</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">THE INFORMATION, CONTENT, AND SERVICES AVAILABLE THROUGH THE APP (WHETHER PROVIDED BY LOVE-PUSH, YOU, OTHER USERS OR OTHER THIRD PARTIES/AFFILIATES), INCLUDING WITHOUT LIMITATION, SERVICE REQUESTS SUBMISSIONS, TEXT, PHOTOS, GRAPHICS, AUDIO FILES, VIDEO, AND LINKS, ARE PROVIDED \"AS IS\" AND \"AS AVAILABLE\" WITHOUT ANY WARRANTIES WHATSOEVER, EITHER EXPRESS OR IMPLIED. TO THE FULLEST \nEXTENT PERMITTED BY LAW, LOVE-PUSH DISCLAIMS ALL WARRANTIES AND REPRESENTATIONS, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED \nTO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A SPECIFIC PURPOSE, TITLE, NONINFRINGEMENT, FREEDOM FROM COMPUTER VIRUS, AND IMPLIED WARRANTIES ARISING DURING THE COURSE OF DEALING OR COURSE OF PERFORMANCE.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>INDEMNIFICATION</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">You consent to indemnify and hold Love-Push, its affiliates, and subsidiaries, directors, officers, employees, agents or contractors harmless from any claim, damage or demand (direct, indirect or consequential), including reasonable attorney\'s fees, made by anyone in relation to your use of the Site, your submissions, with any purported violation of intellectual property or any other \nrights of any person or body pertaining to the Site, your breach of these Terms and Conditions, and any acts or omissions related to the Site</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>GOVERNING LAW</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">These Terms and Conditions shall be construed governed and administered by and interpreted in compliance with the laws of Malta. Any dispute arising in relation to these Terms and Conditions shall be subject to the exclusive jurisdiction of the courts situated in Victoria.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Any dispute or purported claim arising as a result of this App shall be considered\nunder the laws of Malta. Love-Push is domiciled in Malta.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>YOUR USERNAME AND PASSWORD</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Do not share your log-in details with any third - party. You are the only person authorized to access and/or use your account with Love-Push. It is your duty to protect your password by not sharing your password with anyone or let any third - party access your account as this endangers the security of all of the personal data and content that you have submitted or uploaded to Love-Push. \nIt\'s your sole responsibility to keep your password secure and secret. If you don\'t, Love-Push is not responsible for any illicit access to or use of your account. If you are suspicious that a third - party has gained access to your account, you must contact us immediately through <a href=\"mailto:support@love-push.com\" style=\"text-decoration:underline;\">support@love-push.com</a> to let us know about your concerns or suspicions. You must also change your password as soon as possible. Love-Push has the right to terminate your account or Ad if you violate our terms on keeping your password and log in details secure</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Users shall be entitled to only one account per each user. We reserve the right \nto terminate duplicate accounts. Furthermore, Love Push will not be responsible for any content posted through any user account nor responsible for fake acounts.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>CONTACT INFORMATION</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Email: <a href=\"mailto:support@love-push.com\" style=\"text-decoration:underline;\">support@love-push.com</a></span></p>\n\n\n<br><br>\n\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>PRIVACY POLICY</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Thanks for accessing and using Love-Push! Our purpose is to establish a more \nenlightened way of working with our Users to achieve a better platform whereby Users can enjoy the benefits of Love-Push.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">In this Privacy Policy, we define how we collect, use and handle your \ninformation when you submit them to us via our Services.</span></p>\n\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>INFORMATION COLLECTED AND HOW WE USE SUCH INFORMATION</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">We obtain and use the under listed information to provide, enhance and protect \nour Services:</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Your Personal Information:</strong> Love-Push is a connecting platform for adults, and \nwe provide these services by operating a social network App that allows users the opportunity to connect globally. By joining Love-Push, you enter a legal agreement with us to collect and process your data in order to offer you our service under the terms of this agreement.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">To join the Love-Push network, you will have to complete our online registration \nform, where we may ask you to provide us with information about you such as your name, gender, your date of birth, your email address, your location details,and others as needed. You can also optionally provide other details about yourself. Since you control your user account, these details are at your reach at any time by accessing your \"Ad\" page, which allows you to update or correct your data at any time by just logging in to Love-Push.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">If you decide to pay for any of our paid services, we will process your payment \ninformation and keep it safe. Under applicable data protection law, it is important for us to collect and use payment data for processing and to assist us in rendering our service to you and our ongoing retention of the data is vindicated by our legitimate interests set out above.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Your Content:</strong> Our Services are designed in such a way that it will be simple for \nyou to upload and store your files, photos, messages, comments, etc. (\"Your Content\"), team up with others, and work across different devices. For this to be realistic, we store, process and transmit Your Content as well as every information that pertains to it. This pertaining information includes the information you have on your profile that makes it easier team up with others and share Your Content, as well as other details such as file size, the time it was uploaded and usage activity.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Usage Information:</strong> We collect information in connection with your use of the \nService, including your activities or actions you take in your account (such as streaming, viewing, editing, and moving folders or files). This information is used to strengthen and improve our Services, create new features and service, and to protect Love-Push Users. Please contact us for more information about how we use this information to enhance our Services.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Device information.</strong> We also collect information from and about the devices you \nuse to access and use the Services of Love-Push. This includes details such as IP address, the type of device and browser you use, the web page(s) you visited before coming to our sites, and the unique device identifier. Your tools(depending on their settings) may also transmit your location information to the Services.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Cookies and other technologies.</strong> We use technologies like cookies, web beacons, \netc. to provide, enhance, support, protect, and promote our Services. When you visit the section made available on the App, a session ID cookie is \nplaced on your browsing device that will only last through your visiting moment. Love-Push will also place persistent cookies (also referred to as local storage devices) on user’s computers so that Love-Push remembers users and enhance your login experience and make it faster and easier. We may also place persistent tracking cookies on your browsing device, solely for protection and security purposes, so as to prevent scammers, unauthorized login attempts, phishers, and also to help you gain access into your hacked account. However, we do not use any of this information while you logged-off the App</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">You can still also set your browser not to accept cookies, but this may limit your \nability to use the Services to the fullest. Following Cookies are Used by Us.</span></p>\n\n<ul style=\"padding-left: 30px;\">\n<li align=\"left\"><span style=\"color: #000000;\">XSRF-TOKEN</li>\n<li align=\"left\"><span style=\"color: #000000;\">love_push_session</li>\n\n</ul>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Bases for processing your information:</strong> We collect and use the personal \ninformation and all other information you submit to us as described above toprovide you the Services most securely and reliably. We also use your details for or legitimate business needs. If we process your details for any other reason not stated herein, we will seek your approval before the time; we will also mandate our service providers to do likewise. For more information about the bases for processing your details, please contact us.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>INFORMATION SHARING</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Since we will not sell, rent or give your information to advertisers or other third \nparties, we may decide to share your information as described below:</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Our relevant service providers:</strong> Love-Push makes use of some trusted service \nproviders (for instance, for the transaction, customer support and IT management) to assist us in providing, enhancing, protecting and promoting our \nServices. These service providers will have access to your information for the singular purpose of performing their duties to Love-Push in agreement with this Privacy Policy. We will remain liable for the service provider’s handling and management of any of the information they access through our service. For the list of the service providers which we use to process your personal information, please contact us.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Other users:</strong> Our Services display your information such as your name, profile \npicture and email address to other users. You can also share Your Content with other users if you so desire. When you register or subscribe on Love-Push account with an email address on a domain owned by your company, we may assist collaborators to find you by disclosing some of your necessary information (your name, email address and profile picture) to others.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Law, Order and the general interest of the public:</strong> We may disclose or share your \ninformation with a third party if we find out that such disclosure or sharing is \nessential and necessary to:</span></p>\n\n<ul style=\"padding-left: 20px;\">\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">i. to conform with any applicable rule, regulation or law;</li>\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">ii. prevent death or serious personal injury;</li>\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">iii. prevent illegal or unsanctioned transactions of Love-Push or our Users;</li>\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">iv. secure Love-Push’s intellectual property rights, interest or safety; or</li>\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">v. carry out a task in the benefit of the general public.</li>\n\n</ul>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>HOW WE SHARE YOUR INFORMATION</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Security:</strong> We have a team committed to securing your information and checking \nfor weakness in the Services and Site. We also continue to enhance our features to keep your data safe such as encryption of files at rest, and alerts when new devices and apps are linked or connected to your account. We employ the use of the latest automated technologies to detect any misuse of the Services and content that may harm our Services, you, or other users.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>User Controls:</strong>  You can access, view, modify, download, or delete your personal \ninformation by logging into your Love-Push account and going to your account setting page. You can also restrict the way we collect and use your information on the user control page. To learn more about managing your account\'s information generally, please contact us.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Information Retention:</strong>  When you create an account, or you subscribe to our \nServices, we will retain your information for as long as your account is active or for as long as we have to provide the Service to you.</span></p>\n<p align=\"left\"><span style=\"color: #000000;\">If you decide to disable your account, please be informed that there might be \nsome cautions in deleting your information from all our servers and backup database. Be advised that we may retain your information for as long as \nnecessary in compliance with all legal obligations, enforce our agreements or resolve disputes.</span></p>\n\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>DATA PROTECTION</strong></span></span></strong></span></p>\n\n\n<p align=\"left\"><span style=\"color: #000000;\">No data on the internet can be guaranteed as secure or safe. We strive to \nsafeguard information but are unable to ensure and cannot warrant the security of any data which you share on the platform or transmit to us. You understand that any information transmitted, submitted or posted on our platform is done at your own risk. Nevertheless, we will take reasonable steps to ensure the security information on our APP.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>YOUR RIGHT TO ACCESS AND CONTROL YOUR INFORMATION</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">You have absolute control over your personal information and how it is \ncollected, used, and shared. For instance, you have a right to:</span></p>\n\n\n<ul style=\"padding-left: 30px;\">\n<li align=\"left\"><span style=\"color: #000000;\">edit or correct personal data. You can manage your account and the \ncontent contained in it, as well as edit some of your personal details.</li>\n</ul>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>CHANGES TO THIS PRIVACY POLICY</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">If there is a chance that we are involved in a merger, acquisition, reorganization, \nor sale of our assets, your information may be transferred as part of the deal. We will promptly notify you via the email associated with your account/profile of any such occurrence and outline your choices to you.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">This Privacy Policy is subject to change frequently. We will post the most recent \nversion on our Site. If the version materially reduces your rights, we will send a notification to you.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>CONTACT INFORMATION</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Email: <a style=\"text-decoration:underline;\" href=\"mailto:support@love-push.com\">support@love-push.com</a></span></p>\n\n<br><br>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>SUBSCRIPTION TERMS AND CONDITIONS</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">These Terms shall apply whenever you subscribe for any of our paid services \nthough Love-Push App, therefore please read and understand the terms carefully. By subscribing for any paid services offered through Love-Push, you are accepting and consenting to be bound by the following Terms.</span></p>\n\n<ul style=\"padding-left: 30px;\">\n<li align=\"left\"><span style=\"color: #000000;\">By subscribing for any of our paid packages, the Love-Push have the right \nto deduct any total amount due from the user through any added payment method and have the right to sue any user with an insufficient fund to pay for \nthe amount due to his/her subscribed account</li>\n<li align=\"left\"><span style=\"color: #000000;\">All purchases and contracts made through the App for any package come\nwith a two - weeks cancellation policy.</li>\n<li align=\"left\"><span style=\"color: #000000;\">Non-canceled and every subscription shall be automatically renewed for \nthe preceding month from the 7th day before the end of each month</li>\n<li align=\"left\"><span style=\"color: #000000;\">Every subscription shall be cancellable monthly until one week before the \nend of the month.</li>\n\n</ul>\n\n<p align=\"left\"><span style=\"color: #000000;\">These subscription Terms and Conditions shall be construed governed and\nadministered by and interpreted in compliance with the laws of Malta. Any \ndispute arising in relation to these Terms and Conditions shall be subject to the \nexclusive jurisdiction of the courts situated in Victoria.\n</p>\n<p align=\"left\"><span style=\"color: #000000;\">\nAny dispute or purported claim arising as a result of your subscription through \nthe App shall be considered under the laws of Malta. Love-Push is domiciled in \nMalta</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>NETWORK MARKETING/AFFILIATE TERMS AND CONDITIONS</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">These Terms shall apply whenever you sign - up for Love-Push Affiliate program, \ntherefore please read and understand the terms carefully. By signing up as Love-Push Affiliate, you are accepting and consenting to be bound by the following Terms.</span></p>\n\n<ul style=\"padding-left: 30px;\">\n<li align=\"left\"><span style=\"color: #000000;\">Every affiliate user of Love-Push must be over 18/21(in some states) years old</li>\n<li align=\"left\"><span style=\"color: #000000;\">Affiliate commissions are paid with taxes.</li>\n<li align=\"left\"><span style=\"color: #000000;\">Every affiliate shall be responsible for any taxes that may be incurred when \npaying out on his PayPal account.</li>\n\n\n</ul>\n\n<p align=\"left\"><span style=\"color: #000000;\">Every user shall be able to see the team/downline plan up to the 5 level with \nusername, also the team turnover, no matter what plan the user subscription is \neither free, gold or VIP pass.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">However, only if the user agrees to the terms and conditions of the affiliate \nprogram & has active V.I.P. Pass shall have active Partner/Affiliate status, and\nstart receives commissions as follows: (with Free Pass users missed commissions \nare shown)</span></p>\n\n\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Unilevelplan up to 5 levels 35% commission in total</strong></span></span></strong></span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Only achievable with Agreement to this Affiliate Terms and Conditions with \nProgram & active V.I.P. Pass</span></p>\n\n<ul style=\"padding-left: 20px;\">\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">1. Level: 20%</li>\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">2. Level: 5%</li>\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">3. Level: 3%</li>\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">4. Level: 2%</li>\n<li align=\"left\" style=\"list-style:none;\"><span style=\"color: #000000;list-style:none;\">5. Level: 5%</li>\n\n</ul>\n\n<p align=\"left\"><span style=\"color: #000000;\">Withdraw per Paypal once in a month and on the first day of each month \nwith a minimum of $25 balance of your back office. To request at back office\nuntil 25. each pre - month.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">These Affiliate Terms and Conditions shall be construed governed and \nadministered by and interpreted in compliance with the laws of Malta. Any \ndispute arising in relation to these Terms and Conditions shall be subject to the \nexclusive jurisdiction of the courts situated in Victoria.</span></p>\n\n<p align=\"left\"><span style=\"color: #000000;\">Any dispute or purported claim arising as a result of your subscription through \nthe App shall be considered under the laws of Malta. Love-Push is domiciled in \nMalta.</span></p>', '2019-09-04 14:50:10', '2019-09-04 14:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` int(11) NOT NULL,
  `type` enum('F','P','V') NOT NULL COMMENT 'F=free, P=premium, V=vip',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` float(11,2) NOT NULL DEFAULT '0.00',
  `no_of_chat_req` varchar(255) DEFAULT NULL COMMENT 'per day',
  `no_of_likes` varchar(255) DEFAULT NULL COMMENT 'per day',
  `no_of_view_stories` varchar(255) DEFAULT NULL COMMENT 'per day',
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `type`, `name`, `price`, `no_of_chat_req`, `no_of_likes`, `no_of_view_stories`, `status`, `created_at`, `updated_at`) VALUES
(1, 'F', 'Free', 0.00, '2', '21', '5', 1, '2019-07-29 12:25:07', '2019-08-02 06:15:59'),
(2, 'P', 'Premium', 4.90, '5', '50', '50', 1, '2019-07-29 12:25:07', '2019-08-02 06:55:02'),
(3, 'V', 'VIP', 9.90, NULL, NULL, NULL, 1, '2019-07-29 12:25:07', '2019-07-29 13:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_ques`
--

CREATE TABLE `test_ques` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `ques_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_ques`
--

INSERT INTO `test_ques` (`id`, `test_id`, `ques_id`) VALUES
(2977, 222, 1),
(2978, 222, 2),
(2979, 222, 3),
(2980, 222, 4),
(2981, 222, 5),
(2982, 222, 6),
(2983, 222, 7),
(2984, 222, 13),
(2985, 223, 1),
(2986, 223, 2),
(2987, 223, 3),
(2988, 223, 4),
(2989, 223, 5),
(2990, 223, 6),
(2991, 223, 7),
(2992, 223, 13),
(2993, 224, 1),
(2994, 224, 2),
(2995, 224, 3),
(2996, 224, 4),
(2997, 224, 5),
(2998, 224, 6),
(2999, 224, 7),
(3000, 224, 13),
(3001, 224, 15),
(3002, 224, 16);

-- --------------------------------------------------------

--
-- Table structure for table `test_ques_ans`
--

CREATE TABLE `test_ques_ans` (
  `id` int(11) NOT NULL,
  `test_que_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_ques_ans`
--

INSERT INTO `test_ques_ans` (`id`, `test_que_id`, `ans_id`) VALUES
(4794, 2977, 1),
(4795, 2978, 5),
(4796, 2979, 11),
(4797, 2980, 15),
(4798, 2981, 19),
(4799, 2982, 24),
(4800, 2983, 32),
(4801, 2984, 67),
(4802, 2985, 1),
(4803, 2985, 2),
(4804, 2985, 3),
(4805, 2986, 5),
(4806, 2987, 10),
(4807, 2988, 14),
(4808, 2989, 18),
(4809, 2990, 24),
(4810, 2991, 32),
(4811, 2991, 33),
(4812, 2991, 34),
(4813, 2992, 67),
(4814, 2992, 68),
(4815, 2992, 69),
(4816, 2993, 2),
(4817, 2994, 4),
(4818, 2995, 9),
(4819, 2996, 13),
(4820, 2997, 17),
(4821, 2997, 18),
(4822, 2998, 24),
(4823, 2999, 32),
(4824, 2999, 33),
(4825, 2999, 34),
(4826, 3000, 65),
(4827, 3000, 66),
(4828, 3000, 67),
(4829, 3001, 79),
(4830, 3002, 88);

-- --------------------------------------------------------

--
-- Table structure for table `test_ques_comparisons`
--

CREATE TABLE `test_ques_comparisons` (
  `id` int(11) NOT NULL,
  `test_id_1` int(11) DEFAULT NULL COMMENT 'user_id 1',
  `test_id_2` int(11) DEFAULT NULL COMMENT 'user_id 2',
  `test_que_1` int(11) DEFAULT NULL,
  `test_que_2` int(11) DEFAULT NULL,
  `obtained_scores` decimal(10,2) NOT NULL,
  `max_allowed_scores` decimal(10,2) NOT NULL,
  `final_scores` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_ques_comparisons`
--

INSERT INTO `test_ques_comparisons` (`id`, `test_id_1`, `test_id_2`, `test_que_1`, `test_que_2`, `obtained_scores`, `max_allowed_scores`, `final_scores`) VALUES
(259, 223, 222, 2985, 2977, '0.00', '0.00', '0.00'),
(260, 223, 222, 2986, 2978, '0.00', '0.00', '0.00'),
(261, 223, 222, 2987, 2979, '5.00', '20.00', '5.00'),
(262, 223, 222, 2988, 2980, '0.00', '20.00', '0.00'),
(263, 223, 222, 2989, 2981, '0.00', '80.00', '0.00'),
(264, 223, 222, 2990, 2982, '20.00', '40.00', '20.00'),
(265, 223, 222, 2991, 2983, '20.00', '40.00', '20.00'),
(266, 223, 222, 2992, 2984, '20.00', '60.00', '20.00'),
(267, 224, 222, 2993, 2977, '0.00', '0.00', '0.00'),
(268, 224, 222, 2994, 2978, '0.00', '0.00', '0.00'),
(269, 224, 222, 2995, 2979, '10.00', '20.00', '10.00'),
(270, 224, 222, 2996, 2980, '10.00', '20.00', '10.00'),
(271, 224, 222, 2997, 2981, '0.00', '80.00', '0.00'),
(272, 224, 222, 2998, 2982, '20.00', '40.00', '20.00'),
(273, 224, 222, 2999, 2983, '20.00', '40.00', '20.00'),
(274, 224, 222, 3000, 2984, '20.00', '60.00', '20.00'),
(275, 224, 223, 2993, 2985, '0.00', '0.00', '0.00'),
(276, 224, 223, 2994, 2986, '0.00', '0.00', '0.00'),
(277, 224, 223, 2995, 2987, '5.00', '20.00', '5.00'),
(278, 224, 223, 2996, 2988, '0.00', '20.00', '0.00'),
(279, 224, 223, 2997, 2989, '40.00', '80.00', '40.00'),
(280, 224, 223, 2998, 2990, '20.00', '40.00', '20.00'),
(281, 224, 223, 2999, 2991, '60.00', '40.00', '40.00'),
(282, 224, 223, 3000, 2992, '30.00', '60.00', '30.00');

-- --------------------------------------------------------

--
-- Table structure for table `test_scores`
--

CREATE TABLE `test_scores` (
  `id` int(11) NOT NULL,
  `test_id_1` int(11) NOT NULL,
  `test_id_2` int(11) NOT NULL,
  `scores` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_scores`
--

INSERT INTO `test_scores` (`id`, `test_id_1`, `test_id_2`, `scores`) VALUES
(38, 223, 222, '65.00'),
(39, 224, 222, '80.00'),
(40, 224, 223, '135.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` enum('en','de') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en' COMMENT 'language en=english, de=germany',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL COMMENT '1=> male, 2=> female, 3=transgender',
  `login_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> manual,2=> facebook, 3=> google, 4=> instagram',
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'google location',
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `love_push_intention` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1= relationship, 2= friendship, 3= daily activities, 4= no expactations',
  `relationship` tinyint(5) DEFAULT NULL COMMENT '1= single, 2= in relationship, 3= married, 4= recently separated, 5= pen relationship',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physique` tinyint(5) DEFAULT NULL COMMENT '1= plump, 2= thin, 3= athletic, 4= muscular, 5= normal',
  `eyecolor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `haircolor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'favorite_travel_destination consider',
  `job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hobbies` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aboutme` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=> de-active, 1=> active',
  `is_restrict_fb_friends` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> not restrict, 0=> restrict',
  `sexual_orientation` tinyint(4) DEFAULT NULL COMMENT '1=> hetrosexual, 2=> bisexual, 3=> homesexual',
  `partner_preference` tinyint(4) NOT NULL DEFAULT '3' COMMENT '(NotUsed)1=> male, 2=> female, 3=> anyone',
  `is_profile_complete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=> not, 1=> yes',
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> android, 2=> ios',
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like_user_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'id of like and dislike user_id from likes table',
  `connect_user_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'id of accept connect to_user_id from connect_requests table',
  `chat_user_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'id of accept chat to_user_id from chat_requests table',
  `like_request_ids` text COLLATE utf8mb4_unicode_ci,
  `connect_request_ids` text COLLATE utf8mb4_unicode_ci,
  `chat_request_ids` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'manually enter',
  `role` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1=> admin, 2=> normal users',
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Not Used',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Not Used',
  `subscription_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '(Not Used)1=>free, 2=>premium, 3=>vip',
  `subscription_expire_date` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verify` tinyint(4) NOT NULL DEFAULT '0' COMMENT '(Not Used)0=> not, 1=> yes ',
  `employer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Not Used',
  `myReferalCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referalBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_from_search` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0 - diable, 1 - enable',
  `receive_like_request` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 - diable, 1 - enable',
  `receive_chat_request` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 - diable, 1 - enable',
  `receive_notification` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 - disable, 1 - enable',
  `isBlocked` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0 - unblock, 1 - block',
  `isDeleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0 - undelete, 1 - delete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `register_from` enum('','web') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'web= from website',
  `quickblox_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'quickblox userId'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `locale`, `name`, `username`, `email`, `gender`, `login_type`, `social_id`, `age`, `email_verified_at`, `verification_code`, `address`, `latitude`, `longitude`, `phone_code`, `phone`, `password`, `love_push_intention`, `relationship`, `size`, `physique`, `eyecolor`, `haircolor`, `education`, `job`, `hobbies`, `religion`, `aboutme`, `status`, `is_restrict_fb_friends`, `sexual_orientation`, `partner_preference`, `is_profile_complete`, `device_token`, `device_type`, `profile_image`, `like_user_ids`, `connect_user_ids`, `chat_user_ids`, `like_request_ids`, `connect_request_ids`, `chat_request_ids`, `language`, `role`, `country`, `city`, `subscription_type`, `subscription_expire_date`, `remember_token`, `is_phone_verify`, `employer`, `myReferalCode`, `referalBy`, `reset_link`, `hide_from_search`, `receive_like_request`, `receive_chat_request`, `receive_notification`, `isBlocked`, `isDeleted`, `created_at`, `updated_at`, `register_from`, `quickblox_id`) VALUES
(501, 'en', 'Devin Dalkis', 'Devin', 'devin@mailinator.com', 1, 1, NULL, 23, '2019-11-05 02:48:39', NULL, 'Apple Campus, 1 Infinite Loop, Cupertino, CA  95014, United States', '37.33233141', '-122.0312186', '+91', '8457961489354', '$2y$10$2oFsSKzFvzTTiAPfYn7l5e6waJUSyZfWK9BmN7Q/FC6DhVs5RFX3O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, '66c5fc54c39d3a94cf80d62bbf31c19c1e3c5edba8cfae178e52726973ae41db', 2, NULL, '506', NULL, NULL, '504,506,516,518,551,552', '526,548', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'FRCTLI', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 14:47:19', '2019-11-07 13:05:21', NULL, '99491220'),
(502, 'en', '', 'createffect 2', 'Harryrajputskp@gmail.com', 1, 1, NULL, NULL, NULL, 1907, NULL, NULL, NULL, '+1', '', '$2y$10$5mHNH1cp8WlO9AGUu1akxurgtfBreNjLa7KeNlV4AzNfmz6loyblm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'TWQWE1', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 15:01:54', '2019-11-05 15:01:54', NULL, ''),
(503, 'en', 'Rahul', 'test', 'rahultleo1998@gmail.com', 1, 2, '513816422505761', 25, '2019-11-06 12:51:22', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.621077', '77.0818381', '+91', '2222222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, '526,529', NULL, '501,504,509,510,514,515,522,528,552', '504,516,518,526,529,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MDP8V1', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 15:27:14', '2019-11-07 13:28:15', NULL, '99492820'),
(504, 'en', 'Aishwarya', 'chitra', NULL, 2, 2, '107690453944455', 19, '2019-11-07 01:20:47', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210954', '77.0818173', '+1', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, '551', '509,523,546,548,549,550', NULL, '501,514,528,529,534,535,540,541,547,551', '503,506,509,510,513,515,519,522,523,526,530,531,532,546,548,549,550', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'VDC0FE', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 15:28:49', '2019-11-08 05:10:00', NULL, '99492893'),
(506, 'en', 'Micheal Johns', 'Love Push', 'xicomtest04@gmail.com', 1, 2, '2340729176175958', 24, '2019-11-06 05:56:09', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.62105819393752', '77.0818889000667', '+91', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, '501,518', NULL, NULL, '501,516,518,526,551', '504,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'RFMTKM', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 15:32:21', '2019-11-07 13:28:22', NULL, '99493000'),
(507, 'en', '', 'Lehman', 'lehman@mailinatot.com', 1, 1, NULL, NULL, NULL, 2952, NULL, NULL, NULL, '+91', '12345678523', '$2y$10$/iR.4zNh4FJZyPR4hdihi.IscgiAZNZQwVMSy21RPwp3nYDaXY3Oi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'HJHAKQ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 15:38:38', '2019-11-05 15:38:38', NULL, ''),
(509, 'en', 'Zaib rajput', 'createffect 3', 'hellzone302@gmail.com', 1, 1, NULL, 20, '2019-11-05 03:40:08', NULL, 'Via Otto Colonne, 4, 40122 Bologna BO, Italy', '44.496772362465904', '11.335880643798376', '+1', '', '$2y$10$5KaE4Uvj266KvMj0nMwcvudew2hMeDh8JGp44fhJEEEEt6brUcrZu', 'No Expectation', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Go pro 💎', 1, 1, NULL, 3, 1, NULL, 1, '853161572968539.jpg', '516,518,522,551', '504,515,526,548', NULL, '503,516,518,522,551', '504,515,526,534,548', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '3HZV92', '', '', '0', '1', '1', '1', '0', '0', '2019-11-05 15:39:58', '2019-11-07 22:26:14', NULL, '99493395'),
(510, 'en', 'Tim', NULL, 'tim.leube@gmx.de', NULL, 2, '637955793388635', NULL, '2019-11-05 04:09:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, '516,552', '504,512,518,526,529,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'LFRIPU', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 16:00:06', '2019-11-08 04:52:16', NULL, '99494307'),
(512, 'en', 'Aishwarya Srivastava', 'dolly', 'dolly@mailinator.com', 2, 4, '21639180779', 20, NULL, NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210886', '77.0817985', '+1', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '519,531,535,541', '510,530,532', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'KI2VJ1', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 05:16:54', '2019-11-08 04:54:16', NULL, '99519997'),
(513, 'en', 'Gaurav', 'sbbsbd', 'xicomtest12@gmail.com', 1, 3, 'g6PoR2Hkx8d6IHdaUuJeFfeQizn2', NULL, '2019-11-06 07:08:02', NULL, NULL, NULL, NULL, '+1', '59595', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, '552', '504,516,518,526,529,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'OWGFYN', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 05:40:40', '2019-11-07 13:28:09', NULL, '99520820'),
(514, 'en', 'James Smith', 'james', 'james@mailinator.com', 1, 4, '22266994692', 24, '2019-11-06 06:03:01', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210871', '77.0818025', '+1', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 1, NULL, '526', NULL, NULL, '504,516,518,526,551', '548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'YBVSPQ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 06:01:37', '2019-11-07 13:28:21', NULL, '99521787'),
(515, 'en', 'AISHWARYA', 'riya', 'riya.verma261993@gmail.com', 2, 3, 'qfv6D6gxBgProRD4J52ngy7YkK52', 18, '2019-11-06 01:29:41', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210866', '77.0818171', '+1', '12345467890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 3, 3, 1, NULL, 1, NULL, NULL, '509,526,530', NULL, '518,551', '504,509,516,526,530,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'AK3IVA', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 06:07:20', '2019-11-07 13:25:33', NULL, '99521985'),
(519, 'en', '', 'ankita', 'ankita@mailinator.com', 2, 1, NULL, NULL, '2019-11-06 06:58:25', NULL, NULL, NULL, NULL, '+1', '', '$2y$10$YUCvep9QxQTc8A6wfLekZ.edFu2LkqPYdXNge/wDxdOVIeEesq9uG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, '516,526,529,548,552', '504,518,530,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'SAKFSO', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 06:57:56', '2019-11-07 13:28:11', NULL, '99524428'),
(522, 'de', 'Benny Reschl', 'bennyreschl', 'benjamin.reschl@gmail.com', 1, 4, '7695205737', 29, '2019-11-06 09:13:55', NULL, 'Hattinger Straße 400, 44795 Bochum, Deutschland', '51.44369275979754', '7.1931999748049265', '+49', '17623820875', NULL, 'Friendship,Daily Activities,No Expectation', 2, '176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hey Leute. Schreibt mir gerne und lasst uns ein bisschen quatschen 😋\nMehr Fotos von mir findet ihr auf meinem Insta Profil 😋 heiße dort genau wie hier „bennyreschl“ 😃', 1, 1, 3, 3, 1, '5444e8f7c3995818dd49eaadb0327512a76fd0bda49cc69e5c20d06b86830930', 2, '494641573110845.png', '509', NULL, NULL, '509,516,551,552', '504,518,526,548', NULL, 'Deutsch, English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'XAO3ED', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 09:12:25', '2019-11-07 13:19:03', NULL, '99531054'),
(523, 'en', 'Manish', 'manish Kumar', 'manishpreet0186@gmail.com', 2, 2, '1120785261461977', 26, '2019-11-07 01:41:39', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280634', '76.8462546', '+1', '6566666896', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 3, 1, NULL, 1, '396941573120747.jpg', '550', '504,526,546,548,551', NULL, '534,547,550', '', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'UHMIXC', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 10:29:39', '2019-11-08 05:10:02', NULL, '99534544'),
(525, 'en', 'Manish kumar', NULL, NULL, NULL, 4, '5870085026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'QHCIJL', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 10:40:41', '2019-11-06 10:40:42', NULL, '99535077'),
(526, 'en', 'harry singh', 'harry', 'harry@mailinator.com', 1, 1, NULL, 20, '2019-11-06 10:47:45', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.620882444110343', '77.08195852122928', '+1', '5445546464646', '$2y$10$2oFKC9J0U6H.orHX1UYdseRC0Pg5/Fz47IOH42u8bHBrIiojVR2Ti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 3, 1, 'e549d191e94fcaeff27c2ceb14b715de5814911d8b942397f63cd3419fe9107b', 2, '1573037971.png', '514', '503,509,515,523,529', NULL, '506,514,519,528,529,548,549,551', '501,503,504,505,509,510,513,515,523,527,529', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'EF20VY', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 10:47:18', '2019-11-07 13:28:25', NULL, '99535315'),
(528, 'en', 'aishwarya', 'aish', 'saishwarya2411@gmail.com', 2, 3, 'BlxKpG6TRGRjCQkgElHzq4eUxNW2', 19, '2019-11-06 12:07:35', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.621085', '77.0818061', '+1', '1223456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '504,526,548,551', '549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'BG9KQ1', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 12:06:06', '2019-11-07 13:28:17', NULL, '99537991'),
(529, 'en', 'AISHWARYA SRIVASTAVA', 'misha', 'misha@mailinator.com', 2, 1, NULL, 19, '2019-11-06 12:10:47', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210835', '77.0818047', '+1', '123434787878', '$2y$10$1tUiPdTkP8OfaFneOzQXVedSEsgeJ.urngShR20MXMGPPESZi1XJ6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, '503,526', NULL, '504,519,548,551', '503,505,510,513,526,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'JLIDAY', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 12:09:45', '2019-11-07 13:28:19', NULL, '99538125'),
(530, 'en', 'James', 'heena', 'james.smith241993@gmail.com', 3, 2, '123831815709708', 20, '2019-11-06 02:48:29', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210845', '77.081808', '+1', '1246464849', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, '515', NULL, NULL, '504,512,515,519,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'RBKTNU', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 13:06:26', '2019-11-08 04:52:14', NULL, '99539807'),
(531, 'en', 'Harpreet', 'harry1', 'iharpreetbedi@gmail.com', 1, 2, '10218601970735443', 18, '2019-11-06 03:17:52', NULL, NULL, NULL, NULL, '+91', '9798898869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '519,551', '504,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'CIPNHZ', '', '531v8x4wC', '0', '1', '1', '1', '0', '0', '2019-11-06 14:39:04', '2019-11-07 13:28:03', NULL, '99542594'),
(532, 'en', 'Harpreet', 'hshdj', 'theharpreetbedi@gmail.com', 1, 3, 'ZnPmaMid9WSjguT73PIfiPqpVsJ3', NULL, '2019-11-06 03:21:00', NULL, NULL, NULL, NULL, '+91', '9494949949', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, '552', '504,512,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'UDMGEU', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 15:20:20', '2019-11-08 04:52:18', NULL, '99543945'),
(533, 'en', '', 'Diana Shanti', 'let.soul.shine@hotmail.com', 2, 1, NULL, NULL, NULL, 5651, NULL, NULL, NULL, '+351', '917806526', '$2y$10$85Dvuyqe8TJvwxh87QiY..0W7KYjtS7z0ud6RGHDWtWTznEWueDli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'EOKJIL', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 16:53:15', '2019-11-06 16:53:15', NULL, ''),
(535, 'en', 'Diani', NULL, 'di_castanheira@hotmail.com', NULL, 2, '2811024918908956', NULL, '2019-11-06 05:21:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, '504,552', '548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'ETNMDT', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 17:21:17', '2019-11-07 13:28:08', NULL, '99550547'),
(537, 'de', 'Sebastian Otto', 'sebastian', 'sotto@wemakeweb.de', 1, 4, '2942661155', NULL, NULL, 8883, NULL, NULL, NULL, '+1', '55555555555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, 'f6744b5d7e8197fdc10f94a104df7c9cd188cd8ad4f62eabdc7c9659fcd8c633', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'VIUOIJ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 19:33:17', '2019-11-06 19:33:50', NULL, '99556709'),
(538, 'en', 'Ludovica Biondi', NULL, NULL, NULL, 4, '324670217', NULL, NULL, NULL, 'Via Brigata Messina 210/A, 61032 Fano, Provincia di Pesaro e Urbino, Italia', '43.83260251492619', '12.979801017803121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'TLHBWW', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-11-06 20:47:33', '2019-11-06 20:47:35', NULL, '99559839'),
(539, 'en', '', 'createffect 5', 'hellzone302@gmail.com', 1, 1, NULL, NULL, NULL, 9734, NULL, NULL, NULL, '+1', '', '$2y$10$J8y0LyccZwyTy.ubKYVTu.a3hQcO2kz2rJXPdnw8xaKpTo4J.LIB2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'ZODDXA', '', '5097VtfcN', '0', '1', '1', '1', '0', '0', '2019-11-06 21:17:12', '2019-11-07 12:42:20', NULL, ''),
(540, 'de', '', 'Stefan', 'stefan-fauth@vodafone.de', 1, 1, NULL, NULL, '2019-11-07 03:36:03', NULL, NULL, NULL, NULL, '+49', '1714577476', '$2y$10$g7Cn.mLW1/y/sd2ITm7XF.IYuKh3d9avkqj7DrgHhIA8O3gmWCeFm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, '504,552', '548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'VQTIPT', '4933', NULL, '0', '1', '1', '1', '0', '0', '2019-11-07 03:35:46', '2019-11-07 13:28:13', NULL, '99568676'),
(541, 'en', 'Malik', NULL, 'malikasifjj6@gmail.com', NULL, 2, '148521773215905', NULL, '2019-11-07 05:03:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, '504,551,552', '548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MGACT8', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-11-07 05:03:29', '2019-11-07 13:28:05', NULL, '99571288'),
(546, 'en', 'Manish', 'gghh', 'manishpreet.xicom@gmail.com', 2, 3, 'zRG9NYY5gWYY37xMmJEiiulk7az2', 22, '2019-11-07 09:42:26', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280887', '76.8462662', '+1', '69888858655588', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 3, 1, NULL, 1, '1573109980.jpeg', NULL, '504,523,548', NULL, '501,503,506,509,510,513,514,515,519,522,526,528,529,530,531,532,534,535,540,541,547,549,550,551', '504,523,548', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'HNXC2M', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-07 06:59:05', '2019-11-07 13:28:28', NULL, '99576430'),
(547, 'en', 'Gonzalo Allure', NULL, 'allureondemand2019@gmail.com', NULL, 3, '107566919293462403400', NULL, '2019-11-07 07:35:36', NULL, 'Apple Campus, 1 Infinite Loop, Cupertino, CA  95014, United States', '37.33233141', '-122.0312186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, '504,523,551', '548', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'GUVYKV', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-11-07 07:35:36', '2019-11-07 12:20:03', NULL, '99578410'),
(548, 'en', 'mitra', 'mitra', 'mitra@mailinator.com', 2, 1, NULL, 20, '2019-11-07 07:53:23', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210949', '77.0818176', '+1', '1234597898', '$2y$10$B8si6j3auz2aDpD3f7Yv3.rWndskpQuwv4G.MDl3MoS2c0iEbtTqG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, 'ed7f2b0f2a96df5409ddb8903b5b11759d94735c08b0397c018411abf55339cb', 2, NULL, '549,551', '504,509,523,546,550', NULL, '519,526,528,529,549,551,554', '501,503,504,506,509,510,513,514,515,522,523,530,531,532,534,535,540,541,546,547,550,552', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '24HNOA', '', '', '0', '1', '1', '1', '0', '0', '2019-11-07 07:52:39', '2019-11-08 05:09:59', NULL, '99579350'),
(549, 'en', 'neenu', 'nenu', 'nenu@mailinator.com', 2, 1, NULL, 19, '2019-11-07 09:07:01', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.621100033432302', '77.08194659599005', '+1', '12345655855', '$2y$10$i1F/cQShuXMaRBnhc3SRgOGAjJTHwfCyRVrh8Y0TX2gdUieQ1iUYu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, 'ffb46088bad25993bb9a8a08affcfaf3c6eb029630c91cc478c34056b8cb9721', 2, '1573117670.png', '548', '504,550', NULL, '501,509,522,523,526,534,546,547,548,551,552', '503,504,506,510,513,514,515,519,528,529,530,531,532,535,540,541,550', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'DLSYQZ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-07 09:06:28', '2019-11-08 05:10:03', NULL, '99583788'),
(550, 'en', 'Marshal Erickk', 'Harry Sharma', 'xicomtest11@gmail.com', 1, 2, '2539582006134054', 25, '2019-11-08 05:26:41', NULL, '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '37.4220668', '-122.0840085', '+91', '1231231231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 2, NULL, '523', '504,548,549', NULL, '501,503,506,509,510,513,514,515,519,522,523,526,528,529,530,531,532,535,540,541,546,551,552,554', '504,548,549', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '4PMU3E', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-07 09:36:35', '2019-11-08 05:56:33', NULL, '99585263'),
(551, 'en', 'Manish Singh', 'manish singh', 'm@mailinator.com', 1, 1, NULL, 23, '2019-11-07 10:42:56', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280579', '76.8462594', '+1', '787845441515151', '$2y$10$hl5EeY65SavFLxX06cRrcuutuvoyq/tbLjorHPZueezgpenFEuRqS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '504,509,548', '523', NULL, '501,503,504,506,508,509,510,513,514,515,519,522,526,528,529,530,531,532,534,535,540,541,546,547,548,549,550,552', '523', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'G9BOFI', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-07 10:41:35', '2019-11-07 13:38:28', NULL, '99588877'),
(552, 'en', 'Flutter Lovers', 'preet', 'p@mailinator.com', 1, 1, NULL, 25, '2019-11-07 12:52:12', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280578', '76.8462593', '+1', '544566875555888', '$2y$10$DjzR8ZVKix3v9N84SeoFke/ufbzlGW1Dqk5SeOXfpGLzaybBeEF8K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '501,503,504,509,510,513,515,519,522,526,528,529,531,532,535,540,541,548,549', '548', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '8BXQ4N', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-07 12:51:49', '2019-11-07 13:31:34', NULL, '99594519'),
(554, 'en', 'm', 'meemi', 'boonta_ja@hotmail.co.th', 2, 2, '3210525922352951', 20, '2019-11-08 01:24:38', NULL, 'Ko Phangan, Amphoe Ko Pha-ngan, Surat Thani 84280, Thailand', '9.720418634833507', '99.98386767702175', '+66', '0635383894', NULL, 'No Expectation', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 3, 3, 1, '398927631f88b3ff24d68c98e2e816ed18b670ed1eeb07e1b0d96f2a085719a1', 2, NULL, NULL, NULL, NULL, '510,519,532,540,548', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'Y9XRJH', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-08 01:24:38', '2019-11-08 04:57:06', NULL, '99619556'),
(555, 'en', 'Ghtra gayusi', 'Ghatra', 'ghtra@mailinator.com', 1, 1, NULL, 20, '2019-11-08 05:28:19', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.620962407466603', '77.08191460005666', '+1', '4545845555454', '$2y$10$itWtpekSENLIuEGrW0obROTB3usdLcxtEO36vcm2PMuCZm10JkO/q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, '1573190937.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'HNELAB', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-08 05:28:02', '2019-11-08 05:28:57', NULL, '99623764');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile_images`
--

CREATE TABLE `user_profile_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profile_images`
--

INSERT INTO `user_profile_images` (`id`, `user_id`, `image`, `created_at`, `updated_at`) VALUES
(327, 509, '853161572968539.jpg', '2019-11-05 15:42:19', '2019-11-05 15:42:19'),
(330, 526, '73561573037736.png', '2019-11-06 10:55:36', '2019-11-06 10:55:36'),
(331, 526, '374241573037749.png', '2019-11-06 10:55:49', '2019-11-06 10:55:49'),
(336, 546, '1573109980.jpeg', '2019-11-07 06:59:40', '2019-11-07 06:59:40'),
(340, 522, '494641573110845.png', '2019-11-07 07:14:05', '2019-11-07 07:14:05'),
(341, 522, '559041573110857.png', '2019-11-07 07:14:17', '2019-11-07 07:14:17'),
(342, 522, '62651573110880.png', '2019-11-07 07:14:40', '2019-11-07 07:14:40'),
(343, 549, '1573117670.png', '2019-11-07 09:07:50', '2019-11-07 09:07:50'),
(344, 523, '396941573120747.jpg', '2019-11-07 09:59:07', '2019-11-07 09:59:07'),
(346, 555, '1573190937.png', '2019-11-08 05:28:57', '2019-11-08 05:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_tests`
--

CREATE TABLE `user_tests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_tests`
--

INSERT INTO `user_tests` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(222, 523, '2019-11-06 12:09:18', '2019-11-06 12:09:18'),
(223, 514, '2019-11-06 12:24:19', '2019-11-06 12:24:19'),
(224, 530, '2019-11-07 07:10:51', '2019-11-07 07:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `web_users`
--

CREATE TABLE `web_users` (
  `id` int(11) NOT NULL,
  `locale` enum('en','de') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en' COMMENT 'language en=english, de=germany',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_code` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `register_from` enum('web') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_users`
--

INSERT INTO `web_users` (`id`, `locale`, `name`, `gender`, `email`, `verification_code`, `status`, `email_verified_at`, `register_from`, `created_at`, `updated_at`) VALUES
(3, 'en', 'Mutoni Aisha', 0, 'mutoniaisha97@gmail.com', 7237, 1, NULL, 'web', '2019-10-25 09:29:58', '2019-10-25 09:29:58'),
(4, 'en', 'ВАМ ВЫПЛАТА! - http://oribufibeq.gq/682 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'lex741@list.ru', 8859, 1, NULL, 'web', '2019-10-25 10:01:53', '2019-10-25 10:01:53'),
(5, 'en', 'dew1', 0, 'dew1@cox.net', 9107, 1, NULL, 'web', '2019-10-25 11:15:43', '2019-10-25 11:15:43'),
(6, 'en', 'ВАМ ВЫПЛАТА! - http://emakirerim.tk/640 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'anastasia-a88@mail.ru', 8970, 1, NULL, 'web', '2019-10-25 12:02:29', '2019-10-25 12:02:29'),
(7, 'en', 'kirstenbartels25', 0, 'kirstenbartels25@aol.com', 8518, 1, NULL, 'web', '2019-10-25 12:37:28', '2019-10-25 12:37:28'),
(8, 'en', 'jeremy.perez65', 0, 'jeremy.perez65@yahoo.com', 3967, 1, NULL, 'web', '2019-10-25 13:58:33', '2019-10-25 13:58:33'),
(9, 'en', 'ВАМ ВЫПЛАТА! - http://minyposu.tk/695 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'mozart82@mail.ru', 6868, 1, NULL, 'web', '2019-10-25 14:04:55', '2019-10-25 14:04:55'),
(10, 'en', 'Sane Sane', 0, 'ssane7973@gmail.com', 5801, 1, NULL, 'web', '2019-10-25 16:28:55', '2019-10-25 16:28:55'),
(11, 'en', 'ВАМ ВЫПЛАТА! - http://hykekibevuvu.tk/632 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'mikhail_izotov_81@mail.ru', 3932, 1, NULL, 'web', '2019-10-25 17:11:31', '2019-10-25 17:11:31'),
(12, 'en', 'ВАМ ВЫПЛАТА! - http://ebiworukyz.tk/642 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'guli_nozanin@mail.ru', 2014, 1, NULL, 'web', '2019-10-25 17:16:12', '2019-10-25 17:16:12'),
(13, 'en', 'ВАМ ВЫПЛАТА! - http://rububecuho.tk/658 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'maksimova-inna@mail.ru', 4710, 1, NULL, 'web', '2019-10-25 23:17:12', '2019-10-25 23:17:12'),
(14, 'en', 'ВАМ ВЫПЛАТА! - http://iwyqudaj.tk/645 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'kamal-72@mail.ru', 2706, 1, NULL, 'web', '2019-10-25 23:48:18', '2019-10-25 23:48:18'),
(15, 'en', 'ВАМ ВЫПЛАТА! - http://oguvulowyhup.tk/680 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'akim.rus.s@mail.ru', 4458, 1, NULL, 'web', '2019-10-26 00:59:15', '2019-10-26 00:59:15'),
(16, 'en', 'ВАМ ВЫПЛАТА! - http://ibogawiryw.tk/671 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'yunat62@mail.ru', 9050, 1, NULL, 'web', '2019-10-26 01:23:43', '2019-10-26 01:23:43'),
(17, 'en', 'ВАМ ВЫПЛАТА! - http://cerefuvoso.tk/628 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'frolova2310yulechka@mail.ru', 2068, 1, NULL, 'web', '2019-10-26 01:54:42', '2019-10-26 01:54:42'),
(18, 'en', 'ВАМ ВЫПЛАТА! - http://ebebevokaz.tk/626 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'myroslav_boyko@mail.ru', 2415, 1, NULL, 'web', '2019-10-26 02:32:26', '2019-10-26 02:32:26'),
(19, 'en', 'ВАМ ВЫПЛАТА! - http://soravyxe.tk/647 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'tanya05@mail.ru', 7483, 1, NULL, 'web', '2019-10-26 03:16:42', '2019-10-26 03:16:42'),
(20, 'en', 'ВАМ ВЫПЛАТА! - http://ricusaboga.tk/649 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'kartishka@inbox.ru', 6380, 1, NULL, 'web', '2019-10-26 03:55:37', '2019-10-26 03:55:37'),
(21, 'en', 'ВАМ ВЫПЛАТА! - http://byciwodady.cf/611 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'ulyana.surnina@mail.ru', 5402, 1, NULL, 'web', '2019-10-26 04:31:25', '2019-10-26 04:31:25'),
(22, 'en', 'mgrant5', 0, 'mgrant5@charter.net', 2762, 1, NULL, 'web', '2019-10-26 04:35:38', '2019-10-26 04:35:38'),
(23, 'en', 'Tushu', 0, 'tmavenger4422@gmail.com', NULL, 1, '2019-10-26 05:21:11', 'web', '2019-10-26 05:20:16', '2019-10-30 21:28:29'),
(24, 'en', 'ВАМ ВЫПЛАТА! - http://opuhegimil.tk/657 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', 0, 'ruslan3499@mail.ru', 4814, 1, NULL, 'web', '2019-10-26 05:32:36', '2019-10-26 05:32:36'),
(25, 'en', 'info', 0, 'info@hidden-audio.de', 8853, 1, NULL, 'web', '2019-10-29 12:41:33', '2019-10-29 12:41:33'),
(26, 'en', 'falconconstruction', 0, 'falconconstruction@yahoo.com', 1681, 1, NULL, 'web', '2019-10-29 15:13:42', '2019-10-29 15:13:42'),
(27, 'en', 'Wittco50', 0, 'Wittco50@gmail.com', 6361, 1, NULL, 'web', '2019-10-29 15:31:32', '2019-10-29 15:31:32'),
(28, 'en', 'mmiller', 0, 'mmiller@legendfbo.com', 7964, 1, NULL, 'web', '2019-10-29 17:49:40', '2019-10-29 17:49:40'),
(29, 'en', 'turkibutt48', 0, 'turkibutt48@cox.net', 9249, 1, NULL, 'web', '2019-10-29 18:29:55', '2019-10-29 18:29:55'),
(30, 'en', 'fourgenaustin', 0, 'fourgenaustin@yahoo.com', 6312, 1, NULL, 'web', '2019-10-29 19:35:51', '2019-10-29 19:35:51'),
(31, 'en', 'tarableknight10', 0, 'tarableknight10@yahoo.com', 1127, 1, NULL, 'web', '2019-10-29 23:53:20', '2019-10-29 23:53:20'),
(32, 'en', 'anirudh', 0, 'anirudh@mailinator.com', NULL, 1, '2019-10-30 07:49:39', 'web', '2019-10-30 07:48:53', '2019-10-31 04:30:18'),
(33, 'en', 'anirudh', 0, 'anirudh.p303@gmail.com', NULL, 1, '2019-10-30 07:59:07', 'web', '2019-10-30 07:57:52', '2019-10-30 21:28:28'),
(34, 'en', 'Rahul', 0, 'rahul@mailinator.com', 3440, 1, NULL, 'web', '2019-10-30 08:29:07', '2019-10-30 08:29:07'),
(35, 'en', 'Mohit Singla', 0, 'mohitks123@mailinator.com', NULL, 1, '2019-10-30 09:16:28', 'web', '2019-10-30 09:15:50', '2019-10-30 21:28:25'),
(36, 'en', 'kelly.herbster', 0, 'kelly.herbster@k12.sd.us', 6567, 1, NULL, 'web', '2019-10-30 12:40:29', '2019-10-30 12:40:29'),
(37, 'en', 'Sasa', 0, 'sarathvoeun@gmail.com', 5147, 1, NULL, 'web', '2019-10-30 14:04:26', '2019-10-30 14:04:26'),
(38, 'en', 'DMERKLE143', 0, 'DMERKLE143@VZW.BLACKBERRY.NET', 6993, 1, NULL, 'web', '2019-10-30 14:09:53', '2019-10-30 14:09:53'),
(39, 'en', 'info', 0, 'info@wunschgutschein.com', 1260, 1, NULL, 'web', '2019-10-30 16:18:26', '2019-10-30 16:18:26'),
(40, 'en', 'jeffszymanowski', 0, 'jeffszymanowski@gmail.com', 4545, 1, NULL, 'web', '2019-10-30 18:10:03', '2019-10-30 18:10:03'),
(41, 'en', 'rurbick', 0, 'rurbick@charter.net', 2226, 1, NULL, 'web', '2019-10-30 18:59:42', '2019-10-30 18:59:42'),
(42, 'en', 'ACCTSPAYABLE', 0, 'ACCTSPAYABLE@CITYOFEUNICE.ORG', 9803, 1, NULL, 'web', '2019-10-30 20:32:09', '2019-10-30 20:32:09'),
(43, 'en', 'mmona280', 0, 'mmona280@gmail.com', 6530, 1, NULL, 'web', '2019-10-30 23:03:35', '2019-10-30 23:03:35'),
(44, 'en', 'Tyler Fadwell', 0, 'tylerfadwell@gmail.com', 8766, 1, NULL, 'web', '2019-10-31 03:58:07', '2019-10-31 03:58:07'),
(45, 'en', 'Jennifer Olsen', 0, 'jenolsen810506@gmail.com', 4375, 1, NULL, 'web', '2019-10-31 04:53:30', '2019-10-31 04:53:30'),
(46, 'en', 'Tom Brady', 0, 'tombrady09@mailinator.com', 1196, 1, NULL, 'web', '2019-10-31 06:01:57', '2019-10-31 06:01:57'),
(345, 'en', 'Harry', 0, 'harry001@mailinator.com', NULL, 1, '2019-10-31 07:51:01', 'web', '2019-10-31 07:50:52', '2019-10-31 07:51:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_links`
--
ALTER TABLE `app_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block_list`
--
ALTER TABLE `block_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_requests`
--
ALTER TABLE `chat_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_status`
--
ALTER TABLE `chat_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connect_requests`
--
ALTER TABLE `connect_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_accounts`
--
ALTER TABLE `deleted_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intentions`
--
ALTER TABLE `intentions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_descs`
--
ALTER TABLE `notification_descs`
  ADD PRIMARY KEY (`notification_id`,`language_id`) USING BTREE;

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_ads_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_ads`
--
ALTER TABLE `post_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_ads_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qb_chat_dialog_ids`
--
ALTER TABLE `qb_chat_dialog_ids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_descs`
--
ALTER TABLE `question_descs`
  ADD PRIMARY KEY (`question_id`,`language_id`) USING BTREE;

--
-- Indexes for table `ques_options`
--
ALTER TABLE `ques_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ques_option_descs`
--
ALTER TABLE `ques_option_descs`
  ADD PRIMARY KEY (`ques_option_id`,`language_id`) USING BTREE;

--
-- Indexes for table `report_chat`
--
ALTER TABLE `report_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_ques`
--
ALTER TABLE `test_ques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_scores`
--
ALTER TABLE `test_scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profile_images_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_users`
--
ALTER TABLE `web_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `app_links`
--
ALTER TABLE `app_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `block_list`
--
ALTER TABLE `block_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_requests`
--
ALTER TABLE `chat_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `chat_status`
--
ALTER TABLE `chat_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;
--
-- AUTO_INCREMENT for table `connect_requests`
--
ALTER TABLE `connect_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1059;
--
-- AUTO_INCREMENT for table `deleted_accounts`
--
ALTER TABLE `deleted_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `intentions`
--
ALTER TABLE `intentions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2273;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=482;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2788;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;
--
-- AUTO_INCREMENT for table `post_ads`
--
ALTER TABLE `post_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `qb_chat_dialog_ids`
--
ALTER TABLE `qb_chat_dialog_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `ques_options`
--
ALTER TABLE `ques_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `report_chat`
--
ALTER TABLE `report_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `test_ques`
--
ALTER TABLE `test_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3013;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4849;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;
--
-- AUTO_INCREMENT for table `test_scores`
--
ALTER TABLE `test_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;
--
-- AUTO_INCREMENT for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;
--
-- AUTO_INCREMENT for table `web_users`
--
ALTER TABLE `web_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `post_ads`
--
ALTER TABLE `post_ads`
  ADD CONSTRAINT `post_ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
