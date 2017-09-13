-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `adminId` int(2) NOT NULL AUTO_INCREMENT,
  `employeeId` int(6) NOT NULL,
  `admin_typeId` int(2) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_admin_employee` (`employeeId`),
  KEY `fk_admin_adminType` (`admin_typeId`),
  CONSTRAINT `fk_admin_adminType` FOREIGN KEY (`admin_typeId`) REFERENCES `admin_type` (`admin_typeId`),
  CONSTRAINT `fk_admin_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2,1,1,'010101','tanders20110423');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_type`
--

DROP TABLE IF EXISTS `admin_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_type` (
  `admin_typeId` int(2) NOT NULL AUTO_INCREMENT,
  `adminTypeName` varchar(15) NOT NULL,
  PRIMARY KEY (`admin_typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_type`
--

LOCK TABLES `admin_type` WRITE;
/*!40000 ALTER TABLE `admin_type` DISABLE KEYS */;
INSERT INTO `admin_type` VALUES (1,'HR Admin');
/*!40000 ALTER TABLE `admin_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `attendanceId` int(11) NOT NULL AUTO_INCREMENT,
  `employeeId` int(11) NOT NULL,
  `date` date NOT NULL,
  `timeIn` time DEFAULT NULL,
  `timeOut` time DEFAULT NULL,
  `overtimeIn` time DEFAULT NULL,
  `overtimeOut` time DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`attendanceId`),
  KEY `fk_attendance_employee` (`employeeId`),
  CONSTRAINT `fk_attendance_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_holiday`
--

DROP TABLE IF EXISTS `attendance_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_holiday` (
  `attendance_holidayId` int(11) NOT NULL AUTO_INCREMENT,
  `attendanceId` int(11) NOT NULL,
  `holidayId` int(11) NOT NULL,
  PRIMARY KEY (`attendance_holidayId`),
  KEY `fk_attendanceHoliday_attendance` (`attendanceId`),
  KEY `fk_attendanceHoliday_holiday` (`holidayId`),
  CONSTRAINT `fk_attendanceHoliday_attendance` FOREIGN KEY (`attendanceId`) REFERENCES `attendance` (`attendanceId`),
  CONSTRAINT `fk_attendanceHoliday_holiday` FOREIGN KEY (`holidayId`) REFERENCES `holiday` (`holidayId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_holiday`
--

LOCK TABLES `attendance_holiday` WRITE;
/*!40000 ALTER TABLE `attendance_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `civil_status`
--

DROP TABLE IF EXISTS `civil_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `civil_status` (
  `civil_statusId` int(2) NOT NULL AUTO_INCREMENT,
  `civilStatusName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`civil_statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civil_status`
--

LOCK TABLES `civil_status` WRITE;
/*!40000 ALTER TABLE `civil_status` DISABLE KEYS */;
INSERT INTO `civil_status` VALUES (1,'Single');
/*!40000 ALTER TABLE `civil_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deduction`
--

DROP TABLE IF EXISTS `deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deduction` (
  `deductionId` int(11) NOT NULL AUTO_INCREMENT,
  `deductionName` varchar(20) NOT NULL,
  PRIMARY KEY (`deductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deduction`
--

LOCK TABLES `deduction` WRITE;
/*!40000 ALTER TABLE `deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `departmentId` int(2) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Human Resources'),(2,'Developer'),(3,'Jinyoung');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `documentId` int(10) NOT NULL AUTO_INCREMENT,
  `employeeId` int(6) NOT NULL,
  `document_typeId` int(2) NOT NULL,
  `documentName` varchar(30) NOT NULL,
  `file` blob NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`documentId`),
  KEY `fk_document_documentType` (`document_typeId`),
  KEY `fk_document_employee` (`employeeId`),
  CONSTRAINT `fk_document_documentType` FOREIGN KEY (`document_typeId`) REFERENCES `document_type` (`document_typeId`),
  CONSTRAINT `fk_document_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_type` (
  `document_typeId` int(2) NOT NULL AUTO_INCREMENT,
  `documentTypeName` varchar(30) NOT NULL,
  PRIMARY KEY (`document_typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeId` int(6) NOT NULL AUTO_INCREMENT,
  `departmentId` int(2) NOT NULL,
  `shiftId` int(2) NOT NULL,
  `positionId` int(2) NOT NULL,
  `civil_statusId` int(2) NOT NULL,
  `employeeNum` int(6) NOT NULL,
  `profilepic` longblob,
  `firstName` varchar(100) NOT NULL,
  `middleName` varchar(50) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `numOfDependents` int(2) NOT NULL,
  `bankAccountNum` int(20) NOT NULL,
  `contactNum` int(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `basicSalary` int(10) NOT NULL,
  `birthDate` datetime NOT NULL,
  `entryDate` datetime NOT NULL,
  `exitDate` datetime DEFAULT NULL,
  `pagibigId` int(12) DEFAULT NULL,
  `sssId` int(10) DEFAULT NULL,
  `philhealthId` int(12) DEFAULT NULL,
  `tinNum` int(12) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `isRegular` tinyint(1) NOT NULL,
  `isEmployed` tinyint(1) NOT NULL,
  `tax_codeId` int(11) NOT NULL,
  PRIMARY KEY (`employeeId`),
  UNIQUE KEY `employeeNum` (`employeeNum`),
  KEY `fk_employee_department` (`departmentId`),
  KEY `fk_employee_shift` (`shiftId`),
  KEY `fk_employee_position` (`positionId`),
  KEY `fk_employee_civilStatus` (`civil_statusId`),
  KEY `fk_tax_codeId` (`tax_codeId`),
  CONSTRAINT `fk_employee_civilStatus` FOREIGN KEY (`civil_statusId`) REFERENCES `civil_status` (`civil_statusId`),
  CONSTRAINT `fk_employee_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`),
  CONSTRAINT `fk_employee_position` FOREIGN KEY (`positionId`) REFERENCES `position` (`positionId`),
  CONSTRAINT `fk_employee_shift` FOREIGN KEY (`shiftId`) REFERENCES `shift` (`shiftId`),
  CONSTRAINT `fk_tax_codeId` FOREIGN KEY (`tax_codeId`) REFERENCES `tax_code` (`tax_codeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,1,1,1,10101,NULL,'Jin','Jung','Tanders',0,9133673,2147483647,'jintanders@gmail.com',80000,'1991-11-18 00:00:00','2011-04-23 00:00:00',NULL,1,1,1,1,'tanders20110423',1,1,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_loan`
--

DROP TABLE IF EXISTS `employee_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_loan` (
  `employee_loanId` int(11) NOT NULL AUTO_INCREMENT,
  `employeeId` int(11) NOT NULL,
  `loanId` int(11) NOT NULL,
  `loanStart` datetime NOT NULL,
  `loanEnd` datetime DEFAULT NULL,
  `loanAmount` float(10,2) NOT NULL,
  `amortization` float(10,2) NOT NULL,
  `loanBalance` float(10,2) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `totalPayments` int(11) NOT NULL,
  `percentage` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`employee_loanId`),
  KEY `fk_employeeLoan_employee` (`employeeId`),
  KEY `fk_employeeLoan_loan` (`loanId`),
  CONSTRAINT `fk_employeeLoan_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  CONSTRAINT `fk_employeeLoan_loan` FOREIGN KEY (`loanId`) REFERENCES `loan` (`loanId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_loan`
--

LOCK TABLES `employee_loan` WRITE;
/*!40000 ALTER TABLE `employee_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_request`
--

DROP TABLE IF EXISTS `employee_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_request` (
  `employee_requestId` int(8) NOT NULL AUTO_INCREMENT,
  `employeeId` int(6) NOT NULL,
  `requestId` int(8) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `startTime` varchar(15) DEFAULT NULL,
  `endTime` varchar(15) DEFAULT NULL,
  `isApproved` tinyint(1) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `approvedBy` int(2) DEFAULT NULL,
  `dateApproved` datetime DEFAULT NULL,
  PRIMARY KEY (`employee_requestId`),
  KEY `fk_employeeRequest_employee` (`employeeId`),
  KEY `fk_employeeRequest_request` (`requestId`),
  CONSTRAINT `fk_employeeRequest_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  CONSTRAINT `fk_employeeRequest_request` FOREIGN KEY (`requestId`) REFERENCES `request` (`requestId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_request`
--

LOCK TABLES `employee_request` WRITE;
/*!40000 ALTER TABLE `employee_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `holidayId` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_typeId` int(11) DEFAULT NULL,
  `holidayName` varchar(15) DEFAULT NULL,
  `startTime` varchar(15) DEFAULT NULL,
  `endTime` varchar(15) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`holidayId`),
  KEY `fk_holiday_holidayType` (`holiday_typeId`),
  CONSTRAINT `fk_holiday_holidayType` FOREIGN KEY (`holiday_typeId`) REFERENCES `holiday_type` (`holiday_typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
INSERT INTO `holiday` VALUES (1,2,'Typhoon!!','12 : 49 AM','12 : 49 AM','2017-01-19');
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday_type`
--

DROP TABLE IF EXISTS `holiday_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday_type` (
  `holiday_typeId` int(11) NOT NULL AUTO_INCREMENT,
  `rate` float(6,2) DEFAULT NULL,
  `holidayTypeName` varchar(15) NOT NULL,
  PRIMARY KEY (`holiday_typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday_type`
--

LOCK TABLES `holiday_type` WRITE;
/*!40000 ALTER TABLE `holiday_type` DISABLE KEYS */;
INSERT INTO `holiday_type` VALUES (1,0.20,'Regular'),(2,0.20,'Typhoon'),(3,0.10,'Special'),(4,0.20,'Test'),(5,0.30,'Test2');
/*!40000 ALTER TABLE `holiday_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income` (
  `incomeId` int(11) NOT NULL AUTO_INCREMENT,
  `incomeName` varchar(20) NOT NULL,
  `isTaxable` tinyint(1) NOT NULL,
  PRIMARY KEY (`incomeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave` (
  `leaveId` int(8) NOT NULL AUTO_INCREMENT,
  `employeeId` int(6) NOT NULL,
  `leave_typeId` int(8) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `consumableDays` int(3) NOT NULL,
  PRIMARY KEY (`leaveId`),
  KEY `fk_leave_leaveType` (`leave_typeId`),
  KEY `fk_leave_employee` (`employeeId`),
  CONSTRAINT `fk_leave_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  CONSTRAINT `fk_leave_leaveType` FOREIGN KEY (`leave_typeId`) REFERENCES `leave_type` (`leave_typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave`
--

LOCK TABLES `leave` WRITE;
/*!40000 ALTER TABLE `leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_type` (
  `leave_typeId` int(8) NOT NULL AUTO_INCREMENT,
  `leaveTypeName` varchar(25) NOT NULL,
  `rateToCash` float(6,2) NOT NULL,
  `maxCredit` int(3) NOT NULL,
  `replenishmentDate` datetime NOT NULL,
  PRIMARY KEY (`leave_typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` VALUES (1,'Sick',0.05,10,'2017-01-01 00:00:00'),(2,'Vacation',0.05,10,'2017-01-05 00:00:00'),(3,'test',0.01,1,'2018-01-01 00:00:00'),(4,'Test!',0.10,5,'2017-01-01 00:00:00');
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `loanId` int(10) NOT NULL AUTO_INCREMENT,
  `loanName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`loanId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notificationId` int(6) NOT NULL AUTO_INCREMENT,
  `userId` int(6) NOT NULL,
  `message` varchar(255) NOT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`notificationId`),
  KEY `fk_notification_employee` (`userId`),
  CONSTRAINT `fk_notification_employee` FOREIGN KEY (`userId`) REFERENCES `employee` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagibig_contribution`
--

DROP TABLE IF EXISTS `pagibig_contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagibig_contribution` (
  `pagibig_contributionId` int(11) NOT NULL AUTO_INCREMENT,
  `deductionId` int(11) NOT NULL,
  `lowerBoundary` float(6,2) NOT NULL,
  `upperBoundary` float(6,2) NOT NULL,
  `employeeContribution` float(2,2) NOT NULL,
  `employerContribution` float(2,2) NOT NULL,
  PRIMARY KEY (`pagibig_contributionId`),
  KEY `fk_pagibigContribution_deduction` (`deductionId`),
  CONSTRAINT `fk_pagibigContribution_deduction` FOREIGN KEY (`deductionId`) REFERENCES `deduction` (`deductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagibig_contribution`
--

LOCK TABLES `pagibig_contribution` WRITE;
/*!40000 ALTER TABLE `pagibig_contribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagibig_contribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll` (
  `payrollId` int(11) NOT NULL AUTO_INCREMENT,
  `payrollName` varchar(20) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `dateCreated` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `isFinalized` tinyint(1) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`payrollId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_deduction`
--

DROP TABLE IF EXISTS `payroll_deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_deduction` (
  `payroll_deductionId` int(11) NOT NULL AUTO_INCREMENT,
  `payrollId` int(11) NOT NULL,
  `templateId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `deductionId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `amount` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`payroll_deductionId`),
  KEY `fk_payrollDeduction_payroll` (`payrollId`),
  KEY `fk_payrollDeduction_template` (`templateId`),
  KEY `fk_payrollDeduction_employee` (`employeeId`),
  KEY `fk_payrollDeduction_deduction` (`deductionId`),
  CONSTRAINT `fk_payrollDeduction_deduction` FOREIGN KEY (`deductionId`) REFERENCES `deduction` (`deductionId`),
  CONSTRAINT `fk_payrollDeduction_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  CONSTRAINT `fk_payrollDeduction_payroll` FOREIGN KEY (`payrollId`) REFERENCES `payroll` (`payrollId`),
  CONSTRAINT `fk_payrollDeduction_template` FOREIGN KEY (`templateId`) REFERENCES `template` (`templateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_deduction`
--

LOCK TABLES `payroll_deduction` WRITE;
/*!40000 ALTER TABLE `payroll_deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_income`
--

DROP TABLE IF EXISTS `payroll_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_income` (
  `payroll_incomeId` int(11) NOT NULL AUTO_INCREMENT,
  `payrollId` int(11) NOT NULL,
  `templateId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `incomeId` int(11) NOT NULL,
  `amount` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`payroll_incomeId`),
  KEY `fk_payrollIncome_payroll` (`payrollId`),
  KEY `fk_payrollIncome_template` (`templateId`),
  KEY `fk_payrollIncome_employee` (`employeeId`),
  KEY `fk_payrollIncome_income` (`incomeId`),
  CONSTRAINT `fk_payrollIncome_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  CONSTRAINT `fk_payrollIncome_income` FOREIGN KEY (`incomeId`) REFERENCES `income` (`incomeId`),
  CONSTRAINT `fk_payrollIncome_payroll` FOREIGN KEY (`payrollId`) REFERENCES `payroll` (`payrollId`),
  CONSTRAINT `fk_payrollIncome_template` FOREIGN KEY (`templateId`) REFERENCES `template` (`templateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_income`
--

LOCK TABLES `payroll_income` WRITE;
/*!40000 ALTER TABLE `payroll_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_loan`
--

DROP TABLE IF EXISTS `payroll_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_loan` (
  `payroll_loanId` int(11) NOT NULL AUTO_INCREMENT,
  `payrollId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `loanId` int(11) DEFAULT NULL,
  `employee_loanId` int(11) NOT NULL,
  `amount` float(10,2) NOT NULL,
  PRIMARY KEY (`payroll_loanId`),
  KEY `fk_payrollLoan_payroll` (`payrollId`),
  KEY `fk_payrollLoan_employee` (`employeeId`),
  KEY `fk_payrollLoan_loan` (`loanId`),
  KEY `fk_payrollLoan_employeeLoan` (`employee_loanId`),
  CONSTRAINT `fk_payrollLoan_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  CONSTRAINT `fk_payrollLoan_employeeLoan` FOREIGN KEY (`employee_loanId`) REFERENCES `employee_loan` (`employee_loanId`),
  CONSTRAINT `fk_payrollLoan_loan` FOREIGN KEY (`loanId`) REFERENCES `loan` (`loanId`),
  CONSTRAINT `fk_payrollLoan_payroll` FOREIGN KEY (`payrollId`) REFERENCES `payroll` (`payrollId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_loan`
--

LOCK TABLES `payroll_loan` WRITE;
/*!40000 ALTER TABLE `payroll_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `philhealth_contribution`
--

DROP TABLE IF EXISTS `philhealth_contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `philhealth_contribution` (
  `philhealth_contributionId` int(11) NOT NULL AUTO_INCREMENT,
  `deductionId` int(11) NOT NULL,
  `lowerBoundary` float(6,2) NOT NULL,
  `upperBoundary` float(6,2) NOT NULL,
  `employeeContribution` float(6,2) NOT NULL,
  `employerContribution` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`philhealth_contributionId`),
  KEY `fk_philhealthContribution_deduction` (`deductionId`),
  CONSTRAINT `fk_philhealthContribution_deduction` FOREIGN KEY (`deductionId`) REFERENCES `deduction` (`deductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `philhealth_contribution`
--

LOCK TABLES `philhealth_contribution` WRITE;
/*!40000 ALTER TABLE `philhealth_contribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `philhealth_contribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `positionId` int(2) NOT NULL AUTO_INCREMENT,
  `positionName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`positionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'HR Head');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_history`
--

DROP TABLE IF EXISTS `position_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_history` (
  `position_historyId` int(11) NOT NULL AUTO_INCREMENT,
  `positionId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `positionStartDate` date NOT NULL,
  `positionEndDate` date DEFAULT NULL,
  PRIMARY KEY (`position_historyId`),
  KEY `fk_positionHistory_position` (`positionId`),
  KEY `fk_positionHistory_employee` (`employeeId`),
  CONSTRAINT `fk_positionHistory_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  CONSTRAINT `fk_positionHistory_position` FOREIGN KEY (`positionId`) REFERENCES `position` (`positionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_history`
--

LOCK TABLES `position_history` WRITE;
/*!40000 ALTER TABLE `position_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `requestId` int(8) NOT NULL AUTO_INCREMENT,
  `requestName` varchar(20) NOT NULL,
  PRIMARY KEY (`requestId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_type`
--

DROP TABLE IF EXISTS `request_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_type` (
  `request_typeId` int(3) NOT NULL AUTO_INCREMENT,
  `requestId` int(8) NOT NULL,
  `requestTypeName` varchar(15) NOT NULL,
  PRIMARY KEY (`request_typeId`),
  KEY `fk_requestType_request` (`requestId`),
  CONSTRAINT `fk_requestType_request` FOREIGN KEY (`requestId`) REFERENCES `request` (`requestId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_type`
--

LOCK TABLES `request_type` WRITE;
/*!40000 ALTER TABLE `request_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift` (
  `shiftId` int(2) NOT NULL AUTO_INCREMENT,
  `shiftName` varchar(25) DEFAULT NULL,
  `shiftDays` varchar(50) DEFAULT NULL,
  `shiftTimeStart` varchar(15) DEFAULT NULL,
  `shiftTimeEnd` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`shiftId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'Morning','Monday to Friday','09:00:00','05:00:00');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sss_contribution`
--

DROP TABLE IF EXISTS `sss_contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sss_contribution` (
  `sss_contributionId` int(11) NOT NULL AUTO_INCREMENT,
  `deductionId` int(11) NOT NULL,
  `lowBoundary` float(6,2) NOT NULL,
  `upperBoundary` float(6,2) NOT NULL,
  `employeeContribution` float(6,2) NOT NULL,
  `employerContribution` float(6,2) NOT NULL,
  PRIMARY KEY (`sss_contributionId`),
  KEY `fk_sssContribution_deduction` (`deductionId`),
  CONSTRAINT `fk_sssContribution_deduction` FOREIGN KEY (`deductionId`) REFERENCES `deduction` (`deductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sss_contribution`
--

LOCK TABLES `sss_contribution` WRITE;
/*!40000 ALTER TABLE `sss_contribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `sss_contribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_code`
--

DROP TABLE IF EXISTS `tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_code` (
  `tax_codeId` int(11) NOT NULL AUTO_INCREMENT,
  `taxCodeName` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`tax_codeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_code`
--

LOCK TABLES `tax_code` WRITE;
/*!40000 ALTER TABLE `tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `templateId` int(11) NOT NULL AUTO_INCREMENT,
  `payrollId` int(11) DEFAULT NULL,
  `templateName` varchar(20) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`templateId`),
  KEY `fk_template_payroll` (`payrollId`),
  CONSTRAINT `fk_template_payroll` FOREIGN KEY (`payrollId`) REFERENCES `payroll` (`payrollId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_deduction`
--

DROP TABLE IF EXISTS `template_deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_deduction` (
  `template_deductionId` int(11) NOT NULL AUTO_INCREMENT,
  `templateId` int(11) NOT NULL,
  `deductionId` int(11) NOT NULL,
  `amount` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`template_deductionId`),
  KEY `fk_templateDeduction_template` (`templateId`),
  KEY `fk_templateDeduction_deduction` (`deductionId`),
  CONSTRAINT `fk_templateDeduction_deduction` FOREIGN KEY (`deductionId`) REFERENCES `deduction` (`deductionId`),
  CONSTRAINT `fk_templateDeduction_template` FOREIGN KEY (`templateId`) REFERENCES `template` (`templateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_deduction`
--

LOCK TABLES `template_deduction` WRITE;
/*!40000 ALTER TABLE `template_deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_income`
--

DROP TABLE IF EXISTS `template_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_income` (
  `template_incomeId` int(11) NOT NULL AUTO_INCREMENT,
  `templateId` int(11) NOT NULL,
  `incomeId` int(11) NOT NULL,
  `amount` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`template_incomeId`),
  KEY `fk_templateIncome_template` (`templateId`),
  KEY `fk_templateIncome_income` (`incomeId`),
  CONSTRAINT `fk_templateIncome_income` FOREIGN KEY (`incomeId`) REFERENCES `income` (`incomeId`),
  CONSTRAINT `fk_templateIncome_template` FOREIGN KEY (`templateId`) REFERENCES `template` (`templateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_income`
--

LOCK TABLES `template_income` WRITE;
/*!40000 ALTER TABLE `template_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_request`
--

DROP TABLE IF EXISTS `update_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_request` (
  `update_requestId` int(10) NOT NULL AUTO_INCREMENT,
  `employeeId` int(6) NOT NULL,
  `update_request_typeId` int(3) NOT NULL,
  `newData` varchar(225) NOT NULL,
  `isApproved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`update_requestId`),
  KEY `fk_updateRequest_employee` (`employeeId`),
  KEY `fk_updateRequest_updateRequestType` (`update_request_typeId`),
  CONSTRAINT `fk_updateRequest_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  CONSTRAINT `fk_updateRequest_updateRequestType` FOREIGN KEY (`update_request_typeId`) REFERENCES `update_request_type` (`update_request_typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_request`
--

LOCK TABLES `update_request` WRITE;
/*!40000 ALTER TABLE `update_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_request_document`
--

DROP TABLE IF EXISTS `update_request_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_request_document` (
  `update_request_documentId` int(3) NOT NULL AUTO_INCREMENT,
  `documentId` int(6) NOT NULL,
  `update_requestId` int(6) NOT NULL,
  PRIMARY KEY (`update_request_documentId`),
  KEY `fk_updateRequestDocument_document` (`documentId`),
  KEY `fk_updateRequestDocument_updateRequest` (`update_requestId`),
  CONSTRAINT `fk_updateRequestDocument_document` FOREIGN KEY (`documentId`) REFERENCES `document` (`documentId`),
  CONSTRAINT `fk_updateRequestDocument_updateRequest` FOREIGN KEY (`update_requestId`) REFERENCES `update_request` (`update_requestId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_request_document`
--

LOCK TABLES `update_request_document` WRITE;
/*!40000 ALTER TABLE `update_request_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_request_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_request_type`
--

DROP TABLE IF EXISTS `update_request_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_request_type` (
  `update_request_typeId` int(3) NOT NULL AUTO_INCREMENT,
  `updateRequestName` varchar(15) NOT NULL,
  PRIMARY KEY (`update_request_typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_request_type`
--

LOCK TABLES `update_request_type` WRITE;
/*!40000 ALTER TABLE `update_request_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_request_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-11  0:56:12
