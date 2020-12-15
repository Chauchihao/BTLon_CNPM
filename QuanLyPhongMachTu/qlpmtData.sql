-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: qlpmt
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `don_gia_don_vi_thuoc`
--

DROP TABLE IF EXISTS `don_gia_don_vi_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_gia_don_vi_thuoc` (
  `id_don_gia` int NOT NULL,
  `id_don_vi` int NOT NULL,
  PRIMARY KEY (`id_don_gia`,`id_don_vi`),
  KEY `id_don_vi` (`id_don_vi`),
  CONSTRAINT `don_gia_don_vi_thuoc_ibfk_1` FOREIGN KEY (`id_don_gia`) REFERENCES `don_vi_thuoc` (`id`),
  CONSTRAINT `don_gia_don_vi_thuoc_ibfk_2` FOREIGN KEY (`id_don_vi`) REFERENCES `don_gia_thuoc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_gia_don_vi_thuoc`
--

LOCK TABLES `don_gia_don_vi_thuoc` WRITE;
/*!40000 ALTER TABLE `don_gia_don_vi_thuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_gia_don_vi_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_gia_thuoc`
--

DROP TABLE IF EXISTS `don_gia_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_gia_thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `don_gia` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_gia_thuoc`
--

LOCK TABLES `don_gia_thuoc` WRITE;
/*!40000 ALTER TABLE `don_gia_thuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_gia_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_vi_thuoc`
--

DROP TABLE IF EXISTS `don_vi_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_vi_thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `don_vi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_vi_thuoc`
--

LOCK TABLES `don_vi_thuoc` WRITE;
/*!40000 ALTER TABLE `don_vi_thuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_vi_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ql__loai_benh`
--

DROP TABLE IF EXISTS `ql__loai_benh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ql__loai_benh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ql__loai_benh`
--

LOCK TABLES `ql__loai_benh` WRITE;
/*!40000 ALTER TABLE `ql__loai_benh` DISABLE KEYS */;
/*!40000 ALTER TABLE `ql__loai_benh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ql__loai_thuoc`
--

DROP TABLE IF EXISTS `ql__loai_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ql__loai_thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ql__loai_thuoc`
--

LOCK TABLES `ql__loai_thuoc` WRITE;
/*!40000 ALTER TABLE `ql__loai_thuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `ql__loai_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ql__trieu_chung`
--

DROP TABLE IF EXISTS `ql__trieu_chung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ql__trieu_chung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ql__trieu_chung`
--

LOCK TABLES `ql__trieu_chung` WRITE;
/*!40000 ALTER TABLE `ql__trieu_chung` DISABLE KEYS */;
/*!40000 ALTER TABLE `ql__trieu_chung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `year_of_birth` int DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `user_role` enum('ADMIN','DOCTOR','MEDICAL_WORKER','PATIENT') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `khoa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1))),
  CONSTRAINT `user_chk_2` CHECK ((`sex` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08 12:50:14
