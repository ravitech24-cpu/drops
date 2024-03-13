CREATE DATABASE  IF NOT EXISTS `parivaar_org` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `parivaar_org`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: parivaar_org
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `item_name` varchar(45) NOT NULL,
  `description1` varchar(200) DEFAULT NULL,
  `current_inventory_quantity` decimal(10,0) NOT NULL,
  `current_inventory_unit` decimal(10,0) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `active_from_date` datetime DEFAULT NULL,
  `description2` varchar(200) DEFAULT NULL,
  `description3` varchar(200) DEFAULT NULL,
  `quantity_measured_in` varchar(45) DEFAULT NULL,
  `active_till_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'ITM1','Fish','des1',24,500,1,'2024-02-22 00:00:00','des2','des3',NULL,'2024-02-29 00:00:00'),(2,'ITM2','Rice','rice1',30,2,1,'2024-02-23 00:00:00','rice2','rice3','KG','2024-03-30 00:00:00'),(3,'ITM001','TEA','Description 1',5,NULL,1,'2024-02-26 00:00:00','Description 2','Description 3','KG',NULL),(4,'ITM5','DAL','',200,NULL,1,'2024-03-12 00:00:00','','','KG','2024-03-31 00:00:00');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_history`
--

DROP TABLE IF EXISTS `item_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_idx` (`item_id`),
  CONSTRAINT `item` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_history`
--

LOCK TABLES `item_history` WRITE;
/*!40000 ALTER TABLE `item_history` DISABLE KEYS */;
INSERT INTO `item_history` VALUES (1,7,'2023-11-01 12:45:28'),(2,10,'2023-11-01 22:27:49'),(3,16,'2023-11-01 22:28:07'),(4,17,'2023-11-01 22:28:19'),(5,18,'2023-11-01 22:28:28'),(6,19,'2023-11-01 22:28:36'),(7,15,'2023-11-27 21:44:15'),(8,11,'2023-11-27 21:45:12'),(9,12,'2023-11-27 21:47:16'),(10,13,'2023-11-27 21:48:09'),(11,22,'2023-11-28 14:32:51'),(12,14,'2023-11-28 15:15:42');
/*!40000 ALTER TABLE `item_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_list`
--

DROP TABLE IF EXISTS `item_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `stock_grams` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_idx` (`supplier_id`),
  CONSTRAINT `supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Item List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_list`
--

LOCK TABLES `item_list` WRITE;
/*!40000 ALTER TABLE `item_list` DISABLE KEYS */;
INSERT INTO `item_list` VALUES (3,2,'Busicui','Buiscuit',20,0,'2023-10-25 21:36:37','2023-10-26 14:16:36',100),(5,2,'def','wef',333,0,'2023-10-26 13:21:47','2023-10-26 16:46:46',334),(7,2,'def','wef',333,0,'2023-10-26 13:21:47','2023-11-01 12:45:28',200),(10,2,'Fish','Fish',250,0,'2023-11-01 22:22:18','2023-11-01 22:27:49',2000),(11,2,'Tea','Tea',200,0,'2023-11-01 22:22:36','2023-11-27 21:45:12',1000),(12,2,'Surf','Surf',50,0,'2023-11-01 22:23:01','2023-11-27 21:47:16',500),(13,2,'Rice','Rice',200,0,'2023-11-01 22:23:26','2023-11-27 21:48:09',5000),(14,2,'Dal','Dal',500,0,'2023-11-01 22:23:55','2023-11-28 15:15:42',8000),(15,2,'Carrot','Carrot',500,0,'2023-11-01 22:24:46','2023-11-27 21:44:15',5000),(16,2,'Fish','Fish',250,0,'2023-11-01 22:22:18','2023-11-01 22:28:07',1500),(17,2,'Fish','Fish',250,0,'2023-11-01 22:22:18','2023-11-01 22:28:19',1200),(18,2,'Fish','Fish',250,0,'2023-11-01 22:22:18','2023-11-01 22:28:28',1000),(19,2,'Fish','Fish',250,0,'2023-11-01 22:22:18','2023-11-01 22:28:36',800),(20,2,'Fish','Fish',250,1,'2023-11-01 22:22:18','2023-11-01 22:28:36',500),(21,2,'Carrot','Carrot',500,1,'2023-11-01 22:24:46','2023-11-27 21:44:15',4500),(22,1,'Tea','Tea',200,0,'2023-11-01 22:22:36','2023-11-28 14:32:51',1000),(24,2,'Surf','Surf',50,0,'2023-11-01 22:23:01','2023-11-27 21:47:16',500),(25,2,'Rice','Rice',200,0,'2023-11-01 22:23:26','2023-11-27 21:48:09',5000),(26,1,'Tea','Tea',200,1,'2023-11-01 22:22:36','2023-11-28 14:32:51',800),(27,2,'Dal','Dal',500,1,'2023-11-01 22:23:55','2023-11-28 15:15:42',7500);
/*!40000 ALTER TABLE `item_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_list`
--

DROP TABLE IF EXISTS `state_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_list` (
  `id` int NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_list`
--

LOCK TABLES `state_list` WRITE;
/*!40000 ALTER TABLE `state_list` DISABLE KEYS */;
INSERT INTO `state_list` VALUES (1,'ANDAMAN AND NICOBAR ISLANDS'),(2,'ANDHRA PRADESH'),(3,'ARUNACHAL PRADESH'),(4,'ASSAM'),(5,'BIHAR'),(6,'CHATTISGARH'),(7,'CHANDIGARH'),(8,'DAMAN AND DIU'),(9,'DELHI'),(10,'DADRA AND NAGAR HAVELI'),(11,'GOA'),(12,'GUJARAT'),(13,'HIMACHAL PRADESH'),(14,'HARYANA'),(15,'JAMMU AND KASHMIR'),(16,'JHARKHAND'),(17,'KERALA'),(18,'KARNATAKA'),(19,'LAKSHADWEEP'),(20,'MEGHALAYA'),(21,'MAHARASHTRA'),(22,'MANIPUR'),(23,'MADHYA PRADESH'),(24,'MIZORAM'),(25,'NAGALAND'),(26,'ORISSA'),(27,'PUNJAB'),(28,'PONDICHERRY'),(29,'RAJASTHAN'),(30,'SIKKIM'),(31,'TAMIL NADU'),(32,'TRIPURA'),(33,'UTTARAKHAND'),(34,'UTTAR PRADESH'),(35,'WEST BENGAL'),(36,'TELANGANA');
/*!40000 ALTER TABLE `state_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suppliercode` varchar(45) NOT NULL,
  `suppliername` varchar(45) NOT NULL,
  `description1` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `active_from_date` datetime DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `contact_name1` varchar(45) DEFAULT NULL,
  `contact_name2` varchar(45) DEFAULT NULL,
  `contact1_phone` varchar(15) DEFAULT NULL,
  `contact2_phone` varchar(15) DEFAULT NULL,
  `gst_no` varchar(20) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  `description2` varchar(200) DEFAULT NULL,
  `description3` varchar(200) DEFAULT NULL,
  `address_line3` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contact1_alternate_phone` varchar(15) DEFAULT NULL,
  `contact2_alternate_phone` varchar(15) DEFAULT NULL,
  `active_till_date` datetime DEFAULT NULL,
  `primary_phone` varchar(15) DEFAULT NULL,
  `alternate_phone` varchar(15) DEFAULT NULL,
  `state_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_state_idx` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (16,'ewe22e','sfsf','fsf',1,'2024-03-07 00:00:00','sfsf','sf','24e2424','cdxcvxv ','242424','24242','dwee','2024-03-07 15:15:13','sdfsd','fsfsf','sfsf','svcsv',1,'123133','dvcd@gmail.com','24242422','424242',NULL,'2e2e42','2e42e42',NULL),(17,'wqfrqw','fsfsef','efgef',1,NULL,'egvesvg','vgewgvegv','svsdv','fbdf','sdbdsfb','2424','','2024-03-07 15:15:56','wegvewgvfw','evgwev','sedvse','dsv',22,'24242e4','','dsfbdfb','2424',NULL,'134124','4214124',NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_list`
--

DROP TABLE IF EXISTS `supplier_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(85) NOT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_list`
--

LOCK TABLES `supplier_list` WRITE;
/*!40000 ALTER TABLE `supplier_list` DISABLE KEYS */;
INSERT INTO `supplier_list` VALUES (1,'Ravi&Associate','Riverside1','Ravinder Singh','8100833220',1,'2023-10-18 22:49:15','2023-11-28 15:07:24'),(2,'Shanvi Traders','NewTown','Shanvi','9088555544',1,'2023-10-18 22:51:44','2024-01-30 15:48:25'),(6,'rgmnrgf','nmrmn','drgmndrgfmn','rgtmrstmn',0,'2023-10-18 23:45:42','2023-10-18 23:45:42'),(7,'tj','fgmgvm','fgm','344',1,'2023-11-27 21:39:49','2023-11-27 21:39:49'),(8,'Test','TestAddress','ABC','9878888958',1,'2023-11-28 15:07:07','2023-11-28 15:07:07');
/*!40000 ALTER TABLE `supplier_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transactionId` varchar(45) DEFAULT NULL,
  `itemname` varchar(45) DEFAULT NULL,
  `transactiontype` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `openingbalance` double DEFAULT NULL,
  `closingbalance` double DEFAULT NULL,
  `details1` varchar(200) DEFAULT NULL,
  `details2` varchar(200) DEFAULT NULL,
  `details3` varchar(200) DEFAULT NULL,
  `supplier` int DEFAULT NULL,
  `perunitcost` double DEFAULT NULL,
  `totalcost` double DEFAULT NULL,
  `itemid` int DEFAULT NULL,
  `branch` int DEFAULT NULL,
  `itemquantity` double DEFAULT NULL,
  `dayusage` double DEFAULT NULL,
  `nightusage` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_idx` (`supplier`),
  KEY `fk_transactiontype_idx` (`transactiontype`),
  KEY `fk_item_idx` (`itemid`),
  KEY `fk_branch_idx` (`branch`),
  CONSTRAINT `fk_branch` FOREIGN KEY (`branch`) REFERENCES `state_list` (`id`),
  CONSTRAINT `fk_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`id`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`),
  CONSTRAINT `fk_transactiontype` FOREIGN KEY (`transactiontype`) REFERENCES `transactiontype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (4,NULL,NULL,1,'2024-03-12 16:17:18','',0,20,'','','',NULL,2,40,NULL,NULL,20,NULL,NULL),(5,NULL,NULL,1,'2024-03-12 16:22:48','day',0,30,'d1','d2','d3',NULL,2,60,4,NULL,30,NULL,NULL),(6,NULL,'Rice',1,'2024-03-12 16:49:25','night',0,20,'d11','d22','d33',NULL,2,40,2,5,20,NULL,NULL),(7,'01HRS6BB0G2N97M72ZRBBRGB4P','TEA',1,'2024-03-12 16:52:31','',0,60,'d22','d33','d44',NULL,3,180,3,6,60,NULL,NULL),(8,'01HRS6F93G2J9ERMKJ0817MKPE','DAL',1,'2024-03-12 16:54:34','day',30,50,'','','',NULL,2,40,4,7,20,NULL,NULL),(9,'01HRS6K4H5T07QC3YC8KR524CF','DAL',1,'2024-03-12 16:56:42','day',50,60,'','','',17,3,30,4,8,10,NULL,NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontype`
--

DROP TABLE IF EXISTS `transactiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiontype` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontype`
--

LOCK TABLES `transactiontype` WRITE;
/*!40000 ALTER TABLE `transactiontype` DISABLE KEYS */;
INSERT INTO `transactiontype` VALUES (1,'ADDINGOPENINGSTOCK','AOS'),(2,'CONSUMPTION','CON'),(3,'PURCHASE','PUR'),(4,'WASTAGELOSSDAMAGE','WLD'),(5,'RECOVERY','REC'),(6,'RETURN','RET');
/*!40000 ALTER TABLE `transactiontype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-13 16:38:45
