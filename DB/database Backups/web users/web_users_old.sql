-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2019 at 01:06 PM
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
-- Table structure for table `web_users_old`
--

CREATE TABLE `web_users_old` (
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
-- Dumping data for table `web_users_old`
--

INSERT INTO `web_users_old` (`id`, `locale`, `name`, `gender`, `email`, `verification_code`, `status`, `email_verified_at`, `register_from`, `created_at`, `updated_at`) VALUES
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
-- Indexes for table `web_users_old`
--
ALTER TABLE `web_users_old`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `web_users_old`
--
ALTER TABLE `web_users_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
