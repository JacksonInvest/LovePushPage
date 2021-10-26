-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 15, 2019 at 01:32 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
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
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 2, 1),
(20, 2, 2),
(21, 2, 3),
(22, 2, 4),
(23, 2, 5),
(24, 2, 6),
(25, 2, 7),
(26, 2, 8),
(27, 2, 9),
(28, 2, 10),
(29, 2, 11),
(30, 2, 12),
(31, 2, 13),
(32, 2, 14),
(33, 2, 15),
(34, 2, 16),
(35, 2, 17);

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
(1, 1, 2),
(2, 2, 4),
(3, 3, 12),
(4, 4, 15),
(5, 5, 20),
(6, 5, 21),
(7, 6, 24),
(8, 6, 27),
(9, 7, 31),
(10, 7, 32),
(11, 7, 33),
(12, 8, 42),
(13, 8, 43),
(14, 9, 50),
(15, 10, 53),
(16, 11, 57),
(17, 12, 63),
(18, 13, 70),
(19, 13, 71),
(20, 13, 72),
(21, 14, 77),
(22, 15, 80),
(23, 15, 81),
(24, 15, 82),
(25, 16, 87),
(26, 17, 91),
(27, 18, 94),
(28, 19, 2),
(29, 20, 6),
(30, 21, 11),
(31, 22, 15),
(32, 23, 18),
(33, 23, 21),
(34, 24, 27),
(35, 24, 28),
(36, 25, 33),
(37, 25, 34),
(38, 25, 35),
(39, 26, 41),
(40, 26, 42),
(41, 27, 50),
(42, 28, 54),
(43, 29, 57),
(44, 30, 64),
(45, 31, 70),
(46, 31, 71),
(47, 31, 72),
(48, 32, 78),
(49, 33, 81),
(50, 33, 82),
(51, 33, 83),
(52, 34, 89),
(53, 35, 92);

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
(1, 2, 1, 19, 1, '0.00', '0.00', '0.00'),
(2, 2, 1, 20, 2, '0.00', '0.00', '0.00'),
(3, 2, 1, 21, 3, '5.00', '20.00', '5.00'),
(4, 2, 1, 22, 4, '20.00', '20.00', '20.00'),
(5, 2, 1, 23, 5, '60.00', '80.00', '60.00'),
(6, 2, 1, 24, 6, '25.00', '40.00', '25.00'),
(7, 2, 1, 25, 7, '60.00', '40.00', '40.00'),
(8, 2, 1, 26, 8, '25.00', '40.00', '25.00'),
(9, 2, 1, 27, 9, '3.00', '9.00', '3.00'),
(10, 2, 1, 28, 10, '5.00', '20.00', '5.00'),
(11, 2, 1, 29, 11, '20.00', '20.00', '20.00'),
(12, 2, 1, 30, 12, '5.00', '20.00', '5.00'),
(13, 2, 1, 31, 13, '450.00', '60.00', '60.00'),
(14, 2, 1, 32, 14, '0.00', '20.00', '0.00'),
(15, 2, 1, 33, 15, '345.00', '60.00', '60.00'),
(16, 2, 1, 34, 16, '0.00', '20.00', '0.00'),
(17, 2, 1, 35, 17, '10.00', '20.00', '10.00'),
(18, 1, 2, 1, 19, '0.00', '0.00', '0.00'),
(19, 1, 2, 2, 20, '0.00', '0.00', '0.00'),
(20, 1, 2, 3, 21, '5.00', '20.00', '5.00'),
(21, 1, 2, 4, 22, '20.00', '20.00', '20.00'),
(22, 1, 2, 5, 23, '60.00', '80.00', '60.00'),
(23, 1, 2, 6, 24, '25.00', '40.00', '25.00'),
(24, 1, 2, 7, 25, '140.00', '40.00', '40.00'),
(25, 1, 2, 8, 26, '25.00', '40.00', '25.00'),
(26, 1, 2, 9, 27, '3.00', '9.00', '3.00'),
(27, 1, 2, 10, 28, '5.00', '20.00', '5.00'),
(28, 1, 2, 11, 29, '20.00', '20.00', '20.00'),
(29, 1, 2, 12, 30, '5.00', '20.00', '5.00'),
(30, 1, 2, 13, 31, '450.00', '60.00', '60.00'),
(31, 1, 2, 14, 32, '0.00', '20.00', '0.00'),
(32, 1, 2, 15, 33, '405.00', '60.00', '60.00'),
(33, 1, 2, 16, 34, '0.00', '20.00', '0.00'),
(34, 1, 2, 17, 35, '10.00', '20.00', '10.00');

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
(1, 5, '2019-05-10 09:48:43', '2019-05-10 09:48:43'),
(2, 3, '2019-05-10 10:08:08', '2019-05-10 10:08:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oauth_clients`
--

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
-- Indexes for table `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--

--
-- AUTO_INCREMENT for table `test_ques`
--
ALTER TABLE `test_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
