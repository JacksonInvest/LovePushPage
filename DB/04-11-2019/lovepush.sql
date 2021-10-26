-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 04, 2019 at 05:08 PM
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
(463, 403, 447, '0', '2019-11-01 04:43:15', '2019-11-01 04:43:15'),
(464, 403, 446, '0', '2019-11-01 04:43:15', '2019-11-01 04:43:15'),
(465, 404, 450, '0', '2019-11-02 19:51:54', '2019-11-02 19:51:54'),
(466, 404, 448, '0', '2019-11-02 19:51:54', '2019-11-02 19:51:54'),
(467, 405, 462, '0', '2019-11-04 14:59:36', '2019-11-04 14:59:36'),
(468, 405, 463, '0', '2019-11-04 14:59:36', '2019-11-04 14:59:36'),
(469, 406, 459, '0', '2019-11-04 15:11:09', '2019-11-04 15:11:09'),
(470, 406, 458, '0', '2019-11-04 15:11:10', '2019-11-04 15:11:10');

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
(899, 447, 446, 'A', '2019-10-31 09:56:52', '2019-10-31 09:57:35'),
(900, 450, 445, 'S', '2019-11-02 17:55:39', '2019-11-02 17:55:39'),
(901, 450, 447, 'S', '2019-11-02 17:55:43', '2019-11-02 17:55:43'),
(902, 450, 446, 'S', '2019-11-02 17:55:46', '2019-11-02 17:55:46'),
(903, 450, 449, 'S', '2019-11-02 17:55:47', '2019-11-02 17:55:47'),
(904, 450, 448, 'A', '2019-11-02 17:55:48', '2019-11-02 19:51:47'),
(905, 450, 453, 'S', '2019-11-03 16:51:50', '2019-11-03 16:51:50'),
(906, 456, 446, 'S', '2019-11-04 06:05:10', '2019-11-04 06:05:10'),
(907, 456, 445, 'S', '2019-11-04 06:05:11', '2019-11-04 06:05:11'),
(908, 456, 455, 'S', '2019-11-04 06:05:14', '2019-11-04 06:05:14'),
(909, 456, 447, 'S', '2019-11-04 06:05:15', '2019-11-04 06:05:15'),
(910, 456, 450, 'S', '2019-11-04 06:05:17', '2019-11-04 06:05:17'),
(911, 456, 453, 'S', '2019-11-04 06:05:19', '2019-11-04 06:05:19'),
(912, 456, 449, 'S', '2019-11-04 06:05:21', '2019-11-04 06:05:21'),
(913, 456, 448, 'S', '2019-11-04 06:05:22', '2019-11-04 06:05:22'),
(914, 459, 458, 'A', '2019-11-04 12:09:54', '2019-11-04 15:10:37'),
(915, 462, 463, 'A', '2019-11-04 14:43:59', '2019-11-04 14:59:20'),
(916, 465, 448, 'S', '2019-11-04 16:27:11', '2019-11-04 16:27:11'),
(917, 465, 458, 'A', '2019-11-04 16:27:12', '2019-11-04 16:46:02'),
(918, 465, 463, 'S', '2019-11-04 16:27:13', '2019-11-04 16:27:13'),
(919, 463, 459, 'S', '2019-11-04 16:44:58', '2019-11-04 16:44:58');

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
(1882, 453, 445, 0, '2019-11-03 15:09:10', '2019-11-03 15:09:10'),
(1883, 453, 446, 0, '2019-11-03 15:09:12', '2019-11-03 15:09:12'),
(1884, 453, 447, 0, '2019-11-03 15:09:12', '2019-11-03 15:09:12'),
(1885, 453, 450, 0, '2019-11-03 15:09:13', '2019-11-03 15:09:13'),
(1886, 453, 449, 0, '2019-11-03 15:09:13', '2019-11-03 15:09:13'),
(1887, 453, 448, 0, '2019-11-03 15:09:14', '2019-11-03 15:09:14'),
(1888, 457, 445, 0, '2019-11-04 08:03:46', '2019-11-04 08:03:46'),
(1889, 457, 455, 0, '2019-11-04 08:03:50', '2019-11-04 08:03:50'),
(1890, 457, 447, 0, '2019-11-04 08:05:26', '2019-11-04 08:05:26'),
(1891, 457, 456, 0, '2019-11-04 08:05:36', '2019-11-04 08:05:36'),
(1892, 457, 446, 0, '2019-11-04 08:05:37', '2019-11-04 08:05:37'),
(1893, 457, 453, 0, '2019-11-04 08:05:39', '2019-11-04 08:05:39'),
(1894, 457, 450, 0, '2019-11-04 08:05:40', '2019-11-04 08:05:40'),
(1895, 457, 449, 0, '2019-11-04 08:05:41', '2019-11-04 08:05:41'),
(1896, 457, 448, 0, '2019-11-04 08:05:42', '2019-11-04 08:05:42'),
(1897, 458, 446, 0, '2019-11-04 11:17:27', '2019-11-04 11:17:27'),
(1898, 458, 447, 1, '2019-11-04 11:17:28', '2019-11-04 11:17:28'),
(1899, 458, 445, 1, '2019-11-04 11:17:31', '2019-11-04 11:17:31'),
(1900, 458, 455, 0, '2019-11-04 11:18:07', '2019-11-04 11:18:07'),
(1901, 458, 453, 0, '2019-11-04 11:18:09', '2019-11-04 11:18:09'),
(1902, 458, 456, 0, '2019-11-04 11:18:11', '2019-11-04 11:18:11'),
(1903, 458, 450, 0, '2019-11-04 11:39:35', '2019-11-04 11:39:35'),
(1904, 458, 449, 0, '2019-11-04 11:39:36', '2019-11-04 11:39:36'),
(1905, 458, 448, 0, '2019-11-04 11:39:38', '2019-11-04 11:39:38'),
(1906, 459, 455, 0, '2019-11-04 12:13:09', '2019-11-04 12:13:09'),
(1907, 459, 446, 0, '2019-11-04 12:13:13', '2019-11-04 12:13:13'),
(1908, 459, 445, 0, '2019-11-04 12:13:14', '2019-11-04 12:13:14'),
(1909, 459, 447, 0, '2019-11-04 12:13:15', '2019-11-04 12:13:15'),
(1910, 459, 453, 0, '2019-11-04 12:13:17', '2019-11-04 12:13:17'),
(1911, 459, 456, 0, '2019-11-04 12:13:19', '2019-11-04 12:13:19'),
(1912, 462, 446, 0, '2019-11-04 14:20:55', '2019-11-04 14:20:55'),
(1913, 462, 447, 0, '2019-11-04 14:20:56', '2019-11-04 14:20:56'),
(1914, 462, 445, 0, '2019-11-04 14:20:57', '2019-11-04 14:20:57'),
(1915, 462, 455, 0, '2019-11-04 14:20:58', '2019-11-04 14:20:58'),
(1916, 462, 450, 0, '2019-11-04 14:20:59', '2019-11-04 14:20:59'),
(1917, 462, 456, 0, '2019-11-04 14:21:00', '2019-11-04 14:21:00'),
(1918, 462, 453, 0, '2019-11-04 14:21:02', '2019-11-04 14:21:02'),
(1919, 462, 459, 0, '2019-11-04 14:21:03', '2019-11-04 14:21:03'),
(1920, 462, 449, 0, '2019-11-04 14:21:03', '2019-11-04 14:21:03'),
(1921, 462, 448, 0, '2019-11-04 14:21:04', '2019-11-04 14:21:04'),
(1922, 462, 458, 0, '2019-11-04 14:21:05', '2019-11-04 14:21:05'),
(1923, 464, 445, 0, '2019-11-04 15:30:36', '2019-11-04 15:30:36'),
(1924, 464, 446, 0, '2019-11-04 15:30:37', '2019-11-04 15:30:37'),
(1925, 464, 455, 0, '2019-11-04 15:30:38', '2019-11-04 15:30:38'),
(1926, 464, 447, 0, '2019-11-04 15:30:44', '2019-11-04 15:30:44'),
(1927, 464, 453, 0, '2019-11-04 15:30:48', '2019-11-04 15:30:48'),
(1928, 464, 456, 0, '2019-11-04 15:30:55', '2019-11-04 15:30:55'),
(1929, 464, 450, 1, '2019-11-04 15:31:06', '2019-11-04 15:31:06'),
(1930, 464, 462, 0, '2019-11-04 15:31:07', '2019-11-04 15:31:07'),
(1931, 464, 459, 0, '2019-11-04 15:31:07', '2019-11-04 15:31:07'),
(1932, 464, 449, 0, '2019-11-04 15:31:08', '2019-11-04 15:31:08'),
(1933, 464, 448, 0, '2019-11-04 15:31:09', '2019-11-04 15:31:09'),
(1934, 464, 458, 0, '2019-11-04 15:31:09', '2019-11-04 15:31:09'),
(1935, 464, 463, 0, '2019-11-04 15:31:12', '2019-11-04 15:31:12'),
(1936, 462, 465, 0, '2019-11-04 16:23:53', '2019-11-04 16:23:53'),
(1937, 462, 464, 0, '2019-11-04 16:23:55', '2019-11-04 16:23:55'),
(1938, 465, 447, 1, '2019-11-04 16:26:02', '2019-11-04 16:26:02'),
(1939, 465, 446, 1, '2019-11-04 16:26:03', '2019-11-04 16:26:03'),
(1940, 465, 445, 1, '2019-11-04 16:26:04', '2019-11-04 16:26:04'),
(1941, 465, 455, 1, '2019-11-04 16:26:06', '2019-11-04 16:26:06'),
(1942, 465, 453, 1, '2019-11-04 16:26:07', '2019-11-04 16:26:07'),
(1943, 465, 464, 1, '2019-11-04 16:26:08', '2019-11-04 16:26:08'),
(1944, 465, 456, 1, '2019-11-04 16:26:12', '2019-11-04 16:26:12'),
(1945, 465, 450, 1, '2019-11-04 16:26:13', '2019-11-04 16:26:13'),
(1946, 465, 462, 1, '2019-11-04 16:26:15', '2019-11-04 16:26:15'),
(1947, 465, 459, 1, '2019-11-04 16:26:16', '2019-11-04 16:26:16'),
(1948, 465, 449, 1, '2019-11-04 16:26:17', '2019-11-04 16:26:17'),
(1949, 462, 465, 1, '2019-11-04 16:26:34', '2019-11-04 16:26:34'),
(1950, 463, 445, 0, '2019-11-04 16:42:44', '2019-11-04 16:42:44'),
(1951, 463, 446, 0, '2019-11-04 16:42:47', '2019-11-04 16:42:47'),
(1952, 463, 447, 0, '2019-11-04 16:43:40', '2019-11-04 16:43:40'),
(1953, 463, 455, 0, '2019-11-04 16:44:40', '2019-11-04 16:44:40'),
(1954, 463, 458, 0, '2019-11-04 16:44:48', '2019-11-04 16:44:48'),
(1955, 458, 462, 0, '2019-11-04 16:56:03', '2019-11-04 16:56:03'),
(1956, 458, 464, 1, '2019-11-04 16:56:10', '2019-11-04 16:56:10');

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
(403, 'C', 447, 446, 1, '2019-10-31 09:57:35', '2019-10-31 09:57:35'),
(404, 'C', 450, 448, 1, '2019-11-02 19:51:47', '2019-11-02 19:51:47'),
(405, 'C', 462, 463, 1, '2019-11-04 14:59:20', '2019-11-04 14:59:20'),
(406, 'C', 459, 458, 1, '2019-11-04 15:10:37', '2019-11-04 15:10:37'),
(407, 'L', 462, 465, 1, '2019-11-04 16:26:34', '2019-11-04 16:26:34'),
(408, 'C', 465, 458, 1, '2019-11-04 16:46:02', '2019-11-04 16:46:02');

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
(2411, 'S_C_R', 899, 447, 446, 0, 1, '2019-10-31 09:56:52', '2019-10-31 09:57:35'),
(2412, 'A_C_R', 899, 446, 447, 1, 0, '2019-10-31 09:57:35', '2019-10-31 09:57:35'),
(2413, 'S_C_R', 900, 450, 445, 1, 0, '2019-11-02 17:55:39', '2019-11-02 17:55:39'),
(2414, 'S_C_R', 901, 450, 447, 1, 0, '2019-11-02 17:55:43', '2019-11-02 17:55:43'),
(2415, 'S_C_R', 902, 450, 446, 1, 0, '2019-11-02 17:55:46', '2019-11-02 17:55:46'),
(2416, 'S_C_R', 903, 450, 449, 1, 0, '2019-11-02 17:55:47', '2019-11-02 17:55:47'),
(2417, 'S_C_R', 904, 450, 448, 0, 1, '2019-11-02 17:55:48', '2019-11-02 19:51:47'),
(2418, 'A_C_R', 904, 448, 450, 1, 1, '2019-11-02 19:51:47', '2019-11-03 16:51:38'),
(2419, 'S_C_R', 905, 450, 453, 1, 0, '2019-11-03 16:51:50', '2019-11-03 16:51:50'),
(2420, 'S_C_R', 906, 456, 446, 1, 0, '2019-11-04 06:05:10', '2019-11-04 06:05:10'),
(2421, 'S_C_R', 907, 456, 445, 1, 0, '2019-11-04 06:05:11', '2019-11-04 06:05:11'),
(2422, 'S_C_R', 908, 456, 455, 1, 0, '2019-11-04 06:05:14', '2019-11-04 06:05:14'),
(2423, 'S_C_R', 909, 456, 447, 1, 0, '2019-11-04 06:05:15', '2019-11-04 06:05:15'),
(2424, 'S_C_R', 910, 456, 450, 1, 0, '2019-11-04 06:05:17', '2019-11-04 06:05:17'),
(2425, 'S_C_R', 911, 456, 453, 1, 0, '2019-11-04 06:05:19', '2019-11-04 06:05:19'),
(2426, 'S_C_R', 912, 456, 449, 1, 0, '2019-11-04 06:05:21', '2019-11-04 06:05:21'),
(2427, 'S_C_R', 913, 456, 448, 1, 0, '2019-11-04 06:05:22', '2019-11-04 06:05:22'),
(2428, 'S_L_R', 1898, 458, 447, 1, 0, '2019-11-04 11:17:28', '2019-11-04 11:17:28'),
(2429, 'S_L_R', 1899, 458, 445, 1, 0, '2019-11-04 11:17:31', '2019-11-04 11:17:31'),
(2430, 'S_C_R', 914, 459, 458, 0, 1, '2019-11-04 12:09:54', '2019-11-04 15:10:37'),
(2431, 'S_C_R', 915, 462, 463, 0, 1, '2019-11-04 14:43:59', '2019-11-04 14:59:20'),
(2432, 'A_C_R', 915, 463, 462, 0, 1, '2019-11-04 14:59:20', '2019-11-04 14:59:36'),
(2433, 'A_C_R', 914, 458, 459, 1, 1, '2019-11-04 15:10:37', '2019-11-04 15:29:48'),
(2434, 'S_L_R', 1929, 464, 450, 1, 0, '2019-11-04 15:31:06', '2019-11-04 15:31:06'),
(2435, 'S_L_R', 1938, 465, 447, 1, 0, '2019-11-04 16:26:02', '2019-11-04 16:26:02'),
(2436, 'S_L_R', 1939, 465, 446, 1, 0, '2019-11-04 16:26:03', '2019-11-04 16:26:03'),
(2437, 'S_L_R', 1940, 465, 445, 1, 0, '2019-11-04 16:26:04', '2019-11-04 16:26:04'),
(2438, 'S_L_R', 1941, 465, 455, 1, 0, '2019-11-04 16:26:06', '2019-11-04 16:26:06'),
(2439, 'S_L_R', 1942, 465, 453, 1, 0, '2019-11-04 16:26:07', '2019-11-04 16:26:07'),
(2440, 'S_L_R', 1943, 465, 464, 1, 1, '2019-11-04 16:26:08', '2019-11-04 16:56:27'),
(2441, 'S_L_R', 1944, 465, 456, 1, 0, '2019-11-04 16:26:12', '2019-11-04 16:26:12'),
(2442, 'S_L_R', 1945, 465, 450, 1, 0, '2019-11-04 16:26:13', '2019-11-04 16:26:13'),
(2443, 'S_L_R', 1946, 465, 462, 0, 1, '2019-11-04 16:26:15', '2019-11-04 16:26:34'),
(2444, 'S_L_R', 1947, 465, 459, 1, 0, '2019-11-04 16:26:16', '2019-11-04 16:26:16'),
(2445, 'S_L_R', 1948, 465, 449, 1, 0, '2019-11-04 16:26:17', '2019-11-04 16:26:17'),
(2446, 'A_L_R', 1949, 462, 465, 0, 1, '2019-11-04 16:26:34', '2019-11-04 16:26:41'),
(2447, 'S_C_R', 916, 465, 448, 1, 0, '2019-11-04 16:27:11', '2019-11-04 16:27:11'),
(2448, 'S_C_R', 917, 465, 458, 0, 1, '2019-11-04 16:27:12', '2019-11-04 16:46:02'),
(2449, 'S_C_R', 918, 465, 463, 1, 0, '2019-11-04 16:27:13', '2019-11-04 16:27:13'),
(2450, 'S_C_R', 919, 463, 459, 1, 0, '2019-11-04 16:44:58', '2019-11-04 16:44:58'),
(2451, 'A_C_R', 917, 458, 465, 1, 1, '2019-11-04 16:46:02', '2019-11-04 17:07:40'),
(2452, 'S_L_R', 1956, 458, 464, 1, 1, '2019-11-04 16:56:10', '2019-11-04 16:56:27');

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
(2411, 1, 'Lehman has sent you Connect Request', '2019-10-31 09:56:52', '2019-10-31 09:56:52'),
(2411, 2, 'Lehman hat Ihnen eine Verbindungsanforderung gesendet.', '2019-10-31 09:56:52', '2019-10-31 09:56:52'),
(2412, 1, 'John Carter accepted a connect request.', '2019-10-31 09:57:35', '2019-10-31 09:57:35'),
(2412, 2, 'John Carter hat eine Verbindungsanforderung angenommen.', '2019-10-31 09:57:35', '2019-10-31 09:57:35'),
(2413, 1, 'Troxler has sent you Connect Request', '2019-11-02 17:55:39', '2019-11-02 17:55:39'),
(2413, 2, 'Troxler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-02 17:55:39', '2019-11-02 17:55:39'),
(2414, 1, 'Troxler has sent you Connect Request', '2019-11-02 17:55:43', '2019-11-02 17:55:43'),
(2414, 2, 'Troxler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-02 17:55:43', '2019-11-02 17:55:43'),
(2415, 1, 'Troxler has sent you Connect Request', '2019-11-02 17:55:46', '2019-11-02 17:55:46'),
(2415, 2, 'Troxler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-02 17:55:46', '2019-11-02 17:55:46'),
(2416, 1, 'Troxler has sent you Connect Request', '2019-11-02 17:55:47', '2019-11-02 17:55:47'),
(2416, 2, 'Troxler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-02 17:55:47', '2019-11-02 17:55:47'),
(2417, 1, 'Troxler has sent you Connect Request', '2019-11-02 17:55:48', '2019-11-02 17:55:48'),
(2417, 2, 'Troxler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-02 17:55:48', '2019-11-02 17:55:48'),
(2418, 1, 'Sidd accepted a connect request.', '2019-11-02 19:51:47', '2019-11-02 19:51:47'),
(2418, 2, 'Sidd hat eine Verbindungsanforderung angenommen.', '2019-11-02 19:51:47', '2019-11-02 19:51:47'),
(2419, 1, 'Troxler has sent you Connect Request', '2019-11-03 16:51:50', '2019-11-03 16:51:50'),
(2419, 2, 'Troxler hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-03 16:51:50', '2019-11-03 16:51:50'),
(2420, 1, 'White has sent you Connect Request', '2019-11-04 06:05:10', '2019-11-04 06:05:10'),
(2420, 2, 'White hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 06:05:10', '2019-11-04 06:05:10'),
(2421, 1, 'White has sent you Connect Request', '2019-11-04 06:05:11', '2019-11-04 06:05:11'),
(2421, 2, 'White hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 06:05:11', '2019-11-04 06:05:11'),
(2422, 1, 'White has sent you Connect Request', '2019-11-04 06:05:14', '2019-11-04 06:05:14'),
(2422, 2, 'White hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 06:05:14', '2019-11-04 06:05:14'),
(2423, 1, 'White has sent you Connect Request', '2019-11-04 06:05:15', '2019-11-04 06:05:15'),
(2423, 2, 'White hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 06:05:15', '2019-11-04 06:05:15'),
(2424, 1, 'White has sent you Connect Request', '2019-11-04 06:05:17', '2019-11-04 06:05:17'),
(2424, 2, 'White hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 06:05:17', '2019-11-04 06:05:17'),
(2425, 1, 'White has sent you Connect Request', '2019-11-04 06:05:19', '2019-11-04 06:05:19'),
(2425, 2, 'White hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 06:05:19', '2019-11-04 06:05:19'),
(2426, 1, 'White has sent you Connect Request', '2019-11-04 06:05:21', '2019-11-04 06:05:21'),
(2426, 2, 'White hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 06:05:21', '2019-11-04 06:05:21'),
(2427, 1, 'White has sent you Connect Request', '2019-11-04 06:05:22', '2019-11-04 06:05:22'),
(2427, 2, 'White hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 06:05:22', '2019-11-04 06:05:22'),
(2428, 1, 'V.Handel has sent you Date Request.', '2019-11-04 11:17:28', '2019-11-04 11:17:28'),
(2428, 2, 'V.Handel hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 11:17:28', '2019-11-04 11:17:28'),
(2429, 1, 'V.Handel has sent you Date Request.', '2019-11-04 11:17:31', '2019-11-04 11:17:31'),
(2429, 2, 'V.Handel hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 11:17:31', '2019-11-04 11:17:31'),
(2430, 1, 'Paulo Monteiro has sent you Connect Request', '2019-11-04 12:09:54', '2019-11-04 12:09:54'),
(2430, 2, 'Paulo Monteiro hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 12:09:54', '2019-11-04 12:09:54'),
(2431, 1, 'Zaib has sent you Connect Request', '2019-11-04 14:43:59', '2019-11-04 14:43:59'),
(2431, 2, 'Zaib hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 14:43:59', '2019-11-04 14:43:59'),
(2432, 1, 'Tim accepted a connect request.', '2019-11-04 14:59:20', '2019-11-04 14:59:20'),
(2432, 2, 'Tim hat eine Verbindungsanforderung angenommen.', '2019-11-04 14:59:20', '2019-11-04 14:59:20'),
(2433, 1, 'V.Handel accepted a connect request.', '2019-11-04 15:10:37', '2019-11-04 15:10:37'),
(2433, 2, 'V.Handel hat eine Verbindungsanforderung angenommen.', '2019-11-04 15:10:37', '2019-11-04 15:10:37'),
(2434, 1, 'Stockert has sent you Date Request.', '2019-11-04 15:31:06', '2019-11-04 15:31:06'),
(2434, 2, 'Stockert hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 15:31:06', '2019-11-04 15:31:06'),
(2435, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:02', '2019-11-04 16:26:02'),
(2435, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:02', '2019-11-04 16:26:02'),
(2436, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:03', '2019-11-04 16:26:03'),
(2436, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:03', '2019-11-04 16:26:03'),
(2437, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:04', '2019-11-04 16:26:04'),
(2437, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:04', '2019-11-04 16:26:04'),
(2438, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:06', '2019-11-04 16:26:06'),
(2438, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:06', '2019-11-04 16:26:06'),
(2439, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:07', '2019-11-04 16:26:07'),
(2439, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:07', '2019-11-04 16:26:07'),
(2440, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:08', '2019-11-04 16:26:08'),
(2440, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:08', '2019-11-04 16:26:08'),
(2441, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:12', '2019-11-04 16:26:12'),
(2441, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:12', '2019-11-04 16:26:12'),
(2442, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:13', '2019-11-04 16:26:13'),
(2442, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:13', '2019-11-04 16:26:13'),
(2443, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:15', '2019-11-04 16:26:15'),
(2443, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:15', '2019-11-04 16:26:15'),
(2444, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:16', '2019-11-04 16:26:16'),
(2444, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:16', '2019-11-04 16:26:16'),
(2445, 1, 'KL has sent you Date Request.', '2019-11-04 16:26:17', '2019-11-04 16:26:17'),
(2445, 2, 'KL hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:26:17', '2019-11-04 16:26:17'),
(2446, 1, 'Zaib has accepted your Date Request.', '2019-11-04 16:26:34', '2019-11-04 16:26:34'),
(2446, 2, 'Zaib hat Ihre Terminanfrage angenommen.', '2019-11-04 16:26:34', '2019-11-04 16:26:34'),
(2447, 1, 'KL has sent you Connect Request', '2019-11-04 16:27:11', '2019-11-04 16:27:11'),
(2447, 2, 'KL hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 16:27:11', '2019-11-04 16:27:11'),
(2448, 1, 'KL has sent you Connect Request', '2019-11-04 16:27:12', '2019-11-04 16:27:12'),
(2448, 2, 'KL hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 16:27:12', '2019-11-04 16:27:12'),
(2449, 1, 'KL has sent you Connect Request', '2019-11-04 16:27:13', '2019-11-04 16:27:13'),
(2449, 2, 'KL hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 16:27:13', '2019-11-04 16:27:13'),
(2450, 1, 'Tim has sent you Connect Request', '2019-11-04 16:44:58', '2019-11-04 16:44:58'),
(2450, 2, 'Tim hat Ihnen eine Verbindungsanforderung gesendet.', '2019-11-04 16:44:58', '2019-11-04 16:44:58'),
(2451, 1, 'V.Handel accepted a connect request.', '2019-11-04 16:46:02', '2019-11-04 16:46:02'),
(2451, 2, 'V.Handel hat eine Verbindungsanforderung angenommen.', '2019-11-04 16:46:02', '2019-11-04 16:46:02'),
(2452, 1, 'V.Handel has sent you Date Request.', '2019-11-04 16:56:10', '2019-11-04 16:56:10'),
(2452, 2, 'V.Handel hat Ihnen eine Terminanfrage gesendet.', '2019-11-04 16:56:10', '2019-11-04 16:56:10');

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
('01c7027f4c60ba5159edbed3a971b622fa511c05e3870b42c873ca3e7eb05d6d89296fa387f0602a', 448, 1, 'user', '[]', 0, '2019-11-02 15:04:58', '2019-11-02 15:04:58', '2020-11-02 15:04:58'),
('04bb46424143c77434d0b27be1d10f31f3727abf2f17a90ce22acb3b5e7dcf10efe851c759c01b77', 463, 1, 'user', '[]', 0, '2019-11-04 14:23:21', '2019-11-04 14:23:21', '2020-11-04 14:23:21'),
('0a052163928effb6bd1044a0a1fdd4e838e62dc4615b1aea81881640dbd31b5bec501fb4903bdda9', 459, 1, 'user', '[]', 0, '2019-11-04 11:16:12', '2019-11-04 11:16:12', '2020-11-04 11:16:12'),
('0cbcacf66df538a4043c00b8c55669437710ee77a89d728c202c677989d24035a2710cef8827abb0', 445, 1, 'user', '[]', 0, '2019-10-31 09:52:19', '2019-10-31 09:52:19', '2020-10-31 09:52:19'),
('0fce49ddb10731914a9dbcb488a8640b0c9efa732a00d4b333909a41f650b73681b7fb064b025f12', 448, 1, 'user', '[]', 0, '2019-11-02 15:08:05', '2019-11-02 15:08:05', '2020-11-02 15:08:05'),
('10b251c4ef05f4986de27a7955764b35f959b5a1bac5effa6d4fb86d920cbe1d4a4a8b091f019e61', 453, 1, 'user', '[]', 0, '2019-11-03 15:08:55', '2019-11-03 15:08:55', '2020-11-03 15:08:55'),
('127d6e0809b3a6e6a2e2f1697beca165aedfa2d7474a7217b6f5e0a41cbcb1d90015aacdb79d3053', 458, 1, 'user', '[]', 0, '2019-11-04 11:14:08', '2019-11-04 11:14:08', '2020-11-04 11:14:08'),
('191472b3c19e17e6571e92c577eb54680116ec72d4bcebb54db2a00fbc9c8fb4dfbd0355e0980ab9', 452, 1, 'user', '[]', 0, '2019-11-03 03:39:46', '2019-11-03 03:39:46', '2020-11-03 03:39:46'),
('1a4250c6efb84acb0367093fa2c34b8bbd1b85aab5c0fc71611d620b67045f4704123dd95f00fc7e', 465, 1, 'user', '[]', 0, '2019-11-04 16:24:00', '2019-11-04 16:24:00', '2020-11-04 16:24:00'),
('1f2e2838a9cbe4905c4d672cda417c76db2ee8379bc365f6f408aae98cde185cc67396d01060c957', 462, 1, 'user', '[]', 0, '2019-11-04 14:16:16', '2019-11-04 14:16:16', '2020-11-04 14:16:16'),
('27bba79495cb626c9e82aa7fa8caa1abfad2df8afd5cb9c1d42293e9607d588df40bd6c97ab433a6', 443, 1, 'user', '[]', 1, '2019-10-31 09:44:05', '2019-10-31 09:44:05', '2020-10-31 09:44:05'),
('2b21191d668f9316168895c829cbe2850dc9459df872b2ffe29899fd2eea63d958bf2ef05a4c0360', 459, 1, 'user', '[]', 0, '2019-11-04 12:08:41', '2019-11-04 12:08:41', '2020-11-04 12:08:41'),
('32e7b63fe09137f3806d9374e5b653567828f48e86e4b2e029efda86e01ecbf803ceb519dfe7cce0', 445, 1, 'user', '[]', 0, '2019-11-01 06:35:59', '2019-11-01 06:35:59', '2020-11-01 06:35:59'),
('389a31f5034d75368300807dce46762d2c86464eeec5dfd57ab54826e291e64bd90363b5e34c0e84', 444, 1, 'user', '[]', 0, '2019-10-31 09:44:28', '2019-10-31 09:44:28', '2020-10-31 09:44:28'),
('39f31e07bb1d3dc02e4ee5ef92aa458d6e61d06b1cb021e83e06968aa44f430acc3080b65f8ada3a', 446, 1, 'user', '[]', 0, '2019-10-31 09:57:28', '2019-10-31 09:57:28', '2020-10-31 09:57:28'),
('3cbd83d470102fdfd28830c883a11c72f884c8f5b2f0901a73062083d5d81942efa284ad29dfa116', 446, 1, 'user', '[]', 0, '2019-10-31 09:54:51', '2019-10-31 09:54:51', '2020-10-31 09:54:51'),
('43cf8a2cc13d9f74d1156cd5a489d4bf23613ec3b51973416240cfdc56ff1901b6af545e731e6af4', 443, 1, 'user', '[]', 1, '2019-10-31 09:38:17', '2019-10-31 09:38:17', '2020-10-31 09:38:17'),
('509e68ef74e7e76f4f2beeb589e9cd4983bd693d85e36c1aaa32854c4819c18262d0f6a131570d8a', 463, 1, 'user', '[]', 0, '2019-11-04 14:23:40', '2019-11-04 14:23:40', '2020-11-04 14:23:40'),
('51ab0a1cb0d8edf4e9e05a3d4d2bd695c040e8ff1b2816a95e642aa148a3382b80650ebbfa8fabf1', 449, 1, 'user', '[]', 1, '2019-11-02 15:03:48', '2019-11-02 15:03:48', '2020-11-02 15:03:48'),
('53547cb52973edb7f977adc2493c03db2f1c7fe8ed722e3d0895922ae41213ab43a952a021a3703b', 450, 1, 'user', '[]', 0, '2019-11-02 17:34:37', '2019-11-02 17:34:37', '2020-11-02 17:34:37'),
('5cac16dc1ea66b17d60cdd01c44832bf39c095ca5bbe5d2fcb932aabe44ee3a781848a98e43ff1c2', 457, 1, 'user', '[]', 0, '2019-11-04 08:02:11', '2019-11-04 08:02:11', '2020-11-04 08:02:11'),
('6309c28165f3f7f7f3d4a3e06f2ba6e5f946aa455f7e0748ca8a0d238cb4ab5617e660ba05ab3316', 462, 1, 'user', '[]', 0, '2019-11-04 14:19:00', '2019-11-04 14:19:00', '2020-11-04 14:19:00'),
('64ace1ea57e8d936d829f04f72a6629bf1f359bf7f125400788f5bcd5263d4d305198b81677b2548', 450, 1, 'user', '[]', 0, '2019-11-02 17:40:19', '2019-11-02 17:40:19', '2020-11-02 17:40:19'),
('658ccb697c2e27bb841d6ba6f61a8feb620d7093d2781600eaf738e75f6e5d52bcda592d0283ba9c', 461, 1, 'user', '[]', 0, '2019-11-04 14:00:57', '2019-11-04 14:00:57', '2020-11-04 14:00:57'),
('692197af446c1d4b1d18f420be22bdcc6102ec3a18ddd12773229c78557dc4fa2c31483e4d1b7190', 457, 1, 'user', '[]', 0, '2019-11-04 08:00:57', '2019-11-04 08:00:57', '2020-11-04 08:00:57'),
('6e3f84ed3eaef38b7292c3cc42ce612096560e35663edf5673a910b2021799fdd71d6f42608feb23', 446, 1, 'user', '[]', 1, '2019-11-01 04:43:10', '2019-11-01 04:43:10', '2020-11-01 04:43:10'),
('6e55bd5997cb638dce7e2343b1b814ff10a0786249bc34544d87e45c03b1dd0dc23ff0c1d90accfb', 448, 1, 'user', '[]', 0, '2019-11-02 15:07:18', '2019-11-02 15:07:18', '2020-11-02 15:07:18'),
('76be61e1a708229ee5e64347f63459b3d027169d6b2c6f07c865cfe6424756fed1bfa800100b9c32', 456, 1, 'user', '[]', 0, '2019-11-04 06:04:56', '2019-11-04 06:04:56', '2020-11-04 06:04:56'),
('79042078b34cc7a1b7d68a42d7e8d30f42ec48b44d88b36a75b957fde0a24970daa72fbe2a8cd64b', 448, 1, 'user', '[]', 0, '2019-11-02 15:07:54', '2019-11-02 15:07:54', '2020-11-02 15:07:54'),
('805141e1569fc299b0f53df53749f9fd5a981b36433165e49120872724b25e7532205ed7a0363437', 461, 1, 'user', '[]', 0, '2019-11-04 14:20:27', '2019-11-04 14:20:27', '2020-11-04 14:20:27'),
('875f98307ea7988d17dd57adbcc9835149a238080c97909d0f84284d37d1ccf48b0490243679509a', 451, 1, 'user', '[]', 0, '2019-11-03 03:35:23', '2019-11-03 03:35:23', '2020-11-03 03:35:23'),
('87993eb19ebfb2398512368afcdbb32376d7a29edf172f29abd1313fce991daba59d348e0b1d19ad', 459, 1, 'user', '[]', 0, '2019-11-04 12:06:27', '2019-11-04 12:06:27', '2020-11-04 12:06:27'),
('8986b6f40f27f59f0ddf652581f90264b2184238f677b01a5288128632b6089c3378206819301e15', 451, 1, 'user', '[]', 0, '2019-11-03 03:37:44', '2019-11-03 03:37:44', '2020-11-03 03:37:44'),
('8cebd3e2ea3dd804d0eb33a39aca6e75f3e65e755736f02ed5acd9dae22e42bda2e0d146823733d3', 456, 1, 'user', '[]', 0, '2019-11-04 06:01:20', '2019-11-04 06:01:20', '2020-11-04 06:01:20'),
('8ee66712b6a4f59ab2b024b3c23f12f83199fc0b0484446e6262ba8bcc56c4f1084f3f496071fe8d', 444, 1, 'user', '[]', 1, '2019-10-31 09:43:00', '2019-10-31 09:43:00', '2020-10-31 09:43:00'),
('93eda0fca0d9df852794f90efdc1a5a335190c66196bd63b4fcc1cd30f7bee524bbe0a1bac5744ba', 448, 1, 'user', '[]', 0, '2019-11-02 14:54:51', '2019-11-02 14:54:51', '2020-11-02 14:54:51'),
('97574afaeeb828245cf77213da19088691bdeb8cd7e5ecd5d05f5fa372216e753fcd8068fc63269d', 446, 1, 'user', '[]', 1, '2019-10-31 09:55:10', '2019-10-31 09:55:10', '2020-10-31 09:55:10'),
('9a3a055f935fe1161a5126f171efcff64c1568871b5cc3df11d4654d190a8475eaa3b2225e949178', 461, 1, 'user', '[]', 0, '2019-11-04 14:18:40', '2019-11-04 14:18:40', '2020-11-04 14:18:40'),
('9dbca649e94f4cbd621f7444080e8a3f510526255881057f1cfe81dc2bd58ff4aa978e8a86127614', 447, 1, 'user', '[]', 0, '2019-10-31 09:56:14', '2019-10-31 09:56:14', '2020-10-31 09:56:14'),
('a314d00c0924fe4c57abc1cc3a1585fdb7fafee950781c542febd913985376786a29f6ed3bcdc2db', 449, 1, 'user', '[]', 0, '2019-11-02 15:01:22', '2019-11-02 15:01:22', '2020-11-02 15:01:22'),
('a6bd61bcc408c59a3ed948c4b4e37f7b68543c0cb6e959dc8d9f5ea09386e66efe18bed04c4b590d', 461, 1, 'user', '[]', 0, '2019-11-04 14:19:42', '2019-11-04 14:19:42', '2020-11-04 14:19:42'),
('aca73dc8af357ba12f9d2d2d39902ece28d25ca1d36303c786742dd608b8306f65df9cb48d11e608', 464, 1, 'user', '[]', 0, '2019-11-04 15:28:09', '2019-11-04 15:28:09', '2020-11-04 15:28:09'),
('c13505d14a2d7c676f8133d88bcd36ad6e84b9ccd53f606dc2ece94f38e5065e88fa1ccf48556fb1', 455, 1, 'user', '[]', 0, '2019-11-04 04:57:37', '2019-11-04 04:57:37', '2020-11-04 04:57:37'),
('c1ddc95e981221067bc34a203a4524c8ee925780c69a635135d2f7b35fc7869d755b7dbe1d0dc0e9', 448, 1, 'user', '[]', 0, '2019-11-02 15:04:41', '2019-11-02 15:04:41', '2020-11-02 15:04:41'),
('c97a81c132b53fa9bc70f10c0ada14aae16832e92adf7e564e4879d97bee628f59959555465b793e', 454, 1, 'user', '[]', 0, '2019-11-03 21:00:23', '2019-11-03 21:00:23', '2020-11-03 21:00:23'),
('cc14387d855e320e170d41d273ed46a5ed6170847b99aa36cfe3697eb22c0b9def59024d970351f5', 444, 1, 'user', '[]', 0, '2019-10-31 09:42:26', '2019-10-31 09:42:26', '2020-10-31 09:42:26'),
('ceaf89fa67423c5968c111a7f9974998ae3ad63be308e2792e2bada17ef8c2a30a8cc9814e22ef1a', 445, 1, 'user', '[]', 1, '2019-10-31 09:53:18', '2019-10-31 09:53:18', '2020-10-31 09:53:18'),
('cee7647f3978f4fcaf6ff875166b314aa41f630a4a2f019a3b434dd9cfb76e3fb9119fe80ee0806a', 453, 1, 'user', '[]', 0, '2019-11-03 15:07:12', '2019-11-03 15:07:12', '2020-11-03 15:07:12'),
('d0c8ed1aae61b462b1dd8898e43674652d5046bd2e153f56ea3e88e78f0b3c57c976a1061bd99d62', 447, 1, 'user', '[]', 1, '2019-10-31 09:56:38', '2019-10-31 09:56:38', '2020-10-31 09:56:38'),
('d192e169a6d4da06034c252f492e4f4bed62ea891030f4b66d2ee6191f10215d85da79409b997991', 463, 1, 'user', '[]', 0, '2019-11-04 14:24:14', '2019-11-04 14:24:14', '2020-11-04 14:24:14'),
('d39cf0c667ca9f647b3a1b4db3acebc98fad35a427f7b635badc290a56680b5a48ef150c772cc1d5', 460, 1, 'user', '[]', 0, '2019-11-04 11:22:36', '2019-11-04 11:22:36', '2020-11-04 11:22:36'),
('d58ca66312dce4f5de00e41015215b93339b85c96472407a43f14adb110f64e60c893c4e0505c065', 465, 1, 'user', '[]', 0, '2019-11-04 16:20:29', '2019-11-04 16:20:29', '2020-11-04 16:20:29'),
('d8a41d3d881237bb71b6b0da2d9d51a33d20be487d2ea36ec473dfef24f9b8153f6378db995fa444', 464, 1, 'user', '[]', 0, '2019-11-04 15:30:25', '2019-11-04 15:30:25', '2020-11-04 15:30:25'),
('e0b89bfa7f094e4629a4ea24d2348976e2d9ea89bfad06f587fae05ddc50dca646d2411378cb5ee3', 443, 1, 'user', '[]', 0, '2019-10-31 09:36:40', '2019-10-31 09:36:40', '2020-10-31 09:36:40'),
('e876617e21b4fdf199798efad4b7da415da407b3ed38141ee5265f90a9ee0cb262566a084134ef61', 458, 1, 'user', '[]', 0, '2019-11-04 11:17:05', '2019-11-04 11:17:05', '2020-11-04 11:17:05'),
('e9b084724885885409fe3ac9923da29df5ee66effedbd774cb32165423f92347faa7cc3f273c6c40', 445, 1, 'user', '[]', 0, '2019-10-31 20:05:00', '2019-10-31 20:05:00', '2020-10-31 20:05:00'),
('f58c66f21720f4b948286cdfd774eb4dd3f659b14536a51ce3442ea1150e3bfc0683b3c18e3d43f9', 463, 1, 'user', '[]', 0, '2019-11-04 14:23:21', '2019-11-04 14:23:21', '2020-11-04 14:23:21'),
('fabe8b6f29b0c8c469fb6bd804ec2f271219c28ff90a4cc3ae394ad2630fb79e1ee6ce37c721fdef', 457, 1, 'user', '[]', 0, '2019-11-04 08:02:57', '2019-11-04 08:02:57', '2020-11-04 08:02:57');

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
(105, 150, 458, 1, '2019-11-04 16:55:29', '2019-11-04 16:55:29');

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
(461, 405, '5dc03ccba28f9a7a4ba9feab', 1, '2019-11-04 14:59:36', '2019-11-04 14:59:36'),
(462, 406, '5dc03f7da0eb471ab190c415', 1, '2019-11-04 15:11:09', '2019-11-04 15:11:09');

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
(1, 'Sidd', 'want to work with this app', 'I want to work in all Europe \nPlz contact me', '2019-11-02 17:22:44', '2019-11-02 17:22:44');

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
(2863, 208, 1),
(2864, 208, 2),
(2865, 208, 3),
(2866, 208, 4),
(2867, 208, 5),
(2868, 208, 6),
(2869, 208, 7),
(2870, 208, 13);

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
(4613, 2863, 2),
(4614, 2863, 1),
(4615, 2864, 6),
(4616, 2865, 11),
(4617, 2866, 15),
(4618, 2867, 19),
(4619, 2867, 20),
(4620, 2868, 23),
(4621, 2868, 24),
(4622, 2869, 31),
(4623, 2869, 33),
(4624, 2869, 34),
(4625, 2870, 65),
(4626, 2870, 67),
(4627, 2870, 71);

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
(445, 'en', 'Devin', 'Devin', 'devin@mailinator.com', 1, 1, NULL, 22, '2019-10-31 09:52:27', NULL, NULL, NULL, NULL, '+1', '1234567894', '$2y$10$2ZcNHnEw5iqS13.72ZDQl.O8Qh.6PPGjiLK4Fb3plQ4SPoK8K5a/y', 'Relationship,Friendship,Daily Activities', 3, '25', NULL, NULL, NULL, 'Goa', 'SW', 'FDRT', NULL, 'IOPJIJDSg ds dfg', 1, 1, 1, 3, 1, '818d6f575837352e9ce297bed2cd488713cc73c2138eba7a2ce1bc76278c6fce', 2, NULL, NULL, NULL, NULL, '458,465', '450,456', NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'FQY0VS', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-31 09:52:19', '2019-11-04 16:26:04', NULL, '99208991'),
(446, 'en', 'John Carter', 'John', 'john@mailinator.com', 1, 1, NULL, 21, '2019-10-31 09:54:58', NULL, NULL, NULL, NULL, '+1', '1234567895', '$2y$10$1.oako3nORJb3wWOhqu42.BgvaxD/wGbI4ABTsStebHbjQsiz6We6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, '888671572515871.png', NULL, '447', NULL, '465', '447,450,456', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'MEGNWJ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-31 09:54:50', '2019-11-04 16:26:03', NULL, '99209095'),
(447, 'en', 'Lehman', 'Lehman', 'lehman@mailinator.com', 2, 1, NULL, 21, '2019-10-31 09:56:20', NULL, NULL, NULL, NULL, '+1', '1234567896', '$2y$10$/kDqrmkIk/zydrv1TjU5/uBNA1AxTVsW.edGMLv9KnaRHCAPcmQzS', 'No Expectation,Friendship', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 1, 3, 1, NULL, 2, '822231572515830.png', NULL, '446', NULL, '458,465', '446,450,456', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'T2RD0G', '', NULL, '0', '1', '1', '1', '0', '0', '2019-10-31 09:56:14', '2019-11-04 16:26:02', NULL, '99209152'),
(448, 'en', 'Sidd', 'Sidd', 'siddiquitareq@gmail.com', 1, 1, NULL, 22, '2019-11-02 03:05:56', NULL, 'Alfred Nobels allé 39B, 141 52 Huddinge, Sweden', '59.21580957232863', '17.936775914057456', '+46', '0700560177', '$2y$10$v5EEMEL7SujEIdtgoLUnguxfeUJu25yYz.oOfU0KIKl9/Cq1DwH1a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'god is real creator', 1, 1, 3, 3, 1, '1b6207d3772852e8e253ce04ae976d4758af084af73c00198f7a571eee0ccd3c', 2, '1572715283.png', NULL, '450', NULL, NULL, '450,456,465', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '1JQVK3', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-02 14:54:50', '2019-11-04 16:27:11', NULL, '99331817'),
(449, 'en', 'Siddiqui', 'Siddiqui', 'siddiqui@live.com', 1, 1, NULL, 24, '2019-11-02 03:01:54', NULL, 'Alfred Nobels allé 33C, 141 52 Huddinge, Sweden', '59.215769444583486', '17.93681795149715', '+46', '0767547044', '$2y$10$eLSGQqpAYw04/ko4crdMMuecGH6kLWr3oQPZXMVjFUPJXns9ZgiZC', 'Friendship,Daily Activities', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'About me', 1, 1, 3, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, '465', '450,456', NULL, 'English, Italian, Hindi, Urdu, Bangla', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'O7IMAP', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-02 15:01:22', '2019-11-04 16:26:17', NULL, '99331727'),
(450, 'en', 'Troxler', 'Jonny', 'begood_johny@ymail.com', 1, 1, NULL, 28, '2019-11-02 05:37:03', NULL, 'Isarstraße 4, 85368 Moosburg, Germany', '48.4657377582322', '11.949778304789398', '+1', '1514328876', '$2y$10$QPHn0hNvGPDIz5gwET2RcuNA/ITwVql6hNruRWZb7lAiHEVyw8Yza', 'Friendship,Daily Activities', 2, '188', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 3, 1, NULL, 2, '1572717329.png', NULL, '448', NULL, '464,465', '445,446,447,448,449,453,456', NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'PACVBI', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-02 17:34:36', '2019-11-04 16:26:13', NULL, '99340680'),
(451, 'en', '', 'khole300', 'kholeclark120@gmail.com', 2, 1, NULL, NULL, NULL, 8584, NULL, NULL, NULL, '+1', '(786) 383-0679', '$2y$10$o2ozXqrwSxEBis242M8W1Ontc0/UMSPeth106yvFZf9FzdOvK.HFS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, '86974e0338258c6464e06fe59507b5371fe27409769c2e032627efd8c667372f', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'LVYYHW', '75201', NULL, '0', '1', '1', '1', '0', '0', '2019-11-03 03:35:22', '2019-11-03 03:37:45', NULL, '99360020'),
(452, 'en', '', 'khole4', 'kholeclark150@gmail.com', 2, 1, NULL, NULL, NULL, 9416, NULL, NULL, NULL, '+234', '07030712093', '$2y$10$.r3zqeqnMntfsKKTC/T3tOebb9hwM3BCKg7u4Z1zkVM2NGTz2unH6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'R0UOTK', '75000', NULL, '0', '1', '1', '1', '0', '0', '2019-11-03 03:39:45', '2019-11-03 03:39:45', NULL, ''),
(453, 'de', 'Noa', 'Noa Stawicki', 'noastawicki@web.de', 2, 1, NULL, 25, '2019-11-03 03:07:27', NULL, 'Oberkochener Weg 4, 71229 Leonberg, Deutschland', '48.79084407822116', '8.9931233692998', '+1', '5735560136', '$2y$10$jz.O8u/FoewVgZJYi3HB7OyODzI5nruMLYVXihEcwpTsQ2tV.jdvC', 'Freundschaft,Tägliche Aktivitäten', 1, '1,70', NULL, NULL, NULL, NULL, 'Studentin', 'Fitness, Reisen, Fotografie', NULL, 'Über mich', 1, 1, 3, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, '445,446,447,448,449,450,465', '450,456', NULL, 'Deutsch', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'UPHCX8', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-03 15:07:11', '2019-11-04 16:26:07', NULL, '99384655'),
(454, 'en', '', 'laura9030', 'laurajames793@gmail.com', 2, 1, NULL, NULL, NULL, 4608, 'Lagos, Nigeria', '6.670177266939236', '3.4908089507403695', '+1', '9038584299', '$2y$10$A1gLfb1ez5u4te1Kenc9IOMMUsWA2Z2A/Jr.RFMyZ.fnkwQuSjLeK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'T32CZY', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-03 21:00:22', '2019-11-03 21:00:30', NULL, ''),
(455, 'en', '', 'Gona', 'Gona@mailinator.com', 1, 1, NULL, NULL, '2019-11-04 04:58:45', NULL, NULL, NULL, NULL, '+91', '4578895623142', '$2y$10$E70FAdy0VGN/WZ3nRN0lnuwhiEN72VEMbwn7yqcJdoWwzEUSCiPGG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 2, NULL, NULL, NULL, NULL, '465', '456', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'FA06RG', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 04:57:36', '2019-11-04 16:26:06', NULL, '99414496'),
(456, 'en', 'White', 'Jones', 'johny.remy@web.de', 1, 1, NULL, 28, '2019-11-04 06:03:20', NULL, 'Isarstraße 4, 85368 Moosburg an der Isar, Germany', '48.4658709', '11.9496508', '+49', '15143228687', '$2y$10$1MJO30rMWujeJIjkKEopQu8kFIsp.dEEIvvNtFQk57BaGsE34QQYS', 'Relationship, Friendship, Daily Activities', 0, '188', 0, NULL, NULL, 'Bali', NULL, 'Rowing', NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, '444171572847724.jpg', NULL, NULL, NULL, '465', '445,446,447,448,449,450,453,455', NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'VPISJQ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 06:01:20', '2019-11-04 16:26:12', NULL, '99417011'),
(457, 'en', 'Robert Prvcic', 'mr_robert_77', 'robert.prvcic@gmx.de', 1, 4, '2938156015', 42, NULL, NULL, 'Cappelstraße 54, 59555 Lippstadt, Deutschland', '51.6730004', '8.3430637', '+49', '01715382126', NULL, 'Relationship, Friendship', 1, '192', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '445,446,447,448,449,450,453,455,456', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'XVYTBS', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 08:00:57', '2019-11-04 08:05:42', NULL, '99422811'),
(458, 'en', 'V.Handel', 'Handel', 'vanesio_pv@hotmail.com', 1, 1, NULL, 27, '2019-11-04 11:15:44', NULL, 'Unnamed Road, 2840, Portugal', '38.6299953', '-9.0799695', '+351', '968397689', '$2y$10$B6WJpx8CyhJu3bko/XsyNu1F1veD2dpMBuodW.3ry82.1XvZjWdGi', 'Friendship', NULL, '1.89', NULL, NULL, NULL, 'Italia', NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '459,465', NULL, '445,446,447,448,449,450,453,455,456,462,464', '459,465', NULL, 'inglish, portuguese', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'RT1FLJ', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 11:14:08', '2019-11-04 16:56:10', NULL, '99432271'),
(459, 'en', 'Paulo Monteiro', 'paulo', 'pauloricardomonteiro89@gmail.com', 1, 1, NULL, 30, '2019-11-04 12:07:24', NULL, '233-237 Roundhay Road, Leeds LS8 4HS, UK', '53.816415199999994', '-1.5176897', '+44', '+075936261', '$2y$10$8NcJ4Tf/ZxbI02bfDYchgubfLbwO3qms.Q.70BSZQFBwzzWj990K6', 'No Expectation', 2, '1.85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, '458', NULL, '445,446,447,453,455,456,465', '458,463', NULL, 'Portuguese, English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'EESRPI', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 11:16:12', '2019-11-04 16:44:58', NULL, '99433878'),
(460, 'en', '', 'paulo89', 'pauloricardomonteiro89@gmail.com', 1, 1, NULL, NULL, NULL, 5540, NULL, NULL, NULL, '+44', '+07593626126', '$2y$10$1RiZ1GYAzW6u54k0APdzQ.EHfc2f2uODZrkKIbXUoI2O5STKPYL72', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, '5DBIEC', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 11:22:36', '2019-11-04 11:22:36', NULL, ''),
(461, 'en', 'Ingrid M.', 'ingridM', 'flaviamoldo96@gmail.com', 2, 4, '276726279', 23, NULL, NULL, NULL, NULL, NULL, '+49', '1738106166', NULL, 'Friendship, Daily Activities, No Expectation', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'English', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'RNAOCB', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 14:00:57', '2019-11-04 14:20:27', NULL, '99437233'),
(462, 'en', 'Zaib', 'Zaib rajput', 'Hellzone302@gmail.com', 1, 1, NULL, 20, '2019-11-04 02:16:55', NULL, 'Buriani Roffeni, Via S. Felice, 40122 Bologna BO, Italy', '44.496538923109156', '11.335574925763673', '+1', '', '$2y$10$CN0gvp52.5c.b/kJInPCkOw8YmpVNsvaTvyU60HUirnlREwp14RCu', 'Relationship, Friendship', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'My attitude is a result of your action so if u don\'t like my attitude blame 😜😜😜', 1, 1, NULL, 3, 1, NULL, 1, '712661572877195.jpg', '465', '463', NULL, '445,446,447,448,449,450,453,455,456,458,459,464,465', '463', NULL, 'Urdu Hindi English . German', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'YMZKZA', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 14:16:13', '2019-11-04 16:26:34', NULL, '99437673'),
(463, 'en', 'Tim', 'Createffect', 'tim.leube@gmx.de', 1, 2, '637955793388635', 25, '2019-11-04 02:23:21', NULL, 'Calle Paseo Kuka 27, Holbox, Q.R., Mexico', '21.5262019', '-87.3739937', '+1', '5418418923', NULL, 'No Expectation', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Go Pro 💎', 1, 1, 1, 3, 1, NULL, 1, '333531572877534.jpg', NULL, '462', NULL, '445,446,447,455,458', '459,462,465', NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'OKPFFK', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 14:23:21', '2019-11-04 16:44:58', NULL, '99437844'),
(464, 'en', 'Stockert', 'Stocky', 'msstockert@googlemail.com', 1, 1, NULL, 30, '2019-11-04 03:29:09', NULL, 'Im Vorderen Burgfeld 16, 74348 Lauffen am Neckar, Germany', '49.0740546', '9.1785168', '+49', '1621385758', '$2y$10$1ABkaZvLeZ7gtIZn4UntS.lUXTrlV1Rkv/iivY21LtFsZljRzMKD6', 'Relationship, Friendship', 1, NULL, NULL, NULL, NULL, 'Alles außer Baden Württemberg und Frankreich', NULL, NULL, NULL, NULL, 1, 1, 1, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '445,446,447,448,449,450,453,455,456,458,459,462,463,465', NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'QTSRNR', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 15:28:08', '2019-11-04 16:56:27', NULL, '99440169'),
(465, 'de', 'KL', '2XD4U', '2xd4u@carshop.de', 1, 1, NULL, 52, '2019-11-04 04:21:31', NULL, 'Am Bangraben 23, 72336 Balingen, Deutschland', '48.29154635677865', '8.84757117057401', '+49', '1739820000', '$2y$10$vyMsD899GORIiZnxIhqZt.02Sv3Ir9dhZ6fprUBzI5od8euBlZZCy', 'Keine Erwartung', 3, '181', NULL, NULL, NULL, 'North America', 'CEO', 'Skiing, Travelling, Golf', NULL, 'Über mich', 1, 1, 3, 3, 1, NULL, 2, NULL, '462', '458', NULL, '445,446,447,449,450,453,455,456,459,462,464', '448,458,463', NULL, 'German, English, French', 2, NULL, NULL, 1, NULL, NULL, 0, NULL, 'CCWAMK', '', NULL, '0', '1', '1', '1', '0', '0', '2019-11-04 16:20:28', '2019-11-04 16:46:02', NULL, '99443187');

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
(284, 447, '822231572515830.png', '2019-10-31 09:57:10', '2019-10-31 09:57:10'),
(285, 446, '888671572515871.png', '2019-10-31 09:57:51', '2019-10-31 09:57:51'),
(286, 450, '404121572717318.png', '2019-11-02 17:55:18', '2019-11-02 17:55:18'),
(287, 456, '444171572847724.jpg', '2019-11-04 06:08:44', '2019-11-04 06:08:44'),
(288, 462, '712661572877195.jpg', '2019-11-04 14:19:55', '2019-11-04 14:19:55'),
(289, 463, '333531572877534.jpg', '2019-11-04 14:25:34', '2019-11-04 14:25:34');

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
(208, 450, '2019-11-02 17:56:30', '2019-11-02 17:56:30');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;
--
-- AUTO_INCREMENT for table `connect_requests`
--
ALTER TABLE `connect_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=920;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1957;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2453;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `post_ads`
--
ALTER TABLE `post_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `qb_chat_dialog_ids`
--
ALTER TABLE `qb_chat_dialog_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=463;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `test_ques`
--
ALTER TABLE `test_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2871;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4628;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=466;
--
-- AUTO_INCREMENT for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
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
