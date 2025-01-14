-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2025 at 02:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bondvoyage_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `email`, `password`, `created_at`) VALUES
(1, '4bstravelandtours@gmail.com', '0680ca7e3e9b3b7dfafaf52b4a55179785689364f87829dbe6faae005603a595', '2025-01-10 03:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `create_travel`
--

CREATE TABLE `create_travel` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `travel_name` varchar(255) NOT NULL,
  `share_code` varchar(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `create_travel`
--

INSERT INTO `create_travel` (`id`, `user_id`, `travel_name`, `share_code`, `created_at`) VALUES
(1, 1, 'Baguio', 'ZHHB261D', '2025-01-13 07:39:34'),
(2, 2, 'Ilocos', 'JD93VCDU', '2025-01-13 07:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `feedback` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `feedback`, `submitted_at`) VALUES
(1, 'Virginia Rose Dichoso', 'virginiarosedichoso@gmail.com', 'Wow. Thanks!', '2025-01-13 18:12:15'),
(2, 'Virginia Rose Dichoso', 'virginiarosedichoso@gmail.com', 'Take 2', '2025-01-13 18:20:04'),
(3, 'Virginia Rose Dichoso', 'virginiarosedichoso@gmail.com', 'Take 3', '2025-01-13 18:20:58'),
(4, 'Virginia Rose Dichoso', 'virginiarosedichoso@gmail.com', 'Take 4', '2025-01-13 18:25:51'),
(5, 'Virginia Rose Dichoso', 'virginiarosedichoso@gmail.com', 'Take 5', '2025-01-13 18:31:55'),
(6, 'Virginia Rose Dichoso', 'virginiarosedichoso@gmail.com', 'Wow!', '2025-01-13 21:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `itineraries`
--

CREATE TABLE `itineraries` (
  `id` int(11) NOT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `duration_days` int(11) DEFAULT NULL,
  `duration_nights` int(11) DEFAULT NULL,
  `lodging` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itineraries`
--

INSERT INTO `itineraries` (`id`, `destination`, `duration_days`, `duration_nights`, `lodging`) VALUES
(1, 'Sample 1', 1, 1, 'Hotel'),
(2, 'Baguio', 2, 1, 'Hotel'),
(3, 'A', 1, 0, 'A'),
(5, 'a', 1, 1, 'a'),
(6, '1', 1, 0, 'c');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_days`
--

CREATE TABLE `itinerary_days` (
  `id` int(11) NOT NULL,
  `itinerary_id` int(11) NOT NULL,
  `day_number` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itinerary_days`
--

INSERT INTO `itinerary_days` (`id`, `itinerary_id`, `day_number`, `start_time`, `end_time`, `activity`) VALUES
(1, 1, 1, '12:00:00', '13:00:00', 'Lunch'),
(2, 2, 1, '00:00:00', '10:00:00', 'Meet Up'),
(3, 2, 2, '00:00:00', '10:00:00', 'Run'),
(4, 3, 1, '02:51:00', '03:51:00', 'A'),
(6, 5, 1, '05:31:00', '06:31:00', 'a'),
(7, 6, 1, '05:33:00', '06:33:00', 'Meet Up');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `place_name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `activities` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `destination`, `place_name`, `location`, `description`, `activities`, `created_at`) VALUES
(1, 'Ilocos', 'San Agustin Church of Paoay', 'Marcos Ave, Paoay, Ilocos Norte', 'Paoay Church is a Roman Catholic church in Paoay, Ilocos Norte province, completed in 1710 after two decades of construction. With a massive pediment and complementary bell tower standing imposingly on an expansive plain, the church is famous for its architecture that blends baroque, gothic, Chinese, and Javanese styles. Today, it is one of the top tourist attractions in the Ilocos Region.', 'Religious Services (Masses, Novena Services, Sacrament of Confession)\r\nCultural and Heritage Tours\r\nEducational and Spiritual Workshops\r\nHeritage and Arts Exhibits\r\nLocal Craft and Souvenir Sales', '2025-01-13 22:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `place_images`
--

CREATE TABLE `place_images` (
  `id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `place_images`
--

INSERT INTO `place_images` (`id`, `place_id`, `image_path`) VALUES
(1, 1, '../uploads/6785961c1c213_paoay-church-4.JPG'),
(2, 1, '../uploads/6785961c51d20_paoay-church-3.jpg'),
(3, 1, '../uploads/6785961cbdfec_paoay-church-2.png'),
(4, 1, '../uploads/6785961d74975_paoay-church-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `travel_collaborators`
--

CREATE TABLE `travel_collaborators` (
  `id` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travel_collaborators`
--

INSERT INTO `travel_collaborators` (`id`, `travel_id`, `user_id`, `joined_at`) VALUES
(1, 1, 2, '2025-01-13 07:39:50'),
(2, 2, 1, '2025-01-13 07:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `security_question_1` varchar(255) NOT NULL,
  `security_answer_1` varchar(255) NOT NULL,
  `security_question_2` varchar(255) NOT NULL,
  `security_answer_2` varchar(255) NOT NULL,
  `security_question_3` varchar(255) NOT NULL,
  `security_answer_3` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile`, `birthday`, `password`, `security_question_1`, `security_answer_1`, `security_question_2`, `security_answer_2`, `security_question_3`, `security_answer_3`, `created_at`) VALUES
(1, 'Virginia Rose', 'Dichoso', 'virginiarosedichoso@gmail.com', '09064815090', '2003-01-04', '$2y$10$hbglgRDQ9GqpHtWBhj2U/O1osolsI3j8XiK1OODera7U/2jSRDz5e', 'friend', '$2y$10$Wo8A6kTQRBtReJtgCnQt2.Em1Letci6xb09c/dHZGxUc7Nw5m38jm', 'toy', '$2y$10$HB0nb2lMkQS9Dj5nqQZFF.Fp1RBaG3wnWAK9bJRtmLVjBxbnc25bi', 'character', '$2y$10$SwEfZU4eYy0JCdjCyJ.H/OU.OApe1ZSnhitV0.sAqkcGWDwPtGC0.', '2025-01-12 07:42:27'),
(2, 'Tony', 'Stark', 'tonystark@gmail.com', '09064815090', '2003-01-04', '$2y$10$IHYZBwWx2HOuRCKyIwRgu..fCGHUNzdHITPkWprIYRfLYiFA38O66', 'movie', '$2y$10$egON3O5VMBmyyzSGhI3zy.DnfkZSeUayL.r01E6Brli2UFsF.vjNe', 'friend', '$2y$10$FbUxP92BSMWAJDj1M8OtjOyeJiqmaHdthLm8gXHsNpL2oKg6W4Wqy', 'character', '$2y$10$0KS8FjAj7M0/41khNkBCWe0LJnvr4S6jE.UHKdQ6x8458pKyct2Zq', '2025-01-12 08:56:33'),
(3, 'Steve', 'Rogers', 'steverogers@gmail.com', '09064815090', '2003-01-04', '$2y$10$dvF2Qqpny9Vp.EjTJQCwNuEkMzbNn2g5REFafBsJBxd9MROz.4Ryy', 'movie', '$2y$10$bX1oxk//b6hgM6umL03bneJ46yVjqaZUS/X12l7KJ95KdlNzRGpcG', 'friend', '$2y$10$Wi.ojVHXJ5nwwTdBif1h8OKSHnv.edvju5tav3suv3mTBMH0ypCwu', 'character', '$2y$10$v/xt1pxxcuGVrPW/E.XuIehruVD8EjolNInHAKjZq/frQG/WX7QLu', '2025-01-12 19:18:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `create_travel`
--
ALTER TABLE `create_travel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `share_code` (`share_code`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_days`
--
ALTER TABLE `itinerary_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itinerary_id` (`itinerary_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `place_images`
--
ALTER TABLE `place_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_id` (`place_id`);

--
-- Indexes for table `travel_collaborators`
--
ALTER TABLE `travel_collaborators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travel_id` (`travel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `create_travel`
--
ALTER TABLE `create_travel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `itinerary_days`
--
ALTER TABLE `itinerary_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `place_images`
--
ALTER TABLE `place_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `travel_collaborators`
--
ALTER TABLE `travel_collaborators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `create_travel`
--
ALTER TABLE `create_travel`
  ADD CONSTRAINT `create_travel_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `place_images`
--
ALTER TABLE `place_images`
  ADD CONSTRAINT `place_images_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `travel_collaborators`
--
ALTER TABLE `travel_collaborators`
  ADD CONSTRAINT `travel_collaborators_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `create_travel` (`id`),
  ADD CONSTRAINT `travel_collaborators_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
