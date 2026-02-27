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
INSERT INTO `proyectos` VALUES (1,'Sistema Escolar 2.0 (Renovado)','Ahora con backend 100% funcional y recursividad',1,'2026-01-27 20:12:29','2026-01-27 23:08:46','2026-01-29 02:48:15',1,1),(2,'Proyecto Feo','Para borrar',1,'2026-01-27 23:09:51','2026-01-27 23:09:51','2026-01-27 23:10:12',1,1),(3,'prueba 1ssss','vamos',1,'2026-01-28 19:08:26','2026-01-30 18:55:22','2026-02-04 21:51:33',2,1),(4,'Sistema de Gestión Académica','Proyecto para gestionar alumnos y notas con metodología Agile',1,'2026-02-02 18:08:59','2026-02-13 02:03:14','2026-02-13 02:03:14',2,1),(5,'proyecto de agua','fsfsfsf\n',1,'2026-02-04 21:58:44','2026-02-04 22:31:34','2026-02-04 22:31:34',2,1),(6,'proyecto de alejandra','prueba',1,'2026-02-10 14:34:05','2026-02-10 14:34:05',NULL,9,1),(7,'otro proyecto','de alejandra',1,'2026-02-10 16:14:49','2026-02-10 16:14:49',NULL,9,1),(8,'proy 3 - nuevo','proyecto 3',1,'2026-02-13 02:45:24','2026-02-20 21:39:28',NULL,9,1);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
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
