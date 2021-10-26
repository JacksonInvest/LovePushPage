-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 17, 2019 at 12:41 PM
-- Server version: 5.7.26-0ubuntu0.16.04.1
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
(12, 1, 13),
(13, 1, 14),
(14, 1, 15),
(15, 1, 16),
(16, 1, 17),
(17, 1, 18),
(18, 2, 1),
(19, 2, 2),
(20, 2, 3),
(21, 2, 4),
(22, 2, 5),
(23, 2, 6),
(24, 2, 7),
(25, 2, 8),
(26, 2, 9),
(27, 2, 10),
(28, 2, 11),
(29, 2, 13),
(30, 2, 14),
(31, 2, 15),
(32, 2, 16),
(33, 2, 17),
(34, 2, 18),
(35, 3, 1),
(36, 3, 2),
(37, 3, 3),
(38, 3, 4),
(39, 3, 5),
(40, 3, 6),
(41, 3, 7),
(42, 3, 8),
(43, 3, 9),
(44, 3, 10),
(45, 3, 11),
(46, 3, 13),
(47, 3, 14),
(48, 3, 15),
(49, 3, 16),
(50, 3, 17),
(51, 3, 18);

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
(1, 1, 1),
(2, 2, 5),
(3, 3, 10),
(4, 4, 14),
(5, 5, 18),
(6, 5, 19),
(7, 6, 24),
(8, 6, 23),
(9, 7, 31),
(10, 7, 32),
(11, 7, 33),
(12, 8, 39),
(13, 8, 40),
(14, 9, 46),
(15, 10, 53),
(16, 11, 56),
(17, 12, 66),
(18, 12, 67),
(19, 12, 68),
(20, 13, 75),
(21, 14, 80),
(22, 14, 81),
(23, 14, 82),
(24, 15, 87),
(25, 16, 91),
(26, 17, 94),
(27, 18, 2),
(28, 19, 5),
(29, 20, 10),
(30, 21, 14),
(31, 22, 18),
(32, 22, 19),
(33, 23, 23),
(34, 23, 24),
(35, 24, 32),
(36, 24, 31),
(37, 24, 33),
(38, 25, 39),
(39, 25, 40),
(40, 26, 46),
(41, 27, 53),
(42, 28, 56),
(43, 29, 68),
(44, 29, 67),
(45, 29, 69),
(46, 30, 76),
(47, 31, 81),
(48, 31, 82),
(49, 31, 83),
(50, 32, 87),
(51, 33, 91),
(52, 34, 94),
(53, 35, 2),
(54, 36, 5),
(55, 37, 10),
(56, 38, 16),
(57, 39, 20),
(58, 39, 21),
(59, 40, 25),
(60, 40, 26),
(61, 41, 33),
(62, 41, 34),
(63, 41, 35),
(64, 42, 41),
(65, 42, 42),
(66, 43, 46),
(67, 44, 53),
(68, 45, 56),
(69, 46, 68),
(70, 46, 69),
(71, 46, 70),
(72, 47, 75),
(73, 48, 81),
(74, 48, 82),
(75, 48, 83),
(76, 49, 87),
(77, 50, 91),
(78, 51, 94);

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
(1, 1, 2, 20, 3, '20.00', '20.00', '20.00'),
(2, 1, 2, 21, 4, '20.00', '20.00', '20.00'),
(3, 1, 2, 22, 5, '80.00', '80.00', '80.00'),
(4, 1, 2, 23, 6, '40.00', '40.00', '40.00'),
(5, 1, 2, 24, 7, '60.00', '40.00', '40.00'),
(6, 1, 2, 25, 8, '40.00', '40.00', '40.00'),
(7, 1, 2, 26, 9, '3.00', '9.00', '3.00'),
(8, 1, 2, 27, 10, '20.00', '20.00', '20.00'),
(9, 1, 2, 28, 11, '20.00', '20.00', '20.00'),
(10, 1, 2, 29, 12, '45.00', '40.00', '40.00'),
(11, 1, 2, 30, 13, '5.00', '20.00', '5.00'),
(12, 1, 2, 31, 14, '50.00', '40.00', '40.00'),
(13, 1, 2, 32, 15, '20.00', '20.00', '20.00'),
(14, 1, 2, 33, 16, '20.00', '20.00', '20.00'),
(15, 1, 2, 34, 17, '20.00', '20.00', '20.00'),
(16, 2, 1, 3, 20, '20.00', '20.00', '20.00'),
(17, 2, 1, 4, 21, '20.00', '20.00', '20.00'),
(18, 2, 1, 5, 22, '80.00', '80.00', '80.00'),
(19, 2, 1, 6, 23, '40.00', '40.00', '40.00'),
(20, 2, 1, 7, 24, '60.00', '40.00', '40.00'),
(21, 2, 1, 8, 25, '40.00', '40.00', '40.00'),
(22, 2, 1, 9, 26, '3.00', '9.00', '3.00'),
(23, 2, 1, 10, 27, '20.00', '20.00', '20.00'),
(24, 2, 1, 11, 28, '20.00', '20.00', '20.00'),
(25, 2, 1, 12, 29, '45.00', '40.00', '40.00'),
(26, 2, 1, 13, 30, '5.00', '20.00', '5.00'),
(27, 2, 1, 14, 31, '45.00', '40.00', '40.00'),
(28, 2, 1, 15, 32, '20.00', '20.00', '20.00'),
(29, 2, 1, 16, 33, '20.00', '20.00', '20.00'),
(30, 2, 1, 17, 34, '20.00', '20.00', '20.00'),
(31, 1, 3, 37, 3, '20.00', '20.00', '20.00'),
(32, 1, 3, 38, 4, '5.00', '20.00', '5.00'),
(33, 1, 3, 39, 5, '20.00', '80.00', '20.00'),
(34, 1, 3, 40, 6, '10.00', '40.00', '10.00'),
(35, 1, 3, 41, 7, '30.00', '40.00', '30.00'),
(36, 1, 3, 42, 8, '20.00', '30.00', '20.00'),
(37, 1, 3, 43, 9, '3.00', '9.00', '3.00'),
(38, 1, 3, 44, 10, '20.00', '20.00', '20.00'),
(39, 1, 3, 45, 11, '20.00', '20.00', '20.00'),
(40, 1, 3, 46, 12, '30.00', '40.00', '30.00'),
(41, 1, 3, 47, 13, '5.00', '20.00', '5.00'),
(42, 1, 3, 48, 14, '50.00', '40.00', '40.00'),
(43, 1, 3, 49, 15, '20.00', '20.00', '20.00'),
(44, 1, 3, 50, 16, '20.00', '20.00', '20.00'),
(45, 1, 3, 51, 17, '20.00', '20.00', '20.00'),
(46, 2, 3, 37, 20, '20.00', '20.00', '20.00'),
(47, 2, 3, 38, 21, '5.00', '20.00', '5.00'),
(48, 2, 3, 39, 22, '20.00', '80.00', '20.00'),
(49, 2, 3, 40, 23, '10.00', '40.00', '10.00'),
(50, 2, 3, 41, 24, '30.00', '40.00', '30.00'),
(51, 2, 3, 42, 25, '20.00', '30.00', '20.00'),
(52, 2, 3, 43, 26, '3.00', '9.00', '3.00'),
(53, 2, 3, 44, 27, '20.00', '20.00', '20.00'),
(54, 2, 3, 45, 28, '20.00', '20.00', '20.00'),
(55, 2, 3, 46, 29, '45.00', '40.00', '40.00'),
(56, 2, 3, 47, 30, '5.00', '20.00', '5.00'),
(57, 2, 3, 48, 31, '60.00', '40.00', '40.00'),
(58, 2, 3, 49, 32, '20.00', '20.00', '20.00'),
(59, 2, 3, 50, 33, '20.00', '20.00', '20.00'),
(60, 2, 3, 51, 34, '20.00', '20.00', '20.00'),
(61, 3, 2, 20, 37, '20.00', '20.00', '20.00'),
(62, 3, 2, 21, 38, '5.00', '20.00', '5.00'),
(63, 3, 2, 22, 39, '20.00', '80.00', '20.00'),
(64, 3, 2, 23, 40, '10.00', '40.00', '10.00'),
(65, 3, 2, 24, 41, '30.00', '40.00', '30.00'),
(66, 3, 2, 25, 42, '20.00', '30.00', '20.00'),
(67, 3, 2, 26, 43, '3.00', '9.00', '3.00'),
(68, 3, 2, 27, 44, '20.00', '20.00', '20.00'),
(69, 3, 2, 28, 45, '20.00', '20.00', '20.00'),
(70, 3, 2, 29, 46, '45.00', '40.00', '40.00'),
(71, 3, 2, 30, 47, '5.00', '20.00', '5.00'),
(72, 3, 2, 31, 48, '60.00', '40.00', '40.00'),
(73, 3, 2, 32, 49, '20.00', '20.00', '20.00'),
(74, 3, 2, 33, 50, '20.00', '20.00', '20.00'),
(75, 3, 2, 34, 51, '20.00', '20.00', '20.00');

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
(1, 44, '2019-05-17 06:03:44', '2019-05-17 06:03:44'),
(2, 101, '2019-05-17 06:06:51', '2019-05-17 06:06:51'),
(3, 99, '2019-05-17 07:07:28', '2019-05-17 07:07:28');

--
-- Indexes for dumped tables
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
-- AUTO_INCREMENT for table `test_ques`
--
ALTER TABLE `test_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
