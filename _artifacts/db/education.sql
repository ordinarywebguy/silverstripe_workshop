-- MySQL dump 10.11
--
-- Host: localhost    Database: education
-- ------------------------------------------------------
-- Server version	5.0.77

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
-- Current Database: `education`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `education` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `education`;

--
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Article` (
  `ID` int(11) NOT NULL auto_increment,
  `Intro` mediumtext,
  `ImageID` int(11) NOT NULL default '0',
  `Tag` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES (18,NULL,5,NULL),(37,'<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>',12,NULL),(42,'<p>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..</p>',0,NULL);
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Article_Live`
--

DROP TABLE IF EXISTS `Article_Live`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Article_Live` (
  `ID` int(11) NOT NULL auto_increment,
  `Intro` mediumtext,
  `ImageID` int(11) NOT NULL default '0',
  `Tag` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Article_Live`
--

LOCK TABLES `Article_Live` WRITE;
/*!40000 ALTER TABLE `Article_Live` DISABLE KEYS */;
INSERT INTO `Article_Live` VALUES (18,NULL,0,NULL),(37,'<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>',12,NULL),(42,'<p>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..</p>',0,NULL);
/*!40000 ALTER TABLE `Article_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Article_Tags`
--

DROP TABLE IF EXISTS `Article_Tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Article_Tags` (
  `ID` int(11) NOT NULL auto_increment,
  `ArticleID` int(11) NOT NULL default '0',
  `TagID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ArticleID` (`ArticleID`),
  KEY `TagID` (`TagID`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Article_Tags`
--

LOCK TABLES `Article_Tags` WRITE;
/*!40000 ALTER TABLE `Article_Tags` DISABLE KEYS */;
INSERT INTO `Article_Tags` VALUES (151,37,16),(149,37,14),(150,37,15),(165,42,16),(152,37,9),(166,42,9);
/*!40000 ALTER TABLE `Article_Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Article_versions`
--

DROP TABLE IF EXISTS `Article_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Article_versions` (
  `ID` int(11) NOT NULL auto_increment,
  `RecordID` int(11) NOT NULL default '0',
  `Version` int(11) NOT NULL default '0',
  `Intro` mediumtext,
  `ImageID` int(11) NOT NULL default '0',
  `Tag` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Article_versions`
--

LOCK TABLES `Article_versions` WRITE;
/*!40000 ALTER TABLE `Article_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Article_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Email_BounceRecord`
--

DROP TABLE IF EXISTS `Email_BounceRecord`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Email_BounceRecord` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('Email_BounceRecord') default 'Email_BounceRecord',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `BounceEmail` varchar(50) default NULL,
  `BounceTime` datetime default NULL,
  `BounceMessage` varchar(50) default NULL,
  `MemberID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Email_BounceRecord`
--

LOCK TABLES `Email_BounceRecord` WRITE;
/*!40000 ALTER TABLE `Email_BounceRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `Email_BounceRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ErrorPage`
--

DROP TABLE IF EXISTS `ErrorPage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL auto_increment,
  `ErrorCode` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ErrorPage`
--

LOCK TABLES `ErrorPage` WRITE;
/*!40000 ALTER TABLE `ErrorPage` DISABLE KEYS */;
INSERT INTO `ErrorPage` VALUES (4,404),(5,500),(44,404),(21,404),(22,404),(23,404),(24,404),(25,404),(26,404),(27,404),(28,404),(29,404),(30,404),(31,404),(32,404),(34,404),(35,404),(36,404);
/*!40000 ALTER TABLE `ErrorPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ErrorPage_Live`
--

DROP TABLE IF EXISTS `ErrorPage_Live`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL auto_increment,
  `ErrorCode` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ErrorPage_Live`
--

LOCK TABLES `ErrorPage_Live` WRITE;
/*!40000 ALTER TABLE `ErrorPage_Live` DISABLE KEYS */;
INSERT INTO `ErrorPage_Live` VALUES (4,404),(5,500),(44,404),(21,404),(22,404),(23,404),(24,404),(25,404),(26,404),(27,404),(28,404),(29,404),(30,404),(31,404),(32,404),(34,404),(35,404),(36,404);
/*!40000 ALTER TABLE `ErrorPage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ErrorPage_versions`
--

DROP TABLE IF EXISTS `ErrorPage_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ErrorPage_versions` (
  `ID` int(11) NOT NULL auto_increment,
  `RecordID` int(11) NOT NULL default '0',
  `Version` int(11) NOT NULL default '0',
  `ErrorCode` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ErrorPage_versions`
--

LOCK TABLES `ErrorPage_versions` WRITE;
/*!40000 ALTER TABLE `ErrorPage_versions` DISABLE KEYS */;
INSERT INTO `ErrorPage_versions` VALUES (29,44,1,404);
/*!40000 ALTER TABLE `ErrorPage_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeaturedProductWidget`
--

DROP TABLE IF EXISTS `FeaturedProductWidget`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `FeaturedProductWidget` (
  `ID` int(11) NOT NULL auto_increment,
  `Text` mediumtext,
  `ProductID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `FeaturedProductWidget`
--

LOCK TABLES `FeaturedProductWidget` WRITE;
/*!40000 ALTER TABLE `FeaturedProductWidget` DISABLE KEYS */;
INSERT INTO `FeaturedProductWidget` VALUES (5,'Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus. Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec odio iaculis vestibulum. In eget mi augue, eu blandit tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan. Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus, faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit, tempor eget tempor sollicitudin, tincidunt ut dolor.',1);
/*!40000 ALTER TABLE `FeaturedProductWidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `File` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('File','FLV','MP3','Image','Folder','Image_Cached') default 'File',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Name` varchar(255) default NULL,
  `Title` varchar(255) default NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `Sort` int(11) NOT NULL default '0',
  `ParentID` int(11) NOT NULL default '0',
  `OwnerID` int(11) NOT NULL default '0',
  `SortOrder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `File`
--

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
INSERT INTO `File` VALUES (1,'Folder','2011-04-05 17:11:01','2011-04-05 17:11:01','Uploads','Uploads','assets/Uploads/',NULL,0,0,0,0),(2,'Image','2011-04-05 17:11:01','2011-04-05 17:11:01','SilverStripeLogo.png','SilverStripeLogo.png','assets/Uploads/SilverStripeLogo.png',NULL,0,1,0,0),(3,'File','2011-04-05 17:11:01','2011-04-05 17:11:01','error-404.html','error-404.html','assets/error-404.html',NULL,0,0,0,0),(4,'File','2011-04-05 17:11:01','2011-04-05 17:11:01','error-500.html','error-500.html','assets/error-500.html',NULL,0,0,0,0),(5,'Image','2011-04-06 15:25:57','2011-04-06 15:25:57','toplisticon200pourcentpoker6.png','toplisticon200pourcentpoker6','assets/Uploads/toplisticon200pourcentpoker6.png',NULL,0,1,1,0),(13,'Image','2011-04-06 22:54:58','2011-04-06 22:54:58','Jellyfish.jpg','Jellyfish','assets/Uploads/Jellyfish.jpg',NULL,0,1,1,0),(12,'Image','2011-04-06 21:38:49','2011-04-06 21:38:49','Penguins.jpg','Penguins','assets/Uploads/Penguins.jpg',NULL,0,1,1,0),(11,'Image','2011-04-06 21:19:11','2011-04-06 21:19:11','toplisticon200pourcentpoker2.png','toplisticon200pourcentpoker2','assets/Uploads/toplisticon200pourcentpoker2.png',NULL,0,1,1,0),(14,'Image','2011-04-07 00:09:39','2011-04-07 00:09:39','Penguins2.jpg','Penguins2','assets/Uploads/Penguins2.jpg',NULL,0,1,1,0),(15,'Image','2011-04-07 17:28:17','2011-04-07 17:28:17','Koala.jpg','Koala','assets/Uploads/Koala.jpg',NULL,0,1,1,0);
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Group` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('Group') default 'Group',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Title` varchar(50) default NULL,
  `Description` mediumtext,
  `Code` varchar(50) default NULL,
  `Locked` tinyint(1) unsigned NOT NULL default '0',
  `Sort` int(11) NOT NULL default '0',
  `IPRestrictions` mediumtext,
  `HtmlEditorConfig` varchar(50) default NULL,
  `ParentID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES (1,'Group','2011-04-05 17:11:01','2011-04-05 17:11:01','Content Authors',NULL,'content-authors',0,1,NULL,NULL,0),(2,'Group','2011-04-05 17:11:01','2011-04-05 17:11:01','Administrators',NULL,'administrators',0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_Members`
--

DROP TABLE IF EXISTS `Group_Members`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL auto_increment,
  `GroupID` int(11) NOT NULL default '0',
  `MemberID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Group_Members`
--

LOCK TABLES `Group_Members` WRITE;
/*!40000 ALTER TABLE `Group_Members` DISABLE KEYS */;
INSERT INTO `Group_Members` VALUES (1,2,1);
/*!40000 ALTER TABLE `Group_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_Roles`
--

DROP TABLE IF EXISTS `Group_Roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL auto_increment,
  `GroupID` int(11) NOT NULL default '0',
  `PermissionRoleID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Group_Roles`
--

LOCK TABLES `Group_Roles` WRITE;
/*!40000 ALTER TABLE `Group_Roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Group_Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IndexPage`
--

DROP TABLE IF EXISTS `IndexPage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `IndexPage` (
  `ID` int(11) NOT NULL auto_increment,
  `WidgetsID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `WidgetsID` (`WidgetsID`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `IndexPage`
--

LOCK TABLES `IndexPage` WRITE;
/*!40000 ALTER TABLE `IndexPage` DISABLE KEYS */;
INSERT INTO `IndexPage` VALUES (38,4);
/*!40000 ALTER TABLE `IndexPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IndexPage_Live`
--

DROP TABLE IF EXISTS `IndexPage_Live`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `IndexPage_Live` (
  `ID` int(11) NOT NULL auto_increment,
  `WidgetsID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `WidgetsID` (`WidgetsID`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `IndexPage_Live`
--

LOCK TABLES `IndexPage_Live` WRITE;
/*!40000 ALTER TABLE `IndexPage_Live` DISABLE KEYS */;
INSERT INTO `IndexPage_Live` VALUES (39,0),(38,4);
/*!40000 ALTER TABLE `IndexPage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IndexPage_versions`
--

DROP TABLE IF EXISTS `IndexPage_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `IndexPage_versions` (
  `ID` int(11) NOT NULL auto_increment,
  `RecordID` int(11) NOT NULL default '0',
  `Version` int(11) NOT NULL default '0',
  `WidgetsID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `WidgetsID` (`WidgetsID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `IndexPage_versions`
--

LOCK TABLES `IndexPage_versions` WRITE;
/*!40000 ALTER TABLE `IndexPage_versions` DISABLE KEYS */;
INSERT INTO `IndexPage_versions` VALUES (3,38,10,4);
/*!40000 ALTER TABLE `IndexPage_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LatestArticlesWidget`
--

DROP TABLE IF EXISTS `LatestArticlesWidget`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `LatestArticlesWidget` (
  `ID` int(11) NOT NULL auto_increment,
  `NumberToShow` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `LatestArticlesWidget`
--

LOCK TABLES `LatestArticlesWidget` WRITE;
/*!40000 ALTER TABLE `LatestArticlesWidget` DISABLE KEYS */;
INSERT INTO `LatestArticlesWidget` VALUES (1,5),(2,5),(3,5),(4,5);
/*!40000 ALTER TABLE `LatestArticlesWidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginAttempt`
--

DROP TABLE IF EXISTS `LoginAttempt`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('LoginAttempt') default 'LoginAttempt',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Email` varchar(255) default NULL,
  `Status` enum('Success','Failure') default 'Success',
  `IP` varchar(255) default NULL,
  `MemberID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `LoginAttempt`
--

LOCK TABLES `LoginAttempt` WRITE;
/*!40000 ALTER TABLE `LoginAttempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoginAttempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Member` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('Member') default 'Member',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `FirstName` varchar(50) default NULL,
  `Surname` varchar(50) default NULL,
  `Email` varchar(50) default NULL,
  `Password` varchar(160) default NULL,
  `RememberLoginToken` varchar(50) default NULL,
  `NumVisit` int(11) NOT NULL default '0',
  `LastVisited` datetime default NULL,
  `Bounced` tinyint(1) unsigned NOT NULL default '0',
  `AutoLoginHash` varchar(50) default NULL,
  `AutoLoginExpired` datetime default NULL,
  `PasswordEncryption` varchar(50) default NULL,
  `Salt` varchar(50) default NULL,
  `PasswordExpiry` date default NULL,
  `LockedOutUntil` datetime default NULL,
  `Locale` varchar(6) default NULL,
  `FailedLoginCount` int(11) NOT NULL default '0',
  `DateFormat` varchar(30) default NULL,
  `TimeFormat` varchar(30) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES (1,'Member','2011-04-05 17:11:01','2011-05-18 19:00:05','Default Admin',NULL,'admin','681d52a462fd2347b0c11e79a551230ce9e22522',NULL,5,'2011-05-18 19:02:08',0,NULL,NULL,'sha1_v2.4','f7e61e46372bc6bcd89ce0d6d325cce2cfb0e075',NULL,NULL,'en_US',0,NULL,NULL);
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberPassword`
--

DROP TABLE IF EXISTS `MemberPassword`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('MemberPassword') default 'MemberPassword',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Password` varchar(50) default NULL,
  `Salt` varchar(50) default NULL,
  `PasswordEncryption` varchar(50) default NULL,
  `MemberID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `MemberPassword`
--

LOCK TABLES `MemberPassword` WRITE;
/*!40000 ALTER TABLE `MemberPassword` DISABLE KEYS */;
INSERT INTO `MemberPassword` VALUES (1,'MemberPassword','2011-04-05 17:11:01','2011-04-05 17:11:01','681d52a462fd2347b0c11e79a551230ce9e22522','f7e61e46372bc6bcd89ce0d6d325cce2cfb0e075','sha1_v2.4',1);
/*!40000 ALTER TABLE `MemberPassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Page`
--

DROP TABLE IF EXISTS `Page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Page` (
  `ID` int(11) NOT NULL auto_increment,
  `RatingWidgetID` int(11) NOT NULL default '0',
  `PageRatingWidgetID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `RatingWidgetID` (`RatingWidgetID`),
  KEY `PageRatingWidgetID` (`PageRatingWidgetID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Page`
--

LOCK TABLES `Page` WRITE;
/*!40000 ALTER TABLE `Page` DISABLE KEYS */;
INSERT INTO `Page` VALUES (12,0,5),(3,0,6),(44,0,0),(2,0,7),(38,0,8);
/*!40000 ALTER TABLE `Page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PageComment`
--

DROP TABLE IF EXISTS `PageComment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `PageComment` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('PageComment') default 'PageComment',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Name` varchar(200) default NULL,
  `Comment` mediumtext,
  `IsSpam` tinyint(1) unsigned NOT NULL default '0',
  `NeedsModeration` tinyint(1) unsigned NOT NULL default '0',
  `CommenterURL` varchar(255) default NULL,
  `SessionID` varchar(255) default NULL,
  `ParentID` int(11) NOT NULL default '0',
  `AuthorID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `PageComment`
--

LOCK TABLES `PageComment` WRITE;
/*!40000 ALTER TABLE `PageComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `PageComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PageRating`
--

DROP TABLE IF EXISTS `PageRating`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `PageRating` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('PageRating') default 'PageRating',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Rate` int(11) NOT NULL default '0',
  `IP` varchar(255) default NULL,
  `PageID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `PageID` (`PageID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `PageRating`
--

LOCK TABLES `PageRating` WRITE;
/*!40000 ALTER TABLE `PageRating` DISABLE KEYS */;
INSERT INTO `PageRating` VALUES (1,'PageRating','2011-04-15 21:46:29','2011-04-15 21:46:29',4,'192.168.137.1',38),(2,'PageRating','2011-04-15 21:47:19','2011-04-15 21:47:19',3,'192.168.137.1',38),(3,'PageRating','2011-04-15 21:49:03','2011-04-15 21:49:03',4,'192.168.137.1',38),(4,'PageRating','2011-04-15 23:01:08','2011-04-15 23:01:08',5,'192.168.137.1',38),(5,'PageRating','2011-04-15 23:25:29','2011-04-15 23:25:29',5,'192.168.137.1',38),(6,'PageRating','2011-04-15 23:40:44','2011-04-15 23:40:44',2,'192.168.137.1',38),(7,'PageRating','2011-04-15 23:48:38','2011-04-15 23:48:38',4,'192.168.137.1',38),(8,'PageRating','2011-04-15 23:49:10','2011-04-15 23:49:10',5,'192.168.137.1',38),(9,'PageRating','2011-04-15 23:50:07','2011-04-15 23:50:07',4,'192.168.137.1',38),(10,'PageRating','2011-04-15 23:51:37','2011-04-15 23:51:37',5,'192.168.137.1',38),(11,'PageRating','2011-04-15 23:52:26','2011-04-15 23:52:26',5,'192.168.137.1',38),(12,'PageRating','2011-04-15 23:53:00','2011-04-15 23:53:00',4,'192.168.137.1',38),(13,'PageRating','2011-04-15 23:53:37','2011-04-15 23:53:37',4,'192.168.137.1',38),(14,'PageRating','2011-04-15 23:55:22','2011-04-15 23:55:22',5,'192.168.137.1',38),(15,'PageRating','2011-04-16 00:01:33','2011-04-16 00:01:33',5,'192.168.137.1',3),(16,'PageRating','2011-04-16 00:04:59','2011-04-16 00:04:59',4,'192.168.137.1',2);
/*!40000 ALTER TABLE `PageRating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Page_Live`
--

DROP TABLE IF EXISTS `Page_Live`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Page_Live` (
  `ID` int(11) NOT NULL auto_increment,
  `RatingWidgetID` int(11) NOT NULL default '0',
  `PageRatingWidgetID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `RatingWidgetID` (`RatingWidgetID`),
  KEY `PageRatingWidgetID` (`PageRatingWidgetID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Page_Live`
--

LOCK TABLES `Page_Live` WRITE;
/*!40000 ALTER TABLE `Page_Live` DISABLE KEYS */;
INSERT INTO `Page_Live` VALUES (13,0,0),(12,0,5),(7,0,0),(9,0,0),(3,0,6),(44,0,0),(2,0,7),(39,0,0),(38,0,8);
/*!40000 ALTER TABLE `Page_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Page_versions`
--

DROP TABLE IF EXISTS `Page_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Page_versions` (
  `ID` int(11) NOT NULL auto_increment,
  `RecordID` int(11) NOT NULL default '0',
  `Version` int(11) NOT NULL default '0',
  `RatingWidgetID` int(11) NOT NULL default '0',
  `PageRatingWidgetID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `RatingWidgetID` (`RatingWidgetID`),
  KEY `PageRatingWidgetID` (`PageRatingWidgetID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Page_versions`
--

LOCK TABLES `Page_versions` WRITE;
/*!40000 ALTER TABLE `Page_versions` DISABLE KEYS */;
INSERT INTO `Page_versions` VALUES (1,12,3,0,5),(2,3,5,0,6),(3,44,1,0,0),(4,2,7,0,7),(5,38,10,0,8);
/*!40000 ALTER TABLE `Page_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('Permission') default 'Permission',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Code` varchar(50) default NULL,
  `Arg` int(11) NOT NULL default '0',
  `Type` int(11) NOT NULL default '1',
  `GroupID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
INSERT INTO `Permission` VALUES (1,'Permission','2011-04-05 17:11:01','2011-04-05 17:11:01','CMS_ACCESS_CMSMain',0,1,1),(2,'Permission','2011-04-05 17:11:01','2011-04-05 17:11:01','CMS_ACCESS_AssetAdmin',0,1,1),(3,'Permission','2011-04-05 17:11:01','2011-04-05 17:11:01','CMS_ACCESS_CommentAdmin',0,1,1),(4,'Permission','2011-04-05 17:11:01','2011-04-05 17:11:01','CMS_ACCESS_ReportAdmin',0,1,1),(5,'Permission','2011-04-05 17:11:01','2011-04-05 17:11:01','SITETREE_REORGANISE',0,1,1),(6,'Permission','2011-04-05 17:11:01','2011-04-05 17:11:01','ADMIN',0,1,2),(7,'Permission','2011-04-05 18:05:57','2011-04-05 18:05:57','TRANSLATE_ALL',0,1,2),(8,'Permission','2011-04-05 18:05:57','2011-04-05 18:05:57','TRANSLATE_ALL',0,1,1);
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermissionRole`
--

DROP TABLE IF EXISTS `PermissionRole`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('PermissionRole') default 'PermissionRole',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Title` varchar(50) default NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `PermissionRole`
--

LOCK TABLES `PermissionRole` WRITE;
/*!40000 ALTER TABLE `PermissionRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermissionRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermissionRoleCode`
--

DROP TABLE IF EXISTS `PermissionRoleCode`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('PermissionRoleCode') default 'PermissionRoleCode',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Code` varchar(50) default NULL,
  `RoleID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `PermissionRoleCode`
--

LOCK TABLES `PermissionRoleCode` WRITE;
/*!40000 ALTER TABLE `PermissionRoleCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermissionRoleCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Product` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('Product') default 'Product',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Name` varchar(255) default NULL,
  `URL` varchar(255) default NULL,
  `ToplistID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `ToplistID` (`ToplistID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Product','2011-04-06 16:02:04','2011-04-07 00:09:50','HTC Windows Phone',NULL,0),(2,'Product','2011-04-06 21:03:43','2011-04-06 21:03:43','PSP 3000 Modified',NULL,0);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductImage`
--

DROP TABLE IF EXISTS `ProductImage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ProductImage` (
  `ID` int(11) NOT NULL auto_increment,
  `Name` varchar(255) default NULL,
  `ClassName` enum('ProductImage') default 'ProductImage',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `ProductID` int(11) NOT NULL default '0',
  `ImageID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `ProductID` (`ProductID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ProductImage`
--

LOCK TABLES `ProductImage` WRITE;
/*!40000 ALTER TABLE `ProductImage` DISABLE KEYS */;
INSERT INTO `ProductImage` VALUES (1,'Front View','ProductImage','2011-04-06 21:18:38','2011-04-06 21:19:17',2,11),(2,'Front View','ProductImage','2011-04-06 22:54:44','2011-04-06 22:55:02',1,13),(3,'Side View','ProductImage','2011-04-07 00:09:21','2011-04-07 00:09:43',1,14),(4,NULL,'ProductImage','2011-04-07 17:27:53','2011-04-07 17:28:17',2,15);
/*!40000 ALTER TABLE `ProductImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductOutclick`
--

DROP TABLE IF EXISTS `ProductOutclick`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ProductOutclick` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('ProductOutclick') default 'ProductOutclick',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `IP` varchar(255) default NULL,
  `ProductID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ProductOutclick`
--

LOCK TABLES `ProductOutclick` WRITE;
/*!40000 ALTER TABLE `ProductOutclick` DISABLE KEYS */;
INSERT INTO `ProductOutclick` VALUES (1,'ProductOutclick','2011-04-07 17:21:31',NULL,NULL,0),(2,'ProductOutclick','2011-04-07 17:22:09','2011-04-07 17:22:09','89.2.169.141',1),(3,'ProductOutclick','2011-04-07 17:25:38','2011-04-07 17:25:38','89.2.169.141',2),(4,'ProductOutclick','2011-04-07 17:31:22','2011-04-07 17:31:22','192.168.137.1',2),(5,'ProductOutclick','2011-04-07 18:45:10','2011-04-07 18:45:10','192.168.137.1',1),(6,'ProductOutclick','2011-04-07 19:52:18','2011-04-07 19:52:18','192.168.137.1',2),(7,'ProductOutclick','2011-04-07 20:02:09','2011-04-07 20:02:09','192.168.137.1',2),(8,'ProductOutclick','2011-04-07 20:03:10','2011-04-07 20:03:10','192.168.137.1',1),(9,'ProductOutclick','2011-04-08 20:18:02','2011-04-08 20:18:02','192.168.137.1',2),(10,'ProductOutclick','2011-04-08 20:18:02','2011-04-08 20:18:02','192.168.137.1',2),(11,'ProductOutclick','2011-04-08 20:18:03','2011-04-08 20:18:03','192.168.137.1',2),(12,'ProductOutclick','2011-04-08 20:18:03','2011-04-08 20:18:03','192.168.137.1',2),(13,'ProductOutclick','2011-04-08 20:18:04','2011-04-08 20:18:04','192.168.137.1',2),(14,'ProductOutclick','2011-04-08 20:18:04','2011-04-08 20:18:04','192.168.137.1',2),(15,'ProductOutclick','2011-04-08 20:18:05','2011-04-08 20:18:05','192.168.137.1',2),(16,'ProductOutclick','2011-04-08 20:18:05','2011-04-08 20:18:05','192.168.137.1',2),(17,'ProductOutclick','2011-04-08 20:18:06','2011-04-08 20:18:06','192.168.137.1',2),(18,'ProductOutclick','2011-04-08 20:18:06','2011-04-08 20:18:06','192.168.137.1',2),(19,'ProductOutclick','2011-04-08 20:18:07','2011-04-08 20:18:07','192.168.137.1',2),(20,'ProductOutclick','2011-04-08 21:14:28','2011-04-08 21:14:28','192.168.137.1',1),(21,'ProductOutclick','2011-04-08 21:14:28','2011-04-08 21:14:28','192.168.137.1',1),(22,'ProductOutclick','2011-04-08 21:14:29','2011-04-08 21:14:29','192.168.137.1',1),(23,'ProductOutclick','2011-04-08 21:14:29','2011-04-08 21:14:29','192.168.137.1',1),(24,'ProductOutclick','2011-04-08 21:14:29','2011-04-08 21:14:29','192.168.137.1',1),(25,'ProductOutclick','2011-04-08 21:14:29','2011-04-08 21:14:29','192.168.137.1',1),(26,'ProductOutclick','2011-04-08 21:14:29','2011-04-08 21:14:29','192.168.137.1',1),(27,'ProductOutclick','2011-04-08 21:14:30','2011-04-08 21:14:30','192.168.137.1',1),(28,'ProductOutclick','2011-04-08 21:14:30','2011-04-08 21:14:30','192.168.137.1',1),(29,'ProductOutclick','2011-04-08 21:14:30','2011-04-08 21:14:30','192.168.137.1',1),(30,'ProductOutclick','2011-04-08 21:14:30','2011-04-08 21:14:30','192.168.137.1',1),(31,'ProductOutclick','2011-04-08 21:14:30','2011-04-08 21:14:30','192.168.137.1',1),(32,'ProductOutclick','2011-04-08 21:14:30','2011-04-08 21:14:30','192.168.137.1',1),(33,'ProductOutclick','2011-04-08 21:14:31','2011-04-08 21:14:31','192.168.137.1',1),(34,'ProductOutclick','2011-04-08 21:14:31','2011-04-08 21:14:31','192.168.137.1',1),(35,'ProductOutclick','2011-04-08 21:14:31','2011-04-08 21:14:31','192.168.137.1',1),(36,'ProductOutclick','2011-04-08 21:14:31','2011-04-08 21:14:31','192.168.137.1',1),(37,'ProductOutclick','2011-04-08 21:14:32','2011-04-08 21:14:32','192.168.137.1',1),(38,'ProductOutclick','2011-04-08 21:14:33','2011-04-08 21:14:33','192.168.137.1',1),(39,'ProductOutclick','2011-04-08 21:14:34','2011-04-08 21:14:34','192.168.137.1',1),(40,'ProductOutclick','2011-04-08 21:14:34','2011-04-08 21:14:34','192.168.137.1',1),(41,'ProductOutclick','2011-04-08 21:14:34','2011-04-08 21:14:34','192.168.137.1',1),(42,'ProductOutclick','2011-04-08 21:14:37','2011-04-08 21:14:37','192.168.137.1',1),(43,'ProductOutclick','2011-04-08 21:14:37','2011-04-08 21:14:37','192.168.137.1',1),(44,'ProductOutclick','2011-04-08 21:14:37','2011-04-08 21:14:37','192.168.137.1',1),(45,'ProductOutclick','2011-04-08 21:14:37','2011-04-08 21:14:37','192.168.137.1',1),(46,'ProductOutclick','2011-04-08 21:14:37','2011-04-08 21:14:37','192.168.137.1',1),(47,'ProductOutclick','2011-04-08 21:14:38','2011-04-08 21:14:38','192.168.137.1',1),(48,'ProductOutclick','2011-04-08 21:14:38','2011-04-08 21:14:38','192.168.137.1',1);
/*!40000 ALTER TABLE `ProductOutclick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductReview`
--

DROP TABLE IF EXISTS `ProductReview`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ProductReview` (
  `ID` int(11) NOT NULL auto_increment,
  `OutclickURL` varchar(255) default NULL,
  `ProductID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ProductReview`
--

LOCK TABLES `ProductReview` WRITE;
/*!40000 ALTER TABLE `ProductReview` DISABLE KEYS */;
INSERT INTO `ProductReview` VALUES (33,NULL,0),(41,'http://google.com',1),(43,'http://webguidepartner.com',2);
/*!40000 ALTER TABLE `ProductReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductReview_Live`
--

DROP TABLE IF EXISTS `ProductReview_Live`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ProductReview_Live` (
  `ID` int(11) NOT NULL auto_increment,
  `OutclickURL` varchar(255) default NULL,
  `ProductID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ProductReview_Live`
--

LOCK TABLES `ProductReview_Live` WRITE;
/*!40000 ALTER TABLE `ProductReview_Live` DISABLE KEYS */;
INSERT INTO `ProductReview_Live` VALUES (41,'http://google.com',1),(43,'http://webguidepartner.com',2);
/*!40000 ALTER TABLE `ProductReview_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductReview_versions`
--

DROP TABLE IF EXISTS `ProductReview_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ProductReview_versions` (
  `ID` int(11) NOT NULL auto_increment,
  `RecordID` int(11) NOT NULL default '0',
  `Version` int(11) NOT NULL default '0',
  `OutclickURL` varchar(255) default NULL,
  `ProductID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ProductReview_versions`
--

LOCK TABLES `ProductReview_versions` WRITE;
/*!40000 ALTER TABLE `ProductReview_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductReview_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductToplist`
--

DROP TABLE IF EXISTS `ProductToplist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ProductToplist` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('ProductToplist') default 'ProductToplist',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Name` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ProductToplist`
--

LOCK TABLES `ProductToplist` WRITE;
/*!40000 ALTER TABLE `ProductToplist` DISABLE KEYS */;
INSERT INTO `ProductToplist` VALUES (1,'ProductToplist','2011-04-07 22:31:37','2011-04-08 17:19:56','test');
/*!40000 ALTER TABLE `ProductToplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductToplistItem`
--

DROP TABLE IF EXISTS `ProductToplistItem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ProductToplistItem` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('ProductToplistItem') default 'ProductToplistItem',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `ProductID` int(11) NOT NULL default '0',
  `ToplistID` int(11) NOT NULL default '0',
  `SortOrder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ProductID` (`ProductID`),
  KEY `ToplistID` (`ToplistID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ProductToplistItem`
--

LOCK TABLES `ProductToplistItem` WRITE;
/*!40000 ALTER TABLE `ProductToplistItem` DISABLE KEYS */;
INSERT INTO `ProductToplistItem` VALUES (3,'ProductToplistItem','2011-04-08 00:22:42','2011-04-08 00:22:42',2,1,0),(4,'ProductToplistItem','2011-04-08 00:47:35','2011-04-08 00:47:35',1,1,2);
/*!40000 ALTER TABLE `ProductToplistItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductToplistWidget`
--

DROP TABLE IF EXISTS `ProductToplistWidget`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ProductToplistWidget` (
  `ID` int(11) NOT NULL auto_increment,
  `ProductToplistID` int(11) NOT NULL default '0',
  `IsManualSort` tinyint(1) unsigned NOT NULL default '0',
  `ToplistID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ProductToplistID` (`ProductToplistID`),
  KEY `ToplistID` (`ToplistID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ProductToplistWidget`
--

LOCK TABLES `ProductToplistWidget` WRITE;
/*!40000 ALTER TABLE `ProductToplistWidget` DISABLE KEYS */;
INSERT INTO `ProductToplistWidget` VALUES (6,1,0,1);
/*!40000 ALTER TABLE `ProductToplistWidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QueuedEmail`
--

DROP TABLE IF EXISTS `QueuedEmail`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `QueuedEmail` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('QueuedEmail') default 'QueuedEmail',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Send` datetime default NULL,
  `Subject` varchar(50) default NULL,
  `From` varchar(50) default NULL,
  `Content` mediumtext,
  `ToID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ToID` (`ToID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `QueuedEmail`
--

LOCK TABLES `QueuedEmail` WRITE;
/*!40000 ALTER TABLE `QueuedEmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `QueuedEmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RedirectorPage`
--

DROP TABLE IF EXISTS `RedirectorPage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL auto_increment,
  `RedirectionType` enum('Internal','External') default 'Internal',
  `ExternalURL` varchar(2083) default NULL,
  `LinkToID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `RedirectorPage`
--

LOCK TABLES `RedirectorPage` WRITE;
/*!40000 ALTER TABLE `RedirectorPage` DISABLE KEYS */;
/*!40000 ALTER TABLE `RedirectorPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RedirectorPage_Live`
--

DROP TABLE IF EXISTS `RedirectorPage_Live`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL auto_increment,
  `RedirectionType` enum('Internal','External') default 'Internal',
  `ExternalURL` varchar(2083) default NULL,
  `LinkToID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `RedirectorPage_Live`
--

LOCK TABLES `RedirectorPage_Live` WRITE;
/*!40000 ALTER TABLE `RedirectorPage_Live` DISABLE KEYS */;
/*!40000 ALTER TABLE `RedirectorPage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RedirectorPage_versions`
--

DROP TABLE IF EXISTS `RedirectorPage_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `RedirectorPage_versions` (
  `ID` int(11) NOT NULL auto_increment,
  `RecordID` int(11) NOT NULL default '0',
  `Version` int(11) NOT NULL default '0',
  `RedirectionType` enum('Internal','External') default 'Internal',
  `ExternalURL` varchar(2083) default NULL,
  `LinkToID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `RedirectorPage_versions`
--

LOCK TABLES `RedirectorPage_versions` WRITE;
/*!40000 ALTER TABLE `RedirectorPage_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `RedirectorPage_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig`
--

DROP TABLE IF EXISTS `SiteConfig`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('SiteConfig') default 'SiteConfig',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Title` varchar(255) default NULL,
  `Tagline` varchar(255) default NULL,
  `Theme` varchar(255) default NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') default 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') default 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') default 'LoggedInUsers',
  `Locale` varchar(16) default NULL,
  `MaxRate` int(11) NOT NULL default '0',
  `MaxPageRate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteConfig`
--

LOCK TABLES `SiteConfig` WRITE;
/*!40000 ALTER TABLE `SiteConfig` DISABLE KEYS */;
INSERT INTO `SiteConfig` VALUES (1,'SiteConfig','2011-04-05 17:11:01','2011-04-15 22:45:51','WGP Workshop',NULL,NULL,'Anyone','LoggedInUsers','LoggedInUsers','en_US',5,5),(2,'SiteConfig','2011-04-05 19:47:59','2011-04-05 19:47:59','Your Site Name','your tagline here',NULL,'Anyone','LoggedInUsers','LoggedInUsers','sv_SE',0,0),(3,'SiteConfig','2011-04-05 20:03:03','2011-04-05 20:59:56','WGP Workshop',NULL,NULL,'Anyone','LoggedInUsers','LoggedInUsers','tl_PH',0,0);
/*!40000 ALTER TABLE `SiteConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

DROP TABLE IF EXISTS `SiteConfig_CreateTopLevelGroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL auto_increment,
  `SiteConfigID` int(11) NOT NULL default '0',
  `GroupID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteConfig_CreateTopLevelGroups`
--

LOCK TABLES `SiteConfig_CreateTopLevelGroups` WRITE;
/*!40000 ALTER TABLE `SiteConfig_CreateTopLevelGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteConfig_CreateTopLevelGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig_EditorGroups`
--

DROP TABLE IF EXISTS `SiteConfig_EditorGroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL auto_increment,
  `SiteConfigID` int(11) NOT NULL default '0',
  `GroupID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteConfig_EditorGroups`
--

LOCK TABLES `SiteConfig_EditorGroups` WRITE;
/*!40000 ALTER TABLE `SiteConfig_EditorGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteConfig_EditorGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

DROP TABLE IF EXISTS `SiteConfig_ViewerGroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL auto_increment,
  `SiteConfigID` int(11) NOT NULL default '0',
  `GroupID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteConfig_ViewerGroups`
--

LOCK TABLES `SiteConfig_ViewerGroups` WRITE;
/*!40000 ALTER TABLE `SiteConfig_ViewerGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteConfig_ViewerGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteConfig_translationgroups`
--

DROP TABLE IF EXISTS `SiteConfig_translationgroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteConfig_translationgroups` (
  `ID` int(11) NOT NULL auto_increment,
  `OriginalID` int(11) NOT NULL default '0',
  `TranslationGroupID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `OriginalID` (`OriginalID`),
  KEY `TranslationGroupID` (`TranslationGroupID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteConfig_translationgroups`
--

LOCK TABLES `SiteConfig_translationgroups` WRITE;
/*!40000 ALTER TABLE `SiteConfig_translationgroups` DISABLE KEYS */;
INSERT INTO `SiteConfig_translationgroups` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `SiteConfig_translationgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree`
--

DROP TABLE IF EXISTS `SiteTree`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('SiteTree','Page','Article','ArticleHolder','IndexPage','ProductReview','ErrorPage','RedirectorPage','VirtualPage') default 'SiteTree',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `URLSegment` varchar(255) default NULL,
  `Title` varchar(255) default NULL,
  `MenuTitle` varchar(100) default NULL,
  `Content` mediumtext,
  `MetaTitle` varchar(255) default NULL,
  `MetaDescription` mediumtext,
  `MetaKeywords` varchar(255) default NULL,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL default '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL default '0',
  `HomepageForDomain` varchar(100) default NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL default '0',
  `Sort` int(11) NOT NULL default '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL default '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL default '0',
  `Status` varchar(50) default NULL,
  `ReportClass` varchar(50) default NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') default 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') default 'Inherit',
  `ToDo` mediumtext,
  `Version` int(11) NOT NULL default '0',
  `Priority` varchar(5) default NULL,
  `ParentID` int(11) NOT NULL default '0',
  `Locale` varchar(16) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteTree`
--

LOCK TABLES `SiteTree` WRITE;
/*!40000 ALTER TABLE `SiteTree` DISABLE KEYS */;
INSERT INTO `SiteTree` VALUES (38,'IndexPage','2011-04-06 22:11:27','2011-05-18 19:00:48','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Anyone','OnlyTheseUsers',NULL,10,'1.0',0,'en_US'),(2,'ArticleHolder','2011-04-05 17:11:01','2011-04-16 00:04:40','articles','Articles',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,7,'1.0',0,'en_US'),(3,'Page','2011-04-05 17:11:01','2011-04-15 17:23:48','products','Products',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,5,'1.0',0,'en_US'),(4,'ErrorPage','2011-04-05 17:11:01','2011-04-06 22:14:36','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p>\n<p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,4,0,0,'Published',NULL,'Inherit','Inherit',NULL,4,'1.0',0,'en_US'),(5,'ErrorPage','2011-04-05 17:11:01','2011-04-05 18:05:57','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,5,0,0,'New page',NULL,'Inherit','Inherit',NULL,2,NULL,0,'en_US'),(6,'IndexPage','2011-04-05 19:47:59','2011-04-06 21:34:03','home-sv-SE','Home',NULL,'<p>SV_SE. Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'sv_SE'),(7,'Page','2011-04-05 19:50:57','2011-04-05 19:51:13','products-sv-SE','Products',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,4,'1.0',0,'sv_SE'),(8,'IndexPage','2011-04-05 20:03:03','2011-04-06 21:34:03','tahanan','Tahanan',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>','Tahanan',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,2,'1.0',0,'tl_PH'),(9,'Page','2011-04-05 20:13:16','2011-04-05 20:13:49','mga-produkto','Mga Produkto',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'tl_PH'),(10,'ArticleHolder','2011-04-05 20:15:00','2011-04-06 22:50:10','mga-artikulo','Mga Artikulo',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'tl_PH'),(13,'Page','2011-04-05 20:16:50','2011-04-05 20:17:20','pagsusulit','Pagsusulit',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of  the printing and typesetting industry. Lorem Ipsum has been the  industry\'s standard dummy text ever since the 1500s, when an unknown  printer took a galley of type and scrambled it to make a type specimen  book. It has survived not only five centuries, but also the leap into  electronic typesetting, remaining essentially unchanged. It was  popularised in the 1960s with the release of Letraset sheets containing  Lorem Ipsum passages, and more recently with desktop publishing software  like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<div>\n<p>It  is a long established fact that a reader will be distracted by the  readable content of a page when looking at its layout. The point of  using Lorem Ipsum is that it has a more-or-less normal distribution of  letters, as opposed to using \'Content here, content here\', making it  look like readable English. Many desktop publishing packages and web  page editors now use Lorem Ipsum as their default model text, and a  search for \'lorem ipsum\' will uncover many web sites still in their  infancy. Various versions have evolved over the years, sometimes by  accident, sometimes on purpose (injected humour and the like).</p>\n</div>','Exam',NULL,NULL,NULL,1,1,NULL,0,6,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'tl_PH'),(12,'Page','2011-04-05 20:16:14','2011-04-15 16:09:13','exam','Exam',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of  the printing and typesetting industry. Lorem Ipsum has been the  industry\'s standard dummy text ever since the 1500s, when an unknown  printer took a galley of type and scrambled it to make a type specimen  book. It has survived not only five centuries, but also the leap into  electronic typesetting, remaining essentially unchanged. It was  popularised in the 1960s with the release of Letraset sheets containing  Lorem Ipsum passages, and more recently with desktop publishing software  like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<div>\n<p>It  is a long established fact that a reader will be distracted by the  readable content of a page when looking at its layout. The point of  using Lorem Ipsum is that it has a more-or-less normal distribution of  letters, as opposed to using \'Content here, content here\', making it  look like readable English. Many desktop publishing packages and web  page editors now use Lorem Ipsum as their default model text, and a  search for \'lorem ipsum\' will uncover many web sites still in their  infancy. Various versions have evolved over the years, sometimes by  accident, sometimes on purpose (injected humour and the like).</p>\n</div>','Exam',NULL,NULL,NULL,1,1,NULL,0,6,0,0,'Published',NULL,'Inherit','Inherit',NULL,3,'1.0',0,'en_US'),(37,'Article','2011-04-06 21:38:22','2011-04-11 22:28:20','new-article','New Article',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,5,'0.9',2,'en_US'),(18,'Article','2011-04-06 15:03:16','2011-04-06 15:25:57','new-article','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,3,'0.9',8,'tl_PH'),(39,'IndexPage','2011-04-06 22:21:58','2011-04-06 22:22:30','tahanan-2','Tahanan',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,28,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'tl_PH'),(21,'ErrorPage','2011-04-06 16:05:10','2011-04-06 16:05:10','page-not-found-8','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,7,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(22,'ErrorPage','2011-04-06 18:37:49','2011-04-06 18:37:49','page-not-found-9','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,8,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(23,'ErrorPage','2011-04-06 18:47:53','2011-04-06 18:47:53','page-not-found-10','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,9,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(24,'ErrorPage','2011-04-06 19:49:07','2011-04-06 19:49:07','page-not-found-11','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,10,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(25,'ErrorPage','2011-04-06 19:50:40','2011-04-06 19:50:40','page-not-found-12','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,11,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(26,'ErrorPage','2011-04-06 20:46:10','2011-04-06 20:46:10','page-not-found-13','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,12,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(27,'ErrorPage','2011-04-06 21:01:06','2011-04-06 21:01:06','page-not-found-14','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,13,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(28,'ErrorPage','2011-04-06 21:04:39','2011-04-06 21:04:39','page-not-found-15','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,14,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(29,'ErrorPage','2011-04-06 21:09:38','2011-04-06 21:09:38','page-not-found-16','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,15,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(30,'ErrorPage','2011-04-06 21:11:27','2011-04-06 21:11:27','page-not-found-17','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,16,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(31,'ErrorPage','2011-04-06 21:17:12','2011-04-06 21:17:12','page-not-found-18','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,17,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(32,'ErrorPage','2011-04-06 21:18:12','2011-04-06 21:18:12','page-not-found-19','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,18,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(33,'ProductReview','2011-04-06 21:20:41','2011-04-06 21:20:41','new-productreview','New ProductReview',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,2,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,8,'tl_PH'),(34,'ErrorPage','2011-04-06 21:27:09','2011-04-06 21:27:09','page-not-found-20','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,19,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(35,'ErrorPage','2011-04-06 21:33:03','2011-04-06 21:33:03','page-not-found-21','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,20,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(36,'ErrorPage','2011-04-06 21:35:52','2011-04-06 21:35:52','page-not-found-22','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,21,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(41,'ProductReview','2011-04-06 22:58:12','2011-04-07 18:44:50','htc-windows-phone','HTC Windows Phone',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>','htc-windows-phone',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,7,'0.9',3,'en_US'),(42,'Article','2011-04-07 00:20:08','2011-04-11 22:31:52','asdf','asdf',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>','asdf',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,2,'0.9',2,'en_US'),(43,'ProductReview','2011-04-07 17:24:22','2011-04-07 17:25:14','psp-3000-modified','PSP 3000 Modified',NULL,NULL,'PSP 3000 Modified',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,2,'0.9',3,'en_US'),(44,'ErrorPage','2011-04-15 22:47:20','2011-04-15 22:47:20','page-not-found-2','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,29,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US');
/*!40000 ALTER TABLE `SiteTree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_EditorGroups`
--

DROP TABLE IF EXISTS `SiteTree_EditorGroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL auto_increment,
  `SiteTreeID` int(11) NOT NULL default '0',
  `GroupID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteTree_EditorGroups`
--

LOCK TABLES `SiteTree_EditorGroups` WRITE;
/*!40000 ALTER TABLE `SiteTree_EditorGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTree_EditorGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_ImageTracking`
--

DROP TABLE IF EXISTS `SiteTree_ImageTracking`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL auto_increment,
  `SiteTreeID` int(11) NOT NULL default '0',
  `FileID` int(11) NOT NULL default '0',
  `FieldName` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteTree_ImageTracking`
--

LOCK TABLES `SiteTree_ImageTracking` WRITE;
/*!40000 ALTER TABLE `SiteTree_ImageTracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTree_ImageTracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_LinkTracking`
--

DROP TABLE IF EXISTS `SiteTree_LinkTracking`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL auto_increment,
  `SiteTreeID` int(11) NOT NULL default '0',
  `ChildID` int(11) NOT NULL default '0',
  `FieldName` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteTree_LinkTracking`
--

LOCK TABLES `SiteTree_LinkTracking` WRITE;
/*!40000 ALTER TABLE `SiteTree_LinkTracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTree_LinkTracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_Live`
--

DROP TABLE IF EXISTS `SiteTree_Live`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('SiteTree','Page','Article','ArticleHolder','IndexPage','ProductReview','ErrorPage','RedirectorPage','VirtualPage') default 'SiteTree',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `URLSegment` varchar(255) default NULL,
  `Title` varchar(255) default NULL,
  `MenuTitle` varchar(100) default NULL,
  `Content` mediumtext,
  `MetaTitle` varchar(255) default NULL,
  `MetaDescription` mediumtext,
  `MetaKeywords` varchar(255) default NULL,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL default '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL default '0',
  `HomepageForDomain` varchar(100) default NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL default '0',
  `Sort` int(11) NOT NULL default '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL default '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL default '0',
  `Status` varchar(50) default NULL,
  `ReportClass` varchar(50) default NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') default 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') default 'Inherit',
  `ToDo` mediumtext,
  `Version` int(11) NOT NULL default '0',
  `Priority` varchar(5) default NULL,
  `ParentID` int(11) NOT NULL default '0',
  `Locale` varchar(16) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteTree_Live`
--

LOCK TABLES `SiteTree_Live` WRITE;
/*!40000 ALTER TABLE `SiteTree_Live` DISABLE KEYS */;
INSERT INTO `SiteTree_Live` VALUES (38,'IndexPage','2011-04-06 22:11:27','2011-05-18 19:00:48','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Anyone','OnlyTheseUsers',NULL,10,'1.0',0,'en_US'),(2,'ArticleHolder','2011-04-05 17:11:01','2011-04-16 00:04:40','articles','Articles',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,7,'1.0',0,'en_US'),(3,'Page','2011-04-05 17:11:01','2011-04-15 17:23:48','products','Products',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,5,'1.0',0,'en_US'),(4,'ErrorPage','2011-04-05 17:11:01','2011-04-06 22:14:36','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p>\n<p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,4,0,0,'Published',NULL,'Inherit','Inherit',NULL,4,'1.0',0,'en_US'),(5,'ErrorPage','2011-04-05 17:11:01','2011-04-05 18:05:57','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,5,0,0,'New page',NULL,'Inherit','Inherit',NULL,3,NULL,0,'en_US'),(6,'Page','2011-04-05 19:47:59','2011-04-05 20:15:51','home-sv-SE','Home',NULL,'<p>SV_SE. Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'sv_SE'),(7,'Page','2011-04-05 19:50:57','2011-04-15 17:23:48','products-sv-SE','Products',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,4,'1.0',0,'sv_SE'),(8,'Page','2011-04-05 20:03:03','2011-04-05 20:15:51','tahanan','Tahanan',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>','Tahanan',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,2,'1.0',0,'tl_PH'),(9,'Page','2011-04-05 20:13:16','2011-04-15 17:23:48','mga-produkto','Mga Produkto',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'tl_PH'),(10,'Page','2011-04-05 20:15:00','2011-04-05 20:15:24','mga-artikulo','Mga Artikulo',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'tl_PH'),(12,'Page','2011-04-05 20:16:14','2011-04-15 16:09:13','exam','Exam',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of  the printing and typesetting industry. Lorem Ipsum has been the  industry\'s standard dummy text ever since the 1500s, when an unknown  printer took a galley of type and scrambled it to make a type specimen  book. It has survived not only five centuries, but also the leap into  electronic typesetting, remaining essentially unchanged. It was  popularised in the 1960s with the release of Letraset sheets containing  Lorem Ipsum passages, and more recently with desktop publishing software  like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<div>\n<p>It  is a long established fact that a reader will be distracted by the  readable content of a page when looking at its layout. The point of  using Lorem Ipsum is that it has a more-or-less normal distribution of  letters, as opposed to using \'Content here, content here\', making it  look like readable English. Many desktop publishing packages and web  page editors now use Lorem Ipsum as their default model text, and a  search for \'lorem ipsum\' will uncover many web sites still in their  infancy. Various versions have evolved over the years, sometimes by  accident, sometimes on purpose (injected humour and the like).</p>\n</div>','Exam',NULL,NULL,NULL,1,1,NULL,0,6,0,0,'Published',NULL,'Inherit','Inherit',NULL,3,'1.0',0,'en_US'),(13,'Page','2011-04-05 20:16:50','2011-04-15 16:09:13','pagsusulit','Pagsusulit',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of  the printing and typesetting industry. Lorem Ipsum has been the  industry\'s standard dummy text ever since the 1500s, when an unknown  printer took a galley of type and scrambled it to make a type specimen  book. It has survived not only five centuries, but also the leap into  electronic typesetting, remaining essentially unchanged. It was  popularised in the 1960s with the release of Letraset sheets containing  Lorem Ipsum passages, and more recently with desktop publishing software  like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<div>\n<p>It  is a long established fact that a reader will be distracted by the  readable content of a page when looking at its layout. The point of  using Lorem Ipsum is that it has a more-or-less normal distribution of  letters, as opposed to using \'Content here, content here\', making it  look like readable English. Many desktop publishing packages and web  page editors now use Lorem Ipsum as their default model text, and a  search for \'lorem ipsum\' will uncover many web sites still in their  infancy. Various versions have evolved over the years, sometimes by  accident, sometimes on purpose (injected humour and the like).</p>\n</div>','Exam',NULL,NULL,NULL,1,1,NULL,0,6,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'tl_PH'),(37,'Article','2011-04-06 21:38:22','2011-04-11 22:28:20','new-article','New Article',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,5,'0.9',2,'en_US'),(18,'Article','2011-04-06 15:03:16','2011-04-06 15:19:26','new-article','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,2,'0.9',8,'tl_PH'),(39,'IndexPage','2011-04-06 22:21:58','2011-05-18 19:00:48','tahanan-2','Tahanan',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,28,0,0,'Published',NULL,'Inherit','Inherit',NULL,1,'1.0',0,'tl_PH'),(21,'ErrorPage','2011-04-06 16:05:10','2011-04-06 16:05:10','page-not-found-8','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,7,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(22,'ErrorPage','2011-04-06 18:37:49','2011-04-06 18:37:49','page-not-found-9','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,8,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(23,'ErrorPage','2011-04-06 18:47:53','2011-04-06 18:47:53','page-not-found-10','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,9,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(24,'ErrorPage','2011-04-06 19:49:07','2011-04-06 19:49:07','page-not-found-11','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,10,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(25,'ErrorPage','2011-04-06 19:50:40','2011-04-06 19:50:40','page-not-found-12','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,11,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(26,'ErrorPage','2011-04-06 20:46:10','2011-04-06 20:46:10','page-not-found-13','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,12,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(27,'ErrorPage','2011-04-06 21:01:06','2011-04-06 21:01:06','page-not-found-14','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,13,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(28,'ErrorPage','2011-04-06 21:04:39','2011-04-06 21:04:39','page-not-found-15','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,14,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(29,'ErrorPage','2011-04-06 21:09:38','2011-04-06 21:09:38','page-not-found-16','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,15,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(30,'ErrorPage','2011-04-06 21:11:27','2011-04-06 21:11:27','page-not-found-17','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,16,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(31,'ErrorPage','2011-04-06 21:17:12','2011-04-06 21:17:12','page-not-found-18','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,17,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(32,'ErrorPage','2011-04-06 21:18:12','2011-04-06 21:18:12','page-not-found-19','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,18,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(34,'ErrorPage','2011-04-06 21:27:09','2011-04-06 21:27:09','page-not-found-20','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,19,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(35,'ErrorPage','2011-04-06 21:33:03','2011-04-06 21:33:03','page-not-found-21','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,20,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(36,'ErrorPage','2011-04-06 21:35:52','2011-04-06 21:35:52','page-not-found-22','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,21,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US'),(41,'ProductReview','2011-04-06 22:58:12','2011-04-07 18:44:50','htc-windows-phone','HTC Windows Phone',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>','htc-windows-phone',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,7,'0.9',3,'en_US'),(42,'Article','2011-04-07 00:20:08','2011-04-11 22:28:59','asdf','asdf',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>','asdf',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,2,'0.9',2,'en_US'),(43,'ProductReview','2011-04-07 17:24:22','2011-04-07 17:25:14','psp-3000-modified','PSP 3000 Modified',NULL,NULL,'PSP 3000 Modified',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,2,'0.9',3,'en_US'),(44,'ErrorPage','2011-04-15 22:47:20','2011-04-15 22:47:20','page-not-found-2','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,29,0,0,'New page',NULL,'Inherit','Inherit',NULL,1,NULL,0,'en_US');
/*!40000 ALTER TABLE `SiteTree_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_ViewerGroups`
--

DROP TABLE IF EXISTS `SiteTree_ViewerGroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL auto_increment,
  `SiteTreeID` int(11) NOT NULL default '0',
  `GroupID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteTree_ViewerGroups`
--

LOCK TABLES `SiteTree_ViewerGroups` WRITE;
/*!40000 ALTER TABLE `SiteTree_ViewerGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTree_ViewerGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_translationgroups`
--

DROP TABLE IF EXISTS `SiteTree_translationgroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteTree_translationgroups` (
  `ID` int(11) NOT NULL auto_increment,
  `OriginalID` int(11) NOT NULL default '0',
  `TranslationGroupID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `OriginalID` (`OriginalID`),
  KEY `TranslationGroupID` (`TranslationGroupID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteTree_translationgroups`
--

LOCK TABLES `SiteTree_translationgroups` WRITE;
/*!40000 ALTER TABLE `SiteTree_translationgroups` DISABLE KEYS */;
INSERT INTO `SiteTree_translationgroups` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,1),(7,7,3),(8,8,1),(9,9,3),(10,10,2),(11,11,11),(12,12,12),(13,13,12),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,38),(40,40,40),(41,41,41),(42,42,42),(43,43,43),(44,44,44);
/*!40000 ALTER TABLE `SiteTree_translationgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTree_versions`
--

DROP TABLE IF EXISTS `SiteTree_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `SiteTree_versions` (
  `ID` int(11) NOT NULL auto_increment,
  `RecordID` int(11) NOT NULL default '0',
  `Version` int(11) NOT NULL default '0',
  `WasPublished` tinyint(1) unsigned NOT NULL default '0',
  `AuthorID` int(11) NOT NULL default '0',
  `PublisherID` int(11) NOT NULL default '0',
  `ClassName` enum('SiteTree','Page','Article','ArticleHolder','IndexPage','ProductReview','ErrorPage','RedirectorPage','VirtualPage') default 'SiteTree',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `URLSegment` varchar(255) default NULL,
  `Title` varchar(255) default NULL,
  `MenuTitle` varchar(100) default NULL,
  `Content` mediumtext,
  `MetaTitle` varchar(255) default NULL,
  `MetaDescription` mediumtext,
  `MetaKeywords` varchar(255) default NULL,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL default '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL default '0',
  `HomepageForDomain` varchar(100) default NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL default '0',
  `Sort` int(11) NOT NULL default '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL default '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL default '0',
  `Status` varchar(50) default NULL,
  `ReportClass` varchar(50) default NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') default 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') default 'Inherit',
  `ToDo` mediumtext,
  `Priority` varchar(5) default NULL,
  `ParentID` int(11) NOT NULL default '0',
  `Locale` varchar(16) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `SiteTree_versions`
--

LOCK TABLES `SiteTree_versions` WRITE;
/*!40000 ALTER TABLE `SiteTree_versions` DISABLE KEYS */;
INSERT INTO `SiteTree_versions` VALUES (1,1,1,1,0,0,'Page','2011-04-05 17:11:01','2011-04-05 17:11:01','home','Home',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,NULL),(2,2,1,1,0,0,'Page','2011-04-05 17:11:01','2011-04-05 17:11:01','about-us','About Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,NULL),(3,3,1,1,0,0,'Page','2011-04-05 17:11:01','2011-04-05 17:11:01','contact-us','Contact Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,NULL),(4,4,1,1,0,0,'ErrorPage','2011-04-05 17:11:01','2011-04-05 17:11:01','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,4,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,NULL),(5,5,1,1,0,0,'ErrorPage','2011-04-05 17:11:01','2011-04-05 17:11:01','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,5,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,NULL),(6,1,2,0,1,0,'Page','2011-04-05 17:11:01','2011-04-05 18:05:57','home','Home',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(7,2,2,0,1,0,'Page','2011-04-05 17:11:01','2011-04-05 18:05:57','about-us','About Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(8,3,2,0,1,0,'Page','2011-04-05 17:11:01','2011-04-05 18:05:57','contact-us','Contact Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(9,4,2,0,1,0,'ErrorPage','2011-04-05 17:11:01','2011-04-05 18:05:57','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,4,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(10,5,2,0,1,0,'ErrorPage','2011-04-05 17:11:01','2011-04-05 18:05:57','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,5,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(11,1,3,0,1,0,'Page','2011-04-05 17:11:01','2011-04-05 18:05:57','home','Home',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(12,2,3,0,1,0,'Page','2011-04-05 17:11:01','2011-04-05 18:05:57','about-us','About Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(13,3,3,0,1,0,'Page','2011-04-05 17:11:01','2011-04-05 18:05:57','contact-us','Contact Us',NULL,'<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Published',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(14,4,3,0,1,0,'ErrorPage','2011-04-05 17:11:01','2011-04-05 18:05:57','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,4,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(15,5,3,0,1,0,'ErrorPage','2011-04-05 17:11:01','2011-04-05 18:05:57','server-error','Server error',NULL,'<p>Sorry, there was a problem with handling your request.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,5,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(16,6,1,1,1,1,'Page','2011-04-05 19:47:59','2011-04-05 19:48:25','home-sv-SE','Home',NULL,'<p>SV_SE. Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'sv_SE'),(17,3,4,1,1,1,'Page','2011-04-05 17:11:01','2011-04-05 19:50:48','products','Products',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(18,8,1,1,1,1,'Page','2011-04-05 20:03:03','2011-04-05 20:03:35','tahanan','Tahanan','Home','<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>','Tahanan',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'tl_PH'),(19,8,2,1,1,1,'Page','2011-04-05 20:03:03','2011-04-05 20:04:37','tahanan','Tahanan',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>','Tahanan',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'tl_PH'),(20,9,1,1,1,1,'Page','2011-04-05 20:13:16','2011-04-05 20:13:49','mga-produkto','Mga Produkto',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'tl_PH'),(21,2,4,1,1,1,'Page','2011-04-05 17:11:01','2011-04-05 20:14:50','articles','Articles',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(22,10,1,1,1,1,'Page','2011-04-05 20:15:00','2011-04-05 20:15:24','mga-artikulo','Mga Artikulo',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'tl_PH'),(23,1,4,1,1,1,'Page','2011-04-05 17:11:01','2011-04-05 20:15:51','home','Home',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(24,11,1,0,1,0,'Page','2011-04-05 20:15:59','2011-04-05 20:15:59','new-page','New Page',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,1,'en_US'),(25,12,1,0,1,0,'Page','2011-04-05 20:16:14','2011-04-05 20:16:14','new-page','New Page',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,6,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(26,12,2,1,1,1,'Page','2011-04-05 20:16:14','2011-04-05 20:16:44','exam','Exam',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of  the printing and typesetting industry. Lorem Ipsum has been the  industry\'s standard dummy text ever since the 1500s, when an unknown  printer took a galley of type and scrambled it to make a type specimen  book. It has survived not only five centuries, but also the leap into  electronic typesetting, remaining essentially unchanged. It was  popularised in the 1960s with the release of Letraset sheets containing  Lorem Ipsum passages, and more recently with desktop publishing software  like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<div>\n<p>It  is a long established fact that a reader will be distracted by the  readable content of a page when looking at its layout. The point of  using Lorem Ipsum is that it has a more-or-less normal distribution of  letters, as opposed to using \'Content here, content here\', making it  look like readable English. Many desktop publishing packages and web  page editors now use Lorem Ipsum as their default model text, and a  search for \'lorem ipsum\' will uncover many web sites still in their  infancy. Various versions have evolved over the years, sometimes by  accident, sometimes on purpose (injected humour and the like).</p>\n</div>','Exam',NULL,NULL,NULL,1,1,NULL,0,6,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(27,13,1,1,1,1,'Page','2011-04-05 20:16:50','2011-04-05 20:17:20','pagsusulit','Pagsusulit',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of  the printing and typesetting industry. Lorem Ipsum has been the  industry\'s standard dummy text ever since the 1500s, when an unknown  printer took a galley of type and scrambled it to make a type specimen  book. It has survived not only five centuries, but also the leap into  electronic typesetting, remaining essentially unchanged. It was  popularised in the 1960s with the release of Letraset sheets containing  Lorem Ipsum passages, and more recently with desktop publishing software  like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<div>\n<p>It  is a long established fact that a reader will be distracted by the  readable content of a page when looking at its layout. The point of  using Lorem Ipsum is that it has a more-or-less normal distribution of  letters, as opposed to using \'Content here, content here\', making it  look like readable English. Many desktop publishing packages and web  page editors now use Lorem Ipsum as their default model text, and a  search for \'lorem ipsum\' will uncover many web sites still in their  infancy. Various versions have evolved over the years, sometimes by  accident, sometimes on purpose (injected humour and the like).</p>\n</div>','Exam',NULL,NULL,NULL,1,1,NULL,0,6,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'tl_PH'),(28,14,1,1,1,1,'ErrorPage','2011-04-06 14:59:47','2011-04-06 14:59:47','page-not-found-2','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,7,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(29,15,1,1,1,1,'ErrorPage','2011-04-06 15:00:33','2011-04-06 15:00:33','page-not-found-3','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,8,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(30,16,1,1,1,1,'ErrorPage','2011-04-06 15:02:21','2011-04-06 15:02:21','page-not-found-4','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,9,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(31,17,1,1,1,1,'ErrorPage','2011-04-06 15:02:57','2011-04-06 15:02:57','page-not-found-5','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,10,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(32,18,1,0,1,0,'Article','2011-04-06 15:03:16','2011-04-06 15:03:16','new-article','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,8,'tl_PH'),(33,18,2,1,1,1,'Article','2011-04-06 15:03:16','2011-04-06 15:19:26','new-article','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'0.9',8,'tl_PH'),(34,18,3,0,1,0,'Article','2011-04-06 15:03:16','2011-04-06 15:25:57','new-article','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Published',NULL,'Inherit','Inherit',NULL,'0.9',8,'tl_PH'),(35,19,1,1,1,1,'ErrorPage','2011-04-06 15:43:01','2011-04-06 15:43:01','page-not-found-6','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,11,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(36,20,1,1,1,1,'ErrorPage','2011-04-06 16:01:05','2011-04-06 16:01:05','page-not-found-7','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,12,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(37,21,1,1,1,1,'ErrorPage','2011-04-06 16:05:10','2011-04-06 16:05:10','page-not-found-8','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,13,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(38,22,1,1,1,1,'ErrorPage','2011-04-06 18:37:49','2011-04-06 18:37:49','page-not-found-9','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,14,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(39,23,1,1,1,1,'ErrorPage','2011-04-06 18:47:53','2011-04-06 18:47:53','page-not-found-10','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,15,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(40,24,1,1,1,1,'ErrorPage','2011-04-06 19:49:07','2011-04-06 19:49:07','page-not-found-11','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,16,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(41,25,1,1,1,1,'ErrorPage','2011-04-06 19:50:40','2011-04-06 19:50:40','page-not-found-12','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,17,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(42,26,1,1,1,1,'ErrorPage','2011-04-06 20:46:10','2011-04-06 20:46:10','page-not-found-13','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,18,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(43,27,1,1,1,1,'ErrorPage','2011-04-06 21:01:06','2011-04-06 21:01:06','page-not-found-14','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,19,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(44,28,1,1,1,1,'ErrorPage','2011-04-06 21:04:39','2011-04-06 21:04:39','page-not-found-15','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,20,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(45,29,1,1,1,1,'ErrorPage','2011-04-06 21:09:38','2011-04-06 21:09:38','page-not-found-16','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,21,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(46,30,1,1,1,1,'ErrorPage','2011-04-06 21:11:27','2011-04-06 21:11:27','page-not-found-17','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,22,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(47,31,1,1,1,1,'ErrorPage','2011-04-06 21:17:12','2011-04-06 21:17:12','page-not-found-18','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,23,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(48,32,1,1,1,1,'ErrorPage','2011-04-06 21:18:12','2011-04-06 21:18:12','page-not-found-19','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,24,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(49,33,1,0,1,0,'ProductReview','2011-04-06 21:20:41','2011-04-06 21:20:41','new-productreview','New ProductReview',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,2,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,8,'tl_PH'),(50,34,1,1,1,1,'ErrorPage','2011-04-06 21:27:09','2011-04-06 21:27:09','page-not-found-20','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,25,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(51,35,1,1,1,1,'ErrorPage','2011-04-06 21:33:03','2011-04-06 21:33:03','page-not-found-21','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,26,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(52,1,5,1,1,1,'IndexPage','2011-04-05 17:11:01','2011-04-06 21:34:03','home','Home',NULL,'<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(53,36,1,1,1,1,'ErrorPage','2011-04-06 21:35:52','2011-04-06 21:35:52','page-not-found-22','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,27,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(54,4,4,1,1,1,'ErrorPage','2011-04-05 17:11:01','2011-04-06 21:36:07','page-not-found','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p>\n<p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,4,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(55,37,1,0,1,0,'Article','2011-04-06 21:38:22','2011-04-06 21:38:22','new-article','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,2,'en_US'),(56,37,2,0,1,0,'Article','2011-04-06 21:38:22','2011-04-06 21:38:49','new-article','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,2,'en_US'),(57,37,3,1,1,1,'Article','2011-04-06 21:38:22','2011-04-06 21:38:57','new-article','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'0.9',2,'en_US'),(58,37,4,1,1,1,'Article','2011-04-06 21:38:22','2011-04-06 21:42:35','new-article','New Article',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'0.9',2,'en_US'),(59,37,5,1,1,1,'Article','2011-04-06 21:38:22','2011-04-06 21:43:37','new-article','New Article',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>',NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'0.9',2,'en_US'),(60,38,1,0,1,0,'IndexPage','2011-04-06 22:11:27','2011-04-06 22:11:27','new-indexpage','New IndexPage',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,28,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(61,38,2,1,1,1,'IndexPage','2011-04-06 22:11:27','2011-04-06 22:11:41','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,28,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(62,38,3,1,1,1,'IndexPage','2011-04-06 22:11:27','2011-04-06 22:20:52','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,28,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(63,39,1,1,1,1,'IndexPage','2011-04-06 22:21:58','2011-04-06 22:22:30','tahanan-2','Tahanan',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,28,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'tl_PH'),(64,2,5,1,1,1,'ArticleHolder','2011-04-05 17:11:01','2011-04-06 22:50:10','articles','Articles',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(65,40,1,0,1,0,'ProductReview','2011-04-06 22:57:42','2011-04-06 22:57:42','new-productreview','New ProductReview',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,29,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(66,41,1,0,1,0,'ProductReview','2011-04-06 22:58:12','2011-04-06 22:58:12','new-productreview','New ProductReview',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,3,'en_US'),(67,41,2,0,1,0,'ProductReview','2011-04-06 22:58:12','2011-04-06 23:30:01','new-productreview','New ProductReview',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'0.9',3,'en_US'),(68,41,3,0,1,0,'ProductReview','2011-04-06 22:58:12','2011-04-06 23:38:47','new-productreview','New ProductReview',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'0.9',3,'en_US'),(69,41,4,1,1,1,'ProductReview','2011-04-06 22:58:12','2011-04-06 23:59:21','new-productreview','New ProductReview',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'0.9',3,'en_US'),(70,41,5,1,1,1,'ProductReview','2011-04-06 22:58:12','2011-04-07 00:00:24','htc-windows-phone','htc-windows-phone',NULL,NULL,'htc-windows-phone',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'0.9',3,'en_US'),(71,41,6,1,1,1,'ProductReview','2011-04-06 22:58:12','2011-04-07 00:14:42','htc-windows-phone','htc-windows-phone',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>','htc-windows-phone',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'0.9',3,'en_US'),(72,42,1,0,1,0,'Article','2011-04-07 00:20:08','2011-04-07 00:20:08','new-article-2','New Article',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,2,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,2,'en_US'),(73,42,2,1,1,1,'Article','2011-04-07 00:20:08','2011-04-07 00:21:00','asdf','asdf',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>','asdf',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'0.9',2,'en_US'),(74,43,1,0,1,0,'ProductReview','2011-04-07 17:24:22','2011-04-07 17:24:22','new-productreview','New ProductReview',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,2,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,3,'en_US'),(75,43,2,1,1,1,'ProductReview','2011-04-07 17:24:22','2011-04-07 17:25:14','psp-3000-modified','PSP 3000 Modified',NULL,NULL,'PSP 3000 Modified',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Saved (new)',NULL,'Inherit','Inherit',NULL,'0.9',3,'en_US'),(76,38,4,0,1,0,'IndexPage','2011-04-06 22:11:27','2011-04-07 18:09:04','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,10,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(77,38,5,0,1,0,'IndexPage','2011-04-06 22:11:27','2011-04-07 18:09:13','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,4,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(78,38,6,1,1,1,'IndexPage','2011-04-06 22:11:27','2011-04-07 18:10:10','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(79,41,7,1,1,1,'ProductReview','2011-04-06 22:58:12','2011-04-07 18:44:50','htc-windows-phone','HTC Windows Phone',NULL,'<div id=\"lipsum\">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus  dignissim imperdiet. Nullam euismod mi tristique lectus ullamcorper  ornare. Nam feugiat, arcu eget condimentum dapibus, erat quam interdum  nisl, in tincidunt felis arcu sit amet neque. Etiam nunc dui, fermentum  et porttitor id, consequat vel ipsum. Cras mi nisi, rhoncus ut luctus  id, sagittis eu dolor. Vestibulum at aliquet massa. Curabitur nulla  elit, lacinia at dictum ac, mollis id tortor. Donec iaculis felis  fringilla mi adipiscing dapibus. Donec vel nunc mauris. Duis egestas  molestie justo, nec luctus massa elementum feugiat. Nullam commodo  ligula sit amet est varius nec aliquam elit placerat. Curabitur  scelerisque, est non facilisis eleifend, metus nulla tincidunt ligula,  in fermentum felis nisi ac ipsum. Mauris auctor interdum tellus, vel  dictum dui mattis non. Donec pretium, purus quis vulputate rhoncus, orci  mi aliquet nibh, et porta metus turpis non eros. Donec ultrices nisi  convallis urna fermentum egestas. Etiam vitae erat sapien. Sed id justo  nibh.</p>\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur  ridiculus mus. Phasellus vulputate adipiscing odio, eget posuere nisl  cursus non. Pellentesque sem felis, tincidunt eget viverra sed, suscipit  et nisi. Maecenas porttitor consequat laoreet. Phasellus ultrices orci  neque, vitae interdum velit. Morbi pretium cursus nunc, ac imperdiet  lorem venenatis id. Praesent ac quam in metus accumsan posuere at quis  ante. Aliquam erat volutpat. Cras odio odio, ornare vel malesuada eget,  pretium sit amet orci. Nunc luctus porttitor est nec suscipit. Nunc  suscipit magna in lectus mollis eget porttitor quam condimentum.  Curabitur eu ligula purus, at placerat magna.</p>\n<p>Donec eu nulla justo. Ut mi est, tempus a sagittis ut, gravida id  libero. Sed placerat ligula in diam sodales cursus. Vestibulum id urna  eros. Pellentesque dui eros, semper a lacinia in, scelerisque at sem.  Duis porta eleifend varius. Proin mollis interdum placerat. Suspendisse  quam diam, dignissim in semper in, gravida tincidunt tellus. Fusce sed  blandit tortor. Nunc eu metus sit amet eros condimentum fermentum.  Vivamus aliquam velit a sem feugiat ac sagittis purus varius. Aenean eu  tortor in risus scelerisque vestibulum. Quisque sed est ante, sed luctus  turpis. Donec eu erat massa, ut rhoncus sapien.</p>\n<p>Nunc lobortis commodo velit sit amet lacinia. Vestibulum quis urna  augue. Nunc ac sem purus, nec ultrices nisi. Nullam dictum convallis  molestie. Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Vivamus ornare aliquam nulla, ac laoreet  orci malesuada nec. Fusce in ante neque, eu ultricies leo. Pellentesque  venenatis massa ut mauris laoreet nec eleifend diam congue. Integer  sodales vestibulum arcu non ultrices. Etiam ultricies fringilla  convallis. Aenean ut lacus sollicitudin tortor suscipit convallis  dapibus egestas ipsum. Duis tincidunt pulvinar mi, a facilisis nulla  gravida nec. Vestibulum ante ipsum primis in faucibus orci luctus et  ultrices posuere cubilia Curae;</p>\n<p>Vivamus ornare orci et sapien vestibulum id condimentum leo faucibus.  Pellentesque hendrerit sodales urna eget porta. Etiam dapibus sapien nec  odio iaculis vestibulum. In eget mi augue, eu blandit tellus.  Pellentesque habitant morbi tristique senectus et netus et malesuada  fames ac turpis egestas. Mauris ut sem ac dolor sagittis accumsan.  Suspendisse in velit quam. Suspendisse potenti. Cras lacus tellus,  faucibus at laoreet sit amet, auctor facilisis est. Nullam sem velit,  tempor eget tempor sollicitudin, tincidunt ut dolor.</p>\n</div>','htc-windows-phone',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'0.9',3,'en_US'),(80,38,7,1,1,1,'IndexPage','2011-04-06 22:11:27','2011-04-07 18:54:43','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(81,2,6,1,1,1,'ArticleHolder','2011-04-05 17:11:01','2011-04-07 18:54:59','articles','Articles',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(82,38,8,1,1,1,'IndexPage','2011-04-06 22:11:27','2011-04-07 18:59:56','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(83,38,9,1,1,1,'IndexPage','2011-04-06 22:11:27','2011-04-08 21:11:02','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'LoggedInUsers','OnlyTheseUsers',NULL,'1.0',0,'en_US'),(84,12,3,1,1,1,'Page','2011-04-05 20:16:14','2011-04-15 16:09:13','exam','Exam',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of  the printing and typesetting industry. Lorem Ipsum has been the  industry\'s standard dummy text ever since the 1500s, when an unknown  printer took a galley of type and scrambled it to make a type specimen  book. It has survived not only five centuries, but also the leap into  electronic typesetting, remaining essentially unchanged. It was  popularised in the 1960s with the release of Letraset sheets containing  Lorem Ipsum passages, and more recently with desktop publishing software  like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<div>\n<p>It  is a long established fact that a reader will be distracted by the  readable content of a page when looking at its layout. The point of  using Lorem Ipsum is that it has a more-or-less normal distribution of  letters, as opposed to using \'Content here, content here\', making it  look like readable English. Many desktop publishing packages and web  page editors now use Lorem Ipsum as their default model text, and a  search for \'lorem ipsum\' will uncover many web sites still in their  infancy. Various versions have evolved over the years, sometimes by  accident, sometimes on purpose (injected humour and the like).</p>\n</div>','Exam',NULL,NULL,NULL,1,1,NULL,0,6,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(85,3,5,1,1,1,'Page','2011-04-05 17:11:01','2011-04-15 17:23:48','products','Products',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint  occaecat cupidatat non proident, sunt in culpa qui officia deserunt  mollit anim id est laborum.</p>\n<p> </p>','Products',NULL,NULL,NULL,1,1,NULL,0,3,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(86,44,1,1,0,0,'ErrorPage','2011-04-15 22:47:20','2011-04-15 22:47:20','page-not-found-2','Page not found',NULL,'<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>',NULL,NULL,NULL,NULL,0,0,NULL,0,29,0,0,'New page',NULL,'Inherit','Inherit',NULL,NULL,0,'en_US'),(87,2,7,1,1,1,'ArticleHolder','2011-04-05 17:11:01','2011-04-16 00:04:40','articles','Articles',NULL,'<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book. It has survived not  only five centuries, but also the leap into electronic typesetting,  remaining essentially unchanged. It was popularised in the 1960s with  the release of Letraset sheets containing Lorem Ipsum passages, and more  recently with desktop publishing software like Aldus PageMaker  including versions of Lorem Ipsum.</p>','Articles',NULL,NULL,NULL,1,1,NULL,0,2,0,0,'Saved (update)',NULL,'Inherit','Inherit',NULL,'1.0',0,'en_US'),(88,38,10,1,1,1,'IndexPage','2011-04-06 22:11:27','2011-05-18 19:00:48','home','Home',NULL,NULL,'Home',NULL,NULL,NULL,1,1,NULL,0,1,0,0,'Saved (update)',NULL,'Anyone','OnlyTheseUsers',NULL,'1.0',0,'en_US');
/*!40000 ALTER TABLE `SiteTree_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Tag` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('Tag') default 'Tag',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Tag` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `Tag` (`Tag`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (6,'Tag','2011-04-09 01:41:54','2011-04-09 01:41:54','tag3'),(5,'Tag','2011-04-09 01:41:54','2011-04-09 01:41:54','tag2'),(4,'Tag','2011-04-09 01:41:54','2011-04-09 01:41:54','tag'),(7,'Tag','2011-04-09 01:41:54','2011-04-09 01:41:54','tag4'),(8,'Tag','2011-04-09 01:41:54','2011-04-09 01:41:54','tag5'),(9,'Tag','2011-04-09 02:02:29','2011-04-09 02:02:29','test'),(10,'Tag','2011-04-09 02:02:29','2011-04-09 02:02:29','testing'),(11,'Tag','2011-04-09 02:02:29','2011-04-09 02:02:29','tester'),(12,'Tag','2011-04-11 15:18:32','2011-04-11 15:18:32','testertesting'),(13,'Tag','2011-04-11 15:48:45','2011-04-11 15:48:45','test2'),(14,'Tag','2011-04-11 15:48:45','2011-04-11 15:48:45','test3'),(15,'Tag','2011-04-11 15:48:45','2011-04-11 15:48:45','test4'),(16,'Tag','2011-04-11 16:44:08','2011-04-11 16:44:08','testtag'),(17,'Tag','2011-04-11 22:31:22','2011-04-11 22:31:22','testtag;');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualPage`
--

DROP TABLE IF EXISTS `VirtualPage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL auto_increment,
  `VersionID` int(11) NOT NULL default '0',
  `CopyContentFromID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `VirtualPage`
--

LOCK TABLES `VirtualPage` WRITE;
/*!40000 ALTER TABLE `VirtualPage` DISABLE KEYS */;
/*!40000 ALTER TABLE `VirtualPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualPage_Live`
--

DROP TABLE IF EXISTS `VirtualPage_Live`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL auto_increment,
  `VersionID` int(11) NOT NULL default '0',
  `CopyContentFromID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `VirtualPage_Live`
--

LOCK TABLES `VirtualPage_Live` WRITE;
/*!40000 ALTER TABLE `VirtualPage_Live` DISABLE KEYS */;
/*!40000 ALTER TABLE `VirtualPage_Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualPage_versions`
--

DROP TABLE IF EXISTS `VirtualPage_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `VirtualPage_versions` (
  `ID` int(11) NOT NULL auto_increment,
  `RecordID` int(11) NOT NULL default '0',
  `Version` int(11) NOT NULL default '0',
  `VersionID` int(11) NOT NULL default '0',
  `CopyContentFromID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `VirtualPage_versions`
--

LOCK TABLES `VirtualPage_versions` WRITE;
/*!40000 ALTER TABLE `VirtualPage_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `VirtualPage_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Widget`
--

DROP TABLE IF EXISTS `Widget`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Widget` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('Widget','PageRatingWidget','FeaturedProductWidget','LatestArticlesWidget','ProductToplistWidget') default 'Widget',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  `Sort` int(11) NOT NULL default '0',
  `Enabled` tinyint(1) unsigned NOT NULL default '0',
  `ParentID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Widget`
--

LOCK TABLES `Widget` WRITE;
/*!40000 ALTER TABLE `Widget` DISABLE KEYS */;
INSERT INTO `Widget` VALUES (1,'LatestArticlesWidget','2011-04-06 22:20:52','2011-04-07 18:10:40',0,1,1),(2,'LatestArticlesWidget','2011-04-07 18:54:43','2011-04-07 18:54:43',0,1,2),(3,'LatestArticlesWidget','2011-04-07 18:54:59','2011-04-07 18:54:59',0,1,3),(4,'LatestArticlesWidget','2011-04-07 18:59:56','2011-05-18 19:00:48',2,1,4),(5,'FeaturedProductWidget','2011-04-07 20:26:15','2011-05-18 19:00:48',1,1,4),(6,'ProductToplistWidget','2011-04-08 00:26:11','2011-05-18 19:00:48',0,1,4),(7,'PageRatingWidget','2011-04-15 16:09:13','2011-04-15 16:09:13',0,1,5),(8,'PageRatingWidget','2011-04-15 17:23:48','2011-04-15 17:23:48',0,1,6),(9,'PageRatingWidget','2011-04-15 19:32:28','2011-04-15 19:32:28',0,1,0),(10,'PageRatingWidget','2011-04-15 19:32:48','2011-04-15 19:32:48',0,1,0),(11,'PageRatingWidget','2011-04-16 00:04:40','2011-04-16 00:04:40',0,1,7);
/*!40000 ALTER TABLE `Widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WidgetArea`
--

DROP TABLE IF EXISTS `WidgetArea`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `WidgetArea` (
  `ID` int(11) NOT NULL auto_increment,
  `ClassName` enum('WidgetArea') default 'WidgetArea',
  `Created` datetime default NULL,
  `LastEdited` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `WidgetArea`
--

LOCK TABLES `WidgetArea` WRITE;
/*!40000 ALTER TABLE `WidgetArea` DISABLE KEYS */;
INSERT INTO `WidgetArea` VALUES (1,'WidgetArea','2011-04-06 22:20:52','2011-04-06 22:20:52'),(2,'WidgetArea','2011-04-07 18:54:43','2011-04-07 18:54:43'),(3,'WidgetArea','2011-04-07 18:54:59','2011-04-07 18:54:59'),(4,'WidgetArea','2011-04-07 18:59:56','2011-04-07 18:59:56'),(5,'WidgetArea','2011-04-15 16:09:13','2011-04-15 16:09:13'),(6,'WidgetArea','2011-04-15 17:23:48','2011-04-15 17:23:48'),(7,'WidgetArea','2011-04-16 00:04:40','2011-04-16 00:04:40'),(8,'WidgetArea','2011-05-18 19:00:48','2011-05-18 19:00:48');
/*!40000 ALTER TABLE `WidgetArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_obsolete_ProductImage`
--

DROP TABLE IF EXISTS `_obsolete_ProductImage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `_obsolete_ProductImage` (
  `ID` int(11) NOT NULL auto_increment,
  `ProductID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `_obsolete_ProductImage`
--

LOCK TABLES `_obsolete_ProductImage` WRITE;
/*!40000 ALTER TABLE `_obsolete_ProductImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `_obsolete_ProductImage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-18 17:03:55
