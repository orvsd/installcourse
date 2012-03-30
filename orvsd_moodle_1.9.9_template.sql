-- MySQL dump 10.11
--
-- Host: columbia.orvsd.org    Database: banks_moodle
-- ------------------------------------------------------
-- Server version	5.0.70-log

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
-- Table structure for table `adodb_logsql`
--

DROP TABLE IF EXISTS `adodb_logsql`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `adodb_logsql` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `created` datetime NOT NULL,
  `sql0` varchar(250) NOT NULL default '',
  `sql1` text,
  `params` text,
  `tracer` text,
  `timer` decimal(16,6) NOT NULL default '0.000000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to save some logs from ADOdb';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `adodb_logsql`
--

LOCK TABLES `adodb_logsql` WRITE;
/*!40000 ALTER TABLE `adodb_logsql` DISABLE KEYS */;
/*!40000 ALTER TABLE `adodb_logsql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_accessibility`
--

DROP TABLE IF EXISTS `mdl_accessibility`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_accessibility` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL,
  `fontsize` decimal(4,1) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for accessibility, please edit me';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_accessibility`
--

LOCK TABLES `mdl_accessibility` WRITE;
/*!40000 ALTER TABLE `mdl_accessibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_accessibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment`
--

DROP TABLE IF EXISTS `mdl_assignment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_assignment` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL default '0',
  `assignmenttype` varchar(50) NOT NULL default '',
  `resubmit` tinyint(2) unsigned NOT NULL default '0',
  `preventlate` tinyint(2) unsigned NOT NULL default '0',
  `emailteachers` tinyint(2) unsigned NOT NULL default '0',
  `var1` bigint(10) default '0',
  `var2` bigint(10) default '0',
  `var3` bigint(10) default '0',
  `var4` bigint(10) default '0',
  `var5` bigint(10) default '0',
  `maxbytes` bigint(10) unsigned NOT NULL default '100000',
  `timedue` bigint(10) unsigned NOT NULL default '0',
  `timeavailable` bigint(10) unsigned NOT NULL default '0',
  `grade` bigint(10) NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_assi_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines assignments';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_assignment`
--

LOCK TABLES `mdl_assignment` WRITE;
/*!40000 ALTER TABLE `mdl_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_submissions`
--

DROP TABLE IF EXISTS `mdl_assignment_submissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `assignment` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `numfiles` bigint(10) unsigned NOT NULL default '0',
  `data1` text,
  `data2` text,
  `grade` bigint(11) NOT NULL default '0',
  `submissioncomment` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL default '0',
  `teacher` bigint(10) unsigned NOT NULL default '0',
  `timemarked` bigint(10) unsigned NOT NULL default '0',
  `mailed` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_assignment_submissions`
--

LOCK TABLES `mdl_assignment_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_audiorecorder`
--

DROP TABLE IF EXISTS `mdl_audiorecorder`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_audiorecorder` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `grade` bigint(10) NOT NULL default '0',
  `audiorecordertype` varchar(50) NOT NULL default 'upload',
  `var1` bigint(10) default '0',
  `var2` bigint(10) default '0',
  `var3` bigint(10) default '0',
  `resubmit` tinyint(2) unsigned NOT NULL default '0',
  `preventlate` tinyint(2) unsigned NOT NULL default '0',
  `maxbytes` bigint(10) unsigned NOT NULL default '100000',
  `timedue` bigint(10) unsigned NOT NULL default '0',
  `timeavailable` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_audi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines audiorecorders';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_audiorecorder`
--

LOCK TABLES `mdl_audiorecorder` WRITE;
/*!40000 ALTER TABLE `mdl_audiorecorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_audiorecorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_audiorecorder_submissions`
--

DROP TABLE IF EXISTS `mdl_audiorecorder_submissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_audiorecorder_submissions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `audiorecorder` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `numfiles` bigint(10) unsigned NOT NULL default '0',
  `data1` text NOT NULL,
  `data2` text NOT NULL,
  `grade` bigint(11) NOT NULL default '0',
  `comment` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL default '0',
  `teacher` bigint(10) unsigned NOT NULL default '0',
  `timemarked` bigint(10) unsigned NOT NULL default '0',
  `mailed` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_audisubm_use_ix` (`userid`),
  KEY `mdl_audisubm_mai_ix` (`mailed`),
  KEY `mdl_audisubm_tim_ix` (`timemarked`),
  KEY `mdl_audisubm_aud_ix` (`audiorecorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted audio files';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_audiorecorder_submissions`
--

LOCK TABLES `mdl_audiorecorder_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_audiorecorder_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_audiorecorder_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_config`
--

DROP TABLE IF EXISTS `mdl_backup_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_backup_config` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_backconf_nam_uix` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='To store backup configuration variables';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_backup_config`
--

LOCK TABLES `mdl_backup_config` WRITE;
/*!40000 ALTER TABLE `mdl_backup_config` DISABLE KEYS */;
INSERT INTO `mdl_backup_config` VALUES (1,'backup_sche_modules','0');
INSERT INTO `mdl_backup_config` VALUES (2,'backup_sche_withuserdata','0');
INSERT INTO `mdl_backup_config` VALUES (3,'backup_sche_metacourse','0');
INSERT INTO `mdl_backup_config` VALUES (4,'backup_sche_users','0');
INSERT INTO `mdl_backup_config` VALUES (5,'backup_sche_logs','0');
INSERT INTO `mdl_backup_config` VALUES (6,'backup_sche_userfiles','0');
INSERT INTO `mdl_backup_config` VALUES (7,'backup_sche_coursefiles','0');
INSERT INTO `mdl_backup_config` VALUES (8,'backup_sche_messages','0');
INSERT INTO `mdl_backup_config` VALUES (9,'backup_sche_keep','1');
INSERT INTO `mdl_backup_config` VALUES (10,'backup_sche_active','0');
INSERT INTO `mdl_backup_config` VALUES (11,'backup_sche_weekdays','0000000');
INSERT INTO `mdl_backup_config` VALUES (12,'backup_sche_hour','0');
INSERT INTO `mdl_backup_config` VALUES (13,'backup_sche_minute','0');
INSERT INTO `mdl_backup_config` VALUES (14,'backup_sche_destination','');
INSERT INTO `mdl_backup_config` VALUES (23,'backup_sche_sitefiles','0');
INSERT INTO `mdl_backup_config` VALUES (33,'backup_sche_gradebook_history','0');
INSERT INTO `mdl_backup_config` VALUES (43,'backup_sche_blogs','0');
/*!40000 ALTER TABLE `mdl_backup_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_courses`
--

DROP TABLE IF EXISTS `mdl_backup_courses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `laststarttime` bigint(10) unsigned NOT NULL default '0',
  `lastendtime` bigint(10) unsigned NOT NULL default '0',
  `laststatus` varchar(1) NOT NULL default '0',
  `nextstarttime` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store every course backup status';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_backup_courses`
--

LOCK TABLES `mdl_backup_courses` WRITE;
/*!40000 ALTER TABLE `mdl_backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_files`
--

DROP TABLE IF EXISTS `mdl_backup_files`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_backup_files` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `backup_code` bigint(10) unsigned NOT NULL default '0',
  `file_type` varchar(10) NOT NULL default '',
  `path` varchar(255) NOT NULL default '',
  `old_id` bigint(10) unsigned NOT NULL default '0',
  `new_id` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_backfile_bacfilpat_uix` (`backup_code`,`file_type`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store and recode ids to user and course files';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_backup_files`
--

LOCK TABLES `mdl_backup_files` WRITE;
/*!40000 ALTER TABLE `mdl_backup_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_ids`
--

DROP TABLE IF EXISTS `mdl_backup_ids`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_backup_ids` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `backup_code` bigint(12) unsigned NOT NULL default '0',
  `table_name` varchar(30) NOT NULL default '',
  `old_id` bigint(10) unsigned NOT NULL default '0',
  `new_id` bigint(10) unsigned NOT NULL default '0',
  `info` mediumtext NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_backids_bactabold_uix` (`backup_code`,`table_name`,`old_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store and convert ids in backup/restore';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_backup_ids`
--

LOCK TABLES `mdl_backup_ids` WRITE;
/*!40000 ALTER TABLE `mdl_backup_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_log`
--

DROP TABLE IF EXISTS `mdl_backup_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_backup_log` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `time` bigint(10) unsigned NOT NULL default '0',
  `laststarttime` bigint(10) unsigned NOT NULL default '0',
  `info` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_backlog_cou_ix` (`courseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store every course backup log info';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_backup_log`
--

LOCK TABLES `mdl_backup_log` WRITE;
/*!40000 ALTER TABLE `mdl_backup_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block`
--

DROP TABLE IF EXISTS `mdl_block`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(40) NOT NULL default '',
  `version` bigint(10) unsigned NOT NULL default '0',
  `cron` bigint(10) unsigned NOT NULL default '0',
  `lastcron` bigint(10) unsigned NOT NULL default '0',
  `visible` tinyint(1) NOT NULL default '1',
  `multiple` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='to store installed blocks';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block`
--

LOCK TABLES `mdl_block` WRITE;
/*!40000 ALTER TABLE `mdl_block` DISABLE KEYS */;
INSERT INTO `mdl_block` VALUES (1,'activity_modules',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (2,'admin',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (3,'admin_bookmarks',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (4,'admin_tree',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (5,'blog_menu',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (6,'blog_tags',2007101509,0,0,1,1);
INSERT INTO `mdl_block` VALUES (7,'calendar_month',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (8,'calendar_upcoming',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (9,'course_list',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (10,'course_summary',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (11,'glossary_random',2007101509,0,0,1,1);
INSERT INTO `mdl_block` VALUES (12,'html',2007101509,0,0,1,1);
INSERT INTO `mdl_block` VALUES (13,'loancalc',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (14,'login',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (15,'mentees',2007101509,0,0,1,1);
INSERT INTO `mdl_block` VALUES (16,'messages',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (17,'mnet_hosts',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (18,'news_items',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (19,'online_users',2007101510,0,0,1,0);
INSERT INTO `mdl_block` VALUES (20,'participants',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (21,'quiz_results',2007101509,0,0,1,1);
INSERT INTO `mdl_block` VALUES (22,'recent_activity',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (23,'rss_client',2007101511,300,1283907623,1,1);
INSERT INTO `mdl_block` VALUES (24,'search',2008031500,1,0,1,0);
INSERT INTO `mdl_block` VALUES (25,'search_forums',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (26,'section_links',2007101511,0,0,1,0);
INSERT INTO `mdl_block` VALUES (27,'site_main_menu',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (28,'social_activities',2007101509,0,0,1,0);
INSERT INTO `mdl_block` VALUES (33,'accessibility',2009082600,0,0,1,0);
INSERT INTO `mdl_block` VALUES (43,'countdown',2008050100,0,0,1,1);
INSERT INTO `mdl_block` VALUES (53,'course_menu',2008092900,0,0,1,0);
INSERT INTO `mdl_block` VALUES (63,'elluminate',2007112700,0,0,1,0);
INSERT INTO `mdl_block` VALUES (73,'exabis_eportfolio',2009010101,0,0,1,0);
INSERT INTO `mdl_block` VALUES (83,'gaccess',2008102402,0,0,1,0);
INSERT INTO `mdl_block` VALUES (93,'gdata',2008072901,1800,0,1,0);
INSERT INTO `mdl_block` VALUES (103,'gmail',2009071901,0,0,1,0);
INSERT INTO `mdl_block` VALUES (113,'ilp',2008053100,0,0,1,0);
INSERT INTO `mdl_block` VALUES (123,'ilp_student_info',2008052900,0,0,1,0);
INSERT INTO `mdl_block` VALUES (133,'inwicast',2008051400,0,0,1,0);
INSERT INTO `mdl_block` VALUES (143,'side_bar',2008050200,0,0,1,1);
INSERT INTO `mdl_block` VALUES (153,'sloodle_menu',2009010801,0,0,1,0);
INSERT INTO `mdl_block` VALUES (163,'tag_flickr',2007101509,0,0,1,1);
INSERT INTO `mdl_block` VALUES (173,'tag_youtube',2007101509,0,0,1,1);
INSERT INTO `mdl_block` VALUES (183,'tags',2007101509,0,0,1,1);
/*!40000 ALTER TABLE `mdl_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_exabeporcate`
--

DROP TABLE IF EXISTS `mdl_block_exabeporcate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_exabeporcate` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `pid` bigint(10) unsigned default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) default NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_blocexab_use_ix` (`userid`),
  KEY `mdl_blocexab_pid_ix` (`pid`),
  KEY `mdl_blocexab_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories for e-portfolio items';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_exabeporcate`
--

LOCK TABLES `mdl_block_exabeporcate` WRITE;
/*!40000 ALTER TABLE `mdl_block_exabeporcate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_exabeporcate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_exabeporitem`
--

DROP TABLE IF EXISTS `mdl_block_exabeporitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_exabeporitem` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `type` enum('link','file','note') NOT NULL default 'note',
  `categoryid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `attachment` varchar(100) NOT NULL default '',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `shareall` smallint(3) unsigned NOT NULL default '0',
  `externaccess` smallint(3) unsigned NOT NULL default '0',
  `externcomment` smallint(3) unsigned NOT NULL default '0',
  `sortorder` bigint(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_blocexab_use2_ix` (`userid`),
  KEY `mdl_blocexab_cou2_ix` (`courseid`),
  KEY `mdl_blocexab_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User items';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_exabeporitem`
--

LOCK TABLES `mdl_block_exabeporitem` WRITE;
/*!40000 ALTER TABLE `mdl_block_exabeporitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_exabeporitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_exabeporitemcomm`
--

DROP TABLE IF EXISTS `mdl_block_exabeporitemcomm`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_exabeporitemcomm` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `itemid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `entry` mediumtext NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_blocexab_use4_ix` (`userid`),
  KEY `mdl_blocexab_ite2_ix` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='comments for the items';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_exabeporitemcomm`
--

LOCK TABLES `mdl_block_exabeporitemcomm` WRITE;
/*!40000 ALTER TABLE `mdl_block_exabeporitemcomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_exabeporitemcomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_exabeporitemshar`
--

DROP TABLE IF EXISTS `mdl_block_exabeporitemshar`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_exabeporitemshar` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `itemid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `original` bigint(10) unsigned NOT NULL default '0',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_blocexab_use3_ix` (`userid`),
  KEY `mdl_blocexab_cou3_ix` (`courseid`),
  KEY `mdl_blocexab_ite_ix` (`itemid`),
  KEY `mdl_blocexab_ori_ix` (`original`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='block_exabeporitemshar table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_exabeporitemshar`
--

LOCK TABLES `mdl_block_exabeporitemshar` WRITE;
/*!40000 ALTER TABLE `mdl_block_exabeporitemshar` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_exabeporitemshar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_exabeporuser`
--

DROP TABLE IF EXISTS `mdl_block_exabeporuser`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_exabeporuser` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `user_id` bigint(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `persinfo_timemodified` bigint(10) unsigned NOT NULL default '0',
  `persinfo_externaccess` tinyint(1) unsigned NOT NULL,
  `itemsort` varchar(16) NOT NULL default '',
  `user_hash` varchar(8) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_blocexab_use_uix` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user in the e-portfolio';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_exabeporuser`
--

LOCK TABLES `mdl_block_exabeporuser` WRITE;
/*!40000 ALTER TABLE `mdl_block_exabeporuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_exabeporuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_exabeporview`
--

DROP TABLE IF EXISTS `mdl_block_exabeporview`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_exabeporview` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned default NULL,
  `name` text,
  `description` longtext,
  `timemodified` bigint(10) unsigned default NULL,
  `shareall` smallint(3) unsigned default NULL,
  `externaccess` smallint(3) unsigned default NULL,
  `externcomment` smallint(3) unsigned default NULL,
  `hash` varchar(8) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_blocexab_has_uix` (`hash`),
  KEY `mdl_blocexab_use5_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='views';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_exabeporview`
--

LOCK TABLES `mdl_block_exabeporview` WRITE;
/*!40000 ALTER TABLE `mdl_block_exabeporview` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_exabeporview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_exabeporviewblock`
--

DROP TABLE IF EXISTS `mdl_block_exabeporviewblock`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_exabeporviewblock` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `viewid` bigint(10) unsigned default NULL,
  `positionx` bigint(10) unsigned default NULL,
  `positiony` bigint(10) unsigned default NULL,
  `type` text,
  `itemid` bigint(10) unsigned default NULL,
  `text` longtext,
  PRIMARY KEY  (`id`),
  KEY `mdl_blocexab_vie_ix` (`viewid`),
  KEY `mdl_blocexab_ite3_ix` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blocks on the view';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_exabeporviewblock`
--

LOCK TABLES `mdl_block_exabeporviewblock` WRITE;
/*!40000 ALTER TABLE `mdl_block_exabeporviewblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_exabeporviewblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_exabeporviewshar`
--

DROP TABLE IF EXISTS `mdl_block_exabeporviewshar`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_exabeporviewshar` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `viewid` bigint(20) unsigned default NULL,
  `userid` bigint(20) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_blocexab_vie2_ix` (`viewid`),
  KEY `mdl_blocexab_use6_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='information to which users the view is shared';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_exabeporviewshar`
--

LOCK TABLES `mdl_block_exabeporviewshar` WRITE;
/*!40000 ALTER TABLE `mdl_block_exabeporviewshar` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_exabeporviewshar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_gdata_gapps`
--

DROP TABLE IF EXISTS `mdl_block_gdata_gapps`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_gdata_gapps` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `username` varchar(100) default NULL,
  `password` varchar(32) default NULL,
  `remove` smallint(3) unsigned NOT NULL default '0',
  `lastsync` bigint(10) unsigned NOT NULL default '0',
  `status` varchar(30) default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_blocgdatgapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Moodle to Google Apps sync data';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_gdata_gapps`
--

LOCK TABLES `mdl_block_gdata_gapps` WRITE;
/*!40000 ALTER TABLE `mdl_block_gdata_gapps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_gdata_gapps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_gmail`
--

DROP TABLE IF EXISTS `mdl_block_gmail`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_gmail` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for gmail, please edit me';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_gmail`
--

LOCK TABLES `mdl_block_gmail` WRITE;
/*!40000 ALTER TABLE `mdl_block_gmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_gmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_gmail_oauth_consumer_token`
--

DROP TABLE IF EXISTS `mdl_block_gmail_oauth_consumer_token`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_gmail_oauth_consumer_token` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `user_id` bigint(11) unsigned NOT NULL,
  `token` varchar(64) NOT NULL default '',
  `token_secret` varchar(64) NOT NULL default '',
  `token_type` enum('request','authorized','access') default NULL,
  `timestamp` bigint(12) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='block_gmail_oauth_consumer_token for token management';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_gmail_oauth_consumer_token`
--

LOCK TABLES `mdl_block_gmail_oauth_consumer_token` WRITE;
/*!40000 ALTER TABLE `mdl_block_gmail_oauth_consumer_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_gmail_oauth_consumer_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_instance`
--

DROP TABLE IF EXISTS `mdl_block_instance`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_instance` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `blockid` bigint(10) unsigned NOT NULL default '0',
  `pageid` bigint(10) unsigned NOT NULL default '0',
  `pagetype` varchar(20) NOT NULL default '',
  `position` varchar(10) NOT NULL default '',
  `weight` smallint(3) NOT NULL default '0',
  `visible` tinyint(1) NOT NULL default '0',
  `configdata` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_blocinst_pag_ix` (`pageid`),
  KEY `mdl_blocinst_pag2_ix` (`pagetype`),
  KEY `mdl_blocinst_blo_ix` (`blockid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='to store block instances in pages';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_instance`
--

LOCK TABLES `mdl_block_instance` WRITE;
/*!40000 ALTER TABLE `mdl_block_instance` DISABLE KEYS */;
INSERT INTO `mdl_block_instance` VALUES (1,27,1,'course-view','l',0,1,'');
INSERT INTO `mdl_block_instance` VALUES (2,4,1,'course-view','l',1,1,'');
INSERT INTO `mdl_block_instance` VALUES (3,10,1,'course-view','r',0,1,'');
INSERT INTO `mdl_block_instance` VALUES (4,7,1,'course-view','r',1,1,'');
INSERT INTO `mdl_block_instance` VALUES (5,4,0,'admin','l',0,1,'');
INSERT INTO `mdl_block_instance` VALUES (6,3,0,'admin','l',1,1,'');
/*!40000 ALTER TABLE `mdl_block_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_pinned`
--

DROP TABLE IF EXISTS `mdl_block_pinned`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_pinned` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `blockid` bigint(10) unsigned NOT NULL default '0',
  `pagetype` varchar(20) NOT NULL default '',
  `position` varchar(10) NOT NULL default '',
  `weight` smallint(3) NOT NULL default '0',
  `visible` tinyint(1) NOT NULL default '0',
  `configdata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_blocpinn_pag_ix` (`pagetype`),
  KEY `mdl_blocpinn_blo_ix` (`blockid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to pin blocks';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_pinned`
--

LOCK TABLES `mdl_block_pinned` WRITE;
/*!40000 ALTER TABLE `mdl_block_pinned` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_pinned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_rss_client`
--

DROP TABLE IF EXISTS `mdl_block_rss_client`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `title` text NOT NULL,
  `preferredtitle` varchar(64) NOT NULL default '',
  `description` text NOT NULL,
  `shared` tinyint(2) unsigned NOT NULL default '0',
  `url` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_rss_client`
--

LOCK TABLES `mdl_block_rss_client` WRITE;
/*!40000 ALTER TABLE `mdl_block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_rss_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_search_documents`
--

DROP TABLE IF EXISTS `mdl_block_search_documents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_block_search_documents` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `docid` varchar(32) NOT NULL default '',
  `doctype` varchar(32) NOT NULL default 'none',
  `itemtype` varchar(32) NOT NULL default 'standard',
  `title` varchar(255) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `docdate` bigint(10) unsigned NOT NULL default '0',
  `updated` bigint(10) unsigned NOT NULL default '0',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `groupid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_blocseardocu_doc_ix` (`docid`),
  KEY `mdl_blocseardocu_doc2_ix` (`doctype`),
  KEY `mdl_blocseardocu_ite_ix` (`itemtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='table to store search index backups';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_block_search_documents`
--

LOCK TABLES `mdl_block_search_documents` WRITE;
/*!40000 ALTER TABLE `mdl_block_search_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_search_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book`
--

DROP TABLE IF EXISTS `mdl_book`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_book` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `summary` mediumtext NOT NULL,
  `numbering` smallint(4) unsigned NOT NULL default '0',
  `disableprinting` tinyint(2) unsigned NOT NULL default '2',
  `customtitles` tinyint(2) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_book`
--

LOCK TABLES `mdl_book` WRITE;
/*!40000 ALTER TABLE `mdl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book_chapters`
--

DROP TABLE IF EXISTS `mdl_book_chapters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL auto_increment,
  `bookid` bigint(10) unsigned NOT NULL default '0',
  `pagenum` bigint(10) unsigned NOT NULL default '0',
  `subchapter` bigint(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `content` longtext NOT NULL,
  `hidden` tinyint(2) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `importsrc` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_book_chapters`
--

LOCK TABLES `mdl_book_chapters` WRITE;
/*!40000 ALTER TABLE `mdl_book_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_filters`
--

DROP TABLE IF EXISTS `mdl_cache_filters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `filter` varchar(32) NOT NULL default '',
  `version` bigint(10) unsigned NOT NULL default '0',
  `md5key` varchar(32) NOT NULL default '',
  `rawtext` text NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_cache_filters`
--

LOCK TABLES `mdl_cache_filters` WRITE;
/*!40000 ALTER TABLE `mdl_cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_flags`
--

DROP TABLE IF EXISTS `mdl_cache_flags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `flagtype` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `value` mediumtext NOT NULL,
  `expiry` bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_cache_flags`
--

LOCK TABLES `mdl_cache_flags` WRITE;
/*!40000 ALTER TABLE `mdl_cache_flags` DISABLE KEYS */;
INSERT INTO `mdl_cache_flags` VALUES (3,'accesslib/dirtycontexts','/1',1283907039,'1',1283914239);
/*!40000 ALTER TABLE `mdl_cache_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_text`
--

DROP TABLE IF EXISTS `mdl_cache_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_cache_text` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `md5key` varchar(32) NOT NULL default '',
  `formattedtext` longtext NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_cache_text`
--

LOCK TABLES `mdl_cache_text` WRITE;
/*!40000 ALTER TABLE `mdl_cache_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_capabilities`
--

DROP TABLE IF EXISTS `mdl_capabilities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `captype` varchar(50) NOT NULL default '',
  `contextlevel` bigint(10) unsigned NOT NULL default '0',
  `component` varchar(100) NOT NULL default '',
  `riskbitmask` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1804 DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_capabilities`
--

LOCK TABLES `mdl_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_capabilities` VALUES (1,'moodle/site:doanything','admin',10,'moodle',62);
INSERT INTO `mdl_capabilities` VALUES (2,'moodle/legacy:guest','legacy',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (3,'moodle/legacy:user','legacy',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (4,'moodle/legacy:student','legacy',10,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (5,'moodle/legacy:teacher','legacy',10,'moodle',24);
INSERT INTO `mdl_capabilities` VALUES (6,'moodle/legacy:editingteacher','legacy',10,'moodle',28);
INSERT INTO `mdl_capabilities` VALUES (7,'moodle/legacy:coursecreator','legacy',10,'moodle',28);
INSERT INTO `mdl_capabilities` VALUES (8,'moodle/legacy:admin','legacy',10,'moodle',62);
INSERT INTO `mdl_capabilities` VALUES (9,'moodle/site:config','write',10,'moodle',62);
INSERT INTO `mdl_capabilities` VALUES (10,'moodle/site:readallmessages','read',10,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (11,'moodle/site:sendmessage','write',10,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (12,'moodle/site:approvecourse','write',10,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (13,'moodle/site:import','write',50,'moodle',28);
INSERT INTO `mdl_capabilities` VALUES (14,'moodle/site:backup','write',50,'moodle',28);
INSERT INTO `mdl_capabilities` VALUES (15,'moodle/site:restore','write',50,'moodle',28);
INSERT INTO `mdl_capabilities` VALUES (16,'moodle/site:manageblocks','write',80,'moodle',20);
INSERT INTO `mdl_capabilities` VALUES (17,'moodle/site:accessallgroups','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (18,'moodle/site:viewfullnames','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (19,'moodle/site:viewreports','read',50,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (20,'moodle/site:trustcontent','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (21,'moodle/site:uploadusers','write',10,'moodle',24);
INSERT INTO `mdl_capabilities` VALUES (22,'moodle/user:create','write',10,'moodle',24);
INSERT INTO `mdl_capabilities` VALUES (23,'moodle/user:delete','write',10,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (24,'moodle/user:update','write',10,'moodle',24);
INSERT INTO `mdl_capabilities` VALUES (25,'moodle/user:viewdetails','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (26,'moodle/user:viewhiddendetails','read',50,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (28,'moodle/user:loginas','write',50,'moodle',30);
INSERT INTO `mdl_capabilities` VALUES (29,'moodle/role:assign','write',50,'moodle',28);
INSERT INTO `mdl_capabilities` VALUES (30,'moodle/role:override','write',50,'moodle',28);
INSERT INTO `mdl_capabilities` VALUES (31,'moodle/role:manage','write',10,'moodle',28);
INSERT INTO `mdl_capabilities` VALUES (32,'moodle/role:unassignself','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (33,'moodle/role:viewhiddenassigns','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (34,'moodle/role:switchroles','read',50,'moodle',12);
INSERT INTO `mdl_capabilities` VALUES (723,'mod/book:print','read',70,'mod/book',0);
INSERT INTO `mdl_capabilities` VALUES (713,'mod/book:import','write',70,'mod/book',4);
INSERT INTO `mdl_capabilities` VALUES (703,'mod/book:edit','write',70,'mod/book',4);
INSERT INTO `mdl_capabilities` VALUES (39,'moodle/course:create','write',40,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (40,'moodle/course:delete','write',50,'moodle',32);
INSERT INTO `mdl_capabilities` VALUES (41,'moodle/course:update','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (42,'moodle/course:view','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (43,'moodle/course:bulkmessaging','write',50,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (44,'moodle/course:viewhiddenuserfields','read',50,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (45,'moodle/course:viewhiddencourses','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (46,'moodle/course:visibility','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (47,'moodle/course:managefiles','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (48,'moodle/course:manageactivities','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (49,'moodle/course:managemetacourse','write',50,'moodle',12);
INSERT INTO `mdl_capabilities` VALUES (50,'moodle/course:activityvisibility','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (51,'moodle/course:viewhiddenactivities','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (52,'moodle/course:viewparticipants','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (53,'moodle/course:viewscales','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (54,'moodle/course:managescales','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (55,'moodle/course:managegroups','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (56,'moodle/course:reset','write',50,'moodle',32);
INSERT INTO `mdl_capabilities` VALUES (57,'moodle/blog:view','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (58,'moodle/blog:create','write',10,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (693,'mod/book:viewhiddenchapters','read',70,'mod/book',0);
INSERT INTO `mdl_capabilities` VALUES (683,'mod/book:read','read',70,'mod/book',0);
INSERT INTO `mdl_capabilities` VALUES (61,'moodle/blog:manageentries','write',50,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (62,'moodle/calendar:manageownentries','write',50,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (63,'moodle/calendar:manageentries','write',50,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (64,'moodle/user:editprofile','read',30,'moodle',24);
INSERT INTO `mdl_capabilities` VALUES (65,'moodle/user:readuserposts','read',30,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (66,'moodle/user:readuserblogs','read',30,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (67,'moodle/user:viewuseractivitiesreport','read',30,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (673,'mod/audiorecorder:grade','write',70,'mod/audiorecorder',0);
INSERT INTO `mdl_capabilities` VALUES (70,'moodle/question:managecategory','write',50,'moodle',20);
INSERT INTO `mdl_capabilities` VALUES (663,'mod/audiorecorder:submit','write',70,'mod/audiorecorder',0);
INSERT INTO `mdl_capabilities` VALUES (72,'moodle/site:doclinks','read',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (73,'moodle/course:sectionvisibility','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (74,'moodle/course:useremail','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (75,'moodle/course:viewhiddensections','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (76,'moodle/course:setcurrentsection','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (653,'mod/audiorecorder:view','read',70,'mod/audiorecorder',0);
INSERT INTO `mdl_capabilities` VALUES (79,'moodle/site:mnetlogintoremote','read',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (80,'moodle/my:manageblocks','write',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (81,'mod/assignment:view','read',70,'mod/assignment',0);
INSERT INTO `mdl_capabilities` VALUES (82,'mod/assignment:submit','write',70,'mod/assignment',0);
INSERT INTO `mdl_capabilities` VALUES (83,'mod/assignment:grade','write',70,'mod/assignment',4);
INSERT INTO `mdl_capabilities` VALUES (84,'mod/chat:chat','write',70,'mod/chat',16);
INSERT INTO `mdl_capabilities` VALUES (85,'mod/chat:readlog','read',70,'mod/chat',0);
INSERT INTO `mdl_capabilities` VALUES (86,'mod/chat:deletelog','write',70,'mod/chat',0);
INSERT INTO `mdl_capabilities` VALUES (87,'mod/choice:choose','write',70,'mod/choice',0);
INSERT INTO `mdl_capabilities` VALUES (88,'mod/choice:readresponses','read',70,'mod/choice',0);
INSERT INTO `mdl_capabilities` VALUES (89,'mod/choice:deleteresponses','write',70,'mod/choice',0);
INSERT INTO `mdl_capabilities` VALUES (90,'mod/choice:downloadresponses','read',70,'mod/choice',0);
INSERT INTO `mdl_capabilities` VALUES (91,'mod/data:viewentry','read',70,'mod/data',0);
INSERT INTO `mdl_capabilities` VALUES (92,'mod/data:writeentry','write',70,'mod/data',16);
INSERT INTO `mdl_capabilities` VALUES (93,'mod/data:comment','write',70,'mod/data',16);
INSERT INTO `mdl_capabilities` VALUES (94,'mod/data:viewrating','read',70,'mod/data',0);
INSERT INTO `mdl_capabilities` VALUES (95,'mod/data:rate','write',70,'mod/data',0);
INSERT INTO `mdl_capabilities` VALUES (96,'mod/data:approve','write',70,'mod/data',16);
INSERT INTO `mdl_capabilities` VALUES (97,'mod/data:manageentries','write',70,'mod/data',16);
INSERT INTO `mdl_capabilities` VALUES (98,'mod/data:managecomments','write',70,'mod/data',16);
INSERT INTO `mdl_capabilities` VALUES (99,'mod/data:managetemplates','write',70,'mod/data',20);
INSERT INTO `mdl_capabilities` VALUES (100,'mod/data:viewalluserpresets','read',70,'mod/data',0);
INSERT INTO `mdl_capabilities` VALUES (101,'mod/data:manageuserpresets','write',70,'mod/data',20);
INSERT INTO `mdl_capabilities` VALUES (102,'mod/forum:viewdiscussion','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (103,'mod/forum:viewhiddentimedposts','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (104,'mod/forum:startdiscussion','write',70,'mod/forum',16);
INSERT INTO `mdl_capabilities` VALUES (105,'mod/forum:replypost','write',70,'mod/forum',16);
INSERT INTO `mdl_capabilities` VALUES (106,'mod/forum:addnews','write',70,'mod/forum',16);
INSERT INTO `mdl_capabilities` VALUES (107,'mod/forum:replynews','write',70,'mod/forum',16);
INSERT INTO `mdl_capabilities` VALUES (108,'mod/forum:viewrating','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (109,'mod/forum:viewanyrating','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (110,'mod/forum:rate','write',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (111,'mod/forum:createattachment','write',70,'mod/forum',16);
INSERT INTO `mdl_capabilities` VALUES (112,'mod/forum:deleteownpost','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (113,'mod/forum:deleteanypost','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (114,'mod/forum:splitdiscussions','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (115,'mod/forum:movediscussions','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (116,'mod/forum:editanypost','write',70,'mod/forum',16);
INSERT INTO `mdl_capabilities` VALUES (117,'mod/forum:viewqandawithoutposting','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (118,'mod/forum:viewsubscribers','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (119,'mod/forum:managesubscriptions','read',70,'mod/forum',16);
INSERT INTO `mdl_capabilities` VALUES (120,'mod/forum:initialsubscriptions','read',70,'mod/forum',0);
INSERT INTO `mdl_capabilities` VALUES (121,'mod/forum:throttlingapplies','write',70,'mod/forum',16);
INSERT INTO `mdl_capabilities` VALUES (122,'mod/glossary:write','write',70,'mod/glossary',16);
INSERT INTO `mdl_capabilities` VALUES (123,'mod/glossary:manageentries','write',70,'mod/glossary',16);
INSERT INTO `mdl_capabilities` VALUES (124,'mod/glossary:managecategories','write',70,'mod/glossary',16);
INSERT INTO `mdl_capabilities` VALUES (125,'mod/glossary:comment','write',70,'mod/glossary',16);
INSERT INTO `mdl_capabilities` VALUES (126,'mod/glossary:managecomments','write',70,'mod/glossary',16);
INSERT INTO `mdl_capabilities` VALUES (127,'mod/glossary:import','write',70,'mod/glossary',16);
INSERT INTO `mdl_capabilities` VALUES (128,'mod/glossary:export','read',70,'mod/glossary',0);
INSERT INTO `mdl_capabilities` VALUES (129,'mod/glossary:approve','write',70,'mod/glossary',16);
INSERT INTO `mdl_capabilities` VALUES (130,'mod/glossary:rate','write',70,'mod/glossary',0);
INSERT INTO `mdl_capabilities` VALUES (131,'mod/glossary:viewrating','read',70,'mod/glossary',0);
INSERT INTO `mdl_capabilities` VALUES (132,'mod/hotpot:attempt','read',70,'mod/hotpot',0);
INSERT INTO `mdl_capabilities` VALUES (133,'mod/hotpot:viewreport','read',70,'mod/hotpot',0);
INSERT INTO `mdl_capabilities` VALUES (134,'mod/hotpot:grade','read',70,'mod/hotpot',0);
INSERT INTO `mdl_capabilities` VALUES (135,'mod/hotpot:deleteattempt','read',70,'mod/hotpot',0);
INSERT INTO `mdl_capabilities` VALUES (136,'mod/lams:participate','write',70,'mod/lams',0);
INSERT INTO `mdl_capabilities` VALUES (137,'mod/lams:manage','write',70,'mod/lams',0);
INSERT INTO `mdl_capabilities` VALUES (138,'mod/lesson:edit','write',70,'mod/lesson',4);
INSERT INTO `mdl_capabilities` VALUES (139,'mod/lesson:manage','write',70,'mod/lesson',0);
INSERT INTO `mdl_capabilities` VALUES (140,'mod/quiz:view','read',70,'mod/quiz',0);
INSERT INTO `mdl_capabilities` VALUES (141,'mod/quiz:attempt','write',70,'mod/quiz',16);
INSERT INTO `mdl_capabilities` VALUES (142,'mod/quiz:manage','write',70,'mod/quiz',16);
INSERT INTO `mdl_capabilities` VALUES (143,'mod/quiz:preview','write',70,'mod/quiz',0);
INSERT INTO `mdl_capabilities` VALUES (144,'mod/quiz:grade','write',70,'mod/quiz',16);
INSERT INTO `mdl_capabilities` VALUES (145,'mod/quiz:viewreports','read',70,'mod/quiz',8);
INSERT INTO `mdl_capabilities` VALUES (146,'mod/quiz:deleteattempts','write',70,'mod/quiz',32);
INSERT INTO `mdl_capabilities` VALUES (147,'mod/quiz:ignoretimelimits','read',70,'mod/quiz',0);
INSERT INTO `mdl_capabilities` VALUES (148,'mod/scorm:viewreport','read',70,'mod/scorm',0);
INSERT INTO `mdl_capabilities` VALUES (149,'mod/scorm:skipview','write',70,'mod/scorm',0);
INSERT INTO `mdl_capabilities` VALUES (150,'mod/scorm:savetrack','write',70,'mod/scorm',0);
INSERT INTO `mdl_capabilities` VALUES (151,'mod/scorm:viewscores','read',70,'mod/scorm',0);
INSERT INTO `mdl_capabilities` VALUES (152,'mod/survey:participate','read',70,'mod/survey',0);
INSERT INTO `mdl_capabilities` VALUES (153,'mod/survey:readresponses','read',70,'mod/survey',0);
INSERT INTO `mdl_capabilities` VALUES (154,'mod/survey:download','read',70,'mod/survey',0);
INSERT INTO `mdl_capabilities` VALUES (155,'mod/wiki:participate','write',70,'mod/wiki',16);
INSERT INTO `mdl_capabilities` VALUES (156,'mod/wiki:manage','write',70,'mod/wiki',16);
INSERT INTO `mdl_capabilities` VALUES (157,'mod/wiki:overridelock','write',70,'mod/wiki',0);
INSERT INTO `mdl_capabilities` VALUES (158,'mod/workshop:participate','write',70,'mod/workshop',16);
INSERT INTO `mdl_capabilities` VALUES (159,'mod/workshop:manage','write',70,'mod/workshop',16);
INSERT INTO `mdl_capabilities` VALUES (160,'block/rss_client:createprivatefeeds','write',80,'block/rss_client',0);
INSERT INTO `mdl_capabilities` VALUES (161,'block/rss_client:createsharedfeeds','write',80,'block/rss_client',16);
INSERT INTO `mdl_capabilities` VALUES (162,'block/rss_client:manageownfeeds','write',80,'block/rss_client',0);
INSERT INTO `mdl_capabilities` VALUES (163,'block/rss_client:manageanyfeeds','write',80,'block/rss_client',16);
INSERT INTO `mdl_capabilities` VALUES (164,'enrol/authorize:managepayments','write',10,'enrol/authorize',8);
INSERT INTO `mdl_capabilities` VALUES (165,'enrol/authorize:uploadcsv','write',10,'enrol/authorize',4);
INSERT INTO `mdl_capabilities` VALUES (173,'moodle/backup:userinfo','read',50,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (183,'moodle/restore:createuser','write',10,'moodle',24);
INSERT INTO `mdl_capabilities` VALUES (193,'moodle/restore:userinfo','write',50,'moodle',30);
INSERT INTO `mdl_capabilities` VALUES (203,'moodle/restore:rolldates','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (213,'moodle/site:langeditmaster','write',10,'moodle',6);
INSERT INTO `mdl_capabilities` VALUES (223,'moodle/site:langeditlocal','write',10,'moodle',6);
INSERT INTO `mdl_capabilities` VALUES (233,'moodle/role:safeoverride','write',50,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (243,'moodle/category:manage','write',40,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (253,'moodle/category:viewhiddencategories','read',40,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (263,'moodle/course:request','write',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (273,'moodle/course:changefullname','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (283,'moodle/course:changeshortname','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (293,'moodle/course:changeidnumber','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (303,'moodle/course:changecategory','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (313,'moodle/course:changesummary','write',50,'moodle',4);
INSERT INTO `mdl_capabilities` VALUES (323,'moodle/site:viewparticipants','read',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (333,'moodle/calendar:managegroupentries','write',50,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (343,'moodle/user:editownprofile','write',10,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (353,'moodle/user:changeownpassword','write',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (363,'moodle/question:add','write',50,'moodle',20);
INSERT INTO `mdl_capabilities` VALUES (373,'moodle/question:editmine','write',50,'moodle',20);
INSERT INTO `mdl_capabilities` VALUES (383,'moodle/question:editall','write',50,'moodle',20);
INSERT INTO `mdl_capabilities` VALUES (393,'moodle/question:viewmine','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (403,'moodle/question:viewall','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (413,'moodle/question:usemine','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (423,'moodle/question:useall','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (433,'moodle/question:movemine','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (443,'moodle/question:moveall','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (453,'moodle/question:config','write',10,'moodle',2);
INSERT INTO `mdl_capabilities` VALUES (463,'moodle/grade:viewall','read',50,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (473,'moodle/grade:view','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (483,'moodle/grade:viewhidden','read',50,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (493,'moodle/grade:import','write',50,'moodle',12);
INSERT INTO `mdl_capabilities` VALUES (503,'moodle/grade:export','read',50,'moodle',8);
INSERT INTO `mdl_capabilities` VALUES (513,'moodle/grade:manage','write',50,'moodle',12);
INSERT INTO `mdl_capabilities` VALUES (523,'moodle/grade:edit','write',50,'moodle',12);
INSERT INTO `mdl_capabilities` VALUES (533,'moodle/grade:manageoutcomes','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (543,'moodle/grade:manageletters','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (553,'moodle/grade:hide','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (563,'moodle/grade:lock','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (573,'moodle/grade:unlock','write',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (583,'moodle/notes:view','read',50,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (593,'moodle/notes:manage','write',50,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (603,'moodle/tag:manage','write',10,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (613,'moodle/tag:create','write',10,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (623,'moodle/tag:edit','write',10,'moodle',16);
INSERT INTO `mdl_capabilities` VALUES (633,'moodle/tag:editblocks','write',10,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (643,'moodle/block:view','read',80,'moodle',0);
INSERT INTO `mdl_capabilities` VALUES (733,'mod/book:exportimscp','read',70,'mod/book',0);
INSERT INTO `mdl_capabilities` VALUES (743,'mod/elluminate:view','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (753,'mod/elluminate:manage','write',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (763,'mod/elluminate:moderatemeeting','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (773,'mod/elluminate:enablerecordings','write',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (783,'mod/elluminate:viewrecordings','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (793,'mod/elluminate:deleterecordings','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (803,'mod/elluminate:deleteanyrecordings','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (813,'mod/elluminate:managemoderators','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (823,'mod/elluminate:manageparticipants','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (833,'mod/elluminate:viewmoderators','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (843,'mod/elluminate:viewparticipants','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (853,'mod/elluminate:viewattendance','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (863,'mod/elluminate:manageattendance','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (873,'mod/elluminate:manageseats','read',70,'mod/elluminate',0);
INSERT INTO `mdl_capabilities` VALUES (883,'mod/ilpconcern:view','read',70,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (893,'mod/ilpconcern:addownreport1','write',10,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (903,'mod/ilpconcern:addownreport2','write',10,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (913,'mod/ilpconcern:addownreport3','write',10,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (923,'mod/ilpconcern:addreport1','write',70,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (933,'mod/ilpconcern:addreport2','write',70,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (943,'mod/ilpconcern:addreport3','write',70,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (953,'mod/ilpconcern:updateconcernstatus','write',70,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (963,'mod/ilpconcern:updatestudentstatus','write',70,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (973,'mod/ilpconcern:addowncomment','write',10,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (983,'mod/ilpconcern:addcomment','write',70,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (993,'mod/ilpconcern:viewclass','read',70,'mod/ilpconcern',0);
INSERT INTO `mdl_capabilities` VALUES (1003,'mod/ilptarget:view','read',70,'mod/ilptarget',0);
INSERT INTO `mdl_capabilities` VALUES (1013,'mod/ilptarget:addowntarget','write',10,'mod/ilptarget',0);
INSERT INTO `mdl_capabilities` VALUES (1023,'mod/ilptarget:addtarget','write',70,'mod/ilptarget',0);
INSERT INTO `mdl_capabilities` VALUES (1033,'mod/ilptarget:updatetargetstatus','write',70,'mod/ilptarget',0);
INSERT INTO `mdl_capabilities` VALUES (1043,'mod/ilptarget:addowncomment','write',10,'mod/ilptarget',0);
INSERT INTO `mdl_capabilities` VALUES (1053,'mod/ilptarget:addcomment','write',70,'mod/ilptarget',0);
INSERT INTO `mdl_capabilities` VALUES (1063,'mod/ilptarget:viewclass','read',70,'mod/ilptarget',0);
INSERT INTO `mdl_capabilities` VALUES (1073,'mod/lightboxgallery:addcomment','write',70,'mod/lightboxgallery',16);
INSERT INTO `mdl_capabilities` VALUES (1083,'mod/lightboxgallery:addimage','write',70,'mod/lightboxgallery',20);
INSERT INTO `mdl_capabilities` VALUES (1093,'mod/lightboxgallery:edit','write',70,'mod/lightboxgallery',20);
INSERT INTO `mdl_capabilities` VALUES (1103,'mod/lightboxgallery:viewcomments','read',70,'mod/lightboxgallery',0);
INSERT INTO `mdl_capabilities` VALUES (1113,'mod/map:setownlocation','write',70,'mod/map',0);
INSERT INTO `mdl_capabilities` VALUES (1123,'mod/map:autoupdatelocation','write',70,'mod/map',0);
INSERT INTO `mdl_capabilities` VALUES (1133,'mod/map:setotherslocation','write',70,'mod/map',0);
INSERT INTO `mdl_capabilities` VALUES (1143,'mod/map:setextralocation','write',70,'mod/map',0);
INSERT INTO `mdl_capabilities` VALUES (1153,'mod/map:alwayssetextralocation','write',70,'mod/map',0);
INSERT INTO `mdl_capabilities` VALUES (1163,'mod/map:viewmap','read',70,'mod/map',0);
INSERT INTO `mdl_capabilities` VALUES (1173,'mod/questionnaire:view','read',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1183,'mod/questionnaire:submit','write',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1193,'mod/questionnaire:viewsingleresponse','read',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1203,'mod/questionnaire:downloadresponses','read',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1213,'mod/questionnaire:deleteresponses','write',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1223,'mod/questionnaire:manage','write',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1233,'mod/questionnaire:editquestions','write',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1243,'mod/questionnaire:createtemplates','write',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1253,'mod/questionnaire:createpublic','write',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1263,'mod/questionnaire:copysurveys','write',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1273,'mod/questionnaire:readownresponses','read',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1283,'mod/questionnaire:readallresponses','read',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1293,'mod/questionnaire:readallresponseanytime','read',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1303,'mod/questionnaire:printblank','read',70,'mod/questionnaire',0);
INSERT INTO `mdl_capabilities` VALUES (1313,'mod/quiz:reviewmyattempts','read',70,'mod/quiz',0);
INSERT INTO `mdl_capabilities` VALUES (1323,'mod/quiz:emailconfirmsubmission','read',70,'mod/quiz',0);
INSERT INTO `mdl_capabilities` VALUES (1333,'mod/quiz:emailnotifysubmission','read',70,'mod/quiz',0);
INSERT INTO `mdl_capabilities` VALUES (1343,'mod/scorm:deleteresponses','read',70,'mod/scorm',0);
INSERT INTO `mdl_capabilities` VALUES (1353,'mod/sloodle:staff','write',70,'mod/sloodle',0);
INSERT INTO `mdl_capabilities` VALUES (1363,'mod/sloodle:objectauth','write',70,'mod/sloodle',2);
INSERT INTO `mdl_capabilities` VALUES (1373,'mod/sloodle:userobjectauth','write',70,'mod/sloodle',0);
INSERT INTO `mdl_capabilities` VALUES (1383,'mod/sloodle:uselayouts','read',70,'mod/sloodle',0);
INSERT INTO `mdl_capabilities` VALUES (1393,'mod/sloodle:editlayouts','write',70,'mod/sloodle',0);
INSERT INTO `mdl_capabilities` VALUES (1403,'mod/sloodle:registeravatar','write',70,'mod/sloodle',0);
INSERT INTO `mdl_capabilities` VALUES (1413,'mod/sloodle:distributeself','write',70,'mod/sloodle',0);
INSERT INTO `mdl_capabilities` VALUES (1423,'mod/sloodle:distributeothers','write',70,'mod/sloodle',16);
INSERT INTO `mdl_capabilities` VALUES (1433,'block/exabis_eportfolio:use','write',10,'block/exabis_eportfolio',0);
INSERT INTO `mdl_capabilities` VALUES (1443,'block/exabis_eportfolio:export','read',10,'block/exabis_eportfolio',0);
INSERT INTO `mdl_capabilities` VALUES (1453,'block/exabis_eportfolio:import','write',10,'block/exabis_eportfolio',20);
INSERT INTO `mdl_capabilities` VALUES (1463,'block/exabis_eportfolio:importfrommoodle','write',10,'block/exabis_eportfolio',0);
INSERT INTO `mdl_capabilities` VALUES (1473,'block/exabis_eportfolio:shareintern','write',10,'block/exabis_eportfolio',0);
INSERT INTO `mdl_capabilities` VALUES (1483,'block/exabis_eportfolio:shareextern','write',10,'block/exabis_eportfolio',16);
INSERT INTO `mdl_capabilities` VALUES (1493,'block/exabis_eportfolio:allowposts','write',10,'block/exabis_eportfolio',16);
INSERT INTO `mdl_capabilities` VALUES (1503,'block/ilp:view','read',80,'block/ilp',0);
INSERT INTO `mdl_capabilities` VALUES (1513,'block/ilp:viewclass','read',80,'block/ilp',0);
INSERT INTO `mdl_capabilities` VALUES (1523,'block/ilp_student_info:view','read',80,'block/ilp_student_info',0);
INSERT INTO `mdl_capabilities` VALUES (1533,'block/ilp_student_info:editmine','write',80,'block/ilp_student_info',0);
INSERT INTO `mdl_capabilities` VALUES (1543,'block/ilp_student_info:editall','write',80,'block/ilp_student_info',0);
INSERT INTO `mdl_capabilities` VALUES (1553,'block/ilp_student_info:viewclass','read',80,'block/ilp_student_info',0);
INSERT INTO `mdl_capabilities` VALUES (1563,'block/online_users:viewlist','read',80,'block/online_users',0);
INSERT INTO `mdl_capabilities` VALUES (1573,'gradeexport/ods:view','read',50,'gradeexport/ods',8);
INSERT INTO `mdl_capabilities` VALUES (1583,'gradeexport/ods:publish','read',50,'gradeexport/ods',8);
INSERT INTO `mdl_capabilities` VALUES (1593,'gradeexport/txt:view','read',50,'gradeexport/txt',8);
INSERT INTO `mdl_capabilities` VALUES (1603,'gradeexport/txt:publish','read',50,'gradeexport/txt',8);
INSERT INTO `mdl_capabilities` VALUES (1613,'gradeexport/xls:view','read',50,'gradeexport/xls',8);
INSERT INTO `mdl_capabilities` VALUES (1623,'gradeexport/xls:publish','read',50,'gradeexport/xls',8);
INSERT INTO `mdl_capabilities` VALUES (1633,'gradeexport/xml:view','read',50,'gradeexport/xml',8);
INSERT INTO `mdl_capabilities` VALUES (1643,'gradeexport/xml:publish','read',50,'gradeexport/xml',8);
INSERT INTO `mdl_capabilities` VALUES (1653,'gradeimport/csv:view','write',50,'gradeimport/csv',0);
INSERT INTO `mdl_capabilities` VALUES (1663,'gradeimport/xml:view','write',50,'gradeimport/xml',0);
INSERT INTO `mdl_capabilities` VALUES (1673,'gradeimport/xml:publish','write',50,'gradeimport/xml',0);
INSERT INTO `mdl_capabilities` VALUES (1683,'gradereport/grader:view','read',50,'gradereport/grader',8);
INSERT INTO `mdl_capabilities` VALUES (1693,'gradereport/outcomes:view','read',50,'gradereport/outcomes',8);
INSERT INTO `mdl_capabilities` VALUES (1703,'gradereport/overview:view','read',50,'gradereport/overview',8);
INSERT INTO `mdl_capabilities` VALUES (1713,'gradereport/user:view','read',50,'gradereport/user',8);
INSERT INTO `mdl_capabilities` VALUES (1723,'coursereport/log:view','read',50,'coursereport/log',8);
INSERT INTO `mdl_capabilities` VALUES (1733,'coursereport/log:viewlive','read',50,'coursereport/log',8);
INSERT INTO `mdl_capabilities` VALUES (1743,'coursereport/log:viewtoday','read',50,'coursereport/log',8);
INSERT INTO `mdl_capabilities` VALUES (1753,'coursereport/outline:view','read',50,'coursereport/outline',8);
INSERT INTO `mdl_capabilities` VALUES (1763,'coursereport/participation:view','read',50,'coursereport/participation',8);
INSERT INTO `mdl_capabilities` VALUES (1773,'coursereport/stats:view','read',50,'coursereport/stats',8);
INSERT INTO `mdl_capabilities` VALUES (1783,'report/courseoverview:view','read',10,'report/courseoverview',8);
INSERT INTO `mdl_capabilities` VALUES (1793,'report/security:view','read',10,'report/security',2);
INSERT INTO `mdl_capabilities` VALUES (1803,'report/unittest:view','read',10,'report/unittest',32);
/*!40000 ALTER TABLE `mdl_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat`
--

DROP TABLE IF EXISTS `mdl_chat`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_chat` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `keepdays` bigint(11) NOT NULL default '0',
  `studentlogs` smallint(4) NOT NULL default '0',
  `chattime` bigint(10) unsigned NOT NULL default '0',
  `schedule` smallint(4) NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_chat`
--

LOCK TABLES `mdl_chat` WRITE;
/*!40000 ALTER TABLE `mdl_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `chatid` bigint(10) NOT NULL default '0',
  `userid` bigint(10) NOT NULL default '0',
  `groupid` bigint(10) NOT NULL default '0',
  `system` tinyint(1) unsigned NOT NULL default '0',
  `message` text NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_chat_messages`
--

LOCK TABLES `mdl_chat_messages` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_users`
--

DROP TABLE IF EXISTS `mdl_chat_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `chatid` bigint(11) NOT NULL default '0',
  `userid` bigint(11) NOT NULL default '0',
  `groupid` bigint(11) NOT NULL default '0',
  `version` varchar(16) NOT NULL default '',
  `ip` varchar(15) NOT NULL default '',
  `firstping` bigint(10) unsigned NOT NULL default '0',
  `lastping` bigint(10) unsigned NOT NULL default '0',
  `lastmessageping` bigint(10) unsigned NOT NULL default '0',
  `sid` varchar(32) NOT NULL default '',
  `course` bigint(10) unsigned NOT NULL default '0',
  `lang` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_chat_users`
--

LOCK TABLES `mdl_chat_users` WRITE;
/*!40000 ALTER TABLE `mdl_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice`
--

DROP TABLE IF EXISTS `mdl_choice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_choice` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  `format` tinyint(2) unsigned NOT NULL default '0',
  `publish` tinyint(2) unsigned NOT NULL default '0',
  `showresults` tinyint(2) unsigned NOT NULL default '0',
  `display` smallint(4) unsigned NOT NULL default '0',
  `allowupdate` tinyint(2) unsigned NOT NULL default '0',
  `showunanswered` tinyint(2) unsigned NOT NULL default '0',
  `limitanswers` tinyint(2) unsigned NOT NULL default '0',
  `timeopen` bigint(10) unsigned NOT NULL default '0',
  `timeclose` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_choice`
--

LOCK TABLES `mdl_choice` WRITE;
/*!40000 ALTER TABLE `mdl_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_answers`
--

DROP TABLE IF EXISTS `mdl_choice_answers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `choiceid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `optionid` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='choices performed by users';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_choice_answers`
--

LOCK TABLES `mdl_choice_answers` WRITE;
/*!40000 ALTER TABLE `mdl_choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_options`
--

DROP TABLE IF EXISTS `mdl_choice_options`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `choiceid` bigint(10) unsigned NOT NULL default '0',
  `text` text,
  `maxanswers` bigint(10) unsigned default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='available options to choice';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_choice_options`
--

LOCK TABLES `mdl_choice_options` WRITE;
/*!40000 ALTER TABLE `mdl_choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config`
--

DROP TABLE IF EXISTS `mdl_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_config` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2204 DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_config`
--

LOCK TABLES `mdl_config` WRITE;
/*!40000 ALTER TABLE `mdl_config` DISABLE KEYS */;
INSERT INTO `mdl_config` VALUES (1,'unicodedb','1');
INSERT INTO `mdl_config` VALUES (273,'statsruntimedays','31');
INSERT INTO `mdl_config` VALUES (3,'statsrolesupgraded','1201718639');
INSERT INTO `mdl_config` VALUES (4,'guestroleid','6');
INSERT INTO `mdl_config` VALUES (5,'creatornewroleid','3');
INSERT INTO `mdl_config` VALUES (6,'notloggedinroleid','6');
INSERT INTO `mdl_config` VALUES (7,'defaultuserroleid','7');
INSERT INTO `mdl_config` VALUES (8,'defaultcourseroleid','5');
INSERT INTO `mdl_config` VALUES (9,'autologinguests','0');
INSERT INTO `mdl_config` VALUES (10,'nonmetacoursesyncroleids','');
INSERT INTO `mdl_config` VALUES (11,'hiddenuserfields','firstaccess');
INSERT INTO `mdl_config` VALUES (12,'enablecourserequests','0');
INSERT INTO `mdl_config` VALUES (13,'defaultrequestcategory','1');
INSERT INTO `mdl_config` VALUES (14,'timezone','99');
INSERT INTO `mdl_config` VALUES (15,'forcetimezone','99');
INSERT INTO `mdl_config` VALUES (16,'country','0');
INSERT INTO `mdl_config` VALUES (17,'iplookup','hostip');
INSERT INTO `mdl_config` VALUES (18,'lang','en_utf8');
INSERT INTO `mdl_config` VALUES (19,'langmenu','1');
INSERT INTO `mdl_config` VALUES (20,'langlist','');
INSERT INTO `mdl_config` VALUES (21,'langcache','1');
INSERT INTO `mdl_config` VALUES (22,'locale','');
INSERT INTO `mdl_config` VALUES (23,'latinexcelexport','0');
INSERT INTO `mdl_config` VALUES (24,'protectusernames','1');
INSERT INTO `mdl_config` VALUES (25,'forcelogin','0');
INSERT INTO `mdl_config` VALUES (26,'forceloginforprofiles','1');
INSERT INTO `mdl_config` VALUES (27,'opentogoogle','0');
INSERT INTO `mdl_config` VALUES (28,'maxbytes','0');
INSERT INTO `mdl_config` VALUES (29,'messaging','1');
INSERT INTO `mdl_config` VALUES (30,'allowobjectembed','0');
INSERT INTO `mdl_config` VALUES (31,'enabletrusttext','0');
INSERT INTO `mdl_config` VALUES (32,'maxeditingtime','1800');
INSERT INTO `mdl_config` VALUES (33,'fullnamedisplay','firstname lastname');
INSERT INTO `mdl_config` VALUES (34,'extendedusernamechars','0');
INSERT INTO `mdl_config` VALUES (35,'sitepolicy','');
INSERT INTO `mdl_config` VALUES (36,'bloglevel','4');
INSERT INTO `mdl_config` VALUES (37,'cronclionly','0');
INSERT INTO `mdl_config` VALUES (38,'cronremotepassword','');
INSERT INTO `mdl_config` VALUES (39,'loginhttps','0');
INSERT INTO `mdl_config` VALUES (40,'restrictmodulesfor','none');
INSERT INTO `mdl_config` VALUES (41,'restrictbydefault','0');
INSERT INTO `mdl_config` VALUES (42,'defaultallowedmodules','');
INSERT INTO `mdl_config` VALUES (43,'displayloginfailures','');
INSERT INTO `mdl_config` VALUES (44,'notifyloginfailures','');
INSERT INTO `mdl_config` VALUES (45,'notifyloginthreshold','10');
INSERT INTO `mdl_config` VALUES (46,'runclamonupload','0');
INSERT INTO `mdl_config` VALUES (47,'pathtoclam','');
INSERT INTO `mdl_config` VALUES (48,'quarantinedir','');
INSERT INTO `mdl_config` VALUES (49,'clamfailureonupload','donothing');
INSERT INTO `mdl_config` VALUES (50,'themelist','');
INSERT INTO `mdl_config` VALUES (51,'allowuserthemes','0');
INSERT INTO `mdl_config` VALUES (52,'allowcoursethemes','0');
INSERT INTO `mdl_config` VALUES (53,'allowuserblockhiding','1');
INSERT INTO `mdl_config` VALUES (54,'showblocksonmodpages','0');
INSERT INTO `mdl_config` VALUES (55,'calendar_adminseesall','0');
INSERT INTO `mdl_config` VALUES (56,'calendar_site_timeformat','0');
INSERT INTO `mdl_config` VALUES (57,'calendar_startwday','0');
INSERT INTO `mdl_config` VALUES (58,'calendar_weekend','65');
INSERT INTO `mdl_config` VALUES (59,'calendar_lookahead','21');
INSERT INTO `mdl_config` VALUES (60,'calendar_maxevents','10');
INSERT INTO `mdl_config` VALUES (61,'cachetext','60');
INSERT INTO `mdl_config` VALUES (62,'filteruploadedfiles','0');
INSERT INTO `mdl_config` VALUES (63,'filtermatchoneperpage','0');
INSERT INTO `mdl_config` VALUES (64,'filtermatchonepertext','0');
INSERT INTO `mdl_config` VALUES (65,'filterall','0');
INSERT INTO `mdl_config` VALUES (66,'htmleditor','1');
INSERT INTO `mdl_config` VALUES (67,'editorbackgroundcolor','#ffffff');
INSERT INTO `mdl_config` VALUES (68,'editorfontfamily','Trebuchet MS,Verdana,Arial,Helvetica,sans-serif');
INSERT INTO `mdl_config` VALUES (69,'editorfontsize','');
INSERT INTO `mdl_config` VALUES (70,'editorfontlist','Trebuchet:Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial:arial,helvetica,sans-serif;Courier New:courier new,courier,monospace;Georgia:georgia,times new roman,times,serif;Tahoma:tahoma,arial,helvetica,sans-serif;Times New Roman:times new roman,times,serif;Verdana:verdana,arial,helvetica,sans-serif;Impact:impact;Wingdings:wingdings');
INSERT INTO `mdl_config` VALUES (71,'editorkillword','1');
INSERT INTO `mdl_config` VALUES (72,'editorhidebuttons','');
INSERT INTO `mdl_config` VALUES (73,'docroot','http://docs.moodle.org');
INSERT INTO `mdl_config` VALUES (74,'doctonewwindow','0');
INSERT INTO `mdl_config` VALUES (75,'mymoodleredirect','0');
INSERT INTO `mdl_config` VALUES (76,'gradebookroles','5');
INSERT INTO `mdl_config` VALUES (77,'coursemanager','3');
INSERT INTO `mdl_config` VALUES (78,'frontpage','2,0,,');
INSERT INTO `mdl_config` VALUES (79,'frontpageloggedin','4,,,');
INSERT INTO `mdl_config` VALUES (80,'coursesperpage','20');
INSERT INTO `mdl_config` VALUES (81,'allowvisiblecoursesinhiddencategories','0');
INSERT INTO `mdl_config` VALUES (82,'gdversion','2');
INSERT INTO `mdl_config` VALUES (83,'zip','');
INSERT INTO `mdl_config` VALUES (84,'unzip','');
INSERT INTO `mdl_config` VALUES (85,'pathtodu','');
INSERT INTO `mdl_config` VALUES (86,'aspellpath','');
INSERT INTO `mdl_config` VALUES (87,'smtphosts','');
INSERT INTO `mdl_config` VALUES (88,'smtpuser','');
INSERT INTO `mdl_config` VALUES (89,'smtppass','');
INSERT INTO `mdl_config` VALUES (90,'noreplyaddress','noreply@template.orvsd.org');
INSERT INTO `mdl_config` VALUES (91,'allowemailaddresses','');
INSERT INTO `mdl_config` VALUES (92,'denyemailaddresses','');
INSERT INTO `mdl_config` VALUES (93,'digestmailtime','17');
INSERT INTO `mdl_config` VALUES (94,'sitemailcharset','');
INSERT INTO `mdl_config` VALUES (95,'allowusermailcharset','0');
INSERT INTO `mdl_config` VALUES (96,'dbsessions','0');
INSERT INTO `mdl_config` VALUES (97,'sessiontimeout','7200');
INSERT INTO `mdl_config` VALUES (98,'sessioncookie','');
INSERT INTO `mdl_config` VALUES (99,'sessioncookiepath','/');
INSERT INTO `mdl_config` VALUES (100,'enablerssfeeds','0');
INSERT INTO `mdl_config` VALUES (101,'debug','');
INSERT INTO `mdl_config` VALUES (102,'debugdisplay','1');
INSERT INTO `mdl_config` VALUES (103,'debugsmtp','0');
INSERT INTO `mdl_config` VALUES (104,'perfdebug','7');
INSERT INTO `mdl_config` VALUES (105,'enablestats','0');
INSERT INTO `mdl_config` VALUES (106,'statsfirstrun','none');
INSERT INTO `mdl_config` VALUES (107,'statsmaxruntime','0');
INSERT INTO `mdl_config` VALUES (108,'statsruntimestarthour','0');
INSERT INTO `mdl_config` VALUES (109,'statsruntimestartminute','0');
INSERT INTO `mdl_config` VALUES (110,'statsuserthreshold','0');
INSERT INTO `mdl_config` VALUES (111,'framename','_top');
INSERT INTO `mdl_config` VALUES (112,'slasharguments','1');
INSERT INTO `mdl_config` VALUES (113,'proxyhost','');
INSERT INTO `mdl_config` VALUES (114,'proxyport','0');
INSERT INTO `mdl_config` VALUES (115,'longtimenosee','120');
INSERT INTO `mdl_config` VALUES (116,'deleteunconfirmed','168');
INSERT INTO `mdl_config` VALUES (117,'loglifetime','0');
INSERT INTO `mdl_config` VALUES (118,'cachetype','');
INSERT INTO `mdl_config` VALUES (119,'rcache','');
INSERT INTO `mdl_config` VALUES (120,'rcachettl','10');
INSERT INTO `mdl_config` VALUES (121,'intcachemax','10');
INSERT INTO `mdl_config` VALUES (122,'memcachedhosts','');
INSERT INTO `mdl_config` VALUES (123,'memcachedpconn','');
INSERT INTO `mdl_config` VALUES (124,'enableajax','0');
INSERT INTO `mdl_config` VALUES (125,'enableglobalsearch','0');
INSERT INTO `mdl_config` VALUES (126,'smartpix','0');
INSERT INTO `mdl_config` VALUES (127,'alternateloginurl','');
INSERT INTO `mdl_config` VALUES (128,'auth','email');
INSERT INTO `mdl_config` VALUES (129,'auth_pop3mailbox','INBOX');
INSERT INTO `mdl_config` VALUES (130,'changepassword','');
INSERT INTO `mdl_config` VALUES (131,'enrol','manual');
INSERT INTO `mdl_config` VALUES (132,'enrol_plugins_enabled','manual');
INSERT INTO `mdl_config` VALUES (133,'guestloginbutton','1');
INSERT INTO `mdl_config` VALUES (134,'registerauth','email');
INSERT INTO `mdl_config` VALUES (135,'style','default');
INSERT INTO `mdl_config` VALUES (136,'template','default');
INSERT INTO `mdl_config` VALUES (137,'theme','standardwhite');
INSERT INTO `mdl_config` VALUES (138,'filter_multilang_converted','1');
INSERT INTO `mdl_config` VALUES (139,'mnet_dispatcher_mode','off');
INSERT INTO `mdl_config` VALUES (140,'mnet_localhost_id','3');
INSERT INTO `mdl_config` VALUES (141,'mnet_all_hosts_id','2');
INSERT INTO `mdl_config` VALUES (142,'version','2007101590');
INSERT INTO `mdl_config` VALUES (143,'release','1.9.9+ (Build: 20100804)');
INSERT INTO `mdl_config` VALUES (144,'assignment_maxbytes','1024000');
INSERT INTO `mdl_config` VALUES (145,'assignment_itemstocount','1');
INSERT INTO `mdl_config` VALUES (146,'assignment_online_version','2005042900');
INSERT INTO `mdl_config` VALUES (147,'chat_refresh_room','5');
INSERT INTO `mdl_config` VALUES (148,'chat_refresh_userlist','10');
INSERT INTO `mdl_config` VALUES (149,'chat_old_ping','35');
INSERT INTO `mdl_config` VALUES (150,'chat_method','header_js');
INSERT INTO `mdl_config` VALUES (151,'chat_normal_updatemode','jsupdate');
INSERT INTO `mdl_config` VALUES (152,'chat_serverhost','template.orvsd.org');
INSERT INTO `mdl_config` VALUES (153,'chat_serverip','127.0.0.1');
INSERT INTO `mdl_config` VALUES (154,'chat_serverport','9111');
INSERT INTO `mdl_config` VALUES (155,'chat_servermax','100');
INSERT INTO `mdl_config` VALUES (156,'forum_displaymode','3');
INSERT INTO `mdl_config` VALUES (157,'forum_shortpost','300');
INSERT INTO `mdl_config` VALUES (158,'forum_longpost','600');
INSERT INTO `mdl_config` VALUES (159,'forum_manydiscussions','100');
INSERT INTO `mdl_config` VALUES (160,'forum_maxbytes','512000');
INSERT INTO `mdl_config` VALUES (161,'forum_trackreadposts','1');
INSERT INTO `mdl_config` VALUES (162,'forum_oldpostdays','14');
INSERT INTO `mdl_config` VALUES (163,'forum_usermarksread','');
INSERT INTO `mdl_config` VALUES (164,'forum_cleanreadtime','2');
INSERT INTO `mdl_config` VALUES (165,'forum_replytouser','1');
INSERT INTO `mdl_config` VALUES (166,'glossary_studentspost','1');
INSERT INTO `mdl_config` VALUES (167,'glossary_dupentries','0');
INSERT INTO `mdl_config` VALUES (168,'glossary_allowcomments','0');
INSERT INTO `mdl_config` VALUES (169,'glossary_linkbydefault','1');
INSERT INTO `mdl_config` VALUES (170,'glossary_defaultapproval','1');
INSERT INTO `mdl_config` VALUES (171,'glossary_entbypage','10');
INSERT INTO `mdl_config` VALUES (172,'hotpot_showtimes','0');
INSERT INTO `mdl_config` VALUES (173,'hotpot_excelencodings','');
INSERT INTO `mdl_config` VALUES (174,'hotpot_initialdisable','1');
INSERT INTO `mdl_config` VALUES (175,'journal_showrecentactivity','1');
INSERT INTO `mdl_config` VALUES (176,'journal_initialdisable','1');
INSERT INTO `mdl_config` VALUES (177,'lams_initialdisable','1');
INSERT INTO `mdl_config` VALUES (178,'quiz_review','83886079');
INSERT INTO `mdl_config` VALUES (179,'quiz_attemptonlast','0');
INSERT INTO `mdl_config` VALUES (180,'quiz_attempts','0');
INSERT INTO `mdl_config` VALUES (181,'quiz_grademethod','');
INSERT INTO `mdl_config` VALUES (182,'quiz_decimalpoints','2');
INSERT INTO `mdl_config` VALUES (183,'quiz_maximumgrade','10');
INSERT INTO `mdl_config` VALUES (184,'quiz_password','');
INSERT INTO `mdl_config` VALUES (185,'quiz_popup','0');
INSERT INTO `mdl_config` VALUES (186,'quiz_questionsperpage','0');
INSERT INTO `mdl_config` VALUES (187,'quiz_shuffleanswers','1');
INSERT INTO `mdl_config` VALUES (188,'quiz_shufflequestions','0');
INSERT INTO `mdl_config` VALUES (189,'quiz_subnet','');
INSERT INTO `mdl_config` VALUES (190,'quiz_timelimit','0');
INSERT INTO `mdl_config` VALUES (191,'quiz_optionflags','1');
INSERT INTO `mdl_config` VALUES (192,'quiz_penaltyscheme','1');
INSERT INTO `mdl_config` VALUES (193,'quiz_delay1','0');
INSERT INTO `mdl_config` VALUES (194,'quiz_delay2','0');
INSERT INTO `mdl_config` VALUES (195,'quiz_fix_review','0');
INSERT INTO `mdl_config` VALUES (196,'quiz_fix_attemptonlast','0');
INSERT INTO `mdl_config` VALUES (197,'quiz_fix_attempts','0');
INSERT INTO `mdl_config` VALUES (198,'quiz_fix_grademethod','0');
INSERT INTO `mdl_config` VALUES (199,'quiz_fix_decimalpoints','0');
INSERT INTO `mdl_config` VALUES (200,'quiz_fix_password','0');
INSERT INTO `mdl_config` VALUES (201,'quiz_fix_popup','0');
INSERT INTO `mdl_config` VALUES (202,'quiz_fix_questionsperpage','0');
INSERT INTO `mdl_config` VALUES (203,'quiz_fix_shuffleanswers','0');
INSERT INTO `mdl_config` VALUES (204,'quiz_fix_shufflequestions','0');
INSERT INTO `mdl_config` VALUES (205,'quiz_fix_subnet','0');
INSERT INTO `mdl_config` VALUES (206,'quiz_fix_timelimit','0');
INSERT INTO `mdl_config` VALUES (207,'quiz_fix_adaptive','0');
INSERT INTO `mdl_config` VALUES (208,'quiz_fix_penaltyscheme','0');
INSERT INTO `mdl_config` VALUES (209,'quiz_fix_delay1','0');
INSERT INTO `mdl_config` VALUES (210,'quiz_fix_delay2','0');
INSERT INTO `mdl_config` VALUES (211,'resource_framesize','130');
INSERT INTO `mdl_config` VALUES (212,'resource_websearch','http://google.com/');
INSERT INTO `mdl_config` VALUES (213,'resource_defaulturl','http://');
INSERT INTO `mdl_config` VALUES (214,'resource_filterexternalpages','');
INSERT INTO `mdl_config` VALUES (215,'resource_secretphrase','eIkY3g7Jkfi1ye2sgXtv');
INSERT INTO `mdl_config` VALUES (216,'resource_popup','');
INSERT INTO `mdl_config` VALUES (217,'resource_windowsettings','0');
INSERT INTO `mdl_config` VALUES (218,'resource_parametersettings','0');
INSERT INTO `mdl_config` VALUES (219,'resource_allowlocalfiles','0');
INSERT INTO `mdl_config` VALUES (220,'resource_hide_repository','1');
INSERT INTO `mdl_config` VALUES (221,'resource_autofilerename','1');
INSERT INTO `mdl_config` VALUES (222,'resource_blockdeletingfile','1');
INSERT INTO `mdl_config` VALUES (223,'resource_popupresizable','checked');
INSERT INTO `mdl_config` VALUES (224,'resource_popupscrollbars','checked');
INSERT INTO `mdl_config` VALUES (225,'resource_popupdirectories','checked');
INSERT INTO `mdl_config` VALUES (226,'resource_popuplocation','checked');
INSERT INTO `mdl_config` VALUES (227,'resource_popupmenubar','checked');
INSERT INTO `mdl_config` VALUES (228,'resource_popuptoolbar','checked');
INSERT INTO `mdl_config` VALUES (229,'resource_popupstatus','checked');
INSERT INTO `mdl_config` VALUES (230,'resource_popupwidth','620');
INSERT INTO `mdl_config` VALUES (231,'resource_popupheight','450');
INSERT INTO `mdl_config` VALUES (232,'scorm_maxattempts','6');
INSERT INTO `mdl_config` VALUES (233,'scorm_frameheight','500');
INSERT INTO `mdl_config` VALUES (234,'scorm_framewidth','100%');
INSERT INTO `mdl_config` VALUES (235,'scorm_updatetime','2');
INSERT INTO `mdl_config` VALUES (236,'scorm_advancedsettings','0');
INSERT INTO `mdl_config` VALUES (237,'scorm_windowsettings','0');
INSERT INTO `mdl_config` VALUES (238,'qtype_calculated_version','2006032200');
INSERT INTO `mdl_config` VALUES (239,'qtype_essay_version','2006032200');
INSERT INTO `mdl_config` VALUES (240,'qtype_match_version','2006032200');
INSERT INTO `mdl_config` VALUES (241,'qtype_multianswer_version','2008050800');
INSERT INTO `mdl_config` VALUES (242,'qtype_multichoice_version','2007081700');
INSERT INTO `mdl_config` VALUES (243,'qtype_numerical_version','2006121500');
INSERT INTO `mdl_config` VALUES (244,'qtype_randomsamatch_version','2006042800');
INSERT INTO `mdl_config` VALUES (283,'filter_tex_convertformat','gif');
INSERT INTO `mdl_config` VALUES (246,'qtype_shortanswer_version','2006032200');
INSERT INTO `mdl_config` VALUES (247,'qtype_truefalse_version','2006032200');
INSERT INTO `mdl_config` VALUES (248,'backup_version','2009111300');
INSERT INTO `mdl_config` VALUES (249,'backup_release','1.9.7');
INSERT INTO `mdl_config` VALUES (250,'blocks_version','2007081300');
INSERT INTO `mdl_config` VALUES (251,'enrol_authorize_version','2006112903');
INSERT INTO `mdl_config` VALUES (252,'enrol_paypal_version','2006092200');
INSERT INTO `mdl_config` VALUES (253,'adminblocks_initialised','1');
INSERT INTO `mdl_config` VALUES (254,'siteidentifier','enIwFpxla6ItJvEQ3rDzHpgP0QKTGxzstemplate.orvsd.org');
INSERT INTO `mdl_config` VALUES (255,'rolesactive','1');
INSERT INTO `mdl_config` VALUES (263,'block_side_bar_section_start','1000');
INSERT INTO `mdl_config` VALUES (293,'auth_instructions','');
INSERT INTO `mdl_config` VALUES (303,'assignment_type_online_version','2005042900');
INSERT INTO `mdl_config` VALUES (313,'slideshow_maxsize','60');
INSERT INTO `mdl_config` VALUES (323,'slideshow_maxwidth','600');
INSERT INTO `mdl_config` VALUES (333,'slideshow_maxheight','400');
INSERT INTO `mdl_config` VALUES (343,'slideshow_keeporiginals','1');
INSERT INTO `mdl_config` VALUES (353,'slideshow_securepix','0');
INSERT INTO `mdl_config` VALUES (363,'workshop_initialdisable','1');
INSERT INTO `mdl_config` VALUES (373,'gradeexport_ods_version','2007092701');
INSERT INTO `mdl_config` VALUES (383,'gradeexport_txt_version','2007092700');
INSERT INTO `mdl_config` VALUES (393,'gradeexport_xls_version','2007092700');
INSERT INTO `mdl_config` VALUES (403,'gradeexport_xml_version','2007092700');
INSERT INTO `mdl_config` VALUES (413,'gradeimport_csv_version','2007072500');
INSERT INTO `mdl_config` VALUES (423,'gradeimport_xml_version','2007092700');
INSERT INTO `mdl_config` VALUES (433,'gradereport_grader_version','2007091700');
INSERT INTO `mdl_config` VALUES (443,'gradereport_outcomes_version','2007073000');
INSERT INTO `mdl_config` VALUES (453,'gradereport_overview_version','2009022500');
INSERT INTO `mdl_config` VALUES (463,'gradereport_user_version','2007092500');
INSERT INTO `mdl_config` VALUES (473,'coursereport_log_version','2007101504');
INSERT INTO `mdl_config` VALUES (483,'coursereport_outline_version','2007101501');
INSERT INTO `mdl_config` VALUES (493,'coursereport_participation_version','2007101501');
INSERT INTO `mdl_config` VALUES (503,'coursereport_stats_version','2007101501');
INSERT INTO `mdl_config` VALUES (513,'report_courseoverview_version','2007101503');
INSERT INTO `mdl_config` VALUES (523,'report_security_version','2007101500');
INSERT INTO `mdl_config` VALUES (533,'report_unittest_version','2007101501');
INSERT INTO `mdl_config` VALUES (543,'forgottenpasswordurl','');
INSERT INTO `mdl_config` VALUES (553,'verifychangedemail','1');
INSERT INTO `mdl_config` VALUES (563,'recaptchapublickey','');
INSERT INTO `mdl_config` VALUES (573,'recaptchaprivatekey','');
INSERT INTO `mdl_config` VALUES (583,'nodefaultuserrolelists','0');
INSERT INTO `mdl_config` VALUES (593,'allowuserswitchrolestheycantassign','0');
INSERT INTO `mdl_config` VALUES (603,'enableoutcomes','0');
INSERT INTO `mdl_config` VALUES (613,'grade_profilereport','user');
INSERT INTO `mdl_config` VALUES (623,'grade_aggregationposition','1');
INSERT INTO `mdl_config` VALUES (633,'grade_includescalesinaggregation','1');
INSERT INTO `mdl_config` VALUES (643,'grade_hiddenasdate','0');
INSERT INTO `mdl_config` VALUES (653,'gradepublishing','0');
INSERT INTO `mdl_config` VALUES (663,'grade_export_displaytype','1');
INSERT INTO `mdl_config` VALUES (673,'grade_export_decimalpoints','2');
INSERT INTO `mdl_config` VALUES (683,'grade_navmethod','0');
INSERT INTO `mdl_config` VALUES (693,'gradeexport','');
INSERT INTO `mdl_config` VALUES (703,'unlimitedgrades','0');
INSERT INTO `mdl_config` VALUES (713,'grade_hideforcedsettings','1');
INSERT INTO `mdl_config` VALUES (723,'grade_aggregation','11');
INSERT INTO `mdl_config` VALUES (733,'grade_aggregation_flag','0');
INSERT INTO `mdl_config` VALUES (743,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13');
INSERT INTO `mdl_config` VALUES (753,'grade_aggregateonlygraded','1');
INSERT INTO `mdl_config` VALUES (763,'grade_aggregateonlygraded_flag','2');
INSERT INTO `mdl_config` VALUES (773,'grade_aggregateoutcomes','0');
INSERT INTO `mdl_config` VALUES (783,'grade_aggregateoutcomes_flag','2');
INSERT INTO `mdl_config` VALUES (793,'grade_aggregatesubcats','0');
INSERT INTO `mdl_config` VALUES (803,'grade_aggregatesubcats_flag','2');
INSERT INTO `mdl_config` VALUES (813,'grade_keephigh','0');
INSERT INTO `mdl_config` VALUES (823,'grade_keephigh_flag','3');
INSERT INTO `mdl_config` VALUES (833,'grade_droplow','0');
INSERT INTO `mdl_config` VALUES (843,'grade_droplow_flag','2');
INSERT INTO `mdl_config` VALUES (853,'grade_displaytype','1');
INSERT INTO `mdl_config` VALUES (863,'grade_decimalpoints','2');
INSERT INTO `mdl_config` VALUES (873,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime');
INSERT INTO `mdl_config` VALUES (883,'grade_report_studentsperpage','100');
INSERT INTO `mdl_config` VALUES (893,'grade_report_quickgrading','1');
INSERT INTO `mdl_config` VALUES (903,'grade_report_showquickfeedback','0');
INSERT INTO `mdl_config` VALUES (913,'grade_report_fixedstudents','0');
INSERT INTO `mdl_config` VALUES (923,'grade_report_meanselection','1');
INSERT INTO `mdl_config` VALUES (933,'grade_report_showcalculations','0');
INSERT INTO `mdl_config` VALUES (943,'grade_report_showeyecons','0');
INSERT INTO `mdl_config` VALUES (953,'grade_report_showaverages','1');
INSERT INTO `mdl_config` VALUES (963,'grade_report_showlocks','0');
INSERT INTO `mdl_config` VALUES (973,'grade_report_showranges','0');
INSERT INTO `mdl_config` VALUES (983,'grade_report_showuserimage','1');
INSERT INTO `mdl_config` VALUES (993,'grade_report_showuseridnumber','0');
INSERT INTO `mdl_config` VALUES (1003,'grade_report_showactivityicons','1');
INSERT INTO `mdl_config` VALUES (1013,'grade_report_shownumberofgrades','0');
INSERT INTO `mdl_config` VALUES (1023,'grade_report_averagesdisplaytype','inherit');
INSERT INTO `mdl_config` VALUES (1033,'grade_report_rangesdisplaytype','inherit');
INSERT INTO `mdl_config` VALUES (1043,'grade_report_averagesdecimalpoints','inherit');
INSERT INTO `mdl_config` VALUES (1053,'grade_report_rangesdecimalpoints','inherit');
INSERT INTO `mdl_config` VALUES (1063,'grade_report_overview_showrank','0');
INSERT INTO `mdl_config` VALUES (1073,'grade_report_overview_showtotalsifcontainhidden','0');
INSERT INTO `mdl_config` VALUES (1083,'grade_report_user_showrank','0');
INSERT INTO `mdl_config` VALUES (1093,'grade_report_user_showpercentage','2');
INSERT INTO `mdl_config` VALUES (1103,'grade_report_user_showhiddenitems','1');
INSERT INTO `mdl_config` VALUES (1113,'grade_report_user_showtotalsifcontainhidden','0');
INSERT INTO `mdl_config` VALUES (1123,'geoipfile','/var/www/moodle/moodledata/neahkahnie.orvsd.org/geoip/GeoLiteCity.dat');
INSERT INTO `mdl_config` VALUES (1133,'googlemapkey','');
INSERT INTO `mdl_config` VALUES (1143,'autolang','1');
INSERT INTO `mdl_config` VALUES (1153,'assignment_showrecentsubmissions','1');
INSERT INTO `mdl_config` VALUES (1163,'book_tocwidth','180');
INSERT INTO `mdl_config` VALUES (1173,'data_enablerssfeeds','0');
INSERT INTO `mdl_config` VALUES (1183,'forum_enablerssfeeds','0');
INSERT INTO `mdl_config` VALUES (1193,'forum_enabletimedposts','0');
INSERT INTO `mdl_config` VALUES (1203,'forum_logblocked','1');
INSERT INTO `mdl_config` VALUES (1213,'forum_ajaxrating','0');
INSERT INTO `mdl_config` VALUES (1223,'glossary_enablerssfeeds','0');
INSERT INTO `mdl_config` VALUES (1233,'glossary_linkentries','0');
INSERT INTO `mdl_config` VALUES (1243,'glossary_casesensitive','0');
INSERT INTO `mdl_config` VALUES (1253,'glossary_fullmatch','0');
INSERT INTO `mdl_config` VALUES (1263,'lams_serverurl','');
INSERT INTO `mdl_config` VALUES (1273,'lams_serverid','');
INSERT INTO `mdl_config` VALUES (1283,'lams_serverkey','');
INSERT INTO `mdl_config` VALUES (1293,'scorm_grademethod','1');
INSERT INTO `mdl_config` VALUES (1303,'scorm_maxgrade','100');
INSERT INTO `mdl_config` VALUES (1313,'scorm_whatgrade','0');
INSERT INTO `mdl_config` VALUES (1323,'scorm_popup','0');
INSERT INTO `mdl_config` VALUES (1333,'scorm_resizable','0');
INSERT INTO `mdl_config` VALUES (1343,'scorm_scrollbars','0');
INSERT INTO `mdl_config` VALUES (1353,'scorm_directories','0');
INSERT INTO `mdl_config` VALUES (1363,'scorm_location','0');
INSERT INTO `mdl_config` VALUES (1373,'scorm_menubar','0');
INSERT INTO `mdl_config` VALUES (1383,'scorm_toolbar','0');
INSERT INTO `mdl_config` VALUES (1393,'scorm_status','0');
INSERT INTO `mdl_config` VALUES (1403,'scorm_skipview','0');
INSERT INTO `mdl_config` VALUES (1413,'scorm_hidebrowse','0');
INSERT INTO `mdl_config` VALUES (1423,'scorm_hidetoc','0');
INSERT INTO `mdl_config` VALUES (1433,'scorm_hidenav','0');
INSERT INTO `mdl_config` VALUES (1443,'scorm_auto','0');
INSERT INTO `mdl_config` VALUES (1453,'scorm_updatefreq','0');
INSERT INTO `mdl_config` VALUES (1463,'sloodle_allow_autoreg','0');
INSERT INTO `mdl_config` VALUES (1473,'sloodle_allow_autoenrol','0');
INSERT INTO `mdl_config` VALUES (1483,'sloodle_active_object_lifetime','7');
INSERT INTO `mdl_config` VALUES (1493,'sloodle_user_object_lifetime','21');
INSERT INTO `mdl_config` VALUES (1503,'block_course_list_adminview','all');
INSERT INTO `mdl_config` VALUES (1513,'block_course_list_hideallcourseslink','0');
INSERT INTO `mdl_config` VALUES (1523,'block_online_users_timetosee','5');
INSERT INTO `mdl_config` VALUES (1533,'filter_multilang_force_old','0');
INSERT INTO `mdl_config` VALUES (1543,'filter_mediaplugin_enable_mp3','1');
INSERT INTO `mdl_config` VALUES (1553,'filter_mediaplugin_enable_swf','0');
INSERT INTO `mdl_config` VALUES (1563,'filter_mediaplugin_enable_mov','1');
INSERT INTO `mdl_config` VALUES (1573,'filter_mediaplugin_enable_wmv','1');
INSERT INTO `mdl_config` VALUES (1583,'filter_mediaplugin_enable_mpg','1');
INSERT INTO `mdl_config` VALUES (1593,'filter_mediaplugin_enable_avi','1');
INSERT INTO `mdl_config` VALUES (1603,'filter_mediaplugin_enable_flv','1');
INSERT INTO `mdl_config` VALUES (1613,'filter_mediaplugin_enable_ram','1');
INSERT INTO `mdl_config` VALUES (1623,'filter_mediaplugin_enable_rpm','1');
INSERT INTO `mdl_config` VALUES (1633,'filter_mediaplugin_enable_rm','1');
INSERT INTO `mdl_config` VALUES (1643,'filter_mediaplugin_enable_youtube','0');
INSERT INTO `mdl_config` VALUES (1653,'filter_tex_latexpreamble','\\usepackage[latin1]{inputenc}\r\n\\usepackage{amsmath}\r\n\\usepackage{amsfonts}\r\n\\RequirePackage{amsmath,amssymb,latexsym}\r\n');
INSERT INTO `mdl_config` VALUES (1663,'filter_tex_latexbackground','#FFFFFF');
INSERT INTO `mdl_config` VALUES (1673,'filter_tex_density','120');
INSERT INTO `mdl_config` VALUES (1683,'filter_tex_pathlatex','/usr/bin/latex');
INSERT INTO `mdl_config` VALUES (1693,'filter_tex_pathdvips','/usr/bin/dvips');
INSERT INTO `mdl_config` VALUES (1703,'filter_tex_pathconvert','/usr/bin/convert');
INSERT INTO `mdl_config` VALUES (1713,'voicethread_site','voicethread.com');
INSERT INTO `mdl_config` VALUES (1723,'filter_censor_badwords','');
INSERT INTO `mdl_config` VALUES (1733,'usetags','1');
INSERT INTO `mdl_config` VALUES (1743,'keeptagnamecase','1');
INSERT INTO `mdl_config` VALUES (1753,'profilesforenrolledusersonly','1');
INSERT INTO `mdl_config` VALUES (1763,'passwordpolicy','1');
INSERT INTO `mdl_config` VALUES (1773,'minpasswordlength','8');
INSERT INTO `mdl_config` VALUES (1783,'minpassworddigits','1');
INSERT INTO `mdl_config` VALUES (1793,'minpasswordlower','1');
INSERT INTO `mdl_config` VALUES (1803,'minpasswordupper','1');
INSERT INTO `mdl_config` VALUES (1813,'minpasswordnonalphanum','0');
INSERT INTO `mdl_config` VALUES (1823,'disableuserimages','0');
INSERT INTO `mdl_config` VALUES (1833,'emailchangeconfirmation','1');
INSERT INTO `mdl_config` VALUES (1843,'enablenotes','1');
INSERT INTO `mdl_config` VALUES (1853,'regenloginsession','1');
INSERT INTO `mdl_config` VALUES (1863,'excludeoldflashclients','10.0.12');
INSERT INTO `mdl_config` VALUES (1873,'allowcategorythemes','0');
INSERT INTO `mdl_config` VALUES (1883,'hideactivitytypenavlink','0');
INSERT INTO `mdl_config` VALUES (1893,'enablecalendarexport','1');
INSERT INTO `mdl_config` VALUES (1903,'calendar_exportsalt','OHgwnSeaFXAzYPdF7sAc6btrAH7EwAB3LRALgMJyOyrPI9Zv5LrtvrLvs6E3');
INSERT INTO `mdl_config` VALUES (1913,'emoticons',':-){:}smiley{;}:){:}smiley{;}:-D{:}biggrin{;};-){:}wink{;}:-/{:}mixed{;}V-.{:}thoughtful{;}:-P{:}tongueout{;}B-){:}cool{;}^-){:}approve{;}8-){:}wideeyes{;}:o){:}clown{;}:-({:}sad{;}:({:}sad{;}8-.{:}shy{;}:-I{:}blush{;}:-X{:}kiss{;}8-o{:}surprise{;}P-|{:}blackeye{;}8-[{:}angry{;}xx-P{:}dead{;}|-.{:}sleepy{;}}-]{:}evil{;}(h){:}heart{;}(heart){:}heart{;}(y){:}yes{;}(n){:}no{;}(martin){:}martin{;}( ){:}egg');
INSERT INTO `mdl_config` VALUES (1923,'formatstringstriptags','1');
INSERT INTO `mdl_config` VALUES (1933,'mycoursesperpage','21');
INSERT INTO `mdl_config` VALUES (1943,'disablecourseajax','1');
INSERT INTO `mdl_config` VALUES (1953,'maxcategorydepth','0');
INSERT INTO `mdl_config` VALUES (1963,'defaultfrontpageroleid','0');
INSERT INTO `mdl_config` VALUES (1973,'smtpmaxbulk','1');
INSERT INTO `mdl_config` VALUES (1983,'mailnewline','LF');
INSERT INTO `mdl_config` VALUES (1993,'supportname','ORVSD Admin');
INSERT INTO `mdl_config` VALUES (2003,'supportemail','webmaster@orvsd.org');
INSERT INTO `mdl_config` VALUES (2013,'supportpage','');
INSERT INTO `mdl_config` VALUES (2023,'xmlstrictheaders','0');
INSERT INTO `mdl_config` VALUES (2033,'statscatdepth','1');
INSERT INTO `mdl_config` VALUES (2043,'getremoteaddrconf','0');
INSERT INTO `mdl_config` VALUES (2053,'proxytype','HTTP');
INSERT INTO `mdl_config` VALUES (2063,'proxyuser','');
INSERT INTO `mdl_config` VALUES (2073,'proxypassword','');
INSERT INTO `mdl_config` VALUES (2083,'deleteincompleteusers','0');
INSERT INTO `mdl_config` VALUES (2093,'disablegradehistory','0');
INSERT INTO `mdl_config` VALUES (2103,'gradehistorylifetime','0');
INSERT INTO `mdl_config` VALUES (2113,'extramemorylimit','128M');
INSERT INTO `mdl_config` VALUES (2123,'enablehtmlpurifier','0');
INSERT INTO `mdl_config` VALUES (2133,'enablegroupings','0');
INSERT INTO `mdl_config` VALUES (2143,'experimentalsplitrestore','0');
INSERT INTO `mdl_config` VALUES (2153,'enableimsccimport','0');
INSERT INTO `mdl_config` VALUES (2163,'enablesafebrowserintegration','0');
INSERT INTO `mdl_config` VALUES (2173,'digestmailtimelast','0');
INSERT INTO `mdl_config` VALUES (2183,'forum_lastreadclean','1283907623');
INSERT INTO `mdl_config` VALUES (2193,'scorm_updatetimelast','1283907623');
INSERT INTO `mdl_config` VALUES (2203,'lastexpirynotify','20100908');
/*!40000 ALTER TABLE `mdl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_plugins`
--

DROP TABLE IF EXISTS `mdl_config_plugins`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `plugin` varchar(100) NOT NULL default 'core',
  `name` varchar(100) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=374 DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_config_plugins`
--

LOCK TABLES `mdl_config_plugins` WRITE;
/*!40000 ALTER TABLE `mdl_config_plugins` DISABLE KEYS */;
INSERT INTO `mdl_config_plugins` VALUES (3,'auth/gsaml','privatekey','');
INSERT INTO `mdl_config_plugins` VALUES (13,'auth/gsaml','certificate','');
INSERT INTO `mdl_config_plugins` VALUES (23,'data','requiredentriesfixflag','1');
INSERT INTO `mdl_config_plugins` VALUES (33,'scorm','whatgradefixed','1');
INSERT INTO `mdl_config_plugins` VALUES (43,'scorm','grademethodfixed','1');
INSERT INTO `mdl_config_plugins` VALUES (53,'auth/gsaml','domainname','');
INSERT INTO `mdl_config_plugins` VALUES (63,'moodlecourse','format','weeks');
INSERT INTO `mdl_config_plugins` VALUES (73,'moodlecourse','numsections','10');
INSERT INTO `mdl_config_plugins` VALUES (83,'moodlecourse','hiddensections','0');
INSERT INTO `mdl_config_plugins` VALUES (93,'moodlecourse','newsitems','5');
INSERT INTO `mdl_config_plugins` VALUES (103,'moodlecourse','showgrades','1');
INSERT INTO `mdl_config_plugins` VALUES (113,'moodlecourse','showreports','0');
INSERT INTO `mdl_config_plugins` VALUES (123,'moodlecourse','maxbytes','209715200');
INSERT INTO `mdl_config_plugins` VALUES (133,'moodlecourse','metacourse','0');
INSERT INTO `mdl_config_plugins` VALUES (143,'lightboxgallery','disabledplugins','');
INSERT INTO `mdl_config_plugins` VALUES (153,'lightboxgallery','enablerssfeeds','0');
INSERT INTO `mdl_config_plugins` VALUES (163,'lightboxgallery','strictfilenames','0');
INSERT INTO `mdl_config_plugins` VALUES (173,'lightboxgallery','overwritefiles','1');
INSERT INTO `mdl_config_plugins` VALUES (183,'lightboxgallery','imagelifetime','86400');
INSERT INTO `mdl_config_plugins` VALUES (193,'blocks/gmail','oauthsecret','');
INSERT INTO `mdl_config_plugins` VALUES (203,'blocks/gmail','consumer_key','');
INSERT INTO `mdl_config_plugins` VALUES (213,'blocks/gmail','msgnumber','0');
INSERT INTO `mdl_config_plugins` VALUES (223,'blocks/gmail','newwinlink','1');
INSERT INTO `mdl_config_plugins` VALUES (233,'blocks/gmail','showfirstname','1');
INSERT INTO `mdl_config_plugins` VALUES (243,'blocks/gmail','showlastname','1');
INSERT INTO `mdl_config_plugins` VALUES (253,'blocks/gaccess','newwinlink','1');
INSERT INTO `mdl_config_plugins` VALUES (263,'blocks/gdata','username','');
INSERT INTO `mdl_config_plugins` VALUES (273,'blocks/gdata','password','');
INSERT INTO `mdl_config_plugins` VALUES (283,'blocks/gdata','domain','');
INSERT INTO `mdl_config_plugins` VALUES (293,'blocks/gdata','usedomainemail','0');
INSERT INTO `mdl_config_plugins` VALUES (303,'blocks/gdata','allowevents','1');
INSERT INTO `mdl_config_plugins` VALUES (313,'blocks/gdata','croninterval','30');
INSERT INTO `mdl_config_plugins` VALUES (323,'blocks/gdata','cronexpire','24');
INSERT INTO `mdl_config_plugins` VALUES (333,'blocks/section_links','numsections1','22');
INSERT INTO `mdl_config_plugins` VALUES (343,'blocks/section_links','incby1','2');
INSERT INTO `mdl_config_plugins` VALUES (353,'blocks/section_links','numsections2','40');
INSERT INTO `mdl_config_plugins` VALUES (363,'blocks/section_links','incby2','5');
INSERT INTO `mdl_config_plugins` VALUES (373,'qtype_random','selectmanual','0');
/*!40000 ALTER TABLE `mdl_config_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context`
--

DROP TABLE IF EXISTS `mdl_context`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_context` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `contextlevel` bigint(10) unsigned NOT NULL default '0',
  `instanceid` bigint(10) unsigned NOT NULL default '0',
  `path` varchar(255) default NULL,
  `depth` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='one of these must be set';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_context`
--

LOCK TABLES `mdl_context` WRITE;
/*!40000 ALTER TABLE `mdl_context` DISABLE KEYS */;
INSERT INTO `mdl_context` VALUES (1,10,0,'/1',1);
INSERT INTO `mdl_context` VALUES (2,50,1,'/1/2',2);
INSERT INTO `mdl_context` VALUES (3,30,2,'/1/3',2);
INSERT INTO `mdl_context` VALUES (13,80,1,'/1/2/13',3);
INSERT INTO `mdl_context` VALUES (23,80,2,'/1/2/23',3);
INSERT INTO `mdl_context` VALUES (33,80,3,'/1/2/33',3);
INSERT INTO `mdl_context` VALUES (43,80,4,'/1/2/43',3);
INSERT INTO `mdl_context` VALUES (53,40,1,'/1/53',2);
INSERT INTO `mdl_context` VALUES (63,30,1,'/1/63',2);
INSERT INTO `mdl_context` VALUES (73,80,5,'/1/73',2);
INSERT INTO `mdl_context` VALUES (83,80,6,'/1/83',2);
INSERT INTO `mdl_context` VALUES (93,70,3,'/1/2/93',3);
/*!40000 ALTER TABLE `mdl_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context_temp`
--

DROP TABLE IF EXISTS `mdl_context_temp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL default '',
  `depth` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_context_temp`
--

LOCK TABLES `mdl_context_temp` WRITE;
/*!40000 ALTER TABLE `mdl_context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_context_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_course` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `category` bigint(10) unsigned NOT NULL default '0',
  `sortorder` bigint(10) unsigned NOT NULL default '0',
  `password` varchar(50) NOT NULL default '',
  `fullname` varchar(254) NOT NULL default '',
  `shortname` varchar(100) NOT NULL default '',
  `idnumber` varchar(100) NOT NULL default '',
  `summary` text,
  `format` varchar(10) NOT NULL default 'topics',
  `showgrades` tinyint(2) unsigned NOT NULL default '1',
  `modinfo` longtext,
  `newsitems` mediumint(5) unsigned NOT NULL default '1',
  `teacher` varchar(100) NOT NULL default 'Teacher',
  `teachers` varchar(100) NOT NULL default 'Teachers',
  `student` varchar(100) NOT NULL default 'Student',
  `students` varchar(100) NOT NULL default 'Students',
  `guest` tinyint(2) unsigned NOT NULL default '0',
  `startdate` bigint(10) unsigned NOT NULL default '0',
  `enrolperiod` bigint(10) unsigned NOT NULL default '0',
  `numsections` mediumint(5) unsigned NOT NULL default '1',
  `marker` bigint(10) unsigned NOT NULL default '0',
  `maxbytes` bigint(10) unsigned NOT NULL default '0',
  `showreports` smallint(4) unsigned NOT NULL default '0',
  `visible` tinyint(1) unsigned NOT NULL default '1',
  `hiddensections` tinyint(2) unsigned NOT NULL default '0',
  `groupmode` smallint(4) unsigned NOT NULL default '0',
  `groupmodeforce` smallint(4) unsigned NOT NULL default '0',
  `defaultgroupingid` bigint(10) unsigned NOT NULL default '0',
  `lang` varchar(30) NOT NULL default '',
  `theme` varchar(50) NOT NULL default '',
  `cost` varchar(10) NOT NULL default '',
  `currency` varchar(3) NOT NULL default 'USD',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `metacourse` tinyint(1) unsigned NOT NULL default '0',
  `requested` tinyint(1) unsigned NOT NULL default '0',
  `restrictmodules` tinyint(1) unsigned NOT NULL default '0',
  `expirynotify` tinyint(1) unsigned NOT NULL default '0',
  `expirythreshold` bigint(10) unsigned NOT NULL default '0',
  `notifystudents` tinyint(1) unsigned NOT NULL default '0',
  `enrollable` tinyint(1) unsigned NOT NULL default '1',
  `enrolstartdate` bigint(10) unsigned NOT NULL default '0',
  `enrolenddate` bigint(10) unsigned NOT NULL default '0',
  `enrol` varchar(20) NOT NULL default '',
  `defaultrole` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Central course table';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_course`
--

LOCK TABLES `mdl_course` WRITE;
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` VALUES (1,0,1000,'','ORVSD_FULLNAME','ORVSD_SHORTNAME','','','site',1,'a:1:{i:3;O:8:\"stdClass\":10:{s:2:\"id\";s:1:\"3\";s:2:\"cm\";i:3;s:3:\"mod\";s:5:\"forum\";s:7:\"section\";s:1:\"0\";s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"name\";s:9:\"Site+news\";}}',3,'Teacher','Teachers','Student','Students',0,0,0,0,0,0,0,1,0,0,0,0,'','','','USD',0,1201718847,0,0,0,0,0,0,1,0,0,'',0);
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_allowed_modules`
--

DROP TABLE IF EXISTS `mdl_course_allowed_modules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_course_allowed_modules` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `module` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_courallomodu_cou_ix` (`course`),
  KEY `mdl_courallomodu_mod_ix` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='allowed modules foreach course';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_course_allowed_modules`
--

LOCK TABLES `mdl_course_allowed_modules` WRITE;
/*!40000 ALTER TABLE `mdl_course_allowed_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_allowed_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text,
  `parent` bigint(10) unsigned NOT NULL default '0',
  `sortorder` bigint(10) unsigned NOT NULL default '0',
  `coursecount` bigint(10) unsigned NOT NULL default '0',
  `visible` tinyint(1) NOT NULL default '1',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `depth` bigint(10) unsigned NOT NULL default '0',
  `path` varchar(255) NOT NULL default '',
  `theme` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Course categories';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_course_categories`
--

LOCK TABLES `mdl_course_categories` WRITE;
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` VALUES (1,'Miscellaneous',NULL,0,0,0,1,0,1,'/1',NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_display`
--

DROP TABLE IF EXISTS `mdl_course_display`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_course_display` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `display` bigint(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_courdisp_couuse_ix` (`course`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores info about how to display the course';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_course_display`
--

LOCK TABLES `mdl_course_display` WRITE;
/*!40000 ALTER TABLE `mdl_course_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_meta`
--

DROP TABLE IF EXISTS `mdl_course_meta`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_course_meta` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `parent_course` bigint(10) unsigned NOT NULL default '0',
  `child_course` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_courmeta_par_ix` (`parent_course`),
  KEY `mdl_courmeta_chi_ix` (`child_course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to store meta-courses relations';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_course_meta`
--

LOCK TABLES `mdl_course_meta` WRITE;
/*!40000 ALTER TABLE `mdl_course_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules`
--

DROP TABLE IF EXISTS `mdl_course_modules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `module` bigint(10) unsigned NOT NULL default '0',
  `instance` bigint(10) unsigned NOT NULL default '0',
  `section` bigint(10) unsigned NOT NULL default '0',
  `idnumber` varchar(100) default NULL,
  `added` bigint(10) unsigned NOT NULL default '0',
  `score` smallint(4) NOT NULL default '0',
  `indent` mediumint(5) unsigned NOT NULL default '0',
  `visible` tinyint(1) NOT NULL default '1',
  `visibleold` tinyint(1) NOT NULL default '1',
  `groupmode` smallint(4) NOT NULL default '0',
  `groupingid` bigint(10) unsigned NOT NULL default '0',
  `groupmembersonly` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_course_modules`
--

LOCK TABLES `mdl_course_modules` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules` DISABLE KEYS */;
INSERT INTO `mdl_course_modules` VALUES (3,1,5,3,3,NULL,1283907533,0,0,1,1,0,0,0);
/*!40000 ALTER TABLE `mdl_course_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_request`
--

DROP TABLE IF EXISTS `mdl_course_request`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_course_request` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `fullname` varchar(254) NOT NULL default '',
  `shortname` varchar(15) NOT NULL default '',
  `summary` text NOT NULL,
  `reason` text NOT NULL,
  `requester` bigint(10) NOT NULL default '0',
  `password` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='course requests';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_course_request`
--

LOCK TABLES `mdl_course_request` WRITE;
/*!40000 ALTER TABLE `mdl_course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections`
--

DROP TABLE IF EXISTS `mdl_course_sections`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `section` bigint(10) unsigned NOT NULL default '0',
  `summary` text,
  `sequence` text,
  `visible` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `mdl_coursect_cousec_ix` (`course`,`section`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_course_sections`
--

LOCK TABLES `mdl_course_sections` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections` DISABLE KEYS */;
INSERT INTO `mdl_course_sections` VALUES (3,1,0,'','3',1);
/*!40000 ALTER TABLE `mdl_course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data`
--

DROP TABLE IF EXISTS `mdl_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_data` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `comments` smallint(4) unsigned NOT NULL default '0',
  `timeavailablefrom` bigint(10) unsigned NOT NULL default '0',
  `timeavailableto` bigint(10) unsigned NOT NULL default '0',
  `timeviewfrom` bigint(10) unsigned NOT NULL default '0',
  `timeviewto` bigint(10) unsigned NOT NULL default '0',
  `requiredentries` int(8) unsigned NOT NULL default '0',
  `requiredentriestoview` int(8) unsigned NOT NULL default '0',
  `maxentries` int(8) unsigned NOT NULL default '0',
  `rssarticles` smallint(4) unsigned NOT NULL default '0',
  `singletemplate` text,
  `listtemplate` text,
  `listtemplateheader` text,
  `listtemplatefooter` text,
  `addtemplate` text,
  `rsstemplate` text,
  `rsstitletemplate` text,
  `csstemplate` text,
  `jstemplate` text,
  `asearchtemplate` text,
  `approval` smallint(4) unsigned NOT NULL default '0',
  `scale` bigint(10) NOT NULL default '0',
  `assessed` bigint(10) unsigned NOT NULL default '0',
  `defaultsort` bigint(10) unsigned NOT NULL default '0',
  `defaultsortdir` smallint(4) unsigned NOT NULL default '0',
  `editany` smallint(4) unsigned NOT NULL default '0',
  `notification` bigint(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Removed ratings column';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_data`
--

LOCK TABLES `mdl_data` WRITE;
/*!40000 ALTER TABLE `mdl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_comments`
--

DROP TABLE IF EXISTS `mdl_data_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_data_comments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `recordid` bigint(10) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  `format` tinyint(2) unsigned NOT NULL default '0',
  `created` bigint(10) unsigned NOT NULL default '0',
  `modified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_datacomm_rec_ix` (`recordid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to comment data records';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_data_comments`
--

LOCK TABLES `mdl_data_comments` WRITE;
/*!40000 ALTER TABLE `mdl_data_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_content`
--

DROP TABLE IF EXISTS `mdl_data_content`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_data_content` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `fieldid` bigint(10) unsigned NOT NULL default '0',
  `recordid` bigint(10) unsigned NOT NULL default '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY  (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_data_content`
--

LOCK TABLES `mdl_data_content` WRITE;
/*!40000 ALTER TABLE `mdl_data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_fields`
--

DROP TABLE IF EXISTS `mdl_data_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `dataid` bigint(10) unsigned NOT NULL default '0',
  `type` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `param1` text,
  `param2` text,
  `param3` text,
  `param4` text,
  `param5` text,
  `param6` text,
  `param7` text,
  `param8` text,
  `param9` text,
  `param10` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_datafiel_dat_ix` (`dataid`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='every field available';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_data_fields`
--

LOCK TABLES `mdl_data_fields` WRITE;
/*!40000 ALTER TABLE `mdl_data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_ratings`
--

DROP TABLE IF EXISTS `mdl_data_ratings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_data_ratings` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `recordid` bigint(10) unsigned NOT NULL default '0',
  `rating` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_datarati_rec_ix` (`recordid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to rate data records';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_data_ratings`
--

LOCK TABLES `mdl_data_ratings` WRITE;
/*!40000 ALTER TABLE `mdl_data_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_records`
--

DROP TABLE IF EXISTS `mdl_data_records`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_data_records` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `groupid` bigint(10) unsigned NOT NULL default '0',
  `dataid` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `approved` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='every record introduced';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_data_records`
--

LOCK TABLES `mdl_data_records` WRITE;
/*!40000 ALTER TABLE `mdl_data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_elluminate`
--

DROP TABLE IF EXISTS `mdl_elluminate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_elluminate` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `creator` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(64) default NULL,
  `description` text NOT NULL,
  `meetingid` varchar(20) default NULL,
  `seats` bigint(10) unsigned NOT NULL default '0',
  `private` tinyint(1) unsigned NOT NULL default '0',
  `grade` bigint(10) NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_ellu_mee_ix` (`meetingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains Elluminate Live! meeting data for each course modul';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_elluminate`
--

LOCK TABLES `mdl_elluminate` WRITE;
/*!40000 ALTER TABLE `mdl_elluminate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_elluminate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_elluminate_attendance`
--

DROP TABLE IF EXISTS `mdl_elluminate_attendance`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_elluminate_attendance` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `elluminateid` bigint(10) unsigned NOT NULL default '0',
  `grade` bigint(11) NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_elluatte_useell_uix` (`userid`,`elluminateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains Elluminate Live! attendance data for meetings keepi';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_elluminate_attendance`
--

LOCK TABLES `mdl_elluminate_attendance` WRITE;
/*!40000 ALTER TABLE `mdl_elluminate_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_elluminate_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_elluminate_recordings`
--

DROP TABLE IF EXISTS `mdl_elluminate_recordings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_elluminate_recordings` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `meetingid` varchar(20) default NULL,
  `recordingid` varchar(30) default NULL,
  `created` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_ellureco_meerec_uix` (`meetingid`,`recordingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains Elluminate Live! info about recorded meetings';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_elluminate_recordings`
--

LOCK TABLES `mdl_elluminate_recordings` WRITE;
/*!40000 ALTER TABLE `mdl_elluminate_recordings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_elluminate_recordings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_elluminate_users`
--

DROP TABLE IF EXISTS `mdl_elluminate_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_elluminate_users` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `elm_id` varchar(20) default NULL,
  `elm_username` varchar(50) default NULL,
  `elm_password` varchar(10) default NULL,
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_elluuser_use_uix` (`userid`),
  UNIQUE KEY `mdl_elluuser_elmelm_uix` (`elm_id`,`elm_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains Elluminate Live! mapping between ELM users and Mood';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_elluminate_users`
--

LOCK TABLES `mdl_elluminate_users` WRITE;
/*!40000 ALTER TABLE `mdl_elluminate_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_elluminate_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_authorize`
--

DROP TABLE IF EXISTS `mdl_enrol_authorize`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_enrol_authorize` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `paymentmethod` enum('cc','echeck') NOT NULL default 'cc',
  `refundinfo` smallint(4) unsigned NOT NULL default '0',
  `ccname` varchar(255) NOT NULL default '',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `transid` bigint(20) unsigned NOT NULL default '0',
  `status` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `settletime` bigint(10) unsigned NOT NULL default '0',
  `amount` varchar(10) NOT NULL default '',
  `currency` varchar(3) NOT NULL default 'USD',
  PRIMARY KEY  (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds all known information about authorize.net transactions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_enrol_authorize`
--

LOCK TABLES `mdl_enrol_authorize` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_authorize` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_authorize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_authorize_refunds`
--

DROP TABLE IF EXISTS `mdl_enrol_authorize_refunds`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_enrol_authorize_refunds` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `orderid` bigint(10) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `amount` varchar(10) NOT NULL default '',
  `transid` bigint(20) unsigned default '0',
  `settletime` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Authorize.net refunds';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_enrol_authorize_refunds`
--

LOCK TABLES `mdl_enrol_authorize_refunds` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_authorize_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_authorize_refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_paypal`
--

DROP TABLE IF EXISTS `mdl_enrol_paypal`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `business` varchar(255) NOT NULL default '',
  `receiver_email` varchar(255) NOT NULL default '',
  `receiver_id` varchar(255) NOT NULL default '',
  `item_name` varchar(255) NOT NULL default '',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `memo` varchar(255) NOT NULL default '',
  `tax` varchar(255) NOT NULL default '',
  `option_name1` varchar(255) NOT NULL default '',
  `option_selection1_x` varchar(255) NOT NULL default '',
  `option_name2` varchar(255) NOT NULL default '',
  `option_selection2_x` varchar(255) NOT NULL default '',
  `payment_status` varchar(255) NOT NULL default '',
  `pending_reason` varchar(255) NOT NULL default '',
  `reason_code` varchar(30) NOT NULL default '',
  `txn_id` varchar(255) NOT NULL default '',
  `parent_txn_id` varchar(255) NOT NULL default '',
  `payment_type` varchar(30) NOT NULL default '',
  `timeupdated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_enrol_paypal`
--

LOCK TABLES `mdl_enrol_paypal` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event`
--

DROP TABLE IF EXISTS `mdl_event`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_event` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL default '0',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `groupid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `repeatid` bigint(10) unsigned NOT NULL default '0',
  `modulename` varchar(20) NOT NULL default '',
  `instance` bigint(10) unsigned NOT NULL default '0',
  `eventtype` varchar(20) NOT NULL default '',
  `timestart` bigint(10) unsigned NOT NULL default '0',
  `timeduration` bigint(10) unsigned NOT NULL default '0',
  `visible` smallint(4) NOT NULL default '1',
  `uuid` varchar(36) NOT NULL default '',
  `sequence` bigint(10) unsigned NOT NULL default '1',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_event`
--

LOCK TABLES `mdl_event` WRITE;
/*!40000 ALTER TABLE `mdl_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_handlers`
--

DROP TABLE IF EXISTS `mdl_events_handlers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `eventname` varchar(166) NOT NULL default '',
  `handlermodule` varchar(166) NOT NULL default '',
  `handlerfile` varchar(255) NOT NULL default '',
  `handlerfunction` mediumtext,
  `schedule` varchar(255) default NULL,
  `status` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_evenhand_evehan_uix` (`eventname`,`handlermodule`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_events_handlers`
--

LOCK TABLES `mdl_events_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_handlers` DISABLE KEYS */;
INSERT INTO `mdl_events_handlers` VALUES (3,'user_updated','block/gdata','/blocks/gdata/gapps.php','a:2:{i:0;s:18:\"blocks_gdata_gapps\";i:1;s:18:\"user_updated_event\";}','instant',0);
INSERT INTO `mdl_events_handlers` VALUES (13,'user_deleted','block/gdata','/blocks/gdata/gapps.php','a:2:{i:0;s:18:\"blocks_gdata_gapps\";i:1;s:18:\"user_deleted_event\";}','instant',0);
INSERT INTO `mdl_events_handlers` VALUES (23,'password_changed','block/gdata','/blocks/gdata/gapps.php','a:2:{i:0;s:18:\"blocks_gdata_gapps\";i:1;s:22:\"password_changed_event\";}','instant',0);
/*!40000 ALTER TABLE `mdl_events_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue`
--

DROP TABLE IF EXISTS `mdl_events_queue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `eventdata` longtext NOT NULL,
  `stackdump` mediumtext,
  `userid` bigint(10) unsigned default NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_events_queue`
--

LOCK TABLES `mdl_events_queue` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue_handlers`
--

DROP TABLE IF EXISTS `mdl_events_queue_handlers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `queuedeventid` bigint(10) unsigned NOT NULL,
  `handlerid` bigint(10) unsigned NOT NULL,
  `status` bigint(10) default NULL,
  `errormessage` mediumtext,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_events_queue_handlers`
--

LOCK TABLES `mdl_events_queue_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_flv`
--

DROP TABLE IF EXISTS `mdl_flv`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_flv` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` mediumtext,
  `introformat` smallint(4) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `configxml` varchar(255) default 'undefined',
  `author` varchar(20) default '',
  `flvdate` varchar(50) default 'undefined',
  `description` mediumtext,
  `duration` bigint(11) unsigned default NULL,
  `flvfile` varchar(255) default NULL,
  `hdfile` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `link` varchar(255) default NULL,
  `flvstart` bigint(11) unsigned default '0',
  `tags` mediumtext,
  `title` varchar(255) default NULL,
  `type` varchar(50) default 'undefined',
  `backcolor` varchar(11) default NULL,
  `frontcolor` varchar(11) default NULL,
  `lightcolor` varchar(11) default NULL,
  `screencolor` varchar(11) default NULL,
  `controlbar` varchar(11) default NULL,
  `height` varchar(11) default NULL,
  `playlist` varchar(11) default NULL,
  `playlistsize` varchar(11) default NULL,
  `skin` varchar(255) default NULL,
  `width` varchar(11) default NULL,
  `autostart` varchar(11) default NULL,
  `bufferlength` varchar(11) default NULL,
  `displayclick` varchar(30) default NULL,
  `fullscreen` varchar(11) default NULL,
  `icons` varchar(11) default NULL,
  `item` varchar(11) default NULL,
  `linktarget` varchar(11) default NULL,
  `logo` varchar(255) default NULL,
  `mute` varchar(11) default NULL,
  `quality` varchar(11) default NULL,
  `flvrepeat` varchar(11) default NULL,
  `resizing` varchar(11) default NULL,
  `shuffle` varchar(11) default NULL,
  `state` varchar(11) default NULL,
  `stretching` varchar(30) default NULL,
  `volume` varchar(11) default NULL,
  `abouttext` mediumtext,
  `aboutlink` varchar(255) default NULL,
  `client` varchar(50) default NULL,
  `flvid` varchar(30) default NULL,
  `plugins` mediumtext,
  `streamer` varchar(255) default NULL,
  `tracecall` varchar(255) default NULL,
  `version` varchar(50) default NULL,
  `captions` varchar(255) default NULL,
  `fpversion` varchar(20) default NULL,
  `notes` mediumtext,
  PRIMARY KEY  (`id`),
  KEY `mdl_flv_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wrapper for Jeroen Wijering FLV Player';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_flv`
--

LOCK TABLES `mdl_flv` WRITE;
/*!40000 ALTER TABLE `mdl_flv` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_flv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum`
--

DROP TABLE IF EXISTS `mdl_forum`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_forum` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `type` enum('single','news','general','social','eachuser','teacher','qanda') NOT NULL default 'general',
  `name` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `assessed` bigint(10) unsigned NOT NULL default '0',
  `assesstimestart` bigint(10) unsigned NOT NULL default '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL default '0',
  `scale` bigint(10) NOT NULL default '0',
  `maxbytes` bigint(10) unsigned NOT NULL default '0',
  `forcesubscribe` tinyint(1) unsigned NOT NULL default '0',
  `trackingtype` tinyint(2) unsigned NOT NULL default '1',
  `rsstype` tinyint(2) unsigned NOT NULL default '0',
  `rssarticles` tinyint(2) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `warnafter` bigint(10) unsigned NOT NULL default '0',
  `blockafter` bigint(10) unsigned NOT NULL default '0',
  `blockperiod` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_forum`
--

LOCK TABLES `mdl_forum` WRITE;
/*!40000 ALTER TABLE `mdl_forum` DISABLE KEYS */;
INSERT INTO `mdl_forum` VALUES (3,1,'news','Site news','General news and announcements',0,0,0,0,0,0,1,0,0,1283907533,0,0,0);
/*!40000 ALTER TABLE `mdl_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussions`
--

DROP TABLE IF EXISTS `mdl_forum_discussions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `forum` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `firstpost` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `groupid` bigint(10) NOT NULL default '-1',
  `assessed` tinyint(1) NOT NULL default '1',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `usermodified` bigint(10) unsigned NOT NULL default '0',
  `timestart` bigint(10) unsigned NOT NULL default '0',
  `timeend` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_forum_discussions`
--

LOCK TABLES `mdl_forum_discussions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_posts`
--

DROP TABLE IF EXISTS `mdl_forum_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `discussion` bigint(10) unsigned NOT NULL default '0',
  `parent` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `created` bigint(10) unsigned NOT NULL default '0',
  `modified` bigint(10) unsigned NOT NULL default '0',
  `mailed` tinyint(2) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  `format` tinyint(2) NOT NULL default '0',
  `attachment` varchar(100) NOT NULL default '',
  `totalscore` smallint(4) NOT NULL default '0',
  `mailnow` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_forum_posts`
--

LOCK TABLES `mdl_forum_posts` WRITE;
/*!40000 ALTER TABLE `mdl_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_queue`
--

DROP TABLE IF EXISTS `mdl_forum_queue`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `discussionid` bigint(10) unsigned NOT NULL default '0',
  `postid` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_forum_queue`
--

LOCK TABLES `mdl_forum_queue` WRITE;
/*!40000 ALTER TABLE `mdl_forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_ratings`
--

DROP TABLE IF EXISTS `mdl_forum_ratings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_forum_ratings` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `post` bigint(10) unsigned NOT NULL default '0',
  `time` bigint(10) unsigned NOT NULL default '0',
  `rating` smallint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_forurati_use_ix` (`userid`),
  KEY `mdl_forurati_pos_ix` (`post`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='forum_ratings table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_forum_ratings`
--

LOCK TABLES `mdl_forum_ratings` WRITE;
/*!40000 ALTER TABLE `mdl_forum_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_read`
--

DROP TABLE IF EXISTS `mdl_forum_read`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `forumid` bigint(10) unsigned NOT NULL default '0',
  `discussionid` bigint(10) unsigned NOT NULL default '0',
  `postid` bigint(10) unsigned NOT NULL default '0',
  `firstread` bigint(10) unsigned NOT NULL default '0',
  `lastread` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_forum_read`
--

LOCK TABLES `mdl_forum_read` WRITE;
/*!40000 ALTER TABLE `mdl_forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_subscriptions`
--

DROP TABLE IF EXISTS `mdl_forum_subscriptions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `forum` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_forum_subscriptions`
--

LOCK TABLES `mdl_forum_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_track_prefs`
--

DROP TABLE IF EXISTS `mdl_forum_track_prefs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `forumid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_forum_track_prefs`
--

LOCK TABLES `mdl_forum_track_prefs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary`
--

DROP TABLE IF EXISTS `mdl_glossary`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_glossary` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `allowduplicatedentries` tinyint(2) unsigned NOT NULL default '0',
  `displayformat` varchar(50) NOT NULL default 'dictionary',
  `mainglossary` tinyint(2) unsigned NOT NULL default '0',
  `showspecial` tinyint(2) unsigned NOT NULL default '1',
  `showalphabet` tinyint(2) unsigned NOT NULL default '1',
  `showall` tinyint(2) unsigned NOT NULL default '1',
  `allowcomments` tinyint(2) unsigned NOT NULL default '0',
  `allowprintview` tinyint(2) unsigned NOT NULL default '1',
  `usedynalink` tinyint(2) unsigned NOT NULL default '1',
  `defaultapproval` tinyint(2) unsigned NOT NULL default '1',
  `globalglossary` tinyint(2) unsigned NOT NULL default '0',
  `entbypage` smallint(3) unsigned NOT NULL default '10',
  `editalways` tinyint(2) unsigned NOT NULL default '0',
  `rsstype` tinyint(2) unsigned NOT NULL default '0',
  `rssarticles` tinyint(2) unsigned NOT NULL default '0',
  `assessed` bigint(10) unsigned NOT NULL default '0',
  `assesstimestart` bigint(10) unsigned NOT NULL default '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL default '0',
  `scale` bigint(10) NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all glossaries';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_glossary`
--

LOCK TABLES `mdl_glossary` WRITE;
/*!40000 ALTER TABLE `mdl_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_alias`
--

DROP TABLE IF EXISTS `mdl_glossary_alias`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `entryid` bigint(10) unsigned NOT NULL default '0',
  `alias` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='entries alias';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_glossary_alias`
--

LOCK TABLES `mdl_glossary_alias` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `glossaryid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `usedynalink` tinyint(2) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_glossary_categories`
--

LOCK TABLES `mdl_glossary_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_comments`
--

DROP TABLE IF EXISTS `mdl_glossary_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_glossary_comments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `entryid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `entrycomment` text NOT NULL,
  `format` tinyint(2) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_gloscomm_use_ix` (`userid`),
  KEY `mdl_gloscomm_ent_ix` (`entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='comments on glossary entries';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_glossary_comments`
--

LOCK TABLES `mdl_glossary_comments` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries`
--

DROP TABLE IF EXISTS `mdl_glossary_entries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `glossaryid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `concept` varchar(255) NOT NULL default '',
  `definition` text NOT NULL,
  `format` tinyint(2) unsigned NOT NULL default '0',
  `attachment` varchar(100) NOT NULL default '',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `teacherentry` tinyint(2) unsigned NOT NULL default '0',
  `sourceglossaryid` bigint(10) unsigned NOT NULL default '0',
  `usedynalink` tinyint(2) unsigned NOT NULL default '1',
  `casesensitive` tinyint(2) unsigned NOT NULL default '0',
  `fullmatch` tinyint(2) unsigned NOT NULL default '1',
  `approved` tinyint(2) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all glossary entries';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_glossary_entries`
--

LOCK TABLES `mdl_glossary_entries` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_entries_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `categoryid` bigint(10) unsigned NOT NULL default '0',
  `entryid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_glossary_entries_categories`
--

LOCK TABLES `mdl_glossary_entries_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_formats`
--

DROP TABLE IF EXISTS `mdl_glossary_formats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `popupformatname` varchar(50) NOT NULL default '',
  `visible` tinyint(2) unsigned NOT NULL default '1',
  `showgroup` tinyint(2) unsigned NOT NULL default '1',
  `defaultmode` varchar(50) NOT NULL default '',
  `defaulthook` varchar(50) NOT NULL default '',
  `sortkey` varchar(50) NOT NULL default '',
  `sortorder` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_glossary_formats`
--

LOCK TABLES `mdl_glossary_formats` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_formats` DISABLE KEYS */;
INSERT INTO `mdl_glossary_formats` VALUES (3,'continuous','continuous',1,1,'','','','');
INSERT INTO `mdl_glossary_formats` VALUES (13,'dictionary','dictionary',1,1,'','','','');
INSERT INTO `mdl_glossary_formats` VALUES (23,'encyclopedia','encyclopedia',1,1,'','','','');
INSERT INTO `mdl_glossary_formats` VALUES (33,'entrylist','entrylist',1,1,'','','','');
INSERT INTO `mdl_glossary_formats` VALUES (43,'faq','faq',1,1,'','','','');
INSERT INTO `mdl_glossary_formats` VALUES (53,'fullwithauthor','fullwithauthor',1,1,'','','','');
INSERT INTO `mdl_glossary_formats` VALUES (63,'fullwithoutauthor','fullwithoutauthor',1,1,'','','','');
/*!40000 ALTER TABLE `mdl_glossary_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_ratings`
--

DROP TABLE IF EXISTS `mdl_glossary_ratings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_glossary_ratings` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `entryid` bigint(10) unsigned NOT NULL default '0',
  `time` bigint(10) unsigned NOT NULL default '0',
  `rating` smallint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_glosrati_use_ix` (`userid`),
  KEY `mdl_glosrati_ent_ix` (`entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains user ratings for entries';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_glossary_ratings`
--

LOCK TABLES `mdl_glossary_ratings` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories`
--

DROP TABLE IF EXISTS `mdl_grade_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned default NULL,
  `depth` bigint(10) unsigned NOT NULL default '0',
  `path` varchar(255) default NULL,
  `fullname` varchar(255) NOT NULL default '',
  `aggregation` bigint(10) NOT NULL default '0',
  `keephigh` bigint(10) NOT NULL default '0',
  `droplow` bigint(10) NOT NULL default '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL default '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL default '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_categories`
--

LOCK TABLES `mdl_grade_categories` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories_history`
--

DROP TABLE IF EXISTS `mdl_grade_categories_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `action` bigint(10) unsigned NOT NULL default '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) default NULL,
  `timemodified` bigint(10) unsigned default NULL,
  `loggeduser` bigint(10) unsigned default NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned default NULL,
  `depth` bigint(10) unsigned NOT NULL default '0',
  `path` varchar(255) default NULL,
  `fullname` varchar(255) NOT NULL default '',
  `aggregation` bigint(10) NOT NULL default '0',
  `keephigh` bigint(10) NOT NULL default '0',
  `droplow` bigint(10) NOT NULL default '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL default '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL default '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_categories_history`
--

LOCK TABLES `mdl_grade_categories_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades`
--

DROP TABLE IF EXISTS `mdl_grade_grades`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) default NULL,
  `rawgrademax` decimal(10,5) NOT NULL default '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL default '0.00000',
  `rawscaleid` bigint(10) unsigned default NULL,
  `usermodified` bigint(10) unsigned default NULL,
  `finalgrade` decimal(10,5) default NULL,
  `hidden` bigint(10) unsigned NOT NULL default '0',
  `locked` bigint(10) unsigned NOT NULL default '0',
  `locktime` bigint(10) unsigned NOT NULL default '0',
  `exported` bigint(10) unsigned NOT NULL default '0',
  `overridden` bigint(10) unsigned NOT NULL default '0',
  `excluded` bigint(10) unsigned NOT NULL default '0',
  `feedback` mediumtext,
  `feedbackformat` bigint(10) unsigned NOT NULL default '0',
  `information` mediumtext,
  `informationformat` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned default NULL,
  `timemodified` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_grades`
--

LOCK TABLES `mdl_grade_grades` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades_history`
--

DROP TABLE IF EXISTS `mdl_grade_grades_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `action` bigint(10) unsigned NOT NULL default '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) default NULL,
  `timemodified` bigint(10) unsigned default NULL,
  `loggeduser` bigint(10) unsigned default NULL,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) default NULL,
  `rawgrademax` decimal(10,5) NOT NULL default '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL default '0.00000',
  `rawscaleid` bigint(10) unsigned default NULL,
  `usermodified` bigint(10) unsigned default NULL,
  `finalgrade` decimal(10,5) default NULL,
  `hidden` bigint(10) unsigned NOT NULL default '0',
  `locked` bigint(10) unsigned NOT NULL default '0',
  `locktime` bigint(10) unsigned NOT NULL default '0',
  `exported` bigint(10) unsigned NOT NULL default '0',
  `overridden` bigint(10) unsigned NOT NULL default '0',
  `excluded` bigint(10) unsigned NOT NULL default '0',
  `feedback` mediumtext,
  `feedbackformat` bigint(10) unsigned NOT NULL default '0',
  `information` mediumtext,
  `informationformat` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_grades_history`
--

LOCK TABLES `mdl_grade_grades_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_newitem`
--

DROP TABLE IF EXISTS `mdl_grade_import_newitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `itemname` varchar(255) NOT NULL default '',
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_import_newitem`
--

LOCK TABLES `mdl_grade_import_newitem` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_values`
--

DROP TABLE IF EXISTS `mdl_grade_import_values`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `itemid` bigint(10) unsigned default NULL,
  `newgradeitem` bigint(10) unsigned default NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `finalgrade` decimal(10,5) default NULL,
  `feedback` mediumtext,
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_import_values`
--

LOCK TABLES `mdl_grade_import_values` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items`
--

DROP TABLE IF EXISTS `mdl_grade_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned default NULL,
  `categoryid` bigint(10) unsigned default NULL,
  `itemname` varchar(255) default NULL,
  `itemtype` varchar(30) NOT NULL default '',
  `itemmodule` varchar(30) default NULL,
  `iteminstance` bigint(10) unsigned default NULL,
  `itemnumber` bigint(10) unsigned default NULL,
  `iteminfo` mediumtext,
  `idnumber` varchar(255) default NULL,
  `calculation` mediumtext,
  `gradetype` smallint(4) NOT NULL default '1',
  `grademax` decimal(10,5) NOT NULL default '100.00000',
  `grademin` decimal(10,5) NOT NULL default '0.00000',
  `scaleid` bigint(10) unsigned default NULL,
  `outcomeid` bigint(10) unsigned default NULL,
  `gradepass` decimal(10,5) NOT NULL default '0.00000',
  `multfactor` decimal(10,5) NOT NULL default '1.00000',
  `plusfactor` decimal(10,5) NOT NULL default '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL default '0.00000',
  `sortorder` bigint(10) NOT NULL default '0',
  `display` bigint(10) NOT NULL default '0',
  `decimals` tinyint(1) unsigned default NULL,
  `hidden` bigint(10) NOT NULL default '0',
  `locked` bigint(10) NOT NULL default '0',
  `locktime` bigint(10) unsigned NOT NULL default '0',
  `needsupdate` bigint(10) NOT NULL default '0',
  `timecreated` bigint(10) unsigned default NULL,
  `timemodified` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_items`
--

LOCK TABLES `mdl_grade_items` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items_history`
--

DROP TABLE IF EXISTS `mdl_grade_items_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `action` bigint(10) unsigned NOT NULL default '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) default NULL,
  `timemodified` bigint(10) unsigned default NULL,
  `loggeduser` bigint(10) unsigned default NULL,
  `courseid` bigint(10) unsigned default NULL,
  `categoryid` bigint(10) unsigned default NULL,
  `itemname` varchar(255) default NULL,
  `itemtype` varchar(30) NOT NULL default '',
  `itemmodule` varchar(30) default NULL,
  `iteminstance` bigint(10) unsigned default NULL,
  `itemnumber` bigint(10) unsigned default NULL,
  `iteminfo` mediumtext,
  `idnumber` varchar(255) default NULL,
  `calculation` mediumtext,
  `gradetype` smallint(4) NOT NULL default '1',
  `grademax` decimal(10,5) NOT NULL default '100.00000',
  `grademin` decimal(10,5) NOT NULL default '0.00000',
  `scaleid` bigint(10) unsigned default NULL,
  `outcomeid` bigint(10) unsigned default NULL,
  `gradepass` decimal(10,5) NOT NULL default '0.00000',
  `multfactor` decimal(10,5) NOT NULL default '1.00000',
  `plusfactor` decimal(10,5) NOT NULL default '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL default '0.00000',
  `sortorder` bigint(10) NOT NULL default '0',
  `display` bigint(10) NOT NULL default '0',
  `decimals` tinyint(1) unsigned default NULL,
  `hidden` bigint(10) NOT NULL default '0',
  `locked` bigint(10) NOT NULL default '0',
  `locktime` bigint(10) unsigned NOT NULL default '0',
  `needsupdate` bigint(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_items_history`
--

LOCK TABLES `mdl_grade_items_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_letters`
--

DROP TABLE IF EXISTS `mdl_grade_letters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `contextid` bigint(10) unsigned NOT NULL default '0',
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_gradlett_conlow_ix` (`contextid`,`lowerboundary`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to convert numerical grades to letter grades';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_letters`
--

LOCK TABLES `mdl_grade_letters` WRITE;
/*!40000 ALTER TABLE `mdl_grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned default NULL,
  `shortname` varchar(255) NOT NULL default '',
  `fullname` text NOT NULL,
  `scaleid` bigint(10) unsigned default NULL,
  `description` text,
  `timecreated` bigint(10) unsigned default NULL,
  `timemodified` bigint(10) unsigned default NULL,
  `usermodified` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_outcomes`
--

LOCK TABLES `mdl_grade_outcomes` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_courses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL,
  `outcomeid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_outcomes_courses`
--

LOCK TABLES `mdl_grade_outcomes_courses` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_history`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `action` bigint(10) unsigned NOT NULL default '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) default NULL,
  `timemodified` bigint(10) unsigned default NULL,
  `loggeduser` bigint(10) unsigned default NULL,
  `courseid` bigint(10) unsigned default NULL,
  `shortname` varchar(255) NOT NULL default '',
  `fullname` text NOT NULL,
  `scaleid` bigint(10) unsigned default NULL,
  `description` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_outcomes_history`
--

LOCK TABLES `mdl_grade_outcomes_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_settings`
--

DROP TABLE IF EXISTS `mdl_grade_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `value` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_grade_settings`
--

LOCK TABLES `mdl_grade_settings` WRITE;
/*!40000 ALTER TABLE `mdl_grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings`
--

DROP TABLE IF EXISTS `mdl_groupings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` text,
  `configdata` text,
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_groupings`
--

LOCK TABLES `mdl_groupings` WRITE;
/*!40000 ALTER TABLE `mdl_groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings_groups`
--

DROP TABLE IF EXISTS `mdl_groupings_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL auto_increment,
  `groupingid` bigint(10) unsigned NOT NULL default '0',
  `groupid` bigint(10) unsigned NOT NULL,
  `timeadded` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a group to a grouping.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_groupings_groups`
--

LOCK TABLES `mdl_groupings_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups`
--

DROP TABLE IF EXISTS `mdl_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_groups` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(254) NOT NULL default '',
  `description` text,
  `enrolmentkey` varchar(50) default NULL,
  `picture` bigint(10) unsigned NOT NULL default '0',
  `hidepicture` tinyint(1) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_groups`
--

LOCK TABLES `mdl_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups_members`
--

DROP TABLE IF EXISTS `mdl_groups_members`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `groupid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `timeadded` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_groups_members`
--

LOCK TABLES `mdl_groups_members` WRITE;
/*!40000 ALTER TABLE `mdl_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_hotpot`
--

DROP TABLE IF EXISTS `mdl_hotpot`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_hotpot` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `summary` text NOT NULL,
  `timeopen` bigint(10) unsigned NOT NULL default '0',
  `timeclose` bigint(10) unsigned NOT NULL default '0',
  `location` smallint(4) unsigned NOT NULL default '0',
  `reference` varchar(255) NOT NULL default '',
  `outputformat` smallint(4) unsigned NOT NULL default '1',
  `navigation` smallint(4) unsigned NOT NULL default '1',
  `studentfeedback` smallint(4) unsigned NOT NULL default '0',
  `studentfeedbackurl` varchar(255) NOT NULL default '',
  `forceplugins` smallint(4) unsigned NOT NULL default '0',
  `shownextquiz` smallint(4) unsigned NOT NULL default '0',
  `review` smallint(4) NOT NULL default '0',
  `grade` bigint(10) NOT NULL default '0',
  `grademethod` smallint(4) NOT NULL default '1',
  `attempts` mediumint(6) NOT NULL default '0',
  `password` varchar(255) NOT NULL default '',
  `subnet` varchar(255) NOT NULL default '',
  `clickreporting` smallint(4) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about Hot Potatoes quizzes';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_hotpot`
--

LOCK TABLES `mdl_hotpot` WRITE;
/*!40000 ALTER TABLE `mdl_hotpot` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_hotpot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_hotpot_attempts`
--

DROP TABLE IF EXISTS `mdl_hotpot_attempts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_hotpot_attempts` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `hotpot` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `starttime` bigint(10) unsigned NOT NULL default '0',
  `endtime` bigint(10) unsigned NOT NULL default '0',
  `score` mediumint(6) unsigned NOT NULL default '0',
  `penalties` mediumint(6) unsigned NOT NULL default '0',
  `attempt` mediumint(6) unsigned NOT NULL default '0',
  `timestart` bigint(10) unsigned NOT NULL default '0',
  `timefinish` bigint(10) unsigned NOT NULL default '0',
  `status` smallint(4) unsigned NOT NULL default '1',
  `clickreportid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_hotpatte_use_ix` (`userid`),
  KEY `mdl_hotpatte_hot_ix` (`hotpot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about Hot Potatoes quiz attempts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_hotpot_attempts`
--

LOCK TABLES `mdl_hotpot_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_hotpot_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_hotpot_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_hotpot_details`
--

DROP TABLE IF EXISTS `mdl_hotpot_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_hotpot_details` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `attempt` bigint(10) unsigned NOT NULL default '0',
  `details` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_hotpdeta_att_ix` (`attempt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='raw details (as XML) of Hot Potatoes quiz attempts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_hotpot_details`
--

LOCK TABLES `mdl_hotpot_details` WRITE;
/*!40000 ALTER TABLE `mdl_hotpot_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_hotpot_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_hotpot_questions`
--

DROP TABLE IF EXISTS `mdl_hotpot_questions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_hotpot_questions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` text NOT NULL,
  `type` smallint(4) unsigned NOT NULL default '0',
  `text` bigint(10) unsigned NOT NULL default '0',
  `hotpot` bigint(10) unsigned NOT NULL default '0',
  `md5key` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_hotpques_md5_ix` (`md5key`),
  KEY `mdl_hotpques_hot_ix` (`hotpot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about questions in Hot Potatoes quiz attempts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_hotpot_questions`
--

LOCK TABLES `mdl_hotpot_questions` WRITE;
/*!40000 ALTER TABLE `mdl_hotpot_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_hotpot_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_hotpot_responses`
--

DROP TABLE IF EXISTS `mdl_hotpot_responses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_hotpot_responses` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `attempt` bigint(10) unsigned NOT NULL default '0',
  `question` bigint(10) unsigned NOT NULL default '0',
  `score` mediumint(6) NOT NULL default '0',
  `weighting` mediumint(6) NOT NULL default '0',
  `correct` varchar(255) NOT NULL default '',
  `wrong` varchar(255) NOT NULL default '',
  `ignored` varchar(255) NOT NULL default '',
  `hints` mediumint(6) unsigned NOT NULL default '0',
  `clues` mediumint(6) unsigned NOT NULL default '0',
  `checks` mediumint(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_hotpresp_att_ix` (`attempt`),
  KEY `mdl_hotpresp_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about responses in Hot Potatoes quiz attempts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_hotpot_responses`
--

LOCK TABLES `mdl_hotpot_responses` WRITE;
/*!40000 ALTER TABLE `mdl_hotpot_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_hotpot_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_hotpot_strings`
--

DROP TABLE IF EXISTS `mdl_hotpot_strings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_hotpot_strings` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `string` text NOT NULL,
  `md5key` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_hotpstri_md5_ix` (`md5key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='strings used in Hot Potatoes questions and responses';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_hotpot_strings`
--

LOCK TABLES `mdl_hotpot_strings` WRITE;
/*!40000 ALTER TABLE `mdl_hotpot_strings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_hotpot_strings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilp_block`
--

DROP TABLE IF EXISTS `mdl_ilp_block`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilp_block` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ILP block table - not yet utilised';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilp_block`
--

LOCK TABLES `mdl_ilp_block` WRITE;
/*!40000 ALTER TABLE `mdl_ilp_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilp_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilp_module_template`
--

DROP TABLE IF EXISTS `mdl_ilp_module_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilp_module_template` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `module` varchar(50) NOT NULL default '0',
  `status` smallint(4) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL default '0',
  `text` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines templates for the modules of the ILP';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilp_module_template`
--

LOCK TABLES `mdl_ilp_module_template` WRITE;
/*!40000 ALTER TABLE `mdl_ilp_module_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilp_module_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilp_student_info_per_student`
--

DROP TABLE IF EXISTS `mdl_ilp_student_info_per_student`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilp_student_info_per_student` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `student_userid` bigint(10) unsigned NOT NULL default '0',
  `teacher_textid` bigint(10) unsigned default NULL,
  `shared_textid` bigint(10) unsigned default NULL,
  `student_textid` bigint(10) unsigned default NULL,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Student info block per student. links to user - student. and';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilp_student_info_per_student`
--

LOCK TABLES `mdl_ilp_student_info_per_student` WRITE;
/*!40000 ALTER TABLE `mdl_ilp_student_info_per_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilp_student_info_per_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilp_student_info_per_teacher`
--

DROP TABLE IF EXISTS `mdl_ilp_student_info_per_teacher`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilp_student_info_per_teacher` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `student_userid` bigint(10) unsigned NOT NULL default '0',
  `teacher_userid` bigint(10) unsigned default NULL,
  `teacher_textid` bigint(10) unsigned default NULL,
  `shared_textid` bigint(10) unsigned default NULL,
  `student_textid` bigint(10) unsigned default NULL,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Student info block per teacher. links to user twice - studen';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilp_student_info_per_teacher`
--

LOCK TABLES `mdl_ilp_student_info_per_teacher` WRITE;
/*!40000 ALTER TABLE `mdl_ilp_student_info_per_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilp_student_info_per_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilp_student_info_per_tutor`
--

DROP TABLE IF EXISTS `mdl_ilp_student_info_per_tutor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilp_student_info_per_tutor` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `student_userid` bigint(10) unsigned NOT NULL default '0',
  `teacher_userid` bigint(10) unsigned default NULL,
  `teacher_textid` bigint(10) unsigned default NULL,
  `shared_textid` bigint(10) unsigned default NULL,
  `student_textid` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Student info block per personal tutor info. links to user tw';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilp_student_info_per_tutor`
--

LOCK TABLES `mdl_ilp_student_info_per_tutor` WRITE;
/*!40000 ALTER TABLE `mdl_ilp_student_info_per_tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilp_student_info_per_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilp_student_info_text`
--

DROP TABLE IF EXISTS `mdl_ilp_student_info_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilp_student_info_text` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `text` mediumtext,
  `lastchanged_datetime` bigint(10) unsigned NOT NULL default '0',
  `lastchanged_userid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Student info block text. links to nothing except last user t';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilp_student_info_text`
--

LOCK TABLES `mdl_ilp_student_info_text` WRITE;
/*!40000 ALTER TABLE `mdl_ilp_student_info_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilp_student_info_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilpconcern`
--

DROP TABLE IF EXISTS `mdl_ilpconcern`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilpconcern` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` text NOT NULL,
  `var1` bigint(10) default '0',
  `var2` bigint(10) default '0',
  `var3` bigint(10) default '0',
  `var4` bigint(10) default '0',
  `var5` bigint(10) default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines a concerns module';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilpconcern`
--

LOCK TABLES `mdl_ilpconcern` WRITE;
/*!40000 ALTER TABLE `mdl_ilpconcern` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilpconcern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilpconcern_comments`
--

DROP TABLE IF EXISTS `mdl_ilpconcern_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilpconcern_comments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `concernspost` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `created` bigint(10) unsigned NOT NULL default '0',
  `modified` bigint(10) unsigned NOT NULL default '0',
  `comment` text NOT NULL,
  `format` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_ilpccomm_use_ix` (`userid`),
  KEY `mdl_ilpccomm_cre_ix` (`created`),
  KEY `mdl_ilpccomm_con_ix` (`concernspost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Comments on particular concerns';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilpconcern_comments`
--

LOCK TABLES `mdl_ilpconcern_comments` WRITE;
/*!40000 ALTER TABLE `mdl_ilpconcern_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilpconcern_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilpconcern_posts`
--

DROP TABLE IF EXISTS `mdl_ilpconcern_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilpconcern_posts` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `concerns` bigint(10) unsigned NOT NULL default '0',
  `setforuserid` bigint(10) unsigned NOT NULL default '0',
  `setbyuserid` bigint(10) unsigned NOT NULL default '0',
  `course` bigint(10) unsigned NOT NULL default '0',
  `courserelated` tinyint(1) unsigned NOT NULL default '0',
  `targetcourse` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `deadline` bigint(10) unsigned NOT NULL default '0',
  `data1` text NOT NULL,
  `data2` text NOT NULL,
  `concernset` text NOT NULL,
  `status` smallint(4) unsigned NOT NULL default '0',
  `format` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_ilpcpost_set_ix` (`setforuserid`),
  KEY `mdl_ilpcpost_con_ix` (`concerns`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='concerns set for students';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilpconcern_posts`
--

LOCK TABLES `mdl_ilpconcern_posts` WRITE;
/*!40000 ALTER TABLE `mdl_ilpconcern_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilpconcern_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilpconcern_status`
--

DROP TABLE IF EXISTS `mdl_ilpconcern_status`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilpconcern_status` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `created` bigint(10) unsigned NOT NULL default '0',
  `modified` bigint(10) unsigned NOT NULL default '0',
  `modifiedbyuser` bigint(10) unsigned NOT NULL default '0',
  `status` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_ilpcstat_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Student status';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilpconcern_status`
--

LOCK TABLES `mdl_ilpconcern_status` WRITE;
/*!40000 ALTER TABLE `mdl_ilpconcern_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilpconcern_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilptarget`
--

DROP TABLE IF EXISTS `mdl_ilptarget`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilptarget` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` text NOT NULL,
  `var1` bigint(10) default '0',
  `var2` bigint(10) default '0',
  `var3` bigint(10) default '0',
  `var4` bigint(10) default '0',
  `var5` bigint(10) default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines a target module';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilptarget`
--

LOCK TABLES `mdl_ilptarget` WRITE;
/*!40000 ALTER TABLE `mdl_ilptarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilptarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilptarget_comments`
--

DROP TABLE IF EXISTS `mdl_ilptarget_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilptarget_comments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `targetpost` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `created` bigint(10) unsigned NOT NULL default '0',
  `modified` bigint(10) unsigned NOT NULL default '0',
  `comment` text NOT NULL,
  `format` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_ilptcomm_use_ix` (`userid`),
  KEY `mdl_ilptcomm_cre_ix` (`created`),
  KEY `mdl_ilptcomm_tar_ix` (`targetpost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Comments on particular targets';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilptarget_comments`
--

LOCK TABLES `mdl_ilptarget_comments` WRITE;
/*!40000 ALTER TABLE `mdl_ilptarget_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilptarget_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_ilptarget_posts`
--

DROP TABLE IF EXISTS `mdl_ilptarget_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_ilptarget_posts` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `target` bigint(10) unsigned NOT NULL default '0',
  `setforuserid` bigint(10) unsigned NOT NULL default '0',
  `setbyuserid` bigint(10) unsigned NOT NULL default '0',
  `course` bigint(10) unsigned NOT NULL default '0',
  `courserelated` tinyint(1) unsigned NOT NULL default '0',
  `targetcourse` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `deadline` bigint(10) unsigned NOT NULL default '0',
  `data1` text NOT NULL,
  `data2` text NOT NULL,
  `name` varchar(255) default NULL,
  `targetset` text NOT NULL,
  `status` smallint(4) unsigned NOT NULL default '0',
  `format` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_ilptpost_set_ix` (`setforuserid`),
  KEY `mdl_ilptpost_tar_ix` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Targets set for students';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_ilptarget_posts`
--

LOCK TABLES `mdl_ilptarget_posts` WRITE;
/*!40000 ALTER TABLE `mdl_ilptarget_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_ilptarget_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_inwi_cours_medias`
--

DROP TABLE IF EXISTS `mdl_inwi_cours_medias`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_inwi_cours_medias` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `code_cours` varchar(40) NOT NULL default '0',
  `media_ref` varchar(40) NOT NULL default '0',
  `visible` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='inwi_cours_medias table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_inwi_cours_medias`
--

LOCK TABLES `mdl_inwi_cours_medias` WRITE;
/*!40000 ALTER TABLE `mdl_inwi_cours_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_inwi_cours_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_inwi_map_medias`
--

DROP TABLE IF EXISTS `mdl_inwi_map_medias`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_inwi_map_medias` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `mediamap_ref` varchar(20) NOT NULL default '',
  `media_ref` varchar(20) NOT NULL default '',
  `label` varchar(250) NOT NULL default '',
  `html` text NOT NULL,
  `lat` varchar(10) NOT NULL default '0',
  `lng` varchar(10) NOT NULL default '0',
  `icon` varchar(30) NOT NULL default 'default',
  `date_created` datetime default NULL,
  `visible` smallint(4) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='inwi_map_medias table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_inwi_map_medias`
--

LOCK TABLES `mdl_inwi_map_medias` WRITE;
/*!40000 ALTER TABLE `mdl_inwi_map_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_inwi_map_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_inwi_medias`
--

DROP TABLE IF EXISTS `mdl_inwi_medias`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_inwi_medias` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `media_ref` varchar(20) NOT NULL default '',
  `user_name` varchar(30) NOT NULL default '',
  `media_type` varchar(20) NOT NULL default '',
  `media_format` varchar(20) NOT NULL default '',
  `title` varchar(100) NOT NULL default '',
  `description` varchar(250) NOT NULL default '',
  `author` varchar(250) NOT NULL default '',
  `copyright` varchar(250) NOT NULL default '',
  `media_url` varchar(100) NOT NULL default '',
  `preview_url` varchar(250) NOT NULL default '',
  `embedded_player` text NOT NULL,
  `tags` varchar(250) NOT NULL default '',
  `status` bigint(11) unsigned NOT NULL default '0',
  `width` smallint(4) unsigned NOT NULL default '480',
  `height` smallint(4) unsigned NOT NULL default '360',
  `date_created` datetime default NULL,
  `date_started` datetime default NULL,
  `date_ended` datetime default NULL,
  `viewed` smallint(4) unsigned NOT NULL default '0',
  `votes` smallint(4) unsigned NOT NULL default '0',
  `is_public` smallint(4) unsigned NOT NULL default '0',
  `is_downloadable` smallint(4) unsigned NOT NULL default '1',
  `contentid` bigint(11) unsigned NOT NULL default '0',
  `catid` bigint(11) unsigned NOT NULL default '0',
  `channelid` bigint(11) unsigned NOT NULL default '0',
  `module_ref` varchar(30) NOT NULL default '',
  `map_lat` varchar(20) NOT NULL default '',
  `map_lng` varchar(20) NOT NULL default '',
  `map_type` varchar(20) NOT NULL default 'G_NORMAL_MAP',
  `map_zoom` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='inwi_medias table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_inwi_medias`
--

LOCK TABLES `mdl_inwi_medias` WRITE;
/*!40000 ALTER TABLE `mdl_inwi_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_inwi_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_inwicast`
--

DROP TABLE IF EXISTS `mdl_inwicast`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_inwicast` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `mediaid` smallint(4) unsigned NOT NULL default '0',
  `intro` mediumtext,
  `introformat` smallint(4) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_inwi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for inwicast, please edit me';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_inwicast`
--

LOCK TABLES `mdl_inwicast` WRITE;
/*!40000 ALTER TABLE `mdl_inwicast` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_inwicast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_journal`
--

DROP TABLE IF EXISTS `mdl_journal`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_journal` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `introformat` tinyint(2) NOT NULL default '0',
  `days` mediumint(5) unsigned NOT NULL default '7',
  `assessed` bigint(10) NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_jour_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='data for each journal';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_journal`
--

LOCK TABLES `mdl_journal` WRITE;
/*!40000 ALTER TABLE `mdl_journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_journal_entries`
--

DROP TABLE IF EXISTS `mdl_journal_entries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_journal_entries` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `journal` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `modified` bigint(10) unsigned NOT NULL default '0',
  `text` text NOT NULL,
  `format` tinyint(2) NOT NULL default '0',
  `rating` bigint(10) default '0',
  `entrycomment` text,
  `teacher` bigint(10) unsigned NOT NULL default '0',
  `timemarked` bigint(10) unsigned NOT NULL default '0',
  `mailed` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_jourentr_use_ix` (`userid`),
  KEY `mdl_jourentr_jou_ix` (`journal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='All the journal entries of all people';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_journal_entries`
--

LOCK TABLES `mdl_journal_entries` WRITE;
/*!40000 ALTER TABLE `mdl_journal_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_journal_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_label`
--

DROP TABLE IF EXISTS `mdl_label`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_label` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines labels';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_label`
--

LOCK TABLES `mdl_label` WRITE;
/*!40000 ALTER TABLE `mdl_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lams`
--

DROP TABLE IF EXISTS `mdl_lams`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lams` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `introduction` text NOT NULL,
  `learning_session_id` bigint(20) default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_lams_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='LAMS activity';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lams`
--

LOCK TABLES `mdl_lams` WRITE;
/*!40000 ALTER TABLE `mdl_lams` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson`
--

DROP TABLE IF EXISTS `mdl_lesson`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `practice` smallint(3) unsigned NOT NULL default '0',
  `modattempts` smallint(3) unsigned NOT NULL default '0',
  `usepassword` smallint(3) unsigned NOT NULL default '0',
  `password` varchar(32) NOT NULL default '',
  `dependency` bigint(10) unsigned NOT NULL default '0',
  `conditions` text NOT NULL,
  `grade` smallint(3) NOT NULL default '0',
  `custom` smallint(3) unsigned NOT NULL default '0',
  `ongoing` smallint(3) unsigned NOT NULL default '0',
  `usemaxgrade` smallint(3) NOT NULL default '0',
  `maxanswers` smallint(3) unsigned NOT NULL default '4',
  `maxattempts` smallint(3) unsigned NOT NULL default '5',
  `review` smallint(3) unsigned NOT NULL default '0',
  `nextpagedefault` smallint(3) unsigned NOT NULL default '0',
  `feedback` smallint(3) unsigned NOT NULL default '1',
  `minquestions` smallint(3) unsigned NOT NULL default '0',
  `maxpages` smallint(3) unsigned NOT NULL default '0',
  `timed` smallint(3) unsigned NOT NULL default '0',
  `maxtime` bigint(10) unsigned NOT NULL default '0',
  `retake` smallint(3) unsigned NOT NULL default '1',
  `activitylink` bigint(10) unsigned NOT NULL default '0',
  `mediafile` varchar(255) NOT NULL default '',
  `mediaheight` bigint(10) unsigned NOT NULL default '100',
  `mediawidth` bigint(10) unsigned NOT NULL default '650',
  `mediaclose` smallint(3) unsigned NOT NULL default '0',
  `slideshow` smallint(3) unsigned NOT NULL default '0',
  `width` bigint(10) unsigned NOT NULL default '640',
  `height` bigint(10) unsigned NOT NULL default '480',
  `bgcolor` varchar(7) NOT NULL default '#FFFFFF',
  `displayleft` smallint(3) unsigned NOT NULL default '0',
  `displayleftif` smallint(3) unsigned NOT NULL default '0',
  `progressbar` smallint(3) unsigned NOT NULL default '0',
  `highscores` smallint(3) unsigned NOT NULL default '0',
  `maxhighscores` bigint(10) unsigned NOT NULL default '0',
  `available` bigint(10) unsigned NOT NULL default '0',
  `deadline` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson`
--

LOCK TABLES `mdl_lesson` WRITE;
/*!40000 ALTER TABLE `mdl_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_answers`
--

DROP TABLE IF EXISTS `mdl_lesson_answers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `lessonid` bigint(10) unsigned NOT NULL default '0',
  `pageid` bigint(10) unsigned NOT NULL default '0',
  `jumpto` bigint(11) NOT NULL default '0',
  `grade` smallint(3) unsigned NOT NULL default '0',
  `score` bigint(10) NOT NULL default '0',
  `flags` smallint(3) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `answer` text,
  `response` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson_answers`
--

LOCK TABLES `mdl_lesson_answers` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_attempts`
--

DROP TABLE IF EXISTS `mdl_lesson_attempts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `lessonid` bigint(10) unsigned NOT NULL default '0',
  `pageid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `answerid` bigint(10) unsigned NOT NULL default '0',
  `retry` smallint(3) unsigned NOT NULL default '0',
  `correct` bigint(10) unsigned NOT NULL default '0',
  `useranswer` text,
  `timeseen` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson_attempts`
--

LOCK TABLES `mdl_lesson_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_branch`
--

DROP TABLE IF EXISTS `mdl_lesson_branch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `lessonid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `pageid` bigint(10) unsigned NOT NULL default '0',
  `retry` bigint(10) unsigned NOT NULL default '0',
  `flag` smallint(3) unsigned NOT NULL default '0',
  `timeseen` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson_branch`
--

LOCK TABLES `mdl_lesson_branch` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_default`
--

DROP TABLE IF EXISTS `mdl_lesson_default`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson_default` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `practice` smallint(3) unsigned NOT NULL default '0',
  `modattempts` smallint(3) unsigned NOT NULL default '0',
  `usepassword` smallint(3) unsigned NOT NULL default '0',
  `password` varchar(32) NOT NULL default '',
  `conditions` text NOT NULL,
  `grade` smallint(3) NOT NULL default '0',
  `custom` smallint(3) unsigned NOT NULL default '0',
  `ongoing` smallint(3) unsigned NOT NULL default '0',
  `usemaxgrade` smallint(3) unsigned NOT NULL default '0',
  `maxanswers` smallint(3) unsigned NOT NULL default '4',
  `maxattempts` smallint(3) unsigned NOT NULL default '5',
  `review` smallint(3) unsigned NOT NULL default '0',
  `nextpagedefault` smallint(3) unsigned NOT NULL default '0',
  `feedback` smallint(3) unsigned NOT NULL default '1',
  `minquestions` smallint(3) unsigned NOT NULL default '0',
  `maxpages` smallint(3) unsigned NOT NULL default '0',
  `timed` smallint(3) unsigned NOT NULL default '0',
  `maxtime` bigint(10) unsigned NOT NULL default '0',
  `retake` smallint(3) unsigned NOT NULL default '1',
  `mediaheight` bigint(10) unsigned NOT NULL default '100',
  `mediawidth` bigint(10) unsigned NOT NULL default '650',
  `mediaclose` smallint(3) unsigned NOT NULL default '0',
  `slideshow` smallint(3) unsigned NOT NULL default '0',
  `width` bigint(10) unsigned NOT NULL default '640',
  `height` bigint(10) unsigned NOT NULL default '480',
  `bgcolor` varchar(7) default '#FFFFFF',
  `displayleft` smallint(3) unsigned NOT NULL default '0',
  `displayleftif` smallint(3) unsigned NOT NULL default '0',
  `progressbar` smallint(3) unsigned NOT NULL default '0',
  `highscores` smallint(3) unsigned NOT NULL default '0',
  `maxhighscores` bigint(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_default';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson_default`
--

LOCK TABLES `mdl_lesson_default` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_grades`
--

DROP TABLE IF EXISTS `mdl_lesson_grades`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `lessonid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `grade` double unsigned NOT NULL default '0',
  `late` smallint(3) unsigned NOT NULL default '0',
  `completed` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson_grades`
--

LOCK TABLES `mdl_lesson_grades` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_high_scores`
--

DROP TABLE IF EXISTS `mdl_lesson_high_scores`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson_high_scores` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `lessonid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `gradeid` bigint(10) unsigned NOT NULL default '0',
  `nickname` varchar(5) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson_high_scores`
--

LOCK TABLES `mdl_lesson_high_scores` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_high_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_high_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_pages`
--

DROP TABLE IF EXISTS `mdl_lesson_pages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `lessonid` bigint(10) unsigned NOT NULL default '0',
  `prevpageid` bigint(10) unsigned NOT NULL default '0',
  `nextpageid` bigint(10) unsigned NOT NULL default '0',
  `qtype` smallint(3) unsigned NOT NULL default '0',
  `qoption` smallint(3) unsigned NOT NULL default '0',
  `layout` smallint(3) unsigned NOT NULL default '1',
  `display` smallint(3) unsigned NOT NULL default '1',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `contents` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson_pages`
--

LOCK TABLES `mdl_lesson_pages` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_timer`
--

DROP TABLE IF EXISTS `mdl_lesson_timer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `lessonid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `starttime` bigint(10) unsigned NOT NULL default '0',
  `lessontime` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lesson_timer`
--

LOCK TABLES `mdl_lesson_timer` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lightboxgallery`
--

DROP TABLE IF EXISTS `mdl_lightboxgallery`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lightboxgallery` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `folder` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `perpage` smallint(3) unsigned NOT NULL default '0',
  `comments` tinyint(1) unsigned NOT NULL default '0',
  `ispublic` tinyint(1) unsigned NOT NULL default '0',
  `rss` tinyint(1) unsigned NOT NULL default '0',
  `autoresize` tinyint(1) unsigned NOT NULL default '0',
  `resize` tinyint(1) unsigned NOT NULL default '0',
  `extinfo` tinyint(1) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_ligh_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lightboxgallery activities';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lightboxgallery`
--

LOCK TABLES `mdl_lightboxgallery` WRITE;
/*!40000 ALTER TABLE `mdl_lightboxgallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lightboxgallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lightboxgallery_comments`
--

DROP TABLE IF EXISTS `mdl_lightboxgallery_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lightboxgallery_comments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `gallery` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `comment` text NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_lighcomm_gal_ix` (`gallery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains comments attached to lightboxgallery resources';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lightboxgallery_comments`
--

LOCK TABLES `mdl_lightboxgallery_comments` WRITE;
/*!40000 ALTER TABLE `mdl_lightboxgallery_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lightboxgallery_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lightboxgallery_image_meta`
--

DROP TABLE IF EXISTS `mdl_lightboxgallery_image_meta`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_lightboxgallery_image_meta` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `gallery` bigint(10) unsigned NOT NULL default '0',
  `image` varchar(255) NOT NULL default '',
  `metatype` enum('caption','tag') NOT NULL default 'caption',
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_lighimagmeta_gal_ix` (`gallery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Meta data linked to gallery images';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_lightboxgallery_image_meta`
--

LOCK TABLES `mdl_lightboxgallery_image_meta` WRITE;
/*!40000 ALTER TABLE `mdl_lightboxgallery_image_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lightboxgallery_image_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log`
--

DROP TABLE IF EXISTS `mdl_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_log` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `time` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `ip` varchar(15) NOT NULL default '',
  `course` bigint(10) unsigned NOT NULL default '0',
  `module` varchar(20) NOT NULL default '',
  `cmid` bigint(10) unsigned NOT NULL default '0',
  `action` varchar(40) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `info` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_log`
--

LOCK TABLES `mdl_log` WRITE;
/*!40000 ALTER TABLE `mdl_log` DISABLE KEYS */;
INSERT INTO `mdl_log` VALUES (1,1201718788,2,'140.211.18.56',1,'user',0,'update','view.php?id=2&course=1',' ');
INSERT INTO `mdl_log` VALUES (2,1201718788,2,'140.211.18.56',1,'upload',0,'upload','http://template.orvsd.org/moodle/user/editadvanced.php?id=2','/var/www/localhost/template.orvsd.org/moodledata/user/0/2/logo.png');
INSERT INTO `mdl_log` VALUES (3,1201718847,2,'140.211.18.56',1,'course',0,'view','view.php?id=1','1');
INSERT INTO `mdl_log` VALUES (4,1201719206,2,'140.211.18.56',1,'user',0,'view','view.php?id=2&course=1','2');
INSERT INTO `mdl_log` VALUES (13,1283906970,13,'140.211.18.56',1,'course',0,'view','view.php?id=1','1');
INSERT INTO `mdl_log` VALUES (23,1283906976,13,'140.211.18.56',1,'course',0,'view','view.php?id=1','1');
INSERT INTO `mdl_log` VALUES (33,1283906982,13,'140.211.18.56',1,'user',0,'logout','view.php?id=13&course=1','13');
INSERT INTO `mdl_log` VALUES (43,1283907056,2,'140.211.18.56',1,'user',0,'login','view.php?id=0&course=1','2');
INSERT INTO `mdl_log` VALUES (53,1283907086,2,'140.211.18.56',1,'user',0,'change password','view.php?id=2&course=1','2');
INSERT INTO `mdl_log` VALUES (63,1283907539,0,'140.211.18.56',0,'login',0,'error','index.php','admin');
INSERT INTO `mdl_log` VALUES (73,1283907573,2,'140.211.18.56',1,'user',0,'login','view.php?id=0&course=1','2');
INSERT INTO `mdl_log` VALUES (83,1283907622,2,'140.211.18.56',1,'user',0,'change password','view.php?id=2&course=1','2');
INSERT INTO `mdl_log` VALUES (93,1283907625,2,'140.211.18.56',1,'user',0,'view','view.php?id=2&course=1','2');
INSERT INTO `mdl_log` VALUES (103,1283907627,2,'140.211.18.56',1,'course',0,'view','view.php?id=1','1');
INSERT INTO `mdl_log` VALUES (113,1283907645,2,'140.211.18.56',1,'user',0,'view','view.php?id=2&course=1','2');
INSERT INTO `mdl_log` VALUES (123,1283907653,2,'140.211.18.56',1,'user',0,'change password','view.php?id=2&course=1','2');
INSERT INTO `mdl_log` VALUES (133,1283907654,2,'140.211.18.56',1,'user',0,'view','view.php?id=2&course=1','2');
/*!40000 ALTER TABLE `mdl_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_display`
--

DROP TABLE IF EXISTS `mdl_log_display`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_log_display` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `module` varchar(20) NOT NULL default '',
  `action` varchar(40) NOT NULL default '',
  `mtable` varchar(30) NOT NULL default '',
  `field` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=474 DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_log_display`
--

LOCK TABLES `mdl_log_display` WRITE;
/*!40000 ALTER TABLE `mdl_log_display` DISABLE KEYS */;
INSERT INTO `mdl_log_display` VALUES (1,'user','view','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (2,'course','user report','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (3,'course','view','course','fullname');
INSERT INTO `mdl_log_display` VALUES (4,'course','update','course','fullname');
INSERT INTO `mdl_log_display` VALUES (5,'course','enrol','course','fullname');
INSERT INTO `mdl_log_display` VALUES (6,'course','report log','course','fullname');
INSERT INTO `mdl_log_display` VALUES (7,'course','report live','course','fullname');
INSERT INTO `mdl_log_display` VALUES (8,'course','report outline','course','fullname');
INSERT INTO `mdl_log_display` VALUES (9,'course','report participation','course','fullname');
INSERT INTO `mdl_log_display` VALUES (10,'course','report stats','course','fullname');
INSERT INTO `mdl_log_display` VALUES (11,'message','write','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (12,'message','read','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (13,'message','add contact','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (14,'message','remove contact','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (15,'message','block contact','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (16,'message','unblock contact','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (17,'group','view','groups','name');
INSERT INTO `mdl_log_display` VALUES (18,'assignment','view','assignment','name');
INSERT INTO `mdl_log_display` VALUES (19,'assignment','add','assignment','name');
INSERT INTO `mdl_log_display` VALUES (20,'assignment','update','assignment','name');
INSERT INTO `mdl_log_display` VALUES (21,'assignment','view submission','assignment','name');
INSERT INTO `mdl_log_display` VALUES (22,'assignment','upload','assignment','name');
INSERT INTO `mdl_log_display` VALUES (23,'chat','view','chat','name');
INSERT INTO `mdl_log_display` VALUES (24,'chat','add','chat','name');
INSERT INTO `mdl_log_display` VALUES (25,'chat','update','chat','name');
INSERT INTO `mdl_log_display` VALUES (26,'chat','report','chat','name');
INSERT INTO `mdl_log_display` VALUES (27,'chat','talk','chat','name');
INSERT INTO `mdl_log_display` VALUES (28,'choice','view','choice','name');
INSERT INTO `mdl_log_display` VALUES (29,'choice','update','choice','name');
INSERT INTO `mdl_log_display` VALUES (30,'choice','add','choice','name');
INSERT INTO `mdl_log_display` VALUES (31,'choice','report','choice','name');
INSERT INTO `mdl_log_display` VALUES (32,'choice','choose','choice','name');
INSERT INTO `mdl_log_display` VALUES (33,'choice','choose again','choice','name');
INSERT INTO `mdl_log_display` VALUES (34,'data','view','data','name');
INSERT INTO `mdl_log_display` VALUES (35,'data','add','data','name');
INSERT INTO `mdl_log_display` VALUES (36,'data','update','data','name');
INSERT INTO `mdl_log_display` VALUES (37,'data','record delete','data','name');
INSERT INTO `mdl_log_display` VALUES (38,'data','fields add','data_fields','name');
INSERT INTO `mdl_log_display` VALUES (39,'data','fields update','data_fields','name');
INSERT INTO `mdl_log_display` VALUES (40,'data','templates saved','data','name');
INSERT INTO `mdl_log_display` VALUES (41,'data','templates def','data','name');
INSERT INTO `mdl_log_display` VALUES (42,'forum','add','forum','name');
INSERT INTO `mdl_log_display` VALUES (43,'forum','update','forum','name');
INSERT INTO `mdl_log_display` VALUES (44,'forum','add discussion','forum_discussions','name');
INSERT INTO `mdl_log_display` VALUES (45,'forum','add post','forum_posts','subject');
INSERT INTO `mdl_log_display` VALUES (46,'forum','update post','forum_posts','subject');
INSERT INTO `mdl_log_display` VALUES (47,'forum','user report','user','CONCAT(firstname,\' \',lastname)');
INSERT INTO `mdl_log_display` VALUES (48,'forum','move discussion','forum_discussions','name');
INSERT INTO `mdl_log_display` VALUES (49,'forum','view subscribers','forum','name');
INSERT INTO `mdl_log_display` VALUES (50,'forum','view discussion','forum_discussions','name');
INSERT INTO `mdl_log_display` VALUES (51,'forum','view forum','forum','name');
INSERT INTO `mdl_log_display` VALUES (52,'forum','subscribe','forum','name');
INSERT INTO `mdl_log_display` VALUES (53,'forum','unsubscribe','forum','name');
INSERT INTO `mdl_log_display` VALUES (54,'glossary','add','glossary','name');
INSERT INTO `mdl_log_display` VALUES (55,'glossary','update','glossary','name');
INSERT INTO `mdl_log_display` VALUES (56,'glossary','view','glossary','name');
INSERT INTO `mdl_log_display` VALUES (57,'glossary','view all','glossary','name');
INSERT INTO `mdl_log_display` VALUES (58,'glossary','add entry','glossary','name');
INSERT INTO `mdl_log_display` VALUES (59,'glossary','update entry','glossary','name');
INSERT INTO `mdl_log_display` VALUES (60,'glossary','add category','glossary','name');
INSERT INTO `mdl_log_display` VALUES (61,'glossary','update category','glossary','name');
INSERT INTO `mdl_log_display` VALUES (62,'glossary','delete category','glossary','name');
INSERT INTO `mdl_log_display` VALUES (63,'glossary','add comment','glossary','name');
INSERT INTO `mdl_log_display` VALUES (64,'glossary','update comment','glossary','name');
INSERT INTO `mdl_log_display` VALUES (65,'glossary','delete comment','glossary','name');
INSERT INTO `mdl_log_display` VALUES (66,'glossary','approve entry','glossary','name');
INSERT INTO `mdl_log_display` VALUES (67,'glossary','view entry','glossary_entries','concept');
INSERT INTO `mdl_log_display` VALUES (68,'journal','view','journal','name');
INSERT INTO `mdl_log_display` VALUES (69,'journal','add entry','journal','name');
INSERT INTO `mdl_log_display` VALUES (70,'journal','update entry','journal','name');
INSERT INTO `mdl_log_display` VALUES (71,'journal','view responses','journal','name');
INSERT INTO `mdl_log_display` VALUES (72,'label','add','label','name');
INSERT INTO `mdl_log_display` VALUES (73,'label','update','label','name');
INSERT INTO `mdl_log_display` VALUES (74,'lesson','start','lesson','name');
INSERT INTO `mdl_log_display` VALUES (75,'lesson','end','lesson','name');
INSERT INTO `mdl_log_display` VALUES (76,'lesson','view','lesson_pages','title');
INSERT INTO `mdl_log_display` VALUES (77,'quiz','add','quiz','name');
INSERT INTO `mdl_log_display` VALUES (78,'quiz','update','quiz','name');
INSERT INTO `mdl_log_display` VALUES (79,'quiz','view','quiz','name');
INSERT INTO `mdl_log_display` VALUES (80,'quiz','report','quiz','name');
INSERT INTO `mdl_log_display` VALUES (81,'quiz','attempt','quiz','name');
INSERT INTO `mdl_log_display` VALUES (82,'quiz','submit','quiz','name');
INSERT INTO `mdl_log_display` VALUES (83,'quiz','review','quiz','name');
INSERT INTO `mdl_log_display` VALUES (84,'quiz','editquestions','quiz','name');
INSERT INTO `mdl_log_display` VALUES (85,'quiz','preview','quiz','name');
INSERT INTO `mdl_log_display` VALUES (86,'quiz','start attempt','quiz','name');
INSERT INTO `mdl_log_display` VALUES (87,'quiz','close attempt','quiz','name');
INSERT INTO `mdl_log_display` VALUES (88,'quiz','continue attempt','quiz','name');
INSERT INTO `mdl_log_display` VALUES (89,'resource','view','resource','name');
INSERT INTO `mdl_log_display` VALUES (90,'resource','update','resource','name');
INSERT INTO `mdl_log_display` VALUES (91,'resource','add','resource','name');
INSERT INTO `mdl_log_display` VALUES (92,'scorm','view','scorm','name');
INSERT INTO `mdl_log_display` VALUES (93,'scorm','review','scorm','name');
INSERT INTO `mdl_log_display` VALUES (94,'scorm','update','scorm','name');
INSERT INTO `mdl_log_display` VALUES (95,'scorm','add','scorm','name');
INSERT INTO `mdl_log_display` VALUES (96,'survey','add','survey','name');
INSERT INTO `mdl_log_display` VALUES (97,'survey','update','survey','name');
INSERT INTO `mdl_log_display` VALUES (98,'survey','download','survey','name');
INSERT INTO `mdl_log_display` VALUES (99,'survey','view form','survey','name');
INSERT INTO `mdl_log_display` VALUES (100,'survey','view graph','survey','name');
INSERT INTO `mdl_log_display` VALUES (101,'survey','view report','survey','name');
INSERT INTO `mdl_log_display` VALUES (102,'survey','submit','survey','name');
INSERT INTO `mdl_log_display` VALUES (103,'workshop','assessments','workshop','name');
INSERT INTO `mdl_log_display` VALUES (104,'workshop','close','workshop','name');
INSERT INTO `mdl_log_display` VALUES (105,'workshop','display','workshop','name');
INSERT INTO `mdl_log_display` VALUES (106,'workshop','resubmit','workshop','name');
INSERT INTO `mdl_log_display` VALUES (107,'workshop','set up','workshop','name');
INSERT INTO `mdl_log_display` VALUES (108,'workshop','submissions','workshop','name');
INSERT INTO `mdl_log_display` VALUES (109,'workshop','view','workshop','name');
INSERT INTO `mdl_log_display` VALUES (110,'workshop','update','workshop','name');
INSERT INTO `mdl_log_display` VALUES (113,'course','unenrol','course','fullname');
INSERT INTO `mdl_log_display` VALUES (123,'tag','update','tag','name');
INSERT INTO `mdl_log_display` VALUES (133,'audiorecorder','view','audiorecorder','name');
INSERT INTO `mdl_log_display` VALUES (143,'audiorecorder','add','audiorecorder','name');
INSERT INTO `mdl_log_display` VALUES (153,'audiorecorder','update','audiorecorder','name');
INSERT INTO `mdl_log_display` VALUES (163,'audiorecorder','view submission','audiorecorder','name');
INSERT INTO `mdl_log_display` VALUES (173,'audiorecorder','upload','audiorecorder','name');
INSERT INTO `mdl_log_display` VALUES (183,'book','update','book','name');
INSERT INTO `mdl_log_display` VALUES (193,'book','view','book','name');
INSERT INTO `mdl_log_display` VALUES (203,'book','view all','book','name');
INSERT INTO `mdl_log_display` VALUES (213,'book','print','book','name');
INSERT INTO `mdl_log_display` VALUES (223,'elluminate','view','elluminate','name');
INSERT INTO `mdl_log_display` VALUES (233,'elluminate','view all','elluminate','name');
INSERT INTO `mdl_log_display` VALUES (243,'elluminate','view meeting','elluminate','name');
INSERT INTO `mdl_log_display` VALUES (253,'elluminate','view recording','elluminate','name');
INSERT INTO `mdl_log_display` VALUES (263,'elluminate','add','elluminate','name');
INSERT INTO `mdl_log_display` VALUES (273,'elluminate','update','elluminate','name');
INSERT INTO `mdl_log_display` VALUES (283,'flv','add','flv','name');
INSERT INTO `mdl_log_display` VALUES (293,'flv','update','flv','name');
INSERT INTO `mdl_log_display` VALUES (303,'flv','view','flv','name');
INSERT INTO `mdl_log_display` VALUES (313,'inwicast','add','inwicast','name');
INSERT INTO `mdl_log_display` VALUES (323,'inwicast','update','inwicast','name');
INSERT INTO `mdl_log_display` VALUES (333,'inwicast','view','inwicast','name');
INSERT INTO `mdl_log_display` VALUES (343,'lightboxgallery','update','lightboxgallery','name');
INSERT INTO `mdl_log_display` VALUES (353,'lightboxgallery','view','lightboxgallery','name');
INSERT INTO `mdl_log_display` VALUES (363,'lightboxgallery','comment','lightboxgallery','name');
INSERT INTO `mdl_log_display` VALUES (373,'map','view','map','name');
INSERT INTO `mdl_log_display` VALUES (383,'map','update','map','name');
INSERT INTO `mdl_log_display` VALUES (393,'map','add','map','name');
INSERT INTO `mdl_log_display` VALUES (403,'map','report','map','name');
INSERT INTO `mdl_log_display` VALUES (413,'map','choose','map','name');
INSERT INTO `mdl_log_display` VALUES (423,'map','choose again','map','name');
INSERT INTO `mdl_log_display` VALUES (433,'slideshow','add','slideshow','name');
INSERT INTO `mdl_log_display` VALUES (443,'slideshow','update','slideshow','name');
INSERT INTO `mdl_log_display` VALUES (453,'swf','add','swf','name');
INSERT INTO `mdl_log_display` VALUES (463,'swf','update','swf','name');
INSERT INTO `mdl_log_display` VALUES (473,'swf','view','swf','name');
/*!40000 ALTER TABLE `mdl_log_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_map`
--

DROP TABLE IF EXISTS `mdl_map`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_map` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  `format` tinyint(2) unsigned NOT NULL default '0',
  `studentlocations` tinyint(2) unsigned NOT NULL default '0',
  `requireok` tinyint(2) unsigned NOT NULL default '0',
  `extralocations` tinyint(2) unsigned NOT NULL default '0',
  `showaddress4extra` tinyint(2) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `provider` varchar(25) default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_map_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available maps are stored here';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_map`
--

LOCK TABLES `mdl_map` WRITE;
/*!40000 ALTER TABLE `mdl_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_map_locations`
--

DROP TABLE IF EXISTS `mdl_map_locations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_map_locations` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `mapid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `title` varchar(100) default NULL,
  `showcode` bigint(10) unsigned NOT NULL default '0',
  `latitude` text,
  `longitude` text,
  `address` text,
  `city` text,
  `state` text,
  `country` text,
  `text` text,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_maploca_use_ix` (`userid`),
  KEY `mdl_maploca_map_ix` (`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='locations of students';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_map_locations`
--

LOCK TABLES `mdl_map_locations` WRITE;
/*!40000 ALTER TABLE `mdl_map_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_map_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message`
--

DROP TABLE IF EXISTS `mdl_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_message` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `useridfrom` bigint(10) NOT NULL default '0',
  `useridto` bigint(10) NOT NULL default '0',
  `message` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL default '0',
  `timecreated` bigint(10) NOT NULL default '0',
  `messagetype` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_message`
--

LOCK TABLES `mdl_message` WRITE;
/*!40000 ALTER TABLE `mdl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_contacts`
--

DROP TABLE IF EXISTS `mdl_message_contacts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `contactid` bigint(10) unsigned NOT NULL default '0',
  `blocked` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_message_contacts`
--

LOCK TABLES `mdl_message_contacts` WRITE;
/*!40000 ALTER TABLE `mdl_message_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_read`
--

DROP TABLE IF EXISTS `mdl_message_read`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_message_read` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `useridfrom` bigint(10) NOT NULL default '0',
  `useridto` bigint(10) NOT NULL default '0',
  `message` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL default '0',
  `timecreated` bigint(10) NOT NULL default '0',
  `timeread` bigint(10) NOT NULL default '0',
  `messagetype` varchar(50) NOT NULL default '',
  `mailed` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_message_read`
--

LOCK TABLES `mdl_message_read` WRITE;
/*!40000 ALTER TABLE `mdl_message_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_application`
--

DROP TABLE IF EXISTS `mdl_mnet_application`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `display_name` varchar(50) NOT NULL default '',
  `xmlrpc_server_url` varchar(255) NOT NULL default '',
  `sso_land_url` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_application`
--

LOCK TABLES `mdl_mnet_application` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_application` DISABLE KEYS */;
INSERT INTO `mdl_mnet_application` VALUES (3,'moodle','Moodle','/mnet/xmlrpc/server.php','/auth/mnet/land.php');
INSERT INTO `mdl_mnet_application` VALUES (13,'mahara','Mahara','/api/xmlrpc/server.php','/auth/xmlrpc/land.php');
/*!40000 ALTER TABLE `mdl_mnet_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_enrol_assignments`
--

DROP TABLE IF EXISTS `mdl_mnet_enrol_assignments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_enrol_assignments` (
  `id` bigint(10) NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `hostid` bigint(10) unsigned NOT NULL default '0',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `rolename` varchar(255) NOT NULL default '',
  `enroltime` bigint(10) unsigned NOT NULL default '0',
  `enroltype` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_mnetenroassi_hoscou_ix` (`hostid`,`courseid`),
  KEY `mdl_mnetenroassi_use_ix` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about enrolments on courses on remote hosts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_enrol_assignments`
--

LOCK TABLES `mdl_mnet_enrol_assignments` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_enrol_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_enrol_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_enrol_course`
--

DROP TABLE IF EXISTS `mdl_mnet_enrol_course`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_enrol_course` (
  `id` bigint(10) NOT NULL auto_increment,
  `hostid` bigint(10) unsigned NOT NULL default '0',
  `remoteid` bigint(10) unsigned NOT NULL default '0',
  `cat_id` bigint(10) unsigned NOT NULL default '0',
  `cat_name` varchar(255) NOT NULL default '',
  `cat_description` mediumtext NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL default '0',
  `fullname` varchar(254) NOT NULL default '',
  `shortname` varchar(15) NOT NULL default '',
  `idnumber` varchar(100) NOT NULL default '',
  `summary` mediumtext NOT NULL,
  `startdate` bigint(10) unsigned NOT NULL default '0',
  `cost` varchar(10) NOT NULL default '',
  `currency` varchar(3) NOT NULL default '',
  `defaultroleid` smallint(4) unsigned NOT NULL default '0',
  `defaultrolename` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about courses on remote hosts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_enrol_course`
--

LOCK TABLES `mdl_mnet_enrol_course` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_enrol_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_enrol_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host`
--

DROP TABLE IF EXISTS `mdl_mnet_host`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL auto_increment,
  `deleted` tinyint(1) unsigned NOT NULL default '0',
  `wwwroot` varchar(255) NOT NULL default '',
  `ip_address` varchar(39) NOT NULL default '',
  `name` varchar(80) NOT NULL default '',
  `public_key` mediumtext NOT NULL,
  `public_key_expires` bigint(10) unsigned NOT NULL default '0',
  `transport` tinyint(2) unsigned NOT NULL default '0',
  `portno` mediumint(5) unsigned NOT NULL default '0',
  `last_connect_time` bigint(10) unsigned NOT NULL default '0',
  `last_log_id` bigint(10) unsigned NOT NULL default '0',
  `force_theme` tinyint(1) unsigned NOT NULL default '0',
  `theme` varchar(100) default NULL,
  `applicationid` bigint(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_host`
--

LOCK TABLES `mdl_mnet_host` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host` DISABLE KEYS */;
INSERT INTO `mdl_mnet_host` VALUES (2,0,'','','All Hosts','',0,0,0,0,0,0,NULL,3);
INSERT INTO `mdl_mnet_host` VALUES (3,0,'http://neahkahnie.orvsd.org','140.211.15.85','','',0,0,0,0,0,0,NULL,3);
/*!40000 ALTER TABLE `mdl_mnet_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host2service`
--

DROP TABLE IF EXISTS `mdl_mnet_host2service`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL auto_increment,
  `hostid` bigint(10) unsigned NOT NULL default '0',
  `serviceid` bigint(10) unsigned NOT NULL default '0',
  `publish` tinyint(1) unsigned NOT NULL default '0',
  `subscribe` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_host2service`
--

LOCK TABLES `mdl_mnet_host2service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_host2service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_log`
--

DROP TABLE IF EXISTS `mdl_mnet_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL auto_increment,
  `hostid` bigint(10) unsigned NOT NULL default '0',
  `remoteid` bigint(10) unsigned NOT NULL default '0',
  `time` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `ip` varchar(15) NOT NULL default '',
  `course` bigint(10) unsigned NOT NULL default '0',
  `coursename` varchar(40) NOT NULL default '',
  `module` varchar(20) NOT NULL default '',
  `cmid` bigint(10) unsigned NOT NULL default '0',
  `action` varchar(40) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `info` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_log`
--

LOCK TABLES `mdl_mnet_log` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_rpc`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL auto_increment,
  `function_name` varchar(40) NOT NULL default '',
  `xmlrpc_path` varchar(80) NOT NULL default '',
  `parent_type` varchar(6) NOT NULL default '',
  `parent` varchar(20) NOT NULL default '',
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `help` mediumtext NOT NULL,
  `profile` mediumtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpc_path`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_rpc`
--

LOCK TABLES `mdl_mnet_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',0,'Return user data for the provided token, compare with user_agent string.','a:3:{i:0;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:45:\"token - The unique ID provided by remotehost.\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"useragent - User Agent string.\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',0,'Receives an array of usernames from a remote machine and prods their\\n sessions to keep them alive','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"\\\"All ok\\\" or an error message\";}i:1;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:29:\"array - An array of usernames\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',0,'The IdP uses this function to kill child sessions on other hosts','a:3:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"username - Username for session to kill\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"useragent - SHA1 hash of user agent to look for\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',0,'Receives an array of log entries from an SP and adds them to the mnet_log\\n table','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"\\\"All ok\\\" or an error message\";}i:1;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:29:\"array - An array of usernames\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',0,'Returns the user\'s image as a base64 encoded string.','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:17:\"The encoded image\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:29:\"username - The id of the user\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',0,'Returns the theme information and logo url as strings.','a:1:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',0,'Invoke this function _on_ the IDP to update it with enrolment info local to\\n the SP right after calling user_authorise()\\n \\n Normally called by the SP after calling','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";N;}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:23:\"username - The username\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:77:\"courses - Assoc array of courses following the structure of mnet_enrol_course\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',0,'Poll the IdP server to let it know that a user it has authenticated is still\\n online','a:1:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";N;}}');
INSERT INTO `mdl_mnet_rpc` VALUES (9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',0,'TODO:Untested When the IdP requests that child sessions are terminated,\\n this function will be called on each of the child hosts. The machine that\\n calls the function (over xmlrpc) provides us with the mnethostid we need.','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:15:\"True on success\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"username - Username for session to kill\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"useragent - SHA1 hash of user agent to look for\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',0,'Does Foo','a:1:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:47:\"Whether the user can login from the remote host\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',0,'No description given.','a:2:{i:0;a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}i:1;s:6:\"userid\";}');
INSERT INTO `mdl_mnet_rpc` VALUES (12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',0,'Enrols user to course with the default role','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:41:\"Whether the enrolment has been successful\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"user - The username of the remote use\";}i:2;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:37:\"courseid - The id of the local course\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',0,'Unenrol a user from a course','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:47:\"Whether the user can login from the remote host\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:23:\"username - The username\";}i:2;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:37:\"courseid - The id of the local course\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',0,'Get a list of users from the client server who are enrolled in a course','a:3:{i:0;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:39:\"Array of usernames who are homed on the\";}i:1;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:24:\"courseid - The Course ID\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"roles - Comma-separated list of role shortnames\";}}');
INSERT INTO `mdl_mnet_rpc` VALUES (23,'get_views_for_user','mod/mahara/rpclib.php/get_views_for_user','mod','mahara',0,'No description given.','a:3:{i:0;a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}i:1;s:8:\"username\";i:2;s:5:\"query\";}');
INSERT INTO `mdl_mnet_rpc` VALUES (33,'submit_view_for_assessment','mod/mahara/rpclib.php/submit_view_for_assessment','mod','mahara',0,'No description given.','a:3:{i:0;a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}i:1;s:8:\"username\";i:2;s:6:\"viewid\";}');
INSERT INTO `mdl_mnet_rpc` VALUES (43,'release_submitted_view','mod/mahara/rpclib.php/release_submitted_view','mod','mahara',0,'No description given.','a:3:{i:0;a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}i:1;s:6:\"viewid\";i:2;s:14:\"assessmentdata\";}');
/*!40000 ALTER TABLE `mdl_mnet_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service`
--

DROP TABLE IF EXISTS `mdl_mnet_service`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL default '',
  `description` varchar(40) NOT NULL default '',
  `apiversion` varchar(10) NOT NULL default '',
  `offer` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_service`
--

LOCK TABLES `mdl_mnet_service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service` VALUES (1,'sso_idp','','1',1);
INSERT INTO `mdl_mnet_service` VALUES (2,'sso_sp','','1',1);
INSERT INTO `mdl_mnet_service` VALUES (3,'mnet_enrol','','1',1);
INSERT INTO `mdl_mnet_service` VALUES (13,'mahara','','1',1);
/*!40000 ALTER TABLE `mdl_mnet_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_service2rpc`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL auto_increment,
  `serviceid` bigint(10) unsigned NOT NULL default '0',
  `rpcid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

LOCK TABLES `mdl_mnet_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service2rpc` VALUES (1,1,1);
INSERT INTO `mdl_mnet_service2rpc` VALUES (2,1,2);
INSERT INTO `mdl_mnet_service2rpc` VALUES (3,1,3);
INSERT INTO `mdl_mnet_service2rpc` VALUES (4,1,4);
INSERT INTO `mdl_mnet_service2rpc` VALUES (5,1,5);
INSERT INTO `mdl_mnet_service2rpc` VALUES (6,1,6);
INSERT INTO `mdl_mnet_service2rpc` VALUES (7,1,7);
INSERT INTO `mdl_mnet_service2rpc` VALUES (8,2,8);
INSERT INTO `mdl_mnet_service2rpc` VALUES (9,2,9);
INSERT INTO `mdl_mnet_service2rpc` VALUES (10,3,10);
INSERT INTO `mdl_mnet_service2rpc` VALUES (11,3,11);
INSERT INTO `mdl_mnet_service2rpc` VALUES (12,3,12);
INSERT INTO `mdl_mnet_service2rpc` VALUES (13,3,13);
INSERT INTO `mdl_mnet_service2rpc` VALUES (14,3,14);
INSERT INTO `mdl_mnet_service2rpc` VALUES (23,13,23);
INSERT INTO `mdl_mnet_service2rpc` VALUES (33,13,33);
INSERT INTO `mdl_mnet_service2rpc` VALUES (43,13,43);
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_session`
--

DROP TABLE IF EXISTS `mdl_mnet_session`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `username` varchar(100) NOT NULL default '',
  `token` varchar(40) NOT NULL default '',
  `mnethostid` bigint(10) unsigned NOT NULL default '0',
  `useragent` varchar(40) NOT NULL default '',
  `confirm_timeout` bigint(10) unsigned NOT NULL default '0',
  `session_id` varchar(40) NOT NULL default '',
  `expires` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_session`
--

LOCK TABLES `mdl_mnet_session` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mdl_mnet_sso_access_control`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL auto_increment,
  `username` varchar(100) NOT NULL default '',
  `mnet_host_id` bigint(10) unsigned NOT NULL default '0',
  `accessctrl` varchar(20) NOT NULL default 'allow',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_mnet_sso_access_control`
--

LOCK TABLES `mdl_mnet_sso_access_control` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_modules`
--

DROP TABLE IF EXISTS `mdl_modules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_modules` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL default '',
  `version` bigint(10) NOT NULL default '0',
  `cron` bigint(10) unsigned NOT NULL default '0',
  `lastcron` bigint(10) unsigned NOT NULL default '0',
  `search` varchar(255) NOT NULL default '',
  `visible` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='modules available in the site';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_modules`
--

LOCK TABLES `mdl_modules` WRITE;
/*!40000 ALTER TABLE `mdl_modules` DISABLE KEYS */;
INSERT INTO `mdl_modules` VALUES (1,'assignment',2007101511,60,1283907623,'',1);
INSERT INTO `mdl_modules` VALUES (2,'chat',2009031100,300,1283907623,'',1);
INSERT INTO `mdl_modules` VALUES (3,'choice',2007101509,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (4,'data',2007101514,60,0,'',1);
INSERT INTO `mdl_modules` VALUES (5,'forum',2007101513,60,1283907623,'',1);
INSERT INTO `mdl_modules` VALUES (6,'glossary',2007101509,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (7,'hotpot',2007101513,0,0,'',0);
INSERT INTO `mdl_modules` VALUES (8,'journal',2007101509,60,0,'',0);
INSERT INTO `mdl_modules` VALUES (9,'label',2007101510,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (10,'lams',2007101509,0,0,'',0);
INSERT INTO `mdl_modules` VALUES (11,'lesson',2008112601,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (12,'quiz',2007101511,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (13,'resource',2007101510,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (14,'scorm',2007110503,300,1283907623,'',1);
INSERT INTO `mdl_modules` VALUES (15,'survey',2007101509,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (16,'wiki',2007101509,3600,1283907623,'',1);
INSERT INTO `mdl_modules` VALUES (17,'workshop',2007101510,60,0,'',0);
INSERT INTO `mdl_modules` VALUES (23,'audiorecorder',2008042200,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (33,'book',2008081402,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (43,'elluminate',2009020501,900,1283907623,'',1);
INSERT INTO `mdl_modules` VALUES (53,'flv',2009042400,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (63,'ilpconcern',2008072605,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (73,'ilptarget',2008052907,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (83,'inwicast',2008082200,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (93,'lightboxgallery',2009051200,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (103,'mahara',2009091800,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (113,'map',2008110601,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (123,'nanogong',2010042200,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (133,'questionnaire',2008060402,43200,1283907623,'',1);
INSERT INTO `mdl_modules` VALUES (143,'slideshow',2009061801,0,0,'',1);
INSERT INTO `mdl_modules` VALUES (153,'sloodle',2009072720,60,1283907623,'',1);
INSERT INTO `mdl_modules` VALUES (163,'swf',2009012800,0,0,'',1);
/*!40000 ALTER TABLE `mdl_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_nanogong`
--

DROP TABLE IF EXISTS `mdl_nanogong`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_nanogong` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `course` bigint(10) unsigned NOT NULL default '0',
  `message` text NOT NULL,
  `color` varchar(7) default NULL,
  `maxduration` smallint(4) unsigned NOT NULL default '300',
  `maxmessages` smallint(4) unsigned NOT NULL default '0',
  `maxscore` smallint(4) unsigned NOT NULL default '100',
  `allowguestaccess` tinyint(1) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_nano_id_uix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='NanoGong table for an NanoGong activity';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_nanogong`
--

LOCK TABLES `mdl_nanogong` WRITE;
/*!40000 ALTER TABLE `mdl_nanogong` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_nanogong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_nanogong_message`
--

DROP TABLE IF EXISTS `mdl_nanogong_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_nanogong_message` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `nanogongid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `groupid` bigint(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  `path` text NOT NULL,
  `comments` text NOT NULL,
  `commentedby` bigint(10) unsigned default NULL,
  `score` smallint(4) unsigned NOT NULL default '0',
  `timestamp` bigint(10) unsigned NOT NULL default '0',
  `timeedited` bigint(10) unsigned default NULL,
  `locked` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_nanomess_id_uix` (`id`),
  KEY `mdl_nanomess_nan_ix` (`nanogongid`),
  KEY `mdl_nanomess_use_ix` (`userid`),
  KEY `mdl_nanomess_gro_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='NanoGong messages in each NanoGong activity';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_nanogong_message`
--

LOCK TABLES `mdl_nanogong_message` WRITE;
/*!40000 ALTER TABLE `mdl_nanogong_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_nanogong_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_post`
--

DROP TABLE IF EXISTS `mdl_post`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL auto_increment,
  `module` varchar(20) NOT NULL default '',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `groupid` bigint(10) unsigned NOT NULL default '0',
  `moduleid` bigint(10) unsigned NOT NULL default '0',
  `coursemoduleid` bigint(10) unsigned NOT NULL default '0',
  `subject` varchar(128) NOT NULL default '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(128) NOT NULL default '',
  `rating` bigint(10) unsigned NOT NULL default '0',
  `format` bigint(10) unsigned NOT NULL default '0',
  `attachment` varchar(100) default NULL,
  `publishstate` enum('draft','site','public') NOT NULL default 'draft',
  `lastmodified` bigint(10) unsigned NOT NULL default '0',
  `created` bigint(10) unsigned NOT NULL default '0',
  `usermodified` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_post`
--

LOCK TABLES `mdl_post` WRITE;
/*!40000 ALTER TABLE `mdl_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question`
--

DROP TABLE IF EXISTS `mdl_question`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `category` bigint(10) NOT NULL default '0',
  `parent` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `questiontext` text NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL default '0',
  `image` varchar(255) NOT NULL default '',
  `generalfeedback` text NOT NULL,
  `defaultgrade` bigint(10) unsigned NOT NULL default '1',
  `penalty` double NOT NULL default '0.1',
  `qtype` varchar(20) NOT NULL default '',
  `length` bigint(10) unsigned NOT NULL default '1',
  `stamp` varchar(255) NOT NULL default '',
  `version` varchar(255) NOT NULL default '',
  `hidden` tinyint(1) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `createdby` bigint(10) unsigned default NULL,
  `modifiedby` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The questions themselves';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question`
--

LOCK TABLES `mdl_question` WRITE;
/*!40000 ALTER TABLE `mdl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_answers`
--

DROP TABLE IF EXISTS `mdl_question_answers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_answers` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `answer` text NOT NULL,
  `fraction` double NOT NULL default '0',
  `feedback` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_answers`
--

LOCK TABLES `mdl_question_answers` WRITE;
/*!40000 ALTER TABLE `mdl_question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempts`
--

DROP TABLE IF EXISTS `mdl_question_attempts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_attempts` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `modulename` varchar(20) NOT NULL default 'quiz',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Student attempts. This table gets extended by the modules';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_attempts`
--

LOCK TABLES `mdl_question_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated`
--

DROP TABLE IF EXISTS `mdl_question_calculated`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_calculated` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `answer` bigint(10) unsigned NOT NULL default '0',
  `tolerance` varchar(20) NOT NULL default '0.0',
  `tolerancetype` bigint(10) NOT NULL default '1',
  `correctanswerlength` bigint(10) NOT NULL default '2',
  `correctanswerformat` bigint(10) NOT NULL default '2',
  PRIMARY KEY  (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_calculated`
--

LOCK TABLES `mdl_question_calculated` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_categories`
--

DROP TABLE IF EXISTS `mdl_question_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_categories` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contextid` bigint(10) unsigned NOT NULL default '0',
  `info` text NOT NULL,
  `stamp` varchar(255) NOT NULL default '',
  `parent` bigint(10) unsigned NOT NULL default '0',
  `sortorder` bigint(10) unsigned NOT NULL default '999',
  PRIMARY KEY  (`id`),
  KEY `mdl_quescate_par_ix` (`parent`),
  KEY `mdl_quescate_con_ix` (`contextid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_categories`
--

LOCK TABLES `mdl_question_categories` WRITE;
/*!40000 ALTER TABLE `mdl_question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_definitions`
--

DROP TABLE IF EXISTS `mdl_question_dataset_definitions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `category` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `type` bigint(10) NOT NULL default '0',
  `options` varchar(255) NOT NULL default '',
  `itemcount` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_dataset_definitions`
--

LOCK TABLES `mdl_question_dataset_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_items`
--

DROP TABLE IF EXISTS `mdl_question_dataset_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `definition` bigint(10) unsigned NOT NULL default '0',
  `itemnumber` bigint(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Individual dataset items';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_dataset_items`
--

LOCK TABLES `mdl_question_dataset_items` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_datasets`
--

DROP TABLE IF EXISTS `mdl_question_datasets`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_datasets` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `datasetdefinition` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_datasets`
--

LOCK TABLES `mdl_question_datasets` WRITE;
/*!40000 ALTER TABLE `mdl_question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_match`
--

DROP TABLE IF EXISTS `mdl_question_match`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_match` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `subquestions` varchar(255) NOT NULL default '',
  `shuffleanswers` smallint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesmatc_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines fixed matching questions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_match`
--

LOCK TABLES `mdl_question_match` WRITE;
/*!40000 ALTER TABLE `mdl_question_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_match_sub`
--

DROP TABLE IF EXISTS `mdl_question_match_sub`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_match_sub` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `code` bigint(10) unsigned NOT NULL default '0',
  `question` bigint(10) unsigned NOT NULL default '0',
  `questiontext` text NOT NULL,
  `answertext` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesmatcsub_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines the subquestions that make up a matching question';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_match_sub`
--

LOCK TABLES `mdl_question_match_sub` WRITE;
/*!40000 ALTER TABLE `mdl_question_match_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_match_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multianswer`
--

DROP TABLE IF EXISTS `mdl_question_multianswer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_multianswer` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `sequence` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_multianswer`
--

LOCK TABLES `mdl_question_multianswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multianswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multichoice`
--

DROP TABLE IF EXISTS `mdl_question_multichoice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_multichoice` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `layout` smallint(4) NOT NULL default '0',
  `answers` varchar(255) NOT NULL default '',
  `single` smallint(4) NOT NULL default '0',
  `shuffleanswers` smallint(4) NOT NULL default '1',
  `correctfeedback` text NOT NULL,
  `partiallycorrectfeedback` text NOT NULL,
  `incorrectfeedback` text NOT NULL,
  `answernumbering` varchar(10) NOT NULL default 'abc',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_multichoice`
--

LOCK TABLES `mdl_question_multichoice` WRITE;
/*!40000 ALTER TABLE `mdl_question_multichoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multichoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical`
--

DROP TABLE IF EXISTS `mdl_question_numerical`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_numerical` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `answer` bigint(10) unsigned NOT NULL default '0',
  `tolerance` varchar(255) NOT NULL default '0.0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_numerical`
--

LOCK TABLES `mdl_question_numerical` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_units`
--

DROP TABLE IF EXISTS `mdl_question_numerical_units`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `multiplier` decimal(40,20) NOT NULL default '1.00000000000000000000',
  `unit` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_numerical_units`
--

LOCK TABLES `mdl_question_numerical_units` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_randomsamatch`
--

DROP TABLE IF EXISTS `mdl_question_randomsamatch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_randomsamatch` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `choose` bigint(10) unsigned NOT NULL default '4',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_randomsamatch`
--

LOCK TABLES `mdl_question_randomsamatch` WRITE;
/*!40000 ALTER TABLE `mdl_question_randomsamatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_randomsamatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_sessions`
--

DROP TABLE IF EXISTS `mdl_question_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_sessions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `attemptid` bigint(10) unsigned NOT NULL default '0',
  `questionid` bigint(10) unsigned NOT NULL default '0',
  `newest` bigint(10) unsigned NOT NULL default '0',
  `newgraded` bigint(10) unsigned NOT NULL default '0',
  `sumpenalty` double NOT NULL default '0',
  `manualcomment` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_sessions`
--

LOCK TABLES `mdl_question_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_question_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_shortanswer`
--

DROP TABLE IF EXISTS `mdl_question_shortanswer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_shortanswer` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `answers` varchar(255) NOT NULL default '',
  `usecase` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesshor_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_shortanswer`
--

LOCK TABLES `mdl_question_shortanswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_shortanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_shortanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_states`
--

DROP TABLE IF EXISTS `mdl_question_states`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_states` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `attempt` bigint(10) unsigned NOT NULL default '0',
  `question` bigint(10) unsigned NOT NULL default '0',
  `originalquestion` bigint(10) unsigned NOT NULL default '0',
  `seq_number` mediumint(6) unsigned NOT NULL default '0',
  `answer` text NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL default '0',
  `event` smallint(4) unsigned NOT NULL default '0',
  `grade` double NOT NULL default '0',
  `raw_grade` double NOT NULL default '0',
  `penalty` double NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_states`
--

LOCK TABLES `mdl_question_states` WRITE;
/*!40000 ALTER TABLE `mdl_question_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_truefalse`
--

DROP TABLE IF EXISTS `mdl_question_truefalse`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_question_truefalse` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question` bigint(10) unsigned NOT NULL default '0',
  `trueanswer` bigint(10) unsigned NOT NULL default '0',
  `falseanswer` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_question_truefalse`
--

LOCK TABLES `mdl_question_truefalse` WRITE;
/*!40000 ALTER TABLE `mdl_question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_truefalse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire`
--

DROP TABLE IF EXISTS `mdl_questionnaire`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(11) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `summary` text NOT NULL,
  `qtype` bigint(10) NOT NULL default '0',
  `respondenttype` enum('fullname','anonymous') NOT NULL default 'fullname',
  `resp_eligible` enum('all','students','teachers') NOT NULL default 'all',
  `resp_view` tinyint(2) unsigned NOT NULL default '0',
  `opendate` bigint(10) unsigned NOT NULL default '0',
  `closedate` bigint(10) unsigned NOT NULL default '0',
  `resume` tinyint(2) unsigned NOT NULL default '0',
  `navigate` tinyint(2) unsigned NOT NULL default '0',
  `grade` bigint(10) NOT NULL default '0',
  `sid` bigint(11) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_ques_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main questionnaire table.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire`
--

LOCK TABLES `mdl_questionnaire` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_attempts`
--

DROP TABLE IF EXISTS `mdl_questionnaire_attempts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_attempts` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `qid` bigint(11) unsigned NOT NULL default '0',
  `userid` bigint(11) unsigned NOT NULL default '0',
  `rid` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_attempts table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_attempts`
--

LOCK TABLES `mdl_questionnaire_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_quest_choice`
--

DROP TABLE IF EXISTS `mdl_questionnaire_quest_choice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_quest_choice` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `question_id` bigint(10) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  `value` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_quest_choice table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_quest_choice`
--

LOCK TABLES `mdl_questionnaire_quest_choice` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_quest_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_quest_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_question`
--

DROP TABLE IF EXISTS `mdl_questionnaire_question`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_question` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `survey_id` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(30) default NULL,
  `type_id` bigint(10) unsigned NOT NULL default '0',
  `result_id` bigint(10) unsigned default NULL,
  `length` bigint(11) unsigned NOT NULL default '0',
  `precise` bigint(11) unsigned NOT NULL default '0',
  `position` bigint(10) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  `required` enum('y','n') NOT NULL default 'n',
  `deleted` enum('y','n') NOT NULL default 'n',
  `public` enum('y','n') NOT NULL default 'y',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_question table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_question`
--

LOCK TABLES `mdl_questionnaire_question` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_question_type`
--

DROP TABLE IF EXISTS `mdl_questionnaire_question_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_question_type` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `typeid` bigint(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `has_choices` enum('y','n') NOT NULL default 'y',
  `response_table` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_quesquestype_typ_uix` (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='questionnaire_question_type table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_question_type`
--

LOCK TABLES `mdl_questionnaire_question_type` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_question_type` DISABLE KEYS */;
INSERT INTO `mdl_questionnaire_question_type` VALUES (3,1,'Yes/No','n','response_bool');
INSERT INTO `mdl_questionnaire_question_type` VALUES (13,2,'Text Box','n','response_text');
INSERT INTO `mdl_questionnaire_question_type` VALUES (23,3,'Essay Box','n','response_text');
INSERT INTO `mdl_questionnaire_question_type` VALUES (33,4,'Radio Buttons','y','resp_single');
INSERT INTO `mdl_questionnaire_question_type` VALUES (43,5,'Check Boxes','y','resp_multiple');
INSERT INTO `mdl_questionnaire_question_type` VALUES (53,6,'Dropdown Box','y','resp_single');
INSERT INTO `mdl_questionnaire_question_type` VALUES (63,8,'Rate (scale 1..5)','y','response_rank');
INSERT INTO `mdl_questionnaire_question_type` VALUES (73,9,'Date','n','response_date');
INSERT INTO `mdl_questionnaire_question_type` VALUES (83,10,'Numeric','n','response_text');
INSERT INTO `mdl_questionnaire_question_type` VALUES (93,99,'Page Break','n','');
INSERT INTO `mdl_questionnaire_question_type` VALUES (103,100,'Section Text','n','');
/*!40000 ALTER TABLE `mdl_questionnaire_question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_resp_multiple`
--

DROP TABLE IF EXISTS `mdl_questionnaire_resp_multiple`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_resp_multiple` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `response_id` bigint(10) unsigned NOT NULL default '0',
  `question_id` bigint(10) unsigned NOT NULL default '0',
  `choice_id` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_resp_multiple table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_resp_multiple`
--

LOCK TABLES `mdl_questionnaire_resp_multiple` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_resp_multiple` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_resp_multiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_resp_single`
--

DROP TABLE IF EXISTS `mdl_questionnaire_resp_single`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_resp_single` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `response_id` bigint(10) unsigned NOT NULL default '0',
  `question_id` bigint(10) unsigned NOT NULL default '0',
  `choice_id` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesrespsing_resque_ix` (`response_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_resp_single table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_resp_single`
--

LOCK TABLES `mdl_questionnaire_resp_single` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_resp_single` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_resp_single` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_response`
--

DROP TABLE IF EXISTS `mdl_questionnaire_response`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_response` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `survey_id` bigint(10) unsigned NOT NULL default '0',
  `submitted` bigint(10) unsigned NOT NULL default '0',
  `complete` enum('y','n') NOT NULL default 'n',
  `grade` bigint(10) NOT NULL default '0',
  `username` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_response table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_response`
--

LOCK TABLES `mdl_questionnaire_response` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_response_bool`
--

DROP TABLE IF EXISTS `mdl_questionnaire_response_bool`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_response_bool` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `response_id` bigint(10) unsigned NOT NULL default '0',
  `question_id` bigint(10) unsigned NOT NULL default '0',
  `choice_id` enum('y','n') NOT NULL default 'y',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesrespbool_resque_ix` (`response_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_response_bool table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_response_bool`
--

LOCK TABLES `mdl_questionnaire_response_bool` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_response_bool` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_response_bool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_response_date`
--

DROP TABLE IF EXISTS `mdl_questionnaire_response_date`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_response_date` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `response_id` bigint(10) unsigned NOT NULL default '0',
  `question_id` bigint(10) unsigned NOT NULL default '0',
  `response` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_quesrespdate_resque_ix` (`response_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_response_date table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_response_date`
--

LOCK TABLES `mdl_questionnaire_response_date` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_response_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_response_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_response_other`
--

DROP TABLE IF EXISTS `mdl_questionnaire_response_other`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_response_other` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `response_id` bigint(10) unsigned NOT NULL default '0',
  `question_id` bigint(10) unsigned NOT NULL default '0',
  `choice_id` bigint(10) unsigned NOT NULL default '0',
  `response` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_quesrespothe_resquecho_ix` (`response_id`,`question_id`,`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_response_other table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_response_other`
--

LOCK TABLES `mdl_questionnaire_response_other` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_response_other` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_response_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_response_rank`
--

DROP TABLE IF EXISTS `mdl_questionnaire_response_rank`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_response_rank` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `response_id` bigint(10) unsigned NOT NULL default '0',
  `question_id` bigint(10) unsigned NOT NULL default '0',
  `choice_id` bigint(10) unsigned NOT NULL default '0',
  `rank` bigint(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quesresprank_resquecho_ix` (`response_id`,`question_id`,`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_response_rank table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_response_rank`
--

LOCK TABLES `mdl_questionnaire_response_rank` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_response_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_response_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_response_text`
--

DROP TABLE IF EXISTS `mdl_questionnaire_response_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_response_text` (
  `id` bigint(11) unsigned NOT NULL auto_increment,
  `response_id` bigint(10) unsigned NOT NULL default '0',
  `question_id` bigint(10) unsigned NOT NULL default '0',
  `response` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_quesresptext_resque_ix` (`response_id`,`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_response_text table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_response_text`
--

LOCK TABLES `mdl_questionnaire_response_text` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_response_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_response_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_questionnaire_survey`
--

DROP TABLE IF EXISTS `mdl_questionnaire_survey`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_questionnaire_survey` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `owner` varchar(16) NOT NULL default '',
  `realm` varchar(64) NOT NULL default '',
  `public` enum('y','n') NOT NULL default 'y',
  `status` bigint(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `email` varchar(64) default NULL,
  `subtitle` text,
  `info` text,
  `theme` varchar(64) default NULL,
  `thanks_page` varchar(255) default NULL,
  `thank_head` varchar(255) default NULL,
  `thank_body` text,
  PRIMARY KEY  (`id`),
  KEY `mdl_quessurv_nam_ix` (`name`),
  KEY `mdl_quessurv_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='questionnaire_survey table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_questionnaire_survey`
--

LOCK TABLES `mdl_questionnaire_survey` WRITE;
/*!40000 ALTER TABLE `mdl_questionnaire_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_questionnaire_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz`
--

DROP TABLE IF EXISTS `mdl_quiz`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_quiz` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `timeopen` bigint(10) unsigned NOT NULL default '0',
  `timeclose` bigint(10) unsigned NOT NULL default '0',
  `optionflags` bigint(10) unsigned NOT NULL default '0',
  `penaltyscheme` smallint(4) unsigned NOT NULL default '0',
  `attempts` mediumint(6) NOT NULL default '0',
  `attemptonlast` smallint(4) NOT NULL default '0',
  `grademethod` smallint(4) NOT NULL default '1',
  `decimalpoints` smallint(4) NOT NULL default '2',
  `review` bigint(10) unsigned NOT NULL default '0',
  `questionsperpage` bigint(10) NOT NULL default '0',
  `shufflequestions` smallint(4) NOT NULL default '0',
  `shuffleanswers` smallint(4) NOT NULL default '0',
  `questions` text NOT NULL,
  `sumgrades` bigint(10) NOT NULL default '0',
  `grade` bigint(10) NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `timelimit` bigint(10) unsigned NOT NULL default '0',
  `password` varchar(255) NOT NULL default '',
  `subnet` varchar(255) NOT NULL default '',
  `popup` smallint(4) NOT NULL default '0',
  `delay1` bigint(10) NOT NULL default '0',
  `delay2` bigint(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Main information about each quiz';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_quiz`
--

LOCK TABLES `mdl_quiz` WRITE;
/*!40000 ALTER TABLE `mdl_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_attempts`
--

DROP TABLE IF EXISTS `mdl_quiz_attempts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `uniqueid` bigint(10) unsigned NOT NULL default '0',
  `quiz` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `attempt` mediumint(6) NOT NULL default '0',
  `sumgrades` double NOT NULL default '0',
  `timestart` bigint(10) unsigned NOT NULL default '0',
  `timefinish` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `layout` text NOT NULL,
  `preview` smallint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_use_ix` (`userid`),
  KEY `mdl_quizatte_qui_ix` (`quiz`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores various attempts on a quiz';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_quiz_attempts`
--

LOCK TABLES `mdl_quiz_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_feedback`
--

DROP TABLE IF EXISTS `mdl_quiz_feedback`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `quizid` bigint(10) unsigned NOT NULL default '0',
  `feedbacktext` text NOT NULL,
  `mingrade` double NOT NULL default '0',
  `maxgrade` double NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on their overall score on t';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_quiz_feedback`
--

LOCK TABLES `mdl_quiz_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_grades`
--

DROP TABLE IF EXISTS `mdl_quiz_grades`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_quiz_grades` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `quiz` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `grade` double NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Final quiz grade (may be best of several attempts)';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_quiz_grades`
--

LOCK TABLES `mdl_quiz_grades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_question_instances`
--

DROP TABLE IF EXISTS `mdl_quiz_question_instances`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_quiz_question_instances` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `quiz` bigint(10) unsigned NOT NULL default '0',
  `question` bigint(10) unsigned NOT NULL default '0',
  `grade` mediumint(6) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The grade for a question in a quiz';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_quiz_question_instances`
--

LOCK TABLES `mdl_quiz_question_instances` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_question_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_question_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_question_versions`
--

DROP TABLE IF EXISTS `mdl_quiz_question_versions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_quiz_question_versions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `quiz` bigint(10) unsigned NOT NULL default '0',
  `oldquestion` bigint(10) unsigned NOT NULL default '0',
  `newquestion` bigint(10) unsigned NOT NULL default '0',
  `originalquestion` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `timestamp` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_quizquesvers_qui_ix` (`quiz`),
  KEY `mdl_quizquesvers_old_ix` (`oldquestion`),
  KEY `mdl_quizquesvers_new_ix` (`newquestion`),
  KEY `mdl_quizquesvers_ori_ix` (`originalquestion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='quiz_question_versions table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_quiz_question_versions`
--

LOCK TABLES `mdl_quiz_question_versions` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_question_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_question_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource`
--

DROP TABLE IF EXISTS `mdl_resource`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_resource` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `type` varchar(30) NOT NULL default '',
  `reference` varchar(255) NOT NULL default '',
  `summary` text,
  `alltext` mediumtext NOT NULL,
  `popup` text NOT NULL,
  `options` varchar(255) NOT NULL default '',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each record is one resource and its config data';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_resource`
--

LOCK TABLES `mdl_resource` WRITE;
/*!40000 ALTER TABLE `mdl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role`
--

DROP TABLE IF EXISTS `mdl_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_role` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `shortname` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='moodle roles';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_role`
--

LOCK TABLES `mdl_role` WRITE;
/*!40000 ALTER TABLE `mdl_role` DISABLE KEYS */;
INSERT INTO `mdl_role` VALUES (1,'Administrator','admin','Administrators can usually do anything on the site, in all courses.',0);
INSERT INTO `mdl_role` VALUES (2,'Course creator','coursecreator','Course creators can create new courses and teach in them.',1);
INSERT INTO `mdl_role` VALUES (3,'Teacher','editingteacher','Teachers can do anything within a course, including changing the activities and grading students.',2);
INSERT INTO `mdl_role` VALUES (4,'Non-editing teacher','teacher','Non-editing teachers can teach in courses and grade students, but may not alter activities.',3);
INSERT INTO `mdl_role` VALUES (5,'Student','student','Students generally have less privileges within a course.',4);
INSERT INTO `mdl_role` VALUES (6,'Guest','guest','Guests have minimal privileges and usually can not enter text anywhere.',5);
INSERT INTO `mdl_role` VALUES (7,'Authenticated user','user','All logged in users.',6);
/*!40000 ALTER TABLE `mdl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_assign`
--

DROP TABLE IF EXISTS `mdl_role_allow_assign`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `allowassign` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_role_allow_assign`
--

LOCK TABLES `mdl_role_allow_assign` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_assign` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_assign` VALUES (1,1,1);
INSERT INTO `mdl_role_allow_assign` VALUES (2,1,2);
INSERT INTO `mdl_role_allow_assign` VALUES (3,1,4);
INSERT INTO `mdl_role_allow_assign` VALUES (4,1,3);
INSERT INTO `mdl_role_allow_assign` VALUES (5,1,5);
INSERT INTO `mdl_role_allow_assign` VALUES (6,1,6);
INSERT INTO `mdl_role_allow_assign` VALUES (7,2,4);
INSERT INTO `mdl_role_allow_assign` VALUES (8,2,3);
INSERT INTO `mdl_role_allow_assign` VALUES (9,2,5);
INSERT INTO `mdl_role_allow_assign` VALUES (10,2,6);
INSERT INTO `mdl_role_allow_assign` VALUES (11,3,4);
INSERT INTO `mdl_role_allow_assign` VALUES (12,3,5);
INSERT INTO `mdl_role_allow_assign` VALUES (13,3,6);
/*!40000 ALTER TABLE `mdl_role_allow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_override`
--

DROP TABLE IF EXISTS `mdl_role_allow_override`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_role_allow_override` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `allowoverride` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_role_allow_override`
--

LOCK TABLES `mdl_role_allow_override` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_override` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_override` VALUES (1,1,1);
INSERT INTO `mdl_role_allow_override` VALUES (2,1,2);
INSERT INTO `mdl_role_allow_override` VALUES (3,1,4);
INSERT INTO `mdl_role_allow_override` VALUES (4,1,3);
INSERT INTO `mdl_role_allow_override` VALUES (5,1,5);
INSERT INTO `mdl_role_allow_override` VALUES (6,1,6);
INSERT INTO `mdl_role_allow_override` VALUES (7,1,7);
/*!40000 ALTER TABLE `mdl_role_allow_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_assignments`
--

DROP TABLE IF EXISTS `mdl_role_assignments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_role_assignments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `contextid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `hidden` tinyint(1) unsigned NOT NULL default '0',
  `timestart` bigint(10) unsigned NOT NULL default '0',
  `timeend` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `modifierid` bigint(10) unsigned NOT NULL default '0',
  `enrol` varchar(20) NOT NULL default '',
  `sortorder` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_roleassi_conroluse_uix` (`contextid`,`roleid`,`userid`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='assigning roles to different context';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_role_assignments`
--

LOCK TABLES `mdl_role_assignments` WRITE;
/*!40000 ALTER TABLE `mdl_role_assignments` DISABLE KEYS */;
INSERT INTO `mdl_role_assignments` VALUES (1,1,1,2,0,0,0,1201718665,0,'manual',0);
/*!40000 ALTER TABLE `mdl_role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_capabilities`
--

DROP TABLE IF EXISTS `mdl_role_capabilities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_role_capabilities` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `contextid` bigint(10) unsigned NOT NULL default '0',
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `capability` varchar(255) NOT NULL default '',
  `permission` bigint(10) NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `modifierid` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=MyISAM AUTO_INCREMENT=4634 DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_role_capabilities`
--

LOCK TABLES `mdl_role_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_role_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_role_capabilities` VALUES (1,1,1,'moodle/legacy:admin',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (2,1,2,'moodle/legacy:coursecreator',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (3,1,3,'moodle/legacy:editingteacher',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (4,1,4,'moodle/legacy:teacher',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (5,1,5,'moodle/legacy:student',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (6,1,6,'moodle/legacy:guest',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (7,1,7,'moodle/legacy:user',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (8,1,1,'moodle/site:doanything',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (9,1,1,'moodle/site:config',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (10,1,1,'moodle/site:readallmessages',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (11,1,3,'moodle/site:readallmessages',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (12,1,1,'moodle/site:sendmessage',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (13,1,7,'moodle/site:sendmessage',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (14,1,1,'moodle/site:approvecourse',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (15,1,3,'moodle/site:import',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (16,1,1,'moodle/site:import',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (17,1,3,'moodle/site:backup',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (18,1,1,'moodle/site:backup',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (19,1,3,'moodle/site:restore',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (20,1,1,'moodle/site:restore',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (21,1,3,'moodle/site:manageblocks',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (22,1,1,'moodle/site:manageblocks',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (23,1,4,'moodle/site:accessallgroups',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (24,1,3,'moodle/site:accessallgroups',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (25,1,1,'moodle/site:accessallgroups',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (26,1,4,'moodle/site:viewfullnames',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (27,1,3,'moodle/site:viewfullnames',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (28,1,1,'moodle/site:viewfullnames',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (29,1,4,'moodle/site:viewreports',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (30,1,3,'moodle/site:viewreports',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (31,1,1,'moodle/site:viewreports',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (32,1,3,'moodle/site:trustcontent',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (33,1,1,'moodle/site:trustcontent',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (34,1,1,'moodle/site:uploadusers',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (35,1,1,'moodle/user:create',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (36,1,1,'moodle/user:delete',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (37,1,1,'moodle/user:update',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (38,1,6,'moodle/user:viewdetails',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (39,1,5,'moodle/user:viewdetails',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (40,1,4,'moodle/user:viewdetails',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (41,1,3,'moodle/user:viewdetails',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (42,1,1,'moodle/user:viewdetails',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (43,1,4,'moodle/user:viewhiddendetails',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (44,1,3,'moodle/user:viewhiddendetails',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (45,1,1,'moodle/user:viewhiddendetails',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (1563,1,5,'mod/book:read',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1553,1,6,'mod/book:read',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1543,1,1,'mod/audiorecorder:grade',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (50,1,1,'moodle/user:loginas',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (51,1,3,'moodle/role:assign',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (52,1,1,'moodle/role:assign',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (53,1,1,'moodle/role:override',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (54,1,1,'moodle/role:manage',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (55,1,4,'moodle/role:unassignself',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (56,1,3,'moodle/role:unassignself',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (57,1,2,'moodle/role:unassignself',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (58,1,1,'moodle/role:unassignself',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (59,1,4,'moodle/role:viewhiddenassigns',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (60,1,3,'moodle/role:viewhiddenassigns',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (61,1,1,'moodle/role:viewhiddenassigns',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (62,1,3,'moodle/role:switchroles',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (63,1,1,'moodle/role:switchroles',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (1533,1,2,'mod/audiorecorder:grade',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1523,1,3,'mod/audiorecorder:grade',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (68,1,2,'moodle/course:create',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (69,1,1,'moodle/course:create',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (70,1,1,'moodle/course:delete',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (71,1,3,'moodle/course:update',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (72,1,1,'moodle/course:update',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (73,1,6,'moodle/course:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (74,1,5,'moodle/course:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (75,1,4,'moodle/course:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (76,1,3,'moodle/course:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (77,1,4,'moodle/course:bulkmessaging',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (78,1,3,'moodle/course:bulkmessaging',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (79,1,1,'moodle/course:bulkmessaging',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (80,1,4,'moodle/course:viewhiddenuserfields',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (81,1,3,'moodle/course:viewhiddenuserfields',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (82,1,1,'moodle/course:viewhiddenuserfields',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (83,1,2,'moodle/course:viewhiddencourses',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (84,1,4,'moodle/course:viewhiddencourses',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (85,1,3,'moodle/course:viewhiddencourses',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (86,1,1,'moodle/course:viewhiddencourses',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (87,1,1,'moodle/course:visibility',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (88,1,3,'moodle/course:managefiles',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (89,1,1,'moodle/course:managefiles',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (90,1,3,'moodle/course:manageactivities',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (91,1,1,'moodle/course:manageactivities',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (92,1,3,'moodle/course:managemetacourse',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (93,1,1,'moodle/course:managemetacourse',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (94,1,3,'moodle/course:activityvisibility',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (95,1,1,'moodle/course:activityvisibility',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (96,1,4,'moodle/course:viewhiddenactivities',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (97,1,3,'moodle/course:viewhiddenactivities',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (98,1,1,'moodle/course:viewhiddenactivities',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (99,1,5,'moodle/course:viewparticipants',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (100,1,4,'moodle/course:viewparticipants',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (101,1,3,'moodle/course:viewparticipants',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (102,1,1,'moodle/course:viewparticipants',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (103,1,5,'moodle/course:viewscales',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (104,1,4,'moodle/course:viewscales',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (105,1,3,'moodle/course:viewscales',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (106,1,1,'moodle/course:viewscales',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (107,1,3,'moodle/course:managescales',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (108,1,1,'moodle/course:managescales',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (109,1,3,'moodle/course:managegroups',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (110,1,1,'moodle/course:managegroups',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (111,1,3,'moodle/course:reset',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (112,1,1,'moodle/course:reset',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (113,1,6,'moodle/blog:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (114,1,7,'moodle/blog:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (115,1,5,'moodle/blog:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (116,1,4,'moodle/blog:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (117,1,3,'moodle/blog:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (118,1,1,'moodle/blog:view',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (119,1,7,'moodle/blog:create',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (120,1,1,'moodle/blog:create',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (1513,1,4,'mod/audiorecorder:grade',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1503,1,1,'mod/audiorecorder:submit',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1493,1,2,'mod/audiorecorder:submit',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1483,1,3,'mod/audiorecorder:submit',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (126,1,4,'moodle/blog:manageentries',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (127,1,3,'moodle/blog:manageentries',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (128,1,1,'moodle/blog:manageentries',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (129,1,7,'moodle/calendar:manageownentries',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (130,1,1,'moodle/calendar:manageownentries',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (131,1,4,'moodle/calendar:manageentries',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (132,1,3,'moodle/calendar:manageentries',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (133,1,1,'moodle/calendar:manageentries',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (134,1,1,'moodle/user:editprofile',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (135,1,5,'moodle/user:readuserposts',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (136,1,4,'moodle/user:readuserposts',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (137,1,3,'moodle/user:readuserposts',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (138,1,1,'moodle/user:readuserposts',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (139,1,5,'moodle/user:readuserblogs',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (140,1,4,'moodle/user:readuserblogs',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (141,1,3,'moodle/user:readuserblogs',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (142,1,1,'moodle/user:readuserblogs',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (143,1,4,'moodle/user:viewuseractivitiesreport',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (144,1,3,'moodle/user:viewuseractivitiesreport',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (145,1,1,'moodle/user:viewuseractivitiesreport',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (1473,1,4,'mod/audiorecorder:submit',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1463,1,5,'mod/audiorecorder:submit',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (150,1,3,'moodle/question:managecategory',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (151,1,1,'moodle/question:managecategory',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (1453,1,1,'mod/audiorecorder:view',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1443,1,2,'mod/audiorecorder:view',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (154,1,4,'moodle/site:doclinks',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (155,1,3,'moodle/site:doclinks',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (156,1,1,'moodle/site:doclinks',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (157,1,3,'moodle/course:sectionvisibility',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (158,1,1,'moodle/course:sectionvisibility',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (159,1,3,'moodle/course:useremail',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (160,1,1,'moodle/course:useremail',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (161,1,3,'moodle/course:viewhiddensections',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (162,1,1,'moodle/course:viewhiddensections',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (163,1,3,'moodle/course:setcurrentsection',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (164,1,1,'moodle/course:setcurrentsection',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (1433,1,3,'mod/audiorecorder:view',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1423,1,4,'mod/audiorecorder:view',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1413,1,5,'mod/audiorecorder:view',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1403,1,6,'mod/audiorecorder:view',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (170,1,1,'moodle/site:mnetlogintoremote',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (171,1,7,'moodle/my:manageblocks',1,1201718639,0);
INSERT INTO `mdl_role_capabilities` VALUES (172,1,6,'mod/assignment:view',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (173,1,5,'mod/assignment:view',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (174,1,4,'mod/assignment:view',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (175,1,3,'mod/assignment:view',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (176,1,1,'mod/assignment:view',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (177,1,5,'mod/assignment:submit',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (178,1,4,'mod/assignment:grade',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (179,1,3,'mod/assignment:grade',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (180,1,1,'mod/assignment:grade',1,1201718640,0);
INSERT INTO `mdl_role_capabilities` VALUES (181,1,5,'mod/chat:chat',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (182,1,4,'mod/chat:chat',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (183,1,3,'mod/chat:chat',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (184,1,1,'mod/chat:chat',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (185,1,5,'mod/chat:readlog',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (186,1,4,'mod/chat:readlog',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (187,1,3,'mod/chat:readlog',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (188,1,1,'mod/chat:readlog',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (189,1,4,'mod/chat:deletelog',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (190,1,3,'mod/chat:deletelog',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (191,1,1,'mod/chat:deletelog',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (192,1,5,'mod/choice:choose',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (193,1,4,'mod/choice:choose',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (194,1,3,'mod/choice:choose',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (195,1,1,'mod/choice:choose',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (196,1,4,'mod/choice:readresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (197,1,3,'mod/choice:readresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (198,1,1,'mod/choice:readresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (199,1,4,'mod/choice:deleteresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (200,1,3,'mod/choice:deleteresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (201,1,1,'mod/choice:deleteresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (202,1,4,'mod/choice:downloadresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (203,1,3,'mod/choice:downloadresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (204,1,1,'mod/choice:downloadresponses',1,1201718641,0);
INSERT INTO `mdl_role_capabilities` VALUES (205,1,6,'mod/data:viewentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (206,1,5,'mod/data:viewentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (207,1,4,'mod/data:viewentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (208,1,3,'mod/data:viewentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (209,1,1,'mod/data:viewentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (210,1,5,'mod/data:writeentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (211,1,4,'mod/data:writeentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (212,1,3,'mod/data:writeentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (213,1,1,'mod/data:writeentry',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (214,1,5,'mod/data:comment',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (215,1,4,'mod/data:comment',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (216,1,3,'mod/data:comment',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (217,1,1,'mod/data:comment',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (218,1,4,'mod/data:viewrating',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (219,1,3,'mod/data:viewrating',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (220,1,1,'mod/data:viewrating',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (221,1,4,'mod/data:rate',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (222,1,3,'mod/data:rate',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (223,1,1,'mod/data:rate',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (224,1,4,'mod/data:approve',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (225,1,3,'mod/data:approve',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (226,1,1,'mod/data:approve',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (227,1,4,'mod/data:manageentries',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (228,1,3,'mod/data:manageentries',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (229,1,1,'mod/data:manageentries',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (230,1,4,'mod/data:managecomments',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (231,1,3,'mod/data:managecomments',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (232,1,1,'mod/data:managecomments',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (233,1,3,'mod/data:managetemplates',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (234,1,1,'mod/data:managetemplates',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (235,1,4,'mod/data:viewalluserpresets',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (236,1,3,'mod/data:viewalluserpresets',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (237,1,1,'mod/data:viewalluserpresets',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (238,1,1,'mod/data:manageuserpresets',1,1201718642,0);
INSERT INTO `mdl_role_capabilities` VALUES (239,1,6,'mod/forum:viewdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (240,1,5,'mod/forum:viewdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (241,1,4,'mod/forum:viewdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (242,1,3,'mod/forum:viewdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (243,1,1,'mod/forum:viewdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (244,1,4,'mod/forum:viewhiddentimedposts',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (245,1,3,'mod/forum:viewhiddentimedposts',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (246,1,1,'mod/forum:viewhiddentimedposts',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (247,1,5,'mod/forum:startdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (248,1,4,'mod/forum:startdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (249,1,3,'mod/forum:startdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (250,1,1,'mod/forum:startdiscussion',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (251,1,5,'mod/forum:replypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (252,1,4,'mod/forum:replypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (253,1,3,'mod/forum:replypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (254,1,1,'mod/forum:replypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (255,1,4,'mod/forum:addnews',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (256,1,3,'mod/forum:addnews',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (257,1,1,'mod/forum:addnews',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (258,1,4,'mod/forum:replynews',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (259,1,3,'mod/forum:replynews',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (260,1,1,'mod/forum:replynews',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (261,1,5,'mod/forum:viewrating',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (262,1,4,'mod/forum:viewrating',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (263,1,3,'mod/forum:viewrating',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (264,1,1,'mod/forum:viewrating',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (265,1,4,'mod/forum:viewanyrating',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (266,1,3,'mod/forum:viewanyrating',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (267,1,1,'mod/forum:viewanyrating',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (268,1,4,'mod/forum:rate',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (269,1,3,'mod/forum:rate',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (270,1,1,'mod/forum:rate',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (271,1,5,'mod/forum:createattachment',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (272,1,4,'mod/forum:createattachment',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (273,1,3,'mod/forum:createattachment',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (274,1,1,'mod/forum:createattachment',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (275,1,5,'mod/forum:deleteownpost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (276,1,4,'mod/forum:deleteownpost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (277,1,3,'mod/forum:deleteownpost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (278,1,1,'mod/forum:deleteownpost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (279,1,4,'mod/forum:deleteanypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (280,1,3,'mod/forum:deleteanypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (281,1,1,'mod/forum:deleteanypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (282,1,4,'mod/forum:splitdiscussions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (283,1,3,'mod/forum:splitdiscussions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (284,1,1,'mod/forum:splitdiscussions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (285,1,4,'mod/forum:movediscussions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (286,1,3,'mod/forum:movediscussions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (287,1,1,'mod/forum:movediscussions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (288,1,4,'mod/forum:editanypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (289,1,3,'mod/forum:editanypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (290,1,1,'mod/forum:editanypost',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (291,1,4,'mod/forum:viewqandawithoutposting',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (292,1,3,'mod/forum:viewqandawithoutposting',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (293,1,1,'mod/forum:viewqandawithoutposting',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (294,1,4,'mod/forum:viewsubscribers',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (295,1,3,'mod/forum:viewsubscribers',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (296,1,1,'mod/forum:viewsubscribers',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (297,1,4,'mod/forum:managesubscriptions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (298,1,3,'mod/forum:managesubscriptions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (299,1,1,'mod/forum:managesubscriptions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (300,1,4,'mod/forum:initialsubscriptions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (301,1,3,'mod/forum:initialsubscriptions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (302,1,5,'mod/forum:initialsubscriptions',1,1201718644,0);
INSERT INTO `mdl_role_capabilities` VALUES (303,1,5,'mod/glossary:write',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (304,1,4,'mod/glossary:write',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (305,1,3,'mod/glossary:write',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (306,1,1,'mod/glossary:write',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (307,1,4,'mod/glossary:manageentries',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (308,1,3,'mod/glossary:manageentries',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (309,1,1,'mod/glossary:manageentries',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (310,1,4,'mod/glossary:managecategories',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (311,1,3,'mod/glossary:managecategories',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (312,1,1,'mod/glossary:managecategories',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (313,1,5,'mod/glossary:comment',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (314,1,4,'mod/glossary:comment',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (315,1,3,'mod/glossary:comment',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (316,1,1,'mod/glossary:comment',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (317,1,4,'mod/glossary:managecomments',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (318,1,3,'mod/glossary:managecomments',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (319,1,1,'mod/glossary:managecomments',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (320,1,4,'mod/glossary:import',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (321,1,3,'mod/glossary:import',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (322,1,1,'mod/glossary:import',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (323,1,4,'mod/glossary:export',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (324,1,3,'mod/glossary:export',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (325,1,1,'mod/glossary:export',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (326,1,4,'mod/glossary:approve',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (327,1,3,'mod/glossary:approve',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (328,1,1,'mod/glossary:approve',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (329,1,4,'mod/glossary:rate',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (330,1,3,'mod/glossary:rate',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (331,1,1,'mod/glossary:rate',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (332,1,4,'mod/glossary:viewrating',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (333,1,3,'mod/glossary:viewrating',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (334,1,1,'mod/glossary:viewrating',1,1201718645,0);
INSERT INTO `mdl_role_capabilities` VALUES (335,1,5,'mod/hotpot:attempt',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (336,1,4,'mod/hotpot:attempt',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (337,1,3,'mod/hotpot:attempt',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (338,1,1,'mod/hotpot:attempt',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (339,1,4,'mod/hotpot:viewreport',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (340,1,3,'mod/hotpot:viewreport',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (341,1,1,'mod/hotpot:viewreport',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (342,1,4,'mod/hotpot:grade',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (343,1,3,'mod/hotpot:grade',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (344,1,1,'mod/hotpot:grade',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (345,1,3,'mod/hotpot:deleteattempt',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (346,1,1,'mod/hotpot:deleteattempt',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (347,1,5,'mod/lams:participate',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (348,1,4,'mod/lams:manage',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (349,1,3,'mod/lams:manage',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (350,1,1,'mod/lams:manage',1,1201718646,0);
INSERT INTO `mdl_role_capabilities` VALUES (351,1,3,'mod/lesson:edit',1,1201718648,0);
INSERT INTO `mdl_role_capabilities` VALUES (352,1,1,'mod/lesson:edit',1,1201718648,0);
INSERT INTO `mdl_role_capabilities` VALUES (353,1,4,'mod/lesson:manage',1,1201718648,0);
INSERT INTO `mdl_role_capabilities` VALUES (354,1,3,'mod/lesson:manage',1,1201718648,0);
INSERT INTO `mdl_role_capabilities` VALUES (355,1,1,'mod/lesson:manage',1,1201718648,0);
INSERT INTO `mdl_role_capabilities` VALUES (356,1,6,'mod/quiz:view',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (357,1,5,'mod/quiz:view',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (358,1,4,'mod/quiz:view',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (359,1,3,'mod/quiz:view',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (360,1,1,'mod/quiz:view',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (361,1,5,'mod/quiz:attempt',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (362,1,3,'mod/quiz:manage',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (363,1,1,'mod/quiz:manage',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (364,1,4,'mod/quiz:preview',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (365,1,3,'mod/quiz:preview',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (366,1,1,'mod/quiz:preview',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (367,1,4,'mod/quiz:grade',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (368,1,3,'mod/quiz:grade',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (369,1,1,'mod/quiz:grade',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (370,1,4,'mod/quiz:viewreports',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (371,1,3,'mod/quiz:viewreports',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (372,1,1,'mod/quiz:viewreports',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (373,1,3,'mod/quiz:deleteattempts',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (374,1,1,'mod/quiz:deleteattempts',1,1201718650,0);
INSERT INTO `mdl_role_capabilities` VALUES (375,1,4,'mod/scorm:viewreport',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (376,1,3,'mod/scorm:viewreport',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (377,1,1,'mod/scorm:viewreport',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (378,1,5,'mod/scorm:skipview',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (379,1,5,'mod/scorm:savetrack',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (380,1,4,'mod/scorm:savetrack',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (381,1,3,'mod/scorm:savetrack',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (382,1,1,'mod/scorm:savetrack',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (383,1,5,'mod/scorm:viewscores',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (384,1,4,'mod/scorm:viewscores',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (385,1,3,'mod/scorm:viewscores',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (386,1,1,'mod/scorm:viewscores',1,1201718652,0);
INSERT INTO `mdl_role_capabilities` VALUES (387,1,5,'mod/survey:participate',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (388,1,4,'mod/survey:participate',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (389,1,3,'mod/survey:participate',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (390,1,1,'mod/survey:participate',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (391,1,4,'mod/survey:readresponses',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (392,1,3,'mod/survey:readresponses',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (393,1,1,'mod/survey:readresponses',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (394,1,4,'mod/survey:download',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (395,1,3,'mod/survey:download',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (396,1,1,'mod/survey:download',1,1201718653,0);
INSERT INTO `mdl_role_capabilities` VALUES (397,1,5,'mod/wiki:participate',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (398,1,4,'mod/wiki:participate',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (399,1,3,'mod/wiki:participate',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (400,1,1,'mod/wiki:participate',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (401,1,4,'mod/wiki:manage',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (402,1,3,'mod/wiki:manage',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (403,1,1,'mod/wiki:manage',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (404,1,4,'mod/wiki:overridelock',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (405,1,3,'mod/wiki:overridelock',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (406,1,1,'mod/wiki:overridelock',1,1201718654,0);
INSERT INTO `mdl_role_capabilities` VALUES (407,1,5,'mod/workshop:participate',1,1201718655,0);
INSERT INTO `mdl_role_capabilities` VALUES (408,1,4,'mod/workshop:manage',1,1201718655,0);
INSERT INTO `mdl_role_capabilities` VALUES (409,1,3,'mod/workshop:manage',1,1201718655,0);
INSERT INTO `mdl_role_capabilities` VALUES (410,1,1,'mod/workshop:manage',1,1201718655,0);
INSERT INTO `mdl_role_capabilities` VALUES (411,1,4,'block/rss_client:createprivatefeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (412,1,3,'block/rss_client:createprivatefeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (413,1,1,'block/rss_client:createprivatefeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (414,1,3,'block/rss_client:createsharedfeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (415,1,1,'block/rss_client:createsharedfeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (416,1,4,'block/rss_client:manageownfeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (417,1,3,'block/rss_client:manageownfeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (418,1,1,'block/rss_client:manageownfeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (419,1,1,'block/rss_client:manageanyfeeds',1,1201718660,0);
INSERT INTO `mdl_role_capabilities` VALUES (420,1,1,'enrol/authorize:managepayments',1,1201718662,0);
INSERT INTO `mdl_role_capabilities` VALUES (421,1,1,'enrol/authorize:uploadcsv',1,1201718662,0);
INSERT INTO `mdl_role_capabilities` VALUES (423,1,3,'moodle/course:visibility',1,1283907039,0);
INSERT INTO `mdl_role_capabilities` VALUES (433,1,1,'moodle/backup:userinfo',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (443,1,1,'moodle/restore:createuser',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (453,1,1,'moodle/restore:userinfo',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (463,1,2,'moodle/restore:rolldates',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (473,1,1,'moodle/restore:rolldates',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (483,1,1,'moodle/site:langeditmaster',-1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (493,1,1,'moodle/site:langeditlocal',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (503,1,3,'moodle/role:safeoverride',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (513,1,1,'moodle/category:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (523,1,1,'moodle/category:viewhiddencategories',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (533,1,7,'moodle/course:request',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (543,1,3,'moodle/course:changefullname',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (553,1,1,'moodle/course:changefullname',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (563,1,3,'moodle/course:changeshortname',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (573,1,1,'moodle/course:changeshortname',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (583,1,3,'moodle/course:changeidnumber',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (593,1,1,'moodle/course:changeidnumber',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (603,1,3,'moodle/course:changecategory',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (613,1,1,'moodle/course:changecategory',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (623,1,3,'moodle/course:changesummary',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (633,1,1,'moodle/course:changesummary',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (643,1,1,'moodle/site:viewparticipants',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (653,1,4,'moodle/calendar:managegroupentries',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (663,1,3,'moodle/calendar:managegroupentries',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (673,1,1,'moodle/calendar:managegroupentries',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (683,1,6,'moodle/user:editownprofile',-1000,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (693,1,7,'moodle/user:editownprofile',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (703,1,1,'moodle/user:editownprofile',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (713,1,6,'moodle/user:changeownpassword',-1000,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (723,1,7,'moodle/user:changeownpassword',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (733,1,1,'moodle/user:changeownpassword',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (743,1,3,'moodle/question:add',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (753,1,1,'moodle/question:add',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (763,1,3,'moodle/question:editmine',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (773,1,1,'moodle/question:editmine',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (783,1,3,'moodle/question:editall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (793,1,1,'moodle/question:editall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (803,1,3,'moodle/question:viewmine',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (813,1,1,'moodle/question:viewmine',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (823,1,3,'moodle/question:viewall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (833,1,1,'moodle/question:viewall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (843,1,3,'moodle/question:usemine',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (853,1,1,'moodle/question:usemine',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (863,1,3,'moodle/question:useall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (873,1,1,'moodle/question:useall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (883,1,3,'moodle/question:movemine',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (893,1,1,'moodle/question:movemine',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (903,1,3,'moodle/question:moveall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (913,1,1,'moodle/question:moveall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (923,1,1,'moodle/question:config',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (933,1,4,'moodle/grade:viewall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (943,1,3,'moodle/grade:viewall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (953,1,1,'moodle/grade:viewall',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (963,1,5,'moodle/grade:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (973,1,4,'moodle/grade:viewhidden',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (983,1,3,'moodle/grade:viewhidden',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (993,1,1,'moodle/grade:viewhidden',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1003,1,3,'moodle/grade:import',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1013,1,1,'moodle/grade:import',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1023,1,3,'moodle/grade:export',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1033,1,1,'moodle/grade:export',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1043,1,3,'moodle/grade:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1053,1,1,'moodle/grade:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1063,1,3,'moodle/grade:edit',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1073,1,1,'moodle/grade:edit',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1083,1,3,'moodle/grade:manageoutcomes',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1093,1,1,'moodle/grade:manageoutcomes',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1103,1,3,'moodle/grade:manageletters',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1113,1,1,'moodle/grade:manageletters',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1123,1,3,'moodle/grade:hide',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1133,1,1,'moodle/grade:hide',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1143,1,3,'moodle/grade:lock',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1153,1,1,'moodle/grade:lock',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1163,1,3,'moodle/grade:unlock',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1173,1,1,'moodle/grade:unlock',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1183,1,4,'moodle/notes:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1193,1,3,'moodle/notes:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1203,1,1,'moodle/notes:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1213,1,4,'moodle/notes:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1223,1,3,'moodle/notes:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1233,1,1,'moodle/notes:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1243,1,4,'moodle/tag:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1253,1,3,'moodle/tag:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1263,1,1,'moodle/tag:manage',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1273,1,1,'moodle/tag:create',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1283,1,7,'moodle/tag:create',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1293,1,1,'moodle/tag:edit',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1303,1,7,'moodle/tag:edit',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1313,1,4,'moodle/tag:editblocks',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1323,1,3,'moodle/tag:editblocks',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1333,1,1,'moodle/tag:editblocks',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1343,1,6,'moodle/block:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1353,1,7,'moodle/block:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1363,1,5,'moodle/block:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1373,1,4,'moodle/block:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1383,1,3,'moodle/block:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1393,1,2,'moodle/block:view',1,1283907040,0);
INSERT INTO `mdl_role_capabilities` VALUES (1573,1,4,'mod/book:read',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1583,1,3,'mod/book:read',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1593,1,4,'mod/book:viewhiddenchapters',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1603,1,3,'mod/book:viewhiddenchapters',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1613,1,3,'mod/book:edit',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1623,1,3,'mod/book:import',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1633,1,6,'mod/book:print',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1643,1,5,'mod/book:print',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1653,1,4,'mod/book:print',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1663,1,3,'mod/book:print',1,1283907128,2);
INSERT INTO `mdl_role_capabilities` VALUES (1673,1,5,'mod/elluminate:view',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1683,1,4,'mod/elluminate:view',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1693,1,3,'mod/elluminate:view',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1703,1,2,'mod/elluminate:view',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1713,1,1,'mod/elluminate:view',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1723,1,4,'mod/elluminate:manage',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1733,1,3,'mod/elluminate:manage',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1743,1,1,'mod/elluminate:manage',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1753,1,3,'mod/elluminate:moderatemeeting',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1763,1,1,'mod/elluminate:moderatemeeting',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1773,1,3,'mod/elluminate:enablerecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1783,1,1,'mod/elluminate:enablerecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1793,1,5,'mod/elluminate:viewrecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1803,1,4,'mod/elluminate:viewrecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1813,1,3,'mod/elluminate:viewrecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1823,1,1,'mod/elluminate:viewrecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1833,1,3,'mod/elluminate:deleterecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1843,1,1,'mod/elluminate:deleterecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1853,1,1,'mod/elluminate:deleteanyrecordings',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1863,1,3,'mod/elluminate:managemoderators',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1873,1,1,'mod/elluminate:managemoderators',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1883,1,3,'mod/elluminate:manageparticipants',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1893,1,1,'mod/elluminate:manageparticipants',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1903,1,5,'mod/elluminate:viewmoderators',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1913,1,4,'mod/elluminate:viewmoderators',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1923,1,3,'mod/elluminate:viewmoderators',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1933,1,1,'mod/elluminate:viewmoderators',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1943,1,5,'mod/elluminate:viewparticipants',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1953,1,4,'mod/elluminate:viewparticipants',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1963,1,3,'mod/elluminate:viewparticipants',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1973,1,1,'mod/elluminate:viewparticipants',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1983,1,4,'mod/elluminate:viewattendance',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (1993,1,3,'mod/elluminate:viewattendance',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (2003,1,1,'mod/elluminate:viewattendance',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (2013,1,4,'mod/elluminate:manageattendance',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (2023,1,3,'mod/elluminate:manageattendance',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (2033,1,1,'mod/elluminate:manageattendance',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (2043,1,4,'mod/elluminate:manageseats',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (2053,1,3,'mod/elluminate:manageseats',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (2063,1,1,'mod/elluminate:manageseats',1,1283907130,2);
INSERT INTO `mdl_role_capabilities` VALUES (2073,1,5,'mod/ilpconcern:view',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2083,1,4,'mod/ilpconcern:view',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2093,1,3,'mod/ilpconcern:view',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2103,1,1,'mod/ilpconcern:view',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2113,1,6,'mod/ilpconcern:addownreport1',-1000,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2123,1,1,'mod/ilpconcern:addownreport1',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2133,1,6,'mod/ilpconcern:addownreport2',-1000,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2143,1,1,'mod/ilpconcern:addownreport2',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2153,1,6,'mod/ilpconcern:addownreport3',-1000,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2163,1,1,'mod/ilpconcern:addownreport3',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2173,1,4,'mod/ilpconcern:addreport1',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2183,1,3,'mod/ilpconcern:addreport1',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2193,1,1,'mod/ilpconcern:addreport1',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2203,1,4,'mod/ilpconcern:addreport2',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2213,1,3,'mod/ilpconcern:addreport2',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2223,1,1,'mod/ilpconcern:addreport2',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2233,1,4,'mod/ilpconcern:addreport3',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2243,1,3,'mod/ilpconcern:addreport3',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2253,1,1,'mod/ilpconcern:addreport3',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2263,1,4,'mod/ilpconcern:updateconcernstatus',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2273,1,3,'mod/ilpconcern:updateconcernstatus',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2283,1,1,'mod/ilpconcern:updateconcernstatus',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2293,1,4,'mod/ilpconcern:updatestudentstatus',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2303,1,3,'mod/ilpconcern:updatestudentstatus',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2313,1,1,'mod/ilpconcern:updatestudentstatus',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2323,1,6,'mod/ilpconcern:addowncomment',-1000,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2333,1,7,'mod/ilpconcern:addowncomment',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2343,1,1,'mod/ilpconcern:addowncomment',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2353,1,5,'mod/ilpconcern:addcomment',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2363,1,4,'mod/ilpconcern:addcomment',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2373,1,3,'mod/ilpconcern:addcomment',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2383,1,1,'mod/ilpconcern:addcomment',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2393,1,4,'mod/ilpconcern:viewclass',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2403,1,3,'mod/ilpconcern:viewclass',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2413,1,1,'mod/ilpconcern:viewclass',1,1283907133,2);
INSERT INTO `mdl_role_capabilities` VALUES (2423,1,5,'mod/ilptarget:view',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2433,1,4,'mod/ilptarget:view',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2443,1,3,'mod/ilptarget:view',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2453,1,1,'mod/ilptarget:view',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2463,1,6,'mod/ilptarget:addowntarget',-1000,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2473,1,7,'mod/ilptarget:addowntarget',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2483,1,1,'mod/ilptarget:addowntarget',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2493,1,5,'mod/ilptarget:addtarget',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2503,1,4,'mod/ilptarget:addtarget',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2513,1,3,'mod/ilptarget:addtarget',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2523,1,1,'mod/ilptarget:addtarget',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2533,1,5,'mod/ilptarget:updatetargetstatus',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2543,1,4,'mod/ilptarget:updatetargetstatus',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2553,1,3,'mod/ilptarget:updatetargetstatus',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2563,1,1,'mod/ilptarget:updatetargetstatus',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2573,1,6,'mod/ilptarget:addowncomment',-1000,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2583,1,7,'mod/ilptarget:addowncomment',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2593,1,1,'mod/ilptarget:addowncomment',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2603,1,5,'mod/ilptarget:addcomment',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2613,1,4,'mod/ilptarget:addcomment',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2623,1,3,'mod/ilptarget:addcomment',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2633,1,1,'mod/ilptarget:addcomment',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2643,1,4,'mod/ilptarget:viewclass',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2653,1,3,'mod/ilptarget:viewclass',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2663,1,1,'mod/ilptarget:viewclass',1,1283907135,2);
INSERT INTO `mdl_role_capabilities` VALUES (2673,1,5,'mod/lightboxgallery:addcomment',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2683,1,4,'mod/lightboxgallery:addcomment',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2693,1,3,'mod/lightboxgallery:addcomment',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2703,1,1,'mod/lightboxgallery:addcomment',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2713,1,3,'mod/lightboxgallery:addimage',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2723,1,1,'mod/lightboxgallery:addimage',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2733,1,3,'mod/lightboxgallery:edit',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2743,1,1,'mod/lightboxgallery:edit',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2753,1,6,'mod/lightboxgallery:viewcomments',1,1283907136,2);
INSERT INTO `mdl_role_capabilities` VALUES (2763,1,5,'mod/lightboxgallery:viewcomments',1,1283907137,2);
INSERT INTO `mdl_role_capabilities` VALUES (2773,1,4,'mod/lightboxgallery:viewcomments',1,1283907137,2);
INSERT INTO `mdl_role_capabilities` VALUES (2783,1,3,'mod/lightboxgallery:viewcomments',1,1283907137,2);
INSERT INTO `mdl_role_capabilities` VALUES (2793,1,1,'mod/lightboxgallery:viewcomments',1,1283907137,2);
INSERT INTO `mdl_role_capabilities` VALUES (2803,1,5,'mod/map:setownlocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2813,1,4,'mod/map:setownlocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2823,1,3,'mod/map:setownlocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2833,1,1,'mod/map:setownlocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2843,1,5,'mod/map:autoupdatelocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2853,1,4,'mod/map:autoupdatelocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2863,1,3,'mod/map:autoupdatelocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2873,1,1,'mod/map:autoupdatelocation',-1000,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2883,1,4,'mod/map:setotherslocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2893,1,3,'mod/map:setotherslocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2903,1,1,'mod/map:setotherslocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2913,1,5,'mod/map:setextralocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2923,1,4,'mod/map:setextralocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2933,1,3,'mod/map:setextralocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2943,1,1,'mod/map:setextralocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2953,1,4,'mod/map:alwayssetextralocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2963,1,3,'mod/map:alwayssetextralocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2973,1,1,'mod/map:alwayssetextralocation',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2983,1,5,'mod/map:viewmap',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (2993,1,4,'mod/map:viewmap',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (3003,1,3,'mod/map:viewmap',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (3013,1,1,'mod/map:viewmap',1,1283907138,2);
INSERT INTO `mdl_role_capabilities` VALUES (3023,1,5,'mod/questionnaire:view',1,1283907143,2);
INSERT INTO `mdl_role_capabilities` VALUES (3033,1,4,'mod/questionnaire:view',1,1283907143,2);
INSERT INTO `mdl_role_capabilities` VALUES (3043,1,3,'mod/questionnaire:view',1,1283907143,2);
INSERT INTO `mdl_role_capabilities` VALUES (3053,1,2,'mod/questionnaire:view',1,1283907143,2);
INSERT INTO `mdl_role_capabilities` VALUES (3063,1,1,'mod/questionnaire:view',1,1283907143,2);
INSERT INTO `mdl_role_capabilities` VALUES (3073,1,5,'mod/questionnaire:submit',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3083,1,1,'mod/questionnaire:submit',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3093,1,4,'mod/questionnaire:viewsingleresponse',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3103,1,3,'mod/questionnaire:viewsingleresponse',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3113,1,1,'mod/questionnaire:viewsingleresponse',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3123,1,4,'mod/questionnaire:downloadresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3133,1,3,'mod/questionnaire:downloadresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3143,1,1,'mod/questionnaire:downloadresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3153,1,3,'mod/questionnaire:deleteresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3163,1,1,'mod/questionnaire:deleteresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3173,1,3,'mod/questionnaire:manage',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3183,1,2,'mod/questionnaire:manage',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3193,1,1,'mod/questionnaire:manage',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3203,1,3,'mod/questionnaire:editquestions',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3213,1,2,'mod/questionnaire:editquestions',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3223,1,1,'mod/questionnaire:editquestions',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3233,1,2,'mod/questionnaire:createtemplates',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3243,1,1,'mod/questionnaire:createtemplates',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3253,1,2,'mod/questionnaire:createpublic',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3263,1,1,'mod/questionnaire:createpublic',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3273,1,3,'mod/questionnaire:copysurveys',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3283,1,2,'mod/questionnaire:copysurveys',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3293,1,1,'mod/questionnaire:copysurveys',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3303,1,1,'mod/questionnaire:readownresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3313,1,5,'mod/questionnaire:readownresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3323,1,1,'mod/questionnaire:readallresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3333,1,4,'mod/questionnaire:readallresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3343,1,3,'mod/questionnaire:readallresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3353,1,1,'mod/questionnaire:readallresponseanytime',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3363,1,4,'mod/questionnaire:readallresponseanytime',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3373,1,3,'mod/questionnaire:readallresponseanytime',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3383,1,1,'mod/questionnaire:printblank',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3393,1,2,'mod/questionnaire:printblank',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3403,1,4,'mod/questionnaire:printblank',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3413,1,3,'mod/questionnaire:printblank',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3423,1,5,'mod/questionnaire:printblank',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3433,1,5,'mod/quiz:reviewmyattempts',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3443,1,4,'mod/scorm:deleteresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3453,1,3,'mod/scorm:deleteresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3463,1,1,'mod/scorm:deleteresponses',1,1283907144,2);
INSERT INTO `mdl_role_capabilities` VALUES (3473,1,4,'mod/sloodle:staff',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3483,1,3,'mod/sloodle:staff',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3493,1,1,'mod/sloodle:staff',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3503,1,3,'mod/sloodle:objectauth',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3513,1,1,'mod/sloodle:objectauth',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3523,1,7,'mod/sloodle:userobjectauth',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3533,1,6,'mod/sloodle:userobjectauth',-1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3543,1,5,'mod/sloodle:userobjectauth',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3553,1,4,'mod/sloodle:userobjectauth',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3563,1,3,'mod/sloodle:userobjectauth',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3573,1,1,'mod/sloodle:userobjectauth',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3583,1,4,'mod/sloodle:uselayouts',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3593,1,3,'mod/sloodle:uselayouts',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3603,1,1,'mod/sloodle:uselayouts',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3613,1,3,'mod/sloodle:editlayouts',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3623,1,1,'mod/sloodle:editlayouts',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3633,1,7,'mod/sloodle:registeravatar',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3643,1,6,'mod/sloodle:registeravatar',-1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3653,1,5,'mod/sloodle:registeravatar',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3663,1,4,'mod/sloodle:registeravatar',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3673,1,3,'mod/sloodle:registeravatar',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3683,1,1,'mod/sloodle:registeravatar',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3693,1,6,'mod/sloodle:distributeself',-1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3703,1,5,'mod/sloodle:distributeself',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3713,1,4,'mod/sloodle:distributeself',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3723,1,3,'mod/sloodle:distributeself',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3733,1,1,'mod/sloodle:distributeself',1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3743,1,6,'mod/sloodle:distributeothers',-1,1283907150,2);
INSERT INTO `mdl_role_capabilities` VALUES (3753,1,3,'mod/sloodle:distributeothers',1,1283907151,2);
INSERT INTO `mdl_role_capabilities` VALUES (3763,1,1,'mod/sloodle:distributeothers',1,1283907151,2);
INSERT INTO `mdl_role_capabilities` VALUES (3773,1,7,'block/exabis_eportfolio:use',1,1283907222,2);
INSERT INTO `mdl_role_capabilities` VALUES (3783,1,7,'block/exabis_eportfolio:export',1,1283907222,2);
INSERT INTO `mdl_role_capabilities` VALUES (3793,1,7,'block/exabis_eportfolio:importfrommoodle',1,1283907222,2);
INSERT INTO `mdl_role_capabilities` VALUES (3803,1,7,'block/exabis_eportfolio:shareintern',1,1283907222,2);
INSERT INTO `mdl_role_capabilities` VALUES (3813,1,7,'block/exabis_eportfolio:shareextern',1,1283907222,2);
INSERT INTO `mdl_role_capabilities` VALUES (3823,1,7,'block/exabis_eportfolio:allowposts',1,1283907222,2);
INSERT INTO `mdl_role_capabilities` VALUES (3833,1,5,'block/ilp:view',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3843,1,4,'block/ilp:view',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3853,1,3,'block/ilp:view',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3863,1,1,'block/ilp:view',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3873,1,4,'block/ilp:viewclass',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3883,1,3,'block/ilp:viewclass',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3893,1,1,'block/ilp:viewclass',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3903,1,5,'block/ilp_student_info:view',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3913,1,4,'block/ilp_student_info:view',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3923,1,3,'block/ilp_student_info:view',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3933,1,1,'block/ilp_student_info:view',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3943,1,5,'block/ilp_student_info:editmine',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3953,1,4,'block/ilp_student_info:editmine',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3963,1,3,'block/ilp_student_info:editmine',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3973,1,1,'block/ilp_student_info:editmine',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3983,1,1,'block/ilp_student_info:editall',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (3993,1,4,'block/ilp_student_info:viewclass',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4003,1,3,'block/ilp_student_info:viewclass',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4013,1,1,'block/ilp_student_info:viewclass',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4023,1,7,'block/online_users:viewlist',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4033,1,6,'block/online_users:viewlist',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4043,1,5,'block/online_users:viewlist',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4053,1,4,'block/online_users:viewlist',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4063,1,3,'block/online_users:viewlist',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4073,1,1,'block/online_users:viewlist',1,1283907223,2);
INSERT INTO `mdl_role_capabilities` VALUES (4083,1,4,'gradeexport/ods:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4093,1,3,'gradeexport/ods:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4103,1,1,'gradeexport/ods:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4113,1,1,'gradeexport/ods:publish',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4123,1,4,'gradeexport/txt:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4133,1,3,'gradeexport/txt:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4143,1,1,'gradeexport/txt:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4153,1,1,'gradeexport/txt:publish',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4163,1,4,'gradeexport/xls:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4173,1,3,'gradeexport/xls:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4183,1,1,'gradeexport/xls:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4193,1,1,'gradeexport/xls:publish',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4203,1,4,'gradeexport/xml:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4213,1,3,'gradeexport/xml:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4223,1,1,'gradeexport/xml:view',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4233,1,1,'gradeexport/xml:publish',1,1283907234,2);
INSERT INTO `mdl_role_capabilities` VALUES (4243,1,3,'gradeimport/csv:view',1,1283907242,2);
INSERT INTO `mdl_role_capabilities` VALUES (4253,1,1,'gradeimport/csv:view',1,1283907242,2);
INSERT INTO `mdl_role_capabilities` VALUES (4263,1,3,'gradeimport/xml:view',1,1283907242,2);
INSERT INTO `mdl_role_capabilities` VALUES (4273,1,1,'gradeimport/xml:view',1,1283907242,2);
INSERT INTO `mdl_role_capabilities` VALUES (4283,1,1,'gradeimport/xml:publish',1,1283907242,2);
INSERT INTO `mdl_role_capabilities` VALUES (4293,1,4,'gradereport/grader:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4303,1,3,'gradereport/grader:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4313,1,1,'gradereport/grader:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4323,1,4,'gradereport/outcomes:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4333,1,3,'gradereport/outcomes:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4343,1,1,'gradereport/outcomes:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4353,1,5,'gradereport/overview:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4363,1,1,'gradereport/overview:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4373,1,5,'gradereport/user:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4383,1,4,'gradereport/user:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4393,1,3,'gradereport/user:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4403,1,1,'gradereport/user:view',1,1283907247,2);
INSERT INTO `mdl_role_capabilities` VALUES (4413,1,4,'coursereport/log:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4423,1,3,'coursereport/log:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4433,1,1,'coursereport/log:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4443,1,4,'coursereport/log:viewlive',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4453,1,3,'coursereport/log:viewlive',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4463,1,1,'coursereport/log:viewlive',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4473,1,4,'coursereport/log:viewtoday',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4483,1,3,'coursereport/log:viewtoday',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4493,1,1,'coursereport/log:viewtoday',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4503,1,4,'coursereport/outline:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4513,1,3,'coursereport/outline:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4523,1,1,'coursereport/outline:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4533,1,4,'coursereport/participation:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4543,1,3,'coursereport/participation:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4553,1,1,'coursereport/participation:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4563,1,4,'coursereport/stats:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4573,1,3,'coursereport/stats:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4583,1,1,'coursereport/stats:view',1,1283907251,2);
INSERT INTO `mdl_role_capabilities` VALUES (4593,1,4,'report/courseoverview:view',1,1283907257,2);
INSERT INTO `mdl_role_capabilities` VALUES (4603,1,3,'report/courseoverview:view',1,1283907257,2);
INSERT INTO `mdl_role_capabilities` VALUES (4613,1,1,'report/courseoverview:view',1,1283907257,2);
INSERT INTO `mdl_role_capabilities` VALUES (4623,1,1,'report/security:view',1,1283907257,2);
INSERT INTO `mdl_role_capabilities` VALUES (4633,1,1,'report/unittest:view',1,1283907257,2);
/*!40000 ALTER TABLE `mdl_role_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_names`
--

DROP TABLE IF EXISTS `mdl_role_names`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_role_names` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `contextid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='role names in native strings';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_role_names`
--

LOCK TABLES `mdl_role_names` WRITE;
/*!40000 ALTER TABLE `mdl_role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_sortorder`
--

DROP TABLE IF EXISTS `mdl_role_sortorder`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_role_sortorder` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_role_sortorder`
--

LOCK TABLES `mdl_role_sortorder` WRITE;
/*!40000 ALTER TABLE `mdl_role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_sortorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale`
--

DROP TABLE IF EXISTS `mdl_scale`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scale` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `scale` text NOT NULL,
  `description` text NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines grading scales';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scale`
--

LOCK TABLES `mdl_scale` WRITE;
/*!40000 ALTER TABLE `mdl_scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale_history`
--

DROP TABLE IF EXISTS `mdl_scale_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scale_history` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `action` bigint(10) unsigned NOT NULL default '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) default NULL,
  `timemodified` bigint(10) unsigned default NULL,
  `loggeduser` bigint(10) unsigned default NULL,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `scale` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scale_history`
--

LOCK TABLES `mdl_scale_history` WRITE;
/*!40000 ALTER TABLE `mdl_scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm`
--

DROP TABLE IF EXISTS `mdl_scorm`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `reference` varchar(255) NOT NULL default '',
  `summary` text NOT NULL,
  `version` varchar(9) NOT NULL default '',
  `maxgrade` double NOT NULL default '0',
  `grademethod` tinyint(2) NOT NULL default '0',
  `whatgrade` bigint(10) unsigned NOT NULL default '0',
  `maxattempt` bigint(10) NOT NULL default '1',
  `updatefreq` tinyint(1) unsigned NOT NULL default '0',
  `md5hash` varchar(32) NOT NULL default '',
  `launch` bigint(10) unsigned NOT NULL default '0',
  `skipview` tinyint(1) unsigned NOT NULL default '1',
  `hidebrowse` tinyint(1) NOT NULL default '0',
  `hidetoc` tinyint(1) NOT NULL default '0',
  `hidenav` tinyint(1) NOT NULL default '0',
  `auto` tinyint(1) unsigned NOT NULL default '0',
  `popup` tinyint(1) unsigned NOT NULL default '0',
  `options` varchar(255) NOT NULL default '',
  `width` bigint(10) unsigned NOT NULL default '100',
  `height` bigint(10) unsigned NOT NULL default '600',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm`
--

LOCK TABLES `mdl_scorm` WRITE;
/*!40000 ALTER TABLE `mdl_scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `scorm` bigint(10) unsigned NOT NULL default '0',
  `manifest` varchar(255) NOT NULL default '',
  `organization` varchar(255) NOT NULL default '',
  `parent` varchar(255) NOT NULL default '',
  `identifier` varchar(255) NOT NULL default '',
  `launch` varchar(255) NOT NULL default '',
  `scormtype` varchar(5) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_scoes`
--

LOCK TABLES `mdl_scorm_scoes` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_data`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `scoid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_scoes_data`
--

LOCK TABLES `mdl_scorm_scoes_data` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_track`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_track`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `scormid` bigint(10) NOT NULL default '0',
  `scoid` bigint(10) unsigned NOT NULL default '0',
  `attempt` bigint(10) unsigned NOT NULL default '1',
  `element` varchar(255) NOT NULL default '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to track SCOes';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_scoes_track`
--

LOCK TABLES `mdl_scorm_scoes_track` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_mapinfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `scoid` bigint(10) unsigned NOT NULL default '0',
  `objectiveid` bigint(10) unsigned NOT NULL default '0',
  `targetobjectiveid` bigint(10) unsigned NOT NULL default '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL default '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL default '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL default '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_seq_mapinfo`
--

LOCK TABLES `mdl_scorm_seq_mapinfo` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_objective`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_objective`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `scoid` bigint(10) unsigned NOT NULL default '0',
  `primaryobj` tinyint(1) NOT NULL default '0',
  `objectiveid` bigint(10) unsigned NOT NULL default '0',
  `satisfiedbymeasure` tinyint(1) NOT NULL default '1',
  `minnormalizedmeasure` float(11,4) unsigned NOT NULL default '0.0000',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_seq_objective`
--

LOCK TABLES `mdl_scorm_seq_objective` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `scoid` bigint(10) unsigned NOT NULL default '0',
  `childactivityset` varchar(15) NOT NULL default '',
  `minimumcount` bigint(10) unsigned NOT NULL default '0',
  `minimumpercent` float(11,4) unsigned NOT NULL default '0.0000',
  `conditioncombination` varchar(3) NOT NULL default 'all',
  `action` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_seq_rolluprule`
--

LOCK TABLES `mdl_scorm_seq_rolluprule` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprulecond`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `scoid` bigint(10) unsigned NOT NULL default '0',
  `rollupruleid` bigint(10) unsigned NOT NULL default '0',
  `operator` varchar(5) NOT NULL default 'noOp',
  `cond` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_seq_rolluprulecond`
--

LOCK TABLES `mdl_scorm_seq_rolluprulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rulecond`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `scoid` bigint(10) unsigned NOT NULL default '0',
  `ruleconditionsid` bigint(10) unsigned NOT NULL default '0',
  `refrencedobjective` varchar(255) NOT NULL default '',
  `measurethreshold` float(11,4) NOT NULL default '0.0000',
  `operator` varchar(5) NOT NULL default 'noOp',
  `cond` varchar(30) NOT NULL default 'always',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_seq_rulecond`
--

LOCK TABLES `mdl_scorm_seq_rulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_ruleconds`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `scoid` bigint(10) unsigned NOT NULL default '0',
  `conditioncombination` varchar(3) NOT NULL default 'all',
  `ruletype` tinyint(2) unsigned NOT NULL default '0',
  `action` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_scorm_seq_ruleconds`
--

LOCK TABLES `mdl_scorm_seq_ruleconds` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sessions2`
--

DROP TABLE IF EXISTS `mdl_sessions2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sessions2` (
  `sesskey` varchar(64) NOT NULL default '',
  `expiry` datetime NOT NULL,
  `expireref` varchar(250) default '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `sessdata` longtext,
  PRIMARY KEY  (`sesskey`),
  KEY `mdl_sess_exp_ix` (`expiry`),
  KEY `mdl_sess_exp2_ix` (`expireref`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Optional database session storage in new format, not used by';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sessions2`
--

LOCK TABLES `mdl_sessions2` WRITE;
/*!40000 ALTER TABLE `mdl_sessions2` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sessions2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_slideshow`
--

DROP TABLE IF EXISTS `mdl_slideshow`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_slideshow` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `location` text NOT NULL,
  `layout` bigint(10) unsigned NOT NULL default '0',
  `filename` bigint(10) unsigned NOT NULL default '0',
  `delaytime` bigint(10) unsigned NOT NULL default '7',
  `centred` bigint(10) unsigned NOT NULL default '0',
  `autobgcolor` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `htmlcaptions` bigint(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `mdl_slid_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines slideshow instance';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_slideshow`
--

LOCK TABLES `mdl_slideshow` WRITE;
/*!40000 ALTER TABLE `mdl_slideshow` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_slideshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_slideshow_captions`
--

DROP TABLE IF EXISTS `mdl_slideshow_captions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_slideshow_captions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `slideshow` bigint(10) unsigned NOT NULL default '0',
  `image` text NOT NULL,
  `title` text NOT NULL,
  `caption` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_slidcapt_sli_ix` (`slideshow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores slideshow captions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_slideshow_captions`
--

LOCK TABLES `mdl_slideshow_captions` WRITE;
/*!40000 ALTER TABLE `mdl_slideshow_captions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_slideshow_captions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle`
--

DROP TABLE IF EXISTS `mdl_sloodle`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `type` varchar(50) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `intro` mediumtext NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_sloo_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines instances of Sloodle modules.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle`
--

LOCK TABLES `mdl_sloodle` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_active_object`
--

DROP TABLE IF EXISTS `mdl_sloodle_active_object`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_active_object` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `controllerid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `uuid` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `type` varchar(50) NOT NULL default '',
  `timeupdated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_slooactiobje_uui_uix` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists objects which have been authorised to access specific ';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_active_object`
--

LOCK TABLES `mdl_sloodle_active_object` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_active_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_active_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_controller`
--

DROP TABLE IF EXISTS `mdl_sloodle_controller`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_controller` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `sloodleid` bigint(10) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `password` varchar(9) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_sloocont_slo_uix` (`sloodleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines instances of Sloodle controllers.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_controller`
--

LOCK TABLES `mdl_sloodle_controller` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_course`
--

DROP TABLE IF EXISTS `mdl_sloodle_course`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_course` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `autoreg` tinyint(1) unsigned NOT NULL default '0',
  `autoenrol` tinyint(1) unsigned NOT NULL default '0',
  `loginzonepos` varchar(255) default NULL,
  `loginzonesize` varchar(255) default NULL,
  `loginzoneregion` varchar(255) default NULL,
  `loginzoneupdated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_sloocour_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Sloodle data about each course';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_course`
--

LOCK TABLES `mdl_sloodle_course` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_distributor`
--

DROP TABLE IF EXISTS `mdl_sloodle_distributor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_distributor` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `sloodleid` bigint(10) unsigned NOT NULL default '0',
  `channel` varchar(36) NOT NULL default '',
  `timeupdated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines instances of Sloodle distributors.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_distributor`
--

LOCK TABLES `mdl_sloodle_distributor` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_distributor` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_distributor_entry`
--

DROP TABLE IF EXISTS `mdl_sloodle_distributor_entry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_distributor_entry` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `distributorid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines entries in Sloodle Distributors.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_distributor_entry`
--

LOCK TABLES `mdl_sloodle_distributor_entry` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_distributor_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_distributor_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_layout`
--

DROP TABLE IF EXISTS `mdl_sloodle_layout`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_layout` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `timeupdated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_sloolayo_counam_uix` (`course`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines classroom layout profiles';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_layout`
--

LOCK TABLES `mdl_sloodle_layout` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_layout_entry`
--

DROP TABLE IF EXISTS `mdl_sloodle_layout_entry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_layout_entry` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `layout` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `position` varchar(255) NOT NULL default '',
  `rotation` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_sloolayoentr_lay_ix` (`layout`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines an object entry in a classroom layout';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_layout_entry`
--

LOCK TABLES `mdl_sloodle_layout_entry` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_layout_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_layout_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_layout_entry_config`
--

DROP TABLE IF EXISTS `mdl_sloodle_layout_entry_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_layout_entry_config` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `layout_entry` bigint(10) unsigned default NULL,
  `name` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines configuration parameters for layout entries, providi';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_layout_entry_config`
--

LOCK TABLES `mdl_sloodle_layout_entry_config` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_layout_entry_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_layout_entry_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_login_notifications`
--

DROP TABLE IF EXISTS `mdl_sloodle_login_notifications`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_login_notifications` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `destination` varchar(255) NOT NULL default '',
  `avatar` varchar(255) NOT NULL default '',
  `username` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the details of auto-registration login details whic';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_login_notifications`
--

LOCK TABLES `mdl_sloodle_login_notifications` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_login_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_login_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_loginzone_allocation`
--

DROP TABLE IF EXISTS `mdl_sloodle_loginzone_allocation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_loginzone_allocation` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `position` varchar(255) NOT NULL default '',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_sloologiallo_use_uix` (`userid`),
  KEY `mdl_sloologiallo_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gives allocation of a loginzone for a given user';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_loginzone_allocation`
--

LOCK TABLES `mdl_sloodle_loginzone_allocation` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_loginzone_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_loginzone_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_object_config`
--

DROP TABLE IF EXISTS `mdl_sloodle_object_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_object_config` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `object` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_slooobjeconf_objnam_uix` (`object`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration settings for registered active objects';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_object_config`
--

LOCK TABLES `mdl_sloodle_object_config` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_object_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_object_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_pending_avatars`
--

DROP TABLE IF EXISTS `mdl_sloodle_pending_avatars`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_pending_avatars` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `uuid` varchar(255) NOT NULL default '',
  `avname` varchar(255) NOT NULL default '',
  `lst` varchar(255) NOT NULL default '',
  `timeupdated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_sloopendavat_uui_ix` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists avatars which are awaiting a link to a Moodle account';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_pending_avatars`
--

LOCK TABLES `mdl_sloodle_pending_avatars` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_pending_avatars` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_pending_avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_presenter`
--

DROP TABLE IF EXISTS `mdl_sloodle_presenter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_presenter` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `sloodleid` bigint(10) unsigned default NULL,
  `framewidth` smallint(4) unsigned default '512',
  `frameheight` smallint(4) unsigned default '512',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_sloopres_slo_uix` (`sloodleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record stores data about a Presenter instance.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_presenter`
--

LOCK TABLES `mdl_sloodle_presenter` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_presenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_presenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_presenter_entry`
--

DROP TABLE IF EXISTS `mdl_sloodle_presenter_entry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_presenter_entry` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `sloodleid` bigint(10) unsigned NOT NULL,
  `name` text,
  `source` mediumtext NOT NULL,
  `type` varchar(255) NOT NULL default 'web',
  `ordering` bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_sloopresentr_slo_ix` (`sloodleid`),
  KEY `mdl_sloopresentr_typ_ix` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sloodle_presenter_entry table retrofitted from MySQL';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_presenter_entry`
--

LOCK TABLES `mdl_sloodle_presenter_entry` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_presenter_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_presenter_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_user_object`
--

DROP TABLE IF EXISTS `mdl_sloodle_user_object`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_user_object` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `avuuid` varchar(255) NOT NULL default '',
  `objuuid` varchar(255) NOT NULL default '',
  `objname` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `authorised` tinyint(1) unsigned NOT NULL default '0',
  `timeupdated` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_sloouserobje_obj_uix` (`objuuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists user-centric objects which individual users have autho';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_user_object`
--

LOCK TABLES `mdl_sloodle_user_object` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_user_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_user_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sloodle_users`
--

DROP TABLE IF EXISTS `mdl_sloodle_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_sloodle_users` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL,
  `uuid` varchar(255) NOT NULL default '',
  `avname` varchar(255) NOT NULL default '',
  `lastactive` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_sloouser_uui_ix` (`uuid`),
  KEY `mdl_sloouser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associates Moodle user IDs with Second Life avatar UUIDs and';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_sloodle_users`
--

LOCK TABLES `mdl_sloodle_users` WRITE;
/*!40000 ALTER TABLE `mdl_sloodle_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_sloodle_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_daily`
--

DROP TABLE IF EXISTS `mdl_stats_daily`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_stats_daily` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `timeend` bigint(10) unsigned NOT NULL default '0',
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `stattype` enum('enrolments','activity','logins') NOT NULL default 'activity',
  `stat1` bigint(10) unsigned NOT NULL default '0',
  `stat2` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_stats_daily`
--

LOCK TABLES `mdl_stats_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_monthly`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_stats_monthly` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `timeend` bigint(10) unsigned NOT NULL default '0',
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `stattype` enum('enrolments','activity','logins') NOT NULL default 'activity',
  `stat1` bigint(10) unsigned NOT NULL default '0',
  `stat2` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_stats_monthly`
--

LOCK TABLES `mdl_stats_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_daily`
--

DROP TABLE IF EXISTS `mdl_stats_user_daily`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `timeend` bigint(10) unsigned NOT NULL default '0',
  `statsreads` bigint(10) unsigned NOT NULL default '0',
  `statswrites` bigint(10) unsigned NOT NULL default '0',
  `stattype` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_stats_user_daily`
--

LOCK TABLES `mdl_stats_user_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_user_monthly`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `timeend` bigint(10) unsigned NOT NULL default '0',
  `statsreads` bigint(10) unsigned NOT NULL default '0',
  `statswrites` bigint(10) unsigned NOT NULL default '0',
  `stattype` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_stats_user_monthly`
--

LOCK TABLES `mdl_stats_user_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_user_weekly`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `timeend` bigint(10) unsigned NOT NULL default '0',
  `statsreads` bigint(10) unsigned NOT NULL default '0',
  `statswrites` bigint(10) unsigned NOT NULL default '0',
  `stattype` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_stats_user_weekly`
--

LOCK TABLES `mdl_stats_user_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_weekly`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_stats_weekly` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `timeend` bigint(10) unsigned NOT NULL default '0',
  `roleid` bigint(10) unsigned NOT NULL default '0',
  `stattype` enum('enrolments','activity','logins') NOT NULL default 'activity',
  `stat1` bigint(10) unsigned NOT NULL default '0',
  `stat2` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_stats_weekly`
--

LOCK TABLES `mdl_stats_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey`
--

DROP TABLE IF EXISTS `mdl_survey`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_survey` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `template` bigint(10) unsigned NOT NULL default '0',
  `days` mediumint(6) NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` text NOT NULL,
  `questions` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_survey`
--

LOCK TABLES `mdl_survey` WRITE;
/*!40000 ALTER TABLE `mdl_survey` DISABLE KEYS */;
INSERT INTO `mdl_survey` VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro','25,26,27,28,29,30,43,44');
INSERT INTO `mdl_survey` VALUES (2,0,0,0,985017600,985017600,'collespname','collespintro','31,32,33,34,35,36,43,44');
INSERT INTO `mdl_survey` VALUES (3,0,0,0,985017600,985017600,'collesapname','collesapintro','37,38,39,40,41,42,43,44');
INSERT INTO `mdl_survey` VALUES (4,0,0,0,985017600,985017600,'attlsname','attlsintro','65,67,68');
INSERT INTO `mdl_survey` VALUES (5,0,0,0,985017600,985017600,'ciqname','ciqintro','69,70,71,72,73');
/*!40000 ALTER TABLE `mdl_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_analysis`
--

DROP TABLE IF EXISTS `mdl_survey_analysis`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_survey_analysis` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `survey` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='text about each survey submission';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_survey_analysis`
--

LOCK TABLES `mdl_survey_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_answers`
--

DROP TABLE IF EXISTS `mdl_survey_answers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_survey_answers` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `survey` bigint(10) unsigned NOT NULL default '0',
  `question` bigint(10) unsigned NOT NULL default '0',
  `time` bigint(10) unsigned NOT NULL default '0',
  `answer1` text NOT NULL,
  `answer2` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_survey_answers`
--

LOCK TABLES `mdl_survey_answers` WRITE;
/*!40000 ALTER TABLE `mdl_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_questions`
--

DROP TABLE IF EXISTS `mdl_survey_questions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_survey_questions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `text` varchar(255) NOT NULL default '',
  `shorttext` varchar(30) NOT NULL default '',
  `multi` varchar(100) NOT NULL default '',
  `intro` varchar(50) NOT NULL default '',
  `type` smallint(3) NOT NULL default '0',
  `options` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_survey_questions`
--

LOCK TABLES `mdl_survey_questions` WRITE;
/*!40000 ALTER TABLE `mdl_survey_questions` DISABLE KEYS */;
INSERT INTO `mdl_survey_questions` VALUES (1,'colles1','colles1short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (2,'colles2','colles2short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (3,'colles3','colles3short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (4,'colles4','colles4short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (5,'colles5','colles5short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (6,'colles6','colles6short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (7,'colles7','colles7short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (8,'colles8','colles8short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (9,'colles9','colles9short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (10,'colles10','colles10short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (11,'colles11','colles11short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (12,'colles12','colles12short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (13,'colles13','colles13short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (14,'colles14','colles14short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (15,'colles15','colles15short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (16,'colles16','colles16short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (17,'colles17','colles17short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (18,'colles18','colles18short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (19,'colles19','colles19short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (20,'colles20','colles20short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (21,'colles21','colles21short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (22,'colles22','colles22short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (23,'colles23','colles23short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (24,'colles24','colles24short','','',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5');
INSERT INTO `mdl_survey_questions` VALUES (43,'howlong','','','',1,'howlongoptions');
INSERT INTO `mdl_survey_questions` VALUES (44,'othercomments','','','',0,NULL);
INSERT INTO `mdl_survey_questions` VALUES (45,'attls1','attls1short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (46,'attls2','attls2short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (47,'attls3','attls3short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (48,'attls4','attls4short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (49,'attls5','attls5short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (50,'attls6','attls6short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (51,'attls7','attls7short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (52,'attls8','attls8short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (53,'attls9','attls9short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (54,'attls10','attls10short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (55,'attls11','attls11short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (56,'attls12','attls12short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (57,'attls13','attls13short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (58,'attls14','attls14short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (59,'attls15','attls15short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (60,'attls16','attls16short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (61,'attls17','attls17short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (62,'attls18','attls18short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (63,'attls19','attls19short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (64,'attls20','attls20short','','',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (66,'-','-','-','-',0,'-');
INSERT INTO `mdl_survey_questions` VALUES (67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5');
INSERT INTO `mdl_survey_questions` VALUES (69,'ciq1','ciq1short','','',0,NULL);
INSERT INTO `mdl_survey_questions` VALUES (70,'ciq2','ciq2short','','',0,NULL);
INSERT INTO `mdl_survey_questions` VALUES (71,'ciq3','ciq3short','','',0,NULL);
INSERT INTO `mdl_survey_questions` VALUES (72,'ciq4','ciq4short','','',0,NULL);
INSERT INTO `mdl_survey_questions` VALUES (73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE `mdl_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_swf`
--

DROP TABLE IF EXISTS `mdl_swf`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_swf` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `intro` mediumtext,
  `introformat` smallint(4) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `swfurl` varchar(255) default NULL,
  `width` smallint(4) unsigned default '900',
  `height` smallint(4) unsigned NOT NULL default '480',
  `version` varchar(20) NOT NULL default '9.0.0',
  `interaction` bigint(11) unsigned default NULL,
  `xmlurl` varchar(255) default NULL,
  `apikey` mediumtext,
  `play` varchar(5) NOT NULL default 'true',
  `loopswf` varchar(5) NOT NULL default 'true',
  `menu` varchar(5) NOT NULL default 'true',
  `quality` varchar(20) NOT NULL default 'best',
  `scale` varchar(30) NOT NULL default 'noscale',
  `salign` varchar(2) NOT NULL default 'tl',
  `wmode` varchar(50) NOT NULL default 'opaque',
  `bgcolor` varchar(6) NOT NULL default 'FFFFFF',
  `devicefont` varchar(5) NOT NULL default 'true',
  `seamlesstabbing` varchar(5) NOT NULL default 'true',
  `allowfullscreen` varchar(5) NOT NULL default 'false',
  `allowscriptaccess` varchar(20) NOT NULL default 'sameDomain',
  `allownetworking` varchar(20) NOT NULL default 'all',
  `align` varchar(10) NOT NULL default 'middle',
  `flashvar1` longtext,
  `flashvar2` longtext,
  `flashvar3` longtext,
  PRIMARY KEY  (`id`),
  KEY `mdl_swf_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of SWF activity module';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_swf`
--

LOCK TABLES `mdl_swf` WRITE;
/*!40000 ALTER TABLE `mdl_swf` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_swf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag`
--

DROP TABLE IF EXISTS `mdl_tag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_tag` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `rawname` varchar(255) NOT NULL default '',
  `tagtype` varchar(255) default NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL default '0',
  `flag` smallint(4) unsigned default '0',
  `timemodified` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_tag`
--

LOCK TABLES `mdl_tag` WRITE;
/*!40000 ALTER TABLE `mdl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_correlation`
--

DROP TABLE IF EXISTS `mdl_tag_correlation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_tag_correlation` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `tagid` bigint(10) unsigned NOT NULL,
  `correlatedtags` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_tag_correlation`
--

LOCK TABLES `mdl_tag_correlation` WRITE;
/*!40000 ALTER TABLE `mdl_tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_instance`
--

DROP TABLE IF EXISTS `mdl_tag_instance`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_tag_instance` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `tagid` bigint(10) unsigned NOT NULL,
  `itemtype` varchar(255) NOT NULL default '',
  `itemid` bigint(10) unsigned NOT NULL,
  `ordering` bigint(10) unsigned default NULL,
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_taginst_iteitetag_uix` (`itemtype`,`itemid`,`tagid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_tag_instance`
--

LOCK TABLES `mdl_tag_instance` WRITE;
/*!40000 ALTER TABLE `mdl_tag_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_timezone`
--

DROP TABLE IF EXISTS `mdl_timezone`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_timezone` (
  `id` bigint(10) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `year` bigint(11) NOT NULL default '0',
  `tzrule` varchar(20) NOT NULL default '',
  `gmtoff` bigint(11) NOT NULL default '0',
  `dstoff` bigint(11) NOT NULL default '0',
  `dst_month` tinyint(2) NOT NULL default '0',
  `dst_startday` smallint(3) NOT NULL default '0',
  `dst_weekday` smallint(3) NOT NULL default '0',
  `dst_skipweeks` smallint(3) NOT NULL default '0',
  `dst_time` varchar(6) NOT NULL default '00:00',
  `std_month` tinyint(2) NOT NULL default '0',
  `std_startday` smallint(3) NOT NULL default '0',
  `std_weekday` smallint(3) NOT NULL default '0',
  `std_skipweeks` smallint(3) NOT NULL default '0',
  `std_time` varchar(6) NOT NULL default '00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_timezone`
--

LOCK TABLES `mdl_timezone` WRITE;
/*!40000 ALTER TABLE `mdl_timezone` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user`
--

DROP TABLE IF EXISTS `mdl_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_user` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `auth` varchar(20) NOT NULL default 'manual',
  `confirmed` tinyint(1) NOT NULL default '0',
  `policyagreed` tinyint(1) NOT NULL default '0',
  `deleted` tinyint(1) NOT NULL default '0',
  `mnethostid` bigint(10) NOT NULL default '0',
  `username` varchar(100) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `idnumber` varchar(255) NOT NULL default '',
  `firstname` varchar(100) NOT NULL default '',
  `lastname` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `emailstop` tinyint(1) unsigned NOT NULL default '0',
  `icq` varchar(15) NOT NULL default '',
  `skype` varchar(50) NOT NULL default '',
  `yahoo` varchar(50) NOT NULL default '',
  `aim` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `phone1` varchar(20) NOT NULL default '',
  `phone2` varchar(20) NOT NULL default '',
  `institution` varchar(40) NOT NULL default '',
  `department` varchar(30) NOT NULL default '',
  `address` varchar(70) NOT NULL default '',
  `city` varchar(20) NOT NULL default '',
  `country` varchar(2) NOT NULL default '',
  `lang` varchar(30) NOT NULL default 'en_utf8',
  `theme` varchar(50) NOT NULL default '',
  `timezone` varchar(100) NOT NULL default '99',
  `firstaccess` bigint(10) unsigned NOT NULL default '0',
  `lastaccess` bigint(10) unsigned NOT NULL default '0',
  `lastlogin` bigint(10) unsigned NOT NULL default '0',
  `currentlogin` bigint(10) unsigned NOT NULL default '0',
  `lastip` varchar(15) NOT NULL default '',
  `secret` varchar(15) NOT NULL default '',
  `picture` tinyint(1) NOT NULL default '0',
  `url` varchar(255) NOT NULL default '',
  `description` text,
  `mailformat` tinyint(1) unsigned NOT NULL default '1',
  `maildigest` tinyint(1) unsigned NOT NULL default '0',
  `maildisplay` tinyint(2) unsigned NOT NULL default '2',
  `htmleditor` tinyint(1) unsigned NOT NULL default '1',
  `ajax` tinyint(1) unsigned NOT NULL default '1',
  `autosubscribe` tinyint(1) unsigned NOT NULL default '1',
  `trackforums` tinyint(1) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `trustbitmask` bigint(10) unsigned NOT NULL default '0',
  `imagealt` varchar(255) default NULL,
  `screenreader` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='One record for each person';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_user`
--

LOCK TABLES `mdl_user` WRITE;
/*!40000 ALTER TABLE `mdl_user` DISABLE KEYS */;
INSERT INTO `mdl_user` VALUES (1,'manual',1,0,0,3,'guest','084e0343a0486ff05530df6c705c8bb4','','Guest User',' ','root@localhost',0,'','','','','','','','','','','','','en_utf8','','99',0,0,0,0,'','',0,'','This user is a special user that allows read-only access to some courses.',1,0,2,1,1,1,0,1201718665,0,NULL,0);
INSERT INTO `mdl_user` VALUES (2,'manual',1,0,0,3,'admin','0a4d5d43318e442bdee7f3a447e04281','','ORVSD','Admin','webmaster@orvsd.org',0,'','','','','','','','','','','Corvallis','US','en_utf8','','99',1201718788,1283907625,1283907056,1283907573,'140.211.18.56','',1,'','',1,0,1,1,1,1,0,1201718788,0,'',0);
/*!40000 ALTER TABLE `mdl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_category`
--

DROP TABLE IF EXISTS `mdl_user_info_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_user_info_category` (
  `id` bigint(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `sortorder` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_user_info_category`
--

LOCK TABLES `mdl_user_info_category` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_data`
--

DROP TABLE IF EXISTS `mdl_user_info_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_user_info_data` (
  `id` bigint(10) NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `fieldid` bigint(10) unsigned NOT NULL default '0',
  `data` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_user_info_data`
--

LOCK TABLES `mdl_user_info_data` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_field`
--

DROP TABLE IF EXISTS `mdl_user_info_field`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_user_info_field` (
  `id` bigint(10) NOT NULL auto_increment,
  `shortname` varchar(255) NOT NULL default 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL default '',
  `description` longtext,
  `categoryid` bigint(10) unsigned NOT NULL default '0',
  `sortorder` bigint(10) unsigned NOT NULL default '0',
  `required` tinyint(2) unsigned NOT NULL default '0',
  `locked` tinyint(2) unsigned NOT NULL default '0',
  `visible` smallint(4) unsigned NOT NULL default '0',
  `forceunique` tinyint(2) unsigned NOT NULL default '0',
  `signup` tinyint(2) unsigned NOT NULL default '0',
  `defaultdata` longtext,
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_user_info_field`
--

LOCK TABLES `mdl_user_info_field` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_lastaccess`
--

DROP TABLE IF EXISTS `mdl_user_lastaccess`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `courseid` bigint(10) unsigned NOT NULL default '0',
  `timeaccess` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_user_lastaccess`
--

LOCK TABLES `mdl_user_lastaccess` WRITE;
/*!40000 ALTER TABLE `mdl_user_lastaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_preferences`
--

DROP TABLE IF EXISTS `mdl_user_preferences`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_user_preferences` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `userid` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_user_preferences`
--

LOCK TABLES `mdl_user_preferences` WRITE;
/*!40000 ALTER TABLE `mdl_user_preferences` DISABLE KEYS */;
INSERT INTO `mdl_user_preferences` VALUES (2,2,'email_bounce_count','1');
INSERT INTO `mdl_user_preferences` VALUES (3,2,'email_send_count','4');
/*!40000 ALTER TABLE `mdl_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_private_key`
--

DROP TABLE IF EXISTS `mdl_user_private_key`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_user_private_key` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `script` varchar(128) NOT NULL default '',
  `value` varchar(128) NOT NULL default '',
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) unsigned default NULL,
  `iprestriction` varchar(255) default NULL,
  `validuntil` bigint(10) unsigned default NULL,
  `timecreated` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_user_private_key`
--

LOCK TABLES `mdl_user_private_key` WRITE;
/*!40000 ALTER TABLE `mdl_user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_private_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_webdav_locks`
--

DROP TABLE IF EXISTS `mdl_webdav_locks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_webdav_locks` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `token` varchar(255) NOT NULL default '',
  `path` varchar(255) NOT NULL default '',
  `expiry` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `recursive` tinyint(1) unsigned NOT NULL default '0',
  `exclusivelock` tinyint(1) unsigned NOT NULL default '0',
  `created` bigint(10) unsigned NOT NULL default '0',
  `modified` bigint(10) unsigned NOT NULL default '0',
  `owner` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_webdav_locks`
--

LOCK TABLES `mdl_webdav_locks` WRITE;
/*!40000 ALTER TABLE `mdl_webdav_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_webdav_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki`
--

DROP TABLE IF EXISTS `mdl_wiki`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_wiki` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `summary` text NOT NULL,
  `pagename` varchar(255) NOT NULL default '',
  `wtype` enum('teacher','group','student') NOT NULL default 'group',
  `ewikiprinttitle` smallint(4) unsigned NOT NULL default '1',
  `htmlmode` smallint(4) unsigned NOT NULL default '0',
  `ewikiacceptbinary` smallint(4) unsigned NOT NULL default '0',
  `disablecamelcase` smallint(4) unsigned NOT NULL default '0',
  `setpageflags` smallint(4) unsigned NOT NULL default '1',
  `strippages` smallint(4) unsigned NOT NULL default '1',
  `removepages` smallint(4) unsigned NOT NULL default '1',
  `revertchanges` smallint(4) unsigned NOT NULL default '1',
  `initialcontent` varchar(255) NOT NULL default '',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Main wik table';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_wiki`
--

LOCK TABLES `mdl_wiki` WRITE;
/*!40000 ALTER TABLE `mdl_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_entries`
--

DROP TABLE IF EXISTS `mdl_wiki_entries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_wiki_entries` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `wikiid` bigint(10) unsigned NOT NULL default '0',
  `course` bigint(10) unsigned NOT NULL default '0',
  `groupid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `pagename` varchar(255) NOT NULL default '',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_wikientr_cou_ix` (`course`),
  KEY `mdl_wikientr_gro_ix` (`groupid`),
  KEY `mdl_wikientr_use_ix` (`userid`),
  KEY `mdl_wikientr_pag_ix` (`pagename`),
  KEY `mdl_wikientr_wik_ix` (`wikiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds entries for each wiki start instance';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_wiki_entries`
--

LOCK TABLES `mdl_wiki_entries` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_locks`
--

DROP TABLE IF EXISTS `mdl_wiki_locks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_wiki_locks` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `wikiid` bigint(10) unsigned NOT NULL,
  `pagename` varchar(160) NOT NULL default '',
  `lockedby` bigint(10) unsigned NOT NULL default '0',
  `lockedsince` bigint(10) unsigned NOT NULL default '0',
  `lockedseen` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_wikilock_wikpag_uix` (`wikiid`,`pagename`),
  KEY `mdl_wikilock_loc_ix` (`lockedseen`),
  KEY `mdl_wikilock_wik_ix` (`wikiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores editing locks on Wiki pages';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_wiki_locks`
--

LOCK TABLES `mdl_wiki_locks` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_pages`
--

DROP TABLE IF EXISTS `mdl_wiki_pages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_wiki_pages` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `pagename` varchar(160) NOT NULL default '',
  `version` bigint(10) unsigned NOT NULL default '0',
  `flags` bigint(10) unsigned default '0',
  `content` mediumtext,
  `author` varchar(100) default 'ewiki',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `created` bigint(10) unsigned default '0',
  `lastmodified` bigint(10) unsigned default '0',
  `refs` mediumtext,
  `meta` mediumtext,
  `hits` bigint(10) unsigned default '0',
  `wiki` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mdl_wikipage_pagverwik_uix` (`pagename`,`version`,`wiki`),
  KEY `mdl_wikipage_wik_ix` (`wiki`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds the Wiki-Pages';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_wiki_pages`
--

LOCK TABLES `mdl_wiki_pages` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop`
--

DROP TABLE IF EXISTS `mdl_workshop`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_workshop` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `course` bigint(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `wtype` smallint(3) unsigned NOT NULL default '0',
  `nelements` smallint(3) unsigned NOT NULL default '1',
  `nattachments` smallint(3) unsigned NOT NULL default '0',
  `phase` tinyint(2) unsigned NOT NULL default '0',
  `format` tinyint(2) unsigned NOT NULL default '0',
  `gradingstrategy` tinyint(2) unsigned NOT NULL default '1',
  `resubmit` tinyint(2) unsigned NOT NULL default '0',
  `agreeassessments` tinyint(2) unsigned NOT NULL default '0',
  `hidegrades` tinyint(2) unsigned NOT NULL default '0',
  `anonymous` tinyint(2) unsigned NOT NULL default '0',
  `includeself` tinyint(2) unsigned NOT NULL default '0',
  `maxbytes` bigint(10) unsigned NOT NULL default '100000',
  `submissionstart` bigint(10) unsigned NOT NULL default '0',
  `assessmentstart` bigint(10) unsigned NOT NULL default '0',
  `submissionend` bigint(10) unsigned NOT NULL default '0',
  `assessmentend` bigint(10) unsigned NOT NULL default '0',
  `releasegrades` bigint(10) unsigned NOT NULL default '0',
  `grade` smallint(3) NOT NULL default '0',
  `gradinggrade` smallint(3) NOT NULL default '0',
  `ntassessments` smallint(3) unsigned NOT NULL default '0',
  `assessmentcomps` smallint(3) unsigned NOT NULL default '2',
  `nsassessments` smallint(3) unsigned NOT NULL default '0',
  `overallocation` smallint(3) unsigned NOT NULL default '0',
  `timemodified` bigint(10) unsigned NOT NULL default '0',
  `teacherweight` smallint(3) unsigned NOT NULL default '1',
  `showleaguetable` smallint(3) unsigned NOT NULL default '0',
  `usepassword` smallint(3) unsigned NOT NULL default '0',
  `password` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines workshop';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_workshop`
--

LOCK TABLES `mdl_workshop` WRITE;
/*!40000 ALTER TABLE `mdl_workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `workshopid` bigint(10) unsigned NOT NULL default '0',
  `submissionid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `timegraded` bigint(10) unsigned NOT NULL default '0',
  `timeagreed` bigint(10) unsigned NOT NULL default '0',
  `grade` double NOT NULL default '0',
  `gradinggrade` smallint(3) NOT NULL default '0',
  `teachergraded` smallint(3) unsigned NOT NULL default '0',
  `mailed` smallint(3) unsigned NOT NULL default '0',
  `resubmission` smallint(3) unsigned NOT NULL default '0',
  `donotuse` smallint(3) unsigned NOT NULL default '0',
  `generalcomment` text NOT NULL,
  `teachercomment` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_workasse_use_ix` (`userid`),
  KEY `mdl_workasse_mai_ix` (`mailed`),
  KEY `mdl_workasse_wor_ix` (`workshopid`),
  KEY `mdl_workasse_sub_ix` (`submissionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about assessments by teacher and students';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_workshop_assessments`
--

LOCK TABLES `mdl_workshop_assessments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_comments`
--

DROP TABLE IF EXISTS `mdl_workshop_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_workshop_comments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `workshopid` bigint(10) unsigned NOT NULL default '0',
  `assessmentid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `mailed` tinyint(2) unsigned NOT NULL default '0',
  `comments` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_workcomm_use_ix` (`userid`),
  KEY `mdl_workcomm_mai_ix` (`mailed`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`),
  KEY `mdl_workcomm_ass_ix` (`assessmentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines comments';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_workshop_comments`
--

LOCK TABLES `mdl_workshop_comments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_elements`
--

DROP TABLE IF EXISTS `mdl_workshop_elements`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_workshop_elements` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `workshopid` bigint(10) unsigned NOT NULL default '0',
  `elementno` smallint(3) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `scale` smallint(3) unsigned NOT NULL default '0',
  `maxscore` smallint(3) unsigned NOT NULL default '1',
  `weight` smallint(3) unsigned NOT NULL default '11',
  `stddev` double NOT NULL default '0',
  `totalassessments` bigint(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_workelem_wor_ix` (`workshopid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about marking scheme of assignment';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_workshop_elements`
--

LOCK TABLES `mdl_workshop_elements` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades`
--

DROP TABLE IF EXISTS `mdl_workshop_grades`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_workshop_grades` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `workshopid` bigint(10) unsigned NOT NULL default '0',
  `assessmentid` bigint(10) unsigned NOT NULL default '0',
  `elementno` bigint(10) unsigned NOT NULL default '0',
  `feedback` text NOT NULL,
  `grade` smallint(3) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_workgrad_wor_ix` (`workshopid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about individual grades given to each element';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_workshop_grades`
--

LOCK TABLES `mdl_workshop_grades` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_rubrics`
--

DROP TABLE IF EXISTS `mdl_workshop_rubrics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_workshop_rubrics` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `workshopid` bigint(10) unsigned NOT NULL default '0',
  `elementno` bigint(10) unsigned NOT NULL default '0',
  `rubricno` smallint(3) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about the rubrics marking scheme';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_workshop_rubrics`
--

LOCK TABLES `mdl_workshop_rubrics` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_rubrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_rubrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_stockcomments`
--

DROP TABLE IF EXISTS `mdl_workshop_stockcomments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_workshop_stockcomments` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `workshopid` bigint(10) unsigned NOT NULL default '0',
  `elementno` bigint(10) unsigned NOT NULL default '0',
  `comments` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mdl_workstoc_wor_ix` (`workshopid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about the teacher comment bank';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_workshop_stockcomments`
--

LOCK TABLES `mdl_workshop_stockcomments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint(10) unsigned NOT NULL auto_increment,
  `workshopid` bigint(10) unsigned NOT NULL default '0',
  `userid` bigint(10) unsigned NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `timecreated` bigint(10) unsigned NOT NULL default '0',
  `mailed` tinyint(2) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `gradinggrade` smallint(3) unsigned NOT NULL default '0',
  `finalgrade` smallint(3) unsigned NOT NULL default '0',
  `late` smallint(3) unsigned NOT NULL default '0',
  `nassessments` bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mdl_worksubm_use_ix` (`userid`),
  KEY `mdl_worksubm_mai_ix` (`mailed`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about submitted work from teacher and students';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mdl_workshop_submissions`
--

LOCK TABLES `mdl_workshop_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-08  1:01:11
