-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: online-store
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `description` text,
  `image_file_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Dell','Latops',NULL,'Dell XPS 13 with 16GB RAM and 512GB SSD','1716831479493_1716820695591_ (10).jpg','Dell XPS 13',1800,'2024-05-27 02:48:07.000000'),(2,'Dell','Laptop',NULL,'Dell Inspiron 15 with 8GB RAM and 256GB SSD','dell_inspiron_15.PNG','Dell Inspiron 15',1000,'2024-05-27 02:48:07.000000'),(3,'HP','Laptop',NULL,'HP Spectre x360 with 16GB RAM and 512GB SSD','hp_spectre_x360.PNG','HP Spectre x360',1600,'2024-05-27 02:48:07.000000'),(4,'HP','Laptop',NULL,'HP Pavilion 14 with 8GB RAM and 256GB SSD','hp_pavilion_14.PNG','HP Pavilion 14',900,'2024-05-27 02:48:07.000000'),(5,'Apple','Laptop',NULL,'Apple MacBook Air with M1 chip and 256GB SSD','macbook_air.PNG','Apple MacBook Air',1200,'2024-05-27 02:48:07.000000'),(6,'Apple','Laptop',NULL,'Apple MacBook Pro with M1 chip and 512GB SSD','macbook_pro.PNG','Apple MacBook Pro',2000,'2024-05-27 02:48:07.000000'),(7,'Lenovo','Laptop',NULL,'Lenovo ThinkPad X1 Carbon with 16GB RAM and 1TB SSD','lenovo_thinkpad_x1.PNG','Lenovo ThinkPad X1 Carbon',1700,'2024-05-27 02:48:07.000000'),(8,'Lenovo','Laptop',NULL,'Lenovo Yoga 920 with 8GB RAM and 512GB SSD','lenovo_yoga_920.PNG','Lenovo Yoga 920',1300,'2024-05-27 02:48:07.000000'),(9,'Asus','Laptop',NULL,'Asus ZenBook 14 with 16GB RAM and 512GB SSD','asus_zenbook_14.PNG','Asus ZenBook 14',1100,'2024-05-27 02:48:07.000000'),(10,'Asus','Laptop',NULL,'Asus ROG Strix with 32GB RAM and 1TB SSD','asus_rog_strix.PNG','Asus ROG Strix',1800,'2024-05-27 02:48:07.000000'),(11,'Acer','Laptop',NULL,'Acer Aspire 5 with 8GB RAM and 256GB SSD','acer_aspire_5.PNG','Acer Aspire 5',800,'2024-05-27 02:48:07.000000'),(12,'Acer','Laptop',NULL,'Acer Swift 3 with 8GB RAM and 512GB SSD','acer_swift_3.PNG','Acer Swift 3',900,'2024-05-27 02:48:07.000000'),(13,'Microsoft','Laptop',NULL,'Microsoft Surface Laptop 4 with 16GB RAM and 512GB SSD','surface_laptop_4.PNG','Microsoft Surface Laptop 4',1400,'2024-05-27 02:48:07.000000'),(14,'Microsoft','Laptop',NULL,'Microsoft Surface Pro 7 with 8GB RAM and 256GB SSD','surface_pro_7.PNG','Microsoft Surface Pro 7',1300,'2024-05-27 02:48:07.000000'),(15,'Razer','Laptop',NULL,'Razer Blade 15 with 32GB RAM and 1TB SSD','razer_blade_15.PNG','Razer Blade 15',2200,'2024-05-27 02:48:07.000000'),(16,'Samsung','Phone',NULL,'Samsung Galaxy S21 with 128GB storage','galaxy_s21.PNG','Samsung Galaxy S21',800,'2024-05-27 02:48:07.000000'),(17,'Samsung','Phone',NULL,'Samsung Galaxy Note 20 with 256GB storage','galaxy_note_20.PNG','Samsung Galaxy Note 20',1000,'2024-05-27 02:48:07.000000'),(18,'Apple','Phone',NULL,'iPhone 12 with 128GB storage','iphone_12.PNG','iPhone 12',900,'2024-05-27 02:48:07.000000'),(19,'Apple','Phone',NULL,'iPhone 12 Pro with 256GB storage','iphone_12_pro.PNG','iPhone 12 Pro',1100,'2024-05-27 02:48:07.000000'),(20,'Google','Phone',NULL,'Google Pixel 5 with 128GB storage','pixel_5.PNG','Google Pixel 5',700,'2024-05-27 02:48:07.000000'),(21,'Google','Phone',NULL,'Google Pixel 4a with 128GB storage','pixel_4a.PNG','Google Pixel 4a',500,'2024-05-27 02:48:07.000000'),(22,'OnePlus','Phone',NULL,'OnePlus 9 with 128GB storage','oneplus_9.PNG','OnePlus 9',750,'2024-05-27 02:48:07.000000'),(23,'OnePlus','Phone',NULL,'OnePlus 8T with 128GB storage','oneplus_8t.PNG','OnePlus 8T',650,'2024-05-27 02:48:07.000000'),(24,'Xiaomi','Phone',NULL,'Xiaomi Mi 11 with 128GB storage','mi_11.PNG','Xiaomi Mi 11',700,'2024-05-27 02:48:07.000000'),(25,'Xiaomi','Phone',NULL,'Xiaomi Redmi Note 10 with 64GB storage','redmi_note_10.PNG','Xiaomi Redmi Note 10',400,'2024-05-27 02:48:07.000000'),(26,'Sony','Phone',NULL,'Sony Xperia 1 II with 256GB storage','xperia_1_ii.PNG','Sony Xperia 1 II',1200,'2024-05-27 02:48:07.000000'),(27,'Sony','Phone',NULL,'Sony Xperia 5 II with 128GB storage','xperia_5_ii.PNG','Sony Xperia 5 II',950,'2024-05-27 02:48:07.000000'),(28,'Huawei','Phone',NULL,'Huawei P40 Pro with 256GB storage','p40_pro.PNG','Huawei P40 Pro',900,'2024-05-27 02:48:07.000000'),(29,'Huawei','Phone',NULL,'Huawei Mate 40 Pro with 256GB storage','mate_40_pro.PNG','Huawei Mate 40 Pro',1100,'2024-05-27 02:48:07.000000'),(30,'Oppo','Phone',NULL,'Oppo Find X3 Pro with 256GB storage','find_x3_pro.PNG','Oppo Find X3 Pro',1000,'2024-05-27 02:48:07.000000');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28 21:37:58
