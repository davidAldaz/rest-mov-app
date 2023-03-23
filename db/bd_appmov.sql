-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_movilrestapp
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `almuerzos`
--

DROP TABLE IF EXISTS `almuerzos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almuerzos` (
  `id_alm` int NOT NULL AUTO_INCREMENT,
  `tipo_alm` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `desc_alm` varchar(600) DEFAULT NULL,
  `precio_alm` decimal(4,2) DEFAULT NULL,
  `imagen_alm` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `id_est_per` int DEFAULT NULL,
  PRIMARY KEY (`id_alm`),
  KEY `fk_alm_est_idx` (`id_est_per`),
  CONSTRAINT `fk_alm_est` FOREIGN KEY (`id_est_per`) REFERENCES `establecimientos` (`id_est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almuerzos`
--

LOCK TABLES `almuerzos` WRITE;
/*!40000 ALTER TABLE `almuerzos` DISABLE KEYS */;
/*!40000 ALTER TABLE `almuerzos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cli` int NOT NULL AUTO_INCREMENT,
  `nombre_cli` varchar(40) DEFAULT NULL,
  `apellido_cli` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `telef_cli` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `correo_cli` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `passwd_cli` varchar(192) DEFAULT NULL,
  PRIMARY KEY (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (34,'Mónica','Garces','0988888888','monica@info.com','monica123'),(35,'PruebaR','PruebaR','0977554433','pruebar@info.com','pruebar123'),(36,'Lurio','Garces','0912554433','lurio@info.com','lur123'),(37,'PruebaF','PruebaF','0987654443','prueba@info.com','$2a$10$83Id5CyEq68GgM0ue7tZ6uLAcBxIusV6rDI8RcnbjdcUWKRDr0MEW'),(38,'David','Aldaz','098309727','david@info.com','$2a$10$8zDvGfMQ7hP73ueFFGX4QenzCjJSnb5bkxQWCPnH3yXQ6xwyiFGV2'),(39,'Carolina','Herrera','0998282827','carolina@info.com','$2a$10$EVHDGW2jCydKRPXLv.gWzuNSTRIjMkNxs6ZsLPbvHYPkkz.1TBbTG'),(40,'Alex','Gomez','0987771111','alex@info.com','$2a$10$RDdO7tiE8F00WVE.VfUGmu/JnGHgQYeYgIxG/ch.CfgBxPIRCst4.'),(41,'Marco','Jarrín','0987722211','marco@info.com','$2a$10$2DkW98yAYLZjC/7Xz0AY5u8rVeJqQN2p8WzzcF/5f5h7ikoAaLWuO');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id_com` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_est` int DEFAULT NULL,
  `comentario` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_com`),
  KEY `fk_cli_com_idx` (`id_usuario`),
  KEY `fk_est_com_idx` (`id_est`),
  CONSTRAINT `fk_cli_com` FOREIGN KEY (`id_usuario`) REFERENCES `clientes` (`id_cli`),
  CONSTRAINT `fk_est_com` FOREIGN KEY (`id_est`) REFERENCES `establecimientos` (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,35,5,'Servicio aceptable'),(2,35,5,'Comida tarde'),(3,34,7,'Comida fria'),(4,39,11,'Exelente servicio');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desayunos`
--

DROP TABLE IF EXISTS `desayunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desayunos` (
  `id_des` int NOT NULL AUTO_INCREMENT,
  `tipo_des` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `descrip_des` varchar(200) DEFAULT NULL,
  `precio_des` decimal(4,2) DEFAULT NULL,
  `img_des` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `visible` varchar(2) DEFAULT NULL,
  `id_est_per` int DEFAULT NULL,
  PRIMARY KEY (`id_des`),
  KEY `fk_des_est_idx` (`id_est_per`),
  CONSTRAINT `fk_des_est` FOREIGN KEY (`id_est_per`) REFERENCES `establecimientos` (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desayunos`
--

LOCK TABLES `desayunos` WRITE;
/*!40000 ALTER TABLE `desayunos` DISABLE KEYS */;
INSERT INTO `desayunos` VALUES (2,'Continental','Cafe (agua/leche) + Huevos + Jugo',2.50,'','NO',5),(3,'Estudiantil','Cafe (agua/leche) + Huevos + Jugo + Seco de carne/pollo',2.70,'','SI',5),(5,'Normal','Seco de pollo + Jugo + Huevos',2.75,'','NO',5),(6,'Normal P2','Seco de pollo + Jugo + Huevos',2.75,'','SI',5),(7,'Estudiantil 2','Bolon de verde + Jugo',1.75,'https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Desayunos%2FEstudiantil%202-Panchitos?alt=media&token=e41da684-cd78-4838-af27-ed9b3426ba5a','NO',5);
/*!40000 ALTER TABLE `desayunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establecimientos` (
  `id_est` int NOT NULL AUTO_INCREMENT,
  `ruc_est` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `nombre_est` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `direccion_est` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `latitud_est` decimal(18,16) DEFAULT NULL,
  `longitud_est` decimal(18,16) DEFAULT NULL,
  `telefono_est` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `horario_est` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `correo_est` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `passwd_est` varchar(192) DEFAULT NULL,
  `imagen_est` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `likes_est` int DEFAULT NULL,
  PRIMARY KEY (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` VALUES (5,'123456644','Panchitos','Av. Rio Lelia',-1.3573757185437320,-78.6120701041456200,'0965555555','08:00 - 22:00','panchitos@info.com','panchitos123','https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Establecimientos%2FPanchitos.JPG?alt=media&token=aac1ef6f-3945-4d0b-9805-497f9e3a7ff0',9),(7,'7777777777777','Jocay de Manta','Av. Los Elechos',-1.3350935782500613,-78.6196148984619600,'0943434343','06:00 - 00:00','juan@info.com','juan123','https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Establecimientos%2FJocay%20de%20Manta.jpg?alt=media&token=bdf081be-3336-4807-aa24-139714b4e0f0',7),(9,'9898989898998','El Faro','Av. Los Shiris',-1.3397991399292917,-78.6202378631152600,'0962626262','06:00 - 00:00','mocka@info.com','mocka123','https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Establecimientos%2FEl%20Faro.jpg?alt=media&token=d432268d-0d2a-490e-af1b-b658bff09985',8),(11,'2222222222222','La Sazón de Mary','Av. Los Chasquis y Rio Cutuchi',-1.2679101417462058,-78.6262175910434700,'0987222222','07:00 - 17:00','mary@info.com','$2y$10$djOSx9ZoWs/Vj2avjLokNeC6IwbROZzKofrDYYtpP/nlA1VlshvpS','https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Establecimientos%2FLa%20Saz%C3%B3n%20de%20Mary?alt=media&token=0adad54c-9591-4550-b61a-5967bf354c15',8);
/*!40000 ALTER TABLE `establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `correo_log` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `passwd_log` varchar(192) DEFAULT NULL,
  `fecha_log` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rol_log` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (18,'monica@info.com','monica123','2023-01-16 20:37:24','cliente'),(21,'juan@info.com','juan123','2023-01-19 05:25:07','admin'),(22,'mocka@info.com','mocka123','2023-01-19 05:31:04','admin'),(23,'mary@info.com','$2y$10$djOSx9ZoWs/Vj2avjLokNeC6IwbROZzKofrDYYtpP/nlA1VlshvpS','2023-01-26 02:41:21','admin'),(27,'prueba@info.com','$2a$10$83Id5CyEq68GgM0ue7tZ6uLAcBxIusV6rDI8RcnbjdcUWKRDr0MEW','2023-01-25 07:17:49','cliente'),(28,'david@info.com','$2a$10$Pyc5gtrmSKDO5.nqQAm0JegYhjgEkV6fS2DVQgKPUm.P0yo23tGfi','2023-02-28 03:37:21','cliente'),(29,'carolina@info.com','$2a$10$.DkSN7GvFphuYI5GBCGG5eF5pn3IyuLz0TbtE97MkGybo38A7Ig9G','2023-02-28 03:50:27','cliente'),(30,'alex@info.com','$2a$10$o7PpsrvITp7E6M/jqwO9SustGHiIGwTBRDTJHBpPwVlYlYTGykuOG','2023-02-28 03:58:51','cliente'),(31,'marco@info.com','$2a$10$TTx4SUoyyfLN.H1wb4OAqenUpZO8jgpjuOJd0qqET8.Fn.jiQIm6a','2023-02-28 04:02:17','cliente');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meriendas`
--

DROP TABLE IF EXISTS `meriendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meriendas` (
  `id_mer` int NOT NULL AUTO_INCREMENT,
  `nombrepla_mer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `desc_mer` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `precio_mer` decimal(4,2) DEFAULT NULL,
  `imagen_mer` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `id_est_per` int DEFAULT NULL,
  PRIMARY KEY (`id_mer`),
  KEY `fk_mer_est_idx` (`id_est_per`),
  CONSTRAINT `fk_mer_est` FOREIGN KEY (`id_est_per`) REFERENCES `establecimientos` (`id_est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meriendas`
--

LOCK TABLES `meriendas` WRITE;
/*!40000 ALTER TABLE `meriendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `meriendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id_mesa` int NOT NULL AUTO_INCREMENT,
  `numero_mesa` int DEFAULT NULL,
  `capac_mesa` int DEFAULT NULL,
  `estado_mesa` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `id_estab` int DEFAULT NULL,
  PRIMARY KEY (`id_mesa`),
  KEY `fk_mesas_estab_idx` (`id_estab`),
  CONSTRAINT `fk_mesas_estab` FOREIGN KEY (`id_estab`) REFERENCES `establecimientos` (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,1,4,'reservada',5),(3,2,4,'disponible',5),(8,3,4,'reservada',5),(9,4,2,'disponible',5),(10,5,4,'disponible',5),(11,6,2,'disponible',5),(12,1,4,'disponible',11);
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos`
--

DROP TABLE IF EXISTS `platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos` (
  `id_plato` int NOT NULL AUTO_INCREMENT,
  `tipo_plato` varchar(45) DEFAULT NULL,
  `desc_plato` varchar(500) DEFAULT NULL,
  `precio_plato` decimal(4,2) DEFAULT NULL,
  `img_plato` varchar(500) DEFAULT NULL,
  `visible` varchar(2) DEFAULT NULL,
  `categoria_plato` varchar(45) DEFAULT NULL,
  `id_est_per` int DEFAULT NULL,
  PRIMARY KEY (`id_plato`),
  KEY `fk_est_platos_idx` (`id_est_per`),
  CONSTRAINT `fk_est_platos` FOREIGN KEY (`id_est_per`) REFERENCES `establecimientos` (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos`
--

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
INSERT INTO `platos` VALUES (1,'Estudiantil 2','Bolon de verde + Jugo',1.75,'https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Desayunos%2FEstudiantil%202-Panchitos?alt=media&token=e41da684-cd78-4838-af27-ed9b3426ba5a','SI','DESAYUNO',5),(2,'Normal','Corviches + Jugo',2.90,'https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Desayunos%2FNormal-Panchitos-DES?alt=media&token=0d781d6e-c16c-48f0-9a9c-f8b1c047927e','NO','DESAYUNO',5),(5,'Normal 2','Cafe (leche/agua) + Pan + Ensalada de Frutas',3.90,'https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Desayunos%2FNormal%202-Panchitos-DES?alt=media&token=1dc1a661-6151-4c35-b8ae-bf5abda9802f','SI','DESAYUNO',5),(6,'Completo','Sopa de verde + Seco de carne + Jugo + Postre',2.50,'https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Almuerzos%2FCompleto-Panchitos-ALM?alt=media&token=3ba7520a-1b29-48e6-baaa-ec795b42bcf7','NO','ALMUERZO',5),(7,'Lomo Asado','Lomo + Papas + Arroz',3.99,'https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Merienda%2FLomo%20Asado-Panchitos-MER?alt=media&token=01de7abf-3fe4-417c-87e8-3be673348b56','SI','MERIENDA',5),(8,'Hambuguesa','Hambuguesa Simple + Papas',2.75,'https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/PlatosVarios%2FHambuguesa-Panchitos-PV?alt=media&token=b85a4da1-6c29-47a0-8128-05db40ee5e94','NO','PV',11);
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos_varios`
--

DROP TABLE IF EXISTS `platos_varios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos_varios` (
  `id_pesp` int NOT NULL AUTO_INCREMENT,
  `nombre_pesp` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `desc_pesp` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `precio_pesp` decimal(4,2) DEFAULT NULL,
  `imagen_pesp` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `id_est_per` int DEFAULT NULL,
  PRIMARY KEY (`id_pesp`),
  KEY `fk_pesp_est_idx` (`id_est_per`),
  CONSTRAINT `fk_pesp_est` FOREIGN KEY (`id_est_per`) REFERENCES `establecimientos` (`id_est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos_varios`
--

LOCK TABLES `platos_varios` WRITE;
/*!40000 ALTER TABLE `platos_varios` DISABLE KEYS */;
/*!40000 ALTER TABLE `platos_varios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_prom` int NOT NULL AUTO_INCREMENT,
  `titulo_prom` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `desc_prom` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `precio_prom` decimal(18,6) DEFAULT NULL,
  `vdesde_prom` date DEFAULT NULL,
  `vhasta_prom` date DEFAULT NULL,
  `imagen_prom` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `estado_prom` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `id_est_per` int DEFAULT NULL,
  PRIMARY KEY (`id_prom`),
  KEY `fk_est_prom_idx` (`id_est_per`),
  CONSTRAINT `fk_est_prom` FOREIGN KEY (`id_est_per`) REFERENCES `establecimientos` (`id_est`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (2,'Promo 2x1','6 Alitas + 6 Alitas Gratis',2.990000,'2023-02-26','2023-02-27','https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Promociones%2FPromo%202-Panchitos?alt=media&token=135789b9-7b84-42f2-96c4-319c3a82f299','oculto',5),(3,'Promo Estudiantil','Salchipapa + Carnipapa GRATIS Bebida',4.990000,'2023-02-26','2023-02-26','https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Promociones%2FPromo%203-Panchitos?alt=media&token=9c6aaa3f-6df5-4599-a151-d39367ee402e','visible',5),(4,'Promo 4','Hambuguesa + Papas fritas',1.990000,'2023-02-26','2023-02-27','https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Promociones%2FPromo%204-Panchitos?alt=media&token=90e117ce-bdd9-4052-bff1-8d7a672d69ea','visible',5),(7,'Promoción Martes','Alitas + Camarones + Bebida',7.990000,'2023-02-28','2023-02-28','https://firebasestorage.googleapis.com/v0/b/movil-restaurant.appspot.com/o/Promociones%2FPromoci%C3%B3n%20Martes-La%20Saz%C3%B3n%20de%20Mary?alt=media&token=938ecdcd-8550-4822-8f39-8aaf01995e3e','oculto',11);
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_mesas`
--

DROP TABLE IF EXISTS `reserva_mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_mesas` (
  `id_reservam` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_establec` int DEFAULT NULL,
  `id_mesa` int DEFAULT NULL,
  `fecha_res` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_reservam`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_mesas`
--

LOCK TABLES `reserva_mesas` WRITE;
/*!40000 ALTER TABLE `reserva_mesas` DISABLE KEYS */;
INSERT INTO `reserva_mesas` VALUES (1,3,5,4,'2023-02-28 00:22:54');
/*!40000 ALTER TABLE `reserva_mesas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28  0:59:30
