/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : laravelbd

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-21 09:53:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comentarios
-- ----------------------------
DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `detalle` varchar(800) DEFAULT NULL,
  `fkMaterial` int(10) unsigned DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkComentario` (`fkMaterial`),
  CONSTRAINT `fkComentario` FOREIGN KEY (`fkMaterial`) REFERENCES `materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comentarios
-- ----------------------------
INSERT INTO `comentarios` VALUES ('3', '2017-03-16 14:19:22', 'otra mas de esto', '6', null);
INSERT INTO `comentarios` VALUES ('4', '2017-03-16 14:27:36', 'este es un comentario con email', '6', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('10', '2017-03-18 00:00:00', 'nuevo comentario de prueba', '6', null);
INSERT INTO `comentarios` VALUES ('11', '2017-03-18 00:00:00', 'nuevo comentario de prueba dos', '6', null);
INSERT INTO `comentarios` VALUES ('12', '2017-03-18 00:14:07', 'hola a todos', '6', null);
INSERT INTO `comentarios` VALUES ('13', '2017-03-18 00:14:53', 'nuevo comentarios', '6', null);
INSERT INTO `comentarios` VALUES ('14', '2017-03-19 01:12:04', 'comentario hecho desde donde se debe', '6', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('15', '2017-03-19 01:13:10', 'esto esta con redireccion', '6', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('16', '2017-03-19 01:14:03', 'una nueva hola de comentarios estaa por suceder ', '6', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('20', '2017-03-19 01:21:31', 'una mas', '7', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('21', '2017-03-19 01:24:06', 'una mas', '7', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('22', '2017-03-19 01:24:12', 'dos mas', '7', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('23', '2017-03-19 01:24:16', 'tres mas', '7', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('24', '2017-03-19 01:24:21', 'cuatro ms', '7', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('26', '2017-03-19 01:44:14', 'este comentario lo hize yo', '7', 'lidia@yahoo.es');
INSERT INTO `comentarios` VALUES ('27', '2017-03-19 01:45:45', 'Este libro es bueno para ver', '6', 'lidia@yahoo.es');
INSERT INTO `comentarios` VALUES ('28', '2017-03-20 05:14:35', 'este es el ultimo comentario que realizo en laravel del curso', '7', 'luas0_1@yahoo.es');
INSERT INTO `comentarios` VALUES ('29', '2017-03-21 00:33:11', 'primer comentario', '11', null);
INSERT INTO `comentarios` VALUES ('30', '2017-03-21 00:35:30', 'segundo comentario', '11', null);
INSERT INTO `comentarios` VALUES ('31', '2017-03-21 00:35:38', 'tercer comentario', '11', null);
INSERT INTO `comentarios` VALUES ('32', '2017-03-21 00:53:04', 'dsfsdf', '11', null);
INSERT INTO `comentarios` VALUES ('33', '2017-03-21 00:53:10', 'adfadfdf sadsfdf', '11', null);
INSERT INTO `comentarios` VALUES ('34', '2017-03-21 00:53:18', 'adfasdfasd adsf', '11', null);
INSERT INTO `comentarios` VALUES ('35', '2017-03-21 00:53:22', 'adfadfadf afdfadf', '11', null);

-- ----------------------------
-- Table structure for materials
-- ----------------------------
DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `autor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `portada` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fkUsuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkMaterial` (`fkUsuario`),
  CONSTRAINT `fkMaterial` FOREIGN KEY (`fkUsuario`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of materials
-- ----------------------------
INSERT INTO `materials` VALUES ('6', 'uml 2 y patrones', 'bosh', 'libro uml para ingenieria de software II', 'http://omg.com', '1490068534_php.png', 'Video', '1', '2017-03-15 15:16:47', '2017-03-21 03:55:34');
INSERT INTO `materials` VALUES ('7', 'tutorial programacion 2', ' saul mamani', 'nose por que hago esto de los videos', 'http://noseporque.com', 'C:\\xampp\\tmp\\php45CF.tmp', 'Video', '1', '2017-03-15 15:26:17', '2017-03-15 15:44:31');
INSERT INTO `materials` VALUES ('8', 'Programacion Java', 'Joyanes Aguilar', 'Programacion orientdada a objetos', 'http://java.org', 'C:\\xampp\\tmp\\php130E.tmp', 'Libro', '3', '2017-03-15 21:30:33', '2017-03-15 21:30:33');
INSERT INTO `materials` VALUES ('9', 'uno', 'dos', 'tres o mas o que mas', 'http://cuatro.com', '1489615842_php.png', 'Libro', '3', '2017-03-15 21:34:55', '2017-03-15 22:10:42');
INSERT INTO `materials` VALUES ('10', 'php', 'joyanes', 'akjsd;lfakjdslfasdfsdf', 'http://dfdfdf.com', '...', 'Libro', '1', '2017-03-16 01:05:21', '2017-03-16 01:05:21');
INSERT INTO `materials` VALUES ('11', 'progracion laravel', 'filly', 'curso de laravel fni', 'http://fili.com', '1489797112_preLaravel.jpg', 'Libro', '7', '2017-03-18 00:31:52', '2017-03-18 00:31:52');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2017_03_14_004535_create_materials_table', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('luas0_1@yahoo.es', 'ad2fdcb7c207d394411983cf9431cf3576e55b70c4e4198061c81819890d0e78', '2017-03-19 19:50:13');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'luas0_1@yahoo.es', '$2y$10$suJERcvNgH9tPxfCe2AJNeJSmSoPElBXMVByAQevexiLdv5Bq4URG', 'Saul', 'Mamani', '1490069561_saul.jpg', 'Administrador', '0GSwkkxZbuwNXPjzzUIwCghzWc5ATKnu8JxArjLoR86saqt9S6AVZxXart6s', '2017-03-14 23:35:15', '2017-03-21 04:12:41');
INSERT INTO `users` VALUES ('3', 'juan@hotmail.com', '$2y$10$bwtDIA.YQrkFjBkOnjo6HOdO0UDRIFlWoZPNjQktDDOeI0wDC5pTi', 'juan pablo', 'perez perez', '1489687409_laravel-tutorial-for-beginner.png', 'Lector', 'AW3zGMrkQkn7I7Wjp9sdMZA7JvvnOekydAyTDiKm9AmRF4VR0ksXLCkW919w', '2017-03-15 00:11:01', '2017-03-16 18:04:54');
INSERT INTO `users` VALUES ('7', 'lidia@yahoo.es', '$2y$10$dQRRp4MW2fiS/7LqS5LiduvSo.0LpgdQ1RXc2z4eXhiT/THRT0Hze', 'lidia', 'tangara marce', '1489686036_angular-js.png', 'Lector', 'N5IXgel6PylR5AnqEtlD7p9GE1mt8TzAM8xl3lYOso6cRbfuZXWugj0cWQmz', '2017-03-16 17:40:36', '2017-03-21 01:18:55');
INSERT INTO `users` VALUES ('8', 'juan@juan.com', '$2y$10$/1nT4ZmNtK/AKXandpDw8.HjPIa9yWuIaSMVjJiV6z6l1aT7T1LAa', 'juan', 'perez perez', '1489686229_cisco.jpg', 'Lector', '4eNZNWsHOwq56aPCjQGR3Vt8ZMCgtr4P6qxabMObc8fy8ULD7VvrLVbNAWiU', '2017-03-16 17:43:49', '2017-03-16 20:37:02');
INSERT INTO `users` VALUES ('9', 'saul@yui.com', '$2y$10$GYj5WoYh8sXg1U43tnd5k.CRV2ba6443Wrac/dGWpZqRVqotD51ou', 'saul', 'mlskdjflk', '1489798874_preLaravel.jpg', 'Lector', 'SJm6blyywG7vHmBIZQotCyxVJU4JzDImtIJLB2thDqZlG99dFAdFx66bzlX7', '2017-03-18 01:01:14', '2017-03-18 01:15:15');
INSERT INTO `users` VALUES ('10', 'hack@hack.com', '$2y$10$G7mIEXKWAExOX6sHXRk8MeBzq9GEMNC0Is3o3L4JL95IYeWWz4FDm', '<script>alert(\'has sido hackeado\')</script>', 'anonimos', '1490045260_logo_sib_oruro.jpg', 'Lector', 'jY0yAv0hm4OfnFfBNTkp4ZG0Zx4hAQKQRkGTgA0vC1vJpok0fv79iNlCQKQk', '2017-03-20 21:27:40', '2017-03-20 21:33:43');
INSERT INTO `users` VALUES ('11', 'pamela@hotmail.com', '$2y$10$C/NPaFbvf2DLSm.bxo6w/u.yxrgSw2hE0f5F7J4kw2fAlr1PqS7Zq', 'pamela', 'del rincon', '1490052697_laravel-tutorial-for-beginner.png', 'Lector', 'bOqiTUmkhC0poUa7E4ljdUgA6pIJ7cQc6Ilhs08Wcq9gnxHAAqluxRnt7I2c', '2017-03-20 23:31:37', '2017-03-21 01:02:33');

-- ----------------------------
-- View structure for vwreporteestadistico
-- ----------------------------
DROP VIEW IF EXISTS `vwreporteestadistico`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vwreporteestadistico` AS select u.email, count(m.fkUsuario) as cantidad
from materials as m inner JOIN
users as u on u.id = m.fkUsuario
GROUP BY u.email ;

-- ----------------------------
-- View structure for vwreportelista
-- ----------------------------
DROP VIEW IF EXISTS `vwreportelista`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vwreportelista` AS SELECT
materials.id,
materials.titulo,
materials.autor,
users.email,
users.nombre,
users.apellido
FROM
materials
INNER JOIN users ON materials.fkUsuario = users.id ;
