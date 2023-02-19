CREATE DATABASE  IF NOT EXISTS `module_3_bookstoremanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `module_3_bookstoremanagement`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: module_3_bookstoremanagement
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `avaiable` bigint DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `dateAdd` date DEFAULT NULL,
  `idBookType` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'1.jpg','Dao kiếm thần vực','Kawahara Reki',100000,0,0,'2000-01-01',1),(2,'2.jpg','Oregairu','WatarU WatarI',175000,0,1,'1999-03-19',3),(3,'4.jpg','Tháº¥t Nghiá»p Chuyá»n Sinh','Rifujin Na Magonote',200000,1,-3,'2010-04-30',1),(4,'3.jpg','Overlord','Kugane Maruyama',110000,100,100,'1999-03-08',2),(5,'5.jpg','5 cm/s','Shinkai Makoto',85000,1,10,'2022-05-01',4),(6,'6.jpg','Your Name','Shinkai Makoto',75000,9,9,'2022-07-20',4),(7,'7.jpg','Khu vườn ngôn từ','Shinkai Makoto',66000,93,98,'2022-07-28',4),(8,'8.jpg','Weathering With You','Shinkai Makoto',195000,43,53,'2022-08-01',4);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_type`
--

DROP TABLE IF EXISTS `book_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_type`
--

LOCK TABLES `book_type` WRITE;
/*!40000 ALTER TABLE `book_type` DISABLE KEYS */;
INSERT INTO `book_type` VALUES (1,'HOT'),(2,'PERFECT'),(3,'LEGEND'),(4,'NORMAL');
/*!40000 ALTER TABLE `book_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_men`
--

DROP TABLE IF EXISTS `customer_men`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_men` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `createAt` date DEFAULT NULL,
  `idType` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_men`
--

LOCK TABLES `customer_men` WRITE;
/*!40000 ALTER TABLE `customer_men` DISABLE KEYS */;
INSERT INTO `customer_men` VALUES (1,'150.jpg','Quang Dang','quangdang@gmail.com','123456','28 NTP','2023-01-01',1),(2,'150 (1).jpg','Admin','admin@gmail.com','1','28 NTP','2023-01-01',2),(3,'150 (2).jpg','User','user@gmail.com','1','28 NTP','2023-01-01',3),(4,'150 (3).jpg','Thien Phung','thienphung@gmail.com','123456','28 NTP','2023-01-01',1),(5,'150 (4).jpg','Lam Dong Nine','lamdongnine@gmail.com','123456456','28 NTP','2023-01-01',2),(10,'150 (1).jpg','Aurora asdas','leqep@mailinator.com','Dolorem adipisicing ','Nihil daasd','2022-07-10',2);
/*!40000 ALTER TABLE `customer_men` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_type`
--

DROP TABLE IF EXISTS `customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_type` (
  `id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_type`
--

LOCK TABLES `customer_type` WRITE;
/*!40000 ALTER TABLE `customer_type` DISABLE KEYS */;
INSERT INTO `customer_type` VALUES (1,'ADMIN'),(2,'MODIFIER'),(3,'USER');
/*!40000 ALTER TABLE `customer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (71,'\"19\"','\"+1 (215) 905-6054\"','\"Xaviera Byrd\"',195000),(72,'\"67\"','\"+1 (551) 166-7468\"','\"Kuame Adams\"',261000),(73,'\"\"','\"\"','\"\"',261000),(74,'\"\"','\"\"','\"\"',1311000),(75,'\"\"','\"\"','\"\"',600000);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id_order` bigint NOT NULL,
  `id_product` bigint NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id_order`,`id_product`),
  KEY `fk_id_product_idx` (`id_product`),
  CONSTRAINT `fk_id_order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_id_product` FOREIGN KEY (`id_product`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (71,8,1),(72,7,1),(72,8,1),(73,7,1),(73,8,1),(74,6,1),(74,7,1),(74,8,6),(75,3,3);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type`
--

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
INSERT INTO `order_type` VALUES (1,'NEW'),(2,'PAID'),(3,'CANCELED'),(4,'BORROW'),(5,'BORROWPAID'),(6,'BORROWING');
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'module_3_bookstoremanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `spSaveOrderSP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSaveOrderSP`(
	IN order_data JSON
)
BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    START TRANSACTION;
	SET @sName = JSON_EXTRACT(order_data, '$.name');
	SET @sPhone = JSON_EXTRACT(order_data, '$.phone');
	SET @sAddress = JSON_EXTRACT(order_data, '$.address');
	SET @sTotal = JSON_EXTRACT(order_data, '$.total');
	SET @sOrderItems = JSON_EXTRACT(order_data, '$.orderItems');
        
	INSERT INTO `module_3_bookstoremanagement`.`order` (`address`, `phone`, `name`, `total`) VALUES (@sAddress, @sPhone, @sName, @sTotal);

	SET @last_OrderId = LAST_INSERT_ID();
	SET @sOrderItems_Length = JSON_LENGTH(@sOrderItems);
    WHILE i < @sOrderItems_Length DO
		SET @idBook = JSON_EXTRACT(order_data, CONCAT('$.orderItems[',i,'].idBook'));
        SET @quantiy = JSON_EXTRACT(order_data, CONCAT('$.orderItems[',i,'].quantiy'));
		INSERT INTO `module_3_bookstoremanagement`.`order_item` (`id_order`, `id_product`, `quantity`) VALUES (@last_OrderId, @idBook , @quantiy);
		SET i = i+1;
    END WHILE;
    
    -- INSERT INTO `module_3_bookstoremanagement`.`order_item` (`id_order`, `id_book`, `quantity`) VALUES ('9', '3', '1');

    
    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSaveOrderWithParameter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSaveOrderWithParameter`(
	IN order_data JSON,
    OUT sOutput boolean
)
BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    set sOutput = true;
    START TRANSACTION;
	SET @sName = JSON_EXTRACT(order_data, '$.name');
	SET @sPhone = JSON_EXTRACT(order_data, '$.phone');
	SET @sAddress = JSON_EXTRACT(order_data, '$.address');
	SET @sTotal = JSON_EXTRACT(order_data, '$.total');
	SET @sOrderItems = JSON_EXTRACT(order_data, '$.orderItems');
        
	INSERT INTO `module_3_bookstoremanagement`.`order` (`address`, `phone`, `name`, `total`) VALUES (@sAddress, @sPhone, @sName, @sTotal);

	SET @last_OrderId = LAST_INSERT_ID();
	SET @sOrderItems_Length = JSON_LENGTH(@sOrderItems);
    
    WHILE i < @sOrderItems_Length DO
		SET @idBook = JSON_EXTRACT(order_data, CONCAT('$.orderItems[',i,'].idBook'));
        SET @quantiy = JSON_EXTRACT(order_data, CONCAT('$.orderItems[',i,'].quantiy'));
		INSERT INTO `module_3_bookstoremanagement`.`order_item` (`id_order`, `id_product`, `quantity`) VALUES (@last_OrderId, @idBook , @quantiy);
		SET i = i+1;
    END WHILE;
    
	  -- INSERT INTO `module_3_bookstoremanagement`.`order_item` (`id_order`, `id_product`, `quantity`) VALUES ('9', '3', '1');


    IF `_rollback` THEN
		set sOutput = false;
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
    
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

-- Dump completed on 2023-02-20  1:22:06
