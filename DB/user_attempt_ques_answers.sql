-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2019 at 12:57 PM
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
-- Table structure for table `user_attempt_ques_answers`
--

CREATE TABLE `user_attempt_ques_answers` (
  `id` int(11) NOT NULL,
  `user_attempt_ques_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_attempt_ques_answers`
--

INSERT INTO `user_attempt_ques_answers` (`id`, `user_attempt_ques_id`, `answer_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '2019-05-08 07:05:46', '2019-05-08 07:05:46'),
(2, 2, 13, '2019-05-08 07:16:25', '2019-05-08 07:16:25'),
(3, 3, 19, '2019-05-08 07:17:08', '2019-05-08 07:17:08'),
(4, 3, 20, '2019-05-08 07:17:08', '2019-05-08 07:17:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_attempt_ques_answers`
--
ALTER TABLE `user_attempt_ques_answers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_attempt_ques_answers`
--
ALTER TABLE `user_attempt_ques_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
