-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2021 at 06:54 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Database: `ecommerceapp`
--
-- --------------------------------------------------------
--
-- Table structure for table `admin`
--
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `admin`
--
INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'Sathvik Swamy K M', 'sathvikswamykm@gmail.com', '$2y$10$DrqE5bsaPo01VfW.FLOSz.1vM3XqLsBw2zPMxo8TlwM1iQarLT1TS', '0');

-- --------------------------------------------------------
--
-- Table structure for table `brands`
--
CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `brands`
--
INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Sony'),
(5, 'LG'),
(6, 'OnePlus+'),
(11, 'Nike'),
(12, 'Prestige'),
(13, 'Mi'),
(14, 'Bajaj');
-- --------------------------------------------------------
--
-- Table structure for table `cart`
--
CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `cart`
--
INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(4, 1, '::1', 7, 1),
(5, 2, '::1', -1, 1),
(6, 76, '127.0.0.1', 8, 1),
(8, 1, '127.0.0.1', 9, 1),
(9, 8, '127.0.0.1', 9, 1),
(10, 1, '127.0.0.1', -1, 1),
(11, 8, '127.0.0.1', -1, 1),
(12, 3, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `categories`
--
INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Electronics'),
(3, 'Home & Kitchen'),
(6, 'Clothings'),
(12, 'Mobiles');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `orders`
--
INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `products`
--
INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 2, 4, 'Sony Headphones WH-1000XM4', 27000, 1, 'Sony Headphones WH-1000XM4', '1673159147_sony headphones.jpg', 'Headphones'),
(2, 2, 13, 'Mi Power Bank 2s 10000mAh', 5000, 1, 'Mi Power Bank 2s 10000mAh Dual USB Quick Charge Portable Battery', '1673159406_Mi Power Bank 10000mAh.jpg', 'Powerbank'),
(3, 2, 13, 'Mi Smart Band 6', 1999, 1, 'Mi Smart Band 6 BHR4951GL (G)', '1673159516_Xiaomi Mi Smart Brand6.jpg', 'Smart Band'),
(4, 3, 12, 'Prestige Stove Royale Plus Gt04 4', 10000, 1, 'Prestige Royale Plus Gt04 4 Burner Schott Glass Top Lpg Gas Stove Black 40278', '1673159661_stove.jpg', 'Stove'),
(5, 3, 12, 'Prestige Pressure Cooker', 8000, 1, 'Prestige Svachh Nakshatra Plus Hard Anodised 5 Litre Pressure Handi', '1673159802_Pressure Cooker.jpg', 'Pressure Cooker'),
(6, 2, 3, 'MagSafe Power Bank', 15000, 1, 'Apple MagSafe Battery Pack', '1673159941_apple power bank.jpg', 'apple'),
(7, 2, 5, 'LG Signature OLED TV W 4K HDR ', 50000, 1, 'LG Signature OLED TV W 4K HDR Smart TV', '1673160114_lg tv.jpg', 'tv'),
(8, 2, 3, 'Macbook Air', 120000, 2, 'MacBook Air Silver', '1673160252_macbook.jpg', 'apple'),
(9, 2, 1, 'HP EnvyLaptop', 116000, 1, 'HP Envy 15- 11th Gen Intel Core i7/16GB/1TB SSD/15.6 inch(39.6 cm) 400 nits,4K AMOLED Touch, TUV + Win 11 Pro 64/NVIDIA GeForce RTX 3050 4GB Graphics/Alexa/FPR/B&O/2.14kg,15-ep1085TX,Black', '1673160471_hp laptop.jpg', 'laptop'),
(10, 3, 12, 'Prestige Electric Kettle ', 2500, 1, 'Prestige Electric Kettle PKOSS - 1500watts, Steel (1.5Ltr), Black', '1673160595_Prestige Electric Kettle PKOSS - 1500watts, Steel (1.5Ltr), Black.jpg', 'kettle'),
(11, 3, 14, 'Bajaj Majesty Pc Dlx Water Heater ', 25000, 1, 'Bajaj Majesty Pc Dlx Water Heater Designer Sheet Metal Coating Capacity (10 L )', '1673160734_Bajaj Geyser.jpg', 'Geyser'),
(12, 2, 1, 'HP Pavilion 14', 53000, 1, 'HP Pavilion 14, AMD Ryzen 5-5625U 8GB RAM/512GB SSD 14inches/35.6 cm FHD, IPS Micro-Edge Display/Radeon Graphics/Alexa/B&O Audio/Fast Charge/Win11 Home/MS Office 2021, 14-Ec1003au Windows 11 Home ', '1673160889_HP Pavilion 14.jpg', 'laptop'),
(14, 12, 6, 'OnePlus Nord CE 2 Lite 5G', 18500, 1, '\r\nOnePlus Nord CE 2 Lite 5G (Blue Tide, 6GB RAM, 128GB Storage)', '1673161172_OnePlus Nord.jpg', 'mobile'),
(15, 12, 6, ' OnePlus 10 Pro 5G ', 66999, 1, '\r\nOnePlus 10 Pro 5G (Volcanic Black, 12GB RAM, 256GB Storage)', '1673161293_oneplus 10 pro.jpg', 'mobile'),
(16, 12, 2, ' Samsung Galaxy S22 Ultra 5G ', 97780, 1, '\r\nSamsung Galaxy S22 Ultra 5G (Phantom Black, 12GB, 256GB Storage)', '1673161432_Samsung Galazy S22 Ultra.jpg', 'mobile'),
(17, 2, 2, 'Samsung Galaxy Watch5 Pro Bluetooth', 44500, 1, 'Samsung Galaxy Watch5 Pro Bluetooth (45 mm, Gray Titanium, Compatible with Android only)', '1673161530_samsung watch.jpg', 'watch');
(18, 6, 11, 'Nike Hoodie', 5499, 1, 'Nike Hoodie', '1673172567_1673161779_nike hoodiejpg.jpg', 'clothing');
-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--
CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `user_info`
--
INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Christine', 'Randolph', 'randolphc@gmail.com', '25f9e794323b453885f5181f1b624d0b', '8389080183', '2133  Hill Haven Drive', 'Terra Stree'),
(2, 'Will', 'Willams', 'willainswill@gmail.com', '25f9e794323b453885f5181f1b624d0b', '8389080183', '4567  Orphan Road', 'WI'),
(3, 'Demo', 'Name', 'demo@gmail.com', 'password', '9876543210', 'demo ad1', 'ademo ad2'),
(5, 'Steeve', 'Rogers', 'steeve1@gmail.com', '305e4f55ce823e111a46a9d500bcb86c', '9876547770', '573  Pinewood Avenue', 'MN'),
(6, 'Melissa', 'Gilbert', 'gilbert@gmail.com', '305e4f55ce823e111a46a9d500bcb86c', '7845554582', '1711  McKinley Avenue', 'MA'),
(7, 'Sathvik', 'Swamy K M', 'sathvikswamykm@gmail.com', '522626df0834806879feca461c6401b1', '9902699601', 'Gandhi Nagar', '2nd cross'),
(8, 'Amit', 'M', 'amitm@gmail.com', '482c811da5d5b4bc6d497ffa98491e38', '8095050670', 'Gokul Road', 'Hubli'),
(9, 'Rajath', 'M D', 'rajath@gamil.com', '482c811da5d5b4bc6d497ffa98491e38', '7022347614', 'Kappagal Road', 'Bellary');
COMMIT;
--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
