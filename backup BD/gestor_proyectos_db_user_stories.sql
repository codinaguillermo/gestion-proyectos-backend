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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-27 18:17:06
