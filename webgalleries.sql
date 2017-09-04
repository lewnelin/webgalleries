-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.14 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para webgalleries
CREATE DATABASE IF NOT EXISTS `webgalleries` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `webgalleries`;

-- Copiando estrutura para tabela webgalleries.gallery
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dsName` varchar(50) NOT NULL,
  `dsLocation` varchar(50) DEFAULT NULL,
  `dtBegin` date NOT NULL,
  `dtEnd` date NOT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='galerias';

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela webgalleries.gallery_files
CREATE TABLE IF NOT EXISTS `gallery_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGallery` int(11) NOT NULL,
  `dsPath` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKGalleryFiles` (`idGallery`),
  CONSTRAINT `FKGalleryFiles` FOREIGN KEY (`idGallery`) REFERENCES `gallery` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='arquivos da galeria';

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela webgalleries.reserve
CREATE TABLE IF NOT EXISTS `reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idStand` int(11) NOT NULL,
  `dtBegin` date NOT NULL,
  `dtEnd` date NOT NULL,
  `tpStatus` enum('A','I') NOT NULL DEFAULT 'A' COMMENT 'Active or Inactive',
  PRIMARY KEY (`id`),
  KEY `FKStandReserve` (`idStand`),
  KEY `FKUserReserve` (`idUser`),
  CONSTRAINT `FKStandReserve` FOREIGN KEY (`idStand`) REFERENCES `stand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKUserReserve` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='reserva de salas';

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela webgalleries.stand
CREATE TABLE IF NOT EXISTS `stand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dsName` varchar(50) DEFAULT NULL,
  `idGallery` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKGalleryStand` (`idGallery`),
  CONSTRAINT `FKGalleryStand` FOREIGN KEY (`idGallery`) REFERENCES `gallery` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='salas';

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela webgalleries.stand_pictures
CREATE TABLE IF NOT EXISTS `stand_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idStand` int(11) NOT NULL,
  `dsPath` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKImageStand` (`idStand`),
  CONSTRAINT `FKImageStand` FOREIGN KEY (`idStand`) REFERENCES `stand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Fotos do estande';

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela webgalleries.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dsName` varchar(50) NOT NULL,
  `dsEmail` varchar(20) NOT NULL,
  `dsPassword` varchar(20) NOT NULL,
  `flAdmin` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='usuarios';

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
