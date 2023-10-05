/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.4.19-MariaDB : Database - pfinal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `Id` int(2) NOT NULL AUTO_INCREMENT,
  `IdVuelos` int(2) DEFAULT NULL,
  `Precio` float(6,2) DEFAULT NULL,
  `Pasajeros` int(2) DEFAULT NULL,
  `IdOrigen` int(2) DEFAULT NULL,
  `IdDestino` int(2) DEFAULT NULL,
  `IdUser` int(2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_vuelo` (`IdVuelos`),
  KEY `fk_orige` (`IdOrigen`),
  KEY `fk_dest` (`IdDestino`),
  KEY `fk_user` (`IdUser`),
  CONSTRAINT `fk_dest` FOREIGN KEY (`IdDestino`) REFERENCES `destinos` (`Id`),
  CONSTRAINT `fk_orige` FOREIGN KEY (`IdOrigen`) REFERENCES `origenes` (`Id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`IdUser`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_vuelo` FOREIGN KEY (`IdVuelos`) REFERENCES `vuelos` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `compras` */

insert  into `compras`(`Id`,`IdVuelos`,`Precio`,`Pasajeros`,`IdOrigen`,`IdDestino`,`IdUser`) values (1,1,200.00,2,1,2,1),(2,1,200.00,2,1,2,1),(3,1,200.00,2,1,2,1),(4,1,200.00,2,1,2,1),(5,1,200.00,2,1,2,1),(6,1,200.00,2,1,2,1),(7,1,200.00,2,1,2,1),(8,1,200.00,2,1,2,1);

/*Table structure for table `destinos` */

DROP TABLE IF EXISTS `destinos`;

CREATE TABLE `destinos` (
  `Id` int(2) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `destinos` */

insert  into `destinos`(`Id`,`Nombre`) values (1,'CIUDAD GUATEMALA'),(2,'PETEN, GUATEMALA'),(3,'BELICE');

/*Table structure for table `origenes` */

DROP TABLE IF EXISTS `origenes`;

CREATE TABLE `origenes` (
  `Id` int(2) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `origenes` */

insert  into `origenes`(`Id`,`Nombre`) values (1,'CIUDAD GUATEMALA'),(2,'PETEN, GUATEMALA');

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `type` */

insert  into `type`(`type`) values ('Administrador'),('Contador'),('Ventas');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`id`,`type`,`name`,`phone_number`,`email`,`state`) values (1,'Administrador','Marco','12345678','marco@gmial.com','activo'),(3,'Ventas','1','1','2','1');

/*Table structure for table `vuelos` */

DROP TABLE IF EXISTS `vuelos`;

CREATE TABLE `vuelos` (
  `Id` int(2) NOT NULL AUTO_INCREMENT,
  `IdOrigen` int(2) DEFAULT NULL,
  `IdDestino` int(2) DEFAULT NULL,
  `FechaViaje` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Pasajeros` int(1) DEFAULT NULL,
  `Precio` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_origen` (`IdOrigen`),
  KEY `fk_destino` (`IdDestino`),
  CONSTRAINT `fk_destino` FOREIGN KEY (`IdDestino`) REFERENCES `destinos` (`Id`),
  CONSTRAINT `fk_origen` FOREIGN KEY (`IdOrigen`) REFERENCES `origenes` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `vuelos` */

insert  into `vuelos`(`Id`,`IdOrigen`,`IdDestino`,`FechaViaje`,`Pasajeros`,`Precio`) values (1,1,2,'2023-09-29 23:52:28',2,200.00),(2,2,1,'2023-09-29 23:52:32',1,500.00),(4,2,3,'2023-09-29 23:52:34',3,100.00);

/* Procedure structure for procedure `compra` */

/*!50003 DROP PROCEDURE IF EXISTS  `compra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `compra`(IN idvuelo int,in iduser int)
BEGIN
    insert into compras(IdVuelos,Precio,Pasajeros,IdOrigen,IdDestino,IdUser)
    select Id,Precio,Pasajeros,IdOrigen,IdDestino,iduser from vuelos where Id=idvuelo;
    
    select
    c.*,
    CURDATE() AS Fecha,
    u.email as email
    from compras c 
    left join users u
    on u.id=c.IdUser
    where c.IdVuelos=idvuelo
    order by c.id desc
    limit 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getData` */

/*!50003 DROP PROCEDURE IF EXISTS  `getData` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getData`(IN strTabla VARCHAR(100), IN params VARCHAR(100))
BEGIN
    SET @sql = CONCAT('SELECT * FROM ', strTabla, ' WHERE ', params);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getDataVuelos` */

/*!50003 DROP PROCEDURE IF EXISTS  `getDataVuelos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getDataVuelos`(IN params VARCHAR (100))
BEGIN
  DECLARE sqlStatement VARCHAR (500) ;SET sqlStatement = CONCAT('SELECT
  `v`.`Id`         AS `Id`,
  `o`.`Id`         AS `IdOrigen`,
  `o`.`Nombre`     AS `Origen`,
  `d`.`Id`         AS `IdDestino`,
  `d`.`Nombre`     AS `Destino`,
  `v`.`FechaViaje` AS `Fecha`,
  `v`.`Pasajeros`  AS `Pasajeros`,
  `v`.`Precio`     AS `Precio`
FROM `vuelos` `v`
    INNER JOIN `origenes` `o`
      ON `v`.`IdOrigen` = `o`.`Id`
   INNER JOIN `destinos` `d`
     ON `d`.`Id` = `v`.`IdDestino` WHERE ', params);
    PREPARE stmt FROM sqlStatement;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END */$$
DELIMITER ;

/*Table structure for table `vw_vuelos` */

DROP TABLE IF EXISTS `vw_vuelos`;

/*!50001 DROP VIEW IF EXISTS `vw_vuelos` */;
/*!50001 DROP TABLE IF EXISTS `vw_vuelos` */;

/*!50001 CREATE TABLE  `vw_vuelos`(
 `Id` int(2) ,
 `IdOrigen` int(2) ,
 `Origen` varchar(50) ,
 `IdDestino` int(2) ,
 `Destino` varchar(50) ,
 `Fecha` timestamp ,
 `Pasajeros` int(1) ,
 `Precio` float(6,2) 
)*/;

/*View structure for view vw_vuelos */

/*!50001 DROP TABLE IF EXISTS `vw_vuelos` */;
/*!50001 DROP VIEW IF EXISTS `vw_vuelos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vuelos` AS (select `v`.`Id` AS `Id`,`o`.`Id` AS `IdOrigen`,`o`.`Nombre` AS `Origen`,`d`.`Id` AS `IdDestino`,`d`.`Nombre` AS `Destino`,`v`.`FechaViaje` AS `Fecha`,`v`.`Pasajeros` AS `Pasajeros`,`v`.`Precio` AS `Precio` from ((`vuelos` `v` left join `origenes` `o` on(`v`.`IdOrigen` = `o`.`Id`)) left join `destinos` `d` on(`d`.`Id` = `v`.`IdDestino`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
