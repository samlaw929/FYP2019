-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2019 at 12:47 AM
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
-- Table structure for table `twitter`
--

CREATE TABLE `twitter` (
  `brandName` varchar(45) NOT NULL,
  `tName` varchar(45) NOT NULL,
  `tFollowers` int(11) NOT NULL,
  `tFollowings` int(11) NOT NULL,
  `tTweets` int(11) NOT NULL,
  `tLikes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `twitter`
--

INSERT INTO `twitter` (`brandName`, `tName`, `tFollowers`, `tFollowings`, `tTweets`, `tLikes`) VALUES
('Adidas', 'adidas', 3586206, 154, 13753, 8591),
('Adidas', 'adidasoriginals', 4033990, 367, 17441, 9249),
('Adidas', 'adidasUK', 828155, 720, 97611, 11752),
('Asos', 'ASOS', 1031418, 4366, 224086, 12986),
('Forever 21', 'Forever21', 2157411, 337, 20902, 4203),
('H&M', 'hm', 8454482, 333, 12540, 456),
('H&M', 'hmunitedkingdon', 220679, 503, 20554, 2356),
('Mango', 'Mango', 784092, 2745, 33467, 4375),
('Michael Kors', 'MichaelKors', 3532863, 591, 12516, 3516),
('Nike', 'Nike', 7759945, 116, 35836, 6510),
('Nike', 'nikestore', 4572797, 132, 347176, 1794),
('Nike', 'NikeUK', 440000, 232, 26600, 1580),
('TopShop', 'Topman', 107220, 1999, 47161, 6572),
('TopShop', 'Topshop', 1259677, 10738, 59693, 9099),
('Urban Outfitters', 'UrbanOutfitter', 1015932, 3258, 35267, 7624),
('Zara', 'ZARA', 1313230, 69, 32223, 65);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `twitter`
--
ALTER TABLE `twitter`
  ADD PRIMARY KEY (`tName`) USING BTREE,
  ADD UNIQUE KEY `tName_UNIQUE` (`tName`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
