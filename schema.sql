CREATE DATABASE  IF NOT EXISTS `tollgate_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tollgate_management`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: tollgate_management
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `emergency_services`
--

DROP TABLE IF EXISTS `emergency_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_services` (
  `tollgate_id` int NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `service_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tollgate_id`,`service_type`),
  CONSTRAINT `emergency_services_ibfk_1` FOREIGN KEY (`tollgate_id`) REFERENCES `tollgate` (`tollgate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_services`
--

LOCK TABLES `emergency_services` WRITE;
/*!40000 ALTER TABLE `emergency_services` DISABLE KEYS */;
INSERT INTO `emergency_services` VALUES (1,'fire station','Pune Fire Station, Pune, Maharashtra'),(1,'hospital','Mumbai-Pune Expressway, Pune, Maharashtra'),(1,'police station','Pune Police Station, Pune, Maharashtra'),(2,'fire station','Gurgaon Fire Station, Gurgaon, Haryana'),(2,'hospital','Delhi-Gurgaon Expressway, Gurgaon, Haryana'),(2,'police station','Gurgaon Police Station, Gurgaon, Haryana'),(3,'fire station','Hyderabad Fire Station, Hyderabad, Telangana'),(3,'hospital','Hyderabad-Vijayawada Highway, Hyderabad, Telangana'),(3,'police station','Hyderabad Police Station, Hyderabad, Telangana'),(4,'fire station','Chennai Fire Station, Chennai, Tamil Nadu'),(4,'hospital','Chennai-Bangalore Highway, Chennai, Tamil Nadu'),(4,'police station','Chennai Police Station, Chennai, Tamil Nadu'),(5,'fire station','Kolkata Fire Station, Kolkata, West Bengal'),(5,'hospital','Kolkata-Durgapur Expressway, Kolkata, West Bengal'),(5,'police station','Kolkata Police Station, Kolkata, West Bengal'),(6,'fire station','Ahmedabad Fire Station, Ahmedabad, Gujarat'),(6,'hospital','Ahmedabad-Vadodara Expressway, Ahmedabad, Gujarat'),(6,'police station','Ahmedabad Police Station, Ahmedabad, Gujarat'),(7,'fire station','Bengaluru Fire Station, Bengaluru, Karnataka'),(7,'hospital','Bengaluru-Mysuru Highway, Bengaluru, Karnataka'),(7,'police station','Bengaluru Police Station, Bengaluru, Karnataka'),(8,'hospital','45th street,vijayanagara'),(9,'Fire Station','12'),(9,'Hospital','13'),(9,'Police Station','14'),(10,'Fire Station','near 5th junction'),(10,'Hospital','34th road'),(10,'Police Station','50ft road'),(11,'Fire Station','near 5th junction'),(11,'Hospital','34th road'),(11,'Police Station','50ft road'),(12,'Fire Station','near 5th junction'),(12,'Hospital','34th road'),(12,'Police Station','50ft road'),(13,'Fire Station','near 5th junction'),(13,'Hospital','34th road'),(13,'Police Station','50ft road'),(14,'Fire Station','near 5th junction'),(14,'Hospital','34th road'),(14,'Police Station','50ft road');
/*!40000 ALTER TABLE `emergency_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare`
--

DROP TABLE IF EXISTS `fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare` (
  `trip_type` varchar(255) NOT NULL,
  `vehicle_type` varchar(255) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`trip_type`,`vehicle_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare`
--

LOCK TABLES `fare` WRITE;
/*!40000 ALTER TABLE `fare` DISABLE KEYS */;
INSERT INTO `fare` VALUES ('One-way','2-wheeler',20.00),('One-way','4-wheeler',50.00),('One-way','emergency vehicle',0.00),('One-way','heavy vehicle',100.00),('Round trip','2-wheeler',40.00),('Round trip','4-wheeler',100.00),('Round trip','emergency vehicle',0.00),('Round trip','heavy vehicle',200.00);
/*!40000 ALTER TABLE `fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `tollgate_id` int NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tollgate_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`tollgate_id`) REFERENCES `tollgate` (`tollgate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Maharashtra','Pune','Pune'),(2,'Haryana','Gurgaon','Gurgaon'),(3,'Telangana','Hyderabad','Hyderabad'),(4,'Tamil Nadu','Chennai','Chennai'),(5,'West Bengal','Kolkata','Kolkata'),(6,'Gujarat','Ahmedabad','Ahmedabad'),(7,'Karnataka','Bengaluru','Bengaluru'),(8,'AP','kurnool highway','kurnool'),(9,'karnataka','blr','blr'),(10,'telengana','hydrebad','hydrebad'),(11,'telengana','hydrebad','hydrebad'),(12,'telengana','hydrebad','hydrebad'),(13,'telengana','hydrebad','hydrebad'),(14,'telengana','hydrebad','hydrebad');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `tollgate_id` int DEFAULT NULL,
  `shift_start_time` time DEFAULT NULL,
  `shift_end_time` time DEFAULT NULL,
  `contact_info` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `tollgate_id` (`tollgate_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`tollgate_id`) REFERENCES `tollgate` (`tollgate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (3,'Bob','Johnson',3,'08:00:00','16:00:00','5551234567'),(4,'Alice','Williams',4,'16:00:00','24:00:00','9012345678'),(5,'Mike','Davis',5,'08:00:00','16:00:00','1112223333'),(6,'Emily','Taylor',6,'16:00:00','24:00:00','4445556666'),(7,'David','Lee',1,'16:00:00','24:00:00','7778889999'),(8,'Sarah','Kim',2,'08:00:00','16:00:00','3334445555'),(9,'Kevin','White',3,'16:00:00','24:00:00','6667778888'),(10,'Lisa','Brown',4,'08:00:00','16:00:00','9990001111'),(11,'Peter','Hall',5,'16:00:00','24:00:00','2223334444'),(12,'Jessica','Martin',6,'08:00:00','16:00:00','5556667777'),(13,'Michael','Harris',1,'08:00:00','16:00:00','8889990000'),(14,'Elizabeth','Thompson',2,'16:00:00','24:00:00','1112223333'),(15,'William','Jackson',3,'08:00:00','16:00:00','4445556666'),(16,'Olivia','Garcia',4,'16:00:00','24:00:00','7778889999'),(17,'James','Martinez',5,'08:00:00','16:00:00','3334445555'),(18,'Sophia','Robinson',6,'16:00:00','24:00:00','6667778888'),(19,'Robert','Clark',1,'16:00:00','24:00:00','9990001111'),(20,'Isabella','Lewis',2,'08:00:00','16:00:00','2223334444'),(21,'Richard','Walker',3,'16:00:00','24:00:00','5556667777'),(23,'Kopparapu ','Joshitha',8,'08:00:00','11:00:00','9381346141'),(24,'roy','raj',8,'11:00:00','03:00:00','9324685624'),(25,'jay','brown',8,'03:00:00','06:00:00','9462548563'),(26,'kim','huang',8,'06:00:00','09:00:00','8765432145'),(27,'joshitha','k',8,'09:00:00','11:00:00','9462548563');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_credential`
--

DROP TABLE IF EXISTS `staff_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_credential` (
  `staff_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `staff_credential_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_credential`
--

LOCK TABLES `staff_credential` WRITE;
/*!40000 ALTER TABLE `staff_credential` DISABLE KEYS */;
INSERT INTO `staff_credential` VALUES (23,'Kopparapu @8','$2a$10$S661RGvyoF.ZmgfT9XQWYOeUzf2Fz1d5zEQVccKlEv8UQCwvra4Na','staff'),(24,'roy@8','$2a$10$SPGQ3.NX1rIKk7U2ky2VX.aS7B6V1QLJ0zaSWwWX3aNApt0haytay','staff'),(25,'jay','$2a$10$VWsL0ofPRbcnxgWB/C5qmOJFxaLDjP8AvtGiGwsTKU2E5CWwc944S','staff'),(26,'kim','$2a$10$B1X6NiRQVtHMgFDItwPPKu2IVb1F8ZAqfqvsH5SImHHaocr6HEtlq','staff'),(27,'joshitha@8','$2a$10$cO5vavWOncJ2J6TKCA2Zj.mjsgW6fyjoDlVypESpZFnUnz3IkoyJu','staff');
/*!40000 ALTER TABLE `staff_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toll_history`
--

DROP TABLE IF EXISTS `toll_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toll_history` (
  `tollgate_id` int NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `vehicle_type` varchar(255) DEFAULT NULL,
  `fare` decimal(10,2) DEFAULT NULL,
  `date` date NOT NULL,
  `entry_time` time NOT NULL,
  `exit_time` time DEFAULT NULL,
  PRIMARY KEY (`tollgate_id`,`vehicle_id`,`date`,`entry_time`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `toll_history_ibfk_1` FOREIGN KEY (`tollgate_id`) REFERENCES `tollgate` (`tollgate_id`),
  CONSTRAINT `toll_history_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toll_history`
--

LOCK TABLES `toll_history` WRITE;
/*!40000 ALTER TABLE `toll_history` DISABLE KEYS */;
INSERT INTO `toll_history` VALUES (1,'AP07','heavy vehicle',100.00,'2022-01-03','09:00:00','09:30:00'),(1,'DL10','4-wheeler',50.00,'2022-01-02','20:00:00','20:20:00'),(1,'GJ06','4-wheeler',50.00,'2022-01-01','13:00:00','13:20:00'),(1,'KA11','heavy vehicle',100.00,'2022-01-01','18:00:00','18:30:00'),(1,'MH01','2-wheeler',20.00,'2022-01-01','08:00:00','08:15:00'),(1,'TS08','emergency vehicle',0.00,'2022-01-02','10:00:00','10:10:00'),(1,'WB13','2-wheeler',20.00,'2022-01-02','15:00:00','15:15:00'),(2,'AP07','heavy vehicle',100.00,'2022-01-01','14:00:00','14:30:00'),(2,'DL02','4-wheeler',50.00,'2022-01-01','09:00:00','09:20:00'),(2,'GJ06','4-wheeler',50.00,'2022-01-02','16:00:00','16:20:00'),(2,'KA11','heavy vehicle',100.00,'2022-01-02','21:00:00','21:30:00'),(2,'MH09','2-wheeler',20.00,'2022-01-02','11:00:00','11:15:00'),(2,'TN12','emergency vehicle',0.00,'2022-01-01','19:00:00','19:10:00'),(2,'TS08','emergency vehicle',0.00,'2022-01-03','10:00:00','10:10:00'),(3,'AP07','heavy vehicle',100.00,'2022-01-02','17:00:00','17:30:00'),(3,'DL10','4-wheeler',50.00,'2022-01-02','12:00:00','12:20:00'),(3,'KA03','heavy vehicle',100.00,'2022-01-01','10:00:00','10:30:00'),(3,'MH09','2-wheeler',20.00,'2022-01-03','11:00:00','11:15:00'),(3,'TN12','emergency vehicle',0.00,'2022-01-02','22:00:00','22:10:00'),(3,'TS08','emergency vehicle',0.00,'2022-01-01','15:00:00','15:10:00'),(3,'WB13','2-wheeler',20.00,'2022-01-01','20:00:00','20:15:00'),(4,'DL10','4-wheeler',50.00,'2022-01-03','12:00:00','12:20:00'),(4,'GJ06','4-wheeler',50.00,'2022-01-02','08:00:00','08:20:00'),(4,'KA11','heavy vehicle',100.00,'2022-01-02','13:00:00','13:30:00'),(4,'MH09','2-wheeler',20.00,'2022-01-01','16:00:00','16:15:00'),(4,'TN04','emergency vehicle',0.00,'2022-01-01','11:00:00','11:10:00'),(4,'TS08','emergency vehicle',0.00,'2022-01-02','18:00:00','18:10:00'),(4,'WB13','2-wheeler',20.00,'2022-01-02','23:00:00','23:15:00'),(5,'AP07','heavy vehicle',100.00,'2022-01-02','09:00:00','09:30:00'),(5,'DL10','4-wheeler',50.00,'2022-01-01','17:00:00','17:20:00'),(5,'GJ06','4-wheeler',50.00,'2022-01-03','08:00:00','08:20:00'),(5,'KA11','heavy vehicle',100.00,'2022-01-03','13:00:00','13:30:00'),(5,'MH09','2-wheeler',20.00,'2022-01-02','19:00:00','19:15:00'),(5,'TN12','emergency vehicle',0.00,'2022-01-02','14:00:00','14:10:00'),(5,'WB05','2-wheeler',20.00,'2022-01-01','12:00:00','12:15:00'),(8,'AP05','4-wheeler',32.00,'2024-11-14','19:21:18','19:24:18'),(8,'AP09','4 WHEELER',60.00,'2024-11-15','17:33:33','17:36:33'),(8,'KA24','2-WHEELER',20.00,'2024-11-15','09:35:52','09:38:52');
/*!40000 ALTER TABLE `toll_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_toll_history` BEFORE INSERT ON `toll_history` FOR EACH ROW BEGIN
    DECLARE vehicle_exists INT DEFAULT 0;

    
    SELECT COUNT(*) INTO vehicle_exists
    FROM vehicle
    WHERE vehicle_id = NEW.vehicle_id;

    
    IF vehicle_exists = 0 THEN
        INSERT INTO vehicle (vehicle_id, vehicle_type)
        VALUES (NEW.vehicle_id, NEW.vehicle_type);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tollgate`
--

DROP TABLE IF EXISTS `tollgate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tollgate` (
  `tollgate_id` int NOT NULL AUTO_INCREMENT,
  `tollgate_name` varchar(255) DEFAULT NULL,
  `no_of_lanes` int DEFAULT NULL,
  PRIMARY KEY (`tollgate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tollgate`
--

LOCK TABLES `tollgate` WRITE;
/*!40000 ALTER TABLE `tollgate` DISABLE KEYS */;
INSERT INTO `tollgate` VALUES (1,'Mumbai-Pune Expressway Toll Plaza',4),(2,'Delhi-Gurgaon Expressway Toll Plaza',6),(3,'Hyderabad-Vijayawada Highway Toll Plaza',8),(4,'Chennai-Bangalore Highway Toll Plaza',2),(5,'Kolkata-Durgapur Expressway Toll Plaza',5),(6,'Ahmedabad-Vadodara Expressway Toll Plaza',3),(7,'Bengaluru-Mysuru Highway Toll Plaza',7),(8,'tollgateA',6),(9,'A',3),(10,'hydrebad-kurnool express way',8),(11,'hydrebad-kurnool express way',8),(12,'hydrebad-kurnool express way',8),(13,'hydrebad-kurnool express way',8),(14,'hydrebad-kurnool express way',8);
/*!40000 ALTER TABLE `tollgate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mh10','$2a$10$1yoiB7CwvPu6esEt4ufhset0vft3VelV8v73f5q9uo2hZviduGKNu','mh10@gmail.com'),(2,'joshitha','$2a$10$uLoBSBc.IMtAQ8NLnqSAVeJQIMFkVuNbfhku8pAQ8faNTu/YUL9r.','jojo@gmail.com'),(3,'t','$2a$10$6qUlu.UTS0hwdSN.QszPtuRP42dSOekOwUcN1c24O3bofWoE0Lb1W','t@gmail.com'),(4,'hm','$2a$10$VxTTwkpHSn4lTMwRWG5Fl.qnImg2TEKjm9Fejyiwc1XXl/p6B3otS','hm@gmail.com'),(5,'joshitha','$2a$10$IeSuhHcUQkuW.EMGHnhce.M1RaEtzmrwp4.TueyFEAPXN.esIJ0xe','joshitha@gmail.com'),(6,'roy','$2a$10$5zsDDC.n3nzq2Ey5H7RvG.fElDcqF54du2F0OF4DwIxRoG9fsW1Bq','roy@gmail.com'),(7,'AP46','$2a$10$PFHV0MyfDKofuKQsozGaLOouHatjGnOpCKwP44up7ycc5IyyMgzVu','raj@gmail.com'),(8,'jojoj','$2a$10$EbNtrO3t9lWrIMko/PVSfe9Iw3QRK6CpExXPrjsUigIMmPsVS0TY.','jojojo@gmail.com'),(9,'AP18','$2a$10$0wt93fVFDRj/5jSc7XaspO.Oal6BhmXe8slRuK9e6jBEN0pVKdox.','ap18@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validate_username_before_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    
    IF NOT (NEW.username REGEXP '^[a-zA-Z]{2}[0-9]{2}') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid input: Username must start with two alphabets followed by two numbers';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicle_id` varchar(255) NOT NULL,
  `vehicle_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('AP05','4-wheeler'),('AP07','heavy vehicle'),('AP09','4 WHEELER'),('DL02','4-wheeler'),('DL10','4-wheeler'),('GJ06','4-wheeler'),('KA03','heavy vehicle'),('KA11','heavy vehicle'),('KA24','2-WHEELER'),('MH01','2-wheeler'),('MH09','2-wheeler'),('TN04','emergency vehicle'),('TN12','emergency vehicle'),('TS08','emergency vehicle'),('WB05','2-wheeler'),('WB13','2-wheeler');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tollgate_management'
--

--
-- Dumping routines for database 'tollgate_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddTollgate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTollgate`(
    IN tollgateName VARCHAR(255),
    IN numLanes INT,
    IN state VARCHAR(255),
    IN area VARCHAR(255),
    IN district VARCHAR(255),
    IN fireStationAddress VARCHAR(255),    
    IN hospitalAddress VARCHAR(255),       
    IN policeStationAddress VARCHAR(255)   
)
BEGIN
    DECLARE tollgate_id INT;

    
    START TRANSACTION;

    
    INSERT INTO tollgate (tollgate_name, no_of_lanes)
    VALUES (tollgateName, numLanes);

    
    SET tollgate_id = LAST_INSERT_ID();

    
    INSERT INTO location (tollgate_id, state, area, district)
    VALUES (tollgate_id, state, area, district);

    
    
    IF fireStationAddress IS NOT NULL THEN
        INSERT INTO emergency_services (tollgate_id, service_type, service_address)
        VALUES (tollgate_id, 'Fire Station', fireStationAddress);
    END IF;

    
    IF hospitalAddress IS NOT NULL THEN
        INSERT INTO emergency_services (tollgate_id, service_type, service_address)
        VALUES (tollgate_id, 'Hospital', hospitalAddress);
    END IF;

    
    IF policeStationAddress IS NOT NULL THEN
        INSERT INTO emergency_services (tollgate_id, service_type, service_address)
        VALUES (tollgate_id, 'Police Station', policeStationAddress);
    END IF;

    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddTollHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTollHistory`(
    IN p_vehicle_id VARCHAR(255),
    IN p_vehicle_type VARCHAR(255),
    IN p_tollgate_id INT,
    IN p_fare DECIMAL(10,2)
)
BEGIN
    DECLARE p_date DATE;
    DECLARE p_entry_time TIME;
    DECLARE p_exit_time TIME;

    
    SET p_date = CURDATE();
    SET p_entry_time = CURTIME();

    
    SET p_exit_time = ADDTIME(p_entry_time, '00:03:00');

    
    INSERT INTO toll_history (vehicle_id, vehicle_type, tollgate_id, fare, date, entry_time, exit_time)
    VALUES (p_vehicle_id, p_vehicle_type, p_tollgate_id, p_fare, p_date, p_entry_time, p_exit_time);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_fair_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_fair_table`()
BEGIN
  SELECT trip_type, vehicle_type, amount, monthly_pass_amount
  FROM Fare;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEmergencyServices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEmergencyServices`(
    IN input_tollgate_name VARCHAR(255),
    IN input_service_type VARCHAR(255)
)
BEGIN
    SELECT es.service_type, es.service_address
    FROM emergency_services es
    JOIN Tollgate t ON es.tollgate_id = t.tollgate_id
    WHERE LOWER(t.tollgate_name) = LOWER(input_tollgate_name)
      AND LOWER(es.service_type) = LOWER(input_service_type);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFares` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFares`()
BEGIN
    SELECT trip_type, vehicle_type, amount
    FROM Fare;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTollFareData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTollFareData`(
    IN tollgateId INT,
    IN selectedDate DATE
)
BEGIN
    
    SELECT 
        vehicle_id, 
        vehicle_type, 
        entry_time, 
        fare,
        (SELECT SUM(fare) 
         FROM toll_history 
         WHERE tollgate_id = tollgateId
           AND date = selectedDate) AS total_fare
    FROM toll_history
    WHERE tollgate_id = tollgateId
      AND date = selectedDate;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_fare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
-DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_fare`(IN p_date DATE)
BEGIN
     
     DECLARE total_fare DECIMAL(10, 2);
    
     SELECT SUM(fare) INTO total_fare
    FROM toll_history
    WHERE date = p_date;

    
     IF total_fare IS NULL THEN
         SET total_fare = 0;
         END IF;

         SELECT total_fare AS total_fare_collected;
 END ;;
 DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-16 18:33:53
