/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.19 : Database - dbprojectweb2
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbprojectweb21` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbprojectweb21`;

/*Table structure for table `kelas` */

DROP TABLE IF EXISTS `kelas`;

CREATE TABLE `kelas` (
  `idkelas` char(7) NOT NULL,
  `pemilikkelas` varchar(100) DEFAULT NULL,
  `namakelas` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`idkelas`),
  KEY `username` (`username`),
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kelas` */

LOCK TABLES `kelas` WRITE;

insert  into `kelas`(`idkelas`,`pemilikkelas`,`namakelas`,`username`,`tanggal`) values ('0000001','luthfiadit','matematika','luthfiadit','2023-12-21');

UNLOCK TABLES;

/*Table structure for table `nilai` */

DROP TABLE IF EXISTS `nilai`;

CREATE TABLE `nilai` (
  `idnilai` int(11) NOT NULL AUTO_INCREMENT,
  `idsoal` varchar(7) DEFAULT NULL,
  `jawaban` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idnilai`),
  KEY `idsoal` (`idsoal`),
  CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`idsoal`) REFERENCES `soal` (`idsoal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `nilai` */

LOCK TABLES `nilai` WRITE;

insert  into `nilai`(`idnilai`,`idsoal`,`jawaban`) values (1,'0000001','2'),(2,'0000002','5');

UNLOCK TABLES;

/*Table structure for table `quiz` */

DROP TABLE IF EXISTS `quiz`;

CREATE TABLE `quiz` (
  `idquiz` char(7) NOT NULL,
  `idkelas` char(7) DEFAULT NULL,
  `judulquis` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `batastanggal` date DEFAULT NULL,
  `batasjam` time DEFAULT NULL,
  PRIMARY KEY (`idquiz`),
  KEY `idkelas` (`idkelas`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`idkelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quiz` */

LOCK TABLES `quiz` WRITE;

insert  into `quiz`(`idquiz`,`idkelas`,`judulquis`,`tanggal`,`batastanggal`,`batasjam`) values ('0000001','0000001','quis mtk 1','2023-12-21','2023-12-22','12:00:00');

UNLOCK TABLES;

/*Table structure for table `soal` */

DROP TABLE IF EXISTS `soal`;

CREATE TABLE `soal` (
  `idsoal` char(7) NOT NULL,
  `idquiz` char(7) DEFAULT NULL,
  `judulsoal` varchar(500) DEFAULT NULL,
  `opsi1` varchar(500) DEFAULT NULL,
  `opsi2` varchar(500) DEFAULT NULL,
  `opsi3` varchar(500) DEFAULT NULL,
  `jawaban` varchar(500) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsoal`),
  KEY `idquiz` (`idquiz`),
  CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `soal` */

LOCK TABLES `soal` WRITE;

insert  into `soal`(`idsoal`,`idquiz`,`judulsoal`,`opsi1`,`opsi2`,`opsi3`,`jawaban`,`point`) values ('0000001','0000001','1 + 2 =','1','2','4','3',5),('0000002','0000001','2 + 3 = ','2','4','3','5',5);

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`username`,`nama`,`password`,`email`) values ('luthfiadit','luthfi','12345','luthfi@gmail.com');

UNLOCK TABLES;

/*Table structure for table `v_penilaian` */

DROP TABLE IF EXISTS `v_penilaian`;

/*!50001 DROP VIEW IF EXISTS `v_penilaian` */;
/*!50001 DROP TABLE IF EXISTS `v_penilaian` */;

/*!50001 CREATE TABLE  `v_penilaian`(
 `idsoal` varchar(7) ,
 `nama` varchar(100) ,
 `judulsoal` varchar(500) ,
 `jawaban` varchar(500) ,
 `jawabanbenar` varchar(500) ,
 `point` int(11) 
)*/;

/*View structure for view v_penilaian */

/*!50001 DROP TABLE IF EXISTS `v_penilaian` */;
/*!50001 DROP VIEW IF EXISTS `v_penilaian` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penilaian` AS select `nilai`.`idsoal` AS `idsoal`,`user`.`nama` AS `nama`,`soal`.`judulsoal` AS `judulsoal`,`nilai`.`jawaban` AS `jawaban`,`soal`.`jawaban` AS `jawabanbenar`,`soal`.`point` AS `point` from ((((`nilai` join `soal` on((`soal`.`idsoal` = `nilai`.`idsoal`))) join `quiz` on((`soal`.`idquiz` = `quiz`.`idquiz`))) join `kelas` on((`quiz`.`idkelas` = `kelas`.`idkelas`))) join `user` on((`kelas`.`username` = `user`.`username`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
