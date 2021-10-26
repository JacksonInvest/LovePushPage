-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 20, 2019 at 04:56 PM
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
(1, 1, 2, '365.75'),
(2, 1, 3, '398.00'),
(3, 1, 4, '265.75'),
(4, 2, 1, '365.75'),
(5, 2, 3, '375.75'),
(6, 2, 4, '338.00'),
(7, 3, 1, '398.00'),
(8, 3, 2, '375.75'),
(9, 3, 4, '265.75'),
(10, 4, 1, '270.75'),
(11, 4, 2, '343.00'),
(12, 4, 3, '270.75');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `test_scores`
--
ALTER TABLE `test_scores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `test_scores`
--
ALTER TABLE `test_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
