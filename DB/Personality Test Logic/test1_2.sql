-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 17, 2019 at 11:41 AM
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
(34, 2, 18);

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
(52, 34, 94);

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
(30, 2, 1, 17, 34, '20.00', '20.00', '20.00');

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
(2, 101, '2019-05-17 06:06:51', '2019-05-17 06:06:51');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
