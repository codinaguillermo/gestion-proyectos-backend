/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gestion_proyectos
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0+deb12u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Entregables`
--

DROP TABLE IF EXISTS `Entregables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entregables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `link_drive` varchar(255) DEFAULT '',
  `entregado` tinyint(1) DEFAULT 0,
  `aprobado` tinyint(1) DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entregables`
--

LOCK TABLES `Entregables` WRITE;
/*!40000 ALTER TABLE `Entregables` DISABLE KEYS */;
INSERT INTO `Entregables` VALUES
(1,11,'carpeta tecnica','gdfgdfgdfg',0,0,'2026-03-09 19:52:38','2026-03-12 16:14:43',NULL),
(2,12,'Esquema de Conexión y PCB','',1,1,'2026-03-09 22:21:53','2026-05-08 12:21:07',NULL),
(3,12,'Documentación de API','',1,0,'2026-03-09 22:21:53','2026-05-08 12:21:07',NULL),
(4,12,'Manual de Instalación','',1,0,'2026-03-09 22:21:53','2026-05-08 12:21:07',NULL),
(5,12,'Informe de Impacto Ambiental','',1,1,'2026-03-09 22:21:53','2026-05-08 12:21:07',NULL),
(6,14,'carpeta tecnica','',1,0,'2026-03-11 11:58:01','2026-03-26 22:43:20',NULL),
(7,28,'carpeta tecnica','',0,0,'2026-03-30 14:05:05','2026-04-01 13:01:35','2026-04-01 13:01:35'),
(8,28,'logo del proyecto','',0,0,'2026-03-30 14:05:05','2026-04-01 13:01:35','2026-04-01 13:01:35'),
(9,29,'ASasASs','https://drive.google.com/drive/folders/12ACVB7eIunBiRwLgHFM7z_wf8y6VdVJC',0,0,'2026-03-30 16:02:36','2026-06-24 15:58:55',NULL),
(10,28,'Documentaciones','https://drive.google.com/drive/folders/1gv1GGDc5a_BOor_uDP9pOCJQDvXS9o82?usp=sharing',0,0,'2026-04-01 13:01:35','2026-05-28 02:58:46',NULL),
(11,28,'repo de GitHub','https://github.com/codinaguillermo/gestion-proyectos-backend.git',0,0,'2026-04-01 13:04:36','2026-05-28 02:58:46',NULL),
(12,28,'videos tutoriales','https://www.youtube.com/watch?v=0id11qZBBJY',0,0,'2026-04-01 13:05:53','2026-05-28 02:58:46',NULL),
(13,30,'carpet tecnica','https://drive.google.com/drive/u/3/folders/1TaJIrX4IaxkvP_Hp5H7db7nB0MvvudmS',0,0,'2026-04-07 15:24:43','2026-06-28 13:42:03',NULL),
(14,12,'mapa mental del proyecto','https://www.linkedin.com/feed/update/urn:li:activity:7443820341753335808/',0,0,'2026-04-09 20:15:47','2026-05-08 12:21:07',NULL),
(15,24,'carpeta del proyecto','https://drive.google.com/drive/folders/1iLBGhWKBpsyNFgqzKffH0rKTbvLNvQsc?usp=drive_link',0,0,'2026-04-30 20:21:44','2026-06-18 21:48:25',NULL),
(16,25,'Anteproyecto','https://docs.google.com/document/d/1IYopcFlQWyscb9VKX3sUwrBVWb526FDQ/edit?usp=sharing&ouid=117136657183349888247&rtpof=true&sd=true',0,0,'2026-05-07 14:15:30','2026-06-23 23:54:02','2026-06-23 23:54:02'),
(17,26,'Documentacion del proyecto','https://drive.google.com/drive/folders/1ytdQQBeEc90CUG-WMxx0vw0sSesgxIKh?usp=drive_link',0,0,'2026-05-07 14:25:58','2026-06-24 16:04:05',NULL),
(18,26,'El problema, objetivos y justificación (Toledo)','https://docs.google.com/document/d/147lK5OXNdZBVcwx2QBTMRGZhE8vnuEC3/edit?usp=drive_link&ouid=106114398104167453070&rtpof=true&sd=true',0,0,'2026-05-07 14:27:20','2026-05-15 17:06:07','2026-05-15 17:06:07'),
(19,27,'ALARMA VECINAL','https://docs.google.com/document/d/1Rk_XhdW7Uwp4L297JOQqk473-PxO_CgyXLMgHxB25eY/edit?usp=drivesdk',0,0,'2026-05-07 15:06:35','2026-06-27 19:13:30',NULL),
(20,23,'Carpeta Tecnica','https://drive.google.com/drive/folders/11I6PohB9bXQ6-6sUoTSmh6RQSCyzJfPB?usp=drive_link',0,0,'2026-05-12 19:21:01','2026-05-21 15:17:55','2026-05-21 15:17:55'),
(21,19,'Carpeta Tecnica','https://docs.google.com/document/d/1R3YTI0mCumkS032IAz9PEMUHwxKLkdUGCxhVDAF-XOs/edit?tab=t.0',0,0,'2026-05-13 11:36:17','2026-06-18 21:35:11',NULL),
(22,21,'https://docs.google.com/document/d/1rhy8FbuOKTiyPxmy2BpIn_sUA3TmRUgZ/edit?usp=sharing&ouid=116401415615356842781&rtpof=true&sd=true   ANTEPROYECTO','',0,0,'2026-05-14 15:38:27','2026-05-14 15:39:10','2026-05-14 15:39:10'),
(23,21,'ANTEPROYECTO','https://docs.google.com/document/d/1rhy8FbuOKTiyPxmy2BpIn_sUA3TmRUgZ/edit?usp=sharing&ouid=116401415615356842781&rtpof=true&sd=true',0,0,'2026-05-14 15:39:10','2026-06-27 19:31:36',NULL),
(24,26,'Anteproyecto de Investigación','https://docs.google.com/document/d/1ADfmlVXr1v-g8qtHMeoLvjYhBsbGvADH/edit?usp=sharing&ouid=106114398104167453070&rtpof=true&sd=true',0,0,'2026-05-15 17:06:07','2026-06-24 16:04:05',NULL),
(25,22,'carpeta del proyecto','https://drive.google.com/drive/folders/1kv-fQ19ir6T5rW9blVHczm37rbm-Zjp3?usp=drive_link',0,0,'2026-05-15 22:55:06','2026-05-15 22:55:25','2026-05-15 22:55:25'),
(26,22,'acuerdo pedagogico de viabilidad','https://drive.google.com/file/d/10DAIvTy_t110t8I0giQplVQOC-EkVnS7/view?usp=drive_link',0,0,'2026-05-15 22:55:25','2026-06-04 14:37:08',NULL),
(27,22,'documentacion detallada de nine lives edu','https://docs.google.com/document/d/15FptslyFy0d4OYjc-P_aD9e7uX2GeaBv/edit?usp=drive_link&ouid=105791683538961448713&rtpof=true&sd=true',0,0,'2026-05-15 22:55:25','2026-06-04 14:37:08',NULL),
(28,22,'marco teorico','https://docs.google.com/document/d/1JBQmmxniWJ91hbbLPIg-9p-S8YHg5h4i/edit?usp=sharing&ouid=105791683538961448713&rtpof=true&sd=true',0,0,'2026-05-15 22:55:25','2026-06-04 14:37:08',NULL),
(29,22,'carpeta de campo','https://docs.google.com/document/d/1nR00HPRJNAHjMA9-ikaOqqafA9iROMbqimJVFxLtnLM/edit?usp=sharing',0,0,'2026-05-15 22:55:25','2026-06-04 14:37:08',NULL),
(30,22,'capeta del proyecto','https://drive.google.com/drive/folders/1kv-fQ19ir6T5rW9blVHczm37rbm-Zjp3?usp=drive_link',0,0,'2026-05-15 22:55:55','2026-06-04 14:37:08',NULL),
(31,20,'Carpeta de campo','https://drive.google.com/drive/u/0/folders/1-oCHukxmtv_QSeYYmHWkr5AyFeCpCyHb',0,0,'2026-05-15 23:05:24','2026-06-18 22:42:28','2026-06-18 22:42:28'),
(32,23,'Maquetados','https://drive.google.com/file/d/19IU_NUaSGYCzojVwVu-D5VJemq9tu1Eu/view?usp=sharing',0,0,'2026-05-20 13:44:42','2026-05-20 14:20:22','2026-05-20 14:20:22'),
(33,23,'Maquetado','https://drive.google.com/file/d/1jxwXZ_54AC3BH-YYkTCxjASfRKu9EhM5/view?usp=sharing',0,0,'2026-05-20 14:20:22','2026-05-21 13:18:04','2026-05-21 13:18:04'),
(34,23,'Carpeta SAE','https://drive.google.com/drive/folders/11I6PohB9bXQ6-6sUoTSmh6RQSCyzJfPB?usp=sharing',0,0,'2026-05-21 11:13:26','2026-06-17 13:50:27','2026-06-17 13:50:27'),
(35,27,'propuesta inicial del proyecto.','https://drive.google.com/drive/folders/1JrXmyEXlJYzUA1UjTG8eW_B5gtTTxDv7',0,0,'2026-05-21 12:10:55','2026-06-27 19:13:30',NULL),
(36,25,'Marco Teorico','https://docs.google.com/document/d/1AZbYxAYfl-0-oOZNT20cRei08e3Y4VCb/edit?usp=sharing&ouid=111736104647668007534&rtpof=true&sd=true',0,0,'2026-05-21 12:12:39','2026-06-09 23:50:01','2026-06-09 23:50:01'),
(37,25,'prueba','https://drive.google.com/drive/folders/1zuNjHvbxhSS6kFAaw1eXzM1pkxV4HOZV',0,0,'2026-05-21 13:15:25','2026-05-21 13:17:16','2026-05-21 13:17:16'),
(38,20,'Pagina Web \"PenyyRoyalStudio\"','https://drive.google.com/drive/u/0/folders/1HyXRaEwhbq0pf4GyimDQAZ5YDmmh80BE',0,0,'2026-06-03 16:33:45','2026-06-03 21:25:15','2026-06-03 21:25:15'),
(39,20,'Carpeta sobre la Pagina Web','https://drive.google.com/drive/u/0/folders/155Ta8L4sHRp0jrMsMkkTAJkVpQjlCPQW',0,0,'2026-06-03 21:25:15','2026-06-18 22:42:28','2026-06-18 22:42:28'),
(40,19,'Repo de Github','https://github.com/Taykl12/Proyecto',0,0,'2026-06-05 13:48:18','2026-06-18 21:35:11',NULL),
(41,25,'Marco Teorico','https://docs.google.com/document/d/1k-igoyjVk-Y9q_mFivzlXoAHnHBRpLyx/edit?usp=sharing&ouid=106867633441596901528&rtpof=true&sd=true',0,0,'2026-06-09 23:50:01','2026-06-23 23:54:02','2026-06-23 23:54:02'),
(42,27,'carpeta anteproyecto.','https://docs.google.com/document/d/1Y6MvSZoVnnWrXAf7iIpevF5h9qIpzcHOL3rntY76XVY/edit?usp=sharing',0,0,'2026-06-10 13:02:26','2026-06-27 19:13:30',NULL),
(43,23,'Carpeta Anteproyecto','https://docs.google.com/document/d/1HHyLwXLVu3Q06aTdXZ0xCij4DxHP7Hvn/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0,0,'2026-06-17 13:50:27','2026-06-18 15:48:40','2026-06-18 15:48:40'),
(44,23,'Antigua Carpeta Raiz SAE','https://drive.google.com/drive/folders/11I6PohB9bXQ6-6sUoTSmh6RQSCyzJfPB?usp=sharing',0,0,'2026-06-17 13:55:10','2026-06-18 21:22:45',NULL),
(45,30,'Avances - fotos','https://drive.google.com/drive/u/3/folders/1rYkhG1Zo10EJet_tLhIn5IpsywAlrwru',0,0,'2026-06-18 13:09:53','2026-06-28 13:42:03',NULL),
(46,23,'Carpeta anteproyecto','https://docs.google.com/document/d/1mHF22_RHFAs4i79aOeKdtljP7VvYHPdr/edit?usp=sharing&ouid=105208598173841691595&rtpof=true&sd=true',0,0,'2026-06-18 15:49:40','2026-06-18 21:22:45',NULL),
(47,25,'Anteproyecto','https://docs.google.com/document/d/1gb1ZbSiB-fyQzyxsgCQOSEN4HhNtdEpP/edit?usp=sharing&ouid=117136657183349888247&rtpof=true&sd=true',0,0,'2026-06-23 23:54:02','2026-06-23 23:54:02',NULL),
(48,30,'presentaciones del 2/7','https://drive.google.com/drive/u/3/folders/1LHf9R4FBBlDrV2_j9I9v5SZvR8AfpS3I',0,0,'2026-06-28 13:40:59','2026-06-28 13:42:03',NULL),
(49,30,'codigo del hardware','https://docs.google.com/document/d/1m5pyQjkjassVmzg3wjpPiFzgednWjlbh8v76P-9OJCI/edit?usp=sharing',0,0,'2026-06-28 13:42:03','2026-06-28 13:42:03',NULL);
/*!40000 ALTER TABLE `Entregables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones_proyecto`
--

DROP TABLE IF EXISTS `calificaciones_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `hito_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nota` decimal(4,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_calificaciones_proyecto` (`proyecto_id`),
  KEY `fk_calificaciones_hito` (`hito_id`),
  KEY `fk_calificaciones_docente` (`usuario_id`),
  CONSTRAINT `fk_calificaciones_docente` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_calificaciones_hito` FOREIGN KEY (`hito_id`) REFERENCES `hitos_evaluacion` (`id`),
  CONSTRAINT `fk_calificaciones_proyecto` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones_proyecto`
--

LOCK TABLES `calificaciones_proyecto` WRITE;
/*!40000 ALTER TABLE `calificaciones_proyecto` DISABLE KEYS */;
INSERT INTO `calificaciones_proyecto` VALUES
(1,12,1,1,8.00,'bien!','2026-05-27','2026-05-27 02:10:51','2026-05-27 02:10:51'),
(2,12,2,1,4.00,'todo mal en este proyecto','2026-05-27','2026-05-27 02:11:01','2026-05-27 02:11:01'),
(3,23,4,1,7.00,'explicaron qué tarea están haciendo y como se están organizando para llegar al siguiente objetivo, y de cómo resolver los inconvenientes que están teniendo.','2026-05-28','2026-05-28 02:42:07','2026-05-28 02:42:07'),
(4,19,4,1,7.00,'explicaron qué tarea están haciendo y como se están organizando para llegar al siguiente objetivo, y de cómo resolver los inconvenientes que están teniendo.','2026-05-28','2026-05-28 02:44:11','2026-05-28 02:44:11'),
(5,21,4,1,5.00,'no estan avanzando, van muy lento. y desorganizados. Poca interacción entre ellos','2026-05-28','2026-05-28 02:46:51','2026-05-28 02:46:51'),
(6,26,4,1,7.00,'mostraron organización, coordinación y avances en el proyecto, elaboración del esquema de la BD, y Diccionario de datos. ','2026-05-28','2026-05-28 02:56:39','2026-05-28 02:56:39'),
(7,22,4,1,5.00,'falta de cooperación entre los alumnos. Manifiestan falta de responsabilidades entre ellos, generando estrés interno. sobrecarga de tareas en uno, falta de tareas en otros','2026-05-28','2026-05-28 15:24:10','2026-05-28 15:24:10'),
(8,20,4,1,7.00,'vienen trabajando bien','2026-06-01','2026-06-01 23:53:33','2026-06-01 23:53:33'),
(9,29,4,1,1.00,'no hay Historias de  usuario cargadas hasta la  fecha. No muestran avances , No hay entrevistas al uauario, ni investigacion de herramientas tecnológicas. No hay tareas creadas en GEPRES, ni detalle de que está haciendo cada miembro del equipo','2026-06-02','2026-06-02 20:01:02','2026-06-02 20:01:02'),
(10,21,4,1,6.00,'falta subir mas US y documentaciones a GEPRES','2026-06-04','2026-06-04 03:08:13','2026-06-04 03:08:13'),
(11,25,4,1,6.00,'falta crear mas US y documentaciones en GEPRES','2026-06-04','2026-06-04 03:08:59','2026-06-04 03:08:59'),
(12,27,4,1,3.00,'no avanzaron en nada de crar US, tareas, documentaciones, roles, responsabiliades','2026-06-04','2026-06-04 12:30:05','2026-06-04 12:30:05'),
(13,27,4,24,3.00,'No mostraron en tiempo y forma ningún tipo de avance, en el proyecto final.','2026-06-04','2026-06-04 19:54:17','2026-06-04 19:54:17'),
(14,29,4,1,5.00,'vienen muy lento con los avances. Mostraron algo del squema de la BD. Aun les falta  mucho. Hicieron un modelado del  sistema WEB, pero les falta  conocer más el flujo de trabajo de la farmacia. Entender mejor como se realiza la gestion de stock de los medicamentos','2026-06-05','2026-06-05 15:38:42','2026-06-05 15:38:42'),
(15,21,4,1,7.00,'mostraron avances','2026-06-08','2026-06-08 22:36:14','2026-06-08 22:36:14'),
(16,29,4,1,3.00,'muy quedados están. No avanzan en el esquema de la BD. Estan en teoría haciendo el maquedato de la página, no mostraron nada en concreto,  ni siquiera de lo que dicen que estuvieron trabajando','2026-06-10','2026-06-10 15:51:36','2026-06-10 15:51:36'),
(17,23,4,1,8.00,'mostraron avances en todo que respecta a documentaciones','2026-06-10','2026-06-10 16:05:30','2026-06-10 16:05:30'),
(18,24,4,1,6.00,'continuan avanzando','2026-06-12','2026-06-12 00:57:19','2026-06-12 00:57:19'),
(19,19,4,24,4.00,'NO TIENEN NADA DE HARDWARE.','2026-06-16','2026-06-16 17:10:02','2026-06-16 17:10:02'),
(20,30,4,24,7.00,'Muestra fotos del dispositivo. Clase anterior mostraron funcionamiento.','2026-06-16','2026-06-16 17:15:46','2026-06-16 17:15:46'),
(21,27,4,24,5.00,'No muestran ningun adelanto, siguen conversando en tratar de hacer el proyecto.','2026-06-16','2026-06-16 17:16:38','2026-06-16 17:16:38'),
(22,29,4,24,3.00,'NO TIENEN NADA QUE MOSTRAR.... SOLO EN UNA SIMPLE IDEA, MANIFIESTAN QUE BAUTISTA ERA EL ENCARGADO DE HACER LAS BASES DE DATOS Y POR ESO NO PUEDEN AVANZAR....','2026-06-16','2026-06-16 17:18:20','2026-06-16 17:18:20'),
(23,26,4,24,8.00,'bASE DE DATOS COMIENZA A FUNCIONAR.','2026-06-16','2026-06-16 17:24:37','2026-06-16 17:24:37'),
(24,19,4,24,4.00,'Al sugerirle ver y escuchar consejos de Lautaro con respecto al funcionamiento del lector de huellas respondio que el NO VA A TENER ESE PROBLEMA, ','2026-06-16','2026-06-16 17:27:14','2026-06-16 17:29:12'),
(25,25,4,24,6.00,'Presentan el hardware en sus respectivas bolsitas, NO VERIFICARON NADA TODAVIA.','2026-06-16','2026-06-16 17:35:50','2026-06-16 17:35:50'),
(26,24,4,24,5.00,'NO HAY HARDWARE NO TENIAN EL DINERO PARA COMPRAR..... LOS COMPONENTES','2026-06-16','2026-06-16 17:46:09','2026-06-16 17:46:09'),
(27,22,4,24,6.00,'HOY NO TIENE NADA del hardware, MANIFIESTA QUE EL VIERNES TIENE Y PRESENTA (MAIA)','2026-06-16','2026-06-16 18:11:46','2026-06-16 18:15:15'),
(28,23,4,24,6.00,'Hoy no tienen nada del hardware para la implementación.','2026-06-16','2026-06-16 18:22:57','2026-06-16 18:28:15'),
(29,21,4,24,5.00,'Hoy no tienen el hardware Ni siquiera en fotos.','2026-06-16','2026-06-16 18:30:10','2026-06-16 18:30:10'),
(30,20,4,24,5.00,'Hoy NO TIENEN NADA DEL HARDWARE  A UTILIZAR. Tienen que hacer el pedido a China, (NO NOS HACEMOS CARGO DE LAS DEMORAS)))))))','2026-06-16','2026-06-16 18:32:02','2026-06-16 18:32:02'),
(31,30,4,1,8.00,'mostraron avances del maquetado, y su userFlow directamente en el celular','2026-06-18','2026-06-18 21:14:23','2026-06-18 21:14:23'),
(32,23,4,1,8.00,'mostraron avances','2026-06-18','2026-06-18 21:19:50','2026-06-18 21:21:17'),
(33,19,4,1,9.00,'mostraron avances del SW ya conectado a la BD','2026-06-18','2026-06-18 21:30:35','2026-06-18 21:30:35'),
(34,26,4,1,9.00,'mostraron avances sobre temas de SW. tienen cosas que averiguar sobre listas de precios','2026-06-17','2026-06-18 21:36:44','2026-06-18 21:36:44'),
(35,24,4,1,4.00,'no tienen el Diagrama ER generado todavia, y no avanzaron con a maquetación','2026-06-17','2026-06-18 21:43:22','2026-06-18 21:43:22'),
(36,29,4,1,6.00,'mostraron esquema de BD. Tienen que avanzar en Manual de usuario, UserFlow ','2026-06-24','2026-06-24 15:55:20','2026-06-24 15:55:20'),
(37,27,4,1,2.00,'no hay tareas cargas en las US de GEPRES','2026-06-24','2026-06-24 16:00:14','2026-06-24 16:00:14'),
(38,26,4,1,9.00,'mostraron avances positivos','2026-06-24','2026-06-24 16:00:57','2026-06-24 16:00:57'),
(39,27,4,2,1.00,'no avanzaron en casi nada. No hay DER, No hay documentaciones de entrevistas a algun usuario. No hay ninguna pantalla diseñanda ni maquetada de la aplicacion. Ni siquiera que tecnologia para el SW van a usar','2026-06-26','2026-06-27 19:10:05','2026-06-27 19:10:05'),
(40,21,4,2,6.00,'vienen demorados con la aprobacion del maquetado por parte del usuario. Aun no tienen el Diagrama ER, el maquetado esta bien, pero falta el OK del usuario y eso los frena','2026-06-26','2026-06-27 19:19:51','2026-06-27 19:19:51');
/*!40000 ALTER TABLE `calificaciones_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuelas`
--

DROP TABLE IF EXISTS `escuelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `escuelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_corto` varchar(50) NOT NULL,
  `nombre_largo` varchar(255) NOT NULL,
  `cue` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuelas`
--

LOCK TABLES `escuelas` WRITE;
/*!40000 ALTER TABLE `escuelas` DISABLE KEYS */;
INSERT INTO `escuelas` VALUES
(1,'EET24','EET N° 24 Simón de Iriondo','1232','aaaaasdas','2026-02-10 16:14:49','2026-02-12 19:55:43'),
(2,'EET33','Esc. Tecnica de Barranqueras','232323','algun lado 123','2026-02-12 19:56:08','2026-03-09 21:21:27');
/*!40000 ALTER TABLE `escuelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES
(1,'Sin Especialidad',NULL),
(2,'GAO',NULL),
(3,'IPP',NULL),
(4,'TEP',NULL);
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_proyecto`
--

DROP TABLE IF EXISTS `estados_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombre_2` (`nombre`),
  UNIQUE KEY `nombre_3` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_proyecto`
--

LOCK TABLES `estados_proyecto` WRITE;
/*!40000 ALTER TABLE `estados_proyecto` DISABLE KEYS */;
INSERT INTO `estados_proyecto` VALUES
(1,'ABIERTO'),
(2,'CERRADO'),
(3,'EN REVISIÓN');
/*!40000 ALTER TABLE `estados_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_tarea`
--

DROP TABLE IF EXISTS `estados_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_tarea` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_tarea`
--

LOCK TABLES `estados_tarea` WRITE;
/*!40000 ALTER TABLE `estados_tarea` DISABLE KEYS */;
INSERT INTO `estados_tarea` VALUES
(1,'TO DO'),
(2,'IN_PROGRESS'),
(3,'TESTING'),
(4,'READY FOR REVIEW'),
(5,'DONE');
/*!40000 ALTER TABLE `estados_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_us`
--

DROP TABLE IF EXISTS `estados_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_us`
--

LOCK TABLES `estados_us` WRITE;
/*!40000 ALTER TABLE `estados_us` DISABLE KEYS */;
INSERT INTO `estados_us` VALUES
(3,'BLOQUEADA'),
(2,'EN DESARROLLO'),
(1,'PENDIENTE'),
(4,'TERMINADA');
/*!40000 ALTER TABLE `estados_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hitos_evaluacion`
--

DROP TABLE IF EXISTS `hitos_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hitos_evaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hitos_evaluacion`
--

LOCK TABLES `hitos_evaluacion` WRITE;
/*!40000 ALTER TABLE `hitos_evaluacion` DISABLE KEYS */;
INSERT INTO `hitos_evaluacion` VALUES
(1,'Anteproyecto Etapa1','2026-05-27 01:46:28','2026-05-27 01:46:28'),
(2,'Anteproyecto Etapa2','2026-05-27 01:46:28','2026-05-27 01:46:28'),
(3,'Anteproyecto Etapa3','2026-05-27 01:46:28','2026-05-27 01:46:28'),
(4,'nota Genérica','2026-05-27 01:46:28','2026-05-27 01:46:28');
/*!40000 ALTER TABLE `hitos_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especialidad_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `anio` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_materia_anio_especialidad` (`especialidad_id`,`nombre`,`anio`),
  CONSTRAINT `fk_materia_especialidad_NEW` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES
(1,4,'EVALUACION DE PROYECTO',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(2,4,'APLICACIONES DE NUEVAS TECNOLOGÍAS',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(3,4,'LENGUAJE DE PROGRAMACION III',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(4,4,'DESARROLLO DE SOFWARE PARA PLATAFORMAS MOVILES',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(5,4,'LABORATORIO DE INFORMATICA',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(6,4,'DISEÑO E IMPLEMENTACION DE SITIO WEB',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(7,4,'DISEÑO DE INTERFACES',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(8,4,'PROYECTO INTEGRADOR',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(9,4,'PRACTICAS PROFESIONALIZANTES',6,'2026-06-01 23:36:11','2026-06-27 01:49:35'),
(11,4,'LENGUA Y LITERATURA',3,'2026-06-27 17:56:57','2026-06-27 18:03:18'),
(12,4,'LENGUA EXTRANJERA',3,'2026-06-27 17:57:23','2026-06-27 18:03:18'),
(13,4,'EDUCACIÓN FÍSICA',3,'2026-06-27 17:57:45','2026-06-27 18:03:18'),
(14,4,'FORMACIÓN ÉTICA Y CIUDADANA',3,'2026-06-27 17:58:07','2026-06-27 18:03:18'),
(15,4,'GEOGRAFÍA',3,'2026-06-27 17:58:24','2026-06-27 18:03:18'),
(16,4,'HISTORIA',3,'2026-06-27 17:58:39','2026-06-27 18:03:18'),
(17,4,'MATEMATICA APLICADA',3,'2026-06-27 17:58:50','2026-06-27 18:03:18'),
(18,4,'FISICA APLICADA',3,'2026-06-27 17:59:09','2026-06-27 18:03:18'),
(19,4,'QUIMICA APLICADA',3,'2026-06-27 17:59:25','2026-06-27 18:03:18'),
(20,4,'ARQUITECTURA DE HARDWARE',3,'2026-06-27 17:59:44','2026-06-27 18:03:18'),
(21,4,'INSTALACIONES BÁSICAS DE SOFTWARE',3,'2026-06-27 18:00:20','2026-06-27 18:00:20'),
(22,4,'SISTEMAS OPERATIVOS',3,'2026-06-27 18:01:42','2026-06-27 18:01:42'),
(23,4,'LABORATORIO DE PROGRAMACION',3,'2026-06-27 18:04:05','2026-06-27 18:04:05'),
(24,4,'TALLER DE ASISTENCIA A UTILITARIOS',3,'2026-06-27 18:04:22','2026-06-27 18:04:22'),
(25,4,'TALLER DE HARDWARE Y COMPONENTES',3,'2026-06-27 18:04:35','2026-06-27 18:04:35'),
(32,4,'VINCULACIÓN PARA LA VIDA Y EL TRABAJO I',4,'2026-06-27 18:09:45','2026-06-27 18:09:45'),
(33,4,'LENGUA Y LITERATURA',4,'2026-06-27 19:07:34','2026-06-27 19:07:34'),
(34,4,'LENGUA EXTRANJERA',4,'2026-06-27 19:33:22','2026-06-27 19:33:22'),
(35,4,'EDUCACIÓN FÍSICA',4,'2026-06-27 19:33:42','2026-06-27 19:33:42'),
(36,4,'FORMACIÓN ÉTICA Y CIUDADANA',4,'2026-06-27 19:34:03','2026-06-27 19:34:03'),
(37,4,'HISTORIA',4,'2026-06-27 19:34:25','2026-06-27 19:34:25'),
(40,4,'MATEMATICA APLICADA',4,'2026-06-27 19:35:50','2026-06-27 19:35:50'),
(41,4,'SISTEMAS DIGITALES',4,'2026-06-27 19:36:09','2026-06-27 19:36:09'),
(42,4,'BASE DE DATOS I',4,'2026-06-27 19:36:26','2026-06-27 19:36:26'),
(43,4,'MODELOS Y SISTEMAS',4,'2026-06-27 19:36:36','2026-06-27 19:36:36'),
(44,4,'MARCO JURIDICO',4,'2026-06-27 19:37:05','2026-06-27 19:37:05'),
(45,4,'LENGUAJE DE PROGRAMACIÓN I',4,'2026-06-27 19:37:22','2026-06-27 19:37:22'),
(46,4,'REDES INFORMÁTICAS',4,'2026-06-27 19:37:38','2026-06-27 19:37:38'),
(47,4,'DISEÑO WEB',4,'2026-06-27 19:37:48','2026-06-27 19:37:48'),
(48,4,'ARQUITECTURA DE BASE DE DATOS',4,'2026-06-27 19:38:01','2026-06-27 19:38:01'),
(49,4,'LENGUA Y LITERATURA',5,'2026-06-27 19:38:16','2026-06-27 19:38:16'),
(50,4,'LENGUA EXTRANJERA',5,'2026-06-27 19:38:26','2026-06-27 19:38:26'),
(51,4,'EDUCACIÓN FÍSICA',5,'2026-06-27 19:38:40','2026-06-27 19:38:40'),
(52,4,'VINCULACIÓN PARA LA VIDA Y EL MUNDO DEL TRABAJO II',5,'2026-06-27 19:38:52','2026-06-27 19:38:52'),
(53,4,'PROBABILIDAD Y ESTADISTICA',5,'2026-06-27 19:39:17','2026-06-27 19:39:17'),
(54,4,'SISTEMAS DIGITALES II',5,'2026-06-27 19:39:26','2026-06-27 19:39:26'),
(55,4,'BASE DE DATOS II',5,'2026-06-27 19:39:41','2026-06-27 19:39:41'),
(56,4,'SEGURIDAD INFORMATICA',5,'2026-06-27 19:39:50','2026-06-27 19:39:50'),
(57,4,'SISTEMAS DE GESTIÓN Y AUTOGESTIÓN',5,'2026-06-27 19:40:12','2026-06-27 19:40:12'),
(58,4,'LENGUAJE DE PROGRAMACION II',5,'2026-06-27 19:40:21','2026-06-27 19:40:21'),
(59,4,'PROGRAMAS Y CONTROLES AUTOMATIZADOS',5,'2026-06-27 19:40:34','2026-06-27 19:40:34'),
(60,4,'DESARROLLO DE APLICACIONES WEB',5,'2026-06-27 19:40:45','2026-06-27 19:40:45'),
(61,4,'SISTEMAS Y TELECOMUNICACIONES',5,'2026-06-27 19:41:08','2026-06-27 19:41:08'),
(62,4,'LENGUA Y LITERATURA',6,'2026-06-27 19:41:30','2026-06-27 19:41:30'),
(63,4,'LENGUA EXTRANJERA',6,'2026-06-27 19:41:41','2026-06-27 19:41:41'),
(64,4,'EMPRENDEDORISMO',6,'2026-06-27 19:41:55','2026-06-27 19:41:55'),
(65,4,'EDUCACION FISICA',6,'2026-06-27 19:42:07','2026-06-27 19:42:07'),
(66,4,'VINCULACIÓN PARA LA VIDA Y EL MUNDO DEL TRABAJO III',6,'2026-06-27 19:42:26','2026-06-27 19:42:26'),
(67,4,'PRACTICAS PROFESIONALIZANTES DEL SECTOR PROGRAMACIÓN',6,'2026-06-27 19:44:06','2026-06-27 19:44:06');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias_vieja`
--

DROP TABLE IF EXISTS `materias_vieja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias_vieja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especialidad_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `anio` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_materia_especialidad` (`especialidad_id`,`nombre`),
  CONSTRAINT `fk_materia_especialidad` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias_vieja`
--

LOCK TABLES `materias_vieja` WRITE;
/*!40000 ALTER TABLE `materias_vieja` DISABLE KEYS */;
INSERT INTO `materias_vieja` VALUES
(1,4,'EVALUACION DE PROYECTO','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(2,4,'APLICACIONES DE NUEVAS TECNOLOGÍAS','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(3,4,'LENGUAJE DE PROGRAMACION III','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(4,4,'DESARROLLO DE SOFWARE PARA PLATAFORMAS MOVILES','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(5,4,'LABORATORIO DE INFORMATICA','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(6,4,'DISEÑO E IMPLEMENTACION DE SITIO WEB','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(7,4,'DISEÑO DE INTERFACES','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(8,4,'PROYECTO INTEGRADOR','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(9,4,'PRACTICAS PROFESIONALIZANTES','2026-06-01 23:36:11','2026-06-27 01:49:35',6),
(11,4,'LENGUA Y LITERATURA','2026-06-27 17:56:57','2026-06-27 18:03:18',3),
(12,4,'LENGUA EXTRANJERA','2026-06-27 17:57:23','2026-06-27 18:03:18',3),
(13,4,'EDUCACIÓN FÍSICA','2026-06-27 17:57:45','2026-06-27 18:03:18',3),
(14,4,'FORMACIÓN ÉTICA Y CIUDADANA','2026-06-27 17:58:07','2026-06-27 18:03:18',3),
(15,4,'GEOGRAFÍA','2026-06-27 17:58:24','2026-06-27 18:03:18',3),
(16,4,'HISTORIA','2026-06-27 17:58:39','2026-06-27 18:03:18',3),
(17,4,'MATEMATICA APLICADA','2026-06-27 17:58:50','2026-06-27 18:03:18',3),
(18,4,'FISICA APLICADA','2026-06-27 17:59:09','2026-06-27 18:03:18',3),
(19,4,'QUIMICA APLICADA','2026-06-27 17:59:25','2026-06-27 18:03:18',3),
(20,4,'ARQUITECTURA DE HARDWARE','2026-06-27 17:59:44','2026-06-27 18:03:18',3),
(21,4,'INSTALACIONES BÁSICAS DE SOFTWARE','2026-06-27 18:00:20','2026-06-27 18:00:20',3),
(22,4,'SISTEMAS OPERATIVOS','2026-06-27 18:01:42','2026-06-27 18:01:42',3),
(23,4,'LABORATORIO DE PROGRAMACION','2026-06-27 18:04:05','2026-06-27 18:04:05',3),
(24,4,'TALLER DE ASISTENCIA A UTILITARIOS','2026-06-27 18:04:22','2026-06-27 18:04:22',3),
(25,4,'TALLER DE HARDWARE Y COMPONENTES','2026-06-27 18:04:35','2026-06-27 18:04:35',3),
(32,4,'VINCULACIÓN PARA LA VIDA Y EL TRABAJO I','2026-06-27 18:09:45','2026-06-27 18:09:45',4);
/*!40000 ALTER TABLE `materias_vieja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_docentes`
--

DROP TABLE IF EXISTS `notas_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_docentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `tipo` enum('Recordatorio','Tarea','Aviso importante') DEFAULT 'Recordatorio',
  `estado` enum('PENDIENTE','TERMINADA') DEFAULT 'PENDIENTE',
  `proyecto_id` int(11) NOT NULL,
  `creador_id` int(11) NOT NULL,
  `destino_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_notas_proyecto` (`proyecto_id`),
  KEY `fk_notas_creador` (`creador_id`),
  KEY `fk_notas_destino` (`destino_id`),
  CONSTRAINT `fk_notas_creador` FOREIGN KEY (`creador_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_notas_destino` FOREIGN KEY (`destino_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_notas_proyecto` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_docentes`
--

LOCK TABLES `notas_docentes` WRITE;
/*!40000 ALTER TABLE `notas_docentes` DISABLE KEYS */;
INSERT INTO `notas_docentes` VALUES
(1,'probando','anda? ','Recordatorio','TERMINADA',30,1,1,'2026-05-15 01:56:07'),
(2,'prueba 2','sera???','Tarea','TERMINADA',30,1,1,'2026-05-15 01:56:29'),
(3,'prueba 3','ok ok, si anda bien','Aviso importante','TERMINADA',30,1,1,'2026-05-15 01:56:46'),
(4,'mensaje de prueba','Ricibiste un mensaje mio. felicitaciones','Recordatorio','TERMINADA',30,1,24,'2026-05-19 03:56:35'),
(5,'probando','esto es una prueba','Recordatorio','TERMINADA',12,1,1,'2026-05-19 15:37:34'),
(6,'Lectura','Lee todo los documentos que tienen que ver con las competencias... ja ja ja','Aviso importante','TERMINADA',12,24,1,'2026-05-19 16:08:52'),
(7,'Viabilidad','No te olvides (para todos los proyectos) de cargar el link del driver de los documentos de Viabilidad (escaneados) firmados por nosotros y los chicos. y darle el OK (checkBock) en GEPRES, asi les queda resaltado el VIABILIDAD = True en GEPRES.','Recordatorio','TERMINADA',27,1,1,'2026-05-28 03:03:50'),
(8,'Viabilidad de los proyectos','No te olvides (para todos los proyectos) de cargar el link del driver de los documentos de Viabilidad (escaneados) firmados por nosotros y los chicos. y darle el OK (checkBock) en GEPRES, asi les queda resaltado el VIABILIDAD = True en GEPRES.','Recordatorio','TERMINADA',30,1,24,'2026-05-28 03:05:02'),
(9,'registrar las notas','no te olvides de registrar las  notas por alumno de tu materia','Recordatorio','PENDIENTE',19,1,19,'2026-06-04 22:36:45'),
(10,'registra notas','no te olvides de registrar las  notas por alumno de tu materia','Recordatorio','TERMINADA',12,1,1,'2026-06-04 22:37:37'),
(11,'registrar las notas de los alumnos','no te olvides de registrar las  notas por alumno de tu materia','Tarea','TERMINADA',12,1,1,'2026-06-04 22:39:04'),
(12,'Viabilidad','en este link tenés que cargar todos los scaneos de las hojas de viabilidad\nhttps://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing','Recordatorio','PENDIENTE',27,1,24,'2026-06-08 22:37:50');
/*!40000 ALTER TABLE `notas_docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridades`
--

DROP TABLE IF EXISTS `prioridades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prioridades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `peso` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridades`
--

LOCK TABLES `prioridades` WRITE;
/*!40000 ALTER TABLE `prioridades` DISABLE KEYS */;
INSERT INTO `prioridades` VALUES
(1,'BAJA',10),
(2,'MEDIA',20),
(3,'ALTA',30),
(4,'URGENTE',40);
/*!40000 ALTER TABLE `prioridades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridades_us`
--

DROP TABLE IF EXISTS `prioridades_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prioridades_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `peso` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridades_us`
--

LOCK TABLES `prioridades_us` WRITE;
/*!40000 ALTER TABLE `prioridades_us` DISABLE KEYS */;
INSERT INTO `prioridades_us` VALUES
(1,'BAJA',1),
(2,'MEDIA',2),
(3,'ALTA',3);
/*!40000 ALTER TABLE `prioridades_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `docente_owner_id` int(11) DEFAULT NULL,
  `escuela_id` int(11) DEFAULT NULL,
  `objetivo` text DEFAULT NULL,
  `objetivo_bloqueado` tinyint(1) DEFAULT 0,
  `alcance_prototipo` text DEFAULT NULL,
  `alcance_prototipo_bloqueado` tinyint(1) DEFAULT 0,
  `alcance_producto_final` text DEFAULT NULL,
  `alcance_final_bloqueado` tinyint(1) DEFAULT 0,
  `fecha_cierre_1` date DEFAULT NULL,
  `fecha_cierre_2` date DEFAULT NULL,
  `viable` tinyint(1) DEFAULT 0,
  `documento_viabilidad_link` varchar(255) DEFAULT NULL,
  `link_drive` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  KEY `docente_owner_id` (`docente_owner_id`),
  CONSTRAINT `proyectos_ibfk_4` FOREIGN KEY (`estado_id`) REFERENCES `estados_proyecto` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `proyectos_ibfk_5` FOREIGN KEY (`docente_owner_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES
(10,'ejemplo - rastreador de mascotas','',1,'2026-03-04 20:09:07','2026-03-18 10:10:34','2026-03-18 10:10:34',1,1,'',0,'',0,'',0,'2026-04-01','2026-05-01',0,NULL,NULL),
(11,'Ejemplo - regador automaticos de plantas','ac ala descripcion',1,'2026-03-05 15:12:22','2026-03-18 10:10:27','2026-03-18 10:10:27',1,1,'',0,'',0,'',0,'2026-04-26','2026-05-30',0,NULL,NULL),
(12,'Ejemplo - Sistema de Gestión de Huella de Carbono Escolar (EcoTrack 24)','',1,'2026-03-09 22:20:29','2026-05-08 12:21:07',NULL,1,1,'Desarrollar una plataforma integral IoT para medir, visualizar y reducir el consumo eléctrico y la huella de carbono de la institución en tiempo real',1,'Dashboard funcional que reciba datos de 3 nodos sensores (ESP32) ubicados en puntos clave, permitiendo visualizar el consumo actual y generar una alerta si se supera un umbral definido',1,'Red de malla (Mesh) con 50+ sensores, integración con paneles solares, app móvil nativa con gamificación para alumnos y reportes automáticos para el Ministerio de Educación',1,'2026-03-15','2026-03-29',0,'',NULL),
(13,'adadad','ad asdasdasdasdasdasdfas hfkasdhfshdfakhsdkfh kljsadh fkjhsadklfh askl hfd ksadhfkljhasdjklfh ksdjhfk jhsakjldfhaskljh fkljashkfh askhljhdfkja s',1,'2026-03-10 03:13:43','2026-03-10 03:13:49','2026-03-10 03:13:49',1,1,NULL,0,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL),
(14,'control de brazo robotico','sdnfskhdfkjsd hfhsdddkfhsdk fhkjsd h fkjhsdkfkjsd hf sdkjhfkjsd h',1,'2026-03-11 11:55:10','2026-03-30 15:52:43','2026-03-30 15:52:43',1,1,'',0,'',0,'',0,'2026-03-04','2026-05-27',0,NULL,NULL),
(15,'agua savorizada agua rica!','dad sd ad asd asdad a d',1,'2026-03-12 17:47:47','2026-03-30 15:52:51','2026-03-30 15:52:51',1,1,NULL,0,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL),
(16,'auto','hacer un auto',1,'2026-03-13 18:21:39','2026-03-18 10:10:15','2026-03-18 10:10:15',19,1,NULL,0,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL),
(17,'para borrar por docente','',1,'2026-03-17 14:05:37','2026-03-18 10:10:11','2026-03-18 10:10:11',2,1,NULL,0,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL),
(18,'para borrar por docentepara borrar por alumno','',1,'2026-03-17 14:05:52','2026-03-18 10:10:06','2026-03-18 10:10:06',2,1,NULL,0,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL),
(19,'Classify','Sistema GEstion Escolar y de proyectos escolares',1,'2026-03-27 11:25:20','2026-06-18 21:35:11',NULL,1,1,'Desarrollar e implementar un sistema integral de gestión para instituciones educativas que, mediante el uso de tecnología de reconocimiento de huella digital, permita registrar de manera eficiente la asistencia de los estudiantes, así como administrar información relevante como anotaciones académicas y el seguimiento de proyectos, con el fin de optimizar los procesos administrativos, mejorar el control institucional y facilitar la toma de decisiones.',0,'El prototipo consistirá en el desarrollo de una versión funcional inicial de un sistema de gestión para instituciones educativas, que integrará un módulo de registro de asistencia mediante huella digital y un software de administración de estudiantes. Este incluirá funcionalidades básicas como el alta y registro de usuarios, la captura y verificación de huellas para el control de asistencia, la carga de anotaciones y la gestión de proyectos académicos.\n\nEl sistema estará orientado a validar la viabilidad técnica y operativa de la solución, permitiendo simular su uso en un entorno controlado. No se contemplará en esta etapa la implementación a gran escala ni la integración con sistemas externos, priorizando el correcto funcionamiento de las funciones principales, la usabilidad de la interfaz y la confiabilidad en el registro de datos.',0,NULL,0,NULL,NULL,1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing','https://drive.google.com/drive/folders/1Wf-efafhCopvW8q2a2bQCU9B8TY0z8cq?usp=sharing'),
(20,'daw open source  - pedal analogico','',1,'2026-03-27 11:41:19','2026-06-27 19:17:25',NULL,1,1,'El objetivo principal de este proyecto es democratizar la producción musical mediante la creación de un ecosistema integral (software y hardware) que elimine las barreras de entrada para el músico principiante.\n\nA diferencia de los DAWs convencionales del mercado —cuya complejidad técnica y saturación de funciones suelen generar una curva de aprendizaje frustrante para el usuario inexperto—, este proyecto se centra en la simplicidad funcional y la transparencia.\n\nBuscamos desarrollar una estación de trabajo de audio digital que sea:\n\nAccesible y Amigable: Diseñada específicamente para quienes nunca han utilizado un software de producción, priorizando una interfaz intuitiva que permita empezar a grabar en cuestión de minutos, sin necesidad de tutoriales extensos.\n\nFilosofía Open Source: Al ser un software de código abierto, no solo garantizamos el acceso gratuito y legal para cualquier estudiante o artista independiente, sino que fomentamos una comunidad colaborativa. El código está disponible para ser auditado, mejorado y adaptado por otros usuarios, asegurando que el programa evolucione según las necesidades reales de los músicos y no por intereses comerciales.\n\nIntegración Hardware-Software: Al sumar un pedal de efecto analógico de fabricación propia, el objetivo se expande hacia la educación técnica integral, demostrando que un músico puede tener el control total de su cadena de sonido, desde el circuito electrónico del pedal hasta el procesamiento final en la computadora.',0,'El prototipo de este proyecto no busca competir con programas profesionales llenos de funciones complejas, sino demostrar que es posible tener un entorno de grabación funcional, gratuito y fácil de usar. El alcance se divide en dos partes:\n\n1. En el Software (DAW)\nEl prototipo será capaz de realizar las tareas esenciales para un músico que quiere maquetar una idea:\n\nEntrada y Salida de Audio: El usuario podrá conectar su instrumento o micrófono y escuchar lo que toca a través del programa.\n\nGrabación de una Pista: Permitirá grabar una toma de audio y ver la \"onda\" (waveform) en la pantalla en tiempo real.\n\nReproducción Básica: Contará con botones de Play, Stop y una línea de tiempo (timeline) para moverse por la canción.\n\nInterfaz Limpia: La ventana principal mostrará solo lo necesario: controles de volumen, el área de grabación y un metrónomo para mantener el tiempo.\n\nExportación: El prototipo permitirá guardar el resultado final en un archivo de audio (como .wav) para que el músico pueda compartir su creación.\n\n2. En el Hardware (Pedal)\nEl objetivo es entregar un dispositivo físico que cumpla con:\n\nProcesamiento de Señal: El pedal debe recibir la señal de la guitarra y aplicar el efecto de saturación (overdrive) de forma analógica.\n\nControles Físicos: El prototipo tendrá perillas funcionales para ajustar cuánta distorsión queremos y qué tan fuerte suena.\n\nConstrucción Básica: Los componentes estarán montados de forma segura (en una placa de circuito o protoboard avanzada) para asegurar que no haya ruidos molestos ni interferencias al grabar en la computadora.',0,'El objetivo a largo plazo es consolidar una plataforma de producción musical completa, estable y competitiva, que no solo sirva para grabar ideas rápidas, sino para producir canciones finales con calidad de estudio.\n\n1. Software (DAW Completo)\nMultitrack Real: Capacidad para manejar decenas de pistas en simultáneo (voces, guitarras, baterías virtuales) sin caídas de rendimiento.\n\nSoporte Total de Plugins (VST3): Compatibilidad con efectos y sintetizadores de terceros, permitiendo que el usuario expanda su sonido infinitamente.\n\nEdición Avanzada: Herramientas para cortar, pegar, fundir (crossfade) y corregir el tiempo de las grabaciones de forma profesional.\n\nMezcla y Masterización: Un mezclador completo con ecualizadores, compresores y medidores de nivel precisos.\n\nEcosistema Multiplataforma: Versiones nativas para Linux y Windows, aprovechando al máximo el hardware de cualquier computadora (desde netbooks hasta PCs potentes).\n\n2. Hardware (Serie de Pedales)\nGabinete Profesional: El pedal pasará de ser un circuito de prueba a un producto terminado en una caja de aluminio profesional, con pintura y serigrafía resistente.\n\nAlimentación Dual: Posibilidad de usar batería de 9V o fuente de alimentación externa.\n\nCalidad de Audio Superior: Uso de componentes de alta fidelidad para garantizar que el ruido de fondo sea prácticamente inexistente.\n\n3. Comunidad y Documentación\nWiki de Usuario: Un manual completo escrito en lenguaje simple, lejos de los tecnicismos complejos de otros manuales de audio.\n\nRepositorio Colaborativo: Un sistema de GitHub organizado donde programadores de todo el mundo puedan reportar errores o añadir nuevas funciones (como un afinador integrado o nuevos efectos).\n\n',0,NULL,NULL,1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing','https://drive.google.com/drive/folders/1Sxrohnc6ZxCuVscLG1Psr8icl6Wz7PJf?usp=sharing'),
(21,'gestion de biblioteca','',1,'2026-03-27 11:47:11','2026-06-27 19:31:36',NULL,1,1,'El objetivo de este proyecto es desarrollar un sistema digital y físico el cual pueda registrar los usuarios para una biblioteca que permita hacer más rápidos y organizados los préstamos, devoluciones y el control de los materiales.\n\nObjetivos Específicos\n\n-Permitir el registro de usuarios (alumnos).\n-Mostrar un catálogo de los materiales disponibles.\n-Realizar préstamos y devoluciones usando tecnología NFC.\n-Permitir al bibliotecario ver y controlar los préstamos.\n-Administrar el inventario de materiales.\n-Controlar las fechas de retiro y devolución.',0,'Elegimos este proyecto porque en muchas bibliotecas los procesos todavía se hacen de forma manual, lo que puede generar errores o demoras. Con este sistema buscamos mejorar la organización y hacer más fácil el uso tanto para los alumnos como para el bibliotecario.\nEstos objetivos están pensados para mejorar las tareas principales de la biblioteca. De esta forma, se busca que todo sea más rápido, ordenado y fácil de usar, evitando errores y mejorando la experiencia de los usuarios.\nEl alcance del proyecto se definió para enfocarnos en lo más importante y poder realizar un sistema funcional sin hacerlo demasiado complejo. La idea es que sea útil, fácil de usar y posible de desarrollar dentro del tiempo del proyecto.',0,NULL,0,NULL,NULL,1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing','https://drive.google.com/drive/folders/1pe_pJ0Z0EuhkvGqZtax3HWL7jzV19PVG?usp=sharing'),
(22,'nine lives edu','',1,'2026-03-27 11:50:39','2026-06-04 14:37:08',NULL,1,1,'Nuestro proyecto aspira a ser una plataforma educativa que proporcione apuntes, tutorías y clases particulares con el fin de ser una herramienta que otorgue disponibilidad de conocimiento y un ambiente seguro, fácil e conveniente. ',0,'La plataforma aspira a ser como un ecosistema híbrido que articula una aplicación móvil progresiva (PWA). con un backend desarrollado en Node.js con el framework Express, esperando tener la capacidad de soportar multipless peticiones simultáneas. Poseer API RESTful que sirve simultaneamente en la aplicación móvil como para el sitio web.Tener un estricto protocolo de gestion de datos y almacenamiento, empleando JSON Web Tokens (JWT) para la autenticación de sesiones y algoritmos de cifrado Bcrypt para la protección de credenciales.\n',0,'El alcance final del proyecto Nine Lives Edu se define como la creación de un ecosistema digital integral diseñado para combatir la deserción escolar en el nivel secundario. Este sistema articula el desarrollo de una aplicación híbrida multiplataforma y una infraestructura web robusta, permitiendo el acceso a recursos académicos y la interacción entre pares de manera universal. El núcleo tecnológico se basa en un backend escalable en Node.js encargado de la gestión de una API RESTful, complementado por un microservicio en Python que implementa inteligencia artificial para la moderación de contenidos, la recomendación de materiales y la validación de tutores mediante perfiles de confianza.\n\nLa propuesta incluye un componente disruptivo de hardware consistente en una terminal física institucional. Este dispositivo permite a los docentes señalizar su disponibilidad en tiempo real, sincronizando dicha información con la base de datos global para que los estudiantes visualicen el apoyo pedagógico inmediato en áreas críticas. En términos de seguridad, el alcance garantiza la protección de los datos sensibles mediante el uso de protocolos JWT y cifrado Bcrypt, además de la implementación del proceso KYC para asegurar la idoneidad de quienes ejercen roles de tutoría.\n\nFinalmente, el proyecto abarca la resolución técnica de la portabilidad móvil a través de la tecnología Capacitor, asegurando que la plataforma funcione como una aplicación instalable en dispositivos Android. En cuanto a la dimensión económica, el alcance contempla el diseño de la arquitectura lógica para futuras transacciones y modelos de monetización sustentable, priorizando siempre la gratuidad de los foros y el intercambio de apuntes. Nine Lives Edu concluye así como una solución pedagógica y técnica que utiliza la tecnología para derribar las barreras socioeconómicas que afectan la trayectoria escolar.',0,'2026-06-15','2026-10-15',1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing',''),
(23,'Sistema de Administración Escolar (SAE)','',1,'2026-03-27 12:08:21','2026-06-18 21:22:45',NULL,1,1,'desarrollar un sistema escolar integral que permita gestionar de manera eficiente la información académica y administrativa de la institución, facilitando la carga, organización y consulta de datos por parte de preceptores, docentes y alumnos, con el fin de mejorar el seguimiento del rendimiento académico, la asistencia y la comunicación entre todos los actores del entorno educativo.',0,'Este proyecto propone el desarrollo de un sistema escolar integral que permita mejorar la comunicación, el seguimiento y la administración de datos entre los distintos actores de la institución: preceptores, docentes y alumnos.\nLa plataforma estará estructurada en diferentes secciones según el rol del usuario. \nPreceptores: el área de preceptoría tendrá la responsabilidad de revisar la asistencia de los estudiantes mediante un sistema de huella digital y gestionarla de forma manual en caso de ser necesario.\nDocentes: los profesores contarán con un espacio específico para registrar calificaciones cuatrimestrales, finales y de trabajos prácticos de acuerdo con las materias que dictan, organizadas por curso y alumno, facilitando así una evaluación clara y ordenada. \nAlumnos: los alumnos contaran con un acceso dedicado donde podrán revisar de manera transparente su información académica. Esto incluye informes mensuales de asistencia, informes de calificaciones cuatrimestrales, de trabajos prácticos y finales por materia. Resumen general de su rendimiento.\nUsuarios: los usuarios en común van a tener acceso a un calendario, los alumnos de manera personal y los profesores de manera personal y por curso, para asignar fechas de exámenes o trabajos.',0,'Este proyecto propone el desarrollo de un sistema escolar integral que permita mejorar la comunicación, el seguimiento y la administración de datos entre los distintos actores de la institución: directores, preceptores, docentes y alumnos.\nLa plataforma estará estructurada en diferentes secciones según el rol del usuario. \nAdministrador: este usuario podrá eliminar, añadir y modificar toda la información del sistema.\nDirectores: esta área tendrá disponibilidad de  ver toda la información del sistema del área de preceptores, docentes y alumnos y modificar sus roles.\nPreceptores: el área de preceptoría tendrá la responsabilidad de revisar la asistencia de los estudiantes mediante un sistema de huella digital y gestionarla de forma manual en caso de ser necesario.\nDocentes: los profesores contarán con un espacio específico para registrar calificaciones cuatrimestrales, finales y de trabajos prácticos de acuerdo con las materias que dictan, organizadas por curso y alumno, facilitando así una evaluación clara y ordenada. \nAlumnos: los alumnos contaran con un acceso dedicado donde podrán revisar de manera transparente su información académica. Esto incluye informes mensuales de asistencia, informes de calificaciones cuatrimestrales, de trabajos prácticos y finales por materia. Resumen general de su rendimiento.\nUsuarios: los usuarios en común van a tener acceso a un calendario, los alumnos de manera personal y los profesores de manera personal y por curso, para asignar fechas de exámenes o trabajos.',0,'2026-10-10','2026-10-20',1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing','https://drive.google.com/drive/folders/1LEjc6fflvwNkQ4oSl9u1WAh4bfI_b2SS?usp=sharing'),
(24,'PiFortress','',1,'2026-03-27 12:14:02','2026-06-18 21:48:25',NULL,1,1,'mejorar la seguridad de una caja fuerte brindando un tipo de acceso distinto y más confiable para los familiares que no estén cerca pero igual quieran estar informados del manejo de bienes que almacene este mismo.',0,NULL,0,NULL,0,NULL,NULL,1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing','https://drive.google.com/drive/folders/1iLBGhWKBpsyNFgqzKffH0rKTbvLNvQsc?usp=sharing'),
(25,'Sistema de Registro de Asistencia Biométrico ','',1,'2026-03-27 12:19:51','2026-06-23 23:54:02',NULL,1,1,'Queremos desarrollar e implementar un sistema de registro de asistencia biométrico (de nombre \"Identix\" ) orientado a los alumnos de la U.E.G.P. N°177 \"Nuestra Voz\", integrando el sensor de huella dactilar AS608 (conectado a una ESP32-ETH01 ) con un software de gestión que automatice el registro de presencia por materia y lo ponga a disposición del personal docente y administrativo a través de un panel web.',0,NULL,0,NULL,0,'2026-10-01','2026-10-06',1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing',''),
(26,'Gestion de ventas, stock y empleados - KAIRO','Planeamos crear un sistema de control/lazo cerrado para gestionar ventas de un comercio.',1,'2026-03-27 12:27:07','2026-06-24 16:04:05',NULL,1,1,'Crear un sistema que gestione el stock, venta y compra de productos, la idea es hacerlo más intuitivo y adaptable para los usuarios que lo usen con un filtrado de etiquetas para los distintos productos que haya, control de cambio de ofertas, generar niveles de acceso para los usuarios, es decir, el administrador puede ver todo y su vendedor solo puede ver la parte de compra y venta, pero no gestiona la asistencia de los empleados. Además de implementar una manera más fiable de tomar asistencia a los empleados usando la huella digital de cada uno para entrar al sistema.',0,'Apuntamos a que nuestro sistema se ocupe tanto en locales pequeños (por ejemplo un kiosco) como en locales más grandes (por ejemplo un local de ropa). Queremos que nuestro sistema pueda conseguir esto haciendo que el sistema pueda configurarse desde el panel de administrador, permitiéndole añadir o quitar opciones del sistema a su gusto.\n\n-sistema visualmente agradable, intuitivo y practico\n-sistema cumpla con el control de stock, venta y compra\n-conseguir que el sistema funcione con los scanners de venta y el detector de huella dactilar\n-el usuario pueda hacer sus propias etiquetas y adjuntarla a diferentes productos\n-usuarios con niveles de acceso a la información \n',0,'Apuntamos a que nuestro sistema pueda ocuparse en cualquier ambiente de comercio independientemente de la organización.\n\n-optimizar el sistema\n-agregarle mas funciones para el comercio',0,'2026-10-01','2026-10-06',1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing',''),
(27,'ALARMA VECINAL','',1,'2026-03-27 22:43:52','2026-06-27 19:13:30',NULL,1,1,'Desarrollar un sistema de alarma vecinal inteligente, basado en tecnología digital y automatización, utilizando un microcontrolador ESP32, una aplicación móvil y una plataforma web con el fin de mejorar la seguridad, la comunicación y la organización comunitaria ante situaciones de emergencia o inseguridad. ',0,'El prototipo del sistema permitirá:\n- Activar una alarma vecinal mediante una aplicación móvil.\n- Enviar señales al microcontrolador ESP32 para ejecutar alertar sonoras y visuales.\n- Registrar en una base de datos básica cada activación realizada.\n- Guardar información como usuario, fecha y hora del evento.\n- Realizar pruebas de funcionamiento y conectividad entre la app, el ESP32 y la base de datos.\n- Demostrar el funcionamiento general del sistema en un entorno reducido o de prueba. ',0,'La versión final del proyecto incluiría:\n- Un sistema de alarma vecinal completamente funcional e integrado.\n- Aplicación móvil con acceso para distintos usuarios.\n- Alertas sonoras y visuales en tiempo real.\n- Base de datos centralizada para almacenar y consultar registros de eventos.\n- Plataforma web administrativa para:\n    - Gestión de usuarios.\n     - Control de cuotas o pagos.\n      - Registro y visualización de eventos. \n       - Organización y administración general del sistema.\n- Mayor estabilidad, seguridad y escalabilidad del sistema para su posible implementación en comunidades o barrios reales.',0,'2026-10-01','2026-10-06',1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing','https://drive.google.com/drive/folders/1S6l_wvtAS3aYIrUOCQNP6LyC3R4WRlr9?usp=sharing'),
(28,'Ejemplo - EcoCultivo Smart','Sistema IoT que monitorea humedad, temperatura y luz. Permite el control automático de riego y ventilación. Incluye un dashboard web responsivo para visualización de datos en tiempo Real y una app Android para alertas y control manual remoto.\nUsuarios (A quién va dirigido)\nHobbistas y familias: Que tienen huertas pequeñas en departamentos o patios.\n\nInstituciones Educativas: Para automatizar el mantenimiento de invernaderos durante los fines de semana o recesos escolares.',2,'2026-03-30 13:57:35','2026-05-28 02:58:46',NULL,1,1,'Desarrollar un sistema de gestión y monitoreo automatizado para huertas urbanas e invernaderos escolares, optimizando el uso del agua y garantizando las condiciones ideales de crecimiento mediante hardware abierto y plataformas web/móvil.',0,'Lectura de sensores (suelo y ambiente) con ESP32.\nActivación de un relé para mini-bomba de agua según umbrales fijos.\nSitio web básico (Dashboard) que muestra los valores actuales recibidos por la API.',0,'Lectura de sensores (suelo y ambiente) con ESP32.\nActivación de un relé para mini-bomba de agua según umbrales fijos.\nSitio web básico (Dashboard) que muestra los valores actuales recibidos por la API.',0,'2026-05-01','2026-05-02',0,'',NULL),
(29,'Control de stock de farmacia','',1,'2026-03-30 14:45:27','2026-06-24 15:58:55',NULL,1,1,'Desarrollar un sistema de gestión de stock para farmacias que permita registrar de manera rápida, precisa y automatizada el ingreso y egreso de medicamentos e insumos mediante el uso de un scanner de código de barras, optimizando el control de inventario y reduciendo errores en el conteo manual.',0,'El prototipo del sistema incluirá las funciones básicas necesarias para demostrar el funcionamiento principal del proyecto:\n\nRegistro de productos en una base de datos.\nVisualización básica del stock disponible.\nRegistro de medicamentos e insumos generales de farmacia.\nInterfaz sencilla para el uso del personal de caja o administración.',0,'Registro de productos en una base de datos.\nEscaneo de códigos de barras mediante scanner.\nOpción para agregar o quitar unidades del stock.\nVisualización básica del stock disponible.\nRegistro de medicamentos e insumos generales de farmacia (excepto productos de kiosco).\nAsignación manual de un código a productos que no posean código de barras.\nInterfaz sencilla para el uso del personal de caja o administración.\n\nEl prototipo estará orientado a validar el correcto funcionamiento del sistema y la interacción entre el software y el hardware de escaneo.',0,'2026-10-01','2026-10-06',1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=drive_link','https://drive.google.com/drive/folders/1YrxztT-MhEEJGWWmIWCtM1hUwYPCSHcT?usp=sharing'),
(30,'Memora','Es una herramienta de acompañamiento para adultos mayores que les recuerda eventos importantes como citas médicas o tomarse la presión o sus pastillas, prevee también el stock de estas y alerta a personas del entorno (familiares o cuidadores) cuando están por acabarse. También ayuda a esas personas cercanas a llevar un control de su presión arterial, glucemia, para que los familiares que estén lejos tengan un control',1,'2026-04-02 22:43:53','2026-06-28 13:42:03',NULL,1,1,'Desarrollar un sistema de asistencia inteligente mediante un dispositivo basado en un microcontrolador que gestione recordatorios médicos, registre constantes vitales y notifique automáticamente al entorno familiar vía NOTIFICACIÓN para garantizar el cuidado integral del adulto mayor y proporcionar tranquilidad mediante el seguimiento de datos biométrico.',0,'Construcción de un dispositivo funcional en placa de pruebas (protoboard) que demuestre la conexión al microcontrolador con un sensor, la respuesta por voz y el envío de un mensaje de alerta de prueba ante un valor fuera de rango.',0,'Implementación de un dispositivo funcional con interfaz de voz capaz de emitir alertas y recordatorios inteligentes, incluyendo notificaciones por bajo stock de medicamentos, recordatorios programados para la toma de medicación y confirmación posterior de ingesta para automatizar el control de stock. El sistema también contará con detección de fugas de gas mediante sensores específicos y alertas por voz según los valores registrados. Además, integrará sensores de luz y movimiento para funciones automatizadas según corresponda, junto con un historial completo de mediciones almacenado en una base de datos accesible para la familia y una optimización general del código para mejorar el rendimiento y la estabilidad del prototipo.',0,'2026-10-01','2026-10-06',1,'https://drive.google.com/drive/folders/1gQE1q6SdNA4JQg3DcRJN2FTXN-gB4AU9?usp=sharing','https://drive.google.com/drive/folders/1Ehu1mXXGIs886plzYSyxLWOVSPjT869Q?usp=sharing'),
(31,'Seguimiento 3ro 1ra TEP','seguimiento a todos los alumnos de 3ro 1ra TEP -Materia: Lenguaje de programacion II',1,'2026-06-25 21:37:44','2026-06-25 22:07:37',NULL,1,1,NULL,0,NULL,0,NULL,0,NULL,NULL,0,'','');
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectousuarios`
--

DROP TABLE IF EXISTS `proyectousuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectousuarios` (
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`proyecto_id`,`usuario_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `proyectousuarios_ibfk_1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proyectousuarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectousuarios`
--

LOCK TABLES `proyectousuarios` WRITE;
/*!40000 ALTER TABLE `proyectousuarios` DISABLE KEYS */;
INSERT INTO `proyectousuarios` VALUES
('2026-03-04 20:09:07','2026-03-04 20:09:07',10,1),
('2026-03-04 20:12:01','2026-03-04 20:12:01',10,19),
('2026-03-04 20:12:01','2026-03-04 20:12:01',10,20),
('2026-03-06 19:05:43','2026-03-06 19:05:43',10,25),
('2026-03-06 19:05:34','2026-03-06 19:05:34',10,96),
('2026-03-11 11:53:59','2026-03-11 11:53:59',10,105),
('2026-03-05 15:12:22','2026-03-05 15:12:22',11,1),
('2026-03-10 00:29:07','2026-03-10 00:29:07',11,19),
('2026-03-05 15:27:55','2026-03-05 15:27:55',11,24),
('2026-03-05 15:35:53','2026-03-05 15:35:53',11,26),
('2026-03-06 18:40:34','2026-03-06 18:40:34',11,73),
('2026-03-06 18:40:34','2026-03-06 18:40:34',11,79),
('2026-03-06 18:40:34','2026-03-06 18:40:34',11,80),
('2026-03-09 20:43:38','2026-03-09 20:43:38',11,103),
('2026-03-09 22:20:29','2026-03-09 22:20:29',12,1),
('2026-03-10 00:15:28','2026-03-10 00:15:28',12,19),
('2026-03-10 00:15:28','2026-03-10 00:15:28',12,24),
('2026-03-10 00:15:28','2026-03-10 00:15:28',12,25),
('2026-04-08 00:18:44','2026-04-08 00:18:44',12,26),
('2026-04-08 00:18:44','2026-04-08 00:18:44',12,30),
('2026-04-08 00:18:44','2026-04-08 00:18:44',12,45),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,56),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,62),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,70),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,71),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,72),
('2026-04-08 14:02:29','2026-04-08 14:02:29',12,74),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,75),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,76),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,77),
('2026-04-08 12:56:38','2026-04-08 12:56:38',12,78),
('2026-04-08 13:29:32','2026-04-08 13:29:32',12,79),
('2026-04-08 13:32:38','2026-04-08 13:32:38',12,80),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,81),
('2026-04-08 14:02:29','2026-04-08 14:02:29',12,82),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,83),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,84),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,85),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,86),
('2026-04-08 13:29:32','2026-04-08 13:29:32',12,87),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,88),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,89),
('2026-04-08 14:02:29','2026-04-08 14:02:29',12,90),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,91),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,92),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,93),
('2026-04-08 13:32:38','2026-04-08 13:32:38',12,94),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,95),
('2026-04-08 13:32:38','2026-04-08 13:32:38',12,96),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,97),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,98),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,100),
('2026-04-08 14:02:29','2026-04-08 14:02:29',12,101),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,102),
('2026-04-13 22:44:24','2026-04-13 22:44:24',12,103),
('2026-03-11 12:10:43','2026-03-11 12:10:43',12,105),
('2026-05-08 12:21:07','2026-05-08 12:21:07',12,107),
('2026-03-10 03:13:43','2026-03-10 03:13:43',13,1),
('2026-03-11 11:55:10','2026-03-11 11:55:10',14,1),
('2026-03-11 11:58:01','2026-03-11 11:58:01',14,19),
('2026-03-12 18:11:17','2026-03-12 18:11:17',14,24),
('2026-03-11 11:58:01','2026-03-11 11:58:01',14,25),
('2026-03-11 11:58:01','2026-03-11 11:58:01',14,33),
('2026-03-26 21:42:12','2026-03-26 21:42:12',14,40),
('2026-03-11 11:58:01','2026-03-11 11:58:01',14,73),
('2026-03-11 11:58:01','2026-03-11 11:58:01',14,105),
('2026-03-12 17:47:47','2026-03-12 17:47:47',15,1),
('2026-03-13 18:21:39','2026-03-13 18:21:39',16,19),
('2026-03-17 14:05:37','2026-03-17 14:05:37',17,2),
('2026-03-17 14:05:52','2026-03-17 14:05:52',18,2),
('2026-03-27 11:25:20','2026-03-27 11:25:20',19,1),
('2026-03-27 11:30:18','2026-03-27 11:30:18',19,19),
('2026-03-27 11:30:18','2026-03-27 11:30:18',19,24),
('2026-03-27 11:30:18','2026-03-27 11:30:18',19,25),
('2026-03-27 11:30:18','2026-03-27 11:30:18',19,70),
('2026-03-27 11:30:18','2026-03-27 11:30:18',19,80),
('2026-03-27 11:30:18','2026-03-27 11:30:18',19,95),
('2026-03-27 11:41:19','2026-03-27 11:41:19',20,1),
('2026-03-27 11:42:11','2026-03-27 11:42:11',20,19),
('2026-03-27 11:42:11','2026-03-27 11:42:11',20,24),
('2026-03-27 11:42:11','2026-03-27 11:42:11',20,25),
('2026-03-27 11:42:11','2026-03-27 11:42:11',20,75),
('2026-03-27 11:42:11','2026-03-27 11:42:11',20,93),
('2026-03-27 11:42:11','2026-03-27 11:42:11',20,96),
('2026-03-27 11:47:11','2026-03-27 11:47:11',21,1),
('2026-03-27 11:48:09','2026-03-27 11:48:09',21,19),
('2026-03-27 11:48:09','2026-03-27 11:48:09',21,24),
('2026-03-27 11:48:09','2026-03-27 11:48:09',21,25),
('2026-03-27 11:48:09','2026-03-27 11:48:09',21,72),
('2026-03-27 11:48:09','2026-03-27 11:48:09',21,87),
('2026-03-27 11:48:09','2026-03-27 11:48:09',21,102),
('2026-03-27 11:50:39','2026-03-27 11:50:39',22,1),
('2026-03-27 11:51:22','2026-03-27 11:51:22',22,19),
('2026-03-27 11:51:22','2026-03-27 11:51:22',22,24),
('2026-03-27 11:51:22','2026-03-27 11:51:22',22,25),
('2026-03-27 11:51:22','2026-03-27 11:51:22',22,83),
('2026-03-27 11:51:22','2026-03-27 11:51:22',22,86),
('2026-03-27 11:51:22','2026-03-27 11:51:22',22,90),
('2026-03-27 12:08:21','2026-03-27 12:08:21',23,1),
('2026-03-27 12:13:23','2026-03-27 12:13:23',23,19),
('2026-03-27 12:13:23','2026-03-27 12:13:23',23,24),
('2026-03-27 12:13:23','2026-03-27 12:13:23',23,25),
('2026-03-27 12:10:57','2026-03-27 12:10:57',23,73),
('2026-03-27 12:10:57','2026-03-27 12:10:57',23,82),
('2026-03-27 12:10:57','2026-03-27 12:10:57',23,85),
('2026-03-27 12:14:02','2026-03-27 12:14:02',24,1),
('2026-03-27 12:14:36','2026-03-27 12:14:36',24,19),
('2026-03-27 12:14:36','2026-03-27 12:14:36',24,24),
('2026-03-27 12:14:36','2026-03-27 12:14:36',24,25),
('2026-03-27 12:14:36','2026-03-27 12:14:36',24,76),
('2026-03-27 12:14:36','2026-03-27 12:14:36',24,97),
('2026-03-27 12:14:36','2026-03-27 12:14:36',24,101),
('2026-03-27 12:19:51','2026-03-27 12:19:51',25,1),
('2026-03-27 12:24:49','2026-03-27 12:24:49',25,19),
('2026-03-27 12:24:49','2026-03-27 12:24:49',25,24),
('2026-03-27 12:24:49','2026-03-27 12:24:49',25,25),
('2026-03-27 12:24:49','2026-03-27 12:24:49',25,77),
('2026-03-27 12:24:49','2026-03-27 12:24:49',25,98),
('2026-03-27 12:24:49','2026-03-27 12:24:49',25,107),
('2026-03-27 12:27:07','2026-03-27 12:27:07',26,1),
('2026-03-27 12:27:45','2026-03-27 12:27:45',26,19),
('2026-03-27 12:27:45','2026-03-27 12:27:45',26,24),
('2026-03-27 12:27:45','2026-03-27 12:27:45',26,25),
('2026-03-27 12:27:45','2026-03-27 12:27:45',26,79),
('2026-03-27 12:27:45','2026-03-27 12:27:45',26,84),
('2026-03-27 12:27:45','2026-03-27 12:27:45',26,88),
('2026-03-27 22:43:52','2026-03-27 22:43:52',27,1),
('2026-05-28 03:07:23','2026-05-28 03:07:23',27,19),
('2026-05-28 03:07:23','2026-05-28 03:07:23',27,24),
('2026-05-28 03:07:23','2026-05-28 03:07:23',27,25),
('2026-04-30 12:23:07','2026-04-30 12:23:07',27,92),
('2026-04-30 12:23:07','2026-04-30 12:23:07',27,94),
('2026-04-02 19:14:43','2026-04-02 19:14:43',27,100),
('2026-03-30 13:57:35','2026-03-30 13:57:35',28,1),
('2026-03-30 14:45:28','2026-03-30 14:45:28',29,1),
('2026-03-30 14:46:40','2026-03-30 14:46:40',29,19),
('2026-03-30 14:46:40','2026-03-30 14:46:40',29,24),
('2026-03-30 14:46:40','2026-03-30 14:46:40',29,25),
('2026-03-30 14:46:40','2026-03-30 14:46:40',29,74),
('2026-03-30 14:46:40','2026-03-30 14:46:40',29,89),
('2026-03-30 14:46:40','2026-03-30 14:46:40',29,91),
('2026-04-02 22:43:53','2026-04-02 22:43:53',30,1),
('2026-04-02 22:46:19','2026-04-02 22:46:19',30,19),
('2026-04-02 22:46:19','2026-04-02 22:46:19',30,24),
('2026-04-02 22:46:19','2026-04-02 22:46:19',30,25),
('2026-05-08 12:24:22','2026-05-08 12:24:22',30,71),
('2026-04-02 22:45:58','2026-04-02 22:45:58',30,78),
('2026-05-08 12:24:22','2026-05-08 12:24:22',30,81),
('2026-06-25 21:37:44','2026-06-25 21:37:44',31,1),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,30),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,31),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,32),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,33),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,34),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,35),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,36),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,37),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,38),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,39),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,40),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,42),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,43),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,44),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,45),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,46),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,47),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,48),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,49),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,50),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,51),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,52),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,53),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,54),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,55),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,56),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,57),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,58),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,59),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,60),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,61),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,62),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,63),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,64),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,65),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,66),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,67),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,68),
('2026-06-25 21:50:28','2026-06-25 21:50:28',31,69);
/*!40000 ALTER TABLE `proyectousuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `ver_todo` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombre_2` (`nombre`),
  UNIQUE KEY `nombre_3` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'ADMIN',1),
(2,'DOCENTE',1),
(3,'ALUMNO',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimientos_alumnos`
--

DROP TABLE IF EXISTS `seguimientos_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimientos_alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `materia_id` int(11) NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  `desempeno` decimal(4,2) NOT NULL,
  `observacion` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_seguimiento_proyecto` (`proyecto_id`),
  KEY `fk_seguimiento_alumno` (`alumno_id`),
  KEY `fk_seguimiento_docente` (`docente_id`),
  KEY `fk_seg_materia_id` (`materia_id`),
  CONSTRAINT `fk_seg_materia_id` FOREIGN KEY (`materia_id`) REFERENCES `materias_vieja` (`id`),
  CONSTRAINT `fk_seguimiento_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_seguimiento_docente` FOREIGN KEY (`docente_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_seguimiento_proyecto` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimientos_alumnos`
--

LOCK TABLES `seguimientos_alumnos` WRITE;
/*!40000 ALTER TABLE `seguimientos_alumnos` DISABLE KEYS */;
INSERT INTO `seguimientos_alumnos` VALUES
(1,12,103,1,3,'2026-04-13',8.00,'trabaja en equipo','2026-04-13 23:02:09',NULL,'2026-06-12 15:50:54'),
(2,30,71,1,3,'2026-05-08',8.00,'','2026-05-08 12:56:22',NULL,'2026-06-12 15:50:54'),
(3,30,81,1,3,'2026-05-08',8.00,'','2026-05-08 12:56:41',NULL,'2026-06-12 15:50:54'),
(4,30,78,1,3,'2026-05-08',8.00,'','2026-05-08 12:57:05',NULL,'2026-06-12 15:50:54'),
(5,19,70,1,3,'2026-05-08',8.00,'','2026-05-08 13:04:48',NULL,'2026-06-12 15:50:54'),
(6,19,95,1,3,'2026-05-08',8.00,'','2026-05-08 13:04:53',NULL,'2026-06-12 15:50:54'),
(7,19,80,1,3,'2026-05-08',8.00,'','2026-05-08 13:04:59',NULL,'2026-06-12 15:50:54'),
(8,20,75,1,3,'2026-05-08',8.00,'','2026-05-08 13:15:28',NULL,'2026-06-12 15:50:54'),
(9,20,96,1,3,'2026-05-08',8.00,'','2026-05-08 13:15:33',NULL,'2026-06-12 15:50:54'),
(10,20,93,1,3,'2026-05-08',8.00,'','2026-05-08 13:15:39',NULL,'2026-06-12 15:50:54'),
(11,22,90,1,3,'2026-05-08',8.00,'','2026-05-08 16:34:12',NULL,'2026-06-12 15:50:54'),
(12,22,86,1,3,'2026-05-08',8.00,'','2026-05-08 16:34:18',NULL,'2026-06-12 15:50:54'),
(13,22,86,25,1,'2026-05-20',10.00,'Devoluciones: Primera presentación: El informe del anteproyecto cumple con la estructura del material teórico de la materia. (falta defensa oral). Calidficación:10','2026-05-20 21:44:58',NULL,'2026-06-12 15:50:54'),
(14,22,90,25,1,'2026-05-20',10.00,'Devolución: La primera parte del informe está completo, se enmarca en el material teórico de la materia (falta defensa oral). Calificación:10','2026-05-20 21:47:29',NULL,'2026-06-12 15:50:54'),
(15,24,76,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No cumple con el material teórico de la clase (la redacción no corresponde a una investigación) Calificación: 2','2026-05-20 21:54:58',NULL,'2026-06-12 15:50:54'),
(16,24,101,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No cumple con el material teórico de la clase (la redacción no corresponde a una investigación) Calificación: 2','2026-05-20 21:55:15',NULL,'2026-06-12 15:50:54'),
(17,24,97,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No cumple con el material teórico de la clase (la redacción no corresponde a una investigación) Calificación: 2','2026-05-20 21:55:27',NULL,'2026-06-12 15:50:54'),
(18,26,79,25,1,'2026-05-20',5.00,'Devolución: Primera parte: El proyecto cumple con el marco teórico de la materia. Falta  mejorar la redacción acorde a una investigación. Calificación: 5','2026-05-20 22:06:43',NULL,'2026-06-12 15:50:54'),
(19,26,84,25,1,'2026-05-20',5.00,'Devolución: Primera parte: El proyecto cumple con el marco teórico de la materia. Falta  mejorar la redacción acorde a una investigación. Calificación: 5','2026-05-20 22:07:05',NULL,'2026-06-12 15:50:54'),
(20,26,88,25,1,'2026-05-20',5.00,'Devolución: Primera parte: El proyecto cumple con el marco teórico de la materia. Falta  mejorar la redacción acorde a una investigación. Calificación: 5','2026-05-20 22:07:12',NULL,'2026-06-12 15:50:54'),
(21,23,73,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No se hizo lo cambios solicitados. No cumple con el material teórico de la materia. Calificación: 2','2026-05-20 22:12:09',NULL,'2026-06-12 15:50:54'),
(22,23,85,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No se hizo lo cambios solicitados. No cumple con el material teórico de la materia. Calificación: 2','2026-05-20 22:12:19',NULL,'2026-06-12 15:50:54'),
(23,23,82,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No se hizo lo cambios solicitados. No cumple con el material teórico de la materia. Calificación: 2','2026-05-20 22:12:32',NULL,'2026-06-12 15:50:54'),
(24,19,70,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No cumple con el material teórico de la clase. Calificación: 2','2026-05-20 22:24:31',NULL,'2026-06-12 15:50:54'),
(25,19,95,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No cumple con el material teórico de la clase. Calificación: 2','2026-05-20 22:24:37',NULL,'2026-06-12 15:50:54'),
(26,19,80,25,1,'2026-05-20',2.00,'Devoluciones: Primera parte: No cumple con el material teórico de la clase. Calificación: 2','2026-05-20 22:24:43',NULL,'2026-06-12 15:50:54'),
(27,30,71,25,1,'2026-05-20',4.00,'Devoluciones: El informe no cumple con la estructura del material teórico de la clase. Faltan elementos del informe. Calificación: 4','2026-05-20 22:41:02',NULL,'2026-06-12 15:50:54'),
(28,30,81,25,1,'2026-05-20',4.00,'Devoluciones: El informe no cumple con la estructura del material teórico de la clase. Faltan elementos del informe. Calificación: 4','2026-05-20 22:41:13',NULL,'2026-06-12 15:50:54'),
(29,30,78,25,1,'2026-05-20',4.00,'Devoluciones: El informe no cumple con la estructura del material teórico de la clase. Faltan elementos del informe. Calificación: 4','2026-05-20 22:41:20',NULL,'2026-06-12 15:50:54'),
(30,29,74,25,1,'2026-05-20',1.00,'Calificaciones: No presentaron la primera parte del proyecto. Calificación:1','2026-05-20 22:45:04',NULL,'2026-06-12 15:50:54'),
(31,29,91,25,1,'2026-05-20',1.00,'Calificaciones: No presentaron la primera parte del proyecto. Calificación:1','2026-05-20 22:45:12',NULL,'2026-06-12 15:50:54'),
(32,29,89,25,1,'2026-05-20',1.00,'Calificaciones: No presentaron la primera parte del proyecto. Calificación:1','2026-05-20 22:45:22',NULL,'2026-06-12 15:50:54'),
(33,25,77,25,1,'2026-05-20',1.00,'Devoluciones: No se puede acceder al documento. Calificación: 1','2026-05-20 22:47:35',NULL,'2026-06-12 15:50:54'),
(34,25,107,25,1,'2026-05-20',1.00,'Devoluciones: No se puede acceder al documento. Calificación: 1','2026-05-20 22:47:42',NULL,'2026-06-12 15:50:54'),
(35,25,98,25,1,'2026-05-20',1.00,'Devoluciones: No se puede acceder al documento. Calificación: 1','2026-05-20 22:47:49',NULL,'2026-06-12 15:50:54'),
(36,21,72,25,1,'2026-05-20',4.00,'Devoluciones: No hubo cambios de acuerdo a las sugerencias solicitadas. Calificación:4','2026-05-20 22:52:58',NULL,'2026-06-12 15:50:54'),
(37,21,102,25,1,'2026-05-20',4.00,'Devoluciones: No hubo cambios de acuerdo a las sugerencias solicitadas. Calificación:4','2026-05-20 22:53:04',NULL,'2026-06-12 15:50:54'),
(38,21,87,25,1,'2026-05-20',4.00,'Devoluciones: No hubo cambios de acuerdo a las sugerencias solicitadas. Calificación:4','2026-05-20 22:53:10',NULL,'2026-06-12 15:50:54'),
(39,20,75,25,1,'2026-05-20',1.00,'No tengo acceso al documento. Calificación: 1','2026-05-20 22:57:34',NULL,'2026-06-12 15:50:54'),
(40,20,96,25,1,'2026-05-20',1.00,'No tengo acceso al documento. Calificación: 1','2026-05-20 22:57:42',NULL,'2026-06-12 15:50:54'),
(41,20,93,25,1,'2026-05-20',1.00,'No tengo acceso al documento. Calificación: 1','2026-05-20 22:57:49',NULL,'2026-06-12 15:50:54'),
(42,12,94,1,3,'2026-05-20',3.00,'no completó la carpeta de entrevistas','2026-05-20 23:15:39',NULL,'2026-06-12 15:50:54'),
(43,12,94,1,3,'2026-05-20',6.00,'presentacion incompleta','2026-05-20 23:15:55',NULL,'2026-06-12 15:50:54'),
(44,12,94,1,3,'2026-05-20',8.00,'entrego conforme el standar solicitado la carpeta de diseño de la BD segun se pidió en clases','2026-05-20 23:16:20',NULL,'2026-06-12 15:50:54'),
(45,12,94,1,3,'2026-05-20',3.00,'contesta mal al docente','2026-05-20 23:16:34',NULL,'2026-06-12 15:50:54'),
(46,22,83,25,1,'2026-05-21',10.00,'Devoluciones: Primera presentación: El informe del anteproyecto cumple con la estructura del material teórico de la materia. (falta defensa oral). Calidficación:10','2026-05-21 15:27:24',NULL,'2026-06-12 15:50:54'),
(47,12,101,1,3,'2026-05-27',3.00,'no presentó la carpeta de entrevistas  al usuario','2026-05-27 02:10:03',NULL,'2026-06-12 15:50:54'),
(48,12,100,1,3,'2026-05-27',8.00,'completa las consignas pedidas','2026-05-27 02:10:18',NULL,'2026-06-12 15:50:54'),
(49,23,73,1,3,'2026-05-28',8.00,'presentaron avances en Dailys Scrum','2026-05-28 02:38:17',NULL,'2026-06-12 15:50:54'),
(50,23,85,1,3,'2026-05-28',8.00,'presentaron avances en Dailys Scrum','2026-05-28 02:38:25',NULL,'2026-06-12 15:50:54'),
(51,23,82,1,3,'2026-05-28',8.00,'presentaron avances en Dailys Scrum','2026-05-28 02:40:20',NULL,'2026-06-12 15:50:54'),
(52,19,70,1,3,'2026-05-28',8.00,'','2026-05-28 02:44:35',NULL,'2026-06-12 15:50:54'),
(53,19,80,1,3,'2026-05-28',8.00,'','2026-05-28 02:44:39',NULL,'2026-06-12 15:50:54'),
(54,19,95,1,3,'2026-05-28',8.00,'','2026-05-28 02:44:46',NULL,'2026-06-12 15:50:54'),
(55,21,72,1,3,'2026-05-28',6.00,'poca  motivacion para colaborar con sus pares y poca iniciativa propia para ayudar a avanzar con el proyecto','2026-05-28 02:48:08',NULL,'2026-06-12 15:50:54'),
(56,21,102,1,3,'2026-05-28',6.00,'poca  motivacion para colaborar con sus pares y poca iniciativa propia para ayudar a avanzar con el proyecto','2026-05-28 02:48:15',NULL,'2026-06-12 15:50:54'),
(57,21,87,1,3,'2026-05-28',6.00,'Falta mayor compromiso y mejorar el uso de sus horas de la materia en avanzar en el proyecto.  Las tareas la realiza muy lentamente','2026-05-28 02:50:08',NULL,'2026-06-12 15:50:54'),
(58,26,79,1,3,'2026-05-28',8.00,'mostró avances en sus tareas correspondiente a mis materias','2026-05-28 02:55:09',NULL,'2026-06-12 15:50:54'),
(59,26,88,1,3,'2026-05-28',8.00,'mostró avances en sus tareas correspondiente a mis materias','2026-05-28 02:55:14',NULL,'2026-06-12 15:50:54'),
(60,26,84,1,3,'2026-05-28',8.00,'mostró avances en sus tareas correspondiente a mis materias','2026-05-28 02:55:23',NULL,'2026-06-12 15:50:54'),
(61,22,90,1,3,'2026-05-28',8.00,'','2026-05-28 15:24:23',NULL,'2026-06-12 15:50:54'),
(62,22,86,1,3,'2026-05-28',3.00,'Él mismo manifestó que no esta haciendo nada. Reconoce su falta de compromiso con el grupo, con el proyecto','2026-05-28 15:25:45',NULL,'2026-06-12 15:50:54'),
(63,21,72,1,3,'2026-05-28',3.00,'materia: SW para  plataformas móviles. Mal comportamiento en clases','2026-05-28 15:41:45',NULL,'2026-06-12 15:50:54'),
(64,20,93,1,6,'2026-06-01',8.00,'trabajando en el diseño y en el código (testing) con Lorenzo','2026-06-01 23:52:17',NULL,'2026-06-12 15:50:54'),
(65,20,75,1,6,'2026-06-01',8.00,'trabajando en el maquetado de la pagina web','2026-06-01 23:52:37',NULL,'2026-06-12 15:50:54'),
(66,20,96,1,6,'2026-06-01',8.00,'trabajand en el Código y en unas dificultades con C++','2026-06-01 23:53:01',NULL,'2026-06-12 15:50:54'),
(67,12,30,1,2,'2026-06-04',9.00,'gdfgdg','2026-06-04 00:49:06',NULL,'2026-06-12 15:50:54'),
(68,25,77,1,6,'2026-06-04',6.00,'falta cargar US y documentaciones a GEPRES','2026-06-04 02:57:59',NULL,'2026-06-12 15:50:54'),
(69,25,107,1,6,'2026-06-04',6.00,'falta cargar US y documentaciones a GEPRES','2026-06-04 02:58:27',NULL,'2026-06-12 15:50:54'),
(70,25,98,1,6,'2026-06-04',6.00,'falta cargar US y documentaciones en GEPRES','2026-06-04 02:58:54',NULL,'2026-06-12 15:50:54'),
(71,21,72,1,6,'2026-06-04',5.00,'muestra poca participacion, no comprende conceptos sobre maquetacion WEB  o generacion de  interfaces (modelado). Falta involucrarse  mas en el proyecto','2026-06-04 03:03:49',NULL,'2026-06-12 15:50:54'),
(72,21,102,1,6,'2026-06-04',5.00,'mostro un  diseño en FIGMA,  usando prom IA, no estan haciendo maquetado a  mano.  Pedi que para la prox  me muestren un WorkFlow de la  navegacion mínima  de  lo que desea ver el usuario o  lo que  vana a presentar a usuario ','2026-06-04 03:05:46',NULL,'2026-06-12 15:50:54'),
(73,21,87,1,6,'2026-06-04',7.00,'esta trabajando con la BD. Tienen que justificar por que  usan POSGRE SQL  y no otra  tecnología ','2026-06-04 03:07:10',NULL,'2026-06-12 15:50:54'),
(74,30,71,25,1,'2026-06-04',10.00,'Entrego e reglamento firmado. \nCalif: 10','2026-06-04 14:21:02',NULL,'2026-06-12 15:50:54'),
(75,30,81,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:21:46',NULL,'2026-06-12 15:50:54'),
(76,30,78,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:22:44',NULL,'2026-06-12 15:50:54'),
(77,29,74,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:23:15',NULL,'2026-06-12 15:50:54'),
(78,29,91,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:23:36',NULL,'2026-06-12 15:50:54'),
(79,29,89,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:25:00',NULL,'2026-06-12 15:50:54'),
(80,27,92,25,1,'2026-06-04',1.00,'NO entregó la normativa. (faltó a clases)','2026-06-04 14:25:54',NULL,'2026-06-12 15:50:54'),
(81,27,100,25,1,'2026-06-04',1.00,'No entregó la normativa. (faltó a clases)','2026-06-04 14:26:26',NULL,'2026-06-12 15:50:54'),
(82,27,94,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:26:52',NULL,'2026-06-12 15:50:54'),
(83,26,79,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:27:53',NULL,'2026-06-12 15:50:54'),
(84,26,88,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:28:34',NULL,'2026-06-12 15:50:54'),
(85,26,84,25,1,'2026-06-04',1.00,'No entrego la normativa','2026-06-04 14:29:02',NULL,'2026-06-12 15:50:54'),
(86,25,77,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:30:23',NULL,'2026-06-12 15:50:54'),
(87,25,107,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:31:14',NULL,'2026-06-12 15:50:54'),
(88,24,76,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:32:01',NULL,'2026-06-12 15:50:54'),
(89,24,101,25,1,'2026-06-04',1.00,'No entregó la normativa','2026-06-04 14:32:23',NULL,'2026-06-12 15:50:54'),
(90,24,97,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:32:48',NULL,'2026-06-12 15:50:54'),
(91,23,73,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:33:25',NULL,'2026-06-12 15:50:54'),
(92,23,82,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:33:55',NULL,'2026-06-12 15:50:54'),
(93,23,85,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:34:20',NULL,'2026-06-12 15:50:54'),
(94,22,83,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:35:07',NULL,'2026-06-12 15:50:54'),
(95,22,90,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:35:26',NULL,'2026-06-12 15:50:54'),
(96,22,86,25,1,'2026-06-04',1.00,'No entregó la normativa. (faltó a clases)','2026-06-04 14:35:59',NULL,'2026-06-12 15:50:54'),
(97,21,72,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:37:56',NULL,'2026-06-12 15:50:54'),
(98,21,102,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:38:36',NULL,'2026-06-12 15:50:54'),
(99,20,75,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:39:23',NULL,'2026-06-12 15:50:54'),
(100,20,96,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:39:42',NULL,'2026-06-12 15:50:54'),
(101,20,93,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:40:05',NULL,'2026-06-12 15:50:54'),
(102,19,70,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:40:47',NULL,'2026-06-12 15:50:54'),
(103,19,95,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:41:10',NULL,'2026-06-12 15:50:54'),
(104,19,95,25,1,'2026-06-04',10.00,'Entregó la normativa firmada. ','2026-06-04 14:41:26',NULL,'2026-06-12 15:50:54'),
(105,30,71,25,1,'2026-06-04',10.00,'Mostraron avances de la segunda etapa del anteproyecto.  Se realizaron alguna correcciones. ','2026-06-04 15:17:26',NULL,'2026-06-12 15:50:54'),
(106,30,81,25,1,'2026-06-04',10.00,'Mostraron avances de la segunda etapa del anteproyecto.  Se realizaron alguna correcciones. ','2026-06-04 15:17:35',NULL,'2026-06-12 15:50:54'),
(107,30,78,25,1,'2026-06-04',10.00,'Mostraron avances de la segunda etapa del anteproyecto.  Se realizaron alguna correcciones. ','2026-06-04 15:17:48',NULL,'2026-06-12 15:50:54'),
(108,21,87,25,1,'2026-06-04',10.00,'Entregó la normativa','2026-06-04 15:32:04',NULL,'2026-06-12 15:50:54'),
(109,27,92,24,5,'2026-06-04',5.00,'Nunca mostro nada del Trabajo.','2026-06-04 20:18:26',NULL,'2026-06-12 15:50:54'),
(110,27,94,24,5,'2026-06-04',5.00,'Nunca mostro avances del trabajo.','2026-06-04 20:21:36',NULL,'2026-06-12 15:50:54'),
(111,27,100,24,5,'2026-06-04',5.00,'Nunca mostro el proyecto','2026-06-04 20:22:37',NULL,'2026-06-12 15:50:54'),
(112,29,74,1,4,'2026-06-05',6.00,'muestra pequeños avances, pro falta plasmar todo en documentaciones en GEPRES, no tienen tareas definidas ni asignadas en GEPRES','2026-06-05 15:41:00',NULL,'2026-06-12 15:50:54'),
(113,29,74,1,3,'2026-06-05',6.00,'muestra pequeños avances, pro falta plasmar todo en documentaciones en GEPRES, no tienen tareas definidas ni asignadas en GEPRES','2026-06-05 15:41:15',NULL,'2026-06-12 15:50:54'),
(114,29,91,1,4,'2026-06-05',6.00,'muestra pequeños avances, pro falta plasmar todo en documentaciones en GEPRES, no tienen tareas definidas ni asignadas en GEPRES','2026-06-05 15:41:26',NULL,'2026-06-12 15:50:54'),
(115,29,91,1,3,'2026-06-05',6.00,'muestra pequeños avances, pro falta plasmar todo en documentaciones en GEPRES, no tienen tareas definidas ni asignadas en GEPRES','2026-06-05 15:41:40',NULL,'2026-06-12 15:50:54'),
(116,29,89,1,4,'2026-06-05',6.00,'muestra pequeños avances, pro falta plasmar todo en documentaciones en GEPRES, no tienen tareas definidas ni asignadas en GEPRES','2026-06-05 15:41:50',NULL,'2026-06-12 15:50:54'),
(117,29,89,1,3,'2026-06-05',6.00,'muestra pequeños avances, pro falta plasmar todo en documentaciones en GEPRES, no tienen tareas definidas ni asignadas en GEPRES','2026-06-05 15:41:59',NULL,'2026-06-12 15:50:54'),
(118,26,79,1,4,'2026-06-05',10.00,'gran avance en códigos fuentes','2026-06-05 15:43:25',NULL,'2026-06-12 15:50:54'),
(119,26,79,1,3,'2026-06-05',10.00,'gran avance en códigos fuentes','2026-06-05 15:43:39',NULL,'2026-06-12 15:50:54'),
(120,26,88,1,4,'2026-06-05',10.00,'progresa  en tarea de  documentación de las entrevistas','2026-06-05 15:45:21',NULL,'2026-06-12 15:50:54'),
(121,26,88,1,3,'2026-06-05',10.00,'progresa  en tarea de  documentación de las entrevistas','2026-06-05 15:46:19',NULL,'2026-06-12 15:50:54'),
(122,26,84,1,4,'2026-06-05',10.00,'colabora con  sus compañeros en el avance del proyecto','2026-06-05 15:47:19',NULL,'2026-06-12 15:50:54'),
(123,26,84,1,3,'2026-06-05',10.00,'colabora con  sus compañeros en el avance del proyecto','2026-06-05 15:47:35',NULL,'2026-06-12 15:50:54'),
(124,29,74,1,6,'2026-06-10',3.00,'no realizó el esquema de la BD, Esta igual que la ultima vez que nos juntamos a ver avances','2026-06-10 15:48:16',NULL,'2026-06-12 15:50:54'),
(125,29,74,1,3,'2026-06-10',3.00,'no realizó el esquema de la BD, Esta igual que la ultima vez que nos juntamos a ver avances','2026-06-10 15:48:30',NULL,'2026-06-12 15:50:54'),
(126,29,89,1,6,'2026-06-10',4.00,'Transcribe las entrevistas del usuario. Pero no mostró nada ni hay nada cargado en GEPRES','2026-06-10 15:49:29',NULL,'2026-06-12 15:50:54'),
(127,29,89,1,3,'2026-06-10',4.00,'Transcribe las entrevistas del usuario. Pero no mostró nada ni hay nada cargado en GEPRES','2026-06-10 15:49:38',NULL,'2026-06-12 15:50:54'),
(128,29,91,1,6,'2026-06-10',4.00,'dice que está trabajando en el maquetado, pero no me mostró nada','2026-06-10 15:50:10',NULL,'2026-06-12 15:50:54'),
(129,29,91,1,3,'2026-06-10',4.00,'dice que está trabajando en el maquetado, pero no me mostró nada','2026-06-10 15:50:21',NULL,'2026-06-12 15:50:54'),
(130,21,72,1,6,'2026-06-10',3.00,'no trabaja en clases, conversa y grita. ','2026-06-10 15:54:44',NULL,'2026-06-12 15:50:54'),
(131,21,72,1,3,'2026-06-10',3.00,'no trabaja en clases, conversa y grita. ','2026-06-10 15:55:17',NULL,'2026-06-12 15:50:54'),
(132,21,87,1,3,'2026-06-10',3.00,'no trabaja en clases, conversa y grita. ','2026-06-10 15:55:35',NULL,'2026-06-12 15:50:54'),
(133,21,87,1,6,'2026-06-10',3.00,'no trabaja en clases, conversa y grita. ','2026-06-10 15:55:43',NULL,'2026-06-12 15:50:54'),
(134,23,73,1,3,'2026-06-10',4.00,'no trabaja en clases, conversa y se rie a carcajas con sus compañeros. ','2026-06-10 15:57:58',NULL,'2026-06-12 15:50:54'),
(135,27,94,1,3,'2026-06-10',4.00,'no trabaja en clases, conversa y se distrae con sus compañeros en vez de trabajar en su proyecto. El mismo me reconoció que no esta haciendo nada','2026-06-10 15:59:53',NULL,'2026-06-12 15:50:54'),
(136,27,94,1,6,'2026-06-10',4.00,'no trabaja en clases, conversa y se distrae con sus compañeros en vez de trabajar en su proyecto. El mismo me reconoció que no esta haciendo nada','2026-06-10 16:00:02',NULL,'2026-06-12 15:50:54'),
(137,27,100,1,6,'2026-06-10',4.00,'no trabaja en clases, conversa y se distrae con sus compañeros en vez de trabajar en su proyecto. ','2026-06-10 16:00:22',NULL,'2026-06-12 15:50:54'),
(138,27,100,1,3,'2026-06-10',4.00,'no trabaja en clases, conversa y se distrae con sus compañeros en vez de trabajar en su proyecto. ','2026-06-10 16:00:34',NULL,'2026-06-12 15:50:54'),
(139,27,92,25,1,'2026-06-10',1.00,'No está el proyecto en el enlace propuesto en GEPRES','2026-06-10 18:45:42',NULL,'2026-06-12 15:50:54'),
(140,27,100,25,1,'2026-06-10',1.00,'No está el proyecto en el enlace propuesto en GEPRES','2026-06-10 18:46:18',NULL,'2026-06-12 15:50:54'),
(141,27,94,25,1,'2026-06-10',1.00,'No está el proyecto en el enlace propuesto en GEPRES','2026-06-10 18:46:29',NULL,'2026-06-12 15:50:54'),
(142,29,74,25,1,'2026-06-10',1.00,'No está el proyecto en el enlace propuesto en GEPRES','2026-06-10 18:47:05',NULL,'2026-06-12 15:50:54'),
(143,29,91,25,1,'2026-06-10',1.00,'No está el proyecto en el enlace propuesto en GEPRES','2026-06-10 18:47:18',NULL,'2026-06-12 15:50:54'),
(144,29,89,25,1,'2026-06-10',1.00,'No está el proyecto en el enlace propuesto en GEPRES','2026-06-10 18:47:27',NULL,'2026-06-12 15:50:54'),
(145,29,74,25,1,'2026-06-10',4.00,'SALVEDAD DE LA NOTA: En enlace si está en GEPRES pero deber revisar el informe y hacer las correcciones sugeridas. NOTA: 4','2026-06-10 19:08:51',NULL,'2026-06-12 15:50:54'),
(146,29,91,25,1,'2026-06-10',4.00,'SALVEDAD DE LA NOTA: En enlace si está en GEPRES pero deber revisar el informe y hacer las correcciones sugeridas. NOTA: 4','2026-06-10 19:09:26',NULL,'2026-06-12 15:50:54'),
(147,29,89,25,1,'2026-06-10',4.00,'SALVEDAD DE LA NOTA: En enlace si está en GEPRES pero deber revisar el informe y hacer las correcciones sugeridas. NOTA: 4','2026-06-10 19:09:37',NULL,'2026-06-12 15:50:54'),
(148,27,92,25,1,'2026-06-10',4.00,'El trabajo requiere de producción de una escritura formal y completar información de algunos elementos enmarcados . Falta la segunda parte del informe. ','2026-06-10 19:27:52',NULL,'2026-06-12 15:50:54'),
(149,27,100,25,1,'2026-06-10',4.00,'El trabajo requiere de producción de una escritura formal y completar información de algunos elementos enmarcados . Falta la segunda parte del informe. ','2026-06-10 19:28:01',NULL,'2026-06-12 15:50:54'),
(150,27,94,25,1,'2026-06-10',4.00,'El trabajo requiere de producción de una escritura formal y completar información de algunos elementos enmarcados . Falta la segunda parte del informe. ','2026-06-10 19:28:12',NULL,'2026-06-12 15:50:54'),
(151,26,79,25,1,'2026-06-10',10.00,'Se realizaron las correcciones sugeridas en la primera parte del informe. La segunda parte está muy bien redactada. Felicitaciones por sus avances!','2026-06-10 19:33:39',NULL,'2026-06-12 15:50:54'),
(152,26,88,25,1,'2026-06-10',10.00,'Se realizaron las correcciones sugeridas en la primera parte del informe. La segunda parte está muy bien redactada. Felicitaciones por sus avances!','2026-06-10 19:33:49',NULL,'2026-06-12 15:50:54'),
(153,26,84,25,1,'2026-06-10',10.00,'Se realizaron las correcciones sugeridas en la primera parte del informe. La segunda parte está muy bien redactada. Felicitaciones por sus avances!','2026-06-10 19:33:58',NULL,'2026-06-12 15:50:54'),
(154,25,77,25,1,'2026-06-10',6.00,'Se apreció las correcciones sugeridas pero a partir del marco metodológico no cumple con el material de estudio establecido en la materia Evaluación de Proyecto. ','2026-06-10 19:42:18',NULL,'2026-06-12 15:50:54'),
(155,25,107,25,1,'2026-06-10',6.00,'Se apreció las correcciones sugeridas pero a partir del marco metodológico no cumple con el material de estudio establecido en la materia Evaluación de Proyecto. ','2026-06-10 19:42:31',NULL,'2026-06-12 15:50:54'),
(156,25,98,25,1,'2026-06-10',6.00,'Se apreció las correcciones sugeridas pero a partir del marco metodológico no cumple con el material de estudio establecido en la materia Evaluación de Proyecto. ','2026-06-10 19:42:42',NULL,'2026-06-12 15:50:54'),
(157,24,76,25,1,'2026-06-10',4.00,'El trabajo requiere de muchas modificaciones. No están bien elaborados los objetivos, no queda claro. tiene una redacción poco formal tampoco está claro a quienes va dirigido este proyecto. ','2026-06-10 20:00:41',NULL,'2026-06-12 15:50:54'),
(158,24,101,25,7,'2026-06-10',4.00,'El trabajo requiere de muchas modificaciones. No están bien elaborados los objetivos, no queda claro. tiene una redacción poco formal tampoco está claro a quienes va dirigido este proyecto. ','2026-06-10 20:00:49',NULL,'2026-06-12 15:50:54'),
(159,24,97,25,1,'2026-06-10',4.00,'El trabajo requiere de muchas modificaciones. No están bien elaborados los objetivos, no queda claro. tiene una redacción poco formal tampoco está claro a quienes va dirigido este proyecto. ','2026-06-10 20:01:00',NULL,'2026-06-12 15:50:54'),
(160,23,73,25,1,'2026-06-10',10.00,'Revisar las sugerencias en el documento. En cuanto a la segunda parte van bien. Felicitaciones!','2026-06-10 20:08:51',NULL,'2026-06-12 15:50:54'),
(161,23,85,25,1,'2026-06-10',10.00,'Si bien el desarrollo de la materia cumplen lo solicitado, se requiere de tu participación mas activa de lo contrario se visualizará en la nota cuatrimestral. Revisar las sugerencias en el documento. En cuanto a la segunda parte van bien. Felicitaciones! ','2026-06-10 20:10:36',NULL,'2026-06-12 15:50:54'),
(162,23,82,25,1,'2026-06-10',10.00,' Revisar las sugerencias en el documento. En cuanto a la segunda parte van bien. Felicitaciones! ','2026-06-10 20:10:50',NULL,'2026-06-12 15:50:54'),
(163,22,83,25,1,'2026-06-10',8.00,'el trabajo requiere de algunos ajustes. Acercarse en clases para estableces algunos puntos','2026-06-10 20:35:08',NULL,'2026-06-12 15:50:54'),
(164,22,90,25,7,'2026-06-10',8.00,'el trabajo requiere de algunos ajustes. Acercarse en clases para estableces algunos puntos','2026-06-10 20:35:17',NULL,'2026-06-12 15:50:54'),
(165,22,86,25,7,'2026-06-10',8.00,'el trabajo requiere de algunos ajustes. Acercarse en clases para estableces algunos puntos','2026-06-10 20:35:29',NULL,'2026-06-12 15:50:54'),
(166,21,72,25,7,'2026-06-10',8.00,'Falta algunos elementos del anteproyecto. Se requiere tu participación mas activa para reflejar la nota cuatrimestral. ','2026-06-10 20:47:46',NULL,'2026-06-12 15:50:54'),
(167,21,102,25,1,'2026-06-10',8.00,'Falta algunos elementos del anteproyecto. ','2026-06-10 20:48:03',NULL,'2026-06-12 15:50:54'),
(168,21,87,25,1,'2026-06-10',8.00,'Falta algunos elementos del anteproyecto.','2026-06-10 20:48:18',NULL,'2026-06-12 15:50:54'),
(169,20,75,25,1,'2026-06-10',5.00,'La mayoría del informe no se enmarca en lo solicitado dentro del material teórico de la materia. ','2026-06-10 20:57:46',NULL,'2026-06-12 15:50:54'),
(170,20,96,25,1,'2026-06-10',5.00,'La mayoría del informe no se enmarca en lo solicitado dentro del material teórico de la materia. ','2026-06-10 20:57:58',NULL,'2026-06-12 15:50:54'),
(171,20,93,25,1,'2026-06-10',5.00,'La mayoría del informe no se enmarca en lo solicitado dentro del material teórico de la materia. ','2026-06-10 20:58:07',NULL,'2026-06-12 15:50:54'),
(172,19,70,25,1,'2026-06-10',7.00,'Algunos puntos no se enmarcan dentro del material teórico de la materia Evaluación de Proyecto','2026-06-10 21:27:16',NULL,'2026-06-12 15:50:54'),
(173,19,95,25,1,'2026-06-10',7.00,'Algunos puntos no se enmarcan dentro del material teórico de la materia Evaluación de Proyecto','2026-06-10 21:27:28',NULL,'2026-06-12 15:50:54'),
(174,19,80,25,1,'2026-06-10',7.00,'Algunos puntos no se enmarcan dentro del material teórico de la materia Evaluación de Proyecto','2026-06-10 21:27:38',NULL,'2026-06-12 15:50:54'),
(175,24,76,1,4,'2026-06-11',6.00,'viene trabajando. pero esta mucho con el celular','2026-06-11 12:55:26',NULL,'2026-06-12 15:50:54'),
(176,24,97,1,4,'2026-06-12',6.00,'Me comentó que ya terminó el maquetado. Le falta el UserFlow','2026-06-12 00:58:52',NULL,'2026-06-12 15:50:54'),
(177,24,101,1,4,'2026-06-12',6.00,'viene avanzando con el proyecto','2026-06-12 00:59:22',NULL,'2026-06-12 15:50:54'),
(178,27,92,19,8,'2026-06-16',3.00,'Hasta el momento no alzanca los objetivos establecidos. ','2026-06-16 16:53:47',NULL,'2026-06-16 16:53:47'),
(179,27,100,19,8,'2026-06-16',5.00,'Hasta el momento está en proceso de alcanzar los objetivos establecidos. ','2026-06-16 16:54:29',NULL,'2026-06-16 16:54:29'),
(180,27,94,19,8,'2026-06-16',3.00,'Hasta el momento no alcanza los objetivos establecidos. ','2026-06-16 16:55:18',NULL,'2026-06-16 16:55:18'),
(181,26,79,19,8,'2026-06-16',8.00,'Desempeña un papel de notable interes sobre su proyecto, alcanza los objetivos establecidos. ','2026-06-16 16:58:24',NULL,'2026-06-16 16:58:24'),
(182,26,88,19,8,'2026-06-16',8.00,'Se aprecia el trabajo en clase y el interes en la realización del proyecto, alcanza los objetivos establecidos hasta el momento. ','2026-06-16 16:59:14',NULL,'2026-06-16 16:59:14'),
(183,26,84,19,8,'2026-06-16',8.00,'Trabaja de forma conjunta con sus compañeros y elabora soluciones, transformando las dificultades en oportunidades. Alcanza los objetivos establecidos hasta el momento.  ','2026-06-16 17:01:26',NULL,'2026-06-16 17:01:26'),
(184,30,78,19,8,'2026-06-16',8.00,'Logra altamente los objetivos establecidos hasta el momento.  ','2026-06-16 17:04:30',NULL,'2026-06-16 17:04:30'),
(185,30,81,19,8,'2026-06-16',6.00,'Alcanza los objetivos establecidos hasta el momento. ','2026-06-16 17:06:27',NULL,'2026-06-16 17:06:27'),
(186,30,71,19,8,'2026-06-16',7.00,'Alcanza los objetivos establecidos hasta el momento. ','2026-06-16 17:07:52',NULL,'2026-06-16 17:07:52'),
(187,20,75,19,8,'2026-06-16',6.00,'Alcanza los objetivos establecidos hasta el momento. Debe participar mucho más.  ','2026-06-16 17:13:34',NULL,'2026-06-16 17:13:34'),
(188,20,96,19,8,'2026-06-16',6.00,'Presenta un desempeño optimo en proyecto, alcanza los objetivos establecidos hasta el momento. Debe mejorar su comportamiento por lo demostrado merece una mejor calificación, sin embargo su comportamiento no es el deseado. ','2026-06-16 17:15:17',NULL,'2026-06-16 17:15:17'),
(189,20,93,19,8,'2026-06-16',5.00,'No logra los objetivos establecidos hasta el momento. ','2026-06-16 17:15:43',NULL,'2026-06-16 17:15:43'),
(190,22,90,19,8,'2026-06-16',9.00,'Alcanza los objetivos establecidos hasta el momento. ','2026-06-16 17:21:29',NULL,'2026-06-16 17:21:29'),
(191,22,83,19,8,'2026-06-16',5.00,'Por el momento no alcanza los objetivos establecidos ','2026-06-16 17:22:21',NULL,'2026-06-16 17:22:21'),
(192,22,86,19,8,'2026-06-16',5.00,'Por el momento no alcanza los objetivos establecidos ','2026-06-16 17:22:41',NULL,'2026-06-16 17:22:41'),
(193,25,77,19,8,'2026-06-16',7.00,'Buen trabajo en conjunto, equipo muy equilibrado a la hora de desarrollar el proyecto.','2026-06-16 17:25:48',NULL,'2026-06-16 17:25:48'),
(194,25,98,19,8,'2026-06-16',7.00,'Buen trabajo en conjunto, equipo muy equilibrado a la hora de desarrollar el proyecto.','2026-06-16 17:26:03',NULL,'2026-06-16 17:26:03'),
(195,25,107,19,8,'2026-06-16',7.00,'Buen trabajo en conjunto, equipo muy equilibrado a la hora de desarrollar el proyecto.','2026-06-16 17:26:42',NULL,'2026-06-16 17:26:42'),
(196,23,82,19,8,'2026-06-16',8.00,'Primera calificación cargada: Excelente trabajo en el proyecto integrador hasta el momento logran los objetivos de forma individual y grupal. ','2026-06-16 19:23:29',NULL,'2026-06-16 19:23:29'),
(197,23,73,19,8,'2026-06-16',8.00,'Primera calificación cargada: Excelente trabajo en el proyecto integrador hasta el momento logran los objetivos de forma individual y grupal. ','2026-06-16 19:24:24',NULL,'2026-06-16 19:24:24'),
(198,23,85,19,8,'2026-06-16',8.00,'Primera calificación cargada: Excelente trabajo en el proyecto integrador hasta el momento logran los objetivos de forma individual y grupal. ','2026-06-16 19:25:09',NULL,'2026-06-16 19:25:09'),
(199,21,72,19,8,'2026-06-16',5.00,'Por el momento: no alcanza los objetivos.  ','2026-06-16 19:47:53',NULL,'2026-06-16 19:47:53'),
(200,21,87,19,8,'2026-06-16',8.00,'Alcanza los objetivos y participa de forma totalmente activa en el desarrollor del proyecto final.  ','2026-06-16 19:50:50',NULL,'2026-06-16 19:50:50'),
(201,21,102,19,8,'2026-06-16',8.00,'Alcanza los objetivos y participa de forma totalmente activa en el desarrollor del proyecto final.  Es quien hace la carpeta, él tiene ese rol. ','2026-06-16 19:52:11',NULL,'2026-06-16 19:52:11'),
(202,21,72,25,1,'2026-06-18',9.00,'Devolución realizada en clases. ','2026-06-18 14:32:55',NULL,'2026-06-18 14:32:55'),
(203,21,102,25,1,'2026-06-18',10.00,'Devolución realizada en clases. ','2026-06-18 14:33:25',NULL,'2026-06-18 14:33:25'),
(204,21,87,25,1,'2026-06-18',9.00,'Devolución realizada en clases. ','2026-06-18 14:33:43',NULL,'2026-06-18 14:33:43'),
(205,19,70,25,1,'2026-06-18',9.00,'Devolución realizada en clases. ','2026-06-18 14:34:48',NULL,'2026-06-18 14:34:48'),
(206,19,95,25,1,'2026-06-18',9.00,'Devolución realizada en clases. ','2026-06-18 14:35:02',NULL,'2026-06-18 14:35:02'),
(207,19,80,25,1,'2026-06-18',9.00,'Devolución realizada en clases. ','2026-06-18 14:35:15',NULL,'2026-06-18 14:35:15'),
(208,24,76,25,1,'2026-06-18',9.00,'Devolución realiza en clases. ','2026-06-18 15:01:39',NULL,'2026-06-18 15:01:39'),
(209,24,101,25,1,'2026-06-18',9.00,'Devolución realiza en clases. ','2026-06-18 15:01:56',NULL,'2026-06-18 15:01:56'),
(210,24,97,25,1,'2026-06-18',9.00,'Devolución realiza en clases. ','2026-06-18 15:02:09',NULL,'2026-06-18 15:02:09'),
(211,29,91,25,1,'2026-06-18',8.00,'Devolución realizada  en clases. ','2026-06-18 15:55:12',NULL,'2026-06-18 15:55:12'),
(212,29,89,25,1,'2026-06-18',8.00,'Devolución realizada  en clases. ','2026-06-18 15:55:25',NULL,'2026-06-18 15:55:25'),
(213,25,98,25,1,'2026-06-18',10.00,'Entregó en tiempo la normativa. ','2026-06-18 16:07:43',NULL,'2026-06-18 16:07:43'),
(214,30,71,1,4,'2026-06-18',8.00,'mostraron avances del maquetado, y su userFlow directamente en el celular','2026-06-18 21:15:04',NULL,'2026-06-18 21:15:04'),
(215,30,81,1,4,'2026-06-18',8.00,'mostraron avances del maquetado, y su userFlow directamente en el celular','2026-06-18 21:15:38',NULL,'2026-06-18 21:15:38'),
(216,30,78,1,4,'2026-06-18',8.00,'mostraron avances del maquetado, y su userFlow directamente en el celular','2026-06-18 21:15:49',NULL,'2026-06-18 21:15:49'),
(217,23,73,1,4,'2026-06-18',8.00,'mostró avances sobre temas de SW','2026-06-18 21:22:04',NULL,'2026-06-18 21:22:04'),
(218,23,85,1,4,'2026-06-18',8.00,'mostró avances sobre temas de SW','2026-06-18 21:22:14',NULL,'2026-06-18 21:22:14'),
(219,23,82,1,4,'2026-06-18',8.00,'mostró avances sobre temas de SW','2026-06-18 21:22:37',NULL,'2026-06-18 21:22:37'),
(220,19,70,1,4,'2026-06-18',9.00,'mostró avances sobre temas de SW','2026-06-18 21:34:50',NULL,'2026-06-18 21:34:50'),
(221,19,80,1,4,'2026-06-18',9.00,'mostró avances sobre temas de SW','2026-06-18 21:34:59',NULL,'2026-06-18 21:34:59'),
(222,19,95,1,4,'2026-06-18',9.00,'mostró avances sobre temas de SW','2026-06-18 21:35:09',NULL,'2026-06-18 21:35:09'),
(223,26,79,1,4,'2026-06-17',9.00,'mostró avances sobre temas de SW. ','2026-06-18 21:37:04',NULL,'2026-06-18 21:37:04'),
(224,26,84,1,4,'2026-06-18',9.00,'mostró avances sobre temas de SW. ','2026-06-18 21:37:24',NULL,'2026-06-18 21:37:24'),
(225,26,88,1,4,'2026-06-18',9.00,'mostró avances sobre temas de SW. ','2026-06-18 21:37:32',NULL,'2026-06-18 21:37:32'),
(226,24,76,1,4,'2026-06-18',4.00,'poca colaboración con sus compañeros. no esta haciendo ninguan tarea en concreto respecto al proyecto','2026-06-18 21:45:08',NULL,'2026-06-18 21:45:08'),
(227,24,101,1,4,'2026-06-18',5.00,'aun no pudo presentar un Diagrama ER aceptable para la BD. Falta avanzar mucho mas en ese tema. ','2026-06-18 21:46:47',NULL,'2026-06-18 21:46:47'),
(228,24,97,1,4,'2026-06-18',4.00,'Todavia no hay ninguna maquetacion ni UserFlow creada. Lo que mostro solo fue una maquetacion de inicio de sesion y registro de usuario. PEro nada de lo que va a mostrar el sistema al usuario','2026-06-18 21:48:12',NULL,'2026-06-18 21:48:12'),
(229,26,79,19,8,'2026-06-23',8.00,'mostraron avances actividad vídeo y lecto, buen trabajo en grupo ','2026-06-23 19:00:59',NULL,'2026-06-23 19:00:59'),
(230,26,84,19,8,'2026-06-23',8.00,'mostraron avances actividad vídeo y lector, buen trabajo en grupo.','2026-06-23 19:04:04',NULL,'2026-06-23 19:04:04'),
(231,26,88,19,8,'2026-06-23',8.00,'mostraron avances actividad vídeo y lector, buen trabajo en grupo.','2026-06-23 19:04:36',NULL,'2026-06-23 19:04:36'),
(232,19,95,19,8,'2026-06-23',7.00,'renzo habla muy poco, explicó parte importantes y tarea realizadas. ','2026-06-23 19:21:18',NULL,'2026-06-23 19:21:18'),
(233,29,74,1,3,'2026-06-24',2.00,'sigue sin aportar nada al proyecto. ','2026-06-24 15:56:23',NULL,'2026-06-24 15:56:23'),
(234,29,74,1,6,'2026-06-24',2.00,'sigue sin aportar nada al proyecto. ','2026-06-24 15:56:37',NULL,'2026-06-24 15:56:37'),
(235,29,91,1,6,'2026-06-24',5.00,'poco avance en UserFlow, Esquema de la BD, M-ER. BD aun no creada','2026-06-24 15:57:44',NULL,'2026-06-24 15:57:44'),
(236,29,91,1,3,'2026-06-24',5.00,'poco avance en UserFlow, Esquema de la BD, M-ER. BD aun no creada','2026-06-24 15:58:08',NULL,'2026-06-24 15:58:08'),
(237,29,89,1,3,'2026-06-24',5.00,'poco avance en UserFlow, Esquema de la BD, M-ER. BD aun no creada','2026-06-24 15:58:45',NULL,'2026-06-24 15:58:45'),
(238,29,89,1,6,'2026-06-24',5.00,'poco avance en UserFlow, Esquema de la BD, M-ER. BD aun no creada','2026-06-24 15:58:54',NULL,'2026-06-24 15:58:54'),
(239,26,79,1,6,'2026-06-24',9.00,'mostró y explicó avances la confeccion de la BD','2026-06-24 16:01:55',NULL,'2026-06-24 16:01:55'),
(240,26,79,1,3,'2026-06-24',9.00,'mostró y explicó avances la confeccion de la BD','2026-06-24 16:02:04',NULL,'2026-06-24 16:02:04'),
(241,26,88,1,6,'2026-06-24',9.00,'mostró avances positivos del proyecto','2026-06-24 16:02:55',NULL,'2026-06-24 16:02:55'),
(242,26,88,1,3,'2026-06-24',9.00,'mostró avances positivos del proyecto','2026-06-24 16:03:10',NULL,'2026-06-24 16:03:10'),
(243,26,84,1,6,'2026-06-24',7.00,'lo veo trabajando con el HW, pero debe involucrarse mas con el resto de SW','2026-06-24 16:03:54',NULL,'2026-06-24 16:03:54'),
(244,26,84,1,3,'2026-06-24',7.00,'lo veo trabajando con el HW, pero debe involucrarse mas con el resto de SW','2026-06-24 16:04:04',NULL,'2026-06-24 16:04:04'),
(245,27,92,2,4,'2026-06-26',5.00,'no muestra avances en el proyecto. Falta de comunicacion con sus compañeros de equipo para avanzar en los objetivos. No completan el GEPRES. ','2026-06-27 19:11:58',NULL,'2026-06-27 19:11:58'),
(246,27,92,2,3,'2026-06-27',5.00,'no muestra avances en el proyecto. Falta de comunicacion con sus compañeros de equipo para avanzar en los objetivos. No completan el GEPRES. ','2026-06-27 19:12:08',NULL,'2026-06-27 19:12:08'),
(247,27,94,2,4,'2026-06-26',5.00,'no muestra avances en el proyecto. Falta de comunicacion con sus compañeros de equipo para avanzar en los objetivos. No completan el GEPRES. ','2026-06-27 19:12:30',NULL,'2026-06-27 19:12:30'),
(248,27,94,2,3,'2026-06-26',5.00,'no muestra avances en el proyecto. Falta de comunicacion con sus compañeros de equipo para avanzar en los objetivos. No completan el GEPRES. ','2026-06-27 19:12:43',NULL,'2026-06-27 19:12:43'),
(249,27,100,2,4,'2026-06-26',5.00,'no muestra avances en el proyecto. Falta de comunicacion con sus compañeros de equipo para avanzar en los objetivos. No completan el GEPRES. ','2026-06-27 19:13:10',NULL,'2026-06-27 19:13:10'),
(250,27,100,2,3,'2026-06-26',5.00,'no muestra avances en el proyecto. Falta de comunicacion con sus compañeros de equipo para avanzar en los objetivos. No completan el GEPRES. ','2026-06-27 19:13:23',NULL,'2026-06-27 19:13:23'),
(251,20,75,2,4,'2026-06-26',9.00,'','2026-06-27 19:14:09',NULL,'2026-06-27 19:14:09'),
(252,20,75,2,3,'2026-06-27',9.00,'','2026-06-27 19:14:18',NULL,'2026-06-27 19:14:18'),
(253,20,93,2,4,'2026-06-26',9.00,'','2026-06-27 19:14:33',NULL,'2026-06-27 19:14:33'),
(254,20,93,2,3,'2026-06-26',9.00,'','2026-06-27 19:14:44',NULL,'2026-06-27 19:14:44'),
(255,20,96,2,4,'2026-06-26',9.00,'','2026-06-27 19:16:08',NULL,'2026-06-27 19:16:08'),
(256,20,96,2,3,'2026-06-26',9.00,'','2026-06-27 19:16:20',NULL,'2026-06-27 19:16:20'),
(257,21,72,1,4,'2026-06-26',6.00,'falta mas participacion en los trabajos con sus compañeros del proyecto. Desconoce sobre estructura de la BD legacy, no esta involucrado en resolver los inconvenientes con la BD original y buscar una solucion para migrar los datos a la futura BD. Tampoco esta investigando sobre los lenguajes de programacion que necesitaran usar para desarrollar la app','2026-06-27 19:23:27',NULL,'2026-06-27 19:23:27'),
(258,21,72,1,3,'2026-06-26',6.00,'falta mas participacion en los trabajos con sus compañeros del proyecto. Desconoce sobre estructura de la BD legacy, no esta involucrado en resolver los inconvenientes con la BD original y buscar una solucion para migrar los datos a la futura BD. Tampoco esta investigando sobre los lenguajes de programacion que necesitaran usar para desarrollar la app. solo tiene 2 tareas terminadas en GEPRES. ','2026-06-27 19:23:41',NULL,'2026-06-27 19:27:02'),
(259,21,87,1,4,'2026-06-26',6.00,'necesita avanzar mas rápido con el proyecto. Solo tienen 4 tareas terminadas en gepres y una trabajándola. no tiene la DB creada , y ni siquiera el Modelo ER','2026-06-27 19:29:23',NULL,'2026-06-27 19:29:23'),
(260,21,87,1,3,'2026-06-26',6.00,'necesita avanzar mas rápido con el proyecto. Solo tienen 4 tareas terminadas en gepres y una trabajándola. no tiene la DB creada , y ni siquiera el Modelo ER','2026-06-27 19:29:36',NULL,'2026-06-27 19:29:36'),
(261,21,102,1,4,'2026-06-26',6.00,'necesita avanzar mas rápido con el proyecto. colaborar mas con sus compañero, por ejemplo a resolver los problemas o inconvenientes con la BD Legacy','2026-06-27 19:31:21',NULL,'2026-06-27 19:31:21'),
(262,21,102,1,3,'2026-06-26',6.00,'necesita avanzar mas rápido con el proyecto. colaborar mas con sus compañero, por ejemplo a resolver los problemas o inconvenientes con la BD Legacy','2026-06-27 19:31:33',NULL,'2026-06-27 19:31:33');
/*!40000 ALTER TABLE `seguimientos_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugerencias`
--

DROP TABLE IF EXISTS `sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugerencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `respuesta_admin` text DEFAULT NULL,
  `fecha_respuesta` datetime DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `estado` enum('PENDIENTE','RESPONDIDO') DEFAULT 'PENDIENTE',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_usuario_sug` (`usuario_id`),
  KEY `fk_admin_sug` (`admin_id`),
  CONSTRAINT `fk_admin_sug` FOREIGN KEY (`admin_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_usuario_sug` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugerencias`
--

LOCK TABLES `sugerencias` WRITE;
/*!40000 ALTER TABLE `sugerencias` DISABLE KEYS */;
INSERT INTO `sugerencias` VALUES
(1,1,'nueva sugerencia','detalle del problema','listo, arreglado',NULL,1,'RESPONDIDO','2026-03-10 15:54:47'),
(2,1,'descripcion del proyecto','agregar descripcion del proyecto al editar un proyecto, no sepuede cambiar ese dato una vez creado el proyecto','listo',NULL,1,'RESPONDIDO','2026-03-10 16:21:26'),
(3,1,'DONE sin cargar tiempo','Controlar que cuando da en DONE si o si cargue el tiempo que le llevo reealizar la tarea','listo',NULL,1,'RESPONDIDO','2026-03-10 16:34:33'),
(4,1,'cambios en fronetnd','Selectores de Dependencia: En el modal de US que tocamos ayer, hay que agregar un selector para elegir qué otras US son \"padres\". Lo mismo en el modal de creación de tareas.\n\nAlertas de \"Camino Crítico\": Si una US es predecesora de muchas otras, podríamos ponerle un icono de \"Bloqueante\" (High Impact).\n\nVisualización de Fechas: Mostrar los cierres en el Header del dashboard para que el grupo siempre sepa cuántos días faltan para el \"1er Cierre\".','listo',NULL,1,'RESPONDIDO','2026-03-11 14:25:37'),
(5,1,'nuevos graficos','la idea es ver dentro de una US, un grafico de dependencias, porque solo tenmemos el listado nomas de tareas, no está mal eso, pero le falta ver sus dependencias. Similar para un Proyecto, ver un grafico de dependencias de sus US.','ni idea , asi que le di de baja a esta solicitud',NULL,1,'RESPONDIDO','2026-03-11 14:27:27'),
(6,1,'arreglos para GEpres','- cambiar color de fuente en US (titulo), se ve con letras claras\n- al crear la tarea no se guarda criterios de acepaacion, pero si se guarda bien al editar la tarea.\n- la US da error al seleccionar TERMINADA. no deberia estar esta opcion, quitarla del selector, controlar funciones por derras para que no quede basura de codigo',NULL,NULL,NULL,'PENDIENTE','2026-05-22 12:58:44');
/*!40000 ALTER TABLE `sugerencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_dependencias`
--

DROP TABLE IF EXISTS `tarea_dependencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarea_dependencias` (
  `tarea_id` int(11) NOT NULL,
  `depende_de_id` int(11) NOT NULL,
  PRIMARY KEY (`tarea_id`,`depende_de_id`),
  KEY `depende_de_tarea_id` (`depende_de_id`),
  CONSTRAINT `tarea_dependencias_ibfk_1` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tarea_dependencias_ibfk_2` FOREIGN KEY (`depende_de_id`) REFERENCES `tareas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_dependencias`
--

LOCK TABLES `tarea_dependencias` WRITE;
/*!40000 ALTER TABLE `tarea_dependencias` DISABLE KEYS */;
INSERT INTO `tarea_dependencias` VALUES
(101,100);
/*!40000 ALTER TABLE `tarea_dependencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `criterios_aceptacion` text DEFAULT NULL,
  `horas_estimadas` decimal(10,2) DEFAULT 0.00,
  `fecha_inicio_real` datetime DEFAULT NULL,
  `fecha_fin_real` datetime DEFAULT NULL,
  `horas_dedicadas` decimal(10,2) DEFAULT 0.00,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `us_id` int(11) NOT NULL,
  `responsable_id` int(11) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `prioridad_id` bigint(20) unsigned NOT NULL,
  `estado_id` bigint(20) unsigned NOT NULL,
  `tipo_id` bigint(20) unsigned NOT NULL,
  `cumple_aceptacion` tinyint(1) DEFAULT 0,
  `testeado` tinyint(1) DEFAULT 0,
  `documentado` tinyint(1) DEFAULT 0,
  `utilizable` tinyint(1) DEFAULT 0,
  `comentario_cierre` text DEFAULT NULL,
  `link_evidencia` varchar(255) DEFAULT NULL,
  `horas_reales` decimal(10,2) DEFAULT 0.00,
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
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES
(49,'ADQUIRIR ARDUINO','','',2.00,NULL,NULL,0.00,'2026-03-05 15:22:26','2026-03-09 21:32:16','2026-03-18 10:10:27',11,27,80,NULL,1,2,1,0,0,0,0,'','',6.00),
(50,'MANUAL DE USUARIO EN LAWEB','','',4.00,NULL,NULL,0.00,'2026-03-05 15:23:11','2026-03-09 21:32:20','2026-03-18 10:10:27',11,27,73,NULL,2,2,3,0,0,0,0,'','',6.00),
(51,'adquirirmateriales','','',4.00,NULL,NULL,0.00,'2026-03-05 15:36:42','2026-03-09 21:32:24','2026-03-18 10:10:27',11,27,24,NULL,4,2,1,0,0,0,0,'','',12.00),
(52,'averiguar precios de sensores','','',3.00,NULL,NULL,0.00,'2026-03-05 15:37:09','2026-03-09 21:34:35','2026-03-18 10:10:27',11,27,80,NULL,4,2,1,1,0,1,0,'','drive:///',7.00),
(53,'hacer el borrador ','','',4.00,NULL,NULL,0.00,'2026-03-05 15:38:38','2026-03-06 17:52:47','2026-03-18 10:10:27',11,28,1,NULL,2,4,3,0,0,0,0,'','',5.00),
(54,'estudio de factibilidad','','',8.00,NULL,NULL,0.00,'2026-03-05 15:40:19','2026-03-09 21:34:50','2026-03-18 10:10:27',11,27,80,NULL,3,2,1,1,0,1,0,'','frive://asjdashd',2.00),
(55,'tarea 2','','',0.00,NULL,NULL,0.00,'2026-03-05 15:50:41','2026-03-06 19:04:54','2026-03-18 10:10:27',11,28,80,NULL,1,2,3,0,0,0,0,'','',0.00),
(56,'prueba y testing','fxzf gfgcx f bxc fgfg','',3.00,NULL,NULL,0.00,'2026-03-06 18:39:38','2026-03-09 21:35:05','2026-03-18 10:10:27',11,27,26,NULL,1,2,2,0,0,0,0,'','',3.00),
(62,'Setup IDE y Librerías','Instalar PlatformIO y PubSubClient','',2.00,'2026-03-10 02:50:06',NULL,0.00,'2026-03-09 19:50:40','2026-04-08 11:28:11',NULL,12,1201,45,NULL,1,4,1,0,0,1,0,'esto es lo que hice en la tareaa, bla bla bla','https://drive....',3.00),
(63,'Driver Sensor SCT-013','Lectura analógica y filtrado','',4.50,NULL,NULL,0.00,'2026-03-09 19:50:40','2026-04-08 00:19:19',NULL,12,1201,45,NULL,1,2,1,0,0,1,0,'','',0.00),
(64,'Pruebas de alcance WiFi','Test en patio y talleres','',3.00,'2026-03-10 02:50:14',NULL,0.00,'2026-03-09 19:50:40','2026-04-08 00:23:57',NULL,12,1201,26,NULL,2,5,2,0,0,1,0,'','',1.00),
(65,'Fix: Reconexión MQTT','Bucle de reintento automático','',2.00,'2026-03-10 02:50:19',NULL,0.00,'2026-03-09 19:50:40','2026-04-08 00:24:02',NULL,12,1201,26,NULL,1,5,4,0,0,1,0,'asdadsad','adsadasd',3.00),
(66,'Diagrama de cableado','Documentar pines del ESP32','',1.50,'2026-03-10 02:50:25','2026-03-11 12:30:55',0.00,'2026-03-09 19:50:40','2026-04-08 00:19:13',NULL,12,1201,45,NULL,3,5,2,0,0,0,0,'terminada bien','',0.00),
(67,'Modelado Entidad-Relación','Normalización de BD EcoTrack','hacer si os i asdljsaldlasd',4.00,'2026-03-10 02:51:34',NULL,0.00,'2026-03-09 19:50:55','2026-05-20 14:03:44',NULL,12,1202,45,NULL,1,5,1,1,0,1,0,'sfsfadadad, recordar abrir rl puerto de internet, con la Ip .45','sdfsfsddfsdfsdfs',10.00),
(68,'Scripts de Migración','Tablas iniciales y seeders','',2.00,'2026-03-10 02:51:43',NULL,0.00,'2026-03-09 19:50:55','2026-04-08 00:19:35',NULL,12,1202,45,NULL,1,5,1,0,0,0,0,'asdadasdasd','',3.00),
(69,'Optimización de Índices','Mejorar tiempos de respuesta','',3.50,'2026-03-10 02:51:50',NULL,0.00,'2026-03-09 19:50:55','2026-04-08 00:19:50',NULL,12,1202,45,NULL,4,4,2,0,0,1,0,'adsad','asdadasda',3.00),
(70,'Fix: Error de moneda Decimal','Corregir redondeo en cálculos','',1.50,'2026-03-10 02:51:59',NULL,0.00,'2026-03-09 19:50:55','2026-04-08 00:19:57',NULL,12,1202,45,NULL,2,5,4,0,0,0,0,'adadada','',1.00),
(71,'Diccionario de Datos','Definición de campos técnicos','',2.00,'2026-03-10 02:53:56',NULL,0.00,'2026-03-09 19:50:55','2026-04-08 00:20:04',NULL,12,1202,26,NULL,3,5,3,0,0,1,0,'sdasdasda','zxczxc',6.00),
(72,'Endpoint Ingesta Datos','Recepción de JSON de sensores','',5.00,'2026-03-10 03:10:54',NULL,0.00,'2026-03-09 19:51:10','2026-05-20 13:47:20',NULL,12,1203,45,NULL,4,5,1,0,0,0,0,'anda todo ok','',0.50),
(73,'Lógica de Autenticación JWT','Protección de rutas API','',4.00,'2026-03-10 11:00:52',NULL,0.00,'2026-03-09 19:51:10','2026-05-20 13:47:30',NULL,12,1203,30,NULL,1,5,1,0,0,1,0,'','',0.00),
(74,'Test de carga concurrente','Simular 50 sensores enviando','',4.00,'2026-03-10 11:00:58',NULL,0.00,'2026-03-09 19:51:10','2026-05-20 13:48:16',NULL,12,1203,30,NULL,2,5,2,0,0,1,0,'','',0.00),
(75,'Fix: Memory Leak Express','Depuración de controladores','',3.00,NULL,NULL,0.00,'2026-03-09 19:51:10','2026-05-20 13:45:26',NULL,12,1203,26,NULL,1,5,4,0,0,1,0,'','',0.00),
(76,'Espec. técnica OpenAPI','Documentar con Swagger UI','',3.00,NULL,NULL,0.00,'2026-03-09 19:51:10','2026-05-20 13:48:33','2026-05-21 12:43:36',12,1203,26,NULL,2,5,3,0,0,1,0,'','',0.00),
(77,'Integración Chart.js','Gráficos de líneas temporales','',6.00,NULL,NULL,0.00,'2026-03-09 19:51:50','2026-04-08 00:25:07',NULL,12,1204,26,NULL,2,1,2,0,0,0,0,'','',0.00),
(78,'Filtros por Sector','Selectores dinámicos de aula','',3.00,NULL,NULL,0.00,'2026-03-09 19:51:50','2026-04-08 00:21:17',NULL,12,1204,30,NULL,2,5,1,0,0,0,0,'','',0.00),
(79,'QA de Visualización','Pruebas en navegadores antiguos',NULL,2.50,NULL,NULL,0.00,'2026-03-09 19:51:50','2026-03-09 19:51:50',NULL,12,1204,NULL,NULL,3,1,2,0,0,0,0,NULL,NULL,0.00),
(80,'Fix: Lag en tiempo real','Optimizar sockets / polling','',3.00,NULL,NULL,0.00,'2026-03-09 19:51:50','2026-04-08 00:21:08',NULL,12,1204,26,NULL,2,3,4,0,0,0,0,'','',0.00),
(81,'Guía Rápida Administrador','Manual de lectura de gráficos',NULL,2.00,NULL,NULL,0.00,'2026-03-09 19:51:50','2026-03-09 19:51:50',NULL,12,1204,NULL,NULL,3,1,3,0,0,1,0,NULL,NULL,0.00),
(82,'Configuración de Umbrales','CRUD de límites por aula',NULL,4.00,NULL,NULL,0.00,'2026-03-09 19:52:04','2026-03-09 19:52:04',NULL,12,1205,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(83,'Módulo de Notificaciones','Envío por Email y Push',NULL,5.00,NULL,NULL,0.00,'2026-03-09 19:52:04','2026-03-09 19:52:04',NULL,12,1205,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(84,'Simulacro de Sobrecarga','Trigger manual de alertas',NULL,2.00,NULL,NULL,0.00,'2026-03-09 19:52:04','2026-03-09 19:52:04',NULL,12,1205,NULL,NULL,1,1,2,0,0,1,0,NULL,NULL,0.00),
(85,'Fix: Alerta Fantasma','Filtrado de ruidos eléctricos',NULL,3.00,NULL,NULL,0.00,'2026-03-09 19:52:04','2026-03-09 19:52:04',NULL,12,1205,NULL,NULL,1,1,4,0,0,0,0,NULL,NULL,0.00),
(86,'Hoja de Procedimientos','Qué hacer ante una alerta',NULL,2.00,NULL,NULL,0.00,'2026-03-09 19:52:04','2026-03-09 19:52:04',NULL,12,1205,NULL,NULL,2,1,3,0,0,1,0,NULL,NULL,0.00),
(87,'Middleware de Autorización','Restricción de rutas según rol_id','',4.00,NULL,NULL,0.00,'2026-03-09 19:54:20','2026-03-13 18:08:09','2026-03-18 10:11:00',12,1206,36,NULL,1,1,1,0,0,1,0,'','',0.00),
(88,'Interfaz de Asignación','Panel para cambiar roles de alumnos','',3.00,NULL,NULL,0.00,'2026-03-09 19:54:20','2026-03-13 18:08:16','2026-03-18 10:11:00',12,1206,39,NULL,2,1,1,0,0,0,0,'','',0.00),
(89,'Test de Escalada de Privilegios','Validar que alumnos no editen US','',2.00,NULL,NULL,0.00,'2026-03-09 19:54:20','2026-03-13 18:08:34','2026-03-18 10:11:00',12,1206,40,NULL,1,1,2,0,0,1,0,'','',0.00),
(90,'Manual de Permisos','Documento con matriz de acceso','',1.50,NULL,NULL,0.00,'2026-03-09 19:54:20','2026-03-13 18:08:29','2026-03-18 10:11:00',12,1206,80,NULL,3,1,3,0,0,1,0,'','',0.00),
(91,'Setup de Librería PDF','Instalar PDFMake o similar','',2.00,NULL,NULL,0.00,'2026-03-09 19:54:33','2026-04-08 00:26:39',NULL,12,1207,26,NULL,2,5,1,0,0,0,0,'','',0.00),
(92,'Generación de Gráficos PDF','Incrustar charts de consumo en el doc',NULL,5.00,NULL,NULL,0.00,'2026-03-09 19:54:33','2026-03-09 19:54:33',NULL,12,1207,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(93,'Fix: Error de paginación','Corregir saltos de página en tablas largas',NULL,2.00,NULL,NULL,0.00,'2026-03-09 19:54:33','2026-03-09 19:54:33',NULL,12,1207,NULL,NULL,2,1,4,0,0,0,0,NULL,NULL,0.00),
(94,'Plantilla Institucional','Diseño de header/footer con logo EET',NULL,3.00,NULL,NULL,0.00,'2026-03-09 19:54:33','2026-03-09 19:54:33',NULL,12,1207,NULL,NULL,3,1,3,0,0,1,0,NULL,NULL,0.00),
(95,'Algoritmo de Conversión','Fórmula kWh a kg de CO2 (Factor 0.5)',NULL,3.00,NULL,NULL,0.00,'2026-03-09 19:54:53','2026-03-09 19:54:53','2026-03-18 10:11:18',12,1208,NULL,NULL,1,1,1,0,0,1,0,NULL,NULL,0.00),
(96,'Componente Visual Bosque','Equivalencia en árboles plantados',NULL,4.00,NULL,NULL,0.00,'2026-03-09 19:54:53','2026-03-09 19:54:53','2026-03-18 10:11:18',12,1208,NULL,NULL,3,1,1,0,0,0,0,NULL,NULL,0.00),
(97,'Validación de Cálculos','Testeo de precisión de la conversión',NULL,2.00,NULL,NULL,0.00,'2026-03-09 19:54:53','2026-03-09 19:54:53','2026-03-18 10:11:18',12,1208,NULL,NULL,2,1,2,0,0,1,0,NULL,NULL,0.00),
(98,'Infografía Metodológica','Explicación del cálculo para alumnos',NULL,2.50,NULL,NULL,0.00,'2026-03-09 19:54:53','2026-03-09 19:54:53','2026-03-18 10:11:18',12,1208,NULL,NULL,3,1,3,0,0,1,0,NULL,NULL,0.00),
(99,'actividades ','','',0.00,NULL,NULL,0.00,'2026-03-10 00:37:57','2026-03-10 00:37:57','2026-03-18 10:10:34',10,26,NULL,NULL,2,2,1,0,0,0,0,'','',0.00),
(100,'saludo','saludar','con modales ',1.00,NULL,NULL,0.00,'2026-03-13 18:13:52','2026-03-13 18:13:52','2026-03-30 15:52:43',14,1211,33,NULL,1,1,1,0,0,1,0,'','',0.00),
(101,'tarea para codina','adjasd','presentar',1.00,NULL,NULL,0.00,'2026-03-13 18:15:54','2026-03-13 18:15:54','2026-03-30 15:52:43',14,1211,1,NULL,1,1,1,0,0,1,0,'','',0.00),
(102,'Prototipado en Breadboard','Armado físico del circuito usando el ESP32, el sensor de humedad de suelo (capacitivo) y el sensor DHT11/22.','ssdfsdfsdfdsbf msdbfmsd mfbsd mf nbsdfmnbsmdnbfmnbmnbsdfmbsdmf mnsb dfmnbs df m bmsdbf mbbnsd fmbsmdbfmsdfmbsdm fbsmdnbfmnbsd f',0.00,NULL,NULL,0.00,'2026-03-30 14:30:53','2026-03-30 14:40:46',NULL,28,1213,30,NULL,3,5,1,0,0,1,0,'sdbhfsdjbf sbdf bb dbfbmbsdm fmsdbfmn bsdmf msdbfmnbsdmnfbmsdmnfbmsndb fmn msdbf sdmbfmnsdbfmnsbdf\nbsd fm','sdfsdfsdfsdfsdfsdfs',0.00),
(103,'Firmware: Lectura de Sensores','Programar el código en Arduino IDE/PlatformIO para leer los valores analógicos y digitales de los sensores y mostrarlos por monitor serie.','',0.00,NULL,NULL,0.00,'2026-03-30 14:32:22','2026-03-30 14:37:31',NULL,28,1213,30,NULL,3,2,1,0,0,0,0,'','',0.00),
(104,'Firmware: Conexión Wi-Fi','Implementar la lógica de conexión a la red local en el ESP32, gestionando reconexiones automáticas en caso de caída de señal.','',0.00,NULL,NULL,0.00,'2026-03-30 14:33:03','2026-03-30 14:36:36',NULL,28,1213,31,NULL,2,1,1,0,0,0,0,'','',0.00),
(105,'Configuración de Endpoint API','Crear o configurar la ruta en el Backend (Node.js) que reciba los datos mediante el método POST y los valide antes de procesar.','',0.00,NULL,NULL,0.00,'2026-03-30 14:33:34','2026-03-30 14:38:16',NULL,28,1213,45,NULL,3,2,1,0,0,0,0,'','',0.00),
(106,'Persistencia de Datos (SQL)','Crear la tabla mediciones en la base de datos y vincular el backend para que cada lectura del ESP32 se guarde con su respectivo timestamp.','',0.00,NULL,NULL,0.00,'2026-03-30 14:34:10','2026-03-30 14:43:06',NULL,28,1213,26,NULL,2,5,1,0,0,0,0,'','',0.00),
(107,'virus','¿cómo afectan al usuario?',NULL,0.00,NULL,NULL,0.00,'2026-03-31 16:57:21','2026-03-31 16:57:21','2026-04-08 11:40:38',24,1212,101,NULL,1,1,3,0,0,0,0,NULL,NULL,0.00),
(108,'patrones','patrones principales de los 3 virus ',NULL,0.00,NULL,NULL,0.00,'2026-03-31 16:58:02','2026-03-31 16:58:02','2026-04-08 11:40:38',24,1212,97,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(109,'tipos poco conocidos ','nombrar y explicar algunos de los virus menos conocidos ',NULL,0.00,NULL,NULL,0.00,'2026-03-31 17:00:12','2026-03-31 17:00:12','2026-04-08 11:40:38',24,1212,76,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(110,'servidor informacion','Buscar informacion de ¿Qué servidor usar? ¿Cuál se ajusta más a las necesidades que tenemos?\n','',5.00,NULL,NULL,0.00,'2026-04-01 11:45:00','2026-05-14 14:42:30',NULL,22,1221,83,NULL,3,5,3,0,0,1,1,'','https://docs.google.com/document/d/1gjlrKfLTLFcHF3Uelsjg7TPz5iez2qZJ/edit?usp=sharing&ouid=105791683538961448713&rtpof=true&sd=true',0.00),
(111,'Informacion de dominio','Para Dominio: \n- Dominio o Plataforma de hosting','',0.00,NULL,NULL,0.00,'2026-04-01 11:47:11','2026-06-09 19:51:42',NULL,22,1221,86,NULL,2,5,1,1,0,1,1,'La elección de una de las 3 alternativas de plataforma esta a discusión','https://drive.google.com/file/d/1wY6mzMV618wktrhd1gFpT2ilSSVI1U0i/view?usp=drive_link',0.00),
(112,'Moderadores con IA','Investigar para la posible implementacion de Moderadores con IA\n- Modelos con python \n- otros modelos','https://docs.google.com/document/d/1xMUjZyNicPtHc20d_HoLh9By9SRTlFYs5ZcupSvpO0M/edit?usp=sharing',12.00,NULL,NULL,0.00,'2026-04-01 11:50:03','2026-05-21 12:59:45',NULL,22,1221,90,NULL,1,5,1,1,1,1,1,'investigacion realizada y pronta aplicacion al sistema ','https://docs.google.com/document/d/1xMUjZyNicPtHc20d_HoLh9By9SRTlFYs5ZcupSvpO0M/edit?usp=sharing',0.00),
(113,'investigar herramienta','investigar las posibles herramientas para desarrollar la base de datos ','Explicacion de la base de datos y separacion de roles',2.00,NULL,NULL,0.00,'2026-04-01 12:44:48','2026-05-21 14:31:54',NULL,22,1222,90,NULL,1,5,3,1,1,1,1,'hecho','https://docs.google.com/document/d/1UqwDZDrL8MOrIV5QAQNvcWkch1EmIAM270jBRT05Wn4/edit?usp=sharing',0.00),
(114,'Desarrollar la base de datos','crear las tablas de roles y de documentos ','Hecho',5.00,NULL,NULL,0.00,'2026-04-01 12:58:26','2026-04-16 14:57:21',NULL,22,1222,90,NULL,3,5,1,1,1,1,1,'','https://docs.google.com/document/d/1UqwDZDrL8MOrIV5QAQNvcWkch1EmIAM270jBRT05Wn4/edit?usp=sharing',0.00),
(115,'investigar modelos de IA','investigar posibles bots a implementar en el proyecto\n','cumple.',5.00,NULL,NULL,0.00,'2026-04-01 13:13:25','2026-06-09 19:58:32',NULL,22,1223,90,NULL,1,5,3,1,1,1,1,'Decidimos implementar las tecnologias de','https://docs.google.com/document/d/1cGfpEcIo-GfK6NyAqLl8ILotyK6aVz-TLqovP8WuZ0s/edit?usp=sharing',0.00),
(116,'implementacion de  Modelos de IA y chat bot','- Moderadores de IA, programados inicio de entrenamiento.','programados y probados',9.00,NULL,NULL,0.00,'2026-04-01 13:14:01','2026-06-09 19:58:24',NULL,22,1223,90,NULL,2,5,1,1,1,1,1,'Busqueda de información de subir a un host y conectar todo para empezar a entrenar la IA','https://docs.google.com/document/d/1cGfpEcIo-GfK6NyAqLl8ILotyK6aVz-TLqovP8WuZ0s/edit?usp=sharing',0.00),
(117,'crear el apk','','',0.00,NULL,NULL,0.00,'2026-04-01 13:15:03','2026-04-01 14:13:45',NULL,22,1225,83,NULL,3,1,1,0,0,0,0,'','',0.00),
(118,'Implementación del moderador con IA','','',0.00,NULL,NULL,0.00,'2026-04-01 14:01:05','2026-05-21 13:05:43',NULL,22,1224,90,NULL,1,1,1,0,0,0,0,'','',0.00),
(119,'hostear la pagina','conseguirle un dominio o subirla a un servicio de hosting.','',0.00,NULL,NULL,0.00,'2026-04-01 14:02:59','2026-05-29 21:35:14',NULL,22,1224,86,NULL,3,5,1,1,0,1,1,'Fue posible subir la pagina a un repositorio de github y hostearla con Render sin ninguna complicación mayor','https://drive.google.com/file/d/1qN3kxErQNZjxPguXdDuFScAeEK8il9pS/view?usp=drive_link',0.00),
(120,'documentar el testeo ','','',0.00,NULL,NULL,0.00,'2026-04-01 14:04:44','2026-05-21 14:19:53',NULL,22,1226,86,NULL,3,1,3,0,0,0,0,'','',0.00),
(121,'investigar componentes necesarios ','investigar y hacer una lista de componentes necesarios para el desarrollo de la parte del hardware teoricamente','',0.00,NULL,NULL,0.00,'2026-04-01 14:07:35','2026-05-27 14:56:17',NULL,22,1227,83,NULL,2,5,3,0,0,1,0,'','https://docs.google.com/document/d/1cDQp4iBMtCKbnDSVlIM6JDAarwp9GRjXfBKXhwPU71E/edit?usp=sharing',0.00),
(122,'armar sistema de asistencia','armar el esquema virtual del circuito, y basandose en el, armar el sistema de asistencia fisico.','',0.00,NULL,NULL,0.00,'2026-04-01 14:10:14','2026-05-27 19:04:46',NULL,22,1227,83,NULL,3,1,1,0,0,1,0,'','',0.00),
(123,'testeo del sistema','','',0.00,NULL,NULL,0.00,'2026-04-01 14:12:26','2026-05-13 11:04:11',NULL,22,1227,83,NULL,2,1,2,0,0,0,0,'','',0.00),
(124,'Vídeo','Realizar un vídeo presentando los avances.  jueves 30 ','',4.00,NULL,NULL,0.00,'2026-04-16 11:23:27','2026-04-21 19:20:44','2026-05-29 03:06:22',20,1228,75,NULL,2,1,1,0,0,0,0,'','',0.00),
(125,'Documento - Anteproyecto','Desarrollar e implementar un sistema de registro de asistencia biométrico orientado a los alumnos de la U.E.G.P. N°177 \"Nuestra Voz\", integrando el sensor de huella dactilar AS608 (conectado al servidor institucional) con un software de gestión que automatice el registro de presencia por materia y lo ponga a disposición del personal docente y administrativo a través de un panel web.',NULL,0.00,NULL,NULL,0.00,'2026-04-30 15:10:12','2026-04-30 15:10:12','2026-05-07 14:14:11',25,1236,107,NULL,3,1,1,0,0,0,0,NULL,NULL,0.00),
(126,'Configurar sensor AS608 en puerto serial','Conectar físicamente el sensor AS608 a la PC del servidor mediante la ESP32-ETH01 vía  USB/Serial.','',4.00,NULL,NULL,0.00,'2026-05-12 23:53:15','2026-06-16 19:18:39',NULL,25,1237,107,NULL,3,3,2,0,0,0,0,'','',0.00),
(127,'Script de lectura serial en Node.js','Desarrollar el script sensor.js que escucha continuamente el puerto serial, recibe el huella_id del AS608 cuando detecta una huella y llama al endpoint /api/sensor/fichar del servidor.','',5.00,NULL,NULL,0.00,'2026-05-12 23:54:02','2026-06-16 19:19:40',NULL,25,1237,77,NULL,3,3,1,0,0,0,0,'','',0.00),
(128,'Endpoint /api/sensor/fichar en el servidor (pc de maxi)',' Implementar en server.js el endpoint POST que recibe el huella_id, busca al alumno correspondiente, detecta la materia activa y guarda el registro de asistencia con el estado correcto.','',3.00,NULL,NULL,0.00,'2026-05-12 23:55:07','2026-05-12 23:57:06',NULL,25,1237,98,NULL,3,2,2,0,0,0,0,'','',0.00),
(129,'Lógica de tiempos presente/tarde/ausente','mplementar dentro del endpoint de fichada el cálculo de diferencia de minutos entre la hora de fichada y el inicio de la clase. Primeros 5 min = PRESENTE, 5 a 30 min = TARDE, más de 30 = AUSENTE.','',3.00,NULL,NULL,0.00,'2026-05-12 23:55:50','2026-05-12 23:57:34',NULL,25,1237,98,NULL,3,4,1,0,0,0,0,'','',0.00),
(130,'Pruebas con 30 alumnos simultáneos','imular el registro de 30 alumnos en secuencia para verificar que el sistema soporta la carga real de un aula completa sin errores ni tiempos de espera excesivos.','',2.00,NULL,NULL,0.00,'2026-05-12 23:56:38','2026-06-16 19:19:58',NULL,25,1237,77,NULL,2,3,1,0,0,0,0,'','',0.00),
(131,' Diseño de tabla horarios_aula1 en SQL','Crear la tabla horarios_aula1 en el esquema SQL con los campos necesarios: materia_id, profesor, dia_semana, hora_inicio, hora_fin, cuatrimestre, anio_lectivo y activo.','',3.00,NULL,NULL,0.00,'2026-05-12 23:58:24','2026-06-03 17:11:40',NULL,25,1238,77,NULL,3,5,1,0,0,0,0,'esta logrado el sql','',0.00),
(132,'Carga del horario oficial 2026 en la base de datos','Cargar en el archivo schema.sql los INSERT con el horario real del Aula 1 extraído del documento \"Horario Operador 2026 Actualizado\", incluyendo todas las materias del 1er cuatrimestre.','A la hora de cargar la base de datos con el importable se deben establecer todos los horarios de los documentos que nos proporcionaron en la institución y verse reflejados sin problema en el programa.',3.00,NULL,NULL,0.00,'2026-05-12 23:58:59','2026-06-16 19:45:54',NULL,25,1238,77,NULL,2,5,1,0,0,0,0,'No hay mucho que comentar. el programa ya tiene los horarios cargados en el importable de la base de datos.','',0.00),
(133,'Lógica de detección de horario activo','Implementar en server.js la consulta SQL que dado el día actual y la hora actual devuelve el horario que corresponde. Se usa en el endpoint de fichada y en el dashboard.','',3.00,NULL,NULL,0.00,'2026-05-12 23:59:37','2026-06-17 14:39:48',NULL,25,1238,107,NULL,3,5,1,0,0,0,0,'','',0.00),
(134,'Tests con distintas horas del día','Verificar manualmente que el sistema detecta correctamente cada materia del Aula 1 modificando la hora del sistema o usando parámetros de prueba en los endpoints.','',2.00,NULL,NULL,0.00,'2026-05-13 00:00:21','2026-06-17 14:39:55',NULL,25,1238,98,NULL,2,5,1,0,0,0,0,'','',0.00),
(135,'Endpoint GET /api/horarios',' Crear el endpoint que devuelve el listado completo del horario del Aula 1 para mostrarlo en la sección Horario del panel web.','',2.00,NULL,NULL,0.00,'2026-05-13 00:01:00','2026-06-03 17:12:46',NULL,25,1238,98,NULL,2,3,1,0,0,0,0,'','',0.00),
(136,'Estructura HTML del panel (index.html)',' Desarrollar la estructura completa del panel web con header, navegación, sección de estadísticas, banner de materia activa, tabla de asistencia y panel lateral de alertas.','',4.00,NULL,NULL,0.00,'2026-05-13 00:01:42','2026-06-03 17:14:31',NULL,25,1239,98,NULL,3,5,1,0,0,0,0,'','',0.00),
(137,' Estilos CSS para personal mayor',' Diseñar el CSS del panel con tipografía grande (mínimo 15px), alto contraste, colores institucionales azules, estados con semáforo de colores verde/amarillo/rojo y botones grandes fáciles de presionar.\n','',3.00,NULL,NULL,0.00,'2026-05-13 00:04:00','2026-06-03 17:14:58',NULL,25,1239,98,NULL,3,5,1,0,0,0,0,'','',0.00),
(138,' Módulo ajax.js con fetch() y polling','Desarrollar el archivo ajax.js que centraliza todas las llamadas al servidor usando fetch() con async/await. Incluye los objetos Auth, Dashboard, Asistencia, Alumnos, Reportes y la clase PollingDashboard que refresca los datos cada 30 segundos.','',0.00,NULL,NULL,0.00,'2026-05-13 00:04:42','2026-06-05 11:31:31',NULL,25,1239,107,NULL,3,2,1,0,0,0,0,'','',0.00),
(139,'Lógica app.js con reloj y gráfico canvas','Desarrollar app.js con la lógica principal: reloj en tiempo real, carga del dashboard, renderizado de la tabla de alumnos, gráfico de torta con canvas HTML5 y sistema de alertas visuales.','',3.00,NULL,NULL,0.00,'2026-05-13 00:05:16','2026-05-13 00:06:24',NULL,25,1239,107,NULL,3,2,1,0,0,0,0,'','',0.00),
(140,'Integración panel con endpoints del servidor','conectar todas las secciones del panel web con los endpoints reales de la API. Verificar que login, dashboard, tabla de asistencia, alertas y exportación funcionan de punta a punta.','',4.00,NULL,NULL,0.00,'2026-05-13 00:06:14','2026-06-03 17:15:24',NULL,25,1239,NULL,NULL,3,4,2,0,0,0,0,'','',0.00),
(141,'Vista SQL resumen_asistencia','Crear la vista resumen_asistencia en el esquema SQL que calcula automáticamente el total de clases, presentes, tardes, ausentes, justificadas y porcentaje de asistencia por alumno y materia.','',3.00,NULL,NULL,0.00,'2026-05-13 00:07:01','2026-06-03 17:15:58',NULL,25,1240,77,NULL,1,5,1,0,0,0,0,'','',0.00),
(142,'Vista SQL alumnos_en_riesgo',' Crear la vista alumnos_en_riesgo que filtra automáticamente los alumnos con 4 o más inasistencias injustificadas en cualquier materia, ordenados de mayor a menor.','',3.00,NULL,NULL,0.00,'2026-05-13 00:07:31','2026-06-03 17:16:07',NULL,25,1240,77,NULL,3,5,1,0,0,0,0,'','',0.00),
(143,'Endpoint GET /api/reportes/materia','Crear el endpoint que devuelve el historial completo de asistencia de una materia con filtros opcionales de fecha de inicio y fin. Usado para exportar reportes del personal.','',0.00,NULL,NULL,0.00,'2026-05-13 00:07:53','2026-06-16 19:40:25',NULL,25,1240,98,NULL,2,5,1,0,0,0,0,'durante el desarrollo hubo un bug que imprimía los reportes a pdf sin problema, pero, los dejaba vacíos. Fuera de eso el programa cumple con lo demás y ya solucionamos el bug.','',0.00),
(144,'Función exportarCSV() en el frontend',' Implementar en ajax.js la función que convierte los datos de asistencia a formato CSV con BOM UTF-8 para compatibilidad con Excel y genera la descarga directamente en el navegador sin librerías externas.','',0.00,NULL,NULL,0.00,'2026-05-13 00:08:36','2026-06-03 17:17:17',NULL,25,1240,107,NULL,2,5,1,0,0,0,0,'','',0.00),
(145,' Sección de reportes en el panel web',' Desarrollar la sección Reportes del panel web con filtros de materia y rango de fechas, tabla de resultados y botón de exportación a CSV.','',0.00,NULL,NULL,0.00,'2026-05-13 00:09:05','2026-06-03 17:17:29',NULL,25,1240,98,NULL,2,5,1,0,0,0,0,'','',0.00),
(146,'Módulo notificaciones.js con nodemailer','Desarrollar el archivo notificaciones.js que configura el transporte Gmail SMTP con nodemailer usando variables de entorno (.env). Incluye la función enviarEmail() que guarda cada envío en la base de datos.','El módulo se conecta a Gmail correctamente con las credenciales del .env. Los emails enviados quedan registrados en la tabla notificaciones. Los errores se guardan sin romper el flujo principal.',2.00,NULL,NULL,0.00,'2026-05-13 00:23:58','2026-06-03 17:18:09',NULL,25,1241,98,NULL,2,3,1,0,0,0,0,'','',0.00),
(147,'Lógica verificarNotificar() en server.js','Implementar la función que se llama después de cada fichada para verificar si el alumno acumuló 4 inasistencias (aviso) o 5 (crítico) y disparar el email correspondiente solo si no fue enviado en los últimos 30 días.','El aviso se envía exactamente en la 4ta inasistencia. El crítico se envía en la 5ta. No se repite si ya fue enviado ese mes. Las inasistencias justificadas no cuentan.',1.00,NULL,NULL,0.00,'2026-05-13 00:24:59','2026-06-03 17:18:21',NULL,25,1241,107,NULL,2,3,1,0,0,0,0,'','',0.00),
(148,'Plantilla HTML del email','Diseñar la plantilla HTML del email con el logo de la institución, color según el tipo (amarillo para aviso, rojo para crítico), mensaje personalizado con nombre del alumno y materia, y pie de página institucional.','El email se visualiza correctamente en Gmail, Outlook y en el celular. Los colores diferencian claramente aviso de crítico. El mensaje incluye nombre, materia y cantidad de faltas.\nResponsable: Máximo',0.00,NULL,NULL,0.00,'2026-05-13 00:26:06','2026-06-03 17:18:57',NULL,25,1241,107,NULL,2,3,1,0,0,0,0,'','',0.00),
(149,'Tabla notificaciones en la base de datos','Crear la tabla notificaciones en el esquema SQL para registrar cada email enviado con alumno, materia, tipo, destinatario, asunto, mensaje, estado de envío y fecha.','Cada email enviado queda registrado. Los errores de envío también se guardan con su detalle. El panel puede consultar el historial completo.',0.00,NULL,NULL,0.00,'2026-05-13 00:27:37','2026-06-03 17:19:14',NULL,25,1241,107,NULL,2,3,1,0,0,0,0,'','',0.00),
(150,'Configuración Gmail App Password','Crear la cuenta de Gmail institucional, activar la verificación en dos pasos y generar la contraseña de aplicación de 16 caracteres para configurar en el archivo .env del servidor.','El servidor envía un email de prueba exitosamente. La contraseña está guardada en .env y no en el código fuente. El email activo se puede activar/desactivar desde config.json.',0.00,NULL,NULL,0.00,'2026-05-13 00:28:09','2026-06-03 17:18:38',NULL,25,1241,77,NULL,1,3,1,0,0,0,0,'','',0.00),
(151,'Panel gestion_año.html con 4 pasos','Desarrollar la página de gestión del año lectivo con 4 pasos secuenciales: importar CSV, promover alumnos, actualizar horario y confirmar cierre. Cada paso tiene indicador visual de completado.','',0.00,NULL,NULL,0.00,'2026-05-13 00:31:36','2026-06-03 17:20:02',NULL,25,1242,107,NULL,2,5,1,0,0,0,0,'','',0.00),
(152,'Lógica de importación y validación de CSV','Implementar en gestion_anio.js el parseo del CSV, validación de cada fila (DNI válido, carrera correcta, campos obligatorios), vista previa con colores y confirmación de importación.','Las filas con error se marcan en rojo y se omiten. Las filas válidas se muestran en verde antes de confirmar. Los duplicados por DNI o legajo se omiten automáticamente.\nResponsable: Máximo',0.00,NULL,NULL,0.00,'2026-05-13 00:32:17','2026-06-03 17:20:22',NULL,25,1242,77,NULL,2,5,1,0,0,0,0,'','',0.00),
(153,'Endpoint POST /api/gestion/importar-alumnos',' Implementar el endpoint que recibe el array de alumnos validados, verifica duplicados en la base de datos e inserta los nuevos registros en una transacción atómica.','Los duplicados se omiten sin error. La transacción garantiza que si falla uno no se insertan ninguno. Devuelve el conteo de importados y omitidos.',0.00,NULL,NULL,0.00,'2026-05-13 00:33:10','2026-06-16 19:27:02',NULL,25,1242,77,NULL,1,5,1,1,0,0,0,'durante las pruebas llegamos a los resultados deseados con relativa facilidad. obvio atravesamos muchos bugs relacionados a que aunque una carga fallase igual se insertaban los demás durante la transacción, pero, al final supimos resolverlo.','',0.00),
(154,'Endpoint POST /api/gestion/promover-alumnos','Implementar el endpoint que recibe los cambios de año confirmados por el director (promover, recursante, egresar, baja) y los aplica en la base de datos en una transacción.','Cada alumno recibe exactamente la acción indicada. Los egresados y bajas quedan con activo=0. Los registros históricos no se tocan. Solo accesible para director y administrativo.',0.00,NULL,NULL,0.00,'2026-05-13 00:33:41','2026-06-16 19:26:46',NULL,25,1242,98,NULL,1,5,1,0,0,0,0,'testeando frente al profesor Codina el programa cumplió sin problemas. las opciones de promover, recurar, etc., funcionan sin ninguna complicación.','',0.00),
(155,'Elegir colores del logo','elegir la paleta de colores que va a distinguir nuestro logo','que los colores seleccionados entonen con los que ya utiliza el sistema y queden armoniosos',2.00,NULL,NULL,0.00,'2026-05-14 14:34:22','2026-05-14 14:35:58',NULL,26,1244,88,NULL,3,5,1,0,0,0,0,'elegimos usar tonalidades claras del azul para que entonen con el azul oscuro que utiliza nuestro sistema','',0.00),
(156,'Diseñar logo','Diseñar la forma y tamaño de nuestro logo','que el diseño sea simple y entone con la misión del proyecto',3.00,NULL,NULL,0.00,'2026-05-14 14:37:17','2026-05-14 14:40:34',NULL,26,1244,88,NULL,3,5,1,1,0,0,1,'el logo ya esta listo para digitalizarse y usarse en la pagina','',0.00),
(157,'Digitalizar Logo para usarlo en el sistema','Digitalizar el logo creado para utilizarlo en la aplicación web ','que se digitalice el logo como archivo .png para usarlo comodamente en la paginay que sea fiel al orginal',2.00,NULL,NULL,0.00,'2026-05-14 14:41:57','2026-05-14 14:44:06',NULL,26,1244,84,NULL,2,5,1,1,0,0,1,'el logo se digitalizo correctamente en un png para utilizarlo en la aplicación web','',0.00),
(158,'Integrar el logo digital en la pagina web','Integrar el png del logo para probar como queda en la pagina web y como se ajusta a la visión original','que el png del logo se ajuste correctamente al header y mantenga la estructura del logo digital original',1.00,NULL,NULL,0.00,'2026-05-14 14:46:16','2026-05-14 14:47:53',NULL,26,1244,79,NULL,1,5,1,1,0,0,1,'tarea cumplida, el logo mantiene el formato png, se ajusta y se distingue en el header','',0.00),
(159,'Diseñado de la Pagina','Bocetado de la pagina principal (Dashboard) donde se encuentre todos los menus y necesidades descriptas en el User History.  ','',0.00,NULL,NULL,0.00,'2026-05-14 14:53:56','2026-05-14 14:54:29',NULL,19,1248,80,NULL,2,4,1,0,0,0,0,'Revisar con el resto del equipo para aprobar el diseño ','',0.00),
(160,'Elección de la gama de colores','como desarrolladora quiero seleccionar la gama de colores de nuestra pagina para transmitirle al usuario que la pagina es seria y confiable','elegir gama de colores que entonen entre si y sean perfectos para decorar nuestra pagina web e inspiren confianza',3.00,NULL,NULL,0.00,'2026-05-14 14:56:04','2026-05-14 14:59:47',NULL,26,1249,88,NULL,1,5,1,0,0,0,0,'elegimos tonalidades de azul claro y oscuro junto a fondos blancos/negros, usualmente utilizados para representar responsabilidad o seriedad','',0.00),
(161,'Integrar los colores elegidos a la pagina web a modo de prueba','quiero integrar las gamas de colores sugeridas para probar cuales terminan de armonizar de la mejor forma','lograr añadir los colores satisfactoriamente a la pagina web y poder visualizarlos para decicir cual combinacion queda mejor',2.50,NULL,NULL,0.00,'2026-05-14 15:01:47','2026-05-14 15:03:53',NULL,26,1249,79,NULL,1,5,1,0,0,0,0,'se probo satisfactoriamente y se pudo visualizar, recibimos el visto buenos del profesor Gustavo Ramirez con la elección de colores y como entona con el logo','',0.00),
(162,'Pre proyecto documento','se debe entregar documentacion que plantee el problema que el proyecto espera resolver, y detallar como espera resolverlo ','',6.00,NULL,NULL,0.00,'2026-05-14 16:29:35','2026-05-21 12:55:55',NULL,22,1250,83,NULL,3,5,3,1,1,1,1,'https://docs.google.com/document/d/1JBQmmxniWJ91hbbLPIg-9p-S8YHg5h4i/edit?usp=sharing&ouid=113866535596344645863&rtpof=true&sd=true','https://docs.google.com/document/d/1JBQmmxniWJ91hbbLPIg-9p-S8YHg5h4i/edit?usp=sharing&ouid=113866535596344645863&rtpof=true&sd=true',0.00),
(163,'tipos de RFID','explicar tipos de lectores de radiofrecuencia','',0.00,NULL,NULL,0.00,'2026-05-18 14:23:03','2026-05-26 22:26:08',NULL,24,1245,76,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/1bpE27JoYsVCSpfJzEyeTJiEsZcBkdvLC',0.00),
(164,'usos de RFID','ejemplos de usos de todos los lectores de radiofrecuencia ','',1.00,NULL,NULL,0.00,'2026-05-18 14:25:37','2026-05-26 20:24:32',NULL,24,1245,101,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/1bpE27JoYsVCSpfJzEyeTJiEsZcBkdvLC',0.00),
(165,'Código ','código simple del RFID ','',0.00,NULL,NULL,0.00,'2026-05-18 14:26:50','2026-05-20 13:42:56',NULL,24,1245,97,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/100RckANUHM-2v68D159NWZTg0TIacwpN',0.00),
(166,'Redactar la problemática del sistema.','Establecer y redactar la problemática que el sistema.','Planteamiento del problema corregido y aprobado.',2.50,NULL,NULL,0.00,'2026-05-19 20:18:56','2026-06-18 14:41:01',NULL,23,1251,82,NULL,3,5,3,1,1,1,1,'','',0.00),
(167,'Redactar Objetivos para el sistema.','Establecer el objetivo general y especifico que cumplirá el sistema','Objetivo general y especificos corregidos y aprobados.',4.00,NULL,NULL,0.00,'2026-05-19 20:21:39','2026-06-18 14:40:49',NULL,23,1251,82,NULL,3,5,3,1,1,1,1,'','',0.00),
(168,'Redactar Justificación para el sistema. ','Establecer la justificación para el sistema.','Justificación del sistema corregido y aprobada.',3.00,NULL,NULL,0.00,'2026-05-19 20:24:33','2026-06-18 15:23:42',NULL,23,1251,82,NULL,3,5,3,1,1,1,1,'','',0.00),
(169,'Redactar Marco Teórico para el sistema.','Establecer el Marco Teórico para el sistema.','Marco teorico del sistema corregido y aprobado.',6.00,NULL,NULL,0.00,'2026-05-19 20:27:23','2026-06-18 14:44:01',NULL,23,1251,82,NULL,3,5,3,1,1,1,1,'','',0.00),
(170,'Establecer flujo de usuario para alumnos','Realizar el flujo de usuario para los alumnos del sistema','Flujo de usuario de alumnos apto para el sistema sin vulnerabilidades.',3.00,NULL,NULL,0.00,'2026-05-19 20:31:49','2026-05-19 20:32:23','2026-05-21 10:46:02',23,1252,73,NULL,3,3,1,0,0,0,0,'','',0.00),
(171,'Significado del logo','Debatir el concepto que debe representar el logo','obtener un logo con un concepto acorde al sistema.',1.00,NULL,NULL,0.00,'2026-05-19 21:59:46','2026-05-21 11:13:35',NULL,23,1253,73,NULL,2,5,1,0,0,1,0,'','https://docs.google.com/document/d/1TnkmlO7p1TukLwWdMUND0lyd5FIZqlfN/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(172,'Crear logo','Crear un logo acorde a los conceptos y debatirlo hasta ser aceptado.','Obtener un logo aceptado.',1.00,NULL,NULL,0.00,'2026-05-19 22:01:58','2026-05-21 10:39:02','2026-05-27 13:18:45',23,1253,73,NULL,2,5,1,0,0,0,0,'','',0.00),
(173,'Paleta de colores del logo','establecer una paleta de colores para el logo acorde a la psicología del color que queremos transmitir.','obtener un logo con una paleta establecida.',0.50,NULL,NULL,0.00,'2026-05-19 22:03:08','2026-05-21 11:19:08',NULL,23,1253,73,NULL,2,5,1,0,0,1,0,'','https://docs.google.com/document/d/1WCTJca07K5YjGYItkCsMMh-nBWf6IzTX/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(174,'Establecer flujo de usuarios para el docente ','Realizar el flujo de usuario para los docentes del sistema','Flujo de usuario de docentes apto para el sistema sin vulnerabilidades.',2.00,NULL,NULL,0.00,'2026-05-20 13:12:07','2026-05-20 13:13:00','2026-05-21 10:46:02',23,1252,73,NULL,3,2,1,0,0,0,0,'','',0.00),
(175,'Establecer flujo de usuarios para el preceptor','Realizar el flujo de usuario para los preceptores del sistema','Flujo de usuario de preceptores apto para el sistema sin vulnerabilidades.',3.00,NULL,NULL,0.00,'2026-05-20 13:15:04','2026-05-20 13:15:38','2026-05-21 10:46:02',23,1252,73,NULL,3,2,1,0,0,0,0,'','',0.00),
(176,'Identificar entidades principales','buscar y agregar al esquema cuales van a ser las entidades principales de nuestro sistema','documentar todas las entidades que tendra nuestro sistema',2.00,NULL,NULL,0.00,'2026-05-20 14:00:35','2026-05-29 20:36:59',NULL,26,1254,79,NULL,2,5,3,0,0,0,0,'se documento todo lo que vamos a usar por el momento','',0.00),
(177,'Consultas (Gustavo)','se requiere discutir con el profesor Ramirez Gustavo los limites institucionales para los profesores en cuanto al limite de materias, horarios o horas cátedras ','establecer limites de los docentes en cuanto a materias',-0.50,NULL,NULL,0.00,'2026-05-20 14:01:49','2026-05-20 14:02:44','2026-06-18 15:33:21',23,1256,82,NULL,3,5,3,0,0,0,0,'','',0.00),
(178,'Definir reglas del negocio','definir las reglas que va a tener a base de datos, por ej: un pedido pertenece a un solo cliente',NULL,1.50,NULL,NULL,0.00,'2026-05-20 14:03:43','2026-05-20 14:03:43','2026-05-29 20:37:18',26,1254,79,NULL,1,1,3,0,0,0,0,NULL,NULL,0.00),
(179,'Definir las relaciones','Definir en un texto las relaciones que van a tener las entidades en el esquema y la base de datos','Dejar relaciones bien definidas entre todas las entidades',1.50,NULL,NULL,0.00,'2026-05-20 14:07:25','2026-05-29 20:41:54',NULL,26,1254,79,NULL,1,5,3,0,0,0,0,'las relaciones se adjutaron al texto orginal','',0.00),
(180,'investigación de framework para el backend','investigacion de los frameworks express y laravel','se decide en base a la comodiad del equipo',1.50,NULL,NULL,0.00,'2026-05-20 14:13:01','2026-05-22 12:39:34',NULL,26,1255,88,NULL,3,5,1,0,0,0,0,'se decidio usar un framework de js (express) para el desarrollo del backend por comodidad del equipo','',0.00),
(181,'Dibujar un diagrama entidad-relación (DER)','Graficar las entidades, relaciones y atributos en un diagrama entidad relación','',6.00,NULL,NULL,0.00,'2026-05-20 14:14:17','2026-06-21 16:35:37',NULL,26,1254,79,NULL,2,5,3,0,0,1,0,'','https://docs.google.com/document/d/117RFefRjcfT0JRkpRagTYkQR0AIa9Y3L/edit?usp=sharing&ouid=106114398104167453070&rtpof=true&sd=true',0.00),
(182,'investigación de lenguaje para base de datos','investigar que lenguaje vamos a utilizar para la base de datos','que el equipo este de acuerdo con el lenguaje para la base de datos',1.50,NULL,NULL,0.00,'2026-05-20 14:14:57','2026-06-05 13:09:23',NULL,26,1255,79,NULL,3,5,1,0,0,0,0,'','',0.00),
(183,'Asignar atributos a las entidades','documentar en texto o dibujo los atributos que van a tener nuestras entidades para luego poder esquematizarlo','Que cada entidad definida tenga sus atributos propios',1.50,NULL,NULL,0.00,'2026-05-20 14:15:51','2026-05-29 20:39:04',NULL,26,1254,79,NULL,1,5,1,0,0,0,0,'se le asignaron atributos a todas las entidades creadas','',0.00),
(184,'Psicología del color del logo','Impacto visual del logo hacia los usuarios mediante la paleta de colores y sus significados.','Obtener una paleta de colores acorde a lo que queremos transmitir\n',1.00,NULL,NULL,0.00,'2026-05-21 10:37:54','2026-05-21 11:17:28',NULL,23,1253,73,NULL,2,5,3,0,0,1,0,'','https://docs.google.com/document/d/1XGd74IfNvC5Zugd3hk6dA3aQihxR0Sqb/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(185,'Establecer el buen manejo de su área','',NULL,0.00,NULL,NULL,0.00,'2026-05-21 10:58:18','2026-05-21 10:58:18','2026-05-21 11:11:13',23,1259,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(186,'Establecer el flujo de usuarios','',NULL,0.00,NULL,NULL,0.00,'2026-05-21 11:02:13','2026-05-21 11:02:13','2026-05-21 11:11:13',23,1259,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(187,'Establecer los limites del usuario dentro del sistema','',NULL,0.00,NULL,NULL,0.00,'2026-05-21 11:02:54','2026-05-21 11:02:54','2026-05-21 11:11:13',23,1259,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(188,'Limites del alumno','establecer los limites del usuario alumno dentro del sistema, alcance, operaciones posibles y vistas.','Todos los límites están establecidos correctamente',0.00,NULL,NULL,0.00,'2026-05-21 11:07:34','2026-05-28 22:05:31','2026-05-28 22:11:14',23,1260,73,NULL,3,5,3,0,0,1,0,'','',0.00),
(189,'Flujo de usuarios (Alumnos)','Establecer el flujo de usuarios del alumnado para que sea cómodo y eficiente.','El flujo de usuarios del alumnado esta completo y aprobado',3.00,NULL,NULL,0.00,'2026-05-21 11:09:31','2026-06-26 13:58:15',NULL,23,1260,73,NULL,2,5,1,0,0,1,0,'','https://canva.link/jny5r5vhcnpvhbz',0.00),
(190,'Maquetar Flujo de Usuario','Realizar en el maquetado de alumnos el flujo de usuario para hacerlo mas visual.',NULL,0.00,NULL,NULL,0.00,'2026-05-21 11:24:14','2026-05-21 11:24:14','2026-05-21 12:44:12',23,1260,NULL,NULL,1,1,3,0,0,0,0,NULL,NULL,0.00),
(191,'Encuesta con Usuarios Reales.','',NULL,0.00,NULL,NULL,0.00,'2026-05-21 11:24:45','2026-05-21 11:24:45','2026-05-28 22:16:00',23,1260,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(192,'Diseñar el primer boceto del logotipo','Diseñar Logotipo del programa y darle colores principales','',1.00,NULL,NULL,0.00,'2026-05-21 15:38:58','2026-05-21 15:40:28',NULL,21,1274,87,NULL,2,5,1,1,0,0,1,'Realizo un concepto de un buho con una tableta y libros en representacion de que es un programa para una biblioteca','',0.00),
(193,'Rediseño del logotipo ','Rediseñar el logo del programa y darle mas personalidad','',1.00,NULL,NULL,0.00,'2026-05-21 15:42:04','2026-05-21 15:43:22',NULL,21,1274,102,NULL,1,5,1,1,0,0,1,'Rediseño el buho proporcionando una gorra con el detalle de \"EET 24\" en el frente y dandole una chomba con colores de la promoción de TEP ','',0.00),
(194,'levantar la pagina en el servidor','lograr subir la pagina al servidor node.js ',NULL,0.00,NULL,NULL,0.00,'2026-05-22 10:54:56','2026-05-22 10:54:56',NULL,22,1267,83,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(195,'investigacion de framework para el frontend','investigar que framework vamos a utilizar para desarrollar el frontend','que el equipo este de acuerdo con la eleccion del framework para el frontend',1.50,NULL,NULL,0.00,'2026-05-22 11:34:32','2026-06-05 13:09:31',NULL,26,1255,79,NULL,1,5,1,0,0,0,0,'','',0.00),
(196,'identificar los niveles de usuario ','definir todos los tipos de usurio y su nivel de acceso','que esten bien definidos los niveles de acceso de los diferentes usuarios',1.00,NULL,NULL,0.00,'2026-05-22 11:52:09','2026-05-22 12:41:19','2026-06-11 12:55:54',26,1258,79,NULL,1,1,1,0,0,0,0,'','',0.00),
(197,'identificar las funciones que van a tener los distintos tipos de usuario','definir que funciones van a necesitar tener acceso los distintos usuarios sin interferir entre ellos','que esten todas las funcionalidades que vayan a necesitar los usuarios',1.50,NULL,NULL,0.00,'2026-05-22 11:52:33','2026-05-22 12:50:34',NULL,26,1258,88,NULL,1,1,1,0,0,0,0,'','',0.00),
(198,'diagramar el flujo de usuario','de forma grafica mostrar el recorrido que hace cada nivel de usuario','que sea funcional a las necesidades de cada usuario',6.00,NULL,NULL,0.00,'2026-05-22 11:52:58','2026-06-29 10:58:59',NULL,26,1258,88,NULL,1,2,1,0,0,0,0,'','',0.00),
(199,'Probar los escaneres','Probar los escáneres adquiridos para revisar si funcionan.','',0.50,NULL,NULL,0.00,'2026-05-22 11:55:27','2026-06-05 12:21:21',NULL,26,1280,84,NULL,3,5,1,0,0,0,0,'','',0.00),
(200,'Encontrar el manual de los ecaneres y leerlo ','Encontrar el manual de los escáneres y leerlo para poder ver como funciona correctamente','',0.30,NULL,NULL,0.00,'2026-05-22 12:14:29','2026-06-05 12:21:31',NULL,26,1280,84,NULL,1,5,1,0,0,0,0,'','',0.00),
(201,'Configurar los escáneres para su correcto uso','Configurar los escáneres para que puedan leer correctamente el código de barras y entregan la información correctamente','',2.00,NULL,NULL,0.00,'2026-05-22 12:26:42','2026-06-05 12:21:46',NULL,26,1280,84,NULL,2,5,1,0,0,0,0,'','',0.00),
(202,'Agregar los Escaneres al codigo de la app web','Insertar codigo que procese lo que leen los  escaneres en el codigo  de nuestra app web','que funcione correctamente en el codigo y no genere errores',1.50,NULL,NULL,0.00,'2026-05-22 12:27:56','2026-05-22 13:14:18',NULL,26,1280,79,NULL,2,1,1,0,0,0,0,'','',0.00),
(203,'tarea paara guille','hola guillle','anda?',3.00,NULL,NULL,0.00,'2026-05-22 12:31:28','2026-05-22 12:39:07',NULL,12,1263,103,NULL,1,5,3,1,1,1,1,'todo bien , parece','dfdgdfgdfg',0.00),
(204,'Informacion sobre la tecnologia NFC','La tecnología NFC (Near Field Communication o Comunicación de Campo Cercano) es una red inalámbrica de corto alcance y alta frecuencia que permite el intercambio instantáneo y seguro de datos entre dispositivos. Funciona bajo el estándar de 13,56 MHz y transmite información al acercar los aparatos a menos de 4-10 centímetros.Características principales:Sin contacto ni emparejamiento: No requiere cables ni configuraciones manuales o códigos largos como en Bluetooth. La conexión es automática e inmediata al aproximar los equipos.Dos modos de operación:Activo: Ambos dispositivos cuentan con fuente de energía (ej. dos teléfonos compartiendo fotos).Pasivo: Un dispositivo (ej. un teléfono) genera el campo electromagnético para alimentar a un chip sin batería propia (ej. una etiqueta inteligente tag, una tarjeta de crédito o la tarjeta SUBE).Alta seguridad: Su corto rango de alcance evita el hackeo a distancia y, en los pagos móviles, suele exigir autenticación biométrica (como huella dactilar) o PIN.Consumo mínimo de energía: Al operar a distancias tan cortas, la energía que utiliza es extremadamente baja.Independiente de internet: Para el pago móvil o la lectura de tarjetas no se requiere conexión a Wi-Fi o datos móviles.Usos habituales:Pagos móviles: Permite vincular tarjetas de crédito o débito a tu celular (a través de plataformas como Google Pay o Apple Pay) y pagar acercándolo a una terminal POS.Transporte público: Permite acreditar cargas y consultar saldos de tarjetas como la tarjeta SUBE apoyándola directamente sobre la parte trasera del teléfono.Automatización: Se utiliza con tags NFC adhesivos. Al rozarlos con el móvil, el teléfono ejecuta acciones predeterminadas (ej. apagar el WiFi, activar el modo silencio, o configurar una alarma).Conexión rápida: Permite vincular de forma instantánea auriculares, parlantes u otros accesorios compatibles con solo acercarlos','',0.50,NULL,NULL,0.00,'2026-05-26 18:55:14','2026-05-26 18:55:27',NULL,21,1287,72,NULL,2,5,3,0,0,0,0,'','',0.00),
(205,'Cambio de DB','',NULL,0.00,NULL,NULL,0.00,'2026-05-26 19:06:40','2026-05-26 19:06:40','2026-05-26 19:07:00',21,1288,87,NULL,3,1,1,0,0,0,0,NULL,NULL,0.00),
(206,'Cambio de DB','Realizar cambio del formato \".mst\" a formato \".sql\" u/o otro formato','',0.00,NULL,NULL,0.00,'2026-05-26 19:08:55','2026-06-02 20:38:12',NULL,21,1290,87,NULL,1,5,1,1,0,0,0,'','',0.00),
(207,'Realizar y documentar el planteo del problema del proyecto en el Anteproyecto','desarrollar el planteo de problema del proyecto para la carpeta anteproyecto siguiendo las consignas del pdf dado en clase','',0.00,NULL,NULL,0.00,'2026-05-26 19:10:07','2026-05-26 19:12:30','2026-05-28 14:17:54',21,1288,102,NULL,3,1,3,0,0,0,0,'','',0.00),
(208,'Realizar el marco teorico para el anteproyecto','desarrollar el marco teorico del proyecto para la carpeta anteproyecto siguiendo las consignas del pdf dado en clase',NULL,0.00,NULL,NULL,0.00,'2026-05-26 19:12:04','2026-05-26 19:12:04','2026-05-28 14:17:55',21,1289,102,NULL,1,1,3,0,0,0,0,NULL,NULL,0.00),
(209,'maquetación digital ','maquetado con los componentes necesarios para su funcionamiento ','',0.00,NULL,NULL,0.00,'2026-05-27 11:07:27','2026-06-05 15:31:46',NULL,24,1291,97,NULL,1,5,3,0,0,1,0,'','https://drive.google.com/drive/folders/128JWsm1jZJxoV3glGs3VFGwdvl9Qg943',0.00),
(210,'documento explicativo','que explique qué es lo que hace ese maquetado','',0.00,NULL,NULL,0.00,'2026-05-27 11:08:33','2026-06-05 15:32:29',NULL,24,1291,97,NULL,1,5,2,0,0,1,0,'','https://docs.google.com/document/d/1RLT-3NOYtS3HpJ1vE8XewwBOBHjhDmB5/edit',0.00),
(211,'explicación de los componentes','explicar cuál es el funcionamiento de los componentes en el caso maquetado.','',1.00,NULL,NULL,0.00,'2026-05-27 11:09:26','2026-06-09 11:18:13',NULL,24,1291,101,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/182OmE9adanBJ928idmhfpsli7Rh-LFjM/edit',0.00),
(212,'usuario','la base de datos con la información de los usuarios','',0.00,NULL,NULL,0.00,'2026-05-27 13:10:27','2026-06-05 14:32:06',NULL,24,1292,76,NULL,2,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/1bpE27JoYsVCSpfJzEyeTJiEsZcBkdvLC',0.00),
(213,'inventario','base de datos con la información de lo que ya hay en la caja para mantener un inventario','',0.00,NULL,NULL,0.00,'2026-05-27 13:11:37','2026-06-05 14:32:24',NULL,24,1292,76,NULL,2,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/1bpE27JoYsVCSpfJzEyeTJiEsZcBkdvLC',0.00),
(214,'Investigar placa','Investigar que placa nos conviene para trabajar, teniendo en cuenta que trabaje con el ESP32 con el que pensamos trabajar','Que se encuentre una placa útil con la que podamos trabajar correctamente.',1.50,NULL,NULL,0.00,'2026-05-27 13:40:13','2026-05-27 13:40:49',NULL,30,1247,81,NULL,3,5,3,0,0,0,0,'','',0.00),
(215,'Informarnos sobre que sensores de luz','Informarnos sobre que sensores nos conviene utilizar para poder trabajar con el tema de la luz.','Encontrar un sensor que funcione correctamente y nos sirva de manera que podamos trabajar con la placa seleccionada.',0.50,NULL,NULL,0.00,'2026-05-27 13:43:07','2026-05-27 13:43:33',NULL,30,1247,81,NULL,3,5,3,0,0,0,0,'','',0.00),
(216,'Investigar sobre sensores de gas','Buscar un sensor útil para poder trabajar, que detecte el gas y el humo para poder trabajar con nuestra placa.','Encontrar un sensor útil y que se permita trabajar con la placa seleccionada.',0.50,NULL,NULL,0.00,'2026-05-27 13:45:01','2026-05-28 13:25:00',NULL,30,1247,71,NULL,3,5,1,0,0,0,0,'','',0.00),
(217,'Investigar sobre sensores de movimiento ','Encontrar un movimiento sensible al movimiento que nos sirva para poder trabajar con la placa que usemos.','Que encontremos un sensor útil para poder trabajar con la placa seleccionada,',0.50,NULL,NULL,0.00,'2026-05-27 13:45:33','2026-05-28 13:24:52',NULL,30,1247,78,NULL,1,5,1,1,0,0,0,'','',0.00),
(218,'Hablar con profesores sobre los sensores','Hablar con algún profesor que nos ayude a elegir algunos sensores e informarnos sobre como utilizarlos','Que los profesores nos acepten la idea de que sensores usar y poder elegir correctamente los sensores con los que vamos a trabajar.',2.00,NULL,NULL,0.00,'2026-05-27 13:46:55','2026-05-27 13:48:24',NULL,30,1247,81,NULL,3,5,1,1,0,0,0,'','',0.00),
(219,'Empezar a hacer el circuito inicial','Hacer un circuito que ya conecte los primeros sensores, los buzzers y etc.','Que el circuito quede de manera correcta para no quemar ningún componente.',2.50,NULL,NULL,0.00,'2026-05-27 13:54:45','2026-06-04 21:16:54',NULL,30,1283,71,NULL,3,5,1,1,0,0,0,'','',0.00),
(220,'Función correcta de sensor MQ-2','Armar un código que funcione con el sensor MQ-2.','Que el MQ-2 detecte gas, y que el buzzer genere un sonido sobre que el sensor detectó el gas.',12.00,NULL,NULL,0.00,'2026-05-27 14:00:14','2026-06-04 21:17:41',NULL,30,1283,71,NULL,3,5,1,1,0,0,0,'','',0.00),
(221,'Función correcta del sensor PIR','Que el sensor PIR logre funcionar correctamente en nuestro circuito y con el código.','Que el sensor PIR funcione correctamente en conjunto con el sensor LDR.',2.00,NULL,NULL,0.00,'2026-05-27 14:01:26','2026-05-28 11:10:35',NULL,30,1283,71,NULL,3,1,1,0,0,0,0,'','',0.00),
(222,'Función correcta del sensor LDR','Que el sensor LDR tenga una funcionalidad correcta dentro de nuestro circuíto y que funcione bien con el código.','Que el sensor LDR funcione correctamente en el circuito junto al sensor LDR.',2.00,NULL,NULL,0.00,'2026-05-27 14:05:22','2026-05-28 11:10:44',NULL,30,1283,71,NULL,3,1,1,0,0,0,0,'','',0.00),
(223,'Diseñado en Canvas del Login','Creacion del maquetado en forma de guia del proyecto','',0.00,NULL,NULL,0.00,'2026-05-27 14:10:57','2026-05-27 14:12:05',NULL,19,1293,80,NULL,1,5,1,0,0,0,0,'','',0.00),
(224,'Creacion de la pagina del login en formato CSS y HTML','Creacion de la pagina en su version alfa para su testeo en diseño','',0.00,NULL,NULL,0.00,'2026-05-27 14:11:55','2026-05-28 12:43:34',NULL,19,1293,70,NULL,1,5,1,0,0,0,0,'','',0.00),
(225,'Documentacion de la pagina del login','Documentar el codigo y subirlo a la carpeta de campo','',0.00,NULL,NULL,0.00,'2026-05-27 14:13:12','2026-05-27 14:15:33',NULL,19,1293,95,NULL,2,1,3,0,0,0,0,'','',0.00),
(226,'Creacion del Modulo de la Base de datos para la utilizacion en la pagina','Creacion de las tablas para la proxima conexion con la pagina','',0.00,NULL,NULL,0.00,'2026-05-27 14:13:59','2026-06-01 11:57:42',NULL,19,1293,95,NULL,1,5,1,0,0,0,0,'','',0.00),
(227,'Conexiones con la Base de datos','Que la base de datos este de forma funcional para el login del usuario','',0.00,NULL,NULL,0.00,'2026-05-27 14:15:06','2026-06-01 11:57:31',NULL,19,1293,95,NULL,1,5,1,0,0,0,0,'','',0.00),
(228,'Creacion de la pagina usando CSS y HTML basico para diseño','Creacion de la pagina sin funcionalidad para confirmacion de diseño','',0.00,NULL,NULL,0.00,'2026-05-27 14:17:18','2026-06-23 17:27:23',NULL,19,1248,70,NULL,2,5,1,0,0,0,0,'','',0.00),
(229,'Creacion de la base de datos para la funcionalidad de la pagina','Creacion de las posibles tablas utilizables en la pagina ','',0.00,NULL,NULL,0.00,'2026-05-27 14:18:49','2026-06-01 11:26:00',NULL,19,1248,95,NULL,1,5,1,1,1,0,1,'','',0.00),
(230,'Creacion del esquema de la base de datos ','Mostrar de forma grafica el esquema de la base de datos con sus cardinalidades','',0.00,NULL,NULL,0.00,'2026-05-27 14:22:22','2026-06-01 11:26:20',NULL,19,1248,95,NULL,1,5,1,1,1,0,1,'','',0.00),
(231,'Transcripcion de las User Histories','Intentar al menos realizar 2 de las User histories propuestas por codina, de manera clara en cada tarea.','',0.00,NULL,NULL,0.00,'2026-05-27 14:35:32','2026-05-27 14:36:13',NULL,19,1294,70,NULL,1,1,3,0,0,0,0,'','',0.00),
(232,'Transcripcion de las User Histories','Intentar al menos realizar 2 de las User histories propuestas por codina, de manera clara en cada tarea.','',0.00,NULL,NULL,0.00,'2026-05-27 14:36:27','2026-06-02 16:26:28',NULL,19,1294,95,NULL,1,5,3,0,0,0,0,'','',0.00),
(233,'Transcripcion de las User Histories','Intentar al menos realizar 2 de las User histories propuestas por codina, de manera clara en cada tarea.',NULL,0.00,NULL,NULL,0.00,'2026-05-27 14:37:10','2026-05-27 14:37:10',NULL,19,1294,80,NULL,1,1,3,0,0,0,0,NULL,NULL,0.00),
(234,'Transcribir todas las user histories a la carpeta de campo','Crear un apartado nuevo de entrevistas en la carpeta de campo y en el notion para colocar las user histories y los comentarios',NULL,0.00,NULL,NULL,0.00,'2026-05-27 14:38:22','2026-05-27 14:38:22',NULL,19,1294,95,NULL,1,1,3,0,0,0,0,NULL,NULL,0.00),
(235,'Investigar disintos casos','Investigar proyectos que hayan trabajado con adultos mayores y comparar casos.','Encontrar uno o más casos distintos útiles para basarnos en él.',1.00,NULL,NULL,0.00,'2026-05-28 10:43:18','2026-05-28 10:44:56',NULL,30,1246,78,NULL,3,5,3,1,0,0,0,'','',0.00),
(236,'Encontrar errores en otros proyectos.','Buscar y encontrar errores en otros proyectos, para ver que tenemos que evitar','Haber encontrado mínimamente 2 o 3 problemas para poder entender que debemos o no debemos hacer.',1.50,NULL,NULL,0.00,'2026-05-28 10:46:23','2026-05-28 10:49:53',NULL,30,1246,78,NULL,2,5,1,0,0,0,0,'','',0.00),
(237,'Información sobre app móvil','Buscar información sobre que usar para poder diseñar la aplicación móvil, buscando estilos de diseño, y una base fundamental.','Encontrar una base sólida en la cual poder basarnos para poder empezar a hacer una base de aplicación móvil.',1.50,NULL,NULL,0.00,'2026-05-28 10:58:07','2026-05-28 10:59:02','2026-06-18 14:23:29',30,1295,71,NULL,1,5,1,1,0,0,0,'','',0.00),
(238,'Desarrollar una base','Empezar a desarrollar un prototipo que funcione correctamente para testear funcionalidades, ver como se desarrolla el avance y luego pasarlo a móvil.','Desarrollar página que nos permita tener una base de como va a funcionar, usandola como referencia para mas adelante pasarla a aplicación móvil.',12.00,NULL,NULL,0.00,'2026-05-28 11:01:08','2026-05-28 11:01:56',NULL,30,1295,78,NULL,3,5,1,0,0,0,0,'','',0.00),
(239,'Pasar a app móvil.','Buscar un motor que nos beneficie para poder pasar nuestra página a una aplicación móvil y que mantenga sus correctas funcionalidades.','',5.00,NULL,NULL,0.00,'2026-05-28 11:03:55','2026-06-09 18:50:16',NULL,30,1295,78,NULL,3,5,1,0,0,0,0,'','',0.00),
(240,'Conectar la app movil al servidor y bd','Lograr conectar la aplicación móvil al servidor y a la base de datos donde se carguen los datos de cosas como los medicamentos y horarios.','',9.00,NULL,NULL,0.00,'2026-05-28 11:04:54','2026-06-26 17:47:01',NULL,30,1295,78,NULL,3,2,1,0,0,0,0,'','',0.00),
(241,'Placa wifi','Estudiar sobre como podemos utilizar una placa wifi en nuestro proyecto, para poder conectar a wifi, y linkearlo con el servidor, la base de datos, y la aplicación móvil.','Encontrar información correcta para poder usar la conexión wifi en nuestro proyecto y poder implementarlo.',0.00,NULL,NULL,0.00,'2026-05-28 11:06:15','2026-05-28 11:06:53','2026-06-09 18:49:39',30,1247,NULL,NULL,2,1,1,0,0,0,0,'','',0.00),
(242,'Integrar placa wifi','Integrar la placa de wifi dentro del circuito para poder conectar todo en uno y poder utilizar el wifi en cosas como el servidor y la base de datos.','Integrar la placa wifi, para poder lograr una conexión correcta y estable de wifi en el proyecto.',0.00,NULL,NULL,0.00,'2026-05-28 11:07:31','2026-05-28 11:08:01','2026-05-28 11:08:40',30,1247,NULL,NULL,2,1,1,0,0,0,0,'','',0.00),
(243,'Integrar placa de wifi','Integrar la placa de wifi dentro del circuito para poder conectar todo en uno y poder utilizar el wifi en cosas como el servidor y la base de datos.','Integrar la placa de wifi, para poder mantener una conexión correcta y estable para poder conectar con el proyecto.',0.00,NULL,NULL,0.00,'2026-05-28 11:10:25','2026-05-28 11:10:28','2026-06-09 18:49:48',30,1283,NULL,NULL,2,1,1,0,0,0,0,'','',0.00),
(244,'decidir que preguntas hacerle al usuario','tenemos que decidir que preguntas hacerle al usuario para evitar improvisar en el momento de la entrevista','que sean al menos 8 preguntas que se relacionen con el uso tecnico y experiencia de usuario de sus softwares/aplicaciones genericas ',0.50,NULL,NULL,0.00,'2026-05-28 12:15:53','2026-06-29 10:57:55',NULL,26,1296,88,NULL,1,5,1,0,0,0,0,'aa','',0.00),
(245,'recolectar las respuestas del usuario','a la hora de la entrevista hay que grabar/escribir las respuestas del usuario obviamente con su permiso para documentarlas correctamente despues','en lo posible ser lo mas especifico con lo que dice el usuario ',1.50,NULL,NULL,0.00,'2026-05-28 12:22:45','2026-05-29 20:28:18',NULL,26,1296,88,NULL,1,5,1,0,0,0,0,'volvi a escuchar los audios para transcribir la informacion y tener todo mas ordenado','',0.00),
(246,'documentar las respuestas del usuario ','necesitamos documentar las respuestas del usuario para la carpeta de campo','que cumpla con los criterios que piden los profesores, que sea conciso y honesto',3.00,NULL,NULL,0.00,'2026-05-28 12:26:37','2026-06-11 12:56:50',NULL,26,1296,88,NULL,1,1,1,0,0,0,0,'','',0.00),
(247,'investigar como diagramar el flujo de usuario','hacer una investigacion donde se vea como graficar de forma correcta y eficiente','definir el punto de entrada, diagramando las acciones y decisiones',1.00,NULL,NULL,0.00,'2026-05-28 13:21:39','2026-05-29 20:29:41',NULL,26,1258,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(248,'Corrección de Ante-Proyecto','Realizar correcciones en la parte de \n- Planteo de problema\n- Marco teorico','',2.00,NULL,NULL,0.00,'2026-05-28 14:21:31','2026-06-01 11:45:52',NULL,21,1297,102,NULL,3,5,3,1,0,0,1,'','',0.00),
(249,'Crear la BD','No hizo falta crear una base de datos nueva, logramos pasar la base de datos original de la biblioteca a una mejor base de datos para poder trabajar de manera más sencilla y sin necesidad de crear desde cero una Base de Datos.','',0.00,NULL,NULL,0.00,'2026-05-28 14:22:20','2026-06-02 20:39:37',NULL,21,1290,87,NULL,3,5,1,0,0,0,0,'','',0.00),
(250,'Maquetado alumnos ','','',2.50,NULL,NULL,0.00,'2026-05-28 19:28:25','2026-06-11 12:21:37','2026-06-11 13:57:38',23,1298,73,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/1myWSI8HfNNr7wZmWQ0tBhnLN1upJYtal?usp=sharing',0.00),
(251,'Maquetado profesores','','',3.50,NULL,NULL,0.00,'2026-05-28 19:39:38','2026-06-11 12:21:54','2026-06-11 13:57:38',23,1298,73,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/1RTogsNzO6DcuhAj8Xol5AAsebJ6dtxAq?usp=sharing',0.00),
(252,'Restricciones de los estudiantes','establecer los limites del usuario alumno dentro del sistema, alcance, operaciones posibles y vistas.','',1.50,NULL,NULL,0.00,'2026-05-28 22:07:06','2026-06-11 12:20:24',NULL,23,1299,73,NULL,2,5,1,0,0,1,0,'','https://docs.google.com/document/d/1D-sDHasEVO8lhrDxL-ITH14IOmREKXKj/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(253,'Restricciones de los docentes','establecer los limites del usuario profesor dentro del sistema, alcance, operaciones posibles y vistas.','',1.00,NULL,NULL,0.00,'2026-05-28 22:08:13','2026-06-18 15:34:40',NULL,23,1299,73,NULL,2,5,1,0,0,1,0,'','https://docs.google.com/document/d/1DazUUX4iYFUTrj4U7PJma-m4sZngtXMl/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(254,'Restricciones de los directivos','','',1.00,NULL,NULL,0.00,'2026-05-28 22:08:38','2026-06-18 15:35:31',NULL,23,1299,73,NULL,2,5,1,0,0,1,0,'','https://docs.google.com/document/d/1muDzgLwjavQ93MsSwnFe02OakuYhymZq/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(255,'Restricciones de los auxiliares docente','','',1.00,NULL,NULL,0.00,'2026-05-28 22:09:08','2026-06-18 15:34:56',NULL,23,1299,73,NULL,2,5,1,0,0,1,0,'','https://docs.google.com/document/d/1k5IsC8cvVw3aaVgt0CKOF53lIyAa3Qr7/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(256,'Restricciones del administrador (Marcos)','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:09:39','2026-05-28 22:09:39','2026-06-17 11:59:57',23,1299,73,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(257,'Encuesta a alumnos ','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:14:46','2026-05-28 22:14:46',NULL,23,1300,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(258,'Encuesta a profesores','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:14:59','2026-05-28 22:14:59',NULL,23,1300,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(259,'Encuesta a auxiliares docentes','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:15:13','2026-05-28 22:15:13',NULL,23,1300,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(260,'Encuesta a administrador ','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:15:26','2026-05-28 22:15:26',NULL,23,1300,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(261,'Encuesta a directivos','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:15:39','2026-05-28 22:15:39',NULL,23,1300,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(262,'Flujo de usuarios (profesores)','','',3.50,NULL,NULL,0.00,'2026-05-28 22:18:20','2026-06-26 13:59:13',NULL,23,1260,73,NULL,2,5,1,0,0,1,0,'','https://canva.link/i31c1oxlydsdhr1',0.00),
(263,'Flujo de usuarios (auxiliar docente)','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:18:50','2026-05-28 22:18:50',NULL,23,1260,73,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(264,'Flujo de usuarios (directivos)','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:19:09','2026-05-28 22:19:09',NULL,23,1260,73,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(265,'Flujo de usuarios (administrador)','',NULL,0.00,NULL,NULL,0.00,'2026-05-28 22:19:28','2026-05-28 22:19:28','2026-06-11 19:27:57',23,1260,73,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(266,'Realizacion de la carpeta de Anteproyecto','','',3.00,NULL,NULL,0.00,'2026-06-01 11:38:33','2026-06-01 11:39:01',NULL,21,1297,102,NULL,3,5,3,1,0,0,1,'','',0.00),
(267,'Realizar maqueta digital de la app','realizar una app web de biblioteca que cumpla con las siguientes consignas: la base es una pagina diseñada a sistemas de inventario para biblioteca, los colores principales son el blanco, azul y el naranja. Posee funciones de login que divide el sistema en usuario y administrador.\nLOS USUARIOS tendran la posibilidad de que material de la biblioteca esta disponible dentro de la pagina como libros, folletos, revistas, etc y podran solicitar un prestamo del mismo material donde se identificara el titulo del libro, autor, si son varios tendra q colocar la cantidad de libros o si es uno solo dira q solo lleva una unidad, fecha de inicio del prestamo y fecha de devolucion, A su vez otra funcionalidad que posee el usuario es visualizar la cantidad de prestamos echos, cuales estan vigentes y cuales estan por caducar. \nEl administrador tendra la posibilidad de poder visualizar la cantidad de usuarios que esten logeados y cuantos prestamos realizo cada uno y quienes adeudan libros (prestamos), al final del mes se podra hacer una estadistica de cuantos prestamos se realizaron. el administrador tambien posee la funcion de agregar libros o agregar stock.','',0.50,NULL,NULL,0.00,'2026-06-01 11:43:41','2026-06-05 12:25:42','2026-06-05 12:26:15',21,1301,102,NULL,1,5,1,0,0,0,1,'','',0.00),
(268,'Desarrollar una pagina web','En base al maquetado digital, desarollar una pagina web','',0.00,NULL,NULL,0.00,'2026-06-01 11:44:39','2026-06-26 13:26:40',NULL,21,1301,87,NULL,2,2,1,0,1,0,0,'','',0.00),
(269,'Corrección de Ante-proyecto 2','Reorganizacion de la carpeta de Anteproyecto siguiendo el orden q se muestra en el pdf ','',0.50,NULL,NULL,0.00,'2026-06-01 11:46:42','2026-06-10 01:15:35',NULL,21,1297,102,NULL,2,5,3,1,0,0,0,'','',0.00),
(270,'Corrección de carpeta anteproyecto 3','Correcciónes en la carpeta de anteproyecto en las partes de\n-marco metodologico',NULL,0.00,NULL,NULL,0.00,'2026-06-01 11:48:56','2026-06-01 11:48:56',NULL,21,1297,102,NULL,2,1,3,0,0,0,0,NULL,NULL,0.00),
(271,' Motor de audio (AudioEngine)','Inicialización del dispositivo de audio con AudioDeviceManager\nReproducción de clips de audio en múltiples pistas simultáneas\nControl de volumen por pista con paneo stereo (ley de potencia constante)\nGrabación desde micrófono con buffer circular\nMetrónomo sincronizado al BPM con click de 1 kHz\nExportación offline a archivo WAV',' El motor debe inicializar el hardware, reproducir pistas sincrónicas, aplicar paneo de potencia constante, grabar en buffer circular, sincronizar el clic a 1 kHz y exportar a WAV.',0.00,NULL,NULL,0.00,'2026-06-01 16:30:14','2026-06-01 17:03:09',NULL,20,1229,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(272,'Configuración del entorno','Instalación de JUCE 8, CMake y Visual Studio. Configuración del proyecto con CMakeLists.txt para compilar en Windows.','',0.00,NULL,NULL,0.00,'2026-06-01 16:41:50','2026-06-01 16:42:02',NULL,20,1228,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(273,'Estructura base del proyecto','Creación de la ventana principal (DocumentWindow), entry point (Main.cpp) y componente raíz (MainComponent).','',0.00,NULL,NULL,0.00,'2026-06-01 16:45:15','2026-06-01 16:45:24',NULL,20,1228,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(274,' Pantalla de carga (Splash Screen)','Componente temporal con animación de fade-out de 2,5 segundos. Muestra el nombre del proyecto con tipografía grande antes de revelar la interfaz.','',0.00,NULL,NULL,0.00,'2026-06-01 16:52:43','2026-06-01 16:52:51',NULL,20,1228,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(275,' Tema visual Catppuccin Frappe','Implementación de un LookAndFeel personalizado (FrappeTheme) con todos los colores de la paleta aplicados a botones, sliders, tabs, labels y ventanas.','',0.00,NULL,NULL,0.00,'2026-06-01 16:55:45','2026-06-01 17:00:43',NULL,20,1228,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(276,'Barra de transporte',' Botones PLAY / PAUSE / STOP / REC / METRO / LOOP / MON IN, slider de volumen master, slider de BPM y display de posición en formato MM:SS.ms.','',0.00,NULL,NULL,0.00,'2026-06-01 16:58:39','2026-06-01 17:00:53',NULL,20,1228,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(277,'Atajos de teclado','Espacio = Play/Pause, R = Iniciar grabación (si hay pista armada).','',0.00,NULL,NULL,0.00,'2026-06-01 17:00:18','2026-06-01 17:01:02',NULL,20,1228,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(278,' Input Monitor (retorno de micrófono)',' Botón en la barra de transporte que activa/desactiva el paso directo del micrófono a la salida de audio, permitiendo escucharse en tiempo real durante la grabación.','',0.00,NULL,NULL,0.00,'2026-06-01 18:09:10','2026-06-01 18:09:31',NULL,20,1229,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(279,' Panel de configuración de audio',' Selector de dispositivo de entrada/salida y control de tamaño de buffer (64 a 2048 muestras).','',0.00,NULL,NULL,0.00,'2026-06-01 18:12:35','2026-06-01 18:13:13',NULL,20,1229,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(280,'Filtro EQ biquad',' Implementación manual del filtro Peaking EQ (fórmula del Audio EQ Cookbook) en precisión doble, sin dependencias externas. Cadena de 3 bandas (Low / Mid / High) por pista.\n','',0.00,NULL,NULL,0.00,'2026-06-01 18:17:01','2026-06-01 18:23:41',NULL,20,1230,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(281,' Sistema de actualización dinámica del EQ',' Los coeficientes del filtro se recalculan automáticamente cuando el usuario mueve un knob, usando un flag atómico (std::atomic<bool> dirty) para comunicación segura entre el hilo de UI y el hilo de audio.','',0.00,NULL,NULL,0.00,'2026-06-01 18:19:10','2026-06-01 18:23:48',NULL,20,1230,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(282,'Panel Mixer','Canal por pista con fader de volumen, 3 knobs de EQ rotativo y botones Mute / Solo.','',0.00,NULL,NULL,0.00,'2026-06-01 18:20:42','2026-06-01 18:23:55',NULL,20,1230,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(283,'Loop de reproducción',' El botón LOOP está en la UI pero aún no tiene funcionalidad. Requiere definir puntos de entrada/salida en el timeline.\n Estado: botón presente, lógica pendiente.',' Al activar LOOP, el cabezal debe regresar automáticamente al punto de inicio al alcanzar el punto de fin definido.',0.00,NULL,NULL,0.00,'2026-06-01 18:23:03','2026-06-01 18:23:28',NULL,20,1230,96,NULL,3,2,1,0,0,0,0,'','',0.00),
(284,'Eliminación de pistas','Agregar un botón de eliminar en el header de cada pista.',NULL,0.00,NULL,NULL,0.00,'2026-06-01 18:26:13','2026-06-01 18:26:13',NULL,20,1230,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(285,'Nombre editable de clips y pistas','Doble-click sobre el nombre para editar inline.',NULL,0.00,NULL,NULL,0.00,'2026-06-01 18:27:09','2026-06-01 18:27:09',NULL,20,1230,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(286,'Plugin VST3 (hosting básico)',' Investigar la integración de juce::AudioPluginFormatManager para cargar efectos externos.',NULL,0.00,NULL,NULL,0.00,'2026-06-01 18:28:33','2026-06-01 18:28:33',NULL,20,1230,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(287,' Timeline y visualización de pistas',' Regla de tiempo con marcas en segundos, vista de forma de onda por clip, arrastre del playhead con click en la regla.','',0.00,NULL,NULL,0.00,'2026-06-01 18:31:26','2026-06-01 18:31:36',NULL,20,1231,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(288,' Importación de audio',' Doble-click en una pista abre un selector de archivos (WAV, AIFF, MP3, FLAC, OGG) e importa el audio en la posición elegida.','',0.00,NULL,NULL,0.00,'2026-06-01 18:33:16','2026-06-01 18:33:25',NULL,20,1231,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(289,' Edición de clips (cortar / copiar / pegar)',' Actualmente los clips solo se pueden importar y reproducir. El objetivo es poder seleccionar un clip con click y usar atajos de teclado para editarlo.\n Estado: diseño de la lógica de selección iniciado.','',0.00,NULL,NULL,0.00,'2026-06-01 18:34:44','2026-06-01 18:35:20',NULL,20,1231,96,NULL,3,2,1,0,0,0,0,'','',0.00),
(290,'Exportación a MP3',' Integrar el encoder LAME para exportar proyectos en formato MP3 además de WAV.',NULL,0.00,NULL,NULL,0.00,'2026-06-01 18:37:02','2026-06-01 18:37:02',NULL,20,1231,NULL,NULL,3,1,1,0,0,0,0,NULL,NULL,0.00),
(291,'Zoom en el timeline',' Permitir hacer zoom horizontal con rueda del mouse para editar clips con más precisión.',NULL,0.00,NULL,NULL,0.00,'2026-06-01 18:41:48','2026-06-01 18:41:48',NULL,20,1231,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(292,'Guardar / cargar proyecto','Serializar el estado del proyecto (pistas, clips, posiciones, EQ) en un archivo XML o JSON.',NULL,0.00,NULL,NULL,0.00,'2026-06-01 18:43:50','2026-06-01 18:43:50',NULL,20,1231,NULL,NULL,3,1,1,0,0,0,0,NULL,NULL,0.00),
(293,'Visualizador de espectro (FFT)','Panel opcional que muestre el espectro de frecuencias del master en tiempo real.',NULL,0.00,NULL,NULL,0.00,'2026-06-01 18:46:06','2026-06-01 18:46:06',NULL,20,1232,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(294,' Afinador cromático (TunerPanel)','Lectura del audio del micrófono en tiempo real mediante buffer circular lock-free\nAlgoritmo NSDF (McLeod Pitch Method) para detección de frecuencia fundamental\nInterpolación parabólica para precisión sub-muestra\nVisualización con aguja, arco de cents y nombre de nota (ej: A4, C#3)','',0.00,NULL,NULL,0.00,'2026-06-01 18:48:45','2026-06-01 18:48:54',NULL,20,1232,96,NULL,3,5,1,0,0,0,0,'','',0.00),
(295,'Diseño y maquetación de la Landing Page','Diseño y maquetación de una web responsiva (móvil y PC) que sirva como presentación oficial del DAW. Debe adoptar la estética visual del proyecto y exponer de forma clara y atractiva las funciones principales del software (motor, mixer y herramientas).','',1.50,NULL,NULL,0.00,'2026-06-01 18:55:47','2026-06-18 22:57:12',NULL,20,1233,75,NULL,3,5,1,0,0,0,0,'','',0.00),
(296,'Sección de descargas del instalador y capturas de pantalla','Implementación de la sección de descargas con links directos y funcionales a los instaladores del programa. Incluye una galería interactiva con capturas de pantalla en alta calidad de la interfaz (timeline, mixer y paneles) para mostrar el software antes de bajarlo.','',1.00,NULL,NULL,0.00,'2026-06-01 18:57:51','2026-06-18 22:57:27',NULL,20,1233,75,NULL,2,5,1,0,0,0,0,'','',0.00),
(297,'Carpeta de de campo (de la pagina)','Sección web dedicada a la documentación técnica oficial de Pennyroyal Studio. Debe exponer de forma resumida el análisis estructural del código HTML5 (metadatos, header, hero, estadísticas, tutorial y comunidad) y el diseño estilizado con CSS (variables de color :root, Flexbox, CSS Grid y adaptabilidad responsive) , reflejando fielmente el proceso de desarrollo del sitio.','',1.50,NULL,NULL,0.00,'2026-06-01 19:03:38','2026-06-18 22:57:36',NULL,20,1233,75,NULL,3,5,3,0,0,0,0,'','',0.00),
(298,'Estructuración de la sección de Video Tutoriales','Configurar e incrustar mediante un iframe el video tutorial corto de inducción (de hasta 15 minutos) que explique el uso mínimo e indispensable del software para principiantes.','',0.50,NULL,NULL,0.00,'2026-06-01 19:06:57','2026-06-18 22:57:57',NULL,20,1233,75,NULL,3,5,1,0,0,0,0,'','',0.00),
(299,'Maquetación de la sección Comunidad y enlaces al repositorio','Crear un apartado colaborativo al final del sitio que conecte a los usuarios con el repositorio del proyecto.','',1.00,NULL,NULL,0.00,'2026-06-01 19:08:22','2026-06-18 22:58:06',NULL,20,1233,75,NULL,3,5,1,0,0,0,0,'','',0.00),
(300,'Diseñado de la pestaña','Diseño de la pagina/pestaña con el listado en forma de tabla',NULL,0.00,NULL,NULL,0.00,'2026-06-03 03:31:55','2026-06-03 03:31:55',NULL,19,1302,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(301,'Desarrollo de interfaz de la pestaña','Desarrollo en codigo de la interfaz/pestaña propuesta','',0.00,NULL,NULL,0.00,'2026-06-03 03:32:40','2026-06-03 03:38:48',NULL,19,1302,NULL,NULL,2,1,1,0,0,0,0,'','',0.00),
(302,'Documentacion','Realizar la documentacion de las funcionalidades y del codigo',NULL,0.00,NULL,NULL,0.00,'2026-06-03 03:33:09','2026-06-03 03:33:09',NULL,19,1302,NULL,NULL,1,1,3,0,0,0,0,NULL,NULL,0.00),
(303,'Desarrollo de la funcionalidad','Desarrollo en codigo de la funcionalidad propuesta',NULL,0.00,NULL,NULL,0.00,'2026-06-03 03:35:49','2026-06-03 03:35:49',NULL,19,1303,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(304,'Implementar conexion a BD','Crear la conexion a la BD',NULL,0.00,NULL,NULL,0.00,'2026-06-03 03:38:02','2026-06-03 03:38:02',NULL,19,1302,NULL,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(305,'diseñar y maquetar una landing page','diseñar una landing page para resumir y promocionar el proyecto para convencer al usuario y asi pueda registrarse ','que resuma, sea legible y atractivo para el usuario ',10.00,NULL,NULL,0.00,'2026-06-04 12:17:34','2026-06-26 15:03:23',NULL,26,1282,88,NULL,3,5,1,0,0,0,0,'','',0.00),
(306,'subirla a un servicio','documentacion del proceso del desarrollo para subir la base de datos a supabase. detallando las fallas, complicaciones obtenidas durante el proceso.','',0.00,NULL,NULL,0.00,'2026-06-04 20:38:33','2026-06-04 20:38:44',NULL,22,1222,83,NULL,2,4,1,0,0,0,0,'','',0.00),
(307,'Averiguar posibles preguntas','Buscar y pensar preguntas para las personas a las que entrevistemos que trabajen como cuidadores, para poder informarnos mejor sobre el tema y ver que funcionalidades nuevas se pueden agregar a la aplicación móvil.','',0.50,NULL,NULL,0.00,'2026-06-04 21:38:44','2026-06-24 12:05:18',NULL,30,1316,71,NULL,3,5,1,0,0,0,0,'','',0.00),
(308,'Hacer la/las entrevistas','Poder hacer la/las entrevistas y anotar toda la información que obtengamos, intentar grabar videos preferiblemente para poder guardar la información lo mejor posible.','',0.50,NULL,NULL,0.00,'2026-06-04 21:39:44','2026-06-24 12:05:42',NULL,30,1316,78,NULL,3,5,3,0,0,0,0,'','',0.00),
(309,'crear boceto del logo','crear el boceto a mano alzada ','',0.00,NULL,NULL,0.00,'2026-06-05 12:21:01','2026-06-05 12:21:09',NULL,20,1317,93,NULL,2,2,1,0,0,0,0,'','',0.00),
(310,'Crear varios bocetos a mano alzada del movimiento de las alas ','Hacer un dibujo en papel de cada uno de los movimientos que tendrá la animación ','',0.00,NULL,NULL,0.00,'2026-06-05 12:23:56','2026-06-05 12:24:05',NULL,20,1317,93,NULL,2,2,1,0,0,0,0,'','',0.00),
(311,'Armar los adaptadores del escáner','como desarrollador de hardware quiero adaptar los puertos ps/2 de los escaneres para que pueda conectarse a usb ','',7.00,NULL,NULL,0.00,'2026-06-05 12:26:59','2026-06-05 12:27:08',NULL,26,1280,84,NULL,2,2,1,0,0,0,0,'','',0.00),
(312,'Realizar maquetado / diseño de la app','realizar una app web de biblioteca que cumpla con las siguientes consignas: la base es una pagina diseñada a sistemas de inventario para biblioteca, los colores principales son el blanco, azul y el naranja. Posee funciones de login que divide el sistema en usuario y administrador. \nLOS USUARIOS tendran la posibilidad de que material de la biblioteca esta disponible dentro de la pagina como libros, folletos, revistas, etc y podran solicitar un prestamo del mismo material donde se identificara el titulo del libro, autor, si son varios tendra q colocar la cantidad de libros o si es uno solo dira q solo lleva una unidad, fecha de inicio del prestamo y fecha de devolucion, A su vez otra funcionalidad que posee el usuario es visualizar la cantidad de prestamos echos, cuales estan vigentes y cuales estan por caducar. El administrador tendra la posibilidad de poder visualizar la cantidad de usuarios que esten logeados y cuantos prestamos realizo cada uno y quienes adeudan libros (prestamos), al final del mes se podra hacer una estadistica de cuantos prestamos se realizaron. \nel administrador tambien posee la funcion de agregar libros o agregar stock.','',4.00,NULL,NULL,0.00,'2026-06-05 12:27:33','2026-06-26 13:10:30',NULL,21,1301,72,NULL,1,5,1,1,0,1,0,'','https://www.figma.com/design/11fg6cLNKRl73ewMBnznpv/Sin-t%C3%ADtulo?node-id=0-1&t=A3aOMAvufemdZUla-1',0.00),
(313,'Investigacion sobre BD','investigar sobre distintas bases de datos y seleccionar la mas adecuada','',1.50,NULL,NULL,0.00,'2026-06-05 12:33:16','2026-06-05 12:52:51',NULL,21,1318,87,NULL,1,5,3,0,0,1,0,'','https://docs.google.com/document/d/1YUlFL4DXKXZaj6-KW1eAmpWytIUbTlFMYkb8U2frUfg/edit?usp=sharing',0.00),
(314,'Investigacion sobre Frameworks','investigar sobre distintos Frameworks y seleccionar los mas adecuados','',1.00,NULL,NULL,0.00,'2026-06-05 12:34:13','2026-06-05 12:52:38',NULL,21,1318,102,NULL,1,5,3,0,0,1,0,'','https://docs.google.com/document/d/11pBn6ozU7CHgiXoiO4NWHAU2mW2lR8D0M9VWQRJHlx0/edit?usp=sharing',0.00),
(315,'Documentar las desiciones tomadas','Documentar y justificar las decisiones de software y hardware tomadas',NULL,3.00,NULL,NULL,0.00,'2026-06-05 13:05:18','2026-06-05 13:05:18',NULL,26,1255,79,NULL,2,1,3,0,0,0,0,NULL,NULL,0.00),
(316,'investigar hardware que utilizara nuestro proyecto','Investigar que hardware deberá usar nuestro sistema y porque','',2.00,NULL,NULL,0.00,'2026-06-05 13:07:00','2026-06-05 13:09:07',NULL,26,1255,84,NULL,3,5,3,0,0,0,0,'','',0.00),
(317,'Determinar tipo de usuario','Determinar que rango de edad apuntar en los ancianos, según la información obtenida en las entrevistas','Tener un rango de edad determinado con el que trabajaremos.',0.50,NULL,NULL,0.00,'2026-06-05 13:12:31','2026-06-24 12:06:10',NULL,30,1316,78,NULL,2,5,1,0,0,0,0,'','',0.00),
(318,'Definir las reglas del negocio','Definir las reglas del negocio para establecer como funcionara la base de datos','',3.00,NULL,NULL,0.00,'2026-06-05 13:14:24','2026-06-05 14:02:29','2026-06-21 16:29:49',26,1254,84,NULL,3,1,3,0,0,0,0,'','',0.00),
(319,'Crear un Diagrama Relacional ','Crear un Diagrama Relacional con todas nuestras tablas y relaciones para visualizar cómodamente la estructura de la base de datos','Que el diagrama relacional represente correctamente las tablas y sus relaciones y sea de fácil lectura',2.50,NULL,NULL,0.00,'2026-06-05 13:44:50','2026-06-05 13:45:06','2026-06-21 16:29:56',26,1254,79,NULL,2,5,3,0,0,0,0,'','',0.00),
(320,'Buscar informacion y leer sobre el lector de huella','Buscar documentación disponible y leer sobre el lector de huella para implementarlo eficientemente en el sistema','Obtener toda la información posible del lector para usarlo de forma segura y efectiva',3.00,NULL,NULL,0.00,'2026-06-05 14:07:16','2026-06-05 14:15:43',NULL,26,1319,84,NULL,1,2,3,0,0,0,0,'','',0.00),
(321,'Probar el lector de huella con un Arduino','Probar el lector de huella en arduino para probar el funcionamiento del sensor y ver como se integra',NULL,3.00,NULL,NULL,0.00,'2026-06-05 14:20:12','2026-06-05 14:20:12',NULL,26,1319,84,NULL,2,1,2,0,0,0,0,NULL,NULL,0.00),
(322,'Investigar como guardar las huellas de datos en la base de datos','Investigar como guardar los datos que entrega el lector de huella de la base de datos postgresql para integrarlo en el sistema','',2.00,NULL,NULL,0.00,'2026-06-05 14:27:47','2026-06-05 14:45:22',NULL,26,1319,84,NULL,1,1,3,0,0,0,0,'','',0.00),
(323,'Crear campo nuevo en el Sign-up (registro)','Crear el campo: DNI',NULL,0.00,NULL,NULL,0.00,'2026-06-05 14:54:54','2026-06-05 14:54:54',NULL,19,1320,95,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(324,'Crear campo en la base de datos','Crear el campo: DNI, en la base de datos.','',0.00,NULL,NULL,0.00,'2026-06-05 14:55:18','2026-06-05 14:55:25',NULL,19,1320,95,NULL,1,1,1,0,0,0,0,'','',0.00),
(325,'Test del campo nuevo','Comprobar que el campo se aplique correctamente a la BD.',NULL,0.00,NULL,NULL,0.00,'2026-06-05 14:56:08','2026-06-05 14:56:08',NULL,19,1320,95,NULL,1,1,2,0,0,0,0,NULL,NULL,0.00),
(326,'Modificar el filtrado de añadir integrantes','Modificar el filtrado de añadir integrantes para que filtre por DNI (aparte de correo y usuario).',NULL,0.00,NULL,NULL,0.00,'2026-06-05 14:56:59','2026-06-05 14:56:59',NULL,19,1320,95,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(327,'diseño y maquetado del registro e inicio de sesión','diseñar graficamente que campos y como se va a ver el resgitro e inicio de sesión tanto de la huella como con la contraseña','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',3.00,NULL,NULL,0.00,'2026-06-08 23:58:10','2026-06-26 15:05:08',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(328,'documento de stack tecnologico elegido ','Documentacion de que stack tegnologico elegiste para el frontent  y compararlo con otros ','documento formato word',1.00,NULL,NULL,0.00,'2026-06-09 19:03:03','2026-06-09 19:14:02','2026-06-09 21:37:44',29,1311,91,NULL,1,1,3,0,0,0,0,'','',0.00),
(329,'Definir los colores del frontend ','definir los colores para la pagina ','documento formato word',1.00,NULL,NULL,0.00,'2026-06-09 19:11:44','2026-06-09 19:14:16','2026-06-09 20:31:59',29,1311,91,NULL,1,1,3,0,0,0,0,'','',0.00),
(330,'Definir stack tecnológico','Definir stack tecnológico conveniente para el desarrollo de la base de datos ','',0.00,NULL,NULL,0.00,'2026-06-09 19:45:10','2026-06-09 21:08:41',NULL,29,1322,74,NULL,1,5,1,0,0,0,0,'','',0.00),
(331,'Cambio de diseño','Aparienia profesional y con cambios ','- Cambios hechos y evaluacion',8.00,NULL,NULL,0.00,'2026-06-09 19:46:04','2026-06-09 19:59:33',NULL,22,1268,90,NULL,1,5,1,1,1,1,1,'','https://drive.google.com/file/d/1xJhBfpKJPy3QH-srYuhPQa6gwCoilq1Q/view?usp=drive_link',0.00),
(332,'Formato inicial','Una vez definido el stack tecnológico realizar el formato inicial de la base de datos','',0.00,NULL,NULL,0.00,'2026-06-09 19:46:26','2026-06-24 11:38:18',NULL,29,1322,91,NULL,3,3,1,0,0,0,0,'','',0.00),
(333,'Diagrama de flujos','Realizar diagrama de flujos para mostrarle al usuario','',0.00,NULL,NULL,0.00,'2026-06-09 19:47:11','2026-06-24 11:37:54',NULL,29,1322,89,NULL,3,3,1,0,0,0,0,'','',0.00),
(334,'Definir datos ','Analizar y definir todos los tipos de datos de la base creada ','',0.00,NULL,NULL,0.00,'2026-06-09 19:48:17','2026-06-09 19:48:56','2026-06-24 11:38:46',29,1322,NULL,NULL,1,1,1,0,0,0,0,'','',0.00),
(335,'Investigación general','En esta etapa nos encargamos de consultar en distintas farmacias como se administran y que problemas suelen tener','Informarnos lo mejor posible sobre el tema para definir que tipo de sistema buscamos ofrecer',0.00,NULL,NULL,0.00,'2026-06-09 19:58:24','2026-06-24 11:45:11',NULL,29,1323,89,NULL,3,5,1,0,0,0,0,'','',0.00),
(336,'Conseguir usuario','Buscamos una farmacia las cuales los gerentes estén dispuestos a aceptar nuestro sistema y ayudarnos explicándonos como funciona la administración de su farmacia','',0.00,NULL,NULL,0.00,'2026-06-09 20:01:42','2026-06-24 11:45:49',NULL,29,1323,74,NULL,3,5,1,0,0,0,0,'','',0.00),
(337,'Sincronizar entrevista','Coordinar la primer entrevista con el usuario y asistir con una lista de preguntas ya formuladas anteriormente','',0.00,NULL,NULL,0.00,'2026-06-09 20:04:50','2026-06-09 20:05:06',NULL,29,1323,NULL,NULL,3,5,1,0,0,0,0,'','',0.00),
(338,'Definir stack tecnológico que se utilizará ','Investigar y definir que stack tecnologico  se usara para el fronted por ejemplo node.js, vue.js, react, angular y Svelte.','',0.00,NULL,NULL,0.00,'2026-06-09 20:14:05','2026-06-09 21:07:07',NULL,29,1324,91,NULL,3,5,1,0,0,0,0,'','',0.00),
(339,'Creación de la página web','Realizar la pagina web dispuesta a cambios según los deseo del usuario','',0.00,NULL,NULL,0.00,'2026-06-09 20:17:56','2026-06-18 13:03:05',NULL,29,1324,NULL,NULL,3,3,1,0,0,0,0,'','',0.00),
(340,'Carpeta anteproyecto ','','',0.00,NULL,NULL,0.00,'2026-06-09 20:18:04','2026-06-09 20:39:34',NULL,27,1325,92,NULL,1,1,3,0,0,1,0,'','https://docs.google.com/document/d/1Y6MvSZoVnnWrXAf7iIpevF5h9qIpzcHOL3rntY76XVY/edit?usp=sharing',0.00),
(341,'Estilo','Definir el estilo y los colores a utilizar de preferencia en esta pagina','',0.00,NULL,NULL,0.00,'2026-06-09 20:18:59','2026-06-09 20:19:15','2026-06-09 20:22:46',29,1324,NULL,NULL,1,2,1,0,0,0,0,'','',0.00),
(342,'Esquema en papel','Realizar boceto, eligiendo colores, estilo y diseño de la futura pagina en papel','',0.00,NULL,NULL,0.00,'2026-06-09 20:21:51','2026-06-09 20:29:14','2026-06-18 13:03:15',29,1324,89,NULL,1,5,1,0,0,0,0,'','',0.00),
(343,'Prototipo digital','Realizar el prototipo digital siguiendo el diseño del boceto creado','',0.00,NULL,NULL,0.00,'2026-06-09 20:24:13','2026-06-24 11:39:40',NULL,29,1324,91,NULL,3,5,1,0,0,0,0,'','',0.00),
(344,'Hardware','Investigar que tipo scanner de código de barras es conveniente conseguir y como integrarlo al sistema','',0.00,NULL,NULL,0.00,'2026-06-09 21:06:10','2026-06-24 11:45:30',NULL,29,1323,89,NULL,2,5,1,0,0,0,0,'','',0.00),
(345,'Documentación','Redactar y llevar a cabo la documentación de este proyecto','',0.00,NULL,NULL,0.00,'2026-06-09 21:28:53','2026-06-09 21:36:56','2026-06-18 13:05:45',29,1326,89,NULL,2,2,1,0,0,0,0,'','',0.00),
(346,'Documentacion sobre diferencias entre Aguapey y Scan&Go','','',0.50,NULL,NULL,0.00,'2026-06-10 00:17:52','2026-06-10 00:18:11',NULL,21,1327,102,NULL,1,5,3,0,0,1,0,'','https://docs.google.com/document/d/1a5-zTir6e4H2SILSluiCIbYRSr3Vkyc3G8wgv_EmzyQ/edit?usp=sharing',0.00),
(347,'Maquetado de preceptores','','',3.50,NULL,NULL,0.00,'2026-06-10 13:20:17','2026-06-11 12:23:00','2026-06-11 13:57:38',23,1298,NULL,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/1By1mhIoQ7J_hiJtBdXpWSwVgLMf4J8BP?usp=sharing',0.00),
(348,'maquetado administración (dirección)','','',3.50,NULL,NULL,0.00,'2026-06-10 13:20:40','2026-06-11 12:24:30','2026-06-11 13:57:38',23,1298,NULL,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/file/d/18dSb_ECLIvpK4QtZYi6_e-3Bgdx5Khm9/view?usp=sharing',0.00),
(349,'Documentacion de la funcionalidad','Documentado preciso de como se estructura en codigo y en logica la funcionalidad.',NULL,0.00,NULL,NULL,0.00,'2026-06-11 02:39:36','2026-06-11 02:39:36',NULL,19,1303,NULL,NULL,1,1,3,0,0,0,0,NULL,NULL,0.00),
(350,'Terminar la base de datos','hay varios puntos en la base de datos que presentan inconsistencias o problemas a la hora de plantearlo como funcional, se busca corregir y agregar puntos',NULL,0.00,NULL,NULL,0.00,'2026-06-11 10:40:33','2026-06-11 10:40:33',NULL,22,1222,83,NULL,2,1,1,0,0,0,0,NULL,NULL,0.00),
(351,'Área Títulos ','','',0.50,NULL,NULL,0.00,'2026-06-11 13:41:24','2026-06-18 21:52:16',NULL,23,1328,82,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/17BHlmjR4KWWy_RwLO6zjo_tw86ZW_Zxo/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(352,'Asistencias ','','',0.50,NULL,NULL,0.00,'2026-06-11 13:43:02','2026-06-11 14:10:40',NULL,23,1328,82,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/1-Ehx24abKeIOnW0rzU-f6itTIbZPoDpz/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(353,'Inscripciones','','',0.50,NULL,NULL,0.00,'2026-06-11 13:44:01','2026-06-11 14:06:53',NULL,23,1328,85,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/1BCBkwHazbyqeC-EY-F1-0BVsyVtFG43i/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(354,'Jefatura','','',0.50,NULL,NULL,0.00,'2026-06-11 13:44:32','2026-06-11 13:54:35',NULL,23,1328,NULL,NULL,1,2,1,0,0,1,0,'','https://docs.google.com/document/d/1BJrPV6_MRp44gYWK28o7TfMexi1R6B9m/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(355,'Licencias','','',0.50,NULL,NULL,0.00,'2026-06-11 13:45:04','2026-06-11 14:04:23',NULL,23,1328,73,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/12sjRC5yhTuRGv_gg3rkplQIrdHClsG3K/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(356,'Mesa de entrada','','',0.50,NULL,NULL,0.00,'2026-06-11 13:45:58','2026-06-11 14:07:06',NULL,23,1328,85,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/1ks5ZXlsqtd7piKwHEhebP4y0FbG-Mu5b/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(357,'Preceptores','','',0.50,NULL,NULL,0.00,'2026-06-11 13:46:41','2026-06-11 14:06:11',NULL,23,1328,82,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/1udVOiknYhb-bsj8NPbOn8RuTJR1KO5DD/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(358,'Regencia técnica','','',1.00,NULL,NULL,0.00,'2026-06-11 13:52:02','2026-06-11 14:04:48',NULL,23,1328,73,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/1KPR02PWR7BLgsGnIIohy4TdqapK3qXs-/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(359,'Secretaría','','',1.00,NULL,NULL,0.00,'2026-06-11 13:52:59','2026-06-11 14:04:38',NULL,23,1328,73,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/1Ou_EHgjWY-sjxftDhVygLp8ghYtkPAwX/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(360,'Regencia de cultura','','',0.00,NULL,NULL,0.00,'2026-06-11 13:54:00','2026-06-17 13:44:39',NULL,23,1328,73,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/1uOlpe55LJeN2gZXW_NiSxpm1N4tLGnTL/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(361,'maquetado de alumnos','','',2.00,NULL,NULL,0.00,'2026-06-11 13:58:19','2026-06-18 13:07:56',NULL,23,1329,73,NULL,2,5,1,0,0,1,0,'','https://drive.google.com/drive/folders/1myWSI8HfNNr7wZmWQ0tBhnLN1upJYtal?usp=drive_link',0.00),
(362,'maquetado de profesores','','',2.50,NULL,NULL,0.00,'2026-06-11 13:58:31','2026-06-26 12:38:08',NULL,23,1329,73,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/file/d/1Kd1aycTBQqveeiEfY9pe5dCQpl0rOGGA/view?usp=drive_link',0.00),
(363,'maquetado de preceptores','','',3.00,NULL,NULL,0.00,'2026-06-11 13:58:47','2026-06-26 14:13:15',NULL,23,1329,73,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/file/d/1L3x69Q-f3JWA5rTYe2NJsqc0mk11znjE/view?usp=drive_link',0.00),
(364,'maquetado de administración (dirección)','','',3.50,NULL,NULL,0.00,'2026-06-11 13:59:13','2026-06-18 13:08:16',NULL,23,1329,73,NULL,1,5,1,0,0,1,0,'','https://drive.google.com/file/d/18dSb_ECLIvpK4QtZYi6_e-3Bgdx5Khm9/view?usp=drive_link',0.00),
(365,'profesores','','',0.00,NULL,NULL,0.00,'2026-06-11 14:04:00','2026-06-11 14:11:08',NULL,23,1328,82,NULL,1,1,1,0,0,0,0,'','',0.00),
(366,'pasar a digital los bocetos echos a mano','necesito pasar a digital los bocetos para empezar a crear una animación con efecto de movimiento de alas','',0.00,NULL,NULL,0.00,'2026-06-17 03:10:51','2026-06-17 03:11:05',NULL,20,1317,93,NULL,2,2,1,0,0,0,0,'','',0.00),
(367,'crear un boceto de un serafin ','como la  pagina necesita un logo optamos por un serafín que sea la cara del programa y la pagina  ','',0.00,NULL,NULL,0.00,'2026-06-17 03:20:58','2026-06-17 03:21:04',NULL,20,1330,93,NULL,2,5,1,0,0,0,0,'','',0.00),
(368,'Conectar','Conectar pagina con base de datos',NULL,0.00,NULL,NULL,0.00,'2026-06-18 13:04:44','2026-06-18 13:04:44',NULL,29,1324,89,NULL,3,1,1,0,0,0,0,NULL,NULL,0.00),
(369,'Redactar Marco Metodológico para el sistema. ','Establecer el Marco Metodológico para el sistema.','Marco Metodológico del sistema corregido y aprobado.',3.00,NULL,NULL,0.00,'2026-06-18 15:12:17','2026-06-18 15:13:29',NULL,23,1251,82,NULL,3,5,3,1,1,1,1,'','',0.00),
(370,'Manual de profesores','',NULL,0.00,NULL,NULL,0.00,'2026-06-18 15:19:51','2026-06-18 15:19:51',NULL,23,1332,73,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(371,'Manual de alumnos','',NULL,0.00,NULL,NULL,0.00,'2026-06-18 15:20:08','2026-06-18 15:20:08',NULL,23,1332,73,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(372,'Manual de preceptores','',NULL,0.00,NULL,NULL,0.00,'2026-06-18 15:20:25','2026-06-18 15:20:25',NULL,23,1332,73,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(373,'Manual de directores','',NULL,0.00,NULL,NULL,0.00,'2026-06-18 15:20:37','2026-06-18 15:20:37',NULL,23,1332,73,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(374,'relleno','',NULL,0.00,NULL,NULL,0.00,'2026-06-18 15:24:48','2026-06-18 15:24:48',NULL,23,1251,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(375,'relleno','',NULL,0.00,NULL,NULL,0.00,'2026-06-18 15:25:42','2026-06-18 15:25:42',NULL,23,1251,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(376,'relleno','',NULL,0.00,NULL,NULL,0.00,'2026-06-18 15:25:52','2026-06-18 15:25:52',NULL,23,1251,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(377,'relleno','','',0.00,NULL,NULL,0.00,'2026-06-18 15:26:07','2026-06-18 15:26:35',NULL,23,1251,NULL,NULL,1,1,1,0,0,0,0,'','',0.00),
(378,'Carpeta Tecnica Anteproyecto','','',0.00,NULL,NULL,0.00,'2026-06-18 15:27:06','2026-06-18 15:30:22',NULL,23,1251,82,NULL,3,2,1,0,0,1,1,'','https://docs.google.com/document/d/1mHF22_RHFAs4i79aOeKdtljP7VvYHPdr/edit?usp=sharing&ouid=105208598173841691595&rtpof=true&sd=true',0.00),
(379,'Sensor R307','','',0.00,NULL,NULL,0.00,'2026-06-18 15:33:18','2026-06-23 17:43:08',NULL,23,1333,73,NULL,1,5,3,0,0,1,0,'','https://docs.google.com/document/d/1CzzzYQ3wTBIFxus3TPHs7mNOnddiX58H/edit?usp=sharing&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(380,'Microcontrolador ESP32','','',0.00,NULL,NULL,0.00,'2026-06-18 15:34:32','2026-06-18 15:58:09',NULL,23,1333,85,NULL,1,1,1,0,0,0,0,'','',0.00),
(381,'Conexión de ESP32 y R307','','',0.00,NULL,NULL,0.00,'2026-06-18 15:35:27','2026-06-18 15:58:03',NULL,23,1333,85,NULL,1,1,1,0,0,0,0,'','',0.00),
(382,'Buzzer','','',0.00,NULL,NULL,0.00,'2026-06-18 15:37:02','2026-06-18 15:57:57',NULL,23,1333,85,NULL,1,1,1,0,0,0,0,'','',0.00),
(383,'Documentación visual','','',0.00,NULL,NULL,0.00,'2026-06-18 15:38:01','2026-06-18 15:58:31',NULL,23,1333,NULL,NULL,1,1,1,0,0,0,0,'','',0.00),
(384,'Restricciones de jefe de preceptores','','',0.00,NULL,NULL,0.00,'2026-06-18 15:39:56','2026-06-18 15:51:16',NULL,23,1299,73,NULL,1,1,1,0,0,0,0,'','',0.00),
(385,'Restricciones de secretarios','','',0.00,NULL,NULL,0.00,'2026-06-18 15:40:10','2026-06-18 15:51:21',NULL,23,1299,73,NULL,1,1,1,0,0,0,0,'','',0.00),
(386,'Días recorridos','','',0.00,NULL,NULL,0.00,'2026-06-18 15:48:03','2026-06-18 21:51:37',NULL,23,1328,NULL,NULL,1,5,1,0,0,1,0,'','https://docs.google.com/document/d/1tEZIkEQ9AIRD-2JVWG8CB1qJzvRmHAZ4/edit?usp=drive_link&ouid=100574707389566862783&rtpof=true&sd=true',0.00),
(387,'Restricciones del regente de cultura','','',0.00,NULL,NULL,0.00,'2026-06-18 15:51:04','2026-06-18 15:51:26',NULL,23,1299,73,NULL,1,1,1,0,0,0,0,'','',0.00),
(388,'Paleta de colores ','','',0.00,NULL,NULL,0.00,'2026-06-18 15:55:13','2026-06-18 15:55:58',NULL,23,1334,73,NULL,1,1,1,0,0,0,0,'','',0.00),
(389,'Tipografías','','',0.00,NULL,NULL,0.00,'2026-06-18 15:55:29','2026-06-18 15:55:54',NULL,23,1334,73,NULL,1,1,1,0,0,0,0,'','',0.00),
(390,'psicología del color','',NULL,0.00,NULL,NULL,0.00,'2026-06-18 15:55:49','2026-06-18 15:55:49',NULL,23,1334,73,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(391,'Mejora de la seguridad general de la página','Como Administrador del sitio web, quiero implementar medidas de seguridad esenciales en el código y el servidor, para proteger la integridad de la página, evitar hackeos comunes (inyecciones) y resguardar los datos.','',2.50,NULL,NULL,0.00,'2026-06-18 22:49:58','2026-06-18 22:58:28',NULL,20,1233,75,NULL,3,2,1,0,0,0,0,'','',0.00),
(392,'Despliegue y hosting final de la página web','Como Desarrollador del sitio web, quiero subir la página al hosting de Namecheap y configurar el dominio, para que el sitio esté publicado oficialmente en internet y sea accesible para todos los usuarios.','',0.00,NULL,NULL,0.00,'2026-06-18 22:56:38','2026-06-18 22:58:17',NULL,20,1233,75,NULL,3,2,1,0,0,0,0,'','',0.00),
(393,'Hacer un MER con la estructura de la base de datos','quiero hacer un MER con la estructura de la base de datos para definir bien como va a ser nuestra base de datos y que quede documentada','',5.00,NULL,NULL,0.00,'2026-06-21 16:34:26','2026-06-21 16:34:49',NULL,26,1254,79,NULL,4,5,3,0,0,1,0,'','https://docs.google.com/document/d/117RFefRjcfT0JRkpRagTYkQR0AIa9Y3L/edit?usp=sharing&ouid=106114398104167453070&rtpof=true&sd=true',0.00),
(394,'Seguridad del sistema','Investigar sobre la seguridad requerida tanto en backend como en frontend',NULL,0.00,NULL,NULL,0.00,'2026-06-24 11:49:55','2026-06-24 11:49:55',NULL,29,1323,NULL,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(395,'diseño y maquetado del dashboard','diseñar graficamente como se va a ver el dashboard y la barra de busqueda donde se encuentran los distintos items que va a tener la aplicacion web','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',1.00,NULL,NULL,0.00,'2026-06-26 15:09:14','2026-06-26 15:10:31',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(396,'diseño y maquetado del item caja','maquetar el item caja con sus respectivas funcionalidades como cerrar caja, los distintos metodos de pago con sus campos para completar las transacciones de los clientes y para realizarlos','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',4.00,NULL,NULL,0.00,'2026-06-26 15:12:43','2026-06-26 15:13:46',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(397,'diseño y maquetado del item stock','diseñar y maquetar la tabla de stock con sus respectivos campos y etiquetas, ademas de la parte de editar stock y su filtrado por categorias','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',1.50,NULL,NULL,0.00,'2026-06-26 15:15:41','2026-06-26 15:15:55',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(398,'diseño y maquetado del item consulta','maquetar el item consulta con sus funciones para consultar por productos a traves del scanner y con los datos del producto','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',0.50,NULL,NULL,0.00,'2026-06-26 15:18:27','2026-06-29 10:47:57',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(399,'diseño y maquetado del item reportes','maquetar las funcionalidades y los tipos de reportes que necesita el usuario como rendimiento de empleados, top de productos mas vendidos, total de ventas, margen de ganancia, cantidad de productos venididos, etc ademas de las etiquetas que van a necesitar los productos para poder calcular los reportes','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',4.00,NULL,NULL,0.00,'2026-06-26 15:22:35','2026-06-26 15:23:37',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(400,'maquetar y diseñar item de clientes','diseñar y maquetar el item de clientes para guardar los datos de los clientes que quieran y asi poder tener un seguimiento de estos y guardar sus compras','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',1.00,NULL,NULL,0.00,'2026-06-26 15:25:15','2026-06-26 15:25:59',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(401,'diseñar y maquetar item de configuración','maquetar en la pantalla una vista previa de todas las funcionalidades de configuracion como la biometría y seguridad (gestion de acceso e historial de las huellas registradas) ademas de los tipos de usuarios (creación de roles y su nivel de acceso)','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',0.50,NULL,NULL,0.00,'2026-06-26 15:31:17','2026-06-26 15:31:49',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(402,'maquetar y diseñar la configuración del administrador','maquetar los campos que debe rellenar o puede modificar con el tiempo como su contraseña','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',0.50,NULL,NULL,0.00,'2026-06-26 15:33:25','2026-06-26 15:33:35',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(403,'maquetar y diseñar la gestión de biometría y seguridad','maquetar la gestión de acceso con el listado de usuarios y roles, el estado biométrico (estado del sensor si esta activo o no) controles de seguridad (alertas de intentos fallidos de iniciar sesión con la huella, inicio con doble factor, bloqueo por inactividad e historial','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',1.50,NULL,NULL,0.00,'2026-06-26 15:37:58','2026-06-29 10:51:19',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(404,'maquetar y diseñar configuración de roles y permisos','diseñar y maquetar la creación de roles con sus permisos correspondientes dependiendo del rol/usuario','cumplir con los criterios que propusimos en cuanto a funcionamiento y diseño intuitivo',1.00,NULL,NULL,0.00,'2026-06-29 10:55:41','2026-06-29 10:55:52',NULL,26,1282,88,NULL,1,5,1,0,0,0,0,'','',0.00),
(405,'ESP32-WROOM-32.','',NULL,0.00,NULL,NULL,0.00,'2026-06-29 11:09:59','2026-06-29 11:09:59',NULL,27,1336,92,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(406,'Buzzer','',NULL,0.00,NULL,NULL,0.00,'2026-06-29 11:14:32','2026-06-29 11:14:32',NULL,27,1336,92,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(407,'Sensor ultrasónico de distancia HC-SR04','',NULL,0.00,NULL,NULL,0.00,'2026-06-29 11:15:55','2026-06-29 11:15:55',NULL,27,1336,92,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00),
(408,'Protoboard','',NULL,0.00,NULL,NULL,0.00,'2026-06-29 11:17:01','2026-06-29 11:17:01',NULL,27,1336,92,NULL,1,1,1,0,0,0,0,NULL,NULL,0.00);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_us`
--

DROP TABLE IF EXISTS `tipo_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_us`
--

LOCK TABLES `tipo_us` WRITE;
/*!40000 ALTER TABLE `tipo_us` DISABLE KEYS */;
INSERT INTO `tipo_us` VALUES
(1,'Sin clasificar'),
(2,'Base de datos'),
(3,'Frontend'),
(4,'Backend'),
(5,'Infraestructura'),
(6,'HW'),
(7,'Documentaciones');
/*!40000 ALTER TABLE `tipo_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_tarea`
--

DROP TABLE IF EXISTS `tipos_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_tarea` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_tarea`
--

LOCK TABLES `tipos_tarea` WRITE;
/*!40000 ALTER TABLE `tipos_tarea` DISABLE KEYS */;
INSERT INTO `tipos_tarea` VALUES
(1,'Desarrollo'),
(2,'Testing / QA'),
(3,'Documentación'),
(4,'Bug / Fix');
/*!40000 ALTER TABLE `tipos_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_dependencias`
--

DROP TABLE IF EXISTS `us_dependencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_dependencias` (
  `us_id` int(11) NOT NULL,
  `depende_de_us_id` int(11) NOT NULL,
  PRIMARY KEY (`us_id`,`depende_de_us_id`),
  KEY `depende_de_us_id` (`depende_de_us_id`),
  CONSTRAINT `us_dependencias_ibfk_1` FOREIGN KEY (`us_id`) REFERENCES `user_stories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `us_dependencias_ibfk_2` FOREIGN KEY (`depende_de_us_id`) REFERENCES `user_stories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_dependencias`
--

LOCK TABLES `us_dependencias` WRITE;
/*!40000 ALTER TABLE `us_dependencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `us_dependencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stories`
--

DROP TABLE IF EXISTS `user_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `condiciones` text DEFAULT NULL,
  `prioridad_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `tipo_us_id` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_us_proyecto` (`proyecto_id`),
  KEY `fk_us_prioridad` (`prioridad_id`),
  KEY `fk_us_estado` (`estado_id`),
  KEY `idx_us_tipo` (`tipo_us_id`),
  CONSTRAINT `fk_us_estado` FOREIGN KEY (`estado_id`) REFERENCES `estados_us` (`id`),
  CONSTRAINT `fk_us_prioridad` FOREIGN KEY (`prioridad_id`) REFERENCES `prioridades_us` (`id`),
  CONSTRAINT `fk_us_tipo` FOREIGN KEY (`tipo_us_id`) REFERENCES `tipo_us` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stories`
--

LOCK TABLES `user_stories` WRITE;
/*!40000 ALTER TABLE `user_stories` DISABLE KEYS */;
INSERT INTO `user_stories` VALUES
(26,10,'documentacion respaldatoria - fundamentacion','','',2,1,NULL,NULL,'2026-03-04 20:14:46','2026-03-18 10:10:34','2026-03-18 10:10:34',NULL,1),
(27,11,'configurar aurduino con sensores','asDASDFASDADFAD','',2,1,NULL,NULL,'2026-03-05 15:15:30','2026-03-18 10:10:27','2026-03-18 10:10:27',NULL,1),
(28,11,'MANUAL DELSUARIO','SDADASDAD','ASDADASDAD',1,1,NULL,NULL,'2026-03-05 15:15:55','2026-03-18 10:10:27','2026-03-18 10:10:27',NULL,1),
(1201,12,'Como hardware developer, quiero configurar los nodos ESP32 para leer el consumo.','Lectura WiFi cada 10s.','Debe conectar a WPA2-Enterprise',3,1,'2026-03-01 00:00:00','2026-03-15 00:00:00','2026-03-09 19:48:37','2026-03-12 15:55:18',NULL,'2026-03-04',1),
(1202,12,'Como arquitecto de datos, quiero definir el esquema de la DB para asegurar integridad.','Soporte para millones de registros.','Debe usar InnoDB y tipos Decimal',3,1,'2026-03-01 00:00:00','2026-03-05 00:00:00','2026-03-09 19:48:37','2026-03-12 15:56:06',NULL,'2026-04-02',1),
(1203,12,'Como dev backend, quiero implementar una API REST segura para la telemetría.','Validación mediante Token.-','Middleware JWT obligatorio',1,2,'2026-03-05 00:00:00','2026-03-12 00:00:00','2026-03-09 19:48:37','2026-05-22 11:36:29',NULL,'2026-03-16',1),
(1204,12,'Como administrador, quiero visualizar un dashboard comparativo para monitoreo.','Gráficos de barras por aula.','Carga en menos de 2 segundos',2,1,'2026-03-10 00:00:00','2026-03-25 00:00:00','2026-03-09 19:48:37','2026-03-09 19:48:37',NULL,NULL,1),
(1205,12,'Como encargado de mantenimiento, quiero recibir alertas automáticas.','Umbral de consumo configurable.','Email en menos de 1 min de evento',1,1,'2026-03-15 00:00:00','2026-03-22 00:00:00','2026-03-09 19:48:37','2026-03-09 19:48:37',NULL,NULL,1),
(1206,12,'Como director, quiero gestionar roles de usuario para control de acceso (RBAC).','Roles Docente/Alumno.','Persistencia en LocalStorage cifrada',2,1,'2026-03-18 00:00:00','2026-03-25 00:00:00','2026-03-09 19:48:37','2026-03-18 10:11:00','2026-03-18 10:11:00',NULL,1),
(1207,12,'Como gestor ambiental, quiero generar reportes PDF mensuales.','Exportación formal institucional.','PDF compatible con A4 y logos',3,1,'2026-03-20 00:00:00','2026-03-30 00:00:00','2026-03-09 19:48:37','2026-03-09 19:48:37',NULL,NULL,1),
(1208,12,'Como educador, quiero visualizar la equivalencia en CO2.','Conversión de kWh a árboles.','Basado en norma ISO 14064',3,1,'2026-03-22 00:00:00','2026-03-28 00:00:00','2026-03-09 19:48:37','2026-03-18 10:11:18','2026-03-18 10:11:18',NULL,1),
(1209,12,'Como experto en seguridad, quiero aplicar cifrado SSL y Rate Limit.','Mitigación de ataques DoS.','Bloqueo automático de IP maliciosa',1,1,'2026-03-05 00:00:00','2026-03-10 00:00:00','2026-03-09 19:48:37','2026-03-18 10:10:51','2026-03-18 10:10:51',NULL,1),
(1210,12,'Como tester de campo, quiero monitorear el sistema en tableros reales.','Validación de precisión física.','Error menor al 5% vs medidor red',1,1,'2026-03-25 00:00:00','2026-03-31 00:00:00','2026-03-09 19:48:37','2026-03-18 10:10:43','2026-03-18 10:10:43',NULL,1),
(1211,14,'Realizar una descripsión de los componentes','Acá realizar la descripsión','Entregar para el día 12 de marzo',3,1,NULL,NULL,'2026-03-11 12:00:40','2026-03-30 15:52:43','2026-03-30 15:52:43',NULL,1),
(1212,24,'investigación de los principales virus que atacan un teléfono ','describir los virus (troyano, gusano y spyware) ¿Qué parte afectan principalmente? ¿Cómo se hacen notar?','respuestas escritas de manera prolija y explayada',2,1,NULL,NULL,'2026-03-30 12:20:34','2026-04-08 11:40:38','2026-04-08 11:40:38','2026-04-15',1),
(1213,28,'Lectura y Envío de Datos IoT','Como sistema, quiero leer la humedad del suelo y temperatura ambiente mediante el ESP32 y enviarlos a la base de datos cada 5 minutos, para tener datos reales que procesar.','',3,1,NULL,NULL,'2026-03-30 14:12:41','2026-03-30 14:12:41',NULL,NULL,1),
(1214,28,'Dashboard Web de Monitoreo','como usuario, quiero ingresar a una URL responsiva y ver los valores actuales de mi huerta en tiempo real (temperatura y humedad), para saber el estado de mis plantas desde cualquier lugar.','',3,1,NULL,NULL,'2026-03-30 14:15:20','2026-03-30 14:16:40',NULL,NULL,1),
(1215,28,'Control de Riego Automatizado','Como sistema, quiero activar una bomba de agua (Relé) automáticamente cuando la humedad del suelo baje del 30%, para mantener la planta hidratada sin intervención humana','',2,1,NULL,NULL,'2026-03-30 14:17:58','2026-03-30 14:17:58',NULL,NULL,1),
(1216,28,'Panel de Control Remoto (App)','Como usuario, quiero tener un botón en mi app móvil para encender o apagar el riego manualmente, para intervenir en casos excepcionales (limpieza o prueba).','',2,1,NULL,NULL,'2026-03-30 14:19:29','2026-03-30 14:19:29',NULL,NULL,1),
(1217,28,'Historial y Gráficos Semanales','Como usuario, quiero ver un gráfico de líneas con la evolución de la temperatura de la última semana, para analizar el comportamiento climático de mi invernadero.','',2,1,NULL,NULL,'2026-03-30 14:24:25','2026-03-30 14:24:25',NULL,NULL,1),
(1218,25,'Evaluar herramientas de IAs/ Opciones de reconocimientos de matriculas','Investigar herramientas de reconocimiento de matriculas, ya sea una IA (Ya existentes/Entrenarla/APIs), Algoritmos ya existentes (YOLO, ALPR, OpenCV Tesseract OCR EasyOCR) o una combinación.\n\n','Tiene que explicar cual seria la mejor ruta de desarrollo teniendo en cuenta eficiencia, organizacion, precios, facilidad de aplicacion, consumo de hardware, y otras limitaciones del proyecto.',2,2,NULL,NULL,'2026-03-30 14:25:59','2026-04-30 14:52:48','2026-04-30 14:52:48',NULL,1),
(1219,25,'Definir arquitectura del sistema','Definir la estructura general del sistema y cómo se conectarán sus componentes principales, incluyendo el sistema de captura de imágenes o video, el reconocimiento de matrículas, el servidor, la base de datos y la interfaz de usuario','Hacer un esquema o diagrama claro de la arquitectura del sistema que explique los componentes principales y el flujo de información entre ellos',2,2,NULL,NULL,'2026-03-30 14:32:53','2026-04-30 14:52:45','2026-04-30 14:52:45',NULL,1),
(1220,25,'Definir requerimientos técnicos','Establecer los requisitos técnicos necesarios para el desarrollo del sistema, como tecnologías de software, hardware necesario, etc','Debe hacer una lista de componentes que especifique las  las necesidades de hardware y los parámetros mínimos necesarios para el funcionamiento del sistema',2,2,NULL,NULL,'2026-03-30 14:34:17','2026-04-30 14:52:49','2026-04-30 14:52:49',NULL,1),
(1221,22,'Busqueda de Información','Para el Backend: \n- ¿Qué servidor usar? ¿Cuál se ajusta más a las necesidades que tenemos?\n- Bulma \n\nPara Dominio: \n- Dominio o Plataforma de hosting\n\nPara Moderadores con IA\n- Modelos con python \n- otros modelos \nhttps://docs.google.com/document/d/1xMUjZyNicPtHc20d_HoLh9By9SRTlFYs5ZcupSvpO0M/edit?usp=sharing','Redacción de un documento formal y subirlo a la carpeta compartida con links.',1,4,NULL,NULL,'2026-04-01 11:42:21','2026-06-19 19:55:16',NULL,'2026-04-30',1),
(1222,22,'Realizacion de BDD con roles ','Armar la base de datos, designar roles y conectarlo a la pagina web','',3,1,NULL,NULL,'2026-04-01 11:43:56','2026-06-09 19:50:55',NULL,'2026-07-30',1),
(1223,22,'Implementación de  Modelos de IA y chatbot','','',2,4,NULL,NULL,'2026-04-01 11:46:26','2026-06-19 19:55:07',NULL,'2026-06-25',1),
(1224,22,'Implementar las nuevas tecnologias y subir página web','Implementación del moderador con IA y hostear la pagina, es decir, que tenga un dominio o subirla a un servicio de hosting.','',3,3,NULL,NULL,'2026-04-01 11:51:44','2026-04-01 11:51:44',NULL,'2026-05-31',1),
(1225,22,'Creación de APK','Crear el paquete apk con Android studio y probarlo','',3,3,NULL,NULL,'2026-04-01 11:52:55','2026-04-01 11:52:55',NULL,'2026-06-15',1),
(1226,22,'Inicio Etapa de Testing ','Probar el producto final en la escuela. ','',3,3,NULL,NULL,'2026-04-01 11:55:28','2026-04-01 11:55:28',NULL,'2026-08-31',1),
(1227,22,'Hardware ','Realizar el sistema de asistencia de profesores.\ncon ESP32 e implementarlo','',2,3,NULL,NULL,'2026-04-01 11:56:39','2026-05-27 14:56:40',NULL,'2026-06-05',1),
(1228,20,'Estación de trabajo de audio \n','Como sistema, debo desarrollar una interfaz gráfica simple, intuitiva y fácil de usar, que en su versión inicial permita cubrir las funciones básicas que un músico necesita para grabar pistas de sus instrumentos de manera eficiente.','Dado que el usuario abre la aplicación, cuando presiona “Grabar”, entonces se inicia la grabación.',3,2,NULL,NULL,'2026-04-01 13:23:10','2026-06-19 16:29:00',NULL,NULL,3),
(1229,20,'Motor de Audio\n','Como sistema, debo procesar y reproducir el sonido de manera eficiente, gestionando correctamente los buffers de audio y permitiendo la sincronización precisa de múltiples pistas para garantizar una reproducción fluida y sin interrupciones.','El sistema deberá asegurar una correcta gestión del audio en tiempo real, garantizando una reproducción continua, sin fallos ni interrupciones. Además, deberá mantener la integridad del sonido procesado y sincronizar múltiples pistas de manera precisa, brindando una experiencia estable y de calidad al usuario.',3,2,NULL,NULL,'2026-04-01 13:29:01','2026-06-19 16:29:11',NULL,NULL,4),
(1230,20,'Gestor de Pistas','Como sistema, debo gestionar múltiples pistas de audio, permitiendo su administración individual, así como el control de volumen y posición de cada track, para brindar al usuario una experiencia flexible y organizada en la edición y reproducción de sonido.','El sistema deberá permitir al usuario administrar múltiples pistas de forma clara e independiente, ofreciendo controles precisos sobre el volumen y la posición de cada una. Además, deberá garantizar que los cambios realizados se reflejen correctamente en la reproducción sin afectar la estabilidad del sistema.',3,2,NULL,NULL,'2026-04-01 13:31:59','2026-06-19 16:29:26',NULL,NULL,4),
(1231,20,'Manejo de Archivos','Como sistema, debo permitir el manejo de archivos de audio, incluyendo la importación de pistas, el guardado de proyectos y la exportación de archivos finales, para que el usuario pueda gestionar su trabajo de forma completa y persistente.','El sistema deberá garantizar una correcta gestión de archivos, permitiendo al usuario importar audios, guardar el estado de sus proyectos y exportar resultados finales sin pérdida de información ni errores. Además, estas operaciones deben ser simples, confiables y accesibles desde la interfaz.',3,1,NULL,NULL,'2026-04-01 13:35:35','2026-06-19 16:29:33',NULL,NULL,4),
(1232,20,'Pedal Analogico','Como sistema complementario al DAW, debo diseñar y construir un pedal analógico de overdrive que permita procesar la señal del instrumento antes de su digitalización, proporcionando una saturación cálida, dinámica y de bajo ruido, con controles de ganancia, tono y volumen, y garantizando un funcionamiento robusto tanto en estudio como en vivo.','El sistema deberá garantizar una correcta modificación de la señal analógica, respetando la calidad del sonido original y añadiendo una saturación controlada. Además, deberá asegurar estabilidad eléctrica, bajo nivel de ruido y una construcción física resistente, permitiendo su integración efectiva con el entorno digital del DAW.',3,1,NULL,NULL,'2026-04-01 13:39:43','2026-06-18 23:00:12',NULL,NULL,6),
(1233,20,'Creación de una Pagina ','Este programa será posible de obtener a través de nuestra pagina web, donde se presentara el programa, habrán fotos de ejemplos y algún video corto de nomas de 15 minutos para entender lo mínimo e indispensable para que el usuario sin experiencia pueda empezar a grabar sus instrumentos. \n','El sistema deberá permitir que los usuarios accedan al programa a través de la página web de forma clara y sencilla, ofreciendo contenido visual y educativo que facilite la comprensión básica del uso del software, incluso para personas sin experiencia previa.',3,2,NULL,NULL,'2026-04-01 13:48:06','2026-06-19 15:15:37',NULL,NULL,3),
(1234,28,'prueba de Codina','adad','adad',2,1,NULL,NULL,'2026-04-17 01:33:35','2026-04-17 01:33:55',NULL,'2026-06-02',1),
(1235,25,'El Anteproyecto de Investigación ','El anteproyecto es un documento breve donde expresamos las ideas iniciales de nuestra investigación. Es un \"borrador de trabajo\" que nos permite organizar el camino antes de ejecutarlo. ','',3,4,NULL,NULL,'2026-04-30 15:07:46','2026-04-30 15:08:39','2026-04-30 15:08:39',NULL,1),
(1236,25,'Anteproyecto','Desarrollar e implementar un sistema de registro de asistencia biométrico orientado a los alumnos de la U.E.G.P. N°177 \"Nuestra Voz\", integrando el sensor de huella dactilar AS608 (conectado al servidor institucional) con un software de gestión que automatice el registro de presencia por materia y lo ponga a disposición del personal docente y administrativo a través de un panel web.','',2,1,NULL,NULL,'2026-04-30 15:09:28','2026-05-07 14:14:12','2026-05-07 14:14:12',NULL,1),
(1237,25,'El preceptor de la institucion, quiere que los alumnos registren su asistencia con huella dactilar al inicio de cada clase.','El sensor AS608 está instalado de forma fija en el Aula 1 y conectado a la ESP32-ETH01 que estará ligada via Wifi o por cable a la PC o servidor que aloje el servicio. Cuando un alumno pasa el dedo, el sistema identifica su huella, determina a qué materia corresponde según el horario y registra la asistencia automáticamente.','El sistema debe registrar la fichada en menos de 3 segundos. Debe asociar cada registro a la materia activa según el horario. Si el alumno ya fichó, no debe registrar doble. Si la huella no está registrada, debe rechazarla y guardar el intento fallido.',3,2,NULL,NULL,'2026-05-11 21:39:19','2026-06-16 19:17:19',NULL,'2026-07-31',1),
(1238,25,'Como sistema, quiero detectar automáticamente qué materia está en curso segun el horario configurado, sin intervencion manual del docente','\nEl sistema consulta el horario del Aula 1 cargado en la base de datos. Compara la hora actual con las franjas horarias del día y determina qué materia corresponde. Cada fichada queda vinculada a esa materia sin que nadie tenga que activarla.','El sistema debe identificar correctamente la materia activa en función del día y la hora. Si no hay clase activa, debe rechazar la fichada con un mensaje claro. Debe soportar hasta 4 materias distintas en el mismo día en el Aula 1.',3,2,NULL,NULL,'2026-05-11 21:41:28','2026-06-16 19:46:01',NULL,'2026-10-30',1),
(1239,25,'El personal docente o preceptor, quiere ver en tiempo real que alumnos estan presentes en la clase activa desde un panel web.','El panel web muestra la materia activa, una tabla con todos los alumnos que ficharon (estado, hora exacta, porcentaje de asistencia), estadísticas del día y alertas de alumnos con inasistencias críticas. Se actualiza automáticamente cada 30 segundos sin recargar la página usando AJAX.','El panel debe mostrar quién está presente, tarde o ausente en tiempo real. Debe ser accesible solo con usuario y contraseña. ',3,2,NULL,NULL,'2026-05-11 21:42:55','2026-06-03 17:08:54',NULL,'2026-11-05',1),
(1240,25,'preceptor, quiero consultar el porcentaje de asistencia de cada alumno por materia y exportar reportes en CSV.','El sistema genera estadísticas automáticas usando vistas SQL. Muestra porcentaje de asistencia, cantidad de presentes, tardes, ausentes y justificadas por alumno y materia. Permite exportar los datos a CSV directamente desde el navegador sin librerías externas.','El porcentaje de asistencia debe calcularse automáticamente. Las inasistencias justificadas no deben contar para el límite. La exportación CSV debe abrirse correctamente en Excel ',2,2,NULL,NULL,'2026-05-11 21:44:19','2026-06-03 17:09:59',NULL,'2026-10-06',1),
(1241,25,'Como sistema, quiero enviar un email automático al alumno cuando acumule 4 inasistencias (aviso) y otro cuando llegue a 5 (crítico). Esto dependeria la materia que esta cursando el alumno en la institucion','\nSe usa Gmail SMTP con nodemailer. Al registrar una inasistencia, el servidor verifica el conteo acumulado del alumno en esa materia. Si llega a 4 manda un aviso preventivo. Si llega a 5 manda una alerta crítica. Cada tipo de email se manda una sola vez por mes para no repetir. Queda registrado en la tabla notificaciones.','El email debe enviarse automáticamente sin intervención del personal. Debe incluir nombre del alumno, materia y cantidad de faltas. No debe enviarse más de una vez por mismo tipo y materia en el mes. Si el email está desactivado en config.json, solo debe loguearse en consola sin error.',1,1,NULL,NULL,'2026-05-12 23:01:55','2026-06-16 19:27:43',NULL,'2026-06-30',1),
(1242,25,'Como Preceptora, quiero poder importar alumnos nuevos desde un CSV, promover a los alumnos existentes al año siguiente y actualizar el horario del Aula 1 para el nuevo año lectivo.','Panel de administración con 4 pasos: importar alumnos desde CSV con vista previa y validación, promover alumnos (1°→2°, 2°→3°, egresar o recursante), actualizar el horario del Aula 1 y confirmar el cierre del año. Los registros históricos nunca se borran.','El CSV debe validarse antes de importar (DNI inválido, carrera mal escrita, etc.). Los duplicados deben omitirse automáticamente. La promoción debe ser confirmada manualmente por el director. Los registros de asistencia del año anterior deben quedar archivados y consultables. Solo el Director o Administrativo puede acceder a esta sección.',3,2,NULL,NULL,'2026-05-12 23:03:10','2026-06-16 19:27:30',NULL,'2026-06-30',1),
(1243,25,'-','','',2,4,NULL,NULL,'2026-05-13 00:15:21','2026-05-13 00:16:10','2026-05-13 00:16:10',NULL,1),
(1244,26,'Como diseñador de interfaces para el proyecto, quiero diseñar el logo de nuestro proyecto, para volver la pagina mas distintiva','crear un logo que convine con los colores de  la pagina y represente que hace nuestro sistema','debe distinguirse de otros logos y que le guste a todos los integrantes',2,4,NULL,NULL,'2026-05-14 14:31:58','2026-06-21 16:38:11',NULL,'2026-05-15',1),
(1245,24,'¿Cómo funciona el lector de RFID Rc522?','explicar cómo se utiliza, conexiones, códigos simples de uso e información de distintos tipos.','mínimo uso de Inteligencia artificial ',2,1,NULL,NULL,'2026-05-14 14:43:47','2026-05-18 14:27:07',NULL,'2026-05-25',1),
(1246,30,'Investigar antecedentes de proyectos similares','Investigación de proyectos anteriores de apps/dispositivos de salud integral que hayan tenido de sujeto de prueba a adultos mayores','Entender la conclusión y saber qué les faltó y que funcionó en proyectos anteriores para avanzar',2,4,NULL,NULL,'2026-05-14 14:45:38','2026-06-18 14:20:51',NULL,NULL,7),
(1247,30,'Investigar materiales y costos','Investigamos y analizamos que microcontrolador nos conviene más según el mercado y nuestras necesidades','Encontrar el mejor microcontrolador teniendo en cuenta calidad, precio y funcionamiento',3,4,NULL,NULL,'2026-05-14 14:48:04','2026-06-18 14:21:02',NULL,NULL,7),
(1248,19,'Como usuario quiero una pagina centralizada (Dashboard)','La pagina centralizada es donde se concentraran todos los proyectos y cursos par una visualizacion mas rapida, sera la primera pagina a la que acceda el usuario despues de su logeo permitiendole acceder al resto de menus y apartados de la pagina. Tambien le permitira destacar los cursos mas importantes asi como las tareas pendientes en sus areas.','Muestreo de los Proyectos Destacados y Menus, ademas de las tareas pendientes. ',2,1,NULL,NULL,'2026-05-14 14:50:49','2026-05-14 14:50:49',NULL,NULL,1),
(1249,26,'Como diseñadores de la interfaz, queremos elegir los colores de la pagina web para hacer atractivo nuestro diseño','queremos elegir los colores de la pagina web para hacer atractivo nuestro diseño y asegurarnos que los colores elegidos sean armoniosos y representen nuestra misión','queremos elegir colores que no cansen la vista y faciliten la navegación, y combinarlos de forma que mantengan la armonía en la pagina y la gama represente la seriedad y confianza que queremos transmitir',2,4,NULL,NULL,'2026-05-14 14:52:34','2026-06-21 16:38:05',NULL,'2026-05-15',1),
(1250,22,'Pre proyecto','documentacion descriptivo  sobre el proyecto, objetivos, proposito, funcionalidades y especificaciones tecnicas.','documentacion detallada sobre el proyecto, su objetivo como producto',3,4,NULL,NULL,'2026-05-14 16:25:38','2026-05-14 16:25:38',NULL,'2026-05-14',1),
(1251,23,'Como desarrollador, quiero tener una Carpeta Técnica de Anteproyecto del sistema.','Carpeta Técnica del Anteproyecto','Carpeta técnica anteproyecto correcta y completa',3,2,NULL,NULL,'2026-05-19 20:15:31','2026-06-18 14:35:30',NULL,NULL,7),
(1252,23,'Como alumno, requiero el flujo de usuarios de alumnos.','Establecer flujo de alumnos para evitar errores y mejorar organización ','Flujo de usuario adecuado y corregido',3,2,NULL,NULL,'2026-05-19 20:30:10','2026-05-21 10:46:02','2026-05-21 10:46:02',NULL,1),
(1253,23,'Como diseñador requiero un logo','Logo del sistema','Concretar un logo para la web.',2,2,NULL,NULL,'2026-05-19 21:56:15','2026-06-18 13:10:31',NULL,NULL,5),
(1254,26,'como desarrollador quiero realizar el esquema de base de datos para tener una estructura clara','Quiero desarrollar mi esquema de base de datos para tener una estructura clara de lo que va a ser mi base datos ','Tener un esquema completo de lo que será la base de datos',2,4,NULL,NULL,'2026-05-20 13:45:54','2026-06-21 16:37:57',NULL,'2026-10-20',1),
(1255,26,'como de desarrollador quiero buscar e investigar que tecnologías puedo utilizar para elegir cual voy a usar en el proyecto','necesito buscar que lenguaje de base de datos  y lenguaje de programación/frameworks voy a usar para el desarrollo del backend y el frontend','elegir los frameworks/lenguajes con los que vamos a desarrollar el backend, frontend y base de datos',3,2,NULL,NULL,'2026-05-20 13:51:41','2026-05-29 20:40:13',NULL,NULL,1),
(1256,23,'Como desarrollador necesito  establecer limites y valores para los docentes','Se requieren limites para los docentes dentro del sistema de acuerdo a normativas institucionales para los mismos. ','Establecer limites según las normativas.',3,2,NULL,NULL,'2026-05-20 13:59:57','2026-06-18 15:33:22','2026-06-18 15:33:22',NULL,7),
(1257,23,'Como arquitecto de datos, requiero establecer el esquema de la bd. ','','',3,1,NULL,NULL,'2026-05-20 14:10:19','2026-05-21 13:45:31','2026-05-21 13:45:31',NULL,1),
(1258,26,'como desarrolladores frontend necesitamos determinar el flujo de usuario para tener claro el contenido que se va a mostrar a los distintos tipos de usuarios','crear de forma grafica y detallada el recorrido que van a hacer los distintos tipos de usuario por la aplicacion web','que los usuarios tengan una experiencia comoda y eficiente donde puedan acceder a todo lo que necesitan  dependiendo del nivel del usuario',3,1,NULL,NULL,'2026-05-20 23:48:43','2026-05-22 12:40:08',NULL,NULL,1),
(1259,23,'Como alumno, requiero el flujo de usuarios del alumno','Definir de manera clara cómo interactúan los estudiantes con la plataforma y cómo se organizan sus acciones dentro del sistema.','',3,2,NULL,NULL,'2026-05-21 10:57:10','2026-05-21 11:11:13','2026-05-21 11:11:13',NULL,1),
(1260,23,'Como usuario, requiero el flujo de usuarios ','Definir de manera clara cómo interactúan los usuarios con la plataforma y cómo se organizan sus acciones dentro del sistema. ','',3,2,NULL,NULL,'2026-05-21 11:03:20','2026-06-18 13:10:52',NULL,NULL,5),
(1261,21,'Se necesita cargar materiales y presupuesto','Lista de Materiales y sus respectivos precios\n','Materiales con link de compra o recibo y que sea una descripcion detallada',2,1,NULL,NULL,'2026-05-21 12:27:37','2026-06-05 12:54:20',NULL,'2026-07-03',1),
(1262,12,'probano nuevo ','xfndfgdfg','f ghgfhfh',2,2,NULL,NULL,'2026-05-21 12:35:47','2026-05-21 12:35:47',NULL,NULL,1),
(1263,12,'gfdgzxcxzc','fdgfdzxzcxz','fdfdgfdfdssdfdsf',2,1,NULL,NULL,'2026-05-21 12:37:27','2026-05-22 12:42:14',NULL,NULL,1),
(1264,23,'sadasdas','ASDASD','ASDASDASD',2,1,NULL,NULL,'2026-05-21 12:38:00','2026-05-21 12:38:38','2026-05-21 12:38:38',NULL,1),
(1265,23,'sadsadas','asdasd','asdasd',2,1,NULL,NULL,'2026-05-21 12:38:19','2026-05-21 12:39:03','2026-05-21 12:39:03',NULL,1),
(1266,23,'sadasdasdasd','asdasd','asdasd',3,2,NULL,NULL,'2026-05-21 12:38:52','2026-05-21 12:44:02','2026-05-21 12:44:02',NULL,1),
(1267,22,'Implementacion de servidor','Instalacion y primeras pruebas con node js','',2,2,NULL,NULL,'2026-05-21 12:57:59','2026-05-21 12:57:59',NULL,'2026-06-21',1),
(1268,22,'evaluacion de cambio de diseño','ver el diseño de la pagina, evaluarlo y ver cambios para que luzca mas profesional','',2,2,NULL,NULL,'2026-05-21 13:05:12','2026-05-21 13:05:12',NULL,'2026-10-30',1),
(1269,23,'Como sistema integrado, quiero registrar la asistencia mediante huella digital para automatizar el control de entrada.','Implementar la comunicación entre el sensor biométrico R307 y el microcontrolador ESP32 para capturar la huella del alumno, validarla contra la base de datos y enviar el registro de asistencia al servidor en tiempo real vía Wi-Fi.','✓ El ESP32 debe encender el sensor y esperar la huella.\n✓ El sistema debe identificar al alumno correctamente en menos de 2 segundos.\n✓ Se debe guardar el registro (ID alumno, fecha, hora) en la base de datos MySQL.\n✓ Debe haber una respuesta visual (LED) de éxito o error en el hardware.',3,2,NULL,NULL,'2026-05-21 14:44:01','2026-06-23 17:34:31',NULL,NULL,4),
(1270,23,'Como directivo/administrativo, quiero visualizar un ranking académico automático para seleccionar abanderados y escoltas con objetividad.','El sistema debe calcular automáticamente un puntaje final por alumno basándose en el promedio general, rendimiento por materias y porcentaje de asistencia, generando una lista ordenada para la selección de cargos institucionales.','✓ El sistema calcula el promedio ponderado de todas las materias.\n✓ El sistema suma bonificaciones o penalizaciones según el % de asistencia.\n✓ Se muestra una tabla ordenada de mayor a menor puntaje.\n✓ Permite filtrar por año escolar (ej: 7mo año).',3,1,NULL,NULL,'2026-05-21 14:44:59','2026-06-18 14:26:18',NULL,NULL,3),
(1271,23,'Como docente, quiero cargar notas de trabajos prácticos y evaluaciones para registrar el rendimiento de mis alumnos.','Interfaz que permita al profesor seleccionar su curso y materia, y cargar las notas correspondientes a trabajos prácticos, notas cuatrimestrales y finales.','✓ El docente solo ve los cursos y materias que le corresponden.\n✓ Permite ingresar notas numéricas (escala 1-10).\n✓ Diferencia visualmente entre \"Trabajo Práctico\", \"Parcial\" y \"Final\".\n✓ Guarda los cambios en la base de datos sin recargar la página (AJAX/JS).',2,1,NULL,NULL,'2026-05-21 14:46:34','2026-06-18 14:25:53',NULL,NULL,4),
(1272,23,'Como alumno, quiero consultar mi estado académico completo para monitorear mi desempeño y asistencia.','Vista privada del alumno donde pueda ver sus calificaciones por materia, su promedio general calculado y su historial de asistencias (días presente/ausente).','✓ Muestra lista de materias con notas actuales.\n✓ Muestra un indicador de % de asistencia (ej: 85%).\n✓ El alumno no puede editar ninguna información, solo lectura.',2,1,NULL,NULL,'2026-05-21 14:47:21','2026-06-18 14:26:34',NULL,NULL,3),
(1273,23,'Como administrador, quiero gestionar los usuarios del sistema (Altas/Bajas) para controlar quién accede a la plataforma.','Módulo administrativo para registrar nuevos alumnos, docentes y preceptores, asignándoles un rol específico que determine sus permisos dentro del sistema.','✓ Formulario de registro con datos personales y credenciales de acceso.\n✓ Selector de Rol: (Administrador, Docente, Alumno).\n✓ Validación de que el usuario no exista previamente (DNI o Email único).',3,1,NULL,NULL,'2026-05-21 14:48:13','2026-06-18 14:26:47',NULL,NULL,3),
(1274,21,'Desarrollo de un logotipo para el programa y definición de colores de logo','Logotipo del programa y colores ','',2,4,NULL,NULL,'2026-05-21 15:37:17','2026-06-24 11:53:36',NULL,'2026-05-22',1),
(1275,27,'maquetado usuario\n','','',3,1,NULL,NULL,'2026-05-21 15:49:45','2026-05-21 15:54:56','2026-05-21 15:54:56',NULL,1),
(1276,27,'maquetado admin','','',3,2,NULL,NULL,'2026-05-21 15:50:11','2026-05-21 15:52:11',NULL,NULL,1),
(1277,27,'flujo de admin ','','',3,1,NULL,NULL,'2026-05-21 15:50:36','2026-05-21 15:51:03',NULL,NULL,1),
(1278,27,'flujo de usuario','','',3,1,NULL,NULL,'2026-05-21 15:50:50','2026-05-21 15:50:50',NULL,NULL,1),
(1279,27,'maquetado usuario\n','','',3,2,NULL,NULL,'2026-05-21 15:52:40','2026-06-10 11:47:39',NULL,NULL,1),
(1280,26,'Como desarrollador quiero preparar los escáneres para usarlos para poder incluirlo en mi proyecto   ','Quiero probar los escáneres, leer su manual, configurarlo e incluirlo en el proyecto ','que los escáneres funcionen y puedan integrarse en el proyecto',2,1,NULL,NULL,'2026-05-22 11:31:54','2026-05-22 12:12:45',NULL,'2026-10-10',1),
(1281,29,'Como dev del Backend quiero definir el stack tecnologico que utilizaremos para dicho Backend','investigar que tecnologia es la mas conveniente para usar en el backend, y realizar una comparativa entre estas tecnologias, por ejemplo el uso de node.js, express.js, MySQL, HeidiSQL y Xampp para crear el Backend, laravel, etc etc. plataforma de servidor, nube o local','Un documento que explique el porque se escogio ese stack tecnologico a comparacion de otros',2,2,NULL,NULL,'2026-05-22 12:25:37','2026-06-09 21:37:36','2026-06-09 21:37:36',NULL,1),
(1282,26,'como desarrolladores frontend necesitamos diseñar graficamente como se va a ver la aplicacion web ','diseñamos como se va a ver cada pantalla con las particularidades que cada usuario necesite usar','que cumpla con ser visible (claro e intuitivo), cohesivo (que tenga un diseño uniforme con las fuentes, colores etc), prevencion de errores (Diseñar pensando en evitar que el usuario cometa fallos), flexibilida/eficiencia (Ofrecer atajos o personalización para que tanto usuarios principiantes como expertos puedan navegar rápidamente) y diseño estetico ( Eliminar información irrelevante que compita por la atención, priorizando solo los elementos necesarios) para el usuario',3,1,NULL,NULL,'2026-05-22 12:27:50','2026-05-22 12:28:33',NULL,NULL,1),
(1283,30,'Probar los componentes','Empezamos a desarrollar un prototipo con los componentes básicos, testeando los sensores y probando como van a funcionar los circuitos.','Que todos los sensores funcionen, se haga la conexión, y el código funcione correctamente.',3,2,NULL,NULL,'2026-05-22 12:57:25','2026-06-18 14:21:12',NULL,NULL,6),
(1284,30,'Probar MQ-2','Probar el sensor MQ-2, haciendo que registre el gas y genere el aviso.','Que el MQ-2 mande el aviso de que detecta el gas y genere correctamente el aviso.',3,2,NULL,NULL,'2026-05-22 13:00:30','2026-05-28 10:41:42','2026-05-28 10:41:42',NULL,1),
(1285,30,'Probar PIR','Probar el sensor PIR (Sensor de movimiento), que genere avisos y mande señales cuando se detecte un movimiento.','Que el sensor PIR envíe un aviso correctamente cuando detecte un movimiento en cierto lugar específico. Lograr conectarlo y que trabaje con el sensor LDR para que cuando se decta movimiento se active el sensor LDR.',3,1,NULL,NULL,'2026-05-22 13:05:29','2026-05-28 10:41:45','2026-05-28 10:41:45',NULL,1),
(1286,30,'Probar LDR','Probar el sensor LDR (Sensor sensible a la luz) y hacer que funcione correctamente con luz.','Que el LDR detecte la luz y envíe un mensaje de advertencia. Lograr combinarlo con el PIR para que se encienda la luz cuando se genera un movimiento.',3,1,NULL,NULL,'2026-05-22 13:08:38','2026-05-28 10:41:47','2026-05-28 10:41:47',NULL,1),
(1287,21,'buscar informacion sobre la tecnologia NFC','buscar informacion detallada sobre el funcionamiento de la tecnologia NFC','que es?\ncaracteristicas del NFC',2,4,NULL,NULL,'2026-05-26 18:52:17','2026-06-24 11:53:42',NULL,'2026-05-27',1),
(1288,21,'planteo del prolema','Desarrollar un planteo del prolema que cumpla con las consginas dadas en el pdf dado en clase','',3,2,NULL,NULL,'2026-05-26 19:03:07','2026-05-28 14:17:54','2026-05-28 14:17:54','2026-05-31',1),
(1289,21,'Marco Teorico','Desarrollar el marco teorico del Anteproyecto con las consignas del pdf dado en clase','',3,1,NULL,NULL,'2026-05-26 19:03:54','2026-05-28 14:17:55','2026-05-28 14:17:55','2026-05-31',1),
(1290,21,'Pasar Base de datos de AguaPey a MySQL ','Cambiar el formato de la DB de Aguapey a MySQL u/o otro formato de bases de datos','',3,4,NULL,NULL,'2026-05-26 19:05:44','2026-06-24 11:55:14',NULL,'2026-06-15',1),
(1291,24,'como hadware developer quiero ver la maquetaciónn digital, más su funcionamiento y explicación.','crear ya sea en wokwi simulator o en cisco packet traser la maquetación digital de los componentes del proyecto, crear un word con la explicación de el funcionamiento y explicando que estaría haciendo cada componente en este proyecto.','',2,1,NULL,NULL,'2026-05-27 11:06:09','2026-05-27 11:06:09',NULL,'2026-06-15',1),
(1292,24,'base de datos','crear el prototipo de la base de datos para la gestión de la caja fuerte','',2,1,NULL,NULL,'2026-05-27 13:08:20','2026-05-27 13:08:20',NULL,'2026-06-22',1),
(1293,19,'Diseñado del Login y Creacion del Login','Como usuario quiero una pagina que permita poder tener una cuenta y pueda acceder con mi cuenta personal y mis preferencias','Que permita el acceso a su cuenta personal del usuario',2,2,NULL,NULL,'2026-05-27 14:09:55','2026-05-27 14:09:55',NULL,NULL,1),
(1294,19,'Transcripcion de las User Historys del Video','Creacion de las User History`s que menciono codina en el video ','',2,1,NULL,NULL,'2026-05-27 14:34:13','2026-05-27 14:34:13',NULL,NULL,1),
(1295,30,'Aplicaciones móvil','Empezar a desarrollar una aplicación movil para poder meter la base de datos con el servidor, poder después vincularlo al circuito, y que se haga un envío de información para guardar datos como medicamentos.','Que la aplicación tenga funcionalidad correctamente, que se añadan los datos y se pueda llevar la cuenta, que disminuyan los medicamentos cuando se detecta el uso de medicamentos, se pueda sumar y se pueda establecer un número específico.',3,2,NULL,NULL,'2026-05-28 10:55:16','2026-06-26 17:48:02',NULL,NULL,4),
(1296,26,'como desarrolladores necesitamos entrevistar al usuario para avanzar en el diseño de interfaces','necesitamos saber las necesidades y complicaciones del usuario para diseñar una experiencia de usuario agradable e intuitiva a la hora de su uso','entrevistar al usuario en persona y que responda a las preguntas que le hacemos',2,1,NULL,NULL,'2026-05-28 12:12:20','2026-05-28 12:13:08',NULL,NULL,1),
(1297,21,'Ante-Proyecto / Carpeta de Campos','Desarrollo del Ante-Proyecto\nDesarrollo de la carpeta de campos','',3,2,NULL,NULL,'2026-05-28 14:19:20','2026-05-28 14:21:42',NULL,'2026-07-14',1),
(1298,23,'Como diseñador, requiero el maquetado digital de las páginas web ','Maquetados','',2,2,NULL,NULL,'2026-05-28 19:22:35','2026-06-11 13:57:38','2026-06-11 13:57:38','0001-01-01',1),
(1299,23,'Como desarrollador requiero los limites y restricciones de los usuarios','Desarrollo de limites y restricciones por usuario','',3,2,NULL,NULL,'2026-05-28 22:06:12','2026-06-18 15:33:04',NULL,NULL,7),
(1300,23,'Como diseñador, necesito una opinión externa sobre el diseño de las páginas','Encuestas sobre cada diseño ','',3,2,NULL,NULL,'2026-05-28 22:13:14','2026-06-18 13:12:57',NULL,NULL,7),
(1301,21,'Maquetado de la aplicacion','desarrollar un maquetado digital de la aplicacion \"Scan&Go\"','',3,2,NULL,NULL,'2026-06-01 11:40:48','2026-06-01 11:40:48',NULL,'2026-06-30',1),
(1302,19,'Listado de Proyectos (Docente)','Como docente quiero tener el listado de los proyectos de mis alumnos. Un listado estilo tabla, con proyecto tras proyecto, para despues poder seleccionar el proyecto en el que quiero ver avances, gestionar o auditar. ','Funcionamiento correcto de las funcionalidades propuestas.',2,1,NULL,NULL,'2026-06-02 15:55:37','2026-06-02 16:05:32',NULL,NULL,1),
(1303,19,'Detalles de Proyecto (Docente)','Como docente quiero poder ver en la pestaña de proyectos, los detalles del proyecto seleccionado. Quiero poder seleccionar o ver detalles especificos de un proyecto.','',2,1,NULL,NULL,'2026-06-02 15:58:28','2026-06-03 03:34:19',NULL,NULL,1),
(1304,19,'Seguimiento de US (Docente)','Yo como docente quiero poder seleccionar en el dashboard un proyecto para hacer seguimiento de las User Stories.','',2,1,NULL,NULL,'2026-06-02 16:07:01','2026-06-02 16:07:01',NULL,NULL,1),
(1305,19,'Informacion del Proyecto (Usuario)','Yo como usuario, quiero ver informacion rapida del proyecto, como: estado del proyecto, fecha de entrega, fecha final, descripcion rapida del proyecto, titulo del proyecto, objetivo general y alcance del proyecto.','',2,1,NULL,NULL,'2026-06-02 16:10:15','2026-06-02 16:10:15',NULL,NULL,1),
(1306,19,'Ver integrantes del proyecto (Usuario)','Al entrar a la info basica de un proyecto, quiero ver quienes son los integrantes que trabajan en ese proyecto.','',2,1,NULL,NULL,'2026-06-02 16:13:57','2026-06-02 16:13:57',NULL,NULL,1),
(1307,19,'Ver si fue validada la viabilidad (Usuario)','Yo como usuario quiero ver si ya fue validada la viabilidad del proyecto o si esta pendiente aun de ser viable. Ademas quiero que se adjunte el documento firmado por los alumnos.','',2,1,NULL,NULL,'2026-06-02 16:15:40','2026-06-02 16:16:04',NULL,NULL,1),
(1308,19,'Pagina centralizada de documentacion (Docente)','Yo como docente, quiero poder ver todos los documentos del proyecto de manera centralizada. Quiero tener centralizado todos los links de la documentacion.','',2,1,NULL,NULL,'2026-06-02 16:17:13','2026-06-02 16:17:13',NULL,NULL,1),
(1309,19,'Poder calificar a los alumnos (Docente)','Yo como docente, quiero poder calificar o evaluar a un alumno, para tener un respaldo de cuando cumplio y cuando no cumplio.','',2,1,NULL,NULL,'2026-06-02 16:21:39','2026-06-02 16:21:39',NULL,NULL,1),
(1310,19,'Seguimiento de calificaciones','Como usuario quiero ver graficamente un seguimiento de las calificaciones de los integrantes','',2,1,NULL,NULL,'2026-06-02 16:22:55','2026-06-02 16:22:55',NULL,NULL,1),
(1311,29,'Como dev del frontend quiero definir el stack tecnologico que utilizaremos para dicho frontend','explicar que stack tecnologico  se usara para el fronted por ejemplo node.js, vue.js, react, angular y Svelte.','documento que explique porque elegio ese stack tegnologico y comparararlo con los otro.',2,2,NULL,NULL,'2026-06-04 13:01:19','2026-06-09 21:37:44','2026-06-09 21:37:44',NULL,1),
(1312,29,'Esquema en escrito(dibujo) del frontend','realizar un esquema de como sera el frontend ','Documento pdf de como seria el esquema escrito(dibujo) del frontend',1,2,NULL,NULL,'2026-06-04 13:08:15','2026-06-05 13:11:04','2026-06-05 13:11:04',NULL,1),
(1313,29,'Definir los colores del frontend','definir en un documentos los colores que se usaran en la pagina ','Documento donde se defina los colores que se usaran para el frontend ',2,1,NULL,NULL,'2026-06-04 13:12:16','2026-06-05 13:11:13','2026-06-05 13:11:13',NULL,1),
(1314,29,'Esquema digital del frontend','Realiazar un esquema digital de como se veria el frontend','Documeto PPTX visual que mueste como seria el diseño del frontend',2,2,NULL,NULL,'2026-06-04 13:31:35','2026-06-05 13:11:10','2026-06-05 13:11:10',NULL,1),
(1315,29,'Esquema web del frontend','Realizar un esquema web de como seria el frontend','mandar el link o documento .rar mostrando como es el esquema web del frontend',2,1,NULL,NULL,'2026-06-04 13:34:42','2026-06-05 13:10:57','2026-06-05 13:10:57',NULL,1),
(1316,30,'Entrevistas','Hacer entrevistas a cuidadores que hayan tenido experiencia en haber trabajado con personas mayores de edad, para poder tener una idea de que información poner en la aplicación.','Que la información obtenida de ciertos cuidadores sirva para poder agregar funcionalidades y utilidades a la aplicación.',2,1,NULL,NULL,'2026-06-04 21:34:37','2026-06-18 14:25:04',NULL,NULL,7),
(1317,20,'Animación para la pagina ','Como programa, quiero que el logo del mismo este animado cuando se ejecute el programa','Tiene que funcionar la animación cuando el programa sea ejecutado, el logo se tiene que mover simulando un aleteo ',2,2,NULL,NULL,'2026-06-05 12:18:28','2026-06-19 16:30:33',NULL,NULL,3),
(1318,21,'Investigación sobre BD-Frameworks','Realizar una investigacion sobre distintas bases de datos y frameworks donde se trabaje con bases de datos. Seleccionar la mas eficiente para el proyecto','',3,4,NULL,NULL,'2026-06-05 12:31:34','2026-06-24 11:54:53',NULL,'2026-06-06',1),
(1319,26,'Como desarrollador de Hardware quiero preparar e integrar los lectores de huella dactilar para usarlos en la verificación por biometría del sistema','Quiero conectar, configurar, e implementar en el código los lectores de huella que vamos a usar para la verificación por biometría de huella dactilar','Tener implementado el lector de huella dactilar en el código y que funcione correctamente',2,1,NULL,NULL,'2026-06-05 14:06:50','2026-06-05 14:07:41',NULL,NULL,1),
(1320,19,'Documentacion extra: DNI','Agregar el requerimento del DNI (a forma de numero), en el registro.','',2,1,NULL,NULL,'2026-06-05 14:51:56','2026-06-05 14:51:56',NULL,NULL,1),
(1321,29,'como pogramador del frontend quiero definir lo grafico de la pagina web ','Esquema en papel como virtual y web','Documento formato word como pptx y link.',2,2,NULL,NULL,'2026-06-09 19:21:54','2026-06-09 21:37:48','2026-06-09 21:37:48',NULL,1),
(1322,29,'Desarrollar backend','Proceso de crear y perfeccionar el prototipo de backend','',2,1,NULL,NULL,'2026-06-09 19:42:51','2026-06-09 20:08:39',NULL,NULL,1),
(1323,29,'Investigación Inicial','Proceso de informarnos lo mejor posible para la realización de este sistema','',2,1,NULL,NULL,'2026-06-09 19:56:26','2026-06-09 19:56:26',NULL,NULL,1),
(1324,29,'Desarrollar frontend','Proceso de investigar, crear y perfeccionar la organización y estilo de la pagina web de este sistema','',2,1,NULL,NULL,'2026-06-09 20:10:53','2026-06-09 20:16:51',NULL,NULL,1),
(1325,27,'Carpeta Anteproyecto','','',3,2,NULL,NULL,'2026-06-09 20:17:42','2026-06-09 20:17:42',NULL,'2026-06-10',1),
(1326,29,'Documentación','Aca vamos llevando a cabo la documentación requerida','',2,1,NULL,NULL,'2026-06-09 21:21:12','2026-06-18 13:05:45','2026-06-18 13:05:45',NULL,1),
(1327,21,'Diferencias entre Aguapey y Scan&Go','','',1,4,NULL,NULL,'2026-06-10 00:17:21','2026-06-24 11:54:47',NULL,'2026-06-10',1),
(1328,23,'Como diseñador del sistema requiero conocimiento y experiencia de usuarios mediante encuestas','Realizar entrevistas/encuestas a las áreas implicadas en el sistema','Obtener la información que abarca cada área de una administración escolar',3,2,NULL,NULL,'2026-06-11 12:31:53','2026-06-18 16:02:05',NULL,NULL,7),
(1329,23,'Como diseñador, requiero el maquetado digital de las páginas web ','maquetados','',2,2,NULL,NULL,'2026-06-11 13:57:32','2026-06-18 13:09:42',NULL,NULL,5),
(1330,20,'logo del sistema y de la pagina','como usuario quiero que  la pagina y el sistema de audio tangan un logo con un serafín que sea también la cara del programa ','el logo tiene que ser un dibujo uniforme y bien echo de un serafín ',2,4,NULL,NULL,'2026-06-17 03:15:06','2026-06-19 16:30:42',NULL,NULL,3),
(1331,30,'Desarrollar frontend','Desarrollar un ambiente cómodo a la vista para la aplicación con un diseño lindo.','Que el diseño sea lindo y agradable a la vista.',2,2,NULL,NULL,'2026-06-18 14:38:57','2026-06-18 14:38:57',NULL,NULL,3),
(1332,23,'como diseñador, requiero un manual de usuario ','Explicación de cómo utilizar el sistema, detallando las funcionalidades, pantallas y pasos a seguir para cada tipo de usuario','',2,2,NULL,NULL,'2026-06-18 15:19:10','2026-06-18 15:19:10',NULL,NULL,7),
(1333,23,'como diseñador de hardware, requiero la documentación de los componentes y las conexiones','','',2,1,NULL,NULL,'2026-06-18 15:31:46','2026-06-18 16:03:17',NULL,NULL,7),
(1334,23,'Como diseñador requiero la paleta de colores y tipografías','','',2,1,NULL,NULL,'2026-06-18 15:54:46','2026-06-18 15:55:03',NULL,NULL,5),
(1335,23,'Como analista de datos requiero las entidades necesarias para el sistema ','Analizar encuestas previamente hechas para obtener las entidades (con sus atributos) de las partes integrantes del sistema.','',2,1,NULL,NULL,'2026-06-18 16:05:34','2026-06-18 16:05:34',NULL,NULL,1),
(1336,27,'Hardware; documentación de los componentes y conexiones ','Explicación detallada de cada componente del proyecto, incluyendo sus fotografías, funciones, valor y utilidad en el proyecto ','',1,1,NULL,NULL,'2026-06-24 11:41:01','2026-06-24 11:41:01',NULL,NULL,7);
/*!40000 ALTER TABLE `user_stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_escuelas`
--

DROP TABLE IF EXISTS `usuario_escuelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_escuelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `escuela_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `escuela_id` (`escuela_id`),
  CONSTRAINT `fk_escuela_id` FOREIGN KEY (`escuela_id`) REFERENCES `escuelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_school` FOREIGN KEY (`escuela_id`) REFERENCES `escuelas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_escuelas`
--

LOCK TABLES `usuario_escuelas` WRITE;
/*!40000 ALTER TABLE `usuario_escuelas` DISABLE KEYS */;
INSERT INTO `usuario_escuelas` VALUES
(55,2,1),
(62,24,1),
(66,26,1),
(68,3,1),
(93,45,1),
(94,46,1),
(95,47,1),
(96,48,1),
(97,49,1),
(98,50,1),
(99,51,1),
(100,52,1),
(101,53,1),
(102,54,1),
(103,55,1),
(104,56,1),
(105,57,1),
(106,58,1),
(107,59,1),
(108,60,1),
(109,61,1),
(110,62,1),
(111,63,1),
(112,64,1),
(113,65,1),
(114,66,1),
(115,67,1),
(116,68,1),
(117,69,1),
(147,99,1),
(205,30,1),
(206,31,1),
(208,33,1),
(209,32,1),
(210,34,1),
(211,35,1),
(212,36,1),
(213,37,1),
(214,38,1),
(215,39,1),
(216,40,1),
(217,41,1),
(218,42,1),
(219,43,1),
(220,44,1),
(222,21,1),
(223,29,1),
(224,22,1),
(225,23,1),
(226,27,1),
(227,28,1),
(228,103,1),
(229,104,1),
(235,106,1),
(236,19,1),
(242,96,1),
(243,95,1),
(244,75,1),
(245,93,1),
(252,80,1),
(253,83,1),
(254,86,1),
(260,97,1),
(261,76,1),
(265,88,1),
(271,101,1),
(273,79,1),
(277,91,1),
(280,107,1),
(281,102,1),
(283,78,1),
(284,74,1),
(291,81,1),
(292,71,1),
(294,25,1),
(296,98,1),
(301,90,1),
(303,94,1),
(304,84,1),
(306,77,1),
(307,100,1),
(308,70,1),
(311,85,1),
(312,87,1),
(315,73,1),
(316,82,1),
(317,92,1),
(319,105,1),
(322,89,1),
(324,1,1),
(325,20,1),
(326,72,1);
/*!40000 ALTER TABLE `usuario_escuelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `curso` varchar(50) DEFAULT NULL,
  `division` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `especialidad_id` int(11) DEFAULT 1,
  `mensajes_sin_leer` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `rol_id` (`rol_id`),
  KEY `fk_usuario_especialidad` (`especialidad_id`),
  CONSTRAINT `fk_usuario_especialidad` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'Guille Adrián','Codina','codinaguillermo@gmail.com','$2b$10$nnl.m/uKg3OSZjv6jW4A5.yz2pJ7pZEIbWTKHdmBXJrbGxx9mNCva',1,NULL,NULL,'+543624758990',1,'2026-01-27 16:21:42','2026-06-23 23:26:23',NULL,'avatar-1-1773368353123-247641105.jpg',1,0),
(2,'Guille Admin','Codina','guille@test.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'',0,'2026-01-28 01:58:18','2026-03-04 20:07:19',NULL,NULL,1,0),
(3,'Guillermo Adrian','Codina','guille2@gmail.com','$2b$10$Jc7y8GS.W05/Kv0FZOpw8evGoHYA7rprKg9UsWnYJiBfRrjAFv2XK',1,NULL,NULL,'',0,'2026-02-04 19:24:43','2026-03-04 20:42:19',NULL,NULL,1,0),
(19,'Gustavo','Ramirez','wallyenlacomputadora@gmail.com','$2b$10$zDGIfEH.Qmd8t/bQmA7Ee.NjdpO0nItbrnxShcLWODbWv8gdE4Zx6',2,NULL,NULL,'+543624006164',1,'2026-03-04 20:10:52','2026-06-16 16:45:15',NULL,'avatar-19-1773102223638-238274704.png',1,0),
(20,'ivo','sanchez','ivo@sanchez.com','$2b$10$ZjeRVabVyA1wTtcvW/F1Vuc.iMryXX5qqb2L7wEiNSUrVqQQD8NvC',3,'5to','1ra','+54',0,'2026-03-04 20:11:28','2026-06-25 21:51:32',NULL,NULL,1,0),
(21,'Brisa Belén','ESPINOZA','brisa@alumnos.com','$2b$10$ovOlUjg3lTGcf9qIQptKD.0BgihOTuC56LsT2l.aDzjsK1C2c3euS',3,'6to','1ra','',0,'2026-03-04 20:36:43','2026-03-06 17:51:02',NULL,NULL,4,0),
(22,'Franco','GARCIA','franco@alumnos.com','$2b$10$ryzLK0u/5u4zyPIl63iM0u4TudOErhXJqMfLlbNmnJ3VzQQOn1ZXW',3,'6to','1ra','',0,'2026-03-04 20:37:13','2026-03-06 17:56:05',NULL,NULL,4,0),
(23,'Camila Ileana','KRAMER','camila@alumnos.com','$2b$10$qlj2sMZ49m3XNDurs7Mry.7uxeo0aqq1OgDE7K5UsMko0GnwPsR6u',3,'6to','1ra','',0,'2026-03-04 20:38:06','2026-03-06 17:56:17',NULL,NULL,1,0),
(24,'Roberto','Rolón','rnrolon@gmail.com','$2b$10$gzjqE8vyHxMbbqRwGaXxo.QvPGoidlpefK44qYABKOQbOs2kcvw7q',2,NULL,NULL,'',1,'2026-03-04 20:39:31','2026-06-08 22:37:50',NULL,NULL,1,1),
(25,'Debora','Toledo','deboratoledo44@gmail.com','$2b$10$mdaOCwdL.xDHFdb4WOZRRegJe5yeLZdmYB7AhQ/nSmWGiGuv8EtGW',2,NULL,NULL,'+54',1,'2026-03-04 20:40:07','2026-05-11 14:36:59',NULL,NULL,1,0),
(26,'Benjamin','Ramirez','benjamin@alumnos.com','$2b$10$jpEsQj3yIP0dW5MVWgCtn.zkPz.UsgZeu2GYAbIro6NBj/e0RJjKW',3,'5to','1ra','',1,'2026-03-04 20:41:11','2026-03-04 20:41:11',NULL,NULL,1,0),
(27,'LIMANOVSKY, Renzo','LIMANOVSKY, Renzo','renzo@alumnos.com','$2b$10$QtDHtEUVD8OTEUceLzoph.WAKpyLX1Mv0YxdcYV00btfLJ3duKmKK',3,'6to','1ra','',0,'2026-03-04 20:43:15','2026-03-06 17:56:24',NULL,NULL,1,0),
(28,'Luciano','Mikielievich','luciano@alumnos.com','$2b$10$u2AaIctx/0.csr4mXKjWxuXumy4rR5MRMHGHxJLt1qkK1ocwa6apK',3,'4to','1ra','',0,'2026-03-04 20:44:47','2026-03-06 17:56:57',NULL,NULL,1,0),
(29,'ramiro','Cancia','ramiro@ramiro.com','$2b$10$.pGgM3khXIhAY2vcNrRqxe5KCBxHi3U1lQgHt3TzgqilnLaX4LBIO',3,'6to','1ra','',0,'2026-03-05 15:33:53','2026-03-06 17:55:30',NULL,NULL,4,0),
(30,'Selene Marianela','Allou','allou_selene_marianela@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:42:38',NULL,NULL,4,0),
(31,'Enzo Maximo','Alvarez','alvarez_enzo_maximo@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:42:50',NULL,NULL,4,0),
(32,'Samuel Ivan','Armenta Raffault','armenta_raffault_samuel_ivan@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:43:09',NULL,NULL,4,0),
(33,'Benjamin Gabriel','Bay Gimenez','bay_gimenez_benjamin_gabriel@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:43:04',NULL,NULL,4,0),
(34,'Jeremias Vladimir','Bellini','bellini_jeremias_vladimir@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:43:14',NULL,NULL,4,0),
(35,'Jerónimo','Britez Oszust','britez_oszust_jeronimo@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:43:19',NULL,NULL,4,0),
(36,'Belen','Cabrera','cabrera_belen@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:43:28',NULL,NULL,4,0),
(37,'Mariano Gabriel','Cardozo Román','cardozo_roman_mariano_gabriel@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:43:36',NULL,NULL,4,0),
(38,'Tobía Lan','Castillo','castillo_tobia_lan@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:45:01',NULL,NULL,4,0),
(39,'Santiago Gaspar','Cerviño Toscoff','cervino_toscoff_santiago_gaspar@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:45:07',NULL,NULL,4,0),
(40,'Braian','Chavez','chavez_braian@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:45:13',NULL,NULL,4,0),
(41,'Francesco Matias','Cortes Acosta','cortes_acosta_francesco_matias@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:45:22',NULL,NULL,4,0),
(42,'Juan José','Espindola','espindola_juan_jose@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:45:39',NULL,NULL,4,0),
(43,'Benjamin Gian Pablo','Fantin','fantin_benjamin_gian_pablo@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:45:43',NULL,NULL,4,0),
(44,'Erik Bladimir','Fernandez','fernandez_erik_bladimir@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra','',1,'2026-03-06 14:36:36','2026-03-06 17:45:47',NULL,NULL,4,0),
(45,'Ezequiel','Foschiatti','foschiatti_ezequiel@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(46,'Luciano Nahuel','Goussal','goussal_luciano_nahuel@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(47,'santino','Guarnieri','guarnieri_santino@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(48,'Morena Victoria','Martinez Parec','martinez_parec_morena_victoria@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(49,'Sebastián Ezequiel','Maurenzi','maurenzi_sebastian_ezequiel@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(50,'Nicolas Daniel','Molina','molina_nicolas_daniel@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(51,'Thiago Nahuel','Montiel Fogar','montiel_fogar_thiago_nahuel@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(52,'Luz Mia','Nuñez','nunez_luz_mia@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(53,'Sofia Leonor','Pereña Machado','perena_machado_sofia_leonor@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(54,'Patricio Fermán','Porfirio','porfirio_patricio_ferman@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(55,'Luciano Ramón','Pucheta','pucheta_luciano_ramon@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(56,'Benjamín Uriel','Ramirez','ramirez_benjamin_uriel@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(57,'Lucas Alejandro','Ramunno','ramunno_lucas_alejandro@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(58,'Bruno Nicolas','Rios Aquino','rios_aquino_bruno_nicolas@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(59,'Luana Valentina','Rodriguez','rodriguez_luana_valentina@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(60,'Francisco Agustin','Rolón','rolon_francisco_agustin@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(61,'Tobías Alejandro','Romero','romero_tobias_alejandro@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(62,'Lorenzo Gustavo','Rubin','rubin_lorenzo_gustavo@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(63,'Hannah Milena','Sanchez','sanchez_hannah_milena@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(64,'Ivo David','Sanchez','sanchez_ivo_david@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(65,'Mateo Javier','Stacul Cendra','stacul_cendra_mateo_javier@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(66,'Agustín Sebastián','Tourn','tourn_agustin_sebastian@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(67,'Kayra Magalí','Valdez','valdez_kayra_magali@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(68,'Micaela Adabella','Vallejos Baez','vallejos_baez_micaela_adabella@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(69,'Claudia Elizabeth','Verón','veron_claudia_elizabeth@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'5to','1ra',NULL,1,'2026-03-06 14:36:36','2026-03-06 14:36:36',NULL,NULL,4,0),
(70,'Takashi Agustin','Asano','asanito13@gmail.com','$2b$10$oyulKSHGGK3cRedwSmECQe91Trzdl4AsUUHsr7XA782V53oayngRe',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-05-22 13:00:26',NULL,NULL,4,0),
(71,'Mateo Ezequiel Alejandro','Barrios Ezquivela','barriosmateop@gmail.com','$2b$10$Mgye38CCjEaJ/rv16RSoD.LxKea.lMVSYZuo/K6ArTnv8EvYTzkjC',3,'6to','1ra','+543624272743',1,'2026-03-06 14:37:51','2026-05-08 12:27:28',NULL,NULL,4,0),
(72,'Aarón Adriel','Caballero','caballeroaaron65@gmail.com','$2b$10$6IlLe1wRXgSKDn4pIIkMp.Jn2AfZuoPsOCZaPWGGewMjgRRCotNZG',3,'6to','1ra','+543624851265',1,'2026-03-06 14:37:51','2026-06-29 12:48:58',NULL,NULL,4,0),
(73,'Brisa Belén','Espinosa','espinosabrisa2007@gmail.com','$2b$10$wdi2xIgr892s6j3Ss72IEOXjmHWMY1RFInRv.Vsuil9qkGRHY4mI.',3,'6to','1ra','+543624804244',1,'2026-03-06 14:37:51','2026-06-04 14:40:58',NULL,NULL,4,0),
(74,'Bautista','Gaona Cortes','bautistacortes@gmail.com','$2b$10$MlDXtRGfVhRckHKtCJGNeeMTLkSv6yl/eOzjc2nJag21exSSYjSQC',3,'6to','1ra','+543624652881',1,'2026-03-06 14:37:51','2026-04-06 12:52:04',NULL,NULL,4,0),
(75,'Joaquin Alejandro','Gonzalez','joaquingonzalezalejandro7@gmail.com','$2b$10$3cHXgsuKjiDPAOyrBnujg.Exys8RNjRHsWjGyXZZRGFIeOAbe6zZ2',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 11:43:56',NULL,NULL,4,0),
(76,'Agustin Nahuel','Hayes','agustinnahuelhayes@gmail.com','$2b$10$KIUR/UsNwlm3X0HqDsWPgeMHDDjGi93m2oLSdsGJfVsoidUbDQYiW',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 12:16:41',NULL,NULL,4,0),
(77,'Santiago Hiram Adrian','Kiverling','Santiagokiverling22@gmail.com','$2b$10$nNaYge1nnKP10jQoXfF//ureaIrE38pfr8JwA0MFaWg/GpeGi7xdy',3,'6to','1ra','+543624002437',1,'2026-03-06 14:37:51','2026-05-21 15:21:47',NULL,NULL,4,0),
(78,'Camila Ileana','Kramer','ileanakramer19@gmail.com','$2b$10$5iXcODlWosX3yVddtf/M0uxgnBP/i3Lr2gbCEQ5yb5/o3vIfI6CQG',3,'6to','1ra','+543624158704',1,'2026-03-06 14:37:51','2026-04-02 23:20:53',NULL,NULL,4,0),
(79,'Xavier Alexander','Lacunza Quijano','xavierlacunza@gmail.com','$2b$10$Mg6xsmvSpKgV.IJocgakHO.KwIzGYgn2/XymlSzUGGrx9tPkAYDo.',3,'6to','1ra','+543625216116',1,'2026-03-06 14:37:51','2026-03-30 14:09:41',NULL,NULL,4,0),
(80,'Renzo','Limanovsky','limarenzo32@gmail.com','$2b$10$Nc/xhpas/axTi8igY8fISOJqKJ0hZ6.Kx8jfPrOmYh5M3CcLU/Ed6',3,'6to','1ra','+543625464208',1,'2026-03-06 14:37:51','2026-03-27 11:52:02',NULL,NULL,4,0),
(81,'Lourdes Mairé','Lopez Dominguez','lourdesmairelop@gmail.com','$2b$10$JvOoZKDWXcjAzmSRHimPm.3MgNCG69l1i4DuvXBDJZLRYZvshLyJ.',3,'6to','1ra','+543624144865',1,'2026-03-06 14:37:51','2026-05-08 12:25:53',NULL,NULL,4,0),
(82,'Francisco Uriel','Ramirez Cantero','franciscouram1@gmail.com','$2b$10$BCOqd8qz7XS9440cB1MD9.utwjs2EwyvZX6T1hjeA.YFj/eb14nTO',3,'6to','1ra','+543624168853',1,'2026-03-06 14:37:51','2026-06-04 14:41:43',NULL,NULL,4,0),
(83,'Rodrigo Martin','Sanchez','414rodrigt14@gmail.com','$2b$10$7M4AXsEcyknHIp6e9gLQRehkfhWbd8PUvIrOQES09mtDfHYZi1T4.',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 11:52:34',NULL,NULL,4,0),
(84,'Lautaro','Sanchez Rosalin','tepcito1483@gmail.com','$2b$10$gDHKI4oCsPTctyVzewpAs.kLvz7rm74BWfLNtmdcACx61aLVE3P2O',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-05-21 13:24:50',NULL,NULL,4,0),
(85,'Francisco Uriel','Suarez','fsvh1922008@gmail.com','$2b$10$2kLtyE6XudLN4L/w9YCTP.SOmoJ4cHHdOdDoDfJaavKSos/lTCFZS',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-05-28 12:46:30',NULL,NULL,4,0),
(86,'Spezzati Franco','Talavera','tafran456@gmail.com','$2b$10$C/O8bbbhCVluSoehHPcIBuPGrcoLqWHFjHxEFAMSCS/p0.H46g.pq',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 11:53:26',NULL,NULL,4,0),
(87,'Victor Nahuel','Vega','veganahuel428@gmail.com','$2b$10$L3qsejuy9sYr.RvKRcksju7R/TkFkZebiz.q5/B/c7cc2cW4G1LxG',3,'6to','1ra','+543624946651',1,'2026-03-06 14:37:51','2026-06-02 17:12:45',NULL,NULL,4,0),
(88,'Lara Magali','Veloso Sosa','laravelosososa1997@gmail.com','$2b$10$Z6E3b9nf4/3Nd0jsWrKqced7tG/ILXz6pEpqWEks6HecALt.7Yx16',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 12:29:10',NULL,NULL,4,0),
(89,'Mia','Waskievich','waskievichmia@gmail.com','$2b$10$zd2YBd8UuV2eHzRpLmI4eOSiGdNGb6C9yKH5XmFDcu7C2zVxkTZde',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-06-18 13:25:43',NULL,NULL,4,0),
(90,'Maia','Zalazar ','maiaramirez425@gmail.com','$2b$10$ThhteYA4TlYGP89UDNm0IeUG2rBhXr0NYUyF0qcmqP9csFrYTkLuq',3,'6to','1ra','+543624600789',1,'2026-03-06 14:37:51','2026-05-21 12:16:31',NULL,NULL,4,0),
(91,'Tmás Emiliano','Zarate Oviedo','tomasemilianozarate@gmail.com','$2b$10$BBRKy7qfq6fKEetA1fX59OdzGt3B4rjdtKciIFn38d93Y/E0Yl84q',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-30 14:48:53',NULL,NULL,4,0),
(92,'Renata Lucia','Zorzon Keila','keilazorzon@gmail.com','$2b$10$EwNFWsKUmzFoZkc5RomrZedbXuz8PJBHCU5GwsPzBZ2OkzKjXxn9y',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-06-09 20:15:54',NULL,NULL,4,0),
(93,'Franco','Garcia','garcia.valenzj7@gmail.com','$2b$10$nNUWqnvDr5xIrvkamE9I0OIaZ4zeqgoTEws3J38RdTTuWz1RoZhpe',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 11:44:54',NULL,NULL,4,0),
(94,'Ramiro','Candia','candiaramiro42@gmail.com','$2b$10$T8XzyA8IQOjiilBOlEWZJeOQy9SSAIj8UnLdrLpyzw.HYXWzHJsIS',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-05-21 13:24:26',NULL,NULL,4,0),
(95,'Renzo','Raymundo','renzo22maxray@gmail.com','$2b$10$Pu/9AfEdTd9VtFggu34b0.YBaVD1bJsMDo4ZbDmNSIM/oSB753BIW',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 11:43:01',NULL,NULL,4,0),
(96,'Lucca','Lorenzo Herrera','luccalorenzoherrera@gmail.com','$2b$10$CmQGdMgl.MYYN9.BHHeIOO/dCvK.OUe2urV1slLTR5x5nFl3AEOju',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 11:42:49',NULL,NULL,4,0),
(97,'Elian Dimarco','Loto','elianloto2.0@gmail.com','$2b$10$sOKc5M5fvJs6sklTkYvIlu/vhym1Tp1m9f7TDSq0ZGVn7E6lkD2WS',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-03-27 12:16:05',NULL,NULL,4,0),
(98,'Roberto','Cohene Vilaqui','ccohene13@gmail.com','$2b$10$0qOqjhBv0Brw3etqcVW.0OSV9IiO.JdyX7qGwLHEfnBFMw8ohEZp.',3,'6to','1ra','+54',1,'2026-03-06 14:37:51','2026-05-13 00:18:11',NULL,'avatar-98-1778631491832-421628142.jpg',4,0),
(99,'Milagros Noemi','Correa','correa_milagros_noemi@eet24.com','$2b$10$5/sTg82T92KhgJLyYbfrC.5Ewl/qUrKAFgCMQ259CgNuySwRa796i',3,'6to','1ra',NULL,1,'2026-03-06 14:37:51','2026-03-06 14:37:51',NULL,NULL,4,0),
(100,'Brianna','Sandoval','sandovaljaurechibrianna@gmail.com','$2b$10$ZEvjp3rxhm4bwWFjeuYi3erGjZ8bOfxxekOyszlLs/nr.eE.24cJO',3,'6to','1ra','+54362529092|',1,'2026-03-06 14:37:51','2026-05-21 15:55:30',NULL,NULL,4,0),
(101,'Sofia','Windeker','sofia.windeker@gmail.com','$2b$10$08yhL6mIsGTWiREvEQPuVOgU1d6uXgbhl.TVyq2Z4nJi9RPlEZauW',3,'6to','1ra','+543624173558',1,'2026-03-06 14:37:51','2026-03-30 12:11:36',NULL,'avatar-101-1774872695969-708236086.jpeg',4,0),
(102,'Martin','Hidalgo Sotelo','hidalgos.martin01@gmail.com','$2b$10$ySR9n/5ZKow.vPlGW2dHTOpakCgm15/x18lUu86a97gKI40jPHNZu',3,'6to','1ra','+543625324992',1,'2026-03-06 14:37:51','2026-04-02 18:41:25',NULL,NULL,4,0),
(103,'alumno','Alumno','alumno@alumno.com','$2b$10$m288LrMIgxEJ7RJALsNH8eSVkw7joSCxP4uMF2uDTDShokJ/ylVdC',3,'1ro','A','',1,'2026-03-09 20:42:53','2026-03-09 20:42:53',NULL,NULL,1,0),
(104,'Maria Yolanda','Fernandez','terciariofontana@gmail.co','$2b$10$aOSMAHPPDcQvNmPQpLiefuXuyqmswnDV3AxA9tg1HdUTby/ofm0/O',2,NULL,NULL,'',1,'2026-03-09 21:21:19','2026-03-09 21:21:19',NULL,NULL,1,0),
(105,'usuario','basico','usuario@basico.com','$2b$10$XCEJlLyj0oGDkIc1cnbU1.VeHigZThGGGpXaSRMULK81Ru5JbMaXG',3,'','','+54',1,'2026-03-11 11:52:53','2026-06-12 18:55:57',NULL,NULL,1,0),
(106,'Santiago','Gutierrez Avendanio','santiagomanuel2020@gmail.com','$2b$10$ktc8oQTpIy2Dw9KPyYuPpuFB3wZXAVi.dSXLarmuhnka/ZxLLDFnq',2,NULL,NULL,'+543624709770',1,'2026-03-12 12:04:14','2026-03-12 12:04:14',NULL,NULL,1,0),
(107,'Maximo Sebastian','Imfeld Gonzalez','sebastianmaximo2007@gmail.com','$2b$10$R40h4.2QEiuDC.Ha1EdQc.24YG6gmAO9kHJTzP.cq4ZTWBWOHrwIS',3,'6to','1ra','+543624222511',1,'2026-03-27 12:23:01','2026-04-02 18:23:21',NULL,NULL,4,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gestion_proyectos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-29 10:09:07
