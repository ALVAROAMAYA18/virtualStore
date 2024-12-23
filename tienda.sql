-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2024 a las 21:00:11
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `cantidad`, `id_producto`, `id_cliente`) VALUES
(1, 5, 3, 5),
(2, 4, 2, 5),
(3, 4, 2, 9),
(4, 5, 7, 9),
(5, 5, 3, 9),
(6, 5, 4, 9),
(7, 4, 1, 9),
(8, 5, 111, 9),
(9, 5, 6, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'BORRADORES Y CORRECTORES', 'assets/images/categorias/1.jpg', 1),
(2, 'CARPETAS Y FOLDERS', 'assets/images/categorias/2.jpg', 1),
(3, 'CARTUCHERAS', 'assets/images/categorias/3.jpg', 1),
(4, 'COLORES Y CRAYONES', 'assets/images/categorias/4.jpg\r\n', 1),
(5, 'CUADERNOS', 'assets/images/categorias/5.jpg', 1),
(6, 'DETALLES', 'assets/images/categorias/6.jpg', 1),
(7, 'FORMATOS', 'assets/images/categorias/7.jpg', 1),
(8, 'JUGUETERIA', 'assets/images/categorias/8.jpg\r\n', 1),
(9, 'LAPICEROS', 'assets/images/categorias/9.jpg\r\n', 1),
(10, 'LAPICES', 'assets/images/categorias/10.jpg', 1),
(11, 'LIBROS', 'assets/images/categorias/11.jpg', 1),
(12, 'MANUALIDADES', 'assets/images/categorias/12.jpg\r\n', 1),
(13, 'MARCADORES', 'assets/images/categorias/13.jpg', 1),
(14, 'MICROPUNTAS', 'assets/images/categorias/14.jpg', 1),
(15, 'OFICINA', 'assets/images/categorias/15.jpg', 1),
(16, 'PAPELES Y LÁMINAS', 'assets/images/categorias/16.jpg', 1),
(17, 'PEGANTES', 'assets/images/categorias/17.jpg', 1),
(18, 'PINTURAS Y ARTE', 'assets/images/categorias/18.jpg', 1),
(19, 'PIÑATERÍA', 'assets/images/categorias/19.jpg', 1),
(20, 'PLASTILINAS', 'assets/images/categorias/20.jpg', 1),
(21, 'PLUMONES', 'assets/images/categorias/21.jpg', 1),
(22, 'PORTAMINAS', 'assets/images/categorias/22.jpg', 1),
(23, 'REGLAS Y ESCUADRAS', 'assets/images/categorias/23.jpg', 1),
(24, 'ZACAPUNTAS', 'assets/images/categorias/24.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(9, 'Alvaro Javier Amaya', 'ajac910918@gmail.com', '$2y$10$H.rUYb7TWesvSmi5K6HwnuakOx98e6Tp8UD/xRIKiPG8sYC/6es5i', 'default.png', NULL, 1),
(11, 'Paola Andrea Diaz Duarte', 'paolaandreadiazduarte@gmail.com', '$2y$10$GivB5JkW4QFj3bVvL0lHPeMAZ1Bg1ymMi28MdxgtLe1piZE0A3WdS', 'default.png', NULL, 1),
(12, 'Aquiles', 'aquilesclavelmaduro987@gmail.com', '$2y$10$LYzlBkT3VUmAWXWAjO2u0.8DBs/sPT5bmEYYhsJvLCBUh7pgCWkB.', 'default.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(1, 'PARLANTE HILON', 100.00, 15, 1, 1),
(2, 'CAMARA WEB', 200.00, 15, 1, 2),
(3, 'TELEVISOR LG', 1500.00, 15, 1, 3),
(4, 'MICROFONO', 80.00, 15, 1, 4),
(5, 'Cuaderno de 100 hj', 3300.00, 15, 1, 7),
(6, 'CAMARA WEB', 200.00, 20, 2, 2),
(7, 'TELEVISOR LG', 1500.00, 24, 2, 3),
(8, 'cuderno de 50 hojas', 2600.00, 24, 2, 6),
(9, 'CAMARA WEB', 200.00, 1, 3, 2),
(10, 'TELEVISOR LG', 1500.00, 1, 3, 3),
(11, 'MICROFONO', 80.00, 1, 3, 4),
(12, 'PARLANTE HILON', 100.00, 12, 4, 1),
(13, 'LAPTOP LENOVO', 3500.00, 12, 4, 5),
(14, 'Cuaderno de 100 hj', 3300.00, 12, 4, 7),
(15, 'Caja Borrador Nata Grafitos x 24und', 5800.00, 3, 5, 2),
(16, 'Caja Borrador Nata Grafitos x 12und', 5500.00, 1, 5, 1),
(17, 'Caja de borrador Miga de Pan Negro x30 und Grafitos REF: 4B', 11500.00, 1, 6, 6),
(18, 'Caja de borrador Miga de Pan Piel x30 und Grafitos REF: 4B', 11500.00, 1, 6, 7),
(19, 'Caja borrador donas x6 und Grafitos REF: Kawaii', 5500.00, 1, 6, 4),
(20, 'Carpeta bisel tamaño oficio colores surtidos x12 und', 12000.00, 1, 6, 14),
(21, 'Carpeta sobre hilo tamaño oficio x12 und', 22000.00, 1, 6, 20),
(22, 'Carpeta cartón corriente tamaño oficio x12 und', 9600.00, 1, 6, 22),
(23, 'Bolsillo catalogo transparente tamaño carta x100 und', 9000.00, 1, 6, 31),
(24, 'AZ tamaño carta Norma x6 und', 34000.00, 1, 6, 28),
(25, 'Cartuchera 3 cierres lona x6 und', 30000.00, 1, 6, 34),
(26, 'Caja Borrador Nata Grafitos x 24und REF: SU-724', 5800.00, 1, 7, 2),
(27, 'Lápiz Bic Hb #2 x6 cajas', 46800.00, 5, 8, 111),
(28, 'Caja Borrador Nata Grafitos x 12und REF: SU-712', 5500.00, 50, 9, 1),
(29, 'Caja borrador Tinta/Lápiz x 24und PaperMate REF: E-250', 32000.00, 1, 10, 3),
(30, 'Caja borrador donas x6 und Grafitos REF: Kawaii', 5500.00, 1, 10, 4),
(31, 'Caja de corrector líquido x 12 und Grafitos REF: SU-1806', 11500.00, 1, 10, 8),
(32, 'Carpeta sobre cartón Pappyer Torreon oficio x12 und surtido', 26800.00, 1, 10, 23),
(33, 'AZ tamaño carta Norma x6 und', 34000.00, 1, 10, 28),
(34, 'Cartuchera 3 cierres lona x6 und', 30000.00, 1, 10, 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha` date NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1',
  `telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `monto`, `fecha`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`, `telefono`) VALUES
(1, 77700.00, '2024-10-03', 'ingrid hurtado', 'antonioi', 'Finca loma linda vereda Palonegro', 'giron', 9, '3', '2147483647'),
(2, 102400.00, '2024-10-04', 'Alvaro', 'Amaya', 'Calle 47 # 29b - 210 bellavista', 'giron', 9, '2', '2147483647'),
(3, 1780.00, '2024-10-04', 'ciro', 'corozo', 'calle 47 #25 - 25', 'florida', 9, '1', '1234566'),
(4, 82800.00, '2024-10-05', 'paola', 'diaz', 'Finca loma linda vereda Palonegro', 'giron', 9, '1', '3003197912'),
(5, 22900.00, '2024-10-06', 'Alvaro ', 'Amaya', 'Finca loma linda vereda Palonegro', 'giron', 9, '1', '3003197912'),
(6, 145100.00, '2024-10-06', 'paola', 'diaz', 'Finca loma linda vereda Palonegro', 'giron', 9, '1', '3003197912'),
(7, 5800.00, '2024-10-09', 'Paola ', 'Duarte', 'Finca loma linda vereda Palonegro', 'lebrija', 9, '3', '3003197912'),
(8, 234000.00, '2024-10-10', 'paola', 'Duarte', 'Finca loma linda vereda Palonegro', 'giron', 9, '1', '3003197912'),
(9, 275000.00, '2024-10-12', 'Prueba borrador', 'prueba', 'prueba', 'prueba', 9, '3', '123456'),
(10, 139800.00, '2024-10-16', 'Parangaricutirimicuaro', 'jojo', 'Finca loma linda vereda Palonegro', 'giron', 9, '1', '3003197912');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'Caja Borrador Nata Grafitos x 12und REF: SU-712', '<p>Caja de borrador de nata x 12 unidades, (borrador grande)</p>', 5500.00, 300, 'assets/images/productos/20241005233633.jpg', 1, 1),
(2, 'Caja Borrador Nata Grafitos x 24und REF: SU-724', '<p>Caja de borrador de nata x24 unidades (borrador pequeño)</p>', 5800.00, 300, 'assets/images/productos/20241005235729.jpg', 1, 1),
(3, 'Caja borrador Tinta/Lápiz x 24und PaperMate REF: E-250', '<p>Caja borrador Tinta/Lápiz x 24 unidades PaperMate REF: E-250</p>', 32000.00, 300, 'assets/images/productos/20241006182946.jpg', 1, 1),
(4, 'Caja borrador donas x6 und Grafitos REF: Kawaii', '<p>Caja de borradores en forma de donas x 6 unidades</p>', 5500.00, 300, 'assets/images/productos/20241006184138.jpg', 1, 1),
(5, 'Caja borrador Retractil x12 und Unicol REF: Kawaii-10', '<p>Caja borrador Retractil x12 unidades colores surtidos</p>', 32000.00, 300, 'assets/images/productos/20241006184514.jpg', 1, 1),
(6, 'Caja de borrador Miga de Pan Negro x30 und Grafitos REF: 4B', '<p>Caja de borrador Miga de Pan Negro x30 unidades Grafitos</p>', 11500.00, 300, 'assets/images/productos/20241006185015.jpg', 1, 1),
(7, 'Caja de borrador Miga de Pan Piel x30 und Grafitos REF: 4B', '<p>Caja de borrador Miga de Pan Color Piel x30 unidades Grafitos</p>', 11500.00, 300, 'assets/images/productos/20241006185415.jpg', 1, 1),
(8, 'Caja de corrector líquido x 12 und Grafitos REF: SU-1806', '<p>Caja de corrector líquido (tipo lápiz) x 12 unidades Grafitos REF: SU-1806</p>', 11500.00, 300, 'assets/images/productos/20241006205520.jpg', 1, 1),
(9, 'Caja corrector líquido x12 und PaperMate REF: liquid-paper', '<p>Caja corrector líquido tipo lápiz x12 unidades PaperMate</p>', 36000.00, 300, 'assets/images/productos/20241006211626.jpg', 1, 1),
(10, 'Caja corrector líquido x12 und Faber Castell REF: 9ml', '<p>Caja corrector líquido tipo lápiz x12 unidades Faber Castell&nbsp;</p>', 27000.00, 300, 'assets/images/productos/20241006212028.jpg', 1, 1),
(11, 'Corrector de cinta x12 und Tesa REF: cct-10m', '<p>12 unidades de Corrector de cinta marca Tesa</p>', 27500.00, 300, 'assets/images/productos/20241006212335.jpg', 1, 1),
(12, 'Corrector de cinta x12 und Faber Castell REF: vince-1761', '<p>12 unidades de Corrector de cinta marca Faber Castell</p>', 29000.00, 300, 'assets/images/productos/20241006212556.jpg', 1, 1),
(13, 'Carpeta bisel tamaño carta colores surtidos x12 und', '<p>Carpeta bisel tamaño carta colores surtidos x12 unidades</p>', 9600.00, 300, 'assets/images/productos/20241006213025.jpg', 1, 2),
(14, 'Carpeta bisel tamaño oficio colores surtidos x12 und', '<p>Carpeta bisel tamaño oficio colores surtidos x12 unidades</p>', 12000.00, 300, 'assets/images/productos/20241006213108.jpg', 1, 2),
(15, 'Carpeta plástica legajadora tamaño carta x12 und colores surtidos', '<p>Carpeta plástica legajadora tamaño carta x12 und colores surtidos</p>', 24000.00, 300, 'assets/images/productos/20241006213402.jpg', 1, 2),
(16, 'Carpeta plástica legajadora tamaño oficio x12 und colores surtidos', '<p>Carpeta plástica legajadora tamaño oficio x12 und colores surtidos</p>', 30000.00, 300, 'assets/images/productos/20241006213618.jpg', 1, 2),
(17, 'Carpeta sobre plástica grafitos oficio x 12 und colores surtidos', '<p>Carpeta sobre plástica grafitos tamaño oficio x 12 unidades colores surtidos</p>', 41000.00, 300, 'assets/images/productos/20241006214002.jpg', 1, 2),
(18, 'Carpeta plástica colgante tamaño oficio x12 und colores surtidos', '<p>carpeta plástica colgante tamaño oficio x12 unidades colores surtidos</p>', 34000.00, 300, 'assets/images/productos/20241006214236.jpg', 1, 2),
(19, 'Carpeta sobre hilo tamaño carta x12 und', '<p>Carpeta sobre hilo tamaño carta x12 unidades</p>', 18000.00, 300, 'assets/images/productos/20241006214758.jpg', 1, 2),
(20, 'Carpeta sobre hilo tamaño oficio x12 und', '<p>Carpeta sobre hilo tamaño oficio x12 unidades</p>', 22000.00, 300, 'assets/images/productos/20241006214847.jpg', 1, 2),
(21, 'Carpeta cartón corriente tamaño carta x12 und', '<p>Carpeta cartón corriente tamaño carta x12 unidades</p>', 6000.00, 300, 'assets/images/productos/20241006215127.jpg', 1, 2),
(22, 'Carpeta cartón corriente tamaño oficio x12 und', '<p>Carpeta cartón corriente tamaño oficio x12 unidades</p>', 9600.00, 300, 'assets/images/productos/20241006215255.jpg', 1, 2),
(23, 'Carpeta sobre cartón Pappyer Torreon oficio x12 und surtido', '<p>Carpeta sobre cartón Pappyer Torreon oficio x12 unidades motivos surtidos</p>', 26800.00, 300, 'assets/images/productos/20241006215639.jpg', 1, 2),
(24, 'Carpeta colgante café de cartón oficio x12 und', '<p>Carpeta colgante café de cartón tamaño oficio x12 unidades</p>', 14000.00, 300, 'assets/images/productos/20241006215952.jpg', 1, 2),
(25, 'Carpeta colgante azul de cartón oficio x12 und', '<p>Carpeta colgante color azul de cartón oficio x12 unidades</p>', 14000.00, 300, 'assets/images/productos/20241006220043.jpg', 1, 2),
(26, 'Portafolio carpeta acordeon offi-Esco oficio x6 und', '<p>Portafolio carpeta acordeon offi-Esco tamaño oficio x6 und colores surtidos (cada una contiene 17 compartimientos internos)</p>', 66000.00, 300, 'assets/images/productos/20241006220504.jpg', 1, 2),
(27, 'Folder Blanco tamaño carta 1\" x6 und', '<p>Folder Blanco tamaño carta 1\" x6 und</p>', 38000.00, 300, 'assets/images/productos/20241006220727.jpg', 1, 2),
(28, 'AZ tamaño carta Norma x6 und', '<p>AZ tamaño carta Norma x6 unidades</p>', 34000.00, 300, 'assets/images/productos/20241006221007.jpg', 1, 2),
(29, 'AZ tamaño oficio Norma x6 und', '<p>AZ tamaño oficio Norma x6 unidades</p>', 39000.00, 300, 'assets/images/productos/20241006221155.jpg', 1, 2),
(30, 'Folder Blanco tamaño oficio 1\" x6 und', '<p>Folder Blanco tamaño oficio 1\" x6 und</p>', 44000.00, 300, 'assets/images/productos/20241006221402.jpg', 1, 2),
(31, 'Bolsillo catalogo transparente tamaño carta x100 und', '<p>Bolsillo catalogo transparente tamaño carta x100 unidades</p>', 9000.00, 300, 'assets/images/productos/20241006222106.jpg', 1, 2),
(32, 'Bolsillo catalogo transparente tamaño oficio x100 und', '<p>Bolsillo catalogo transparente tamaño oficio x100 unidades</p>', 10000.00, 300, 'assets/images/productos/20241006222208.jpg', 1, 2),
(33, 'Cartuchera 1 cierre lona x12 und', '<p>Cartuchera 1 cierre lona x12 unidades motivos surtidos</p>', 26000.00, 300, 'assets/images/productos/20241006222415.jpg', 1, 3),
(34, 'Cartuchera 3 cierres lona x6 und', '<p>Cartuchera 3 cierres lona x6 unidades motivos surtidos</p>', 30000.00, 300, 'assets/images/productos/20241006222711.jpg', 1, 3),
(35, 'Cartuchera 2 cierres Motivos pastel Grafitos x6 und', '<p>Cartuchera 2 cierres Motivos pastel Grafitos x6 unidades surtidos</p>', 42000.00, 300, 'assets/images/productos/20241006222948.jpg', 1, 3),
(36, 'Cartuchera silicona 1 cierre x6 und', '<p>Cartuchera silicona 1 cierre x6 unidades colores surtidos</p>', 18000.00, 300, 'assets/images/productos/20241006223347.jpg', 1, 3),
(37, 'Cartuchera 2 cierres estampadas x6 und', '<p>Cartuchera 2 cierres estampadas x6 unidades motivos surtidos</p>', 28000.00, 300, 'assets/images/productos/20241007161122.jpg', 1, 3),
(38, 'Colores Cortos 12colores Berol x12 cajas', '<p>Colores Cortos 12colores Berol x12 cajas</p>', 19000.00, 300, 'assets/images/productos/20241007174557.jpg', 1, 4),
(39, 'Colores Largos 12colores Berol x12 cajas', '<p>Colores Largos 12colores Berol x12 cajas</p>', 48000.00, 300, 'assets/images/productos/20241007174755.jpg', 1, 4),
(40, 'Colores Largos doble punta 12/24 Berol x6 cajas', '<p>Colores Largos doble punta 12/24 Berol x6 cajas</p>', 36000.00, 300, 'assets/images/productos/20241007175543.jpg', 1, 4),
(41, 'Colores pasteles x12 colores Kores Triangulares x6 cajas', '<p>Colores pasteles x12 colores marca Kores forma Triangulares x6 cajas</p>', 39000.00, 300, 'assets/images/productos/20241007175826.jpg', 1, 4),
(42, 'Colores pasteles x24 colores Kores Triangulares x6 cajas', '<p>Colores pasteles x24 colores Kores forma Triangulares x6 cajas</p>', 66000.00, 300, 'assets/images/productos/20241007180547.jpg', 1, 4),
(43, 'Colores triangulares x12 unipunta Kores x6 cajas', '<p>Colores forma triangulares x12 una sola punta Kores x6 cajas</p>', 44000.00, 300, 'assets/images/productos/20241007220259.jpg', 1, 4),
(44, 'Colores triangulares 12/24 doblepunta Kores x6 cajas', '<p>Colores forma triangulares 12/24 doblepunta Kores x6 cajas</p>', 68000.00, 3000, 'assets/images/productos/20241007220435.jpg', 1, 4),
(45, 'Colores Jumbo x12 Kores triangulares x6 cajas', '<p>Colores Jumbo x12 Kores forma triangulares x6 cajas</p>', 74000.00, 300, 'assets/images/productos/20241007222915.jpg', 1, 4),
(46, 'Colores unipunta x12 Norma x6 cajas', '<p>Colores unipunta x12 Norma x6 cajas</p>', 48000.00, 300, 'assets/images/productos/20241007224213.jpg', 1, 4),
(47, 'Colores unipunta 13+2 Norma x6 cajas', '<p>Colores unipunta 13+2 Norma x6 cajas incluye 2 colores metalizados</p>', 66000.00, 300, 'assets/images/productos/20241007224450.jpg', 1, 4),
(48, 'Colores doblepunta 13/26 Norma x6 cajas', '<p>Colores doblepunta 13/26 Norma x6 cajas</p>', 78000.00, 300, 'assets/images/productos/20241007224700.jpg', 1, 4),
(49, 'Colores x15 Norma premium x6 cajas', '<p>Colores x15 Norma premium de la mas alta calidad x6 cajas</p>', 72000.00, 300, 'assets/images/productos/20241007225005.jpg', 1, 4),
(50, 'Colores Jumbo x12 Scribe triangulares x6 cajas', '<p>Colores Jumbo x12 Scribe forma triangulares colores vibrantes x6 cajas</p>', 67000.00, 300, 'assets/images/productos/20241007225329.jpg', 1, 4),
(51, 'Colores doblepunta 13+2 Scribe x6 cajas', '<p>Colores doblepunta 13+2 Scribe incluye 2 metalizados x6 cajas</p>', 48000.00, 300, 'assets/images/productos/20241007230203.jpg', 1, 4),
(52, 'Colores unipunta x24 Scribe x6 cajas', '<p>Colores unipunta x24 marca Scribe x6 cajas</p>', 90000.00, 300, 'assets/images/productos/20241007230429.jpg', 1, 4),
(53, 'Crayones Jumbo x12 Kores x6 cajas', '<p>Crayones Jumbo x12 Kores x6 cajas</p>', 51000.00, 300, 'assets/images/productos/20241007230826.jpg', 1, 4),
(54, 'Crayones Jumbo x10 Parchesitos x6 cajas', '<p>Crayones Jumbo x10 Parchesitos x6 cajas</p>', 32000.00, 300, 'assets/images/productos/20241007231307.jpg', 1, 4),
(55, 'Caja de cuadernos Qnota de 50 hojas surtidos x 100 unidades', '<p>Caja de cuadernos Qnota de 50 hojas surtidos x 100 unidades (se entregan surtidos entre rayados, cuadriculados y doblelínea, de igual manera los motivos son surtidos entre niño y niña)</p>', 150000.00, 300, 'assets/images/productos/20241007231945.jpg', 1, 5),
(56, 'Caja de cuadernos Qnota de 100 hojas surtidos x 100 unidades', '<p>Caja de cuadernos Qnota de 100 hojas surtidos x 100 unidades (se entregan surtidos entre rayados, cuadriculados y doblelínea, de igual manera los motivos son surtidos entre niño y niña)</p>', 250000.00, 300, 'assets/images/productos/20241007232434.jpg', 1, 5),
(57, 'Caja de cuadernos Norma gama media de 50 hojas surtidos x 100 unidades', '<p>Caja de cuadernos Norma gama media de 50 hojas surtidos x 100 unidades (se entregan surtidos entre rayados, cuadriculados y doblelínea, de igual manera los motivos son surtidos entre niño y niña)</p>', 190000.00, 300, 'assets/images/productos/20241007233229.jpg', 1, 5),
(58, 'Caja de cuadernos Norma gama media de 100 hojas surtidos x 100 unidades', '<p>Caja de cuadernos Norma Gama media de 100 hojas surtidos x 100 unidades (se entregan surtidos entre rayados, cuadriculados y doblelínea, de igual manera los motivos son surtidos entre niño y niña)</p>', 290000.00, 300, 'assets/images/productos/20241007233420.jpg', 1, 5),
(59, 'Caja de cuadernos Norma gama Alta Stickers de 50 hojas surtidos x 100 unidades', '<p>Caja de cuadernos Norma Gama Alta con stickers de 50 hojas surtidos x 100 unidades (se entregan surtidos entre rayados, cuadriculados y doblelínea, de igual manera los motivos son surtidos entre niño y niña)</p>', 450000.00, 300, 'assets/images/productos/20241007234305.jpg', 1, 5),
(60, 'Caja de cuadernos Norma gama Alta Stickers de 100 hojas surtidos x 100 unidades', '<p>Caja de cuadernos Norma Gama Alta con stickers de 100 hojas surtidos x 100 unidades (se entregan surtidos entre rayados, cuadriculados y doblelínea, de igual manera los motivos son surtidos entre niño y niña)</p>', 650000.00, 300, 'assets/images/productos/20241007234728.jpg', 1, 5),
(61, 'Caja de cuadernos Anillados Norma 100 hojas x 100 unidades surtidos', '<p>Caja de cuadernos Norma Anillados de 100 hojas surtidos x 100 unidades (se entregan surtidos entre rayados y cuadriculados. de igual manera los motivos son surtidos entre niño y niña)</p>', 390000.00, 300, 'assets/images/productos/20241008000054.jpg', 1, 5),
(62, 'Caja de cuadernos Anillados Grandes Norma 85 hojas x 100 unidades surtidos', '<p>Caja de cuadernos Grandes Norma Anillados de 85 hojas surtidos x 100 unidades (se entregan surtidos entre rayados y cuadriculados. de igual manera los motivos son surtidos entre niño y niña)</p>', 450000.00, 300, 'assets/images/productos/20241008000211.jpg', 1, 5),
(63, 'Cuaderno libreta pequeña minimotivos 70 hojas surtidos x24 unidades', '<p>Cuaderno libreta pequeña minimotivos 70 hojas surtidos entre rayados y cuadriculados y niño y niña x24 unidades</p>', 38400.00, 300, 'assets/images/productos/20241008000616.jpg', 1, 5),
(64, 'Cuaderno 7 materias Lukis surtidos x12 und', '<p>Cuaderno 7 materias Lukis surtidos entre mujer y hombre x12 und</p>', 216000.00, 300, 'assets/images/productos/20241008001456.jpg', 1, 5),
(67, 'Cuaderno 7 materias Grande Lukis surtidos x12 und', '<p>Cuaderno 7 materias Grande Lukis surtidos entre hombre mujer x12 und</p>', 300000.00, 300, 'assets/images/productos/20241008001607.jpg', 1, 5),
(68, 'Cuaderno 5 materias Lukis surtidos x12 und', '<p>Cuaderno 5 materias &nbsp;Lukis surtidos entre hombre y mujer x12 und</p>', 160000.00, 300, 'assets/images/productos/20241008001820.jpg', 1, 5),
(69, 'Moño listo grande x10 colores surtidos x12 paquetes', '<p>Moño listo grande fácil de armar x10 colores surtidos x12 paquetes</p>', 15000.00, 300, 'assets/images/productos/20241008165338.jpg', 1, 6),
(70, 'Arreglo mediano peluche  y dulces x6 und', '<p>Arreglo mediano incluye peluche mediano, dulces, globo y base x6 und</p>', 72000.00, 300, 'assets/images/productos/20241008170944.jpg', 1, 6),
(71, 'Arreglo mugs + dulces motivos surtidos x6und', '<p>Arreglo mugs + dulces motivos surtidos x6und</p>', 68000.00, 300, 'assets/images/productos/20241008171353.jpg', 1, 6),
(72, 'Llavero peluche pequeño surtido paquete x12 und', '<p>Llavero peluche pequeño surtido paquete x12 unidades (color blanco, rosado y café)</p>', 33000.00, 300, 'assets/images/productos/20241008175954.jpg', 1, 6),
(73, 'Peluche oso mediano surtidos 20cm paquete x6 und', '<p>Peluche oso mediano surtidos (blanco, rosado y café) 20cm de alto paquete x6 unidades&nbsp;</p>', 54000.00, 300, 'assets/images/productos/20241008180749.jpg', 1, 6),
(74, 'Mugs estampados motivos surtidos caja x12 und', '<p>Mugs estampados motivos surtidos caja x12 unidades</p>', 62000.00, 300, 'assets/images/productos/20241008181201.jpg', 1, 6),
(75, 'Facturero mini Papel periódico Grafitos x12 und', '<p>Facturero mini Papel periódico Grafitos x12 unidades</p>', 4800.00, 300, 'assets/images/productos/20241008182515.jpg', 1, 7),
(76, 'Facturero Mediano Papel periódico Grafitos x12 und REF: SU-056', '<p>Facturero Mediano Papel periódico Grafitos x12 unidades REF: SU-056</p>', 8400.00, 300, 'assets/images/productos/20241008182642.jpg', 1, 7),
(77, 'Facturero Grande Papel periódico Grafitos x12 und REF: SU-057', '<p>Facturero Grande Papel periódico Grafitos x12 unidades REF: SU-057</p>', 16000.00, 300, 'assets/images/productos/20241008182745.jpg', 1, 7),
(78, 'Facturero pequeño Papel Químico Grafitos x12 und REF: SU-053', '<p>Facturero pequeño Papel Químico Grafitos x12 unidades REF: SU-053</p>', 24000.00, 300, 'assets/images/productos/20241008183236.jpg', 1, 7),
(79, 'Facturero Grande Papel Químico Grafitos x12 und', '<p>Facturero Grande Papel Químico Grafitos x12 unidades</p>', 55000.00, 300, 'assets/images/productos/20241008183406.jpg', 1, 7),
(80, 'Formato Hoja de vida 10-00 Minerva x6 paquetes', '<p>Formato Hoja de vida 10-00 Minerva x6 paquetes</p>', 52000.00, 300, 'assets/images/productos/20241008183915.jpg', 1, 7),
(81, 'Formato Hoja de vida 10-03 Minerva x6 paquetes', '<p>Formato Hoja de vida 10-03 Minerva x6 paquetes</p>', 73000.00, 300, 'assets/images/productos/20241008184018.jpg', 1, 7),
(82, 'Formato contrato de obra Civil minerva x6 paquetes', '<p>Formato contrato de obra Civil minerva x6 paquetes</p>', 108000.00, 300, 'assets/images/productos/20241008184239.jpg', 1, 7),
(83, 'Formato contrato individual a término indefinido minerva x6 paquetes', '<p>Formato contrato de obra Civil minerva x6 paquetes</p>', 84000.00, 300, 'assets/images/productos/20241008184413.jpg', 1, 7),
(84, 'Formato contrato individual inferior a un año minerva x6 paquetes', '<p>Formato contrato individual inferior a un año minerva x6 paquetes</p>', 120000.00, 300, 'assets/images/productos/20241008184537.jpg', 1, 7),
(85, 'Formato Arrendamiento vivienda urbana Minerva x3 paquetes', '<p>Formato Arrendamiento vivienda urbana Minerva x6 paquetes</p>', 60000.00, 300, 'assets/images/productos/20241008184826.jpg', 1, 7),
(86, 'Formato contrato de compraventa de vehículo automotor Minerva x3 paquetes', '<p>Formato contrato de compraventa de vehículo automotor Minerva x3 paquetes</p>', 60000.00, 300, 'assets/images/productos/20241008222525.jpg', 1, 7),
(87, 'Recibo de caja menor x100 Grafitos x12 paquetes', '<p>Recibo de caja menor x100 Grafitos x12 paquetes</p>', 18000.00, 300, 'assets/images/productos/20241008222818.jpg', 1, 7),
(88, 'Letra de cambio x50 Grafitos x12 paquetes', '<p>Letra de cambio x50 Grafitos x12 paquetes</p>', 18000.00, 300, 'assets/images/productos/20241008222958.jpg', 1, 7),
(89, 'Talonario de rifa papel periodico 100 puestos x12 talonarios', '<p>Talonario de rifa papel periodico 100 puestos x12 talonarios</p>', 12000.00, 300, 'assets/images/productos/20241008223236.jpg', 1, 7),
(90, 'Cartón de rifa 100 puestos grande x3 paquetes', '<p>Cartón de rifa 100 puestos colores surtidos tamaño grande x3 paquetes</p>', 27000.00, 300, 'assets/images/productos/20241008223434.jpg', 1, 7),
(91, 'Formato Recibo grande x12 paquetes', '<p>Formato Recibo grande x12 paquetes</p>', 18000.00, 300, 'assets/images/productos/20241008232403.jpg', 1, 7),
(92, 'Naipe español x12 unidades', '<p>Naipe español x12 unidades</p>', 18000.00, 300, 'assets/images/productos/20241008232643.jpg', 1, 8),
(93, 'Poker Royal Plastificado x6 und', '<p>Poker Royal Plastificado x6 und</p>', 30000.00, 300, 'assets/images/productos/20241008232952.jpg', 1, 8),
(94, 'Juego de cartas UNO x6 und', '<p>Juego de cartas UNO x6 und</p>', 30000.00, 300, 'assets/images/productos/20241008234713.jpg', 1, 8),
(95, 'Parques 4 puestos cartón x12 und', '<p>Parques 4 puestos cartón x12 und</p>', 30000.00, 300, 'assets/images/productos/20241008234851.jpg', 1, 8),
(96, 'Juego Dominó pequeño x6 und', '<p>Juego Dominó pequeño x6 und</p>', 48000.00, 300, 'assets/images/productos/20241008235055.jpg', 1, 8),
(97, 'Juego ajedrez pequeño x6 und', '<p>Juego ajedrez pequeño x6 und</p>', 34000.00, 300, 'assets/images/productos/20241008235340.jpg', 1, 8),
(98, 'Set x15 carros pequeños plásticos x6 cajas', '<p>Set x15 carros pequeños plásticos x6 cajas</p>', 42000.00, 300, 'assets/images/productos/20241008235717.jpg', 1, 8),
(99, 'Muñeca Ambibi Genérica x6 und', '<p>Muñeca Ambibi Genérica x6 und</p>', 24000.00, 300, 'assets/images/productos/20241008235949.jpg', 1, 8),
(100, 'Lapicero Kilometrico de tapa surtido x12 cajas', '<p>Lapicero Kilometrico de tapa surtido entre negro, azul, rojo, morado y fucsia x12 cajas, punta 1.0mm</p>', 115200.00, 300, 'assets/images/productos/20241009162309.jpg', 1, 9),
(101, 'Lapicero Kilometrico Retráctil surtido x12 cajas', '<p>Lapicero Kilometrico Retráctil surtido entre negro, azul, rojo, morado y fucsia x12 cajas, punta 1.0mm</p>', 144000.00, 300, 'assets/images/productos/20241009163609.jpg', 1, 9),
(102, 'Lapicero Bic cristal de tapa Surtido x12 cajas', '<p>Lapicero Bic cristal de tapa Surtido entre Negro, azul y rojo x12 cajas punta 1.0mm</p>', 115200.00, 300, 'assets/images/productos/20241009163956.jpg', 1, 9),
(103, 'Lapicero Bic ecológico retráctil Negro x6 cajas', '<p>Lapicero Bic ecológico retráctil Negro x6 cajas pinta 1.0mm</p>', 64800.00, 300, 'assets/images/productos/20241009165943.jpg', 1, 9),
(104, 'Lapicero Bic Fashion de tapa surtidos x6 cajas', '<p>Lapicero Bic Fashion de tapa surtidos x6 cajas (cada caja trae 12 colores diferentes)</p>', 72000.00, 300, 'assets/images/productos/20241009170422.jpg', 1, 9),
(105, 'Lapicero Offi-Esco Semigel Punta 0.7mm Tapa surtido  x12 cajas', '<p>Lapicero Offi-Esco Semigel Punta 0.7mm Tapa x12 cajas surtidas entre negro, rojo y azul.</p>', 115200.00, 300, 'assets/images/productos/20241009171906.jpg', 1, 9),
(106, 'Lapicero Offi-Esco Semigel Punta 0.7mm Retráctil surtido  x12 cajas', '<p>Lapicero Offi-Esco Semigel Punta 0.7mm Retráctil &nbsp;x12 cajas surtidas entre Negro, rojo y azul.</p>', 144000.00, 300, 'assets/images/productos/20241009172210.jpg', 1, 9),
(107, 'Lapicero Borrable Kilometrico de tapa Negro x3 cajas', '<p>Lapicero Borrable Kilometrico de tapa Negro x3 cajas</p>', 105000.00, 300, 'assets/images/productos/20241009172506.jpg', 1, 9),
(108, 'Lapicero Kilometrico Maxi gel mina 0.7mm de tapa surtido x6 cajas', '<p>Lapicero Kilometrico Maxi gel mina 0.7mm de tapa surtido en 5 colores x6 cajas</p>', 64800.00, 300, 'assets/images/productos/20241009173828.jpg', 1, 9),
(109, 'Lápiz Grafitos Hb #2 x6 cajas', '<p>Lápiz Grafitos Hb #2 forma hexagonal x6 cajas</p>', 43200.00, 300, 'assets/images/productos/20241009174556.jpg', 1, 10),
(110, 'Lápiz PaperMate Hb #2 x6 cajas', '<p>Lápiz PaperMate Hb #2 x6 cajas</p>', 50400.00, 300, 'assets/images/productos/20241009174752.jpg', 1, 10),
(111, 'Lápiz Bic Hb #2 x6 cajas', '<p>Lápiz Bic Hb #2 x6 cajas</p>', 46800.00, 300, 'assets/images/productos/20241009174958.jpg', 1, 10),
(112, 'Lápiz Norma Hb #2 x6 cajas', '<p>Lápiz Norma Hb #2 x6 cajas</p>', 57600.00, 300, 'assets/images/productos/20241009175134.jpg', 1, 10),
(113, 'Lápiz Mongol Hb #2 x6 cajas', '<p>Lápiz Mongol Hb #2 x6 cajas</p>', 57600.00, 300, 'assets/images/productos/20241009175308.jpg', 1, 10),
(114, 'Lápiz Kores Hb #2 x6 cajas', '<p>Lápiz Kores Hb #2 x6 cajas</p>', 46800.00, 300, 'assets/images/productos/20241009175427.jpg', 1, 10),
(115, 'Lápiz Kores Rojo x6 cajas', '<p>Lápiz Kores Rojo x6 cajas</p>', 57600.00, 300, 'assets/images/productos/20241009175537.jpg', 1, 10),
(116, 'Lápiz Grafitos Rojo x6 cajas', '<p>Lápiz Grafitos Rojo x6 cajas</p>', 50400.00, 300, 'assets/images/productos/20241009175642.jpg', 1, 10),
(117, 'Lápiz carboncillo AH Royal x6 cajas', '<p>Lápiz carboncillo AH Royal x6 cajas</p>', 86400.00, 300, 'assets/images/productos/20241009175902.jpg', 1, 10),
(118, 'Lápiz Jumbo Negro Triangular PeperMate x3 cajas', '<p>Lápiz Jumbo PeperMate x3 cajas</p>', 54000.00, 300, 'assets/images/productos/20241009181042.jpg', 1, 10),
(119, 'Lápiz Jumbo Negro Triangular Kores x3 cajas', '<p>Lápiz Jumbo Negro Triangular Kores x3 cajas</p>', 54000.00, 300, 'assets/images/productos/20241009181427.jpg', 1, 10),
(120, 'Lápiz Jumbo Rojo Triangular Offi-Esco x3 cajas', '<p>Lápiz Jumbo Rojo Triangular Offi-Esco x3 cajas</p>', 54000.00, 300, 'assets/images/productos/20241009183159.jpg', 1, 10),
(121, 'Atlas Universal Actualizado x6 ', '<p>Atlas Universal versión Actualizado x6&nbsp;</p>', 30000.00, 300, 'assets/images/productos/20241009183415.jpg', 1, 11),
(122, 'Atlas Colombia Actualizado x6 ', '<p>Atlas Colombia versión Actualizado x6&nbsp;</p>', 30000.00, 300, 'assets/images/productos/20241009183513.jpg', 1, 11),
(123, 'Libro contabilidad Fabri 200 folios x3 und', '<p><i><strong>Libro contabilidad Fabri 200 folios x3 und</strong></i></p>', 57000.00, 300, 'assets/images/productos/20241009183709.jpg', 1, 11),
(124, 'Libro 3 columnas 100 folios x3', '<p>Libro 3 columnas 100 folios x3</p>', 36000.00, 300, 'assets/images/productos/20241009183855.jpg', 1, 11),
(125, 'Libro de Actas 100 folios x3 und', '<p>Libro de Actas 100 folios x3 und</p>', 36000.00, 300, 'assets/images/productos/20241009184027.jpg', 1, 11),
(126, 'Block Origami tamaño 20x20cm Surtidos x12 und', '<p>Block Origami tamaño 20x20cm Surtidos x12 und</p>', 48000.00, 300, 'assets/images/productos/20241009184219.jpg', 1, 12),
(127, 'Block Iris Grafitos tamaño carta x12 und', '<p>Block Iris tamaño carta x12 und</p>', 48000.00, 300, 'assets/images/productos/20241009184348.jpg', 1, 12),
(128, 'Block VIP tamaño carta x12 und surtidos', '<p>Block VIP tamaño carta x12 und 70 hojas surtidos entre rayado, cuadriculado y blanco.</p>', 48000.00, 300, 'assets/images/productos/20241009184701.jpg', 1, 12),
(129, 'Block VIP tamaño oficio x12 und surtidos', '<p>Block VIP tamaño oficio x12 und surtidos entre cuadriculados, rayados y blancos.</p>', 54000.00, 300, 'assets/images/productos/20241009184801.jpg', 1, 12),
(130, 'Paquete Bolas de Icopor surtidas de #1 hasta #25 x6 paquetes', '<p>Paquete Bolas de Icopor surtidas de #1 hasta #25 x6 paquetes</p>', 126000.00, 108000, 'assets/images/productos/20241009185243.jpg', 1, 12),
(131, 'Láminas de icopor de 50x50cm de 2cm de grosor x3 paquetes', '<p>Láminas de icopor de 50x50cm de 2cm de grosor x3 paquetes (cada paquete contiene 10 láminas).</p>', 75000.00, 300, 'assets/images/productos/20241009185653.jpg', 1, 12),
(132, 'Libro para colorear x12 und', '<p>Libro para colorear motivos surtidos x12 und</p>', 24000.00, 300, 'assets/images/productos/20241009215505.jpg', 1, 11),
(133, 'Libro nacho inicial de lectura x6 und', '<p>Libro nacho inicial de lectura x6 und</p>', 42000.00, 300, 'assets/images/productos/20241009215605.jpg', 1, 11),
(134, 'Paquete Palos de balso surtidos x6', '<p>Paquete Palos de balso surtidos (#6, #8, #10, #12, #15, #20) x6 paquetes</p>', 66600.00, 300, 'assets/images/productos/20241009222029.jpg', 1, 12),
(135, 'Paquete palos de paleta pequeños x100 und x6 paq', '<p>Paquete palos de paleta pequeños x100 und x6 paquetes</p>', 24000.00, 300, 'assets/images/productos/20241009222313.jpg', 1, 12),
(136, 'Paquete palos de paleta colores surtidos x6 paq', '<p>Paquete palos de paleta colores surtidos x6 paquetes</p>', 21000.00, 300, 'assets/images/productos/20241009222431.jpg', 1, 12),
(137, 'Paquete palo de pincho 30cm x6 paq', '<p>Paquete palo de pincho 30cm (100und) x6 paquetes</p>', 30000.00, 300, 'assets/images/productos/20241009222645.jpg', 1, 12),
(138, 'Marcador sharpie Tank surtidos x6 cajas', '<p>Marcador sharpie Tank colores surtidos entre negro, verde, rojo y azul x6 cajas</p>', 136800.00, 300, 'assets/images/productos/20241009223316.jpg', 1, 13),
(139, 'Marcador sharpie fine surtidos x6 cajas', '<p>Marcador sharpie fine colores surtidos entre negro,azul, verde y rojo x6 cajas</p>', 252000.00, 300, 'assets/images/productos/20241009223812.jpg', 1, 13),
(140, 'Set marcadores sharpie fine x8 colores x6 sets', '<p>Set marcadores sharpie fine x8 colores x6 sets</p>', 185000.00, 300, 'assets/images/productos/20241009224003.jpg', 1, 13),
(141, 'Mis primeros marcadores lavables Norma doblepunta 8/16 x3 cajas', '<p>Mis primeros marcadores lavables Norma doblepunta 8/16 x3 cajas</p>', 60000.00, 300, 'assets/images/productos/20241009224603.jpg', 1, 13),
(142, 'Marcador de vinilo metalizado grafitos 8und x6 paq', '<p>Marcador de vinilo metalizado grafitos 8und x 6 paquetes</p>', 72000.00, 3000, 'assets/images/productos/20241009225032.jpg', 1, 13),
(143, 'Marcador de Vinilo Pelikan x3 cajas', '<p>Marcador de Vinilo Pelikan x10 colores x3 cajas</p>', 84000.00, 300, 'assets/images/productos/20241009230803.jpg', 1, 13),
(144, 'Marcador Expografo Borrable surtido x6 cajas', '<p>Marcador Expografo Borrable &nbsp;surtido en color negro, azul, rojo, verde x6 cajas</p>', 194400.00, 300, 'assets/images/productos/20241009231507.jpg', 1, 13),
(145, 'Micropunta Pelikan surtido x 6 cajas', '<p>Micropunta Pelikan surtido entre negro, rojo, azul y verde x 6 cajas</p>', 86400.00, 300, 'assets/images/productos/20241009231707.jpg', 1, 14),
(146, 'Set de 8 micropuntas Pelikan colores surtidos x6 paq', '<p>Set de 8 micropuntas colores surtidos x6 paquetes</p>', 57600.00, 300, 'assets/images/productos/20241009232118.jpg', 1, 14),
(147, 'Micropunta Faber-Castell surtido x 3 cajas', '<p>Micropunta Faber-Castell surtido entre negro, rojo y azul x 6 cajas</p>', 72000.00, 300, 'assets/images/productos/20241009232414.jpg', 1, 14),
(148, 'Set de 10 micropuntas Faber-Castell colores surtidos x3 paq', '<p>Set de 10 micropuntas Faber-Castell colores surtidos x3 paquetes</p>', 60000.00, 300, 'assets/images/productos/20241009232548.jpg', 1, 14),
(149, 'Grapadora Mediana Triton REF: 2615 X3', '<p>Grapadora Mediana Triton REF: 2615 X3</p>', 39000.00, 300, 'assets/images/productos/20241009232736.jpg', 1, 15),
(150, 'Grapadora Mini Offi-Esco x6 und', '<p>Grapadora Mini Offi-Esco x6 und colores surtidos</p>', 23400.00, 300, 'assets/images/productos/20241009232917.jpg', 1, 15),
(151, 'Grapadora Pinza Ofismart metalica x3 und REF: SM-060', '<p>Grapadora Pinza Ofismart metalica x3 und REF: SM-060</p>', 60000.00, 300, 'assets/images/productos/20241009233450.jpg', 1, 15),
(152, 'Caja de gancho Grapadora Triton Galvanizado x6 cajas', '<p>Caja de gancho Grapadora Triton Galvanizado x6 cajas</p>', 30000.00, 300, 'assets/images/productos/20241009233658.jpg', 1, 15),
(153, 'Perforadora metálica Grafitos 1 Hueco x3 und ', '<p>Perforadora metálica Grafitos 1 Hueco x3 und&nbsp;</p>', 12000.00, 300, 'assets/images/productos/20241009233910.jpg', 1, 15),
(154, 'Perforadora pequeña Grafitos 2 Huecos x3 und ', '<p>Perforadora pequeña Grafitos 2 Huecos x3 und&nbsp;</p>', 18000.00, 300, 'assets/images/productos/20241009234402.jpg', 1, 15),
(155, 'Tabla planillera plástica Grafitos Oficio x6 und', '<p>Tabla planillera Grafitos Oficio x6 und colores surtidos</p>', 30000.00, 300, 'assets/images/productos/20241009234716.jpg', 1, 15),
(156, 'Organizador metálico 4 puestos x3 und', '<p>Organizador metálico 4 puestos x3 und</p>', 21000.00, 300, 'assets/images/productos/20241009234825.jpg', 1, 15),
(157, 'Porta lapiceros metálicos surtidos x6 und', '<p>Porta lapiceros metálicos colores surtidos x6 unidades</p>', 21000.00, 300, 'assets/images/productos/20241009235004.jpg', 1, 15),
(158, 'Resma Reprograf tamaño carta x6 und', '<p>Resma Reprograf tamaño carta x6 unidades</p>', 84000.00, 300, 'assets/images/productos/20241009235507.jpg', 1, 15),
(159, 'Resma Reprograf tamaño oficio x6 unidades', '<p>Resma Reprograf tamaño oficio x6 unidades</p>', 105000.00, 300, 'assets/images/productos/20241009235559.jpg', 1, 15),
(160, 'Pliegos de papel seda surtidos x100 und', '<p>Pliegos de papel seda colores surtidos x100 unidades</p>', 20000.00, 300, 'assets/images/productos/20241010000028.jpg', 1, 16),
(161, 'Pliegos de papel silueta surtidos x100 und', '<p>Pliegos de papel silueta colores surtidos x100 unidades</p>', 50000.00, 300, 'assets/images/productos/20241010000242.jpg', 1, 16),
(162, 'Pliegos de papel celofan surtidos x100 und', '<p>Pliegos de papel celofan colores surtidos x100 unidades</p>', 80000.00, 300, 'assets/images/productos/20241010000519.jpg', 1, 16),
(163, 'Pliegos de papel crepé surtidos x100 und', '<p>Pliegos de papel crepé colores surtidos x100 unidades</p>', 75000.00, 300, 'assets/images/productos/20241010000930.jpg', 1, 16),
(164, 'Pliego de papel bond x100 und', '<p>Pliego de papel bond x100 unidades</p>', 60000.00, 300, 'assets/images/productos/20241010001058.jpg', 1, 16),
(165, 'Pliego de papel Kraft x100 und', '<p>Pliego de papel Kraft x100 unidades</p>', 65000.00, 300, 'assets/images/productos/20241010001303.jpg', 1, 16),
(166, 'Pliego de cartulina Bristol surtidos x50 und', '<p>Pliego de cartulina Bristol surtidos x50 unidades</p>', 70000.00, 300, 'assets/images/productos/20241010002140.jpg', 1, 16),
(167, 'Medio pliego de cartulina escolar surtido x50 und', '<p>Medio pliego de cartulina escolar colores surtidos x50 unidades</p>', 52000.00, 300, 'assets/images/productos/20241010002402.jpg', 1, 16),
(168, 'Octavos de cartulina Grafitos surtidos x24 paq', '<p>Octavos de cartulina colores surtido (colores vivos, pasteles y fluorescentes) x24 paquetes</p>', 57600.00, 300, 'assets/images/productos/20241010002830.jpg', 1, 16),
(169, 'Cartón paja 1/8 x50 láminas', '<p>Cartón paja 1/8 x50 láminas</p>', 30000.00, 300, 'assets/images/productos/20241010003708.jpg', 1, 16),
(170, 'Lámina pliego cartón paja x12 und', '<p>Lámina pliego cartón paja x12 unidades</p>', 48000.00, 300, 'assets/images/productos/20241010003915.jpg', 1, 16),
(171, 'Pliegos de papel regalo surtidos corriente x50 und', '<p>Pliegos de papel regalo motivos surtidos corriente x50 unidades</p>', 30000.00, 300, 'assets/images/productos/20241010004422.jpg', 1, 16),
(172, 'Láminas de Foami 1/8 surtidos x12 paquetes', '<p>Láminas de Foami 1/8 colores surtidos x12 paquetes</p>', 72000.00, 300, 'assets/images/productos/20241010004754.jpg', 1, 16),
(173, 'Láminas de Foami Escarchado 1/8 surtidos x12 paquetes', '<p>Láminas de Foami Escarchado 1/8 colores surtidos x12 paquetes</p>', 120000.00, 300, 'assets/images/productos/20241010004900.jpg', 1, 16),
(174, 'Lámina Foami 4cartas surtidos x50 und', '<p>Lámina Foami 4cartas colores surtidos x50 unidades</p>', 100000.00, 300, 'assets/images/productos/20241010005111.jpg', 1, 16),
(175, 'Lámina Foami 4cartas Escarchado surtidos x50 und', '<p>Lámina Foami 4cartas Escarchado colores surtidos x50 unidades</p>', 150000.00, 300, 'assets/images/productos/20241010005223.jpg', 1, 16),
(176, 'Pegante líquido Sipega x4 cajas tamaños surtidos', '<p>Pegante líquido Sipega x4 cajas tamaños surtidos (20gr, 40gr, 125gr, 250gr)</p>', 61000.00, 300, 'assets/images/productos/20241010172545.jpg', 1, 17),
(177, 'Pegante en barra Sipega x3 cajas tamaños surtidos', '<p>Pegante en barra Sipega x3 cajas tamaños surtidos (15gr, 25gr, 40gr)</p>', 84000.00, 300, 'assets/images/productos/20241010172748.jpg', 1, 17),
(178, 'Silicona líquida fría AH Royal x2 cajas surtidas', '<p>Silicona líquida fría AH Royal x2 cajas surtidas en 2 presentaciones (20gr y 40gr)</p>', 54000.00, 300, 'assets/images/productos/20241010173318.jpg', 1, 17),
(179, 'Silicona en barra delgada 1kg x3 paq', '<p>Silicona en barra delgada 1kg x3 paquetes</p>', 81000.00, 300, 'assets/images/productos/20241010173812.jpg', 1, 17),
(180, 'Silicona en barra gruesa 1kg x3 paq', '<p>Silicona en barra gruesa 1kg x3 paquetes</p>', 86000.00, 300, 'assets/images/productos/20241010173915.jpg', 1, 17),
(181, 'Pegante en barra Offi-Esco x3 cajas tamaños surtidos', '<p>Pegante en barra Offi-Esco x3 cajas tamaños surtidos (10gr, 21gr, 35gr)</p>', 84000.00, 300, 'assets/images/productos/20241010174303.jpg', 1, 17),
(182, 'Pegante para foami 60cc x6 und', '<p>Pegante para foami 60cc x6 unidades</p>', 30000.00, 300, 'assets/images/productos/20241010174540.jpg', 1, 17),
(183, 'Cinta Básica doble faz 2m Grafitos x6 und', '<p>Cinta Básica doble faz 2m Grafitos x6 unidades</p>', 12000.00, 300, 'assets/images/productos/20241010175253.jpg', 1, 17),
(184, 'Cinta ancha transparente 20m Grafitos x12 und', '<p>Cinta ancha transparente 20m Grafitos x12 unidades</p>', 18000.00, 300, 'assets/images/productos/20241010175454.jpg', 1, 17),
(185, 'Cinta ancha transparente 300m Grafitos x6 und', '<p>Cinta ancha transparente 300m Grafitos x6 unidades</p>', 90000.00, 300, 'assets/images/productos/20241010175554.jpg', 1, 17),
(186, 'Vinilo parchesito pequeño 33gr surtidos x60 und', '<p>Vinilo parchesito pequeño 33gr colores surtidos x60 unidades</p>', 48000.00, 300, 'assets/images/productos/20241010181749.jpg', 1, 18),
(187, 'Vinilo parchesito  125gr surtidos x30 und', '<p>Vinilo parchesito &nbsp;125gr colores surtidos x30 unidades</p>', 84000.00, 300, 'assets/images/productos/20241010181915.jpg', 1, 18),
(188, 'Vinilo Acrílico Payasito pequeño 33gr surtidos x60 und', '<p>Vinilo Acrílico Payasito pequeño 33gr colores surtidos x60 unidades</p>', 52000.00, 300, 'assets/images/productos/20241010182256.jpg', 1, 18),
(189, 'Vinilo Acrílico Payasito 125gr surtidos x30 und', '<p>Vinilo Acrílico Payasito 125gr colores surtidos x30 unidades</p>', 87000.00, 300, 'assets/images/productos/20241010182454.jpg', 1, 18),
(190, 'Caja de temperas parchesitos 6 colores x6 cajas', '<p>Caja de temperas parchesitos 6 colores x6 cajas</p>', 22800.00, 300, 'assets/images/productos/20241010182740.jpg', 1, 18),
(191, 'Set Pinceles cerdas finas redondos y planos x6 paq', '<p>Set Pinceles cerdas finas redondos y planos x6 paquetes</p>', 48000.00, 300, 'assets/images/productos/20241010183440.jpg', 1, 18),
(192, 'Set 12 Pinceles corrientes surtidos redondos y planos x6 paq', '<p>Set 12 Pinceles corrientes surtidos (del #1 al #12) redondos y planos x6 paquetes</p>', 108000.00, 300, 'assets/images/productos/20241010183800.jpg', 1, 18),
(193, 'Bomba R6 x12 sempertex surtidos x12 paq', '<p>Bomba R6 x12 sempertex colores surtidos x12 paquetes</p>', 42000.00, 300, 'assets/images/productos/20241010220630.jpg', 1, 19),
(194, 'Bomba R9 x50 sempertex surtidos x6 paq', '<p>Bomba R9 x50 sempertex colores surtidos x6 paquetes</p>', 90000.00, 300, 'assets/images/productos/20241010220825.jpg', 1, 19),
(195, 'Bomba R12 x50 sempertex surtidos x3 paq', '<p>Bomba R12 x50 sempertex colores surtidos x3 paquetes</p>', 63000.00, 300, 'assets/images/productos/20241010221042.jpg', 1, 19),
(196, 'Bomba mil figuras sempertex surtidos x3 paq', '<p>Bomba mil figuras sempertex colores surtidos x3 paquetes</p>', 75000.00, 300, 'assets/images/productos/20241010222026.jpg', 1, 19),
(197, 'Bomba Corazon rojo sempertex R12 x50  x3 paq', '<p>Bomba Corazon color rojo R12 x50 sempertex x3 paquetes</p>', 69000.00, 300, 'assets/images/productos/20241010224253.jpg', 1, 19),
(198, 'Bomba Corazón estampada sempertex R12 x50  surtidos x3 paq', '<p>Bomba Corazón estampada sempertex R12 x50 &nbsp;surtidos (te amo, te quiero y feliz día) x3 paquetes</p>', 117000.00, 300, 'assets/images/productos/20241010224642.jpg', 1, 19),
(199, 'Serpentinas surtidas x24 und', '<p>Serpentinas colores surtidos x24 unidades</p>', 22000.00, 300, 'assets/images/productos/20241010225952.jpg', 1, 19),
(200, 'Bolsa confeti x1lb x12 und', '<p>Bolsa confeti x1lb x12 unidades</p>', 18000.00, 300, 'assets/images/productos/20241010230301.jpg', 1, 19),
(201, 'Cortina metalizada 1mx2m surtidas x12 und', '<p>Cortina metalizada 1mx2m colores surtidos x12 unidades</p>', 48000.00, 300, 'assets/images/productos/20241010231619.jpg', 1, 19),
(202, 'Letrero feliz cumpleaños 5m surtidos x12 und', '<p>Letrero feliz cumpleaños 5m colores surtidos x12 unidades</p>', 48000.00, 300, 'assets/images/productos/20241010232009.jpg', 1, 19),
(203, 'Vela volcán x6 surtidos x6 paq', '<p>Vela volcán x6 colores surtidos x6 paquetes</p>', 48000.00, 300, 'assets/images/productos/20241010232832.jpg', 1, 19),
(204, 'Letrero feliz cumpleaños 3m metalizado surtidos x12 und', '<p>Letrero feliz cumpleaños 3m metalizado colores surtidos x12 unidades</p>', 36000.00, 300, 'assets/images/productos/20241010233030.jpg', 1, 19),
(205, 'Plastilina caja corta parchesito x12 cajas', '<p>Plastilina caja corta parchesito x12 cajas</p>', 12000.00, 300, 'assets/images/productos/20241010233338.jpg', 1, 20),
(206, 'Plastilina caja larga parchesito x12 cajas', '<p>Plastilina caja larga parchesito x12 cajas</p>', 24000.00, 300, 'assets/images/productos/20241010233434.jpg', 1, 20),
(207, 'Plastilina en barra 32cc Parchesitos surtido x63 und', '<p>Plastilina en barra 32cc Parchesitos colores surtidos (21 colores) x63 unidades</p>', 54000.00, 300, 'assets/images/productos/20241010233853.jpg', 1, 20),
(208, 'Plastilina en barra 125gr Parchesitos surtido x24 und', '<p>Plastilina en barra 125gr Parchesitos colores surtidos (12 colores) x24 unidades</p>', 60000.00, 300, 'assets/images/productos/20241010234146.jpg', 1, 20),
(209, 'Plumones x6 parchesitos x12 paq', '<p>Plumones x6 parchesitos x12 paquetes</p>', 48000.00, 300, 'assets/images/productos/20241010234433.jpg', 1, 21),
(210, 'Plumones x12 parchesitos x12 paq', '<p>Plumones x12 parchesitos x12 paquetes</p>', 96000.00, 300, 'assets/images/productos/20241010234534.jpg', 1, 21),
(211, 'Plumones jumbo x10 parchesitos x6 paq', '<p>Plumones jumbo x10 parchesitos x6 paquetes</p>', 66000.00, 300, 'assets/images/productos/20241010234653.jpg', 1, 21),
(212, 'Plumones lavables x12 Norma x6 cajas', '<p>Plumones lavables x12 Norma x6 cajas</p>', 60000.00, 300, 'assets/images/productos/20241011003217.jpg', 1, 21),
(213, 'Plumones lavables x24 Norma x3 cajas', '<p>Plumones lavables x24 Norma x3 cajas</p>', 60000.00, 300, 'assets/images/productos/20241011003329.jpg', 1, 21),
(214, 'Portaminas Estilo metalizado 0.7mm surtidos x12 und', '<p>Portaminas Estilo metalizado 0.7mm colores surtidos x12 unidades</p>', 30000.00, 300, 'assets/images/productos/20241011152818.jpg', 1, 22),
(215, 'Portaminas Pasta 2.0mm surtidos x12 und', '<p>Portaminas Pasta 2.0mm colores surtidos x12 unidades</p>', 21600.00, 300, 'assets/images/productos/20241011153156.jpg', 1, 22),
(216, 'Portaminas figuras 0.5mm surtidos x12 und', '<p>Portaminas figuras 0.5mm colores surtidos x12 unidades</p>', 26400.00, 300, 'assets/images/productos/20241011153441.jpg', 1, 22),
(217, 'Minas repuesto 0.7mm x12 und', '<p>Minas repuesto 0.7mm x12 unidades</p>', 24000.00, 300, 'assets/images/productos/20241011153647.jpg', 1, 22),
(218, 'Minas repuesto 2.0mm x12 und', '<p>Minas repuesto 2.0mm x12 unidades</p>', 24000.00, 300, 'assets/images/productos/20241011153819.jpg', 1, 22),
(219, 'Regla 30cm Motivos surtidos Kwai x24 und', '<p>Regla 30cm Motivos surtidos Kwai x24 unidades</p>', 36000.00, 300, 'assets/images/productos/20241011154214.jpg', 1, 23),
(220, 'Regla precisión 30cm surtidos x24 und ', '<p>Regla precisión 30cm colores surtidos x24 unidades</p>', 28800.00, 300, 'assets/images/productos/20241011154343.jpg', 1, 23),
(221, 'Regla metálica 30cm x12 und', '<p>Regla metálica (aluminio) 30cm x12 unidades</p>', 24000.00, 300, 'assets/images/productos/20241011154506.jpg', 1, 23),
(222, 'Regla precisión 15cm colores surtidos x24 und ', '<p>Regla precisión 15cm colores surtidos x24 unidades</p>', 12000.00, 300, 'assets/images/productos/20241011154647.jpg', 1, 23),
(223, 'Escuadra 45 grados 32cm x12 und', '<p>Escuadra 45 grados 32cm x12 unidades</p>', 36000.00, 300, 'assets/images/productos/20241011154917.jpg', 1, 23),
(224, 'Escuadra 60 grados 21cm x12 und', '<p>Escuadra 60 grados 21cm x12 unidades</p>', 36000.00, 300, 'assets/images/productos/20241012170330.jpg', 1, 23),
(225, 'Set geométrico estcuadras Regla Transportador y tabla periodica x12 und', '<p>Set geométrico estcuadras Regla Transportador y tabla periodica colores surtidos x12 unidades</p>', 48000.00, 300, 'assets/images/productos/20241012170602.jpg', 1, 23),
(226, 'Transportador precisión 180 grados x24 und', '<p>Transportador precisión 180 grados x24 unidades</p>', 20000.00, 300, 'assets/images/productos/20241012172141.jpg', 1, 23),
(227, 'Transportador precisión 360 grados x24 und', '<p>Transportador precisión 360 grados x24 unidades</p>', 24000.00, 300, 'assets/images/productos/20241012172209.jpg', 1, 23),
(228, 'Zacapunta metálico pequeño x6 cajas', '<p>Zacapunta metálico pequeño x6 cajas (cada caja x24 unidades)</p>', 57600.00, 300, 'assets/images/productos/20241012172800.jpg', 1, 24),
(229, 'Zacapunta pasta pequeño x6 cajas', '<p>Zacapunta pasta pequeño x6 cajas (cada caja x24 unidades)</p>', 43200.00, 300, 'assets/images/productos/20241012172900.jpg', 1, 24),
(230, 'Zacapunta doble propósito Kores grande y pequeño surtidos x 24 und', '<p>Zacapunta doble propósito Kores grande y pequeño surtidos x 24 unidades</p>', 36000.00, 300, 'assets/images/productos/20241012173034.jpg', 1, 24),
(231, 'Zacapunta doble propósito Eterna grande y pequeño surtidos x 24 und', '<p>Zacapunta doble propósito Eterna grande y pequeño colores surtidos x24 unidades</p>', 43200.00, 300, 'assets/images/productos/20241012173224.jpg', 1, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'ANGEL', 'SIFUENTES', 'angelsifuentes2580@gmail.com', '$2y$10$XtV68JJ/fABHwWMARZotF.9BHbkwBpquycry2HYOlS.QaUGt/mls2', NULL, 0),
(2, 'Alvaro Javier', 'Amaya Cordero', 'ajac910918@gmail.com', '$2y$10$OwZYphgKuiNyeVmqfHbuyOAT/eTZ755xxK2w/VZaP2EVH7c4qxh2.', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
