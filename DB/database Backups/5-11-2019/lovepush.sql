-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2019 at 02:25 PM
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
(471, 413, 469, '0', '2019-11-04 18:56:20', '2019-11-04 18:56:20'),
(472, 413, 471, '0', '2019-11-04 18:56:20', '2019-11-04 18:56:20'),
(473, 411, 466, '0', '2019-11-04 19:00:10', '2019-11-04 19:00:10'),
(474, 411, 470, '0', '2019-11-04 19:00:10', '2019-11-04 19:00:10'),
(475, 420, 473, '0', '2019-11-05 01:50:40', '2019-11-05 01:50:40'),
(476, 420, 466, '0', '2019-11-05 01:50:40', '2019-11-05 01:50:40'),
(477, 421, 466, '0', '2019-11-05 03:59:50', '2019-11-05 03:59:50'),
(478, 421, 479, '0', '2019-11-05 03:59:50', '2019-11-05 03:59:50'),
(479, 416, 470, '0', '2019-11-05 04:03:16', '2019-11-05 04:03:16'),
(480, 416, 471, '0', '2019-11-05 04:03:16', '2019-11-05 04:03:16'),
(481, 418, 468, '0', '2019-11-05 04:11:07', '2019-11-05 04:11:07'),
(482, 418, 471, '0', '2019-11-05 04:11:07', '2019-11-05 04:11:07'),
(483, 428, 486, '0', '2019-11-05 07:13:45', '2019-11-05 07:13:45'),
(484, 428, 480, '0', '2019-11-05 07:13:45', '2019-11-05 07:13:45'),
(485, 430, 487, '0', '2019-11-05 07:23:57', '2019-11-05 07:23:57'),
(486, 430, 489, '0', '2019-11-05 07:23:57', '2019-11-05 07:23:57'),
(487, 434, 487, '0', '2019-11-05 07:24:49', '2019-11-05 07:24:49'),
(488, 434, 471, '0', '2019-11-05 07:24:49', '2019-11-05 07:24:49'),
(489, 438, 482, '0', '2019-11-05 07:27:02', '2019-11-05 07:27:02'),
(490, 438, 471, '0', '2019-11-05 07:27:02', '2019-11-05 07:27:02'),
(491, 436, 487, '0', '2019-11-05 07:27:18', '2019-11-05 07:27:18'),
(492, 436, 482, '0', '2019-11-05 07:27:18', '2019-11-05 07:27:18'),
(493, 431, 470, '0', '2019-11-05 07:32:41', '2019-11-05 07:32:41'),
(494, 431, 487, '0', '2019-11-05 07:32:41', '2019-11-05 07:32:41');

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
(920, 467, 466, 'A', '2019-11-04 17:45:56', '2019-11-04 17:53:46'),
(921, 466, 468, 'A', '2019-11-04 18:03:12', '2019-11-04 18:47:50'),
(922, 466, 469, 'A', '2019-11-04 18:08:34', '2019-11-04 18:08:47'),
(923, 466, 470, 'A', '2019-11-04 18:41:29', '2019-11-04 18:41:42'),
(924, 468, 470, 'A', '2019-11-04 18:47:59', '2019-11-04 19:01:36'),
(925, 468, 467, 'A', '2019-11-04 18:48:04', '2019-11-04 19:54:46'),
(926, 468, 469, 'A', '2019-11-04 18:48:06', '2019-11-04 18:56:05'),
(927, 467, 470, 'A', '2019-11-04 19:21:26', '2019-11-04 19:21:33'),
(928, 466, 471, 'A', '2019-11-04 19:39:24', '2019-11-05 04:02:58'),
(929, 466, 472, 'S', '2019-11-04 21:16:18', '2019-11-04 21:16:18'),
(930, 473, 466, 'A', '2019-11-04 22:16:05', '2019-11-04 22:18:53'),
(931, 473, 470, 'A', '2019-11-04 22:16:17', '2019-11-05 07:24:31'),
(932, 473, 468, 'A', '2019-11-04 22:16:20', '2019-11-05 06:36:27'),
(933, 475, 469, 'S', '2019-11-05 00:51:33', '2019-11-05 00:51:33'),
(934, 466, 477, 'S', '2019-11-05 01:18:15', '2019-11-05 01:18:15'),
(935, 466, 474, 'R', '2019-11-05 01:18:44', '2019-11-05 10:48:26'),
(936, 473, 474, 'R', '2019-11-05 02:13:53', '2019-11-05 10:48:38'),
(937, 466, 479, 'A', '2019-11-05 03:59:23', '2019-11-05 03:59:43'),
(938, 466, 480, 'A', '2019-11-05 04:51:38', '2019-11-05 04:56:08'),
(939, 473, 482, 'A', '2019-11-05 05:50:40', '2019-11-05 07:26:56'),
(940, 481, 480, 'A', '2019-11-05 06:40:27', '2019-11-05 06:40:38'),
(941, 486, 480, 'A', '2019-11-05 07:10:35', '2019-11-05 07:10:40'),
(942, 489, 480, 'A', '2019-11-05 07:20:01', '2019-11-05 07:20:41'),
(943, 487, 471, 'A', '2019-11-05 07:23:02', '2019-11-05 07:24:35'),
(944, 487, 484, 'A', '2019-11-05 07:23:06', '2019-11-05 07:54:39'),
(945, 487, 479, 'S', '2019-11-05 07:23:10', '2019-11-05 07:23:10'),
(946, 487, 482, 'A', '2019-11-05 07:23:12', '2019-11-05 07:26:53'),
(947, 487, 489, 'A', '2019-11-05 07:23:14', '2019-11-05 07:23:32'),
(948, 487, 486, 'S', '2019-11-05 07:23:17', '2019-11-05 07:23:17'),
(949, 487, 468, 'A', '2019-11-05 07:23:29', '2019-11-05 09:11:45'),
(950, 487, 467, 'A', '2019-11-05 07:23:33', '2019-11-05 09:05:10'),
(951, 487, 472, 'S', '2019-11-05 07:23:52', '2019-11-05 07:23:52'),
(952, 484, 480, 'A', '2019-11-05 07:53:31', '2019-11-05 09:24:25'),
(953, 484, 481, 'S', '2019-11-05 07:53:32', '2019-11-05 07:53:32'),
(954, 484, 486, 'S', '2019-11-05 07:53:33', '2019-11-05 07:53:33'),
(955, 484, 479, 'S', '2019-11-05 07:53:36', '2019-11-05 07:53:36'),
(956, 468, 488, 'S', '2019-11-05 09:11:59', '2019-11-05 09:11:59'),
(957, 467, 485, 'S', '2019-11-05 11:10:45', '2019-11-05 11:10:45'),
(958, 495, 467, 'A', '2019-11-05 12:07:26', '2019-11-05 12:43:55'),
(959, 497, 492, 'R', '2019-11-05 13:11:50', '2019-11-05 13:52:03'),
(960, 497, 488, 'S', '2019-11-05 13:11:51', '2019-11-05 13:11:51'),
(961, 497, 474, 'S', '2019-11-05 13:11:52', '2019-11-05 13:11:52'),
(962, 497, 468, 'S', '2019-11-05 13:11:53', '2019-11-05 13:11:53'),
(963, 497, 467, 'A', '2019-11-05 13:11:55', '2019-11-05 14:07:02'),
(964, 466, 496, 'S', '2019-11-05 13:31:11', '2019-11-05 13:31:11'),
(965, 466, 494, 'S', '2019-11-05 13:31:22', '2019-11-05 13:31:22'),
(966, 466, 488, 'S', '2019-11-05 13:31:30', '2019-11-05 13:31:30'),
(968, 466, 497, 'A', '2019-11-05 13:31:52', '2019-11-05 14:04:25'),
(969, 466, 495, 'S', '2019-11-05 13:31:55', '2019-11-05 13:31:55');

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
(10, 0, 'Lavi', 'Lavi Motwal', 'lavimotwal12@gmail.com', '+91', '7906298641', 'Other', 'hsshhs', '2019-11-05 09:28:40', '2019-11-05 09:28:40'),
(11, 0, 'Jairo', 'Obed', 'jairo_obed07@yahoo.com.mx', '+52', '9971454985', 'freezing', 'bye', '2019-11-05 13:33:47', '2019-11-05 13:33:47');

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
(1957, 470, 468, 0, '2019-11-04 18:41:28', '2019-11-04 18:41:28'),
(1958, 470, 467, 0, '2019-11-04 18:41:30', '2019-11-04 18:41:30'),
(1959, 470, 469, 0, '2019-11-04 18:41:31', '2019-11-04 18:41:31'),
(1960, 470, 466, 0, '2019-11-04 18:41:32', '2019-11-04 18:41:32'),
(1961, 471, 469, 1, '2019-11-04 18:55:39', '2019-11-04 18:55:39'),
(1962, 471, 468, 1, '2019-11-04 18:55:41', '2019-11-04 18:55:41'),
(1963, 469, 471, 1, '2019-11-04 18:56:02', '2019-11-04 18:56:02'),
(1964, 471, 470, 1, '2019-11-04 19:02:44', '2019-11-04 19:02:44'),
(1965, 470, 471, 1, '2019-11-04 19:03:02', '2019-11-04 19:03:02'),
(1966, 467, 471, 0, '2019-11-04 19:21:31', '2019-11-04 19:21:31'),
(1967, 467, 469, 0, '2019-11-04 19:21:32', '2019-11-04 19:21:32'),
(1968, 468, 471, 1, '2019-11-04 19:29:14', '2019-11-04 19:29:14'),
(1969, 472, 470, 0, '2019-11-04 20:45:33', '2019-11-04 20:45:33'),
(1970, 472, 467, 0, '2019-11-04 20:45:34', '2019-11-04 20:45:34'),
(1971, 472, 468, 0, '2019-11-04 20:45:35', '2019-11-04 20:45:35'),
(1972, 472, 471, 1, '2019-11-04 20:45:47', '2019-11-04 20:45:47'),
(1973, 472, 469, 0, '2019-11-04 20:45:51', '2019-11-04 20:45:51'),
(1974, 467, 472, 0, '2019-11-04 21:50:54', '2019-11-04 21:50:54'),
(1975, 473, 472, 0, '2019-11-04 22:16:14', '2019-11-04 22:16:14'),
(1976, 473, 467, 0, '2019-11-04 22:16:25', '2019-11-04 22:16:25'),
(1977, 473, 469, 0, '2019-11-04 22:16:29', '2019-11-04 22:16:29'),
(1978, 473, 471, 0, '2019-11-04 22:16:31', '2019-11-04 22:16:31'),
(1979, 475, 472, 0, '2019-11-05 00:51:15', '2019-11-05 00:51:15'),
(1980, 475, 467, 0, '2019-11-05 00:51:16', '2019-11-05 00:51:16'),
(1981, 475, 470, 0, '2019-11-05 00:51:18', '2019-11-05 00:51:18'),
(1982, 475, 474, 0, '2019-11-05 00:51:21', '2019-11-05 00:51:21'),
(1983, 475, 468, 0, '2019-11-05 00:51:27', '2019-11-05 00:51:27'),
(1984, 475, 471, 0, '2019-11-05 00:51:29', '2019-11-05 00:51:29'),
(1985, 475, 473, 0, '2019-11-05 00:51:45', '2019-11-05 00:51:45'),
(1986, 479, 470, 1, '2019-11-05 04:00:44', '2019-11-05 04:00:44'),
(1987, 471, 472, 1, '2019-11-05 04:03:00', '2019-11-05 04:03:00'),
(1988, 481, 480, 0, '2019-11-05 04:36:30', '2019-11-05 04:36:30'),
(1989, 481, 479, 0, '2019-11-05 04:36:34', '2019-11-05 04:36:34'),
(1990, 466, 481, 0, '2019-11-05 04:51:36', '2019-11-05 04:51:36'),
(1991, 473, 480, 0, '2019-11-05 05:50:29', '2019-11-05 05:50:29'),
(1992, 473, 481, 0, '2019-11-05 05:50:31', '2019-11-05 05:50:31'),
(1993, 473, 483, 0, '2019-11-05 05:50:32', '2019-11-05 05:50:32'),
(1994, 473, 484, 0, '2019-11-05 05:50:33', '2019-11-05 05:50:33'),
(1995, 473, 479, 0, '2019-11-05 05:50:48', '2019-11-05 05:50:48'),
(1997, 471, 481, 1, '2019-11-05 05:58:26', '2019-11-05 05:58:26'),
(1998, 471, 482, 1, '2019-11-05 05:58:28', '2019-11-05 05:58:28'),
(1999, 481, 471, 1, '2019-11-05 06:29:40', '2019-11-05 06:29:40'),
(2000, 480, 471, 0, '2019-11-05 06:41:43', '2019-11-05 06:41:43'),
(2001, 487, 488, 0, '2019-11-05 07:23:00', '2019-11-05 07:23:00'),
(2002, 487, 483, 1, '2019-11-05 07:23:05', '2019-11-05 07:23:05'),
(2003, 487, 485, 1, '2019-11-05 07:23:08', '2019-11-05 07:23:08'),
(2004, 487, 480, 1, '2019-11-05 07:23:15', '2019-11-05 07:23:15'),
(2005, 487, 481, 1, '2019-11-05 07:23:19', '2019-11-05 07:23:19'),
(2006, 487, 469, 1, '2019-11-05 07:23:27', '2019-11-05 07:23:27'),
(2008, 487, 470, 1, '2019-11-05 07:23:43', '2019-11-05 07:23:43'),
(2009, 487, 473, 1, '2019-11-05 07:23:56', '2019-11-05 07:23:56'),
(2010, 470, 487, 1, '2019-11-05 07:24:28', '2019-11-05 07:24:28'),
(2011, 470, 479, 1, '2019-11-05 07:24:30', '2019-11-05 07:24:30'),
(2012, 480, 487, 1, '2019-11-05 07:25:07', '2019-11-05 07:25:07'),
(2013, 482, 471, 1, '2019-11-05 07:26:58', '2019-11-05 07:26:58'),
(2014, 479, 488, 0, '2019-11-05 07:34:07', '2019-11-05 07:34:07'),
(2015, 479, 471, 0, '2019-11-05 07:34:09', '2019-11-05 07:34:09'),
(2016, 484, 489, 1, '2019-11-05 07:53:29', '2019-11-05 07:53:29'),
(2019, 491, 486, 0, '2019-11-05 09:43:27', '2019-11-05 09:43:27'),
(2020, 491, 480, 0, '2019-11-05 09:43:29', '2019-11-05 09:43:29'),
(2021, 491, 481, 0, '2019-11-05 09:43:30', '2019-11-05 09:43:30'),
(2022, 491, 489, 0, '2019-11-05 09:43:32', '2019-11-05 09:43:32'),
(2023, 491, 484, 0, '2019-11-05 09:43:33', '2019-11-05 09:43:33'),
(2024, 491, 479, 0, '2019-11-05 09:43:35', '2019-11-05 09:43:35'),
(2025, 491, 483, 0, '2019-11-05 09:43:36', '2019-11-05 09:43:36'),
(2026, 491, 482, 0, '2019-11-05 09:46:38', '2019-11-05 09:46:38'),
(2027, 491, 485, 0, '2019-11-05 09:46:41', '2019-11-05 09:46:41'),
(2028, 491, 471, 0, '2019-11-05 09:46:42', '2019-11-05 09:46:42'),
(2029, 491, 469, 0, '2019-11-05 09:46:44', '2019-11-05 09:46:44'),
(2030, 491, 468, 0, '2019-11-05 09:46:46', '2019-11-05 09:46:46'),
(2031, 491, 474, 0, '2019-11-05 09:46:47', '2019-11-05 09:46:47'),
(2032, 491, 467, 0, '2019-11-05 09:46:48', '2019-11-05 09:46:48'),
(2033, 491, 470, 0, '2019-11-05 09:46:49', '2019-11-05 09:46:49'),
(2034, 491, 472, 0, '2019-11-05 09:46:51', '2019-11-05 09:46:51'),
(2035, 491, 473, 0, '2019-11-05 09:46:52', '2019-11-05 09:46:52'),
(2036, 493, 479, 0, '2019-11-05 11:01:20', '2019-11-05 11:01:20'),
(2037, 493, 483, 0, '2019-11-05 11:01:21', '2019-11-05 11:01:21'),
(2038, 493, 485, 0, '2019-11-05 11:01:22', '2019-11-05 11:01:22'),
(2039, 493, 482, 0, '2019-11-05 11:01:22', '2019-11-05 11:01:22'),
(2040, 467, 474, 0, '2019-11-05 11:09:30', '2019-11-05 11:09:30'),
(2041, 467, 492, 0, '2019-11-05 11:09:31', '2019-11-05 11:09:31'),
(2042, 467, 484, 0, '2019-11-05 11:09:32', '2019-11-05 11:09:32'),
(2043, 467, 491, 0, '2019-11-05 11:09:33', '2019-11-05 11:09:33'),
(2044, 467, 489, 0, '2019-11-05 11:09:34', '2019-11-05 11:09:34'),
(2045, 467, 481, 0, '2019-11-05 11:09:36', '2019-11-05 11:09:36'),
(2046, 467, 486, 0, '2019-11-05 11:09:37', '2019-11-05 11:09:37'),
(2047, 467, 480, 0, '2019-11-05 11:09:39', '2019-11-05 11:09:39'),
(2048, 467, 479, 0, '2019-11-05 11:09:40', '2019-11-05 11:09:40'),
(2049, 467, 493, 0, '2019-11-05 11:09:40', '2019-11-05 11:09:40'),
(2050, 467, 483, 0, '2019-11-05 11:09:41', '2019-11-05 11:09:41'),
(2051, 467, 485, 0, '2019-11-05 11:09:41', '2019-11-05 11:09:41'),
(2052, 467, 482, 0, '2019-11-05 11:09:42', '2019-11-05 11:09:42'),
(2053, 467, 473, 0, '2019-11-05 11:09:43', '2019-11-05 11:09:43'),
(2054, 497, 496, 1, '2019-11-05 13:11:42', '2019-11-05 13:11:42'),
(2055, 497, 494, 1, '2019-11-05 13:11:43', '2019-11-05 13:11:43'),
(2056, 497, 495, 1, '2019-11-05 13:11:44', '2019-11-05 13:11:44'),
(2057, 497, 470, 1, '2019-11-05 13:11:44', '2019-11-05 13:11:44'),
(2061, 492, 494, 0, '2019-11-05 13:53:15', '2019-11-05 13:53:15');

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
(409, 'C', 467, 466, 1, '2019-11-04 17:53:46', '2019-11-04 17:53:46'),
(410, 'C', 466, 469, 1, '2019-11-04 18:08:47', '2019-11-04 18:08:47'),
(411, 'C', 466, 470, 1, '2019-11-04 18:41:42', '2019-11-04 18:41:42'),
(412, 'C', 466, 468, 1, '2019-11-04 18:47:50', '2019-11-04 18:47:50'),
(413, 'L', 469, 471, 1, '2019-11-04 18:56:02', '2019-11-04 18:56:02'),
(414, 'C', 468, 469, 1, '2019-11-04 18:56:05', '2019-11-04 18:56:05'),
(415, 'C', 468, 470, 1, '2019-11-04 19:01:36', '2019-11-04 19:01:36'),
(416, 'L', 470, 471, 1, '2019-11-04 19:03:02', '2019-11-04 19:03:02'),
(417, 'C', 467, 470, 1, '2019-11-04 19:21:33', '2019-11-04 19:21:33'),
(418, 'L', 468, 471, 1, '2019-11-04 19:29:14', '2019-11-04 19:29:14'),
(419, 'C', 468, 467, 1, '2019-11-04 19:54:46', '2019-11-04 19:54:46'),
(420, 'C', 473, 466, 1, '2019-11-04 22:18:53', '2019-11-04 22:18:53'),
(421, 'C', 466, 479, 1, '2019-11-05 03:59:43', '2019-11-05 03:59:43'),
(422, 'C', 466, 471, 1, '2019-11-05 04:02:58', '2019-11-05 04:02:58'),
(423, 'L', 471, 472, 1, '2019-11-05 04:03:00', '2019-11-05 04:03:00'),
(424, 'C', 466, 480, 1, '2019-11-05 04:56:08', '2019-11-05 04:56:08'),
(425, 'L', 481, 471, 1, '2019-11-05 06:29:40', '2019-11-05 06:29:40'),
(426, 'C', 473, 468, 1, '2019-11-05 06:36:27', '2019-11-05 06:36:27'),
(427, 'C', 481, 480, 1, '2019-11-05 06:40:38', '2019-11-05 06:40:38'),
(428, 'C', 486, 480, 1, '2019-11-05 07:10:40', '2019-11-05 07:10:40'),
(429, 'C', 489, 480, 1, '2019-11-05 07:20:41', '2019-11-05 07:20:41'),
(430, 'C', 487, 489, 1, '2019-11-05 07:23:32', '2019-11-05 07:23:32'),
(431, 'L', 470, 487, 1, '2019-11-05 07:24:28', '2019-11-05 07:24:28'),
(432, 'L', 470, 479, 1, '2019-11-05 07:24:30', '2019-11-05 07:24:30'),
(433, 'C', 473, 470, 1, '2019-11-05 07:24:31', '2019-11-05 07:24:31'),
(434, 'C', 487, 471, 1, '2019-11-05 07:24:35', '2019-11-05 07:24:35'),
(435, 'L', 480, 487, 1, '2019-11-05 07:25:07', '2019-11-05 07:25:07'),
(436, 'C', 487, 482, 1, '2019-11-05 07:26:53', '2019-11-05 07:26:53'),
(437, 'C', 473, 482, 1, '2019-11-05 07:26:56', '2019-11-05 07:26:56'),
(438, 'L', 482, 471, 1, '2019-11-05 07:26:58', '2019-11-05 07:26:58'),
(439, 'C', 487, 484, 1, '2019-11-05 07:54:39', '2019-11-05 07:54:39'),
(440, 'C', 487, 467, 1, '2019-11-05 09:05:10', '2019-11-05 09:05:10'),
(442, 'C', 487, 468, 1, '2019-11-05 09:11:45', '2019-11-05 09:11:45'),
(443, 'C', 484, 480, 1, '2019-11-05 09:24:25', '2019-11-05 09:24:25'),
(444, 'C', 495, 467, 1, '2019-11-05 12:43:55', '2019-11-05 12:43:55'),
(445, 'C', 466, 497, 1, '2019-11-05 14:04:25', '2019-11-05 14:04:25'),
(446, 'C', 497, 467, 1, '2019-11-05 14:07:02', '2019-11-05 14:07:02');

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
(2453, 'S_C_R', 920, 467, 466, 0, 1, '2019-11-04 17:45:56', '2019-11-04 17:53:46'),
(2454, 'A_C_R', 920, 466, 467, 0, 1, '2019-11-04 17:53:46', '2019-11-04 18:39:42'),
(2455, 'S_C_R', 921, 466, 468, 0, 1, '2019-11-04 18:03:12', '2019-11-04 18:47:50'),
(2456, 'S_C_R', 922, 466, 469, 0, 1, '2019-11-04 18:08:34', '2019-11-04 18:08:47'),
(2457, 'A_C_R', 922, 469, 466, 1, 1, '2019-11-04 18:08:47', '2019-11-04 18:41:19'),
(2458, 'S_C_R', 923, 466, 470, 0, 1, '2019-11-04 18:41:29', '2019-11-04 18:41:42'),
(2459, 'A_C_R', 923, 470, 466, 1, 1, '2019-11-04 18:41:42', '2019-11-04 18:46:34'),
(2460, 'A_C_R', 921, 468, 466, 1, 1, '2019-11-04 18:47:50', '2019-11-04 18:58:54'),
(2461, 'S_C_R', 924, 468, 470, 0, 1, '2019-11-04 18:47:59', '2019-11-04 19:01:36'),
(2462, 'S_C_R', 925, 468, 467, 0, 1, '2019-11-04 18:48:04', '2019-11-04 19:54:46'),
(2463, 'S_C_R', 926, 468, 469, 0, 1, '2019-11-04 18:48:06', '2019-11-04 18:56:05'),
(2464, 'S_L_R', 1961, 471, 469, 0, 1, '2019-11-04 18:55:39', '2019-11-04 18:56:02'),
(2465, 'S_L_R', 1962, 471, 468, 0, 1, '2019-11-04 18:55:41', '2019-11-04 19:29:14'),
(2466, 'A_L_R', 1963, 469, 471, 0, 1, '2019-11-04 18:56:02', '2019-11-04 19:03:47'),
(2467, 'A_C_R', 926, 469, 468, 1, 1, '2019-11-04 18:56:05', '2019-11-04 19:29:11'),
(2468, 'A_C_R', 924, 470, 468, 1, 1, '2019-11-04 19:01:36', '2019-11-04 19:29:11'),
(2469, 'S_L_R', 1964, 471, 470, 0, 1, '2019-11-04 19:02:44', '2019-11-04 19:03:02'),
(2470, 'A_L_R', 1965, 470, 471, 0, 1, '2019-11-04 19:03:02', '2019-11-04 19:03:19'),
(2471, 'S_C_R', 927, 467, 470, 0, 1, '2019-11-04 19:21:26', '2019-11-04 19:21:33'),
(2472, 'A_C_R', 927, 470, 467, 1, 1, '2019-11-04 19:21:33', '2019-11-04 19:54:37'),
(2473, 'A_L_R', 1968, 468, 471, 0, 1, '2019-11-04 19:29:14', '2019-11-05 04:33:23'),
(2474, 'P_L_R', 153, 470, 466, 1, 1, '2019-11-04 19:37:21', '2019-11-04 19:38:53'),
(2475, 'P_L_R', 152, 470, 466, 1, 1, '2019-11-04 19:37:25', '2019-11-04 19:38:53'),
(2476, 'S_C_R', 928, 466, 471, 0, 1, '2019-11-04 19:39:24', '2019-11-05 04:02:58'),
(2477, 'A_C_R', 925, 467, 468, 1, 1, '2019-11-04 19:54:46', '2019-11-05 06:36:23'),
(2478, 'P_L_R', 153, 467, 466, 0, 1, '2019-11-04 19:55:12', '2019-11-04 19:58:02'),
(2479, 'S_L_R', 1972, 472, 471, 0, 1, '2019-11-04 20:45:47', '2019-11-05 04:03:00'),
(2480, 'P_L_R', 155, 472, 467, 0, 1, '2019-11-04 21:05:54', '2019-11-04 21:09:23'),
(2481, 'P_L_R', 155, 466, 467, 1, 1, '2019-11-04 21:15:35', '2019-11-04 21:50:35'),
(2482, 'S_C_R', 929, 466, 472, 1, 0, '2019-11-04 21:16:18', '2019-11-04 21:16:18'),
(2483, 'S_C_R', 930, 473, 466, 0, 1, '2019-11-04 22:16:05', '2019-11-04 22:18:53'),
(2484, 'S_C_R', 931, 473, 470, 0, 1, '2019-11-04 22:16:17', '2019-11-05 07:24:31'),
(2485, 'S_C_R', 932, 473, 468, 0, 1, '2019-11-04 22:16:20', '2019-11-05 06:36:27'),
(2486, 'A_C_R', 930, 466, 473, 0, 1, '2019-11-04 22:18:53', '2019-11-04 22:48:19'),
(2487, 'S_C_R', 933, 475, 469, 1, 0, '2019-11-05 00:51:33', '2019-11-05 00:51:33'),
(2488, 'S_C_R', 934, 466, 477, 1, 0, '2019-11-05 01:18:15', '2019-11-05 01:18:15'),
(2489, 'S_C_R', 935, 466, 474, 0, 1, '2019-11-05 01:18:44', '2019-11-05 10:48:26'),
(2490, 'P_L_R', 153, 473, 466, 1, 1, '2019-11-05 01:49:37', '2019-11-05 01:50:19'),
(2491, 'P_L_R', 157, 466, 473, 1, 1, '2019-11-05 01:50:08', '2019-11-05 01:50:28'),
(2492, 'S_C_R', 936, 473, 474, 0, 1, '2019-11-05 02:13:53', '2019-11-05 10:48:38'),
(2493, 'S_C_R', 937, 466, 479, 0, 1, '2019-11-05 03:59:23', '2019-11-05 03:59:43'),
(2494, 'A_C_R', 937, 479, 466, 1, 1, '2019-11-05 03:59:43', '2019-11-05 04:51:20'),
(2495, 'S_L_R', 1986, 479, 470, 0, 1, '2019-11-05 04:00:44', '2019-11-05 07:24:30'),
(2496, 'A_C_R', 928, 471, 466, 1, 1, '2019-11-05 04:02:58', '2019-11-05 04:51:20'),
(2497, 'A_L_R', 1987, 471, 472, 1, 0, '2019-11-05 04:03:00', '2019-11-05 04:03:00'),
(2498, 'P_L_R', 153, 471, 466, 1, 1, '2019-11-05 04:29:35', '2019-11-05 04:51:20'),
(2499, 'P_L_R', 153, 481, 466, 1, 1, '2019-11-05 04:39:34', '2019-11-05 04:51:20'),
(2500, 'S_C_R', 938, 466, 480, 0, 1, '2019-11-05 04:51:38', '2019-11-05 04:56:08'),
(2501, 'A_C_R', 938, 480, 466, 1, 1, '2019-11-05 04:56:08', '2019-11-05 13:29:01'),
(2502, 'P_L_R', 153, 480, 466, 1, 1, '2019-11-05 04:56:52', '2019-11-05 13:29:01'),
(2503, 'S_C_R', 939, 473, 482, 0, 1, '2019-11-05 05:50:40', '2019-11-05 07:26:56'),
(2504, 'S_L_R', 1996, 471, 474, 0, 1, '2019-11-05 05:58:24', '2019-11-05 10:48:43'),
(2505, 'S_L_R', 1997, 471, 481, 0, 1, '2019-11-05 05:58:26', '2019-11-05 06:29:40'),
(2506, 'S_L_R', 1998, 471, 482, 0, 1, '2019-11-05 05:58:28', '2019-11-05 07:26:58'),
(2507, 'A_L_R', 1999, 481, 471, 0, 1, '2019-11-05 06:29:40', '2019-11-05 07:17:23'),
(2508, 'A_C_R', 932, 468, 473, 1, 0, '2019-11-05 06:36:27', '2019-11-05 06:36:27'),
(2509, 'S_C_R', 940, 481, 480, 0, 1, '2019-11-05 06:40:27', '2019-11-05 06:40:38'),
(2510, 'A_C_R', 940, 480, 481, 1, 0, '2019-11-05 06:40:38', '2019-11-05 06:40:38'),
(2511, 'S_C_R', 941, 486, 480, 0, 1, '2019-11-05 07:10:35', '2019-11-05 07:10:40'),
(2512, 'A_C_R', 941, 480, 486, 1, 1, '2019-11-05 07:10:40', '2019-11-05 07:13:29'),
(2513, 'P_L_R', 158, 471, 481, 1, 0, '2019-11-05 07:12:26', '2019-11-05 07:12:26'),
(2514, 'S_C_R', 942, 489, 480, 0, 1, '2019-11-05 07:20:01', '2019-11-05 07:20:41'),
(2515, 'A_C_R', 942, 480, 489, 1, 1, '2019-11-05 07:20:41', '2019-11-05 07:23:29'),
(2516, 'S_C_R', 943, 487, 471, 0, 1, '2019-11-05 07:23:02', '2019-11-05 07:24:35'),
(2517, 'S_L_R', 2002, 487, 483, 1, 0, '2019-11-05 07:23:05', '2019-11-05 07:23:05'),
(2518, 'S_C_R', 944, 487, 484, 0, 1, '2019-11-05 07:23:06', '2019-11-05 07:54:39'),
(2519, 'S_L_R', 2003, 487, 485, 1, 0, '2019-11-05 07:23:08', '2019-11-05 07:23:08'),
(2520, 'S_C_R', 945, 487, 479, 1, 1, '2019-11-05 07:23:10', '2019-11-05 07:30:28'),
(2521, 'S_C_R', 946, 487, 482, 0, 1, '2019-11-05 07:23:12', '2019-11-05 07:26:53'),
(2522, 'S_C_R', 947, 487, 489, 0, 1, '2019-11-05 07:23:14', '2019-11-05 07:23:32'),
(2523, 'S_L_R', 2004, 487, 480, 0, 0, '2019-11-05 07:23:15', '2019-11-05 07:25:07'),
(2524, 'S_C_R', 948, 487, 486, 1, 0, '2019-11-05 07:23:17', '2019-11-05 07:23:17'),
(2525, 'S_L_R', 2005, 487, 481, 1, 0, '2019-11-05 07:23:19', '2019-11-05 07:23:19'),
(2526, 'S_L_R', 2006, 487, 469, 1, 0, '2019-11-05 07:23:27', '2019-11-05 07:23:27'),
(2527, 'S_C_R', 949, 487, 468, 0, 1, '2019-11-05 07:23:29', '2019-11-05 09:11:45'),
(2528, 'S_L_R', 2007, 487, 474, 0, 1, '2019-11-05 07:23:31', '2019-11-05 10:48:11'),
(2529, 'A_C_R', 947, 489, 487, 0, 1, '2019-11-05 07:23:32', '2019-11-05 07:24:29'),
(2530, 'S_C_R', 950, 487, 467, 0, 1, '2019-11-05 07:23:33', '2019-11-05 09:05:10'),
(2531, 'S_L_R', 2008, 487, 470, 0, 1, '2019-11-05 07:23:43', '2019-11-05 07:24:28'),
(2532, 'S_C_R', 951, 487, 472, 1, 0, '2019-11-05 07:23:52', '2019-11-05 07:23:52'),
(2533, 'S_L_R', 2009, 487, 473, 1, 0, '2019-11-05 07:23:56', '2019-11-05 07:23:56'),
(2534, 'A_L_R', 2010, 470, 487, 0, 1, '2019-11-05 07:24:28', '2019-11-05 07:26:00'),
(2535, 'A_L_R', 2011, 470, 479, 0, 1, '2019-11-05 07:24:30', '2019-11-05 07:32:08'),
(2536, 'A_C_R', 931, 470, 473, 1, 0, '2019-11-05 07:24:31', '2019-11-05 07:24:31'),
(2537, 'A_C_R', 943, 471, 487, 1, 1, '2019-11-05 07:24:35', '2019-11-05 07:25:56'),
(2538, 'P_L_R', 161, 487, 489, 1, 0, '2019-11-05 07:24:37', '2019-11-05 07:24:37'),
(2539, 'A_L_R', 2012, 480, 487, 1, 1, '2019-11-05 07:25:07', '2019-11-05 07:25:56'),
(2540, 'P_L_R', 159, 487, 471, 0, 1, '2019-11-05 07:26:10', '2019-11-05 07:29:36'),
(2541, 'A_C_R', 946, 482, 487, 0, 1, '2019-11-05 07:26:53', '2019-11-05 07:51:38'),
(2542, 'A_C_R', 939, 482, 473, 1, 0, '2019-11-05 07:26:56', '2019-11-05 07:26:56'),
(2543, 'A_L_R', 2013, 482, 471, 0, 1, '2019-11-05 07:26:58', '2019-11-05 07:29:38'),
(2544, 'P_L_R', 155, 487, 467, 1, 1, '2019-11-05 07:30:06', '2019-11-05 09:05:01'),
(2545, 'P_L_R', 163, 487, 482, 0, 1, '2019-11-05 07:52:00', '2019-11-05 07:53:16'),
(2546, 'S_L_R', 2016, 484, 489, 1, 0, '2019-11-05 07:53:29', '2019-11-05 07:53:29'),
(2547, 'S_C_R', 952, 484, 480, 0, 1, '2019-11-05 07:53:31', '2019-11-05 09:24:25'),
(2548, 'S_C_R', 953, 484, 481, 1, 0, '2019-11-05 07:53:32', '2019-11-05 07:53:32'),
(2549, 'S_C_R', 954, 484, 486, 1, 0, '2019-11-05 07:53:33', '2019-11-05 07:53:33'),
(2550, 'S_C_R', 955, 484, 479, 1, 0, '2019-11-05 07:53:36', '2019-11-05 07:53:36'),
(2551, 'A_C_R', 944, 484, 487, 1, 0, '2019-11-05 07:54:39', '2019-11-05 07:54:39'),
(2552, 'A_C_R', 950, 467, 487, 1, 0, '2019-11-05 09:05:10', '2019-11-05 09:05:10'),
(2557, 'A_C_R', 949, 468, 487, 1, 0, '2019-11-05 09:11:45', '2019-11-05 09:11:45'),
(2558, 'S_C_R', 956, 468, 488, 1, 0, '2019-11-05 09:11:59', '2019-11-05 09:11:59'),
(2559, 'A_C_R', 952, 480, 484, 1, 0, '2019-11-05 09:24:25', '2019-11-05 09:24:25'),
(2560, 'S_C_R', 957, 467, 485, 1, 0, '2019-11-05 11:10:45', '2019-11-05 11:10:45'),
(2561, 'S_C_R', 958, 495, 467, 0, 1, '2019-11-05 12:07:26', '2019-11-05 12:43:55'),
(2562, 'A_C_R', 958, 467, 495, 1, 0, '2019-11-05 12:43:55', '2019-11-05 12:43:55'),
(2563, 'S_L_R', 2054, 497, 496, 1, 0, '2019-11-05 13:11:42', '2019-11-05 13:11:42'),
(2564, 'S_L_R', 2055, 497, 494, 1, 0, '2019-11-05 13:11:43', '2019-11-05 13:11:43'),
(2565, 'S_L_R', 2056, 497, 495, 1, 0, '2019-11-05 13:11:44', '2019-11-05 13:11:44'),
(2566, 'S_L_R', 2057, 497, 470, 1, 0, '2019-11-05 13:11:44', '2019-11-05 13:11:44'),
(2567, 'S_C_R', 959, 497, 492, 0, 1, '2019-11-05 13:11:50', '2019-11-05 13:52:03'),
(2568, 'S_C_R', 960, 497, 488, 1, 0, '2019-11-05 13:11:51', '2019-11-05 13:11:51'),
(2569, 'S_C_R', 961, 497, 474, 1, 0, '2019-11-05 13:11:52', '2019-11-05 13:11:52'),
(2570, 'S_C_R', 962, 497, 468, 1, 0, '2019-11-05 13:11:53', '2019-11-05 13:11:53'),
(2571, 'S_C_R', 963, 497, 467, 0, 1, '2019-11-05 13:11:55', '2019-11-05 14:07:02'),
(2572, 'S_C_R', 964, 466, 496, 1, 0, '2019-11-05 13:31:11', '2019-11-05 13:31:11'),
(2573, 'S_C_R', 965, 466, 494, 1, 0, '2019-11-05 13:31:22', '2019-11-05 13:31:22'),
(2575, 'S_C_R', 966, 466, 488, 1, 0, '2019-11-05 13:31:30', '2019-11-05 13:31:30'),
(2577, 'S_C_R', 968, 466, 497, 0, 1, '2019-11-05 13:31:52', '2019-11-05 14:04:25'),
(2578, 'S_C_R', 969, 466, 495, 1, 0, '2019-11-05 13:31:55', '2019-11-05 13:31:55'),
(2579, 'A_C_R', 968, 497, 466, 1, 0, '2019-11-05 14:04:25', '2019-11-05 14:04:25'),
(2580, 'A_C_R', 963, 467, 497, 1, 0, '2019-11-05 14:07:02', '2019-11-05 14:07:02');

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
(2453, 1, 'Zaib rajput has sent you Connect Request', '2019-11-04 17:45:56', '2019-11-04 17:45:56'),
(2453, 2, 'Zaib rajput hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 17:45:56', '2019-11-04 17:45:56'),
(2454, 1, 'Tim accepted a connect request.', '2019-11-04 17:53:46', '2019-11-04 17:53:46'),
(2454, 2, 'Tim hat eine Verbindungsanforderung angenommen.', '2019-11-04 17:53:46', '2019-11-04 17:53:46'),
(2455, 1, 'Tim has sent you Connect Request', '2019-11-04 18:03:12', '2019-11-04 18:03:12'),
(2455, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 18:03:12', '2019-11-04 18:03:12'),
(2456, 1, 'Tim has sent you Connect Request', '2019-11-04 18:08:34', '2019-11-04 18:08:34'),
(2456, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 18:08:34', '2019-11-04 18:08:34'),
(2457, 1, 'Denis accepted a connect request.', '2019-11-04 18:08:47', '2019-11-04 18:08:47'),
(2457, 2, 'Denis hat eine Verbindungsanforderung angenommen.', '2019-11-04 18:08:47', '2019-11-04 18:08:47'),
(2458, 1, 'Tim has sent you Connect Request', '2019-11-04 18:41:29', '2019-11-04 18:41:29'),
(2458, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 18:41:29', '2019-11-04 18:41:29'),
(2459, 1, 'Clara accepted a connect request.', '2019-11-04 18:41:42', '2019-11-04 18:41:42'),
(2459, 2, 'Clara hat eine Verbindungsanforderung angenommen.', '2019-11-04 18:41:42', '2019-11-04 18:41:42'),
(2460, 1, 'Sonte accepted a connect request.', '2019-11-04 18:47:50', '2019-11-04 18:47:50'),
(2460, 2, 'Sonte hat eine Verbindungsanforderung angenommen.', '2019-11-04 18:47:50', '2019-11-04 18:47:50'),
(2461, 1, 'Sonte has sent you Connect Request', '2019-11-04 18:47:59', '2019-11-04 18:47:59'),
(2461, 2, 'Sonte hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 18:47:59', '2019-11-04 18:47:59'),
(2462, 1, 'Sonte has sent you Connect Request', '2019-11-04 18:48:04', '2019-11-04 18:48:04'),
(2462, 2, 'Sonte hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 18:48:04', '2019-11-04 18:48:04'),
(2463, 1, 'Sonte has sent you Connect Request', '2019-11-04 18:48:06', '2019-11-04 18:48:06'),
(2463, 2, 'Sonte hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 18:48:06', '2019-11-04 18:48:06'),
(2464, 1, 'robost has sent you Date Request.', '2019-11-04 18:55:39', '2019-11-04 18:55:39'),
(2464, 2, 'robost hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 18:55:39', '2019-11-04 18:55:39'),
(2465, 1, 'robost has sent you Date Request.', '2019-11-04 18:55:41', '2019-11-04 18:55:41'),
(2465, 2, 'robost hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 18:55:41', '2019-11-04 18:55:41'),
(2466, 1, 'Denis has accepted your Date Request.', '2019-11-04 18:56:02', '2019-11-04 18:56:02'),
(2466, 2, 'Denis hat Ihre Terminanfrage angenommen.', '2019-11-04 18:56:02', '2019-11-04 18:56:02'),
(2467, 1, 'Denis accepted a connect request.', '2019-11-04 18:56:05', '2019-11-04 18:56:05'),
(2467, 2, 'Denis hat eine Verbindungsanforderung angenommen.', '2019-11-04 18:56:05', '2019-11-04 18:56:05'),
(2468, 1, 'Clara accepted a connect request.', '2019-11-04 19:01:36', '2019-11-04 19:01:36'),
(2468, 2, 'Clara hat eine Verbindungsanforderung angenommen.', '2019-11-04 19:01:36', '2019-11-04 19:01:36'),
(2469, 1, 'robost has sent you Date Request.', '2019-11-04 19:02:44', '2019-11-04 19:02:44'),
(2469, 2, 'robost hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 19:02:44', '2019-11-04 19:02:44'),
(2470, 1, 'Clara has accepted your Date Request.', '2019-11-04 19:03:02', '2019-11-04 19:03:02'),
(2470, 2, 'Clara hat Ihre Terminanfrage angenommen.', '2019-11-04 19:03:02', '2019-11-04 19:03:02'),
(2471, 1, 'Zaib rajput has sent you Connect Request', '2019-11-04 19:21:26', '2019-11-04 19:21:26'),
(2471, 2, 'Zaib rajput hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 19:21:26', '2019-11-04 19:21:26'),
(2472, 1, 'Clara accepted a connect request.', '2019-11-04 19:21:33', '2019-11-04 19:21:33'),
(2472, 2, 'Clara hat eine Verbindungsanforderung angenommen.', '2019-11-04 19:21:33', '2019-11-04 19:21:33'),
(2473, 1, 'Sonte has accepted your Date Request.', '2019-11-04 19:29:14', '2019-11-04 19:29:14'),
(2473, 2, 'Sonte hat Ihre Terminanfrage angenommen.', '2019-11-04 19:29:14', '2019-11-04 19:29:14'),
(2474, 1, 'Clara has liked your post.', '2019-11-04 19:37:21', '2019-11-04 19:37:21'),
(2474, 2, 'Clara hat Ihren Beitrag gefallen.', '2019-11-04 19:37:21', '2019-11-04 19:37:21'),
(2475, 1, 'Clara has liked your post.', '2019-11-04 19:37:25', '2019-11-04 19:37:25'),
(2475, 2, 'Clara hat Ihren Beitrag gefallen.', '2019-11-04 19:37:25', '2019-11-04 19:37:25'),
(2476, 1, 'Tim has sent you Connect Request', '2019-11-04 19:39:24', '2019-11-04 19:39:24'),
(2476, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 19:39:24', '2019-11-04 19:39:24'),
(2477, 1, 'Zaib rajput accepted a connect request.', '2019-11-04 19:54:46', '2019-11-04 19:54:46'),
(2477, 2, 'Zaib rajput hat eine Verbindungsanforderung angenommen.', '2019-11-04 19:54:46', '2019-11-04 19:54:46'),
(2478, 1, 'Zaib rajput has liked your post.', '2019-11-04 19:55:12', '2019-11-04 19:55:12'),
(2478, 2, 'Zaib rajput hat Ihren Beitrag gefallen.', '2019-11-04 19:55:12', '2019-11-04 19:55:12'),
(2479, 1, 'Vanésio has sent you Date Request.', '2019-11-04 20:45:47', '2019-11-04 20:45:47'),
(2479, 2, 'Vanésio hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 20:45:47', '2019-11-04 20:45:47'),
(2480, 1, 'Vanésio has liked your post.', '2019-11-04 21:05:54', '2019-11-04 21:05:54'),
(2480, 2, 'Vanésio hat Ihren Beitrag gefallen.', '2019-11-04 21:05:54', '2019-11-04 21:05:54'),
(2481, 1, 'Tim has liked your post.', '2019-11-04 21:15:35', '2019-11-04 21:15:35'),
(2481, 2, 'Tim hat Ihren Beitrag gefallen.', '2019-11-04 21:15:35', '2019-11-04 21:15:35'),
(2482, 1, 'Tim has sent you Connect Request', '2019-11-04 21:16:18', '2019-11-04 21:16:18'),
(2482, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 21:16:18', '2019-11-04 21:16:18'),
(2483, 1, 'Felix has sent you Connect Request', '2019-11-04 22:16:05', '2019-11-04 22:16:05'),
(2483, 2, 'Felix hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 22:16:05', '2019-11-04 22:16:05'),
(2484, 1, 'Felix has sent you Connect Request', '2019-11-04 22:16:17', '2019-11-04 22:16:17'),
(2484, 2, 'Felix hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 22:16:17', '2019-11-04 22:16:17'),
(2485, 1, 'Felix has sent you Connect Request', '2019-11-04 22:16:20', '2019-11-04 22:16:20'),
(2485, 2, 'Felix hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 22:16:20', '2019-11-04 22:16:20'),
(2486, 1, 'Tim accepted a connect request.', '2019-11-04 22:18:53', '2019-11-04 22:18:53'),
(2486, 2, 'Tim hat eine Verbindungsanforderung angenommen.', '2019-11-04 22:18:53', '2019-11-04 22:18:53'),
(2487, 1, 'daria has sent you Connect Request', '2019-11-05 00:51:33', '2019-11-05 00:51:33'),
(2487, 2, 'daria hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 00:51:33', '2019-11-05 00:51:33'),
(2488, 1, 'Tim has sent you Connect Request', '2019-11-05 01:18:15', '2019-11-05 01:18:15'),
(2488, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 01:18:15', '2019-11-05 01:18:15'),
(2489, 1, 'Tim has sent you Connect Request', '2019-11-05 01:18:44', '2019-11-05 01:18:44'),
(2489, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 01:18:44', '2019-11-05 01:18:44'),
(2490, 1, 'Felix has liked your post.', '2019-11-05 01:49:37', '2019-11-05 01:49:37'),
(2490, 2, 'Felix hat Ihren Beitrag gefallen.', '2019-11-05 01:49:37', '2019-11-05 01:49:37'),
(2491, 1, 'Tim has liked your post.', '2019-11-05 01:50:08', '2019-11-05 01:50:08'),
(2491, 2, 'Tim hat Ihren Beitrag gefallen.', '2019-11-05 01:50:08', '2019-11-05 01:50:08'),
(2492, 1, 'Felix has sent you Connect Request', '2019-11-05 02:13:53', '2019-11-05 02:13:53'),
(2492, 2, 'Felix hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 02:13:53', '2019-11-05 02:13:53'),
(2493, 1, 'Tim has sent you Connect Request', '2019-11-05 03:59:23', '2019-11-05 03:59:23'),
(2493, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 03:59:23', '2019-11-05 03:59:23'),
(2494, 1, 'John Carter accepted a connect request.', '2019-11-05 03:59:43', '2019-11-05 03:59:43'),
(2494, 2, 'John Carter hat eine Verbindungsanforderung angenommen.', '2019-11-05 03:59:43', '2019-11-05 03:59:43'),
(2495, 1, 'John Carter has sent you Date Request.', '2019-11-05 04:00:44', '2019-11-05 04:00:44'),
(2495, 2, 'John Carter hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 04:00:44', '2019-11-05 04:00:44'),
(2496, 1, 'robost accepted a connect request.', '2019-11-05 04:02:58', '2019-11-05 04:02:58'),
(2496, 2, 'robost hat eine Verbindungsanforderung angenommen.', '2019-11-05 04:02:58', '2019-11-05 04:02:58'),
(2497, 1, 'robost has accepted your Date Request.', '2019-11-05 04:03:00', '2019-11-05 04:03:00'),
(2497, 2, 'robost hat Ihre Terminanfrage angenommen.', '2019-11-05 04:03:00', '2019-11-05 04:03:00'),
(2498, 1, 'robost has liked your post.', '2019-11-05 04:29:35', '2019-11-05 04:29:35'),
(2498, 2, 'robost hat Ihren Beitrag gefallen.', '2019-11-05 04:29:35', '2019-11-05 04:29:35'),
(2499, 1, 'testing name has liked your post.', '2019-11-05 04:39:34', '2019-11-05 04:39:34'),
(2499, 2, 'testing name hat Ihren Beitrag gefallen.', '2019-11-05 04:39:34', '2019-11-05 04:39:34'),
(2500, 1, 'Tim has sent you Connect Request', '2019-11-05 04:51:38', '2019-11-05 04:51:38'),
(2500, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 04:51:38', '2019-11-05 04:51:38'),
(2501, 1, 'Manish accepted a connect request.', '2019-11-05 04:56:08', '2019-11-05 04:56:08'),
(2501, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-05 04:56:08', '2019-11-05 04:56:08'),
(2502, 1, 'Manish has liked your post.', '2019-11-05 04:56:52', '2019-11-05 04:56:52'),
(2502, 2, 'Manish hat Ihren Beitrag gefallen.', '2019-11-05 04:56:52', '2019-11-05 04:56:52'),
(2503, 1, 'Felix has sent you Connect Request', '2019-11-05 05:50:40', '2019-11-05 05:50:40'),
(2503, 2, 'Felix hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 05:50:40', '2019-11-05 05:50:40'),
(2504, 1, 'robost has sent you Date Request.', '2019-11-05 05:58:24', '2019-11-05 05:58:24'),
(2504, 2, 'robost hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 05:58:24', '2019-11-05 05:58:24'),
(2505, 1, 'robost has sent you Date Request.', '2019-11-05 05:58:26', '2019-11-05 05:58:26'),
(2505, 2, 'robost hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 05:58:26', '2019-11-05 05:58:26'),
(2506, 1, 'robost has sent you Date Request.', '2019-11-05 05:58:28', '2019-11-05 05:58:28'),
(2506, 2, 'robost hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 05:58:28', '2019-11-05 05:58:28'),
(2507, 1, 'testing name has accepted your Date Request.', '2019-11-05 06:29:40', '2019-11-05 06:29:40'),
(2507, 2, 'testing name hat Ihre Terminanfrage angenommen.', '2019-11-05 06:29:40', '2019-11-05 06:29:40'),
(2508, 1, 'Sonte accepted a connect request.', '2019-11-05 06:36:27', '2019-11-05 06:36:27'),
(2508, 2, 'Sonte hat eine Verbindungsanforderung angenommen.', '2019-11-05 06:36:27', '2019-11-05 06:36:27'),
(2509, 1, 'testing name has sent you Connect Request', '2019-11-05 06:40:27', '2019-11-05 06:40:27'),
(2509, 2, 'testing name hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 06:40:27', '2019-11-05 06:40:27'),
(2510, 1, 'Manish accepted a connect request.', '2019-11-05 06:40:38', '2019-11-05 06:40:38'),
(2510, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-05 06:40:38', '2019-11-05 06:40:38'),
(2511, 1, 'testing 123 has sent you Connect Request', '2019-11-05 07:10:35', '2019-11-05 07:10:35'),
(2511, 2, 'testing 123 hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:10:35', '2019-11-05 07:10:35'),
(2512, 1, 'Manish accepted a connect request.', '2019-11-05 07:10:40', '2019-11-05 07:10:40'),
(2512, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-05 07:10:40', '2019-11-05 07:10:40'),
(2513, 1, 'robost has liked your post.', '2019-11-05 07:12:26', '2019-11-05 07:12:26'),
(2513, 2, 'robost hat Ihren Beitrag gefallen.', '2019-11-05 07:12:26', '2019-11-05 07:12:26'),
(2514, 1, 'preet singh has sent you Connect Request', '2019-11-05 07:20:01', '2019-11-05 07:20:01'),
(2514, 2, 'preet singh hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:20:01', '2019-11-05 07:20:01'),
(2515, 1, 'Manish accepted a connect request.', '2019-11-05 07:20:41', '2019-11-05 07:20:41'),
(2515, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-05 07:20:41', '2019-11-05 07:20:41'),
(2516, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:02', '2019-11-05 07:23:02'),
(2516, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:02', '2019-11-05 07:23:02'),
(2517, 1, 'James Smith has sent you Date Request.', '2019-11-05 07:23:05', '2019-11-05 07:23:05'),
(2517, 2, 'James Smith hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:23:05', '2019-11-05 07:23:05'),
(2518, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:06', '2019-11-05 07:23:06'),
(2518, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:06', '2019-11-05 07:23:06'),
(2519, 1, 'James Smith has sent you Date Request.', '2019-11-05 07:23:08', '2019-11-05 07:23:08'),
(2519, 2, 'James Smith hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:23:08', '2019-11-05 07:23:08'),
(2520, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:10', '2019-11-05 07:23:10'),
(2520, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:10', '2019-11-05 07:23:10'),
(2521, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:12', '2019-11-05 07:23:12'),
(2521, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:12', '2019-11-05 07:23:12'),
(2522, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:14', '2019-11-05 07:23:14'),
(2522, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:14', '2019-11-05 07:23:14'),
(2523, 1, 'James Smith has sent you Date Request.', '2019-11-05 07:23:15', '2019-11-05 07:23:15'),
(2523, 2, 'James Smith hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:23:15', '2019-11-05 07:23:15'),
(2524, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:17', '2019-11-05 07:23:17'),
(2524, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:17', '2019-11-05 07:23:17'),
(2525, 1, 'James Smith has sent you Date Request.', '2019-11-05 07:23:19', '2019-11-05 07:23:19'),
(2525, 2, 'James Smith hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:23:19', '2019-11-05 07:23:19'),
(2526, 1, 'James Smith has sent you Date Request.', '2019-11-05 07:23:27', '2019-11-05 07:23:27'),
(2526, 2, 'James Smith hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:23:27', '2019-11-05 07:23:27'),
(2527, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:29', '2019-11-05 07:23:29'),
(2527, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:29', '2019-11-05 07:23:29'),
(2528, 1, 'James Smith has sent you Date Request.', '2019-11-05 07:23:31', '2019-11-05 07:23:31'),
(2528, 2, 'James Smith hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:23:31', '2019-11-05 07:23:31'),
(2529, 1, 'preet singh accepted a connect request.', '2019-11-05 07:23:32', '2019-11-05 07:23:32'),
(2529, 2, 'preet singh hat eine Verbindungsanforderung angenommen.', '2019-11-05 07:23:32', '2019-11-05 07:23:32'),
(2530, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:33', '2019-11-05 07:23:33'),
(2530, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:33', '2019-11-05 07:23:33'),
(2531, 1, 'James Smith has sent you Date Request.', '2019-11-05 07:23:43', '2019-11-05 07:23:43'),
(2531, 2, 'James Smith hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:23:43', '2019-11-05 07:23:43'),
(2532, 1, 'James Smith has sent you Connect Request', '2019-11-05 07:23:52', '2019-11-05 07:23:52'),
(2532, 2, 'James Smith hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:23:52', '2019-11-05 07:23:52'),
(2533, 1, 'James Smith has sent you Date Request.', '2019-11-05 07:23:56', '2019-11-05 07:23:56'),
(2533, 2, 'James Smith hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:23:56', '2019-11-05 07:23:56'),
(2534, 1, 'Clara has accepted your Date Request.', '2019-11-05 07:24:28', '2019-11-05 07:24:28'),
(2534, 2, 'Clara hat Ihre Terminanfrage angenommen.', '2019-11-05 07:24:28', '2019-11-05 07:24:28'),
(2535, 1, 'Clara has accepted your Date Request.', '2019-11-05 07:24:30', '2019-11-05 07:24:30'),
(2535, 2, 'Clara hat Ihre Terminanfrage angenommen.', '2019-11-05 07:24:30', '2019-11-05 07:24:30'),
(2536, 1, 'Clara accepted a connect request.', '2019-11-05 07:24:31', '2019-11-05 07:24:31'),
(2536, 2, 'Clara hat eine Verbindungsanforderung angenommen.', '2019-11-05 07:24:31', '2019-11-05 07:24:31'),
(2537, 1, 'robost accepted a connect request.', '2019-11-05 07:24:35', '2019-11-05 07:24:35'),
(2537, 2, 'robost hat eine Verbindungsanforderung angenommen.', '2019-11-05 07:24:35', '2019-11-05 07:24:35'),
(2538, 1, 'James Smith has liked your post.', '2019-11-05 07:24:37', '2019-11-05 07:24:37'),
(2538, 2, 'James Smith hat Ihren Beitrag gefallen.', '2019-11-05 07:24:37', '2019-11-05 07:24:37'),
(2539, 1, 'Manish has accepted your Date Request.', '2019-11-05 07:25:07', '2019-11-05 07:25:07'),
(2539, 2, 'Manish hat Ihre Terminanfrage angenommen.', '2019-11-05 07:25:07', '2019-11-05 07:25:07'),
(2540, 1, 'James Smith has liked your post.', '2019-11-05 07:26:10', '2019-11-05 07:26:10'),
(2540, 2, 'James Smith hat Ihren Beitrag gefallen.', '2019-11-05 07:26:10', '2019-11-05 07:26:10'),
(2541, 1, 'Micheal Johns accepted a connect request.', '2019-11-05 07:26:53', '2019-11-05 07:26:53'),
(2541, 2, 'Micheal Johns hat eine Verbindungsanforderung angenommen.', '2019-11-05 07:26:53', '2019-11-05 07:26:53'),
(2542, 1, 'Micheal Johns accepted a connect request.', '2019-11-05 07:26:56', '2019-11-05 07:26:56'),
(2542, 2, 'Micheal Johns hat eine Verbindungsanforderung angenommen.', '2019-11-05 07:26:56', '2019-11-05 07:26:56'),
(2543, 1, 'Micheal Johns has accepted your Date Request.', '2019-11-05 07:26:58', '2019-11-05 07:26:58'),
(2543, 2, 'Micheal Johns hat Ihre Terminanfrage angenommen.', '2019-11-05 07:26:58', '2019-11-05 07:26:58'),
(2544, 1, 'James Smith has liked your post.', '2019-11-05 07:30:06', '2019-11-05 07:30:06'),
(2544, 2, 'James Smith hat Ihren Beitrag gefallen.', '2019-11-05 07:30:06', '2019-11-05 07:30:06'),
(2545, 1, 'James Smith has liked your post.', '2019-11-05 07:52:00', '2019-11-05 07:52:00'),
(2545, 2, 'James Smith hat Ihren Beitrag gefallen.', '2019-11-05 07:52:00', '2019-11-05 07:52:00'),
(2546, 1, 'lovepush has sent you Date Request.', '2019-11-05 07:53:29', '2019-11-05 07:53:29'),
(2546, 2, 'lovepush hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 07:53:29', '2019-11-05 07:53:29'),
(2547, 1, 'lovepush has sent you Connect Request', '2019-11-05 07:53:31', '2019-11-05 07:53:31'),
(2547, 2, 'lovepush hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:53:31', '2019-11-05 07:53:31'),
(2548, 1, 'lovepush has sent you Connect Request', '2019-11-05 07:53:32', '2019-11-05 07:53:32'),
(2548, 2, 'lovepush hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:53:32', '2019-11-05 07:53:32'),
(2549, 1, 'lovepush has sent you Connect Request', '2019-11-05 07:53:33', '2019-11-05 07:53:33'),
(2549, 2, 'lovepush hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:53:33', '2019-11-05 07:53:33'),
(2550, 1, 'lovepush has sent you Connect Request', '2019-11-05 07:53:36', '2019-11-05 07:53:36'),
(2550, 2, 'lovepush hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 07:53:36', '2019-11-05 07:53:36'),
(2551, 1, 'lovepush accepted a connect request.', '2019-11-05 07:54:39', '2019-11-05 07:54:39'),
(2551, 2, 'lovepush hat eine Verbindungsanforderung angenommen.', '2019-11-05 07:54:39', '2019-11-05 07:54:39'),
(2552, 1, 'Zaib rajput accepted a connect request.', '2019-11-05 09:05:10', '2019-11-05 09:05:10'),
(2552, 2, 'Zaib rajput hat eine Verbindungsanforderung angenommen.', '2019-11-05 09:05:10', '2019-11-05 09:05:10'),
(2557, 1, 'Sonte accepted a connect request.', '2019-11-05 09:11:45', '2019-11-05 09:11:45'),
(2557, 2, 'Sonte hat eine Verbindungsanforderung angenommen.', '2019-11-05 09:11:45', '2019-11-05 09:11:45'),
(2558, 1, 'Sonte has sent you Connect Request', '2019-11-05 09:11:59', '2019-11-05 09:11:59'),
(2558, 2, 'Sonte hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 09:11:59', '2019-11-05 09:11:59'),
(2559, 1, 'Manish accepted a connect request.', '2019-11-05 09:24:25', '2019-11-05 09:24:25'),
(2559, 2, 'Manish hat eine Verbindungsanforderung angenommen.', '2019-11-05 09:24:25', '2019-11-05 09:24:25'),
(2560, 1, 'Zaib rajput has sent you Connect Request', '2019-11-05 11:10:45', '2019-11-05 11:10:45'),
(2560, 2, 'Zaib rajput hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 11:10:45', '2019-11-05 11:10:45'),
(2561, 1, 'Benny Reschl has sent you Connect Request', '2019-11-05 12:07:26', '2019-11-05 12:07:26'),
(2561, 2, 'Benny Reschl hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 12:07:26', '2019-11-05 12:07:26'),
(2562, 1, 'Zaib rajput accepted a connect request.', '2019-11-05 12:43:55', '2019-11-05 12:43:55'),
(2562, 2, 'Zaib rajput hat eine Verbindungsanforderung angenommen.', '2019-11-05 12:43:55', '2019-11-05 12:43:55'),
(2563, 1, 'Chandler has sent you Date Request.', '2019-11-05 13:11:42', '2019-11-05 13:11:42'),
(2563, 2, 'Chandler hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 13:11:42', '2019-11-05 13:11:42'),
(2564, 1, 'Chandler has sent you Date Request.', '2019-11-05 13:11:43', '2019-11-05 13:11:43'),
(2564, 2, 'Chandler hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 13:11:43', '2019-11-05 13:11:43'),
(2565, 1, 'Chandler has sent you Date Request.', '2019-11-05 13:11:44', '2019-11-05 13:11:44'),
(2565, 2, 'Chandler hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 13:11:44', '2019-11-05 13:11:44'),
(2566, 1, 'Chandler has sent you Date Request.', '2019-11-05 13:11:44', '2019-11-05 13:11:44'),
(2566, 2, 'Chandler hat Ihnen eine Terminanfrage gesendet.', '2019-11-05 13:11:44', '2019-11-05 13:11:44'),
(2567, 1, 'Chandler has sent you Connect Request', '2019-11-05 13:11:50', '2019-11-05 13:11:50'),
(2567, 2, 'Chandler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:11:50', '2019-11-05 13:11:50'),
(2568, 1, 'Chandler has sent you Connect Request', '2019-11-05 13:11:51', '2019-11-05 13:11:51'),
(2568, 2, 'Chandler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:11:52', '2019-11-05 13:11:52'),
(2569, 1, 'Chandler has sent you Connect Request', '2019-11-05 13:11:52', '2019-11-05 13:11:52'),
(2569, 2, 'Chandler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:11:52', '2019-11-05 13:11:52'),
(2570, 1, 'Chandler has sent you Connect Request', '2019-11-05 13:11:53', '2019-11-05 13:11:53'),
(2570, 2, 'Chandler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:11:53', '2019-11-05 13:11:53'),
(2571, 1, 'Chandler has sent you Connect Request', '2019-11-05 13:11:55', '2019-11-05 13:11:55'),
(2571, 2, 'Chandler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:11:55', '2019-11-05 13:11:55'),
(2572, 1, 'Tim has sent you Connect Request', '2019-11-05 13:31:11', '2019-11-05 13:31:11'),
(2572, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:31:11', '2019-11-05 13:31:11'),
(2573, 1, 'Tim has sent you Connect Request', '2019-11-05 13:31:22', '2019-11-05 13:31:22'),
(2573, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:31:22', '2019-11-05 13:31:22'),
(2575, 1, 'Tim has sent you Connect Request', '2019-11-05 13:31:30', '2019-11-05 13:31:30'),
(2575, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:31:30', '2019-11-05 13:31:30'),
(2577, 1, 'Tim has sent you Connect Request', '2019-11-05 13:31:52', '2019-11-05 13:31:52'),
(2577, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:31:52', '2019-11-05 13:31:52'),
(2578, 1, 'Tim has sent you Connect Request', '2019-11-05 13:31:55', '2019-11-05 13:31:55'),
(2578, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-05 13:31:55', '2019-11-05 13:31:55'),
(2579, 1, 'Chandler accepted a connect request.', '2019-11-05 14:04:25', '2019-11-05 14:04:25'),
(2579, 2, 'Chandler hat eine Verbindungsanforderung angenommen.', '2019-11-05 14:04:25', '2019-11-05 14:04:25'),
(2580, 1, 'Zaib rajput accepted a connect request.', '2019-11-05 14:07:02', '2019-11-05 14:07:02'),
(2580, 2, 'Zaib rajput hat eine Verbindungsanforderung angenommen.', '2019-11-05 14:07:02', '2019-11-05 14:07:02');

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
('08035a2b516b854b6b0d437e316f6b37ed34131ff4db3396d8884737d880ffc8b170ab7d0f0c0216', 482, 1, 'user', '[]', 0, '2019-11-05 04:58:59', '2019-11-05 04:58:59', '2020-11-05 04:58:59'),
('083e75a92c2d62a9bb78c37d32256b6b399d3b02e11a7496f541c676409a1e05f770ed5ed11b6cd0', 482, 1, 'user', '[]', 1, '2019-11-05 05:13:19', '2019-11-05 05:13:19', '2020-11-05 05:13:19'),
('0a052163928effb6bd1044a0a1fdd4e838e62dc4615b1aea81881640dbd31b5bec501fb4903bdda9', 459, 1, 'user', '[]', 0, '2019-11-04 11:16:12', '2019-11-04 11:16:12', '2020-11-04 11:16:12'),
('0cbcacf66df538a4043c00b8c55669437710ee77a89d728c202c677989d24035a2710cef8827abb0', 445, 1, 'user', '[]', 0, '2019-10-31 09:52:19', '2019-10-31 09:52:19', '2020-10-31 09:52:19'),
('0ee498448cfcbcbff7ea0ec39dbdea609e2dfc48bddf0a945ea6ac3b901991b95a10df85b2d46327', 481, 1, 'user', '[]', 0, '2019-11-05 04:30:50', '2019-11-05 04:30:50', '2020-11-05 04:30:50'),
('0fba25ce78aafa6f57c55212174dfbedff5711a5a8ec48857fb468dab64fa48a3928166b1edce2b2', 482, 1, 'user', '[]', 1, '2019-11-05 04:59:10', '2019-11-05 04:59:10', '2020-11-05 04:59:10'),
('0fce49ddb10731914a9dbcb488a8640b0c9efa732a00d4b333909a41f650b73681b7fb064b025f12', 448, 1, 'user', '[]', 0, '2019-11-02 15:08:05', '2019-11-02 15:08:05', '2020-11-02 15:08:05'),
('10b251c4ef05f4986de27a7955764b35f959b5a1bac5effa6d4fb86d920cbe1d4a4a8b091f019e61', 453, 1, 'user', '[]', 0, '2019-11-03 15:08:55', '2019-11-03 15:08:55', '2020-11-03 15:08:55'),
('10c3bbf46fe9e027393d1be32a1d52d2a83aaa6d24649150c1741965233e88fd6eccca00e6a9f361', 474, 1, 'user', '[]', 0, '2019-11-05 00:30:24', '2019-11-05 00:30:24', '2020-11-05 00:30:24'),
('127d6e0809b3a6e6a2e2f1697beca165aedfa2d7474a7217b6f5e0a41cbcb1d90015aacdb79d3053', 458, 1, 'user', '[]', 0, '2019-11-04 11:14:08', '2019-11-04 11:14:08', '2020-11-04 11:14:08'),
('12abad1b96bb7e508ac5dd9a2377704d2d1f07424c60e318de1a53f6be53ee5ae1280c74ab1be7df', 487, 1, 'user', '[]', 0, '2019-11-05 07:37:31', '2019-11-05 07:37:31', '2020-11-05 07:37:31'),
('14f0a36c3258387df34875db17544b042aeca8602ea68dd57349d8a659cca5b538d660b3494ef534', 482, 1, 'user', '[]', 1, '2019-11-05 05:31:21', '2019-11-05 05:31:21', '2020-11-05 05:31:21'),
('1530819d93fd197b72d58c9b293d075b62586d154f7bc863947025aa00f2dd240b539db3f7b304ae', 483, 1, 'user', '[]', 1, '2019-11-05 05:00:26', '2019-11-05 05:00:26', '2020-11-05 05:00:26'),
('191472b3c19e17e6571e92c577eb54680116ec72d4bcebb54db2a00fbc9c8fb4dfbd0355e0980ab9', 452, 1, 'user', '[]', 0, '2019-11-03 03:39:46', '2019-11-03 03:39:46', '2020-11-03 03:39:46'),
('1a4250c6efb84acb0367093fa2c34b8bbd1b85aab5c0fc71611d620b67045f4704123dd95f00fc7e', 465, 1, 'user', '[]', 0, '2019-11-04 16:24:00', '2019-11-04 16:24:00', '2020-11-04 16:24:00'),
('1e491319f8732c52aa2793bfed9414fb0ee0b66a3c722c5b44e3ad8835c25c224f04ebf8a632aa6d', 497, 1, 'user', '[]', 0, '2019-11-05 13:10:19', '2019-11-05 13:10:19', '2020-11-05 13:10:19'),
('1ecf33c216671a0d2bec56042e2bf99dbc720ecc81cf58022272c9b85591f6a69730527d53a26d56', 480, 1, 'user', '[]', 1, '2019-11-05 06:31:37', '2019-11-05 06:31:37', '2020-11-05 06:31:37'),
('1ee104a2c28245ee4918fec8647bac3b29ac4afb58e086e4f467b5aaa9d1dbf5696894f9d6b8c6f5', 484, 1, 'user', '[]', 0, '2019-11-05 05:34:35', '2019-11-05 05:34:35', '2020-11-05 05:34:35'),
('1f2e2838a9cbe4905c4d672cda417c76db2ee8379bc365f6f408aae98cde185cc67396d01060c957', 462, 1, 'user', '[]', 0, '2019-11-04 14:16:16', '2019-11-04 14:16:16', '2020-11-04 14:16:16'),
('20ee5a31deeb68b25d113fd3873c806f3ddcde12303b74eeebd9ad26eff2f66731d0f5ed378fe909', 470, 1, 'user', '[]', 0, '2019-11-04 18:38:00', '2019-11-04 18:38:00', '2020-11-04 18:38:00'),
('210763738cf4daa946ab4e348a4a136e6813e5d550b0e4e485ba5a76229d05a7014e39de255dd0bc', 475, 1, 'user', '[]', 0, '2019-11-05 00:44:27', '2019-11-05 00:44:27', '2020-11-05 00:44:27'),
('21c7ee95a5ea235aaa43f834e20bf9798cbf4c7427ecc7a21b243fd0fec73eb7a7c358f87a079cd4', 480, 1, 'user', '[]', 1, '2019-11-05 06:15:55', '2019-11-05 06:15:55', '2020-11-05 06:15:55'),
('220978856dba5d355a81dcb868e8419b92e4d1533c371178f06b5580a74557b7b0f59216a2575b35', 474, 1, 'user', '[]', 0, '2019-11-05 00:31:04', '2019-11-05 00:31:04', '2020-11-05 00:31:04'),
('2483cb78c6291b24b6186a6db5b40794d841208b85fde6a75caa28b4267edc3daeab285d85e0abd6', 480, 1, 'user', '[]', 1, '2019-11-05 05:22:03', '2019-11-05 05:22:03', '2020-11-05 05:22:03'),
('27af3a4864083b89dcf2d96ef8658bb697143f22ee4b265513308c1d68100b452f968a34e2c6fe36', 474, 1, 'user', '[]', 0, '2019-11-05 00:31:44', '2019-11-05 00:31:44', '2020-11-05 00:31:44'),
('27bba79495cb626c9e82aa7fa8caa1abfad2df8afd5cb9c1d42293e9607d588df40bd6c97ab433a6', 443, 1, 'user', '[]', 1, '2019-10-31 09:44:05', '2019-10-31 09:44:05', '2020-10-31 09:44:05'),
('28be911f4571ab40654ec965fda52068e0d5ae35a859a9ea9821cd9eb38fe78ade34f405bb425418', 484, 1, 'user', '[]', 1, '2019-11-05 06:21:01', '2019-11-05 06:21:01', '2020-11-05 06:21:01'),
('29e5aafab8cc9b28cb3875cb7781ac93a1932a10a4b81aecab89a3a1f20dd37731ddb9e1fd7ae767', 484, 1, 'user', '[]', 0, '2019-11-05 05:03:05', '2019-11-05 05:03:05', '2020-11-05 05:03:05'),
('2b21191d668f9316168895c829cbe2850dc9459df872b2ffe29899fd2eea63d958bf2ef05a4c0360', 459, 1, 'user', '[]', 0, '2019-11-04 12:08:41', '2019-11-04 12:08:41', '2020-11-04 12:08:41'),
('30ebe30f4f1bd1c6555b6ab3a0c45f34d5c88b7d22e1d4971489fdfb42bf06713ca4a5adf5cb3f8f', 466, 1, 'user', '[]', 0, '2019-11-04 17:34:24', '2019-11-04 17:34:24', '2020-11-04 17:34:24'),
('315779cf0fad8aa2fd54af492b803103108e9b09103575377f86aff74ad2701a8075fa55624f4cdc', 479, 1, 'user', '[]', 1, '2019-11-05 03:56:04', '2019-11-05 03:56:04', '2020-11-05 03:56:04'),
('3290e69c438f1f5f7ebf5797983f8317bafdd6384c2706e4f33d047ce9e0792881ba2ed70184c197', 493, 1, 'user', '[]', 1, '2019-11-05 10:59:17', '2019-11-05 10:59:17', '2020-11-05 10:59:17'),
('32e7b63fe09137f3806d9374e5b653567828f48e86e4b2e029efda86e01ecbf803ceb519dfe7cce0', 445, 1, 'user', '[]', 0, '2019-11-01 06:35:59', '2019-11-01 06:35:59', '2020-11-01 06:35:59'),
('34dd0d2f2ffd93fe986a3313f8e72dcfb42f1f99e16bbe9bace9f3f2f308964467dff6d1d63c4324', 480, 1, 'user', '[]', 0, '2019-11-05 07:55:08', '2019-11-05 07:55:08', '2020-11-05 07:55:08'),
('36ba37e18343de5ac32003435aa4f7c865a0f1b259a82798557822e500f77198036db630922df7b1', 467, 1, 'user', '[]', 0, '2019-11-04 17:44:41', '2019-11-04 17:44:41', '2020-11-04 17:44:41'),
('389a31f5034d75368300807dce46762d2c86464eeec5dfd57ab54826e291e64bd90363b5e34c0e84', 444, 1, 'user', '[]', 0, '2019-10-31 09:44:28', '2019-10-31 09:44:28', '2020-10-31 09:44:28'),
('39f31e07bb1d3dc02e4ee5ef92aa458d6e61d06b1cb021e83e06968aa44f430acc3080b65f8ada3a', 446, 1, 'user', '[]', 0, '2019-10-31 09:57:28', '2019-10-31 09:57:28', '2020-10-31 09:57:28'),
('3c78f0f1cb8f33946b2c3c8eb32ea34f9988b3cacb81d8e2464f3c4bcce340a9aecb023bb71f0760', 472, 1, 'user', '[]', 0, '2019-11-04 20:41:02', '2019-11-04 20:41:02', '2020-11-04 20:41:02'),
('3cbd83d470102fdfd28830c883a11c72f884c8f5b2f0901a73062083d5d81942efa284ad29dfa116', 446, 1, 'user', '[]', 0, '2019-10-31 09:54:51', '2019-10-31 09:54:51', '2020-10-31 09:54:51'),
('3e6ab7bdbe1dc684df7a42dcb36b690d0436d3c867bba8e92c0d9159563bb3bb1d619b5d261ca35a', 483, 1, 'user', '[]', 0, '2019-11-05 04:59:52', '2019-11-05 04:59:52', '2020-11-05 04:59:52'),
('3e8869a9fafaefb4142f6b2c169db149479847c2664f3c8d2135d5b389cade614d5cf5f04bc5db85', 471, 1, 'user', '[]', 0, '2019-11-04 18:52:15', '2019-11-04 18:52:15', '2020-11-04 18:52:15'),
('3f84c6677f5dba1fea4a5a7377ab7a6f748c22d19faf7f26a7df7493a92d47382912a35a2ec45389', 479, 1, 'user', '[]', 1, '2019-11-05 03:34:15', '2019-11-05 03:34:15', '2020-11-05 03:34:15'),
('4077d504940b650709c83867afe9f9c5b10889715b26a3c13cab44a6c04cb4755204bd6e1200d3f3', 485, 1, 'user', '[]', 1, '2019-11-05 06:19:13', '2019-11-05 06:19:13', '2020-11-05 06:19:13'),
('40ad5ce02b67860a20fd1190d87b8e712e73eff5d188422aa65872c1352d2781c70e7662a756f78c', 495, 1, 'user', '[]', 0, '2019-11-05 12:02:42', '2019-11-05 12:02:42', '2020-11-05 12:02:42'),
('410239105baa30d5bc15a1c60078ca93d99753f461ffa6e5fdb50dc4a1764d3371c6cd608ecf2090', 480, 1, 'user', '[]', 1, '2019-11-05 06:48:09', '2019-11-05 06:48:09', '2020-11-05 06:48:09'),
('410c28f4c6a6fb38aa4b6d90c687083d892c998427a593c7f82d0ff434a77dc47b8d96e67ce5d6e8', 471, 1, 'user', '[]', 1, '2019-11-04 18:53:12', '2019-11-04 18:53:12', '2020-11-04 18:53:12'),
('439410a8e00e166d67f4e3c51cf346ea7d329c7a6d5bfc3eb0346ebb4ebba1858bda333fd2edac05', 488, 1, 'user', '[]', 0, '2019-11-05 07:15:00', '2019-11-05 07:15:00', '2020-11-05 07:15:00'),
('43cf8a2cc13d9f74d1156cd5a489d4bf23613ec3b51973416240cfdc56ff1901b6af545e731e6af4', 443, 1, 'user', '[]', 1, '2019-10-31 09:38:17', '2019-10-31 09:38:17', '2020-10-31 09:38:17'),
('44b6cf6f2640ba03759f773124c1ca5f390f868fceaced0579485c610d69be21d69f496cf7de92d1', 486, 1, 'user', '[]', 1, '2019-11-05 07:10:10', '2019-11-05 07:10:10', '2020-11-05 07:10:10'),
('4560e454d2f9c72a5e1638ddbfb8bd9a68a8bcc10ccca999e7962aface739527c67b34892fa127ed', 477, 1, 'user', '[]', 0, '2019-11-05 01:10:09', '2019-11-05 01:10:09', '2020-11-05 01:10:09'),
('4a417c9b6d0af27d495975a9c27667cb4ce74328ba6554832a50adb0ecc130571d0dab1bd713a823', 493, 1, 'user', '[]', 0, '2019-11-05 10:59:11', '2019-11-05 10:59:11', '2020-11-05 10:59:11'),
('4a8ae85a35d200a381ccad3fe8eb0cccafa623cc1f665321342e1a6e800e8f150be55963e3b851d2', 480, 1, 'user', '[]', 0, '2019-11-05 04:17:53', '2019-11-05 04:17:53', '2020-11-05 04:17:53'),
('4ca69e7da5b57478bb24bcf870bfa2fb3829b567c3f76def521dcdd2482c8302b45523c5bfefae2d', 495, 1, 'user', '[]', 0, '2019-11-05 11:55:48', '2019-11-05 11:55:48', '2020-11-05 11:55:48'),
('4cf449d53b71a6b91a919ed0dbab3799beeb572deb6eb62726e100769662bdd4e754f3e0690509be', 482, 1, 'user', '[]', 1, '2019-11-05 06:18:08', '2019-11-05 06:18:08', '2020-11-05 06:18:08'),
('4e1ae94d23eb3f73b78af85761b287a3ad7328fd8a927a5b6cd08a188400cecfc174e923e8f459c0', 480, 1, 'user', '[]', 1, '2019-11-05 04:56:41', '2019-11-05 04:56:41', '2020-11-05 04:56:41'),
('4e50fb4272af299f7c4d5d126413a9bc65cbb0f729953e602b6d16d653ebb7d8edd472ec552de0a9', 473, 1, 'user', '[]', 0, '2019-11-04 22:13:55', '2019-11-04 22:13:55', '2020-11-04 22:13:55'),
('509e68ef74e7e76f4f2beeb589e9cd4983bd693d85e36c1aaa32854c4819c18262d0f6a131570d8a', 463, 1, 'user', '[]', 0, '2019-11-04 14:23:40', '2019-11-04 14:23:40', '2020-11-04 14:23:40'),
('510b767e04088073e6c77758a1203cd88efa16b52806b09b70a4db280d2e181f7d9c358c62be393f', 471, 1, 'user', '[]', 1, '2019-11-05 04:02:14', '2019-11-05 04:02:14', '2020-11-05 04:02:14'),
('513329223021978df4703546576f984453f05384f79731ca987e6cf115807acc21b64e28c300dcf7', 479, 1, 'user', '[]', 1, '2019-11-05 06:17:25', '2019-11-05 06:17:25', '2020-11-05 06:17:25'),
('51a951707ef084c65a43476fb688a67f84e4c6d11c6f8744ea9831865eb9c24a6e285b338b8d7bb4', 497, 1, 'user', '[]', 0, '2019-11-05 13:09:50', '2019-11-05 13:09:50', '2020-11-05 13:09:50'),
('51ab0a1cb0d8edf4e9e05a3d4d2bd695c040e8ff1b2816a95e642aa148a3382b80650ebbfa8fabf1', 449, 1, 'user', '[]', 1, '2019-11-02 15:03:48', '2019-11-02 15:03:48', '2020-11-02 15:03:48'),
('528dd22316c38a68f7383a8d8054746ed4cbef4fc9519d247ec01c2af37520cda95cf5194128650f', 489, 1, 'user', '[]', 0, '2019-11-05 07:19:03', '2019-11-05 07:19:03', '2020-11-05 07:19:03'),
('53547cb52973edb7f977adc2493c03db2f1c7fe8ed722e3d0895922ae41213ab43a952a021a3703b', 450, 1, 'user', '[]', 0, '2019-11-02 17:34:37', '2019-11-02 17:34:37', '2020-11-02 17:34:37'),
('537a12e7f2a68e7fe6f3882d2f283aedd618eb93b5d04cc09cd52be945c43430a6f20760115dfdd2', 481, 1, 'user', '[]', 0, '2019-11-05 06:40:02', '2019-11-05 06:40:02', '2020-11-05 06:40:02'),
('55733e766a9587cc4200895c3f71e5a50bcb7a9e09c293ac51d50fd150c63623b18f85401e71c0dc', 480, 1, 'user', '[]', 0, '2019-11-05 04:18:04', '2019-11-05 04:18:04', '2020-11-05 04:18:04'),
('569c25df14b7aac328b861a669ab48149d5723f46e9e8c1378680e2525a08e60df021b99c7ff88c9', 482, 1, 'user', '[]', 0, '2019-11-05 05:10:27', '2019-11-05 05:10:27', '2020-11-05 05:10:27'),
('57afcc12053dd4f4c85c4bb81ff9f12bf70a4f701061191d625061e302cf484e8caf12c2b57c0c38', 497, 1, 'user', '[]', 0, '2019-11-05 13:11:22', '2019-11-05 13:11:22', '2020-11-05 13:11:22'),
('591e86e90291d0c9e94561c69a38afca0390b3f2db13e2189828502b9dc09dcf94f9f773315aa14b', 469, 1, 'user', '[]', 0, '2019-11-04 18:08:17', '2019-11-04 18:08:17', '2020-11-04 18:08:17'),
('5cac16dc1ea66b17d60cdd01c44832bf39c095ca5bbe5d2fcb932aabe44ee3a781848a98e43ff1c2', 457, 1, 'user', '[]', 0, '2019-11-04 08:02:11', '2019-11-04 08:02:11', '2020-11-04 08:02:11'),
('5d7541b6c79fb966dfceecaf51b4b6e2aa787db9a06df390688ac83d50eff107a3cf3b0c7d51bb13', 483, 1, 'user', '[]', 1, '2019-11-05 05:14:07', '2019-11-05 05:14:07', '2020-11-05 05:14:07'),
('5e482613c12719123bc11023fc50f35eb79f3ef6a0fb8a13c218aec66c350d9eb696b5c5eac54b37', 472, 1, 'user', '[]', 0, '2019-11-04 20:44:18', '2019-11-04 20:44:18', '2020-11-04 20:44:18'),
('5e6ace80ccad94d3374e81a06febfc757aeb6f7041257cd0dad9207a2f7b85f9a2153854146f7697', 477, 1, 'user', '[]', 0, '2019-11-05 01:12:37', '2019-11-05 01:12:37', '2020-11-05 01:12:37'),
('6309c28165f3f7f7f3d4a3e06f2ba6e5f946aa455f7e0748ca8a0d238cb4ab5617e660ba05ab3316', 462, 1, 'user', '[]', 0, '2019-11-04 14:19:00', '2019-11-04 14:19:00', '2020-11-04 14:19:00'),
('64ace1ea57e8d936d829f04f72a6629bf1f359bf7f125400788f5bcd5263d4d305198b81677b2548', 450, 1, 'user', '[]', 0, '2019-11-02 17:40:19', '2019-11-02 17:40:19', '2020-11-02 17:40:19'),
('658ccb697c2e27bb841d6ba6f61a8feb620d7093d2781600eaf738e75f6e5d52bcda592d0283ba9c', 461, 1, 'user', '[]', 0, '2019-11-04 14:00:57', '2019-11-04 14:00:57', '2020-11-04 14:00:57'),
('673ae7d7a468a0496db95f3fd87b4af523c3e8e96efd37263fbc407a2edaf4f56b7323ca264245ba', 471, 1, 'user', '[]', 1, '2019-11-05 07:06:17', '2019-11-05 07:06:17', '2020-11-05 07:06:17'),
('689c64fc69ee28a094543ba5b137ac26f5ef2b138030239cad5182abd111794e9cde2c31ddaefefa', 481, 1, 'user', '[]', 0, '2019-11-05 04:26:13', '2019-11-05 04:26:13', '2020-11-05 04:26:13'),
('692197af446c1d4b1d18f420be22bdcc6102ec3a18ddd12773229c78557dc4fa2c31483e4d1b7190', 457, 1, 'user', '[]', 0, '2019-11-04 08:00:57', '2019-11-04 08:00:57', '2020-11-04 08:00:57'),
('6d0eb3c3da617594a1f8084a93eac6327e0ecbfb2b4f7428d5d80dc4b103661c5927fdd8f10015e8', 482, 1, 'user', '[]', 1, '2019-11-05 07:39:38', '2019-11-05 07:39:38', '2020-11-05 07:39:38'),
('6e3f84ed3eaef38b7292c3cc42ce612096560e35663edf5673a910b2021799fdd71d6f42608feb23', 446, 1, 'user', '[]', 1, '2019-11-01 04:43:10', '2019-11-01 04:43:10', '2020-11-01 04:43:10'),
('6e55bd5997cb638dce7e2343b1b814ff10a0786249bc34544d87e45c03b1dd0dc23ff0c1d90accfb', 448, 1, 'user', '[]', 0, '2019-11-02 15:07:18', '2019-11-02 15:07:18', '2020-11-02 15:07:18'),
('6ebe5dd5758392e67e2787aaf5860cc28bcdfd5f46635ffe213987a10f9353396535272cd8861901', 468, 1, 'user', '[]', 0, '2019-11-04 17:57:50', '2019-11-04 17:57:50', '2020-11-04 17:57:50'),
('6f405ca016cc89b07bcfac3cd19d0afa97b71cc83de37c89b2be169827288913a4dc19ad2cab350a', 467, 1, 'user', '[]', 0, '2019-11-04 17:45:40', '2019-11-04 17:45:40', '2020-11-04 17:45:40'),
('7037376c80628dc6e92888e213feeb75eecd0a6eef2d3e5e4f2ebc7dad6679e16fcf84c12772d119', 480, 1, 'user', '[]', 1, '2019-11-05 04:18:16', '2019-11-05 04:18:16', '2020-11-05 04:18:16'),
('75d86e06b087385cbc88871e767ad4fac05bf67f40c804a7301044dd2aceabcfd4aee8ae2e3f0f1a', 488, 1, 'user', '[]', 0, '2019-11-05 07:33:34', '2019-11-05 07:33:34', '2020-11-05 07:33:34'),
('7647f50b63a0a6b169ac40f6aeb933be9454637f24e531bcea4344a1246a44b03bf0ff397287832d', 483, 1, 'user', '[]', 0, '2019-11-05 05:00:19', '2019-11-05 05:00:19', '2020-11-05 05:00:19'),
('76be61e1a708229ee5e64347f63459b3d027169d6b2c6f07c865cfe6424756fed1bfa800100b9c32', 456, 1, 'user', '[]', 0, '2019-11-04 06:04:56', '2019-11-04 06:04:56', '2020-11-04 06:04:56'),
('79042078b34cc7a1b7d68a42d7e8d30f42ec48b44d88b36a75b957fde0a24970daa72fbe2a8cd64b', 448, 1, 'user', '[]', 0, '2019-11-02 15:07:54', '2019-11-02 15:07:54', '2020-11-02 15:07:54'),
('7a3a3a8d8ceba9b840147b46ec57831b196f9c9c70e76fb02a5798d9dd1007d3aed051c25eb60aae', 476, 1, 'user', '[]', 0, '2019-11-05 00:54:12', '2019-11-05 00:54:12', '2020-11-05 00:54:12'),
('805141e1569fc299b0f53df53749f9fd5a981b36433165e49120872724b25e7532205ed7a0363437', 461, 1, 'user', '[]', 0, '2019-11-04 14:20:27', '2019-11-04 14:20:27', '2020-11-04 14:20:27'),
('827f201d0feb8f34ebd0cc3fe08d2d3f766d4a2d4a8b687978806a4457fcca88a70eb43ea3df68f2', 495, 1, 'user', '[]', 0, '2019-11-05 12:00:55', '2019-11-05 12:00:55', '2020-11-05 12:00:55'),
('8439bba994c0434f44c2c4d6c80a137c2238588b87281a62213a20e8cde66c0f015e36620d21eae0', 481, 1, 'user', '[]', 0, '2019-11-05 04:26:50', '2019-11-05 04:26:50', '2020-11-05 04:26:50'),
('86768b70f70dff6d0d3c6520e09b76cd8220cb267f1e7e9729949fdd0adba571cb89055dfc501822', 485, 1, 'user', '[]', 0, '2019-11-05 06:18:36', '2019-11-05 06:18:36', '2020-11-05 06:18:36'),
('875c441b86e184f5fc88029889ea65e29b78ec75ce71d012df1f1a5b77d03fbdac93c4a0cb9fe8a4', 471, 1, 'user', '[]', 1, '2019-11-05 04:29:25', '2019-11-05 04:29:25', '2020-11-05 04:29:25'),
('875f98307ea7988d17dd57adbcc9835149a238080c97909d0f84284d37d1ccf48b0490243679509a', 451, 1, 'user', '[]', 0, '2019-11-03 03:35:23', '2019-11-03 03:35:23', '2020-11-03 03:35:23'),
('87993eb19ebfb2398512368afcdbb32376d7a29edf172f29abd1313fce991daba59d348e0b1d19ad', 459, 1, 'user', '[]', 0, '2019-11-04 12:06:27', '2019-11-04 12:06:27', '2020-11-04 12:06:27'),
('8986b6f40f27f59f0ddf652581f90264b2184238f677b01a5288128632b6089c3378206819301e15', 451, 1, 'user', '[]', 0, '2019-11-03 03:37:44', '2019-11-03 03:37:44', '2020-11-03 03:37:44'),
('89db3138d892ff224b8bf1909f4c28d260df04ce6f55927b38088956b5abb1dc453ce831e726b561', 485, 1, 'user', '[]', 0, '2019-11-05 06:18:52', '2019-11-05 06:18:52', '2020-11-05 06:18:52'),
('8aaec7be9e340252f9263b1af0e55bd97dbb9eee389e3b5f541d6d62ae40e0afd472bd3f6eaa3c37', 479, 1, 'user', '[]', 0, '2019-11-05 03:33:34', '2019-11-05 03:33:34', '2020-11-05 03:33:34'),
('8cebd3e2ea3dd804d0eb33a39aca6e75f3e65e755736f02ed5acd9dae22e42bda2e0d146823733d3', 456, 1, 'user', '[]', 0, '2019-11-04 06:01:20', '2019-11-04 06:01:20', '2020-11-04 06:01:20'),
('8e8cec69533b125662810579b25ddd45141f86a14dab10046ea2f357041173c0c0dcd79a6749a53c', 492, 1, 'user', '[]', 0, '2019-11-05 10:49:55', '2019-11-05 10:49:55', '2020-11-05 10:49:55'),
('8e9653c3028f1679cd4a6f2605a5fd132967f05673c4049efbdc0dbdd7ad094ca9e8f79e119db54c', 481, 1, 'user', '[]', 1, '2019-11-05 04:27:14', '2019-11-05 04:27:14', '2020-11-05 04:27:14'),
('8ee66712b6a4f59ab2b024b3c23f12f83199fc0b0484446e6262ba8bcc56c4f1084f3f496071fe8d', 444, 1, 'user', '[]', 1, '2019-10-31 09:43:00', '2019-10-31 09:43:00', '2020-10-31 09:43:00'),
('9256f280a78eaf2689f95aec2585e46899d9a26a0f5097502c619af374d1e7e8f58121ae0aab5fc6', 481, 1, 'user', '[]', 1, '2019-11-05 05:11:06', '2019-11-05 05:11:06', '2020-11-05 05:11:06'),
('93132be2c44944ff78ae7a244b7583e700e499dba107ad14c80e5209712eba1990d52c2726d43a1b', 471, 1, 'user', '[]', 0, '2019-11-05 13:52:24', '2019-11-05 13:52:24', '2020-11-05 13:52:24'),
('93eda0fca0d9df852794f90efdc1a5a335190c66196bd63b4fcc1cd30f7bee524bbe0a1bac5744ba', 448, 1, 'user', '[]', 0, '2019-11-02 14:54:51', '2019-11-02 14:54:51', '2020-11-02 14:54:51'),
('965cec22defad52f6c5a6542264d92236795b290e54a60f7735c49ae8a1d4e7e60f493d0cc821d56', 492, 1, 'user', '[]', 0, '2019-11-05 10:42:48', '2019-11-05 10:42:48', '2020-11-05 10:42:48'),
('97574afaeeb828245cf77213da19088691bdeb8cd7e5ecd5d05f5fa372216e753fcd8068fc63269d', 446, 1, 'user', '[]', 1, '2019-10-31 09:55:10', '2019-10-31 09:55:10', '2020-10-31 09:55:10'),
('9a3a055f935fe1161a5126f171efcff64c1568871b5cc3df11d4654d190a8475eaa3b2225e949178', 461, 1, 'user', '[]', 0, '2019-11-04 14:18:40', '2019-11-04 14:18:40', '2020-11-04 14:18:40'),
('9dbca649e94f4cbd621f7444080e8a3f510526255881057f1cfe81dc2bd58ff4aa978e8a86127614', 447, 1, 'user', '[]', 0, '2019-10-31 09:56:14', '2019-10-31 09:56:14', '2020-10-31 09:56:14'),
('9fcbd03340b34be00abf4afdfe85e4203986139b957dfd9b5e4cb14862bb2d71905df0b3751c88ce', 473, 1, 'user', '[]', 0, '2019-11-04 22:11:32', '2019-11-04 22:11:32', '2020-11-04 22:11:32'),
('a0faa1ba30f110aafc6161c2941b6a299bc38370df98aae19161feac3bd091a85c9b52e35d97d64b', 496, 1, 'user', '[]', 0, '2019-11-05 11:56:49', '2019-11-05 11:56:49', '2020-11-05 11:56:49'),
('a27a9299dcd8b2b38a85ff708310dce5ef1819b8c05ff248c753b37a2cd245b216234bbd680718e0', 486, 1, 'user', '[]', 0, '2019-11-05 07:09:19', '2019-11-05 07:09:19', '2020-11-05 07:09:19'),
('a314d00c0924fe4c57abc1cc3a1585fdb7fafee950781c542febd913985376786a29f6ed3bcdc2db', 449, 1, 'user', '[]', 0, '2019-11-02 15:01:22', '2019-11-02 15:01:22', '2020-11-02 15:01:22'),
('a401c6cf470d914cbae6cec00fcfd4d1102d70125a56df6b1cc3d8f31713ca5be9d8d04928a26ac1', 493, 1, 'user', '[]', 0, '2019-11-05 10:58:37', '2019-11-05 10:58:37', '2020-11-05 10:58:37'),
('a6b87925935cf5ad484b1f503a5d820746207b86ffd101b2d410d2fce0781213eefb768dba9608a4', 483, 1, 'user', '[]', 1, '2019-11-05 05:24:53', '2019-11-05 05:24:53', '2020-11-05 05:24:53'),
('a6bd61bcc408c59a3ed948c4b4e37f7b68543c0cb6e959dc8d9f5ea09386e66efe18bed04c4b590d', 461, 1, 'user', '[]', 0, '2019-11-04 14:19:42', '2019-11-04 14:19:42', '2020-11-04 14:19:42'),
('a77318097247df7b4c2f664263e7b2c4512f7805dccafe5a47541741babceba88776467a358e97d3', 482, 1, 'user', '[]', 0, '2019-11-05 09:23:11', '2019-11-05 09:23:11', '2020-11-05 09:23:11'),
('aca73dc8af357ba12f9d2d2d39902ece28d25ca1d36303c786742dd608b8306f65df9cb48d11e608', 464, 1, 'user', '[]', 0, '2019-11-04 15:28:09', '2019-11-04 15:28:09', '2020-11-04 15:28:09'),
('b46b263d4f82e2e0c349dc6fb837e87acb884eed90e4ed4e75b92b99e33014105f704c04f88eceaf', 484, 1, 'user', '[]', 1, '2019-11-05 05:04:18', '2019-11-05 05:04:18', '2020-11-05 05:04:18'),
('b686f42aaffdb1e018bc05606e1f998c196b775eaad06632ccb6e573aaaa5a75dd56b42b680d7267', 482, 1, 'user', '[]', 0, '2019-11-05 04:58:22', '2019-11-05 04:58:22', '2020-11-05 04:58:22'),
('ba7e37faa2d19e8f587866d26824cdbc6475e54d1c922620c02aebd1d3631569aa933dac40770929', 482, 1, 'user', '[]', 1, '2019-11-05 06:53:36', '2019-11-05 06:53:36', '2020-11-05 06:53:36'),
('bace5bdc3d1cccc84866bb56ba42a50d287a3352ea356514678470cb89e18e214c1a66175e2c4d08', 475, 1, 'user', '[]', 0, '2019-11-05 00:47:20', '2019-11-05 00:47:20', '2020-11-05 00:47:20'),
('bc5f305912c8775a8671be550e577c784051273bb571da2f23ed9752323785a332b828af8d6554fa', 494, 1, 'user', '[]', 0, '2019-11-05 11:31:57', '2019-11-05 11:31:57', '2020-11-05 11:31:57'),
('bd31030fbfda3b993d38ecb0d76fa8453695749ce1611d20513c1ab69dfe8bd9882f2eaa3d57cbd0', 479, 1, 'user', '[]', 0, '2019-11-05 07:30:05', '2019-11-05 07:30:05', '2020-11-05 07:30:05'),
('bf2526bda8e38b5883099264be1e7e2a87148c8b3ccaea5f534dc085e164bad1a1575c289c1317b3', 466, 1, 'user', '[]', 0, '2019-11-04 17:36:15', '2019-11-04 17:36:15', '2020-11-04 17:36:15'),
('c13505d14a2d7c676f8133d88bcd36ad6e84b9ccd53f606dc2ece94f38e5065e88fa1ccf48556fb1', 455, 1, 'user', '[]', 0, '2019-11-04 04:57:37', '2019-11-04 04:57:37', '2020-11-04 04:57:37'),
('c1ddc95e981221067bc34a203a4524c8ee925780c69a635135d2f7b35fc7869d755b7dbe1d0dc0e9', 448, 1, 'user', '[]', 0, '2019-11-02 15:04:41', '2019-11-02 15:04:41', '2020-11-02 15:04:41'),
('c6458c02e270b56d47bcfb5188260e438925d6897dfbe57d3a1ee60069c02fe8b18a627b8659cfbe', 481, 1, 'user', '[]', 1, '2019-11-05 04:53:55', '2019-11-05 04:53:55', '2020-11-05 04:53:55'),
('c7fe7d2de878e47743c6e56f561e3cdca27655920c7df5cb8485e166a11cc9739674837c66f7c704', 479, 1, 'user', '[]', 1, '2019-11-05 03:59:34', '2019-11-05 03:59:34', '2020-11-05 03:59:34'),
('c97a81c132b53fa9bc70f10c0ada14aae16832e92adf7e564e4879d97bee628f59959555465b793e', 454, 1, 'user', '[]', 0, '2019-11-03 21:00:23', '2019-11-03 21:00:23', '2020-11-03 21:00:23'),
('cc14387d855e320e170d41d273ed46a5ed6170847b99aa36cfe3697eb22c0b9def59024d970351f5', 444, 1, 'user', '[]', 0, '2019-10-31 09:42:26', '2019-10-31 09:42:26', '2020-10-31 09:42:26'),
('ceaf89fa67423c5968c111a7f9974998ae3ad63be308e2792e2bada17ef8c2a30a8cc9814e22ef1a', 445, 1, 'user', '[]', 1, '2019-10-31 09:53:18', '2019-10-31 09:53:18', '2020-10-31 09:53:18'),
('cee7647f3978f4fcaf6ff875166b314aa41f630a4a2f019a3b434dd9cfb76e3fb9119fe80ee0806a', 453, 1, 'user', '[]', 0, '2019-11-03 15:07:12', '2019-11-03 15:07:12', '2020-11-03 15:07:12'),
('cf531307d07dea7235035ad1ff265cf09000e61c29f4ca06020432c9f87c1b7c9347b386914737af', 466, 1, 'user', '[]', 0, '2019-11-04 17:36:41', '2019-11-04 17:36:41', '2020-11-04 17:36:41'),
('d0c8ed1aae61b462b1dd8898e43674652d5046bd2e153f56ea3e88e78f0b3c57c976a1061bd99d62', 447, 1, 'user', '[]', 1, '2019-10-31 09:56:38', '2019-10-31 09:56:38', '2020-10-31 09:56:38'),
('d192e169a6d4da06034c252f492e4f4bed62ea891030f4b66d2ee6191f10215d85da79409b997991', 463, 1, 'user', '[]', 0, '2019-11-04 14:24:14', '2019-11-04 14:24:14', '2020-11-04 14:24:14'),
('d1d50e144a2e4cf7d5fddad78fe3312a2ce6b4ac6526a32d6998abaeb9ff1c6a91322e50e91e013d', 495, 1, 'user', '[]', 0, '2019-11-05 11:59:42', '2019-11-05 11:59:42', '2020-11-05 11:59:42'),
('d2eafa4e9eb4c79fb25eedbd0b5d8514b35622ff9b35f20a47dbd30d20918b382ece537d8484150f', 469, 1, 'user', '[]', 0, '2019-11-04 18:04:54', '2019-11-04 18:04:54', '2020-11-04 18:04:54'),
('d39cf0c667ca9f647b3a1b4db3acebc98fad35a427f7b635badc290a56680b5a48ef150c772cc1d5', 460, 1, 'user', '[]', 0, '2019-11-04 11:22:36', '2019-11-04 11:22:36', '2020-11-04 11:22:36'),
('d3c13cbd57240f935d3590726af2763b73a5ebf2ccba8413876fd1096031d59ffc1fd6a2d58f9fc8', 478, 1, 'user', '[]', 0, '2019-11-05 02:21:56', '2019-11-05 02:21:56', '2020-11-05 02:21:56'),
('d58ca66312dce4f5de00e41015215b93339b85c96472407a43f14adb110f64e60c893c4e0505c065', 465, 1, 'user', '[]', 0, '2019-11-04 16:20:29', '2019-11-04 16:20:29', '2020-11-04 16:20:29'),
('d79457a8e6c4473e839c0c9e8838bdce4c48e41363d11207cf32d58e1d4e1d314905242e6c52f3b8', 481, 1, 'user', '[]', 1, '2019-11-05 05:43:44', '2019-11-05 05:43:44', '2020-11-05 05:43:44'),
('d81d3deaecaa48938e3fd62e81fcbced98b0d34d149d46671fe92c0e1c0ff9e44163bb96213fae74', 484, 1, 'user', '[]', 1, '2019-11-05 05:18:06', '2019-11-05 05:18:06', '2020-11-05 05:18:06'),
('d89325c13dfbf3b32f16e33cba3894e9e596f63ba28d5cb160ef3e7bb04717b281a487bf6beb046d', 494, 1, 'user', '[]', 0, '2019-11-05 11:31:14', '2019-11-05 11:31:14', '2020-11-05 11:31:14'),
('d8a41d3d881237bb71b6b0da2d9d51a33d20be487d2ea36ec473dfef24f9b8153f6378db995fa444', 464, 1, 'user', '[]', 0, '2019-11-04 15:30:25', '2019-11-04 15:30:25', '2020-11-04 15:30:25'),
('d97d8f79844406e5035f8d34a297edf5bad2f5ce94a5534edc05d083814759a17dde654ffb2f60cc', 487, 1, 'user', '[]', 0, '2019-11-05 07:13:33', '2019-11-05 07:13:33', '2020-11-05 07:13:33'),
('da97bb12019c10587e2901bf3023fa651f34f4ffd78cce75941a2234d7806578a9cb6ee178f04360', 481, 1, 'user', '[]', 0, '2019-11-05 06:29:24', '2019-11-05 06:29:24', '2020-11-05 06:29:24'),
('de14b0f1c15d4e779f5df5f278ee0cfe7c42f2cee6fff8f2cc7c2da6d5ead3e7a69fb1c75296ce73', 480, 1, 'user', '[]', 1, '2019-11-05 06:03:22', '2019-11-05 06:03:22', '2020-11-05 06:03:22'),
('df261b26ca4969be208634ca1ddbfda47128b135156f7a0c7278f7768a4c20c327baebeced4fd774', 481, 1, 'user', '[]', 1, '2019-11-05 04:35:10', '2019-11-05 04:35:10', '2020-11-05 04:35:10'),
('e0b89bfa7f094e4629a4ea24d2348976e2d9ea89bfad06f587fae05ddc50dca646d2411378cb5ee3', 443, 1, 'user', '[]', 0, '2019-10-31 09:36:40', '2019-10-31 09:36:40', '2020-10-31 09:36:40'),
('e436d10cb325ef064d47b83dea51ccad2b07f14b5f8de73fc1c1bb499d5ea475dd8063e6e05e1e6f', 489, 1, 'user', '[]', 1, '2019-11-05 07:19:36', '2019-11-05 07:19:36', '2020-11-05 07:19:36'),
('e5c068ded213e678a40872bf3d0b13491aea5bc38b46404e863947c798859c5d9dc8db71c7637fe6', 487, 1, 'user', '[]', 0, '2019-11-05 07:12:43', '2019-11-05 07:12:43', '2020-11-05 07:12:43'),
('e5c90406cf25f4bddbb156eb9aaf789e2f9ffa6d9fcf7a82f46a22a9819e3426560aef849b5cffc5', 476, 1, 'user', '[]', 0, '2019-11-05 00:58:50', '2019-11-05 00:58:50', '2020-11-05 00:58:50'),
('e6b9c3d6fb32baf60995b1772f84394c64246c83dc56589eb55dd397a896d8419722466b84718bd8', 480, 1, 'user', '[]', 1, '2019-11-05 04:55:50', '2019-11-05 04:55:50', '2020-11-05 04:55:50'),
('e876617e21b4fdf199798efad4b7da415da407b3ed38141ee5265f90a9ee0cb262566a084134ef61', 458, 1, 'user', '[]', 0, '2019-11-04 11:17:05', '2019-11-04 11:17:05', '2020-11-04 11:17:05'),
('e906160d26233982cd37309e72eacabe58da79cb49c2ea186fd742884a9b786b52e344cceec01ef1', 487, 1, 'user', '[]', 0, '2019-11-05 07:13:49', '2019-11-05 07:13:49', '2020-11-05 07:13:49'),
('e9b084724885885409fe3ac9923da29df5ee66effedbd774cb32165423f92347faa7cc3f273c6c40', 445, 1, 'user', '[]', 0, '2019-10-31 20:05:00', '2019-10-31 20:05:00', '2020-10-31 20:05:00'),
('ea02d3209f271104d564583e80a1a11ca3b0a0b9c1989bcdee2fe107cb5d58bb872b1982f6ab41cc', 472, 1, 'user', '[]', 0, '2019-11-04 20:43:16', '2019-11-04 20:43:16', '2020-11-04 20:43:16'),
('eb10d722d6619fc9f9dd87bfc8de94e29d55f407dbf9a68203d1345aa742a07eca74f8e5713c5a58', 491, 1, 'user', '[]', 0, '2019-11-05 09:41:21', '2019-11-05 09:41:21', '2020-11-05 09:41:21'),
('eb37a6b443ef6b252e01aa024053d6a2b0090f48f7cf928d0de32b278d166846dab4bfa5b389963a', 480, 1, 'user', '[]', 1, '2019-11-05 09:23:58', '2019-11-05 09:23:58', '2020-11-05 09:23:58'),
('f1cee1230e0ba78c26fac03d6b94f5752cecaf516952325322fac386f8b6a7301630a9cdc9b93494', 481, 1, 'user', '[]', 1, '2019-11-05 04:42:29', '2019-11-05 04:42:29', '2020-11-05 04:42:29'),
('f3e90da762a4f818dbbc68dfcceed385ffa4bad6d5f7e694a7ff94cde61ecdec048067aec3ff920e', 476, 1, 'user', '[]', 0, '2019-11-05 00:55:17', '2019-11-05 00:55:17', '2020-11-05 00:55:17'),
('f58c66f21720f4b948286cdfd774eb4dd3f659b14536a51ce3442ea1150e3bfc0683b3c18e3d43f9', 463, 1, 'user', '[]', 0, '2019-11-04 14:23:21', '2019-11-04 14:23:21', '2020-11-04 14:23:21'),
('f8ef1de3b19208219e9728fe31e88d399aa2884d186d78b3ebe3bd4a5c2742e5ee02fb368f95c8cf', 491, 1, 'user', '[]', 0, '2019-11-05 09:42:08', '2019-11-05 09:42:08', '2020-11-05 09:42:08'),
('f9b3b7a0347ca3103ccc6e64c6e780952a7d75f5ac381e607cc7dd490de18f319e6013d75ad3e35d', 468, 1, 'user', '[]', 0, '2019-11-04 17:51:09', '2019-11-04 17:51:09', '2020-11-04 17:51:09'),
('fa1e9f8272106d52f79b7ad1af4f3f7ebbc3babe97cce3be7dc6dc8add9e86fee79aaa643ff2655e', 481, 1, 'user', '[]', 1, '2019-11-05 04:28:35', '2019-11-05 04:28:35', '2020-11-05 04:28:35'),
('fabe8b6f29b0c8c469fb6bd804ec2f271219c28ff90a4cc3ae394ad2630fb79e1ee6ce37c721fdef', 457, 1, 'user', '[]', 0, '2019-11-04 08:02:57', '2019-11-04 08:02:57', '2020-11-04 08:02:57'),
('fb7fe9f0ef8dd97e0bd28e978286faca8a896abc30def0975f8b564400a5ba177cb4b2cddcfab1cb', 470, 1, 'user', '[]', 0, '2019-11-04 18:41:00', '2019-11-04 18:41:00', '2020-11-04 18:41:00'),
('fb87a2b4a77e40aa8a86d3a37488a26d8ddeb8e9ae99c775c3beabe9f26cd919930d95767a26a759', 479, 1, 'user', '[]', 1, '2019-11-05 06:05:57', '2019-11-05 06:05:57', '2020-11-05 06:05:57'),
('fbc95f2de8a2c7006e6b35d34e0abb79d443977f46137e4dc88883230a3ceb34d6dd2a8f41cf761a', 475, 1, 'user', '[]', 0, '2019-11-05 00:42:56', '2019-11-05 00:42:56', '2020-11-05 00:42:56'),
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
(153, 466, 'Finally 💎', 'Love Push - Connect the world! 🌈🌍', '1572896205.png', 0, 1, '2019-11-04 19:36:45', '2019-11-04 19:36:45'),
(155, 467, 'Fiⷥnⷮaⷨlⷨlͭyⷡ 😍😍😘', NULL, '1572897552.png', 0, 1, '2019-11-04 19:59:12', '2019-11-04 19:59:12'),
(157, 473, 'cruisin', 'My new van', '1572918529.png', 0, 1, '2019-11-05 01:48:49', '2019-11-05 01:48:49'),
(158, 481, 'testing', 'Ghhhh bhhh hj\nHhhj', '1572929665.png', 0, 1, '2019-11-05 04:54:25', '2019-11-05 04:54:25'),
(159, 471, 'dogs day out !', 'an amazing dog pic on dog day!', '1572938053.png', 0, 1, '2019-11-05 07:14:13', '2019-11-05 07:14:13'),
(160, 486, 'testing', 'Gght y yvbyyb yybybbu\nBb is a very beautiful and bn', '1572938275.png', 0, 1, '2019-11-05 07:17:55', '2019-11-05 07:17:55'),
(161, 489, 'testing', 'Yvyvyb y yyv\nY   u uu u u u', '1572938429.png', 0, 1, '2019-11-05 07:20:29', '2019-11-05 07:20:29'),
(163, 482, NULL, 'Description', '1572940121.png', 1, 1, '2019-11-05 07:48:41', '2019-11-05 07:48:41');

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
(137, 482, 'ghjxdgj', 'Uhdfjl', 1, '1572938295.png', '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.621042245094312', '77.08198945045199', 1, '100.00', 1, '0', '2019-11-05 07:17:15', '2019-11-05 07:18:15'),
(138, 471, 'dog day', 'dog dog dog mug mug mug', 2, '1572938402.png', 'Berlin, Germany', '52.520006599999995', '13.404954', 0, '100.00', 1, '0', '2019-11-05 07:20:02', '2019-11-05 07:20:02'),
(139, 471, 'cake !!!!!', 'have some cake and get some sweet tooth !!', 1, '1572938484.png', 'C-1/137 shop number -3 Lal Sai Mandir Marg Block A3, Block C2A, Janakpuri, Delhi, 110058, India', '28.6211806', '77.08227149999999', 0, '100.00', 1, '0', '2019-11-05 07:21:24', '2019-11-05 07:21:24'),
(140, 487, 'lovely weather', '😎😎😎😨😨😨😨😨😨😨', 2, '1572940232.png', 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.621087499999994', '77.08180078125', 0, '100.00', 1, '0', '2019-11-05 07:50:32', '2019-11-05 07:50:32');

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
(106, 153, 470, 1, '2019-11-04 19:37:21', '2019-11-04 19:37:21'),
(107, 152, 470, 1, '2019-11-04 19:37:25', '2019-11-04 19:37:25'),
(108, 153, 467, 1, '2019-11-04 19:55:12', '2019-11-04 19:55:12'),
(109, 155, 467, 1, '2019-11-04 19:59:27', '2019-11-04 19:59:27'),
(110, 155, 472, 0, '2019-11-04 21:05:54', '2019-11-04 21:05:56'),
(111, 155, 466, 1, '2019-11-04 21:15:35', '2019-11-04 21:15:49'),
(112, 153, 473, 1, '2019-11-05 01:49:37', '2019-11-05 01:49:37'),
(113, 157, 466, 1, '2019-11-05 01:50:08', '2019-11-05 01:50:08'),
(114, 153, 471, 1, '2019-11-05 04:29:35', '2019-11-05 04:29:35'),
(115, 153, 481, 1, '2019-11-05 04:39:34', '2019-11-05 04:39:34'),
(116, 158, 481, 1, '2019-11-05 04:54:29', '2019-11-05 04:54:29'),
(117, 153, 480, 1, '2019-11-05 04:56:52', '2019-11-05 04:56:52'),
(118, 158, 471, 1, '2019-11-05 07:12:26', '2019-11-05 07:12:26'),
(119, 159, 471, 0, '2019-11-05 07:15:55', '2019-11-05 07:15:56'),
(120, 161, 487, 1, '2019-11-05 07:24:37', '2019-11-05 07:24:37'),
(121, 159, 487, 1, '2019-11-05 07:26:10', '2019-11-05 07:26:10'),
(122, 155, 487, 1, '2019-11-05 07:30:06', '2019-11-05 07:30:06'),
(123, 163, 487, 1, '2019-11-05 07:52:00', '2019-11-05 07:52:00');

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
(463, 413, '5dc0744ca0eb47336790c415', 1, '2019-11-04 18:56:20', '2019-11-04 18:56:20'),
(464, 411, '5dc07222a0eb47293090c418', 1, '2019-11-04 19:00:10', '2019-11-04 19:00:10'),
(465, 420, '5dc0d56aa0eb47147e90c416', 1, '2019-11-05 01:50:40', '2019-11-05 01:50:40'),
(466, 421, '5dc0f3b6a28f9a437ca9feab', 1, '2019-11-05 03:59:50', '2019-11-05 03:59:50'),
(467, 416, '5dc0f47fa0eb472b5990c418', 1, '2019-11-05 04:03:16', '2019-11-05 04:03:16'),
(468, 418, '5dc0f655a28f9a5bfca9feab', 1, '2019-11-05 04:11:07', '2019-11-05 04:11:07'),
(469, 428, '5dc1211da0eb47385590c417', 1, '2019-11-05 07:13:45', '2019-11-05 07:13:45'),
(470, 430, '5dc12384a28f9a5bbca9feab', 1, '2019-11-05 07:23:57', '2019-11-05 07:23:57'),
(471, 434, '5dc123bba0eb473c6990c416', 1, '2019-11-05 07:24:49', '2019-11-05 07:24:49'),
(474, 431, '5dc1258fa28f9a65b6a9feab', 1, '2019-11-05 07:32:41', '2019-11-05 07:32:41');

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

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `name`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(2, 'lovepush', 'gfdf', 'Gggh', '2019-11-05 05:46:42', '2019-11-05 05:46:42');

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
(2871, 209, 1),
(2872, 209, 2),
(2873, 209, 3),
(2874, 209, 4),
(2875, 209, 5),
(2876, 209, 6),
(2877, 209, 7),
(2878, 209, 13),
(2879, 209, 15),
(2880, 209, 16),
(2907, 213, 1),
(2908, 213, 2),
(2909, 213, 3),
(2910, 213, 4),
(2911, 213, 5),
(2912, 213, 6),
(2913, 213, 7),
(2914, 213, 13),
(2915, 214, 1),
(2916, 214, 2),
(2917, 214, 3),
(2918, 214, 4),
(2919, 214, 5),
(2920, 214, 6),
(2921, 214, 7),
(2922, 214, 13),
(2931, 216, 1),
(2932, 216, 2),
(2933, 216, 3),
(2934, 216, 4),
(2935, 216, 5),
(2936, 216, 6),
(2937, 216, 7),
(2938, 216, 13),
(2939, 216, 15),
(2940, 216, 16),
(2949, 218, 1),
(2950, 218, 2),
(2951, 218, 3),
(2952, 218, 4),
(2953, 218, 5),
(2954, 218, 6),
(2955, 218, 7),
(2956, 218, 13);

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
(4628, 2871, 2),
(4629, 2872, 8),
(4630, 2873, 12),
(4631, 2874, 15),
(4632, 2875, 20),
(4633, 2875, 21),
(4634, 2876, 24),
(4635, 2876, 25),
(4636, 2877, 33),
(4637, 2878, 65),
(4638, 2878, 67),
(4639, 2878, 71),
(4640, 2879, 81),
(4641, 2879, 79),
(4642, 2879, 83),
(4643, 2880, 86),
(4683, 2907, 2),
(4684, 2908, 5),
(4685, 2909, 9),
(4686, 2910, 15),
(4687, 2911, 19),
(4688, 2911, 17),
(4689, 2912, 24),
(4690, 2912, 25),
(4691, 2913, 37),
(4692, 2913, 33),
(4693, 2913, 36),
(4694, 2914, 67),
(4695, 2914, 66),
(4696, 2915, 1),
(4697, 2916, 6),
(4698, 2917, 11),
(4699, 2918, 14),
(4700, 2919, 19),
(4701, 2920, 24),
(4702, 2921, 32),
(4703, 2922, 66),
(4719, 2931, 1),
(4720, 2931, 2),
(4721, 2932, 4),
(4722, 2933, 9),
(4723, 2934, 13),
(4724, 2935, 17),
(4725, 2935, 18),
(4726, 2936, 22),
(4727, 2936, 23),
(4728, 2937, 30),
(4729, 2937, 31),
(4730, 2937, 32),
(4731, 2938, 65),
(4732, 2938, 66),
(4733, 2938, 67),
(4734, 2939, 79),
(4735, 2939, 80),
(4736, 2939, 81),
(4737, 2940, 86),
(4752, 2949, 1),
(4753, 2949, 2),
(4754, 2949, 3),
(4755, 2950, 7),
(4756, 2951, 9),
(4757, 2952, 14),
(4758, 2953, 17),
(4759, 2953, 18),
(4760, 2954, 23),
(4761, 2954, 24),
(4762, 2955, 30),
(4763, 2955, 31),
(4764, 2955, 32),
(4765, 2956, 67),
(4766, 2956, 68),
(4767, 2956, 69);

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
(73, 213, 209, 2907, 2871, '0.00', '0.00', '0.00'),
(74, 213, 209, 2908, 2872, '0.00', '0.00', '0.00'),
(75, 213, 209, 2909, 2873, '5.00', '20.00', '5.00'),
(76, 213, 209, 2910, 2874, '20.00', '20.00', '20.00'),
(77, 213, 209, 2911, 2875, '20.00', '80.00', '20.00'),
(78, 213, 209, 2912, 2876, '40.00', '40.00', '40.00'),
(79, 213, 209, 2913, 2877, '20.00', '40.00', '20.00'),
(80, 213, 209, 2914, 2878, '20.00', '60.00', '20.00'),
(89, 214, 209, 2915, 2871, '0.00', '0.00', '0.00'),
(90, 214, 209, 2916, 2872, '0.00', '0.00', '0.00'),
(91, 214, 209, 2917, 2873, '5.00', '20.00', '5.00'),
(92, 214, 209, 2918, 2874, '0.00', '20.00', '0.00'),
(93, 214, 209, 2919, 2875, '0.00', '80.00', '0.00'),
(94, 214, 209, 2920, 2876, '20.00', '40.00', '20.00'),
(95, 214, 209, 2921, 2877, '5.00', '40.00', '5.00'),
(96, 214, 209, 2922, 2878, '0.00', '60.00', '0.00'),
(97, 214, 213, 2915, 2907, '0.00', '0.00', '0.00'),
(98, 214, 213, 2916, 2908, '0.00', '0.00', '0.00'),
(99, 214, 213, 2917, 2909, '10.00', '20.00', '10.00'),
(100, 214, 213, 2918, 2910, '0.00', '20.00', '0.00'),
(101, 214, 213, 2919, 2911, '40.00', '80.00', '40.00'),
(102, 214, 213, 2920, 2912, '20.00', '40.00', '20.00'),
(103, 214, 213, 2921, 2913, '5.00', '40.00', '5.00'),
(104, 214, 213, 2922, 2914, '20.00', '60.00', '20.00'),
(129, 216, 209, 2931, 2871, '0.00', '0.00', '0.00'),
(130, 216, 209, 2932, 2872, '0.00', '0.00', '0.00'),
(131, 216, 209, 2933, 2873, '5.00', '20.00', '5.00'),
(132, 216, 209, 2934, 2874, '10.00', '20.00', '10.00'),
(133, 216, 209, 2935, 2875, '40.00', '80.00', '40.00'),
(134, 216, 209, 2936, 2876, '10.00', '40.00', '10.00'),
(135, 216, 209, 2937, 2877, '5.00', '40.00', '5.00'),
(136, 216, 209, 2938, 2878, '45.00', '60.00', '45.00'),
(137, 216, 213, 2931, 2907, '0.00', '0.00', '0.00'),
(138, 216, 213, 2932, 2908, '0.00', '0.00', '0.00'),
(139, 216, 213, 2933, 2909, '20.00', '20.00', '20.00'),
(140, 216, 213, 2934, 2910, '10.00', '20.00', '10.00'),
(141, 216, 213, 2935, 2911, '40.00', '80.00', '40.00'),
(142, 216, 213, 2936, 2912, '10.00', '40.00', '10.00'),
(143, 216, 213, 2937, 2913, '15.00', '40.00', '15.00'),
(144, 216, 213, 2938, 2914, '40.00', '60.00', '40.00'),
(145, 216, 214, 2931, 2915, '0.00', '0.00', '0.00'),
(146, 216, 214, 2932, 2916, '0.00', '0.00', '0.00'),
(147, 216, 214, 2933, 2917, '10.00', '20.00', '10.00'),
(148, 216, 214, 2934, 2918, '0.00', '20.00', '0.00'),
(149, 216, 214, 2935, 2919, '0.00', '80.00', '0.00'),
(150, 216, 214, 2936, 2920, '5.00', '40.00', '5.00'),
(151, 216, 214, 2937, 2921, '20.00', '40.00', '20.00'),
(152, 216, 214, 2938, 2922, '20.00', '60.00', '20.00'),
(153, 216, 209, 2939, 2879, '50.00', '60.00', '50.00'),
(154, 216, 209, 2940, 2880, '20.00', '20.00', '20.00'),
(187, 218, 209, 2949, 2871, '0.00', '0.00', '0.00'),
(188, 218, 209, 2950, 2872, '0.00', '0.00', '0.00'),
(189, 218, 209, 2951, 2873, '5.00', '20.00', '5.00'),
(190, 218, 209, 2952, 2874, '0.00', '20.00', '0.00'),
(191, 218, 209, 2953, 2875, '40.00', '80.00', '40.00'),
(192, 218, 209, 2954, 2876, '25.00', '40.00', '25.00'),
(193, 218, 209, 2955, 2877, '5.00', '40.00', '5.00'),
(194, 218, 209, 2956, 2878, '35.00', '60.00', '35.00'),
(195, 218, 213, 2949, 2907, '0.00', '0.00', '0.00'),
(196, 218, 213, 2950, 2908, '0.00', '0.00', '0.00'),
(197, 218, 213, 2951, 2909, '20.00', '20.00', '20.00'),
(198, 218, 213, 2952, 2910, '0.00', '20.00', '0.00'),
(199, 218, 213, 2953, 2911, '40.00', '80.00', '40.00'),
(200, 218, 213, 2954, 2912, '25.00', '40.00', '25.00'),
(201, 218, 213, 2955, 2913, '15.00', '40.00', '15.00'),
(202, 218, 213, 2956, 2914, '25.00', '60.00', '25.00'),
(203, 218, 214, 2949, 2915, '0.00', '0.00', '0.00'),
(204, 218, 214, 2950, 2916, '0.00', '0.00', '0.00'),
(205, 218, 214, 2951, 2917, '10.00', '20.00', '10.00'),
(206, 218, 214, 2952, 2918, '20.00', '20.00', '20.00'),
(207, 218, 214, 2953, 2919, '0.00', '80.00', '0.00'),
(208, 218, 214, 2954, 2920, '20.00', '40.00', '20.00'),
(209, 218, 214, 2955, 2921, '20.00', '40.00', '20.00'),
(210, 218, 214, 2956, 2922, '5.00', '60.00', '5.00'),
(211, 218, 216, 2949, 2931, '0.00', '0.00', '0.00'),
(212, 218, 216, 2950, 2932, '0.00', '0.00', '0.00'),
(213, 218, 216, 2951, 2933, '20.00', '20.00', '20.00'),
(214, 218, 216, 2952, 2934, '0.00', '20.00', '0.00'),
(215, 218, 216, 2953, 2935, '80.00', '80.00', '80.00'),
(216, 218, 216, 2954, 2936, '25.00', '40.00', '25.00'),
(217, 218, 216, 2955, 2937, '60.00', '40.00', '40.00'),
(218, 218, 216, 2956, 2938, '30.00', '60.00', '30.00');

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
(15, 213, 209, '125.00'),
(17, 214, 209, '30.00'),
(18, 214, 213, '95.00'),
(22, 216, 209, '185.00'),
(23, 216, 213, '135.00'),
(24, 216, 214, '55.00'),
(29, 218, 209, '110.00'),
(30, 218, 213, '125.00'),
(31, 218, 214, '75.00'),
(32, 218, 216, '195.00');

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
(466, 'en', 'Tim', 'Createffect', 'tim.leube@gmx.de', 1, 2, '637955793388635', 25, '2019-11-04 05:36:15', NULL, 'Calle Paseo Kuka 27, Holbox, Q.R., Mexico', '21.5261352', '-87.3735628', '+1', '5418418923', NULL, 'No Expectation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Go Pro 💎', 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, '467,468,469,470,471,473,479,480,497', NULL, '481', '467,468,469,470,471,472,473,477,479,480,488,494,495,496,497,498', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'R0P2UC', '', NULL, '0', '0', '1', '1', '0', '0', '2019-11-04 17:34:24', '2019-11-05 14:04:25', NULL, '99447409'),
(467, 'en', 'Zaib rajput', 'createffect 2', 'Hellzone302@gmail.com', 1, 1, NULL, 20, '2019-11-04 05:45:01', NULL, 'Via S. Felice, 21, 40122 Bologna BO, Italy', '44.49669061073444', '11.335391762185504', '+1', '', '$2y$10$YqosY9Pb8zqgYMKzpnn8yuF1rjmsEQBcdgny3XCaN76/uVShb2gK6', 'No Expectation', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Go Pro 💎', 1, 1, NULL, 3, 1, NULL, 1, '549551572889733.jpg', NULL, '466,468,470,487,495,497', NULL, '469,471,472,473,474,479,480,481,482,483,484,485,486,489,491,492,493', '466,468,470,485,487,495,497', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'L1KBXL', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 17:44:40', '2019-11-05 14:07:02', NULL, '99448032'),
(468, 'en', 'Sonte', 'Jones', 'begood_johny@ymail.com', 1, 1, NULL, 28, '2019-11-04 05:54:57', NULL, 'Isarstraße 4, 85368 Moosburg an der Isar, Germany', '48.4658672', '11.9496879', '+49', '15143228687', '$2y$10$.IbnuyOUPiDleYVN8AHZyeXUdtk0IdCvURUOLXOTRlbzgSxOwW62u', 'Relationship, Friendship, Daily Activities', 0, '189', 0, NULL, NULL, 'Bali', 'Be Group', 'Rowing, Bouldern', NULL, 'Live life with love', 1, 1, 1, 3, 1, NULL, 1, '180481572895995.jpg', '471', '466,467,469,470,473,487', NULL, '471', '466,467,469,470,473,487,488,497', NULL, 'English, German', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'WSZQZH', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 17:51:08', '2019-11-05 13:11:53', NULL, '99448709'),
(469, 'en', 'Denis', 'Denis', 'denis.v.krylov@gmail.com', 1, 1, NULL, 37, '2019-11-04 06:06:40', NULL, 'Baidam Rd, Pokhara 33700, Nepal', '28.2193905', '83.957723', '+7', '9255735985', '$2y$10$uGebN5Jvm3J4uog4z84vfOhPv/qlmm2Om26gZ.nAlSPKOVUKux27m', 'Relationship, Friendship, Daily Activities', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '471', '466,468', NULL, '471,487', '466,468,475', NULL, 'English, Russian, Indonesian', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MW5AEP', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 18:04:54', '2019-11-05 07:23:27', NULL, '99449523'),
(470, 'en', 'Clara', 'cla_skrpn', 'clara_huebner@gmx.de', 2, 1, NULL, 24, '2019-11-04 06:38:44', NULL, 'Magdeburger Str. 6, 78467 Konstanz, Germany', '47.6833818', '9.1482449', '+49', '15788514452', '$2y$10$8mhfoArXI5c6PjaOpCRZW.zzhUk8KYCWsaHhEYjU9c8PPIUhtlZVO', 'Friendship, Daily Activities, No Expectation', 0, '1.71', 0, NULL, NULL, NULL, 'Maßschneiderin & Modedesignerin', NULL, NULL, 'VENI VIDI AMAVI', 1, 1, 1, 3, 1, NULL, 1, '560071572893160.jpg', '471,479,487', '466,467,468,473', NULL, '466,467,468,469,471,479,487,497,498', '466,467,468,473', NULL, 'German, English, Spanish, France', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'DUJ6PV', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 18:38:00', '2019-11-05 13:31:23', NULL, '99450904'),
(471, 'en', 'robost', 'robo', 'robo@mailinator.com', 1, 1, NULL, 20, '2019-11-04 06:52:34', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210876', '77.081815', '+1', '9999999999', '$2y$10$kAwsV/b/YyifB0.B9/1DW.LmtHH1zz8UriVRu1foQ7X4WMEjqQ5.6', 'Friendship', 0, '23', 0, NULL, NULL, 'italy', 'tom', 'rom', NULL, 'hahaga', 1, 1, 1, 3, 1, NULL, 1, NULL, '468,469,470,472,481,482', '466,487', NULL, '468,469,470,472,481,482', '466,487', NULL, 'english', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'LEXIBP', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 18:52:14', '2019-11-05 13:52:29', NULL, '99451551'),
(472, 'en', 'Vanésio', 'Handel', 'vanesio_pv@hotmail.com', 1, 1, NULL, 27, '2019-11-04 08:41:30', NULL, 'R. Alves Redol 9, 2855-219 Corroios, Portugal', '38.6482021', '-9.1449169', '+351', '968397689', '$2y$10$O7afSPKOGF6tgNV5uhQJZeH1..Ajj422N.i3bUpqIGESRYYaM2sKS', 'Friendship', NULL, '1.89', 0, NULL, NULL, 'Italy', NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '471', NULL, NULL, '467,468,469,470,471', '466,487', NULL, 'Inglish', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'XMSD7K', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 20:41:01', '2019-11-05 07:23:52', NULL, '99456212'),
(473, 'en', 'Felix', 'Flex', 'colognedog777@gmail.com', 1, 1, NULL, 26, '2019-11-04 10:11:52', NULL, '2301 Hilt Rd, Hornbrook, CA 96044, USA', '42.0024659', '-122.6412513', '+1', '6259373', '$2y$10$F6egCobcujiS25FqYhyFuOhhOFFRFKhQNpf35GYW3M2znwEIu8pYy', 'Friendship, No Expectation', 1, '185', NULL, NULL, NULL, 'nirvana& the moon', 'Love Push', 'love starts within you', NULL, 'Just crazy', 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '466,468,470,482', NULL, '467,469,471,472,479,480,481,483,484,487', '466,468,470,482', NULL, '🇩🇪🇬🇧🇨🇵', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'EIVAXC', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 22:11:32', '2019-11-05 10:48:38', NULL, '99458865'),
(474, 'de', 'Marcel Verlage', 'Celli', 'marcelverlage@yahoo.de', 1, 2, '2469120546632859', 20, '2019-11-05 12:30:24', NULL, 'Kohlstatt 9, 82205 Gilching, Deutschland', '48.10064397112973', '11.295060602026505', '+49', '159 01766759', NULL, 'Beziehung,Freundschaft,Tägliche Aktivitäten,Keine Erwartung', 3, '1,99', NULL, NULL, NULL, 'Kuba', 'Selbständig', 'Tuning', NULL, 'Über mich', 1, 1, 3, 3, 1, 'b133e5a3213eb38ed3084d2368792c53a5898e3f7efb543dedfe39eb0ddb4d26', 2, NULL, NULL, NULL, NULL, '471,487', '466,473,497', NULL, 'Deutsch', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'ZZI89B', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 00:30:24', '2019-11-05 13:11:52', NULL, '99461180'),
(475, 'en', 'daria', 'dary', 'dariakato6@gmail.com', 2, 4, '2282242318', 24, NULL, NULL, NULL, NULL, NULL, '+255', '672876986', NULL, 'Relationship, Friendship, Daily Activities', NULL, NULL, 0, NULL, NULL, 'everywhere', 'education', 'music,books,movie,beach', NULL, 'hello..', 1, 1, 1, 3, 1, NULL, 1, '523631572914947.jpg', NULL, NULL, NULL, '467,468,470,471,472,473,474', '469', NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'TXSP5D', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 00:42:56', '2019-11-05 00:51:45', NULL, '99461426'),
(476, 'en', 'Susan', 'Susan22', 'taylorsusan1983@gmail.com', 2, 4, '6853792393', 31, NULL, NULL, 'Poly Road, Ede, Nigeria', '7.731255', '4.4225495', '+1', '3238351258', NULL, 'Relationship', 0, NULL, 0, NULL, NULL, NULL, NULL, 'ask me', NULL, 'ask me', 1, 1, 1, 3, 1, NULL, 1, '860761572915673.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'T0W1OK', '1405', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 00:54:12', '2019-11-05 01:01:15', NULL, '99461633'),
(477, 'de', 'franko', 'Cangeil', 'cangeil@gmx.de', 1, 1, NULL, 21, '2019-11-05 01:10:25', NULL, 'Naturpark Taunus, Feldbergstraße 64, 61449 Steinbach (Taunus), Deutschland', '50.170915788378814', '8.571571962459167', '+49', '179 9363637', '$2y$10$/TBM1uTgql.A/B5N.r5EzueKVgIERLYEaOqcaMyVZDXuAn9JKeFlu', 'Freundschaft', 3, '1,81', NULL, NULL, NULL, 'Rio', 'selbstständig', NULL, NULL, NULL, 1, 1, 3, 3, 1, NULL, 2, '574111572916678.png', NULL, NULL, NULL, NULL, '466', NULL, 'Deutsch', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'T6BKO0', '', NULL, '1', '1', '1', '1', '0', '0', '2019-11-05 01:10:08', '2019-11-05 01:18:35', NULL, '99461967'),
(478, 'en', 'Ⓜ️arc-Oliver Fl✍', NULL, NULL, NULL, 4, '1574309813', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'D05QIZ', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 01:28:15', '2019-11-05 01:28:15', NULL, ''),
(479, 'en', 'John Carter', 'John', 'john@mailinator.com', 1, 1, NULL, 26, '2019-11-05 03:33:58', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210883', '77.0818145', '+91', '1234567894', '$2y$10$QspoC7FUqC/KR6VA0u2pWeQ4pTWpynspnXC2GSLAojNICPPIiJjVK', 'Friendship,Daily Activities', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, '1ecf1ecd5b1256fc64647e21a0abae48822eeacd378c957de9eb8a66d3d1060a', 2, NULL, '470', '466', NULL, '470,471,488', '466,484,487', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'CUNIUE', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 03:33:33', '2019-11-05 07:53:36', NULL, '99464990'),
(480, 'en', 'Manish', 'vhhh', 'manishpreet0186@gmail.com', 1, 2, '1120785261461977', 21, '2019-11-05 09:23:58', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280698', '76.8462578', '+1', '6688889', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 3, 1, NULL, 1, NULL, '487', '466,481,484,486,489', NULL, '471,487', '466,481,484,486,489', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'FSDK1E', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 04:17:53', '2019-11-05 10:47:44', NULL, '99466111'),
(481, 'en', 'testing name', 'testing', 'manish@mailinator.com', 1, 1, NULL, 21, '2019-11-05 04:26:58', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280903', '76.8462688', '+1', '9999655888', '$2y$10$qWHOgbt0FZ95MMAWCgkP0.FL4JIoctRLFpIgZhh8oE0ajGu9t21ZS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '471', '480', NULL, '471,479,480,487', '480,484', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '6GFY1B', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 04:26:13', '2019-11-05 07:53:32', NULL, '99466384'),
(482, 'en', 'Micheal Johns', 'Love Push', 'xicomtest04@gmail.com', 1, 2, '2340729176175958', 22, '2019-11-05 09:23:11', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.62104559785558', '77.0819749497595', '+91', '551364844554', NULL, 'Friendship,Daily Activities', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 2, '1572938170.png', '471,490', '473,487', NULL, '471,490', '473,487', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'A7HPJJ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 04:58:22', '2019-11-05 09:23:12', NULL, '99467331'),
(483, 'en', 'Xien Lua', 'Xein Lua', 'xicomtest11@gmail.com', 1, 3, '104672601682824780059', 23, '2019-11-05 05:24:53', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.621095512088967', '77.08190973855282', '+49', '1545464454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, '487', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'YSJ4HU', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 04:59:52', '2019-11-05 07:23:05', NULL, '99467390'),
(484, 'en', 'lovepush', 'Lp Dhapa', 'dhapa@mailinator.com', 1, 4, '14273783417', 24, '2019-11-05 05:04:12', NULL, 'Manimajra, Chandigarh, 160101, Chandigarh, India', '30.729894', '76.841159', '+234', '2215664848', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, NULL, '480,487', NULL, '489', '479,480,481,486,487', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'RRBGFT', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 05:03:05', '2019-11-05 09:24:25', NULL, '99467477'),
(485, 'en', 'AISHWARYA SRIVASTAVA', 'Ashwariya', 'riya.verma261993@gmail.com', 1, 3, '112458410988232482365', 21, '2019-11-05 06:18:36', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.621043711927367', '77.08193580627169', '+1', '48484843454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, '1ecf1ecd5b1256fc64647e21a0abae48822eeacd378c957de9eb8a66d3d1060a', 2, NULL, NULL, NULL, NULL, '487', '467', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '73NBR8', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 06:18:36', '2019-11-05 11:10:45', NULL, '99470615'),
(486, 'en', 'testing 123', 'manish testing', 'm@mailinator.com', 1, 1, NULL, 26, '2019-11-05 07:09:54', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280892', '76.8462688', '+1', '66564994994', '$2y$10$dDD/4iSNJYRQUDeSvZfyPuRxr5QgPYJjWqb0mUWPhu3mo.EFAoq.a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '480', NULL, NULL, '480,484,487', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'FJZL5E', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 07:09:18', '2019-11-05 07:53:33', NULL, '99473267'),
(487, 'en', 'James Smith', 'james', 'james.smith241993@gmail.com', 1, 4, '22266994692', 18, NULL, NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210866', '77.0818025', '+1', '1234568490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, '589751572938436.jpg', '470,480', '467,468,471,482,484,489', NULL, '469,470,473,480,481,483,485,488', '467,468,471,472,479,482,484,486,489', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'HULIPG', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 07:12:43', '2019-11-05 10:48:11', NULL, '99473451'),
(488, 'en', 'Diana Castanheira', 'Diana ShantiOm', 'let.soul.shine@gmail.com', 2, 1, NULL, 33, '2019-11-05 07:15:47', NULL, NULL, NULL, NULL, '+351', '917806526', '$2y$10$guPVf0mkPPM1RYwk67wqxOePTthQUBWy0YGWPG6m6EwJgAJV/C3PO', 'No Expectation', 1, NULL, NULL, NULL, NULL, 'Beach & Mountain', 'Masseuge, Animator, Guide, Yoga Teacher', 'Dance, Yoga, Reading, Music, Travelling........', NULL, 'Freelancer and nomad travelling for personal development and to connect with people who also aim to bring positive change into the world! \nI am interested in Permaculture, Yoga, Healthy Living and Education.', 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, '466,468,497', NULL, 'Portuguese, Spanish, English and French', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'Y5QKGI', 'D11OM33', NULL, '0', '0', '1', '1', '0', '0', '2019-11-05 07:15:00', '2019-11-05 13:31:30', NULL, '99473626'),
(489, 'en', 'preet singh', 'preet testing', 'p@mailinator.com', 1, 1, NULL, 24, '2019-11-05 07:19:17', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280869', '76.8462651', '+1', '66555555', '$2y$10$x2ksmB35ZBF2izuPEH.Vn.FL4Jmki7R1mR9NtWoxd0Gmb0Autgy7K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '480,487', NULL, '484', '480,487', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'QUHESA', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 07:19:03', '2019-11-05 07:53:29', NULL, '99473809'),
(491, 'en', 'male testing', 'male singh', 'male@mailinator.com', 2, 1, NULL, 25, '2019-11-05 09:41:40', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280928', '76.8462682', '+1', '5559488784', '$2y$10$bMipVk7N/QndIr5kZNlsGupB4ILC/cuGevlYeo0KH/rvw59VxOrHm', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '467,468,469,470,471,472,473,474,479,480,481,482,483,484,485,486,489', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'GTI6MI', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 09:41:21', '2019-11-05 09:46:52', NULL, '99480970'),
(492, 'de', 'Officer Red', 'Stefan', 'stefan-fauth@vodafone.de', 1, 1, NULL, 31, '2019-11-05 10:43:34', NULL, 'Merkwitzer Straße 24, 04356 Leipzig, Deutschland', '51.42074593999979', '12.478021689999329', '+49', '1717745476', '$2y$10$6FaNkuJvKS6OoxUhfAf.G.M/4qpltao6MQwvTyXy0TV4/mPNoHUxK', 'Beziehung,Freundschaft', 1, '1,79 m', NULL, NULL, NULL, 'Türkei und Ägypten', 'Angestellter', 'Kino, Freunde treffen, Fitnessstudio, zocken, ...', NULL, 'Fragt einfach😉', 1, 1, 3, 3, 1, NULL, 2, '1572961866.png', NULL, NULL, NULL, '494', '497', NULL, 'Deutsch', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'IXC317', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 10:42:48', '2019-11-05 13:53:15', NULL, '99483814'),
(493, 'en', 'ലിഡ്വിൻ', 'tomm', 'lidwin13@gmail.com', 1, 2, '2793644974027905', 20, '2019-11-05 10:58:37', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210789', '77.081814', '+1', '3333333333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '479,482,483,485', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'DOLSLZ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 10:58:37', '2019-11-05 11:01:22', NULL, ''),
(494, 'en', 'Lavi Motwal', 'Lavi Motwal', 'lavimotwal12@gmail.com', 1, 2, '2409316169197780', 28, '2019-11-05 11:31:14', NULL, NULL, NULL, NULL, '+91', '24555767988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '497', '466', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '5Y9SUJ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 11:31:14', '2019-11-05 13:31:22', NULL, '99485400'),
(495, 'de', 'Benny Reschl', 'bennyreschl', 'reschl.instagram@gmail.com', 1, 4, '7695205737', 29, '2019-11-05 12:01:48', NULL, 'Im Großen Busch 26, 44795 Bochum, Deutschland', '51.4428609115704', '7.1971928883644045', '+1', '4917623820875', NULL, 'Freundschaft,Tägliche Aktivitäten,Keine Erwartung', NULL, '176cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 3, 1, '0665655936603852d49679d53b118c8b13beb2a6459f87930dfba69f853c84f2', 2, '1572955595.png', NULL, '467', NULL, '497', '466,467', NULL, 'Deutsch, Englisch', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'Q8V7EN', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 11:55:48', '2019-11-05 13:31:55', NULL, '99486241'),
(496, 'de', 'Benjamin Reschl', NULL, 'viennadelight@gmail.com', NULL, 2, '3688191687864992', NULL, '2019-11-05 11:56:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, '497', '466', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'UJMKOZ', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 11:56:49', '2019-11-05 13:31:11', NULL, '99486267'),
(497, 'en', 'Chandler', 'chandler king', 'chandler1623@hotmail.com', 1, 2, '3057263027634854', 20, '2019-11-05 01:09:50', NULL, 'Blue Ball Close, Coombe St, Bruton BA10 0EP, UK', '51.1129483', '-2.4535556', '+44', '798419648', NULL, 'Relationship', 1, '5.8', NULL, NULL, NULL, 'Germany', 'myself', 'slapping the bass', NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '466,467', NULL, '470,494,495,496', '466,467,468,474,488', NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'SZQAJF', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-05 13:09:50', '2019-11-05 14:07:02', NULL, '99488384');

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
(292, 467, '549551572889733.jpg', '2019-11-04 17:48:53', '2019-11-04 17:48:53'),
(293, 467, '492631572889733.jpg', '2019-11-04 17:48:53', '2019-11-04 17:48:53'),
(294, 467, '719381572889733.jpg', '2019-11-04 17:48:53', '2019-11-04 17:48:53'),
(295, 470, '560071572893160.jpg', '2019-11-04 18:46:00', '2019-11-04 18:46:00'),
(296, 468, '180481572895995.jpg', '2019-11-04 19:33:15', '2019-11-04 19:33:15'),
(297, 475, '523631572914947.jpg', '2019-11-05 00:49:07', '2019-11-05 00:49:07'),
(298, 476, '860761572915673.jpg', '2019-11-05 01:01:13', '2019-11-05 01:01:13'),
(299, 476, '946271572915673.jpg', '2019-11-05 01:01:13', '2019-11-05 01:01:13'),
(301, 477, '574111572916678.png', '2019-11-05 01:17:58', '2019-11-05 01:17:58'),
(317, 482, '778541572938126.png', '2019-11-05 07:15:26', '2019-11-05 07:15:26'),
(318, 487, '589751572938436.jpg', '2019-11-05 07:20:36', '2019-11-05 07:20:36'),
(319, 487, '946881572938436.jpg', '2019-11-05 07:20:36', '2019-11-05 07:20:36'),
(320, 487, '811951572938554.jpg', '2019-11-05 07:22:34', '2019-11-05 07:22:34'),
(323, 495, '365421572955502.png', '2019-11-05 12:05:02', '2019-11-05 12:05:02'),
(324, 495, '679761572955527.png', '2019-11-05 12:05:27', '2019-11-05 12:05:27'),
(325, 495, '866711572955551.png', '2019-11-05 12:05:51', '2019-11-05 12:05:51');

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
(209, 466, '2019-11-05 01:22:53', '2019-11-05 01:22:53'),
(213, 473, '2019-11-05 05:51:53', '2019-11-05 05:51:53'),
(214, 471, '2019-11-05 05:56:13', '2019-11-05 05:56:13'),
(216, 484, '2019-11-05 06:51:51', '2019-11-05 06:51:51'),
(218, 487, '2019-11-05 07:16:57', '2019-11-05 07:16:57');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;
--
-- AUTO_INCREMENT for table `connect_requests`
--
ALTER TABLE `connect_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=970;
--
-- AUTO_INCREMENT for table `deleted_accounts`
--
ALTER TABLE `deleted_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2062;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2581;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `post_ads`
--
ALTER TABLE `post_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `qb_chat_dialog_ids`
--
ALTER TABLE `qb_chat_dialog_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2965;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4782;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;
--
-- AUTO_INCREMENT for table `test_scores`
--
ALTER TABLE `test_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;
--
-- AUTO_INCREMENT for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;
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
