-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2020 a las 14:32:11
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `simple-invoice2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `compra` (`id` INT, `cant` INT)  BEGIN
UPDATE stock
SET cantidad=cantidad+cant
WHERE id_producto=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `venta` (`id` INT, `cant` INT)  BEGIN
UPDATE stock
SET cantidad=cantidad-cant
WHERE id_producto=id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `cedula_cliente` varchar(50) NOT NULL,
  `telefono_cliente` char(30) NOT NULL,
  `email_cliente` varchar(64) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `status_cliente` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `cedula_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`) VALUES
(1, 'Andy', '402-1194688-2', '809-235-8525', 'andy@gmail.com', 'Calle A', 1, '2020-04-25 22:09:30'),
(2, 'Juan', '001-2585577-1', '809-899-2551', 'j@gmail.com', 'Calle B', 1, '2020-04-25 22:09:52'),
(3, 'pedro', '402-1194277-4', '829-315-7005', 'pm@hotmail.com', 'Calle C', 1, '2020-04-26 10:24:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `numero_compra` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `total_compra` varchar(30) NOT NULL,
  `estado_compra` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `numero_compra`, `fecha_compra`, `id_proveedor`, `id_vendedor`, `condiciones`, `total_compra`, `estado_compra`) VALUES
(1, 1, '2020-04-26 00:00:00', 1, 1, '1', '118', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle` int(11) NOT NULL,
  `numero_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id_detalle`, `numero_compra`, `id_producto`, `cantidad`, `precio_compra`) VALUES
(1, 1, 1, 1, 118);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `numero_factura`, `id_producto`, `cantidad`, `precio_venta`) VALUES
(1, 1, 1, 2, 100),
(3, 2, 1, 2, 100),
(4, 2, 1, 2, 100),
(5, 3, 1, 1, 100),
(7, 4, 3, 2, 110),
(8, 4, 3, 2, 110),
(9, 5, 1, 3, 100),
(10, 5, 1, 3, 100),
(11, 5, 1, 1, 100),
(12, 6, 2, 1, 50),
(13, 7, 1, 5, 100),
(14, 8, 1, 1, 100),
(15, 9, 1, 1, 100),
(16, 10, 3, 1, 110),
(17, 11, 1, 1, 100),
(18, 12, 1, 1, 100),
(19, 13, 2, 2, 50),
(20, 13, 1, 2, 100),
(21, 14, 1, 1, 100),
(22, 15, 1, 1, 100),
(23, 15, 2, 1, 50),
(24, 15, 2, 1, 50),
(25, 15, 2, 1, 50),
(26, 15, 2, 1, 50),
(27, 15, 2, 1, 50),
(28, 15, 2, 1, 50),
(29, 15, 2, 1, 50),
(30, 15, 3, 1, 110),
(31, 15, 3, 1, 110),
(32, 15, 3, 1, 110),
(33, 15, 2, 1, 50),
(34, 15, 3, 1, 110),
(35, 15, 1, 1, 100),
(36, 15, 1, 1, 100),
(37, 15, 2, 1, 50),
(38, 15, 3, 1, 110),
(39, 15, 3, 1, 110),
(40, 15, 3, 1, 110),
(41, 15, 1, 1, 100),
(42, 16, 1, 1, 100),
(43, 16, 2, 1, 50),
(44, 16, 3, 1, 110),
(45, 16, 2, 1, 50),
(46, 16, 3, 1, 110);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `total_venta` varchar(20) NOT NULL,
  `estado_factura` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `numero_factura`, `fecha_factura`, `id_cliente`, `id_vendedor`, `condiciones`, `total_venta`, `estado_factura`) VALUES
(1, 1, '2020-04-25 22:11:02', 1, 1, '1', '226', 1),
(2, 2, '2020-04-25 22:12:47', 2, 1, '1', '226', 1),
(3, 3, '2020-04-25 22:14:39', 1, 1, '1', '113', 1),
(4, 4, '2020-04-25 22:45:15', 2, 1, '1', '248.6', 1),
(5, 5, '2020-04-25 22:53:46', 1, 1, '1', '452', 1),
(6, 6, '2020-04-25 23:02:14', 2, 1, '1', '56.5', 1),
(7, 7, '2020-04-25 23:04:16', 1, 1, '1', '565', 1),
(8, 8, '2020-04-25 23:43:31', 1, 1, '1', '118', 1),
(9, 9, '2020-04-25 23:57:51', 0, 1, '1', '118', 1),
(10, 10, '2020-04-25 23:58:11', 0, 1, '1', '129.8', 1),
(11, 11, '2020-04-26 00:00:02', 0, 1, '1', '118', 1),
(12, 12, '2020-04-26 10:26:48', 3, 1, '1', '118', 1),
(13, 13, '2020-04-26 10:32:36', 1, 1, '1', '354', 1),
(14, 14, '2020-04-26 10:38:23', 3, 1, '1', '118', 1),
(15, 15, '2020-04-26 13:29:19', 3, 1, '1', '1911.6', 1),
(16, 16, '2020-04-26 13:31:20', 1, 1, '1', '495.6', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre_empresa` varchar(150) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `impuesto` int(2) NOT NULL,
  `logo_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre_empresa`, `direccion`, `ciudad`, `codigo_postal`, `estado`, `telefono`, `email`, `impuesto`, `logo_url`) VALUES
(1, 'SuperMarketRD', 'Calle Mexico. Los prados #105', 'Distrito Nacional', '11807', 'Santo Domingo', '809-247-9890', 'diomarcastillocolon@gmail.com', 18, 'img/1587871499_Login1.png');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `producto` (
`id_producto` int(11)
,`nombre_producto` char(255)
,`status_producto` tinyint(4)
,`date_added` datetime
,`precio_producto` double
,`cantidad` int(10)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `status_producto` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`) VALUES
(1, 'Azucar', 1, '2020-04-25 22:10:06', 100),
(2, 'Leche', 1, '2020-04-25 22:43:39', 50),
(3, 'Jugo', 1, '2020-04-25 22:44:26', 110);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL,
  `telefono_proveedor` char(30) NOT NULL,
  `email_proveedor` varchar(65) NOT NULL,
  `direccion_proveedor` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `telefono_proveedor`, `email_proveedor`, `direccion_proveedor`) VALUES
(1, 'jose carne', '809-247-9890', 'josecarne@gmail.com', 'Calle J');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `reporte`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `reporte` (
`factura` int(11)
,`fecha` datetime
,`total` varchar(20)
,`vendedor` varchar(41)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

CREATE TABLE `tmp` (
  `id_tmp` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`) VALUES
(0, 'Diomar', 'Castillo', 'admin1', '$2y$10$aOhDHTLHCgVuPC9Z.XsO2O30QS7/1RZSNxHOY6BRt7xJqGLo/1.pG', 'diomar@hotmail.com', '2020-04-25 22:48:29'),
(1, 'Obed', 'Alvarado', 'admin', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'admin@admin.com', '2016-05-21 15:06:00');

-- --------------------------------------------------------

--
-- Estructura para la vista `producto`
--
DROP TABLE IF EXISTS `producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `producto`  AS  select `p`.`id_producto` AS `id_producto`,`p`.`nombre_producto` AS `nombre_producto`,`p`.`status_producto` AS `status_producto`,`p`.`date_added` AS `date_added`,`p`.`precio_producto` AS `precio_producto`,`s`.`cantidad` AS `cantidad` from (`productos` `p` left join `stock` `s` on((`p`.`id_producto` = `s`.`id_producto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `reporte`
--
DROP TABLE IF EXISTS `reporte`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reporte`  AS  select `f`.`numero_factura` AS `factura`,`f`.`fecha_factura` AS `fecha`,`f`.`total_venta` AS `total`,concat(`u`.`firstname`,' ',`u`.`lastname`) AS `vendedor` from (`facturas` `f` left join `users` `u` on((`f`.`id_vendedor` = `u`.`user_id`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `codigo_producto` (`nombre_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD UNIQUE KEY `numero_cotizacion` (`numero_compra`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `numero_cotizacion` (`numero_compra`,`id_producto`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `numero_cotizacion` (`numero_factura`,`id_producto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `numero_cotizacion` (`numero_factura`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `codigo_producto` (`nombre_proveedor`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;