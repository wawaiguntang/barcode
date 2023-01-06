-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table barcode.category
CREATE TABLE IF NOT EXISTS `category` (
  `categoryCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`categoryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.category: ~1 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`categoryCode`, `category`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(3, 'Pakaian anak cewek', '2023-01-06 03:06:25', NULL, NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table barcode.module
CREATE TABLE IF NOT EXISTS `module` (
  `moduleCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(100) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`moduleCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.module: ~3 rows (approximately)
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` (`moduleCode`, `module`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(1, 'Dashboard', '2022-12-03 15:21:35', NULL, NULL),
	(2, 'Management User', '2022-12-03 15:21:35', NULL, NULL),
	(3, 'Barcode', '2023-01-06 02:54:40', NULL, NULL);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;

-- Dumping structure for table barcode.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `permissionCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `moduleCode` bigint(20) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`permissionCode`),
  KEY `moduleCode` (`moduleCode`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`moduleCode`) REFERENCES `module` (`moduleCode`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.permission: ~35 rows (approximately)
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`permissionCode`, `permission`, `description`, `moduleCode`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(1, 'RDASH', 'See dashboard', 1, '2022-12-03 15:21:35', NULL, NULL),
	(2, 'RU', 'See user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(3, 'CU', 'Create user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(4, 'UU', 'Update user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(5, 'DU', 'Delete user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(6, 'RR', 'See role ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(7, 'CR', 'Create role ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(8, 'UR', 'Update role ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(9, 'DR', 'Delete role ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(10, 'RRU', 'See role of user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(11, 'CRU', 'Add role to user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(12, 'DRU', 'Delete role from user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(13, 'RUP', 'See special permission of user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(14, 'CUP', 'Add special permission to user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(15, 'DUP', 'Delete special permission from user ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(16, 'RRP', 'See permission of role ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(17, 'CRP', 'Add permission to role ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(18, 'DRP', 'Delete permission from role ', 2, '2022-12-03 15:21:35', NULL, NULL),
	(19, 'RSUPPLIER', 'See supplier', 3, '2023-01-06 02:54:40', NULL, NULL),
	(20, 'CSUPPLIER', 'Create supplier', 3, '2023-01-06 02:54:40', NULL, NULL),
	(21, 'USUPPLIER', 'Update supplier', 3, '2023-01-06 02:54:40', NULL, NULL),
	(22, 'DSUPPLIER', 'Delete supplier', 3, '2023-01-06 02:54:40', NULL, NULL),
	(23, 'RCATEGORY', 'See category', 3, '2023-01-06 02:54:40', NULL, NULL),
	(24, 'CCATEGORY', 'Create category', 3, '2023-01-06 02:54:40', NULL, NULL),
	(25, 'UCATEGORY', 'Update category', 3, '2023-01-06 02:54:40', NULL, NULL),
	(26, 'DCATEGORY', 'Delete category', 3, '2023-01-06 02:54:40', NULL, NULL),
	(27, 'RUNIT', 'See unit', 3, '2023-01-06 02:54:40', NULL, NULL),
	(28, 'CUNIT', 'Create unit', 3, '2023-01-06 02:54:40', NULL, NULL),
	(29, 'UUNIT', 'Update unit', 3, '2023-01-06 02:54:40', NULL, NULL),
	(30, 'DUNIT', 'Delete unit', 3, '2023-01-06 02:54:40', NULL, NULL),
	(31, 'RPRODUCT', 'See product', 3, '2023-01-06 02:54:40', NULL, NULL),
	(32, 'CPRODUCT', 'Create product', 3, '2023-01-06 02:54:40', NULL, NULL),
	(33, 'UPRODUCT', 'Update product', 3, '2023-01-06 02:54:40', NULL, NULL),
	(34, 'DPRODUCT', 'Delete product', 3, '2023-01-06 02:54:40', NULL, NULL),
	(35, 'PRINTPRODUCT', 'Print barcode product', 3, '2023-01-06 02:54:40', NULL, NULL);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;

-- Dumping structure for table barcode.product
CREATE TABLE IF NOT EXISTS `product` (
  `productCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `buyPrice` varchar(255) DEFAULT NULL,
  `sellPrice` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `categoryCode` bigint(20) DEFAULT NULL,
  `supplierCode` bigint(20) DEFAULT NULL,
  `unitCode` bigint(20) DEFAULT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`productCode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.product: ~0 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`productCode`, `name`, `code`, `buyPrice`, `sellPrice`, `quantity`, `categoryCode`, `supplierCode`, `unitCode`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(3, 'asd', 'asdasdasd', '43554', '345543', '34', 3, 3, 3, '2023-01-05 20:22:28', '2023-01-06 04:31:41', NULL),
	(4, 'asda', 'asdsad', '12121212', '2121212', '2', 3, 3, 3, '2023-01-06 04:20:39', '2023-01-06 04:20:50', NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table barcode.role
CREATE TABLE IF NOT EXISTS `role` (
  `roleCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `status` enum('Static','Dynamic') NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`roleCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.role: ~1 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`roleCode`, `role`, `status`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(1, 'Super Admin', 'Static', '2022-12-03 15:20:17', NULL, NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table barcode.role_permission
CREATE TABLE IF NOT EXISTS `role_permission` (
  `rpCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `permissionCode` bigint(20) NOT NULL,
  `roleCode` bigint(20) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`rpCode`),
  KEY `permissionCode` (`permissionCode`),
  KEY `roleCode` (`roleCode`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionCode`) REFERENCES `permission` (`permissionCode`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleCode`) REFERENCES `role` (`roleCode`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.role_permission: ~35 rows (approximately)
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` (`rpCode`, `permissionCode`, `roleCode`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(1, 1, 1, '2022-12-03 15:21:35', NULL, NULL),
	(2, 2, 1, '2022-12-03 15:21:35', NULL, NULL),
	(3, 3, 1, '2022-12-03 15:21:35', NULL, NULL),
	(4, 4, 1, '2022-12-03 15:21:35', NULL, NULL),
	(5, 5, 1, '2022-12-03 15:21:35', NULL, NULL),
	(6, 6, 1, '2022-12-03 15:21:35', NULL, NULL),
	(7, 7, 1, '2022-12-03 15:21:35', NULL, NULL),
	(8, 8, 1, '2022-12-03 15:21:35', NULL, NULL),
	(9, 9, 1, '2022-12-03 15:21:35', NULL, NULL),
	(10, 10, 1, '2022-12-03 15:21:35', NULL, NULL),
	(11, 11, 1, '2022-12-03 15:21:35', NULL, NULL),
	(12, 12, 1, '2022-12-03 15:21:35', NULL, NULL),
	(13, 13, 1, '2022-12-03 15:21:35', NULL, NULL),
	(14, 14, 1, '2022-12-03 15:21:35', NULL, NULL),
	(15, 15, 1, '2022-12-03 15:21:35', NULL, NULL),
	(16, 16, 1, '2022-12-03 15:21:35', NULL, NULL),
	(17, 17, 1, '2022-12-03 15:21:35', NULL, NULL),
	(18, 18, 1, '2022-12-03 15:21:35', NULL, NULL),
	(21, 19, 1, '2023-01-06 02:54:40', NULL, NULL),
	(22, 20, 1, '2023-01-06 02:54:40', NULL, NULL),
	(23, 21, 1, '2023-01-06 02:54:40', NULL, NULL),
	(24, 22, 1, '2023-01-06 02:54:40', NULL, NULL),
	(25, 23, 1, '2023-01-06 02:54:40', NULL, NULL),
	(26, 24, 1, '2023-01-06 02:54:40', NULL, NULL),
	(27, 25, 1, '2023-01-06 02:54:40', NULL, NULL),
	(28, 26, 1, '2023-01-06 02:54:40', NULL, NULL),
	(29, 27, 1, '2023-01-06 02:54:40', NULL, NULL),
	(30, 28, 1, '2023-01-06 02:54:40', NULL, NULL),
	(31, 29, 1, '2023-01-06 02:54:40', NULL, NULL),
	(32, 30, 1, '2023-01-06 02:54:40', NULL, NULL),
	(33, 31, 1, '2023-01-06 02:54:40', NULL, NULL),
	(34, 32, 1, '2023-01-06 02:54:40', NULL, NULL),
	(35, 33, 1, '2023-01-06 02:54:40', NULL, NULL),
	(36, 34, 1, '2023-01-06 02:54:40', NULL, NULL),
	(37, 35, 1, '2023-01-06 02:54:40', NULL, NULL);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;

-- Dumping structure for table barcode.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `ruCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `userCode` bigint(20) NOT NULL,
  `roleCode` bigint(20) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ruCode`),
  KEY `userCode` (`userCode`),
  KEY `roleCode` (`roleCode`),
  CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`userCode`) REFERENCES `user` (`userCode`),
  CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`roleCode`) REFERENCES `role` (`roleCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.role_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`ruCode`, `userCode`, `roleCode`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(1, 1, 1, '2022-12-03 15:27:19', NULL, NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table barcode.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplierCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(100) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`supplierCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.supplier: ~1 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`supplierCode`, `supplier`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(3, 'PT AAA', '2023-01-06 03:01:54', '2023-01-06 03:01:59', NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

-- Dumping structure for table barcode.unit
CREATE TABLE IF NOT EXISTS `unit` (
  `unitCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit` varchar(100) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`unitCode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.unit: ~2 rows (approximately)
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` (`unitCode`, `unit`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(3, 'PCS', '2023-01-06 02:59:38', NULL, NULL),
	(4, 'LUSIN', '2023-01-06 02:59:47', '2023-01-06 03:00:00', NULL);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;

-- Dumping structure for table barcode.user
CREATE TABLE IF NOT EXISTS `user` (
  `userCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isActive` varchar(1) NOT NULL,
  `status` enum('Public','Private') NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`userCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.user: ~1 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userCode`, `email`, `password`, `isActive`, `status`, `createAt`, `updateAt`, `deleteAt`) VALUES
	(1, 'su@mail.com', '$2y$10$DFb6nCJuFaJnY1PNv2SxquyH475AcKrUv7aCpHirlmm71nw9Xw/fu', '1', 'Private', '2022-12-03 15:20:58', NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table barcode.user_permission
CREATE TABLE IF NOT EXISTS `user_permission` (
  `upCode` bigint(20) NOT NULL AUTO_INCREMENT,
  `userCode` bigint(20) NOT NULL,
  `permissionCode` bigint(20) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`upCode`),
  KEY `userCode` (`userCode`),
  KEY `permissionCode` (`permissionCode`),
  CONSTRAINT `user_permission_ibfk_1` FOREIGN KEY (`userCode`) REFERENCES `user` (`userCode`),
  CONSTRAINT `user_permission_ibfk_2` FOREIGN KEY (`permissionCode`) REFERENCES `permission` (`permissionCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table barcode.user_permission: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permission` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
