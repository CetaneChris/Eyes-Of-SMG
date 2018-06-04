-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 04, 2018 at 02:07 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
CREATE TABLE IF NOT EXISTS `devices` (
  `D_ID` INT NOT NULL,
  `THEATER_NUM` INT NOT NULL,
  `LOCATION_ID` INT NOT NULL,
  UNIQUE KEY `D_ID` (`D_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` VALUES(1, 1, 1);
INSERT INTO `devices` VALUES(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `ID` INT NOT NULL,
  `MESSAGE` varchar(32) NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `ID` INT NOT NULL,
  `STATUS` INT NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` VALUES(1, 1);
INSERT INTO `theaters` VALUES(2, 3);
INSERT INTO `theaters` VALUES(3, 2);
INSERT INTO `theaters` VALUES(4, 1);
INSERT INTO `theaters` VALUES(5, 3);
INSERT INTO `theaters` VALUES(6, 1);
INSERT INTO `theaters` VALUES(7, 3);
INSERT INTO `theaters` VALUES(8, 1);
INSERT INTO `theaters` VALUES(9, 3);
INSERT INTO `theaters` VALUES(10, 3);
INSERT INTO `theaters` VALUES(11, 2);
INSERT INTO `theaters` VALUES(12, 1);
INSERT INTO `theaters` VALUES(13, 2);
INSERT INTO `theaters` VALUES(14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `track_eyes`
--

DROP TABLE IF EXISTS `track_eyes`;
CREATE TABLE IF NOT EXISTS `track_eyes` (
  `TRACK_ID` INT NOT NULL AUTO_INCREMENT,
  `D_ID` INT NOT NULL,
  `HAS_ATTENTION` INT NOT NULL,
  `TOTAL` INT NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TRACK_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_eyes`
--

INSERT INTO `track_eyes` VALUES(1, 1, 1, 1, '2018-05-04 02:00:00');
INSERT INTO `track_eyes` VALUES(3, 1, 3, 3, '2018-05-04 02:10:00');
INSERT INTO `track_eyes` VALUES(2, 1, 2, 3, '2018-05-04 02:05:00');
INSERT INTO `track_eyes` VALUES(4, 1, 5, 5, '2018-05-04 02:15:00');
INSERT INTO `track_eyes` VALUES(5, 1, 4, 5, '2018-05-04 02:20:00');
INSERT INTO `track_eyes` VALUES(6, 1, 6, 6, '2018-05-04 02:25:00');
INSERT INTO `track_eyes` VALUES(7, 1, 5, 6, '2018-05-04 02:30:00');
INSERT INTO `track_eyes` VALUES(8, 1, 5, 6, '2018-05-04 02:35:00');
INSERT INTO `track_eyes` VALUES(9, 1, 6, 8, '2018-05-04 02:40:00');
INSERT INTO `track_eyes` VALUES(10, 1, 7, 8, '2018-05-04 02:45:00');
INSERT INTO `track_eyes` VALUES(11, 1, 5, 8, '2018-05-04 02:50:00');
INSERT INTO `track_eyes` VALUES(12, 1, 5, 8, '2018-05-04 02:55:00');
INSERT INTO `track_eyes` VALUES(13, 1, 7, 8, '2018-05-04 03:00:00');
INSERT INTO `track_eyes` VALUES(14, 2, 1, 1, '2018-05-04 02:35:00');
INSERT INTO `track_eyes` VALUES(15, 2, 1, 1, '2018-05-04 02:40:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
