-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2023 at 09:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manoj`
--

-- --------------------------------------------------------

--
-- Table structure for table `available`
--

CREATE TABLE `available` (
  `cid` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `miniprice` varchar(30) DEFAULT NULL,
  `year` varchar(30) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `msrp` varchar(20) DEFAULT NULL,
  `Did` varchar(30) DEFAULT NULL,
  `img` varchar(100) NOT NULL,
  `mpg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `available`
--

INSERT INTO `available` (`cid`, `name`, `miniprice`, `year`, `model`, `msrp`, `Did`, `img`, `mpg`) VALUES
('100', 'RR', '100000', '2023', 'BM43', '500000', '1', './img/crop1.jpg', '18/22'),
('101', 'TRON', '500000', '2021', 'T45', '8000000', '1', './img/copy9.jpg', '10/20'),
('102', 'PORSCHE PANAMERA', '500000', '2023', 'PP43', '2000000', '1', './img/2.jpg', '5/10'),
('102', 'PORSCHE PANAMERA', '500000', '2023', 'PP43', '2000000', '2', './img/2.jpg', '5/10'),
('102', 'PORSCHE PANAMERA', '500000', '2023', 'PP43', '2000000', '3', './img/2.jpg', '5/10'),
('103', 'LAMBORGHINI', '100000', '2023', 'SIAN FKP 37', '3000000', '1', './img/8.jpg', '10/30'),
('103', 'LAMBORGHINI', '100000', '2023', 'SIAN FKP 37', '3000000', '2', './img/8.jpg', '10/30'),
('103', 'LAMBORGHINI', '100000', '2023', 'SIAN FKP 37', '3000000', '3', './img/8.jpg', '10/30'),
('104', 'FERRARI', '1500000', '2020', 'FXX-K', '3000000', '1', './img/6.jpg', '23/80'),
('104', 'FERRARI', '1500000', '2020', 'FXX-K', '3000000', '2', './img/6.jpg', '23/80'),
('105', 'AUDI', '2000000', '2021', 'A5', '5000000', '3', './img/3.jpg', '5/10'),
('106', 'Ferrari', '1500000', '2021', '458', '3000000', '4', './img/crop7.jpg', '5/10'),
('106', 'Ferrari', '1500000', '2021', '458', '3000000', '5', './img/crop7.jpg', '5/10'),
('105', 'AUDI', '2000000', '2021', 'A5', '5000000', '4', './img/3.jpg', '5/10'),
('104', 'FERRARI', '1500000', '2020', 'FXX-K', '3000000', '5', './img/6.jpg', '23/80'),
('107', 'Toyota', '1000000', '2022', 'SUV', '4000000', '4', './img/Car15.PNG', '15/10'),
('107', 'Toyota', '1000000', '2022', 'SUV', '4000000', '5', './img/Car15.PNG', '15/10');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `fname` varchar(40) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `mno` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `profile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`fname`, `lname`, `mno`, `email`, `password`, `profile`) VALUES
('manoj', 'KUMAR', '9581771438', 'manojkumarpagadala007@gmail.com', 'manoj', 'Devloper.jpg'),
('sai', 'ram', '9865432634', 'sairamsr04p@gmail.com', 'sai', 'Devloper.jpg'),
('ajay', 'KUMAR', '7331142480', 'ajay@gmail.com', 'ajay@123', 'Devloper.jpg'),
('siva', 'gopi', '9491006514', 'siva@gmail.com', 'Siva', 'Devloper.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `zip` varchar(20) DEFAULT NULL,
  `Did` varchar(20) DEFAULT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `mno` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`zip`, `Did`, `fname`, `mno`, `email`, `address`) VALUES
('1234', '1', 'manoj', '9581771438', 'manoj@gmail.com', 'Dno-1/20 vijayawada'),
('1234', '2', 'sai', '9876543234', 'sai@gmail.com', 'Dno-3/15 mylavaram '),
('1234', '3', 'remo', '783975935', 'remo@gmail.com', 'Dno-3/12 vellaturu'),
('9876', '4', 'ramesh', '9000456321', 'ramesh@gmail.com', 'DNo-5/20 gollapudi'),
('9876', '5', 'raghava', '78965421', 'raghava@gmail.com', 'DNo-5/20 Bhavanipuruam');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
