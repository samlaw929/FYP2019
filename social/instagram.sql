-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2019 at 12:46 AM
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
-- Table structure for table `instagram`
--

CREATE TABLE `instagram` (
  `brandName` varchar(45) NOT NULL,
  `igName` varchar(45) NOT NULL,
  `igFollowers` int(11) NOT NULL,
  `igFollowings` int(11) NOT NULL,
  `igPosts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `instagram`
--

INSERT INTO `instagram` (`brandName`, `igName`, `igFollowers`, `igFollowings`, `igPosts`) VALUES
('Adidas', 'adidas', 23412666, 153, 741),
('Adidas', 'adidasbaseball', 292234, 197, 1172),
('Adidas', 'adidasfballus', 519377, 310, 1581),
('Adidas', 'adidasfootball', 28248500, 273, 1743),
('Adidas', 'adidashoops', 3007759, 275, 107),
('Adidas', 'adidaslondon', 1649560, 501, 1627),
('Adidas', 'adidasoriginals', 33286708, 171, 2439),
('Adidas', 'adidasph', 577453, 357, 2035),
('Adidas', 'adidasrunning', 2139189, 129, 37),
('Adidas', 'adidastennis', 500820, 36, 730),
('Adidas', 'adidaswomen', 2988082, 769, 1899),
('Adidas', 'adidasy3', 2035708, 18, 2112),
('Asos', 'asos', 9286548, 436, 8012),
('Forever 21', 'forever21', 16079216, 312, 9111),
('Forever 21', 'forever21men', 434493, 143, 2998),
('Forever 21', 'forever21plus', 793822, 116, 2161),
('H&M', 'hm', 29922466, 424, 4721),
('H&M', 'hm_kids', 1112461, 28, 689),
('H&M', 'hm_man', 1370363, 230, 1061),
('Mango', 'mango', 9862454, 243, 3508),
('Mango', 'mangokids', 402209, 187, 980),
('Mango', 'mango_man', 451680, 238, 1768),
('Michael Kors', 'michaelkors', 14381191, 278, 4639),
('Nike', 'nike', 86841254, 55, 726),
('Nike', 'nikebasketball', 10645117, 78, 783),
('Nike', 'nikelondon', 748721, 15, 398),
('Nike', 'nikerunning', 5535293, 171, 1037),
('Nike', 'nikesportswear', 6945838, 74, 1047),
('Nike', 'niketraining', 1628952, 171, 243),
('Nike', 'nikewomen', 7632915, 156, 778),
('TopShop', 'topman', 661891, 780, 3442),
('TopShop', 'topshop', 9726685, 748, 6349),
('Urban Outfitters', 'urbanoutfitters', 8546048, 223, 10383),
('Urban Outfitters', 'urbanoutfittersmens', 443593, 306, 4755),
('Zara', 'zara', 32272494, 50, 2426),
('Zara', 'zarakids', 103570, 1, 60),
('Zara', 'zaraman', 33685, 1, 51);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `instagram`
--
ALTER TABLE `instagram`
  ADD PRIMARY KEY (`igName`) USING BTREE,
  ADD UNIQUE KEY `igName_UNIQUE` (`igName`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
