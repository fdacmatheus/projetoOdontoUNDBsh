CREATE DATABASE  IF NOT EXISTS `undbsh` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `undbsh`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: undbsh
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.19-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_perfis_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_perfis_user_id` FOREIGN KEY (`user_id`) REFERENCES `perfis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-07-04 02:06:52.050632','3','aluno@teste.com',1,'[{\"added\": {}}]',6,1),(2,'2021-07-04 02:07:12.545062','4','admin@teste.com',1,'[{\"added\": {}}]',6,1),(3,'2021-07-04 02:07:26.769685','5','paciente@teste.com',1,'[{\"added\": {}}]',6,1),(4,'2021-07-04 02:07:42.642399','6','gerente@teste.com',1,'[{\"added\": {}}]',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'perfis','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-07-04 01:56:18.487146'),(2,'contenttypes','0002_remove_content_type_name','2021-07-04 01:56:18.859843'),(3,'auth','0001_initial','2021-07-04 01:56:20.583403'),(4,'auth','0002_alter_permission_name_max_length','2021-07-04 01:56:21.060974'),(5,'auth','0003_alter_user_email_max_length','2021-07-04 01:56:21.078906'),(6,'auth','0004_alter_user_username_opts','2021-07-04 01:56:21.100916'),(7,'auth','0005_alter_user_last_login_null','2021-07-04 01:56:21.121020'),(8,'auth','0006_require_contenttypes_0002','2021-07-04 01:56:21.140028'),(9,'auth','0007_alter_validators_add_error_messages','2021-07-04 01:56:21.155240'),(10,'auth','0008_alter_user_username_max_length','2021-07-04 01:56:21.194911'),(11,'auth','0009_alter_user_last_name_max_length','2021-07-04 01:56:21.232817'),(12,'auth','0010_alter_group_name_max_length','2021-07-04 01:56:21.306209'),(13,'auth','0011_update_proxy_permissions','2021-07-04 01:56:21.350228'),(14,'auth','0012_alter_user_first_name_max_length','2021-07-04 01:56:21.405704'),(15,'perfis','0001_initial','2021-07-04 01:56:24.955931'),(16,'admin','0001_initial','2021-07-04 01:56:26.631292'),(17,'admin','0002_logentry_remove_auto_add','2021-07-04 01:56:26.657129'),(18,'admin','0003_logentry_add_action_flag_choices','2021-07-04 01:56:26.677129'),(19,'sessions','0001_initial','2021-07-04 01:56:26.892977'),(20,'perfis','0002_remove_user_username','2021-07-04 02:05:37.679764');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('59u533ocf5iufdoouxj87dkik8sa63ok','e30:1lzrcf:OxZHKMhGFGJ2LXkDTzqa8Oyfcn8PWPGdhm2WKGCuVYk','2021-07-18 02:12:41.519753'),('5i2rwgf020aqy7pzaox6iz96jcrxj9w9','e30:1lzrkZ:uecu51VZClVBXEuvydhSEbsnxWZbhNgk2w6K1H7pei8','2021-07-18 02:20:51.765116'),('7jmagdi3y5z8yw7lycp3amwcs5dy7xuo','e30:1lzrlh:RmFRcjnDm8VoHLB2wp57SBi4-ZMMeIm4v0aQv3g4V6I','2021-07-18 02:22:01.036125'),('aejuaayrpwml4jhwirmc78ff3h6inclt','e30:1lzrkp:lZH32WCZnRwxUMqcv0Gmv5T0Poo4uw17m_tCn8LixsE','2021-07-18 02:21:07.501852'),('pywcn6pld40e0hndmvbuz8dy06ie150n','.eJxVjEEOwiAQRe_C2pChlKF16d4zEGaGStVAUtqV8e7apAvd_vfef6kQtzWHraUlzKLOyqrT70aRH6nsQO6x3KrmWtZlJr0r-qBNX6uk5-Vw_w5ybPlbJyLghNBRAnCWzCCM3JNnM3okiAOO7Dx3vUPHJoLtEYTtiJOwk0m9P_BOOCI:1m08n4:kcNCdF7cMiyuhyZR_T5_e8L9sFNqvec2HNyvWYJSVM8','2021-07-18 20:32:34.895876'),('qlpw66j12nfa4os37ed7j13armszq2d5','e30:1lzrn2:RmPQMMHezKifRzQ8QSKM3CS8XLF4IL0zVvXcEVuUwe0','2021-07-18 02:23:24.726051'),('wjwwj125n4gae5kg3zi49yzyld9zqmtg','e30:1lzrgK:ZtAGXrQpMfYM6jtFtILvTa5aIw2F-SKn3EqEb8o_ksA','2021-07-18 02:16:28.549829'),('yd9ogjthq76r76xperappuvw2j882x41','e30:1lzrnW:1ZbmUGOS9-Eph14d3LdHw7LLENIx3TGEIoxRR47pitg','2021-07-18 02:23:54.052826');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis_user`
--

DROP TABLE IF EXISTS `perfis_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfis_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tipo_de_usuario` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis_user`
--

LOCK TABLES `perfis_user` WRITE;
/*!40000 ALTER TABLE `perfis_user` DISABLE KEYS */;
INSERT INTO `perfis_user` VALUES (1,'pbkdf2_sha256$260000$BTJz0vAIzswnwQddVXky5E$4SBP16aORfS5KbF3DgbbykYpe9f512ZiUtEr/6e7N9c=','2021-07-04 02:43:55.494920',0,'','','2021-07-04 01:59:14.645238','maximoarthuro@gmail.com','Dev',1,1,1),(3,'pbkdf2_sha256$260000$dEm7EFVzHSPljwaobmrmp0$POWM4la9vtp+PvmWZA8ti59KF3Ub2uc+I0NrD3MNIvY=','2021-07-04 20:32:34.881179',0,'','','2021-07-04 02:06:51.771071','aluno@teste.com','aluno',1,0,0),(4,'pbkdf2_sha256$260000$XyqW6iygiZFtl36MjoJ7GQ$67VEUMUIbhz2XYexdRyCpAH9CBXG6QPilqiDCGQneSs=',NULL,0,'','','2021-07-04 02:07:12.275502','admin@teste.com','admin',1,0,0),(5,'pbkdf2_sha256$260000$iP0l17olFAPajhK7hUA3Sz$WoKziLeON7PooUn+h9jzU/4F7TcLDjyakdValjfuwPk=',NULL,0,'','','2021-07-04 02:07:26.508382','paciente@teste.com','paciente',1,0,0),(6,'pbkdf2_sha256$260000$GrFg7yVYJetIPDvkE43Tvh$C7c0n16C5y2kTSzOokTOxyhRAqKy0HZ2FElgCiPZSZQ=',NULL,0,'','','2021-07-04 02:07:42.371858','gerente@teste.com','gerente',1,0,0);
/*!40000 ALTER TABLE `perfis_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis_user_groups`
--

DROP TABLE IF EXISTS `perfis_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfis_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perfis_user_groups_user_id_group_id_0d4ffcde_uniq` (`user_id`,`group_id`),
  KEY `perfis_user_groups_group_id_6515c0cf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `perfis_user_groups_group_id_6515c0cf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `perfis_user_groups_user_id_b7cd639d_fk_perfis_user_id` FOREIGN KEY (`user_id`) REFERENCES `perfis_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis_user_groups`
--

LOCK TABLES `perfis_user_groups` WRITE;
/*!40000 ALTER TABLE `perfis_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfis_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis_user_user_permissions`
--

DROP TABLE IF EXISTS `perfis_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfis_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perfis_user_user_permissions_user_id_permission_id_8329611e_uniq` (`user_id`,`permission_id`),
  KEY `perfis_user_user_per_permission_id_2c5780ae_fk_auth_perm` (`permission_id`),
  CONSTRAINT `perfis_user_user_per_permission_id_2c5780ae_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `perfis_user_user_permissions_user_id_82cad092_fk_perfis_user_id` FOREIGN KEY (`user_id`) REFERENCES `perfis_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis_user_user_permissions`
--

LOCK TABLES `perfis_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `perfis_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfis_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'undbsh'
--

--
-- Dumping routines for database 'undbsh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-04 18:12:52
