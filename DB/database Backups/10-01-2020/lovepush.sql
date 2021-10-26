-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 10, 2020 at 06:57 PM
-- Server version: 5.7.28-0ubuntu0.16.04.2
-- PHP Version: 7.1.20-1+ubuntu16.04.1+deb.sury.org+1

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
(1, 'admin', 'admin@love-push.com', '7814817171', '1577344951.jpg', '$2y$10$oALoe/ZsdJCnM91RPUYkFOS.2tP2X/vTdmuJ5xqusIras5gP3hcj.', 100, '0abYMvLKxhHJpOC6zkvP45gDNWB1MZorLLSEnbWfA2EOWv7yrxSoynsr88lA', '774846', '2018-10-04 19:04:55', '2018-06-27 05:06:26', '2019-12-26 01:52:31');

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
(1, 'android', 'https://bit.ly/LovePushGooglePlay', '2019-11-06 13:18:39', '2019-11-11 06:28:03'),
(2, 'ios', 'https://bit.ly/LovePushApple', '2019-11-06 13:18:39', '2019-11-11 06:27:43');

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

--
-- Dumping data for table `block_list`
--

INSERT INTO `block_list` (`id`, `user_id`, `blocked_user_id`, `created_at`, `updated_at`) VALUES
(25, 1172, 1172, '2019-12-31 18:52:08', '2019-12-31 18:52:08'),
(26, 1166, 1166, '2020-01-03 10:00:41', '2020-01-03 10:00:41'),
(28, 1162, 1162, '2020-01-03 11:35:48', '2020-01-03 11:35:48'),
(36, 1168, 1168, '2020-01-03 13:17:54', '2020-01-03 13:17:54'),
(53, 1166, 1168, '2020-01-07 10:26:24', '2020-01-07 10:26:24'),
(83, 1172, 1162, '2020-01-07 16:12:06', '2020-01-07 16:12:06');

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
(1, 978, 1163, '0', '2019-12-18 10:11:47', '2019-12-18 10:11:47'),
(2, 978, 1165, '0', '2019-12-18 10:11:47', '2019-12-18 10:11:47'),
(5, 979, 1166, '0', '2019-12-18 10:48:00', '2019-12-18 10:48:00'),
(6, 979, 1168, '0', '2019-12-18 10:48:00', '2019-12-18 10:48:00'),
(7, 980, 1164, '0', '2019-12-18 11:08:09', '2019-12-18 11:08:09'),
(8, 980, 1163, '0', '2019-12-18 11:08:09', '2019-12-18 11:08:09'),
(9, 981, 1164, '0', '2019-12-18 12:49:53', '2019-12-18 12:49:53'),
(10, 981, 1168, '0', '2019-12-18 12:49:53', '2019-12-18 12:49:53'),
(11, 982, 1169, '0', '2019-12-19 18:43:44', '2019-12-19 18:43:44'),
(12, 982, 1165, '0', '2019-12-19 18:43:44', '2019-12-19 18:43:44'),
(13, 985, 1170, '0', '2019-12-20 10:51:05', '2020-01-07 06:57:03'),
(14, 985, 1165, '0', '2019-12-20 10:51:05', '2019-12-20 10:51:05'),
(15, 988, 1166, '0', '2019-12-26 15:31:31', '2019-12-26 15:31:31'),
(16, 988, 1162, '0', '2019-12-26 15:31:31', '2019-12-26 15:31:31'),
(17, 988, 1166, '0', '2019-12-26 15:31:47', '2019-12-26 15:31:47'),
(18, 988, 1162, '0', '2019-12-26 15:31:47', '2019-12-26 15:31:47'),
(19, 990, 1162, '0', '2019-12-26 15:40:38', '2019-12-26 15:40:38'),
(20, 990, 1165, '0', '2019-12-26 15:40:38', '2019-12-26 15:40:38'),
(21, 989, 1170, '0', '2019-12-26 16:09:05', '2019-12-26 16:09:05'),
(22, 989, 1162, '0', '2019-12-26 16:09:05', '2019-12-26 16:09:05'),
(23, 994, 1172, '0', '2019-12-31 17:47:47', '2019-12-31 17:47:47'),
(24, 994, 1176, '0', '2019-12-31 17:47:47', '2019-12-31 17:47:47'),
(25, 992, 1165, '0', '2020-01-02 13:16:09', '2020-01-02 13:16:09'),
(26, 992, 1176, '0', '2020-01-02 13:16:09', '2020-01-02 13:16:09'),
(27, 996, 1172, '0', '2020-01-03 12:17:10', '2020-01-03 12:17:10'),
(28, 996, 1166, '0', '2020-01-03 12:17:10', '2020-01-03 12:17:10'),
(29, 997, 1172, '0', '2020-01-03 12:18:03', '2020-01-03 12:18:03'),
(30, 997, 1165, '0', '2020-01-03 12:18:03', '2020-01-03 12:18:03'),
(31, 987, 1172, '0', '2020-01-03 13:14:57', '2020-01-03 13:14:57'),
(32, 987, 1168, '0', '2020-01-03 13:14:57', '2020-01-03 13:14:57'),
(33, 998, 1165, '0', '2020-01-03 15:20:19', '2020-01-03 15:20:19'),
(34, 998, 1168, '0', '2020-01-03 15:20:19', '2020-01-03 15:20:19'),
(35, 995, 1166, '0', '2020-01-03 17:54:12', '2020-01-03 17:54:12'),
(36, 995, 1176, '0', '2020-01-03 17:54:12', '2020-01-03 17:54:12'),
(37, 993, 1162, '0', '2020-01-03 18:18:36', '2020-01-03 18:18:36'),
(38, 993, 1177, '0', '2020-01-03 18:18:36', '2020-01-03 18:18:36'),
(39, 991, 1162, '0', '2020-01-03 18:18:50', '2020-01-03 18:18:50'),
(40, 991, 1173, '0', '2020-01-03 18:18:50', '2020-01-03 18:18:50'),
(41, 983, 1163, '0', '2020-01-07 12:08:59', '2020-01-07 12:08:59'),
(42, 983, 1168, '0', '2020-01-07 12:08:59', '2020-01-07 12:08:59'),
(43, 999, 1172, '0', '2020-01-07 12:42:00', '2020-01-07 12:42:00'),
(44, 999, 1162, '0', '2020-01-07 12:42:00', '2020-01-07 12:42:00'),
(45, 1002, 1163, '0', '2020-01-07 18:26:19', '2020-01-07 18:26:19'),
(46, 1002, 1162, '0', '2020-01-07 18:26:19', '2020-01-07 18:26:19'),
(47, 1003, 1168, '0', '2020-01-07 19:33:17', '2020-01-07 19:33:17'),
(48, 1003, 1179, '0', '2020-01-07 19:33:17', '2020-01-07 19:33:17'),
(49, 1000, 1163, '0', '2020-01-08 10:17:00', '2020-01-08 10:17:00'),
(50, 1000, 1178, '0', '2020-01-08 10:17:00', '2020-01-08 10:17:00'),
(51, 1005, 1162, '0', '2020-01-08 10:35:32', '2020-01-08 10:35:32'),
(52, 1005, 1178, '0', '2020-01-08 10:35:32', '2020-01-08 10:35:32'),
(53, 1006, 1179, '0', '2020-01-08 11:15:40', '2020-01-08 11:15:40'),
(54, 1006, 1163, '0', '2020-01-08 11:15:40', '2020-01-08 11:15:40'),
(55, 998, 1165, '0', '2020-01-09 10:20:20', '2020-01-09 10:20:20'),
(56, 998, 1168, '0', '2020-01-09 10:20:20', '2020-01-09 10:20:20');

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
(2356, 1170, 1169, 'S', '2019-12-20 05:18:19', '2019-12-20 05:18:19'),
(2357, 1170, 1165, 'A', '2019-12-20 05:20:41', '2019-12-20 05:20:50'),
(2358, 1175, 1171, 'S', '2019-12-23 15:46:55', '2019-12-23 15:46:55'),
(2359, 1165, 1168, 'A', '2019-12-26 10:19:40', '2020-01-03 07:47:26'),
(2360, 1162, 1173, 'A', '2019-12-26 10:21:29', '2019-12-26 10:23:22'),
(2361, 1177, 1165, 'A', '2019-12-30 11:56:55', '2020-01-09 04:33:15'),
(2362, 1177, 1170, 'S', '2019-12-30 11:57:00', '2019-12-30 11:57:00'),
(2363, 1177, 1175, 'S', '2019-12-30 12:00:47', '2019-12-30 12:00:47'),
(2364, 1166, 1173, 'S', '2020-01-03 06:45:37', '2020-01-03 06:45:37'),
(2366, 1165, 1178, 'A', '2020-01-07 12:50:21', '2020-01-08 05:05:18'),
(2367, 1163, 1170, 'S', '2020-01-07 12:51:50', '2020-01-07 12:51:50'),
(2368, 1163, 1169, 'S', '2020-01-07 12:52:01', '2020-01-07 12:52:01'),
(2369, 1178, 1172, 'S', '2020-01-08 04:53:27', '2020-01-08 04:53:27'),
(2370, 1178, 1170, 'S', '2020-01-08 04:53:29', '2020-01-08 04:53:29'),
(2371, 1178, 1163, 'S', '2020-01-08 05:02:54', '2020-01-08 05:02:54'),
(2372, 1178, 1171, 'S', '2020-01-08 05:03:52', '2020-01-08 05:03:52'),
(2373, 1162, 1178, 'S', '2020-01-08 05:07:03', '2020-01-08 05:07:03'),
(2374, 1179, 1162, 'S', '2020-01-08 05:47:37', '2020-01-08 05:47:37'),
(2375, 1180, 1171, 'S', '2020-01-08 09:39:05', '2020-01-08 09:39:05'),
(2376, 1180, 1175, 'S', '2020-01-08 09:39:15', '2020-01-08 09:39:15');

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
(1, 0, 'shine', 'shine', 'shine@mailinator.com', '+1', '', 'Instrusive adds', 'eeff', '2019-12-23 16:40:25', '2019-12-23 16:40:25');

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
(8, 1, 'Account', 'Where do I set the language?', 'Set your language by selecting "Language" in the settings.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(9, 1, 'Account', 'Can I deactivate message requests?', 'Yes, if you only want to be contacted by matches deactivate message requests in the settings under "stop private messaging".', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(10, 1, 'Account', 'Can I deactivate my account temporarily?', 'Temporarily deactivate your account by selecting "Hide me from search" in the settings.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(11, 1, 'Account', 'How do I delete my account?', 'Delete your account in the settings under "Delete Account".', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(12, 1, 'Account', 'How do I add images and how do I delete images of myself?', 'You can add and delete your pictures in the profile editing.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(13, 1, 'Features LovePush', 'Profile & Posts', 'Create an interesting and real profile!\r\nYou can also post pictures in your profile - pictures say more than 1000 words!', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
(14, 1, 'Features LovePush', 'Swipe', 'You can choose between "next", "connect" or "date" request.\r\nAfter you have matched, you can start chatting.', '1', '2019-10-07 16:12:41', '2019-10-07 16:12:41'),
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
(47, 2, 'Features LovePush', 'Swipe', 'Du kannst zwischen "next", "connect" oder "date" Request entscheiden. \r\nNachdem du gematcht hast, kannst du mit dem Chatten beginnen.', '1', '2019-10-07 16:12:41', '2019-10-07 16:23:05'),
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
(3, 1168, 1166, 1, '2019-12-18 05:16:27', '2019-12-18 05:16:27'),
(4, 1166, 1168, 1, '2019-12-18 05:16:46', '2019-12-18 05:16:46'),
(7, 1168, 1163, 1, '2019-12-18 07:18:52', '2019-12-18 07:18:52'),
(8, 1168, 1164, 1, '2019-12-18 07:19:18', '2019-12-18 07:19:18'),
(9, 1164, 1168, 1, '2019-12-18 07:19:37', '2019-12-18 07:19:37'),
(10, 1165, 1169, 1, '2019-12-19 13:11:04', '2019-12-19 13:11:04'),
(11, 1169, 1165, 1, '2019-12-19 13:11:37', '2019-12-19 13:11:37'),
(12, 1163, 1168, 1, '2019-12-20 04:30:37', '2019-12-20 04:30:37'),
(18, 1166, 1165, 0, '2019-12-20 15:13:53', '2019-12-20 15:13:53'),
(19, 1166, 1163, 0, '2019-12-20 15:14:04', '2019-12-20 15:14:04'),
(22, 1166, 1169, 0, '2019-12-23 09:39:50', '2019-12-23 09:39:50'),
(23, 1166, 1171, 0, '2019-12-23 09:39:57', '2019-12-23 09:39:57'),
(24, 1166, 1162, 0, '2019-12-23 09:40:00', '2019-12-23 09:40:00'),
(25, 1166, 1164, 0, '2019-12-23 09:40:05', '2019-12-23 09:40:05'),
(26, 1166, 1170, 0, '2019-12-23 09:40:09', '2019-12-23 09:40:09'),
(27, 1168, 1169, 0, '2019-12-23 11:07:40', '2019-12-23 11:07:40'),
(28, 1168, 1171, 0, '2019-12-23 11:07:43', '2019-12-23 11:07:43'),
(29, 1168, 1165, 0, '2019-12-23 11:14:04', '2019-12-23 11:14:04'),
(30, 1172, 1165, 0, '2019-12-23 11:18:03', '2019-12-23 11:18:03'),
(32, 1172, 1163, 0, '2019-12-23 11:18:27', '2019-12-23 11:18:27'),
(33, 1172, 1164, 0, '2019-12-23 11:18:29', '2019-12-23 11:18:29'),
(34, 1172, 1170, 0, '2019-12-23 11:18:31', '2019-12-23 11:18:31'),
(35, 1172, 1171, 0, '2019-12-23 11:18:34', '2019-12-23 11:18:34'),
(36, 1172, 1169, 0, '2019-12-23 11:18:36', '2019-12-23 11:18:36'),
(37, 1172, 1166, 0, '2019-12-23 11:18:38', '2019-12-23 11:18:38'),
(41, 1168, 1162, 0, '2019-12-23 11:29:41', '2019-12-23 11:29:41'),
(42, 1168, 1170, 0, '2019-12-23 11:29:47', '2019-12-23 11:29:47'),
(44, 1162, 1164, 0, '2019-12-23 11:43:48', '2019-12-23 11:43:48'),
(48, 1162, 1171, 1, '2019-12-23 11:56:37', '2019-12-23 11:56:37'),
(49, 1162, 1169, 1, '2019-12-23 11:56:42', '2019-12-23 11:56:42'),
(50, 1162, 1166, 1, '2019-12-23 11:56:48', '2019-12-23 11:56:48'),
(51, 1170, 1164, 0, '2019-12-23 12:06:55', '2019-12-23 12:06:55'),
(52, 1170, 1163, 0, '2019-12-23 12:07:06', '2019-12-23 12:07:06'),
(53, 1170, 1172, 0, '2019-12-23 12:07:19', '2019-12-23 12:07:19'),
(54, 1170, 1171, 0, '2019-12-23 12:07:21', '2019-12-23 12:07:21'),
(55, 1170, 1166, 0, '2019-12-23 12:07:23', '2019-12-23 12:07:23'),
(56, 1170, 1168, 0, '2019-12-23 12:07:25', '2019-12-23 12:07:25'),
(57, 1166, 1162, 1, '2019-12-23 12:08:23', '2019-12-23 12:08:23'),
(58, 1162, 1168, 0, '2019-12-23 13:12:40', '2019-12-23 13:12:40'),
(59, 1166, 1172, 0, '2019-12-23 13:30:47', '2019-12-23 13:30:47'),
(64, 1176, 1173, 1, '2019-12-27 09:31:31', '2019-12-27 09:31:31'),
(65, 1176, 1164, 1, '2019-12-27 09:31:33', '2019-12-27 09:31:33'),
(66, 1176, 1170, 1, '2019-12-27 09:31:37', '2019-12-27 09:31:37'),
(67, 1176, 1172, 1, '2019-12-27 09:31:40', '2019-12-27 09:31:40'),
(68, 1176, 1166, 1, '2019-12-27 09:31:43', '2019-12-27 09:31:43'),
(69, 1176, 1165, 1, '2019-12-27 09:31:46', '2019-12-27 09:31:46'),
(70, 1165, 1176, 1, '2019-12-30 09:31:44', '2019-12-30 09:31:44'),
(71, 1177, 1162, 1, '2019-12-30 11:56:39', '2019-12-30 11:56:39'),
(72, 1177, 1176, 1, '2019-12-30 11:56:44', '2019-12-30 11:56:44'),
(73, 1177, 1163, 1, '2019-12-30 11:56:48', '2019-12-30 11:56:48'),
(74, 1177, 1173, 0, '2019-12-30 11:56:51', '2019-12-30 11:56:51'),
(75, 1177, 1164, 0, '2019-12-30 11:56:52', '2019-12-30 11:56:52'),
(76, 1177, 1172, 0, '2019-12-30 12:00:33', '2019-12-30 12:00:33'),
(77, 1177, 1166, 0, '2019-12-30 12:00:37', '2019-12-30 12:00:37'),
(78, 1177, 1171, 1, '2019-12-30 12:00:53', '2019-12-30 12:00:53'),
(79, 1162, 1177, 1, '2019-12-30 12:29:14', '2019-12-30 12:29:14'),
(80, 1166, 1175, 0, '2019-12-31 11:17:28', '2019-12-31 11:17:28'),
(81, 1166, 1177, 1, '2019-12-31 11:17:37', '2019-12-31 11:17:37'),
(82, 1172, 1176, 1, '2019-12-31 12:17:29', '2019-12-31 12:17:29'),
(83, 1165, 1164, 0, '2020-01-02 07:42:42', '2020-01-02 07:42:42'),
(84, 1165, 1173, 0, '2020-01-02 07:42:49', '2020-01-02 07:42:49'),
(85, 1165, 1175, 0, '2020-01-02 07:42:51', '2020-01-02 07:42:51'),
(86, 1165, 1171, 0, '2020-01-02 07:42:53', '2020-01-02 07:42:53'),
(87, 1165, 1172, 1, '2020-01-02 07:45:15', '2020-01-02 07:45:15'),
(88, 1165, 1166, 0, '2020-01-02 07:45:40', '2020-01-02 07:45:40'),
(89, 1162, 1176, 0, '2020-01-02 07:59:17', '2020-01-02 07:59:17'),
(90, 1162, 1175, 0, '2020-01-02 07:59:19', '2020-01-02 07:59:19'),
(91, 1166, 1176, 1, '2020-01-03 04:30:07', '2020-01-03 04:30:07'),
(92, 1166, 1172, 1, '2020-01-03 06:45:59', '2020-01-03 06:45:59'),
(93, 1172, 1166, 1, '2020-01-03 06:46:35', '2020-01-03 06:46:35'),
(94, 1172, 1165, 1, '2020-01-03 06:46:39', '2020-01-03 06:46:39'),
(95, 1178, 1164, 0, '2020-01-03 12:13:53', '2020-01-03 12:13:53'),
(99, 1163, 1173, 1, '2020-01-07 12:51:45', '2020-01-07 12:51:45'),
(100, 1163, 1175, 1, '2020-01-07 12:51:54', '2020-01-07 12:51:54'),
(101, 1163, 1171, 1, '2020-01-07 12:51:58', '2020-01-07 12:51:58'),
(103, 1163, 1177, 1, '2020-01-07 12:52:16', '2020-01-07 12:52:16'),
(106, 1179, 1172, 1, '2020-01-07 14:02:22', '2020-01-07 14:02:22'),
(107, 1179, 1173, 1, '2020-01-07 14:02:26', '2020-01-07 14:02:26'),
(108, 1179, 1177, 1, '2020-01-07 14:02:29', '2020-01-07 14:02:29'),
(112, 1178, 1176, 0, '2020-01-08 04:52:49', '2020-01-08 04:52:49'),
(113, 1178, 1173, 0, '2020-01-08 04:52:51', '2020-01-08 04:52:51'),
(114, 1178, 1177, 0, '2020-01-08 04:52:52', '2020-01-08 04:52:52'),
(115, 1178, 1179, 0, '2020-01-08 04:53:24', '2020-01-08 04:53:24'),
(116, 1178, 1175, 0, '2020-01-08 04:53:31', '2020-01-08 04:53:31'),
(118, 1179, 1168, 1, '2020-01-08 07:04:04', '2020-01-08 07:04:04');

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
(979, 'L', 1166, 1168, 1, '2019-12-18 05:16:46', '2019-12-18 05:16:46'),
(981, 'L', 1164, 1168, 1, '2019-12-18 07:19:38', '2019-12-18 07:19:38'),
(982, 'L', 1169, 1165, 1, '2019-12-19 13:11:37', '2019-12-19 13:11:37'),
(983, 'L', 1163, 1168, 1, '2019-12-20 04:30:37', '2019-12-20 04:30:37'),
(985, 'C', 1170, 1165, 1, '2019-12-20 05:20:50', '2019-12-20 05:20:50'),
(988, 'L', 1166, 1162, 1, '2019-12-23 12:08:24', '2019-12-23 12:08:24'),
(991, 'C', 1162, 1173, 1, '2019-12-26 10:23:22', '2019-12-26 10:23:22'),
(992, 'L', 1165, 1176, 1, '2019-12-30 09:31:44', '2019-12-30 09:31:44'),
(993, 'L', 1162, 1177, 1, '2019-12-30 12:29:14', '2019-12-30 12:29:14'),
(994, 'L', 1172, 1176, 1, '2019-12-31 12:17:30', '2019-12-31 12:17:30'),
(995, 'L', 1166, 1176, 1, '2020-01-03 04:30:07', '2020-01-03 04:30:07'),
(996, 'L', 1172, 1166, 1, '2020-01-03 06:46:35', '2020-01-03 06:46:35'),
(997, 'L', 1172, 1165, 1, '2020-01-03 06:46:39', '2020-01-03 06:46:39'),
(998, 'C', 1165, 1168, 1, '2020-01-03 07:47:26', '2020-01-03 07:47:26'),
(1001, 'L', 1163, 1177, 1, '2020-01-07 12:52:16', '2020-01-07 12:52:16'),
(1004, 'C', 1165, 1178, 1, '2020-01-08 05:05:18', '2020-01-08 05:05:18'),
(1007, 'C', 1177, 1165, 1, '2020-01-09 04:33:15', '2020-01-09 04:33:15');

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
(7040, 'S_L_R', 1, 1165, 1163, 0, 1, '2019-12-18 04:41:13', '2019-12-18 04:41:44'),
(7041, 'A_L_R', 2, 1163, 1165, 0, 1, '2019-12-18 04:41:44', '2019-12-18 04:42:18'),
(7042, 'S_L_R', 3, 1168, 1166, 0, 1, '2019-12-18 05:16:27', '2019-12-18 05:16:47'),
(7043, 'A_L_R', 4, 1166, 1168, 1, 1, '2019-12-18 05:16:46', '2019-12-18 05:18:15'),
(7044, 'S_L_R', 5, 1163, 1164, 0, 1, '2019-12-18 05:35:36', '2019-12-18 05:36:25'),
(7045, 'A_L_R', 6, 1164, 1163, 0, 1, '2019-12-18 05:36:25', '2019-12-18 05:39:30'),
(7046, 'S_L_R', 7, 1168, 1163, 0, 1, '2019-12-18 07:18:52', '2019-12-20 04:30:38'),
(7047, 'S_L_R', 8, 1168, 1164, 0, 1, '2019-12-18 07:19:19', '2019-12-18 07:19:39'),
(7048, 'A_L_R', 9, 1164, 1168, 1, 1, '2019-12-18 07:19:38', '2019-12-18 07:39:31'),
(7049, 'S_L_R', 10, 1165, 1169, 0, 1, '2019-12-19 13:11:04', '2019-12-19 13:11:38'),
(7050, 'A_L_R', 11, 1169, 1165, 0, 1, '2019-12-19 13:11:37', '2019-12-26 10:09:33'),
(7051, 'A_L_R', 12, 1163, 1168, 1, 1, '2019-12-20 04:30:38', '2019-12-23 11:13:26'),
(7055, 'S_C_R', 2356, 1170, 1169, 1, 0, '2019-12-20 05:18:19', '2019-12-20 05:18:19'),
(7057, 'S_C_R', 2357, 1170, 1165, 0, 1, '2019-12-20 05:20:41', '2019-12-20 05:20:50'),
(7058, 'A_C_R', 2357, 1165, 1170, 1, 1, '2019-12-20 05:20:50', '2019-12-20 05:21:02'),
(7061, 'S_L_R', 39, 1168, 1172, 0, 1, '2019-12-23 11:20:24', '2019-12-23 11:20:30'),
(7062, 'A_L_R', 40, 1172, 1168, 1, 1, '2019-12-23 11:20:30', '2019-12-23 11:33:13'),
(7063, 'S_L_R', 47, 1162, 1170, 0, 1, '2019-12-23 11:56:10', '2019-12-26 04:16:27'),
(7064, 'S_L_R', 48, 1162, 1171, 1, 0, '2019-12-23 11:56:37', '2019-12-23 11:56:37'),
(7065, 'S_L_R', 49, 1162, 1169, 1, 0, '2019-12-23 11:56:43', '2019-12-23 11:56:43'),
(7066, 'S_L_R', 50, 1162, 1166, 0, 1, '2019-12-23 11:56:49', '2019-12-23 12:08:27'),
(7067, 'A_L_R', 57, 1166, 1162, 0, 1, '2019-12-23 12:08:26', '2019-12-26 10:06:19'),
(7068, 'S_C_R', 2358, 1175, 1171, 1, 0, '2019-12-23 15:46:55', '2019-12-23 15:46:55'),
(7069, 'A_L_R', 60, 1170, 1162, 0, 1, '2019-12-26 04:16:27', '2019-12-26 10:06:16'),
(7070, 'S_L_R', 61, 1165, 1162, 0, 1, '2019-12-26 09:55:56', '2019-12-26 10:06:35'),
(7071, 'A_L_R', 62, 1162, 1165, 0, 1, '2019-12-26 10:06:35', '2019-12-26 10:08:49'),
(7072, 'S_C_R', 2359, 1165, 1168, 0, 1, '2019-12-26 10:19:40', '2020-01-03 07:47:26'),
(7073, 'S_C_R', 2360, 1162, 1173, 0, 1, '2019-12-26 10:21:29', '2019-12-26 10:23:23'),
(7074, 'A_C_R', 2360, 1173, 1162, 0, 1, '2019-12-26 10:23:22', '2019-12-26 10:23:50'),
(7075, 'S_L_R', 63, 1176, 1163, 0, 1, '2019-12-27 09:31:27', '2020-01-07 12:52:12'),
(7076, 'S_L_R', 64, 1176, 1173, 1, 1, '2019-12-27 09:31:32', '2019-12-30 12:32:03'),
(7077, 'S_L_R', 65, 1176, 1164, 1, 0, '2019-12-27 09:31:34', '2019-12-27 09:31:34'),
(7078, 'S_L_R', 66, 1176, 1170, 1, 1, '2019-12-27 09:31:38', '2019-12-30 06:51:15'),
(7079, 'S_L_R', 67, 1176, 1172, 0, 1, '2019-12-27 09:31:41', '2019-12-31 12:17:30'),
(7080, 'S_L_R', 68, 1176, 1166, 0, 1, '2019-12-27 09:31:44', '2020-01-03 04:30:08'),
(7081, 'S_L_R', 69, 1176, 1165, 0, 1, '2019-12-27 09:31:47', '2019-12-30 09:31:45'),
(7082, 'A_L_R', 70, 1165, 1176, 1, 0, '2019-12-30 09:31:45', '2019-12-30 09:31:45'),
(7083, 'S_L_R', 71, 1177, 1162, 0, 1, '2019-12-30 11:56:40', '2019-12-30 12:29:16'),
(7084, 'S_L_R', 72, 1177, 1176, 1, 0, '2019-12-30 11:56:44', '2019-12-30 11:56:44'),
(7085, 'S_L_R', 73, 1177, 1163, 0, 1, '2019-12-30 11:56:48', '2020-01-07 12:52:17'),
(7086, 'S_C_R', 2361, 1177, 1165, 0, 1, '2019-12-30 11:56:55', '2020-01-09 04:33:15'),
(7087, 'S_C_R', 2362, 1177, 1170, 1, 1, '2019-12-30 11:57:00', '2019-12-31 06:35:10'),
(7088, 'S_C_R', 2363, 1177, 1175, 1, 0, '2019-12-30 12:00:47', '2019-12-30 12:00:47'),
(7089, 'S_L_R', 78, 1177, 1171, 1, 0, '2019-12-30 12:00:54', '2019-12-30 12:00:54'),
(7090, 'A_L_R', 79, 1162, 1177, 1, 0, '2019-12-30 12:29:16', '2019-12-30 12:29:16'),
(7091, 'S_L_R', 81, 1166, 1177, 1, 0, '2019-12-31 11:17:38', '2019-12-31 11:17:38'),
(7092, 'A_L_R', 82, 1172, 1176, 1, 0, '2019-12-31 12:17:30', '2019-12-31 12:17:30'),
(7093, 'S_L_R', 87, 1165, 1172, 0, 1, '2020-01-02 07:45:15', '2020-01-03 06:46:40'),
(7094, 'A_L_R', 91, 1166, 1176, 1, 0, '2020-01-03 04:30:07', '2020-01-03 04:30:07'),
(7095, 'S_C_R', 2364, 1166, 1173, 1, 0, '2020-01-03 06:45:37', '2020-01-03 06:45:37'),
(7096, 'S_L_R', 92, 1166, 1172, 0, 1, '2020-01-03 06:46:00', '2020-01-03 06:46:35'),
(7097, 'A_L_R', 93, 1172, 1166, 1, 1, '2020-01-03 06:46:35', '2020-01-03 06:49:07'),
(7098, 'A_L_R', 94, 1172, 1165, 1, 1, '2020-01-03 06:46:40', '2020-01-03 12:31:40'),
(7099, 'A_C_R', 2359, 1168, 1165, 1, 1, '2020-01-03 07:47:26', '2020-01-03 12:31:40'),
(7100, 'S_L_R', 96, 1178, 1163, 0, 1, '2020-01-03 12:14:08', '2020-01-07 12:52:09'),
(7101, 'S_L_R', 97, 1162, 1172, 0, 1, '2020-01-07 07:10:26', '2020-01-07 07:11:46'),
(7102, 'A_L_R', 98, 1172, 1162, 0, 1, '2020-01-07 07:11:46', '2020-01-07 12:25:08'),
(7103, 'S_C_R', 2365, 1162, 1178, 0, 1, '2020-01-07 12:17:05', '2020-01-08 05:05:21'),
(7104, 'S_C_R', 2366, 1165, 1178, 0, 1, '2020-01-07 12:50:22', '2020-01-08 05:05:18'),
(7105, 'S_L_R', 99, 1163, 1173, 1, 0, '2020-01-07 12:51:45', '2020-01-07 12:51:45'),
(7106, 'S_C_R', 2367, 1163, 1170, 1, 1, '2020-01-07 12:51:50', '2020-01-07 13:11:26'),
(7107, 'S_L_R', 100, 1163, 1175, 1, 0, '2020-01-07 12:51:55', '2020-01-07 12:51:55'),
(7108, 'S_L_R', 101, 1163, 1171, 1, 0, '2020-01-07 12:51:58', '2020-01-07 12:51:58'),
(7109, 'S_C_R', 2368, 1163, 1169, 1, 0, '2020-01-07 12:52:01', '2020-01-07 12:52:01'),
(7110, 'A_L_R', 102, 1163, 1178, 1, 1, '2020-01-07 12:52:08', '2020-01-08 04:52:20'),
(7111, 'A_L_R', 103, 1163, 1177, 1, 0, '2020-01-07 12:52:17', '2020-01-07 12:52:17'),
(7112, 'S_L_R', 104, 1162, 1163, 0, 1, '2020-01-07 12:55:25', '2020-01-07 12:56:08'),
(7113, 'A_L_R', 105, 1163, 1162, 0, 1, '2020-01-07 12:56:08', '2020-01-08 05:15:46'),
(7114, 'P_L_R', 237, 1172, 1165, 1, 1, '2020-01-07 13:58:27', '2020-01-09 04:33:05'),
(7115, 'S_L_R', 106, 1179, 1172, 1, 0, '2020-01-07 14:02:23', '2020-01-07 14:02:23'),
(7116, 'S_L_R', 107, 1179, 1173, 1, 0, '2020-01-07 14:02:26', '2020-01-07 14:02:26'),
(7117, 'S_L_R', 108, 1179, 1177, 1, 0, '2020-01-07 14:02:30', '2020-01-07 14:02:30'),
(7118, 'S_L_R', 109, 1179, 1168, 0, 1, '2020-01-07 14:02:51', '2020-01-07 14:03:02'),
(7119, 'A_L_R', 110, 1168, 1179, 1, 1, '2020-01-07 14:03:01', '2020-01-07 14:03:18'),
(7120, 'S_L_R', 111, 1163, 1179, 0, 1, '2020-01-08 04:46:44', '2020-01-08 05:45:12'),
(7121, 'S_C_R', 2369, 1178, 1172, 1, 0, '2020-01-08 04:53:27', '2020-01-08 04:53:27'),
(7122, 'S_C_R', 2370, 1178, 1170, 1, 1, '2020-01-08 04:53:29', '2020-01-08 05:15:15'),
(7123, 'S_C_R', 2371, 1178, 1163, 1, 0, '2020-01-08 05:02:54', '2020-01-08 05:02:54'),
(7124, 'S_C_R', 2372, 1178, 1171, 1, 0, '2020-01-08 05:03:52', '2020-01-08 05:03:52'),
(7125, 'A_C_R', 2366, 1178, 1165, 1, 1, '2020-01-08 05:05:18', '2020-01-09 04:33:05'),
(7126, 'A_C_R', 2365, 1178, 1162, 0, 1, '2020-01-08 05:05:20', '2020-01-08 05:15:49'),
(7127, 'S_C_R', 2373, 1162, 1178, 1, 0, '2020-01-08 05:07:03', '2020-01-08 05:07:03'),
(7128, 'A_L_R', 117, 1179, 1163, 1, 0, '2020-01-08 05:45:12', '2020-01-08 05:45:12'),
(7129, 'S_C_R', 2374, 1179, 1162, 1, 1, '2020-01-08 05:47:37', '2020-01-08 09:28:37'),
(7130, 'S_L_R', 118, 1179, 1168, 1, 0, '2020-01-08 07:04:05', '2020-01-08 07:04:05'),
(7131, 'S_C_R', 2375, 1180, 1171, 1, 0, '2020-01-08 09:39:06', '2020-01-08 09:39:06'),
(7132, 'S_C_R', 2376, 1180, 1175, 1, 0, '2020-01-08 09:39:15', '2020-01-08 09:39:15'),
(7133, 'A_C_R', 2361, 1165, 1177, 1, 0, '2020-01-09 04:33:15', '2020-01-09 04:33:15');

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
(7040, 1, 'TTMP has sent you Date Request.', '2019-12-18 04:41:13', '2019-12-18 04:41:13'),
(7040, 2, 'TTMP hat Ihnen eine Terminanfrage gesendet.', '2019-12-18 04:41:13', '2019-12-18 04:41:13'),
(7041, 1, 'tina has accepted your Date Request.', '2019-12-18 04:41:44', '2019-12-18 04:41:44'),
(7041, 2, 'tina hat Ihre Terminanfrage angenommen.', '2019-12-18 04:41:44', '2019-12-18 04:41:44'),
(7042, 1, 'joe has sent you Date Request.', '2019-12-18 05:16:27', '2019-12-18 05:16:27'),
(7042, 2, 'joe hat Ihnen eine Terminanfrage gesendet.', '2019-12-18 05:16:27', '2019-12-18 05:16:27'),
(7043, 1, 'Singh has accepted your Date Request.', '2019-12-18 05:16:46', '2019-12-18 05:16:46'),
(7043, 2, 'Singh hat Ihre Terminanfrage angenommen.', '2019-12-18 05:16:47', '2019-12-18 05:16:47'),
(7044, 1, 'tina has sent you Date Request.', '2019-12-18 05:35:36', '2019-12-18 05:35:36'),
(7044, 2, 'tina hat Ihnen eine Terminanfrage gesendet.', '2019-12-18 05:35:36', '2019-12-18 05:35:36'),
(7045, 1, 'Bob has accepted your Date Request.', '2019-12-18 05:36:25', '2019-12-18 05:36:25'),
(7045, 2, 'Bob hat Ihre Terminanfrage angenommen.', '2019-12-18 05:36:25', '2019-12-18 05:36:25'),
(7046, 1, 'joe has sent you Date Request.', '2019-12-18 07:18:52', '2019-12-18 07:18:52'),
(7046, 2, 'joe hat Ihnen eine Terminanfrage gesendet.', '2019-12-18 07:18:53', '2019-12-18 07:18:53'),
(7047, 1, 'joe has sent you Date Request.', '2019-12-18 07:19:19', '2019-12-18 07:19:19'),
(7047, 2, 'joe hat Ihnen eine Terminanfrage gesendet.', '2019-12-18 07:19:19', '2019-12-18 07:19:19'),
(7048, 1, 'Bob has accepted your Date Request.', '2019-12-18 07:19:39', '2019-12-18 07:19:39'),
(7048, 2, 'Bob hat Ihre Terminanfrage angenommen.', '2019-12-18 07:19:39', '2019-12-18 07:19:39'),
(7049, 1, 'TTMP has sent you Date Request.', '2019-12-19 13:11:04', '2019-12-19 13:11:04'),
(7049, 2, 'TTMP hat Ihnen eine Terminanfrage gesendet.', '2019-12-19 13:11:05', '2019-12-19 13:11:05'),
(7050, 1, 'HMIT has accepted your Date Request.', '2019-12-19 13:11:37', '2019-12-19 13:11:37'),
(7050, 2, 'HMIT hat Ihre Terminanfrage angenommen.', '2019-12-19 13:11:37', '2019-12-19 13:11:37'),
(7051, 1, 'tina has accepted your Date Request.', '2019-12-20 04:30:38', '2019-12-20 04:30:38'),
(7051, 2, 'tina hat Ihre Terminanfrage angenommen.', '2019-12-20 04:30:38', '2019-12-20 04:30:38'),
(7055, 1, 'Tom Kayuri has sent you Connect Request', '2019-12-20 05:18:19', '2019-12-20 05:18:19'),
(7055, 2, 'Tom Kayuri hat Ihnen eine Verbindungsanforderung gesendet.', '2019-12-20 05:18:19', '2019-12-20 05:18:19'),
(7057, 1, 'Tom Kayuri has sent you Connect Request', '2019-12-20 05:20:41', '2019-12-20 05:20:41'),
(7057, 2, 'Tom Kayuri hat Ihnen eine Verbindungsanforderung gesendet.', '2019-12-20 05:20:41', '2019-12-20 05:20:41'),
(7058, 1, 'TTMP accepted a connect request.', '2019-12-20 05:20:50', '2019-12-20 05:20:50'),
(7058, 2, 'TTMP hat eine Verbindungsanforderung angenommen.', '2019-12-20 05:20:50', '2019-12-20 05:20:50'),
(7061, 1, 'joe has sent you Date Request.', '2019-12-23 11:20:24', '2019-12-23 11:20:24'),
(7061, 2, 'joe hat Ihnen eine Terminanfrage gesendet.', '2019-12-23 11:20:24', '2019-12-23 11:20:24'),
(7062, 1, 'manish kumar has accepted your Date Request.', '2019-12-23 11:20:30', '2019-12-23 11:20:30'),
(7062, 2, 'manish kumar hat Ihre Terminanfrage angenommen.', '2019-12-23 11:20:30', '2019-12-23 11:20:30'),
(7063, 1, 'Jim has sent you Date Request.', '2019-12-23 11:56:10', '2019-12-23 11:56:10'),
(7063, 2, 'Jim hat Ihnen eine Terminanfrage gesendet.', '2019-12-23 11:56:11', '2019-12-23 11:56:11'),
(7064, 1, 'Jim has sent you Date Request.', '2019-12-23 11:56:37', '2019-12-23 11:56:37'),
(7064, 2, 'Jim hat Ihnen eine Terminanfrage gesendet.', '2019-12-23 11:56:37', '2019-12-23 11:56:37'),
(7065, 1, 'Jim has sent you Date Request.', '2019-12-23 11:56:43', '2019-12-23 11:56:43'),
(7065, 2, 'Jim hat Ihnen eine Terminanfrage gesendet.', '2019-12-23 11:56:43', '2019-12-23 11:56:43'),
(7066, 1, 'Jim has sent you Date Request.', '2019-12-23 11:56:49', '2019-12-23 11:56:49'),
(7066, 2, 'Jim hat Ihnen eine Terminanfrage gesendet.', '2019-12-23 11:56:49', '2019-12-23 11:56:49'),
(7067, 1, 'Singh has accepted your Date Request.', '2019-12-23 12:08:27', '2019-12-23 12:08:27'),
(7067, 2, 'Singh hat Ihre Terminanfrage angenommen.', '2019-12-23 12:08:27', '2019-12-23 12:08:27'),
(7068, 1, 'Hey has sent you Connect Request', '2019-12-23 15:46:55', '2019-12-23 15:46:55'),
(7068, 2, 'Hey hat Ihnen eine Verbindungsanforderung gesendet.', '2019-12-23 15:46:55', '2019-12-23 15:46:55'),
(7069, 1, 'Tom Kayuri has accepted your Date Request.', '2019-12-26 04:16:27', '2019-12-26 04:16:27'),
(7069, 2, 'Tom Kayuri hat Ihre Terminanfrage angenommen.', '2019-12-26 04:16:27', '2019-12-26 04:16:27'),
(7070, 1, 'TTMP has sent you Date Request.', '2019-12-26 09:55:56', '2019-12-26 09:55:56'),
(7070, 2, 'TTMP hat Ihnen eine Terminanfrage gesendet.', '2019-12-26 09:55:56', '2019-12-26 09:55:56'),
(7071, 1, 'Jim has accepted your Date Request.', '2019-12-26 10:06:35', '2019-12-26 10:06:35'),
(7071, 2, 'Jim hat Ihre Terminanfrage angenommen.', '2019-12-26 10:06:35', '2019-12-26 10:06:35'),
(7072, 1, 'TTMP has sent you Connect Request', '2019-12-26 10:19:40', '2019-12-26 10:19:40'),
(7072, 2, 'TTMP hat Ihnen eine Verbindungsanforderung gesendet.', '2019-12-26 10:19:41', '2019-12-26 10:19:41'),
(7073, 1, 'Jim has sent you Connect Request', '2019-12-26 10:21:30', '2019-12-26 10:21:30'),
(7073, 2, 'Jim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-12-26 10:21:30', '2019-12-26 10:21:30'),
(7074, 1, 'hey accepted a connect request.', '2019-12-26 10:23:22', '2019-12-26 10:23:22'),
(7074, 2, 'hey hat eine Verbindungsanforderung angenommen.', '2019-12-26 10:23:23', '2019-12-26 10:23:23'),
(7075, 1, 'lanaslav has sent you Date Request.', '2019-12-27 09:31:27', '2019-12-27 09:31:27'),
(7075, 2, 'lanaslav hat Ihnen eine Terminanfrage gesendet.', '2019-12-27 09:31:27', '2019-12-27 09:31:27'),
(7076, 1, 'lanaslav has sent you Date Request.', '2019-12-27 09:31:32', '2019-12-27 09:31:32'),
(7076, 2, 'lanaslav hat Ihnen eine Terminanfrage gesendet.', '2019-12-27 09:31:32', '2019-12-27 09:31:32'),
(7077, 1, 'lanaslav has sent you Date Request.', '2019-12-27 09:31:34', '2019-12-27 09:31:34'),
(7077, 2, 'lanaslav hat Ihnen eine Terminanfrage gesendet.', '2019-12-27 09:31:35', '2019-12-27 09:31:35'),
(7078, 1, 'lanaslav has sent you Date Request.', '2019-12-27 09:31:38', '2019-12-27 09:31:38'),
(7078, 2, 'lanaslav hat Ihnen eine Terminanfrage gesendet.', '2019-12-27 09:31:38', '2019-12-27 09:31:38'),
(7079, 1, 'lanaslav has sent you Date Request.', '2019-12-27 09:31:41', '2019-12-27 09:31:41'),
(7079, 2, 'lanaslav hat Ihnen eine Terminanfrage gesendet.', '2019-12-27 09:31:41', '2019-12-27 09:31:41'),
(7080, 1, 'lanaslav has sent you Date Request.', '2019-12-27 09:31:44', '2019-12-27 09:31:44'),
(7080, 2, 'lanaslav hat Ihnen eine Terminanfrage gesendet.', '2019-12-27 09:31:44', '2019-12-27 09:31:44'),
(7081, 1, 'lanaslav has sent you Date Request.', '2019-12-27 09:31:47', '2019-12-27 09:31:47'),
(7081, 2, 'lanaslav hat Ihnen eine Terminanfrage gesendet.', '2019-12-27 09:31:47', '2019-12-27 09:31:47'),
(7082, 1, 'TTMP has accepted your Date Request.', '2019-12-30 09:31:45', '2019-12-30 09:31:45'),
(7082, 2, 'TTMP hat Ihre Terminanfrage angenommen.', '2019-12-30 09:31:45', '2019-12-30 09:31:45'),
(7083, 1, 'texa has sent you Date Request.', '2019-12-30 11:56:40', '2019-12-30 11:56:40'),
(7083, 2, 'texa hat Ihnen eine Terminanfrage gesendet.', '2019-12-30 11:56:40', '2019-12-30 11:56:40'),
(7084, 1, 'texa has sent you Date Request.', '2019-12-30 11:56:44', '2019-12-30 11:56:44'),
(7084, 2, 'texa hat Ihnen eine Terminanfrage gesendet.', '2019-12-30 11:56:44', '2019-12-30 11:56:44'),
(7085, 1, 'texa has sent you Date Request.', '2019-12-30 11:56:48', '2019-12-30 11:56:48'),
(7085, 2, 'texa hat Ihnen eine Terminanfrage gesendet.', '2019-12-30 11:56:49', '2019-12-30 11:56:49'),
(7086, 1, 'texa has sent you Connect Request', '2019-12-30 11:56:55', '2019-12-30 11:56:55'),
(7086, 2, 'texa hat Ihnen eine Verbindungsanforderung gesendet.', '2019-12-30 11:56:55', '2019-12-30 11:56:55'),
(7087, 1, 'texa has sent you Connect Request', '2019-12-30 11:57:00', '2019-12-30 11:57:00'),
(7087, 2, 'texa hat Ihnen eine Verbindungsanforderung gesendet.', '2019-12-30 11:57:00', '2019-12-30 11:57:00'),
(7088, 1, 'texa has sent you Connect Request', '2019-12-30 12:00:48', '2019-12-30 12:00:48'),
(7088, 2, 'texa hat Ihnen eine Verbindungsanforderung gesendet.', '2019-12-30 12:00:48', '2019-12-30 12:00:48'),
(7089, 1, 'texa has sent you Date Request.', '2019-12-30 12:00:54', '2019-12-30 12:00:54'),
(7089, 2, 'texa hat Ihnen eine Terminanfrage gesendet.', '2019-12-30 12:00:55', '2019-12-30 12:00:55'),
(7090, 1, 'Jim has accepted your Date Request.', '2019-12-30 12:29:16', '2019-12-30 12:29:16'),
(7090, 2, 'Jim hat Ihre Terminanfrage angenommen.', '2019-12-30 12:29:16', '2019-12-30 12:29:16'),
(7091, 1, 'Singh has sent you Date Request.', '2019-12-31 11:17:38', '2019-12-31 11:17:38'),
(7091, 2, 'Singh hat Ihnen eine Terminanfrage gesendet.', '2019-12-31 11:17:38', '2019-12-31 11:17:38'),
(7092, 1, 'manish kumar has accepted your Date Request.', '2019-12-31 12:17:30', '2019-12-31 12:17:30'),
(7092, 2, 'manish kumar hat Ihre Terminanfrage angenommen.', '2019-12-31 12:17:30', '2019-12-31 12:17:30'),
(7093, 1, 'TTMP has sent you Date Request.', '2020-01-02 07:45:16', '2020-01-02 07:45:16'),
(7093, 2, 'TTMP hat Ihnen eine Terminanfrage gesendet.', '2020-01-02 07:45:16', '2020-01-02 07:45:16'),
(7094, 1, 'Singh has accepted your Date Request.', '2020-01-03 04:30:07', '2020-01-03 04:30:07'),
(7094, 2, 'Singh hat Ihre Terminanfrage angenommen.', '2020-01-03 04:30:07', '2020-01-03 04:30:07'),
(7095, 1, 'Singh has sent you Connect Request', '2020-01-03 06:45:37', '2020-01-03 06:45:37'),
(7095, 2, 'Singh hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-03 06:45:37', '2020-01-03 06:45:37'),
(7096, 1, 'Singh has sent you Date Request.', '2020-01-03 06:46:00', '2020-01-03 06:46:00'),
(7096, 2, 'Singh hat Ihnen eine Terminanfrage gesendet.', '2020-01-03 06:46:00', '2020-01-03 06:46:00'),
(7097, 1, 'manish kumar has accepted your Date Request.', '2020-01-03 06:46:35', '2020-01-03 06:46:35'),
(7097, 2, 'manish kumar hat Ihre Terminanfrage angenommen.', '2020-01-03 06:46:35', '2020-01-03 06:46:35'),
(7098, 1, 'manish kumar has accepted your Date Request.', '2020-01-03 06:46:40', '2020-01-03 06:46:40'),
(7098, 2, 'manish kumar hat Ihre Terminanfrage angenommen.', '2020-01-03 06:46:40', '2020-01-03 06:46:40'),
(7099, 1, 'joe accepted a connect request.', '2020-01-03 07:47:26', '2020-01-03 07:47:26'),
(7099, 2, 'joe hat eine Verbindungsanforderung angenommen.', '2020-01-03 07:47:26', '2020-01-03 07:47:26'),
(7100, 1, 'jam has sent you Date Request.', '2020-01-03 12:14:08', '2020-01-03 12:14:08'),
(7100, 2, 'jam hat Ihnen eine Terminanfrage gesendet.', '2020-01-03 12:14:08', '2020-01-03 12:14:08'),
(7101, 1, 'Jim has sent you Date Request.', '2020-01-07 07:10:26', '2020-01-07 07:10:26'),
(7101, 2, 'Jim hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 07:10:26', '2020-01-07 07:10:26'),
(7102, 1, 'manish kumar has accepted your Date Request.', '2020-01-07 07:11:46', '2020-01-07 07:11:46'),
(7102, 2, 'manish kumar hat Ihre Terminanfrage angenommen.', '2020-01-07 07:11:46', '2020-01-07 07:11:46'),
(7103, 1, 'Jim has sent you Connect Request', '2020-01-07 12:17:05', '2020-01-07 12:17:05'),
(7103, 2, 'Jim hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-07 12:17:05', '2020-01-07 12:17:05'),
(7104, 1, 'TTMP has sent you Connect Request', '2020-01-07 12:50:22', '2020-01-07 12:50:22'),
(7104, 2, 'TTMP hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-07 12:50:22', '2020-01-07 12:50:22'),
(7105, 1, 'tina has sent you Date Request.', '2020-01-07 12:51:46', '2020-01-07 12:51:46'),
(7105, 2, 'tina hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 12:51:46', '2020-01-07 12:51:46'),
(7106, 1, 'tina has sent you Connect Request', '2020-01-07 12:51:50', '2020-01-07 12:51:50'),
(7106, 2, 'tina hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-07 12:51:50', '2020-01-07 12:51:50'),
(7107, 1, 'tina has sent you Date Request.', '2020-01-07 12:51:55', '2020-01-07 12:51:55'),
(7107, 2, 'tina hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 12:51:56', '2020-01-07 12:51:56'),
(7108, 1, 'tina has sent you Date Request.', '2020-01-07 12:51:59', '2020-01-07 12:51:59'),
(7108, 2, 'tina hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 12:51:59', '2020-01-07 12:51:59'),
(7109, 1, 'tina has sent you Connect Request', '2020-01-07 12:52:01', '2020-01-07 12:52:01'),
(7109, 2, 'tina hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-07 12:52:01', '2020-01-07 12:52:01'),
(7110, 1, 'tina has accepted your Date Request.', '2020-01-07 12:52:08', '2020-01-07 12:52:08'),
(7110, 2, 'tina hat Ihre Terminanfrage angenommen.', '2020-01-07 12:52:09', '2020-01-07 12:52:09'),
(7111, 1, 'tina has accepted your Date Request.', '2020-01-07 12:52:17', '2020-01-07 12:52:17'),
(7111, 2, 'tina hat Ihre Terminanfrage angenommen.', '2020-01-07 12:52:17', '2020-01-07 12:52:17'),
(7112, 1, 'Jim has sent you Date Request.', '2020-01-07 12:55:25', '2020-01-07 12:55:25'),
(7112, 2, 'Jim hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 12:55:25', '2020-01-07 12:55:25'),
(7113, 1, 'tina has accepted your Date Request.', '2020-01-07 12:56:08', '2020-01-07 12:56:08'),
(7113, 2, 'tina hat Ihre Terminanfrage angenommen.', '2020-01-07 12:56:08', '2020-01-07 12:56:08'),
(7114, 1, 'manish kumar has liked your post.', '2020-01-07 13:58:27', '2020-01-07 13:58:27'),
(7114, 2, 'manish kumar hat Ihren Beitrag gefallen.', '2020-01-07 13:58:27', '2020-01-07 13:58:27'),
(7115, 1, 'tani has sent you Date Request.', '2020-01-07 14:02:23', '2020-01-07 14:02:23'),
(7115, 2, 'tani hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 14:02:23', '2020-01-07 14:02:23'),
(7116, 1, 'tani has sent you Date Request.', '2020-01-07 14:02:26', '2020-01-07 14:02:26'),
(7116, 2, 'tani hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 14:02:26', '2020-01-07 14:02:26'),
(7117, 1, 'tani has sent you Date Request.', '2020-01-07 14:02:30', '2020-01-07 14:02:30'),
(7117, 2, 'tani hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 14:02:30', '2020-01-07 14:02:30'),
(7118, 1, 'tani has sent you Date Request.', '2020-01-07 14:02:51', '2020-01-07 14:02:51'),
(7118, 2, 'tani hat Ihnen eine Terminanfrage gesendet.', '2020-01-07 14:02:52', '2020-01-07 14:02:52'),
(7119, 1, 'joe has accepted your Date Request.', '2020-01-07 14:03:01', '2020-01-07 14:03:01'),
(7119, 2, 'joe hat Ihre Terminanfrage angenommen.', '2020-01-07 14:03:01', '2020-01-07 14:03:01'),
(7120, 1, 'tina has sent you Date Request.', '2020-01-08 04:46:44', '2020-01-08 04:46:44'),
(7120, 2, 'tina hat Ihnen eine Terminanfrage gesendet.', '2020-01-08 04:46:45', '2020-01-08 04:46:45'),
(7121, 1, 'jam has sent you Connect Request', '2020-01-08 04:53:27', '2020-01-08 04:53:27'),
(7121, 2, 'jam hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-08 04:53:27', '2020-01-08 04:53:27'),
(7122, 1, 'jam has sent you Connect Request', '2020-01-08 04:53:29', '2020-01-08 04:53:29'),
(7122, 2, 'jam hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-08 04:53:29', '2020-01-08 04:53:29'),
(7123, 1, 'jam has sent you Connect Request', '2020-01-08 05:02:54', '2020-01-08 05:02:54'),
(7123, 2, 'jam hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-08 05:02:55', '2020-01-08 05:02:55'),
(7124, 1, 'jam has sent you Connect Request', '2020-01-08 05:03:52', '2020-01-08 05:03:52'),
(7124, 2, 'jam hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-08 05:03:52', '2020-01-08 05:03:52'),
(7125, 1, 'jam accepted a connect request.', '2020-01-08 05:05:18', '2020-01-08 05:05:18'),
(7125, 2, 'jam hat eine Verbindungsanforderung angenommen.', '2020-01-08 05:05:18', '2020-01-08 05:05:18'),
(7126, 1, 'jam accepted a connect request.', '2020-01-08 05:05:21', '2020-01-08 05:05:21'),
(7126, 2, 'jam hat eine Verbindungsanforderung angenommen.', '2020-01-08 05:05:21', '2020-01-08 05:05:21'),
(7127, 1, 'Jim has sent you Connect Request', '2020-01-08 05:07:03', '2020-01-08 05:07:03'),
(7127, 2, 'Jim hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-08 05:07:03', '2020-01-08 05:07:03'),
(7128, 1, 'tani has accepted your Date Request.', '2020-01-08 05:45:12', '2020-01-08 05:45:12'),
(7128, 2, 'tani hat Ihre Terminanfrage angenommen.', '2020-01-08 05:45:12', '2020-01-08 05:45:12'),
(7129, 1, 'tani has sent you Connect Request', '2020-01-08 05:47:37', '2020-01-08 05:47:37'),
(7129, 2, 'tani hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-08 05:47:37', '2020-01-08 05:47:37'),
(7130, 1, 'tani has sent you Date Request.', '2020-01-08 07:04:05', '2020-01-08 07:04:05'),
(7130, 2, 'tani hat Ihnen eine Terminanfrage gesendet.', '2020-01-08 07:04:05', '2020-01-08 07:04:05'),
(7131, 1, 'Hallo Sie has sent you Connect Request', '2020-01-08 09:39:06', '2020-01-08 09:39:06'),
(7131, 2, 'Hallo Sie hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-08 09:39:07', '2020-01-08 09:39:07'),
(7132, 1, 'Hallo Sie has sent you Connect Request', '2020-01-08 09:39:15', '2020-01-08 09:39:15'),
(7132, 2, 'Hallo Sie hat Ihnen eine Verbindungsanforderung gesendet.', '2020-01-08 09:39:16', '2020-01-08 09:39:16'),
(7133, 1, 'TTMP accepted a connect request.', '2020-01-09 04:33:15', '2020-01-09 04:33:15'),
(7133, 2, 'TTMP hat eine Verbindungsanforderung angenommen.', '2020-01-09 04:33:15', '2020-01-09 04:33:15');

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
('003d9ac676135de5cf04b698173e8588567397a1d7508cbc2fa7a931ece80b5be7638a6d6ca2ce4b', 1170, 1, 'user', '[]', 1, '2019-12-26 05:12:15', '2019-12-26 05:12:15', '2020-12-26 10:42:15'),
('00c72b346b1fdf1eb11b8712f650b9415a39fb1f1d36c50f997fcddc7cf860e171382cc367497ea5', 1170, 1, 'user', '[]', 1, '2019-12-25 23:55:04', '2019-12-25 23:55:04', '2020-12-26 05:25:04'),
('018215c2e551615e89cb4c25d5576e01113926caaba1a33fe8ff12a5a8ed47890fab84928d883521', 1178, 1, 'user', '[]', 1, '2020-01-07 23:18:04', '2020-01-07 23:18:04', '2021-01-08 04:48:04'),
('0184eafeef1ad99a49edf55af30d9acd4e1508a770066b8c098904055090d1c0c23fcab69f74b230', 1172, 1, 'user', '[]', 1, '2020-01-03 02:13:19', '2020-01-03 02:13:19', '2021-01-03 07:43:19'),
('01d3efb58d352761753d8b6be7a5e565b53116411b241d9ba72e865e13df2f90418c477c09f2687d', 1162, 1, 'user', '[]', 0, '2020-01-07 06:46:33', '2020-01-07 06:46:33', '2021-01-07 12:16:33'),
('023e301710d92e23255fadad2c742f50b8f47c2560107e5e38e56e1c6469cb3cc1215e8052057403', 1173, 1, 'user', '[]', 1, '2019-12-30 07:01:41', '2019-12-30 07:01:41', '2020-12-30 12:31:41'),
('02f47b3a43e8a822b833762ae077c245ebfbaac1a50ee27158393834baea8045592c33c8d403b720', 1162, 1, 'user', '[]', 1, '2019-12-17 06:02:32', '2019-12-17 06:02:32', '2020-12-17 11:32:32'),
('03aa7095c204dc2b3b8d2ba93208620098a77c45f04c8284643f21baf46d4afe336d4a8b84a2a4df', 1165, 1, 'user', '[]', 0, '2020-01-05 23:48:33', '2020-01-05 23:48:33', '2021-01-06 05:18:33'),
('047b6baa57acde5f3fd77ba2aa81a7df4cc42bd27c97d9a5e9868f7be6ca6aabe2793205cc39205b', 1162, 1, 'user', '[]', 1, '2019-12-26 04:50:54', '2019-12-26 04:50:54', '2020-12-26 10:20:54'),
('0585f66a2f77845160862771edf4b1984cdb5eb28344df6bfb0bf7b8a7a86666f5adb92c3ac8a5b2', 1168, 1, 'user', '[]', 1, '2020-01-07 01:40:57', '2020-01-07 01:40:57', '2021-01-07 07:10:57'),
('0586e0ffe7e3fc994acbe72fa7f99af41a7ec4203bcba15d11b972c4c36a8034f23b557fe1795baf', 1166, 1, 'user', '[]', 1, '2020-01-03 00:15:03', '2020-01-03 00:15:03', '2021-01-03 05:45:03'),
('05cccd196369c5fab7d5fccb0a298eb1daea25c7e9e602da90ea3ea079ad26c0f5f35352362e1184', 1162, 1, 'user', '[]', 0, '2019-12-31 04:38:06', '2019-12-31 04:38:06', '2020-12-31 10:08:06'),
('05e7e6d5ca504d04a2eab02b08fcd67e2a40e58aa0aed22bf2c09c12feeae3d1337467e46fe757f4', 1162, 1, 'user', '[]', 0, '2019-12-17 02:14:06', '2019-12-17 02:14:06', '2020-12-17 07:44:06'),
('05f39d34fafc640195226a53a5d15d63b1fad57ae614daef4efe9de873d4a3fe5950c827f96cc7eb', 1170, 1, 'user', '[]', 1, '2020-01-08 00:02:43', '2020-01-08 00:02:43', '2021-01-08 05:32:43'),
('067f48f79ac1c72ca52590b11e82c71636f518abb66a732029f75e0ffc44d9d081c53ced2a5fe10a', 1173, 1, 'user', '[]', 1, '2019-12-26 04:52:58', '2019-12-26 04:52:58', '2020-12-26 10:22:58'),
('06968ae78d65a42e88d8fdc06501865017e33cd12276d78aec2cdf1944c3910b3be903b0cde50ee7', 1162, 1, 'user', '[]', 1, '2020-01-07 05:12:38', '2020-01-07 05:12:38', '2021-01-07 10:42:38'),
('07fbec40ca34903320a50774bc08b2ac24b662561d6854e616df3e1df5ed521b81b9340a0ca05cc6', 1166, 1, 'user', '[]', 1, '2019-12-18 04:36:50', '2019-12-18 04:36:50', '2020-12-18 10:06:50'),
('0904dcf91c98e3d4aafda6c42006061fdfbafd583652cf34e8a68efc4231109ce69a02dcb13a46cc', 1168, 1, 'user', '[]', 0, '2020-01-07 00:04:17', '2020-01-07 00:04:17', '2021-01-07 05:34:17'),
('0942111169e7bdc736bb284490f1bdcddc6e6c4a7a6ab465eb4d75a652672fe089aabaa120f41c81', 1165, 1, 'user', '[]', 1, '2020-01-08 23:21:00', '2020-01-08 23:21:00', '2021-01-09 04:51:00'),
('0a055f59ae3fbdcf549e9fdcee949137dbea39430347e532b59ffd0206e69459e768bf6d3e135258', 1172, 1, 'user', '[]', 1, '2019-12-23 07:15:39', '2019-12-23 07:15:39', '2020-12-23 12:45:39'),
('0c18b1b9bda5b5598cdc3c70280b8b51a41b9a474053c35242a6ab5dfe90fe31662a01a432117132', 1166, 1, 'user', '[]', 0, '2019-12-19 02:16:21', '2019-12-19 02:16:21', '2020-12-19 07:46:21'),
('0db5bfe9f3b3b3ac60078df2d7a79ae44d56e249f0a26355a56f0ed915b97d2f52be7f41d67b4e02', 1166, 1, 'user', '[]', 1, '2020-01-10 05:59:42', '2020-01-10 05:59:42', '2021-01-10 11:29:42'),
('0dfdc7a56ec6452249e96046a876a76268c0720d4493f692c9a5108a55fcde973eb67e55ea0b7bed', 1165, 1, 'user', '[]', 1, '2020-01-07 01:37:12', '2020-01-07 01:37:12', '2021-01-07 07:07:12'),
('0f2a32628b342cf84ae235337eb7eecf487924bc14bd6ea929d473373a7f1e43940ea648f6f72f84', 1162, 1, 'user', '[]', 0, '2020-01-02 02:22:46', '2020-01-02 02:22:46', '2021-01-02 07:52:46'),
('0fa7fa4a25ff51b50fd3551213d316cf9feefc4819ef4a26f60a3fa520670bb132232c961a1d7d7d', 1166, 1, 'user', '[]', 0, '2020-01-06 22:58:33', '2020-01-06 22:58:33', '2021-01-07 04:28:33'),
('1000d98a5ac701bed3a0633ad740b862c2053d081b64897b92b0d73aa7f0469041699b7a7192ffa6', 1165, 1, 'user', '[]', 1, '2019-12-17 23:08:45', '2019-12-17 23:08:45', '2020-12-18 04:38:45'),
('114d9a1acb558f46032c0bffa38a06a9e2b1dc3a1571e9fc06da0d02671022336893ff2af06f1b6a', 1163, 1, 'user', '[]', 0, '2019-12-18 01:43:47', '2019-12-18 01:43:47', '2020-12-18 07:13:47'),
('114f9befa3cb59447c370391958f4ec73334624c3d3255c0602681705a2d57dcfb15062be4a6f3ca', 1165, 1, 'user', '[]', 1, '2019-12-19 23:26:28', '2019-12-19 23:26:28', '2020-12-20 04:56:28'),
('11b9382443c5abbbb57eb75d1c6f931cc0bbd983a5dc97969a24906363917fbfcab0da831d873127', 1172, 1, 'user', '[]', 1, '2020-01-07 05:06:12', '2020-01-07 05:06:12', '2021-01-07 10:36:12'),
('12473afc5fc1d64a0b843bb8c7a57aeec3366dda136e41deb6291ce2494559e92b71229c9a39158c', 1170, 1, 'user', '[]', 1, '2020-01-07 03:43:51', '2020-01-07 03:43:51', '2021-01-07 09:13:51'),
('1354d43bdde32d1ce6549331bfae07aa282cd40eff20932048b9a427f86dda013737cb42f88807fe', 1162, 1, 'user', '[]', 1, '2019-12-26 05:15:28', '2019-12-26 05:15:28', '2020-12-26 10:45:28'),
('151b56a70cd412d6323c8115d7611eda6f7c1885e278a8453226f75ed10dd983633978191f71fea4', 1166, 1, 'user', '[]', 1, '2019-12-23 08:00:20', '2019-12-23 08:00:20', '2020-12-23 13:30:20'),
('16f44ad58a4cfd1b237c55791bf81f5fc8f17dd92bb90c0f4b54126d2a5c2ee5feffed1e69f9d29d', 1162, 1, 'user', '[]', 1, '2019-12-26 05:12:45', '2019-12-26 05:12:45', '2020-12-26 10:42:45'),
('17676ce3c8112a9b2ffcef09273091e94469849e2c28a3fe65f4d6c12cb93f2db355f0a50de6261c', 1166, 1, 'user', '[]', 0, '2019-12-31 06:38:20', '2019-12-31 06:38:20', '2020-12-31 12:08:20'),
('190b56988f9ace23b0639eabc095ebbb8d551c1ed4d49e5c3b411009667bdc8791ab5edf63df64e4', 1165, 1, 'user', '[]', 1, '2020-01-07 01:29:36', '2020-01-07 01:29:36', '2021-01-07 06:59:36'),
('191433f7a778f43fbe763cf02f8b9e30363108b03e38163065ed4630d88cbe5a739b0e94a75f4407', 1166, 1, 'user', '[]', 0, '2020-01-07 00:49:34', '2020-01-07 00:49:34', '2021-01-07 06:19:34'),
('1931a6bbc95fac6ccf694501ef0fa6f8a8e6e1cd4ae9782d1b591c9dbfa0a5074b18286ba67253c0', 1165, 1, 'user', '[]', 1, '2019-12-26 23:17:49', '2019-12-26 23:17:49', '2020-12-27 04:47:49'),
('1bc15aa638b3036f21bf945c349107d079992ef6cae992ee70ad4888aae2628786238bb033587536', 1170, 1, 'user', '[]', 1, '2019-12-26 05:10:44', '2019-12-26 05:10:44', '2020-12-26 10:40:44'),
('1bcbc8e3700b7144394ba376ad5d4b6cb740b8ada905985b340f1c492ff54cad9a81ad1d669c237b', 1165, 1, 'user', '[]', 1, '2019-12-26 01:01:06', '2019-12-26 01:01:06', '2020-12-26 06:31:06'),
('1e6e97116a202441e9c81deb9942050b516fe047bfd85fa40e1a77db28edd51170f7088844aa88b3', 1165, 1, 'user', '[]', 0, '2020-01-02 00:27:28', '2020-01-02 00:27:28', '2021-01-02 05:57:28'),
('1ed36bd68a4daa442cc4ef88341ee1b9b0748dee912a5bd4d842052a2c32bb31c23e8f9e32e2b255', 1162, 1, 'user', '[]', 0, '2020-01-03 07:08:38', '2020-01-03 07:08:38', '2021-01-03 12:38:38'),
('1fed638e5886a5d7dbc84103226a5cbdaccaaf9440b25e2fd9b162780154d9da0824ae3ca40f1f95', 1162, 1, 'user', '[]', 1, '2019-12-26 04:36:05', '2019-12-26 04:36:05', '2020-12-26 10:06:05'),
('208ba9ef5505674b48671dbe7f91bbc5bab018055c9d90b82845432b1841ebafb597d6c0b883ef1e', 1170, 1, 'user', '[]', 1, '2019-12-25 23:48:48', '2019-12-25 23:48:48', '2020-12-26 05:18:48'),
('228cd3473f7e8a5afed9441d8400747e6d4d03799f91b18bf127c7d391a77bcb90a5ed50c0911796', 1179, 1, 'user', '[]', 0, '2020-01-08 23:21:33', '2020-01-08 23:21:33', '2021-01-09 04:51:33'),
('22e2c9e9df8054c6febc82ace00cb8930862993fb3af76397759bd030bffd74f45bedd1546e5fa2d', 1168, 1, 'user', '[]', 1, '2020-01-07 04:39:10', '2020-01-07 04:39:10', '2021-01-07 10:09:10'),
('273de9a52ec6f04ebe8e47da46d558cf05fb34e82b55c324b20d26be2e8d8efbf8ef42485ec9bd89', 1170, 1, 'user', '[]', 1, '2019-12-26 05:21:48', '2019-12-26 05:21:48', '2020-12-26 10:51:48'),
('274a5406326065a671e79b92780e9173052a18f9569b6c3ebe81d91a89c36e1ca0ca521033d1f5cd', 1170, 1, 'user', '[]', 1, '2019-12-26 01:01:26', '2019-12-26 01:01:26', '2020-12-26 06:31:26'),
('27e6a112070cbafda79c47057f64d248fcf3d8984f1be3e4788e9679b3596798f46a31b437d21e0d', 1165, 1, 'user', '[]', 1, '2020-01-06 00:11:49', '2020-01-06 00:11:49', '2021-01-06 05:41:49'),
('2857172229263f70e5439ff184c803ee4a082a28ee8d9f134f2d6c3f288330e787f65c5685b9b6ff', 1174, 1, 'user', '[]', 0, '2019-12-23 10:06:18', '2019-12-23 10:06:18', '2020-12-23 15:36:18'),
('2aaf1446cbe562111808b503f8a6c3aa183cf15a269e32a6b3f2bfef0d28def42006e671e9d4f27d', 1173, 1, 'user', '[]', 1, '2019-12-23 07:56:58', '2019-12-23 07:56:58', '2020-12-23 13:26:58'),
('2b0408e0b025e3515ab6fa93782277723c435dac374f2890a87bab64b7df653b28f840dd6660cbbb', 1166, 1, 'user', '[]', 1, '2019-12-17 23:42:14', '2019-12-17 23:42:14', '2020-12-18 05:12:14'),
('2cc2f324ca08680659581beded762a9b37137aeda8daff6c7fd73f0961d570e7fd5b392f8f4b4b93', 1162, 1, 'user', '[]', 0, '2019-12-19 23:23:00', '2019-12-19 23:23:00', '2020-12-20 04:53:00'),
('2d99d7790cba7d5506719972621ff3036b401ead94aff507a987d80eb11aaff221ee5c81fedfadf6', 1165, 1, 'user', '[]', 1, '2019-12-26 04:38:43', '2019-12-26 04:38:43', '2020-12-26 10:08:43'),
('2df6df7a2dc6745fc6d9ef640d4404b4a14b429edb1d2d14fc75fa0a0d2e92e96790edbed4446d6a', 1163, 1, 'user', '[]', 0, '2019-12-18 04:13:48', '2019-12-18 04:13:48', '2020-12-18 09:43:48'),
('30f4b74e31ac6d7e4508a9c4f520872a2247b812704ca5ec62fdc22dc681b5fa7ef7e61e1424517a', 1179, 1, 'user', '[]', 0, '2020-01-08 00:15:07', '2020-01-08 00:15:07', '2021-01-08 05:45:07'),
('31384018131c9c194d3fdc743bca4bfe8f78333e53f0b10d146589e7b5a28b9fe6de1ff806ca3a88', 1179, 1, 'user', '[]', 0, '2020-01-08 07:27:37', '2020-01-08 07:27:37', '2021-01-08 12:57:37'),
('317086146a65a01823e699397a8f8e5d07b4ceec1341c920f3d3cfe452ee604c9b90181485556516', 1170, 1, 'user', '[]', 1, '2019-12-26 01:07:03', '2019-12-26 01:07:03', '2020-12-26 06:37:03'),
('32b1fbe573d6b0c15b105cc77b542e9e8efef0ce4404b6eadff3f26f18fc93fe48d773dda263ca78', 1171, 1, 'user', '[]', 0, '2019-12-20 03:58:51', '2019-12-20 03:58:51', '2020-12-20 09:28:51'),
('32e5d47f87a1fdf6b275ad49bf73f151c9aef463451a74736ddd8ef22345fa8f10855edfb2273db3', 1166, 1, 'user', '[]', 1, '2020-01-03 01:18:58', '2020-01-03 01:18:58', '2021-01-03 06:48:58'),
('330237c1a8846ead91a025d295ab5a71432044803e66fcd24c16bf4ba56245d776063c02218edfc3', 1162, 1, 'user', '[]', 1, '2020-01-07 23:37:35', '2020-01-07 23:37:35', '2021-01-08 05:07:35'),
('33770e01c43e5411271b6a21877dd41c6dfd4cfc47034552027030ac38e6f7b0a8824176fc80ce1d', 1165, 1, 'user', '[]', 0, '2020-01-05 23:46:06', '2020-01-05 23:46:06', '2021-01-06 05:16:06'),
('33b65b92655174e669a137317650d8df1538bbd2ba5b038751672e46a8af5c93f544e3b57293e115', 1180, 1, 'user', '[]', 0, '2020-01-08 04:08:28', '2020-01-08 04:08:28', '2021-01-08 09:38:28'),
('34d4c8145d560a68da81cacc3586b9929de46ef264b0bd6599e32a2726af273231fce45544b8de07', 1166, 1, 'user', '[]', 0, '2019-12-22 22:58:56', '2019-12-22 22:58:56', '2020-12-23 04:28:56'),
('354679351b7d33df25138e95ccef32fef89a0d6971057ffdc939422528957bcc074673a9a9676d84', 1162, 1, 'user', '[]', 0, '2019-12-23 07:52:27', '2019-12-23 07:52:27', '2020-12-23 13:22:27'),
('381ccda183d95479fdf3cb17033499fe4dd16105381b34bfdf382c27bfb28d4d1b1f744e0520958e', 1172, 1, 'user', '[]', 1, '2020-01-07 02:24:39', '2020-01-07 02:24:39', '2021-01-07 07:54:39'),
('393f246714921688701a23a94abe7d85d36c31a17593085e748026c0b5ea0303261db18ce4c15dfa', 1164, 1, 'user', '[]', 0, '2019-12-17 06:09:41', '2019-12-17 06:09:41', '2020-12-17 11:39:41'),
('39ba84ccb3f8b4dba5e3d7874b0e49d316f3cde53a5cca3311f6e939da554a29c9a4f9a4be65a8ed', 1175, 1, 'user', '[]', 0, '2019-12-23 10:15:41', '2019-12-23 10:15:41', '2020-12-23 15:45:41'),
('3b0786a758fdbb9036124fe0f7006436ae31bb4a422f2202ac54dc539241eb46c96a0a30fb9cc12e', 1179, 1, 'user', '[]', 1, '2020-01-08 07:33:20', '2020-01-08 07:33:20', '2021-01-08 13:03:20'),
('3b9583df5063fd7b80b63389054daf88fe44f9ccb300cc5b8bd7fef8d7ecc56165924c514e4c167a', 1165, 1, 'user', '[]', 1, '2019-12-31 04:34:44', '2019-12-31 04:34:44', '2020-12-31 10:04:44'),
('3cd3af9439af6e60baa3398a6b95a7dfa992451dd3830fe78674caec82ec7ef943b7928784117dca', 1162, 1, 'user', '[]', 1, '2019-12-26 05:11:44', '2019-12-26 05:11:44', '2020-12-26 10:41:44'),
('3d24f908ab910e71f09bb8aa8f1a459511fda08481e7cc358e6faaea29398ef2fc2cd01d5cb97cc4', 1166, 1, 'user', '[]', 0, '2019-12-23 00:07:12', '2019-12-23 00:07:12', '2020-12-23 05:37:12'),
('3d919ab20cb2a930fcf606b3da26565b7e194f1a3c692e1d2e4dd547a6b35be2c2737d7209e5f527', 1166, 1, 'user', '[]', 0, '2020-01-06 23:07:27', '2020-01-06 23:07:27', '2021-01-07 04:37:27'),
('3f331675cc144921078db7c26360b749ac48522a39d6cc7a9fa505cf77ac4cd6ec10a78f8b0d88e5', 1168, 1, 'user', '[]', 1, '2019-12-17 23:46:08', '2019-12-17 23:46:08', '2020-12-18 05:16:08'),
('4129521ca8a39521b8902dcce216a59361fce863571fc42093aaea3546b349a488a3563ab4484a1f', 1173, 1, 'user', '[]', 1, '2019-12-23 07:48:55', '2019-12-23 07:48:55', '2020-12-23 13:18:55'),
('429ca174d88c8bad4c44c0be9c8b9b3770e264d9661dc5f9c062c6df592cc625269cb27b34d49a30', 1167, 1, 'user', '[]', 0, '2019-12-17 23:43:18', '2019-12-17 23:43:18', '2020-12-18 05:13:18'),
('42c5cc623144d0b9d64c6880b82580ba1ae2796ce9e0b351b7cf4955b352386c8ec761f549feb392', 1166, 1, 'user', '[]', 0, '2019-12-17 23:41:48', '2019-12-17 23:41:48', '2020-12-18 05:11:48'),
('43b622bc0870f5551d7cb00e13868664f3da7fd8b11cff0a3468d435383a0c30a38748ebb3585790', 1166, 1, 'user', '[]', 1, '2020-01-03 04:57:18', '2020-01-03 04:57:18', '2021-01-03 10:27:18'),
('43c75f0692101b0cfdf3e66be64a05efb4020eca1539504bc85ea7e78ee655f2d7c9a3acf51433e1', 1165, 1, 'user', '[]', 0, '2019-12-26 00:26:26', '2019-12-26 00:26:26', '2020-12-26 05:56:26'),
('43d13db6de722b90e04c00c8fb256d9783bd18159d297777c9f035c231ee3b4922f171de12a6d602', 1165, 1, 'user', '[]', 0, '2020-01-06 00:09:47', '2020-01-06 00:09:47', '2021-01-06 05:39:47'),
('460b127a9e8a4bc6036395e63c46d42e3e4d229ede501a8435315e47907e2226e4ddc088840d1356', 1179, 1, 'user', '[]', 0, '2020-01-08 06:47:26', '2020-01-08 06:47:26', '2021-01-08 12:17:26'),
('463a8744df260777c906fc972694bc6c5ef59e94c3509ec3f85a8d18811ce534e2fa23a2f02df008', 1168, 1, 'user', '[]', 0, '2019-12-23 05:37:28', '2019-12-23 05:37:28', '2020-12-23 11:07:28'),
('46725099f7644616973dfa0818fa5130eb5ac725daadd121d217c720a1546ac163037b2f2abb78fc', 1162, 1, 'user', '[]', 1, '2019-12-26 05:44:31', '2019-12-26 05:44:31', '2020-12-26 11:14:31'),
('47b04a563e4c8e2cdeda2cdf572ad1e1b49fb6c2919fb40c77883059cad9a4c18f3e45e46975f4c8', 1168, 1, 'user', '[]', 0, '2019-12-17 23:45:02', '2019-12-17 23:45:02', '2020-12-18 05:15:02'),
('482f744b8c81f3e28993c325500dbe048b3542688e20cfb1c5c48a1b99e25b5c55992dedc486a890', 1180, 1, 'user', '[]', 0, '2020-01-08 04:06:31', '2020-01-08 04:06:31', '2021-01-08 09:36:31'),
('48d069d96ddade40124eef17cb886aa7255e339c96dcccae5296a2506fc103b1874881eb3d26199a', 1165, 1, 'user', '[]', 1, '2019-12-26 23:53:37', '2019-12-26 23:53:37', '2020-12-27 05:23:37'),
('48d8378b6c9387f429b5928478f4110af050891179b5a3b8fb7d971387a95983bef5960e7d803988', 1166, 1, 'user', '[]', 0, '2020-01-03 05:19:11', '2020-01-03 05:19:11', '2021-01-03 10:49:11'),
('49150af7c513a23bcbac02d8353456afc5614348423032b40dfdab71e87879a62a8e13ea9d9d94b5', 1173, 1, 'user', '[]', 1, '2019-12-23 07:52:47', '2019-12-23 07:52:47', '2020-12-23 13:22:47'),
('4d1015f9f618fb5c24f81cc293a3e2bbd2bd38c0148cc68242faba241b71a7e663f24a620bcecee7', 1171, 1, 'user', '[]', 0, '2019-12-20 04:04:48', '2019-12-20 04:04:48', '2020-12-20 09:34:48'),
('4d912718790b10454337be1c43cbdbf88c29105d691fc9e6bbc548572f67cd7bbcf57d83f2894301', 1165, 1, 'user', '[]', 1, '2019-12-26 23:56:39', '2019-12-26 23:56:39', '2020-12-27 05:26:39'),
('4e0bb5d7fbeb1244fe6c9758c2948b42ee8b0489f7cd033d528053f0439c595ba434fb147e1dc637', 1163, 1, 'user', '[]', 1, '2019-12-19 23:00:31', '2019-12-19 23:00:31', '2020-12-20 04:30:31'),
('4ea6942d2d00843e9b7e2df13bc3d5bb5845f8555d85695c92a89a70f803715f223fec28cdff8e3b', 1177, 1, 'user', '[]', 1, '2019-12-30 06:25:39', '2019-12-30 06:25:39', '2020-12-30 11:55:39'),
('4ec1cb45a0e1d2d0797b462d5738d833ec31cdf81704067b55373f416f4f06130ec937b41719f978', 1170, 1, 'user', '[]', 1, '2019-12-26 05:13:58', '2019-12-26 05:13:58', '2020-12-26 10:43:58'),
('4ed3643a801ebd852d9d15152b66648d315cb544ae7cfe642b01dc9d52ca3ad74fc8380ea6878a08', 1166, 1, 'user', '[]', 1, '2020-01-07 01:02:45', '2020-01-07 01:02:45', '2021-01-07 06:32:45'),
('512fdfab089dce526492e9510ca9a8109b62d82e1d91844c9811d58aee3ebe2d70671fd66c948510', 1182, 1, 'user', '[]', 1, '2020-01-10 07:36:07', '2020-01-10 07:36:07', '2021-01-10 13:06:07'),
('5200ec4a5ccb83868ecb35ace03fb1dd50c5bdd18d94b88f996e2870ec68e0496792853ad1aaf0a5', 1162, 1, 'user', '[]', 1, '2019-12-30 06:58:43', '2019-12-30 06:58:43', '2020-12-30 12:28:43'),
('5207e95fcc0a7c8757abf18aa9af5423aa86e3b6568c181433d69e5bb012669f354bdb32c7f168d2', 1163, 1, 'user', '[]', 1, '2020-01-07 23:16:08', '2020-01-07 23:16:08', '2021-01-08 04:46:08'),
('5296b7503a6f3b05aa11c65f34b685fd77e04160ab35326bb5d5193489ef40affe720160cc1bd46e', 1165, 1, 'user', '[]', 1, '2019-12-17 23:12:14', '2019-12-17 23:12:14', '2020-12-18 04:42:14'),
('54086a52be706cecb61130a62ebdbba1921fa9a11ad00ef47beb068007a7880db1e50fe808ac7925', 1162, 1, 'user', '[]', 1, '2019-12-23 06:23:13', '2019-12-23 06:23:13', '2020-12-23 11:53:13'),
('54cfced20052e482db7978b69274918c65d4b82fa2f202f0fcf10f8f97e4bb862eb119f76720959b', 1166, 1, 'user', '[]', 1, '2020-01-07 07:59:27', '2020-01-07 07:59:27', '2021-01-07 13:29:27'),
('55c679dd057aa8e273cb4ecd76eb8809a2a8b1f3df9f7e9d27b80d1bad00c38884c4934e895d49b8', 1166, 1, 'user', '[]', 0, '2020-01-07 04:48:31', '2020-01-07 04:48:31', '2021-01-07 10:18:31'),
('5714d875c20d3b31ad2b2b44b44859644c86b68e1d84ea44df11222e7c3d8a2a0335d96337fcfdcd', 1168, 1, 'user', '[]', 1, '2019-12-18 00:02:07', '2019-12-18 00:02:07', '2020-12-18 05:32:07'),
('5756a75ce13dddab7fcddef81311fc9ec0445fb6bd566698ff7e817868e85512df77125d2c7cd4e3', 1170, 1, 'user', '[]', 1, '2020-01-07 07:51:40', '2020-01-07 07:51:40', '2021-01-07 13:21:40'),
('58d528d58eb9010f2575a51e4443ed1d08e9349f6df1a6b936531325b967709f984530979f0e76ce', 1166, 1, 'user', '[]', 0, '2019-12-23 07:16:30', '2019-12-23 07:16:30', '2020-12-23 12:46:30'),
('591667e0525a8e3e8df5c88c2411cab4e0d176745b39626ddef5e221094b643913bcbb2eaa51fd86', 1179, 1, 'user', '[]', 0, '2020-01-07 08:31:21', '2020-01-07 08:31:21', '2021-01-07 14:01:21'),
('5a031fd98f35625236cec251e33c5b301b186331cc5447a5c27567025fd215e5c80935e732f2e63e', 1166, 1, 'user', '[]', 1, '2020-01-02 22:59:34', '2020-01-02 22:59:34', '2021-01-03 04:29:34'),
('5a6a62e66b17bfe4d1662317d329584bce4a808bd063033628a77729ffffa75ad516f832e778abef', 1170, 1, 'user', '[]', 1, '2020-01-07 07:53:53', '2020-01-07 07:53:53', '2021-01-07 13:23:53'),
('5ad62838fb8e28ef4a032a2103da4340dfced734c2cd4046fb71fa3b9957380ecd520ad5be610c2d', 1168, 1, 'user', '[]', 1, '2020-01-07 00:03:44', '2020-01-07 00:03:44', '2021-01-07 05:33:44'),
('5b8f6dd81e66b05d97f40d708efe062e50a78c814589576d0b8058cd166831c55142b8ee367d719a', 1176, 1, 'user', '[]', 0, '2019-12-27 03:56:05', '2019-12-27 03:56:05', '2020-12-27 09:26:05'),
('5bd6f2b2743e9cf48f45622525361360fa074549f8d7e4eeba1cc10d1a3712d55379c47fd2b98ac9', 1172, 1, 'user', '[]', 0, '2019-12-23 07:16:44', '2019-12-23 07:16:44', '2020-12-23 12:46:44'),
('5d96852ad77d06a7bedb34134bed6e705b473c0f0e192f8cd6b4ea3177cd8653d57d3dc394867e4d', 1178, 1, 'user', '[]', 1, '2020-01-03 07:20:59', '2020-01-03 07:20:59', '2021-01-03 12:50:59'),
('5e5c96d76e908bfcb24df904be2f2b503fb5d1bc055319836dd20328e613984725647de67d9dfa82', 1165, 1, 'user', '[]', 0, '2019-12-19 23:46:07', '2019-12-19 23:46:07', '2020-12-20 05:16:07'),
('5edc7fca20de269904a40fb51f2e64c2d6015b65aa9940499d3d9d3f914490e4f547992592a5dc4e', 1168, 1, 'user', '[]', 1, '2020-01-06 23:27:05', '2020-01-06 23:27:05', '2021-01-07 04:57:05'),
('615fb69d76411790eb0c5f8e9da29ddd38dfefa34061f5e48480d83720e8209011a6a8419a817af2', 1173, 1, 'user', '[]', 1, '2019-12-23 08:02:20', '2019-12-23 08:02:20', '2020-12-23 13:32:20'),
('6167a67570ce3b6f8109ff9f7ac49f8ec3c294323c77415c7d9c6995cf467eef6b4a7b7f0631bcdb', 1162, 1, 'user', '[]', 0, '2019-12-23 08:22:53', '2019-12-23 08:22:53', '2020-12-23 13:52:53'),
('6265349627e25060f42ce30a456742f16d79a93e18bbda19b0402bbc23a680124264f481a95a3601', 1170, 1, 'user', '[]', 1, '2019-12-26 01:41:40', '2019-12-26 01:41:40', '2020-12-26 07:11:40'),
('62f9f3f97bd3e64a1df9ee1b329eeaeffe3a4b5c89291869c729868e96f39c491cdfb73e1d8ab410', 1163, 1, 'user', '[]', 1, '2019-12-17 04:54:37', '2019-12-17 04:54:37', '2020-12-17 10:24:37'),
('6337f70ab07930662aa4ff2eecaed264521603777f78d12512fe64183f40b9ae7a9a16fe1ba818be', 1162, 1, 'user', '[]', 1, '2019-12-23 07:54:41', '2019-12-23 07:54:41', '2020-12-23 13:24:41'),
('65486acf04d92ff00322dec0fb164b177226eb6e553bc003476719a8bc9722529848bb1e0350887d', 1165, 1, 'user', '[]', 1, '2019-12-30 04:00:06', '2019-12-30 04:00:06', '2020-12-30 09:30:06'),
('68cb805894f632733c864fa42cd7c4c4c0a003cd8686f08225c25bb42fe8b9159ee429409b903f85', 1170, 1, 'user', '[]', 1, '2019-12-19 23:47:47', '2019-12-19 23:47:47', '2020-12-20 05:17:47'),
('698fab580209c61f72b03f0906d5b9be3895e222949ff3e51142afe8c287e0f67effdd1ad53088b9', 1170, 1, 'user', '[]', 1, '2019-12-19 23:49:13', '2019-12-19 23:49:13', '2020-12-20 05:19:13'),
('69a546aba526248000c696e81032b362132573af3724ac66908f5e547a9025c6326fbae38fc67830', 1173, 1, 'user', '[]', 1, '2019-12-23 07:49:54', '2019-12-23 07:49:54', '2020-12-23 13:19:54'),
('6c2ca189d9c9db2f6ffc9dd7c70c0a8fa2e5469452fc1519bbd4853ce379075f3d2821f026e6b6c9', 1162, 1, 'user', '[]', 1, '2019-12-26 05:22:32', '2019-12-26 05:22:32', '2020-12-26 10:52:32'),
('6c3a452d6bbc614ca8318bd90f5466ec4ee544c0fd8df208ae1c800e4b53e367a3b5810be356d2ac', 1172, 1, 'user', '[]', 1, '2019-12-31 06:01:39', '2019-12-31 06:01:39', '2020-12-31 11:31:39'),
('6c4ccc19a5aa42dd87834ad6fe80aa156caa910f106e69d9d5c3bee4a8491a4079fd65a46df7de13', 1172, 1, 'user', '[]', 1, '2020-01-07 04:05:01', '2020-01-07 04:05:01', '2021-01-07 09:35:01'),
('6c9046c6c98d72292b2a7483c2552fb915f7733fd09ff0630ad00a5891af3995459e560ea557b64b', 1162, 1, 'user', '[]', 0, '2020-01-07 06:18:55', '2020-01-07 06:18:55', '2021-01-07 11:48:55'),
('6ce530a8c031be3fc0c86261c69be59433222175f376a827c94f96719d396f34259c60753490b7ce', 1168, 1, 'user', '[]', 0, '2019-12-17 23:45:30', '2019-12-17 23:45:30', '2020-12-18 05:15:30'),
('6ef844ae738244075eb3004f8b13e37c86f6d81edb964835778a0ffc9eb4627ec45a459445085f49', 1164, 1, 'user', '[]', 1, '2019-12-17 06:10:35', '2019-12-17 06:10:35', '2020-12-17 11:40:35'),
('6f04f0fce52340b182243d76147ec6f22051fc29cf131562a897e1aff8cff7346a9229bc3081f845', 1173, 1, 'user', '[]', 0, '2019-12-23 07:47:19', '2019-12-23 07:47:19', '2020-12-23 13:17:19'),
('6f89c475e719ffef2b837b3a87566467a38d1d59a207f70055a590031d46cade15618d50d52f7b17', 1162, 1, 'user', '[]', 0, '2019-12-23 08:02:57', '2019-12-23 08:02:57', '2020-12-23 13:32:57'),
('70172c2f7b2137799c408915bed56d7e43b261bcacd75db382a941791877ada99db8115ccd903fd1', 1162, 1, 'user', '[]', 1, '2020-01-07 03:50:16', '2020-01-07 03:50:16', '2021-01-07 09:20:16'),
('70a8ab4d184c8e1013d611c6a20bc6329936e8b0688f571985fcd543b67ffb551506fe621541c80c', 1165, 1, 'user', '[]', 1, '2020-01-07 07:19:45', '2020-01-07 07:19:45', '2021-01-07 12:49:45'),
('70cd884180bf325c649d79900df8189077d796e75f7c1f491d7e9c8a2543faf5de7b06ffc0c87411', 1172, 1, 'user', '[]', 1, '2020-01-03 01:16:22', '2020-01-03 01:16:22', '2021-01-03 06:46:22'),
('726b4aa627d6483c5498b02967f9fe02eb0fdef8e800caaa0dcc992da361e800c3cbd8f34878cfe2', 1172, 1, 'user', '[]', 0, '2019-12-31 06:23:38', '2019-12-31 06:23:38', '2020-12-31 11:53:38'),
('72df9a19d0ab9b2b41037e79b971fee9f33d70bb1edeefec315e26dc489d71d2a315feae74f6f741', 1170, 1, 'user', '[]', 1, '2019-12-26 01:37:15', '2019-12-26 01:37:15', '2020-12-26 07:07:15'),
('746ad0941fd0d526f7d6f9aaf5c5c9238c9e5a6c06eeb0735cf0f65b21368f443afa367e7f598dd1', 1166, 1, 'user', '[]', 1, '2020-01-03 01:26:19', '2020-01-03 01:26:19', '2021-01-03 06:56:19'),
('7493a783bc3457f076c294b5a5ef8df240b5efb7ba9a3238913f7bf16ed147c8dc534c04ea159edd', 1170, 1, 'user', '[]', 0, '2019-12-26 23:57:17', '2019-12-26 23:57:17', '2020-12-27 05:27:17'),
('74e742b8e10f2801511788f06e7716fb25a3a689ffdf0c78e85e399459b6d8cbfc33d5f289d00ddd', 1162, 1, 'user', '[]', 1, '2020-01-03 07:19:47', '2020-01-03 07:19:47', '2021-01-03 12:49:47'),
('752310e77384fa9a22f72af0cea189c64d8a3bb8ddd9080fe5d7c60b8b7c847603cd6c7d3b502c07', 1162, 1, 'user', '[]', 1, '2019-12-26 05:10:15', '2019-12-26 05:10:15', '2020-12-26 10:40:15'),
('7541d724598b61d5f69fc15e1931f219546d327366e9b0da012e6417edc461b32748586d74f165b3', 1170, 1, 'user', '[]', 1, '2019-12-26 23:25:39', '2019-12-26 23:25:39', '2020-12-27 04:55:39'),
('78fdd8335bf3837f2012df0ba2c9444d7a1f160106b637d0e31837c040982508ce66e55e4b1801c1', 1181, 1, 'user', '[]', 0, '2020-01-10 06:11:06', '2020-01-10 06:11:06', '2021-01-10 11:41:06'),
('78ff151d22ef73a76268abe573602981c89d31d26fd80c2d8926c4045bb4a7804a43bf2a940819fa', 1163, 1, 'user', '[]', 1, '2019-12-17 04:56:56', '2019-12-17 04:56:56', '2020-12-17 10:26:56'),
('79016bcefdb29632c99f7e491630a22172788eff31778757b1b548533f890f12bffa02dc8a9fb7be', 1166, 1, 'user', '[]', 0, '2020-01-07 00:34:31', '2020-01-07 00:34:31', '2021-01-07 06:04:31'),
('79a52a7bd82333fde1a77f037dc87265b4de30fd57d31fdfcb61a3696ed7cc53032b1a8b26b8d2bf', 1167, 1, 'user', '[]', 0, '2019-12-22 23:01:02', '2019-12-22 23:01:02', '2020-12-23 04:31:02'),
('79c03f3b5cceba742a375957b38e1fabaf873e2954190ec6e58c0c0c36f36acb2127effce7ef0920', 1165, 1, 'user', '[]', 1, '2019-12-26 01:03:16', '2019-12-26 01:03:16', '2020-12-26 06:33:16'),
('7c63881e2801cf93bac541f1d9779c05910bd6946ec43489cf3823f72599aeef487f5d613495407f', 1162, 1, 'user', '[]', 1, '2019-12-26 23:53:55', '2019-12-26 23:53:55', '2020-12-27 05:23:55'),
('7ca5b425f82393124ecbd336db09c1d6fae4dc6c6a75514e4b2d305f9df8f0e0e60e0e8a45414cf2', 1164, 1, 'user', '[]', 0, '2019-12-18 01:44:45', '2019-12-18 01:44:45', '2020-12-18 07:14:45'),
('7ccb309113948f578df29887f51a381794ac5ecbd4e26a16377d19c3a0b0dee649bc499d352446df', 1163, 1, 'user', '[]', 0, '2019-12-17 04:52:39', '2019-12-17 04:52:39', '2020-12-17 10:22:39'),
('7e26e72ab167678bd24be4d962c78434bfae6633a1c9a0ef2cb589a6359f45a27e1b568f63b0f68f', 1165, 1, 'user', '[]', 1, '2019-12-25 23:25:16', '2019-12-25 23:25:16', '2020-12-26 04:55:16'),
('7ebb77ddc17d32df5d80ba63702a6b6f512152ad086f383ba0469d0ce6738896f31af04fafab93b4', 1172, 1, 'user', '[]', 0, '2019-12-23 05:46:24', '2019-12-23 05:46:24', '2020-12-23 11:16:24'),
('7f649c92c9c19fd8d4b825129fe1d31eb1a79d7daa27b683ff1e2141d76488215f69545f30ba1d63', 1165, 1, 'user', '[]', 1, '2019-12-19 23:28:21', '2019-12-19 23:28:21', '2020-12-20 04:58:21'),
('800198012eb94b79aeec62e861d178a63242f5e624bbe450ea1d58f464876b31e3be1f953e36fd55', 1162, 1, 'user', '[]', 1, '2019-12-23 06:11:29', '2019-12-23 06:11:29', '2020-12-23 11:41:29'),
('8037c5745c8be97041c9f9d1f51a67819e78d869c04398ec4d61fb1bc11366024a8ae2b99e13065d', 1165, 1, 'user', '[]', 0, '2020-01-05 23:44:51', '2020-01-05 23:44:51', '2021-01-06 05:14:51'),
('80591547dce9bd7060800f22eec75023f81580aadf2abb14087fe2ac0f0fdcc36e16c7bf238c3560', 1165, 1, 'user', '[]', 1, '2019-12-26 23:52:06', '2019-12-26 23:52:06', '2020-12-27 05:22:06'),
('80904d650bb5919731346435f8353ce9c30309a089f6f868dc49e50857264fe53931a3398d67dfd0', 1169, 1, 'user', '[]', 0, '2019-12-19 07:38:42', '2019-12-19 07:38:42', '2020-12-19 13:08:42'),
('816134614030a58bea3cf06a6bf4d95fb158885ce79ac3368e8e4941f7ccef209a6369c6838af636', 1162, 1, 'user', '[]', 1, '2019-12-26 05:40:53', '2019-12-26 05:40:53', '2020-12-26 11:10:53'),
('81a8f44e05b15b7bf9b376a5fa20adf38035226d769bb24a41ad63b86e6633ea1f4c626a9fe59524', 1165, 1, 'user', '[]', 1, '2019-12-26 01:40:50', '2019-12-26 01:40:50', '2020-12-26 07:10:50'),
('834d2ab551da03b392caca738d210dc338094240515865d16ee3a413dc4892d74a20c1ce26ce625c', 1162, 1, 'user', '[]', 1, '2019-12-17 02:22:15', '2019-12-17 02:22:15', '2020-12-17 07:52:15'),
('837a8bc42e260680a704258b3f2b68694540e2e7d4cbe2c983f35a49afa8ea14f7102b38d6f8da9e', 1163, 1, 'user', '[]', 0, '2020-01-07 07:21:23', '2020-01-07 07:21:23', '2021-01-07 12:51:23'),
('83eedf42052082217df25e43b15cc3ef505737017289f8aca8b20f1f4156b9accfd799d46e427b34', 1170, 1, 'user', '[]', 1, '2019-12-26 05:42:24', '2019-12-26 05:42:24', '2020-12-26 11:12:24'),
('84bd8c1e0ee7e0e9bc64acdd2ddad7710b4628a67c97009211224bfe27f9de4b1d6e47f75dd7f2bb', 1166, 1, 'user', '[]', 0, '2019-12-17 23:40:45', '2019-12-17 23:40:45', '2020-12-18 05:10:45'),
('85123752f687d2f6ba5f293270f053a8e352a3a3597f5abe3eb1e3ecc0361771f3f3d5a6e234afdd', 1163, 1, 'user', '[]', 1, '2019-12-26 23:16:21', '2019-12-26 23:16:21', '2020-12-27 04:46:21'),
('85424ff0af5f5ccb8b497cc754c2793a1aa17911ff27abf8fc39c7dba038357543abd23704136e46', 1165, 1, 'user', '[]', 1, '2019-12-26 05:05:07', '2019-12-26 05:05:07', '2020-12-26 10:35:07'),
('87141bc99a922d904d5edd944f57a1dcf2d29f514e1a7051ab83387b0c9e0b7c1ccd403a0246ff5b', 1173, 1, 'user', '[]', 0, '2019-12-23 07:48:03', '2019-12-23 07:48:03', '2020-12-23 13:18:03'),
('87d6caca67744b0399ec7bafe589eede00524e960c907963dc61dcbf2bc9a893dd97b59f8f29498f', 1165, 1, 'user', '[]', 1, '2019-12-19 23:06:02', '2019-12-19 23:06:02', '2020-12-20 04:36:02'),
('88cb4cad02fb87ee6b08c83f059650f275e868ad37549006a17f3869e706e1145b5b3fcafed257ad', 1166, 1, 'user', '[]', 1, '2020-01-06 23:15:55', '2020-01-06 23:15:55', '2021-01-07 04:45:55'),
('89afa442dd14eee51f77585e239975699e9c24382734abcd2a65356d7f3423cf3243f654dbf9b33a', 1162, 1, 'user', '[]', 1, '2020-01-07 07:44:29', '2020-01-07 07:44:29', '2021-01-07 13:14:29'),
('8a4d3d200807404e497520e14b1577a2f3ac366c4884ec6ab4781c143200f9402858c5214a466939', 1163, 1, 'user', '[]', 1, '2020-01-07 07:41:42', '2020-01-07 07:41:42', '2021-01-07 13:11:42'),
('8b585e52bd16f369581a72c00e0f94d7d05a847f21801b1e362603a2c02df27abb22b9673c159709', 1169, 1, 'user', '[]', 0, '2019-12-19 07:40:16', '2019-12-19 07:40:16', '2020-12-19 13:10:16'),
('8bd79981cf04b6ed10f94593bf9870364a35f6140f234fe2e273b621dc5bc7148a3a5f5dcc77a606', 1170, 1, 'user', '[]', 1, '2020-01-07 07:42:37', '2020-01-07 07:42:37', '2021-01-07 13:12:37'),
('8c063fd1ec58ab5b3e0c6162ce741eb9e8f877e070fd977281bc613d17c6c83698e712807b36ee8c', 1163, 1, 'user', '[]', 1, '2019-12-17 23:11:35', '2019-12-17 23:11:35', '2020-12-18 04:41:35'),
('8d2386f7f1417f4c9ec3b6525f2ac4808532432610bb42e06c291f0ca7f8575ed80898d9a5106b83', 1165, 1, 'user', '[]', 1, '2020-01-08 23:02:16', '2020-01-08 23:02:16', '2021-01-09 04:32:16'),
('8e65900a237d9344572b2192670ffd9cdac1cde0f91a2e32f649c5ede37eacb3a07e733debdb9e71', 1166, 1, 'user', '[]', 1, '2019-12-31 01:32:12', '2019-12-31 01:32:12', '2020-12-31 07:02:12'),
('8e6e1dbca29df0f4499a872c3f2dd8c03ea0b6b0a1649f1c9ef5ed8c7514b4ca3e280481315f74bd', 1172, 1, 'user', '[]', 1, '2019-12-23 05:47:18', '2019-12-23 05:47:18', '2020-12-23 11:17:18'),
('8f5b1902959895be05c8a6aa9f7066b220d0ab57fce39ed8ee6dcbe45e33f28ddd6f20ea940daa04', 1165, 1, 'user', '[]', 1, '2019-12-25 23:20:50', '2019-12-25 23:20:50', '2020-12-26 04:50:50'),
('900325d73bfa098a6313777877f8a8d31dcd74664a09fb96283464f4210bb706aca4c9220b80527a', 1165, 1, 'user', '[]', 1, '2019-12-26 01:36:29', '2019-12-26 01:36:29', '2020-12-26 07:06:29'),
('9301b66f39dffcef4083fe354e5df669ba9d24f4bec097d145cab31e28e8d43915891f7fac63be3e', 1168, 1, 'user', '[]', 1, '2020-01-03 02:16:49', '2020-01-03 02:16:49', '2021-01-03 07:46:49'),
('95bd477a716ebde5ce644d8a481b2f7a2eeeb6db7ae2a5ee2fb2e19e9cfb6ce16dcc363d4964a0e9', 1162, 1, 'user', '[]', 1, '2019-12-23 07:51:26', '2019-12-23 07:51:26', '2020-12-23 13:21:26'),
('95e7217ff9c5002d25ee64141dbabe5787da96560994b8c34739e1ec37942a1a30ec734a8ed663c7', 1172, 1, 'user', '[]', 1, '2020-01-03 05:00:23', '2020-01-03 05:00:23', '2021-01-03 10:30:23'),
('97193727686b5928d874ee0119a1d6aa4c4b97c156ba1c1ca3805d98ab18b64b08fafa32f7f37923', 1162, 1, 'user', '[]', 1, '2019-12-26 05:14:50', '2019-12-26 05:14:50', '2020-12-26 10:44:50'),
('9871b7f7407ca9e03753dab35012e113c6bb4f0c26266c115820585ccabab73ee3d723627b8d24e8', 1166, 1, 'user', '[]', 1, '2020-01-03 01:10:47', '2020-01-03 01:10:47', '2021-01-03 06:40:47'),
('9b80279108fb13d1a89ec99e540eba60a8585864f8c17a4ff392bc198023d88e970e473822ff2361', 1162, 1, 'user', '[]', 1, '2019-12-26 05:08:35', '2019-12-26 05:08:35', '2020-12-26 10:38:35'),
('9fd2e30fd50f84bd62292acb30e35ec3d41cfb1e9647f2e4cb9eb461d4890e3de7f0830740bc7016', 1165, 1, 'user', '[]', 1, '2019-12-18 00:14:07', '2019-12-18 00:14:07', '2020-12-18 05:44:07'),
('a16c1ffcc5ee48982e7412a742fb212ebf34b314d78efa435c388d13ea69004b597ab964372c588c', 1170, 1, 'user', '[]', 1, '2019-12-23 06:21:00', '2019-12-23 06:21:00', '2020-12-23 11:51:00'),
('a196ba2d00078f23f80be56237216398e2bda1e93680ed56a5a55e81bceef54964809b65181fdb90', 1164, 1, 'user', '[]', 1, '2019-12-18 00:06:14', '2019-12-18 00:06:14', '2020-12-18 05:36:14'),
('a1bd0255c046fed0a5e060781a2dc4bef01ecd83d7efbb5219b80015c99d9e8a20ea8499ebdb25ee', 1165, 1, 'user', '[]', 1, '2020-01-07 07:52:03', '2020-01-07 07:52:03', '2021-01-07 13:22:03'),
('a34ddea49965cbc3231322bd86aa2595b40c06edb94c5e2e9574194f4c4eadcef20accd0d3e3b0b7', 1162, 1, 'user', '[]', 0, '2020-01-07 07:40:19', '2020-01-07 07:40:19', '2021-01-07 13:10:19'),
('a47c7cb06bbd2f23b195990a8562645983605bd9f3b49ce23da1dd839d0816466fbca20ee4e6531b', 1162, 1, 'user', '[]', 1, '2020-01-07 23:36:11', '2020-01-07 23:36:11', '2021-01-08 05:06:11'),
('a521f49002a5fdba48c97d739d22344aca348307bbcc128140546063007913791245189c0090d7ec', 1170, 1, 'user', '[]', 1, '2019-12-26 05:24:39', '2019-12-26 05:24:39', '2020-12-26 10:54:39'),
('a60b2ad8bf310bb4ad4cb3f3ab1280cc1eb35ff12dd6f23703b02a02089d79a129bce469d62314af', 1166, 1, 'user', '[]', 0, '2019-12-19 01:26:53', '2019-12-19 01:26:53', '2020-12-19 06:56:53'),
('a886d75c1a18921c8068cf4b99baf8058a33f60403fa8d6150dd2db807f9cab4c039142fe2e7e812', 1166, 1, 'user', '[]', 1, '2019-12-31 06:09:37', '2019-12-31 06:09:37', '2020-12-31 11:39:37'),
('a93701e52b80795ccd98df11e0854dc2839cae94ae3b0600bce34db505b0fb3635878b74a40dcda7', 1162, 1, 'user', '[]', 1, '2020-01-07 23:45:34', '2020-01-07 23:45:34', '2021-01-08 05:15:34'),
('a9a99215a66f885172bc930162ca7aaca74d6dafc8c7b6be89ebb18c414b121e455a8f5e19052792', 1167, 1, 'user', '[]', 0, '2019-12-22 23:00:50', '2019-12-22 23:00:50', '2020-12-23 04:30:50'),
('a9e4b4a228e4e6aac4b0347dfa857ac66cc5dbf7cef7804d8a9a715d64126408d4f3f30177260c9c', 1170, 1, 'user', '[]', 1, '2019-12-26 23:21:17', '2019-12-26 23:21:17', '2020-12-27 04:51:17'),
('ac02acb465e8ffb89f024fb4119da15c0605a178a2443d2f2402e2fcf1988a5b7d7aa2f91c4376f2', 1166, 1, 'user', '[]', 1, '2020-01-06 23:23:43', '2020-01-06 23:23:43', '2021-01-07 04:53:43'),
('acdaaee075ce31b198ddf367a47933f3f236bc853193b52b24935d2f3c0b2b7da3a0b7b237de60c8', 1165, 1, 'user', '[]', 1, '2020-01-02 00:46:20', '2020-01-02 00:46:20', '2021-01-02 06:16:20'),
('ad5a6941b39f8347a10058e347e72f1aaf3bd39102fca34f354d6b1b6d6c834ddb436b65e7ccb72b', 1165, 1, 'user', '[]', 1, '2019-12-25 23:49:42', '2019-12-25 23:49:42', '2020-12-26 05:19:42'),
('af0ea1ddab0ce67679bc6dd65a4645cb05bcff9fdc2d717af73382b952a2f8bf40d815150bd29a28', 1166, 1, 'user', '[]', 0, '2019-12-23 01:29:51', '2019-12-23 01:29:51', '2020-12-23 06:59:51'),
('b08d102358c0b8eece90ff612cede532074411332754542945b3d0b43114947dfa6dc6d7d8afa0c8', 1163, 1, 'user', '[]', 1, '2019-12-17 05:53:09', '2019-12-17 05:53:09', '2020-12-17 11:23:09'),
('b0a2eba4f1a6fd82bc5169aaf50e97adfd90ad0131ea9f2b72c78051ee60c23ddea3be146c13d2dc', 1166, 1, 'user', '[]', 1, '2019-12-23 01:53:41', '2019-12-23 01:53:41', '2020-12-23 07:23:41'),
('b1584c17395d350cbf38610aec659078378f6cb1ce414b92346e4a88bbec18703abf2dd3469bb1c5', 1162, 1, 'user', '[]', 0, '2019-12-23 04:36:20', '2019-12-23 04:36:20', '2020-12-23 10:06:20'),
('b1f6de5b2bca8ad618b5e689b1591ffd6c2a3522f358f75d495ef480d5ab6a6c18e99caf617745d1', 1170, 1, 'user', '[]', 1, '2019-12-26 00:42:18', '2019-12-26 00:42:18', '2020-12-26 06:12:18'),
('b25733b2495819c3bb43a46fd802941221d5d2dcdbe8e94f75eebe43357103aae68658b09d0bcc9d', 1170, 1, 'user', '[]', 1, '2020-01-07 01:29:14', '2020-01-07 01:29:14', '2021-01-07 06:59:14'),
('b44e8bfec55ea7b4b84e5f5140c351dfa8b8623984e961f3c105b9f6c25876b9e8a5feb4ed787f40', 1165, 1, 'user', '[]', 1, '2019-12-26 00:37:14', '2019-12-26 00:37:14', '2020-12-26 06:07:14'),
('b4fa84ba4b4b6a4115efa91f1dae4352d431a2a328bb7420586db8432a69ea0ae3a43b3fd5402bcb', 1165, 1, 'user', '[]', 1, '2019-12-26 05:46:11', '2019-12-26 05:46:11', '2020-12-26 11:16:11'),
('b56fad9bfe0bcc33a84c0351ca812b2a917f72afbb741f1e21b56f07417e7e7fdf3d9a467f1e53d2', 1168, 1, 'user', '[]', 1, '2020-01-07 05:05:12', '2020-01-07 05:05:12', '2021-01-07 10:35:12'),
('b5968c6c904a9b8dec0a4be7857b7e81dbcaa289cd61dc171fc3f0412737a0232c7bac52d3590f21', 1170, 1, 'user', '[]', 1, '2019-12-26 05:09:35', '2019-12-26 05:09:35', '2020-12-26 10:39:35'),
('b5b3fb9b71fdecf90814dc3ea3c61efb78a157abf59acdddeb768ac50c029f4e7e551cc63cfed76b', 1162, 1, 'user', '[]', 1, '2020-01-07 07:43:46', '2020-01-07 07:43:46', '2021-01-07 13:13:46'),
('b5e979dec0205b7bc37de51836e0522c150a4dd9f8561472af269189b3e1bf62a85f73957113b1b9', 1168, 1, 'user', '[]', 1, '2020-01-07 01:04:06', '2020-01-07 01:04:06', '2021-01-07 06:34:06'),
('b8d7915d8885b67294a8aa767edd8de4fce4950a40c9aa4a79d25433d5b9c39c3e06f11a6cb11e30', 1163, 1, 'user', '[]', 0, '2019-12-18 00:09:19', '2019-12-18 00:09:19', '2020-12-18 05:39:19'),
('ba6768537b4f25b83f9c0f001856fbc0100cf705c02e9fc17a4e7e59edce01c7b3ee2008303d7820', 1169, 1, 'user', '[]', 0, '2019-12-19 08:07:55', '2019-12-19 08:07:55', '2020-12-19 13:37:55'),
('bfd32f56838fd83a12c741385fb8623e87d5e306fa8aec75f6125665ad073c559ce7971786602427', 1162, 1, 'user', '[]', 0, '2020-01-07 23:38:44', '2020-01-07 23:38:44', '2021-01-08 05:08:44'),
('c17b809c1cc4f322e0d581c4ec8d4ef1322fe4b2da53f8da0219c7772db09781ac40a53ac504c56c', 1179, 1, 'user', '[]', 0, '2020-01-07 08:32:06', '2020-01-07 08:32:06', '2021-01-07 14:02:06'),
('c206f8bab05cf5bf404cd852690b690aebeb78d98608fd4ea334dd75e32d86e04fb8e1a5e0a9aeac', 1165, 1, 'user', '[]', 1, '2019-12-26 00:38:57', '2019-12-26 00:38:57', '2020-12-26 06:08:57'),
('c4b49a4a694a4d54c3f1a557076036873bedd3b351f986da32bf1efa149e6380775ddfe00ceea9ab', 1162, 1, 'user', '[]', 0, '2019-12-23 08:20:32', '2019-12-23 08:20:32', '2020-12-23 13:50:32'),
('c4fb5ecde38f12019d047d088c672ce0d893f428eedb278600b81134a11346e235bfacc5c97bb552', 1162, 1, 'user', '[]', 1, '2019-12-26 23:17:04', '2019-12-26 23:17:04', '2020-12-27 04:47:04'),
('c594df33fccbb7fd08f4779bf8e1c135d802d57e65c3b9bfdb5b392f0ce7de9990fb382a9513cfe4', 1163, 1, 'user', '[]', 1, '2019-12-18 00:05:16', '2019-12-18 00:05:16', '2020-12-18 05:35:16'),
('ca33f015d30d96597624295c4e970149d28ad6d543ebf6056b7da1dfebd6e2b451886f3b1eeb3665', 1165, 1, 'user', '[]', 1, '2019-12-26 02:25:11', '2019-12-26 02:25:11', '2020-12-26 07:55:11'),
('ca7d96a29edefc22d039293f7ff64f10531d59f3e5f85e9df0f2086aa36807f5b1dee9a60fc1f716', 1165, 1, 'user', '[]', 1, '2019-12-25 23:32:49', '2019-12-25 23:32:49', '2020-12-26 05:02:49'),
('ca81fe4ec9fecb49b54862c2564a83d886ce5e41db36a18d815bac46f02b514e474f152f7c3501b7', 1176, 1, 'user', '[]', 0, '2019-12-27 03:58:49', '2019-12-27 03:58:49', '2020-12-27 09:28:49'),
('ccfb9648a53e8484aef78b63b517b12db6fc4adc118ce42a0e22561184b385be60db8de6a34aa55a', 1170, 1, 'user', '[]', 1, '2019-12-23 07:46:21', '2019-12-23 07:46:21', '2020-12-23 13:16:21'),
('cebf647b0ed0b714ac22902ed2bfc76481da70d1edb3739744207a55778614dd53f9fba3cfb59aaf', 1162, 1, 'user', '[]', 1, '2019-12-17 02:15:40', '2019-12-17 02:15:40', '2020-12-17 07:45:40'),
('cf953ba0e769f838e2547373adfbfeda3fa24180a86712f388eec8e80521d58050fb9f76be5f1ac7', 1165, 1, 'user', '[]', 0, '2019-12-17 23:07:29', '2019-12-17 23:07:29', '2020-12-18 04:37:29'),
('d06d211648456de1d9a10141dcceeda68876b7be98de0510402c0583e2d917836fc01759fac3df78', 1170, 1, 'user', '[]', 1, '2019-12-26 02:25:47', '2019-12-26 02:25:47', '2020-12-26 07:55:47'),
('d11aeb7f5caf528e9901d1a8267b8d2069bd73d87eae8454cee2a1295a4bbdf3cba7e52e3b5d7f83', 1165, 1, 'user', '[]', 1, '2019-12-19 23:40:39', '2019-12-19 23:40:39', '2020-12-20 05:10:39'),
('d2bbf3ce1514504dd1030ad3d508bf257c75884418f3910006732e94e78f5bd2b72b3cc5d0f685ee', 1178, 1, 'user', '[]', 0, '2020-01-03 05:29:33', '2020-01-03 05:29:33', '2021-01-03 10:59:33'),
('d4f8211a7d6f93e8686279aee86eebcb7700e2508ef397b3b706f331a73b89e16c3d3379c509a37c', 1162, 1, 'user', '[]', 1, '2019-12-17 02:28:15', '2019-12-17 02:28:15', '2020-12-17 07:58:15'),
('d77b0075f5ecc4646c79743d98a1a2f32ce4adaee2c17d0d8e061001c811b91791fa62a650dc5202', 1162, 1, 'user', '[]', 1, '2020-01-03 00:18:52', '2020-01-03 00:18:52', '2021-01-03 05:48:52'),
('d97027dd1b2a08b7f166734af8d214feea3df6fae17bea9221405f8498d4566dc1534dd94496df67', 1170, 1, 'user', '[]', 1, '2019-12-25 23:25:31', '2019-12-25 23:25:31', '2020-12-26 04:55:31'),
('dcab8503c1cc9b682e910a158ebf87fd291f68440b2f5a5f7867df247599308fa6822fcd3604be4a', 1165, 1, 'user', '[]', 0, '2020-01-03 07:01:38', '2020-01-03 07:01:38', '2021-01-03 12:31:38'),
('dd36bedaf4872f88ac68a1b7b0704a193b2e503ba9e0a49f7bb3f170ac36ecad89493caa218f1307', 1178, 1, 'user', '[]', 1, '2020-01-03 06:38:02', '2020-01-03 06:38:02', '2021-01-03 12:08:02'),
('dda27c9613213e40d161f5f99e200861d1f306e683501c1b7b29119c680ea8311720b108f292f7ec', 1162, 1, 'user', '[]', 1, '2020-01-07 02:10:11', '2020-01-07 02:10:11', '2021-01-07 07:40:11'),
('ddc1306ce92fe75b404abb19cfed7b54db520196ff2cdfe4a865e88aaccac5057480b2f4ab3a5dfe', 1162, 1, 'user', '[]', 0, '2020-01-03 06:44:47', '2020-01-03 06:44:47', '2021-01-03 12:14:47'),
('dfa414b9bf458f3d507964d5d629231b70102ba9f4f7fe606d485fb8bea0a327ea351406d6cc0f1c', 1170, 1, 'user', '[]', 1, '2019-12-26 00:53:12', '2019-12-26 00:53:12', '2020-12-26 06:23:12'),
('e0204dc3ed87a3a9081062767d561c9157b1ea9716ed6680d5a4b50493fa4e6b47f51a09134e98ed', 1165, 1, 'user', '[]', 1, '2019-12-26 00:54:16', '2019-12-26 00:54:16', '2020-12-26 06:24:16'),
('e15b0def6a1c7c27a1a257e38a6fb639e5c761b0b0bd4cbaa3f96981ca96a3154f4a43518e75ef34', 1166, 1, 'user', '[]', 1, '2020-01-03 04:32:57', '2020-01-03 04:32:57', '2021-01-03 10:02:57'),
('e2bc0f6f781fb7e277debbe8bee9752a04c52f9638595fd7bd61b0d1d77b6d4e2192cc192aea25d7', 1175, 1, 'user', '[]', 0, '2019-12-23 10:11:51', '2019-12-23 10:11:51', '2020-12-23 15:41:51'),
('e335fd5265047ef3316923bee4d583df5bf04b5300bd58ddd00ad37bce094eed2d71a58c2535d039', 1162, 1, 'user', '[]', 1, '2019-12-23 07:42:23', '2019-12-23 07:42:23', '2020-12-23 13:12:23'),
('e5205c77b691499138d21f18f0f524ed7f07159be9c95be664f74f555f4a0bd4991ace5b9d3022ae', 1162, 1, 'user', '[]', 1, '2019-12-26 04:26:16', '2019-12-26 04:26:16', '2020-12-26 09:56:16'),
('e639020b2b9122286eb0246ed07dd2b88d8a9284f9bac30dd8a87853e7dfeb725678704f3f4abc1a', 1172, 1, 'user', '[]', 1, '2020-01-07 01:41:36', '2020-01-07 01:41:36', '2021-01-07 07:11:36'),
('e71c278cd68734d3f00adfe665dbb0d1af465ba26faa3204c8c05715e094a68df272f522dbe30f57', 1165, 1, 'user', '[]', 1, '2019-12-26 02:16:17', '2019-12-26 02:16:17', '2020-12-26 07:46:17'),
('e915a0992bec87c5e1a28fc101167bd7a5c5467063afc1d1ba5b30e0bced9ae1344e6699319a6bec', 1165, 1, 'user', '[]', 1, '2020-01-07 07:42:56', '2020-01-07 07:42:56', '2021-01-07 13:12:56'),
('ebfdbee7ff4266a93ee5c102fa7dded84123c598f1ac300ad782180d54ba7ce6049b2d60384ae2b4', 1165, 1, 'user', '[]', 0, '2020-01-05 23:47:43', '2020-01-05 23:47:43', '2021-01-06 05:17:43'),
('ec025b8376ad215968a11bf93df9ac4abc9abb4c6ee063d94d125faee7f055d7cbaad37841f9f2b6', 1166, 1, 'user', '[]', 1, '2019-12-19 01:02:10', '2019-12-19 01:02:10', '2020-12-19 06:32:10'),
('ecf2ed74727cf0cda17c55aae76b8e1a132a92c70961e569a46af61d735d49173036c35a5b38b641', 1168, 1, 'user', '[]', 0, '2020-01-07 08:17:56', '2020-01-07 08:17:56', '2021-01-07 13:47:56'),
('ee11e77056eb3044e60afc6a64f0be1abb34e32e09de8defae9419ba009da9c9721de815f441f142', 1167, 1, 'user', '[]', 0, '2019-12-17 23:44:13', '2019-12-17 23:44:13', '2020-12-18 05:14:13'),
('ee1e523ceff3ab96fe411729b89de9c0f39bf7a3d2803cef1b97f137547051776e46a6ad2919c087', 1170, 1, 'user', '[]', 0, '2019-12-23 06:36:45', '2019-12-23 06:36:45', '2020-12-23 12:06:45'),
('ee52cc007c49ac5ef9ef953638cd889c1954749a77d34ac4628fce10d35075b6b3902ab8042e6895', 1170, 1, 'user', '[]', 1, '2020-01-07 01:36:38', '2020-01-07 01:36:38', '2021-01-07 07:06:38'),
('f00a6ce04babff9b90ad6e5a4bad5d6f92d4d83c437676ba956cbfba3aab8fec97c8c25d05e9ebfd', 1181, 1, 'user', '[]', 0, '2020-01-10 06:11:56', '2020-01-10 06:11:56', '2021-01-10 11:41:56'),
('f014a5833a8c7e6d384b6789fc62ba0679d833bde07527ca63affcb3c252a1dfaa649baaf5e94feb', 1162, 1, 'user', '[]', 1, '2019-12-30 04:02:31', '2019-12-30 04:02:31', '2020-12-30 09:32:31'),
('f0970e892c9f0708ccec95fcd745fe55fbc1c23d505516b8f30bcb23d15dc2a42e98ec5f9edbe8d0', 1172, 1, 'user', '[]', 1, '2020-01-07 08:18:48', '2020-01-07 08:18:48', '2021-01-07 13:48:48'),
('f11d948f352da0d3ad9e40d7fd25afb5f303a9755c213e2ecf3887d8f91daa7d1c3767b302548a90', 1165, 1, 'user', '[]', 1, '2019-12-26 00:42:51', '2019-12-26 00:42:51', '2020-12-26 06:12:51'),
('f154f2d065d4721ac4136ad1daecf1b55cfc42e2f9f6b0383a749d79dad7c91d970c786376fd79d3', 1162, 1, 'user', '[]', 1, '2019-12-26 23:24:38', '2019-12-26 23:24:38', '2020-12-27 04:54:38'),
('f16cfeec5f1f98ba65a830ec36e129c68c84339c2d52b1dc5f02598489838807949ad36fcc19d14c', 1177, 1, 'user', '[]', 0, '2019-12-30 06:23:34', '2019-12-30 06:23:34', '2020-12-30 11:53:34'),
('f18b864bb33eb2561b9914fe14751e3ef8df222b042c00a5eda20da21b7c7b33b999dcdf042211c7', 1164, 1, 'user', '[]', 0, '2019-12-17 06:17:57', '2019-12-17 06:17:57', '2020-12-17 11:47:57'),
('f25e26615bd1bbdfd8a62dd32a8ec1d8e9d59270bc9c8e5d0fbb8214beb65576d6bdbd2a252fe862', 1170, 1, 'user', '[]', 0, '2019-12-19 23:46:58', '2019-12-19 23:46:58', '2020-12-20 05:16:58'),
('f2fb7a3dd673fcbbe0d32fc1ccf4140a69104eef47e1b18544fa4e5ac0dfd46b5ab1bc7ea1190ec4', 1162, 1, 'user', '[]', 1, '2019-12-26 23:52:37', '2019-12-26 23:52:37', '2020-12-27 05:22:37'),
('f38a1552999d5c5cbc2f38631ec247a414488962dcbc3be414b7979a615447ffc0efe600d6eda44f', 1165, 1, 'user', '[]', 1, '2019-12-26 02:28:19', '2019-12-26 02:28:19', '2020-12-26 07:58:19'),
('f42b05bd80b0dd2859b1ab70ba9b97dd900ef0293bef1bf54bf7b79a4b96fb29ed93661f0a08046c', 1162, 1, 'user', '[]', 1, '2019-12-23 08:01:45', '2019-12-23 08:01:45', '2020-12-23 13:31:45'),
('f5bd9082885493a9d371b22342ebb9ce4579bd18e3312230a032ddeb0aa36d7760c8bb69389aac8a', 1167, 1, 'user', '[]', 0, '2019-12-22 22:59:33', '2019-12-22 22:59:33', '2020-12-23 04:29:33'),
('f703a9e57bbc9ee1867deb23c2fe1c26634efa6d20a76c5a218bb976a1eb8fcc6c9b008b569977cb', 1168, 1, 'user', '[]', 1, '2020-01-03 04:56:35', '2020-01-03 04:56:35', '2021-01-03 10:26:35'),
('f70dd59113ebf76af9f2f8dfb3fc616367526b61e0af54c6173838283dad97111684c251c903bece', 1170, 1, 'user', '[]', 1, '2019-12-26 00:39:11', '2019-12-26 00:39:11', '2020-12-26 06:09:11'),
('f73dd8a651172d5bac937a3099fa4e10b2264cd5fd12244347bbed30a5968f08f1b7a37c1cc38d22', 1165, 1, 'user', '[]', 0, '2019-12-19 07:32:19', '2019-12-19 07:32:19', '2020-12-19 13:02:19'),
('f73f5b7669bceeb515fda959755649b99942d45738956c6e0cf0399581bd63f673b168bd1f6e845c', 1182, 1, 'user', '[]', 0, '2020-01-10 07:32:44', '2020-01-10 07:32:44', '2021-01-10 13:02:44'),
('f7673aa3fe2fe953284a787506ff2d3d45d6e485845bebb311463863bd5d560eea5d5c6fbba6fb69', 1162, 1, 'user', '[]', 1, '2020-01-07 01:38:45', '2020-01-07 01:38:45', '2021-01-07 07:08:45'),
('f862cb368cd88644ab6eae364bff2eea18ea12457724a73b14fbc246ed2cff53c877dd8bb58eaa00', 1168, 1, 'user', '[]', 0, '2019-12-18 04:36:10', '2019-12-18 04:36:10', '2020-12-18 10:06:10'),
('fa204baf2ec6a16d9f12926dfe03f8e3e6fb857efc7067587d4dc49b17693f04559c7e0d6c0c432f', 1165, 1, 'user', '[]', 1, '2019-12-26 00:41:52', '2019-12-26 00:41:52', '2020-12-26 06:11:52'),
('fbcb8488e4de82c0d8ae11d618ab65145f828c64739a6e0fa29d4cd971a6134df7fd95fdd296f3a3', 1165, 1, 'user', '[]', 0, '2019-12-19 08:06:15', '2019-12-19 08:06:15', '2020-12-19 13:36:15'),
('fd283e265c6b8ba9957bad517f1a47ee3f84469cb62153cef3c212da0a56c35ba9aebd76c62e57a7', 1166, 1, 'user', '[]', 1, '2019-12-23 06:37:59', '2019-12-23 06:37:59', '2020-12-23 12:07:59'),
('fd69ad47f4e3d436775278b80636714edcf8c69367d16be6247036f79d191e8f9535562078cf507f', 1168, 1, 'user', '[]', 0, '2019-12-19 02:16:21', '2019-12-19 02:16:21', '2020-12-19 07:46:21'),
('fddcabaac30550b2dab1538bb5f86a8a678c918dd753e588478b783b277595fba237613a6126ad4c', 1162, 1, 'user', '[]', 1, '2019-12-26 04:53:40', '2019-12-26 04:53:40', '2020-12-26 10:23:40'),
('ff804514dc43ffa87c2922cf5ffa40247852014256a73da23192bc5fdd2717593c8129cc4c4cb5e5', 1170, 1, 'user', '[]', 1, '2019-12-26 23:16:44', '2019-12-26 23:16:44', '2020-12-27 04:46:44');

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
-- Table structure for table `paypal_trans`
--

CREATE TABLE `paypal_trans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `plan_started_at` varchar(255) NOT NULL,
  `paypal_token` varchar(255) NOT NULL,
  `paypal_trans_id` varchar(255) DEFAULT NULL,
  `plan_cancelled_at` varchar(255) DEFAULT NULL,
  `plan_status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paypal_trans`
--

INSERT INTO `paypal_trans` (`id`, `user_id`, `plan_id`, `plan_started_at`, `paypal_token`, `paypal_trans_id`, `plan_cancelled_at`, `plan_status`, `created_at`, `updated_at`) VALUES
(19, 1166, 3, '2020-01-08T11:52:22+01:00', 'EC-0M037272WV723234H', 'I-A6K7V3EBF540', '2020-01-09T05:40:53+01:00', '0', '2020-01-08 05:16:55', '2020-01-08 23:08:53'),
(21, 1179, 2, '2020-01-08T13:02:23+01:00', 'EC-0VA257147T4836049', 'I-UT9NWSLCAYP5', '2020-01-10T06:29:22+01:00', '0', '2020-01-08 06:30:29', '2020-01-09 23:57:22'),
(22, 1179, 2, '2020-01-08T13:24:26+01:00', 'EC-7DY35669HE986932V', NULL, '2020-01-10T06:29:22+01:00', '0', '2020-01-08 06:52:32', '2020-01-09 23:57:22'),
(23, 1179, 2, '2020-01-08T14:00:32+01:00', 'EC-06B20202SF3671107', NULL, '2020-01-10T06:29:22+01:00', '0', '2020-01-08 07:28:38', '2020-01-09 23:57:22'),
(24, 1179, 2, '2020-01-09T05:54:00+01:00', 'EC-6CV1400348043553U', 'I-YRD4APU5N1EH', '2020-01-10T06:29:22+01:00', '0', '2020-01-08 23:22:05', '2020-01-09 23:57:22'),
(25, 1179, 3, '2020-01-09T06:11:24+01:00', 'EC-9MS810654F660903A', 'I-KXH472AU1Y95', '2020-01-10T06:29:22+01:00', '0', '2020-01-08 23:39:34', '2020-01-09 23:57:22'),
(27, 1166, 2, '2020-01-10T05:47:29+01:00', 'EC-9UT77361NU661063H', 'I-A5AXMWENBPGP', NULL, '1', '2020-01-09 23:15:33', '2020-01-10 06:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `plan_id` varchar(255) NOT NULL,
  `type` enum('FREE','PREMIUM','VIP') NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float(15,2) NOT NULL,
  `messages` varchar(255) NOT NULL COMMENT 'per day',
  `voice_call` varchar(255) NOT NULL,
  `likes` varchar(255) NOT NULL COMMENT 'per day',
  `swipe` varchar(255) NOT NULL COMMENT 'per week',
  `ads` varchar(255) NOT NULL COMMENT 'per month',
  `see_live_video` varchar(255) NOT NULL,
  `live_video_streaming` varchar(255) NOT NULL COMMENT 'per week',
  `view_storys` varchar(255) NOT NULL COMMENT 'per day',
  `network_marketing` enum('Direct Commission','Binary Plan') NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan_id`, `type`, `name`, `price`, `messages`, `voice_call`, `likes`, `swipe`, `ads`, `see_live_video`, `live_video_streaming`, `view_storys`, `network_marketing`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'FREE', 'Free1', 0.00, '1', 'Unlimited', '20', '1', '1', 'Yes', '1', '5', 'Direct Commission', '1', '2019-12-31 11:21:33', '2020-01-10 02:12:47'),
(2, 'P-55Y31806UJ283263KP3NNDGI', 'PREMIUM', 'Premium', 4.90, '5', 'Unlimited', '50', '3', '4', 'Yes', '3', '50', 'Direct Commission', '1', '2019-12-31 11:24:25', '2020-01-07 07:16:48'),
(3, 'P-6K8439611U726951VP3TICLA', 'VIP', 'V.I.P', 9.90, 'Unlimited', 'Unlimited', 'Unlimited', 'Unlimited', '8', 'Yes', 'Unlimited', 'Unlimited', 'Binary Plan', '1', '2019-12-31 11:26:43', '2020-01-10 02:17:19');

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
(237, 1165, 'SDFS', 'Asd fsdf', '1576645273.png', 0, 1, '2019-12-17 23:31:13', '2019-12-17 23:31:13'),
(238, 1162, 'hey', 'high', '1577099419.png', 0, 1, '2019-12-23 05:40:19', '2019-12-23 05:40:19'),
(239, 1172, 'for sale', 'sale', '1577100009.png', 0, 1, '2019-12-23 05:50:09', '2019-12-23 05:50:09'),
(242, 1162, 'hyy', 'hello', '1577101707.png', 0, 1, '2019-12-23 06:18:27', '2019-12-23 06:18:27'),
(243, 1162, 'hjk', 'hkkk', '1577101742.png', 0, 1, '2019-12-23 06:19:02', '2019-12-23 06:19:02'),
(244, 1172, 'testing', 'snsnnsns', '1577102156.png', 0, 1, '2019-12-23 06:25:56', '2019-12-23 06:25:56'),
(245, 1162, 'hyy', 'hyy', '1577102464.png', 0, 1, '2019-12-23 06:31:04', '2019-12-23 06:31:04'),
(246, 1162, 'ghu', 'hjj', '1577102548.png', 0, 1, '2019-12-23 06:32:28', '2019-12-23 06:32:28'),
(247, 1162, 'bjj', 'hjkj', '1577102623.png', 0, 1, '2019-12-23 06:33:43', '2019-12-23 06:33:43'),
(248, 1162, 'hik', 'hii', '1577102724.png', 0, 1, '2019-12-23 06:35:24', '2019-12-23 06:35:24'),
(249, 1175, 'sSurf and turf', 'Hang lose', '1577174631.png', 0, 1, '2019-12-24 02:33:51', '2019-12-24 02:33:51'),
(250, 1170, 'FGH', 'SA DFSDNfk sfsaf dsfsakdf', '1577341437.png', 0, 1, '2019-12-26 00:53:57', '2019-12-26 00:53:57'),
(251, 1176, 'My Time', 'My Time is coming 😄😎😎😎😛😛😛😛😛😛😛😛😆😆😆😆😆😆😆😱😱😱😱😱😏😏😖😖😬😬😨😨😠😠', '1577439531.png', 0, 1, '2019-12-27 04:08:51', '2019-12-27 04:08:51'),
(252, 1166, 'hyh', 'tybbtrbth', '1577791814.png', 0, 1, '2019-12-31 06:00:15', '2019-12-31 06:00:15'),
(253, 1178, 'life', 'life is unpredictable.', '1578053615.png', 0, 1, '2020-01-03 06:43:35', '2020-01-03 06:43:35');

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

--
-- Dumping data for table `post_ads`
--

INSERT INTO `post_ads` (`id`, `user_id`, `title`, `description`, `post_type`, `image`, `location`, `latitude`, `longitude`, `is_post_anonymously`, `radius`, `status`, `approval`, `created_at`, `updated_at`) VALUES
(1, 1162, 'hey', 'hii', 2, '1577102119.png', 'plot no c, 133, Janakpuri, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.620879000000002', '77.08171', 0, '100.00', 1, '0', '2019-12-23 06:25:19', '2019-12-23 06:25:19'),
(2, 1166, 'title', 'jkn. if vfdvef rf', 1, '1577102473.png', '9VJX+89, Los Altos, CA, USA', '37.3807725', '-122.10151169999999', 0, '47.00', 1, '0', '2019-12-23 06:31:13', '2019-12-23 06:31:13'),
(3, 1175, 'Surf and turf', 'Just do it', 2, '1577174549.png', 'FW8X+8V, 85368 Moosburg, Germany', '48.4658375', '11.949714799999999', 0, '100.00', 1, '0', '2019-12-24 02:32:29', '2019-12-24 02:32:29'),
(4, 1165, 'SFFD', 'Ds lgkhsdfklgd', 1, '1577339862.png', 'Netaji Subhas University of Technology, Mansa Ram Park, New Delhi, 110059, Delhi, India', '28.613179', '77.039279', 0, '100.00', 1, '0', '2019-12-26 00:27:42', '2019-12-26 00:27:42'),
(5, 1170, 'SDGDFSG', 'Sdf gsdf g', 1, '1577341974.png', '20/19, Road Number 19, Central Government Staff Colony, Wadala West, Mumbai, 400031, Maharashtra, India', '19.0176147', '72.8561644', 0, '100.00', 1, '0', '2019-12-26 01:02:54', '2019-12-26 01:02:54'),
(6, 1170, 'SDGDSEFGd', 'Dsg dfsgdsg', 1, '1577347033.png', 'Sansad Marg, Connaught Place, New Delhi, 110001, Delhi, India', '28.6269628', '77.2153959', 0, '100.00', 1, '0', '2019-12-26 02:27:13', '2019-12-26 02:27:13'),
(7, 1177, 'post', 'Hey', 1, '1577707448.png', '136, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.62115778962953', '77.0819699206176', 0, '100.00', 1, '0', '2019-12-30 06:34:08', '2019-12-30 06:34:08'),
(8, 1177, 'connect ad', 'Hey trii', 1, NULL, '136, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.62115778962953', '77.0819699206176', 0, '100.00', 1, '0', '2019-12-30 06:36:32', '2019-12-30 06:36:32'),
(9, 1172, 'testing', 'ArrayList<getHomePostResponse.Data.Datum> filteredList = new ArrayList<>();\n\n            for(getHomePostResponse.Data.Datum s: dataList){\n                if(s.getBlockedBy().equalsIgnoreCase("0")){\n                    filteredList.add(s);\n                }\n            }', 1, '1578391662.png', '550 Almond Ave, Los Altos, CA 94022, USA', '37.383827100000005', '-122.10145229999999', 0, '66.00', 1, '0', '2020-01-07 04:37:42', '2020-01-07 04:37:42');

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
(1, 248, 1162, 1, '2019-12-23 13:52:56', '2019-12-23 13:53:14'),
(2, 237, 1165, 1, '2019-12-26 05:15:55', '2019-12-26 05:15:55'),
(3, 237, 1172, 1, '2020-01-07 13:58:27', '2020-01-07 13:58:27'),
(4, 239, 1172, 1, '2020-01-07 13:58:30', '2020-01-07 13:58:30'),
(5, 244, 1172, 1, '2020-01-07 13:58:33', '2020-01-07 13:58:33'),
(6, 253, 1178, 1, '2020-01-08 04:53:39', '2020-01-08 04:53:39');

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
(1, 978, '5df9ae0ba28f9a31fab995e3', 1, '2019-12-18 04:41:47', '2019-12-18 04:41:47'),
(3, 979, '5df9b67ca28f9a4bbbb995df', 1, '2019-12-18 05:18:00', '2019-12-18 05:18:00'),
(4, 980, '5df9badfa28f9a27cdb995ee', 1, '2019-12-18 05:38:09', '2019-12-18 05:38:09'),
(5, 981, '5df9d314a0eb472ed68cebb4', 1, '2019-12-18 07:19:53', '2019-12-18 07:19:53'),
(6, 982, '5dfb777da0eb4728208cebb6', 1, '2019-12-19 13:13:44', '2019-12-19 13:13:44'),
(7, 985, '5dfc5a40a28f9a16b1b995e3', 1, '2019-12-20 05:21:04', '2019-12-20 05:21:04'),
(9, 988, '5e04850ba0eb476d8a74cf1f', 1, '2019-12-26 10:01:47', '2019-12-26 10:01:47'),
(10, 990, '5e04871da28f9a51949fe3ba', 1, '2019-12-26 10:10:37', '2019-12-26 10:10:37'),
(11, 989, '5e048dc9a0eb4768bc74cf1e', 1, '2019-12-26 10:39:05', '2019-12-26 10:39:05'),
(12, 994, '5e0b3c63a0eb470c5374cf1e', 1, '2019-12-31 12:17:46', '2019-12-31 12:17:46'),
(14, 996, '5e0ee367a0eb47131374cf1f', 1, '2020-01-03 06:47:10', '2020-01-03 06:47:10'),
(15, 997, '5e0ee39ea0eb47155974cf20', 1, '2020-01-03 06:48:03', '2020-01-03 06:48:03'),
(16, 987, '5e0ef0f2a0eb47633e74cf1f', 1, '2020-01-03 07:44:56', '2020-01-03 07:44:56'),
(18, 995, '5e0f326ba0eb47659674cf20', 1, '2020-01-03 12:24:12', '2020-01-03 12:24:12'),
(19, 993, '5e0f381da28f9a5b569fe3bb', 1, '2020-01-03 12:48:35', '2020-01-03 12:48:35'),
(20, 991, '5e0f382ca28f9a5fda9fe3bb', 1, '2020-01-03 12:48:50', '2020-01-03 12:48:50'),
(21, 983, '5e142783a28f9a0e484df2b5', 1, '2020-01-07 06:38:59', '2020-01-07 06:38:59'),
(22, 999, '5e142f39a28f9a7d364df2b4', 1, '2020-01-07 07:12:00', '2020-01-07 07:12:00'),
(23, 1002, '5e147feea0eb4742dee6eda3', 1, '2020-01-07 12:56:19', '2020-01-07 12:56:19'),
(24, 1003, '5e148f9ea28f9a04724df2b5', 1, '2020-01-07 14:03:16', '2020-01-07 14:03:16'),
(25, 1000, '5e155ebea0eb472527e6eda4', 1, '2020-01-08 04:47:00', '2020-01-08 04:47:00'),
(26, 1005, '5e156318a0eb47506be6eda3', 1, '2020-01-08 05:05:32', '2020-01-08 05:05:32'),
(27, 1006, '5e156c84a0eb475a4ce6eda3', 1, '2020-01-08 05:45:40', '2020-01-08 05:45:40'),
(28, 998, '5e16b10ca0eb473cb5ed0d4f', 1, '2020-01-09 04:50:20', '2020-01-09 04:50:20');

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

--
-- Dumping data for table `report_chat`
--

INSERT INTO `report_chat` (`id`, `user_id`, `reported_user_id`, `message`, `report_status`, `created_at`, `updated_at`) VALUES
(1, 1162, 1172, 'not good', '0', '2020-01-07 18:05:28', '2020-01-07 18:05:28'),
(2, 1163, 1165, 'not good', '0', '2020-01-07 18:23:03', '2020-01-07 18:23:03'),
(3, 1163, 1164, 'don\'t wanna talk', '1', '2020-01-07 18:23:18', '2020-01-07 13:03:49'),
(4, 1162, 1163, 'yjuyjujmn', '1', '2020-01-07 18:27:00', '2020-01-07 13:03:40'),
(5, 1162, 1165, 'Fhgfryhrthg', '0', '2020-01-07 18:49:00', '2020-01-07 18:49:00'),
(6, 1166, 1176, 'defef', '0', '2020-01-07 19:15:43', '2020-01-07 19:15:43'),
(7, 1168, 1172, 'jjjn', '0', '2020-01-07 19:20:30', '2020-01-07 19:20:30'),
(8, 1168, 1172, 'hhg', '0', '2020-01-07 19:26:34', '2020-01-07 19:26:34'),
(9, 1168, 1179, 'jjjbb', '0', '2020-01-07 19:34:13', '2020-01-07 19:34:13'),
(10, 1178, 1163, 'not good', '0', '2020-01-08 10:18:42', '2020-01-08 10:18:42'),
(11, 1162, 1178, 'he is not good person', '0', '2020-01-08 10:36:50', '2020-01-08 10:36:50'),
(12, 1179, 1163, 'SDF dfgdfg', '0', '2020-01-08 11:20:48', '2020-01-08 11:20:48');

-- --------------------------------------------------------

--
-- Table structure for table `report_images`
--

CREATE TABLE `report_images` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `type` enum('profile_image','post','post_ad') NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_images`
--

INSERT INTO `report_images` (`id`, `user_id`, `image_id`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1165, 990, 'profile_image', '1', '2019-12-25 23:46:43', '2019-12-26 01:50:10'),
(2, 1170, 248, 'post', '1', '2019-12-26 00:15:22', '2020-01-07 07:30:04'),
(3, 1170, 248, 'post', '1', '2019-12-26 00:25:33', '2020-01-07 07:32:29'),
(6, 1170, 237, 'post', '1', '2019-12-26 01:35:28', '2020-01-07 07:32:01'),
(7, 1170, 5, 'post_ad', '1', '2019-12-26 01:39:24', '2020-01-07 07:32:15'),
(8, 1170, 5, 'post_ad', '1', '2019-12-26 01:39:38', '2020-01-07 07:33:02'),
(9, 1162, 250, 'post', '0', '2019-12-30 06:19:25', '2019-12-30 06:19:25'),
(10, 1177, 6, 'post_ad', '0', '2019-12-30 06:27:43', '2019-12-30 06:27:43'),
(11, 1166, 248, 'post', '0', '2019-12-31 05:19:15', '2019-12-31 05:19:15'),
(12, 1166, 248, 'post', '0', '2019-12-31 05:36:27', '2019-12-31 05:36:27'),
(13, 1166, 247, 'post', '0', '2019-12-31 05:36:34', '2019-12-31 05:36:34'),
(14, 1166, 248, 'post', '0', '2019-12-31 05:49:33', '2019-12-31 05:49:33'),
(15, 1172, 2, 'post', '1', '2019-12-31 06:09:10', '2020-01-07 07:31:32'),
(16, 1172, 2, 'post', '0', '2019-12-31 06:24:45', '2019-12-31 06:24:45'),
(17, 1172, 961, 'profile_image', '1', '2019-12-31 06:44:50', '2020-01-07 07:32:04'),
(18, 1172, 986, 'profile_image', '1', '2019-12-31 06:45:00', '2020-01-07 07:29:59'),
(19, 1172, 2, 'post_ad', '0', '2019-12-31 06:45:15', '2019-12-31 06:45:15'),
(20, 1172, 985, 'profile_image', '0', '2019-12-31 06:47:18', '2019-12-31 06:47:18'),
(21, 1178, 991, 'profile_image', '0', '2020-01-03 06:44:17', '2020-01-03 06:44:17'),
(22, 1162, 252, 'post', '0', '2020-01-03 07:03:06', '2020-01-03 07:03:06'),
(23, 1162, 252, 'post', '0', '2020-01-03 07:03:31', '2020-01-03 07:03:31'),
(24, 1162, 1002, 'profile_image', '0', '2020-01-07 06:46:51', '2020-01-07 06:46:51'),
(25, 1162, 252, 'post', '0', '2020-01-07 06:52:14', '2020-01-07 06:52:14'),
(26, 1163, 980, 'profile_image', '0', '2020-01-07 07:22:38', '2020-01-07 07:22:38'),
(27, 1178, 953, 'profile_image', '0', '2020-01-07 23:32:25', '2020-01-07 23:32:25');

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
(1, 'community_guidelines', 'Community Guidelines', '\n<p align="center"><span style="color: #000000;">Welcome to the LovePush Community! </span></p>\n\n<p align="center"><span style="color: #000000;">In case you\'re straightforward, kind and aware to other people, you\'ll generally be welcome here. </span></p>\n\n<p align="center"><span style="color: #000000;">On the off chance that you decide not to be, you may not last. We will probably enable clients to convey what needs be uninhibitedly as long as it doesn\'t affront others. </span></p>\n\n<p align="center"><span style="color: #000000;">Everybody is held to a similar standard on LovePush. </span></p>\n\n<p align="center"><span style="color: #000000;">We\'re requesting that you be chivalrous, think before you act, and comply with our locale rules both on and disconnected. </span></p>\n\n<p align="center"><span style="color: #000000;">You heard that right: your disconnected conduct can prompt end of your LovePush Account. </span></p>\n\n<p align="center"><span style="color: #000000;">The following is a rundown of our locale arrangements. In the event that you abuse any of these strategies, you may be restricted from LovePush. </span></p>\n\n<p align="center"><span style="color: #000000;">Truly, don\'t make us Swipe Left on you&mdash;in light of the fact that there will be no second chances once we do. </span></p>\n\n<p align="center"><span style="color: #000000;">We energize you to&nbsp;report&nbsp;any conduct that damages our approaches. </span></p>\n\n<p align="center"><span style="color: #000000;">Love Push isn\'t for: </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Nudity/Sexual Content</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">We\'re not requesting that you brush your hair to the other side or even talk in full sentences; however please keep it tasteful and suitable for open utilization. No nakedness, no explicitly unequivocal substance, and don\'t narrative the majority of your sexual wants in your profile. Keep it clean. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Harassment</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Try not to draw in, or urge others to connect with, in any focused on maltreatment or badgering against some other client. This incorporates sending any spontaneous sexual substance to your matches. Reports of stalking, dangers, tormenting, or terrorizing, are paid attention to very. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Violence and Physical Harm</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">We don\'t endure vicious, realistic, or violent substance on Love Push, or any activities or substance that supporter for or undermine brutality of any kind, including compromising or advancing fear based oppression. Physical strike, intimidation, and any demonstrations of brutality are carefully denied. </span></p>\n\n<p align="center"><span style="color: #000000;">Content that supporters for or extols suicide or self-hurt is additionally not permitted. In these circumstances, we may find a way to help the client, incorporating connecting with emergency assets. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Hate Speech</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Any substance that advances, advocates for, or overlooks prejudice, dogmatism, scorn, or brutality against people or gatherings dependent on variables like (yet not restricted to) race, ethnicity, strict alliance, handicap, sex, age, national inception, sexual direction, or sex character isn\'t permitted. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Private Information</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Don\'t openly communicate any private data, yours or anybody else\'s. This incorporates standardized savings numbers, travel papers, passwords, money related data or unlisted contact data, for example, telephone numbers, email addresses, home/place of business. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Spam</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Try not to be phony. Be genuine. Try not to utilize Love Push to drive individuals to outside sites by means of a connection or something else. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Promotion or Solicitation</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Requesting different clients is precluded on Love Push. It\'s fine to welcome your matches to something that you\'re doing, yet on the off chance that the motivation behind your profile is to publicize your occasion or business, non-benefit, political crusade, challenge, or to lead explore, we may erase your record. While we\'re energized that you\'re doing a parody appear one week from now, kindly don\'t utilize Love Push to advance it. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Prostitution and Trafficking</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Advancing or pushing for business sexual administrations, human dealing or other non-consensual sexual acts is carefully disallowed and will bring about your record being prohibited from Love Push. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Scamming</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Love Push has a zero-resistance arrangement on savage conduct of any sort. Anybody endeavoring to get other clients\' private data for false or criminal behavior might be restricted. Any client found sharing their very own budgetary record data (PayPal, Venmo, and so forth.) to get cash from different clients may likewise be prohibited from Love Push. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Impersonation</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Act naturally! Try not to claim to be another person. </span></p>\n\n<p align="center"><span style="color: #000000;">Try not to mimic, or generally distort alliance, association or relationship with, any individual or element. This incorporates farce accounts. While we think your Mike Pence profile is diverting, you aren\'t Mike Pence. What\'s more, on the off chance that you are, what are you doing on Love Push? </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Minors</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">You should be 18 years old or more established to utilize Love Push. In that capacity, we don\'t permit pictures of unaccompanied minors. On the off chance that you need to post photographs of your youngsters, if it\'s not too much trouble ensure that you are in the photograph also. On the off chance that you see a profile that incorporates an unaccompanied minor, urges damage to a minor, or delineates a minor in a sexual or intriguing manner, if it\'s not too much trouble report it right away. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Copyright and Trademark Infringement</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">On the off chance that it\'s not yours, don\'t post it. On the off chance that your Love Push profile incorporates any work that is copyrighted or trademarked by others, don\'t show it, except if you are permitted to do as such. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Illegal Usage</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Try not to utilize Love Push to do anything illicit. In the event that it\'s illicit IRL, it\'s unlawful on Love Push. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>One Person, One Account</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Love Push records can\'t have different proprietors, so don\'t make a record with your companion or noteworthy other. Furthermore, kindly don\'t keep up different Love Push accounts. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Third Party Apps</strong></span></span></strong></span></p>\n\n<p align="center"><span style="color: #000000;">The utilization of any applications made by anybody other than Love Push that guarantee to offer our administration or open extraordinary Love Push highlights (like auto-swipers) isn\'t permitted. </span></p>\n\n<p align="center"><span style="color: #000000;"><strong><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;">Account Dormancy</span></span></strong></strong></span></p>\n\n<p align="center"><span style="color: #000000;">Love Push is enjoyable to utilize... constantly! Use Love Push at the lake, use Love Push while eating cake. Use Love Push when you\'re out, use Love Push if all else fails! In any case, on the off chance that you don\'t sign in to your Love Push account in 2 years, we may erase your record for inertia.</span></p>', '2019-09-04 14:50:10', '2019-09-04 14:50:10'),
(2, 'legacy', 'Legacy', '<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>SIGNING UP TERMS AND CONDITIONS</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">Love-Push is a social media app provided as a platform for meeting and connecting with new people, a forum to have discussions and to share images, live streaming, and other information. We designed it to be a fun place to access and visit, and it is paramount to us to make the Love-Push community continually safe and friendly atmosphere, therefore you agree that you will only use Love-Push in ways that are constantly with the purpose which Love-Push was found and in accordance with these governing terms and conditions, as well as the Love-Push Privacy policy and other subordinate terms. For the purpose of these terms, Love-Push, mean the App and all the affiliated applications or websites (Read Privacy Policy).</span></p>\n\n<p align="left"><span style="color: #000000;">These Terms shall be interpreted as a legal agreement between you as user \n("you") and the Love-Push Company ("us" or "we"). </span></p>\n<p align="left"><span style="color: #000000;">These Terms shall apply whenever you access and visit Love-Push, whether or not you have chosen to sign up with us, therefore please read and understand the terms carefully. By visiting, accessing, using, signing up or receiving services offered through Love-Push, you are accepting and consenting to be bound by these Terms. </span></p>\n\n<p align="left"><span style="color: #000000;">IF YOU DISAGREE WITH ANY OR ALL THE TERMS OF THIS APP THEN YOU \nMUST NOT ACCESS OR/AND USE THE APP. </span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>APP USE AND CONTENT POSTING</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Age Limitations:</strong> For an individual to qualify to access and use Love-Push, the \nindividual must be at least 18/21(in some states) years of age. If an individual is above 18/21(in some states) years of age, but below 18/21(in some states) years, it will be required that such individual seek the consent of your parent or legal guardian’s permission to access and use Love-Push and to agree to the Terms and Conditions.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Personal Use:</strong> By agreeing to these Terms and Conditions, you consent not to \nuse Love-Push for private business purposes; you can only use the Services for non-commercial, own purposes. </span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Your Conduct:</strong> Don\'t abuse Love-Push. You are permitted to use the Services \nprovided as permitted by the applicable law, including export and re-export control regulations and laws. You are solely liable for your conduct and your content (and information) stored in Love-Push servers, and you must conform to our policy. </span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Your Content:</strong>  You retain the ownership of any property rights that you possess \nthrough any content posted via this service. In actual words, what is yours remains yours. </span></p>\n\n\n<p align="left"><span style="color: #000000;">When you submit, upload, store, send and receive content to or via Love-Push, \nyou give us a worldwide license to host, use, modify reproduce, store, create derivative works (which includes those resulting from adaptations, translations or other changes we make in relation with your content so that they fit perfectly with our Services), publish, communicate, distribute and publicly display or perform such content. </span></p>\n\n<p align="left"><span style="color: #000000;">The license you grant to us is for a limited purpose which is intended for smooth \nrunning, operating, promoting and enhancing our Services and to develop new programs and services. </span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Love-Push Services:</strong>  Using Love-Push does not grant you the right of ownership \nto any intellectual property rights in Love-Push or that of the content you access. You may not use the content you acquired from us unless you obtain the prior written permission from the original owner of the content or you are otherwise permitted to do so by the law. These Terms and Conditions do not allow you or grant you the right to use any logos, branding or any other identity used in Love-Push. You are also not allowed to alter, obscure or remove any legal notices displayed in or in connection with Love-Push. </span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Prohibited Use</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">You are not permitted to use or access the App for any unlawful or unsanctioned purpose apart from the purpose approved and made available by Love-Push. The App is strictly for the user\'s personal use and may not be used in connection with any commercial activities apart from those are sanctioned or approved by Love-Push.</span></p>\n\n<p align="left"><span style="color: #000000;">In case of any prohibited activities involving a user, Love-Push reserves the exclusive right to suspend, terminate, block or deactivate the user\'s profile and prohibit the user for further access and use of the service. All Ads and profiles \nthat violate this section will be deleted by the Support, and the Love Points will NOT be refunded.</span></p>\n\n<p align="left"><span style="color: #000000;">Prohibited activities during live streams and love and connection including but not limited to the following: criminal activity, including child pornography (or molestation), sales or advertisement, racism, insults, swear words, sexism, \nrequests for illegal actions, financial crime, trafficking in obscene material, illegal business, gambling, harassment, stalking, spamming, copyright breach, patent violation, or theft of trade ideas; advertising to, or solicitation of, any user to buy or sell any products or services, unless authorized by Love-Push.</span></p>\n\n<p align="left"><span style="color: #000000;">You consent that the outcome of commercial use of the content or materials found on Love-Push may lead to huge financial compensation that is deemed satisfactory as a remedy and that Love-Push will be entitled to temporary or permanent injunctive relief to prohibit and caution such use.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>USER\'S CONDUCT</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">You consent that under no circumstances shall you post, upload, transmit or host \nany content or ad that:</span></p>\n<ul style="padding-left: 30px;">\n<li align="left"><span style="color: #000000;">is illegal or support illegal activities;</li>\n<li align="left"><span style="color: #000000;">is or contains sexually explicit material;</li>\n<li align="left"><span style="color: #000000;">is defamatory, libelous, religious, racism, fraudulent or personally offencive;</li>\n<li align="left"><span style="color: #000000;">impersonates or imitate a person, brand or company with the intent to confuse, deceive or scam others;</li>\n<li align="left"><span style="color: #000000;">contains any viruses, corrupt files, spyware, worm programmes or other harmful or malicious code intended to damage, interrupt or limit the functionality or effectiveness of or disrupt any hardware, software, \nnetworks, servers, telecommunications, or other Love-Push equipment, Trojan horse or any other content or material constructed to damage, interfere with, wrongly expropriate or intercept any data or personal data whether from Love-Push or otherwise;</li>\n<li align="left"><span style="color: #000000;">is prejudiced or intolerant toward any individual or group;</li>\n<li align="left"><span style="color: #000000;">contains any active or current malware or viruses, or uses the platform for exploits and exploit delivery (such as part of a command and control system); or</li>\n<li align="left"><span style="color: #000000;">Using of abusive language is strictly prohibited.</li>\n</ul>\n\n<p align="left"><span style="color: #000000;">violates any intellectual proprietary right of any party, including trademark, copyright, patent, trade secret, publicity rights, or other rights.	You Account will be suspended if you violates any policy,</span></p>\n\n<p align="left"><span style="color: #000000;"><strong style="font-style:italic;">All such content or ad posted will be deleted and spent LovePoints used in posting won\'t be refunded</strong></span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Intellectual Property Right</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">The content of the App including trademarks, logos, and service marks contained therein (collectively called "Marks") are possessed by or licensed to Love-Push, and are subject to copyright and other intellectual property rights in the United \nArab Emirates and applicable international conventions. All source codes, functionality, databases, software, website design, text, video, audio, images, graphics and photographs (collectively called "Love-Push Content") are providedto the user on "AS IS" basis which is meant for the personal use of the user only. Love-Push Content may not be copied, used, published, reproduced, shared, transmitted, broadcasted, displayed, sold, licensed, or otherwise exploited for any other purposes whatsoever without the prior written consent of Love-Push. Systematic retrieval of information or other details from the App to compile or create, whether directly or indirectly, a compilation, database, collection, or directory without prior written prior permission of Love-Push is hereby prohibited.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>External Links</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">To further serve you better, the App may provide some links that direct to external websites which may or may not be affiliated with Love-Push. Love-Pushis not liable or accountable for the content of any website established and control by any other entity apart from Love-Push. These external websites or apps may collect your personal information and additional information pertaining to your \nonline involvement through the use of web beacons, cookies and other similar technologies in a bid to understand your interests and to deliver to \nadvertisements in accordance with your interests. Please be notified that we do not own the websites, and as such, we do not have access to or exercise any control over the information collected by these external websites or services. The information practices of these external websites are not included in this Privacy Policy.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>LIMITATION OF LIABILITY</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">YOU UNDERSTAND THAT, LOVE-PUSH, ITS, DIRECTORS, AFFILIATES, EMPLOYEES, MEMBERS, OR AGENTS WILL NOT, UNDER ANY SITUATION, BE LIABLE OR RESPONSIBLE FOR INDIRECT DAMAGE, BE IT UNUSUAL, OR CONSEQUENTIAL, WHETHER IN CONTRACT OR AN ACTION INCLUDING \nBUT NOT LIMITED TO LOSS OF DATA, LOSS OF USE AND/OR LOSS OF PROFITS; WHETHER INCLUDING BUT NOT LIMITED TO NEGLIGENCE OR, ARISING FROM USAGE OR LACK OF ABILITY TO USE OUR SERVICES AND PROPRIETARY MATERIALS ACCESSED THROUGH OUR SERVICE.</span></p>\n\n<p align="left"><span style="color: #000000;">YOU CANNOT HOLD US RESPONSIBLE OR LIABLE FOR ANY DAMAGE THAT RESULTS FROM OR IS CAUSED BY RELIANCE ON ANY INFORMATION THAT USERS OBTAIN FROM LOVE-PUSH, OR THAT RESULTS FROM MISTAKES, OMISSIONS, INTERRUPTIONS, DELAYS IN TRANSMISSION OR OPERATION \nOR ANY PERFORMANCE FAILURE, DELETION OF FILES, EMAIL DEFECTS, ERRORS, VIRUSES, WHETHER OR NOT IT RESULTS FROM ACTS OF GOD, \nTHEFT, COMMUNICATIONS FAILURE, DESTRUCTION OR ACCESS BY UNAUTHORIZED ENTITIES, TO DATA, PROGRAMS OR SERVICES, MATERIALS AND CONTENT ON LOVE-PUSH \'S APP.</span></p>\n\n<p align="left"><span style="color: #000000;">LOVE-PUSH\'S CUMULATIVE LIABILITY, IN ANY FORM OF ACTION WHATSOEVER, IN CONNECTION WITH THE USE OF OUR SERVICES OR THIS AGREEMENT WILL NOT EXCEED THE CUMULATIVE AMOUNT OF FEES FOR PAID SERVICES THAT YOU PAID NOT LATER THAN SIX MONTHS - THIS IS \nAPPLICABLE UNDER ANY CIRCUMSTANCE AS IT RELATES WITH THE USAGE OF OUR SERVICES.</span></p>\n\n<p align="left"><span style="color: #000000;">TO THE FULL EXTENT PERMISSIBLE BY RELEVANT JURIDICAL LAWS, AND UNDER NO CIRCUMSTANCE SHALL THE COMPANY BE LIABLE FOR ANY DAMAGES WHATSOEVER, WHETHER COMPENSATORY, GENERAL, SPECIAL, INDIRECT, DIRECT, INCIDENTAL AND/OR CONSEQUENTIAL, THAT RELATES \nTO YOUR USE OF THE SERVICES OR THAT OF THE USERS ON THE PLATFORM, THIS IS INCLUDING BUT WITHOUT LIMITATION TO EMOTIONAL DISTRESS, BODILY INJURY, IDENTITY THEFT AND/OR ANY OTHER DAMAGES THAT MAY POSSIBLY RESULT FROM INTERACTIONS AND COMMUNICATIONS WITH OTHER USERS ON OUR APP AND FROM THE \nCONDUCT OF USERS WHO MAY HAVE REGISTERED UNDER FALSE PRETENSES, INCLUDING THOSE WHO MAY ATTEMPT TO DEFRAUD OR HARM YOU.</span></p>\n\n<p align="left"><span style="color: #000000;">IF YOUR COUNTRY AND JURISDICTION DOES NOT ALLOW THE EXCLUSION OF LIABILITY IN CONTRACTS OR LIMITATION WITH CONSUMERS, THE CONTENTS OF THIS SECTION MAY NOT APPLY TO YOU.</span></p>\n\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>DISCLAIMER AND WARRANTY</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">THE INFORMATION, CONTENT, AND SERVICES AVAILABLE THROUGH THE APP (WHETHER PROVIDED BY LOVE-PUSH, YOU, OTHER USERS OR OTHER THIRD PARTIES/AFFILIATES), INCLUDING WITHOUT LIMITATION, SERVICE REQUESTS SUBMISSIONS, TEXT, PHOTOS, GRAPHICS, AUDIO FILES, VIDEO, AND LINKS, ARE PROVIDED "AS IS" AND "AS AVAILABLE" WITHOUT ANY WARRANTIES WHATSOEVER, EITHER EXPRESS OR IMPLIED. TO THE FULLEST \nEXTENT PERMITTED BY LAW, LOVE-PUSH DISCLAIMS ALL WARRANTIES AND REPRESENTATIONS, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED \nTO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A SPECIFIC PURPOSE, TITLE, NONINFRINGEMENT, FREEDOM FROM COMPUTER VIRUS, AND IMPLIED WARRANTIES ARISING DURING THE COURSE OF DEALING OR COURSE OF PERFORMANCE.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>INDEMNIFICATION</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">You consent to indemnify and hold Love-Push, its affiliates, and subsidiaries, directors, officers, employees, agents or contractors harmless from any claim, damage or demand (direct, indirect or consequential), including reasonable attorney\'s fees, made by anyone in relation to your use of the Site, your submissions, with any purported violation of intellectual property or any other \nrights of any person or body pertaining to the Site, your breach of these Terms and Conditions, and any acts or omissions related to the Site</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>GOVERNING LAW</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">These Terms and Conditions shall be construed governed and administered by and interpreted in compliance with the laws of Malta. Any dispute arising in relation to these Terms and Conditions shall be subject to the exclusive jurisdiction of the courts situated in Victoria.</span></p>\n\n<p align="left"><span style="color: #000000;">Any dispute or purported claim arising as a result of this App shall be considered\nunder the laws of Malta. Love-Push is domiciled in Malta.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>YOUR USERNAME AND PASSWORD</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">Do not share your log-in details with any third - party. You are the only person authorized to access and/or use your account with Love-Push. It is your duty to protect your password by not sharing your password with anyone or let any third - party access your account as this endangers the security of all of the personal data and content that you have submitted or uploaded to Love-Push. \nIt\'s your sole responsibility to keep your password secure and secret. If you don\'t, Love-Push is not responsible for any illicit access to or use of your account. If you are suspicious that a third - party has gained access to your account, you must contact us immediately through <a href="mailto:support@love-push.com" style="text-decoration:underline;">support@love-push.com</a> to let us know about your concerns or suspicions. You must also change your password as soon as possible. Love-Push has the right to terminate your account or Ad if you violate our terms on keeping your password and log in details secure</span></p>\n\n<p align="left"><span style="color: #000000;">Users shall be entitled to only one account per each user. We reserve the right \nto terminate duplicate accounts. Furthermore, Love Push will not be responsible for any content posted through any user account nor responsible for fake acounts.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>CONTACT INFORMATION</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">Email: <a href="mailto:support@love-push.com" style="text-decoration:underline;">support@love-push.com</a></span></p>\n\n\n<br><br>\n\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>PRIVACY POLICY</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">Thanks for accessing and using Love-Push! Our purpose is to establish a more \nenlightened way of working with our Users to achieve a better platform whereby Users can enjoy the benefits of Love-Push.</span></p>\n\n<p align="left"><span style="color: #000000;">In this Privacy Policy, we define how we collect, use and handle your \ninformation when you submit them to us via our Services.</span></p>\n\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>INFORMATION COLLECTED AND HOW WE USE SUCH INFORMATION</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">We obtain and use the under listed information to provide, enhance and protect \nour Services:</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Your Personal Information:</strong> Love-Push is a connecting platform for adults, and \nwe provide these services by operating a social network App that allows users the opportunity to connect globally. By joining Love-Push, you enter a legal agreement with us to collect and process your data in order to offer you our service under the terms of this agreement.</span></p>\n\n<p align="left"><span style="color: #000000;">To join the Love-Push network, you will have to complete our online registration \nform, where we may ask you to provide us with information about you such as your name, gender, your date of birth, your email address, your location details,and others as needed. You can also optionally provide other details about yourself. Since you control your user account, these details are at your reach at any time by accessing your "Ad" page, which allows you to update or correct your data at any time by just logging in to Love-Push.</span></p>\n\n<p align="left"><span style="color: #000000;">If you decide to pay for any of our paid services, we will process your payment \ninformation and keep it safe. Under applicable data protection law, it is important for us to collect and use payment data for processing and to assist us in rendering our service to you and our ongoing retention of the data is vindicated by our legitimate interests set out above.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Your Content:</strong> Our Services are designed in such a way that it will be simple for \nyou to upload and store your files, photos, messages, comments, etc. ("Your Content"), team up with others, and work across different devices. For this to be realistic, we store, process and transmit Your Content as well as every information that pertains to it. This pertaining information includes the information you have on your profile that makes it easier team up with others and share Your Content, as well as other details such as file size, the time it was uploaded and usage activity.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Usage Information:</strong> We collect information in connection with your use of the \nService, including your activities or actions you take in your account (such as streaming, viewing, editing, and moving folders or files). This information is used to strengthen and improve our Services, create new features and service, and to protect Love-Push Users. Please contact us for more information about how we use this information to enhance our Services.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Device information.</strong> We also collect information from and about the devices you \nuse to access and use the Services of Love-Push. This includes details such as IP address, the type of device and browser you use, the web page(s) you visited before coming to our sites, and the unique device identifier. Your tools(depending on their settings) may also transmit your location information to the Services.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Cookies and other technologies.</strong> We use technologies like cookies, web beacons, \netc. to provide, enhance, support, protect, and promote our Services. When you visit the section made available on the App, a session ID cookie is \nplaced on your browsing device that will only last through your visiting moment. Love-Push will also place persistent cookies (also referred to as local storage devices) on user’s computers so that Love-Push remembers users and enhance your login experience and make it faster and easier. We may also place persistent tracking cookies on your browsing device, solely for protection and security purposes, so as to prevent scammers, unauthorized login attempts, phishers, and also to help you gain access into your hacked account. However, we do not use any of this information while you logged-off the App</span></p>\n\n<p align="left"><span style="color: #000000;">You can still also set your browser not to accept cookies, but this may limit your \nability to use the Services to the fullest. Following Cookies are Used by Us.</span></p>\n\n<ul style="padding-left: 30px;">\n<li align="left"><span style="color: #000000;">XSRF-TOKEN</li>\n<li align="left"><span style="color: #000000;">love_push_session</li>\n\n</ul>\n\n<p align="left"><span style="color: #000000;"><strong>Bases for processing your information:</strong> We collect and use the personal \ninformation and all other information you submit to us as described above toprovide you the Services most securely and reliably. We also use your details for or legitimate business needs. If we process your details for any other reason not stated herein, we will seek your approval before the time; we will also mandate our service providers to do likewise. For more information about the bases for processing your details, please contact us.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>INFORMATION SHARING</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">Since we will not sell, rent or give your information to advertisers or other third \nparties, we may decide to share your information as described below:</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Our relevant service providers:</strong> Love-Push makes use of some trusted service \nproviders (for instance, for the transaction, customer support and IT management) to assist us in providing, enhancing, protecting and promoting our \nServices. These service providers will have access to your information for the singular purpose of performing their duties to Love-Push in agreement with this Privacy Policy. We will remain liable for the service provider’s handling and management of any of the information they access through our service. For the list of the service providers which we use to process your personal information, please contact us.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Other users:</strong> Our Services display your information such as your name, profile \npicture and email address to other users. You can also share Your Content with other users if you so desire. When you register or subscribe on Love-Push account with an email address on a domain owned by your company, we may assist collaborators to find you by disclosing some of your necessary information (your name, email address and profile picture) to others.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Law, Order and the general interest of the public:</strong> We may disclose or share your \ninformation with a third party if we find out that such disclosure or sharing is \nessential and necessary to:</span></p>\n\n<ul style="padding-left: 20px;">\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">i. to conform with any applicable rule, regulation or law;</li>\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">ii. prevent death or serious personal injury;</li>\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">iii. prevent illegal or unsanctioned transactions of Love-Push or our Users;</li>\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">iv. secure Love-Push’s intellectual property rights, interest or safety; or</li>\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">v. carry out a task in the benefit of the general public.</li>\n\n</ul>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>HOW WE SHARE YOUR INFORMATION</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Security:</strong> We have a team committed to securing your information and checking \nfor weakness in the Services and Site. We also continue to enhance our features to keep your data safe such as encryption of files at rest, and alerts when new devices and apps are linked or connected to your account. We employ the use of the latest automated technologies to detect any misuse of the Services and content that may harm our Services, you, or other users.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>User Controls:</strong>  You can access, view, modify, download, or delete your personal \ninformation by logging into your Love-Push account and going to your account setting page. You can also restrict the way we collect and use your information on the user control page. To learn more about managing your account\'s information generally, please contact us.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong>Information Retention:</strong>  When you create an account, or you subscribe to our \nServices, we will retain your information for as long as your account is active or for as long as we have to provide the Service to you.</span></p>\n<p align="left"><span style="color: #000000;">If you decide to disable your account, please be informed that there might be \nsome cautions in deleting your information from all our servers and backup database. Be advised that we may retain your information for as long as \nnecessary in compliance with all legal obligations, enforce our agreements or resolve disputes.</span></p>\n\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>DATA PROTECTION</strong></span></span></strong></span></p>\n\n\n<p align="left"><span style="color: #000000;">No data on the internet can be guaranteed as secure or safe. We strive to \nsafeguard information but are unable to ensure and cannot warrant the security of any data which you share on the platform or transmit to us. You understand that any information transmitted, submitted or posted on our platform is done at your own risk. Nevertheless, we will take reasonable steps to ensure the security information on our APP.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>YOUR RIGHT TO ACCESS AND CONTROL YOUR INFORMATION</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">You have absolute control over your personal information and how it is \ncollected, used, and shared. For instance, you have a right to:</span></p>\n\n\n<ul style="padding-left: 30px;">\n<li align="left"><span style="color: #000000;">edit or correct personal data. You can manage your account and the \ncontent contained in it, as well as edit some of your personal details.</li>\n</ul>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>CHANGES TO THIS PRIVACY POLICY</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">If there is a chance that we are involved in a merger, acquisition, reorganization, \nor sale of our assets, your information may be transferred as part of the deal. We will promptly notify you via the email associated with your account/profile of any such occurrence and outline your choices to you.</span></p>\n\n<p align="left"><span style="color: #000000;">This Privacy Policy is subject to change frequently. We will post the most recent \nversion on our Site. If the version materially reduces your rights, we will send a notification to you.</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>CONTACT INFORMATION</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">Email: <a style="text-decoration:underline;" href="mailto:support@love-push.com">support@love-push.com</a></span></p>\n\n<br><br>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>SUBSCRIPTION TERMS AND CONDITIONS</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">These Terms shall apply whenever you subscribe for any of our paid services \nthough Love-Push App, therefore please read and understand the terms carefully. By subscribing for any paid services offered through Love-Push, you are accepting and consenting to be bound by the following Terms.</span></p>\n\n<ul style="padding-left: 30px;">\n<li align="left"><span style="color: #000000;">By subscribing for any of our paid packages, the Love-Push have the right \nto deduct any total amount due from the user through any added payment method and have the right to sue any user with an insufficient fund to pay for \nthe amount due to his/her subscribed account</li>\n<li align="left"><span style="color: #000000;">All purchases and contracts made through the App for any package come\nwith a two - weeks cancellation policy.</li>\n<li align="left"><span style="color: #000000;">Non-canceled and every subscription shall be automatically renewed for \nthe preceding month from the 7th day before the end of each month</li>\n<li align="left"><span style="color: #000000;">Every subscription shall be cancellable monthly until one week before the \nend of the month.</li>\n\n</ul>\n\n<p align="left"><span style="color: #000000;">These subscription Terms and Conditions shall be construed governed and\nadministered by and interpreted in compliance with the laws of Malta. Any \ndispute arising in relation to these Terms and Conditions shall be subject to the \nexclusive jurisdiction of the courts situated in Victoria.\n</p>\n<p align="left"><span style="color: #000000;">\nAny dispute or purported claim arising as a result of your subscription through \nthe App shall be considered under the laws of Malta. Love-Push is domiciled in \nMalta</span></p>\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>NETWORK MARKETING/AFFILIATE TERMS AND CONDITIONS</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">These Terms shall apply whenever you sign - up for Love-Push Affiliate program, \ntherefore please read and understand the terms carefully. By signing up as Love-Push Affiliate, you are accepting and consenting to be bound by the following Terms.</span></p>\n\n<ul style="padding-left: 30px;">\n<li align="left"><span style="color: #000000;">Every affiliate user of Love-Push must be over 18/21(in some states) years old</li>\n<li align="left"><span style="color: #000000;">Affiliate commissions are paid with taxes.</li>\n<li align="left"><span style="color: #000000;">Every affiliate shall be responsible for any taxes that may be incurred when \npaying out on his PayPal account.</li>\n\n\n</ul>\n\n<p align="left"><span style="color: #000000;">Every user shall be able to see the team/downline plan up to the 5 level with \nusername, also the team turnover, no matter what plan the user subscription is \neither free, gold or VIP pass.</span></p>\n\n<p align="left"><span style="color: #000000;">However, only if the user agrees to the terms and conditions of the affiliate \nprogram & has active V.I.P. Pass shall have active Partner/Affiliate status, and\nstart receives commissions as follows: (with Free Pass users missed commissions \nare shown)</span></p>\n\n\n<p align="left"><span style="color: #000000;"><strong><span style="font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;"><span style="font-size: large;"><strong>Unilevelplan up to 5 levels 35% commission in total</strong></span></span></strong></span></p>\n\n<p align="left"><span style="color: #000000;">Only achievable with Agreement to this Affiliate Terms and Conditions with \nProgram & active V.I.P. Pass</span></p>\n\n<ul style="padding-left: 20px;">\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">1. Level: 20%</li>\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">2. Level: 5%</li>\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">3. Level: 3%</li>\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">4. Level: 2%</li>\n<li align="left" style="list-style:none;"><span style="color: #000000;list-style:none;">5. Level: 5%</li>\n\n</ul>\n\n<p align="left"><span style="color: #000000;">Withdraw per Paypal once in a month and on the first day of each month \nwith a minimum of $25 balance of your back office. To request at back office\nuntil 25. each pre - month.</span></p>\n\n<p align="left"><span style="color: #000000;">These Affiliate Terms and Conditions shall be construed governed and \nadministered by and interpreted in compliance with the laws of Malta. Any \ndispute arising in relation to these Terms and Conditions shall be subject to the \nexclusive jurisdiction of the courts situated in Victoria.</span></p>\n\n<p align="left"><span style="color: #000000;">Any dispute or purported claim arising as a result of your subscription through \nthe App shall be considered under the laws of Malta. Love-Push is domiciled in \nMalta.</span></p>', '2019-09-04 14:50:10', '2019-09-04 14:50:10');

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
(3800, 316, 1),
(3801, 316, 2),
(3802, 316, 3),
(3803, 316, 4),
(3804, 316, 5),
(3805, 316, 6),
(3806, 316, 7),
(3807, 316, 13),
(3808, 316, 15),
(3809, 316, 16),
(3836, 320, 1),
(3837, 320, 2),
(3838, 320, 3),
(3839, 320, 4),
(3840, 320, 5),
(3841, 320, 6),
(3842, 320, 7),
(3843, 320, 13),
(3874, 324, 1),
(3875, 324, 2),
(3876, 324, 3),
(3877, 324, 4),
(3878, 324, 5),
(3879, 324, 6),
(3880, 324, 7),
(3881, 324, 13),
(3882, 324, 15),
(3883, 324, 16),
(3884, 325, 1),
(3885, 325, 2),
(3886, 325, 3),
(3887, 325, 4),
(3888, 325, 5),
(3889, 325, 6),
(3890, 325, 7),
(3891, 325, 13),
(3892, 325, 15),
(3893, 325, 16);

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
(6100, 3800, 2),
(6101, 3801, 4),
(6102, 3802, 9),
(6103, 3803, 14),
(6104, 3804, 17),
(6105, 3804, 18),
(6106, 3805, 22),
(6107, 3805, 23),
(6108, 3806, 30),
(6109, 3806, 31),
(6110, 3806, 32),
(6111, 3807, 66),
(6112, 3808, 79),
(6113, 3809, 87),
(6155, 3836, 2),
(6156, 3836, 3),
(6157, 3837, 6),
(6158, 3838, 9),
(6159, 3839, 14),
(6160, 3840, 17),
(6161, 3840, 18),
(6162, 3841, 22),
(6163, 3841, 23),
(6164, 3842, 30),
(6165, 3842, 31),
(6166, 3842, 32),
(6167, 3843, 66),
(6212, 3874, 2),
(6213, 3874, 1),
(6214, 3874, 3),
(6215, 3875, 8),
(6216, 3876, 9),
(6217, 3877, 14),
(6218, 3878, 17),
(6219, 3878, 18),
(6220, 3879, 22),
(6221, 3879, 23),
(6222, 3880, 30),
(6223, 3880, 31),
(6224, 3880, 32),
(6225, 3881, 65),
(6226, 3881, 66),
(6227, 3881, 67),
(6228, 3882, 79),
(6229, 3883, 87),
(6230, 3884, 1),
(6231, 3885, 4),
(6232, 3886, 9),
(6233, 3887, 14),
(6234, 3888, 17),
(6235, 3889, 23),
(6236, 3890, 31),
(6237, 3891, 65),
(6238, 3892, 79),
(6239, 3893, 86);

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
(15318, 320, 316, 3836, 3800, '0.00', '0.00', '0.00'),
(15319, 320, 316, 3837, 3801, '0.00', '0.00', '0.00'),
(15320, 320, 316, 3838, 3802, '20.00', '20.00', '20.00'),
(15321, 320, 316, 3839, 3803, '20.00', '20.00', '20.00'),
(15322, 320, 316, 3840, 3804, '80.00', '80.00', '80.00'),
(15323, 320, 316, 3841, 3805, '40.00', '40.00', '40.00'),
(15324, 320, 316, 3842, 3806, '60.00', '40.00', '40.00'),
(15325, 320, 316, 3843, 3807, '20.00', '60.00', '20.00'),
(15418, 324, 316, 3874, 3800, '0.00', '0.00', '0.00'),
(15419, 324, 316, 3875, 3801, '0.00', '0.00', '0.00'),
(15420, 324, 316, 3876, 3802, '20.00', '20.00', '20.00'),
(15421, 324, 316, 3877, 3803, '20.00', '20.00', '20.00'),
(15422, 324, 316, 3878, 3804, '80.00', '80.00', '80.00'),
(15423, 324, 316, 3879, 3805, '40.00', '40.00', '40.00'),
(15424, 324, 316, 3880, 3806, '60.00', '40.00', '40.00'),
(15425, 324, 316, 3881, 3807, '20.00', '60.00', '20.00'),
(15426, 324, 320, 3874, 3836, '0.00', '0.00', '0.00'),
(15427, 324, 320, 3875, 3837, '0.00', '0.00', '0.00'),
(15428, 324, 320, 3876, 3838, '20.00', '20.00', '20.00'),
(15429, 324, 320, 3877, 3839, '20.00', '20.00', '20.00'),
(15430, 324, 320, 3878, 3840, '80.00', '80.00', '80.00'),
(15431, 324, 320, 3879, 3841, '40.00', '40.00', '40.00'),
(15432, 324, 320, 3880, 3842, '60.00', '40.00', '40.00'),
(15433, 324, 320, 3881, 3843, '20.00', '60.00', '20.00'),
(15436, 324, 316, 3882, 3808, '20.00', '60.00', '20.00'),
(15437, 324, 316, 3883, 3809, '20.00', '20.00', '20.00'),
(15438, 325, 316, 3884, 3800, '0.00', '0.00', '0.00'),
(15439, 325, 316, 3885, 3801, '0.00', '0.00', '0.00'),
(15440, 325, 316, 3886, 3802, '20.00', '20.00', '20.00'),
(15441, 325, 316, 3887, 3803, '20.00', '20.00', '20.00'),
(15442, 325, 316, 3888, 3804, '40.00', '80.00', '40.00'),
(15443, 325, 316, 3889, 3805, '20.00', '40.00', '20.00'),
(15444, 325, 316, 3890, 3806, '20.00', '40.00', '20.00'),
(15445, 325, 316, 3891, 3807, '5.00', '60.00', '5.00'),
(15446, 325, 320, 3884, 3836, '0.00', '0.00', '0.00'),
(15447, 325, 320, 3885, 3837, '0.00', '0.00', '0.00'),
(15448, 325, 320, 3886, 3838, '20.00', '20.00', '20.00'),
(15449, 325, 320, 3887, 3839, '20.00', '20.00', '20.00'),
(15450, 325, 320, 3888, 3840, '40.00', '80.00', '40.00'),
(15451, 325, 320, 3889, 3841, '20.00', '40.00', '20.00'),
(15452, 325, 320, 3890, 3842, '20.00', '40.00', '20.00'),
(15453, 325, 320, 3891, 3843, '5.00', '60.00', '5.00'),
(15454, 325, 324, 3884, 3874, '0.00', '0.00', '0.00'),
(15455, 325, 324, 3885, 3875, '0.00', '0.00', '0.00'),
(15456, 325, 324, 3886, 3876, '20.00', '20.00', '20.00'),
(15457, 325, 324, 3887, 3877, '20.00', '20.00', '20.00'),
(15458, 325, 324, 3888, 3878, '40.00', '80.00', '40.00'),
(15459, 325, 324, 3889, 3879, '20.00', '40.00', '20.00'),
(15460, 325, 324, 3890, 3880, '20.00', '40.00', '20.00'),
(15461, 325, 324, 3891, 3881, '20.00', '60.00', '20.00'),
(15462, 325, 316, 3892, 3808, '20.00', '60.00', '20.00'),
(15463, 325, 316, 3893, 3809, '10.00', '20.00', '10.00'),
(15464, 325, 324, 3892, 3882, '20.00', '60.00', '20.00'),
(15465, 325, 324, 3893, 3883, '10.00', '20.00', '10.00');

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
(1956, 320, 316, '220.00'),
(1967, 324, 316, '260.00'),
(1968, 324, 320, '220.00'),
(1969, 325, 316, '155.00'),
(1970, 325, 320, '125.00'),
(1971, 325, 324, '170.00');

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
(1162, 'en', 'Jim', 'jim', 'jim@mailinator.com', 2, 1, NULL, 20, '2019-12-17 02:14:38', NULL, 'Manimajra, Chandigarh, 160101, Chandigarh, India', '30.727994845683504', '76.84607024218354', '+1', '', '$2y$10$e6jIzz6gL9a02goUf/ArVOSkMmdCoVulYeXfW4oFNfbTd6YCjP7cS', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, '1698b537cfaf1a3225a95aa673f53b95bd7143fce1ba91e86f18099bbcf91596', 2, 'http://14.141.175.109/lovepush/public/profile/824841578055191.', '1163,1165,1166,1170,1172,1177', '1161,1173,1178', NULL, '1163,1164,1165,1166,1168,1169,1170,1171,1172,1175,1176,1177', '1161,1173,1178,1179', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MHRKBZ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-17 02:14:03', '2020-01-08 03:58:39', NULL, '101617377'),
(1163, 'en', 'tina', 'Tina', 'tina@mailinator.com', 2, 1, NULL, 21, '2019-12-17 04:53:11', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210312', '77.0818137', '+1', '', '$2y$10$IiQ6sLma9ubxMJH/JCbobuSC/HNiDZd3mvL9o65estvLGXSRf/v2u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, '1576578277.jpg', '1162,1164,1165,1168,1177,1178,1179', NULL, NULL, '1161,1162,1164,1165,1168,1171,1173,1175,1176,1177,1178,1179', '1169,1170,1178', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MLVFFU', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-17 04:52:36', '2020-01-08 00:15:12', NULL, '101623071'),
(1164, 'en', 'Bob', 'bob', 'bob@mailinator.com', 1, 1, NULL, 21, '2019-12-17 06:10:04', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210333', '77.0818182', '+1', '', '$2y$10$/Ioz6eRvIroLsrPrZzW0rebymDCSuLOBew5YS1jxOSwqRyp28ZPCW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, '1576582835.jpg', '1163,1168', NULL, NULL, '1161,1163,1168,1176', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'JICN9E', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-17 06:09:37', '2020-01-07 07:33:56', NULL, '101624849'),
(1165, 'en', 'TTMP', 'LKM', 'lkm@mailinator.com', 1, 1, NULL, 20, '2019-12-17 23:08:09', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210315', '77.0818119', '+1', '', '$2y$10$s/jF.VhzV.av3kok1ZrzJ.7GorF8sjs7iabIi1rOr74gh1pMGT8ty', 'Daily Activities,Friendship', 1, NULL, NULL, NULL, NULL, 'sdfds', 'sdf', 'sdfsf', NULL, 'Sdfa fsdafd sfewra werfdsfsdfssd', 1, 1, 1, 3, 1, '5db06c202d063dd1cbeafa58080400bb36c06cf769473a97afae2f0c6b19e69d', 2, '1577949470.png', '1162,1163,1169,1172,1176', '1161,1168,1170,1177,1178', NULL, '1162,1163,1164,1166,1169,1171,1172,1173,1175,1176', '1161,1168,1170,1177,1178', NULL, 'asfdsf', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'AGXV5M', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-17 23:07:26', '2020-01-08 23:03:15', NULL, '101646979'),
(1166, 'en', 'Singh', 'mk singh', 'a@mailinator.com', 1, 1, NULL, 23, '2019-12-17 23:41:02', NULL, '25 Doud Dr, Los Altos, CA 94022, USA', '37.381726666666665', '-122.10183333333335', '+1', '', '$2y$10$mxqmRmofTXJFoPsGLIzGLu0IeWl09Hz9R5dJCr58awaXLM4imOJuq', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, '1698b537cfaf1a3225a95aa673f53b95bd7143fce1ba91e86f18099bbcf91596', 2, '226581578048664.jpg', '1161,1162,1168,1172,1176', NULL, NULL, '1161,1162,1163,1164,1165,1168,1169,1170,1171,1172,1175,1176,1177', '1173', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'HW1IB3', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-17 23:40:42', '2020-01-10 06:09:49', NULL, '101647622'),
(1167, 'en', '', 'Mp joes', 'b@mailinator.com', 1, 1, NULL, NULL, NULL, 9740, NULL, NULL, NULL, '+1', '', '$2y$10$wxJdjnaNUUaiBtMiYjJdSOvn0rZXQU2UZe7hg0LvUMS1WcSdmaKm.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'FJXKV0', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-17 23:43:15', '2019-12-17 23:44:15', NULL, '101647680'),
(1168, 'en', 'joe', 'joe lo', 'd@mailinator.com', 1, 1, NULL, 23, '2019-12-17 23:45:42', NULL, '25 Doud Dr, Los Altos, CA 94022, USA', '37.381726666666665', '-122.10183333333335', '+1', '', '$2y$10$/i7idjKeuntjeBReFc2MvOlo/gODOLs1R9XwMjts0R4rLx0vygqoS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, '1698b537cfaf1a3225a95aa673f53b95bd7143fce1ba91e86f18099bbcf91596', 2, '1576646167.jpg', '1163,1164,1166,1172,1179', '1165', NULL, '1162,1163,1164,1165,1166,1169,1170,1171,1172,1179', '1165', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'K26JAB', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-17 23:44:59', '2020-01-08 01:34:05', NULL, '101647709'),
(1169, 'en', 'HMIT', 'harrymit94', 'sharmahardik980@gmail.com', 1, 1, NULL, 25, '2019-12-18 19:39:06', NULL, '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '37.421998333333335', '-122.08400000000002', '+1', '', '$2y$10$Vb6jrbw4pY6YfhI9zNQHzezS.pdFxfojRl/HK97k7gVMrGrLa5W9m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, '1576761016.jpg', '1165', NULL, NULL, '1162,1165', '1163,1170', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'AVSMID', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-19 07:38:36', '2020-01-07 07:22:01', NULL, '101681319'),
(1170, 'en', 'Tom Kayuri', 'Tom', 'tom@mailinator.com', 1, 1, NULL, 20, '2019-12-19 23:47:19', NULL, '20/19, Road Number 19, Central Government Staff Colony, Wadala West, Mumbai, 400031, Maharashtra, India', '19.017615', '72.8561644', '+1', '', '$2y$10$4ucBHwSvkiNgwzwo7Y2NrOn2YLNQEQEy7zJdBNJE.2hVB5V78AGMm', 'Daily Activities,No Expectation', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, '435781577103068.jpg', '1162', '1165', NULL, '1162,1163,1164,1166,1168,1171,1172,1176', '1163,1165,1169,1177,1178', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'L8RPYG', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-19 23:46:49', '2020-01-08 00:05:15', NULL, '101694024'),
(1171, 'en', 'Row', 'Jonny', 'johny.remy@web.de', 1, 1, NULL, 28, '2019-12-20 04:02:57', NULL, 'Isarstraße 4, 85368 Moosburg an der Isar, Germany', '48.4658314', '11.9496783', '+1', '', '$2y$10$eG5Vh.GVha1uH0skp19uwuz260zXOuCW/FXreOJ/DskteLmMNj.fq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, '1576834487.jpg', NULL, NULL, NULL, '1162,1163,1177', '1175,1178,1180', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'VRTUNX', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-20 03:58:35', '2020-01-08 04:09:07', NULL, '101698427'),
(1172, 'en', 'manish kumar', 'manish singh', 'c@mailinator.com', 1, 1, NULL, 22, '2019-12-23 05:46:31', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Phase - I, Manimajra, Sukteri, Haryana 134114, India', '30.7280771', '76.8462433', '+1', '', '$2y$10$olnOKJO6mhwqMwHOHLX4AOHLys5eX8RAj.8jn9f7CdR3euMszrcAC', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, '482121577105410.jpg', '1162,1165,1166,1168,1176', NULL, NULL, '1162,1163,1164,1165,1166,1168,1169,1170,1171,1176,1179', '1178', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'RUTMB5', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-23 05:46:16', '2020-01-07 23:23:27', NULL, '101758518'),
(1173, 'en', 'hey', 'hey', 'hey@mailinator.com', 2, 1, NULL, 21, '2019-12-22 19:48:24', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.62107200085057', '77.081886436862', '+1', '', '$2y$10$RhmIvMdNSsVe6B9NTriU0.F18EPgT30n9wyxCqB9u9z6E.jQh99lK', 'No Expectation,', 0, NULL, 0, NULL, NULL, 'dubai', 'analyst', 'dancing', NULL, 'hy guys have a ssbsbjsjsnnsns jsjjsj\nddj', 1, 1, 3, 3, 1, '5db06c202d063dd1cbeafa58080400bb36c06cf769473a97afae2f0c6b19e69d', 2, '1577107134.jpg', NULL, '1162', NULL, '1163,1176,1179', '1162,1166', NULL, 'gshsh', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'QFPGJE', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-23 07:47:13', '2020-01-07 08:32:26', NULL, '101760084'),
(1174, 'en', '', 'Joenn', 's-jreic2@haw-landshut.de', 1, 1, NULL, NULL, NULL, 3084, NULL, NULL, NULL, '+1', '', '$2y$10$M8R9nYftBZu1vp14Kko/3eLrIb3BUKp3WDLqo34CwvbYZLP4Bmp7G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'JNQ6QU', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-23 10:06:13', '2019-12-23 10:06:14', NULL, ''),
(1175, 'en', 'Hey', 'Joenny', 'jerr101@student.anglia.ac.uk', 1, 1, NULL, 28, '2019-12-22 22:12:17', NULL, 'Isarstraße 4, 85368 Moosburg an der Isar, Germany', '48.4658252', '11.9497144', '+1', '', '$2y$10$.QcxpaU57BjVZLlwX3RcleZvhq7jPzLfDwyrSK8cYYmlOpMaHM/Ia', 'Relationship, Friendship, Daily Activities', 0, NULL, 0, NULL, NULL, 'Bali', 'Hustler', 'Rowing', NULL, 'Live life with love', 1, 1, 1, 3, 1, NULL, 1, '1577115941.jpg', NULL, NULL, NULL, '1163', '1171,1177,1180', NULL, 'English, German', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'SQRMAG', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-23 10:11:49', '2020-01-08 04:09:16', NULL, '101762237'),
(1176, 'en', 'lanaslav', 'lana', 'lanaslav@mailinator.com', 2, 1, NULL, 20, '2019-12-27 03:56:29', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210451', '77.0818301', '+1', '', '$2y$10$l/F79TmY/EcItlLbKzNLIeYecrUiqIdwmWglouxBCb9/0szM.6/Gq', 'Relationship', 1, NULL, NULL, NULL, NULL, 'Moscow', 'HR', 'Horse riding', NULL, 'I am aspiring author who wants to make Russia proud.\n\n😊😄😄😄', 1, 1, 1, 3, 1, NULL, 1, '1577438928.jpg', '1165,1166,1172', NULL, NULL, '1164,1165,1166,1170,1172,1173,1177', NULL, NULL, 'Russian, English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'TNE2J4', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-27 03:55:49', '2020-01-07 07:22:12', NULL, '101836136'),
(1177, 'en', 'texa', 'texas', 'texas@mailinator.com', 2, 1, NULL, 19, '2019-12-30 06:24:11', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.62107200085057', '77.081886436862', '+1', '', '$2y$10$Cr92MqwoY3OCXOeJtGSGpOL6Rcq6X8iFvZDcjjoBP0vzNQW2nEaIK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, '1577706932.png', '1162,1163', '1165', NULL, '1162,1163,1164,1166,1171,1172,1173,1176,1179', '1165,1170,1175', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'E7SRUW', '', NULL, '0', '1', '1', '1', '0', '0', '2019-12-30 06:23:28', '2020-01-08 23:03:15', NULL, '101901926'),
(1178, 'en', 'jam', 'jammy', 'jammy@mailinator.com', 2, 1, NULL, 19, '2020-01-03 05:31:04', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210353', '77.0818133', '+1', '', '$2y$10$Y8.QdOlV1dLqL6OdacdyXOWwU5JcC6Do.Y008HW3b9aAg2REP6uve', 'Daily Activities', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, 'http://14.141.175.109/lovepush/public/profile/267461578055903.', '1163', '1162,1165', NULL, '1163,1164,1173,1175,1176,1177,1179', '1162,1163,1165,1170,1171,1172', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '0HOXTE', '', NULL, '0', '1', '1', '1', '0', '0', '2020-01-03 05:29:22', '2020-01-10 07:30:34', NULL, '101990866'),
(1179, 'en', 'tani', 'tani', 'tani@mailinator.com', 1, 1, NULL, 23, '2020-01-06 20:31:37', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Phase - I, Manimajra, Sukteri, Haryana 134114, India', '30.728064', '76.8462431', '+1', '', '$2y$10$XgteML4SgD3tbt3fE3qJ..6TlsVZ9dxZV3ptpC7s.ZRINbBHiMdwq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, '3365534debc340f669374b85b98a225e177de118f04b46d99547a3aeecc86e83', 2, '1578405725.jpg', '1163,1168', NULL, NULL, '1163,1168,1172,1173,1177', '1162', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'U43RPE', '', NULL, '0', '1', '1', '1', '0', '0', '2020-01-07 08:31:15', '2020-01-10 04:49:18', NULL, '102092662'),
(1180, 'en', 'Hallo Sie', 'jones', 'siehallo50@gmail.com', 1, 1, NULL, 25, '2020-01-08 04:07:19', NULL, NULL, NULL, NULL, '+1', '', '$2y$10$uDjAhBPbvMryceQuhHX6CORZ/Z.1T7sSmPbCIboKa3BQout5PQtb.', 'Relationship, Friendship, Daily Activities', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, '1578476307.jpg', NULL, NULL, NULL, NULL, '1171,1175', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'BCWHKY', '', NULL, '0', '1', '1', '1', '0', '0', '2020-01-08 04:06:16', '2020-01-08 04:10:22', NULL, '102113411'),
(1181, 'en', 'tina', 'Tina Sharma', 'tin@mailinator.com', 1, 1, NULL, 22, '2020-01-10 06:11:15', NULL, '25 Doud Dr, Los Altos, CA 94022, USA', '37.381726666666665', '-122.10183333333335', '+1', '', '$2y$10$dZ.l1jECOa.8fFhe4YhwRuAU8uI12rTTnCMxnNtTBFuNAAkWCqCni', 'Relationship, Friendship', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, '1578656515.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '4I51KH', '', NULL, '0', '1', '1', '1', '0', '0', '2020-01-10 06:10:58', '2020-01-10 06:37:13', NULL, '102164994'),
(1182, 'en', 'tammy', 'Tammy', 'tammy@mailinator.com', 2, 1, NULL, 19, '2020-01-09 19:33:24', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.621036', '77.0818155', '+1', '', '$2y$10$nS8y6V3.nglpzq.W9/23uuSgd88wN.DSBOaEbAb0ofRG2ARmH9Coa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, '1578661563.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'KXDXYZ', '', NULL, '0', '1', '1', '1', '0', '0', '2020-01-10 07:32:38', '2020-01-10 07:36:17', NULL, '102166291');

-- --------------------------------------------------------

--
-- Table structure for table `user_plan_details`
--

CREATE TABLE `user_plan_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `messages` varchar(255) NOT NULL,
  `voice_call` varchar(255) NOT NULL,
  `likes` varchar(255) NOT NULL,
  `swipe` varchar(255) NOT NULL,
  `ads` varchar(255) NOT NULL,
  `see_live_video` varchar(255) NOT NULL,
  `live_video_streaming` varchar(255) NOT NULL,
  `view_storys` varchar(255) NOT NULL,
  `network_marketing` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_plan_details`
--

INSERT INTO `user_plan_details` (`id`, `user_id`, `messages`, `voice_call`, `likes`, `swipe`, `ads`, `see_live_video`, `live_video_streaming`, `view_storys`, `network_marketing`, `created_at`, `updated_at`) VALUES
(1, 1166, '5', 'Unlimited', '50', '3', '4', 'Yes', '3', '50', 'Direct Commission', '2020-01-09 23:22:02', '2020-01-09 23:22:02');

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
(953, 1163, '1576578277.jpg', '2019-12-17 04:54:37', '2019-12-17 04:54:37'),
(954, 1164, '1576582835.jpg', '2019-12-17 06:10:35', '2019-12-17 06:10:35'),
(955, 1165, '1576643924.png', '2019-12-17 23:08:44', '2019-12-17 23:08:44'),
(956, 1165, '773411576644038.png', '2019-12-17 23:10:38', '2019-12-17 23:10:38'),
(958, 1168, '1576646167.jpg', '2019-12-17 23:46:07', '2019-12-17 23:46:07'),
(959, 1169, '1576761016.jpg', '2019-12-19 07:40:16', '2019-12-19 07:40:16'),
(961, 1171, '1576834487.jpg', '2019-12-20 04:04:47', '2019-12-20 04:04:47'),
(971, 1170, '435781577103068.jpg', '2019-12-23 06:41:08', '2019-12-23 06:41:08'),
(974, 1170, '499961577103219.jpg', '2019-12-23 06:43:39', '2019-12-23 06:43:39'),
(980, 1172, '482121577105410.jpg', '2019-12-23 07:20:10', '2019-12-23 07:20:10'),
(981, 1172, '129131577105462.jpg', '2019-12-23 07:21:02', '2019-12-23 07:21:02'),
(986, 1173, '1577107134.jpg', '2019-12-23 07:48:54', '2019-12-23 07:48:54'),
(987, 1175, '1577115941.jpg', '2019-12-23 10:15:41', '2019-12-23 10:15:41'),
(988, 1175, '958111577174745.jpg', '2019-12-24 02:35:45', '2019-12-24 02:35:45'),
(989, 1175, '469501577175000.jpg', '2019-12-24 02:40:00', '2019-12-24 02:40:00'),
(990, 1175, '199371577175216.jpg', '2019-12-24 02:43:36', '2019-12-24 02:43:36'),
(991, 1176, '1577438928.jpg', '2019-12-27 03:58:48', '2019-12-27 03:58:48'),
(992, 1177, '1577706932.png', '2019-12-30 06:25:33', '2019-12-30 06:25:33'),
(993, 1166, '226581578048664.jpg', '2020-01-03 05:21:04', '2020-01-03 05:21:04'),
(994, 1166, '455911578048679.jpg', '2020-01-03 05:21:19', '2020-01-03 05:21:19'),
(995, 1172, '359691578053161.', '2020-01-03 06:36:02', '2020-01-03 06:36:02'),
(997, 1166, '393131578054356.', '2020-01-03 06:55:56', '2020-01-03 06:55:56'),
(999, 1162, '824841578055191.', '2020-01-03 07:09:51', '2020-01-03 07:09:51'),
(1000, 1162, '815211578055393.', '2020-01-03 07:13:13', '2020-01-03 07:13:13'),
(1001, 1162, '742051578055470.', '2020-01-03 07:14:30', '2020-01-03 07:14:30'),
(1002, 1178, '267461578055903.', '2020-01-03 07:21:43', '2020-01-03 07:21:43'),
(1003, 1179, '1578405725.jpg', '2020-01-07 08:32:05', '2020-01-07 08:32:05'),
(1004, 1180, '1578476307.jpg', '2020-01-08 04:08:27', '2020-01-08 04:08:27'),
(1005, 1180, '11371578476421.', '2020-01-08 04:10:21', '2020-01-08 04:10:21'),
(1006, 1166, '165981578656095.', '2020-01-10 06:04:55', '2020-01-10 06:04:55'),
(1007, 1181, '1578656515.', '2020-01-10 06:11:55', '2020-01-10 06:11:55'),
(1008, 1181, '945061578656543.', '2020-01-10 06:12:23', '2020-01-10 06:12:23'),
(1009, 1182, '1578661563.', '2020-01-10 07:36:03', '2020-01-10 07:36:03');

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
(316, 1163, '2019-12-17 11:31:09', '2019-12-17 11:31:09'),
(320, 1162, '2019-12-17 11:37:29', '2019-12-17 11:37:29'),
(324, 1164, '2019-12-17 11:48:57', '2019-12-17 11:48:57'),
(325, 1176, '2019-12-27 09:36:00', '2019-12-27 09:36:00');

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
(33, 'en', 'anirudh', 0, 'anirudh.p303@gmail.com', NULL, 1, '2019-10-30 07:59:07', 'web', '2019-10-30 07:57:52', '2019-10-30 21:28:28'),
(346, 'en', 'BenjaminReschl', 0, 'viennadelight@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(347, 'en', 'Manny Digs', 0, 'hobodiggler@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(348, 'en', 'halim hanani', 0, 'hhalimo2005@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(349, 'en', 'Maria May', 0, 'maymaria900@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(351, 'en', 'michael', 0, 'michael@elkridgefurnaceinn.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(352, 'en', 'cathyjeffers', 0, 'cathyjeffers@powdermetalparts.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(353, 'en', '', 0, 'nguyentuongminhanh1996@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(354, 'en', 'Marko', 0, 'demarko31@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(355, 'en', 'Leslie', 0, 'Leslie.Akins-Chambers@FalconJet.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(356, 'en', 'Stefan Fauth', 0, 'stefan-fauth@vodafone.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(357, 'en', 'krebeccaj', 0, 'krebeccaj1@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(359, 'en', 'weijian li', 0, 'weijian.li.china@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(360, 'en', 'Alice', 0, 'devaalice@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(361, 'en', 'maxineo', 0, 'maxineo@hotmail.com.au', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(362, 'en', 'marco', 0, 'tribiamarco@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(363, 'en', 'L jones', 0, 'LJONES@FANNINCOUNTYGA.ORG', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(364, 'en', 'Glenno', 0, 'glenno.vrgs@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(365, 'en', 'Mary', 0, 'maryjo@cajunelectricbr.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(366, 'en', 'alex angelle', 0, 'alexangelle@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(367, 'en', 'Ruby', 0, 'rubykat@cox.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(368, 'en', 'Benhar', 0, 'benhar1997@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(369, 'en', 'Rellis', 0, 'rellis11@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(370, 'en', 'Anderson', 0, 'tcanderson216@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(371, 'en', 'Zucker', 0, 'ezucker2687@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(372, 'en', 'Robinson', 0, 'robinson89@live.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(373, 'en', 'Jaryn alllen', 0, 'jaryn.allen@ndsu.edu', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(374, 'en', 'Wea Birkner', 0, 'wea.birkner@t-online.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(375, 'en', 'Jocelyn', 0, 'jocelyndalumpines681@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(376, 'en', 'Jkal', 0, 'jkalford0817@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(377, 'en', 'Zara Hallam', 0, 'zarahallam7@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(378, 'en', 'jjobe', 0, 'jjobe@tampabay.rr.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(379, 'en', 'eugenerex', 0, 'eugenerex1999@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(380, 'en', 'Sherriwin', 0, 'sherriwin73@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(381, 'en', 'Wurm', 0, 'wurm1987@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(382, 'en', 'Joseph', 0, 'josephleary89@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(383, 'en', 'Jordan', 0, 'Jordan@rightwayweb.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(384, 'en', 'witchmother', 0, 'witchmother@comcast.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(385, 'en', 'beechway', 0, '1510beechway@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(386, 'en', 'Huyen', 0, 'nguyenhuyen88.h@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(387, 'en', 'littlebpdx', 0, 'littlebpdx@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(388, 'en', 'lene', 0, 'hunt.lene@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(389, 'en', 'asherry', 0, 'asherry23@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(390, 'en', 'pictoutj', 0, 'pictoutj@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(391, 'en', 'z williams', 0, 'zwilliams@dalcoservicesllc.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(392, 'en', 'Joyce locquiao', 0, 'locquiaojoyce@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(393, 'en', 'Reko', 0, 'rekospeights@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(394, 'en', 'Jon', 0, 'jonthorg@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(395, 'en', 'Daniel', 0, 'DaniellRLewis@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(396, 'en', 'marc', 0, 'marcbrinki@freenet.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(397, 'en', 'Kensmith Consulting', 0, 'kensmithconsulting@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(398, 'en', 'Denmit', 0, 'denmit11@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(399, 'en', 'Neil', 0, 'neilkeator@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(400, 'en', 'maggie Rossler', 0, 'maggie-Rossler@T-online.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(401, 'en', 'MC', 0, 'mcarpenter40@cox.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(402, 'en', 'Boothole', 0, 'Boothole1@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(403, 'en', 'williams', 0, 'cwilliams1998@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(404, 'en', 'ryan aiello', 0, 'ryan.aiello@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(405, 'en', 'shengvang', 0, 'shengvang_04@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(406, 'en', 'Salvare', 0, 'mrsalvarez84@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(407, 'en', 'kastlekeepr', 0, 'kastlekeepr@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(408, 'en', 'mobley', 0, 'gmobley9@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(409, 'en', 'loranm', 0, 'loranm@firstcoast.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(410, 'en', 'G Becker', 0, 'GBECKER@INTLSLEEP.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(411, 'en', 'Robin', 0, 'ROBINSKEVIN@HOTMAIL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(412, 'en', 'marcos', 0, 'marcos.sala@ntlworld.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(413, 'en', 'nicole wilson', 0, 'nicolecapriwilson@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(414, 'en', 'fabric', 0, 'fabriciocsan@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(415, 'en', 'carmen johnson', 0, 'carmenjohnsononlyme@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(416, 'en', 'j wickings', 0, 'jwickings00@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(417, 'en', 'John ', 0, 'JOHNBISIGNANOJR@OUTLOOK.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(418, 'en', 'jlbell', 0, 'jlbell2772@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(419, 'en', 'amacphee', 0, 'angelamacphee@btinternet.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(420, 'en', 'evans travis', 0, 'travisevans11@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(421, 'en', 'mc skinny', 0, 'mcskinny480@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(422, 'en', 'julia', 0, 'julia_persinger@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(423, 'en', 'yoelifriedman', 0, 'yoelifriedman@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(424, 'en', 'aleka', 0, 'alekagogos@gmail.co', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(425, 'en', 'jhartzler', 0, 'jhartzler@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(426, 'en', 'aquagirl', 0, 'aquagirl153@embarqmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(427, 'en', 'jim andjan', 0, 'jimandjan6@msn.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(428, 'en', 'chasetao', 0, 'chasetao@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(429, 'en', 'quilt wisdom', 0, 'quiltwisdom@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(430, 'en', 'kumabear', 0, 'kumabear.1@comcast.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(431, 'en', 'kkalawaia', 0, 'kkalawaia8762@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(432, 'en', 'JASMINE', 0, 'JASMINEW19@AOL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(433, 'en', 'automannj', 0, 'automannj@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(434, 'en', 'Big John', 0, 'bigjohn601@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(435, 'en', 'crysanchez', 0, 'crysanchez.07@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(436, 'en', 'PERRY ANDERSON', 0, 'PERRYANDERSON93@GMAIL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(437, 'en', 'murshabat', 0, 'murshabat@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(439, 'en', 'lisa', 0, 'lisams3@msn.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(440, 'en', 'mandy corrado', 0, 'mandycorradoofficial@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(441, 'en', 'abal mario', 0, 'abalmario@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(442, 'en', 'JANET BERGOCH', 0, 'JANET.B.BERGOCH@DISNEY.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(443, 'en', 'Nica', 0, 'NICA4429@GMAIL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(444, 'en', 'RONY SILVA', 0, 'RONY.SILVA55@YAHOO.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(445, 'en', 'carol smoore', 0, 'carolsmoore@live.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(446, 'en', 'kdunky', 0, 'kdunky1@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(447, 'en', 'glittergirl', 0, 'glittergirl_94583@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(448, 'en', 'matthew peter', 0, 'matthewpeterhatfield@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(449, 'en', 'ragsdale', 0, 'ragsdale5@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(450, 'en', 'amurphy', 0, 'amurphy0506@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(451, 'en', 'sundevil', 0, '87sundevil@cox.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(452, 'en', 'ehrhardt', 0, 'k.ehrhardt@dasa-elektronik.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(453, 'en', 'franco henrd', 0, 'francohenrd@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(454, 'en', 'thebandygroup', 0, 'thebandygroup@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(455, 'en', 'rafael', 0, 'ingrid.rafael@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(456, 'en', 'muse', 0, 'muse55@nate.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(457, 'en', 'leighoved', 0, 'leighoved@icloud.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(458, 'en', 'lana debisschop', 0, 'lana.debisschop@telenet.be', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(459, 'en', 'dhiren badhiwala', 0, 'dhirenbadhiwala@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(460, 'en', 'orantama', 0, 'orantama@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(461, 'en', 'drain', 0, 'd.drain75@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(462, 'en', 'edmonds dawn', 0, 'edmondsdawn@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(463, 'en', 'meldridge', 0, 'meldridge23@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(464, 'en', 'lintengli', 0, 'lintengli@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(465, 'en', 'christensen derek', 0, 'derekchristensen2010@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(466, 'en', 'frank', 0, 'frankmckernan@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(467, 'en', 'michelle mc nulty', 0, 'michellemcnulty35@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(468, 'en', 'mgaklik', 0, 'mgaklik@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(469, 'en', 'ansgustnr', 0, 'ansgustnr@nate.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(470, 'en', 'fiberglass', 0, 'tolgaorak@outlook.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(471, 'en', 'andrew', 0, 'andrew@osbani.co.uk', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(472, 'en', 'ellez reliak', 0, 'ellezreliak@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(473, 'en', 'rustica', 0, 'rustica_d@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(474, 'en', 'asthma', 0, 'asraman@qti.qualcomm.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(475, 'en', 'purchase', 0, 'einkauf@rabofsky.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(476, 'en', 'justice', 0, 'hakiel@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(477, 'en', 'intrepidcode1', 0, 'intrepidcode1@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(478, 'en', 'bcominale', 0, 'bcominale@barkframeworks.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(479, 'en', 'ash bertly', 0, 'ashbertly@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(480, 'en', 'schuch', 0, 'd.schuch@dasa-elektronik.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(481, 'en', 'okochachaib', 0, 'okochachaib2@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(482, 'en', 'ellstrsm', 0, 'ellstrsm@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(483, 'en', 'pierce kristen', 0, 'piercekristen@sbcglobal.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(484, 'en', 'ANDREA', 0, 'ANDREA@PTLVACUUM.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(485, 'en', 'sunraiser', 0, 'sunraiser_1@yahoo.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(486, 'en', 'RednSassy', 0, 'RednSassy74@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(487, 'en', 'yungg bjay', 0, 'yunggbjay@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(488, 'en', 'randy buhrt', 0, 'randy.buhrt@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(489, 'en', 'sermine', 0, 'thesermine1156@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(490, 'en', 'info', 0, 'info@ihd-deutschland.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(491, 'en', 'deerlane', 0, 'deerlanecmcw@comcast.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(492, 'en', 'kuno', 0, 'kuno@procab.us', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(493, 'en', 'rvollman', 0, 'rvollman@autoaides.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(494, 'en', 'munschiej', 0, 'munschiej@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(495, 'en', 'ARICHARD', 0, 'ARICHARD@BABSTCALLAND.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(496, 'en', 'nicole john', 0, 'nicole_john@web.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(497, 'en', 'dietmar kade', 0, 'dietmar.kade@gmx.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(498, 'en', 'sigmund', 0, 'sigmund66pych@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(499, 'en', 'JASON', 0, 'JASON@MAHINDRAOK.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(500, 'en', 'kristen peacock', 0, 'kristen.peacock@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(501, 'en', 'michael', 0, 'michaelgohl@mail.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(502, 'en', 'mattlesh', 0, 'mattlesh1@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(503, 'en', 'reda fekry', 0, 'reda.fekry1988@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(504, 'en', 'CHIAMONGA', 0, 'CHIAMONGA@GMAIL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(505, 'en', 'sabireal', 0, 'sabireal@hotmail.it', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(506, 'en', 'eunkkim', 0, 'eunkkim90@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(507, 'en', 'panda', 0, 'ts.panda@outlook.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(508, 'en', 'brittweather', 0, 'brittweather@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(509, 'en', 'kr_jms', 0, 'kr_jms@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(510, 'en', 'diegoled', 0, 'diegoledbetter2@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(511, 'en', 'ange', 0, 'ange19_2001@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(512, 'en', 'einkauf', 0, 'einkauf@brasacchio.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(513, 'en', 'daves jewelry', 0, 'davesjewelry@juno.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(514, 'en', 'aldauterman', 0, 'aldauterman@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(515, 'en', 'sherman ward', 0, 'shermanward510@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(516, 'en', 'lisa verbeck', 0, 'lisa.verbeck@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(517, 'en', 'paige francesca', 0, 'paige.francesca@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(518, 'en', 'deannas', 0, 'deannasfavorites@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(519, 'en', 'omnia', 0, 'omnia1075@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(520, 'en', 'andy', 0, 'andy@landamore.plus.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(521, 'en', 'zucker', 0, 'zuckerhead@excite.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(522, 'en', 'vkwhite', 0, 'vkwhite101@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(523, 'en', 'jdoc', 0, 'jdoc04@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(524, 'en', 'ceeabrego', 0, 'ceeabrego@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(525, 'en', 'Rusak', 0, 'Rusak2004@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(526, 'en', 'frankie', 0, 'frankie@francescapaige.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(527, 'en', 'mismith', 0, 'mismith@carlsonwagonlit.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(528, 'en', 'barbs', 0, 'barbs25@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(529, 'en', 'jorge wiewall', 0, 'jorgewiewall@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(530, 'en', 'jozue', 0, 'jozue.A.H@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(531, 'en', 'hjbossert', 0, 'hjbossert@online.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(532, 'en', 'kerry urquizo', 0, 'kerryurquizo@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(533, 'en', 's granatello', 0, 's.granatello@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(534, 'en', 'energy smartfl', 0, 'energysmartfl@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(535, 'en', 'nik fisher', 0, 'nik.s.fisher@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(536, 'en', 'howardhoangle', 0, 'howardhoangle@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(537, 'en', 'tjdoublebio', 0, 'tjdoublebio@foxmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(538, 'en', 'krk', 0, 'krk12tx@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(539, 'en', 'johan', 0, 'johan@westlund-embedded.se', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(540, 'en', 'juan gallego buzon', 0, 'juan.gallego.buzon@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(541, 'en', 'tbarry shmw', 0, 'tbarry.shmw@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(542, 'en', 'mvillanueva', 0, 'mvillanueva1973@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(543, 'en', 'jackson', 0, 'smjackson29@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(544, 'en', 'todonoghuecree', 0, 'todonoghuecree@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(545, 'en', 'elsiehchan', 0, 'elsiehchan@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(546, 'en', 'avald', 0, 'avald2004@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(547, 'en', 'AMY WONG', 0, 'AMY.WONG10021@GMAIL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(548, 'en', 'manel suria', 0, 'manel_suria1@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(549, 'en', 'maryy umm', 0, 'maryy_umm12@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(550, 'en', 'dawnroyall', 0, 'dawnroyall@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(551, 'en', 'dharper', 0, 'dharpermail@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(552, 'en', 'ALPHONSOR', 0, 'ALPHONSOR78@GMAIL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(553, 'en', 'eholl', 0, 'eholl2218@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(554, 'en', 'llan octavio', 0, 'llanoctavio@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(555, 'en', 'randolph bears', 0, 'randolphbears@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(556, 'en', 'donnied', 0, 'donnied1952@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(558, 'en', 'inri', 0, 'inri54@gmx.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(559, 'en', 'carmine', 0, 'carmine@sirignano.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(560, 'en', 'jsoares', 0, 'jsoares18@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(561, 'en', 'RANDIBABI', 0, 'RANDIBABI2271@GMAIL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(562, 'en', 'jacobs', 0, 'jacobs.lc2@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(563, 'en', 'david armstrong', 0, 'txdavidarmstrong@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(564, 'en', 'marisakeller', 0, 'marisakellerhouse@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(565, 'en', 'gregwarren', 0, '33gregwarren33@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(566, 'en', 'jackief perry', 0, 'jackiefperry@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(567, 'en', 'RUSS ELSTAD', 0, 'RUSS.ELSTAD@YAHOO.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(568, 'en', 'edmur', 0, 'edmur@kasatec.com.br', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(569, 'en', 'chris', 0, 'chris@salemradiology.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(570, 'en', 'seg', 0, 'seg246@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(571, 'en', 'kandra', 0, 'kandra_k@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(572, 'en', 'james', 0, 'jameswlo@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(573, 'en', 'guycorbe', 0, 'guycorbe@hotmail.fr', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(574, 'en', 'wmb gansser', 0, 'wmb.gansser@t-online.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(575, 'en', 'leanor larabee@', 0, 'leanor.larabee@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(576, 'en', 'lydia grossmann', 0, 'lydia-grossmann@freenet.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(577, 'en', 'cfrench', 0, 'cfrench3340@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(578, 'en', 'osterlund', 0, 'osterlund@optimizingsystems.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(579, 'en', 'rebruthb', 0, 'rebruthb@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(580, 'en', 'ayde', 0, 'ayde_209365@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(581, 'en', 'ufo7pilot', 0, 'ufo7pilot@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(582, 'en', 'chenliyu', 0, 'chenliyu1031@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(583, 'en', 'ricky lynn', 0, 'rickylynn0420@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(584, 'en', 'crittby', 0, 'crittby@hevanet.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(585, 'en', 'lindsey', 0, 'lindsey@identitydance.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(586, 'en', 'takvoryangohar', 0, 'takvoryangohar@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(587, 'en', 'allan', 0, 'allan061@hotmail.fr', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(588, 'en', 'steve88dick', 0, 'steve88dick@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(589, 'en', 'eleanor larabee', 0, 'eleanor.larabee@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(590, 'en', 'tnthatguy', 0, 'tnthatguy@outlook.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(591, 'en', 'jose sanz', 0, 'jose.sanz@aa.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(592, 'en', 'kazzrod', 0, 'kazzrod@optusnet.com.au', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(593, 'en', 'camdencarr', 0, 'camdencarr1@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(594, 'en', 'sylvie cornet', 0, 'sylvie.cornet@wanadoo.fr', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(595, 'en', 'dennis osterlund', 0, 'dennis.osterlund@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(596, 'en', 'babukishore', 0, 'babukishore@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(597, 'en', 'alecstan', 0, 'alecstan6@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(598, 'en', 'rickeyle', 0, 'rickeyleee@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(599, 'en', 'tiffanyawong', 0, 'tiffanyawong@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(600, 'en', 'shifra', 0, 'shifra1888@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(601, 'en', 'doescompute', 0, 'doescompute@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(602, 'en', 'janice gilbert', 0, 'janice_gilbert@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(603, 'en', 'paigehackney', 0, 'paigehackney93@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(604, 'en', 'boxmom', 0, 'boxmom@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(605, 'en', 'silvia geboiu', 0, 'silvia.geboiu@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(606, 'en', 'repair', 0, 'repair@highlandbodyshop.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(607, 'en', 'ashleyalv', 0, 'ashleyalv98@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(608, 'en', 'irenamperez', 0, 'irenamperez@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(609, 'en', 'wendyl tucker', 0, 'wendyltucker@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(610, 'en', 'foreignparts', 0, 'foreignparts@cs.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(611, 'en', 'sandy', 0, 'somedaysandy@live.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(612, 'en', 'libby mccarthy', 0, 'libbymccarthy@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(613, 'en', 'mikey jerome', 0, 'mikeyjerome@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(614, 'en', 'kellene', 0, 'kellene@gilbrough.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(615, 'en', 'nrwatson', 0, 'nrwatson@wavecable.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(616, 'en', 'sarahlee', 0, 'sarahlee15@juno.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(617, 'en', 'jeepmommy', 0, 'jeepmommy123@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(618, 'en', 'devree', 0, 'a.devree@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(619, 'en', 'clairej', 0, 'clairej872@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(620, 'en', 'nartecurb', 0, 'nartecurb@hotmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(621, 'en', 'littlejohn', 0, 'jim.g.littlejohn@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(622, 'en', 'kdomschot', 0, 'kdomschot@bex.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(623, 'en', 'lanamoy', 0, 'lanamoy8@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(624, 'en', 'daniel faucheux', 0, 'daniel.faucheux37@orange.fr', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(625, 'en', 'kpilman', 0, 'kpilman1015@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(626, 'en', 'missyhachiya', 0, 'missyhachiya@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(627, 'en', 'aaronvanmanen', 0, 'aaronvanmanen@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(628, 'en', 'WILDGOOSE CHASE', 0, '2WILDGOOSE.CHASE@GMAIL.COM', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(629, 'en', 'dlkiarabanks', 0, 'dlkiarabanks@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(642, 'en', 'tarableknight10', 0, 'arableknight10@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(646, 'en', 'info', 0, 'info@wunschgutschein.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(647, 'en', 'jeffszymanowski', 0, 'jeffszymanowski@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(648, 'en', 'rurbick', 0, 'rurbick@charter.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(649, 'en', 'ACCTSPAYABLE', 0, 'ACCTSPAYABLE@CITYOFEUNICE.ORG', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(650, 'en', 'mmona280', 0, 'mmona280@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(651, 'en', 'Tyler Fadwell', 0, 'tylerfadwell@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(652, 'en', 'Jennifer Olsen', 0, 'jenolsen810506@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(653, 'en', 'MutoniAisha', 0, 'mutoniaisha97@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(654, 'en', 'dew1', 0, 'dew1@cox.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(655, 'en', 'kirstenbartels25', 0, 'kirstenbartels25@aol.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(656, 'en', 'jeremy.perez65', 0, 'jeremy.perez65@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(657, 'en', 'SaneSane', 0, 'ssane7973@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(658, 'en', 'mgrant5', 0, 'mgrant5@charter.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(659, 'en', 'Tushu', 0, 'tmavenger4422@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(660, 'en', 'info', 0, 'info@hidden-audio.de', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(661, 'en', 'falconconstruction', 0, 'falconconstruction@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(662, 'en', 'Wittco50', 0, 'Wittco50@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(663, 'en', 'mmiller', 0, 'mmiller@legendfbo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(664, 'en', 'turkibutt48', 0, 'turkibutt48@cox.net', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(665, 'en', 'fourgenaustin', 0, 'fourgenaustin@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(666, 'en', 'tarableknight10', 0, 'tarableknight10@yahoo.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(667, 'en', 'kelly.herbster', 0, 'kelly.herbster@k12.sd.us', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(668, 'en', 'Sasa', 0, 'sarathvoeun@gmail.com', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01'),
(669, 'en', 'DMERKLE143', 0, 'DMERKLE143@VZW.BLACKBERRY.NET', NULL, 1, NULL, 'web', '2019-11-08 07:50:52', '2019-10-08 07:51:01');

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
-- Indexes for table `paypal_trans`
--
ALTER TABLE `paypal_trans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `report_images`
--
ALTER TABLE `report_images`
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
-- Indexes for table `user_plan_details`
--
ALTER TABLE `user_plan_details`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `chat_requests`
--
ALTER TABLE `chat_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_status`
--
ALTER TABLE `chat_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `connect_requests`
--
ALTER TABLE `connect_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2377;
--
-- AUTO_INCREMENT for table `deleted_accounts`
--
ALTER TABLE `deleted_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7134;
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
-- AUTO_INCREMENT for table `paypal_trans`
--
ALTER TABLE `paypal_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;
--
-- AUTO_INCREMENT for table `post_ads`
--
ALTER TABLE `post_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `qb_chat_dialog_ids`
--
ALTER TABLE `qb_chat_dialog_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `report_images`
--
ALTER TABLE `report_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_ques`
--
ALTER TABLE `test_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3894;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6240;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15466;
--
-- AUTO_INCREMENT for table `test_scores`
--
ALTER TABLE `test_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1972;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1183;
--
-- AUTO_INCREMENT for table `user_plan_details`
--
ALTER TABLE `user_plan_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;
--
-- AUTO_INCREMENT for table `web_users`
--
ALTER TABLE `web_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=670;
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
