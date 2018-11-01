/*
SQLyog - Free MySQL GUI v5.14
Host - 5.5.8-log : Database - smk_v1
*********************************************************************
Server version : 5.5.8-log
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `smk_v1`;

USE `smk_v1`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `tb_agama` */

DROP TABLE IF EXISTS `tb_agama`;

CREATE TABLE `tb_agama` (
  `id_agama` int(11) NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_agama`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_aktiviti_log` */

DROP TABLE IF EXISTS `tb_aktiviti_log`;

CREATE TABLE `tb_aktiviti_log` (
  `id_aktiviti_log` int(11) NOT NULL AUTO_INCREMENT,
  `log_text` longtext,
  `date_time` datetime DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `browser_agent` longtext,
  `browser_ip` varchar(50) DEFAULT NULL,
  `post_data` longtext,
  `get_data` longtext,
  `session_data` longtext,
  `url` longtext,
  PRIMARY KEY (`id_aktiviti_log`) USING BTREE,
  UNIQUE KEY `id_aktiviti_log` (`id_aktiviti_log`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3940 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_berita` */

DROP TABLE IF EXISTS `tb_berita`;

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `tajuk` varchar(250) DEFAULT NULL,
  `berita` text,
  `date_entry` datetime DEFAULT NULL,
  `user_entry` varchar(200) DEFAULT NULL,
  `status_aktif` int(11) DEFAULT '1' COMMENT '0-not active, 1-active, 2-arkib',
  PRIMARY KEY (`id_berita`) USING BTREE,
  KEY `id_pengguna` (`user_entry`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_cawangan` */

DROP TABLE IF EXISTS `tb_cawangan`;

CREATE TABLE `tb_cawangan` (
  `kod_cawangan` varchar(12) DEFAULT NULL,
  `cawangan` varchar(100) DEFAULT NULL,
  `id_negeri` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_daerah` */

DROP TABLE IF EXISTS `tb_daerah`;

CREATE TABLE `tb_daerah` (
  `id_daerah` int(11) NOT NULL AUTO_INCREMENT,
  `id_negeri` int(11) DEFAULT NULL,
  `daerah` varchar(100) DEFAULT NULL,
  `kod` varchar(50) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_daerah`) USING BTREE,
  UNIQUE KEY `id_daerah` (`id_daerah`) USING BTREE,
  KEY `id_negeri` (`id_negeri`) USING BTREE,
  CONSTRAINT `tb_daerah_fk1` FOREIGN KEY (`id_negeri`) REFERENCES `tb_negeri` (`id_negeri`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_faq` */

DROP TABLE IF EXISTS `tb_faq`;

CREATE TABLE `tb_faq` (
  `id_faq` int(11) NOT NULL AUTO_INCREMENT,
  `soalan` text,
  `jawapan` text,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(100) DEFAULT NULL,
  `aktif` int(11) DEFAULT '1' COMMENT '1-aktif, 0-tidak aktif',
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_faq`) USING BTREE,
  UNIQUE KEY `id_faq` (`id_faq`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_gelaran` */

DROP TABLE IF EXISTS `tb_gelaran`;

CREATE TABLE `tb_gelaran` (
  `id_gelaran` int(11) NOT NULL AUTO_INCREMENT,
  `gelaran` varchar(100) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_gelaran`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_kategori_skim` */

DROP TABLE IF EXISTS `tb_kategori_skim`;

CREATE TABLE `tb_kategori_skim` (
  `id_kategori_skim` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_text` varchar(200) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  `color_code` varchar(100) DEFAULT NULL,
  `kod_skim_kategori` varchar(200) DEFAULT NULL,
  `skim_aktif` int(1) DEFAULT '1' COMMENT '1 = aktif, 0 = tidak aktif',
  PRIMARY KEY (`id_kategori_skim`) USING BTREE,
  UNIQUE KEY `id_kategori_skim` (`id_kategori_skim`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_keturunan` */

DROP TABLE IF EXISTS `tb_keturunan`;

CREATE TABLE `tb_keturunan` (
  `id_keturunan` int(11) NOT NULL AUTO_INCREMENT,
  `keturunan` varchar(100) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_keturunan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_konfigurasi` */

DROP TABLE IF EXISTS `tb_konfigurasi`;

CREATE TABLE `tb_konfigurasi` (
  `id_konfigurasi` int(10) NOT NULL AUTO_INCREMENT,
  `konfigurasi` varchar(100) DEFAULT NULL,
  `konf1` varchar(50) DEFAULT '0',
  `konf2` varchar(50) DEFAULT '0',
  `konf3` varchar(50) DEFAULT '0',
  `konf4` varchar(50) DEFAULT '0',
  `konf5` varchar(50) DEFAULT '0',
  `konf6` varchar(50) DEFAULT '0',
  `konf7` varchar(50) DEFAULT '0',
  `konf8` varchar(50) DEFAULT '0',
  `konf9` varchar(50) DEFAULT '0',
  `konf10` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id_konfigurasi`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_kumpulan` */

DROP TABLE IF EXISTS `tb_kumpulan`;

CREATE TABLE `tb_kumpulan` (
  `id_kumpulan` int(11) NOT NULL AUTO_INCREMENT,
  `kumpulan` varchar(200) DEFAULT NULL,
  `kod_kumpulan` varchar(20) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  `sokongan` int(11) DEFAULT '0' COMMENT '1-ya,0-tidak',
  PRIMARY KEY (`id_kumpulan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_lampiran` */

DROP TABLE IF EXISTS `tb_lampiran`;

CREATE TABLE `tb_lampiran` (
  `id_lampiran` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(250) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` text,
  `file_content` blob,
  `active` int(11) DEFAULT '1' COMMENT '0-no, 1-yes',
  `date_upload` datetime DEFAULT NULL,
  PRIMARY KEY (`id_lampiran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_login_log` */

DROP TABLE IF EXISTS `tb_login_log`;

CREATE TABLE `tb_login_log` (
  `id_login_log` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `agent` longtext,
  `ip` varchar(50) DEFAULT NULL,
  `username` longtext,
  `password` longtext,
  `status_text` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id_login_log`) USING BTREE,
  UNIQUE KEY `id_pengguna_log_new` (`id_login_log`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4809 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_negara` */

DROP TABLE IF EXISTS `tb_negara`;

CREATE TABLE `tb_negara` (
  `id_negara` int(5) NOT NULL AUTO_INCREMENT,
  `countryCode` char(2) NOT NULL DEFAULT '',
  `countryName` varchar(45) NOT NULL DEFAULT '',
  `currencyCode` char(3) DEFAULT NULL,
  `isoNumeric` char(4) DEFAULT NULL,
  PRIMARY KEY (`id_negara`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_negeri` */

DROP TABLE IF EXISTS `tb_negeri`;

CREATE TABLE `tb_negeri` (
  `id_negeri` int(11) NOT NULL AUTO_INCREMENT,
  `negeri` varchar(100) DEFAULT NULL,
  `kod` varchar(20) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  `kod_negeri` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_negeri`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_oku` */

DROP TABLE IF EXISTS `tb_oku`;

CREATE TABLE `tb_oku` (
  `id_oku` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_oku`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_panggilan` */

DROP TABLE IF EXISTS `tb_panggilan`;

CREATE TABLE `tb_panggilan` (
  `id_panggilan` int(11) NOT NULL AUTO_INCREMENT,
  `panggilan` varchar(100) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_panggilan`) USING BTREE,
  UNIQUE KEY `id_panggilan` (`id_panggilan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pengguna` */

DROP TABLE IF EXISTS `tb_pengguna`;

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `nokp` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `nama` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `id_penjawatan_skim` int(11) DEFAULT NULL,
  `status_aktif` int(11) DEFAULT '1' COMMENT '1-aktif, 0-tidak aktif',
  `jenis_pengguna` int(11) DEFAULT '3' COMMENT '0-BTM, 1-HR HQ, 2-HR Bahagin/Cawangan, 3-Staff',
  `konsol_pentadbir` int(11) DEFAULT '0' COMMENT '0-tidak, 1-ya',
  `id_tempat_bertugas` int(11) DEFAULT NULL,
  `id_penjawatan_skim_rekod` int(11) DEFAULT NULL COMMENT 'simpan id waran',
  `id_panggilan` int(11) DEFAULT NULL,
  `id_gelaran` int(11) DEFAULT NULL,
  `id_agama` int(11) DEFAULT NULL,
  `id_keturunan` int(11) DEFAULT NULL,
  `id_ketua` int(11) DEFAULT NULL,
  `id_negeri_kelahiran` int(11) DEFAULT NULL,
  `katalaluan` longtext CHARACTER SET latin1,
  `t_lahir` datetime DEFAULT NULL,
  `jantina` int(11) DEFAULT '1' COMMENT '0-p, 1-l',
  `id_takaktif` int(11) DEFAULT NULL,
  `taraf_perkahwinan` int(11) DEFAULT '0' COMMENT '0-bujang,1-berkahwin,2-duda/janda',
  `oku` int(11) DEFAULT '0' COMMENT '0-tidak,1-ya',
  `tel_pejabat` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `tel_faks` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `tel_bimbit` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `tel_rumah` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `namawaris` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `pekerjaanwaris` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `jawatanwaris` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `hubunganwaris` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `tarikhlahirwaris` datetime DEFAULT NULL,
  `alamatwaris` text CHARACTER SET latin1,
  `alamatbertugaswaris` text CHARACTER SET latin1,
  `tel_pejabatwaris` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `tel_rumahwaris` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `tel_bimbitwaris` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `kementerian` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `jabatan` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `pekerjaan` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `tarafperkhidmatan` int(11) DEFAULT '1' COMMENT '0-Percubaan, 1-Tetap, 2-Sementara, 3-Kontrak, 4-Sambilan, 5-Sangkut',
  `tangga_gaji` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '0-Percubaan, 1-Tetap, 2-Sementara, 3-Kontrak, 4-Sambilan, 5-Sangkut',
  `alamat_emel` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `alamat_pejabat` text CHARACTER SET latin1,
  `fail_peribadi` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `alamat_rumah` text CHARACTER SET latin1,
  `lokaliti` int(11) DEFAULT '0' COMMENT '0-semenanjung, 1-sabah, 2-sarawak',
  `t_akhirkemaskini` datetime DEFAULT NULL,
  `notifikasi_email` int(11) DEFAULT '1' COMMENT '0-no, 1-yes',
  `t_lantikan` datetime DEFAULT NULL,
  `t_keluar` datetime DEFAULT NULL,
  `bml` int(11) DEFAULT NULL,
  `bmp` int(11) DEFAULT NULL,
  `bil` int(11) DEFAULT NULL,
  `bip` int(11) DEFAULT NULL,
  `lll` int(11) DEFAULT NULL,
  `llp` int(11) DEFAULT NULL,
  `llbahasa` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `gambar_base64` longtext,
  `no_rujukan_jpa` varchar(200) DEFAULT NULL,
  `no_rujukan_jabatan` varchar(200) DEFAULT NULL,
  `alamat_emel_peribadi` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `nokp_waris` varchar(15) DEFAULT NULL,
  `bilanak_waris` int(11) DEFAULT '0',
  `gaji_waris` float(9,2) DEFAULT NULL,
  `oku_rujukan` varchar(200) DEFAULT NULL,
  `id_negeri_pilihan1` int(11) DEFAULT NULL,
  `id_negeri_pilihan2` int(11) DEFAULT NULL,
  `id_skim` int(11) DEFAULT NULL,
  `oku_catatan` varchar(200) DEFAULT NULL,
  `id_oku` int(11) DEFAULT NULL,
  `t_lantikan_pertama` datetime DEFAULT NULL,
  `t_sah_pertama` datetime DEFAULT NULL,
  `pasangan_hubungan` int(11) DEFAULT '1' COMMENT '1-suami,0-isteri',
  `pasangan_nokp` varchar(15) DEFAULT NULL,
  `pasangan_nama` varchar(200) DEFAULT NULL,
  `pasangan_tel_rumah` varchar(15) DEFAULT NULL,
  `pasangan_tel_bimbit` varchar(15) DEFAULT NULL,
  `pasangan_pekerjaan` int(11) DEFAULT NULL COMMENT '1. Awam 2.Swasta 3.Tidak Berkenaan',
  `pasangan_jawatan` varchar(100) DEFAULT NULL,
  `pasangan_majikan` varchar(100) DEFAULT NULL,
  `pasangan_alamat_pejabat` longtext,
  `pasangan_id_negeri` int(11) DEFAULT NULL COMMENT 'id negeri utk pasangan',
  `pasangan_id_daerah` int(11) DEFAULT NULL,
  `pasangan_tel_pejabat` varchar(15) DEFAULT NULL,
  `pasangan_emel` varchar(100) DEFAULT NULL,
  `pasangan_gaji` float(9,2) DEFAULT NULL,
  `pasangan_oku` int(11) DEFAULT '0' COMMENT '1-oku,0-not oku',
  `pasangan_oku_rujukan` varchar(200) DEFAULT NULL,
  `pasangan_oku_catatan` longtext,
  `pasangan_id_oku` int(11) DEFAULT NULL,
  `anak_oku` int(11) DEFAULT '0' COMMENT '0-no,1-yes',
  `anak_oku_rujukan` varchar(200) DEFAULT NULL,
  `anak_oku_catatan` longtext,
  `anak_id_oku` int(11) DEFAULT NULL,
  `anak_jumlah` int(11) DEFAULT NULL,
  `urine_test` int(11) DEFAULT '0' COMMENT '0-tidak berkenaan, 1-lulus, 2-kandas',
  `urine_tarikh` datetime DEFAULT NULL,
  `urine_catatan` longtext,
  `psikometric_result` varchar(100) DEFAULT NULL,
  `psikometric_catatan` longtext,
  `tarikh_daftar` datetime DEFAULT NULL,
  `tarikh_kemaskini` datetime DEFAULT NULL,
  `ulasan_penjawatan` longtext,
  `ulasan_pinjaman` int(11) DEFAULT '0' COMMENT '0-tidak, 1-pinjaman',
  `no_kwsp` int(6) DEFAULT NULL,
  `acc_bank` int(12) DEFAULT NULL,
  `gaji_no` int(12) DEFAULT NULL,
  `bank_no` int(12) DEFAULT NULL,
  `bank_jenis_akaun` int(11) DEFAULT '1' COMMENT '1- simpanan 2- semasa',
  `bank_nama` varchar(100) DEFAULT NULL,
  `bank_alamat` longtext,
  `bank_id_negeri` int(11) DEFAULT NULL,
  `bank_id_daerah` int(11) DEFAULT NULL,
  `pertukaran_indicator` int(2) DEFAULT NULL,
  `t_sah_semasa` datetime DEFAULT NULL COMMENT 'tarikh sah gred semasa',
  `t_perkahwinan` datetime DEFAULT NULL COMMENT 'tarikh perkahwinan',
  `t_pasangan_bertugas` datetime DEFAULT NULL,
  `t_bertugas` datetime DEFAULT NULL,
  `kelas_lesen_memandu` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`) USING BTREE,
  UNIQUE KEY `id_pengguna` (`id_pengguna`) USING BTREE,
  KEY `id_panggilan` (`id_panggilan`) USING BTREE,
  KEY `id_gelaran` (`id_gelaran`) USING BTREE,
  KEY `id_agama` (`id_agama`) USING BTREE,
  KEY `id_keturunan` (`id_keturunan`) USING BTREE,
  KEY `id_takaktif` (`id_takaktif`) USING BTREE,
  KEY `id_penjawatan` (`id_penjawatan_skim`) USING BTREE,
  KEY `id_ketua` (`id_ketua`) USING BTREE,
  KEY `id_negeri_kelahiran` (`id_negeri_kelahiran`) USING BTREE,
  KEY `id_skim` (`id_skim`) USING BTREE,
  KEY `pasangan_id_daerah` (`pasangan_id_daerah`) USING BTREE,
  KEY `id_tempat_bertugas` (`id_tempat_bertugas`) USING BTREE,
  CONSTRAINT `tb_pengguna_fk1` FOREIGN KEY (`id_panggilan`) REFERENCES `tb_panggilan` (`id_panggilan`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_pengguna_fk10` FOREIGN KEY (`pasangan_id_daerah`) REFERENCES `tb_daerah` (`id_daerah`) ON DELETE CASCADE ON UPDATE SET NULL,
  CONSTRAINT `tb_pengguna_fk2` FOREIGN KEY (`id_gelaran`) REFERENCES `tb_gelaran` (`id_gelaran`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_pengguna_fk3` FOREIGN KEY (`id_agama`) REFERENCES `tb_agama` (`id_agama`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_pengguna_fk4` FOREIGN KEY (`id_keturunan`) REFERENCES `tb_keturunan` (`id_keturunan`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_pengguna_fk5` FOREIGN KEY (`id_negeri_kelahiran`) REFERENCES `tb_negeri` (`id_negeri`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tb_pengguna_fk6` FOREIGN KEY (`id_penjawatan_skim`) REFERENCES `tb_penjawatan_skim` (`id_penjawatan_skim`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_pengguna_fk7` FOREIGN KEY (`id_tempat_bertugas`) REFERENCES `tb_tempat_bertugas` (`id_tempat_bertugas`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_pengguna_fk8` FOREIGN KEY (`id_ketua`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_pengguna_fk9` FOREIGN KEY (`id_skim`) REFERENCES `tb_skim` (`id_skim`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_pengguna_kelulusan` */

DROP TABLE IF EXISTS `tb_pengguna_kelulusan`;

CREATE TABLE `tb_pengguna_kelulusan` (
  `id_pengguna_kelulusan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` int(11) DEFAULT NULL,
  `kelulusan` varchar(100) DEFAULT NULL,
  `inst` varchar(200) DEFAULT NULL,
  `bidang` varchar(100) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `pencapaian` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna_kelulusan`) USING BTREE,
  KEY `FK__tb_pengguna` (`id_pengguna`) USING BTREE,
  CONSTRAINT `FK__tb_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pengguna_log` */

DROP TABLE IF EXISTS `tb_pengguna_log`;

CREATE TABLE `tb_pengguna_log` (
  `id_pengguna_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `agent` longtext,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna_log`) USING BTREE,
  UNIQUE KEY `id_pengguna_log` (`id_pengguna_log`) USING BTREE,
  KEY `id_pengguna` (`id_pengguna`) USING BTREE,
  CONSTRAINT `tb_pengguna_log_fk1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3275 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_penjawatan` */

DROP TABLE IF EXISTS `tb_penjawatan`;

CREATE TABLE `tb_penjawatan` (
  `id_penjawatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_warran_penjawatan` int(11) DEFAULT NULL,
  `jawatan` varchar(200) DEFAULT NULL,
  `jawatan_paparan` varchar(200) DEFAULT NULL,
  `no_butiran` int(11) DEFAULT NULL,
  `kup` int(11) DEFAULT NULL,
  `nota` longtext,
  PRIMARY KEY (`id_penjawatan`) USING BTREE,
  UNIQUE KEY `id_penjawatan` (`id_penjawatan`) USING BTREE,
  KEY `id_penjawatan_lokasi` (`id_warran_penjawatan`) USING BTREE,
  CONSTRAINT `tb_penjawatan_fk1` FOREIGN KEY (`id_warran_penjawatan`) REFERENCES `tb_warran_penjawatan` (`id_warran_penjawatan`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_penjawatan_pengguna` */

DROP TABLE IF EXISTS `tb_penjawatan_pengguna`;

CREATE TABLE `tb_penjawatan_pengguna` (
  `id_penjawatan_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` int(11) DEFAULT NULL,
  `id_penjawatan_skim_rekod` int(11) DEFAULT NULL,
  `aktif` int(11) DEFAULT NULL,
  `nota` text,
  PRIMARY KEY (`id_penjawatan_pengguna`),
  UNIQUE KEY `id_penjawatan_skim_rekod` (`id_penjawatan_pengguna`),
  KEY `id_penjawatan_skim` (`id_penjawatan_skim_rekod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_penjawatan_skim` */

DROP TABLE IF EXISTS `tb_penjawatan_skim`;

CREATE TABLE `tb_penjawatan_skim` (
  `id_penjawatan_skim` int(11) NOT NULL AUTO_INCREMENT,
  `id_penjawatan` int(11) DEFAULT NULL,
  `id_skim` int(11) DEFAULT NULL,
  `aktif` int(11) DEFAULT '0',
  `optional` int(11) DEFAULT '0' COMMENT '0-no,1-yes (if count or average)',
  PRIMARY KEY (`id_penjawatan_skim`) USING BTREE,
  UNIQUE KEY `id_penjawatan_skim` (`id_penjawatan_skim`) USING BTREE,
  KEY `id_penjawatan` (`id_penjawatan`) USING BTREE,
  KEY `id_skim` (`id_skim`) USING BTREE,
  CONSTRAINT `tb_penjawatan_skim_fk1` FOREIGN KEY (`id_penjawatan`) REFERENCES `tb_penjawatan` (`id_penjawatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_penjawatan_skim_fk2` FOREIGN KEY (`id_skim`) REFERENCES `tb_skim` (`id_skim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1996 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_penjawatan_skim_rekod` */

DROP TABLE IF EXISTS `tb_penjawatan_skim_rekod`;

CREATE TABLE `tb_penjawatan_skim_rekod` (
  `id_penjawatan_skim_rekod` int(11) NOT NULL AUTO_INCREMENT,
  `id_penjawatan_skim` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT '0',
  `jum_jawatan` int(11) DEFAULT '0',
  `aktif` int(11) DEFAULT '0' COMMENT '1-aktif utk tahun, 0-tidak aktif',
  `nota` text,
  `jum_isi` int(11) DEFAULT '0' COMMENT 'jum pengisian ikut skim',
  `jum_isi_waran` int(11) DEFAULT '0' COMMENT 'jum isi terkini ikut waran jawatan ',
  `catatan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_penjawatan_skim_rekod`) USING BTREE,
  UNIQUE KEY `id_penjawatan_skim_rekod` (`id_penjawatan_skim_rekod`) USING BTREE,
  KEY `id_penjawatan_skim` (`id_penjawatan_skim`) USING BTREE,
  CONSTRAINT `tb_penjawatan_skim_rekod_fk1` FOREIGN KEY (`id_penjawatan_skim`) REFERENCES `tb_penjawatan_skim` (`id_penjawatan_skim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1737 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_penjawatan_skim_rekod 2017` */

DROP TABLE IF EXISTS `tb_penjawatan_skim_rekod 2017`;

CREATE TABLE `tb_penjawatan_skim_rekod 2017` (
  `id_penjawatan_skim_rekod` int(11) NOT NULL AUTO_INCREMENT,
  `id_penjawatan_skim` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT '0',
  `jum_jawatan` int(11) DEFAULT '0' COMMENT '0-tidak aktif, 1-aktif rekod',
  `aktif` int(11) DEFAULT '0' COMMENT '1-aktif utk tahun, 0-tidak aktif',
  `nota` text,
  `jum_isi` int(11) DEFAULT NULL COMMENT 'baki yg available',
  PRIMARY KEY (`id_penjawatan_skim_rekod`),
  UNIQUE KEY `id_penjawatan_skim_rekod` (`id_penjawatan_skim_rekod`),
  KEY `id_penjawatan_skim` (`id_penjawatan_skim`)
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_penjawatan_skim_rekod_archieve` */

DROP TABLE IF EXISTS `tb_penjawatan_skim_rekod_archieve`;

CREATE TABLE `tb_penjawatan_skim_rekod_archieve` (
  `id_penjawatan_skim_rekod` int(11) NOT NULL AUTO_INCREMENT,
  `id_penjawatan_skim` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT '0',
  `jum_jawatan` int(11) DEFAULT '0' COMMENT '0-tidak aktif, 1-aktif rekod',
  `aktif` int(11) DEFAULT '0' COMMENT '1-aktif utk tahun, 0-tidak aktif',
  `nota` text,
  `jum_isi` int(11) DEFAULT NULL COMMENT 'baki yg available',
  PRIMARY KEY (`id_penjawatan_skim_rekod`),
  UNIQUE KEY `id_penjawatan_skim_rekod` (`id_penjawatan_skim_rekod`),
  KEY `id_penjawatan_skim` (`id_penjawatan_skim`)
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_persaudaraan` */

DROP TABLE IF EXISTS `tb_persaudaraan`;

CREATE TABLE `tb_persaudaraan` (
  `id_persaudaraan` int(11) NOT NULL AUTO_INCREMENT,
  `persaudaraan_text` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_persaudaraan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_pertukaran_keputusan` */

DROP TABLE IF EXISTS `tb_pertukaran_keputusan`;

CREATE TABLE `tb_pertukaran_keputusan` (
  `id_mohon` int(10) NOT NULL,
  `bilmesy` int(10) DEFAULT NULL,
  `tarikhmesy` date DEFAULT NULL,
  `keputusan` int(2) DEFAULT NULL,
  `tarikhkuatkuasa` date DEFAULT NULL,
  PRIMARY KEY (`id_mohon`),
  CONSTRAINT `fk_idmohon` FOREIGN KEY (`id_mohon`) REFERENCES `tb_pertukaran_mohon` (`id_mohon`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pertukaran_mohon` */

DROP TABLE IF EXISTS `tb_pertukaran_mohon`;

CREATE TABLE `tb_pertukaran_mohon` (
  `id_mohon` int(10) NOT NULL,
  `nokp` varchar(15) DEFAULT NULL,
  `negeri1` int(2) DEFAULT NULL,
  `jpn1` int(3) DEFAULT NULL,
  `negeri2` int(2) DEFAULT NULL,
  `jpn2` int(3) DEFAULT NULL,
  `negeri3` int(2) DEFAULT NULL,
  `jpn3` int(3) DEFAULT NULL,
  `id_alasan_sub1` int(2) DEFAULT NULL,
  `id_alasan_sub2` int(2) DEFAULT NULL,
  `id_alasan_sub3` int(2) DEFAULT NULL,
  `id_penyeliasokong` char(2) DEFAULT NULL,
  `ulasanpengarah` int(2) DEFAULT NULL,
  `tkh_mohon` date DEFAULT NULL,
  `id_ref_statusmohon` int(2) DEFAULT NULL,
  `id_status` int(2) DEFAULT NULL,
  `dokumen_sokongan` varchar(250) DEFAULT NULL,
  `ulasanpenyelia_tidaksokong` varchar(50) DEFAULT NULL,
  `ulasanpengarah_tidaksokong` varchar(50) DEFAULT NULL,
  `bil_mesy` char(5) DEFAULT NULL,
  `tkh_mesy` date DEFAULT NULL,
  `keputusan_mesy` int(2) DEFAULT NULL,
  `tkh_kuatkuasa_arahan` date DEFAULT NULL,
  `catatan_lainlain` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_mohon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pertukaran_ref_alasan` */

DROP TABLE IF EXISTS `tb_pertukaran_ref_alasan`;

CREATE TABLE `tb_pertukaran_ref_alasan` (
  `id_alasan` int(2) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_alasan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pertukaran_ref_alasansub` */

DROP TABLE IF EXISTS `tb_pertukaran_ref_alasansub`;

CREATE TABLE `tb_pertukaran_ref_alasansub` (
  `id_alasan_sub` int(4) NOT NULL,
  `id_alasan` int(2) DEFAULT NULL,
  `nama` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_alasan_sub`),
  KEY `fk_alasan` (`id_alasan`),
  CONSTRAINT `fk_alasan` FOREIGN KEY (`id_alasan`) REFERENCES `tb_pertukaran_ref_alasan` (`id_alasan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pertukaran_ref_route_status` */

DROP TABLE IF EXISTS `tb_pertukaran_ref_route_status`;

CREATE TABLE `tb_pertukaran_ref_route_status` (
  `id_route` int(11) NOT NULL AUTO_INCREMENT,
  `route_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_route`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pertukaran_ref_status` */

DROP TABLE IF EXISTS `tb_pertukaran_ref_status`;

CREATE TABLE `tb_pertukaran_ref_status` (
  `id_status` int(2) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pertukaran_ref_statusmohon` */

DROP TABLE IF EXISTS `tb_pertukaran_ref_statusmohon`;

CREATE TABLE `tb_pertukaran_ref_statusmohon` (
  `id_ref_statusmohon` int(2) DEFAULT NULL,
  `nama` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pertukaran_ref_ulasan` */

DROP TABLE IF EXISTS `tb_pertukaran_ref_ulasan`;

CREATE TABLE `tb_pertukaran_ref_ulasan` (
  `id_ulasan` int(2) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_pertukaran_route_status_sub` */

DROP TABLE IF EXISTS `tb_pertukaran_route_status_sub`;

CREATE TABLE `tb_pertukaran_route_status_sub` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `id_route` int(11) DEFAULT NULL,
  `status_details` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_status`),
  KEY `fk_idroute` (`id_route`),
  CONSTRAINT `fk_idroute` FOREIGN KEY (`id_route`) REFERENCES `tb_pertukaran_ref_route_status` (`id_route`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_rep_ringkasanpenjawatan` */

DROP TABLE IF EXISTS `tb_rep_ringkasanpenjawatan`;

CREATE TABLE `tb_rep_ringkasanpenjawatan` (
  `id_penjawatan_skim_rekod` int(11) NOT NULL,
  `catatan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_setting` */

DROP TABLE IF EXISTS `tb_setting`;

CREATE TABLE `tb_setting` (
  `id_setting` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(20) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id_setting`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_skim` */

DROP TABLE IF EXISTS `tb_skim`;

CREATE TABLE `tb_skim` (
  `id_skim` int(11) NOT NULL AUTO_INCREMENT,
  `id_kumpulan` int(11) DEFAULT NULL,
  `id_kategori_skim` int(11) DEFAULT NULL,
  `kod_skim` varchar(20) DEFAULT NULL,
  `kod_s` varchar(20) DEFAULT NULL,
  `no_s` int(11) DEFAULT NULL,
  `nama_skim` varchar(200) DEFAULT NULL,
  `gelaran_skim` varchar(20) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  `no_kod_skim` varchar(20) DEFAULT NULL,
  `jenis_skim` int(11) DEFAULT '0' COMMENT '0-GL Gred Lantikan, 1-GNP Gred Naik Pangkat',
  `skim_perkhidmatan` int(11) DEFAULT '0' COMMENT '0-Skim Tertutup, 1-Skim Gunasama',
  PRIMARY KEY (`id_skim`) USING BTREE,
  KEY `id_kumpulan` (`id_kumpulan`) USING BTREE,
  KEY `id_kategori_skim` (`id_kategori_skim`) USING BTREE,
  CONSTRAINT `tb_skim_fk` FOREIGN KEY (`id_kumpulan`) REFERENCES `tb_kumpulan` (`id_kumpulan`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_skim_fk1` FOREIGN KEY (`id_kategori_skim`) REFERENCES `tb_kategori_skim` (`id_kategori_skim`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_takaktif` */

DROP TABLE IF EXISTS `tb_takaktif`;

CREATE TABLE `tb_takaktif` (
  `id_takaktif` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_takaktif` varchar(100) DEFAULT NULL,
  `masih_kakitangan` int(11) DEFAULT '1',
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_takaktif`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_tempat_bertugas` */

DROP TABLE IF EXISTS `tb_tempat_bertugas`;

CREATE TABLE `tb_tempat_bertugas` (
  `id_tempat_bertugas` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT NULL,
  `id_tempat_bertugas_jenis` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  `aktif` int(11) DEFAULT '1' COMMENT '1-aktif,0-tidak aktif',
  `selectable` int(11) DEFAULT '0' COMMENT '1-can be select, 0-node',
  `alamat` text,
  `id_pengguna_ketua` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tempat_bertugas`) USING BTREE,
  UNIQUE KEY `id_tempat_bertugas` (`id_tempat_bertugas`) USING BTREE,
  KEY `id_pengguna_ketua` (`id_pengguna_ketua`) USING BTREE,
  CONSTRAINT `tb_tempat_bertugas_fk1` FOREIGN KEY (`id_pengguna_ketua`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=553 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_tempat_bertugas_jenis` */

DROP TABLE IF EXISTS `tb_tempat_bertugas_jenis`;

CREATE TABLE `tb_tempat_bertugas_jenis` (
  `id_tempat_bertugas_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(100) DEFAULT NULL,
  `aktif` int(11) DEFAULT '1',
  `created_datetime` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `modified_datetime` int(11) DEFAULT NULL,
  `modified_by` datetime DEFAULT NULL,
  `sort_no` int(11) DEFAULT '0',
  PRIMARY KEY (`id_tempat_bertugas_jenis`) USING BTREE,
  UNIQUE KEY `id_tempat_bertugas_type` (`id_tempat_bertugas_jenis`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_tempat_bertugas_pengguna` */

DROP TABLE IF EXISTS `tb_tempat_bertugas_pengguna`;

CREATE TABLE `tb_tempat_bertugas_pengguna` (
  `id_tempat_bertugas_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `id_tempat_bertugas` int(11) DEFAULT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `tarikh_lapor_diri` datetime DEFAULT NULL,
  `tarikh_keluar` datetime DEFAULT NULL,
  `semasa` int(11) DEFAULT '0' COMMENT '0-sejarah,1-semasa',
  `id_skim_pengguna` int(11) DEFAULT NULL,
  `id_penjawatan_pengguna` int(11) DEFAULT NULL COMMENT 'pegang id penjawatan',
  `ind_penempatan` int(11) DEFAULT NULL COMMENT '1- lantikan Baru 2-Naik pangkat 3-Pertukaran',
  `tkh_lantik_nkpgkt` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tempat_bertugas_pengguna`) USING BTREE,
  UNIQUE KEY `id_tempat_bertugas_pengguna` (`id_tempat_bertugas_pengguna`) USING BTREE,
  KEY `id_pengguna` (`id_pengguna`) USING BTREE,
  KEY `id_tempat_bertugas` (`id_tempat_bertugas`) USING BTREE,
  KEY `id_skim_pengguna` (`id_skim_pengguna`) USING BTREE,
  CONSTRAINT `tb_tempat_bertugas_pengguna_fk1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_tempat_bertugas_pengguna_fk2` FOREIGN KEY (`id_tempat_bertugas`) REFERENCES `tb_tempat_bertugas` (`id_tempat_bertugas`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tb_tempat_bertugas_pengguna_fk3` FOREIGN KEY (`id_skim_pengguna`) REFERENCES `tb_skim` (`id_skim`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_warran_penjawatan` */

DROP TABLE IF EXISTS `tb_warran_penjawatan`;

CREATE TABLE `tb_warran_penjawatan` (
  `id_warran_penjawatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `kod` varchar(20) DEFAULT '0',
  `aktif` int(11) DEFAULT '1' COMMENT '1-aktif,0-tidak aktif',
  `selectable` int(11) DEFAULT '0' COMMENT '1-can be select, 0-node',
  `program` int(11) DEFAULT '0' COMMENT '0-bukan program, 1-program',
  PRIMARY KEY (`id_warran_penjawatan`) USING BTREE,
  UNIQUE KEY `id_tempat_bertugas_new` (`id_warran_penjawatan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

/*Table structure for table `v_perjawatan` */

DROP TABLE IF EXISTS `v_perjawatan`;

DROP VIEW IF EXISTS `v_perjawatan`;

CREATE TABLE `v_perjawatan` (
  `id_penjawatan_skim_rekod` int(11) NOT NULL DEFAULT '0',
  `id_penjawatan` int(11) DEFAULT NULL,
  `id_skim` int(11) DEFAULT NULL,
  `jawatan` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `id_penjawatan_skim` int(11) DEFAULT NULL,
  `kod_skim` varchar(20) DEFAULT NULL,
  `id_kategori_skim` int(11) NOT NULL DEFAULT '0',
  `jum_jawatan` int(11) DEFAULT '0',
  `jum_isi_waran` int(11) DEFAULT '0' COMMENT 'jum isi terkini ikut waran jawatan ',
  `kekosongan` bigint(12) DEFAULT NULL,
  `optional` int(11) DEFAULT '0' COMMENT '0-no,1-yes (if count or average)',
  `catatan` varchar(200) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `v_ringkasanperjawatan` */

DROP TABLE IF EXISTS `v_ringkasanperjawatan`;

DROP VIEW IF EXISTS `v_ringkasanperjawatan`;

CREATE TABLE `v_ringkasanperjawatan` (
  `id_penjawatan_skim_rekod` int(11) NOT NULL DEFAULT '0',
  `id_penjawatan` int(11) DEFAULT NULL,
  `id_skim` int(11) DEFAULT NULL,
  `jawatan` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `id_penjawatan_skim` int(11) DEFAULT NULL,
  `jum_jawatan` int(11) DEFAULT '0',
  `jum_isi_waran` int(11) DEFAULT '0' COMMENT 'jum isi terkini ikut waran jawatan ',
  `kekosongan` bigint(12) DEFAULT NULL,
  `optional` int(11) DEFAULT '0' COMMENT '0-no,1-yes (if count or average)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*View structure for view `v_perjawatan` */

drop view if exists `v_perjawatan`;

drop table if exists `v_perjawatan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`fazilah`@`10.23.165.111` SQL SECURITY DEFINER VIEW `v_perjawatan` AS (select `a`.`id_penjawatan_skim_rekod` AS `id_penjawatan_skim_rekod`,`b`.`id_penjawatan` AS `id_penjawatan`,`b`.`id_skim` AS `id_skim`,`d`.`jawatan` AS `jawatan`,`a`.`id_penjawatan_skim` AS `id_penjawatan_skim`,`c`.`kod_skim` AS `kod_skim`,`e`.`id_kategori_skim` AS `id_kategori_skim`,`a`.`jum_jawatan` AS `jum_jawatan`,`a`.`jum_isi_waran` AS `jum_isi_waran`,(`a`.`jum_jawatan` - `a`.`jum_isi_waran`) AS `kekosongan`,`b`.`optional` AS `optional`,`a`.`catatan` AS `catatan` from ((((`tb_penjawatan_skim_rekod` `a` join `tb_penjawatan_skim` `b`) join `tb_skim` `c`) join `tb_penjawatan` `d`) join `tb_kategori_skim` `e`) where ((`a`.`id_penjawatan_skim` = `b`.`id_penjawatan_skim`) and (`d`.`id_penjawatan` = `b`.`id_penjawatan`) and (`c`.`id_skim` = `b`.`id_skim`) and (`c`.`id_kategori_skim` = `e`.`id_kategori_skim`) and (`a`.`tahun` = '2018') and (`a`.`aktif` = '1')) group by `b`.`id_penjawatan` order by `d`.`jawatan`);

/*View structure for view `v_ringkasanperjawatan` */

drop view if exists `v_ringkasanperjawatan`;

drop table if exists `v_ringkasanperjawatan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_ringkasanperjawatan` AS (select `a`.`id_penjawatan_skim_rekod` AS `id_penjawatan_skim_rekod`,`b`.`id_penjawatan` AS `id_penjawatan`,`b`.`id_skim` AS `id_skim`,`d`.`jawatan` AS `jawatan`,`a`.`id_penjawatan_skim` AS `id_penjawatan_skim`,`a`.`jum_jawatan` AS `jum_jawatan`,`a`.`jum_isi_waran` AS `jum_isi_waran`,(`a`.`jum_jawatan` - `a`.`jum_isi_waran`) AS `kekosongan`,`b`.`optional` AS `optional` from (((`tb_penjawatan_skim_rekod` `a` join `tb_penjawatan_skim` `b`) join `tb_skim` `c`) join `tb_penjawatan` `d`) where ((`a`.`id_penjawatan_skim` = `b`.`id_penjawatan_skim`) and (`d`.`id_penjawatan` = `b`.`id_penjawatan`) and (`c`.`id_skim` = `b`.`id_skim`) and (`a`.`tahun` = '2018') and (`a`.`aktif` = '1')) group by `b`.`id_penjawatan` order by `b`.`id_penjawatan`);

SET SQL_MODE=@OLD_SQL_MODE;