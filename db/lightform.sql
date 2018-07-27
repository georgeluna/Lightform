CREATE DATABASE  IF NOT EXISTS `lightform` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lightform`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lightform
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `device_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `access` int(1) DEFAULT '0',
  PRIMARY KEY (`device_id`,`user_id`),
  KEY `FK_ASG_USR_ID_idx` (`user_id`),
  KEY `FK_ASG_ORG_ID_idx` (`org_id`),
  CONSTRAINT `FK_ASN_DEV_ID` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ASN_ORG_ID` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ASN_USR_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This is the associative table that will hold all of the users that are allowed access to a device.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (4,5,1,0);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique, auto-incrementing ID that is assigned to a device once it is entered into this system.',
  `hostname` varchar(255) NOT NULL COMMENT 'This column represents the hostname of the presumably IP-enabled device as it would appear within a local network.\n\nNow initially I wanted to add a uniqueness constraint, but it''s very possible that devices across multiple organizations can have the same hostname.',
  `org_id` int(11) NOT NULL COMMENT 'This is the ID of the organization that this device pertains to. We assume that all devices will pertain to one and only one organization.',
  `model` varchar(255) DEFAULT NULL COMMENT 'This column will hold the Lightform model name/number that pertains to this device.',
  `serial` varchar(255) DEFAULT NULL COMMENT 'This column will hold the serial number for this device.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_UNIQUE` (`serial`),
  KEY `FK_ORG_ID_idx` (`org_id`),
  CONSTRAINT `FK_DEV_ORG_ID` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='This table will hold all of the devices that exist within our service.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'ORGDEV1',1,'LF1','LF1DXC16V3A'),(3,'ORGDEV2',1,'LF1','LF1DXC22D4C'),(4,'ORGDEV3',1,'LF1','LF1DXC22AVX'),(5,'ORGDEV4',1,'LF1','LF1DXC2VCCD'),(6,'ORGDEV5',1,'LF1','LF1DXC21221'),(7,'ORGDEV6',1,'LF1','LF1DXC21222'),(8,'ORGDEV7',1,'LF1','LF1DXC21234'),(9,'ORGDEV8',1,'LF1','LF1DXC21235');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'This is the unique, auto-incrementing ID that is assigned to an organization.',
  `name` varchar(255) NOT NULL COMMENT 'This is the name of the organization.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='This table will hold all of the organizations that will use this service. You can also think of them as customers.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'Lightform'),(2,'Google'),(3,'Facebook'),(4,'George Luna');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT 'User name that the user might use to log into the system.',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last name of the user.',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First name of the user.',
  `org_id` int(11) NOT NULL,
  `access` int(1) NOT NULL DEFAULT '0' COMMENT 'This represents the access level that this user has within its organization.\n\n0 - Owner\n1 - Administrator\n2 - Standard User',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `org_id_idx` (`org_id`),
  CONSTRAINT `FK_USR_ORG_ID` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='This table will hold all of the users that will use our service. It is optional that they be associated with an organization, but, at the moment, in order to be able to use a device they MUST correspond to one.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'georgeluna','Luna','George',4,0),(2,'bobert','Robertson','Curtis',4,1),(3,'heyyou','WORLD','HELLO',4,2),(4,'zuckerm','Zuckerberg','Mark',3,0),(5,'lorem','Ipsum','Lorem',1,0);
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

-- Dump completed on 2018-07-27  5:10:38
