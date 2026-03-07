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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-05 20:15:25
