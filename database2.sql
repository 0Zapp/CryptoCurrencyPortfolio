-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: portfolio
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add currency',7,'add_currency'),(26,'Can change currency',7,'change_currency'),(27,'Can delete currency',7,'delete_currency'),(28,'Can view currency',7,'view_currency'),(29,'Can add transaction',8,'add_transaction'),(30,'Can change transaction',8,'change_transaction'),(31,'Can delete transaction',8,'delete_transaction'),(32,'Can view transaction',8,'view_transaction');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$APUhxsPocR30$TvgFiXN2YurQAWlMFQvu9RLLScyS7tIibXhBEOr3Daw=','2021-02-16 14:37:03.987822',1,'admin','','','admin@admin.admin',1,1,'2021-01-02 15:24:50.070936'),(2,'pbkdf2_sha256$216000$Be4e1Zlr0apQ$QgqXzSch220j3cTjtopT4GqPG+ysE+9ztM3+7rHqrOc=','2021-01-04 15:10:16.428798',0,'user','','','',0,1,'2021-01-02 15:41:05.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-01-02 15:41:06.123993','2','user',1,'[{\"added\": {}}]',4,1),(2,'2021-01-02 15:41:13.284305','2','user',2,'[]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'portfolio','currency'),(8,'portfolio','transaction'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-01-02 15:24:09.407325'),(2,'auth','0001_initial','2021-01-02 15:24:09.940326'),(3,'admin','0001_initial','2021-01-02 15:24:13.051722'),(4,'admin','0002_logentry_remove_auto_add','2021-01-02 15:24:14.170661'),(5,'admin','0003_logentry_add_action_flag_choices','2021-01-02 15:24:14.213688'),(6,'contenttypes','0002_remove_content_type_name','2021-01-02 15:24:16.080326'),(7,'auth','0002_alter_permission_name_max_length','2021-01-02 15:24:16.319326'),(8,'auth','0003_alter_user_email_max_length','2021-01-02 15:24:16.474326'),(9,'auth','0004_alter_user_username_opts','2021-01-02 15:24:16.491327'),(10,'auth','0005_alter_user_last_login_null','2021-01-02 15:24:16.768551'),(11,'auth','0006_require_contenttypes_0002','2021-01-02 15:24:16.773305'),(12,'auth','0007_alter_validators_add_error_messages','2021-01-02 15:24:16.784313'),(13,'auth','0008_alter_user_username_max_length','2021-01-02 15:24:17.053324'),(14,'auth','0009_alter_user_last_name_max_length','2021-01-02 15:24:17.249317'),(15,'auth','0010_alter_group_name_max_length','2021-01-02 15:24:17.315309'),(16,'auth','0011_update_proxy_permissions','2021-01-02 15:24:17.349327'),(17,'auth','0012_alter_user_first_name_max_length','2021-01-02 15:24:17.619326'),(18,'portfolio','0001_initial','2021-01-02 15:24:18.117647'),(19,'sessions','0001_initial','2021-01-02 15:24:18.458448');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5p2jb1qfegrgrx5xnsygaopxk0crjuop','.eJxVjMsOwiAQRf-FtSFAysule7-BDMyMVA0kpV0Z_12bdKHbe865L5FgW2vaBi1pRnEWWpx-twzlQW0HeId267L0ti5zlrsiDzrktSM9L4f7d1Bh1G9tuRjlfEC23pps2JkAjI4tA2ujPEdQcTI8QbHek46oFORATBQmF8T7A-waOEk:1kwRWU:BUMFfFoEYWJUARy0s2wzsUN_P5ELQAh4CSe8gXuenlE','2021-01-18 15:11:54.624131'),('8yrpfdk5z4j07ahvjuvtglj4596l8d57','.eJxVjMsOwiAQRf-FtSFAysule7-BDMyMVA0kpV0Z_12bdKHbe865L5FgW2vaBi1pRnEWWpx-twzlQW0HeId267L0ti5zlrsiDzrktSM9L4f7d1Bh1G9tuRjlfEC23pps2JkAjI4tA2ujPEdQcTI8QbHek46oFORATBQmF8T7A-waOEk:1lC1TM:YntLs_XFZLxQlxMlapxD5d66cMxRGnl2Obc5P7-QAN8','2021-03-02 14:37:04.024796');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_currency`
--

DROP TABLE IF EXISTS `portfolio_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_currency`
--

LOCK TABLES `portfolio_currency` WRITE;
/*!40000 ALTER TABLE `portfolio_currency` DISABLE KEYS */;
INSERT INTO `portfolio_currency` VALUES (1,'Ethereum','Ethereum is a decentralized, open-source blockchain featuring smart contract functionality. Ether (ETH) is the native cryptocurrency of the platform. It is the second-largest cryptocurrency by market capitalization, after Bitcoin.[1] Ethereum is the most actively used blockchain in the world.\r\n\r\nEthereum was proposed in 2013 by programmer Vitalik Buterin. Development was crowdfunded in 2014, and the network went live on 30 July 2015, with 72 million coins premined.[4][5] The Ethereum Virtual Machine (EVM) can execute Turing-complete scripts and run decentralized applications.[6] Ethereum is used for decentralized finance, and has been utilized for many initial coin offerings.\r\n\r\nIn 2016, a hacker exploited a flaw in a third-party project called The DAO and stole $50 million of Ether.[7] As a result, the Ethereum community voted to hard fork the blockchain to reverse the theft[8] and Ethereum Classic (ETC) continued as the original chain.[9]\r\n\r\nEthereum is currently planning to implement a series of upgrades called Ethereum 2.0, which includes a transition to proof of stake and an increase in transaction throughput using sharding','2021-01-02 15:26:08','2021-01-04 15:09:06'),(2,'Ripple','Ripple is a real-time gross settlement system, currency exchange and remittance network created by Ripple Labs Inc., a US-based technology company. Released in 2012, Ripple is built upon a distributed open source protocol, and supports tokens representing fiat currency, cryptocurrency, commodities, or other units of value such as frequent flier miles or mobile minutes.[2] Ripple purports to enable \"secure, instantly and nearly free global financial transactions of any size with no chargebacks.\" The ledger employs the native cryptocurrency known as XRP.','2021-01-02 15:26:34','2021-01-02 15:26:34'),(3,'Litecoin','Litecoin (LTC or Ł) is a peer-to-peer cryptocurrency and open-source software project released under the MIT/X11 license. Litecoin was an early bitcoin spinoff of altcoin, starting in October 2011.[2] In technical details, Litecoin is nearly identical to Bitcoi','2021-01-02 15:26:52','2021-01-02 15:26:52'),(4,'Tether','Tether is a controversial[1] cryptocurrency with tokens issued by Tether Limited.[2] It formerly claimed that each token was backed by one United States dollar, but on 14 March 2019 changed the backing to include loans to affiliate companies.[3][4] The Bitfinex exchange was accused by the New York Attorney General of using Tether\'s funds to cover up $850 million in funds missing since mid-2018.[5][6]\r\n\r\nTether is called a stablecoin because it was originally designed to always be worth $1.00, maintaining $1.00 in reserves for each tether issued.[7] Nevertheless, Tether Limited states that owners of tethers have no contractual right, other legal claims, or guarantee that tethers will be redeemed or exchanged for dollars.[4] On 30 April 2019 Tether Limited\'s lawyer claimed that each tether was backed by only $0.74 in cash and cash equivalents.[8][9]\r\n\r\nTether Limited and the tether cryptocurrency are controversial because of the company\'s alleged role in manipulating the price of bitcoin,[10] an unclear relationship with the Bitfinex exchange, its apparent lack of a long-term banking relationship[11], and the company’s failure to provide a promised audit showing adequate reserves backing the Tether token.[12][2] Author David Gerard was quoted by the Wall Street Journal saying that Tether \"is sort of the central bank of crypto trading ... [yet] they don\'t conduct themselves like you\'d expect a responsible, sensible financial institution to do.\"[11] Tether\'s price decreased to lows of $0.90 on 15 October 2018 on speculation that investors are losing faith in the token.[13] On 20 November 2018, Bloomberg reported that U.S. federal prosecutors are investigating whether Tether was used to manipulate the price of bitcoin.[1] In 2019, Tether surpassed Bitcoin in trading volume with the highest daily and monthly trading volume of any cryptocurrency on the market.','2021-01-02 15:27:11','2021-01-02 15:27:11'),(5,'Bitcoin Cash','Bitcoin Cash is a cryptocurrency that is a fork of Bitcoin.[5][6] Bitcoin Cash is a spin-off or altcoin that was created in 2017.[7][8][5]\r\n\r\nTwo subsequent chain splits of Bitcoin Cash have occurred after the original 2017 split from Bitcoin. In 2018, Bitcoin Cash split into two cryptocurrencies: Bitcoin Cash and Bitcoin SV.[9]\r\n\r\nBitcoin Cash is sometimes also referred to as Bcash.','2021-01-02 15:27:38','2021-01-02 15:27:38'),(6,'Libra','A cryptocurrency created by Facebook that is backed by real-world assets (a basket of bank deposits and short-term government securities). Libra is managed by a non-profit organization regulated by the Swiss financial authority known as the Libra Association; consisting of Facebook, Calibra (a subsidiary of Facebook), and 27 other companies.','2021-01-02 15:28:13','2021-01-02 15:28:13'),(7,'Monero','Monero (/məˈnɛroʊ/; XMR) is a privacy-focused cryptocurrency released in 2014. It is an open-source protocol based on CryptoNote. It uses an obfuscated public ledger, meaning anyone can send or broadcast transactions, but no outside observer can tell the source, amount, or destination.[1] A proof of work mechanism is used to issue new coins and incentivize miners to secure the network and validate transactions.\r\n\r\nMonero uses different privacy-enhancing technologies to achieve anonymity and fungibility. It has attracted users desiring privacy measures that are not provided in more popular cryptocurrencies. However, it has also gained publicity for illicit use in darknet markets.','2021-01-02 15:28:32','2021-01-02 15:28:32'),(8,'EOS','EOS is a blockchain-based public infrastructure ecosystem offering a platform for the creation of decentralized applications (dApps). It is designed to be scalable and flexible, as well being highly usable through web tool kits, self describing interfaces, and database schemes.','2021-01-02 15:29:10','2021-01-02 15:29:10'),(9,'Bitcoin SV','Bitcoin is a peer to peer electronic cash system created by Dr. Craig Wright under the pseudonym Satoshi Nakamoto. It was first detailed in the Bitcoin Whitepaper in October 2008, and the source code was released in January 2009. The Bitcoin ledger and Block chain were established with the generation of the Genesis block on the 3rd of January 2009 and the mining of Block 1 six days later on the 9th of January 2009.\r\n\r\nBitcoin allows electronic payments to be sent directly from one party to another, without requiring a central institution or server to process transactions and/or store funds.\r\n\r\nThe leaderless structure of the network is viewed as a resolution to The Byzantine Generals Problem allowing disconnected entities to follow a common direction without centralised instruction. This solves several issues previously seen as unsolvable in distributed networks, including the problem of preventing Double-spending of coins.','2021-01-02 15:29:38','2021-01-02 15:29:38'),(10,'Binance Coin','Binance is a cryptocurrency exchange that provides a platform for trading various cryptocurrencies. As of January 2018, Binance was the largest cryptocurrency exchange in the world in terms of trading volume.\r\n\r\nBinance was founded by Changpeng Zhao, a developer who had previously created high frequency trading software. Binance was initially based in China, but later moved out of China due China\'s increasing regulation of cryptocurrency.','2021-01-02 15:30:00','2021-01-02 15:30:00'),(11,'asdasd','dgdfgdfg','2021-01-04 15:08:52','2021-01-04 15:08:52');
/*!40000 ALTER TABLE `portfolio_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_transaction`
--

DROP TABLE IF EXISTS `portfolio_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adressFrom` varchar(300) NOT NULL,
  `amount` int NOT NULL,
  `adressTo` varchar(300) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `currency_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_transactio_currency_id_bf5dde81_fk_portfolio` (`currency_id`),
  CONSTRAINT `portfolio_transactio_currency_id_bf5dde81_fk_portfolio` FOREIGN KEY (`currency_id`) REFERENCES `portfolio_currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_transaction`
--

LOCK TABLES `portfolio_transaction` WRITE;
/*!40000 ALTER TABLE `portfolio_transaction` DISABLE KEYS */;
INSERT INTO `portfolio_transaction` VALUES (1,'000DDA61B4353655E547D1070830B25A',98,'000847C47179555984CE33B10EF7AC9A','2021-01-02 15:31:41','2021-01-02 15:31:41',1),(2,'000C27F9965530C4E92DD4110EAEB50A',64,'000C2BCADD55D1D8751089AF14DCF29A','2021-01-02 15:32:15','2021-01-02 15:32:15',1),(3,'000D489E559C8CE86301C70DD10648CA',26,'000C9CD42AA5563FA51B110C3D25C25A','2021-01-02 15:32:42','2021-01-02 15:32:42',1),(4,'000F7B4C4FF554E94DF610D945848E6A',31,'00015CCC1559424B32105A63D2B64D8A','2021-01-02 15:32:57','2021-01-02 15:32:57',2),(5,'0009A887E43A8955DA62C182D104A86A',73,'000FF6B039D55558DCEA7101CE430DDA','2021-01-02 15:33:11','2021-01-02 15:33:11',2),(6,'00007E2EB4C550CF9ADBCBE1064FCCCA',75,'000E96B44E7755E3579F10266A97A0AA','2021-01-02 15:33:26','2021-01-02 15:33:26',2),(7,'00016073F505500810A1091A2920C13A',14,'000F7EDFB0475529A9EF310140F0C6DA','2021-01-02 15:33:42','2021-01-02 15:33:42',3),(8,'000719B0D7955F431FA102BEEEDDA14A',33,'000E3F67A5155E0277455710E35C32FA','2021-01-02 15:33:55','2021-01-02 15:33:55',3),(9,'000D7702255F0904B310D4182640FE6A',93,'000D31CA8A5755CE82B932761069181A','2021-01-02 15:34:15','2021-01-02 15:34:15',3),(10,'000188716A559CB0B2B238104C64AE1A',73,'000590F9B0555580227CE10CF86AC79A','2021-01-02 15:34:31','2021-01-02 15:34:31',4),(11,'000E1D7A65B3E553747F0100D3194B2A',15,'00094D73316C5596697678D10AC3938A','2021-01-02 15:34:45','2021-01-02 15:34:45',4),(12,'00085DEC905EA55B305110C11538E09A',87,'00073AE557123D3544DA5610614A32AA','2021-01-02 15:34:57','2021-01-02 15:34:57',4),(13,'0008265F74855FFA11F7104A60C57EAA',97,'000AC5F5692559B30A4910D31114EE1A','2021-01-02 15:35:11','2021-01-02 15:35:11',5),(14,'000B8FA2555C55DDCB8A5E3102A5D0AA',36,'000DE5ADAA155A799D7EC410DEEE4B9A','2021-01-02 15:35:23','2021-01-02 15:35:23',5),(15,'0008A8279D2D554471D63F61078AA26A',65,'00090B7AA1C455DC1DB104CFA26CDC1A','2021-01-02 15:35:37','2021-01-02 15:35:37',5),(16,'000B5788755F93C1986A8E9710E6AF9A',6,'000A3C4E12B557D52BDA7BA61074A58A','2021-01-02 15:35:52','2021-01-02 15:35:52',6),(17,'000E2736E552A14331D4E10AEEEFD91A',57,'0000066C5C5522395A5108D84861CE6A','2021-01-02 15:36:07','2021-01-02 15:36:07',6),(18,'0004654A79355BF1BF1104A69E00251A',60,'000D7AF9559AC65B1CD102EA039EE3DA','2021-01-02 15:36:19','2021-01-02 15:36:19',6),(19,'000092BF53F1552AF0F1012E377117BA',54,'00026DA95519FF5E4193E510CA4334EA','2021-01-02 15:36:35','2021-01-02 15:36:35',7),(20,'00039159555EEDD94107B3AD1C9092CA',11,'000916E043C55A23471FE10329A06D2A','2021-01-02 15:36:49','2021-01-02 15:36:49',7),(21,'0009F99E6E88556385676B11091C94AA',86,'000C3A6558C467820B10AB074281AC6A','2021-01-02 15:37:02','2021-01-02 15:37:02',7),(22,'0008128E0C0CA55948000D3510CC355A',25,'0008128E0C0CA55948000D3510CC355A','2021-01-02 15:37:15','2021-01-02 15:37:15',8),(23,'0006B1962555741FE09D1072A5FC6D6A',6,'00052302435513B629A810A9F895E0CA','2021-01-02 15:37:34','2021-01-02 15:37:34',8),(24,'000699D5C40A4555A5E6910F333142BA',81,'0009E17556AB461DC1109A94AE73BDDA','2021-01-02 15:37:49','2021-01-02 15:37:49',8),(25,'000A48ECCF555147D282D10A5A5DF73A',76,'000BFDD00AD557818FB9110BFA34271A','2021-01-02 15:38:06','2021-01-02 15:38:06',9),(26,'0004D24F28556233E9E8E81046B70FEA',16,'00032A7855E02271FBDDE2421076A50A','2021-01-02 15:38:19','2021-01-02 15:38:19',9),(27,'0007E09558D805CC5A510915F5BBA52A',46,'000145C45501CF2EA92410178E0D09EA','2021-01-02 15:38:34','2021-01-02 15:38:34',9),(28,'000B314E2E6CA1B55A803679100A44FA',90,'000A71FE4C550E0502731051DBBA31EA','2021-01-02 15:38:50','2021-01-02 15:38:50',10),(29,'00007234F91559A92C2292E910AECF1A',92,'00022DF7CE171F1556E5FF010E30824A','2021-01-02 15:39:03','2021-01-02 15:39:03',10),(30,'0002FC3BEDD06755ECAB103DFB260A7A',45,'000E7ECF315596D3F1810E6E7F7E597A','2021-01-02 15:39:16','2021-01-02 15:39:16',10),(31,'jfghrty',12,'rutrtyutyu','2021-01-04 15:09:35','2021-01-04 15:09:35',1),(32,'fsdeghd',123,'ergerg','2021-02-16 17:22:21','2021-02-16 17:22:21',4),(33,'sdgsd',12,'sdfsd','2021-02-16 16:22:45','2021-02-16 16:22:45',1),(34,'sdfsfd',12,'dsfsd','2021-02-16 16:22:57','2021-02-16 16:22:57',11),(35,'dfgd',123,'dfgd','2021-02-16 17:35:13','2021-02-16 17:35:13',11),(36,'grsherghe',23,'fgfdg','2021-02-16 16:53:38','2021-02-16 16:53:38',4),(37,'4bf50abd3cfd3e360e6cd304c5ff4e60',68,'8138389c0aadaecce32a8d37ffe9b645','2021-02-16 20:47:08','2021-02-16 20:47:08',1),(38,'a1be5fb8699b71406124dbf08e4a1208',896,'6c19f6444073c99356f3f591cc2942be','2021-02-16 20:47:37','2021-02-16 20:47:37',1),(39,'c7f1aec1a949ea6231ee26d5766b8fae',317,'b82a34a6bb59d37f93c5dce93a3b1083','2021-02-16 20:47:57','2021-02-16 20:47:57',1),(40,'0a903eda5ba6d4214ffa08905f58ae93',986,'be97ed4a919213f176f8d275569b003a','2021-02-16 20:48:20','2021-02-16 20:48:20',1),(41,'72c5e998c898e6e7d57b124b6fe26e82',479,'442b798f47b73311f786f1179ef5d59b','2021-02-16 20:48:52','2021-02-16 20:48:52',1),(42,'72c5e998c898e6e7d57b124b6fe26e82',996,'442b798f47b73311f786f1179ef5d59b','2021-02-16 20:49:20','2021-02-16 20:49:20',1),(43,'a853ea9490a9ac7634ed838d2a07edcd',48,'c4966a09855d3ee5e826d6f2709de35f','2021-02-16 20:49:43','2021-02-16 20:49:43',1),(44,'a853ea9490a9ac7634ed838d2a07edcd',781,'34f181375ed64933bc24dddb39a6ed78','2021-02-16 20:50:03','2021-02-16 20:50:03',1),(45,'0a12e558f8a73d4ec7f2a93a4e453c00',298,'7022781eb4753126834686a57c288a65','2021-02-16 20:50:21','2021-02-16 20:50:21',1),(46,'af013a54011f53a2fd8f0c318778e72f',350,'ba7b14a48e8184a2b4669e3061aa337a','2021-02-16 20:50:38','2021-02-16 20:50:38',1),(47,'af013a54011f53a2fd8f0c318778e72f',300,'ba7b14a48e8184a2b4669e3061aa337a','2021-02-16 20:51:06','2021-02-16 20:51:06',2),(48,'af013a54011f53a2fd8f0c318778e72f',435,'2fc7156fd01888655e547c854cad7f7f','2021-02-16 20:51:31','2021-02-16 20:51:31',2),(49,'bbe0a616d36d9eafa81b7e3f09e94aa6',525,'855e7a91ddf18d859e73e30dd1f346b7','2021-02-16 20:51:48','2021-02-16 20:51:48',2),(50,'5bd813496e936ea734948b96ce217ed9',430,'3318e65a7e86fc0b8c23cf471acd78cf','2021-02-16 20:52:19','2021-02-16 20:52:19',3),(51,'64581bbb9ee6dd645b126530c12acedd',123,'5bd813496e936ea734948b96ce217ed9','2021-02-16 20:52:45','2021-02-16 20:52:45',3),(52,'8dfd3b19a448e9f356abb6fa141eb40d',332,'6bb598d0660d4618beed261fd153a9a0','2021-02-16 20:53:11','2021-02-16 20:53:11',5),(53,'dssdgshgshjfdgjfjdfgh',223,'312543263g342g34g5fd32243h4','2021-02-16 22:00:47','2021-02-16 22:00:47',2);
/*!40000 ALTER TABLE `portfolio_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-16 22:02:04
