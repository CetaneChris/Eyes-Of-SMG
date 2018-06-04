-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2018 at 12:53 AM
-- Server version: 5.7.14
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

DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `D1_ID` int(11) NOT NULL,
  `D2_ID` int(11) NOT NULL,
  `THEATER_NUM` int(11) NOT NULL,
  `LOCATION_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` VALUES(1, 2, 1, 1);
INSERT INTO `devices` VALUES(3, 4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `MESSAGE` varchar(32) NOT NULL
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
CREATE TABLE `theaters` (
  `ID` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL
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
CREATE TABLE `track_eyes` (
  `track_id` int(11) NOT NULL,
  `D_ID` int(11) NOT NULL,
  `HAS_ATTENTION` int(11) NOT NULL,
  `TOTAL` int(11) NOT NULL,
  `TIMESTAMP` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_eyes`
--

INSERT INTO `track_eyes` VALUES(1, 1, 1, 1, '2018-02-15 00:03:31');
INSERT INTO `track_eyes` VALUES(3, 1, 3, 3, '2018-05-04 07:10:00');
INSERT INTO `track_eyes` VALUES(2, 1, 2, 3, '2018-05-04 07:05:00');
INSERT INTO `track_eyes` VALUES(4, 1, 5, 5, '2018-05-04 07:15:00');
INSERT INTO `track_eyes` VALUES(5, 1, 4, 5, '2018-05-04 07:20:00');
INSERT INTO `track_eyes` VALUES(6, 1, 6, 6, '2018-05-04 07:25:00');
INSERT INTO `track_eyes` VALUES(7, 1, 5, 6, '2018-05-04 07:30:00');
INSERT INTO `track_eyes` VALUES(8, 1, 5, 6, '2018-05-04 07:35:00');
INSERT INTO `track_eyes` VALUES(9, 1, 6, 8, '2018-05-04 07:40:00');
INSERT INTO `track_eyes` VALUES(10, 1, 7, 8, '2018-05-04 07:45:00');
INSERT INTO `track_eyes` VALUES(11, 1, 5, 8, '2018-05-04 07:50:00');
INSERT INTO `track_eyes` VALUES(12, 1, 5, 8, '2018-05-04 07:55:00');
INSERT INTO `track_eyes` VALUES(13, 1, 7, 8, '2018-05-04 08:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `track_eyes`
--
ALTER TABLE `track_eyes`
  ADD PRIMARY KEY (`track_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `track_eyes`
--
ALTER TABLE `track_eyes`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
