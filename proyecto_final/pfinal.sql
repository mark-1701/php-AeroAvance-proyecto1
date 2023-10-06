-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2023 a las 08:24:36
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pfinal`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `compra` (IN `idvuelo` INT, IN `iduser` INT)   BEGIN
    insert into compras(IdVuelos,Precio,Pasajeros,IdOrigen,IdDestino,IdUser)
    select Id,Precio,Pasajeros,IdOrigen,IdDestino,iduser from vuelos where Id=idvuelo;
    
    select
    c.*,
    CURDATE() AS Fecha,
    u.*
    from compras c 
    left join users u
    on u.id=c.IdUser
    where c.IdVuelos=idvuelo
    order by c.id desc
    limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getData` (IN `strTabla` VARCHAR(100), IN `params` VARCHAR(100))   BEGIN
    SET @sql = CONCAT('SELECT * FROM ', strTabla, ' WHERE ', params);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDataVuelos` (IN `params` VARCHAR(100))   BEGIN
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
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `Id` int(2) NOT NULL,
  `IdVuelos` int(2) DEFAULT NULL,
  `Precio` float(6,2) DEFAULT NULL,
  `Pasajeros` int(2) DEFAULT NULL,
  `IdOrigen` int(2) DEFAULT NULL,
  `IdDestino` int(2) DEFAULT NULL,
  `IdUser` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`Id`, `IdVuelos`, `Precio`, `Pasajeros`, `IdOrigen`, `IdDestino`, `IdUser`) VALUES
(14, 1, 200.00, 2, 1, 2, 6),
(15, 1, 200.00, 2, 1, 2, 6),
(16, 1, 200.00, 2, 1, 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `Id` int(2) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`Id`, `Nombre`) VALUES
(1, 'CIUDAD GUATEMALA'),
(2, 'PETEN, GUATEMALA'),
(3, 'BELICE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origenes`
--

CREATE TABLE `origenes` (
  `Id` int(2) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `origenes`
--

INSERT INTO `origenes` (`Id`, `Nombre`) VALUES
(1, 'CIUDAD GUATEMALA'),
(2, 'PETEN, GUATEMALA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type`
--

CREATE TABLE `type` (
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `type`
--

INSERT INTO `type` (`type`) VALUES
('administrador'),
('cliente'),
('contador'),
('ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `email`, `password`, `state`) VALUES
(6, 'cliente', 'marco', 'marco@gmail.com', '1', 'activo'),
(7, 'cliente', 'umg', 'umg_turismo', '2', 'activo'),
(8, 'cliente', 'luz', 'luz@gmail.com', 'real', 'activo'),
(9, 'administrador', 'ilse', 'ilse@gmail.com', 'zapato', 'activo'),
(12, 'administrador', 'messi', 'messi@', '3', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

CREATE TABLE `vuelos` (
  `Id` int(2) NOT NULL,
  `IdOrigen` int(2) DEFAULT NULL,
  `IdDestino` int(2) DEFAULT NULL,
  `FechaViaje` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Pasajeros` int(1) DEFAULT NULL,
  `Precio` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelos`
--

INSERT INTO `vuelos` (`Id`, `IdOrigen`, `IdDestino`, `FechaViaje`, `Pasajeros`, `Precio`) VALUES
(1, 1, 2, '2023-09-30 05:52:28', 2, 200.00),
(2, 2, 1, '2023-09-30 05:52:32', 1, 500.00),
(4, 2, 3, '2023-09-30 05:52:34', 3, 100.00);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_vuelos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_vuelos` (
`Id` int(2)
,`IdOrigen` int(2)
,`Origen` varchar(50)
,`IdDestino` int(2)
,`Destino` varchar(50)
,`Fecha` timestamp
,`Pasajeros` int(1)
,`Precio` float(6,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_vuelos`
--
DROP TABLE IF EXISTS `vw_vuelos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vuelos`  AS   (select `v`.`Id` AS `Id`,`o`.`Id` AS `IdOrigen`,`o`.`Nombre` AS `Origen`,`d`.`Id` AS `IdDestino`,`d`.`Nombre` AS `Destino`,`v`.`FechaViaje` AS `Fecha`,`v`.`Pasajeros` AS `Pasajeros`,`v`.`Precio` AS `Precio` from ((`vuelos` `v` left join `origenes` `o` on(`v`.`IdOrigen` = `o`.`Id`)) left join `destinos` `d` on(`d`.`Id` = `v`.`IdDestino`)))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_vuelo` (`IdVuelos`),
  ADD KEY `fk_orige` (`IdOrigen`),
  ADD KEY `fk_dest` (`IdDestino`),
  ADD KEY `fk_user` (`IdUser`);

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `origenes`
--
ALTER TABLE `origenes`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_origen` (`IdOrigen`),
  ADD KEY `fk_destino` (`IdDestino`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `origenes`
--
ALTER TABLE `origenes`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_dest` FOREIGN KEY (`IdDestino`) REFERENCES `destinos` (`Id`),
  ADD CONSTRAINT `fk_orige` FOREIGN KEY (`IdOrigen`) REFERENCES `origenes` (`Id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`IdUser`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_vuelo` FOREIGN KEY (`IdVuelos`) REFERENCES `vuelos` (`Id`);

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `fk_destino` FOREIGN KEY (`IdDestino`) REFERENCES `destinos` (`Id`),
  ADD CONSTRAINT `fk_origen` FOREIGN KEY (`IdOrigen`) REFERENCES `origenes` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
