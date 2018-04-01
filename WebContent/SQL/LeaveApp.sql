CREATE DATABASE  IF NOT EXISTS `attivo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `attivo`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: attivo
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `emailID` varchar(60) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cal`
--

DROP TABLE IF EXISTS `cal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cal` (
  `totdays` int(11) DEFAULT NULL,
  `leave_applied` int(11) DEFAULT NULL,
  `emailID` varchar(60) DEFAULT NULL,
  KEY `emailID` (`emailID`),
  CONSTRAINT `cal_ibfk_1` FOREIGN KEY (`emailID`) REFERENCES `user` (`emailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cal`
--

LOCK TABLES `cal` WRITE;
/*!40000 ALTER TABLE `cal` DISABLE KEYS */;
/*!40000 ALTER TABLE `cal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leav`
--

DROP TABLE IF EXISTS `leav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leav` (
  `stdate` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `emailID` varchar(60) NOT NULL,
  PRIMARY KEY (`emailID`),
  CONSTRAINT `leav_ibfk_1` FOREIGN KEY (`emailID`) REFERENCES `user` (`emailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav`
--

LOCK TABLES `leav` WRITE;
/*!40000 ALTER TABLE `leav` DISABLE KEYS */;
/*!40000 ALTER TABLE `leav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `emailID` varchar(60) NOT NULL,
  `dob` date DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `phno` mediumtext,
  `fname` varchar(30) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('chandanskanda2@gmail.com','2018-03-19','CSE','7585222214','chandan','abcd');
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

-- Dump completed on 2018-04-01 16:49:54
