-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 06, 2018 at 09:26 AM
-- Server version: 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

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
-- Table structure for table `ad_timestamps`
--

DROP TABLE IF EXISTS `ad_timestamps`;
CREATE TABLE IF NOT EXISTS `ad_timestamps` (
  `AD_ID` INT NOT NULL AUTO_INCREMENT,
  `THEATER_NUM` INT NOT NULL,
  `AD_COMP` varchar(100) NOT NULL,
  `AD_TIMESTAMP` time NOT NULL,
  PRIMARY KEY (`AD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_timestamps`
--

INSERT INTO `ad_timestamps` VALUES(1, 1, 'Coke', '00:00:00');
INSERT INTO `ad_timestamps` VALUES(2, 1, 'Pepsi', '00:02:38');
INSERT INTO `ad_timestamps` VALUES(3, 1, 'Best Buy', '00:04:56');
INSERT INTO `ad_timestamps` VALUES(4, 1, 'Target', '00:06:18');
INSERT INTO `ad_timestamps` VALUES(5, 1, 'WARNING', '00:08:00');
INSERT INTO `ad_timestamps` VALUES(6, 2, 'Coke', '00:00:00');
INSERT INTO `ad_timestamps` VALUES(7, 2, 'Pepsi', '00:02:38');
INSERT INTO `ad_timestamps` VALUES(8, 2, 'Best Buy', '00:04:56');
INSERT INTO `ad_timestamps` VALUES(9, 2, 'Target', '00:06:18');
INSERT INTO `ad_timestamps` VALUES(10, 2, 'WARNING', '00:08:00');
INSERT INTO `ad_timestamps` VALUES(11, 3, 'Coke', '00:00:00');
INSERT INTO `ad_timestamps` VALUES(12, 3, 'Pepsi', '00:02:38');
INSERT INTO `ad_timestamps` VALUES(13, 3, 'Best Buy', '00:04:56');
INSERT INTO `ad_timestamps` VALUES(14, 3, 'Target', '00:06:18');
INSERT INTO `ad_timestamps` VALUES(15, 3, 'WARNING', '00:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE IF NOT EXISTS `customer_info` (
  `cust_id` INT NOT NULL AUTO_INCREMENT,
  `cust_name` text NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
CREATE TABLE IF NOT EXISTS `devices` (
  `D_ID` INT NOT NULL AUTO_INCREMENT,
  `THEATER_NUM` INT NOT NULL,
  `LOCATION_ID` INT NOT NULL,
  PRIMARY KEY (`D_ID`),
  UNIQUE KEY `D_ID` (`D_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` VALUES(1, 1, 1);
INSERT INTO `devices` VALUES(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
CREATE TABLE IF NOT EXISTS `error_log` (
  `LOG_ID` INT NOT NULL AUTO_INCREMENT,
  `ERROR_TYPE` varchar(50) NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(150) NOT NULL,
  `TIME_FOUND` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `error_log`
--

INSERT INTO `error_log` VALUES(1, 'Missing Input', 'Ignored', 'Missing records detected between track record 1 and 3, ignored due to small impact', '2018-07-27 04:02:58');
INSERT INTO `error_log` VALUES(2, 'Missing Input', 'Ignored', 'Missing records detected between track record 2 and 4, ignored due to small impact', '2018-07-27 04:02:58');
INSERT INTO `error_log` VALUES(3, 'Missing Input', 'Ignored', 'Missing records detected between track record 14 and 16, ignored due to small impact', '2018-07-27 04:02:59');
INSERT INTO `error_log` VALUES(4, 'Missing Input', 'Ignored', 'Missing records detected between track record 28 and 29, ignored due to small impact', '2018-07-27 04:02:59');
INSERT INTO `error_log` VALUES(5, 'Stopped Input', 'Action Required', 'There is at least a 1-minute gap between track record 40 and 41, data input may have stopped', '2018-07-27 04:02:59');
INSERT INTO `error_log` VALUES(6, 'Missing Input', 'Ignored', 'Missing records detected between track record 64 and 65, ignored due to small impact', '2018-07-27 04:02:59');
INSERT INTO `error_log` VALUES(7, 'Missing Input', 'Ignored', 'Missing records detected between track record 73 and 74, ignored due to small impact', '2018-07-27 04:02:59');
INSERT INTO `error_log` VALUES(8, 'Stopped Input', 'Action Required', 'There is at least a 1-minute gap between track record 81 and 82, data input may have stopped', '2018-07-27 04:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_history`
--

DROP TABLE IF EXISTS `purchase_history`;
CREATE TABLE IF NOT EXISTS `purchase_history` (
  `trans_id` INT NOT NULL AUTO_INCREMENT,
  `t_num` INT NOT NULL,
  `cust_id` INT NOT NULL,
  `purchase_type` enum('FOOD','BEVERAGE','SIDE','') NOT NULL,
  `item` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_history`
--

INSERT INTO `purchase_history` VALUES(1, 2, 1, 'FOOD', 'BURGER', '2018-05-04 08:05:04');
INSERT INTO `purchase_history` VALUES(2, 1, 1, 'BEVERAGE', 'COORS', '2018-05-04 08:09:29');
INSERT INTO `purchase_history` VALUES(3, 2, 2, 'SIDE', 'POPCORN', '2018-05-04 08:13:13');
INSERT INTO `purchase_history` VALUES(4, 2, 2, 'BEVERAGE', 'COKE', '2018-05-04 08:18:36');
INSERT INTO `purchase_history` VALUES(5, 2, 3, 'BEVERAGE', 'SPRITE', '2018-05-04 08:22:36');
INSERT INTO `purchase_history` VALUES(6, 2, 3, 'FOOD', 'PIZZA', '2018-05-04 08:28:13');
INSERT INTO `purchase_history` VALUES(7, 2, 3, 'BEVERAGE', 'COORS', '2018-05-04 08:28:13');
INSERT INTO `purchase_history` VALUES(8, 2, 1, 'FOOD', 'BURGER', '2018-05-04 08:05:04');
INSERT INTO `purchase_history` VALUES(9, 2, 1, 'BEVERAGE', 'COORS', '2018-05-04 08:09:29');
INSERT INTO `purchase_history` VALUES(10, 2, 2, 'SIDE', 'POPCORN', '2018-05-04 08:13:13');
INSERT INTO `purchase_history` VALUES(11, 2, 2, 'BEVERAGE', 'COKE', '2018-05-04 08:18:36');
INSERT INTO `purchase_history` VALUES(12, 2, 3, 'BEVERAGE', 'SPRITE', '2018-05-04 08:22:36');
INSERT INTO `purchase_history` VALUES(13, 2, 3, 'FOOD', 'PIZZA', '2018-05-04 08:28:13');
INSERT INTO `purchase_history` VALUES(14, 2, 3, 'BEVERAGE', 'COORS', '2018-05-04 08:28:13');
INSERT INTO `purchase_history` VALUES(15, 2, 1, 'FOOD', 'BURGER', '2018-05-04 08:05:04');
INSERT INTO `purchase_history` VALUES(16, 2, 1, 'BEVERAGE', 'COORS', '2018-05-04 08:09:29');
INSERT INTO `purchase_history` VALUES(17, 1, 2, 'SIDE', 'POPCORN', '2018-05-04 08:13:13');
INSERT INTO `purchase_history` VALUES(18, 1, 2, 'BEVERAGE', 'COKE', '2018-05-04 08:18:36');
INSERT INTO `purchase_history` VALUES(19, 1, 3, 'BEVERAGE', 'SPRITE', '2018-05-04 08:22:36');
INSERT INTO `purchase_history` VALUES(20, 1, 3, 'FOOD', 'PIZZA', '2018-05-04 08:28:13');
INSERT INTO `purchase_history` VALUES(21, 1, 3, 'BEVERAGE', 'COORS', '2018-05-04 08:28:13');
INSERT INTO `purchase_history` VALUES(22, 1, 1, 'SIDE', 'PRETZEL', '2018-05-04 08:33:00');
INSERT INTO `purchase_history` VALUES(23, 3, 1, 'FOOD', 'BURGER', '2018-05-04 08:05:04');
INSERT INTO `purchase_history` VALUES(24, 3, 1, 'BEVERAGE', 'COORS', '2018-05-04 08:09:29');
INSERT INTO `purchase_history` VALUES(25, 3, 2, 'SIDE', 'POPCORN', '2018-05-04 08:13:13');
INSERT INTO `purchase_history` VALUES(26, 3, 2, 'BEVERAGE', 'COKE', '2018-05-04 08:18:36');
INSERT INTO `purchase_history` VALUES(27, 3, 3, 'BEVERAGE', 'SPRITE', '2018-05-04 08:22:36');
INSERT INTO `purchase_history` VALUES(28, 3, 3, 'FOOD', 'PIZZA', '2018-05-04 08:28:13');
INSERT INTO `purchase_history` VALUES(29, 3, 3, 'BEVERAGE', 'COORS', '2018-05-04 08:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `seat_history`
--

DROP TABLE IF EXISTS `seat_history`;
CREATE TABLE IF NOT EXISTS `seat_history` (
  `entry_id` INT NOT NULL AUTO_INCREMENT,
  `cust_id` INT NOT NULL,
  `seat_num` varchar(5) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seat_history`
--

INSERT INTO `seat_history` VALUES(1, 1, 'A1', '2018-05-04');
INSERT INTO `seat_history` VALUES(2, 1, 'C2', '2018-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `MESSAGE` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` VALUES(1, 'Ads');
INSERT INTO `status` VALUES(2, 'Movie');
INSERT INTO `status` VALUES(3, 'Cleaning');

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
CREATE TABLE IF NOT EXISTS `theaters` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `STATUS` INT NOT NULL,
  `MOVIE` varchar(10000) NOT NULL,
  `REMAINING_TIME` time NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` VALUES(6, 1, 'The Book of Life', '00:07:50');
INSERT INTO `theaters` VALUES(5, 3, 'Deadpool 2', '00:13:38');
INSERT INTO `theaters` VALUES(4, 2, 'Solo: A Star Wars Story', '02:19:00');
INSERT INTO `theaters` VALUES(3, 2, 'Hotel Artemis', '02:22:12');
INSERT INTO `theaters` VALUES(2, 3, 'Hereditary', '00:23:29');
INSERT INTO `theaters` VALUES(1, 1, 'Ocean\'s 8', '00:22:15');
INSERT INTO `theaters` VALUES(7, 3, 'Adrift', '00:07:28');
INSERT INTO `theaters` VALUES(8, 1, 'Upgrade', '00:15:29');
INSERT INTO `theaters` VALUES(9, 2, 'Action Point', '01:41:18');
INSERT INTO `theaters` VALUES(10, 3, 'Avengers: Infinity War', '00:17:32');
INSERT INTO `theaters` VALUES(11, 2, 'Show Dogs', '01:10:41');
INSERT INTO `theaters` VALUES(12, 1, 'Breaking In', '00:11:16');
INSERT INTO `theaters` VALUES(13, 2, 'Book Club', '02:54:07');
INSERT INTO `theaters` VALUES(14, 3, 'The Life of the Party', '00:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `track_eyes`
--

DROP TABLE IF EXISTS `track_eyes`;
CREATE TABLE IF NOT EXISTS `track_eyes` (
  `TRACK_ID` INT NOT NULL AUTO_INCREMENT,
  `THEATER_NUM` INT NOT NULL,
  `HAS_ATTENTION` INT NOT NULL,
  `TOTAL` INT NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SEATS_OCCUPIED` text NOT NULL,
  `SEATS_WATCHING` text NOT NULL,
  PRIMARY KEY (`TRACK_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_eyes`
--

INSERT INTO `track_eyes` VALUES(1, 1, 1, 1, '2018-05-04 08:00:00', '', '');
INSERT INTO `track_eyes` VALUES(3, 1, 3, 3, '2018-05-04 08:10:00', '', '');
INSERT INTO `track_eyes` VALUES(2, 1, 2, 3, '2018-05-04 08:05:00', '', '');
INSERT INTO `track_eyes` VALUES(4, 1, 5, 5, '2018-05-04 08:15:00', '', '');
INSERT INTO `track_eyes` VALUES(5, 1, 4, 5, '2018-05-04 08:20:00', '', '');
INSERT INTO `track_eyes` VALUES(6, 1, 6, 6, '2018-05-04 08:25:00', '', '');
INSERT INTO `track_eyes` VALUES(7, 1, 5, 6, '2018-05-04 08:30:00', '', '');
INSERT INTO `track_eyes` VALUES(8, 1, 5, 6, '2018-05-04 08:35:00', '', '');
INSERT INTO `track_eyes` VALUES(9, 1, 6, 8, '2018-05-04 08:40:00', '', '');
INSERT INTO `track_eyes` VALUES(10, 1, 7, 8, '2018-05-04 08:45:00', '', '');
INSERT INTO `track_eyes` VALUES(11, 1, 5, 8, '2018-05-04 08:50:00', '', '');
INSERT INTO `track_eyes` VALUES(12, 1, 5, 8, '2018-05-04 08:55:00', '', '');
INSERT INTO `track_eyes` VALUES(13, 1, 7, 8, '2018-05-04 09:00:00', '', '');
INSERT INTO `track_eyes` VALUES(15, 2, 2, 3, '2018-05-04 08:05:00', '', '');
INSERT INTO `track_eyes` VALUES(14, 2, 1, 1, '2018-05-04 08:00:00', '', '');
INSERT INTO `track_eyes` VALUES(16, 2, 3, 3, '2018-05-04 08:10:00', '', '');
INSERT INTO `track_eyes` VALUES(17, 2, 5, 5, '2018-05-04 08:15:00', '', '');
INSERT INTO `track_eyes` VALUES(18, 2, 4, 5, '2018-05-04 08:20:00', '', '');
INSERT INTO `track_eyes` VALUES(19, 2, 6, 6, '2018-05-04 08:25:00', '', '');
INSERT INTO `track_eyes` VALUES(20, 2, 5, 6, '2018-05-04 08:30:00', '', '');
INSERT INTO `track_eyes` VALUES(21, 2, 5, 6, '2018-05-04 08:35:00', '', '');
INSERT INTO `track_eyes` VALUES(22, 2, 6, 8, '2018-05-04 08:40:00', '', '');
INSERT INTO `track_eyes` VALUES(23, 2, 7, 8, '2018-05-04 08:45:00', '', '');
INSERT INTO `track_eyes` VALUES(24, 2, 5, 8, '2018-05-04 08:50:00', '', '');
INSERT INTO `track_eyes` VALUES(25, 2, 5, 8, '2018-05-04 08:55:00', '', '');
INSERT INTO `track_eyes` VALUES(26, 2, 7, 8, '2018-05-04 09:00:00', '', '');
INSERT INTO `track_eyes` VALUES(27, 3, 2, 3, '2018-05-04 08:05:00', '', '');
INSERT INTO `track_eyes` VALUES(28, 3, 1, 1, '2018-05-04 08:00:00', '', '');
INSERT INTO `track_eyes` VALUES(29, 3, 3, 3, '2018-05-04 08:10:00', '', '');
INSERT INTO `track_eyes` VALUES(30, 3, 5, 5, '2018-05-04 08:15:00', '', '');
INSERT INTO `track_eyes` VALUES(31, 3, 4, 5, '2018-05-04 08:20:00', '', '');
INSERT INTO `track_eyes` VALUES(32, 3, 6, 6, '2018-05-04 08:25:00', '', '');
INSERT INTO `track_eyes` VALUES(33, 3, 5, 6, '2018-05-04 08:30:00', '', '');
INSERT INTO `track_eyes` VALUES(34, 3, 5, 6, '2018-05-04 08:35:00', '', '');
INSERT INTO `track_eyes` VALUES(35, 3, 6, 8, '2018-05-04 08:40:00', '', '');
INSERT INTO `track_eyes` VALUES(36, 3, 7, 8, '2018-05-04 08:45:00', '', '');
INSERT INTO `track_eyes` VALUES(37, 3, 5, 8, '2018-05-04 08:50:00', '', '');
INSERT INTO `track_eyes` VALUES(38, 3, 5, 8, '2018-05-04 08:55:00', '', '');
INSERT INTO `track_eyes` VALUES(39, 3, 7, 8, '2018-05-04 09:00:00', '', '');
INSERT INTO `track_eyes` VALUES(40, 1, 5, 5, '2018-05-04 08:15:00', '', '');
INSERT INTO `track_eyes` VALUES(41, 1, 0, 0, '2018-07-24 15:57:35', '', '');
INSERT INTO `track_eyes` VALUES(42, 1, 0, 2, '2018-07-24 15:57:40', '', '');
INSERT INTO `track_eyes` VALUES(43, 1, 0, 1, '2018-07-24 15:57:45', '', '');
INSERT INTO `track_eyes` VALUES(44, 1, 0, 4, '2018-07-24 15:57:50', '', '');
INSERT INTO `track_eyes` VALUES(45, 1, 0, 10, '2018-07-24 15:57:55', '', '');
INSERT INTO `track_eyes` VALUES(46, 1, 0, 4, '2018-07-24 15:58:00', '', '');
INSERT INTO `track_eyes` VALUES(47, 1, 0, 2, '2018-07-24 15:58:05', '', '');
INSERT INTO `track_eyes` VALUES(48, 1, 0, 6, '2018-07-24 15:58:10', '', '');
INSERT INTO `track_eyes` VALUES(49, 1, 0, 4, '2018-07-24 15:58:15', '', '');
INSERT INTO `track_eyes` VALUES(50, 1, 0, 6, '2018-07-24 15:58:20', '', '');
INSERT INTO `track_eyes` VALUES(51, 1, 0, 3, '2018-07-24 15:58:25', '', '');
INSERT INTO `track_eyes` VALUES(52, 1, 0, 0, '2018-07-24 15:58:30', '', '');
INSERT INTO `track_eyes` VALUES(53, 1, 0, 2, '2018-07-24 15:58:35', '', '');
INSERT INTO `track_eyes` VALUES(54, 1, 0, 1, '2018-07-24 15:58:40', '', '');
INSERT INTO `track_eyes` VALUES(55, 1, 0, 2, '2018-07-24 15:58:45', '', '');
INSERT INTO `track_eyes` VALUES(56, 1, 0, 4, '2018-07-24 15:58:50', '', '');
INSERT INTO `track_eyes` VALUES(57, 1, 0, 4, '2018-07-24 15:58:55', '', '');
INSERT INTO `track_eyes` VALUES(58, 1, 0, 4, '2018-07-24 15:59:00', '', '');
INSERT INTO `track_eyes` VALUES(59, 1, 0, 4, '2018-07-24 15:59:05', '', '');
INSERT INTO `track_eyes` VALUES(60, 1, 0, 4, '2018-07-24 15:59:10', '', '');
INSERT INTO `track_eyes` VALUES(61, 1, 0, 2, '2018-07-24 15:59:15', '', '');
INSERT INTO `track_eyes` VALUES(62, 1, 0, 0, '2018-07-24 15:59:20', '', '');
INSERT INTO `track_eyes` VALUES(63, 1, 0, 1, '2018-07-24 15:59:25', '', '');
INSERT INTO `track_eyes` VALUES(64, 1, 0, 0, '2018-07-24 15:59:30', '', '');
INSERT INTO `track_eyes` VALUES(65, 1, 0, 0, '2018-07-24 16:12:25', '', '');
INSERT INTO `track_eyes` VALUES(66, 1, 0, 1, '2018-07-24 16:12:30', '', '');
INSERT INTO `track_eyes` VALUES(67, 1, 0, 4, '2018-07-24 16:12:35', '', '');
INSERT INTO `track_eyes` VALUES(68, 1, 0, 6, '2018-07-24 16:12:40', '', '');
INSERT INTO `track_eyes` VALUES(69, 1, 0, 3, '2018-07-24 16:12:45', '', '');
INSERT INTO `track_eyes` VALUES(70, 1, 0, 6, '2018-07-24 16:12:50', '', '');
INSERT INTO `track_eyes` VALUES(71, 1, 0, 6, '2018-07-24 16:15:17', '', '');
INSERT INTO `track_eyes` VALUES(72, 1, 0, 6, '2018-07-24 16:15:22', '', '');
INSERT INTO `track_eyes` VALUES(73, 1, 0, 6, '2018-07-24 16:15:27', '', '');
INSERT INTO `track_eyes` VALUES(74, 1, 0, 4, '2018-07-24 16:24:16', '', '');
INSERT INTO `track_eyes` VALUES(75, 1, 0, 6, '2018-07-24 16:24:41', '', '');
INSERT INTO `track_eyes` VALUES(76, 1, 0, 6, '2018-07-24 16:24:45', '', '');
INSERT INTO `track_eyes` VALUES(77, 1, 0, 0, '2018-07-24 16:24:51', '', '');
INSERT INTO `track_eyes` VALUES(78, 1, 0, 3, '2018-07-24 16:24:56', '', '');
INSERT INTO `track_eyes` VALUES(79, 1, 0, 2, '2018-07-24 16:25:00', '', '');
INSERT INTO `track_eyes` VALUES(80, 1, 0, 5, '2018-07-24 16:25:06', '', '');
INSERT INTO `track_eyes` VALUES(81, 1, 0, 5, '2018-07-24 16:25:11', '', '');
INSERT INTO `track_eyes` VALUES(82, 1, 0, 0, '2018-07-25 13:42:51', '', '');
INSERT INTO `track_eyes` VALUES(83, 1, 0, 2, '2018-07-25 13:42:56', '', '');
INSERT INTO `track_eyes` VALUES(84, 1, 0, 1, '2018-07-25 13:43:02', '', '');
INSERT INTO `track_eyes` VALUES(85, 1, 0, 2, '2018-07-25 13:43:06', '', '');
INSERT INTO `track_eyes` VALUES(86, 1, 0, 2, '2018-07-25 13:43:11', '', '');
INSERT INTO `track_eyes` VALUES(87, 1, 0, 2, '2018-07-25 13:43:16', '', '');
INSERT INTO `track_eyes` VALUES(88, 1, 0, 2, '2018-07-25 13:43:22', '', '');
INSERT INTO `track_eyes` VALUES(89, 1, 0, 7, '2018-07-25 13:43:26', '', '');
INSERT INTO `track_eyes` VALUES(90, 1, 0, 4, '2018-07-25 13:43:32', '', '');
INSERT INTO `track_eyes` VALUES(91, 1, 0, 6, '2018-07-25 13:43:36', '', '');
INSERT INTO `track_eyes` VALUES(92, 1, 0, 1, '2018-07-25 13:43:41', '', '');
INSERT INTO `track_eyes` VALUES(93, 1, 0, 3, '2018-07-25 13:43:47', '', '');
INSERT INTO `track_eyes` VALUES(94, 1, 0, 0, '2018-07-25 13:43:51', '', '');
INSERT INTO `track_eyes` VALUES(95, 1, 0, 10, '2018-07-25 13:43:56', '', '');
INSERT INTO `track_eyes` VALUES(96, 1, 0, 5, '2018-07-25 13:44:02', '', '');
INSERT INTO `track_eyes` VALUES(97, 1, 0, 2, '2018-07-25 13:44:06', '', '');
INSERT INTO `track_eyes` VALUES(98, 1, 0, 2, '2018-07-25 13:44:11', '', '');
INSERT INTO `track_eyes` VALUES(99, 1, 0, 2, '2018-07-25 13:44:17', '', '');
INSERT INTO `track_eyes` VALUES(100, 1, 0, 2, '2018-07-25 13:44:22', '', '');
INSERT INTO `track_eyes` VALUES(101, 1, 0, 2, '2018-07-25 13:44:26', '', '');
INSERT INTO `track_eyes` VALUES(102, 1, 0, 0, '2018-07-25 13:44:32', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
