-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2023 a las 15:59:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmobiliaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id` int(10) NOT NULL,
  `fecDesde` datetime NOT NULL,
  `fecHasta` datetime NOT NULL,
  `idInquilino` int(10) NOT NULL,
  `idInmueble` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id`, `fecDesde`, `fecHasta`, `idInquilino`, `idInmueble`) VALUES
(1, '2022-01-01 00:00:00', '2022-12-31 00:00:00', 1, 59),
(2, '2023-02-15 00:00:00', '2023-08-15 00:00:00', 2, 59),
(3, '2023-01-01 00:00:00', '2023-12-31 00:00:00', 3, 59),
(12, '2023-05-01 00:00:00', '2023-11-01 00:00:00', 1, 60),
(13, '2023-06-01 00:00:00', '2023-12-01 00:00:00', 2, 61);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `id` int(10) NOT NULL,
  `tipo` int(1) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `uso` int(1) NOT NULL,
  `cantHamb` int(10) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `precio` double(7,2) NOT NULL,
  `estado` int(1) NOT NULL,
  `idPropietario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`id`, `tipo`, `direccion`, `uso`, `cantHamb`, `latitud`, `longitud`, `precio`, `estado`, `idPropietario`) VALUES
(59, 2, 'B Cantisani mna 35 Casa 6', 2, 6, '654654', '415415', 25000.00, 1, 2),
(60, 1, 'Avenida Libertador 123', 1, 3, '123456', '654321', 15000.00, 1, 3),
(61, 2, 'Calle San Martín 456', 2, 4, '987654', '456789', 20000.00, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilino`
--

CREATE TABLE `inquilino` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `mail` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inquilino`
--

INSERT INTO `inquilino` (`id`, `dni`, `apellido`, `nombre`, `telefono`, `mail`) VALUES
(1, '37638853', 'Auriol', 'Romina aaaa', '45646564', 'auriol.romina@gmail.com'),
(2, '36456456', 'Lopez', 'Melisa', '236512312', 'melisalopez@gmail.com'),
(3, '23456789', 'Rodrigo', 'Diego', '2664989898', 'diego.rodrigo@gmail.com'),
(4, '45678912', 'Gómez', 'Lucía', '12345678', 'lucia.gomez@gmail.com'),
(5, '12345678', 'Pérez', 'Juan', '87654321', 'juan.perez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id` int(10) NOT NULL,
  `monto` double(7,2) NOT NULL,
  `fecha` date NOT NULL,
  `idContrato` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id`, `monto`, `fecha`, `idContrato`) VALUES
(1, 5000.00, '2022-01-15', 1),
(2, 5000.00, '2022-02-15', 1),
(3, 5000.00, '2022-03-15', 1),
(4, 5000.00, '2022-04-15', 1),
(5, 5000.00, '2022-05-15', 1),
(6, 5000.00, '2022-06-15', 1),
(7, 5000.00, '2022-07-15', 1),
(8, 5000.00, '2022-08-15', 1),
(9, 5000.00, '2022-09-15', 1),
(10, 5000.00, '2023-05-10', 12),
(11, 6000.00, '2023-06-10', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  `direccion` varchar(130) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`id`, `dni`, `apellido`, `nombre`, `telefono`, `mail`, `Clave`, `direccion`) VALUES
(2, '37638853', 'Auriol Lopez ', 'Romina Iris', '45646564', 'auriol.romina@gmail.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', ''),
(3, '56456123', 'Garay', 'Laura', '266785126', 'Garay.Laura@gmail.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'B 126Viv. Mna 23 casa5'),
(5, '36046005', 'Godoy samuel', 'Andres', '2665252525', 'godoy.andres@gmail.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Italia 69'),
(6, '98765432', 'Torres', 'María', '45678901', 'maria.torres@gmail.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Calle Principal 789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `clave` varchar(300) NOT NULL,
  `rol` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `avatar`, `mail`, `clave`, `rol`) VALUES
(21, 'Iris Romina', 'Auriol ', NULL, 'auriol.romina@gmail.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 1),
(22, 'Iris Romina', 'Auriol ', NULL, 'auriol.romina@gmail.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idInmueble` (`idInmueble`),
  ADD KEY `idInquilino_2` (`idInquilino`),
  ADD KEY `idInmueble_2` (`idInmueble`),
  ADD KEY `idInquilino_3` (`idInquilino`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPropietario` (`idPropietario`);

--
-- Indices de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idContrato` (`idContrato`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`idInquilino`) REFERENCES `inquilino` (`id`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`id`);

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_ibfk_1` FOREIGN KEY (`idPropietario`) REFERENCES `propietario` (`id`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
