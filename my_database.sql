-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: restaurant_management_development
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'PERU','2015-05-28 18:47:45','2015-05-28 18:47:45');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card_types`
--

DROP TABLE IF EXISTS `credit_card_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card_types`
--

LOCK TABLES `credit_card_types` WRITE;
/*!40000 ALTER TABLE `credit_card_types` DISABLE KEYS */;
INSERT INTO `credit_card_types` VALUES (1,'Visa','2015-05-28 16:25:15','2015-05-28 16:25:15','visa_logo.gif','image/gif',654,'2015-05-28 16:25:15'),(2,'MasterCard','2015-05-28 16:25:52','2015-05-28 16:25:52','mastercard_logo.gif','image/gif',1919,'2015-05-28 16:25:51'),(3,'American Express','2015-05-28 16:26:13','2015-05-28 16:26:13','american_express_logo.gif','image/gif',1648,'2015-05-28 16:26:12');
/*!40000 ALTER TABLE `credit_card_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_districts_on_province_id` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'ATE',1,'2015-05-28 18:48:07','2015-05-28 18:48:07'),(2,'LA MOLINA',1,'2015-05-28 18:48:18','2015-05-28 18:48:18'),(3,'BREÑA',1,'2015-05-28 18:48:27','2015-05-28 18:48:27'),(4,'AYACUCHO - DISTRICT 1',2,'2015-05-31 23:11:27','2015-05-31 23:11:27'),(5,'SAN MIGUEL',1,'2015-06-01 01:38:01','2015-06-01 01:38:01'),(6,'CHORRILLOS',1,'2015-06-01 01:38:19','2015-06-01 01:38:19'),(7,'CHOSICA',1,'2015-06-01 01:38:38','2015-06-01 01:38:38'),(8,'CHACLACAYO',1,'2015-06-01 01:38:56','2015-06-01 01:38:56');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_categories`
--

DROP TABLE IF EXISTS `food_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_categories`
--

LOCK TABLES `food_categories` WRITE;
/*!40000 ALTER TABLE `food_categories` DISABLE KEYS */;
INSERT INTO `food_categories` VALUES (1,'PASTAS','2015-05-28 18:53:56','2015-05-28 18:53:56'),(2,'PESCADOS Y MARISCOS','2015-05-28 18:54:08','2015-05-28 18:54:08');
/*!40000 ALTER TABLE `food_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_categories`
--

DROP TABLE IF EXISTS `item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_categories`
--

LOCK TABLES `item_categories` WRITE;
/*!40000 ALTER TABLE `item_categories` DISABLE KEYS */;
INSERT INTO `item_categories` VALUES (1,'ENTRADA','2015-05-28 18:54:21','2015-05-28 18:54:21'),(2,'SEGUNDO','2015-05-28 18:54:31','2015-05-28 18:54:31'),(3,'POSTRE','2015-05-28 18:54:40','2015-05-28 18:54:40'),(4,'REFRESCO','2015-05-28 18:54:50','2015-05-28 18:54:50');
/*!40000 ALTER TABLE `item_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_cost` decimal(19,6) DEFAULT NULL,
  `unit_price` decimal(19,6) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `food_category_id` int(11) DEFAULT NULL,
  `object_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_items_on_restaurant_id` (`restaurant_id`),
  KEY `index_items_on_item_category_id` (`item_category_id`),
  KEY `index_items_on_food_category_id` (`food_category_id`),
  KEY `index_items_on_object_type_id` (`object_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Ceviche - Rustica',1.560000,2.990000,1,1,2,2,'2015-05-30 03:28:32','2015-05-30 05:07:35','Ceviche.jpg','image/jpeg',814529,'2015-05-30 04:03:20'),(2,'Ceviche - Costa Verde',1.200000,1.500000,2,1,2,2,'2015-05-30 05:07:00','2015-05-30 05:07:00','Ceviche.jpg','image/jpeg',814529,'2015-05-30 05:06:59'),(3,'Arroz con pollo a lo Rustica',2.550000,3.500000,1,2,1,2,'2015-06-03 05:51:45','2015-06-03 05:51:45','arroz_pollo.jpg','image/jpeg',535583,'2015-06-03 05:51:44'),(4,'papa',2.000000,4.000000,1,1,2,2,'2015-06-12 23:37:20','2015-06-12 23:37:20',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_cards`
--

DROP TABLE IF EXISTS `local_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_id` int(11) DEFAULT NULL,
  `credit_card_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_local_cards_on_local_id` (`local_id`),
  KEY `index_local_cards_on_credit_card_type_id` (`credit_card_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_cards`
--

LOCK TABLES `local_cards` WRITE;
/*!40000 ALTER TABLE `local_cards` DISABLE KEYS */;
INSERT INTO `local_cards` VALUES (1,1,2,'2015-05-29 22:20:34','2015-05-29 22:20:48'),(2,1,1,'2015-05-29 22:21:00','2015-05-29 22:21:00'),(3,2,1,'2015-05-30 05:04:45','2015-05-30 05:04:45');
/*!40000 ALTER TABLE `local_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_deliveries`
--

DROP TABLE IF EXISTS `local_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `local_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_local_deliveries_on_local_id` (`local_id`),
  KEY `index_local_deliveries_on_district_id` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_deliveries`
--

LOCK TABLES `local_deliveries` WRITE;
/*!40000 ALTER TABLE `local_deliveries` DISABLE KEYS */;
INSERT INTO `local_deliveries` VALUES (2,'09:00:00','20:00:00',1,1,'2015-05-29 21:25:59','2015-05-29 21:25:59'),(3,'21:26:00','21:26:00',1,2,'2015-05-29 21:30:43','2015-05-29 21:30:43'),(4,'09:00:00','15:00:00',2,1,'2015-05-30 05:04:18','2015-05-30 05:04:18');
/*!40000 ALTER TABLE `local_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_photos`
--

DROP TABLE IF EXISTS `local_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) DEFAULT NULL,
  `local_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_local_photos_on_local_id` (`local_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_photos`
--

LOCK TABLES `local_photos` WRITE;
/*!40000 ALTER TABLE `local_photos` DISABLE KEYS */;
INSERT INTO `local_photos` VALUES (2,1,1,'2015-05-29 20:37:56','2015-05-29 20:37:56','301209-pe_24-11_rustica_fc_5-thumb.jpg','image/jpeg',134998,'2015-05-29 20:37:55'),(3,2,1,'2015-05-29 20:38:14','2015-05-29 20:38:14','301209-pe_24-11_rustica_fc_4-thumb.jpg','image/jpeg',116231,'2015-05-29 20:38:13'),(4,1,2,'2015-05-30 05:03:26','2015-05-30 05:03:26','Capitan_America.jpg','image/jpeg',21702,'2015-05-30 05:03:26');
/*!40000 ALTER TABLE `local_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locals`
--

DROP TABLE IF EXISTS `locals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `allow_delivery` tinyint(1) DEFAULT NULL,
  `allow_parking` tinyint(1) DEFAULT NULL,
  `allow_reservation` tinyint(1) DEFAULT NULL,
  `allow_credit_card` tinyint(1) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_locals_on_restaurant_id` (`restaurant_id`),
  KEY `index_locals_on_district_id` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locals`
--

LOCK TABLES `locals` WRITE;
/*!40000 ALTER TABLE `locals` DISABLE KEYS */;
INSERT INTO `locals` VALUES (1,'Rustica - Costa Verde','768766543','3423422','contacto_costa_verde@rustica.pe','reserva_costa_verde@rustica.pe','El sueño empezó con una pequeña tienda en Jesús María pero gracias a la dedicación, creatividad y empeño, hoy contamos con (42) locales en lima y alrededor de todo el país. En un inicio nos destacamos por la venta de pizzas y pastas pero con la finalidad de satisfacer a nuestros clientes hemos ampliado nuestra cartera de productos.\r\n Actualmente contamos con la “carta rustica”: pizzas, pastas y parrillas. Con el servicio de buffet criollo e internacional. Por si esto fuera poco ahora la experiencia Rustica te ofrece la posibilidad de disfrutar de los servicios de discoteca, bar, karaoke y shows en un solo lugar.',1,1,1,1,1,2,'2015-05-29 06:59:16','2015-05-29 15:03:57'),(2,'Costa Verde - Callao','876767554','5456644','contacto_callao@costaverde.pe','reserva_callao@costaverde.pe','Esta es una descripcion.',0,1,0,1,2,3,'2015-05-30 05:02:43','2015-05-30 05:02:43');
/*!40000 ALTER TABLE `locals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_date` date DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `local_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_menus_on_local_id` (`local_id`),
  KEY `index_menus_on_item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (2,'2015-05-30',40,2,2,'2015-05-30 05:12:53','2015-05-30 05:12:53'),(3,'2015-06-04',10,1,3,'2015-06-04 22:12:38','2015-06-04 22:12:38'),(4,'2015-06-04',10,1,1,'2015-06-04 22:12:57','2015-06-04 22:12:57'),(5,'2015-06-05',15,1,1,'2015-06-05 05:07:09','2015-06-05 05:07:09'),(6,'2015-06-05',6,1,3,'2015-06-05 05:14:27','2015-06-05 05:14:27'),(7,'2015-06-08',5,1,1,'2015-06-08 21:57:37','2015-06-12 20:55:05'),(8,'2015-06-08',3,1,3,'2015-06-08 21:57:50','2015-06-12 20:55:05'),(9,'2015-06-09',10,1,1,'2015-06-09 16:49:26','2015-06-09 16:49:26'),(10,'2015-06-09',5,1,3,'2015-06-09 19:18:08','2015-06-09 19:18:08'),(11,'2015-06-12',0,1,4,'2015-06-12 23:37:47','2015-06-12 23:43:44');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_types`
--

DROP TABLE IF EXISTS `object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_types`
--

LOCK TABLES `object_types` WRITE;
/*!40000 ALTER TABLE `object_types` DISABLE KEYS */;
INSERT INTO `object_types` VALUES (1,'RESTAURANT','2015-05-28 18:55:10','2015-05-28 18:55:10'),(2,'ITEM','2015-05-28 18:59:37','2015-05-28 18:59:37');
/*!40000 ALTER TABLE `object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_cards`
--

DROP TABLE IF EXISTS `order_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_card_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_cards_on_order_id` (`order_id`),
  KEY `index_order_cards_on_user_card_id` (`user_card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cards`
--

LOCK TABLES `order_cards` WRITE;
/*!40000 ALTER TABLE `order_cards` DISABLE KEYS */;
INSERT INTO `order_cards` VALUES (14,19,2,'2015-06-10 22:25:35','2015-06-10 22:25:35'),(15,20,2,'2015-06-12 04:28:03','2015-06-12 04:28:03'),(21,26,2,'2015-06-12 07:10:20','2015-06-12 07:10:20'),(22,27,2,'2015-06-12 07:12:11','2015-06-12 07:12:11'),(23,28,2,'2015-06-12 07:14:35','2015-06-12 07:14:35'),(24,29,2,'2015-06-12 07:17:46','2015-06-12 07:17:46'),(25,30,2,'2015-06-12 07:21:37','2015-06-12 07:21:37'),(26,50,2,'2015-06-12 18:20:33','2015-06-12 18:20:33'),(27,51,2,'2015-06-12 20:55:05','2015-06-12 20:55:05');
/*!40000 ALTER TABLE `order_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_deliveries`
--

DROP TABLE IF EXISTS `order_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_address_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_deliveries_on_order_id` (`order_id`),
  KEY `index_order_deliveries_on_user_address_id` (`user_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_deliveries`
--

LOCK TABLES `order_deliveries` WRITE;
/*!40000 ALTER TABLE `order_deliveries` DISABLE KEYS */;
INSERT INTO `order_deliveries` VALUES (15,19,1,'2015-06-10 22:25:35','2015-06-10 22:25:35'),(16,20,1,'2015-06-12 04:28:03','2015-06-12 04:28:03'),(22,26,1,'2015-06-12 07:10:20','2015-06-12 07:10:20'),(23,27,1,'2015-06-12 07:12:11','2015-06-12 07:12:11'),(24,28,1,'2015-06-12 07:14:35','2015-06-12 07:14:35'),(25,29,1,'2015-06-12 07:17:46','2015-06-12 07:17:46'),(26,30,1,'2015-06-12 07:21:37','2015-06-12 07:21:37'),(27,50,1,'2015-06-12 18:20:33','2015-06-12 18:20:33'),(28,51,1,'2015-06-12 20:55:05','2015-06-12 20:55:05');
/*!40000 ALTER TABLE `order_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(19,6) DEFAULT NULL,
  `total` decimal(19,6) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_details_on_order_id` (`order_id`),
  KEY `index_order_details_on_menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (31,5,2.990000,14.950000,19,7,'2015-06-10 22:25:34','2015-06-10 22:25:34'),(32,1,3.500000,3.500000,19,8,'2015-06-10 22:25:34','2015-06-10 22:25:34'),(33,5,2.990000,14.950000,20,7,'2015-06-12 04:28:03','2015-06-12 04:28:03'),(34,1,3.500000,3.500000,20,8,'2015-06-12 04:28:03','2015-06-12 04:28:03'),(45,5,2.990000,14.950000,26,7,'2015-06-12 07:10:20','2015-06-12 07:10:20'),(46,1,3.500000,3.500000,26,8,'2015-06-12 07:10:20','2015-06-12 07:10:20'),(47,5,2.990000,14.950000,27,7,'2015-06-12 07:12:11','2015-06-12 07:12:11'),(48,1,3.500000,3.500000,27,8,'2015-06-12 07:12:11','2015-06-12 07:12:11'),(49,5,2.990000,14.950000,28,7,'2015-06-12 07:14:35','2015-06-12 07:14:35'),(50,1,3.500000,3.500000,28,8,'2015-06-12 07:14:35','2015-06-12 07:14:35'),(51,5,2.990000,14.950000,29,7,'2015-06-12 07:17:46','2015-06-12 07:17:46'),(52,1,3.500000,3.500000,29,8,'2015-06-12 07:17:46','2015-06-12 07:17:46'),(53,5,2.990000,14.950000,30,7,'2015-06-12 07:21:37','2015-06-12 07:21:37'),(54,100,3.500000,350.000000,30,8,'2015-06-12 07:21:37','2015-06-12 07:21:37'),(67,5,2.990000,14.950000,50,7,'2015-06-12 18:20:33','2015-06-12 18:20:33'),(68,1,3.500000,3.500000,50,8,'2015-06-12 18:20:33','2015-06-12 18:20:33'),(69,5,2.990000,14.950000,51,7,'2015-06-12 20:55:05','2015-06-12 20:55:05'),(70,1,3.500000,3.500000,51,8,'2015-06-12 20:55:05','2015-06-12 20:55:05');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `total_discount` decimal(19,6) DEFAULT NULL,
  `sub_total` decimal(19,6) DEFAULT NULL,
  `igv` decimal(19,6) DEFAULT NULL,
  `total` decimal(19,6) DEFAULT NULL,
  `local_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_local_id` (`local_id`),
  KEY `index_orders_on_user_id` (`user_id`),
  KEY `index_orders_on_payment_type_id` (`payment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (19,'2015-06-10',0.000000,18.450000,3.321000,21.771000,1,1,1,'2015-06-10 22:25:34','2015-06-10 22:25:34'),(20,'2015-06-12',0.000000,18.450000,3.321000,21.771000,1,1,1,'2015-06-12 04:28:03','2015-06-12 04:28:03'),(26,'2015-06-12',0.000000,18.450000,3.321000,21.771000,1,1,1,'2015-06-12 07:10:20','2015-06-12 07:10:20'),(27,'2015-06-12',0.000000,18.450000,3.321000,21.771000,1,1,1,'2015-06-12 07:12:11','2015-06-12 07:12:11'),(28,'2015-06-12',0.000000,18.450000,3.321000,21.771000,1,1,1,'2015-06-12 07:14:35','2015-06-12 07:14:35'),(29,'2015-06-12',0.000000,18.450000,3.321000,21.771000,1,1,1,'2015-06-12 07:17:46','2015-06-12 07:17:46'),(30,'2015-06-12',0.000000,364.950000,65.691000,430.641000,1,1,1,'2015-06-12 07:21:37','2015-06-12 07:21:37'),(50,'2015-06-12',0.000000,18.450000,3.321000,21.771000,1,1,1,'2015-06-12 18:20:33','2015-06-12 18:20:33'),(51,'2015-06-12',0.000000,18.450000,3.321000,21.771000,1,1,1,'2015-06-12 20:55:05','2015-06-12 20:55:05');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(19,6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (1,'CREDIT CARD',0.000000,'2015-06-09 22:46:03','2015-06-09 22:46:03'),(2,'USER POINT',100.000000,'2015-06-09 22:46:39','2015-06-09 22:46:39'),(3,'CONTRA ENTREGA',0.000000,'2015-06-10 01:54:47','2015-06-10 01:54:47');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_provinces_on_country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'LIMA',1,'2015-05-28 18:47:57','2015-05-28 18:47:57'),(2,'AYACUCHO',1,'2015-05-31 23:10:21','2015-05-31 23:10:21'),(3,'PIURA',1,'2015-05-31 23:10:36','2015-05-31 23:10:36');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_page` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_point` tinyint(1) DEFAULT NULL,
  `min_points` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `object_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_restaurants_on_user_id` (`user_id`),
  KEY `index_restaurants_on_object_type_id` (`object_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Rustica','2451422','987484663','contacto@rustica.pe','reserva@rustica.pe','www.rustica.pe','https://www.facebook.com/rusticaperu','https://www.twitter.com/rusticaperu','https://www.instagram.com/rusticaperu',0,0,1,1,'2015-05-28 20:15:10','2015-06-10 21:09:41','logo_rustica.jpg','image/jpeg',19390,'2015-05-28 20:28:44'),(2,'Costa Verde','8956544','857485994','contacto@costaverde.pe','reserva@costaverde.pe','www.restaurantecostaverde.com','https://www.facebook.com/restaurantecostaverde','https://www.twitter.com/restaurantecostaverde','https://www.instagram.com/restaurantecostaverde',1,5,1,1,'2015-05-28 21:20:32','2015-05-28 21:24:25','logo_costa_verde.jpg','image/jpeg',37482,'2015-05-28 21:20:31');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150526052726'),('20150526052804'),('20150526053043'),('20150526053140'),('20150526053157'),('20150526053705'),('20150526054700'),('20150526060611'),('20150526171622'),('20150526231516'),('20150527183521'),('20150527201931'),('20150527201944'),('20150527201950'),('20150528054511'),('20150528140733'),('20150528160436'),('20150528173924'),('20150528195713'),('20150528202247'),('20150528213932'),('20150528220126'),('20150529055401'),('20150529152635'),('20150529153126'),('20150529205758'),('20150529220434'),('20150530024354'),('20150530034508'),('20150530034905'),('20150530035607'),('20150530042822'),('20150530052953'),('20150601191144'),('20150602050928'),('20150608181212'),('20150609223855'),('20150609224027'),('20150609224058'),('20150609224119'),('20150609224134');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_carts`
--

DROP TABLE IF EXISTS `shopping_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shopping_carts_on_menu_id` (`menu_id`),
  KEY `index_shopping_carts_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_carts`
--

LOCK TABLES `shopping_carts` WRITE;
/*!40000 ALTER TABLE `shopping_carts` DISABLE KEYS */;
INSERT INTO `shopping_carts` VALUES (22,1,11,1,'2015-06-12 23:39:20','2015-06-12 23:39:20');
/*!40000 ALTER TABLE `shopping_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_addresses_on_district_id` (`district_id`),
  KEY `index_user_addresses_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
INSERT INTO `user_addresses` VALUES (1,'Mi Casa','Urb. Virgen del Carmen Mz. J Lot. 3',1,1,1,'2015-05-28 18:49:17','2015-05-28 18:49:49');
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cards`
--

DROP TABLE IF EXISTS `user_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `credit_card_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_cards_on_credit_card_type_id` (`credit_card_type_id`),
  KEY `index_user_cards_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cards`
--

LOCK TABLES `user_cards` WRITE;
/*!40000 ALTER TABLE `user_cards` DISABLE KEYS */;
INSERT INTO `user_cards` VALUES (2,'789465123753',0,3,1,'2015-05-28 17:17:16','2015-05-28 17:37:02');
/*!40000 ALTER TABLE `user_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorites`
--

DROP TABLE IF EXISTS `user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `object_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_favorites_on_user_id` (`user_id`),
  KEY `index_user_favorites_on_object_type_id` (`object_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorites`
--

LOCK TABLES `user_favorites` WRITE;
/*!40000 ALTER TABLE `user_favorites` DISABLE KEYS */;
INSERT INTO `user_favorites` VALUES (1,1,1,'2015-05-28 21:54:55','2015-05-28 21:54:55',1);
/*!40000 ALTER TABLE `user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_points`
--

DROP TABLE IF EXISTS `user_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_points_on_restaurant_id` (`restaurant_id`),
  KEY `index_user_points_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_points`
--

LOCK TABLES `user_points` WRITE;
/*!40000 ALTER TABLE `user_points` DISABLE KEYS */;
INSERT INTO `user_points` VALUES (7,2,1,1,'2015-06-10 22:25:35','2015-06-12 04:28:03');
/*!40000 ALTER TABLE `user_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_reviews`
--

DROP TABLE IF EXISTS `user_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `object_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_reviews_on_user_id` (`user_id`),
  KEY `index_user_reviews_on_item_id` (`item_id`),
  KEY `index_user_reviews_on_restaurant_id` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reviews`
--

LOCK TABLES `user_reviews` WRITE;
/*!40000 ALTER TABLE `user_reviews` DISABLE KEYS */;
INSERT INTO `user_reviews` VALUES (2,1,'Restaurant - Test user review - 1 star',1,NULL,NULL,1,'2015-06-01 20:16:39','2015-06-01 21:42:55'),(3,2,'Restaurant - Test user review - 2 star',1,NULL,NULL,1,'2015-06-01 20:17:55','2015-06-01 21:43:10'),(4,3,'Restaurant - Test user review - 3 star',1,NULL,NULL,1,'2015-06-01 20:25:21','2015-06-01 21:43:26'),(7,1,'Item - Test user review - 1 star',2,NULL,1,NULL,'2015-06-01 21:38:58','2015-06-01 21:49:52'),(8,2,'Item - Test user review - 2 star',2,NULL,1,NULL,'2015-06-01 21:39:10','2015-06-01 21:50:06'),(9,3,'Item - Test user review - 3 star',2,NULL,1,NULL,'2015-06-01 21:39:21','2015-06-01 21:50:20'),(10,4,'Item - Test user review - 4 star',2,NULL,1,NULL,'2015-06-01 21:39:33','2015-06-01 21:50:34'),(11,4,'Restaurant - Test user review - 4 star',1,NULL,NULL,1,'2015-06-01 21:40:37','2015-06-01 21:43:40'),(12,5,'Restaurant - Test user review - 5 star',1,NULL,NULL,1,'2015-06-01 21:43:53','2015-06-01 21:43:53'),(13,5,'Item - Test user review - 5 star',2,NULL,1,NULL,'2015-06-01 21:50:48','2015-06-01 21:50:48'),(14,5,'jojojo 5',1,NULL,NULL,1,'2015-06-02 05:59:37','2015-06-02 05:59:37'),(15,3,'jajaja 3',2,NULL,1,NULL,'2015-06-02 06:01:37','2015-06-02 06:01:37'),(16,1,'en naa!!!',1,NULL,NULL,1,'2015-06-03 20:58:46','2015-06-03 20:58:46'),(17,2,'dkjfghdkfjhkdfg',1,NULL,NULL,1,'2015-06-04 01:30:42','2015-06-04 01:30:42'),(18,3,'jhgjhgvhg jh',1,NULL,NULL,1,'2015-06-12 23:29:19','2015-06-12 23:29:19');
/*!40000 ALTER TABLE `user_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'WEB MANAGER','2015-05-28 15:08:53','2015-05-28 15:08:53'),(2,'PROVIDER','2015-05-28 15:09:16','2015-05-28 15:09:16'),(3,'CUSTOMER','2015-05-28 15:09:32','2015-05-28 15:09:32');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_user_type_id` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'salas.john@hotmail.com','$2a$10$8W8IfxPWQwtuh2y5ZuC.iu6buAmCS4u9uC5.m5Dd6w2E43e2Y6inu',NULL,NULL,NULL,23,'2015-06-12 23:28:28','2015-06-12 21:32:29','190.113.208.44','190.113.208.44','2015-05-28 15:14:34','2015-06-12 23:28:28',1,'John','Salas','987575442','cropped-shawn_avatar_icon155.png','image/png',104196,'2015-05-28 15:14:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `votable_id` int(11) DEFAULT NULL,
  `votable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `voter_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vote_flag` tinyint(1) DEFAULT NULL,
  `vote_scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vote_weight` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_votes_on_voter_id_and_voter_type_and_vote_scope` (`voter_id`,`voter_type`,`vote_scope`),
  KEY `index_votes_on_votable_id_and_votable_type_and_vote_scope` (`votable_id`,`votable_type`,`vote_scope`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,1,'Restaurant',1,'User',1,NULL,1,'2015-06-02 05:48:28','2015-06-02 05:49:11'),(2,1,'Item',1,'User',1,NULL,1,'2015-06-02 05:52:33','2015-06-02 05:52:33');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-12 23:52:04
