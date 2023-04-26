-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--

USE hbnb_dev_db;

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `name` varchar(128) NOT NULL,
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `name` varchar(128) NOT NULL,
  `state_id` varchar(60) NOT NULL,
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('Saint Paul','5d4707e6-b4e9-4e45-83ae-4402efaf8b28','097ebfc3-982e-4fab-917e-d8a1329c90e8','2023-04-24 02:29:05','2023-04-24 02:29:05'),('Kearny','5ca4cd26-87c0-475a-81d8-b0bcb0a9c67d','14363c07-4f0f-4381-a8c1-7f1c6a5ae6a1','2023-04-24 02:18:03','2023-04-24 02:18:03'),('Honolulu','a1b49ec8-50b8-4069-8cbe-4f785e8f6c77','275d0bef-5ddf-4954-bf33-ebf18cba84ae','2023-04-24 02:22:54','2023-04-24 02:22:54'),('Joliet','7817be40-3225-4f0f-a975-84e919280404','285354e2-3656-4465-bac4-fa851342da93','2023-04-24 02:25:19','2023-04-24 02:25:19'),('Chicago','7817be40-3225-4f0f-a975-84e919280404','392e0dc3-aff4-4f1c-bb8b-144dad62be8a','2023-04-24 02:25:01','2023-04-24 02:25:01'),('Napa','1d9906e3-a7c7-4883-8dbf-648f4ae78076','47d645f1-0785-473c-9ec8-52832acd06ca','2023-04-24 02:19:12','2023-04-24 02:19:12'),('San Jose','1d9906e3-a7c7-4883-8dbf-648f4ae78076','56ee5e4b-7549-47b5-ace0-ce579aee769b','2023-04-24 02:20:14','2023-04-24 02:20:14'),('Naperville','7817be40-3225-4f0f-a975-84e919280404','58e057d7-32b3-4830-8b8d-61adf8a258c7','2023-04-24 02:25:41','2023-04-24 02:25:41'),('Lafayette','e0960af2-ea43-4bd8-93d2-325f87bfd39e','620d0d5a-6b9e-4933-aa49-b2f397f042db','2023-04-24 02:28:02','2023-04-24 02:28:02'),('Fairfield','72f4c3a5-a635-4287-aad2-8169e9d4a34a','63c40019-7159-41f3-a3e3-3d832245abd2','2023-04-24 02:16:50','2023-04-24 02:16:50'),('Tempe','5ca4cd26-87c0-475a-81d8-b0bcb0a9c67d','662656cb-1389-4791-9fc9-5dc69d5debff','2023-04-24 02:18:26','2023-04-24 02:18:26'),('Akron','72f4c3a5-a635-4287-aad2-8169e9d4a34a','69e063b0-87e7-42f8-bb75-34380b136ea0','2023-04-24 02:14:58','2023-04-24 02:14:58'),('Jackson','b8d1f5a9-02db-4a19-8123-47c93e7025d7','6d65ed8f-596f-435b-9f83-5f8fb3ced8a8','2023-04-24 02:29:31','2023-04-24 02:29:31'),('Eugene','fb96a633-b2ca-482b-82b8-59c9a1a358ec','70c25a31-392d-478f-9c1a-17a2eebcede8','2023-04-24 02:31:02','2023-04-24 02:31:02'),('Peoria','7817be40-3225-4f0f-a975-84e919280404','7f1b665e-4ec1-444d-983a-02b6bc36d650','2023-04-24 02:25:59','2023-04-24 02:25:59'),('Kailua','a1b49ec8-50b8-4069-8cbe-4f785e8f6c77','929add04-f052-4c8a-8160-f1a875415281','2023-04-24 02:24:07','2023-04-24 02:24:07'),('New Orleans','e0960af2-ea43-4bd8-93d2-325f87bfd39e','934e9b01-041d-4f29-99ad-ca873ffc76ca','2023-04-24 02:28:21','2023-04-24 02:28:21'),('San Francisco','1d9906e3-a7c7-4883-8dbf-648f4ae78076','a8a5fb35-d255-45fe-8b2c-fa9ef8a8f551','2023-04-24 02:19:48','2023-04-24 02:19:48'),('Tupelo','b8d1f5a9-02db-4a19-8123-47c93e7025d7','ad35b429-4fb0-40f3-9db4-df269fdd297c','2023-04-24 02:30:15','2023-04-24 02:30:15'),('Los Angeles','1d9906e3-a7c7-4883-8dbf-648f4ae78076','ad674c10-c910-4b56-b93c-ee9634c4a4f6','2023-04-24 00:23:00','2023-04-24 00:23:00'),('Douglas','5ca4cd26-87c0-475a-81d8-b0bcb0a9c67d','b388ec4e-d4ab-495a-a95c-0994fd9eb195','2023-04-24 02:17:44','2023-04-24 02:17:44'),('Portland','fb96a633-b2ca-482b-82b8-59c9a1a358ec','b3c82fa0-caa5-42a7-9369-83ccce1c59b8','2023-04-24 02:31:18','2023-04-24 02:31:18'),('Meridian','b8d1f5a9-02db-4a19-8123-47c93e7025d7','b76929d3-d14e-4f33-ac10-b1201efab6f4','2023-04-24 02:29:55','2023-04-24 02:29:55'),('Calera','72f4c3a5-a635-4287-aad2-8169e9d4a34a','bc430927-f90c-4354-a536-19bc6668377c','2023-04-24 02:16:32','2023-04-24 02:16:32'),('Baton Rouge','e0960af2-ea43-4bd8-93d2-325f87bfd39e','ca9e1b73-8cfd-496f-962d-4e82ecdefa34','2023-04-24 02:27:43','2023-04-24 02:27:43'),('Sonoma','1d9906e3-a7c7-4883-8dbf-648f4ae78076','e112dae1-25f7-41c3-acc8-021d43b57a21','2023-04-24 02:20:37','2023-04-24 02:20:37'),('Babbie','72f4c3a5-a635-4287-aad2-8169e9d4a34a','e3174d38-874c-4a3b-9f37-99795b8318c4','2023-04-24 02:16:15','2023-04-24 02:16:15'),('Fremont','1d9906e3-a7c7-4883-8dbf-648f4ae78076','e53ac754-b53c-411f-bd8d-b9fe11d9fb5a','2023-04-24 02:18:56','2023-04-24 02:18:56'),('Miami','365ec2a4-d4e8-4914-a404-f034d217b032','eb53bf8b-699b-46fd-803c-e8b2b0d9a822','2023-04-24 02:21:56','2023-04-24 02:21:56'),('Denver','18747fdf-c927-4378-ba35-474ca016e3e2','f6a7e5a3-60d5-410a-8dd7-8a9f383b7785','2023-04-24 02:21:26','2023-04-24 02:21:26'),('Orlando','365ec2a4-d4e8-4914-a404-f034d217b032','f9f52a80-33a0-4c98-a865-6907cbc7b6e4','2023-04-24 02:22:14','2023-04-24 02:22:14'),('Pearl City','a1b49ec8-50b8-4069-8cbe-4f785e8f6c77','fbe17a99-7f6c-439e-a3a7-b7be81f819ba','2023-04-24 02:24:27','2023-04-24 02:24:27'),('Urbana','7817be40-3225-4f0f-a975-84e919280404','fd198b32-95b0-4a6f-bb2a-1d691a0c8565','2023-04-24 02:26:16','2023-04-24 02:26:16');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) DEFAULT NULL,
  `amenity_id` varchar(60) DEFAULT NULL,
  KEY `place_id` (`place_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `text` varchar(1024) NOT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `name` varchar(128) NOT NULL,
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('Colorado','18747fdf-c927-4378-ba35-474ca016e3e2','2023-04-24 00:25:56','2023-04-24 00:25:56'),('California','1d9906e3-a7c7-4883-8dbf-648f4ae78076','2023-04-24 00:18:56','2023-04-24 00:18:56'),('Florida','365ec2a4-d4e8-4914-a404-f034d217b032','2023-04-24 00:26:08','2023-04-24 00:26:08'),('Arizona','5ca4cd26-87c0-475a-81d8-b0bcb0a9c67d','2023-04-24 00:25:45','2023-04-24 00:25:45'),('Minnesota','5d4707e6-b4e9-4e45-83ae-4402efaf8b28','2023-04-24 00:27:23','2023-04-24 00:27:23'),('Alabama','72f4c3a5-a635-4287-aad2-8169e9d4a34a','2023-04-24 00:25:29','2023-04-24 00:25:29'),('Illinois','7817be40-3225-4f0f-a975-84e919280404','2023-04-24 00:26:51','2023-04-24 00:26:51'),('Indiana','78924bca-5a11-4a80-be30-76a9cac8f121','2023-04-24 00:27:04','2023-04-24 00:27:04'),('Hawaii','a1b49ec8-50b8-4069-8cbe-4f785e8f6c77','2023-04-24 00:26:41','2023-04-24 00:26:41'),('Mississipi','b8d1f5a9-02db-4a19-8123-47c93e7025d7','2023-04-24 00:27:33','2023-04-24 00:27:33'),('Georgia','d35d53be-b9cf-4c07-8b5b-b0bafba28ad2','2023-04-24 00:26:32','2023-04-24 00:26:32'),('Louisiana','e0960af2-ea43-4bd8-93d2-325f87bfd39e','2023-04-24 00:27:14','2023-04-24 00:27:14'),('Oregon','fb96a633-b2ca-482b-82b8-59c9a1a358ec','2023-04-24 00:27:47','2023-04-24 00:27:47');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 11:46:13
