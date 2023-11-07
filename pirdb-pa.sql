-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pirdbs
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminID` int NOT NULL AUTO_INCREMENT,
  `userNo` varchar(25) NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin1234567890','Mr','Kevin','Feige','Admin','32345678901','kevin@email.com','$2b$12$3gm5eta0D/sMVrxNBM16NuiCMjG36cVpGIpOfmgoPRZwtlTiPjHha');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bookingID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `plannerID` int DEFAULT NULL,
  `venueOrderID` int DEFAULT NULL,
  `foodOrderID` int DEFAULT NULL,
  `decorOrderID` int DEFAULT NULL,
  `startDate` date NOT NULL,
  `startTime` time NOT NULL,
  `endDate` date NOT NULL,
  `endTime` time NOT NULL,
  `guestsNumber` int DEFAULT NULL,
  `comments` text,
  `status` enum('Pending','Processing','Waiting for Payment','Paid','Completed','Cancelled') DEFAULT NULL,
  `ref_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `customerID` (`customerID`),
  KEY `plannerID` (`plannerID`),
  KEY `venueOrderID` (`venueOrderID`),
  KEY `foodOrderID` (`foodOrderID`),
  KEY `decorOrderID` (`decorOrderID`),
  CONSTRAINT `Bookings_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `Bookings_ibfk_2` FOREIGN KEY (`plannerID`) REFERENCES `planner` (`plannerID`),
  CONSTRAINT `Bookings_ibfk_3` FOREIGN KEY (`venueOrderID`) REFERENCES `venueorder` (`venueOrderID`),
  CONSTRAINT `Bookings_ibfk_4` FOREIGN KEY (`foodOrderID`) REFERENCES `menuorder` (`foodOrderID`),
  CONSTRAINT `Bookings_ibfk_5` FOREIGN KEY (`decorOrderID`) REFERENCES `decororder` (`decorOrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (18,1001,104,4,4,4,'2023-10-11','10:30:00','2023-10-12','22:30:00',60,NULL,'Completed','a5b640d1-6300-49ac-adb3-e3a946717d4e'),(26,1006,104,12,9,17,'2024-10-18','08:00:00','2024-10-18','13:00:00',99,'','Waiting for Payment','d0507d87-a7d3-4985-8a61-557e49333f30'),(29,1011,100,15,NULL,7,'2024-10-06','07:30:00','2024-10-09','22:30:00',800,NULL,'Processing','bcce3a0a-42f1-4513-8941-972875d48b69'),(31,1001,100,17,NULL,8,'2023-10-25','08:00:00','2023-10-27','08:00:00',80,'666','Cancelled','8b16e8de-2893-4a35-9b0b-f38ede7532b4'),(32,1001,NULL,18,5,12,'2024-10-24','07:00:00','2024-01-02','21:00:00',60,'Market Fair','Cancelled','35990733-e349-4d3f-8567-40e6c058e37f'),(33,1009,108,19,NULL,NULL,'2023-01-14','19:00:00','2023-01-19','21:00:00',300,'','Completed','92e9cd81-bcbc-4923-8c52-4c67d3368eb2'),(34,1001,100,20,NULL,NULL,'2023-11-27','16:10:00','2023-11-30','00:15:00',500,NULL,'Completed','7fbe6de9-d218-4410-871a-c0aefb450343'),(35,1003,105,21,6,16,'2023-11-14','08:00:00','2023-11-14','20:00:00',101,'','Processing','93aef0ef-b7f4-445c-8795-0b10b7d528b2'),(36,1001,100,22,8,NULL,'2023-11-20','10:00:00','2023-11-26','22:00:00',300,'','Waiting for Payment','b00120fc-818e-4f48-a530-2ad6c38b5787'),(53,1001,104,39,NULL,NULL,'2024-03-08','17:40:00','2024-03-10','16:38:00',200,'None','Processing','2dba4a19-b5e8-4001-a91a-301566b3e197'),(54,1003,NULL,40,NULL,NULL,'2024-02-19','16:49:00','2024-02-25','16:49:00',200,'','Cancelled','eccb418f-d823-4e1e-bd11-757f78aa57d9'),(55,1003,104,41,10,NULL,'2023-12-01','09:00:00','2023-12-01','17:00:00',105,'','Waiting for Payment','e9b6064f-c7a9-4d85-8c8a-e826d8d2bb41'),(56,1006,106,42,11,18,'2022-11-16','09:00:00','2022-11-16','22:00:00',30,'','Completed','56774951-6faf-452e-bee0-7afcf67f215d'),(57,1007,106,43,12,19,'2022-11-25','17:00:00','2022-11-26','00:00:00',30,'','Completed','02863d1c-5ecb-432f-b12f-6535405c72f1'),(58,1007,107,44,NULL,20,'2023-02-01','09:00:00','2023-02-10','17:00:00',70,NULL,'Waiting for Payment','63f5d596-26c5-4857-b5ce-a5fda1f7e20f'),(59,1008,108,45,NULL,21,'2023-11-28','14:00:00','2023-11-28','18:00:00',20,NULL,'Paid','ddc16737-f215-441d-bc3a-839d679b9b7d'),(60,1009,110,46,NULL,22,'2023-06-18','17:00:00','2023-06-19','00:00:00',200,NULL,'Completed','6d3eff07-e978-40fe-a79c-1dbf548e1b49'),(61,1010,105,47,13,23,'2024-03-23','09:00:00','2024-03-23','17:00:00',80,NULL,'Processing','a9204255-eca9-44e6-ba90-18e60db421c5'),(62,1011,106,48,NULL,24,'2024-01-17','09:00:00','2024-01-17','19:00:00',35,NULL,'Paid','5616af10-7f36-49da-861a-bda5ea6e0ffb'),(63,1012,107,49,14,25,'2023-04-02','12:00:00','2023-04-03','00:00:00',50,NULL,'Paid','f2a7505e-5ce8-4efd-88d4-5ac403207279'),(64,1013,109,50,NULL,NULL,'2022-12-16','12:00:00','2022-12-16','19:00:00',20,NULL,'Paid','406195e8-fb5b-4df1-b739-1be6712f82bd'),(65,1014,109,51,NULL,26,'2024-01-19','09:00:00','2024-01-19','12:00:00',26,NULL,'Completed','b7927d9d-f91f-4519-a6f9-74eca6958f0e'),(66,1015,111,52,15,27,'2024-06-01','12:00:00','2024-06-02','00:00:00',90,NULL,'Waiting for Payment','d61e850a-004f-4097-be28-c10ff2ef36f1'),(67,1016,104,53,NULL,28,'2024-03-16','09:00:00','2024-03-18','17:00:00',100,NULL,'Processing','7a831456-90a7-4860-a38d-959aa9db8734'),(68,1017,NULL,54,16,29,'2023-11-22','10:00:00','2023-11-22','14:00:00',15,NULL,'Pending','0a0adb7f-1f00-48ee-9ecc-00f729f92157'),(70,1009,108,56,NULL,NULL,'2023-11-09','00:00:00','2023-11-09','14:00:00',99,NULL,'Paid','c5c5b388-8db3-43f2-bacd-ec6ca687a103');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `calendarID` int NOT NULL AUTO_INCREMENT,
  `venueID` int DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `status` enum('Booked','Unavailable','Available','Maintenance','Holiday','Closed') DEFAULT NULL,
  `bookingID` int DEFAULT NULL,
  PRIMARY KEY (`calendarID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES (1,1,'2023-11-09','08:00:00','2023-11-09','20:00:00','Holiday',NULL),(4,1,'2023-10-31','08:15:00','2023-10-31','16:15:00','Closed',NULL),(5,1,'2023-10-30','06:00:00','2023-10-30','22:00:00','Maintenance',NULL),(7,1,'2023-10-24','04:00:00','2023-10-24','08:00:00','Closed',NULL),(8,1,'2023-10-27','20:00:00','2023-10-28','21:00:00','Maintenance',NULL),(9,1,'2023-11-04','10:00:00','2023-11-05','12:00:00','Maintenance',NULL),(10,1,'2023-11-01','22:00:00','2023-11-02','08:00:00','Holiday',NULL),(11,1,'2023-10-26','18:00:00','2023-10-26','20:00:00','Available',NULL),(12,4,'2023-10-26','20:00:00','2023-10-26','21:00:00','Closed',NULL),(13,1,'2024-02-08','05:00:00','2024-02-08','07:00:00','Closed',NULL),(14,1,'2023-10-20','08:00:00','2023-10-20','10:00:00','Maintenance',NULL),(15,1,'2023-10-29','03:00:00','2023-10-29','05:00:00','Closed',NULL),(16,1,'2023-10-11','10:30:00','2023-10-12','22:30:00','Booked',18),(17,3,'2023-10-18','08:00:00','2023-10-18','10:00:00','Booked',26),(18,8,'2023-10-06','07:30:00','2023-10-09','22:30:00','Booked',29),(19,6,'2023-10-25','08:00:00','2023-10-27','08:00:00','Booked',31),(20,1,'2023-11-10','17:16:00','2023-11-10','16:16:00','Booked',32),(22,4,'2023-10-22','17:20:00','2023-10-22','18:20:00','Booked',34),(36,1,'2024-03-08','17:40:00','2024-03-10','16:38:00','Booked',53),(39,1,'2023-11-14','08:00:00','2023-11-15','20:00:00','Booked',35),(40,4,'2023-11-25','17:00:00','2023-11-26','00:00:00','Booked',57),(41,8,'2024-02-01','09:00:00','2024-02-10','17:00:00','Booked',58),(42,11,'2023-11-28','14:00:00','2023-11-28','18:00:00','Booked',59),(43,15,'2023-12-18','17:00:00','2023-12-19','00:00:00','Booked',60),(44,9,'2023-12-02','12:00:00','2023-12-03','00:00:00','Booked',63),(45,10,'2023-12-16','12:00:00','2023-12-16','19:00:00','Booked',64),(46,2,'2024-06-01','12:00:00','2024-06-02','00:00:00','Booked',66),(47,8,'2024-03-16','09:00:00','2024-03-18','17:00:00','Booked',67),(48,11,'2023-11-22','10:00:00','2023-11-22','14:00:00','Booked',68),(49,7,'2023-11-14','19:00:00','2023-11-19','21:00:00','Booked',33),(50,5,'2023-11-09','00:00:00','2023-11-09','14:00:00','Booked',70);
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `userNo` varchar(25) NOT NULL,
  `title` varchar(10) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `VIP` tinyint DEFAULT '0',
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1001,'c36434','Miss','Naomi','Chen','customer','02040804383','naomichen@example.com','666 Dufek Crescent Christchurch',NULL,'$12$xOxYAoNSrU2hMtU92ylZzecjSEY8KXWQn5Yfbnj3/cPKSTf962X5u',0),(1003,'c57604','Dr','Jondy','Zhen','customer','0212324329','jondyzhen@example.com','123 Six Six Street,  Auckland','2001-08-08','$12$xOxYAoNSrU2hMtU92ylZzecjSEY8KXWQn5Yfbnj3/cPKSTf962X5u',0),(1006,'c75984','Miss','Emily','Johnson','customer','11211111','emily@email.com',NULL,NULL,'$2b$12$HY7NLn8qeuR4e4zf.xKV8.M08ffE7XXEiqk8hqGNozeo7Y/MSiajK',0),(1007,'c10131','Mr','Michael','Smith','customer','022334567','michael@email.com','None',NULL,'$2b$12$hnjbdZwnRn3vW0QKrJJFcOMV5gvkc6xO5dpO4aJ/25vxOoCMWzOvK',0),(1008,'c34340','Mrs','Isabella','Brown','customer',NULL,'isabella@email.com',NULL,NULL,'$2b$12$7bqsIsNJmQtSyLA5Ny9h4.S2iFQepRmUiyP7j/pFgSczhcvkv44ha',0),(1009,'c35752','Mrs','Ethan','Davis','customer',NULL,'Ethan@email.com',NULL,NULL,'$2b$12$PrZrg7Xhh24drCcWi5sVsOKOtv6MZ.Std68c0RLznF/4Nt65W9tOu',0),(1010,'c91552','Miss','Sophia','Martinez','customer',NULL,'sophia@email.com',NULL,NULL,'$2b$12$56mzOwAxCb83iyZZEtsqZeVFMmsACzMqdHNG3O7SLIl4YiANwOUtu',0),(1011,'c23700','Mr','Alexander','Wilson','customer',NULL,'alexander@email.com',NULL,NULL,'$2b$12$AQiAhbnjPmlE1uFUYSZHNO6bRXRccUhaYLhvOTDp6bQFooO4uSw1e',0),(1012,'c48424','Miss','Olivia','Garcia','customer',NULL,'olivia@email.com',NULL,NULL,'$2b$12$7MPwO3XMkt2RuM84802xBOM2K0WQ16OeM0tvB4iMmzBV7cpAKWeBW',0),(1013,'c05186','Mr','Daniel','Taylor','customer',NULL,'daniel@email.com',NULL,NULL,'$2b$12$cjRTWng7DfD2gJB25y1QPeDMk5kJJ5Q34rj4AobHFdC83TkjFfZKa',0),(1014,'c72544','Dr','Lily','Turner','customer',NULL,'lily@email.com',NULL,NULL,'$2b$12$x/XcuPsXWlEFVUv8nDiwnOLFTVhdnm4E/vIBZD.zclbXdTlb7RivS',0),(1015,'c68110','Mr','Matthew','Lewis','customer',NULL,'matthew@email.com',NULL,NULL,'$2b$12$9BLYUMUOfGYbvuhQAeQ2KuzU8KFQUyqG1ISp2vgKEWInt8y/Q8/S2',0),(1016,'c38265','Mrs','Grace','Robinson','customer',NULL,'grace@email.com',NULL,NULL,'$2b$12$c1caOBpjIqq9mICV4IZhHewLZ0ZpWHh5rjTKyoZLGCaGy1JVtaY8O',0),(1017,'c44332','Mr','James','Walker','customer',NULL,'james@email.com',NULL,NULL,'$2b$12$xOxYAoNSrU2hMtU92ylZzecjSEY8KXWQn5Yfbnj3/cPKSTf962X5u',0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoration`
--

DROP TABLE IF EXISTS `decoration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoration` (
  `decorationID` int NOT NULL AUTO_INCREMENT,
  `decorationType` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`decorationID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoration`
--

LOCK TABLES `decoration` WRITE;
/*!40000 ALTER TABLE `decoration` DISABLE KEYS */;
INSERT INTO `decoration` VALUES (1,'Western Wedding Decor',600.00,NULL,'Elegant and romantic decor inspired by Western wedding traditions.'),(2,'Indian Wedding Decor',800.00,NULL,'Vibrant and colorful decor inspired by Indian wedding themes.'),(3,'Chinese Wedding Decor',700.00,NULL,'Traditional and culturally rich decor for Chinese weddings.'),(4,'Party Balloon Decor',80.00,NULL,'Colorful balloon decorations to create a festive party atmosphere.'),(5,'Party Lighting Package',200.00,NULL,'Customized lighting packages to set the mood for your party.'),(6,'Professional Meeting Setup',150.00,NULL,'Sleek and professional setup for corporate meetings.'),(7,'Team Building Props',150.00,NULL,'Engaging props and equipment for team building activities.'),(8,'Exhibition Booth Design',500.00,NULL,'Custom booth designs to showcase your products at expos.'),(9,'Corporate Meeting Setup',150.00,NULL,'Professional setup and branding materials for corporate meetings.'),(10,'Workshop Whiteboard & Markers',50.00,NULL,'Whiteboards and markers for interactive workshops.'),(11,'Sports Event Banners',150.00,NULL,'Large banners and flags to enhance the sports event atmosphere.');
/*!40000 ALTER TABLE `decoration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decororder`
--

DROP TABLE IF EXISTS `decororder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decororder` (
  `decorOrderID` int NOT NULL AUTO_INCREMENT,
  `bookingID` int NOT NULL,
  `decorationID` int NOT NULL,
  PRIMARY KEY (`decorOrderID`),
  KEY `bookingID` (`bookingID`),
  KEY `decorationID` (`decorationID`),
  CONSTRAINT `decororder_ibfk_1` FOREIGN KEY (`decorationID`) REFERENCES `decoration` (`decorationID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decororder`
--

LOCK TABLES `decororder` WRITE;
/*!40000 ALTER TABLE `decororder` DISABLE KEYS */;
INSERT INTO `decororder` VALUES (4,18,4),(7,29,11),(8,31,7),(12,32,8),(16,35,2),(17,26,5),(18,56,9),(19,57,4),(20,58,8),(21,59,6),(22,60,11),(23,61,2),(24,62,10),(25,63,5),(26,65,6),(27,66,1),(28,67,8),(29,68,10);
/*!40000 ALTER TABLE `decororder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guestID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `enquery` text NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`guestID`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1000,'Mr','Dog','Worf','dog@gmail.com','31-10-2023 - Hi, do you serve dog food? -- From Guest: Dog Worf  Email: dog@gmail.com  Phone: N/A',NULL);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `foodID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`foodID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Italian Cuisine',60.00,'Italian.jpg','Enjoy a delightful array of Italian dishes, including pasta, lasagna, and tiramisu, accompanied by a selection of fine Italian wines.'),(2,'Japanese Cuisine',65.00,'Japanese.jpg','Indulge in authentic Japanese flavors with sushi, sashimi, tempura, and more. Paired with traditional sake or green tea'),(3,'Indian Cuisine',40.50,'Indian.jpg','Experience the vibrant flavors of India with dishes like butter chicken, paneer tikka, biryani, and warm naan bread.'),(4,'Mexican Cuisine',35.50,'Mexican.jpg','Savor the spicy and hearty dishes of Mexico, including tacos, enchiladas, and churros, complemented by a refreshing margarita.'),(5,'French Cuisine',55.50,'French.jpg','Delight in the sophisticated flavors of French cuisine with dishes like coq au vin, ratatouille, and crème brûlée, paired with exquisite French wine.'),(6,'Chinese Cuisine',88.88,'Chinese.jpg','Feast on authentic Chinese dishes including dim sum, Peking duck, sweet and sour pork, and kung pao chicken, complemented by a pot of warm, aromatic tea.'),(7,'Breakfast Menu',30.00,'Breakfast.jpg','Start your day right with a hearty American breakfast. Choose from a range of options including pancakes, bacon, eggs, and a cup of fresh coffee or juice.'),(8,'Platters Menu',95.50,'Platters.jpg','Enjoy a diverse array of platters featuring a mix of international flavors. Options include cheese and charcuterie boards, seafood platters, and vegetarian antipasto selections.');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuorder`
--

DROP TABLE IF EXISTS `menuorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuorder` (
  `foodOrderID` int NOT NULL AUTO_INCREMENT,
  `bookingID` int NOT NULL,
  `foodID` int NOT NULL,
  PRIMARY KEY (`foodOrderID`),
  KEY `bookingID` (`bookingID`),
  KEY `foodID` (`foodID`),
  CONSTRAINT `menuorder_ibfk_1` FOREIGN KEY (`foodID`) REFERENCES `menu` (`foodID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuorder`
--

LOCK TABLES `menuorder` WRITE;
/*!40000 ALTER TABLE `menuorder` DISABLE KEYS */;
INSERT INTO `menuorder` VALUES (4,18,4),(5,32,8),(6,35,2),(8,36,3),(9,26,3),(10,55,1),(11,56,7),(12,57,3),(13,61,1),(14,63,8),(15,66,1),(16,68,4);
/*!40000 ALTER TABLE `menuorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `bookingID` int DEFAULT NULL,
  `customerID` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `bankAccount` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `bookingID` (`bookingID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`),
  CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (2,31,1001,2018.25,'0011111122334121','2023-10-14'),(7,32,1001,2662.95,'0011111122334121','2023-10-16'),(12,33,1001,2336.50,'0011111122334121','2023-01-17'),(14,56,1006,2232.00,'2222222222222222','2022-11-07'),(15,57,1007,2069.25,'3333332222222222','2022-11-07'),(16,62,1011,862.50,'3333332222222222','2023-11-07'),(17,63,1012,4205.25,'1133332222222222','2023-02-07'),(19,59,1008,494.50,'5533332222222222','2023-11-07'),(20,64,1013,946.68,'5533332222222222','2022-11-07'),(21,65,1014,483.00,'5533332222222222','2023-11-07'),(22,60,1009,3795.00,'5533332222222222','2023-11-07'),(23,70,1009,1127.00,'5533332222222222','2023-11-07'),(24,18,1001,1293.00,'5533332222222222','2023-11-07'),(25,34,1001,2325.00,'5533332222222222','2023-11-07'),(26,60,1009,2233.00,'5533332222222222','2023-11-07'),(27,26,1006,2131.00,'5533332222222222','2023-11-07');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planner`
--

DROP TABLE IF EXISTS `planner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planner` (
  `plannerID` int NOT NULL AUTO_INCREMENT,
  `userNo` varchar(25) NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profileDescription` text,
  `profilePhoto` varchar(255) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`plannerID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planner`
--

LOCK TABLES `planner` WRITE;
/*!40000 ALTER TABLE `planner` DISABLE KEYS */;
INSERT INTO `planner` VALUES (100,'p12345','Mr','Jayden','Chen','planner','02040804383','jaydenchen@email.com','3 Dufek Crescent, Christchurch','None','None','$2b$12$hVtIGAVP3BsNl5x9Q1TS9OHSnUpPCI25MUjhB80.qhcjHJOQKe136'),(104,'p40882','Mr','Bob','Builder','planner','0273489025','bob@email.com','123 four five six street, Auckland','10 years experience','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDlbZRhU0UFWI5fPyHUxzYF_lKfJh7oBUUeQ&usqp=CAU','$2b$12$hVtIGAVP3BsNl5x9Q1TS9OHSnUpPCI25MUjhB80.qhcjHJOQKe136'),(105,'p20044','Miss','Ava','Thompson','planner',NULL,'ava@email.com',NULL,NULL,NULL,'$2b$12$GPUkBxAHqfWd/BD98IV2hu0xmjbcj6etyLMNf4QRRb0bU1dfMsIFq'),(106,'p00283','Mr','William','White','planner',NULL,'william@email.com',NULL,NULL,NULL,'$2b$12$Hedk.ZgLNL7aLuWaG8TPBuGbiZqTgZJE3F2eMffoFFZoNo/GSHLSa'),(107,'p37293','Mrs','Mia','Anderson','planner',NULL,'mia@email.com',NULL,NULL,NULL,'$2b$12$hVtIGAVP3BsNl5x9Q1TS9OHSnUpPCI25MUjhB80.qhcjHJOQKe136'),(108,'p64482','Mr','Joshua','Moore','planner',NULL,'joshua@email.com',NULL,NULL,NULL,'$2b$12$CP.jtLPTq4DR2xEKBt2HpOLqxZEl5w7nj2XOkkLqQBssa3Rz4HfDi'),(109,'p16971','Mx','Charlotte','Jackson','planner',NULL,'charlotte@email.com',NULL,NULL,NULL,'$2b$12$Rf6g2fX/iIY2oskRaeewyOK1/8mTwWHfzfVvbQ7S1q4HsWic2PSPO'),(110,'p80406','Dr','Christopher','Lee','planner',NULL,'christopher@email.com',NULL,NULL,NULL,'$2b$12$c5TXL8LpE4I4h9FQfN5uU.vs6AYzgYnn3zlx8pCXukSXyswMfanxa'),(111,'p78617','Mrs','Amelia','Harris','planner',NULL,'amelia@email.com',NULL,NULL,NULL,'$2b$12$Q2LHy6w3711jdb8RUroxqu.d.IrOxTRWt1ON7PpLoupnQt14ImdYq'),(112,'p15990','Mr','Benjamin','Clark','planner',NULL,'benjamin@email.com',NULL,NULL,NULL,'$2b$12$rCwu65BEzSbTLKcukEkOfOygngCS1cMizVdFmXr55qm3AD3ty7CGK');
/*!40000 ALTER TABLE `planner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation`
--

DROP TABLE IF EXISTS `quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookingID` int DEFAULT NULL,
  `venue_fee` decimal(10,2) DEFAULT NULL,
  `decoration_fee` decimal(10,2) DEFAULT NULL,
  `menu_price` decimal(10,2) DEFAULT NULL,
  `additional_requirements` text,
  `discounts` decimal(10,2) DEFAULT NULL,
  `notes` text,
  `expiry_date` date DEFAULT NULL,
  `payment_terms` text,
  `total_before_tax` decimal(10,2) DEFAULT NULL,
  `gst_amount` decimal(10,2) DEFAULT NULL,
  `total_including_gst` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `additional_fee` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookingID` (`bookingID`),
  CONSTRAINT `quotation_ibfk_1` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation`
--

LOCK TABLES `quotation` WRITE;
/*!40000 ALTER TABLE `quotation` DISABLE KEYS */;
INSERT INTO `quotation` VALUES (3,31,800.00,150.00,0.00,'Sound system and lighting for the evening party.',195.00,'Client prefers eco-friendly decorations. Ensure all dishes are gluten-free.','2023-10-27','100% upfront',1755.00,263.25,2018.25,NULL,1000),(4,26,200.00,0.00,0.00,'',0.00,'','2023-10-28','100% upfront',200.00,30.00,230.00,NULL,0),(5,32,1640.00,500.00,5730.00,'better lighting and sound system',837.00,'','2023-10-26','100% upfront',7533.00,1129.95,8662.95,NULL,500),(6,33,5300.00,0.00,0.00,'Extra lightings, good sound system',290.00,'','2023-10-31','100% upfront',5510.00,826.50,6336.50,NULL,500),(7,35,3000.00,600.00,4884.00,'',0.00,'','2023-02-12','100% upfront',8484.00,1272.60,9756.60,NULL,0),(9,36,7800.00,80.00,0.00,'',404.00,'','2023-11-07','100% upfront',7676.00,1151.40,8827.40,NULL,200),(22,55,960.00,0.00,6300.00,'More flowers',368.00,'','2023-11-09','100% upfront',6992.00,1048.80,8040.80,NULL,100),(23,56,400.00,150.00,900.00,'',0.00,'','2023-11-14','100% upfront',1450.00,217.50,1667.50,NULL,0),(24,57,560.00,80.00,1215.00,'',55.65,'','2023-11-18','100% upfront',1799.35,269.90,2069.25,NULL,0),(25,62,700.00,50.00,0.00,'',0.00,'','2023-11-15','100% upfront',750.00,112.50,862.50,NULL,0),(26,63,2160.00,200.00,4775.00,'',0.00,'','2023-11-10','100% upfront',7135.00,1070.25,8205.25,NULL,0),(27,58,15100.00,500.00,0.00,'',0.00,'','2023-11-10','100% upfront',15600.00,2340.00,17940.00,NULL,0),(28,59,280.00,150.00,0.00,'',0.00,'','2023-11-11','100% upfront',430.00,64.50,494.50,NULL,0),(29,64,840.00,0.00,0.00,'',16.80,'','2023-11-11','100% upfront',823.20,123.48,946.68,NULL,0),(30,65,270.00,150.00,0.00,'',0.00,'','2023-11-11','100% upfront',420.00,63.00,483.00,NULL,0),(31,60,3150.00,150.00,0.00,'',0.00,'','2023-11-11','100% upfront',3300.00,495.00,3795.00,NULL,0),(32,66,1440.00,600.00,5400.00,'',0.00,'','2023-11-11','100% upfront',7440.00,1116.00,8556.00,NULL,0),(33,70,980.00,0.00,0.00,'',0.00,'','2023-11-11','100% upfront',980.00,147.00,1127.00,NULL,0);
/*!40000 ALTER TABLE `quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminder`
--

DROP TABLE IF EXISTS `reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminder` (
  `reminderID` int NOT NULL AUTO_INCREMENT,
  `reminderDate` date NOT NULL,
  `reminderType` enum('Public','Individual') NOT NULL,
  `customerID` int DEFAULT NULL,
  `adminID` int DEFAULT NULL,
  `plannerID` int DEFAULT NULL,
  `guestID` int DEFAULT NULL,
  `reminderTxt` text,
  `reminderImg` varchar(255) DEFAULT NULL,
  `status` enum('read','unread') DEFAULT 'unread',
  PRIMARY KEY (`reminderID`),
  KEY `customerID` (`customerID`),
  KEY `adminID` (`adminID`),
  KEY `plannerID` (`plannerID`),
  KEY `guestID` (`guestID`),
  CONSTRAINT `Reminder_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `Reminder_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`),
  CONSTRAINT `Reminder_ibfk_3` FOREIGN KEY (`plannerID`) REFERENCES `planner` (`plannerID`),
  CONSTRAINT `Reminder_ibfk_4` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder`
--

LOCK TABLES `reminder` WRITE;
/*!40000 ALTER TABLE `reminder` DISABLE KEYS */;
INSERT INTO `reminder` VALUES (45,'2023-10-29','Individual',1003,NULL,NULL,NULL,'2023-10-29 - Hi Jondy Zhen, Your booking at Mystic Hall has been updated. Please feel free to contact us if you have any questions. -- From Admin Kevin Feige',NULL,'read'),(46,'2023-10-29','Individual',NULL,NULL,NULL,NULL,'2023-10-29 - Hi None, Your assigned job at Mystic Hall has some changes, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(47,'2023-10-29','Individual',1003,NULL,NULL,NULL,'Hi Jondy Zhen, your booking at Mystic Hall has been cancelled. If you have any questions please feel free to contact us. -- From Admin Kevin Feige',NULL,'read'),(48,'2023-10-29','Individual',NULL,NULL,NULL,NULL,'Hi None, your job at Mystic Hall has been cancelled, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(49,'2023-10-31','Individual',NULL,1,NULL,1000,'31-10-2023 - Hi, do you serve dog food? -- From Guest: Dog Worf  Email: dog@gmail.com  Phone: N/A',NULL,'read'),(50,'2023-10-31','Individual',1003,NULL,NULL,NULL,'31-10-2023 - Your booking at Elegant Mansion Wedding Venue has been successfully assigned to a planner. Please check your bookings to get more details -- From Planner: 104 Bob Builder',NULL,'unread'),(52,'2023-10-31','Individual',1003,NULL,NULL,NULL,'31-10-2023 - Your quote for booking at Elegant Mansion Wedding Venue is ready!',NULL,'unread'),(53,'2023-10-31','Individual',NULL,1,104,NULL,'31-10-2023 - Hi I want to add some lights for my booking.\n -- From Customer: 1003 Jondy Zhen',NULL,'read'),(54,'2023-10-31','Individual',1001,NULL,NULL,NULL,'31-10-2023 - Hi Naomi Chen,Your booking at Contemporary Art Gallery has been assigned to planner Bob Builder. -- From Admin Kevin Feige',NULL,'read'),(56,'2023-10-31','Individual',1001,NULL,NULL,NULL,'31-10-2023 - Your quote for booking at Contemporary Art Gallery is ready!',NULL,'read'),(59,'2023-10-31','Individual',1001,NULL,NULL,NULL,'31-10-2023 - Your booking at Elegant Mansion Wedding Venue has been assigned to a planner. Please check your bookings to get more details -- From Planner: 104 Bob Builder',NULL,'read'),(61,'2023-10-31','Individual',1003,NULL,NULL,NULL,'31-10-2023 - Hi Jondy Zhen,Your booking at Elegant Mansion Wedding Venue has been assigned to planner Bob Builder. -- From Admin Kevin Feige',NULL,'unread'),(63,'2023-10-31','Individual',1001,NULL,NULL,NULL,'31-10-2023 - Your quote for booking at Contemporary Art Gallery is ready!',NULL,'read'),(64,'2023-10-31','Individual',1001,NULL,NULL,NULL,'31-10-2023 - Your booking at Elegant Mansion Wedding Venue has been assigned to a planner. Please check your bookings to get more details -- From Planner: 104 Bob Builder',NULL,'read'),(65,'2023-10-31','Individual',1001,NULL,NULL,NULL,'31-10-2023 - Hi Naomi Chen,Your booking at Exhibition Hall & Convention Center has been assigned to a new planner Jayden Chen. -- From Admin Kevin Feige',NULL,'unread'),(66,'2023-10-31','Individual',NULL,NULL,100,NULL,'31-10-2023 - Hi Jayden Chen, you have been assigned a new job at Exhibition Hall & Convention Center, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(67,'2023-11-01','Individual',1001,NULL,NULL,NULL,'01-11-2023 - Your booking at Corporate Conference Center has been assigned to a planner. Please check your bookings to get more details -- From Planner: 104 Bob Builder',NULL,'unread'),(70,'2023-11-01','Individual',1001,NULL,NULL,NULL,'01-11-2023 - Your booking at Exhibition Hall & Convention Center has been assigned to a planner. Please check your bookings to get more details -- From Planner: 104 Bob Builder',NULL,'unread'),(74,'2023-11-01','Individual',1001,NULL,NULL,NULL,'01-11-2023 - Your booking at Corporate Conference Center has been assigned to a planner. Please check your bookings to get more details -- From Planner: 104 Bob Builder',NULL,'unread'),(75,'2023-11-01','Individual',1001,NULL,NULL,NULL,'01-11-2023 - Hi Naomi Chen,Your booking at Exhibition Hall & Convention Center has been assigned to planner Jayden Chen. -- From Admin Kevin Feige',NULL,'unread'),(76,'2023-11-01','Individual',NULL,NULL,100,NULL,'01-11-2023 - Hi Jayden Chen, you have been assigned a new job at Exhibition Hall & Convention Center, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(77,'2023-11-02','Individual',1003,NULL,NULL,NULL,'02-11-2023 - Hi Jondy Zhen,Your booking at Intimate Garden Wedding Venue has been assigned to planner Bob Builder. -- From Admin Kevin Feige',NULL,'unread'),(79,'2023-11-02','Individual',1001,NULL,NULL,NULL,'02-11-2023 - Your quote for booking at Corporate Conference Center is ready!',NULL,'unread'),(80,'2023-11-02','Individual',1001,NULL,NULL,NULL,'02-11-2023 - Your quote for booking at Corporate Conference Center is ready!',NULL,'unread'),(81,'2023-11-02','Individual',1001,NULL,NULL,NULL,'02-11-2023 - Your quote for booking at Corporate Conference Center is ready!',NULL,'unread'),(82,'2023-11-02','Individual',1001,NULL,NULL,NULL,'02-11-2023 - Your quote for booking at Corporate Conference Center is ready!',NULL,'unread'),(83,'2023-11-02','Individual',1003,NULL,NULL,NULL,'02-11-2023 - Your booking at Intimate Garden Wedding Venue has been assigned to a planner. Please check your bookings to get more details -- From Planner: 104 Bob Builder',NULL,'unread'),(84,'2023-11-02','Individual',1003,NULL,NULL,NULL,'02-11-2023 - Your quote for booking at Intimate Garden Wedding Venue is ready!',NULL,'unread'),(85,'2023-11-02','Individual',1001,NULL,NULL,NULL,'02-11-2023 - Your booking at Elegant Mansion Wedding Venue has been assigned to a planner. Please check your bookings to get more details -- From Planner: 104 Bob Builder',NULL,'unread'),(86,'2023-11-07','Individual',1003,NULL,NULL,NULL,'07-11-2023 - Hi Jondy Zhen,Your booking at Elegant Mansion Wedding Venue has been assigned to planner Ava Thompson. -- From Admin Kevin Feige',NULL,'unread'),(87,'2023-11-07','Individual',NULL,NULL,105,NULL,'07-11-2023 - Hi Ava Thompson, you have been assigned a new job at Elegant Mansion Wedding Venue, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(88,'2023-11-07','Individual',1006,NULL,NULL,NULL,'07-11-2023 - Hi Emily Johnson,Your booking at Corporate Conference Center has been assigned to planner William White. -- From Admin Kevin Feige',NULL,'unread'),(89,'2023-11-07','Individual',NULL,NULL,106,NULL,'07-11-2023 - Hi William White, you have been assigned a new job at Corporate Conference Center, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(90,'2023-11-07','Individual',1007,NULL,NULL,NULL,'07-11-2023 - Hi Michael Smith,Your booking at Exhibition Hall & Convention Center has been assigned to planner Mia Anderson. -- From Admin Kevin Feige',NULL,'unread'),(91,'2023-11-07','Individual',NULL,NULL,107,NULL,'07-11-2023 - Hi Mia Anderson, you have been assigned a new job at Exhibition Hall & Convention Center, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(92,'2023-11-07','Individual',1007,NULL,NULL,NULL,'07-11-2023 - Hi Michael Smith,Your booking at Executive Boardroom has been assigned to planner William White. -- From Admin Kevin Feige',NULL,'unread'),(93,'2023-11-07','Individual',NULL,NULL,106,NULL,'07-11-2023 - Hi William White, you have been assigned a new job at Executive Boardroom, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(94,'2023-11-07','Individual',1008,NULL,NULL,NULL,'07-11-2023 - Hi Isabella Brown,Your booking at Executive Meeting Room has been assigned to planner Joshua Moore. -- From Admin Kevin Feige',NULL,'unread'),(95,'2023-11-07','Individual',NULL,NULL,108,NULL,'07-11-2023 - Hi Joshua Moore, you have been assigned a new job at Executive Meeting Room, please check your bookings. -- From Admin Kevin Feige',NULL,'read'),(96,'2023-11-07','Individual',1009,NULL,NULL,NULL,'07-11-2023 - Hi Ethan Davis,Your booking at Stadium Arena has been assigned to planner Christopher Lee. -- From Admin Kevin Feige',NULL,'unread'),(97,'2023-11-07','Individual',NULL,NULL,110,NULL,'07-11-2023 - Hi Christopher Lee, you have been assigned a new job at Stadium Arena, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(98,'2023-11-07','Individual',1011,NULL,NULL,NULL,'07-11-2023 - Hi Alexander Wilson,Your booking at Tech Workshop Lab has been assigned to planner William White. -- From Admin Kevin Feige',NULL,'unread'),(99,'2023-11-07','Individual',NULL,NULL,106,NULL,'07-11-2023 - Hi William White, you have been assigned a new job at Tech Workshop Lab, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(100,'2023-11-07','Individual',1010,NULL,NULL,NULL,'07-11-2023 - Hi Sophia Martinez,Your booking at Intimate Garden Wedding Venue has been assigned to planner Ava Thompson. -- From Admin Kevin Feige',NULL,'unread'),(101,'2023-11-07','Individual',NULL,NULL,105,NULL,'07-11-2023 - Hi Ava Thompson, you have been assigned a new job at Intimate Garden Wedding Venue, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(102,'2023-11-07','Individual',1013,NULL,NULL,NULL,'07-11-2023 - Hi Daniel Taylor,Your booking at Cozy Lounge & Bar has been assigned to planner Charlotte Jackson. -- From Admin Kevin Feige',NULL,'unread'),(103,'2023-11-07','Individual',NULL,NULL,109,NULL,'07-11-2023 - Hi Charlotte Jackson, you have been assigned a new job at Cozy Lounge & Bar, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(104,'2023-11-07','Individual',1012,NULL,NULL,NULL,'07-11-2023 - Hi Olivia Garcia,Your booking at Grand Ballroom Party Venue has been assigned to planner Mia Anderson. -- From Admin Kevin Feige',NULL,'unread'),(105,'2023-11-07','Individual',NULL,NULL,107,NULL,'07-11-2023 - Hi Mia Anderson, you have been assigned a new job at Grand Ballroom Party Venue, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(106,'2023-11-07','Individual',1014,NULL,NULL,NULL,'07-11-2023 - Hi Lily Turner,Your booking at Creative Workshop Studio has been assigned to planner Charlotte Jackson. -- From Admin Kevin Feige',NULL,'unread'),(107,'2023-11-07','Individual',NULL,NULL,109,NULL,'07-11-2023 - Hi Charlotte Jackson, you have been assigned a new job at Creative Workshop Studio, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(108,'2023-11-07','Individual',1015,NULL,NULL,NULL,'07-11-2023 - Hi Matthew Lewis,Your booking at Intimate Garden Wedding Venue has been assigned to planner Amelia Harris. -- From Admin Kevin Feige',NULL,'unread'),(109,'2023-11-07','Individual',NULL,NULL,111,NULL,'07-11-2023 - Hi Amelia Harris, you have been assigned a new job at Intimate Garden Wedding Venue, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(110,'2023-11-07','Individual',1016,NULL,NULL,NULL,'07-11-2023 - Hi Grace Robinson,Your booking at Exhibition Hall & Convention Center has been assigned to planner Bob Builder. -- From Admin Kevin Feige',NULL,'unread'),(111,'2023-11-07','Individual',NULL,NULL,104,NULL,'07-11-2023 - Hi Bob Builder, you have been assigned a new job at Exhibition Hall & Convention Center, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(112,'2023-11-07','Individual',1001,NULL,NULL,NULL,'07-11-2023 - Hi Naomi Chen, Your booking at Contemporary Art Gallery has been updated. Please feel free to contact us if you have any questions. -- From Admin Kevin Feige',NULL,'unread'),(113,'2023-11-07','Individual',NULL,NULL,NULL,NULL,'07-11-2023 - Hi None, Your assigned job at Contemporary Art Gallery has some changes, please check your bookings. -- From Admin Kevin Feige',NULL,'unread'),(114,'2023-11-07','Individual',1001,NULL,NULL,NULL,'07-11-2023 - Hi Naomi Chen,Your booking at Contemporary Art Gallery has been assigned to planner Joshua Moore. -- From Admin Kevin Feige',NULL,'unread'),(115,'2023-11-07','Individual',NULL,NULL,108,NULL,'07-11-2023 - Hi Joshua Moore, you have been assigned a new job at Contemporary Art Gallery, please check your bookings. -- From Admin Kevin Feige',NULL,'read'),(116,'2023-11-07','Individual',1006,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Corporate Conference Center is ready!',NULL,'unread'),(117,'2023-11-07','Individual',1007,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Executive Boardroom is ready!',NULL,'unread'),(118,'2023-11-07','Individual',1011,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Tech Workshop Lab is ready!',NULL,'unread'),(119,'2023-11-07','Individual',1012,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Grand Ballroom Party Venue is ready!',NULL,'unread'),(120,'2023-11-07','Individual',1007,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Exhibition Hall & Convention Center is ready!',NULL,'unread'),(121,'2023-11-07','Individual',1008,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Executive Meeting Room is ready!',NULL,'unread'),(122,'2023-11-07','Individual',1013,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Cozy Lounge & Bar is ready!',NULL,'unread'),(123,'2023-11-07','Individual',1014,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Creative Workshop Studio is ready!',NULL,'unread'),(124,'2023-11-07','Individual',1009,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Stadium Arena is ready!',NULL,'unread'),(125,'2023-11-07','Individual',1015,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Intimate Garden Wedding Venue is ready!',NULL,'unread'),(126,'2023-11-07','Individual',1009,NULL,NULL,NULL,'07-11-2023 - Your booking at Adventure Team Building Center has been assigned to a planner. Please check your bookings to get more details -- From Planner: 108 Joshua Moore',NULL,'unread'),(127,'2023-11-07','Individual',1009,NULL,NULL,NULL,'07-11-2023 - Your quote for booking at Adventure Team Building Center is ready!',NULL,'unread'),(128,'2023-11-07','Individual',NULL,NULL,108,NULL,'07-11-2023 - Hi Joshua Moore, The payment for booking at Adventure Team Building Center has been paid. -- From Customer 1009 Ethan Davis',NULL,'unread');
/*!40000 ALTER TABLE `reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `venueID` int NOT NULL AUTO_INCREMENT,
  `venueName` varchar(255) NOT NULL,
  `eventArea` decimal(10,2) NOT NULL,
  `maxCapacity` int NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `dailyPrice` decimal(10,2) DEFAULT NULL,
  `hourlyPrice` decimal(10,2) DEFAULT NULL,
  `description` text,
  `rented` tinyint DEFAULT NULL,
  `image` json DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`venueID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'Elegant Mansion Wedding Venue',300.00,200,'Romantic Lakeside','Active',1200.00,150.00,'A luxurious mansion with a lakeside view, perfect for elegant weddings and receptions.',0,'[\"https://media.istockphoto.com/id/1177485677/photo/table-setting-for-an-event-party-or-wedding-reception.jpg?s=1024x1024&w=is&k=20&c=b71LRf6D0bHp8FLoThQrczlQbXTtX3S2Ne-hX-LqLwU=\", \"https://media.istockphoto.com/id/1184628725/photo/3d-wedding-reception-background-illustration.jpg?s=1024x1024&w=is&k=20&c=0m3iJMQ2gPO07dNt_qwL9vkn0UJ_DOGJ5w8t73ZFxPk=\", \"https://media.istockphoto.com/id/479977238/photo/table-setting-for-an-event-party-or-wedding-reception.jpg?s=1024x1024&w=is&k=20&c=qti63rRq16bK0FPyjd6Jngc0U5zSVLfYf1_u5wtT9Oc=\"]','wedding'),(2,'Intimate Garden Wedding Venue',200.00,150,'Enchanted Gardens','Active',800.00,120.00,'A charming garden venue, ideal for intimate and romantic weddings.',0,'[\"https://cloudfront.slrlounge.com/wp-content/uploads/2018/09/wedding-reception-ballroom-photography-800x400.jpg\", \"https://img.freepik.com/free-photo/decorated-table-setting-wedding-celebration_181624-4606.jpg?w=826&t=st=1696239889~exp=1696240489~hmac=b07b9f680d6e11097be01e32949ad82167f5631dc1369502a4653b85538506c4\", \"https://img.freepik.com/premium-photo/festive-table-decoration-elements-flora-luxury-hall_174350-888.jpg?w=826\"]','wedding, indoor'),(3,'Corporate Conference Center',600.00,500,'Downtown Business District','Active',800.00,100.00,'State-of-the-art conference facilities in the heart of the business district, perfect for corporate conferences.',0,'[\"https://www.iino.co.jp/hall/en/assets/img/guide/conferencecenter/img_01.png\", \"https://www.ppic.org/wp-content/uploads/bcc-option-1-1280x576.jpg\", \"https://www.iino.co.jp/hall/en/assets/img/guide/conferencecenter/img_00.png\"]','conference, meeting, indoor'),(4,'Executive Boardroom',40.00,30,'City Center','Active',600.00,80.00,'An exclusive boardroom with modern amenities, suitable for high-profile meetings.',0,'[\"https://media.extron.com/public/img/mktg/boardroom_header.jpg\", \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLB1ruOPGfUzNHFBKBfayENgRlGT4vl83hLprnjJdDkOAKHail82yWFzjnmoFzewXoX4E&usqp=CAU\", \"https://olathe.k-state.edu/images/rooms/board-room.jpg\", \"https://olathe.k-state.edu/images/.private_ldp/a292593/production/master/a22d6543-7cc0-4c7f-a05d-dbba1912776a.jpg\", \"https://olathe.k-state.edu/images/.private_ldp/a292593/production/master/6ed1eaa6-c395-4dc6-abc4-0588f6b484c0.jpg\"]','conference, meeting, indoor'),(5,'Adventure Team Building Center',150.00,100,'Scenic Wilderness','Active',500.00,70.00,'An outdoor adventure center designed for team building activities, including ropes courses and team challenges.',0,'[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa8DGiiCwTtPC9y5-inI-p5A9GEqqmvOIG4ui_eJrezQpO8-jQWeznEZaDeUvZCrh-e0s&usqp=CAU\", \"https://www.outlife.in/uploads/6/1/9/7/6197204/published/1-7.jpg?1604628862\", \"https://i.pinimg.com/originals/51/80/d5/5180d59a36d240cfd7e650ff76d13836.jpg\", \"https://static.wixstatic.com/media/a4989e_c9ce76bb84ec48d0a90810678dc86298~mv2_d_3600_2400_s_4_2.jpg/v1/fill/w_640,h_426,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/a4989e_c9ce76bb84ec48d0a90810678dc86298~mv2_d_3600_2400_s_4_2.jpg\"]','meeting, team building, indoor'),(6,'Indoor Team Building Space',120.00,80,'Downtown Loft','Active',400.00,60.00,'A versatile indoor space with team-building games and activities, ideal for fostering team spirit.',0,'[\"https://white-rhino.co.uk/wp-content/uploads/2014/12/Indoor-Team-Building-Venues.jpg\", \"https://www.experiential-training.com/wp-content/uploads/2013/12/RI-Blindfold.jpg\", \"https://www.outbackteambuilding.com/media/blog-featured/minute-to-win-it-indoor-team-building.jpg\"]','meeting, team building, indoor'),(7,'Contemporary Art Gallery',400.00,300,'Artistic District','Active',1000.00,150.00,'A spacious art gallery showcasing contemporary art, perfect for art exhibitions and cultural events.',0,'[\"https://artgallery.yale.edu/sites/default/files/styles/hero_small/public/2023-01/ag-doc-2201-0001-pub.jpg?h=589f04c2&itok=5ItkOKKN\", \"https://mcasd.org/client-uploads/images/_mcasd_image_1_62x1_1200px_w/MCASD-LJ-1.jpg\", \"https://www.arts.uci.edu/sites/default/files/IMG_5020.JPG\"]','gallery, indoor'),(8,'Exhibition Hall & Convention Center',900.00,800,'Expo Park','Active',1500.00,200.00,'A massive exhibition hall with convention facilities, ideal for large-scale expos and trade shows.',0,'[\"https://www.bcec.com.au/wp-content/uploads/2018/08/EXHIBITION_HALL_Expo_1.jpg\", \"https://signatureboston.s3.amazonaws.com/assets/made/images/remote/http_s3.amazonaws.com/signatureboston/2column/BCEC_ExhibitHall1_670_376.jpg\", \"https://kyconvention.imgix.net/2022/12/2QOZwEwL-LbrStbLy-LargeExhibitHall-Hero.jpg?fm=jpg&ixlib=php-3.3.1&auto=compress&ar=211:100&w=1055&h=500&fit=crop&crop=top\"]','Exhibition, indoor'),(9,'Grand Ballroom Party Venue',400.00,300,'Luxury Hotel','Active',1200.00,180.00,'A grand ballroom in a luxury hotel, perfect for hosting extravagant parties and gala dinners.',0,'[\"https://images.prismic.io/the-grand/824afabe-1dd6-470f-82a9-190196deee51_gallery-ballroom-08.jpg?auto=compress,format\", \"https://edqkvt6c5r7.exactdn.com/wp-content/uploads/2019/07/grand-ballroom-at-hgc-brisbane-venue-maestro-function-room-2.jpg?strip=all&lossy=1&ssl=1\", \"https://spalbastaging.s3.ap-south-1.amazonaws.com/venue_images/1667202252603-Grand%20Ballroom%20-%20TOGk%20Banquet%20Hall.png\"]','party, indoor'),(10,'Cozy Lounge & Bar',100.00,80,'Downtown Lounge','Active',800.00,120.00,'A stylish lounge and bar with a cozy atmosphere, ideal for intimate parties and cocktail events.',0,'[\"https://cdn.vox-cdn.com/thumbor/3lTM4_ZYVHjC4Hvt5hgZBRR-BUY=/0x69:960x572/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/10470919/whiskey_library2.jpg\", \"https://www.freep.com/gcdn/presto/2022/09/29/PDTF/4174cc77-0b85-4edc-b25b-255b076e305a-DSC_3556.jpg?width=660&height=374&fit=crop&format=pjpg&auto=webp\", \"https://www.kimptonhotels.com/blog/wp-content/uploads/2013/01/aspen-1024x792.jpg\"]','party, indoor'),(11,'Executive Meeting Room',30.00,20,'Business Park','Active',500.00,70.00,'A high-end executive meeting room with a modern design, suitable for executive board meetings and strategy sessions.',0,'[\"https://images.ctfassets.net/osq47g2esuw5/5rcK0U3uY4jzVcsr9d2XM/3c9ebe552ef1031251671b55cf01149b/Executive_Meeting_-_F_G_H_-_CISCO_WALL_FINISH.jpg?w=2880&h=1620&fl=progressive&q=35&fm=jpg\", \"https://www.lottehotel.com/content/dam/lotte-hotel/lotte/seoul/facilities/business/executive-tower-meeting-room/191114-1-2000-fac-LTSE.jpg.thumb.768.768.jpg\", \"https://www.executivecentre.com/wp-content/uploads/2020/10/img-meetingroomrental_meetingroom.jpg\"]','meeting, indoor'),(12,'Tech Startup Collaboration Space',60.00,50,'Innovation Hub','Active',400.00,60.00,'A collaborative workspace for tech startups, equipped with the latest technology for innovation-driven meetings.',0,'[\"https://www.acquisition-international.com/wp-content/uploads/2021/02/co-working-space.jpg\", \"https://canvasoffices.co.uk/wp-content/uploads/2019/07/Team-at-work-for-video-stills-.jpg\", \"https://downtowntampaoffice.com/wp-content/uploads/2017/11/law-office-coworking-space-Tampa.jpg\"]','meeting, indoor'),(13,'Creative Workshop Studio',50.00,40,'Artistic Quarter','Active',600.00,90.00,'A creative studio space with natural light, perfect for hands-on workshops and artistic sessions.',0,'[\"https://subsites-newsroom.imgix.net/sites/pinnews/files/post_main_content_image/2018-01/Pinfluencers-1168.jpg?ixlib=php-3.3.1&s=69a7f1de670b236229752290d36c9b4a\", \"https://headbox-media.imgix.net/uploads/space_photo/filename/59105/StudioLune1.jpg?auto=format&ar=3%3A2&fit=crop&q=60&ixlib=react-9.5.4\", \"https://images.pexels.com/photos/10322846/pexels-photo-10322846.jpeg?auto=compress&cs=tinysrgb&w=400\"]','workshop, lab, indoor'),(14,'Tech Workshop Lab',80.00,60,'Tech Hub','Active',450.00,70.00,'A tech workshop lab equipped with cutting-edge tools and equipment, ideal for tech-focused workshops and training sessions.',0,'[\"https://pu.edu.lb/sites/default/files/technical-workshop_0.jpg\", \"https://vignanits.ac.in/wp-content/uploads/2020/07/106.jpg\", \"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF87E0n5W965GAqbeO0nf0vUnTKLSdPf8fz6RWDJmia0QlONbW9Q9W8dTgZgpvuh7h_c0&usqp=CAU\"]','workshop, lab, indoor'),(15,'Stadium Arena',12000.00,10000,'Sports Complex','Active',3000.00,450.00,'A massive stadium arena with seating for thousands, suitable for major sports events and tournaments.',0,'[\"https://ungerboeckdotcomassets.blob.core.windows.net/volumes/content/articles/_wide/shutterstock_1912601503-1.jpg\", \"https://img.fcbayern.com/image/upload/v1601458426/cms/public/images/allianz-arena/stadion-innenraum/aa_haupttribuene.jpg\", \"https://ccc.govt.nz/assets/Images/The-Council/Future-projects/Low_DD_fieldofView__ResizedImageWzg1NSw0MDBd.jpg\"]','stadium, outdoor'),(16,'Indoor Sports Facility',600.00,500,'Sports Park','Active',1800.00,260.00,'A versatile indoor sports facility, perfect for smaller sports events and competitions.',0,'[\"https://hoovermetcomplex.com/wp-content/uploads/2019/06/Indoor-sports-complex-basketball-courts.jpg\", \"https://integralspor.com/uploads/facility/list/2000-kisilik-kapali-spor-salonlari-img-1.jpg\", \"https://cdn1.sportngin.com/attachments/photo/ceb9-157252725/SportsExpoweb_large.jpg\"]','stadium, indoor'),(18,'Mystic Hall',350.00,250,'123 Magic Street, Wonderland','Active',3000.00,350.00,'Mystic Hall is an enchanting venue that sits at the heart of Wonderland. With its magical ambiance and stunning architecture, it\'s the perfect place for fairy-tale weddings, grand balls, and memorable events. The venue boasts a grand hall with crystal chandeliers, a spacious dance floor, and a beautiful garden view. Complemented by top-notch facilities and a dedicated staff, Mystic Hall promises an event like no other.',0,'[\"https://images.pexels.com/photos/13278413/pexels-photo-13278413.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1\\r\", \"https://images.pexels.com/photos/11093767/pexels-photo-11093767.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load\\r\", \"https://images.pexels.com/photos/15878186/pexels-photo-15878186/free-photo-of-columns-under-ornamented-ceiling.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load\"]','gallery, indoor');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venueorder`
--

DROP TABLE IF EXISTS `venueorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venueorder` (
  `venueOrderID` int NOT NULL AUTO_INCREMENT,
  `venueID` int NOT NULL,
  `bookingID` int NOT NULL,
  `plannerID` int DEFAULT NULL,
  PRIMARY KEY (`venueOrderID`),
  KEY `venueID` (`venueID`),
  KEY `bookingID` (`bookingID`),
  KEY `plannerID` (`plannerID`),
  CONSTRAINT `VenueOrder_ibfk_1` FOREIGN KEY (`venueID`) REFERENCES `venue` (`venueID`),
  CONSTRAINT `VenueOrder_ibfk_2` FOREIGN KEY (`plannerID`) REFERENCES `planner` (`plannerID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venueorder`
--

LOCK TABLES `venueorder` WRITE;
/*!40000 ALTER TABLE `venueorder` DISABLE KEYS */;
INSERT INTO `venueorder` VALUES (4,1,18,NULL),(12,3,26,NULL),(13,8,27,NULL),(14,3,28,NULL),(15,8,29,NULL),(17,6,31,NULL),(18,6,32,NULL),(19,7,33,NULL),(20,8,34,NULL),(21,1,35,NULL),(22,7,36,NULL),(23,1,37,NULL),(24,1,38,NULL),(25,1,39,NULL),(26,1,40,NULL),(27,1,41,NULL),(28,1,42,NULL),(29,1,43,NULL),(30,1,44,NULL),(31,1,45,NULL),(32,1,46,NULL),(33,1,47,NULL),(34,1,48,NULL),(35,1,49,NULL),(39,1,53,NULL),(40,18,54,NULL),(41,2,55,NULL),(42,3,56,NULL),(43,4,57,NULL),(44,8,58,NULL),(45,11,59,NULL),(46,15,60,NULL),(47,2,61,NULL),(48,14,62,NULL),(49,9,63,NULL),(50,10,64,NULL),(51,13,65,NULL),(52,2,66,NULL),(53,8,67,NULL),(54,11,68,NULL),(56,5,70,NULL);
/*!40000 ALTER TABLE `venueorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-07 22:23:14
