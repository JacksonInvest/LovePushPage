-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2019 at 02:27 PM
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
(1, 'admin', 'admin@love-push.com', '7814817171', '1555586888.jpg', '$2y$10$oALoe/ZsdJCnM91RPUYkFOS.2tP2X/vTdmuJ5xqusIras5gP3hcj.', 100, 'viT4vQHKH2vVYtT5NJrVeeBvoimsEZfyQVF4xwodXPHCSQOeq1kWMMgURqwp', '774846', '2018-10-04 19:04:55', '2018-06-27 05:06:26', '2019-04-18 05:58:08');

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

--
-- Dumping data for table `chat_requests`
--

INSERT INTO `chat_requests` (`id`, `from_user_id`, `to_user_id`, `status`, `created_at`, `updated_at`) VALUES
(62, 329, 333, 'A', '2019-10-25 06:04:52', '2019-10-25 06:06:06'),
(63, 336, 338, 'A', '2019-10-25 07:00:56', '2019-10-25 07:01:16'),
(64, 329, 336, 'A', '2019-10-25 07:01:49', '2019-10-25 07:42:57'),
(67, 374, 368, 'A', '2019-10-29 06:45:56', '2019-10-29 06:47:30'),
(68, 375, 368, 'A', '2019-10-29 06:50:47', '2019-10-29 06:50:55'),
(69, 376, 368, 'A', '2019-10-29 07:07:05', '2019-10-29 07:07:16');

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
(417, 361, 329, '0', '2019-10-25 06:07:20', '2019-10-25 06:07:20'),
(418, 361, 333, '0', '2019-10-25 06:07:21', '2019-10-25 06:07:21'),
(419, 362, 334, '0', '2019-10-25 06:31:06', '2019-10-25 06:31:06'),
(420, 362, 329, '0', '2019-10-25 06:31:06', '2019-10-25 06:31:06'),
(421, 363, 334, '0', '2019-10-25 06:40:45', '2019-10-25 06:40:45'),
(422, 363, 333, '0', '2019-10-25 06:40:45', '2019-10-25 06:40:45'),
(423, 367, 335, '0', '2019-10-26 05:40:17', '2019-10-26 05:40:17'),
(424, 367, 333, '0', '2019-10-26 05:40:17', '2019-10-26 05:40:17'),
(429, 371, 375, '0', '2019-10-29 06:51:10', '2019-10-29 06:51:10'),
(430, 371, 368, '0', '2019-10-29 06:51:10', '2019-10-29 06:51:10'),
(431, 372, 376, '0', '2019-10-29 07:07:30', '2019-10-29 07:07:30'),
(432, 372, 368, '0', '2019-10-29 07:07:30', '2019-10-29 07:07:30'),
(433, 374, 368, '0', '2019-10-30 07:11:00', '2019-10-30 07:11:00'),
(434, 374, 329, '0', '2019-10-30 07:11:00', '2019-10-30 07:11:00'),
(435, 375, 329, '0', '2019-10-30 08:50:54', '2019-10-30 08:50:54'),
(436, 375, 393, '0', '2019-10-30 08:50:54', '2019-10-30 08:50:54'),
(437, 376, 393, '0', '2019-10-30 09:07:29', '2019-10-30 09:07:29'),
(438, 376, 398, '0', '2019-10-30 09:07:29', '2019-10-30 09:07:29'),
(439, 378, 368, '0', '2019-10-30 09:58:10', '2019-10-30 09:58:10'),
(440, 378, 403, '0', '2019-10-30 09:58:10', '2019-10-30 09:58:10'),
(441, 379, 403, '0', '2019-10-30 10:02:32', '2019-10-30 10:02:32'),
(442, 379, 404, '0', '2019-10-30 10:02:32', '2019-10-30 10:02:32'),
(443, 376, 393, '0', '2019-10-30 10:17:19', '2019-10-30 10:17:19'),
(444, 376, 398, '0', '2019-10-30 10:17:19', '2019-10-30 10:17:19'),
(445, 380, 398, '0', '2019-10-30 12:33:27', '2019-10-30 12:33:27'),
(446, 380, 341, '0', '2019-10-30 12:33:27', '2019-10-30 12:33:27'),
(447, 381, 407, '0', '2019-10-30 12:35:35', '2019-10-30 12:35:35'),
(448, 381, 403, '0', '2019-10-30 12:35:35', '2019-10-30 12:35:35'),
(449, 389, 396, '0', '2019-10-30 14:25:42', '2019-10-30 14:25:42'),
(450, 389, 416, '0', '2019-10-30 14:25:42', '2019-10-30 14:25:42'),
(451, 389, 396, '0', '2019-10-30 14:26:44', '2019-10-30 14:26:44'),
(452, 389, 416, '0', '2019-10-30 14:26:44', '2019-10-30 14:26:44');

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
(864, 333, 330, 'S', '2019-10-25 06:12:09', '2019-10-25 06:12:09'),
(865, 334, 330, 'S', '2019-10-25 06:30:14', '2019-10-25 06:30:14'),
(866, 334, 329, 'A', '2019-10-25 06:30:15', '2019-10-25 06:30:48'),
(867, 334, 331, 'S', '2019-10-25 06:30:17', '2019-10-25 06:30:17'),
(868, 334, 333, 'A', '2019-10-25 06:30:18', '2019-10-25 06:40:20'),
(869, 335, 333, 'A', '2019-10-25 06:52:15', '2019-10-26 05:39:52'),
(870, 336, 333, 'A', '2019-10-25 06:57:23', '2019-10-26 05:39:51'),
(871, 368, 329, 'A', '2019-10-30 05:54:40', '2019-10-30 05:55:08'),
(872, 374, 375, 'S', '2019-10-30 07:40:07', '2019-10-30 07:40:07'),
(873, 393, 394, 'S', '2019-10-30 08:00:01', '2019-10-30 08:00:01'),
(874, 393, 392, 'S', '2019-10-30 08:00:22', '2019-10-30 08:00:22'),
(875, 329, 393, 'A', '2019-10-30 08:50:24', '2019-10-30 08:50:34'),
(876, 393, 398, 'A', '2019-10-30 09:06:58', '2019-10-30 09:07:14'),
(877, 396, 416, 'A', '2019-10-30 14:25:23', '2019-10-30 14:25:32');

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
(1, 0, 'Manish kumar', 'Manish kumar', 'manisvgh@mailinator.com', '+1', '6888888885', 'Bad User Experience', 'Bbjkk\nJjk', '2019-10-29 05:46:49', '2019-10-29 05:46:49'),
(2, 0, 'Manish kumar', 'mbhh', 'manishvv@mailinator.com', '+1', '988877788', 'Little activity in my area', 'Testing', '2019-10-29 06:15:23', '2019-10-29 06:15:23'),
(3, 0, 'Manish kumar', 'mani123', 'manishgg@mailinator.com', '+1', '66588888666', 'Other', 'Bbbbb', '2019-10-29 06:19:16', '2019-10-29 06:19:16'),
(4, 0, 'Manish', 'manishpreet', 'manishpreet0186@gmail.com', '+1', '68888599', 'Little activity in my area', 'Dff', '2019-10-29 06:30:48', '2019-10-29 06:30:48'),
(5, 0, 'Manish', 'gggghh', 'manishpreet0186@gmail.com', '+1', '66558555', 'Little activity in my area', 'Ff', '2019-10-29 06:35:02', '2019-10-29 06:35:02'),
(6, 0, 'Manish', 'tyyyu', 'manishpreet0186@gmail.com', '+1', '999999999', 'Other', 'Df', '2019-10-29 06:37:36', '2019-10-29 06:37:36'),
(7, 0, 'Manish', 'gggh', 'manishpreet0186@gmail.com', '+1', '988888', 'Little activity in my area', 'Cc', '2019-10-29 06:41:25', '2019-10-29 06:41:25'),
(8, 0, 'Manish', 'ggg', 'manishpreet0186@gmail.com', '+1', '666588855', 'Disinterest', 'Ff', '2019-10-29 06:48:48', '2019-10-29 06:48:48'),
(9, 0, 'Manish', 'preeting', 'manish.sachtech@gmail.com', '+1', '668885555', 'Disinterest', 'Ff', '2019-10-29 07:03:38', '2019-10-29 07:03:38');

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
(1842, 333, 331, 0, '2019-10-25 06:12:05', '2019-10-25 06:12:05'),
(1843, 377, 375, 1, '2019-10-29 09:24:38', '2019-10-29 09:24:38'),
(1844, 375, 377, 1, '2019-10-29 09:24:45', '2019-10-29 09:24:45'),
(1845, 385, 377, 1, '2019-10-30 05:56:58', '2019-10-30 05:56:58'),
(1846, 368, 401, 1, '2019-10-30 09:45:23', '2019-10-30 09:45:23'),
(1847, 368, 402, 1, '2019-10-30 09:47:59', '2019-10-30 09:47:59'),
(1848, 402, 368, 1, '2019-10-30 09:48:27', '2019-10-30 09:48:27'),
(1849, 403, 368, 1, '2019-10-30 09:54:54', '2019-10-30 09:54:54'),
(1850, 368, 403, 1, '2019-10-30 09:55:19', '2019-10-30 09:55:19'),
(1851, 404, 403, 1, '2019-10-30 10:01:33', '2019-10-30 10:01:33'),
(1852, 403, 404, 1, '2019-10-30 10:02:03', '2019-10-30 10:02:03'),
(1853, 341, 398, 1, '2019-10-30 10:23:15', '2019-10-30 10:23:15'),
(1854, 398, 341, 1, '2019-10-30 10:51:37', '2019-10-30 10:51:37'),
(1855, 403, 407, 1, '2019-10-30 12:32:44', '2019-10-30 12:32:44'),
(1856, 407, 403, 1, '2019-10-30 12:33:20', '2019-10-30 12:33:20'),
(1857, 409, 403, 1, '2019-10-30 12:49:01', '2019-10-30 12:49:01'),
(1858, 403, 409, 1, '2019-10-30 12:49:16', '2019-10-30 12:49:16'),
(1859, 409, 404, 1, '2019-10-30 13:07:41', '2019-10-30 13:07:41'),
(1860, 404, 409, 1, '2019-10-30 13:13:18', '2019-10-30 13:13:18'),
(1861, 368, 409, 1, '2019-10-30 13:48:43', '2019-10-30 13:48:43'),
(1862, 409, 368, 1, '2019-10-30 13:48:56', '2019-10-30 13:48:56'),
(1863, 368, 411, 1, '2019-10-30 14:00:00', '2019-10-30 14:00:00'),
(1864, 411, 368, 1, '2019-10-30 14:00:08', '2019-10-30 14:00:08'),
(1865, 368, 413, 1, '2019-10-30 14:10:55', '2019-10-30 14:10:55'),
(1866, 413, 368, 1, '2019-10-30 14:11:09', '2019-10-30 14:11:09'),
(1867, 368, 415, 1, '2019-10-30 14:16:34', '2019-10-30 14:16:34'),
(1868, 415, 368, 1, '2019-10-30 14:16:50', '2019-10-30 14:16:50'),
(1869, 416, 368, 1, '2019-10-30 14:20:11', '2019-10-30 14:20:11'),
(1870, 368, 416, 1, '2019-10-30 14:20:24', '2019-10-30 14:20:24');

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
(361, 'M', 329, 333, 1, '2019-10-25 06:06:06', '2019-10-25 06:06:06'),
(362, 'C', 334, 329, 1, '2019-10-25 06:30:48', '2019-10-25 06:30:48'),
(363, 'C', 334, 333, 1, '2019-10-25 06:40:20', '2019-10-25 06:40:20'),
(364, 'M', 336, 338, 1, '2019-10-25 07:01:16', '2019-10-25 07:01:16'),
(365, 'M', 329, 336, 1, '2019-10-25 07:42:57', '2019-10-25 07:42:57'),
(366, 'C', 336, 333, 1, '2019-10-26 05:39:51', '2019-10-26 05:39:51'),
(367, 'C', 335, 333, 1, '2019-10-26 05:39:52', '2019-10-26 05:39:52'),
(370, 'M', 374, 368, 1, '2019-10-29 06:47:30', '2019-10-29 06:47:30'),
(371, 'M', 375, 368, 1, '2019-10-29 06:50:55', '2019-10-29 06:50:55'),
(372, 'M', 376, 368, 1, '2019-10-29 07:07:16', '2019-10-29 07:07:16'),
(373, 'L', 375, 377, 1, '2019-10-29 09:24:45', '2019-10-29 09:24:45'),
(374, 'C', 368, 329, 1, '2019-10-30 05:55:08', '2019-10-30 05:55:08'),
(375, 'C', 329, 393, 1, '2019-10-30 08:50:34', '2019-10-30 08:50:34'),
(376, 'C', 393, 398, 1, '2019-10-30 09:07:14', '2019-10-30 09:07:14'),
(377, 'L', 402, 368, 1, '2019-10-30 09:48:27', '2019-10-30 09:48:27'),
(378, 'L', 368, 403, 1, '2019-10-30 09:55:19', '2019-10-30 09:55:19'),
(379, 'L', 403, 404, 1, '2019-10-30 10:02:03', '2019-10-30 10:02:03'),
(380, 'L', 398, 341, 1, '2019-10-30 10:51:37', '2019-10-30 10:51:37'),
(381, 'L', 407, 403, 1, '2019-10-30 12:33:20', '2019-10-30 12:33:20'),
(382, 'L', 403, 409, 1, '2019-10-30 12:49:16', '2019-10-30 12:49:16'),
(383, 'L', 404, 409, 1, '2019-10-30 13:13:18', '2019-10-30 13:13:18'),
(384, 'L', 409, 368, 1, '2019-10-30 13:48:56', '2019-10-30 13:48:56'),
(385, 'L', 411, 368, 1, '2019-10-30 14:00:08', '2019-10-30 14:00:08'),
(386, 'L', 413, 368, 1, '2019-10-30 14:11:09', '2019-10-30 14:11:09'),
(387, 'L', 415, 368, 1, '2019-10-30 14:16:50', '2019-10-30 14:16:50'),
(388, 'L', 368, 416, 1, '2019-10-30 14:20:24', '2019-10-30 14:20:24'),
(389, 'C', 396, 416, 1, '2019-10-30 14:25:32', '2019-10-30 14:25:32');

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
(2298, 'S_M_R', 62, 329, 333, 0, 1, '2019-10-25 06:04:52', '2019-10-25 06:06:06'),
(2299, 'A_M_R', 62, 333, 329, 0, 1, '2019-10-25 06:06:06', '2019-10-25 06:06:38'),
(2300, 'S_C_R', 864, 333, 330, 1, 0, '2019-10-25 06:12:09', '2019-10-25 06:12:09'),
(2301, 'S_C_R', 865, 334, 330, 1, 0, '2019-10-25 06:30:14', '2019-10-25 06:30:14'),
(2302, 'S_C_R', 866, 334, 329, 0, 1, '2019-10-25 06:30:15', '2019-10-25 06:30:48'),
(2303, 'S_C_R', 867, 334, 331, 1, 0, '2019-10-25 06:30:17', '2019-10-25 06:30:17'),
(2304, 'S_C_R', 868, 334, 333, 0, 1, '2019-10-25 06:30:18', '2019-10-25 06:40:20'),
(2305, 'A_C_R', 866, 329, 334, 0, 1, '2019-10-25 06:30:48', '2019-10-30 13:19:24'),
(2306, 'A_C_R', 868, 333, 334, 0, 1, '2019-10-25 06:40:20', '2019-10-30 13:19:24'),
(2307, 'S_C_R', 869, 335, 333, 0, 1, '2019-10-25 06:52:15', '2019-10-26 05:39:52'),
(2308, 'S_C_R', 870, 336, 333, 0, 1, '2019-10-25 06:57:23', '2019-10-26 05:39:51'),
(2309, 'S_M_R', 63, 336, 338, 0, 1, '2019-10-25 07:00:56', '2019-10-25 07:01:16'),
(2310, 'A_M_R', 63, 338, 336, 0, 1, '2019-10-25 07:01:16', '2019-10-25 07:43:01'),
(2311, 'S_M_R', 64, 329, 336, 0, 1, '2019-10-25 07:01:49', '2019-10-25 07:42:58'),
(2312, 'A_M_R', 64, 336, 329, 1, 1, '2019-10-25 07:42:57', '2019-10-30 05:55:06'),
(2313, 'A_C_R', 870, 333, 336, 0, 0, '2019-10-26 05:39:51', '2019-10-30 13:19:24'),
(2314, 'A_C_R', 869, 333, 335, 0, 0, '2019-10-26 05:39:52', '2019-10-30 13:19:24'),
(2319, 'S_M_R', 67, 374, 368, 0, 1, '2019-10-29 06:45:56', '2019-10-29 06:47:30'),
(2320, 'A_M_R', 67, 368, 374, 1, 1, '2019-10-29 06:47:30', '2019-10-29 06:47:34'),
(2321, 'S_M_R', 68, 375, 368, 0, 1, '2019-10-29 06:50:47', '2019-10-29 06:50:55'),
(2322, 'A_M_R', 68, 368, 375, 1, 1, '2019-10-29 06:50:55', '2019-10-29 06:51:25'),
(2323, 'S_M_R', 69, 376, 368, 0, 1, '2019-10-29 07:07:05', '2019-10-29 07:07:16'),
(2324, 'A_M_R', 69, 368, 376, 1, 1, '2019-10-29 07:07:16', '2019-10-29 07:43:43'),
(2325, 'S_L_R', 1843, 377, 375, 0, 1, '2019-10-29 09:24:38', '2019-10-29 09:24:45'),
(2326, 'A_L_R', 1844, 375, 377, 0, 1, '2019-10-29 09:24:45', '2019-10-30 13:19:24'),
(2327, 'S_C_R', 871, 368, 329, 0, 1, '2019-10-30 05:54:40', '2019-10-30 05:55:08'),
(2328, 'A_C_R', 871, 329, 368, 0, 1, '2019-10-30 05:55:08', '2019-10-30 13:19:24'),
(2329, 'S_L_R', 1845, 385, 377, 1, 0, '2019-10-30 05:56:58', '2019-10-30 05:56:58'),
(2330, 'S_C_R', 872, 374, 375, 1, 0, '2019-10-30 07:40:07', '2019-10-30 07:40:07'),
(2331, 'S_C_R', 873, 393, 394, 1, 0, '2019-10-30 08:00:01', '2019-10-30 08:00:01'),
(2332, 'S_C_R', 874, 393, 392, 1, 0, '2019-10-30 08:00:22', '2019-10-30 08:00:22'),
(2333, 'S_C_R', 875, 329, 393, 0, 1, '2019-10-30 08:50:24', '2019-10-30 08:50:34'),
(2334, 'A_C_R', 875, 393, 329, 0, 1, '2019-10-30 08:50:34', '2019-10-30 13:19:24'),
(2335, 'S_C_R', 876, 393, 398, 0, 1, '2019-10-30 09:06:58', '2019-10-30 09:07:14'),
(2336, 'A_C_R', 876, 398, 393, 0, 1, '2019-10-30 09:07:14', '2019-10-30 13:19:24'),
(2337, 'S_L_R', 1846, 368, 401, 1, 1, '2019-10-30 09:45:23', '2019-10-30 09:45:30'),
(2338, 'S_L_R', 1847, 368, 402, 0, 1, '2019-10-30 09:47:59', '2019-10-30 09:48:27'),
(2339, 'A_L_R', 1848, 402, 368, 0, 1, '2019-10-30 09:48:27', '2019-10-30 13:19:24'),
(2340, 'S_L_R', 1849, 403, 368, 0, 1, '2019-10-30 09:54:54', '2019-10-30 09:55:19'),
(2341, 'A_L_R', 1850, 368, 403, 0, 1, '2019-10-30 09:55:19', '2019-10-30 13:19:24'),
(2342, 'S_L_R', 1851, 404, 403, 0, 1, '2019-10-30 10:01:33', '2019-10-30 10:02:03'),
(2343, 'A_L_R', 1852, 403, 404, 0, 1, '2019-10-30 10:02:03', '2019-10-30 13:19:24'),
(2345, 'S_L_R', 1853, 341, 398, 0, 1, '2019-10-30 10:23:15', '2019-10-30 10:51:37'),
(2346, 'A_L_R', 1854, 398, 341, 0, 1, '2019-10-30 10:51:37', '2019-10-30 13:19:24'),
(2347, 'S_L_R', 1855, 403, 407, 0, 1, '2019-10-30 12:32:44', '2019-10-30 12:33:20'),
(2348, 'A_L_R', 1856, 407, 403, 0, 1, '2019-10-30 12:33:20', '2019-10-30 13:19:24'),
(2349, 'S_L_R', 1857, 409, 403, 0, 1, '2019-10-30 12:49:01', '2019-10-30 12:49:16'),
(2350, 'A_L_R', 1858, 403, 409, 0, 1, '2019-10-30 12:49:16', '2019-10-30 13:19:24'),
(2351, 'S_L_R', 1859, 409, 404, 0, 1, '2019-10-30 13:07:41', '2019-10-30 13:13:18'),
(2352, 'A_L_R', 1860, 404, 409, 0, 1, '2019-10-30 13:13:18', '2019-10-30 13:19:24'),
(2353, 'S_L_R', 1861, 368, 409, 0, 1, '2019-10-30 13:48:43', '2019-10-30 13:48:56'),
(2354, 'A_L_R', 1862, 409, 368, 1, 1, '2019-10-30 13:48:56', '2019-10-30 14:20:22'),
(2355, 'S_L_R', 1863, 368, 411, 0, 1, '2019-10-30 14:00:00', '2019-10-30 14:00:08'),
(2356, 'A_L_R', 1864, 411, 368, 1, 1, '2019-10-30 14:00:08', '2019-10-30 14:20:22'),
(2357, 'S_L_R', 1865, 368, 413, 0, 1, '2019-10-30 14:10:55', '2019-10-30 14:11:09'),
(2358, 'A_L_R', 1866, 413, 368, 1, 1, '2019-10-30 14:11:09', '2019-10-30 14:20:22'),
(2359, 'S_L_R', 1867, 368, 415, 0, 1, '2019-10-30 14:16:34', '2019-10-30 14:16:50'),
(2360, 'A_L_R', 1868, 415, 368, 1, 1, '2019-10-30 14:16:50', '2019-10-30 14:20:22'),
(2361, 'S_L_R', 1869, 416, 368, 0, 1, '2019-10-30 14:20:11', '2019-10-30 14:20:24'),
(2362, 'A_L_R', 1870, 368, 416, 1, 1, '2019-10-30 14:20:24', '2019-10-30 14:25:31'),
(2363, 'S_C_R', 877, 396, 416, 0, 1, '2019-10-30 14:25:23', '2019-10-30 14:25:32'),
(2364, 'A_C_R', 877, 416, 396, 1, 1, '2019-10-30 14:25:32', '2019-10-30 14:25:37');

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
(2298, 1, 'roman has sent you Chat Request.', '2019-10-25 06:04:52', '2019-10-25 06:04:52'),
(2298, 2, 'roman hat dir eine Chatanfrage gesendet.', '2019-10-25 06:04:52', '2019-10-25 06:04:52'),
(2299, 1, 'Tim accepted a chat request.', '2019-10-25 06:06:06', '2019-10-25 06:06:06'),
(2299, 2, 'Tim hat eine Chatanfrage gesendet.', '2019-10-25 06:06:06', '2019-10-25 06:06:06'),
(2300, 1, 'Tim has sent you Connect Request', '2019-10-25 06:12:09', '2019-10-25 06:12:09'),
(2300, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-25 06:12:09', '2019-10-25 06:12:09'),
(2301, 1, 'The has sent you Connect Request', '2019-10-25 06:30:14', '2019-10-25 06:30:14'),
(2301, 2, 'The hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-25 06:30:14', '2019-10-25 06:30:14'),
(2302, 1, 'The has sent you Connect Request', '2019-10-25 06:30:15', '2019-10-25 06:30:15'),
(2302, 2, 'The hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-25 06:30:15', '2019-10-25 06:30:15'),
(2303, 1, 'The has sent you Connect Request', '2019-10-25 06:30:17', '2019-10-25 06:30:17'),
(2303, 2, 'The hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-25 06:30:17', '2019-10-25 06:30:17'),
(2304, 1, 'The has sent you Connect Request', '2019-10-25 06:30:18', '2019-10-25 06:30:18'),
(2304, 2, 'The hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-25 06:30:18', '2019-10-25 06:30:18'),
(2305, 1, 'roman accepted a connect request.', '2019-10-25 06:30:48', '2019-10-25 06:30:48'),
(2305, 2, 'roman hat eine Verbindungsanforderung angenommen.', '2019-10-25 06:30:48', '2019-10-25 06:30:48'),
(2306, 1, 'Tim accepted a connect request.', '2019-10-25 06:40:20', '2019-10-25 06:40:20'),
(2306, 2, 'Tim hat eine Verbindungsanforderung angenommen.', '2019-10-25 06:40:20', '2019-10-25 06:40:20'),
(2307, 1, 'Felix has sent you Connect Request', '2019-10-25 06:52:15', '2019-10-25 06:52:15'),
(2307, 2, 'Felix hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-25 06:52:15', '2019-10-25 06:52:15'),
(2308, 1, 'Test has sent you Connect Request', '2019-10-25 06:57:23', '2019-10-25 06:57:23'),
(2308, 2, 'Test hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-25 06:57:23', '2019-10-25 06:57:23'),
(2309, 1, 'Test has sent you Chat Request.', '2019-10-25 07:00:56', '2019-10-25 07:00:56'),
(2309, 2, 'Test hat dir eine Chatanfrage gesendet.', '2019-10-25 07:00:56', '2019-10-25 07:00:56'),
(2310, 1, 'test accepted a chat request.', '2019-10-25 07:01:16', '2019-10-25 07:01:16'),
(2310, 2, 'test hat eine Chatanfrage gesendet.', '2019-10-25 07:01:16', '2019-10-25 07:01:16'),
(2311, 1, 'roman has sent you Chat Request.', '2019-10-25 07:01:49', '2019-10-25 07:01:49'),
(2311, 2, 'roman hat dir eine Chatanfrage gesendet.', '2019-10-25 07:01:49', '2019-10-25 07:01:49'),
(2312, 1, 'Test accepted a chat request.', '2019-10-25 07:42:57', '2019-10-25 07:42:57'),
(2312, 2, 'Test hat eine Chatanfrage gesendet.', '2019-10-25 07:42:58', '2019-10-25 07:42:58'),
(2313, 1, 'Tim accepted a connect request.', '2019-10-26 05:39:51', '2019-10-26 05:39:51'),
(2313, 2, 'Tim hat eine Verbindungsanforderung angenommen.', '2019-10-26 05:39:51', '2019-10-26 05:39:51'),
(2314, 1, 'Tim accepted a connect request.', '2019-10-26 05:39:52', '2019-10-26 05:39:52'),
(2314, 2, 'Tim hat eine Verbindungsanforderung angenommen.', '2019-10-26 05:39:52', '2019-10-26 05:39:52'),
(2319, 1, 'Manish kumar has sent you Chat Request.', '2019-10-29 06:45:56', '2019-10-29 06:45:56'),
(2319, 2, 'Manish kumar hat dir eine Chatanfrage gesendet.', '2019-10-29 06:45:56', '2019-10-29 06:45:56'),
(2320, 1, 'manish015 accepted a chat request.', '2019-10-29 06:47:30', '2019-10-29 06:47:30'),
(2320, 2, 'manish015 hat eine Chatanfrage gesendet.', '2019-10-29 06:47:30', '2019-10-29 06:47:30'),
(2321, 1, 'Manish has sent you Chat Request.', '2019-10-29 06:50:47', '2019-10-29 06:50:47'),
(2321, 2, 'Manish hat dir eine Chatanfrage gesendet.', '2019-10-29 06:50:47', '2019-10-29 06:50:47'),
(2322, 1, 'manish015 accepted a chat request.', '2019-10-29 06:50:55', '2019-10-29 06:50:55'),
(2322, 2, 'manish015 hat eine Chatanfrage gesendet.', '2019-10-29 06:50:55', '2019-10-29 06:50:55'),
(2323, 1, 'Manish has sent you Chat Request.', '2019-10-29 07:07:05', '2019-10-29 07:07:05'),
(2323, 2, 'Manish hat dir eine Chatanfrage gesendet.', '2019-10-29 07:07:05', '2019-10-29 07:07:05'),
(2324, 1, 'manish015 accepted a chat request.', '2019-10-29 07:07:16', '2019-10-29 07:07:16'),
(2324, 2, 'manish015 hat eine Chatanfrage gesendet.', '2019-10-29 07:07:16', '2019-10-29 07:07:16'),
(2325, 1, 'Flutter has sent you Date Request.', '2019-10-29 09:24:38', '2019-10-29 09:24:38'),
(2325, 2, 'Flutter hat Ihnen eine Terminanfrage gesendet.', '2019-10-29 09:24:38', '2019-10-29 09:24:38'),
(2326, 1, 'Manish has accepted your Date Request.', '2019-10-29 09:24:45', '2019-10-29 09:24:45'),
(2326, 2, 'Manish hat Ihre Terminanfrage angenommen.', '2019-10-29 09:24:45', '2019-10-29 09:24:45'),
(2327, 1, 'manish015 has sent you Connect Request', '2019-10-30 05:54:40', '2019-10-30 05:54:40'),
(2327, 2, 'manish015 hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-30 05:54:40', '2019-10-30 05:54:40'),
(2328, 1, 'roman accepted a connect request.', '2019-10-30 05:55:08', '2019-10-30 05:55:08'),
(2328, 2, 'roman hat eine Verbindungsanforderung angenommen.', '2019-10-30 05:55:08', '2019-10-30 05:55:08'),
(2329, 1, 'Ranjana has sent you Date Request.', '2019-10-30 05:56:58', '2019-10-30 05:56:58'),
(2329, 2, 'Ranjana hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 05:56:58', '2019-10-30 05:56:58'),
(2330, 1, 'Manish kumar has sent you Connect Request', '2019-10-30 07:40:07', '2019-10-30 07:40:07'),
(2330, 2, 'Manish kumar hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-30 07:40:07', '2019-10-30 07:40:07'),
(2331, 1, 'Mayur Chaudhary has sent you Connect Request', '2019-10-30 08:00:02', '2019-10-30 08:00:02'),
(2331, 2, 'Mayur Chaudhary hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-30 08:00:02', '2019-10-30 08:00:02'),
(2332, 1, 'Mayur Chaudhary has sent you Connect Request', '2019-10-30 08:00:22', '2019-10-30 08:00:22'),
(2332, 2, 'Mayur Chaudhary hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-30 08:00:22', '2019-10-30 08:00:22'),
(2333, 1, 'roman has sent you Connect Request', '2019-10-30 08:50:24', '2019-10-30 08:50:24'),
(2333, 2, 'roman hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-30 08:50:24', '2019-10-30 08:50:24'),
(2334, 1, 'Mayur Chaudhary accepted a connect request.', '2019-10-30 08:50:34', '2019-10-30 08:50:34'),
(2334, 2, 'Mayur Chaudhary hat eine Verbindungsanforderung angenommen.', '2019-10-30 08:50:34', '2019-10-30 08:50:34'),
(2335, 1, 'Mayur Chaudhary has sent you Connect Request', '2019-10-30 09:06:58', '2019-10-30 09:06:58'),
(2335, 2, 'Mayur Chaudhary hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-30 09:06:58', '2019-10-30 09:06:58'),
(2336, 1, 'AISHWARYA SRIVASTAVA accepted a connect request.', '2019-10-30 09:07:14', '2019-10-30 09:07:14'),
(2336, 2, 'AISHWARYA SRIVASTAVA hat eine Verbindungsanforderung angenommen.', '2019-10-30 09:07:14', '2019-10-30 09:07:14'),
(2337, 1, 'manish015 has sent you Date Request.', '2019-10-30 09:45:23', '2019-10-30 09:45:23'),
(2337, 2, 'manish015 hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 09:45:23', '2019-10-30 09:45:23'),
(2338, 1, 'manish015 has sent you Date Request.', '2019-10-30 09:47:59', '2019-10-30 09:47:59'),
(2338, 2, 'manish015 hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 09:47:59', '2019-10-30 09:47:59'),
(2339, 1, 'manish testing has accepted your Date Request.', '2019-10-30 09:48:27', '2019-10-30 09:48:27'),
(2339, 2, 'manish testing hat Ihre Terminanfrage angenommen.', '2019-10-30 09:48:27', '2019-10-30 09:48:27'),
(2340, 1, 'Harryn has sent you Date Request.', '2019-10-30 09:54:54', '2019-10-30 09:54:54'),
(2340, 2, 'Harryn hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 09:54:54', '2019-10-30 09:54:54'),
(2341, 1, 'manish015 has accepted your Date Request.', '2019-10-30 09:55:19', '2019-10-30 09:55:19'),
(2341, 2, 'manish015 hat Ihre Terminanfrage angenommen.', '2019-10-30 09:55:19', '2019-10-30 09:55:19'),
(2342, 1, 'rahul has sent you Date Request.', '2019-10-30 10:01:33', '2019-10-30 10:01:33'),
(2342, 2, 'rahul hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 10:01:33', '2019-10-30 10:01:33'),
(2343, 1, 'Harryn has accepted your Date Request.', '2019-10-30 10:02:03', '2019-10-30 10:02:03'),
(2343, 2, 'Harryn hat Ihre Terminanfrage angenommen.', '2019-10-30 10:02:03', '2019-10-30 10:02:03'),
(2344, 1, '', '2019-10-30 10:08:09', '2019-10-30 10:08:09'),
(2344, 2, '', '2019-10-30 10:08:09', '2019-10-30 10:08:09'),
(2345, 1, 'Tim Leube has sent you Date Request.', '2019-10-30 10:23:15', '2019-10-30 10:23:15'),
(2345, 2, 'Tim Leube hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 10:23:15', '2019-10-30 10:23:15'),
(2346, 1, 'AISHWARYA SRIVASTAVA has accepted your Date Request.', '2019-10-30 10:51:37', '2019-10-30 10:51:37'),
(2346, 2, 'AISHWARYA SRIVASTAVA hat Ihre Terminanfrage angenommen.', '2019-10-30 10:51:37', '2019-10-30 10:51:37'),
(2347, 1, 'Harryn has sent you Date Request.', '2019-10-30 12:32:44', '2019-10-30 12:32:44'),
(2347, 2, 'Harryn hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 12:32:44', '2019-10-30 12:32:44'),
(2348, 1, 'Hardik has accepted your Date Request.', '2019-10-30 12:33:20', '2019-10-30 12:33:20'),
(2348, 2, 'Hardik hat Ihre Terminanfrage angenommen.', '2019-10-30 12:33:20', '2019-10-30 12:33:20'),
(2349, 1, 'LP has sent you Date Request.', '2019-10-30 12:49:01', '2019-10-30 12:49:01'),
(2349, 2, 'LP hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 12:49:01', '2019-10-30 12:49:01'),
(2350, 1, 'Harryn has accepted your Date Request.', '2019-10-30 12:49:16', '2019-10-30 12:49:16'),
(2350, 2, 'Harryn hat Ihre Terminanfrage angenommen.', '2019-10-30 12:49:16', '2019-10-30 12:49:16'),
(2351, 1, 'LP has sent you Date Request.', '2019-10-30 13:07:41', '2019-10-30 13:07:41'),
(2351, 2, 'LP hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 13:07:41', '2019-10-30 13:07:41'),
(2352, 1, 'rahul has accepted your Date Request.', '2019-10-30 13:13:18', '2019-10-30 13:13:18'),
(2352, 2, 'rahul hat Ihre Terminanfrage angenommen.', '2019-10-30 13:13:18', '2019-10-30 13:13:18'),
(2353, 1, 'manish015 has sent you Date Request.', '2019-10-30 13:48:43', '2019-10-30 13:48:43'),
(2353, 2, 'manish015 hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 13:48:43', '2019-10-30 13:48:43'),
(2354, 1, 'LP has accepted your Date Request.', '2019-10-30 13:48:56', '2019-10-30 13:48:56'),
(2354, 2, 'LP hat Ihre Terminanfrage angenommen.', '2019-10-30 13:48:56', '2019-10-30 13:48:56'),
(2355, 1, 'manish015 has sent you Date Request.', '2019-10-30 14:00:00', '2019-10-30 14:00:00'),
(2355, 2, 'manish015 hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 14:00:00', '2019-10-30 14:00:00'),
(2356, 1, 'XT has accepted your Date Request.', '2019-10-30 14:00:08', '2019-10-30 14:00:08'),
(2356, 2, 'XT hat Ihre Terminanfrage angenommen.', '2019-10-30 14:00:08', '2019-10-30 14:00:08'),
(2357, 1, 'manish015 has sent you Date Request.', '2019-10-30 14:10:55', '2019-10-30 14:10:55'),
(2357, 2, 'manish015 hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 14:10:55', '2019-10-30 14:10:55'),
(2358, 1, 'Hardik has accepted your Date Request.', '2019-10-30 14:11:09', '2019-10-30 14:11:09'),
(2358, 2, 'Hardik hat Ihre Terminanfrage angenommen.', '2019-10-30 14:11:09', '2019-10-30 14:11:09'),
(2359, 1, 'manish015 has sent you Date Request.', '2019-10-30 14:16:34', '2019-10-30 14:16:34'),
(2359, 2, 'manish015 hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 14:16:34', '2019-10-30 14:16:34'),
(2360, 1, 'new tester has accepted your Date Request.', '2019-10-30 14:16:50', '2019-10-30 14:16:50'),
(2360, 2, 'new tester hat Ihre Terminanfrage angenommen.', '2019-10-30 14:16:50', '2019-10-30 14:16:50'),
(2361, 1, 'harry test new has sent you Date Request.', '2019-10-30 14:20:11', '2019-10-30 14:20:11'),
(2361, 2, 'harry test new hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 14:20:11', '2019-10-30 14:20:11'),
(2362, 1, 'manish015 has accepted your Date Request.', '2019-10-30 14:20:24', '2019-10-30 14:20:24'),
(2362, 2, 'manish015 hat Ihre Terminanfrage angenommen.', '2019-10-30 14:20:24', '2019-10-30 14:20:24'),
(2363, 1, 'Micheal Johns has sent you Connect Request', '2019-10-30 14:25:23', '2019-10-30 14:25:23'),
(2363, 2, 'Micheal Johns hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-30 14:25:23', '2019-10-30 14:25:23'),
(2364, 1, 'harry test new accepted a connect request.', '2019-10-30 14:25:32', '2019-10-30 14:25:32'),
(2364, 2, 'harry test new hat eine Verbindungsanforderung angenommen.', '2019-10-30 14:25:32', '2019-10-30 14:25:32');

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
('002feaea7b2a38323d5e53302df74f9e208944a984e9296ac1aa089fa59e614c2bc71967d171880f', 368, 1, 'user', '[]', 0, '2019-10-30 05:55:17', '2019-10-30 05:55:17', '2020-10-30 05:55:17'),
('013e017ed2cf5e754fd3750a2709be2dc9a68f105aecc684049c2d455f59d53213d6b0c7b834c920', 375, 1, 'user', '[]', 1, '2019-10-29 06:50:05', '2019-10-29 06:50:05', '2020-10-29 06:50:05'),
('017d2c239e6c7383e8b2c80aabbc102c70dea4bcb1e3f2a16c0bca7c121e9962d3c7fd52e0eefa93', 389, 1, 'user', '[]', 0, '2019-10-30 07:44:55', '2019-10-30 07:44:55', '2020-10-30 07:44:55'),
('03360317098600055e579bbf40778b818e19a15236763c5ef2c73a31bd0b287e30a5c42eed6fa5db', 416, 1, 'user', '[]', 0, '2019-10-30 14:19:34', '2019-10-30 14:19:34', '2020-10-30 14:19:34'),
('03e7fe013407065c19e564e8f9faeed3e46878f2bbc3e15d611ade46f38f49d1d19b6f8aeb5033a9', 402, 1, 'user', '[]', 0, '2019-10-30 10:01:26', '2019-10-30 10:01:26', '2020-10-30 10:01:26'),
('04667ebf83e5155e5d75db4d4e25a96bf4048f2978b2e61f09d76b94317855fc33223849f900e1e2', 393, 1, 'user', '[]', 0, '2019-10-30 07:49:52', '2019-10-30 07:49:52', '2020-10-30 07:49:52'),
('04b17ef23eea84a5b4d062389600d0e3c55962a4820097b819149b24f30f951d1bb52a8ef4fe8002', 404, 1, 'user', '[]', 1, '2019-10-30 13:13:05', '2019-10-30 13:13:05', '2020-10-30 13:13:05'),
('0565d29b2122bfc32317a52400a7582104a796e3a5cd7ab414bc08e0c2afbf46aa42369468724c4d', 376, 1, 'user', '[]', 0, '2019-10-29 07:03:43', '2019-10-29 07:03:43', '2020-10-29 07:03:43'),
('069d19588f1109e6affebc90d8d98d61663febd23f1aa61c37f20ec56fc42e0012ca314df4b2141a', 393, 1, 'user', '[]', 1, '2019-10-30 08:49:15', '2019-10-30 08:49:15', '2020-10-30 08:49:15'),
('06bfe58b99fc32bcaa940271c02f298b81bea5fb5adab3d7ccac072b1aa51daeb1631345f82cf4fd', 375, 1, 'user', '[]', 1, '2019-10-29 12:57:03', '2019-10-29 12:57:03', '2020-10-29 12:57:03'),
('06df61f99887d4e4b98a26d931b5b3c945d413f503d13ca5d967f53b834c547d2ad0b76ce609dc46', 377, 1, 'user', '[]', 1, '2019-10-29 09:24:08', '2019-10-29 09:24:08', '2020-10-29 09:24:08'),
('07dee858e4f5c211f9ad01a36b1cc1c35be179615036ef1ed3c88c53869bbb504a5e4f6ba8359c43', 404, 1, 'user', '[]', 0, '2019-10-30 10:00:12', '2019-10-30 10:00:12', '2020-10-30 10:00:12'),
('09926f1d31ce55e12633e721983fcd1ddc4d1666f1741aa512747ee9a6411d3207758fac78c1b498', 396, 1, 'user', '[]', 0, '2019-10-30 09:02:24', '2019-10-30 09:02:24', '2020-10-30 09:02:24'),
('0a686f18fbf3b363490814a8a8a0b7cb60a507f990b951217b5d6e13dfc274364950e15c0e303a2f', 403, 1, 'user', '[]', 1, '2019-10-30 10:03:57', '2019-10-30 10:03:57', '2020-10-30 10:03:57'),
('0affe30f495d878d2f5810eef5e8b66042d0b140b359a868e2ca7f826eab281db81cf3d567e60dc1', 410, 1, 'user', '[]', 1, '2019-10-30 13:01:50', '2019-10-30 13:01:50', '2020-10-30 13:01:50'),
('0be0522ed0ba914f70d1f99f11181df990a60a7a884bfa8dadd40b4f3daf15ba15e397397e63bec7', 404, 1, 'user', '[]', 0, '2019-10-30 12:45:43', '2019-10-30 12:45:43', '2020-10-30 12:45:43'),
('0c01ac39a71d819bc210fd9a6f7a45b39dc6ce5b59ad09a09b4aa1fe1b688288732ab372b6ba9ecd', 404, 1, 'user', '[]', 0, '2019-10-30 12:27:03', '2019-10-30 12:27:03', '2020-10-30 12:27:03'),
('0d9ae05050c5039e4ec62d47a04f5d32f6499e08d08feeacb9503a38114e2bf40612524828a57820', 404, 1, 'user', '[]', 1, '2019-10-30 13:00:35', '2019-10-30 13:00:35', '2020-10-30 13:00:35'),
('0e6535219bedfc4dd2774a85e67ffe61563c3dc127fcaf198549636d5883afdb25a906020172527f', 404, 1, 'user', '[]', 1, '2019-10-30 10:55:31', '2019-10-30 10:55:31', '2020-10-30 10:55:31'),
('1010aafcf27bab0ac86d83d148ee27a53c5e52a1eb2ad5abad6a3e6f0286b2161e79a350a10664bc', 409, 1, 'user', '[]', 1, '2019-10-30 13:02:07', '2019-10-30 13:02:07', '2020-10-30 13:02:07'),
('13895a4edb9de9aa3cfef64638007e0bcf69488c91b00b1f92ecfc6169629c8436546363e23dc1ee', 329, 1, 'user', '[]', 0, '2019-10-25 05:39:56', '2019-10-25 05:39:56', '2020-10-25 05:39:56'),
('140063cf17b15a391ec4bd3b7dabd5366366d5e362c9621f07b9fd5fc13b0ba835aa47d878fbce89', 404, 1, 'user', '[]', 0, '2019-10-30 12:59:07', '2019-10-30 12:59:07', '2020-10-30 12:59:07'),
('171931197d1a3167fd6dee73aa6c23f9a38108b277da589b4ace7cf25eb5063ab95174fedf9683e2', 340, 1, 'user', '[]', 1, '2019-10-25 08:08:00', '2019-10-25 08:08:00', '2020-10-25 08:08:00'),
('173b2e0d9d89cd232c75f93a186ae44b0e50bed446fde3d129f417cf4ba394215634ede5ab88e016', 329, 1, 'user', '[]', 0, '2019-10-25 06:47:42', '2019-10-25 06:47:42', '2020-10-25 06:47:42'),
('177d77328a4d5bb28d5272231d5821c783eab64c05a5834f28c80df4fb4e9aa881e2b09e0441629a', 406, 1, 'user', '[]', 1, '2019-10-30 11:06:19', '2019-10-30 11:06:19', '2020-10-30 11:06:19'),
('180cd51bc6c8d743e8414ca16eedc1c9013a649c44e1dd8a4b0714b422d7500b26770dd21733e7f0', 387, 1, 'user', '[]', 1, '2019-10-30 06:52:57', '2019-10-30 06:52:57', '2020-10-30 06:52:57'),
('18615a8eb879b7dafcbc71d0170bf87b9d71e9934f0fe289c617aa0a9242aeb2e76b441caa9c09ed', 389, 1, 'user', '[]', 0, '2019-10-30 07:13:32', '2019-10-30 07:13:32', '2020-10-30 07:13:32'),
('1958217a2e7963e682c71e21d853354c1491566ff8ed46bd0d44b31130a1fb1f445b47322ac53bbd', 375, 1, 'user', '[]', 1, '2019-10-30 05:38:22', '2019-10-30 05:38:22', '2020-10-30 05:38:22'),
('1a8053075e6130522ad0b25ba705c4a7d814a6e9f7c9397ece1f5d4c7631086a30f69df2895b2a43', 368, 1, 'user', '[]', 1, '2019-10-30 07:54:06', '2019-10-30 07:54:06', '2020-10-30 07:54:06'),
('1aabf740240edc48620cb9b482718a6e647ea1e74293eec038c930feda3b49fe66315ac0330debcf', 375, 1, 'user', '[]', 0, '2019-10-29 06:49:53', '2019-10-29 06:49:53', '2020-10-29 06:49:53'),
('1c8ba8aa89a12cefe05e5d8d1384435f04067522cd5c76ebf6e08116af62f9768a0d183e67cda150', 341, 1, 'user', '[]', 0, '2019-10-25 08:26:15', '2019-10-25 08:26:15', '2020-10-25 08:26:15'),
('1e34df318a385278d6e32a6498563ad0386bfa2960f9fac2e06a9556aed08b7817b1e3105586dc3b', 398, 1, 'user', '[]', 0, '2019-10-30 09:06:12', '2019-10-30 09:06:12', '2020-10-30 09:06:12'),
('1fd04e2b46d11580f615954cf136d4b15e72ea212c09648908f36efce041b453c4620d52b67872b7', 407, 1, 'user', '[]', 1, '2019-10-30 12:32:09', '2019-10-30 12:32:09', '2020-10-30 12:32:09'),
('20a99fc278e4f747f660221e7c3e60537f355d2db797317ade25f5d27ecf4b992d6e54bb8198fe0b', 389, 1, 'user', '[]', 0, '2019-10-30 07:37:17', '2019-10-30 07:37:17', '2020-10-30 07:37:17'),
('2139deb4cde9223163994d847bbd5804bfe168569b6fb23f6b6974bd8f7f2e1ce1bfd997973d22f4', 404, 1, 'user', '[]', 1, '2019-10-30 13:22:20', '2019-10-30 13:22:20', '2020-10-30 13:22:20'),
('23181cf4408bc71f1694930ad0333e14d47debcd700ab29bb6dd029b9fb6ba7713daad8ca7ee654f', 335, 1, 'user', '[]', 0, '2019-10-25 06:50:45', '2019-10-25 06:50:45', '2020-10-25 06:50:45'),
('274eb3dae54827d3af595393af46765d18b2d304245b47342cdf2aba77f4e2c2c7ef855e0151b5e8', 405, 1, 'user', '[]', 0, '2019-10-30 10:31:50', '2019-10-30 10:31:50', '2020-10-30 10:31:50'),
('281039465f540921e2e0fd58f81f5ba1515c7151d50dec4dba517ecdab035a05309491dd393525e3', 385, 1, 'user', '[]', 0, '2019-10-30 05:54:24', '2019-10-30 05:54:24', '2020-10-30 05:54:24'),
('290c69f236d29223b842b76a257efe9f3195ec58bff48cbadb9a3ef5ae02ddc9ba58c6eb69832464', 329, 1, 'user', '[]', 1, '2019-10-30 13:24:20', '2019-10-30 13:24:20', '2020-10-30 13:24:20'),
('2a5df124000a8af702189f7e9b29ef4b748a8f5aa9a3b060bacaff2a9822b7e3539d0ccf2421d49f', 368, 1, 'user', '[]', 0, '2019-10-30 13:38:48', '2019-10-30 13:38:48', '2020-10-30 13:38:48'),
('2b48a7bf3165f7ecbceca72b1b79c5367e05bee36c399e842773de89a30466eec61e0fe1fea49ea5', 375, 1, 'user', '[]', 0, '2019-10-29 13:37:46', '2019-10-29 13:37:46', '2020-10-29 13:37:46'),
('2b59d9e69dd4225d0b5b7c66b5926c3be55089d34225e084dde44365f7151a342b4f331e81e99231', 336, 1, 'user', '[]', 0, '2019-10-25 06:54:26', '2019-10-25 06:54:26', '2020-10-25 06:54:26'),
('2cdcfe07928b5c009fdb3abf5600392d625f01f1e48455ac8074082088fd69200aec681bfb95c84d', 397, 1, 'user', '[]', 1, '2019-10-30 09:10:46', '2019-10-30 09:10:46', '2020-10-30 09:10:46'),
('2cf665ae2bd1444a09e46bc3ec26a5943049f7fc90172a34a9a8005f0ceb492d97ae31f2cef914fb', 377, 1, 'user', '[]', 0, '2019-10-29 09:23:38', '2019-10-29 09:23:38', '2020-10-29 09:23:38'),
('2eb20a5040e51fc51f0640bbdf1f51d1588fa6c70c1843e10401033c3320c98d8fb148caaad684be', 368, 1, 'user', '[]', 1, '2019-10-29 09:36:29', '2019-10-29 09:36:29', '2020-10-29 09:36:29'),
('2fa23ad9dfda3373c890b1eb39cae52035222583728b9a94a7301e9d34c24ec0ce19de961f4efb0c', 397, 1, 'user', '[]', 1, '2019-10-30 09:05:42', '2019-10-30 09:05:42', '2020-10-30 09:05:42'),
('318873999ec7a20d914ae3df3e727f0b08804f5bb1411d66374f8ac6b57734fb5cb4a2ab63bcf0a5', 400, 1, 'user', '[]', 0, '2019-10-30 09:40:54', '2019-10-30 09:40:54', '2020-10-30 09:40:54'),
('31e11ad824997bf8601039770e235a51ed2b6a05b8f635de9f91bc7c4f20b47a42094a989cd75960', 407, 1, 'user', '[]', 0, '2019-10-30 12:31:53', '2019-10-30 12:31:53', '2020-10-30 12:31:53'),
('3209547ad43b7fd8c5eb823a816bdd1b1dede93ca9076d9615184609fb202fffad6c76befd6f9f73', 386, 1, 'user', '[]', 1, '2019-10-30 11:13:12', '2019-10-30 11:13:12', '2020-10-30 11:13:12'),
('327dd49b6f2b5a52089ba1c73d2e48e424ba9cf0b6b61a0f53f22030d4a6fd38bfab409b001fc797', 329, 1, 'user', '[]', 1, '2019-10-25 05:40:46', '2019-10-25 05:40:46', '2020-10-25 05:40:46'),
('361763cd644bb120501d7caf8e0c81fdb7e76412ae6f4ba8dacdc52b08713f0890f9220ba9601aa1', 389, 1, 'user', '[]', 0, '2019-10-30 07:11:28', '2019-10-30 07:11:28', '2020-10-30 07:11:28'),
('363db5098181e0c050872e8ad9bb7809f4d1b6bfe5c32dd4547970ac6468bbf3c562e06f27c99d9f', 368, 1, 'user', '[]', 1, '2019-10-29 13:09:16', '2019-10-29 13:09:16', '2020-10-29 13:09:16'),
('39593568d540d353d2789b143978d52c45c083995eb92704fb88ed6cf6efd0aded429d1f9361c465', 404, 1, 'user', '[]', 1, '2019-10-30 12:42:38', '2019-10-30 12:42:38', '2020-10-30 12:42:38'),
('3a83fea4fd853c71158503e2657c2661d4fc71f2faabf887b11f82afb49885230a343fc92c6bd5c0', 329, 1, 'user', '[]', 1, '2019-10-30 06:36:44', '2019-10-30 06:36:44', '2020-10-30 06:36:44'),
('3aec081d440309707c1bd452669e5cba0cc8858516e6226d5948bbfd2b88f718789348f06b471639', 336, 1, 'user', '[]', 1, '2019-10-25 06:54:56', '2019-10-25 06:54:56', '2020-10-25 06:54:56'),
('3b213893dc5d206046626fcba1993ca177784e8dfb8192b0c2d6f2a7a23e625e533627b5a16707aa', 389, 1, 'user', '[]', 0, '2019-10-30 07:33:15', '2019-10-30 07:33:15', '2020-10-30 07:33:15'),
('3c516f020e301e64e25c3e3cbf2b6d305af4134b861b99190b4dd49ab11b80b50c8e1bf18b944d9a', 368, 1, 'user', '[]', 0, '2019-10-30 07:45:43', '2019-10-30 07:45:43', '2020-10-30 07:45:43'),
('4083848ae607bcb182ba8ff3506a1606b582d9ea6ce0c86abc84ba48ae9ff572ae6a72ab3236143a', 404, 1, 'user', '[]', 1, '2019-10-30 11:03:25', '2019-10-30 11:03:25', '2020-10-30 11:03:25'),
('413881131ff1bdc850fd876ba865580f120adc5b4ac0b51c08eea73fcf88da772f782a39f4b874d7', 375, 1, 'user', '[]', 0, '2019-10-30 07:50:36', '2019-10-30 07:50:36', '2020-10-30 07:50:36'),
('4304fb5f2664e22bfe88f5947fc6f30cb6808d1c207037fa76eb58cf45bfd916fdf1fa5505b39cc5', 396, 1, 'user', '[]', 0, '2019-10-30 12:44:52', '2019-10-30 12:44:52', '2020-10-30 12:44:52'),
('440725378e9240c7fc360998a69c8f6c40b83e9a4b170898d8aa4973de8d6a065154b64eca675af6', 389, 1, 'user', '[]', 0, '2019-10-30 07:12:07', '2019-10-30 07:12:07', '2020-10-30 07:12:07'),
('4541d63f111dd29306988f08c897b3e493585bb02ed14fa6140bbcd73ad778daa2837107a9a6faf8', 368, 1, 'user', '[]', 1, '2019-10-30 09:48:10', '2019-10-30 09:48:10', '2020-10-30 09:48:10'),
('4663408aff79f5a1958d952d489b1d85e4a0679b7df34b57f9751e771d74de5a0ab94c0e09e310eb', 389, 1, 'user', '[]', 0, '2019-10-30 07:33:58', '2019-10-30 07:33:58', '2020-10-30 07:33:58'),
('4722ceaa95f6125f16e7f65ddbd761b26aad7257b89645425cd28fa088d8a7948173ff6f06873f07', 329, 1, 'user', '[]', 1, '2019-10-30 06:52:56', '2019-10-30 06:52:56', '2020-10-30 06:52:56'),
('4790fef59414b40a86f44edf873c882d07e80d9fd53a6be201e63f1c9f283acc4a1cf6fcd8b53a81', 329, 1, 'user', '[]', 1, '2019-10-30 07:25:38', '2019-10-30 07:25:38', '2020-10-30 07:25:38'),
('489554d041cfbddbff64265d424543e6b89b55e109d36cf550299e4ef46cc17e19700fbb606a3799', 337, 1, 'user', '[]', 0, '2019-10-25 06:56:31', '2019-10-25 06:56:31', '2020-10-25 06:56:31'),
('49313b854dc024b3f5b625b8d08965ac375196c4e5e7516066a9a99a309567a1d5c006125ff944be', 404, 1, 'user', '[]', 1, '2019-10-30 10:52:01', '2019-10-30 10:52:01', '2020-10-30 10:52:01'),
('4af53cfe123defcd1e77aeb78f6d0af1b499a7d47bf14fad7fbf95bdf855ac5639232f35087b7d4b', 388, 1, 'user', '[]', 0, '2019-10-30 07:05:53', '2019-10-30 07:05:53', '2020-10-30 07:05:53'),
('4b6f6fe08ab8f4e3f999ca8f4a6c4f87319f1fca4b54ea881706bbe62463b77e437f26824d2114f9', 329, 1, 'user', '[]', 1, '2019-10-30 08:50:05', '2019-10-30 08:50:05', '2020-10-30 08:50:05'),
('4c5422653aa4ac50dc2dba3dfc5c987226dd4a7d6de0a45ec781aff9743350b0a3ce1e5f400ca826', 329, 1, 'user', '[]', 1, '2019-10-30 07:29:50', '2019-10-30 07:29:50', '2020-10-30 07:29:50'),
('4e3526cb61c41fe92cb858aebfc04964db3c04403a44b7d813987783c26d36dd57047b07d3cdd25d', 375, 1, 'user', '[]', 0, '2019-10-29 13:43:03', '2019-10-29 13:43:03', '2020-10-29 13:43:03'),
('4e55827aff22ed58a6377f1f992c9a4872e65ffdb70af746e28639a1f0f8ffe9a0fa78ce9dc08b5d', 376, 1, 'user', '[]', 0, '2019-10-29 07:03:58', '2019-10-29 07:03:58', '2020-10-29 07:03:58'),
('4e6503c5cbee8121edff8629bdf085b91f91dc2b69390d2843f77ae0eca321fb8dfeaf7ed385577b', 397, 1, 'user', '[]', 0, '2019-10-30 09:04:12', '2019-10-30 09:04:12', '2020-10-30 09:04:12'),
('5007fc8b48d364e92e5ac1b516ace5b4146831b113cc9e8eefb25360f12dd1e55e21a36b7a44b8d8', 368, 1, 'user', '[]', 0, '2019-10-30 05:56:33', '2019-10-30 05:56:33', '2020-10-30 05:56:33'),
('504788759b89c58c9bbc632a69a6515f57309c95706c6197f698f58227889d24f8069a49e371f752', 341, 1, 'user', '[]', 1, '2019-10-30 09:15:16', '2019-10-30 09:15:16', '2020-10-30 09:15:16'),
('5196465183d560b9ca4d226d017247f4d34931440321b5acbdfec36a876250d5359936d1eb464b81', 368, 1, 'user', '[]', 0, '2019-10-30 07:45:54', '2019-10-30 07:45:54', '2020-10-30 07:45:54'),
('5253ed4cbf8d0a58f297d6ecbe0b235f72dbc4f2f9406bc2904ee0652e99d7df219ff55fb376d5f7', 389, 1, 'user', '[]', 0, '2019-10-30 07:06:53', '2019-10-30 07:06:53', '2020-10-30 07:06:53'),
('5357a7d4fc03a1783dfb356bc7656d5df4be83a8348caa8a61cb4a2976f772ea5cd8da9676b1ffbe', 389, 1, 'user', '[]', 0, '2019-10-30 07:44:49', '2019-10-30 07:44:49', '2020-10-30 07:44:49'),
('54d973bcac2f55204e94682eb5248dedc88d47fcb71e91bc280ca5ba481da4db850e752041fdd6c0', 413, 1, 'user', '[]', 0, '2019-10-30 14:08:34', '2019-10-30 14:08:34', '2020-10-30 14:08:34'),
('5584f722eb5157d9cf9af48452a7e0679d45f42a7d4510a925f316b7e1a4e987675a358ac17769d5', 375, 1, 'user', '[]', 1, '2019-10-29 13:25:34', '2019-10-29 13:25:34', '2020-10-29 13:25:34'),
('56390e0ce6e4da8b0f51f52c904d7fa454249bd28d90a5dad4122fde2c3dc56d73137d355d020461', 404, 1, 'user', '[]', 1, '2019-10-30 12:59:51', '2019-10-30 12:59:51', '2020-10-30 12:59:51'),
('57c8f8a5281bc29afc4983c24d8d1c2a1584e182aa7c5a78b28d56ebbd99ec5d517e88390519ccf6', 391, 1, 'user', '[]', 0, '2019-10-30 07:45:40', '2019-10-30 07:45:40', '2020-10-30 07:45:40'),
('58035c57d8d57bd402823978b6a2c499efdd01296f7ad0f47c22c4eee1810fbb2ea63ab7e96ab594', 402, 1, 'user', '[]', 0, '2019-10-30 09:47:00', '2019-10-30 09:47:00', '2020-10-30 09:47:00'),
('5accd018a4b4aef97902b5e6f0b9f4c54c912383fbe82652b4b77245ba628bbd0c32e9098d84ff43', 374, 1, 'user', '[]', 0, '2019-10-29 06:45:32', '2019-10-29 06:45:32', '2020-10-29 06:45:32'),
('5c840b97dae514b3aaf919ba5ec79410e864c0797df2ee03a33ac12b22076cd568336d620a58ea2e', 388, 1, 'user', '[]', 0, '2019-10-30 07:05:20', '2019-10-30 07:05:20', '2020-10-30 07:05:20'),
('5e9628ce5e23993412bfadff255bed40a20b1706e8f3d6e1a35752f130d6b55f7117683decedb5e6', 402, 1, 'user', '[]', 1, '2019-10-30 09:47:45', '2019-10-30 09:47:45', '2020-10-30 09:47:45'),
('5fb3e9195d3cf307bfda4995191d9b5bd571f34e2ce4b57be3adfaa3cda975ee66f0d3f2e160da29', 375, 1, 'user', '[]', 0, '2019-10-29 06:49:36', '2019-10-29 06:49:36', '2020-10-29 06:49:36'),
('5fcc54fdbd40061fe96161e898e4efecb753e26015afcaf3c71cbd91a34ca77dafe3d19d9127f4b6', 331, 1, 'user', '[]', 0, '2019-10-25 05:46:39', '2019-10-25 05:46:39', '2020-10-25 05:46:39'),
('60d04c3b93ee1ee52eb6f0673c98a35f142aa6231bf2eb12b431e87e541469db1d07618696f4b686', 368, 1, 'user', '[]', 0, '2019-10-30 13:38:49', '2019-10-30 13:38:49', '2020-10-30 13:38:49'),
('615c091025a8dabd5a694b90ab7a5a2b25bb5d7de622ff8931703112f6d7fd0452564373af85b6d9', 368, 1, 'user', '[]', 1, '2019-10-30 05:00:51', '2019-10-30 05:00:51', '2020-10-30 05:00:51'),
('6460eccfcdc994bb492839d3443a193e13b69ca0de71417adc4f1d4debd148a845d579ab929e4916', 396, 1, 'user', '[]', 0, '2019-10-30 09:02:47', '2019-10-30 09:02:47', '2020-10-30 09:02:47'),
('656eb08de9a6d1c9d89829a1a2da72366204236104b5199954a5517c5c7d9f8e47d12bc8eed799e4', 340, 1, 'user', '[]', 0, '2019-10-25 08:07:09', '2019-10-25 08:07:09', '2020-10-25 08:07:09'),
('671d858154cff234c62e872dd11fd28168b4be014d5fa6b73545e18d648ad0560e55ad5df0c21224', 375, 1, 'user', '[]', 1, '2019-10-29 09:09:45', '2019-10-29 09:09:45', '2020-10-29 09:09:45'),
('677c90868fc44d48665c56a617f2b117c3bbf00e136641a7ecfeab8e959e099ed011a865d4a92a05', 376, 1, 'user', '[]', 1, '2019-10-29 13:05:08', '2019-10-29 13:05:08', '2020-10-29 13:05:08'),
('67f88eef80bfd959fca036aa223fa54c777fee004d4d46f4500628cc6dcd37e1c5e2674891a42af2', 374, 1, 'user', '[]', 0, '2019-10-29 06:45:08', '2019-10-29 06:45:08', '2020-10-29 06:45:08'),
('684a29e70901e4c65ee53c08a1d293361f4104d2a7b965682d036e8c9c0e97ce4c20b1722225fb47', 374, 1, 'user', '[]', 1, '2019-10-30 07:39:07', '2019-10-30 07:39:07', '2020-10-30 07:39:07'),
('68cd9dd2cfc8a05c1f7e1476e870cb8c46042a2689cc753c5c0a8a33e525c7685d841ebd612a7784', 389, 1, 'user', '[]', 0, '2019-10-30 07:08:56', '2019-10-30 07:08:56', '2020-10-30 07:08:56'),
('690848564cac899f040d01850e08c1db590b32576782f3f76ebb77ea3eacadc7b89b499b2a7f4831', 389, 1, 'user', '[]', 0, '2019-10-30 07:31:23', '2019-10-30 07:31:23', '2020-10-30 07:31:23'),
('6908798cf10208e085bf103e25c59c3d6410594801dbaa43f13b6d20101cd6c24e9e3d023009a86e', 411, 1, 'user', '[]', 0, '2019-10-30 13:59:13', '2019-10-30 13:59:13', '2020-10-30 13:59:13'),
('6c387e9bd7d03044f0dfb8524ea97e0e7d923ccb3e8e71ad8fb801afcf01f78cfafda96a18d7ae70', 389, 1, 'user', '[]', 0, '2019-10-30 07:45:07', '2019-10-30 07:45:07', '2020-10-30 07:45:07'),
('6d0b4afad79b81779fb9f8cf652fbfa05c321b492abc782a11c5a6c5d1312f97b82585f2546dd7ff', 415, 1, 'user', '[]', 0, '2019-10-30 14:14:40', '2019-10-30 14:14:40', '2020-10-30 14:14:40'),
('6fa1365b09beb9c75a4992b8af8b5f09c23fa1c6563753179f8733f1e31fe32da6b29e966fa45316', 330, 1, 'user', '[]', 0, '2019-10-25 05:43:28', '2019-10-25 05:43:28', '2020-10-25 05:43:28'),
('6fa1d8dffb32da02e6f7d449e32c3494ec8a31e0d21663f906d1c184479282f00b02c3bdb085680a', 368, 1, 'user', '[]', 1, '2019-10-30 07:09:07', '2019-10-30 07:09:07', '2020-10-30 07:09:07'),
('712a48bbc7ef1ef9543edf36a5b985596b3722a7e92373c88341fc633b1aeceda9800b353394a732', 341, 1, 'user', '[]', 1, '2019-10-25 08:22:42', '2019-10-25 08:22:42', '2020-10-25 08:22:42'),
('71e96caee7e76f6599c811b760a619589e349181129e854674e62cf23b8861d32cf053b883e72e42', 396, 1, 'user', '[]', 1, '2019-10-30 09:09:03', '2019-10-30 09:09:03', '2020-10-30 09:09:03'),
('7319571724bd6f21d90b5daa0444e604f20396e9de3e20d42651227e4ed1190c1251ade5f9598984', 404, 1, 'user', '[]', 0, '2019-10-30 12:26:53', '2019-10-30 12:26:53', '2020-10-30 12:26:53'),
('736523efe8658141f9080a60ceeb003fec3335595345e0ba072d541eb88e914b940f82f489d18faa', 375, 1, 'user', '[]', 0, '2019-10-29 13:36:30', '2019-10-29 13:36:30', '2020-10-29 13:36:30'),
('74192f995b51663c5f7032753e605efa6b45eea8f0ebc38fdb4ff42cf0ce32753a9a72dae2b3a3cf', 401, 1, 'user', '[]', 1, '2019-10-30 09:43:39', '2019-10-30 09:43:39', '2020-10-30 09:43:39'),
('7639bcd520106e407e521eb2ec4492b03fcedc9871166e8dfc635861905bb60021218475e3401598', 333, 1, 'user', '[]', 1, '2019-10-25 06:04:00', '2019-10-25 06:04:00', '2020-10-25 06:04:00'),
('779a5b62582385d2113caeb1cf4822c0968cc7d70109d2d25b9922d9b52e666540379dd6a11dc105', 397, 1, 'user', '[]', 0, '2019-10-30 09:05:16', '2019-10-30 09:05:16', '2020-10-30 09:05:16'),
('79fc81be0d6a2bf61eb562dc292ef0663bbd3fb80ab1cfae55ace33a422773c379ff9d5351a79b82', 368, 1, 'user', '[]', 0, '2019-10-30 04:48:37', '2019-10-30 04:48:37', '2020-10-30 04:48:37'),
('7a8d48ae57ddd4ba0654a0183e3a553c8616a7ec05d4a88da431edaf46bd6cfb3973d857502d23f3', 334, 1, 'user', '[]', 0, '2019-10-25 06:28:49', '2019-10-25 06:28:49', '2020-10-25 06:28:49'),
('7d105199b1a041ed37cf3437efa2bdcc26dc60b8b2c8c27de9bacc7be773594c4d35679c8b8d9dfa', 390, 1, 'user', '[]', 0, '2019-10-30 07:44:57', '2019-10-30 07:44:57', '2020-10-30 07:44:57'),
('7e178c8db6102f05373362a3554e8784809876ce03231c2c650cec6dcc54461c1109131d60ae5c73', 376, 1, 'user', '[]', 1, '2019-10-29 07:04:40', '2019-10-29 07:04:40', '2020-10-29 07:04:40'),
('7eb0aa5f7f45689af2335fe35ca2237f6ec0fe6f7be68af5a5afc92b74d3ccd57f6faf4e515021d1', 407, 1, 'user', '[]', 1, '2019-10-30 13:57:53', '2019-10-30 13:57:53', '2020-10-30 13:57:53'),
('812d565268951926c0f22dffbc6ee16f8358d68d2de65b3be9330a3ea1f8c063c7980b5dbab3f81c', 410, 1, 'user', '[]', 0, '2019-10-30 13:01:05', '2019-10-30 13:01:05', '2020-10-30 13:01:05'),
('816fca329bec73a1abd4703301c31ff8219486362af05a211702d4126e216eba72a6984c8abf86b9', 329, 1, 'user', '[]', 1, '2019-10-30 05:55:03', '2019-10-30 05:55:03', '2020-10-30 05:55:03'),
('850612a1068cc03b5591541ed5b024a82de3e78bdf4a8c7c503f87ad34d871d6cd73ae7c6cc1bf7c', 375, 1, 'user', '[]', 0, '2019-10-30 09:46:12', '2019-10-30 09:46:12', '2020-10-30 09:46:12'),
('8558320d4c08172e96a51ce3d621a66a42622c22e9c99dacc9b09eb1622c93c573e8cc86c7a7aa83', 368, 1, 'user', '[]', 0, '2019-10-29 10:03:02', '2019-10-29 10:03:02', '2020-10-29 10:03:02'),
('864a038d63d206bffa3592917b332283f5e0517de72104a83f59620a87634fc3740d2de5e7f3dcd4', 398, 1, 'user', '[]', 0, '2019-10-30 09:06:32', '2019-10-30 09:06:32', '2020-10-30 09:06:32'),
('885f7da8c331bc36cf4a913c3f0fca80dfd19d04d8062872afa9b0cedd56672497041ce4adf0d115', 398, 1, 'user', '[]', 1, '2019-10-30 11:11:20', '2019-10-30 11:11:20', '2020-10-30 11:11:20'),
('892bac738359e516dc100a31a82465e15f9287a4d5e3fbf761852504dd90ed516fa879a75340ec1f', 409, 1, 'user', '[]', 1, '2019-10-30 13:17:22', '2019-10-30 13:17:22', '2020-10-30 13:17:22'),
('8efa9e359c8fc9502a73af48afd181c5fdddbfd169f489191416d19921ab2798854e26b6ef7cb418', 332, 1, 'user', '[]', 0, '2019-10-25 05:49:43', '2019-10-25 05:49:43', '2020-10-25 05:49:43'),
('8f32d5ed49e7fdcc19434172ff8f77fe729f54e80d135e4fbb6730359505b15b203c8308814ab11d', 389, 1, 'user', '[]', 0, '2019-10-30 07:36:53', '2019-10-30 07:36:53', '2020-10-30 07:36:53'),
('90d485f797757ad1efa107501a747b989e0c148e68b19568494667bfe447f03ed8a7ba823a0ee59f', 404, 1, 'user', '[]', 0, '2019-10-30 12:46:10', '2019-10-30 12:46:10', '2020-10-30 12:46:10'),
('91719154783652df46378a39143e9d8941a6753bdbc17bba19b070c2161e2222ca532dd04257eb4c', 368, 1, 'user', '[]', 0, '2019-10-30 04:44:44', '2019-10-30 04:44:44', '2020-10-30 04:44:44'),
('91d82acf5ce3c8224d437bf16f6b39de4dc2c56b7275b7c709fd0d81201af004717d0052fea10508', 385, 1, 'user', '[]', 0, '2019-10-30 05:54:04', '2019-10-30 05:54:04', '2020-10-30 05:54:04'),
('91f0601d236914484a018426a39c0e0fa38955c48f14bbac6f0ecc9bc63bf59b0a5b1244c0062e43', 329, 1, 'user', '[]', 1, '2019-10-30 06:38:26', '2019-10-30 06:38:26', '2020-10-30 06:38:26'),
('93e37f9fe60c30bb91498718fcc3a1aae43480f6b1f8df64810b06a8aed0439fa22afd25266c8912', 398, 1, 'user', '[]', 1, '2019-10-30 12:33:15', '2019-10-30 12:33:15', '2020-10-30 12:33:15'),
('93e3d437771bca9902ac01134d320e654e52eefc42fb0e6d47ba94c1f0cfa92ae1e4c46ba28ea55e', 377, 1, 'user', '[]', 0, '2019-10-29 09:23:56', '2019-10-29 09:23:56', '2020-10-29 09:23:56'),
('9414eb80525ebe8dcc3036e481a61a048efe61774013231bead237e6d9f2f4396287544cc64abe4c', 368, 1, 'user', '[]', 1, '2019-10-30 04:46:23', '2019-10-30 04:46:23', '2020-10-30 04:46:23'),
('955b9aac59c5c9ffa0d826edb56c5aed765233be1140c879d751d9c9163e9e88ca26bb51777689e1', 387, 1, 'user', '[]', 0, '2019-10-30 06:52:06', '2019-10-30 06:52:06', '2020-10-30 06:52:06'),
('95bf327e735f4d29ecaaaab9cd21504c622b891c0d6696cc9c85385d05489ab8eaaef3e4b6017f24', 410, 1, 'user', '[]', 0, '2019-10-30 13:02:14', '2019-10-30 13:02:14', '2020-10-30 13:02:14'),
('969682e6f7b2649f2e99565b5bab6f5d30acaa8ef76b0bf13b8112c991d4ba213ef5839f6d205911', 331, 1, 'user', '[]', 1, '2019-10-25 05:47:45', '2019-10-25 05:47:45', '2020-10-25 05:47:45'),
('9749de377d5ef75fb387a515ae3140bbfbcff263acce7deb11ba416629b2c247d949ad70517506dd', 338, 1, 'user', '[]', 0, '2019-10-25 06:58:43', '2019-10-25 06:58:43', '2020-10-25 06:58:43'),
('999efe31b6871f70b12bf0b391419c2d76564d9128dd0fb91ee3233172a011259c0c5c8f0b9bab0e', 385, 1, 'user', '[]', 1, '2019-10-30 05:54:32', '2019-10-30 05:54:32', '2020-10-30 05:54:32'),
('9aa95ea08fcad2cfd5f3522cbd00766213191117a9a06af717b4b6882e39d7b865a192b78bd9bc3f', 338, 1, 'user', '[]', 1, '2019-10-25 06:59:53', '2019-10-25 06:59:53', '2020-10-25 06:59:53'),
('9c19cd936fa294cf5a5ab7b4a7321aa7d4ee6d26266bb4f3521e9892d974d4f3d4f4478ee5d3b4f9', 389, 1, 'user', '[]', 0, '2019-10-30 07:07:09', '2019-10-30 07:07:09', '2020-10-30 07:07:09'),
('9eb809da1cbfce9b431bbe8d566fe3bb4dfd08e07a36244fe1de3daee202b494122d0acdc374ece5', 386, 1, 'user', '[]', 0, '2019-10-30 06:48:02', '2019-10-30 06:48:02', '2020-10-30 06:48:02'),
('9fa7349e0d74e940170717cf1fd4db748de830064a5247532baf5d83728dfc5868188a83478727a1', 375, 1, 'user', '[]', 1, '2019-10-29 13:31:27', '2019-10-29 13:31:27', '2020-10-29 13:31:27'),
('a2c3d4e2b55c27d8dcf45d97f901900a03d0406b839f580ba0ae2d2ac956e8182d2e4beb635ecf95', 398, 1, 'user', '[]', 1, '2019-10-30 09:06:38', '2019-10-30 09:06:38', '2020-10-30 09:06:38'),
('a3c9f5cedb74f2c6bc67fb3cad6de3666eb2a454007aa7888a48ea7792d00a206f416f6cd1639ef4', 389, 1, 'user', '[]', 0, '2019-10-30 07:09:18', '2019-10-30 07:09:18', '2020-10-30 07:09:18'),
('a6a3cdff1df6fed40dff885cbdc3efe3cf93ee26f12686dd79a6f62d6e87b472168705614e448417', 390, 1, 'user', '[]', 0, '2019-10-30 07:45:56', '2019-10-30 07:45:56', '2020-10-30 07:45:56'),
('a7e645c812f68292f525cfb20161f0c6c540a46579c1166a350e4c70503a87ecce5098dddc336ff1', 330, 1, 'user', '[]', 1, '2019-10-25 05:44:33', '2019-10-25 05:44:33', '2020-10-25 05:44:33'),
('ab425e21d8dd8bb2f31526d3331ff7cea83638fa1cffa291e19ca82b144ec2d0323e6c2795352794', 391, 1, 'user', '[]', 0, '2019-10-30 07:46:45', '2019-10-30 07:46:45', '2020-10-30 07:46:45'),
('abfc2ac419a73a597ac3f2dd00ba38a1a32a6a898bfeffc8d7d2d9c3bcc35be0bab16e6d9dadb7a3', 376, 1, 'user', '[]', 1, '2019-10-29 13:28:16', '2019-10-29 13:28:16', '2020-10-29 13:28:16'),
('acec245e5141e29d4f3e81f346c5c9a1f40b9fae4d515cc8dc1e5a5f1842a5cbed3bbea3e582814d', 335, 1, 'user', '[]', 0, '2019-10-25 06:50:01', '2019-10-25 06:50:01', '2020-10-25 06:50:01'),
('b1f07baec5712b83799188ea5ed70701f43851044f1b50dfd81d77409750599a8de245bbe502df71', 368, 1, 'user', '[]', 0, '2019-10-29 05:58:27', '2019-10-29 05:58:27', '2020-10-29 05:58:27'),
('b20603a06c18e65a6496cbde3dc0cc34a926314bcb25add8bed4fbc7f128819b1c042793372d8174', 341, 1, 'user', '[]', 0, '2019-10-25 08:21:23', '2019-10-25 08:21:23', '2020-10-25 08:21:23'),
('b316e9eb16f0e611b683a184e0172705d1fd4f9b72237fe580b8d908478796becd0313721bb1acc4', 368, 1, 'user', '[]', 1, '2019-10-30 05:32:17', '2019-10-30 05:32:17', '2020-10-30 05:32:17'),
('b73fe52c206e934b42aa8d23d9fe0c68a78c3a3257877bdfea27532424d6cdd865602c87e72cce6d', 391, 1, 'user', '[]', 0, '2019-10-30 07:45:29', '2019-10-30 07:45:29', '2020-10-30 07:45:29'),
('b9ac3546547695c36af5cdbddc2f2a50512e5e6c76754f4210dc72ef6f2dd95e2cb099f1bb9c2b9d', 403, 1, 'user', '[]', 1, '2019-10-30 09:54:01', '2019-10-30 09:54:01', '2020-10-30 09:54:01'),
('ba157293ce67898b35808473a64f0ee74c4e6a372f69900f0a626a4d34bc5837925815f5b174d7bf', 407, 1, 'user', '[]', 0, '2019-10-30 12:31:28', '2019-10-30 12:31:28', '2020-10-30 12:31:28'),
('babe6e86400704dd8178ded2d5f59eba071ea9b20fc9028a2a9f71aef63f2dbd62b79ec910574f4b', 409, 1, 'user', '[]', 1, '2019-10-30 12:48:27', '2019-10-30 12:48:27', '2020-10-30 12:48:27'),
('bc41f4b68d91470f1e82e1ee0916da195f89b211ef878d2b6c3946e9e0f4ca8504177565b53638d4', 403, 1, 'user', '[]', 0, '2019-10-30 09:53:14', '2019-10-30 09:53:14', '2020-10-30 09:53:14'),
('bf7d752a636f9bcfe777ec70767f7599f44cb506747627ca5d12cbc39dbf250cb89791ae45f41d70', 396, 1, 'user', '[]', 1, '2019-10-30 09:02:55', '2019-10-30 09:02:55', '2020-10-30 09:02:55'),
('c2722473e9945eb8e6094adea856daf9b67a21baa222c758dd8059ec0376eea8841f9613e7b29883', 413, 1, 'user', '[]', 1, '2019-10-30 14:10:01', '2019-10-30 14:10:01', '2020-10-30 14:10:01'),
('c4dd54d3fe4e75811161e9377bbd200a90eeea68ee4118eaa60eb7a26b660e73963b8cb3afef4173', 409, 1, 'user', '[]', 1, '2019-10-30 13:47:53', '2019-10-30 13:47:53', '2020-10-30 13:47:53'),
('c592b9ea3305125dc2d22b8b32cd2ab03a6c51f1911de51814d7e93e720f5673dc980a06aeaeda8a', 409, 1, 'user', '[]', 1, '2019-10-30 13:50:48', '2019-10-30 13:50:48', '2020-10-30 13:50:48'),
('c6cf988c0194d1f26ccd07d6939ff7d23911857f5eafb32565a6f7071544183c1d7be4f843c39fde', 368, 1, 'user', '[]', 0, '2019-10-30 12:27:37', '2019-10-30 12:27:37', '2020-10-30 12:27:37'),
('c7a60399e2f192b6e87006be1284fd9ce8a97dfa3d4e324aa6462ce6b7f2d2e1eeb8b39ae5c057be', 404, 1, 'user', '[]', 1, '2019-10-30 10:00:53', '2019-10-30 10:00:53', '2020-10-30 10:00:53'),
('c97801a3f42c99c7feaa5d9b5ce34cf766b60a7a117ae04e1a6f90458e0a6785c2e5c0a77ba1b22a', 329, 1, 'user', '[]', 1, '2019-10-25 05:55:57', '2019-10-25 05:55:57', '2020-10-25 05:55:57'),
('ca5015fb5f574342b7d1043f53fa9d3062dd35f8ab439340b9f4828f4282eff6b92090a262e3f60a', 401, 1, 'user', '[]', 0, '2019-10-30 09:41:55', '2019-10-30 09:41:55', '2020-10-30 09:41:55'),
('cb654d9822fb02f2306472859b57cdbcbd87d954a593062f8f6a717c61e8f4e8d9b4f3d1635e1e61', 335, 1, 'user', '[]', 0, '2019-10-25 06:45:01', '2019-10-25 06:45:01', '2020-10-25 06:45:01'),
('ccb784388c739f10b68f1242a4cd5f128801efcb4a1384d35d645bf21d1d0a53221ec3f1afb86eda', 376, 1, 'user', '[]', 1, '2019-10-30 07:51:03', '2019-10-30 07:51:03', '2020-10-30 07:51:03'),
('cd9a42a1882a45aad056f8b8f8d41a319423cf092125b1236361181312098f23c8cb07ee204cb9c4', 386, 1, 'user', '[]', 1, '2019-10-30 06:49:10', '2019-10-30 06:49:10', '2020-10-30 06:49:10'),
('d079c26cf8d3c9984685739af450363fc78dd7f4efca6e47e7795202a116b4b7dcd06e9af78f5359', 404, 1, 'user', '[]', 1, '2019-10-30 10:40:57', '2019-10-30 10:40:57', '2020-10-30 10:40:57'),
('d5af6c967bccff59c19ea6e75efbb4d19a260998d884bfd662385cbdc6dd08ba669d2b8548254b0b', 398, 1, 'user', '[]', 1, '2019-10-30 09:11:06', '2019-10-30 09:11:06', '2020-10-30 09:11:06'),
('d5f761d0da805b98675257ab89cb046f02443ef16fcb85fa1e708e3e05b0138e99506d484c65e913', 341, 1, 'user', '[]', 0, '2019-10-30 10:22:12', '2019-10-30 10:22:12', '2020-10-30 10:22:12'),
('d8c0cc2f160eefe2522afa6f52254d4e159b504d24ac5cae157b8808f4b9b2a5da176522c65eb3de', 368, 1, 'user', '[]', 0, '2019-10-29 05:57:44', '2019-10-29 05:57:44', '2020-10-29 05:57:44'),
('d97eea063527fae40ffedc03189b43c9b705bde99ae4c8220b807379d0263f35677a5f134486ca4b', 405, 1, 'user', '[]', 0, '2019-10-30 10:31:57', '2019-10-30 10:31:57', '2020-10-30 10:31:57'),
('d995f688154518ef4d26de2507b812151332ca43fc0efd2e1611b4acbb6885e649e706857c213963', 416, 1, 'user', '[]', 0, '2019-10-30 14:18:59', '2019-10-30 14:18:59', '2020-10-30 14:18:59'),
('dad302235b118529aa0b50ccd085e6840ee1ed4a4062c120eb31a3b5bdfa0b419833b4a1641c4a9a', 333, 1, 'user', '[]', 0, '2019-10-25 06:01:21', '2019-10-25 06:01:21', '2020-10-25 06:01:21'),
('db7aa8c3cd36b27b54f9d3dc572e6409d14f4fde62c9d1a446c2320d52c97b9d0bf50da5b1c2b467', 368, 1, 'user', '[]', 0, '2019-10-29 10:32:31', '2019-10-29 10:32:31', '2020-10-29 10:32:31'),
('dd8a12aac1bbbdfe3521ba52227a99914cd0b4461ea325b81a9a3148e6d109d09922cb38cd804f29', 413, 1, 'user', '[]', 0, '2019-10-30 14:09:50', '2019-10-30 14:09:50', '2020-10-30 14:09:50'),
('deade571a7d0d1178a88d50634b08b8f550b989b675189ecd1f76bb64a303101530f009e0d020746', 393, 1, 'user', '[]', 1, '2019-10-30 07:50:20', '2019-10-30 07:50:20', '2020-10-30 07:50:20'),
('e01627cb3454c5f9db640302701595b020a29d491ec209606f174da545e81828d7a115900cc79ef3', 368, 1, 'user', '[]', 0, '2019-10-30 12:37:06', '2019-10-30 12:37:06', '2020-10-30 12:37:06'),
('e14781df353aa0124717b58f8b4d2fe518b90fe18c7d3459d1bac88a536ddfa28927d8dbde6e4c2e', 388, 1, 'user', '[]', 0, '2019-10-30 07:06:45', '2019-10-30 07:06:45', '2020-10-30 07:06:45'),
('e1be947586aeb661725ab15735861334b25667e5c470ab5127a135aefb172ded71714de20a15068a', 404, 1, 'user', '[]', 0, '2019-10-30 12:27:26', '2019-10-30 12:27:26', '2020-10-30 12:27:26'),
('e413ffc5684582db76a6f9a33baf279fd9d7f42b8ef80c03637dc037aa5dce381923a0b7e822a9c4', 334, 1, 'user', '[]', 1, '2019-10-25 06:30:06', '2019-10-25 06:30:06', '2020-10-25 06:30:06'),
('e495a9795828b94e2eac748265b17a7d0f4cd3f1e1b82e4bf97379a3982ff42f2fbb7672a083c6d1', 409, 1, 'user', '[]', 0, '2019-10-30 12:47:54', '2019-10-30 12:47:54', '2020-10-30 12:47:54'),
('e61bd15c23dca62ea0254ae0ea3cbce52aa0385d1dca73d35f092e6d8677c593afe292716c318604', 341, 1, 'user', '[]', 0, '2019-10-25 08:22:23', '2019-10-25 08:22:23', '2020-10-25 08:22:23'),
('e870bc1e0f02c3e992226423b000c1e254b6a1cdc17cf0c89d55c335b69cee8a0a42ac7f4c8014c5', 329, 1, 'user', '[]', 1, '2019-10-30 07:10:09', '2019-10-30 07:10:09', '2020-10-30 07:10:09'),
('ece194c482f24f2d9d9842c18901a7bb137fa669d64f8260552bc86dbed3319c825da6b76ee0d12b', 374, 1, 'user', '[]', 0, '2019-10-29 06:45:23', '2019-10-29 06:45:23', '2020-10-29 06:45:23'),
('ee6e18ca889dd462179bd5767b05ad3c12a28f57fa12ac69824bcd9fe2380f64c2675d75ae800879', 368, 1, 'user', '[]', 0, '2019-10-30 12:30:41', '2019-10-30 12:30:41', '2020-10-30 12:30:41'),
('ef837997b91a92df7573b80fee7bb93771a5da18c1314ca2cb1164417e45bf3efa67b68572afc357', 389, 1, 'user', '[]', 0, '2019-10-30 07:13:49', '2019-10-30 07:13:49', '2020-10-30 07:13:49'),
('f0402bdde0f169e6ecb1bd67cd8f698c049200ffd65b14cf90149a5dd1a26307be5c418ac06d81e0', 389, 1, 'user', '[]', 0, '2019-10-30 07:34:43', '2019-10-30 07:34:43', '2020-10-30 07:34:43'),
('f1eaff8cbe5b8c06cf3cd3de1a2492c4bcc21936eac1f829cfa453cb6064f6a2151bcbc6b8b9d4a9', 406, 1, 'user', '[]', 0, '2019-10-30 11:05:36', '2019-10-30 11:05:36', '2020-10-30 11:05:36'),
('f325955b94a93882ce165a11c2c06a39dea3e5039fea7e7e678290db7af98b2356867ae1fda083d0', 387, 1, 'user', '[]', 1, '2019-10-30 13:14:49', '2019-10-30 13:14:49', '2020-10-30 13:14:49'),
('f62e6e8ee5c2a29b7a724f9248ba328226c66f73ad3fee8c5c56a9a50afede9cef28d6ff50448004', 405, 1, 'user', '[]', 0, '2019-10-30 10:31:30', '2019-10-30 10:31:30', '2020-10-30 10:31:30'),
('f68f92e7194ff57b1542c291b9cd64bdcd75ca9d1b93ecbcbc4e8c95c933a9ee61bc85a2a4e170a1', 368, 1, 'user', '[]', 0, '2019-10-30 09:43:58', '2019-10-30 09:43:58', '2020-10-30 09:43:58'),
('f6eeb6617a04b4dceb31a7db0bf327d482b6f29ee1e3a0673e3eb66d507c9075ac8ca3e6cde6773e', 387, 1, 'user', '[]', 1, '2019-10-30 06:54:12', '2019-10-30 06:54:12', '2020-10-30 06:54:12'),
('f93492a1c8ee17dd77efec3ce2567f571c89f9c89fa7800ad901bc55a5f65108cee74c99c807bece', 387, 1, 'user', '[]', 1, '2019-10-30 13:53:15', '2019-10-30 13:53:15', '2020-10-30 13:53:15'),
('f990cf64ceb759ff815f8e2d3b9f6cab0d9a4a871a8a70218ffcf4d695f1790fe8023a43c11f7a23', 411, 1, 'user', '[]', 1, '2019-10-30 13:59:42', '2019-10-30 13:59:42', '2020-10-30 13:59:42'),
('f995e02e3438a0dc961ad0573ba66ce86a6f1cf60005ae521e144fc56eabb970d6db9e841c7a8924', 333, 1, 'user', '[]', 0, '2019-10-26 05:39:41', '2019-10-26 05:39:41', '2020-10-26 05:39:41'),
('f9b351fa7f6cebfdfe0d271342bfc6ffff88822a7eb35aa0fd009ffba00dadf47e6f54df4dbea0ff', 415, 1, 'user', '[]', 1, '2019-10-30 14:15:19', '2019-10-30 14:15:19', '2020-10-30 14:15:19'),
('fad4d23f8aa6c8bdf8336d8ff6fa6f1fe8e0a93148075f2f68a475dd4cddc0e0c941c024b770b535', 339, 1, 'user', '[]', 0, '2019-10-30 04:21:12', '2019-10-30 04:21:12', '2020-10-30 04:21:12'),
('faea3168b432df242e58763333f51016a05eeaf1d53cd6f5e856f9d16d214b1262b96919fbcf6cef', 404, 1, 'user', '[]', 0, '2019-10-30 12:56:02', '2019-10-30 12:56:02', '2020-10-30 12:56:02'),
('fd4cd7129e8c21e1a4674dc8ebd6c9aff708507fe6d484e6b11cf3d6780fa99e03322b79e8cff1c0', 368, 1, 'user', '[]', 0, '2019-10-30 13:23:51', '2019-10-30 13:23:51', '2020-10-30 13:23:51'),
('fd6876f7cf44dbc4f277bcacd9d23f684539fbad6c9c9a6908c3a28a87b7fd0bc7597bb3884590a6', 393, 1, 'user', '[]', 1, '2019-10-30 07:54:43', '2019-10-30 07:54:43', '2020-10-30 07:54:43'),
('fde63e8e419fdfd2546fc802a7c9a4a7cfb21279078a95983bac66cdb628662ad0f83074f5083925', 398, 1, 'user', '[]', 1, '2019-10-30 10:17:10', '2019-10-30 10:17:10', '2020-10-30 10:17:10');

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
(114, 333, 'Okokokok', 'ok', NULL, 0, 1, '2019-10-25 06:12:52', '2019-10-25 06:12:52'),
(115, 329, 'heyy man', 'wohoooo', '1571984053.png', 0, 1, '2019-10-25 06:14:13', '2019-10-25 06:14:13'),
(118, 368, 'testing', 'cfdvgfd\ngd\'hjgjjhobfhnn gf\nnjgfojnb', NULL, 0, 1, '2019-10-29 05:59:22', '2019-10-29 05:59:22'),
(119, 375, 'testing', 'Vgghhhhb ccbcjch\nCjvjjv', NULL, 0, 1, '2019-10-29 06:50:28', '2019-10-29 06:50:28'),
(120, 368, 'testing', 'herer', '1572415092.jpeg', 1, 1, '2019-10-30 05:58:12', '2019-10-30 05:58:12'),
(121, 375, 'testing', 'Hhhhjjj\nJsjjddid\nNdjdjx', '1572415653.png', 0, 1, '2019-10-30 06:07:33', '2019-10-30 06:07:33'),
(122, 375, 'testing', NULL, '1572416155.png', 0, 1, '2019-10-30 06:15:55', '2019-10-30 06:15:55'),
(123, 375, 'testing without description', NULL, '1572416218.png', 0, 1, '2019-10-30 06:16:58', '2019-10-30 06:16:58'),
(124, 375, NULL, NULL, '1572417234.png', 0, 1, '2019-10-30 06:33:54', '2019-10-30 06:33:54'),
(125, 375, NULL, NULL, '1572417289.png', 0, 1, '2019-10-30 06:34:49', '2019-10-30 06:34:49'),
(126, 375, NULL, NULL, '1572417308.png', 0, 1, '2019-10-30 06:35:08', '2019-10-30 06:35:08'),
(127, 375, NULL, 'Hhhncncvj bbkb\nHlhhlhl', '1572417330.png', 0, 1, '2019-10-30 06:35:30', '2019-10-30 06:35:30'),
(128, 375, NULL, 'Jffjfj\nGvkvkv  jckv\nGkvk', '1572417476.png', 0, 1, '2019-10-30 06:37:56', '2019-10-30 06:37:56'),
(129, 375, 'ttutuut', NULL, '1572417801.png', 0, 1, '2019-10-30 06:43:21', '2019-10-30 06:43:21'),
(130, 375, 'testing with title', NULL, '1572417833.png', 0, 1, '2019-10-30 06:43:53', '2019-10-30 06:43:53'),
(131, 375, NULL, 'Hdhfffu\nJfjggj cjjjccj\nVkv', '1572417865.png', 0, 1, '2019-10-30 06:44:25', '2019-10-30 06:44:25'),
(132, 375, 'testing', 'Gggg', '1572417973.png', 0, 1, '2019-10-30 06:46:13', '2019-10-30 06:46:13'),
(133, 375, 'testing with title', NULL, '1572417999.png', 0, 1, '2019-10-30 06:46:39', '2019-10-30 06:46:39'),
(134, 375, 'testing with description', 'Cjfjfjfjfjftjjtj cfjfjfjf\nMvvmvmmv\nKfkkfkflvm\nCmckc', '1572418032.png', 0, 1, '2019-10-30 06:47:12', '2019-10-30 06:47:12'),
(135, 393, NULL, 'Description', '1572422132.png', 1, 1, '2019-10-30 07:55:32', '2019-10-30 07:55:32'),
(136, 393, 'nsnansbs', 'Shsjdj', '1572425631.png', 1, 1, '2019-10-30 08:53:51', '2019-10-30 08:53:51'),
(137, 398, 'hdjdjsks', 'Hdhdjdjd', '1572426505.png', 1, 1, '2019-10-30 09:08:25', '2019-10-30 09:08:25'),
(138, 341, 'NJLFSDJF', 'ASNL DFKSANFSD', '1572427075.png', 1, 1, '2019-10-30 09:17:55', '2019-10-30 09:17:55'),
(139, 376, 'title', 'G hhbvh\nH u u u ubjbbjbjbjjbbjnj', '1572427726.png', 0, 1, '2019-10-30 09:28:46', '2019-10-30 09:28:46'),
(140, 398, 'ddchh', 'Vhs', '1572433997.png', 1, 1, '2019-10-30 11:13:17', '2019-10-30 11:13:17'),
(141, 398, NULL, 'Description', '1572434085.png', 1, 1, '2019-10-30 11:14:45', '2019-10-30 11:14:45');

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
(113, 329, 'desert', 'sahara', 2, '1571985215.png', 'C-2-251, C-2 Block, Janakpuri, New Delhi, Delhi 110058, India', '28.620343799999997', '77.0824234', 0, '79.00', 1, '0', '2019-10-25 06:33:35', '2019-10-25 06:33:35'),
(114, 329, 'munivh', 'berlin', 2, '1571985304.png', 'Munich, Germany', '48.1351253', '11.5819805', 0, '100.00', 1, '0', '2019-10-25 06:35:04', '2019-10-25 06:35:04'),
(115, 334, 'test', 'let\'s have a party then', 2, '1571985489.png', 'Delhi, India', '28.686273800000006', '77.2217831', 0, '100.00', 1, '0', '2019-10-25 06:38:09', '2019-10-25 06:38:09'),
(116, 329, 'vjkkkk', 'jkk', 1, NULL, 'Kochi, Kerala, India', '9.9312328', '76.26730409999999', 0, '100.00', 1, '0', '2019-10-25 06:38:14', '2019-10-25 06:38:14'),
(117, 333, 'Gooo', 'let\'s gooo', 2, '1571985917.png', 'Munich, Germany', '48.1351253', '11.5819805', 0, '100.00', 1, '0', '2019-10-25 06:45:17', '2019-10-25 06:45:17'),
(118, 334, 'du geile huan', 'hey There', 2, '1571986103.png', 'Cancún, Quintana Roo, Mexico', '21.161908000000004', '-86.8515279', 0, '100.00', 1, '0', '2019-10-25 06:48:23', '2019-10-25 06:48:23'),
(119, 334, 'anonyme', 'there you go', 2, '1571986345.png', 'Cancún, Quintana Roo, Mexico', '21.161908000000004', '-86.8515279', 1, '100.00', 1, '0', '2019-10-25 06:52:25', '2019-10-25 06:52:25'),
(120, 336, 'Uhla', 'uhla', 2, '1571987334.png', 'Munich, Germany', '48.1351253', '11.5819805', 0, '100.00', 1, '0', '2019-10-25 07:08:54', '2019-10-25 07:08:54'),
(121, 341, 'JDSK FDSGASGs', 'S DGNDSFSGFJDL', 1, NULL, '20/19, Road Number 19, Central Government Staff Colony, Wadala West, Mumbai, 400031, Maharashtra, India', '19.0176147', '72.8561644', 1, '100.00', 1, '0', '2019-10-25 08:23:15', '2019-10-25 08:23:15'),
(122, 333, 'LovePush Launch 01.11.2019 🌍♥️', 'Who\'s in? 🌈\n\nJoin our international Community and connect in your area or around the world 👯', 2, '1572068606.png', 'Venado 8 #67, 20, 77500 Cancún, Q.R., Mexico', '21.154812500000013', '-86.82841796875', 0, '100.00', 1, '0', '2019-10-26 05:43:26', '2019-10-26 05:43:26'),
(123, 375, 'testing', 'Fffjfjfjffjfjgjg\nJggjgjgggkgjgkgjgkgk\nMhmhmhhhhhhhhhhmhmh\nMhmbmhmhmhmhmhmhmh', 1, '1572340863.png', '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Phase - I, Manimajra, Sukteri, Haryana 134114, India', '30.728067500000016', '76.84623828125004', 0, '0.00', 1, '0', '2019-10-29 09:21:03', '2019-10-29 09:21:03'),
(124, 375, 'titles', 'Ttutuut\nGkhkkkhhkhkhlhkhkb jvjvkvkvkv\nHkhkhkb hkh hlh h lhh l h  l h\nHhkhll h l hh hl', 1, '1572340927.png', '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Phase - I, Manimajra, Sukteri, Haryana 134114, India', '30.728077500000005', '76.84623828125004', 1, '53.00', 1, '0', '2019-10-29 09:22:07', '2019-10-29 09:22:07'),
(125, 377, 'titndjd', 'bsbbzs\nsnndndndnd ndjdjdd\ndnndkdkdd jdkdkd\ndnjdkdmd', 1, '1572341131.png', '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Phase - I, Manimajra, Sukteri, Haryana 134114, India', '30.72806250000002', '76.84625390625004', 0, '32.00', 1, '0', '2019-10-29 09:25:31', '2019-10-29 09:25:31'),
(126, 368, 'tshhssbdj', 'ndjdjdkd djfkkd\ndkfkfkfkfkjfkfkff jfdjjff\nfkkfkfkkfmff fkkff\nmfkfmfmf', 1, '1572341857.png', '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Phase - I, Manimajra, Sukteri, Haryana 134114, India', '30.728047500000013', '76.84625390625004', 0, '27.00', 1, '0', '2019-10-29 09:37:37', '2019-10-29 09:37:37'),
(127, 368, 'NHNSDF DS', 'DFGDSG SDGdfs', 1, '1572411304.png', '254, Balaram Babu Khedekar Marg, Wadala West, Mumbai, 400031, Maharashtra, India', '19.017915777195768', '72.85648978250092', 1, '100.00', 1, '0', '2019-10-30 04:55:04', '2019-10-30 04:55:04'),
(128, 329, 'HGDFJGSDFSG sdf', 'DSFGJKLDFSGNDFSGd', 1, NULL, '20/19, Road Number 19, Central Government Staff Colony, Wadala West, Mumbai, 400031, Maharashtra, India', '19.0176147', '72.8561644', 0, '100.00', 1, '0', '2019-10-30 05:56:10', '2019-10-30 05:56:10'),
(129, 375, 'texting', 'Cjcjfjfjf hvjvv\nJvvv', 1, '1572415199.png', '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Phase - I, Manimajra, Sukteri, Haryana 134114, India', '30.728087500000004', '76.84626953125004', 1, '56.00', 1, '0', '2019-10-30 05:59:59', '2019-10-30 05:59:59'),
(130, 375, 'delhi', 'Gghcjccj.', 1, '1572418538.png', 'Delhi, India', '28.686273800000006', '77.2217831', 0, '100.00', 1, '0', '2019-10-30 06:55:38', '2019-10-30 06:55:38'),
(131, 375, 'testing for birlin', 'Cjvjv vjvjvv\nVjvig\nVjg', 1, '1572420589.png', 'Berlin, Germany', '52.520006599999995', '13.404954', 0, '100.00', 1, '0', '2019-10-30 07:29:49', '2019-10-30 07:29:49'),
(132, 375, 'testing for Germany', 'Hfhffff jvjvvjvvj  j jj n vjjvjvj\nJvvjvkvk', 1, '1572420654.png', 'Berlin, Germany', '52.520006599999995', '13.404954', 0, '70.00', 1, '0', '2019-10-30 07:30:54', '2019-10-30 07:30:54'),
(133, 398, 'chhcvv', 'Vjvvjjv', 1, '1572426841.png', 'Grunerstraße, 10179 Berlin, Germany', '52.5176319', '13.4096574', 0, '100.00', 1, '0', '2019-10-30 09:14:01', '2019-10-30 09:14:01'),
(134, 398, 'jhfGGFGFF', 'BHGHjgg', 1, '1572431959.png', '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.621101379421187', '77.08193035803463', 1, '100.00', 1, '0', '2019-10-30 10:39:19', '2019-10-30 10:39:19'),
(135, 398, 'ggghhhh Aaaaa', 'Deerer', 1, '1572433003.png', 'Sansad Marg, Connaught Place, New Delhi, 110001, Delhi, India', '28.6269628', '77.2153959', 1, '100.00', 1, '0', '2019-10-30 10:56:43', '2019-10-30 10:56:43');

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
(70, 115, 333, 1, '2019-10-25 06:14:25', '2019-10-25 06:14:25'),
(71, 115, 334, 1, '2019-10-25 06:32:40', '2019-10-25 06:32:40'),
(72, 118, 368, 0, '2019-10-29 05:59:26', '2019-10-30 04:36:08'),
(73, 118, 375, 1, '2019-10-29 12:29:34', '2019-10-30 04:36:27'),
(74, 119, 368, 1, '2019-10-29 13:09:26', '2019-10-30 04:35:35'),
(75, 119, 375, 0, '2019-10-30 04:36:22', '2019-10-30 04:36:24'),
(76, 136, 329, 1, '2019-10-30 08:54:02', '2019-10-30 08:54:02'),
(77, 115, 393, 1, '2019-10-30 08:54:44', '2019-10-30 08:55:50'),
(78, 138, 341, 0, '2019-10-30 09:28:56', '2019-10-30 10:18:32'),
(79, 120, 376, 1, '2019-10-30 09:38:37', '2019-10-30 09:38:37'),
(80, 136, 398, 0, '2019-10-30 09:48:12', '2019-10-30 09:52:59'),
(81, 135, 398, 1, '2019-10-30 09:48:20', '2019-10-30 09:58:37'),
(82, 134, 368, 1, '2019-10-30 09:50:12', '2019-10-30 09:50:12'),
(83, 118, 402, 0, '2019-10-30 09:50:25', '2019-10-30 10:30:16'),
(84, 120, 402, 0, '2019-10-30 09:54:54', '2019-10-30 10:32:58'),
(85, 137, 341, 1, '2019-10-30 11:11:41', '2019-10-30 11:11:41');

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
(436, 361, '5db290f2a28f9a4487a9feaa', 1, '2019-10-25 06:07:20', '2019-10-25 06:07:20'),
(437, 362, '5db296a0a28f9a359ba9feaa', 1, '2019-10-25 06:31:06', '2019-10-25 06:31:06'),
(438, 363, '5db298e1a28f9a6762a9feac', 1, '2019-10-25 06:40:45', '2019-10-25 06:40:45'),
(439, 367, '5db3dc39a28f9a28cfa9fead', 1, '2019-10-26 05:40:17', '2019-10-26 05:40:17'),
(442, 371, '5db7e154a0eb472b9990c415', 1, '2019-10-29 06:51:10', '2019-10-29 06:51:10'),
(443, 372, '5db7e52da28f9a49d3a9feab', 1, '2019-10-29 07:07:30', '2019-10-29 07:07:30'),
(444, 374, '5db93784a28f9a11b9a9fead', 1, '2019-10-30 07:11:00', '2019-10-30 07:11:00'),
(445, 375, '5db94eeda0eb4728da90c416', 1, '2019-10-30 08:50:54', '2019-10-30 08:50:54'),
(447, 378, '5db95e0ca28f9a6581a9feaa', 1, '2019-10-30 09:58:10', '2019-10-30 09:58:10'),
(448, 379, '5db95fb2a0eb4740e890c417', 1, '2019-10-30 10:02:32', '2019-10-30 10:02:32'),
(451, 381, '5db98391a28f9a161ca9feab', 1, '2019-10-30 12:35:35', '2019-10-30 12:35:35');

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
(1, 'community_guidelines', 'Community Guidelines', '\n<p align=\"center\"><span style=\"color: #000000;\">Welcome to the LovePush Community! </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">In case you\'re straightforward, kind and aware to other people, you\'ll generally be welcome here. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">On the off chance that you decide not to be, you may not last. We will probably enable clients to convey what needs be uninhibitedly as long as it doesn\'t affront others. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Everybody is held to a similar standard on LovePush. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">We\'re requesting that you be chivalrous, think before you act, and comply with our locale rules both on and disconnected. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">You heard that right: your disconnected conduct can prompt end of your LovePush Account. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">The following is a rundown of our locale arrangements. In the event that you abuse any of these strategies, you may be restricted from LovePush. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Truly, don\'t make us Swipe Left on you&mdash;in light of the fact that there will be no second chances once we do. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">We energize you to&nbsp;report&nbsp;any conduct that damages our approaches. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Love Push isn\'t for: </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Nudity/Sexual Content</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">We\'re not requesting that you brush your hair to the other side or even talk in full sentences; however please keep it tasteful and suitable for open utilization. No nakedness, no explicitly unequivocal substance, and don\'t narrative the majority of your sexual wants in your profile. Keep it clean. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Harassment</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Try not to draw in, or urge others to connect with, in any focused on maltreatment or badgering against some other client. This incorporates sending any spontaneous sexual substance to your matches. Reports of stalking, dangers, tormenting, or terrorizing, are paid attention to very. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Violence and Physical Harm</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">We don\'t endure vicious, realistic, or violent substance on Love Push, or any activities or substance that supporter for or undermine brutality of any kind, including compromising or advancing fear based oppression. Physical strike, intimidation, and any demonstrations of brutality are carefully denied. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Content that supporters for or extols suicide or self-hurt is additionally not permitted. In these circumstances, we may find a way to help the client, incorporating connecting with emergency assets. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Hate Speech</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Any substance that advances, advocates for, or overlooks prejudice, dogmatism, scorn, or brutality against people or gatherings dependent on variables like (yet not restricted to) race, ethnicity, strict alliance, handicap, sex, age, national inception, sexual direction, or sex character isn\'t permitted. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Private Information</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Don\'t openly communicate any private data, yours or anybody else\'s. This incorporates standardized savings numbers, travel papers, passwords, money related data or unlisted contact data, for example, telephone numbers, email addresses, home/place of business. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Spam</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Try not to be phony. Be genuine. Try not to utilize Love Push to drive individuals to outside sites by means of a connection or something else. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Promotion or Solicitation</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Requesting different clients is precluded on Love Push. It\'s fine to welcome your matches to something that you\'re doing, yet on the off chance that the motivation behind your profile is to publicize your occasion or business, non-benefit, political crusade, challenge, or to lead explore, we may erase your record. While we\'re energized that you\'re doing a parody appear one week from now, kindly don\'t utilize Love Push to advance it. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Prostitution and Trafficking</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Advancing or pushing for business sexual administrations, human dealing or other non-consensual sexual acts is carefully disallowed and will bring about your record being prohibited from Love Push. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Scamming</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Love Push has a zero-resistance arrangement on savage conduct of any sort. Anybody endeavoring to get other clients\' private data for false or criminal behavior might be restricted. Any client found sharing their very own budgetary record data (PayPal, Venmo, and so forth.) to get cash from different clients may likewise be prohibited from Love Push. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Impersonation</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Act naturally! Try not to claim to be another person. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Try not to mimic, or generally distort alliance, association or relationship with, any individual or element. This incorporates farce accounts. While we think your Mike Pence profile is diverting, you aren\'t Mike Pence. What\'s more, on the off chance that you are, what are you doing on Love Push? </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Minors</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">You should be 18 years old or more established to utilize Love Push. In that capacity, we don\'t permit pictures of unaccompanied minors. On the off chance that you need to post photographs of your youngsters, if it\'s not too much trouble ensure that you are in the photograph also. On the off chance that you see a profile that incorporates an unaccompanied minor, urges damage to a minor, or delineates a minor in a sexual or intriguing manner, if it\'s not too much trouble report it right away. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Copyright and Trademark Infringement</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">On the off chance that it\'s not yours, don\'t post it. On the off chance that your Love Push profile incorporates any work that is copyrighted or trademarked by others, don\'t show it, except if you are permitted to do as such. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Illegal Usage</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Try not to utilize Love Push to do anything illicit. In the event that it\'s illicit IRL, it\'s unlawful on Love Push. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>One Person, One Account</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Love Push records can\'t have different proprietors, so don\'t make a record with your companion or noteworthy other. Furthermore, kindly don\'t keep up different Love Push accounts. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>Third Party Apps</strong></span></span></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">The utilization of any applications made by anybody other than Love Push that guarantee to offer our administration or open extraordinary Love Push highlights (like auto-swipers) isn\'t permitted. </span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\"><strong><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\">Account Dormancy</span></span></strong></strong></span></p>\n\n<p align=\"center\"><span style=\"color: #000000;\">Love Push is enjoyable to utilize... constantly! Use Love Push at the lake, use Love Push while eating cake. Use Love Push when you\'re out, use Love Push if all else fails! In any case, on the off chance that you don\'t sign in to your Love Push account in 2 years, we may erase your record for inertia.</span></p>', '2019-09-04 14:50:10', '2019-09-04 14:50:10'),
(2, 'legacy', 'Legacy', '<p align=\"left\"><span style=\"color: #000000;\">In this Privacy Policy, we define how we collect, use and handle your information when you submit them to us via our Services.</span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>INFORMATION COLLECTED AND HOW WE USE SUCH INFORMATION</strong></span></span></strong></span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\">We obtain and use the under listed information to provide, enhance and \r\nprotect our Services: </span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Your Personal Information:</strong> This service is a landing page for Love-Push, \r\nwhere we may collect user\'s email addresses and other information as requested. </span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Device information:</strong> We may also collect information from and about the devices you use to access and use the Services. This may include details such as IP address, the type of device and browser you use, the web page(s) you visited before coming to our sites, and the unique device identifier. Your \r\ntools (depending on their settings) may also transmit your location information to the Services. </span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Cookies and other technologies:</strong> We may use technologies like cookies, \r\nweb beacons, etc. to provide, enhance, support, protect, and promote our Services. </span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\">You can still also set your browser not to accept cookies, but this may limit \r\nyour ability to use the Services to the fullest. </span></p>\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Bases for processing your information:</strong> We collect and use the personal information and all other information you submit to us as described above to provide you the Services most securely and reliably. We also use your details for or legitimate business needs. If we process your details for any other reason not stated herein, we will seek your approval before the time; we will also mandate our service providers to do likewise. For more information about the bases for processing your details, please contact us. </span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>INFORMATION SHARING</strong></span></span></strong></span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\">Since we will not sell, rent or give your information to advertisers or other third \r\nparties, we may decide to share your information as described below: </span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Our relevant service providers:</strong> Love-Push makes use of some trusted service providers (for instance, for customer support) These service providers will have access to your information for the singular purpose of performing their duties to Love-Push in agreement with this Privacy Policy. We will remain liable for the service provider\'s handling and management of any of the information they access through our service. For the list of the service providers which we use to process your personal information, please contact us.</span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong>Law, Order and the general interest of the public:</strong> We may disclose or \r\nshare your information with a third party if we find out that such disclosure or \r\nsharing is essential and necessary to:</span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\">i. to conform with any applicable rule, regulation or law;</span></p>\r\n<p align=\"left\"><span style=\"color: #000000;\">ii. prevent death or serious personal injury;</span></p>\r\n<p align=\"left\"><span style=\"color: #000000;\">iii. prevent illegal or unsanctioned transactions of Love-Push or our Users;</span></p>\r\n<p align=\"left\"><span style=\"color: #000000;\">iv. secure Love-Push\'s intellectual property rights, interest or safety; or</span></p>\r\n<p align=\"left\"><span style=\"color: #000000;\">v. carry out a task in the benefit of the general public</span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>DATA PROTECTION</strong></span></span></strong></span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\">No data on the internet can be guaranteed as secure or safe. We strive to safeguard information but are unable to ensure and cannot warrant the security of any data which you share on the platform or transmit to us. You understand that any information transmitted, submitted or posted on our platform is done at your own risk. Nevertheless, we will take reasonable steps to ensure the security information on our Service.</span></p>\r\n\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\"><strong><span style=\"font-family: proxima-nova, \'Helvetica Neue\', helvetica, sans-serif;\"><span style=\"font-size: large;\"><strong>CHANGES TO THIS PRIVACY POLICY</strong></span></span></strong></span></p>\r\n\r\n<p align=\"left\"><span style=\"color: #000000;\">If there is a chance that we are involved in a merger, acquisition, reorganization, or sale of our assets, your information may be transferred as part of the deal. We will promptly notify you via the email associated with your account/profile of any such occurrence and outline your choices to you. This Privacy Policy is subject to change frequently. We will post the most recent version on our Site. If the version materially reduces your rights, we will send a notification to you.</span></p>', '2019-09-04 14:50:10', '2019-09-04 14:50:10');

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
(2811, 200, 1),
(2812, 200, 2),
(2813, 200, 3),
(2814, 200, 4),
(2815, 200, 5),
(2816, 200, 6),
(2817, 200, 7),
(2818, 200, 13),
(2819, 201, 1),
(2836, 204, 1),
(2837, 205, 1),
(2838, 205, 2),
(2839, 205, 3),
(2840, 205, 4),
(2841, 205, 5),
(2842, 205, 6),
(2843, 205, 7),
(2844, 205, 13),
(2845, 206, 1),
(2846, 206, 2),
(2847, 206, 3),
(2848, 206, 4),
(2849, 206, 5),
(2850, 206, 6),
(2851, 206, 7),
(2852, 206, 13);

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
(4544, 2811, 1),
(4545, 2812, 5),
(4546, 2813, 9),
(4547, 2814, 14),
(4548, 2815, 18),
(4549, 2816, 24),
(4550, 2817, 31),
(4551, 2817, 33),
(4552, 2818, 67),
(4553, 2819, 2),
(4570, 2836, 2),
(4571, 2837, 1),
(4572, 2837, 2),
(4573, 2838, 5),
(4574, 2839, 10),
(4575, 2840, 14),
(4576, 2841, 18),
(4577, 2841, 17),
(4578, 2842, 22),
(4579, 2842, 23),
(4580, 2843, 30),
(4581, 2843, 31),
(4582, 2843, 32),
(4583, 2844, 65),
(4584, 2844, 66),
(4585, 2844, 67),
(4586, 2845, 3),
(4587, 2846, 5),
(4588, 2847, 10),
(4589, 2848, 14),
(4590, 2849, 18),
(4591, 2850, 24),
(4592, 2851, 32),
(4593, 2852, 67);

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
(19, 205, 200, 2837, 2811, '0.00', '0.00', '0.00'),
(20, 205, 200, 2838, 2812, '0.00', '0.00', '0.00'),
(21, 205, 200, 2839, 2813, '5.00', '20.00', '5.00'),
(22, 205, 200, 2840, 2814, '20.00', '20.00', '20.00'),
(23, 205, 200, 2841, 2815, '40.00', '80.00', '40.00'),
(24, 205, 200, 2842, 2816, '5.00', '40.00', '5.00'),
(25, 205, 200, 2843, 2817, '25.00', '40.00', '25.00'),
(26, 205, 200, 2844, 2818, '20.00', '60.00', '20.00'),
(27, 205, 201, 2837, 2819, '0.00', '0.00', '0.00'),
(28, 205, 204, 2837, 2836, '0.00', '0.00', '0.00'),
(29, 206, 200, 2845, 2811, '0.00', '0.00', '0.00'),
(30, 206, 200, 2846, 2812, '0.00', '0.00', '0.00'),
(31, 206, 200, 2847, 2813, '5.00', '20.00', '5.00'),
(32, 206, 200, 2848, 2814, '20.00', '20.00', '20.00'),
(33, 206, 200, 2849, 2815, '40.00', '80.00', '40.00'),
(34, 206, 200, 2850, 2816, '20.00', '40.00', '20.00'),
(35, 206, 200, 2851, 2817, '10.00', '40.00', '10.00'),
(36, 206, 200, 2852, 2818, '20.00', '60.00', '20.00'),
(37, 206, 201, 2845, 2819, '0.00', '0.00', '0.00'),
(38, 206, 204, 2845, 2836, '0.00', '0.00', '0.00'),
(39, 206, 205, 2845, 2837, '0.00', '0.00', '0.00'),
(40, 206, 205, 2846, 2838, '0.00', '0.00', '0.00'),
(41, 206, 205, 2847, 2839, '20.00', '20.00', '20.00'),
(42, 206, 205, 2848, 2840, '20.00', '20.00', '20.00'),
(43, 206, 205, 2849, 2841, '40.00', '80.00', '40.00'),
(44, 206, 205, 2850, 2842, '5.00', '40.00', '5.00'),
(45, 206, 205, 2851, 2843, '20.00', '40.00', '20.00'),
(46, 206, 205, 2852, 2844, '20.00', '60.00', '20.00');

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
(5, 205, 200, '115.00'),
(6, 205, 201, '0.00'),
(7, 205, 204, '0.00'),
(8, 206, 200, '115.00'),
(9, 206, 201, '0.00'),
(10, 206, 204, '0.00'),
(11, 206, 205, '125.00');

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
(329, 'en', 'roman', 'roman', 'roman@mailinator.com', 1, 1, NULL, 22, '2019-10-25 05:40:14', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210934', '77.0818207', '+1', '9999999999', '$2y$10$hLeSFjMVGsNmvh8WhUnvAeDNB9p3lWZUf.nZiebeN41GzqVwvGCk6', 'Friendship, No Expectation', 2, '25', NULL, NULL, NULL, 'italy', 'romn', 'romm3', NULL, 'hhahahhhaa', 1, 1, 1, 3, 1, '4ff6d370f44a8454424ab36d9981c2964d17b4a053c88fe580a240c578d9d453', 2, '1572420779.png', NULL, '334,368,393', '333,336', NULL, '334,368,393', '333,336', 'german', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'GDLW4X', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 05:39:55', '2019-10-30 13:46:13', NULL, '98922268'),
(330, 'en', 'markrina', 'marco', 'marco@mailinator.com', 2, 1, NULL, 22, '2019-10-25 05:43:46', NULL, 'ASR Guest House, C-2/57, near HDFC Bank, Janakpuri, Delhi, 110058, India', '28.6206435', '77.082528', '+1', '9999999999', '$2y$10$ITq4RGjBldsfLA3W4iA.2ercoxpGLyTY7XRveh.2jWUrLW4hi3o96', 'Friendship, Daily Activities', 4, '21', NULL, NULL, NULL, 'venixe', 'tim', 'vjakak', NULL, 'yooohhahahhhaa', 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, '333,334', NULL, 'spanish', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'PKOYPI', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 05:43:27', '2019-10-25 06:30:14', NULL, '98922367'),
(331, 'en', 'yamam', 'yopy', 'yoppy@mailinator.com', 1, 1, NULL, 21, '2019-10-25 05:47:11', NULL, 'ASR Guest House, C-2/57, near HDFC Bank, Janakpuri, Delhi, 110058, India', '28.6206435', '77.082528', '+1', '9999999999', '$2y$10$q6gMXsHjm5ByxaWMf/sDlePUprrS2NEh5A6JjEoXWJN.C/0wnKVh2', 'Friendship', 3, '52', NULL, NULL, NULL, 'rr', 'hjaka', 'hiaaa', NULL, 'hakkskksjd', 1, 1, 3, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, '334', NULL, 'chinese', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MJTABU', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 05:46:39', '2019-10-25 06:30:17', NULL, '98922467'),
(333, 'en', 'Tim', 'Createffect', 'tim.leube@love-push.com', 1, 1, NULL, 25, '2019-10-25 06:03:22', NULL, 'Sm 20 Venado 8# 67, 20, 77500 Cancún, Q.R., Mexico', '21.1548352', '-86.8284267', '+1', '5418418923', '$2y$10$0AqwDBheiVYdEeU3MgpGS.iPnpn9PKV05k6c7zu4Cl95CBXKQ6fDi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, '920021572068659.jpg', NULL, '334,335,336', '329', '331', '330,334,335,336', '329', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'OSQX2H', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 06:01:20', '2019-10-30 02:34:06', NULL, '98922935'),
(334, 'en', 'The', 'jonny', 'johny.remy@web.de', 1, 1, NULL, 20, '2019-10-25 06:29:36', NULL, 'Isarstraße 5, 85368 Moosburg an der Isar, Germany', '48.46605824461953', '11.949772026160833', '+49', '15146223', '$2y$10$QVfO/lXYSFOEDy9uSgpmbe9w9VgEj2PnFhYCJTwtbYbhsn/KlUmYu', 'Daily Activities', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '329,333', NULL, NULL, '329,330,331,333', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'KCU15N', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 06:28:48', '2019-10-25 06:45:30', NULL, '98923774'),
(335, 'en', 'Felix', 'haudegen100', 'colognedog777@gmail.com', 1, 1, NULL, 26, '2019-10-25 06:45:32', NULL, '2301 Hilt Rd, Hornbrook, CA 96044, USA', '42.0024954', '-122.6411589', '+49', '1746082989', '$2y$10$lhrODaV7m9G50ipUzFqfNOArA9D/xsM.bBuGQ7ViimcchIztKBGyy', 'Friendship', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '333', NULL, NULL, '333', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'B46OHJ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 06:45:00', '2019-10-26 05:39:52', NULL, '98924440'),
(336, 'en', 'Test', 'Test', 'support@love-push.com', 1, 1, NULL, 21, '2019-10-25 06:54:47', NULL, 'Venado 8 #67, 20, 77500 Cancún, Q.R., Mexico', '21.154806699999998', '-86.828425', '+1', '5418418923', '$2y$10$1K.SCapp4L6QeNMTpc2gCegXD4I9ahmEM/76LTMDLdmLs.ChcTLfO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, '333', '329,338', NULL, '333', '329,338', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'LKHUV7', 'GDLW4X', NULL, '0', '0', '1', '1', '0', '0', '2019-10-25 06:54:25', '2019-10-26 05:39:51', NULL, '98924669'),
(337, 'en', '', 'theone', 'begood_johny@ymail.com', 1, 1, NULL, NULL, NULL, 5208, NULL, NULL, NULL, '+1', '1543528', '$2y$10$.MJsLdjR4wsxK/.4f.kYjua43WV1/kNE18DaUCH15e71OMFjQ0zki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'KMQTEZ', 'LKHUV7', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 06:56:30', '2019-10-25 06:56:30', NULL, ''),
(338, 'en', 'test', 'theonen', 'begood_johny@ymail.com', 1, 1, NULL, 22, '2019-10-25 06:59:22', NULL, NULL, NULL, NULL, '+1', '1543528', '$2y$10$XMqd5oLdVi/w.KxNYvVkaOH21.ja5aKUl63XzlbHWA9K.sgXqzPNy', 'Daily Activities', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, '336', NULL, NULL, '336', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'PCIVM3', 'LKHUV7', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 06:58:42', '2019-10-25 07:01:16', NULL, '98924776'),
(339, 'en', '', 'Tom', 'tom@mailinator.com', 1, 1, NULL, NULL, NULL, 6185, NULL, NULL, NULL, '+1', '1234562356', '$2y$10$.7EA1RAukL.WcIjnLw7ijezyLMp.brpX1c9iR3xX5q1M37yLrbEmq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'PFDK2H', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 08:03:06', '2019-10-25 08:03:06', NULL, ''),
(340, 'en', 'Kayuri', 'Tomy', 'tom@mailinator.com', 2, 1, NULL, 21, '2019-10-25 08:07:41', NULL, '20/19, Road Number 19, Central Government Staff Colony, Wadala West, Mumbai, 400031, Maharashtra, India', '19.0176147', '72.8561644', '+1', '1234562356', '$2y$10$QyucJC.MFt3uYpFNKmV/VuelXayeBJtE6FK2Ry3ttc72YhoxVlPgK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'XKWGGN', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 08:07:08', '2019-10-25 08:08:45', NULL, '98926712'),
(341, 'en', 'Tim Leube', 'Tim Grm', 'lovepush.app@gmail.com', 1, 2, '158641822062049', 20, '2019-10-30 10:22:12', NULL, '20/19, Road Number 19, Central Government Staff Colony, Wadala West, Mumbai, 400031, Maharashtra, India', '19.0176147', '72.8561644', '+1', '1234567856', NULL, 'Friendship,Relationship', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 2, '324731572430464.png', '398', NULL, NULL, '398', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '0DE2D6', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 08:21:23', '2019-10-30 12:33:49', NULL, '98927159'),
(344, 'en', 'Mutoni Aisha', NULL, 'mutoniaisha97@gmail.com', NULL, 1, NULL, NULL, NULL, 7237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 09:29:58', '2019-10-25 09:29:58', 'web', ''),
(345, 'en', 'ВАМ ВЫПЛАТА! - http://oribufibeq.gq/682 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'lex741@list.ru', NULL, 1, NULL, NULL, NULL, 8859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 10:01:53', '2019-10-25 10:01:53', 'web', ''),
(346, 'en', 'dew1', NULL, 'dew1@cox.net', NULL, 1, NULL, NULL, NULL, 9107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 11:15:43', '2019-10-25 11:15:43', 'web', ''),
(347, 'en', 'ВАМ ВЫПЛАТА! - http://emakirerim.tk/640 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'anastasia-a88@mail.ru', NULL, 1, NULL, NULL, NULL, 8970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 12:02:29', '2019-10-25 12:02:29', 'web', ''),
(348, 'en', 'kirstenbartels25', NULL, 'kirstenbartels25@aol.com', NULL, 1, NULL, NULL, NULL, 8518, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 12:37:28', '2019-10-25 12:37:28', 'web', ''),
(349, 'en', 'jeremy.perez65', NULL, 'jeremy.perez65@yahoo.com', NULL, 1, NULL, NULL, NULL, 3967, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 13:58:33', '2019-10-25 13:58:33', 'web', ''),
(350, 'en', 'ВАМ ВЫПЛАТА! - http://minyposu.tk/695 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'mozart82@mail.ru', NULL, 1, NULL, NULL, NULL, 6868, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 14:04:55', '2019-10-25 14:04:55', 'web', ''),
(351, 'en', 'Sane Sane', NULL, 'ssane7973@gmail.com', NULL, 1, NULL, NULL, NULL, 5801, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 16:28:55', '2019-10-25 16:28:55', 'web', ''),
(352, 'en', 'ВАМ ВЫПЛАТА! - http://hykekibevuvu.tk/632 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'mikhail_izotov_81@mail.ru', NULL, 1, NULL, NULL, NULL, 3932, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 17:11:31', '2019-10-25 17:11:31', 'web', ''),
(353, 'en', 'ВАМ ВЫПЛАТА! - http://ebiworukyz.tk/642 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'guli_nozanin@mail.ru', NULL, 1, NULL, NULL, NULL, 2014, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 17:16:12', '2019-10-25 17:16:12', 'web', ''),
(354, 'en', 'ВАМ ВЫПЛАТА! - http://rububecuho.tk/658 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'maksimova-inna@mail.ru', NULL, 1, NULL, NULL, NULL, 4710, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 23:17:12', '2019-10-25 23:17:12', 'web', ''),
(355, 'en', 'ВАМ ВЫПЛАТА! - http://iwyqudaj.tk/645 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'kamal-72@mail.ru', NULL, 1, NULL, NULL, NULL, 2706, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 23:48:18', '2019-10-25 23:48:18', 'web', ''),
(356, 'en', 'ВАМ ВЫПЛАТА! - http://oguvulowyhup.tk/680 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'akim.rus.s@mail.ru', NULL, 1, NULL, NULL, NULL, 4458, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 00:59:15', '2019-10-26 00:59:15', 'web', ''),
(357, 'en', 'ВАМ ВЫПЛАТА! - http://ibogawiryw.tk/671 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'yunat62@mail.ru', NULL, 1, NULL, NULL, NULL, 9050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 01:23:43', '2019-10-26 01:23:43', 'web', ''),
(358, 'en', 'ВАМ ВЫПЛАТА! - http://cerefuvoso.tk/628 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'frolova2310yulechka@mail.ru', NULL, 1, NULL, NULL, NULL, 2068, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 01:54:42', '2019-10-26 01:54:42', 'web', ''),
(359, 'en', 'ВАМ ВЫПЛАТА! - http://ebebevokaz.tk/626 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'myroslav_boyko@mail.ru', NULL, 1, NULL, NULL, NULL, 2415, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 02:32:26', '2019-10-26 02:32:26', 'web', ''),
(360, 'en', 'ВАМ ВЫПЛАТА! - http://soravyxe.tk/647 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'tanya05@mail.ru', NULL, 1, NULL, NULL, NULL, 7483, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 03:16:42', '2019-10-26 03:16:42', 'web', ''),
(361, 'en', 'ВАМ ВЫПЛАТА! - http://ricusaboga.tk/649 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'kartishka@inbox.ru', NULL, 1, NULL, NULL, NULL, 6380, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 03:55:37', '2019-10-26 03:55:37', 'web', ''),
(362, 'en', 'ВАМ ВЫПЛАТА! - http://byciwodady.cf/611 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'ulyana.surnina@mail.ru', NULL, 1, NULL, NULL, NULL, 5402, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 04:31:25', '2019-10-26 04:31:25', 'web', ''),
(363, 'en', 'mgrant5', NULL, 'mgrant5@charter.net', NULL, 1, NULL, NULL, NULL, 2762, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 04:35:38', '2019-10-26 04:35:38', 'web', ''),
(364, 'en', 'Tushu', NULL, 'tmavenger4422@gmail.com', NULL, 1, NULL, NULL, '2019-10-26 05:21:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 05:20:16', '2019-10-26 05:21:11', 'web', ''),
(365, 'en', 'ВАМ ВЫПЛАТА! - http://opuhegimil.tk/657 Сумма 42100р. Проверьте сейчас! Ограниченное предложение. Начисления будут аннулированы в течении 1 дня', NULL, 'ruslan3499@mail.ru', NULL, 1, NULL, NULL, NULL, 4814, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-26 05:32:36', '2019-10-26 05:32:36', 'web', ''),
(368, 'en', 'manish015', 'manish12345', 'mmm@mailinator.com', 1, 1, NULL, 21, '2019-10-29 05:58:10', NULL, '503, Block B 3A, Janakpuri, New Delhi, Delhi 110058, India', '28.621899999999997', '77.0878', '+1', '54555545', '$2y$10$gW1X0KdabUaAkORoKQvjSOM3SAB6eDYj0eU6c0GbItfLZ3XHE9YLK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '402,403,409,411,413,415,416', '329', '367,373,374,375,376', '401,402,403,409,411,413,415,416', '329', '367,373,374,375,376', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'Q0WVMS', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 05:57:43', '2019-10-30 14:20:24', NULL, '99091148'),
(374, 'en', 'Manish kumar', 'hgg', 'manisfvh@mailinator.com', 3, 4, '5870085026', 25, NULL, NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280843', '76.846261', '+1', '9888889965', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, '368', NULL, '375', '368', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'WEZQFY', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 06:45:08', '2019-10-30 07:45:28', NULL, '99092986'),
(375, 'en', 'Manish', 'manish12345678', 'manishpreet0186@gmail.com', 1, 2, '1120785261461977', 25, '2019-10-30 09:46:12', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280893', '76.8462687', '+1', '9885685699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '377', NULL, '368', '377', '374', '368', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '7H21VV', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 06:49:36', '2019-10-30 09:46:12', NULL, '99093161'),
(376, 'en', 'Manish', 'rfggg', 'manish.sachtech@gmail.com', 3, 3, 'mj5AeHKSrzL2wTMJuSzsYRQDFP42', 19, '2019-10-30 07:51:03', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280832', '76.846264', '+1', '6554555856', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, '368', NULL, NULL, '368', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '5RLWW2', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 07:03:43', '2019-10-30 09:34:08', NULL, '99093716'),
(377, 'en', 'Flutter', 'manishsingh', 'manish.preet0186@gmail.com', 1, 3, 'vmHHdKvQFyXfdW2MqpXufWGbGPU2', 21, '2019-10-29 09:23:38', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280571', '76.8462483', '+1', '646466464995', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '375', NULL, NULL, '375,385', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'YDHFPC', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 09:23:38', '2019-10-30 05:56:58', NULL, '99099589'),
(378, 'en', 'info', NULL, 'info@hidden-audio.de', NULL, 1, NULL, NULL, NULL, 8853, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 12:41:33', '2019-10-29 12:41:33', 'web', ''),
(379, 'en', 'falconconstruction', NULL, 'falconconstruction@yahoo.com', NULL, 1, NULL, NULL, NULL, 1681, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 15:13:42', '2019-10-29 15:13:42', 'web', ''),
(380, 'en', 'Wittco50', NULL, 'Wittco50@gmail.com', NULL, 1, NULL, NULL, NULL, 6361, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 15:31:32', '2019-10-29 15:31:32', 'web', ''),
(381, 'en', 'mmiller', NULL, 'mmiller@legendfbo.com', NULL, 1, NULL, NULL, NULL, 7964, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 17:49:40', '2019-10-29 17:49:40', 'web', ''),
(382, 'en', 'turkibutt48', NULL, 'turkibutt48@cox.net', NULL, 1, NULL, NULL, NULL, 9249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 18:29:55', '2019-10-29 18:29:55', 'web', ''),
(383, 'en', 'fourgenaustin', NULL, 'fourgenaustin@yahoo.com', NULL, 1, NULL, NULL, NULL, 6312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 19:35:51', '2019-10-29 19:35:51', 'web', ''),
(384, 'en', 'tarableknight10', NULL, 'tarableknight10@yahoo.com', NULL, 1, NULL, NULL, NULL, 1127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 23:53:20', '2019-10-29 23:53:20', 'web', ''),
(385, 'en', 'Ranjana', 'ranjana', 'ranjana2020rawat@gmail.com', 2, 3, 'KWaUItPJR4Vyi3prDZaRQPDGhDi1', 24, '2019-10-30 05:54:04', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280698', '76.8462595', '+1', '6464589565', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '377', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '7TPIHW', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 05:54:04', '2019-10-30 09:37:21', NULL, ''),
(386, 'en', 'Hardik', 'Harry sharma', 'iamhardiksharma94@gmail.com', 1, 3, '3AksitZM2sagfrUWfg4P0E7HR763', 25, '2019-10-30 11:13:12', NULL, NULL, NULL, NULL, '+91', '8888888888', '$2y$10$/aYzXVkEwqiqZL8qqU81puvKGd7PcVbgJdxhVVZn.S8kcaAQgsODW', 'Relationship, Friendship, Daily Activities', 1, '7', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '4MJJF1', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 06:48:01', '2019-10-30 11:13:12', NULL, ''),
(389, 'en', 'HarryS', 'HarryS', 'HarryS@mailinator.com', 1, 1, NULL, NULL, NULL, 5532, NULL, NULL, NULL, '91', '9876543210', '$2y$10$W9rd2wXHDqA8LQm.QpphIejCJK0Gi9bYFCZ0PZ.RweBe6vuv7tLgW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'Y0JOX3', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 07:06:52', '2019-10-30 07:37:18', NULL, '99148058'),
(390, 'en', 'Denin Kastil', 'Denin', 'denin@mailinator.com', 1, 1, NULL, 22, '2019-10-30 07:45:40', NULL, NULL, NULL, NULL, '+1', '1234567894', '$2y$10$dkdPCQWqazAot8EwUh0VT.M.5ZTJ57noZ8otfs9Etk4gD5o8kJf1a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MLWKQ7', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 07:44:56', '2019-10-30 07:45:56', NULL, ''),
(391, 'en', 'MohitS', 'MohitS', 'mohitks@mailinator.com', 1, 1, NULL, NULL, NULL, 8927, NULL, NULL, NULL, '91', '9876543210', '$2y$10$FDtvTxoqF7EIiKeyjm1UWuePl/ZxRBnNSqCs9KKtUW8tfKUlCXQoS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'U6CFY2', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 07:45:29', '2019-10-30 07:46:45', NULL, '99148411'),
(392, 'en', 'anirudh', NULL, 'anirudh@mailinator.com', NULL, 1, NULL, NULL, '2019-10-30 07:49:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, '393', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 07:48:53', '2019-10-30 08:00:22', 'web', ''),
(393, 'en', 'Mayur Chaudhary', 'Mayur', 'mayur@mailinator.com', 1, 1, NULL, 22, '2019-10-30 07:50:05', NULL, '135, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.621113001703847', '77.08191064675052', '+1', '1234567896', '$2y$10$/Hke3Qr/ObJu1h1sMw9vxulMuUj/Oy2C3GPRyLFi0GbdeO6ScvlmG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, 'de724e7e56614ae3c867559a306ddabf5a76857eacd4b7eeae32a0bb19c11a1b', 2, NULL, NULL, '329,398', NULL, NULL, '329,392,394,398', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'HMKE83', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 07:49:51', '2019-10-30 09:07:14', NULL, '99148550'),
(394, 'en', 'anirudh', NULL, 'anirudh.p303@gmail.com', NULL, 1, NULL, NULL, '2019-10-30 07:59:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, '393', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 07:57:52', '2019-10-30 08:00:02', 'web', ''),
(395, 'en', 'Rahul', NULL, 'rahul@mailinator.com', NULL, 1, NULL, NULL, NULL, 3440, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 08:29:07', '2019-10-30 08:29:07', 'web', ''),
(396, 'en', 'Micheal Johns', 'Love Push Fb', 'xicomtest04@gmail.com', 1, 2, '2340729176175958', 22, '2019-10-30 12:44:52', NULL, '134, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.62106885763688', '77.0818243269595', '+1', '124245656755', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, NULL, '416', NULL, NULL, '416', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'VLNCNE', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 09:02:24', '2019-10-30 14:25:32', NULL, '99151892'),
(397, 'en', 'lovepush', 'Lovepush Insta', 'lovepush@mailinator.com', 1, 4, '14273783417', 23, '2019-10-30 09:05:34', NULL, NULL, NULL, NULL, '+1', '1234567896', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MDIJ1F', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 09:04:12', '2019-10-30 09:10:46', NULL, '99151973'),
(398, 'en', 'AISHWARYA SRIVASTAVA', 'Ashwariua', 'riya.verma261993@gmail.com', 1, 3, '112458410988232482365', 24, '2019-10-30 12:33:15', NULL, '134, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.621051339459253', '77.08186095587637', '+1', '45465685454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, '440091572429616.png', '341', '393', NULL, '341', '393', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'OZE1HQ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 09:06:12', '2019-10-30 12:33:15', NULL, '99152061'),
(399, 'en', 'Mohit Singla', NULL, 'mohitks123@mailinator.com', NULL, 1, NULL, NULL, '2019-10-30 09:16:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 09:15:50', '2019-10-30 09:16:28', 'web', ''),
(400, 'en', '', 'manish 786', 'mp@mailinatr.com', 1, 1, NULL, NULL, NULL, 9497, NULL, NULL, NULL, '+1', '979979449495', '$2y$10$9rCO44ic.kyBJ2iMuj4nvOC.3BIctIbdvXklXcn4hN2OTbk85QdbG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '5ZCVAJ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 09:40:51', '2019-10-30 09:40:51', NULL, ''),
(401, 'en', 'Manish singh', 'manishsingh 786', 'mp@mailinator.com', 1, 1, NULL, 34, '2019-10-30 09:42:41', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280876', '76.8462681', '+1', '979979449495', '$2y$10$Dl2m4BYDmJp7Niii2utOsO1Hk/KEWMAvTpWT5U9KMkaD5/F6gO1Yq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '368', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'ERR76K', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 09:41:54', '2019-10-30 09:45:50', NULL, '99153903'),
(402, 'en', 'manish testing', 'testing', 'testing@mailinator.com', 1, 1, NULL, 23, '2019-10-30 09:47:21', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280705', '76.8462595', '+1', '99988788', '$2y$10$.yXA/U.wgwHnUqzcdcsjM.NZOW79OfBJDepb1xfSJtA65VC2M2iKu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '368', NULL, NULL, '368', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'DYEIX2', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 09:46:59', '2019-10-30 12:36:46', NULL, '99154078'),
(403, 'en', 'Harryn', 'Harry New', 'harry@mailinator.com', 1, 1, NULL, 25, '2019-10-30 09:53:30', NULL, '503, Block B 3A, Janakpuri, New Delhi, Delhi 110058, India', '28.621899999999997', '77.0878', '+91', '1111111111', '$2y$10$kj6k.GFqXfhIzckfws0KNuHqAbO5EHl5msIaCwv.7gnD2Cxgtf/w6', 'Relationship, Friendship, Daily Activities', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '368,404,407,409', NULL, NULL, '368,404,407,409', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'XGPLZ3', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 09:53:13', '2019-10-30 12:54:14', NULL, '99154317'),
(404, 'en', 'rahul', 'Rahul New', 'rahultleo1998@gmail.com', 1, 1, NULL, 25, '2019-10-30 10:00:31', NULL, '503, Block B 3A, Janakpuri, New Delhi, Delhi 110058, India', '28.621899999999997', '77.0878', '+91', '1111111111', '$2y$10$t0gJFKuDYcFhj5WQxD0q2O0XenXXjVQ4w/y1QFTFbqrleLcaY5ObS', 'Relationship, Friendship, Daily Activities', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '403,409', NULL, NULL, '403,409', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'XJ7PY4', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 10:00:11', '2019-10-30 13:22:24', NULL, '99154576'),
(405, 'en', 'Xien Lua', 'Xen@lua', 'xicomtest11@gmail.com', 1, 3, '104672601682824780059', 24, '2019-10-30 10:31:30', NULL, '134, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.62109144686593', '77.08184100694682', '+1', '4554547845', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, '4ff6d370f44a8454424ab36d9981c2964d17b4a053c88fe580a240c578d9d453', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'BGJR8U', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 10:31:30', '2019-10-30 10:31:57', NULL, '99155701'),
(406, 'en', 'Lehman Carter', 'Lehman', 'lehman@mailinator.com', 1, 1, NULL, 23, '2019-10-30 11:05:54', NULL, NULL, NULL, NULL, '+1', '22366655444', '$2y$10$Ox8CEXvxdjbLFr1Rm/Emee2DC1GbQHJ88dvmgBS.NgDll2GzzrSIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'UXCHWK', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 11:05:35', '2019-10-30 11:06:19', NULL, '99156938'),
(407, 'en', 'Hardik', 'harry s', 'hardik1xicom@gmail.com', 1, 3, 'Seq119erDFMMO9iuOsR8PMEVnD43', 25, '2019-10-30 01:57:53', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210803', '77.0818485', '+91', '9761228844', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, '403', NULL, NULL, '403', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'XFJUCZ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 12:31:28', '2019-10-30 13:58:00', NULL, '99159723'),
(408, 'en', 'kelly.herbster', NULL, 'kelly.herbster@k12.sd.us', NULL, 1, NULL, NULL, NULL, 6567, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 12:40:29', '2019-10-30 12:40:29', 'web', ''),
(409, 'en', 'LP', 'LP test', 'test@mailinator.com', 1, 1, NULL, 25, '2019-10-30 12:48:13', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210854', '77.0818311', '+91', '8888888888', '$2y$10$b.CNN2UMFA28pdEndqW6LOhhPx/UzXgvvzziH1.hBXohecHzDSEmS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, '368,403,404', NULL, NULL, '368,403,404', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'HRKMII', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 12:47:53', '2019-10-30 13:50:56', NULL, '99160241'),
(410, 'en', 'shshhs', 'mayur1234567', 'chaudhary@mailinator.com', 1, 1, NULL, 21, '2019-10-30 01:01:24', NULL, '134, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.620976824340058', '77.08186397336151', '+1', '8586023104', '$2y$10$EARfhxyviwP.1hjy8RE34.H/zJKtR/xaRp/q1I/sLJviqWBP.QRhO', 'Relationship', 2, '217', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 3, 3, 1, 'e5fd2fc5a490d4d0c675ae2b61a3e873837a6484cd271fe57558f0148ead3813', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hsshsb', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'UO3R6A', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 13:01:04', '2019-10-30 13:02:15', NULL, '99160548'),
(411, 'en', 'XT', 'XT', 'user@mailinator.com', 1, 1, NULL, 22, '2019-10-30 01:59:29', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210915', '77.0818267', '+91', '1111111111', '$2y$10$aOOrzYK4Ws7iCT8deV7E8OCpUHnrn0auo77ZhL5iVJ61NEZNH9wim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, '368', NULL, NULL, '368', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'DKOA6Q', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 13:59:12', '2019-10-30 14:02:33', NULL, '99162113'),
(412, 'en', 'Sasa', NULL, 'sarathvoeun@gmail.com', NULL, 1, NULL, NULL, NULL, 5147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 14:04:26', '2019-10-30 14:04:26', 'web', ''),
(413, 'en', 'Hardik', 'Sharma hardik', 'sharmahardik980@gmail.com', 1, 3, 'blVaYMRzgfNKGMUxDa5LNrYkyeN2', 25, '2019-10-30 02:08:34', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210922', '77.081827', '+1', '1111111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, '368', NULL, NULL, '368', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'UQ0LTT', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 14:08:34', '2019-10-30 14:11:09', NULL, '99162367'),
(414, 'en', 'DMERKLE143', NULL, 'DMERKLE143@VZW.BLACKBERRY.NET', NULL, 1, NULL, NULL, NULL, 6993, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 14:09:53', '2019-10-30 14:09:53', 'web', ''),
(415, 'en', 'new tester', 'new tester', 'hh@hh.hh', 1, 1, NULL, 26, '2019-10-30 02:15:04', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210919', '77.0818217', '+91', '2222222222', '$2y$10$P3Af8bhfGtRsK5Fn8NfqSOdZCoybL8q7Vl0pA/k4c2OZ9qgsACLvC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, '368', NULL, NULL, '368', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'EU174T', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 14:14:39', '2019-10-30 14:16:50', NULL, '99162619'),
(416, 'en', 'harry test new', 'harry test new', 'ss@ss.ss', 1, 1, NULL, 25, '2019-10-30 02:19:19', NULL, 'C-1-135, Block C1, Janakpuri, New Delhi, Delhi 110058, India', '28.6210869', '77.08182', '+91', '1212121212', '$2y$10$QZ1RnVtMsnStAmiRYqxyv.63A7089pqqoixzu8uWjI5D9GpFbLU.6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, '368', '396', NULL, '368', '396', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '8RQXGJ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 14:18:59', '2019-10-30 14:25:32', NULL, '99162731');

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
(274, 333, '920021572068659.jpg', '2019-10-26 05:44:19', '2019-10-26 05:44:19'),
(275, 329, '885861572420746.png', '2019-10-30 07:32:26', '2019-10-30 07:32:26'),
(276, 398, '440091572429616.png', '2019-10-30 10:00:16', '2019-10-30 10:00:16'),
(277, 341, '324731572430464.png', '2019-10-30 10:14:24', '2019-10-30 10:14:24'),
(278, 341, '726271572430482.png', '2019-10-30 10:14:42', '2019-10-30 10:14:42');

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
(200, 331, '2019-10-25 05:48:09', '2019-10-25 05:48:09'),
(201, 336, '2019-10-25 07:11:31', '2019-10-25 07:11:31'),
(204, 385, '2019-10-30 06:26:59', '2019-10-30 06:26:59'),
(205, 329, '2019-10-30 07:31:14', '2019-10-30 07:31:14'),
(206, 376, '2019-10-30 09:23:18', '2019-10-30 09:23:18');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;
--
-- AUTO_INCREMENT for table `connect_requests`
--
ALTER TABLE `connect_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=878;
--
-- AUTO_INCREMENT for table `deleted_accounts`
--
ALTER TABLE `deleted_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1871;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=390;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2365;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT for table `post_ads`
--
ALTER TABLE `post_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `qb_chat_dialog_ids`
--
ALTER TABLE `qb_chat_dialog_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_ques`
--
ALTER TABLE `test_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2853;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4594;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `test_scores`
--
ALTER TABLE `test_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;
--
-- AUTO_INCREMENT for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
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
