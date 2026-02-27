-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-27 18:17:06
