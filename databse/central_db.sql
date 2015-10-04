-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.39-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema central_db
--

CREATE DATABASE IF NOT EXISTS central_db;
USE central_db;

--
-- Temporary table structure for view `central_stock_info`
--
DROP TABLE IF EXISTS `central_stock_info`;
DROP VIEW IF EXISTS `central_stock_info`;
CREATE TABLE `central_stock_info` (
  `med_type` enum('Tablet','Capsul','Shyrup','Injection','Cream','Drop','Powder','Miscelaneous'),
  `med_gen_name` varchar(30),
  `med_com_name` varchar(45),
  `med_weight` varchar(45),
  `med_qty` int(10) unsigned,
  `pp_price` double(10,2),
  `purchase_dt` date,
  `manufacturing_dt` date,
  `expiring_dt` date
);

--
-- Temporary table structure for view `stoc_transfer`
--
DROP TABLE IF EXISTS `stoc_transfer`;
DROP VIEW IF EXISTS `stoc_transfer`;
CREATE TABLE `stoc_transfer` (
  `med_type` enum('Tablet','Capsul','Shyrup','Injection','Cream','Drop','Powder','Miscelaneous'),
  `med_gen_name` varchar(30),
  `med_com_name` varchar(45),
  `med_weight` varchar(45),
  `med_qty` int(10) unsigned
);

--
-- Temporary table structure for view `stock_transfer`
--
DROP TABLE IF EXISTS `stock_transfer`;
DROP VIEW IF EXISTS `stock_transfer`;
CREATE TABLE `stock_transfer` (
  `medicine_id_fk` int(10) unsigned,
  `med_type` enum('Tablet','Capsul','Shyrup','Injection','Cream','Drop','Powder','Miscelaneous'),
  `med_gen_name` varchar(30),
  `med_com_name` varchar(45),
  `med_weight` varchar(45),
  `med_qty` decimal(33,0)
);

--
-- Temporary table structure for view `sub_stock_info`
--
DROP TABLE IF EXISTS `sub_stock_info`;
DROP VIEW IF EXISTS `sub_stock_info`;
CREATE TABLE `sub_stock_info` (
  `med_type` enum('Tablet','Capsul','Shyrup','Injection','Cream','Drop','Powder','Miscelaneous'),
  `med_gen_name` varchar(30),
  `med_com_name` varchar(45),
  `med_weight` varchar(45),
  `med_qty` int(10) unsigned,
  `pp_price` double(10,2),
  `purchase_dt` date,
  `manufacturing_dt` date,
  `expiring_dt` date
);

--
-- Definition of table `assistant`
--

DROP TABLE IF EXISTS `assistant`;
CREATE TABLE `assistant` (
  `assistant_pk` int(10) NOT NULL AUTO_INCREMENT,
  `department_fk` smallint(5) NOT NULL,
  `assistant_fk` int(10) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`assistant_pk`),
  UNIQUE KEY `department` (`department_fk`,`assistant_fk`),
  KEY `FK_assistant_department` (`department_fk`),
  KEY `FK_assistant_employee` (`assistant_fk`),
  CONSTRAINT `FK_assistant_department` FOREIGN KEY (`department_fk`) REFERENCES `department` (`dept_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_assistant_employee` FOREIGN KEY (`assistant_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='unique key: department, assistant';

--
-- Dumping data for table `assistant`
--

/*!40000 ALTER TABLE `assistant` DISABLE KEYS */;
/*!40000 ALTER TABLE `assistant` ENABLE KEYS */;


--
-- Definition of table `committee_member`
--

DROP TABLE IF EXISTS `committee_member`;
CREATE TABLE `committee_member` (
  `committee_member_pk` int(10) NOT NULL AUTO_INCREMENT,
  `exam_committee_fk` int(10) NOT NULL,
  `member_fk` int(10) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`committee_member_pk`),
  UNIQUE KEY `exam_committee` (`exam_committee_fk`,`member_fk`),
  KEY `FK_committee_member_employee` (`member_fk`),
  CONSTRAINT `FK_committee_member_employee` FOREIGN KEY (`member_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_committee_member_exam_committee` FOREIGN KEY (`exam_committee_fk`) REFERENCES `exam_committee` (`exam_committee_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `committee_member`
--

/*!40000 ALTER TABLE `committee_member` DISABLE KEYS */;
INSERT INTO `committee_member` (`committee_member_pk`,`exam_committee_fk`,`member_fk`,`state`) VALUES 
 (1,2,19,'initial'),
 (2,2,21,'initial'),
 (3,2,22,'initial'),
 (4,39,19,'initial'),
 (5,39,21,'initial'),
 (6,39,22,'initial'),
 (7,40,19,'initial'),
 (8,40,21,'initial'),
 (9,40,22,'initial');
/*!40000 ALTER TABLE `committee_member` ENABLE KEYS */;


--
-- Definition of table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
CREATE TABLE `company_info` (
  `company_id_pk` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `company_address` varchar(65) DEFAULT NULL,
  `comp_contact_no` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`company_id_pk`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5556 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_info`
--

/*!40000 ALTER TABLE `company_info` DISABLE KEYS */;
INSERT INTO `company_info` (`company_id_pk`,`company_name`,`company_address`,`comp_contact_no`) VALUES 
 (5550,'Suhahjalal Medical Store',NULL,NULL),
 (5551,'Acmee Labrotories Ltd',NULL,NULL),
 (5552,'Navana Pharmaceutical Ltd',NULL,NULL),
 (5553,'Becam Pharmaceutical Ltd',NULL,NULL),
 (5554,'Antora Labrotories Ltd',NULL,NULL),
 (5555,'Square Pharmaceutical Ltd',NULL,NULL);
/*!40000 ALTER TABLE `company_info` ENABLE KEYS */;


--
-- Definition of table `course_info`
--

DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info` (
  `course_info_pk` int(10) NOT NULL AUTO_INCREMENT,
  `course_fk` int(10) NOT NULL,
  `university_semester_fk` smallint(5) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`course_info_pk`) USING BTREE,
  UNIQUE KEY `course` (`course_fk`,`university_semester_fk`),
  KEY `FK_class_university_semester` (`university_semester_fk`),
  CONSTRAINT `FK_course_info_syllabus` FOREIGN KEY (`course_fk`) REFERENCES `syllabus` (`syllabus_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_course_info_univ_semester` FOREIGN KEY (`university_semester_fk`) REFERENCES `university_semester` (`university_semester_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_info`
--

/*!40000 ALTER TABLE `course_info` DISABLE KEYS */;
INSERT INTO `course_info` (`course_info_pk`,`course_fk`,`university_semester_fk`,`state`) VALUES 
 (8,33,8,'finalize'),
 (10,31,8,'finalize'),
 (11,42,8,'finalize');
/*!40000 ALTER TABLE `course_info` ENABLE KEYS */;


--
-- Definition of table `course_teacher`
--

DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher` (
  `course_teacher_pk` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_course_info_fk` int(10) NOT NULL,
  `teacher_fk` int(10) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`course_teacher_pk`),
  KEY `FK_course_teacher_course_info` (`teacher_course_info_fk`),
  KEY `FK_course_teacher_employee` (`teacher_fk`),
  CONSTRAINT `FK_course_teacher_course_info` FOREIGN KEY (`teacher_course_info_fk`) REFERENCES `course_info` (`course_info_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_course_teacher_employee` FOREIGN KEY (`teacher_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_teacher`
--

/*!40000 ALTER TABLE `course_teacher` DISABLE KEYS */;
INSERT INTO `course_teacher` (`course_teacher_pk`,`teacher_course_info_fk`,`teacher_fk`,`state`) VALUES 
 (15,8,20,'finalize'),
 (17,8,22,'finalize'),
 (18,8,19,'finalize'),
 (20,10,20,'finalize'),
 (21,10,19,'finalize'),
 (22,10,21,'finalize'),
 (23,10,22,'finalize'),
 (25,11,19,'finalize');
/*!40000 ALTER TABLE `course_teacher` ENABLE KEYS */;


--
-- Definition of table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `course_type_pk` smallint(5) NOT NULL AUTO_INCREMENT,
  `course_type_name` varchar(50) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`course_type_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_type`
--

/*!40000 ALTER TABLE `course_type` DISABLE KEYS */;
INSERT INTO `course_type` (`course_type_pk`,`course_type_name`,`state`) VALUES 
 (1,'Theory','finalize'),
 (2,'Lab','finalize'),
 (3,'Project','finalize'),
 (4,'viva','finalize');
/*!40000 ALTER TABLE `course_type` ENABLE KEYS */;


--
-- Definition of table `credit_info`
--

DROP TABLE IF EXISTS `credit_info`;
CREATE TABLE `credit_info` (
  `credit_info_pk` int(10) NOT NULL AUTO_INCREMENT,
  `dept_degree_fk` int(10) NOT NULL,
  `session` smallint(5) NOT NULL,
  `semester` smallint(5) NOT NULL,
  `required_credit` float NOT NULL,
  `max_credit` float NOT NULL,
  `credit_fees` blob NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`credit_info_pk`) USING BTREE,
  UNIQUE KEY `dept_degree` (`dept_degree_fk`,`session`,`semester`),
  KEY `FK_cradit_info_degree_OB_dept` (`dept_degree_fk`),
  CONSTRAINT `FK_credit_info_degree_OB_dept` FOREIGN KEY (`dept_degree_fk`) REFERENCES `degree_offered_by_dept` (`dept_degree_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='unique key: dept_degree, session, semester';

--
-- Dumping data for table `credit_info`
--

/*!40000 ALTER TABLE `credit_info` DISABLE KEYS */;
INSERT INTO `credit_info` (`credit_info_pk`,`dept_degree_fk`,`session`,`semester`,`required_credit`,`max_credit`,`credit_fees`,`state`) VALUES 
 (9,14,2006,1,0,30.5,0x7B22637265646974466565735468656F7279223A223535222C22637265646974466565734C6162223A223735222C226372656469744665657346696E65223A223330227D,'initial'),
 (10,14,2006,2,12,30.5,0x7B22637265646974466565735468656F7279223A223535222C22637265646974466565734C6162223A223635222C226372656469744665657346696E65223A223330227D,'initial'),
 (11,14,2006,3,32,30.5,0x7B22637265646974466565735468656F7279223A223535222C22637265646974466565734C6162223A223735222C226372656469744665657346696E65223A223530227D,'initial'),
 (12,14,2006,4,52,30.5,0x7B22637265646974466565735468656F7279223A223535222C22637265646974466565734C6162223A223735222C226372656469744665657346696E65223A223330227D,'initial'),
 (13,14,2006,5,72,30.5,0x7B22637265646974466565735468656F7279223A223535222C22637265646974466565734C6162223A223735222C226372656469744665657346696E65223A223330227D,'initial'),
 (14,14,2006,6,92,30.5,0x7B22637265646974466565735468656F7279223A223535222C22637265646974466565734C6162223A223735222C226372656469744665657346696E65223A223330227D,'initial'),
 (15,14,2006,7,112,30.5,0x7B22637265646974466565735468656F7279223A223535222C22637265646974466565734C6162223A223735222C226372656469744665657346696E65223A223330227D,'initial'),
 (16,14,2006,8,132,30.5,0x7B22637265646974466565735468656F7279223A223535222C22637265646974466565734C6162223A223735222C226372656469744665657346696E65223A223330227D,'initial'),
 (17,14,2008,1,0,30.5,0x646E,'initial'),
 (18,14,2008,2,12,30.5,0x646E,'initial'),
 (19,14,2008,3,32,30.5,0x646E,'initial'),
 (20,14,2008,4,52,30.5,0x646E,'initial'),
 (21,14,2008,5,72,30.5,0x646E,'initial'),
 (22,14,2008,6,92,30.5,0x646E,'initial'),
 (23,14,2008,7,112,30.5,0x646E,'initial'),
 (24,14,2008,8,132,30.5,0x646E,'initial'),
 (25,14,2009,1,0,30.5,0x646E,'initial'),
 (26,14,2009,2,12,30.5,0x646E,'initial'),
 (27,14,2009,3,32,30.5,0x646E,'initial'),
 (28,14,2009,4,52,30.5,0x646E,'initial'),
 (29,14,2009,5,72,30.5,0x646E,'initial'),
 (30,14,2009,6,92,30.5,0x646E,'initial'),
 (31,14,2009,7,112,30.5,0x646E,'initial'),
 (32,14,2009,8,132,30.5,0x646E,'initial'),
 (33,14,2010,1,0,30.5,0x646E,'initial'),
 (34,14,2010,2,12,30.5,0x646E,'initial'),
 (35,14,2010,3,32,30.5,0x646E,'initial'),
 (36,14,2010,4,52,30.5,0x646E,'initial'),
 (37,14,2010,5,72,30.5,0x646E,'initial'),
 (38,14,2010,6,92,30.5,0x646E,'initial'),
 (39,14,2010,7,112,30.5,0x646E,'initial'),
 (40,14,2010,8,132,30.5,0x646E,'initial'),
 (41,14,2007,1,0,30.5,0x646E,'initial'),
 (42,14,2007,2,12,30.5,0x646E,'initial'),
 (43,14,2007,3,32,30.5,0x646E,'initial'),
 (44,14,2007,4,52,30.5,0x646E,'initial'),
 (45,14,2007,5,72,30.5,0x646E,'initial'),
 (46,14,2007,6,92,30.5,0x646E,'initial'),
 (47,14,2007,7,112,30.5,0x646E,'initial'),
 (48,14,2007,8,132,30.5,0x646E,'initial'),
 (49,14,2012,1,0,30.5,0x646E,'initial'),
 (50,14,2012,2,12,30.5,0x646E,'initial'),
 (51,14,2012,3,32,30.5,0x646E,'initial'),
 (52,14,2012,4,52,30.5,0x646E,'initial'),
 (53,14,2012,5,72,30.5,0x646E,'initial'),
 (54,14,2012,6,92,30.5,0x646E,'initial'),
 (55,14,2012,7,112,30.5,0x646E,'initial'),
 (56,14,2012,8,132,30.5,0x646E,'initial'),
 (57,14,2013,1,0,30.5,0x646E,'initial'),
 (58,14,2013,2,12,30.5,0x646E,'initial'),
 (59,14,2013,3,32,30.5,0x646E,'initial'),
 (60,14,2013,4,52,30.5,0x646E,'initial'),
 (61,14,2013,5,72,30.5,0x646E,'initial'),
 (62,14,2013,6,92,30.5,0x646E,'initial'),
 (63,14,2013,7,112,30.5,0x646E,'initial'),
 (64,14,2013,8,132,30.5,0x646E,'initial'),
 (65,14,2014,1,0,30.5,0x646E,'initial'),
 (66,14,2014,2,12,30.5,0x646E,'initial'),
 (67,14,2014,3,32,30.5,0x646E,'initial'),
 (68,14,2014,4,52,30.5,0x646E,'initial'),
 (69,14,2014,5,72,30.5,0x646E,'initial'),
 (70,14,2014,6,92,30.5,0x646E,'initial'),
 (71,14,2014,7,112,30.5,0x646E,'initial'),
 (72,14,2014,8,132,30.5,0x646E,'initial'),
 (73,14,2016,1,0,30.5,0x646E,'initial'),
 (74,14,2016,2,12,30.5,0x646E,'initial'),
 (75,14,2016,3,32,30.5,0x646E,'initial'),
 (76,14,2016,4,52,30.5,0x646E,'initial'),
 (77,14,2016,5,72,30.5,0x646E,'initial'),
 (78,14,2016,6,92,30.5,0x646E,'initial'),
 (79,14,2016,7,112,30.5,0x646E,'initial'),
 (80,14,2016,8,132,30.5,0x646E,'initial');
/*!40000 ALTER TABLE `credit_info` ENABLE KEYS */;


--
-- Definition of table `current_semester`
--

DROP TABLE IF EXISTS `current_semester`;
CREATE TABLE `current_semester` (
  `current_semester_pk` int(10) NOT NULL AUTO_INCREMENT,
  `student_fk` int(10) NOT NULL,
  `university_semester_fk` smallint(5) NOT NULL,
  `current_semester` smallint(5) NOT NULL,
  `expected_semester` smallint(5) NOT NULL,
  `fees_to_pay` smallint(5) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`current_semester_pk`),
  UNIQUE KEY `student` (`student_fk`,`university_semester_fk`),
  KEY `FK_cur_sem_university_semester` (`university_semester_fk`),
  CONSTRAINT `FK_cur_sem_student` FOREIGN KEY (`student_fk`) REFERENCES `student` (`student_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cur_sem_university_semester` FOREIGN KEY (`university_semester_fk`) REFERENCES `university_semester` (`university_semester_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `current_semester`
--

/*!40000 ALTER TABLE `current_semester` DISABLE KEYS */;
INSERT INTO `current_semester` (`current_semester_pk`,`student_fk`,`university_semester_fk`,`current_semester`,`expected_semester`,`fees_to_pay`,`state`) VALUES 
 (26,8,8,1,1,1120,'finalize'),
 (27,9,8,1,1,1120,'finalize'),
 (28,10,8,1,1,1120,'finalize'),
 (29,2,8,2,2,1120,'finalize'),
 (30,23,8,1,1,1120,'finalize'),
 (36,3,9,1,2,1120,'finalize'),
 (37,9,9,1,2,1120,'finalize'),
 (38,24,8,1,1,1120,'finalize'),
 (40,23,9,1,2,1120,'finalize'),
 (42,8,9,1,2,1120,'finalize'),
 (43,10,9,1,2,1120,'finalize'),
 (44,2,9,1,2,1120,'finalize'),
 (45,24,9,1,2,1120,'finalize'),
 (46,12,9,1,2,1120,'finalize');
/*!40000 ALTER TABLE `current_semester` ENABLE KEYS */;


--
-- Definition of table `degree`
--

DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree` (
  `degree_pk` smallint(5) NOT NULL AUTO_INCREMENT,
  `degree_type` varchar(50) NOT NULL,
  `degree_category` varchar(50) NOT NULL,
  `total_year` smallint(5) NOT NULL,
  `total_semester` smallint(5) NOT NULL,
  `degree_name` varchar(100) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`degree_pk`),
  UNIQUE KEY `degree_type` (`degree_type`,`degree_category`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='unique key: degree_type( rename degree_name), degree_categor';

--
-- Dumping data for table `degree`
--

/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` (`degree_pk`,`degree_type`,`degree_category`,`total_year`,`total_semester`,`degree_name`,`state`) VALUES 
 (1,'Honours','BSc.Engr',4,8,'Honors','finalize'),
 (2,'Honours','BSc.Arch',4,8,'Honors','finalize'),
 (3,'Honours','BSc.Hons',4,8,'Honors','finalize'),
 (6,'Honours','BSS',4,8,'Honours','finalize');
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;


--
-- Definition of table `degree_offered_by_dept`
--

DROP TABLE IF EXISTS `degree_offered_by_dept`;
CREATE TABLE `degree_offered_by_dept` (
  `dept_degree_pk` int(10) NOT NULL AUTO_INCREMENT,
  `department_fk` smallint(5) NOT NULL,
  `degree_fk` smallint(5) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`dept_degree_pk`),
  UNIQUE KEY `department` (`department_fk`,`degree_fk`),
  KEY `FK_degree_ob_dept_department` (`department_fk`),
  KEY `FK_degree_dept_degree` (`degree_fk`),
  CONSTRAINT `FK_degree_dept_degree` FOREIGN KEY (`degree_fk`) REFERENCES `degree` (`degree_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_degree_ob_dept_department` FOREIGN KEY (`department_fk`) REFERENCES `department` (`dept_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='unique key: department, degree';

--
-- Dumping data for table `degree_offered_by_dept`
--

/*!40000 ALTER TABLE `degree_offered_by_dept` DISABLE KEYS */;
INSERT INTO `degree_offered_by_dept` (`dept_degree_pk`,`department_fk`,`degree_fk`,`state`) VALUES 
 (10,4,1,'finalize'),
 (14,1,1,'finalize'),
 (15,2,1,'finalize');
/*!40000 ALTER TABLE `degree_offered_by_dept` ENABLE KEYS */;


--
-- Definition of table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dept_pk` smallint(5) NOT NULL AUTO_INCREMENT,
  `dept_id` smallint(5) NOT NULL,
  `dept_code` varchar(10) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `school_fk` smallint(5) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`dept_pk`),
  UNIQUE KEY `dept_id` (`dept_id`,`school_fk`),
  KEY `FK_depertment_school` (`school_fk`),
  CONSTRAINT `FK_depertment_school` FOREIGN KEY (`school_fk`) REFERENCES `school` (`school_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='unique key: dept_id, school';

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`dept_pk`,`dept_id`,`dept_code`,`dept_name`,`school_fk`,`state`) VALUES 
 (1,31,'CSE','Computer science N eng.',1,'finalize'),
 (2,33,'IPE','Industry',1,'finalize'),
 (3,35,'CHE','Chemistry',2,'finalize'),
 (4,36,'PHY','Physics',2,'finalize'),
 (5,38,'BIO','Biotechnology',3,'finalize'),
 (6,39,'FTT','Food and Tea',3,'finalize'),
 (7,100,'MED','Medical Centre',3,'initial');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


--
-- Definition of table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE `designation` (
  `designation_pk` smallint(5) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`designation_pk`),
  UNIQUE KEY `designation_name` (`designation_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='unique key: designation_name';

--
-- Dumping data for table `designation`
--

/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` (`designation_pk`,`designation_name`,`state`) VALUES 
 (1,'Lect','finalize'),
 (2,'prof','finalize'),
 (3,'asst','finalize'),
 (4,'contrl','finalize'),
 (5,'asst contrl','finalize'),
 (6,'official','finalize'),
 (8,'head','finalize'),
 (9,'medicine_distributor','finalize'),
 (10,'Medical Officer','finalize'),
 (11,'Senior Pharmacist','finalize');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;


--
-- Definition of table `diagnosis_info`
--

DROP TABLE IF EXISTS `diagnosis_info`;
CREATE TABLE `diagnosis_info` (
  `diagnosis_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `observation_name` varchar(45) NOT NULL,
  `observation_type` enum('cheif_complaint','on_examination','investigation') NOT NULL,
  `observation_value` text,
  PRIMARY KEY (`diagnosis_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosis_info`
--

/*!40000 ALTER TABLE `diagnosis_info` DISABLE KEYS */;
INSERT INTO `diagnosis_info` (`diagnosis_pk`,`observation_name`,`observation_type`,`observation_value`) VALUES 
 (6,'Fever','cheif_complaint',NULL),
 (7,'Caugh','cheif_complaint',NULL),
 (8,'Blood Pressure','on_examination','[\"120/80\",\"130/70\",\"120/90\",\"110/80\",\"130/60\",\"140/80\"]'),
 (9,'Temperature','on_examination','[90,91,92,101,103,105]'),
 (10,'ECG','investigation',NULL),
 (11,'CBE','investigation',NULL),
 (12,'Throught Pain','cheif_complaint',NULL),
 (13,'Back Pain','cheif_complaint',NULL),
 (14,'Vomiting','cheif_complaint',NULL),
 (15,'Urine RIE','investigation',NULL),
 (16,'Lipidprofile','investigation',NULL),
 (17,'CXR','investigation',NULL),
 (20,'Headche','cheif_complaint',NULL),
 (21,'EMR','investigation',NULL),
 (22,'Anaemia','on_examination','[\"+\",\"-\"]'),
 (23,'Abdonem','on_examination','[\"Soft + \",\"Soft - \"]'),
 (24,'Pulse','on_examination','[75,76,77,78,79,80,81,82,83,85]');
/*!40000 ALTER TABLE `diagnosis_info` ENABLE KEYS */;


--
-- Definition of table `distributed_med_log`
--

DROP TABLE IF EXISTS `distributed_med_log`;
CREATE TABLE `distributed_med_log` (
  `distributed_med_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `med_id_fk` int(10) unsigned NOT NULL,
  `med_qty` int(5) unsigned NOT NULL,
  `prescription_fk` int(10) unsigned NOT NULL,
  `employee_fk` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`distributed_med_pk`),
  KEY `FK_distributed_med_log_med_id` (`med_id_fk`),
  CONSTRAINT `FK_distributed_med_log_med_id` FOREIGN KEY (`med_id_fk`) REFERENCES `medicine_com_info` (`med_com_name_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributed_med_log`
--

/*!40000 ALTER TABLE `distributed_med_log` DISABLE KEYS */;
INSERT INTO `distributed_med_log` (`distributed_med_pk`,`med_id_fk`,`med_qty`,`prescription_fk`,`employee_fk`) VALUES 
 (1,6,10,59,NULL),
 (2,6,10,59,NULL),
 (3,6,10,59,NULL),
 (4,6,2,59,NULL),
 (5,6,5,54,NULL),
 (6,10,10,54,NULL),
 (7,6,5,54,NULL),
 (8,10,10,54,NULL),
 (9,6,21,59,NULL),
 (10,6,21,59,NULL),
 (11,6,5,54,NULL),
 (12,10,10,54,NULL),
 (13,6,21,59,NULL),
 (14,1,12,61,NULL),
 (15,1,12,61,NULL),
 (16,9,12,75,NULL),
 (17,9,12,75,NULL),
 (18,9,12,75,NULL),
 (19,9,12,75,NULL),
 (20,9,12,75,NULL),
 (21,9,12,75,NULL),
 (22,9,12,75,NULL),
 (23,9,12,75,NULL),
 (24,9,12,75,NULL),
 (25,4,12,75,NULL),
 (26,9,12,75,NULL),
 (27,4,12,75,NULL),
 (28,9,12,75,NULL),
 (29,4,12,75,NULL),
 (30,9,20,76,NULL),
 (31,6,20,76,NULL);
/*!40000 ALTER TABLE `distributed_med_log` ENABLE KEYS */;


--
-- Definition of trigger `update_sub_stock`
--

DROP TRIGGER /*!50030 IF EXISTS */ `update_sub_stock`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `update_sub_stock` BEFORE INSERT ON `distributed_med_log` FOR EACH ROW begin
  declare qty int;
  declare store_fk int;
  SELECT med_qty,stock_ledger_med_fk INTO qty,store_fk FROM medicine_store_info
  where medicine_id_fk=NEW.med_id_fk
  and store_type='substock' limit 1;
  update medicine_store_info
  set med_qty=med_qty-NEW.med_qty
  where medicine_id_fk=NEW.med_id_fk
  and stock_ledger_med_fk=store_fk
  and store_type='substock';
end $$

DELIMITER ;

--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_pk` int(10) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(50) NOT NULL,
  `employee_code` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`employee_pk`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='unique key: login_id';

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_pk`,`login_id`,`employee_code`,`password`,`state`) VALUES 
 (19,'a-cse','AI','p','initial'),
 (20,'b-cse','BI','p','initial'),
 (21,'c-cse','CI','p','initial'),
 (22,'d-cse','DI','p','initial'),
 (23,'e-cse','EI','p','initial'),
 (24,'null','null','null','finalize'),
 (25,'md','MD','md','initial'),
 (26,'doctor','doctor','d','initial'),
 (27,'pharmacist','MED-KMH','p','initial'),
 (29,'doctor2','MED-AJM','d','initial');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `employee_personal_info`
--

DROP TABLE IF EXISTS `employee_personal_info`;
CREATE TABLE `employee_personal_info` (
  `employee_personal_pk_fk` int(10) NOT NULL,
  `nick_name` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `full_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fathers_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `mothers_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `sex` enum('Male','Female') DEFAULT NULL,
  `religion` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `nationality` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `voter_id` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `passport_no` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `marital_status` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `blood_group` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `home_district` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `present_address` varchar(300) DEFAULT NULL,
  `permanent_address` varchar(300) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `web_address` varchar(100) DEFAULT NULL,
  `photo` blob,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_branch` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `police_varification_status` varchar(100) DEFAULT NULL,
  `nsi_verification_status` varchar(100) DEFAULT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') DEFAULT NULL,
  PRIMARY KEY (`employee_personal_pk_fk`) USING BTREE,
  CONSTRAINT `FK_employee_personal_info_employee` FOREIGN KEY (`employee_personal_pk_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_personal_info`
--

/*!40000 ALTER TABLE `employee_personal_info` DISABLE KEYS */;
INSERT INTO `employee_personal_info` (`employee_personal_pk_fk`,`nick_name`,`full_name`,`fathers_name`,`mothers_name`,`sex`,`religion`,`nationality`,`voter_id`,`passport_no`,`date_of_birth`,`place_of_birth`,`marital_status`,`blood_group`,`home_district`,`present_address`,`permanent_address`,`contact_no`,`email_address`,`web_address`,`photo`,`bank_name`,`bank_branch`,`bank_account_no`,`joining_date`,`police_varification_status`,`nsi_verification_status`,`state`) VALUES 
 (19,'aaaa','AbuNaserBikas','aaa','bbb','Male','','','','','1987-11-23 00:00:00','','','','','','','','','',0x646E,'','','','1987-11-23 00:00:00','','','initial'),
 (20,'bbbb','M. Zafar Iqbal','aaa','bbb','Male','','','','','1987-11-23 00:00:00','','','','','','','','','',0x646E,'','','','1987-11-23 00:00:00','','','initial'),
 (21,'cccc','Md. Shahidul Islam','aaa','bbb','Male','','','','','1987-11-23 00:00:00','','','','','','','','','',0x646E,'','','','1987-11-23 00:00:00','','','initial'),
 (22,'dddd','Md. Ruhul Amin','aaa','bbb','Male','','','','','1987-11-23 00:00:00','','','','','','','','','',0x646E,'','','','1987-11-23 00:00:00','','','initial'),
 (23,'eeee','Ayesha Tasnim','aaa','bbb','Male','','','','','1987-11-23 00:00:00','','','','','','','','','',0x646E,'','','','1987-11-23 00:00:00','','','initial'),
 (25,'md','Md. Abul Kalam',NULL,NULL,'Male',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (26,'nz','Dr. Md. Nazrul Islam',NULL,NULL,'Male',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (27,'ph',' Khondokhar Mosharom Hossian',NULL,NULL,'Male',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (29,'ds','Dr. Md. Ashaduz Zaman',NULL,NULL,'Male',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee_personal_info` ENABLE KEYS */;


--
-- Definition of table `employee_status`
--

DROP TABLE IF EXISTS `employee_status`;
CREATE TABLE `employee_status` (
  `employee_status_pk_fk` int(10) NOT NULL,
  `department_fk` smallint(5) NOT NULL,
  `designation_fk` smallint(5) NOT NULL,
  `is_academic` tinyint(1) NOT NULL,
  `is_permanent` tinyint(1) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `status` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`employee_status_pk_fk`) USING BTREE,
  KEY `FK_employee_status_dept` (`department_fk`),
  KEY `FK_employee_status_designation` (`designation_fk`),
  CONSTRAINT `FK_employee_status_dept` FOREIGN KEY (`department_fk`) REFERENCES `department` (`dept_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_employee_status_designation` FOREIGN KEY (`designation_fk`) REFERENCES `designation` (`designation_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_employee_status_employee` FOREIGN KEY (`employee_status_pk_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_status`
--

/*!40000 ALTER TABLE `employee_status` DISABLE KEYS */;
INSERT INTO `employee_status` (`employee_status_pk_fk`,`department_fk`,`designation_fk`,`is_academic`,`is_permanent`,`is_available`,`status`) VALUES 
 (19,1,1,1,0,1,'initial'),
 (20,1,1,1,1,0,'initial'),
 (21,1,2,0,0,0,'initial'),
 (22,1,3,1,0,0,'initial'),
 (23,1,1,1,0,1,'initial'),
 (25,7,9,0,1,1,'initial'),
 (26,7,10,0,1,1,'initial'),
 (27,7,11,0,1,1,'initial'),
 (29,7,10,0,1,1,'initial');
/*!40000 ALTER TABLE `employee_status` ENABLE KEYS */;


--
-- Definition of table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_pk` int(10) NOT NULL AUTO_INCREMENT,
  `university_semester_fk` smallint(5) NOT NULL,
  `dept_degree_fk` int(10) NOT NULL,
  `exam_start_date` date NOT NULL,
  `exam_end_date` date NOT NULL,
  `reg_start_date` date NOT NULL,
  `reg_end_date` date NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`exam_pk`),
  UNIQUE KEY `university_semester` (`university_semester_fk`,`dept_degree_fk`),
  KEY `FK_exam_degree_of_dept` (`dept_degree_fk`),
  CONSTRAINT `FK_exam_degree_of_dept` FOREIGN KEY (`dept_degree_fk`) REFERENCES `degree_offered_by_dept` (`dept_degree_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_exam_university_semester` FOREIGN KEY (`university_semester_fk`) REFERENCES `university_semester` (`university_semester_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam`
--

/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` (`exam_pk`,`university_semester_fk`,`dept_degree_fk`,`exam_start_date`,`exam_end_date`,`reg_start_date`,`reg_end_date`,`state`) VALUES 
 (1,5,14,'2010-05-01','2010-05-30','2010-01-15','2010-04-29','finalize'),
 (2,7,14,'2009-05-01','2009-05-30','2009-01-15','2009-04-29','finalize'),
 (3,8,14,'2010-12-01','2010-12-31','2010-07-01','2010-11-30','finalize'),
 (4,25,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (5,25,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (6,25,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (7,28,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (8,28,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (9,28,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (10,30,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (11,30,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (12,30,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (13,32,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (14,32,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (15,32,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (16,34,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (17,34,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (18,34,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (19,36,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (20,36,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (21,36,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (22,38,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (23,38,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (24,38,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (25,40,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (26,40,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (27,40,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (28,42,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (29,42,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (30,43,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (31,44,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (32,44,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (33,45,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (34,46,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (35,46,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (36,47,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (37,48,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (38,48,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (39,49,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (40,50,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (41,50,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (42,51,15,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (43,52,10,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize'),
 (44,52,14,'1900-01-01','1900-01-01','1900-01-01','1900-01-01','finalize');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;


--
-- Definition of table `exam_committee`
--

DROP TABLE IF EXISTS `exam_committee`;
CREATE TABLE `exam_committee` (
  `exam_committee_pk` int(10) NOT NULL AUTO_INCREMENT,
  `university_semester_fk` smallint(5) NOT NULL,
  `dept_degree_fk` int(10) NOT NULL,
  `semester` smallint(5) NOT NULL,
  `chairman_fk` int(10) NOT NULL,
  `external_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`exam_committee_pk`),
  UNIQUE KEY `university_semester` (`university_semester_fk`,`dept_degree_fk`,`semester`),
  KEY `FK_exam_committee_` (`dept_degree_fk`),
  KEY `FK_exam_committee_employee` (`chairman_fk`),
  CONSTRAINT `FK_exam_committee_` FOREIGN KEY (`dept_degree_fk`) REFERENCES `degree_offered_by_dept` (`dept_degree_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_exam_committee_employee` FOREIGN KEY (`chairman_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_exam_committee_university_semester` FOREIGN KEY (`university_semester_fk`) REFERENCES `university_semester` (`university_semester_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_committee`
--

/*!40000 ALTER TABLE `exam_committee` DISABLE KEYS */;
INSERT INTO `exam_committee` (`exam_committee_pk`,`university_semester_fk`,`dept_degree_fk`,`semester`,`chairman_fk`,`external_name`,`start_date`,`end_date`,`state`) VALUES 
 (1,8,14,6,19,'a','2010-01-10','2010-04-25','finalize'),
 (2,8,14,5,19,'fahmi','2010-11-30','2010-12-31','finalize'),
 (3,39,14,1,19,'c','2010-01-10','2010-04-20','finalize'),
 (4,39,14,5,20,'c','2009-01-10','2009-04-25','finalize'),
 (5,40,14,2,19,'a','1900-01-01','1900-01-01','finalize'),
 (6,40,14,6,19,'a','1900-01-01','1900-01-01','finalize'),
 (7,42,14,3,19,'a','1900-01-01','1900-01-01','finalize'),
 (8,42,14,7,19,'a','1900-01-01','1900-01-01','finalize'),
 (9,43,14,4,24,'a','1900-01-01','1900-01-01','finalize'),
 (10,43,14,8,24,'a','1900-01-01','1900-01-01','finalize'),
 (11,44,14,5,24,'','1900-01-01','1900-01-01','finalize'),
 (12,44,14,9,24,'','1900-01-01','1900-01-01','finalize'),
 (13,45,14,6,24,'','1900-01-01','1900-01-01','finalize'),
 (14,45,14,10,24,'','1900-01-01','1900-01-01','finalize'),
 (15,45,14,1,24,'','1900-01-01','1900-01-01','finalize'),
 (16,46,14,7,24,'','1900-01-01','1900-01-01','finalize'),
 (17,46,14,11,24,'','1900-01-01','1900-01-01','finalize'),
 (18,46,14,2,24,'','1900-01-01','1900-01-01','finalize'),
 (19,47,14,8,24,'','1900-01-01','1900-01-01','finalize'),
 (20,47,14,3,24,'','1900-01-01','1900-01-01','finalize'),
 (21,48,14,4,24,'','1900-01-01','1900-01-01','finalize'),
 (22,48,14,1,24,'','1900-01-01','1900-01-01','finalize'),
 (23,49,14,5,24,'','1900-01-01','1900-01-01','finalize'),
 (24,49,14,2,24,'','1900-01-01','1900-01-01','finalize'),
 (25,49,14,1,24,'','1900-01-01','1900-01-01','finalize'),
 (26,50,14,6,24,'','1900-01-01','1900-01-01','finalize'),
 (27,50,14,3,24,'','1900-01-01','1900-01-01','finalize'),
 (28,50,14,2,24,'','1900-01-01','1900-01-01','finalize'),
 (29,50,14,1,24,'','1900-01-01','1900-01-01','finalize'),
 (30,51,14,7,24,'','1900-01-01','1900-01-01','finalize'),
 (31,51,14,4,24,'','1900-01-01','1900-01-01','finalize'),
 (32,51,14,3,24,'','1900-01-01','1900-01-01','finalize'),
 (33,51,14,2,24,'','1900-01-01','1900-01-01','finalize'),
 (34,52,14,8,24,'','1900-01-01','1900-01-01','finalize'),
 (35,52,14,5,24,'','1900-01-01','1900-01-01','finalize'),
 (36,52,14,4,24,'','1900-01-01','1900-01-01','finalize'),
 (37,52,14,3,24,'','1900-01-01','1900-01-01','finalize'),
 (38,52,14,1,24,'','1900-01-01','1900-01-01','finalize'),
 (39,8,14,7,22,'fahmi','2010-11-01','2010-12-31','initial'),
 (40,8,14,1,22,'fahmi','2010-11-01','2010-12-31','initial');
/*!40000 ALTER TABLE `exam_committee` ENABLE KEYS */;


--
-- Definition of table `examiner`
--

DROP TABLE IF EXISTS `examiner`;
CREATE TABLE `examiner` (
  `examiner_pk` int(10) NOT NULL AUTO_INCREMENT,
  `examiner_course_info_fk` int(10) NOT NULL,
  `examiner_fk` int(10) NOT NULL,
  `examiner_role` enum('examiner1','examiner2','examiner3') NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`examiner_pk`),
  KEY `FK_examiner_course_info` (`examiner_course_info_fk`),
  KEY `FK_examiner_employee` (`examiner_fk`),
  CONSTRAINT `FK_examiner_course_info` FOREIGN KEY (`examiner_course_info_fk`) REFERENCES `course_info` (`course_info_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_examiner_employee` FOREIGN KEY (`examiner_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `examiner`
--

/*!40000 ALTER TABLE `examiner` DISABLE KEYS */;
INSERT INTO `examiner` (`examiner_pk`,`examiner_course_info_fk`,`examiner_fk`,`examiner_role`,`state`) VALUES 
 (17,11,19,'examiner1','finalize'),
 (18,11,19,'examiner2','finalize'),
 (19,11,19,'examiner3','finalize');
/*!40000 ALTER TABLE `examiner` ENABLE KEYS */;


--
-- Definition of table `general_advice`
--

DROP TABLE IF EXISTS `general_advice`;
CREATE TABLE `general_advice` (
  `general_adv_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `general_adv_txt` text NOT NULL,
  PRIMARY KEY (`general_adv_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_advice`
--

/*!40000 ALTER TABLE `general_advice` DISABLE KEYS */;
INSERT INTO `general_advice` (`general_adv_pk`,`general_adv_txt`) VALUES 
 (1,'Please do not run in the sun'),
 (2,'Please eat balance food'),
 (3,'Try to avoid brief and any other fat');
/*!40000 ALTER TABLE `general_advice` ENABLE KEYS */;


--
-- Definition of table `general_log`
--

DROP TABLE IF EXISTS `general_log`;
CREATE TABLE `general_log` (
  `general_log_pk` int(18) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(50) NOT NULL,
  `date_time` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  `operation_name` varchar(10) NOT NULL,
  `table` varchar(50) NOT NULL,
  `message` blob NOT NULL,
  `employee_id` int(10) NOT NULL,
  PRIMARY KEY (`general_log_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_log`
--

/*!40000 ALTER TABLE `general_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_log` ENABLE KEYS */;


--
-- Definition of table `head`
--

DROP TABLE IF EXISTS `head`;
CREATE TABLE `head` (
  `head_pk` smallint(5) NOT NULL AUTO_INCREMENT,
  `department_fk` smallint(5) NOT NULL,
  `head_fk` int(10) NOT NULL,
  `deputy_head_fk` int(10) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`head_pk`),
  KEY `FK_head_department` (`department_fk`),
  KEY `FK_head_employee` (`head_fk`),
  KEY `FK_d_head_employee` (`deputy_head_fk`),
  CONSTRAINT `FK_d_head_employee` FOREIGN KEY (`deputy_head_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_head_department` FOREIGN KEY (`department_fk`) REFERENCES `department` (`dept_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_head_employee` FOREIGN KEY (`head_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='unique key: department';

--
-- Dumping data for table `head`
--

/*!40000 ALTER TABLE `head` DISABLE KEYS */;
/*!40000 ALTER TABLE `head` ENABLE KEYS */;


--
-- Definition of table `marks_type`
--

DROP TABLE IF EXISTS `marks_type`;
CREATE TABLE `marks_type` (
  `marks_type_pk` smallint(5) NOT NULL AUTO_INCREMENT,
  `marks_type_name` varchar(50) NOT NULL,
  `marks_type_detail` blob NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`marks_type_pk`),
  UNIQUE KEY `marks_type_name` (`marks_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='unique key: marks_type_name';

--
-- Dumping data for table `marks_type`
--

/*!40000 ALTER TABLE `marks_type` DISABLE KEYS */;
INSERT INTO `marks_type` (`marks_type_pk`,`marks_type_name`,`marks_type_detail`,`state`) VALUES 
 (1,'m1',0x4E554C4C,'finalize'),
 (2,'m2',0x4E554C4C,'finalize'),
 (3,'m3',0x4E554C4C,'finalize'),
 (4,'m4',0x4E554C4C,'finalize'),
 (5,'m5',0x4E554C4C,'finalize'),
 (6,'m6',0x646E,'finalize'),
 (7,'m8',0x646E,'finalize');
/*!40000 ALTER TABLE `marks_type` ENABLE KEYS */;


--
-- Definition of table `medication_inst_detail`
--

DROP TABLE IF EXISTS `medication_inst_detail`;
CREATE TABLE `medication_inst_detail` (
  `medication_inst_pk` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `medication_inst_text` varchar(100) NOT NULL,
  PRIMARY KEY (`medication_inst_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medication_inst_detail`
--

/*!40000 ALTER TABLE `medication_inst_detail` DISABLE KEYS */;
INSERT INTO `medication_inst_detail` (`medication_inst_pk`,`medication_inst_text`) VALUES 
 (0,'N/A'),
 (1,'Pleaze take the medicine before eat'),
 (2,'Pleaze take the medicine after eat'),
 (3,'Pleaze take the medicine with hot water');
/*!40000 ALTER TABLE `medication_inst_detail` ENABLE KEYS */;


--
-- Definition of table `medicine_com_info`
--

DROP TABLE IF EXISTS `medicine_com_info`;
CREATE TABLE `medicine_com_info` (
  `med_com_name_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `med_gen_name_fk` mediumint(8) unsigned NOT NULL,
  `med_com_name` varchar(45) NOT NULL,
  `med_weight` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`med_com_name_pk`),
  KEY `FK_medicine_com_info_gen_info` (`med_gen_name_fk`),
  CONSTRAINT `FK_medicine_com_info_gen_info` FOREIGN KEY (`med_gen_name_fk`) REFERENCES `medicine_gen_info` (`med_gen_name_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine_com_info`
--

/*!40000 ALTER TABLE `medicine_com_info` DISABLE KEYS */;
INSERT INTO `medicine_com_info` (`med_com_name_pk`,`med_gen_name_fk`,`med_com_name`,`med_weight`) VALUES 
 (1,1,'Napa','500'),
 (2,1,'Fast','500'),
 (3,3,'Amoxi-1','1000'),
 (4,3,'Amoxi-2','1000'),
 (5,3,'Amoxi-3','500'),
 (6,5,'Tetanol-1','1500'),
 (7,5,'Tetanol-2','2500'),
 (8,5,'Tetanol-3','5000'),
 (9,1,'Napa','1000'),
 (10,1,'Fast','1000'),
 (11,1,'Fast','250'),
 (12,1,'Napa','250'),
 (13,1,'Fap Plus','1000'),
 (14,14,'injcom','1000'),
 (15,15,'testc','1000'),
 (16,16,'Gauge','500');
/*!40000 ALTER TABLE `medicine_com_info` ENABLE KEYS */;


--
-- Definition of table `medicine_gen_info`
--

DROP TABLE IF EXISTS `medicine_gen_info`;
CREATE TABLE `medicine_gen_info` (
  `med_gen_name_pk` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `med_gen_name` varchar(30) NOT NULL,
  `med_type` enum('Tablet','Capsul','Shyrup','Injection','Cream','Drop','Powder','Miscelaneous') NOT NULL,
  PRIMARY KEY (`med_gen_name_pk`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `medicine_gen_info`
--

/*!40000 ALTER TABLE `medicine_gen_info` DISABLE KEYS */;
INSERT INTO `medicine_gen_info` (`med_gen_name_pk`,`med_gen_name`,`med_type`) VALUES 
 (1,'Paracetamol','Tablet'),
 (2,'Doxycyckine','Tablet'),
 (3,'Amoxicyline','Capsul'),
 (4,'Ampicilline','Capsul'),
 (5,'Tetanol','Injection'),
 (6,'Decason','Injection'),
 (7,'Gauze','Miscelaneous'),
 (8,'Bandaze','Miscelaneous'),
 (9,'Par','Tablet'),
 (11,'Paracitamol','Tablet'),
 (14,'testinj','Injection'),
 (15,'test','Tablet'),
 (16,'Gauge','Miscelaneous');
/*!40000 ALTER TABLE `medicine_gen_info` ENABLE KEYS */;


--
-- Definition of table `medicine_store_info`
--

DROP TABLE IF EXISTS `medicine_store_info`;
CREATE TABLE `medicine_store_info` (
  `medicine_store_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_ledger_med_fk` int(10) unsigned NOT NULL,
  `medicine_id_fk` int(10) unsigned NOT NULL,
  `store_type` enum('centralstock','substock') NOT NULL,
  `med_qty` int(10) unsigned NOT NULL,
  `med_loc_id` int(10) unsigned DEFAULT NULL,
  `status` enum('valid','expired') NOT NULL,
  PRIMARY KEY (`medicine_store_pk`),
  KEY `FK_medicine_store_info_stock_ledger_med` (`stock_ledger_med_fk`),
  KEY `FK_medicine_store_info_med_id` (`medicine_id_fk`),
  CONSTRAINT `FK_medicine_store_info_med_id` FOREIGN KEY (`medicine_id_fk`) REFERENCES `medicine_com_info` (`med_com_name_pk`),
  CONSTRAINT `FK_medicine_store_info_stock_ledger_med` FOREIGN KEY (`stock_ledger_med_fk`) REFERENCES `stock_ledger_med` (`stock_ledger_med_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine_store_info`
--

/*!40000 ALTER TABLE `medicine_store_info` DISABLE KEYS */;
INSERT INTO `medicine_store_info` (`medicine_store_pk`,`stock_ledger_med_fk`,`medicine_id_fk`,`store_type`,`med_qty`,`med_loc_id`,`status`) VALUES 
 (20,79,9,'substock',348,NULL,'valid'),
 (21,80,4,'substock',264,NULL,'valid'),
 (22,81,7,'centralstock',100,NULL,'valid'),
 (23,82,9,'centralstock',500,NULL,'valid'),
 (24,83,4,'centralstock',400,NULL,'valid'),
 (25,84,6,'centralstock',100,NULL,'valid'),
 (26,82,9,'substock',394,NULL,'valid'),
 (27,83,4,'substock',100,NULL,'valid'),
 (28,84,6,'substock',80,NULL,'valid');
/*!40000 ALTER TABLE `medicine_store_info` ENABLE KEYS */;


--
-- Definition of table `patient_med_info`
--

DROP TABLE IF EXISTS `patient_med_info`;
CREATE TABLE `patient_med_info` (
  `patient_med_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `med_com_name_fk` int(10) unsigned NOT NULL,
  `no_of_doses` varchar(15) NOT NULL,
  `medication_inst_fk` int(5) unsigned DEFAULT NULL,
  `day_duration` int(5) unsigned NOT NULL,
  `med_qty` int(5) unsigned NOT NULL,
  `std_prescription_fk` bigint(20) unsigned NOT NULL,
  `state` enum('undelivered','delivered','processed','notavailable','purchased') DEFAULT NULL,
  PRIMARY KEY (`patient_med_pk`),
  KEY `FK_patient_med_info_med_id` (`med_com_name_fk`),
  KEY `FK_patient_med_info_prescription` (`std_prescription_fk`),
  KEY `FK_patient_med_info_medication_inst` (`medication_inst_fk`),
  CONSTRAINT `FK_patient_med_info_med_id` FOREIGN KEY (`med_com_name_fk`) REFERENCES `medicine_com_info` (`med_com_name_pk`),
  CONSTRAINT `FK_patient_med_info_prescription` FOREIGN KEY (`std_prescription_fk`) REFERENCES `std_prescription_info` (`std_prescription_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_med_info`
--

/*!40000 ALTER TABLE `patient_med_info` DISABLE KEYS */;
INSERT INTO `patient_med_info` (`patient_med_pk`,`med_com_name_fk`,`no_of_doses`,`medication_inst_fk`,`day_duration`,`med_qty`,`std_prescription_fk`,`state`) VALUES 
 (4,3,'1+1+0',1,16,12,15,NULL),
 (5,1,'0+1+1',3,11,12,15,NULL),
 (6,3,'1+0+1',1,15,12,17,NULL),
 (8,6,'1+1+0',3,12,56,20,'undelivered'),
 (9,3,'0+1+1',2,5,12,23,NULL),
 (10,3,'0+1+1',2,4,12,24,NULL),
 (11,6,'0+0+1',0,7,12,30,'undelivered'),
 (12,6,'1+1+0',0,7,2,33,'undelivered'),
 (13,3,'0+0+1',0,5,12,34,NULL),
 (14,3,'0+1+0',0,5,12,35,NULL),
 (15,4,'0+0+1',2,4,12,36,'undelivered'),
 (16,6,'1+0+1',0,5,1,38,'undelivered'),
 (17,3,'1+1+0',2,5,1,39,NULL),
 (18,3,'1+1+0',1,6,1,42,NULL),
 (19,1,'1+1+0',3,7,3,43,NULL),
 (20,3,'1+1+0',NULL,5,5,50,NULL),
 (21,6,'3+3+3',3,10,10,50,'undelivered'),
 (22,10,'1+1+1',3,15,15,50,NULL),
 (23,6,'1+1+1',1,5,1,51,'undelivered'),
 (24,3,'3+3+3',NULL,19,11,51,NULL),
 (25,5,'1+0+1',NULL,6,11,51,NULL),
 (26,6,'0+1+0',NULL,5,5,54,'undelivered'),
 (27,10,'0+2+0',2,10,10,54,'delivered'),
 (28,3,'1+1+0',2,15,12,55,NULL),
 (29,1,'0+1+1',NULL,5,12,56,'undelivered'),
 (30,6,'1+1+0',2,5,12,57,'undelivered'),
 (31,6,'0+1+1',NULL,6,2,58,'undelivered'),
 (32,1,'0+0+1',NULL,5,2,59,'notavailable'),
 (33,6,'0+1+1',NULL,5,21,59,'undelivered'),
 (35,9,'1+0+1',0,10,12,60,'undelivered'),
 (36,8,'0+1+0',2,10,12,60,'undelivered'),
 (37,1,'1+1+0',0,10,12,61,'notavailable'),
 (38,6,'1+1+0',3,10,12,61,'undelivered'),
 (39,5,'0+0+1',0,12,12,62,NULL),
 (40,1,'0+0+1',0,12,12,62,NULL),
 (41,9,'1+1+1',0,10,20,63,'undelivered'),
 (42,11,'1+1+1',1,10,20,63,'notavailable'),
 (43,4,'1+1+1',1,10,20,63,'undelivered'),
 (44,6,'1+1+1',1,1,20,63,'undelivered'),
 (45,6,'0+0+1',0,14,20,64,'undelivered'),
 (46,1,'1+1+0',0,13,12,65,'notavailable'),
 (50,1,'1+1+0',NULL,13,12,73,'notavailable'),
 (51,9,'1+1+1',NULL,10,30,74,'undelivered'),
 (52,3,'0+1+0',2,10,10,74,'notavailable'),
 (53,9,'0+1+1',NULL,7,12,75,'undelivered'),
 (54,4,'0+1+1',NULL,7,12,75,'delivered'),
 (55,9,'1+1+1',NULL,5,20,76,'delivered'),
 (56,6,'1+1+1',NULL,5,20,76,'delivered');
/*!40000 ALTER TABLE `patient_med_info` ENABLE KEYS */;


--
-- Definition of table `prerequisite`
--

DROP TABLE IF EXISTS `prerequisite`;
CREATE TABLE `prerequisite` (
  `prerequisite_pk` int(10) NOT NULL AUTO_INCREMENT,
  `course_fk` int(10) NOT NULL,
  `prerequisite_fk` int(10) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`prerequisite_pk`) USING BTREE,
  UNIQUE KEY `course_code` (`course_fk`,`prerequisite_fk`),
  KEY `FK_prequisite_syllabus` (`course_fk`),
  KEY `FK_prequisite_course_syllabus` (`prerequisite_fk`),
  CONSTRAINT `FK_prequisite_course_syllabus` FOREIGN KEY (`prerequisite_fk`) REFERENCES `syllabus` (`syllabus_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prequisite_syllabus` FOREIGN KEY (`course_fk`) REFERENCES `syllabus` (`syllabus_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='unique key: course_code, prerequisite';

--
-- Dumping data for table `prerequisite`
--

/*!40000 ALTER TABLE `prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `prerequisite` ENABLE KEYS */;


--
-- Definition of table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `registration_pk` int(15) NOT NULL AUTO_INCREMENT,
  `exam_committee_fk` int(10) NOT NULL,
  `student_fk` int(10) NOT NULL,
  `course_fk` int(10) NOT NULL,
  `is_approved` enum('student_submit','asst_cancel_course','asst_approve_course','temp_level1','temp_level2','temp_level3','temp_level4','temp_level5','head_approve') NOT NULL,
  `is_locked` enum('nolock','intermidiate_lock','temp_level1','temp_level2','temp_level3','temp_level4','temp_level5','final_lock') NOT NULL,
  `marks` blob NOT NULL,
  `gpa` float NOT NULL,
  `grade_letter` varchar(3) NOT NULL,
  PRIMARY KEY (`registration_pk`),
  UNIQUE KEY `exam_committee` (`exam_committee_fk`,`student_fk`,`course_fk`),
  KEY `FK_reg_student` (`student_fk`),
  KEY `FK_reg_syllabus` (`course_fk`),
  CONSTRAINT `FK_reg_exam_committee` FOREIGN KEY (`exam_committee_fk`) REFERENCES `exam_committee` (`exam_committee_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reg_student` FOREIGN KEY (`student_fk`) REFERENCES `student` (`student_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reg_syllabus` FOREIGN KEY (`course_fk`) REFERENCES `syllabus` (`syllabus_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registration`
--

/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`registration_pk`,`exam_committee_fk`,`student_fk`,`course_fk`,`is_approved`,`is_locked`,`marks`,`gpa`,`grade_letter`) VALUES 
 (1,1,2,46,'asst_approve_course','nolock',0x6E756C6C,0,'F'),
 (2,1,2,33,'asst_approve_course','nolock',0x6E756C6C,0,'F'),
 (3,1,2,35,'asst_approve_course','nolock',0x6E756C6C,3,'B'),
 (4,2,3,31,'asst_approve_course','intermidiate_lock',0x7B22436C61737354657374223A223435222C22417474656E64656E6365223A223135222C22412070617274223A223332227D,340,'A'),
 (5,1,3,33,'head_approve','nolock',0x6E756C6C,4,'A+'),
 (6,2,2,38,'asst_approve_course','nolock',0x6E756C6C,3.75,'A'),
 (7,2,2,31,'asst_approve_course','nolock',0x646E,0,'F'),
 (8,2,2,33,'asst_approve_course','nolock',0x646E,3.25,'B+'),
 (9,2,2,35,'asst_approve_course','nolock',0x646E,0,'F'),
 (10,1,2,44,'asst_approve_course','nolock',0x646E,4,'A+'),
 (11,1,2,45,'asst_approve_course','nolock',0x646E,0,'F'),
 (12,2,3,55,'asst_approve_course','nolock',0x646E,0,'F'),
 (13,39,3,35,'asst_approve_course','nolock',0x646E,0,'F'),
 (14,39,3,52,'asst_approve_course','nolock',0x646E,2,'F'),
 (15,39,8,53,'asst_approve_course','nolock',0x646E,2,'F'),
 (16,2,6,54,'asst_approve_course','nolock',0x646E,2,'F'),
 (17,2,6,39,'asst_approve_course','nolock',0x646E,4,'F'),
 (18,39,24,52,'asst_approve_course','nolock',0x646E,3,'B'),
 (19,39,6,53,'asst_approve_course','nolock',0x646E,2,'F'),
 (20,40,5,51,'asst_approve_course','nolock',0x646E,0,'F'),
 (21,2,5,55,'asst_approve_course','nolock',0x646E,2,'F'),
 (22,39,5,52,'asst_approve_course','nolock',0x646E,3,'F'),
 (23,40,6,51,'asst_approve_course','nolock',0x646E,2,'F'),
 (24,2,6,55,'asst_approve_course','nolock',0x646E,3,'F'),
 (25,39,6,35,'asst_approve_course','nolock',0x646E,3,'F'),
 (26,2,24,31,'asst_approve_course','nolock',0x646E,4,'A+'),
 (27,2,24,33,'asst_approve_course','nolock',0x646E,3.75,'A'),
 (28,2,24,35,'asst_approve_course','nolock',0x646E,3.5,'A-'),
 (29,1,24,44,'asst_approve_course','nolock',0x646E,3.5,'A-'),
 (30,1,24,45,'asst_approve_course','nolock',0x646E,3.25,'B+'),
 (31,2,9,31,'asst_approve_course','nolock',0x646E,0,'F'),
 (32,2,9,33,'asst_approve_course','nolock',0x646E,0,'F'),
 (33,2,9,35,'asst_approve_course','nolock',0x646E,0,'F'),
 (34,1,9,44,'asst_approve_course','nolock',0x646E,0,'F'),
 (35,1,9,45,'asst_approve_course','nolock',0x646E,0,'F'),
 (36,2,10,31,'asst_approve_course','nolock',0x646E,0,'F'),
 (37,2,10,33,'asst_approve_course','nolock',0x646E,0,'F'),
 (38,2,10,35,'asst_approve_course','nolock',0x646E,0,'F'),
 (39,1,10,44,'asst_approve_course','nolock',0x646E,0,'F'),
 (40,1,10,45,'asst_approve_course','nolock',0x646E,0,'F'),
 (41,2,23,31,'asst_approve_course','nolock',0x646E,0,'F'),
 (42,2,23,33,'asst_approve_course','nolock',0x646E,0,'F'),
 (43,2,23,35,'asst_approve_course','nolock',0x646E,0,'F'),
 (44,1,23,44,'asst_approve_course','nolock',0x646E,0,'F'),
 (45,1,23,45,'asst_approve_course','nolock',0x646E,3.75,'A'),
 (46,2,8,31,'asst_approve_course','nolock',0x646E,0,'F'),
 (47,2,8,33,'asst_approve_course','nolock',0x646E,0,'F'),
 (48,2,8,35,'asst_approve_course','nolock',0x646E,0,'F'),
 (49,1,8,44,'asst_approve_course','nolock',0x646E,0,'F'),
 (50,1,8,45,'asst_approve_course','nolock',0x646E,0,'F'),
 (51,2,8,51,'asst_approve_course','nolock',0x646E,0,'F'),
 (52,2,10,51,'asst_approve_course','nolock',0x646E,0,'F'),
 (53,40,10,31,'asst_approve_course','nolock',0x646E,3.75,'F'),
 (54,40,10,33,'asst_approve_course','nolock',0x646E,0,'F'),
 (55,40,10,51,'asst_approve_course','nolock',0x646E,2.5,'F'),
 (56,1,10,47,'asst_approve_course','nolock',0x646E,0,'F'),
 (57,1,2,38,'asst_approve_course','nolock',0x646E,0,'F');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;


--
-- Definition of table `registration_table_log_employee`
--

DROP TABLE IF EXISTS `registration_table_log_employee`;
CREATE TABLE `registration_table_log_employee` (
  `registration_log_employee_pk` int(18) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(50) NOT NULL,
  `date_time` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `exam_committee_id` int(10) NOT NULL,
  `reg_no` int(15) NOT NULL,
  `course_id` int(10) NOT NULL,
  `marks` blob NOT NULL,
  `approve_status` enum('student_submit','asst_cancel_course','asst_approve_course','head_approve','temp_level1','temp_level2','temp_level3','temp_level4','temp_level5') NOT NULL,
  `lock_status` enum('nolock','intermidiate_lock','final_lock','temp_level1','temp_level2','temp_level3','temp_level4','temp_level5') NOT NULL,
  `employee_id` int(10) NOT NULL,
  PRIMARY KEY (`registration_log_employee_pk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log for any changes in registration table ';

--
-- Dumping data for table `registration_table_log_employee`
--

/*!40000 ALTER TABLE `registration_table_log_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_table_log_employee` ENABLE KEYS */;


--
-- Definition of table `registration_table_log_student`
--

DROP TABLE IF EXISTS `registration_table_log_student`;
CREATE TABLE `registration_table_log_student` (
  `registration_log_student_pk` int(18) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `reg_no` int(15) NOT NULL,
  `date_time` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  `exam_committee_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `marks` blob NOT NULL,
  `approve_status` enum('student_submit','asst_cancel_course','asst_approve_course','head_approve','temp_level1','temp_level2','temp_level3','temp_level4','temp_level5') NOT NULL,
  `lock_status` enum('nolock','intermidiate_lock','final_lock','temp_level1','temp_level2','temp_level3','temp_level4','temp_level5') NOT NULL,
  PRIMARY KEY (`registration_log_student_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registration_table_log_student`
--

/*!40000 ALTER TABLE `registration_table_log_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_table_log_student` ENABLE KEYS */;


--
-- Definition of table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `school_pk` smallint(5) NOT NULL AUTO_INCREMENT,
  `school_id` smallint(5) NOT NULL,
  `school_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`school_pk`),
  UNIQUE KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='unique key: school_id';

--
-- Dumping data for table `school`
--

/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`school_pk`,`school_id`,`school_name`,`state`) VALUES 
 (1,3,'Applied science N Eng.','finalize'),
 (2,2,'Pure Science','finalize'),
 (3,4,'Life Scinece','finalize'),
 (4,1,'Science','finalize'),
 (5,6,'Science','finalize');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;


--
-- Definition of table `semester_result`
--

DROP TABLE IF EXISTS `semester_result`;
CREATE TABLE `semester_result` (
  `semester_result_pk` int(10) NOT NULL AUTO_INCREMENT,
  `exam_committee_fk` int(10) NOT NULL,
  `student_fk` int(10) NOT NULL,
  `total_credit` float NOT NULL,
  `total_gpa` float NOT NULL,
  `honours_status` varchar(20) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`semester_result_pk`),
  KEY `FK_semester_result_exam_committee` (`exam_committee_fk`),
  KEY `FK_semester_result_student` (`student_fk`),
  CONSTRAINT `FK_semester_result_exam_committee` FOREIGN KEY (`exam_committee_fk`) REFERENCES `exam_committee` (`exam_committee_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_semester_result_student` FOREIGN KEY (`student_fk`) REFERENCES `student` (`student_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `semester_result`
--

/*!40000 ALTER TABLE `semester_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester_result` ENABLE KEYS */;


--
-- Definition of table `std_prescription_info`
--

DROP TABLE IF EXISTS `std_prescription_info`;
CREATE TABLE `std_prescription_info` (
  `std_prescription_pk` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_pk_fk` int(10) unsigned NOT NULL,
  `emplaoyee_pk_fk` int(10) unsigned DEFAULT NULL,
  `prescription_dt` date NOT NULL,
  `diagnosis_detail` text NOT NULL,
  `reconsult_dt` varchar(15) DEFAULT NULL,
  `general_advice` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`std_prescription_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_prescription_info`
--

/*!40000 ALTER TABLE `std_prescription_info` DISABLE KEYS */;
INSERT INTO `std_prescription_info` (`std_prescription_pk`,`student_pk_fk`,`emplaoyee_pk_fk`,`prescription_dt`,`diagnosis_detail`,`reconsult_dt`,`general_advice`) VALUES 
 (1,2007331039,NULL,'2011-03-07','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','5/4/2011',NULL),
 (2,2007331039,NULL,'2011-03-07','{\"chief_complaints\":{\"Caugh\":\"4Days\",\"Back Pain\":\"6Days\"},\"on_examination\":{\"Blood Pressure\":\"130/70\",\"Temperature\":\"103\"},\"investigation\":[\"CBE\",\"Lipidprofile\"]}','5/4/2011',NULL),
 (3,2007331039,NULL,'2011-03-08','{\"chief_complaints\":{\"Throught Pain\":\"16Days\"},\"on_examination\":{\"Blood Pressure\":\"110/80\"},\"investigation\":[\"CBE\",\"Urine RIE\"]}','6/4/2011',NULL),
 (15,2007331039,NULL,'2011-03-08','{\"chief_complaints\":{\"Fever\":\"17Days\"},\"on_examination\":{\"Temperature\":\"90\"},\"investigation\":[\"Urine RIE\"]}','6/4/2011',NULL),
 (17,2007331039,NULL,'2011-03-08','{\"chief_complaints\":{\"Back Pain\":\"14Days\"},\"on_examination\":{\"Temperature\":\"90\"},\"investigation\":[\"CBE\"]}','6/4/2011',NULL),
 (20,2007331039,NULL,'2011-03-08','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','6/4/2011',NULL),
 (23,2007331039,NULL,'2011-03-09','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','7/4/2011',NULL),
 (24,2007331039,NULL,'2011-03-09','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','7/4/2011',NULL),
 (30,2007331039,NULL,'2011-03-09','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','7/4/2011',NULL),
 (33,2007331039,NULL,'2011-03-12','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','10/4/2011',NULL),
 (34,2007331039,NULL,'2011-03-12','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','10/4/2011',NULL),
 (35,2007331039,NULL,'2011-03-12','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','10/4/2011',NULL),
 (36,2007331039,NULL,'2011-03-12','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','10/4/2011',NULL),
 (38,2007331039,NULL,'2011-03-12','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','10/4/2011',NULL),
 (39,2007331039,NULL,'2011-03-12','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','10/4/2011',NULL),
 (42,2007331039,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (43,2007331039,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (50,2007331039,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (51,2007331059,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (52,2007331039,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (53,25,26,'2011-02-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (54,2007331059,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (55,23,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (56,23,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011',NULL),
 (57,25,29,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011','[\"1\",\"2\"]'),
 (58,2007331039,NULL,'2011-03-14','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','12/4/2011','[]'),
 (59,2007331039,NULL,'2011-03-18','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','16/4/2011','[]'),
 (60,25,29,'2011-04-18','{\"chief_complaints\":{\"Fever\":\"4Days\",\"Caugh\":\"7Days\"},\"on_examination\":{\"Blood Pressure\":\"120/80\",\"Temperature\":\"101\"},\"investigation\":[\"Urine RIE\",\"Lipidprofile\"]}','28/4/2011','[\"2\",\"3\",\"1\"]'),
 (61,2008331093,NULL,'2011-04-18','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','16/5/2011','[\"2\"]'),
 (62,2008331095,NULL,'2011-04-18','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','16/5/2011','[]'),
 (63,2007331039,NULL,'2011-04-22','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','20/5/2011','[]'),
 (64,25,26,'2011-04-22','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','20/5/2011','[]'),
 (65,23,29,'2011-04-22','{\"chief_complaints\":{\"Fever\":\"6Days\",\"Caugh\":\"11Days\"},\"on_examination\":{\"Blood Pressure\":\"120/80\",\"Temperature\":\"101\"},\"investigation\":[\"ECG\",\"Lipidprofile\"]}','20/5/2011','[]'),
 (73,25,26,'2011-04-23','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','21/5/2011','[]'),
 (74,26,26,'2011-04-23','{\"chief_complaints\":{\"Fever\":\"9Days\",\"Caugh\":\"7Days\"},\"on_examination\":{\"Temperature\":\"101\",\"Abdonem\":\"Soft + \"},\"investigation\":[\"ECG\"]}','21/5/2011','[]'),
 (75,25,26,'2011-04-23','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','21/5/2011','[]'),
 (76,25,26,'2011-04-23','{\"chief_complaints\":{},\"on_examination\":{},\"investigation\":[]}','21/5/2011','[]');
/*!40000 ALTER TABLE `std_prescription_info` ENABLE KEYS */;


--
-- Definition of table `stock_ledger_comp`
--

DROP TABLE IF EXISTS `stock_ledger_comp`;
CREATE TABLE `stock_ledger_comp` (
  `sl_no_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comp_id_fk` smallint(5) unsigned NOT NULL,
  `employee_pk_fk` int(10) unsigned DEFAULT NULL,
  `purchase_dt` date NOT NULL,
  `commission` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`sl_no_pk`),
  KEY `FK_stock_ledger_compinfo` (`comp_id_fk`),
  CONSTRAINT `FK_stock_ledger_compinfo` FOREIGN KEY (`comp_id_fk`) REFERENCES `company_info` (`company_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_ledger_comp`
--

/*!40000 ALTER TABLE `stock_ledger_comp` DISABLE KEYS */;
INSERT INTO `stock_ledger_comp` (`sl_no_pk`,`comp_id_fk`,`employee_pk_fk`,`purchase_dt`,`commission`) VALUES 
 (1,5552,NULL,'2011-01-24',3),
 (11,5552,NULL,'2011-01-24',3),
 (12,5553,NULL,'2011-01-24',5),
 (13,5551,NULL,'2011-01-24',25),
 (111,5552,NULL,'2011-01-24',3),
 (112,5552,NULL,'2011-01-26',2),
 (113,5550,NULL,'2011-01-10',1),
 (114,5555,NULL,'2011-01-02',10),
 (115,5555,NULL,'2011-01-02',10),
 (116,5552,NULL,'2011-01-03',3),
 (117,5555,NULL,'2011-01-31',2),
 (118,5555,NULL,'2011-01-31',2),
 (119,5552,NULL,'2011-01-02',21),
 (120,5552,NULL,'2011-01-02',21),
 (123,5552,NULL,'2011-01-02',21),
 (124,5552,NULL,'2011-01-02',21),
 (125,5551,NULL,'2011-01-30',5),
 (126,5551,NULL,'2011-01-03',1),
 (136,5552,NULL,'2011-01-29',5),
 (137,5552,NULL,'2011-01-29',5),
 (138,5552,NULL,'2011-01-29',5),
 (141,5551,NULL,'2011-01-03',1),
 (144,5551,NULL,'2011-01-03',1),
 (148,5554,NULL,'2011-03-08',2),
 (149,5554,NULL,'2011-03-01',2),
 (150,5553,NULL,'2011-03-07',3),
 (151,5550,NULL,'2011-03-02',3),
 (152,5554,NULL,'2011-03-02',2),
 (155,5553,NULL,'2011-03-08',2),
 (156,5551,NULL,'2011-03-20',4),
 (157,5555,NULL,'2011-03-07',2),
 (158,5555,NULL,'2011-03-07',2),
 (159,5553,NULL,'2011-04-16',3),
 (160,5554,NULL,'2011-04-20',3),
 (161,5553,27,'2011-04-20',6),
 (162,5551,27,'2011-04-21',7),
 (163,5553,27,'2011-04-01',3),
 (164,5550,27,'2011-04-10',2);
/*!40000 ALTER TABLE `stock_ledger_comp` ENABLE KEYS */;


--
-- Definition of table `stock_ledger_med`
--

DROP TABLE IF EXISTS `stock_ledger_med`;
CREATE TABLE `stock_ledger_med` (
  `stock_ledger_med_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sl_no_fk` int(10) unsigned NOT NULL,
  `med_com_name_fk` int(10) unsigned NOT NULL,
  `medicine_qty` int(10) unsigned NOT NULL,
  `pp_price` double(10,2) NOT NULL,
  `manufacturing_dt` date DEFAULT NULL,
  `expiring_dt` date DEFAULT NULL,
  PRIMARY KEY (`stock_ledger_med_pk`),
  KEY `FK_stock_ledger_med_comp` (`sl_no_fk`),
  KEY `FK_stock_ledger_med_name` (`med_com_name_fk`),
  CONSTRAINT `FK_stock_ledger_med_comp` FOREIGN KEY (`sl_no_fk`) REFERENCES `stock_ledger_comp` (`sl_no_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_stock_ledger_med_name` FOREIGN KEY (`med_com_name_fk`) REFERENCES `medicine_com_info` (`med_com_name_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_ledger_med`
--

/*!40000 ALTER TABLE `stock_ledger_med` DISABLE KEYS */;
INSERT INTO `stock_ledger_med` (`stock_ledger_med_pk`,`sl_no_fk`,`med_com_name_fk`,`medicine_qty`,`pp_price`,`manufacturing_dt`,`expiring_dt`) VALUES 
 (1,112,5,500,5.00,'0000-00-00','0000-00-00'),
 (4,111,3,1000,3.00,'0000-00-00','0000-00-00'),
 (25,113,5,20,2.00,'0000-00-00','0000-00-00'),
 (26,113,2,100,8.00,'0000-00-00','0000-00-00'),
 (27,113,6,500,3.00,'0000-00-00','0000-00-00'),
 (28,116,4,20,2.00,'0000-00-00','0000-00-00'),
 (29,116,3,502,4.00,'0000-00-00','0000-00-00'),
 (30,116,6,445,38.00,'0000-00-00','0000-00-00'),
 (31,118,4,445,5.00,NULL,NULL),
 (32,118,3,45,45.00,NULL,NULL),
 (33,118,6,54,5.00,NULL,NULL),
 (34,123,2,3,4.00,NULL,NULL),
 (35,123,5,23,34.00,NULL,NULL),
 (36,123,3,445,4.00,NULL,NULL),
 (37,124,2,3,4.00,NULL,NULL),
 (38,124,5,23,34.00,NULL,NULL),
 (39,124,3,445,4.00,NULL,NULL),
 (40,125,4,23,56.00,NULL,NULL),
 (41,125,5,5,56.00,NULL,NULL),
 (42,125,4,56,56.00,NULL,NULL),
 (43,125,4,6,56.00,NULL,NULL),
 (44,125,4,6,6.00,NULL,NULL),
 (45,126,4,45,45.00,NULL,NULL),
 (46,136,2,1,1.00,NULL,NULL),
 (47,136,4,4,7.00,NULL,NULL),
 (48,136,5,4,4.00,NULL,NULL),
 (49,137,2,1,1.00,NULL,NULL),
 (50,137,4,4,7.00,NULL,NULL),
 (51,138,2,1,1.00,NULL,NULL),
 (52,138,4,4,7.00,NULL,NULL),
 (53,141,3,100,1.00,NULL,NULL),
 (54,144,3,100,1.00,NULL,NULL),
 (55,144,5,100,7.00,NULL,NULL),
 (56,144,2,50,5.00,NULL,NULL),
 (57,148,3,12,1.00,'1998-01-17','1998-01-17'),
 (58,149,6,200,5.00,'2012-04-09','2014-05-16'),
 (59,150,3,200,1.00,'0006-09-01','0006-09-01'),
 (60,151,3,1000,20.00,'2012-03-09','2015-12-19'),
 (61,151,6,1000,7.00,'2010-01-01','2012-10-10'),
 (62,152,3,200,5.00,'2012-04-10','2014-04-13'),
 (63,155,3,12,6.00,'2012-02-12','2014-03-12'),
 (64,156,3,300,5.00,'2010-02-02','2012-02-02'),
 (65,156,8,450,6.00,'2010-04-04','2012-04-04'),
 (66,157,3,200,3.75,'2014-03-16','2013-04-12'),
 (67,158,3,200,3.75,'2014-03-16','2013-04-12'),
 (68,158,6,100,5.00,'2014-03-15','2013-04-11'),
 (69,158,2,50,3.00,'2014-03-15','2014-03-15'),
 (70,158,6,55,2.50,'2014-03-15','2014-03-15'),
 (71,159,3,100,5.00,'2014-04-09','2016-05-11'),
 (72,159,6,300,2.50,'2014-04-09','2016-05-11'),
 (73,160,1,100,2.75,'2013-03-11','2016-05-17'),
 (74,160,4,100,3.50,'2013-03-11','2016-05-17'),
 (75,161,6,10,2.34,'2014-04-14','2015-07-15'),
 (76,161,4,100,8.95,'2014-04-14','2015-07-15'),
 (77,162,9,600,3.50,'2014-04-10','2014-08-15'),
 (78,162,4,300,15.00,'2011-05-05','2015-05-05'),
 (79,163,9,500,2.50,'2011-01-01','2012-01-01'),
 (80,163,4,300,25.00,'2011-01-01','2012-01-01'),
 (81,163,7,100,200.00,'2011-01-01','2012-01-01'),
 (82,164,9,1000,3.50,'2010-10-10','2011-10-10'),
 (83,164,4,500,30.00,'2010-10-10','2011-10-10'),
 (84,164,6,200,120.00,'2010-10-10','2011-10-10');
/*!40000 ALTER TABLE `stock_ledger_med` ENABLE KEYS */;


--
-- Definition of trigger `bef_insert_slm`
--

DROP TRIGGER /*!50030 IF EXISTS */ `bef_insert_slm`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `bef_insert_slm` AFTER INSERT ON `stock_ledger_med` FOR EACH ROW begin
insert into medicine_store_info(stock_ledger_med_fk,medicine_id_fk,store_type,med_qty, status)
values(NEW.stock_ledger_med_pk,NEW.med_com_name_fk,'centralstock',NEW.medicine_qty,'valid');
end $$

DELIMITER ;

--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_pk` int(10) NOT NULL AUTO_INCREMENT,
  `registration_no` int(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `student_batch_fk` int(10) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`student_pk`),
  UNIQUE KEY `registration_no` (`registration_no`),
  KEY `FK_student_student_batch` (`student_batch_fk`),
  CONSTRAINT `FK_student_student_batch` FOREIGN KEY (`student_batch_fk`) REFERENCES `student_batch` (`student_batch_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='unique key: registration_no';

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_pk`,`registration_no`,`password`,`student_batch_fk`,`state`) VALUES 
 (2,2006331062,'p',1,'finalize'),
 (3,2006331063,'p',1,'finalize'),
 (4,2006331067,'p',1,'finalize'),
 (5,2007331064,'p',2,'finalize'),
 (6,2007331065,'p',2,'finalize'),
 (7,2007331066,'p',2,'finalize'),
 (8,2008331068,'p',3,'finalize'),
 (9,2008331069,'p',3,'finalize'),
 (10,2008331019,'p',3,'finalize'),
 (11,2007331020,'p',2,'finalize'),
 (12,2008331021,'p',3,'finalize'),
 (23,2008331093,'hasib',3,'finalize'),
 (24,2006331026,'p',1,'finalize'),
 (25,2007331039,'mokarrom',2,'finalize'),
 (26,2006331059,'p',2,'initial');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


--
-- Definition of table `student_batch`
--

DROP TABLE IF EXISTS `student_batch`;
CREATE TABLE `student_batch` (
  `student_batch_pk` int(10) NOT NULL AUTO_INCREMENT,
  `dept_degree_fk` int(10) NOT NULL,
  `session` smallint(5) NOT NULL,
  `starting_university_semester_fk` smallint(5) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`student_batch_pk`),
  UNIQUE KEY `dept_degree` (`dept_degree_fk`,`session`),
  KEY `FK_student_batch_degree_of_dept` (`dept_degree_fk`),
  KEY `FK_student_batch_university_semester` (`starting_university_semester_fk`),
  CONSTRAINT `FK_student_batch_degree_of_dept` FOREIGN KEY (`dept_degree_fk`) REFERENCES `degree_offered_by_dept` (`dept_degree_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_student_batch_university_semester` FOREIGN KEY (`starting_university_semester_fk`) REFERENCES `university_semester` (`university_semester_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='unique key: dept_degree, session';

--
-- Dumping data for table `student_batch`
--

/*!40000 ALTER TABLE `student_batch` DISABLE KEYS */;
INSERT INTO `student_batch` (`student_batch_pk`,`dept_degree_fk`,`session`,`starting_university_semester_fk`,`state`) VALUES 
 (1,14,2006,4,'finalize'),
 (2,14,2007,6,'finalize'),
 (3,14,2008,8,'finalize'),
 (4,14,2009,11,'finalize'),
 (5,14,2010,15,'finalize'),
 (6,15,2011,16,'finalize'),
 (7,10,2012,21,'finalize'),
 (8,14,2012,21,'finalize'),
 (9,15,2012,21,'finalize'),
 (10,10,2013,22,'finalize'),
 (11,14,2013,22,'finalize'),
 (12,15,2013,22,'finalize'),
 (13,10,2014,50,'finalize'),
 (14,14,2014,50,'finalize'),
 (15,15,2014,50,'finalize'),
 (16,10,2016,52,'finalize'),
 (17,14,2016,52,'finalize'),
 (18,15,2016,52,'finalize');
/*!40000 ALTER TABLE `student_batch` ENABLE KEYS */;


--
-- Definition of table `student_educational_info`
--

DROP TABLE IF EXISTS `student_educational_info`;
CREATE TABLE `student_educational_info` (
  `student_educational_pk_fk` int(10) NOT NULL,
  `ssc_roll` int(18) unsigned DEFAULT NULL,
  `ssc_institute` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ssc_exam_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ssc_board` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ssc_group` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ssc_pass_year` int(10) DEFAULT NULL,
  `ssc_result` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `ssc_type` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `hsc_roll` int(18) unsigned DEFAULT NULL,
  `hsc_institute` varchar(100) NOT NULL,
  `hsc_exam_name` varchar(100) NOT NULL,
  `hsc_board` varchar(100) NOT NULL,
  `hsc_group` varchar(100) NOT NULL,
  `hsc_pass_year` int(10) NOT NULL,
  `hsc_result` varchar(10) NOT NULL,
  `hsc_grade` varchar(100) NOT NULL,
  `hsc_type` varchar(50) NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`student_educational_pk_fk`) USING BTREE,
  CONSTRAINT `FK_student_edu_info_student` FOREIGN KEY (`student_educational_pk_fk`) REFERENCES `student` (`student_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_educational_info`
--

/*!40000 ALTER TABLE `student_educational_info` DISABLE KEYS */;
INSERT INTO `student_educational_info` (`student_educational_pk_fk`,`ssc_roll`,`ssc_institute`,`ssc_exam_name`,`ssc_board`,`ssc_group`,`ssc_pass_year`,`ssc_result`,`ssc_type`,`hsc_roll`,`hsc_institute`,`hsc_exam_name`,`hsc_board`,`hsc_group`,`hsc_pass_year`,`hsc_result`,`hsc_grade`,`hsc_type`,`state`) VALUES 
 (23,112233,'','SSC','Dhaka','Science',2004,'','Unknown',112233,'','HSC','Dhaka','Science',2006,'','Select HSC Grade','Unknown','finalize');
/*!40000 ALTER TABLE `student_educational_info` ENABLE KEYS */;


--
-- Definition of table `student_personal_info`
--

DROP TABLE IF EXISTS `student_personal_info`;
CREATE TABLE `student_personal_info` (
  `student_personal_pk_fk` int(10) NOT NULL,
  `nick_name` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `full_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fathers_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `mothers_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `sex` enum('Male','Female') DEFAULT NULL,
  `religion` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `nationality` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `voter_id` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `passport_no` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `marital_status` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `blood_group` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `home_district` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `present_address` varchar(300) DEFAULT NULL,
  `permanent_address` varchar(300) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `web_address` varchar(100) DEFAULT NULL,
  `photo` blob,
  `guardians_name` varchar(100) DEFAULT NULL,
  `guardians_relation` varchar(100) DEFAULT NULL,
  `guardians_address` varchar(300) DEFAULT NULL,
  `guardians_contact` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_branch` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') DEFAULT NULL,
  PRIMARY KEY (`student_personal_pk_fk`) USING BTREE,
  CONSTRAINT `FK_student_personal_info_student` FOREIGN KEY (`student_personal_pk_fk`) REFERENCES `student` (`student_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_personal_info`
--

/*!40000 ALTER TABLE `student_personal_info` DISABLE KEYS */;
INSERT INTO `student_personal_info` (`student_personal_pk_fk`,`nick_name`,`full_name`,`fathers_name`,`mothers_name`,`sex`,`religion`,`nationality`,`voter_id`,`passport_no`,`date_of_birth`,`place_of_birth`,`marital_status`,`blood_group`,`home_district`,`present_address`,`permanent_address`,`contact_no`,`email_address`,`web_address`,`photo`,`guardians_name`,`guardians_relation`,`guardians_address`,`guardians_contact`,`bank_name`,`bank_branch`,`bank_account_no`,`state`) VALUES 
 (2,'Lira','Rosana Sultana','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','dsf','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (3,'bira','Abdulla al Hasib','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','dsf','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (4,'bira','Rosana Sultana','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','dsf','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (5,'bira','Rosana Sultana','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','dsf','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (6,'bira','Rosana Sultana','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','dsf','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (7,'bira','Rosana Sultana','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','dsf','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (8,'bira','Rosana Sultana','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','dsf','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (9,'bira','Rosana Sultana','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','dsf','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (10,'khairul','khairullah','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','married','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (11,'khairul','khairullah','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','married','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (12,'khairul','khairullah','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1989-11-23','Dhaka','married','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (23,'hasib','Abdullah al hasib','ashraf ali mia','nazma begum','Male','islam',0x62616E676C616465736869,'unknown','unknown','1988-10-03','Faridpur','Unmarried','AB+','Faridpur','unknown','unknown','01911936346','hasib_sust@yahoo.com','unknown',0xFFD8FFE000104A46494600010101012C012C0000FFDB004300100B0C0E0C0A100E0D0E1211101318281A181616183123251D283A333D3C3933383740485C4E404457453738506D51575F626768673E4D71797064785C656763FFDB0043011112121815182F1A1A2F634238426363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363FFC000110801B302A603012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00E728A28AC4419A3BD145002514514802929692A4028A28A0028C514B4804A314B49458029451450014A2814A29A40029C290528AA0014E148296A8070352A1C54229C0D302D23FBD5A8DFA55047A9D24C53034A3938AB09274E6B3124ED53A494C0D0590FAD4825CD51593DEA4592824B824CD383D5557CD3C3521160366941A83CCC52EFA4C5627DD4D2D50973EB4D2F522B1296F7A616A8CBE69A5B35016242F9A6934D2D485AA6E16149A334D2D4668B8EC3C52B10AA4FA0A6034CB97DB0B7B8AB8EF62A0AF2339D8B396F5348283D681D2BA7A1EB08DD6AC5AB7047AD57EB52467638352D686552378974734EC50B8C53BB560CF39E8C610334869E690D66C4371484714EC506A6C044D519152B0A6918ED556023DB484734F34A173408605A50B526DE28DB8A801A0714D239A908E29868403693B538D25500869A69F8A4345C64669A4735211C5348A570198E6908A71A314C06E39A695A931484530212B4D2B53114D2BC5501030A69152B2D348C1A2E0460734E5A5C52814301453852014E152C0053BB520A5A910D3D69450697153701C28A551C51408C8A28A4EF5D26A2D26683499A02C2D1499A33520068A28A4014514B4009452D262980B45146295C0294520A51D6988314A28A514D000A5145029A016973499A335431734A29B9A2981206C548AF500A50D8A605B57A9D24AA2AF52A3D080BCAE6A656E9CD51492A5121F4AA2941CB62FABE29DE6FA9C55012B7A6282E73D6958D238793DCBDE7AFAD29B8503D6B3F77BD213EFC516355855D59A06E969AD72BDAA816A0FAD162D61A05B3743D290DD66AA1F5A3BD2E45D8A54205E1720FB506E171C5530682697B344FD5E372E09D0F7229CAE0F20D67939A55765C60D2F64BA112C2AB68CD2071505D3E76A8FA9A48A7DE307AD4531DD29F614A09A919D1A4E33D56C44460D3940A66734F5EF5B9DC0A980683C53771048A8E462053DD0B72C8BA6518A5178C3AD679724D38126B3E4447B389A915C07E0F153563AB956EB57A0B9CE035673A7D8E6AB46DAA2D814A45354FA53FB5648E46AC46C298454A69869D84444734F031405EF8A7814983100E29314FC535B8A9B011B1E69BDA9E693B53B00C3498A71A4C54B01290D38D262900C34D34F34D345C069A4229F8A42298C6E2948E2948A31C55A0184714D3521A6914C0848A69152B2D318500478A514B8A5C714008294518A054B014528A414A2A18808E69C0520A72D480A07B514B453118A68341A435D06C0693341A4A005CD19A4A5A400294514A29584028A5A3140098A314B46295C04A5C50297140094A28A0502168A28AA1052D251548628A3348296A805CD19A4CD26698C5CD2839E94DCD5CB6846DCB724FAD35ABB1A53873BB220556F4352A239C706ACEDC74007E14A0F3C55F29D31C3AEE2226D009A903533345163A230515A0FE31486929775050039A3B5274FAD2F5A004FA528349ED48680B0E27B521EB41C6281C8E7AD0028348681D714D638A07614FA500F6A6839E68EE6985872B6D6E2A5072093D6A0EF4F56C647A8A2C2B07BD3D79A676A72F14098DCF27EB4C90714FEB4C7E94124740A0F0334ABF77DE86501A72B1C8A69A5069D896685B4D9014D5A073DEB2636DA41F4AD1864DEBCF515CF385B5386BD3B3BA2634C2334A79E281CD424728A052E314E55A5238A56111914C3CD48DD2998AAB0C69A4229E690D218C229314E34959B421A69A69E690D400C348453F19A42B4AE1723228C53F146DAA403314629FB693154806114D22A52B48064F4A77B01115A6B2D59D98ED51BA628BDC656239A08A7918A422A806E2929C2971520329475A711C50A39A862140E29C052629C2A4031453B1452B88C134869690D75D8D828A2814EC0140A5C50295800528A0528A56100A5140A5C521098A314B8A3150C04A2968A570128A28A630A5CD2519AA10B9A052668AB416173450294024531D843499A5348698ECC9EDA1F358FB55D1C631D0554B2DFBC803E5239AB847B5690DAE77518DA21BB3D690F1474A0E4D59BA03403EB40273ED4A306932C5A4A31467F2A4003AE2834118E68FD681080F3CD2E693B502810A783ED403DE94F2318FA5307145863CF22919770A01ED40E2804354607D283D694F5FAD3698217B8A53D78A6D38FEB4C63FA528E293F8450785A92189FC39A6374A7F6A6374A621847142F4A0D0BC0228630EF40EB4A7A8A4EF4D08913AD5AB67DA4827AD555A7862318A96AE6738F3234C7B1A7A8AAD04A1BAF5AB49CD60E363CE9C1C5D98F02823D45387141148C8858734DC548DCD340CF6A06342F6A42B5215C0A6B5485C8C8ED4DC53DA9A7A54C80434D229D411DAB2603714B8CD2814A05210CDB415A936E690AD52023C50453F69A08AA191114A8BCD3C8A5030293D0047E2A17C54AC7F2A8DB2684040C29319A795E69315AA18C228C5388A3152C069148053C8E6940A8621A29E0518A00C54301D452D148473C692971462BBCD84C528A5C518A7600C502945281CD1613014A28C5029580052E28A2A6C20A4A5A0D66C62514515002514518A682C25152244D21C22E4FB54A6CA61FC23F315AC62FA22941B57218E3695C2A0C93FA568C7A6A606F62C7D07029D656E6152CE06F27B7615741C56F082DD9D10A492BB4409650A9E10647A926A7550BC6C18F614E07F0A338EB5AA496C6BCA97410C51BF0CAA41F502AADC595BE3EEED3EDDEAD8C75150DC73B452693294132BAAAAA855180053BAD0460F5A08F4A9354AC34D21F6A711C52600A0627140E283403D8D2187B521E3A52E7D28FEB4861DA930477A3DE97008A76101F5A4C528F4A0FA502147348C3073EB42F5C5291914301A294F4A68FE74F03231E940C63038C9A41FAD3C8EA299D29A1A147229690720D2D301C0F18A18E00C528E948DD40A9EA4876A637434F238A6B0E05021A4500529E283D450C069EBC50473477A08E9400E534FEF4C5A703CD3131EA48239C62B4AD1F7000D660AB36B26D9003512574615A1CC8D5ED494672BF5A05733679AC611CD201CD3C0A43C509801151B54BDAA36149E8042C39A69A7B534F7A8B809DE8C528A701500340A705A50BCD3D5680102D215CD4A1682314C44456936FB5484539139A008C454D74C0AB454638A8DC641A632A11CD31979A9D97935130E69A56020614D22A5614D22AD0C6629A4734FC5211498098CD2814E0B40152C42014629E071484566F70128A5145488E7B1462971457A56350C5281C5029451601052E28A5CD3012969297352014521A434988766929334B9ACDA181A4A2945458121C8ACE42A8249E805685BD828E66E49EC0F03EB52585B08E20EDC3B77EE3D2AD9C8E08E2BAE952EACEAA74ACAEC6AC688308A00F4029300FFF005E949F4FCA8C83D7AD6F6B1BDAC3718E9C7B1A7061F4341FD29300D031D9EF464D370474A4DDEA31536B024499CF4E2A19F3914EDD9E869AE723DC522D2B11FF003A4CD29F6A4CD050BF4EB48477A01C9F7A5A06348349D4D3CFB75A6919FF003D295AC21B8A5C528E0F34E231F8D160B8DE7F0A00A5C639A3B6714AD60B811D3F4A4C71EF4E1EF498C1F63400D3EB4E5E691860D39318FA5080630C31A55EA07AD2C83B8A68ED48076306A26E0D4C79C546E3E6FAD31A117BD2F6148BD294D318E5C63F1A503E723D285F7A13939A9EA4314F0318E0D358741E9521E7F0A8CF534C430FA5078CD3B1CD35A90D8DEF4EC520A774A6003A1A17DE97B50A38A100A29E848607D0D3453947140AC6C42D98C1A7E70324E2A945751C50E0F27B5412DDBC84E0E07B572F23933CF7425293E85F92E5138C8A845E29E3A550CE7A9A515AAA691BAC3C16E6B47209178A1BA541647E5153B573D45638AA45465621614C239A918734805617D481807352A8E2902E29E071C54DC043C5394E050C29178AB4048314D2682D4DFA530B0E14E53814D14B9A2C2B0F2DC54323678A7126A32334218CC535854A4714D23AD5015D862987AD4ECBD6A222A868662940A7014A05260340A00A7528150C42638A4229FDA90D66C4444514F228A57039DC518A28AF54D4314A2928CD2B80B9A33499A334AE2173499A43466900A4F34869334134980B9A33499A0566C63855DB0B75909771900FE04D5215B1A7A34707CFC6E24F3D6AE92E696A6D495E45B51C62839C521C1191C1A504815DA8EB1A7069A723AD38E0FB52671D450310123DC52E01FAD271D41A3EBC503B01A69E7B5387D68247A62A4688F1E868248EA29E5698462A58C671CE3A52119FFEB5388A6E29A28067A5009A538347D7AD3B140693BFF314B4114AC210A8FC2954E383F8500E0FD6822A5887114D14F53918A43C1A621A060E3D7A529190734A46694520198CE47A5229C30F4A791823D29AE3073EB4BCC131E4650D440715321CA834C23048A01083A53641D0D3C63A53641C03EF414862F19A53D4522D29EBF85318E3C21F7A74438151BF451EBD6A6418514B77721837426980714E61C81D690D0030D34D487814D238A0068A5C528A51DE818D2294503AD2D31D8503269C7E51420E39A6C8D9CD02B0C2DCD2AF3518E4D4ABD2912C78E293BD14A0F4A045EB45381568F350C1F7454F8AE0AB2F78F32ABBC990B70690115230A88E41AE5E6D4C87669E0E2999E295791480775149DE9D8A315A458C61E6954518CD380AD1082940E28C0A53D2980D38A4039A713DE929084229A4538D349A7702375A8996A663C74A61A698C8C0E69714BDE94526C06E2940E297145431098A08A5A0F4ACDB0198A29D8A2A6E07339A0D34D19AF5EE6A29A4CD213499A910ECD19A6E68CD2017346693348695C0766933499A335202E6945345491F2EA3B13FD6A77296E68D95A05512C8324F407B7D6AF83C534F1D3A76A4CFAD77462A2AC77C23CAAC389F424526E39EFF005A6E79A5DDDB14CD05DFCF34E07D0D464034118E99A13B0F424EF4648F71510761EF4A2419E734D34161E31FFD6A53EE29B90791CD0188F7FAD30B0A47A1A69CFA538367DA97F5A8616B119C1A695A90AD34E454DF50BD861C8A0734EEBD78A42BDC7356996B513BD2D20F4340F4ED4C60450BE94B8A423BD2DC05239A78C35357047340F94D4DACC91C01CE2823BD2F07914A3D286896201914D61953ED4FC6D3EC7A7B1A08A4D01144782295FAE4D3482B2FD69EE38A43620EB8A4907CB4AB4483E5A01112F34A7AD2A8E68EE3DBAD3E85884664C7A558038C54512E4E4F7353370BF5E9496C66F523EA49A434EC60521F4A0630D18C8CFA5388E83D68238A006018A1B81C75A70F5F4A6B7268296A276A51CD00669490A2A86C566C0C0A85CFE669CC78C9A8C12C79A42639054B9A628E29D8A091734679A4CF5A4CD21334AD9C141CD5C1C8ACBB57C715A513035E76222D48F36BC6D214AE6A3751560F15138E2B93639C82A441483A9A7AE0526C63B1C521E29C3148718A7095C18D14BDA9BDE947AD6E9D908507AD233734126987A9A3986296A334CEF413568438B534B534B52134C019A984D2934C3400B9A70E98A8F34E535003E834668CD4B013BD1413DE90D64D80B452668A9B81CAE68CD373499AF62E6838D26693346695C05CD19A4CD19A9B80B9A4CD19A4CD2B80B9A33482969318A29EA483F4A60A70A10D1BB049E644AE411902A4C8A834E6125B05FEEF07FA55BD80FE35DB0D523BE2EE91195CD26DC7434FF2FD290AB01C1AD2C683306827DA9DCFD69A48F4A9E5280E0F6CD21514BF4E3DA8C52B021BB483C528634A3D3914E1F852B0C683F8528E3A1A52A3FF00AD4807B1A602E4918341A391EF463D7F0A561590D23BD2631D69E41A69E38A969DEE806919FAD20E0FAD3BAF148462A94AE3B8A3DBF2A5201A60F6A729CF4AA1883834FE1B8EF484503834341B8AA71FD69E077A4C06FAD2A93F8546C43148DC285E41CF514E1C1FAF4A6B71F362931223987CA0F714879407D4629EC03022A38F3B187706975296A0295FEE7E349DA95B94FC69090D51804D348EBEF4F03028DBD07E74D94D8F897E5E6958E4FD29DF753F97D6900C0FA5048D3D052638A71E690F6A00402907269739E05231DA281ADC6B9EC0F14CE694E734B8C533401F28E6984F7ED4A79E698ED9E074A3A0B6D46B1DC71DA9CA00A68E7B53D548A4B5D48BDC70A5238A4A5ED4C04CD20EB41A075A044D09C38AD381BE5EB5929C355F89B02B8B12B438B12B42F16CD31CD4424A1A4E2BCE67158338A729A8435395862B3DD956270D4135097E0814AADEF42D0449D683C534B8151973DCD6E9DC2C4A48A633534B546CFEF57110F2D8A696CD30B537756A0484D26699BA8DD400E269A6937526EA005EF4A0D309A4CD40C9836682D5106A52D52C449BA8CD47BB34E06B2603A8A4A2A2E07279A09A4CD266BD6B962E697349452B80B9A33494520173499A292818B9A51494A298C70A922432384519663C0A8C735B3A65A6C5F3A41F31FBA3D2AE10E67634A7172762DDB5B2C11041CE7AFB9A90823FFD74ECE38ED4D27D6BB546C8ED4ADA09923BD1B8F7A0D1F5E9417610907AE452100F714A4E7B534E0D3B8D6834A7D452608A7F7E3F4348727DFEB41571BC818238A0114E0BE87FC28287B8A561803914A38E9CD27947B520DC3A8CFD69582DD878FD69D8E2981C77FD69EAC0FA7E34856B000290AE7B53FEBC52E3E98A04572A47D29A73FF00EBAB254530A75A9E502023F0348411C8A9194FA669B8C743493B05EC2AB67AF06948F5A8C8FC0FB74A55931C75FAD5A68648BC103B52B9E323B503E61C73FCE8CF6ED46E16B8B1B67BD4840C5563F2B64548B2647519A8D8CFA80F94ED3DBA7BD46DF2CB9ECC29F2301861DAABCEE026EF4FE5537B16B52407AFB52B1F92AA89C6F3CF0475A9C38600039E695EC16B31FD05381F9AA192501F68EA3AE2A07BA05F6838FEB4AE166D9777E4803B5293DBD2A05930A00EA6A54E955706ADA0FF006A6B1E314ECF4A6B63F1A625A8D031C9EB4879F7A53D28CF1FD699AAB213A7D69A79343100649A899D9F85E9FCE8BA1361249D853554B1E69E91F7A942814ADD48BDC6AA814A69D8141A60371498A7E29A79E28158434629714628B00ABDAACABE0556A716C0AE5C4ABA396BABA2C7998EF4BE667BD542FCF5A512715E6B38AC5BDD49E6555F368DFC56761D8B224CF1522C95483FBD4AAF4584592FF8D26EA80377CD216AD6284C99A4A8CBD309A696AD50AC3CB1A6EEF7A616CF7A4DD5604A1BDE97766A1069734D01216A375333464D1601FBB3466999A33C5480FCD19A6668CD67201E0F34F5351034F5AC6404A28A4145401C9D2D252D7A8505145148033494B494C00D14525318A29C29A29C29822C5A4625B84438C135D18E981D2B978D8A3AB29C118C5749049E742AEA410C3F2AE9A16D51D743663F34D2DED4EE7D2823DBF5AE8D4E919BB8E869030F7A9318A4C0EF48A1BB97F1A4C8A7EC5FF2290A01ED4804C83FFEAA4CD2ECF4CD3486071FD29EA31491C6680D8EF4D20D21047AD2193AB714A4E7BD5639146E23D68B858B2515AA3310EC7151798C3B9A51391EF45C6AE893E75F714E128EE315189FDA9DE6A376A009810DD304D0476A842A93C363E94F05C7A114585E82914C64F5FCEA4120E8D95A70E7BE7E9489B58ACC84546C9DF19AB8541A6B20152E20540590D48B206C03D69CD1FD2A274C722A6ED0F51CDC723A7E94C27D38A727299CF23B1AAD7B325BAA65B97F4EC2B275E2E5CBD41A255950B959085C03C9F4ACE9AE9599E38CE541E33DC54E07DB6311852ACA320F661F5AA7F67FB35D2970580EBC5737B5F79837CBB12D96F6B85620ED5EB572D5BCF77763B49E82AB5CDDC914F829888F51EB52427CADCC532ADC823B0AC65393F7BB8F9D363AE2E04073126E718DC5BD2AB4CA046B3B38DCFCEDC74A4B70DF69DCE4B46C0F5A5BE0B2B2988FDD5E82A94AD25F98A321D6F3EE6E4D6946DBB15896E8C650067B56CA964C06EBE95D9195C6D93138E0727D69BF5A6EFE3A7E54D2598F1C56C8131ECDEA6A36939C28CD3D6227D6A458801D28173365511B39CB54C91639A9F681C5041C7B5348447B71D05262A4205349C671458042B8E4D34D29CD348A2C310E734014E028C5306274A4341349482C0686E568C521E86B2AAAF131AAAF1216639EB4DF329AE79A88935E5D8E02C093DE9C1EAA86A914D27111654D482A143528A9B12C941E290919A696A696C55210E2D4D66A616A696CD5DC43B7500D37AD385500F14B4CCD2EEAA01C2949C5465A937500485A9334CDD4B9A9603C5029A2819A8900F15229E6A21522D64C094514828A80396A28A2BD22828A28A004A0D21A298C2814528A60029C290528A631C2B6B4A3FE8BC1E8C7F0AC415A3A54C16531B1186E99F5AD69BB48DA8BF78D704FAD283ED4831DBF4A39ED5D8770E07DA8C8F4A6927D28C9E7814EE3B0E3834980693701EB4848F5C5218EC7BD2723DE938A5F6E68002293F4A50694FAF14AC0378A36827A0A77E5475F4A0630A2E3A0A69897B66A503DA97028E50203067A1A6981BFFD556B1C52103DE97286A55F2DD791C5287957DEAD11CF518A36F6C52B0AE57171D9D0FD69EB2464F0483ED4F31A9EDFA5235BA9ED8A350B8F563FDE0C3DE863EA3FAD45F6761F75A9A4CC9DB2052BF906E4A4F7CF355E471D380474CF4A5F3B2F875DBEFD2A2963632295C32E78CF20D6152AC61BB292B905EDC25B04651B9B3C83E95079705EA19776D23F4A1AE1E49CA4A46CCE080334F16C52759228F1193D41AF3E4EDBEE44B57DD0C82E4190204319CE015AB6F6AB20019C8607AD3CA296381D2924725C2A7158395DFBBA0BD482EA64B79D55D7E5F5A957FD2177C4DC50F6C8C72D8723D6A45DB1AE1474EC286D595B70BBBEBB15A447894838DCDE955D6D1A17F9883B8F4F6AD0541247B9BB1A8669C210E5323A0AA8C9EC8561924F0DB6162C33F1C9A9F3B5433BE49EDE954E18609267924383E9514F2492B663058019E3B56D04B990F57B9A0B2EE200A9E3E9CD635BCCDBB9ED5AD09C81EB5E8C76B8F96C5907DA940F5A6A8C8F4A5C8FAD68161C48ED499269338ED485BDC0A2C3B010690E290B0EE69A5F140590A69A682DC1C0A30681885B029A58D29149421099A5140A334C42E29ADC52E69AFC0ACAA7C26553E12B3F5A888C54A79A4DB5E5BD19C046053D69DB6942E296E21E9C548A7351A8E29EB49A207134D24D29A6134240213CD03AD28F7A2A84029738A4CD029A0143505BD29A6931EB5603B340A414E14AE028A51D69A69569301DDA9C290528ACC070A72D305396A40945148A78A2A6C073145266835E81406928345030A0D19A314000EB4B482945318A2945345385301454B123BB80992D9EDDA9A8A58851C93D056DDB4090C600C64F53EB5A422E46D4A0E4EE4903398C7998DC3AE2A4E29A001DFF005A7839E3F5AEB89DE84CD264D3F8A438ED5761A1BB8FA52139F6A763B5215A2CC7A0DFA1A71C8E723E94857DE930477A561D850581E94BBCFA53467FBD4A33EB4582C287EC452871E845273DE97711C1E94ACC2C289169E244351E7E948403DA9D98AC4DB94F7A015F5150EDFF0039A3146A1627E3B114BB7350807D69C3228D42C4BB4D1834D04FBD283489B0A54F614D61EB4EC9A6B703FC2A58AC4122B7E1F4ACBBBBD36F308D18E17DAB5DD863819AA1716F14A33E52163FA571622C9DE4F42B5B68436E47D99E4463E6C8738C0F5AB1686503F7F8CFF4A641671472074E08ED9A9E5631F20035E6CE49BB216A88A7F9A5DABDE91631BCE4E48A6C6C243827E6EA6A71C2EDC65BD693D34326EE355589DA4601EF4D12C36D218E43D79CD49B8B8F9FE5C5452DA432E19D893EB9A15BED14BC8B1180037F103DAABBC8A415DB823B1A923558530093515D18D932CA79A515A94D91C93C3144A0C7B99BAD5596F2454022C283C6054C5524002AFCE7A67B9AAD730BAA1DC390DF9FBD74D351BEA2BBE84309F9864F35AF6EF85EA78AC88149603A56B5B2B80377F2AF429BD0D7A16D58F614F1B8F7C5357A0E6A40302B657206ECCF5346C19A7D1458066D0290814F348698C61C0A434E349F4A0061A69A79E94D3400DA5A4346682405249CA8A7535FA54545A19D4D62418E6942D28A70AF2A479DD44238A36FAD389E29A6A508053874A414A3AD3101E69A69C4D34D21084D203484D2035403C51DA905145C05A314519A2E014A3D2905145C070A5029A29D9A901475A70A68A51498870A70A68A504D2B0128A2999A29580E6F349466835E89A051499A2958029693BD14805A5A4140A631453D73903BD30558B350D73129E84D34AE38EE8D5B2B210A6E6FBE473C74AB456A5000F4A42BEC0D7746092B23D08A49684240F4A55E38A715F6A69145AC6885279A5078A66E20E2941F43577B943B3485B1D4F14DC9A334EE02E7DE93228CFA507EA28014528FC6999FA501A8B8C968C018C9CD479CFA9A51400FC8A07B5301F6A5CB75A007528FA537271C9A33EA6801E3A7414EC8C75150EF51F5A53263A0C7D68B812861FF00EA1467DBF3355DA723BD44D333700FE550E490174B003AFE551BC8067FAD540EFD07148519BEF126B372B9372C2B6F5660400A38CF7ACD3AA465194A9C91E953BB3471B856E1B823B1AAB796B0C56EAF1365C9191ED5C1561797BFD44F9AD743F4D09BBCCDED9E462AF5D1213E51556C0DC6DF9D42C43A74ABD22AB2E09AE1A8FDF125A5886344F295FA37AD4A1543FC87A8E7E9491C58879EB4F2A015EC3DAB36F52795F61B80548C679E4E29ADB448A00E3D2A59644B71CBE3774CD3524590653193DC524DEE5728851171B97069970A1A3C0E56A3BD9008083F7FD6AA24C56D70339AD2306D5C6EDB12DC04853CCE723A1A895D2650431C9EC7BD3249DAE54458DA71DA91AC9E3DA4B2A8F73D2B78AB2D5EA4DFB22C476C14824633EBDAAF46B8158F752490CA8565CF1C63D2AEDA6A01B024F94FB7435DF4A575A9499A200C0A5DB48AE1876C1F4A7E41AE95A9561854D261A9E69A7229D82C348228391DA9D4868B05861CD21269F4879A560B0C3D2929E4714DC51A8AC308A43814F229ACB9EF408418348E7E534BB48EF48CBC54C95D3339ABA6440F5A5069A722806BCB9C5A6D33CE9269EA3CD349E682690D422470229C4F151834A4D021734D6A4CF34139A0069A01A693CD00D57401E0D2E6999A5152C2C3B34A29A2945210E14B8A414E14000A314B8A514AF71080734E148297B50028A01A69A338A761D87E68A6E68A2C073D9A0D21A2BBCB0CD2E69334520168A4CD1480514A2929450085153DA92B71195EA1AA01D6B5B4AB6FF96EC3A1F941FD6B4845B7646B08B7246B0ED91C0A5C8A0B1EFF00A537773ED5DE770A4546C29E08A42452B5C68898533A76A9980CF4A8D945458A4EC341A5CD348FCA90839EF8A2E3B8FE3BD2E063AD43CFAD193EB4730C9B8F5A5CAD41934A0FB53E6026DEBED46F1506EE68DE7B51CC04FBBDA8DC4D43BDBD852658F7A39C2E89493DCD2171DF151E18F5C9A51193DA9735F6173019476FD293731E83F1A788B3DAA458B1C52D5EE2B900463D6A558B1D6A5118FAD48140ED47281108C0ED4A538F6F6A9BE9FAD348CF5E940229C91839F973F5E955A6811FCBDB9207DE19E07F856838DDC0181556F6168ECD9E2386C8DD819E3FFD75C988B24BD4ABE843E76C8DA05C2023A9349650C91BE5E5053D335416DD99F75C3F3FDDEF57370590003642BD7EB5C328DB4466A5CCF52DDD5DA44CAA4F07F4A9E32AC81B3BB354524B695C82039ED5618F976C5900C0ED584A29248BDDB632EE2176C3731017B51005853667007AD436B76CCAC5D42A9E869B701A58BCC519E78ABE57F0BD89BF51D75B9A3C820F34C852E0322B27CDDB355BCC75832EC77163F855986E659003BB71FA56AA12B59092B8C7B0977F2C32493C5457F14B1850EC083EF5764899BE6C1CE73F4AA5242ECF8624E077EC2B6A74E6F563B2208A332103393EF5763B523071D3B7714905B9041AD18467E53C30FD4576C6365A97D2C451ABA7DD26A749FA07E2A4F2C67A60D34C79AAB7626EC915C37A114B9F4FC8D572ACA78E29CB30E8DD6A93293271C521C67AD341E3239A51548A14D348A5C0ED41045301A69A69C4D21A421868C507068A4488690D38D21A4221916A31E9524AD8AAE1B249AE0C4A470D64AFA12668CD373464715CA738B9C5216A6B35349A091C5A82D4CCD19A6029A334869334C078A514D14E15203853853053C1A901E29C29829C0D0C43C51B6814E1484263141E297B530D521887AD277A0D2814C687514A28A00E6E8CD26696BBCB0CD19A28CD488334B9A6E69734862D28A414A29812C6A5DC28E493C5749044B144A8BD00AC9D2111A5666E5940DB9EDEB5B43A74AEBA2ACAE75D25A5C38A0D191E9484E3B5745CDC5C7BD211EF4BCFA521C9F6A4508452114B8F7A4DBEF405C42B9A429F4A76DF7A367EB482E37CACFA5218853F6FD697667A9A2C82E462214A2114F29EE690AFD695905D0DF24527943D45498C83D6942516417446234CF34E11A0A785F6A3663D051640342AF4DB9A50BEC053B6E28C01405C6E3DCD2814EFA0E2800FFF00AA80D40023BD281DA97E9C9A5009E3A0A416100A0AE464D38003EB4A067AFE1ED5360B1114CF6C0AA933127E524283D07F11F7A9EE2604945E83A9F5AACDCF0056738A92B302AB7C8E1954673F9FD697521342BE7478C3E33EC6A668F6824F535065D490C37A9C704D72D5A4DB4D025733E16684174CB487A9EC2AC3CAD1C5B262C19B9A7DB31124A8ABF230CF1D85362B796FCB04C2ED18C1AC26ACFDE1F2DB61F1C4FE46E386571F291DA96DDA7B589A4DBB867BFA556FB3CB031859FA1FE13524778F911480142719EE2A5C1B575AA263A946795A6959B18CFA54F62595B83D69EF64F11F98704F18E7352C10989FD8575D35A5D16A3634E0932006FD6A5782390038C11DC5578C71D6A647C707AD74C6DD4A490C30ECE9D3B53828233C83DBDAA427349DCD57289C47236EC2B70C3A7BD3C81C0E87D6A165CFD452A499F95FA8A49F4648AC33C1A8DE3CF6A9CFA534834EC2B15B0C872BC53966ECDF9D48CB5132F7A434C955D58D3BE9550AE0E452895978CE69A914996B39EB498C8AAE2E3B1A709853B8EE890AD26DF7A69905207CD0224A6B534B1A01A2C436472C4241DC1EC6AB1464383D3D6AF7045359030C1ACAA5153D8E79C14B52A11486A4642B9A8CD79B2838BB3395A69D98C634C3CD39A9B48CC703C520A4A05002D2D2668A403B34B9A6668145844A29C2A3069C1B35204A29E0D440D3D4D21120A78A8C1A52D818A00713CE298682734039A60277A70A314555C62E68A6D1480E768A29335DECB173466933466A405CD02928148070A514D14A298162DE668650E87907F315D342C248D5D790C38AE514F35D069249B35DDCFCC715D145B4EC745196E8BF49C51C0ED47D2BA8E8418A0628E7BD27E340C5C0F4269381DA93F1A5FC68013F2A31CD2FD28391486252E3E94521FAD0161707DA8C63D3F2A41F5A5C5002E3141A4C7E3487140EC29228CF3C0CD0081D89A377A0FCE90EC0371A5C63AD009FC2942D0000FD4FD69C149EBF9528000E78A33FDD1F9D200DA075E281CFDDE07EA680A4F5E7EB4F03FCFAD1629248455E9C557B9B8C6638FAF723A0A2E2E7198E33CF73E9F4AAC171D7AD4B7D004009E3D6A658C28E94A898A931C7B0A5621EA42EBEDC9E9504B1E1700727FC9AB6064E7F2A615DE49F4FE552CA5A19E212AFB9720A8EBEB4C81248E469158827A91DEB41D401D3A9A62C636702A1C135A85CAF2A12371EFD6AB9B60D9F535A823062C7B544A9C6314D412D8977456B7898B146248238CF6AB1E500012391FCA9C176B83E95315C373D0D091A2D515C0DA78EFD2A4EA33DC50CA0647A74A1781548A5B0E56C80297F9D464E0FB1A78E466AD143BEB48CBBBDA81D39A0D268CE4ACC124ECDD6A4078C542C0372288DFB351E4C44A47714C23B53C71CF6A0FB5315880A6298C953B0FCE98466901015CD26D23E95315CD215F6A00881EC69C33F85294CD2608A5601C39A51480538552100A702714829453240A83E9504B11E48FCAAC638A08A8A94D4D113A6A48CD61DA984E2AE5C47C64751D6A93641AF36707076670CA2E2ECC4279A334506A080CD19A4CD19A043850292814807034F14C14EA4C09169E0D44B4E06A40943505AA306949E9400F14E5A60ED4F5E29DC0908C534FEB4B476A57019CD14B452E62AC7399A3349457A2C6145145480528A4A5A00334A292814022453CD741A4386B40A3AAB60FF003AE741AD0D2EEC5BCDB5B847C64FA1ED5AD395A46B49A4F53A1E690D3412470052D761D680D1F4C5201F5A5031E940C38A3F1A5C6293B751480323D68C8EDCD181D29681899F6A013E94BD3D694633400C05B34B834F029C14D03B918534E0B4FDB8FF00EBD0703A9FCA80B8D0A07A52ECCF346EC1E07E268C96FA7B500901C0EA7F0149BBB0E28C7E14BB7D3F3A0B51427B9E69C067AF1401ED934330452CC4014EC90C78F7E00AA93DC93948F207A8EF4D966694ED5C84FD4FD691131CD66E421AA80727AD48AA77520193C74A940C703F134256D4860071C50D9FBBD73D69D90A3F90A451D49A376090D63B531DCD00606281F33EEC7029C4718A56B810C8381EF4A1408FDF14AFCB81F9D39FEE9F4E94AC308C7CB5115C337D6A687A5326E1F3EB4742A488D9739A907283FCF34DEA29D1FDD23D29750431C65777A546783C54C3B8F5A8986282E223734A879C5203DA81C355143CF5A0FB51D569A4D325EC2E69197B8EB480F34BD38A9B198A92763527F2A818734E573D0F5A69944A79E94D6E680694F22A84348C52118EA2948FCE9A78A4018A0A8C52838A5FA5170232BCD03229E28229886E7DE941A6B252AF070695C341E28229473494C44722E41F7AA0EB8247A568B9E2A8CDCB135C589DD338EBAD515CF14DCD2BD3335CA8E662E694525140878A0525385488514E1494A064D201C29450294034AE0029E01CD0A05380C52B8EC285C52AF5A42685A9B8EC3F3E9499268C8A2A416814514520B9CDD06928AF50619A5A4A290052E6928A005CD28A4A0500385394E29829453434CD5B3D4DE1511CA0BA0EF9E47F8D6C4722CB18646055BA62B9406AE585E35BC81589F2D8FCDDF1F4ADE136B737A751A7667443F5A5FA542937991864E41F4A76E63DAB7B9D0B51FC5191E94C1B8F518FAD2ED3DC9A7A956438B2FAD28C114D083A9FE74E03D290B41C306946DFC6902D2E298016F4A371A5DBF9518C75A7601003D4D285E697278C0C5285CD161AB8DA318FFEBD388C7F8D3739E9458B407AD2E7F014848039C7E355DE72D954383FDE3DBE8286EC3BD896498463D58F402ABB6E94E58F03A0EC295108E5B927AFBD4981D7A0EC2B3DC96EE315401CF18A524B74E941392053D5401EFDA8B58360036F1DCD380A41FAD0C71F28EA699295C09DCD81D05239C00BEB4A3080927FFAF48832771EF48A7A0F5E8076C507AD0381484E073DA96C2488D46E909F4A73FDC3EF8A48C704F734B27403D4D1D0A5F15858F8069B7038CFA1A54EFC76A4B8198CFD29F42DA180F4A729C498F5A6263F4A53C1535172456E0FD29920F9B34F7EBF5A8DB95A1DEE58D1D71411CD22FDEA791CD5140A78A8E46C1A78E33504BFCA93D110D9206C8A5150A362A4CFA50B52078A6B0EE3AD00D2E69DAE31C8FEB4E079A848C1E2A453F9D086494D228CD2E698889D4E3029CA303069C78A43EB4AC000F34E072299DE9451701D8A42A29450698AC346452E6969080452622191BF5AACE2AC38C66A171D6BCDAD7E777386A7C45671501E0D5A65A8CC7D6B34CC5A2114E14FD94A1286C9B0829C2942D3C0A96C2C2019A7018A50314B52D8EC28A514991466A463BA519A616A42D45807EEA50D51024D38134EC224069C0F151838A5072695843F345368A0473D4941A2BD265851494B48028A28A005A292969000A514940A007668079A4CD266A8A3534CBEFB3B79727FAB63FF007CD6E2B0650CA4107D3A1AE441AB76B7F2DB70AC0AFF0075B91F87A56B0A96DCDA152DA33A5FAD281CFBD6641AAC527127C87DF91F9D5F4955C0284107D2B7534F6374EE4A306971934C0C4F414E1935771DC78C0FFEBD19F4E4D34019EB4F045215C4C13D6940F5E7EB46E03FFAD4024FB7D698D6A3860505BD298F2220F99803EE6A07B9E48419F73C0A2F62D684E71D4D44F380709F31F6E95090F27DF271E83A5489181D060526DB1B6204924196C91EC38A708801903F3EB528762B8E42FB5211536488BBEA302E3A8A63373C5399B7703A5205F5ED4CB40A29FDE900FCA94F033FA5020276E7A7348A33C9EF4D1F31E7A0FD6959B68F73528AD818EF6C63814F1C0C531170BCF534F141204D324236E3D69C29870CF814994878E028F414C739603D29DDC9A8CF2C4FBD32A1B922719A25E633F4A178045249C21FA50532143D29ED9DBF8D4687815237DDA8B1039B9506A23DEA41CA0A8DB839F5A65A18BF7A9C69A3EF538F14C6358E01A81B934F91BDEA314999B771A78352A3718A8D871429C54A11383F4A01E69AA4114E156038521183499A78E98A2C3141CD19A67434E068B85C70E9CD2F6A4140A600681C52D21A402F6A0525028016834523B051DA8D897A10CCC0543906A39A505BAD303D79B59F348F3EA4AF2253485680D9A70AC4818568C629E692A6E161B8A5028CD26EC5201D9028C8A696CD2668B1371C4D19A4EB4869D800D20E68A514C0555A771DA9051CD021453D4D300269C01A0090628A451C514AC239CA28A2BD02C4A5A0D148028A28A00296928A4019A5CD251400B9A4CD069334C6870A5069A2814C6480D4B0DC4909CC6E47AE3A1FC2AB8A70A69D877B6C6AC5AC4A387456F71530D678FF0055FF008F5630A70AAE79772F9E46B9D61CF48C7E748757909E235FD6B2C5491A191C228C93DA9F3361CF27D4D15D4AEA46DB1AA827A616ADA09C8CCB29627B0E8292D6D96DD3FDA3D4FAD585041249383D2B68C5EECEA845ADC62C4A0F4C9A90201DBE829723181C503AD6858A3E9CD28F7A418EBD690B607AFB52B86FB0E2D8A6162DC638A6E734F03F2A076B00F5A534629463AD021071CD21258F5A092C6940029156B6A190067D3A5317E66C9E9437CC703A77A78E0607140870A4268F7A6939FAD03158E01E7A74A6270093439E703B503B0F4EB53D47B0E276AFE1518FE74AE73C0EE685EBF8D32E2AC3C1FE74929FDD1FA503A53673888FD29811C7D0548D82B50C7D2A46FBB59F42454FBB4C7E829C9F7691FA51A943547348ED8A53C2E4D412364F14C9931ACD96CD029BDA9D9181C73499007069A460D3979A52B9A2C00A7041A90107A5420E0E29EA714D0C78A5079A414A2A863BB52722814A6900E539A51518CD2E68B80FA338EA290352D0212814114A481D68019238419359D717449C0A7DECF8C806B3CB64E6B9EACDEC7256A9D093793CD3D5FDEA0069C0D7234731655E9E1EAB06A706A8680B1BE8DD50E7DE9C0D4D8571F9A33482945021C3A5280290528A4171C052ED0690114E14084DB415C53852E28019B7146DA7E05285A00600453C51B6940A7706281C514E038A2908E64D252D257796145145200A28A2800A28A2800A28A2800A4A5A4A0680528A4A51400A294520A514C63853853053C5003C56AE9B0054F348CB374CF61546CE1F3E7008F9475FA56E280A000381D315B538DDDCE9A30EA38645381EC290538718ADCE90FAF5A0F4A090BD7F2EF4C2C49A616B8A5CF45FCFBD201CF3D6940A5A43D85007E14B9E05347A53BA726810A2909248C0C0A42727FA528E290ED6D4514D66C7CA3BD2B3605354724F73FA5310AA31FE7AD28C0CE3BD21E9467148629C76FE7499C03F90A3F1A6B1FD290D215796E7A0A5C727148BC0E9CF7A18ED1D79E942D01EA30F53F90A7A0A681C5387038A11A7417F87F0A8EE3FD591521A86E7B2E7A9A192220E3D29E7A1A6AF4A7377A8108BD286E7F3A074C5358D30657BB9B62633D6A08A4F301F5155EFE6CCC0034CB5942CA013C1AC9CBDEB1CCE7EFD8BC29C3AD37DFD694F4AD4D47018A70E69074CD038A10011CD00F6A71A69E68B0EE3D69E2A314F539A63B8EEB41E2814A698C6E294518F7A3148029464518A6B48147268BD857B0FDDC555B9B80A300D473DDE320567CB2973ED58CEA2D91CF52AD96812486463934CA4A0572B77389B77169452528A402D381A6D380A421E0D3C53169E2A180E069EA6A3C53C54B10FC034B4D069E2A404CD3D69A69451601E29D4D14A2801C2971C520A781405C6519A795A6E0D020C9A293068A00E728A28AEF2C434514548828A28A630A28A2800A28A28003494A69281A0A51494B400B4A29A2945003853D6A314F5A6335F4951E5BB77240AD21591A4B9F3193B119FA1AD7DDC71D6BAA9EC76D27EEE8380C0A696CFDDE07AD21C9E4D28073C55EE6A8003D7AD380C500738FD694D160B874EB484F346292810BD07BE28269B9A51CD22921C28271CD14D3927DBD298800CFD29C70314D0474E78A5278A06039EB41EB4849A4CD4DC6389E31DE900C9F61494E1C0F7A03617BE7B0A639E71E94F3802A3EBCD308EF7140E314E14D18CD3C77A11607B0AAF21DF363FBB5609033EC2AB47F3166F5A4D924A00E2918F7CD04D34FA5480A0F02A19E4DA84FB5484E2B3352B80AA541E4D4B7622724919D3C85A62D4D121073DC1A8CF26933583381B36EDA513440E791D6A703358F69398A4C13F29AD8460D823BD6F0773A612E6428EB8ED4EEF4869C39AB35014854E6969C30681DC68A51C5046294734B601C0D38546339A7AF1D698C0D0CC00CD24922A0C9359973724B102A6525146739A8AD4B92DD2A83CD509AE8B1E2ABB396A666B9E551B396555B1C58B73DE928A2B2306EE14A29075A514842D28A294520169CB494E152C072D3C0A6AD3C54310A29C28029452014538534714F0681011499A760530F1480954E69E05401B1522B71480945385314D381A40C762822814669886FE14538FD28A2E072F451457A0CD04A2834540828A28A0028A28A0028A5A4A6303494B450342519A5A4A005A05145003853D6A3152C437B2AFA9A11495DD8DBD3A111DBAB7F13F27E9DAAE01E9491A0440A3A0A703D8576C5248EE8E8AC380C503E9C52671EE6824FF00F5AA8A17AF4A09C530B7A6290B7E748121E4FAF4A434DCFAD380E99A0A5A028CD3F3B453738A4EB40853F376E294714838A33FFD6A010A78EDCD34D29E3BD309A9285CD039348297D87E3405C51EF4E0734DFE54E18C6698846EC29BF4A4627F1A179A452D07A8C0A701C537D052F6A60453BE108F5E94AA36A81E82A363E64CA0745EB5213517B8AF7109C9A4240A0D452C9B0134989BB21B71288D0E4D605CCA64909EDDAACDF5D798C5474AA158CA5738EACEFA20340A29454185C5157ACEE4A10ADD3B1AA4053850A5665466E2EE8DF46DC01EA29C3AD665A5D6C3B5BA568AB061918C574C64A5B1D719292BA1F8A07140E7BD15658EC64537A528348CEA3B8A431C28660A393503CEA9D2A9CF779C815129A48894D450B777192403548934336E39CF34DCD734A5CCCE3949C9DC5CD1494B50677168A28A00514A29052D210B4EA68A70A96028A78A60A9054B10F029EA334D5FD6A5515020029714E14638A006114E5A08A41C5003B34D6E69690D1604309E6A443C5464734E5E28193AD3C542A6A551484C907D69DDA980734E15248B451450072D41A5C518AF44D44A2971498A9010D14B4521094B4628A0028A28A000D262968A0A128A28A60145251400E152C0FB255623A11508A78A069F53A846C8CF634E0493CD6669F761D0248C032F4CF19AD007F3AEC8C93477C65CCAE87160381D683C9C93C53410297AF53545A0CE68E99C73484F61499E7A7340C5EBF4A78E9803A520F534BD7A5020EFC528E3EBEB4526680428A33DE827039C530927AD218A4E73E9E94019ED4019EB4EC00290313A714BD38EB4520F534C571471C7E748C7B0E941E949ED40D0629C0628147AD243B8E1DE993BED4E0F269DD055763E649EC287A00E8971927BD39B8A07029ACD52210B62B2750BAE4AA9AB9773F9511E7935852317624F7AC652E873D598D2724D252D02B3391B0C528A052D02B8A29450294548AE28AB705D14E1B38AAA28A149A65466E3B1AC974840E6A41329EE2B1C1C1EB4A1DBB135AAACCD957EE8D296E42838AA2F72EC783C544493499A89546C89556C7B48CDDE9869334543666E4FA851451489B852D2668CD002E6969A296801C2969A29D48070A514D14E15203853D69829EB52C44A82A51DAA25A956A043C53BB53569E2810C229878A94D31875A06203C521A51E949DA98080506814A471400AA6A65350035229E2A4193034E14C5A78A910EA293345211CCE29714B8A315EA1A8DC518A71A43520368A5341A8B084A28A2800A4A5A4A0028A334940C28A28A63128A28A005A514D14B405C78623A54F1DE4D1F0B21C7A1AAD9A51426D0D4ADB1A70EA640C48BBBDC55EB7B859D095C8C1EF5CF8AD1D2A4C4CC87F8871F5AD6136DEE7453AADBB335852F0B4831807D6971DCF6AE93A2F70193D7A53B34DC934E180281DC4CFE747BD1DBFA521E690D01258F3C518C9A5EBF8528F5A561DC50300FAD1F5349FCA8A64813F90A51EB4D268E71D7AD03149A00348297DA80B8E273DB03D052647E54D660BD4FE754EE6F020D919CB9F4ED52DA8EE272B166693F857927F4A114281EB514084805B93DEA6279F614AF71EE231E2A3760AB93D05399B1D6B36FEEB82AB533762673E5455BE9CCAE476AA94E3C9A4AE76EE7049DD898A514629691014A05145215C05385140A402D14519A402D149450014668CD25002E68A4A5A6019A4A28A00281452D02014B494B9A4028A70A68A5148638538534528A910E14F5A8C75A916930255352A9A854D48A78ACC44E2945460D3C1A0429A6B734E278A69A06869A4341A4CD3180A5ED4829DDF19A004C1CE69EBC1A40334B8C52112035229CD443A52AF152225CD1480F145211CFE28C52E28AF50D469A434E34869008690D29A4352021A4341A434AC014521A335202D2519A4CD3016928A2800A29296800A5149466801C2969B9A5A402D4B14AD1BABAF515150281A763760BF89D46E6DADDF3538B988F1E60FCEB9DDD4E06B6559A36559F537DAEE14CFCE3F034B14F1CDF70E7DBD2B9F0D56F4F9764E149C061CD3555B7A971ACDBB3367BD2FB522F34E1E95B9D37140ED4A719C521349BBF3A62B813E941231ED4D27B5437170B12D4B696E272B227073F852D667F68B0FE1A46D458F4503EB59FB5891ED628D3CE3AD432DCA440E48CFB56649792B8EB8FA557662C793CFBD44AB7621D6EC59B8BC79490090B4CB65F3275079E79A83357B4C4CB339ED5945B94B533837291A4BF28E29AC695881C553BAB908B815D2DA475B928ABB1B7772114A8ACA762CC49EF4E91CBB64F3519AE694AECE29CDB6252529A3148C828C51450028A514D14B48428A5A414669085A33499A5A062E68CD2514005145140051499A2810B452519A005A3345140052F7A4EF4B400E14E14D14E1523014B49494843C53D4D4429EA693113835229A801A914D66C09C1A70A894F14F078A0071341A6E68ED4218134D14B40A076145281CD27B53852621CA29E053569EB5221A41068A908CD30F14085CD149450062D251457A86821A43451480434DED4514804349DA8A29301A68ED45152025068A290C28A28A620A28A29085A28A2818528A28A005A5A28A4014B4514862F7A7A1C3291EB45140D1BD6CC4C4093DAA6ED4515DB0D91DA817AE2A19D9813834514D8328CB349FDF3551DD98FCC49A28AE699CF21945145606214868A2900569E9BC439F7A28ADA97C46D4772C4A4ED358D70C4B9C9A28ABAA6957621349451589CAC3BD21A28A0962D068A2800A28A2800A5A28A041476A28A40145145300A28A2800A28A2900514514C0052D14520014A28A2801C294514548C5A4A28A0428A70A28A4C448B520A28ACD8122D2F6A28A4028A5A28A061DE81D68A2818A3AD3875A28A4C43C76A78A28A9131C291A8A2810D3D68A28A00FFD9,'','','','','','','','finalize'),
 (24,'nabil','khairullah','fakjsd','asdf','Male','Islam',0x62616E676C616465736869,'sdaf','asdf','1987-11-23','Dhaka','married','sdf','Dhaka','Sylhet','dsaf','afsd','asdf','sdf',0x646E,'asdf','asdf','','','gas','gasd','gasdf','finalize'),
 (25,'Mokarrom','Mokarrom Hossain','Bashir Uddin','Surya Akter','Male','Islam',0x62616E676C616465736869,'sdfa','asdf','1990-06-06','Narshingdi','Unmarried','asd','Narshingdi','Sylhet','Narshingdi','01923789456','mokarrom_cse@yahoo.com','www.dreamlover.com',0xFFD8FFE000104A46494600010101006000600000FFDB0043000503040404030504040405050506070C08070707070F0B0B090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F13172224221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1EFFC000110800A0007103012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F93E3567FBABBAB6B4AD164BCB5F382BB6EF96B374BF37ED1BA264DFFED57B3FC31F0FC374E92DE3DBDA5BCAE9BFE7FF00D92BF62C5E23EAF0E73C6AD3E43CBE6F0F5E244AE2DDFE73B777FE85586D04A9379451B7D7D37F12341D3B4BB77B4B044BE8A27478A557FBC8FF00C7FF008FBD7896B7A4CD2EB4F2A26CDEBB7FEFBFFEC2BCBC3E73CFF19B61A33ABEE9C7BABAFDEF97F8AB5B44D27ED48ED2A3EEFE05ADAD156D2D527D4354B7574965F911FF00BA9F753FCFF72BB1F07E8CF04B2BFC97115EA7C8FF00C713D744F333AA5873819342995A578ADE674644F2BFDE7FFF006AA9DFE95144F2AC1E6EC893E676FE27FEE57BF58786A5596D1FEC8EEB123A7C9FDF7F9113FF0043AE4FC6DA27D89E5769A1FB9FF2EFF3FF00C029D1CC39E7C865C878ABEF53F353FC89BFB957EF207FB6ABB26CDFF3A7DCFF00D92AEF90FF00675754FF0054FF00F8EFF9FF00D06BA3118EF627461F09ED8C3B58259E5F2A242CFF00DDAEB3C27E1AB8BD5BADD0EF9607D8E9FDDAAF6762EBAA34AF2F938F9FEE7F72BD9FE1A6971416897DABDF4292A45F3BBC5F3BA57CD67D9F4E8D2E4A47751CBBF9CF34BCF02DF5BE9F2BEC47457F291DFE4D8FFDFAE3E6B3363AD5BA7CA57CD5DBF37FB55F5A78E6D744B2D0B7E86F6F324A9F3FDA93EE3FFEC95F31F8C37FFC24AA92A224BF684FB92EFAE7E1ECE7118BAB38553931187E4817B7514CA2BDFE739CE5B45F2BEDAAF2B43F2FF04BF75ABB8B3BABBB0D936F99ED51D1DD3F8E2FF6FF00FB3AE12C9EE9F7A5AE1BFBCAE1597FF1EAE9FC3F2EAB12ECFECFBB58BFBF07CCBFF7C7FF0011B28CCE7384F9F9CAA34A35BDC3D22CFC41FDA5A57EFDE178B63BFDCFFBEFFF008BFF00BEEB1752B077D337B7C97089F67FF81EFD9FFB3D68786ED7FE9DDEDD1DF7BC5E56C477FEFF00FB0F5EA7A2780EEEEAD12FA5B4778A2479537FF7FF00837FF9FE0AF87AD5A1099EBE1F0F0A30E73CE6F34DB7B77F2A28526448BCA4DF16F44893FCEFFF00C72BA4F0C45A669C88F2E9C8EFB3E74893CAFF00C73FBFFF007C54179756FA442F0C50F9D709FF001F170E9FFA07F712B909B57B7962785E54B7B56FDD4488FB1137FDF7F928C24EACFDC3A3110872739EB76DE328AFF44FECCBCB4B744B8FB8917DFD95E63E305B45965B8BA4B8B4464F91DD37C4FF00FC4557D05AC5E58AD15D21965B7B8891D37BFF0071FE4ABBAAD96AD7FA3CB7715C79371127EF6274F925DF5EE42B52C3FB8783EDB92A9E57AB5935BDCF990452CB17DE657DFBBFDF5F9AB66C625BCB2889DBB197EF2FF77FFB07F9FF00EFBAA9369BA859DDFCE90EC6FEE3ECAEB3C31612CAF13B5BBFEF5FE7FEE3BD5E3B1109C39E733E9B2EA3FC90F8CCDFB03F9B64F2A3A3BCA88FFF0000FBFF00FA056FCD7537EF763BBFFF0017FC6FFE7F82BD2EC3C02E9E1FB8D43CE85DD62F293F8DE2DFFEC7F7FE4AF34F10DD7D962D96F6EF0C517C9BDD37BBD7815B9311F01EA51E49F3F38D9BC5F776D134B14AEB652BBA4ACCDB76A3FDC7AF2AD52FE4BEF1044FE6C4CAB2AECF293627DEAD7D6A77BA2CF22CB2EEFBDF2BB56080E2F2DD5E068BF7A9FF002CB6FF00157D0E4797430FCF57ED9F379BFF0074E968A28AF50F18E5AC6EB69589A5BB4FF71EBB1D05ADEDD37DD5C5DC29FF003CB7BF9BFF007C5713A75D3DACDBD77FFC05F6D6D69D793DBC0DA930C227FAA555DA89FEE7FB7FED55E67849CCE8C256E43D934DF142697A67CB6E96EF2A7FA3C49F3DC3FF001EFF00EE27FEC95D07863C697D6B632DC4B7735C3CE9F3EF7FBE9B37FF00EC8EFF00F00AF15B77BA8A0DF24BBEEAFF006234BFDC4FF63FD84ABF0EA734565A45DA3ED61AB23EDFEE6F8BE44FFBE6BE62194D28427C87A95AB4E7F19E97E2DD49EE3FE3DE1FB5EEFDEFCFFF002D51FF008D1EBCEEF25B1795DE27D46C655FBE96EEFF00FA056D683A93DBDC4BA4DC4CE912FCF68E9FDC7FEE51ADE9B34EF2A5D428EEA892A4BB366EFF0072B1C0E127467C875D6873C39C7F81B52D3A2D8F7BA85DEC89DDF63FCFB1FF00B9F3A57A36B7AB6837FE1F89F44B49ADEE962FF48D9FBD77AF9E2F2EA6B5BB4496E26744F922F37EFF00FBFBEA687C4F736A3CCB7DBB9151B6BFF12ECD8F5ED62387AAD6F7E07C94E1C957DF3735B96DE2D43EE25C4BFDCD9FC757D3C46F6FA7CB6FE6EF744F9D22F91224FF00D9FF00DCAE06E751B8B8B879A2966DD2FDDF35F73D5A4DF6F6E96E9F3FFCB57FF6EABFB1B9393DA9F4B84C74E14B9207AB69BE2C9AC2C5ED773EC95599D77EFDCA9B37FF00DF08D591E21BABB9E574B74478B67C9FC68E9FEC3D7182F5E09B4C1BB7BA3DC2BFFB5BD12AE6837EED76FA74B37C913FFDF695C95B03EFF3C0EB862FD8D222BFD2FED0FF00F1E3FBD7FF0080573135B18352893CAD8DE6A7FE875EFF00A6FF00C232DE1CBA8AEA679B524FF8F4F93E47AF17F13BEED6E2FF0053B3ED09B367FBF5ECE5DF6CF95C462E739F216F6D14EFFBE28AD0838AB1489E6DB3B6D4AF42F07E82FAA4515BB45E6F95FDCFE24AE074E91629B0CDF2D7A87827C64DA24B6F2D82224B14BFEB767CF5DB98FB5E4F70F6727F6507CF326F10E82FA5C38689619562F29F7BFCFE73FDFF00F3FEC570BA95D3B595C22A6CF2AED254FF00807C95DCF8DBC510EBD2B6ACCF0FDA19FCD74D9FC75E657375FEBE25FE37DDBAB9F2BC0CE7F19D79E568724390F48F0F4F692DEC5A8DD5C4C88BB1F627F023FF00F67BEBD3358F14683AA784ADEDF4DB47B7D41137CAE8FF003BD7CDDA7EA335B9D9E6384D8E9FF7D55F1AB4CA9FBA6D8C8BF2FF00C077FF00F155DB3E1EE79C3FB879D0CD07F8B3FE3EDB73BBBFF16E5AE7B0322AF5FDCBDDDCEECBEDFEEB5638F37FB48A6EE3EF57B9899FD4695287273F3CF90F2AACFDB4E533AAF0DDAF9FA844C88FBFF8D592BD2EF3C0D7167A3AEAD7517936B3A6C899BF8B6579A787B567D36E11E2FBFF00DFAECBFE13EBB974A4D3EF2E267B74F9D3E7FB9BEBC9CD309889CFDC2A8D6E438BD65FCA8A268A6576825DCAD54EE2775956E2295D367F17FB1FC3FF00C4D3BC4175E6CCC8BFDFFEED634B314182CDB7EED13C3C28C3DACCD6788E7F74E81F5EB8DAA88EE9FC5FEED5396FA5BDD46D5E57F9BCD5DFFF007D5635B4C6618AB76231A85BFF00D755FF00D0AA293A33A5ED697C073CE3EFF348EBE8A28AF34D8E257EF55DB4BE789517FBB54A9467B57D0724266509CA1F097DAF5CAE158FDDD8DFEED555383504528638EE2AC42EE8FBD6BAF073A53873D222ACE72F885DAD4FF2DD3EF230A5D4AF96D6F93727F05588EE91EDDB73FDFF009D2A709C4381AD88FABC27EF8A746652B7F303B4722BE4FDD350317FED6508ACC587F0D6ABCFE66AF0247BF6AA36EA96E51D2D6E2E2DBEFBBB6CDB5E2E6D8BAB0C0CE50FF987AB0FEBFF002734847DF29ED9637DA43A3D248D2ECFBAE52B4B559F7B69BB9BF7ADF7FF00BFF72AAB7F69FF00A53EF7FB2E7FBD5D9FEB252C4667F52843FEDF17B1F739CA136EFBD2EEFF00815522CD773040708A78A4BDB996EE7F2C316AB31C691C7B57AD704F12F39AD2A50FE143E3FEFF00F7476F668421546179A9AC7FE4216DFF005D53FF0042A888C54B61FF00210B6FFAEA9FFA157A35A1C90E420EC28A7515F3E6A70C9C9A70386CD55B39408F6B36DA7CAEBE621DDF29AECA59B51FABC2AFDB25C3DEB0B2A9825FB40CFBD3E2956E55B2DB4EEA86E2E96745823FE2A8AEADDA09950370D5E76231DF569CE782F7F0FF006FFC733550FE7DCD5BE862FB4C47CEDECAAD54A496E11F72C4A36D67DC42F0B61C52429BA50BFDEAF8F9E2B1186C65E947D94CDB921CA751A75995B85BB73F7D7FBF5A175F368178EAFF00326E75AE6ADEFD91424D19C2F0C6ABB5CEF49C799C13F28AFBA9E6B95D0CB2585A52E6E7E6E6FE6E6E5FB473284B9F98DCF377A69FBFFEFBFF0080563EB52B7DBE5895BE5CD65E3BF6AB3A7A6FB9407BD7E6F828D6C462214A32F8BDD3AE5DCBF6B02DBA82E7E66E95373D0F4355AEFCC964C2F45F9AAC44E24890FA57EB797D6A54A73C1528F2C61F0FF7FF009CE19A7F101E1AA4B2E750B6FF00AEA9FF00A15564667739FE16A9ADD992FAD82FF14A9FCE9623170FABCEAFD8051F78ED68A83CDB8FEE2515F33F5E87F24FFF000036E43CC69D4DA2BF3C3AC977956DD4E795E42DBBEF54347E15BC7115631E55215873B331F9A85386E69A28351CF2E6E618E76DCD4CA28ACC070CD58B2B8F21F7557CD1ED5D386C44F0F5635697C4845EB5B95453BBE6CD57F37E7241C0A84034E2AE46EDAD5D75735C45584293FB24A8C4956E25556519F9AA7B09DDAFEDB7374957F9D53E7BE6A7B0FF008FE8393FEB17F9D612C6622DCBCF20E589D87DA26FEF5151D1597D6F11FCE5F21C628249F9B15DE7C38F0DE95ABDB4D797E5A468DB1E48F956B82E3278FA55FB0BEBEB6865B7B6B89A349B1E62A1FBD58C65C92BC8F5328C5E1F098A8D5C452F6B1FE53D9A0D0FC3B387B786C34F90A7DF09B772D79FFC43F0BC5A3C91DDD96E3692B6DC37F037A556F85D0DECFE3FD1A0B11233CB74A842FF0012FF0017FE3B9AF46F8E36E2C7C3EF137DF6B95095D7EED5A5399F79571397E7B93E22AFD5E34A74BF94E0BE0F7822EFE2078E2D7C3F6D2B5BC2C0CB75363FD544BF79ABECDB7F05FC1EF03D95869379A6787ED4DDB795036A3B5E5B96FF0079EBCBBF60FD290DA789B5D29FBD7962B446FF0063EFBFFECB5E71FB626AD26A1F1C751B2667316970436B127F77E4DEDFF8F39AFCBF328E2F3ECEE797C6ACA14A947ECFF31F054E71C3D0F6BCBEF48EEFF6A3F827A3E91A0C9E33F07D97D896DDB17F671FFAA0BFF3D57FB9FEED7CF7E07F0E5C78ABC4D69A1DB5C436F25CEFC492F0ABB54B7F4AFBC3C243FE130FD9FB4E6BE3E73EA7E1FF002AE377F1BF95B2BE06F0C6B37DE1CF10DAEAD6223FB55A4DBD3CD5DCBB857A1C238EC556C3E23078897355A52E5E631CC295BDFA5F68FA83C25F07FC1BA1D815BAB05D5E77FBF3DDAE3FEF95FE1AF0AF8FFA5E9DA3FC46B9B3D2ACE2B3B61044CB146BB5795AF65FD94B54D6BC6DAB78BAFF005ABD96F658A2B729BF954F9DFEEAFF000D795FED45118BE2EDE2E3216D601FF8E0AF4F011C4D2C7CA15A7CDEE9F3B848568623F7B3313E13F8563F116B4D25E03F61B41BE419FF005ADFC295ECD71AA787B49BEB7D12492D6D669153CB8522F93FD8AC3FD9F2C117C20F395F9A7B96DDFF0001F97FAD7937C49BD96E7E206B13163BD2F1D1003D369DBFFB2D7E830AD1C0E1213847DF99F35568CB3CCD6AE1E73E5852FCCECFE33F842D6CED175FD36DD6DFE6DB7312F2A0B7F10AF2AB0045F403FE9A2E7F3AFA6FC6D00D4BE195D3BF5934EF37FE05B37D7CD16433750B7ACCBFCEB9338A51856E787DA3D3E13C6D6C561650ABF1C25CA753452515E49F4E719B8EE271C9A7329C8C724D314F39AF49F85FE1D8A70BADDE2A4AB1B7EE63FF006BFBCD55084A52E581E9E519557CD7151C3513D83F66AF0659F85B42BBF166B48A757BB8FCAB189FFE5DA26FBCFF00EFB0FF00C773EB5E3FF1D7C590788FC4A6D34E6DD6164CCA1D7FE5ABFF0013D7A278AA7D5B57D19F4CB6D43EC6928DB2B6DDCCE9FDDAF2AF11F814E93A44D7E75159BCAFE1F2F6D7655A538439227DB679C398ECBB0D3C3E1697EEBE2948FA33F60BB853E0DF105B9FBC9A92337D1A2FFEC2BC4BF6AE89A2FDA07C5024E924D138FA79295D37EC69E2E8341F1FDD6817D22C56DADC4B142CDD04EA7E41FF0002CB2FE35EB7F1F3E05CDF113C6969E23D3353B7B0678920BF59D1BEEA7F12FAB6DED5F96CB30A393713D7A98AF761561F11F13EC675F0B1E53BCF824C2CBF67CF0BBC9FF2CB47F35BFDCF9DEBF3C6E9FCCB991D7F89C9AFBCBE3AEBFA7FC3BF82571A75AB08A56B15D2F4D8BF89FE4D9BBFE02BF357C13B4E01F535D5C10E788962F1FF0066ACFDDF913987B9CB48FA83F60DBF4B31E3657FF96B0DA7FE852D79AFED5CE25F8C97CE3A7D9A0FFD00574FFB204AF14BE26D9FC5141FCDEB8FFDA65B77C54B93FF004ED07FE802BE8A15B9B34947FBA7CF42AFFB6B81DDFECFD74A7C191A9EB1DD30AF17F88913C3E3AD695F86FB6CA7FF001E35D97C09D7A3B1D42E745B891552E7E680B0FF00969D8576BE21F0069DADF8A175A96768D77AB4F06CFF0058CBD6BEE5D2A98DC152F65F60F958622193671889E23E09EC6EF8A665B6F8713893FE59E97B07FDFAAF98AC7FE3F60FFAEABFCEBDC3E396BF1DA787BFB1E290FDA2EF66E5FEEC7E95E1F64317B0FB4CBFCEB9F38AB05563087D93B783B0D386127567F6E573ACA28A2BC63EB4E24F5E2BA7D03C61AAE95622CED962312B6EF990373F8D738E0AC8CAC30CB4D27B8041A719729D784C6D7C24FDAD09F2C8EC0FC44F100EA2D7FEFD0AABA878DB5BD42D5ED6692158DCE4EC8B06B9A5383CE01F7141F98F1CFD0537564CEEABC419A558724F113E5FF10F864786457476475F995857B0685FB477C4CD274C4B26BEB2BFF2D76A4F796C1E5FFBEBF8ABC68E7DE8527B5736330185C74393114A335E67910AB287C274DE3EF1A788FC6BAB7F697897527BC9957646BD1224FEEA2FF08AE6475A3E9CD277ADE9D2852872D38F2C4994B98E9FC13E36F10F83E4B93A1DDA5BFDA76F9BBA257DDB7A7DE154BC5DE23D53C4FAC36A9AB4A25BA75556755DBF747158A68151EC61CFCFCBEF13C91E6E6240E5240E0E4D7536DE3DF15C16C6DE3D626DBEAC4337FDF5D6B923F4A72E31F74D6D1A9387C3226A50A557F8B1E624BCB89EEEE1AE2EA579A573B99DDB73352E9FFF001FD07FD754FE755AACE9FF00F1FD07FD754FE7506875F457A57FC289F8ABFF0042AFFE542D7FF8ED1401FFD9,'Hasanat','Brother','Dhaka','8952112','BAnk Ashia','Motijheel','454656','finalize'),
 (26,'wasir','Asie Uzzaman',NULL,NULL,'Male',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0xFFD8FFE000104A46494600010101006000600000FFDB0043000503040404030504040405050506070C08070707070F0B0B090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F13172224221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1EFFC000110800A0007703012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F8F6D2DE59E511C11BCB293F2A2AEE66AF69D50F862EECB498F55B77C5CDBC457514976B8644D8FF0027DDDC8FFC35E3DA4DE5DD96A70DE584F2DBDD472AB45242DB5D1BD57DEBBDD72D7C596D697CF7B6B24F24F3CB7063BC4592545757DEECBFC0D4BED1ED6513943DAFB9CD1286981B4BD5635B2BEB5863D3AF25D9AACA8EF15CB7DD55FA6DCD3B53B6D53ECD68D0CD6096DE5456BF6981F745F23FFAD95BF86B1AD34ED4FECD61A7EA73DC5A69772AD7B0296DCB21FB9B917FBDF26DFC29F26DB1B59DAC56F9A19736B2CF245B6350C3EE9FF6AAE308CBDE39E3CB0A52F7794ED7C6BAC4F6F71F0FD74B7CCB61A1C4F657076AA7DA9E57766F9BE4DAAF583F0635D4D07E24F87F539637668F52459E4FE058A5F91FFF004235D7780A609E13B7D435B1A658F832D888047790FDA5B50B8FE37B789FE747E9BF6FC95C2EBB36B11DF6A3168AD711697756E6EBECB6B2897C8B5F377A2CBB7EEEC6DBF7BEED79B479671961F97FAFE991F046154E96F6D752F0AF8C356D2F43F3D2FA3BFB9D26E26902BC4F0CED84445FBDBB6EE6A7F886C2C75BF1999B53BA9AD7C3BA7A269114F6FB59A49618BFD526E3D5BFBDEF5A7AF5CC4DF12756F17792AEE748B4BC8F3F785C4B126C2B5C8697A6785ADDD97C473497B25D5BFDBA3B9B2BE48D51769DD132BA732EEFE1AE886B18FF0031BE363EC70BC91FB72FFD24BDE2BBDB476B0D2D746D574C16F22DB58584A772CF6CCE5A47697BBBBFF73E5AD4F8893D9EA3F15EDB44B4D2EF6FAD7468EDED0DBDBB7CEF6B0A17B84FF7B97F9BFD9AD0B1BFF0FB5CF86B4ED09AE2FB46B7B96D51E5BC9775C5BF908FBA2D9FC09F77FDEAE0F47BABAF1378CF455BDD66DE1696F3CADF751FEE6D55E5DFF3FF00793E76ACB9637E6FB3139F0F29FD53FC53FF00D27FFDA3D1BE2BDF5EEA3E1349B47B0B0D43C016F9FB0B69F70CCF6770FF0071AEB7EE747FF63EE579C5F78966BCBD4F105D3D9349F6F495B4D5565076A6DDDBBFBBF2D763E33B1D2FE1A5E6A1E1FD36DB596D4EE22C497FA848B0DB4B0A3EEFDD4517DEDFB3F89AB0E4D574CBEBEB9BC8ED2D6F2E6E5DAEA79258B77CEDF33BB7F757FD9ABCB28C6A538F27C3F64DE54BDAD5F8F92466C1A9ADACF69605973FD9B71037FB2D2A3FF88AC4BA96F23B5B6975237092C76ABFD9DF2AEDD9BDBAFB67755DD32D751D66E60D3608DFFB3EE351F96564E15F6F4DDFEE7F0D6CF8ABC1D32E8F378893ECD696CBF3C303B379B3C7BB025C7F0EEAEB9FC65CA955C45294E3F64F3AFBD45368A478E5DB296382F22925884D1A48ACD1FF007BFD9AF48D765BD9FC237BADF875AE6CB4C25229FCC8C0924DFF00C1E6FDE7AF2D6E79F7AF62F1192DF0EB49BED4D9A6D51ED7ED36A7EE259C2876A6C45F97E77A47B795734E95687F74E26DAD6CF52B2B5822D56E2392DD0E209FE645EACDB2A7B67B8D5B545D3D9EF6F34BB65FB4DF25AC9B7CC48BEF4DB1CEDDFB3E5ACDBBB892E356BFBBB08AE6F50FEFA59E78BE75CFDE76D9F77E6AE8EE7C25E20B4BB8F4CD634BB8D06DA78D2F24BAD52158B6B7DDDDBF6FDCDFFC14E52A7CBCA71CA519C396275BF0D469FA8CBA3F847C45E188351B29E79FFB3DEF26B882E2CE0FF5ACFF002FCADBBFD9AC6F8AFA7F840DF5CCDF0CAE351FB1DB45E56A8D7570CAD2BBBEC55457F9996BA5B2D5ED6E2E6286DF5C5D5B5B63B2DE2D152E37CB37F0BAAB7CAAFF00ED26CA7FC5CB8863D06D13C673787AEFC64B7091F936DFF1F1145B5F77DAA58B6A17FB95E1D45ECB1F09C64FDFFB3FFB772FFF00B27756C3D2F65F19C6789F58BDFECCB08F45797ED4367EF60FBE56DE2D9BBFF43AC3F0E5ADAC56F34F782C259A6B769ADBCF3BD1B6FDE46FEEB714CB9D36E5A76D29B52B2B6934D8A71248F3EC593665B6A3FF001B37F0AD6EF85AFF00C3D6D7135F8D3E18EC11BFD1FEDD71E6A46366D7FDD7F1CADFF7C57BD4BE3F74F3737C47B67FF8099F61E259AFAEA6B8D8904B16933C11C7122A451F5FB8B5AFF077C0FAA78BDF529F49D4EC2C1EDEDC473DACAEE65BC89FEFED44F98AFCBFC3593E29D7F4CD46E65B9D1ADAC34CB6BBBD467B58ACFF007B122A6CDDBFFBADBDFE45AEEEDB49D13C3DA3787FC4B7B6BAC6B177730C5F61BC9E6F2F4FB6C37CB1EF8BE7DE9FDC6D95E7E2EBCB96D1F8A47560A97B6E58FF002995E249927F09E9BE02835A87C5BA8C5A92A69A3ECB2C5F63FEF45E6CA1772BFC9F27F0D7276565ADDEE84D6C26D3EDE02EFE4C6CEA8F9DFF0032D6D788342B9D5B59B926CEEAE751D42E99A1548D82B4B2BFF79BE555AE71EFAE13FB46E22974CD3DBED1B5B4A8D1D95BFDCFBDFF00A1575619469FBACDB1147EAD56D57FF2427F06C13587C41B68EE0B5A47692B4F38DDBB6222EF7FFC7454BE3AF12F88BC45A6457B7510B6D2A7B8658A3886D8D9D074FF0080AED159BA3A6A37974F731DBC4ABF35836D0ABB5E54745F96B3F566BDB8576D56EA4FB459A25AC51CCBF36D4F9767FC06AF9BDFF74E4F6D38E1FD947E13168A28A679E48BB4364D775A84D0DD6956B6BA75B483FB5274458A0DD29558FE4555DDCFCCFF0036DFA5723A4476535FC51EA376D696ACDFBC9562F30A0FF77BD7A1F87D85AD85BC3A8E9B6CBA0CA14C61A4659E5907CBF6883F8D59B1FEE5267A18084EACA5089C60B5B83E207D2AD15B4D958FD9E68A7976ED74FBCAE7FDF5AF6EF8ABF122DB57F862D6D2BA6A2359FB15D5BAFDA119EC2EA2F92E22962FBFB1D977AFFBF5E0DA8C51C5A9DFA5CFDA525591B62C8BF3EEDDFC75610E8933A0922BAB58D2D36B796FE67993EDFBDCFDD5AE7AF858D6942A4BEC9CF19CA1CD13ADF0CEB3A8E93E08D4F51F0EE9D2C3A85DDD3437BA8411FF00C79C1B372C51E3EE6FF9FE6FF62B923AB79B358CB796B1DD35B3FCFBD9BF7E9FDC63FE7EF568F82F58D6F48D437E817C2CA7F299A7F3275114E89F36D657F95FFDD39AE8EFF52F09F8E104BAB08FC37AEAC4156E224DD6771B47F12F589BE9C51774652972FBB2378C3DAD2F764734F7F612B4515EE9D6965A65E5FB5D79B64825BA822FB9E52EE7FB9FECB56658ECB776BD7B28EEAD583C4AB2315F9F67DEF93FBBF7A9BA4DF4DA75C4C608ADE779A2783F7B1799F2BFF12FFB55A7A45ADEC7E18D5AE841A6CB6ECF15BBACE47DA15CFDC68D7EF56FEEC4E78425316DCDA58E87693C9AAFDB60BCB866BDD2212F1BC7E5F08CCC576FF19AD5F05F8C755F0C59B1B1824BFD126023D4EC6F3F796970EDBFB63E5F97BFDEAE69AE648279AF2C6C5ED6CE5FDD796C5A446FF63777A9FC3D7565637D6977AA5B0D474EF3B74FA72DC345E6ECFBBBBFBABF3FFE854AAD28D5A7CB2F7821567091B7E2DB88F4BD6C9F0F6AF7F1E93776E97367199999A20DFF002C9B1FDD6DEBF856E78C744F0F699E17BEB8B4B52B7704B6F17DA566F91EE1D77BA27FB0AA3FF1EACF8DAD7E22F882D34FB5D334ED0EF5A6D917D995FCAF238F94E5B0BE52ABB6EFE2EF597F10F5FB3D46E2DF45D0D1E2D0B4BDD15A87FBD3B7F14ADFED3D634D49F2C59DD0C428529CA7FF006E93C1A995F1A5C6B9E21B88AE2EE1612958426D9A40BF27DCF969FE24D6EFB5AD3AFE6BFBB5B8484A3A2C4BFBA8E466E89FF0114FD1FC36DE28B95902FD9250A5AE8C36EAD160A2794B12A7576E77547E30B4D3F45B2B5D2ADD9AEAD834924F221D8CF2E362FF00C057FC6BAA09F27BA7546388861E53FF00975EF7FDBDCDFF00C89C0D14EA291E00F4C16F98D7A668D7561A9EA31EA1AADC2D9CA8BE4417E23DF06366D1FBB6FEED79B22BC8EB1ECDCCDC28AF40F0B5C5C5844BE16D6ECA2D434CB91F6892285D7CEB17FBA5D5BF81D76E195BD39F5A4E47A795D550ABCB289806C34ABBB796DE1D4E6B8D6CDF4B99A5654B49200BF7F73FCDBD9AB1AFE792E1E2DF04507968ABFBB8F6EE1FDEAB8B7176897BA2D8DC192CA7977B28DBFBDF2B76C6FE74CB3B7BBD521B8905DC43EC76FBB6CF305675DDF713FBDFEED28FBA70CBF96258D6E3D46FB575927D2D6CA4B98D65860820F29190AFCACABE95E8FE00F83F77E2086DEF6F2436367B7324CEDB8C9FEEAD41F093C390DD6AD18D4773A44BBEE3737F07F72BDC6F35E444F262D888BF22227F0561579E5EEA3EFB28E1BE787B5AB0E794FF00F252B68DF0E3C09A42AAB58497EFFDFB97FF00D952B65FC33E0874D9FF0008DE97FF007C573173AE3EFF00BF517F6E3FF7EA61843EB68F0EE2393E32F788BE18F83F57B36B5B66BAD35776E4549B745BBFBFB5EBC2BC73F0CAFBC2D7F1CD745EE34B7978B9B7E032FF00C0BEE37FBD5ED89AF3FF007EA59B54B4BFB296C6FD126B79D364A8F5AFD5A748F0334C8E7FF2F61CC7CA1E5C875411D8ACEACD2ED814B7CFD7E5AB3F6816338B0BA59A4B6899BCD83EEED976EC6ADEF1EE83FD9FAADD411BEF313FC8DFDE4FE1AE5EDB50B8B66B66B72B14B6CECC92AAFCD5A9F9E63B093C255E466E7862FADAD14C326A7A922DE068AE20B37F2BFDC666FE35FF0062AD78A6F7C9D7E4BC486CDE0B493ECD6F69709B879414ED6DB55FC25AF4DA34D06A567246750819A2820FB3E5995BEF3EEFEF56EF8DBC4F6FE20D14DBEAD7FA87DB607DD1C33E9F0AB06EFBA5521B6FB6DA0DE9724F0B2F7FDE3CDA8A6D14CF2891391F535EA1A4416773E198B4A130D22C9DF7DD5FDC4AAAF72FD3EE7DE2ABFDD19AF2F43F30CD7A0F8AB5EF09EAD62F23F87EFF0046D452255B4FB3DC79B14ABFC3BF7F3FF025A967A79755851E6948E5A2D262BBF114BA669F7F6AD6EAEDB6EAE1BCA8CA2FF1B7A55BF0569DF69BF79586E584E7FE055CEFCDE67BD777F0FD7CAB366FE2692B7C3C39E674F0F61A188CC20A7F09DDF87655D2CCAE5D54B256B1BC130F95B7D7A17C39D57E16F82BE194BE2AD76DEC7C4FE237233A736C7920567F95511FA7C9F3337D6BABF8EFE05D027D03C31AFF008634B8746D4B5AD46D6CBECAB1795BBED0BFC69FDF5A7565EF1FA661F8BF0984C57D5EAD19423FCC78535CC61BCB695777A53F7374E315F49EA363F0DFC0BE29F0B7C3A97C1969A8B6B68E93DECF1A3B27F0A33EEE5CBB7A7DDAF37F157813C17E19F8C17DA2789B58B8D2BC2834FF00ED1B77597E6FBFB3C8DDF339FE2FF6A88CCECC2F1FE1AB4A6A74651FB51FEF9E65F684FB892AEEAAF717DE41DDBF657D03FB47E81E16D1BE1978767F0D695676904B7D12452C70ED668BCA76F99BEF5627C1BF0B785F4DF861AEFC55F1668F0EB62D5257B2B59577AA245E8ADF2EF67AEAF6D1E4E639B15C5B87C4659F5A9D2FB5C9CA7CCFE28B98AF6EDEE15D58EC55AE3AF2EAF63D3A7D2A3286C5E75BA61E52E778F973BBEF7F157D71F1CBC1FE10F19FC08B2F8B7E15D06D742BE8D525B982DF6A2BC7BFCA746DBF2EE56FE2C7635F266A377776D692DAC13B4505D6C5B8895BE5976FCCBBAB9EAB8CA373F37CCF130C7D2F6AA1CBCA50D02013EA519779E2822FDECD2C09B9E245FE3AD1BB9AD6E744B9B9D47ED773AA5CCA8D69722E15BE45F95D655FBDFDCDB5CEA12ADC332FD2B6D2416BA5EA9A726A72BC52BC2CA91C5FBBB82BFDE6FE1DBBAB96513C184BEC981451455190569DFBE9A2D6D56C4DD35C795FE94D2EDDBBFF00BA98FE1ACCA280244628E194ED65AED7C17778B72CEDB9CC8C5AB8715BBE17B9314ED1B746F9AB6C3CF9267AD91E23EAF8D84CFB8FF671F841A54FA1695E3ED7CC7A8DC5CC29736169227EEA0FEEB37F79FEB55FE3958F8FB4AF1068DE3FF166A3A33E8DA5EAF6ED6BA7D834AC63F9FEFF00CC9F3BED5AF9C74AD7F578ADA286DF5FD5E1B78D7624315ECAA8BFF01DD5B4DAADF5D41E5DEEB1A8DE439DDE5DC5D3CABBBFE055D5F559CE47DC61387F178CC5FD62B5687FF687D57E33F06DF78CBE2C7817C71A1DE5A4FA258A8967984BD51583214C7DEDD5E6FF0017F4CD47E2CFC62D4749F074B613BE8BA6A412C93BED567DEFB82B0FF7ABC82D356BDB2B57B1B1D6752B4B497EF5BC174E9137FC06A3B7BC92CFE6D3AFAEAC1DD76B3DACCD1337FDF3571C14CECC1F0AE2F072F6B1C4439E11E581F577C6AF00F883C57F0E340D0F45934F5BCD3A785E569E5654DAB13236DF97DEB8DF8428DE2DF807E29F8636D73027886C05DDA98DDFBB3B3A3FFBBBF2BF857CF936BDAFE703C49AE7FE0C25FF00E2EB9EFED2BCB5D405DD95F5DDA5EA9FF8F88257497FEFBA8784942078D5721C451C27D5E75BED7347FC47D2DF158FFC2B2FD912DFC0FAD4F07F6FEA308B548226DE37BCBE6CBFF0045CFCD5F126B0D968E33D335D4788753D4753BC6BBD5750BBD46EBEEF9B7570D2BFFE3D5C7EA93179BA7DD3D6B9A70E581F358CA5F56A528CE5EF48A90B22CCAD2AEE4DDF328A7DCB42F3C8D023245BBE4566DDB56ABD1581E18514514005145140054B0CAF14AAE9F796A2A2803B7D2350570A457476F7A08E1ABCBED2EA5B597746C6BA0B4D5D644FBDB1BFBB5E852C59F6F94F10F24792676E6FC7F7A98D7DFEDD72E97AEFFC74A2E9EBB3EB07D17F6E739B5737A6B22F2ECD433DDEE5AC8BEBE453B17E66AE6AD58F1B31CDBFBE4DA95E6C89BFBCDF76B9F7EB9A74B2BCAD963CD3306BCF9CF98F8AC5E265889F331B4514541C814514500145145001451450014EA6D14016A3BAB88FEE48453BEDD75FF3D6AAE3DA8C7B5234F6B3FE62C493CB27DE918D56EF473EB494C52973051451410145145001451450014514500145145001451450014514500145145001451450014514500145145001454B344F04AD14AA55D1B6B5454005145140051451400514514005145140051451400514514005153DB5BCD75388604DCE4642FB51401FFFD9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student_personal_info` ENABLE KEYS */;


--
-- Definition of table `syllabus`
--

DROP TABLE IF EXISTS `syllabus`;
CREATE TABLE `syllabus` (
  `syllabus_pk` int(10) NOT NULL AUTO_INCREMENT,
  `offering_dept_fk` smallint(5) NOT NULL,
  `accepting_dept_fk` smallint(5) NOT NULL,
  `session` smallint(5) NOT NULL,
  `semester` smallint(5) NOT NULL,
  `dept_degree_fk` int(10) NOT NULL,
  `course_type_fk` smallint(5) NOT NULL,
  `marks_type_fk` smallint(5) NOT NULL,
  `marks_configuration` blob NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `course_title` varchar(100) NOT NULL,
  `credit` float NOT NULL,
  `hours_per_week` smallint(5) unsigned NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`syllabus_pk`) USING BTREE,
  UNIQUE KEY `offering_dept` (`offering_dept_fk`,`accepting_dept_fk`,`session`,`semester`,`dept_degree_fk`,`course_type_fk`,`course_code`),
  KEY `new_fk_constraint` (`offering_dept_fk`),
  KEY `FK_syl_dept_degree` (`dept_degree_fk`),
  KEY `FK_syl_dept_course_type` (`course_type_fk`),
  KEY `FK_syl_dept_marks_type` (`marks_type_fk`),
  KEY `FK_syllabus_accepting_department` (`accepting_dept_fk`),
  CONSTRAINT `FK_syllabus_accepting_department` FOREIGN KEY (`accepting_dept_fk`) REFERENCES `department` (`dept_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_syllabus_offering_dept` FOREIGN KEY (`offering_dept_fk`) REFERENCES `department` (`dept_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_syl_dept_course_type` FOREIGN KEY (`course_type_fk`) REFERENCES `course_type` (`course_type_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_syl_dept_degree	` FOREIGN KEY (`dept_degree_fk`) REFERENCES `degree_offered_by_dept` (`dept_degree_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_syl_dept_marks_type` FOREIGN KEY (`marks_type_fk`) REFERENCES `marks_type` (`marks_type_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='unique key: offering_dept, accepting_dept, session, semester';

--
-- Dumping data for table `syllabus`
--

/*!40000 ALTER TABLE `syllabus` DISABLE KEYS */;
INSERT INTO `syllabus` (`syllabus_pk`,`offering_dept_fk`,`accepting_dept_fk`,`session`,`semester`,`dept_degree_fk`,`course_type_fk`,`marks_type_fk`,`marks_configuration`,`course_code`,`course_title`,`credit`,`hours_per_week`,`state`) VALUES 
 (31,2,1,2006,5,14,2,3,0x646E,'132','new',3,5,'finalize'),
 (33,2,1,2009,6,14,2,3,0x646E,'136','new',2,5,'finalize'),
 (35,2,1,2006,7,14,2,3,0x646E,'176','new',1.5,5,'finalize'),
 (38,4,1,2006,6,14,2,3,0x646E,'176','new',4,5,'finalize'),
 (39,2,4,2009,3,10,2,3,0x646E,'CSE132','networking',3,6,'finalize'),
 (42,2,1,2006,6,14,2,3,0x646E,'CSE132','new',3,5,'finalize'),
 (43,2,1,2008,7,14,2,3,0x646E,'CSE132','new',3,5,'finalize'),
 (44,1,1,2008,7,14,2,3,0x646E,'133','new',3,5,'finalize'),
 (45,1,1,2008,7,14,2,1,0x646E,'134','new',3,5,'finalize'),
 (46,2,1,2009,6,14,2,1,0x646E,'133','new',3,5,'finalize'),
 (47,2,1,2010,5,14,2,1,0x646E,'193','new',3,5,'finalize'),
 (48,1,1,2010,5,14,2,1,0x646E,'193','new',3,5,'finalize'),
 (49,1,1,2010,5,14,2,1,0x646E,'393','new',3,5,'finalize'),
 (50,1,1,2009,6,14,2,1,0x646E,'493','new',3,5,'finalize'),
 (51,2,1,2006,7,14,2,3,0x646E,'cse-132','new',78,5,'finalize'),
 (52,2,1,2006,7,14,2,3,0x646E,'cse-136','new',3,5,'finalize'),
 (53,2,1,2006,7,14,2,3,0x646E,'cse-137','new',3,5,'finalize'),
 (54,2,1,2007,5,14,2,3,0x646E,'cse137','new',3,5,'finalize'),
 (55,2,1,2007,5,14,2,2,0x646E,'cse136','new',3,5,'finalize'),
 (56,2,1,2007,5,14,2,2,0x646E,'cse132','new',3,5,'finalize'),
 (57,2,1,2008,1,14,2,2,0x646E,'cse_132','new',3,5,'finalize');
/*!40000 ALTER TABLE `syllabus` ENABLE KEYS */;


--
-- Definition of table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `age` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`id`,`age`) VALUES 
 (1,5),
 (2,5),
 (3,9),
 (4,90),
 (5,90),
 (6,90),
 (7,90),
 (8,90),
 (9,90),
 (10,90),
 (11,90),
 (12,90),
 (13,90),
 (14,90);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


--
-- Definition of table `university_semester`
--

DROP TABLE IF EXISTS `university_semester`;
CREATE TABLE `university_semester` (
  `university_semester_pk` smallint(5) NOT NULL AUTO_INCREMENT,
  `university_semester_no` int(10) NOT NULL,
  `details` blob NOT NULL,
  `state` enum('initial','level1','level2','level3','level4','level5','level6','level7','level8','finalize') NOT NULL,
  PRIMARY KEY (`university_semester_pk`),
  UNIQUE KEY `university_semester_no` (`university_semester_no`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='unique key: university_semester_no';

--
-- Dumping data for table `university_semester`
--

/*!40000 ALTER TABLE `university_semester` DISABLE KEYS */;
INSERT INTO `university_semester` (`university_semester_pk`,`university_semester_no`,`details`,`state`) VALUES 
 (1,3,0x4E554C4C,'finalize'),
 (2,5,0x4E554C4C,'finalize'),
 (3,6,0x4E554C4C,'finalize'),
 (4,8,0x4E554C4C,'finalize'),
 (5,9,0x4E554C4C,'finalize'),
 (6,10,0x4E554C4C,'finalize'),
 (7,13,0x4E554C4C,'finalize'),
 (8,14,0x4E554C4C,'finalize'),
 (9,15,0x646E,'finalize'),
 (11,16,0x646E,'finalize'),
 (12,17,0x646E,'finalize'),
 (13,18,0x646E,'finalize'),
 (14,19,0x646E,'finalize'),
 (15,20,0x646E,'finalize'),
 (16,21,0x646E,'finalize'),
 (17,22,0x646E,'finalize'),
 (18,23,0x646E,'finalize'),
 (19,24,0x646E,'finalize'),
 (20,25,0x646E,'finalize'),
 (21,26,0x646E,'finalize'),
 (22,27,0x646E,'finalize'),
 (23,28,0x646E,'finalize'),
 (24,29,0x646E,'finalize'),
 (25,47,0x646E,'finalize'),
 (26,46,0x646E,'finalize'),
 (27,48,0x646E,'finalize'),
 (28,49,0x646E,'finalize'),
 (29,50,0x646E,'finalize'),
 (30,51,0x646E,'finalize'),
 (31,52,0x646E,'finalize'),
 (32,53,0x646E,'finalize'),
 (33,54,0x646E,'finalize'),
 (34,55,0x646E,'finalize'),
 (35,56,0x646E,'finalize'),
 (36,57,0x646E,'finalize'),
 (37,58,0x646E,'finalize'),
 (38,59,0x646E,'finalize'),
 (39,60,0x646E,'finalize'),
 (40,61,0x646E,'finalize'),
 (41,62,0x646E,'finalize'),
 (42,63,0x646E,'finalize'),
 (43,64,0x646E,'finalize'),
 (44,65,0x646E,'finalize'),
 (45,66,0x646E,'finalize'),
 (46,67,0x646E,'finalize'),
 (47,68,0x646E,'finalize'),
 (48,69,0x646E,'finalize'),
 (49,70,0x646E,'finalize'),
 (50,71,0x646E,'finalize'),
 (51,72,0x646E,'finalize'),
 (52,73,0x646E,'finalize'),
 (53,75,0x646E,'finalize');
/*!40000 ALTER TABLE `university_semester` ENABLE KEYS */;


--
-- Definition of table `user_black_list`
--

DROP TABLE IF EXISTS `user_black_list`;
CREATE TABLE `user_black_list` (
  `employee_id_pk_fk` int(10) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `date_time` datetime NOT NULL,
  `mac` varchar(20) NOT NULL,
  PRIMARY KEY (`employee_id_pk_fk`) USING BTREE,
  CONSTRAINT `FK_black_list_employee` FOREIGN KEY (`employee_id_pk_fk`) REFERENCES `employee` (`employee_pk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_black_list`
--

/*!40000 ALTER TABLE `user_black_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_black_list` ENABLE KEYS */;


--
-- Definition of procedure `insert_dist_log`
--

DROP PROCEDURE IF EXISTS `insert_dist_log`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_dist_log`(IN presno int)
begin
  declare id,qty int;
  DECLARE finished INTEGER DEFAULT 0;
  DECLARE mycursor cursor for
  SELECT med_com_name_fk,med_qty FROM patient_med_info
  where std_prescription_fk=presno
  and state='delivered';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  open mycursor;
    get_city: LOOP
         FETCH mycursor INTO id,qty;
         IF finished=1 THEN
                LEAVE get_city;
         END IF;
         insert into distributed_med_log (med_id_fk, med_qty, prescription_fk)
                values(id,qty,presno);
        END LOOP get_city;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `transfer_stock`
--

DROP PROCEDURE IF EXISTS `transfer_stock`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `transfer_stock`(IN id int,IN trans_qty int)
begin
  declare central_qty int DEFAULT 0;
  declare temp int DEFAULT 0;
  declare stock_fk int DEFAULT 0;
  declare store_pk int DEFAULT 0;
  DECLARE finished INTEGER DEFAULT 0;
  DECLARE tcursor cursor for
  SELECT medicine_store_pk,stock_ledger_med_fk,med_qty FROM medicine_store_info
  where medicine_id_fk=id
  and store_type='centralstock'
  and status='valid'
  order by stock_ledger_med_fk;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  open tcursor;
    get_city: LOOP
         FETCH tcursor INTO store_pk,stock_fk,central_qty;
         IF finished=1 THEN
                LEAVE get_city;
         END IF;
         IF trans_qty=0 THEN
                LEAVE get_city;
         END IF;
         IF trans_qty >= central_qty THEN
            update  medicine_store_info
            set store_type='substock'
            where medicine_store_pk=store_pk;
            set trans_qty = trans_qty - central_qty;
         ELSE
            SET central_qty = central_qty - trans_qty;
            update  medicine_store_info
            set med_qty=central_qty
            where medicine_store_pk=store_pk;
            insert into medicine_store_info(stock_ledger_med_fk, medicine_id_fk, store_type, med_qty,status)
            values(stock_fk,id,'substock',trans_qty,'valid');
          END IF;
        END LOOP get_city;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `update_med_state`
--

DROP PROCEDURE IF EXISTS `update_med_state`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_med_state`(IN presno int)
begin
  declare dqty int;
  declare aqty int;
  declare id int;
  DECLARE finished INTEGER DEFAULT 0;
  DECLARE medcursor cursor for
  SELECT med_com_name_fk,med_qty FROM patient_med_info
  where std_prescription_fk=presno
  and state='notavailable';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  open medcursor;
  get_city: LOOP
    FETCH medcursor INTO id,dqty;
      IF finished=1 THEN
                LEAVE get_city;
         END IF;
       SELECT sum(med_qty) INTO aqty FROM medicine_store_info
        where medicine_id_fk=id
        and store_type='substock';
        if aqty >= dqty then
        update patient_med_info
        set state='undelivered'
        where med_com_name_fk=id;
        end if;
    END LOOP get_city;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `central_stock_info`
--

DROP TABLE IF EXISTS `central_stock_info`;
DROP VIEW IF EXISTS `central_stock_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `central_stock_info` AS select `medicine_gen_info`.`med_type` AS `med_type`,`medicine_gen_info`.`med_gen_name` AS `med_gen_name`,`medicine_com_info`.`med_com_name` AS `med_com_name`,`medicine_com_info`.`med_weight` AS `med_weight`,`medicine_store_info`.`med_qty` AS `med_qty`,`stock_ledger_med`.`pp_price` AS `pp_price`,`stock_ledger_comp`.`purchase_dt` AS `purchase_dt`,`stock_ledger_med`.`manufacturing_dt` AS `manufacturing_dt`,`stock_ledger_med`.`expiring_dt` AS `expiring_dt` from ((((`medicine_store_info` join `stock_ledger_med`) join `medicine_gen_info`) join `medicine_com_info`) join `stock_ledger_comp`) where ((`medicine_store_info`.`store_type` = 'centralstock') and (`medicine_store_info`.`status` = 'valid') and (`medicine_store_info`.`stock_ledger_med_fk` = `stock_ledger_med`.`stock_ledger_med_pk`) and (`stock_ledger_med`.`sl_no_fk` = `stock_ledger_comp`.`sl_no_pk`) and (`medicine_store_info`.`medicine_id_fk` = `medicine_com_info`.`med_com_name_pk`) and (`medicine_com_info`.`med_gen_name_fk` = `medicine_gen_info`.`med_gen_name_pk`)) order by `medicine_gen_info`.`med_type`;

--
-- Definition of view `stoc_transfer`
--

DROP TABLE IF EXISTS `stoc_transfer`;
DROP VIEW IF EXISTS `stoc_transfer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stoc_transfer` AS select `medicine_gen_info`.`med_type` AS `med_type`,`medicine_gen_info`.`med_gen_name` AS `med_gen_name`,`medicine_com_info`.`med_com_name` AS `med_com_name`,`medicine_com_info`.`med_weight` AS `med_weight`,`medicine_store_info`.`med_qty` AS `med_qty` from ((`medicine_store_info` join `medicine_gen_info`) join `medicine_com_info`) where ((`medicine_store_info`.`store_type` = 'centralstock') and (`medicine_store_info`.`status` = 'valid') and (`medicine_store_info`.`medicine_id_fk` = `medicine_com_info`.`med_com_name_pk`) and (`medicine_com_info`.`med_gen_name_fk` = `medicine_gen_info`.`med_gen_name_pk`)) order by `medicine_gen_info`.`med_type`;

--
-- Definition of view `stock_transfer`
--

DROP TABLE IF EXISTS `stock_transfer`;
DROP VIEW IF EXISTS `stock_transfer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_transfer` AS select `medicine_store_info`.`medicine_id_fk` AS `medicine_id_fk`,`medicine_gen_info`.`med_type` AS `med_type`,`medicine_gen_info`.`med_gen_name` AS `med_gen_name`,`medicine_com_info`.`med_com_name` AS `med_com_name`,`medicine_com_info`.`med_weight` AS `med_weight`,sum(`medicine_store_info`.`med_qty`) AS `med_qty` from ((`medicine_store_info` join `medicine_gen_info`) join `medicine_com_info`) where ((`medicine_store_info`.`store_type` = 'centralstock') and (`medicine_store_info`.`status` = 'valid') and (`medicine_store_info`.`medicine_id_fk` = `medicine_com_info`.`med_com_name_pk`) and (`medicine_com_info`.`med_gen_name_fk` = `medicine_gen_info`.`med_gen_name_pk`)) group by `medicine_store_info`.`medicine_id_fk` order by `medicine_gen_info`.`med_type`;

--
-- Definition of view `sub_stock_info`
--

DROP TABLE IF EXISTS `sub_stock_info`;
DROP VIEW IF EXISTS `sub_stock_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sub_stock_info` AS select `medicine_gen_info`.`med_type` AS `med_type`,`medicine_gen_info`.`med_gen_name` AS `med_gen_name`,`medicine_com_info`.`med_com_name` AS `med_com_name`,`medicine_com_info`.`med_weight` AS `med_weight`,`medicine_store_info`.`med_qty` AS `med_qty`,`stock_ledger_med`.`pp_price` AS `pp_price`,`stock_ledger_comp`.`purchase_dt` AS `purchase_dt`,`stock_ledger_med`.`manufacturing_dt` AS `manufacturing_dt`,`stock_ledger_med`.`expiring_dt` AS `expiring_dt` from ((((`medicine_store_info` join `stock_ledger_med`) join `medicine_gen_info`) join `medicine_com_info`) join `stock_ledger_comp`) where ((`medicine_store_info`.`store_type` = 'substock') and (`medicine_store_info`.`status` = 'valid') and (`medicine_store_info`.`stock_ledger_med_fk` = `stock_ledger_med`.`stock_ledger_med_pk`) and (`stock_ledger_med`.`sl_no_fk` = `stock_ledger_comp`.`sl_no_pk`) and (`medicine_store_info`.`medicine_id_fk` = `medicine_com_info`.`med_com_name_pk`) and (`medicine_com_info`.`med_gen_name_fk` = `medicine_gen_info`.`med_gen_name_pk`)) order by `medicine_gen_info`.`med_type`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
