-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2020 at 03:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2
-- ---------------------------------------------------------------------------------
-- Consultas del proyecto
-- Select * from roles
-- Select * from users
-- ---------------------------------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lauulu`
--
CREATE DATABASE IF NOT EXISTS `lauulu` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lauulu`;

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `ID` int(11) NOT NULL,
  `NombreCurso` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`ID`, `NombreCurso`) VALUES
(1, 'Administrador'),
(2, 'Desarrollo de Aplicaciones Multiplataforma');

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `ID` int(11) NOT NULL,
  `NombreEmpresa` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Valoracion` varchar(45) DEFAULT NULL,
  `Localidad` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Disponibilidad` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telf` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `ID` int(11) NOT NULL,
  `NombreRol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`ID`, `NombreRol`) VALUES
(1, 'Administrador'),
(2, 'Director'),
(3, 'Profesor'),
(4, 'Alumno');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USR` varchar(45) NOT NULL,
  `PWD` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido1` varchar(45) DEFAULT NULL,
  `Apellido2` varchar(45) DEFAULT NULL,
  `DNI` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telf` varchar(45) DEFAULT NULL,
  `centroEstudios` varchar(45) DEFAULT NULL,
  `Roles_ID` int(11) NOT NULL,
  `Curso_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USR`, `PWD`, `Nombre`, `Apellido1`, `Apellido2`, `DNI`, `email`, `telf`, `centroEstudios`, `Roles_ID`, `Curso_ID`) VALUES
('Admin', 'Passw0rd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
('michirapper', 'Passw0rd', 'Miguel Angel', 'Garre', 'Acebes', 'XXXXX', 'magarreacebes@gmail.com', 'XXXXXXXXXXX', 'U-TAD', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_has_empresa`
--

CREATE TABLE `users_has_empresa` (
  `Users_Roles_ID` int(11) NOT NULL,
  `Users_USR` varchar(45) NOT NULL,
  `Empresa_ID` int(11) NOT NULL,
  `Notas` varchar(300) DEFAULT NULL,
  `Comentarios` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Roles_ID`,`USR`,`Curso_ID`),
  ADD KEY `fk_Users_Roles1_idx` (`Roles_ID`),
  ADD KEY `fk_Users_Curso1_idx` (`Curso_ID`);

--
-- Indexes for table `users_has_empresa`
--
ALTER TABLE `users_has_empresa`
  ADD PRIMARY KEY (`Users_Roles_ID`,`Users_USR`,`Empresa_ID`),
  ADD KEY `fk_Users_has_Empresa_Empresa1_idx` (`Empresa_ID`),
  ADD KEY `fk_Users_has_Empresa_Users1_idx` (`Users_Roles_ID`,`Users_USR`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_Users_Curso1` FOREIGN KEY (`Curso_ID`) REFERENCES `curso` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Users_Roles1` FOREIGN KEY (`Roles_ID`) REFERENCES `roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_has_empresa`
--
ALTER TABLE `users_has_empresa`
  ADD CONSTRAINT `fk_Users_has_Empresa_Empresa1` FOREIGN KEY (`Empresa_ID`) REFERENCES `empresa` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Users_has_Empresa_Users1` FOREIGN KEY (`Users_Roles_ID`,`Users_USR`) REFERENCES `users` (`Roles_ID`, `USR`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
