CREATE DATABASE  IF NOT EXISTS `esameepicode` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `esameepicode`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: esameepicode
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryId` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(45) NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Elettronica'),(2,'Abbigliamento'),(3,'Casa'),(4,'Sport'),(5,'Libri');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductId` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `CategoryId` int NOT NULL,
  `Price` double DEFAULT NULL,
  `ProductCost` double DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `FK_productCategory` (`CategoryId`),
  CONSTRAINT `FK_productCategory` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Smartphone',1,500,300),(2,'Laptop',1,1000,700),(3,'Giacca',2,80,30),(4,'Scarpe',2,60,20),(5,'Divano',3,400,150),(6,'Tavolo',3,120,50),(7,'Palla',4,15,5),(8,'Bicicletta',4,250,100),(9,'Romanzo',5,15,7),(10,'Manuale SQL',5,35,15);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productinfo`
--

DROP TABLE IF EXISTS `productinfo`;
/*!50001 DROP VIEW IF EXISTS `productinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productinfo` AS SELECT 
 1 AS `ProductId`,
 1 AS `ProductName`,
 1 AS `CategoryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `RegionId` int NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(45) NOT NULL,
  PRIMARY KEY (`RegionId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Nord'),(2,'Centro'),(3,'Sud'),(4,'Isole');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `SalesId` int NOT NULL AUTO_INCREMENT,
  `OrderQuantity` int NOT NULL,
  `OrderDate` date NOT NULL,
  `ProductId` int NOT NULL,
  `StateId` int NOT NULL,
  PRIMARY KEY (`SalesId`),
  KEY `FK_ProductSales` (`ProductId`),
  KEY `FK_StateSales` (`StateId`),
  CONSTRAINT `FK_ProductSales` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`),
  CONSTRAINT `FK_StateSales` FOREIGN KEY (`StateId`) REFERENCES `state` (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,7,'2025-07-30',10,5),(2,7,'2025-05-09',5,2),(3,8,'2024-03-14',3,9),(4,10,'2025-06-14',10,4),(5,5,'2025-06-06',4,7),(6,3,'2024-09-27',1,9),(7,8,'2025-12-13',6,8),(8,6,'2024-11-06',4,4),(9,1,'2025-09-20',3,7),(10,7,'2024-10-25',10,5),(11,8,'2024-08-19',3,3),(12,8,'2025-06-28',6,5),(13,9,'2025-08-06',5,6),(14,1,'2024-09-28',7,2),(15,7,'2025-11-24',8,9),(16,4,'2024-05-01',7,7),(17,9,'2024-04-12',1,7),(18,6,'2025-05-27',8,7),(19,3,'2024-01-20',5,2),(20,6,'2024-08-01',8,8),(21,2,'2024-05-16',5,6),(22,6,'2024-06-09',4,1),(23,1,'2024-02-17',3,3),(24,3,'2025-05-04',6,7),(25,9,'2024-08-08',9,4),(26,5,'2024-05-28',6,1),(27,9,'2024-03-03',8,7),(28,3,'2024-02-02',5,3),(29,1,'2024-10-23',9,9),(30,3,'2024-07-12',7,5),(31,8,'2025-12-11',7,5),(32,7,'2025-07-04',8,4),(33,6,'2025-08-09',4,2),(34,7,'2024-03-04',4,5),(35,7,'2025-03-06',1,3),(36,4,'2024-02-13',2,6),(37,6,'2025-10-28',10,9),(38,8,'2025-11-14',5,6),(39,8,'2025-04-24',2,7),(40,3,'2024-06-13',3,6),(41,2,'2024-04-05',2,2),(42,7,'2025-01-07',7,9),(43,7,'2024-11-06',2,5),(44,3,'2025-02-04',1,5),(45,4,'2024-09-05',7,1),(46,6,'2024-09-07',2,8),(47,7,'2025-10-14',5,4),(48,8,'2025-02-24',7,3),(49,9,'2024-01-27',8,7),(50,5,'2024-02-01',9,1),(51,6,'2025-10-03',7,6),(52,9,'2025-05-25',9,3),(53,6,'2024-05-17',3,5),(54,8,'2024-05-10',8,2),(55,8,'2025-11-27',7,4),(56,1,'2024-07-01',10,1),(57,4,'2024-11-17',3,1),(58,4,'2025-04-10',2,8),(59,7,'2025-05-06',5,5),(60,9,'2025-12-04',2,1),(61,6,'2025-07-14',2,4),(62,5,'2024-04-10',4,3),(63,4,'2024-03-01',3,1),(64,6,'2024-10-08',4,8),(65,8,'2024-11-11',9,2),(66,1,'2025-07-02',7,9),(67,1,'2024-05-21',9,7),(68,10,'2025-06-22',8,6),(69,9,'2024-05-06',5,7),(70,2,'2025-04-30',9,4),(71,2,'2025-07-11',4,3),(72,6,'2025-11-09',10,8),(73,7,'2024-11-15',4,4),(74,8,'2025-04-07',10,9),(75,7,'2025-01-06',7,5),(76,7,'2025-10-03',4,2),(77,10,'2024-01-08',3,4),(78,10,'2025-03-07',2,1),(79,8,'2025-08-15',7,8),(80,4,'2025-12-22',1,1),(81,3,'2025-11-05',10,2),(82,8,'2024-09-13',5,4),(83,6,'2025-05-20',8,4),(84,1,'2025-12-29',9,1),(85,8,'2025-02-01',6,1),(86,9,'2025-07-17',5,8),(87,10,'2024-05-18',2,9),(88,6,'2025-08-22',5,8),(89,7,'2025-09-11',3,8),(90,6,'2024-03-26',10,3),(91,7,'2025-01-04',5,9),(92,4,'2025-06-15',7,2),(93,8,'2024-08-17',4,6),(94,1,'2025-04-17',10,8),(95,4,'2024-07-26',4,7),(96,10,'2024-05-12',3,5),(97,8,'2024-07-18',2,9),(98,4,'2025-06-28',8,5),(99,5,'2024-12-14',2,3),(100,9,'2024-08-29',3,1);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `StateId` int NOT NULL AUTO_INCREMENT,
  `StateName` varchar(45) NOT NULL,
  `RegionId` int NOT NULL,
  PRIMARY KEY (`StateId`),
  KEY `FK_StateRegion` (`RegionId`),
  CONSTRAINT `FK_StateRegion` FOREIGN KEY (`RegionId`) REFERENCES `region` (`RegionId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Lombardia',1),(2,'Veneto',1),(3,'Piemonte',1),(4,'Toscana',2),(5,'Lazio',2),(6,'Campania',3),(7,'Puglia',3),(8,'Sicilia',4),(9,'Sardegna',4);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stateinfo`
--

DROP TABLE IF EXISTS `stateinfo`;
/*!50001 DROP VIEW IF EXISTS `stateinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stateinfo` AS SELECT 
 1 AS `stateId`,
 1 AS `Statename`,
 1 AS `RegionName`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `productinfo`
--

/*!50001 DROP VIEW IF EXISTS `productinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productinfo` AS select `p`.`ProductId` AS `ProductId`,`p`.`ProductName` AS `ProductName`,`c`.`CategoryName` AS `CategoryName` from (`product` `p` join `category` `c` on((`p`.`CategoryId` = `c`.`CategoryId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stateinfo`
--

/*!50001 DROP VIEW IF EXISTS `stateinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stateinfo` AS select `st`.`StateId` AS `stateId`,`st`.`StateName` AS `Statename`,`r`.`RegionName` AS `RegionName` from (`state` `st` join `region` `r` on((`st`.`RegionId` = `r`.`RegionId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-10 10:33:16
