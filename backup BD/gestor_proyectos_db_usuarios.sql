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
INSERT INTO `usuarios` VALUES (1,'Guille Admin','Codina','guille@escuela.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'112233',1,'2026-01-27 16:21:42','2026-02-20 21:39:47',NULL,'avatar-1-1771623587262-648604101.webp'),(2,'Guille Admin','Codina','guille@test.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'',0,'2026-01-28 01:58:18','2026-02-14 13:48:38',NULL,NULL),(3,'Guillermo Adrian','Codina','guille2@gmail.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'',1,'2026-02-04 19:24:43','2026-02-14 13:47:56',NULL,NULL),(4,'Maria','Fernandez','maria@maria.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',2,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(5,'Carlos','Gomezz','carlos@carlos.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'6to','2da',NULL,1,'2026-02-04 19:24:43','2026-02-12 18:24:24',NULL,NULL),(6,'Matias Rivero','','mati@mati.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'','','',1,'2026-02-04 19:24:43','2026-02-18 16:03:56',NULL,NULL),(7,'Eugenia Ramirez','','euge@euge.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'','','',1,'2026-02-04 19:24:43','2026-02-13 00:57:57',NULL,NULL),(8,'Maria Florecencia Diaz','','mariflor@mari1.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'6to','1ra','',0,'2026-02-04 19:24:43','2026-02-13 17:17:27',NULL,NULL),(9,'Maria Alejandra','Ramirez','mariale@mari2.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',2,NULL,NULL,'123',1,'2026-02-04 19:24:43','2026-02-14 13:49:09',NULL,'avatar-9-1771076949975-790076961.jpg'),(10,'Agustin Medero','','agustinagustin.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(11,'Paula Contreras','','paula@paula.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'',1,'2026-02-04 19:24:43','2026-02-13 17:17:14',NULL,NULL),(12,'Gustavo ','Ramirez','gustavo@gustavo.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',2,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(13,'Benjamin ','Ramirez','benjabenja.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,NULL,NULL,NULL,1,'2026-02-04 19:24:43','2026-02-04 19:24:43',NULL,NULL),(14,'Ivo ','Sanchez','ivo@ivo.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',3,'6to','2da','232324',1,'2026-02-04 19:24:43','2026-02-14 13:37:46',NULL,'avatar-14-1771076266518-748256591.png'),(16,'silvia','gerber','silvia@silvia.com','$2b$10$I.2o4q1oE0wYWT7K/EHrb.ame0rmp.tHccn4lf6l8w7gc7KWjy.eG',3,'6to','1ra','asdadad',1,'2026-02-12 18:16:29','2026-02-12 18:20:13',NULL,NULL),(17,'Alfredo','Gomez','alfredoalfredo.com','$2b$10$FXh4GUbw.E9gfXlFhqZDP.u5zeDmZXIrcnGIvEyvAb.mFVhfii/Y.',3,'5to','2da','232323',1,'2026-02-12 18:25:12','2026-02-12 18:25:12',NULL,NULL);
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

-- Dump completed on 2026-02-27 18:17:06
