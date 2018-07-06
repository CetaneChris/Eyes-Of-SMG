-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 06, 2018 at 03:03 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
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

INSERT INTO `purchase_history` VALUES(1, 1, 1, 'FOOD', 'BURGER', '2018-05-04 02:05:04');
INSERT INTO `purchase_history` VALUES(2, 1, 1, 'BEVERAGE', 'COORS', '2018-05-04 02:09:29');
INSERT INTO `purchase_history` VALUES(3, 1, 2, 'SIDE', 'POPCORN', '2018-05-04 02:13:13');
INSERT INTO `purchase_history` VALUES(4, 1, 2, 'BEVERAGE', 'COKE', '2018-05-04 02:18:36');
INSERT INTO `purchase_history` VALUES(5, 1, 3, 'BEVERAGE', 'SPRITE', '2018-05-04 02:22:36');
INSERT INTO `purchase_history` VALUES(6, 1, 3, 'FOOD', 'PIZZA', '2018-05-04 02:28:13');
INSERT INTO `purchase_history` VALUES(7, 1, 3, 'BEVERAGE', 'COORS', '2018-05-04 02:28:13');
INSERT INTO `purchase_history` VALUES(8, 1, 1, 'FOOD', 'BURGER', '2018-05-04 02:05:04');
INSERT INTO `purchase_history` VALUES(9, 1, 1, 'BEVERAGE', 'COORS', '2018-05-04 02:09:29');
INSERT INTO `purchase_history` VALUES(10, 1, 2, 'SIDE', 'POPCORN', '2018-05-04 02:13:13');
INSERT INTO `purchase_history` VALUES(11, 1, 2, 'BEVERAGE', 'COKE', '2018-05-04 02:18:36');
INSERT INTO `purchase_history` VALUES(12, 1, 3, 'BEVERAGE', 'SPRITE', '2018-05-04 02:22:36');
INSERT INTO `purchase_history` VALUES(13, 1, 3, 'FOOD', 'PIZZA', '2018-05-04 02:28:13');
INSERT INTO `purchase_history` VALUES(14, 1, 3, 'BEVERAGE', 'COORS', '2018-05-04 02:28:13');
INSERT INTO `purchase_history` VALUES(15, 1, 1, 'FOOD', 'BURGER', '2018-05-04 02:05:04');
INSERT INTO `purchase_history` VALUES(16, 1, 1, 'BEVERAGE', 'COORS', '2018-05-04 02:09:29');
INSERT INTO `purchase_history` VALUES(17, 1, 2, 'SIDE', 'POPCORN', '2018-05-04 02:13:13');
INSERT INTO `purchase_history` VALUES(18, 1, 2, 'BEVERAGE', 'COKE', '2018-05-04 02:18:36');
INSERT INTO `purchase_history` VALUES(19, 1, 3, 'BEVERAGE', 'SPRITE', '2018-05-04 02:22:36');
INSERT INTO `purchase_history` VALUES(20, 1, 3, 'FOOD', 'PIZZA', '2018-05-04 02:28:13');
INSERT INTO `purchase_history` VALUES(21, 1, 3, 'BEVERAGE', 'COORS', '2018-05-04 02:28:13');
INSERT INTO `purchase_history` VALUES(22, 1, 1, 'SIDE', 'PRETZEL', '2018-05-04 02:33:00');
INSERT INTO `purchase_history` VALUES(23, 3, 1, 'FOOD', 'BURGER', '2018-05-04 02:05:04');
INSERT INTO `purchase_history` VALUES(24, 3, 1, 'BEVERAGE', 'COORS', '2018-05-04 02:09:29');
INSERT INTO `purchase_history` VALUES(25, 3, 2, 'SIDE', 'POPCORN', '2018-05-04 02:13:13');
INSERT INTO `purchase_history` VALUES(26, 3, 2, 'BEVERAGE', 'COKE', '2018-05-04 02:18:36');
INSERT INTO `purchase_history` VALUES(27, 3, 3, 'BEVERAGE', 'SPRITE', '2018-05-04 02:22:36');
INSERT INTO `purchase_history` VALUES(28, 3, 3, 'FOOD', 'PIZZA', '2018-05-04 02:28:13');
INSERT INTO `purchase_history` VALUES(29, 3, 3, 'BEVERAGE', 'COORS', '2018-05-04 02:28:13');

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
  `OCCUPIED` varchar(10000) NOT NULL,
  `ATTENTION` varchar(10000) NOT NULL,
  PRIMARY KEY (`TRACK_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_eyes`
--

INSERT INTO `track_eyes` VALUES(1, 1, 1, 1, '2018-05-04 02:00:00', '', '');
INSERT INTO `track_eyes` VALUES(3, 1, 3, 3, '2018-05-04 02:10:00', '', '');
INSERT INTO `track_eyes` VALUES(2, 1, 2, 3, '2018-05-04 02:05:00', '', '');
INSERT INTO `track_eyes` VALUES(4, 1, 5, 5, '2018-05-04 02:15:00', '', '');
INSERT INTO `track_eyes` VALUES(5, 1, 4, 5, '2018-05-04 02:20:00', '', '');
INSERT INTO `track_eyes` VALUES(6, 1, 6, 6, '2018-05-04 02:25:00', '', '');
INSERT INTO `track_eyes` VALUES(7, 1, 5, 6, '2018-05-04 02:30:00', '', '');
INSERT INTO `track_eyes` VALUES(8, 1, 5, 6, '2018-05-04 02:35:00', '', '');
INSERT INTO `track_eyes` VALUES(9, 1, 6, 8, '2018-05-04 02:40:00', '', '');
INSERT INTO `track_eyes` VALUES(10, 1, 7, 8, '2018-05-04 02:45:00', '', '');
INSERT INTO `track_eyes` VALUES(11, 1, 5, 8, '2018-05-04 02:50:00', '', '');
INSERT INTO `track_eyes` VALUES(12, 1, 5, 8, '2018-05-04 02:55:00', '', '');
INSERT INTO `track_eyes` VALUES(13, 1, 7, 8, '2018-05-04 03:00:00', '', '');
INSERT INTO `track_eyes` VALUES(15, 2, 2, 3, '2018-05-04 02:05:00', '', '');
INSERT INTO `track_eyes` VALUES(14, 2, 1, 1, '2018-05-04 02:00:00', '', '');
INSERT INTO `track_eyes` VALUES(16, 2, 3, 3, '2018-05-04 02:10:00', '', '');
INSERT INTO `track_eyes` VALUES(17, 2, 5, 5, '2018-05-04 02:15:00', '', '');
INSERT INTO `track_eyes` VALUES(18, 2, 4, 5, '2018-05-04 02:20:00', '', '');
INSERT INTO `track_eyes` VALUES(19, 2, 6, 6, '2018-05-04 02:25:00', '', '');
INSERT INTO `track_eyes` VALUES(20, 2, 5, 6, '2018-05-04 02:30:00', '', '');
INSERT INTO `track_eyes` VALUES(21, 2, 5, 6, '2018-05-04 02:35:00', '', '');
INSERT INTO `track_eyes` VALUES(22, 2, 6, 8, '2018-05-04 02:40:00', '', '');
INSERT INTO `track_eyes` VALUES(23, 2, 7, 8, '2018-05-04 02:45:00', '', '');
INSERT INTO `track_eyes` VALUES(24, 2, 5, 8, '2018-05-04 02:50:00', '', '');
INSERT INTO `track_eyes` VALUES(25, 2, 5, 8, '2018-05-04 02:55:00', '', '');
INSERT INTO `track_eyes` VALUES(26, 2, 7, 8, '2018-05-04 03:00:00', '', '');
INSERT INTO `track_eyes` VALUES(27, 3, 2, 3, '2018-05-04 02:05:00', '', '');
INSERT INTO `track_eyes` VALUES(28, 3, 1, 1, '2018-05-04 02:00:00', '', '');
INSERT INTO `track_eyes` VALUES(29, 3, 3, 3, '2018-05-04 02:10:00', '', '');
INSERT INTO `track_eyes` VALUES(30, 3, 5, 5, '2018-05-04 02:15:00', '', '');
INSERT INTO `track_eyes` VALUES(31, 3, 4, 5, '2018-05-04 02:20:00', '', '');
INSERT INTO `track_eyes` VALUES(32, 3, 6, 6, '2018-05-04 02:25:00', '', '');
INSERT INTO `track_eyes` VALUES(33, 3, 5, 6, '2018-05-04 02:30:00', '', '');
INSERT INTO `track_eyes` VALUES(34, 3, 5, 6, '2018-05-04 02:35:00', '', '');
INSERT INTO `track_eyes` VALUES(35, 3, 6, 8, '2018-05-04 02:40:00', '', '');
INSERT INTO `track_eyes` VALUES(36, 3, 7, 8, '2018-05-04 02:45:00', '', '');
INSERT INTO `track_eyes` VALUES(37, 3, 5, 8, '2018-05-04 02:50:00', '', '');
INSERT INTO `track_eyes` VALUES(38, 3, 5, 8, '2018-05-04 02:55:00', '', '');
INSERT INTO `track_eyes` VALUES(39, 3, 7, 8, '2018-05-04 03:00:00', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
