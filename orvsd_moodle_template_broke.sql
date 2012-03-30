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
DROP TABLE IF EXISTS 'adodb_logsql';
CREATE TABLE 'adodb_logsql' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'created' datetime NOT NULL,
  'sql0' varchar(250) NOT NULL default '',
  'sql1' text,
  'params' text,
  'tracer' text,
  'timer' decimal(16,6) NOT NULL default '0.000000',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to save some logs from ADOdb';
LOCK TABLES 'adodb_logsql' WRITE;
/*!40000 ALTER TABLE 'adodb_logsql' DISABLE KEYS */;
/*!40000 ALTER TABLE 'adodb_logsql' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_assignment';
CREATE TABLE 'mdl_assignment' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'description' text NOT NULL,
  'format' smallint(4) unsigned NOT NULL default '0',
  'assignmenttype' varchar(50) NOT NULL default '',
  'resubmit' tinyint(2) unsigned NOT NULL default '0',
  'preventlate' tinyint(2) unsigned NOT NULL default '0',
  'emailteachers' tinyint(2) unsigned NOT NULL default '0',
  'var1' bigint(10) default '0',
  'var2' bigint(10) default '0',
  'var3' bigint(10) default '0',
  'var4' bigint(10) default '0',
  'var5' bigint(10) default '0',
  'maxbytes' bigint(10) unsigned NOT NULL default '100000',
  'timedue' bigint(10) unsigned NOT NULL default '0',
  'timeavailable' bigint(10) unsigned NOT NULL default '0',
  'grade' bigint(10) NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_assi_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines assignments';
LOCK TABLES 'mdl_assignment' WRITE;
/*!40000 ALTER TABLE 'mdl_assignment' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_assignment' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_assignment_submissions';
CREATE TABLE 'mdl_assignment_submissions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'assignment' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'numfiles' bigint(10) unsigned NOT NULL default '0',
  'data1' text NOT NULL,
  'data2' text NOT NULL,
  'grade' bigint(11) NOT NULL default '0',
  'submissioncomment' text NOT NULL,
  'format' smallint(4) unsigned NOT NULL default '0',
  'teacher' bigint(10) unsigned NOT NULL default '0',
  'timemarked' bigint(10) unsigned NOT NULL default '0',
  'mailed' tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_assisubm_use_ix' ('userid'),
  KEY 'mdl_assisubm_mai_ix' ('mailed'),
  KEY 'mdl_assisubm_tim_ix' ('timemarked'),
  KEY 'mdl_assisubm_ass_ix' ('assignment')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments';
LOCK TABLES 'mdl_assignment_submissions' WRITE;
/*!40000 ALTER TABLE 'mdl_assignment_submissions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_assignment_submissions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_backup_config';
CREATE TABLE 'mdl_backup_config' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  'value' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_backconf_nam_uix' ('name')
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='To store backup configuration variables';
LOCK TABLES 'mdl_backup_config' WRITE;
/*!40000 ALTER TABLE 'mdl_backup_config' DISABLE KEYS */;
INSERT INTO 'mdl_backup_config' VALUES (1,'backup_sche_modules','0'),(2,'backup_sche_withuserdata','0'),(3,'backup_sche_metacourse','0'),(4,'backup_sche_users','0'),(5,'backup_sche_logs','0'),(6,'backup_sche_userfiles','0'),(7,'backup_sche_coursefiles','0'),(8,'backup_sche_messages','0'),(9,'backup_sche_keep','1'),(10,'backup_sche_active','0'),(11,'backup_sche_weekdays','0000000'),(12,'backup_sche_hour','0'),(13,'backup_sche_minute','0'),(14,'backup_sche_destination','');
/*!40000 ALTER TABLE 'mdl_backup_config' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_backup_courses';
CREATE TABLE 'mdl_backup_courses' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'laststarttime' bigint(10) unsigned NOT NULL default '0',
  'lastendtime' bigint(10) unsigned NOT NULL default '0',
  'laststatus' varchar(1) NOT NULL default '0',
  'nextstarttime' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_backcour_cou_uix' ('courseid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store every course backup status';
LOCK TABLES 'mdl_backup_courses' WRITE;
/*!40000 ALTER TABLE 'mdl_backup_courses' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_backup_courses' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_backup_files';
CREATE TABLE 'mdl_backup_files' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'backup_code' bigint(10) unsigned NOT NULL default '0',
  'file_type' varchar(10) NOT NULL default '',
  'path' varchar(255) NOT NULL default '',
  'old_id' bigint(10) unsigned NOT NULL default '0',
  'new_id' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_backfile_bacfilpat_uix' ('backup_code','file_type','path')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store and recode ids to user and course files';
LOCK TABLES 'mdl_backup_files' WRITE;
/*!40000 ALTER TABLE 'mdl_backup_files' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_backup_files' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_backup_ids';
CREATE TABLE 'mdl_backup_ids' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'backup_code' bigint(12) unsigned NOT NULL default '0',
  'table_name' varchar(30) NOT NULL default '',
  'old_id' bigint(10) unsigned NOT NULL default '0',
  'new_id' bigint(10) unsigned NOT NULL default '0',
  'info' mediumtext NOT NULL,
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_backids_bactabold_uix' ('backup_code','table_name','old_id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store and convert ids in backup/restore';
LOCK TABLES 'mdl_backup_ids' WRITE;
/*!40000 ALTER TABLE 'mdl_backup_ids' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_backup_ids' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_backup_log';
CREATE TABLE 'mdl_backup_log' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'time' bigint(10) unsigned NOT NULL default '0',
  'laststarttime' bigint(10) unsigned NOT NULL default '0',
  'info' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_backlog_cou_ix' ('courseid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store every course backup log info';
LOCK TABLES 'mdl_backup_log' WRITE;
/*!40000 ALTER TABLE 'mdl_backup_log' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_backup_log' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_block';
CREATE TABLE 'mdl_block' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(40) NOT NULL default '',
  'version' bigint(10) unsigned NOT NULL default '0',
  'cron' bigint(10) unsigned NOT NULL default '0',
  'lastcron' bigint(10) unsigned NOT NULL default '0',
  'visible' tinyint(1) NOT NULL default '1',
  'multiple' tinyint(1) NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='to store installed blocks';
LOCK TABLES 'mdl_block' WRITE;
/*!40000 ALTER TABLE 'mdl_block' DISABLE KEYS */;
INSERT INTO 'mdl_block' VALUES (1,'activity_modules',2006011300,0,0,1,0),(2,'admin',2004081200,0,0,1,0),(3,'admin_bookmarks',2006090300,0,0,1,0),(4,'admin_tree',2006090300,0,0,1,0),(5,'blog_menu',2004112000,0,0,1,0),(6,'blog_tags',2006032000,0,0,1,1),(7,'calendar_month',2004081200,0,0,1,0),(8,'calendar_upcoming',2004052600,0,0,1,0),(9,'course_list',2004111600,0,0,1,0),(10,'course_summary',2004052600,0,0,1,0),(11,'glossary_random',2005040500,0,0,1,1),(12,'html',2004123000,0,0,1,1),(13,'loancalc',2005022100,0,0,1,0),(14,'login',2006102700,0,0,1,0),(15,'mentees',2007030900,0,0,1,1),(16,'messages',2004122800,0,0,1,0),(17,'mnet_hosts',2006112100,0,0,1,0),(18,'news_items',2005030800,0,0,1,0),(19,'online_users',2006030100,0,0,1,0),(20,'participants',2004052600,0,0,1,0),(21,'quiz_results',2005082300,0,0,1,1),(22,'recent_activity',2004042900,0,0,1,0),(23,'rss_client',2006100102,0,0,1,1),(24,'search',2007081100,1,0,1,0),(25,'search_forums',2005030900,0,0,1,0),(26,'section_links',2004052800,0,0,1,0),(27,'site_main_menu',2005061300,0,0,1,0),(28,'social_activities',2004041800,0,0,1,0);
/*!40000 ALTER TABLE 'mdl_block' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_block_instance';
CREATE TABLE 'mdl_block_instance' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'blockid' bigint(10) unsigned NOT NULL default '0',
  'pageid' bigint(10) unsigned NOT NULL default '0',
  'pagetype' varchar(20) NOT NULL default '',
  'position' varchar(10) NOT NULL default '',
  'weight' smallint(3) NOT NULL default '0',
  'visible' tinyint(1) NOT NULL default '0',
  'configdata' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_blocinst_pag_ix' ('pageid'),
  KEY 'mdl_blocinst_pag2_ix' ('pagetype'),
  KEY 'mdl_blocinst_blo_ix' ('blockid')
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='to store block instances in pages';
LOCK TABLES 'mdl_block_instance' WRITE;
/*!40000 ALTER TABLE 'mdl_block_instance' DISABLE KEYS */;
INSERT INTO 'mdl_block_instance' VALUES (1,27,1,'course-view','l',0,1,''),(2,4,1,'course-view','l',1,1,''),(3,10,1,'course-view','r',0,1,''),(4,7,1,'course-view','r',1,1,''),(5,4,0,'admin','l',0,1,''),(6,3,0,'admin','l',1,1,'');
/*!40000 ALTER TABLE 'mdl_block_instance' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_block_pinned';
CREATE TABLE 'mdl_block_pinned' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'blockid' bigint(10) unsigned NOT NULL default '0',
  'pagetype' varchar(20) NOT NULL default '',
  'position' varchar(10) NOT NULL default '',
  'weight' smallint(3) NOT NULL default '0',
  'visible' tinyint(1) NOT NULL default '0',
  'configdata' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_blocpinn_pag_ix' ('pagetype'),
  KEY 'mdl_blocpinn_blo_ix' ('blockid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to pin blocks';
LOCK TABLES 'mdl_block_pinned' WRITE;
/*!40000 ALTER TABLE 'mdl_block_pinned' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_block_pinned' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_block_rss_client';
CREATE TABLE 'mdl_block_rss_client' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'title' text NOT NULL,
  'preferredtitle' varchar(64) NOT NULL default '',
  'description' text NOT NULL,
  'shared' tinyint(2) unsigned NOT NULL default '0',
  'url' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the';
LOCK TABLES 'mdl_block_rss_client' WRITE;
/*!40000 ALTER TABLE 'mdl_block_rss_client' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_block_rss_client' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_block_search_documents';
CREATE TABLE 'mdl_block_search_documents' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'docid' varchar(32) NOT NULL default '',
  'doctype' varchar(32) NOT NULL default 'none',
  'itemtype' varchar(32) NOT NULL default 'standard',
  'title' varchar(255) NOT NULL default '',
  'url' varchar(255) NOT NULL default '',
  'docdate' datetime NOT NULL,
  'updated' datetime NOT NULL,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_blocseardocu_doc_ix' ('docid'),
  KEY 'mdl_blocseardocu_doc2_ix' ('doctype'),
  KEY 'mdl_blocseardocu_ite_ix' ('itemtype')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='table to store search index backups';
LOCK TABLES 'mdl_block_search_documents' WRITE;
/*!40000 ALTER TABLE 'mdl_block_search_documents' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_block_search_documents' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_blog_tag_instance';
CREATE TABLE 'mdl_blog_tag_instance' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'entryid' bigint(10) unsigned NOT NULL default '0',
  'tagid' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) unsigned NOT NULL default '0',
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_blogtaginst_ent_ix' ('entryid'),
  KEY 'mdl_blogtaginst_tag_ix' ('tagid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tag instance for blogs';
LOCK TABLES 'mdl_blog_tag_instance' WRITE;
/*!40000 ALTER TABLE 'mdl_blog_tag_instance' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_blog_tag_instance' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_cache_filters';
CREATE TABLE 'mdl_cache_filters' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'filter' varchar(32) NOT NULL default '',
  'version' bigint(10) unsigned NOT NULL default '0',
  'md5key' varchar(32) NOT NULL default '',
  'rawtext' text NOT NULL,
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_cachfilt_filmd5_ix' ('filter','md5key')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data';
LOCK TABLES 'mdl_cache_filters' WRITE;
/*!40000 ALTER TABLE 'mdl_cache_filters' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_cache_filters' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_cache_text';
CREATE TABLE 'mdl_cache_text' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'md5key' varchar(32) NOT NULL default '',
  'formattedtext' longtext NOT NULL,
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_cachtext_md5_ix' ('md5key')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts';
LOCK TABLES 'mdl_cache_text' WRITE;
/*!40000 ALTER TABLE 'mdl_cache_text' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_cache_text' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_capabilities';
CREATE TABLE 'mdl_capabilities' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  'captype' varchar(50) NOT NULL default '',
  'contextlevel' bigint(10) unsigned NOT NULL default '0',
  'component' varchar(100) NOT NULL default '',
  'riskbitmask' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_capa_nam_uix' ('name')
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities';
LOCK TABLES 'mdl_capabilities' WRITE;
/*!40000 ALTER TABLE 'mdl_capabilities' DISABLE KEYS */;
INSERT INTO 'mdl_capabilities' VALUES (1,'moodle/site:doanything','admin',10,'moodle',30),(2,'moodle/legacy:guest','legacy',10,'moodle',0),(3,'moodle/legacy:user','legacy',10,'moodle',0),(4,'moodle/legacy:student','legacy',10,'moodle',16),(5,'moodle/legacy:teacher','legacy',10,'moodle',24),(6,'moodle/legacy:editingteacher','legacy',10,'moodle',28),(7,'moodle/legacy:coursecreator','legacy',10,'moodle',28),(8,'moodle/legacy:admin','legacy',10,'moodle',30),(9,'moodle/site:config','write',10,'moodle',30),(10,'moodle/site:readallmessages','read',10,'moodle',8),(11,'moodle/site:sendmessage','write',10,'moodle',8),(12,'moodle/site:approvecourse','write',10,'moodle',4),(13,'moodle/site:import','write',10,'moodle',28),(14,'moodle/site:backup','write',10,'moodle',28),(15,'moodle/site:restore','write',10,'moodle',28),(16,'moodle/site:manageblocks','write',10,'moodle',20),(17,'moodle/site:accessallgroups','read',10,'moodle',0),(18,'moodle/site:viewfullnames','read',10,'moodle',0),(19,'moodle/site:viewreports','read',10,'moodle',8),(20,'moodle/site:trustcontent','write',10,'moodle',4),(21,'moodle/site:uploadusers','write',10,'moodle',24),(22,'moodle/user:create','write',10,'moodle',24),(23,'moodle/user:delete','write',10,'moodle',8),(24,'moodle/user:update','write',10,'moodle',24),(25,'moodle/user:viewdetails','read',10,'moodle',0),(26,'moodle/user:viewhiddendetails','read',10,'moodle',8),(27,'moodle/user:viewusergrades','write',50,'moodle',0),(28,'moodle/user:loginas','write',50,'moodle',30),(29,'moodle/role:assign','write',10,'moodle',0),(30,'moodle/role:override','write',10,'moodle',28),(31,'moodle/role:manage','write',10,'moodle',28),(32,'moodle/role:unassignself','write',10,'moodle',0),(33,'moodle/role:viewhiddenassigns','read',10,'moodle',0),(34,'moodle/role:switchroles','read',10,'moodle',4),(35,'moodle/category:create','write',40,'moodle',4),(36,'moodle/category:delete','write',40,'moodle',0),(37,'moodle/category:update','write',40,'moodle',4),(38,'moodle/category:visibility','write',40,'moodle',0),(39,'moodle/course:create','write',40,'moodle',4),(40,'moodle/course:delete','write',50,'moodle',0),(41,'moodle/course:update','write',50,'moodle',4),(42,'moodle/course:view','read',50,'moodle',0),(43,'moodle/course:bulkmessaging','write',50,'moodle',16),(44,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(45,'moodle/course:viewhiddencourses','read',50,'moodle',0),(46,'moodle/course:visibility','write',50,'moodle',0),(47,'moodle/course:managefiles','write',50,'moodle',4),(48,'moodle/course:manageactivities','write',50,'moodle',4),(49,'moodle/course:managemetacourse','write',50,'moodle',0),(50,'moodle/course:activityvisibility','write',50,'moodle',0),(51,'moodle/course:viewhiddenactivities','write',50,'moodle',0),(52,'moodle/course:viewparticipants','read',50,'moodle',0),(53,'moodle/course:viewscales','read',50,'moodle',0),(54,'moodle/course:managescales','write',50,'moodle',0),(55,'moodle/course:managegroups','write',50,'moodle',0),(56,'moodle/course:reset','write',50,'moodle',0),(57,'moodle/blog:view','read',10,'moodle',0),(58,'moodle/blog:create','write',10,'moodle',16),(59,'moodle/blog:manageofficialtags','write',10,'moodle',16),(60,'moodle/blog:managepersonaltags','write',10,'moodle',16),(61,'moodle/blog:manageentries','write',10,'moodle',16),(62,'moodle/calendar:manageownentries','write',10,'moodle',16),(63,'moodle/calendar:manageentries','write',10,'moodle',16),(64,'moodle/user:editprofile','read',30,'moodle',16),(65,'moodle/user:readuserposts','read',30,'moodle',0),(66,'moodle/user:readuserblogs','read',30,'moodle',0),(67,'moodle/user:viewuseractivitiesreport','read',30,'moodle',0),(68,'moodle/question:import','write',50,'moodle',4),(69,'moodle/question:export','read',50,'moodle',0),(70,'moodle/question:managecategory','write',50,'moodle',0),(71,'moodle/question:manage','write',50,'moodle',4),(72,'moodle/site:doclinks','read',10,'moodle',0),(73,'moodle/course:sectionvisibility','write',50,'moodle',0),(74,'moodle/course:useremail','write',50,'moodle',0),(75,'moodle/course:viewhiddensections','write',50,'moodle',0),(76,'moodle/course:setcurrentsection','write',50,'moodle',0),(77,'moodle/course:viewcoursegrades','read',50,'moodle',8),(78,'moodle/course:managegrades','write',50,'moodle',8),(79,'moodle/site:mnetlogintoremote','read',10,'moodle',12),(80,'moodle/my:manageblocks','write',10,'moodle',0),(81,'mod/assignment:view','read',70,'mod/assignment',0),(82,'mod/assignment:submit','write',70,'mod/assignment',0),(83,'mod/assignment:grade','write',70,'mod/assignment',0),(84,'mod/chat:chat','write',70,'mod/chat',16),(85,'mod/chat:readlog','read',70,'mod/chat',0),(86,'mod/chat:deletelog','write',70,'mod/chat',0),(87,'mod/choice:choose','write',70,'mod/choice',0),(88,'mod/choice:readresponses','read',70,'mod/choice',0),(89,'mod/choice:deleteresponses','write',70,'mod/choice',0),(90,'mod/choice:downloadresponses','read',70,'mod/choice',0),(91,'mod/data:viewentry','read',70,'mod/data',0),(92,'mod/data:writeentry','write',70,'mod/data',16),(93,'mod/data:comment','write',70,'mod/data',16),(94,'mod/data:viewrating','read',70,'mod/data',0),(95,'mod/data:rate','write',70,'mod/data',0),(96,'mod/data:approve','write',70,'mod/data',0),(97,'mod/data:manageentries','write',70,'mod/data',16),(98,'mod/data:managecomments','write',70,'mod/data',16),(99,'mod/data:managetemplates','write',70,'mod/data',20),(100,'mod/data:viewalluserpresets','read',70,'mod/data',0),(101,'mod/data:manageuserpresets','write',70,'mod/data',20),(102,'mod/forum:viewdiscussion','read',70,'mod/forum',0),(103,'mod/forum:viewhiddentimedposts','read',70,'mod/forum',0),(104,'mod/forum:startdiscussion','write',70,'mod/forum',16),(105,'mod/forum:replypost','write',70,'mod/forum',16),(106,'mod/forum:addnews','write',70,'mod/forum',16),(107,'mod/forum:replynews','write',70,'mod/forum',16),(108,'mod/forum:viewrating','read',70,'mod/forum',0),(109,'mod/forum:viewanyrating','read',70,'mod/forum',0),(110,'mod/forum:rate','write',70,'mod/forum',0),(111,'mod/forum:createattachment','write',70,'mod/forum',16),(112,'mod/forum:deleteownpost','read',70,'mod/forum',0),(113,'mod/forum:deleteanypost','read',70,'mod/forum',0),(114,'mod/forum:splitdiscussions','read',70,'mod/forum',0),(115,'mod/forum:movediscussions','read',70,'mod/forum',0),(116,'mod/forum:editanypost','write',70,'mod/forum',16),(117,'mod/forum:viewqandawithoutposting','read',70,'mod/forum',0),(118,'mod/forum:viewsubscribers','read',70,'mod/forum',0),(119,'mod/forum:managesubscriptions','read',70,'mod/forum',0),(120,'mod/forum:initialsubscriptions','read',70,'mod/forum',0),(121,'mod/forum:throttlingapplies','write',70,'mod/forum',16),(122,'mod/glossary:write','write',70,'mod/glossary',16),(123,'mod/glossary:manageentries','write',70,'mod/glossary',16),(124,'mod/glossary:managecategories','write',70,'mod/glossary',16),(125,'mod/glossary:comment','write',70,'mod/glossary',16),(126,'mod/glossary:managecomments','write',70,'mod/glossary',16),(127,'mod/glossary:import','write',70,'mod/glossary',16),(128,'mod/glossary:export','read',70,'mod/glossary',0),(129,'mod/glossary:approve','write',70,'mod/glossary',16),(130,'mod/glossary:rate','write',70,'mod/glossary',0),(131,'mod/glossary:viewrating','read',70,'mod/glossary',0),(132,'mod/hotpot:attempt','read',70,'mod/hotpot',0),(133,'mod/hotpot:viewreport','read',70,'mod/hotpot',0),(134,'mod/hotpot:grade','read',70,'mod/hotpot',0),(135,'mod/hotpot:deleteattempt','read',70,'mod/hotpot',0),(136,'mod/lams:participate','write',70,'mod/lams',0),(137,'mod/lams:manage','write',70,'mod/lams',0),(138,'mod/lesson:edit','write',70,'mod/lesson',4),(139,'mod/lesson:manage','write',70,'mod/lesson',0),(140,'mod/quiz:view','read',70,'mod/quiz',0),(141,'mod/quiz:attempt','write',70,'mod/quiz',0),(142,'mod/quiz:manage','write',70,'mod/quiz',0),(143,'mod/quiz:preview','write',70,'mod/quiz',0),(144,'mod/quiz:grade','write',70,'mod/quiz',0),(145,'mod/quiz:viewreports','read',70,'mod/quiz',0),(146,'mod/quiz:deleteattempts','write',70,'mod/quiz',0),(147,'mod/quiz:ignoretimelimits','read',70,'mod/quiz',0),(148,'mod/scorm:viewreport','read',70,'mod/scorm',0),(149,'mod/scorm:skipview','write',70,'mod/scorm',0),(150,'mod/scorm:savetrack','write',70,'mod/scorm',0),(151,'mod/scorm:viewscores','read',70,'mod/scorm',0),(152,'mod/survey:participate','read',70,'mod/survey',0),(153,'mod/survey:readresponses','read',70,'mod/survey',0),(154,'mod/survey:download','read',70,'mod/survey',0),(155,'mod/wiki:participate','write',70,'mod/wiki',16),(156,'mod/wiki:manage','write',70,'mod/wiki',16),(157,'mod/wiki:overridelock','write',70,'mod/wiki',0),(158,'mod/workshop:participate','write',70,'mod/workshop',16),(159,'mod/workshop:manage','write',70,'mod/workshop',16),(160,'block/rss_client:createprivatefeeds','write',10,'block/rss_client',0),(161,'block/rss_client:createsharedfeeds','write',10,'block/rss_client',16),(162,'block/rss_client:manageownfeeds','write',10,'block/rss_client',0),(163,'block/rss_client:manageanyfeeds','write',10,'block/rss_client',16),(164,'enrol/authorize:managepayments','write',10,'enrol/authorize',8),(165,'enrol/authorize:uploadcsv','write',30,'enrol/authorize',4);
/*!40000 ALTER TABLE 'mdl_capabilities' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_chat';
CREATE TABLE 'mdl_chat' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'intro' text NOT NULL,
  'keepdays' bigint(11) NOT NULL default '0',
  'studentlogs' smallint(4) NOT NULL default '0',
  'chattime' bigint(10) unsigned NOT NULL default '0',
  'schedule' smallint(4) NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_chat_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room';
LOCK TABLES 'mdl_chat' WRITE;
/*!40000 ALTER TABLE 'mdl_chat' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_chat' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_chat_messages';
CREATE TABLE 'mdl_chat_messages' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'chatid' bigint(10) NOT NULL default '0',
  'userid' bigint(10) NOT NULL default '0',
  'groupid' bigint(10) NOT NULL default '0',
  'system' tinyint(1) unsigned NOT NULL default '0',
  'message' text NOT NULL,
  'timestamp' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_chatmess_use_ix' ('userid'),
  KEY 'mdl_chatmess_gro_ix' ('groupid'),
  KEY 'mdl_chatmess_timcha_ix' ('timestamp','chatid'),
  KEY 'mdl_chatmess_cha_ix' ('chatid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages';
LOCK TABLES 'mdl_chat_messages' WRITE;
/*!40000 ALTER TABLE 'mdl_chat_messages' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_chat_messages' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_chat_users';
CREATE TABLE 'mdl_chat_users' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'chatid' bigint(11) NOT NULL default '0',
  'userid' bigint(11) NOT NULL default '0',
  'groupid' bigint(11) NOT NULL default '0',
  'version' varchar(16) NOT NULL default '',
  'ip' varchar(15) NOT NULL default '',
  'firstping' bigint(10) unsigned NOT NULL default '0',
  'lastping' bigint(10) unsigned NOT NULL default '0',
  'lastmessageping' bigint(10) unsigned NOT NULL default '0',
  'sid' varchar(32) NOT NULL default '',
  'course' bigint(10) unsigned NOT NULL default '0',
  'lang' varchar(30) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_chatuser_use_ix' ('userid'),
  KEY 'mdl_chatuser_las_ix' ('lastping'),
  KEY 'mdl_chatuser_gro_ix' ('groupid'),
  KEY 'mdl_chatuser_cha_ix' ('chatid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms';
LOCK TABLES 'mdl_chat_users' WRITE;
/*!40000 ALTER TABLE 'mdl_chat_users' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_chat_users' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_choice';
CREATE TABLE 'mdl_choice' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'text' text NOT NULL,
  'format' tinyint(2) unsigned NOT NULL default '0',
  'publish' tinyint(2) unsigned NOT NULL default '0',
  'showresults' tinyint(2) unsigned NOT NULL default '0',
  'display' smallint(4) unsigned NOT NULL default '0',
  'allowupdate' tinyint(2) unsigned NOT NULL default '0',
  'showunanswered' tinyint(2) unsigned NOT NULL default '0',
  'limitanswers' tinyint(2) unsigned NOT NULL default '0',
  'timeopen' bigint(10) unsigned NOT NULL default '0',
  'timeclose' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_choi_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here';
LOCK TABLES 'mdl_choice' WRITE;
/*!40000 ALTER TABLE 'mdl_choice' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_choice' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_choice_answers';
CREATE TABLE 'mdl_choice_answers' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'choiceid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'optionid' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_choiansw_use_ix' ('userid'),
  KEY 'mdl_choiansw_cho_ix' ('choiceid'),
  KEY 'mdl_choiansw_opt_ix' ('optionid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='choices performed by users';
LOCK TABLES 'mdl_choice_answers' WRITE;
/*!40000 ALTER TABLE 'mdl_choice_answers' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_choice_answers' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_choice_options';
CREATE TABLE 'mdl_choice_options' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'choiceid' bigint(10) unsigned NOT NULL default '0',
  'text' text,
  'maxanswers' bigint(10) unsigned default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_choiopti_cho_ix' ('choiceid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='available options to choice';
LOCK TABLES 'mdl_choice_options' WRITE;
/*!40000 ALTER TABLE 'mdl_choice_options' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_choice_options' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_config';
CREATE TABLE 'mdl_config' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  'value' text NOT NULL,
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_conf_nam_uix' ('name')
) ENGINE=MyISAM AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables';
LOCK TABLES 'mdl_config' WRITE;
/*!40000 ALTER TABLE 'mdl_config' DISABLE KEYS */;
INSERT INTO 'mdl_config' VALUES (1,'unicodedb','1'),(2,'group_version','2007012401'),(3,'statsrolesupgraded','1201718639'),(4,'guestroleid','6'),(5,'creatornewroleid','3'),(6,'notloggedinroleid','6'),(7,'defaultuserroleid','7'),(8,'defaultcourseroleid','5'),(9,'autologinguests','0'),(10,'nonmetacoursesyncroleids',''),(11,'hiddenuserfields',''),(12,'enablecourserequests','0'),(13,'defaultrequestcategory','1'),(14,'timezone','99'),(15,'forcetimezone','99'),(16,'country','0'),(17,'iplookup','hostip'),(18,'lang','en_utf8'),(19,'langmenu','1'),(20,'langlist',''),(21,'langcache','1'),(22,'locale',''),(23,'latinexcelexport','0'),(24,'protectusernames','1'),(25,'forcelogin','0'),(26,'forceloginforprofiles','1'),(27,'opentogoogle','0'),(28,'maxbytes','0'),(29,'messaging','1'),(30,'allowobjectembed','0'),(31,'enabletrusttext','0'),(32,'maxeditingtime','1800'),(33,'fullnamedisplay','firstname lastname'),(34,'extendedusernamechars','0'),(35,'sitepolicy',''),(36,'bloglevel','4'),(37,'cronclionly','0'),(38,'cronremotepassword',''),(39,'loginhttps','0'),(40,'restrictmodulesfor','none'),(41,'restrictbydefault','0'),(42,'defaultallowedmodules',''),(43,'displayloginfailures',''),(44,'notifyloginfailures',''),(45,'notifyloginthreshold','10'),(46,'runclamonupload','0'),(47,'pathtoclam',''),(48,'quarantinedir',''),(49,'clamfailureonupload','donothing'),(50,'themelist',''),(51,'allowuserthemes','0'),(52,'allowcoursethemes','0'),(53,'allowuserblockhiding','1'),(54,'showblocksonmodpages','0'),(55,'calendar_adminseesall','0'),(56,'calendar_site_timeformat','0'),(57,'calendar_startwday','0'),(58,'calendar_weekend','65'),(59,'calendar_lookahead','21'),(60,'calendar_maxevents','10'),(61,'cachetext','60'),(62,'filteruploadedfiles','0'),(63,'filtermatchoneperpage','0'),(64,'filtermatchonepertext','0'),(65,'filterall','0'),(66,'htmleditor','1'),(67,'editorbackgroundcolor','#ffffff'),(68,'editorfontfamily','Trebuchet MS,Verdana,Arial,Helvetica,sans-serif'),(69,'editorfontsize',''),(70,'editorfontlist','Trebuchet:Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial:arial,helvetica,sans-serif;Courier New:courier new,courier,monospace;Georgia:georgia,times new roman,times,serif;Tahoma:tahoma,arial,helvetica,sans-serif;Times New Roman:times new roman,times,serif;Verdana:verdana,arial,helvetica,sans-serif;Impact:impact;Wingdings:wingdings'),(71,'editorkillword','1'),(72,'editorhidebuttons',''),(73,'docroot','http://docs.moodle.org'),(74,'doctonewwindow','0'),(75,'mymoodleredirect','0'),(76,'gradebookroles','5'),(77,'coursemanager','3'),(78,'frontpage','2,0,,'),(79,'frontpageloggedin','4,,,'),(80,'coursesperpage','20'),(81,'allowvisiblecoursesinhiddencategories','0'),(82,'gdversion','2'),(83,'zip',''),(84,'unzip',''),(85,'pathtodu',''),(86,'aspellpath',''),(87,'smtphosts',''),(88,'smtpuser',''),(89,'smtppass',''),(90,'noreplyaddress','noreply@template.orvsd.org'),(91,'allowemailaddresses',''),(92,'denyemailaddresses',''),(93,'digestmailtime','17'),(94,'sitemailcharset',''),(95,'allowusermailcharset','0'),(96,'dbsessions','0'),(97,'sessiontimeout','7200'),(98,'sessioncookie',''),(99,'sessioncookiepath','/'),(100,'enablerssfeeds','0'),(101,'debug',''),(102,'debugdisplay','1'),(103,'debugsmtp','0'),(104,'perfdebug','7'),(105,'enablestats','0'),(106,'statsfirstrun','none'),(107,'statsmaxruntime','0'),(108,'statsruntimestarthour','0'),(109,'statsruntimestartminute','0'),(110,'statsuserthreshold','0'),(111,'framename','_top'),(112,'slasharguments','1'),(113,'proxyhost',''),(114,'proxyport','0'),(115,'longtimenosee','120'),(116,'deleteunconfirmed','168'),(117,'loglifetime','0'),(118,'cachetype',''),(119,'rcache',''),(120,'rcachettl','10'),(121,'intcachemax','10'),(122,'memcachedhosts',''),(123,'memcachedpconn',''),(124,'enableajax','0'),(125,'enableglobalsearch','0'),(126,'smartpix','0'),(127,'alternateloginurl',''),(128,'auth','email'),(129,'auth_pop3mailbox','INBOX'),(130,'changepassword',''),(131,'enrol','manual'),(132,'enrol_plugins_enabled','manual'),(133,'guestloginbutton','1'),(134,'registerauth','email'),(135,'style','default'),(136,'template','default'),(137,'theme','standardwhite'),(138,'filter_multilang_converted','1'),(139,'mnet_dispatcher_mode','off'),(140,'mnet_localhost_id','1'),(141,'mnet_all_hosts_id','2'),(142,'version','2007021540'),(143,'release','1.8.4+'),(144,'assignment_maxbytes','1024000'),(145,'assignment_itemstocount','1'),(146,'assignment_online_version','2005042900'),(147,'chat_refresh_room','5'),(148,'chat_refresh_userlist','10'),(149,'chat_old_ping','35'),(150,'chat_method','header_js'),(151,'chat_normal_updatemode','jsupdate'),(152,'chat_serverhost','template.orvsd.org'),(153,'chat_serverip','127.0.0.1'),(154,'chat_serverport','9111'),(155,'chat_servermax','100'),(156,'forum_displaymode','3'),(157,'forum_shortpost','300'),(158,'forum_longpost','600'),(159,'forum_manydiscussions','100'),(160,'forum_maxbytes','512000'),(161,'forum_trackreadposts','1'),(162,'forum_oldpostdays','14'),(163,'forum_usermarksread',''),(164,'forum_cleanreadtime','2'),(165,'forum_replytouser','1'),(166,'glossary_studentspost','1'),(167,'glossary_dupentries','0'),(168,'glossary_allowcomments','0'),(169,'glossary_linkbydefault','1'),(170,'glossary_defaultapproval','1'),(171,'glossary_entbypage','10'),(172,'hotpot_showtimes','0'),(173,'hotpot_excelencodings',''),(174,'hotpot_initialdisable','1'),(175,'journal_showrecentactivity','1'),(176,'journal_initialdisable','1'),(177,'lams_initialdisable','1'),(178,'quiz_review','16777215'),(179,'quiz_attemptonlast','0'),(180,'quiz_attempts','0'),(181,'quiz_grademethod',''),(182,'quiz_decimalpoints','2'),(183,'quiz_maximumgrade','10'),(184,'quiz_password',''),(185,'quiz_popup','0'),(186,'quiz_questionsperpage','0'),(187,'quiz_shuffleanswers','1'),(188,'quiz_shufflequestions','0'),(189,'quiz_subnet',''),(190,'quiz_timelimit','0'),(191,'quiz_optionflags','1'),(192,'quiz_penaltyscheme','1'),(193,'quiz_delay1','0'),(194,'quiz_delay2','0'),(195,'quiz_fix_review','0'),(196,'quiz_fix_attemptonlast','0'),(197,'quiz_fix_attempts','0'),(198,'quiz_fix_grademethod','0'),(199,'quiz_fix_decimalpoints','0'),(200,'quiz_fix_password','0'),(201,'quiz_fix_popup','0'),(202,'quiz_fix_questionsperpage','0'),(203,'quiz_fix_shuffleanswers','0'),(204,'quiz_fix_shufflequestions','0'),(205,'quiz_fix_subnet','0'),(206,'quiz_fix_timelimit','0'),(207,'quiz_fix_adaptive','0'),(208,'quiz_fix_penaltyscheme','0'),(209,'quiz_fix_delay1','0'),(210,'quiz_fix_delay2','0'),(211,'resource_framesize','130'),(212,'resource_websearch','http://google.com/'),(213,'resource_defaulturl','http://'),(214,'resource_filterexternalpages',''),(215,'resource_secretphrase','eIkY3g7Jkfi1ye2sgXtv'),(216,'resource_popup',''),(217,'resource_windowsettings','0'),(218,'resource_parametersettings','0'),(219,'resource_allowlocalfiles','0'),(220,'resource_hide_repository','1'),(221,'resource_autofilerename','1'),(222,'resource_blockdeletingfile','1'),(223,'resource_popupresizable','checked'),(224,'resource_popupscrollbars','checked'),(225,'resource_popupdirectories','checked'),(226,'resource_popuplocation','checked'),(227,'resource_popupmenubar','checked'),(228,'resource_popuptoolbar','checked'),(229,'resource_popupstatus','checked'),(230,'resource_popupwidth','620'),(231,'resource_popupheight','450'),(232,'scorm_maxattempts','6'),(233,'scorm_frameheight','500'),(234,'scorm_framewidth','100%'),(235,'scorm_updatetime','2'),(236,'scorm_advancedsettings','0'),(237,'scorm_windowsettings','0'),(238,'qtype_calculated_version','2006032200'),(239,'qtype_essay_version','2006032200'),(240,'qtype_match_version','2006032200'),(241,'qtype_multianswer_version','2006032200'),(242,'qtype_multichoice_version','2006121501'),(243,'qtype_numerical_version','2006121500'),(244,'qtype_randomsamatch_version','2006042800'),(245,'qtype_rqp_version','2006032201'),(246,'qtype_shortanswer_version','2006032200'),(247,'qtype_truefalse_version','2006032200'),(248,'backup_version','2007022100'),(249,'backup_release','1.8+'),(250,'blocks_version','2005090201'),(251,'enrol_authorize_version','2006112901'),(252,'enrol_paypal_version','2006092200'),(253,'adminblocks_initialised','1'),(254,'siteidentifier','enIwFpxla6ItJvEQ3rDzHpgP0QKTGxzstemplate.orvsd.org'),(255,'rolesactive','1');
/*!40000 ALTER TABLE 'mdl_config' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_config_plugins';
CREATE TABLE 'mdl_config_plugins' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'plugin' varchar(100) NOT NULL default 'core',
  'name' varchar(100) NOT NULL default '',
  'value' text NOT NULL,
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_confplug_plunam_uix' ('plugin','name')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables';
LOCK TABLES 'mdl_config_plugins' WRITE;
/*!40000 ALTER TABLE 'mdl_config_plugins' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_config_plugins' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_context';
CREATE TABLE 'mdl_context' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'contextlevel' bigint(10) unsigned NOT NULL default '0',
  'instanceid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_cont_conins_uix' ('contextlevel','instanceid'),
  KEY 'mdl_cont_ins_ix' ('instanceid')
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='one of these must be set';
LOCK TABLES 'mdl_context' WRITE;
/*!40000 ALTER TABLE 'mdl_context' DISABLE KEYS */;
INSERT INTO 'mdl_context' VALUES (1,10,0),(2,50,1);
/*!40000 ALTER TABLE 'mdl_context' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_context_rel';
CREATE TABLE 'mdl_context_rel' (
  'id' bigint(10) NOT NULL auto_increment,
  'c1' bigint(10) default NULL,
  'c2' bigint(10) default NULL,
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_contrel_c1c2_uix' ('c1','c2'),
  KEY 'mdl_contrel_c1_ix' ('c1'),
  KEY 'mdl_contrel_c2_ix' ('c2')
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='context relations, c2 is a parent (or higher) of c1';
LOCK TABLES 'mdl_context_rel' WRITE;
/*!40000 ALTER TABLE 'mdl_context_rel' DISABLE KEYS */;
INSERT INTO 'mdl_context_rel' VALUES (1,2,1),(2,2,2);
/*!40000 ALTER TABLE 'mdl_context_rel' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_course';
CREATE TABLE 'mdl_course' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'category' bigint(10) unsigned NOT NULL default '0',
  'sortorder' bigint(10) unsigned NOT NULL default '0',
  'password' varchar(50) NOT NULL default '',
  'fullname' varchar(254) NOT NULL default '',
  'shortname' varchar(100) NOT NULL default '',
  'idnumber' varchar(100) NOT NULL default '',
  'summary' text NOT NULL,
  'format' varchar(10) NOT NULL default 'topics',
  'showgrades' tinyint(2) unsigned NOT NULL default '1',
  'modinfo' longtext,
  'newsitems' mediumint(5) unsigned NOT NULL default '1',
  'teacher' varchar(100) NOT NULL default 'Teacher',
  'teachers' varchar(100) NOT NULL default 'Teachers',
  'student' varchar(100) NOT NULL default 'Student',
  'students' varchar(100) NOT NULL default 'Students',
  'guest' tinyint(2) unsigned NOT NULL default '0',
  'startdate' bigint(10) unsigned NOT NULL default '0',
  'enrolperiod' bigint(10) unsigned NOT NULL default '0',
  'numsections' mediumint(5) unsigned NOT NULL default '1',
  'marker' bigint(10) unsigned NOT NULL default '0',
  'maxbytes' bigint(10) unsigned NOT NULL default '0',
  'showreports' smallint(4) unsigned NOT NULL default '0',
  'visible' tinyint(1) unsigned NOT NULL default '1',
  'hiddensections' tinyint(2) unsigned NOT NULL default '0',
  'groupmode' smallint(4) unsigned NOT NULL default '0',
  'groupmodeforce' smallint(4) unsigned NOT NULL default '0',
  'lang' varchar(30) NOT NULL default '',
  'theme' varchar(50) NOT NULL default '',
  'cost' varchar(10) NOT NULL default '',
  'currency' varchar(3) NOT NULL default 'USD',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'metacourse' tinyint(1) unsigned NOT NULL default '0',
  'requested' tinyint(1) unsigned NOT NULL default '0',
  'restrictmodules' tinyint(1) unsigned NOT NULL default '0',
  'expirynotify' tinyint(1) unsigned NOT NULL default '0',
  'expirythreshold' bigint(10) unsigned NOT NULL default '0',
  'notifystudents' tinyint(1) unsigned NOT NULL default '0',
  'enrollable' tinyint(1) unsigned NOT NULL default '1',
  'enrolstartdate' bigint(10) unsigned NOT NULL default '0',
  'enrolenddate' bigint(10) unsigned NOT NULL default '0',
  'enrol' varchar(20) NOT NULL default '',
  'defaultrole' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_cour_cat_ix' ('category'),
  KEY 'mdl_cour_idn_ix' ('idnumber'),
  KEY 'mdl_cour_sho_ix' ('shortname')
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Central course table';
LOCK TABLES 'mdl_course' WRITE;
/*!40000 ALTER TABLE 'mdl_course' DISABLE KEYS */;
INSERT INTO 'mdl_course' VALUES (1,0,0,'','ORVSD_FULLNAME','ORVSD_SHORTNAME','','','site',1,NULL,3,'Teacher','Teachers','Student','Students',0,0,0,0,0,0,0,1,0,0,0,'','','','USD',0,1201718847,0,0,0,0,0,0,1,0,0,'',0);
/*!40000 ALTER TABLE 'mdl_course' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_course_allowed_modules';
CREATE TABLE 'mdl_course_allowed_modules' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'module' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_courallomodu_cou_ix' ('course'),
  KEY 'mdl_courallomodu_mod_ix' ('module')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='allowed modules foreach course';
LOCK TABLES 'mdl_course_allowed_modules' WRITE;
/*!40000 ALTER TABLE 'mdl_course_allowed_modules' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_course_allowed_modules' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_course_categories';
CREATE TABLE 'mdl_course_categories' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  'description' text,
  'parent' bigint(10) unsigned NOT NULL default '0',
  'sortorder' bigint(10) unsigned NOT NULL default '0',
  'coursecount' bigint(10) unsigned NOT NULL default '0',
  'visible' tinyint(1) NOT NULL default '1',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'depth' bigint(10) unsigned NOT NULL default '0',
  'path' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_courcate_par_ix' ('parent')
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Course categories';
LOCK TABLES 'mdl_course_categories' WRITE;
/*!40000 ALTER TABLE 'mdl_course_categories' DISABLE KEYS */;
INSERT INTO 'mdl_course_categories' VALUES (1,'Miscellaneous',NULL,0,0,0,1,0,0,'');
/*!40000 ALTER TABLE 'mdl_course_categories' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_course_display';
CREATE TABLE 'mdl_course_display' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'display' bigint(10) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_courdisp_couuse_ix' ('course','userid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores info about how to display the course';
LOCK TABLES 'mdl_course_display' WRITE;
/*!40000 ALTER TABLE 'mdl_course_display' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_course_display' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_course_meta';
CREATE TABLE 'mdl_course_meta' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'parent_course' bigint(10) unsigned NOT NULL default '0',
  'child_course' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_courmeta_par_ix' ('parent_course'),
  KEY 'mdl_courmeta_chi_ix' ('child_course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to store meta-courses relations';
LOCK TABLES 'mdl_course_meta' WRITE;
/*!40000 ALTER TABLE 'mdl_course_meta' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_course_meta' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_course_modules';
CREATE TABLE 'mdl_course_modules' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'module' bigint(10) unsigned NOT NULL default '0',
  'instance' bigint(10) unsigned NOT NULL default '0',
  'section' bigint(10) unsigned NOT NULL default '0',
  'added' bigint(10) unsigned NOT NULL default '0',
  'score' smallint(4) NOT NULL default '0',
  'indent' mediumint(5) unsigned NOT NULL default '0',
  'visible' tinyint(1) NOT NULL default '1',
  'visibleold' tinyint(1) NOT NULL default '1',
  'groupmode' smallint(4) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_courmodu_vis_ix' ('visible'),
  KEY 'mdl_courmodu_cou_ix' ('course'),
  KEY 'mdl_courmodu_mod_ix' ('module'),
  KEY 'mdl_courmodu_ins_ix' ('instance')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL';
LOCK TABLES 'mdl_course_modules' WRITE;
/*!40000 ALTER TABLE 'mdl_course_modules' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_course_modules' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_course_request';
CREATE TABLE 'mdl_course_request' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'fullname' varchar(254) NOT NULL default '',
  'shortname' varchar(15) NOT NULL default '',
  'summary' text NOT NULL,
  'reason' text NOT NULL,
  'requester' bigint(10) NOT NULL default '0',
  'password' varchar(50) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_courrequ_sho_ix' ('shortname')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='course requests';
LOCK TABLES 'mdl_course_request' WRITE;
/*!40000 ALTER TABLE 'mdl_course_request' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_course_request' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_course_sections';
CREATE TABLE 'mdl_course_sections' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'section' bigint(10) unsigned NOT NULL default '0',
  'summary' text,
  'sequence' text,
  'visible' tinyint(1) NOT NULL default '1',
  PRIMARY KEY  ('id'),
  KEY 'mdl_coursect_cousec_ix' ('course','section')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course';
LOCK TABLES 'mdl_course_sections' WRITE;
/*!40000 ALTER TABLE 'mdl_course_sections' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_course_sections' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_data';
CREATE TABLE 'mdl_data' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'intro' text NOT NULL,
  'comments' smallint(4) unsigned NOT NULL default '0',
  'timeavailablefrom' bigint(10) unsigned NOT NULL default '0',
  'timeavailableto' bigint(10) unsigned NOT NULL default '0',
  'timeviewfrom' bigint(10) unsigned NOT NULL default '0',
  'timeviewto' bigint(10) unsigned NOT NULL default '0',
  'requiredentries' int(8) unsigned NOT NULL default '0',
  'requiredentriestoview' int(8) unsigned NOT NULL default '0',
  'maxentries' int(8) unsigned NOT NULL default '0',
  'rssarticles' smallint(4) unsigned NOT NULL default '0',
  'singletemplate' text,
  'listtemplate' text,
  'listtemplateheader' text,
  'listtemplatefooter' text,
  'addtemplate' text,
  'rsstemplate' text,
  'rsstitletemplate' text,
  'csstemplate' text,
  'jstemplate' text,
  'approval' smallint(4) unsigned NOT NULL default '0',
  'scale' bigint(10) NOT NULL default '0',
  'assessed' bigint(10) unsigned NOT NULL default '0',
  'defaultsort' bigint(10) unsigned NOT NULL default '0',
  'defaultsortdir' smallint(4) unsigned NOT NULL default '0',
  'editany' smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Removed ratings column';
LOCK TABLES 'mdl_data' WRITE;
/*!40000 ALTER TABLE 'mdl_data' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_data' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_data_comments';
CREATE TABLE 'mdl_data_comments' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'recordid' bigint(10) unsigned NOT NULL default '0',
  'content' text NOT NULL,
  'format' tinyint(2) unsigned NOT NULL default '0',
  'created' bigint(10) unsigned NOT NULL default '0',
  'modified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_datacomm_rec_ix' ('recordid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to comment data records';
LOCK TABLES 'mdl_data_comments' WRITE;
/*!40000 ALTER TABLE 'mdl_data_comments' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_data_comments' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_data_content';
CREATE TABLE 'mdl_data_content' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'fieldid' bigint(10) unsigned NOT NULL default '0',
  'recordid' bigint(10) unsigned NOT NULL default '0',
  'content' longtext,
  'content1' longtext,
  'content2' longtext,
  'content3' longtext,
  'content4' longtext,
  PRIMARY KEY  ('id'),
  KEY 'mdl_datacont_rec_ix' ('recordid'),
  KEY 'mdl_datacont_fie_ix' ('fieldid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields';
LOCK TABLES 'mdl_data_content' WRITE;
/*!40000 ALTER TABLE 'mdl_data_content' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_data_content' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_data_fields';
CREATE TABLE 'mdl_data_fields' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'dataid' bigint(10) unsigned NOT NULL default '0',
  'type' varchar(255) NOT NULL default '',
  'name' varchar(255) NOT NULL default '',
  'description' text NOT NULL,
  'param1' text,
  'param2' text,
  'param3' text,
  'param4' text,
  'param5' text,
  'param6' text,
  'param7' text,
  'param8' text,
  'param9' text,
  'param10' text,
  PRIMARY KEY  ('id'),
  KEY 'mdl_datafiel_dat_ix' ('dataid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='every field available';
LOCK TABLES 'mdl_data_fields' WRITE;
/*!40000 ALTER TABLE 'mdl_data_fields' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_data_fields' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_data_ratings';
CREATE TABLE 'mdl_data_ratings' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'recordid' bigint(10) unsigned NOT NULL default '0',
  'rating' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_datarati_rec_ix' ('recordid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to rate data records';
LOCK TABLES 'mdl_data_ratings' WRITE;
/*!40000 ALTER TABLE 'mdl_data_ratings' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_data_ratings' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_data_records';
CREATE TABLE 'mdl_data_records' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) unsigned NOT NULL default '0',
  'dataid' bigint(10) unsigned NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'approved' smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_datareco_dat_ix' ('dataid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='every record introduced';
LOCK TABLES 'mdl_data_records' WRITE;
/*!40000 ALTER TABLE 'mdl_data_records' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_data_records' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_enrol_authorize';
CREATE TABLE 'mdl_enrol_authorize' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'paymentmethod' enum('cc','echeck') NOT NULL default 'cc',
  'refundinfo' smallint(4) unsigned NOT NULL default '0',
  'ccname' varchar(255) NOT NULL default '',
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'transid' bigint(10) unsigned NOT NULL default '0',
  'status' bigint(10) unsigned NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'settletime' bigint(10) unsigned NOT NULL default '0',
  'amount' varchar(10) NOT NULL default '',
  'currency' varchar(3) NOT NULL default 'USD',
  PRIMARY KEY  ('id'),
  KEY 'mdl_enroauth_cou_ix' ('courseid'),
  KEY 'mdl_enroauth_use_ix' ('userid'),
  KEY 'mdl_enroauth_sta_ix' ('status'),
  KEY 'mdl_enroauth_tra_ix' ('transid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds all known information about authorize.net transactions';
LOCK TABLES 'mdl_enrol_authorize' WRITE;
/*!40000 ALTER TABLE 'mdl_enrol_authorize' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_enrol_authorize' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_enrol_authorize_refunds';
CREATE TABLE 'mdl_enrol_authorize_refunds' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'orderid' bigint(10) unsigned NOT NULL default '0',
  'status' tinyint(1) unsigned NOT NULL default '0',
  'amount' varchar(10) NOT NULL default '',
  'transid' bigint(10) unsigned default '0',
  'settletime' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_enroauthrefu_tra_ix' ('transid'),
  KEY 'mdl_enroauthrefu_ord_ix' ('orderid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Authorize.net refunds';
LOCK TABLES 'mdl_enrol_authorize_refunds' WRITE;
/*!40000 ALTER TABLE 'mdl_enrol_authorize_refunds' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_enrol_authorize_refunds' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_enrol_paypal';
CREATE TABLE 'mdl_enrol_paypal' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'business' varchar(255) NOT NULL default '',
  'receiver_email' varchar(255) NOT NULL default '',
  'receiver_id' varchar(255) NOT NULL default '',
  'item_name' varchar(255) NOT NULL default '',
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'memo' varchar(255) NOT NULL default '',
  'tax' varchar(255) NOT NULL default '',
  'option_name1' varchar(255) NOT NULL default '',
  'option_selection1_x' varchar(255) NOT NULL default '',
  'option_name2' varchar(255) NOT NULL default '',
  'option_selection2_x' varchar(255) NOT NULL default '',
  'payment_status' varchar(255) NOT NULL default '',
  'pending_reason' varchar(255) NOT NULL default '',
  'reason_code' varchar(30) NOT NULL default '',
  'txn_id' varchar(255) NOT NULL default '',
  'parent_txn_id' varchar(255) NOT NULL default '',
  'payment_type' varchar(30) NOT NULL default '',
  'timeupdated' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions';
LOCK TABLES 'mdl_enrol_paypal' WRITE;
/*!40000 ALTER TABLE 'mdl_enrol_paypal' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_enrol_paypal' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_event';
CREATE TABLE 'mdl_event' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  'description' text NOT NULL,
  'format' smallint(4) unsigned NOT NULL default '0',
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'repeatid' bigint(10) unsigned NOT NULL default '0',
  'modulename' varchar(20) NOT NULL default '',
  'instance' bigint(10) unsigned NOT NULL default '0',
  'eventtype' varchar(20) NOT NULL default '',
  'timestart' bigint(10) unsigned NOT NULL default '0',
  'timeduration' bigint(10) unsigned NOT NULL default '0',
  'visible' smallint(4) NOT NULL default '1',
  'uuid' varchar(36) NOT NULL default '',
  'sequence' bigint(10) unsigned NOT NULL default '1',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_even_cou_ix' ('courseid'),
  KEY 'mdl_even_use_ix' ('userid'),
  KEY 'mdl_even_tim_ix' ('timestart'),
  KEY 'mdl_even_tim2_ix' ('timeduration')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it';
LOCK TABLES 'mdl_event' WRITE;
/*!40000 ALTER TABLE 'mdl_event' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_event' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_forum';
CREATE TABLE 'mdl_forum' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'type' enum('single','news','general','social','eachuser','teacher','qanda') NOT NULL default 'general',
  'name' varchar(255) NOT NULL default '',
  'intro' text NOT NULL,
  'assessed' bigint(10) unsigned NOT NULL default '0',
  'assesstimestart' bigint(10) unsigned NOT NULL default '0',
  'assesstimefinish' bigint(10) unsigned NOT NULL default '0',
  'scale' bigint(10) NOT NULL default '0',
  'maxbytes' bigint(10) unsigned NOT NULL default '0',
  'forcesubscribe' tinyint(1) unsigned NOT NULL default '0',
  'trackingtype' tinyint(2) unsigned NOT NULL default '1',
  'rsstype' tinyint(2) unsigned NOT NULL default '0',
  'rssarticles' tinyint(2) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'warnafter' bigint(10) unsigned NOT NULL default '0',
  'blockafter' bigint(10) unsigned NOT NULL default '0',
  'blockperiod' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_foru_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion';
LOCK TABLES 'mdl_forum' WRITE;
/*!40000 ALTER TABLE 'mdl_forum' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_forum' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_forum_discussions';
CREATE TABLE 'mdl_forum_discussions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'forum' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'firstpost' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) NOT NULL default '-1',
  'assessed' tinyint(1) NOT NULL default '1',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'usermodified' bigint(10) unsigned NOT NULL default '0',
  'timestart' bigint(10) unsigned NOT NULL default '0',
  'timeend' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_forudisc_use_ix' ('userid'),
  KEY 'mdl_forudisc_for_ix' ('forum')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions';
LOCK TABLES 'mdl_forum_discussions' WRITE;
/*!40000 ALTER TABLE 'mdl_forum_discussions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_forum_discussions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_forum_posts';
CREATE TABLE 'mdl_forum_posts' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'discussion' bigint(10) unsigned NOT NULL default '0',
  'parent' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'created' bigint(10) unsigned NOT NULL default '0',
  'modified' bigint(10) unsigned NOT NULL default '0',
  'mailed' tinyint(2) unsigned NOT NULL default '0',
  'subject' varchar(255) NOT NULL default '',
  'message' text NOT NULL,
  'format' tinyint(2) NOT NULL default '0',
  'attachment' varchar(100) NOT NULL default '',
  'totalscore' smallint(4) NOT NULL default '0',
  'mailnow' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_forupost_use_ix' ('userid'),
  KEY 'mdl_forupost_cre_ix' ('created'),
  KEY 'mdl_forupost_mai_ix' ('mailed'),
  KEY 'mdl_forupost_dis_ix' ('discussion'),
  KEY 'mdl_forupost_par_ix' ('parent')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table';
LOCK TABLES 'mdl_forum_posts' WRITE;
/*!40000 ALTER TABLE 'mdl_forum_posts' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_forum_posts' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_forum_queue';
CREATE TABLE 'mdl_forum_queue' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'discussionid' bigint(10) unsigned NOT NULL default '0',
  'postid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_foruqueu_use_ix' ('userid'),
  KEY 'mdl_foruqueu_dis_ix' ('discussionid'),
  KEY 'mdl_foruqueu_pos_ix' ('postid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for';
LOCK TABLES 'mdl_forum_queue' WRITE;
/*!40000 ALTER TABLE 'mdl_forum_queue' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_forum_queue' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_forum_ratings';
CREATE TABLE 'mdl_forum_ratings' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'post' bigint(10) unsigned NOT NULL default '0',
  'time' bigint(10) unsigned NOT NULL default '0',
  'rating' smallint(4) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_forurati_use_ix' ('userid'),
  KEY 'mdl_forurati_pos_ix' ('post')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='forum_ratings table retrofitted from MySQL';
LOCK TABLES 'mdl_forum_ratings' WRITE;
/*!40000 ALTER TABLE 'mdl_forum_ratings' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_forum_ratings' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_forum_read';
CREATE TABLE 'mdl_forum_read' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'forumid' bigint(10) unsigned NOT NULL default '0',
  'discussionid' bigint(10) unsigned NOT NULL default '0',
  'postid' bigint(10) unsigned NOT NULL default '0',
  'firstread' bigint(10) unsigned NOT NULL default '0',
  'lastread' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_foruread_usefor_ix' ('userid','forumid'),
  KEY 'mdl_foruread_usedis_ix' ('userid','discussionid'),
  KEY 'mdl_foruread_usepos_ix' ('userid','postid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts';
LOCK TABLES 'mdl_forum_read' WRITE;
/*!40000 ALTER TABLE 'mdl_forum_read' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_forum_read' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_forum_subscriptions';
CREATE TABLE 'mdl_forum_subscriptions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'forum' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_forusubs_use_ix' ('userid'),
  KEY 'mdl_forusubs_for_ix' ('forum')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum';
LOCK TABLES 'mdl_forum_subscriptions' WRITE;
/*!40000 ALTER TABLE 'mdl_forum_subscriptions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_forum_subscriptions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_forum_track_prefs';
CREATE TABLE 'mdl_forum_track_prefs' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'forumid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_forutracpref_usefor_ix' ('userid','forumid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums';
LOCK TABLES 'mdl_forum_track_prefs' WRITE;
/*!40000 ALTER TABLE 'mdl_forum_track_prefs' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_forum_track_prefs' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_glossary';
CREATE TABLE 'mdl_glossary' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'intro' text NOT NULL,
  'allowduplicatedentries' tinyint(2) unsigned NOT NULL default '0',
  'displayformat' varchar(50) NOT NULL default 'dictionary',
  'mainglossary' tinyint(2) unsigned NOT NULL default '0',
  'showspecial' tinyint(2) unsigned NOT NULL default '1',
  'showalphabet' tinyint(2) unsigned NOT NULL default '1',
  'showall' tinyint(2) unsigned NOT NULL default '1',
  'allowcomments' tinyint(2) unsigned NOT NULL default '0',
  'allowprintview' tinyint(2) unsigned NOT NULL default '1',
  'usedynalink' tinyint(2) unsigned NOT NULL default '1',
  'defaultapproval' tinyint(2) unsigned NOT NULL default '1',
  'globalglossary' tinyint(2) unsigned NOT NULL default '0',
  'entbypage' smallint(3) unsigned NOT NULL default '10',
  'editalways' tinyint(2) unsigned NOT NULL default '0',
  'rsstype' tinyint(2) unsigned NOT NULL default '0',
  'rssarticles' tinyint(2) unsigned NOT NULL default '0',
  'assessed' bigint(10) unsigned NOT NULL default '0',
  'assesstimestart' bigint(10) unsigned NOT NULL default '0',
  'assesstimefinish' bigint(10) unsigned NOT NULL default '0',
  'scale' bigint(10) NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_glos_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all glossaries';
LOCK TABLES 'mdl_glossary' WRITE;
/*!40000 ALTER TABLE 'mdl_glossary' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_glossary' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_glossary_alias';
CREATE TABLE 'mdl_glossary_alias' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'entryid' bigint(10) unsigned NOT NULL default '0',
  'alias' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_glosalia_ent_ix' ('entryid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='entries alias';
LOCK TABLES 'mdl_glossary_alias' WRITE;
/*!40000 ALTER TABLE 'mdl_glossary_alias' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_glossary_alias' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_glossary_categories';
CREATE TABLE 'mdl_glossary_categories' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'glossaryid' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'usedynalink' tinyint(2) unsigned NOT NULL default '1',
  PRIMARY KEY  ('id'),
  KEY 'mdl_gloscate_glo_ix' ('glossaryid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries';
LOCK TABLES 'mdl_glossary_categories' WRITE;
/*!40000 ALTER TABLE 'mdl_glossary_categories' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_glossary_categories' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_glossary_comments';
CREATE TABLE 'mdl_glossary_comments' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'entryid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'entrycomment' text NOT NULL,
  'format' tinyint(2) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_gloscomm_use_ix' ('userid'),
  KEY 'mdl_gloscomm_ent_ix' ('entryid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='comments on glossary entries';
LOCK TABLES 'mdl_glossary_comments' WRITE;
/*!40000 ALTER TABLE 'mdl_glossary_comments' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_glossary_comments' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_glossary_entries';
CREATE TABLE 'mdl_glossary_entries' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'glossaryid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'concept' varchar(255) NOT NULL default '',
  'definition' text NOT NULL,
  'format' tinyint(2) unsigned NOT NULL default '0',
  'attachment' varchar(100) NOT NULL default '',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'teacherentry' tinyint(2) unsigned NOT NULL default '0',
  'sourceglossaryid' bigint(10) unsigned NOT NULL default '0',
  'usedynalink' tinyint(2) unsigned NOT NULL default '1',
  'casesensitive' tinyint(2) unsigned NOT NULL default '0',
  'fullmatch' tinyint(2) unsigned NOT NULL default '1',
  'approved' tinyint(2) unsigned NOT NULL default '1',
  PRIMARY KEY  ('id'),
  KEY 'mdl_glosentr_use_ix' ('userid'),
  KEY 'mdl_glosentr_con_ix' ('concept'),
  KEY 'mdl_glosentr_glo_ix' ('glossaryid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all glossary entries';
LOCK TABLES 'mdl_glossary_entries' WRITE;
/*!40000 ALTER TABLE 'mdl_glossary_entries' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_glossary_entries' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_glossary_entries_categories';
CREATE TABLE 'mdl_glossary_entries_categories' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'categoryid' bigint(10) unsigned NOT NULL default '0',
  'entryid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_glosentrcate_cat_ix' ('categoryid'),
  KEY 'mdl_glosentrcate_ent_ix' ('entryid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry';
LOCK TABLES 'mdl_glossary_entries_categories' WRITE;
/*!40000 ALTER TABLE 'mdl_glossary_entries_categories' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_glossary_entries_categories' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_glossary_formats';
CREATE TABLE 'mdl_glossary_formats' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(50) NOT NULL default '',
  'popupformatname' varchar(50) NOT NULL default '',
  'visible' tinyint(2) unsigned NOT NULL default '1',
  'showgroup' tinyint(2) unsigned NOT NULL default '1',
  'defaultmode' varchar(50) NOT NULL default '',
  'defaulthook' varchar(50) NOT NULL default '',
  'sortkey' varchar(50) NOT NULL default '',
  'sortorder' varchar(50) NOT NULL default '',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats';
LOCK TABLES 'mdl_glossary_formats' WRITE;
/*!40000 ALTER TABLE 'mdl_glossary_formats' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_glossary_formats' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_glossary_ratings';
CREATE TABLE 'mdl_glossary_ratings' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'entryid' bigint(10) unsigned NOT NULL default '0',
  'time' bigint(10) unsigned NOT NULL default '0',
  'rating' smallint(4) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_glosrati_use_ix' ('userid'),
  KEY 'mdl_glosrati_ent_ix' ('entryid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains user ratings for entries';
LOCK TABLES 'mdl_glossary_ratings' WRITE;
/*!40000 ALTER TABLE 'mdl_glossary_ratings' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_glossary_ratings' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_grade_category';
CREATE TABLE 'mdl_grade_category' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(64) NOT NULL default '',
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'drop_x_lowest' bigint(10) unsigned NOT NULL default '0',
  'bonus_points' bigint(10) unsigned NOT NULL default '0',
  'hidden' bigint(10) unsigned NOT NULL default '0',
  'weight' decimal(5,2) NOT NULL default '0.00',
  PRIMARY KEY  ('id'),
  KEY 'mdl_gradcate_cou_ix' ('courseid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to define categories to group activity grades';
LOCK TABLES 'mdl_grade_category' WRITE;
/*!40000 ALTER TABLE 'mdl_grade_category' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_grade_category' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_grade_exceptions';
CREATE TABLE 'mdl_grade_exceptions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'grade_itemid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_gradexce_cou_ix' ('courseid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='individual grades to be skipped for certain students';
LOCK TABLES 'mdl_grade_exceptions' WRITE;
/*!40000 ALTER TABLE 'mdl_grade_exceptions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_grade_exceptions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_grade_item';
CREATE TABLE 'mdl_grade_item' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'category' bigint(10) unsigned NOT NULL default '0',
  'modid' bigint(10) unsigned NOT NULL default '0',
  'cminstance' bigint(10) unsigned NOT NULL default '0',
  'scale_grade' double(11,10) NOT NULL default '1.0000000000',
  'extra_credit' bigint(10) unsigned NOT NULL default '0',
  'sort_order' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_graditem_cou_ix' ('courseid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='items to be graded';
LOCK TABLES 'mdl_grade_item' WRITE;
/*!40000 ALTER TABLE 'mdl_grade_item' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_grade_item' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_grade_letter';
CREATE TABLE 'mdl_grade_letter' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'letter' varchar(8) NOT NULL default 'NA',
  'grade_high' decimal(5,2) NOT NULL default '100.00',
  'grade_low' decimal(5,2) NOT NULL default '0.00',
  PRIMARY KEY  ('id'),
  KEY 'mdl_gradlett_cou_ix' ('courseid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to convert numerical grades to letter grades';
LOCK TABLES 'mdl_grade_letter' WRITE;
/*!40000 ALTER TABLE 'mdl_grade_letter' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_grade_letter' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_grade_preferences';
CREATE TABLE 'mdl_grade_preferences' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'preference' bigint(10) NOT NULL default '0',
  'value' bigint(10) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_gradpref_coupre_uix' ('courseid','preference')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Preferences of the gradebook for each course';
LOCK TABLES 'mdl_grade_preferences' WRITE;
/*!40000 ALTER TABLE 'mdl_grade_preferences' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_grade_preferences' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_groups';
CREATE TABLE 'mdl_groups' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(254) NOT NULL default '',
  'description' text,
  'enrolmentkey' varchar(50) NOT NULL default '',
  'lang' varchar(30) NOT NULL default 'en',
  'theme' varchar(50) NOT NULL default '',
  'picture' bigint(10) unsigned NOT NULL default '0',
  'hidepicture' tinyint(1) unsigned NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.';
LOCK TABLES 'mdl_groups' WRITE;
/*!40000 ALTER TABLE 'mdl_groups' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_groups' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_groups_courses_groupings';
CREATE TABLE 'mdl_groups_courses_groupings' (
  'id' bigint(10) NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'groupingid' bigint(10) unsigned NOT NULL,
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_groucourgrou_cougro2_uix' ('courseid','groupingid'),
  KEY 'mdl_groucourgrou_cou2_ix' ('courseid'),
  KEY 'mdl_groucourgrou_gro2_ix' ('groupingid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a course (or the site).';
LOCK TABLES 'mdl_groups_courses_groupings' WRITE;
/*!40000 ALTER TABLE 'mdl_groups_courses_groupings' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_groups_courses_groupings' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_groups_courses_groups';
CREATE TABLE 'mdl_groups_courses_groups' (
  'id' bigint(10) NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) unsigned NOT NULL,
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_groucourgrou_cougro_uix' ('courseid','groupid'),
  KEY 'mdl_groucourgrou_cou_ix' ('courseid'),
  KEY 'mdl_groucourgrou_gro_ix' ('groupid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a group to a course (or the site).';
LOCK TABLES 'mdl_groups_courses_groups' WRITE;
/*!40000 ALTER TABLE 'mdl_groups_courses_groups' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_groups_courses_groups' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_groups_groupings';
CREATE TABLE 'mdl_groups_groupings' (
  'id' bigint(10) NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  'description' text,
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'viewowngroup' tinyint(1) unsigned NOT NULL default '1',
  'viewallgroupsmembers' tinyint(1) unsigned NOT NULL default '0',
  'viewallgroupsactivities' tinyint(1) unsigned NOT NULL default '0',
  'teachersgroupmark' tinyint(1) unsigned NOT NULL default '0',
  'teachersgroupview' tinyint(1) unsigned NOT NULL default '0',
  'teachersoverride' tinyint(1) unsigned NOT NULL default '0',
  'teacherdeletable' tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups.';
LOCK TABLES 'mdl_groups_groupings' WRITE;
/*!40000 ALTER TABLE 'mdl_groups_groupings' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_groups_groupings' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_groups_groupings_groups';
CREATE TABLE 'mdl_groups_groupings_groups' (
  'id' bigint(10) NOT NULL auto_increment,
  'groupingid' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) unsigned NOT NULL,
  'timeadded' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_grougrougrou_grogro_uix' ('groupingid','groupid'),
  KEY 'mdl_grougrougrou_gro_ix' ('groupingid'),
  KEY 'mdl_grougrougrou_gro2_ix' ('groupid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a group to a grouping.';
LOCK TABLES 'mdl_groups_groupings_groups' WRITE;
/*!40000 ALTER TABLE 'mdl_groups_groupings_groups' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_groups_groupings_groups' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_groups_members';
CREATE TABLE 'mdl_groups_members' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'groupid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'timeadded' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_groumemb_grouse_uix' ('groupid','userid'),
  KEY 'mdl_groumemb_gro_ix' ('groupid'),
  KEY 'mdl_groumemb_use_ix' ('userid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.';
LOCK TABLES 'mdl_groups_members' WRITE;
/*!40000 ALTER TABLE 'mdl_groups_members' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_groups_members' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_hotpot';
CREATE TABLE 'mdl_hotpot' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'summary' text NOT NULL,
  'timeopen' bigint(10) unsigned NOT NULL default '0',
  'timeclose' bigint(10) unsigned NOT NULL default '0',
  'location' smallint(4) unsigned NOT NULL default '0',
  'reference' varchar(255) NOT NULL default '',
  'outputformat' smallint(4) unsigned NOT NULL default '1',
  'navigation' smallint(4) unsigned NOT NULL default '1',
  'studentfeedback' smallint(4) unsigned NOT NULL default '0',
  'studentfeedbackurl' varchar(255) NOT NULL default '',
  'forceplugins' smallint(4) unsigned NOT NULL default '0',
  'shownextquiz' smallint(4) unsigned NOT NULL default '0',
  'review' smallint(4) NOT NULL default '0',
  'grade' bigint(10) NOT NULL default '0',
  'grademethod' smallint(4) NOT NULL default '1',
  'attempts' mediumint(6) NOT NULL default '0',
  'password' varchar(255) NOT NULL default '',
  'subnet' varchar(255) NOT NULL default '',
  'clickreporting' smallint(4) unsigned NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about Hot Potatoes quizzes';
LOCK TABLES 'mdl_hotpot' WRITE;
/*!40000 ALTER TABLE 'mdl_hotpot' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_hotpot' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_hotpot_attempts';
CREATE TABLE 'mdl_hotpot_attempts' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'hotpot' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'starttime' bigint(10) unsigned NOT NULL default '0',
  'endtime' bigint(10) unsigned NOT NULL default '0',
  'score' mediumint(6) unsigned NOT NULL default '0',
  'penalties' mediumint(6) unsigned NOT NULL default '0',
  'attempt' mediumint(6) unsigned NOT NULL default '0',
  'timestart' bigint(10) unsigned NOT NULL default '0',
  'timefinish' bigint(10) unsigned NOT NULL default '0',
  'status' smallint(4) unsigned NOT NULL default '1',
  'clickreportid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_hotpatte_use_ix' ('userid'),
  KEY 'mdl_hotpatte_hot_ix' ('hotpot')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about Hot Potatoes quiz attempts';
LOCK TABLES 'mdl_hotpot_attempts' WRITE;
/*!40000 ALTER TABLE 'mdl_hotpot_attempts' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_hotpot_attempts' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_hotpot_details';
CREATE TABLE 'mdl_hotpot_details' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'attempt' bigint(10) unsigned NOT NULL default '0',
  'details' text,
  PRIMARY KEY  ('id'),
  KEY 'mdl_hotpdeta_att_ix' ('attempt')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='raw details (as XML) of Hot Potatoes quiz attempts';
LOCK TABLES 'mdl_hotpot_details' WRITE;
/*!40000 ALTER TABLE 'mdl_hotpot_details' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_hotpot_details' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_hotpot_questions';
CREATE TABLE 'mdl_hotpot_questions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' text NOT NULL,
  'type' smallint(4) unsigned NOT NULL default '0',
  'text' bigint(10) unsigned NOT NULL default '0',
  'hotpot' bigint(10) unsigned NOT NULL default '0',
  'md5key' varchar(32) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_hotpques_md5_ix' ('md5key'),
  KEY 'mdl_hotpques_hot_ix' ('hotpot')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about questions in Hot Potatoes quiz attempts';
LOCK TABLES 'mdl_hotpot_questions' WRITE;
/*!40000 ALTER TABLE 'mdl_hotpot_questions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_hotpot_questions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_hotpot_responses';
CREATE TABLE 'mdl_hotpot_responses' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'attempt' bigint(10) unsigned NOT NULL default '0',
  'question' bigint(10) unsigned NOT NULL default '0',
  'score' mediumint(6) NOT NULL default '0',
  'weighting' mediumint(6) NOT NULL default '0',
  'correct' varchar(255) NOT NULL default '',
  'wrong' varchar(255) NOT NULL default '',
  'ignored' varchar(255) NOT NULL default '',
  'hints' mediumint(6) unsigned NOT NULL default '0',
  'clues' mediumint(6) unsigned NOT NULL default '0',
  'checks' mediumint(6) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_hotpresp_att_ix' ('attempt'),
  KEY 'mdl_hotpresp_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about responses in Hot Potatoes quiz attempts';
LOCK TABLES 'mdl_hotpot_responses' WRITE;
/*!40000 ALTER TABLE 'mdl_hotpot_responses' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_hotpot_responses' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_hotpot_strings';
CREATE TABLE 'mdl_hotpot_strings' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'string' text NOT NULL,
  'md5key' varchar(32) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_hotpstri_md5_ix' ('md5key')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='strings used in Hot Potatoes questions and responses';
LOCK TABLES 'mdl_hotpot_strings' WRITE;
/*!40000 ALTER TABLE 'mdl_hotpot_strings' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_hotpot_strings' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_journal';
CREATE TABLE 'mdl_journal' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'intro' text NOT NULL,
  'introformat' tinyint(2) NOT NULL default '0',
  'days' mediumint(5) unsigned NOT NULL default '7',
  'assessed' bigint(10) NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_jour_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='data for each journal';
LOCK TABLES 'mdl_journal' WRITE;
/*!40000 ALTER TABLE 'mdl_journal' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_journal' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_journal_entries';
CREATE TABLE 'mdl_journal_entries' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'journal' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'modified' bigint(10) unsigned NOT NULL default '0',
  'text' text NOT NULL,
  'format' tinyint(2) NOT NULL default '0',
  'rating' bigint(10) default '0',
  'entrycomment' text,
  'teacher' bigint(10) unsigned NOT NULL default '0',
  'timemarked' bigint(10) unsigned NOT NULL default '0',
  'mailed' tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_jourentr_use_ix' ('userid'),
  KEY 'mdl_jourentr_jou_ix' ('journal')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='All the journal entries of all people';
LOCK TABLES 'mdl_journal_entries' WRITE;
/*!40000 ALTER TABLE 'mdl_journal_entries' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_journal_entries' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_label';
CREATE TABLE 'mdl_label' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'content' text NOT NULL,
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_labe_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines labels';
LOCK TABLES 'mdl_label' WRITE;
/*!40000 ALTER TABLE 'mdl_label' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_label' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lams';
CREATE TABLE 'mdl_lams' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'introduction' text NOT NULL,
  'learning_session_id' bigint(20) default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_lams_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='LAMS activity';
LOCK TABLES 'mdl_lams' WRITE;
/*!40000 ALTER TABLE 'mdl_lams' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lams' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson';
CREATE TABLE 'mdl_lesson' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'practice' smallint(3) unsigned NOT NULL default '0',
  'modattempts' smallint(3) unsigned NOT NULL default '0',
  'usepassword' smallint(3) unsigned NOT NULL default '0',
  'password' varchar(32) NOT NULL default '',
  'dependency' bigint(10) unsigned NOT NULL default '0',
  'conditions' text NOT NULL,
  'grade' smallint(3) NOT NULL default '0',
  'custom' smallint(3) unsigned NOT NULL default '0',
  'ongoing' smallint(3) unsigned NOT NULL default '0',
  'usemaxgrade' smallint(3) NOT NULL default '0',
  'maxanswers' smallint(3) unsigned NOT NULL default '4',
  'maxattempts' smallint(3) unsigned NOT NULL default '5',
  'review' smallint(3) unsigned NOT NULL default '0',
  'nextpagedefault' smallint(3) unsigned NOT NULL default '0',
  'feedback' smallint(3) unsigned NOT NULL default '1',
  'minquestions' smallint(3) unsigned NOT NULL default '0',
  'maxpages' smallint(3) unsigned NOT NULL default '0',
  'timed' smallint(3) unsigned NOT NULL default '0',
  'maxtime' bigint(10) unsigned NOT NULL default '0',
  'retake' smallint(3) unsigned NOT NULL default '1',
  'activitylink' bigint(10) unsigned NOT NULL default '0',
  'mediafile' varchar(255) NOT NULL default '',
  'mediaheight' bigint(10) unsigned NOT NULL default '100',
  'mediawidth' bigint(10) unsigned NOT NULL default '650',
  'mediaclose' smallint(3) unsigned NOT NULL default '0',
  'slideshow' smallint(3) unsigned NOT NULL default '0',
  'width' bigint(10) unsigned NOT NULL default '640',
  'height' bigint(10) unsigned NOT NULL default '480',
  'bgcolor' varchar(7) NOT NULL default '#FFFFFF',
  'displayleft' smallint(3) unsigned NOT NULL default '0',
  'displayleftif' smallint(3) unsigned NOT NULL default '0',
  'progressbar' smallint(3) unsigned NOT NULL default '0',
  'highscores' smallint(3) unsigned NOT NULL default '0',
  'maxhighscores' bigint(10) unsigned NOT NULL default '0',
  'available' bigint(10) unsigned NOT NULL default '0',
  'deadline' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_less_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson';
LOCK TABLES 'mdl_lesson' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson_answers';
CREATE TABLE 'mdl_lesson_answers' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'lessonid' bigint(10) unsigned NOT NULL default '0',
  'pageid' bigint(10) unsigned NOT NULL default '0',
  'jumpto' bigint(11) NOT NULL default '0',
  'grade' smallint(3) unsigned NOT NULL default '0',
  'score' bigint(10) NOT NULL default '0',
  'flags' smallint(3) unsigned NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'answer' text,
  'response' text,
  PRIMARY KEY  ('id'),
  KEY 'mdl_lessansw_les_ix' ('lessonid'),
  KEY 'mdl_lessansw_pag_ix' ('pageid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers';
LOCK TABLES 'mdl_lesson_answers' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson_answers' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson_answers' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson_attempts';
CREATE TABLE 'mdl_lesson_attempts' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'lessonid' bigint(10) unsigned NOT NULL default '0',
  'pageid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'answerid' bigint(10) unsigned NOT NULL default '0',
  'retry' smallint(3) unsigned NOT NULL default '0',
  'correct' bigint(10) unsigned NOT NULL default '0',
  'useranswer' text,
  'timeseen' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_lessatte_use_ix' ('userid'),
  KEY 'mdl_lessatte_les_ix' ('lessonid'),
  KEY 'mdl_lessatte_pag_ix' ('pageid'),
  KEY 'mdl_lessatte_ans_ix' ('answerid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts';
LOCK TABLES 'mdl_lesson_attempts' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson_attempts' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson_attempts' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson_branch';
CREATE TABLE 'mdl_lesson_branch' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'lessonid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'pageid' bigint(10) unsigned NOT NULL default '0',
  'retry' bigint(10) unsigned NOT NULL default '0',
  'flag' smallint(3) unsigned NOT NULL default '0',
  'timeseen' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_lessbran_use_ix' ('userid'),
  KEY 'mdl_lessbran_les_ix' ('lessonid'),
  KEY 'mdl_lessbran_pag_ix' ('pageid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user';
LOCK TABLES 'mdl_lesson_branch' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson_branch' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson_branch' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson_default';
CREATE TABLE 'mdl_lesson_default' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'practice' smallint(3) unsigned NOT NULL default '0',
  'modattempts' smallint(3) unsigned NOT NULL default '0',
  'usepassword' smallint(3) unsigned NOT NULL default '0',
  'password' varchar(32) NOT NULL default '',
  'conditions' text NOT NULL,
  'grade' smallint(3) NOT NULL default '0',
  'custom' smallint(3) unsigned NOT NULL default '0',
  'ongoing' smallint(3) unsigned NOT NULL default '0',
  'usemaxgrade' smallint(3) unsigned NOT NULL default '0',
  'maxanswers' smallint(3) unsigned NOT NULL default '4',
  'maxattempts' smallint(3) unsigned NOT NULL default '5',
  'review' smallint(3) unsigned NOT NULL default '0',
  'nextpagedefault' smallint(3) unsigned NOT NULL default '0',
  'feedback' smallint(3) unsigned NOT NULL default '1',
  'minquestions' smallint(3) unsigned NOT NULL default '0',
  'maxpages' smallint(3) unsigned NOT NULL default '0',
  'timed' smallint(3) unsigned NOT NULL default '0',
  'maxtime' bigint(10) unsigned NOT NULL default '0',
  'retake' smallint(3) unsigned NOT NULL default '1',
  'mediaheight' bigint(10) unsigned NOT NULL default '100',
  'mediawidth' bigint(10) unsigned NOT NULL default '650',
  'mediaclose' smallint(3) unsigned NOT NULL default '0',
  'slideshow' smallint(3) unsigned NOT NULL default '0',
  'width' bigint(10) unsigned NOT NULL default '640',
  'height' bigint(10) unsigned NOT NULL default '480',
  'bgcolor' varchar(7) default '#FFFFFF',
  'displayleft' smallint(3) unsigned NOT NULL default '0',
  'displayleftif' smallint(3) unsigned NOT NULL default '0',
  'progressbar' smallint(3) unsigned NOT NULL default '0',
  'highscores' smallint(3) unsigned NOT NULL default '0',
  'maxhighscores' bigint(10) NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_default';
LOCK TABLES 'mdl_lesson_default' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson_default' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson_default' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson_grades';
CREATE TABLE 'mdl_lesson_grades' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'lessonid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'grade' double unsigned NOT NULL default '0',
  'late' smallint(3) unsigned NOT NULL default '0',
  'completed' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_lessgrad_use_ix' ('userid'),
  KEY 'mdl_lessgrad_les_ix' ('lessonid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades';
LOCK TABLES 'mdl_lesson_grades' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson_grades' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson_grades' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson_high_scores';
CREATE TABLE 'mdl_lesson_high_scores' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'lessonid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'gradeid' bigint(10) unsigned NOT NULL default '0',
  'nickname' varchar(5) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_lesshighscor_use_ix' ('userid'),
  KEY 'mdl_lesshighscor_les_ix' ('lessonid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson';
LOCK TABLES 'mdl_lesson_high_scores' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson_high_scores' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson_high_scores' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson_pages';
CREATE TABLE 'mdl_lesson_pages' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'lessonid' bigint(10) unsigned NOT NULL default '0',
  'prevpageid' bigint(10) unsigned NOT NULL default '0',
  'nextpageid' bigint(10) unsigned NOT NULL default '0',
  'qtype' smallint(3) unsigned NOT NULL default '0',
  'qoption' smallint(3) unsigned NOT NULL default '0',
  'layout' smallint(3) unsigned NOT NULL default '1',
  'display' smallint(3) unsigned NOT NULL default '1',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'title' varchar(255) NOT NULL default '',
  'contents' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_lesspage_les_ix' ('lessonid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages';
LOCK TABLES 'mdl_lesson_pages' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson_pages' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson_pages' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_lesson_timer';
CREATE TABLE 'mdl_lesson_timer' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'lessonid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'starttime' bigint(10) unsigned NOT NULL default '0',
  'lessontime' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_lesstime_use_ix' ('userid'),
  KEY 'mdl_lesstime_les_ix' ('lessonid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson';
LOCK TABLES 'mdl_lesson_timer' WRITE;
/*!40000 ALTER TABLE 'mdl_lesson_timer' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_lesson_timer' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_log';
CREATE TABLE 'mdl_log' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'time' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'ip' varchar(15) NOT NULL default '',
  'course' bigint(10) unsigned NOT NULL default '0',
  'module' varchar(20) NOT NULL default '',
  'cmid' bigint(10) unsigned NOT NULL default '0',
  'action' varchar(40) NOT NULL default '',
  'url' varchar(100) NOT NULL default '',
  'info' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_log_timcoumodact_ix' ('time','course','module','action'),
  KEY 'mdl_log_coumodact_ix' ('course','module','action'),
  KEY 'mdl_log_couuse_ix' ('course','userid'),
  KEY 'mdl_log_use_ix' ('userid'),
  KEY 'mdl_log_inf_ix' ('info')
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible';
LOCK TABLES 'mdl_log' WRITE;
/*!40000 ALTER TABLE 'mdl_log' DISABLE KEYS */;
INSERT INTO 'mdl_log' VALUES (1,1201718788,2,'140.211.18.56',1,'user',0,'update','view.php?id=2&course=1',' '),(2,1201718788,2,'140.211.18.56',1,'upload',0,'upload','http://template.orvsd.org/moodle/user/editadvanced.php?id=2','/var/www/localhost/template.orvsd.org/moodledata/user/0/2/logo.png'),(3,1201718847,2,'140.211.18.56',1,'course',0,'view','view.php?id=1','1');
/*!40000 ALTER TABLE 'mdl_log' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_log_display';
CREATE TABLE 'mdl_log_display' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'module' varchar(20) NOT NULL default '',
  'action' varchar(40) NOT NULL default '',
  'mtable' varchar(30) NOT NULL default '',
  'field' varchar(200) NOT NULL default '',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_logdisp_modact_uix' ('module','action')
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie';
LOCK TABLES 'mdl_log_display' WRITE;
/*!40000 ALTER TABLE 'mdl_log_display' DISABLE KEYS */;
INSERT INTO 'mdl_log_display' VALUES (1,'user','view','user','CONCAT(firstname,\' \',lastname)'),(2,'course','user report','user','CONCAT(firstname,\' \',lastname)'),(3,'course','view','course','fullname'),(4,'course','update','course','fullname'),(5,'course','enrol','course','fullname'),(6,'course','report log','course','fullname'),(7,'course','report live','course','fullname'),(8,'course','report outline','course','fullname'),(9,'course','report participation','course','fullname'),(10,'course','report stats','course','fullname'),(11,'message','write','user','CONCAT(firstname,\' \',lastname)'),(12,'message','read','user','CONCAT(firstname,\' \',lastname)'),(13,'message','add contact','user','CONCAT(firstname,\' \',lastname)'),(14,'message','remove contact','user','CONCAT(firstname,\' \',lastname)'),(15,'message','block contact','user','CONCAT(firstname,\' \',lastname)'),(16,'message','unblock contact','user','CONCAT(firstname,\' \',lastname)'),(17,'group','view','groups','name'),(18,'assignment','view','assignment','name'),(19,'assignment','add','assignment','name'),(20,'assignment','update','assignment','name'),(21,'assignment','view submission','assignment','name'),(22,'assignment','upload','assignment','name'),(23,'chat','view','chat','name'),(24,'chat','add','chat','name'),(25,'chat','update','chat','name'),(26,'chat','report','chat','name'),(27,'chat','talk','chat','name'),(28,'choice','view','choice','name'),(29,'choice','update','choice','name'),(30,'choice','add','choice','name'),(31,'choice','report','choice','name'),(32,'choice','choose','choice','name'),(33,'choice','choose again','choice','name'),(34,'data','view','data','name'),(35,'data','add','data','name'),(36,'data','update','data','name'),(37,'data','record delete','data','name'),(38,'data','fields add','data_fields','name'),(39,'data','fields update','data_fields','name'),(40,'data','templates saved','data','name'),(41,'data','templates def','data','name'),(42,'forum','add','forum','name'),(43,'forum','update','forum','name'),(44,'forum','add discussion','forum_discussions','name'),(45,'forum','add post','forum_posts','subject'),(46,'forum','update post','forum_posts','subject'),(47,'forum','user report','user','CONCAT(firstname,\' \',lastname)'),(48,'forum','move discussion','forum_discussions','name'),(49,'forum','view subscribers','forum','name'),(50,'forum','view discussion','forum_discussions','name'),(51,'forum','view forum','forum','name'),(52,'forum','subscribe','forum','name'),(53,'forum','unsubscribe','forum','name'),(54,'glossary','add','glossary','name'),(55,'glossary','update','glossary','name'),(56,'glossary','view','glossary','name'),(57,'glossary','view all','glossary','name'),(58,'glossary','add entry','glossary','name'),(59,'glossary','update entry','glossary','name'),(60,'glossary','add category','glossary','name'),(61,'glossary','update category','glossary','name'),(62,'glossary','delete category','glossary','name'),(63,'glossary','add comment','glossary','name'),(64,'glossary','update comment','glossary','name'),(65,'glossary','delete comment','glossary','name'),(66,'glossary','approve entry','glossary','name'),(67,'glossary','view entry','glossary_entries','concept'),(68,'journal','view','journal','name'),(69,'journal','add entry','journal','name'),(70,'journal','update entry','journal','name'),(71,'journal','view responses','journal','name'),(72,'label','add','quiz','name'),(73,'label','update','quiz','name'),(74,'lesson','start','lesson','name'),(75,'lesson','end','lesson','name'),(76,'lesson','view','lesson_pages','title'),(77,'quiz','add','quiz','name'),(78,'quiz','update','quiz','name'),(79,'quiz','view','quiz','name'),(80,'quiz','report','quiz','name'),(81,'quiz','attempt','quiz','name'),(82,'quiz','submit','quiz','name'),(83,'quiz','review','quiz','name'),(84,'quiz','editquestions','quiz','name'),(85,'quiz','preview','quiz','name'),(86,'quiz','start attempt','quiz','name'),(87,'quiz','close attempt','quiz','name'),(88,'quiz','continue attempt','quiz','name'),(89,'resource','view','resource','name'),(90,'resource','update','resource','name'),(91,'resource','add','resource','name'),(92,'scorm','view','scorm','name'),(93,'scorm','review','scorm','name'),(94,'scorm','update','scorm','name'),(95,'scorm','add','scorm','name'),(96,'survey','add','survey','name'),(97,'survey','update','survey','name'),(98,'survey','download','survey','name'),(99,'survey','view form','survey','name'),(100,'survey','view graph','survey','name'),(101,'survey','view report','survey','name'),(102,'survey','submit','survey','name'),(103,'workshop','assessments','workshop','name'),(104,'workshop','close','workshop','name'),(105,'workshop','display','workshop','name'),(106,'workshop','resubmit','workshop','name'),(107,'workshop','set up','workshop','name'),(108,'workshop','submissions','workshop','name'),(109,'workshop','view','workshop','name'),(110,'workshop','update','workshop','name');
/*!40000 ALTER TABLE 'mdl_log_display' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_message';
CREATE TABLE 'mdl_message' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'useridfrom' bigint(10) NOT NULL default '0',
  'useridto' bigint(10) NOT NULL default '0',
  'message' text NOT NULL,
  'format' smallint(4) unsigned NOT NULL default '0',
  'timecreated' bigint(10) NOT NULL default '0',
  'messagetype' varchar(50) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_mess_use_ix' ('useridfrom'),
  KEY 'mdl_mess_use2_ix' ('useridto')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages';
LOCK TABLES 'mdl_message' WRITE;
/*!40000 ALTER TABLE 'mdl_message' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_message' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_message_contacts';
CREATE TABLE 'mdl_message_contacts' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'contactid' bigint(10) unsigned NOT NULL default '0',
  'blocked' tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_messcont_usecon_uix' ('userid','contactid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users';
LOCK TABLES 'mdl_message_contacts' WRITE;
/*!40000 ALTER TABLE 'mdl_message_contacts' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_message_contacts' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_message_read';
CREATE TABLE 'mdl_message_read' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'useridfrom' bigint(10) NOT NULL default '0',
  'useridto' bigint(10) NOT NULL default '0',
  'message' text NOT NULL,
  'format' smallint(4) unsigned NOT NULL default '0',
  'timecreated' bigint(10) NOT NULL default '0',
  'timeread' bigint(10) NOT NULL default '0',
  'messagetype' varchar(50) NOT NULL default '',
  'mailed' tinyint(1) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_messread_use_ix' ('useridfrom'),
  KEY 'mdl_messread_use2_ix' ('useridto')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read';
LOCK TABLES 'mdl_message_read' WRITE;
/*!40000 ALTER TABLE 'mdl_message_read' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_message_read' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_enrol_assignments';
CREATE TABLE 'mdl_mnet_enrol_assignments' (
  'id' bigint(10) NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'hostid' bigint(10) unsigned NOT NULL default '0',
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'rolename' varchar(255) NOT NULL default '',
  'enroltime' bigint(10) unsigned NOT NULL default '0',
  'enroltype' varchar(20) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_mnetenroassi_hoscou_ix' ('hostid','courseid'),
  KEY 'mdl_mnetenroassi_use_ix' ('userid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about enrolments on courses on remote hosts';
LOCK TABLES 'mdl_mnet_enrol_assignments' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_enrol_assignments' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_mnet_enrol_assignments' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_enrol_course';
CREATE TABLE 'mdl_mnet_enrol_course' (
  'id' bigint(10) NOT NULL auto_increment,
  'hostid' bigint(10) unsigned NOT NULL default '0',
  'remoteid' bigint(10) unsigned NOT NULL default '0',
  'cat_id' bigint(10) unsigned NOT NULL default '0',
  'cat_name' varchar(255) NOT NULL default '',
  'cat_description' mediumtext NOT NULL,
  'sortorder' smallint(4) unsigned NOT NULL default '0',
  'fullname' varchar(254) NOT NULL default '',
  'shortname' varchar(15) NOT NULL default '',
  'idnumber' varchar(100) NOT NULL default '',
  'summary' mediumtext NOT NULL,
  'startdate' bigint(10) unsigned NOT NULL default '0',
  'cost' varchar(10) NOT NULL default '',
  'currency' varchar(3) NOT NULL default '',
  'defaultroleid' smallint(4) unsigned NOT NULL default '0',
  'defaultrolename' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_mnetenrocour_hosrem_uix' ('hostid','remoteid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about courses on remote hosts';
LOCK TABLES 'mdl_mnet_enrol_course' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_enrol_course' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_mnet_enrol_course' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_host';
CREATE TABLE 'mdl_mnet_host' (
  'id' bigint(10) NOT NULL auto_increment,
  'deleted' tinyint(1) unsigned NOT NULL default '0',
  'wwwroot' varchar(255) NOT NULL default '',
  'ip_address' varchar(39) NOT NULL default '',
  'name' varchar(80) NOT NULL default '',
  'public_key' mediumtext NOT NULL,
  'public_key_expires' bigint(10) unsigned NOT NULL default '0',
  'transport' tinyint(2) unsigned NOT NULL default '0',
  'portno' tinyint(2) unsigned NOT NULL default '0',
  'last_connect_time' bigint(10) unsigned NOT NULL default '0',
  'last_log_id' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC';
LOCK TABLES 'mdl_mnet_host' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_host' DISABLE KEYS */;
INSERT INTO 'mdl_mnet_host' VALUES (1,0,'http://template.orvsd.org/moodle','140.211.167.134','','',0,0,0,0,0),(2,0,'','','All Hosts','',0,0,0,0,0);
/*!40000 ALTER TABLE 'mdl_mnet_host' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_host2service';
CREATE TABLE 'mdl_mnet_host2service' (
  'id' bigint(10) NOT NULL auto_increment,
  'hostid' bigint(10) unsigned NOT NULL default '0',
  'serviceid' bigint(10) unsigned NOT NULL default '0',
  'publish' tinyint(1) unsigned NOT NULL default '0',
  'subscribe' tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_mnethost_hosser_uix' ('hostid','serviceid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host';
LOCK TABLES 'mdl_mnet_host2service' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_host2service' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_mnet_host2service' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_log';
CREATE TABLE 'mdl_mnet_log' (
  'id' bigint(10) NOT NULL auto_increment,
  'hostid' bigint(10) unsigned NOT NULL default '0',
  'remoteid' bigint(10) unsigned NOT NULL default '0',
  'time' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'ip' varchar(15) NOT NULL default '',
  'course' bigint(10) unsigned NOT NULL default '0',
  'coursename' varchar(40) NOT NULL default '',
  'module' varchar(20) NOT NULL default '',
  'cmid' bigint(10) unsigned NOT NULL default '0',
  'action' varchar(40) NOT NULL default '',
  'url' varchar(100) NOT NULL default '',
  'info' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_mnetlog_hosusecou_ix' ('hostid','userid','course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';
LOCK TABLES 'mdl_mnet_log' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_log' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_mnet_log' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_rpc';
CREATE TABLE 'mdl_mnet_rpc' (
  'id' bigint(10) NOT NULL auto_increment,
  'function_name' varchar(40) NOT NULL default '',
  'xmlrpc_path' varchar(80) NOT NULL default '',
  'parent_type' varchar(6) NOT NULL default '',
  'parent' varchar(20) NOT NULL default '',
  'enabled' tinyint(1) unsigned NOT NULL default '0',
  'help' mediumtext NOT NULL,
  'profile' mediumtext NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_mnetrpc_enaxml_ix' ('enabled','xmlrpc_path')
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to';
LOCK TABLES 'mdl_mnet_rpc' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_rpc' DISABLE KEYS */;
INSERT INTO 'mdl_mnet_rpc' VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',0,'Return user data for the provided token, compare with user_agent string.','a:3:{i:0;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:45:\"token - The unique ID provided by remotehost.\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"useragent - User Agent string.\";}}'),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',0,'Receives an array of usernames from a remote machine and prods their\\n sessions to keep them alive','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"\"All ok\" or an error message\";}i:1;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:29:\"array - An array of usernames\";}}'),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',0,'The IdP uses this function to kill child sessions on other hosts','a:3:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"username - Username for session to kill\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"useragent - SHA1 hash of user agent to look for\";}}'),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',0,'Receives an array of log entries from an SP and adds them to the mnet_log\\n table','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"\"All ok\" or an error message\";}i:1;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:29:\"array - An array of usernames\";}}'),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',0,'Returns the user\'s image as a base64 encoded string.','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:17:\"The encoded image\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:29:\"username - The id of the user\";}}'),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',0,'Returns the theme information and logo url as strings.','a:1:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}'),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',0,'Invoke this function _on_ the IDP to update it with enrolment info local to\\n the SP right after calling user_authorise()\\n \\n Normally called by the SP after calling','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";N;}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:23:\"username - The username\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:77:\"courses - Assoc array of courses following the structure of mnet_enrol_course\";}}'),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',0,'Poll the IdP server to let it know that a user it has authenticated is still\\n online','a:1:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";N;}}'),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',0,'TODO:Untested When the IdP requests that child sessions are terminated,\\n this function will be called on each of the child hosts. The machine that\\n calls the function (over xmlrpc) provides us with the mnethostid we need.','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:15:\"True on success\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"username - Username for session to kill\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"useragent - SHA1 hash of user agent to look for\";}}'),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',0,'Does Foo','a:1:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:47:\"Whether the user can login from the remote host\";}}'),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',0,'No description given.','a:2:{i:0;a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}i:1;s:6:\"userid\";}'),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',0,'Enrols user to course with the default role','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:41:\"Whether the enrolment has been successful\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"user - The username of the remote use\";}i:2;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:37:\"courseid - The id of the local course\";}}'),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',0,'Unenrol a user from a course','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:47:\"Whether the user can login from the remote host\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:19:\"user - The username\";}i:2;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:37:\"courseid - The id of the local course\";}}'),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',0,'Get a list of users from the client server who are enrolled in a course','a:3:{i:0;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:39:\"Array of usernames who are homed on the\";}i:1;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:24:\"courseid - The Course ID\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"roles - Comma-separated list of role shortnames\";}}');
/*!40000 ALTER TABLE 'mdl_mnet_rpc' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_service';
CREATE TABLE 'mdl_mnet_service' (
  'id' bigint(10) NOT NULL auto_increment,
  'name' varchar(40) NOT NULL default '',
  'description' varchar(40) NOT NULL default '',
  'apiversion' varchar(10) NOT NULL default '',
  'offer' tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions';
LOCK TABLES 'mdl_mnet_service' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_service' DISABLE KEYS */;
INSERT INTO 'mdl_mnet_service' VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1);
/*!40000 ALTER TABLE 'mdl_mnet_service' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_service2rpc';
CREATE TABLE 'mdl_mnet_service2rpc' (
  'id' bigint(10) NOT NULL auto_increment,
  'serviceid' bigint(10) unsigned NOT NULL default '0',
  'rpcid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_mnetserv_rpcser_uix' ('rpcid','serviceid')
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';
LOCK TABLES 'mdl_mnet_service2rpc' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_service2rpc' DISABLE KEYS */;
INSERT INTO 'mdl_mnet_service2rpc' VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14);
/*!40000 ALTER TABLE 'mdl_mnet_service2rpc' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_session';
CREATE TABLE 'mdl_mnet_session' (
  'id' bigint(10) NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'username' varchar(100) NOT NULL default '',
  'token' varchar(40) NOT NULL default '',
  'mnethostid' bigint(10) unsigned NOT NULL default '0',
  'useragent' varchar(40) NOT NULL default '',
  'confirm_timeout' bigint(10) unsigned NOT NULL default '0',
  'session_id' varchar(40) NOT NULL default '',
  'expires' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_mnetsess_tok_uix' ('token')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';
LOCK TABLES 'mdl_mnet_session' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_session' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_mnet_session' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_mnet_sso_access_control';
CREATE TABLE 'mdl_mnet_sso_access_control' (
  'id' bigint(10) NOT NULL auto_increment,
  'username' varchar(100) NOT NULL default '',
  'mnet_host_id' bigint(10) unsigned NOT NULL default '0',
  'accessctrl' varchar(20) NOT NULL default 'allow',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_mnetssoaccecont_mneuse_uix' ('mnet_host_id','username')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov';
LOCK TABLES 'mdl_mnet_sso_access_control' WRITE;
/*!40000 ALTER TABLE 'mdl_mnet_sso_access_control' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_mnet_sso_access_control' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_modules';
CREATE TABLE 'mdl_modules' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(20) NOT NULL default '',
  'version' bigint(10) NOT NULL default '0',
  'cron' bigint(10) unsigned NOT NULL default '0',
  'lastcron' bigint(10) unsigned NOT NULL default '0',
  'search' varchar(255) NOT NULL default '',
  'visible' tinyint(1) NOT NULL default '1',
  PRIMARY KEY  ('id'),
  KEY 'mdl_modu_nam_ix' ('name')
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='modules available in the site';
LOCK TABLES 'mdl_modules' WRITE;
/*!40000 ALTER TABLE 'mdl_modules' DISABLE KEYS */;
INSERT INTO 'mdl_modules' VALUES (1,'assignment',2007020200,60,0,'',1),(2,'chat',2007020200,300,0,'',1),(3,'choice',2007020200,0,0,'',1),(4,'data',2007022601,60,0,'',1),(5,'forum',2007020203,60,0,'',1),(6,'glossary',2007020200,0,0,'',1),(7,'hotpot',2007020202,0,0,'',0),(8,'journal',2007020200,60,0,'',0),(9,'label',2007020200,0,0,'',1),(10,'lams',2007020200,0,0,'',0),(11,'lesson',2007020201,0,0,'',1),(12,'quiz',2007020200,0,0,'',1),(13,'resource',2007020200,0,0,'',1),(14,'scorm',2007070301,300,0,'',1),(15,'survey',2007020200,0,0,'',1),(16,'wiki',2007020200,3600,0,'',1),(17,'workshop',2007020200,60,0,'',1);
/*!40000 ALTER TABLE 'mdl_modules' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_post';
CREATE TABLE 'mdl_post' (
  'id' bigint(10) NOT NULL auto_increment,
  'module' varchar(20) NOT NULL default '',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) unsigned NOT NULL default '0',
  'moduleid' bigint(10) unsigned NOT NULL default '0',
  'coursemoduleid' bigint(10) unsigned NOT NULL default '0',
  'subject' varchar(128) NOT NULL default '',
  'summary' longtext,
  'content' longtext,
  'uniquehash' varchar(128) NOT NULL default '',
  'rating' bigint(10) unsigned NOT NULL default '0',
  'format' bigint(10) unsigned NOT NULL default '0',
  'attachment' varchar(100) default NULL,
  'publishstate' enum('draft','site','public') NOT NULL default 'draft',
  'lastmodified' bigint(10) unsigned NOT NULL default '0',
  'created' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_post_iduse_uix' ('id','userid'),
  KEY 'mdl_post_las_ix' ('lastmodified'),
  KEY 'mdl_post_mod_ix' ('module'),
  KEY 'mdl_post_sub_ix' ('subject')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen';
LOCK TABLES 'mdl_post' WRITE;
/*!40000 ALTER TABLE 'mdl_post' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_post' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question';
CREATE TABLE 'mdl_question' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'category' bigint(10) NOT NULL default '0',
  'parent' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'questiontext' text NOT NULL,
  'questiontextformat' tinyint(2) NOT NULL default '0',
  'image' varchar(255) NOT NULL default '',
  'generalfeedback' text NOT NULL,
  'defaultgrade' bigint(10) unsigned NOT NULL default '1',
  'penalty' double NOT NULL default '0.1',
  'qtype' varchar(20) NOT NULL default '',
  'length' bigint(10) unsigned NOT NULL default '1',
  'stamp' varchar(255) NOT NULL default '',
  'version' varchar(255) NOT NULL default '',
  'hidden' tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_ques_cat_ix' ('category'),
  KEY 'mdl_ques_par_ix' ('parent')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The questions themselves';
LOCK TABLES 'mdl_question' WRITE;
/*!40000 ALTER TABLE 'mdl_question' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_answers';
CREATE TABLE 'mdl_question_answers' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'answer' text NOT NULL,
  'fraction' double NOT NULL default '0',
  'feedback' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesansw_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback';
LOCK TABLES 'mdl_question_answers' WRITE;
/*!40000 ALTER TABLE 'mdl_question_answers' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_answers' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_attempts';
CREATE TABLE 'mdl_question_attempts' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'modulename' varchar(20) NOT NULL default 'quiz',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Student attempts. This table gets extended by the modules';
LOCK TABLES 'mdl_question_attempts' WRITE;
/*!40000 ALTER TABLE 'mdl_question_attempts' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_attempts' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_calculated';
CREATE TABLE 'mdl_question_calculated' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'answer' bigint(10) unsigned NOT NULL default '0',
  'tolerance' varchar(20) NOT NULL default '0.0',
  'tolerancetype' bigint(10) NOT NULL default '1',
  'correctanswerlength' bigint(10) NOT NULL default '2',
  'correctanswerformat' bigint(10) NOT NULL default '2',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quescalc_ans_ix' ('answer'),
  KEY 'mdl_quescalc_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';
LOCK TABLES 'mdl_question_calculated' WRITE;
/*!40000 ALTER TABLE 'mdl_question_calculated' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_calculated' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_categories';
CREATE TABLE 'mdl_question_categories' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'info' text NOT NULL,
  'publish' smallint(4) NOT NULL default '0',
  'stamp' varchar(255) NOT NULL default '',
  'parent' bigint(10) unsigned NOT NULL default '0',
  'sortorder' bigint(10) unsigned NOT NULL default '999',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quescate_cou_ix' ('course'),
  KEY 'mdl_quescate_par_ix' ('parent')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions';
LOCK TABLES 'mdl_question_categories' WRITE;
/*!40000 ALTER TABLE 'mdl_question_categories' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_categories' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_dataset_definitions';
CREATE TABLE 'mdl_question_dataset_definitions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'category' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'type' bigint(10) NOT NULL default '0',
  'options' varchar(255) NOT NULL default '',
  'itemcount' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesdatadefi_cat_ix' ('category')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items';
LOCK TABLES 'mdl_question_dataset_definitions' WRITE;
/*!40000 ALTER TABLE 'mdl_question_dataset_definitions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_dataset_definitions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_dataset_items';
CREATE TABLE 'mdl_question_dataset_items' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'definition' bigint(10) unsigned NOT NULL default '0',
  'itemnumber' bigint(10) unsigned NOT NULL default '0',
  'value' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesdataitem_def_ix' ('definition')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Individual dataset items';
LOCK TABLES 'mdl_question_dataset_items' WRITE;
/*!40000 ALTER TABLE 'mdl_question_dataset_items' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_dataset_items' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_datasets';
CREATE TABLE 'mdl_question_datasets' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'datasetdefinition' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesdata_quedat_ix' ('question','datasetdefinition'),
  KEY 'mdl_quesdata_que_ix' ('question'),
  KEY 'mdl_quesdata_dat_ix' ('datasetdefinition')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions';
LOCK TABLES 'mdl_question_datasets' WRITE;
/*!40000 ALTER TABLE 'mdl_question_datasets' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_datasets' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_match';
CREATE TABLE 'mdl_question_match' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'subquestions' varchar(255) NOT NULL default '',
  'shuffleanswers' smallint(4) NOT NULL default '1',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesmatc_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines fixed matching questions';
LOCK TABLES 'mdl_question_match' WRITE;
/*!40000 ALTER TABLE 'mdl_question_match' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_match' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_match_sub';
CREATE TABLE 'mdl_question_match_sub' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'code' bigint(10) unsigned NOT NULL default '0',
  'question' bigint(10) unsigned NOT NULL default '0',
  'questiontext' text NOT NULL,
  'answertext' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesmatcsub_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines the subquestions that make up a matching question';
LOCK TABLES 'mdl_question_match_sub' WRITE;
/*!40000 ALTER TABLE 'mdl_question_match_sub' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_match_sub' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_multianswer';
CREATE TABLE 'mdl_question_multianswer' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'sequence' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesmult_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions';
LOCK TABLES 'mdl_question_multianswer' WRITE;
/*!40000 ALTER TABLE 'mdl_question_multianswer' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_multianswer' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_multichoice';
CREATE TABLE 'mdl_question_multichoice' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'layout' smallint(4) NOT NULL default '0',
  'answers' varchar(255) NOT NULL default '',
  'single' smallint(4) NOT NULL default '0',
  'shuffleanswers' smallint(4) NOT NULL default '1',
  'correctfeedback' text NOT NULL,
  'partiallycorrectfeedback' text NOT NULL,
  'incorrectfeedback' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesmult_que2_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions';
LOCK TABLES 'mdl_question_multichoice' WRITE;
/*!40000 ALTER TABLE 'mdl_question_multichoice' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_multichoice' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_numerical';
CREATE TABLE 'mdl_question_numerical' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'answer' bigint(10) unsigned NOT NULL default '0',
  'tolerance' varchar(255) NOT NULL default '0.0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesnume_ans_ix' ('answer'),
  KEY 'mdl_quesnume_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions';
LOCK TABLES 'mdl_question_numerical' WRITE;
/*!40000 ALTER TABLE 'mdl_question_numerical' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_numerical' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_numerical_units';
CREATE TABLE 'mdl_question_numerical_units' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'multiplier' decimal(40,20) NOT NULL default '1.00000000000000000000',
  'unit' varchar(50) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesnumeunit_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions';
LOCK TABLES 'mdl_question_numerical_units' WRITE;
/*!40000 ALTER TABLE 'mdl_question_numerical_units' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_numerical_units' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_randomsamatch';
CREATE TABLE 'mdl_question_randomsamatch' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'choose' bigint(10) unsigned NOT NULL default '4',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesrand_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question';
LOCK TABLES 'mdl_question_randomsamatch' WRITE;
/*!40000 ALTER TABLE 'mdl_question_randomsamatch' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_randomsamatch' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_rqp';
CREATE TABLE 'mdl_question_rqp' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'type' bigint(10) unsigned NOT NULL default '0',
  'source' longblob NOT NULL,
  'format' varchar(255) NOT NULL default '',
  'flags' smallint(3) unsigned NOT NULL default '0',
  'maxscore' bigint(10) unsigned NOT NULL default '1',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesrqp_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for RQP questions';
LOCK TABLES 'mdl_question_rqp' WRITE;
/*!40000 ALTER TABLE 'mdl_question_rqp' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_rqp' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_rqp_servers';
CREATE TABLE 'mdl_question_rqp_servers' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'typeid' bigint(10) unsigned NOT NULL default '0',
  'url' varchar(255) NOT NULL default '',
  'can_render' tinyint(2) unsigned NOT NULL default '0',
  'can_author' tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesrqpserv_typ_ix' ('typeid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about RQP servers';
LOCK TABLES 'mdl_question_rqp_servers' WRITE;
/*!40000 ALTER TABLE 'mdl_question_rqp_servers' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_rqp_servers' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_rqp_states';
CREATE TABLE 'mdl_question_rqp_states' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'stateid' bigint(10) unsigned NOT NULL default '0',
  'responses' text NOT NULL,
  'persistent_data' text NOT NULL,
  'template_vars' text NOT NULL,
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='RQP question type specific state information';
LOCK TABLES 'mdl_question_rqp_states' WRITE;
/*!40000 ALTER TABLE 'mdl_question_rqp_states' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_rqp_states' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_rqp_types';
CREATE TABLE 'mdl_question_rqp_types' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_quesrqptype_nam_uix' ('name')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='RQP question types';
LOCK TABLES 'mdl_question_rqp_types' WRITE;
/*!40000 ALTER TABLE 'mdl_question_rqp_types' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_rqp_types' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_sessions';
CREATE TABLE 'mdl_question_sessions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'attemptid' bigint(10) unsigned NOT NULL default '0',
  'questionid' bigint(10) unsigned NOT NULL default '0',
  'newest' bigint(10) unsigned NOT NULL default '0',
  'newgraded' bigint(10) unsigned NOT NULL default '0',
  'sumpenalty' double NOT NULL default '0',
  'manualcomment' text NOT NULL,
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_quessess_attque_uix' ('attemptid','questionid'),
  KEY 'mdl_quessess_att_ix' ('attemptid'),
  KEY 'mdl_quessess_que_ix' ('questionid'),
  KEY 'mdl_quessess_new_ix' ('newest'),
  KEY 'mdl_quessess_new2_ix' ('newgraded')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states';
LOCK TABLES 'mdl_question_sessions' WRITE;
/*!40000 ALTER TABLE 'mdl_question_sessions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_sessions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_shortanswer';
CREATE TABLE 'mdl_question_shortanswer' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'answers' varchar(255) NOT NULL default '',
  'usecase' tinyint(2) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesshor_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions';
LOCK TABLES 'mdl_question_shortanswer' WRITE;
/*!40000 ALTER TABLE 'mdl_question_shortanswer' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_shortanswer' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_states';
CREATE TABLE 'mdl_question_states' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'attempt' bigint(10) unsigned NOT NULL default '0',
  'question' bigint(10) unsigned NOT NULL default '0',
  'originalquestion' bigint(10) unsigned NOT NULL default '0',
  'seq_number' mediumint(6) unsigned NOT NULL default '0',
  'answer' text NOT NULL,
  'timestamp' bigint(10) unsigned NOT NULL default '0',
  'event' smallint(4) unsigned NOT NULL default '0',
  'grade' double NOT NULL default '0',
  'raw_grade' double NOT NULL default '0',
  'penalty' double NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quesstat_att_ix' ('attempt'),
  KEY 'mdl_quesstat_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades';
LOCK TABLES 'mdl_question_states' WRITE;
/*!40000 ALTER TABLE 'mdl_question_states' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_states' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_question_truefalse';
CREATE TABLE 'mdl_question_truefalse' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'question' bigint(10) unsigned NOT NULL default '0',
  'trueanswer' bigint(10) unsigned NOT NULL default '0',
  'falseanswer' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_questrue_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions';
LOCK TABLES 'mdl_question_truefalse' WRITE;
/*!40000 ALTER TABLE 'mdl_question_truefalse' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_question_truefalse' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_quiz';
CREATE TABLE 'mdl_quiz' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'intro' text NOT NULL,
  'timeopen' bigint(10) unsigned NOT NULL default '0',
  'timeclose' bigint(10) unsigned NOT NULL default '0',
  'optionflags' bigint(10) unsigned NOT NULL default '0',
  'penaltyscheme' smallint(4) unsigned NOT NULL default '0',
  'attempts' mediumint(6) NOT NULL default '0',
  'attemptonlast' smallint(4) NOT NULL default '0',
  'grademethod' smallint(4) NOT NULL default '1',
  'decimalpoints' smallint(4) NOT NULL default '2',
  'review' bigint(10) unsigned NOT NULL default '0',
  'questionsperpage' bigint(10) NOT NULL default '0',
  'shufflequestions' smallint(4) NOT NULL default '0',
  'shuffleanswers' smallint(4) NOT NULL default '0',
  'questions' text NOT NULL,
  'sumgrades' bigint(10) NOT NULL default '0',
  'grade' bigint(10) NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'timelimit' tinyint(2) unsigned NOT NULL default '0',
  'password' varchar(255) NOT NULL default '',
  'subnet' varchar(255) NOT NULL default '',
  'popup' smallint(4) NOT NULL default '0',
  'delay1' bigint(10) NOT NULL default '0',
  'delay2' bigint(10) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quiz_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Main information about each quiz';
LOCK TABLES 'mdl_quiz' WRITE;
/*!40000 ALTER TABLE 'mdl_quiz' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_quiz' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_quiz_attempts';
CREATE TABLE 'mdl_quiz_attempts' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'uniqueid' bigint(10) unsigned NOT NULL default '0',
  'quiz' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'attempt' mediumint(6) NOT NULL default '0',
  'sumgrades' double NOT NULL default '0',
  'timestart' bigint(10) unsigned NOT NULL default '0',
  'timefinish' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'layout' text NOT NULL,
  'preview' smallint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_quizatte_uni_uix' ('uniqueid'),
  KEY 'mdl_quizatte_use_ix' ('userid'),
  KEY 'mdl_quizatte_qui_ix' ('quiz')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores various attempts on a quiz';
LOCK TABLES 'mdl_quiz_attempts' WRITE;
/*!40000 ALTER TABLE 'mdl_quiz_attempts' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_quiz_attempts' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_quiz_feedback';
CREATE TABLE 'mdl_quiz_feedback' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'quizid' bigint(10) unsigned NOT NULL default '0',
  'feedbacktext' text NOT NULL,
  'mingrade' double NOT NULL default '0',
  'maxgrade' double NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quizfeed_qui_ix' ('quizid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on their overall score on t';
LOCK TABLES 'mdl_quiz_feedback' WRITE;
/*!40000 ALTER TABLE 'mdl_quiz_feedback' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_quiz_feedback' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_quiz_grades';
CREATE TABLE 'mdl_quiz_grades' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'quiz' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'grade' double NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quizgrad_use_ix' ('userid'),
  KEY 'mdl_quizgrad_qui_ix' ('quiz')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Final quiz grade (may be best of several attempts)';
LOCK TABLES 'mdl_quiz_grades' WRITE;
/*!40000 ALTER TABLE 'mdl_quiz_grades' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_quiz_grades' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_quiz_question_instances';
CREATE TABLE 'mdl_quiz_question_instances' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'quiz' bigint(10) unsigned NOT NULL default '0',
  'question' bigint(10) unsigned NOT NULL default '0',
  'grade' mediumint(6) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quizquesinst_qui_ix' ('quiz'),
  KEY 'mdl_quizquesinst_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The grade for a question in a quiz';
LOCK TABLES 'mdl_quiz_question_instances' WRITE;
/*!40000 ALTER TABLE 'mdl_quiz_question_instances' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_quiz_question_instances' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_quiz_question_versions';
CREATE TABLE 'mdl_quiz_question_versions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'quiz' bigint(10) unsigned NOT NULL default '0',
  'oldquestion' bigint(10) unsigned NOT NULL default '0',
  'newquestion' bigint(10) unsigned NOT NULL default '0',
  'originalquestion' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'timestamp' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_quizquesvers_qui_ix' ('quiz'),
  KEY 'mdl_quizquesvers_old_ix' ('oldquestion'),
  KEY 'mdl_quizquesvers_new_ix' ('newquestion'),
  KEY 'mdl_quizquesvers_ori_ix' ('originalquestion')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='quiz_question_versions table retrofitted from MySQL';
LOCK TABLES 'mdl_quiz_question_versions' WRITE;
/*!40000 ALTER TABLE 'mdl_quiz_question_versions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_quiz_question_versions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_resource';
CREATE TABLE 'mdl_resource' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'type' varchar(30) NOT NULL default '',
  'reference' varchar(255) NOT NULL default '',
  'summary' text,
  'alltext' mediumtext NOT NULL,
  'popup' text NOT NULL,
  'options' varchar(255) NOT NULL default '',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_reso_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each record is one resource and its config data';
LOCK TABLES 'mdl_resource' WRITE;
/*!40000 ALTER TABLE 'mdl_resource' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_resource' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_role';
CREATE TABLE 'mdl_role' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  'shortname' varchar(100) NOT NULL default '',
  'description' text NOT NULL,
  'sortorder' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_role_sor_uix' ('sortorder')
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='moodle roles';
LOCK TABLES 'mdl_role' WRITE;
/*!40000 ALTER TABLE 'mdl_role' DISABLE KEYS */;
INSERT INTO 'mdl_role' VALUES (1,'Administrator','admin','Administrators can usually do anything on the site, in all courses.',0),(2,'Course creator','coursecreator','Course creators can create new courses and teach in them.',1),(3,'Teacher','editingteacher','Teachers can do anything within a course, including changing the activities and grading students.',2),(4,'Non-editing teacher','teacher','Non-editing teachers can teach in courses and grade students, but may not alter activities.',3),(5,'Student','student','Students generally have less privileges within a course.',4),(6,'Guest','guest','Guests have minimal privileges and usually can not enter text anywhere.',5),(7,'Authenticated user','user','All logged in users.',6);
/*!40000 ALTER TABLE 'mdl_role' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_role_allow_assign';
CREATE TABLE 'mdl_role_allow_assign' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'allowassign' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_rolealloassi_rolall_uix' ('roleid','allowassign'),
  KEY 'mdl_rolealloassi_rol_ix' ('roleid'),
  KEY 'mdl_rolealloassi_all_ix' ('allowassign')
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role';
LOCK TABLES 'mdl_role_allow_assign' WRITE;
/*!40000 ALTER TABLE 'mdl_role_allow_assign' DISABLE KEYS */;
INSERT INTO 'mdl_role_allow_assign' VALUES (1,1,1),(2,1,2),(3,1,4),(4,1,3),(5,1,5),(6,1,6),(7,2,4),(8,2,3),(9,2,5),(10,2,6),(11,3,4),(12,3,5),(13,3,6);
/*!40000 ALTER TABLE 'mdl_role_allow_assign' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_role_allow_override';
CREATE TABLE 'mdl_role_allow_override' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'allowoverride' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_rolealloover_rolall_uix' ('roleid','allowoverride'),
  KEY 'mdl_rolealloover_rol_ix' ('roleid'),
  KEY 'mdl_rolealloover_all_ix' ('allowoverride')
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role';
LOCK TABLES 'mdl_role_allow_override' WRITE;
/*!40000 ALTER TABLE 'mdl_role_allow_override' DISABLE KEYS */;
INSERT INTO 'mdl_role_allow_override' VALUES (1,1,1),(2,1,2),(3,1,4),(4,1,3),(5,1,5),(6,1,6),(7,1,7);
/*!40000 ALTER TABLE 'mdl_role_allow_override' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_role_assignments';
CREATE TABLE 'mdl_role_assignments' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'contextid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'hidden' tinyint(1) unsigned NOT NULL default '0',
  'timestart' bigint(10) unsigned NOT NULL default '0',
  'timeend' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'modifierid' bigint(10) unsigned NOT NULL default '0',
  'enrol' varchar(20) NOT NULL default '',
  'sortorder' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_roleassi_conroluse_uix' ('contextid','roleid','userid'),
  KEY 'mdl_roleassi_sor_ix' ('sortorder'),
  KEY 'mdl_roleassi_rol_ix' ('roleid'),
  KEY 'mdl_roleassi_con_ix' ('contextid'),
  KEY 'mdl_roleassi_use_ix' ('userid')
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='assigning roles to different context';
LOCK TABLES 'mdl_role_assignments' WRITE;
/*!40000 ALTER TABLE 'mdl_role_assignments' DISABLE KEYS */;
INSERT INTO 'mdl_role_assignments' VALUES (1,1,1,2,0,0,0,1201718665,0,'manual',0);
/*!40000 ALTER TABLE 'mdl_role_assignments' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_role_capabilities';
CREATE TABLE 'mdl_role_capabilities' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'contextid' bigint(10) unsigned NOT NULL default '0',
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'capability' varchar(255) NOT NULL default '',
  'permission' bigint(10) NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'modifierid' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_rolecapa_rolconcap_uix' ('roleid','contextid','capability'),
  KEY 'mdl_rolecapa_rol_ix' ('roleid'),
  KEY 'mdl_rolecapa_con_ix' ('contextid'),
  KEY 'mdl_rolecapa_mod_ix' ('modifierid'),
  KEY 'mdl_rolecapa_cap_ix' ('capability')
) ENGINE=MyISAM AUTO_INCREMENT=422 DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p';
LOCK TABLES 'mdl_role_capabilities' WRITE;
/*!40000 ALTER TABLE 'mdl_role_capabilities' DISABLE KEYS */;
INSERT INTO 'mdl_role_capabilities' VALUES (1,1,1,'moodle/legacy:admin',1,1201718639,0),(2,1,2,'moodle/legacy:coursecreator',1,1201718639,0),(3,1,3,'moodle/legacy:editingteacher',1,1201718639,0),(4,1,4,'moodle/legacy:teacher',1,1201718639,0),(5,1,5,'moodle/legacy:student',1,1201718639,0),(6,1,6,'moodle/legacy:guest',1,1201718639,0),(7,1,7,'moodle/legacy:user',1,1201718639,0),(8,1,1,'moodle/site:doanything',1,1201718639,0),(9,1,1,'moodle/site:config',1,1201718639,0),(10,1,1,'moodle/site:readallmessages',1,1201718639,0),(11,1,3,'moodle/site:readallmessages',1,1201718639,0),(12,1,1,'moodle/site:sendmessage',1,1201718639,0),(13,1,7,'moodle/site:sendmessage',1,1201718639,0),(14,1,1,'moodle/site:approvecourse',1,1201718639,0),(15,1,3,'moodle/site:import',1,1201718639,0),(16,1,1,'moodle/site:import',1,1201718639,0),(17,1,3,'moodle/site:backup',1,1201718639,0),(18,1,1,'moodle/site:backup',1,1201718639,0),(19,1,3,'moodle/site:restore',1,1201718639,0),(20,1,1,'moodle/site:restore',1,1201718639,0),(21,1,3,'moodle/site:manageblocks',1,1201718639,0),(22,1,1,'moodle/site:manageblocks',1,1201718639,0),(23,1,4,'moodle/site:accessallgroups',1,1201718639,0),(24,1,3,'moodle/site:accessallgroups',1,1201718639,0),(25,1,1,'moodle/site:accessallgroups',1,1201718639,0),(26,1,4,'moodle/site:viewfullnames',1,1201718639,0),(27,1,3,'moodle/site:viewfullnames',1,1201718639,0),(28,1,1,'moodle/site:viewfullnames',1,1201718639,0),(29,1,4,'moodle/site:viewreports',1,1201718639,0),(30,1,3,'moodle/site:viewreports',1,1201718639,0),(31,1,1,'moodle/site:viewreports',1,1201718639,0),(32,1,3,'moodle/site:trustcontent',1,1201718639,0),(33,1,1,'moodle/site:trustcontent',1,1201718639,0),(34,1,1,'moodle/site:uploadusers',1,1201718639,0),(35,1,1,'moodle/user:create',1,1201718639,0),(36,1,1,'moodle/user:delete',1,1201718639,0),(37,1,1,'moodle/user:update',1,1201718639,0),(38,1,6,'moodle/user:viewdetails',1,1201718639,0),(39,1,5,'moodle/user:viewdetails',1,1201718639,0),(40,1,4,'moodle/user:viewdetails',1,1201718639,0),(41,1,3,'moodle/user:viewdetails',1,1201718639,0),(42,1,1,'moodle/user:viewdetails',1,1201718639,0),(43,1,4,'moodle/user:viewhiddendetails',1,1201718639,0),(44,1,3,'moodle/user:viewhiddendetails',1,1201718639,0),(45,1,1,'moodle/user:viewhiddendetails',1,1201718639,0),(46,1,5,'moodle/user:viewusergrades',1,1201718639,0),(47,1,4,'moodle/user:viewusergrades',1,1201718639,0),(48,1,3,'moodle/user:viewusergrades',1,1201718639,0),(49,1,1,'moodle/user:viewusergrades',1,1201718639,0),(50,1,1,'moodle/user:loginas',1,1201718639,0),(51,1,3,'moodle/role:assign',1,1201718639,0),(52,1,1,'moodle/role:assign',1,1201718639,0),(53,1,1,'moodle/role:override',1,1201718639,0),(54,1,1,'moodle/role:manage',1,1201718639,0),(55,1,4,'moodle/role:unassignself',1,1201718639,0),(56,1,3,'moodle/role:unassignself',1,1201718639,0),(57,1,2,'moodle/role:unassignself',1,1201718639,0),(58,1,1,'moodle/role:unassignself',1,1201718639,0),(59,1,4,'moodle/role:viewhiddenassigns',1,1201718639,0),(60,1,3,'moodle/role:viewhiddenassigns',1,1201718639,0),(61,1,1,'moodle/role:viewhiddenassigns',1,1201718639,0),(62,1,3,'moodle/role:switchroles',1,1201718639,0),(63,1,1,'moodle/role:switchroles',1,1201718639,0),(64,1,1,'moodle/category:create',1,1201718639,0),(65,1,1,'moodle/category:delete',1,1201718639,0),(66,1,1,'moodle/category:update',1,1201718639,0),(67,1,1,'moodle/category:visibility',1,1201718639,0),(68,1,2,'moodle/course:create',1,1201718639,0),(69,1,1,'moodle/course:create',1,1201718639,0),(70,1,1,'moodle/course:delete',1,1201718639,0),(71,1,3,'moodle/course:update',1,1201718639,0),(72,1,1,'moodle/course:update',1,1201718639,0),(73,1,6,'moodle/course:view',1,1201718639,0),(74,1,5,'moodle/course:view',1,1201718639,0),(75,1,4,'moodle/course:view',1,1201718639,0),(76,1,3,'moodle/course:view',1,1201718639,0),(77,1,4,'moodle/course:bulkmessaging',1,1201718639,0),(78,1,3,'moodle/course:bulkmessaging',1,1201718639,0),(79,1,1,'moodle/course:bulkmessaging',1,1201718639,0),(80,1,4,'moodle/course:viewhiddenuserfields',1,1201718639,0),(81,1,3,'moodle/course:viewhiddenuserfields',1,1201718639,0),(82,1,1,'moodle/course:viewhiddenuserfields',1,1201718639,0),(83,1,2,'moodle/course:viewhiddencourses',1,1201718639,0),(84,1,4,'moodle/course:viewhiddencourses',1,1201718639,0),(85,1,3,'moodle/course:viewhiddencourses',1,1201718639,0),(86,1,1,'moodle/course:viewhiddencourses',1,1201718639,0),(87,1,1,'moodle/course:visibility',1,1201718639,0),(88,1,3,'moodle/course:managefiles',1,1201718639,0),(89,1,1,'moodle/course:managefiles',1,1201718639,0),(90,1,3,'moodle/course:manageactivities',1,1201718639,0),(91,1,1,'moodle/course:manageactivities',1,1201718639,0),(92,1,3,'moodle/course:managemetacourse',1,1201718639,0),(93,1,1,'moodle/course:managemetacourse',1,1201718639,0),(94,1,3,'moodle/course:activityvisibility',1,1201718639,0),(95,1,1,'moodle/course:activityvisibility',1,1201718639,0),(96,1,4,'moodle/course:viewhiddenactivities',1,1201718639,0),(97,1,3,'moodle/course:viewhiddenactivities',1,1201718639,0),(98,1,1,'moodle/course:viewhiddenactivities',1,1201718639,0),(99,1,5,'moodle/course:viewparticipants',1,1201718639,0),(100,1,4,'moodle/course:viewparticipants',1,1201718639,0),(101,1,3,'moodle/course:viewparticipants',1,1201718639,0),(102,1,1,'moodle/course:viewparticipants',1,1201718639,0),(103,1,5,'moodle/course:viewscales',1,1201718639,0),(104,1,4,'moodle/course:viewscales',1,1201718639,0),(105,1,3,'moodle/course:viewscales',1,1201718639,0),(106,1,1,'moodle/course:viewscales',1,1201718639,0),(107,1,3,'moodle/course:managescales',1,1201718639,0),(108,1,1,'moodle/course:managescales',1,1201718639,0),(109,1,3,'moodle/course:managegroups',1,1201718639,0),(110,1,1,'moodle/course:managegroups',1,1201718639,0),(111,1,3,'moodle/course:reset',1,1201718639,0),(112,1,1,'moodle/course:reset',1,1201718639,0),(113,1,6,'moodle/blog:view',1,1201718639,0),(114,1,7,'moodle/blog:view',1,1201718639,0),(115,1,5,'moodle/blog:view',1,1201718639,0),(116,1,4,'moodle/blog:view',1,1201718639,0),(117,1,3,'moodle/blog:view',1,1201718639,0),(118,1,1,'moodle/blog:view',1,1201718639,0),(119,1,7,'moodle/blog:create',1,1201718639,0),(120,1,1,'moodle/blog:create',1,1201718639,0),(121,1,1,'moodle/blog:manageofficialtags',1,1201718639,0),(122,1,5,'moodle/blog:managepersonaltags',1,1201718639,0),(123,1,4,'moodle/blog:managepersonaltags',1,1201718639,0),(124,1,3,'moodle/blog:managepersonaltags',1,1201718639,0),(125,1,1,'moodle/blog:managepersonaltags',1,1201718639,0),(126,1,4,'moodle/blog:manageentries',1,1201718639,0),(127,1,3,'moodle/blog:manageentries',1,1201718639,0),(128,1,1,'moodle/blog:manageentries',1,1201718639,0),(129,1,7,'moodle/calendar:manageownentries',1,1201718639,0),(130,1,1,'moodle/calendar:manageownentries',1,1201718639,0),(131,1,4,'moodle/calendar:manageentries',1,1201718639,0),(132,1,3,'moodle/calendar:manageentries',1,1201718639,0),(133,1,1,'moodle/calendar:manageentries',1,1201718639,0),(134,1,1,'moodle/user:editprofile',1,1201718639,0),(135,1,5,'moodle/user:readuserposts',1,1201718639,0),(136,1,4,'moodle/user:readuserposts',1,1201718639,0),(137,1,3,'moodle/user:readuserposts',1,1201718639,0),(138,1,1,'moodle/user:readuserposts',1,1201718639,0),(139,1,5,'moodle/user:readuserblogs',1,1201718639,0),(140,1,4,'moodle/user:readuserblogs',1,1201718639,0),(141,1,3,'moodle/user:readuserblogs',1,1201718639,0),(142,1,1,'moodle/user:readuserblogs',1,1201718639,0),(143,1,4,'moodle/user:viewuseractivitiesreport',1,1201718639,0),(144,1,3,'moodle/user:viewuseractivitiesreport',1,1201718639,0),(145,1,1,'moodle/user:viewuseractivitiesreport',1,1201718639,0),(146,1,3,'moodle/question:import',1,1201718639,0),(147,1,1,'moodle/question:import',1,1201718639,0),(148,1,3,'moodle/question:export',1,1201718639,0),(149,1,1,'moodle/question:export',1,1201718639,0),(150,1,3,'moodle/question:managecategory',1,1201718639,0),(151,1,1,'moodle/question:managecategory',1,1201718639,0),(152,1,3,'moodle/question:manage',1,1201718639,0),(153,1,1,'moodle/question:manage',1,1201718639,0),(154,1,4,'moodle/site:doclinks',1,1201718639,0),(155,1,3,'moodle/site:doclinks',1,1201718639,0),(156,1,1,'moodle/site:doclinks',1,1201718639,0),(157,1,3,'moodle/course:sectionvisibility',1,1201718639,0),(158,1,1,'moodle/course:sectionvisibility',1,1201718639,0),(159,1,3,'moodle/course:useremail',1,1201718639,0),(160,1,1,'moodle/course:useremail',1,1201718639,0),(161,1,3,'moodle/course:viewhiddensections',1,1201718639,0),(162,1,1,'moodle/course:viewhiddensections',1,1201718639,0),(163,1,3,'moodle/course:setcurrentsection',1,1201718639,0),(164,1,1,'moodle/course:setcurrentsection',1,1201718639,0),(165,1,4,'moodle/course:viewcoursegrades',1,1201718639,0),(166,1,3,'moodle/course:viewcoursegrades',1,1201718639,0),(167,1,1,'moodle/course:viewcoursegrades',1,1201718639,0),(168,1,3,'moodle/course:managegrades',1,1201718639,0),(169,1,1,'moodle/course:managegrades',1,1201718639,0),(170,1,1,'moodle/site:mnetlogintoremote',1,1201718639,0),(171,1,7,'moodle/my:manageblocks',1,1201718639,0),(172,1,6,'mod/assignment:view',1,1201718640,0),(173,1,5,'mod/assignment:view',1,1201718640,0),(174,1,4,'mod/assignment:view',1,1201718640,0),(175,1,3,'mod/assignment:view',1,1201718640,0),(176,1,1,'mod/assignment:view',1,1201718640,0),(177,1,5,'mod/assignment:submit',1,1201718640,0),(178,1,4,'mod/assignment:grade',1,1201718640,0),(179,1,3,'mod/assignment:grade',1,1201718640,0),(180,1,1,'mod/assignment:grade',1,1201718640,0),(181,1,5,'mod/chat:chat',1,1201718641,0),(182,1,4,'mod/chat:chat',1,1201718641,0),(183,1,3,'mod/chat:chat',1,1201718641,0),(184,1,1,'mod/chat:chat',1,1201718641,0),(185,1,5,'mod/chat:readlog',1,1201718641,0),(186,1,4,'mod/chat:readlog',1,1201718641,0),(187,1,3,'mod/chat:readlog',1,1201718641,0),(188,1,1,'mod/chat:readlog',1,1201718641,0),(189,1,4,'mod/chat:deletelog',1,1201718641,0),(190,1,3,'mod/chat:deletelog',1,1201718641,0),(191,1,1,'mod/chat:deletelog',1,1201718641,0),(192,1,5,'mod/choice:choose',1,1201718641,0),(193,1,4,'mod/choice:choose',1,1201718641,0),(194,1,3,'mod/choice:choose',1,1201718641,0),(195,1,1,'mod/choice:choose',1,1201718641,0),(196,1,4,'mod/choice:readresponses',1,1201718641,0),(197,1,3,'mod/choice:readresponses',1,1201718641,0),(198,1,1,'mod/choice:readresponses',1,1201718641,0),(199,1,4,'mod/choice:deleteresponses',1,1201718641,0),(200,1,3,'mod/choice:deleteresponses',1,1201718641,0),(201,1,1,'mod/choice:deleteresponses',1,1201718641,0),(202,1,4,'mod/choice:downloadresponses',1,1201718641,0),(203,1,3,'mod/choice:downloadresponses',1,1201718641,0),(204,1,1,'mod/choice:downloadresponses',1,1201718641,0),(205,1,6,'mod/data:viewentry',1,1201718642,0),(206,1,5,'mod/data:viewentry',1,1201718642,0),(207,1,4,'mod/data:viewentry',1,1201718642,0),(208,1,3,'mod/data:viewentry',1,1201718642,0),(209,1,1,'mod/data:viewentry',1,1201718642,0),(210,1,5,'mod/data:writeentry',1,1201718642,0),(211,1,4,'mod/data:writeentry',1,1201718642,0),(212,1,3,'mod/data:writeentry',1,1201718642,0),(213,1,1,'mod/data:writeentry',1,1201718642,0),(214,1,5,'mod/data:comment',1,1201718642,0),(215,1,4,'mod/data:comment',1,1201718642,0),(216,1,3,'mod/data:comment',1,1201718642,0),(217,1,1,'mod/data:comment',1,1201718642,0),(218,1,4,'mod/data:viewrating',1,1201718642,0),(219,1,3,'mod/data:viewrating',1,1201718642,0),(220,1,1,'mod/data:viewrating',1,1201718642,0),(221,1,4,'mod/data:rate',1,1201718642,0),(222,1,3,'mod/data:rate',1,1201718642,0),(223,1,1,'mod/data:rate',1,1201718642,0),(224,1,4,'mod/data:approve',1,1201718642,0),(225,1,3,'mod/data:approve',1,1201718642,0),(226,1,1,'mod/data:approve',1,1201718642,0),(227,1,4,'mod/data:manageentries',1,1201718642,0),(228,1,3,'mod/data:manageentries',1,1201718642,0),(229,1,1,'mod/data:manageentries',1,1201718642,0),(230,1,4,'mod/data:managecomments',1,1201718642,0),(231,1,3,'mod/data:managecomments',1,1201718642,0),(232,1,1,'mod/data:managecomments',1,1201718642,0),(233,1,3,'mod/data:managetemplates',1,1201718642,0),(234,1,1,'mod/data:managetemplates',1,1201718642,0),(235,1,4,'mod/data:viewalluserpresets',1,1201718642,0),(236,1,3,'mod/data:viewalluserpresets',1,1201718642,0),(237,1,1,'mod/data:viewalluserpresets',1,1201718642,0),(238,1,1,'mod/data:manageuserpresets',1,1201718642,0),(239,1,6,'mod/forum:viewdiscussion',1,1201718644,0),(240,1,5,'mod/forum:viewdiscussion',1,1201718644,0),(241,1,4,'mod/forum:viewdiscussion',1,1201718644,0),(242,1,3,'mod/forum:viewdiscussion',1,1201718644,0),(243,1,1,'mod/forum:viewdiscussion',1,1201718644,0),(244,1,4,'mod/forum:viewhiddentimedposts',1,1201718644,0),(245,1,3,'mod/forum:viewhiddentimedposts',1,1201718644,0),(246,1,1,'mod/forum:viewhiddentimedposts',1,1201718644,0),(247,1,5,'mod/forum:startdiscussion',1,1201718644,0),(248,1,4,'mod/forum:startdiscussion',1,1201718644,0),(249,1,3,'mod/forum:startdiscussion',1,1201718644,0),(250,1,1,'mod/forum:startdiscussion',1,1201718644,0),(251,1,5,'mod/forum:replypost',1,1201718644,0),(252,1,4,'mod/forum:replypost',1,1201718644,0),(253,1,3,'mod/forum:replypost',1,1201718644,0),(254,1,1,'mod/forum:replypost',1,1201718644,0),(255,1,4,'mod/forum:addnews',1,1201718644,0),(256,1,3,'mod/forum:addnews',1,1201718644,0),(257,1,1,'mod/forum:addnews',1,1201718644,0),(258,1,4,'mod/forum:replynews',1,1201718644,0),(259,1,3,'mod/forum:replynews',1,1201718644,0),(260,1,1,'mod/forum:replynews',1,1201718644,0),(261,1,5,'mod/forum:viewrating',1,1201718644,0),(262,1,4,'mod/forum:viewrating',1,1201718644,0),(263,1,3,'mod/forum:viewrating',1,1201718644,0),(264,1,1,'mod/forum:viewrating',1,1201718644,0),(265,1,4,'mod/forum:viewanyrating',1,1201718644,0),(266,1,3,'mod/forum:viewanyrating',1,1201718644,0),(267,1,1,'mod/forum:viewanyrating',1,1201718644,0),(268,1,4,'mod/forum:rate',1,1201718644,0),(269,1,3,'mod/forum:rate',1,1201718644,0),(270,1,1,'mod/forum:rate',1,1201718644,0),(271,1,5,'mod/forum:createattachment',1,1201718644,0),(272,1,4,'mod/forum:createattachment',1,1201718644,0),(273,1,3,'mod/forum:createattachment',1,1201718644,0),(274,1,1,'mod/forum:createattachment',1,1201718644,0),(275,1,5,'mod/forum:deleteownpost',1,1201718644,0),(276,1,4,'mod/forum:deleteownpost',1,1201718644,0),(277,1,3,'mod/forum:deleteownpost',1,1201718644,0),(278,1,1,'mod/forum:deleteownpost',1,1201718644,0),(279,1,4,'mod/forum:deleteanypost',1,1201718644,0),(280,1,3,'mod/forum:deleteanypost',1,1201718644,0),(281,1,1,'mod/forum:deleteanypost',1,1201718644,0),(282,1,4,'mod/forum:splitdiscussions',1,1201718644,0),(283,1,3,'mod/forum:splitdiscussions',1,1201718644,0),(284,1,1,'mod/forum:splitdiscussions',1,1201718644,0),(285,1,4,'mod/forum:movediscussions',1,1201718644,0),(286,1,3,'mod/forum:movediscussions',1,1201718644,0),(287,1,1,'mod/forum:movediscussions',1,1201718644,0),(288,1,4,'mod/forum:editanypost',1,1201718644,0),(289,1,3,'mod/forum:editanypost',1,1201718644,0),(290,1,1,'mod/forum:editanypost',1,1201718644,0),(291,1,4,'mod/forum:viewqandawithoutposting',1,1201718644,0),(292,1,3,'mod/forum:viewqandawithoutposting',1,1201718644,0),(293,1,1,'mod/forum:viewqandawithoutposting',1,1201718644,0),(294,1,4,'mod/forum:viewsubscribers',1,1201718644,0),(295,1,3,'mod/forum:viewsubscribers',1,1201718644,0),(296,1,1,'mod/forum:viewsubscribers',1,1201718644,0),(297,1,4,'mod/forum:managesubscriptions',1,1201718644,0),(298,1,3,'mod/forum:managesubscriptions',1,1201718644,0),(299,1,1,'mod/forum:managesubscriptions',1,1201718644,0),(300,1,4,'mod/forum:initialsubscriptions',1,1201718644,0),(301,1,3,'mod/forum:initialsubscriptions',1,1201718644,0),(302,1,5,'mod/forum:initialsubscriptions',1,1201718644,0),(303,1,5,'mod/glossary:write',1,1201718645,0),(304,1,4,'mod/glossary:write',1,1201718645,0),(305,1,3,'mod/glossary:write',1,1201718645,0),(306,1,1,'mod/glossary:write',1,1201718645,0),(307,1,4,'mod/glossary:manageentries',1,1201718645,0),(308,1,3,'mod/glossary:manageentries',1,1201718645,0),(309,1,1,'mod/glossary:manageentries',1,1201718645,0),(310,1,4,'mod/glossary:managecategories',1,1201718645,0),(311,1,3,'mod/glossary:managecategories',1,1201718645,0),(312,1,1,'mod/glossary:managecategories',1,1201718645,0),(313,1,5,'mod/glossary:comment',1,1201718645,0),(314,1,4,'mod/glossary:comment',1,1201718645,0),(315,1,3,'mod/glossary:comment',1,1201718645,0),(316,1,1,'mod/glossary:comment',1,1201718645,0),(317,1,4,'mod/glossary:managecomments',1,1201718645,0),(318,1,3,'mod/glossary:managecomments',1,1201718645,0),(319,1,1,'mod/glossary:managecomments',1,1201718645,0),(320,1,4,'mod/glossary:import',1,1201718645,0),(321,1,3,'mod/glossary:import',1,1201718645,0),(322,1,1,'mod/glossary:import',1,1201718645,0),(323,1,4,'mod/glossary:export',1,1201718645,0),(324,1,3,'mod/glossary:export',1,1201718645,0),(325,1,1,'mod/glossary:export',1,1201718645,0),(326,1,4,'mod/glossary:approve',1,1201718645,0),(327,1,3,'mod/glossary:approve',1,1201718645,0),(328,1,1,'mod/glossary:approve',1,1201718645,0),(329,1,4,'mod/glossary:rate',1,1201718645,0),(330,1,3,'mod/glossary:rate',1,1201718645,0),(331,1,1,'mod/glossary:rate',1,1201718645,0),(332,1,4,'mod/glossary:viewrating',1,1201718645,0),(333,1,3,'mod/glossary:viewrating',1,1201718645,0),(334,1,1,'mod/glossary:viewrating',1,1201718645,0),(335,1,5,'mod/hotpot:attempt',1,1201718646,0),(336,1,4,'mod/hotpot:attempt',1,1201718646,0),(337,1,3,'mod/hotpot:attempt',1,1201718646,0),(338,1,1,'mod/hotpot:attempt',1,1201718646,0),(339,1,4,'mod/hotpot:viewreport',1,1201718646,0),(340,1,3,'mod/hotpot:viewreport',1,1201718646,0),(341,1,1,'mod/hotpot:viewreport',1,1201718646,0),(342,1,4,'mod/hotpot:grade',1,1201718646,0),(343,1,3,'mod/hotpot:grade',1,1201718646,0),(344,1,1,'mod/hotpot:grade',1,1201718646,0),(345,1,3,'mod/hotpot:deleteattempt',1,1201718646,0),(346,1,1,'mod/hotpot:deleteattempt',1,1201718646,0),(347,1,5,'mod/lams:participate',1,1201718646,0),(348,1,4,'mod/lams:manage',1,1201718646,0),(349,1,3,'mod/lams:manage',1,1201718646,0),(350,1,1,'mod/lams:manage',1,1201718646,0),(351,1,3,'mod/lesson:edit',1,1201718648,0),(352,1,1,'mod/lesson:edit',1,1201718648,0),(353,1,4,'mod/lesson:manage',1,1201718648,0),(354,1,3,'mod/lesson:manage',1,1201718648,0),(355,1,1,'mod/lesson:manage',1,1201718648,0),(356,1,6,'mod/quiz:view',1,1201718650,0),(357,1,5,'mod/quiz:view',1,1201718650,0),(358,1,4,'mod/quiz:view',1,1201718650,0),(359,1,3,'mod/quiz:view',1,1201718650,0),(360,1,1,'mod/quiz:view',1,1201718650,0),(361,1,5,'mod/quiz:attempt',1,1201718650,0),(362,1,3,'mod/quiz:manage',1,1201718650,0),(363,1,1,'mod/quiz:manage',1,1201718650,0),(364,1,4,'mod/quiz:preview',1,1201718650,0),(365,1,3,'mod/quiz:preview',1,1201718650,0),(366,1,1,'mod/quiz:preview',1,1201718650,0),(367,1,4,'mod/quiz:grade',1,1201718650,0),(368,1,3,'mod/quiz:grade',1,1201718650,0),(369,1,1,'mod/quiz:grade',1,1201718650,0),(370,1,4,'mod/quiz:viewreports',1,1201718650,0),(371,1,3,'mod/quiz:viewreports',1,1201718650,0),(372,1,1,'mod/quiz:viewreports',1,1201718650,0),(373,1,3,'mod/quiz:deleteattempts',1,1201718650,0),(374,1,1,'mod/quiz:deleteattempts',1,1201718650,0),(375,1,4,'mod/scorm:viewreport',1,1201718652,0),(376,1,3,'mod/scorm:viewreport',1,1201718652,0),(377,1,1,'mod/scorm:viewreport',1,1201718652,0),(378,1,5,'mod/scorm:skipview',1,1201718652,0),(379,1,5,'mod/scorm:savetrack',1,1201718652,0),(380,1,4,'mod/scorm:savetrack',1,1201718652,0),(381,1,3,'mod/scorm:savetrack',1,1201718652,0),(382,1,1,'mod/scorm:savetrack',1,1201718652,0),(383,1,5,'mod/scorm:viewscores',1,1201718652,0),(384,1,4,'mod/scorm:viewscores',1,1201718652,0),(385,1,3,'mod/scorm:viewscores',1,1201718652,0),(386,1,1,'mod/scorm:viewscores',1,1201718652,0),(387,1,5,'mod/survey:participate',1,1201718653,0),(388,1,4,'mod/survey:participate',1,1201718653,0),(389,1,3,'mod/survey:participate',1,1201718653,0),(390,1,1,'mod/survey:participate',1,1201718653,0),(391,1,4,'mod/survey:readresponses',1,1201718653,0),(392,1,3,'mod/survey:readresponses',1,1201718653,0),(393,1,1,'mod/survey:readresponses',1,1201718653,0),(394,1,4,'mod/survey:download',1,1201718653,0),(395,1,3,'mod/survey:download',1,1201718653,0),(396,1,1,'mod/survey:download',1,1201718653,0),(397,1,5,'mod/wiki:participate',1,1201718654,0),(398,1,4,'mod/wiki:participate',1,1201718654,0),(399,1,3,'mod/wiki:participate',1,1201718654,0),(400,1,1,'mod/wiki:participate',1,1201718654,0),(401,1,4,'mod/wiki:manage',1,1201718654,0),(402,1,3,'mod/wiki:manage',1,1201718654,0),(403,1,1,'mod/wiki:manage',1,1201718654,0),(404,1,4,'mod/wiki:overridelock',1,1201718654,0),(405,1,3,'mod/wiki:overridelock',1,1201718654,0),(406,1,1,'mod/wiki:overridelock',1,1201718654,0),(407,1,5,'mod/workshop:participate',1,1201718655,0),(408,1,4,'mod/workshop:manage',1,1201718655,0),(409,1,3,'mod/workshop:manage',1,1201718655,0),(410,1,1,'mod/workshop:manage',1,1201718655,0),(411,1,4,'block/rss_client:createprivatefeeds',1,1201718660,0),(412,1,3,'block/rss_client:createprivatefeeds',1,1201718660,0),(413,1,1,'block/rss_client:createprivatefeeds',1,1201718660,0),(414,1,3,'block/rss_client:createsharedfeeds',1,1201718660,0),(415,1,1,'block/rss_client:createsharedfeeds',1,1201718660,0),(416,1,4,'block/rss_client:manageownfeeds',1,1201718660,0),(417,1,3,'block/rss_client:manageownfeeds',1,1201718660,0),(418,1,1,'block/rss_client:manageownfeeds',1,1201718660,0),(419,1,1,'block/rss_client:manageanyfeeds',1,1201718660,0),(420,1,1,'enrol/authorize:managepayments',1,1201718662,0),(421,1,1,'enrol/authorize:uploadcsv',1,1201718662,0);
/*!40000 ALTER TABLE 'mdl_role_capabilities' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_role_names';
CREATE TABLE 'mdl_role_names' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'contextid' bigint(10) unsigned NOT NULL default '0',
  'text' text NOT NULL,
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_rolename_rolcon_uix' ('roleid','contextid'),
  KEY 'mdl_rolename_rol_ix' ('roleid'),
  KEY 'mdl_rolename_con_ix' ('contextid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='role names in native strings';
LOCK TABLES 'mdl_role_names' WRITE;
/*!40000 ALTER TABLE 'mdl_role_names' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_role_names' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scale';
CREATE TABLE 'mdl_scale' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'scale' text NOT NULL,
  'description' text NOT NULL,
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_scal_cou_ix' ('courseid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines grading scales';
LOCK TABLES 'mdl_scale' WRITE;
/*!40000 ALTER TABLE 'mdl_scale' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scale' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm';
CREATE TABLE 'mdl_scorm' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'reference' varchar(255) NOT NULL default '',
  'summary' text NOT NULL,
  'version' varchar(9) NOT NULL default '',
  'maxgrade' double NOT NULL default '0',
  'grademethod' tinyint(2) NOT NULL default '0',
  'maxattempt' bigint(10) NOT NULL default '1',
  'updatefreq' tinyint(1) unsigned NOT NULL default '0',
  'md5hash' varchar(32) NOT NULL default '',
  'launch' bigint(10) unsigned NOT NULL default '0',
  'skipview' tinyint(1) unsigned NOT NULL default '1',
  'hidebrowse' tinyint(1) NOT NULL default '0',
  'hidetoc' tinyint(1) NOT NULL default '0',
  'hidenav' tinyint(1) NOT NULL default '0',
  'auto' tinyint(1) unsigned NOT NULL default '0',
  'popup' tinyint(1) unsigned NOT NULL default '0',
  'options' varchar(255) NOT NULL default '',
  'width' bigint(10) unsigned NOT NULL default '100',
  'height' bigint(10) unsigned NOT NULL default '600',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_scor_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration';
LOCK TABLES 'mdl_scorm' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_scoes';
CREATE TABLE 'mdl_scorm_scoes' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'scorm' bigint(10) unsigned NOT NULL default '0',
  'manifest' varchar(255) NOT NULL default '',
  'organization' varchar(255) NOT NULL default '',
  'parent' varchar(255) NOT NULL default '',
  'identifier' varchar(255) NOT NULL default '',
  'launch' varchar(255) NOT NULL default '',
  'scormtype' varchar(5) NOT NULL default '',
  'title' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_scorscoe_sco_ix' ('scorm')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module';
LOCK TABLES 'mdl_scorm_scoes' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_scoes' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_scoes' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_scoes_data';
CREATE TABLE 'mdl_scorm_scoes_data' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'scoid' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'value' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_scorscoedata_sco_ix' ('scoid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages';
LOCK TABLES 'mdl_scorm_scoes_data' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_scoes_data' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_scoes_data' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_scoes_track';
CREATE TABLE 'mdl_scorm_scoes_track' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'scormid' bigint(10) NOT NULL default '0',
  'scoid' bigint(10) unsigned NOT NULL default '0',
  'attempt' bigint(10) unsigned NOT NULL default '1',
  'element' varchar(255) NOT NULL default '',
  'value' longtext NOT NULL,
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_scorscoetrac_usescosco_uix' ('userid','scormid','scoid','attempt','element'),
  KEY 'mdl_scorscoetrac_use_ix' ('userid'),
  KEY 'mdl_scorscoetrac_ele_ix' ('element'),
  KEY 'mdl_scorscoetrac_sco_ix' ('scormid'),
  KEY 'mdl_scorscoetrac_sco2_ix' ('scoid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to track SCOes';
LOCK TABLES 'mdl_scorm_scoes_track' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_scoes_track' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_scoes_track' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_seq_mapinfo';
CREATE TABLE 'mdl_scorm_seq_mapinfo' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'scoid' bigint(10) unsigned NOT NULL default '0',
  'objectiveid' bigint(10) unsigned NOT NULL default '0',
  'targetobjectiveid' bigint(10) unsigned NOT NULL default '0',
  'readsatisfiedstatus' tinyint(1) NOT NULL default '1',
  'readnormalizedmeasure' tinyint(1) NOT NULL default '1',
  'writesatisfiedstatus' tinyint(1) NOT NULL default '0',
  'writenormalizedmeasure' tinyint(1) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_scorseqmapi_scoidobj_uix' ('scoid','id','objectiveid'),
  KEY 'mdl_scorseqmapi_sco_ix' ('scoid'),
  KEY 'mdl_scorseqmapi_obj_ix' ('objectiveid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description';
LOCK TABLES 'mdl_scorm_seq_mapinfo' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_seq_mapinfo' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_seq_mapinfo' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_seq_objective';
CREATE TABLE 'mdl_scorm_seq_objective' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'scoid' bigint(10) unsigned NOT NULL default '0',
  'primaryobj' tinyint(1) NOT NULL default '0',
  'objectiveid' bigint(10) unsigned NOT NULL default '0',
  'satisfiedbymeasure' tinyint(1) NOT NULL default '1',
  'minnormalizedmeasure' float(11,4) unsigned NOT NULL default '0.0000',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_scorseqobje_scoid_uix' ('scoid','id'),
  KEY 'mdl_scorseqobje_sco_ix' ('scoid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description';
LOCK TABLES 'mdl_scorm_seq_objective' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_seq_objective' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_seq_objective' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_seq_rolluprule';
CREATE TABLE 'mdl_scorm_seq_rolluprule' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'scoid' bigint(10) unsigned NOT NULL default '0',
  'childactivityset' varchar(15) NOT NULL default '',
  'minimumcount' bigint(10) unsigned NOT NULL default '0',
  'minimumpercent' float(11,4) unsigned NOT NULL default '0.0000',
  'conditioncombination' varchar(3) NOT NULL default 'all',
  'action' varchar(15) NOT NULL default '',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_scorseqroll_scoid_uix' ('scoid','id'),
  KEY 'mdl_scorseqroll_sco_ix' ('scoid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';
LOCK TABLES 'mdl_scorm_seq_rolluprule' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_seq_rolluprule' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_seq_rolluprule' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_seq_rolluprulecond';
CREATE TABLE 'mdl_scorm_seq_rolluprulecond' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'scoid' bigint(10) unsigned NOT NULL default '0',
  'rollupruleid' bigint(10) unsigned NOT NULL default '0',
  'operator' varchar(5) NOT NULL default 'noOp',
  'cond' varchar(25) NOT NULL default '',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_scorseqroll_scorolid_uix' ('scoid','rollupruleid','id'),
  KEY 'mdl_scorseqroll_sco2_ix' ('scoid'),
  KEY 'mdl_scorseqroll_rol_ix' ('rollupruleid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';
LOCK TABLES 'mdl_scorm_seq_rolluprulecond' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_seq_rolluprulecond' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_seq_rolluprulecond' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_seq_rulecond';
CREATE TABLE 'mdl_scorm_seq_rulecond' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'scoid' bigint(10) unsigned NOT NULL default '0',
  'ruleconditionsid' bigint(10) unsigned NOT NULL default '0',
  'refrencedobjective' varchar(255) NOT NULL default '',
  'measurethreshold' float(11,4) NOT NULL default '0.0000',
  'operator' varchar(5) NOT NULL default 'noOp',
  'cond' varchar(30) NOT NULL default 'always',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_scorseqrule_idscorul_uix' ('id','scoid','ruleconditionsid'),
  KEY 'mdl_scorseqrule_sco2_ix' ('scoid'),
  KEY 'mdl_scorseqrule_rul_ix' ('ruleconditionsid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition';
LOCK TABLES 'mdl_scorm_seq_rulecond' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_seq_rulecond' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_seq_rulecond' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_scorm_seq_ruleconds';
CREATE TABLE 'mdl_scorm_seq_ruleconds' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'scoid' bigint(10) unsigned NOT NULL default '0',
  'conditioncombination' varchar(3) NOT NULL default 'all',
  'ruletype' tinyint(2) unsigned NOT NULL default '0',
  'action' varchar(25) NOT NULL default '',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_scorseqrule_scoid_uix' ('scoid','id'),
  KEY 'mdl_scorseqrule_sco_ix' ('scoid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions';
LOCK TABLES 'mdl_scorm_seq_ruleconds' WRITE;
/*!40000 ALTER TABLE 'mdl_scorm_seq_ruleconds' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_scorm_seq_ruleconds' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_sessions2';
CREATE TABLE 'mdl_sessions2' (
  'sesskey' varchar(64) NOT NULL default '',
  'expiry' datetime NOT NULL,
  'expireref' varchar(250) default '',
  'created' datetime NOT NULL,
  'modified' datetime NOT NULL,
  'sessdata' longtext,
  PRIMARY KEY  ('sesskey'),
  KEY 'mdl_sess_exp_ix' ('expiry'),
  KEY 'mdl_sess_exp2_ix' ('expireref')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Optional database session storage in new format, not used by';
LOCK TABLES 'mdl_sessions2' WRITE;
/*!40000 ALTER TABLE 'mdl_sessions2' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_sessions2' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_stats_daily';
CREATE TABLE 'mdl_stats_daily' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'timeend' bigint(10) unsigned NOT NULL default '0',
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'stattype' enum('enrolments','activity','logins') NOT NULL default 'activity',
  'stat1' bigint(10) unsigned NOT NULL default '0',
  'stat2' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_statdail_cou_ix' ('courseid'),
  KEY 'mdl_statdail_tim_ix' ('timeend'),
  KEY 'mdl_statdail_rol_ix' ('roleid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats';
LOCK TABLES 'mdl_stats_daily' WRITE;
/*!40000 ALTER TABLE 'mdl_stats_daily' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_stats_daily' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_stats_monthly';
CREATE TABLE 'mdl_stats_monthly' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'timeend' bigint(10) unsigned NOT NULL default '0',
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'stattype' enum('enrolments','activity','logins') NOT NULL default 'activity',
  'stat1' bigint(10) unsigned NOT NULL default '0',
  'stat2' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_statmont_cou_ix' ('courseid'),
  KEY 'mdl_statmont_tim_ix' ('timeend'),
  KEY 'mdl_statmont_rol_ix' ('roleid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats';
LOCK TABLES 'mdl_stats_monthly' WRITE;
/*!40000 ALTER TABLE 'mdl_stats_monthly' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_stats_monthly' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_stats_user_daily';
CREATE TABLE 'mdl_stats_user_daily' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'timeend' bigint(10) unsigned NOT NULL default '0',
  'statsreads' bigint(10) unsigned NOT NULL default '0',
  'statswrites' bigint(10) unsigned NOT NULL default '0',
  'stattype' varchar(30) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_statuserdail_cou_ix' ('courseid'),
  KEY 'mdl_statuserdail_use_ix' ('userid'),
  KEY 'mdl_statuserdail_rol_ix' ('roleid'),
  KEY 'mdl_statuserdail_tim_ix' ('timeend')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user';
LOCK TABLES 'mdl_stats_user_daily' WRITE;
/*!40000 ALTER TABLE 'mdl_stats_user_daily' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_stats_user_daily' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_stats_user_monthly';
CREATE TABLE 'mdl_stats_user_monthly' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'timeend' bigint(10) unsigned NOT NULL default '0',
  'statsreads' bigint(10) unsigned NOT NULL default '0',
  'statswrites' bigint(10) unsigned NOT NULL default '0',
  'stattype' varchar(30) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_statusermont_cou_ix' ('courseid'),
  KEY 'mdl_statusermont_use_ix' ('userid'),
  KEY 'mdl_statusermont_rol_ix' ('roleid'),
  KEY 'mdl_statusermont_tim_ix' ('timeend')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user';
LOCK TABLES 'mdl_stats_user_monthly' WRITE;
/*!40000 ALTER TABLE 'mdl_stats_user_monthly' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_stats_user_monthly' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_stats_user_weekly';
CREATE TABLE 'mdl_stats_user_weekly' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'timeend' bigint(10) unsigned NOT NULL default '0',
  'statsreads' bigint(10) unsigned NOT NULL default '0',
  'statswrites' bigint(10) unsigned NOT NULL default '0',
  'stattype' varchar(30) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_statuserweek_cou_ix' ('courseid'),
  KEY 'mdl_statuserweek_use_ix' ('userid'),
  KEY 'mdl_statuserweek_rol_ix' ('roleid'),
  KEY 'mdl_statuserweek_tim_ix' ('timeend')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user';
LOCK TABLES 'mdl_stats_user_weekly' WRITE;
/*!40000 ALTER TABLE 'mdl_stats_user_weekly' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_stats_user_weekly' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_stats_weekly';
CREATE TABLE 'mdl_stats_weekly' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'timeend' bigint(10) unsigned NOT NULL default '0',
  'roleid' bigint(10) unsigned NOT NULL default '0',
  'stattype' enum('enrolments','activity','logins') NOT NULL default 'activity',
  'stat1' bigint(10) unsigned NOT NULL default '0',
  'stat2' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_statweek_cou_ix' ('courseid'),
  KEY 'mdl_statweek_tim_ix' ('timeend'),
  KEY 'mdl_statweek_rol_ix' ('roleid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats';
LOCK TABLES 'mdl_stats_weekly' WRITE;
/*!40000 ALTER TABLE 'mdl_stats_weekly' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_stats_weekly' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_survey';
CREATE TABLE 'mdl_survey' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'template' bigint(10) unsigned NOT NULL default '0',
  'days' mediumint(6) NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'intro' text NOT NULL,
  'questions' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_surv_cou_ix' ('course')
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration';
LOCK TABLES 'mdl_survey' WRITE;
/*!40000 ALTER TABLE 'mdl_survey' DISABLE KEYS */;
INSERT INTO 'mdl_survey' VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro','25,26,27,28,29,30,43,44'),(2,0,0,0,985017600,985017600,'collespname','collespintro','31,32,33,34,35,36,43,44'),(3,0,0,0,985017600,985017600,'collesapname','collesapintro','37,38,39,40,41,42,43,44'),(4,0,0,0,985017600,985017600,'attlsname','attlsintro','65,67,68'),(5,0,0,0,985017600,985017600,'ciqname','ciqintro','69,70,71,72,73');
/*!40000 ALTER TABLE 'mdl_survey' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_survey_analysis';
CREATE TABLE 'mdl_survey_analysis' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'survey' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'notes' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_survanal_use_ix' ('userid'),
  KEY 'mdl_survanal_sur_ix' ('survey')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='text about each survey submission';
LOCK TABLES 'mdl_survey_analysis' WRITE;
/*!40000 ALTER TABLE 'mdl_survey_analysis' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_survey_analysis' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_survey_answers';
CREATE TABLE 'mdl_survey_answers' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'survey' bigint(10) unsigned NOT NULL default '0',
  'question' bigint(10) unsigned NOT NULL default '0',
  'time' bigint(10) unsigned NOT NULL default '0',
  'answer1' text NOT NULL,
  'answer2' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_survansw_use_ix' ('userid'),
  KEY 'mdl_survansw_sur_ix' ('survey'),
  KEY 'mdl_survansw_que_ix' ('question')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users';
LOCK TABLES 'mdl_survey_answers' WRITE;
/*!40000 ALTER TABLE 'mdl_survey_answers' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_survey_answers' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_survey_questions';
CREATE TABLE 'mdl_survey_questions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'text' varchar(255) NOT NULL default '',
  'shorttext' varchar(30) NOT NULL default '',
  'multi' varchar(100) NOT NULL default '',
  'intro' varchar(50) NOT NULL default '',
  'type' smallint(3) NOT NULL default '0',
  'options' text,
  PRIMARY KEY  ('id')
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey';
LOCK TABLES 'mdl_survey_questions' WRITE;
/*!40000 ALTER TABLE 'mdl_survey_questions' DISABLE KEYS */;
INSERT INTO 'mdl_survey_questions' VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE 'mdl_survey_questions' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_tags';
CREATE TABLE 'mdl_tags' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'type' varchar(255) NOT NULL default 'official',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'text' varchar(20) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_tags_typuse_ix' ('type','userid'),
  KEY 'mdl_tags_tex_ix' ('text')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tags structure for moodle';
LOCK TABLES 'mdl_tags' WRITE;
/*!40000 ALTER TABLE 'mdl_tags' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_tags' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_timezone';
CREATE TABLE 'mdl_timezone' (
  'id' bigint(10) NOT NULL auto_increment,
  'name' varchar(100) NOT NULL default '',
  'year' bigint(11) NOT NULL default '0',
  'tzrule' varchar(20) NOT NULL default '',
  'gmtoff' bigint(11) NOT NULL default '0',
  'dstoff' bigint(11) NOT NULL default '0',
  'dst_month' tinyint(2) NOT NULL default '0',
  'dst_startday' smallint(3) NOT NULL default '0',
  'dst_weekday' smallint(3) NOT NULL default '0',
  'dst_skipweeks' smallint(3) NOT NULL default '0',
  'dst_time' varchar(6) NOT NULL default '00:00',
  'std_month' tinyint(2) NOT NULL default '0',
  'std_startday' smallint(3) NOT NULL default '0',
  'std_weekday' smallint(3) NOT NULL default '0',
  'std_skipweeks' smallint(3) NOT NULL default '0',
  'std_time' varchar(6) NOT NULL default '00:00',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users';
LOCK TABLES 'mdl_timezone' WRITE;
/*!40000 ALTER TABLE 'mdl_timezone' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_timezone' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_user';
CREATE TABLE 'mdl_user' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'auth' varchar(20) NOT NULL default 'manual',
  'confirmed' tinyint(1) NOT NULL default '0',
  'policyagreed' tinyint(1) NOT NULL default '0',
  'deleted' tinyint(1) NOT NULL default '0',
  'mnethostid' bigint(10) NOT NULL default '0',
  'username' varchar(100) NOT NULL default '',
  'password' varchar(32) NOT NULL default '',
  'idnumber' varchar(64) NOT NULL default '',
  'firstname' varchar(100) NOT NULL default '',
  'lastname' varchar(100) NOT NULL default '',
  'email' varchar(100) NOT NULL default '',
  'emailstop' tinyint(1) unsigned NOT NULL default '0',
  'icq' varchar(15) NOT NULL default '',
  'skype' varchar(50) NOT NULL default '',
  'yahoo' varchar(50) NOT NULL default '',
  'aim' varchar(50) NOT NULL default '',
  'msn' varchar(50) NOT NULL default '',
  'phone1' varchar(20) NOT NULL default '',
  'phone2' varchar(20) NOT NULL default '',
  'institution' varchar(40) NOT NULL default '',
  'department' varchar(30) NOT NULL default '',
  'address' varchar(70) NOT NULL default '',
  'city' varchar(20) NOT NULL default '',
  'country' varchar(2) NOT NULL default '',
  'lang' varchar(30) NOT NULL default 'en',
  'theme' varchar(50) NOT NULL default '',
  'timezone' varchar(100) NOT NULL default '99',
  'firstaccess' bigint(10) unsigned NOT NULL default '0',
  'lastaccess' bigint(10) unsigned NOT NULL default '0',
  'lastlogin' bigint(10) unsigned NOT NULL default '0',
  'currentlogin' bigint(10) unsigned NOT NULL default '0',
  'lastip' varchar(15) NOT NULL default '',
  'secret' varchar(15) NOT NULL default '',
  'picture' tinyint(1) NOT NULL default '0',
  'url' varchar(255) NOT NULL default '',
  'description' text,
  'mailformat' tinyint(1) unsigned NOT NULL default '1',
  'maildigest' tinyint(1) unsigned NOT NULL default '0',
  'maildisplay' tinyint(2) unsigned NOT NULL default '2',
  'htmleditor' tinyint(1) unsigned NOT NULL default '1',
  'ajax' tinyint(1) unsigned NOT NULL default '1',
  'autosubscribe' tinyint(1) unsigned NOT NULL default '1',
  'trackforums' tinyint(1) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'trustbitmask' bigint(10) unsigned NOT NULL default '0',
  'imagealt' varchar(255) default NULL,
  'screenreader' tinyint(1) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_user_mneuse_uix' ('mnethostid','username'),
  KEY 'mdl_user_del_ix' ('deleted'),
  KEY 'mdl_user_con_ix' ('confirmed'),
  KEY 'mdl_user_fir_ix' ('firstname'),
  KEY 'mdl_user_las_ix' ('lastname'),
  KEY 'mdl_user_cit_ix' ('city'),
  KEY 'mdl_user_cou_ix' ('country'),
  KEY 'mdl_user_las2_ix' ('lastaccess'),
  KEY 'mdl_user_ema_ix' ('email'),
  KEY 'mdl_user_aut_ix' ('auth'),
  KEY 'mdl_user_idn_ix' ('idnumber')
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='One record for each person';
LOCK TABLES 'mdl_user' WRITE;
/*!40000 ALTER TABLE 'mdl_user' DISABLE KEYS */;
INSERT INTO 'mdl_user' VALUES (1,'manual',1,0,0,1,'guest','084e0343a0486ff05530df6c705c8bb4','','Guest User',' ','root@localhost',0,'','','','','','','','','','','','','en_utf8','','99',0,0,0,0,'','',0,'','This user is a special user that allows read-only access to some courses.',1,0,2,1,1,1,0,1201718665,0,NULL,0),(2,'manual',1,0,0,1,'admin','21dc2a7bf153881e66c4d21462fed8cc','','ORVSD','Admin','webmaster@orvsd.org',0,'','','','','','','','','','','Corvallis','US','en_utf8','','99',0,1201718847,0,0,'140.211.18.56','',1,'','',1,0,1,1,1,1,0,1201718788,0,'',0);
/*!40000 ALTER TABLE 'mdl_user' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_user_info_category';
CREATE TABLE 'mdl_user_info_category' (
  'id' bigint(10) NOT NULL auto_increment,
  'name' varchar(255) NOT NULL default '',
  'sortorder' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories';
LOCK TABLES 'mdl_user_info_category' WRITE;
/*!40000 ALTER TABLE 'mdl_user_info_category' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_user_info_category' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_user_info_data';
CREATE TABLE 'mdl_user_info_data' (
  'id' bigint(10) NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'fieldid' bigint(10) unsigned NOT NULL default '0',
  'data' longtext NOT NULL,
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields';
LOCK TABLES 'mdl_user_info_data' WRITE;
/*!40000 ALTER TABLE 'mdl_user_info_data' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_user_info_data' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_user_info_field';
CREATE TABLE 'mdl_user_info_field' (
  'id' bigint(10) NOT NULL auto_increment,
  'shortname' varchar(255) NOT NULL default 'shortname',
  'name' longtext NOT NULL,
  'datatype' varchar(255) NOT NULL default '',
  'description' longtext,
  'categoryid' bigint(10) unsigned NOT NULL default '0',
  'sortorder' bigint(10) unsigned NOT NULL default '0',
  'required' tinyint(2) unsigned NOT NULL default '0',
  'locked' tinyint(2) unsigned NOT NULL default '0',
  'visible' smallint(4) unsigned NOT NULL default '0',
  'defaultdata' longtext,
  'param1' longtext,
  'param2' longtext,
  'param3' longtext,
  'param4' longtext,
  'param5' longtext,
  PRIMARY KEY  ('id')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields';
LOCK TABLES 'mdl_user_info_field' WRITE;
/*!40000 ALTER TABLE 'mdl_user_info_field' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_user_info_field' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_user_lastaccess';
CREATE TABLE 'mdl_user_lastaccess' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'courseid' bigint(10) unsigned NOT NULL default '0',
  'timeaccess' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_userlast_usecou_uix' ('userid','courseid'),
  KEY 'mdl_userlast_use_ix' ('userid'),
  KEY 'mdl_userlast_cou_ix' ('courseid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa';
LOCK TABLES 'mdl_user_lastaccess' WRITE;
/*!40000 ALTER TABLE 'mdl_user_lastaccess' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_user_lastaccess' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_user_preferences';
CREATE TABLE 'mdl_user_preferences' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'userid' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(50) NOT NULL default '',
  'value' varchar(255) NOT NULL default '',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_userpref_usenam_uix' ('userid','name')
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences';
LOCK TABLES 'mdl_user_preferences' WRITE;
/*!40000 ALTER TABLE 'mdl_user_preferences' DISABLE KEYS */;
INSERT INTO 'mdl_user_preferences' VALUES (1,2,'auth_forcepasswordchange','0'),(2,2,'email_bounce_count','1'),(3,2,'email_send_count','1');
/*!40000 ALTER TABLE 'mdl_user_preferences' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_wiki';
CREATE TABLE 'mdl_wiki' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'summary' text NOT NULL,
  'pagename' varchar(255) NOT NULL default '',
  'wtype' enum('teacher','group','student') NOT NULL default 'group',
  'ewikiprinttitle' smallint(4) unsigned NOT NULL default '1',
  'htmlmode' smallint(4) unsigned NOT NULL default '0',
  'ewikiacceptbinary' smallint(4) unsigned NOT NULL default '0',
  'disablecamelcase' smallint(4) unsigned NOT NULL default '0',
  'setpageflags' smallint(4) unsigned NOT NULL default '1',
  'strippages' smallint(4) unsigned NOT NULL default '1',
  'removepages' smallint(4) unsigned NOT NULL default '1',
  'revertchanges' smallint(4) unsigned NOT NULL default '1',
  'initialcontent' varchar(255) NOT NULL default '',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_wiki_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Main wik table';
LOCK TABLES 'mdl_wiki' WRITE;
/*!40000 ALTER TABLE 'mdl_wiki' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_wiki' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_wiki_entries';
CREATE TABLE 'mdl_wiki_entries' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'wikiid' bigint(10) unsigned NOT NULL default '0',
  'course' bigint(10) unsigned NOT NULL default '0',
  'groupid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'pagename' varchar(255) NOT NULL default '',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_wikientr_cou_ix' ('course'),
  KEY 'mdl_wikientr_gro_ix' ('groupid'),
  KEY 'mdl_wikientr_use_ix' ('userid'),
  KEY 'mdl_wikientr_pag_ix' ('pagename'),
  KEY 'mdl_wikientr_wik_ix' ('wikiid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds entries for each wiki start instance';
LOCK TABLES 'mdl_wiki_entries' WRITE;
/*!40000 ALTER TABLE 'mdl_wiki_entries' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_wiki_entries' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_wiki_locks';
CREATE TABLE 'mdl_wiki_locks' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'wikiid' bigint(10) unsigned NOT NULL,
  'pagename' varchar(160) NOT NULL default '',
  'lockedby' bigint(10) unsigned NOT NULL default '0',
  'lockedsince' bigint(10) unsigned NOT NULL default '0',
  'lockedseen' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_wikilock_wikpag_uix' ('wikiid','pagename'),
  KEY 'mdl_wikilock_loc_ix' ('lockedseen'),
  KEY 'mdl_wikilock_wik_ix' ('wikiid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores editing locks on Wiki pages';
LOCK TABLES 'mdl_wiki_locks' WRITE;
/*!40000 ALTER TABLE 'mdl_wiki_locks' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_wiki_locks' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_wiki_pages';
CREATE TABLE 'mdl_wiki_pages' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'pagename' varchar(160) NOT NULL default '',
  'version' bigint(10) unsigned NOT NULL default '0',
  'flags' bigint(10) unsigned default '0',
  'content' mediumtext,
  'author' varchar(100) default 'ewiki',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'created' bigint(10) unsigned default '0',
  'lastmodified' bigint(10) unsigned default '0',
  'refs' mediumtext,
  'meta' mediumtext,
  'hits' bigint(10) unsigned default '0',
  'wiki' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  UNIQUE KEY 'mdl_wikipage_pagverwik_uix' ('pagename','version','wiki'),
  KEY 'mdl_wikipage_wik_ix' ('wiki')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds the Wiki-Pages';
LOCK TABLES 'mdl_wiki_pages' WRITE;
/*!40000 ALTER TABLE 'mdl_wiki_pages' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_wiki_pages' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_workshop';
CREATE TABLE 'mdl_workshop' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'course' bigint(10) unsigned NOT NULL default '0',
  'name' varchar(255) NOT NULL default '',
  'description' text NOT NULL,
  'wtype' smallint(3) unsigned NOT NULL default '0',
  'nelements' smallint(3) unsigned NOT NULL default '1',
  'nattachments' smallint(3) unsigned NOT NULL default '0',
  'phase' tinyint(2) unsigned NOT NULL default '0',
  'format' tinyint(2) unsigned NOT NULL default '0',
  'gradingstrategy' tinyint(2) unsigned NOT NULL default '1',
  'resubmit' tinyint(2) unsigned NOT NULL default '0',
  'agreeassessments' tinyint(2) unsigned NOT NULL default '0',
  'hidegrades' tinyint(2) unsigned NOT NULL default '0',
  'anonymous' tinyint(2) unsigned NOT NULL default '0',
  'includeself' tinyint(2) unsigned NOT NULL default '0',
  'maxbytes' bigint(10) unsigned NOT NULL default '100000',
  'submissionstart' bigint(10) unsigned NOT NULL default '0',
  'assessmentstart' bigint(10) unsigned NOT NULL default '0',
  'submissionend' bigint(10) unsigned NOT NULL default '0',
  'assessmentend' bigint(10) unsigned NOT NULL default '0',
  'releasegrades' bigint(10) unsigned NOT NULL default '0',
  'grade' smallint(3) NOT NULL default '0',
  'gradinggrade' smallint(3) NOT NULL default '0',
  'ntassessments' smallint(3) unsigned NOT NULL default '0',
  'assessmentcomps' smallint(3) unsigned NOT NULL default '2',
  'nsassessments' smallint(3) unsigned NOT NULL default '0',
  'overallocation' smallint(3) unsigned NOT NULL default '0',
  'timemodified' bigint(10) unsigned NOT NULL default '0',
  'teacherweight' smallint(3) unsigned NOT NULL default '1',
  'showleaguetable' smallint(3) unsigned NOT NULL default '0',
  'usepassword' smallint(3) unsigned NOT NULL default '0',
  'password' varchar(32) NOT NULL default '',
  PRIMARY KEY  ('id'),
  KEY 'mdl_work_cou_ix' ('course')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines workshop';
LOCK TABLES 'mdl_workshop' WRITE;
/*!40000 ALTER TABLE 'mdl_workshop' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_workshop' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_workshop_assessments';
CREATE TABLE 'mdl_workshop_assessments' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'workshopid' bigint(10) unsigned NOT NULL default '0',
  'submissionid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'timegraded' bigint(10) unsigned NOT NULL default '0',
  'timeagreed' bigint(10) unsigned NOT NULL default '0',
  'grade' double NOT NULL default '0',
  'gradinggrade' smallint(3) NOT NULL default '0',
  'teachergraded' smallint(3) unsigned NOT NULL default '0',
  'mailed' smallint(3) unsigned NOT NULL default '0',
  'resubmission' smallint(3) unsigned NOT NULL default '0',
  'donotuse' smallint(3) unsigned NOT NULL default '0',
  'generalcomment' text NOT NULL,
  'teachercomment' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_workasse_use_ix' ('userid'),
  KEY 'mdl_workasse_mai_ix' ('mailed'),
  KEY 'mdl_workasse_wor_ix' ('workshopid'),
  KEY 'mdl_workasse_sub_ix' ('submissionid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about assessments by teacher and students';
LOCK TABLES 'mdl_workshop_assessments' WRITE;
/*!40000 ALTER TABLE 'mdl_workshop_assessments' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_workshop_assessments' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_workshop_comments';
CREATE TABLE 'mdl_workshop_comments' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'workshopid' bigint(10) unsigned NOT NULL default '0',
  'assessmentid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'mailed' tinyint(2) unsigned NOT NULL default '0',
  'comments' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_workcomm_use_ix' ('userid'),
  KEY 'mdl_workcomm_mai_ix' ('mailed'),
  KEY 'mdl_workcomm_wor_ix' ('workshopid'),
  KEY 'mdl_workcomm_ass_ix' ('assessmentid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines comments';
LOCK TABLES 'mdl_workshop_comments' WRITE;
/*!40000 ALTER TABLE 'mdl_workshop_comments' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_workshop_comments' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_workshop_elements';
CREATE TABLE 'mdl_workshop_elements' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'workshopid' bigint(10) unsigned NOT NULL default '0',
  'elementno' smallint(3) unsigned NOT NULL default '0',
  'description' text NOT NULL,
  'scale' smallint(3) unsigned NOT NULL default '0',
  'maxscore' smallint(3) unsigned NOT NULL default '1',
  'weight' smallint(3) unsigned NOT NULL default '11',
  'stddev' double NOT NULL default '0',
  'totalassessments' bigint(10) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_workelem_wor_ix' ('workshopid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about marking scheme of assignment';
LOCK TABLES 'mdl_workshop_elements' WRITE;
/*!40000 ALTER TABLE 'mdl_workshop_elements' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_workshop_elements' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_workshop_grades';
CREATE TABLE 'mdl_workshop_grades' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'workshopid' bigint(10) unsigned NOT NULL default '0',
  'assessmentid' bigint(10) unsigned NOT NULL default '0',
  'elementno' bigint(10) unsigned NOT NULL default '0',
  'feedback' text NOT NULL,
  'grade' smallint(3) NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_workgrad_wor_ix' ('workshopid'),
  KEY 'mdl_workgrad_ass_ix' ('assessmentid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about individual grades given to each element';
LOCK TABLES 'mdl_workshop_grades' WRITE;
/*!40000 ALTER TABLE 'mdl_workshop_grades' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_workshop_grades' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_workshop_rubrics';
CREATE TABLE 'mdl_workshop_rubrics' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'workshopid' bigint(10) unsigned NOT NULL default '0',
  'elementno' bigint(10) unsigned NOT NULL default '0',
  'rubricno' smallint(3) unsigned NOT NULL default '0',
  'description' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_workrubr_wor_ix' ('workshopid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about the rubrics marking scheme';
LOCK TABLES 'mdl_workshop_rubrics' WRITE;
/*!40000 ALTER TABLE 'mdl_workshop_rubrics' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_workshop_rubrics' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_workshop_stockcomments';
CREATE TABLE 'mdl_workshop_stockcomments' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'workshopid' bigint(10) unsigned NOT NULL default '0',
  'elementno' bigint(10) unsigned NOT NULL default '0',
  'comments' text NOT NULL,
  PRIMARY KEY  ('id'),
  KEY 'mdl_workstoc_wor_ix' ('workshopid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about the teacher comment bank';
LOCK TABLES 'mdl_workshop_stockcomments' WRITE;
/*!40000 ALTER TABLE 'mdl_workshop_stockcomments' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_workshop_stockcomments' ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS 'mdl_workshop_submissions';
CREATE TABLE 'mdl_workshop_submissions' (
  'id' bigint(10) unsigned NOT NULL auto_increment,
  'workshopid' bigint(10) unsigned NOT NULL default '0',
  'userid' bigint(10) unsigned NOT NULL default '0',
  'title' varchar(100) NOT NULL default '',
  'timecreated' bigint(10) unsigned NOT NULL default '0',
  'mailed' tinyint(2) unsigned NOT NULL default '0',
  'description' text NOT NULL,
  'gradinggrade' smallint(3) unsigned NOT NULL default '0',
  'finalgrade' smallint(3) unsigned NOT NULL default '0',
  'late' smallint(3) unsigned NOT NULL default '0',
  'nassessments' bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  ('id'),
  KEY 'mdl_worksubm_use_ix' ('userid'),
  KEY 'mdl_worksubm_mai_ix' ('mailed'),
  KEY 'mdl_worksubm_wor_ix' ('workshopid')
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about submitted work from teacher and students';
LOCK TABLES 'mdl_workshop_submissions' WRITE;
/*!40000 ALTER TABLE 'mdl_workshop_submissions' DISABLE KEYS */;
/*!40000 ALTER TABLE 'mdl_workshop_submissions' ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
