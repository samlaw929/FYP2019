-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2019 at 12:41 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `brandinfo`
--

CREATE TABLE `brandinfo` (
  `brandID` int(11) NOT NULL,
  `brandName` varchar(45) NOT NULL,
  `brandType` varchar(45) NOT NULL,
  `brandGenFoc` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `brandinfo`
--

INSERT INTO `brandinfo` (`brandID`, `brandName`, `brandType`, `brandGenFoc`) VALUES
(1, 'Nike', 'Sports', 'U'),
(2, 'H&M', 'Fast', 'U'),
(3, 'Zara', 'Fast', 'U'),
(4, 'Adidas', 'Sports', 'U'),
(5, 'Forever 21', 'Fast', 'F'),
(6, 'Michael Kors', 'Fast', 'F'),
(7, 'TopShop', 'Fast', 'U'),
(8, 'Urban Outfitters', 'Fast', 'U'),
(9, 'Mango', 'Fast', 'F'),
(10, 'Asos', 'Online', 'U');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brandinfo`
--
ALTER TABLE `brandinfo`
  ADD PRIMARY KEY (`brandID`) USING BTREE,
  ADD UNIQUE KEY `brandID_UNIQUE` (`brandID`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
