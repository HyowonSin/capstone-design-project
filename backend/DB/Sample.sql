-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: information
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Current Database: `information`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `information` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `information`;

--
-- Table structure for table `challenge`
--

DROP TABLE IF EXISTS `challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge` (
  `id` int unsigned NOT NULL,
  `member__id` int unsigned NOT NULL,
  `training_purpose` varchar(20) NOT NULL,
  `challenge_goal` varchar(100) DEFAULT NULL,
  `training_to_do` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `certification_day` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `member_id_idx` (`member__id`),
  CONSTRAINT `fk_challenge_member` FOREIGN KEY (`member__id`) REFERENCES `member` (`id`),
  CONSTRAINT `challenge_chk_1` CHECK ((`training_purpose` in (_utf8mb4'Weight loss',_utf8mb4'Muscle augmentation',_utf8mb4'Body type correction')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge`
--

LOCK TABLES `challenge` WRITE;
/*!40000 ALTER TABLE `challenge` DISABLE KEYS */;
INSERT INTO `challenge` VALUES (1,1,'Weight loss','-5kg','aerobic 30 minutes','2020-10-01','2020-10-31','MON, WED, FRI'),(2,2,'Muscle augmentation','10 pull-ups','100 push-ups','2020-10-07','2020-12-31','MON, TUE, WED, THU, FRI'),(3,3,'Body type correction',NULL,NULL,NULL,NULL,NULL),(4,4,'Weight loss',NULL,NULL,NULL,NULL,NULL),(5,5,'Weight loss',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int unsigned NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_local_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'sample1@gmail.com','sample1pw','sample1 name'),(2,'sample2@naver.com','sample2pw','sample2 name'),(3,'sample3@daum.net','sample3pw','sample3 name'),(4,'sample4@gmail.com','sample4pw','sample4 name'),(5,'sample5@naver.com','sample5pw','sample5 name');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id` int unsigned NOT NULL,
  `challenge__id` int unsigned NOT NULL,
  `date` date NOT NULL,
  `result` varchar(10) NOT NULL,
  `journal` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_record_challenge1_idx` (`challenge__id`),
  CONSTRAINT `fk_record_challenge1` FOREIGN KEY (`challenge__id`) REFERENCES `challenge` (`id`),
  CONSTRAINT `record_chk_1` CHECK ((`result` in (_utf8mb4'Success',_utf8mb4'Failure')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,1,'2020-10-02','Success','First day, fighting!'),(2,1,'2020-10-05','Success','I finished it well today! I\'m proud!'),(3,2,'2020-10-05','Success','Today was my first day and it was very hard.'),(4,2,'2020-10-06','Success','I feel sick all over...'),(5,1,'2020-10-07','Failure','I couldn\'t train today. I should reflect on myself.'),(6,2,'2020-10-07','Success','It\'s getting better and better. feel good!');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'information'
--

--
-- Dumping routines for database 'information'
--

--
-- Current Database: `data`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `data`;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` varchar(15) NOT NULL,
  `shipping_charge` varchar(15) DEFAULT 'Free',
  `seller` varchar(30) DEFAULT NULL,
  `URL` varchar(500) NOT NULL,
  `training_purpose` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `training_purpose_UNIQUE` (`training_purpose`),
  CONSTRAINT `equipment_chk_1` CHECK ((`training_purpose` in (_utf8mb4'Weight loss',_utf8mb4'Muscle augmentation',_utf8mb4'Body type correction')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Melkin Yoga Mat NBR TPE Cork Thick Pilates Home 6 8 10 20mm','8,700 won','2,500 won','Melkin Sports','https://smartstore.naver.com/melkinsports/products/581157627?n_media=27758&n_query=%EC%9A%94%EA%B0%80%EB%A7%A4%ED%8A%B8&n_rank=2&n_ad_group=grp-a001-02-000000012661474&n_ad=nad-a001-02-000000075244302&n_campaign_type=2&n_mall_pid=581157627&n_ad_group_type=2&NaPm=ct%3Dkfr3u1cw%7Cci%3D0A40002q57nt86ZPX1kn%7Ctr%3Dpla%7Chk%3D2efce2153145531ad93c6dba71b5211b4bea8410','Body type correction'),(2,'Igojin Dumbel Bar 21kg Dumbel Set Assembly Aryeong Set','25,620 won','4,000 won','Egojin Health','https://smartstore.naver.com/egojin/products/4616378370?NaPm=ct%3Dkfr406t4%7Cci%3Dc88a45170c6936a4c5cbfb78ca918670577ab39a%7Ctr%3Dslsbrc%7Csn%3D156815%7Cic%3D%7Chk%3Dbbe908cdc3bd64e1c3ea58740106e6d16ba95556','Muscle augmentation'),(3,'TKFIT Cross-Fit Boxing Wire-jumping Diet for Speed Players','9,900 won','2,500 won','TKFIT','https://smartstore.naver.com/tkfit/products/389565867?n_media=11068&n_query=%EC%A4%84%EB%84%98%EA%B8%B0&n_rank=1&n_ad_group=grp-a001-02-000000005286490&n_ad=nad-a001-02-000000024119334&n_campaign_type=2&n_mall_pid=389565867&n_ad_group_type=2&NaPm=ct%3Dkfr40qvc%7Cci%3D0zK0003j5lntbXa4R1ks%7Ctr%3Dpla%7Chk%3De18d221ce8d58699e482b9bf15ce337f1ba2d656','Weight loss');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `serving_size` varchar(10) DEFAULT NULL,
  `calory` varchar(10) DEFAULT NULL,
  `carbohydrate` varchar(10) DEFAULT NULL,
  `protein` varchar(10) DEFAULT NULL,
  `fat` varchar(10) DEFAULT NULL,
  `training_purpose` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `meal_chk_1` CHECK ((`training_purpose` in (_utf8mb4'Weight loss',_utf8mb4'Muscle augmentation',_utf8mb4'Body type correction')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (1,'Chicken breast salad','150g','203kcal','8g','10.8g','14.2g','Weight loss'),(2,'Pasta salad',NULL,'333kcal','29 g','12 g','18 g','Muscle augmentation'),(3,'Stir-fried anchovies','50g','137kcal','6.8g','3.5g','19.7g','Body type correction');
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedio`
--

DROP TABLE IF EXISTS `vedio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vedio` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `uploader` varchar(30) DEFAULT NULL,
  `URL` varchar(300) NOT NULL,
  `training_purpose` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `vedio_chk_1` CHECK ((`training_purpose` in (_utf8mb4'Weight loss',_utf8mb4'Muscle augmentation',_utf8mb4'Body type correction')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedio`
--

LOCK TABLES `vedio` WRITE;
/*!40000 ALTER TABLE `vedio` DISABLE KEYS */;
INSERT INTO `vedio` VALUES (1,'handstand','How To HANDSTAND HOLD | 5 EASY Steps','CHRIS HERIA','https://www.youtube.com/watch?v=KNC5lkoE2Fs','Body type correction'),(2,'Tabata ','CrossFit Tabata','Tabata Songs','https://www.youtube.com/watch?v=ieQLwxA2qGY','Weight loss'),(3,'push-up','The Perfect Push Up | Do it right!','Calisthenicmovement','https://www.youtube.com/watch?v=IODxDxX7oi4','Muscle augmentation');
/*!40000 ALTER TABLE `vedio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'data'
--

--
-- Dumping routines for database 'data'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-03 18:04:01
