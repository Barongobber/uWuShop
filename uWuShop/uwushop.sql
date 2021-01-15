-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2021 at 03:31 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uwushop`
--

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `userid` int(11) NOT NULL,
  `username` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(130) CHARACTER SET latin1 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `phonenum` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(32) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`userid`, `username`, `name`, `email`, `address`, `phonenum`, `password`) VALUES
(1, 'shopper', 'shopper', 'shopper@shopper.com', 'shopper street', '028903', 'asu'),
(2, 'ruwet', 'ngelu', 'ngelu@tenan.com', 'mumet', '42069', 'nggliyeng'),
(3, 'wangkrik', 'jangkrik', 'mboh@jangkrik.com', 'jangkrikkrikkrik', '6942069', 'mboh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
