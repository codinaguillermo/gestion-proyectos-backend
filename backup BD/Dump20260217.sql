CREATE DATABASE  IF NOT EXISTS `gestor_proyectos_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestor_proyectos_db`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: gestor_proyectos_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `escuelas`
--

DROP TABLE IF EXISTS `escuelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escuelas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_corto` varchar(50) NOT NULL,
  `nombre_largo` varchar(255) NOT NULL,
  `cue` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuelas`
--

LOCK TABLES `escuelas` WRITE;
/*!40000 ALTER TABLE `escuelas` DISABLE KEYS */;
INSERT INTO `escuelas` VALUES (1,'EET24','EET N° 24 Simón de Iriondo','1232','aaaaasdas','2026-02-10 16:14:49','2026-02-12 19:55:43'),(2,'EET32','Esc. Tecnica de Barranqueras','232323','algun lado 123','2026-02-12 19:56:08','2026-02-12 19:56:08');
/*!40000 ALTER TABLE `escuelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_proyecto`
--

DROP TABLE IF EXISTS `estados_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_proyecto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombre_2` (`nombre`),
  UNIQUE KEY `nombre_3` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_proyecto`
--

LOCK TABLES `estados_proyecto` WRITE;
/*!40000 ALTER TABLE `estados_proyecto` DISABLE KEYS */;
INSERT INTO `estados_proyecto` VALUES (1,'ABIERTO'),(2,'CERRADO'),(3,'EN REVISIÓN');
/*!40000 ALTER TABLE `estados_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_tarea`
--

DROP TABLE IF EXISTS `estados_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_tarea` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_tarea`
--

LOCK TABLES `estados_tarea` WRITE;
/*!40000 ALTER TABLE `estados_tarea` DISABLE KEYS */;
INSERT INTO `estados_tarea` VALUES (1,'TO DO'),(2,'IN_PROGRESS'),(3,'TESTING'),(4,'DONE');
/*!40000 ALTER TABLE `estados_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_us`
--

DROP TABLE IF EXISTS `estados_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_us`
--

LOCK TABLES `estados_us` WRITE;
/*!40000 ALTER TABLE `estados_us` DISABLE KEYS */;
INSERT INTO `estados_us` VALUES (3,'BLOQUEADA'),(2,'EN DESARROLLO'),(1,'PENDIENTE'),(4,'TERMINADA');
/*!40000 ALTER TABLE `estados_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridades`
--

DROP TABLE IF EXISTS `prioridades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prioridades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `peso` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridades`
--

LOCK TABLES `prioridades` WRITE;
/*!40000 ALTER TABLE `prioridades` DISABLE KEYS */;
INSERT INTO `prioridades` VALUES (1,'BAJA',10),(2,'MEDIA',20),(3,'ALTA',30),(4,'URGENTE',40);
/*!40000 ALTER TABLE `prioridades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridades_us`
--

DROP TABLE IF EXISTS `prioridades_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prioridades_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `peso` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridades_us`
--

LOCK TABLES `prioridades_us` WRITE;
/*!40000 ALTER TABLE `prioridades_us` DISABLE KEYS */;
INSERT INTO `prioridades_us` VALUES (1,'BAJA',1),(2,'MEDIA',2),(3,'ALTA',3);
/*!40000 ALTER TABLE `prioridades_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `estado_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `docente_owner_id` int DEFAULT NULL,
  `escuela_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  KEY `docente_owner_id` (`docente_owner_id`),
  CONSTRAINT `proyectos_ibfk_4` FOREIGN KEY (`estado_id`) REFERENCES `estados_proyecto` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `proyectos_ibfk_5` FOREIGN KEY (`docente_owner_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'Sistema Escolar 2.0 (Renovado)','Ahora con backend 100% funcional y recursividad',1,'2026-01-27 20:12:29','2026-01-27 23:08:46','2026-01-29 02:48:15',1,1),(2,'Proyecto Feo','Para borrar',1,'2026-01-27 23:09:51','2026-01-27 23:09:51','2026-01-27 23:10:12',1,1),(3,'prueba 1ssss','vamos',1,'2026-01-28 19:08:26','2026-01-30 18:55:22','2026-02-04 21:51:33',2,1),(4,'Sistema de Gestión Académica','Proyecto para gestionar alumnos y notas con metodología Agile',1,'2026-02-02 18:08:59','2026-02-13 02:03:14','2026-02-13 02:03:14',2,1),(5,'proyecto de agua','fsfsfsf\n',1,'2026-02-04 21:58:44','2026-02-04 22:31:34','2026-02-04 22:31:34',2,1),(6,'proyecto de alejandra','prueba',1,'2026-02-10 14:34:05','2026-02-10 14:34:05',NULL,9,1),(7,'otro proyecto','de alejandra',1,'2026-02-10 16:14:49','2026-02-10 16:14:49',NULL,9,1),(8,'proy 3','proyecto 3',1,'2026-02-13 02:45:24','2026-02-13 02:45:24',NULL,9,1);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectousuarios`
--

DROP TABLE IF EXISTS `proyectousuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectousuarios` (
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proyecto_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`proyecto_id`,`usuario_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `proyectousuarios_ibfk_1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proyectousuarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectousuarios`
--

LOCK TABLES `proyectousuarios` WRITE;
/*!40000 ALTER TABLE `proyectousuarios` DISABLE KEYS */;
INSERT INTO `proyectousuarios` VALUES ('2026-01-30 19:28:08','2026-01-30 19:28:08',3,1),('2026-01-30 19:34:20','2026-01-30 19:34:20',3,2),('2026-02-06 16:07:57','2026-02-06 16:07:57',4,2),('2026-02-06 17:50:00','2026-02-06 17:50:00',4,3),('2026-02-06 17:53:08','2026-02-06 17:53:08',4,4),('2026-02-10 11:32:23','2026-02-10 11:32:23',4,9),('2026-02-10 14:49:19','2026-02-10 14:49:19',6,3),('2026-02-10 16:19:34','2026-02-10 16:19:34',7,1),('2026-02-10 23:18:19','2026-02-10 23:18:19',7,14),('2026-02-14 00:55:32','2026-02-14 00:55:32',8,2),('2026-02-13 03:46:56','2026-02-13 03:46:56',8,5),('2026-02-13 02:45:24','2026-02-13 02:45:24',8,9),('2026-02-13 03:46:56','2026-02-13 03:46:56',8,14),('2026-02-13 03:42:57','2026-02-13 03:42:57',8,17);
/*!40000 ALTER TABLE `proyectousuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `ver_todo` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombre_2` (`nombre`),
  UNIQUE KEY `nombre_3` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN',1),(2,'DOCENTE',1),(3,'ALUMNO',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `criterios_aceptacion` text,
  `horas_estimadas` decimal(10,2) DEFAULT '0.00',
  `fecha_inicio_real` datetime DEFAULT NULL,
  `fecha_fin_real` datetime DEFAULT NULL,
  `horas_dedicadas` decimal(10,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `proyecto_id` int DEFAULT NULL,
  `us_id` int NOT NULL,
  `responsable_id` int DEFAULT NULL,
  `padre_id` int DEFAULT NULL,
  `prioridad_id` bigint unsigned NOT NULL,
  `estado_id` bigint unsigned NOT NULL,
  `tipo_id` bigint unsigned NOT NULL,
  `cumple_aceptacion` tinyint(1) DEFAULT '0',
  `testeado` tinyint(1) DEFAULT '0',
  `documentado` tinyint(1) DEFAULT '0',
  `utilizable` tinyint(1) DEFAULT '0',
  `comentario_cierre` text,
  `link_evidencia` varchar(255) DEFAULT NULL,
  `horas_reales` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `proyecto_id` (`proyecto_id`),
  KEY `responsable_id` (`responsable_id`),
  KEY `padre_id` (`padre_id`),
  KEY `fk_prioridad` (`prioridad_id`),
  KEY `fk_estado` (`estado_id`),
  KEY `fk_tipo` (`tipo_id`),
  KEY `fk_tarea_us` (`us_id`),
  CONSTRAINT `fk_estado` FOREIGN KEY (`estado_id`) REFERENCES `estados_tarea` (`id`),
  CONSTRAINT `fk_prioridad` FOREIGN KEY (`prioridad_id`) REFERENCES `prioridades` (`id`),
  CONSTRAINT `fk_tarea_us` FOREIGN KEY (`us_id`) REFERENCES `user_stories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tipo` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_tarea` (`id`),
  CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tareas_ibfk_2` FOREIGN KEY (`responsable_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tareas_ibfk_3` FOREIGN KEY (`padre_id`) REFERENCES `tareas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (15,'tarea 1','',NULL,12.00,NULL,NULL,0.00,'2026-02-04 22:25:12','2026-02-04 22:25:12','2026-02-04 22:26:14',5,12,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(16,'tarea 22','',NULL,12.00,NULL,NULL,0.00,'2026-02-04 22:26:59','2026-02-04 22:26:59','2026-02-04 22:31:34',5,10,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(17,'adadad','',NULL,12.00,NULL,NULL,0.00,'2026-02-07 01:09:45','2026-02-10 12:18:47','2026-02-13 02:03:14',4,3,9,NULL,1,2,2,0,0,0,0,NULL,NULL,0.00),(18,'mantener la BD','',NULL,5.00,NULL,NULL,0.00,'2026-02-08 16:30:11','2026-02-08 16:30:11','2026-02-13 02:03:14',4,3,NULL,NULL,3,3,1,0,0,0,0,NULL,NULL,0.00),(19,'comprar EPS32','adad','',0.00,NULL,NULL,0.00,'2026-02-10 12:10:51','2026-02-12 02:50:31','2026-02-13 02:03:14',4,3,4,NULL,1,2,1,0,1,0,0,'','',58.00),(20,'tarea 1 de carlos','adad',NULL,0.00,NULL,NULL,0.00,'2026-02-10 18:16:33','2026-02-10 18:20:10','2026-02-10 19:20:59',7,14,5,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(21,'tarea para guille','adad',NULL,0.00,NULL,NULL,0.00,'2026-02-10 18:20:32','2026-02-10 18:20:32','2026-02-10 19:20:59',7,14,1,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(22,'tarea 1','asdad',NULL,0.00,NULL,NULL,0.00,'2026-02-10 19:24:43','2026-02-10 19:24:43','2026-02-10 19:34:55',7,15,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(23,'sfsf','asda',NULL,0.00,NULL,NULL,0.00,'2026-02-10 19:35:48','2026-02-10 19:35:48','2026-02-10 19:36:55',7,16,1,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(24,'sfsf','adad',NULL,0.00,NULL,NULL,0.00,'2026-02-10 19:37:15','2026-02-10 19:37:15','2026-02-10 19:38:33',7,17,1,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(25,'adad','asdasd',NULL,0.00,NULL,NULL,0.00,'2026-02-10 19:39:12','2026-02-10 19:39:12','2026-02-10 19:40:33',7,18,1,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(26,'sfsf','sfsf',NULL,0.00,NULL,NULL,0.00,'2026-02-10 19:41:27','2026-02-11 00:58:38','2026-02-11 01:00:18',7,19,5,NULL,1,3,1,0,0,0,0,NULL,NULL,0.00),(27,'xvxvx','adadaddadasc safddsdf s df',NULL,0.00,NULL,NULL,0.00,'2026-02-10 23:19:29','2026-02-10 23:57:22','2026-02-11 01:00:16',7,19,14,NULL,1,2,1,0,0,0,0,NULL,NULL,0.00),(28,'adadad','adad',NULL,0.00,NULL,NULL,0.00,'2026-02-10 23:19:57','2026-02-10 23:19:57','2026-02-11 00:58:48',7,19,1,NULL,3,1,1,0,0,0,0,NULL,NULL,0.00),(29,'asdasda','',NULL,0.00,NULL,NULL,0.00,'2026-02-11 01:01:16','2026-02-11 01:01:16','2026-02-11 03:17:17',7,19,1,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(30,'adadad','',NULL,0.00,NULL,NULL,0.00,'2026-02-11 01:08:34','2026-02-11 01:08:34','2026-02-11 03:17:17',7,19,5,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(31,'adad','',NULL,0.00,NULL,NULL,0.00,'2026-02-11 01:08:47','2026-02-11 01:08:57','2026-02-11 03:17:17',7,19,14,NULL,1,3,1,0,0,0,0,NULL,NULL,0.00),(32,'Tarea 1','SsS','',15.00,NULL,NULL,0.00,'2026-02-11 03:44:58','2026-02-13 00:50:57',NULL,7,20,5,NULL,1,4,1,0,0,0,0,'','',5.00),(33,'OTRA TAREA','ASDADAD','',12.00,NULL,NULL,0.00,'2026-02-11 03:45:16','2026-02-13 16:07:21',NULL,7,20,14,NULL,1,2,1,0,1,0,0,'','',20.10),(34,'TAREASSSSS','',NULL,0.00,NULL,NULL,0.00,'2026-02-11 03:45:26','2026-02-11 03:45:26','2026-02-11 03:49:08',7,20,5,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),(35,'TASK4','','',5.00,NULL,NULL,0.00,'2026-02-11 03:45:43','2026-02-12 04:16:11',NULL,7,20,9,NULL,2,4,2,0,0,0,0,'','',5.00),(36,'crear el DER','crear el DER','',9.00,NULL,NULL,0.00,'2026-02-12 01:49:46','2026-02-13 00:09:59',NULL,7,20,14,NULL,1,4,1,1,1,1,1,'','https://drive.google.com/drive/folders/17HRcPAK34Bv9r83sXT3sMP8pf-SR64UX',32.00),(37,'tarea 1','sdfsf','',23.00,NULL,NULL,0.00,'2026-02-13 03:53:44','2026-02-14 00:10:41',NULL,8,22,5,NULL,1,4,1,0,0,0,0,'','',14.00),(38,'tarea 2','','',12.00,NULL,NULL,0.00,'2026-02-13 03:53:58','2026-02-15 03:34:53',NULL,8,22,17,NULL,4,2,1,0,0,0,0,'','',8.00),(39,'tarea de QA','adasd','',4.00,NULL,NULL,0.00,'2026-02-13 03:54:21','2026-02-14 13:23:34',NULL,8,22,14,NULL,2,2,2,0,0,1,0,'','addasda',59.00),(40,'tarea 4','asdasd','',0.00,NULL,NULL,0.00,'2026-02-13 04:06:10','2026-02-13 04:06:10',NULL,8,22,5,NULL,1,1,4,0,0,0,0,'','',0.00),(41,'tarea 5','adadad','',10.00,NULL,NULL,0.00,'2026-02-13 04:20:34','2026-02-14 00:11:02',NULL,8,22,14,NULL,4,4,2,0,1,1,0,'','qeqeqe',16.00),(42,'tarea 5','','adadad',14.00,NULL,NULL,0.00,'2026-02-13 16:08:53','2026-02-13 16:08:53',NULL,7,20,1,NULL,1,2,4,0,0,0,0,'','',0.00),(43,'tarea 1','','',10.00,NULL,NULL,0.00,'2026-02-14 00:21:46','2026-02-14 00:22:29',NULL,8,24,5,NULL,1,4,1,0,0,0,0,'','',2.00),(44,'tarea 2','','adad',4.00,NULL,NULL,0.00,'2026-02-14 00:22:17','2026-02-14 00:22:17',NULL,8,24,14,NULL,1,2,3,0,0,0,0,'','',0.00),(45,'tarea 1','','',0.00,NULL,NULL,0.00,'2026-02-14 00:51:50','2026-02-14 00:52:44',NULL,8,23,9,NULL,1,2,1,0,0,0,0,'','',0.00),(46,'tarea 1','','23232',5.00,NULL,NULL,0.00,'2026-02-14 00:52:22','2026-02-14 00:52:22',NULL,8,25,14,NULL,1,3,1,0,0,0,0,'','',0.00),(47,'tarea 2','','',0.00,NULL,NULL,0.00,'2026-02-14 00:53:06','2026-02-14 00:53:06',NULL,8,25,9,NULL,1,2,2,0,0,0,0,'','',0.00),(48,'tarea 3','','',5.00,NULL,NULL,0.00,'2026-02-14 00:55:52','2026-02-14 00:56:13',NULL,8,25,2,NULL,1,4,1,1,1,0,0,'','',6.00);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_tarea`
--

DROP TABLE IF EXISTS `tipos_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_tarea` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_tarea`
--

LOCK TABLES `tipos_tarea` WRITE;
/*!40000 ALTER TABLE `tipos_tarea` DISABLE KEYS */;
INSERT INTO `tipos_tarea` VALUES (1,'Desarrollo'),(2,'Testing / QA'),(3,'Documentación'),(4,'Bug / Fix');
/*!40000 ALTER TABLE `tipos_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stories`
--

DROP TABLE IF EXISTS `user_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proyecto_id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `condiciones` text,
  `prioridad_id` int DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_us_proyecto` (`proyecto_id`),
  KEY `fk_us_prioridad` (`prioridad_id`),
  KEY `fk_us_estado` (`estado_id`),
  CONSTRAINT `fk_us_estado` FOREIGN KEY (`estado_id`) REFERENCES `estados_us` (`id`),
  CONSTRAINT `fk_us_prioridad` FOREIGN KEY (`prioridad_id`) REFERENCES `prioridades_us` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stories`
--

LOCK TABLES `user_stories` WRITE;
/*!40000 ALTER TABLE `user_stories` DISABLE KEYS */;
INSERT INTO `user_stories` VALUES (1,1,'Backlog Inicial','Agrupador de tareas migradas','condiciones 1 - algo, no se',2,1,NULL,NULL,'2026-02-02 15:25:42','2026-02-06 22:01:13',NULL),(3,4,'US1: Preparar HW','descripcion del US, bla bla bla','criterios de aceptacion, tener los costos de HW',3,1,NULL,NULL,'2026-02-03 00:47:03','2026-02-13 02:03:14','2026-02-13 02:03:14'),(4,4,'cargar documentaciones','dfsdfsf','qewqwe',2,1,NULL,NULL,'2026-02-03 01:13:10','2026-02-13 02:03:14','2026-02-13 02:03:14'),(8,3,'us 1','dsfsf',NULL,2,1,NULL,NULL,'2026-02-04 21:50:47','2026-02-04 21:50:47',NULL),(10,5,'tarea 2','asdasdasd','condiciones 1 - algo, no se',2,1,NULL,NULL,'2026-02-04 21:59:11','2026-02-06 21:31:43','2026-02-04 22:31:34'),(12,5,'us 3','sdasd','aca otras condiciones',2,1,NULL,NULL,'2026-02-04 22:24:54','2026-02-06 21:31:43','2026-02-04 22:26:14'),(13,6,'us1','asdasd','asda',2,1,NULL,NULL,'2026-02-10 14:50:39','2026-02-10 14:50:39',NULL),(14,7,'US de carlos','asdad','adfasdf',2,1,NULL,NULL,'2026-02-10 18:14:56','2026-02-10 19:20:59','2026-02-10 19:20:59'),(15,7,'US1','adfad','asd',2,4,NULL,NULL,'2026-02-10 19:24:30','2026-02-10 19:34:55','2026-02-10 19:34:55'),(16,7,'nueva US','sdfs','sdf',2,1,NULL,NULL,'2026-02-10 19:35:31','2026-02-10 19:36:55','2026-02-10 19:36:55'),(17,7,'prueba','sfds','sfs',2,1,NULL,NULL,'2026-02-10 19:37:04','2026-02-10 19:38:33','2026-02-10 19:38:33'),(18,7,'us sadasd','ad','ad',2,1,NULL,NULL,'2026-02-10 19:38:56','2026-02-10 19:40:33','2026-02-10 19:40:33'),(19,7,'afsdfsf','sdfsf','sffsf',2,1,NULL,NULL,'2026-02-10 19:41:16','2026-02-11 03:17:17','2026-02-11 03:17:17'),(20,7,'US 2','ALGO','condicoonessss ADSDA DA',3,2,NULL,NULL,'2026-02-11 03:16:33','2026-02-11 03:48:05',NULL),(21,7,'US 3','adad','adad',1,1,NULL,NULL,'2026-02-11 03:17:11','2026-02-11 03:17:11',NULL),(22,8,'US 1','sadasd','asdad',2,2,NULL,NULL,'2026-02-13 03:43:10','2026-02-13 03:47:23',NULL),(23,8,'User Story 2','crear Servidores','bla bla',3,1,NULL,NULL,'2026-02-14 00:19:37','2026-02-14 00:19:37',NULL),(24,8,'obtener la BD Legacy','adadadad','adad',2,1,NULL,NULL,'2026-02-14 00:20:29','2026-02-14 00:20:29',NULL),(25,8,'Adquisicion de componentes','asdad','asadf',1,1,NULL,NULL,'2026-02-14 00:20:52','2026-02-14 00:20:52',NULL);
/*!40000 ALTER TABLE `user_stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_escuelas`
--

DROP TABLE IF EXISTS `usuario_escuelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_escuelas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `escuela_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `escuela_id` (`escuela_id`),
  CONSTRAINT `fk_escuela_id` FOREIGN KEY (`escuela_id`) REFERENCES `escuelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_school` FOREIGN KEY (`escuela_id`) REFERENCES `escuelas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_escuelas`
--

LOCK TABLES `usuario_escuelas` WRITE;
/*!40000 ALTER TABLE `usuario_escuelas` DISABLE KEYS */;
INSERT INTO `usuario_escuelas` VALUES (4,4,2),(5,5,1),(6,6,2),(8,8,2),(10,10,2),(11,11,2),(12,12,2),(13,13,1),(15,16,2),(16,17,1),(18,7,1),(19,1,1),(28,14,1),(30,3,1),(31,2,1),(32,9,2);
/*!40000 ALTER TABLE `usuario_escuelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol_id` int NOT NULL,
  `curso` varchar(50) DEFAULT NULL,
  `division` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Guille Admin','Codina','guille@escuela.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'112233',1,'2026-01-27 16:21:42','2026-02-13 22:12:00',NULL,'avatar-1-1771020720529-684404959.jpg'),(2,'Guille Admin','Codina','guille@test.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'',0,'2026-01-28 01:58:18','2026-02-14 13:48:38',NULL,NULL),(3,'Guillermo Adrian','Codina','guille2@gmail.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'',1,'2026-02-04 19:24:43','2026-02-14 13:47:56',NULL,NULL),(4,'Maria','Fernandez','maria@maria.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',2,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(5,'Carlos','Gomezz','carlos@carlos.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'6to','2da',NULL,1,'2026-02-04 19:24:43','2026-02-12 18:24:24',NULL,NULL),(6,'Matias Rivero','','mati@mati.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(7,'Eugenia Ramirez','','euge@euge.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'','','',1,'2026-02-04 19:24:43','2026-02-13 00:57:57',NULL,NULL),(8,'Maria Florecencia Diaz','','mariflor@mari1.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'6to','1ra','',0,'2026-02-04 19:24:43','2026-02-13 17:17:27',NULL,NULL),(9,'Maria Alejandra','Ramirez','mariale@mari2.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',2,NULL,NULL,'123',1,'2026-02-04 19:24:43','2026-02-14 13:49:09',NULL,'avatar-9-1771076949975-790076961.jpg'),(10,'Agustin Medero','','agustinagustin.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(11,'Paula Contreras','','paula@paula.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'',1,'2026-02-04 19:24:43','2026-02-13 17:17:14',NULL,NULL),(12,'Gustavo ','Ramirez','gustavo@gustavo.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',2,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(13,'Benjamin ','Ramirez','benjabenja.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(14,'Ivo ','Sanchez','ivo@ivo.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'6to','2da','232324',1,'2026-02-04 19:24:43','2026-02-14 13:37:46',NULL,'avatar-14-1771076266518-748256591.png'),(16,'silvia','gerber','silvia@silvia.com','$2b$10$I.2o4q1oE0wYWT7K/EHrb.ame0rmp.tHccn4lf6l8w7gc7KWjy.eG',3,'6to','1ra','asdadad',1,'2026-02-12 18:16:29','2026-02-12 18:20:13',NULL,NULL),(17,'Alfredo','Gomez','alfredoalfredo.com','$2b$10$FXh4GUbw.E9gfXlFhqZDP.u5zeDmZXIrcnGIvEyvAb.mFVhfii/Y.',3,'5to','2da','232323',1,'2026-02-12 18:25:12','2026-02-12 18:25:12',NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-17 17:27:42
