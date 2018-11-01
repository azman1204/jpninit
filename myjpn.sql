/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.7.19 : Database - myjpn
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myjpn` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `myjpn`;

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `cat` varchar(20) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT 'see users.id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `articles` */

insert  into `articles`(`id`,`title`,`content`,`cat`,`status`,`created_by`,`created_at`,`updated_at`) values 
(1,'Test','<p><strong>test</strong></p>',NULL,NULL,NULL,'2018-10-31 01:48:18','2018-10-31 07:12:07'),
(2,'today in news','<p>test <strong>content</strong></p>',NULL,NULL,NULL,'2018-10-31 03:47:36','2018-10-31 07:11:47'),
(3,'xxx','xxx',NULL,NULL,NULL,'2018-10-31 03:47:44','2018-10-31 04:50:11'),
(4,'thestar news','<p>Couple die in Yosemite National Park while apparently taking selfie</p><figure class=\"image\"><img src=\"https://www.thestar.com.my/~/media/online/2018/10/31/01/36/selfiecouplewhodied31_0.ashx/?w=620&amp;h=413&amp;crop=1&amp;hash=0C28BE1D625E44F8DF560F73E3B961C56EC19F8C\" alt=\"An image of the couple posted to their Instagram page.PHOTO: INSTAGRAM\"><figcaption>Caption here</figcaption></figure><p>An image of the couple posted to their Instagram page.PHOTO: INSTAGRAM</p><p>LOS ANGELES (AFP): An Indian couple who fell to their deaths in California\'s Yosemite National Park were apparently taking a selfie, according to a family member and media reports.</p><p>Vishnu Viswanath, 29, and Meenakshi Moorthy, 30, died last week after falling from Taft Point - a popular overlook at the park that does not have a railing - and their bodies were recovered by park rangers last Thursday.</p>','2',NULL,1,'2018-10-31 06:56:12','2018-11-01 04:36:19'),
(5,'today in history','<p>test</p>','2',NULL,1,'2018-11-01 04:22:27','2018-11-01 04:23:05');

/*Table structure for table `edoc_cats` */

DROP TABLE IF EXISTS `edoc_cats`;

CREATE TABLE `edoc_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `edoc_cats` */

insert  into `edoc_cats`(`id`,`name`,`parent_id`) values 
(1,'A',NULL),
(2,'B',NULL),
(3,'A1',1),
(4,'A2',1),
(5,'B1',2),
(6,'B2',2);

/*Table structure for table `edocs` */

DROP TABLE IF EXISTS `edocs`;

CREATE TABLE `edocs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `descr` text,
  `doc_name` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `edocs` */

insert  into `edocs`(`id`,`id_cat`,`name`,`descr`,`doc_name`,`status`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,3,'Sample doc','sample doc desc','a1.doc','A',NULL,NULL,NULL,NULL);

/*Table structure for table `ref` */

DROP TABLE IF EXISTS `ref`;

CREATE TABLE `ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `ref` */

insert  into `ref`(`id`,`cat`,`code`,`descr`) values 
(1,'cms','1','News'),
(2,'cms','2','Blog'),
(3,'cms','3','Announcement'),
(4,'bangsa','M','Melayu'),
(5,'bangsa','C','Cina');

/*Table structure for table `todo_list` */

DROP TABLE IF EXISTS `todo_list`;

CREATE TABLE `todo_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `todo_list` */

insert  into `todo_list`(`id`,`name`,`description`,`created_at`,`updated_at`) values 
(2,'abu..','testing..','2018-10-30 16:17:56','2018-10-30 05:01:10'),
(3,'San Juan Vacation','vacation planning','2016-10-28 20:52:09','2018-10-29 20:52:09'),
(4,'Ronaldo','Juventus','2017-10-26 10:08:04',NULL),
(5,'John Terry','A Defender','2018-10-30 02:27:23','2018-10-30 02:27:23'),
(9,'testing','test123','2018-10-30 07:11:01','2018-10-30 07:11:08'),
(10,NULL,NULL,'2018-10-30 07:22:05','2018-10-30 07:22:05'),
(11,'asd','ad','2018-10-30 07:42:19','2018-10-30 07:42:19'),
(12,'test','test','2018-10-30 07:59:32','2018-10-30 07:59:32');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `userid` varchar(12) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `roles` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`userid`,`password`,`status`,`roles`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Azman Zakaria','azman','$2y$10$vs0cHB.BrEwcdp2PbiuFcuKyal8QlbjQCsPhzb9SCPATWSDi7WxoO','A','admin','VSyDNXJxIA5fqBX3pSs2iV9ob0Gq59JhOGI4aTjlkhJGR1RGHMlXPPVqjtab',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
