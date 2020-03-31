-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-03-2020 a las 17:20:04
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nominas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acumulado`
--

DROP TABLE IF EXISTS `acumulado`;
CREATE TABLE IF NOT EXISTS `acumulado` (
  `id_acumulado` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `acumulado_nomina` float DEFAULT NULL,
  `deducciones_nominas` float DEFAULT NULL,
  `acumulado_faltas` float DEFAULT NULL,
  `acumulado_isr` float DEFAULT NULL,
  `acumluado_imss` float DEFAULT NULL,
  `acumulacion_incapacidad` float DEFAULT NULL,
  PRIMARY KEY (`id_acumulado`),
  KEY `id_empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(70) DEFAULT NULL,
  `puesto` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

DROP TABLE IF EXISTS `contacto`;
CREATE TABLE IF NOT EXISTS `contacto` (
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `telefono_fijo` int(20) DEFAULT NULL,
  `telefono_movil` int(20) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(70) DEFAULT NULL,
  `delemuni` varchar(20) DEFAULT NULL,
  `cp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_direccion` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_contacto` int(11) DEFAULT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `curp` varchar(20) DEFAULT NULL,
  `rfc` varchar(20) DEFAULT NULL,
  `estado_civil` varchar(15) DEFAULT NULL,
  `imss` varchar(30) DEFAULT NULL,
  `regimen` varchar(20) DEFAULT NULL,
  `tipo_nomina` varchar(20) DEFAULT NULL,
  `sueldo_quincenal` float DEFAULT NULL,
  `periodo` date DEFAULT NULL,
  `estatus` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_direccion` (`id_direccion`),
  KEY `id_area` (`id_area`),
  KEY `id_contacto` (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`usuario`, `contrasena`, `tipo`) VALUES
('AlfredoR', '123456', 'administrador'),
('AlexisB', '123456', 'administrador'),
('AlejandroJ', '123456', 'profesor'),
('GabrielS', '123456', 'administrador'),
('OscarM', '123456', 'profesor'),
('raul', '123456', 'administrador'),
('RicardoS', '123456', 'administrador'),
('LimasI', '123456', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominas`
--

DROP TABLE IF EXISTS `nominas`;
CREATE TABLE IF NOT EXISTS `nominas` (
  `id_nomina` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `faltas` float DEFAULT NULL,
  `horas_extras` float DEFAULT NULL,
  `dias_festivos` float DEFAULT NULL,
  `dias_trabajados` float DEFAULT NULL,
  `dias_incapacitados` float DEFAULT NULL,
  `pago_total` float DEFAULT NULL,
  `isr` float DEFAULT NULL,
  `imss` float DEFAULT NULL,
  PRIMARY KEY (`id_nomina`),
  KEY `id_empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acumulado`
--
ALTER TABLE `acumulado`
  ADD CONSTRAINT `acumulado_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`id_contacto`) REFERENCES `contacto` (`id_contacto`);

--
-- Filtros para la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD CONSTRAINT `nominas_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
