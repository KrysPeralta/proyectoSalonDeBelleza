/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100424 (10.4.24-MariaDB)
 Source Host           : 127.0.0.1:3308
 Source Schema         : beautysalonbd

 Target Server Type    : MySQL
 Target Server Version : 100424 (10.4.24-MariaDB)
 File Encoding         : 65001

 Date: 25/11/2022 20:53:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area`  (
  `id_area` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_area` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_area`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_area
-- ----------------------------

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id_blog` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tit_blog` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Titulo del blog',
  `cont_blog` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Contenido del blog',
  `fechapub_blog` datetime NOT NULL,
  `foto1_blog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto2_blog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto3_blog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto4_blog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto5_blog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto6_blog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fkus_blog` int UNSIGNED NOT NULL COMMENT 'Usuario que publica el blog',
  `fktag_blog` int UNSIGNED NOT NULL COMMENT 'Tema del blog',
  `fkstatb_blog` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_blog`) USING BTREE,
  INDEX `blog_fktag`(`fktag_blog` ASC) USING BTREE,
  INDEX `blog_fkstatb`(`fkstatb_blog` ASC) USING BTREE,
  INDEX `blog_fkus`(`fkus_blog` ASC) USING BTREE,
  CONSTRAINT `blog_fkstatb` FOREIGN KEY (`fkstatb_blog`) REFERENCES `t_status_blog` (`id_statb`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_fktag` FOREIGN KEY (`fktag_blog`) REFERENCES `t_tag` (`id_tag`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_fkus` FOREIGN KEY (`fkus_blog`) REFERENCES `t_usuario` (`id_us`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog
-- ----------------------------

-- ----------------------------
-- Table structure for t_categoria
-- ----------------------------
DROP TABLE IF EXISTS `t_categoria`;
CREATE TABLE `t_categoria`  (
  `id_cat` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_cat` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_cat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_categoria
-- ----------------------------

-- ----------------------------
-- Table structure for t_cita
-- ----------------------------
DROP TABLE IF EXISTS `t_cita`;
CREATE TABLE `t_cita`  (
  `id_cita` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_cita` date NOT NULL,
  `inicio_cita` time NOT NULL,
  `fin_cita` time NOT NULL,
  `anticipo_cita` decimal(10, 2) NOT NULL,
  `fkprod_cita` int UNSIGNED NOT NULL COMMENT 'Servicio al que hace referencia la cita',
  `fkemp_cita` int UNSIGNED NOT NULL,
  `fkcli_cita` int UNSIGNED NOT NULL,
  `fksuc_cita` int UNSIGNED NOT NULL,
  `fkstat_cita` int UNSIGNED NOT NULL COMMENT 'Estado de la cita',
  PRIMARY KEY (`id_cita`) USING BTREE,
  INDEX `cita_fkprod`(`fkprod_cita` ASC) USING BTREE,
  INDEX `cita_fkemp`(`fkemp_cita` ASC) USING BTREE,
  INDEX `cita_fkcli`(`fkcli_cita` ASC) USING BTREE,
  INDEX `cita_fksuc`(`fksuc_cita` ASC) USING BTREE,
  INDEX `cita_fkstat`(`fkstat_cita` ASC) USING BTREE,
  CONSTRAINT `cita_fkcli` FOREIGN KEY (`fkcli_cita`) REFERENCES `t_cliente` (`id_cli`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cita_fkemp` FOREIGN KEY (`fkemp_cita`) REFERENCES `t_empleado` (`id_emp`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cita_fkprod` FOREIGN KEY (`fkprod_cita`) REFERENCES `t_producto` (`id_prod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cita_fkstat` FOREIGN KEY (`fkstat_cita`) REFERENCES `t_status` (`id_stat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cita_fksuc` FOREIGN KEY (`fksuc_cita`) REFERENCES `t_sucursal` (`id_suc`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cita
-- ----------------------------

-- ----------------------------
-- Table structure for t_cliente
-- ----------------------------
DROP TABLE IF EXISTS `t_cliente`;
CREATE TABLE `t_cliente`  (
  `id_cli` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_cli` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telef_cli` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo_cli` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fksex_cli` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_cli`) USING BTREE,
  INDEX `cli_fksex`(`fksex_cli` ASC) USING BTREE,
  CONSTRAINT `cli_fksex` FOREIGN KEY (`fksex_cli`) REFERENCES `t_sexo` (`id_sex`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cliente
-- ----------------------------

-- ----------------------------
-- Table structure for t_descuento
-- ----------------------------
DROP TABLE IF EXISTS `t_descuento`;
CREATE TABLE `t_descuento`  (
  `id_dto` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `porcen_dto` tinyint NOT NULL,
  `desc_dto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descripción del porqué del descuento',
  PRIMARY KEY (`id_dto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_descuento
-- ----------------------------

-- ----------------------------
-- Table structure for t_detalle_venta
-- ----------------------------
DROP TABLE IF EXISTS `t_detalle_venta`;
CREATE TABLE `t_detalle_venta`  (
  `id_detv` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cant_detv` tinyint NOT NULL,
  `precio_detv` decimal(10, 2) NOT NULL,
  `dto_detv` decimal(10, 2) NOT NULL COMMENT 'Descuento aplicado',
  `fkven_detv` int UNSIGNED NOT NULL,
  `fkprod_detv` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_detv`) USING BTREE,
  INDEX `detv_fkven`(`fkven_detv` ASC) USING BTREE,
  INDEX `detv_fkprod`(`fkprod_detv` ASC) USING BTREE,
  CONSTRAINT `detv_fkprod` FOREIGN KEY (`fkprod_detv`) REFERENCES `t_producto` (`id_prod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detv_fkven` FOREIGN KEY (`fkven_detv`) REFERENCES `t_venta` (`id_ven`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_detalle_venta
-- ----------------------------

-- ----------------------------
-- Table structure for t_empleado
-- ----------------------------
DROP TABLE IF EXISTS `t_empleado`;
CREATE TABLE `t_empleado`  (
  `id_emp` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_emp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_emp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apm_emp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo_emp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telef_emp` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dir_emp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Dirección del empleado',
  `fechanac_emp` date NOT NULL,
  `fechacont_emp` date NOT NULL COMMENT 'Fecha de contratación',
  `fksex_emp` int UNSIGNED NOT NULL,
  `fkus_emp` int UNSIGNED NOT NULL COMMENT 'Usuario del empleado',
  `fkpto_emp` int UNSIGNED NOT NULL COMMENT 'Puesto del empleado',
  `fkesp_emp` int UNSIGNED NOT NULL,
  `fkarea_emp` int UNSIGNED NOT NULL,
  `fksuc_emp` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_emp`) USING BTREE,
  INDEX `emp_fksex`(`fksex_emp` ASC) USING BTREE,
  INDEX `emp_fkus`(`fkus_emp` ASC) USING BTREE,
  INDEX `emp_fkpto`(`fkpto_emp` ASC) USING BTREE,
  INDEX `emp_fkarea`(`fkarea_emp` ASC) USING BTREE,
  INDEX `emp_fkesp`(`fkesp_emp` ASC) USING BTREE,
  INDEX `emp_fksuc`(`fksuc_emp` ASC) USING BTREE,
  CONSTRAINT `emp_fkarea` FOREIGN KEY (`fkarea_emp`) REFERENCES `t_area` (`id_area`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_fkesp` FOREIGN KEY (`fkesp_emp`) REFERENCES `t_especialidad` (`id_esp`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_fkpto` FOREIGN KEY (`fkpto_emp`) REFERENCES `t_puesto` (`id_pto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_fksex` FOREIGN KEY (`fksex_emp`) REFERENCES `t_sexo` (`id_sex`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_fksuc` FOREIGN KEY (`fksuc_emp`) REFERENCES `t_sucursal` (`id_suc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_fkus` FOREIGN KEY (`fkus_emp`) REFERENCES `t_usuario` (`id_us`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_empleado
-- ----------------------------

-- ----------------------------
-- Table structure for t_especialidad
-- ----------------------------
DROP TABLE IF EXISTS `t_especialidad`;
CREATE TABLE `t_especialidad`  (
  `id_esp` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_esp` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_esp`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_especialidad
-- ----------------------------

-- ----------------------------
-- Table structure for t_foto
-- ----------------------------
DROP TABLE IF EXISTS `t_foto`;
CREATE TABLE `t_foto`  (
  `id_foto` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_foto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_foto
-- ----------------------------

-- ----------------------------
-- Table structure for t_horario
-- ----------------------------
DROP TABLE IF EXISTS `t_horario`;
CREATE TABLE `t_horario`  (
  `id_hor` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dia_hor` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `horaent_hor` time NOT NULL COMMENT 'Horario de entrada',
  `horasal_hor` time NOT NULL COMMENT 'Horario de salida',
  PRIMARY KEY (`id_hor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_horario
-- ----------------------------

-- ----------------------------
-- Table structure for t_horario_sucursal
-- ----------------------------
DROP TABLE IF EXISTS `t_horario_sucursal`;
CREATE TABLE `t_horario_sucursal`  (
  `id_hors` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dia_hors` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apermat_hors` time NOT NULL COMMENT 'Horario de apertura matutino',
  `ciemat_hors` time NOT NULL COMMENT 'Horario de cierre matutino',
  `aperves_hors` time NOT NULL COMMENT 'Horario de apertura vespertino',
  `cieves_hors` time NOT NULL COMMENT 'Horario de cierre vespertino',
  PRIMARY KEY (`id_hors`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_horario_sucursal
-- ----------------------------

-- ----------------------------
-- Table structure for t_horarioempleado
-- ----------------------------
DROP TABLE IF EXISTS `t_horarioempleado`;
CREATE TABLE `t_horarioempleado`  (
  `id_he` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fkemp_he` int UNSIGNED NOT NULL COMMENT 'Referencia al empleado',
  `fkhor_he` int UNSIGNED NOT NULL COMMENT 'Referencia al horario',
  PRIMARY KEY (`id_he`) USING BTREE,
  INDEX `he_fkemp`(`fkemp_he` ASC) USING BTREE,
  INDEX `he_fkhor`(`fkhor_he` ASC) USING BTREE,
  CONSTRAINT `he_fkemp` FOREIGN KEY (`fkemp_he`) REFERENCES `t_empleado` (`id_emp`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `he_fkhor` FOREIGN KEY (`fkhor_he`) REFERENCES `t_horario` (`id_hor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_horarioempleado
-- ----------------------------

-- ----------------------------
-- Table structure for t_marca
-- ----------------------------
DROP TABLE IF EXISTS `t_marca`;
CREATE TABLE `t_marca`  (
  `id_marca` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_marca` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_marca`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_marca
-- ----------------------------

-- ----------------------------
-- Table structure for t_metodo_pago
-- ----------------------------
DROP TABLE IF EXISTS `t_metodo_pago`;
CREATE TABLE `t_metodo_pago`  (
  `id_metpag` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_metpag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_metpag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_metodo_pago
-- ----------------------------

-- ----------------------------
-- Table structure for t_permiso
-- ----------------------------
DROP TABLE IF EXISTS `t_permiso`;
CREATE TABLE `t_permiso`  (
  `id_perm` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_perm` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc_perm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descripción de las acciones de ese permiso',
  PRIMARY KEY (`id_perm`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permiso
-- ----------------------------

-- ----------------------------
-- Table structure for t_producto
-- ----------------------------
DROP TABLE IF EXISTS `t_producto`;
CREATE TABLE `t_producto`  (
  `id_prod` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cod_prod` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Código del producto',
  `nom_prod` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc_prod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descripción del producto',
  `precioc_prod` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Precio de compra',
  `preciov_prod` decimal(10, 2) NOT NULL COMMENT 'Precio de venta',
  `stock_prod` mediumint NULL DEFAULT NULL,
  `dur_prod` smallint NULL DEFAULT NULL COMMENT 'Duración en caso de ser servicio',
  `fktipo_prod` int UNSIGNED NOT NULL,
  `fkdto_prod` int UNSIGNED NOT NULL COMMENT 'Referencia al descuento',
  `fkcat_prod` int UNSIGNED NOT NULL COMMENT 'Referencia a la categoria',
  `fkmarca_prod` int UNSIGNED NOT NULL,
  `fkprov_prod` int UNSIGNED NOT NULL,
  `fksuc_prod` int UNSIGNED NOT NULL,
  `fkses_prod` int UNSIGNED NOT NULL,
  `fkstat_prod` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_prod`) USING BTREE,
  INDEX `prod_fktipo`(`fktipo_prod` ASC) USING BTREE,
  INDEX `prod_fkdto`(`fkdto_prod` ASC) USING BTREE,
  INDEX `prod_fkcat`(`fkcat_prod` ASC) USING BTREE,
  INDEX `prod_fkmarca`(`fkmarca_prod` ASC) USING BTREE,
  INDEX `prod_fkprov`(`fkprov_prod` ASC) USING BTREE,
  INDEX `prod_fksuc`(`fksuc_prod` ASC) USING BTREE,
  INDEX `prod_fkses`(`fkses_prod` ASC) USING BTREE,
  INDEX `prod_fkstat`(`fkstat_prod` ASC) USING BTREE,
  CONSTRAINT `prod_fkcat` FOREIGN KEY (`fkcat_prod`) REFERENCES `t_categoria` (`id_cat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prod_fkdto` FOREIGN KEY (`fkdto_prod`) REFERENCES `t_descuento` (`id_dto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prod_fkmarca` FOREIGN KEY (`fkmarca_prod`) REFERENCES `t_marca` (`id_marca`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prod_fkprov` FOREIGN KEY (`fkprov_prod`) REFERENCES `t_proveedor` (`id_prov`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prod_fkses` FOREIGN KEY (`fkses_prod`) REFERENCES `t_sesion` (`id_ses`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prod_fkstat` FOREIGN KEY (`fkstat_prod`) REFERENCES `t_status` (`id_stat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prod_fksuc` FOREIGN KEY (`fksuc_prod`) REFERENCES `t_sucursal` (`id_suc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prod_fktipo` FOREIGN KEY (`fktipo_prod`) REFERENCES `t_tipo` (`id_tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_producto
-- ----------------------------

-- ----------------------------
-- Table structure for t_productoempleado
-- ----------------------------
DROP TABLE IF EXISTS `t_productoempleado`;
CREATE TABLE `t_productoempleado`  (
  `id_pe` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fkemp_pe` int UNSIGNED NOT NULL COMMENT 'Referencia al empleado',
  `fkprod_pe` int UNSIGNED NOT NULL COMMENT 'Referencia al producto (en este caso un servicio)',
  PRIMARY KEY (`id_pe`) USING BTREE,
  INDEX `pe_fkemp`(`fkemp_pe` ASC) USING BTREE,
  INDEX `pe_fkprod`(`fkprod_pe` ASC) USING BTREE,
  CONSTRAINT `pe_fkemp` FOREIGN KEY (`fkemp_pe`) REFERENCES `t_empleado` (`id_emp`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pe_fkprod` FOREIGN KEY (`fkprod_pe`) REFERENCES `t_producto` (`id_prod`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_productoempleado
-- ----------------------------

-- ----------------------------
-- Table structure for t_productofoto
-- ----------------------------
DROP TABLE IF EXISTS `t_productofoto`;
CREATE TABLE `t_productofoto`  (
  `id_pf` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fkprod_pf` int UNSIGNED NOT NULL COMMENT 'Referencia al producto',
  `fkfoto_pf` int UNSIGNED NOT NULL COMMENT 'Referencia a la foto',
  PRIMARY KEY (`id_pf`) USING BTREE,
  INDEX `pf_fkprod`(`fkprod_pf` ASC) USING BTREE,
  INDEX `pf_fkfoto`(`fkfoto_pf` ASC) USING BTREE,
  CONSTRAINT `pf_fkfoto` FOREIGN KEY (`fkfoto_pf`) REFERENCES `t_foto` (`id_foto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pf_fkprod` FOREIGN KEY (`fkprod_pf`) REFERENCES `t_producto` (`id_prod`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_productofoto
-- ----------------------------

-- ----------------------------
-- Table structure for t_promocion
-- ----------------------------
DROP TABLE IF EXISTS `t_promocion`;
CREATE TABLE `t_promocion`  (
  `id_prom` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cod_prom` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Código de la promoción',
  `dto_prom` tinyint NOT NULL COMMENT 'Descuento que se aplica con la promoción',
  `dispo_prom` tinyint NOT NULL COMMENT 'Disponibilidad de la promoción',
  `fechaini_prom` datetime NOT NULL COMMENT 'Fecha de inicio',
  `fechafin_prom` datetime NOT NULL COMMENT 'Fecha de fin',
  `fkprod_prom` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_prom`) USING BTREE,
  INDEX `prom_fkprod`(`fkprod_prom` ASC) USING BTREE,
  CONSTRAINT `prom_fkprod` FOREIGN KEY (`fkprod_prom`) REFERENCES `t_producto` (`id_prod`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_promocion
-- ----------------------------

-- ----------------------------
-- Table structure for t_proveedor
-- ----------------------------
DROP TABLE IF EXISTS `t_proveedor`;
CREATE TABLE `t_proveedor`  (
  `id_prov` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_prov` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dir_prov` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Dirección del proveedor',
  `telef1_prov` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telef2_prov` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Telefono de emergencia del proveedor en caso de tener',
  `correo_prov` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_prov`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_proveedor
-- ----------------------------

-- ----------------------------
-- Table structure for t_puesto
-- ----------------------------
DROP TABLE IF EXISTS `t_puesto`;
CREATE TABLE `t_puesto`  (
  `id_pto` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_pto` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sueldo_pto` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id_pto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_puesto
-- ----------------------------

-- ----------------------------
-- Table structure for t_rol
-- ----------------------------
DROP TABLE IF EXISTS `t_rol`;
CREATE TABLE `t_rol`  (
  `id_rol` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_rol` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_rol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_rol
-- ----------------------------

-- ----------------------------
-- Table structure for t_rolpermiso
-- ----------------------------
DROP TABLE IF EXISTS `t_rolpermiso`;
CREATE TABLE `t_rolpermiso`  (
  `id_rp` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fkrol_rp` int UNSIGNED NOT NULL COMMENT 'Referencia al rol',
  `fkperm_rp` int UNSIGNED NOT NULL COMMENT 'Referencia al permiso',
  PRIMARY KEY (`id_rp`) USING BTREE,
  INDEX `rp_fkrol`(`fkrol_rp` ASC) USING BTREE,
  INDEX `rp_fkperm`(`fkperm_rp` ASC) USING BTREE,
  CONSTRAINT `rp_fkperm` FOREIGN KEY (`fkperm_rp`) REFERENCES `t_permiso` (`id_perm`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rp_fkrol` FOREIGN KEY (`fkrol_rp`) REFERENCES `t_rol` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_rolpermiso
-- ----------------------------

-- ----------------------------
-- Table structure for t_sesion
-- ----------------------------
DROP TABLE IF EXISTS `t_sesion`;
CREATE TABLE `t_sesion`  (
  `id_ses` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tot_ses` tinyint NOT NULL,
  `desc_ses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Descripción del porqué de las sesiones',
  PRIMARY KEY (`id_ses`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sesion
-- ----------------------------

-- ----------------------------
-- Table structure for t_sexo
-- ----------------------------
DROP TABLE IF EXISTS `t_sexo`;
CREATE TABLE `t_sexo`  (
  `id_sex` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_sex` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_sex`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sexo
-- ----------------------------

-- ----------------------------
-- Table structure for t_status
-- ----------------------------
DROP TABLE IF EXISTS `t_status`;
CREATE TABLE `t_status`  (
  `id_stat` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_stat` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_stat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_status
-- ----------------------------

-- ----------------------------
-- Table structure for t_status_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_status_blog`;
CREATE TABLE `t_status_blog`  (
  `id_statb` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_statb` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_statb`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_status_blog
-- ----------------------------

-- ----------------------------
-- Table structure for t_status_venta
-- ----------------------------
DROP TABLE IF EXISTS `t_status_venta`;
CREATE TABLE `t_status_venta`  (
  `id_statv` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_statv` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_statv`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_status_venta
-- ----------------------------

-- ----------------------------
-- Table structure for t_sucursal
-- ----------------------------
DROP TABLE IF EXISTS `t_sucursal`;
CREATE TABLE `t_sucursal`  (
  `id_suc` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `num_suc` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dir_suc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Dirección de la sucursal',
  `fkhors_suc` int UNSIGNED NOT NULL COMMENT 'Referencia al horario de la sucursal',
  PRIMARY KEY (`id_suc`) USING BTREE,
  INDEX `suc_fkhors`(`fkhors_suc` ASC) USING BTREE,
  CONSTRAINT `suc_fkhors` FOREIGN KEY (`fkhors_suc`) REFERENCES `t_horario_sucursal` (`id_hors`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sucursal
-- ----------------------------

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id_tag` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_tag` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_tag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------

-- ----------------------------
-- Table structure for t_tipo
-- ----------------------------
DROP TABLE IF EXISTS `t_tipo`;
CREATE TABLE `t_tipo`  (
  `id_tipo` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_tipo` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tipo
-- ----------------------------

-- ----------------------------
-- Table structure for t_tipo_venta
-- ----------------------------
DROP TABLE IF EXISTS `t_tipo_venta`;
CREATE TABLE `t_tipo_venta`  (
  `id_tven` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_tven` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_tven`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tipo_venta
-- ----------------------------

-- ----------------------------
-- Table structure for t_usuario
-- ----------------------------
DROP TABLE IF EXISTS `t_usuario`;
CREATE TABLE `t_usuario`  (
  `id_us` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_us` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre del usuario',
  `passw_us` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Contraseña del usuario',
  `fkrol_us` int UNSIGNED NOT NULL COMMENT 'Referencia al rol',
  PRIMARY KEY (`id_us`) USING BTREE,
  INDEX `us_fkrol`(`fkrol_us` ASC) USING BTREE,
  CONSTRAINT `us_fkrol` FOREIGN KEY (`fkrol_us`) REFERENCES `t_rol` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_usuario
-- ----------------------------

-- ----------------------------
-- Table structure for t_venta
-- ----------------------------
DROP TABLE IF EXISTS `t_venta`;
CREATE TABLE `t_venta`  (
  `id_ven` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `folio_ven` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_ven` datetime NOT NULL,
  `subtot_ven` decimal(10, 2) NOT NULL,
  `iva_ven` decimal(10, 2) NOT NULL,
  `tot_ven` decimal(10, 2) NOT NULL,
  `importe_ven` decimal(10, 2) NOT NULL,
  `cambio_ven` decimal(10, 2) NOT NULL,
  `fktven_ven` int UNSIGNED NOT NULL COMMENT 'Referencia al tipo de venta',
  `fkemp_ven` int UNSIGNED NOT NULL,
  `fkcli_ven` int UNSIGNED NOT NULL,
  `fkprom_ven` int UNSIGNED NOT NULL COMMENT 'Referencia a la promoción',
  `fkmetpag_ven` int UNSIGNED NOT NULL COMMENT 'Referencia al método de pago',
  `fkstatv_ven` int UNSIGNED NOT NULL COMMENT 'Referencia al estado de la venta',
  `fksuc_ven` int UNSIGNED NOT NULL COMMENT 'Referencia a la sucursal',
  PRIMARY KEY (`id_ven`) USING BTREE,
  INDEX `ven_fktven`(`fktven_ven` ASC) USING BTREE,
  INDEX `ven_fkemp`(`fkemp_ven` ASC) USING BTREE,
  INDEX `ven_fkcli`(`fkcli_ven` ASC) USING BTREE,
  INDEX `ven_fkprom`(`fkprom_ven` ASC) USING BTREE,
  INDEX `ven_fkmetpag`(`fkmetpag_ven` ASC) USING BTREE,
  INDEX `ven_fkstatv`(`fkstatv_ven` ASC) USING BTREE,
  INDEX `ven_fksuc`(`fksuc_ven` ASC) USING BTREE,
  CONSTRAINT `ven_fkcli` FOREIGN KEY (`fkcli_ven`) REFERENCES `t_cliente` (`id_cli`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ven_fkemp` FOREIGN KEY (`fkemp_ven`) REFERENCES `t_empleado` (`id_emp`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ven_fkmetpag` FOREIGN KEY (`fkmetpag_ven`) REFERENCES `t_metodo_pago` (`id_metpag`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ven_fkprom` FOREIGN KEY (`fkprom_ven`) REFERENCES `t_promocion` (`id_prom`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ven_fkstatv` FOREIGN KEY (`fkstatv_ven`) REFERENCES `t_status_venta` (`id_statv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ven_fksuc` FOREIGN KEY (`fksuc_ven`) REFERENCES `t_sucursal` (`id_suc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ven_fktven` FOREIGN KEY (`fktven_ven`) REFERENCES `t_tipo_venta` (`id_tven`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_venta
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
