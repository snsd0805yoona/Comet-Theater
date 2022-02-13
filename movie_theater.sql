-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 06, 2021 at 03:54 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_theater`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `actorid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart_own_movie`
--

CREATE TABLE `cart_own_movie` (
  `userid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `MovieID` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `ticket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movie_order`
--

CREATE TABLE `movie_order` (
  `orderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `Total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movie_own_actor`
--

CREATE TABLE `movie_own_actor` (
  `movieid` int(11) NOT NULL,
  `actorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movie_own_category`
--

CREATE TABLE `movie_own_category` (
  `movieid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orderid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_own_movie`
--

CREATE TABLE `order_own_movie` (
  `orderid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `Admin_Or_User` tinyint(4) NOT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `email`, `password`, `Admin_Or_User`, `phone`) VALUES
(1, 'user1', 'user1@gmail.com', '123456', 0, NULL),
(2, 'admin1', 'admin1@gmail.com', '123789', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actorid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `cart_own_movie`
--
ALTER TABLE `cart_own_movie`
  ADD PRIMARY KEY (`userid`,`movieid`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`MovieID`);

--
-- Indexes for table `movie_order`
--
ALTER TABLE `movie_order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `movie_order_ibfk_1` (`UserID`);

--
-- Indexes for table `movie_own_actor`
--
ALTER TABLE `movie_own_actor`
  ADD PRIMARY KEY (`movieid`,`actorid`),
  ADD KEY `actorid` (`actorid`);

--
-- Indexes for table `movie_own_category`
--
ALTER TABLE `movie_own_category`
  ADD PRIMARY KEY (`movieid`,`categoryid`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orderid`,`movieid`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `order_own_movie`
--
ALTER TABLE `order_own_movie`
  ADD PRIMARY KEY (`orderid`,`movieid`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actor`
--
ALTER TABLE `actor`
  MODIFY `actorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `MovieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `movie_order`
--
ALTER TABLE `movie_order`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `cart_own_movie`
--
ALTER TABLE `cart_own_movie`
  ADD CONSTRAINT `cart_own_movie_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `cart_own_movie_ibfk_2` FOREIGN KEY (`movieid`) REFERENCES `movie` (`MovieID`);

--
-- Constraints for table `movie_order`
--
ALTER TABLE `movie_order`
  ADD CONSTRAINT `movie_order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`userid`);

--
-- Constraints for table `movie_own_actor`
--
ALTER TABLE `movie_own_actor`
  ADD CONSTRAINT `movie_own_actor_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_own_actor_ibfk_2` FOREIGN KEY (`actorid`) REFERENCES `actor` (`actorid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_own_category`
--
ALTER TABLE `movie_own_category`
  ADD CONSTRAINT `movie_own_category_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_own_category_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `movie_order` (`orderID`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`movieid`) REFERENCES `movie` (`MovieID`);

--
-- Constraints for table `order_own_movie`
--
ALTER TABLE `order_own_movie`
  ADD CONSTRAINT `order_own_movie_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movie` (`MovieID`),
  ADD CONSTRAINT `order_own_movie_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `movie_order` (`orderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
