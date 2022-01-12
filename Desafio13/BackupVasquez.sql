CREATE DATABASE  IF NOT EXISTS `colegio_pablo_neruda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `colegio_pablo_neruda`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: colegio_pablo_neruda
-- ------------------------------------------------------
-- Server version	8.0.27

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

-- Backup de la tabla FACTMENSUALIDAD
-- Dumping data for table `factmensualidad`
--

LOCK TABLES `factmensualidad` WRITE;
/*!40000 ALTER TABLE `factmensualidad` DISABLE KEYS */;
INSERT INTO `factmensualidad` VALUES (1,1,'2021-11-05',2021,'Noviembre',20000.00,'Efectivo',1),(2,2,'2021-11-06',2021,'Noviembre',20000.00,'Efectivo',1),(3,3,'2021-11-07',2021,'Noviembre',20000.00,'Efectivo',1),(4,4,'2021-11-08',2021,'Noviembre',20000.00,'Efectivo',1),(5,5,'2021-11-09',2021,'Noviembre',19000.00,'Efectivo',1),(6,6,'2021-11-10',2021,'Noviembre',20000.00,'Efectivo',1),(7,7,'2021-11-11',2021,'Noviembre',20000.00,'Efectivo',1),(8,8,'2021-11-12',2021,'Noviembre',20000.00,'Efectivo',1),(9,9,'2021-11-13',2021,'Noviembre',20000.00,'Efectivo',1),(10,10,'2021-11-14',2021,'Noviembre',20000.00,'Efectivo',1),(11,11,'2021-11-15',2021,'Noviembre',20000.00,'Efectivo',1),(12,12,'2021-11-16',2021,'Noviembre',18000.00,'Efectivo',1),(13,13,'2021-11-17',2021,'Noviembre',20000.00,'Tarjeta ',1),(14,14,'2021-11-18',2021,'Noviembre',20000.00,'Tarjeta ',1),(15,15,'2021-11-19',2021,'Noviembre',20000.00,'Tarjeta ',1),(16,16,'2021-11-20',2021,'Noviembre',20000.00,'Tarjeta ',1),(17,17,'2021-11-21',2021,'Noviembre',20000.00,'Tarjeta ',1),(18,18,'2021-11-22',2021,'Noviembre',20000.00,'Tarjeta ',1),(19,19,'2021-11-23',2021,'Noviembre',20000.00,'Tarjeta ',1),(20,20,'2021-11-24',2021,'Noviembre',20000.00,'Tarjeta ',1),(21,21,'2021-11-25',2021,'Noviembre',20000.00,'Tarjeta ',1),(22,22,'2021-11-26',2021,'Noviembre',20000.00,'Tarjeta ',1),(23,23,'2021-11-27',2021,'Noviembre',20000.00,'Tarjeta ',1),(24,24,'2021-11-28',2021,'Noviembre',20000.00,'Tarjeta ',1),(25,25,'2021-11-29',2021,'Noviembre',20000.00,'Tarjeta ',1),(26,26,'2021-11-30',2021,'Noviembre',20000.00,'Tarjeta ',1),(27,27,'2021-12-01',2021,'Diciembre',20000.00,'Tarjeta ',1),(28,28,'2021-12-02',2021,'Diciembre',20000.00,'Tarjeta ',1),(29,29,'2021-12-03',2021,'Diciembre',20000.00,'Tarjeta ',1),(30,30,'2021-12-04',2021,'Diciembre',20000.00,'Tarjeta ',1),(31,31,'2021-12-05',2021,'Diciembre',20000.00,'Tarjeta ',1),(32,32,'2021-12-06',2021,'Diciembre',20000.00,'Tarjeta ',1),(33,33,'2021-12-07',2021,'Diciembre',20000.00,'Tarjeta ',1),(34,34,'2021-12-08',2021,'Diciembre',20000.00,'Tarjeta ',1),(35,35,'2021-12-09',2021,'Diciembre',20000.00,'Tarjeta ',1),(36,36,'2021-12-10',2021,'Diciembre',20000.00,'Tarjeta ',1),(37,37,'2021-12-11',2021,'Diciembre',20000.00,'Tarjeta ',1),(38,38,'2021-12-12',2021,'Diciembre',20000.00,'Tarjeta ',1),(39,39,'2021-12-13',2021,'Diciembre',20000.00,'Tarjeta ',1),(40,40,'2021-12-14',2021,'Diciembre',30000.00,'Tarjeta ',1),(41,41,'2021-12-15',2021,'Diciembre',20000.00,'Tarjeta ',1),(42,42,'2021-12-16',2021,'Diciembre',20000.00,'Tarjeta ',1),(43,43,'2021-12-17',2021,'Diciembre',20000.00,'Tarjeta ',1),(44,44,'2021-12-18',2021,'Diciembre',20000.00,'Tarjeta ',1),(45,45,'2021-12-19',2021,'Diciembre',20000.00,'Tarjeta ',1),(46,46,'2021-12-20',2021,'Diciembre',15000.00,'Tarjeta ',1),(47,47,'2021-12-21',2021,'Diciembre',20000.00,'Tarjeta ',1),(48,48,'2021-12-22',2021,'Diciembre',20000.00,'Tarjeta ',1),(49,49,'2021-12-23',2021,'Diciembre',20000.00,'Tarjeta ',1),(50,50,'2021-12-24',2021,'Diciembre',0.00,'',0),(51,5,'2021-12-16',2021,'Noviembre',1000.00,'Efectivo',1);
/*!40000 ALTER TABLE `factmensualidad` ENABLE KEYS */;
UNLOCK TABLES;

-- Backup de la tabla FACTNOMINA
-- Dumping data for table `factnomina`
--

LOCK TABLES `factnomina` WRITE;
/*!40000 ALTER TABLE `factnomina` DISABLE KEYS */;
INSERT INTO `factnomina` VALUES (1,1,65000.00,'2021-11-05',2021,'Noviembre',88888888889,'Galicia'),(2,2,83500.45,'2021-11-05',2021,'Noviembre',77777777779,'Santander'),(3,3,48510.00,'2021-11-05',2021,'Noviembre',66666666669,'HSBC'),(4,4,48510.01,'2021-11-05',2021,'Noviembre',55555555559,'ICBC'),(5,5,53299.86,'2021-11-05',2021,'Noviembre',11111111119,'Macro'),(6,6,58700.00,'2021-11-05',2021,'Noviembre',33333333339,'Patagonia'),(7,7,58700.00,'2021-11-05',2021,'Noviembre',44444444449,'HSBC'),(8,8,68700.00,'2021-11-05',2021,'Noviembre',22222222229,'Santander'),(9,9,135500.00,'2021-11-05',2021,'Noviembre',99999999999,'Santander'),(10,10,135500.00,'2021-11-05',2021,'Noviembre',12121212129,'Galicia'),(11,11,71050.00,'2021-11-05',2021,'Noviembre',23232323239,'Macro'),(12,12,88600.00,'2021-11-05',2021,'Noviembre',34343434349,'BBVA'),(13,13,53000.00,'2021-11-05',2021,'Noviembre',56565656569,'BBVA'),(14,14,81000.00,'2021-11-05',2021,'Noviembre',76767676679,'Naranja'),(15,1,65000.00,'2021-12-05',2021,'Diciembre',88888888889,'Galicia'),(16,2,83500.45,'2021-12-05',2021,'Diciembre',77777777779,'Santander'),(17,3,48510.00,'2021-12-05',2021,'Diciembre',66666666669,'HSBC'),(18,4,48510.01,'2021-12-05',2021,'Diciembre',55555555559,'ICBC'),(19,5,53299.86,'2021-12-05',2021,'Diciembre',11111111119,'Macro'),(20,6,58700.00,'2021-12-05',2021,'Diciembre',33333333339,'Patagonia'),(21,7,58700.00,'2021-12-05',2021,'Diciembre',44444444449,'HSBC'),(22,8,68700.00,'2021-12-05',2021,'Diciembre',22222222229,'Santander'),(23,9,135500.00,'2021-12-05',2021,'Diciembre',99999999999,'Santander'),(24,10,135500.00,'2021-12-05',2021,'Diciembre',12121212129,'Galicia'),(25,11,71050.00,'2021-12-05',2021,'Diciembre',23232323239,'Macro'),(26,12,88600.00,'2021-12-05',2021,'Diciembre',34343434349,'BBVA'),(27,13,53000.00,'2021-12-05',2021,'Diciembre',56565656569,'BBVA'),(28,14,81000.00,'2021-12-05',2021,'Diciembre',76767676679,'Naranja'),(29,13,53000.00,'2021-10-05',2021,'Octubre',56565656569,'Galicia');
/*!40000 ALTER TABLE `factnomina` ENABLE KEYS */;
UNLOCK TABLES;

-- Backup de la tabla FACTREGISTRONOTAS
-- Dumping data for table `factregistronotas`
--

LOCK TABLES `factregistronotas` WRITE;
/*!40000 ALTER TABLE `factregistronotas` DISABLE KEYS */;
INSERT INTO `factregistronotas` VALUES (1,2021,1,1,1,10),(2,2021,1,2,1,10),(3,2021,1,3,1,9),(4,2021,1,4,1,7),(5,2021,1,5,1,10),(6,2021,1,6,1,8),(7,2021,1,7,1,10),(8,2021,1,8,1,6),(9,2021,1,9,1,10),(10,2021,2,1,1,10),(11,2021,2,2,1,9),(12,2021,2,3,1,7),(13,2021,2,4,1,10),(14,2021,2,5,1,8),(15,2021,2,6,1,10),(16,2021,2,7,1,10),(17,2021,2,8,1,10),(18,2021,2,9,1,9),(19,2021,3,1,1,7),(20,2021,3,2,1,10),(21,2021,3,3,1,8),(22,2021,3,4,1,10),(23,2021,3,5,1,6),(24,2021,3,6,1,10),(25,2021,3,7,1,10),(26,2021,3,8,1,9),(27,2021,3,9,1,7),(28,2021,4,1,1,10),(29,2021,4,2,1,8),(30,2021,4,3,1,10),(31,2021,4,4,1,10),(32,2021,4,5,1,10),(33,2021,4,6,1,9),(34,2021,4,7,1,7),(35,2021,4,8,1,10),(36,2021,4,9,1,8),(37,2021,5,1,1,10),(38,2021,5,2,1,6),(39,2021,5,3,1,10),(40,2021,5,4,1,10),(41,2021,5,5,1,9),(42,2021,5,6,1,7),(43,2021,5,7,1,10),(44,2021,5,8,1,8),(45,2021,5,9,1,10),(46,2021,6,1,1,10),(47,2021,6,2,1,10),(48,2021,6,3,1,9),(49,2021,6,4,1,7),(50,2021,6,5,1,10),(51,2021,6,6,1,8),(52,2021,6,7,1,10),(53,2021,6,8,1,6),(54,2021,6,9,1,10),(55,2021,7,1,1,10),(56,2021,7,2,1,9),(57,2021,7,3,1,7),(58,2021,7,4,1,10),(59,2021,7,5,1,8),(60,2021,7,6,1,10),(61,2021,7,7,1,10),(62,2021,7,8,1,10),(63,2021,7,9,1,9),(64,2021,8,1,1,7),(65,2021,8,2,1,10),(66,2021,8,3,1,8),(67,2021,8,4,1,10),(68,2021,8,5,1,6),(69,2021,8,6,1,10),(70,2021,8,7,1,10),(71,2021,8,8,1,9),(72,2021,8,9,1,7),(73,2021,9,1,1,10),(74,2021,9,2,1,8),(75,2021,9,3,1,10),(76,2021,9,4,1,7),(77,2021,9,5,1,10),(78,2021,9,6,1,8),(79,2021,9,7,1,10),(80,2021,9,8,1,6),(81,2021,9,9,1,10),(82,2021,10,1,1,10),(83,2021,10,2,1,9),(84,2021,10,3,1,7),(85,2021,10,4,1,10),(86,2021,10,5,1,8),(87,2021,10,6,1,10),(88,2021,10,7,1,10),(89,2021,10,8,1,10),(90,2021,10,9,1,9),(91,2021,11,1,1,7),(92,2021,11,2,1,10),(93,2021,11,3,1,8),(94,2021,11,4,1,10),(95,2021,11,5,1,6),(96,2021,11,6,1,10),(97,2021,11,7,1,10),(98,2021,11,8,1,9),(99,2021,11,9,1,7),(100,2021,12,1,1,10),(101,2021,12,2,1,8),(102,2021,12,3,1,10),(103,2021,12,4,1,7),(104,2021,12,5,1,10),(105,2021,12,6,1,8),(106,2021,12,7,1,10),(107,2021,12,8,1,6),(108,2021,12,9,1,10),(109,2021,13,1,1,10),(110,2021,13,2,1,9),(111,2021,13,3,1,7),(112,2021,13,4,1,10),(113,2021,13,5,1,8),(114,2021,13,6,1,10),(115,2021,13,7,1,10),(116,2021,13,8,1,10),(117,2021,13,9,1,9),(118,2021,14,1,1,7),(119,2021,14,2,1,10),(120,2021,14,3,1,8),(121,2021,14,4,1,10),(122,2021,14,5,1,6),(123,2021,14,6,1,10),(124,2021,14,7,1,10),(125,2021,14,8,1,9),(126,2021,14,9,1,7),(127,2021,15,1,1,10),(128,2021,15,2,1,8),(129,2021,15,3,1,10),(130,2021,15,4,1,7),(131,2021,15,5,1,10),(132,2021,15,6,1,8),(133,2021,15,7,1,10),(134,2021,15,8,1,6),(135,2021,15,9,1,10),(136,2021,16,1,1,10),(137,2021,16,2,1,9),(138,2021,16,3,1,7),(139,2021,16,4,1,10),(140,2021,16,5,1,8),(141,2021,16,6,1,10),(142,2021,16,7,1,10),(143,2021,16,8,1,10),(144,2021,16,9,1,9),(145,2021,17,1,1,7),(146,2021,17,2,1,10),(147,2021,17,3,1,8),(148,2021,17,4,1,10),(149,2021,17,5,1,6),(150,2021,17,6,1,10),(151,2021,17,7,1,10),(152,2021,17,8,1,9),(153,2021,17,9,1,7),(154,2021,18,1,1,10),(155,2021,18,2,1,8),(156,2021,18,3,1,10),(157,2021,18,4,1,7),(158,2021,18,5,1,10),(159,2021,18,6,1,8),(160,2021,18,7,1,10),(161,2021,18,8,1,6),(162,2021,18,9,1,10),(163,2021,19,1,1,10),(164,2021,19,2,1,9),(165,2021,19,3,1,7),(166,2021,19,4,1,10),(167,2021,19,5,1,8),(168,2021,19,6,1,10),(169,2021,19,7,1,10),(170,2021,19,8,1,10),(171,2021,19,9,1,9),(172,2021,20,1,1,7),(173,2021,20,2,1,10),(174,2021,20,3,1,8),(175,2021,20,4,1,10),(176,2021,20,5,1,6),(177,2021,20,6,1,10),(178,2021,20,7,1,10),(179,2021,20,8,1,9),(180,2021,20,9,1,7),(181,2021,21,1,1,10),(182,2021,21,2,1,8),(183,2021,21,3,1,10),(184,2021,21,4,1,7),(185,2021,21,5,1,10),(186,2021,21,6,1,8),(187,2021,21,7,1,10),(188,2021,21,8,1,6),(189,2021,21,9,1,10),(190,2021,22,1,1,10),(191,2021,22,2,1,9),(192,2021,22,3,1,7),(193,2021,22,4,1,10),(194,2021,22,5,1,8),(195,2021,22,6,1,10),(196,2021,22,7,1,10),(197,2021,22,8,1,10),(198,2021,22,9,1,9),(199,2021,23,1,1,7),(200,2021,23,2,1,10),(201,2021,23,3,1,8),(202,2021,23,4,1,10),(203,2021,23,5,1,6),(204,2021,23,6,1,10),(205,2021,23,7,1,10),(206,2021,23,8,1,9),(207,2021,23,9,1,7),(208,2021,24,1,1,10),(209,2021,24,2,1,8),(210,2021,24,3,1,10),(211,2021,24,4,1,5),(212,2021,24,5,1,3),(213,2021,24,6,1,10),(214,2021,24,7,1,6),(215,2021,24,8,1,7),(216,2021,24,9,1,8);
/*!40000 ALTER TABLE `factregistronotas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11 22:01:32
