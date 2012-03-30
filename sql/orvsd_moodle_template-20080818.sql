DROP TABLE IF EXISTS adodb_logsql;;
CREATE TABLE adodb_logsql (
  id bigint(10) unsigned NOT NULL auto_increment,
  created datetime NOT NULL,
  sql0 varchar(250) NOT NULL default '',
  sql1 text,
  params text,
  tracer text,
  timer decimal(16,6) NOT NULL default '0.000000',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to save some logs from ADOdb';;
DROP TABLE IF EXISTS mdl_assignment;;
CREATE TABLE mdl_assignment (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  description text NOT NULL,
  format smallint(4) unsigned NOT NULL default '0',
  assignmenttype varchar(50) NOT NULL default '',
  resubmit tinyint(2) unsigned NOT NULL default '0',
  preventlate tinyint(2) unsigned NOT NULL default '0',
  emailteachers tinyint(2) unsigned NOT NULL default '0',
  var1 bigint(10) default '0',
  var2 bigint(10) default '0',
  var3 bigint(10) default '0',
  var4 bigint(10) default '0',
  var5 bigint(10) default '0',
  maxbytes bigint(10) unsigned NOT NULL default '100000',
  timedue bigint(10) unsigned NOT NULL default '0',
  timeavailable bigint(10) unsigned NOT NULL default '0',
  grade bigint(10) NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_assi_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines assignments';;
DROP TABLE IF EXISTS mdl_assignment_submissions;;
CREATE TABLE mdl_assignment_submissions (
  id bigint(10) unsigned NOT NULL auto_increment,
  assignment bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  numfiles bigint(10) unsigned NOT NULL default '0',
  data1 text NOT NULL,
  data2 text NOT NULL,
  grade bigint(11) NOT NULL default '0',
  submissioncomment text NOT NULL,
  format smallint(4) unsigned NOT NULL default '0',
  teacher bigint(10) unsigned NOT NULL default '0',
  timemarked bigint(10) unsigned NOT NULL default '0',
  mailed tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_assisubm_use_ix (userid),
  KEY mdl_assisubm_mai_ix (mailed),
  KEY mdl_assisubm_tim_ix (timemarked),
  KEY mdl_assisubm_ass_ix (assignment)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments';;
DROP TABLE IF EXISTS mdl_audiorecorder;;
CREATE TABLE mdl_audiorecorder (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  intro text NOT NULL,
  audiorecordertype varchar(50) NOT NULL default 'upload',
  var1 bigint(10) default '3',
  var2 bigint(10) default '0',
  var3 bigint(10) default '0',
  grade bigint(10) NOT NULL default '0',
  resubmit tinyint(2) unsigned NOT NULL default '0',
  preventlate tinyint(2) unsigned NOT NULL default '0',
  maxbytes bigint(10) unsigned NOT NULL default '100000',
  timedue bigint(10) unsigned NOT NULL default '0',
  timeavailable bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_audi_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines audiorecorders';;
DROP TABLE IF EXISTS mdl_audiorecorder_submissions;;
CREATE TABLE mdl_audiorecorder_submissions (
  id bigint(10) unsigned NOT NULL auto_increment,
  audiorecorder bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  numfiles bigint(10) unsigned NOT NULL default '0',
  data1 text NOT NULL,
  data2 text NOT NULL,
  grade bigint(11) NOT NULL default '0',
  comment text NOT NULL,
  format smallint(4) unsigned NOT NULL default '0',
  teacher bigint(10) unsigned NOT NULL default '0',
  timemarked bigint(10) unsigned NOT NULL default '0',
  mailed tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_audisubm_use_ix (userid),
  KEY mdl_audisubm_mai_ix (mailed),
  KEY mdl_audisubm_tim_ix (timemarked),
  KEY mdl_audisubm_aud_ix (audiorecorder)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about submitted audio files';;
DROP TABLE IF EXISTS mdl_backup_config;;
CREATE TABLE mdl_backup_config (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  value varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_backconf_nam_uix (name)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='To store backup configuration variables';;
INSERT INTO mdl_backup_config VALUES (1,'backup_sche_modules','0'),(2,'backup_sche_withuserdata','0'),(3,'backup_sche_metacourse','0'),(4,'backup_sche_users','0'),(5,'backup_sche_logs','0'),(6,'backup_sche_userfiles','0'),(7,'backup_sche_coursefiles','0'),(8,'backup_sche_messages','0'),(9,'backup_sche_keep','1'),(10,'backup_sche_active','0'),(11,'backup_sche_weekdays','0000000'),(12,'backup_sche_hour','0'),(13,'backup_sche_minute','0'),(14,'backup_sche_destination','');;
DROP TABLE IF EXISTS mdl_backup_courses;;
CREATE TABLE mdl_backup_courses (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  laststarttime bigint(10) unsigned NOT NULL default '0',
  lastendtime bigint(10) unsigned NOT NULL default '0',
  laststatus varchar(1) NOT NULL default '0',
  nextstarttime bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_backcour_cou_uix (courseid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store every course backup status';;
DROP TABLE IF EXISTS mdl_backup_files;;
CREATE TABLE mdl_backup_files (
  id bigint(10) unsigned NOT NULL auto_increment,
  backup_code bigint(10) unsigned NOT NULL default '0',
  file_type varchar(10) NOT NULL default '',
  path varchar(255) NOT NULL default '',
  old_id bigint(10) unsigned NOT NULL default '0',
  new_id bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_backfile_bacfilpat_uix (backup_code,file_type,path)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store and recode ids to user and course files';;
DROP TABLE IF EXISTS mdl_backup_ids;;
CREATE TABLE mdl_backup_ids (
  id bigint(10) unsigned NOT NULL auto_increment,
  backup_code bigint(12) unsigned NOT NULL default '0',
  table_name varchar(30) NOT NULL default '',
  old_id bigint(10) unsigned NOT NULL default '0',
  new_id bigint(10) unsigned NOT NULL default '0',
  info mediumtext NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_backids_bactabold_uix (backup_code,table_name,old_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store and convert ids in backup/restore';;
DROP TABLE IF EXISTS mdl_backup_log;;
CREATE TABLE mdl_backup_log (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  time bigint(10) unsigned NOT NULL default '0',
  laststarttime bigint(10) unsigned NOT NULL default '0',
  info varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_backlog_cou_ix (courseid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To store every course backup log info';;
DROP TABLE IF EXISTS mdl_block;;
CREATE TABLE mdl_block (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(40) NOT NULL default '',
  version bigint(10) unsigned NOT NULL default '0',
  cron bigint(10) unsigned NOT NULL default '0',
  lastcron bigint(10) unsigned NOT NULL default '0',
  visible tinyint(1) NOT NULL default '1',
  multiple tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='to store installed blocks';;
INSERT INTO mdl_block VALUES (1,'activity_modules',2006011300,0,0,1,0),(2,'admin',2004081200,0,0,1,0),(3,'admin_bookmarks',2006090300,0,0,1,0),(4,'admin_tree',2006090300,0,0,1,0),(5,'blog_menu',2004112000,0,0,1,0),(6,'blog_tags',2006032000,0,0,1,1),(7,'calendar_month',2004081200,0,0,1,0),(8,'calendar_upcoming',2004052600,0,0,1,0),(9,'course_list',2004111600,0,0,1,0),(10,'course_summary',2004052600,0,0,1,0),(11,'glossary_random',2005040500,0,0,1,1),(12,'html',2004123000,0,0,1,1),(13,'loancalc',2005022100,0,0,1,0),(14,'login',2006102700,0,0,1,0),(15,'mentees',2007030900,0,0,1,1),(16,'messages',2004122800,0,0,1,0),(17,'mnet_hosts',2006112100,0,0,1,0),(18,'news_items',2005030800,0,0,1,0),(19,'online_users',2006030100,0,0,1,0),(20,'participants',2004052600,0,0,1,0),(21,'quiz_results',2005082300,0,0,1,1),(22,'recent_activity',2004042900,0,0,1,0),(23,'rss_client',2006100102,0,0,1,1),(24,'search',2007081100,1,0,1,0),(25,'search_forums',2005030900,0,0,1,0),(26,'section_links',2004052800,0,0,1,0),(27,'site_main_menu',2005061300,0,0,1,0),(28,'social_activities',2004041800,0,0,1,0);;
DROP TABLE IF EXISTS mdl_block_instance;;
CREATE TABLE mdl_block_instance (
  id bigint(10) unsigned NOT NULL auto_increment,
  blockid bigint(10) unsigned NOT NULL default '0',
  pageid bigint(10) unsigned NOT NULL default '0',
  pagetype varchar(20) NOT NULL default '',
  position varchar(10) NOT NULL default '',
  weight smallint(3) NOT NULL default '0',
  visible tinyint(1) NOT NULL default '0',
  configdata text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_blocinst_pag_ix (pageid),
  KEY mdl_blocinst_pag2_ix (pagetype),
  KEY mdl_blocinst_blo_ix (blockid)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='to store block instances in pages';;
INSERT INTO mdl_block_instance VALUES (1,27,1,'course-view','l',0,1,''),(2,4,1,'course-view','l',1,1,''),(3,10,1,'course-view','r',0,1,''),(4,7,1,'course-view','r',1,1,''),(5,4,0,'admin','l',0,1,''),(6,3,0,'admin','l',1,1,'');;
DROP TABLE IF EXISTS mdl_block_pinned;;
CREATE TABLE mdl_block_pinned (
  id bigint(10) unsigned NOT NULL auto_increment,
  blockid bigint(10) unsigned NOT NULL default '0',
  pagetype varchar(20) NOT NULL default '',
  position varchar(10) NOT NULL default '',
  weight smallint(3) NOT NULL default '0',
  visible tinyint(1) NOT NULL default '0',
  configdata text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_blocpinn_pag_ix (pagetype),
  KEY mdl_blocpinn_blo_ix (blockid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to pin blocks';;
DROP TABLE IF EXISTS mdl_block_rss_client;;
CREATE TABLE mdl_block_rss_client (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  title text NOT NULL,
  preferredtitle varchar(64) NOT NULL default '',
  description text NOT NULL,
  shared tinyint(2) unsigned NOT NULL default '0',
  url varchar(255) NOT NULL default '',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the';;
DROP TABLE IF EXISTS mdl_block_search_documents;;
CREATE TABLE mdl_block_search_documents (
  id bigint(10) unsigned NOT NULL auto_increment,
  docid varchar(32) NOT NULL default '',
  doctype varchar(32) NOT NULL default 'none',
  itemtype varchar(32) NOT NULL default 'standard',
  title varchar(255) NOT NULL default '',
  url varchar(255) NOT NULL default '',
  docdate datetime NOT NULL,
  updated datetime NOT NULL,
  courseid bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_blocseardocu_doc_ix (docid),
  KEY mdl_blocseardocu_doc2_ix (doctype),
  KEY mdl_blocseardocu_ite_ix (itemtype)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='table to store search index backups';;
DROP TABLE IF EXISTS mdl_blog_tag_instance;;
CREATE TABLE mdl_blog_tag_instance (
  id bigint(10) unsigned NOT NULL auto_increment,
  entryid bigint(10) unsigned NOT NULL default '0',
  tagid bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) unsigned NOT NULL default '0',
  courseid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_blogtaginst_ent_ix (entryid),
  KEY mdl_blogtaginst_tag_ix (tagid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tag instance for blogs';;
DROP TABLE IF EXISTS mdl_book;;
CREATE TABLE mdl_book (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  summary mediumtext NOT NULL,
  numbering smallint(4) unsigned NOT NULL default '0',
  disableprinting tinyint(2) unsigned NOT NULL default '2',
  customtitles tinyint(2) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines book';;
DROP TABLE IF EXISTS mdl_book_chapters;;
CREATE TABLE mdl_book_chapters (
  id bigint(10) NOT NULL auto_increment,
  bookid bigint(10) unsigned NOT NULL default '0',
  pagenum bigint(10) unsigned NOT NULL default '0',
  subchapter bigint(10) unsigned NOT NULL default '0',
  title varchar(255) NOT NULL default '',
  content longtext NOT NULL,
  hidden tinyint(2) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  importsrc bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters';;
DROP TABLE IF EXISTS mdl_cache_filters;;
CREATE TABLE mdl_cache_filters (
  id bigint(10) unsigned NOT NULL auto_increment,
  filter varchar(32) NOT NULL default '',
  version bigint(10) unsigned NOT NULL default '0',
  md5key varchar(32) NOT NULL default '',
  rawtext text NOT NULL,
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_cachfilt_filmd5_ix (filter,md5key)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data';;
DROP TABLE IF EXISTS mdl_cache_text;;
CREATE TABLE mdl_cache_text (
  id bigint(10) unsigned NOT NULL auto_increment,
  md5key varchar(32) NOT NULL default '',
  formattedtext longtext NOT NULL,
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_cachtext_md5_ix (md5key)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts';;
DROP TABLE IF EXISTS mdl_capabilities;;
CREATE TABLE mdl_capabilities (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  captype varchar(50) NOT NULL default '',
  contextlevel bigint(10) unsigned NOT NULL default '0',
  component varchar(100) NOT NULL default '',
  riskbitmask bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_capa_nam_uix (name)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities';;
INSERT INTO mdl_capabilities VALUES (1,'moodle/site:doanything','admin',10,'moodle',30),(2,'moodle/legacy:guest','legacy',10,'moodle',0),(3,'moodle/legacy:user','legacy',10,'moodle',0),(4,'moodle/legacy:student','legacy',10,'moodle',16),(5,'moodle/legacy:teacher','legacy',10,'moodle',24),(6,'moodle/legacy:editingteacher','legacy',10,'moodle',28),(7,'moodle/legacy:coursecreator','legacy',10,'moodle',28),(8,'moodle/legacy:admin','legacy',10,'moodle',30),(9,'moodle/site:config','write',10,'moodle',30),(10,'moodle/site:readallmessages','read',10,'moodle',8),(11,'moodle/site:sendmessage','write',10,'moodle',8),(12,'moodle/site:approvecourse','write',10,'moodle',4),(13,'moodle/site:import','write',10,'moodle',28),(14,'moodle/site:backup','write',10,'moodle',28),(15,'moodle/site:restore','write',10,'moodle',28),(16,'moodle/site:manageblocks','write',10,'moodle',20),(17,'moodle/site:accessallgroups','read',10,'moodle',0),(18,'moodle/site:viewfullnames','read',10,'moodle',0),(19,'moodle/site:viewreports','read',10,'moodle',8),(20,'moodle/site:trustcontent','write',10,'moodle',4),(21,'moodle/site:uploadusers','write',10,'moodle',24),(22,'moodle/user:create','write',10,'moodle',24),(23,'moodle/user:delete','write',10,'moodle',8),(24,'moodle/user:update','write',10,'moodle',24),(25,'moodle/user:viewdetails','read',10,'moodle',0),(26,'moodle/user:viewhiddendetails','read',10,'moodle',8),(27,'moodle/user:viewusergrades','write',50,'moodle',0),(28,'moodle/user:loginas','write',50,'moodle',30),(29,'moodle/role:assign','write',10,'moodle',0),(30,'moodle/role:override','write',10,'moodle',28),(31,'moodle/role:manage','write',10,'moodle',28),(32,'moodle/role:unassignself','write',10,'moodle',0),(33,'moodle/role:viewhiddenassigns','read',10,'moodle',0),(34,'moodle/role:switchroles','read',10,'moodle',4),(35,'moodle/category:create','write',40,'moodle',4),(36,'moodle/category:delete','write',40,'moodle',0),(37,'moodle/category:update','write',40,'moodle',4),(38,'moodle/category:visibility','write',40,'moodle',0),(39,'moodle/course:create','write',40,'moodle',4),(40,'moodle/course:delete','write',50,'moodle',0),(41,'moodle/course:update','write',50,'moodle',4),(42,'moodle/course:view','read',50,'moodle',0),(43,'moodle/course:bulkmessaging','write',50,'moodle',16),(44,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(45,'moodle/course:viewhiddencourses','read',50,'moodle',0),(46,'moodle/course:visibility','write',50,'moodle',0),(47,'moodle/course:managefiles','write',50,'moodle',4),(48,'moodle/course:manageactivities','write',50,'moodle',4),(49,'moodle/course:managemetacourse','write',50,'moodle',0),(50,'moodle/course:activityvisibility','write',50,'moodle',0),(51,'moodle/course:viewhiddenactivities','write',50,'moodle',0),(52,'moodle/course:viewparticipants','read',50,'moodle',0),(53,'moodle/course:viewscales','read',50,'moodle',0),(54,'moodle/course:managescales','write',50,'moodle',0),(55,'moodle/course:managegroups','write',50,'moodle',0),(56,'moodle/course:reset','write',50,'moodle',0),(57,'moodle/blog:view','read',10,'moodle',0),(58,'moodle/blog:create','write',10,'moodle',16),(59,'moodle/blog:manageofficialtags','write',10,'moodle',16),(60,'moodle/blog:managepersonaltags','write',10,'moodle',16),(61,'moodle/blog:manageentries','write',10,'moodle',16),(62,'moodle/calendar:manageownentries','write',10,'moodle',16),(63,'moodle/calendar:manageentries','write',10,'moodle',16),(64,'moodle/user:editprofile','read',30,'moodle',16),(65,'moodle/user:readuserposts','read',30,'moodle',0),(66,'moodle/user:readuserblogs','read',30,'moodle',0),(67,'moodle/user:viewuseractivitiesreport','read',30,'moodle',0),(68,'moodle/question:import','write',50,'moodle',4),(69,'moodle/question:export','read',50,'moodle',0),(70,'moodle/question:managecategory','write',50,'moodle',0),(71,'moodle/question:manage','write',50,'moodle',4),(72,'moodle/site:doclinks','read',10,'moodle',0),(73,'moodle/course:sectionvisibility','write',50,'moodle',0),(74,'moodle/course:useremail','write',50,'moodle',0),(75,'moodle/course:viewhiddensections','write',50,'moodle',0),(76,'moodle/course:setcurrentsection','write',50,'moodle',0),(77,'moodle/course:viewcoursegrades','read',50,'moodle',8),(78,'moodle/course:managegrades','write',50,'moodle',8),(79,'moodle/site:mnetlogintoremote','read',10,'moodle',12),(80,'moodle/my:manageblocks','write',10,'moodle',0),(81,'mod/assignment:view','read',70,'mod/assignment',0),(82,'mod/assignment:submit','write',70,'mod/assignment',0),(83,'mod/assignment:grade','write',70,'mod/assignment',0),(84,'mod/chat:chat','write',70,'mod/chat',16),(85,'mod/chat:readlog','read',70,'mod/chat',0),(86,'mod/chat:deletelog','write',70,'mod/chat',0),(87,'mod/choice:choose','write',70,'mod/choice',0),(88,'mod/choice:readresponses','read',70,'mod/choice',0),(89,'mod/choice:deleteresponses','write',70,'mod/choice',0),(90,'mod/choice:downloadresponses','read',70,'mod/choice',0),(91,'mod/data:viewentry','read',70,'mod/data',0),(92,'mod/data:writeentry','write',70,'mod/data',16),(93,'mod/data:comment','write',70,'mod/data',16),(94,'mod/data:viewrating','read',70,'mod/data',0),(95,'mod/data:rate','write',70,'mod/data',0),(96,'mod/data:approve','write',70,'mod/data',0),(97,'mod/data:manageentries','write',70,'mod/data',16),(98,'mod/data:managecomments','write',70,'mod/data',16),(99,'mod/data:managetemplates','write',70,'mod/data',20),(100,'mod/data:viewalluserpresets','read',70,'mod/data',0),(101,'mod/data:manageuserpresets','write',70,'mod/data',20),(102,'mod/forum:viewdiscussion','read',70,'mod/forum',0),(103,'mod/forum:viewhiddentimedposts','read',70,'mod/forum',0),(104,'mod/forum:startdiscussion','write',70,'mod/forum',16),(105,'mod/forum:replypost','write',70,'mod/forum',16),(106,'mod/forum:addnews','write',70,'mod/forum',16),(107,'mod/forum:replynews','write',70,'mod/forum',16),(108,'mod/forum:viewrating','read',70,'mod/forum',0),(109,'mod/forum:viewanyrating','read',70,'mod/forum',0),(110,'mod/forum:rate','write',70,'mod/forum',0),(111,'mod/forum:createattachment','write',70,'mod/forum',16),(112,'mod/forum:deleteownpost','read',70,'mod/forum',0),(113,'mod/forum:deleteanypost','read',70,'mod/forum',0),(114,'mod/forum:splitdiscussions','read',70,'mod/forum',0),(115,'mod/forum:movediscussions','read',70,'mod/forum',0),(116,'mod/forum:editanypost','write',70,'mod/forum',16),(117,'mod/forum:viewqandawithoutposting','read',70,'mod/forum',0),(118,'mod/forum:viewsubscribers','read',70,'mod/forum',0),(119,'mod/forum:managesubscriptions','read',70,'mod/forum',0),(120,'mod/forum:initialsubscriptions','read',70,'mod/forum',0),(121,'mod/forum:throttlingapplies','write',70,'mod/forum',16),(122,'mod/glossary:write','write',70,'mod/glossary',16),(123,'mod/glossary:manageentries','write',70,'mod/glossary',16),(124,'mod/glossary:managecategories','write',70,'mod/glossary',16),(125,'mod/glossary:comment','write',70,'mod/glossary',16),(126,'mod/glossary:managecomments','write',70,'mod/glossary',16),(127,'mod/glossary:import','write',70,'mod/glossary',16),(128,'mod/glossary:export','read',70,'mod/glossary',0),(129,'mod/glossary:approve','write',70,'mod/glossary',16),(130,'mod/glossary:rate','write',70,'mod/glossary',0),(131,'mod/glossary:viewrating','read',70,'mod/glossary',0),(132,'mod/hotpot:attempt','read',70,'mod/hotpot',0),(133,'mod/hotpot:viewreport','read',70,'mod/hotpot',0),(134,'mod/hotpot:grade','read',70,'mod/hotpot',0),(135,'mod/hotpot:deleteattempt','read',70,'mod/hotpot',0),(136,'mod/lams:participate','write',70,'mod/lams',0),(137,'mod/lams:manage','write',70,'mod/lams',0),(138,'mod/lesson:edit','write',70,'mod/lesson',4),(139,'mod/lesson:manage','write',70,'mod/lesson',0),(140,'mod/quiz:view','read',70,'mod/quiz',0),(141,'mod/quiz:attempt','write',70,'mod/quiz',0),(142,'mod/quiz:manage','write',70,'mod/quiz',0),(143,'mod/quiz:preview','write',70,'mod/quiz',0),(144,'mod/quiz:grade','write',70,'mod/quiz',0),(145,'mod/quiz:viewreports','read',70,'mod/quiz',0),(146,'mod/quiz:deleteattempts','write',70,'mod/quiz',0),(147,'mod/quiz:ignoretimelimits','read',70,'mod/quiz',0),(148,'mod/scorm:viewreport','read',70,'mod/scorm',0),(149,'mod/scorm:skipview','write',70,'mod/scorm',0),(150,'mod/scorm:savetrack','write',70,'mod/scorm',0),(151,'mod/scorm:viewscores','read',70,'mod/scorm',0),(152,'mod/survey:participate','read',70,'mod/survey',0),(153,'mod/survey:readresponses','read',70,'mod/survey',0),(154,'mod/survey:download','read',70,'mod/survey',0),(155,'mod/wiki:participate','write',70,'mod/wiki',16),(156,'mod/wiki:manage','write',70,'mod/wiki',16),(157,'mod/wiki:overridelock','write',70,'mod/wiki',0),(158,'mod/workshop:participate','write',70,'mod/workshop',16),(159,'mod/workshop:manage','write',70,'mod/workshop',16),(160,'block/rss_client:createprivatefeeds','write',10,'block/rss_client',0),(161,'block/rss_client:createsharedfeeds','write',10,'block/rss_client',16),(162,'block/rss_client:manageownfeeds','write',10,'block/rss_client',0),(163,'block/rss_client:manageanyfeeds','write',10,'block/rss_client',16),(164,'enrol/authorize:managepayments','write',10,'enrol/authorize',8),(165,'enrol/authorize:uploadcsv','write',30,'enrol/authorize',4),(166,'mod/audiorecorder:view','read',70,'mod/audiorecorder',0),(167,'mod/audiorecorder:submit','write',70,'mod/audiorecorder',0),(168,'mod/audiorecorder:grade','write',70,'mod/audiorecorder',0);;
DROP TABLE IF EXISTS mdl_chat;;
CREATE TABLE mdl_chat (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  intro text NOT NULL,
  keepdays bigint(11) NOT NULL default '0',
  studentlogs smallint(4) NOT NULL default '0',
  chattime bigint(10) unsigned NOT NULL default '0',
  schedule smallint(4) NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_chat_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room';;
DROP TABLE IF EXISTS mdl_chat_messages;;
CREATE TABLE mdl_chat_messages (
  id bigint(10) unsigned NOT NULL auto_increment,
  chatid bigint(10) NOT NULL default '0',
  userid bigint(10) NOT NULL default '0',
  groupid bigint(10) NOT NULL default '0',
  system tinyint(1) unsigned NOT NULL default '0',
  message text NOT NULL,
  timestamp bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_chatmess_use_ix (userid),
  KEY mdl_chatmess_gro_ix (groupid),
  KEY mdl_chatmess_timcha_ix (timestamp,chatid),
  KEY mdl_chatmess_cha_ix (chatid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages';;
DROP TABLE IF EXISTS mdl_chat_users;;
CREATE TABLE mdl_chat_users (
  id bigint(10) unsigned NOT NULL auto_increment,
  chatid bigint(11) NOT NULL default '0',
  userid bigint(11) NOT NULL default '0',
  groupid bigint(11) NOT NULL default '0',
  version varchar(16) NOT NULL default '',
  ip varchar(15) NOT NULL default '',
  firstping bigint(10) unsigned NOT NULL default '0',
  lastping bigint(10) unsigned NOT NULL default '0',
  lastmessageping bigint(10) unsigned NOT NULL default '0',
  sid varchar(32) NOT NULL default '',
  course bigint(10) unsigned NOT NULL default '0',
  lang varchar(30) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_chatuser_use_ix (userid),
  KEY mdl_chatuser_las_ix (lastping),
  KEY mdl_chatuser_gro_ix (groupid),
  KEY mdl_chatuser_cha_ix (chatid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms';;
DROP TABLE IF EXISTS mdl_choice;;
CREATE TABLE mdl_choice (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  text text NOT NULL,
  format tinyint(2) unsigned NOT NULL default '0',
  publish tinyint(2) unsigned NOT NULL default '0',
  showresults tinyint(2) unsigned NOT NULL default '0',
  display smallint(4) unsigned NOT NULL default '0',
  allowupdate tinyint(2) unsigned NOT NULL default '0',
  showunanswered tinyint(2) unsigned NOT NULL default '0',
  limitanswers tinyint(2) unsigned NOT NULL default '0',
  timeopen bigint(10) unsigned NOT NULL default '0',
  timeclose bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_choi_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here';;
DROP TABLE IF EXISTS mdl_choice_answers;;
CREATE TABLE mdl_choice_answers (
  id bigint(10) unsigned NOT NULL auto_increment,
  choiceid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  optionid bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_choiansw_use_ix (userid),
  KEY mdl_choiansw_cho_ix (choiceid),
  KEY mdl_choiansw_opt_ix (optionid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='choices performed by users';;
DROP TABLE IF EXISTS mdl_choice_options;;
CREATE TABLE mdl_choice_options (
  id bigint(10) unsigned NOT NULL auto_increment,
  choiceid bigint(10) unsigned NOT NULL default '0',
  text text,
  maxanswers bigint(10) unsigned default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_choiopti_cho_ix (choiceid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='available options to choice';;
DROP TABLE IF EXISTS mdl_config;;
CREATE TABLE mdl_config (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_conf_nam_uix (name)
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables';;
INSERT INTO mdl_config VALUES (1,'unicodedb','1'),(2,'group_version','2007012401'),(3,'statsrolesupgraded','1201718639'),(4,'guestroleid','6'),(5,'creatornewroleid','3'),(6,'notloggedinroleid','6'),(7,'defaultuserroleid','7'),(8,'defaultcourseroleid','5'),(9,'autologinguests','0'),(10,'nonmetacoursesyncroleids',''),(11,'hiddenuserfields',''),(12,'enablecourserequests','0'),(13,'defaultrequestcategory','1'),(14,'timezone','PST8PDT'),(15,'forcetimezone','99'),(16,'country','US'),(17,'iplookup','hostip'),(18,'lang','en_utf8'),(19,'langmenu','1'),(20,'langlist',''),(21,'langcache','1'),(22,'locale',''),(23,'latinexcelexport','0'),(24,'protectusernames','1'),(25,'forcelogin','0'),(26,'forceloginforprofiles','1'),(27,'opentogoogle','0'),(28,'maxbytes','0'),(29,'messaging','1'),(30,'allowobjectembed','0'),(31,'enabletrusttext','0'),(32,'maxeditingtime','1800'),(33,'fullnamedisplay','firstname lastname'),(34,'extendedusernamechars','0'),(35,'sitepolicy',''),(36,'bloglevel','4'),(37,'cronclionly','0'),(38,'cronremotepassword',''),(39,'loginhttps','0'),(40,'restrictmodulesfor','none'),(41,'restrictbydefault','0'),(42,'defaultallowedmodules',''),(43,'displayloginfailures',''),(44,'notifyloginfailures',''),(45,'notifyloginthreshold','10'),(46,'runclamonupload','0'),(47,'pathtoclam',''),(48,'quarantinedir',''),(49,'clamfailureonupload','donothing'),(50,'themelist',''),(51,'allowuserthemes','0'),(52,'allowcoursethemes','0'),(53,'allowuserblockhiding','1'),(54,'showblocksonmodpages','0'),(55,'calendar_adminseesall','0'),(56,'calendar_site_timeformat','0'),(57,'calendar_startwday','0'),(58,'calendar_weekend','65'),(59,'calendar_lookahead','21'),(60,'calendar_maxevents','10'),(61,'cachetext','60'),(62,'filteruploadedfiles','0'),(63,'filtermatchoneperpage','0'),(64,'filtermatchonepertext','0'),(65,'filterall','0'),(66,'htmleditor','1'),(67,'editorbackgroundcolor','#ffffff'),(68,'editorfontfamily','Trebuchet MS,Verdana,Arial,Helvetica,sans-serif'),(69,'editorfontsize',''),(70,'editorfontlist','Trebuchet:Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial:arial,helvetica,sans-serif;Courier New:courier new,courier,monospace;Georgia:georgia,times new roman,times,serif;Tahoma:tahoma,arial,helvetica,sans-serif;Times New Roman:times new roman,times,serif;Verdana:verdana,arial,helvetica,sans-serif;Impact:impact;Wingdings:wingdings'),(71,'editorkillword','1'),(72,'editorhidebuttons',''),(73,'docroot','http://docs.moodle.org'),(74,'doctonewwindow','0'),(75,'mymoodleredirect','0'),(76,'gradebookroles','5'),(77,'coursemanager','3'),(78,'frontpage','2,0,,'),(79,'frontpageloggedin','4,,,'),(80,'coursesperpage','20'),(81,'allowvisiblecoursesinhiddencategories','0'),(82,'gdversion','2'),(83,'zip','/usr/bin/zip'),(84,'unzip','/usr/bin/unzip'),(85,'pathtodu','/usr/bin/du'),(86,'aspellpath','/usr/bin/aspell'),(87,'smtphosts',''),(88,'smtpuser',''),(89,'smtppass',''),(90,'noreplyaddress','noreply@template.orvsd.org'),(91,'allowemailaddresses',''),(92,'denyemailaddresses',''),(93,'digestmailtime','17'),(94,'sitemailcharset',''),(95,'allowusermailcharset','0'),(96,'dbsessions','0'),(97,'sessiontimeout','7200'),(98,'sessioncookie',''),(99,'sessioncookiepath','/'),(100,'enablerssfeeds','0'),(101,'debug',''),(102,'debugdisplay','1'),(103,'debugsmtp','0'),(104,'perfdebug','7'),(105,'enablestats','0'),(106,'statsfirstrun','none'),(107,'statsmaxruntime','0'),(108,'statsruntimestarthour','0'),(109,'statsruntimestartminute','0'),(110,'statsuserthreshold','0'),(111,'framename','_top'),(112,'slasharguments','1'),(113,'proxyhost',''),(114,'proxyport','0'),(115,'longtimenosee','120'),(116,'deleteunconfirmed','168'),(117,'loglifetime','0'),(118,'cachetype',''),(119,'rcache',''),(120,'rcachettl','10'),(121,'intcachemax','10'),(122,'memcachedhosts',''),(123,'memcachedpconn',''),(124,'enableajax','0'),(125,'enableglobalsearch','0'),(126,'smartpix','0'),(127,'alternateloginurl',''),(128,'auth','email'),(129,'auth_pop3mailbox','INBOX'),(130,'changepassword',''),(131,'enrol','manual'),(132,'enrol_plugins_enabled','manual'),(133,'guestloginbutton','1'),(134,'registerauth','email'),(135,'style','default'),(136,'template','default'),(137,'theme','standardwhite'),(138,'filter_multilang_converted','1'),(139,'mnet_dispatcher_mode','off'),(140,'mnet_localhost_id','1'),(141,'mnet_all_hosts_id','2'),(142,'version','2007021540'),(143,'release','1.8.4+'),(144,'assignment_maxbytes','1024000'),(145,'assignment_itemstocount','1'),(146,'assignment_online_version','2005042900'),(147,'chat_refresh_room','5'),(148,'chat_refresh_userlist','10'),(149,'chat_old_ping','35'),(150,'chat_method','header_js'),(151,'chat_normal_updatemode','jsupdate'),(152,'chat_serverhost','template.orvsd.org'),(153,'chat_serverip','127.0.0.1'),(154,'chat_serverport','9111'),(155,'chat_servermax','100'),(156,'forum_displaymode','3'),(157,'forum_shortpost','300'),(158,'forum_longpost','600'),(159,'forum_manydiscussions','100'),(160,'forum_maxbytes','512000'),(161,'forum_trackreadposts','1'),(162,'forum_oldpostdays','14'),(163,'forum_usermarksread',''),(164,'forum_cleanreadtime','2'),(165,'forum_replytouser','1'),(166,'glossary_studentspost','1'),(167,'glossary_dupentries','0'),(168,'glossary_allowcomments','0'),(169,'glossary_linkbydefault','1'),(170,'glossary_defaultapproval','1'),(171,'glossary_entbypage','10'),(172,'hotpot_showtimes','0'),(173,'hotpot_excelencodings',''),(174,'hotpot_initialdisable','1'),(175,'journal_showrecentactivity','1'),(176,'journal_initialdisable','1'),(177,'lams_initialdisable','1'),(178,'quiz_review','16777215'),(179,'quiz_attemptonlast','0'),(180,'quiz_attempts','0'),(181,'quiz_grademethod',''),(182,'quiz_decimalpoints','2'),(183,'quiz_maximumgrade','10'),(184,'quiz_password',''),(185,'quiz_popup','0'),(186,'quiz_questionsperpage','0'),(187,'quiz_shuffleanswers','1'),(188,'quiz_shufflequestions','0'),(189,'quiz_subnet',''),(190,'quiz_timelimit','0'),(191,'quiz_optionflags','1'),(192,'quiz_penaltyscheme','1'),(193,'quiz_delay1','0'),(194,'quiz_delay2','0'),(195,'quiz_fix_review','0'),(196,'quiz_fix_attemptonlast','0'),(197,'quiz_fix_attempts','0'),(198,'quiz_fix_grademethod','0'),(199,'quiz_fix_decimalpoints','0'),(200,'quiz_fix_password','0'),(201,'quiz_fix_popup','0'),(202,'quiz_fix_questionsperpage','0'),(203,'quiz_fix_shuffleanswers','0'),(204,'quiz_fix_shufflequestions','0'),(205,'quiz_fix_subnet','0'),(206,'quiz_fix_timelimit','0'),(207,'quiz_fix_adaptive','0'),(208,'quiz_fix_penaltyscheme','0'),(209,'quiz_fix_delay1','0'),(210,'quiz_fix_delay2','0'),(211,'resource_framesize','130'),(212,'resource_websearch','http://google.com/'),(213,'resource_defaulturl','http://'),(214,'resource_filterexternalpages',''),(215,'resource_secretphrase','eIkY3g7Jkfi1ye2sgXtv'),(216,'resource_popup',''),(217,'resource_windowsettings','0'),(218,'resource_parametersettings','0'),(219,'resource_allowlocalfiles','0'),(220,'resource_hide_repository','1'),(221,'resource_autofilerename','1'),(222,'resource_blockdeletingfile','1'),(223,'resource_popupresizable','checked'),(224,'resource_popupscrollbars','checked'),(225,'resource_popupdirectories','checked'),(226,'resource_popuplocation','checked'),(227,'resource_popupmenubar','checked'),(228,'resource_popuptoolbar','checked'),(229,'resource_popupstatus','checked'),(230,'resource_popupwidth','620'),(231,'resource_popupheight','450'),(232,'scorm_maxattempts','6'),(233,'scorm_frameheight','500'),(234,'scorm_framewidth','100%'),(235,'scorm_updatetime','2'),(236,'scorm_advancedsettings','0'),(237,'scorm_windowsettings','0'),(238,'qtype_calculated_version','2006032200'),(239,'qtype_essay_version','2006032200'),(240,'qtype_match_version','2006032200'),(241,'qtype_multianswer_version','2006032200'),(242,'qtype_multichoice_version','2006121501'),(243,'qtype_numerical_version','2006121500'),(244,'qtype_randomsamatch_version','2006042800'),(245,'qtype_rqp_version','2006032201'),(246,'qtype_shortanswer_version','2006032200'),(247,'qtype_truefalse_version','2006032200'),(248,'backup_version','2007022100'),(249,'backup_release','1.8+'),(250,'blocks_version','2005090201'),(251,'enrol_authorize_version','2006112901'),(252,'enrol_paypal_version','2006092200'),(253,'adminblocks_initialised','1'),(254,'siteidentifier','enIwFpxla6ItJvEQ3rDzHpgP0QKTGxzstemplate.orvsd.org'),(255,'rolesactive','1'),(256,'digestmailtimelast','1219078858'),(257,'forum_lastreadclean','1219017843'),(258,'scorm_updatetimelast','1219024859'),(259,'slideshow_maxsize','60'),(260,'slideshow_maxwidth','600'),(261,'slideshow_maxheight','400'),(262,'slideshow_keeporiginals','1'),(263,'book_tocwidth','180'),(264,'auth_instructions','');;
DROP TABLE IF EXISTS mdl_config_plugins;;
CREATE TABLE mdl_config_plugins (
  id bigint(10) unsigned NOT NULL auto_increment,
  plugin varchar(100) NOT NULL default 'core',
  name varchar(100) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_confplug_plunam_uix (plugin,name)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables';;
INSERT INTO mdl_config_plugins VALUES (1,'mnet','openssl_history','a:0:{}'),(2,'mnet','openssl_generations','3'),(3,'mnet','openssl','-----BEGIN CERTIFICATE-----\nMIIEADCCA2mgAwIBAgIBADANBgkqhkiG9w0BAQQFADCBtzELMAkGA1UEBhMCTlox\nEzARBgNVBAgTCldlbGxpbmd0b24xEzARBgNVBAcTCldlbGxpbmd0b24xFzAVBgNV\nBAoUDk9SVlNEX0ZVTExOQU1FMQ8wDQYDVQQLEwZNb29kbGUxKTAnBgNVBAMTIGh0\ndHA6Ly90ZW1wbGF0ZS5vcnZzZC5vcmcvbW9vZGxlMSkwJwYJKoZIhvcNAQkBFhpu\nb3JlcGx5QHRlbXBsYXRlLm9ydnNkLm9yZzAeFw0wODAzMDkwNzE5NDNaFw0wODA0\nMDYwNzE5NDNaMIG3MQswCQYDVQQGEwJOWjETMBEGA1UECBMKV2VsbGluZ3RvbjET\nMBEGA1UEBxMKV2VsbGluZ3RvbjEXMBUGA1UEChQOT1JWU0RfRlVMTE5BTUUxDzAN\nBgNVBAsTBk1vb2RsZTEpMCcGA1UEAxMgaHR0cDovL3RlbXBsYXRlLm9ydnNkLm9y\nZy9tb29kbGUxKTAnBgkqhkiG9w0BCQEWGm5vcmVwbHlAdGVtcGxhdGUub3J2c2Qu\nb3JnMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvdw5dLiBYrrNZgFVfVwWX\n7cnmubZ7KJqNu8J6OGnbqiNvYylWB1MMSOQOr/PrCc8j19PLeJptlczmQrF521Rm\nvzOrO0hpxZVWmkArrw9zMbCJRx7kEnwUlmsXxIGlMgHGz6erYYk2DiPyYjw1XDC5\nRZw3EBg5Y9JKZraUvugAAQIDAQABo4IBGDCCARQwHQYDVR0OBBYEFKZYPIAZSezh\ncI8waaqg/Pm96eHCMIHkBgNVHSMEgdwwgdmAFKZYPIAZSezhcI8waaqg/Pm96eHC\noYG9pIG6MIG3MQswCQYDVQQGEwJOWjETMBEGA1UECBMKV2VsbGluZ3RvbjETMBEG\nA1UEBxMKV2VsbGluZ3RvbjEXMBUGA1UEChQOT1JWU0RfRlVMTE5BTUUxDzANBgNV\nBAsTBk1vb2RsZTEpMCcGA1UEAxMgaHR0cDovL3RlbXBsYXRlLm9ydnNkLm9yZy9t\nb29kbGUxKTAnBgkqhkiG9w0BCQEWGm5vcmVwbHlAdGVtcGxhdGUub3J2c2Qub3Jn\nggEAMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEEBQADgYEAMzmLQi/t1l8rsDMm\nTirbRlk14cG1w1256QLG6qe9MiYnrfPZxm5A6TCMCkfC/162o3EHO4HICzBMLO17\nI2tzo2SDrIW140J1qL4anThpvWwrH1dlXFWmGdT5A4iqrKvARhIVFYr3pMMakj5n\nP+3eqISJMUJd4ZAXSMbSZSMjMns=\n-----END CERTIFICATE-----\n@@@@@@@@-----BEGIN RSA PRIVATE KEY-----\nMIICXAIBAAKBgQCvdw5dLiBYrrNZgFVfVwWX7cnmubZ7KJqNu8J6OGnbqiNvYylW\nB1MMSOQOr/PrCc8j19PLeJptlczmQrF521RmvzOrO0hpxZVWmkArrw9zMbCJRx7k\nEnwUlmsXxIGlMgHGz6erYYk2DiPyYjw1XDC5RZw3EBg5Y9JKZraUvugAAQIDAQAB\nAoGBAJMnoxlMnP4jDfEq6u55egxv9ZsV90+UvwHNDQ4Zj9YU+4DoRfuLSwALhZA3\nyrY81Mb3s/16GPF854nZNyS+aCoamiljuWsi9KvBDmwxR6LUCtygqobWarGrl5id\ntOQ1eY9db1R8G4UU5jvBZ8LKl+hBcFenjT1teB60f9M8nLXNAkEA57CivuEpweMQ\nePMAWffr9H1w3RXJ35tggwdj38N76zPSojKPnc+ouOXEPisbaaQq2i/o6M5Zrqq/\nV/1G883+zwJBAMHgLW0xNlpIlU/YRQodB0tLkE4X6oOBHQyWh+7VaarTF4xKCg3U\nFgPotqP4Csj529jmJlSv/SjUfJVOFKfUSC8CQCEN/EoLSa/Vu1XmJViwnENHWkDQ\niPqT6lMHTOJxu041GIn3eLHlHIc0kKjl8YVC3LJAP5RnTDg1OBNPmT3TV9UCQCEj\ncmBRoxq3gV4Od26NG6wRFG9kwx8LOK3oJP/71n3uav39wc4vTDwK0P0h7qX/n0Zp\nwG+FTV5nQ4w5tmohbN0CQCidBGl1cZC40gCaqv5ERlBY2v9qQyFMboezTaT2hQI1\nmhWNPi1Od08OTbEcciQ22SLVwhMzEJXc0U7K3Zwbna8=\n-----END RSA PRIVATE KEY-----\n');;
DROP TABLE IF EXISTS mdl_context;;
CREATE TABLE mdl_context (
  id bigint(10) unsigned NOT NULL auto_increment,
  contextlevel bigint(10) unsigned NOT NULL default '0',
  instanceid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_cont_conins_uix (contextlevel,instanceid),
  KEY mdl_cont_ins_ix (instanceid)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='one of these must be set';;
INSERT INTO mdl_context VALUES (1,10,0),(2,50,1),(3,30,2),(4,70,1);;
DROP TABLE IF EXISTS mdl_context_rel;;
CREATE TABLE mdl_context_rel (
  id bigint(10) NOT NULL auto_increment,
  c1 bigint(10) default NULL,
  c2 bigint(10) default NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_contrel_c1c2_uix (c1,c2),
  KEY mdl_contrel_c1_ix (c1),
  KEY mdl_contrel_c2_ix (c2)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='context relations, c2 is a parent (or higher) of c1';;
INSERT INTO mdl_context_rel VALUES (1,2,1),(2,2,2),(3,3,1),(4,3,3),(5,4,2),(6,4,1),(7,4,4);;
DROP TABLE IF EXISTS mdl_course;;
CREATE TABLE mdl_course (
  id bigint(10) unsigned NOT NULL auto_increment,
  category bigint(10) unsigned NOT NULL default '0',
  sortorder bigint(10) unsigned NOT NULL default '0',
  password varchar(50) NOT NULL default '',
  fullname varchar(254) NOT NULL default '',
  shortname varchar(100) NOT NULL default '',
  idnumber varchar(100) NOT NULL default '',
  summary text NOT NULL,
  format varchar(10) NOT NULL default 'topics',
  showgrades tinyint(2) unsigned NOT NULL default '1',
  modinfo longtext,
  newsitems mediumint(5) unsigned NOT NULL default '1',
  teacher varchar(100) NOT NULL default 'Teacher',
  teachers varchar(100) NOT NULL default 'Teachers',
  student varchar(100) NOT NULL default 'Student',
  students varchar(100) NOT NULL default 'Students',
  guest tinyint(2) unsigned NOT NULL default '0',
  startdate bigint(10) unsigned NOT NULL default '0',
  enrolperiod bigint(10) unsigned NOT NULL default '0',
  numsections mediumint(5) unsigned NOT NULL default '1',
  marker bigint(10) unsigned NOT NULL default '0',
  maxbytes bigint(10) unsigned NOT NULL default '0',
  showreports smallint(4) unsigned NOT NULL default '0',
  visible tinyint(1) unsigned NOT NULL default '1',
  hiddensections tinyint(2) unsigned NOT NULL default '0',
  groupmode smallint(4) unsigned NOT NULL default '0',
  groupmodeforce smallint(4) unsigned NOT NULL default '0',
  lang varchar(30) NOT NULL default '',
  theme varchar(50) NOT NULL default '',
  cost varchar(10) NOT NULL default '',
  currency varchar(3) NOT NULL default 'USD',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  metacourse tinyint(1) unsigned NOT NULL default '0',
  requested tinyint(1) unsigned NOT NULL default '0',
  restrictmodules tinyint(1) unsigned NOT NULL default '0',
  expirynotify tinyint(1) unsigned NOT NULL default '0',
  expirythreshold bigint(10) unsigned NOT NULL default '0',
  notifystudents tinyint(1) unsigned NOT NULL default '0',
  enrollable tinyint(1) unsigned NOT NULL default '1',
  enrolstartdate bigint(10) unsigned NOT NULL default '0',
  enrolenddate bigint(10) unsigned NOT NULL default '0',
  enrol varchar(20) NOT NULL default '',
  defaultrole bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_cour_cat_ix (category),
  KEY mdl_cour_idn_ix (idnumber),
  KEY mdl_cour_sho_ix (shortname)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Central course table';;
INSERT INTO mdl_course VALUES (1,0,0,'','ORVSD_FULLNAME','ORVSD_SHORTNAME','','','site',1,'a:1:{i:1;O:8:\"stdClass\":6:{s:2:\"cm\";i:1;s:3:\"mod\";s:5:\"forum\";s:7:\"section\";s:1:\"0\";s:4:\"name\";s:9:\"Site+news\";s:7:\"visible\";s:1:\"1\";s:5:\"extra\";s:0:\"\";}}',3,'Teacher','Teachers','Student','Students',0,0,0,0,0,0,0,1,0,0,0,'','','','USD',0,1201718847,0,0,0,0,0,0,1,0,0,'',0);;
DROP TABLE IF EXISTS mdl_course_allowed_modules;;
CREATE TABLE mdl_course_allowed_modules (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  module bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_courallomodu_cou_ix (course),
  KEY mdl_courallomodu_mod_ix (module)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='allowed modules foreach course';;
DROP TABLE IF EXISTS mdl_course_categories;;
CREATE TABLE mdl_course_categories (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  description text,
  parent bigint(10) unsigned NOT NULL default '0',
  sortorder bigint(10) unsigned NOT NULL default '0',
  coursecount bigint(10) unsigned NOT NULL default '0',
  visible tinyint(1) NOT NULL default '1',
  timemodified bigint(10) unsigned NOT NULL default '0',
  depth bigint(10) unsigned NOT NULL default '0',
  path varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_courcate_par_ix (parent)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Course categories';;
INSERT INTO mdl_course_categories VALUES (1,'Miscellaneous',NULL,0,0,0,1,0,0,'');;
DROP TABLE IF EXISTS mdl_course_display;;
CREATE TABLE mdl_course_display (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  display bigint(10) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_courdisp_couuse_ix (course,userid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores info about how to display the course';;
DROP TABLE IF EXISTS mdl_course_meta;;
CREATE TABLE mdl_course_meta (
  id bigint(10) unsigned NOT NULL auto_increment,
  parent_course bigint(10) unsigned NOT NULL default '0',
  child_course bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_courmeta_par_ix (parent_course),
  KEY mdl_courmeta_chi_ix (child_course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to store meta-courses relations';;
DROP TABLE IF EXISTS mdl_course_modules;;
CREATE TABLE mdl_course_modules (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  module bigint(10) unsigned NOT NULL default '0',
  instance bigint(10) unsigned NOT NULL default '0',
  section bigint(10) unsigned NOT NULL default '0',
  added bigint(10) unsigned NOT NULL default '0',
  score smallint(4) NOT NULL default '0',
  indent mediumint(5) unsigned NOT NULL default '0',
  visible tinyint(1) NOT NULL default '1',
  visibleold tinyint(1) NOT NULL default '1',
  groupmode smallint(4) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_courmodu_vis_ix (visible),
  KEY mdl_courmodu_cou_ix (course),
  KEY mdl_courmodu_mod_ix (module),
  KEY mdl_courmodu_ins_ix (instance)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL';;
INSERT INTO mdl_course_modules VALUES (1,1,5,1,1,1205047732,0,0,1,1,0);;
DROP TABLE IF EXISTS mdl_course_request;;
CREATE TABLE mdl_course_request (
  id bigint(10) unsigned NOT NULL auto_increment,
  fullname varchar(254) NOT NULL default '',
  shortname varchar(15) NOT NULL default '',
  summary text NOT NULL,
  reason text NOT NULL,
  requester bigint(10) NOT NULL default '0',
  password varchar(50) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_courrequ_sho_ix (shortname)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='course requests';;
DROP TABLE IF EXISTS mdl_course_sections;;
CREATE TABLE mdl_course_sections (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  section bigint(10) unsigned NOT NULL default '0',
  summary text,
  sequence text,
  visible tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY mdl_coursect_cousec_ix (course,section)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course';;
INSERT INTO mdl_course_sections VALUES (1,1,0,'','1',1);;
DROP TABLE IF EXISTS mdl_data;;
CREATE TABLE mdl_data (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  intro text NOT NULL,
  comments smallint(4) unsigned NOT NULL default '0',
  timeavailablefrom bigint(10) unsigned NOT NULL default '0',
  timeavailableto bigint(10) unsigned NOT NULL default '0',
  timeviewfrom bigint(10) unsigned NOT NULL default '0',
  timeviewto bigint(10) unsigned NOT NULL default '0',
  requiredentries int(8) unsigned NOT NULL default '0',
  requiredentriestoview int(8) unsigned NOT NULL default '0',
  maxentries int(8) unsigned NOT NULL default '0',
  rssarticles smallint(4) unsigned NOT NULL default '0',
  singletemplate text,
  listtemplate text,
  listtemplateheader text,
  listtemplatefooter text,
  addtemplate text,
  rsstemplate text,
  rsstitletemplate text,
  csstemplate text,
  jstemplate text,
  approval smallint(4) unsigned NOT NULL default '0',
  scale bigint(10) NOT NULL default '0',
  assessed bigint(10) unsigned NOT NULL default '0',
  defaultsort bigint(10) unsigned NOT NULL default '0',
  defaultsortdir smallint(4) unsigned NOT NULL default '0',
  editany smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Removed ratings column';;
DROP TABLE IF EXISTS mdl_data_comments;;
CREATE TABLE mdl_data_comments (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  recordid bigint(10) unsigned NOT NULL default '0',
  content text NOT NULL,
  format tinyint(2) unsigned NOT NULL default '0',
  created bigint(10) unsigned NOT NULL default '0',
  modified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_datacomm_rec_ix (recordid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to comment data records';;
DROP TABLE IF EXISTS mdl_data_content;;
CREATE TABLE mdl_data_content (
  id bigint(10) unsigned NOT NULL auto_increment,
  fieldid bigint(10) unsigned NOT NULL default '0',
  recordid bigint(10) unsigned NOT NULL default '0',
  content longtext,
  content1 longtext,
  content2 longtext,
  content3 longtext,
  content4 longtext,
  PRIMARY KEY  (id),
  KEY mdl_datacont_rec_ix (recordid),
  KEY mdl_datacont_fie_ix (fieldid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields';;
DROP TABLE IF EXISTS mdl_data_fields;;
CREATE TABLE mdl_data_fields (
  id bigint(10) unsigned NOT NULL auto_increment,
  dataid bigint(10) unsigned NOT NULL default '0',
  type varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  description text NOT NULL,
  param1 text,
  param2 text,
  param3 text,
  param4 text,
  param5 text,
  param6 text,
  param7 text,
  param8 text,
  param9 text,
  param10 text,
  PRIMARY KEY  (id),
  KEY mdl_datafiel_dat_ix (dataid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='every field available';;
DROP TABLE IF EXISTS mdl_data_ratings;;
CREATE TABLE mdl_data_ratings (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  recordid bigint(10) unsigned NOT NULL default '0',
  rating bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_datarati_rec_ix (recordid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to rate data records';;
DROP TABLE IF EXISTS mdl_data_records;;
CREATE TABLE mdl_data_records (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) unsigned NOT NULL default '0',
  dataid bigint(10) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  approved smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_datareco_dat_ix (dataid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='every record introduced';;
DROP TABLE IF EXISTS mdl_enrol_authorize;;
CREATE TABLE mdl_enrol_authorize (
  id bigint(10) unsigned NOT NULL auto_increment,
  paymentmethod enum('cc','echeck') NOT NULL default 'cc',
  refundinfo smallint(4) unsigned NOT NULL default '0',
  ccname varchar(255) NOT NULL default '',
  courseid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  transid bigint(10) unsigned NOT NULL default '0',
  status bigint(10) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  settletime bigint(10) unsigned NOT NULL default '0',
  amount varchar(10) NOT NULL default '',
  currency varchar(3) NOT NULL default 'USD',
  PRIMARY KEY  (id),
  KEY mdl_enroauth_cou_ix (courseid),
  KEY mdl_enroauth_use_ix (userid),
  KEY mdl_enroauth_sta_ix (status),
  KEY mdl_enroauth_tra_ix (transid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds all known information about authorize.net transactions';;
DROP TABLE IF EXISTS mdl_enrol_authorize_refunds;;
CREATE TABLE mdl_enrol_authorize_refunds (
  id bigint(10) unsigned NOT NULL auto_increment,
  orderid bigint(10) unsigned NOT NULL default '0',
  status tinyint(1) unsigned NOT NULL default '0',
  amount varchar(10) NOT NULL default '',
  transid bigint(10) unsigned default '0',
  settletime bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_enroauthrefu_tra_ix (transid),
  KEY mdl_enroauthrefu_ord_ix (orderid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Authorize.net refunds';;
DROP TABLE IF EXISTS mdl_enrol_paypal;;
CREATE TABLE mdl_enrol_paypal (
  id bigint(10) unsigned NOT NULL auto_increment,
  business varchar(255) NOT NULL default '',
  receiver_email varchar(255) NOT NULL default '',
  receiver_id varchar(255) NOT NULL default '',
  item_name varchar(255) NOT NULL default '',
  courseid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  memo varchar(255) NOT NULL default '',
  tax varchar(255) NOT NULL default '',
  option_name1 varchar(255) NOT NULL default '',
  option_selection1_x varchar(255) NOT NULL default '',
  option_name2 varchar(255) NOT NULL default '',
  option_selection2_x varchar(255) NOT NULL default '',
  payment_status varchar(255) NOT NULL default '',
  pending_reason varchar(255) NOT NULL default '',
  reason_code varchar(30) NOT NULL default '',
  txn_id varchar(255) NOT NULL default '',
  parent_txn_id varchar(255) NOT NULL default '',
  payment_type varchar(30) NOT NULL default '',
  timeupdated bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions';;
DROP TABLE IF EXISTS mdl_event;;
CREATE TABLE mdl_event (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  description text NOT NULL,
  format smallint(4) unsigned NOT NULL default '0',
  courseid bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  repeatid bigint(10) unsigned NOT NULL default '0',
  modulename varchar(20) NOT NULL default '',
  instance bigint(10) unsigned NOT NULL default '0',
  eventtype varchar(20) NOT NULL default '',
  timestart bigint(10) unsigned NOT NULL default '0',
  timeduration bigint(10) unsigned NOT NULL default '0',
  visible smallint(4) NOT NULL default '1',
  uuid varchar(36) NOT NULL default '',
  sequence bigint(10) unsigned NOT NULL default '1',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_even_cou_ix (courseid),
  KEY mdl_even_use_ix (userid),
  KEY mdl_even_tim_ix (timestart),
  KEY mdl_even_tim2_ix (timeduration)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it';;
DROP TABLE IF EXISTS mdl_forum;;
CREATE TABLE mdl_forum (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  type enum('single','news','general','social','eachuser','teacher','qanda') NOT NULL default 'general',
  name varchar(255) NOT NULL default '',
  intro text NOT NULL,
  assessed bigint(10) unsigned NOT NULL default '0',
  assesstimestart bigint(10) unsigned NOT NULL default '0',
  assesstimefinish bigint(10) unsigned NOT NULL default '0',
  scale bigint(10) NOT NULL default '0',
  maxbytes bigint(10) unsigned NOT NULL default '0',
  forcesubscribe tinyint(1) unsigned NOT NULL default '0',
  trackingtype tinyint(2) unsigned NOT NULL default '1',
  rsstype tinyint(2) unsigned NOT NULL default '0',
  rssarticles tinyint(2) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  warnafter bigint(10) unsigned NOT NULL default '0',
  blockafter bigint(10) unsigned NOT NULL default '0',
  blockperiod bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_foru_cou_ix (course)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion';;
INSERT INTO mdl_forum VALUES (1,1,'news','Site news','General news and announcements',0,0,0,0,0,0,1,0,0,1205047732,0,0,0);;
DROP TABLE IF EXISTS mdl_forum_discussions;;
CREATE TABLE mdl_forum_discussions (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  forum bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  firstpost bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) NOT NULL default '-1',
  assessed tinyint(1) NOT NULL default '1',
  timemodified bigint(10) unsigned NOT NULL default '0',
  usermodified bigint(10) unsigned NOT NULL default '0',
  timestart bigint(10) unsigned NOT NULL default '0',
  timeend bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_forudisc_use_ix (userid),
  KEY mdl_forudisc_for_ix (forum)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions';;
DROP TABLE IF EXISTS mdl_forum_posts;;
CREATE TABLE mdl_forum_posts (
  id bigint(10) unsigned NOT NULL auto_increment,
  discussion bigint(10) unsigned NOT NULL default '0',
  parent bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  created bigint(10) unsigned NOT NULL default '0',
  modified bigint(10) unsigned NOT NULL default '0',
  mailed tinyint(2) unsigned NOT NULL default '0',
  subject varchar(255) NOT NULL default '',
  message text NOT NULL,
  format tinyint(2) NOT NULL default '0',
  attachment varchar(100) NOT NULL default '',
  totalscore smallint(4) NOT NULL default '0',
  mailnow bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_forupost_use_ix (userid),
  KEY mdl_forupost_cre_ix (created),
  KEY mdl_forupost_mai_ix (mailed),
  KEY mdl_forupost_dis_ix (discussion),
  KEY mdl_forupost_par_ix (parent)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table';;
DROP TABLE IF EXISTS mdl_forum_queue;;
CREATE TABLE mdl_forum_queue (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  discussionid bigint(10) unsigned NOT NULL default '0',
  postid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_foruqueu_use_ix (userid),
  KEY mdl_foruqueu_dis_ix (discussionid),
  KEY mdl_foruqueu_pos_ix (postid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for';;
DROP TABLE IF EXISTS mdl_forum_ratings;;
CREATE TABLE mdl_forum_ratings (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  post bigint(10) unsigned NOT NULL default '0',
  time bigint(10) unsigned NOT NULL default '0',
  rating smallint(4) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_forurati_use_ix (userid),
  KEY mdl_forurati_pos_ix (post)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='forum_ratings table retrofitted from MySQL';;
DROP TABLE IF EXISTS mdl_forum_read;;
CREATE TABLE mdl_forum_read (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  forumid bigint(10) unsigned NOT NULL default '0',
  discussionid bigint(10) unsigned NOT NULL default '0',
  postid bigint(10) unsigned NOT NULL default '0',
  firstread bigint(10) unsigned NOT NULL default '0',
  lastread bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_foruread_usefor_ix (userid,forumid),
  KEY mdl_foruread_usedis_ix (userid,discussionid),
  KEY mdl_foruread_usepos_ix (userid,postid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts';;
DROP TABLE IF EXISTS mdl_forum_subscriptions;;
CREATE TABLE mdl_forum_subscriptions (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  forum bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_forusubs_use_ix (userid),
  KEY mdl_forusubs_for_ix (forum)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum';;
DROP TABLE IF EXISTS mdl_forum_track_prefs;;
CREATE TABLE mdl_forum_track_prefs (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  forumid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_forutracpref_usefor_ix (userid,forumid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums';;
DROP TABLE IF EXISTS mdl_glossary;;
CREATE TABLE mdl_glossary (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  intro text NOT NULL,
  allowduplicatedentries tinyint(2) unsigned NOT NULL default '0',
  displayformat varchar(50) NOT NULL default 'dictionary',
  mainglossary tinyint(2) unsigned NOT NULL default '0',
  showspecial tinyint(2) unsigned NOT NULL default '1',
  showalphabet tinyint(2) unsigned NOT NULL default '1',
  showall tinyint(2) unsigned NOT NULL default '1',
  allowcomments tinyint(2) unsigned NOT NULL default '0',
  allowprintview tinyint(2) unsigned NOT NULL default '1',
  usedynalink tinyint(2) unsigned NOT NULL default '1',
  defaultapproval tinyint(2) unsigned NOT NULL default '1',
  globalglossary tinyint(2) unsigned NOT NULL default '0',
  entbypage smallint(3) unsigned NOT NULL default '10',
  editalways tinyint(2) unsigned NOT NULL default '0',
  rsstype tinyint(2) unsigned NOT NULL default '0',
  rssarticles tinyint(2) unsigned NOT NULL default '0',
  assessed bigint(10) unsigned NOT NULL default '0',
  assesstimestart bigint(10) unsigned NOT NULL default '0',
  assesstimefinish bigint(10) unsigned NOT NULL default '0',
  scale bigint(10) NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_glos_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all glossaries';;
DROP TABLE IF EXISTS mdl_glossary_alias;;
CREATE TABLE mdl_glossary_alias (
  id bigint(10) unsigned NOT NULL auto_increment,
  entryid bigint(10) unsigned NOT NULL default '0',
  alias varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_glosalia_ent_ix (entryid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='entries alias';;
DROP TABLE IF EXISTS mdl_glossary_categories;;
CREATE TABLE mdl_glossary_categories (
  id bigint(10) unsigned NOT NULL auto_increment,
  glossaryid bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  usedynalink tinyint(2) unsigned NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY mdl_gloscate_glo_ix (glossaryid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries';;
DROP TABLE IF EXISTS mdl_glossary_comments;;
CREATE TABLE mdl_glossary_comments (
  id bigint(10) unsigned NOT NULL auto_increment,
  entryid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  entrycomment text NOT NULL,
  format tinyint(2) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_gloscomm_use_ix (userid),
  KEY mdl_gloscomm_ent_ix (entryid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='comments on glossary entries';;
DROP TABLE IF EXISTS mdl_glossary_entries;;
CREATE TABLE mdl_glossary_entries (
  id bigint(10) unsigned NOT NULL auto_increment,
  glossaryid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  concept varchar(255) NOT NULL default '',
  definition text NOT NULL,
  format tinyint(2) unsigned NOT NULL default '0',
  attachment varchar(100) NOT NULL default '',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  teacherentry tinyint(2) unsigned NOT NULL default '0',
  sourceglossaryid bigint(10) unsigned NOT NULL default '0',
  usedynalink tinyint(2) unsigned NOT NULL default '1',
  casesensitive tinyint(2) unsigned NOT NULL default '0',
  fullmatch tinyint(2) unsigned NOT NULL default '1',
  approved tinyint(2) unsigned NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY mdl_glosentr_use_ix (userid),
  KEY mdl_glosentr_con_ix (concept),
  KEY mdl_glosentr_glo_ix (glossaryid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='all glossary entries';;
DROP TABLE IF EXISTS mdl_glossary_entries_categories;;
CREATE TABLE mdl_glossary_entries_categories (
  id bigint(10) unsigned NOT NULL auto_increment,
  categoryid bigint(10) unsigned NOT NULL default '0',
  entryid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_glosentrcate_cat_ix (categoryid),
  KEY mdl_glosentrcate_ent_ix (entryid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry';;
DROP TABLE IF EXISTS mdl_glossary_formats;;
CREATE TABLE mdl_glossary_formats (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(50) NOT NULL default '',
  popupformatname varchar(50) NOT NULL default '',
  visible tinyint(2) unsigned NOT NULL default '1',
  showgroup tinyint(2) unsigned NOT NULL default '1',
  defaultmode varchar(50) NOT NULL default '',
  defaulthook varchar(50) NOT NULL default '',
  sortkey varchar(50) NOT NULL default '',
  sortorder varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats';;
DROP TABLE IF EXISTS mdl_glossary_ratings;;
CREATE TABLE mdl_glossary_ratings (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  entryid bigint(10) unsigned NOT NULL default '0',
  time bigint(10) unsigned NOT NULL default '0',
  rating smallint(4) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_glosrati_use_ix (userid),
  KEY mdl_glosrati_ent_ix (entryid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains user ratings for entries';;
DROP TABLE IF EXISTS mdl_grade_category;;
CREATE TABLE mdl_grade_category (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(64) NOT NULL default '',
  courseid bigint(10) unsigned NOT NULL default '0',
  drop_x_lowest bigint(10) unsigned NOT NULL default '0',
  bonus_points bigint(10) unsigned NOT NULL default '0',
  hidden bigint(10) unsigned NOT NULL default '0',
  weight decimal(5,2) NOT NULL default '0.00',
  PRIMARY KEY  (id),
  KEY mdl_gradcate_cou_ix (courseid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to define categories to group activity grades';;
DROP TABLE IF EXISTS mdl_grade_exceptions;;
CREATE TABLE mdl_grade_exceptions (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  grade_itemid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_gradexce_cou_ix (courseid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='individual grades to be skipped for certain students';;
DROP TABLE IF EXISTS mdl_grade_item;;
CREATE TABLE mdl_grade_item (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  category bigint(10) unsigned NOT NULL default '0',
  modid bigint(10) unsigned NOT NULL default '0',
  cminstance bigint(10) unsigned NOT NULL default '0',
  scale_grade double(11,10) NOT NULL default '1.0000000000',
  extra_credit bigint(10) unsigned NOT NULL default '0',
  sort_order bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_graditem_cou_ix (courseid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='items to be graded';;
DROP TABLE IF EXISTS mdl_grade_letter;;
CREATE TABLE mdl_grade_letter (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  letter varchar(8) NOT NULL default 'NA',
  grade_high decimal(5,2) NOT NULL default '100.00',
  grade_low decimal(5,2) NOT NULL default '0.00',
  PRIMARY KEY  (id),
  KEY mdl_gradlett_cou_ix (courseid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to convert numerical grades to letter grades';;
DROP TABLE IF EXISTS mdl_grade_preferences;;
CREATE TABLE mdl_grade_preferences (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  preference bigint(10) NOT NULL default '0',
  value bigint(10) NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_gradpref_coupre_uix (courseid,preference)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Preferences of the gradebook for each course';;
DROP TABLE IF EXISTS mdl_groups;;
CREATE TABLE mdl_groups (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(254) NOT NULL default '',
  description text,
  enrolmentkey varchar(50) NOT NULL default '',
  lang varchar(30) NOT NULL default 'en',
  theme varchar(50) NOT NULL default '',
  picture bigint(10) unsigned NOT NULL default '0',
  hidepicture tinyint(1) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.';;
DROP TABLE IF EXISTS mdl_groups_courses_groupings;;
CREATE TABLE mdl_groups_courses_groupings (
  id bigint(10) NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  groupingid bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_groucourgrou_cougro2_uix (courseid,groupingid),
  KEY mdl_groucourgrou_cou2_ix (courseid),
  KEY mdl_groucourgrou_gro2_ix (groupingid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a course (or the site).';;
DROP TABLE IF EXISTS mdl_groups_courses_groups;;
CREATE TABLE mdl_groups_courses_groups (
  id bigint(10) NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) unsigned NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_groucourgrou_cougro_uix (courseid,groupid),
  KEY mdl_groucourgrou_cou_ix (courseid),
  KEY mdl_groucourgrou_gro_ix (groupid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a group to a course (or the site).';;
DROP TABLE IF EXISTS mdl_groups_groupings;;
CREATE TABLE mdl_groups_groupings (
  id bigint(10) NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  description text,
  timecreated bigint(10) unsigned NOT NULL default '0',
  viewowngroup tinyint(1) unsigned NOT NULL default '1',
  viewallgroupsmembers tinyint(1) unsigned NOT NULL default '0',
  viewallgroupsactivities tinyint(1) unsigned NOT NULL default '0',
  teachersgroupmark tinyint(1) unsigned NOT NULL default '0',
  teachersgroupview tinyint(1) unsigned NOT NULL default '0',
  teachersoverride tinyint(1) unsigned NOT NULL default '0',
  teacherdeletable tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups.';;
DROP TABLE IF EXISTS mdl_groups_groupings_groups;;
CREATE TABLE mdl_groups_groupings_groups (
  id bigint(10) NOT NULL auto_increment,
  groupingid bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) unsigned NOT NULL,
  timeadded bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_grougrougrou_grogro_uix (groupingid,groupid),
  KEY mdl_grougrougrou_gro_ix (groupingid),
  KEY mdl_grougrougrou_gro2_ix (groupid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a group to a grouping.';;
DROP TABLE IF EXISTS mdl_groups_members;;
CREATE TABLE mdl_groups_members (
  id bigint(10) unsigned NOT NULL auto_increment,
  groupid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  timeadded bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_groumemb_grouse_uix (groupid,userid),
  KEY mdl_groumemb_gro_ix (groupid),
  KEY mdl_groumemb_use_ix (userid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.';;
DROP TABLE IF EXISTS mdl_hotpot;;
CREATE TABLE mdl_hotpot (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  summary text NOT NULL,
  timeopen bigint(10) unsigned NOT NULL default '0',
  timeclose bigint(10) unsigned NOT NULL default '0',
  location smallint(4) unsigned NOT NULL default '0',
  reference varchar(255) NOT NULL default '',
  outputformat smallint(4) unsigned NOT NULL default '1',
  navigation smallint(4) unsigned NOT NULL default '1',
  studentfeedback smallint(4) unsigned NOT NULL default '0',
  studentfeedbackurl varchar(255) NOT NULL default '',
  forceplugins smallint(4) unsigned NOT NULL default '0',
  shownextquiz smallint(4) unsigned NOT NULL default '0',
  review smallint(4) NOT NULL default '0',
  grade bigint(10) NOT NULL default '0',
  grademethod smallint(4) NOT NULL default '1',
  attempts mediumint(6) NOT NULL default '0',
  password varchar(255) NOT NULL default '',
  subnet varchar(255) NOT NULL default '',
  clickreporting smallint(4) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about Hot Potatoes quizzes';;
DROP TABLE IF EXISTS mdl_hotpot_attempts;;
CREATE TABLE mdl_hotpot_attempts (
  id bigint(10) unsigned NOT NULL auto_increment,
  hotpot bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  starttime bigint(10) unsigned NOT NULL default '0',
  endtime bigint(10) unsigned NOT NULL default '0',
  score mediumint(6) unsigned NOT NULL default '0',
  penalties mediumint(6) unsigned NOT NULL default '0',
  attempt mediumint(6) unsigned NOT NULL default '0',
  timestart bigint(10) unsigned NOT NULL default '0',
  timefinish bigint(10) unsigned NOT NULL default '0',
  status smallint(4) unsigned NOT NULL default '1',
  clickreportid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_hotpatte_use_ix (userid),
  KEY mdl_hotpatte_hot_ix (hotpot)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about Hot Potatoes quiz attempts';;
DROP TABLE IF EXISTS mdl_hotpot_details;;
CREATE TABLE mdl_hotpot_details (
  id bigint(10) unsigned NOT NULL auto_increment,
  attempt bigint(10) unsigned NOT NULL default '0',
  details text,
  PRIMARY KEY  (id),
  KEY mdl_hotpdeta_att_ix (attempt)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='raw details (as XML) of Hot Potatoes quiz attempts';;
DROP TABLE IF EXISTS mdl_hotpot_questions;;
CREATE TABLE mdl_hotpot_questions (
  id bigint(10) unsigned NOT NULL auto_increment,
  name text NOT NULL,
  type smallint(4) unsigned NOT NULL default '0',
  text bigint(10) unsigned NOT NULL default '0',
  hotpot bigint(10) unsigned NOT NULL default '0',
  md5key varchar(32) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_hotpques_md5_ix (md5key),
  KEY mdl_hotpques_hot_ix (hotpot)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about questions in Hot Potatoes quiz attempts';;
DROP TABLE IF EXISTS mdl_hotpot_responses;;
CREATE TABLE mdl_hotpot_responses (
  id bigint(10) unsigned NOT NULL auto_increment,
  attempt bigint(10) unsigned NOT NULL default '0',
  question bigint(10) unsigned NOT NULL default '0',
  score mediumint(6) NOT NULL default '0',
  weighting mediumint(6) NOT NULL default '0',
  correct varchar(255) NOT NULL default '',
  wrong varchar(255) NOT NULL default '',
  ignored varchar(255) NOT NULL default '',
  hints mediumint(6) unsigned NOT NULL default '0',
  clues mediumint(6) unsigned NOT NULL default '0',
  checks mediumint(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_hotpresp_att_ix (attempt),
  KEY mdl_hotpresp_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details about responses in Hot Potatoes quiz attempts';;
DROP TABLE IF EXISTS mdl_hotpot_strings;;
CREATE TABLE mdl_hotpot_strings (
  id bigint(10) unsigned NOT NULL auto_increment,
  string text NOT NULL,
  md5key varchar(32) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_hotpstri_md5_ix (md5key)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='strings used in Hot Potatoes questions and responses';;
DROP TABLE IF EXISTS mdl_journal;;
CREATE TABLE mdl_journal (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  intro text NOT NULL,
  introformat tinyint(2) NOT NULL default '0',
  days mediumint(5) unsigned NOT NULL default '7',
  assessed bigint(10) NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_jour_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='data for each journal';;
DROP TABLE IF EXISTS mdl_journal_entries;;
CREATE TABLE mdl_journal_entries (
  id bigint(10) unsigned NOT NULL auto_increment,
  journal bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  modified bigint(10) unsigned NOT NULL default '0',
  text text NOT NULL,
  format tinyint(2) NOT NULL default '0',
  rating bigint(10) default '0',
  entrycomment text,
  teacher bigint(10) unsigned NOT NULL default '0',
  timemarked bigint(10) unsigned NOT NULL default '0',
  mailed tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_jourentr_use_ix (userid),
  KEY mdl_jourentr_jou_ix (journal)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='All the journal entries of all people';;
DROP TABLE IF EXISTS mdl_label;;
CREATE TABLE mdl_label (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  content text NOT NULL,
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_labe_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines labels';;
DROP TABLE IF EXISTS mdl_lams;;
CREATE TABLE mdl_lams (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  introduction text NOT NULL,
  learning_session_id bigint(20) default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_lams_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='LAMS activity';;
DROP TABLE IF EXISTS mdl_lesson;;
CREATE TABLE mdl_lesson (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  practice smallint(3) unsigned NOT NULL default '0',
  modattempts smallint(3) unsigned NOT NULL default '0',
  usepassword smallint(3) unsigned NOT NULL default '0',
  password varchar(32) NOT NULL default '',
  dependency bigint(10) unsigned NOT NULL default '0',
  conditions text NOT NULL,
  grade smallint(3) NOT NULL default '0',
  custom smallint(3) unsigned NOT NULL default '0',
  ongoing smallint(3) unsigned NOT NULL default '0',
  usemaxgrade smallint(3) NOT NULL default '0',
  maxanswers smallint(3) unsigned NOT NULL default '4',
  maxattempts smallint(3) unsigned NOT NULL default '5',
  review smallint(3) unsigned NOT NULL default '0',
  nextpagedefault smallint(3) unsigned NOT NULL default '0',
  feedback smallint(3) unsigned NOT NULL default '1',
  minquestions smallint(3) unsigned NOT NULL default '0',
  maxpages smallint(3) unsigned NOT NULL default '0',
  timed smallint(3) unsigned NOT NULL default '0',
  maxtime bigint(10) unsigned NOT NULL default '0',
  retake smallint(3) unsigned NOT NULL default '1',
  activitylink bigint(10) unsigned NOT NULL default '0',
  mediafile varchar(255) NOT NULL default '',
  mediaheight bigint(10) unsigned NOT NULL default '100',
  mediawidth bigint(10) unsigned NOT NULL default '650',
  mediaclose smallint(3) unsigned NOT NULL default '0',
  slideshow smallint(3) unsigned NOT NULL default '0',
  width bigint(10) unsigned NOT NULL default '640',
  height bigint(10) unsigned NOT NULL default '480',
  bgcolor varchar(7) NOT NULL default '#FFFFFF',
  displayleft smallint(3) unsigned NOT NULL default '0',
  displayleftif smallint(3) unsigned NOT NULL default '0',
  progressbar smallint(3) unsigned NOT NULL default '0',
  highscores smallint(3) unsigned NOT NULL default '0',
  maxhighscores bigint(10) unsigned NOT NULL default '0',
  available bigint(10) unsigned NOT NULL default '0',
  deadline bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_less_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson';;
DROP TABLE IF EXISTS mdl_lesson_answers;;
CREATE TABLE mdl_lesson_answers (
  id bigint(10) unsigned NOT NULL auto_increment,
  lessonid bigint(10) unsigned NOT NULL default '0',
  pageid bigint(10) unsigned NOT NULL default '0',
  jumpto bigint(11) NOT NULL default '0',
  grade smallint(3) unsigned NOT NULL default '0',
  score bigint(10) NOT NULL default '0',
  flags smallint(3) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  answer text,
  response text,
  PRIMARY KEY  (id),
  KEY mdl_lessansw_les_ix (lessonid),
  KEY mdl_lessansw_pag_ix (pageid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers';;
DROP TABLE IF EXISTS mdl_lesson_attempts;;
CREATE TABLE mdl_lesson_attempts (
  id bigint(10) unsigned NOT NULL auto_increment,
  lessonid bigint(10) unsigned NOT NULL default '0',
  pageid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  answerid bigint(10) unsigned NOT NULL default '0',
  retry smallint(3) unsigned NOT NULL default '0',
  correct bigint(10) unsigned NOT NULL default '0',
  useranswer text,
  timeseen bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_lessatte_use_ix (userid),
  KEY mdl_lessatte_les_ix (lessonid),
  KEY mdl_lessatte_pag_ix (pageid),
  KEY mdl_lessatte_ans_ix (answerid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts';;
DROP TABLE IF EXISTS mdl_lesson_branch;;
CREATE TABLE mdl_lesson_branch (
  id bigint(10) unsigned NOT NULL auto_increment,
  lessonid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  pageid bigint(10) unsigned NOT NULL default '0',
  retry bigint(10) unsigned NOT NULL default '0',
  flag smallint(3) unsigned NOT NULL default '0',
  timeseen bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_lessbran_use_ix (userid),
  KEY mdl_lessbran_les_ix (lessonid),
  KEY mdl_lessbran_pag_ix (pageid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user';;
DROP TABLE IF EXISTS mdl_lesson_default;;
CREATE TABLE mdl_lesson_default (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  practice smallint(3) unsigned NOT NULL default '0',
  modattempts smallint(3) unsigned NOT NULL default '0',
  usepassword smallint(3) unsigned NOT NULL default '0',
  password varchar(32) NOT NULL default '',
  conditions text NOT NULL,
  grade smallint(3) NOT NULL default '0',
  custom smallint(3) unsigned NOT NULL default '0',
  ongoing smallint(3) unsigned NOT NULL default '0',
  usemaxgrade smallint(3) unsigned NOT NULL default '0',
  maxanswers smallint(3) unsigned NOT NULL default '4',
  maxattempts smallint(3) unsigned NOT NULL default '5',
  review smallint(3) unsigned NOT NULL default '0',
  nextpagedefault smallint(3) unsigned NOT NULL default '0',
  feedback smallint(3) unsigned NOT NULL default '1',
  minquestions smallint(3) unsigned NOT NULL default '0',
  maxpages smallint(3) unsigned NOT NULL default '0',
  timed smallint(3) unsigned NOT NULL default '0',
  maxtime bigint(10) unsigned NOT NULL default '0',
  retake smallint(3) unsigned NOT NULL default '1',
  mediaheight bigint(10) unsigned NOT NULL default '100',
  mediawidth bigint(10) unsigned NOT NULL default '650',
  mediaclose smallint(3) unsigned NOT NULL default '0',
  slideshow smallint(3) unsigned NOT NULL default '0',
  width bigint(10) unsigned NOT NULL default '640',
  height bigint(10) unsigned NOT NULL default '480',
  bgcolor varchar(7) default '#FFFFFF',
  displayleft smallint(3) unsigned NOT NULL default '0',
  displayleftif smallint(3) unsigned NOT NULL default '0',
  progressbar smallint(3) unsigned NOT NULL default '0',
  highscores smallint(3) unsigned NOT NULL default '0',
  maxhighscores bigint(10) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_default';;
DROP TABLE IF EXISTS mdl_lesson_grades;;
CREATE TABLE mdl_lesson_grades (
  id bigint(10) unsigned NOT NULL auto_increment,
  lessonid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  grade double unsigned NOT NULL default '0',
  late smallint(3) unsigned NOT NULL default '0',
  completed bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_lessgrad_use_ix (userid),
  KEY mdl_lessgrad_les_ix (lessonid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades';;
DROP TABLE IF EXISTS mdl_lesson_high_scores;;
CREATE TABLE mdl_lesson_high_scores (
  id bigint(10) unsigned NOT NULL auto_increment,
  lessonid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  gradeid bigint(10) unsigned NOT NULL default '0',
  nickname varchar(5) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_lesshighscor_use_ix (userid),
  KEY mdl_lesshighscor_les_ix (lessonid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson';;
DROP TABLE IF EXISTS mdl_lesson_pages;;
CREATE TABLE mdl_lesson_pages (
  id bigint(10) unsigned NOT NULL auto_increment,
  lessonid bigint(10) unsigned NOT NULL default '0',
  prevpageid bigint(10) unsigned NOT NULL default '0',
  nextpageid bigint(10) unsigned NOT NULL default '0',
  qtype smallint(3) unsigned NOT NULL default '0',
  qoption smallint(3) unsigned NOT NULL default '0',
  layout smallint(3) unsigned NOT NULL default '1',
  display smallint(3) unsigned NOT NULL default '1',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  title varchar(255) NOT NULL default '',
  contents text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_lesspage_les_ix (lessonid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages';;
DROP TABLE IF EXISTS mdl_lesson_timer;;
CREATE TABLE mdl_lesson_timer (
  id bigint(10) unsigned NOT NULL auto_increment,
  lessonid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  starttime bigint(10) unsigned NOT NULL default '0',
  lessontime bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_lesstime_use_ix (userid),
  KEY mdl_lesstime_les_ix (lessonid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson';;
DROP TABLE IF EXISTS mdl_log;;
CREATE TABLE mdl_log (
  id bigint(10) unsigned NOT NULL auto_increment,
  time bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  ip varchar(15) NOT NULL default '',
  course bigint(10) unsigned NOT NULL default '0',
  module varchar(20) NOT NULL default '',
  cmid bigint(10) unsigned NOT NULL default '0',
  action varchar(40) NOT NULL default '',
  url varchar(100) NOT NULL default '',
  info varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_log_timcoumodact_ix (time,course,module,action),
  KEY mdl_log_coumodact_ix (course,module,action),
  KEY mdl_log_couuse_ix (course,userid),
  KEY mdl_log_use_ix (userid),
  KEY mdl_log_inf_ix (info)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible';;
INSERT INTO mdl_log VALUES (1,1201718788,2,'140.211.18.56',1,'user',0,'update','view.php?id=2&course=1',' '),(2,1201718788,2,'140.211.18.56',1,'upload',0,'upload','http://template.orvsd.org/moodle/user/editadvanced.php?id=2','/var/www/localhost/template.orvsd.org/moodledata/user/0/2/logo.png'),(3,1201718847,2,'140.211.18.56',1,'course',0,'view','view.php?id=1','1'),(4,1201719206,2,'140.211.18.56',1,'user',0,'view','view.php?id=2&course=1','2'),(5,1219099310,2,'140.211.18.56',1,'user',0,'login','view.php?id=2&course=1','2'),(6,1219099310,2,'140.211.18.56',1,'course',0,'view','view.php?id=1','1');;
DROP TABLE IF EXISTS mdl_log_display;;
CREATE TABLE mdl_log_display (
  id bigint(10) unsigned NOT NULL auto_increment,
  module varchar(20) NOT NULL default '',
  action varchar(40) NOT NULL default '',
  mtable varchar(30) NOT NULL default '',
  field varchar(200) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_logdisp_modact_uix (module,action)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie';;
INSERT INTO mdl_log_display VALUES (1,'user','view','user','CONCAT(firstname,\' \',lastname)'),(2,'course','user report','user','CONCAT(firstname,\' \',lastname)'),(3,'course','view','course','fullname'),(4,'course','update','course','fullname'),(5,'course','enrol','course','fullname'),(6,'course','report log','course','fullname'),(7,'course','report live','course','fullname'),(8,'course','report outline','course','fullname'),(9,'course','report participation','course','fullname'),(10,'course','report stats','course','fullname'),(11,'message','write','user','CONCAT(firstname,\' \',lastname)'),(12,'message','read','user','CONCAT(firstname,\' \',lastname)'),(13,'message','add contact','user','CONCAT(firstname,\' \',lastname)'),(14,'message','remove contact','user','CONCAT(firstname,\' \',lastname)'),(15,'message','block contact','user','CONCAT(firstname,\' \',lastname)'),(16,'message','unblock contact','user','CONCAT(firstname,\' \',lastname)'),(17,'group','view','groups','name'),(18,'assignment','view','assignment','name'),(19,'assignment','add','assignment','name'),(20,'assignment','update','assignment','name'),(21,'assignment','view submission','assignment','name'),(22,'assignment','upload','assignment','name'),(23,'chat','view','chat','name'),(24,'chat','add','chat','name'),(25,'chat','update','chat','name'),(26,'chat','report','chat','name'),(27,'chat','talk','chat','name'),(28,'choice','view','choice','name'),(29,'choice','update','choice','name'),(30,'choice','add','choice','name'),(31,'choice','report','choice','name'),(32,'choice','choose','choice','name'),(33,'choice','choose again','choice','name'),(34,'data','view','data','name'),(35,'data','add','data','name'),(36,'data','update','data','name'),(37,'data','record delete','data','name'),(38,'data','fields add','data_fields','name'),(39,'data','fields update','data_fields','name'),(40,'data','templates saved','data','name'),(41,'data','templates def','data','name'),(42,'forum','add','forum','name'),(43,'forum','update','forum','name'),(44,'forum','add discussion','forum_discussions','name'),(45,'forum','add post','forum_posts','subject'),(46,'forum','update post','forum_posts','subject'),(47,'forum','user report','user','CONCAT(firstname,\' \',lastname)'),(48,'forum','move discussion','forum_discussions','name'),(49,'forum','view subscribers','forum','name'),(50,'forum','view discussion','forum_discussions','name'),(51,'forum','view forum','forum','name'),(52,'forum','subscribe','forum','name'),(53,'forum','unsubscribe','forum','name'),(54,'glossary','add','glossary','name'),(55,'glossary','update','glossary','name'),(56,'glossary','view','glossary','name'),(57,'glossary','view all','glossary','name'),(58,'glossary','add entry','glossary','name'),(59,'glossary','update entry','glossary','name'),(60,'glossary','add category','glossary','name'),(61,'glossary','update category','glossary','name'),(62,'glossary','delete category','glossary','name'),(63,'glossary','add comment','glossary','name'),(64,'glossary','update comment','glossary','name'),(65,'glossary','delete comment','glossary','name'),(66,'glossary','approve entry','glossary','name'),(67,'glossary','view entry','glossary_entries','concept'),(68,'journal','view','journal','name'),(69,'journal','add entry','journal','name'),(70,'journal','update entry','journal','name'),(71,'journal','view responses','journal','name'),(72,'label','add','quiz','name'),(73,'label','update','quiz','name'),(74,'lesson','start','lesson','name'),(75,'lesson','end','lesson','name'),(76,'lesson','view','lesson_pages','title'),(77,'quiz','add','quiz','name'),(78,'quiz','update','quiz','name'),(79,'quiz','view','quiz','name'),(80,'quiz','report','quiz','name'),(81,'quiz','attempt','quiz','name'),(82,'quiz','submit','quiz','name'),(83,'quiz','review','quiz','name'),(84,'quiz','editquestions','quiz','name'),(85,'quiz','preview','quiz','name'),(86,'quiz','start attempt','quiz','name'),(87,'quiz','close attempt','quiz','name'),(88,'quiz','continue attempt','quiz','name'),(89,'resource','view','resource','name'),(90,'resource','update','resource','name'),(91,'resource','add','resource','name'),(92,'scorm','view','scorm','name'),(93,'scorm','review','scorm','name'),(94,'scorm','update','scorm','name'),(95,'scorm','add','scorm','name'),(96,'survey','add','survey','name'),(97,'survey','update','survey','name'),(98,'survey','download','survey','name'),(99,'survey','view form','survey','name'),(100,'survey','view graph','survey','name'),(101,'survey','view report','survey','name'),(102,'survey','submit','survey','name'),(103,'workshop','assessments','workshop','name'),(104,'workshop','close','workshop','name'),(105,'workshop','display','workshop','name'),(106,'workshop','resubmit','workshop','name'),(107,'workshop','set up','workshop','name'),(108,'workshop','submissions','workshop','name'),(109,'workshop','view','workshop','name'),(110,'workshop','update','workshop','name'),(111,'book','update','book','name'),(112,'book','view','book','name'),(113,'book','view all','book','name'),(114,'book','print','book','name'),(115,'audiorecorder','view','audiorecorder','name'),(116,'audiorecorder','add','audiorecorder','name'),(117,'audiorecorder','update','audiorecorder','name'),(118,'audiorecorder','view submission','audiorecorder','name'),(119,'audiorecorder','upload','audiorecorder','name');;
DROP TABLE IF EXISTS mdl_message;;
CREATE TABLE mdl_message (
  id bigint(10) unsigned NOT NULL auto_increment,
  useridfrom bigint(10) NOT NULL default '0',
  useridto bigint(10) NOT NULL default '0',
  message text NOT NULL,
  format smallint(4) unsigned NOT NULL default '0',
  timecreated bigint(10) NOT NULL default '0',
  messagetype varchar(50) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_mess_use_ix (useridfrom),
  KEY mdl_mess_use2_ix (useridto)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages';;
DROP TABLE IF EXISTS mdl_message_contacts;;
CREATE TABLE mdl_message_contacts (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  contactid bigint(10) unsigned NOT NULL default '0',
  blocked tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_messcont_usecon_uix (userid,contactid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users';;
DROP TABLE IF EXISTS mdl_message_read;;
CREATE TABLE mdl_message_read (
  id bigint(10) unsigned NOT NULL auto_increment,
  useridfrom bigint(10) NOT NULL default '0',
  useridto bigint(10) NOT NULL default '0',
  message text NOT NULL,
  format smallint(4) unsigned NOT NULL default '0',
  timecreated bigint(10) NOT NULL default '0',
  timeread bigint(10) NOT NULL default '0',
  messagetype varchar(50) NOT NULL default '',
  mailed tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_messread_use_ix (useridfrom),
  KEY mdl_messread_use2_ix (useridto)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read';;
DROP TABLE IF EXISTS mdl_mnet_enrol_assignments;;
CREATE TABLE mdl_mnet_enrol_assignments (
  id bigint(10) NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  hostid bigint(10) unsigned NOT NULL default '0',
  courseid bigint(10) unsigned NOT NULL default '0',
  rolename varchar(255) NOT NULL default '',
  enroltime bigint(10) unsigned NOT NULL default '0',
  enroltype varchar(20) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_mnetenroassi_hoscou_ix (hostid,courseid),
  KEY mdl_mnetenroassi_use_ix (userid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about enrolments on courses on remote hosts';;
DROP TABLE IF EXISTS mdl_mnet_enrol_course;;
CREATE TABLE mdl_mnet_enrol_course (
  id bigint(10) NOT NULL auto_increment,
  hostid bigint(10) unsigned NOT NULL default '0',
  remoteid bigint(10) unsigned NOT NULL default '0',
  cat_id bigint(10) unsigned NOT NULL default '0',
  cat_name varchar(255) NOT NULL default '',
  cat_description mediumtext NOT NULL,
  sortorder smallint(4) unsigned NOT NULL default '0',
  fullname varchar(254) NOT NULL default '',
  shortname varchar(15) NOT NULL default '',
  idnumber varchar(100) NOT NULL default '',
  summary mediumtext NOT NULL,
  startdate bigint(10) unsigned NOT NULL default '0',
  cost varchar(10) NOT NULL default '',
  currency varchar(3) NOT NULL default '',
  defaultroleid smallint(4) unsigned NOT NULL default '0',
  defaultrolename varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_mnetenrocour_hosrem_uix (hostid,remoteid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about courses on remote hosts';;
DROP TABLE IF EXISTS mdl_mnet_host;;
CREATE TABLE mdl_mnet_host (
  id bigint(10) NOT NULL auto_increment,
  deleted tinyint(1) unsigned NOT NULL default '0',
  wwwroot varchar(255) NOT NULL default '',
  ip_address varchar(39) NOT NULL default '',
  name varchar(80) NOT NULL default '',
  public_key mediumtext NOT NULL,
  public_key_expires bigint(10) unsigned NOT NULL default '0',
  transport tinyint(2) unsigned NOT NULL default '0',
  portno tinyint(2) unsigned NOT NULL default '0',
  last_connect_time bigint(10) unsigned NOT NULL default '0',
  last_log_id bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC';;
INSERT INTO mdl_mnet_host VALUES (1,0,'http://template.orvsd.org/moodle','140.211.167.134','','-----BEGIN CERTIFICATE-----\nMIIEADCCA2mgAwIBAgIBADANBgkqhkiG9w0BAQQFADCBtzELMAkGA1UEBhMCTlox\nEzARBgNVBAgTCldlbGxpbmd0b24xEzARBgNVBAcTCldlbGxpbmd0b24xFzAVBgNV\nBAoUDk9SVlNEX0ZVTExOQU1FMQ8wDQYDVQQLEwZNb29kbGUxKTAnBgNVBAMTIGh0\ndHA6Ly90ZW1wbGF0ZS5vcnZzZC5vcmcvbW9vZGxlMSkwJwYJKoZIhvcNAQkBFhpu\nb3JlcGx5QHRlbXBsYXRlLm9ydnNkLm9yZzAeFw0wODAzMDkwNzE5NDNaFw0wODA0\nMDYwNzE5NDNaMIG3MQswCQYDVQQGEwJOWjETMBEGA1UECBMKV2VsbGluZ3RvbjET\nMBEGA1UEBxMKV2VsbGluZ3RvbjEXMBUGA1UEChQOT1JWU0RfRlVMTE5BTUUxDzAN\nBgNVBAsTBk1vb2RsZTEpMCcGA1UEAxMgaHR0cDovL3RlbXBsYXRlLm9ydnNkLm9y\nZy9tb29kbGUxKTAnBgkqhkiG9w0BCQEWGm5vcmVwbHlAdGVtcGxhdGUub3J2c2Qu\nb3JnMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvdw5dLiBYrrNZgFVfVwWX\n7cnmubZ7KJqNu8J6OGnbqiNvYylWB1MMSOQOr/PrCc8j19PLeJptlczmQrF521Rm\nvzOrO0hpxZVWmkArrw9zMbCJRx7kEnwUlmsXxIGlMgHGz6erYYk2DiPyYjw1XDC5\nRZw3EBg5Y9JKZraUvugAAQIDAQABo4IBGDCCARQwHQYDVR0OBBYEFKZYPIAZSezh\ncI8waaqg/Pm96eHCMIHkBgNVHSMEgdwwgdmAFKZYPIAZSezhcI8waaqg/Pm96eHC\noYG9pIG6MIG3MQswCQYDVQQGEwJOWjETMBEGA1UECBMKV2VsbGluZ3RvbjETMBEG\nA1UEBxMKV2VsbGluZ3RvbjEXMBUGA1UEChQOT1JWU0RfRlVMTE5BTUUxDzANBgNV\nBAsTBk1vb2RsZTEpMCcGA1UEAxMgaHR0cDovL3RlbXBsYXRlLm9ydnNkLm9yZy9t\nb29kbGUxKTAnBgkqhkiG9w0BCQEWGm5vcmVwbHlAdGVtcGxhdGUub3J2c2Qub3Jn\nggEAMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEEBQADgYEAMzmLQi/t1l8rsDMm\nTirbRlk14cG1w1256QLG6qe9MiYnrfPZxm5A6TCMCkfC/162o3EHO4HICzBMLO17\nI2tzo2SDrIW140J1qL4anThpvWwrH1dlXFWmGdT5A4iqrKvARhIVFYr3pMMakj5n\nP+3eqISJMUJd4ZAXSMbSZSMjMns=\n-----END CERTIFICATE-----\n',1207466383,0,0,0,0),(2,0,'','','All Hosts','',0,0,0,0,0);;
DROP TABLE IF EXISTS mdl_mnet_host2service;;
CREATE TABLE mdl_mnet_host2service (
  id bigint(10) NOT NULL auto_increment,
  hostid bigint(10) unsigned NOT NULL default '0',
  serviceid bigint(10) unsigned NOT NULL default '0',
  publish tinyint(1) unsigned NOT NULL default '0',
  subscribe tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_mnethost_hosser_uix (hostid,serviceid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host';;
DROP TABLE IF EXISTS mdl_mnet_log;;
CREATE TABLE mdl_mnet_log (
  id bigint(10) NOT NULL auto_increment,
  hostid bigint(10) unsigned NOT NULL default '0',
  remoteid bigint(10) unsigned NOT NULL default '0',
  time bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  ip varchar(15) NOT NULL default '',
  course bigint(10) unsigned NOT NULL default '0',
  coursename varchar(40) NOT NULL default '',
  module varchar(20) NOT NULL default '',
  cmid bigint(10) unsigned NOT NULL default '0',
  action varchar(40) NOT NULL default '',
  url varchar(100) NOT NULL default '',
  info varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_mnetlog_hosusecou_ix (hostid,userid,course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';;
DROP TABLE IF EXISTS mdl_mnet_rpc;;
CREATE TABLE mdl_mnet_rpc (
  id bigint(10) NOT NULL auto_increment,
  function_name varchar(40) NOT NULL default '',
  xmlrpc_path varchar(80) NOT NULL default '',
  parent_type varchar(6) NOT NULL default '',
  parent varchar(20) NOT NULL default '',
  enabled tinyint(1) unsigned NOT NULL default '0',
  help mediumtext NOT NULL,
  profile mediumtext NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_mnetrpc_enaxml_ix (enabled,xmlrpc_path)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to';;
INSERT INTO mdl_mnet_rpc VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',0,'Return user data for the provided token, compare with user_agent string.','a:3:{i:0;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:45:\"token - The unique ID provided by remotehost.\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"useragent - User Agent string.\";}}'),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',0,'Receives an array of usernames from a remote machine and prods their\\n sessions to keep them alive','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"\"All ok\" or an error message\";}i:1;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:29:\"array - An array of usernames\";}}'),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',0,'The IdP uses this function to kill child sessions on other hosts','a:3:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"username - Username for session to kill\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"useragent - SHA1 hash of user agent to look for\";}}'),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',0,'Receives an array of log entries from an SP and adds them to the mnet_log\\n table','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:30:\"\"All ok\" or an error message\";}i:1;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:29:\"array - An array of usernames\";}}'),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',0,'Returns the user\'s image as a base64 encoded string.','a:2:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:17:\"The encoded image\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:29:\"username - The id of the user\";}}'),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',0,'Returns the theme information and logo url as strings.','a:1:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}'),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',0,'Invoke this function _on_ the IDP to update it with enrolment info local to\\n the SP right after calling user_authorise()\\n \\n Normally called by the SP after calling','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";N;}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:23:\"username - The username\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:77:\"courses - Assoc array of courses following the structure of mnet_enrol_course\";}}'),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',0,'Poll the IdP server to let it know that a user it has authenticated is still\\n online','a:1:{i:0;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";N;}}'),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',0,'TODO:Untested When the IdP requests that child sessions are terminated,\\n this function will be called on each of the child hosts. The machine that\\n calls the function (over xmlrpc) provides us with the mnethostid we need.','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:15:\"True on success\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"username - Username for session to kill\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"useragent - SHA1 hash of user agent to look for\";}}'),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',0,'Does Foo','a:1:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:47:\"Whether the user can login from the remote host\";}}'),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',0,'No description given.','a:2:{i:0;a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}i:1;s:6:\"userid\";}'),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',0,'Enrols user to course with the default role','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:41:\"Whether the enrolment has been successful\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"user - The username of the remote use\";}i:2;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:37:\"courseid - The id of the local course\";}}'),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',0,'Unenrol a user from a course','a:3:{i:0;a:2:{s:4:\"type\";s:7:\"boolean\";s:11:\"description\";s:47:\"Whether the user can login from the remote host\";}i:1;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:19:\"user - The username\";}i:2;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:37:\"courseid - The id of the local course\";}}'),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',0,'Get a list of users from the client server who are enrolled in a course','a:3:{i:0;a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:39:\"Array of usernames who are homed on the\";}i:1;a:2:{s:4:\"type\";s:3:\"int\";s:11:\"description\";s:24:\"courseid - The Course ID\";}i:2;a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:47:\"roles - Comma-separated list of role shortnames\";}}');;
DROP TABLE IF EXISTS mdl_mnet_service;;
CREATE TABLE mdl_mnet_service (
  id bigint(10) NOT NULL auto_increment,
  name varchar(40) NOT NULL default '',
  description varchar(40) NOT NULL default '',
  apiversion varchar(10) NOT NULL default '',
  offer tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions';;
INSERT INTO mdl_mnet_service VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1);;
DROP TABLE IF EXISTS mdl_mnet_service2rpc;;
CREATE TABLE mdl_mnet_service2rpc (
  id bigint(10) NOT NULL auto_increment,
  serviceid bigint(10) unsigned NOT NULL default '0',
  rpcid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_mnetserv_rpcser_uix (rpcid,serviceid)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';;
INSERT INTO mdl_mnet_service2rpc VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14);;
DROP TABLE IF EXISTS mdl_mnet_session;;
CREATE TABLE mdl_mnet_session (
  id bigint(10) NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  username varchar(100) NOT NULL default '',
  token varchar(40) NOT NULL default '',
  mnethostid bigint(10) unsigned NOT NULL default '0',
  useragent varchar(40) NOT NULL default '',
  confirm_timeout bigint(10) unsigned NOT NULL default '0',
  session_id varchar(40) NOT NULL default '',
  expires bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_mnetsess_tok_uix (token)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';;
DROP TABLE IF EXISTS mdl_mnet_sso_access_control;;
CREATE TABLE mdl_mnet_sso_access_control (
  id bigint(10) NOT NULL auto_increment,
  username varchar(100) NOT NULL default '',
  mnet_host_id bigint(10) unsigned NOT NULL default '0',
  accessctrl varchar(20) NOT NULL default 'allow',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_mnetssoaccecont_mneuse_uix (mnet_host_id,username)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov';;
DROP TABLE IF EXISTS mdl_modules;;
CREATE TABLE mdl_modules (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(20) NOT NULL default '',
  version bigint(10) NOT NULL default '0',
  cron bigint(10) unsigned NOT NULL default '0',
  lastcron bigint(10) unsigned NOT NULL default '0',
  search varchar(255) NOT NULL default '',
  visible tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY mdl_modu_nam_ix (name)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='modules available in the site';;
INSERT INTO mdl_modules VALUES (1,'assignment',2007020200,60,1219097448,'',1),(2,'chat',2007020200,300,1219097448,'',1),(3,'choice',2007020200,0,0,'',1),(4,'data',2007022601,60,0,'',1),(5,'forum',2007020203,60,1219097448,'',1),(6,'glossary',2007020200,0,0,'',1),(7,'hotpot',2007020202,0,0,'',0),(8,'journal',2007020200,60,1219097448,'',0),(9,'label',2007020200,0,0,'',1),(10,'lams',2007020200,0,0,'',0),(11,'lesson',2007020201,0,0,'',1),(12,'quiz',2007020200,0,0,'',1),(13,'resource',2007020200,0,0,'',1),(14,'scorm',2007070301,300,1219097448,'',1),(15,'survey',2007020200,0,0,'',1),(16,'wiki',2007020200,3600,1219096924,'',1),(17,'workshop',2007020200,60,1219097448,'',1),(18,'questionnaire',2007010801,43200,1219064452,'',1),(19,'slideshow',2008030300,0,0,'',1),(20,'book',2007052000,0,0,'',1),(21,'audiorecorder',2008042200,0,0,'',1);;
DROP TABLE IF EXISTS mdl_post;;
CREATE TABLE mdl_post (
  id bigint(10) NOT NULL auto_increment,
  module varchar(20) NOT NULL default '',
  userid bigint(10) unsigned NOT NULL default '0',
  courseid bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) unsigned NOT NULL default '0',
  moduleid bigint(10) unsigned NOT NULL default '0',
  coursemoduleid bigint(10) unsigned NOT NULL default '0',
  subject varchar(128) NOT NULL default '',
  summary longtext,
  content longtext,
  uniquehash varchar(128) NOT NULL default '',
  rating bigint(10) unsigned NOT NULL default '0',
  format bigint(10) unsigned NOT NULL default '0',
  attachment varchar(100) default NULL,
  publishstate enum('draft','site','public') NOT NULL default 'draft',
  lastmodified bigint(10) unsigned NOT NULL default '0',
  created bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_post_iduse_uix (id,userid),
  KEY mdl_post_las_ix (lastmodified),
  KEY mdl_post_mod_ix (module),
  KEY mdl_post_sub_ix (subject)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen';;
DROP TABLE IF EXISTS mdl_question;;
CREATE TABLE mdl_question (
  id bigint(10) unsigned NOT NULL auto_increment,
  category bigint(10) NOT NULL default '0',
  parent bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  questiontext text NOT NULL,
  questiontextformat tinyint(2) NOT NULL default '0',
  image varchar(255) NOT NULL default '',
  generalfeedback text NOT NULL,
  defaultgrade bigint(10) unsigned NOT NULL default '1',
  penalty double NOT NULL default '0.1',
  qtype varchar(20) NOT NULL default '',
  length bigint(10) unsigned NOT NULL default '1',
  stamp varchar(255) NOT NULL default '',
  version varchar(255) NOT NULL default '',
  hidden tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_ques_cat_ix (category),
  KEY mdl_ques_par_ix (parent)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The questions themselves';;
DROP TABLE IF EXISTS mdl_question_answers;;
CREATE TABLE mdl_question_answers (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  answer text NOT NULL,
  fraction double NOT NULL default '0',
  feedback text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_quesansw_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback';;
DROP TABLE IF EXISTS mdl_question_attempts;;
CREATE TABLE mdl_question_attempts (
  id bigint(10) unsigned NOT NULL auto_increment,
  modulename varchar(20) NOT NULL default 'quiz',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Student attempts. This table gets extended by the modules';;
DROP TABLE IF EXISTS mdl_question_calculated;;
CREATE TABLE mdl_question_calculated (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  answer bigint(10) unsigned NOT NULL default '0',
  tolerance varchar(20) NOT NULL default '0.0',
  tolerancetype bigint(10) NOT NULL default '1',
  correctanswerlength bigint(10) NOT NULL default '2',
  correctanswerformat bigint(10) NOT NULL default '2',
  PRIMARY KEY  (id),
  KEY mdl_quescalc_ans_ix (answer),
  KEY mdl_quescalc_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';;
DROP TABLE IF EXISTS mdl_question_categories;;
CREATE TABLE mdl_question_categories (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  info text NOT NULL,
  publish smallint(4) NOT NULL default '0',
  stamp varchar(255) NOT NULL default '',
  parent bigint(10) unsigned NOT NULL default '0',
  sortorder bigint(10) unsigned NOT NULL default '999',
  PRIMARY KEY  (id),
  KEY mdl_quescate_cou_ix (course),
  KEY mdl_quescate_par_ix (parent)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions';;
DROP TABLE IF EXISTS mdl_question_dataset_definitions;;
CREATE TABLE mdl_question_dataset_definitions (
  id bigint(10) unsigned NOT NULL auto_increment,
  category bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  type bigint(10) NOT NULL default '0',
  options varchar(255) NOT NULL default '',
  itemcount bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quesdatadefi_cat_ix (category)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items';;
DROP TABLE IF EXISTS mdl_question_dataset_items;;
CREATE TABLE mdl_question_dataset_items (
  id bigint(10) unsigned NOT NULL auto_increment,
  definition bigint(10) unsigned NOT NULL default '0',
  itemnumber bigint(10) unsigned NOT NULL default '0',
  value varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_quesdataitem_def_ix (definition)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Individual dataset items';;
DROP TABLE IF EXISTS mdl_question_datasets;;
CREATE TABLE mdl_question_datasets (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  datasetdefinition bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quesdata_quedat_ix (question,datasetdefinition),
  KEY mdl_quesdata_que_ix (question),
  KEY mdl_quesdata_dat_ix (datasetdefinition)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions';;
DROP TABLE IF EXISTS mdl_question_match;;
CREATE TABLE mdl_question_match (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  subquestions varchar(255) NOT NULL default '',
  shuffleanswers smallint(4) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY mdl_quesmatc_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines fixed matching questions';;
DROP TABLE IF EXISTS mdl_question_match_sub;;
CREATE TABLE mdl_question_match_sub (
  id bigint(10) unsigned NOT NULL auto_increment,
  code bigint(10) unsigned NOT NULL default '0',
  question bigint(10) unsigned NOT NULL default '0',
  questiontext text NOT NULL,
  answertext varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_quesmatcsub_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines the subquestions that make up a matching question';;
DROP TABLE IF EXISTS mdl_question_multianswer;;
CREATE TABLE mdl_question_multianswer (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  sequence text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_quesmult_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions';;
DROP TABLE IF EXISTS mdl_question_multichoice;;
CREATE TABLE mdl_question_multichoice (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  layout smallint(4) NOT NULL default '0',
  answers varchar(255) NOT NULL default '',
  single smallint(4) NOT NULL default '0',
  shuffleanswers smallint(4) NOT NULL default '1',
  correctfeedback text NOT NULL,
  partiallycorrectfeedback text NOT NULL,
  incorrectfeedback text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_quesmult_que2_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions';;
DROP TABLE IF EXISTS mdl_question_numerical;;
CREATE TABLE mdl_question_numerical (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  answer bigint(10) unsigned NOT NULL default '0',
  tolerance varchar(255) NOT NULL default '0.0',
  PRIMARY KEY  (id),
  KEY mdl_quesnume_ans_ix (answer),
  KEY mdl_quesnume_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions';;
DROP TABLE IF EXISTS mdl_question_numerical_units;;
CREATE TABLE mdl_question_numerical_units (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  multiplier decimal(40,20) NOT NULL default '1.00000000000000000000',
  unit varchar(50) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_quesnumeunit_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions';;
DROP TABLE IF EXISTS mdl_question_randomsamatch;;
CREATE TABLE mdl_question_randomsamatch (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  choose bigint(10) unsigned NOT NULL default '4',
  PRIMARY KEY  (id),
  KEY mdl_quesrand_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question';;
DROP TABLE IF EXISTS mdl_question_rqp;;
CREATE TABLE mdl_question_rqp (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  type bigint(10) unsigned NOT NULL default '0',
  source longblob NOT NULL,
  format varchar(255) NOT NULL default '',
  flags smallint(3) unsigned NOT NULL default '0',
  maxscore bigint(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY mdl_quesrqp_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for RQP questions';;
DROP TABLE IF EXISTS mdl_question_rqp_servers;;
CREATE TABLE mdl_question_rqp_servers (
  id bigint(10) unsigned NOT NULL auto_increment,
  typeid bigint(10) unsigned NOT NULL default '0',
  url varchar(255) NOT NULL default '',
  can_render tinyint(2) unsigned NOT NULL default '0',
  can_author tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quesrqpserv_typ_ix (typeid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about RQP servers';;
DROP TABLE IF EXISTS mdl_question_rqp_states;;
CREATE TABLE mdl_question_rqp_states (
  id bigint(10) unsigned NOT NULL auto_increment,
  stateid bigint(10) unsigned NOT NULL default '0',
  responses text NOT NULL,
  persistent_data text NOT NULL,
  template_vars text NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='RQP question type specific state information';;
DROP TABLE IF EXISTS mdl_question_rqp_types;;
CREATE TABLE mdl_question_rqp_types (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_quesrqptype_nam_uix (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='RQP question types';;
DROP TABLE IF EXISTS mdl_question_sessions;;
CREATE TABLE mdl_question_sessions (
  id bigint(10) unsigned NOT NULL auto_increment,
  attemptid bigint(10) unsigned NOT NULL default '0',
  questionid bigint(10) unsigned NOT NULL default '0',
  newest bigint(10) unsigned NOT NULL default '0',
  newgraded bigint(10) unsigned NOT NULL default '0',
  sumpenalty double NOT NULL default '0',
  manualcomment text NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_quessess_attque_uix (attemptid,questionid),
  KEY mdl_quessess_att_ix (attemptid),
  KEY mdl_quessess_que_ix (questionid),
  KEY mdl_quessess_new_ix (newest),
  KEY mdl_quessess_new2_ix (newgraded)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states';;
DROP TABLE IF EXISTS mdl_question_shortanswer;;
CREATE TABLE mdl_question_shortanswer (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  answers varchar(255) NOT NULL default '',
  usecase tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quesshor_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions';;
DROP TABLE IF EXISTS mdl_question_states;;
CREATE TABLE mdl_question_states (
  id bigint(10) unsigned NOT NULL auto_increment,
  attempt bigint(10) unsigned NOT NULL default '0',
  question bigint(10) unsigned NOT NULL default '0',
  originalquestion bigint(10) unsigned NOT NULL default '0',
  seq_number mediumint(6) unsigned NOT NULL default '0',
  answer text NOT NULL,
  timestamp bigint(10) unsigned NOT NULL default '0',
  event smallint(4) unsigned NOT NULL default '0',
  grade double NOT NULL default '0',
  raw_grade double NOT NULL default '0',
  penalty double NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quesstat_att_ix (attempt),
  KEY mdl_quesstat_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades';;
DROP TABLE IF EXISTS mdl_question_truefalse;;
CREATE TABLE mdl_question_truefalse (
  id bigint(10) unsigned NOT NULL auto_increment,
  question bigint(10) unsigned NOT NULL default '0',
  trueanswer bigint(10) unsigned NOT NULL default '0',
  falseanswer bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_questrue_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions';;
DROP TABLE IF EXISTS mdl_questionnaire;;
CREATE TABLE mdl_questionnaire (
  id int(11) NOT NULL auto_increment,
  course int(11) NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  summary text NOT NULL,
  qtype int(10) NOT NULL default '0',
  respondenttype enum('fullname','anonymous') NOT NULL default 'fullname',
  resp_eligible enum('all','students','teachers') NOT NULL default 'all',
  resp_view int(2) NOT NULL default '0',
  opendate int(10) NOT NULL,
  closedate int(10) NOT NULL,
  resume int(2) NOT NULL default '0',
  navigate int(2) NOT NULL default '0',
  sid int(11) NOT NULL default '0',
  timemodified int(10) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY sid (sid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_attempts;;
CREATE TABLE mdl_questionnaire_attempts (
  id int(11) NOT NULL auto_increment,
  qid int(11) NOT NULL default '0',
  userid int(11) NOT NULL default '0',
  rid int(10) unsigned NOT NULL default '0',
  timemodified int(10) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_question;;
CREATE TABLE mdl_questionnaire_question (
  id int(10) unsigned NOT NULL auto_increment,
  survey_id int(10) unsigned NOT NULL,
  name char(30) NOT NULL,
  type_id int(10) unsigned NOT NULL,
  result_id int(10) unsigned default NULL,
  length int(11) NOT NULL default '0',
  precise int(11) NOT NULL default '0',
  position int(10) unsigned NOT NULL,
  content text NOT NULL,
  required enum('Y','N') NOT NULL default 'N',
  deleted enum('Y','N') NOT NULL default 'N',
  public enum('Y','N') NOT NULL default 'Y',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_question_choice;;
CREATE TABLE mdl_questionnaire_question_choice (
  id int(10) unsigned NOT NULL auto_increment,
  question_id int(10) unsigned NOT NULL,
  content text NOT NULL,
  value text,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_question_type;;
CREATE TABLE mdl_questionnaire_question_type (
  id int(10) unsigned NOT NULL auto_increment,
  type char(32) NOT NULL,
  has_choices enum('Y','N') NOT NULL,
  response_table char(32) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;;
INSERT INTO mdl_questionnaire_question_type VALUES (1,'Yes/No','N','response_bool'),(2,'Text Box','N','response_text'),(3,'Essay Box','N','response_text'),(4,'Radio Buttons','Y','response_single'),(5,'Check Boxes','Y','response_multiple'),(6,'Dropdown Box','Y','response_single'),(8,'Rate (scale 1..5)','Y','response_rank'),(9,'Date','N','response_date'),(10,'Numeric','N','response_text'),(99,'Page Break','N',''),(100,'Section Text','N','');;
DROP TABLE IF EXISTS mdl_questionnaire_response;;
CREATE TABLE mdl_questionnaire_response (
  id int(10) unsigned NOT NULL auto_increment,
  survey_id int(10) unsigned NOT NULL,
  submitted int(10) unsigned NOT NULL default '0',
  complete enum('Y','N') NOT NULL default 'N',
  username char(64) default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_response_bool;;
CREATE TABLE mdl_questionnaire_response_bool (
  id int(11) NOT NULL auto_increment,
  response_id int(10) unsigned NOT NULL,
  question_id int(10) unsigned NOT NULL,
  choice_id enum('Y','N') NOT NULL,
  PRIMARY KEY  (id),
  KEY response_question (response_id,question_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_response_date;;
CREATE TABLE mdl_questionnaire_response_date (
  id int(11) NOT NULL auto_increment,
  response_id int(10) unsigned NOT NULL,
  question_id int(10) unsigned NOT NULL,
  response date default NULL,
  PRIMARY KEY  (id),
  KEY response_question (response_id,question_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_response_multiple;;
CREATE TABLE mdl_questionnaire_response_multiple (
  id int(10) unsigned NOT NULL auto_increment,
  response_id int(10) unsigned NOT NULL,
  question_id int(10) unsigned NOT NULL,
  choice_id int(10) unsigned NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_response_other;;
CREATE TABLE mdl_questionnaire_response_other (
  id int(11) NOT NULL auto_increment,
  response_id int(10) unsigned NOT NULL,
  question_id int(10) unsigned NOT NULL,
  choice_id int(10) unsigned NOT NULL,
  response text,
  PRIMARY KEY  (id),
  KEY response_question (response_id,question_id,choice_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_response_rank;;
CREATE TABLE mdl_questionnaire_response_rank (
  id int(11) NOT NULL auto_increment,
  response_id int(10) unsigned NOT NULL,
  question_id int(10) unsigned NOT NULL,
  choice_id int(10) unsigned NOT NULL,
  rank int(11) NOT NULL,
  PRIMARY KEY  (id),
  KEY response_question (response_id,question_id,choice_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_response_single;;
CREATE TABLE mdl_questionnaire_response_single (
  id int(11) NOT NULL auto_increment,
  response_id int(10) unsigned NOT NULL,
  question_id int(10) unsigned NOT NULL,
  choice_id int(10) unsigned NOT NULL,
  PRIMARY KEY  (id),
  KEY response_question (response_id,question_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_response_text;;
CREATE TABLE mdl_questionnaire_response_text (
  id int(11) NOT NULL auto_increment,
  response_id int(10) unsigned NOT NULL,
  question_id int(10) unsigned NOT NULL,
  response text,
  PRIMARY KEY  (id),
  KEY response_question (response_id,question_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_questionnaire_survey;;
CREATE TABLE mdl_questionnaire_survey (
  id int(10) unsigned NOT NULL auto_increment,
  name char(64) NOT NULL,
  owner char(16) NOT NULL,
  realm char(64) NOT NULL,
  public enum('Y','N') NOT NULL default 'Y',
  status int(10) unsigned NOT NULL default '0',
  title char(255) NOT NULL,
  email char(64) default NULL,
  subtitle text,
  info text,
  theme char(64) default NULL,
  thanks_page char(255) default NULL,
  thank_head char(255) default NULL,
  thank_body text,
  changed timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (id),
  KEY name (name),
  KEY owner (owner)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;;
DROP TABLE IF EXISTS mdl_quiz;;
CREATE TABLE mdl_quiz (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  intro text NOT NULL,
  timeopen bigint(10) unsigned NOT NULL default '0',
  timeclose bigint(10) unsigned NOT NULL default '0',
  optionflags bigint(10) unsigned NOT NULL default '0',
  penaltyscheme smallint(4) unsigned NOT NULL default '0',
  attempts mediumint(6) NOT NULL default '0',
  attemptonlast smallint(4) NOT NULL default '0',
  grademethod smallint(4) NOT NULL default '1',
  decimalpoints smallint(4) NOT NULL default '2',
  review bigint(10) unsigned NOT NULL default '0',
  questionsperpage bigint(10) NOT NULL default '0',
  shufflequestions smallint(4) NOT NULL default '0',
  shuffleanswers smallint(4) NOT NULL default '0',
  questions text NOT NULL,
  sumgrades bigint(10) NOT NULL default '0',
  grade bigint(10) NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  timelimit tinyint(2) unsigned NOT NULL default '0',
  password varchar(255) NOT NULL default '',
  subnet varchar(255) NOT NULL default '',
  popup smallint(4) NOT NULL default '0',
  delay1 bigint(10) NOT NULL default '0',
  delay2 bigint(10) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quiz_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Main information about each quiz';;
DROP TABLE IF EXISTS mdl_quiz_attempts;;
CREATE TABLE mdl_quiz_attempts (
  id bigint(10) unsigned NOT NULL auto_increment,
  uniqueid bigint(10) unsigned NOT NULL default '0',
  quiz bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  attempt mediumint(6) NOT NULL default '0',
  sumgrades double NOT NULL default '0',
  timestart bigint(10) unsigned NOT NULL default '0',
  timefinish bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  layout text NOT NULL,
  preview smallint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_quizatte_uni_uix (uniqueid),
  KEY mdl_quizatte_use_ix (userid),
  KEY mdl_quizatte_qui_ix (quiz)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores various attempts on a quiz';;
DROP TABLE IF EXISTS mdl_quiz_feedback;;
CREATE TABLE mdl_quiz_feedback (
  id bigint(10) unsigned NOT NULL auto_increment,
  quizid bigint(10) unsigned NOT NULL default '0',
  feedbacktext text NOT NULL,
  mingrade double NOT NULL default '0',
  maxgrade double NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quizfeed_qui_ix (quizid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on their overall score on t';;
DROP TABLE IF EXISTS mdl_quiz_grades;;
CREATE TABLE mdl_quiz_grades (
  id bigint(10) unsigned NOT NULL auto_increment,
  quiz bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  grade double NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quizgrad_use_ix (userid),
  KEY mdl_quizgrad_qui_ix (quiz)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Final quiz grade (may be best of several attempts)';;
DROP TABLE IF EXISTS mdl_quiz_question_instances;;
CREATE TABLE mdl_quiz_question_instances (
  id bigint(10) unsigned NOT NULL auto_increment,
  quiz bigint(10) unsigned NOT NULL default '0',
  question bigint(10) unsigned NOT NULL default '0',
  grade mediumint(6) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quizquesinst_qui_ix (quiz),
  KEY mdl_quizquesinst_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The grade for a question in a quiz';;
DROP TABLE IF EXISTS mdl_quiz_question_versions;;
CREATE TABLE mdl_quiz_question_versions (
  id bigint(10) unsigned NOT NULL auto_increment,
  quiz bigint(10) unsigned NOT NULL default '0',
  oldquestion bigint(10) unsigned NOT NULL default '0',
  newquestion bigint(10) unsigned NOT NULL default '0',
  originalquestion bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  timestamp bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_quizquesvers_qui_ix (quiz),
  KEY mdl_quizquesvers_old_ix (oldquestion),
  KEY mdl_quizquesvers_new_ix (newquestion),
  KEY mdl_quizquesvers_ori_ix (originalquestion)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='quiz_question_versions table retrofitted from MySQL';;
DROP TABLE IF EXISTS mdl_resource;;
CREATE TABLE mdl_resource (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  type varchar(30) NOT NULL default '',
  reference varchar(255) NOT NULL default '',
  summary text,
  alltext mediumtext NOT NULL,
  popup text NOT NULL,
  options varchar(255) NOT NULL default '',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_reso_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each record is one resource and its config data';;
DROP TABLE IF EXISTS mdl_role;;
CREATE TABLE mdl_role (
  id bigint(10) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  shortname varchar(100) NOT NULL default '',
  description text NOT NULL,
  sortorder bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_role_sor_uix (sortorder)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='moodle roles';;
INSERT INTO mdl_role VALUES (1,'Administrator','admin','Administrators can usually do anything on the site, in all courses.',0),(2,'Course creator','coursecreator','Course creators can create new courses and teach in them.',1),(3,'Teacher','editingteacher','Teachers can do anything within a course, including changing the activities and grading students.',2),(4,'Non-editing teacher','teacher','Non-editing teachers can teach in courses and grade students, but may not alter activities.',3),(5,'Student','student','Students generally have less privileges within a course.',4),(6,'Guest','guest','Guests have minimal privileges and usually can not enter text anywhere.',5),(7,'Authenticated user','user','All logged in users.',6);;
DROP TABLE IF EXISTS mdl_role_allow_assign;;
CREATE TABLE mdl_role_allow_assign (
  id bigint(10) unsigned NOT NULL auto_increment,
  roleid bigint(10) unsigned NOT NULL default '0',
  allowassign bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_rolealloassi_rolall_uix (roleid,allowassign),
  KEY mdl_rolealloassi_rol_ix (roleid),
  KEY mdl_rolealloassi_all_ix (allowassign)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role';;
INSERT INTO mdl_role_allow_assign VALUES (1,1,1),(2,1,2),(3,1,4),(4,1,3),(5,1,5),(6,1,6),(7,2,4),(8,2,3),(9,2,5),(10,2,6),(11,3,4),(12,3,5),(13,3,6);;
DROP TABLE IF EXISTS mdl_role_allow_override;;
CREATE TABLE mdl_role_allow_override (
  id bigint(10) unsigned NOT NULL auto_increment,
  roleid bigint(10) unsigned NOT NULL default '0',
  allowoverride bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_rolealloover_rolall_uix (roleid,allowoverride),
  KEY mdl_rolealloover_rol_ix (roleid),
  KEY mdl_rolealloover_all_ix (allowoverride)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role';;
INSERT INTO mdl_role_allow_override VALUES (1,1,1),(2,1,2),(3,1,4),(4,1,3),(5,1,5),(6,1,6),(7,1,7);;
DROP TABLE IF EXISTS mdl_role_assignments;;
CREATE TABLE mdl_role_assignments (
  id bigint(10) unsigned NOT NULL auto_increment,
  roleid bigint(10) unsigned NOT NULL default '0',
  contextid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  hidden tinyint(1) unsigned NOT NULL default '0',
  timestart bigint(10) unsigned NOT NULL default '0',
  timeend bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  modifierid bigint(10) unsigned NOT NULL default '0',
  enrol varchar(20) NOT NULL default '',
  sortorder bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_roleassi_conroluse_uix (contextid,roleid,userid),
  KEY mdl_roleassi_sor_ix (sortorder),
  KEY mdl_roleassi_rol_ix (roleid),
  KEY mdl_roleassi_con_ix (contextid),
  KEY mdl_roleassi_use_ix (userid)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='assigning roles to different context';;
INSERT INTO mdl_role_assignments VALUES (1,1,1,2,0,0,0,1201718665,0,'manual',0);;
DROP TABLE IF EXISTS mdl_role_capabilities;;
CREATE TABLE mdl_role_capabilities (
  id bigint(10) unsigned NOT NULL auto_increment,
  contextid bigint(10) unsigned NOT NULL default '0',
  roleid bigint(10) unsigned NOT NULL default '0',
  capability varchar(255) NOT NULL default '',
  permission bigint(10) NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  modifierid bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_rolecapa_rolconcap_uix (roleid,contextid,capability),
  KEY mdl_rolecapa_rol_ix (roleid),
  KEY mdl_rolecapa_con_ix (contextid),
  KEY mdl_rolecapa_mod_ix (modifierid),
  KEY mdl_rolecapa_cap_ix (capability)
) ENGINE=MyISAM AUTO_INCREMENT=433 DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p';;
INSERT INTO mdl_role_capabilities VALUES (1,1,1,'moodle/legacy:admin',1,1201718639,0),(2,1,2,'moodle/legacy:coursecreator',1,1201718639,0),(3,1,3,'moodle/legacy:editingteacher',1,1201718639,0),(4,1,4,'moodle/legacy:teacher',1,1201718639,0),(5,1,5,'moodle/legacy:student',1,1201718639,0),(6,1,6,'moodle/legacy:guest',1,1201718639,0),(7,1,7,'moodle/legacy:user',1,1201718639,0),(8,1,1,'moodle/site:doanything',1,1201718639,0),(9,1,1,'moodle/site:config',1,1201718639,0),(10,1,1,'moodle/site:readallmessages',1,1201718639,0),(11,1,3,'moodle/site:readallmessages',1,1201718639,0),(12,1,1,'moodle/site:sendmessage',1,1201718639,0),(13,1,7,'moodle/site:sendmessage',1,1201718639,0),(14,1,1,'moodle/site:approvecourse',1,1201718639,0),(15,1,3,'moodle/site:import',1,1201718639,0),(16,1,1,'moodle/site:import',1,1201718639,0),(17,1,3,'moodle/site:backup',1,1201718639,0),(18,1,1,'moodle/site:backup',1,1201718639,0),(19,1,3,'moodle/site:restore',1,1201718639,0),(20,1,1,'moodle/site:restore',1,1201718639,0),(21,1,3,'moodle/site:manageblocks',1,1201718639,0),(22,1,1,'moodle/site:manageblocks',1,1201718639,0),(23,1,4,'moodle/site:accessallgroups',1,1201718639,0),(24,1,3,'moodle/site:accessallgroups',1,1201718639,0),(25,1,1,'moodle/site:accessallgroups',1,1201718639,0),(26,1,4,'moodle/site:viewfullnames',1,1201718639,0),(27,1,3,'moodle/site:viewfullnames',1,1201718639,0),(28,1,1,'moodle/site:viewfullnames',1,1201718639,0),(29,1,4,'moodle/site:viewreports',1,1201718639,0),(30,1,3,'moodle/site:viewreports',1,1201718639,0),(31,1,1,'moodle/site:viewreports',1,1201718639,0),(32,1,3,'moodle/site:trustcontent',1,1201718639,0),(33,1,1,'moodle/site:trustcontent',1,1201718639,0),(34,1,1,'moodle/site:uploadusers',1,1201718639,0),(35,1,1,'moodle/user:create',1,1201718639,0),(36,1,1,'moodle/user:delete',1,1201718639,0),(37,1,1,'moodle/user:update',1,1201718639,0),(38,1,6,'moodle/user:viewdetails',1,1201718639,0),(39,1,5,'moodle/user:viewdetails',1,1201718639,0),(40,1,4,'moodle/user:viewdetails',1,1201718639,0),(41,1,3,'moodle/user:viewdetails',1,1201718639,0),(42,1,1,'moodle/user:viewdetails',1,1201718639,0),(43,1,4,'moodle/user:viewhiddendetails',1,1201718639,0),(44,1,3,'moodle/user:viewhiddendetails',1,1201718639,0),(45,1,1,'moodle/user:viewhiddendetails',1,1201718639,0),(46,1,5,'moodle/user:viewusergrades',1,1201718639,0),(47,1,4,'moodle/user:viewusergrades',1,1201718639,0),(48,1,3,'moodle/user:viewusergrades',1,1201718639,0),(49,1,1,'moodle/user:viewusergrades',1,1201718639,0),(50,1,1,'moodle/user:loginas',1,1201718639,0),(51,1,3,'moodle/role:assign',1,1201718639,0),(52,1,1,'moodle/role:assign',1,1201718639,0),(53,1,1,'moodle/role:override',1,1201718639,0),(54,1,1,'moodle/role:manage',1,1201718639,0),(55,1,4,'moodle/role:unassignself',1,1201718639,0),(56,1,3,'moodle/role:unassignself',1,1201718639,0),(57,1,2,'moodle/role:unassignself',1,1201718639,0),(58,1,1,'moodle/role:unassignself',1,1201718639,0),(59,1,4,'moodle/role:viewhiddenassigns',1,1201718639,0),(60,1,3,'moodle/role:viewhiddenassigns',1,1201718639,0),(61,1,1,'moodle/role:viewhiddenassigns',1,1201718639,0),(62,1,3,'moodle/role:switchroles',1,1201718639,0),(63,1,1,'moodle/role:switchroles',1,1201718639,0),(64,1,1,'moodle/category:create',1,1201718639,0),(65,1,1,'moodle/category:delete',1,1201718639,0),(66,1,1,'moodle/category:update',1,1201718639,0),(67,1,1,'moodle/category:visibility',1,1201718639,0),(68,1,2,'moodle/course:create',1,1201718639,0),(69,1,1,'moodle/course:create',1,1201718639,0),(70,1,1,'moodle/course:delete',1,1201718639,0),(71,1,3,'moodle/course:update',1,1201718639,0),(72,1,1,'moodle/course:update',1,1201718639,0),(73,1,6,'moodle/course:view',1,1201718639,0),(74,1,5,'moodle/course:view',1,1201718639,0),(75,1,4,'moodle/course:view',1,1201718639,0),(76,1,3,'moodle/course:view',1,1201718639,0),(77,1,4,'moodle/course:bulkmessaging',1,1201718639,0),(78,1,3,'moodle/course:bulkmessaging',1,1201718639,0),(79,1,1,'moodle/course:bulkmessaging',1,1201718639,0),(80,1,4,'moodle/course:viewhiddenuserfields',1,1201718639,0),(81,1,3,'moodle/course:viewhiddenuserfields',1,1201718639,0),(82,1,1,'moodle/course:viewhiddenuserfields',1,1201718639,0),(83,1,2,'moodle/course:viewhiddencourses',1,1201718639,0),(84,1,4,'moodle/course:viewhiddencourses',1,1201718639,0),(85,1,3,'moodle/course:viewhiddencourses',1,1201718639,0),(86,1,1,'moodle/course:viewhiddencourses',1,1201718639,0),(87,1,1,'moodle/course:visibility',1,1201718639,0),(88,1,3,'moodle/course:managefiles',1,1201718639,0),(89,1,1,'moodle/course:managefiles',1,1201718639,0),(90,1,3,'moodle/course:manageactivities',1,1201718639,0),(91,1,1,'moodle/course:manageactivities',1,1201718639,0),(92,1,3,'moodle/course:managemetacourse',1,1201718639,0),(93,1,1,'moodle/course:managemetacourse',1,1201718639,0),(94,1,3,'moodle/course:activityvisibility',1,1201718639,0),(95,1,1,'moodle/course:activityvisibility',1,1201718639,0),(96,1,4,'moodle/course:viewhiddenactivities',1,1201718639,0),(97,1,3,'moodle/course:viewhiddenactivities',1,1201718639,0),(98,1,1,'moodle/course:viewhiddenactivities',1,1201718639,0),(99,1,5,'moodle/course:viewparticipants',1,1201718639,0),(100,1,4,'moodle/course:viewparticipants',1,1201718639,0),(101,1,3,'moodle/course:viewparticipants',1,1201718639,0),(102,1,1,'moodle/course:viewparticipants',1,1201718639,0),(103,1,5,'moodle/course:viewscales',1,1201718639,0),(104,1,4,'moodle/course:viewscales',1,1201718639,0),(105,1,3,'moodle/course:viewscales',1,1201718639,0),(106,1,1,'moodle/course:viewscales',1,1201718639,0),(107,1,3,'moodle/course:managescales',1,1201718639,0),(108,1,1,'moodle/course:managescales',1,1201718639,0),(109,1,3,'moodle/course:managegroups',1,1201718639,0),(110,1,1,'moodle/course:managegroups',1,1201718639,0),(111,1,3,'moodle/course:reset',1,1201718639,0),(112,1,1,'moodle/course:reset',1,1201718639,0),(113,1,6,'moodle/blog:view',1,1201718639,0),(114,1,7,'moodle/blog:view',1,1201718639,0),(115,1,5,'moodle/blog:view',1,1201718639,0),(116,1,4,'moodle/blog:view',1,1201718639,0),(117,1,3,'moodle/blog:view',1,1201718639,0),(118,1,1,'moodle/blog:view',1,1201718639,0),(119,1,7,'moodle/blog:create',1,1201718639,0),(120,1,1,'moodle/blog:create',1,1201718639,0),(121,1,1,'moodle/blog:manageofficialtags',1,1201718639,0),(122,1,5,'moodle/blog:managepersonaltags',1,1201718639,0),(123,1,4,'moodle/blog:managepersonaltags',1,1201718639,0),(124,1,3,'moodle/blog:managepersonaltags',1,1201718639,0),(125,1,1,'moodle/blog:managepersonaltags',1,1201718639,0),(126,1,4,'moodle/blog:manageentries',1,1201718639,0),(127,1,3,'moodle/blog:manageentries',1,1201718639,0),(128,1,1,'moodle/blog:manageentries',1,1201718639,0),(129,1,7,'moodle/calendar:manageownentries',1,1201718639,0),(130,1,1,'moodle/calendar:manageownentries',1,1201718639,0),(131,1,4,'moodle/calendar:manageentries',1,1201718639,0),(132,1,3,'moodle/calendar:manageentries',1,1201718639,0),(133,1,1,'moodle/calendar:manageentries',1,1201718639,0),(134,1,1,'moodle/user:editprofile',1,1201718639,0),(135,1,5,'moodle/user:readuserposts',1,1201718639,0),(136,1,4,'moodle/user:readuserposts',1,1201718639,0),(137,1,3,'moodle/user:readuserposts',1,1201718639,0),(138,1,1,'moodle/user:readuserposts',1,1201718639,0),(139,1,5,'moodle/user:readuserblogs',1,1201718639,0),(140,1,4,'moodle/user:readuserblogs',1,1201718639,0),(141,1,3,'moodle/user:readuserblogs',1,1201718639,0),(142,1,1,'moodle/user:readuserblogs',1,1201718639,0),(143,1,4,'moodle/user:viewuseractivitiesreport',1,1201718639,0),(144,1,3,'moodle/user:viewuseractivitiesreport',1,1201718639,0),(145,1,1,'moodle/user:viewuseractivitiesreport',1,1201718639,0),(146,1,3,'moodle/question:import',1,1201718639,0),(147,1,1,'moodle/question:import',1,1201718639,0),(148,1,3,'moodle/question:export',1,1201718639,0),(149,1,1,'moodle/question:export',1,1201718639,0),(150,1,3,'moodle/question:managecategory',1,1201718639,0),(151,1,1,'moodle/question:managecategory',1,1201718639,0),(152,1,3,'moodle/question:manage',1,1201718639,0),(153,1,1,'moodle/question:manage',1,1201718639,0),(154,1,4,'moodle/site:doclinks',1,1201718639,0),(155,1,3,'moodle/site:doclinks',1,1201718639,0),(156,1,1,'moodle/site:doclinks',1,1201718639,0),(157,1,3,'moodle/course:sectionvisibility',1,1201718639,0),(158,1,1,'moodle/course:sectionvisibility',1,1201718639,0),(159,1,3,'moodle/course:useremail',1,1201718639,0),(160,1,1,'moodle/course:useremail',1,1201718639,0),(161,1,3,'moodle/course:viewhiddensections',1,1201718639,0),(162,1,1,'moodle/course:viewhiddensections',1,1201718639,0),(163,1,3,'moodle/course:setcurrentsection',1,1201718639,0),(164,1,1,'moodle/course:setcurrentsection',1,1201718639,0),(165,1,4,'moodle/course:viewcoursegrades',1,1201718639,0),(166,1,3,'moodle/course:viewcoursegrades',1,1201718639,0),(167,1,1,'moodle/course:viewcoursegrades',1,1201718639,0),(168,1,3,'moodle/course:managegrades',1,1201718639,0),(169,1,1,'moodle/course:managegrades',1,1201718639,0),(170,1,1,'moodle/site:mnetlogintoremote',1,1201718639,0),(171,1,7,'moodle/my:manageblocks',1,1201718639,0),(172,1,6,'mod/assignment:view',1,1201718640,0),(173,1,5,'mod/assignment:view',1,1201718640,0),(174,1,4,'mod/assignment:view',1,1201718640,0),(175,1,3,'mod/assignment:view',1,1201718640,0),(176,1,1,'mod/assignment:view',1,1201718640,0),(177,1,5,'mod/assignment:submit',1,1201718640,0),(178,1,4,'mod/assignment:grade',1,1201718640,0),(179,1,3,'mod/assignment:grade',1,1201718640,0),(180,1,1,'mod/assignment:grade',1,1201718640,0),(181,1,5,'mod/chat:chat',1,1201718641,0),(182,1,4,'mod/chat:chat',1,1201718641,0),(183,1,3,'mod/chat:chat',1,1201718641,0),(184,1,1,'mod/chat:chat',1,1201718641,0),(185,1,5,'mod/chat:readlog',1,1201718641,0),(186,1,4,'mod/chat:readlog',1,1201718641,0),(187,1,3,'mod/chat:readlog',1,1201718641,0),(188,1,1,'mod/chat:readlog',1,1201718641,0),(189,1,4,'mod/chat:deletelog',1,1201718641,0),(190,1,3,'mod/chat:deletelog',1,1201718641,0),(191,1,1,'mod/chat:deletelog',1,1201718641,0),(192,1,5,'mod/choice:choose',1,1201718641,0),(193,1,4,'mod/choice:choose',1,1201718641,0),(194,1,3,'mod/choice:choose',1,1201718641,0),(195,1,1,'mod/choice:choose',1,1201718641,0),(196,1,4,'mod/choice:readresponses',1,1201718641,0),(197,1,3,'mod/choice:readresponses',1,1201718641,0),(198,1,1,'mod/choice:readresponses',1,1201718641,0),(199,1,4,'mod/choice:deleteresponses',1,1201718641,0),(200,1,3,'mod/choice:deleteresponses',1,1201718641,0),(201,1,1,'mod/choice:deleteresponses',1,1201718641,0),(202,1,4,'mod/choice:downloadresponses',1,1201718641,0),(203,1,3,'mod/choice:downloadresponses',1,1201718641,0),(204,1,1,'mod/choice:downloadresponses',1,1201718641,0),(205,1,6,'mod/data:viewentry',1,1201718642,0),(206,1,5,'mod/data:viewentry',1,1201718642,0),(207,1,4,'mod/data:viewentry',1,1201718642,0),(208,1,3,'mod/data:viewentry',1,1201718642,0),(209,1,1,'mod/data:viewentry',1,1201718642,0),(210,1,5,'mod/data:writeentry',1,1201718642,0),(211,1,4,'mod/data:writeentry',1,1201718642,0),(212,1,3,'mod/data:writeentry',1,1201718642,0),(213,1,1,'mod/data:writeentry',1,1201718642,0),(214,1,5,'mod/data:comment',1,1201718642,0),(215,1,4,'mod/data:comment',1,1201718642,0),(216,1,3,'mod/data:comment',1,1201718642,0),(217,1,1,'mod/data:comment',1,1201718642,0),(218,1,4,'mod/data:viewrating',1,1201718642,0),(219,1,3,'mod/data:viewrating',1,1201718642,0),(220,1,1,'mod/data:viewrating',1,1201718642,0),(221,1,4,'mod/data:rate',1,1201718642,0),(222,1,3,'mod/data:rate',1,1201718642,0),(223,1,1,'mod/data:rate',1,1201718642,0),(224,1,4,'mod/data:approve',1,1201718642,0),(225,1,3,'mod/data:approve',1,1201718642,0),(226,1,1,'mod/data:approve',1,1201718642,0),(227,1,4,'mod/data:manageentries',1,1201718642,0),(228,1,3,'mod/data:manageentries',1,1201718642,0),(229,1,1,'mod/data:manageentries',1,1201718642,0),(230,1,4,'mod/data:managecomments',1,1201718642,0),(231,1,3,'mod/data:managecomments',1,1201718642,0),(232,1,1,'mod/data:managecomments',1,1201718642,0),(233,1,3,'mod/data:managetemplates',1,1201718642,0),(234,1,1,'mod/data:managetemplates',1,1201718642,0),(235,1,4,'mod/data:viewalluserpresets',1,1201718642,0),(236,1,3,'mod/data:viewalluserpresets',1,1201718642,0),(237,1,1,'mod/data:viewalluserpresets',1,1201718642,0),(238,1,1,'mod/data:manageuserpresets',1,1201718642,0),(239,1,6,'mod/forum:viewdiscussion',1,1201718644,0),(240,1,5,'mod/forum:viewdiscussion',1,1201718644,0),(241,1,4,'mod/forum:viewdiscussion',1,1201718644,0),(242,1,3,'mod/forum:viewdiscussion',1,1201718644,0),(243,1,1,'mod/forum:viewdiscussion',1,1201718644,0),(244,1,4,'mod/forum:viewhiddentimedposts',1,1201718644,0),(245,1,3,'mod/forum:viewhiddentimedposts',1,1201718644,0),(246,1,1,'mod/forum:viewhiddentimedposts',1,1201718644,0),(247,1,5,'mod/forum:startdiscussion',1,1201718644,0),(248,1,4,'mod/forum:startdiscussion',1,1201718644,0),(249,1,3,'mod/forum:startdiscussion',1,1201718644,0),(250,1,1,'mod/forum:startdiscussion',1,1201718644,0),(251,1,5,'mod/forum:replypost',1,1201718644,0),(252,1,4,'mod/forum:replypost',1,1201718644,0),(253,1,3,'mod/forum:replypost',1,1201718644,0),(254,1,1,'mod/forum:replypost',1,1201718644,0),(255,1,4,'mod/forum:addnews',1,1201718644,0),(256,1,3,'mod/forum:addnews',1,1201718644,0),(257,1,1,'mod/forum:addnews',1,1201718644,0),(258,1,4,'mod/forum:replynews',1,1201718644,0),(259,1,3,'mod/forum:replynews',1,1201718644,0),(260,1,1,'mod/forum:replynews',1,1201718644,0),(261,1,5,'mod/forum:viewrating',1,1201718644,0),(262,1,4,'mod/forum:viewrating',1,1201718644,0),(263,1,3,'mod/forum:viewrating',1,1201718644,0),(264,1,1,'mod/forum:viewrating',1,1201718644,0),(265,1,4,'mod/forum:viewanyrating',1,1201718644,0),(266,1,3,'mod/forum:viewanyrating',1,1201718644,0),(267,1,1,'mod/forum:viewanyrating',1,1201718644,0),(268,1,4,'mod/forum:rate',1,1201718644,0),(269,1,3,'mod/forum:rate',1,1201718644,0),(270,1,1,'mod/forum:rate',1,1201718644,0),(271,1,5,'mod/forum:createattachment',1,1201718644,0),(272,1,4,'mod/forum:createattachment',1,1201718644,0),(273,1,3,'mod/forum:createattachment',1,1201718644,0),(274,1,1,'mod/forum:createattachment',1,1201718644,0),(275,1,5,'mod/forum:deleteownpost',1,1201718644,0),(276,1,4,'mod/forum:deleteownpost',1,1201718644,0),(277,1,3,'mod/forum:deleteownpost',1,1201718644,0),(278,1,1,'mod/forum:deleteownpost',1,1201718644,0),(279,1,4,'mod/forum:deleteanypost',1,1201718644,0),(280,1,3,'mod/forum:deleteanypost',1,1201718644,0),(281,1,1,'mod/forum:deleteanypost',1,1201718644,0),(282,1,4,'mod/forum:splitdiscussions',1,1201718644,0),(283,1,3,'mod/forum:splitdiscussions',1,1201718644,0),(284,1,1,'mod/forum:splitdiscussions',1,1201718644,0),(285,1,4,'mod/forum:movediscussions',1,1201718644,0),(286,1,3,'mod/forum:movediscussions',1,1201718644,0),(287,1,1,'mod/forum:movediscussions',1,1201718644,0),(288,1,4,'mod/forum:editanypost',1,1201718644,0),(289,1,3,'mod/forum:editanypost',1,1201718644,0),(290,1,1,'mod/forum:editanypost',1,1201718644,0),(291,1,4,'mod/forum:viewqandawithoutposting',1,1201718644,0),(292,1,3,'mod/forum:viewqandawithoutposting',1,1201718644,0),(293,1,1,'mod/forum:viewqandawithoutposting',1,1201718644,0),(294,1,4,'mod/forum:viewsubscribers',1,1201718644,0),(295,1,3,'mod/forum:viewsubscribers',1,1201718644,0),(296,1,1,'mod/forum:viewsubscribers',1,1201718644,0),(297,1,4,'mod/forum:managesubscriptions',1,1201718644,0),(298,1,3,'mod/forum:managesubscriptions',1,1201718644,0),(299,1,1,'mod/forum:managesubscriptions',1,1201718644,0),(300,1,4,'mod/forum:initialsubscriptions',1,1201718644,0),(301,1,3,'mod/forum:initialsubscriptions',1,1201718644,0),(302,1,5,'mod/forum:initialsubscriptions',1,1201718644,0),(303,1,5,'mod/glossary:write',1,1201718645,0),(304,1,4,'mod/glossary:write',1,1201718645,0),(305,1,3,'mod/glossary:write',1,1201718645,0),(306,1,1,'mod/glossary:write',1,1201718645,0),(307,1,4,'mod/glossary:manageentries',1,1201718645,0),(308,1,3,'mod/glossary:manageentries',1,1201718645,0),(309,1,1,'mod/glossary:manageentries',1,1201718645,0),(310,1,4,'mod/glossary:managecategories',1,1201718645,0),(311,1,3,'mod/glossary:managecategories',1,1201718645,0),(312,1,1,'mod/glossary:managecategories',1,1201718645,0),(313,1,5,'mod/glossary:comment',1,1201718645,0),(314,1,4,'mod/glossary:comment',1,1201718645,0),(315,1,3,'mod/glossary:comment',1,1201718645,0),(316,1,1,'mod/glossary:comment',1,1201718645,0),(317,1,4,'mod/glossary:managecomments',1,1201718645,0),(318,1,3,'mod/glossary:managecomments',1,1201718645,0),(319,1,1,'mod/glossary:managecomments',1,1201718645,0),(320,1,4,'mod/glossary:import',1,1201718645,0),(321,1,3,'mod/glossary:import',1,1201718645,0),(322,1,1,'mod/glossary:import',1,1201718645,0),(323,1,4,'mod/glossary:export',1,1201718645,0),(324,1,3,'mod/glossary:export',1,1201718645,0),(325,1,1,'mod/glossary:export',1,1201718645,0),(326,1,4,'mod/glossary:approve',1,1201718645,0),(327,1,3,'mod/glossary:approve',1,1201718645,0),(328,1,1,'mod/glossary:approve',1,1201718645,0),(329,1,4,'mod/glossary:rate',1,1201718645,0),(330,1,3,'mod/glossary:rate',1,1201718645,0),(331,1,1,'mod/glossary:rate',1,1201718645,0),(332,1,4,'mod/glossary:viewrating',1,1201718645,0),(333,1,3,'mod/glossary:viewrating',1,1201718645,0),(334,1,1,'mod/glossary:viewrating',1,1201718645,0),(335,1,5,'mod/hotpot:attempt',1,1201718646,0),(336,1,4,'mod/hotpot:attempt',1,1201718646,0),(337,1,3,'mod/hotpot:attempt',1,1201718646,0),(338,1,1,'mod/hotpot:attempt',1,1201718646,0),(339,1,4,'mod/hotpot:viewreport',1,1201718646,0),(340,1,3,'mod/hotpot:viewreport',1,1201718646,0),(341,1,1,'mod/hotpot:viewreport',1,1201718646,0),(342,1,4,'mod/hotpot:grade',1,1201718646,0),(343,1,3,'mod/hotpot:grade',1,1201718646,0),(344,1,1,'mod/hotpot:grade',1,1201718646,0),(345,1,3,'mod/hotpot:deleteattempt',1,1201718646,0),(346,1,1,'mod/hotpot:deleteattempt',1,1201718646,0),(347,1,5,'mod/lams:participate',1,1201718646,0),(348,1,4,'mod/lams:manage',1,1201718646,0),(349,1,3,'mod/lams:manage',1,1201718646,0),(350,1,1,'mod/lams:manage',1,1201718646,0),(351,1,3,'mod/lesson:edit',1,1201718648,0),(352,1,1,'mod/lesson:edit',1,1201718648,0),(353,1,4,'mod/lesson:manage',1,1201718648,0),(354,1,3,'mod/lesson:manage',1,1201718648,0),(355,1,1,'mod/lesson:manage',1,1201718648,0),(356,1,6,'mod/quiz:view',1,1201718650,0),(357,1,5,'mod/quiz:view',1,1201718650,0),(358,1,4,'mod/quiz:view',1,1201718650,0),(359,1,3,'mod/quiz:view',1,1201718650,0),(360,1,1,'mod/quiz:view',1,1201718650,0),(361,1,5,'mod/quiz:attempt',1,1201718650,0),(362,1,3,'mod/quiz:manage',1,1201718650,0),(363,1,1,'mod/quiz:manage',1,1201718650,0),(364,1,4,'mod/quiz:preview',1,1201718650,0),(365,1,3,'mod/quiz:preview',1,1201718650,0),(366,1,1,'mod/quiz:preview',1,1201718650,0),(367,1,4,'mod/quiz:grade',1,1201718650,0),(368,1,3,'mod/quiz:grade',1,1201718650,0),(369,1,1,'mod/quiz:grade',1,1201718650,0),(370,1,4,'mod/quiz:viewreports',1,1201718650,0),(371,1,3,'mod/quiz:viewreports',1,1201718650,0),(372,1,1,'mod/quiz:viewreports',1,1201718650,0),(373,1,3,'mod/quiz:deleteattempts',1,1201718650,0),(374,1,1,'mod/quiz:deleteattempts',1,1201718650,0),(375,1,4,'mod/scorm:viewreport',1,1201718652,0),(376,1,3,'mod/scorm:viewreport',1,1201718652,0),(377,1,1,'mod/scorm:viewreport',1,1201718652,0),(378,1,5,'mod/scorm:skipview',1,1201718652,0),(379,1,5,'mod/scorm:savetrack',1,1201718652,0),(380,1,4,'mod/scorm:savetrack',1,1201718652,0),(381,1,3,'mod/scorm:savetrack',1,1201718652,0),(382,1,1,'mod/scorm:savetrack',1,1201718652,0),(383,1,5,'mod/scorm:viewscores',1,1201718652,0),(384,1,4,'mod/scorm:viewscores',1,1201718652,0),(385,1,3,'mod/scorm:viewscores',1,1201718652,0),(386,1,1,'mod/scorm:viewscores',1,1201718652,0),(387,1,5,'mod/survey:participate',1,1201718653,0),(388,1,4,'mod/survey:participate',1,1201718653,0),(389,1,3,'mod/survey:participate',1,1201718653,0),(390,1,1,'mod/survey:participate',1,1201718653,0),(391,1,4,'mod/survey:readresponses',1,1201718653,0),(392,1,3,'mod/survey:readresponses',1,1201718653,0),(393,1,1,'mod/survey:readresponses',1,1201718653,0),(394,1,4,'mod/survey:download',1,1201718653,0),(395,1,3,'mod/survey:download',1,1201718653,0),(396,1,1,'mod/survey:download',1,1201718653,0),(397,1,5,'mod/wiki:participate',1,1201718654,0),(398,1,4,'mod/wiki:participate',1,1201718654,0),(399,1,3,'mod/wiki:participate',1,1201718654,0),(400,1,1,'mod/wiki:participate',1,1201718654,0),(401,1,4,'mod/wiki:manage',1,1201718654,0),(402,1,3,'mod/wiki:manage',1,1201718654,0),(403,1,1,'mod/wiki:manage',1,1201718654,0),(404,1,4,'mod/wiki:overridelock',1,1201718654,0),(405,1,3,'mod/wiki:overridelock',1,1201718654,0),(406,1,1,'mod/wiki:overridelock',1,1201718654,0),(407,1,5,'mod/workshop:participate',1,1201718655,0),(408,1,4,'mod/workshop:manage',1,1201718655,0),(409,1,3,'mod/workshop:manage',1,1201718655,0),(410,1,1,'mod/workshop:manage',1,1201718655,0),(411,1,4,'block/rss_client:createprivatefeeds',1,1201718660,0),(412,1,3,'block/rss_client:createprivatefeeds',1,1201718660,0),(413,1,1,'block/rss_client:createprivatefeeds',1,1201718660,0),(414,1,3,'block/rss_client:createsharedfeeds',1,1201718660,0),(415,1,1,'block/rss_client:createsharedfeeds',1,1201718660,0),(416,1,4,'block/rss_client:manageownfeeds',1,1201718660,0),(417,1,3,'block/rss_client:manageownfeeds',1,1201718660,0),(418,1,1,'block/rss_client:manageownfeeds',1,1201718660,0),(419,1,1,'block/rss_client:manageanyfeeds',1,1201718660,0),(420,1,1,'enrol/authorize:managepayments',1,1201718662,0),(421,1,1,'enrol/authorize:uploadcsv',1,1201718662,0),(422,1,6,'mod/audiorecorder:view',1,1208401371,0),(423,1,5,'mod/audiorecorder:view',1,1208401371,0),(424,1,4,'mod/audiorecorder:view',1,1208401371,0),(425,1,3,'mod/audiorecorder:view',1,1208401371,0),(426,1,2,'mod/audiorecorder:view',1,1208401371,0),(427,1,1,'mod/audiorecorder:view',1,1208401371,0),(428,1,5,'mod/audiorecorder:submit',1,1208401371,0),(429,1,4,'mod/audiorecorder:grade',1,1208401371,0),(430,1,3,'mod/audiorecorder:grade',1,1208401371,0),(431,1,2,'mod/audiorecorder:grade',1,1208401371,0),(432,1,1,'mod/audiorecorder:grade',1,1208401371,0);;
DROP TABLE IF EXISTS mdl_role_names;;
CREATE TABLE mdl_role_names (
  id bigint(10) unsigned NOT NULL auto_increment,
  roleid bigint(10) unsigned NOT NULL default '0',
  contextid bigint(10) unsigned NOT NULL default '0',
  text text NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_rolename_rolcon_uix (roleid,contextid),
  KEY mdl_rolename_rol_ix (roleid),
  KEY mdl_rolename_con_ix (contextid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='role names in native strings';;
DROP TABLE IF EXISTS mdl_scale;;
CREATE TABLE mdl_scale (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  scale text NOT NULL,
  description text NOT NULL,
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_scal_cou_ix (courseid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines grading scales';;
DROP TABLE IF EXISTS mdl_scorm;;
CREATE TABLE mdl_scorm (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  reference varchar(255) NOT NULL default '',
  summary text NOT NULL,
  version varchar(9) NOT NULL default '',
  maxgrade double NOT NULL default '0',
  grademethod tinyint(2) NOT NULL default '0',
  maxattempt bigint(10) NOT NULL default '1',
  updatefreq tinyint(1) unsigned NOT NULL default '0',
  md5hash varchar(32) NOT NULL default '',
  launch bigint(10) unsigned NOT NULL default '0',
  skipview tinyint(1) unsigned NOT NULL default '1',
  hidebrowse tinyint(1) NOT NULL default '0',
  hidetoc tinyint(1) NOT NULL default '0',
  hidenav tinyint(1) NOT NULL default '0',
  auto tinyint(1) unsigned NOT NULL default '0',
  popup tinyint(1) unsigned NOT NULL default '0',
  options varchar(255) NOT NULL default '',
  width bigint(10) unsigned NOT NULL default '100',
  height bigint(10) unsigned NOT NULL default '600',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_scor_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration';;
DROP TABLE IF EXISTS mdl_scorm_scoes;;
CREATE TABLE mdl_scorm_scoes (
  id bigint(10) unsigned NOT NULL auto_increment,
  scorm bigint(10) unsigned NOT NULL default '0',
  manifest varchar(255) NOT NULL default '',
  organization varchar(255) NOT NULL default '',
  parent varchar(255) NOT NULL default '',
  identifier varchar(255) NOT NULL default '',
  launch varchar(255) NOT NULL default '',
  scormtype varchar(5) NOT NULL default '',
  title varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_scorscoe_sco_ix (scorm)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module';;
DROP TABLE IF EXISTS mdl_scorm_scoes_data;;
CREATE TABLE mdl_scorm_scoes_data (
  id bigint(10) unsigned NOT NULL auto_increment,
  scoid bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_scorscoedata_sco_ix (scoid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages';;
DROP TABLE IF EXISTS mdl_scorm_scoes_track;;
CREATE TABLE mdl_scorm_scoes_track (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  scormid bigint(10) NOT NULL default '0',
  scoid bigint(10) unsigned NOT NULL default '0',
  attempt bigint(10) unsigned NOT NULL default '1',
  element varchar(255) NOT NULL default '',
  value longtext NOT NULL,
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_scorscoetrac_usescosco_uix (userid,scormid,scoid,attempt,element),
  KEY mdl_scorscoetrac_use_ix (userid),
  KEY mdl_scorscoetrac_ele_ix (element),
  KEY mdl_scorscoetrac_sco_ix (scormid),
  KEY mdl_scorscoetrac_sco2_ix (scoid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to track SCOes';;
DROP TABLE IF EXISTS mdl_scorm_seq_mapinfo;;
CREATE TABLE mdl_scorm_seq_mapinfo (
  id bigint(10) unsigned NOT NULL auto_increment,
  scoid bigint(10) unsigned NOT NULL default '0',
  objectiveid bigint(10) unsigned NOT NULL default '0',
  targetobjectiveid bigint(10) unsigned NOT NULL default '0',
  readsatisfiedstatus tinyint(1) NOT NULL default '1',
  readnormalizedmeasure tinyint(1) NOT NULL default '1',
  writesatisfiedstatus tinyint(1) NOT NULL default '0',
  writenormalizedmeasure tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_scorseqmapi_scoidobj_uix (scoid,id,objectiveid),
  KEY mdl_scorseqmapi_sco_ix (scoid),
  KEY mdl_scorseqmapi_obj_ix (objectiveid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description';;
DROP TABLE IF EXISTS mdl_scorm_seq_objective;;
CREATE TABLE mdl_scorm_seq_objective (
  id bigint(10) unsigned NOT NULL auto_increment,
  scoid bigint(10) unsigned NOT NULL default '0',
  primaryobj tinyint(1) NOT NULL default '0',
  objectiveid bigint(10) unsigned NOT NULL default '0',
  satisfiedbymeasure tinyint(1) NOT NULL default '1',
  minnormalizedmeasure float(11,4) unsigned NOT NULL default '0.0000',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_scorseqobje_scoid_uix (scoid,id),
  KEY mdl_scorseqobje_sco_ix (scoid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description';;
DROP TABLE IF EXISTS mdl_scorm_seq_rolluprule;;
CREATE TABLE mdl_scorm_seq_rolluprule (
  id bigint(10) unsigned NOT NULL auto_increment,
  scoid bigint(10) unsigned NOT NULL default '0',
  childactivityset varchar(15) NOT NULL default '',
  minimumcount bigint(10) unsigned NOT NULL default '0',
  minimumpercent float(11,4) unsigned NOT NULL default '0.0000',
  conditioncombination varchar(3) NOT NULL default 'all',
  action varchar(15) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_scorseqroll_scoid_uix (scoid,id),
  KEY mdl_scorseqroll_sco_ix (scoid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';;
DROP TABLE IF EXISTS mdl_scorm_seq_rolluprulecond;;
CREATE TABLE mdl_scorm_seq_rolluprulecond (
  id bigint(10) unsigned NOT NULL auto_increment,
  scoid bigint(10) unsigned NOT NULL default '0',
  rollupruleid bigint(10) unsigned NOT NULL default '0',
  operator varchar(5) NOT NULL default 'noOp',
  cond varchar(25) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_scorseqroll_scorolid_uix (scoid,rollupruleid,id),
  KEY mdl_scorseqroll_sco2_ix (scoid),
  KEY mdl_scorseqroll_rol_ix (rollupruleid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';;
DROP TABLE IF EXISTS mdl_scorm_seq_rulecond;;
CREATE TABLE mdl_scorm_seq_rulecond (
  id bigint(10) unsigned NOT NULL auto_increment,
  scoid bigint(10) unsigned NOT NULL default '0',
  ruleconditionsid bigint(10) unsigned NOT NULL default '0',
  refrencedobjective varchar(255) NOT NULL default '',
  measurethreshold float(11,4) NOT NULL default '0.0000',
  operator varchar(5) NOT NULL default 'noOp',
  cond varchar(30) NOT NULL default 'always',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_scorseqrule_idscorul_uix (id,scoid,ruleconditionsid),
  KEY mdl_scorseqrule_sco2_ix (scoid),
  KEY mdl_scorseqrule_rul_ix (ruleconditionsid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition';;
DROP TABLE IF EXISTS mdl_scorm_seq_ruleconds;;
CREATE TABLE mdl_scorm_seq_ruleconds (
  id bigint(10) unsigned NOT NULL auto_increment,
  scoid bigint(10) unsigned NOT NULL default '0',
  conditioncombination varchar(3) NOT NULL default 'all',
  ruletype tinyint(2) unsigned NOT NULL default '0',
  action varchar(25) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_scorseqrule_scoid_uix (scoid,id),
  KEY mdl_scorseqrule_sco_ix (scoid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions';;
DROP TABLE IF EXISTS mdl_sessions2;;
CREATE TABLE mdl_sessions2 (
  sesskey varchar(64) NOT NULL default '',
  expiry datetime NOT NULL,
  expireref varchar(250) default '',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  sessdata longtext,
  PRIMARY KEY  (sesskey),
  KEY mdl_sess_exp_ix (expiry),
  KEY mdl_sess_exp2_ix (expireref)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Optional database session storage in new format, not used by';;
DROP TABLE IF EXISTS mdl_slideshow;;
CREATE TABLE mdl_slideshow (
  id int(10) unsigned NOT NULL auto_increment,
  course int(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  location text NOT NULL,
  layout int(10) unsigned NOT NULL default '0',
  filename int(10) unsigned NOT NULL default '0',
  delaytime int(10) unsigned NOT NULL default '7',
  centred int(10) unsigned NOT NULL default '0',
  autobgcolor int(10) unsigned NOT NULL default '0',
  timemodified int(10) unsigned NOT NULL default '0',
  htmlcaptions int(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY course (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='slideshow module';;
DROP TABLE IF EXISTS mdl_slideshow_captions;;
CREATE TABLE mdl_slideshow_captions (
  id int(10) unsigned NOT NULL auto_increment,
  slideshow int(10) unsigned NOT NULL default '0',
  image text NOT NULL,
  title text NOT NULL,
  caption text NOT NULL,
  PRIMARY KEY  (id),
  KEY slideshow (slideshow)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='slideshow captions';;
DROP TABLE IF EXISTS mdl_stats_daily;;
CREATE TABLE mdl_stats_daily (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  timeend bigint(10) unsigned NOT NULL default '0',
  roleid bigint(10) unsigned NOT NULL default '0',
  stattype enum('enrolments','activity','logins') NOT NULL default 'activity',
  stat1 bigint(10) unsigned NOT NULL default '0',
  stat2 bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_statdail_cou_ix (courseid),
  KEY mdl_statdail_tim_ix (timeend),
  KEY mdl_statdail_rol_ix (roleid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats';;
DROP TABLE IF EXISTS mdl_stats_monthly;;
CREATE TABLE mdl_stats_monthly (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  timeend bigint(10) unsigned NOT NULL default '0',
  roleid bigint(10) unsigned NOT NULL default '0',
  stattype enum('enrolments','activity','logins') NOT NULL default 'activity',
  stat1 bigint(10) unsigned NOT NULL default '0',
  stat2 bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_statmont_cou_ix (courseid),
  KEY mdl_statmont_tim_ix (timeend),
  KEY mdl_statmont_rol_ix (roleid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats';;
DROP TABLE IF EXISTS mdl_stats_user_daily;;
CREATE TABLE mdl_stats_user_daily (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  roleid bigint(10) unsigned NOT NULL default '0',
  timeend bigint(10) unsigned NOT NULL default '0',
  statsreads bigint(10) unsigned NOT NULL default '0',
  statswrites bigint(10) unsigned NOT NULL default '0',
  stattype varchar(30) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_statuserdail_cou_ix (courseid),
  KEY mdl_statuserdail_use_ix (userid),
  KEY mdl_statuserdail_rol_ix (roleid),
  KEY mdl_statuserdail_tim_ix (timeend)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user';;
DROP TABLE IF EXISTS mdl_stats_user_monthly;;
CREATE TABLE mdl_stats_user_monthly (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  roleid bigint(10) unsigned NOT NULL default '0',
  timeend bigint(10) unsigned NOT NULL default '0',
  statsreads bigint(10) unsigned NOT NULL default '0',
  statswrites bigint(10) unsigned NOT NULL default '0',
  stattype varchar(30) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_statusermont_cou_ix (courseid),
  KEY mdl_statusermont_use_ix (userid),
  KEY mdl_statusermont_rol_ix (roleid),
  KEY mdl_statusermont_tim_ix (timeend)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user';;
DROP TABLE IF EXISTS mdl_stats_user_weekly;;
CREATE TABLE mdl_stats_user_weekly (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  roleid bigint(10) unsigned NOT NULL default '0',
  timeend bigint(10) unsigned NOT NULL default '0',
  statsreads bigint(10) unsigned NOT NULL default '0',
  statswrites bigint(10) unsigned NOT NULL default '0',
  stattype varchar(30) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_statuserweek_cou_ix (courseid),
  KEY mdl_statuserweek_use_ix (userid),
  KEY mdl_statuserweek_rol_ix (roleid),
  KEY mdl_statuserweek_tim_ix (timeend)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user';;
DROP TABLE IF EXISTS mdl_stats_weekly;;
CREATE TABLE mdl_stats_weekly (
  id bigint(10) unsigned NOT NULL auto_increment,
  courseid bigint(10) unsigned NOT NULL default '0',
  timeend bigint(10) unsigned NOT NULL default '0',
  roleid bigint(10) unsigned NOT NULL default '0',
  stattype enum('enrolments','activity','logins') NOT NULL default 'activity',
  stat1 bigint(10) unsigned NOT NULL default '0',
  stat2 bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_statweek_cou_ix (courseid),
  KEY mdl_statweek_tim_ix (timeend),
  KEY mdl_statweek_rol_ix (roleid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats';;
DROP TABLE IF EXISTS mdl_survey;;
CREATE TABLE mdl_survey (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  template bigint(10) unsigned NOT NULL default '0',
  days mediumint(6) NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  intro text NOT NULL,
  questions varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_surv_cou_ix (course)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration';;
INSERT INTO mdl_survey VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro','25,26,27,28,29,30,43,44'),(2,0,0,0,985017600,985017600,'collespname','collespintro','31,32,33,34,35,36,43,44'),(3,0,0,0,985017600,985017600,'collesapname','collesapintro','37,38,39,40,41,42,43,44'),(4,0,0,0,985017600,985017600,'attlsname','attlsintro','65,67,68'),(5,0,0,0,985017600,985017600,'ciqname','ciqintro','69,70,71,72,73');;
DROP TABLE IF EXISTS mdl_survey_analysis;;
CREATE TABLE mdl_survey_analysis (
  id bigint(10) unsigned NOT NULL auto_increment,
  survey bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  notes text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_survanal_use_ix (userid),
  KEY mdl_survanal_sur_ix (survey)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='text about each survey submission';;
DROP TABLE IF EXISTS mdl_survey_answers;;
CREATE TABLE mdl_survey_answers (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  survey bigint(10) unsigned NOT NULL default '0',
  question bigint(10) unsigned NOT NULL default '0',
  time bigint(10) unsigned NOT NULL default '0',
  answer1 text NOT NULL,
  answer2 text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_survansw_use_ix (userid),
  KEY mdl_survansw_sur_ix (survey),
  KEY mdl_survansw_que_ix (question)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users';;
DROP TABLE IF EXISTS mdl_survey_questions;;
CREATE TABLE mdl_survey_questions (
  id bigint(10) unsigned NOT NULL auto_increment,
  text varchar(255) NOT NULL default '',
  shorttext varchar(30) NOT NULL default '',
  multi varchar(100) NOT NULL default '',
  intro varchar(50) NOT NULL default '',
  type smallint(3) NOT NULL default '0',
  options text,
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey';;
INSERT INTO mdl_survey_questions VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);;
DROP TABLE IF EXISTS mdl_tags;;
CREATE TABLE mdl_tags (
  id bigint(10) unsigned NOT NULL auto_increment,
  type varchar(255) NOT NULL default 'official',
  userid bigint(10) unsigned NOT NULL default '0',
  text varchar(20) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_tags_typuse_ix (type,userid),
  KEY mdl_tags_tex_ix (text)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tags structure for moodle';;
DROP TABLE IF EXISTS mdl_timezone;;
CREATE TABLE mdl_timezone (
  id bigint(10) NOT NULL auto_increment,
  name varchar(100) NOT NULL default '',
  year bigint(11) NOT NULL default '0',
  tzrule varchar(20) NOT NULL default '',
  gmtoff bigint(11) NOT NULL default '0',
  dstoff bigint(11) NOT NULL default '0',
  dst_month tinyint(2) NOT NULL default '0',
  dst_startday smallint(3) NOT NULL default '0',
  dst_weekday smallint(3) NOT NULL default '0',
  dst_skipweeks smallint(3) NOT NULL default '0',
  dst_time varchar(6) NOT NULL default '00:00',
  std_month tinyint(2) NOT NULL default '0',
  std_startday smallint(3) NOT NULL default '0',
  std_weekday smallint(3) NOT NULL default '0',
  std_skipweeks smallint(3) NOT NULL default '0',
  std_time varchar(6) NOT NULL default '00:00',
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=1977 DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users';;
INSERT INTO mdl_timezone VALUES (1,'Africa/Algiers',1970,'Algeria',0,60,4,1,1,0,'02:00',9,16,-1,0,'00:00'),(2,'Africa/Algiers',1971,'Algeria',0,60,4,25,-1,0,'23:00',9,26,-1,0,'23:00'),(3,'Africa/Algiers',1977,'Algeria',60,60,5,6,-1,0,'01:00',10,21,-1,0,'00:00'),(4,'Africa/Algiers',1978,'Algeria',60,60,3,24,-1,0,'02:00',9,22,-1,0,'03:00'),(5,'Africa/Algiers',1979,'Algeria',0,60,3,24,-1,0,'01:00',9,22,-1,0,'02:00'),(6,'Africa/Algiers',1980,'Algeria',0,60,4,25,-1,0,'00:00',10,31,-1,0,'01:00'),(7,'Africa/Algiers',1981,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(8,'Africa/Luanda',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(9,'Africa/Porto-Novo',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(10,'Africa/Gaborone',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(11,'Africa/Ouagadougou',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(12,'Africa/Bujumbura',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(13,'Africa/Douala',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(14,'Atlantic/Cape_Verde',1970,'',-120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(15,'Atlantic/Cape_Verde',1975,'',-60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(16,'Africa/Bangui',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(17,'Africa/Ndjamena',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(18,'Africa/Ndjamena',1979,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(19,'Indian/Comoro',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(20,'Africa/Kinshasa',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(21,'Africa/Lubumbashi',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(22,'Africa/Brazzaville',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(23,'Africa/Abidjan',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(24,'Africa/Djibouti',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(25,'Africa/Cairo',1970,'Egypt',120,60,5,1,-1,0,'03:00',10,1,-1,0,'04:00'),(26,'Africa/Cairo',1982,'Egypt',120,60,7,25,-1,0,'03:00',10,1,-1,0,'04:00'),(27,'Africa/Cairo',1983,'Egypt',120,60,7,12,-1,0,'03:00',10,1,-1,0,'04:00'),(28,'Africa/Cairo',1984,'Egypt',120,60,5,1,-1,0,'03:00',10,1,-1,0,'04:00'),(29,'Africa/Cairo',1989,'Egypt',120,60,5,6,-1,0,'03:00',10,1,-1,0,'04:00'),(30,'Africa/Cairo',1990,'Egypt',120,60,5,1,-1,0,'03:00',10,1,-1,0,'04:00'),(31,'Africa/Cairo',1995,'Egypt',120,60,4,-1,5,0,'02:00',9,-1,4,0,'25:00'),(32,'Africa/Cairo',2006,'Egypt',120,60,4,-1,5,0,'02:00',9,21,-1,0,'25:00'),(33,'Africa/Cairo',2007,'Egypt',120,60,4,-1,5,0,'02:00',9,1,4,0,'25:00'),(34,'Africa/Cairo',2008,'Egypt',120,0,4,-1,5,0,'02:00',9,1,4,0,'25:00'),(35,'Africa/Malabo',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(36,'Africa/Asmara',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(37,'Africa/Addis_Ababa',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(38,'Africa/Libreville',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(39,'Africa/Banjul',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(40,'Africa/Accra',1970,'Ghana',0,0,9,1,-1,0,'00:00',12,31,-1,0,'-1:00'),(41,'Africa/Conakry',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(42,'Africa/Bissau',1970,'',-60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(43,'Africa/Bissau',1975,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(44,'Africa/Nairobi',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(45,'Africa/Maseru',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(46,'Africa/Monrovia',1970,'',-44,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(47,'Africa/Monrovia',1972,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(48,'Africa/Tripoli',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(49,'Africa/Tripoli',1982,'Libya',60,60,4,1,-1,0,'01:00',10,1,-1,0,'00:00'),(50,'Africa/Tripoli',1985,'Libya',60,60,4,6,-1,0,'01:00',10,1,-1,0,'00:00'),(51,'Africa/Tripoli',1986,'Libya',60,60,4,4,-1,0,'01:00',10,3,-1,0,'00:00'),(52,'Africa/Tripoli',1987,'Libya',60,60,4,1,-1,0,'01:00',10,1,-1,0,'00:00'),(53,'Africa/Tripoli',1989,'Libya',60,0,4,1,-1,0,'01:00',10,1,-1,0,'00:00'),(54,'Africa/Tripoli',1990,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(55,'Africa/Tripoli',1996,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(56,'Africa/Tripoli',1997,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(57,'Indian/Antananarivo',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(58,'Africa/Blantyre',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(59,'Africa/Bamako',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(60,'Africa/Nouakchott',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(61,'Indian/Mauritius',1970,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(62,'Indian/Mayotte',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(63,'Africa/Casablanca',1970,'Morocco',0,60,6,3,-1,0,'12:00',10,1,-1,0,'-1:00'),(64,'Africa/Casablanca',1974,'Morocco',0,60,6,24,-1,0,'00:00',9,1,-1,0,'-1:00'),(65,'Africa/Casablanca',1976,'Morocco',0,60,5,1,-1,0,'00:00',8,1,-1,0,'-1:00'),(66,'Africa/Casablanca',1977,'Morocco',0,60,5,1,-1,0,'00:00',9,28,-1,0,'-1:00'),(67,'Africa/Casablanca',1978,'Morocco',0,60,6,1,-1,0,'00:00',8,4,-1,0,'-1:00'),(68,'Africa/Casablanca',1979,'Morocco',0,0,6,1,-1,0,'00:00',8,4,-1,0,'-1:00'),(69,'Africa/Casablanca',1984,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(70,'Africa/Casablanca',1986,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(71,'Africa/El_Aaiun',1970,'',-60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(72,'Africa/El_Aaiun',1976,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(73,'Africa/Maputo',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(74,'Africa/Windhoek',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(75,'Africa/Windhoek',1990,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(76,'Africa/Windhoek',1994,'Namibia',60,60,9,1,0,0,'03:00',1,1,-1,0,'12:00'),(77,'Africa/Windhoek',1995,'Namibia',60,60,9,1,0,0,'03:00',4,1,0,0,'02:00'),(78,'Africa/Niamey',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(79,'Africa/Lagos',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(80,'Indian/Reunion',1970,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(81,'Africa/Kigali',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(82,'Atlantic/St_Helena',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(83,'Africa/Sao_Tome',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(84,'Africa/Dakar',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(85,'Indian/Mahe',1970,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(86,'Africa/Freetown',1970,'SL',0,0,6,1,-1,0,'00:00',9,1,-1,0,'-1:00'),(87,'Africa/Mogadishu',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(88,'Africa/Johannesburg',1970,'SA',120,0,12,31,-1,0,'14:00',3,15,0,0,'03:00'),(89,'Africa/Khartoum',1970,'Sudan',120,60,5,1,-1,0,'02:00',10,15,-1,0,'01:00'),(90,'Africa/Khartoum',1971,'Sudan',120,60,4,30,-1,0,'02:00',10,15,-1,0,'01:00'),(91,'Africa/Khartoum',1972,'Sudan',120,60,4,-1,0,0,'02:00',10,15,-1,0,'01:00'),(92,'Africa/Khartoum',1985,'Sudan',120,0,4,-1,0,0,'02:00',10,15,-1,0,'01:00'),(93,'Africa/Khartoum',2000,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(94,'Africa/Mbabane',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(95,'Africa/Dar_es_Salaam',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(96,'Africa/Lome',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(97,'Africa/Tunis',1970,'Tunisia',60,60,4,1,1,0,'03:00',9,16,-1,0,'00:00'),(98,'Africa/Tunis',1977,'Tunisia',60,60,4,30,-1,0,'01:00',9,24,-1,0,'01:00'),(99,'Africa/Tunis',1978,'Tunisia',60,60,5,1,-1,0,'01:00',10,1,-1,0,'01:00'),(100,'Africa/Tunis',1988,'Tunisia',60,60,6,1,-1,0,'01:00',9,-1,0,0,'01:00'),(101,'Africa/Tunis',1989,'Tunisia',60,60,3,26,-1,0,'01:00',9,-1,0,0,'01:00'),(102,'Africa/Tunis',1990,'Tunisia',60,60,5,1,-1,0,'01:00',9,-1,0,0,'01:00'),(103,'Africa/Tunis',2005,'Tunisia',60,60,5,1,-1,0,'01:00',9,30,-1,0,'02:00'),(104,'Africa/Tunis',2006,'Tunisia',60,60,3,-1,0,0,'03:00',10,-1,0,0,'03:00'),(105,'Africa/Kampala',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(106,'Africa/Lusaka',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(107,'Africa/Harare',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(108,'Antarctica/Casey',1970,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(109,'Antarctica/Davis',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(110,'Antarctica/Mawson',1970,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(111,'Indian/Kerguelen',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(112,'Antarctica/DumontDUrville',1970,'',600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(113,'Antarctica/Syowa',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(114,'Antarctica/Vostok',1970,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(115,'Antarctica/Rothera',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(116,'Antarctica/Rothera',1976,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(117,'Antarctica/Palmer',1970,'ArgAQ',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(118,'Antarctica/Palmer',1974,'ArgAQ',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(119,'Antarctica/Palmer',1975,'ArgAQ',-180,0,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(120,'Antarctica/Palmer',1982,'ChileAQ',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(121,'Antarctica/Palmer',1987,'ChileAQ',-240,60,10,9,0,0,'4:00',4,12,-1,0,'3:00'),(122,'Antarctica/Palmer',1988,'ChileAQ',-240,60,10,1,0,0,'4:00',3,9,0,0,'3:00'),(123,'Antarctica/Palmer',1989,'ChileAQ',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(124,'Antarctica/Palmer',1990,'ChileAQ',-240,60,9,16,-1,0,'4:00',3,18,-1,0,'3:00'),(125,'Antarctica/Palmer',1991,'ChileAQ',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(126,'Antarctica/Palmer',1997,'ChileAQ',-240,60,10,9,0,0,'4:00',3,30,-1,0,'3:00'),(127,'Antarctica/Palmer',1998,'ChileAQ',-240,60,9,27,-1,0,'4:00',3,9,0,0,'3:00'),(128,'Antarctica/Palmer',1999,'ChileAQ',-240,60,10,9,0,0,'4:00',4,4,-1,0,'3:00'),(129,'Antarctica/Palmer',2000,'ChileAQ',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(130,'Antarctica/McMurdo',1970,'NZAQ',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(131,'Antarctica/McMurdo',1974,'NZAQ',720,60,11,3,-1,0,'14:00',1,1,-1,0,'23:00'),(132,'Antarctica/McMurdo',1975,'NZAQ',720,60,10,-1,0,0,'14:00',2,23,-1,0,'14:00'),(133,'Antarctica/McMurdo',1976,'NZAQ',720,60,10,-1,0,0,'14:00',3,1,0,0,'14:00'),(134,'Antarctica/McMurdo',1989,'NZAQ',720,60,10,8,-1,0,'14:00',3,1,0,0,'14:00'),(135,'Antarctica/McMurdo',1990,'NZAQ',720,60,10,1,0,0,'14:00',3,15,0,0,'14:00'),(136,'Antarctica/McMurdo',2007,'NZAQ',720,0,9,-1,0,0,'14:00',3,15,0,0,'14:00'),(137,'Asia/Kabul',1970,'',270,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(138,'Asia/Yerevan',1970,'RussiaAsia',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(139,'Asia/Yerevan',1981,'RussiaAsia',240,60,4,1,-1,0,'04:00',10,1,-1,0,'03:00'),(140,'Asia/Yerevan',1984,'RussiaAsia',240,60,4,1,-1,0,'04:00',9,-1,0,0,'06:00'),(141,'Asia/Yerevan',1985,'RussiaAsia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(142,'Asia/Yerevan',1991,'RussiaAsia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(143,'Asia/Yerevan',1992,'RussiaAsia',180,60,3,-1,6,0,'26:00',9,-1,6,0,'25:00'),(144,'Asia/Yerevan',1993,'RussiaAsia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(145,'Asia/Yerevan',1995,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(146,'Asia/Yerevan',1997,'RussiaAsia',240,60,3,-1,0,0,'06:00',10,-1,0,0,'06:00'),(147,'Asia/Baku',1970,'RussiaAsia',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(148,'Asia/Baku',1981,'RussiaAsia',240,60,4,1,-1,0,'04:00',10,1,-1,0,'03:00'),(149,'Asia/Baku',1984,'RussiaAsia',240,60,4,1,-1,0,'04:00',9,-1,0,0,'06:00'),(150,'Asia/Baku',1985,'RussiaAsia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(151,'Asia/Baku',1991,'RussiaAsia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(152,'Asia/Baku',1992,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(153,'Asia/Baku',1996,'EUAsia',240,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(154,'Asia/Baku',1997,'Azer',240,60,3,-1,0,0,'08:00',10,-1,0,0,'08:00'),(155,'Asia/Bahrain',1970,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(156,'Asia/Bahrain',1972,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(157,'Asia/Dhaka',1970,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(158,'Asia/Dhaka',1971,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(159,'Asia/Thimphu',1970,'',330,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(160,'Asia/Thimphu',1987,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(161,'Indian/Chagos',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(162,'Indian/Chagos',1996,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(163,'Asia/Brunei',1970,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(164,'Asia/Rangoon',1970,'',390,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(165,'Asia/Phnom_Penh',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(166,'Asia/Harbin',1970,'',510,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(167,'Asia/Harbin',1980,'PRC',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(168,'Asia/Harbin',1986,'PRC',480,60,5,4,-1,0,'08:00',9,11,0,0,'07:00'),(169,'Asia/Harbin',1987,'PRC',480,60,4,10,0,0,'08:00',9,11,0,0,'07:00'),(170,'Asia/Harbin',1991,'PRC',480,0,4,10,0,0,'08:00',9,11,0,0,'07:00'),(171,'Asia/Shanghai',1970,'PRC',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(172,'Asia/Shanghai',1986,'PRC',480,60,5,4,-1,0,'08:00',9,11,0,0,'07:00'),(173,'Asia/Shanghai',1987,'PRC',480,60,4,10,0,0,'08:00',9,11,0,0,'07:00'),(174,'Asia/Shanghai',1991,'PRC',480,0,4,10,0,0,'08:00',9,11,0,0,'07:00'),(175,'Asia/Chongqing',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(176,'Asia/Chongqing',1980,'PRC',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(177,'Asia/Chongqing',1986,'PRC',480,60,5,4,-1,0,'08:00',9,11,0,0,'07:00'),(178,'Asia/Chongqing',1987,'PRC',480,60,4,10,0,0,'08:00',9,11,0,0,'07:00'),(179,'Asia/Chongqing',1991,'PRC',480,0,4,10,0,0,'08:00',9,11,0,0,'07:00'),(180,'Asia/Urumqi',1970,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(181,'Asia/Urumqi',1980,'PRC',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(182,'Asia/Urumqi',1986,'PRC',480,60,5,4,-1,0,'08:00',9,11,0,0,'07:00'),(183,'Asia/Urumqi',1987,'PRC',480,60,4,10,0,0,'08:00',9,11,0,0,'07:00'),(184,'Asia/Urumqi',1991,'PRC',480,0,4,10,0,0,'08:00',9,11,0,0,'07:00'),(185,'Asia/Kashgar',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(186,'Asia/Kashgar',1980,'PRC',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(187,'Asia/Kashgar',1986,'PRC',480,60,5,4,-1,0,'08:00',9,11,0,0,'07:00'),(188,'Asia/Kashgar',1987,'PRC',480,60,4,10,0,0,'08:00',9,11,0,0,'07:00'),(189,'Asia/Kashgar',1991,'PRC',480,0,4,10,0,0,'08:00',9,11,0,0,'07:00'),(190,'Asia/Hong_Kong',1970,'HK',480,60,4,16,0,0,'11:30',10,16,0,0,'10:30'),(191,'Asia/Hong_Kong',1979,'HK',480,60,5,8,0,0,'11:30',10,16,0,0,'10:30'),(192,'Asia/Hong_Kong',1980,'HK',480,0,5,8,0,0,'11:30',10,16,0,0,'10:30'),(193,'Asia/Taipei',1970,'Taiwan',480,60,6,1,-1,0,'08:00',10,1,-1,0,'07:00'),(194,'Asia/Taipei',1974,'Taiwan',480,60,4,1,-1,0,'08:00',10,1,-1,0,'07:00'),(195,'Asia/Taipei',1980,'Taiwan',480,60,6,30,-1,0,'08:00',9,30,-1,0,'07:00'),(196,'Asia/Taipei',1981,'Taiwan',480,0,6,30,-1,0,'08:00',9,30,-1,0,'07:00'),(197,'Asia/Macau',1970,'Macau',480,60,4,16,0,0,'11:30',10,16,0,0,'10:30'),(198,'Asia/Macau',1972,'Macau',480,60,4,15,0,0,'08:00',10,15,0,0,'07:00'),(199,'Asia/Macau',1974,'Macau',480,60,4,15,0,0,'08:00',10,15,0,0,'10:30'),(200,'Asia/Macau',1975,'Macau',480,60,4,15,0,0,'11:30',10,15,0,0,'10:30'),(201,'Asia/Macau',1978,'Macau',480,60,4,15,0,0,'08:00',10,15,0,0,'07:00'),(202,'Asia/Macau',1980,'Macau',480,0,4,15,0,0,'08:00',10,15,0,0,'07:00'),(203,'Asia/Macau',1999,'PRC',480,0,4,15,0,0,'08:00',10,15,0,0,'07:00'),(204,'Asia/Nicosia',1970,'Cyprus',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(205,'Asia/Nicosia',1975,'Cyprus',120,60,4,13,-1,0,'02:00',10,12,-1,0,'01:00'),(206,'Asia/Nicosia',1976,'Cyprus',120,60,5,15,-1,0,'02:00',10,11,-1,0,'01:00'),(207,'Asia/Nicosia',1977,'Cyprus',120,60,4,1,0,0,'02:00',9,25,-1,0,'01:00'),(208,'Asia/Nicosia',1978,'Cyprus',120,60,4,1,0,0,'02:00',10,2,-1,0,'01:00'),(209,'Asia/Nicosia',1979,'Cyprus',120,60,4,1,0,0,'02:00',9,-1,0,0,'01:00'),(210,'Asia/Nicosia',1981,'Cyprus',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(211,'Asia/Nicosia',1998,'EUAsia',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(212,'Asia/Tbilisi',1970,'RussiaAsia',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(213,'Asia/Tbilisi',1981,'RussiaAsia',240,60,4,1,-1,0,'04:00',10,1,-1,0,'03:00'),(214,'Asia/Tbilisi',1984,'RussiaAsia',240,60,4,1,-1,0,'04:00',9,-1,0,0,'06:00'),(215,'Asia/Tbilisi',1985,'RussiaAsia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(216,'Asia/Tbilisi',1991,'RussiaAsia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(217,'Asia/Tbilisi',1992,'E-EurAsia',180,60,3,-1,0,0,'03:00',9,-1,0,0,'02:00'),(218,'Asia/Tbilisi',1994,'E-EurAsia',240,60,3,-1,0,0,'04:00',9,-1,0,0,'03:00'),(219,'Asia/Tbilisi',1995,'E-EurAsia',240,0,12,31,-1,0,'16:00',9,-1,0,0,'03:00'),(220,'Asia/Tbilisi',1996,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(221,'Asia/Tbilisi',1997,'E-EurAsia',240,60,3,-1,0,0,'04:00',10,-1,0,0,'03:00'),(222,'Asia/Tbilisi',2004,'RussiaAsia',180,60,3,-1,0,0,'05:00',10,-1,0,0,'05:00'),(223,'Asia/Tbilisi',2005,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(224,'Asia/Dili',1970,'',540,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(225,'Asia/Dili',1976,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(226,'Asia/Dili',2000,'',540,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(227,'Asia/Calcutta',1970,'',330,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(228,'Asia/Jakarta',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(229,'Asia/Pontianak',1970,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(230,'Asia/Pontianak',1988,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(231,'Asia/Makassar',1970,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(232,'Asia/Jayapura',1970,'',540,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(233,'Asia/Tehran',1970,'',210,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(234,'Asia/Tehran',1977,'Iran',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(235,'Asia/Tehran',1978,'Iran',240,60,3,21,-1,0,'04:00',10,21,-1,0,'03:00'),(236,'Asia/Tehran',1979,'Iran',210,60,3,21,-1,0,'03:30',9,19,-1,0,'02:30'),(237,'Asia/Tehran',1980,'Iran',210,60,3,21,-1,0,'03:30',9,23,-1,0,'02:30'),(238,'Asia/Tehran',1991,'Iran',210,60,5,3,-1,0,'03:30',9,22,-1,0,'02:30'),(239,'Asia/Tehran',1992,'Iran',210,60,3,22,-1,0,'03:30',9,22,-1,0,'02:30'),(240,'Asia/Tehran',1996,'Iran',210,60,3,21,-1,0,'03:30',9,21,-1,0,'02:30'),(241,'Asia/Tehran',1997,'Iran',210,60,3,22,-1,0,'03:30',9,22,-1,0,'02:30'),(242,'Asia/Tehran',2000,'Iran',210,60,3,21,-1,0,'03:30',9,21,-1,0,'02:30'),(243,'Asia/Tehran',2001,'Iran',210,60,3,22,-1,0,'03:30',9,22,-1,0,'02:30'),(244,'Asia/Tehran',2004,'Iran',210,60,3,21,-1,0,'03:30',9,21,-1,0,'02:30'),(245,'Asia/Tehran',2005,'Iran',210,60,3,22,-1,0,'03:30',9,22,-1,0,'02:30'),(246,'Asia/Tehran',2008,'Iran',210,60,3,21,-1,0,'03:30',9,21,-1,0,'02:30'),(247,'Asia/Tehran',2009,'Iran',210,60,3,22,-1,0,'03:30',9,22,-1,0,'02:30'),(248,'Asia/Tehran',2012,'Iran',210,60,3,21,-1,0,'03:30',9,21,-1,0,'02:30'),(249,'Asia/Tehran',2013,'Iran',210,60,3,22,-1,0,'03:30',9,22,-1,0,'02:30'),(250,'Asia/Tehran',2016,'Iran',210,60,3,21,-1,0,'03:30',9,21,-1,0,'02:30'),(251,'Asia/Baghdad',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(252,'Asia/Baghdad',1982,'Iraq',180,60,5,1,-1,0,'03:00',10,1,-1,0,'02:00'),(253,'Asia/Baghdad',1983,'Iraq',180,60,3,31,-1,0,'03:00',10,1,-1,0,'02:00'),(254,'Asia/Baghdad',1984,'Iraq',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(255,'Asia/Baghdad',1985,'Iraq',180,60,4,1,-1,0,'03:00',9,-1,0,0,'04:00'),(256,'Asia/Baghdad',1986,'Iraq',180,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(257,'Asia/Baghdad',1991,'Iraq',180,60,4,1,-1,0,'06:00',10,1,-1,0,'06:00'),(258,'Asia/Jerusalem',1970,'Zion',120,60,4,29,-1,0,'04:00',9,22,-1,0,'01:00'),(259,'Asia/Jerusalem',1974,'Zion',120,60,7,7,-1,0,'02:00',10,13,-1,0,'01:00'),(260,'Asia/Jerusalem',1975,'Zion',120,60,4,20,-1,0,'02:00',8,31,-1,0,'01:00'),(261,'Asia/Jerusalem',1985,'Zion',120,60,4,14,-1,0,'02:00',9,15,-1,0,'01:00'),(262,'Asia/Jerusalem',1986,'Zion',120,60,5,18,-1,0,'02:00',9,7,-1,0,'01:00'),(263,'Asia/Jerusalem',1987,'Zion',120,60,4,15,-1,0,'02:00',9,13,-1,0,'01:00'),(264,'Asia/Jerusalem',1988,'Zion',120,60,4,9,-1,0,'02:00',9,3,-1,0,'01:00'),(265,'Asia/Jerusalem',1989,'Zion',120,60,4,30,-1,0,'02:00',9,3,-1,0,'01:00'),(266,'Asia/Jerusalem',1990,'Zion',120,60,3,25,-1,0,'02:00',8,26,-1,0,'01:00'),(267,'Asia/Jerusalem',1991,'Zion',120,60,3,24,-1,0,'02:00',9,1,-1,0,'01:00'),(268,'Asia/Jerusalem',1992,'Zion',120,60,3,29,-1,0,'02:00',9,6,-1,0,'01:00'),(269,'Asia/Jerusalem',1993,'Zion',120,60,4,2,-1,0,'02:00',9,5,-1,0,'01:00'),(270,'Asia/Jerusalem',1994,'Zion',120,60,4,1,-1,0,'02:00',8,28,-1,0,'01:00'),(271,'Asia/Jerusalem',1995,'Zion',120,60,3,31,-1,0,'02:00',9,3,-1,0,'01:00'),(272,'Asia/Jerusalem',1996,'Zion',120,60,3,15,-1,0,'02:00',9,16,-1,0,'01:00'),(273,'Asia/Jerusalem',1997,'Zion',120,60,3,21,-1,0,'02:00',9,14,-1,0,'01:00'),(274,'Asia/Jerusalem',1998,'Zion',120,60,3,20,-1,0,'02:00',9,6,-1,0,'01:00'),(275,'Asia/Jerusalem',1999,'Zion',120,60,4,2,-1,0,'04:00',9,3,-1,0,'03:00'),(276,'Asia/Jerusalem',2000,'Zion',120,60,4,14,-1,0,'04:00',10,6,-1,0,'02:00'),(277,'Asia/Jerusalem',2001,'Zion',120,60,4,9,-1,0,'03:00',9,24,-1,0,'02:00'),(278,'Asia/Jerusalem',2002,'Zion',120,60,3,29,-1,0,'03:00',10,7,-1,0,'02:00'),(279,'Asia/Jerusalem',2003,'Zion',120,60,3,28,-1,0,'03:00',10,3,-1,0,'02:00'),(280,'Asia/Jerusalem',2004,'Zion',120,60,4,7,-1,0,'03:00',9,22,-1,0,'02:00'),(281,'Asia/Jerusalem',2005,'Zion',120,60,4,1,-1,0,'04:00',10,9,-1,0,'03:00'),(282,'Asia/Jerusalem',2006,'Zion',120,60,3,26,5,0,'04:00',10,1,-1,0,'03:00'),(283,'Asia/Jerusalem',2007,'Zion',120,60,3,26,5,0,'04:00',9,16,-1,0,'03:00'),(284,'Asia/Jerusalem',2008,'Zion',120,60,3,26,5,0,'04:00',10,5,-1,0,'03:00'),(285,'Asia/Jerusalem',2009,'Zion',120,60,3,26,5,0,'04:00',9,27,-1,0,'03:00'),(286,'Asia/Jerusalem',2010,'Zion',120,60,3,26,5,0,'04:00',9,12,-1,0,'03:00'),(287,'Asia/Jerusalem',2011,'Zion',120,60,4,1,-1,0,'04:00',10,2,-1,0,'03:00'),(288,'Asia/Jerusalem',2012,'Zion',120,60,3,26,5,0,'04:00',9,23,-1,0,'03:00'),(289,'Asia/Jerusalem',2013,'Zion',120,60,3,26,5,0,'04:00',9,8,-1,0,'03:00'),(290,'Asia/Jerusalem',2014,'Zion',120,60,3,26,5,0,'04:00',9,28,-1,0,'03:00'),(291,'Asia/Jerusalem',2015,'Zion',120,60,3,26,5,0,'04:00',9,20,-1,0,'03:00'),(292,'Asia/Jerusalem',2016,'Zion',120,60,4,1,-1,0,'04:00',10,9,-1,0,'03:00'),(293,'Asia/Tokyo',1970,'Japan',540,0,5,1,0,0,'11:00',9,8,6,0,'10:00'),(294,'Asia/Amman',1970,'Jordan',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(295,'Asia/Amman',1973,'Jordan',120,60,6,6,-1,0,'02:00',10,1,-1,0,'01:00'),(296,'Asia/Amman',1974,'Jordan',120,60,5,1,-1,0,'02:00',10,1,-1,0,'01:00'),(297,'Asia/Amman',1976,'Jordan',120,60,5,1,-1,0,'02:00',11,1,-1,0,'01:00'),(298,'Asia/Amman',1977,'Jordan',120,60,5,1,-1,0,'02:00',10,1,-1,0,'01:00'),(299,'Asia/Amman',1978,'Jordan',120,60,4,30,-1,0,'02:00',9,30,-1,0,'01:00'),(300,'Asia/Amman',1985,'Jordan',120,60,4,1,-1,0,'02:00',10,1,-1,0,'01:00'),(301,'Asia/Amman',1986,'Jordan',120,60,4,1,5,0,'02:00',10,1,5,0,'01:00'),(302,'Asia/Amman',1989,'Jordan',120,60,5,8,-1,0,'02:00',10,1,5,0,'01:00'),(303,'Asia/Amman',1990,'Jordan',120,60,4,27,-1,0,'02:00',10,1,5,0,'01:00'),(304,'Asia/Amman',1991,'Jordan',120,60,4,17,-1,0,'02:00',9,27,-1,0,'01:00'),(305,'Asia/Amman',1992,'Jordan',120,60,4,10,-1,0,'02:00',10,1,5,0,'01:00'),(306,'Asia/Amman',1993,'Jordan',120,60,4,1,5,0,'02:00',10,1,5,0,'01:00'),(307,'Asia/Amman',1994,'Jordan',120,60,4,1,5,0,'02:00',9,15,5,0,'01:00'),(308,'Asia/Amman',1995,'Jordan',120,60,4,1,5,0,'02:00',9,15,5,0,'02:00'),(309,'Asia/Amman',1999,'Jordan',120,60,7,1,-1,0,'02:00',9,-1,4,0,'02:00'),(310,'Asia/Amman',2000,'Jordan',120,60,3,-1,4,0,'02:00',9,-1,4,0,'02:00'),(311,'Asia/Amman',2003,'Jordan',120,60,3,-1,4,0,'02:00',10,24,-1,0,'02:00'),(312,'Asia/Amman',2004,'Jordan',120,60,3,-1,4,0,'02:00',10,15,-1,0,'02:00'),(313,'Asia/Amman',2005,'Jordan',120,60,3,-1,4,0,'02:00',9,-1,5,0,'02:00'),(314,'Asia/Amman',2006,'Jordan',120,60,3,-1,4,0,'02:00',10,-1,5,0,'02:00'),(315,'Asia/Almaty',1970,'RussiaAsia',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(316,'Asia/Almaty',1981,'RussiaAsia',360,60,4,1,-1,0,'06:00',10,1,-1,0,'05:00'),(317,'Asia/Almaty',1984,'RussiaAsia',360,60,4,1,-1,0,'06:00',9,-1,0,0,'08:00'),(318,'Asia/Almaty',1985,'RussiaAsia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(319,'Asia/Almaty',1991,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(320,'Asia/Almaty',1992,'RussiaAsia',360,60,3,-1,6,0,'29:00',9,-1,6,0,'28:00'),(321,'Asia/Almaty',1993,'RussiaAsia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(322,'Asia/Almaty',1996,'RussiaAsia',360,60,3,-1,0,0,'08:00',10,-1,0,0,'08:00'),(323,'Asia/Almaty',2005,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(324,'Asia/Qyzylorda',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(325,'Asia/Qyzylorda',1981,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(326,'Asia/Qyzylorda',1982,'RussiaAsia',300,60,4,1,-1,0,'05:00',10,1,-1,0,'04:00'),(327,'Asia/Qyzylorda',1984,'RussiaAsia',300,60,4,1,-1,0,'05:00',9,-1,0,0,'07:00'),(328,'Asia/Qyzylorda',1985,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(329,'Asia/Qyzylorda',1991,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(330,'Asia/Qyzylorda',1992,'RussiaAsia',360,60,3,-1,6,0,'29:00',9,-1,6,0,'28:00'),(331,'Asia/Qyzylorda',1993,'RussiaAsia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(332,'Asia/Qyzylorda',1996,'RussiaAsia',360,60,3,-1,0,0,'08:00',10,-1,0,0,'08:00'),(333,'Asia/Qyzylorda',2005,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(334,'Asia/Aqtobe',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(335,'Asia/Aqtobe',1981,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(336,'Asia/Aqtobe',1982,'RussiaAsia',300,60,4,1,-1,0,'05:00',10,1,-1,0,'04:00'),(337,'Asia/Aqtobe',1984,'RussiaAsia',300,60,4,1,-1,0,'05:00',9,-1,0,0,'07:00'),(338,'Asia/Aqtobe',1985,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(339,'Asia/Aqtobe',1992,'RussiaAsia',300,60,3,-1,6,0,'28:00',9,-1,6,0,'27:00'),(340,'Asia/Aqtobe',1993,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(341,'Asia/Aqtobe',1996,'RussiaAsia',300,60,3,-1,0,0,'07:00',10,-1,0,0,'07:00'),(342,'Asia/Aqtobe',2005,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(343,'Asia/Aqtau',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(344,'Asia/Aqtau',1981,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(345,'Asia/Aqtau',1982,'RussiaAsia',300,60,4,1,-1,0,'05:00',10,1,-1,0,'04:00'),(346,'Asia/Aqtau',1984,'RussiaAsia',300,60,4,1,-1,0,'05:00',9,-1,0,0,'07:00'),(347,'Asia/Aqtau',1985,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(348,'Asia/Aqtau',1992,'RussiaAsia',300,60,3,-1,6,0,'28:00',9,-1,6,0,'27:00'),(349,'Asia/Aqtau',1993,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(350,'Asia/Aqtau',1995,'RussiaAsia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(351,'Asia/Aqtau',1996,'RussiaAsia',240,60,3,-1,0,0,'06:00',10,-1,0,0,'06:00'),(352,'Asia/Aqtau',2005,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(353,'Asia/Oral',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(354,'Asia/Oral',1981,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(355,'Asia/Oral',1982,'RussiaAsia',300,60,4,1,-1,0,'05:00',10,1,-1,0,'04:00'),(356,'Asia/Oral',1984,'RussiaAsia',300,60,4,1,-1,0,'05:00',9,-1,0,0,'07:00'),(357,'Asia/Oral',1985,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(358,'Asia/Oral',1989,'RussiaAsia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(359,'Asia/Oral',1992,'RussiaAsia',240,60,3,-1,6,0,'27:00',9,-1,6,0,'26:00'),(360,'Asia/Oral',1993,'RussiaAsia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(361,'Asia/Oral',1996,'RussiaAsia',240,60,3,-1,0,0,'06:00',10,-1,0,0,'06:00'),(362,'Asia/Oral',2005,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(363,'Asia/Bishkek',1970,'RussiaAsia',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(364,'Asia/Bishkek',1981,'RussiaAsia',360,60,4,1,-1,0,'06:00',10,1,-1,0,'05:00'),(365,'Asia/Bishkek',1984,'RussiaAsia',360,60,4,1,-1,0,'06:00',9,-1,0,0,'08:00'),(366,'Asia/Bishkek',1985,'RussiaAsia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(367,'Asia/Bishkek',1991,'Kyrgyz',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(368,'Asia/Bishkek',1992,'Kyrgyz',300,60,4,7,0,0,'05:00',9,-1,0,0,'04:00'),(369,'Asia/Bishkek',1997,'Kyrgyz',300,60,3,-1,0,0,'07:30',10,-1,0,0,'06:30'),(370,'Asia/Bishkek',2005,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(371,'Asia/Seoul',1970,'ROK',540,60,5,15,-1,0,'09:00',9,13,-1,0,'08:00'),(372,'Asia/Seoul',1987,'ROK',540,60,5,8,0,0,'09:00',10,8,0,0,'08:00'),(373,'Asia/Seoul',1988,'ROK',540,0,5,8,0,0,'09:00',10,8,0,0,'08:00'),(374,'Asia/Pyongyang',1970,'',540,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(375,'Asia/Kuwait',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(376,'Asia/Vientiane',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(377,'Asia/Beirut',1970,'Lebanon',120,60,5,1,-1,0,'02:00',10,1,-1,0,'01:00'),(378,'Asia/Beirut',1972,'Lebanon',120,60,6,22,-1,0,'02:00',10,1,-1,0,'01:00'),(379,'Asia/Beirut',1973,'Lebanon',120,60,5,1,-1,0,'02:00',10,1,-1,0,'01:00'),(380,'Asia/Beirut',1978,'Lebanon',120,60,4,30,-1,0,'02:00',9,30,-1,0,'01:00'),(381,'Asia/Beirut',1984,'Lebanon',120,60,5,1,-1,0,'02:00',10,16,-1,0,'01:00'),(382,'Asia/Beirut',1988,'Lebanon',120,60,6,1,-1,0,'02:00',10,16,-1,0,'01:00'),(383,'Asia/Beirut',1989,'Lebanon',120,60,5,10,-1,0,'02:00',10,16,-1,0,'01:00'),(384,'Asia/Beirut',1990,'Lebanon',120,60,5,1,-1,0,'02:00',10,16,-1,0,'01:00'),(385,'Asia/Beirut',1992,'Lebanon',120,60,5,1,-1,0,'02:00',10,4,-1,0,'01:00'),(386,'Asia/Beirut',1993,'Lebanon',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(387,'Asia/Beirut',1999,'Lebanon',120,60,3,-1,0,0,'02:00',10,-1,0,0,'01:00'),(388,'Asia/Kuala_Lumpur',1970,'',450,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(389,'Asia/Kuala_Lumpur',1982,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(390,'Asia/Kuching',1970,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(391,'Asia/Kuching',1982,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(392,'Indian/Maldives',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(393,'Asia/Hovd',1970,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(394,'Asia/Hovd',1978,'Mongol',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(395,'Asia/Hovd',1983,'Mongol',420,60,4,1,-1,0,'07:00',10,1,-1,0,'06:00'),(396,'Asia/Hovd',1984,'Mongol',420,60,4,1,-1,0,'07:00',9,-1,0,0,'06:00'),(397,'Asia/Hovd',1985,'Mongol',420,60,3,-1,0,0,'07:00',9,-1,0,0,'06:00'),(398,'Asia/Hovd',2001,'Mongol',420,60,4,-1,6,0,'09:00',9,-1,6,0,'08:00'),(399,'Asia/Hovd',2002,'Mongol',420,60,3,-1,6,0,'09:00',9,-1,6,0,'08:00'),(400,'Asia/Hovd',2006,'Mongol',420,0,3,-1,6,0,'09:00',9,-1,6,0,'08:00'),(401,'Asia/Ulaanbaatar',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(402,'Asia/Ulaanbaatar',1978,'Mongol',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(403,'Asia/Ulaanbaatar',1983,'Mongol',480,60,4,1,-1,0,'08:00',10,1,-1,0,'07:00'),(404,'Asia/Ulaanbaatar',1984,'Mongol',480,60,4,1,-1,0,'08:00',9,-1,0,0,'07:00'),(405,'Asia/Ulaanbaatar',1985,'Mongol',480,60,3,-1,0,0,'08:00',9,-1,0,0,'07:00'),(406,'Asia/Ulaanbaatar',2001,'Mongol',480,60,4,-1,6,0,'10:00',9,-1,6,0,'09:00'),(407,'Asia/Ulaanbaatar',2002,'Mongol',480,60,3,-1,6,0,'10:00',9,-1,6,0,'09:00'),(408,'Asia/Ulaanbaatar',2006,'Mongol',480,0,3,-1,6,0,'10:00',9,-1,6,0,'09:00'),(409,'Asia/Choibalsan',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(410,'Asia/Choibalsan',1978,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(411,'Asia/Choibalsan',1983,'Mongol',540,60,4,1,-1,0,'09:00',10,1,-1,0,'08:00'),(412,'Asia/Choibalsan',1984,'Mongol',540,60,4,1,-1,0,'09:00',9,-1,0,0,'08:00'),(413,'Asia/Choibalsan',1985,'Mongol',540,60,3,-1,0,0,'09:00',9,-1,0,0,'08:00'),(414,'Asia/Choibalsan',2001,'Mongol',540,60,4,-1,6,0,'11:00',9,-1,6,0,'10:00'),(415,'Asia/Choibalsan',2002,'Mongol',540,60,3,-1,6,0,'11:00',9,-1,6,0,'10:00'),(416,'Asia/Choibalsan',2006,'Mongol',540,0,3,-1,6,0,'11:00',9,-1,6,0,'10:00'),(417,'Asia/Katmandu',1970,'',330,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(418,'Asia/Katmandu',1986,'',345,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(419,'Asia/Muscat',1970,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(420,'Asia/Karachi',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(421,'Asia/Karachi',1971,'Pakistan',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(422,'Asia/Karachi',2002,'Pakistan',300,60,4,2,0,0,'05:01',10,2,0,0,'04:01'),(423,'Asia/Karachi',2003,'Pakistan',300,0,4,2,0,0,'05:01',10,2,0,0,'04:01'),(424,'Asia/Gaza',1970,'Zion',120,60,4,29,-1,0,'04:00',9,22,-1,0,'01:00'),(425,'Asia/Gaza',1974,'Zion',120,60,7,7,-1,0,'02:00',10,13,-1,0,'01:00'),(426,'Asia/Gaza',1975,'Zion',120,60,4,20,-1,0,'02:00',8,31,-1,0,'01:00'),(427,'Asia/Gaza',1985,'Zion',120,60,4,14,-1,0,'02:00',9,15,-1,0,'01:00'),(428,'Asia/Gaza',1986,'Zion',120,60,5,18,-1,0,'02:00',9,7,-1,0,'01:00'),(429,'Asia/Gaza',1987,'Zion',120,60,4,15,-1,0,'02:00',9,13,-1,0,'01:00'),(430,'Asia/Gaza',1988,'Zion',120,60,4,9,-1,0,'02:00',9,3,-1,0,'01:00'),(431,'Asia/Gaza',1989,'Zion',120,60,4,30,-1,0,'02:00',9,3,-1,0,'01:00'),(432,'Asia/Gaza',1990,'Zion',120,60,3,25,-1,0,'02:00',8,26,-1,0,'01:00'),(433,'Asia/Gaza',1991,'Zion',120,60,3,24,-1,0,'02:00',9,1,-1,0,'01:00'),(434,'Asia/Gaza',1992,'Zion',120,60,3,29,-1,0,'02:00',9,6,-1,0,'01:00'),(435,'Asia/Gaza',1993,'Zion',120,60,4,2,-1,0,'02:00',9,5,-1,0,'01:00'),(436,'Asia/Gaza',1994,'Zion',120,60,4,1,-1,0,'02:00',8,28,-1,0,'01:00'),(437,'Asia/Gaza',1995,'Zion',120,60,3,31,-1,0,'02:00',9,3,-1,0,'01:00'),(438,'Asia/Gaza',1996,'Jordan',120,60,4,1,5,0,'02:00',9,15,5,0,'02:00'),(439,'Asia/Gaza',1999,'Palestine',120,60,4,15,5,0,'02:00',10,15,5,0,'01:00'),(440,'Asia/Gaza',2004,'Palestine',120,60,4,15,5,0,'02:00',10,1,-1,0,'02:00'),(441,'Asia/Gaza',2005,'Palestine',120,60,4,15,5,0,'02:00',10,4,-1,0,'03:00'),(442,'Asia/Gaza',2006,'Palestine',120,60,4,1,-1,0,'02:00',9,22,-1,0,'01:00'),(443,'Asia/Gaza',2007,'Palestine',120,60,4,1,-1,0,'02:00',9,8,4,0,'03:00'),(444,'Asia/Manila',1970,'Phil',480,60,4,12,-1,0,'08:00',7,1,-1,0,'07:00'),(445,'Asia/Manila',1978,'Phil',480,60,3,22,-1,0,'08:00',9,21,-1,0,'07:00'),(446,'Asia/Manila',1979,'Phil',480,0,3,22,-1,0,'08:00',9,21,-1,0,'07:00'),(447,'Asia/Qatar',1970,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(448,'Asia/Qatar',1972,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(449,'Asia/Riyadh',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(450,'Asia/Singapore',1970,'',450,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(451,'Asia/Singapore',1982,'',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(452,'Asia/Colombo',1970,'',330,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(453,'Asia/Colombo',1996,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(454,'Asia/Colombo',2006,'',330,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(455,'Asia/Damascus',1970,'Syria',120,60,5,1,-1,0,'04:00',10,1,-1,0,'03:00'),(456,'Asia/Damascus',1977,'Syria',120,60,5,1,-1,0,'04:00',9,1,-1,0,'03:00'),(457,'Asia/Damascus',1983,'Syria',120,60,4,9,-1,0,'04:00',10,1,-1,0,'03:00'),(458,'Asia/Damascus',1986,'Syria',120,60,2,16,-1,0,'04:00',10,9,-1,0,'03:00'),(459,'Asia/Damascus',1987,'Syria',120,60,3,1,-1,0,'04:00',10,31,-1,0,'03:00'),(460,'Asia/Damascus',1988,'Syria',120,60,3,15,-1,0,'04:00',10,31,-1,0,'03:00'),(461,'Asia/Damascus',1989,'Syria',120,60,3,31,-1,0,'04:00',10,1,-1,0,'03:00'),(462,'Asia/Damascus',1990,'Syria',120,60,4,1,-1,0,'04:00',9,30,-1,0,'03:00'),(463,'Asia/Damascus',1991,'Syria',120,60,4,1,-1,0,'02:00',10,1,-1,0,'01:00'),(464,'Asia/Damascus',1992,'Syria',120,60,4,8,-1,0,'02:00',10,1,-1,0,'01:00'),(465,'Asia/Damascus',1993,'Syria',120,60,3,26,-1,0,'02:00',9,25,-1,0,'01:00'),(466,'Asia/Damascus',1994,'Syria',120,60,4,1,-1,0,'02:00',10,1,-1,0,'01:00'),(467,'Asia/Damascus',1997,'Syria',120,60,3,-1,1,0,'02:00',10,1,-1,0,'01:00'),(468,'Asia/Damascus',1999,'Syria',120,60,4,1,-1,0,'02:00',10,1,-1,0,'01:00'),(469,'Asia/Damascus',2006,'Syria',120,60,4,1,-1,0,'02:00',9,22,-1,0,'01:00'),(470,'Asia/Damascus',2007,'Syria',120,60,3,-1,5,0,'02:00',11,1,5,0,'01:00'),(471,'Asia/Dushanbe',1970,'RussiaAsia',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(472,'Asia/Dushanbe',1981,'RussiaAsia',360,60,4,1,-1,0,'06:00',10,1,-1,0,'05:00'),(473,'Asia/Dushanbe',1984,'RussiaAsia',360,60,4,1,-1,0,'06:00',9,-1,0,0,'08:00'),(474,'Asia/Dushanbe',1985,'RussiaAsia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(475,'Asia/Dushanbe',1991,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(476,'Asia/Bangkok',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(477,'Asia/Ashgabat',1970,'RussiaAsia',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(478,'Asia/Ashgabat',1981,'RussiaAsia',300,60,4,1,-1,0,'05:00',10,1,-1,0,'04:00'),(479,'Asia/Ashgabat',1984,'RussiaAsia',300,60,4,1,-1,0,'05:00',9,-1,0,0,'07:00'),(480,'Asia/Ashgabat',1985,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(481,'Asia/Ashgabat',1991,'RussiaAsia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(482,'Asia/Ashgabat',1992,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(483,'Asia/Dubai',1970,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(484,'Asia/Samarkand',1970,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(485,'Asia/Samarkand',1981,'',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(486,'Asia/Samarkand',1982,'RussiaAsia',300,60,4,1,-1,0,'05:00',10,1,-1,0,'04:00'),(487,'Asia/Samarkand',1984,'RussiaAsia',300,60,4,1,-1,0,'05:00',9,-1,0,0,'07:00'),(488,'Asia/Samarkand',1985,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(489,'Asia/Samarkand',1992,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(490,'Asia/Tashkent',1970,'RussiaAsia',360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(491,'Asia/Tashkent',1981,'RussiaAsia',360,60,4,1,-1,0,'06:00',10,1,-1,0,'05:00'),(492,'Asia/Tashkent',1984,'RussiaAsia',360,60,4,1,-1,0,'06:00',9,-1,0,0,'08:00'),(493,'Asia/Tashkent',1985,'RussiaAsia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(494,'Asia/Tashkent',1991,'RussiaAsia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(495,'Asia/Tashkent',1992,'',300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(496,'Asia/Saigon',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(497,'Asia/Aden',1970,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(498,'Australia/Darwin',1970,'Aus',570,0,12,31,-1,0,'21:30',3,-1,0,0,'10:30'),(499,'Australia/Perth',1970,'AW',480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(500,'Australia/Perth',1974,'AW',480,60,10,-1,0,0,'10:00',1,1,-1,0,'19:00'),(501,'Australia/Perth',1975,'AW',480,0,12,31,-1,0,'20:00',3,1,0,0,'10:00'),(502,'Australia/Perth',1983,'AW',480,60,10,-1,0,0,'10:00',1,1,-1,0,'19:00'),(503,'Australia/Perth',1984,'AW',480,0,12,31,-1,0,'20:00',3,1,0,0,'10:00'),(504,'Australia/Perth',1991,'AW',480,60,11,17,-1,0,'10:00',1,1,-1,0,'19:00'),(505,'Australia/Perth',1992,'AW',480,0,12,31,-1,0,'20:00',3,1,0,0,'10:00'),(506,'Australia/Perth',2006,'AW',480,60,12,3,-1,0,'10:00',1,1,-1,0,'19:00'),(507,'Australia/Perth',2007,'AW',480,60,10,-1,0,0,'10:00',3,-1,0,0,'10:00'),(508,'Australia/Perth',2009,'AW',480,0,12,31,-1,0,'20:00',3,-1,0,0,'10:00'),(509,'Australia/Eucla',1970,'AW',525,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(510,'Australia/Eucla',1974,'AW',525,60,10,-1,0,0,'10:45',1,1,-1,0,'19:45'),(511,'Australia/Eucla',1975,'AW',525,0,12,31,-1,0,'20:45',3,1,0,0,'10:45'),(512,'Australia/Eucla',1983,'AW',525,60,10,-1,0,0,'10:45',1,1,-1,0,'19:45'),(513,'Australia/Eucla',1984,'AW',525,0,12,31,-1,0,'20:45',3,1,0,0,'10:45'),(514,'Australia/Eucla',1991,'AW',525,60,11,17,-1,0,'10:45',1,1,-1,0,'19:45'),(515,'Australia/Eucla',1992,'AW',525,0,12,31,-1,0,'20:45',3,1,0,0,'10:45'),(516,'Australia/Eucla',2006,'AW',525,60,12,3,-1,0,'10:45',1,1,-1,0,'19:45'),(517,'Australia/Eucla',2007,'AW',525,60,10,-1,0,0,'10:45',3,-1,0,0,'10:45'),(518,'Australia/Eucla',2009,'AW',525,0,12,31,-1,0,'20:45',3,-1,0,0,'10:45'),(519,'Australia/Brisbane',1970,'Aus',600,0,12,31,-1,0,'22:00',3,-1,0,0,'11:00'),(520,'Australia/Brisbane',1971,'AQ',600,60,10,-1,0,0,'12:00',1,1,-1,0,'21:00'),(521,'Australia/Brisbane',1972,'AQ',600,0,12,31,-1,0,'22:00',2,-1,0,0,'12:00'),(522,'Australia/Brisbane',1989,'AQ',600,60,10,-1,0,0,'12:00',1,1,-1,0,'21:00'),(523,'Australia/Brisbane',1990,'AQ',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(524,'Australia/Brisbane',1992,'AQ',600,0,12,31,-1,0,'22:00',3,1,0,0,'12:00'),(525,'Australia/Lindeman',1970,'Aus',600,0,12,31,-1,0,'22:00',3,-1,0,0,'11:00'),(526,'Australia/Lindeman',1971,'AQ',600,60,10,-1,0,0,'12:00',1,1,-1,0,'21:00'),(527,'Australia/Lindeman',1972,'AQ',600,0,12,31,-1,0,'22:00',2,-1,0,0,'12:00'),(528,'Australia/Lindeman',1989,'AQ',600,60,10,-1,0,0,'12:00',1,1,-1,0,'21:00'),(529,'Australia/Lindeman',1990,'AQ',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(530,'Australia/Lindeman',1992,'Holiday',600,60,10,-1,0,0,'12:00',1,1,-1,0,'21:00'),(531,'Australia/Lindeman',1993,'Holiday',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(532,'Australia/Lindeman',1994,'Holiday',600,0,12,31,-1,0,'22:00',3,1,0,0,'12:00'),(533,'Australia/Adelaide',1970,'Aus',570,0,12,31,-1,0,'21:30',3,-1,0,0,'10:30'),(534,'Australia/Adelaide',1971,'AS',570,60,10,-1,0,0,'11:30',1,1,-1,0,'20:30'),(535,'Australia/Adelaide',1972,'AS',570,60,10,-1,0,0,'11:30',2,27,-1,0,'11:30'),(536,'Australia/Adelaide',1973,'AS',570,60,10,-1,0,0,'11:30',3,1,0,0,'11:30'),(537,'Australia/Adelaide',1986,'AS',570,60,10,19,-1,0,'11:30',3,15,0,0,'11:30'),(538,'Australia/Adelaide',1987,'AS',570,60,10,-1,0,0,'11:30',3,15,0,0,'11:30'),(539,'Australia/Adelaide',1990,'AS',570,60,10,-1,0,0,'11:30',3,18,0,0,'11:30'),(540,'Australia/Adelaide',1991,'AS',570,60,10,-1,0,0,'11:30',3,1,0,0,'11:30'),(541,'Australia/Adelaide',1992,'AS',570,60,10,-1,0,0,'11:30',3,18,0,0,'11:30'),(542,'Australia/Adelaide',1993,'AS',570,60,10,-1,0,0,'11:30',3,1,0,0,'11:30'),(543,'Australia/Adelaide',1994,'AS',570,60,10,-1,0,0,'11:30',3,18,0,0,'11:30'),(544,'Australia/Adelaide',1995,'AS',570,60,10,-1,0,0,'11:30',3,-1,0,0,'11:30'),(545,'Australia/Adelaide',2006,'AS',570,60,10,-1,0,0,'11:30',4,1,0,0,'11:30'),(546,'Australia/Adelaide',2007,'AS',570,60,10,-1,0,0,'11:30',3,-1,0,0,'11:30'),(547,'Australia/Adelaide',2008,'AS',570,0,10,-1,0,0,'11:30',3,-1,0,0,'11:30'),(548,'Australia/Hobart',1970,'AT',600,60,10,-1,0,0,'12:00',3,8,0,0,'12:00'),(549,'Australia/Hobart',1972,'AT',600,60,10,-1,0,0,'12:00',2,-1,0,0,'12:00'),(550,'Australia/Hobart',1973,'AT',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(551,'Australia/Hobart',1982,'AT',600,60,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(552,'Australia/Hobart',1984,'AT',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(553,'Australia/Hobart',1986,'AT',600,60,10,15,0,0,'12:00',3,1,0,0,'12:00'),(554,'Australia/Hobart',1987,'AT',600,60,10,22,0,0,'12:00',3,15,0,0,'12:00'),(555,'Australia/Hobart',1988,'AT',600,60,10,-1,0,0,'12:00',3,15,0,0,'12:00'),(556,'Australia/Hobart',1991,'AT',600,60,10,1,0,0,'12:00',3,-1,0,0,'12:00'),(557,'Australia/Hobart',2000,'AT',600,60,8,-1,0,0,'12:00',3,-1,0,0,'12:00'),(558,'Australia/Hobart',2001,'AT',600,60,10,1,0,0,'12:00',3,-1,0,0,'12:00'),(559,'Australia/Hobart',2006,'AT',600,60,10,1,0,0,'12:00',4,1,0,0,'12:00'),(560,'Australia/Hobart',2007,'AT',600,60,10,1,0,0,'12:00',3,-1,0,0,'12:00'),(561,'Australia/Hobart',2008,'AT',600,0,10,1,0,0,'12:00',3,-1,0,0,'12:00'),(562,'Australia/Currie',1970,'Aus',600,0,12,31,-1,0,'22:00',3,-1,0,0,'11:00'),(563,'Australia/Currie',1971,'AT',600,60,10,-1,0,0,'12:00',3,8,0,0,'12:00'),(564,'Australia/Currie',1972,'AT',600,60,10,-1,0,0,'12:00',2,-1,0,0,'12:00'),(565,'Australia/Currie',1973,'AT',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(566,'Australia/Currie',1982,'AT',600,60,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(567,'Australia/Currie',1984,'AT',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(568,'Australia/Currie',1986,'AT',600,60,10,15,0,0,'12:00',3,1,0,0,'12:00'),(569,'Australia/Currie',1987,'AT',600,60,10,22,0,0,'12:00',3,15,0,0,'12:00'),(570,'Australia/Currie',1988,'AT',600,60,10,-1,0,0,'12:00',3,15,0,0,'12:00'),(571,'Australia/Currie',1991,'AT',600,60,10,1,0,0,'12:00',3,-1,0,0,'12:00'),(572,'Australia/Currie',2000,'AT',600,60,8,-1,0,0,'12:00',3,-1,0,0,'12:00'),(573,'Australia/Currie',2001,'AT',600,60,10,1,0,0,'12:00',3,-1,0,0,'12:00'),(574,'Australia/Currie',2006,'AT',600,60,10,1,0,0,'12:00',4,1,0,0,'12:00'),(575,'Australia/Currie',2007,'AT',600,60,10,1,0,0,'12:00',3,-1,0,0,'12:00'),(576,'Australia/Currie',2008,'AT',600,0,10,1,0,0,'12:00',3,-1,0,0,'12:00'),(577,'Australia/Melbourne',1970,'Aus',600,0,12,31,-1,0,'22:00',3,-1,0,0,'11:00'),(578,'Australia/Melbourne',1971,'AV',600,60,10,-1,0,0,'12:00',1,1,-1,0,'21:00'),(579,'Australia/Melbourne',1972,'AV',600,60,10,-1,0,0,'12:00',2,-1,0,0,'12:00'),(580,'Australia/Melbourne',1973,'AV',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(581,'Australia/Melbourne',1986,'AV',600,60,10,15,0,0,'12:00',3,15,0,0,'12:00'),(582,'Australia/Melbourne',1988,'AV',600,60,10,-1,0,0,'12:00',3,15,0,0,'12:00'),(583,'Australia/Melbourne',1991,'AV',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(584,'Australia/Melbourne',1995,'AV',600,60,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(585,'Australia/Melbourne',2000,'AV',600,60,8,-1,0,0,'12:00',3,-1,0,0,'12:00'),(586,'Australia/Melbourne',2001,'AV',600,60,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(587,'Australia/Melbourne',2006,'AV',600,60,10,-1,0,0,'12:00',4,1,0,0,'12:00'),(588,'Australia/Melbourne',2007,'AV',600,60,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(589,'Australia/Melbourne',2008,'AV',600,0,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(590,'Australia/Sydney',1970,'Aus',600,0,12,31,-1,0,'22:00',3,-1,0,0,'11:00'),(591,'Australia/Sydney',1971,'AN',600,60,10,-1,0,0,'12:00',1,1,-1,0,'21:00'),(592,'Australia/Sydney',1972,'AN',600,60,10,-1,0,0,'12:00',2,27,-1,0,'12:00'),(593,'Australia/Sydney',1973,'AN',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(594,'Australia/Sydney',1982,'AN',600,60,10,-1,0,0,'12:00',4,1,0,0,'12:00'),(595,'Australia/Sydney',1983,'AN',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(596,'Australia/Sydney',1986,'AN',600,60,10,19,-1,0,'12:00',3,15,0,0,'12:00'),(597,'Australia/Sydney',1987,'AN',600,60,10,-1,0,0,'12:00',3,15,0,0,'12:00'),(598,'Australia/Sydney',1990,'AN',600,60,10,-1,0,0,'12:00',3,1,0,0,'12:00'),(599,'Australia/Sydney',1996,'AN',600,60,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(600,'Australia/Sydney',2000,'AN',600,60,8,-1,0,0,'12:00',3,-1,0,0,'12:00'),(601,'Australia/Sydney',2001,'AN',600,60,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(602,'Australia/Sydney',2006,'AN',600,60,10,-1,0,0,'12:00',4,1,0,0,'12:00'),(603,'Australia/Sydney',2007,'AN',600,60,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(604,'Australia/Sydney',2008,'AN',600,0,10,-1,0,0,'12:00',3,-1,0,0,'12:00'),(605,'Australia/Broken_Hill',1970,'Aus',570,0,12,31,-1,0,'21:30',3,-1,0,0,'10:30'),(606,'Australia/Broken_Hill',1971,'AN',570,60,10,-1,0,0,'11:30',1,1,-1,0,'20:30'),(607,'Australia/Broken_Hill',1972,'AN',570,60,10,-1,0,0,'11:30',2,27,-1,0,'11:30'),(608,'Australia/Broken_Hill',1973,'AN',570,60,10,-1,0,0,'11:30',3,1,0,0,'11:30'),(609,'Australia/Broken_Hill',1982,'AN',570,60,10,-1,0,0,'11:30',4,1,0,0,'11:30'),(610,'Australia/Broken_Hill',1983,'AN',570,60,10,-1,0,0,'11:30',3,1,0,0,'11:30'),(611,'Australia/Broken_Hill',1986,'AN',570,60,10,19,-1,0,'11:30',3,15,0,0,'11:30'),(612,'Australia/Broken_Hill',1987,'AN',570,60,10,-1,0,0,'11:30',3,15,0,0,'11:30'),(613,'Australia/Broken_Hill',1990,'AN',570,60,10,-1,0,0,'11:30',3,1,0,0,'11:30'),(614,'Australia/Broken_Hill',1996,'AN',570,60,10,-1,0,0,'11:30',3,-1,0,0,'11:30'),(615,'Australia/Broken_Hill',2000,'AS',570,60,10,-1,0,0,'11:30',3,-1,0,0,'11:30'),(616,'Australia/Broken_Hill',2006,'AS',570,60,10,-1,0,0,'11:30',4,1,0,0,'11:30'),(617,'Australia/Broken_Hill',2007,'AS',570,60,10,-1,0,0,'11:30',3,-1,0,0,'11:30'),(618,'Australia/Broken_Hill',2008,'AS',570,0,10,-1,0,0,'11:30',3,-1,0,0,'11:30'),(619,'Australia/Lord_Howe',1970,'',600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(620,'Australia/Lord_Howe',1981,'LH',630,60,10,-1,0,0,'12:30',1,1,-1,0,'21:30'),(621,'Australia/Lord_Howe',1982,'LH',630,60,10,-1,0,0,'12:30',3,1,0,0,'11:30'),(622,'Australia/Lord_Howe',1985,'LH',630,30,10,-1,0,0,'12:30',3,1,0,0,'11:30'),(623,'Australia/Lord_Howe',1986,'LH',630,30,10,19,-1,0,'12:30',3,15,0,0,'11:30'),(624,'Australia/Lord_Howe',1987,'LH',630,30,10,-1,0,0,'12:30',3,15,0,0,'11:30'),(625,'Australia/Lord_Howe',1990,'LH',630,30,10,-1,0,0,'12:30',3,1,0,0,'11:30'),(626,'Australia/Lord_Howe',1996,'LH',630,30,10,-1,0,0,'12:30',3,-1,0,0,'11:30'),(627,'Australia/Lord_Howe',2000,'LH',630,30,8,-1,0,0,'12:30',3,-1,0,0,'11:30'),(628,'Australia/Lord_Howe',2001,'LH',630,30,10,-1,0,0,'12:30',3,-1,0,0,'11:30'),(629,'Australia/Lord_Howe',2006,'LH',630,30,10,-1,0,0,'12:30',4,1,0,0,'11:30'),(630,'Australia/Lord_Howe',2007,'LH',630,30,10,-1,0,0,'12:30',3,-1,0,0,'11:30'),(631,'Australia/Lord_Howe',2008,'LH',630,0,10,-1,0,0,'12:30',3,-1,0,0,'11:30'),(632,'Indian/Christmas',1970,'',420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(633,'Pacific/Rarotonga',1970,'',-630,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(634,'Pacific/Rarotonga',1978,'Cook',-600,30,11,12,-1,0,'-10:00',1,1,-1,0,'01:00'),(635,'Pacific/Rarotonga',1979,'Cook',-600,30,10,-1,0,0,'-10:00',3,1,0,0,'-11:00'),(636,'Pacific/Rarotonga',1991,'Cook',-600,0,12,31,-1,0,'02:00',3,1,0,0,'-11:00'),(637,'Indian/Cocos',1970,'',390,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(638,'Pacific/Fiji',1970,'Fiji',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(639,'Pacific/Fiji',1998,'Fiji',720,60,11,1,0,0,'14:00',1,1,-1,0,'23:00'),(640,'Pacific/Fiji',1999,'Fiji',720,60,11,1,0,0,'14:00',2,-1,0,0,'14:00'),(641,'Pacific/Fiji',2000,'Fiji',720,0,12,31,-1,0,'24:00',2,-1,0,0,'14:00'),(642,'Pacific/Gambier',1970,'',-540,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(643,'Pacific/Marquesas',1970,'',-570,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(644,'Pacific/Tahiti',1970,'',-600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(645,'Pacific/Guam',1970,'',600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(646,'Pacific/Guam',2000,'',600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(647,'Pacific/Tarawa',1970,'',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(648,'Pacific/Enderbury',1970,'',-720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(649,'Pacific/Enderbury',1979,'',-660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(650,'Pacific/Enderbury',1995,'',780,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(651,'Pacific/Kiritimati',1970,'',-640,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(652,'Pacific/Kiritimati',1979,'',-600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(653,'Pacific/Kiritimati',1995,'',840,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(654,'Pacific/Saipan',1970,'',600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(655,'Pacific/Saipan',2000,'',600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(656,'Pacific/Majuro',1970,'',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(657,'Pacific/Kwajalein',1970,'',-720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(658,'Pacific/Kwajalein',1993,'',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(659,'Pacific/Truk',1970,'',600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(660,'Pacific/Ponape',1970,'',660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(661,'Pacific/Kosrae',1970,'',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(662,'Pacific/Kosrae',1999,'',660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(663,'Pacific/Nauru',1970,'',690,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(664,'Pacific/Nauru',1979,'',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(665,'Pacific/Noumea',1970,'NC',660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(666,'Pacific/Noumea',1977,'NC',660,60,12,1,0,0,'11:00',1,1,-1,0,'22:00'),(667,'Pacific/Noumea',1978,'NC',660,60,12,1,0,0,'11:00',2,27,-1,0,'10:00'),(668,'Pacific/Noumea',1979,'NC',660,0,12,31,-1,0,'23:00',2,27,-1,0,'10:00'),(669,'Pacific/Noumea',1996,'NC',660,60,12,1,-1,0,'13:00',1,1,-1,0,'22:00'),(670,'Pacific/Noumea',1997,'NC',660,0,12,31,-1,0,'23:00',3,2,-1,0,'13:00'),(671,'Pacific/Auckland',1970,'NZ',720,0,12,31,-1,0,'24:00',1,1,-1,0,'11:00'),(672,'Pacific/Auckland',1974,'NZ',720,60,11,1,0,0,'14:00',1,1,-1,0,'23:00'),(673,'Pacific/Auckland',1975,'NZ',720,60,10,-1,0,0,'14:00',2,-1,0,0,'14:00'),(674,'Pacific/Auckland',1976,'NZ',720,60,10,-1,0,0,'14:00',3,1,0,0,'14:00'),(675,'Pacific/Auckland',1989,'NZ',720,60,10,8,0,0,'14:00',3,1,0,0,'14:00'),(676,'Pacific/Auckland',1990,'NZ',720,60,10,1,0,0,'14:00',3,15,0,0,'14:00'),(677,'Pacific/Auckland',2007,'NZ',720,0,9,-1,0,0,'14:00',3,15,0,0,'14:00'),(678,'Pacific/Chatham',1970,'Chatham',765,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(679,'Pacific/Chatham',1974,'Chatham',765,60,11,1,0,0,'15:30',1,1,-1,0,'23:45'),(680,'Pacific/Chatham',1975,'Chatham',765,60,10,-1,0,0,'15:30',2,-1,0,0,'15:30'),(681,'Pacific/Chatham',1976,'Chatham',765,60,10,-1,0,0,'15:30',3,1,0,0,'15:30'),(682,'Pacific/Chatham',1989,'Chatham',765,60,10,8,0,0,'15:30',3,1,0,0,'15:30'),(683,'Pacific/Chatham',1990,'Chatham',765,60,10,1,0,0,'15:30',3,15,0,0,'15:30'),(684,'Pacific/Chatham',2007,'Chatham',765,0,9,-1,0,0,'15:30',3,15,0,0,'15:30'),(685,'Pacific/Niue',1970,'',-690,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(686,'Pacific/Niue',1978,'',-660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(687,'Pacific/Norfolk',1970,'',690,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(688,'Pacific/Palau',1970,'',540,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(689,'Pacific/Port_Moresby',1970,'',600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(690,'Pacific/Pitcairn',1970,'',-510,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(691,'Pacific/Pitcairn',1998,'',-480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(692,'Pacific/Pago_Pago',1970,'',-660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(693,'Pacific/Pago_Pago',1983,'',-660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(694,'Pacific/Apia',1970,'',-660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(695,'Pacific/Guadalcanal',1970,'',660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(696,'Pacific/Fakaofo',1970,'',-600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(697,'Pacific/Tongatapu',1970,'',780,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(698,'Pacific/Tongatapu',1999,'Tonga',780,60,10,7,-1,0,'15:00',1,1,-1,0,'24:00'),(699,'Pacific/Tongatapu',2000,'Tonga',780,60,11,1,0,0,'15:00',3,19,-1,0,'15:00'),(700,'Pacific/Tongatapu',2001,'Tonga',780,60,11,1,0,0,'15:00',1,-1,0,0,'14:00'),(701,'Pacific/Tongatapu',2002,'Tonga',780,0,12,31,-1,0,'25:00',1,-1,0,0,'14:00'),(702,'Pacific/Funafuti',1970,'',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(703,'Pacific/Johnston',1970,'',-600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(704,'Pacific/Midway',1970,'',-660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(705,'Pacific/Midway',1983,'',-660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(706,'Pacific/Wake',1970,'',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(707,'Pacific/Efate',1970,'Vanuatu',660,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(708,'Pacific/Efate',1983,'Vanuatu',660,60,9,25,-1,0,'11:00',1,1,-1,0,'22:00'),(709,'Pacific/Efate',1984,'Vanuatu',660,60,10,23,-1,0,'11:00',3,23,0,0,'10:00'),(710,'Pacific/Efate',1985,'Vanuatu',660,60,9,23,0,0,'11:00',3,23,0,0,'10:00'),(711,'Pacific/Efate',1992,'Vanuatu',660,60,10,23,0,0,'11:00',1,23,0,0,'10:00'),(712,'Pacific/Efate',1993,'Vanuatu',660,0,12,31,-1,0,'23:00',1,23,0,0,'10:00'),(713,'Pacific/Wallis',1970,'',720,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(714,'Europe/London',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(715,'Europe/London',1971,'GB-Eire',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(716,'Europe/London',1972,'GB-Eire',0,60,3,16,0,0,'02:00',10,23,0,0,'02:00'),(717,'Europe/London',1981,'GB-Eire',0,60,3,-1,0,0,'1:00',10,23,0,0,'1:00'),(718,'Europe/London',1990,'GB-Eire',0,60,3,-1,0,0,'1:00',10,22,0,0,'1:00'),(719,'Europe/London',1995,'GB-Eire',0,0,3,-1,0,0,'1:00',10,22,0,0,'1:00'),(720,'Europe/London',1996,'EU',0,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(721,'Europe/Dublin',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(722,'Europe/Dublin',1971,'GB-Eire',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(723,'Europe/Dublin',1972,'GB-Eire',0,60,3,16,0,0,'02:00',10,23,0,0,'02:00'),(724,'Europe/Dublin',1981,'GB-Eire',0,60,3,-1,0,0,'1:00',10,23,0,0,'1:00'),(725,'Europe/Dublin',1990,'GB-Eire',0,60,3,-1,0,0,'1:00',10,22,0,0,'1:00'),(726,'Europe/Dublin',1995,'GB-Eire',0,0,3,-1,0,0,'1:00',10,22,0,0,'1:00'),(727,'Europe/Dublin',1996,'EU',0,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(728,'WET',1970,'EU',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(729,'WET',1977,'EU',0,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(730,'WET',1978,'EU',0,60,4,1,0,0,'1:00',10,1,-1,0,'1:00'),(731,'WET',1979,'EU',0,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(732,'WET',1981,'EU',0,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(733,'WET',1996,'EU',0,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(734,'CET',1970,'C-Eur',60,60,4,3,-1,0,'03:00',10,2,-1,0,'03:00'),(735,'CET',1977,'C-Eur',60,60,4,1,0,0,'03:00',9,-1,0,0,'03:00'),(736,'CET',1978,'C-Eur',60,60,4,1,0,0,'03:00',10,1,-1,0,'03:00'),(737,'CET',1979,'C-Eur',60,60,4,1,0,0,'03:00',9,-1,0,0,'03:00'),(738,'CET',1981,'C-Eur',60,60,3,-1,0,0,'03:00',9,-1,0,0,'03:00'),(739,'CET',1996,'C-Eur',60,60,3,-1,0,0,'03:00',10,-1,0,0,'03:00'),(740,'MET',1970,'C-Eur',60,60,4,3,-1,0,'03:00',10,2,-1,0,'03:00'),(741,'MET',1977,'C-Eur',60,60,4,1,0,0,'03:00',9,-1,0,0,'03:00'),(742,'MET',1978,'C-Eur',60,60,4,1,0,0,'03:00',10,1,-1,0,'03:00'),(743,'MET',1979,'C-Eur',60,60,4,1,0,0,'03:00',9,-1,0,0,'03:00'),(744,'MET',1981,'C-Eur',60,60,3,-1,0,0,'03:00',9,-1,0,0,'03:00'),(745,'MET',1996,'C-Eur',60,60,3,-1,0,0,'03:00',10,-1,0,0,'03:00'),(746,'EET',1970,'EU',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(747,'EET',1977,'EU',120,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(748,'EET',1978,'EU',120,60,4,1,0,0,'1:00',10,1,-1,0,'1:00'),(749,'EET',1979,'EU',120,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(750,'EET',1981,'EU',120,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(751,'EET',1996,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(752,'Europe/Tirane',1970,'Albania',60,60,3,29,-1,0,'03:00',4,10,-1,0,'03:00'),(753,'Europe/Tirane',1974,'Albania',60,60,5,4,-1,0,'01:00',10,2,-1,0,'00:00'),(754,'Europe/Tirane',1975,'Albania',60,60,5,1,-1,0,'01:00',10,2,-1,0,'00:00'),(755,'Europe/Tirane',1976,'Albania',60,60,5,2,-1,0,'01:00',10,3,-1,0,'00:00'),(756,'Europe/Tirane',1977,'Albania',60,60,5,8,-1,0,'01:00',10,2,-1,0,'00:00'),(757,'Europe/Tirane',1978,'Albania',60,60,5,6,-1,0,'01:00',10,1,-1,0,'00:00'),(758,'Europe/Tirane',1979,'Albania',60,60,5,5,-1,0,'01:00',9,30,-1,0,'00:00'),(759,'Europe/Tirane',1980,'Albania',60,60,5,3,-1,0,'01:00',10,4,-1,0,'00:00'),(760,'Europe/Tirane',1981,'Albania',60,60,4,26,-1,0,'01:00',9,27,-1,0,'00:00'),(761,'Europe/Tirane',1982,'Albania',60,60,5,2,-1,0,'01:00',10,3,-1,0,'00:00'),(762,'Europe/Tirane',1983,'Albania',60,60,4,18,-1,0,'01:00',10,1,-1,0,'00:00'),(763,'Europe/Tirane',1984,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(764,'Europe/Tirane',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(765,'Europe/Andorra',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(766,'Europe/Andorra',1985,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(767,'Europe/Andorra',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(768,'Europe/Vienna',1970,'Austria',60,60,4,18,-1,0,'03:00',10,1,0,0,'03:00'),(769,'Europe/Vienna',1980,'Austria',60,60,4,6,-1,0,'01:00',9,28,-1,0,'00:00'),(770,'Europe/Vienna',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(771,'Europe/Vienna',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(772,'Europe/Minsk',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(773,'Europe/Minsk',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(774,'Europe/Minsk',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(775,'Europe/Minsk',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(776,'Europe/Minsk',1990,'',180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(777,'Europe/Minsk',1991,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(778,'Europe/Minsk',1992,'Russia',120,60,3,-1,6,0,'25:00',9,-1,6,0,'24:00'),(779,'Europe/Minsk',1993,'Russia',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(780,'Europe/Minsk',1996,'Russia',120,60,3,-1,0,0,'04:00',10,-1,0,0,'04:00'),(781,'Europe/Brussels',1970,'Belgium',60,0,5,19,-1,0,'03:00',10,7,-1,0,'03:00'),(782,'Europe/Brussels',1977,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(783,'Europe/Brussels',1978,'EU',60,60,4,1,0,0,'1:00',10,1,-1,0,'1:00'),(784,'Europe/Brussels',1979,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(785,'Europe/Brussels',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(786,'Europe/Brussels',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(787,'Europe/Sofia',1970,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(788,'Europe/Sofia',1979,'Bulg',120,60,3,31,-1,0,'25:00',10,1,-1,0,'02:00'),(789,'Europe/Sofia',1980,'Bulg',120,60,4,1,6,0,'25:00',9,29,-1,0,'02:00'),(790,'Europe/Sofia',1981,'Bulg',120,60,4,1,6,0,'25:00',9,27,-1,0,'03:00'),(791,'Europe/Sofia',1982,'C-Eur',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(792,'Europe/Sofia',1991,'E-Eur',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(793,'Europe/Sofia',1996,'E-Eur',120,60,3,-1,0,0,'02:00',10,-1,0,0,'01:00'),(794,'Europe/Sofia',1997,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(795,'Europe/Prague',1970,'Czech',60,0,4,9,-1,0,'03:00',10,1,0,0,'03:00'),(796,'Europe/Prague',1979,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(797,'Europe/Prague',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(798,'Europe/Prague',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(799,'Europe/Copenhagen',1970,'Denmark',60,0,5,9,-1,0,'03:00',8,8,-1,0,'03:00'),(800,'Europe/Copenhagen',1980,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(801,'Europe/Copenhagen',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(802,'Europe/Copenhagen',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(803,'Atlantic/Faroe',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(804,'Atlantic/Faroe',1981,'EU',0,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(805,'Atlantic/Faroe',1996,'EU',0,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(806,'America/Danmarkshavn',1970,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(807,'America/Danmarkshavn',1980,'EU',-180,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(808,'America/Danmarkshavn',1981,'EU',-180,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(809,'America/Danmarkshavn',1996,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(810,'America/Scoresbysund',1970,'',-120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(811,'America/Scoresbysund',1980,'C-Eur',-120,60,4,1,0,0,'00:00',9,-1,0,0,'00:00'),(812,'America/Scoresbysund',1981,'EU',-60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(813,'America/Scoresbysund',1996,'EU',-60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(814,'America/Godthab',1970,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(815,'America/Godthab',1980,'EU',-180,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(816,'America/Godthab',1981,'EU',-180,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(817,'America/Godthab',1996,'EU',-180,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(818,'America/Thule',1970,'Thule',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(819,'America/Thule',1991,'Thule',-240,60,3,-1,0,0,'-2:00',9,-1,0,0,'-3:00'),(820,'America/Thule',1993,'Thule',-240,60,4,1,0,0,'-2:00',10,-1,0,0,'-3:00'),(821,'America/Thule',2007,'Thule',-240,60,3,8,0,0,'-2:00',11,1,0,0,'-3:00'),(822,'Europe/Tallinn',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(823,'Europe/Tallinn',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(824,'Europe/Tallinn',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(825,'Europe/Tallinn',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(826,'Europe/Tallinn',1989,'C-Eur',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(827,'Europe/Tallinn',1996,'C-Eur',120,60,3,-1,0,0,'04:00',10,-1,0,0,'04:00'),(828,'Europe/Tallinn',1998,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(829,'Europe/Tallinn',1999,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(830,'Europe/Tallinn',2002,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(831,'Europe/Helsinki',1970,'Finland',120,0,4,3,-1,0,'02:00',10,3,-1,0,'01:00'),(832,'Europe/Helsinki',1981,'EU',120,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(833,'Europe/Helsinki',1996,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(834,'Europe/Paris',1970,'France',60,120,4,2,-1,0,'03:00',9,16,-1,0,'03:00'),(835,'Europe/Paris',1976,'France',60,60,3,28,-1,0,'02:00',9,26,-1,0,'01:00'),(836,'Europe/Paris',1977,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(837,'Europe/Paris',1978,'EU',60,60,4,1,0,0,'1:00',10,1,-1,0,'1:00'),(838,'Europe/Paris',1979,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(839,'Europe/Paris',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(840,'Europe/Paris',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(841,'Europe/Berlin',1970,'Germany',60,0,4,10,-1,0,'03:00',10,1,0,0,'03:00'),(842,'Europe/Berlin',1980,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(843,'Europe/Berlin',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(844,'Europe/Berlin',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(845,'Europe/Gibraltar',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(846,'Europe/Gibraltar',1982,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(847,'Europe/Gibraltar',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(848,'Europe/Athens',1970,'Greece',120,60,7,1,-1,0,'02:00',11,2,-1,0,'01:00'),(849,'Europe/Athens',1975,'Greece',120,60,4,12,-1,0,'02:00',11,26,-1,0,'02:00'),(850,'Europe/Athens',1976,'Greece',120,60,4,11,-1,0,'04:00',10,10,-1,0,'04:00'),(851,'Europe/Athens',1977,'Greece',120,60,4,1,0,0,'04:00',9,26,-1,0,'04:00'),(852,'Europe/Athens',1978,'Greece',120,60,4,1,0,0,'04:00',9,24,-1,0,'05:00'),(853,'Europe/Athens',1979,'Greece',120,60,4,1,-1,0,'11:00',9,29,-1,0,'03:00'),(854,'Europe/Athens',1980,'Greece',120,60,4,1,-1,0,'02:00',9,28,-1,0,'01:00'),(855,'Europe/Athens',1981,'EU',120,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(856,'Europe/Athens',1996,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(857,'Europe/Budapest',1970,'Hungary',60,60,6,1,0,0,'02:00',9,-1,0,0,'03:00'),(858,'Europe/Budapest',1980,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(859,'Europe/Budapest',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(860,'Europe/Budapest',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(861,'Atlantic/Reykjavik',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(862,'Europe/Rome',1970,'Italy',60,60,5,31,-1,0,'01:00',9,-1,0,0,'00:00'),(863,'Europe/Rome',1971,'Italy',60,60,5,22,0,0,'01:00',9,-1,0,0,'01:00'),(864,'Europe/Rome',1972,'Italy',60,60,5,22,0,0,'01:00',10,1,-1,0,'00:00'),(865,'Europe/Rome',1973,'Italy',60,60,6,3,-1,0,'01:00',9,-1,0,0,'00:00'),(866,'Europe/Rome',1974,'Italy',60,60,5,26,-1,0,'01:00',9,-1,0,0,'00:00'),(867,'Europe/Rome',1975,'Italy',60,60,6,1,-1,0,'01:00',9,-1,0,0,'01:00'),(868,'Europe/Rome',1976,'Italy',60,60,5,30,-1,0,'01:00',9,-1,0,0,'01:00'),(869,'Europe/Rome',1977,'Italy',60,60,5,22,0,0,'01:00',9,-1,0,0,'01:00'),(870,'Europe/Rome',1978,'Italy',60,60,5,22,0,0,'01:00',10,1,-1,0,'01:00'),(871,'Europe/Rome',1979,'Italy',60,60,5,22,0,0,'01:00',9,30,-1,0,'01:00'),(872,'Europe/Rome',1980,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(873,'Europe/Rome',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(874,'Europe/Rome',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(875,'Europe/Riga',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(876,'Europe/Riga',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(877,'Europe/Riga',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(878,'Europe/Riga',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(879,'Europe/Riga',1989,'Latvia',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(880,'Europe/Riga',1996,'Latvia',120,0,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(881,'Europe/Riga',1997,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(882,'Europe/Riga',2000,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(883,'Europe/Riga',2001,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(884,'Europe/Vaduz',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(885,'Europe/Vaduz',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(886,'Europe/Vaduz',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(887,'Europe/Vilnius',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(888,'Europe/Vilnius',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(889,'Europe/Vilnius',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(890,'Europe/Vilnius',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(891,'Europe/Vilnius',1991,'C-Eur',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(892,'Europe/Vilnius',1996,'C-Eur',120,60,3,-1,0,0,'04:00',10,-1,0,0,'04:00'),(893,'Europe/Vilnius',1998,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(894,'Europe/Vilnius',1999,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(895,'Europe/Vilnius',2003,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(896,'Europe/Luxembourg',1970,'Belgium',60,0,5,19,-1,0,'03:00',10,7,-1,0,'03:00'),(897,'Europe/Luxembourg',1977,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(898,'Europe/Luxembourg',1978,'EU',60,60,4,1,0,0,'1:00',10,1,-1,0,'1:00'),(899,'Europe/Luxembourg',1979,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(900,'Europe/Luxembourg',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(901,'Europe/Luxembourg',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(902,'Europe/Malta',1970,'Italy',60,60,5,31,-1,0,'01:00',9,-1,0,0,'00:00'),(903,'Europe/Malta',1971,'Italy',60,60,5,22,0,0,'01:00',9,-1,0,0,'01:00'),(904,'Europe/Malta',1972,'Italy',60,60,5,22,0,0,'01:00',10,1,-1,0,'00:00'),(905,'Europe/Malta',1973,'Malta',60,60,3,31,-1,0,'01:00',9,29,-1,0,'01:00'),(906,'Europe/Malta',1974,'Malta',60,60,4,21,-1,0,'01:00',9,16,-1,0,'01:00'),(907,'Europe/Malta',1975,'Malta',60,60,4,15,0,0,'03:00',9,15,0,0,'02:00'),(908,'Europe/Malta',1980,'Malta',60,0,3,31,-1,0,'03:00',9,15,0,0,'02:00'),(909,'Europe/Malta',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(910,'Europe/Malta',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(911,'Europe/Chisinau',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(912,'Europe/Chisinau',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(913,'Europe/Chisinau',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(914,'Europe/Chisinau',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(915,'Europe/Chisinau',1990,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(916,'Europe/Chisinau',1991,'Russia',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(917,'Europe/Chisinau',1992,'E-Eur',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(918,'Europe/Chisinau',1996,'E-Eur',120,60,3,-1,0,0,'02:00',10,-1,0,0,'01:00'),(919,'Europe/Chisinau',1997,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(920,'Europe/Monaco',1970,'France',60,120,4,2,-1,0,'03:00',9,16,-1,0,'03:00'),(921,'Europe/Monaco',1976,'France',60,60,3,28,-1,0,'02:00',9,26,-1,0,'01:00'),(922,'Europe/Monaco',1977,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(923,'Europe/Monaco',1978,'EU',60,60,4,1,0,0,'1:00',10,1,-1,0,'1:00'),(924,'Europe/Monaco',1979,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(925,'Europe/Monaco',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(926,'Europe/Monaco',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(927,'Europe/Amsterdam',1970,'Neth',60,0,4,2,-1,0,'03:00',9,16,-1,0,'03:00'),(928,'Europe/Amsterdam',1977,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(929,'Europe/Amsterdam',1978,'EU',60,60,4,1,0,0,'1:00',10,1,-1,0,'1:00'),(930,'Europe/Amsterdam',1979,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(931,'Europe/Amsterdam',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(932,'Europe/Amsterdam',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(933,'Europe/Oslo',1970,'Norway',60,0,4,25,-1,0,'03:00',9,15,0,0,'03:00'),(934,'Europe/Oslo',1980,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(935,'Europe/Oslo',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(936,'Europe/Oslo',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(937,'Europe/Warsaw',1970,'Poland',60,0,5,-1,0,0,'02:00',9,-1,0,0,'02:00'),(938,'Europe/Warsaw',1977,'W-Eur',60,60,4,1,0,0,'02:00',9,-1,0,0,'02:00'),(939,'Europe/Warsaw',1978,'W-Eur',60,60,4,1,0,0,'02:00',10,1,-1,0,'02:00'),(940,'Europe/Warsaw',1979,'W-Eur',60,60,4,1,0,0,'02:00',9,-1,0,0,'02:00'),(941,'Europe/Warsaw',1981,'W-Eur',60,60,3,-1,0,0,'02:00',9,-1,0,0,'02:00'),(942,'Europe/Warsaw',1988,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(943,'Europe/Warsaw',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(944,'Europe/Lisbon',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(945,'Europe/Lisbon',1976,'Port',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(946,'Europe/Lisbon',1977,'Port',0,60,3,27,-1,0,'00:00',9,25,-1,0,'00:00'),(947,'Europe/Lisbon',1978,'Port',0,60,4,1,0,0,'00:00',10,1,-1,0,'00:00'),(948,'Europe/Lisbon',1979,'Port',0,60,4,1,0,0,'00:00',9,-1,0,0,'01:00'),(949,'Europe/Lisbon',1980,'Port',0,60,3,-1,0,0,'00:00',9,-1,0,0,'01:00'),(950,'Europe/Lisbon',1981,'Port',0,60,3,-1,0,0,'01:00',9,-1,0,0,'01:00'),(951,'Europe/Lisbon',1983,'W-Eur',0,60,3,-1,0,0,'01:00',9,-1,0,0,'01:00'),(952,'Europe/Lisbon',1992,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(953,'Europe/Lisbon',1996,'EU',0,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(954,'Atlantic/Azores',1970,'Port',-60,60,4,1,0,0,'01:00',10,1,0,0,'01:00'),(955,'Atlantic/Azores',1977,'Port',-60,60,3,27,-1,0,'-1:00',9,25,-1,0,'-1:00'),(956,'Atlantic/Azores',1978,'Port',-60,60,4,1,0,0,'-1:00',10,1,-1,0,'-1:00'),(957,'Atlantic/Azores',1979,'Port',-60,60,4,1,0,0,'-1:00',9,-1,0,0,'00:00'),(958,'Atlantic/Azores',1980,'Port',-60,60,3,-1,0,0,'-1:00',9,-1,0,0,'00:00'),(959,'Atlantic/Azores',1981,'Port',-60,60,3,-1,0,0,'00:00',9,-1,0,0,'00:00'),(960,'Atlantic/Azores',1983,'W-Eur',-60,60,3,-1,0,0,'00:00',9,-1,0,0,'00:00'),(961,'Atlantic/Azores',1992,'EU',0,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(962,'Atlantic/Azores',1993,'EU',-60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(963,'Atlantic/Azores',1996,'EU',-60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(964,'Atlantic/Madeira',1970,'Port',0,60,4,1,0,0,'02:00',10,1,0,0,'02:00'),(965,'Atlantic/Madeira',1977,'Port',0,60,3,27,-1,0,'00:00',9,25,-1,0,'00:00'),(966,'Atlantic/Madeira',1978,'Port',0,60,4,1,0,0,'00:00',10,1,-1,0,'00:00'),(967,'Atlantic/Madeira',1979,'Port',0,60,4,1,0,0,'00:00',9,-1,0,0,'01:00'),(968,'Atlantic/Madeira',1980,'Port',0,60,3,-1,0,0,'00:00',9,-1,0,0,'01:00'),(969,'Atlantic/Madeira',1981,'Port',0,60,3,-1,0,0,'01:00',9,-1,0,0,'01:00'),(970,'Atlantic/Madeira',1983,'EU',0,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(971,'Atlantic/Madeira',1996,'EU',0,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(972,'Europe/Bucharest',1970,'Romania',120,60,4,2,0,0,'02:00',10,1,0,0,'02:00'),(973,'Europe/Bucharest',1979,'Romania',120,60,5,27,-1,0,'02:00',9,-1,0,0,'01:00'),(974,'Europe/Bucharest',1980,'Romania',120,60,4,5,-1,0,'25:00',9,-1,0,0,'02:00'),(975,'Europe/Bucharest',1981,'C-Eur',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(976,'Europe/Bucharest',1991,'Romania',120,60,3,-1,0,0,'02:00',9,-1,0,0,'02:00'),(977,'Europe/Bucharest',1993,'Romania',120,0,3,-1,0,0,'02:00',9,-1,0,0,'02:00'),(978,'Europe/Bucharest',1994,'E-Eur',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(979,'Europe/Bucharest',1996,'E-Eur',120,60,3,-1,0,0,'02:00',10,-1,0,0,'01:00'),(980,'Europe/Bucharest',1997,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(981,'Europe/Kaliningrad',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(982,'Europe/Kaliningrad',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(983,'Europe/Kaliningrad',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(984,'Europe/Kaliningrad',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(985,'Europe/Kaliningrad',1991,'Russia',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(986,'Europe/Kaliningrad',1992,'Russia',120,60,3,-1,6,0,'25:00',9,-1,6,0,'24:00'),(987,'Europe/Kaliningrad',1993,'Russia',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(988,'Europe/Kaliningrad',1996,'Russia',120,60,3,-1,0,0,'04:00',10,-1,0,0,'04:00'),(989,'Europe/Moscow',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(990,'Europe/Moscow',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(991,'Europe/Moscow',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(992,'Europe/Moscow',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(993,'Europe/Moscow',1991,'Russia',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(994,'Europe/Moscow',1992,'Russia',180,60,3,-1,6,0,'26:00',9,-1,6,0,'25:00'),(995,'Europe/Moscow',1993,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(996,'Europe/Moscow',1996,'Russia',180,60,3,-1,0,0,'05:00',10,-1,0,0,'05:00'),(997,'Europe/Volgograd',1970,'Russia',240,60,9,1,-1,0,'04:00',10,1,-1,0,'03:00'),(998,'Europe/Volgograd',1981,'Russia',240,60,4,1,-1,0,'04:00',10,1,-1,0,'03:00'),(999,'Europe/Volgograd',1984,'Russia',240,60,4,1,-1,0,'04:00',9,-1,0,0,'06:00'),(1000,'Europe/Volgograd',1985,'Russia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(1001,'Europe/Volgograd',1989,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(1002,'Europe/Volgograd',1991,'',240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1003,'Europe/Volgograd',1992,'Russia',180,60,3,-1,6,0,'26:00',9,-1,6,0,'25:00'),(1004,'Europe/Volgograd',1993,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(1005,'Europe/Volgograd',1996,'Russia',180,60,3,-1,0,0,'05:00',10,-1,0,0,'05:00'),(1006,'Europe/Samara',1970,'Russia',240,60,9,1,-1,0,'04:00',10,1,-1,0,'03:00'),(1007,'Europe/Samara',1981,'Russia',240,60,4,1,-1,0,'04:00',10,1,-1,0,'03:00'),(1008,'Europe/Samara',1984,'Russia',240,60,4,1,-1,0,'04:00',9,-1,0,0,'06:00'),(1009,'Europe/Samara',1985,'Russia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(1010,'Europe/Samara',1989,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(1011,'Europe/Samara',1991,'Russia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(1012,'Europe/Samara',1992,'Russia',240,60,3,-1,6,0,'27:00',9,-1,6,0,'26:00'),(1013,'Europe/Samara',1993,'Russia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(1014,'Europe/Samara',1996,'Russia',240,60,3,-1,0,0,'06:00',10,-1,0,0,'06:00'),(1015,'Asia/Yekaterinburg',1970,'Russia',300,60,9,1,-1,0,'05:00',10,1,-1,0,'04:00'),(1016,'Asia/Yekaterinburg',1981,'Russia',300,60,4,1,-1,0,'05:00',10,1,-1,0,'04:00'),(1017,'Asia/Yekaterinburg',1984,'Russia',300,60,4,1,-1,0,'05:00',9,-1,0,0,'07:00'),(1018,'Asia/Yekaterinburg',1985,'Russia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(1019,'Asia/Yekaterinburg',1991,'Russia',240,60,3,-1,0,0,'06:00',9,-1,0,0,'06:00'),(1020,'Asia/Yekaterinburg',1992,'Russia',300,60,3,-1,6,0,'28:00',9,-1,6,0,'27:00'),(1021,'Asia/Yekaterinburg',1993,'Russia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(1022,'Asia/Yekaterinburg',1996,'Russia',300,60,3,-1,0,0,'07:00',10,-1,0,0,'07:00'),(1023,'Asia/Omsk',1970,'Russia',360,60,9,1,-1,0,'06:00',10,1,-1,0,'05:00'),(1024,'Asia/Omsk',1981,'Russia',360,60,4,1,-1,0,'06:00',10,1,-1,0,'05:00'),(1025,'Asia/Omsk',1984,'Russia',360,60,4,1,-1,0,'06:00',9,-1,0,0,'08:00'),(1026,'Asia/Omsk',1985,'Russia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(1027,'Asia/Omsk',1991,'Russia',300,60,3,-1,0,0,'07:00',9,-1,0,0,'07:00'),(1028,'Asia/Omsk',1992,'Russia',360,60,3,-1,6,0,'29:00',9,-1,6,0,'28:00'),(1029,'Asia/Omsk',1993,'Russia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(1030,'Asia/Omsk',1996,'Russia',360,60,3,-1,0,0,'08:00',10,-1,0,0,'08:00'),(1031,'Asia/Novosibirsk',1970,'Russia',420,60,9,1,-1,0,'07:00',10,1,-1,0,'06:00'),(1032,'Asia/Novosibirsk',1981,'Russia',420,60,4,1,-1,0,'07:00',10,1,-1,0,'06:00'),(1033,'Asia/Novosibirsk',1984,'Russia',420,60,4,1,-1,0,'07:00',9,-1,0,0,'09:00'),(1034,'Asia/Novosibirsk',1985,'Russia',420,60,3,-1,0,0,'09:00',9,-1,0,0,'09:00'),(1035,'Asia/Novosibirsk',1991,'Russia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(1036,'Asia/Novosibirsk',1992,'Russia',420,60,3,-1,6,0,'30:00',9,-1,6,0,'29:00'),(1037,'Asia/Novosibirsk',1993,'Russia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(1038,'Asia/Novosibirsk',1996,'Russia',360,60,3,-1,0,0,'08:00',10,-1,0,0,'08:00'),(1039,'Asia/Krasnoyarsk',1970,'Russia',420,60,9,1,-1,0,'07:00',10,1,-1,0,'06:00'),(1040,'Asia/Krasnoyarsk',1981,'Russia',420,60,4,1,-1,0,'07:00',10,1,-1,0,'06:00'),(1041,'Asia/Krasnoyarsk',1984,'Russia',420,60,4,1,-1,0,'07:00',9,-1,0,0,'09:00'),(1042,'Asia/Krasnoyarsk',1985,'Russia',420,60,3,-1,0,0,'09:00',9,-1,0,0,'09:00'),(1043,'Asia/Krasnoyarsk',1991,'Russia',360,60,3,-1,0,0,'08:00',9,-1,0,0,'08:00'),(1044,'Asia/Krasnoyarsk',1992,'Russia',420,60,3,-1,6,0,'30:00',9,-1,6,0,'29:00'),(1045,'Asia/Krasnoyarsk',1993,'Russia',420,60,3,-1,0,0,'09:00',9,-1,0,0,'09:00'),(1046,'Asia/Krasnoyarsk',1996,'Russia',420,60,3,-1,0,0,'09:00',10,-1,0,0,'09:00'),(1047,'Asia/Irkutsk',1970,'Russia',480,60,9,1,-1,0,'08:00',10,1,-1,0,'07:00'),(1048,'Asia/Irkutsk',1981,'Russia',480,60,4,1,-1,0,'08:00',10,1,-1,0,'07:00'),(1049,'Asia/Irkutsk',1984,'Russia',480,60,4,1,-1,0,'08:00',9,-1,0,0,'10:00'),(1050,'Asia/Irkutsk',1985,'Russia',480,60,3,-1,0,0,'10:00',9,-1,0,0,'10:00'),(1051,'Asia/Irkutsk',1991,'Russia',420,60,3,-1,0,0,'09:00',9,-1,0,0,'09:00'),(1052,'Asia/Irkutsk',1992,'Russia',480,60,3,-1,6,0,'31:00',9,-1,6,0,'30:00'),(1053,'Asia/Irkutsk',1993,'Russia',480,60,3,-1,0,0,'10:00',9,-1,0,0,'10:00'),(1054,'Asia/Irkutsk',1996,'Russia',480,60,3,-1,0,0,'10:00',10,-1,0,0,'10:00'),(1055,'Asia/Yakutsk',1970,'Russia',540,60,9,1,-1,0,'09:00',10,1,-1,0,'08:00'),(1056,'Asia/Yakutsk',1981,'Russia',540,60,4,1,-1,0,'09:00',10,1,-1,0,'08:00'),(1057,'Asia/Yakutsk',1984,'Russia',540,60,4,1,-1,0,'09:00',9,-1,0,0,'11:00'),(1058,'Asia/Yakutsk',1985,'Russia',540,60,3,-1,0,0,'11:00',9,-1,0,0,'11:00'),(1059,'Asia/Yakutsk',1991,'Russia',480,60,3,-1,0,0,'10:00',9,-1,0,0,'10:00'),(1060,'Asia/Yakutsk',1992,'Russia',540,60,3,-1,6,0,'32:00',9,-1,6,0,'31:00'),(1061,'Asia/Yakutsk',1993,'Russia',540,60,3,-1,0,0,'11:00',9,-1,0,0,'11:00'),(1062,'Asia/Yakutsk',1996,'Russia',540,60,3,-1,0,0,'11:00',10,-1,0,0,'11:00'),(1063,'Asia/Vladivostok',1970,'Russia',600,60,9,1,-1,0,'10:00',10,1,-1,0,'09:00'),(1064,'Asia/Vladivostok',1981,'Russia',600,60,4,1,-1,0,'10:00',10,1,-1,0,'09:00'),(1065,'Asia/Vladivostok',1984,'Russia',600,60,4,1,-1,0,'10:00',9,-1,0,0,'12:00'),(1066,'Asia/Vladivostok',1985,'Russia',600,60,3,-1,0,0,'12:00',9,-1,0,0,'12:00'),(1067,'Asia/Vladivostok',1991,'Russia',540,60,3,-1,0,0,'11:00',9,-1,0,0,'11:00'),(1068,'Asia/Vladivostok',1992,'Russia',600,60,3,-1,6,0,'33:00',9,-1,6,0,'32:00'),(1069,'Asia/Vladivostok',1993,'Russia',600,60,3,-1,0,0,'12:00',9,-1,0,0,'12:00'),(1070,'Asia/Vladivostok',1996,'Russia',600,60,3,-1,0,0,'12:00',10,-1,0,0,'12:00'),(1071,'Asia/Sakhalin',1970,'Russia',660,60,9,1,-1,0,'11:00',10,1,-1,0,'10:00'),(1072,'Asia/Sakhalin',1981,'Russia',660,60,4,1,-1,0,'11:00',10,1,-1,0,'10:00'),(1073,'Asia/Sakhalin',1984,'Russia',660,60,4,1,-1,0,'11:00',9,-1,0,0,'13:00'),(1074,'Asia/Sakhalin',1985,'Russia',660,60,3,-1,0,0,'13:00',9,-1,0,0,'13:00'),(1075,'Asia/Sakhalin',1991,'Russia',600,60,3,-1,0,0,'12:00',9,-1,0,0,'12:00'),(1076,'Asia/Sakhalin',1992,'Russia',660,60,3,-1,6,0,'34:00',9,-1,6,0,'33:00'),(1077,'Asia/Sakhalin',1993,'Russia',660,60,3,-1,0,0,'13:00',9,-1,0,0,'13:00'),(1078,'Asia/Sakhalin',1996,'Russia',660,60,3,-1,0,0,'13:00',10,-1,0,0,'13:00'),(1079,'Asia/Sakhalin',1997,'Russia',600,60,3,-1,0,0,'12:00',10,-1,0,0,'12:00'),(1080,'Asia/Magadan',1970,'Russia',660,60,9,1,-1,0,'11:00',10,1,-1,0,'10:00'),(1081,'Asia/Magadan',1981,'Russia',660,60,4,1,-1,0,'11:00',10,1,-1,0,'10:00'),(1082,'Asia/Magadan',1984,'Russia',660,60,4,1,-1,0,'11:00',9,-1,0,0,'13:00'),(1083,'Asia/Magadan',1985,'Russia',660,60,3,-1,0,0,'13:00',9,-1,0,0,'13:00'),(1084,'Asia/Magadan',1991,'Russia',600,60,3,-1,0,0,'12:00',9,-1,0,0,'12:00'),(1085,'Asia/Magadan',1992,'Russia',660,60,3,-1,6,0,'34:00',9,-1,6,0,'33:00'),(1086,'Asia/Magadan',1993,'Russia',660,60,3,-1,0,0,'13:00',9,-1,0,0,'13:00'),(1087,'Asia/Magadan',1996,'Russia',660,60,3,-1,0,0,'13:00',10,-1,0,0,'13:00'),(1088,'Asia/Kamchatka',1970,'Russia',720,60,9,1,-1,0,'12:00',10,1,-1,0,'11:00'),(1089,'Asia/Kamchatka',1981,'Russia',720,60,4,1,-1,0,'12:00',10,1,-1,0,'11:00'),(1090,'Asia/Kamchatka',1984,'Russia',720,60,4,1,-1,0,'12:00',9,-1,0,0,'14:00'),(1091,'Asia/Kamchatka',1985,'Russia',720,60,3,-1,0,0,'14:00',9,-1,0,0,'14:00'),(1092,'Asia/Kamchatka',1991,'Russia',660,60,3,-1,0,0,'13:00',9,-1,0,0,'13:00'),(1093,'Asia/Kamchatka',1992,'Russia',720,60,3,-1,6,0,'35:00',9,-1,6,0,'34:00'),(1094,'Asia/Kamchatka',1993,'Russia',720,60,3,-1,0,0,'14:00',9,-1,0,0,'14:00'),(1095,'Asia/Kamchatka',1996,'Russia',720,60,3,-1,0,0,'14:00',10,-1,0,0,'14:00'),(1096,'Asia/Anadyr',1970,'Russia',780,60,9,1,-1,0,'13:00',10,1,-1,0,'12:00'),(1097,'Asia/Anadyr',1981,'Russia',780,60,4,1,-1,0,'13:00',10,1,-1,0,'12:00'),(1098,'Asia/Anadyr',1982,'Russia',720,60,4,1,-1,0,'12:00',10,1,-1,0,'11:00'),(1099,'Asia/Anadyr',1984,'Russia',720,60,4,1,-1,0,'12:00',9,-1,0,0,'14:00'),(1100,'Asia/Anadyr',1985,'Russia',720,60,3,-1,0,0,'14:00',9,-1,0,0,'14:00'),(1101,'Asia/Anadyr',1991,'Russia',660,60,3,-1,0,0,'13:00',9,-1,0,0,'13:00'),(1102,'Asia/Anadyr',1992,'Russia',720,60,3,-1,6,0,'35:00',9,-1,6,0,'34:00'),(1103,'Asia/Anadyr',1993,'Russia',720,60,3,-1,0,0,'14:00',9,-1,0,0,'14:00'),(1104,'Asia/Anadyr',1996,'Russia',720,60,3,-1,0,0,'14:00',10,-1,0,0,'14:00'),(1105,'Europe/Belgrade',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1106,'Europe/Belgrade',1982,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1107,'Europe/Belgrade',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1108,'Europe/Madrid',1970,'Spain',60,60,4,30,-1,0,'24:00',9,30,-1,0,'01:00'),(1109,'Europe/Madrid',1974,'Spain',60,60,4,13,6,0,'24:00',10,1,0,0,'01:00'),(1110,'Europe/Madrid',1976,'Spain',60,60,3,27,-1,0,'24:00',9,-1,0,0,'01:00'),(1111,'Europe/Madrid',1977,'Spain',60,60,4,2,-1,0,'24:00',9,-1,0,0,'01:00'),(1112,'Europe/Madrid',1978,'Spain',60,60,4,2,-1,0,'24:00',10,1,-1,0,'01:00'),(1113,'Europe/Madrid',1979,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(1114,'Europe/Madrid',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1115,'Europe/Madrid',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1116,'Africa/Ceuta',1970,'SpainAfrica',0,60,6,3,-1,0,'12:00',10,1,-1,0,'-1:00'),(1117,'Africa/Ceuta',1974,'SpainAfrica',0,60,6,24,-1,0,'00:00',9,1,-1,0,'-1:00'),(1118,'Africa/Ceuta',1976,'SpainAfrica',0,60,5,1,-1,0,'00:00',8,1,-1,0,'-1:00'),(1119,'Africa/Ceuta',1977,'SpainAfrica',0,60,5,1,-1,0,'00:00',9,28,-1,0,'-1:00'),(1120,'Africa/Ceuta',1978,'SpainAfrica',0,60,6,1,-1,0,'00:00',8,4,-1,0,'-1:00'),(1121,'Africa/Ceuta',1979,'SpainAfrica',0,0,6,1,-1,0,'00:00',8,4,-1,0,'-1:00'),(1122,'Africa/Ceuta',1984,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1123,'Africa/Ceuta',1986,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1124,'Africa/Ceuta',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1125,'Atlantic/Canary',1970,'',0,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1126,'Atlantic/Canary',1980,'EU',0,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(1127,'Atlantic/Canary',1981,'EU',0,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1128,'Atlantic/Canary',1996,'EU',0,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1129,'Europe/Stockholm',1970,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1130,'Europe/Stockholm',1980,'EU',60,60,4,1,0,0,'1:00',9,-1,0,0,'1:00'),(1131,'Europe/Stockholm',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1132,'Europe/Stockholm',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1133,'Europe/Zurich',1970,'Swiss',60,0,5,1,0,0,'03:00',10,1,0,0,'00:00'),(1134,'Europe/Zurich',1981,'EU',60,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1135,'Europe/Zurich',1996,'EU',60,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1136,'Europe/Istanbul',1970,'Turkey',120,60,5,2,0,0,'02:00',10,2,0,0,'01:00'),(1137,'Europe/Istanbul',1973,'Turkey',120,60,6,3,-1,0,'03:00',11,4,-1,0,'04:00'),(1138,'Europe/Istanbul',1974,'Turkey',120,60,3,31,-1,0,'04:00',11,3,-1,0,'06:00'),(1139,'Europe/Istanbul',1975,'Turkey',120,60,3,30,-1,0,'02:00',10,-1,0,0,'01:00'),(1140,'Europe/Istanbul',1976,'Turkey',120,60,6,1,-1,0,'02:00',10,-1,0,0,'01:00'),(1141,'Europe/Istanbul',1977,'Turkey',120,60,4,1,0,0,'02:00',10,16,-1,0,'01:00'),(1142,'Europe/Istanbul',1978,'Turkey',180,60,4,1,0,0,'03:00',1,1,-1,0,'14:00'),(1143,'Europe/Istanbul',1979,'Turkey',180,60,4,1,0,0,'06:00',10,11,1,0,'02:00'),(1144,'Europe/Istanbul',1981,'Turkey',180,60,3,-1,0,0,'06:00',10,11,1,0,'02:00'),(1145,'Europe/Istanbul',1983,'Turkey',180,60,7,31,-1,0,'03:00',10,2,-1,0,'02:00'),(1146,'Europe/Istanbul',1985,'Turkey',120,60,4,20,-1,0,'02:00',9,28,-1,0,'01:00'),(1147,'Europe/Istanbul',1986,'Turkey',120,60,3,-1,0,0,'04:00',9,-1,0,0,'04:00'),(1148,'Europe/Istanbul',1991,'Turkey',120,60,3,-1,0,0,'03:00',9,-1,0,0,'03:00'),(1149,'Europe/Istanbul',1996,'Turkey',120,60,3,-1,0,0,'03:00',10,-1,0,0,'03:00'),(1150,'Europe/Istanbul',2006,'Turkey',120,0,3,-1,0,0,'03:00',10,-1,0,0,'03:00'),(1151,'Europe/Istanbul',2007,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1152,'Europe/Kiev',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(1153,'Europe/Kiev',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(1154,'Europe/Kiev',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(1155,'Europe/Kiev',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(1156,'Europe/Kiev',1990,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1157,'Europe/Kiev',1992,'E-Eur',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(1158,'Europe/Kiev',1995,'EU',120,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1159,'Europe/Kiev',1996,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1160,'Europe/Uzhgorod',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(1161,'Europe/Uzhgorod',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(1162,'Europe/Uzhgorod',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(1163,'Europe/Uzhgorod',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(1164,'Europe/Uzhgorod',1990,'',60,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1165,'Europe/Uzhgorod',1991,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1166,'Europe/Uzhgorod',1992,'E-Eur',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(1167,'Europe/Uzhgorod',1995,'EU',120,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1168,'Europe/Uzhgorod',1996,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1169,'Europe/Zaporozhye',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(1170,'Europe/Zaporozhye',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(1171,'Europe/Zaporozhye',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(1172,'Europe/Zaporozhye',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(1173,'Europe/Zaporozhye',1991,'E-Eur',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(1174,'Europe/Zaporozhye',1995,'EU',120,60,3,-1,0,0,'1:00',9,-1,0,0,'1:00'),(1175,'Europe/Zaporozhye',1996,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1176,'Europe/Simferopol',1970,'Russia',180,60,9,1,-1,0,'03:00',10,1,-1,0,'02:00'),(1177,'Europe/Simferopol',1981,'Russia',180,60,4,1,-1,0,'03:00',10,1,-1,0,'02:00'),(1178,'Europe/Simferopol',1984,'Russia',180,60,4,1,-1,0,'03:00',9,-1,0,0,'05:00'),(1179,'Europe/Simferopol',1985,'Russia',180,60,3,-1,0,0,'05:00',9,-1,0,0,'05:00'),(1180,'Europe/Simferopol',1990,'',120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1181,'Europe/Simferopol',1992,'E-Eur',120,60,3,-1,0,0,'02:00',9,-1,0,0,'01:00'),(1182,'Europe/Simferopol',1994,'E-Eur',180,60,3,-1,0,0,'03:00',9,-1,0,0,'02:00'),(1183,'Europe/Simferopol',1996,'Russia',180,60,3,-1,0,0,'05:00',10,-1,0,0,'05:00'),(1184,'Europe/Simferopol',1997,'EU',120,60,3,-1,0,0,'1:00',10,-1,0,0,'1:00'),(1185,'EST',1970,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1186,'MST',1970,'',-420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1187,'HST',1970,'',-600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1188,'EST5EDT',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1189,'EST5EDT',1974,'US',-300,60,1,6,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1190,'EST5EDT',1975,'US',-300,60,2,23,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1191,'EST5EDT',1976,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1192,'EST5EDT',1987,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1193,'EST5EDT',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1194,'CST6CDT',1970,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1195,'CST6CDT',1974,'US',-360,60,1,6,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1196,'CST6CDT',1975,'US',-360,60,2,23,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1197,'CST6CDT',1976,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1198,'CST6CDT',1987,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1199,'CST6CDT',2007,'US',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1200,'MST7MDT',1970,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1201,'MST7MDT',1974,'US',-420,60,1,6,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1202,'MST7MDT',1975,'US',-420,60,2,23,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1203,'MST7MDT',1976,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1204,'MST7MDT',1987,'US',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1205,'MST7MDT',2007,'US',-420,60,3,8,0,0,'-5:00',11,1,0,0,'-6:00'),(1206,'PST8PDT',1970,'US',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1207,'PST8PDT',1974,'US',-480,60,1,6,-1,0,'-6:00',10,-1,0,0,'-7:00'),(1208,'PST8PDT',1975,'US',-480,60,2,23,-1,0,'-6:00',10,-1,0,0,'-7:00'),(1209,'PST8PDT',1976,'US',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1210,'PST8PDT',1987,'US',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1211,'PST8PDT',2007,'US',-480,60,3,8,0,0,'-6:00',11,1,0,0,'-7:00'),(1212,'America/New_York',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1213,'America/New_York',1974,'US',-300,60,1,6,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1214,'America/New_York',1975,'US',-300,60,2,23,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1215,'America/New_York',1976,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1216,'America/New_York',1987,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1217,'America/New_York',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1218,'America/Chicago',1970,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1219,'America/Chicago',1974,'US',-360,60,1,6,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1220,'America/Chicago',1975,'US',-360,60,2,23,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1221,'America/Chicago',1976,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1222,'America/Chicago',1987,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1223,'America/Chicago',2007,'US',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1224,'America/North_Dakota/Center',1970,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1225,'America/North_Dakota/Center',1974,'US',-420,60,1,6,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1226,'America/North_Dakota/Center',1975,'US',-420,60,2,23,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1227,'America/North_Dakota/Center',1976,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1228,'America/North_Dakota/Center',1987,'US',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1229,'America/North_Dakota/Center',1992,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1230,'America/North_Dakota/Center',2007,'US',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1231,'America/North_Dakota/New_Salem',1970,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1232,'America/North_Dakota/New_Salem',1974,'US',-420,60,1,6,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1233,'America/North_Dakota/New_Salem',1975,'US',-420,60,2,23,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1234,'America/North_Dakota/New_Salem',1976,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1235,'America/North_Dakota/New_Salem',1987,'US',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1236,'America/North_Dakota/New_Salem',2003,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1237,'America/North_Dakota/New_Salem',2007,'US',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1238,'America/Denver',1970,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1239,'America/Denver',1974,'US',-420,60,1,6,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1240,'America/Denver',1975,'US',-420,60,2,23,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1241,'America/Denver',1976,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1242,'America/Denver',1987,'US',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1243,'America/Denver',2007,'US',-420,60,3,8,0,0,'-5:00',11,1,0,0,'-6:00'),(1244,'America/Los_Angeles',1970,'US',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1245,'America/Los_Angeles',1974,'US',-480,60,1,6,-1,0,'-6:00',10,-1,0,0,'-7:00'),(1246,'America/Los_Angeles',1975,'US',-480,60,2,23,-1,0,'-6:00',10,-1,0,0,'-7:00'),(1247,'America/Los_Angeles',1976,'US',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1248,'America/Los_Angeles',1987,'US',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1249,'America/Los_Angeles',2007,'US',-480,60,3,8,0,0,'-6:00',11,1,0,0,'-7:00'),(1250,'America/Juneau',1970,'US',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1251,'America/Juneau',1974,'US',-480,60,1,6,-1,0,'-6:00',10,-1,0,0,'-7:00'),(1252,'America/Juneau',1975,'US',-480,60,2,23,-1,0,'-6:00',10,-1,0,0,'-7:00'),(1253,'America/Juneau',1976,'US',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1254,'America/Juneau',1983,'US',-540,60,4,-1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1255,'America/Juneau',1987,'US',-540,60,4,1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1256,'America/Juneau',2007,'US',-540,60,3,8,0,0,'-7:00',11,1,0,0,'-8:00'),(1257,'America/Yakutat',1970,'US',-540,60,4,-1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1258,'America/Yakutat',1974,'US',-540,60,1,6,-1,0,'-7:00',10,-1,0,0,'-8:00'),(1259,'America/Yakutat',1975,'US',-540,60,2,23,-1,0,'-7:00',10,-1,0,0,'-8:00'),(1260,'America/Yakutat',1976,'US',-540,60,4,-1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1261,'America/Yakutat',1987,'US',-540,60,4,1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1262,'America/Yakutat',2007,'US',-540,60,3,8,0,0,'-7:00',11,1,0,0,'-8:00'),(1263,'America/Anchorage',1970,'US',-600,60,4,-1,0,0,'-8:00',10,-1,0,0,'-9:00'),(1264,'America/Anchorage',1974,'US',-600,60,1,6,-1,0,'-8:00',10,-1,0,0,'-9:00'),(1265,'America/Anchorage',1975,'US',-600,60,2,23,-1,0,'-8:00',10,-1,0,0,'-9:00'),(1266,'America/Anchorage',1976,'US',-600,60,4,-1,0,0,'-8:00',10,-1,0,0,'-9:00'),(1267,'America/Anchorage',1983,'US',-540,60,4,-1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1268,'America/Anchorage',1987,'US',-540,60,4,1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1269,'America/Anchorage',2007,'US',-540,60,3,8,0,0,'-7:00',11,1,0,0,'-8:00'),(1270,'America/Nome',1970,'US',-660,60,4,-1,0,0,'-9:00',10,-1,0,0,'-10:00'),(1271,'America/Nome',1974,'US',-660,60,1,6,-1,0,'-9:00',10,-1,0,0,'-10:00'),(1272,'America/Nome',1975,'US',-660,60,2,23,-1,0,'-9:00',10,-1,0,0,'-10:00'),(1273,'America/Nome',1976,'US',-660,60,4,-1,0,0,'-9:00',10,-1,0,0,'-10:00'),(1274,'America/Nome',1983,'US',-540,60,4,-1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1275,'America/Nome',1987,'US',-540,60,4,1,0,0,'-7:00',10,-1,0,0,'-8:00'),(1276,'America/Nome',2007,'US',-540,60,3,8,0,0,'-7:00',11,1,0,0,'-8:00'),(1277,'America/Adak',1970,'US',-660,60,4,-1,0,0,'-9:00',10,-1,0,0,'-10:00'),(1278,'America/Adak',1974,'US',-660,60,1,6,-1,0,'-9:00',10,-1,0,0,'-10:00'),(1279,'America/Adak',1975,'US',-660,60,2,23,-1,0,'-9:00',10,-1,0,0,'-10:00'),(1280,'America/Adak',1976,'US',-660,60,4,-1,0,0,'-9:00',10,-1,0,0,'-10:00'),(1281,'America/Adak',1983,'US',-600,60,4,-1,0,0,'-8:00',10,-1,0,0,'-9:00'),(1282,'America/Adak',1987,'US',-600,60,4,1,0,0,'-8:00',10,-1,0,0,'-9:00'),(1283,'America/Adak',2007,'US',-600,60,3,8,0,0,'-8:00',11,1,0,0,'-9:00'),(1284,'Pacific/Honolulu',1970,'',-600,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1285,'America/Phoenix',1970,'',-420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1286,'America/Boise',1970,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1287,'America/Boise',1974,'US',-420,60,1,6,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1288,'America/Boise',1975,'US',-420,60,2,23,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1289,'America/Boise',1976,'US',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1290,'America/Boise',1987,'US',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1291,'America/Boise',2007,'US',-420,60,3,8,0,0,'-5:00',11,1,0,0,'-6:00'),(1292,'America/Indiana/Indianapolis',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1293,'America/Indiana/Indianapolis',1971,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1294,'America/Indiana/Indianapolis',2006,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1295,'America/Indiana/Indianapolis',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1296,'America/Indiana/Marengo',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1297,'America/Indiana/Marengo',1974,'US',-300,60,1,6,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1298,'America/Indiana/Marengo',1975,'US',-300,60,2,23,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1299,'America/Indiana/Marengo',1976,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1300,'America/Indiana/Marengo',2006,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1301,'America/Indiana/Marengo',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1302,'America/Indiana/Vincennes',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1303,'America/Indiana/Vincennes',1971,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1304,'America/Indiana/Vincennes',2006,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1305,'America/Indiana/Vincennes',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1306,'America/Indiana/Tell_City',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1307,'America/Indiana/Tell_City',1971,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1308,'America/Indiana/Tell_City',2006,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1309,'America/Indiana/Tell_City',2007,'US',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1310,'America/Indiana/Petersburg',1970,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1311,'America/Indiana/Petersburg',1974,'US',-360,60,1,6,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1312,'America/Indiana/Petersburg',1975,'US',-360,60,2,23,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1313,'America/Indiana/Petersburg',1976,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1314,'America/Indiana/Petersburg',1977,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1315,'America/Indiana/Petersburg',2006,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1316,'America/Indiana/Petersburg',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1317,'America/Indiana/Knox',1970,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1318,'America/Indiana/Knox',1974,'US',-360,60,1,6,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1319,'America/Indiana/Knox',1975,'US',-360,60,2,23,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1320,'America/Indiana/Knox',1976,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1321,'America/Indiana/Knox',1987,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1322,'America/Indiana/Knox',1991,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1323,'America/Indiana/Knox',2006,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1324,'America/Indiana/Knox',2007,'US',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1325,'America/Indiana/Winamac',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1326,'America/Indiana/Winamac',1971,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1327,'America/Indiana/Winamac',2006,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1328,'America/Indiana/Winamac',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1329,'America/Indiana/Vevay',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1330,'America/Indiana/Vevay',1973,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1331,'America/Indiana/Vevay',2006,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1332,'America/Indiana/Vevay',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1333,'America/Kentucky/Louisville',1970,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1334,'America/Kentucky/Louisville',1974,'US',-300,60,1,6,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1335,'America/Kentucky/Louisville',1975,'US',-300,60,2,23,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1336,'America/Kentucky/Louisville',1976,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1337,'America/Kentucky/Louisville',1987,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1338,'America/Kentucky/Louisville',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1339,'America/Kentucky/Monticello',1970,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1340,'America/Kentucky/Monticello',1974,'US',-360,60,1,6,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1341,'America/Kentucky/Monticello',1975,'US',-360,60,2,23,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1342,'America/Kentucky/Monticello',1976,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1343,'America/Kentucky/Monticello',1987,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1344,'America/Kentucky/Monticello',2000,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1345,'America/Kentucky/Monticello',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1346,'America/Detroit',1970,'Detroit',-300,0,6,14,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1347,'America/Detroit',1973,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1348,'America/Detroit',1974,'US',-300,60,1,6,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1349,'America/Detroit',1975,'US',-300,60,2,23,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1350,'America/Detroit',1976,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1351,'America/Detroit',1987,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1352,'America/Detroit',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1353,'America/Menominee',1970,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1354,'America/Menominee',1973,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1355,'America/Menominee',1974,'US',-360,60,1,6,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1356,'America/Menominee',1975,'US',-360,60,2,23,-1,0,'-4:00',10,-1,0,0,'-5:00'),(1357,'America/Menominee',1976,'US',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1358,'America/Menominee',1987,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1359,'America/Menominee',2007,'US',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1360,'America/St_Johns',1970,'StJohns',-210,60,4,-1,0,0,'-1:30',10,-1,0,0,'-2:30'),(1361,'America/St_Johns',1987,'StJohns',-210,60,4,1,0,0,'-3:29',10,-1,0,0,'-4:29'),(1362,'America/St_Johns',1988,'StJohns',-210,120,4,1,0,0,'-3:29',10,-1,0,0,'-4:29'),(1363,'America/St_Johns',1989,'StJohns',-210,60,4,1,0,0,'-3:29',10,-1,0,0,'-4:29'),(1364,'America/St_Johns',2007,'StJohns',-210,60,3,8,0,0,'-3:29',11,1,0,0,'-4:29'),(1365,'America/Goose_Bay',1970,'StJohns',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1366,'America/Goose_Bay',1987,'StJohns',-240,60,4,1,0,0,'-3:59',10,-1,0,0,'-4:59'),(1367,'America/Goose_Bay',1988,'StJohns',-240,120,4,1,0,0,'-3:59',10,-1,0,0,'-4:59'),(1368,'America/Goose_Bay',1989,'StJohns',-240,60,4,1,0,0,'-3:59',10,-1,0,0,'-4:59'),(1369,'America/Goose_Bay',2007,'StJohns',-240,60,3,8,0,0,'-3:59',11,1,0,0,'-4:59'),(1370,'America/Halifax',1970,'Halifax',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1371,'America/Halifax',1973,'Halifax',-240,0,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1372,'America/Halifax',1974,'Canada',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1373,'America/Halifax',1987,'Canada',-240,60,4,1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1374,'America/Halifax',2007,'Canada',-240,60,3,8,0,0,'-2:00',11,1,0,0,'-3:00'),(1375,'America/Glace_Bay',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1376,'America/Glace_Bay',1972,'Halifax',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1377,'America/Glace_Bay',1973,'Halifax',-240,0,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1378,'America/Glace_Bay',1974,'Canada',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1379,'America/Glace_Bay',1987,'Canada',-240,60,4,1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1380,'America/Glace_Bay',2007,'Canada',-240,60,3,8,0,0,'-2:00',11,1,0,0,'-3:00'),(1381,'America/Moncton',1970,'Moncton',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1382,'America/Moncton',1973,'Canada',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1383,'America/Moncton',1987,'Canada',-240,60,4,1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1384,'America/Moncton',1993,'Moncton',-240,60,4,1,0,0,'-3:59',10,-1,0,0,'-4:59'),(1385,'America/Moncton',2006,'Moncton',-240,0,4,1,0,0,'-3:59',10,-1,0,0,'-4:59'),(1386,'America/Moncton',2007,'Canada',-240,60,3,8,0,0,'-2:00',11,1,0,0,'-3:00'),(1387,'America/Blanc-Sablon',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1388,'America/Montreal',1970,'Mont',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1389,'America/Montreal',1974,'Canada',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1390,'America/Montreal',1987,'Canada',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1391,'America/Montreal',2007,'Canada',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1392,'America/Toronto',1970,'Toronto',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1393,'America/Toronto',1973,'Toronto',-300,0,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1394,'America/Toronto',1974,'Canada',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1395,'America/Toronto',1987,'Canada',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1396,'America/Toronto',2007,'Canada',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1397,'America/Thunder_Bay',1970,'Mont',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1398,'America/Thunder_Bay',1973,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1399,'America/Thunder_Bay',1974,'Canada',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1400,'America/Thunder_Bay',1987,'Canada',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1401,'America/Thunder_Bay',2007,'Canada',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1402,'America/Nipigon',1970,'Canada',-300,60,8,14,-1,0,'23:00',9,30,-1,0,'-4:00'),(1403,'America/Nipigon',1974,'Canada',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1404,'America/Nipigon',1987,'Canada',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1405,'America/Nipigon',2007,'Canada',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1406,'America/Rainy_River',1970,'Canada',-360,60,8,14,-1,0,'23:00',9,30,-1,0,'-5:00'),(1407,'America/Rainy_River',1974,'Canada',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1408,'America/Rainy_River',1987,'Canada',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1409,'America/Rainy_River',2007,'Canada',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1410,'America/Atikokan',1970,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1411,'America/Winnipeg',1970,'Winn',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-4:00'),(1412,'America/Winnipeg',1987,'Winn',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-4:00'),(1413,'America/Winnipeg',2005,'Winn',-360,0,4,1,0,0,'-4:00',10,-1,0,0,'-4:00'),(1414,'America/Winnipeg',2006,'Canada',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1415,'America/Winnipeg',2007,'Canada',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1416,'America/Regina',1970,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1417,'America/Swift_Current',1970,'Swift',-420,0,4,-1,0,0,'-5:00',9,-1,0,0,'-6:00'),(1418,'America/Swift_Current',1972,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1419,'America/Edmonton',1970,'Edm',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1420,'America/Edmonton',1987,'Canada',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1421,'America/Edmonton',2007,'Canada',-420,60,3,8,0,0,'-5:00',11,1,0,0,'-6:00'),(1422,'America/Vancouver',1970,'Vanc',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1423,'America/Vancouver',1987,'Canada',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1424,'America/Vancouver',2007,'Canada',-480,60,3,8,0,0,'-6:00',11,1,0,0,'-7:00'),(1425,'America/Dawson_Creek',1970,'Vanc',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1426,'America/Dawson_Creek',1972,'',-420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1427,'America/Pangnirtung',1970,'NT_YK',-240,120,4,-1,0,0,'-4:00',10,-1,0,0,'-3:00'),(1428,'America/Pangnirtung',1980,'NT_YK',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1429,'America/Pangnirtung',1987,'NT_YK',-240,60,4,1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1430,'America/Pangnirtung',1995,'Canada',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1431,'America/Pangnirtung',1999,'Canada',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1432,'America/Pangnirtung',2000,'Canada',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1433,'America/Pangnirtung',2007,'Canada',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1434,'America/Iqaluit',1970,'NT_YK',-300,120,4,-1,0,0,'-5:00',10,-1,0,0,'-4:00'),(1435,'America/Iqaluit',1980,'NT_YK',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1436,'America/Iqaluit',1987,'NT_YK',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1437,'America/Iqaluit',1999,'Canada',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1438,'America/Iqaluit',2000,'Canada',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1439,'America/Iqaluit',2007,'Canada',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1440,'America/Resolute',1970,'NT_YK',-360,120,4,-1,0,0,'-6:00',10,-1,0,0,'-5:00'),(1441,'America/Resolute',1980,'NT_YK',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1442,'America/Resolute',1987,'NT_YK',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1443,'America/Resolute',2000,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1444,'America/Resolute',2001,'Canada',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1445,'America/Resolute',2006,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1446,'America/Rankin_Inlet',1970,'NT_YK',-360,120,4,-1,0,0,'-6:00',10,-1,0,0,'-5:00'),(1447,'America/Rankin_Inlet',1980,'NT_YK',-360,60,4,-1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1448,'America/Rankin_Inlet',1987,'NT_YK',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1449,'America/Rankin_Inlet',2000,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1450,'America/Rankin_Inlet',2001,'Canada',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1451,'America/Rankin_Inlet',2007,'Canada',-360,60,3,8,0,0,'-4:00',11,1,0,0,'-5:00'),(1452,'America/Cambridge_Bay',1970,'NT_YK',-420,120,4,-1,0,0,'-7:00',10,-1,0,0,'-6:00'),(1453,'America/Cambridge_Bay',1980,'NT_YK',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1454,'America/Cambridge_Bay',1987,'NT_YK',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1455,'America/Cambridge_Bay',1999,'Canada',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1456,'America/Cambridge_Bay',2000,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1457,'America/Cambridge_Bay',2001,'Canada',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1458,'America/Cambridge_Bay',2007,'Canada',-420,60,3,8,0,0,'-5:00',11,1,0,0,'-6:00'),(1459,'America/Yellowknife',1970,'NT_YK',-420,120,4,-1,0,0,'-7:00',10,-1,0,0,'-6:00'),(1460,'America/Yellowknife',1980,'Canada',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1461,'America/Yellowknife',1987,'Canada',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1462,'America/Yellowknife',2007,'Canada',-420,60,3,8,0,0,'-5:00',11,1,0,0,'-6:00'),(1463,'America/Inuvik',1970,'NT_YK',-480,120,4,-1,0,0,'-8:00',10,-1,0,0,'-7:00'),(1464,'America/Inuvik',1979,'NT_YK',-420,120,4,-1,0,0,'-7:00',10,-1,0,0,'-6:00'),(1465,'America/Inuvik',1980,'Canada',-420,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1466,'America/Inuvik',1987,'Canada',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1467,'America/Inuvik',2007,'Canada',-420,60,3,8,0,0,'-5:00',11,1,0,0,'-6:00'),(1468,'America/Whitehorse',1970,'NT_YK',-480,120,4,-1,0,0,'-8:00',10,-1,0,0,'-7:00'),(1469,'America/Whitehorse',1980,'Canada',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1470,'America/Whitehorse',1987,'Canada',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1471,'America/Whitehorse',2007,'Canada',-480,60,3,8,0,0,'-6:00',11,1,0,0,'-7:00'),(1472,'America/Dawson',1970,'NT_YK',-540,120,4,-1,0,0,'-9:00',10,-1,0,0,'-8:00'),(1473,'America/Dawson',1973,'NT_YK',-480,120,4,-1,0,0,'-8:00',10,-1,0,0,'-7:00'),(1474,'America/Dawson',1980,'Canada',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1475,'America/Dawson',1987,'Canada',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1476,'America/Dawson',2007,'Canada',-480,60,3,8,0,0,'-6:00',11,1,0,0,'-7:00'),(1477,'America/Cancun',1970,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1478,'America/Cancun',1981,'Mexico',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1479,'America/Cancun',1996,'Mexico',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1480,'America/Cancun',1998,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1481,'America/Cancun',2001,'Mexico',-360,60,5,1,0,0,'-4:00',9,-1,0,0,'-5:00'),(1482,'America/Cancun',2002,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1483,'America/Merida',1970,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1484,'America/Merida',1981,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1485,'America/Merida',1982,'Mexico',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1486,'America/Merida',1996,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1487,'America/Merida',2001,'Mexico',-360,60,5,1,0,0,'-4:00',9,-1,0,0,'-5:00'),(1488,'America/Merida',2002,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1489,'America/Monterrey',1970,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1490,'America/Monterrey',1988,'US',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1491,'America/Monterrey',1989,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1492,'America/Monterrey',2001,'Mexico',-360,60,5,1,0,0,'-4:00',9,-1,0,0,'-5:00'),(1493,'America/Monterrey',2002,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1494,'America/Mexico_City',1970,'Mexico',-360,60,2,12,-1,0,'-6:00',7,30,-1,0,'-7:00'),(1495,'America/Mexico_City',1996,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1496,'America/Mexico_City',2001,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1497,'America/Mexico_City',2002,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1498,'America/Chihuahua',1970,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1499,'America/Chihuahua',1996,'Mexico',-360,60,4,1,0,0,'-4:00',10,-1,0,0,'-5:00'),(1500,'America/Chihuahua',1998,'Mexico',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1501,'America/Chihuahua',2001,'Mexico',-420,60,5,1,0,0,'-5:00',9,-1,0,0,'-6:00'),(1502,'America/Chihuahua',2002,'Mexico',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1503,'America/Hermosillo',1970,'Mexico',-420,60,2,12,-1,0,'-7:00',7,30,-1,0,'-8:00'),(1504,'America/Hermosillo',1996,'Mexico',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1505,'America/Hermosillo',1999,'',-420,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1506,'America/Mazatlan',1970,'Mexico',-420,60,2,12,-1,0,'-7:00',7,30,-1,0,'-8:00'),(1507,'America/Mazatlan',1996,'Mexico',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1508,'America/Mazatlan',2001,'Mexico',-420,60,5,1,0,0,'-5:00',9,-1,0,0,'-6:00'),(1509,'America/Mazatlan',2002,'Mexico',-420,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1510,'America/Tijuana',1970,'',-480,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1511,'America/Tijuana',1976,'US',-480,60,4,-1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1512,'America/Tijuana',1987,'US',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1513,'America/Tijuana',1996,'Mexico',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1514,'America/Tijuana',2001,'US',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1515,'America/Tijuana',2002,'Mexico',-480,60,4,1,0,0,'-6:00',10,-1,0,0,'-7:00'),(1516,'America/Anguilla',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1517,'America/Antigua',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1518,'America/Nassau',1970,'Bahamas',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1519,'America/Nassau',1976,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1520,'America/Nassau',1987,'US',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1521,'America/Nassau',2007,'US',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1522,'America/Barbados',1970,'Barb',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1523,'America/Barbados',1977,'Barb',-240,60,6,12,-1,0,'-2:00',10,1,0,0,'-3:00'),(1524,'America/Barbados',1978,'Barb',-240,60,4,15,0,0,'-2:00',10,1,0,0,'-3:00'),(1525,'America/Barbados',1979,'Barb',-240,60,4,15,0,0,'-2:00',9,30,-1,0,'-3:00'),(1526,'America/Barbados',1980,'Barb',-240,60,4,15,0,0,'-2:00',9,25,-1,0,'-3:00'),(1527,'America/Barbados',1981,'Barb',-240,0,4,15,0,0,'-2:00',9,25,-1,0,'-3:00'),(1528,'America/Belize',1970,'Belize',-360,0,12,31,-1,0,'06:00',2,9,0,0,'-7:00'),(1529,'America/Belize',1973,'Belize',-360,60,12,5,-1,0,'-6:00',1,1,-1,0,'05:00'),(1530,'America/Belize',1974,'Belize',-360,0,12,31,-1,0,'06:00',2,9,-1,0,'-7:00'),(1531,'America/Belize',1982,'Belize',-360,60,12,18,-1,0,'-6:00',1,1,-1,0,'05:00'),(1532,'America/Belize',1983,'Belize',-360,0,12,31,-1,0,'06:00',2,12,-1,0,'-7:00'),(1533,'Atlantic/Bermuda',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1534,'Atlantic/Bermuda',1974,'Bahamas',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1535,'Atlantic/Bermuda',1976,'US',-240,60,4,-1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1536,'Atlantic/Bermuda',1987,'US',-240,60,4,1,0,0,'-2:00',10,-1,0,0,'-3:00'),(1537,'Atlantic/Bermuda',2007,'US',-240,60,3,8,0,0,'-2:00',11,1,0,0,'-3:00'),(1538,'America/Cayman',1970,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1539,'America/Costa_Rica',1970,'CR',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1540,'America/Costa_Rica',1979,'CR',-360,60,2,-1,0,0,'-6:00',6,1,0,0,'-7:00'),(1541,'America/Costa_Rica',1991,'CR',-360,60,1,15,6,0,'-6:00',7,1,-1,0,'-7:00'),(1542,'America/Costa_Rica',1992,'CR',-360,60,1,15,6,0,'-6:00',3,15,-1,0,'-7:00'),(1543,'America/Costa_Rica',1993,'CR',-360,0,1,15,6,0,'-6:00',3,15,-1,0,'-7:00'),(1544,'America/Havana',1970,'Cuba',-300,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1545,'America/Havana',1972,'Cuba',-300,60,4,-1,0,0,'-5:00',10,8,-1,0,'-6:00'),(1546,'America/Havana',1975,'Cuba',-300,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1547,'America/Havana',1978,'Cuba',-300,60,5,7,-1,0,'-5:00',10,8,0,0,'-6:00'),(1548,'America/Havana',1979,'Cuba',-300,60,3,15,0,0,'-5:00',10,8,0,0,'-6:00'),(1549,'America/Havana',1981,'Cuba',-300,60,5,5,0,0,'-5:00',10,8,0,0,'-6:00'),(1550,'America/Havana',1986,'Cuba',-300,60,3,14,0,0,'-5:00',10,8,0,0,'-6:00'),(1551,'America/Havana',1990,'Cuba',-300,60,4,1,0,0,'-5:00',10,8,0,0,'-6:00'),(1552,'America/Havana',1991,'Cuba',-300,60,4,1,0,0,'-5:00',10,8,0,0,'-5:00'),(1553,'America/Havana',1996,'Cuba',-300,60,4,1,0,0,'-5:00',10,6,-1,0,'-5:00'),(1554,'America/Havana',1997,'Cuba',-300,60,4,1,0,0,'-5:00',10,12,-1,0,'-5:00'),(1555,'America/Havana',1998,'Cuba',-300,60,3,-1,0,0,'-5:00',10,-1,0,0,'-5:00'),(1556,'America/Havana',2000,'Cuba',-300,60,4,1,0,0,'-5:00',10,-1,0,0,'-5:00'),(1557,'America/Havana',2004,'Cuba',-300,60,4,1,0,0,'-5:00',1,1,-1,0,'06:00'),(1558,'America/Havana',2006,'Cuba',-300,60,4,1,0,0,'-5:00',10,-1,0,0,'-5:00'),(1559,'America/Havana',2007,'Cuba',-300,60,3,8,0,0,'-5:00',10,-1,0,0,'-5:00'),(1560,'America/Dominica',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1561,'America/Santo_Domingo',1970,'DR',-300,30,10,-1,0,0,'-5:00',2,21,-1,0,'-6:00'),(1562,'America/Santo_Domingo',1971,'DR',-300,30,10,-1,0,0,'-5:00',1,20,-1,0,'-6:00'),(1563,'America/Santo_Domingo',1972,'DR',-300,30,10,-1,0,0,'-5:00',1,21,-1,0,'-6:00'),(1564,'America/Santo_Domingo',1974,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1565,'America/El_Salvador',1970,'Salv',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1566,'America/El_Salvador',1987,'Salv',-360,60,5,1,0,0,'-6:00',9,-1,0,0,'-7:00'),(1567,'America/El_Salvador',1988,'Salv',-360,0,5,1,0,0,'-6:00',9,-1,0,0,'-7:00'),(1568,'America/Grenada',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1569,'America/Guadeloupe',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1570,'America/Guatemala',1970,'Guat',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1571,'America/Guatemala',1973,'Guat',-360,60,11,25,-1,0,'-6:00',1,1,-1,0,'05:00'),(1572,'America/Guatemala',1974,'Guat',-360,0,12,31,-1,0,'06:00',2,24,-1,0,'-7:00'),(1573,'America/Guatemala',1983,'Guat',-360,60,5,21,-1,0,'-6:00',9,22,-1,0,'-7:00'),(1574,'America/Guatemala',1991,'Guat',-360,60,3,23,-1,0,'-6:00',9,7,-1,0,'-7:00'),(1575,'America/Guatemala',2006,'Guat',-360,60,4,30,-1,0,'-6:00',10,1,-1,0,'-7:00'),(1576,'America/Guatemala',2007,'Guat',-360,0,4,30,-1,0,'-6:00',10,1,-1,0,'-7:00'),(1577,'America/Port-au-Prince',1970,'Haiti',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1578,'America/Port-au-Prince',1983,'Haiti',-300,60,5,8,-1,0,'-5:00',10,-1,0,0,'-6:00'),(1579,'America/Port-au-Prince',1984,'Haiti',-300,60,4,-1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1580,'America/Port-au-Prince',1988,'Haiti',-300,60,4,1,0,0,'-4:00',10,-1,0,0,'-4:00'),(1581,'America/Port-au-Prince',2005,'Haiti',-300,60,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1582,'America/Port-au-Prince',2006,'Haiti',-300,0,4,1,0,0,'-5:00',10,-1,0,0,'-6:00'),(1583,'America/Tegucigalpa',1970,'Hond',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1584,'America/Tegucigalpa',1987,'Hond',-360,60,5,1,0,0,'-6:00',9,-1,0,0,'-7:00'),(1585,'America/Tegucigalpa',2006,'Hond',-360,60,5,1,0,0,'-6:00',8,1,1,0,'-7:00'),(1586,'America/Tegucigalpa',2007,'Hond',-360,0,5,1,0,0,'-6:00',8,1,1,0,'-7:00'),(1587,'America/Jamaica',1970,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1588,'America/Jamaica',1974,'US',-300,60,1,6,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1589,'America/Jamaica',1975,'US',-300,60,2,23,-1,0,'-3:00',10,-1,0,0,'-4:00'),(1590,'America/Jamaica',1976,'US',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1591,'America/Jamaica',1984,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1592,'America/Martinique',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1593,'America/Martinique',1980,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1594,'America/Montserrat',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1595,'America/Managua',1970,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1596,'America/Managua',1973,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1597,'America/Managua',1975,'Nic',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1598,'America/Managua',1979,'Nic',-360,60,3,16,0,0,'-6:00',6,23,1,0,'-7:00'),(1599,'America/Managua',1992,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1600,'America/Managua',1993,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1601,'America/Managua',1997,'Nic',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1602,'America/Managua',2005,'Nic',-360,60,4,10,-1,0,'-6:00',10,1,0,0,'-7:00'),(1603,'America/Managua',2006,'Nic',-360,60,4,30,-1,0,'-4:00',10,1,0,0,'-6:00'),(1604,'America/Managua',2007,'Nic',-360,0,4,30,-1,0,'-4:00',10,1,0,0,'-6:00'),(1605,'America/Panama',1970,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1606,'America/Puerto_Rico',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1607,'America/St_Kitts',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1608,'America/St_Lucia',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1609,'America/Miquelon',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1610,'America/Miquelon',1980,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1611,'America/Miquelon',1987,'Canada',-180,60,4,1,0,0,'-1:00',10,-1,0,0,'-2:00'),(1612,'America/Miquelon',2007,'Canada',-180,60,3,8,0,0,'-1:00',11,1,0,0,'-2:00'),(1613,'America/St_Vincent',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1614,'America/Grand_Turk',1970,'TC',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1615,'America/Grand_Turk',1979,'TC',-300,60,4,-1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1616,'America/Grand_Turk',1987,'TC',-300,60,4,1,0,0,'-3:00',10,-1,0,0,'-4:00'),(1617,'America/Grand_Turk',2007,'TC',-300,60,3,8,0,0,'-3:00',11,1,0,0,'-4:00'),(1618,'America/Tortola',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1619,'America/St_Thomas',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1620,'America/Argentina/Buenos_Aires',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1621,'America/Argentina/Buenos_Aires',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1622,'America/Argentina/Buenos_Aires',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1623,'America/Argentina/Buenos_Aires',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1624,'America/Argentina/Buenos_Aires',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1625,'America/Argentina/Buenos_Aires',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1626,'America/Argentina/Buenos_Aires',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1627,'America/Argentina/Cordoba',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1628,'America/Argentina/Cordoba',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1629,'America/Argentina/Cordoba',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1630,'America/Argentina/Cordoba',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1631,'America/Argentina/Cordoba',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1632,'America/Argentina/Cordoba',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1633,'America/Argentina/Cordoba',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1634,'America/Argentina/Tucuman',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1635,'America/Argentina/Tucuman',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1636,'America/Argentina/Tucuman',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1637,'America/Argentina/Tucuman',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1638,'America/Argentina/Tucuman',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1639,'America/Argentina/Tucuman',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1640,'America/Argentina/Tucuman',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1641,'America/Argentina/La_Rioja',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1642,'America/Argentina/La_Rioja',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1643,'America/Argentina/La_Rioja',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1644,'America/Argentina/La_Rioja',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1645,'America/Argentina/La_Rioja',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1646,'America/Argentina/La_Rioja',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1647,'America/Argentina/La_Rioja',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1648,'America/Argentina/San_Juan',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1649,'America/Argentina/San_Juan',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1650,'America/Argentina/San_Juan',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1651,'America/Argentina/San_Juan',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1652,'America/Argentina/San_Juan',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1653,'America/Argentina/San_Juan',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1654,'America/Argentina/San_Juan',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1655,'America/Argentina/Jujuy',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1656,'America/Argentina/Jujuy',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1657,'America/Argentina/Jujuy',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1658,'America/Argentina/Jujuy',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1659,'America/Argentina/Jujuy',1990,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1660,'America/Argentina/Jujuy',1991,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1661,'America/Argentina/Jujuy',1992,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1662,'America/Argentina/Jujuy',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1663,'America/Argentina/Jujuy',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1664,'America/Argentina/Jujuy',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1665,'America/Argentina/Catamarca',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1666,'America/Argentina/Catamarca',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1667,'America/Argentina/Catamarca',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1668,'America/Argentina/Catamarca',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1669,'America/Argentina/Catamarca',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1670,'America/Argentina/Catamarca',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1671,'America/Argentina/Catamarca',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1672,'America/Argentina/Mendoza',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1673,'America/Argentina/Mendoza',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1674,'America/Argentina/Mendoza',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1675,'America/Argentina/Mendoza',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1676,'America/Argentina/Mendoza',1990,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1677,'America/Argentina/Mendoza',1992,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1678,'America/Argentina/Mendoza',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1679,'America/Argentina/Mendoza',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1680,'America/Argentina/Mendoza',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1681,'America/Argentina/Rio_Gallegos',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1682,'America/Argentina/Rio_Gallegos',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1683,'America/Argentina/Rio_Gallegos',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1684,'America/Argentina/Rio_Gallegos',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1685,'America/Argentina/Rio_Gallegos',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1686,'America/Argentina/Rio_Gallegos',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1687,'America/Argentina/Rio_Gallegos',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1688,'America/Argentina/Ushuaia',1970,'Arg',-180,0,12,31,-1,0,'09:00',4,1,0,0,'-4:00'),(1689,'America/Argentina/Ushuaia',1974,'Arg',-180,60,1,23,-1,0,'-3:00',5,1,-1,0,'-4:00'),(1690,'America/Argentina/Ushuaia',1988,'Arg',-180,60,12,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1691,'America/Argentina/Ushuaia',1989,'Arg',-180,60,10,15,0,0,'-3:00',3,1,0,0,'-4:00'),(1692,'America/Argentina/Ushuaia',1993,'Arg',-180,0,12,31,-1,0,'09:00',3,1,0,0,'-4:00'),(1693,'America/Argentina/Ushuaia',1999,'Arg',-240,60,10,1,0,0,'-4:00',1,1,-1,0,'07:00'),(1694,'America/Argentina/Ushuaia',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1695,'America/Aruba',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1696,'America/La_Paz',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1697,'America/Noronha',1970,'Brazil',-120,0,12,31,-1,0,'10:00',3,1,-1,0,'-3:00'),(1698,'America/Noronha',1985,'Brazil',-120,60,11,2,-1,0,'-2:00',1,1,-1,0,'09:00'),(1699,'America/Noronha',1986,'Brazil',-120,60,10,25,-1,0,'-2:00',3,15,-1,0,'-3:00'),(1700,'America/Noronha',1987,'Brazil',-120,60,10,25,-1,0,'-2:00',2,14,-1,0,'-3:00'),(1701,'America/Noronha',1988,'Brazil',-120,60,10,16,-1,0,'-2:00',2,7,-1,0,'-3:00'),(1702,'America/Noronha',1989,'Brazil',-120,60,10,15,-1,0,'-2:00',1,29,-1,0,'-3:00'),(1703,'America/Noronha',1990,'',-120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1704,'America/Noronha',1999,'Brazil',-120,60,10,3,-1,0,'-2:00',2,21,-1,0,'-3:00'),(1705,'America/Noronha',2000,'',-120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1706,'America/Noronha',2001,'Brazil',-120,60,10,8,0,0,'-2:00',2,15,0,0,'-3:00'),(1707,'America/Noronha',2002,'',-120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1708,'America/Belem',1970,'Brazil',-180,0,12,31,-1,0,'09:00',3,1,-1,0,'-4:00'),(1709,'America/Belem',1985,'Brazil',-180,60,11,2,-1,0,'-3:00',1,1,-1,0,'08:00'),(1710,'America/Belem',1986,'Brazil',-180,60,10,25,-1,0,'-3:00',3,15,-1,0,'-4:00'),(1711,'America/Belem',1987,'Brazil',-180,60,10,25,-1,0,'-3:00',2,14,-1,0,'-4:00'),(1712,'America/Belem',1988,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1713,'America/Fortaleza',1970,'Brazil',-180,0,12,31,-1,0,'09:00',3,1,-1,0,'-4:00'),(1714,'America/Fortaleza',1985,'Brazil',-180,60,11,2,-1,0,'-3:00',1,1,-1,0,'08:00'),(1715,'America/Fortaleza',1986,'Brazil',-180,60,10,25,-1,0,'-3:00',3,15,-1,0,'-4:00'),(1716,'America/Fortaleza',1987,'Brazil',-180,60,10,25,-1,0,'-3:00',2,14,-1,0,'-4:00'),(1717,'America/Fortaleza',1988,'Brazil',-180,60,10,16,-1,0,'-3:00',2,7,-1,0,'-4:00'),(1718,'America/Fortaleza',1989,'Brazil',-180,60,10,15,-1,0,'-3:00',1,29,-1,0,'-4:00'),(1719,'America/Fortaleza',1990,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1720,'America/Fortaleza',1999,'Brazil',-180,60,10,3,-1,0,'-3:00',2,21,-1,0,'-4:00'),(1721,'America/Fortaleza',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1722,'America/Fortaleza',2001,'Brazil',-180,60,10,8,0,0,'-3:00',2,15,0,0,'-4:00'),(1723,'America/Fortaleza',2002,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1724,'America/Recife',1970,'Brazil',-180,0,12,31,-1,0,'09:00',3,1,-1,0,'-4:00'),(1725,'America/Recife',1985,'Brazil',-180,60,11,2,-1,0,'-3:00',1,1,-1,0,'08:00'),(1726,'America/Recife',1986,'Brazil',-180,60,10,25,-1,0,'-3:00',3,15,-1,0,'-4:00'),(1727,'America/Recife',1987,'Brazil',-180,60,10,25,-1,0,'-3:00',2,14,-1,0,'-4:00'),(1728,'America/Recife',1988,'Brazil',-180,60,10,16,-1,0,'-3:00',2,7,-1,0,'-4:00'),(1729,'America/Recife',1989,'Brazil',-180,60,10,15,-1,0,'-3:00',1,29,-1,0,'-4:00'),(1730,'America/Recife',1990,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1731,'America/Recife',1999,'Brazil',-180,60,10,3,-1,0,'-3:00',2,21,-1,0,'-4:00'),(1732,'America/Recife',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1733,'America/Recife',2001,'Brazil',-180,60,10,8,0,0,'-3:00',2,15,0,0,'-4:00'),(1734,'America/Recife',2002,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1735,'America/Araguaina',1970,'Brazil',-180,0,12,31,-1,0,'09:00',3,1,-1,0,'-4:00'),(1736,'America/Araguaina',1985,'Brazil',-180,60,11,2,-1,0,'-3:00',1,1,-1,0,'08:00'),(1737,'America/Araguaina',1986,'Brazil',-180,60,10,25,-1,0,'-3:00',3,15,-1,0,'-4:00'),(1738,'America/Araguaina',1987,'Brazil',-180,60,10,25,-1,0,'-3:00',2,14,-1,0,'-4:00'),(1739,'America/Araguaina',1988,'Brazil',-180,60,10,16,-1,0,'-3:00',2,7,-1,0,'-4:00'),(1740,'America/Araguaina',1989,'Brazil',-180,60,10,15,-1,0,'-3:00',1,29,-1,0,'-4:00'),(1741,'America/Araguaina',1990,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1742,'America/Araguaina',1995,'Brazil',-180,60,10,11,0,0,'-3:00',2,15,0,0,'-4:00'),(1743,'America/Araguaina',1996,'Brazil',-180,60,10,6,-1,0,'-3:00',2,11,-1,0,'-4:00'),(1744,'America/Araguaina',1997,'Brazil',-180,60,10,6,-1,0,'-3:00',2,16,-1,0,'-4:00'),(1745,'America/Araguaina',1998,'Brazil',-180,60,10,11,-1,0,'-3:00',3,1,-1,0,'-4:00'),(1746,'America/Araguaina',1999,'Brazil',-180,60,10,3,-1,0,'-3:00',2,21,-1,0,'-4:00'),(1747,'America/Araguaina',2000,'Brazil',-180,60,10,8,0,0,'-3:00',2,27,-1,0,'-4:00'),(1748,'America/Araguaina',2001,'Brazil',-180,60,10,8,0,0,'-3:00',2,15,0,0,'-4:00'),(1749,'America/Araguaina',2002,'Brazil',-180,60,11,3,-1,0,'-3:00',2,15,0,0,'-4:00'),(1750,'America/Araguaina',2003,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1751,'America/Maceio',1970,'Brazil',-180,0,12,31,-1,0,'09:00',3,1,-1,0,'-4:00'),(1752,'America/Maceio',1985,'Brazil',-180,60,11,2,-1,0,'-3:00',1,1,-1,0,'08:00'),(1753,'America/Maceio',1986,'Brazil',-180,60,10,25,-1,0,'-3:00',3,15,-1,0,'-4:00'),(1754,'America/Maceio',1987,'Brazil',-180,60,10,25,-1,0,'-3:00',2,14,-1,0,'-4:00'),(1755,'America/Maceio',1988,'Brazil',-180,60,10,16,-1,0,'-3:00',2,7,-1,0,'-4:00'),(1756,'America/Maceio',1989,'Brazil',-180,60,10,15,-1,0,'-3:00',1,29,-1,0,'-4:00'),(1757,'America/Maceio',1990,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1758,'America/Maceio',1995,'Brazil',-180,60,10,11,0,0,'-3:00',2,15,0,0,'-4:00'),(1759,'America/Maceio',1996,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1760,'America/Maceio',1999,'Brazil',-180,60,10,3,-1,0,'-3:00',2,21,-1,0,'-4:00'),(1761,'America/Maceio',2000,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1762,'America/Maceio',2001,'Brazil',-180,60,10,8,0,0,'-3:00',2,15,0,0,'-4:00'),(1763,'America/Maceio',2002,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1764,'America/Bahia',1970,'Brazil',-180,0,12,31,-1,0,'09:00',3,1,-1,0,'-4:00'),(1765,'America/Bahia',1985,'Brazil',-180,60,11,2,-1,0,'-3:00',1,1,-1,0,'08:00'),(1766,'America/Bahia',1986,'Brazil',-180,60,10,25,-1,0,'-3:00',3,15,-1,0,'-4:00'),(1767,'America/Bahia',1987,'Brazil',-180,60,10,25,-1,0,'-3:00',2,14,-1,0,'-4:00'),(1768,'America/Bahia',1988,'Brazil',-180,60,10,16,-1,0,'-3:00',2,7,-1,0,'-4:00'),(1769,'America/Bahia',1989,'Brazil',-180,60,10,15,-1,0,'-3:00',1,29,-1,0,'-4:00'),(1770,'America/Bahia',1990,'Brazil',-180,60,10,21,-1,0,'-3:00',2,11,-1,0,'-4:00'),(1771,'America/Bahia',1991,'Brazil',-180,60,10,20,-1,0,'-3:00',2,17,-1,0,'-4:00'),(1772,'America/Bahia',1992,'Brazil',-180,60,10,25,-1,0,'-3:00',2,9,-1,0,'-4:00'),(1773,'America/Bahia',1993,'Brazil',-180,60,10,11,0,0,'-3:00',1,31,-1,0,'-4:00'),(1774,'America/Bahia',1994,'Brazil',-180,60,10,11,0,0,'-3:00',2,15,0,0,'-4:00'),(1775,'America/Bahia',1996,'Brazil',-180,60,10,6,-1,0,'-3:00',2,11,-1,0,'-4:00'),(1776,'America/Bahia',1997,'Brazil',-180,60,10,6,-1,0,'-3:00',2,16,-1,0,'-4:00'),(1777,'America/Bahia',1998,'Brazil',-180,60,10,11,-1,0,'-3:00',3,1,-1,0,'-4:00'),(1778,'America/Bahia',1999,'Brazil',-180,60,10,3,-1,0,'-3:00',2,21,-1,0,'-4:00'),(1779,'America/Bahia',2000,'Brazil',-180,60,10,8,0,0,'-3:00',2,27,-1,0,'-4:00'),(1780,'America/Bahia',2001,'Brazil',-180,60,10,8,0,0,'-3:00',2,15,0,0,'-4:00'),(1781,'America/Bahia',2002,'Brazil',-180,60,11,3,-1,0,'-3:00',2,15,0,0,'-4:00'),(1782,'America/Bahia',2003,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1783,'America/Sao_Paulo',1970,'Brazil',-180,0,12,31,-1,0,'09:00',3,1,-1,0,'-4:00'),(1784,'America/Sao_Paulo',1985,'Brazil',-180,60,11,2,-1,0,'-3:00',1,1,-1,0,'08:00'),(1785,'America/Sao_Paulo',1986,'Brazil',-180,60,10,25,-1,0,'-3:00',3,15,-1,0,'-4:00'),(1786,'America/Sao_Paulo',1987,'Brazil',-180,60,10,25,-1,0,'-3:00',2,14,-1,0,'-4:00'),(1787,'America/Sao_Paulo',1988,'Brazil',-180,60,10,16,-1,0,'-3:00',2,7,-1,0,'-4:00'),(1788,'America/Sao_Paulo',1989,'Brazil',-180,60,10,15,-1,0,'-3:00',1,29,-1,0,'-4:00'),(1789,'America/Sao_Paulo',1990,'Brazil',-180,60,10,21,-1,0,'-3:00',2,11,-1,0,'-4:00'),(1790,'America/Sao_Paulo',1991,'Brazil',-180,60,10,20,-1,0,'-3:00',2,17,-1,0,'-4:00'),(1791,'America/Sao_Paulo',1992,'Brazil',-180,60,10,25,-1,0,'-3:00',2,9,-1,0,'-4:00'),(1792,'America/Sao_Paulo',1993,'Brazil',-180,60,10,11,0,0,'-3:00',1,31,-1,0,'-4:00'),(1793,'America/Sao_Paulo',1994,'Brazil',-180,60,10,11,0,0,'-3:00',2,15,0,0,'-4:00'),(1794,'America/Sao_Paulo',1996,'Brazil',-180,60,10,6,-1,0,'-3:00',2,11,-1,0,'-4:00'),(1795,'America/Sao_Paulo',1997,'Brazil',-180,60,10,6,-1,0,'-3:00',2,16,-1,0,'-4:00'),(1796,'America/Sao_Paulo',1998,'Brazil',-180,60,10,11,-1,0,'-3:00',3,1,-1,0,'-4:00'),(1797,'America/Sao_Paulo',1999,'Brazil',-180,60,10,3,-1,0,'-3:00',2,21,-1,0,'-4:00'),(1798,'America/Sao_Paulo',2000,'Brazil',-180,60,10,8,0,0,'-3:00',2,27,-1,0,'-4:00'),(1799,'America/Sao_Paulo',2001,'Brazil',-180,60,10,8,0,0,'-3:00',2,15,0,0,'-4:00'),(1800,'America/Sao_Paulo',2002,'Brazil',-180,60,11,3,-1,0,'-3:00',2,15,0,0,'-4:00'),(1801,'America/Sao_Paulo',2003,'Brazil',-180,60,10,19,-1,0,'-3:00',2,15,0,0,'-4:00'),(1802,'America/Sao_Paulo',2004,'Brazil',-180,60,11,2,-1,0,'-3:00',2,15,0,0,'-4:00'),(1803,'America/Sao_Paulo',2005,'Brazil',-180,60,10,16,-1,0,'-3:00',2,15,0,0,'-4:00'),(1804,'America/Sao_Paulo',2006,'Brazil',-180,60,11,5,-1,0,'-3:00',2,15,0,0,'-4:00'),(1805,'America/Sao_Paulo',2007,'Brazil',-180,60,10,8,0,0,'-3:00',2,25,-1,0,'-4:00'),(1806,'America/Sao_Paulo',2008,'Brazil',-180,0,10,8,0,0,'-3:00',2,25,-1,0,'-4:00'),(1807,'America/Campo_Grande',1970,'Brazil',-240,0,12,31,-1,0,'08:00',3,1,-1,0,'-5:00'),(1808,'America/Campo_Grande',1985,'Brazil',-240,60,11,2,-1,0,'-4:00',1,1,-1,0,'07:00'),(1809,'America/Campo_Grande',1986,'Brazil',-240,60,10,25,-1,0,'-4:00',3,15,-1,0,'-5:00'),(1810,'America/Campo_Grande',1987,'Brazil',-240,60,10,25,-1,0,'-4:00',2,14,-1,0,'-5:00'),(1811,'America/Campo_Grande',1988,'Brazil',-240,60,10,16,-1,0,'-4:00',2,7,-1,0,'-5:00'),(1812,'America/Campo_Grande',1989,'Brazil',-240,60,10,15,-1,0,'-4:00',1,29,-1,0,'-5:00'),(1813,'America/Campo_Grande',1990,'Brazil',-240,60,10,21,-1,0,'-4:00',2,11,-1,0,'-5:00'),(1814,'America/Campo_Grande',1991,'Brazil',-240,60,10,20,-1,0,'-4:00',2,17,-1,0,'-5:00'),(1815,'America/Campo_Grande',1992,'Brazil',-240,60,10,25,-1,0,'-4:00',2,9,-1,0,'-5:00'),(1816,'America/Campo_Grande',1993,'Brazil',-240,60,10,11,0,0,'-4:00',1,31,-1,0,'-5:00'),(1817,'America/Campo_Grande',1994,'Brazil',-240,60,10,11,0,0,'-4:00',2,15,0,0,'-5:00'),(1818,'America/Campo_Grande',1996,'Brazil',-240,60,10,6,-1,0,'-4:00',2,11,-1,0,'-5:00'),(1819,'America/Campo_Grande',1997,'Brazil',-240,60,10,6,-1,0,'-4:00',2,16,-1,0,'-5:00'),(1820,'America/Campo_Grande',1998,'Brazil',-240,60,10,11,-1,0,'-4:00',3,1,-1,0,'-5:00'),(1821,'America/Campo_Grande',1999,'Brazil',-240,60,10,3,-1,0,'-4:00',2,21,-1,0,'-5:00'),(1822,'America/Campo_Grande',2000,'Brazil',-240,60,10,8,0,0,'-4:00',2,27,-1,0,'-5:00'),(1823,'America/Campo_Grande',2001,'Brazil',-240,60,10,8,0,0,'-4:00',2,15,0,0,'-5:00'),(1824,'America/Campo_Grande',2002,'Brazil',-240,60,11,3,-1,0,'-4:00',2,15,0,0,'-5:00'),(1825,'America/Campo_Grande',2003,'Brazil',-240,60,10,19,-1,0,'-4:00',2,15,0,0,'-5:00'),(1826,'America/Campo_Grande',2004,'Brazil',-240,60,11,2,-1,0,'-4:00',2,15,0,0,'-5:00'),(1827,'America/Campo_Grande',2005,'Brazil',-240,60,10,16,-1,0,'-4:00',2,15,0,0,'-5:00'),(1828,'America/Campo_Grande',2006,'Brazil',-240,60,11,5,-1,0,'-4:00',2,15,0,0,'-5:00'),(1829,'America/Campo_Grande',2007,'Brazil',-240,60,10,8,0,0,'-4:00',2,25,-1,0,'-5:00'),(1830,'America/Campo_Grande',2008,'Brazil',-240,0,10,8,0,0,'-4:00',2,25,-1,0,'-5:00'),(1831,'America/Cuiaba',1970,'Brazil',-240,0,12,31,-1,0,'08:00',3,1,-1,0,'-5:00'),(1832,'America/Cuiaba',1985,'Brazil',-240,60,11,2,-1,0,'-4:00',1,1,-1,0,'07:00'),(1833,'America/Cuiaba',1986,'Brazil',-240,60,10,25,-1,0,'-4:00',3,15,-1,0,'-5:00'),(1834,'America/Cuiaba',1987,'Brazil',-240,60,10,25,-1,0,'-4:00',2,14,-1,0,'-5:00'),(1835,'America/Cuiaba',1988,'Brazil',-240,60,10,16,-1,0,'-4:00',2,7,-1,0,'-5:00'),(1836,'America/Cuiaba',1989,'Brazil',-240,60,10,15,-1,0,'-4:00',1,29,-1,0,'-5:00'),(1837,'America/Cuiaba',1990,'Brazil',-240,60,10,21,-1,0,'-4:00',2,11,-1,0,'-5:00'),(1838,'America/Cuiaba',1991,'Brazil',-240,60,10,20,-1,0,'-4:00',2,17,-1,0,'-5:00'),(1839,'America/Cuiaba',1992,'Brazil',-240,60,10,25,-1,0,'-4:00',2,9,-1,0,'-5:00'),(1840,'America/Cuiaba',1993,'Brazil',-240,60,10,11,0,0,'-4:00',1,31,-1,0,'-5:00'),(1841,'America/Cuiaba',1994,'Brazil',-240,60,10,11,0,0,'-4:00',2,15,0,0,'-5:00'),(1842,'America/Cuiaba',1996,'Brazil',-240,60,10,6,-1,0,'-4:00',2,11,-1,0,'-5:00'),(1843,'America/Cuiaba',1997,'Brazil',-240,60,10,6,-1,0,'-4:00',2,16,-1,0,'-5:00'),(1844,'America/Cuiaba',1998,'Brazil',-240,60,10,11,-1,0,'-4:00',3,1,-1,0,'-5:00'),(1845,'America/Cuiaba',1999,'Brazil',-240,60,10,3,-1,0,'-4:00',2,21,-1,0,'-5:00'),(1846,'America/Cuiaba',2000,'Brazil',-240,60,10,8,0,0,'-4:00',2,27,-1,0,'-5:00'),(1847,'America/Cuiaba',2001,'Brazil',-240,60,10,8,0,0,'-4:00',2,15,0,0,'-5:00'),(1848,'America/Cuiaba',2002,'Brazil',-240,60,11,3,-1,0,'-4:00',2,15,0,0,'-5:00'),(1849,'America/Cuiaba',2003,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1850,'America/Cuiaba',2004,'Brazil',-240,60,11,2,-1,0,'-4:00',2,15,0,0,'-5:00'),(1851,'America/Cuiaba',2005,'Brazil',-240,60,10,16,-1,0,'-4:00',2,15,0,0,'-5:00'),(1852,'America/Cuiaba',2006,'Brazil',-240,60,11,5,-1,0,'-4:00',2,15,0,0,'-5:00'),(1853,'America/Cuiaba',2007,'Brazil',-240,60,10,8,0,0,'-4:00',2,25,-1,0,'-5:00'),(1854,'America/Cuiaba',2008,'Brazil',-240,0,10,8,0,0,'-4:00',2,25,-1,0,'-5:00'),(1855,'America/Porto_Velho',1970,'Brazil',-240,0,12,31,-1,0,'08:00',3,1,-1,0,'-5:00'),(1856,'America/Porto_Velho',1985,'Brazil',-240,60,11,2,-1,0,'-4:00',1,1,-1,0,'07:00'),(1857,'America/Porto_Velho',1986,'Brazil',-240,60,10,25,-1,0,'-4:00',3,15,-1,0,'-5:00'),(1858,'America/Porto_Velho',1987,'Brazil',-240,60,10,25,-1,0,'-4:00',2,14,-1,0,'-5:00'),(1859,'America/Porto_Velho',1988,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1860,'America/Boa_Vista',1970,'Brazil',-240,0,12,31,-1,0,'08:00',3,1,-1,0,'-5:00'),(1861,'America/Boa_Vista',1985,'Brazil',-240,60,11,2,-1,0,'-4:00',1,1,-1,0,'07:00'),(1862,'America/Boa_Vista',1986,'Brazil',-240,60,10,25,-1,0,'-4:00',3,15,-1,0,'-5:00'),(1863,'America/Boa_Vista',1987,'Brazil',-240,60,10,25,-1,0,'-4:00',2,14,-1,0,'-5:00'),(1864,'America/Boa_Vista',1988,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1865,'America/Boa_Vista',1999,'Brazil',-240,60,10,3,-1,0,'-4:00',2,21,-1,0,'-5:00'),(1866,'America/Boa_Vista',2000,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1867,'America/Manaus',1970,'Brazil',-240,0,12,31,-1,0,'08:00',3,1,-1,0,'-5:00'),(1868,'America/Manaus',1985,'Brazil',-240,60,11,2,-1,0,'-4:00',1,1,-1,0,'07:00'),(1869,'America/Manaus',1986,'Brazil',-240,60,10,25,-1,0,'-4:00',3,15,-1,0,'-5:00'),(1870,'America/Manaus',1987,'Brazil',-240,60,10,25,-1,0,'-4:00',2,14,-1,0,'-5:00'),(1871,'America/Manaus',1988,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1872,'America/Manaus',1993,'Brazil',-240,60,10,11,0,0,'-4:00',1,31,-1,0,'-5:00'),(1873,'America/Manaus',1994,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1874,'America/Eirunepe',1970,'Brazil',-300,0,12,31,-1,0,'07:00',3,1,-1,0,'-6:00'),(1875,'America/Eirunepe',1985,'Brazil',-300,60,11,2,-1,0,'-5:00',1,1,-1,0,'06:00'),(1876,'America/Eirunepe',1986,'Brazil',-300,60,10,25,-1,0,'-5:00',3,15,-1,0,'-6:00'),(1877,'America/Eirunepe',1987,'Brazil',-300,60,10,25,-1,0,'-5:00',2,14,-1,0,'-6:00'),(1878,'America/Eirunepe',1988,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1879,'America/Eirunepe',1993,'Brazil',-300,60,10,11,0,0,'-5:00',1,31,-1,0,'-6:00'),(1880,'America/Eirunepe',1994,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1881,'America/Rio_Branco',1970,'Brazil',-300,0,12,31,-1,0,'07:00',3,1,-1,0,'-6:00'),(1882,'America/Rio_Branco',1985,'Brazil',-300,60,11,2,-1,0,'-5:00',1,1,-1,0,'06:00'),(1883,'America/Rio_Branco',1986,'Brazil',-300,60,10,25,-1,0,'-5:00',3,15,-1,0,'-6:00'),(1884,'America/Rio_Branco',1987,'Brazil',-300,60,10,25,-1,0,'-5:00',2,14,-1,0,'-6:00'),(1885,'America/Rio_Branco',1988,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1886,'America/Santiago',1970,'Chile',-240,60,10,9,0,0,'4:00',3,29,-1,0,'3:00'),(1887,'America/Santiago',1971,'Chile',-240,60,10,9,0,0,'4:00',3,14,-1,0,'3:00'),(1888,'America/Santiago',1972,'Chile',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1889,'America/Santiago',1973,'Chile',-240,60,9,30,-1,0,'4:00',3,9,0,0,'3:00'),(1890,'America/Santiago',1974,'Chile',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1891,'America/Santiago',1987,'Chile',-240,60,10,9,0,0,'4:00',4,12,-1,0,'3:00'),(1892,'America/Santiago',1988,'Chile',-240,60,10,1,0,0,'4:00',3,9,0,0,'3:00'),(1893,'America/Santiago',1989,'Chile',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1894,'America/Santiago',1990,'Chile',-240,60,9,16,-1,0,'4:00',3,18,-1,0,'3:00'),(1895,'America/Santiago',1991,'Chile',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1896,'America/Santiago',1997,'Chile',-240,60,10,9,0,0,'4:00',3,30,-1,0,'3:00'),(1897,'America/Santiago',1998,'Chile',-240,60,9,27,-1,0,'4:00',3,9,0,0,'3:00'),(1898,'America/Santiago',1999,'Chile',-240,60,10,9,0,0,'4:00',4,4,-1,0,'3:00'),(1899,'America/Santiago',2000,'Chile',-240,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1900,'Pacific/Easter',1970,'Chile',-420,60,10,9,0,0,'4:00',3,29,-1,0,'3:00'),(1901,'Pacific/Easter',1971,'Chile',-420,60,10,9,0,0,'4:00',3,14,-1,0,'3:00'),(1902,'Pacific/Easter',1972,'Chile',-420,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1903,'Pacific/Easter',1973,'Chile',-420,60,9,30,-1,0,'4:00',3,9,0,0,'3:00'),(1904,'Pacific/Easter',1974,'Chile',-420,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1905,'Pacific/Easter',1982,'Chile',-360,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1906,'Pacific/Easter',1987,'Chile',-360,60,10,9,0,0,'4:00',4,12,-1,0,'3:00'),(1907,'Pacific/Easter',1988,'Chile',-360,60,10,1,0,0,'4:00',3,9,0,0,'3:00'),(1908,'Pacific/Easter',1989,'Chile',-360,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1909,'Pacific/Easter',1990,'Chile',-360,60,9,16,-1,0,'4:00',3,18,-1,0,'3:00'),(1910,'Pacific/Easter',1991,'Chile',-360,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1911,'Pacific/Easter',1997,'Chile',-360,60,10,9,0,0,'4:00',3,30,-1,0,'3:00'),(1912,'Pacific/Easter',1998,'Chile',-360,60,9,27,-1,0,'4:00',3,9,0,0,'3:00'),(1913,'Pacific/Easter',1999,'Chile',-360,60,10,9,0,0,'4:00',4,4,-1,0,'3:00'),(1914,'Pacific/Easter',2000,'Chile',-360,60,10,9,0,0,'4:00',3,9,0,0,'3:00'),(1915,'America/Bogota',1970,'CO',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1916,'America/Bogota',1992,'CO',-300,60,5,3,-1,0,'-5:00',1,1,-1,0,'06:00'),(1917,'America/Bogota',1993,'CO',-300,0,12,31,-1,0,'07:00',4,4,-1,0,'-6:00'),(1918,'America/Curacao',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1919,'America/Guayaquil',1970,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1920,'Pacific/Galapagos',1970,'',-300,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1921,'Pacific/Galapagos',1986,'',-360,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1922,'Atlantic/Stanley',1970,'Falk',-240,0,12,31,-1,0,'08:00',1,1,-1,0,'-5:00'),(1923,'Atlantic/Stanley',1983,'Falk',-180,60,9,-1,0,0,'-3:00',1,1,-1,0,'08:00'),(1924,'Atlantic/Stanley',1984,'Falk',-180,60,9,16,-1,0,'-3:00',4,-1,0,0,'-4:00'),(1925,'Atlantic/Stanley',1985,'Falk',-240,60,9,9,0,0,'-4:00',4,-1,0,0,'-5:00'),(1926,'Atlantic/Stanley',1986,'Falk',-240,60,9,9,0,0,'-4:00',4,16,0,0,'-5:00'),(1927,'Atlantic/Stanley',2001,'Falk',-240,60,9,1,0,0,'-2:00',4,15,0,0,'-3:00'),(1928,'America/Cayenne',1970,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1929,'America/Guyana',1970,'',-225,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1930,'America/Guyana',1975,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1931,'America/Guyana',1991,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1932,'America/Asuncion',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1933,'America/Asuncion',1972,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1934,'America/Asuncion',1974,'Para',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1935,'America/Asuncion',1975,'Para',-240,60,10,1,-1,0,'-4:00',3,1,-1,0,'-5:00'),(1936,'America/Asuncion',1979,'Para',-240,60,10,1,-1,0,'-4:00',4,1,-1,0,'-5:00'),(1937,'America/Asuncion',1989,'Para',-240,60,10,22,-1,0,'-4:00',4,1,-1,0,'-5:00'),(1938,'America/Asuncion',1990,'Para',-240,60,10,1,-1,0,'-4:00',4,1,-1,0,'-5:00'),(1939,'America/Asuncion',1991,'Para',-240,60,10,6,-1,0,'-4:00',4,1,-1,0,'-5:00'),(1940,'America/Asuncion',1992,'Para',-240,60,10,5,-1,0,'-4:00',3,1,-1,0,'-5:00'),(1941,'America/Asuncion',1993,'Para',-240,60,10,1,-1,0,'-4:00',3,31,-1,0,'-5:00'),(1942,'America/Asuncion',1994,'Para',-240,60,10,1,-1,0,'-4:00',2,-1,0,0,'-5:00'),(1943,'America/Asuncion',1996,'Para',-240,60,10,1,0,0,'-4:00',3,1,-1,0,'-5:00'),(1944,'America/Asuncion',1997,'Para',-240,60,10,1,0,0,'-4:00',2,-1,0,0,'-5:00'),(1945,'America/Asuncion',1998,'Para',-240,60,10,1,0,0,'-4:00',3,1,0,0,'-5:00'),(1946,'America/Asuncion',2002,'Para',-240,60,9,1,0,0,'-4:00',4,1,0,0,'-5:00'),(1947,'America/Asuncion',2004,'Para',-240,60,10,15,0,0,'-4:00',4,1,0,0,'-5:00'),(1948,'America/Asuncion',2005,'Para',-240,60,10,15,0,0,'-4:00',3,8,0,0,'-5:00'),(1949,'America/Lima',1970,'Peru',-300,0,12,31,-1,0,'07:00',3,24,0,0,'-6:00'),(1950,'America/Lima',1986,'Peru',-300,60,1,1,-1,0,'-5:00',4,1,-1,0,'-6:00'),(1951,'America/Lima',1995,'Peru',-300,0,1,1,-1,0,'-5:00',4,1,-1,0,'-6:00'),(1952,'Atlantic/South_Georgia',1970,'',-120,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1953,'America/Paramaribo',1970,'',-210,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1954,'America/Paramaribo',1975,'',-210,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1955,'America/Paramaribo',1984,'',-180,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1956,'America/Port_of_Spain',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1957,'America/Montevideo',1970,'Uruguay',-180,30,5,27,-1,0,'-3:00',12,2,-1,0,'-4:00'),(1958,'America/Montevideo',1972,'Uruguay',-180,60,4,24,-1,0,'-3:00',8,15,-1,0,'-4:00'),(1959,'America/Montevideo',1974,'Uruguay',-180,60,12,22,-1,0,'-3:00',1,1,-1,0,'08:00'),(1960,'America/Montevideo',1976,'Uruguay',-180,0,12,31,-1,0,'09:00',10,1,-1,0,'-4:00'),(1961,'America/Montevideo',1977,'Uruguay',-180,60,12,4,-1,0,'-3:00',1,1,-1,0,'08:00'),(1962,'America/Montevideo',1978,'Uruguay',-180,0,12,31,-1,0,'09:00',4,1,-1,0,'-4:00'),(1963,'America/Montevideo',1979,'Uruguay',-180,60,10,1,-1,0,'-3:00',1,1,-1,0,'08:00'),(1964,'America/Montevideo',1980,'Uruguay',-180,0,12,31,-1,0,'09:00',5,1,-1,0,'-4:00'),(1965,'America/Montevideo',1987,'Uruguay',-180,60,12,14,-1,0,'-3:00',1,1,-1,0,'08:00'),(1966,'America/Montevideo',1988,'Uruguay',-180,60,12,11,-1,0,'-3:00',3,14,-1,0,'-4:00'),(1967,'America/Montevideo',1989,'Uruguay',-180,60,10,29,-1,0,'-3:00',3,12,-1,0,'-4:00'),(1968,'America/Montevideo',1990,'Uruguay',-180,60,10,21,0,0,'-3:00',3,1,0,0,'-4:00'),(1969,'America/Montevideo',1992,'Uruguay',-180,60,10,18,-1,0,'-3:00',3,1,0,0,'-4:00'),(1970,'America/Montevideo',1993,'Uruguay',-180,0,12,31,-1,0,'09:00',2,28,-1,0,'-4:00'),(1971,'America/Montevideo',2004,'Uruguay',-180,60,9,19,-1,0,'-3:00',1,1,-1,0,'08:00'),(1972,'America/Montevideo',2005,'Uruguay',-180,60,10,9,-1,0,'-1:00',3,27,-1,0,'-2:00'),(1973,'America/Montevideo',2006,'Uruguay',-180,60,10,1,0,0,'-1:00',3,12,-1,0,'-2:00'),(1974,'America/Montevideo',2007,'Uruguay',-180,60,10,1,0,0,'-1:00',3,8,0,0,'-2:00'),(1975,'America/Caracas',1970,'',-240,0,0,0,0,0,'00:00',0,0,0,0,'00:00'),(1976,'America/Caracas',2007,'',-270,0,0,0,0,0,'00:00',0,0,0,0,'00:00');;
DROP TABLE IF EXISTS mdl_user;;
CREATE TABLE mdl_user (
  id bigint(10) unsigned NOT NULL auto_increment,
  auth varchar(20) NOT NULL default 'manual',
  confirmed tinyint(1) NOT NULL default '0',
  policyagreed tinyint(1) NOT NULL default '0',
  deleted tinyint(1) NOT NULL default '0',
  mnethostid bigint(10) NOT NULL default '0',
  username varchar(100) NOT NULL default '',
  password varchar(32) NOT NULL default '',
  idnumber varchar(64) NOT NULL default '',
  firstname varchar(100) NOT NULL default '',
  lastname varchar(100) NOT NULL default '',
  email varchar(100) NOT NULL default '',
  emailstop tinyint(1) unsigned NOT NULL default '0',
  icq varchar(15) NOT NULL default '',
  skype varchar(50) NOT NULL default '',
  yahoo varchar(50) NOT NULL default '',
  aim varchar(50) NOT NULL default '',
  msn varchar(50) NOT NULL default '',
  phone1 varchar(20) NOT NULL default '',
  phone2 varchar(20) NOT NULL default '',
  institution varchar(40) NOT NULL default '',
  department varchar(30) NOT NULL default '',
  address varchar(70) NOT NULL default '',
  city varchar(20) NOT NULL default '',
  country varchar(2) NOT NULL default '',
  lang varchar(30) NOT NULL default 'en',
  theme varchar(50) NOT NULL default '',
  timezone varchar(100) NOT NULL default '99',
  firstaccess bigint(10) unsigned NOT NULL default '0',
  lastaccess bigint(10) unsigned NOT NULL default '0',
  lastlogin bigint(10) unsigned NOT NULL default '0',
  currentlogin bigint(10) unsigned NOT NULL default '0',
  lastip varchar(15) NOT NULL default '',
  secret varchar(15) NOT NULL default '',
  picture tinyint(1) NOT NULL default '0',
  url varchar(255) NOT NULL default '',
  description text,
  mailformat tinyint(1) unsigned NOT NULL default '1',
  maildigest tinyint(1) unsigned NOT NULL default '0',
  maildisplay tinyint(2) unsigned NOT NULL default '2',
  htmleditor tinyint(1) unsigned NOT NULL default '1',
  ajax tinyint(1) unsigned NOT NULL default '1',
  autosubscribe tinyint(1) unsigned NOT NULL default '1',
  trackforums tinyint(1) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  trustbitmask bigint(10) unsigned NOT NULL default '0',
  imagealt varchar(255) default NULL,
  screenreader tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_user_mneuse_uix (mnethostid,username),
  KEY mdl_user_del_ix (deleted),
  KEY mdl_user_con_ix (confirmed),
  KEY mdl_user_fir_ix (firstname),
  KEY mdl_user_las_ix (lastname),
  KEY mdl_user_cit_ix (city),
  KEY mdl_user_cou_ix (country),
  KEY mdl_user_las2_ix (lastaccess),
  KEY mdl_user_ema_ix (email),
  KEY mdl_user_aut_ix (auth),
  KEY mdl_user_idn_ix (idnumber)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='One record for each person';;
INSERT INTO mdl_user VALUES (1,'manual',1,0,0,1,'guest','084e0343a0486ff05530df6c705c8bb4','','Guest User',' ','root@localhost',0,'','','','','','','','','','','','','en_utf8','','99',0,0,0,0,'','',0,'','This user is a special user that allows read-only access to some courses.',1,0,2,1,1,1,0,1201718665,0,NULL,0),(2,'manual',1,0,0,1,'admin','21dc2a7bf153881e66c4d21462fed8cc','','ORVSD','Admin','webmaster@orvsd.org',0,'','','','','','','','','','','Corvallis','US','en_utf8','','99',0,1219099310,0,1219099310,'140.211.18.56','',1,'','',1,0,1,1,1,1,0,1201718788,0,'',0);;
DROP TABLE IF EXISTS mdl_user_info_category;;
CREATE TABLE mdl_user_info_category (
  id bigint(10) NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  sortorder bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories';;
DROP TABLE IF EXISTS mdl_user_info_data;;
CREATE TABLE mdl_user_info_data (
  id bigint(10) NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  fieldid bigint(10) unsigned NOT NULL default '0',
  data longtext NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields';;
DROP TABLE IF EXISTS mdl_user_info_field;;
CREATE TABLE mdl_user_info_field (
  id bigint(10) NOT NULL auto_increment,
  shortname varchar(255) NOT NULL default 'shortname',
  name longtext NOT NULL,
  datatype varchar(255) NOT NULL default '',
  description longtext,
  categoryid bigint(10) unsigned NOT NULL default '0',
  sortorder bigint(10) unsigned NOT NULL default '0',
  required tinyint(2) unsigned NOT NULL default '0',
  locked tinyint(2) unsigned NOT NULL default '0',
  visible smallint(4) unsigned NOT NULL default '0',
  defaultdata longtext,
  param1 longtext,
  param2 longtext,
  param3 longtext,
  param4 longtext,
  param5 longtext,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields';;
DROP TABLE IF EXISTS mdl_user_lastaccess;;
CREATE TABLE mdl_user_lastaccess (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  courseid bigint(10) unsigned NOT NULL default '0',
  timeaccess bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_userlast_usecou_uix (userid,courseid),
  KEY mdl_userlast_use_ix (userid),
  KEY mdl_userlast_cou_ix (courseid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa';;
DROP TABLE IF EXISTS mdl_user_preferences;;
CREATE TABLE mdl_user_preferences (
  id bigint(10) unsigned NOT NULL auto_increment,
  userid bigint(10) unsigned NOT NULL default '0',
  name varchar(50) NOT NULL default '',
  value varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_userpref_usenam_uix (userid,name)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences';;
INSERT INTO mdl_user_preferences VALUES (1,2,'auth_forcepasswordchange','0'),(2,2,'email_bounce_count','1'),(3,2,'email_send_count','1');;
DROP TABLE IF EXISTS mdl_wiki;;
CREATE TABLE mdl_wiki (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  summary text NOT NULL,
  pagename varchar(255) NOT NULL default '',
  wtype enum('teacher','group','student') NOT NULL default 'group',
  ewikiprinttitle smallint(4) unsigned NOT NULL default '1',
  htmlmode smallint(4) unsigned NOT NULL default '0',
  ewikiacceptbinary smallint(4) unsigned NOT NULL default '0',
  disablecamelcase smallint(4) unsigned NOT NULL default '0',
  setpageflags smallint(4) unsigned NOT NULL default '1',
  strippages smallint(4) unsigned NOT NULL default '1',
  removepages smallint(4) unsigned NOT NULL default '1',
  revertchanges smallint(4) unsigned NOT NULL default '1',
  initialcontent varchar(255) NOT NULL default '',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_wiki_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Main wik table';;
DROP TABLE IF EXISTS mdl_wiki_entries;;
CREATE TABLE mdl_wiki_entries (
  id bigint(10) unsigned NOT NULL auto_increment,
  wikiid bigint(10) unsigned NOT NULL default '0',
  course bigint(10) unsigned NOT NULL default '0',
  groupid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  pagename varchar(255) NOT NULL default '',
  timemodified bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_wikientr_cou_ix (course),
  KEY mdl_wikientr_gro_ix (groupid),
  KEY mdl_wikientr_use_ix (userid),
  KEY mdl_wikientr_pag_ix (pagename),
  KEY mdl_wikientr_wik_ix (wikiid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds entries for each wiki start instance';;
DROP TABLE IF EXISTS mdl_wiki_locks;;
CREATE TABLE mdl_wiki_locks (
  id bigint(10) unsigned NOT NULL auto_increment,
  wikiid bigint(10) unsigned NOT NULL,
  pagename varchar(160) NOT NULL default '',
  lockedby bigint(10) unsigned NOT NULL default '0',
  lockedsince bigint(10) unsigned NOT NULL default '0',
  lockedseen bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_wikilock_wikpag_uix (wikiid,pagename),
  KEY mdl_wikilock_loc_ix (lockedseen),
  KEY mdl_wikilock_wik_ix (wikiid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores editing locks on Wiki pages';;
DROP TABLE IF EXISTS mdl_wiki_pages;;
CREATE TABLE mdl_wiki_pages (
  id bigint(10) unsigned NOT NULL auto_increment,
  pagename varchar(160) NOT NULL default '',
  version bigint(10) unsigned NOT NULL default '0',
  flags bigint(10) unsigned default '0',
  content mediumtext,
  author varchar(100) default 'ewiki',
  userid bigint(10) unsigned NOT NULL default '0',
  created bigint(10) unsigned default '0',
  lastmodified bigint(10) unsigned default '0',
  refs mediumtext,
  meta mediumtext,
  hits bigint(10) unsigned default '0',
  wiki bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mdl_wikipage_pagverwik_uix (pagename,version,wiki),
  KEY mdl_wikipage_wik_ix (wiki)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds the Wiki-Pages';;
DROP TABLE IF EXISTS mdl_workshop;;
CREATE TABLE mdl_workshop (
  id bigint(10) unsigned NOT NULL auto_increment,
  course bigint(10) unsigned NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  description text NOT NULL,
  wtype smallint(3) unsigned NOT NULL default '0',
  nelements smallint(3) unsigned NOT NULL default '1',
  nattachments smallint(3) unsigned NOT NULL default '0',
  phase tinyint(2) unsigned NOT NULL default '0',
  format tinyint(2) unsigned NOT NULL default '0',
  gradingstrategy tinyint(2) unsigned NOT NULL default '1',
  resubmit tinyint(2) unsigned NOT NULL default '0',
  agreeassessments tinyint(2) unsigned NOT NULL default '0',
  hidegrades tinyint(2) unsigned NOT NULL default '0',
  anonymous tinyint(2) unsigned NOT NULL default '0',
  includeself tinyint(2) unsigned NOT NULL default '0',
  maxbytes bigint(10) unsigned NOT NULL default '100000',
  submissionstart bigint(10) unsigned NOT NULL default '0',
  assessmentstart bigint(10) unsigned NOT NULL default '0',
  submissionend bigint(10) unsigned NOT NULL default '0',
  assessmentend bigint(10) unsigned NOT NULL default '0',
  releasegrades bigint(10) unsigned NOT NULL default '0',
  grade smallint(3) NOT NULL default '0',
  gradinggrade smallint(3) NOT NULL default '0',
  ntassessments smallint(3) unsigned NOT NULL default '0',
  assessmentcomps smallint(3) unsigned NOT NULL default '2',
  nsassessments smallint(3) unsigned NOT NULL default '0',
  overallocation smallint(3) unsigned NOT NULL default '0',
  timemodified bigint(10) unsigned NOT NULL default '0',
  teacherweight smallint(3) unsigned NOT NULL default '1',
  showleaguetable smallint(3) unsigned NOT NULL default '0',
  usepassword smallint(3) unsigned NOT NULL default '0',
  password varchar(32) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY mdl_work_cou_ix (course)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines workshop';;
DROP TABLE IF EXISTS mdl_workshop_assessments;;
CREATE TABLE mdl_workshop_assessments (
  id bigint(10) unsigned NOT NULL auto_increment,
  workshopid bigint(10) unsigned NOT NULL default '0',
  submissionid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  timegraded bigint(10) unsigned NOT NULL default '0',
  timeagreed bigint(10) unsigned NOT NULL default '0',
  grade double NOT NULL default '0',
  gradinggrade smallint(3) NOT NULL default '0',
  teachergraded smallint(3) unsigned NOT NULL default '0',
  mailed smallint(3) unsigned NOT NULL default '0',
  resubmission smallint(3) unsigned NOT NULL default '0',
  donotuse smallint(3) unsigned NOT NULL default '0',
  generalcomment text NOT NULL,
  teachercomment text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_workasse_use_ix (userid),
  KEY mdl_workasse_mai_ix (mailed),
  KEY mdl_workasse_wor_ix (workshopid),
  KEY mdl_workasse_sub_ix (submissionid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about assessments by teacher and students';;
DROP TABLE IF EXISTS mdl_workshop_comments;;
CREATE TABLE mdl_workshop_comments (
  id bigint(10) unsigned NOT NULL auto_increment,
  workshopid bigint(10) unsigned NOT NULL default '0',
  assessmentid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  timecreated bigint(10) unsigned NOT NULL default '0',
  mailed tinyint(2) unsigned NOT NULL default '0',
  comments text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_workcomm_use_ix (userid),
  KEY mdl_workcomm_mai_ix (mailed),
  KEY mdl_workcomm_wor_ix (workshopid),
  KEY mdl_workcomm_ass_ix (assessmentid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines comments';;
DROP TABLE IF EXISTS mdl_workshop_elements;;
CREATE TABLE mdl_workshop_elements (
  id bigint(10) unsigned NOT NULL auto_increment,
  workshopid bigint(10) unsigned NOT NULL default '0',
  elementno smallint(3) unsigned NOT NULL default '0',
  description text NOT NULL,
  scale smallint(3) unsigned NOT NULL default '0',
  maxscore smallint(3) unsigned NOT NULL default '1',
  weight smallint(3) unsigned NOT NULL default '11',
  stddev double NOT NULL default '0',
  totalassessments bigint(10) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_workelem_wor_ix (workshopid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about marking scheme of assignment';;
DROP TABLE IF EXISTS mdl_workshop_grades;;
CREATE TABLE mdl_workshop_grades (
  id bigint(10) unsigned NOT NULL auto_increment,
  workshopid bigint(10) unsigned NOT NULL default '0',
  assessmentid bigint(10) unsigned NOT NULL default '0',
  elementno bigint(10) unsigned NOT NULL default '0',
  feedback text NOT NULL,
  grade smallint(3) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_workgrad_wor_ix (workshopid),
  KEY mdl_workgrad_ass_ix (assessmentid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about individual grades given to each element';;
DROP TABLE IF EXISTS mdl_workshop_rubrics;;
CREATE TABLE mdl_workshop_rubrics (
  id bigint(10) unsigned NOT NULL auto_increment,
  workshopid bigint(10) unsigned NOT NULL default '0',
  elementno bigint(10) unsigned NOT NULL default '0',
  rubricno smallint(3) unsigned NOT NULL default '0',
  description text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_workrubr_wor_ix (workshopid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about the rubrics marking scheme';;
DROP TABLE IF EXISTS mdl_workshop_stockcomments;;
CREATE TABLE mdl_workshop_stockcomments (
  id bigint(10) unsigned NOT NULL auto_increment,
  workshopid bigint(10) unsigned NOT NULL default '0',
  elementno bigint(10) unsigned NOT NULL default '0',
  comments text NOT NULL,
  PRIMARY KEY  (id),
  KEY mdl_workstoc_wor_ix (workshopid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about the teacher comment bank';;
DROP TABLE IF EXISTS mdl_workshop_submissions;;
CREATE TABLE mdl_workshop_submissions (
  id bigint(10) unsigned NOT NULL auto_increment,
  workshopid bigint(10) unsigned NOT NULL default '0',
  userid bigint(10) unsigned NOT NULL default '0',
  title varchar(100) NOT NULL default '',
  timecreated bigint(10) unsigned NOT NULL default '0',
  mailed tinyint(2) unsigned NOT NULL default '0',
  description text NOT NULL,
  gradinggrade smallint(3) unsigned NOT NULL default '0',
  finalgrade smallint(3) unsigned NOT NULL default '0',
  late smallint(3) unsigned NOT NULL default '0',
  nassessments bigint(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY mdl_worksubm_use_ix (userid),
  KEY mdl_worksubm_mai_ix (mailed),
  KEY mdl_worksubm_wor_ix (workshopid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Info about submitted work from teacher and students';;
