-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 03:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mega_city_cab`
--

-- --------------------------------------------------------

--
-- Table structure for table `bike_fare`
--

CREATE TABLE `bike_fare` (
  `pickup` varchar(100) NOT NULL,
  `dropoff` varchar(100) NOT NULL,
  `fare` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bike_fare`
--

INSERT INTO `bike_fare` (`pickup`, `dropoff`, `fare`) VALUES
('Fort', 'Slave Island', 200),
('Fort', 'Kollupitiya', 250),
('Fort', 'Bambalapitiya', 300),
('Fort', 'Havelock Town', 350),
('Fort', 'Wellawatta', 250),
('Fort', 'Cinnamon Gardens', 300),
('Fort', 'Borella', 350),
('Fort', 'Dematagoda', 450),
('Fort', 'Dehiwala', 500),
('Slave Island', 'Fort', 200),
('Slave Island', 'Kollupitiya', 250),
('Slave Island', 'Bambalapitiya', 300),
('Slave Island', 'Havelock Town', 350),
('Slave Island', 'Wellawatta', 250),
('Slave Island', 'Cinnamon Gardens', 300),
('Slave Island', 'Borella', 350),
('Slave Island', 'Dematagoda', 450),
('Slave Island', 'Dehiwala', 500),
('Kollupitiya', 'Fort', 250),
('Kollupitiya', 'Slave Island', 250),
('Kollupitiya', 'Bambalapitiya', 300),
('Kollupitiya', 'Havelock Town', 350),
('Kollupitiya', 'Wellawatta', 300),
('Kollupitiya', 'Cinnamon Gardens', 350),
('Kollupitiya', 'Borella', 400),
('Kollupitiya', 'Dematagoda', 450),
('Kollupitiya', 'Dehiwala', 500),
('Bambalapitiya', 'Fort', 300),
('Bambalapitiya', 'Slave Island', 300),
('Bambalapitiya', 'Kollupitiya', 350),
('Bambalapitiya', 'Havelock Town', 400),
('Bambalapitiya', 'Wellawatta', 300),
('Bambalapitiya', 'Cinnamon Gardens', 350),
('Bambalapitiya', 'Borella', 400),
('Bambalapitiya', 'Dematagoda', 500),
('Bambalapitiya', 'Dehiwala', 550),
('Havelock Town', 'Fort', 350),
('Havelock Town', 'Slave Island', 350),
('Havelock Town', 'Kollupitiya', 400),
('Havelock Town', 'Bambalapitiya', 400),
('Havelock Town', 'Wellawatta', 350),
('Havelock Town', 'Cinnamon Gardens', 400),
('Havelock Town', 'Borella', 450),
('Havelock Town', 'Dematagoda', 550),
('Havelock Town', 'Dehiwala', 600),
('Wellawatta', 'Fort', 250),
('Wellawatta', 'Slave Island', 250),
('Wellawatta', 'Kollupitiya', 300),
('Wellawatta', 'Bambalapitiya', 300),
('Wellawatta', 'Havelock Town', 350),
('Wellawatta', 'Cinnamon Gardens', 350),
('Wellawatta', 'Borella', 400),
('Wellawatta', 'Dematagoda', 450),
('Wellawatta', 'Dehiwala', 500),
('Cinnamon Gardens', 'Fort', 400),
('Cinnamon Gardens', 'Slave Island', 400),
('Cinnamon Gardens', 'Kollupitiya', 450),
('Cinnamon Gardens', 'Bambalapitiya', 500),
('Cinnamon Gardens', 'Havelock Town', 550),
('Cinnamon Gardens', 'Wellawatta', 500),
('Cinnamon Gardens', 'Borella', 550),
('Cinnamon Gardens', 'Dematagoda', 600),
('Cinnamon Gardens', 'Dehiwala', 650),
('Borella', 'Fort', 400),
('Borella', 'Slave Island', 400),
('Borella', 'Kollupitiya', 450),
('Borella', 'Bambalapitiya', 500),
('Borella', 'Havelock Town', 550),
('Borella', 'Wellawatta', 500),
('Borella', 'Cinnamon Gardens', 550),
('Borella', 'Dematagoda', 600),
('Borella', 'Dehiwala', 650),
('Dematagoda', 'Fort', 450),
('Dematagoda', 'Slave Island', 450),
('Dematagoda', 'Kollupitiya', 500),
('Dematagoda', 'Bambalapitiya', 550),
('Dematagoda', 'Havelock Town', 600),
('Dematagoda', 'Wellawatta', 550),
('Dematagoda', 'Cinnamon Gardens', 600),
('Dematagoda', 'Borella', 600),
('Dematagoda', 'Dehiwala', 700),
('Dehiwala', 'Fort', 550),
('Dehiwala', 'Slave Island', 550),
('Dehiwala', 'Kollupitiya', 600),
('Dehiwala', 'Bambalapitiya', 650),
('Dehiwala', 'Havelock Town', 700),
('Dehiwala', 'Wellawatta', 650),
('Dehiwala', 'Cinnamon Gardens', 650),
('Dehiwala', 'Borella', 700),
('Dehiwala', 'Dematagoda', 700),
('Fort', 'Fort', 100),
('Slave Island', 'Slave Island', 100),
('Kollupitiya', 'Kollupitiya', 100),
('Bambalapitiya', 'Bambalapitiya', 100),
('Havelock Town', 'Havelock Town', 100),
('Wellawatta', 'Wellawatta', 100),
('Cinnamon Gardens', 'Cinnamon Gardens', 100),
('Borella', 'Borella', 100),
('Dematagoda', 'Dematagoda', 100),
('Dehiwala', 'Dehiwala', 100);

-- --------------------------------------------------------

--
-- Table structure for table `car_fare`
--

CREATE TABLE `car_fare` (
  `pickup` varchar(100) NOT NULL,
  `dropoff` varchar(100) NOT NULL,
  `fare` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_fare`
--

INSERT INTO `car_fare` (`pickup`, `dropoff`, `fare`) VALUES
('Fort', 'Slave Island', 500),
('Fort', 'Kollupitiya', 600),
('Fort', 'Bambalapitiya', 700),
('Fort', 'Havelock Town', 800),
('Fort', 'Wellawatta', 700),
('Fort', 'Cinnamon Gardens', 800),
('Fort', 'Borella', 900),
('Fort', 'Dematagoda', 1000),
('Fort', 'Dehiwala', 1100),
('Slave Island', 'Fort', 500),
('Slave Island', 'Kollupitiya', 600),
('Slave Island', 'Bambalapitiya', 700),
('Slave Island', 'Havelock Town', 800),
('Slave Island', 'Wellawatta', 700),
('Slave Island', 'Cinnamon Gardens', 800),
('Slave Island', 'Borella', 900),
('Slave Island', 'Dematagoda', 1000),
('Slave Island', 'Dehiwala', 1100),
('Kollupitiya', 'Fort', 600),
('Kollupitiya', 'Slave Island', 600),
('Kollupitiya', 'Bambalapitiya', 700),
('Kollupitiya', 'Havelock Town', 800),
('Kollupitiya', 'Wellawatta', 700),
('Kollupitiya', 'Cinnamon Gardens', 800),
('Kollupitiya', 'Borella', 900),
('Kollupitiya', 'Dematagoda', 1000),
('Kollupitiya', 'Dehiwala', 1100),
('Bambalapitiya', 'Fort', 700),
('Bambalapitiya', 'Slave Island', 700),
('Bambalapitiya', 'Kollupitiya', 700),
('Bambalapitiya', 'Havelock Town', 800),
('Bambalapitiya', 'Wellawatta', 800),
('Bambalapitiya', 'Cinnamon Gardens', 900),
('Bambalapitiya', 'Borella', 1000),
('Bambalapitiya', 'Dematagoda', 1100),
('Bambalapitiya', 'Dehiwala', 1200),
('Havelock Town', 'Fort', 800),
('Havelock Town', 'Slave Island', 800),
('Havelock Town', 'Kollupitiya', 800),
('Havelock Town', 'Bambalapitiya', 800),
('Havelock Town', 'Wellawatta', 900),
('Havelock Town', 'Cinnamon Gardens', 1000),
('Havelock Town', 'Borella', 1100),
('Havelock Town', 'Dematagoda', 1200),
('Havelock Town', 'Dehiwala', 1300),
('Wellawatta', 'Fort', 700),
('Wellawatta', 'Slave Island', 700),
('Wellawatta', 'Kollupitiya', 700),
('Wellawatta', 'Bambalapitiya', 800),
('Wellawatta', 'Havelock Town', 900),
('Wellawatta', 'Cinnamon Gardens', 1000),
('Wellawatta', 'Borella', 1100),
('Wellawatta', 'Dematagoda', 1200),
('Wellawatta', 'Dehiwala', 1300),
('Cinnamon Gardens', 'Fort', 800),
('Cinnamon Gardens', 'Slave Island', 800),
('Cinnamon Gardens', 'Kollupitiya', 800),
('Cinnamon Gardens', 'Bambalapitiya', 900),
('Cinnamon Gardens', 'Havelock Town', 1000),
('Cinnamon Gardens', 'Wellawatta', 1000),
('Cinnamon Gardens', 'Borella', 1100),
('Cinnamon Gardens', 'Dematagoda', 1200),
('Cinnamon Gardens', 'Dehiwala', 1300),
('Borella', 'Fort', 900),
('Borella', 'Slave Island', 900),
('Borella', 'Kollupitiya', 900),
('Borella', 'Bambalapitiya', 1000),
('Borella', 'Havelock Town', 1100),
('Borella', 'Wellawatta', 1100),
('Borella', 'Cinnamon Gardens', 1100),
('Borella', 'Dematagoda', 1200),
('Borella', 'Dehiwala', 1300),
('Dematagoda', 'Fort', 1000),
('Dematagoda', 'Slave Island', 1000),
('Dematagoda', 'Kollupitiya', 1000),
('Dematagoda', 'Bambalapitiya', 1100),
('Dematagoda', 'Havelock Town', 1200),
('Dematagoda', 'Wellawatta', 1200),
('Dematagoda', 'Cinnamon Gardens', 1200),
('Dematagoda', 'Borella', 1200),
('Dematagoda', 'Dehiwala', 1400),
('Dehiwala', 'Fort', 1100),
('Dehiwala', 'Slave Island', 1100),
('Dehiwala', 'Kollupitiya', 1100),
('Dehiwala', 'Bambalapitiya', 1200),
('Dehiwala', 'Havelock Town', 1300),
('Dehiwala', 'Wellawatta', 1300),
('Dehiwala', 'Cinnamon Gardens', 1300),
('Dehiwala', 'Borella', 1300),
('Dehiwala', 'Dematagoda', 1400),
('Fort', 'Fort', 500),
('Slave Island', 'Slave Island', 500),
('Kollupitiya', 'Kollupitiya', 500),
('Bambalapitiya', 'Bambalapitiya', 500),
('Havelock Town', 'Havelock Town', 500),
('Wellawatta', 'Wellawatta', 500),
('Cinnamon Gardens', 'Cinnamon Gardens', 500),
('Borella', 'Borella', 500),
('Dematagoda', 'Dematagoda', 500),
('Dehiwala', 'Dehiwala', 500);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL,
  `validity_condition` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_percentage`, `validity_condition`) VALUES
(1, 'FIRSTRIDE', 15.00, 'NONE'),
(2, 'WEEKEND15', 15.00, 'WEEKEND_ONLY'),
(3, 'SAVE100', 10.00, 'NONE');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nic` varchar(15) NOT NULL,
  `phone` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `nic`, `phone`) VALUES
(1, 'Nahla Nisthar', 'nahla@gmail.com', '235485214569', 779703453),
(2, 'Sara Razzak', 'sara@gmail.com', '200567349685', 774562968),
(3, 'Chris James', 'chris@gmail.com', '200256984256', 776549513),
(4, 'Ali Mohamed Hussain', 'alihussain@gmail.com', '198845233786', 775645889),
(5, 'Sauda Ansar', 'sauda@gmail.com', '199356435432', 773456875),
(6, 'Nouf Nisthar', 'nouf123@gmail.com', '200225743678', 775443423),
(7, 'Reza Khan', 'reza@gmail.com', '199257439823', 772375488),
(8, 'Chloe Jenkins', 'chloJe@gmail.com', '199939494839', 742454785),
(9, 'Thahani Azmi', 'thani@gmail.com', '200678435748', 774377843),
(11, 'Yara Yousef', 'yara@gmail.com', '199864786543', 777359621),
(12, 'Ramya Pandey', 'ramya@gmail.com', '198857463777', 796755454);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `status` enum('Available','Unavailable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `driver_name`, `email`, `phone`, `nic`, `status`) VALUES
(81, 'Ameer Khan', 'ameer.khan@email.com', '0761334567', '200012345678', 'Available'),
(82, 'Saman Perera', 'saman.p@email.com', '0719856543', '199934567800', 'Available'),
(83, 'John Doe', 'john.doe@email.com', '0775678612', '199823456799', 'Available'),
(84, 'Ravi Silva', 'ravi.silva@email.com', '0782348678', '199751789012', 'Available'),
(85, 'Michael Fernando', 'michael.f@email.com', '0750456789', '199745678901', 'Available'),
(86, 'Arun Kumar', 'arun.kumar@email.com', '0721112433', '199712345678', 'Available'),
(87, 'Nalin Dissanayake', 'nalin.d@email.com', '0746678910', '198864567890', 'Available'),
(88, 'Kasun Jayasinghe', 'kasun.j@email.com', '0706989123', '198723453789', 'Available'),
(89, 'Thilini Ganesh', 'thilini.p@email.com ', '0762237445', '199976789012', 'Available'),
(90, 'Dilan Silva', 'dilan.s@email.com', '0713349556', '198845608901', 'Available'),
(91, 'Sameera Fernando', 'sameera.f@email.com', '0768809001', '199132345678', 'Available'),
(92, 'Dinesh Perera', 'dinesh.p@email.com', '0716675889', '198934767890', 'Available'),
(93, 'Niroshan Silva', 'niroshan.s@email.com', '0771127334', '199723486789', 'Available'),
(94, 'Chaminda Rajapaksha', 'chaminda.r@email.com', '0788566778', '199056789012', 'Available'),
(95, 'Harsha De Silva', 'harsha.d@email.com', '0756670889', '199145672901', 'Available'),
(96, 'Pasan Jayawardena', 'pasan.j@email.com', '0727728990', '199317345688', 'Available'),
(97, 'Lasith Mendis', 'lasith.m@email.com', '0748859001', '198367453023', 'Available'),
(98, 'Mahesh Gamage', 'mahesh.g@email.com', '0707233445', '198723452789', 'Available'),
(99, 'Ruwan Kumara', 'ruwan.k@email.com', '0765563778', '199956789012', 'Available'),
(100, 'Roshan Weerasinghe', 'roshan.w@email.com', '0711677889', '198846678901', 'Available'),
(102, 'Ritesh Pandey', 'ritesh@gmail.com', '0775266983', '197512369854', 'Unavailable'),
(103, 'Vignesh Raj', 'vj@gmail.com', '0764589996', '197454788966', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `minivan_fare`
--

CREATE TABLE `minivan_fare` (
  `pickup` varchar(100) NOT NULL,
  `dropoff` varchar(100) NOT NULL,
  `fare` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `minivan_fare`
--

INSERT INTO `minivan_fare` (`pickup`, `dropoff`, `fare`) VALUES
('Fort', 'Slave Island', 700),
('Fort', 'Kollupitiya', 800),
('Fort', 'Bambalapitiya', 900),
('Fort', 'Havelock Town', 1000),
('Fort', 'Wellawatta', 900),
('Fort', 'Cinnamon Gardens', 1000),
('Fort', 'Borella', 1100),
('Fort', 'Dematagoda', 1200),
('Fort', 'Dehiwala', 1300),
('Slave Island', 'Fort', 700),
('Slave Island', 'Kollupitiya', 800),
('Slave Island', 'Bambalapitiya', 900),
('Slave Island', 'Havelock Town', 1000),
('Slave Island', 'Wellawatta', 900),
('Slave Island', 'Cinnamon Gardens', 1000),
('Slave Island', 'Borella', 1100),
('Slave Island', 'Dematagoda', 1200),
('Slave Island', 'Dehiwala', 1300),
('Kollupitiya', 'Fort', 800),
('Kollupitiya', 'Slave Island', 800),
('Kollupitiya', 'Bambalapitiya', 900),
('Kollupitiya', 'Havelock Town', 1000),
('Kollupitiya', 'Wellawatta', 900),
('Kollupitiya', 'Cinnamon Gardens', 1000),
('Kollupitiya', 'Borella', 1100),
('Kollupitiya', 'Dematagoda', 1200),
('Kollupitiya', 'Dehiwala', 1300),
('Bambalapitiya', 'Fort', 900),
('Bambalapitiya', 'Slave Island', 900),
('Bambalapitiya', 'Kollupitiya', 900),
('Bambalapitiya', 'Havelock Town', 1000),
('Bambalapitiya', 'Wellawatta', 1000),
('Bambalapitiya', 'Cinnamon Gardens', 1100),
('Bambalapitiya', 'Borella', 1200),
('Bambalapitiya', 'Dematagoda', 1300),
('Bambalapitiya', 'Dehiwala', 1400),
('Havelock Town', 'Fort', 1000),
('Havelock Town', 'Slave Island', 1000),
('Havelock Town', 'Kollupitiya', 1000),
('Havelock Town', 'Bambalapitiya', 1000),
('Havelock Town', 'Wellawatta', 1100),
('Havelock Town', 'Cinnamon Gardens', 1200),
('Havelock Town', 'Borella', 1300),
('Havelock Town', 'Dematagoda', 1400),
('Havelock Town', 'Dehiwala', 1500),
('Wellawatta', 'Fort', 900),
('Wellawatta', 'Slave Island', 900),
('Wellawatta', 'Kollupitiya', 900),
('Wellawatta', 'Bambalapitiya', 1000),
('Wellawatta', 'Havelock Town', 1100),
('Wellawatta', 'Cinnamon Gardens', 1200),
('Wellawatta', 'Borella', 1300),
('Wellawatta', 'Dematagoda', 1400),
('Wellawatta', 'Dehiwala', 1500),
('Cinnamon Gardens', 'Fort', 1000),
('Cinnamon Gardens', 'Slave Island', 1000),
('Cinnamon Gardens', 'Kollupitiya', 1000),
('Cinnamon Gardens', 'Bambalapitiya', 1100),
('Cinnamon Gardens', 'Havelock Town', 1200),
('Cinnamon Gardens', 'Wellawatta', 1200),
('Cinnamon Gardens', 'Borella', 1300),
('Cinnamon Gardens', 'Dematagoda', 1400),
('Cinnamon Gardens', 'Dehiwala', 1500),
('Borella', 'Fort', 1100),
('Borella', 'Slave Island', 1100),
('Borella', 'Kollupitiya', 1100),
('Borella', 'Bambalapitiya', 1200),
('Borella', 'Havelock Town', 1300),
('Borella', 'Wellawatta', 1300),
('Borella', 'Cinnamon Gardens', 1300),
('Borella', 'Dematagoda', 1400),
('Borella', 'Dehiwala', 1500),
('Dematagoda', 'Fort', 1200),
('Dematagoda', 'Slave Island', 1200),
('Dematagoda', 'Kollupitiya', 1200),
('Dematagoda', 'Bambalapitiya', 1300),
('Dematagoda', 'Havelock Town', 1400),
('Dematagoda', 'Wellawatta', 1400),
('Dematagoda', 'Cinnamon Gardens', 1400),
('Dematagoda', 'Borella', 1400),
('Dematagoda', 'Dehiwala', 1600),
('Dehiwala', 'Fort', 1300),
('Dehiwala', 'Slave Island', 1300),
('Dehiwala', 'Kollupitiya', 1300),
('Dehiwala', 'Bambalapitiya', 1400),
('Dehiwala', 'Havelock Town', 1500),
('Dehiwala', 'Wellawatta', 1500),
('Dehiwala', 'Cinnamon Gardens', 1500),
('Dehiwala', 'Borella', 1500),
('Dehiwala', 'Dematagoda', 1600),
('Fort', 'Fort', 700),
('Slave Island', 'Slave Island', 700),
('Kollupitiya', 'Kollupitiya', 700),
('Bambalapitiya', 'Bambalapitiya', 700),
('Havelock Town', 'Havelock Town', 700),
('Wellawatta', 'Wellawatta', 700),
('Cinnamon Gardens', 'Cinnamon Gardens', 700),
('Borella', 'Borella', 700),
('Dematagoda', 'Dematagoda', 700),
('Dehiwala', 'Dehiwala', 700);

-- --------------------------------------------------------

--
-- Table structure for table `ride_activity`
--

CREATE TABLE `ride_activity` (
  `ride_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `dropoff_location` varchar(255) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `vehicle_details` varchar(255) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `driver_name` varchar(255) NOT NULL,
  `total_fare` decimal(10,2) NOT NULL,
  `discount_coupon` varchar(50) DEFAULT NULL,
  `final_fare` decimal(10,2) DEFAULT NULL,
  `payment_type` varchar(50) NOT NULL,
  `ride_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ride_activity`
--

INSERT INTO `ride_activity` (`ride_id`, `user_id`, `name`, `phone`, `pickup_location`, `dropoff_location`, `vehicle_type`, `vehicle_details`, `driver_id`, `driver_name`, `total_fare`, `discount_coupon`, `final_fare`, `payment_type`, `ride_timestamp`) VALUES
(1, 1, 'Nahla Nisthar', '779703453', 'Trend Residencies, Sadaham Mawatha', 'Red Cross Street', 'Mini Van', 'SUZ 1415, Suzuki Every - Every Join Turbo', 84, 'Ravi Silva', 1500.00, 'FIRSTRIDE', 1275.00, 'Cash', '2025-03-05 00:20:06'),
(3, 1, 'Nahla Nisthar', '779703453', 'Trend Residencies, Sadaham Mawatha', 'Stafford Avenue', 'Car', 'NSN 9099, Nissan Note - Note E-Power', 100, 'Roshan Weerasinghe', 1300.00, '', NULL, 'Card', '2025-03-05 15:17:43'),
(4, 6, 'Nouf Nisthar', '775443423', 'Richards Street', 'Galle Road', 'Tuk', 'BJM 2122, Bajaj Maxima - Maxima C', 94, 'Chaminda Rajapaksha', 400.00, 'FIRSTRIDE', 340.00, 'Cash', '2025-03-05 21:06:03'),
(5, 1, 'Nahla Nisthar', '779703453', 'Marine Drive', 'Sadaham Mawatha', 'Car', 'HYU 1112, Hyundai Grand i10 - Grand i10 2021', 88, 'Kasun Jayasinghe', 1200.00, 'SAVE100', 1080.00, 'Cash', '2025-03-10 11:45:21'),
(6, 4, 'Ali Mohamed Hussain', '775645889', 'Bathiya Mawatha', 'Galle Road', 'Bike', 'HRO 4044, Hero Splendor - Splendor Plus', 83, 'John Doe', 400.00, 'FIRSTRIDE', 340.00, 'Mobile', '2025-03-10 11:53:23'),
(7, 2, 'Sara Razzak', '774562968', 'Church Street', 'Rohini Road', 'Van', 'HYU 2425, Hyundai H1 - H1 2018', 97, 'Lasith Mendis', 1100.00, 'FIRSTRIDE', 935.00, 'Card', '2025-03-10 15:39:00'),
(8, 10, 'Yara Yousef', '777359621', 'Sri Gunathilaka Mawatha', 'Hospital Road', 'Mini Van', 'TOY 1213, Toyota Sienta - Sienta 2018', 91, 'Sameera Fernando', 1500.00, 'FIRSTRIDE', 1275.00, 'Card', '2025-03-13 22:36:19'),
(9, 11, 'Ramya Pandey', '796755454', 'Roster Street', 'Bathiya Mawatha', 'Tuk', 'TUK 1718, Bajaj RE - RE 205', 89, 'Thilini Ganesh', 700.00, 'FIRSTRIDE', 595.00, 'Cash', '2025-03-13 23:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `tuk_fare`
--

CREATE TABLE `tuk_fare` (
  `pickup` varchar(100) NOT NULL,
  `dropoff` varchar(100) NOT NULL,
  `fare` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tuk_fare`
--

INSERT INTO `tuk_fare` (`pickup`, `dropoff`, `fare`) VALUES
('Fort', 'Slave Island', 300),
('Fort', 'Kollupitiya', 350),
('Fort', 'Bambalapitiya', 400),
('Fort', 'Havelock Town', 450),
('Fort', 'Wellawatta', 400),
('Fort', 'Cinnamon Gardens', 450),
('Fort', 'Borella', 500),
('Fort', 'Dematagoda', 550),
('Fort', 'Dehiwala', 600),
('Slave Island', 'Fort', 300),
('Slave Island', 'Kollupitiya', 350),
('Slave Island', 'Bambalapitiya', 400),
('Slave Island', 'Havelock Town', 450),
('Slave Island', 'Wellawatta', 400),
('Slave Island', 'Cinnamon Gardens', 450),
('Slave Island', 'Borella', 500),
('Slave Island', 'Dematagoda', 550),
('Slave Island', 'Dehiwala', 600),
('Kollupitiya', 'Fort', 350),
('Kollupitiya', 'Slave Island', 350),
('Kollupitiya', 'Bambalapitiya', 400),
('Kollupitiya', 'Havelock Town', 450),
('Kollupitiya', 'Wellawatta', 400),
('Kollupitiya', 'Cinnamon Gardens', 450),
('Kollupitiya', 'Borella', 500),
('Kollupitiya', 'Dematagoda', 550),
('Kollupitiya', 'Dehiwala', 600),
('Bambalapitiya', 'Fort', 400),
('Bambalapitiya', 'Slave Island', 400),
('Bambalapitiya', 'Kollupitiya', 400),
('Bambalapitiya', 'Havelock Town', 450),
('Bambalapitiya', 'Wellawatta', 450),
('Bambalapitiya', 'Cinnamon Gardens', 500),
('Bambalapitiya', 'Borella', 550),
('Bambalapitiya', 'Dematagoda', 600),
('Bambalapitiya', 'Dehiwala', 650),
('Havelock Town', 'Fort', 450),
('Havelock Town', 'Slave Island', 450),
('Havelock Town', 'Kollupitiya', 450),
('Havelock Town', 'Bambalapitiya', 450),
('Havelock Town', 'Wellawatta', 500),
('Havelock Town', 'Cinnamon Gardens', 550),
('Havelock Town', 'Borella', 600),
('Havelock Town', 'Dematagoda', 650),
('Havelock Town', 'Dehiwala', 700),
('Wellawatta', 'Fort', 400),
('Wellawatta', 'Slave Island', 400),
('Wellawatta', 'Kollupitiya', 400),
('Wellawatta', 'Bambalapitiya', 450),
('Wellawatta', 'Havelock Town', 500),
('Wellawatta', 'Cinnamon Gardens', 550),
('Wellawatta', 'Borella', 600),
('Wellawatta', 'Dematagoda', 650),
('Wellawatta', 'Dehiwala', 700),
('Cinnamon Gardens', 'Fort', 450),
('Cinnamon Gardens', 'Slave Island', 450),
('Cinnamon Gardens', 'Kollupitiya', 450),
('Cinnamon Gardens', 'Bambalapitiya', 500),
('Cinnamon Gardens', 'Havelock Town', 550),
('Cinnamon Gardens', 'Wellawatta', 550),
('Cinnamon Gardens', 'Borella', 600),
('Cinnamon Gardens', 'Dematagoda', 650),
('Cinnamon Gardens', 'Dehiwala', 700),
('Borella', 'Fort', 500),
('Borella', 'Slave Island', 500),
('Borella', 'Kollupitiya', 500),
('Borella', 'Bambalapitiya', 550),
('Borella', 'Havelock Town', 600),
('Borella', 'Wellawatta', 600),
('Borella', 'Cinnamon Gardens', 600),
('Borella', 'Dematagoda', 650),
('Borella', 'Dehiwala', 700),
('Dematagoda', 'Fort', 550),
('Dematagoda', 'Slave Island', 550),
('Dematagoda', 'Kollupitiya', 550),
('Dematagoda', 'Bambalapitiya', 600),
('Dematagoda', 'Havelock Town', 650),
('Dematagoda', 'Wellawatta', 650),
('Dematagoda', 'Cinnamon Gardens', 650),
('Dematagoda', 'Borella', 650),
('Dematagoda', 'Dehiwala', 750),
('Dehiwala', 'Fort', 600),
('Dehiwala', 'Slave Island', 600),
('Dehiwala', 'Kollupitiya', 600),
('Dehiwala', 'Bambalapitiya', 650),
('Dehiwala', 'Havelock Town', 700),
('Dehiwala', 'Wellawatta', 700),
('Dehiwala', 'Cinnamon Gardens', 700),
('Dehiwala', 'Borella', 700),
('Dehiwala', 'Dematagoda', 750),
('Fort', 'Fort', 300),
('Slave Island', 'Slave Island', 300),
('Kollupitiya', 'Kollupitiya', 300),
('Bambalapitiya', 'Bambalapitiya', 300),
('Havelock Town', 'Havelock Town', 300),
('Wellawatta', 'Wellawatta', 300),
('Cinnamon Gardens', 'Cinnamon Gardens', 300),
('Borella', 'Borella', 300),
('Dematagoda', 'Dematagoda', 300),
('Dehiwala', 'Dehiwala', 300);

-- --------------------------------------------------------

--
-- Table structure for table `used_coupons`
--

CREATE TABLE `used_coupons` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `used_coupons`
--

INSERT INTO `used_coupons` (`id`, `user_id`, `coupon_code`) VALUES
(21, 1, 'FIRSTRIDE'),
(23, 1, 'SAVE100'),
(25, 2, 'FIRSTRIDE'),
(24, 4, 'FIRSTRIDE'),
(22, 6, 'FIRSTRIDE'),
(26, 10, 'FIRSTRIDE'),
(27, 11, 'FIRSTRIDE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `customer_id`) VALUES
(1, 'nahla_2005', '12345', 1),
(2, 'Sara', '8520', 2),
(3, 'chris123', 'chris', 3),
(4, 'Ali_Hussain', '1988', 4),
(5, 'sauda', '123', 5),
(6, 'no_uf', '5776', 6),
(7, 'reza_khan', '0011', 7),
(8, 'chloe_26', 'happy_soul', 8),
(9, 'thani', '4321', 9),
(10, 'yara_12', 'hello', 11),
(11, 'Girl_town', 'ramya', 12);

-- --------------------------------------------------------

--
-- Table structure for table `van_fare`
--

CREATE TABLE `van_fare` (
  `pickup` varchar(100) NOT NULL,
  `dropoff` varchar(100) NOT NULL,
  `fare` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `van_fare`
--

INSERT INTO `van_fare` (`pickup`, `dropoff`, `fare`) VALUES
('Fort', 'Slave Island', 900),
('Fort', 'Kollupitiya', 1000),
('Fort', 'Bambalapitiya', 1100),
('Fort', 'Havelock Town', 1200),
('Fort', 'Wellawatta', 1100),
('Fort', 'Cinnamon Gardens', 1200),
('Fort', 'Borella', 1300),
('Fort', 'Dematagoda', 1400),
('Fort', 'Dehiwala', 1500),
('Slave Island', 'Fort', 900),
('Slave Island', 'Kollupitiya', 1000),
('Slave Island', 'Bambalapitiya', 1100),
('Slave Island', 'Havelock Town', 1200),
('Slave Island', 'Wellawatta', 1100),
('Slave Island', 'Cinnamon Gardens', 1200),
('Slave Island', 'Borella', 1300),
('Slave Island', 'Dematagoda', 1400),
('Slave Island', 'Dehiwala', 1500),
('Kollupitiya', 'Fort', 1000),
('Kollupitiya', 'Slave Island', 1000),
('Kollupitiya', 'Bambalapitiya', 1100),
('Kollupitiya', 'Havelock Town', 1200),
('Kollupitiya', 'Wellawatta', 1100),
('Kollupitiya', 'Cinnamon Gardens', 1200),
('Kollupitiya', 'Borella', 1300),
('Kollupitiya', 'Dematagoda', 1400),
('Kollupitiya', 'Dehiwala', 1500),
('Bambalapitiya', 'Fort', 1100),
('Bambalapitiya', 'Slave Island', 1100),
('Bambalapitiya', 'Kollupitiya', 1100),
('Bambalapitiya', 'Havelock Town', 1200),
('Bambalapitiya', 'Wellawatta', 1200),
('Bambalapitiya', 'Cinnamon Gardens', 1300),
('Bambalapitiya', 'Borella', 1400),
('Bambalapitiya', 'Dematagoda', 1500),
('Bambalapitiya', 'Dehiwala', 1600),
('Havelock Town', 'Fort', 1200),
('Havelock Town', 'Slave Island', 1200),
('Havelock Town', 'Kollupitiya', 1200),
('Havelock Town', 'Bambalapitiya', 1200),
('Havelock Town', 'Wellawatta', 1300),
('Havelock Town', 'Cinnamon Gardens', 1400),
('Havelock Town', 'Borella', 1500),
('Havelock Town', 'Dematagoda', 1600),
('Havelock Town', 'Dehiwala', 1700),
('Wellawatta', 'Fort', 1100),
('Wellawatta', 'Slave Island', 1100),
('Wellawatta', 'Kollupitiya', 1100),
('Wellawatta', 'Bambalapitiya', 1200),
('Wellawatta', 'Havelock Town', 1300),
('Wellawatta', 'Cinnamon Gardens', 1400),
('Wellawatta', 'Borella', 1500),
('Wellawatta', 'Dematagoda', 1600),
('Wellawatta', 'Dehiwala', 1700),
('Cinnamon Gardens', 'Fort', 1200),
('Cinnamon Gardens', 'Slave Island', 1200),
('Cinnamon Gardens', 'Kollupitiya', 1200),
('Cinnamon Gardens', 'Bambalapitiya', 1300),
('Cinnamon Gardens', 'Havelock Town', 1400),
('Cinnamon Gardens', 'Wellawatta', 1400),
('Cinnamon Gardens', 'Borella', 1500),
('Cinnamon Gardens', 'Dematagoda', 1600),
('Cinnamon Gardens', 'Dehiwala', 1700),
('Borella', 'Fort', 1300),
('Borella', 'Slave Island', 1300),
('Borella', 'Kollupitiya', 1300),
('Borella', 'Bambalapitiya', 1400),
('Borella', 'Havelock Town', 1500),
('Borella', 'Wellawatta', 1500),
('Borella', 'Cinnamon Gardens', 1500),
('Borella', 'Dematagoda', 1600),
('Borella', 'Dehiwala', 1700),
('Dematagoda', 'Fort', 1400),
('Dematagoda', 'Slave Island', 1400),
('Dematagoda', 'Kollupitiya', 1400),
('Dematagoda', 'Bambalapitiya', 1500),
('Dematagoda', 'Havelock Town', 1600),
('Dematagoda', 'Wellawatta', 1600),
('Dematagoda', 'Cinnamon Gardens', 1600),
('Dematagoda', 'Borella', 1600),
('Dematagoda', 'Dehiwala', 1800),
('Dehiwala', 'Fort', 1500),
('Dehiwala', 'Slave Island', 1500),
('Dehiwala', 'Kollupitiya', 1500),
('Dehiwala', 'Bambalapitiya', 1600),
('Dehiwala', 'Havelock Town', 1700),
('Dehiwala', 'Wellawatta', 1700),
('Dehiwala', 'Cinnamon Gardens', 1700),
('Dehiwala', 'Borella', 1700),
('Dehiwala', 'Dematagoda', 1800),
('Fort', 'Fort', 900),
('Slave Island', 'Slave Island', 900),
('Kollupitiya', 'Kollupitiya', 900),
('Bambalapitiya', 'Bambalapitiya', 900),
('Havelock Town', 'Havelock Town', 900),
('Wellawatta', 'Wellawatta', 900),
('Cinnamon Gardens', 'Cinnamon Gardens', 900),
('Borella', 'Borella', 900),
('Dematagoda', 'Dematagoda', 900),
('Dehiwala', 'Dehiwala', 900);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicle_number` varchar(20) NOT NULL,
  `vehicle_type` enum('Bike','Tuk','Car','Mini Van','Van') NOT NULL,
  `vehicle_name` varchar(100) NOT NULL,
  `vehicle_model` varchar(100) NOT NULL,
  `driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicle_number`, `vehicle_type`, `vehicle_name`, `vehicle_model`, `driver_id`) VALUES
('APX 1920', 'Tuk', 'Piaggio Ape', 'Ape Xtra LDX', 81),
('BAJ 2022', 'Bike', 'Bajaj Pulsar', 'Pulsar 150', 86),
('BJM 2122', 'Tuk', 'Bajaj Maxima', 'Maxima C', 94),
('HND 1011', 'Bike', 'Honda Shine', 'Shine 125', 90),
('HND 1314', 'Mini Van', 'Honda Freed', 'Freed Hybrid', 92),
('HND 7077', 'Car', 'Honda Fit', 'Fit GP5', 95),
('HRO 4044', 'Bike', 'Hero Splendor', 'Splendor Plus', 83),
('HYU 1112', 'Car', 'Hyundai Grand i10', 'Grand i10 2021', 88),
('HYU 2425', 'Van', 'Hyundai H1', 'H1 2018', 97),
('MHA 2021', 'Tuk', 'Mahindra Alfa', 'Alfa Plus', 98),
('MTS 1617', 'Mini Van', 'Mitsubishi Delica', 'Delica D2', 85),
('MZD 2627', 'Van', 'Mazda Bongo', 'Bongo Van 2020', 87),
('NSN 1516', 'Mini Van', 'Nissan Serena', 'Serena Hybrid', 93),
('NSN 2324', 'Van', 'Nissan Caravan', 'Caravan NV350', 96),
('NSN 9099', 'Car', 'Nissan Note', 'Note E-Power', 100),
('SUZ 1415', 'Mini Van', 'Suzuki Every', 'Every Join Turbo', 84),
('SUZ 2526', 'Van', 'Suzuki Every Wagon', 'Every DA17W', 99),
('SUZ 8088', 'Car', 'Suzuki Swift', 'Swift 2020', 82),
('TOY 1213', 'Mini Van', 'Toyota Sienta', 'Sienta 2018', 91),
('TOY 2223', 'Van', 'Toyota Hiace', 'Hiace KDH201', 103),
('TOY 6066', 'Car', 'Toyota Axio', 'Axio 2017', 102),
('TUK 1718', 'Tuk', 'Bajaj RE', 'RE 205', 89),
('TVS 1819', 'Tuk', 'TVS King', 'King Deluxe', NULL),
('TVS 3033', 'Bike', 'TVS Apache', 'Apache RTR 160', NULL),
('YMH 5055', 'Bike', 'Yamaha FZ', 'FZ-S FI', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `ride_activity`
--
ALTER TABLE `ride_activity`
  ADD PRIMARY KEY (`ride_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_driver_id` (`driver_id`);

--
-- Indexes for table `used_coupons`
--
ALTER TABLE `used_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`coupon_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_customer` (`customer_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_number`),
  ADD KEY `fk_driver` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `ride_activity`
--
ALTER TABLE `ride_activity`
  MODIFY `ride_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `used_coupons`
--
ALTER TABLE `used_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `used_coupons`
--
ALTER TABLE `used_coupons`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_driver` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
