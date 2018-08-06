-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 06, 2018 at 01:34 PM
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
  `AD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `THEATER_NUM` int(11) NOT NULL,
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
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` text NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
CREATE TABLE IF NOT EXISTS `devices` (
  `D_ID` int(11) NOT NULL AUTO_INCREMENT,
  `THEATER_NUM` int(11) NOT NULL,
  `LOCATION_ID` int(11) NOT NULL,
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
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_num` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
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
  `entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
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
  `ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATUS` int(11) NOT NULL,
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
  `TRACK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `THEATER_NUM` int(11) NOT NULL,
  `HAS_ATTENTION` int(11) NOT NULL,
  `TOTAL` int(11) NOT NULL,
  `TIMESTAMP` int(11) NOT NULL,
  `SEATS_OCCUPIED` text NOT NULL,
  `SEATS_WATCHING` text NOT NULL,
  PRIMARY KEY (`TRACK_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_eyes`
--

INSERT INTO `track_eyes` VALUES(103, 1, 0, 1, 1533597841, ',9', '');
INSERT INTO `track_eyes` VALUES(104, 1, 0, 1, 1533597846, ',9', '');
INSERT INTO `track_eyes` VALUES(105, 1, 0, 2, 1533597851, ',7,9', '');
INSERT INTO `track_eyes` VALUES(106, 1, 0, 2, 1533597856, ',7,9', '');
INSERT INTO `track_eyes` VALUES(107, 1, 0, 3, 1533597861, ',7,9,10', '');
INSERT INTO `track_eyes` VALUES(108, 1, 0, 2, 1533597866, ',7,9', '');
INSERT INTO `track_eyes` VALUES(109, 1, 0, 2, 1533597871, ',7,9', '');
INSERT INTO `track_eyes` VALUES(110, 1, 0, 2, 1533597876, ',7,9', '');
INSERT INTO `track_eyes` VALUES(111, 1, 0, 2, 1533597881, ',7,9', '');
INSERT INTO `track_eyes` VALUES(112, 1, 0, 3, 1533597886, ',7,8,9', '');
INSERT INTO `track_eyes` VALUES(113, 1, 0, 2, 1533597891, ',7,9', '');
INSERT INTO `track_eyes` VALUES(114, 1, 0, 2, 1533597896, ',7,9', '');
INSERT INTO `track_eyes` VALUES(115, 1, 0, 2, 1533597901, ',7,9', '');
INSERT INTO `track_eyes` VALUES(116, 1, 0, 2, 1533597906, ',7,9', '');
INSERT INTO `track_eyes` VALUES(117, 1, 0, 2, 1533597911, ',7,9', '');
INSERT INTO `track_eyes` VALUES(118, 1, 0, 2, 1533597916, ',7,9', '');
INSERT INTO `track_eyes` VALUES(119, 1, 0, 2, 1533598057, '7,9', '');
INSERT INTO `track_eyes` VALUES(120, 1, 0, 2, 1533598062, '7,9', '');
INSERT INTO `track_eyes` VALUES(121, 1, 0, 2, 1533598067, '7,9', '');
INSERT INTO `track_eyes` VALUES(122, 1, 0, 2, 1533598072, '7,9', '');
INSERT INTO `track_eyes` VALUES(123, 1, 0, 2, 1533598077, '7,9', '');
INSERT INTO `track_eyes` VALUES(124, 1, 0, 2, 1533598082, '7,9', '');
INSERT INTO `track_eyes` VALUES(125, 1, 0, 2, 1533598087, '7,9', '');
INSERT INTO `track_eyes` VALUES(126, 1, 0, 3, 1533598092, '4,7,9', '');
INSERT INTO `track_eyes` VALUES(127, 1, 0, 3, 1533598097, '4,7,9', '');
INSERT INTO `track_eyes` VALUES(128, 1, 0, 2, 1533598102, '7,9', '');
INSERT INTO `track_eyes` VALUES(129, 1, 1, 3, 1533598107, '7,9,10', '10');
INSERT INTO `track_eyes` VALUES(130, 1, 0, 3, 1533598112, '7,9,10', '');
INSERT INTO `track_eyes` VALUES(131, 1, 0, 2, 1533598117, '7,9', '');
INSERT INTO `track_eyes` VALUES(132, 1, 1, 3, 1533598122, '7,8,9', '8');
INSERT INTO `track_eyes` VALUES(133, 1, 0, 2, 1533598127, '7,9', '');
INSERT INTO `track_eyes` VALUES(134, 1, 0, 2, 1533598132, '7,9', '');

-- --------------------------------------------------------

--
-- Table structure for table `track_eyes_backup`
--

DROP TABLE IF EXISTS `track_eyes_backup`;
CREATE TABLE IF NOT EXISTS `track_eyes_backup` (
  `TRACK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `THEATER_NUM` int(11) NOT NULL,
  `HAS_ATTENTION` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SEATS_OCCUPIED` text NOT NULL,
  `SEATS_WATCHING` text NOT NULL,
  PRIMARY KEY (`TRACK_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1080 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_eyes_backup`
--

INSERT INTO `track_eyes_backup` VALUES(1, 1, 1, 1, '2018-05-04 08:00:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(3, 1, 3, 3, '2018-05-04 08:10:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(2, 1, 2, 3, '2018-05-04 08:05:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(4, 1, 5, 5, '2018-05-04 08:15:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(5, 1, 4, 5, '2018-05-04 08:20:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(6, 1, 6, 6, '2018-05-04 08:25:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(7, 1, 5, 6, '2018-05-04 08:30:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(8, 1, 5, 6, '2018-05-04 08:35:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(9, 1, 6, 8, '2018-05-04 08:40:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(10, 1, 7, 8, '2018-05-04 08:45:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(11, 1, 5, 8, '2018-05-04 08:50:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(12, 1, 5, 8, '2018-05-04 08:55:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(13, 1, 7, 8, '2018-05-04 09:00:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(15, 2, 2, 3, '2018-05-04 08:05:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(14, 2, 1, 1, '2018-05-04 08:00:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(16, 2, 3, 3, '2018-05-04 08:10:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(17, 2, 5, 5, '2018-05-04 08:15:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(18, 2, 4, 5, '2018-05-04 08:20:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(19, 2, 6, 6, '2018-05-04 08:25:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(20, 2, 5, 6, '2018-05-04 08:30:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(21, 2, 5, 6, '2018-05-04 08:35:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(22, 2, 6, 8, '2018-05-04 08:40:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(23, 2, 7, 8, '2018-05-04 08:45:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(24, 2, 5, 8, '2018-05-04 08:50:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(25, 2, 5, 8, '2018-05-04 08:55:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(26, 2, 7, 8, '2018-05-04 09:00:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(27, 3, 2, 3, '2018-05-04 08:05:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(28, 3, 1, 1, '2018-05-04 08:00:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(29, 3, 3, 3, '2018-05-04 08:10:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(30, 3, 5, 5, '2018-05-04 08:15:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(31, 3, 4, 5, '2018-05-04 08:20:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(32, 3, 6, 6, '2018-05-04 08:25:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(33, 3, 5, 6, '2018-05-04 08:30:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(34, 3, 5, 6, '2018-05-04 08:35:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(35, 3, 6, 8, '2018-05-04 08:40:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(36, 3, 7, 8, '2018-05-04 08:45:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(37, 3, 5, 8, '2018-05-04 08:50:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(38, 3, 5, 8, '2018-05-04 08:55:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(39, 3, 7, 8, '2018-05-04 09:00:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(40, 1, 5, 5, '2018-05-04 08:15:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(41, 1, 0, 0, '2018-07-24 15:57:35', '', '');
INSERT INTO `track_eyes_backup` VALUES(42, 1, 0, 2, '2018-07-24 15:57:40', '', '');
INSERT INTO `track_eyes_backup` VALUES(43, 1, 0, 1, '2018-07-24 15:57:45', '', '');
INSERT INTO `track_eyes_backup` VALUES(44, 1, 0, 4, '2018-07-24 15:57:50', '', '');
INSERT INTO `track_eyes_backup` VALUES(45, 1, 0, 10, '2018-07-24 15:57:55', '', '');
INSERT INTO `track_eyes_backup` VALUES(46, 1, 0, 4, '2018-07-24 15:58:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(47, 1, 0, 2, '2018-07-24 15:58:05', '', '');
INSERT INTO `track_eyes_backup` VALUES(48, 1, 0, 6, '2018-07-24 15:58:10', '', '');
INSERT INTO `track_eyes_backup` VALUES(49, 1, 0, 4, '2018-07-24 15:58:15', '', '');
INSERT INTO `track_eyes_backup` VALUES(50, 1, 0, 6, '2018-07-24 15:58:20', '', '');
INSERT INTO `track_eyes_backup` VALUES(51, 1, 0, 3, '2018-07-24 15:58:25', '', '');
INSERT INTO `track_eyes_backup` VALUES(52, 1, 0, 0, '2018-07-24 15:58:30', '', '');
INSERT INTO `track_eyes_backup` VALUES(53, 1, 0, 2, '2018-07-24 15:58:35', '', '');
INSERT INTO `track_eyes_backup` VALUES(54, 1, 0, 1, '2018-07-24 15:58:40', '', '');
INSERT INTO `track_eyes_backup` VALUES(55, 1, 0, 2, '2018-07-24 15:58:45', '', '');
INSERT INTO `track_eyes_backup` VALUES(56, 1, 0, 4, '2018-07-24 15:58:50', '', '');
INSERT INTO `track_eyes_backup` VALUES(57, 1, 0, 4, '2018-07-24 15:58:55', '', '');
INSERT INTO `track_eyes_backup` VALUES(58, 1, 0, 4, '2018-07-24 15:59:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(59, 1, 0, 4, '2018-07-24 15:59:05', '', '');
INSERT INTO `track_eyes_backup` VALUES(60, 1, 0, 4, '2018-07-24 15:59:10', '', '');
INSERT INTO `track_eyes_backup` VALUES(61, 1, 0, 2, '2018-07-24 15:59:15', '', '');
INSERT INTO `track_eyes_backup` VALUES(62, 1, 0, 0, '2018-07-24 15:59:20', '', '');
INSERT INTO `track_eyes_backup` VALUES(63, 1, 0, 1, '2018-07-24 15:59:25', '', '');
INSERT INTO `track_eyes_backup` VALUES(64, 1, 0, 0, '2018-07-24 15:59:30', '', '');
INSERT INTO `track_eyes_backup` VALUES(65, 1, 0, 0, '2018-07-24 16:12:25', '', '');
INSERT INTO `track_eyes_backup` VALUES(66, 1, 0, 1, '2018-07-24 16:12:30', '', '');
INSERT INTO `track_eyes_backup` VALUES(67, 1, 0, 4, '2018-07-24 16:12:35', '', '');
INSERT INTO `track_eyes_backup` VALUES(68, 1, 0, 6, '2018-07-24 16:12:40', '', '');
INSERT INTO `track_eyes_backup` VALUES(69, 1, 0, 3, '2018-07-24 16:12:45', '', '');
INSERT INTO `track_eyes_backup` VALUES(70, 1, 0, 6, '2018-07-24 16:12:50', '', '');
INSERT INTO `track_eyes_backup` VALUES(71, 1, 0, 6, '2018-07-24 16:15:17', '', '');
INSERT INTO `track_eyes_backup` VALUES(72, 1, 0, 6, '2018-07-24 16:15:22', '', '');
INSERT INTO `track_eyes_backup` VALUES(73, 1, 0, 6, '2018-07-24 16:15:27', '', '');
INSERT INTO `track_eyes_backup` VALUES(74, 1, 0, 4, '2018-07-24 16:24:16', '', '');
INSERT INTO `track_eyes_backup` VALUES(75, 1, 0, 6, '2018-07-24 16:24:41', '', '');
INSERT INTO `track_eyes_backup` VALUES(76, 1, 0, 6, '2018-07-24 16:24:45', '', '');
INSERT INTO `track_eyes_backup` VALUES(77, 1, 0, 0, '2018-07-24 16:24:51', '', '');
INSERT INTO `track_eyes_backup` VALUES(78, 1, 0, 3, '2018-07-24 16:24:56', '', '');
INSERT INTO `track_eyes_backup` VALUES(79, 1, 0, 2, '2018-07-24 16:25:00', '', '');
INSERT INTO `track_eyes_backup` VALUES(80, 1, 0, 5, '2018-07-24 16:25:06', '', '');
INSERT INTO `track_eyes_backup` VALUES(81, 1, 0, 5, '2018-07-24 16:25:11', '', '');
INSERT INTO `track_eyes_backup` VALUES(82, 1, 0, 0, '2018-07-25 13:42:51', '', '');
INSERT INTO `track_eyes_backup` VALUES(83, 1, 0, 2, '2018-07-25 13:42:56', '', '');
INSERT INTO `track_eyes_backup` VALUES(84, 1, 0, 1, '2018-07-25 13:43:02', '', '');
INSERT INTO `track_eyes_backup` VALUES(85, 1, 0, 2, '2018-07-25 13:43:06', '', '');
INSERT INTO `track_eyes_backup` VALUES(86, 1, 0, 2, '2018-07-25 13:43:11', '', '');
INSERT INTO `track_eyes_backup` VALUES(87, 1, 0, 2, '2018-07-25 13:43:16', '', '');
INSERT INTO `track_eyes_backup` VALUES(88, 1, 0, 2, '2018-07-25 13:43:22', '', '');
INSERT INTO `track_eyes_backup` VALUES(89, 1, 0, 7, '2018-07-25 13:43:26', '', '');
INSERT INTO `track_eyes_backup` VALUES(90, 1, 0, 4, '2018-07-25 13:43:32', '', '');
INSERT INTO `track_eyes_backup` VALUES(91, 1, 0, 6, '2018-07-25 13:43:36', '', '');
INSERT INTO `track_eyes_backup` VALUES(92, 1, 0, 1, '2018-07-25 13:43:41', '', '');
INSERT INTO `track_eyes_backup` VALUES(93, 1, 0, 3, '2018-07-25 13:43:47', '', '');
INSERT INTO `track_eyes_backup` VALUES(94, 1, 0, 0, '2018-07-25 13:43:51', '', '');
INSERT INTO `track_eyes_backup` VALUES(95, 1, 0, 10, '2018-07-25 13:43:56', '', '');
INSERT INTO `track_eyes_backup` VALUES(96, 1, 0, 5, '2018-07-25 13:44:02', '', '');
INSERT INTO `track_eyes_backup` VALUES(97, 1, 0, 2, '2018-07-25 13:44:06', '', '');
INSERT INTO `track_eyes_backup` VALUES(98, 1, 0, 2, '2018-07-25 13:44:11', '', '');
INSERT INTO `track_eyes_backup` VALUES(99, 1, 0, 2, '2018-07-25 13:44:17', '', '');
INSERT INTO `track_eyes_backup` VALUES(100, 1, 0, 2, '2018-07-25 13:44:22', '', '');
INSERT INTO `track_eyes_backup` VALUES(101, 1, 0, 2, '2018-07-25 13:44:26', '', '');
INSERT INTO `track_eyes_backup` VALUES(102, 1, 0, 0, '2018-07-25 13:44:32', '', '');
INSERT INTO `track_eyes_backup` VALUES(103, 1, 0, 10, '2018-08-06 16:28:17', ',1,2,3,4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(104, 1, 0, 10, '2018-08-06 16:28:22', ',1,2,3,4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(105, 1, 0, 10, '2018-08-06 16:28:27', ',1,2,3,4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(106, 1, 0, 10, '2018-08-06 16:28:33', ',1,2,3,4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(107, 1, 0, 10, '2018-08-06 16:28:38', ',1,2,3,4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(108, 1, 0, 0, '2018-08-06 16:30:30', '', '');
INSERT INTO `track_eyes_backup` VALUES(109, 1, 0, 2, '2018-08-06 16:30:35', ',9,10', '');
INSERT INTO `track_eyes_backup` VALUES(110, 1, 0, 4, '2018-08-06 16:30:40', ',6,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(111, 1, 0, 5, '2018-08-06 16:30:45', ',4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(112, 1, 0, 5, '2018-08-06 16:30:50', ',5,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(113, 1, 0, 4, '2018-08-06 16:30:55', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(114, 1, 0, 4, '2018-08-06 16:31:00', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(115, 1, 0, 4, '2018-08-06 16:31:05', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(116, 1, 0, 4, '2018-08-06 16:31:10', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(117, 1, 0, 4, '2018-08-06 16:31:15', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(118, 1, 0, 4, '2018-08-06 16:44:30', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(119, 1, 0, 4, '2018-08-06 16:44:35', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(120, 1, 0, 4, '2018-08-06 16:44:40', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(121, 1, 0, 6, '2018-08-06 16:44:45', ',3,4,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(122, 1, 0, 6, '2018-08-06 16:44:50', ',4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(123, 1, 0, 6, '2018-08-06 16:44:55', ',4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(124, 1, 0, 5, '2018-08-06 16:45:00', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(125, 1, 0, 5, '2018-08-06 16:45:05', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(126, 1, 0, 6, '2018-08-06 16:45:10', ',4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(127, 1, 0, 6, '2018-08-06 16:45:15', ',4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(128, 1, 0, 6, '2018-08-06 16:45:20', ',4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(129, 1, 0, 5, '2018-08-06 16:45:25', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(130, 1, 0, 6, '2018-08-06 16:45:30', ',4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(131, 1, 0, 6, '2018-08-06 16:45:35', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(132, 1, 0, 6, '2018-08-06 16:45:40', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(133, 1, 0, 6, '2018-08-06 16:45:45', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(134, 1, 0, 6, '2018-08-06 16:45:50', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(135, 1, 0, 6, '2018-08-06 16:45:55', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(136, 1, 0, 6, '2018-08-06 16:46:51', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(137, 1, 0, 6, '2018-08-06 16:46:55', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(138, 1, 0, 6, '2018-08-06 16:47:00', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(139, 1, 0, 7, '2018-08-06 16:47:05', ',4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(140, 1, 0, 7, '2018-08-06 16:47:10', ',4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(141, 1, 0, 7, '2018-08-06 16:47:15', ',4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(142, 1, 0, 6, '2018-08-06 16:47:20', ',4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(143, 1, 0, 6, '2018-08-06 16:47:25', ',4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(144, 1, 0, 7, '2018-08-06 16:47:30', ',3,4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(145, 1, 0, 7, '2018-08-06 16:47:35', ',3,4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(146, 1, 0, 6, '2018-08-06 16:47:40', ',3,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(147, 1, 0, 6, '2018-08-06 16:47:45', ',3,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(148, 1, 0, 7, '2018-08-06 16:47:50', ',1,3,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(149, 1, 0, 7, '2018-08-06 16:47:55', ',1,3,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(150, 1, 0, 7, '2018-08-06 16:48:00', ',1,4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(151, 1, 0, 5, '2018-08-06 16:48:05', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(152, 1, 0, 5, '2018-08-06 16:48:10', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(153, 1, 0, 5, '2018-08-06 16:48:15', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(154, 1, 0, 5, '2018-08-06 16:48:20', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(155, 1, 0, 5, '2018-08-06 16:48:25', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(156, 1, 0, 5, '2018-08-06 16:48:30', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(157, 1, 0, 5, '2018-08-06 16:48:35', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(158, 1, 0, 5, '2018-08-06 16:48:40', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(159, 1, 0, 7, '2018-08-06 16:48:45', ',4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(160, 1, 0, 5, '2018-08-06 16:51:20', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(161, 1, 0, 5, '2018-08-06 16:51:25', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(162, 1, 0, 5, '2018-08-06 16:51:30', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(163, 1, 0, 5, '2018-08-06 16:51:35', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(164, 1, 0, 5, '2018-08-06 16:51:40', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(165, 1, 0, 5, '2018-08-06 16:51:45', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(166, 1, 0, 5, '2018-08-06 16:51:50', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(167, 1, 0, 5, '2018-08-06 16:51:55', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(168, 1, 0, 5, '2018-08-06 16:52:00', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(169, 1, 0, 5, '2018-08-06 16:52:05', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(170, 1, 0, 5, '2018-08-06 16:52:10', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(171, 1, 0, 5, '2018-08-06 16:52:15', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(172, 1, 0, 5, '2018-08-06 16:52:20', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(173, 1, 0, 5, '2018-08-06 16:52:25', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(174, 1, 0, 5, '2018-08-06 16:52:30', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(175, 1, 0, 6, '2018-08-06 16:52:35', ',1,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(176, 1, 0, 5, '2018-08-06 16:52:40', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(177, 1, 0, 5, '2018-08-06 16:52:45', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(178, 1, 0, 5, '2018-08-06 16:52:50', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(179, 1, 0, 5, '2018-08-06 16:52:55', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(180, 1, 0, 5, '2018-08-06 21:53:09', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(181, 1, 0, 5, '2018-08-06 21:53:14', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(182, 1, 0, 5, '2018-08-06 21:53:19', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(183, 1, 0, 5, '2018-08-06 21:53:24', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(184, 1, 0, 5, '2018-08-06 21:53:29', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(185, 1, 0, 5, '2018-08-06 21:53:34', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(186, 1, 0, 6, '2018-08-06 21:53:39', ',3,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(187, 1, 0, 5, '2018-08-06 21:53:44', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(188, 1, 0, 7, '2018-08-06 21:53:49', ',2,3,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(189, 1, 0, 5, '2018-08-06 21:53:54', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(190, 1, 0, 5, '2018-08-06 21:53:59', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(191, 1, 0, 6, '2018-08-06 21:54:04', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(192, 1, 0, 6, '2018-08-06 21:54:09', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(193, 1, 0, 6, '2018-08-06 21:54:14', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(194, 1, 0, 6, '2018-08-06 21:54:19', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(195, 1, 0, 5, '2018-08-06 21:54:24', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(196, 1, 0, 6, '2018-08-06 21:54:29', ',3,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(197, 1, 0, 5, '2018-08-06 21:54:34', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(198, 1, 0, 5, '2018-08-06 21:54:39', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(199, 1, 0, 5, '2018-08-06 21:54:44', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(200, 1, 0, 6, '2018-08-06 21:54:49', ',2,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(201, 1, 0, 5, '2018-08-06 21:54:54', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(202, 1, 0, 7, '2018-08-06 21:54:59', ',3,4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(203, 1, 0, 7, '2018-08-06 21:55:04', ',1,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(204, 1, 0, 6, '2018-08-06 21:55:09', ',1,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(205, 1, 0, 5, '2018-08-06 21:55:14', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(206, 1, 0, 6, '2018-08-06 21:55:19', ',1,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(207, 1, 0, 6, '2018-08-06 21:55:24', ',2,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(208, 1, 0, 6, '2018-08-06 21:55:29', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(209, 1, 0, 6, '2018-08-06 21:55:34', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(210, 1, 0, 6, '2018-08-06 21:55:39', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(211, 1, 0, 6, '2018-08-06 21:55:44', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(212, 1, 0, 6, '2018-08-06 21:55:49', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(213, 1, 0, 5, '2018-08-06 21:55:54', ',6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(214, 1, 0, 6, '2018-08-06 21:55:59', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(215, 1, 0, 7, '2018-08-06 21:56:04', ',3,4,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(216, 1, 0, 7, '2018-08-06 21:56:09', ',4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(217, 1, 0, 7, '2018-08-06 21:56:14', ',4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(218, 1, 0, 7, '2018-08-06 21:56:19', ',4,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(219, 1, 0, 6, '2018-08-06 21:56:24', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(220, 1, 0, 6, '2018-08-06 21:56:29', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(221, 1, 0, 6, '2018-08-06 21:56:34', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(222, 1, 0, 6, '2018-08-06 21:56:39', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(223, 1, 0, 6, '2018-08-06 21:56:44', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(224, 1, 0, 6, '2018-08-06 21:56:49', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(225, 1, 0, 6, '2018-08-06 21:56:54', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(226, 1, 0, 6, '2018-08-06 21:56:59', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(227, 1, 0, 6, '2018-08-06 21:57:04', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(228, 1, 0, 6, '2018-08-06 21:57:09', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(229, 1, 0, 6, '2018-08-06 21:57:14', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(230, 1, 0, 6, '2018-08-06 21:57:19', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(231, 1, 0, 6, '2018-08-06 21:57:24', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(232, 1, 0, 6, '2018-08-06 21:57:29', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(233, 1, 0, 6, '2018-08-06 21:57:34', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(234, 1, 0, 6, '2018-08-06 21:57:39', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(235, 1, 0, 6, '2018-08-06 21:57:44', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(236, 1, 0, 6, '2018-08-06 21:57:49', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(237, 1, 0, 6, '2018-08-06 21:57:54', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(238, 1, 0, 6, '2018-08-06 21:57:59', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(239, 1, 0, 6, '2018-08-06 21:58:04', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(240, 1, 0, 6, '2018-08-06 21:58:09', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(241, 1, 0, 6, '2018-08-06 21:58:14', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(242, 1, 0, 6, '2018-08-06 21:58:37', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(243, 1, 0, 6, '2018-08-06 21:58:42', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(244, 1, 0, 6, '2018-08-06 21:58:47', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(245, 1, 0, 6, '2018-08-06 21:58:52', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(246, 1, 0, 6, '2018-08-06 21:58:57', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(247, 1, 0, 6, '2018-08-06 21:59:02', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(248, 1, 0, 7, '2018-08-06 21:59:07', ',1,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(249, 1, 0, 6, '2018-08-06 21:59:12', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(250, 1, 0, 6, '2018-08-06 21:59:17', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(251, 1, 0, 6, '2018-08-06 21:59:22', ',5,6,7,8,9,10', ',9');
INSERT INTO `track_eyes_backup` VALUES(252, 1, 0, 6, '2018-08-06 21:59:27', ',5,6,7,8,9,10', ',9');
INSERT INTO `track_eyes_backup` VALUES(253, 1, 0, 6, '2018-08-06 21:59:32', ',5,6,7,8,9,10', ',8');
INSERT INTO `track_eyes_backup` VALUES(254, 1, 0, 7, '2018-08-06 21:59:37', ',3,5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(255, 1, 0, 6, '2018-08-06 21:59:42', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(256, 1, 0, 6, '2018-08-06 21:59:47', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(257, 1, 0, 6, '2018-08-06 21:59:52', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(258, 1, 0, 6, '2018-08-06 21:59:57', ',5,6,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(259, 1, 0, 0, '2018-08-06 22:06:57', '', '');
INSERT INTO `track_eyes_backup` VALUES(260, 1, 0, 2, '2018-08-06 22:07:03', ',5,10', '');
INSERT INTO `track_eyes_backup` VALUES(261, 1, 0, 2, '2018-08-06 22:07:07', ',8,10', '');
INSERT INTO `track_eyes_backup` VALUES(262, 1, 0, 1, '2018-08-06 22:07:12', ',10', '');
INSERT INTO `track_eyes_backup` VALUES(263, 1, 0, 4, '2018-08-06 22:07:18', ',5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(264, 1, 0, 1, '2018-08-06 22:07:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(265, 1, 0, 1, '2018-08-06 22:07:27', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(266, 1, 0, 0, '2018-08-06 22:07:32', '', '');
INSERT INTO `track_eyes_backup` VALUES(267, 1, 0, 0, '2018-08-06 22:07:37', '', '');
INSERT INTO `track_eyes_backup` VALUES(268, 1, 0, 1, '2018-08-06 22:07:43', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(269, 1, 0, 1, '2018-08-06 22:07:47', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(270, 1, 0, 1, '2018-08-06 22:07:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(271, 1, 0, 2, '2018-08-06 22:07:57', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(272, 1, 0, 1, '2018-08-06 22:08:02', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(273, 1, 0, 1, '2018-08-06 22:08:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(274, 1, 0, 1, '2018-08-06 22:08:12', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(275, 1, 0, 2, '2018-08-06 22:08:17', ',8,10', '');
INSERT INTO `track_eyes_backup` VALUES(276, 1, 0, 1, '2018-08-06 22:08:23', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(277, 1, 0, 1, '2018-08-06 22:08:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(278, 1, 0, 1, '2018-08-06 22:08:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(279, 1, 0, 1, '2018-08-06 22:08:38', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(280, 1, 0, 1, '2018-08-06 22:08:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(281, 1, 0, 1, '2018-08-06 22:08:47', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(282, 1, 0, 1, '2018-08-06 22:08:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(283, 1, 0, 1, '2018-08-06 22:08:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(284, 1, 0, 1, '2018-08-06 22:09:02', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(285, 1, 0, 1, '2018-08-06 22:09:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(286, 1, 0, 1, '2018-08-06 22:09:12', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(287, 1, 0, 1, '2018-08-06 22:09:18', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(288, 1, 0, 1, '2018-08-06 22:09:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(289, 1, 0, 1, '2018-08-06 22:09:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(290, 1, 0, 1, '2018-08-06 22:09:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(291, 1, 0, 1, '2018-08-06 22:09:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(292, 1, 0, 1, '2018-08-06 22:09:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(293, 1, 0, 1, '2018-08-06 22:09:47', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(294, 1, 0, 1, '2018-08-06 22:09:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(295, 1, 0, 1, '2018-08-06 22:09:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(296, 1, 0, 1, '2018-08-06 22:10:02', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(297, 1, 0, 1, '2018-08-06 22:10:08', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(298, 1, 0, 1, '2018-08-06 22:10:13', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(299, 1, 0, 1, '2018-08-06 22:10:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(300, 1, 0, 1, '2018-08-06 22:10:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(301, 1, 0, 2, '2018-08-06 22:10:27', ',7,8', '');
INSERT INTO `track_eyes_backup` VALUES(302, 1, 0, 1, '2018-08-06 22:10:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(303, 1, 0, 2, '2018-08-06 22:10:37', ',8,10', '');
INSERT INTO `track_eyes_backup` VALUES(304, 1, 0, 3, '2018-08-06 22:10:43', ',5,8,10', '');
INSERT INTO `track_eyes_backup` VALUES(305, 1, 0, 4, '2018-08-06 22:10:48', ',4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(306, 1, 0, 4, '2018-08-06 22:10:53', ',4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(307, 1, 0, 4, '2018-08-06 22:10:58', ',3,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(308, 1, 0, 3, '2018-08-06 22:11:02', ',8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(309, 1, 0, 4, '2018-08-06 22:11:08', ',3,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(310, 1, 0, 4, '2018-08-06 22:11:13', ',4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(311, 1, 0, 4, '2018-08-06 22:11:18', ',5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(312, 1, 0, 2, '2018-08-06 22:11:23', ',8,10', '');
INSERT INTO `track_eyes_backup` VALUES(313, 1, 0, 1, '2018-08-06 22:11:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(314, 1, 0, 1, '2018-08-06 22:11:33', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(315, 1, 0, 1, '2018-08-06 22:11:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(316, 1, 0, 1, '2018-08-06 22:11:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(317, 1, 0, 1, '2018-08-06 22:11:48', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(318, 1, 0, 1, '2018-08-06 22:11:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(319, 1, 0, 1, '2018-08-06 22:11:58', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(320, 1, 0, 1, '2018-08-06 22:12:02', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(321, 1, 0, 1, '2018-08-06 22:12:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(322, 1, 0, 1, '2018-08-06 22:12:13', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(323, 1, 0, 1, '2018-08-06 22:12:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(324, 1, 0, 1, '2018-08-06 22:12:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(325, 1, 0, 1, '2018-08-06 22:12:28', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(326, 1, 0, 1, '2018-08-06 22:12:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(327, 1, 0, 1, '2018-08-06 22:12:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(328, 1, 0, 1, '2018-08-06 22:12:43', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(329, 1, 0, 1, '2018-08-06 22:12:47', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(330, 1, 0, 1, '2018-08-06 22:12:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(331, 1, 0, 1, '2018-08-06 22:12:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(332, 1, 0, 1, '2018-08-06 22:13:02', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(333, 1, 0, 1, '2018-08-06 22:13:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(334, 1, 0, 1, '2018-08-06 22:13:13', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(335, 1, 0, 1, '2018-08-06 22:13:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(336, 1, 0, 1, '2018-08-06 22:13:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(337, 1, 0, 1, '2018-08-06 22:13:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(338, 1, 0, 1, '2018-08-06 22:13:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(339, 1, 0, 1, '2018-08-06 22:13:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(340, 1, 0, 1, '2018-08-06 22:13:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(341, 1, 0, 1, '2018-08-06 22:13:47', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(342, 1, 0, 1, '2018-08-06 22:13:53', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(343, 1, 0, 1, '2018-08-06 22:13:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(344, 1, 0, 1, '2018-08-06 22:14:03', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(345, 1, 0, 1, '2018-08-06 22:14:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(346, 1, 0, 1, '2018-08-06 22:14:12', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(347, 1, 0, 1, '2018-08-06 22:14:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(348, 1, 0, 1, '2018-08-06 22:14:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(349, 1, 0, 1, '2018-08-06 22:14:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(350, 1, 0, 1, '2018-08-06 22:14:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(351, 1, 0, 1, '2018-08-06 22:14:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(352, 1, 0, 1, '2018-08-06 22:14:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(353, 1, 0, 1, '2018-08-06 22:14:48', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(354, 1, 0, 1, '2018-08-06 22:14:53', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(355, 1, 0, 1, '2018-08-06 22:14:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(356, 1, 0, 1, '2018-08-06 22:15:02', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(357, 1, 0, 1, '2018-08-06 22:15:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(358, 1, 0, 1, '2018-08-06 22:15:12', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(359, 1, 0, 1, '2018-08-06 22:15:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(360, 1, 0, 1, '2018-08-06 22:15:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(361, 1, 0, 1, '2018-08-06 22:15:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(362, 1, 0, 1, '2018-08-06 22:15:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(363, 1, 0, 1, '2018-08-06 22:15:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(364, 1, 0, 1, '2018-08-06 22:15:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(365, 1, 0, 1, '2018-08-06 22:15:47', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(366, 1, 0, 1, '2018-08-06 22:15:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(367, 1, 0, 1, '2018-08-06 22:15:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(368, 1, 0, 1, '2018-08-06 22:16:03', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(369, 1, 0, 1, '2018-08-06 22:16:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(370, 1, 0, 1, '2018-08-06 22:16:12', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(371, 1, 0, 1, '2018-08-06 22:16:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(372, 1, 0, 1, '2018-08-06 22:16:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(373, 1, 0, 1, '2018-08-06 22:16:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(374, 1, 0, 1, '2018-08-06 22:16:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(375, 1, 0, 1, '2018-08-06 22:16:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(376, 1, 0, 1, '2018-08-06 22:16:43', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(377, 1, 0, 3, '2018-08-06 22:16:47', ',5,8,10', '');
INSERT INTO `track_eyes_backup` VALUES(378, 1, 0, 2, '2018-08-06 22:16:52', ',8,10', '');
INSERT INTO `track_eyes_backup` VALUES(379, 1, 0, 3, '2018-08-06 22:16:58', ',4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(380, 1, 0, 3, '2018-08-06 22:17:03', ',4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(381, 1, 0, 2, '2018-08-06 22:17:07', ',8,10', '');
INSERT INTO `track_eyes_backup` VALUES(382, 1, 0, 1, '2018-08-06 22:17:13', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(383, 1, 0, 1, '2018-08-06 22:17:18', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(384, 1, 0, 1, '2018-08-06 22:17:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(385, 1, 0, 1, '2018-08-06 22:17:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(386, 1, 0, 1, '2018-08-06 22:17:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(387, 1, 0, 1, '2018-08-06 22:17:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(388, 1, 0, 1, '2018-08-06 22:17:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(389, 1, 0, 1, '2018-08-06 22:17:48', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(390, 1, 0, 1, '2018-08-06 22:17:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(391, 1, 0, 1, '2018-08-06 22:17:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(392, 1, 0, 1, '2018-08-06 22:18:02', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(393, 1, 0, 1, '2018-08-06 22:18:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(394, 1, 0, 1, '2018-08-06 22:18:13', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(395, 1, 0, 1, '2018-08-06 22:18:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(396, 1, 0, 1, '2018-08-06 22:18:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(397, 1, 0, 1, '2018-08-06 22:18:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(398, 1, 0, 1, '2018-08-06 22:18:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(399, 1, 0, 1, '2018-08-06 22:18:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(400, 1, 0, 1, '2018-08-06 22:18:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(401, 1, 0, 1, '2018-08-06 22:18:48', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(402, 1, 0, 1, '2018-08-06 22:18:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(403, 1, 0, 1, '2018-08-06 22:18:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(404, 1, 0, 1, '2018-08-06 22:19:03', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(405, 1, 0, 1, '2018-08-06 22:19:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(406, 1, 0, 1, '2018-08-06 22:19:13', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(407, 1, 0, 1, '2018-08-06 22:19:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(408, 1, 0, 1, '2018-08-06 22:19:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(409, 1, 0, 1, '2018-08-06 22:19:28', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(410, 1, 0, 1, '2018-08-06 22:19:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(411, 1, 0, 2, '2018-08-06 22:19:37', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(412, 1, 0, 1, '2018-08-06 22:19:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(413, 1, 0, 1, '2018-08-06 22:19:48', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(414, 1, 0, 1, '2018-08-06 22:19:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(415, 1, 0, 1, '2018-08-06 22:19:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(416, 1, 0, 2, '2018-08-06 22:20:02', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(417, 1, 0, 2, '2018-08-06 22:20:08', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(418, 1, 0, 1, '2018-08-06 22:20:12', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(419, 1, 0, 2, '2018-08-06 22:20:18', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(420, 1, 0, 1, '2018-08-06 22:20:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(421, 1, 0, 2, '2018-08-06 22:20:27', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(422, 1, 0, 1, '2018-08-06 22:20:32', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(423, 1, 0, 2, '2018-08-06 22:20:37', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(424, 1, 0, 2, '2018-08-06 22:20:42', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(425, 1, 0, 2, '2018-08-06 22:20:47', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(426, 1, 0, 2, '2018-08-06 22:20:52', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(427, 1, 0, 2, '2018-08-06 22:20:57', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(428, 1, 0, 2, '2018-08-06 22:21:02', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(429, 1, 0, 1, '2018-08-06 22:21:08', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(430, 1, 0, 2, '2018-08-06 22:21:12', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(431, 1, 0, 2, '2018-08-06 22:21:17', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(432, 1, 0, 1, '2018-08-06 22:21:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(433, 1, 0, 1, '2018-08-06 22:21:28', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(434, 1, 0, 2, '2018-08-06 22:21:32', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(435, 1, 0, 1, '2018-08-06 22:21:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(436, 1, 0, 1, '2018-08-06 22:21:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(437, 1, 0, 1, '2018-08-06 22:21:47', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(438, 1, 0, 1, '2018-08-06 22:21:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(439, 1, 0, 1, '2018-08-06 22:21:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(440, 1, 0, 1, '2018-08-06 22:22:02', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(441, 1, 0, 1, '2018-08-06 22:22:07', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(442, 1, 0, 2, '2018-08-06 22:22:13', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(443, 1, 0, 1, '2018-08-06 22:22:17', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(444, 1, 0, 1, '2018-08-06 22:22:22', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(445, 1, 0, 2, '2018-08-06 22:22:27', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(446, 1, 0, 2, '2018-08-06 22:22:33', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(447, 1, 0, 2, '2018-08-06 22:22:38', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(448, 1, 0, 2, '2018-08-06 22:22:42', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(449, 1, 0, 2, '2018-08-06 22:22:47', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(450, 1, 0, 2, '2018-08-06 22:22:52', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(451, 1, 0, 2, '2018-08-06 22:22:57', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(452, 1, 0, 2, '2018-08-06 22:23:02', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(453, 1, 0, 2, '2018-08-06 22:23:07', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(454, 1, 0, 2, '2018-08-06 22:23:13', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(455, 1, 0, 2, '2018-08-06 22:23:18', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(456, 1, 0, 2, '2018-08-06 22:23:22', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(457, 1, 0, 2, '2018-08-06 22:23:28', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(458, 1, 0, 2, '2018-08-06 22:23:32', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(459, 1, 0, 3, '2018-08-06 22:23:38', ',8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(460, 1, 0, 2, '2018-08-06 22:23:42', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(461, 1, 0, 2, '2018-08-06 22:23:47', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(462, 1, 0, 1, '2018-08-06 22:23:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(463, 1, 0, 2, '2018-08-06 22:23:57', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(464, 1, 0, 4, '2018-08-06 22:24:03', ',3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(465, 1, 0, 3, '2018-08-06 22:24:07', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(466, 1, 0, 5, '2018-08-06 22:24:13', ',2,3,7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(467, 1, 0, 2, '2018-08-06 22:24:17', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(468, 1, 0, 1, '2018-08-06 22:24:22', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(469, 1, 0, 1, '2018-08-06 22:24:27', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(470, 1, 0, 1, '2018-08-06 22:24:33', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(471, 1, 0, 1, '2018-08-06 22:24:37', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(472, 1, 0, 1, '2018-08-06 22:24:42', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(473, 1, 0, 1, '2018-08-06 22:24:48', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(474, 1, 0, 1, '2018-08-06 22:24:52', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(475, 1, 0, 1, '2018-08-06 22:24:57', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(476, 1, 0, 1, '2018-08-06 22:25:03', ',8', '');
INSERT INTO `track_eyes_backup` VALUES(477, 1, 0, 2, '2018-08-06 22:25:07', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(478, 1, 0, 4, '2018-08-06 22:25:13', ',3,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(479, 1, 0, 2, '2018-08-06 22:25:17', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(480, 1, 0, 2, '2018-08-06 22:25:23', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(481, 1, 0, 2, '2018-08-06 22:25:28', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(482, 1, 0, 2, '2018-08-06 22:25:32', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(483, 1, 0, 2, '2018-08-06 22:25:38', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(484, 1, 0, 2, '2018-08-06 22:25:42', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(485, 1, 0, 2, '2018-08-06 22:25:47', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(486, 1, 0, 2, '2018-08-06 22:25:52', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(487, 1, 0, 2, '2018-08-06 22:25:57', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(488, 1, 0, 2, '2018-08-06 22:26:02', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(489, 1, 0, 2, '2018-08-06 22:26:07', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(490, 1, 0, 2, '2018-08-06 22:26:12', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(491, 1, 0, 2, '2018-08-06 22:26:17', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(492, 1, 0, 2, '2018-08-06 22:26:22', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(493, 1, 0, 3, '2018-08-06 22:26:28', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(494, 1, 0, 2, '2018-08-06 22:26:32', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(495, 1, 0, 2, '2018-08-06 22:26:37', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(496, 1, 0, 2, '2018-08-06 22:26:42', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(497, 1, 0, 3, '2018-08-06 22:26:47', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(498, 1, 0, 2, '2018-08-06 22:26:52', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(499, 1, 0, 2, '2018-08-06 22:26:58', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(500, 1, 0, 2, '2018-08-06 22:27:02', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(501, 1, 0, 3, '2018-08-06 22:27:08', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(502, 1, 0, 3, '2018-08-06 22:27:13', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(503, 1, 0, 3, '2018-08-06 22:27:18', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(504, 1, 0, 3, '2018-08-06 22:27:23', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(505, 1, 0, 3, '2018-08-06 22:27:28', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(506, 1, 0, 3, '2018-08-06 22:27:32', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(507, 1, 0, 3, '2018-08-06 22:27:38', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(508, 1, 0, 3, '2018-08-06 22:27:42', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(509, 1, 0, 3, '2018-08-06 22:27:48', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(510, 1, 0, 3, '2018-08-06 22:27:53', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(511, 1, 0, 3, '2018-08-06 22:27:58', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(512, 1, 0, 3, '2018-08-06 22:28:03', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(513, 1, 0, 4, '2018-08-06 22:28:08', ',3,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(514, 1, 0, 3, '2018-08-06 22:28:13', ',8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(515, 1, 0, 3, '2018-08-06 22:28:18', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(516, 1, 0, 3, '2018-08-06 22:28:23', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(517, 1, 0, 3, '2018-08-06 22:28:28', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(518, 1, 0, 3, '2018-08-06 22:28:33', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(519, 1, 0, 3, '2018-08-06 22:28:38', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(520, 1, 0, 3, '2018-08-06 22:28:43', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(521, 1, 0, 3, '2018-08-06 22:28:48', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(522, 1, 0, 3, '2018-08-06 22:28:53', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(523, 1, 0, 3, '2018-08-06 22:28:58', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(524, 1, 0, 3, '2018-08-06 22:29:03', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(525, 1, 0, 4, '2018-08-06 22:29:08', ',3,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(526, 1, 0, 3, '2018-08-06 22:29:13', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(527, 1, 0, 3, '2018-08-06 22:29:18', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(528, 1, 0, 3, '2018-08-06 22:29:23', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(529, 1, 0, 3, '2018-08-06 22:29:28', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(530, 1, 0, 3, '2018-08-06 22:29:33', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(531, 1, 0, 3, '2018-08-06 22:29:38', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(532, 1, 0, 3, '2018-08-06 22:29:43', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(533, 1, 0, 3, '2018-08-06 22:29:48', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(534, 1, 0, 3, '2018-08-06 22:29:53', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(535, 1, 0, 3, '2018-08-06 22:29:58', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(536, 1, 0, 3, '2018-08-06 22:30:03', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(537, 1, 0, 3, '2018-08-06 22:30:08', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(538, 1, 0, 3, '2018-08-06 22:30:13', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(539, 1, 0, 3, '2018-08-06 22:30:18', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(540, 1, 0, 3, '2018-08-06 22:30:23', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(541, 1, 0, 3, '2018-08-06 22:30:28', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(542, 1, 0, 4, '2018-08-06 22:30:33', ',3,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(543, 1, 0, 3, '2018-08-06 22:30:38', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(544, 1, 0, 3, '2018-08-06 22:30:43', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(545, 1, 0, 3, '2018-08-06 22:30:48', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(546, 1, 0, 3, '2018-08-06 22:30:53', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(547, 1, 0, 3, '2018-08-06 22:30:58', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(548, 1, 0, 3, '2018-08-06 22:31:03', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(549, 1, 0, 3, '2018-08-06 22:31:08', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(550, 1, 0, 3, '2018-08-06 22:31:13', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(551, 1, 0, 3, '2018-08-06 22:31:18', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(552, 1, 0, 3, '2018-08-06 22:31:23', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(553, 1, 0, 4, '2018-08-06 22:31:28', ',3,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(554, 1, 0, 3, '2018-08-06 22:31:33', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(555, 1, 0, 3, '2018-08-06 22:31:38', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(556, 1, 0, 3, '2018-08-06 22:31:43', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(557, 1, 0, 3, '2018-08-06 22:31:48', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(558, 1, 0, 3, '2018-08-06 22:31:53', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(559, 1, 0, 3, '2018-08-06 22:31:58', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(560, 1, 0, 4, '2018-08-06 22:32:03', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(561, 1, 0, 4, '2018-08-06 22:32:08', ',3,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(562, 1, 0, 4, '2018-08-06 22:32:13', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(563, 1, 0, 5, '2018-08-06 22:32:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(564, 1, 0, 4, '2018-08-06 22:32:23', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(565, 1, 0, 4, '2018-08-06 22:32:28', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(566, 1, 0, 4, '2018-08-06 22:32:33', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(567, 1, 0, 4, '2018-08-06 22:32:38', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(568, 1, 0, 4, '2018-08-06 22:32:43', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(569, 1, 0, 4, '2018-08-06 22:32:48', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(570, 1, 0, 5, '2018-08-06 22:32:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(571, 1, 0, 5, '2018-08-06 22:32:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(572, 1, 0, 5, '2018-08-06 22:33:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(573, 1, 0, 5, '2018-08-06 22:33:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(574, 1, 0, 5, '2018-08-06 22:33:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(575, 1, 0, 5, '2018-08-06 22:33:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(576, 1, 0, 4, '2018-08-06 22:33:23', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(577, 1, 0, 4, '2018-08-06 22:33:28', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(578, 1, 0, 4, '2018-08-06 22:33:33', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(579, 1, 0, 4, '2018-08-06 22:33:38', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(580, 1, 0, 3, '2018-08-06 22:33:43', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(581, 1, 0, 3, '2018-08-06 22:33:48', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(582, 1, 0, 3, '2018-08-06 22:33:53', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(583, 1, 0, 4, '2018-08-06 22:33:58', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(584, 1, 0, 4, '2018-08-06 22:34:03', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(585, 1, 0, 4, '2018-08-06 22:34:08', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(586, 1, 0, 4, '2018-08-06 22:34:13', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(587, 1, 0, 4, '2018-08-06 22:34:18', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(588, 1, 0, 4, '2018-08-06 22:34:23', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(589, 1, 0, 4, '2018-08-06 22:34:28', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(590, 1, 0, 4, '2018-08-06 22:34:33', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(591, 1, 0, 4, '2018-08-06 22:34:38', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(592, 1, 0, 4, '2018-08-06 22:34:43', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(593, 1, 0, 4, '2018-08-06 22:34:48', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(594, 1, 0, 4, '2018-08-06 22:34:53', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(595, 1, 0, 4, '2018-08-06 22:34:58', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(596, 1, 0, 5, '2018-08-06 22:35:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(597, 1, 0, 5, '2018-08-06 22:35:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(598, 1, 0, 5, '2018-08-06 22:35:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(599, 1, 0, 5, '2018-08-06 22:35:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(600, 1, 0, 5, '2018-08-06 22:35:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(601, 1, 0, 5, '2018-08-06 22:35:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(602, 1, 0, 5, '2018-08-06 22:35:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(603, 1, 0, 5, '2018-08-06 22:35:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(604, 1, 0, 4, '2018-08-06 22:35:43', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(605, 1, 0, 4, '2018-08-06 22:35:48', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(606, 1, 0, 4, '2018-08-06 22:35:53', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(607, 1, 0, 4, '2018-08-06 22:35:58', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(608, 1, 0, 4, '2018-08-06 22:36:03', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(609, 1, 0, 3, '2018-08-06 22:36:08', ',3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(610, 1, 0, 4, '2018-08-06 22:36:13', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(611, 1, 0, 5, '2018-08-06 22:36:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(612, 1, 0, 5, '2018-08-06 22:36:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(613, 1, 0, 5, '2018-08-06 22:36:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(614, 1, 0, 5, '2018-08-06 22:36:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(615, 1, 0, 5, '2018-08-06 22:36:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(616, 1, 0, 5, '2018-08-06 22:36:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(617, 1, 0, 5, '2018-08-06 22:36:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(618, 1, 0, 5, '2018-08-06 22:36:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(619, 1, 0, 5, '2018-08-06 22:36:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(620, 1, 0, 5, '2018-08-06 22:37:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(621, 1, 0, 5, '2018-08-06 22:37:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(622, 1, 0, 5, '2018-08-06 22:37:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(623, 1, 0, 5, '2018-08-06 22:37:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(624, 1, 0, 5, '2018-08-06 22:37:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(625, 1, 0, 5, '2018-08-06 22:37:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(626, 1, 0, 5, '2018-08-06 22:37:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(627, 1, 0, 5, '2018-08-06 22:37:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(628, 1, 0, 5, '2018-08-06 22:37:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(629, 1, 0, 5, '2018-08-06 22:37:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(630, 1, 0, 5, '2018-08-06 22:37:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(631, 1, 0, 5, '2018-08-06 22:37:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(632, 1, 0, 5, '2018-08-06 22:38:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(633, 1, 0, 5, '2018-08-06 22:38:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(634, 1, 0, 5, '2018-08-06 22:38:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(635, 1, 0, 5, '2018-08-06 22:38:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(636, 1, 0, 5, '2018-08-06 22:38:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(637, 1, 0, 5, '2018-08-06 22:38:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(638, 1, 0, 5, '2018-08-06 22:38:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(639, 1, 0, 5, '2018-08-06 22:38:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(640, 1, 0, 6, '2018-08-06 22:38:43', ',2,3,4,7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(641, 1, 0, 5, '2018-08-06 22:38:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(642, 1, 0, 5, '2018-08-06 22:38:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(643, 1, 0, 4, '2018-08-06 22:38:58', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(644, 1, 0, 5, '2018-08-06 22:39:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(645, 1, 0, 5, '2018-08-06 22:39:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(646, 1, 0, 5, '2018-08-06 22:39:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(647, 1, 0, 5, '2018-08-06 22:39:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(648, 1, 0, 5, '2018-08-06 22:39:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(649, 1, 0, 5, '2018-08-06 22:39:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(650, 1, 0, 4, '2018-08-06 22:39:33', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(651, 1, 0, 5, '2018-08-06 22:39:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(652, 1, 0, 5, '2018-08-06 22:39:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(653, 1, 0, 6, '2018-08-06 22:39:48', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(654, 1, 0, 5, '2018-08-06 22:39:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(655, 1, 0, 6, '2018-08-06 22:39:58', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(656, 1, 0, 5, '2018-08-06 22:40:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(657, 1, 0, 5, '2018-08-06 22:40:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(658, 1, 0, 5, '2018-08-06 22:40:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(659, 1, 0, 5, '2018-08-06 22:40:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(660, 1, 0, 5, '2018-08-06 22:40:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(661, 1, 0, 6, '2018-08-06 22:40:28', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(662, 1, 0, 6, '2018-08-06 22:40:33', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(663, 1, 0, 5, '2018-08-06 22:40:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(664, 1, 0, 5, '2018-08-06 22:40:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(665, 1, 0, 6, '2018-08-06 22:40:48', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(666, 1, 0, 5, '2018-08-06 22:40:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(667, 1, 0, 5, '2018-08-06 22:40:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(668, 1, 0, 6, '2018-08-06 22:41:03', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(669, 1, 0, 5, '2018-08-06 22:41:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(670, 1, 0, 5, '2018-08-06 22:41:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(671, 1, 0, 5, '2018-08-06 22:41:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(672, 1, 0, 5, '2018-08-06 22:41:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(673, 1, 0, 5, '2018-08-06 22:41:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(674, 1, 0, 5, '2018-08-06 22:41:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(675, 1, 0, 6, '2018-08-06 22:41:38', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(676, 1, 0, 5, '2018-08-06 22:41:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(677, 1, 0, 6, '2018-08-06 22:41:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(678, 1, 0, 5, '2018-08-06 22:41:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(679, 1, 0, 5, '2018-08-06 22:41:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(680, 1, 0, 5, '2018-08-06 22:42:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(681, 1, 0, 5, '2018-08-06 22:42:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(682, 1, 0, 5, '2018-08-06 22:42:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(683, 1, 0, 6, '2018-08-06 22:42:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(684, 1, 0, 6, '2018-08-06 22:42:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(685, 1, 0, 5, '2018-08-06 22:42:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(686, 1, 0, 5, '2018-08-06 22:42:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(687, 1, 0, 5, '2018-08-06 22:42:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(688, 1, 0, 5, '2018-08-06 22:42:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(689, 1, 0, 5, '2018-08-06 22:42:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(690, 1, 0, 5, '2018-08-06 22:42:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(691, 1, 0, 5, '2018-08-06 22:42:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(692, 1, 0, 5, '2018-08-06 22:43:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(693, 1, 0, 5, '2018-08-06 22:43:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(694, 1, 0, 5, '2018-08-06 22:43:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(695, 1, 0, 5, '2018-08-06 22:43:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(696, 1, 0, 5, '2018-08-06 22:43:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(697, 1, 0, 5, '2018-08-06 22:43:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(698, 1, 0, 5, '2018-08-06 22:43:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(699, 1, 0, 6, '2018-08-06 22:43:38', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(700, 1, 0, 5, '2018-08-06 22:43:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(701, 1, 0, 5, '2018-08-06 22:43:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(702, 1, 0, 5, '2018-08-06 22:43:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(703, 1, 0, 5, '2018-08-06 22:43:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(704, 1, 0, 5, '2018-08-06 22:44:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(705, 1, 0, 5, '2018-08-06 22:44:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(706, 1, 0, 5, '2018-08-06 22:44:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(707, 1, 0, 5, '2018-08-06 22:44:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(708, 1, 0, 5, '2018-08-06 22:44:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(709, 1, 0, 5, '2018-08-06 22:44:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(710, 1, 0, 5, '2018-08-06 22:44:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(711, 1, 0, 5, '2018-08-06 22:44:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(712, 1, 0, 5, '2018-08-06 22:44:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(713, 1, 0, 5, '2018-08-06 22:44:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(714, 1, 0, 5, '2018-08-06 22:44:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(715, 1, 0, 6, '2018-08-06 22:44:58', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(716, 1, 0, 5, '2018-08-06 22:45:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(717, 1, 0, 5, '2018-08-06 22:45:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(718, 1, 0, 5, '2018-08-06 22:45:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(719, 1, 0, 5, '2018-08-06 22:45:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(720, 1, 0, 6, '2018-08-06 22:45:23', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(721, 1, 0, 5, '2018-08-06 22:45:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(722, 1, 0, 8, '2018-08-06 22:45:33', ',1,2,3,4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(723, 1, 0, 8, '2018-08-06 22:45:38', ',1,2,3,4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(724, 1, 0, 8, '2018-08-06 22:45:43', ',1,2,3,4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(725, 1, 0, 7, '2018-08-06 22:45:48', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(726, 1, 0, 7, '2018-08-06 22:45:53', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(727, 1, 0, 7, '2018-08-06 22:45:58', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(728, 1, 0, 6, '2018-08-06 22:46:03', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(729, 1, 0, 5, '2018-08-06 22:46:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(730, 1, 0, 5, '2018-08-06 22:46:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(731, 1, 0, 5, '2018-08-06 22:46:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(732, 1, 0, 6, '2018-08-06 22:46:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(733, 1, 0, 5, '2018-08-06 22:46:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(734, 1, 0, 5, '2018-08-06 22:46:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(735, 1, 0, 5, '2018-08-06 22:46:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(736, 1, 0, 5, '2018-08-06 22:46:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(737, 1, 0, 5, '2018-08-06 22:46:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(738, 1, 0, 5, '2018-08-06 22:46:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(739, 1, 0, 5, '2018-08-06 22:46:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(740, 1, 0, 5, '2018-08-06 22:47:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(741, 1, 0, 6, '2018-08-06 22:47:08', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(742, 1, 0, 6, '2018-08-06 22:47:13', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(743, 1, 0, 6, '2018-08-06 22:47:18', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(744, 1, 0, 5, '2018-08-06 22:47:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(745, 1, 0, 5, '2018-08-06 22:47:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(746, 1, 0, 5, '2018-08-06 22:47:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(747, 1, 0, 5, '2018-08-06 22:47:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(748, 1, 0, 5, '2018-08-06 22:47:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(749, 1, 0, 5, '2018-08-06 22:47:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(750, 1, 0, 5, '2018-08-06 22:47:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(751, 1, 0, 5, '2018-08-06 22:47:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(752, 1, 0, 5, '2018-08-06 22:48:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(753, 1, 0, 5, '2018-08-06 22:48:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(754, 1, 0, 5, '2018-08-06 22:48:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(755, 1, 0, 5, '2018-08-06 22:48:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(756, 1, 0, 5, '2018-08-06 22:48:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(757, 1, 0, 5, '2018-08-06 22:48:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(758, 1, 0, 5, '2018-08-06 22:48:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(759, 1, 0, 5, '2018-08-06 22:48:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(760, 1, 0, 5, '2018-08-06 22:48:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(761, 1, 0, 5, '2018-08-06 22:48:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(762, 1, 0, 5, '2018-08-06 22:48:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(763, 1, 0, 5, '2018-08-06 22:48:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(764, 1, 0, 5, '2018-08-06 22:49:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(765, 1, 0, 5, '2018-08-06 22:49:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(766, 1, 0, 5, '2018-08-06 22:49:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(767, 1, 0, 5, '2018-08-06 22:49:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(768, 1, 0, 6, '2018-08-06 22:49:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(769, 1, 0, 5, '2018-08-06 22:49:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(770, 1, 0, 5, '2018-08-06 22:49:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(771, 1, 0, 5, '2018-08-06 22:49:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(772, 1, 0, 6, '2018-08-06 22:49:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(773, 1, 0, 5, '2018-08-06 22:49:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(774, 1, 0, 6, '2018-08-06 22:49:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(775, 1, 0, 6, '2018-08-06 22:49:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(776, 1, 0, 6, '2018-08-06 22:50:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(777, 1, 0, 6, '2018-08-06 22:50:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(778, 1, 0, 6, '2018-08-06 22:50:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(779, 1, 0, 6, '2018-08-06 22:50:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(780, 1, 0, 7, '2018-08-06 22:50:23', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(781, 1, 0, 7, '2018-08-06 22:50:28', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(782, 1, 0, 6, '2018-08-06 22:50:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(783, 1, 0, 6, '2018-08-06 22:50:38', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(784, 1, 0, 6, '2018-08-06 22:50:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(785, 1, 0, 6, '2018-08-06 22:50:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(786, 1, 0, 6, '2018-08-06 22:50:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(787, 1, 0, 6, '2018-08-06 22:50:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(788, 1, 0, 6, '2018-08-06 22:51:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(789, 1, 0, 6, '2018-08-06 22:51:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(790, 1, 0, 6, '2018-08-06 22:51:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(791, 1, 0, 6, '2018-08-06 22:51:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(792, 1, 0, 6, '2018-08-06 22:51:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(793, 1, 0, 6, '2018-08-06 22:51:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(794, 1, 0, 5, '2018-08-06 22:51:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(795, 1, 0, 5, '2018-08-06 22:51:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(796, 1, 0, 5, '2018-08-06 22:51:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(797, 1, 0, 6, '2018-08-06 22:51:48', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(798, 1, 0, 6, '2018-08-06 22:51:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(799, 1, 0, 5, '2018-08-06 22:51:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(800, 1, 0, 6, '2018-08-06 22:52:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(801, 1, 0, 6, '2018-08-06 22:52:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(802, 1, 0, 6, '2018-08-06 22:52:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(803, 1, 0, 5, '2018-08-06 22:52:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(804, 1, 0, 6, '2018-08-06 22:52:23', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(805, 1, 0, 6, '2018-08-06 22:52:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(806, 1, 0, 6, '2018-08-06 22:52:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(807, 1, 0, 5, '2018-08-06 22:52:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(808, 1, 0, 6, '2018-08-06 22:52:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(809, 1, 0, 6, '2018-08-06 22:52:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(810, 1, 0, 5, '2018-08-06 22:52:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(811, 1, 0, 5, '2018-08-06 22:52:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(812, 1, 0, 6, '2018-08-06 22:53:03', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(813, 1, 0, 5, '2018-08-06 22:53:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(814, 1, 0, 5, '2018-08-06 22:53:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(815, 1, 0, 6, '2018-08-06 22:53:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(816, 1, 0, 6, '2018-08-06 22:53:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(817, 1, 0, 6, '2018-08-06 22:53:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(818, 1, 0, 5, '2018-08-06 22:53:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(819, 1, 0, 6, '2018-08-06 22:53:38', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(820, 1, 0, 6, '2018-08-06 22:53:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(821, 1, 0, 5, '2018-08-06 22:53:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(822, 1, 0, 7, '2018-08-06 22:53:53', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(823, 1, 0, 6, '2018-08-06 22:53:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(824, 1, 0, 6, '2018-08-06 22:54:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(825, 1, 0, 5, '2018-08-06 22:54:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(826, 1, 0, 6, '2018-08-06 22:54:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(827, 1, 0, 6, '2018-08-06 22:54:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(828, 1, 0, 6, '2018-08-06 22:54:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(829, 1, 0, 6, '2018-08-06 22:54:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(830, 1, 0, 6, '2018-08-06 22:54:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(831, 1, 0, 6, '2018-08-06 22:54:38', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(832, 1, 0, 5, '2018-08-06 22:54:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(833, 1, 0, 6, '2018-08-06 22:54:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(834, 1, 0, 6, '2018-08-06 22:54:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(835, 1, 0, 6, '2018-08-06 22:54:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(836, 1, 0, 5, '2018-08-06 22:55:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(837, 1, 0, 6, '2018-08-06 22:55:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(838, 1, 0, 6, '2018-08-06 22:55:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(839, 1, 0, 6, '2018-08-06 22:55:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(840, 1, 0, 6, '2018-08-06 22:55:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(841, 1, 0, 6, '2018-08-06 22:55:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(842, 1, 0, 6, '2018-08-06 22:55:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(843, 1, 0, 5, '2018-08-06 22:55:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(844, 1, 0, 5, '2018-08-06 22:55:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(845, 1, 0, 5, '2018-08-06 22:55:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(846, 1, 0, 5, '2018-08-06 22:55:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(847, 1, 0, 5, '2018-08-06 22:55:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(848, 1, 0, 5, '2018-08-06 22:56:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(849, 1, 0, 6, '2018-08-06 22:56:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(850, 1, 0, 6, '2018-08-06 22:56:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(851, 1, 0, 6, '2018-08-06 22:56:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(852, 1, 0, 5, '2018-08-06 22:56:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(853, 1, 0, 5, '2018-08-06 22:56:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(854, 1, 0, 5, '2018-08-06 22:56:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(855, 1, 0, 5, '2018-08-06 22:56:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(856, 1, 0, 5, '2018-08-06 22:56:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(857, 1, 0, 6, '2018-08-06 22:56:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(858, 1, 0, 6, '2018-08-06 22:56:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(859, 1, 0, 6, '2018-08-06 22:56:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(860, 1, 0, 6, '2018-08-06 22:57:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(861, 1, 0, 6, '2018-08-06 22:57:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(862, 1, 0, 5, '2018-08-06 22:57:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(863, 1, 0, 6, '2018-08-06 22:57:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(864, 1, 0, 6, '2018-08-06 22:57:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(865, 1, 0, 6, '2018-08-06 22:57:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(866, 1, 0, 5, '2018-08-06 22:57:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(867, 1, 0, 6, '2018-08-06 22:57:38', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(868, 1, 0, 6, '2018-08-06 22:57:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(869, 1, 0, 5, '2018-08-06 22:57:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(870, 1, 0, 6, '2018-08-06 22:57:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(871, 1, 0, 6, '2018-08-06 22:57:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(872, 1, 0, 6, '2018-08-06 22:58:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(873, 1, 0, 6, '2018-08-06 22:58:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(874, 1, 0, 6, '2018-08-06 22:58:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(875, 1, 0, 6, '2018-08-06 22:58:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(876, 1, 0, 6, '2018-08-06 22:58:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(877, 1, 0, 6, '2018-08-06 22:58:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(878, 1, 0, 6, '2018-08-06 22:58:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(879, 1, 0, 6, '2018-08-06 22:58:38', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(880, 1, 0, 5, '2018-08-06 22:58:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(881, 1, 0, 6, '2018-08-06 22:58:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(882, 1, 0, 6, '2018-08-06 22:58:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(883, 1, 0, 6, '2018-08-06 22:58:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(884, 1, 0, 6, '2018-08-06 22:59:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(885, 1, 0, 6, '2018-08-06 22:59:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(886, 1, 0, 6, '2018-08-06 22:59:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(887, 1, 0, 6, '2018-08-06 22:59:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(888, 1, 0, 6, '2018-08-06 22:59:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(889, 1, 0, 6, '2018-08-06 22:59:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(890, 1, 0, 6, '2018-08-06 22:59:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(891, 1, 0, 5, '2018-08-06 22:59:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(892, 1, 0, 6, '2018-08-06 22:59:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(893, 1, 0, 6, '2018-08-06 22:59:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(894, 1, 0, 6, '2018-08-06 22:59:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(895, 1, 0, 5, '2018-08-06 22:59:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(896, 1, 0, 6, '2018-08-06 23:00:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(897, 1, 0, 6, '2018-08-06 23:00:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(898, 1, 0, 6, '2018-08-06 23:00:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(899, 1, 0, 6, '2018-08-06 23:00:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(900, 1, 0, 6, '2018-08-06 23:00:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(901, 1, 0, 6, '2018-08-06 23:00:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(902, 1, 0, 6, '2018-08-06 23:00:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(903, 1, 0, 6, '2018-08-06 23:00:38', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(904, 1, 0, 6, '2018-08-06 23:00:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(905, 1, 0, 6, '2018-08-06 23:00:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(906, 1, 0, 5, '2018-08-06 23:00:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(907, 1, 0, 6, '2018-08-06 23:00:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(908, 1, 0, 6, '2018-08-06 23:01:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(909, 1, 0, 6, '2018-08-06 23:01:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(910, 1, 0, 6, '2018-08-06 23:01:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(911, 1, 0, 6, '2018-08-06 23:01:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(912, 1, 0, 6, '2018-08-06 23:01:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(913, 1, 0, 6, '2018-08-06 23:01:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(914, 1, 0, 6, '2018-08-06 23:01:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(915, 1, 0, 6, '2018-08-06 23:01:38', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(916, 1, 0, 6, '2018-08-06 23:01:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(917, 1, 0, 6, '2018-08-06 23:01:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(918, 1, 0, 6, '2018-08-06 23:01:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(919, 1, 0, 6, '2018-08-06 23:01:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(920, 1, 0, 7, '2018-08-06 23:02:03', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(921, 1, 0, 6, '2018-08-06 23:02:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(922, 1, 0, 5, '2018-08-06 23:02:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(923, 1, 0, 7, '2018-08-06 23:02:18', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(924, 1, 0, 7, '2018-08-06 23:02:23', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(925, 1, 0, 7, '2018-08-06 23:02:28', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(926, 1, 0, 6, '2018-08-06 23:02:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(927, 1, 0, 5, '2018-08-06 23:02:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(928, 1, 0, 5, '2018-08-06 23:02:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(929, 1, 0, 5, '2018-08-06 23:02:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(930, 1, 0, 5, '2018-08-06 23:02:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(931, 1, 0, 5, '2018-08-06 23:02:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(932, 1, 0, 5, '2018-08-06 23:03:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(933, 1, 0, 5, '2018-08-06 23:03:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(934, 1, 0, 7, '2018-08-06 23:03:13', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(935, 1, 0, 7, '2018-08-06 23:03:18', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(936, 1, 0, 7, '2018-08-06 23:03:23', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(937, 1, 0, 7, '2018-08-06 23:03:28', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(938, 1, 0, 7, '2018-08-06 23:03:33', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(939, 1, 0, 5, '2018-08-06 23:03:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(940, 1, 0, 5, '2018-08-06 23:03:43', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(941, 1, 0, 5, '2018-08-06 23:03:48', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(942, 1, 0, 5, '2018-08-06 23:03:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(943, 1, 0, 5, '2018-08-06 23:03:58', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(944, 1, 0, 5, '2018-08-06 23:04:03', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(945, 1, 0, 5, '2018-08-06 23:04:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(946, 1, 0, 5, '2018-08-06 23:04:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(947, 1, 0, 5, '2018-08-06 23:04:18', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(948, 1, 0, 7, '2018-08-06 23:04:23', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(949, 1, 0, 6, '2018-08-06 23:04:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(950, 1, 0, 6, '2018-08-06 23:04:33', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(951, 1, 0, 7, '2018-08-06 23:04:38', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(952, 1, 0, 7, '2018-08-06 23:04:43', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(953, 1, 0, 7, '2018-08-06 23:04:48', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(954, 1, 0, 6, '2018-08-06 23:04:53', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(955, 1, 0, 7, '2018-08-06 23:04:58', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(956, 1, 0, 7, '2018-08-06 23:05:03', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(957, 1, 0, 7, '2018-08-06 23:05:08', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(958, 1, 0, 7, '2018-08-06 23:05:13', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(959, 1, 0, 7, '2018-08-06 23:05:18', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(960, 1, 0, 7, '2018-08-06 23:05:23', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(961, 1, 0, 6, '2018-08-06 23:05:28', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(962, 1, 0, 5, '2018-08-06 23:05:33', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(963, 1, 0, 5, '2018-08-06 23:05:38', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(964, 1, 0, 7, '2018-08-06 23:05:43', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(965, 1, 0, 6, '2018-08-06 23:05:48', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(966, 1, 0, 5, '2018-08-06 23:05:53', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(967, 1, 0, 6, '2018-08-06 23:05:58', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(968, 1, 0, 6, '2018-08-06 23:06:03', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(969, 1, 0, 5, '2018-08-06 23:06:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(970, 1, 0, 5, '2018-08-06 23:06:13', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(971, 1, 0, 4, '2018-08-06 23:06:18', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(972, 1, 0, 6, '2018-08-06 23:06:23', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(973, 1, 0, 7, '2018-08-06 23:06:28', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(974, 1, 0, 7, '2018-08-06 23:06:33', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(975, 1, 0, 7, '2018-08-06 23:06:38', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(976, 1, 0, 7, '2018-08-06 23:06:43', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(977, 1, 0, 6, '2018-08-06 23:06:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(978, 1, 0, 6, '2018-08-06 23:06:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(979, 1, 0, 7, '2018-08-06 23:06:58', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(980, 1, 0, 6, '2018-08-06 23:07:03', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(981, 1, 0, 5, '2018-08-06 23:07:08', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(982, 1, 0, 6, '2018-08-06 23:07:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(983, 1, 0, 6, '2018-08-06 23:07:18', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(984, 1, 0, 5, '2018-08-06 23:07:23', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(985, 1, 0, 5, '2018-08-06 23:07:28', ',2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(986, 1, 0, 4, '2018-08-06 23:07:33', ',2,3,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(987, 1, 0, 6, '2018-08-06 23:07:38', ',2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(988, 1, 0, 6, '2018-08-06 23:07:43', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(989, 1, 0, 6, '2018-08-06 23:07:48', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(990, 1, 0, 6, '2018-08-06 23:07:53', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(991, 1, 0, 7, '2018-08-06 23:07:58', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(992, 1, 0, 7, '2018-08-06 23:08:03', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(993, 1, 0, 6, '2018-08-06 23:08:08', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(994, 1, 0, 6, '2018-08-06 23:08:13', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(995, 1, 0, 7, '2018-08-06 23:08:18', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(996, 1, 0, 6, '2018-08-06 23:08:23', ',1,2,3,4,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(997, 1, 0, 7, '2018-08-06 23:08:28', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(998, 1, 0, 8, '2018-08-06 23:08:33', ',1,2,3,4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(999, 1, 0, 7, '2018-08-06 23:08:38', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1000, 1, 0, 7, '2018-08-06 23:08:43', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1001, 1, 0, 7, '2018-08-06 23:08:48', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1002, 1, 0, 7, '2018-08-06 23:08:53', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1003, 1, 0, 7, '2018-08-06 23:08:58', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1004, 1, 0, 7, '2018-08-06 23:09:03', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1005, 1, 0, 7, '2018-08-06 23:09:08', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1006, 1, 0, 7, '2018-08-06 23:09:13', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1007, 1, 0, 7, '2018-08-06 23:09:18', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1008, 1, 0, 7, '2018-08-06 23:09:23', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1009, 1, 0, 7, '2018-08-06 23:09:28', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1010, 1, 0, 7, '2018-08-06 23:09:33', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1011, 1, 0, 7, '2018-08-06 23:09:38', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1012, 1, 0, 7, '2018-08-06 23:09:43', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1013, 1, 0, 7, '2018-08-06 23:09:48', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1014, 1, 0, 7, '2018-08-06 23:09:53', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1015, 1, 0, 7, '2018-08-06 23:09:58', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1016, 1, 0, 7, '2018-08-06 23:10:03', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1017, 1, 0, 7, '2018-08-06 23:10:08', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1018, 1, 0, 7, '2018-08-06 23:10:13', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1019, 1, 0, 7, '2018-08-06 23:10:18', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1020, 1, 0, 7, '2018-08-06 23:10:23', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1021, 1, 0, 7, '2018-08-06 23:10:28', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1022, 1, 0, 7, '2018-08-06 23:10:33', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1023, 1, 0, 7, '2018-08-06 23:10:38', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1024, 1, 0, 7, '2018-08-06 23:10:43', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1025, 1, 0, 7, '2018-08-06 23:10:48', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1026, 1, 0, 7, '2018-08-06 23:10:53', ',1,2,3,4,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1027, 1, 0, 8, '2018-08-06 23:18:32', ',1,2,3,4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1028, 1, 0, 8, '2018-08-06 23:18:37', ',1,2,3,4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1029, 1, 0, 8, '2018-08-06 23:18:42', ',1,2,3,4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1030, 1, 0, 9, '2018-08-06 23:18:47', ',1,2,3,4,5,7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1031, 1, 0, 8, '2018-08-06 23:18:52', ',1,2,3,4,5,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1032, 1, 0, 3, '2018-08-06 23:19:31', ',7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1033, 1, 0, 3, '2018-08-06 23:19:36', ',7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1034, 1, 0, 4, '2018-08-06 23:19:41', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1035, 1, 0, 4, '2018-08-06 23:19:46', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1036, 1, 0, 4, '2018-08-06 23:19:51', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1037, 1, 0, 4, '2018-08-06 23:19:56', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1038, 1, 0, 4, '2018-08-06 23:20:01', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1039, 1, 0, 4, '2018-08-06 23:20:06', ',7,8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1040, 1, 0, 3, '2018-08-06 23:20:11', ',7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1041, 1, 0, 3, '2018-08-06 23:20:16', ',7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1042, 1, 0, 3, '2018-08-06 23:20:21', ',7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1043, 1, 0, 3, '2018-08-06 23:20:26', ',7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1044, 1, 0, 3, '2018-08-06 23:20:31', ',7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1045, 1, 0, 3, '2018-08-06 23:20:36', ',7,8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1046, 1, 0, 1, '2018-08-06 23:20:41', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1047, 1, 0, 2, '2018-08-06 23:20:46', ',9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1048, 1, 0, 1, '2018-08-06 23:20:51', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1049, 1, 0, 2, '2018-08-06 23:20:56', ',9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1050, 1, 0, 1, '2018-08-06 23:21:01', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1051, 1, 0, 1, '2018-08-06 23:21:06', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1052, 1, 0, 1, '2018-08-06 23:21:11', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1053, 1, 0, 1, '2018-08-06 23:21:16', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1054, 1, 0, 1, '2018-08-06 23:21:21', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1055, 1, 0, 1, '2018-08-06 23:21:26', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1056, 1, 0, 1, '2018-08-06 23:21:40', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1057, 1, 0, 1, '2018-08-06 23:21:45', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1058, 1, 0, 1, '2018-08-06 23:21:50', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1059, 1, 0, 1, '2018-08-06 23:21:55', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1060, 1, 0, 1, '2018-08-06 23:22:00', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1061, 1, 0, 1, '2018-08-06 23:22:05', ',9', '');
INSERT INTO `track_eyes_backup` VALUES(1062, 1, 0, 2, '2018-08-06 23:22:10', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1063, 1, 0, 2, '2018-08-06 23:22:15', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1064, 1, 0, 2, '2018-08-06 23:22:20', ',9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1065, 1, 0, 2, '2018-08-06 23:22:25', ',7,9', '');
INSERT INTO `track_eyes_backup` VALUES(1066, 1, 0, 3, '2018-08-06 23:22:31', ',8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1067, 1, 0, 2, '2018-08-06 23:22:35', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1068, 1, 0, 2, '2018-08-06 23:22:40', ',7,9', '');
INSERT INTO `track_eyes_backup` VALUES(1069, 1, 0, 2, '2018-08-06 23:22:45', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1070, 1, 0, 2, '2018-08-06 23:22:50', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1071, 1, 0, 2, '2018-08-06 23:22:55', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1072, 1, 0, 3, '2018-08-06 23:23:00', ',8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1073, 1, 0, 3, '2018-08-06 23:23:05', ',8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1074, 1, 0, 2, '2018-08-06 23:23:10', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1075, 1, 0, 2, '2018-08-06 23:23:15', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1076, 1, 0, 2, '2018-08-06 23:23:20', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1077, 1, 0, 2, '2018-08-06 23:23:25', ',8,9', '');
INSERT INTO `track_eyes_backup` VALUES(1078, 1, 0, 3, '2018-08-06 23:23:30', ',8,9,10', '');
INSERT INTO `track_eyes_backup` VALUES(1079, 1, 0, 1, '2018-08-06 23:23:35', ',9', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
