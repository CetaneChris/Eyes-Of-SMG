-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2018 at 11:14 PM
-- Server version: 5.7.14-log
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seniordesign`
--
CREATE DATABASE IF NOT EXISTS `seniordesign` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `seniordesign`;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `D_ID` int(11) NOT NULL,
  `ROOM_ID` int(11) NOT NULL,
  `LOCATION_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `MESSAGE` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`ID`, `MESSAGE`) VALUES
(1, 'Ads'),
(2, 'Movie'),
(3, 'Cleaning');

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `ID` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`ID`, `STATUS`) VALUES
(1, 1),
(2, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE USER 'SeniorDesign'@'%' IDENTIFIED WITH mysql_native_password AS '***';GRANT USAGE ON *.* TO 'SeniorDesign'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT SELECT, INSERT, UPDATE, DELETE ON `seniordesign`.* TO 'SeniorDesign'@'%';