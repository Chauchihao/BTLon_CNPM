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
-- Table structure for table `benhnhan_loaibenh`
--

DROP TABLE IF EXISTS `benhnhan_loaibenh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benhnhan_loaibenh` (
  `id_benhnhan` int NOT NULL,
  `id_loaibenh` int NOT NULL,
  PRIMARY KEY (`id_benhnhan`,`id_loaibenh`),
  KEY `id_loaibenh` (`id_loaibenh`),
  CONSTRAINT `benhnhan_loaibenh_ibfk_1` FOREIGN KEY (`id_benhnhan`) REFERENCES `danhsachbenhnhan` (`id`),
  CONSTRAINT `benhnhan_loaibenh_ibfk_2` FOREIGN KEY (`id_loaibenh`) REFERENCES `loaibenh` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benhnhan_loaibenh`
--

LOCK TABLES `benhnhan_loaibenh` WRITE;
/*!40000 ALTER TABLE `benhnhan_loaibenh` DISABLE KEYS */;
/*!40000 ALTER TABLE `benhnhan_loaibenh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benhnhan_trieuchung`
--

DROP TABLE IF EXISTS `benhnhan_trieuchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benhnhan_trieuchung` (
  `id_benhnhan` int NOT NULL,
  `id_trieuchung` int NOT NULL,
  PRIMARY KEY (`id_benhnhan`,`id_trieuchung`),
  KEY `id_trieuchung` (`id_trieuchung`),
  CONSTRAINT `benhnhan_trieuchung_ibfk_1` FOREIGN KEY (`id_benhnhan`) REFERENCES `danhsachbenhnhan` (`id`),
  CONSTRAINT `benhnhan_trieuchung_ibfk_2` FOREIGN KEY (`id_trieuchung`) REFERENCES `trieuchung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benhnhan_trieuchung`
--

LOCK TABLES `benhnhan_trieuchung` WRITE;
/*!40000 ALTER TABLE `benhnhan_trieuchung` DISABLE KEYS */;
/*!40000 ALTER TABLE `benhnhan_trieuchung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cachdungthuoc`
--

DROP TABLE IF EXISTS `cachdungthuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cachdungthuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cachdungthuoc`
--

LOCK TABLES `cachdungthuoc` WRITE;
/*!40000 ALTER TABLE `cachdungthuoc` DISABLE KEYS */;
INSERT INTO `cachdungthuoc` VALUES (1,'Uống'),(2,'Thoa'),(3,'Tiêm'),(4,'Ngậm');
/*!40000 ALTER TABLE `cachdungthuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhsachbenhnhan`
--

DROP TABLE IF EXISTS `danhsachbenhnhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhsachbenhnhan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhsachbenhnhan`
--

LOCK TABLES `danhsachbenhnhan` WRITE;
/*!40000 ALTER TABLE `danhsachbenhnhan` DISABLE KEYS */;
INSERT INTO `danhsachbenhnhan` VALUES (1,'Nguyễn Văn A','2020-12-15',NULL),(2,'Trần Thị B','2020-12-15',NULL),(3,'Lê C','2020-12-15',NULL);
/*!40000 ALTER TABLE `danhsachbenhnhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dongia_donvithuoc`
--

DROP TABLE IF EXISTS `dongia_donvithuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dongia_donvithuoc` (
  `id_dongia` int NOT NULL,
  `id_donvi` int NOT NULL,
  PRIMARY KEY (`id_dongia`,`id_donvi`),
  KEY `id_donvi` (`id_donvi`),
  CONSTRAINT `dongia_donvithuoc_ibfk_1` FOREIGN KEY (`id_dongia`) REFERENCES `donvithuoc` (`id`),
  CONSTRAINT `dongia_donvithuoc_ibfk_2` FOREIGN KEY (`id_donvi`) REFERENCES `dongiathuoc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dongia_donvithuoc`
--

LOCK TABLES `dongia_donvithuoc` WRITE;
/*!40000 ALTER TABLE `dongia_donvithuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `dongia_donvithuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dongiathuoc`
--

DROP TABLE IF EXISTS `dongiathuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dongiathuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dongia` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dongiathuoc`
--

LOCK TABLES `dongiathuoc` WRITE;
/*!40000 ALTER TABLE `dongiathuoc` DISABLE KEYS */;
INSERT INTO `dongiathuoc` VALUES (1,5000),(2,10000),(3,20000),(4,50000);
/*!40000 ALTER TABLE `dongiathuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donvithuoc`
--

DROP TABLE IF EXISTS `donvithuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donvithuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `donvi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donvithuoc`
--

LOCK TABLES `donvithuoc` WRITE;
/*!40000 ALTER TABLE `donvithuoc` DISABLE KEYS */;
INSERT INTO `donvithuoc` VALUES (1,'Viên'),(2,'Chai');
/*!40000 ALTER TABLE `donvithuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaibenh`
--

DROP TABLE IF EXISTS `loaibenh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaibenh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaibenh`
--

LOCK TABLES `loaibenh` WRITE;
/*!40000 ALTER TABLE `loaibenh` DISABLE KEYS */;
INSERT INTO `loaibenh` VALUES (1,'Đau đầu'),(2,'Sốt'),(3,'Cảm cúm'),(4,'Viêm khớp'),(5,'Tay chân miệng');
/*!40000 ALTER TABLE `loaibenh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaibenh_trieuchung`
--

DROP TABLE IF EXISTS `loaibenh_trieuchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaibenh_trieuchung` (
  `id_trieuchung` int NOT NULL,
  `id_loaibenh` int NOT NULL,
  PRIMARY KEY (`id_trieuchung`,`id_loaibenh`),
  KEY `id_loaibenh` (`id_loaibenh`),
  CONSTRAINT `loaibenh_trieuchung_ibfk_1` FOREIGN KEY (`id_trieuchung`) REFERENCES `trieuchung` (`id`),
  CONSTRAINT `loaibenh_trieuchung_ibfk_2` FOREIGN KEY (`id_loaibenh`) REFERENCES `loaibenh` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaibenh_trieuchung`
--

LOCK TABLES `loaibenh_trieuchung` WRITE;
/*!40000 ALTER TABLE `loaibenh_trieuchung` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaibenh_trieuchung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaithuoc`
--

DROP TABLE IF EXISTS `loaithuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaithuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaithuoc`
--

LOCK TABLES `loaithuoc` WRITE;
/*!40000 ALTER TABLE `loaithuoc` DISABLE KEYS */;
INSERT INTO `loaithuoc` VALUES (1,'Becberin'),(2,'Aspirin'),(3,'Paracetamol '),(4,'Hidrasec'),(5,'Natufib');
/*!40000 ALTER TABLE `loaithuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaithuoc_cachdung`
--

DROP TABLE IF EXISTS `loaithuoc_cachdung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaithuoc_cachdung` (
  `id_loaithuoc` int NOT NULL,
  `id_cachdung` int NOT NULL,
  PRIMARY KEY (`id_loaithuoc`,`id_cachdung`),
  KEY `id_cachdung` (`id_cachdung`),
  CONSTRAINT `loaithuoc_cachdung_ibfk_1` FOREIGN KEY (`id_loaithuoc`) REFERENCES `loaithuoc` (`id`),
  CONSTRAINT `loaithuoc_cachdung_ibfk_2` FOREIGN KEY (`id_cachdung`) REFERENCES `cachdungthuoc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaithuoc_cachdung`
--

LOCK TABLES `loaithuoc_cachdung` WRITE;
/*!40000 ALTER TABLE `loaithuoc_cachdung` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaithuoc_cachdung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaithuoc_donvithuoc`
--

DROP TABLE IF EXISTS `loaithuoc_donvithuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaithuoc_donvithuoc` (
  `id_loaithuoc` int NOT NULL,
  `id_donvi` int NOT NULL,
  PRIMARY KEY (`id_loaithuoc`,`id_donvi`),
  KEY `id_donvi` (`id_donvi`),
  CONSTRAINT `loaithuoc_donvithuoc_ibfk_1` FOREIGN KEY (`id_loaithuoc`) REFERENCES `loaithuoc` (`id`),
  CONSTRAINT `loaithuoc_donvithuoc_ibfk_2` FOREIGN KEY (`id_donvi`) REFERENCES `donvithuoc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaithuoc_donvithuoc`
--

LOCK TABLES `loaithuoc_donvithuoc` WRITE;
/*!40000 ALTER TABLE `loaithuoc_donvithuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaithuoc_donvithuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trieuchung`
--

DROP TABLE IF EXISTS `trieuchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trieuchung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trieuchung`
--

LOCK TABLES `trieuchung` WRITE;
/*!40000 ALTER TABLE `trieuchung` DISABLE KEYS */;
INSERT INTO `trieuchung` VALUES (1,'Chảy mũi'),(2,'Chóng mặt'),(3,'Nóng sốt'),(4,'Hoa mắt');
/*!40000 ALTER TABLE `trieuchung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('MALE','FEMALE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_of_birth` int DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `user_role` enum('ADMIN','DOCTOR','MEDICAL_WORKER','PATIENT') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','Admin','202cb962ac59075b964b07152d234b70',NULL,NULL,1,NULL,'MALE',NULL,'2020-12-15','ADMIN'),(2,'Doctor','Doctor','202cb962ac59075b964b07152d234b70',NULL,NULL,1,NULL,'MALE',NULL,'2020-12-15','DOCTOR'),(3,'Worker','Worker','202cb962ac59075b964b07152d234b70',NULL,NULL,1,NULL,'FEMALE',NULL,'2020-12-15','MEDICAL_WORKER');
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

-- Dump completed on 2020-12-15 17:30:28
