-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2018 at 04:41 PM
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
CREATE TABLE IF NOT EXISTS `devices` (
  `D_ID` int(11) NOT NULL,
  `ROOM_ID` int(11) NOT NULL,
  `LOCATION_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `devices`
--

TRUNCATE TABLE `devices`;
-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `ID` int(11) NOT NULL,
  `MESSAGE` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `status`
--

TRUNCATE TABLE `status`;
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

DROP TABLE IF EXISTS `theaters`;
CREATE TABLE IF NOT EXISTS `theaters` (
  `ID` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `theaters`
--

TRUNCATE TABLE `theaters`;
--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`ID`, `STATUS`) VALUES
(1, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `track_eyes`
--

DROP TABLE IF EXISTS `track_eyes`;
CREATE TABLE IF NOT EXISTS `track_eyes` (
  `D_ID` int(11) NOT NULL,
  `HAS_ATTENTION` int(11) NOT NULL,
  `TOTAL` int(11) NOT NULL,
  `TIMESTAMP` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `track_eyes`
--

TRUNCATE TABLE `track_eyes`;
--
-- Dumping data for table `track_eyes`
--

INSERT INTO `track_eyes` (`D_ID`, `HAS_ATTENTION`, `TOTAL`, `TIMESTAMP`) VALUES
(1, 1, 1, '2018-02-15 00:03:31');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
