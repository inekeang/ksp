/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.5.28 : Database - ksp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ksp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ksp`;

/*Table structure for table `cicilan` */

DROP TABLE IF EXISTS `cicilan`;

CREATE TABLE `cicilan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) DEFAULT NULL,
  `pinjaman_id` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `cicilan` */

insert  into `cicilan`(`id`,`kode_nasabah`,`pinjaman_id`,`cicilan_ke`,`jumlah`,`tanggal`) values (1,'1001',2,1,132000,'2016-05-30'),(2,'1001',2,2,129600,'2016-06-06');

/*Table structure for table `denda` */

DROP TABLE IF EXISTS `denda`;

CREATE TABLE `denda` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) DEFAULT NULL,
  `pinjaman_id` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) DEFAULT NULL,
  `jumlah` float DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `denda` */

/*Table structure for table `keanggotaan` */

DROP TABLE IF EXISTS `keanggotaan`;

CREATE TABLE `keanggotaan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(100) DEFAULT NULL,
  `simpanan_pokok` int(11) DEFAULT NULL,
  `simpanan_wajib` int(11) DEFAULT NULL,
  `bunga_simpanan` float DEFAULT NULL,
  `bunga_pinjaman` float DEFAULT NULL,
  `denda_pinjaman` float DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `keanggotaan` */

insert  into `keanggotaan`(`id`,`jenis`,`simpanan_pokok`,`simpanan_wajib`,`bunga_simpanan`,`bunga_pinjaman`,`denda_pinjaman`,`keterangan`) values (1,'Masyarakat',5000,0,0.5,2,0.2,'Setelah simpanan di atas Rp. 1 juta'),(2,'Anggota',5000,50000,0.7,2,0.2,'Setelah ada saldo simpanan pokok'),(3,'Siswa',0,0,0,2,0.2,'Tanpa jasa');

/*Table structure for table `nasabah` */

DROP TABLE IF EXISTS `nasabah`;

CREATE TABLE `nasabah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `departemen` varchar(40) DEFAULT '',
  `alamat` varchar(200) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `keanggotaan_id` int(11) DEFAULT NULL,
  `tgl_masuk` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `nasabah` */

insert  into `nasabah`(`id`,`kode`,`nama`,`departemen`,`alamat`,`hp`,`keanggotaan_id`,`tgl_masuk`) values (1,'1001','Apo','0','Merr, Surabaya','',2,'2016-01-01'),(2,'1002','Inang','0','Tenggilis, Surabaya','',1,'2016-02-01'),(3,'1003','Mukidi','0','Pakis, Surabaya','',3,'2016-02-02');

/*Table structure for table `pinjaman` */

DROP TABLE IF EXISTS `pinjaman`;

CREATE TABLE `pinjaman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) NOT NULL DEFAULT '',
  `jenis` enum('Uang','Barang') NOT NULL,
  `jumlah` int(20) NOT NULL,
  `bunga` float DEFAULT NULL,
  `total_bayar` int(20) DEFAULT NULL,
  `lama` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pinjaman` */

insert  into `pinjaman`(`id`,`kode_nasabah`,`jenis`,`jumlah`,`bunga`,`total_bayar`,`lama`,`tanggal`,`status`) values (1,'1002','Uang',700000,2,742000,5,'2016-06-13','0'),(2,'1001','Uang',600000,2,636000,5,'2016-05-04','2');

/*Table structure for table `preference` */

DROP TABLE IF EXISTS `preference`;

CREATE TABLE `preference` (
  `attr` varchar(200) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `preference` */

insert  into `preference`(`attr`,`value`) values ('last_check_bunga','2016-06-01'),('kop_text','Karya Anak Bangsa'),('kop_koperasi','koperasi11.jpg'),('kop_logo','Karya_Anak_Bangsa.jpg'),('alamat','Jl. Raya Kalirungkut 7-9');

/*Table structure for table `simpanan` */

DROP TABLE IF EXISTS `simpanan`;

CREATE TABLE `simpanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_nasabah` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('Pokok','Wajib','Sukarela','Bunga','Ambil') NOT NULL,
  `jumlah` float NOT NULL,
  `sld` float DEFAULT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `simpanan` */

insert  into `simpanan`(`id`,`kode_nasabah`,`tanggal`,`jenis`,`jumlah`,`sld`,`created`) values (1,'1001','2016-01-03','Pokok',500,500,1464574067),(2,'1001','2016-01-03','Wajib',5000,5500,1464574089),(3,'1001','2016-01-03','Sukarela',3000000,3005500,1464574114),(4,'1001','2016-02-01','Pokok',500,3006000,1464574138),(5,'1001','2016-02-01','Wajib',5000,3011000,1464574154),(6,'1001','2016-05-30','Sukarela',1000000,4011000,1464574178),(7,'1001','2016-02-29','Ambil',-250000,3761000,1464574361),(8,'1002','2016-02-05','Pokok',500,500,1464574448),(9,'1002','2016-05-30','Sukarela',5000000,5000500,1464574468),(10,'1002','2016-03-01','Pokok',500,5001000,1464574487),(11,'1002','2016-03-01','Sukarela',5000000,10001000,1464574510),(12,'1003','2016-02-15','Sukarela',300000,300000,1464574552),(13,'1003','2016-03-15','Sukarela',500000,800000,1464574580),(14,'1001','2016-03-07','Ambil',-500000,3261000,1464574786),(15,'1001','2016-02-01','Sukarela',3500000,6761000,1464574841),(16,'1002','2016-06-01','Bunga',25002.5,10026000,1464755054),(17,'1002','2016-06-04','Pokok',500,10026500,1465003852);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `level` varchar(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`nama`,`level`,`username`,`password`) values (5,'Administrator','admin','662852c6ddb59def7792d9f5f0765122','0d1fd5ead0ba645b05b8c61c0d72cf46'),(6,'Teller','teller','8482dfb1bca15b503101eb438f52deed','8482dfb1bca15b503101eb438f52deed');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
