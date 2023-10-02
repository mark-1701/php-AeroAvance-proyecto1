-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2023 a las 12:10:50
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
('Administrador'),
('Contador'),
('Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `phone_number`, `email`, `state`) VALUES
(1, 'Administrador', 'Marco', '12345678', 'marco@gmial.com', 'activo'),
(3, 'Ventas', '1', '1', '2', '1');

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
(4, 2, 3, '2023-09-30 05:52:34', 3, 100.00),
(5, 1, 2, '2023-09-30 06:14:14', 30, 1.00);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_type_id` (`type`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_type_id` FOREIGN KEY (`type`) REFERENCES `type` (`type`);

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
