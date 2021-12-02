-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2021 at 04:03 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `actividades`
--

-- --------------------------------------------------------

--
-- Table structure for table `actividad`
--

CREATE TABLE `actividad` (
  `idTarea` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `actividad` varchar(30) DEFAULT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actividad`
--

INSERT INTO `actividad` (`idTarea`, `fecha`, `actividad`, `descripcion`, `estado`) VALUES
(1, '2021-11-03', 'Comprar ', 'comprar', 1),
(2, '2021-11-03', 'Accion', 'Acciones', 2);

-- --------------------------------------------------------

--
-- Table structure for table `logactividad`
--

CREATE TABLE `logactividad` (
  `idLogActividad` int(11) NOT NULL,
  `idUsuarioTarea` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `log` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `documento` varchar(15) DEFAULT NULL,
  `contraseña` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `apellido`, `telefono`, `documento`, `contraseña`) VALUES
(5, 'Edisson', 'Armando', '3186306150', '1053614871', 'abc123'),
(6, 'Jimmy', 'Euscategui', '545454', '727272', '7272');

-- --------------------------------------------------------

--
-- Table structure for table `usuarioactividad`
--

CREATE TABLE `usuarioactividad` (
  `idUsuarioTarea` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idActividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarioactividad`
--

INSERT INTO `usuarioactividad` (`idUsuarioTarea`, `idUsuario`, `idActividad`) VALUES
(1, 5, 1),
(2, 5, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`idTarea`);

--
-- Indexes for table `logactividad`
--
ALTER TABLE `logactividad`
  ADD PRIMARY KEY (`idLogActividad`),
  ADD KEY `idUsuarioTarea` (`idUsuarioTarea`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indexes for table `usuarioactividad`
--
ALTER TABLE `usuarioactividad`
  ADD PRIMARY KEY (`idUsuarioTarea`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idActividad` (`idActividad`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actividad`
--
ALTER TABLE `actividad`
  MODIFY `idTarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logactividad`
--
ALTER TABLE `logactividad`
  MODIFY `idLogActividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usuarioactividad`
--
ALTER TABLE `usuarioactividad`
  MODIFY `idUsuarioTarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logactividad`
--
ALTER TABLE `logactividad`
  ADD CONSTRAINT `logactividad_ibfk_1` FOREIGN KEY (`idUsuarioTarea`) REFERENCES `usuarioactividad` (`idUsuarioTarea`);

--
-- Constraints for table `usuarioactividad`
--
ALTER TABLE `usuarioactividad`
  ADD CONSTRAINT `usuarioactividad_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `usuarioactividad_ibfk_2` FOREIGN KEY (`idActividad`) REFERENCES `actividad` (`idTarea`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
