CREATE DATABASE  IF NOT EXISTS `portfoliodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `portfoliodb`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: portfoliodb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `transakcije`
--

DROP TABLE IF EXISTS `transakcije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transakcije` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adressFrom` varchar(45) NOT NULL,
  `adressTo` varchar(45) NOT NULL,
  `ammount` float NOT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `valutaId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_valute_id_idx` (`valutaId`),
  CONSTRAINT `fk_valute_id` FOREIGN KEY (`valutaId`) REFERENCES `valute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transakcije`
--

LOCK TABLES `transakcije` WRITE;
/*!40000 ALTER TABLE `transakcije` DISABLE KEYS */;
INSERT INTO `transakcije` VALUES (1,'hfhdhdfhdhd','sdgsdgsgsg',10,'2019-10-20 10:15:08',1),(2,'gdgddggd','qqqqqq',43.2,'2019-10-20 10:15:08',1);
/*!40000 ALTER TABLE `transakcije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valute`
--

DROP TABLE IF EXISTS `valute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `tracer` varchar(10) NOT NULL,
  `opis` varchar(1024) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valute`
--

LOCK TABLES `valute` WRITE;
/*!40000 ALTER TABLE `valute` DISABLE KEYS */;
INSERT INTO `valute` VALUES (1,'Bitcoin','BTC','Bitkoin je digitalna i globalna valuta. Stvorena je 2009. godine od strane lica ili grupe ljudi pod pseudonimom Satoši Nakamoto.','2019-10-20 10:15:08'),(2,'Etherium','ETC','Ethereum is a decentralized, open-source blockchain featuring smart contract functionality.','2019-10-20 10:15:08'),(3,'Dogecoin','DOGE','Dogecoin (/ˈdoʊdʒkɔɪn/ DOHJ-koyn,[1] code: DOGE, symbol: Ð) is a cryptocurrency invented by software engineers Billy Markus and Jackson Palmer, who decided to create a payment system that is instant, fun, and free from traditional banking fees.','2019-10-20 10:15:08');
/*!40000 ALTER TABLE `valute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-16 10:31:38
