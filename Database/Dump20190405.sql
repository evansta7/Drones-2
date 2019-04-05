-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: drones
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `crops`
--

DROP TABLE IF EXISTS `crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crops` (
  `CropID` int(11) NOT NULL AUTO_INCREMENT,
  `CropName` varchar(45) NOT NULL,
  `CropDescription` varchar(60) DEFAULT NULL,
  `IdealSoil` varchar(45) NOT NULL,
  `SoilDescription` varchar(60) DEFAULT NULL,
  `IdealClimateLowerRange` int(11) NOT NULL,
  `IdealClimateUpperRange` int(11) NOT NULL,
  `MostCommonPest` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CropID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crops`
--

LOCK TABLES `crops` WRITE;
/*!40000 ALTER TABLE `crops` DISABLE KEYS */;
/*!40000 ALTER TABLE `crops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drones`
--

DROP TABLE IF EXISTS `drones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drones` (
  `DroneID` int(11) NOT NULL AUTO_INCREMENT,
  `DroneType` varchar(45) NOT NULL,
  `DroneStatus` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DroneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drones`
--

LOCK TABLES `drones` WRITE;
/*!40000 ALTER TABLE `drones` DISABLE KEYS */;
/*!40000 ALTER TABLE `drones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farm`
--

DROP TABLE IF EXISTS `farm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `farm` (
  `FarmID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `StreetAddress` varchar(45) NOT NULL,
  `Suburb` varchar(30) NOT NULL,
  `PostalCode` varchar(5) NOT NULL,
  `FarmSize(ha)` int(8) DEFAULT NULL,
  PRIMARY KEY (`FarmID`),
  KEY `UserID_idx` (`UserID`),
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm`
--

LOCK TABLES `farm` WRITE;
/*!40000 ALTER TABLE `farm` DISABLE KEYS */;
INSERT INTO `farm` VALUES (1,1,'4 Hendon','Centurion','1692',8000);
/*!40000 ALTER TABLE `farm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmcrops`
--

DROP TABLE IF EXISTS `farmcrops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `farmcrops` (
  `FarmCropsID` int(11) NOT NULL AUTO_INCREMENT,
  `FarmID` int(11) NOT NULL,
  `CropID` int(11) NOT NULL,
  PRIMARY KEY (`FarmCropsID`),
  KEY `CropID` (`CropID`) /*!80000 INVISIBLE */,
  KEY `FarmID` (`FarmID`),
  CONSTRAINT `CropID` FOREIGN KEY (`CropID`) REFERENCES `crops` (`CropID`),
  CONSTRAINT `FarmID` FOREIGN KEY (`FarmID`) REFERENCES `farm` (`FarmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmcrops`
--

LOCK TABLES `farmcrops` WRITE;
/*!40000 ALTER TABLE `farmcrops` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmcrops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmdrones`
--

DROP TABLE IF EXISTS `farmdrones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `farmdrones` (
  `FarmDroneID` int(11) NOT NULL AUTO_INCREMENT,
  `FarmID` int(11) NOT NULL,
  `DroneID` int(11) NOT NULL,
  PRIMARY KEY (`FarmDroneID`),
  KEY `FarmID` (`FarmID`) /*!80000 INVISIBLE */,
  KEY `DroneID` (`DroneID`),
  CONSTRAINT `DroneIDs` FOREIGN KEY (`DroneID`) REFERENCES `drones` (`DroneID`),
  CONSTRAINT `FarmIDs` FOREIGN KEY (`FarmID`) REFERENCES `farm` (`FarmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmdrones`
--

LOCK TABLES `farmdrones` WRITE;
/*!40000 ALTER TABLE `farmdrones` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmdrones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `CellphoneNumber` varchar(10) DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nicole','123','n@gmail','0749927778','Nicole','Van Rooyen'),(2,'Liz','321','e@gmail.com','0825556666','Liz','Van Staden'),(3,'John','222','j@gmail.com','0258974569','John','Smith');
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

-- Dump completed on 2019-04-05 15:45:25
