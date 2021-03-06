/*
SQLyog Enterprise v12.4.1 (64 bit)
MySQL - 10.1.21-MariaDB : Database - iaa_cms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `iaa_cms`;

/*Table structure for table `audit` */

DROP TABLE IF EXISTS `audit`;

CREATE TABLE `audit` (
  `audit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `page_id` tinyblob NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `action` varchar(50) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `action_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `audit` */

/*Table structure for table `classifications` */

DROP TABLE IF EXISTS `classifications`;

CREATE TABLE `classifications` (
  `classification_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `classification` varchar(25) NOT NULL,
  PRIMARY KEY (`classification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `classifications` */

insert  into `classifications`(`classification_id`,`classification`) values 
(1,'Good Participant'),
(2,'Formative Only'),
(3,'DNV'),
(4,'Blacklist');

/*Table structure for table `client_contacts` */

DROP TABLE IF EXISTS `client_contacts`;

CREATE TABLE `client_contacts` (
  `client_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_contacts` */

insert  into `client_contacts`(`client_id`,`contact_id`) values 
(1,2);

/*Table structure for table `clients` */

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(50) NOT NULL,
  `default_location` int(11) DEFAULT NULL,
  `default_contact` int(11) DEFAULT NULL,
  `shipping_carrier` varchar(25) DEFAULT NULL,
  `shipping_account` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `FK_client_locations` (`default_location`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `clients` */

insert  into `clients`(`client_id`,`client_name`,`default_location`,`default_contact`,`shipping_carrier`,`shipping_account`) values 
(1,'AmGen',3,1,'',''),
(2,'Mockbert & Sons Manufacturing',0,0,'',''),
(3,'Abbot',5,3,'','');

/*Table structure for table `contact_status` */

DROP TABLE IF EXISTS `contact_status`;

CREATE TABLE `contact_status` (
  `status_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `contact_status` varchar(25) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contact_status` */

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `title` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `phone_ext` varchar(5) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `phone2_ext` varchar(5) DEFAULT NULL,
  `organization` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `contacts` */

insert  into `contacts`(`contact_id`,`firstname`,`lastname`,`title`,`email`,`email2`,`phone`,`phone_ext`,`phone2`,`phone2_ext`,`organization`) values 
(1,'Pema','Corn','Resaerch Coordinator','pcom.amgen@mailinator.com','','(334) 340-8619','','','','AmGen'),
(2,'Toora','Roach','Ergonomics Associate','troach.btech@mailinator.com','','(612) 506-8811','','','','Beveltech'),
(3,'Bryce ','Isaacs','Diagnostics Lab Liaison','fakeemail@mailinator.com','','813-215-8736','','','','Abbot');

/*Table structure for table `education_status` */

DROP TABLE IF EXISTS `education_status`;

CREATE TABLE `education_status` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `education_level` varchar(25) NOT NULL,
  `parent_education_level` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `education_status` */

insert  into `education_status`(`id`,`education_level`,`parent_education_level`) values 
(1,'K-12',NULL),
(2,'Kindergarten',1),
(3,'Grade 1',1),
(4,'Grade 2',1),
(5,'Grade 3',1),
(6,'Grade 4',1),
(7,'Grade 5',1),
(8,'Grade 6',1),
(9,'Grade 7',1),
(10,'Grade 8',1),
(11,'Grade 9',1),
(12,'Grade 10',1),
(13,'Grade 11',1),
(14,'Grade 12',1),
(15,'High School Diploma',NULL),
(16,'GED',NULL),
(17,'Trade School',NULL),
(18,'Associate Degree',NULL),
(19,'Bachelor’s Degree',NULL),
(20,'Master’s Degree',NULL),
(21,'PhD',NULL),
(22,'Professional Degree',NULL),
(23,'MD',NULL),
(24,'Doctorate',NULL);

/*Table structure for table `ethnicities` */

DROP TABLE IF EXISTS `ethnicities`;

CREATE TABLE `ethnicities` (
  `ethnicity_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `ethnicity` varchar(25) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ethnicity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `ethnicities` */

insert  into `ethnicities`(`ethnicity_id`,`ethnicity`,`comments`) values 
(1,'Asian',NULL),
(2,'African American',NULL),
(3,'Caucasian',NULL),
(4,'Hispanic',NULL),
(5,'Indian',NULL),
(6,'Middle Eastern',NULL),
(7,'Mixed',NULL),
(8,'Native American',NULL),
(9,'Pacific Islander',NULL),
(10,'Declined to State',NULL);

/*Table structure for table `genders` */

DROP TABLE IF EXISTS `genders`;

CREATE TABLE `genders` (
  `gender_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `gender` varchar(25) NOT NULL,
  `gender_abbreviation` varchar(2) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `genders` */

insert  into `genders`(`gender_id`,`gender`,`gender_abbreviation`) values 
(1,'Male','M'),
(2,'Female','F'),
(3,'MTF Transexual','TM'),
(4,'FTM Transexual','TF');

/*Table structure for table `location_contacts` */

DROP TABLE IF EXISTS `location_contacts`;

CREATE TABLE `location_contacts` (
  `location_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  KEY `FK_locations` (`location_id`),
  KEY `FK_contacts` (`contact_id`),
  CONSTRAINT `FK_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_locations` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `location_contacts` */

/*Table structure for table `location_types` */

DROP TABLE IF EXISTS `location_types`;

CREATE TABLE `location_types` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `location_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `location_types` */

insert  into `location_types`(`id`,`location_type`) values 
(1,'Lab / Internal'),
(2,'Offsite'),
(3,'Client');

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(50) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` varchar(9) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `location_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `FK_locations_ltypes` (`location_type`),
  CONSTRAINT `FK_locations_ltypes` FOREIGN KEY (`location_type`) REFERENCES `location_types` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `locations` */

insert  into `locations`(`location_id`,`location_name`,`address1`,`address2`,`city`,`state`,`zip`,`email`,`phone`,`location_type`) values 
(1,'Saratoga Testing Facilities','1821 Saratoga Ave ','#200','Saratoga','CA','95070','iaa_saratoga@mailinator.com','(408) 342-',1),
(2,'Hamilton Lab','Westgate Office Center','4950 Hamilton Ave, Suite #104','San Jose','CA','95130','','(408) 866-',1),
(3,'AmGen Headquarters','One Amgen Center Drive','','Thousand Oaks,','CA','91320','','805-447-10',3),
(4,'U.S. CORPORATE HEADQUARTERS','Abbott Laboratories','100 Abbott Park Road','Abbott Park','IL','60064-350','fakeabbotcontact@mailinator.com','(224) 667-',1),
(5,'ABBOTT DIAGNOSTICS','5440 Patrick Henry Dr.','','Santa Clara','ca','95054','','(408) 982-',3);

/*Table structure for table `login_attempts` */

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_attempts` */

/*Table structure for table `logins` */

DROP TABLE IF EXISTS `logins`;

CREATE TABLE `logins` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(25) NOT NULL,
  `login_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_timestamp` datetime DEFAULT NULL,
  `ip_address` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `logins` */

insert  into `logins`(`login_id`,`user_id`,`session_id`,`login_timestamp`,`logout_timestamp`,`ip_address`) values 
(1,3,'599cfb766c7a1','2017-08-23 05:50:14','2017-08-23 05:50:53',NULL),
(2,3,'599cfc86028d5','2017-08-23 05:54:46','2017-08-23 05:55:02',NULL),
(4,3,'599d0078e8c68','2017-08-23 06:11:36','2017-08-23 06:48:53',NULL),
(5,3,'599d093c821c1','2017-08-23 06:49:00',NULL,NULL),
(6,3,'599d77e1763d5','2017-08-23 14:41:05',NULL,NULL),
(7,3,'599dacdb7e4ff','2017-08-23 18:27:07',NULL,NULL),
(8,3,'599e3fc36850c','2017-08-24 04:53:55','2017-08-24 05:07:27',NULL),
(9,3,'599e42fd0b95b','2017-08-24 05:07:41','2017-08-24 05:11:39',NULL),
(10,3,'599e43ed32550','2017-08-24 05:11:41','2017-08-24 05:12:23',NULL),
(11,3,'599e4418607e7','2017-08-24 05:12:24','2017-08-24 12:48:35',NULL),
(12,3,'599eaf20a32e0','2017-08-24 12:49:04','2017-08-24 12:49:10',NULL),
(13,3,'599eaf2c3881e','2017-08-24 12:49:16','2017-08-24 12:49:24',NULL),
(14,3,'599eaf398f9dd','2017-08-24 12:49:29','2017-08-24 12:49:36',NULL),
(15,3,'599eaf51a9b20','2017-08-24 12:49:53',NULL,NULL),
(16,3,'599ffcb9cd55f','2017-08-25 12:32:25',NULL,NULL),
(17,3,'59a04d0aa6c84','2017-08-25 18:15:06',NULL,NULL),
(18,3,'59a0dd9b34547','2017-08-26 04:31:55',NULL,NULL),
(19,3,'59a13d2f63da7','2017-08-26 11:19:43',NULL,NULL),
(20,3,'59a18330c2e0b','2017-08-26 16:18:24',NULL,NULL),
(21,3,'59a4cb949fc61','2017-08-29 04:04:04','2017-08-29 04:52:54',NULL),
(22,3,'59a4ffb17d68a','2017-08-29 07:46:25',NULL,NULL),
(23,3,'59a5a1e983a64','2017-08-29 19:18:33',NULL,NULL),
(24,3,'59a624e020293','2017-08-30 04:37:20',NULL,NULL),
(25,3,'59a6e002df9ac','2017-08-30 17:55:46',NULL,NULL),
(26,3,'59a776275c9ac','2017-08-31 04:36:23',NULL,NULL),
(27,3,'59a7cec0bdf8f','2017-08-31 10:54:24',NULL,NULL),
(28,3,'59a833217b18f','2017-08-31 18:02:41',NULL,NULL),
(29,3,'59a8b3108b312','2017-09-01 03:08:32',NULL,NULL),
(30,3,'59a908c53fc29','2017-09-01 09:14:13',NULL,NULL),
(31,3,'59abf8d21a147','2017-09-03 14:42:58',NULL,NULL),
(32,3,'59ac2a17f0070','2017-09-03 18:13:11',NULL,NULL),
(33,3,'59ace113546bb','2017-09-04 07:13:55',NULL,NULL),
(34,3,'59ad29db50356','2017-09-04 12:24:27',NULL,NULL),
(35,3,'59ad8e4ff15a2','2017-09-04 19:33:03',NULL,NULL),
(36,3,'59ae0c7b966cc','2017-09-05 04:31:23',NULL,NULL),
(37,3,'59ae4c976cad0','2017-09-05 09:04:55',NULL,NULL),
(38,3,'59af651c31037','2017-09-06 05:01:48','2017-09-06 05:57:28',NULL),
(39,3,'59af722a8e91a','2017-09-06 05:57:30',NULL,NULL),
(40,3,'59b001d1c5ceb','2017-09-06 16:10:25',NULL,NULL),
(41,3,'59b2bef5173a3','2017-09-08 18:01:57',NULL,NULL),
(42,3,'59b46cc099d0a','2017-09-10 00:35:44',NULL,NULL),
(43,3,'59b5fd9a0ee0f','2017-09-11 05:06:02',NULL,NULL),
(44,3,'59b659dbc7384','2017-09-11 11:39:39',NULL,NULL),
(45,3,'59b747201000c','2017-09-12 04:32:00',NULL,NULL),
(46,3,'59b7b52a232e0','2017-09-12 12:21:30',NULL,NULL),
(47,3,'59b8fdf2992eb','2017-09-13 11:44:18',NULL,NULL),
(48,3,'59b9ff1cc4850','2017-09-14 06:01:32',NULL,NULL),
(49,3,'59bb431bdc12c','2017-09-15 05:03:55',NULL,NULL),
(50,3,'59bc97fc56da0','2017-09-16 05:18:20',NULL,NULL),
(51,3,'59bf35bed7471','2017-09-18 04:55:58',NULL,NULL),
(52,3,'59c08647cfae0','2017-09-19 04:51:51',NULL,NULL),
(53,3,'59c0f55b1160b','2017-09-19 12:45:47',NULL,NULL),
(54,3,'59c120a8ad6a8','2017-09-19 15:50:32',NULL,NULL),
(55,3,'59c1dadd980ad','2017-09-20 05:05:01',NULL,NULL),
(56,3,'59cc5e5447a99','2017-09-28 04:28:36',NULL,NULL),
(57,3,'59ccd65bd1143','2017-09-28 13:00:43',NULL,NULL),
(58,3,'59cf2563635f9','2017-09-30 07:02:27',NULL,NULL),
(59,3,'59d08c77ebd39','2017-10-01 08:34:31',NULL,NULL),
(60,3,'59d0f1e77c27e','2017-10-01 15:47:19',NULL,NULL),
(61,3,'59d37805eb484','2017-10-03 13:44:05',NULL,NULL),
(62,3,'59d452001aa6b','2017-10-04 05:14:08',NULL,NULL),
(63,3,'59d5af402af14','2017-10-05 06:04:16',NULL,NULL),
(64,3,'59d7c83585bf7','2017-10-06 20:15:17',NULL,NULL);

/*Table structure for table `medical_conditions` */

DROP TABLE IF EXISTS `medical_conditions`;

CREATE TABLE `medical_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medical_condition` varchar(100) NOT NULL,
  `record_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Data for the table `medical_conditions` */

insert  into `medical_conditions`(`id`,`medical_condition`,`record_status`) values 
(1,'No Medical Conditions',1),
(2,'Acne',1),
(3,'Allergies',1),
(4,'Alzheimers',1),
(5,'Anemia',1),
(6,'Ankylosing Spondylitis',1),
(7,'Anxiety Disorders',1),
(8,'Asthma',1),
(9,'Bipolar',1),
(10,'Blind',1),
(11,'Cancer',1),
(12,'Cancer – Chemotherapy',1),
(13,'Cancer – Remission',1),
(14,'Carpal Tunnel',1),
(15,'Cardiac/Heart  Condition',1),
(16,'Cataracts',1),
(17,'Chronic Pain',1),
(18,'Cluster Headache',1),
(19,'Cluster Seizure',1),
(20,'Color Blind',1),
(21,'COPD',1),
(22,'Crohn’s Disease',1),
(23,'Diabetes',1),
(24,'Diabetes – Type 1',1),
(25,'Diabetes – Type 2',1),
(26,'Diabetes – Pump User',1),
(27,'Dialysis/Chronic Kidney Failure',1),
(28,'Depression',1),
(29,'Dimensia',1),
(30,'Eczema',1),
(31,'Epilepsy',1),
(32,'Erectile Dysfunction',1),
(33,'Fertility',1),
(34,'Fibromyalgia',1),
(35,'Glaucoma',1),
(36,'Glucagon Experienced',1),
(37,'Growth Hormone',1),
(38,'Hemophilia A',1),
(39,'Hemophilia B',1),
(40,'Hemorrhoids',1),
(41,'Hepatitis C',1),
(42,'High Blood Pressure',1),
(43,'High Cholesterol',1),
(44,'Hidradenitis Suppurativa',1),
(45,'HIV',1),
(46,'Hypertension',1),
(47,'JIA (Juvenile Idiopathic Arthritis)',1),
(48,'Lupus',1),
(49,'LVAD',1),
(50,'Mastectomy',1),
(51,'Migraine',1),
(52,'Multiple Sclerosis (MS)',1),
(53,'Neuropathy',1),
(54,'Obese',1),
(55,'Osteoarthritis',1),
(56,'Osteoporosis',1),
(57,'Panuveitis (UV)',1),
(58,'Parkinson’s Disease',1),
(59,'PKU',1),
(60,'Platelet Disorder',1),
(61,'Prader-Willi Syndrome',1),
(62,'Precocious Puberty',1),
(63,'Psoriasis',1),
(64,'Psoriatic Arthritis',1),
(65,'Retinopathy',1),
(66,'Rheumatoid Arthritis',1),
(67,'Schizophrenia',1),
(68,'Seizures',1),
(69,'Sjögren\'s Syndrome',1),
(70,'Skin Disorders/Issues',1),
(71,'Thyroid',1),
(72,'Ulcerative Colitis',1);

/*Table structure for table `multi_usergroup` */

DROP TABLE IF EXISTS `multi_usergroup`;

CREATE TABLE `multi_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

/*Data for the table `multi_usergroup` */

insert  into `multi_usergroup`(`id`,`group_id`,`group_name`,`group_type`) values 
(1,1,'BioMed Tech',1),
(2,2,'BioTech Lab Researcher',1),
(3,3,'Caregivers/Home Health',1),
(4,4,'Dental Assistant',1),
(5,5,'Dentist',1),
(6,6,'Dialysis Tech',1),
(7,7,'EMT',1),
(8,8,'Fire Fighter',1),
(9,9,'First Responders',1),
(10,10,'Gynecologist',1),
(11,11,'HCP',1),
(12,12,'HCP – RN',1),
(13,13,'HCP – LVN',1),
(14,14,'HCP – MA',1),
(15,15,'HCP – PA',1),
(16,16,'HCP – DR',1),
(17,17,'HCP – Anesthesiology',1),
(18,18,'HCP – Cardiovascular',1),
(19,19,'HCP – Critical Care',1),
(20,20,'HCP – Dermatology',1),
(21,21,'HCP – Dialysis/Renal',1),
(22,22,'HCP – ER',1),
(23,23,'HCP – Family Practice',1),
(24,24,'HCP – Gastroenterology',1),
(25,25,'HCP – Geriatric',1),
(26,26,'HCP  –  Hematology',1),
(27,27,'HCP – ICU',1),
(28,28,'HCP – Internal Medicine',1),
(29,29,'HCP – LVAD',1),
(30,30,'HCP – Neurology',1),
(31,31,'HCP – Nephrology',1),
(32,32,'HCP – OBGYN',1),
(33,33,'HCP – Oncology',1),
(34,34,'HCP – OR',1),
(35,35,'HCP – Outpatient',1),
(36,36,'HCP – Pediatrics',1),
(37,37,'HCP – Plastic Surgery',1),
(38,38,'HCP – Preventive Care',1),
(39,39,'HCP – Primary Care',1),
(40,40,'HCP – Pulmonology',1),
(41,41,'HCP – Public Health',1),
(42,42,'HCP – Psych',1),
(43,43,'HCP – Rheumatology',1),
(44,44,'HCP – Surgical',1),
(45,45,'HCP – Telemetry/Med Surge',1),
(46,46,'HCP – Unknown',1),
(47,47,'HCP – Urology',1),
(48,48,'IT',1),
(49,49,'Hygienist',1),
(50,50,'Lasik Surgeons',1),
(51,51,'Lasik Techs',1),
(52,52,'OBGYN',1),
(53,53,'Ophthalmologist',1),
(54,54,'Ophthalmology Tech',1),
(55,55,'Paramedic',1),
(56,56,'PCT',1),
(57,57,'Pharmacist',1),
(58,58,'Pharmacy Tech',1),
(59,59,'Police Officer',1),
(60,60,'Reprocessing Tech',1),
(61,61,'School Nurse',1),
(62,65,'BioMed Tech',1),
(63,66,'BioTech Lab Researcher',1),
(64,67,'Caregivers/Home Health',1),
(65,68,'Dental Assistant',1),
(66,69,'Dentist',1),
(67,70,'Dialysis Tech',1),
(68,71,'EMT',1),
(69,72,'Fire Fighter',1),
(70,73,'First Responders',1),
(71,74,'Gynecologist',1),
(72,75,'HCP',1),
(73,76,'HCP – RN',1),
(74,77,'HCP – LVN',1),
(75,78,'HCP – MA',1),
(76,79,'HCP – PA',1),
(77,80,'HCP – DR',1),
(78,81,'HCP – Anesthesiology',1),
(79,82,'HCP – Cardiovascular',1),
(80,83,'HCP – Critical Care',1),
(81,84,'HCP – Dermatology',1),
(82,85,'HCP – Dialysis/Renal',1),
(83,86,'HCP – ER',1),
(84,87,'HCP – Family Practice',1),
(85,88,'HCP – Gastroenterology',1),
(86,89,'HCP – Geriatric',1),
(87,90,'HCP  –  Hematology',1),
(88,91,'HCP – ICU',1),
(89,92,'HCP – Internal Medicine',1),
(90,93,'HCP – LVAD',1),
(91,94,'HCP – Neurology',1),
(92,95,'HCP – Nephrology',1),
(93,96,'HCP – OBGYN',1),
(94,97,'HCP – Oncology',1),
(95,98,'HCP – OR',1),
(96,99,'HCP – Outpatient',1),
(97,100,'HCP – Pediatrics',1),
(98,101,'HCP – Plastic Surgery',1),
(99,102,'HCP – Preventive Care',1),
(100,103,'HCP – Primary Care',1),
(101,104,'HCP – Pulmonology',1),
(102,105,'HCP – Public Health',1),
(103,106,'HCP – Psych',1),
(104,107,'HCP – Rheumatology',1),
(105,108,'HCP – Surgical',1),
(106,109,'HCP – Telemetry/Med Surge',1),
(107,110,'HCP – Unknown',1),
(108,111,'HCP – Urology',1),
(109,112,'IT',1),
(110,113,'Hygienist',1),
(111,114,'Lasik Surgeons',1),
(112,115,'Lasik Techs',1),
(113,116,'OBGYN',1),
(114,117,'Ophthalmologist',1),
(115,118,'Ophthalmology Tech',1),
(116,119,'Paramedic',1),
(117,120,'PCT',1),
(118,121,'Pharmacist',1),
(119,122,'Pharmacy Tech',1),
(120,123,'Police Officer',1),
(121,124,'Reprocessing Tech',1),
(122,125,'School Nurse',1),
(123,1,'No Medical Conditions',2),
(124,2,'Acne',2),
(125,3,'Allergies',2),
(126,4,'Alzheimers',2),
(127,5,'Anemia',2),
(128,6,'Ankylosing Spondylitis',2),
(129,7,'Anxiety Disorders',2),
(130,8,'Asthma',2),
(131,9,'Bipolar',2),
(132,10,'Blind',2),
(133,11,'Cancer',2),
(134,12,'Cancer – Chemotherapy',2),
(135,13,'Cancer – Remission',2),
(136,14,'Carpal Tunnel',2),
(137,15,'Cardiac/Heart  Condition',2),
(138,16,'Cataracts',2),
(139,17,'Chronic Pain',2),
(140,18,'Cluster Headache',2),
(141,19,'Cluster Seizure',2),
(142,20,'Color Blind',2),
(143,21,'COPD',2),
(144,22,'Crohn’s Disease',2),
(145,23,'Diabetes',2),
(146,24,'Diabetes – Type 1',2),
(147,25,'Diabetes – Type 2',2),
(148,26,'Diabetes – Pump User',2),
(149,27,'Dialysis/Chronic Kidney Failure',2),
(150,28,'Depression',2),
(151,29,'Dimensia',2),
(152,30,'Eczema',2),
(153,31,'Epilepsy',2),
(154,32,'Erectile Dysfunction',2),
(155,33,'Fertility',2),
(156,34,'Fibromyalgia',2),
(157,35,'Glaucoma',2),
(158,36,'Glucagon Experienced',2),
(159,37,'Growth Hormone',2),
(160,38,'Hemophilia A',2),
(161,39,'Hemophilia B',2),
(162,40,'Hemorrhoids',2),
(163,41,'Hepatitis C',2),
(164,42,'High Blood Pressure',2),
(165,43,'High Cholesterol',2),
(166,44,'Hidradenitis Suppurativa',2),
(167,45,'HIV',2),
(168,46,'Hypertension',2),
(169,47,'JIA (Juvenile Idiopathic Arthritis)',2),
(170,48,'Lupus',2),
(171,49,'LVAD',2),
(172,50,'Mastectomy',2),
(173,51,'Migraine',2),
(174,52,'Multiple Sclerosis (MS)',2),
(175,53,'Neuropathy',2),
(176,54,'Obese',2),
(177,55,'Osteoarthritis',2),
(178,56,'Osteoporosis',2),
(179,57,'Panuveitis (UV)',2),
(180,58,'Parkinson’s Disease',2),
(181,59,'PKU',2),
(182,60,'Platelet Disorder',2),
(183,61,'Prader-Willi Syndrome',2),
(184,62,'Precocious Puberty',2),
(185,63,'Psoriasis',2),
(186,64,'Psoriatic Arthritis',2),
(187,65,'Retinopathy',2),
(188,66,'Rheumatoid Arthritis',2),
(189,67,'Schizophrenia',2),
(190,68,'Seizures',2),
(191,69,'Sjögren\'s Syndrome',2),
(192,70,'Skin Disorders/Issues',2),
(193,71,'Thyroid',2),
(194,72,'Ulcerative Colitis',2),
(195,1,'RA patients',3),
(196,2,'Caregivers',3),
(197,3,'HCP',3);

/*Table structure for table `occupations` */

DROP TABLE IF EXISTS `occupations`;

CREATE TABLE `occupations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `occupation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

/*Data for the table `occupations` */

insert  into `occupations`(`id`,`occupation`) values 
(1,'BioMed Tech'),
(2,'BioTech Lab Researcher'),
(3,'Caregivers/Home Health'),
(4,'Dental Assistant'),
(5,'Dentist'),
(6,'Dialysis Tech'),
(7,'EMT'),
(8,'Fire Fighter'),
(9,'First Responders'),
(10,'Gynecologist'),
(11,'HCP'),
(12,'HCP – RN'),
(13,'HCP – LVN'),
(14,'HCP – MA'),
(15,'HCP – PA'),
(16,'HCP – DR'),
(17,'HCP – Anesthesiology'),
(18,'HCP – Cardiovascular'),
(19,'HCP – Critical Care'),
(20,'HCP – Dermatology'),
(21,'HCP – Dialysis/Renal'),
(22,'HCP – ER'),
(23,'HCP – Family Practice'),
(24,'HCP – Gastroenterology'),
(25,'HCP – Geriatric'),
(26,'HCP  –  Hematology'),
(27,'HCP – ICU'),
(28,'HCP – Internal Medicine'),
(29,'HCP – LVAD'),
(30,'HCP – Neurology'),
(31,'HCP – Nephrology'),
(32,'HCP – OBGYN'),
(33,'HCP – Oncology'),
(34,'HCP – OR'),
(35,'HCP – Outpatient'),
(36,'HCP – Pediatrics'),
(37,'HCP – Plastic Surgery'),
(38,'HCP – Preventive Care'),
(39,'HCP – Primary Care'),
(40,'HCP – Pulmonology'),
(41,'HCP – Public Health'),
(42,'HCP – Psych'),
(43,'HCP – Rheumatology'),
(44,'HCP – Surgical'),
(45,'HCP – Telemetry/Med Surge'),
(46,'HCP – Unknown'),
(47,'HCP – Urology'),
(48,'IT'),
(49,'Hygienist'),
(50,'Lasik Surgeons'),
(51,'Lasik Techs'),
(52,'OBGYN'),
(53,'Ophthalmologist'),
(54,'Ophthalmology Tech'),
(55,'Paramedic'),
(56,'PCT'),
(57,'Pharmacist'),
(58,'Pharmacy Tech'),
(59,'Police Officer'),
(60,'Reprocessing Tech'),
(61,'School Nurse'),
(65,'BioMed Tech'),
(66,'BioTech Lab Researcher'),
(67,'Caregivers/Home Health'),
(68,'Dental Assistant'),
(69,'Dentist'),
(70,'Dialysis Tech'),
(71,'EMT'),
(72,'Fire Fighter'),
(73,'First Responders'),
(74,'Gynecologist'),
(75,'HCP'),
(76,'HCP – RN'),
(77,'HCP – LVN'),
(78,'HCP – MA'),
(79,'HCP – PA'),
(80,'HCP – DR'),
(81,'HCP – Anesthesiology'),
(82,'HCP – Cardiovascular'),
(83,'HCP – Critical Care'),
(84,'HCP – Dermatology'),
(85,'HCP – Dialysis/Renal'),
(86,'HCP – ER'),
(87,'HCP – Family Practice'),
(88,'HCP – Gastroenterology'),
(89,'HCP – Geriatric'),
(90,'HCP  –  Hematology'),
(91,'HCP – ICU'),
(92,'HCP – Internal Medicine'),
(93,'HCP – LVAD'),
(94,'HCP – Neurology'),
(95,'HCP – Nephrology'),
(96,'HCP – OBGYN'),
(97,'HCP – Oncology'),
(98,'HCP – OR'),
(99,'HCP – Outpatient'),
(100,'HCP – Pediatrics'),
(101,'HCP – Plastic Surgery'),
(102,'HCP – Preventive Care'),
(103,'HCP – Primary Care'),
(104,'HCP – Pulmonology'),
(105,'HCP – Public Health'),
(106,'HCP – Psych'),
(107,'HCP – Rheumatology'),
(108,'HCP – Surgical'),
(109,'HCP – Telemetry/Med Surge'),
(110,'HCP – Unknown'),
(111,'HCP – Urology'),
(112,'IT'),
(113,'Hygienist'),
(114,'Lasik Surgeons'),
(115,'Lasik Techs'),
(116,'OBGYN'),
(117,'Ophthalmologist'),
(118,'Ophthalmology Tech'),
(119,'Paramedic'),
(120,'PCT'),
(121,'Pharmacist'),
(122,'Pharmacy Tech'),
(123,'Police Officer'),
(124,'Reprocessing Tech'),
(125,'School Nurse');

/*Table structure for table `participant_conditions_autosave` */

DROP TABLE IF EXISTS `participant_conditions_autosave`;

CREATE TABLE `participant_conditions_autosave` (
  `participant_id` int(11) NOT NULL,
  `medical_condition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `participant_conditions_autosave` */

/*Table structure for table `participant_conditions_ug` */

DROP TABLE IF EXISTS `participant_conditions_ug`;

CREATE TABLE `participant_conditions_ug` (
  `participant_id` int(11) NOT NULL,
  `medical_condition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_conditions_ug` */

insert  into `participant_conditions_ug`(`participant_id`,`medical_condition`) values 
(2,25),
(2,46),
(3,5),
(3,42),
(3,43),
(4,11),
(4,12),
(4,15),
(1,2),
(1,3),
(5,15),
(5,25),
(5,26),
(5,27),
(6,18),
(7,14);

/*Table structure for table `participant_employers` */

DROP TABLE IF EXISTS `participant_employers`;

CREATE TABLE `participant_employers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parti_employer` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `participant_employers` */

insert  into `participant_employers`(`id`,`parti_employer`) values 
(1,'JT Metalworks'),
(2,'jt'),
(3,'Bear Sterns'),
(4,'Mercy Hos'),
(5,'Mercy Hospital'),
(6,'Alameda County'),
(7,'N/A'),
(8,'Nix Check Cashing'),
(9,'City of Oakla'),
(10,'City of Oakland');

/*Table structure for table `participant_notes` */

DROP TABLE IF EXISTS `participant_notes`;

CREATE TABLE `participant_notes` (
  `participant_id` int(11) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `note_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_notes` */

/*Table structure for table `participant_occupations` */

DROP TABLE IF EXISTS `participant_occupations`;

CREATE TABLE `participant_occupations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parti_occupation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `participant_occupations` */

insert  into `participant_occupations`(`id`,`parti_occupation`) values 
(1,'Welder'),
(2,'Finan'),
(3,'Financial Analyst'),
(4,'LabAnalyst'),
(5,'EMT'),
(6,'Police Officerq'),
(7,'Police Officer'),
(8,'Retired'),
(9,'Cashier'),
(10,'LIBRARIAN');

/*Table structure for table `participant_occupations_autosave` */

DROP TABLE IF EXISTS `participant_occupations_autosave`;

CREATE TABLE `participant_occupations_autosave` (
  `participant_id` int(11) NOT NULL,
  `occupation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `participant_occupations_autosave` */

/*Table structure for table `participant_occupations_ug` */

DROP TABLE IF EXISTS `participant_occupations_ug`;

CREATE TABLE `participant_occupations_ug` (
  `participant_id` int(11) NOT NULL,
  `occupation_id` int(11) NOT NULL,
  KEY `FK_participant_occupations_participant` (`participant_id`),
  KEY `FK_participant_occupations_occupation` (`occupation_id`),
  CONSTRAINT `FK_participant_occupations_occupation` FOREIGN KEY (`occupation_id`) REFERENCES `occupations` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_participant_occupations_participant` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `participant_occupations_ug` */

insert  into `participant_occupations_ug`(`participant_id`,`occupation_id`) values 
(2,65),
(3,7),
(4,59);

/*Table structure for table `participant_photolog` */

DROP TABLE IF EXISTS `participant_photolog`;

CREATE TABLE `participant_photolog` (
  `participant_id` int(11) NOT NULL,
  `notes` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `study` varchar(50) NOT NULL,
  `datee` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `participant_photolog` */

/*Table structure for table `participant_photolog_autosave` */

DROP TABLE IF EXISTS `participant_photolog_autosave`;

CREATE TABLE `participant_photolog_autosave` (
  `participant_id` int(11) NOT NULL,
  `notes` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `study` varchar(10) NOT NULL,
  `datee` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `participant_photolog_autosave` */

/*Table structure for table `participant_usergroup_autosave` */

DROP TABLE IF EXISTS `participant_usergroup_autosave`;

CREATE TABLE `participant_usergroup_autosave` (
  `participant_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `participant_usergroup_autosave` */

/*Table structure for table `participant_usergroup_ug` */

DROP TABLE IF EXISTS `participant_usergroup_ug`;

CREATE TABLE `participant_usergroup_ug` (
  `participant_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `participant_usergroup_ug` */

insert  into `participant_usergroup_ug`(`participant_id`,`usergroup_id`) values 
(2,5),
(2,7),
(2,8),
(3,3),
(5,10),
(6,4),
(7,4);

/*Table structure for table `participants` */

DROP TABLE IF EXISTS `participants`;

CREATE TABLE `participants` (
  `participant_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) NOT NULL,
  `middlename` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `phone_ext` int(3) DEFAULT NULL,
  `alternate_phone` varchar(15) DEFAULT NULL,
  `alternate_phone_ext` int(3) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alternate_email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `ethnicity` tinyint(4) DEFAULT NULL,
  `education` tinyint(4) DEFAULT NULL,
  `occupation` varchar(25) DEFAULT NULL,
  `employer` varchar(50) DEFAULT NULL,
  `transportation` tinyint(4) DEFAULT NULL,
  `contact_status` tinyint(4) DEFAULT NULL,
  `photo_src` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(3) DEFAULT NULL,
  `do_not_email` tinyint(3) DEFAULT NULL,
  `decreased` tinyint(3) DEFAULT NULL,
  `classification` varchar(22) DEFAULT NULL,
  `phone_msg` tinyint(3) DEFAULT NULL,
  `alt_phone_msg` tinyint(3) DEFAULT NULL,
  `esl` tinyint(3) DEFAULT NULL,
  `need_wheelchair` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`participant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `participants` */

insert  into `participants`(`participant_id`,`firstname`,`middlename`,`lastname`,`address1`,`address2`,`city`,`state`,`zip`,`country`,`phone`,`phone_ext`,`alternate_phone`,`alternate_phone_ext`,`email`,`alternate_email`,`dob`,`age`,`gender`,`ethnicity`,`education`,`occupation`,`employer`,`transportation`,`contact_status`,`photo_src`,`do_not_call`,`do_not_email`,`decreased`,`classification`,`phone_msg`,`alt_phone_msg`,`esl`,`need_wheelchair`) values 
(1,'John','Q','Public',NULL,NULL,'Emeryville','CA','90255',NULL,'510-710-0000',0,'415-123-456',123,'jptest@mailinator.com','','1975-02-15',42,1,3,17,'Welder','JT Metalworks',1,NULL,NULL,NULL,1,NULL,'2',1,NULL,1,1),
(2,'Jason','','Chu',NULL,NULL,'San Franciso','CA','94016',NULL,'415-000-0000',0,'0-0-0',0,'jchu@mailinator.com','','1976-05-01',41,1,1,20,'LabAnalyst','Bear Sterns',1,NULL,'',NULL,NULL,NULL,'1',1,NULL,2,1),
(3,'DeShawn','W','Johnson',NULL,NULL,'Oakland','CA','94116',NULL,'510-123-4567',0,'0-0-0',0,'djackson@mailinator.com','','1982-01-01',35,1,2,18,'EMT','Mercy Hospital',3,NULL,'Black_Man_Young.jpg',NULL,NULL,NULL,'1',1,NULL,1,1),
(4,'Allesandro','','Gomez',NULL,NULL,'Walnut Creek','CA','94517',NULL,'669-123-4556',0,'415-987-6543',333,'','','1972-10-06',45,1,4,15,'Police Officer','Alameda County',6,NULL,'',NULL,1,NULL,'3',1,NULL,1,1),
(5,'Maria','','Torres',NULL,NULL,'Moraga','CA','94556',NULL,'0-0-0',0,'0-0-0',0,'','','1945-03-16',72,2,4,16,'Retired','N/A',5,NULL,'Latin_Woman_MiddleAged.jpg',NULL,1,NULL,'1',NULL,NULL,2,2),
(6,'Stephanie','','Miller',NULL,NULL,'West Oakland','CA','94607',NULL,'0-0-0',0,'0-0-0',0,'','','0000-00-00',22,2,3,13,'Cashier','Nix Check Cashing',2,NULL,'',1,1,NULL,'4',NULL,NULL,1,1),
(7,'Jan','S','McCarthy',NULL,NULL,'San Leandro','CA','94577',NULL,'415-123-6666',0,'510-888-8888',88888,'jm@ailinator.com','','1988-07-25',29,2,3,19,'Librarian','City of Oakland',2,NULL,'',NULL,NULL,NULL,'1',1,NULL,1,1);

/*Table structure for table `participants_autosave` */

DROP TABLE IF EXISTS `participants_autosave`;

CREATE TABLE `participants_autosave` (
  `participant_autosave_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `middlename` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `phone_ext` int(3) DEFAULT NULL,
  `alternate_phone` varchar(15) DEFAULT NULL,
  `alternate_phone_ext` int(3) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alternate_email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `ethnicity` tinyint(4) DEFAULT NULL,
  `education` tinyint(4) DEFAULT NULL,
  `occupation` varchar(25) DEFAULT NULL,
  `employer` varchar(50) DEFAULT NULL,
  `transportation` tinyint(4) DEFAULT NULL,
  `contact_status` tinyint(4) DEFAULT NULL,
  `photo_src` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(3) DEFAULT NULL,
  `do_not_email` tinyint(3) DEFAULT NULL,
  `decreased` tinyint(3) DEFAULT NULL,
  `classification` varchar(22) DEFAULT NULL,
  `phone_msg` tinyint(3) DEFAULT NULL,
  `alt_phone_msg` tinyint(3) DEFAULT NULL,
  `esl` tinyint(3) DEFAULT NULL,
  `need_wheelchair` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`participant_autosave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `participants_autosave` */

/*Table structure for table `product_types` */

DROP TABLE IF EXISTS `product_types`;

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `product_types` */

insert  into `product_types`(`id`,`product_type`) values 
(1,'Autoinjector'),
(2,'PFS'),
(3,'System');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`product_id`,`product_type_id`,`product_name`) values 
(1,0,'Test Product ABC'),
(2,0,'Test Product XYZ');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`role_id`,`role`) values 
(1,'Lead'),
(2,'Recruiter'),
(3,'AV'),
(4,'Datalogger ');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `schedule_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `schedule_date` date NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `schedule` */

insert  into `schedule`(`schedule_id`,`study_id`,`schedule_date`) values 
(1,1,'2017-09-25'),
(2,1,'2017-09-26'),
(3,1,'2017-09-27'),
(4,1,'2017-09-28'),
(5,1,'2017-09-29'),
(6,1,'2017-09-30'),
(7,1,'2017-10-01'),
(8,1,'2017-10-02');

/*Table structure for table `schedule_details` */

DROP TABLE IF EXISTS `schedule_details`;

CREATE TABLE `schedule_details` (
  `schedule_id` bigint(20) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `participant` int(11) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `training_condition` tinyint(4) DEFAULT NULL,
  `participant_status` tinyint(4) DEFAULT NULL,
  `participant_order` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schedule_details` */

insert  into `schedule_details`(`schedule_id`,`start_time`,`end_time`,`participant`,`user_group`,`training_condition`,`participant_status`,`participant_order`) values 
(1,'00:00:00','00:00:00',1,3,1,1,0),
(1,'00:00:00','00:00:00',1,3,1,1,0),
(1,'00:00:00','00:00:00',1,3,1,1,0),
(1,'00:00:00','00:00:00',1,3,1,1,0),
(1,'00:00:00','00:00:00',1,3,1,1,0),
(1,'00:00:00','00:00:00',1,3,1,1,0),
(2,'00:00:00','00:00:00',1,3,1,1,0),
(2,'00:00:00','00:00:00',1,3,1,1,0),
(2,'00:00:00','00:00:00',1,3,1,1,0),
(2,'00:00:00','00:00:00',1,3,1,1,0),
(2,'00:00:00','00:00:00',1,3,1,1,0),
(2,'00:00:00','00:00:00',1,3,1,1,0),
(3,'00:00:00','00:00:00',1,3,1,1,0),
(3,'00:00:00','00:00:00',1,3,1,1,0),
(3,'00:00:00','00:00:00',1,3,1,1,0),
(3,'00:00:00','00:00:00',1,3,1,1,0),
(3,'00:00:00','00:00:00',1,3,1,1,0),
(3,'00:00:00','00:00:00',1,3,1,1,0),
(4,'00:00:00','00:00:00',1,3,1,1,0),
(4,'00:00:00','00:00:00',1,3,1,1,0),
(4,'00:00:00','00:00:00',1,3,1,1,0),
(4,'00:00:00','00:00:00',1,3,1,1,0),
(4,'00:00:00','00:00:00',1,3,1,1,0),
(4,'00:00:00','00:00:00',1,3,1,1,0),
(5,'00:00:00','00:00:00',1,3,1,1,0),
(5,'00:00:00','00:00:00',1,3,1,1,0),
(5,'00:00:00','00:00:00',1,3,1,1,0),
(5,'00:00:00','00:00:00',1,3,1,1,0),
(5,'00:00:00','00:00:00',1,3,1,1,0),
(5,'00:00:00','00:00:00',1,3,1,1,0),
(6,'00:00:00','00:00:00',1,3,1,1,0),
(6,'00:00:00','00:00:00',1,3,1,1,0),
(6,'00:00:00','00:00:00',1,3,1,1,0),
(6,'00:00:00','00:00:00',1,3,1,1,0),
(6,'00:00:00','00:00:00',1,3,1,1,0),
(6,'00:00:00','00:00:00',1,3,1,1,0),
(7,'00:00:00','00:00:00',1,3,1,1,0),
(7,'00:00:00','00:00:00',1,3,1,1,0),
(7,'00:00:00','00:00:00',1,3,1,1,0),
(7,'00:00:00','00:00:00',1,3,1,1,0),
(7,'00:00:00','00:00:00',1,3,1,1,0),
(7,'00:00:00','00:00:00',1,3,1,1,0),
(8,'00:00:00','00:00:00',1,3,1,1,0),
(8,'00:00:00','00:00:00',1,3,1,1,0),
(8,'00:00:00','00:00:00',1,3,1,1,0),
(8,'00:00:00','00:00:00',1,3,1,1,0),
(8,'00:00:00','00:00:00',1,3,1,1,0),
(8,'00:00:00','00:00:00',1,3,1,1,0);

/*Table structure for table `screener_answers` */

DROP TABLE IF EXISTS `screener_answers`;

CREATE TABLE `screener_answers` (
  `study_user_group_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `screener_question` int(11) NOT NULL,
  `answer` varchar(100) NOT NULL,
  KEY `FK_screener_answers_study` (`study_user_group_id`),
  KEY `FK_screener_answers_participant` (`participant_id`),
  KEY `FK_screener_answers_question` (`screener_question`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `screener_answers` */

insert  into `screener_answers`(`study_user_group_id`,`participant_id`,`screener_question`,`answer`) values 
(1,1,1,'Yes'),
(1,1,2,'Epilepsy, Cluster Headaches'),
(1,1,3,'Lipitor'),
(94,1,1,'No'),
(94,2,1,'Yes'),
(71,1,10,'one'),
(71,1,11,'asad'),
(71,2,10,'one,two,three'),
(71,2,11,'azar'),
(3920,16,1,'Yes'),
(3920,16,10,'two'),
(3920,16,11,'1234'),
(3920,15,1,'Yes'),
(3920,15,3,'tredet'),
(3920,15,10,'one,two,three'),
(3920,15,11,'false'),
(3920,3,1,'No'),
(3920,3,10,'two,three'),
(3920,3,11,'true'),
(3991,1,1,'Yes'),
(3991,10,1,'Yes'),
(3991,10,10,'one,two,three');

/*Table structure for table `screener_question_options` */

DROP TABLE IF EXISTS `screener_question_options`;

CREATE TABLE `screener_question_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `screener_question` int(11) NOT NULL,
  `option` varchar(255) NOT NULL,
  `order` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_screener_question_options_question` (`screener_question`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `screener_question_options` */

insert  into `screener_question_options`(`id`,`screener_question`,`option`,`order`) values 
(1,1,'Yes',1),
(2,1,'No',2),
(3,2,'Epilepsy',1),
(5,2,'Migraines',2),
(6,2,'Parkinson\'s Disease',3),
(7,2,'Coluster Headaches',4),
(25,10,'one',1),
(26,10,'two',2),
(27,10,'three',3),
(28,12,'Yes',1),
(29,12,'No',2),
(30,12,'Cyclical',3),
(31,13,'Option',1),
(32,13,'A',2),
(33,13,'Option',3),
(34,13,'B',4),
(35,13,'Option',5),
(36,13,'C',6);

/*Table structure for table `screener_questions` */

DROP TABLE IF EXISTS `screener_questions`;

CREATE TABLE `screener_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `question_type` tinyint(4) DEFAULT '1' COMMENT '1=single; 2=multi-select; 3=free-text',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UC_Question` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `screener_questions` */

insert  into `screener_questions`(`id`,`question`,`question_type`,`last_modified`) values 
(1,'Do you have diabetes?',1,'2017-08-24 13:45:46'),
(2,'Which neurological conditions do you have?',2,'2017-08-24 13:45:46'),
(3,'What medications do you take to treat your condition?',3,'2017-08-24 13:45:46'),
(10,'Multiple Choice Question',2,'2017-08-26 11:56:55'),
(11,'Free Text Question',3,'2017-08-26 12:15:45'),
(12,'Do you have insomnia?',1,'2017-10-06 21:50:51'),
(13,'Test Question 2',1,'2017-10-06 21:53:15');

/*Table structure for table `search_options` */

DROP TABLE IF EXISTS `search_options`;

CREATE TABLE `search_options` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `search_field` varchar(25) NOT NULL,
  `display_name` varchar(25) DEFAULT NULL,
  `field_type` varchar(25) DEFAULT 'multi-select',
  `value_type` varchar(25) DEFAULT NULL,
  `linking_table` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `search_options` */

insert  into `search_options`(`id`,`search_field`,`display_name`,`field_type`,`value_type`,`linking_table`) values 
(1,'medical_condition','Medical Condition','multi-select',NULL,'medical_conditions'),
(2,'age_range','Age Range','input-range','numeric',NULL),
(3,'gender','Gender','multi-select',NULL,'genders'),
(4,'education','Education','select',NULL,'education_status'),
(5,'participant_name','Participant Name','input',NULL,NULL),
(6,'participant_city','Participant City','multi-select',NULL,NULL),
(7,'participant_zip','Participant Zip','multi-select',NULL,NULL),
(8,'ethnicity','Ethnicity','multi-select',NULL,'ethnicities'),
(9,'occupation','Occupation','multi-select',NULL,'occupations'),
(10,'study','Study','multi-select',NULL,'studies'),
(11,'classification','Classification','multi-select',NULL,'classifications'),
(12,'employer','Employer','multi-select',NULL,'vw_ParticipantEmployers'),
(13,'transportation','Transportation','multi-select',NULL,NULL);

/*Table structure for table `studies` */

DROP TABLE IF EXISTS `studies`;

CREATE TABLE `studies` (
  `study_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `product_name` int(11) NOT NULL,
  `product_type` int(11) NOT NULL,
  `study_type` int(11) NOT NULL,
  `number_of_usergroups` smallint(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `study_status` tinyint(4) DEFAULT NULL,
  `focus_vision` tinyint(4) DEFAULT '0',
  `recruiter` int(11) DEFAULT NULL,
  `lead` int(11) DEFAULT NULL,
  `datalogger` int(11) DEFAULT NULL,
  `av` int(11) DEFAULT NULL,
  `study_number` varchar(10) DEFAULT NULL,
  `study_notes` text,
  `study_dnq_notes` text,
  `client_contact_info` text NOT NULL,
  `created` date NOT NULL,
  `noted_last_modified` date NOT NULL,
  PRIMARY KEY (`study_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `studies` */

insert  into `studies`(`study_id`,`client_id`,`product_name`,`product_type`,`study_type`,`number_of_usergroups`,`start_date`,`end_date`,`study_status`,`focus_vision`,`recruiter`,`lead`,`datalogger`,`av`,`study_number`,`study_notes`,`study_dnq_notes`,`client_contact_info`,`created`,`noted_last_modified`) values 
(1,1,1,1,2,2,'2017-09-25','2017-10-02',1,0,2,3,4,5,'1','This is an example study note.','Users with no cell phone\r\nUsers with Windows phone\r\nUsers with both android and ios phones','					\r\nName : Toora Roach\r\nEmail : troach.btech@mailinator.com\r\nPhone : (612) 506-8811\r\nOrganization : Beveltech','2017-10-06','2017-10-07');

/*Table structure for table `studies_autosave` */

DROP TABLE IF EXISTS `studies_autosave`;

CREATE TABLE `studies_autosave` (
  `study_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `product_name` int(11) NOT NULL,
  `product_type` int(11) NOT NULL,
  `study_type` int(11) NOT NULL,
  `number_of_usergroups` smallint(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `study_status` tinyint(4) DEFAULT NULL,
  `focus_vision` tinyint(4) DEFAULT '0',
  `recruiter` int(11) DEFAULT NULL,
  `lead` int(11) DEFAULT NULL,
  `datalogger` int(11) DEFAULT NULL,
  `av` int(11) DEFAULT NULL,
  `study_number` varchar(10) DEFAULT NULL,
  `study_notes` text,
  `study_dnq_notes` text,
  `client_contact_info` text NOT NULL,
  PRIMARY KEY (`study_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `studies_autosave` */

/*Table structure for table `study_dnq` */

DROP TABLE IF EXISTS `study_dnq`;

CREATE TABLE `study_dnq` (
  `study_id` int(11) NOT NULL,
  `dnq_study_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_dnq` */

/*Table structure for table `study_dnq_autosave` */

DROP TABLE IF EXISTS `study_dnq_autosave`;

CREATE TABLE `study_dnq_autosave` (
  `study_id` int(11) NOT NULL,
  `dnq_study_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_dnq_autosave` */

/*Table structure for table `study_group_sessions` */

DROP TABLE IF EXISTS `study_group_sessions`;

CREATE TABLE `study_group_sessions` (
  `study_id` int(11) NOT NULL,
  `study_user_group` int(11) NOT NULL,
  `session_order` tinyint(4) NOT NULL,
  `session_time` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_group_sessions` */

insert  into `study_group_sessions`(`study_id`,`study_user_group`,`session_order`,`session_time`) values 
(1,1,1,45),
(1,2,2,30),
(1,2,2,30);

/*Table structure for table `study_group_sessions_autosave` */

DROP TABLE IF EXISTS `study_group_sessions_autosave`;

CREATE TABLE `study_group_sessions_autosave` (
  `study_id` int(11) NOT NULL,
  `study_user_group` int(11) NOT NULL,
  `session_order` tinyint(4) NOT NULL,
  `session_time` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_group_sessions_autosave` */

/*Table structure for table `study_locations` */

DROP TABLE IF EXISTS `study_locations`;

CREATE TABLE `study_locations` (
  `study_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_locations` */

insert  into `study_locations`(`study_id`,`location_id`) values 
(1,1);

/*Table structure for table `study_locations_autosave` */

DROP TABLE IF EXISTS `study_locations_autosave`;

CREATE TABLE `study_locations_autosave` (
  `study_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_locations_autosave` */

/*Table structure for table `study_participant_status` */

DROP TABLE IF EXISTS `study_participant_status`;

CREATE TABLE `study_participant_status` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `study_participant_status` */

insert  into `study_participant_status`(`id`,`status`) values 
(1,'New'),
(2,'Approved'),
(3,'Screened'),
(4,'Emailed'),
(5,'LM'),
(6,'Scheduled'),
(7,'DNQ'),
(8,'Confirmed');

/*Table structure for table `study_participants` */

DROP TABLE IF EXISTS `study_participants`;

CREATE TABLE `study_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_user_group` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `participant_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_study_participants_user_group` (`study_user_group`),
  KEY `FK_study_participants_participant` (`participant_id`),
  KEY `FK_study_participants_participant_status` (`participant_status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `study_participants` */

insert  into `study_participants`(`id`,`study_user_group`,`participant_id`,`participant_status`) values 
(1,1,1,1),
(2,1,2,1),
(3,1,3,1),
(4,2,4,1),
(5,2,5,1),
(6,2,6,1),
(7,2,7,1);

/*Table structure for table `study_screener_questions` */

DROP TABLE IF EXISTS `study_screener_questions`;

CREATE TABLE `study_screener_questions` (
  `study_user_group` int(11) NOT NULL,
  `screener_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `study_screener_questions` */

insert  into `study_screener_questions`(`study_user_group`,`screener_question`) values 
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(1,12),
(2,12),
(2,13);

/*Table structure for table `study_status` */

DROP TABLE IF EXISTS `study_status`;

CREATE TABLE `study_status` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `study_status` */

insert  into `study_status`(`id`,`status_name`) values 
(1,'Active'),
(2,'Pending'),
(3,'Close');

/*Table structure for table `study_types` */

DROP TABLE IF EXISTS `study_types`;

CREATE TABLE `study_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `study_types` */

insert  into `study_types`(`id`,`study_type`) values 
(1,'Formative'),
(2,'Formative #2'),
(3,'Formative #3'),
(4,'Pilot'),
(5,'Validation');

/*Table structure for table `study_user_groups` */

DROP TABLE IF EXISTS `study_user_groups`;

CREATE TABLE `study_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `user_group` int(11) NOT NULL COMMENT '1=occupation , 2=medical , 3=groups',
  `number_of_participants` smallint(6) NOT NULL,
  `payment_amount` decimal(10,0) NOT NULL,
  `training` tinyint(4) NOT NULL,
  `number_of_sessions` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `study_user_groups` */

insert  into `study_user_groups`(`id`,`study_id`,`user_group`,`number_of_participants`,`payment_amount`,`training`,`number_of_sessions`) values 
(1,1,3,12,25,2,1),
(2,1,4,24,25,2,2);

/*Table structure for table `study_user_groups_autosave` */

DROP TABLE IF EXISTS `study_user_groups_autosave`;

CREATE TABLE `study_user_groups_autosave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `user_group` int(11) DEFAULT '1',
  `number_of_participants` smallint(6) DEFAULT NULL,
  `payment_amount` decimal(10,0) DEFAULT NULL,
  `training` tinyint(4) DEFAULT NULL,
  `number_of_sessions` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `study_user_groups_autosave` */

/*Table structure for table `transportation_status` */

DROP TABLE IF EXISTS `transportation_status`;

CREATE TABLE `transportation_status` (
  `status_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `transportation_status` varchar(25) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transportation_status` */

/*Table structure for table `user_assign_role` */

DROP TABLE IF EXISTS `user_assign_role`;

CREATE TABLE `user_assign_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_assign_role` */

insert  into `user_assign_role`(`user_id`,`role_id`) values 
(6,11),
(6,12),
(6,13),
(6,14),
(6,11),
(6,12),
(6,13),
(6,14),
(6,11),
(6,12),
(6,13),
(6,14),
(7,12),
(7,13),
(6,11),
(6,12),
(6,13),
(6,14),
(2,11),
(3,12),
(4,13),
(5,14),
(1,11),
(1,12),
(1,13),
(1,14);

/*Table structure for table `user_groups` */

DROP TABLE IF EXISTS `user_groups`;

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `user_groups` */

insert  into `user_groups`(`id`,`group_name`) values 
(1,'Teen (12-17)'),
(2,'Child (Under 12)'),
(3,'iPhone User'),
(4,'Non-iPhone User'),
(5,'PC User'),
(6,'Mac User'),
(7,'Tablet User'),
(8,'Laptop User'),
(9,'Desktop User'),
(10,'Fitbit Users'),
(11,'Garmin Users'),
(12,'Printer Users');

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(25) NOT NULL,
  `record_status` tinyint(4) NOT NULL DEFAULT '1',
  `color` varchar(25) DEFAULT 'black',
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user_roles` */

insert  into `user_roles`(`role_id`,`role`,`record_status`,`color`,`description`) values 
(1,'Recruiter',1,'black',NULL),
(2,'Lead',1,'black',NULL),
(3,'Datalogger',1,'black',NULL),
(4,'AV',1,'black',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `record_status` tinyint(4) NOT NULL DEFAULT '1',
  `user_role` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_mod` datetime NOT NULL,
  `active` tinyint(4) DEFAULT '1',
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`,`record_status`),
  KEY `users_userroles` (`user_role`),
  KEY `users_persons` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`first_name`,`last_name`,`username`,`email`,`password`,`record_status`,`user_role`,`created`,`last_mod`,`active`,`person_id`) values 
(1,'Admin','User','admin','iaa.admin@mailinator.com','68eacb97d86f0c4621fa2b0e17cabd8c',1,NULL,'2017-10-06 21:16:24','2017-10-06 12:13:41',1,NULL),
(2,'Recruiter','User','Recruiter.User','Recruiter.User@mailinator.com','2956a5fde5fe078188d1d3aae320c02f',1,NULL,'2017-10-06 21:14:30','0000-00-00 00:00:00',1,NULL),
(3,'Lead','User','Lead.User','Lead.User@mailinator.com','2956a5fde5fe078188d1d3aae320c02f',1,NULL,'2017-10-06 21:14:58','0000-00-00 00:00:00',1,NULL),
(4,'Datalogger','User','Datalogger.User','Datalogger.User@mailinator.com','2956a5fde5fe078188d1d3aae320c02f',1,NULL,'2017-10-06 21:15:44','0000-00-00 00:00:00',1,NULL),
(5,'AV','User','AV.User','AV.User@mailinator.com','2956a5fde5fe078188d1d3aae320c02f',1,NULL,'2017-10-06 21:16:09','0000-00-00 00:00:00',1,NULL),
(6,'Test','User1','Test.User1','Test.User1@mailinator.com','2956a5fde5fe078188d1d3aae320c02f',1,NULL,'2017-10-06 21:17:08','0000-00-00 00:00:00',1,NULL);

/* Procedure structure for procedure `Clear_login_attempts` */

/*!50003 DROP PROCEDURE IF EXISTS  `Clear_login_attempts` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `Clear_login_attempts`(IN `user_id` INT(11))
BEGIN
DELETE FROM login_attempts WHERE login_attempts.user_id=user_id;
END */$$
DELIMITER ;

/*Table structure for table `studies_view` */

DROP TABLE IF EXISTS `studies_view`;

/*!50001 DROP VIEW IF EXISTS `studies_view` */;
/*!50001 DROP TABLE IF EXISTS `studies_view` */;

/*!50001 CREATE TABLE  `studies_view`(
 `study_id` int(11) ,
 `study_number` varchar(10) ,
 `client_name` varchar(50) ,
 `product_name` varchar(50) ,
 `study_type` varchar(50) 
)*/;

/*Table structure for table `v_active_users` */

DROP TABLE IF EXISTS `v_active_users`;

/*!50001 DROP VIEW IF EXISTS `v_active_users` */;
/*!50001 DROP TABLE IF EXISTS `v_active_users` */;

/*!50001 CREATE TABLE  `v_active_users`(
 `user_id` int(11) ,
 `uname` varchar(51) ,
 `username` varchar(25) 
)*/;

/*Table structure for table `vw_participant_payment` */

DROP TABLE IF EXISTS `vw_participant_payment`;

/*!50001 DROP VIEW IF EXISTS `vw_participant_payment` */;
/*!50001 DROP TABLE IF EXISTS `vw_participant_payment` */;

/*!50001 CREATE TABLE  `vw_participant_payment`(
 `total_payment_amount` decimal(32,0) ,
 `participant_id` int(11) ,
 `participant_status` tinyint(4) ,
 `study_id` int(11) 
)*/;

/*View structure for view studies_view */

/*!50001 DROP TABLE IF EXISTS `studies_view` */;
/*!50001 DROP VIEW IF EXISTS `studies_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `studies_view` AS select `studies`.`study_id` AS `study_id`,`studies`.`study_number` AS `study_number`,`clients`.`client_name` AS `client_name`,`products`.`product_name` AS `product_name`,`study_types`.`study_type` AS `study_type` from (((`studies` join `clients` on((`studies`.`client_id` = `clients`.`client_id`))) join `products` on((`studies`.`product_name` = `products`.`product_id`))) join `study_types` on((`studies`.`study_type` = `study_types`.`id`))) */;

/*View structure for view v_active_users */

/*!50001 DROP TABLE IF EXISTS `v_active_users` */;
/*!50001 DROP VIEW IF EXISTS `v_active_users` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_active_users` AS select `users`.`user_id` AS `user_id`,concat(`users`.`first_name`,' ',`users`.`last_name`) AS `uname`,`users`.`username` AS `username` from `users` where (`users`.`active` = 1) order by concat(`users`.`first_name`,' ',`users`.`last_name`) */;

/*View structure for view vw_participant_payment */

/*!50001 DROP TABLE IF EXISTS `vw_participant_payment` */;
/*!50001 DROP VIEW IF EXISTS `vw_participant_payment` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_participant_payment` AS select sum(`sug`.`payment_amount`) AS `total_payment_amount`,`sp`.`participant_id` AS `participant_id`,`sp`.`participant_status` AS `participant_status`,`sug`.`study_id` AS `study_id` from (`study_participants` `sp` join `study_user_groups` `sug` on((`sug`.`id` = `sp`.`study_user_group`))) where (`sp`.`participant_status` = 6) group by `sp`.`participant_id`,`sug`.`study_id` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
