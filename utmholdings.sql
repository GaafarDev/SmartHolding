-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for utmholdings
DROP DATABASE IF EXISTS `utmholdings`;
CREATE DATABASE IF NOT EXISTS `utmholdings` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `utmholdings`;

-- Dumping structure for table utmholdings.manager
DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '0',
  `firstname` varchar(255) NOT NULL DEFAULT '0',
  `lastname` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table utmholdings.manager: ~0 rows (approximately)
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` (`managerId`, `email`, `password`, `firstname`, `lastname`) VALUES
	(4, 'manager1@manager.com', '1234', 'Manager', 'Gigachad');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- Dumping structure for table utmholdings.rental
DROP TABLE IF EXISTS `rental`;
CREATE TABLE IF NOT EXISTS `rental` (
  `rentalId` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL DEFAULT 0,
  `roomId` int(11) NOT NULL DEFAULT 0,
  `rentalDate` date DEFAULT NULL,
  `rentalDateEnd` date DEFAULT NULL,
  PRIMARY KEY (`rentalId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table utmholdings.rental: ~0 rows (approximately)
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` (`rentalId`, `tenantId`, `roomId`, `rentalDate`, `rentalDateEnd`) VALUES
	(36, 28, 10, '2024-02-01', '2024-04-30');
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;

-- Dumping structure for table utmholdings.room
DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `roomId` int(11) NOT NULL AUTO_INCREMENT,
  `roomNo` varchar(50) DEFAULT NULL,
  `roomType` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table utmholdings.room: ~4 rows (approximately)
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`roomId`, `roomNo`, `roomType`, `price`) VALUES
	(6, 'T1-111', '1', 1600),
	(7, 'T2-1111', '2', 1800),
	(8, 'T3-1111', '3', 1600),
	(10, 'T2-1312', '2', 1700),
	(11, 'T4-1111', '4', 1800);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- Dumping structure for table utmholdings.tenant
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE IF NOT EXISTS `tenant` (
  `tenantId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL DEFAULT '0',
  `lastName` varchar(255) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tenantId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table utmholdings.tenant: ~2 rows (approximately)
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` (`tenantId`, `firstName`, `lastName`, `email`, `password`, `phone`) VALUES
	(27, 'John Johnnyy', 'Cena', 'tenant1@123', '123', '213'),
	(28, 'John', '1', 'tenant1@1234', '1234', '213'),
	(29, 'John', '2', 'tenant1@12345', '1234', ''),
	(30, '', '', '', '', '');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
