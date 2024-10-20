-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2024 a las 18:04:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pt4_marcos_lopez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cuerpo` text NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `cuerpo`, `fecha_creacion`, `fecha_modificacion`, `id_usuario`) VALUES
(9, 'Macarrones', 'Macarrones con queso', '2024-10-20 16:47:25', '2024-10-20 16:47:25', NULL),
(10, 'Queso Manchego', 'Queso Manchego de galicia', '2024-10-20 16:47:37', '2024-10-20 16:48:28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` enum('usuario','admin') DEFAULT 'usuario',
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `contraseña`, `rol`, `fecha_registro`) VALUES
(3, 'user', 'user@gmail.com', '$2y$10$WDKWcZbwjDV79IVeJz7XGuUHO8679qccRvb3N4.PhHJffAqoqfWui', 'usuario', '2024-10-18 18:50:57'),
(4, 'Marcos', 'marcos@gmail.com', '$2y$10$B/PG/O7TxPzo9Yrgb8vefuDQqzvtdIZUBInPAGSAmmmQa5Nvyhk7K', 'usuario', '2024-10-18 18:55:00'),
(7, 'user2', 'user2@gmail.com', '$2y$10$Vsc3a29MKMtW.O7POnizdOoTztzUSOEmYKWmOpYl2VwactJLoBgiK', 'usuario', '2024-10-18 20:17:45'),
(8, 'Marrkitus', 'marrkitus@gmail.com', '$2y$10$.R.32VL00JPdTM8l7NSv8O24vn.08g69oqBllPwn0CdtAV3utr9jC', 'usuario', '2024-10-19 23:42:11'),
(9, 'user', 'user3@gmail.com', '$2y$10$u0MG2esEnUtLQ8M222/Ay.CrJK.Y9ioTTAohYDBbms7rb0wyOBpdW', 'usuario', '2024-10-19 23:42:57'),
(12, 'Marcos', 'marcos1@gmail.com', '$2y$10$.CBC.rliOY4h7CqrhJxt8.0SHBk/xrBwNm6a0pRdiMD31vBDxqUoC', 'usuario', '2024-10-20 16:41:12'),
(13, 'Alexis', 'alex@gmail.com', '$2y$10$oTFTPWrDb.4QJKYRKqIqJO1LIY8rmbtY6G5AAAbYaoV..B8KlcIby', 'usuario', '2024-10-20 17:32:16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
