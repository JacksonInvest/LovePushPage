-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2019 at 06:53 AM
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
(432, 372, 368, '0', '2019-10-29 07:07:30', '2019-10-29 07:07:30');

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
(871, 368, 329, 'A', '2019-10-30 05:54:40', '2019-10-30 05:55:08');

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
(1845, 385, 377, 1, '2019-10-30 05:56:58', '2019-10-30 05:56:58');

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
(374, 'C', 368, 329, 1, '2019-10-30 05:55:08', '2019-10-30 05:55:08');

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
  `event_type` enum('L','S_C_R','A_C_R','R_C_R','S_M_R','A_M_R','R_M_R','S_L_R','A_L_R') NOT NULL COMMENT 'L=like, S_C_R=send connect request, A_C_R=accept connect request, R_C_R=reject connect request, S_M_R=send messaging request, A_M_R=accept messaging request, R_M_R=reject messaging request',
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
(2305, 'A_C_R', 866, 329, 334, 1, 1, '2019-10-25 06:30:48', '2019-10-25 06:31:15'),
(2306, 'A_C_R', 868, 333, 334, 1, 1, '2019-10-25 06:40:20', '2019-10-25 06:42:54'),
(2307, 'S_C_R', 869, 335, 333, 0, 1, '2019-10-25 06:52:15', '2019-10-26 05:39:52'),
(2308, 'S_C_R', 870, 336, 333, 0, 1, '2019-10-25 06:57:23', '2019-10-26 05:39:51'),
(2309, 'S_M_R', 63, 336, 338, 0, 1, '2019-10-25 07:00:56', '2019-10-25 07:01:16'),
(2310, 'A_M_R', 63, 338, 336, 0, 1, '2019-10-25 07:01:16', '2019-10-25 07:43:01'),
(2311, 'S_M_R', 64, 329, 336, 0, 1, '2019-10-25 07:01:49', '2019-10-25 07:42:58'),
(2312, 'A_M_R', 64, 336, 329, 1, 1, '2019-10-25 07:42:57', '2019-10-30 05:55:06'),
(2313, 'A_C_R', 870, 333, 336, 1, 0, '2019-10-26 05:39:51', '2019-10-26 05:39:51'),
(2314, 'A_C_R', 869, 333, 335, 1, 0, '2019-10-26 05:39:52', '2019-10-26 05:39:52'),
(2319, 'S_M_R', 67, 374, 368, 0, 1, '2019-10-29 06:45:56', '2019-10-29 06:47:30'),
(2320, 'A_M_R', 67, 368, 374, 1, 1, '2019-10-29 06:47:30', '2019-10-29 06:47:34'),
(2321, 'S_M_R', 68, 375, 368, 0, 1, '2019-10-29 06:50:47', '2019-10-29 06:50:55'),
(2322, 'A_M_R', 68, 368, 375, 1, 1, '2019-10-29 06:50:55', '2019-10-29 06:51:25'),
(2323, 'S_M_R', 69, 376, 368, 0, 1, '2019-10-29 07:07:05', '2019-10-29 07:07:16'),
(2324, 'A_M_R', 69, 368, 376, 1, 1, '2019-10-29 07:07:16', '2019-10-29 07:43:43'),
(2325, 'S_L_R', 1843, 377, 375, 0, 1, '2019-10-29 09:24:38', '2019-10-29 09:24:45'),
(2326, 'A_L_R', 1844, 375, 377, 1, 1, '2019-10-29 09:24:45', '2019-10-29 09:35:30'),
(2327, 'S_C_R', 871, 368, 329, 0, 1, '2019-10-30 05:54:40', '2019-10-30 05:55:08'),
(2328, 'A_C_R', 871, 329, 368, 1, 1, '2019-10-30 05:55:08', '2019-10-30 05:56:36'),
(2329, 'S_L_R', 1845, 385, 377, 1, 0, '2019-10-30 05:56:58', '2019-10-30 05:56:58');

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
(2329, 2, 'Ranjana hat Ihnen eine Terminanfrage gesendet.', '2019-10-30 05:56:58', '2019-10-30 05:56:58');

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
('0565d29b2122bfc32317a52400a7582104a796e3a5cd7ab414bc08e0c2afbf46aa42369468724c4d', 376, 1, 'user', '[]', 0, '2019-10-29 07:03:43', '2019-10-29 07:03:43', '2020-10-29 07:03:43'),
('06bfe58b99fc32bcaa940271c02f298b81bea5fb5adab3d7ccac072b1aa51daeb1631345f82cf4fd', 375, 1, 'user', '[]', 1, '2019-10-29 12:57:03', '2019-10-29 12:57:03', '2020-10-29 12:57:03'),
('06df61f99887d4e4b98a26d931b5b3c945d413f503d13ca5d967f53b834c547d2ad0b76ce609dc46', 377, 1, 'user', '[]', 1, '2019-10-29 09:24:08', '2019-10-29 09:24:08', '2020-10-29 09:24:08'),
('13895a4edb9de9aa3cfef64638007e0bcf69488c91b00b1f92ecfc6169629c8436546363e23dc1ee', 329, 1, 'user', '[]', 0, '2019-10-25 05:39:56', '2019-10-25 05:39:56', '2020-10-25 05:39:56'),
('171931197d1a3167fd6dee73aa6c23f9a38108b277da589b4ace7cf25eb5063ab95174fedf9683e2', 340, 1, 'user', '[]', 1, '2019-10-25 08:08:00', '2019-10-25 08:08:00', '2020-10-25 08:08:00'),
('173b2e0d9d89cd232c75f93a186ae44b0e50bed446fde3d129f417cf4ba394215634ede5ab88e016', 329, 1, 'user', '[]', 0, '2019-10-25 06:47:42', '2019-10-25 06:47:42', '2020-10-25 06:47:42'),
('180cd51bc6c8d743e8414ca16eedc1c9013a649c44e1dd8a4b0714b422d7500b26770dd21733e7f0', 387, 1, 'user', '[]', 0, '2019-10-30 06:52:57', '2019-10-30 06:52:57', '2020-10-30 06:52:57'),
('1958217a2e7963e682c71e21d853354c1491566ff8ed46bd0d44b31130a1fb1f445b47322ac53bbd', 375, 1, 'user', '[]', 0, '2019-10-30 05:38:22', '2019-10-30 05:38:22', '2020-10-30 05:38:22'),
('1aabf740240edc48620cb9b482718a6e647ea1e74293eec038c930feda3b49fe66315ac0330debcf', 375, 1, 'user', '[]', 0, '2019-10-29 06:49:53', '2019-10-29 06:49:53', '2020-10-29 06:49:53'),
('1c8ba8aa89a12cefe05e5d8d1384435f04067522cd5c76ebf6e08116af62f9768a0d183e67cda150', 341, 1, 'user', '[]', 0, '2019-10-25 08:26:15', '2019-10-25 08:26:15', '2020-10-25 08:26:15'),
('23181cf4408bc71f1694930ad0333e14d47debcd700ab29bb6dd029b9fb6ba7713daad8ca7ee654f', 335, 1, 'user', '[]', 0, '2019-10-25 06:50:45', '2019-10-25 06:50:45', '2020-10-25 06:50:45'),
('281039465f540921e2e0fd58f81f5ba1515c7151d50dec4dba517ecdab035a05309491dd393525e3', 385, 1, 'user', '[]', 0, '2019-10-30 05:54:24', '2019-10-30 05:54:24', '2020-10-30 05:54:24'),
('2b48a7bf3165f7ecbceca72b1b79c5367e05bee36c399e842773de89a30466eec61e0fe1fea49ea5', 375, 1, 'user', '[]', 0, '2019-10-29 13:37:46', '2019-10-29 13:37:46', '2020-10-29 13:37:46'),
('2b59d9e69dd4225d0b5b7c66b5926c3be55089d34225e084dde44365f7151a342b4f331e81e99231', 336, 1, 'user', '[]', 0, '2019-10-25 06:54:26', '2019-10-25 06:54:26', '2020-10-25 06:54:26'),
('2cf665ae2bd1444a09e46bc3ec26a5943049f7fc90172a34a9a8005f0ceb492d97ae31f2cef914fb', 377, 1, 'user', '[]', 0, '2019-10-29 09:23:38', '2019-10-29 09:23:38', '2020-10-29 09:23:38'),
('2eb20a5040e51fc51f0640bbdf1f51d1588fa6c70c1843e10401033c3320c98d8fb148caaad684be', 368, 1, 'user', '[]', 1, '2019-10-29 09:36:29', '2019-10-29 09:36:29', '2020-10-29 09:36:29'),
('327dd49b6f2b5a52089ba1c73d2e48e424ba9cf0b6b61a0f53f22030d4a6fd38bfab409b001fc797', 329, 1, 'user', '[]', 1, '2019-10-25 05:40:46', '2019-10-25 05:40:46', '2020-10-25 05:40:46'),
('363db5098181e0c050872e8ad9bb7809f4d1b6bfe5c32dd4547970ac6468bbf3c562e06f27c99d9f', 368, 1, 'user', '[]', 1, '2019-10-29 13:09:16', '2019-10-29 13:09:16', '2020-10-29 13:09:16'),
('3a83fea4fd853c71158503e2657c2661d4fc71f2faabf887b11f82afb49885230a343fc92c6bd5c0', 329, 1, 'user', '[]', 1, '2019-10-30 06:36:44', '2019-10-30 06:36:44', '2020-10-30 06:36:44'),
('3aec081d440309707c1bd452669e5cba0cc8858516e6226d5948bbfd2b88f718789348f06b471639', 336, 1, 'user', '[]', 1, '2019-10-25 06:54:56', '2019-10-25 06:54:56', '2020-10-25 06:54:56'),
('4722ceaa95f6125f16e7f65ddbd761b26aad7257b89645425cd28fa088d8a7948173ff6f06873f07', 329, 1, 'user', '[]', 0, '2019-10-30 06:52:56', '2019-10-30 06:52:56', '2020-10-30 06:52:56'),
('489554d041cfbddbff64265d424543e6b89b55e109d36cf550299e4ef46cc17e19700fbb606a3799', 337, 1, 'user', '[]', 0, '2019-10-25 06:56:31', '2019-10-25 06:56:31', '2020-10-25 06:56:31'),
('4e3526cb61c41fe92cb858aebfc04964db3c04403a44b7d813987783c26d36dd57047b07d3cdd25d', 375, 1, 'user', '[]', 0, '2019-10-29 13:43:03', '2019-10-29 13:43:03', '2020-10-29 13:43:03'),
('4e55827aff22ed58a6377f1f992c9a4872e65ffdb70af746e28639a1f0f8ffe9a0fa78ce9dc08b5d', 376, 1, 'user', '[]', 0, '2019-10-29 07:03:58', '2019-10-29 07:03:58', '2020-10-29 07:03:58'),
('5007fc8b48d364e92e5ac1b516ace5b4146831b113cc9e8eefb25360f12dd1e55e21a36b7a44b8d8', 368, 1, 'user', '[]', 0, '2019-10-30 05:56:33', '2019-10-30 05:56:33', '2020-10-30 05:56:33'),
('5584f722eb5157d9cf9af48452a7e0679d45f42a7d4510a925f316b7e1a4e987675a358ac17769d5', 375, 1, 'user', '[]', 1, '2019-10-29 13:25:34', '2019-10-29 13:25:34', '2020-10-29 13:25:34'),
('5accd018a4b4aef97902b5e6f0b9f4c54c912383fbe82652b4b77245ba628bbd0c32e9098d84ff43', 374, 1, 'user', '[]', 0, '2019-10-29 06:45:32', '2019-10-29 06:45:32', '2020-10-29 06:45:32'),
('5fb3e9195d3cf307bfda4995191d9b5bd571f34e2ce4b57be3adfaa3cda975ee66f0d3f2e160da29', 375, 1, 'user', '[]', 0, '2019-10-29 06:49:36', '2019-10-29 06:49:36', '2020-10-29 06:49:36'),
('5fcc54fdbd40061fe96161e898e4efecb753e26015afcaf3c71cbd91a34ca77dafe3d19d9127f4b6', 331, 1, 'user', '[]', 0, '2019-10-25 05:46:39', '2019-10-25 05:46:39', '2020-10-25 05:46:39'),
('615c091025a8dabd5a694b90ab7a5a2b25bb5d7de622ff8931703112f6d7fd0452564373af85b6d9', 368, 1, 'user', '[]', 1, '2019-10-30 05:00:51', '2019-10-30 05:00:51', '2020-10-30 05:00:51'),
('656eb08de9a6d1c9d89829a1a2da72366204236104b5199954a5517c5c7d9f8e47d12bc8eed799e4', 340, 1, 'user', '[]', 0, '2019-10-25 08:07:09', '2019-10-25 08:07:09', '2020-10-25 08:07:09'),
('671d858154cff234c62e872dd11fd28168b4be014d5fa6b73545e18d648ad0560e55ad5df0c21224', 375, 1, 'user', '[]', 1, '2019-10-29 09:09:45', '2019-10-29 09:09:45', '2020-10-29 09:09:45'),
('677c90868fc44d48665c56a617f2b117c3bbf00e136641a7ecfeab8e959e099ed011a865d4a92a05', 376, 1, 'user', '[]', 1, '2019-10-29 13:05:08', '2019-10-29 13:05:08', '2020-10-29 13:05:08'),
('67f88eef80bfd959fca036aa223fa54c777fee004d4d46f4500628cc6dcd37e1c5e2674891a42af2', 374, 1, 'user', '[]', 0, '2019-10-29 06:45:08', '2019-10-29 06:45:08', '2020-10-29 06:45:08'),
('6fa1365b09beb9c75a4992b8af8b5f09c23fa1c6563753179f8733f1e31fe32da6b29e966fa45316', 330, 1, 'user', '[]', 0, '2019-10-25 05:43:28', '2019-10-25 05:43:28', '2020-10-25 05:43:28'),
('712a48bbc7ef1ef9543edf36a5b985596b3722a7e92373c88341fc633b1aeceda9800b353394a732', 341, 1, 'user', '[]', 1, '2019-10-25 08:22:42', '2019-10-25 08:22:42', '2020-10-25 08:22:42'),
('736523efe8658141f9080a60ceeb003fec3335595345e0ba072d541eb88e914b940f82f489d18faa', 375, 1, 'user', '[]', 0, '2019-10-29 13:36:30', '2019-10-29 13:36:30', '2020-10-29 13:36:30'),
('7639bcd520106e407e521eb2ec4492b03fcedc9871166e8dfc635861905bb60021218475e3401598', 333, 1, 'user', '[]', 1, '2019-10-25 06:04:00', '2019-10-25 06:04:00', '2020-10-25 06:04:00'),
('79fc81be0d6a2bf61eb562dc292ef0663bbd3fb80ab1cfae55ace33a422773c379ff9d5351a79b82', 368, 1, 'user', '[]', 0, '2019-10-30 04:48:37', '2019-10-30 04:48:37', '2020-10-30 04:48:37'),
('7a8d48ae57ddd4ba0654a0183e3a553c8616a7ec05d4a88da431edaf46bd6cfb3973d857502d23f3', 334, 1, 'user', '[]', 0, '2019-10-25 06:28:49', '2019-10-25 06:28:49', '2020-10-25 06:28:49'),
('7e178c8db6102f05373362a3554e8784809876ce03231c2c650cec6dcc54461c1109131d60ae5c73', 376, 1, 'user', '[]', 1, '2019-10-29 07:04:40', '2019-10-29 07:04:40', '2020-10-29 07:04:40'),
('816fca329bec73a1abd4703301c31ff8219486362af05a211702d4126e216eba72a6984c8abf86b9', 329, 1, 'user', '[]', 1, '2019-10-30 05:55:03', '2019-10-30 05:55:03', '2020-10-30 05:55:03'),
('8558320d4c08172e96a51ce3d621a66a42622c22e9c99dacc9b09eb1622c93c573e8cc86c7a7aa83', 368, 1, 'user', '[]', 0, '2019-10-29 10:03:02', '2019-10-29 10:03:02', '2020-10-29 10:03:02'),
('8efa9e359c8fc9502a73af48afd181c5fdddbfd169f489191416d19921ab2798854e26b6ef7cb418', 332, 1, 'user', '[]', 0, '2019-10-25 05:49:43', '2019-10-25 05:49:43', '2020-10-25 05:49:43'),
('91719154783652df46378a39143e9d8941a6753bdbc17bba19b070c2161e2222ca532dd04257eb4c', 368, 1, 'user', '[]', 0, '2019-10-30 04:44:44', '2019-10-30 04:44:44', '2020-10-30 04:44:44'),
('91d82acf5ce3c8224d437bf16f6b39de4dc2c56b7275b7c709fd0d81201af004717d0052fea10508', 385, 1, 'user', '[]', 0, '2019-10-30 05:54:04', '2019-10-30 05:54:04', '2020-10-30 05:54:04'),
('91f0601d236914484a018426a39c0e0fa38955c48f14bbac6f0ecc9bc63bf59b0a5b1244c0062e43', 329, 1, 'user', '[]', 0, '2019-10-30 06:38:26', '2019-10-30 06:38:26', '2020-10-30 06:38:26'),
('93e3d437771bca9902ac01134d320e654e52eefc42fb0e6d47ba94c1f0cfa92ae1e4c46ba28ea55e', 377, 1, 'user', '[]', 0, '2019-10-29 09:23:56', '2019-10-29 09:23:56', '2020-10-29 09:23:56'),
('9414eb80525ebe8dcc3036e481a61a048efe61774013231bead237e6d9f2f4396287544cc64abe4c', 368, 1, 'user', '[]', 1, '2019-10-30 04:46:23', '2019-10-30 04:46:23', '2020-10-30 04:46:23'),
('955b9aac59c5c9ffa0d826edb56c5aed765233be1140c879d751d9c9163e9e88ca26bb51777689e1', 387, 1, 'user', '[]', 0, '2019-10-30 06:52:06', '2019-10-30 06:52:06', '2020-10-30 06:52:06'),
('969682e6f7b2649f2e99565b5bab6f5d30acaa8ef76b0bf13b8112c991d4ba213ef5839f6d205911', 331, 1, 'user', '[]', 1, '2019-10-25 05:47:45', '2019-10-25 05:47:45', '2020-10-25 05:47:45'),
('9749de377d5ef75fb387a515ae3140bbfbcff263acce7deb11ba416629b2c247d949ad70517506dd', 338, 1, 'user', '[]', 0, '2019-10-25 06:58:43', '2019-10-25 06:58:43', '2020-10-25 06:58:43'),
('999efe31b6871f70b12bf0b391419c2d76564d9128dd0fb91ee3233172a011259c0c5c8f0b9bab0e', 385, 1, 'user', '[]', 0, '2019-10-30 05:54:32', '2019-10-30 05:54:32', '2020-10-30 05:54:32'),
('9aa95ea08fcad2cfd5f3522cbd00766213191117a9a06af717b4b6882e39d7b865a192b78bd9bc3f', 338, 1, 'user', '[]', 1, '2019-10-25 06:59:53', '2019-10-25 06:59:53', '2020-10-25 06:59:53'),
('9eb809da1cbfce9b431bbe8d566fe3bb4dfd08e07a36244fe1de3daee202b494122d0acdc374ece5', 386, 1, 'user', '[]', 0, '2019-10-30 06:48:02', '2019-10-30 06:48:02', '2020-10-30 06:48:02'),
('9fa7349e0d74e940170717cf1fd4db748de830064a5247532baf5d83728dfc5868188a83478727a1', 375, 1, 'user', '[]', 1, '2019-10-29 13:31:27', '2019-10-29 13:31:27', '2020-10-29 13:31:27'),
('a7e645c812f68292f525cfb20161f0c6c540a46579c1166a350e4c70503a87ecce5098dddc336ff1', 330, 1, 'user', '[]', 1, '2019-10-25 05:44:33', '2019-10-25 05:44:33', '2020-10-25 05:44:33'),
('abfc2ac419a73a597ac3f2dd00ba38a1a32a6a898bfeffc8d7d2d9c3bcc35be0bab16e6d9dadb7a3', 376, 1, 'user', '[]', 1, '2019-10-29 13:28:16', '2019-10-29 13:28:16', '2020-10-29 13:28:16'),
('acec245e5141e29d4f3e81f346c5c9a1f40b9fae4d515cc8dc1e5a5f1842a5cbed3bbea3e582814d', 335, 1, 'user', '[]', 0, '2019-10-25 06:50:01', '2019-10-25 06:50:01', '2020-10-25 06:50:01'),
('b1f07baec5712b83799188ea5ed70701f43851044f1b50dfd81d77409750599a8de245bbe502df71', 368, 1, 'user', '[]', 0, '2019-10-29 05:58:27', '2019-10-29 05:58:27', '2020-10-29 05:58:27'),
('b20603a06c18e65a6496cbde3dc0cc34a926314bcb25add8bed4fbc7f128819b1c042793372d8174', 341, 1, 'user', '[]', 0, '2019-10-25 08:21:23', '2019-10-25 08:21:23', '2020-10-25 08:21:23'),
('b316e9eb16f0e611b683a184e0172705d1fd4f9b72237fe580b8d908478796becd0313721bb1acc4', 368, 1, 'user', '[]', 1, '2019-10-30 05:32:17', '2019-10-30 05:32:17', '2020-10-30 05:32:17'),
('c97801a3f42c99c7feaa5d9b5ce34cf766b60a7a117ae04e1a6f90458e0a6785c2e5c0a77ba1b22a', 329, 1, 'user', '[]', 1, '2019-10-25 05:55:57', '2019-10-25 05:55:57', '2020-10-25 05:55:57'),
('cb654d9822fb02f2306472859b57cdbcbd87d954a593062f8f6a717c61e8f4e8d9b4f3d1635e1e61', 335, 1, 'user', '[]', 0, '2019-10-25 06:45:01', '2019-10-25 06:45:01', '2020-10-25 06:45:01'),
('cd9a42a1882a45aad056f8b8f8d41a319423cf092125b1236361181312098f23c8cb07ee204cb9c4', 386, 1, 'user', '[]', 1, '2019-10-30 06:49:10', '2019-10-30 06:49:10', '2020-10-30 06:49:10'),
('d8c0cc2f160eefe2522afa6f52254d4e159b504d24ac5cae157b8808f4b9b2a5da176522c65eb3de', 368, 1, 'user', '[]', 0, '2019-10-29 05:57:44', '2019-10-29 05:57:44', '2020-10-29 05:57:44'),
('dad302235b118529aa0b50ccd085e6840ee1ed4a4062c120eb31a3b5bdfa0b419833b4a1641c4a9a', 333, 1, 'user', '[]', 0, '2019-10-25 06:01:21', '2019-10-25 06:01:21', '2020-10-25 06:01:21'),
('db7aa8c3cd36b27b54f9d3dc572e6409d14f4fde62c9d1a446c2320d52c97b9d0bf50da5b1c2b467', 368, 1, 'user', '[]', 0, '2019-10-29 10:32:31', '2019-10-29 10:32:31', '2020-10-29 10:32:31'),
('e413ffc5684582db76a6f9a33baf279fd9d7f42b8ef80c03637dc037aa5dce381923a0b7e822a9c4', 334, 1, 'user', '[]', 1, '2019-10-25 06:30:06', '2019-10-25 06:30:06', '2020-10-25 06:30:06'),
('e61bd15c23dca62ea0254ae0ea3cbce52aa0385d1dca73d35f092e6d8677c593afe292716c318604', 341, 1, 'user', '[]', 0, '2019-10-25 08:22:23', '2019-10-25 08:22:23', '2020-10-25 08:22:23'),
('ece194c482f24f2d9d9842c18901a7bb137fa669d64f8260552bc86dbed3319c825da6b76ee0d12b', 374, 1, 'user', '[]', 0, '2019-10-29 06:45:23', '2019-10-29 06:45:23', '2020-10-29 06:45:23'),
('f995e02e3438a0dc961ad0573ba66ce86a6f1cf60005ae521e144fc56eabb970d6db9e841c7a8924', 333, 1, 'user', '[]', 0, '2019-10-26 05:39:41', '2019-10-26 05:39:41', '2020-10-26 05:39:41'),
('fad4d23f8aa6c8bdf8336d8ff6fa6f1fe8e0a93148075f2f68a475dd4cddc0e0c941c024b770b535', 339, 1, 'user', '[]', 0, '2019-10-30 04:21:12', '2019-10-30 04:21:12', '2020-10-30 04:21:12');

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
(134, 375, 'testing with description', 'Cjfjfjfjfjftjjtj cfjfjfjf\nMvvmvmmv\nKfkkfkflvm\nCmckc', '1572418032.png', 0, 1, '2019-10-30 06:47:12', '2019-10-30 06:47:12');

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
(129, 375, 'texting', 'Cjcjfjfjf hvjvv\nJvvv', 1, '1572415199.png', '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Phase - I, Manimajra, Sukteri, Haryana 134114, India', '30.728087500000004', '76.84626953125004', 1, '56.00', 1, '0', '2019-10-30 05:59:59', '2019-10-30 05:59:59');

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
(75, 119, 375, 0, '2019-10-30 04:36:22', '2019-10-30 04:36:24');

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
(443, 372, '5db7e52da28f9a49d3a9feab', 1, '2019-10-29 07:07:30', '2019-10-29 07:07:30');

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
(2836, 204, 1);

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
(4570, 2836, 2);

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
(329, 'en', 'roman', 'roman', 'roman@mailinator.com', 1, 1, NULL, 22, '2019-10-25 05:40:14', NULL, '134, Lal Sai Mandir Marg, Block C1, Janakpuri, New Delhi, 110058, Delhi, India', '28.621104145449234', '77.08179666667904', '+1', '9999999999', '$2y$10$hLeSFjMVGsNmvh8WhUnvAeDNB9p3lWZUf.nZiebeN41GzqVwvGCk6', 'Friendship, No Expectation', 2, '25', NULL, NULL, NULL, 'italy', 'romn', 'romm', NULL, 'hhahahhhaa', 1, 1, 1, 3, 1, '4ff6d370f44a8454424ab36d9981c2964d17b4a053c88fe580a240c578d9d453', 2, NULL, NULL, '334,368', '333,336', NULL, '334,368', '333,336', 'german', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'GDLW4X', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 05:39:55', '2019-10-30 06:52:58', NULL, '98922268'),
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
(341, 'en', 'Love Push App', 'Tim Grm', 'lovepush.app@gmail.com', 1, 3, '117725717347872540357', 20, '2019-10-25 08:26:15', NULL, NULL, NULL, NULL, '+1', '1234567856', NULL, 'Friendship,Relationship', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '0DE2D6', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-25 08:21:23', '2019-10-25 08:26:15', NULL, '98927159'),
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
(368, 'en', 'manish015', 'manish12345', 'mmm@mailinator.com', 1, 1, NULL, 21, '2019-10-29 05:58:10', NULL, '20/19, Road Number 19, Central Government Staff Colony, Wadala West, Mumbai, 400031, Maharashtra, India', '19.0176147', '72.8561644', '+1', '54555545', '$2y$10$gW1X0KdabUaAkORoKQvjSOM3SAB6eDYj0eU6c0GbItfLZ3XHE9YLK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '329', '367,373,374,375,376', NULL, '329', '367,373,374,375,376', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'Q0WVMS', '', NULL, '0', '0', '1', '1', '0', '0', '2019-10-29 05:57:43', '2019-10-30 06:14:37', NULL, '99091148'),
(374, 'en', 'Manish kumar', 'hgg', 'manisfvh@mailinator.com', 3, 4, '5870085026', 25, NULL, NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.728058', '76.8462392', '+1', '9888889965', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, '368', NULL, NULL, '368', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'WEZQFY', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 06:45:08', '2019-10-29 06:47:30', NULL, '99092986'),
(375, 'en', 'Manish', 'manish12345678', 'manishpreet0186@gmail.com', 1, 2, '1120785261461977', 25, '2019-10-30 05:38:22', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280718', '76.8462602', '+1', '9885685699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '377', NULL, '368', '377', NULL, '368', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '7H21VV', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 06:49:36', '2019-10-30 06:51:20', NULL, '99093161'),
(376, 'en', 'Manish', 'rfggg', 'manish.sachtech@gmail.com', 3, 3, 'mj5AeHKSrzL2wTMJuSzsYRQDFP42', 19, '2019-10-29 01:28:16', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280572', '76.8462391', '+1', '6554555856', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 1, NULL, 1, NULL, NULL, NULL, '368', NULL, NULL, '368', NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '5RLWW2', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 07:03:43', '2019-10-29 13:28:23', NULL, '99093716'),
(377, 'en', 'Flutter', 'manishsingh', 'manish.preet0186@gmail.com', 1, 3, 'vmHHdKvQFyXfdW2MqpXufWGbGPU2', 21, '2019-10-29 09:23:38', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280571', '76.8462483', '+1', '646466464995', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, '375', NULL, NULL, '375,385', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'YDHFPC', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 09:23:38', '2019-10-30 05:56:58', NULL, '99099589'),
(378, 'en', 'info', NULL, 'info@hidden-audio.de', NULL, 1, NULL, NULL, NULL, 8853, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 12:41:33', '2019-10-29 12:41:33', 'web', ''),
(379, 'en', 'falconconstruction', NULL, 'falconconstruction@yahoo.com', NULL, 1, NULL, NULL, NULL, 1681, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 15:13:42', '2019-10-29 15:13:42', 'web', ''),
(380, 'en', 'Wittco50', NULL, 'Wittco50@gmail.com', NULL, 1, NULL, NULL, NULL, 6361, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 15:31:32', '2019-10-29 15:31:32', 'web', ''),
(381, 'en', 'mmiller', NULL, 'mmiller@legendfbo.com', NULL, 1, NULL, NULL, NULL, 7964, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 17:49:40', '2019-10-29 17:49:40', 'web', ''),
(382, 'en', 'turkibutt48', NULL, 'turkibutt48@cox.net', NULL, 1, NULL, NULL, NULL, 9249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 18:29:55', '2019-10-29 18:29:55', 'web', ''),
(383, 'en', 'fourgenaustin', NULL, 'fourgenaustin@yahoo.com', NULL, 1, NULL, NULL, NULL, 6312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 19:35:51', '2019-10-29 19:35:51', 'web', ''),
(384, 'en', 'tarableknight10', NULL, 'tarableknight10@yahoo.com', NULL, 1, NULL, NULL, NULL, 1127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '', NULL, NULL, '0', '1', '1', '1', '0', '0', '2019-10-29 23:53:20', '2019-10-29 23:53:20', 'web', ''),
(385, 'en', 'Ranjana', 'ranjana', 'ranjana2020rawat@gmail.com', 2, 3, 'KWaUItPJR4Vyi3prDZaRQPDGhDi1', 24, '2019-10-30 05:54:04', NULL, '2nd Floor, Tower B, Phase - I, Manimajra, Haryana, IT Park Rd, Manimajra, Haryana 134114, India', '30.7280823', '76.8462638', '+1', '6464589565', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '377', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '7TPIHW', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 05:54:04', '2019-10-30 06:22:35', NULL, ''),
(386, 'en', 'Harry', 'Harry sharma', 'iamhardiksharma94@gmail.com', 1, 1, NULL, 25, '2019-10-30 06:48:29', NULL, NULL, NULL, NULL, '+91', '8888888888', '$2y$10$/aYzXVkEwqiqZL8qqU81puvKGd7PcVbgJdxhVVZn.S8kcaAQgsODW', 'Relationship, Friendship, Daily Activities', 1, '7', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '4MJJF1', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 06:48:01', '2019-10-30 06:49:10', NULL, ''),
(387, 'en', 'happy', 'Happy sharma', 'sharmahardik980@gmail.com', 1, 1, NULL, 25, '2019-10-30 06:52:32', NULL, NULL, NULL, NULL, '+91', '8888888888', '$2y$10$niGubi/9bP9slPNLhFeaGeISxDUBqYn8yMDa32oP/z.Tg4pof5DMG', 'Relationship, Friendship, Daily Activities', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'english', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '5X7ECO', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-30 06:52:05', '2019-10-30 06:52:57', NULL, '');

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
(274, 333, '920021572068659.jpg', '2019-10-26 05:44:19', '2019-10-26 05:44:19');

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
(204, 385, '2019-10-30 06:26:59', '2019-10-30 06:26:59');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;
--
-- AUTO_INCREMENT for table `connect_requests`
--
ALTER TABLE `connect_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=872;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1846;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2330;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `post_ads`
--
ALTER TABLE `post_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `qb_chat_dialog_ids`
--
ALTER TABLE `qb_chat_dialog_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2837;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4571;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `test_scores`
--
ALTER TABLE `test_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;
--
-- AUTO_INCREMENT for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;
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
