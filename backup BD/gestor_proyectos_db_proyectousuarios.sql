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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-27 18:17:05
