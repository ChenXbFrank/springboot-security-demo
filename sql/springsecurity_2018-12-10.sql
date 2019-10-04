

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Sys_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sys_permission`;

CREATE TABLE `Sys_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Sys_permission` WRITE;
/*!40000 ALTER TABLE `Sys_permission` DISABLE KEYS */;

INSERT INTO `Sys_permission` (`id`, `name`, `description`, `url`, `pid`)
VALUES
	(1,'ROLE_HOME','index','/',NULL),
	(2,'ROLE_ADMIN','admin','/admin',NULL),
	(3,'ROLE_USER','user','/user',NULL);

/*!40000 ALTER TABLE `Sys_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Sys_permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sys_permission_role`;

CREATE TABLE `Sys_permission_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `permission_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role2` (`role_id`),
  KEY `permission` (`permission_id`),
  CONSTRAINT `permission` FOREIGN KEY (`permission_id`) REFERENCES `Sys_permission` (`id`),
  CONSTRAINT `role2` FOREIGN KEY (`role_id`) REFERENCES `Sys_Role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Sys_permission_role` WRITE;
/*!40000 ALTER TABLE `Sys_permission_role` DISABLE KEYS */;

INSERT INTO `Sys_permission_role` (`id`, `role_id`, `permission_id`)
VALUES
	(10,2,1),
	(11,2,3),
	(12,3,1),
	(13,3,2),
	(15,2,2);

/*!40000 ALTER TABLE `Sys_permission_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Sys_Role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sys_Role`;

CREATE TABLE `Sys_Role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Sys_Role` WRITE;
/*!40000 ALTER TABLE `Sys_Role` DISABLE KEYS */;

INSERT INTO `Sys_Role` (`id`, `name`)
VALUES
	(2,'ROLE_USER'),
	(3,'ROLE_ADMIN');

/*!40000 ALTER TABLE `Sys_Role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Sys_Role_User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sys_Role_User`;

CREATE TABLE `Sys_Role_User` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Sys_User_id` int(11) unsigned NOT NULL,
  `Sys_Role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`Sys_User_id`),
  KEY `role` (`Sys_Role_id`),
  CONSTRAINT `role` FOREIGN KEY (`Sys_Role_id`) REFERENCES `Sys_Role` (`id`),
  CONSTRAINT `user` FOREIGN KEY (`Sys_User_id`) REFERENCES `Sys_User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Sys_Role_User` WRITE;
/*!40000 ALTER TABLE `Sys_Role_User` DISABLE KEYS */;

INSERT INTO `Sys_Role_User` (`id`, `Sys_User_id`, `Sys_Role_id`)
VALUES
	(6,1,3),
	(7,2,2);

/*!40000 ALTER TABLE `Sys_Role_User` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Sys_User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sys_User`;

CREATE TABLE `Sys_User` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Sys_User` WRITE;
/*!40000 ALTER TABLE `Sys_User` DISABLE KEYS */;

INSERT INTO `Sys_User` (`id`, `username`, `password`)
VALUES
	(1,'admin','6d789d4353c72e4f625d21c6b7ac2982'),
	(2,'user','36f1cab655c5252fc4f163a1409500b8');

/*!40000 ALTER TABLE `Sys_User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
