-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: egroupware
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `egw_access_log`
--

DROP TABLE IF EXISTS `egw_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_access_log` (
  `sessionid` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `li` bigint(20) NOT NULL,
  `lo` bigint(20) DEFAULT NULL,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `session_dla` bigint(20) DEFAULT NULL,
  `session_action` varchar(64) DEFAULT NULL,
  `session_php` varchar(64) NOT NULL,
  `notification_heartbeat` bigint(20) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `egw_access_log_li` (`li`),
  KEY `egw_access_log_lo` (`lo`),
  KEY `egw_access_log_session_dla` (`session_dla`),
  KEY `egw_access_log_session_php` (`session_php`),
  KEY `egw_access_log_notification_heartbeat` (`notification_heartbeat`),
  KEY `egw_access_log_account_id_ip_li` (`account_id`,`ip`,`li`),
  KEY `egw_access_log_account_id_loginid_li` (`account_id`,`loginid`,`li`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_access_log`
--

LOCK TABLES `egw_access_log` WRITE;
/*!40000 ALTER TABLE `egw_access_log` DISABLE KEYS */;
INSERT INTO `egw_access_log` VALUES (1,'admin@default','192.168.12.25',1410022444,NULL,0,1410022444,'/login.php','bad login or password',NULL,'Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.0'),(2,'admin@mycompany.local@default','192.168.12.25',1410022495,NULL,0,1410022495,'/login.php','bad login or password',NULL,'Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.0');
/*!40000 ALTER TABLE `egw_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_accounts`
--

DROP TABLE IF EXISTS `egw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_lid` varchar(64) NOT NULL,
  `account_pwd` varchar(128) NOT NULL,
  `account_lastlogin` int(11) DEFAULT NULL,
  `account_lastloginfrom` varchar(255) DEFAULT NULL,
  `account_lastpwd_change` int(11) DEFAULT NULL,
  `account_status` varchar(1) NOT NULL DEFAULT 'A',
  `account_expires` int(11) DEFAULT NULL,
  `account_type` varchar(1) DEFAULT NULL,
  `account_primary_group` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `egw_accounts_account_lid` (`account_lid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_accounts`
--

LOCK TABLES `egw_accounts` WRITE;
/*!40000 ALTER TABLE `egw_accounts` DISABLE KEYS */;
INSERT INTO `egw_accounts` VALUES (1,'Default','',NULL,NULL,NULL,'A',-1,'g',0),(2,'Admins','',NULL,NULL,NULL,'A',-1,'g',0),(3,'NoGroup','',NULL,NULL,NULL,'A',-1,'g',0),(4,'anonymous','{crypt}$2a$12$VbB4CPznitlICdoSjq7kO.D19GZBO95zROWeaL9mLECtnofgfymK2',NULL,NULL,1410022009,'A',-1,'u',-3),(5,'admin','',NULL,NULL,NULL,'A',-1,'u',-2);
/*!40000 ALTER TABLE `egw_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_acl`
--

DROP TABLE IF EXISTS `egw_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_acl` (
  `acl_appname` varchar(50) NOT NULL,
  `acl_location` varchar(255) NOT NULL,
  `acl_account` int(11) NOT NULL,
  `acl_rights` int(11) DEFAULT NULL,
  PRIMARY KEY (`acl_appname`,`acl_location`,`acl_account`),
  KEY `egw_acl_account` (`acl_account`),
  KEY `egw_acl_location_account` (`acl_location`,`acl_account`),
  KEY `egw_acl_appname_account` (`acl_appname`,`acl_account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_acl`
--

LOCK TABLES `egw_acl` WRITE;
/*!40000 ALTER TABLE `egw_acl` DISABLE KEYS */;
INSERT INTO `egw_acl` VALUES ('addressbook','-1',-1,15),('activesync','run',-1,1),('activesync','run',-2,1),('importexport','run',-1,1),('importexport','run',-2,1),('news_admin','run',-2,1),('news_admin','run',-1,1),('phpgw_group','-3',4,1),('preferences','nopasswordchange',4,1),('news_admin','run',4,1),('phpgwapi','anonymous',4,1),('news_admin','L2',-2,3),('news_admin','L2',-1,1),('news_admin','L3',-2,1),('news_admin','L3',-1,1),('news_admin','L3',4,1),('resources','run',-1,1),('resources','L4',-1,399),('resources','L5',-1,399),('sitemgr','run',-2,1),('sitemgr-link','run',-1,1),('sitemgr-link','run',4,1),('sitemgr','L6',-2,1),('sitemgr','L7',-2,3),('sitemgr','L7',-1,1),('sitemgr','L7',4,1),('sitemgr','L8',-2,3),('sitemgr','L8',-1,1),('sitemgr','L8',4,1),('sitemgr','L9',-2,3),('sitemgr','L9',-1,1),('sitemgr','L9',4,1),('sitemgr','L10',-2,3),('sitemgr','L10',-1,1),('sitemgr','L10',4,1),('sitemgr','L11',-2,3),('sitemgr','L11',-1,1),('sitemgr','L11',4,1),('sitemgr','L12',-2,3),('sitemgr','L12',-1,1),('sitemgr','L12',4,1),('mail','run',-1,1),('tracker','run',-2,1),('tracker','run',-1,1),('addressbook','run',-1,1),('calendar','run',-1,1),('infolog','run',-1,1),('filemanager','run',-1,1),('preferences','run',-1,1),('manual','run',-1,1),('groupdav','run',-1,1),('notifications','run',-1,1),('timesheet','run',-1,1),('admin','run',-2,1),('bookmarks','run',-2,1),('emailadmin','run',-2,1),('phpbrain','run',-2,1),('projectmanager','run',-2,1),('resources','run',-2,1),('timesheet','run',-2,1),('wiki','run',-2,1),('phpgw_group','-2',5,1),('phpgw_group','-1',5,1);
/*!40000 ALTER TABLE `egw_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_addressbook`
--

DROP TABLE IF EXISTS `egw_addressbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_addressbook` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_tid` varchar(1) DEFAULT 'n',
  `contact_owner` bigint(20) NOT NULL,
  `contact_private` tinyint(4) DEFAULT '0',
  `cat_id` varchar(255) DEFAULT NULL,
  `n_family` varchar(64) DEFAULT NULL,
  `n_given` varchar(64) DEFAULT NULL,
  `n_middle` varchar(64) DEFAULT NULL,
  `n_prefix` varchar(64) DEFAULT NULL,
  `n_suffix` varchar(64) DEFAULT NULL,
  `n_fn` varchar(128) DEFAULT NULL,
  `n_fileas` varchar(255) DEFAULT NULL,
  `contact_bday` varchar(12) DEFAULT NULL,
  `org_name` varchar(128) DEFAULT NULL,
  `org_unit` varchar(64) DEFAULT NULL,
  `contact_title` varchar(64) DEFAULT NULL,
  `contact_role` varchar(64) DEFAULT NULL,
  `contact_assistent` varchar(64) DEFAULT NULL,
  `contact_room` varchar(64) DEFAULT NULL,
  `adr_one_street` varchar(64) DEFAULT NULL,
  `adr_one_street2` varchar(64) DEFAULT NULL,
  `adr_one_locality` varchar(64) DEFAULT NULL,
  `adr_one_region` varchar(64) DEFAULT NULL,
  `adr_one_postalcode` varchar(64) DEFAULT NULL,
  `adr_one_countryname` varchar(64) DEFAULT NULL,
  `contact_label` text,
  `adr_two_street` varchar(64) DEFAULT NULL,
  `adr_two_street2` varchar(64) DEFAULT NULL,
  `adr_two_locality` varchar(64) DEFAULT NULL,
  `adr_two_region` varchar(64) DEFAULT NULL,
  `adr_two_postalcode` varchar(64) DEFAULT NULL,
  `adr_two_countryname` varchar(64) DEFAULT NULL,
  `tel_work` varchar(40) DEFAULT NULL,
  `tel_cell` varchar(40) DEFAULT NULL,
  `tel_fax` varchar(40) DEFAULT NULL,
  `tel_assistent` varchar(40) DEFAULT NULL,
  `tel_car` varchar(40) DEFAULT NULL,
  `tel_pager` varchar(40) DEFAULT NULL,
  `tel_home` varchar(40) DEFAULT NULL,
  `tel_fax_home` varchar(40) DEFAULT NULL,
  `tel_cell_private` varchar(40) DEFAULT NULL,
  `tel_other` varchar(40) DEFAULT NULL,
  `tel_prefer` varchar(32) DEFAULT NULL,
  `contact_email` varchar(128) DEFAULT NULL,
  `contact_email_home` varchar(128) DEFAULT NULL,
  `contact_url` varchar(128) DEFAULT NULL,
  `contact_url_home` varchar(128) DEFAULT NULL,
  `contact_freebusy_uri` varchar(128) DEFAULT NULL,
  `contact_calendar_uri` varchar(128) DEFAULT NULL,
  `contact_note` text,
  `contact_tz` varchar(8) DEFAULT NULL,
  `contact_geo` varchar(32) DEFAULT NULL,
  `contact_pubkey` text,
  `contact_created` bigint(20) DEFAULT NULL,
  `contact_creator` int(11) NOT NULL,
  `contact_modified` bigint(20) NOT NULL,
  `contact_modifier` int(11) DEFAULT NULL,
  `contact_jpegphoto` longblob,
  `account_id` int(11) DEFAULT NULL,
  `contact_etag` int(11) DEFAULT '0',
  `contact_uid` varchar(255) DEFAULT NULL,
  `adr_one_countrycode` varchar(2) DEFAULT NULL,
  `adr_two_countrycode` varchar(2) DEFAULT NULL,
  `carddav_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `egw_addressbook_account_id` (`account_id`),
  KEY `egw_addressbook_contact_owner` (`contact_owner`),
  KEY `egw_addressbook_cat_id` (`cat_id`),
  KEY `egw_addressbook_n_fileas` (`n_fileas`),
  KEY `egw_addressbook_contact_modified` (`contact_modified`),
  KEY `egw_addressbook_contact_uid` (`contact_uid`),
  KEY `egw_addressbook_carddav_name` (`carddav_name`),
  KEY `egw_addressbook_n_family_n_given` (`n_family`,`n_given`),
  KEY `egw_addressbook_n_given_n_family` (`n_given`,`n_family`),
  KEY `egw_addressbook_org_name_n_family_n_given` (`org_name`,`n_family`,`n_given`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_addressbook`
--

LOCK TABLES `egw_addressbook` WRITE;
/*!40000 ALTER TABLE `egw_addressbook` DISABLE KEYS */;
INSERT INTO `egw_addressbook` VALUES (1,'n',0,0,NULL,'User','SiteMgr',NULL,NULL,NULL,'SiteMgr User',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1410022006,0,1410022006,NULL,NULL,4,0,'addressbook-1-0d3f7b161e61f8d58b74e272fdd7e199',NULL,NULL,'1.vcf'),(2,'n',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin@mycompany.local',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1410022409,0,1410022409,NULL,NULL,5,0,'addressbook-2-c04cc44bbf0c0734f657d70a16656913',NULL,NULL,'2.vcf');
/*!40000 ALTER TABLE `egw_addressbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_addressbook2list`
--

DROP TABLE IF EXISTS `egw_addressbook2list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_addressbook2list` (
  `contact_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `list_added` bigint(20) DEFAULT NULL,
  `list_added_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`contact_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_addressbook2list`
--

LOCK TABLES `egw_addressbook2list` WRITE;
/*!40000 ALTER TABLE `egw_addressbook2list` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_addressbook2list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_addressbook_extra`
--

DROP TABLE IF EXISTS `egw_addressbook_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_addressbook_extra` (
  `contact_id` int(11) NOT NULL,
  `contact_owner` bigint(20) DEFAULT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_value` text,
  PRIMARY KEY (`contact_id`,`contact_name`),
  KEY `egw_addressbook_extra_contact_name` (`contact_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_addressbook_extra`
--

LOCK TABLES `egw_addressbook_extra` WRITE;
/*!40000 ALTER TABLE `egw_addressbook_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_addressbook_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_addressbook_lists`
--

DROP TABLE IF EXISTS `egw_addressbook_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_addressbook_lists` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_name` varchar(80) NOT NULL,
  `list_owner` int(11) NOT NULL,
  `list_created` bigint(20) DEFAULT NULL,
  `list_creator` int(11) DEFAULT NULL,
  `list_uid` varchar(255) DEFAULT NULL,
  `list_carddav_name` varchar(64) DEFAULT NULL,
  `list_etag` int(11) NOT NULL DEFAULT '0',
  `list_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `list_modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  UNIQUE KEY `egw_addressbook_lists_list_owner_list_name` (`list_owner`,`list_name`),
  UNIQUE KEY `egw_addressbook_lists_list_uid` (`list_uid`),
  UNIQUE KEY `egw_addressbook_lists_list_carddav_name` (`list_carddav_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_addressbook_lists`
--

LOCK TABLES `egw_addressbook_lists` WRITE;
/*!40000 ALTER TABLE `egw_addressbook_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_addressbook_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_admin_queue`
--

DROP TABLE IF EXISTS `egw_admin_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_admin_queue` (
  `cmd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmd_uid` varchar(255) NOT NULL,
  `cmd_creator` int(11) NOT NULL,
  `cmd_creator_email` varchar(128) NOT NULL,
  `cmd_created` bigint(20) NOT NULL,
  `cmd_type` varchar(32) NOT NULL DEFAULT 'admin_cmd',
  `cmd_status` tinyint(4) DEFAULT NULL,
  `cmd_scheduled` bigint(20) DEFAULT NULL,
  `cmd_modified` bigint(20) DEFAULT NULL,
  `cmd_modifier` int(11) DEFAULT NULL,
  `cmd_modifier_email` varchar(128) DEFAULT NULL,
  `cmd_error` varchar(255) DEFAULT NULL,
  `cmd_errno` int(11) DEFAULT NULL,
  `cmd_requested` int(11) DEFAULT NULL,
  `cmd_requested_email` varchar(128) DEFAULT NULL,
  `cmd_comment` varchar(255) DEFAULT NULL,
  `cmd_data` longblob,
  `remote_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmd_id`),
  UNIQUE KEY `egw_admin_queue_cmd_uid` (`cmd_uid`),
  KEY `egw_admin_queue_cmd_status` (`cmd_status`),
  KEY `egw_admin_queue_cmd_scheduled` (`cmd_scheduled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_admin_queue`
--

LOCK TABLES `egw_admin_queue` WRITE;
/*!40000 ALTER TABLE `egw_admin_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_admin_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_admin_remote`
--

DROP TABLE IF EXISTS `egw_admin_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_admin_remote` (
  `remote_id` int(11) NOT NULL AUTO_INCREMENT,
  `remote_name` varchar(64) NOT NULL,
  `remote_hash` varchar(32) NOT NULL,
  `remote_url` varchar(128) NOT NULL,
  `remote_domain` varchar(64) NOT NULL,
  PRIMARY KEY (`remote_id`),
  UNIQUE KEY `egw_admin_remote_name` (`remote_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_admin_remote`
--

LOCK TABLES `egw_admin_remote` WRITE;
/*!40000 ALTER TABLE `egw_admin_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_admin_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_api_content_history`
--

DROP TABLE IF EXISTS `egw_api_content_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_api_content_history` (
  `sync_appname` varchar(60) NOT NULL,
  `sync_contentid` varchar(60) NOT NULL,
  `sync_added` datetime DEFAULT NULL,
  `sync_modified` datetime DEFAULT NULL,
  `sync_deleted` datetime DEFAULT NULL,
  `sync_id` int(11) NOT NULL AUTO_INCREMENT,
  `sync_changedby` int(11) NOT NULL,
  PRIMARY KEY (`sync_id`),
  KEY `egw_api_content_history_sync_added` (`sync_added`),
  KEY `egw_api_content_history_sync_modified` (`sync_modified`),
  KEY `egw_api_content_history_sync_deleted` (`sync_deleted`),
  KEY `egw_api_content_history_sync_changedby` (`sync_changedby`),
  KEY `egw_api_content_history_sync_appname_sync_contentid` (`sync_appname`,`sync_contentid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_api_content_history`
--

LOCK TABLES `egw_api_content_history` WRITE;
/*!40000 ALTER TABLE `egw_api_content_history` DISABLE KEYS */;
INSERT INTO `egw_api_content_history` VALUES ('contacts','1','2014-09-06 18:46:49',NULL,NULL,1,0),('contacts','2','2014-09-06 18:53:29',NULL,NULL,2,0);
/*!40000 ALTER TABLE `egw_api_content_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_applications`
--

DROP TABLE IF EXISTS `egw_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_applications` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(25) NOT NULL,
  `app_enabled` int(11) NOT NULL,
  `app_order` int(11) NOT NULL,
  `app_tables` text,
  `app_version` varchar(20) NOT NULL DEFAULT '0.0',
  `app_icon` varchar(32) DEFAULT NULL,
  `app_icon_app` varchar(25) DEFAULT NULL,
  `app_index` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `egw_applications_name` (`app_name`),
  KEY `egw_applications_enabled_order` (`app_enabled`,`app_order`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_applications`
--

LOCK TABLES `egw_applications` WRITE;
/*!40000 ALTER TABLE `egw_applications` DISABLE KEYS */;
INSERT INTO `egw_applications` VALUES (1,'phpgwapi',3,1,'egw_config,egw_applications,egw_acl,egw_accounts,egw_preferences,egw_access_log,egw_hooks,egw_languages,egw_lang,egw_nextid,egw_categories,egw_history_log,egw_async,egw_api_content_history,egw_links,egw_addressbook,egw_addressbook_extra,egw_addressbook_lists,egw_addressbook2list,egw_sqlfs,egw_index_keywords,egw_index,egw_cat2entry,egw_locks,egw_sqlfs_props,egw_customfields','14.1',NULL,NULL,NULL),(2,'admin',1,1,'egw_admin_queue,egw_admin_remote','14.1',NULL,NULL,'admin.admin_ui.index&ajax=true'),(3,'preferences',2,1,'','14.1',NULL,NULL,'preferences.preferences_settings.index&ajax=true'),(4,'etemplate',1,60,'egw_etemplate','14.1',NULL,NULL,'etemplate.editor.edit'),(5,'egw-pear',0,99,'','14.1',NULL,NULL,NULL),(6,'groupdav',2,1,'','14.1','groupdav','phpgwapi',NULL),(7,'activesync',2,99,'','14.1',NULL,NULL,NULL),(8,'addressbook',1,4,'','14.1',NULL,NULL,'addressbook.addressbook_ui.index&ajax=true'),(9,'bookmarks',1,12,'egw_bookmarks,egw_bookmarks_extra','14.1',NULL,NULL,NULL),(10,'calendar',1,3,'egw_cal,egw_cal_holidays,egw_cal_repeats,egw_cal_user,egw_cal_extra,egw_cal_dates,egw_cal_timezones','14.1',NULL,NULL,'calendar.calendar_uiviews.index'),(11,'developer_tools',1,61,'','14.1',NULL,NULL,'developer_tools.uilangfile.index'),(12,'emailadmin',2,10,'egw_emailadmin,egw_mailaccounts,egw_ea_accounts,egw_ea_credentials,egw_ea_identities,egw_ea_valid,egw_ea_notifications','14.1',NULL,NULL,NULL),(13,'filemanager',1,6,'','14.1',NULL,NULL,'filemanager.filemanager_ui.index&ajax=true'),(14,'home',1,1,'','14.1',NULL,NULL,'home.home_ui.index&ajax=true'),(15,'importexport',2,2,'egw_importexport_definitions','14.1',NULL,NULL,NULL),(16,'infolog',1,5,'egw_infolog,egw_infolog_extra','14.1',NULL,NULL,'infolog.infolog_ui.index&ajax=true'),(17,'news_admin',1,16,'egw_news,egw_news_export','14.1',NULL,NULL,'news_admin.uinews.index'),(18,'notifications',2,1,'egw_notificationpopup','14.1',NULL,NULL,NULL),(19,'phpbrain',1,25,'egw_kb_articles,egw_kb_comment,egw_kb_questions,egw_kb_ratings,egw_kb_related_art,egw_kb_search,egw_kb_urls','14.1',NULL,NULL,'phpbrain.uikb.index'),(20,'phpfreechat',4,4,'egw_phpfreechat','14.1',NULL,NULL,NULL),(21,'projectmanager',1,5,'egw_pm_projects,egw_pm_extra,egw_pm_elements,egw_pm_constraints,egw_pm_milestones,egw_pm_roles,egw_pm_members,egw_pm_pricelist,egw_pm_prices,egw_pm_eroles','14.1',NULL,NULL,'projectmanager.projectmanager_ui.index&ajax=true'),(22,'registration',2,40,'egw_registration','14.1',NULL,NULL,NULL),(23,'resources',1,5,'egw_resources,egw_resources_extra','14.1',NULL,NULL,'resources.resources_ui.index&ajax=true'),(24,'sambaadmin',1,99,'','14.1',NULL,NULL,'sambaadmin.uisambaadmin.listWorkstations'),(25,'sitemgr',1,14,'egw_sitemgr_pages,egw_sitemgr_pages_lang,egw_sitemgr_categories_state,egw_sitemgr_categories_lang,egw_sitemgr_modules,egw_sitemgr_blocks,egw_sitemgr_blocks_lang,egw_sitemgr_content,egw_sitemgr_content_lang,egw_sitemgr_active_modules,egw_sitemgr_properties,egw_sitemgr_sites,egw_sitemgr_notifications,egw_sitemgr_notify_messages','14.1',NULL,NULL,NULL),(26,'timesheet',1,5,'egw_timesheet,egw_timesheet_extra','14.1',NULL,NULL,'timesheet.timesheet_ui.index&ajax=true'),(27,'wiki',1,11,'egw_wiki_links,egw_wiki_pages,egw_wiki_rate,egw_wiki_interwiki,egw_wiki_sisterwiki,egw_wiki_remote_pages','14.1',NULL,NULL,NULL),(28,'mail',1,2,'','14.1',NULL,NULL,'mail.mail_ui.index&ajax=true'),(29,'manual',4,5,'','14.1',NULL,NULL,NULL),(30,'sitemgr-link',1,9,'','14.1','sitemgr-link','sitemgr','/sitemgr/sitemgr-link.php'),(31,'tracker',1,5,'egw_tracker,egw_tracker_replies,egw_tracker_votes,egw_tracker_bounties,egw_tracker_assignee,egw_tracker_escalations,egw_tracker_escalated,egw_tracker_extra','14.1.001',NULL,NULL,'tracker.tracker_ui.index&ajax=true');
/*!40000 ALTER TABLE `egw_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_async`
--

DROP TABLE IF EXISTS `egw_async`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_async` (
  `async_id` varchar(255) NOT NULL,
  `async_next` int(11) NOT NULL,
  `async_times` varchar(255) NOT NULL,
  `async_method` varchar(80) NOT NULL,
  `async_data` text,
  `async_account_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`async_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_async`
--

LOCK TABLES `egw_async` WRITE;
/*!40000 ALTER TABLE `egw_async` DISABLE KEYS */;
INSERT INTO `egw_async` VALUES ('news_admin-import',1410022800,'{\"hour\":\"*\"}','news_admin.news_admin_import.async_import','',0),('registration-purge',1410022800,'{\"hour\":\"*\"}','registration.registration_bo.purge_expired','',4),('##last-check-run##',0,'[]','none','{\"run_by\":\"crontab\",\"start\":1410022502,\"end\":1410022502}',0);
/*!40000 ALTER TABLE `egw_async` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_bookmarks`
--

DROP TABLE IF EXISTS `egw_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_bookmarks` (
  `bm_id` int(11) NOT NULL AUTO_INCREMENT,
  `bm_owner` int(11) DEFAULT NULL,
  `bm_access` varchar(255) DEFAULT NULL,
  `bm_url` varchar(255) DEFAULT NULL,
  `bm_name` varchar(255) DEFAULT NULL,
  `bm_desc` text,
  `bm_keywords` varchar(255) DEFAULT NULL,
  `bm_category` int(11) DEFAULT NULL,
  `bm_rating` int(11) DEFAULT NULL,
  `bm_info` varchar(255) DEFAULT NULL,
  `bm_visits` int(11) DEFAULT NULL,
  `bm_favicon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_bookmarks`
--

LOCK TABLES `egw_bookmarks` WRITE;
/*!40000 ALTER TABLE `egw_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_bookmarks_extra`
--

DROP TABLE IF EXISTS `egw_bookmarks_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_bookmarks_extra` (
  `bm_id` int(11) NOT NULL,
  `bm_name` varchar(64) NOT NULL,
  `bm_value` text,
  PRIMARY KEY (`bm_id`,`bm_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_bookmarks_extra`
--

LOCK TABLES `egw_bookmarks_extra` WRITE;
/*!40000 ALTER TABLE `egw_bookmarks_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_bookmarks_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_cal`
--

DROP TABLE IF EXISTS `egw_cal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_cal` (
  `cal_id` int(11) NOT NULL AUTO_INCREMENT,
  `cal_uid` varchar(255) NOT NULL,
  `cal_owner` int(11) NOT NULL,
  `cal_category` varchar(64) DEFAULT NULL,
  `cal_modified` bigint(20) DEFAULT NULL,
  `cal_priority` smallint(6) NOT NULL DEFAULT '2',
  `cal_public` smallint(6) NOT NULL DEFAULT '1',
  `cal_title` varchar(255) NOT NULL,
  `cal_description` varchar(16384) DEFAULT NULL,
  `cal_location` varchar(255) DEFAULT NULL,
  `cal_reference` int(11) NOT NULL DEFAULT '0',
  `cal_modifier` int(11) DEFAULT NULL,
  `cal_non_blocking` smallint(6) DEFAULT '0',
  `cal_special` smallint(6) DEFAULT '0',
  `cal_etag` int(11) DEFAULT '0',
  `cal_creator` int(11) NOT NULL,
  `cal_created` bigint(20) NOT NULL,
  `cal_recurrence` bigint(20) NOT NULL DEFAULT '0',
  `tz_id` int(11) DEFAULT NULL,
  `cal_deleted` bigint(20) DEFAULT NULL,
  `caldav_name` varchar(200) DEFAULT NULL,
  `range_start` bigint(20) NOT NULL,
  `range_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cal_id`),
  KEY `egw_cal_uid` (`cal_uid`),
  KEY `egw_cal_owner` (`cal_owner`),
  KEY `egw_cal_modified` (`cal_modified`),
  KEY `egw_cal_reference` (`cal_reference`),
  KEY `egw_cal_deleted` (`cal_deleted`),
  KEY `egw_cal_caldav_name` (`caldav_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_cal`
--

LOCK TABLES `egw_cal` WRITE;
/*!40000 ALTER TABLE `egw_cal` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_cal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_cal_dates`
--

DROP TABLE IF EXISTS `egw_cal_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_cal_dates` (
  `cal_id` int(11) NOT NULL,
  `cal_start` bigint(20) NOT NULL,
  `cal_end` bigint(20) NOT NULL,
  `recur_exception` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cal_id`,`cal_start`),
  KEY `egw_cal_dates_recur_exception_id` (`recur_exception`,`cal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_cal_dates`
--

LOCK TABLES `egw_cal_dates` WRITE;
/*!40000 ALTER TABLE `egw_cal_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_cal_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_cal_extra`
--

DROP TABLE IF EXISTS `egw_cal_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_cal_extra` (
  `cal_id` int(11) NOT NULL,
  `cal_extra_name` varchar(40) NOT NULL,
  `cal_extra_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`cal_id`,`cal_extra_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_cal_extra`
--

LOCK TABLES `egw_cal_extra` WRITE;
/*!40000 ALTER TABLE `egw_cal_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_cal_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_cal_holidays`
--

DROP TABLE IF EXISTS `egw_cal_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_cal_holidays` (
  `hol_id` int(11) NOT NULL AUTO_INCREMENT,
  `hol_locale` varchar(2) NOT NULL,
  `hol_name` varchar(50) NOT NULL,
  `hol_mday` bigint(20) NOT NULL DEFAULT '0',
  `hol_month_num` bigint(20) NOT NULL DEFAULT '0',
  `hol_occurence` bigint(20) NOT NULL DEFAULT '0',
  `hol_dow` bigint(20) NOT NULL DEFAULT '0',
  `hol_observance_rule` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hol_id`),
  KEY `egw_cal_holidays_hol_locale` (`hol_locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_cal_holidays`
--

LOCK TABLES `egw_cal_holidays` WRITE;
/*!40000 ALTER TABLE `egw_cal_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_cal_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_cal_repeats`
--

DROP TABLE IF EXISTS `egw_cal_repeats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_cal_repeats` (
  `cal_id` int(11) NOT NULL,
  `recur_type` smallint(6) NOT NULL,
  `recur_interval` smallint(6) DEFAULT '1',
  `recur_data` smallint(6) DEFAULT '1',
  PRIMARY KEY (`cal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_cal_repeats`
--

LOCK TABLES `egw_cal_repeats` WRITE;
/*!40000 ALTER TABLE `egw_cal_repeats` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_cal_repeats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_cal_timezones`
--

DROP TABLE IF EXISTS `egw_cal_timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_cal_timezones` (
  `tz_id` int(11) NOT NULL AUTO_INCREMENT,
  `tz_tzid` varchar(128) NOT NULL,
  `tz_alias` int(11) DEFAULT NULL,
  `tz_latitude` int(11) DEFAULT NULL,
  `tz_longitude` int(11) DEFAULT NULL,
  `tz_component` text,
  PRIMARY KEY (`tz_id`),
  UNIQUE KEY `egw_cal_timezones_tz_tzid` (`tz_tzid`),
  KEY `egw_cal_timezones_tz_alias` (`tz_alias`)
) ENGINE=MyISAM AUTO_INCREMENT=610 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_cal_timezones`
--

LOCK TABLES `egw_cal_timezones` WRITE;
/*!40000 ALTER TABLE `egw_cal_timezones` DISABLE KEYS */;
INSERT INTO `egw_cal_timezones` VALUES (1,'Africa/Abidjan',NULL,51900,-40200,'BEGIN:VTIMEZONE\r\nTZID:Africa/Abidjan\r\nX-LIC-LOCATION:Africa/Abidjan\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(2,'Africa/Accra',NULL,53300,1300,'BEGIN:VTIMEZONE\r\nTZID:Africa/Accra\r\nX-LIC-LOCATION:Africa/Accra\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(3,'Africa/Addis_Ababa',NULL,90200,384200,'BEGIN:VTIMEZONE\r\nTZID:Africa/Addis_Ababa\r\nX-LIC-LOCATION:Africa/Addis_Ababa\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(4,'Africa/Algiers',NULL,364700,30300,'BEGIN:VTIMEZONE\r\nTZID:Africa/Algiers\r\nX-LIC-LOCATION:Africa/Algiers\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(5,'Africa/Asmara',NULL,152000,385300,'BEGIN:VTIMEZONE\r\nTZID:Africa/Asmara\r\nX-LIC-LOCATION:Africa/Asmara\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(6,'Africa/Bamako',NULL,123900,-80000,'BEGIN:VTIMEZONE\r\nTZID:Africa/Bamako\r\nX-LIC-LOCATION:Africa/Bamako\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(7,'Africa/Bangui',NULL,42200,183500,'BEGIN:VTIMEZONE\r\nTZID:Africa/Bangui\r\nX-LIC-LOCATION:Africa/Bangui\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(8,'Africa/Banjul',NULL,132800,-163900,'BEGIN:VTIMEZONE\r\nTZID:Africa/Banjul\r\nX-LIC-LOCATION:Africa/Banjul\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(9,'Africa/Bissau',NULL,115100,-153500,'BEGIN:VTIMEZONE\r\nTZID:Africa/Bissau\r\nX-LIC-LOCATION:Africa/Bissau\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(10,'Africa/Blantyre',NULL,-154700,350000,'BEGIN:VTIMEZONE\r\nTZID:Africa/Blantyre\r\nX-LIC-LOCATION:Africa/Blantyre\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:CAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(11,'Africa/Brazzaville',NULL,-41600,151700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Brazzaville\r\nX-LIC-LOCATION:Africa/Brazzaville\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(12,'Africa/Bujumbura',NULL,-32300,292200,'BEGIN:VTIMEZONE\r\nTZID:Africa/Bujumbura\r\nX-LIC-LOCATION:Africa/Bujumbura\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:CAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(13,'Africa/Cairo',NULL,300300,311500,'BEGIN:VTIMEZONE\r\nTZID:Africa/Cairo\r\nX-LIC-LOCATION:Africa/Cairo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(14,'Africa/Casablanca',NULL,333900,-73500,'BEGIN:VTIMEZONE\r\nTZID:Africa/Casablanca\r\nX-LIC-LOCATION:Africa/Casablanca\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:WET\r\nDTSTART:19700927T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=9\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WEST\r\nDTSTART:19700426T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(15,'Africa/Ceuta',NULL,355300,-51900,'BEGIN:VTIMEZONE\r\nTZID:Africa/Ceuta\r\nX-LIC-LOCATION:Africa/Ceuta\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(16,'Africa/Conakry',NULL,93100,-134300,'BEGIN:VTIMEZONE\r\nTZID:Africa/Conakry\r\nX-LIC-LOCATION:Africa/Conakry\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(17,'Africa/Dakar',NULL,144000,-172600,'BEGIN:VTIMEZONE\r\nTZID:Africa/Dakar\r\nX-LIC-LOCATION:Africa/Dakar\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(18,'Africa/Dar_es_Salaam',NULL,-64800,391700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Dar_es_Salaam\r\nX-LIC-LOCATION:Africa/Dar_es_Salaam\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(19,'Africa/Djibouti',NULL,113600,430900,'BEGIN:VTIMEZONE\r\nTZID:Africa/Djibouti\r\nX-LIC-LOCATION:Africa/Djibouti\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(20,'Africa/Douala',NULL,40300,94200,'BEGIN:VTIMEZONE\r\nTZID:Africa/Douala\r\nX-LIC-LOCATION:Africa/Douala\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(21,'Africa/El_Aaiun',NULL,270900,-131200,'BEGIN:VTIMEZONE\r\nTZID:Africa/El_Aaiun\r\nX-LIC-LOCATION:Africa/El_Aaiun\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:WET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(22,'Africa/Freetown',NULL,83000,-131500,'BEGIN:VTIMEZONE\r\nTZID:Africa/Freetown\r\nX-LIC-LOCATION:Africa/Freetown\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(23,'Africa/Gaborone',NULL,-243900,255500,'BEGIN:VTIMEZONE\r\nTZID:Africa/Gaborone\r\nX-LIC-LOCATION:Africa/Gaborone\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:CAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(24,'Africa/Harare',NULL,-175000,310300,'BEGIN:VTIMEZONE\r\nTZID:Africa/Harare\r\nX-LIC-LOCATION:Africa/Harare\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:CAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(25,'Africa/Johannesburg',NULL,-261500,280000,'BEGIN:VTIMEZONE\r\nTZID:Africa/Johannesburg\r\nX-LIC-LOCATION:Africa/Johannesburg\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:SAST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(26,'Africa/Juba',NULL,45100,313600,'BEGIN:VTIMEZONE\r\nTZID:Africa/Juba\r\nX-LIC-LOCATION:Africa/Juba\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(27,'Africa/Kampala',NULL,1900,322500,'BEGIN:VTIMEZONE\r\nTZID:Africa/Kampala\r\nX-LIC-LOCATION:Africa/Kampala\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(28,'Africa/Khartoum',NULL,153600,323200,'BEGIN:VTIMEZONE\r\nTZID:Africa/Khartoum\r\nX-LIC-LOCATION:Africa/Khartoum\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(29,'Africa/Kigali',NULL,-15700,300400,'BEGIN:VTIMEZONE\r\nTZID:Africa/Kigali\r\nX-LIC-LOCATION:Africa/Kigali\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:CAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(30,'Africa/Kinshasa',NULL,-41800,151800,'BEGIN:VTIMEZONE\r\nTZID:Africa/Kinshasa\r\nX-LIC-LOCATION:Africa/Kinshasa\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(31,'Africa/Lagos',NULL,62700,32400,'BEGIN:VTIMEZONE\r\nTZID:Africa/Lagos\r\nX-LIC-LOCATION:Africa/Lagos\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(32,'Africa/Libreville',NULL,2300,92700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Libreville\r\nX-LIC-LOCATION:Africa/Libreville\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(33,'Africa/Lome',NULL,60800,11300,'BEGIN:VTIMEZONE\r\nTZID:Africa/Lome\r\nX-LIC-LOCATION:Africa/Lome\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(34,'Africa/Luanda',NULL,-84800,131400,'BEGIN:VTIMEZONE\r\nTZID:Africa/Luanda\r\nX-LIC-LOCATION:Africa/Luanda\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(35,'Africa/Lubumbashi',NULL,-114000,272800,'BEGIN:VTIMEZONE\r\nTZID:Africa/Lubumbashi\r\nX-LIC-LOCATION:Africa/Lubumbashi\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:CAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(36,'Africa/Lusaka',NULL,-152500,281700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Lusaka\r\nX-LIC-LOCATION:Africa/Lusaka\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:CAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(37,'Africa/Malabo',NULL,34500,84700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Malabo\r\nX-LIC-LOCATION:Africa/Malabo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(38,'Africa/Maputo',NULL,-255800,323500,'BEGIN:VTIMEZONE\r\nTZID:Africa/Maputo\r\nX-LIC-LOCATION:Africa/Maputo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:CAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(39,'Africa/Maseru',NULL,-292800,273000,'BEGIN:VTIMEZONE\r\nTZID:Africa/Maseru\r\nX-LIC-LOCATION:Africa/Maseru\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:SAST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(40,'Africa/Mbabane',NULL,-261800,310600,'BEGIN:VTIMEZONE\r\nTZID:Africa/Mbabane\r\nX-LIC-LOCATION:Africa/Mbabane\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:SAST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(41,'Africa/Mogadishu',NULL,20400,452200,'BEGIN:VTIMEZONE\r\nTZID:Africa/Mogadishu\r\nX-LIC-LOCATION:Africa/Mogadishu\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(42,'Africa/Monrovia',NULL,61800,-104700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Monrovia\r\nX-LIC-LOCATION:Africa/Monrovia\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(43,'Africa/Nairobi',NULL,-11700,364900,'BEGIN:VTIMEZONE\r\nTZID:Africa/Nairobi\r\nX-LIC-LOCATION:Africa/Nairobi\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(44,'Africa/Ndjamena',NULL,120700,150300,'BEGIN:VTIMEZONE\r\nTZID:Africa/Ndjamena\r\nX-LIC-LOCATION:Africa/Ndjamena\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(45,'Africa/Niamey',NULL,133100,20700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Niamey\r\nX-LIC-LOCATION:Africa/Niamey\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(46,'Africa/Nouakchott',NULL,180600,-155700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Nouakchott\r\nX-LIC-LOCATION:Africa/Nouakchott\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(47,'Africa/Ouagadougou',NULL,122200,-13100,'BEGIN:VTIMEZONE\r\nTZID:Africa/Ouagadougou\r\nX-LIC-LOCATION:Africa/Ouagadougou\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(48,'Africa/Porto-Novo',NULL,62900,23700,'BEGIN:VTIMEZONE\r\nTZID:Africa/Porto-Novo\r\nX-LIC-LOCATION:Africa/Porto-Novo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(49,'Africa/Sao_Tome',NULL,2000,64400,'BEGIN:VTIMEZONE\r\nTZID:Africa/Sao_Tome\r\nX-LIC-LOCATION:Africa/Sao_Tome\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(50,'Africa/Tripoli',NULL,325400,131100,'BEGIN:VTIMEZONE\r\nTZID:Africa/Tripoli\r\nX-LIC-LOCATION:Africa/Tripoli\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700327T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1FR;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701030T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1FR;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(51,'Africa/Tunis',NULL,364800,101100,'BEGIN:VTIMEZONE\r\nTZID:Africa/Tunis\r\nX-LIC-LOCATION:Africa/Tunis\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(52,'Africa/Windhoek',NULL,-223400,170600,'BEGIN:VTIMEZONE\r\nTZID:Africa/Windhoek\r\nX-LIC-LOCATION:Africa/Windhoek\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:WAST\r\nDTSTART:19700906T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=9\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:WAT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(53,'America/Adak',NULL,515248,-1763929,'BEGIN:VTIMEZONE\r\nTZID:America/Adak\r\nX-LIC-LOCATION:America/Adak\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-1000\r\nTZOFFSETTO:-0900\r\nTZNAME:HADT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0900\r\nTZOFFSETTO:-1000\r\nTZNAME:HAST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(54,'America/Anchorage',NULL,611305,-1495401,'BEGIN:VTIMEZONE\r\nTZID:America/Anchorage\r\nX-LIC-LOCATION:America/Anchorage\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0900\r\nTZOFFSETTO:-0800\r\nTZNAME:AKDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0900\r\nTZNAME:AKST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(55,'America/Anguilla',NULL,181200,-630400,'BEGIN:VTIMEZONE\r\nTZID:America/Anguilla\r\nX-LIC-LOCATION:America/Anguilla\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(56,'America/Antigua',NULL,170300,-614800,'BEGIN:VTIMEZONE\r\nTZID:America/Antigua\r\nX-LIC-LOCATION:America/Antigua\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(57,'America/Araguaina',NULL,-71200,-481200,'BEGIN:VTIMEZONE\r\nTZID:America/Araguaina\r\nX-LIC-LOCATION:America/Araguaina\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0200\r\nTZNAME:BRST\r\nDTSTART:19701018T000000\r\nRRULE:FREQ=YEARLY;BYDAY=3SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:BRT\r\nDTSTART:19700215T000000\r\nRRULE:FREQ=YEARLY;BYDAY=3SU;BYMONTH=2\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(58,'America/Argentina/Buenos_Aires',NULL,-343600,-582700,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Buenos_Aires\r\nX-LIC-LOCATION:America/Argentina/Buenos_Aires\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(59,'America/Argentina/Catamarca',NULL,-282800,-654700,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Catamarca\r\nX-LIC-LOCATION:America/Argentina/Catamarca\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(60,'America/Argentina/Cordoba',NULL,-312400,-641100,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Cordoba\r\nX-LIC-LOCATION:America/Argentina/Cordoba\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(61,'America/Argentina/Jujuy',NULL,-241100,-651800,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Jujuy\r\nX-LIC-LOCATION:America/Argentina/Jujuy\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(62,'America/Argentina/La_Rioja',NULL,-292600,-665100,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/La_Rioja\r\nX-LIC-LOCATION:America/Argentina/La_Rioja\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(63,'America/Argentina/Mendoza',NULL,-325300,-684900,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Mendoza\r\nX-LIC-LOCATION:America/Argentina/Mendoza\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(64,'America/Argentina/Rio_Gallegos',NULL,-513800,-691300,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Rio_Gallegos\r\nX-LIC-LOCATION:America/Argentina/Rio_Gallegos\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(65,'America/Argentina/Salta',NULL,-244700,-652500,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Salta\r\nX-LIC-LOCATION:America/Argentina/Salta\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(66,'America/Argentina/San_Juan',NULL,-313200,-683100,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/San_Juan\r\nX-LIC-LOCATION:America/Argentina/San_Juan\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(67,'America/Argentina/San_Luis',NULL,-331900,-662100,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/San_Luis\r\nX-LIC-LOCATION:America/Argentina/San_Luis\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:WART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(68,'America/Argentina/Tucuman',NULL,-264900,-651300,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Tucuman\r\nX-LIC-LOCATION:America/Argentina/Tucuman\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(69,'America/Argentina/Ushuaia',NULL,-544800,-681800,'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Ushuaia\r\nX-LIC-LOCATION:America/Argentina/Ushuaia\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(70,'America/Aruba',NULL,123000,-695800,'BEGIN:VTIMEZONE\r\nTZID:America/Aruba\r\nX-LIC-LOCATION:America/Aruba\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(71,'America/Asuncion',NULL,-251600,-574000,'BEGIN:VTIMEZONE\r\nTZID:America/Asuncion\r\nX-LIC-LOCATION:America/Asuncion\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:PYST\r\nDTSTART:19701004T000000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:PYT\r\nDTSTART:19700322T000000\r\nRRULE:FREQ=YEARLY;BYDAY=4SU;BYMONTH=3\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(72,'America/Atikokan',NULL,484531,-913718,'BEGIN:VTIMEZONE\r\nTZID:America/Atikokan\r\nX-LIC-LOCATION:America/Atikokan\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(73,'America/Bahia',NULL,-125900,-383100,'BEGIN:VTIMEZONE\r\nTZID:America/Bahia\r\nX-LIC-LOCATION:America/Bahia\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:BRT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(74,'America/Bahia_Banderas',NULL,204800,-1051500,'BEGIN:VTIMEZONE\r\nTZID:America/Bahia_Banderas\r\nX-LIC-LOCATION:America/Bahia_Banderas\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(75,'America/Barbados',NULL,130600,-593700,'BEGIN:VTIMEZONE\r\nTZID:America/Barbados\r\nX-LIC-LOCATION:America/Barbados\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(76,'America/Belem',NULL,-12700,-482900,'BEGIN:VTIMEZONE\r\nTZID:America/Belem\r\nX-LIC-LOCATION:America/Belem\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:BRT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(77,'America/Belize',NULL,173000,-881200,'BEGIN:VTIMEZONE\r\nTZID:America/Belize\r\nX-LIC-LOCATION:America/Belize\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(78,'America/Blanc-Sablon',NULL,512500,-570700,'BEGIN:VTIMEZONE\r\nTZID:America/Blanc-Sablon\r\nX-LIC-LOCATION:America/Blanc-Sablon\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(79,'America/Boa_Vista',NULL,24900,-604000,'BEGIN:VTIMEZONE\r\nTZID:America/Boa_Vista\r\nX-LIC-LOCATION:America/Boa_Vista\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(80,'America/Bogota',NULL,43600,-740500,'BEGIN:VTIMEZONE\r\nTZID:America/Bogota\r\nX-LIC-LOCATION:America/Bogota\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0500\r\nTZNAME:COT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(81,'America/Boise',NULL,433649,-1161209,'BEGIN:VTIMEZONE\r\nTZID:America/Boise\r\nX-LIC-LOCATION:America/Boise\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(82,'America/Cambridge_Bay',NULL,690650,-1050310,'BEGIN:VTIMEZONE\r\nTZID:America/Cambridge_Bay\r\nX-LIC-LOCATION:America/Cambridge_Bay\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(83,'America/Campo_Grande',NULL,-202700,-543700,'BEGIN:VTIMEZONE\r\nTZID:America/Campo_Grande\r\nX-LIC-LOCATION:America/Campo_Grande\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:AMST\r\nDTSTART:19701018T000000\r\nRRULE:FREQ=YEARLY;BYDAY=3SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AMT\r\nDTSTART:19700215T000000\r\nRRULE:FREQ=YEARLY;BYDAY=3SU;BYMONTH=2\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(84,'America/Cancun',NULL,210500,-864600,'BEGIN:VTIMEZONE\r\nTZID:America/Cancun\r\nX-LIC-LOCATION:America/Cancun\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(85,'America/Caracas',NULL,103000,-665600,'BEGIN:VTIMEZONE\r\nTZID:America/Caracas\r\nX-LIC-LOCATION:America/Caracas\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0430\r\nTZOFFSETTO:-0430\r\nTZNAME:VET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(86,'America/Cayenne',NULL,45600,-522000,'BEGIN:VTIMEZONE\r\nTZID:America/Cayenne\r\nX-LIC-LOCATION:America/Cayenne\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:GFT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(87,'America/Cayman',NULL,191800,-812300,'BEGIN:VTIMEZONE\r\nTZID:America/Cayman\r\nX-LIC-LOCATION:America/Cayman\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(88,'America/Chicago',NULL,415100,-873900,'BEGIN:VTIMEZONE\r\nTZID:America/Chicago\r\nX-LIC-LOCATION:America/Chicago\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(89,'America/Chihuahua',NULL,283800,-1060500,'BEGIN:VTIMEZONE\r\nTZID:America/Chihuahua\r\nX-LIC-LOCATION:America/Chihuahua\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(90,'America/Costa_Rica',NULL,95600,-840500,'BEGIN:VTIMEZONE\r\nTZID:America/Costa_Rica\r\nX-LIC-LOCATION:America/Costa_Rica\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(91,'America/Creston',96,490600,-1163100,'BEGIN:VTIMEZONE\r\nTZID:America/Creston\r\nX-LIC-LOCATION:America/Creston\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(92,'America/Cuiaba',NULL,-153500,-560500,'BEGIN:VTIMEZONE\r\nTZID:America/Cuiaba\r\nX-LIC-LOCATION:America/Cuiaba\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:AMST\r\nDTSTART:19701018T000000\r\nRRULE:FREQ=YEARLY;BYDAY=3SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AMT\r\nDTSTART:19700215T000000\r\nRRULE:FREQ=YEARLY;BYDAY=3SU;BYMONTH=2\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(93,'America/Curacao',NULL,121100,-690000,'BEGIN:VTIMEZONE\r\nTZID:America/Curacao\r\nX-LIC-LOCATION:America/Curacao\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(94,'America/Danmarkshavn',NULL,764600,-184000,'BEGIN:VTIMEZONE\r\nTZID:America/Danmarkshavn\r\nX-LIC-LOCATION:America/Danmarkshavn\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(95,'America/Dawson',NULL,640400,-1392500,'BEGIN:VTIMEZONE\r\nTZID:America/Dawson\r\nX-LIC-LOCATION:America/Dawson\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0700\r\nTZNAME:PDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0800\r\nTZNAME:PST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(96,'America/Dawson_Creek',NULL,594600,-1201400,'BEGIN:VTIMEZONE\r\nTZID:America/Dawson_Creek\r\nX-LIC-LOCATION:America/Dawson_Creek\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(97,'America/Denver',NULL,394421,-1045903,'BEGIN:VTIMEZONE\r\nTZID:America/Denver\r\nX-LIC-LOCATION:America/Denver\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(98,'America/Detroit',NULL,421953,-830245,'BEGIN:VTIMEZONE\r\nTZID:America/Detroit\r\nX-LIC-LOCATION:America/Detroit\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(99,'America/Dominica',NULL,151800,-612400,'BEGIN:VTIMEZONE\r\nTZID:America/Dominica\r\nX-LIC-LOCATION:America/Dominica\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(100,'America/Edmonton',NULL,533300,-1132800,'BEGIN:VTIMEZONE\r\nTZID:America/Edmonton\r\nX-LIC-LOCATION:America/Edmonton\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(101,'America/Eirunepe',NULL,-64000,-695200,'BEGIN:VTIMEZONE\r\nTZID:America/Eirunepe\r\nX-LIC-LOCATION:America/Eirunepe\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(102,'America/El_Salvador',NULL,134200,-891200,'BEGIN:VTIMEZONE\r\nTZID:America/El_Salvador\r\nX-LIC-LOCATION:America/El_Salvador\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(103,'America/Fortaleza',NULL,-34300,-383000,'BEGIN:VTIMEZONE\r\nTZID:America/Fortaleza\r\nX-LIC-LOCATION:America/Fortaleza\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:BRT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(104,'America/Glace_Bay',NULL,461200,-595700,'BEGIN:VTIMEZONE\r\nTZID:America/Glace_Bay\r\nX-LIC-LOCATION:America/Glace_Bay\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:ADT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(105,'America/Godthab',NULL,641100,-514400,'BEGIN:VTIMEZONE\r\nTZID:America/Godthab\r\nX-LIC-LOCATION:America/Godthab\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0200\r\nTZNAME:WGST\r\nDTSTART:19700328T220000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SA;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0200\r\nTZOFFSETTO:-0300\r\nTZNAME:WGT\r\nDTSTART:19701024T230000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SA;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(106,'America/Goose_Bay',NULL,532000,-602500,'BEGIN:VTIMEZONE\r\nTZID:America/Goose_Bay\r\nX-LIC-LOCATION:America/Goose_Bay\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:ADT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(107,'America/Grand_Turk',NULL,212800,-710800,'BEGIN:VTIMEZONE\r\nTZID:America/Grand_Turk\r\nX-LIC-LOCATION:America/Grand_Turk\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(108,'America/Grenada',NULL,120300,-614500,'BEGIN:VTIMEZONE\r\nTZID:America/Grenada\r\nX-LIC-LOCATION:America/Grenada\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(109,'America/Guadeloupe',NULL,161400,-613200,'BEGIN:VTIMEZONE\r\nTZID:America/Guadeloupe\r\nX-LIC-LOCATION:America/Guadeloupe\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(110,'America/Guatemala',NULL,143800,-903100,'BEGIN:VTIMEZONE\r\nTZID:America/Guatemala\r\nX-LIC-LOCATION:America/Guatemala\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(111,'America/Guayaquil',NULL,-21000,-795000,'BEGIN:VTIMEZONE\r\nTZID:America/Guayaquil\r\nX-LIC-LOCATION:America/Guayaquil\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0500\r\nTZNAME:ECT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(112,'America/Guyana',NULL,64800,-581000,'BEGIN:VTIMEZONE\r\nTZID:America/Guyana\r\nX-LIC-LOCATION:America/Guyana\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:GYT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(113,'America/Halifax',NULL,443900,-633600,'BEGIN:VTIMEZONE\r\nTZID:America/Halifax\r\nX-LIC-LOCATION:America/Halifax\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:ADT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(114,'America/Havana',NULL,230800,-822200,'BEGIN:VTIMEZONE\r\nTZID:America/Havana\r\nX-LIC-LOCATION:America/Havana\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:CST\r\nDTSTART:19701101T010000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:CDT\r\nDTSTART:19700308T000000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(115,'America/Hermosillo',NULL,290400,-1105800,'BEGIN:VTIMEZONE\r\nTZID:America/Hermosillo\r\nX-LIC-LOCATION:America/Hermosillo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(116,'America/Indiana/Indianapolis',NULL,394606,-860929,'BEGIN:VTIMEZONE\r\nTZID:America/Indiana/Indianapolis\r\nX-LIC-LOCATION:America/Indiana/Indianapolis\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(117,'America/Indiana/Knox',NULL,411745,-863730,'BEGIN:VTIMEZONE\r\nTZID:America/Indiana/Knox\r\nX-LIC-LOCATION:America/Indiana/Knox\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(118,'America/Indiana/Marengo',NULL,382232,-862041,'BEGIN:VTIMEZONE\r\nTZID:America/Indiana/Marengo\r\nX-LIC-LOCATION:America/Indiana/Marengo\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(119,'America/Indiana/Petersburg',NULL,382931,-871643,'BEGIN:VTIMEZONE\r\nTZID:America/Indiana/Petersburg\r\nX-LIC-LOCATION:America/Indiana/Petersburg\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(120,'America/Indiana/Tell_City',NULL,375711,-864541,'BEGIN:VTIMEZONE\r\nTZID:America/Indiana/Tell_City\r\nX-LIC-LOCATION:America/Indiana/Tell_City\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(121,'America/Indiana/Vevay',NULL,384452,-850402,'BEGIN:VTIMEZONE\r\nTZID:America/Indiana/Vevay\r\nX-LIC-LOCATION:America/Indiana/Vevay\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(122,'America/Indiana/Vincennes',NULL,384038,-873143,'BEGIN:VTIMEZONE\r\nTZID:America/Indiana/Vincennes\r\nX-LIC-LOCATION:America/Indiana/Vincennes\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(123,'America/Indiana/Winamac',NULL,410305,-863611,'BEGIN:VTIMEZONE\r\nTZID:America/Indiana/Winamac\r\nX-LIC-LOCATION:America/Indiana/Winamac\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(124,'America/Inuvik',NULL,682059,-1334300,'BEGIN:VTIMEZONE\r\nTZID:America/Inuvik\r\nX-LIC-LOCATION:America/Inuvik\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(125,'America/Iqaluit',NULL,634400,-682800,'BEGIN:VTIMEZONE\r\nTZID:America/Iqaluit\r\nX-LIC-LOCATION:America/Iqaluit\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(126,'America/Jamaica',NULL,180000,-764800,'BEGIN:VTIMEZONE\r\nTZID:America/Jamaica\r\nX-LIC-LOCATION:America/Jamaica\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(127,'America/Juneau',NULL,581807,-1342511,'BEGIN:VTIMEZONE\r\nTZID:America/Juneau\r\nX-LIC-LOCATION:America/Juneau\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0900\r\nTZOFFSETTO:-0800\r\nTZNAME:AKDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0900\r\nTZNAME:AKST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(128,'America/Kentucky/Louisville',NULL,381515,-854534,'BEGIN:VTIMEZONE\r\nTZID:America/Kentucky/Louisville\r\nX-LIC-LOCATION:America/Kentucky/Louisville\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(129,'America/Kentucky/Monticello',NULL,364947,-845057,'BEGIN:VTIMEZONE\r\nTZID:America/Kentucky/Monticello\r\nX-LIC-LOCATION:America/Kentucky/Monticello\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(130,'America/Kralendijk',NULL,120903,-681636,'BEGIN:VTIMEZONE\r\nTZID:America/Kralendijk\r\nX-LIC-LOCATION:America/Kralendijk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(131,'America/La_Paz',NULL,-163000,-680900,'BEGIN:VTIMEZONE\r\nTZID:America/La_Paz\r\nX-LIC-LOCATION:America/La_Paz\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:BOT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(132,'America/Lima',NULL,-120300,-770300,'BEGIN:VTIMEZONE\r\nTZID:America/Lima\r\nX-LIC-LOCATION:America/Lima\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0500\r\nTZNAME:PET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(133,'America/Los_Angeles',NULL,340308,-1181434,'BEGIN:VTIMEZONE\r\nTZID:America/Los_Angeles\r\nX-LIC-LOCATION:America/Los_Angeles\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0700\r\nTZNAME:PDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0800\r\nTZNAME:PST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(134,'America/Lower_Princes',NULL,180305,-630250,'BEGIN:VTIMEZONE\r\nTZID:America/Lower_Princes\r\nX-LIC-LOCATION:America/Lower_Princes\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(135,'America/Maceio',NULL,-94000,-354300,'BEGIN:VTIMEZONE\r\nTZID:America/Maceio\r\nX-LIC-LOCATION:America/Maceio\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:BRT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(136,'America/Managua',NULL,120900,-861700,'BEGIN:VTIMEZONE\r\nTZID:America/Managua\r\nX-LIC-LOCATION:America/Managua\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(137,'America/Manaus',NULL,-30800,-600100,'BEGIN:VTIMEZONE\r\nTZID:America/Manaus\r\nX-LIC-LOCATION:America/Manaus\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(138,'America/Marigot',NULL,180400,-630500,'BEGIN:VTIMEZONE\r\nTZID:America/Marigot\r\nX-LIC-LOCATION:America/Marigot\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(139,'America/Martinique',NULL,143600,-610500,'BEGIN:VTIMEZONE\r\nTZID:America/Martinique\r\nX-LIC-LOCATION:America/Martinique\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(140,'America/Matamoros',NULL,255000,-973000,'BEGIN:VTIMEZONE\r\nTZID:America/Matamoros\r\nX-LIC-LOCATION:America/Matamoros\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(141,'America/Mazatlan',NULL,231300,-1062500,'BEGIN:VTIMEZONE\r\nTZID:America/Mazatlan\r\nX-LIC-LOCATION:America/Mazatlan\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(142,'America/Menominee',NULL,450628,-873651,'BEGIN:VTIMEZONE\r\nTZID:America/Menominee\r\nX-LIC-LOCATION:America/Menominee\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(143,'America/Merida',NULL,205800,-893700,'BEGIN:VTIMEZONE\r\nTZID:America/Merida\r\nX-LIC-LOCATION:America/Merida\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(144,'America/Metlakatla',NULL,550737,-1313435,'BEGIN:VTIMEZONE\r\nTZID:America/Metlakatla\r\nX-LIC-LOCATION:America/Metlakatla\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0800\r\nTZNAME:MeST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(145,'America/Mexico_City',NULL,192400,-990900,'BEGIN:VTIMEZONE\r\nTZID:America/Mexico_City\r\nX-LIC-LOCATION:America/Mexico_City\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(146,'America/Miquelon',NULL,470300,-562000,'BEGIN:VTIMEZONE\r\nTZID:America/Miquelon\r\nX-LIC-LOCATION:America/Miquelon\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0200\r\nTZNAME:PMDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0200\r\nTZOFFSETTO:-0300\r\nTZNAME:PMST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(147,'America/Moncton',NULL,460600,-644700,'BEGIN:VTIMEZONE\r\nTZID:America/Moncton\r\nX-LIC-LOCATION:America/Moncton\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:ADT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(148,'America/Monterrey',NULL,254000,-1001900,'BEGIN:VTIMEZONE\r\nTZID:America/Monterrey\r\nX-LIC-LOCATION:America/Monterrey\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(149,'America/Montevideo',NULL,-345300,-561100,'BEGIN:VTIMEZONE\r\nTZID:America/Montevideo\r\nX-LIC-LOCATION:America/Montevideo\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0200\r\nTZNAME:UYST\r\nDTSTART:19701004T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0200\r\nTZOFFSETTO:-0300\r\nTZNAME:UYT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(150,'America/Montreal',NULL,453100,-733400,'BEGIN:VTIMEZONE\r\nTZID:America/Montreal\r\nX-LIC-LOCATION:America/Montreal\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(151,'America/Montserrat',NULL,164300,-621300,'BEGIN:VTIMEZONE\r\nTZID:America/Montserrat\r\nX-LIC-LOCATION:America/Montserrat\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(152,'America/Nassau',NULL,250500,-772100,'BEGIN:VTIMEZONE\r\nTZID:America/Nassau\r\nX-LIC-LOCATION:America/Nassau\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(153,'America/New_York',NULL,404251,-740023,'BEGIN:VTIMEZONE\r\nTZID:America/New_York\r\nX-LIC-LOCATION:America/New_York\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(154,'America/Nipigon',NULL,490100,-881600,'BEGIN:VTIMEZONE\r\nTZID:America/Nipigon\r\nX-LIC-LOCATION:America/Nipigon\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(155,'America/Nome',NULL,643004,-1652423,'BEGIN:VTIMEZONE\r\nTZID:America/Nome\r\nX-LIC-LOCATION:America/Nome\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0900\r\nTZOFFSETTO:-0800\r\nTZNAME:AKDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0900\r\nTZNAME:AKST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(156,'America/Noronha',NULL,-35100,-322500,'BEGIN:VTIMEZONE\r\nTZID:America/Noronha\r\nX-LIC-LOCATION:America/Noronha\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0200\r\nTZOFFSETTO:-0200\r\nTZNAME:FNT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(157,'America/North_Dakota/Beulah',NULL,471551,-1014640,'BEGIN:VTIMEZONE\r\nTZID:America/North_Dakota/Beulah\r\nX-LIC-LOCATION:America/North_Dakota/Beulah\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(158,'America/North_Dakota/Center',NULL,470659,-1011757,'BEGIN:VTIMEZONE\r\nTZID:America/North_Dakota/Center\r\nX-LIC-LOCATION:America/North_Dakota/Center\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(159,'America/North_Dakota/New_Salem',NULL,465042,-1012439,'BEGIN:VTIMEZONE\r\nTZID:America/North_Dakota/New_Salem\r\nX-LIC-LOCATION:America/North_Dakota/New_Salem\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(160,'America/Ojinaga',NULL,293400,-1042500,'BEGIN:VTIMEZONE\r\nTZID:America/Ojinaga\r\nX-LIC-LOCATION:America/Ojinaga\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(161,'America/Panama',NULL,85800,-793200,'BEGIN:VTIMEZONE\r\nTZID:America/Panama\r\nX-LIC-LOCATION:America/Panama\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(162,'America/Pangnirtung',NULL,660800,-654400,'BEGIN:VTIMEZONE\r\nTZID:America/Pangnirtung\r\nX-LIC-LOCATION:America/Pangnirtung\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(163,'America/Paramaribo',NULL,55000,-551000,'BEGIN:VTIMEZONE\r\nTZID:America/Paramaribo\r\nX-LIC-LOCATION:America/Paramaribo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:SRT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(164,'America/Phoenix',NULL,332654,-1120424,'BEGIN:VTIMEZONE\r\nTZID:America/Phoenix\r\nX-LIC-LOCATION:America/Phoenix\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(165,'America/Port-au-Prince',NULL,183200,-722000,'BEGIN:VTIMEZONE\r\nTZID:America/Port-au-Prince\r\nX-LIC-LOCATION:America/Port-au-Prince\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(166,'America/Port_of_Spain',NULL,103900,-613100,'BEGIN:VTIMEZONE\r\nTZID:America/Port_of_Spain\r\nX-LIC-LOCATION:America/Port_of_Spain\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(167,'America/Porto_Velho',NULL,-84600,-635400,'BEGIN:VTIMEZONE\r\nTZID:America/Porto_Velho\r\nX-LIC-LOCATION:America/Porto_Velho\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(168,'America/Puerto_Rico',NULL,182806,-660622,'BEGIN:VTIMEZONE\r\nTZID:America/Puerto_Rico\r\nX-LIC-LOCATION:America/Puerto_Rico\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(169,'America/Rainy_River',NULL,484300,-943400,'BEGIN:VTIMEZONE\r\nTZID:America/Rainy_River\r\nX-LIC-LOCATION:America/Rainy_River\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(170,'America/Rankin_Inlet',NULL,624900,-920459,'BEGIN:VTIMEZONE\r\nTZID:America/Rankin_Inlet\r\nX-LIC-LOCATION:America/Rankin_Inlet\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(171,'America/Recife',NULL,-80300,-345400,'BEGIN:VTIMEZONE\r\nTZID:America/Recife\r\nX-LIC-LOCATION:America/Recife\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:BRT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(172,'America/Regina',NULL,502400,-1043900,'BEGIN:VTIMEZONE\r\nTZID:America/Regina\r\nX-LIC-LOCATION:America/Regina\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(173,'America/Resolute',NULL,744144,-944945,'BEGIN:VTIMEZONE\r\nTZID:America/Resolute\r\nX-LIC-LOCATION:America/Resolute\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(174,'America/Rio_Branco',NULL,-95800,-674800,'BEGIN:VTIMEZONE\r\nTZID:America/Rio_Branco\r\nX-LIC-LOCATION:America/Rio_Branco\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(175,'America/Santa_Isabel',NULL,301800,-1145200,'BEGIN:VTIMEZONE\r\nTZID:America/Santa_Isabel\r\nX-LIC-LOCATION:America/Santa_Isabel\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0800\r\nTZNAME:PST\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0700\r\nTZNAME:PDT\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(176,'America/Santarem',NULL,-22600,-545200,'BEGIN:VTIMEZONE\r\nTZID:America/Santarem\r\nX-LIC-LOCATION:America/Santarem\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:BRT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(177,'America/Santiago',NULL,-332700,-704000,'BEGIN:VTIMEZONE\r\nTZID:America/Santiago\r\nX-LIC-LOCATION:America/Santiago\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:CLT\r\nDTSTART:19700426T000000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:CLST\r\nDTSTART:19700906T000000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=9\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(178,'America/Santo_Domingo',NULL,182800,-695400,'BEGIN:VTIMEZONE\r\nTZID:America/Santo_Domingo\r\nX-LIC-LOCATION:America/Santo_Domingo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(179,'America/Sao_Paulo',NULL,-233200,-463700,'BEGIN:VTIMEZONE\r\nTZID:America/Sao_Paulo\r\nX-LIC-LOCATION:America/Sao_Paulo\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0200\r\nTZNAME:BRST\r\nDTSTART:19701018T000000\r\nRRULE:FREQ=YEARLY;BYDAY=3SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:BRT\r\nDTSTART:19700215T000000\r\nRRULE:FREQ=YEARLY;BYDAY=3SU;BYMONTH=2\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(180,'America/Scoresbysund',NULL,702900,-215800,'BEGIN:VTIMEZONE\r\nTZID:America/Scoresbysund\r\nX-LIC-LOCATION:America/Scoresbysund\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0100\r\nTZOFFSETTO:+0000\r\nTZNAME:EGST\r\nDTSTART:19700329T000000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:-0100\r\nTZNAME:EGT\r\nDTSTART:19701025T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(181,'America/Shiprock',NULL,364708,-1084111,'BEGIN:VTIMEZONE\r\nTZID:America/Shiprock\r\nX-LIC-LOCATION:America/Shiprock\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(182,'America/Sitka',NULL,571035,-1351807,'BEGIN:VTIMEZONE\r\nTZID:America/Sitka\r\nX-LIC-LOCATION:America/Sitka\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0900\r\nTZOFFSETTO:-0800\r\nTZNAME:AKDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0900\r\nTZNAME:AKST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(183,'America/St_Barthelemy',NULL,175300,-625100,'BEGIN:VTIMEZONE\r\nTZID:America/St_Barthelemy\r\nX-LIC-LOCATION:America/St_Barthelemy\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(184,'America/St_Johns',NULL,473400,-524300,'BEGIN:VTIMEZONE\r\nTZID:America/St_Johns\r\nX-LIC-LOCATION:America/St_Johns\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0230\r\nTZOFFSETTO:-0330\r\nTZNAME:NST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0330\r\nTZOFFSETTO:-0230\r\nTZNAME:NDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(185,'America/St_Kitts',NULL,171800,-624300,'BEGIN:VTIMEZONE\r\nTZID:America/St_Kitts\r\nX-LIC-LOCATION:America/St_Kitts\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(186,'America/St_Lucia',NULL,140100,-610000,'BEGIN:VTIMEZONE\r\nTZID:America/St_Lucia\r\nX-LIC-LOCATION:America/St_Lucia\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(187,'America/St_Thomas',NULL,182100,-645600,'BEGIN:VTIMEZONE\r\nTZID:America/St_Thomas\r\nX-LIC-LOCATION:America/St_Thomas\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(188,'America/St_Vincent',NULL,130900,-611400,'BEGIN:VTIMEZONE\r\nTZID:America/St_Vincent\r\nX-LIC-LOCATION:America/St_Vincent\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(189,'America/Swift_Current',NULL,501700,-1075000,'BEGIN:VTIMEZONE\r\nTZID:America/Swift_Current\r\nX-LIC-LOCATION:America/Swift_Current\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(190,'America/Tegucigalpa',NULL,140600,-871300,'BEGIN:VTIMEZONE\r\nTZID:America/Tegucigalpa\r\nX-LIC-LOCATION:America/Tegucigalpa\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(191,'America/Thule',NULL,763400,-684700,'BEGIN:VTIMEZONE\r\nTZID:America/Thule\r\nX-LIC-LOCATION:America/Thule\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:ADT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(192,'America/Thunder_Bay',NULL,482300,-891500,'BEGIN:VTIMEZONE\r\nTZID:America/Thunder_Bay\r\nX-LIC-LOCATION:America/Thunder_Bay\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(193,'America/Tijuana',NULL,323200,-1170100,'BEGIN:VTIMEZONE\r\nTZID:America/Tijuana\r\nX-LIC-LOCATION:America/Tijuana\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0700\r\nTZNAME:PDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0800\r\nTZNAME:PST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(194,'America/Toronto',NULL,433900,-792300,'BEGIN:VTIMEZONE\r\nTZID:America/Toronto\r\nX-LIC-LOCATION:America/Toronto\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0400\r\nTZNAME:EDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0500\r\nTZNAME:EST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(195,'America/Tortola',NULL,182700,-643700,'BEGIN:VTIMEZONE\r\nTZID:America/Tortola\r\nX-LIC-LOCATION:America/Tortola\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(196,'America/Vancouver',NULL,491600,-1230700,'BEGIN:VTIMEZONE\r\nTZID:America/Vancouver\r\nX-LIC-LOCATION:America/Vancouver\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0700\r\nTZNAME:PDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0800\r\nTZNAME:PST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(197,'America/Whitehorse',NULL,604300,-1350300,'BEGIN:VTIMEZONE\r\nTZID:America/Whitehorse\r\nX-LIC-LOCATION:America/Whitehorse\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0700\r\nTZNAME:PDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0800\r\nTZNAME:PST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(198,'America/Winnipeg',NULL,495300,-970900,'BEGIN:VTIMEZONE\r\nTZID:America/Winnipeg\r\nX-LIC-LOCATION:America/Winnipeg\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:CDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:CST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(199,'America/Yakutat',NULL,593249,-1394338,'BEGIN:VTIMEZONE\r\nTZID:America/Yakutat\r\nX-LIC-LOCATION:America/Yakutat\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0900\r\nTZOFFSETTO:-0800\r\nTZNAME:AKDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0900\r\nTZNAME:AKST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(200,'America/Yellowknife',NULL,622700,-1142100,'BEGIN:VTIMEZONE\r\nTZID:America/Yellowknife\r\nX-LIC-LOCATION:America/Yellowknife\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0700\r\nTZOFFSETTO:-0600\r\nTZNAME:MDT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0700\r\nTZNAME:MST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(201,'Antarctica/Casey',NULL,-661700,1103100,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/Casey\r\nX-LIC-LOCATION:Antarctica/Casey\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:WST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(202,'Antarctica/Davis',NULL,-683500,775800,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/Davis\r\nX-LIC-LOCATION:Antarctica/Davis\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:DAVT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(203,'Antarctica/DumontDUrville',NULL,-664000,1400100,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/DumontDUrville\r\nX-LIC-LOCATION:Antarctica/DumontDUrville\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:DDUT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(204,'Antarctica/Macquarie',NULL,-543000,1585700,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/Macquarie\r\nX-LIC-LOCATION:Antarctica/Macquarie\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:MIST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(205,'Antarctica/Mawson',NULL,-673600,625300,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/Mawson\r\nX-LIC-LOCATION:Antarctica/Mawson\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:MAWT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(206,'Antarctica/McMurdo',NULL,-775000,1663600,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/McMurdo\r\nX-LIC-LOCATION:Antarctica/McMurdo\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1300\r\nTZNAME:NZDT\r\nDTSTART:19700927T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=9\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1200\r\nTZNAME:NZST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(207,'Antarctica/Palmer',NULL,-644800,-640600,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/Palmer\r\nX-LIC-LOCATION:Antarctica/Palmer\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:CLT\r\nDTSTART:19700426T000000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:CLST\r\nDTSTART:19700906T000000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=9\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(208,'Antarctica/Rothera',NULL,-673400,-680800,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/Rothera\r\nX-LIC-LOCATION:Antarctica/Rothera\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ROTT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(209,'Antarctica/South_Pole',NULL,-900000,0,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/South_Pole\r\nX-LIC-LOCATION:Antarctica/South_Pole\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1300\r\nTZNAME:NZDT\r\nDTSTART:19700927T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=9\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1200\r\nTZNAME:NZST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(210,'Antarctica/Syowa',NULL,-690022,393524,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/Syowa\r\nX-LIC-LOCATION:Antarctica/Syowa\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:SYOT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(211,'Antarctica/Vostok',NULL,-782400,1065400,'BEGIN:VTIMEZONE\r\nTZID:Antarctica/Vostok\r\nX-LIC-LOCATION:Antarctica/Vostok\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0600\r\nTZOFFSETTO:+0600\r\nTZNAME:VOST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(212,'Arctic/Longyearbyen',NULL,780000,160000,'BEGIN:VTIMEZONE\r\nTZID:Arctic/Longyearbyen\r\nX-LIC-LOCATION:Arctic/Longyearbyen\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(213,'Asia/Aden',NULL,124500,451200,'BEGIN:VTIMEZONE\r\nTZID:Asia/Aden\r\nX-LIC-LOCATION:Asia/Aden\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(214,'Asia/Almaty',NULL,431500,765700,'BEGIN:VTIMEZONE\r\nTZID:Asia/Almaty\r\nX-LIC-LOCATION:Asia/Almaty\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0600\r\nTZOFFSETTO:+0600\r\nTZNAME:ALMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(215,'Asia/Amman',NULL,315700,355600,'BEGIN:VTIMEZONE\r\nTZID:Asia/Amman\r\nX-LIC-LOCATION:Asia/Amman\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701030T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1FR;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700326T235959\r\nRRULE:FREQ=YEARLY;BYDAY=-1TH;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(216,'Asia/Anadyr',NULL,644500,1772900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Anadyr\r\nX-LIC-LOCATION:Asia/Anadyr\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:ANAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(217,'Asia/Aqtau',NULL,443100,501600,'BEGIN:VTIMEZONE\r\nTZID:Asia/Aqtau\r\nX-LIC-LOCATION:Asia/Aqtau\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:AQTT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(218,'Asia/Aqtobe',NULL,501700,571000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Aqtobe\r\nX-LIC-LOCATION:Asia/Aqtobe\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:AQTT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(219,'Asia/Ashgabat',NULL,375700,582300,'BEGIN:VTIMEZONE\r\nTZID:Asia/Ashgabat\r\nX-LIC-LOCATION:Asia/Ashgabat\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:TMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(220,'Asia/Baghdad',NULL,332100,442500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Baghdad\r\nX-LIC-LOCATION:Asia/Baghdad\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(221,'Asia/Bahrain',NULL,262300,503500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Bahrain\r\nX-LIC-LOCATION:Asia/Bahrain\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(222,'Asia/Baku',NULL,402300,495100,'BEGIN:VTIMEZONE\r\nTZID:Asia/Baku\r\nX-LIC-LOCATION:Asia/Baku\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0500\r\nTZNAME:AZST\r\nDTSTART:19700329T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0400\r\nTZNAME:AZT\r\nDTSTART:19701025T050000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(223,'Asia/Bangkok',NULL,134500,1003100,'BEGIN:VTIMEZONE\r\nTZID:Asia/Bangkok\r\nX-LIC-LOCATION:Asia/Bangkok\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:ICT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(224,'Asia/Beirut',NULL,335300,353000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Beirut\r\nX-LIC-LOCATION:Asia/Beirut\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T000000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T000000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(225,'Asia/Bishkek',NULL,425400,743600,'BEGIN:VTIMEZONE\r\nTZID:Asia/Bishkek\r\nX-LIC-LOCATION:Asia/Bishkek\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0600\r\nTZOFFSETTO:+0600\r\nTZNAME:KGT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(226,'Asia/Brunei',NULL,45600,1145500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Brunei\r\nX-LIC-LOCATION:Asia/Brunei\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:BNT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(227,'Asia/Choibalsan',NULL,480400,1143000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Choibalsan\r\nX-LIC-LOCATION:Asia/Choibalsan\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(228,'Asia/Chongqing',NULL,293400,1063500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Chongqing\r\nX-LIC-LOCATION:Asia/Chongqing\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(229,'Asia/Colombo',NULL,65600,795100,'BEGIN:VTIMEZONE\r\nTZID:Asia/Colombo\r\nX-LIC-LOCATION:Asia/Colombo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0530\r\nTZOFFSETTO:+0530\r\nTZNAME:IST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(230,'Asia/Damascus',NULL,333000,361800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Damascus\r\nX-LIC-LOCATION:Asia/Damascus\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701030T000000\r\nRRULE:FREQ=YEARLY;BYDAY=-1FR;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700327T000000\r\nRRULE:FREQ=YEARLY;BYDAY=-1FR;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(231,'Asia/Dhaka',NULL,234300,902500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Dhaka\r\nX-LIC-LOCATION:Asia/Dhaka\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0600\r\nTZOFFSETTO:+0600\r\nTZNAME:BDT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(232,'Asia/Dili',NULL,-83300,1253500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Dili\r\nX-LIC-LOCATION:Asia/Dili\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0900\r\nTZOFFSETTO:+0900\r\nTZNAME:TLT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(233,'Asia/Dubai',NULL,251800,551800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Dubai\r\nX-LIC-LOCATION:Asia/Dubai\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:GST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(234,'Asia/Dushanbe',NULL,383500,684800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Dushanbe\r\nX-LIC-LOCATION:Asia/Dushanbe\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:TJT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(235,'Asia/Gaza',NULL,313000,342800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Gaza\r\nX-LIC-LOCATION:Asia/Gaza\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:20120329T235959\r\nRRULE:FREQ=YEARLY;BYDAY=-1TH;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:20120921T010000\r\nRRULE:FREQ=YEARLY;BYDAY=FR;BYMONTHDAY=21,22,23,24,25,26,27;BYMONTH=9\r\nEND:STANDARD\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+021752\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19001001T000000\r\nRDATE;VALUE=DATE-TIME:19001001T000000\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EET\r\nDTSTART:19400601T000000\r\nRDATE;VALUE=DATE-TIME:19400601T000000\r\nRDATE;VALUE=DATE-TIME:19430401T020000\r\nRDATE;VALUE=DATE-TIME:19440401T000000\r\nRDATE;VALUE=DATE-TIME:19450416T000000\r\nRDATE;VALUE=DATE-TIME:19460416T020000\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19421101T000000\r\nRDATE;VALUE=DATE-TIME:19421101T000000\r\nRDATE;VALUE=DATE-TIME:19431101T000000\r\nRDATE;VALUE=DATE-TIME:19441101T000000\r\nRDATE;VALUE=DATE-TIME:19451101T020000\r\nRDATE;VALUE=DATE-TIME:19461101T000000\r\nRDATE;VALUE=DATE-TIME:19571001T000000\r\nRDATE;VALUE=DATE-TIME:19581001T000000\r\nRDATE;VALUE=DATE-TIME:19590930T030000\r\nRDATE;VALUE=DATE-TIME:19600930T030000\r\nRDATE;VALUE=DATE-TIME:19610930T030000\r\nRDATE;VALUE=DATE-TIME:19620930T030000\r\nRDATE;VALUE=DATE-TIME:19630930T030000\r\nRDATE;VALUE=DATE-TIME:19640930T030000\r\nRDATE;VALUE=DATE-TIME:19650930T030000\r\nRDATE;VALUE=DATE-TIME:19661001T030000\r\nRDATE;VALUE=DATE-TIME:19960920T010000\r\nRDATE;VALUE=DATE-TIME:19970919T010000\r\nRDATE;VALUE=DATE-TIME:19980918T010000\r\nRDATE;VALUE=DATE-TIME:19991015T000000\r\nRDATE;VALUE=DATE-TIME:20001020T000000\r\nRDATE;VALUE=DATE-TIME:20011019T000000\r\nRDATE;VALUE=DATE-TIME:20021018T000000\r\nRDATE;VALUE=DATE-TIME:20031017T000000\r\nRDATE;VALUE=DATE-TIME:20041001T010000\r\nRDATE;VALUE=DATE-TIME:20051004T020000\r\nRDATE;VALUE=DATE-TIME:20060922T000000\r\nRDATE;VALUE=DATE-TIME:20070913T020000\r\nRDATE;VALUE=DATE-TIME:20080829T000000\r\nRDATE;VALUE=DATE-TIME:20090904T010000\r\nRDATE;VALUE=DATE-TIME:20100811T000000\r\nRDATE;VALUE=DATE-TIME:20110801T000000\r\nEND:STANDARD\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19480515T000000\r\nRDATE;VALUE=DATE-TIME:19480515T000000\r\nRDATE;VALUE=DATE-TIME:19960101T000000\r\nRDATE;VALUE=DATE-TIME:19990101T000000\r\nRDATE;VALUE=DATE-TIME:20080901T000000\r\nRDATE;VALUE=DATE-TIME:20100101T000000\r\nRDATE;VALUE=DATE-TIME:20120101T000000\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19570510T000000\r\nRDATE;VALUE=DATE-TIME:19570510T000000\r\nRDATE;VALUE=DATE-TIME:19580501T000000\r\nRDATE;VALUE=DATE-TIME:19590501T010000\r\nRDATE;VALUE=DATE-TIME:19600501T010000\r\nRDATE;VALUE=DATE-TIME:19610501T010000\r\nRDATE;VALUE=DATE-TIME:19620501T010000\r\nRDATE;VALUE=DATE-TIME:19630501T010000\r\nRDATE;VALUE=DATE-TIME:19640501T010000\r\nRDATE;VALUE=DATE-TIME:19650501T010000\r\nRDATE;VALUE=DATE-TIME:19660501T010000\r\nRDATE;VALUE=DATE-TIME:19670501T010000\r\nRDATE;VALUE=DATE-TIME:19960405T000000\r\nRDATE;VALUE=DATE-TIME:19970404T000000\r\nRDATE;VALUE=DATE-TIME:19980403T000000\r\nRDATE;VALUE=DATE-TIME:19990416T000000\r\nRDATE;VALUE=DATE-TIME:20000421T000000\r\nRDATE;VALUE=DATE-TIME:20010420T000000\r\nRDATE;VALUE=DATE-TIME:20020419T000000\r\nRDATE;VALUE=DATE-TIME:20030418T000000\r\nRDATE;VALUE=DATE-TIME:20040416T000000\r\nRDATE;VALUE=DATE-TIME:20050415T000000\r\nRDATE;VALUE=DATE-TIME:20060401T000000\r\nRDATE;VALUE=DATE-TIME:20070401T000000\r\nRDATE;VALUE=DATE-TIME:20080328T000000\r\nRDATE;VALUE=DATE-TIME:20090327T000000\r\nRDATE;VALUE=DATE-TIME:20100327T000100\r\nRDATE;VALUE=DATE-TIME:20110401T000100\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:IST\r\nDTSTART:19670605T000000\r\nRDATE;VALUE=DATE-TIME:19670605T000000\r\nRDATE;VALUE=DATE-TIME:19741013T000000\r\nRDATE;VALUE=DATE-TIME:19750831T000000\r\nRDATE;VALUE=DATE-TIME:19850915T000000\r\nRDATE;VALUE=DATE-TIME:19860907T000000\r\nRDATE;VALUE=DATE-TIME:19870913T000000\r\nRDATE;VALUE=DATE-TIME:19880903T000000\r\nRDATE;VALUE=DATE-TIME:19890903T000000\r\nRDATE;VALUE=DATE-TIME:19900826T000000\r\nRDATE;VALUE=DATE-TIME:19910901T000000\r\nRDATE;VALUE=DATE-TIME:19920906T000000\r\nRDATE;VALUE=DATE-TIME:19930905T000000\r\nRDATE;VALUE=DATE-TIME:19940828T000000\r\nRDATE;VALUE=DATE-TIME:19950903T000000\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:IDT\r\nDTSTART:19740707T000000\r\nRDATE;VALUE=DATE-TIME:19740707T000000\r\nRDATE;VALUE=DATE-TIME:19750420T000000\r\nRDATE;VALUE=DATE-TIME:19850414T000000\r\nRDATE;VALUE=DATE-TIME:19860518T000000\r\nRDATE;VALUE=DATE-TIME:19870415T000000\r\nRDATE;VALUE=DATE-TIME:19880409T000000\r\nRDATE;VALUE=DATE-TIME:19890430T000000\r\nRDATE;VALUE=DATE-TIME:19900325T000000\r\nRDATE;VALUE=DATE-TIME:19910324T000000\r\nRDATE;VALUE=DATE-TIME:19920329T000000\r\nRDATE;VALUE=DATE-TIME:19930402T000000\r\nRDATE;VALUE=DATE-TIME:19940401T000000\r\nRDATE;VALUE=DATE-TIME:19950331T000000\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(236,'Asia/Harbin',NULL,454500,1264100,'BEGIN:VTIMEZONE\r\nTZID:Asia/Harbin\r\nX-LIC-LOCATION:Asia/Harbin\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(237,'Asia/Hebron',NULL,313200,350542,'BEGIN:VTIMEZONE\r\nTZID:Asia/Hebron\r\nX-LIC-LOCATION:Asia/Hebron\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700326T235959\r\nRRULE:FREQ=YEARLY;BYDAY=-1TH;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(238,'Asia/Ho_Chi_Minh',NULL,104500,1064000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Ho_Chi_Minh\r\nX-LIC-LOCATION:Asia/Ho_Chi_Minh\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:ICT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(239,'Asia/Hong_Kong',NULL,221700,1140900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Hong_Kong\r\nX-LIC-LOCATION:Asia/Hong_Kong\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:HKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(240,'Asia/Hovd',NULL,480100,913900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Hovd\r\nX-LIC-LOCATION:Asia/Hovd\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:HOVT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(241,'Asia/Irkutsk',NULL,521600,1042000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Irkutsk\r\nX-LIC-LOCATION:Asia/Irkutsk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0900\r\nTZOFFSETTO:+0900\r\nTZNAME:IRKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(242,'Asia/Istanbul',NULL,410100,285800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Istanbul\r\nX-LIC-LOCATION:Asia/Istanbul\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(243,'Asia/Jakarta',NULL,-61000,1064800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Jakarta\r\nX-LIC-LOCATION:Asia/Jakarta\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:WIT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(244,'Asia/Jayapura',NULL,-23200,1404200,'BEGIN:VTIMEZONE\r\nTZID:Asia/Jayapura\r\nX-LIC-LOCATION:Asia/Jayapura\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0900\r\nTZOFFSETTO:+0900\r\nTZNAME:EIT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(245,'Asia/Jerusalem',NULL,314600,351400,'BEGIN:VTIMEZONE\r\nTZID:Asia/Jerusalem\r\nX-LIC-LOCATION:Asia/Jerusalem\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:IDT\r\nDTSTART:20130329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=FR;BYMONTHDAY=23,24,25,26,27,28,29;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:IST\r\nDTSTART:20281008T020000\r\nRRULE:FREQ=YEARLY;BYDAY=SU;BYMONTHDAY=2,3,4,5,6,7,8;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+022056\r\nTZOFFSETTO:+022040\r\nTZNAME:JMT\r\nDTSTART:18800101T000000\r\nRDATE;VALUE=DATE-TIME:18800101T000000\r\nEND:STANDARD\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+022040\r\nTZOFFSETTO:+0200\r\nTZNAME:IST\r\nDTSTART:19180101T000000\r\nRDATE;VALUE=DATE-TIME:19180101T000000\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:IDT\r\nDTSTART:19400601T000000\r\nRDATE;VALUE=DATE-TIME:19400601T000000\r\nRDATE;VALUE=DATE-TIME:19430401T020000\r\nRDATE;VALUE=DATE-TIME:19440401T000000\r\nRDATE;VALUE=DATE-TIME:19450416T000000\r\nRDATE;VALUE=DATE-TIME:19460416T020000\r\nRDATE;VALUE=DATE-TIME:19490501T000000\r\nRDATE;VALUE=DATE-TIME:19500416T000000\r\nRDATE;VALUE=DATE-TIME:19510401T000000\r\nRDATE;VALUE=DATE-TIME:19520420T020000\r\nRDATE;VALUE=DATE-TIME:19530412T020000\r\nRDATE;VALUE=DATE-TIME:19540613T000000\r\nRDATE;VALUE=DATE-TIME:19550611T020000\r\nRDATE;VALUE=DATE-TIME:19560603T000000\r\nRDATE;VALUE=DATE-TIME:19570429T020000\r\nRDATE;VALUE=DATE-TIME:19740707T000000\r\nRDATE;VALUE=DATE-TIME:19750420T000000\r\nRDATE;VALUE=DATE-TIME:19850414T000000\r\nRDATE;VALUE=DATE-TIME:19860518T000000\r\nRDATE;VALUE=DATE-TIME:19870415T000000\r\nRDATE;VALUE=DATE-TIME:19880409T000000\r\nRDATE;VALUE=DATE-TIME:19890430T000000\r\nRDATE;VALUE=DATE-TIME:19900325T000000\r\nRDATE;VALUE=DATE-TIME:19910324T000000\r\nRDATE;VALUE=DATE-TIME:19920329T000000\r\nRDATE;VALUE=DATE-TIME:19930402T000000\r\nRDATE;VALUE=DATE-TIME:19940401T000000\r\nRDATE;VALUE=DATE-TIME:19950331T000000\r\nRDATE;VALUE=DATE-TIME:19960315T000000\r\nRDATE;VALUE=DATE-TIME:19970321T000000\r\nRDATE;VALUE=DATE-TIME:19980320T000000\r\nRDATE;VALUE=DATE-TIME:19990402T020000\r\nRDATE;VALUE=DATE-TIME:20000414T020000\r\nRDATE;VALUE=DATE-TIME:20010409T010000\r\nRDATE;VALUE=DATE-TIME:20020329T010000\r\nRDATE;VALUE=DATE-TIME:20030328T010000\r\nRDATE;VALUE=DATE-TIME:20040407T010000\r\nRDATE;VALUE=DATE-TIME:20050401T020000\r\nRDATE;VALUE=DATE-TIME:20060331T020000\r\nRDATE;VALUE=DATE-TIME:20070330T020000\r\nRDATE;VALUE=DATE-TIME:20080328T020000\r\nRDATE;VALUE=DATE-TIME:20090327T020000\r\nRDATE;VALUE=DATE-TIME:20100326T020000\r\nRDATE;VALUE=DATE-TIME:20110401T020000\r\nRDATE;VALUE=DATE-TIME:20120330T020000\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:IST\r\nDTSTART:19421101T000000\r\nRDATE;VALUE=DATE-TIME:19421101T000000\r\nRDATE;VALUE=DATE-TIME:19431101T000000\r\nRDATE;VALUE=DATE-TIME:19441101T000000\r\nRDATE;VALUE=DATE-TIME:19451101T020000\r\nRDATE;VALUE=DATE-TIME:19461101T000000\r\nRDATE;VALUE=DATE-TIME:19481101T020000\r\nRDATE;VALUE=DATE-TIME:19491101T020000\r\nRDATE;VALUE=DATE-TIME:19500915T030000\r\nRDATE;VALUE=DATE-TIME:19511111T030000\r\nRDATE;VALUE=DATE-TIME:19521019T030000\r\nRDATE;VALUE=DATE-TIME:19530913T030000\r\nRDATE;VALUE=DATE-TIME:19540912T000000\r\nRDATE;VALUE=DATE-TIME:19550911T000000\r\nRDATE;VALUE=DATE-TIME:19560930T030000\r\nRDATE;VALUE=DATE-TIME:19570922T000000\r\nRDATE;VALUE=DATE-TIME:19741013T000000\r\nRDATE;VALUE=DATE-TIME:19750831T000000\r\nRDATE;VALUE=DATE-TIME:19850915T000000\r\nRDATE;VALUE=DATE-TIME:19860907T000000\r\nRDATE;VALUE=DATE-TIME:19870913T000000\r\nRDATE;VALUE=DATE-TIME:19880903T000000\r\nRDATE;VALUE=DATE-TIME:19890903T000000\r\nRDATE;VALUE=DATE-TIME:19900826T000000\r\nRDATE;VALUE=DATE-TIME:19910901T000000\r\nRDATE;VALUE=DATE-TIME:19920906T000000\r\nRDATE;VALUE=DATE-TIME:19930905T000000\r\nRDATE;VALUE=DATE-TIME:19940828T000000\r\nRDATE;VALUE=DATE-TIME:19950903T000000\r\nRDATE;VALUE=DATE-TIME:19960916T000000\r\nRDATE;VALUE=DATE-TIME:19970914T000000\r\nRDATE;VALUE=DATE-TIME:19980906T000000\r\nRDATE;VALUE=DATE-TIME:19990903T020000\r\nRDATE;VALUE=DATE-TIME:20001006T010000\r\nRDATE;VALUE=DATE-TIME:20010924T010000\r\nRDATE;VALUE=DATE-TIME:20021007T010000\r\nRDATE;VALUE=DATE-TIME:20031003T010000\r\nRDATE;VALUE=DATE-TIME:20040922T010000\r\nRDATE;VALUE=DATE-TIME:20051009T020000\r\nRDATE;VALUE=DATE-TIME:20061001T020000\r\nRDATE;VALUE=DATE-TIME:20070916T020000\r\nRDATE;VALUE=DATE-TIME:20081005T020000\r\nRDATE;VALUE=DATE-TIME:20090927T020000\r\nRDATE;VALUE=DATE-TIME:20100912T020000\r\nRDATE;VALUE=DATE-TIME:20111002T020000\r\nRDATE;VALUE=DATE-TIME:20120923T020000\r\nRDATE;VALUE=DATE-TIME:20131006T020000\r\nRDATE;VALUE=DATE-TIME:20141005T020000\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0400\r\nTZNAME:IDDT\r\nDTSTART:19480523T000000\r\nRDATE;VALUE=DATE-TIME:19480523T000000\r\nEND:DAYLIGHT\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0300\r\nTZNAME:IDT\r\nDTSTART:19480901T000000\r\nRDATE;VALUE=DATE-TIME:19480901T000000\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0200\r\nTZNAME:IST\r\nDTSTART:20151004T020000\r\nRDATE;VALUE=DATE-TIME:20151004T020000\r\nRDATE;VALUE=DATE-TIME:20161002T020000\r\nRDATE;VALUE=DATE-TIME:20171008T020000\r\nRDATE;VALUE=DATE-TIME:20181007T020000\r\nRDATE;VALUE=DATE-TIME:20191006T020000\r\nRDATE;VALUE=DATE-TIME:20201004T020000\r\nRDATE;VALUE=DATE-TIME:20211003T020000\r\nRDATE;VALUE=DATE-TIME:20221002T020000\r\nRDATE;VALUE=DATE-TIME:20231008T020000\r\nRDATE;VALUE=DATE-TIME:20241006T020000\r\nRDATE;VALUE=DATE-TIME:20251005T020000\r\nRDATE;VALUE=DATE-TIME:20261004T020000\r\nRDATE;VALUE=DATE-TIME:20271004T020000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(246,'Asia/Kabul',NULL,343100,691200,'BEGIN:VTIMEZONE\r\nTZID:Asia/Kabul\r\nX-LIC-LOCATION:Asia/Kabul\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0430\r\nTZOFFSETTO:+0430\r\nTZNAME:AFT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(247,'Asia/Kamchatka',NULL,530100,1583900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Kamchatka\r\nX-LIC-LOCATION:Asia/Kamchatka\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:PETT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(248,'Asia/Karachi',NULL,245200,670300,'BEGIN:VTIMEZONE\r\nTZID:Asia/Karachi\r\nX-LIC-LOCATION:Asia/Karachi\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:PKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(249,'Asia/Kashgar',NULL,392900,755900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Kashgar\r\nX-LIC-LOCATION:Asia/Kashgar\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(250,'Asia/Kathmandu',NULL,274300,851900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Kathmandu\r\nX-LIC-LOCATION:Asia/Kathmandu\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0545\r\nTZOFFSETTO:+0545\r\nTZNAME:NPT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(251,'Asia/Khandyga',NULL,623923,1353314,'BEGIN:VTIMEZONE\r\nTZID:Asia/Khandyga\r\nX-LIC-LOCATION:Asia/Khandyga\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:YAKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(252,'Asia/Kolkata',NULL,223200,882200,'BEGIN:VTIMEZONE\r\nTZID:Asia/Kolkata\r\nX-LIC-LOCATION:Asia/Kolkata\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0530\r\nTZOFFSETTO:+0530\r\nTZNAME:IST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(253,'Asia/Krasnoyarsk',NULL,560100,925000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Krasnoyarsk\r\nX-LIC-LOCATION:Asia/Krasnoyarsk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:KRAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(254,'Asia/Kuala_Lumpur',NULL,31000,1014200,'BEGIN:VTIMEZONE\r\nTZID:Asia/Kuala_Lumpur\r\nX-LIC-LOCATION:Asia/Kuala_Lumpur\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:MYT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(255,'Asia/Kuching',NULL,13300,1102000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Kuching\r\nX-LIC-LOCATION:Asia/Kuching\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:MYT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(256,'Asia/Kuwait',NULL,292000,475900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Kuwait\r\nX-LIC-LOCATION:Asia/Kuwait\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(257,'Asia/Macau',NULL,221400,1133500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Macau\r\nX-LIC-LOCATION:Asia/Macau\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(258,'Asia/Magadan',NULL,593400,1504800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Magadan\r\nX-LIC-LOCATION:Asia/Magadan\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:MAGT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(259,'Asia/Makassar',NULL,-50700,1192400,'BEGIN:VTIMEZONE\r\nTZID:Asia/Makassar\r\nX-LIC-LOCATION:Asia/Makassar\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CIT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(260,'Asia/Manila',NULL,143500,1210000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Manila\r\nX-LIC-LOCATION:Asia/Manila\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:PHT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(261,'Asia/Muscat',NULL,233600,583500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Muscat\r\nX-LIC-LOCATION:Asia/Muscat\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:GST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(262,'Asia/Nicosia',NULL,351000,332200,'BEGIN:VTIMEZONE\r\nTZID:Asia/Nicosia\r\nX-LIC-LOCATION:Asia/Nicosia\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(263,'Asia/Novokuznetsk',NULL,534500,870700,'BEGIN:VTIMEZONE\r\nTZID:Asia/Novokuznetsk\r\nX-LIC-LOCATION:Asia/Novokuznetsk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:NOVT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(264,'Asia/Novosibirsk',NULL,550200,825500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Novosibirsk\r\nX-LIC-LOCATION:Asia/Novosibirsk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:NOVT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(265,'Asia/Omsk',NULL,550000,732400,'BEGIN:VTIMEZONE\r\nTZID:Asia/Omsk\r\nX-LIC-LOCATION:Asia/Omsk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:OMST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(266,'Asia/Oral',NULL,511300,512100,'BEGIN:VTIMEZONE\r\nTZID:Asia/Oral\r\nX-LIC-LOCATION:Asia/Oral\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:ORAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(267,'Asia/Phnom_Penh',NULL,113300,1045500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Phnom_Penh\r\nX-LIC-LOCATION:Asia/Phnom_Penh\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:ICT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(268,'Asia/Pontianak',NULL,200,1092000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Pontianak\r\nX-LIC-LOCATION:Asia/Pontianak\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:WIT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(269,'Asia/Pyongyang',NULL,390100,1254500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Pyongyang\r\nX-LIC-LOCATION:Asia/Pyongyang\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0900\r\nTZOFFSETTO:+0900\r\nTZNAME:KST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(270,'Asia/Qatar',NULL,251700,513200,'BEGIN:VTIMEZONE\r\nTZID:Asia/Qatar\r\nX-LIC-LOCATION:Asia/Qatar\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(271,'Asia/Qyzylorda',NULL,444800,652800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Qyzylorda\r\nX-LIC-LOCATION:Asia/Qyzylorda\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0600\r\nTZOFFSETTO:+0600\r\nTZNAME:QYZT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(272,'Asia/Rangoon',NULL,164700,961000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Rangoon\r\nX-LIC-LOCATION:Asia/Rangoon\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0630\r\nTZOFFSETTO:+0630\r\nTZNAME:MMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(273,'Asia/Riyadh',NULL,243800,464300,'BEGIN:VTIMEZONE\r\nTZID:Asia/Riyadh\r\nX-LIC-LOCATION:Asia/Riyadh\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:AST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(274,'Asia/Sakhalin',NULL,465800,1424200,'BEGIN:VTIMEZONE\r\nTZID:Asia/Sakhalin\r\nX-LIC-LOCATION:Asia/Sakhalin\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:SAKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(275,'Asia/Samarkand',NULL,394000,664800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Samarkand\r\nX-LIC-LOCATION:Asia/Samarkand\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:UZT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(276,'Asia/Seoul',NULL,373300,1265800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Seoul\r\nX-LIC-LOCATION:Asia/Seoul\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0900\r\nTZOFFSETTO:+0900\r\nTZNAME:KST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(277,'Asia/Shanghai',NULL,311400,1212800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Shanghai\r\nX-LIC-LOCATION:Asia/Shanghai\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(278,'Asia/Singapore',NULL,11700,1035100,'BEGIN:VTIMEZONE\r\nTZID:Asia/Singapore\r\nX-LIC-LOCATION:Asia/Singapore\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:SGT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(279,'Asia/Taipei',NULL,250300,1213000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Taipei\r\nX-LIC-LOCATION:Asia/Taipei\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(280,'Asia/Tashkent',NULL,412000,691800,'BEGIN:VTIMEZONE\r\nTZID:Asia/Tashkent\r\nX-LIC-LOCATION:Asia/Tashkent\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:UZT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(281,'Asia/Tbilisi',NULL,414300,444900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Tbilisi\r\nX-LIC-LOCATION:Asia/Tbilisi\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:GET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(282,'Asia/Tehran',NULL,354000,512600,'BEGIN:VTIMEZONE\r\nTZID:Asia/Tehran\r\nX-LIC-LOCATION:Asia/Tehran\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0330\r\nTZOFFSETTO:+0330\r\nTZNAME:IRST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(283,'Asia/Thimphu',NULL,272800,893900,'BEGIN:VTIMEZONE\r\nTZID:Asia/Thimphu\r\nX-LIC-LOCATION:Asia/Thimphu\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0600\r\nTZOFFSETTO:+0600\r\nTZNAME:BTT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(284,'Asia/Tokyo',NULL,353916,1394441,'BEGIN:VTIMEZONE\r\nTZID:Asia/Tokyo\r\nX-LIC-LOCATION:Asia/Tokyo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0900\r\nTZOFFSETTO:+0900\r\nTZNAME:JST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(285,'Asia/Ulaanbaatar',NULL,475500,1065300,'BEGIN:VTIMEZONE\r\nTZID:Asia/Ulaanbaatar\r\nX-LIC-LOCATION:Asia/Ulaanbaatar\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:ULAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(286,'Asia/Urumqi',NULL,434800,873500,'BEGIN:VTIMEZONE\r\nTZID:Asia/Urumqi\r\nX-LIC-LOCATION:Asia/Urumqi\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(287,'Asia/Ust-Nera',NULL,643337,1431336,'BEGIN:VTIMEZONE\r\nTZID:Asia/Ust-Nera\r\nX-LIC-LOCATION:Asia/Ust-Nera\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:VLAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(288,'Asia/Vientiane',NULL,175800,1023600,'BEGIN:VTIMEZONE\r\nTZID:Asia/Vientiane\r\nX-LIC-LOCATION:Asia/Vientiane\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:ICT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(289,'Asia/Vladivostok',NULL,431000,1315600,'BEGIN:VTIMEZONE\r\nTZID:Asia/Vladivostok\r\nX-LIC-LOCATION:Asia/Vladivostok\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:VLAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(290,'Asia/Yakutsk',NULL,620000,1294000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Yakutsk\r\nX-LIC-LOCATION:Asia/Yakutsk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:YAKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(291,'Asia/Yekaterinburg',NULL,565100,603600,'BEGIN:VTIMEZONE\r\nTZID:Asia/Yekaterinburg\r\nX-LIC-LOCATION:Asia/Yekaterinburg\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0600\r\nTZOFFSETTO:+0600\r\nTZNAME:YEKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(292,'Asia/Yerevan',NULL,401100,443000,'BEGIN:VTIMEZONE\r\nTZID:Asia/Yerevan\r\nX-LIC-LOCATION:Asia/Yerevan\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:AMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(293,'Atlantic/Azores',NULL,374400,-254000,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/Azores\r\nX-LIC-LOCATION:Atlantic/Azores\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0100\r\nTZOFFSETTO:+0000\r\nTZNAME:AZOST\r\nDTSTART:19700329T000000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:-0100\r\nTZNAME:AZOT\r\nDTSTART:19701025T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(294,'Atlantic/Bermuda',NULL,321700,-644600,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/Bermuda\r\nX-LIC-LOCATION:Atlantic/Bermuda\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0400\r\nTZOFFSETTO:-0300\r\nTZNAME:ADT\r\nDTSTART:19700308T020000\r\nRRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0400\r\nTZNAME:AST\r\nDTSTART:19701101T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(295,'Atlantic/Canary',NULL,280600,-152400,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/Canary\r\nX-LIC-LOCATION:Atlantic/Canary\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:WEST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:WET\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(296,'Atlantic/Cape_Verde',NULL,145500,-233100,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/Cape_Verde\r\nX-LIC-LOCATION:Atlantic/Cape_Verde\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0100\r\nTZOFFSETTO:-0100\r\nTZNAME:CVT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(297,'Atlantic/Faroe',NULL,620100,-64600,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/Faroe\r\nX-LIC-LOCATION:Atlantic/Faroe\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:WEST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:WET\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(298,'Atlantic/Madeira',NULL,323800,-165400,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/Madeira\r\nX-LIC-LOCATION:Atlantic/Madeira\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:WEST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:WET\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(299,'Atlantic/Reykjavik',NULL,640900,-215100,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/Reykjavik\r\nX-LIC-LOCATION:Atlantic/Reykjavik\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(300,'Atlantic/South_Georgia',NULL,-541600,-363200,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/South_Georgia\r\nX-LIC-LOCATION:Atlantic/South_Georgia\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0200\r\nTZOFFSETTO:-0200\r\nTZNAME:GST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(301,'Atlantic/St_Helena',NULL,-155500,-54200,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/St_Helena\r\nX-LIC-LOCATION:Atlantic/St_Helena\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(302,'Atlantic/Stanley',NULL,-514200,-575100,'BEGIN:VTIMEZONE\r\nTZID:Atlantic/Stanley\r\nX-LIC-LOCATION:Atlantic/Stanley\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:FKST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(303,'Australia/Adelaide',NULL,-345500,1383500,'BEGIN:VTIMEZONE\r\nTZID:Australia/Adelaide\r\nX-LIC-LOCATION:Australia/Adelaide\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1030\r\nTZOFFSETTO:+0930\r\nTZNAME:CST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0930\r\nTZOFFSETTO:+1030\r\nTZNAME:CST\r\nDTSTART:19701004T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(304,'Australia/Brisbane',NULL,-272800,1530200,'BEGIN:VTIMEZONE\r\nTZID:Australia/Brisbane\r\nX-LIC-LOCATION:Australia/Brisbane\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:EST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(305,'Australia/Broken_Hill',NULL,-315700,1412700,'BEGIN:VTIMEZONE\r\nTZID:Australia/Broken_Hill\r\nX-LIC-LOCATION:Australia/Broken_Hill\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1030\r\nTZOFFSETTO:+0930\r\nTZNAME:CST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0930\r\nTZOFFSETTO:+1030\r\nTZNAME:CST\r\nDTSTART:19701004T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(306,'Australia/Currie',NULL,-395600,1435200,'BEGIN:VTIMEZONE\r\nTZID:Australia/Currie\r\nX-LIC-LOCATION:Australia/Currie\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1100\r\nTZNAME:EST\r\nDTSTART:19701004T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1000\r\nTZNAME:EST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(307,'Australia/Darwin',NULL,-122800,1305000,'BEGIN:VTIMEZONE\r\nTZID:Australia/Darwin\r\nX-LIC-LOCATION:Australia/Darwin\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0930\r\nTZOFFSETTO:+0930\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(308,'Australia/Eucla',NULL,-314300,1285200,'BEGIN:VTIMEZONE\r\nTZID:Australia/Eucla\r\nX-LIC-LOCATION:Australia/Eucla\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0845\r\nTZOFFSETTO:+0845\r\nTZNAME:CWST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(309,'Australia/Hobart',NULL,-425300,1471900,'BEGIN:VTIMEZONE\r\nTZID:Australia/Hobart\r\nX-LIC-LOCATION:Australia/Hobart\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1100\r\nTZNAME:EST\r\nDTSTART:19701004T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1000\r\nTZNAME:EST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(310,'Australia/Lindeman',NULL,-201600,1490000,'BEGIN:VTIMEZONE\r\nTZID:Australia/Lindeman\r\nX-LIC-LOCATION:Australia/Lindeman\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:EST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(311,'Australia/Lord_Howe',NULL,-313300,1590500,'BEGIN:VTIMEZONE\r\nTZID:Australia/Lord_Howe\r\nX-LIC-LOCATION:Australia/Lord_Howe\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1030\r\nTZNAME:LHST\r\nDTSTART:19700405T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1030\r\nTZOFFSETTO:+1100\r\nTZNAME:LHST\r\nDTSTART:19701004T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(312,'Australia/Melbourne',NULL,-374900,1445800,'BEGIN:VTIMEZONE\r\nTZID:Australia/Melbourne\r\nX-LIC-LOCATION:Australia/Melbourne\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1000\r\nTZNAME:EST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1100\r\nTZNAME:EST\r\nDTSTART:19701004T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(313,'Australia/Perth',NULL,-315700,1155100,'BEGIN:VTIMEZONE\r\nTZID:Australia/Perth\r\nX-LIC-LOCATION:Australia/Perth\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:WST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(314,'Australia/Sydney',NULL,-335200,1511300,'BEGIN:VTIMEZONE\r\nTZID:Australia/Sydney\r\nX-LIC-LOCATION:Australia/Sydney\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1000\r\nTZNAME:EST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1100\r\nTZNAME:EST\r\nDTSTART:19701004T020000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=10\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(315,'Europe/Amsterdam',NULL,522200,45400,'BEGIN:VTIMEZONE\r\nTZID:Europe/Amsterdam\r\nX-LIC-LOCATION:Europe/Amsterdam\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(316,'Europe/Andorra',NULL,423000,13100,'BEGIN:VTIMEZONE\r\nTZID:Europe/Andorra\r\nX-LIC-LOCATION:Europe/Andorra\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(317,'Europe/Athens',NULL,375800,234300,'BEGIN:VTIMEZONE\r\nTZID:Europe/Athens\r\nX-LIC-LOCATION:Europe/Athens\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(318,'Europe/Belgrade',NULL,445000,203000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Belgrade\r\nX-LIC-LOCATION:Europe/Belgrade\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(319,'Europe/Berlin',NULL,523000,132200,'BEGIN:VTIMEZONE\r\nTZID:Europe/Berlin\r\nX-LIC-LOCATION:Europe/Berlin\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(320,'Europe/Bratislava',NULL,480900,170700,'BEGIN:VTIMEZONE\r\nTZID:Europe/Bratislava\r\nX-LIC-LOCATION:Europe/Bratislava\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(321,'Europe/Brussels',NULL,505000,42000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Brussels\r\nX-LIC-LOCATION:Europe/Brussels\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(322,'Europe/Bucharest',NULL,442600,260600,'BEGIN:VTIMEZONE\r\nTZID:Europe/Bucharest\r\nX-LIC-LOCATION:Europe/Bucharest\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(323,'Europe/Budapest',NULL,473000,190500,'BEGIN:VTIMEZONE\r\nTZID:Europe/Budapest\r\nX-LIC-LOCATION:Europe/Budapest\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(324,'Europe/Busingen',NULL,474200,84100,'BEGIN:VTIMEZONE\r\nTZID:Europe/Busingen\r\nX-LIC-LOCATION:Europe/Busingen\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(325,'Europe/Chisinau',NULL,470000,285000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Chisinau\r\nX-LIC-LOCATION:Europe/Chisinau\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(326,'Europe/Copenhagen',NULL,554000,123500,'BEGIN:VTIMEZONE\r\nTZID:Europe/Copenhagen\r\nX-LIC-LOCATION:Europe/Copenhagen\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(327,'Europe/Dublin',NULL,532000,-61500,'BEGIN:VTIMEZONE\r\nTZID:Europe/Dublin\r\nX-LIC-LOCATION:Europe/Dublin\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:IST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(328,'Europe/Gibraltar',NULL,360800,-52100,'BEGIN:VTIMEZONE\r\nTZID:Europe/Gibraltar\r\nX-LIC-LOCATION:Europe/Gibraltar\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(329,'Europe/Guernsey',NULL,492700,-23200,'BEGIN:VTIMEZONE\r\nTZID:Europe/Guernsey\r\nX-LIC-LOCATION:Europe/Guernsey\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:BST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(330,'Europe/Helsinki',NULL,601000,245800,'BEGIN:VTIMEZONE\r\nTZID:Europe/Helsinki\r\nX-LIC-LOCATION:Europe/Helsinki\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(331,'Europe/Isle_of_Man',NULL,540900,-42800,'BEGIN:VTIMEZONE\r\nTZID:Europe/Isle_of_Man\r\nX-LIC-LOCATION:Europe/Isle_of_Man\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:BST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(332,'Europe/Istanbul',NULL,410100,285800,'BEGIN:VTIMEZONE\r\nTZID:Europe/Istanbul\r\nX-LIC-LOCATION:Europe/Istanbul\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(333,'Europe/Jersey',NULL,491200,-20700,'BEGIN:VTIMEZONE\r\nTZID:Europe/Jersey\r\nX-LIC-LOCATION:Europe/Jersey\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:BST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(334,'Europe/Kaliningrad',NULL,544300,203000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Kaliningrad\r\nX-LIC-LOCATION:Europe/Kaliningrad\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:FET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(335,'Europe/Kiev',NULL,502600,303100,'BEGIN:VTIMEZONE\r\nTZID:Europe/Kiev\r\nX-LIC-LOCATION:Europe/Kiev\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(336,'Europe/Lisbon',NULL,384300,-90800,'BEGIN:VTIMEZONE\r\nTZID:Europe/Lisbon\r\nX-LIC-LOCATION:Europe/Lisbon\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:WET\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:WEST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(337,'Europe/Ljubljana',NULL,460300,143100,'BEGIN:VTIMEZONE\r\nTZID:Europe/Ljubljana\r\nX-LIC-LOCATION:Europe/Ljubljana\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(338,'Europe/London',NULL,513030,731,'BEGIN:VTIMEZONE\r\nTZID:Europe/London\r\nX-LIC-LOCATION:Europe/London\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0000\r\nTZOFFSETTO:+0100\r\nTZNAME:BST\r\nDTSTART:19700329T010000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0000\r\nTZNAME:GMT\r\nDTSTART:19701025T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(339,'Europe/Luxembourg',NULL,493600,60900,'BEGIN:VTIMEZONE\r\nTZID:Europe/Luxembourg\r\nX-LIC-LOCATION:Europe/Luxembourg\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(340,'Europe/Madrid',NULL,402400,-34100,'BEGIN:VTIMEZONE\r\nTZID:Europe/Madrid\r\nX-LIC-LOCATION:Europe/Madrid\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(341,'Europe/Malta',NULL,355400,143100,'BEGIN:VTIMEZONE\r\nTZID:Europe/Malta\r\nX-LIC-LOCATION:Europe/Malta\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(342,'Europe/Mariehamn',NULL,600600,195700,'BEGIN:VTIMEZONE\r\nTZID:Europe/Mariehamn\r\nX-LIC-LOCATION:Europe/Mariehamn\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(343,'Europe/Minsk',NULL,535400,273400,'BEGIN:VTIMEZONE\r\nTZID:Europe/Minsk\r\nX-LIC-LOCATION:Europe/Minsk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:FET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(344,'Europe/Monaco',NULL,434200,72300,'BEGIN:VTIMEZONE\r\nTZID:Europe/Monaco\r\nX-LIC-LOCATION:Europe/Monaco\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(345,'Europe/Moscow',NULL,554500,373500,'BEGIN:VTIMEZONE\r\nTZID:Europe/Moscow\r\nX-LIC-LOCATION:Europe/Moscow\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:MSK\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(346,'Europe/Nicosia',NULL,351000,332200,'BEGIN:VTIMEZONE\r\nTZID:Europe/Nicosia\r\nX-LIC-LOCATION:Europe/Nicosia\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(347,'Europe/Oslo',NULL,595500,104500,'BEGIN:VTIMEZONE\r\nTZID:Europe/Oslo\r\nX-LIC-LOCATION:Europe/Oslo\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(348,'Europe/Paris',NULL,485200,22000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Paris\r\nX-LIC-LOCATION:Europe/Paris\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(349,'Europe/Podgorica',NULL,422600,191600,'BEGIN:VTIMEZONE\r\nTZID:Europe/Podgorica\r\nX-LIC-LOCATION:Europe/Podgorica\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(350,'Europe/Prague',NULL,500500,142600,'BEGIN:VTIMEZONE\r\nTZID:Europe/Prague\r\nX-LIC-LOCATION:Europe/Prague\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(351,'Europe/Riga',NULL,565700,240600,'BEGIN:VTIMEZONE\r\nTZID:Europe/Riga\r\nX-LIC-LOCATION:Europe/Riga\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(352,'Europe/Rome',NULL,415400,122900,'BEGIN:VTIMEZONE\r\nTZID:Europe/Rome\r\nX-LIC-LOCATION:Europe/Rome\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(353,'Europe/Samara',NULL,531200,500900,'BEGIN:VTIMEZONE\r\nTZID:Europe/Samara\r\nX-LIC-LOCATION:Europe/Samara\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:SAMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(354,'Europe/San_Marino',NULL,435500,122800,'BEGIN:VTIMEZONE\r\nTZID:Europe/San_Marino\r\nX-LIC-LOCATION:Europe/San_Marino\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(355,'Europe/Sarajevo',NULL,435200,182500,'BEGIN:VTIMEZONE\r\nTZID:Europe/Sarajevo\r\nX-LIC-LOCATION:Europe/Sarajevo\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(356,'Europe/Simferopol',NULL,445700,340600,'BEGIN:VTIMEZONE\r\nTZID:Europe/Simferopol\r\nX-LIC-LOCATION:Europe/Simferopol\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(357,'Europe/Skopje',NULL,415900,212600,'BEGIN:VTIMEZONE\r\nTZID:Europe/Skopje\r\nX-LIC-LOCATION:Europe/Skopje\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(358,'Europe/Sofia',NULL,424100,231900,'BEGIN:VTIMEZONE\r\nTZID:Europe/Sofia\r\nX-LIC-LOCATION:Europe/Sofia\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(359,'Europe/Stockholm',NULL,592000,180300,'BEGIN:VTIMEZONE\r\nTZID:Europe/Stockholm\r\nX-LIC-LOCATION:Europe/Stockholm\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(360,'Europe/Tallinn',NULL,592500,244500,'BEGIN:VTIMEZONE\r\nTZID:Europe/Tallinn\r\nX-LIC-LOCATION:Europe/Tallinn\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(361,'Europe/Tirane',NULL,412000,195000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Tirane\r\nX-LIC-LOCATION:Europe/Tirane\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(362,'Europe/Uzhgorod',NULL,483700,221800,'BEGIN:VTIMEZONE\r\nTZID:Europe/Uzhgorod\r\nX-LIC-LOCATION:Europe/Uzhgorod\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(363,'Europe/Vaduz',NULL,470900,93100,'BEGIN:VTIMEZONE\r\nTZID:Europe/Vaduz\r\nX-LIC-LOCATION:Europe/Vaduz\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(364,'Europe/Vatican',NULL,415408,122711,'BEGIN:VTIMEZONE\r\nTZID:Europe/Vatican\r\nX-LIC-LOCATION:Europe/Vatican\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(365,'Europe/Vienna',NULL,481300,162000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Vienna\r\nX-LIC-LOCATION:Europe/Vienna\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(366,'Europe/Vilnius',NULL,544100,251900,'BEGIN:VTIMEZONE\r\nTZID:Europe/Vilnius\r\nX-LIC-LOCATION:Europe/Vilnius\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(367,'Europe/Volgograd',NULL,484400,442500,'BEGIN:VTIMEZONE\r\nTZID:Europe/Volgograd\r\nX-LIC-LOCATION:Europe/Volgograd\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:VOLT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(368,'Europe/Warsaw',NULL,521500,210000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Warsaw\r\nX-LIC-LOCATION:Europe/Warsaw\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(369,'Europe/Zagreb',NULL,454800,155800,'BEGIN:VTIMEZONE\r\nTZID:Europe/Zagreb\r\nX-LIC-LOCATION:Europe/Zagreb\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(370,'Europe/Zaporozhye',NULL,475000,351000,'BEGIN:VTIMEZONE\r\nTZID:Europe/Zaporozhye\r\nX-LIC-LOCATION:Europe/Zaporozhye\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0300\r\nTZNAME:EEST\r\nDTSTART:19700329T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0200\r\nTZNAME:EET\r\nDTSTART:19701025T040000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(371,'Europe/Zurich',NULL,472300,83200,'BEGIN:VTIMEZONE\r\nTZID:Europe/Zurich\r\nX-LIC-LOCATION:Europe/Zurich\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+0100\r\nTZOFFSETTO:+0200\r\nTZNAME:CEST\r\nDTSTART:19700329T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0200\r\nTZOFFSETTO:+0100\r\nTZNAME:CET\r\nDTSTART:19701025T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(372,'Indian/Antananarivo',NULL,-185500,473100,'BEGIN:VTIMEZONE\r\nTZID:Indian/Antananarivo\r\nX-LIC-LOCATION:Indian/Antananarivo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(373,'Indian/Chagos',NULL,-72000,722500,'BEGIN:VTIMEZONE\r\nTZID:Indian/Chagos\r\nX-LIC-LOCATION:Indian/Chagos\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0600\r\nTZOFFSETTO:+0600\r\nTZNAME:IOT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(374,'Indian/Christmas',NULL,-102500,1054300,'BEGIN:VTIMEZONE\r\nTZID:Indian/Christmas\r\nX-LIC-LOCATION:Indian/Christmas\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0700\r\nTZOFFSETTO:+0700\r\nTZNAME:CXT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(375,'Indian/Cocos',NULL,-121000,965500,'BEGIN:VTIMEZONE\r\nTZID:Indian/Cocos\r\nX-LIC-LOCATION:Indian/Cocos\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0630\r\nTZOFFSETTO:+0630\r\nTZNAME:CCT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(376,'Indian/Comoro',NULL,-114100,431600,'BEGIN:VTIMEZONE\r\nTZID:Indian/Comoro\r\nX-LIC-LOCATION:Indian/Comoro\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(377,'Indian/Kerguelen',NULL,-492110,701303,'BEGIN:VTIMEZONE\r\nTZID:Indian/Kerguelen\r\nX-LIC-LOCATION:Indian/Kerguelen\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:TFT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(378,'Indian/Mahe',NULL,-44000,552800,'BEGIN:VTIMEZONE\r\nTZID:Indian/Mahe\r\nX-LIC-LOCATION:Indian/Mahe\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:SCT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(379,'Indian/Maldives',NULL,41000,733000,'BEGIN:VTIMEZONE\r\nTZID:Indian/Maldives\r\nX-LIC-LOCATION:Indian/Maldives\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0500\r\nTZOFFSETTO:+0500\r\nTZNAME:MVT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(380,'Indian/Mauritius',NULL,-201000,573000,'BEGIN:VTIMEZONE\r\nTZID:Indian/Mauritius\r\nX-LIC-LOCATION:Indian/Mauritius\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:MUT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(381,'Indian/Mayotte',NULL,-124700,451400,'BEGIN:VTIMEZONE\r\nTZID:Indian/Mayotte\r\nX-LIC-LOCATION:Indian/Mayotte\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0300\r\nTZOFFSETTO:+0300\r\nTZNAME:EAT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(382,'Indian/Reunion',NULL,-205200,552800,'BEGIN:VTIMEZONE\r\nTZID:Indian/Reunion\r\nX-LIC-LOCATION:Indian/Reunion\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0400\r\nTZOFFSETTO:+0400\r\nTZNAME:RET\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(383,'Pacific/Apia',NULL,-135000,-1714400,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Apia\r\nX-LIC-LOCATION:Pacific/Apia\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1400\r\nTZOFFSETTO:+1300\r\nTZNAME:WST\r\nDTSTART:19700405T040000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1400\r\nTZNAME:WSDT\r\nDTSTART:19700927T030000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=9\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(384,'Pacific/Auckland',NULL,-365200,1744600,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Auckland\r\nX-LIC-LOCATION:Pacific/Auckland\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1300\r\nTZNAME:NZDT\r\nDTSTART:19700927T020000\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=9\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1200\r\nTZNAME:NZST\r\nDTSTART:19700405T030000\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(385,'Pacific/Chatham',NULL,-435700,-1763300,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Chatham\r\nX-LIC-LOCATION:Pacific/Chatham\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1245\r\nTZOFFSETTO:+1345\r\nTZNAME:CHADT\r\nDTSTART:19700927T024500\r\nRRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=9\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1345\r\nTZOFFSETTO:+1245\r\nTZNAME:CHAST\r\nDTSTART:19700405T034500\r\nRRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(386,'Pacific/Chuuk',NULL,72500,1514700,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Chuuk\r\nX-LIC-LOCATION:Pacific/Chuuk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:CHUT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(387,'Pacific/Easter',NULL,-270900,-1092600,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Easter\r\nX-LIC-LOCATION:Pacific/Easter\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0500\r\nTZOFFSETTO:-0600\r\nTZNAME:EAST\r\nDTSTART:19700425T220000\r\nRRULE:FREQ=YEARLY;BYDAY=4SA;BYMONTH=4\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0500\r\nTZNAME:EASST\r\nDTSTART:19700905T220000\r\nRRULE:FREQ=YEARLY;BYDAY=1SA;BYMONTH=9\r\nEND:DAYLIGHT\r\nEND:VTIMEZONE\r\n'),(388,'Pacific/Efate',NULL,-174000,1682500,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Efate\r\nX-LIC-LOCATION:Pacific/Efate\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:VUT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(389,'Pacific/Enderbury',NULL,-30800,-1710500,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Enderbury\r\nX-LIC-LOCATION:Pacific/Enderbury\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1300\r\nTZNAME:PHOT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(390,'Pacific/Fakaofo',NULL,-92200,-1711400,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Fakaofo\r\nX-LIC-LOCATION:Pacific/Fakaofo\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1300\r\nTZNAME:TKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(391,'Pacific/Fiji',NULL,-180800,1782500,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Fiji\r\nX-LIC-LOCATION:Pacific/Fiji\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1300\r\nTZNAME:FJST\r\nDTSTART:20101024T020000\r\nRRULE:FREQ=YEARLY;BYDAY=SU;BYMONTHDAY=18,19,20,21,22,23,24;BYMONTH=10\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1200\r\nTZNAME:FJT\r\nDTSTART:20120122T030000\r\nRRULE:FREQ=YEARLY;BYDAY=SU;BYMONTHDAY=18,19,20,21,22,23,24;BYMONTH=1\r\nEND:STANDARD\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+115544\r\nTZOFFSETTO:+1200\r\nTZNAME:FJT\r\nDTSTART:19151026T000000\r\nRDATE;VALUE=DATE-TIME:19151026T000000\r\nEND:STANDARD\r\nBEGIN:DAYLIGHT\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1300\r\nTZNAME:FJST\r\nDTSTART:19981101T020000\r\nRDATE;VALUE=DATE-TIME:19981101T020000\r\nRDATE;VALUE=DATE-TIME:19991107T020000\r\nRDATE;VALUE=DATE-TIME:20091129T020000\r\nEND:DAYLIGHT\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1200\r\nTZNAME:FJT\r\nDTSTART:19990228T030000\r\nRDATE;VALUE=DATE-TIME:19990228T030000\r\nRDATE;VALUE=DATE-TIME:20000227T030000\r\nRDATE;VALUE=DATE-TIME:20100328T030000\r\nRDATE;VALUE=DATE-TIME:20110306T030000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(392,'Pacific/Funafuti',NULL,-83100,1791300,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Funafuti\r\nX-LIC-LOCATION:Pacific/Funafuti\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:TVT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(393,'Pacific/Galapagos',NULL,5400,-893600,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Galapagos\r\nX-LIC-LOCATION:Pacific/Galapagos\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0600\r\nTZOFFSETTO:-0600\r\nTZNAME:GALT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(394,'Pacific/Gambier',NULL,-230800,-1345700,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Gambier\r\nX-LIC-LOCATION:Pacific/Gambier\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0900\r\nTZOFFSETTO:-0900\r\nTZNAME:GAMT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(395,'Pacific/Guadalcanal',NULL,-93200,1601200,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Guadalcanal\r\nX-LIC-LOCATION:Pacific/Guadalcanal\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:SBT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(396,'Pacific/Guam',NULL,132800,1444500,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Guam\r\nX-LIC-LOCATION:Pacific/Guam\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:ChST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(397,'Pacific/Honolulu',NULL,211825,-1575130,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Honolulu\r\nX-LIC-LOCATION:Pacific/Honolulu\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-1000\r\nTZOFFSETTO:-1000\r\nTZNAME:HST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(398,'Pacific/Johnston',NULL,164500,-1693100,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Johnston\r\nX-LIC-LOCATION:Pacific/Johnston\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-1000\r\nTZOFFSETTO:-1000\r\nTZNAME:HST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(399,'Pacific/Kiritimati',NULL,15200,-1572000,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Kiritimati\r\nX-LIC-LOCATION:Pacific/Kiritimati\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1400\r\nTZOFFSETTO:+1400\r\nTZNAME:LINT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(400,'Pacific/Kosrae',NULL,51900,1625900,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Kosrae\r\nX-LIC-LOCATION:Pacific/Kosrae\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:KOST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(401,'Pacific/Kwajalein',NULL,90500,1672000,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Kwajalein\r\nX-LIC-LOCATION:Pacific/Kwajalein\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:MHT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(402,'Pacific/Majuro',NULL,70900,1711200,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Majuro\r\nX-LIC-LOCATION:Pacific/Majuro\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:MHT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(403,'Pacific/Marquesas',NULL,-90000,-1393000,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Marquesas\r\nX-LIC-LOCATION:Pacific/Marquesas\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0930\r\nTZOFFSETTO:-0930\r\nTZNAME:MART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(404,'Pacific/Midway',NULL,281300,-1772200,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Midway\r\nX-LIC-LOCATION:Pacific/Midway\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-1100\r\nTZOFFSETTO:-1100\r\nTZNAME:SST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(405,'Pacific/Nauru',NULL,3100,1665500,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Nauru\r\nX-LIC-LOCATION:Pacific/Nauru\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:NRT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(406,'Pacific/Niue',NULL,-190100,-1695500,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Niue\r\nX-LIC-LOCATION:Pacific/Niue\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-1100\r\nTZOFFSETTO:-1100\r\nTZNAME:NUT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(407,'Pacific/Norfolk',NULL,-290300,1675800,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Norfolk\r\nX-LIC-LOCATION:Pacific/Norfolk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1130\r\nTZOFFSETTO:+1130\r\nTZNAME:NFT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(408,'Pacific/Noumea',NULL,-221600,1662700,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Noumea\r\nX-LIC-LOCATION:Pacific/Noumea\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:NCT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(409,'Pacific/Pago_Pago',NULL,-141600,-1704200,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Pago_Pago\r\nX-LIC-LOCATION:Pacific/Pago_Pago\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-1100\r\nTZOFFSETTO:-1100\r\nTZNAME:SST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(410,'Pacific/Palau',NULL,72000,1342900,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Palau\r\nX-LIC-LOCATION:Pacific/Palau\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0900\r\nTZOFFSETTO:+0900\r\nTZNAME:PWT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(411,'Pacific/Pitcairn',NULL,-250400,-1300500,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Pitcairn\r\nX-LIC-LOCATION:Pacific/Pitcairn\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0800\r\nTZOFFSETTO:-0800\r\nTZNAME:PST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(412,'Pacific/Pohnpei',NULL,65800,1581300,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Pohnpei\r\nX-LIC-LOCATION:Pacific/Pohnpei\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:PONT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(413,'Pacific/Port_Moresby',NULL,-93000,1471000,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Port_Moresby\r\nX-LIC-LOCATION:Pacific/Port_Moresby\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:PGT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(414,'Pacific/Rarotonga',NULL,-211400,-1594600,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Rarotonga\r\nX-LIC-LOCATION:Pacific/Rarotonga\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-1000\r\nTZOFFSETTO:-1000\r\nTZNAME:CKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(415,'Pacific/Saipan',NULL,151200,1454500,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Saipan\r\nX-LIC-LOCATION:Pacific/Saipan\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:ChST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(416,'Pacific/Tahiti',NULL,-173200,-1493400,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Tahiti\r\nX-LIC-LOCATION:Pacific/Tahiti\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-1000\r\nTZOFFSETTO:-1000\r\nTZNAME:TAHT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(417,'Pacific/Tarawa',NULL,12500,1730000,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Tarawa\r\nX-LIC-LOCATION:Pacific/Tarawa\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:GILT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(418,'Pacific/Tongatapu',NULL,-211000,-1751000,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Tongatapu\r\nX-LIC-LOCATION:Pacific/Tongatapu\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1300\r\nTZOFFSETTO:+1300\r\nTZNAME:TOT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(419,'Pacific/Wake',NULL,191700,1663700,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Wake\r\nX-LIC-LOCATION:Pacific/Wake\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:WAKT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(420,'Pacific/Ponape',NULL,65800,1581300,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Ponape\r\nX-LIC-LOCATION:Pacific/Ponape\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1100\r\nTZOFFSETTO:+1100\r\nTZNAME:PONT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(421,'Pacific/Truk',NULL,72500,1514700,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Truk\r\nX-LIC-LOCATION:Pacific/Truk\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1000\r\nTZOFFSETTO:+1000\r\nTZNAME:TRUT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(422,'Pacific/Wallis',NULL,-131800,-1761000,'BEGIN:VTIMEZONE\r\nTZID:Pacific/Wallis\r\nX-LIC-LOCATION:Pacific/Wallis\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+1200\r\nTZOFFSETTO:+1200\r\nTZNAME:WFT\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE\r\n'),(423,'Africa/Asmera',5,NULL,NULL,NULL),(424,'Africa/Timbuktu',6,NULL,NULL,NULL),(425,'America/Argentina/ComodRivadavia',59,NULL,NULL,NULL),(426,'America/Louisville',128,NULL,NULL,NULL),(427,'Asia/Saigon',238,NULL,NULL,NULL),(428,'Asia/Katmandu',250,NULL,NULL,NULL),(429,'Asia/Calcutta',252,NULL,NULL,NULL),(430,'Atlantic/Faeroe',297,NULL,NULL,NULL),(431,'Europe/Belfast',338,NULL,NULL,NULL),(432,'Atlantic/Jan_Mayen',347,NULL,NULL,NULL),(433,'Pacific/Yap',421,NULL,NULL,NULL),(434,'AUS Central Standard Time',307,NULL,NULL,NULL),(435,'AUS Eastern Standard Time',314,NULL,NULL,NULL),(436,'Afghanistan Standard Time',246,NULL,NULL,NULL),(437,'Alaskan Standard Time',54,NULL,NULL,NULL),(438,'Arab Standard Time',273,NULL,NULL,NULL),(439,'Arabian Standard Time',233,NULL,NULL,NULL),(440,'Arabic Standard Time',220,NULL,NULL,NULL),(441,'Argentina Standard Time',58,NULL,NULL,NULL),(442,'Atlantic Standard Time',113,NULL,NULL,NULL),(443,'Azerbaijan Standard Time',222,NULL,NULL,NULL),(444,'Azores Standard Time',293,NULL,NULL,NULL),(445,'Bahia Standard Time',73,NULL,NULL,NULL),(446,'Bangladesh Standard Time',231,NULL,NULL,NULL),(447,'Canada Central Standard Time',172,NULL,NULL,NULL),(448,'Cape Verde Standard Time',296,NULL,NULL,NULL),(449,'Caucasus Standard Time',292,NULL,NULL,NULL),(450,'Cen. Australia Standard Time',303,NULL,NULL,NULL),(451,'Central America Standard Time',110,NULL,NULL,NULL),(452,'Central Asia Standard Time',214,NULL,NULL,NULL),(453,'Central Brazilian Standard Time',92,NULL,NULL,NULL),(454,'Central Europe Standard Time',323,NULL,NULL,NULL),(455,'Central European Standard Time',368,NULL,NULL,NULL),(456,'Central Pacific Standard Time',395,NULL,NULL,NULL),(457,'Central Standard Time',88,NULL,NULL,NULL),(458,'Central Standard Time (Mexico)',145,NULL,NULL,NULL),(459,'China Standard Time',277,NULL,NULL,NULL),(460,'E. Africa Standard Time',43,NULL,NULL,NULL),(461,'E. Australia Standard Time',304,NULL,NULL,NULL),(462,'E. Europe Standard Time',262,NULL,NULL,NULL),(463,'E. South America Standard Time',179,NULL,NULL,NULL),(464,'Eastern Standard Time',153,NULL,NULL,NULL),(465,'Egypt Standard Time',13,NULL,NULL,NULL),(466,'Ekaterinburg Standard Time',291,NULL,NULL,NULL),(467,'FLE Standard Time',335,NULL,NULL,NULL),(468,'Fiji Standard Time',391,NULL,NULL,NULL),(469,'GMT Standard Time',338,NULL,NULL,NULL),(470,'GTB Standard Time',322,NULL,NULL,NULL),(471,'Georgian Standard Time',281,NULL,NULL,NULL),(472,'Greenland Standard Time',105,NULL,NULL,NULL),(473,'Greenwich Standard Time',299,NULL,NULL,NULL),(474,'Hawaiian Standard Time',397,NULL,NULL,NULL),(475,'India Standard Time',252,NULL,NULL,NULL),(476,'Iran Standard Time',282,NULL,NULL,NULL),(477,'Israel Standard Time',245,NULL,NULL,NULL),(478,'Jordan Standard Time',215,NULL,NULL,NULL),(479,'Kaliningrad Standard Time',334,NULL,NULL,NULL),(480,'Korea Standard Time',276,NULL,NULL,NULL),(481,'Magadan Standard Time',258,NULL,NULL,NULL),(482,'Mauritius Standard Time',380,NULL,NULL,NULL),(483,'Middle East Standard Time',224,NULL,NULL,NULL),(484,'Montevideo Standard Time',149,NULL,NULL,NULL),(485,'Morocco Standard Time',14,NULL,NULL,NULL),(486,'Mountain Standard Time',97,NULL,NULL,NULL),(487,'Mountain Standard Time (Mexico)',89,NULL,NULL,NULL),(488,'Myanmar Standard Time',272,NULL,NULL,NULL),(489,'N. Central Asia Standard Time',264,NULL,NULL,NULL),(490,'Namibia Standard Time',52,NULL,NULL,NULL),(491,'Nepal Standard Time',250,NULL,NULL,NULL),(492,'New Zealand Standard Time',384,NULL,NULL,NULL),(493,'Newfoundland Standard Time',184,NULL,NULL,NULL),(494,'North Asia East Standard Time',241,NULL,NULL,NULL),(495,'North Asia Standard Time',253,NULL,NULL,NULL),(496,'Pacific SA Standard Time',177,NULL,NULL,NULL),(497,'Pacific Standard Time',133,NULL,NULL,NULL),(498,'Pacific Standard Time (Mexico)',175,NULL,NULL,NULL),(499,'Pakistan Standard Time',248,NULL,NULL,NULL),(500,'Paraguay Standard Time',71,NULL,NULL,NULL),(501,'Romance Standard Time',348,NULL,NULL,NULL),(502,'Russian Standard Time',345,NULL,NULL,NULL),(503,'SA Eastern Standard Time',86,NULL,NULL,NULL),(504,'SA Pacific Standard Time',80,NULL,NULL,NULL),(505,'SA Western Standard Time',131,NULL,NULL,NULL),(506,'SE Asia Standard Time',223,NULL,NULL,NULL),(507,'Samoa Standard Time',383,NULL,NULL,NULL),(508,'Singapore Standard Time',278,NULL,NULL,NULL),(509,'South Africa Standard Time',25,NULL,NULL,NULL),(510,'Sri Lanka Standard Time',229,NULL,NULL,NULL),(511,'Syria Standard Time',230,NULL,NULL,NULL),(512,'Taipei Standard Time',279,NULL,NULL,NULL),(513,'Tasmania Standard Time',309,NULL,NULL,NULL),(514,'Tokyo Standard Time',284,NULL,NULL,NULL),(515,'Tonga Standard Time',418,NULL,NULL,NULL),(516,'Turkey Standard Time',332,NULL,NULL,NULL),(517,'US Mountain Standard Time',164,NULL,NULL,NULL),(518,'Ulaanbaatar Standard Time',285,NULL,NULL,NULL),(519,'Venezuela Standard Time',85,NULL,NULL,NULL),(520,'Vladivostok Standard Time',289,NULL,NULL,NULL),(521,'W. Australia Standard Time',313,NULL,NULL,NULL),(522,'W. Central Africa Standard Time',31,NULL,NULL,NULL),(523,'W. Europe Standard Time',319,NULL,NULL,NULL),(524,'West Asia Standard Time',280,NULL,NULL,NULL),(525,'West Pacific Standard Time',413,NULL,NULL,NULL),(526,'Yakutsk Standard Time',290,NULL,NULL,NULL),(527,'Universal Coordinated Time',-1,NULL,NULL,NULL),(528,'Casablanca, Monrovia',14,NULL,NULL,NULL),(529,'Greenwich Mean Time: Dublin, Edinburgh, Lisbon, London',336,NULL,NULL,NULL),(530,'Greenwich Mean Time; Dublin, Edinburgh, London',338,NULL,NULL,NULL),(531,'Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna',319,NULL,NULL,NULL),(532,'Belgrade, Pozsony, Budapest, Ljubljana, Prague',350,NULL,NULL,NULL),(533,'Brussels, Copenhagen, Madrid, Paris',348,NULL,NULL,NULL),(534,'Paris, Madrid, Brussels, Copenhagen',348,NULL,NULL,NULL),(535,'Prague, Central Europe',350,NULL,NULL,NULL),(536,'Sarajevo, Skopje, Sofija, Vilnius, Warsaw, Zagreb',355,NULL,NULL,NULL),(537,'West Central Africa',34,NULL,NULL,NULL),(538,'Athens, Istanbul, Minsk',317,NULL,NULL,NULL),(539,'Bucharest',322,NULL,NULL,NULL),(540,'Cairo',13,NULL,NULL,NULL),(541,'Harare, Pretoria',24,NULL,NULL,NULL),(542,'Helsinki, Riga, Tallinn',330,NULL,NULL,NULL),(543,'Israel, Jerusalem Standard Time',245,NULL,NULL,NULL),(544,'Baghdad',220,NULL,NULL,NULL),(545,'Arab, Kuwait, Riyadh',256,NULL,NULL,NULL),(546,'Moscow, St. Petersburg, Volgograd',345,NULL,NULL,NULL),(547,'East Africa, Nairobi',43,NULL,NULL,NULL),(548,'Tehran',282,NULL,NULL,NULL),(549,'Abu Dhabi, Muscat',261,NULL,NULL,NULL),(550,'Baku, Tbilisi, Yerevan',222,NULL,NULL,NULL),(551,'Kabul',246,NULL,NULL,NULL),(552,'Ekaterinburg',291,NULL,NULL,NULL),(553,'Islamabad, Karachi, Tashkent',248,NULL,NULL,NULL),(554,'Kolkata, Chennai, Mumbai, New Delhi, India Standard Time',429,NULL,NULL,NULL),(555,'Kathmandu, Nepal',250,NULL,NULL,NULL),(556,'Almaty, Novosibirsk, North Central Asia',214,NULL,NULL,NULL),(557,'Astana, Dhaka',231,NULL,NULL,NULL),(558,'Sri Jayawardenepura, Sri Lanka',229,NULL,NULL,NULL),(559,'Rangoon',272,NULL,NULL,NULL),(560,'Bangkok, Hanoi, Jakarta',223,NULL,NULL,NULL),(561,'Krasnoyarsk',253,NULL,NULL,NULL),(562,'Beijing, Chongqing, Hong Kong SAR, Urumqi',277,NULL,NULL,NULL),(563,'Irkutsk, Ulaan Bataar',241,NULL,NULL,NULL),(564,'Kuala Lumpur, Singapore',278,NULL,NULL,NULL),(565,'Perth, Western Australia',313,NULL,NULL,NULL),(566,'Taipei',279,NULL,NULL,NULL),(567,'Osaka, Sapporo, Tokyo',284,NULL,NULL,NULL),(568,'Seoul, Korea Standard time',276,NULL,NULL,NULL),(569,'Yakutsk',290,NULL,NULL,NULL),(570,'Adelaide, Central Australia',303,NULL,NULL,NULL),(571,'Darwin',307,NULL,NULL,NULL),(572,'Brisbane, East Australia',304,NULL,NULL,NULL),(573,'Canberra, Melbourne, Sydney, Hobart (year 2000 only)',314,NULL,NULL,NULL),(574,'Guam, Port Moresby',396,NULL,NULL,NULL),(575,'Hobart, Tasmania',309,NULL,NULL,NULL),(576,'Vladivostok',289,NULL,NULL,NULL),(577,'Magadan, Solomon Is., New Caledonia',258,NULL,NULL,NULL),(578,'Auckland, Wellington',384,NULL,NULL,NULL),(579,'Fiji Islands, Kamchatka, Marshall Is.',391,NULL,NULL,NULL),(580,'Nuku\'alofa, Tonga',418,NULL,NULL,NULL),(581,'Azores',293,NULL,NULL,NULL),(582,'Cape Verde Is.',296,NULL,NULL,NULL),(583,'Mid-Atlantic',156,NULL,NULL,NULL),(584,'Brasilia',179,NULL,NULL,NULL),(585,'Buenos Aires',58,NULL,NULL,NULL),(586,'Greenland',105,NULL,NULL,NULL),(587,'Newfoundland',184,NULL,NULL,NULL),(588,'Atlantic Time (Canada)',113,NULL,NULL,NULL),(589,'Caracas, La Paz',85,NULL,NULL,NULL),(590,'Santiago',177,NULL,NULL,NULL),(591,'Bogota, Lima, Quito',80,NULL,NULL,NULL),(592,'Eastern Time (US & Canada)',153,NULL,NULL,NULL),(593,'Indiana (East)',116,NULL,NULL,NULL),(594,'Central America',110,NULL,NULL,NULL),(595,'Central Time (US & Canada)',88,NULL,NULL,NULL),(596,'Mexico City, Tegucigalpa',145,NULL,NULL,NULL),(597,'Saskatchewan',100,NULL,NULL,NULL),(598,'Arizona',164,NULL,NULL,NULL),(599,'Mountain Time (US & Canada)',97,NULL,NULL,NULL),(600,'Pacific Time (US & Canada); Tijuana',133,NULL,NULL,NULL),(601,'Alaska',54,NULL,NULL,NULL),(602,'Hawaii',397,NULL,NULL,NULL),(603,'Midway Island, Samoa',404,NULL,NULL,NULL),(604,'Eniwetok, Kwajalein, Dateline Time',401,NULL,NULL,NULL),(605,'Armenian Standard Time',292,NULL,NULL,NULL),(606,'Mexico Standard Time',145,NULL,NULL,NULL),(607,'Mexico Standard Time 2',89,NULL,NULL,NULL),(608,'Mid-Atlantic Standard Time',300,NULL,NULL,NULL),(609,'US/Eastern',153,NULL,NULL,NULL);
/*!40000 ALTER TABLE `egw_cal_timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_cal_user`
--

DROP TABLE IF EXISTS `egw_cal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_cal_user` (
  `cal_id` int(11) NOT NULL,
  `cal_recur_date` bigint(20) NOT NULL DEFAULT '0',
  `cal_user_type` varchar(1) NOT NULL DEFAULT 'u',
  `cal_user_id` varchar(128) NOT NULL,
  `cal_status` varchar(1) DEFAULT 'A',
  `cal_quantity` int(11) DEFAULT '1',
  `cal_role` varchar(64) DEFAULT 'REQ-PARTICIPANT',
  `cal_user_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cal_id`,`cal_recur_date`,`cal_user_type`,`cal_user_id`),
  KEY `egw_cal_user_modified` (`cal_user_modified`),
  KEY `egw_cal_user_type_id` (`cal_user_type`,`cal_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_cal_user`
--

LOCK TABLES `egw_cal_user` WRITE;
/*!40000 ALTER TABLE `egw_cal_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_cal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_cat2entry`
--

DROP TABLE IF EXISTS `egw_cat2entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_cat2entry` (
  `ce_app` varchar(25) NOT NULL,
  `ce_app_id` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `ce_owner` int(11) NOT NULL,
  PRIMARY KEY (`ce_app`,`ce_app_id`,`cat_id`),
  KEY `egw_cat2entry_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_cat2entry`
--

LOCK TABLES `egw_cat2entry` WRITE;
/*!40000 ALTER TABLE `egw_cat2entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_cat2entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_categories`
--

DROP TABLE IF EXISTS `egw_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_main` int(11) NOT NULL DEFAULT '0',
  `cat_parent` int(11) NOT NULL DEFAULT '0',
  `cat_level` smallint(6) NOT NULL DEFAULT '0',
  `cat_owner` varchar(255) NOT NULL DEFAULT '0',
  `cat_access` varchar(7) DEFAULT NULL,
  `cat_appname` varchar(50) NOT NULL,
  `cat_name` varchar(150) NOT NULL,
  `cat_description` varchar(255) NOT NULL,
  `cat_data` text,
  `last_mod` bigint(20) NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `egw_categories_appname_owner_parent_level` (`cat_appname`,`cat_owner`,`cat_parent`,`cat_level`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_categories`
--

LOCK TABLES `egw_categories` WRITE;
/*!40000 ALTER TABLE `egw_categories` DISABLE KEYS */;
INSERT INTO `egw_categories` VALUES (1,0,0,0,'0',NULL,'*update*','global=0','global=0',NULL,1410022003),(2,0,0,0,'0','public','news_admin','News','Category for news',NULL,1410022010),(3,0,0,0,'0','public','news_admin','egroupware.org','News from egroupware.org','a:3:{s:10:\"import_url\";s:39:\"http://www.egroupware.org/start/rss.xml\";s:16:\"import_frequency\";i:4;s:13:\"keep_imported\";i:0;}',1410022010),(4,0,0,0,'0','public','resources','General resources','This category has been added by setup',NULL,1410022010),(5,0,0,0,'0','public','resources','Locations','This category has been added by setup',NULL,1410022010),(6,6,0,0,'0','public','sitemgr','Default Website','',NULL,1410022010),(7,6,6,1,'0','public','sitemgr','Home','Home','0000',1410022010),(8,6,6,1,'0','public','sitemgr','Edit Contents','EGroupware Sitemanager content','0001',1410022010),(9,6,8,2,'0','public','sitemgr','Blocks','Adding and editing blocks','0002',1410022010),(10,6,6,1,'0','public','sitemgr','Configuration','Sitemanager configuration','0002',1410022011),(11,6,6,1,'0','public','sitemgr','Support','Get support','0005',1410022012),(12,6,6,1,'0','public','sitemgr','Contact','Contact Stylite','0006',1410022012),(13,13,0,0,'0','public','tracker','Feature Requests','Tracker added by setup.','a:1:{s:4:\"type\";s:7:\"tracker\";}',1410022015),(14,14,0,0,'0','public','tracker','Bugs','Tracker added by setup.','a:1:{s:4:\"type\";s:7:\"tracker\";}',1410022015),(15,15,0,0,'0','public','tracker','Patches','Tracker added by setup.','a:1:{s:4:\"type\";s:7:\"tracker\";}',1410022015),(16,16,0,0,'0','public','tracker','Stable Release','Version added by setup.','a:1:{s:4:\"type\";s:7:\"version\";}',1410022015),(17,17,0,0,'0','public','tracker','Development Version','Version added by setup.','a:1:{s:4:\"type\";s:7:\"version\";}',1410022015),(18,18,0,0,'0','public','tracker','Tracker','Cat added by setup.','a:1:{s:4:\"type\";s:3:\"cat\";}',1410022015),(19,19,0,0,'0','public','tracker','API','Cat added by setup.','a:1:{s:4:\"type\";s:3:\"cat\";}',1410022015),(20,20,0,0,'0','public','tracker','None','Resolution added by setup.','a:2:{s:4:\"type\";s:10:\"resolution\";s:9:\"isdefault\";b:1;}',1410022015),(21,21,0,0,'0','public','tracker','Accepted','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(22,22,0,0,'0','public','tracker','Duplicate','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(23,23,0,0,'0','public','tracker','Fixed','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(24,24,0,0,'0','public','tracker','Invalid','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(25,25,0,0,'0','public','tracker','Info only','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(26,26,0,0,'0','public','tracker','Later','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(27,27,0,0,'0','public','tracker','Out of date','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(28,28,0,0,'0','public','tracker','Postponed','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(29,29,0,0,'0','public','tracker','Outsourced','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(30,30,0,0,'0','public','tracker','Rejected','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(31,31,0,0,'0','public','tracker','Remind','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(32,32,0,0,'0','public','tracker','Wont fix','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(33,33,0,0,'0','public','tracker','Works for me','Resolution added by setup.','a:1:{s:4:\"type\";s:10:\"resolution\";}',1410022015),(34,15,15,1,'-1','public','tracker','Translations','Added by setup.','cat',1410022015);
/*!40000 ALTER TABLE `egw_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_config`
--

DROP TABLE IF EXISTS `egw_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_config` (
  `config_app` varchar(50) NOT NULL,
  `config_name` varchar(255) NOT NULL,
  `config_value` text,
  PRIMARY KEY (`config_app`,`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_config`
--

LOCK TABLES `egw_config` WRITE;
/*!40000 ALTER TABLE `egw_config` DISABLE KEYS */;
INSERT INTO `egw_config` VALUES ('infolog','history','history_admin_delete'),('phpgwapi','site_title','EGroupware'),('phpgwapi','hostname','stephestbeau.plop.plop'),('phpgwapi','webserver_url','/egroupware'),('phpgwapi','temp_dir','/usr/share/egroupware_tmp'),('phpgwapi','files_dir','/var/lib/egroupware/default/files'),('phpgwapi','backup_dir','/var/lib/egroupware/default/backup'),('phpgwapi','enabled_spellcheck','True'),('phpgwapi','history','history'),('phpgwapi','calendar_delete_history','history'),('phpgwapi','usecookies','True'),('phpgwapi','system_charset','utf-8'),('phpgwapi','server_timezone','Europe/Paris'),('phpgwapi','install_id','c04cc44bbf0c0734f657d70a16656913'),('admin','postpone_statistics_submit','1410238002'),('phpgwapi','ldap_encryption_type','blowfish_crypt'),('phpgwapi','sql_encryption_type','blowfish_crypt'),('phpgwapi','sessions_checkip','True'),('phpgwapi','asyncservice','fallback'),('bookmarks','mail_footer','\\n\\n--\\nThis was sent from eGroupWare\\nhttp://www.egroupware.org\\n'),('phpgwapi','auto_load_holidays','True'),('phpgwapi','holidays_url_path','localhost'),('phpgwapi','tz_version','1.2013c'),('phpgwapi','tz_aliases_mtime','2014-09-03 13:26:00'),('registration','anonymous_user','anonymous'),('registration','anonymous_pass','anonymous'),('registration','accounts_expire','-1'),('registration','enable_registration',''),('registration','register_link',''),('registration','expiry','2'),('resources','location_cats','5'),('resources','history','history'),('sitemgr','logo_url_6','http://sitemgr.egroupware.de/uploads/logo.png'),('sitemgr','custom_css_6','/**\r\n * Custom CSS to set logo for joomlart templates\r\n */\r\nh1.logo a, div#logo, #logo, div#ja-header h1, div#header h1 {\r\n	background: url(\"$$logo_url$$\") no-repeat left center;\r\n}\r\ndiv#ja-header h1 a img, div#header h1 a img, div#header h1 img {\r\n	visibility: hidden;\r\n}\r\n'),('sitemgr','params_ini_6','[ja_purity]\nexcludeModules=38\nhorNav=1\nhorNavType=moo\nja_font=3\nja_screen=fluid\nja_screen_width=90\nlogoText=EGroupware\nlogoType=image\nrightCollapseDefault=show\nrightCollapsible=1\nshowComponent=1\nsloganText=...because open source matters\ntheme_background=lighter\ntheme_elements=red\ntheme_header=green\n[ja_sulfur]\nja_color=default\nja_font=3\nja_menu=css\nja_menu_effect=1\nlogoText=JA Sulfur\nlogoType=image\nmenutype=mainmenu\nsloganText=1st June 09 JA Template\nusertool_color=4\n[ja_zibal]\nModuleCollapsible=1\nja_color=default\nja_font=3\nja_menu=2\nja_screen=wide\nusertool=7\n'),('timesheet','history','history'),('tracker','overdue_days','14'),('tracker','pending_close_days','0'),('tracker','allow_voting','1'),('tracker','allow_assign_groups','1'),('tracker','field_acl','a:19:{s:10:\"tr_summary\";i:49;s:10:\"tr_tracker\";i:97;s:6:\"cat_id\";i:49;s:10:\"tr_version\";i:49;s:9:\"tr_status\";i:49;s:14:\"tr_description\";i:64;s:11:\"tr_assigned\";i:17;s:10:\"tr_private\";i:49;s:9:\"tr_budget\";i:33;s:13:\"tr_resolution\";i:33;s:13:\"tr_completion\";i:33;s:11:\"tr_priority\";i:49;s:12:\"tr_startdate\";i:49;s:10:\"tr_duedate\";i:17;s:7:\"link_to\";i:49;s:15:\"canned_response\";i:33;s:13:\"reply_message\";i:4;s:3:\"add\";i:4;s:4:\"vote\";i:8;}'),('tracker','admins','a:1:{i:0;a:1:{i:0;i:-2;}}'),('tracker','technicians','a:1:{i:0;a:1:{i:0;i:-1;}}'),('phpgwapi','max_access_log_age','90'),('phpgwapi','block_time','1'),('phpgwapi','num_unsuccessful_id','3'),('phpgwapi','num_unsuccessful_ip','15'),('phpgwapi','max_history','20'),('phpgwapi','vfs_storage_mode','fs'),('phpgwapi','auth_type','mail'),('phpgwapi','account_repository','sql'),('phpgwapi','auto_create_acct','True'),('phpgwapi','auto_create_expire','never'),('phpgwapi','acl_default','deny'),('phpgwapi','mail_server','localhost:993'),('phpgwapi','mail_server_type','imaps'),('phpgwapi','mail_login_type','standard'),('phpgwapi','mail_suffix','plop.plop'),('phpgwapi','cas_authentication_mode','Client'),('phpgwapi','cas_ssl_validation','No'),('phpgwapi','tz_offset','2'),('phpgwapi','translation_load_via','{\"common\":\"all-apps\",\"preferences\":\"all-apps\",\"admin\":\"all-apps\",\"jscalendar\":\"phpgwapi\",\"sitemgr-link\":\"sitemgr\",\"groupdav\":\"phpgwapi\",\"login\":[\"phpgwapi\",\"registration\"],\"filemanager\":[\"filemanager\",\"etemplate\"],\"addressbook\":[\"addressbook\",\"preferences\"]}');
/*!40000 ALTER TABLE `egw_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_contentmap`
--

DROP TABLE IF EXISTS `egw_contentmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_contentmap` (
  `map_id` varchar(128) NOT NULL DEFAULT '',
  `map_guid` varchar(100) NOT NULL DEFAULT '',
  `map_locuid` varchar(100) NOT NULL DEFAULT '',
  `map_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_expired` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`map_id`,`map_guid`,`map_locuid`),
  KEY `egw_contentmap_map_expired` (`map_expired`),
  KEY `egw_contentmap_map_id_map_locuid` (`map_id`,`map_locuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_contentmap`
--

LOCK TABLES `egw_contentmap` WRITE;
/*!40000 ALTER TABLE `egw_contentmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_contentmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_customfields`
--

DROP TABLE IF EXISTS `egw_customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_customfields` (
  `cf_id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_app` varchar(50) NOT NULL,
  `cf_name` varchar(128) NOT NULL,
  `cf_label` varchar(128) DEFAULT NULL,
  `cf_type` varchar(64) NOT NULL DEFAULT 'text',
  `cf_type2` varchar(2048) DEFAULT NULL,
  `cf_help` varchar(256) DEFAULT NULL,
  `cf_values` varchar(8096) DEFAULT NULL,
  `cf_len` smallint(6) DEFAULT NULL,
  `cf_rows` smallint(6) DEFAULT NULL,
  `cf_order` smallint(6) DEFAULT NULL,
  `cf_needed` tinyint(4) DEFAULT '0',
  `cf_private` varchar(2048) DEFAULT NULL,
  `cf_modifier` int(11) DEFAULT NULL,
  `cf_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cf_tab` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`cf_id`),
  UNIQUE KEY `egw_customfields_cf_app_cf_name` (`cf_app`,`cf_name`),
  KEY `egw_customfields_cf_app_cf_order` (`cf_app`,`cf_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_customfields`
--

LOCK TABLES `egw_customfields` WRITE;
/*!40000 ALTER TABLE `egw_customfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_customfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_ea_accounts`
--

DROP TABLE IF EXISTS `egw_ea_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_ea_accounts` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_name` varchar(80) DEFAULT NULL,
  `ident_id` int(11) NOT NULL,
  `acc_imap_host` varchar(128) NOT NULL,
  `acc_imap_ssl` tinyint(4) NOT NULL DEFAULT '0',
  `acc_imap_port` int(11) NOT NULL DEFAULT '143',
  `acc_sieve_enabled` tinyint(4) DEFAULT '0',
  `acc_sieve_host` varchar(128) DEFAULT NULL,
  `acc_sieve_port` int(11) DEFAULT '4190',
  `acc_folder_sent` varchar(128) DEFAULT NULL,
  `acc_folder_trash` varchar(128) DEFAULT NULL,
  `acc_folder_draft` varchar(128) DEFAULT NULL,
  `acc_folder_template` varchar(128) DEFAULT NULL,
  `acc_smtp_host` varchar(128) DEFAULT NULL,
  `acc_smtp_ssl` tinyint(4) NOT NULL DEFAULT '0',
  `acc_smtp_port` int(11) NOT NULL DEFAULT '25',
  `acc_smtp_type` varchar(32) DEFAULT 'emailadmin_smtp',
  `acc_imap_type` varchar(32) DEFAULT 'emailadmin_imap',
  `acc_imap_logintype` varchar(20) DEFAULT NULL,
  `acc_domain` varchar(100) DEFAULT NULL,
  `acc_further_identities` tinyint(4) NOT NULL DEFAULT '1',
  `acc_user_editable` tinyint(4) NOT NULL DEFAULT '1',
  `acc_sieve_ssl` tinyint(4) DEFAULT '1',
  `acc_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `acc_modifier` int(11) DEFAULT NULL,
  `acc_smtp_auth_session` tinyint(4) DEFAULT NULL,
  `acc_folder_junk` varchar(128) DEFAULT NULL,
  `acc_imap_default_quota` int(11) DEFAULT NULL,
  `acc_imap_timeout` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_ea_accounts`
--

LOCK TABLES `egw_ea_accounts` WRITE;
/*!40000 ALTER TABLE `egw_ea_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_ea_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_ea_credentials`
--

DROP TABLE IF EXISTS `egw_ea_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_ea_credentials` (
  `cred_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) NOT NULL,
  `cred_type` tinyint(4) NOT NULL,
  `account_id` int(11) NOT NULL,
  `cred_username` varchar(80) NOT NULL,
  `cred_password` varchar(80) DEFAULT NULL,
  `cred_pw_enc` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`cred_id`),
  UNIQUE KEY `egw_ea_credentials_acc_id_account_id_cred_type` (`acc_id`,`account_id`,`cred_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_ea_credentials`
--

LOCK TABLES `egw_ea_credentials` WRITE;
/*!40000 ALTER TABLE `egw_ea_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_ea_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_ea_identities`
--

DROP TABLE IF EXISTS `egw_ea_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_ea_identities` (
  `ident_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) NOT NULL,
  `ident_realname` varchar(128) NOT NULL,
  `ident_email` varchar(128) DEFAULT NULL,
  `ident_org` varchar(128) DEFAULT NULL,
  `ident_signature` text,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `ident_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_ea_identities`
--

LOCK TABLES `egw_ea_identities` WRITE;
/*!40000 ALTER TABLE `egw_ea_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_ea_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_ea_notifications`
--

DROP TABLE IF EXISTS `egw_ea_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_ea_notifications` (
  `notif_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `notif_folder` varchar(255) NOT NULL,
  PRIMARY KEY (`notif_id`),
  KEY `egw_ea_notifications_account_id_acc_id` (`account_id`,`acc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_ea_notifications`
--

LOCK TABLES `egw_ea_notifications` WRITE;
/*!40000 ALTER TABLE `egw_ea_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_ea_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_ea_valid`
--

DROP TABLE IF EXISTS `egw_ea_valid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_ea_valid` (
  `acc_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  KEY `egw_ea_valid_acc_id_account_id` (`acc_id`,`account_id`),
  KEY `egw_ea_valid_account_id_acc_id` (`account_id`,`acc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_ea_valid`
--

LOCK TABLES `egw_ea_valid` WRITE;
/*!40000 ALTER TABLE `egw_ea_valid` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_ea_valid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_emailadmin`
--

DROP TABLE IF EXISTS `egw_emailadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_emailadmin` (
  `ea_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `ea_smtp_server` varchar(80) DEFAULT NULL,
  `ea_smtp_type` varchar(56) DEFAULT NULL,
  `ea_smtp_port` int(11) DEFAULT NULL,
  `ea_smtp_auth` varchar(3) DEFAULT NULL,
  `ea_editforwardingaddress` varchar(3) DEFAULT NULL,
  `ea_smtp_ldap_server` varchar(80) DEFAULT NULL,
  `ea_smtp_ldap_basedn` varchar(200) DEFAULT NULL,
  `ea_smtp_ldap_admindn` varchar(200) DEFAULT NULL,
  `ea_smtp_ldap_adminpw` varchar(30) DEFAULT NULL,
  `ea_smtp_ldap_use_default` varchar(3) DEFAULT NULL,
  `ea_imap_server` varchar(80) DEFAULT NULL,
  `ea_imap_type` varchar(56) DEFAULT NULL,
  `ea_imap_port` int(11) DEFAULT NULL,
  `ea_imap_login_type` varchar(20) DEFAULT NULL,
  `ea_imap_tsl_auth` varchar(3) DEFAULT NULL,
  `ea_imap_tsl_encryption` varchar(3) DEFAULT NULL,
  `ea_imap_enable_cyrus` varchar(3) DEFAULT NULL,
  `ea_imap_admin_user` varchar(40) DEFAULT NULL,
  `ea_imap_admin_pw` varchar(40) DEFAULT NULL,
  `ea_imap_enable_sieve` varchar(3) DEFAULT NULL,
  `ea_imap_sieve_server` varchar(80) DEFAULT NULL,
  `ea_imap_sieve_port` int(11) DEFAULT NULL,
  `ea_description` varchar(200) DEFAULT NULL,
  `ea_default_domain` varchar(100) DEFAULT NULL,
  `ea_organisation_name` varchar(100) DEFAULT NULL,
  `ea_user_defined_identities` varchar(3) DEFAULT NULL,
  `ea_user_defined_accounts` varchar(3) DEFAULT NULL,
  `ea_order` int(11) DEFAULT NULL,
  `ea_appname` varchar(80) DEFAULT NULL,
  `ea_group` varchar(80) DEFAULT NULL,
  `ea_user` varchar(80) DEFAULT NULL,
  `ea_active` int(11) DEFAULT NULL,
  `ea_smtp_auth_username` varchar(128) DEFAULT NULL,
  `ea_smtp_auth_password` varchar(80) DEFAULT NULL,
  `ea_user_defined_signatures` varchar(3) DEFAULT NULL,
  `ea_default_signature` text,
  `ea_imap_auth_username` varchar(80) DEFAULT NULL,
  `ea_imap_auth_password` varchar(80) DEFAULT NULL,
  `ea_stationery_active_templates` text,
  PRIMARY KEY (`ea_profile_id`),
  KEY `egw_emailadmin_ea_appname` (`ea_appname`),
  KEY `egw_emailadmin_ea_group` (`ea_group`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_emailadmin`
--

LOCK TABLES `egw_emailadmin` WRITE;
/*!40000 ALTER TABLE `egw_emailadmin` DISABLE KEYS */;
INSERT INTO `egw_emailadmin` VALUES (1,'localhost','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'localhost','2',143,'standard',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'default profile (created by setup)','plop.plop',NULL,NULL,NULL,NULL,'','0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `egw_emailadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_etemplate`
--

DROP TABLE IF EXISTS `egw_etemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_etemplate` (
  `et_name` varchar(80) NOT NULL,
  `et_template` varchar(20) NOT NULL DEFAULT '',
  `et_lang` varchar(5) NOT NULL DEFAULT '',
  `et_group` int(11) NOT NULL DEFAULT '0',
  `et_version` varchar(20) NOT NULL DEFAULT '',
  `et_data` longtext,
  `et_size` varchar(128) DEFAULT NULL,
  `et_style` text,
  `et_modified` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`et_name`,`et_template`,`et_lang`,`et_group`,`et_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_etemplate`
--

LOCK TABLES `egw_etemplate` WRITE;
/*!40000 ALTER TABLE `egw_etemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_etemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_felamimail_accounts`
--

DROP TABLE IF EXISTS `egw_felamimail_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_felamimail_accounts` (
  `fm_owner` int(11) NOT NULL DEFAULT '0',
  `fm_id` int(11) NOT NULL AUTO_INCREMENT,
  `fm_realname` varchar(128) DEFAULT NULL,
  `fm_organization` varchar(128) DEFAULT NULL,
  `fm_emailaddress` varchar(128) NOT NULL DEFAULT '',
  `fm_ic_hostname` varchar(128) DEFAULT NULL,
  `fm_ic_port` int(11) DEFAULT NULL,
  `fm_ic_username` varchar(128) DEFAULT NULL,
  `fm_ic_password` varchar(128) DEFAULT NULL,
  `fm_ic_encryption` int(11) DEFAULT NULL,
  `fm_og_hostname` varchar(128) DEFAULT NULL,
  `fm_og_port` int(11) DEFAULT NULL,
  `fm_og_smtpauth` tinyint(4) DEFAULT NULL,
  `fm_og_username` varchar(128) DEFAULT NULL,
  `fm_og_password` varchar(128) DEFAULT NULL,
  `fm_active` tinyint(4) NOT NULL DEFAULT '0',
  `fm_ic_validatecertificate` tinyint(4) DEFAULT NULL,
  `fm_ic_enable_sieve` tinyint(4) DEFAULT NULL,
  `fm_ic_sieve_server` varchar(128) DEFAULT NULL,
  `fm_ic_sieve_port` int(11) DEFAULT NULL,
  `fm_signatureid` int(11) DEFAULT NULL,
  `fm_ic_folderstoshowinhome` text,
  `fm_ic_sentfolder` varchar(128) DEFAULT NULL,
  `fm_ic_trashfolder` varchar(128) DEFAULT NULL,
  `fm_ic_draftfolder` varchar(128) DEFAULT NULL,
  `fm_ic_templatefolder` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`fm_id`),
  KEY `egw_felamimail_accounts_fm_owner` (`fm_owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_felamimail_accounts`
--

LOCK TABLES `egw_felamimail_accounts` WRITE;
/*!40000 ALTER TABLE `egw_felamimail_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_felamimail_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_felamimail_displayfilter`
--

DROP TABLE IF EXISTS `egw_felamimail_displayfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_felamimail_displayfilter` (
  `fmail_filter_accountid` int(11) NOT NULL,
  `fmail_filter_data` text,
  PRIMARY KEY (`fmail_filter_accountid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_felamimail_displayfilter`
--

LOCK TABLES `egw_felamimail_displayfilter` WRITE;
/*!40000 ALTER TABLE `egw_felamimail_displayfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_felamimail_displayfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_felamimail_signatures`
--

DROP TABLE IF EXISTS `egw_felamimail_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_felamimail_signatures` (
  `fm_signatureid` int(11) NOT NULL AUTO_INCREMENT,
  `fm_accountid` int(11) DEFAULT NULL,
  `fm_signature` text,
  `fm_description` varchar(255) DEFAULT NULL,
  `fm_defaultsignature` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`fm_signatureid`),
  UNIQUE KEY `egw_felamimail_signatures_fm_signatureid_fm_accountid` (`fm_signatureid`,`fm_accountid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_felamimail_signatures`
--

LOCK TABLES `egw_felamimail_signatures` WRITE;
/*!40000 ALTER TABLE `egw_felamimail_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_felamimail_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_history_log`
--

DROP TABLE IF EXISTS `egw_history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_history_log` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_record_id` int(11) NOT NULL,
  `history_appname` varchar(64) NOT NULL,
  `history_owner` int(11) NOT NULL,
  `history_status` varchar(64) NOT NULL,
  `history_new_value` text,
  `history_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `history_old_value` text,
  `sessionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `egw_history_log_appname_record_id_id` (`history_appname`,`history_record_id`,`history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_history_log`
--

LOCK TABLES `egw_history_log` WRITE;
/*!40000 ALTER TABLE `egw_history_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_hooks`
--

DROP TABLE IF EXISTS `egw_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_hooks` (
  `hook_id` int(11) NOT NULL AUTO_INCREMENT,
  `hook_appname` varchar(255) DEFAULT NULL,
  `hook_location` varchar(255) DEFAULT NULL,
  `hook_filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hook_id`)
) ENGINE=MyISAM AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_hooks`
--

LOCK TABLES `egw_hooks` WRITE;
/*!40000 ALTER TABLE `egw_hooks` DISABLE KEYS */;
INSERT INTO `egw_hooks` VALUES (1,'phpgwapi','addaccount','phpgwapi.vfs_home_hooks.addAccount'),(2,'phpgwapi','deleteaccount','phpgwapi.vfs_home_hooks.deleteAccount'),(3,'phpgwapi','editaccount','phpgwapi.vfs_home_hooks.editAccount'),(4,'phpgwapi','addgroup','phpgwapi.vfs_home_hooks.addGroup'),(5,'phpgwapi','deletegroup','phpgwapi.vfs_home_hooks.deleteGroup'),(6,'phpgwapi','editgroup','phpgwapi.vfs_home_hooks.editGroup'),(7,'admin','acl_manager','hook_acl_manager.inc.php'),(8,'admin','after_navbar','hook_after_navbar.inc.php'),(9,'admin','config_validate','hook_config_validate.inc.php'),(10,'admin','deleteaccount','hook_deleteaccount.inc.php'),(11,'admin','topmenu_info','hook_topmenu_info.inc.php'),(12,'admin','admin','admin_hooks::all_hooks'),(13,'admin','sidebox_menu','admin_hooks::all_hooks'),(14,'admin','edit_user','admin_hooks::edit_user'),(15,'admin','addressbook_edit','admin.admin_account.addressbook_edit'),(16,'preferences','deleteaccount','preferences_hooks::deleteaccount'),(17,'preferences','deletegroup','preferences_hooks::deleteaccount'),(18,'preferences','settings','preferences_hooks::settings'),(19,'preferences','edit_user','preferences_hooks::edit_user'),(20,'preferences','view_user','preferences_hooks::edit_user'),(21,'preferences','edit_group','preferences_hooks::edit_user'),(22,'preferences','group_manager','preferences_hooks::edit_user'),(23,'preferences','admin','preferences_hooks::admin'),(24,'preferences','deny_prefs','preferences_hooks::deny_prefs'),(25,'preferences','deny_acl','preferences_hooks::deny_acl'),(26,'preferences','deny_cats','preferences_hooks::deny_cats'),(27,'etemplate','sidebox_menu','hook_sidebox_menu.inc.php'),(28,'groupdav','preferences','groupdav_hooks::menus'),(29,'groupdav','settings','groupdav_hooks::settings'),(30,'activesync','preferences','activesync_hooks::menus'),(31,'activesync','settings','activesync_hooks::settings'),(32,'activesync','verify_settings','activesync_hooks::verify_settings'),(33,'addressbook','admin','addressbook_hooks::all_hooks'),(34,'addressbook','sidebox_menu','addressbook_hooks::all_hooks'),(35,'addressbook','settings','addressbook_hooks::settings'),(36,'addressbook','home','hook_home.inc.php'),(37,'addressbook','deleteaccount','addressbook.addressbook_bo.deleteaccount'),(38,'addressbook','deletegroup','addressbook.addressbook_bo.deleteaccount'),(39,'addressbook','delete_category','addressbook.addressbook_bo.delete_category'),(40,'addressbook','search_link','addressbook_hooks::search_link'),(41,'addressbook','calendar_resources','addressbook_hooks::calendar_resources'),(42,'addressbook','config','hook_config.inc.php'),(43,'addressbook','group_acl','addressbook_hooks::group_acl'),(44,'addressbook','not_enum_group_acls','addressbook_hooks::not_enum_group_acls'),(45,'addressbook','export_limit','addressbook_hooks::getAppExportLimit'),(46,'addressbook','acl_rights','addressbook_hooks::acl_rights'),(47,'addressbook','categories','addressbook_hooks::categories'),(48,'bookmarks','preferences','bookmarks_hooks::all_hooks'),(49,'bookmarks','settings','bookmarks_hooks::settings'),(50,'bookmarks','admin','bookmarks_hooks::all_hooks'),(51,'bookmarks','sidebox_menu','bookmarks_hooks::all_hooks'),(52,'bookmarks','search_link','bookmarks_hooks::search_link'),(53,'bookmarks','acl_rights','bookmarks_hooks::acl_rights'),(54,'bookmarks','categories','bookmarks_hooks::categories'),(55,'calendar','admin','calendar_hooks::admin'),(56,'calendar','deleteaccount','calendar.calendar_so.deleteaccount'),(57,'calendar','home','calendar_hooks::home'),(58,'calendar','settings','calendar_hooks::settings'),(59,'calendar','verify_settings','calendar_hooks::verify_settings'),(60,'calendar','sidebox_menu','calendar.calendar_ui.sidebox_menu'),(61,'calendar','search_link','calendar_hooks::search_link'),(62,'calendar','config_validate','calendar_hooks::config_validate'),(63,'calendar','timesheet_set','calendar.calendar_bo.timesheet_set'),(64,'calendar','infolog_set','calendar.calendar_bo.infolog_set'),(65,'calendar','export_limit','calendar_hooks::getAppExportLimit'),(66,'calendar','acl_rights','calendar_hooks::acl_rights'),(67,'calendar','categories','calendar_hooks::categories'),(68,'emailadmin','edit_user','emailadmin_hooks::edit_user'),(69,'emailadmin','deleteaccount','emailadmin_hooks::deleteaccount'),(70,'emailadmin','addaccount','emailadmin_hooks::addaccount'),(71,'emailadmin','editaccount','emailadmin_hooks::addaccount'),(72,'emailadmin','deletegroup','emailadmin_hooks::deletegroup'),(73,'emailadmin','changepassword','emailadmin_hooks::changepassword'),(74,'emailadmin','smtp_server_types','emailadmin_hooks::server_types'),(75,'emailadmin','imap_server_types','emailadmin_hooks::server_types'),(76,'filemanager','settings','filemanager_hooks::settings'),(77,'filemanager','sidebox_menu','filemanager_hooks::sidebox_menu'),(78,'filemanager','admin','filemanager_hooks::admin'),(79,'filemanager','search_link','filemanager_hooks::search_link'),(80,'home','hasUpdates','home.updates.hasUpdates'),(81,'home','showUpdates','home.updates.showUpdates'),(82,'importexport','sidebox_menu','importexport_admin_prefs_sidebox_hooks::all_hooks'),(83,'importexport','admin','importexport_admin_prefs_sidebox_hooks::all_hooks'),(84,'importexport','sidebox_all','importexport_admin_prefs_sidebox_hooks::other_apps'),(85,'importexport','etemplate2_register_widgets','importexport_admin_prefs_sidebox_hooks::widgets'),(86,'infolog','settings','infolog_hooks::settings'),(87,'infolog','verify_settings','infolog_hooks::verify_settings'),(88,'infolog','admin','infolog_hooks::all_hooks'),(89,'infolog','not_enum_group_acls','infolog_hooks::not_enum_group_acls'),(90,'infolog','acl_rights','infolog_hooks::acl_rights'),(91,'infolog','categories','infolog_hooks::categories'),(92,'infolog','deleteaccount','infolog.infolog_so.change_delete_owner'),(93,'infolog','home','hook_home.inc.php'),(94,'infolog','addressbook_view','infolog.infolog_ui.hook_view'),(95,'infolog','projects_view','infolog.infolog_ui.hook_view'),(96,'infolog','calendar_view','infolog.infolog_ui.hook_view'),(97,'infolog','infolog','infolog.infolog_ui.hook_view'),(98,'infolog','calendar_include_events','infolog.infolog_bo.cal_to_include'),(99,'infolog','calendar_include_todos','infolog.infolog_bo.cal_to_include'),(100,'infolog','sidebox_menu','infolog_hooks::all_hooks'),(101,'infolog','search_link','infolog_hooks::search_link'),(102,'infolog','pm_custom_app_icons','infolog.infolog_bo.pm_icons'),(103,'infolog','timesheet_set','infolog.infolog_ui.timesheet_set'),(104,'infolog','calendar_set','infolog.infolog_ui.calendar_set'),(105,'news_admin','admin','news_admin.news_admin_hooks.all_hooks'),(106,'news_admin','sidebox_menu','news_admin.news_admin_hooks.all_hooks'),(107,'news_admin','settings','news_admin.news_admin_hooks.settings'),(108,'news_admin','categories','news_admin.news_admin_hooks.categories'),(109,'news_admin','search_link','news_admin.news_admin_hooks.links'),(110,'news_admin','home','hook_home.inc.php'),(111,'notifications','after_navbar','hook_after_navbar.inc.php'),(112,'notifications','settings','hook_settings.inc.php'),(113,'notifications','admin','hook_admin.inc.php'),(114,'notifications','deleteaccount','notifications.notifications.deleteaccount'),(115,'phpbrain','about','hook_about.inc.php'),(116,'phpbrain','admin','hook_admin.inc.php'),(117,'phpbrain','add_def_pref','hook_add_def_pref.inc.php'),(118,'phpbrain','config','hook_config.inc.php'),(119,'phpbrain','config_validate','hook_config_validate.inc.php'),(120,'phpbrain','settings','hook_settings.inc.php'),(121,'phpbrain','sidebox_menu','hook_sidebox_menu.inc.php'),(122,'phpbrain','deleteaccount','phpbrain.bokb.deleteaccount'),(123,'phpbrain','search_link','phpbrain.bokb.search_link'),(124,'phpbrain','delete_category','phpbrain.bokb.delete_category'),(125,'phpbrain','acl_rights','phpbrain_bo::acl_rights'),(126,'phpbrain','categories','phpbrain_bo::categories'),(127,'phpfreechat','admin','phpfreechat_hooks::all_hooks'),(128,'phpfreechat','tab_closed','phpfreechat_hooks::all_hooks'),(129,'phpfreechat','clear_cache','phpfreechat_hooks::all_hooks'),(130,'projectmanager','settings','projectmanager_hooks::settings'),(131,'projectmanager','admin','projectmanager_hooks::all_hooks'),(132,'projectmanager','sidebox_menu','projectmanager_hooks::all_hooks'),(133,'projectmanager','search_link','projectmanager_hooks::search_link'),(134,'projectmanager','acl_rights','projectmanager_hooks::acl_rights'),(135,'projectmanager','categories','projectmanager_hooks::categories'),(136,'registration','admin','registration_hooks::all_hooks'),(137,'registration','search_link','registration_hooks::search_link'),(138,'resources','categories','resources_hooks::categories'),(139,'resources','admin','resources.resources_hooks.admin_prefs_sidebox'),(140,'resources','sidebox_menu','resources.resources_hooks.admin_prefs_sidebox'),(141,'resources','search_link','resources.resources_hooks.search_link'),(142,'resources','calendar_resources','resources.resources_hooks.calendar_resources'),(143,'resources','delete_category','resources.resources_hooks.delete_category'),(144,'resources','settings','resources_hooks::settings'),(145,'sambaadmin','edit_user','hook_edit_user.inc.php'),(146,'sambaadmin','admin','hook_admin.inc.php'),(147,'sambaadmin','changepassword','sambaadmin.bosambaadmin.changePassword'),(148,'sambaadmin','addaccount','sambaadmin.bosambaadmin.updateAccount'),(149,'sambaadmin','editaccount','sambaadmin.bosambaadmin.updateAccount'),(150,'sambaadmin','addgroup','sambaadmin.bosambaadmin.updateGroup'),(151,'sambaadmin','editgroup','sambaadmin.bosambaadmin.updateGroup'),(152,'sitemgr','about','hook_about.inc.php'),(153,'sitemgr','admin','hook_admin.inc.php'),(154,'sitemgr','sidebox_menu','hook_sidebox_menu.inc.php'),(155,'sitemgr','csp-frame-src','sitemgr.Sites_SO.csp_frame_src'),(156,'timesheet','categories','timesheet_hooks::categories'),(157,'timesheet','settings','timesheet_hooks::settings'),(158,'timesheet','admin','timesheet_hooks::all_hooks'),(159,'timesheet','sidebox_menu','timesheet_hooks::all_hooks'),(160,'timesheet','search_link','timesheet_hooks::search_link'),(161,'timesheet','pm_cumulate','timesheet_hooks::cumulate'),(162,'timesheet','deleteaccount','timesheet.timesheet_bo.deleteaccount'),(163,'timesheet','acl_rights','timesheet_hooks::acl_rights'),(164,'wiki','admin','wiki_hooks::admin'),(165,'wiki','sidebox_menu','wiki_hooks::sidebox_menu'),(166,'wiki','config_validate','hook_config_validate.inc.php'),(167,'wiki','settings','wiki_hooks::settings'),(168,'wiki','search_link','wiki_hooks::search_link'),(169,'mail','search_link','mail_hooks::search_link'),(170,'mail','admin','mail_hooks::admin'),(171,'mail','settings','mail_hooks::settings'),(172,'mail','sidebox_menu','mail_hooks::sidebox_menu'),(173,'mail','session_creation','mail_bo::resetConnectionErrorCache'),(174,'mail','verify_settings','mail_bo::forcePrefReload'),(175,'mail','clear_cache','mail_bo::unsetCachedObjects'),(176,'mail','check_notify','mail_hooks::notification_check_mailbox'),(177,'mail','edit_user','mail_hooks::edit_user'),(178,'manual','admin','manual.uimanualadmin.menu'),(179,'manual','config','manual.uimanualadmin.config'),(180,'manual','config_validate','manual.uimanualadmin.config'),(181,'tracker','settings','tracker_hooks::settings'),(182,'tracker','admin','tracker_hooks::all_hooks'),(183,'tracker','sidebox_menu','tracker_hooks::all_hooks'),(184,'tracker','search_link','tracker_hooks::search_link'),(185,'tracker','deleteaccount','tracker.tracker_so.change_delete_owner'),(186,'tracker','home','hook_home.inc.php'),(187,'tracker','timesheet_set','tracker.tracker_ui.timesheet_set'),(188,'tracker','infolog_set','tracker.tracker_ui.infolog_set'),(189,'tracker','verify_settings','tracker_hooks::verify_settings'),(190,'tracker','addressbook_view','tracker.tracker_ui.hook_view');
/*!40000 ALTER TABLE `egw_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_importexport_definitions`
--

DROP TABLE IF EXISTS `egw_importexport_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_importexport_definitions` (
  `definition_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `allowed_users` varchar(255) DEFAULT NULL,
  `plugin_options` longtext,
  `owner` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `filter` longtext,
  PRIMARY KEY (`definition_id`),
  UNIQUE KEY `egw_importexport_definitions_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_importexport_definitions`
--

LOCK TABLES `egw_importexport_definitions` WRITE;
/*!40000 ALTER TABLE `egw_importexport_definitions` DISABLE KEYS */;
INSERT INTO `egw_importexport_definitions` VALUES (1,'export-projectmanager','projectmanager','projectmanager_export_projects_csv','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"array\" name=\"mapping\">\n    <entry type=\"string\" name=\"pm_id\">Projectid</entry>\n    <entry type=\"string\" name=\"pm_title\">Title</entry>\n    <entry type=\"string\" name=\"pm_number\">Projectnumber</entry>\n    <entry type=\"string\" name=\"pm_description\">Description</entry>\n    <entry type=\"string\" name=\"pm_creator\">Owner</entry>\n    <entry type=\"string\" name=\"pm_created\">Created</entry>\n    <entry type=\"string\" name=\"pm_modifier\">Modifier</entry>\n    <entry type=\"string\" name=\"pm_modified\">Modified</entry>\n    <entry type=\"string\" name=\"pm_planned_start\">Planned start</entry>\n    <entry type=\"string\" name=\"pm_planned_end\">Planned end</entry>\n    <entry type=\"string\" name=\"pm_real_start\">Real start</entry>\n    <entry type=\"string\" name=\"pm_real_end\">Real end</entry>\n    <entry type=\"string\" name=\"cat_id\">Category</entry>\n    <entry type=\"string\" name=\"pm_access\">Access</entry>\n    <entry type=\"string\" name=\"pm_priority\">Priority</entry>\n    <entry type=\"string\" name=\"pm_status\">Status</entry>\n    <entry type=\"string\" name=\"pm_completion\">Completion</entry>\n    <entry type=\"string\" name=\"pm_used_time\">Used time</entry>\n    <entry type=\"string\" name=\"pm_planned_time\">Planned time</entry>\n    <entry type=\"string\" name=\"pm_replanned_time\">Replanned time</entry>\n    <entry type=\"string\" name=\"pm_used_budget\">Used budget</entry>\n    <entry type=\"string\" name=\"pm_planned_budget\">Planned budget</entry>\n    <entry type=\"string\" name=\"pm_accounting_type\">Accounting type</entry>\n    <entry type=\"string\" name=\"roles\">Roles</entry>\n    <entry type=\"string\" name=\"pe_sum_completion_shares\">Element list Total completion shares</entry>\n    <entry type=\"string\" name=\"pe_total_shares\">Element list Total shares</entry>\n    <entry type=\"string\" name=\"pe_used_time\">Element list Used time</entry>\n    <entry type=\"string\" name=\"pe_planned_time\">Element list Planned time</entry>\n    <entry type=\"string\" name=\"pe_replanned_time\">Element list Replanned time</entry>\n    <entry type=\"string\" name=\"pe_used_budget\">Element list Used budget</entry>\n    <entry type=\"string\" name=\"pe_planned_budget\">Element list Planned budget</entry>\n    <entry type=\"string\" name=\"pe_real_start\">Element list Real start</entry>\n    <entry type=\"string\" name=\"pe_planned_start\">Element list Planned start</entry>\n    <entry type=\"string\" name=\"pe_real_end\">Element list Real end</entry>\n    <entry type=\"string\" name=\"pe_planned_end\">Element list Planned end</entry>\n    <entry type=\"string\" name=\"pe_completion\">Element list Completion</entry>\n    <entry type=\"string\" name=\"all_custom_fields\">projectmanager</entry>\n  </entry>\n  <entry type=\"string\" name=\"delimiter\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"begin_with_fieldnames\">label</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n  <entry type=\"string\" name=\"pm_used_time\">h</entry>\n  <entry type=\"string\" name=\"pm_planned_time\">h</entry>\n  <entry type=\"string\" name=\"pm_replanned_time\">h</entry>\n  <entry type=\"string\" name=\"include_duration_unit\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(2,'export-projectmanager-elements','projectmanager','projectmanager_export_elements_csv','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"array\" name=\"mapping\">\n    <entry type=\"string\" name=\"pm_title\">Project title</entry>\n    <entry type=\"string\" name=\"pm_id\">Project ID</entry>\n    <entry type=\"string\" name=\"pe_id\">Element ID</entry>\n    <entry type=\"string\" name=\"pe_app\">Application</entry>\n    <entry type=\"string\" name=\"pe_title\">Element title</entry>\n    <entry type=\"string\" name=\"pe_completion\">Completion</entry>\n    <entry type=\"string\" name=\"pe_planned_time\">Planned time</entry>\n    <entry type=\"string\" name=\"pe_replanned_time\">Re-planned time</entry>\n    <entry type=\"string\" name=\"pe_used_time\">Time</entry>\n    <entry type=\"string\" name=\"pe_planned_budget\">Planned budget</entry>\n    <entry type=\"string\" name=\"pe_used_budget\">Used budget</entry>\n    <entry type=\"string\" name=\"pe_planned_start\">Planned start</entry>\n    <entry type=\"string\" name=\"pe_real_start\">Start date</entry>\n    <entry type=\"string\" name=\"pe_planned_end\">Planned end</entry>\n    <entry type=\"string\" name=\"pe_real_end\">End date</entry>\n    <entry type=\"string\" name=\"pe_synced\">Synced</entry>\n    <entry type=\"string\" name=\"pe_modified\">Last modified</entry>\n    <entry type=\"string\" name=\"pe_modifier\">Modified by</entry>\n    <entry type=\"string\" name=\"pe_status\">Status</entry>\n    <entry type=\"string\" name=\"pe_unitprice\">Unit price</entry>\n    <entry type=\"string\" name=\"cat_id\">Category</entry>\n    <entry type=\"string\" name=\"pe_share\">Share</entry>\n    <entry type=\"string\" name=\"pe_resources\">Resources</entry>\n    <entry type=\"string\" name=\"pe_details\">Details</entry>\n    <entry type=\"string\" name=\"pe_planned_quantity\">Planned quantity</entry>\n    <entry type=\"string\" name=\"pe_used_quantity\">Used quantity</entry>\n  </entry>\n  <entry type=\"string\" name=\"delimiter\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"begin_with_fieldnames\">label</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n  <entry type=\"string\" name=\"pe_used_time\">h</entry>\n  <entry type=\"string\" name=\"pe_planned_time\">h</entry>\n  <entry type=\"string\" name=\"pe_replanned_time\">h</entry>\n  <entry type=\"string\" name=\"include_duration_unit\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(3,'import-projectmanager','projectmanager','projectmanager_import_projects_csv','import',',-2,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"string\" name=\"fieldsep\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"num_header_lines\">1</entry>\n  <entry type=\"string\" name=\"update_cats\">add</entry>\n  <entry type=\"array\" name=\"csv_fields\">\n    <entry type=\"string\" name=\"0\">Projectid</entry>\n    <entry type=\"string\" name=\"1\">Title</entry>\n    <entry type=\"string\" name=\"2\">Projectnumber</entry>\n    <entry type=\"string\" name=\"3\">Description</entry>\n    <entry type=\"string\" name=\"4\">Owner</entry>\n    <entry type=\"string\" name=\"5\">Created</entry>\n    <entry type=\"string\" name=\"6\">Modifier</entry>\n    <entry type=\"string\" name=\"7\">Modified</entry>\n    <entry type=\"string\" name=\"8\">Planned start</entry>\n    <entry type=\"string\" name=\"9\">Planned end</entry>\n    <entry type=\"string\" name=\"10\">Real start</entry>\n    <entry type=\"string\" name=\"11\">Real end</entry>\n    <entry type=\"string\" name=\"12\">Category</entry>\n    <entry type=\"string\" name=\"13\">Access</entry>\n    <entry type=\"string\" name=\"14\">Priority</entry>\n    <entry type=\"string\" name=\"15\">Status</entry>\n    <entry type=\"string\" name=\"16\">Completion</entry>\n    <entry type=\"string\" name=\"17\">Used time</entry>\n    <entry type=\"string\" name=\"18\">Planned time</entry>\n    <entry type=\"string\" name=\"19\">Replanned time</entry>\n    <entry type=\"string\" name=\"20\">Used budget</entry>\n    <entry type=\"string\" name=\"21\">Planned budget</entry>\n    <entry type=\"string\" name=\"22\">Accounting type</entry>\n    <entry type=\"string\" name=\"23\">Roles</entry>\n    <entry type=\"string\" name=\"24\">Element list Total completion shares</entry>\n    <entry type=\"string\" name=\"25\">Element list Total shares</entry>\n    <entry type=\"string\" name=\"26\">Element list Used time</entry>\n    <entry type=\"string\" name=\"27\">Element list Planned time</entry>\n    <entry type=\"string\" name=\"28\">Element list Replanned time</entry>\n    <entry type=\"string\" name=\"29\">Element list Used budget</entry>\n    <entry type=\"string\" name=\"30\">Element list Planned budget</entry>\n    <entry type=\"string\" name=\"31\">Element list Real start</entry>\n    <entry type=\"string\" name=\"32\">Element list Planned start</entry>\n    <entry type=\"string\" name=\"33\">Element list Real end</entry>\n    <entry type=\"string\" name=\"34\">Element list Planned end</entry>\n    <entry type=\"string\" name=\"35\">Element list Completion</entry>\n    <entry type=\"string\" name=\"36\">Custom</entry>\n    <entry type=\"string\" name=\"37\">Coordinator</entry>\n    <entry type=\"string\" name=\"38\">Accounting</entry>\n    <entry type=\"string\" name=\"39\">Assistant</entry>\n    <entry type=\"string\" name=\"40\">Projectmember</entry>\n  </entry>\n  <entry type=\"array\" name=\"field_mapping\">\n    <entry type=\"string\" name=\"0\">pm_id</entry>\n    <entry type=\"string\" name=\"1\">pm_title</entry>\n    <entry type=\"string\" name=\"2\">pm_number</entry>\n    <entry type=\"string\" name=\"3\">pm_description</entry>\n    <entry type=\"string\" name=\"4\">pm_creator</entry>\n    <entry type=\"string\" name=\"5\">pm_created</entry>\n    <entry type=\"string\" name=\"6\">pm_modifier</entry>\n    <entry type=\"string\" name=\"7\">pm_modified</entry>\n    <entry type=\"string\" name=\"8\">pm_planned_start</entry>\n    <entry type=\"string\" name=\"9\">pm_planned_end</entry>\n    <entry type=\"string\" name=\"10\">pm_real_start</entry>\n    <entry type=\"string\" name=\"11\">pm_real_end</entry>\n    <entry type=\"string\" name=\"12\">cat_id</entry>\n    <entry type=\"string\" name=\"13\">pm_access</entry>\n    <entry type=\"string\" name=\"14\">pm_priority</entry>\n    <entry type=\"string\" name=\"15\">pm_status</entry>\n    <entry type=\"string\" name=\"16\">pm_completion</entry>\n    <entry type=\"string\" name=\"17\">pm_used_time</entry>\n    <entry type=\"string\" name=\"18\">pm_planned_time</entry>\n    <entry type=\"string\" name=\"19\">pm_replanned_time</entry>\n    <entry type=\"string\" name=\"20\">pm_used_budget</entry>\n    <entry type=\"string\" name=\"21\">pm_planned_budget</entry>\n    <entry type=\"string\" name=\"22\">pm_accounting_type</entry>\n  </entry>\n  <entry type=\"string\" name=\"field_conversion\"/>\n  <entry type=\"array\" name=\"conditions\">\n    <entry type=\"array\" name=\"0\">\n      <entry type=\"string\" name=\"string\">pm_id</entry>\n      <entry type=\"string\" name=\"type\">exists</entry>\n      <entry type=\"array\" name=\"true\">\n        <entry type=\"string\" name=\"action\">update</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n      <entry type=\"array\" name=\"false\">\n        <entry type=\"string\" name=\"action\">none</entry>\n        <entry type=\"string\" name=\"stop\"/>\n      </entry>\n    </entry>\n    <entry type=\"array\" name=\"1\">\n      <entry type=\"string\" name=\"string\">pm_title</entry>\n      <entry type=\"string\" name=\"type\">exists</entry>\n      <entry type=\"array\" name=\"true\">\n        <entry type=\"string\" name=\"action\">update</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n      <entry type=\"array\" name=\"false\">\n        <entry type=\"string\" name=\"action\">insert</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n    </entry>\n  </entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(4,'import-sitemgr','sitemgr','sitemgr_import_xml','import',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(5,'export-sitemgr','sitemgr','sitemgr_export_xml','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(6,'export-infolog','infolog','infolog_export_csv','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"array\" name=\"mapping\">\n    <entry type=\"string\" name=\"info_id\">Infolog ID</entry>\n    <entry type=\"string\" name=\"info_type\">Type</entry>\n    <entry type=\"string\" name=\"info_from\">Contact</entry>\n    <entry type=\"string\" name=\"info_subject\">Subject</entry>\n    <entry type=\"string\" name=\"info_des\">Description</entry>\n    <entry type=\"string\" name=\"info_addr\">Phone/Email</entry>\n    <entry type=\"string\" name=\"info_link_id\">primary link</entry>\n    <entry type=\"string\" name=\"info_cat\">Category</entry>\n    <entry type=\"string\" name=\"info_priority\">Priority</entry>\n    <entry type=\"string\" name=\"info_owner\">Owner</entry>\n    <entry type=\"string\" name=\"info_access\">Access</entry>\n    <entry type=\"string\" name=\"info_status\">Status</entry>\n    <entry type=\"string\" name=\"info_percent\">Completed</entry>\n    <entry type=\"string\" name=\"info_datecompleted\">Date completed</entry>\n    <entry type=\"string\" name=\"info_datemodified\">Last changed</entry>\n    <entry type=\"string\" name=\"info_location\">Location</entry>\n    <entry type=\"string\" name=\"info_startdate\">Start date</entry>\n    <entry type=\"string\" name=\"info_enddate\">Due date</entry>\n    <entry type=\"string\" name=\"info_responsible\">Responsible</entry>\n    <entry type=\"string\" name=\"info_cc\">Cc</entry>\n    <entry type=\"string\" name=\"info_planned_time\">planned time</entry>\n    <entry type=\"string\" name=\"info_replanned_time\">re-planned time</entry>\n    <entry type=\"string\" name=\"info_used_time\">used time</entry>\n    <entry type=\"string\" name=\"pl_id\">pricelist</entry>\n    <entry type=\"string\" name=\"info_price\">price</entry>\n    <entry type=\"string\" name=\"all_custom_fields\">infolog</entry>\n  </entry>\n  <entry type=\"string\" name=\"delimiter\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"begin_with_fieldnames\">label</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(7,'import-infolog','infolog','infolog_import_infologs_csv','import',',-2,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"string\" name=\"fieldsep\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"num_header_lines\">1</entry>\n  <entry type=\"array\" name=\"csv_fields\">\n    <entry type=\"string\" name=\"0\">Infolog ID</entry>\n    <entry type=\"string\" name=\"1\">Type</entry>\n    <entry type=\"string\" name=\"2\">Contact</entry>\n    <entry type=\"string\" name=\"3\">Subject</entry>\n    <entry type=\"string\" name=\"4\">Description</entry>\n    <entry type=\"string\" name=\"5\">Phone/Email</entry>\n    <entry type=\"string\" name=\"6\">primary link</entry>\n    <entry type=\"string\" name=\"7\">Category</entry>\n    <entry type=\"string\" name=\"8\">Priority</entry>\n    <entry type=\"string\" name=\"9\">Owner</entry>\n    <entry type=\"string\" name=\"10\">Access</entry>\n    <entry type=\"string\" name=\"11\">Status</entry>\n    <entry type=\"string\" name=\"12\">Completed</entry>\n    <entry type=\"string\" name=\"13\">Date completed</entry>\n    <entry type=\"string\" name=\"14\">Last changed</entry>\n    <entry type=\"string\" name=\"15\">Location</entry>\n    <entry type=\"string\" name=\"16\">Start date</entry>\n    <entry type=\"string\" name=\"17\">Due date</entry>\n    <entry type=\"string\" name=\"18\">Responsible</entry>\n    <entry type=\"string\" name=\"19\">Cc</entry>\n    <entry type=\"string\" name=\"20\">planned time</entry>\n    <entry type=\"string\" name=\"21\">re-planned time</entry>\n    <entry type=\"string\" name=\"22\">used time</entry>\n    <entry type=\"string\" name=\"23\">pricelist</entry>\n    <entry type=\"string\" name=\"24\">price</entry>\n  </entry>\n  <entry type=\"array\" name=\"field_mapping\">\n    <entry type=\"string\" name=\"0\">info_id</entry>\n    <entry type=\"string\" name=\"1\">info_type</entry>\n    <entry type=\"string\" name=\"2\">info_from</entry>\n    <entry type=\"string\" name=\"3\">info_subject</entry>\n    <entry type=\"string\" name=\"4\">info_des</entry>\n    <entry type=\"string\" name=\"5\">info_addr</entry>\n    <entry type=\"string\" name=\"6\">info_link_id</entry>\n    <entry type=\"string\" name=\"7\">info_cat</entry>\n    <entry type=\"string\" name=\"8\">info_priority</entry>\n    <entry type=\"string\" name=\"9\">info_owner</entry>\n    <entry type=\"string\" name=\"10\">info_access</entry>\n    <entry type=\"string\" name=\"11\">info_status</entry>\n    <entry type=\"string\" name=\"12\">info_percent</entry>\n    <entry type=\"string\" name=\"13\">info_datecompleted</entry>\n    <entry type=\"string\" name=\"14\">info_datemodified</entry>\n    <entry type=\"string\" name=\"15\">info_location</entry>\n    <entry type=\"string\" name=\"16\">info_startdate</entry>\n    <entry type=\"string\" name=\"17\">info_enddate</entry>\n    <entry type=\"string\" name=\"18\">info_responsible</entry>\n    <entry type=\"string\" name=\"19\">info_cc</entry>\n    <entry type=\"string\" name=\"20\">info_planned_time</entry>\n    <entry type=\"string\" name=\"21\">info_replanned_time</entry>\n    <entry type=\"string\" name=\"22\">info_used_time</entry>\n    <entry type=\"string\" name=\"23\">pl_id</entry>\n    <entry type=\"string\" name=\"24\">info_price</entry>\n  </entry>\n  <entry type=\"string\" name=\"field_conversion\"/>\n  <entry type=\"array\" name=\"conditions\">\n    <entry type=\"array\" name=\"0\">\n      <entry type=\"string\" name=\"string\">info_id</entry>\n      <entry type=\"string\" name=\"type\">exists</entry>\n      <entry type=\"array\" name=\"true\">\n        <entry type=\"string\" name=\"action\">update</entry>\n      </entry>\n      <entry type=\"array\" name=\"false\">\n        <entry type=\"string\" name=\"action\">insert</entry>\n      </entry>\n    </entry>\n  </entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(8,'export-resources','resources','resources_export_csv','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"array\" name=\"mapping\">\n    <entry type=\"string\" name=\"res_id\">Resource ID</entry>\n    <entry type=\"string\" name=\"name\">Name</entry>\n    <entry type=\"string\" name=\"short_description\">Short description</entry>\n    <entry type=\"string\" name=\"cat_id\">Category</entry>\n    <entry type=\"string\" name=\"quantity\">Quantity</entry>\n    <entry type=\"string\" name=\"useable\">Useable</entry>\n    <entry type=\"string\" name=\"location\">Location</entry>\n    <entry type=\"string\" name=\"storage_info\">Storage</entry>\n    <entry type=\"string\" name=\"bookable\">Bookable</entry>\n    <entry type=\"string\" name=\"long_description\">Long description</entry>\n    <entry type=\"string\" name=\"inventory_number\">Inventory number</entry>\n    <entry type=\"string\" name=\"accessory_of\">Accessory of</entry>\n    <entry type=\"string\" name=\"all_custom_fields\">resources</entry>\n  </entry>\n  <entry type=\"string\" name=\"delimiter\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"begin_with_fieldnames\">label</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(9,'import-resources','resources','resources_import_csv','import',',-2,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"string\" name=\"fieldsep\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"num_header_lines\">1</entry>\n  <entry type=\"string\" name=\"update_cats\">add</entry>\n  <entry type=\"array\" name=\"csv_fields\">\n    <entry type=\"string\" name=\"0\">Resource ID</entry>\n    <entry type=\"string\" name=\"1\">Name</entry>\n    <entry type=\"string\" name=\"2\">Short description</entry>\n    <entry type=\"string\" name=\"3\">Category</entry>\n    <entry type=\"string\" name=\"4\">Quantity</entry>\n    <entry type=\"string\" name=\"5\">Useable</entry>\n    <entry type=\"string\" name=\"6\">Location</entry>\n    <entry type=\"string\" name=\"7\">Storage</entry>\n    <entry type=\"string\" name=\"8\">Bookable</entry>\n    <entry type=\"string\" name=\"9\">Long description</entry>\n    <entry type=\"string\" name=\"10\">Inventory number</entry>\n    <entry type=\"string\" name=\"11\">Accessory of</entry>\n  </entry>\n  <entry type=\"array\" name=\"field_mapping\">\n    <entry type=\"string\" name=\"0\">res_id</entry>\n    <entry type=\"string\" name=\"1\">name</entry>\n    <entry type=\"string\" name=\"2\">short_description</entry>\n    <entry type=\"string\" name=\"3\">cat_id</entry>\n    <entry type=\"string\" name=\"4\">quantity</entry>\n    <entry type=\"string\" name=\"5\">useable</entry>\n    <entry type=\"string\" name=\"6\">location</entry>\n    <entry type=\"string\" name=\"7\">storage_info</entry>\n    <entry type=\"string\" name=\"8\">bookable</entry>\n    <entry type=\"string\" name=\"9\">long_description</entry>\n    <entry type=\"string\" name=\"10\">inventory_number</entry>\n    <entry type=\"string\" name=\"11\">accessory_of</entry>\n  </entry>\n  <entry type=\"string\" name=\"field_conversion\"/>\n  <entry type=\"array\" name=\"conditions\">\n    <entry type=\"array\" name=\"0\">\n      <entry type=\"string\" name=\"string\">res_id</entry>\n      <entry type=\"string\" name=\"type\">exists</entry>\n      <entry type=\"array\" name=\"true\">\n        <entry type=\"string\" name=\"action\">update</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n      <entry type=\"array\" name=\"false\">\n        <entry type=\"string\" name=\"action\">insert</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n    </entry>\n  </entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(10,'export-tracker','tracker','tracker_export_csv','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"array\" name=\"mapping\">\n    <entry type=\"string\" name=\"tr_id\">Tracker ID</entry>\n    <entry type=\"string\" name=\"tr_summary\">Summary</entry>\n    <entry type=\"string\" name=\"tr_tracker\">Queue</entry>\n    <entry type=\"string\" name=\"cat_id\">Category</entry>\n    <entry type=\"string\" name=\"tr_version\">Version</entry>\n    <entry type=\"string\" name=\"tr_status\">Status</entry>\n    <entry type=\"string\" name=\"tr_description\">Description</entry>\n    <entry type=\"string\" name=\"replies\">Comments</entry>\n    <entry type=\"string\" name=\"tr_assigned\">Assigned to</entry>\n    <entry type=\"string\" name=\"tr_private\">Private</entry>\n    <entry type=\"string\" name=\"tr_resolution\">Resolution</entry>\n    <entry type=\"string\" name=\"tr_completion\">Completed</entry>\n    <entry type=\"string\" name=\"tr_priority\">Priority</entry>\n    <entry type=\"string\" name=\"tr_closed\">Closed</entry>\n    <entry type=\"string\" name=\"tr_creator\">Created by</entry>\n    <entry type=\"string\" name=\"tr_modifier\">Modified by</entry>\n    <entry type=\"string\" name=\"tr_modified\">Last Modified</entry>\n    <entry type=\"string\" name=\"tr_created\">Created</entry>\n    <entry type=\"string\" name=\"tr_votes\">Votes</entry>\n    <entry type=\"string\" name=\"bounties\">Bounty</entry>\n    <entry type=\"string\" name=\"tr_group\">Group</entry>\n    <entry type=\"string\" name=\"tr_cc\">CC</entry>\n    <entry type=\"string\" name=\"num_replies\">Number of replies</entry>\n    <entry type=\"string\" name=\"all_custom_fields\">tracker</entry>\n  </entry>\n  <entry type=\"string\" name=\"delimiter\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"begin_with_fieldnames\">label</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(11,'import-tracker','tracker','tracker_import_csv','import',',-2,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"string\" name=\"fieldsep\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"num_header_lines\">1</entry>\n  <entry type=\"string\" name=\"update_cats\">replace</entry>\n  <entry type=\"array\" name=\"csv_fields\">\n    <entry type=\"string\" name=\"0\">Tracker ID</entry>\n    <entry type=\"string\" name=\"1\">Summary</entry>\n    <entry type=\"string\" name=\"2\">Queue</entry>\n    <entry type=\"string\" name=\"3\">Category</entry>\n    <entry type=\"string\" name=\"4\">Version</entry>\n    <entry type=\"string\" name=\"5\">Status</entry>\n    <entry type=\"string\" name=\"6\">Description</entry>\n    <entry type=\"string\" name=\"7\">Comments</entry>\n    <entry type=\"string\" name=\"8\">Assigned to</entry>\n    <entry type=\"string\" name=\"9\">Private</entry>\n    <entry type=\"string\" name=\"10\">Resolution</entry>\n    <entry type=\"string\" name=\"11\">Completed</entry>\n    <entry type=\"string\" name=\"12\">Priority</entry>\n    <entry type=\"string\" name=\"13\">Closed</entry>\n    <entry type=\"string\" name=\"14\">Created by</entry>\n    <entry type=\"string\" name=\"15\">Modified by</entry>\n    <entry type=\"string\" name=\"16\">Last Modified</entry>\n    <entry type=\"string\" name=\"17\">Created</entry>\n    <entry type=\"string\" name=\"18\">Votes</entry>\n    <entry type=\"string\" name=\"19\">Bounty</entry>\n    <entry type=\"string\" name=\"20\">Group</entry>\n    <entry type=\"string\" name=\"21\">CC</entry>\n    <entry type=\"string\" name=\"22\">Number of replies</entry>\n  </entry>\n  <entry type=\"array\" name=\"field_mapping\">\n    <entry type=\"string\" name=\"0\">tr_id</entry>\n    <entry type=\"string\" name=\"1\">tr_summary</entry>\n    <entry type=\"string\" name=\"2\">tr_tracker</entry>\n    <entry type=\"string\" name=\"3\">cat_id</entry>\n    <entry type=\"string\" name=\"4\">tr_version</entry>\n    <entry type=\"string\" name=\"5\">tr_status</entry>\n    <entry type=\"string\" name=\"6\">tr_description</entry>\n    <entry type=\"string\" name=\"7\">replies</entry>\n    <entry type=\"string\" name=\"8\">tr_assigned</entry>\n    <entry type=\"string\" name=\"9\">tr_private</entry>\n    <entry type=\"string\" name=\"10\">tr_resolution</entry>\n    <entry type=\"string\" name=\"11\">tr_completion</entry>\n    <entry type=\"string\" name=\"12\">tr_priority</entry>\n    <entry type=\"string\" name=\"13\">tr_closed</entry>\n    <entry type=\"string\" name=\"14\">tr_creator</entry>\n    <entry type=\"string\" name=\"17\">tr_created</entry>\n    <entry type=\"string\" name=\"20\">tr_group</entry>\n    <entry type=\"string\" name=\"21\">tr_cc</entry>\n    <entry type=\"string\" name=\"22\">num_replies</entry>\n  </entry>\n  <entry type=\"array\" name=\"conditions\">\n    <entry type=\"array\" name=\"0\">\n      <entry type=\"string\" name=\"string\">tr_id</entry>\n      <entry type=\"string\" name=\"type\">exists</entry>\n      <entry type=\"array\" name=\"true\">\n        <entry type=\"string\" name=\"action\">update</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n      <entry type=\"array\" name=\"false\">\n        <entry type=\"string\" name=\"action\">insert</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n    </entry>\n  </entry>\n  <entry type=\"string\" name=\"owner_from_csv\">1</entry>\n  <entry type=\"string\" name=\"change_owner\">0</entry>\n  <entry type=\"string\" name=\"message\">Import options</entry>\n  <entry type=\"string\" name=\"translate_tracker\">add</entry>\n  <entry type=\"string\" name=\"translate_version\">add~</entry>\n  <entry type=\"string\" name=\"translate_status\">add~</entry>\n  <entry type=\"string\" name=\"translate_resolution\">add~</entry>\n  <entry type=\"string\" name=\"translate_cat_id\">add~</entry>\n  <entry type=\"string\" name=\"creator\"/>\n  <entry type=\"string\" name=\"creator_from_csv\">1</entry>\n  <entry type=\"string\" name=\"group_from_csv\">1</entry>\n  <entry type=\"string\" name=\"assigned_from_csv\">1</entry>\n  <entry type=\"string\" name=\"change_creator\"/>\n  <entry type=\"string\" name=\"convert\">1</entry>\n  <entry type=\"boolean\" name=\"no_cats\">TRUE</entry>\n  <entry type=\"string\" name=\"field_conversion\"/>\n  <entry type=\"string\" name=\"record_owner\"/>\n  <entry type=\"string\" name=\"record_group\">-1</entry>\n  <entry type=\"string\" name=\"change_group\">0</entry>\n  <entry type=\"string\" name=\"change_assigned\">0</entry>\n  <entry type=\"string\" name=\"record_assigned\"/>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(12,'export-calendar-csv','calendar','calendar_export_csv','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"array\" name=\"mapping\">\n    <entry type=\"string\" name=\"owner\">owner</entry>\n    <entry type=\"string\" name=\"category\">category</entry>\n    <entry type=\"string\" name=\"priority\">priority</entry>\n    <entry type=\"string\" name=\"public\">public</entry>\n    <entry type=\"string\" name=\"title\">title</entry>\n    <entry type=\"string\" name=\"description\">description</entry>\n    <entry type=\"string\" name=\"location\">location</entry>\n    <entry type=\"string\" name=\"reference\">reference</entry>\n    <entry type=\"string\" name=\"modifier\">modifier</entry>\n    <entry type=\"string\" name=\"non_blocking\">non blocking</entry>\n    <entry type=\"string\" name=\"special\">special</entry>\n    <entry type=\"string\" name=\"creator\">creator</entry>\n    <entry type=\"string\" name=\"recurrence\">recurrence</entry>\n    <entry type=\"string\" name=\"tz_id\">tz_id</entry>\n    <entry type=\"string\" name=\"start\">start</entry>\n    <entry type=\"string\" name=\"end\">end</entry>\n    <entry type=\"string\" name=\"participants\">Participants: User, Status, Role</entry>\n    <entry type=\"string\" name=\"participants-c\">Participants: User, Status, Quantity, Role</entry>\n    <entry type=\"string\" name=\"all_custom_fields\">calendar</entry>\n  </entry>\n  <entry type=\"string\" name=\"delimiter\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"begin_with_fieldnames\">label</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(13,'import-calendar-ical','calendar','calendar_import_ical','import',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(14,'export-calendar-ical','calendar','calendar_export_ical','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(15,'import-addressbook-vcard','addressbook','addressbook_import_vcard','import',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"contact_owner\">personal</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(16,'export-addressbook-vcard','addressbook','addressbook_export_vcard','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"string\" name=\"charset\">user</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(17,'import-addressbook-csv','addressbook','addressbook_import_contacts_csv','import',',-2,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"string\" name=\"fieldsep\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"num_header_lines\">1</entry>\n  <entry type=\"string\" name=\"update_cats\">add</entry>\n  <entry type=\"array\" name=\"csv_fields\">\n    <entry type=\"string\" name=\"0\">Contact ID</entry>\n    <entry type=\"string\" name=\"1\">Type</entry>\n    <entry type=\"string\" name=\"2\">Address Book</entry>\n    <entry type=\"string\" name=\"3\">Private</entry>\n    <entry type=\"string\" name=\"4\">Category</entry>\n    <entry type=\"string\" name=\"5\">Prefix</entry>\n    <entry type=\"string\" name=\"6\">First name</entry>\n    <entry type=\"string\" name=\"7\">Middle name</entry>\n    <entry type=\"string\" name=\"8\">Last name</entry>\n    <entry type=\"string\" name=\"9\">Suffix</entry>\n    <entry type=\"string\" name=\"10\">Full name</entry>\n    <entry type=\"string\" name=\"11\">Own sorting</entry>\n    <entry type=\"string\" name=\"12\">Birthday</entry>\n    <entry type=\"string\" name=\"13\">Organisation</entry>\n    <entry type=\"string\" name=\"14\">Department</entry>\n    <entry type=\"string\" name=\"15\">Job title</entry>\n    <entry type=\"string\" name=\"16\">Occupation</entry>\n    <entry type=\"string\" name=\"17\">Assistent</entry>\n    <entry type=\"string\" name=\"18\">Room</entry>\n    <entry type=\"string\" name=\"19\">Business street</entry>\n    <entry type=\"string\" name=\"20\">Business address line 2</entry>\n    <entry type=\"string\" name=\"21\">Business city</entry>\n    <entry type=\"string\" name=\"22\">Business state</entry>\n    <entry type=\"string\" name=\"23\">Business postal code</entry>\n    <entry type=\"string\" name=\"24\">Business country</entry>\n    <entry type=\"string\" name=\"25\">Business country code</entry>\n    <entry type=\"string\" name=\"26\">Label</entry>\n    <entry type=\"string\" name=\"27\">Street (private)</entry>\n    <entry type=\"string\" name=\"28\">Address line 2 (private)</entry>\n    <entry type=\"string\" name=\"29\">City (private)</entry>\n    <entry type=\"string\" name=\"30\">State (private)</entry>\n    <entry type=\"string\" name=\"31\">ZIP code (private)</entry>\n    <entry type=\"string\" name=\"32\">Country (private)</entry>\n    <entry type=\"string\" name=\"33\">Country code (private)</entry>\n    <entry type=\"string\" name=\"34\">Work phone</entry>\n    <entry type=\"string\" name=\"35\">Mobile phone</entry>\n    <entry type=\"string\" name=\"36\">Business fax</entry>\n    <entry type=\"string\" name=\"37\">Assistent phone</entry>\n    <entry type=\"string\" name=\"38\">Car phone</entry>\n    <entry type=\"string\" name=\"39\">Pager</entry>\n    <entry type=\"string\" name=\"40\">Home phone</entry>\n    <entry type=\"string\" name=\"41\">fax (private)</entry>\n    <entry type=\"string\" name=\"42\">mobile phone (private)</entry>\n    <entry type=\"string\" name=\"43\">Other phone</entry>\n    <entry type=\"string\" name=\"44\">Preferred phone</entry>\n    <entry type=\"string\" name=\"45\">Business email</entry>\n    <entry type=\"string\" name=\"46\">email (private)</entry>\n    <entry type=\"string\" name=\"47\">url (business)</entry>\n    <entry type=\"string\" name=\"48\">url (private)</entry>\n    <entry type=\"string\" name=\"49\">FreeBusy URI</entry>\n    <entry type=\"string\" name=\"50\">Calendar URI</entry>\n    <entry type=\"string\" name=\"51\">Note</entry>\n    <entry type=\"string\" name=\"52\">Time zone</entry>\n    <entry type=\"string\" name=\"53\">GEO</entry>\n    <entry type=\"string\" name=\"54\">Public key</entry>\n    <entry type=\"string\" name=\"55\">Created</entry>\n    <entry type=\"string\" name=\"56\">Created by</entry>\n    <entry type=\"string\" name=\"57\">Last modified</entry>\n    <entry type=\"string\" name=\"58\">Last modified by</entry>\n    <entry type=\"string\" name=\"59\">Account ID</entry>\n  </entry>\n  <entry type=\"array\" name=\"field_mapping\">\n    <entry type=\"string\" name=\"0\">id</entry>\n    <entry type=\"string\" name=\"1\">tid</entry>\n    <entry type=\"string\" name=\"2\">owner</entry>\n    <entry type=\"string\" name=\"3\">private</entry>\n    <entry type=\"string\" name=\"4\">cat_id</entry>\n    <entry type=\"string\" name=\"5\">n_prefix</entry>\n    <entry type=\"string\" name=\"6\">n_given</entry>\n    <entry type=\"string\" name=\"7\">n_middle</entry>\n    <entry type=\"string\" name=\"8\">n_family</entry>\n    <entry type=\"string\" name=\"9\">n_suffix</entry>\n    <entry type=\"string\" name=\"10\">n_fn</entry>\n    <entry type=\"string\" name=\"11\">n_fileas</entry>\n    <entry type=\"string\" name=\"12\">bday</entry>\n    <entry type=\"string\" name=\"13\">org_name</entry>\n    <entry type=\"string\" name=\"14\">org_unit</entry>\n    <entry type=\"string\" name=\"15\">title</entry>\n    <entry type=\"string\" name=\"16\">role</entry>\n    <entry type=\"string\" name=\"17\">assistent</entry>\n    <entry type=\"string\" name=\"18\">room</entry>\n    <entry type=\"string\" name=\"19\">adr_one_street</entry>\n    <entry type=\"string\" name=\"20\">adr_one_street2</entry>\n    <entry type=\"string\" name=\"21\">adr_one_locality</entry>\n    <entry type=\"string\" name=\"22\">adr_one_region</entry>\n    <entry type=\"string\" name=\"23\">adr_one_postalcode</entry>\n    <entry type=\"string\" name=\"24\">adr_one_countryname</entry>\n    <entry type=\"string\" name=\"25\">adr_one_countrycode</entry>\n    <entry type=\"string\" name=\"26\">label</entry>\n    <entry type=\"string\" name=\"27\">adr_two_street</entry>\n    <entry type=\"string\" name=\"28\">adr_two_street2</entry>\n    <entry type=\"string\" name=\"29\">adr_two_locality</entry>\n    <entry type=\"string\" name=\"30\">adr_two_region</entry>\n    <entry type=\"string\" name=\"31\">adr_two_postalcode</entry>\n    <entry type=\"string\" name=\"32\">adr_two_countryname</entry>\n    <entry type=\"string\" name=\"33\">adr_two_countrycode</entry>\n    <entry type=\"string\" name=\"34\">tel_work</entry>\n    <entry type=\"string\" name=\"35\">tel_cell</entry>\n    <entry type=\"string\" name=\"36\">tel_fax</entry>\n    <entry type=\"string\" name=\"37\">tel_assistent</entry>\n    <entry type=\"string\" name=\"38\">tel_car</entry>\n    <entry type=\"string\" name=\"39\">tel_pager</entry>\n    <entry type=\"string\" name=\"40\">tel_home</entry>\n    <entry type=\"string\" name=\"41\">tel_fax_home</entry>\n    <entry type=\"string\" name=\"42\">tel_cell_private</entry>\n    <entry type=\"string\" name=\"43\">tel_other</entry>\n    <entry type=\"string\" name=\"44\">tel_prefer</entry>\n    <entry type=\"string\" name=\"45\">email</entry>\n    <entry type=\"string\" name=\"46\">email_home</entry>\n    <entry type=\"string\" name=\"47\">url</entry>\n    <entry type=\"string\" name=\"48\">url_home</entry>\n    <entry type=\"string\" name=\"49\">freebusy_uri</entry>\n    <entry type=\"string\" name=\"50\">calendar_uri</entry>\n    <entry type=\"string\" name=\"51\">note</entry>\n    <entry type=\"string\" name=\"52\">tz</entry>\n    <entry type=\"string\" name=\"53\">geo</entry>\n    <entry type=\"string\" name=\"54\">pubkey</entry>\n    <entry type=\"string\" name=\"55\">created</entry>\n    <entry type=\"string\" name=\"56\">creator</entry>\n    <entry type=\"string\" name=\"57\">modified</entry>\n    <entry type=\"string\" name=\"58\">modifier</entry>\n    <entry type=\"string\" name=\"59\">account_id</entry>\n  </entry>\n  <entry type=\"string\" name=\"field_conversion\"/>\n  <entry type=\"array\" name=\"conditions\">\n    <entry type=\"array\" name=\"0\">\n      <entry type=\"string\" name=\"string\">id</entry>\n      <entry type=\"string\" name=\"type\">exists</entry>\n      <entry type=\"array\" name=\"true\">\n        <entry type=\"string\" name=\"action\">update</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n      <entry type=\"array\" name=\"false\">\n        <entry type=\"string\" name=\"action\">insert</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n    </entry>\n  </entry>\n  <entry type=\"string\" name=\"owner_from_csv\">1</entry>\n  <entry type=\"string\" name=\"contact_owner\">personal</entry>\n  <entry type=\"string\" name=\"change_owner\">0</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(18,'export-addressbook-csv','addressbook','addressbook_export_contacts_csv','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"array\" name=\"mapping\">\n    <entry type=\"string\" name=\"id\">Contact ID</entry>\n    <entry type=\"string\" name=\"tid\">Type</entry>\n    <entry type=\"string\" name=\"owner\">Address Book</entry>\n    <entry type=\"string\" name=\"private\">Private</entry>\n    <entry type=\"string\" name=\"cat_id\">Category</entry>\n    <entry type=\"string\" name=\"n_prefix\">Prefix</entry>\n    <entry type=\"string\" name=\"n_given\">First name</entry>\n    <entry type=\"string\" name=\"n_middle\">Middle name</entry>\n    <entry type=\"string\" name=\"n_family\">Last name</entry>\n    <entry type=\"string\" name=\"n_suffix\">Suffix</entry>\n    <entry type=\"string\" name=\"n_fn\">Full name</entry>\n    <entry type=\"string\" name=\"n_fileas\">Own sorting</entry>\n    <entry type=\"string\" name=\"bday\">Birthday</entry>\n    <entry type=\"string\" name=\"org_name\">Organisation</entry>\n    <entry type=\"string\" name=\"org_unit\">Department</entry>\n    <entry type=\"string\" name=\"title\">Job title</entry>\n    <entry type=\"string\" name=\"role\">Occupation</entry>\n    <entry type=\"string\" name=\"assistent\">Assistent</entry>\n    <entry type=\"string\" name=\"room\">Room</entry>\n    <entry type=\"string\" name=\"adr_one_street\">Business street</entry>\n    <entry type=\"string\" name=\"adr_one_street2\">Business address line 2</entry>\n    <entry type=\"string\" name=\"adr_one_locality\">Business city</entry>\n    <entry type=\"string\" name=\"adr_one_region\">Business state</entry>\n    <entry type=\"string\" name=\"adr_one_postalcode\">Business postal code</entry>\n    <entry type=\"string\" name=\"adr_one_countryname\">Business country</entry>\n    <entry type=\"string\" name=\"adr_one_countrycode\">Business country code</entry>\n    <entry type=\"string\" name=\"label\">Label</entry>\n    <entry type=\"string\" name=\"adr_two_street\">Street (private)</entry>\n    <entry type=\"string\" name=\"adr_two_street2\">Address line 2 (private)</entry>\n    <entry type=\"string\" name=\"adr_two_locality\">City (private)</entry>\n    <entry type=\"string\" name=\"adr_two_region\">State (private)</entry>\n    <entry type=\"string\" name=\"adr_two_postalcode\">ZIP code (private)</entry>\n    <entry type=\"string\" name=\"adr_two_countryname\">Country (private)</entry>\n    <entry type=\"string\" name=\"adr_two_countrycode\">Country code (private)</entry>\n    <entry type=\"string\" name=\"tel_work\">Work phone</entry>\n    <entry type=\"string\" name=\"tel_cell\">Mobile phone</entry>\n    <entry type=\"string\" name=\"tel_fax\">Business fax</entry>\n    <entry type=\"string\" name=\"tel_assistent\">Assistent phone</entry>\n    <entry type=\"string\" name=\"tel_car\">Car phone</entry>\n    <entry type=\"string\" name=\"tel_pager\">Pager</entry>\n    <entry type=\"string\" name=\"tel_home\">Home phone</entry>\n    <entry type=\"string\" name=\"tel_fax_home\">fax (private)*</entry>\n    <entry type=\"string\" name=\"tel_cell_private\">mobile phone (private)*</entry>\n    <entry type=\"string\" name=\"tel_other\">Other phone</entry>\n    <entry type=\"string\" name=\"tel_prefer\">Preferred phone</entry>\n    <entry type=\"string\" name=\"email\">Business email</entry>\n    <entry type=\"string\" name=\"email_home\">email (private)*</entry>\n    <entry type=\"string\" name=\"url\">url (business)*</entry>\n    <entry type=\"string\" name=\"url_home\">url (private)*</entry>\n    <entry type=\"string\" name=\"freebusy_uri\">FreeBusy URI</entry>\n    <entry type=\"string\" name=\"calendar_uri\">Calendar URI</entry>\n    <entry type=\"string\" name=\"note\">Note</entry>\n    <entry type=\"string\" name=\"tz\">Time zone</entry>\n    <entry type=\"string\" name=\"geo\">GEO</entry>\n    <entry type=\"string\" name=\"pubkey\">Public key</entry>\n    <entry type=\"string\" name=\"created\">Created</entry>\n    <entry type=\"string\" name=\"creator\">Created by</entry>\n    <entry type=\"string\" name=\"modified\">Last modified</entry>\n    <entry type=\"string\" name=\"modifier\">Last modified by</entry>\n    <entry type=\"string\" name=\"account_id\">Account ID</entry>\n    <entry type=\"string\" name=\"all_custom_fields\">addressbook</entry>\n  </entry>\n  <entry type=\"string\" name=\"delimiter\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"begin_with_fieldnames\">label</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n  <entry type=\"string\" name=\"explode_multiselects\"/>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(19,'export-timesheet','timesheet','timesheet_export_csv','export',',-1,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"array\" name=\"mapping\">\n    <entry type=\"string\" name=\"ts_id\">Timesheet ID</entry>\n    <entry type=\"string\" name=\"ts_project\">Project</entry>\n    <entry type=\"string\" name=\"ts_title\">Title</entry>\n    <entry type=\"string\" name=\"cat_id\">Category</entry>\n    <entry type=\"string\" name=\"ts_description\">Description</entry>\n    <entry type=\"string\" name=\"ts_start\">Start</entry>\n    <entry type=\"string\" name=\"ts_duration\">Duration</entry>\n    <entry type=\"string\" name=\"ts_quantity\">Quantity</entry>\n    <entry type=\"string\" name=\"ts_unitprice\">Unitprice</entry>\n    <entry type=\"string\" name=\"ts_owner\">Owner</entry>\n    <entry type=\"string\" name=\"ts_modifier\">Modifier</entry>\n    <entry type=\"string\" name=\"ts_status\">Status</entry>\n    <entry type=\"string\" name=\"pm_id\">Projectid</entry>\n    <entry type=\"string\" name=\"all_custom_fields\">timesheet</entry>\n  </entry>\n  <entry type=\"string\" name=\"delimiter\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"begin_with_fieldnames\">label</entry>\n  <entry type=\"string\" name=\"convert\">1</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n'),(20,'import-timesheet','timesheet','timesheet_import_csv','import',',-2,','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\">\n  <entry type=\"string\" name=\"fieldsep\">;</entry>\n  <entry type=\"string\" name=\"charset\">user</entry>\n  <entry type=\"string\" name=\"num_header_lines\">1</entry>\n  <entry type=\"string\" name=\"update_cats\">add</entry>\n  <entry type=\"array\" name=\"csv_fields\">\n    <entry type=\"string\" name=\"0\">Timesheet ID</entry>\n    <entry type=\"string\" name=\"1\">Project</entry>\n    <entry type=\"string\" name=\"2\">Title</entry>\n    <entry type=\"string\" name=\"3\">Category</entry>\n    <entry type=\"string\" name=\"4\">Description</entry>\n    <entry type=\"string\" name=\"5\">Start</entry>\n    <entry type=\"string\" name=\"6\">Duration</entry>\n    <entry type=\"string\" name=\"7\">Quantity</entry>\n    <entry type=\"string\" name=\"8\">Unitprice</entry>\n    <entry type=\"string\" name=\"9\">Owner</entry>\n    <entry type=\"string\" name=\"10\">Modifier</entry>\n    <entry type=\"string\" name=\"11\">Status</entry>\n    <entry type=\"string\" name=\"12\">Projectid</entry>\n  </entry>\n  <entry type=\"array\" name=\"field_mapping\">\n    <entry type=\"string\" name=\"0\">ts_id</entry>\n    <entry type=\"string\" name=\"1\">ts_project</entry>\n    <entry type=\"string\" name=\"2\">ts_title</entry>\n    <entry type=\"string\" name=\"3\">cat_id</entry>\n    <entry type=\"string\" name=\"4\">ts_description</entry>\n    <entry type=\"string\" name=\"5\">ts_start</entry>\n    <entry type=\"string\" name=\"6\">ts_duration</entry>\n    <entry type=\"string\" name=\"7\">ts_quantity</entry>\n    <entry type=\"string\" name=\"8\">ts_unitprice</entry>\n    <entry type=\"string\" name=\"9\">ts_owner</entry>\n    <entry type=\"string\" name=\"10\">ts_modifier</entry>\n    <entry type=\"string\" name=\"11\">ts_status</entry>\n    <entry type=\"string\" name=\"12\">pm_id</entry>\n  </entry>\n  <entry type=\"string\" name=\"field_conversion\"/>\n  <entry type=\"array\" name=\"conditions\">\n    <entry type=\"array\" name=\"0\">\n      <entry type=\"string\" name=\"string\">ts_id</entry>\n      <entry type=\"string\" name=\"type\">exists</entry>\n      <entry type=\"array\" name=\"true\">\n        <entry type=\"string\" name=\"action\">update</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n      <entry type=\"array\" name=\"false\">\n        <entry type=\"string\" name=\"action\">insert</entry>\n        <entry type=\"string\" name=\"stop\">1</entry>\n      </entry>\n    </entry>\n  </entry>\n  <entry type=\"string\" name=\"change_owner\">0</entry>\n  <entry type=\"string\" name=\"owner_from_csv\">1</entry>\n  <entry type=\"string\" name=\"creator\"/>\n  <entry type=\"string\" name=\"creator_from_csv\"/>\n  <entry type=\"string\" name=\"change_creator\"/>\n  <entry type=\"string\" name=\"convert\">1</entry>\n  <entry type=\"boolean\" name=\"no_cats\">TRUE</entry>\n  <entry type=\"string\" name=\"message\">Import options</entry>\n  <entry type=\"string\" name=\"translate_status\">0</entry>\n  <entry type=\"string\" name=\"translate_cat_id\">0</entry>\n</entry>\n',NULL,NULL,'2014-09-06 18:46:49','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<entry type=\"array\" name=\"root\"/>\n');
/*!40000 ALTER TABLE `egw_importexport_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_index`
--

DROP TABLE IF EXISTS `egw_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_index` (
  `si_app` varchar(25) NOT NULL,
  `si_app_id` varchar(50) NOT NULL,
  `si_id` int(11) NOT NULL,
  `si_owner` int(11) NOT NULL,
  PRIMARY KEY (`si_app`,`si_app_id`,`si_id`),
  KEY `egw_index_si_id` (`si_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_index`
--

LOCK TABLES `egw_index` WRITE;
/*!40000 ALTER TABLE `egw_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_index_keywords`
--

DROP TABLE IF EXISTS `egw_index_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_index_keywords` (
  `si_id` int(11) NOT NULL AUTO_INCREMENT,
  `si_keyword` varchar(64) NOT NULL,
  `si_ignore` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`si_id`),
  UNIQUE KEY `egw_index_keywords_si_keyword` (`si_keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_index_keywords`
--

LOCK TABLES `egw_index_keywords` WRITE;
/*!40000 ALTER TABLE `egw_index_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_index_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_infolog`
--

DROP TABLE IF EXISTS `egw_infolog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_infolog` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_type` varchar(40) NOT NULL DEFAULT 'task',
  `info_from` varchar(255) DEFAULT NULL,
  `info_addr` varchar(255) DEFAULT NULL,
  `info_subject` varchar(255) DEFAULT NULL,
  `info_des` text,
  `info_owner` int(11) NOT NULL,
  `info_responsible` varchar(255) NOT NULL DEFAULT '0',
  `info_access` varchar(10) DEFAULT 'public',
  `info_cat` int(11) NOT NULL DEFAULT '0',
  `info_datemodified` bigint(20) NOT NULL,
  `info_startdate` bigint(20) NOT NULL DEFAULT '0',
  `info_enddate` bigint(20) NOT NULL DEFAULT '0',
  `info_id_parent` int(11) NOT NULL DEFAULT '0',
  `info_planned_time` int(11) NOT NULL DEFAULT '0',
  `info_replanned_time` int(11) NOT NULL DEFAULT '0',
  `info_used_time` int(11) NOT NULL DEFAULT '0',
  `info_status` varchar(40) DEFAULT 'done',
  `info_confirm` varchar(10) DEFAULT 'not',
  `info_modifier` int(11) NOT NULL DEFAULT '0',
  `info_link_id` int(11) NOT NULL DEFAULT '0',
  `info_priority` smallint(6) DEFAULT '1',
  `pl_id` int(11) DEFAULT NULL,
  `info_price` double DEFAULT NULL,
  `info_percent` smallint(6) DEFAULT '0',
  `info_datecompleted` bigint(20) DEFAULT NULL,
  `info_location` varchar(255) DEFAULT NULL,
  `info_custom_from` tinyint(4) DEFAULT NULL,
  `info_uid` varchar(255) DEFAULT NULL,
  `info_cc` varchar(255) DEFAULT NULL,
  `caldav_name` varchar(200) DEFAULT NULL,
  `info_etag` int(11) DEFAULT '0',
  `info_created` bigint(20) DEFAULT NULL,
  `info_creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`info_id`),
  KEY `egw_infolog_caldav_name` (`caldav_name`),
  KEY `egw_infolog_owner_responsible_status_startdate` (`info_owner`,`info_responsible`,`info_status`,`info_startdate`),
  KEY `egw_infolog_id_parent_owner_responsible_status_startdate` (`info_id_parent`,`info_owner`,`info_responsible`,`info_status`,`info_startdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_infolog`
--

LOCK TABLES `egw_infolog` WRITE;
/*!40000 ALTER TABLE `egw_infolog` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_infolog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_infolog_extra`
--

DROP TABLE IF EXISTS `egw_infolog_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_infolog_extra` (
  `info_id` int(11) NOT NULL,
  `info_extra_name` varchar(64) NOT NULL,
  `info_extra_value` text,
  PRIMARY KEY (`info_id`,`info_extra_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_infolog_extra`
--

LOCK TABLES `egw_infolog_extra` WRITE;
/*!40000 ALTER TABLE `egw_infolog_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_infolog_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_kb_articles`
--

DROP TABLE IF EXISTS `egw_kb_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_kb_articles` (
  `art_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `text` longtext,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `created` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  `modified_user_id` int(11) NOT NULL,
  `votes_1` int(11) NOT NULL,
  `votes_2` int(11) NOT NULL,
  `votes_3` int(11) NOT NULL,
  `votes_4` int(11) NOT NULL,
  `votes_5` int(11) NOT NULL,
  PRIMARY KEY (`art_id`),
  KEY `egw_kb_articles_cat_id` (`cat_id`),
  KEY `egw_kb_articles_art_id_cat_id` (`art_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_kb_articles`
--

LOCK TABLES `egw_kb_articles` WRITE;
/*!40000 ALTER TABLE `egw_kb_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_kb_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_kb_comment`
--

DROP TABLE IF EXISTS `egw_kb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_kb_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `kb_comment` text,
  `entered` int(11) DEFAULT NULL,
  `art_id` int(11) NOT NULL,
  `published` smallint(6) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `egw_kb_comment_art_id` (`art_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_kb_comment`
--

LOCK TABLES `egw_kb_comment` WRITE;
/*!40000 ALTER TABLE `egw_kb_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_kb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_kb_questions`
--

DROP TABLE IF EXISTS `egw_kb_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_kb_questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `summary` text,
  `details` text,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `creation` int(11) DEFAULT NULL,
  `published` smallint(6) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_kb_questions`
--

LOCK TABLES `egw_kb_questions` WRITE;
/*!40000 ALTER TABLE `egw_kb_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_kb_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_kb_ratings`
--

DROP TABLE IF EXISTS `egw_kb_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_kb_ratings` (
  `user_id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`art_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_kb_ratings`
--

LOCK TABLES `egw_kb_ratings` WRITE;
/*!40000 ALTER TABLE `egw_kb_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_kb_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_kb_related_art`
--

DROP TABLE IF EXISTS `egw_kb_related_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_kb_related_art` (
  `art_id` int(11) NOT NULL,
  `related_art_id` int(11) NOT NULL,
  PRIMARY KEY (`art_id`,`related_art_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_kb_related_art`
--

LOCK TABLES `egw_kb_related_art` WRITE;
/*!40000 ALTER TABLE `egw_kb_related_art` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_kb_related_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_kb_search`
--

DROP TABLE IF EXISTS `egw_kb_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_kb_search` (
  `keyword` varchar(30) NOT NULL,
  `art_id` int(11) NOT NULL,
  `score` bigint(20) NOT NULL,
  PRIMARY KEY (`keyword`,`art_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_kb_search`
--

LOCK TABLES `egw_kb_search` WRITE;
/*!40000 ALTER TABLE `egw_kb_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_kb_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_kb_urls`
--

DROP TABLE IF EXISTS `egw_kb_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_kb_urls` (
  `art_id` int(11) NOT NULL,
  `art_url` varchar(255) NOT NULL,
  `art_url_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`art_id`,`art_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_kb_urls`
--

LOCK TABLES `egw_kb_urls` WRITE;
/*!40000 ALTER TABLE `egw_kb_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_kb_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_lang`
--

DROP TABLE IF EXISTS `egw_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_lang` (
  `lang` varchar(5) NOT NULL DEFAULT '',
  `app_name` varchar(32) NOT NULL DEFAULT 'common',
  `message_id` varchar(128) NOT NULL DEFAULT '',
  `content` text,
  PRIMARY KEY (`lang`,`app_name`,`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_lang`
--

LOCK TABLES `egw_lang` WRITE;
/*!40000 ALTER TABLE `egw_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_languages`
--

DROP TABLE IF EXISTS `egw_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_languages` (
  `lang_id` varchar(5) NOT NULL,
  `lang_name` varchar(50) NOT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_languages`
--

LOCK TABLES `egw_languages` WRITE;
/*!40000 ALTER TABLE `egw_languages` DISABLE KEYS */;
INSERT INTO `egw_languages` VALUES ('aa','Afar'),('ab','Abkhazian'),('af','Afrikaans'),('am','Amharic'),('ar','Arabic'),('as','Assamese'),('ay','Aymara'),('az','Azerbaijani'),('ba','Bashkir'),('be','Byelorussian'),('bg','Bulgarian'),('bh','Bihari'),('bi','Bislama'),('bn','Bengali / Bangla'),('bo','Tibetan'),('br','Breton'),('ca','Catalan'),('co','Corsican'),('cs','Czech'),('cy','Welsh'),('da','Danish'),('de','German'),('dz','Bhutani'),('el','Greek'),('en','English'),('eo','Esperanto'),('es-es','Español'),('et','Estonian'),('eu','Basque'),('fa','Persian'),('fi','Finnish'),('fj','Fiji'),('fo','Faeroese'),('fr','Français'),('fy','Frisian'),('ga','Irish'),('gd','Gaelic / Scots Gaelic'),('gl','Galician'),('gn','Guarani'),('gu','Gujarati'),('ha','Hausa'),('hi','Hindi'),('hr','Croatian'),('hu','Hungarian'),('hy','Armenian'),('ia','Interlingua'),('ie','Interlingue'),('ik','Inupiak'),('id','Indonesian'),('is','Icelandic'),('it','Italian'),('iw','Hebrew'),('ja','Japanese'),('ji','Yiddish'),('jw','Javanese'),('ka','Georgian'),('kk','Kazakh'),('kl','Greenlandic'),('km','Cambodian'),('kn','Kannada'),('ko','Korean'),('ks','Kashmiri'),('ku','Kurdish'),('ky','Kirghiz'),('la','Latin'),('ln','Lingala'),('lo','Laothian'),('lt','Lithuanian'),('lv','Latvian / Lettish'),('mg','Malagasy'),('mi','Maori'),('mk','Macedonian'),('ml','Malayalam'),('mn','Mongolian'),('mo','Moldavian'),('mr','Marathi'),('ms','Malay'),('mt','Maltese'),('my','Burmese'),('na','Nauru'),('ne','Nepali'),('nl','Dutch'),('no','Norwegian'),('oc','Occitan'),('om','Oromo / Afan'),('or','Oriya'),('pa','Punjabi'),('pl','Polish'),('ps','Pashto / Pushto'),('pt','Portuguese'),('pt-br','Brazil'),('qu','Quechua'),('rm','Rhaeto-Romance'),('rn','Kirundi'),('ro','Romanian'),('ru','Russian'),('rw','Kinyarwanda'),('sa','Sanskrit'),('sd','Sindhi'),('sg','Sangro'),('sh','Serbo-Croatian'),('si','Singhalese'),('sk','Slovak'),('sl','Slovenian'),('sm','Samoan'),('sn','Shona'),('so','Somali'),('sq','Albanian'),('sr','Serbian'),('ss','Siswati'),('st','Sesotho'),('su','Sudanese'),('sv','Swedish'),('sw','Swahili'),('ta','Tamil'),('te','Tegulu'),('tg','Tajik'),('th','Thai'),('ti','Tigrinya'),('tk','Turkmen'),('tl','Tagalog'),('tn','Setswana'),('to','Tonga'),('tr','Turkish'),('ts','Tsonga'),('tt','Tatar'),('tw','Twi'),('uk','Ukrainian'),('ur','Urdu'),('uz','Uzbek'),('vi','Vietnamese'),('vo','Volapuk'),('wo','Wolof'),('xh','Xhosa'),('yo','Yoruba'),('zh','Chinese(simplified)'),('zh-tw','Chinese(Taiwan)'),('zu','Zulu');
/*!40000 ALTER TABLE `egw_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_links`
--

DROP TABLE IF EXISTS `egw_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_app1` varchar(25) NOT NULL,
  `link_id1` varchar(50) NOT NULL,
  `link_app2` varchar(25) NOT NULL,
  `link_id2` varchar(50) NOT NULL,
  `link_remark` varchar(100) DEFAULT NULL,
  `link_lastmod` bigint(20) NOT NULL,
  `link_owner` int(11) NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `egw_links_deleted` (`deleted`),
  KEY `egw_links_app1_id1_lastmod` (`link_app1`,`link_id1`,`link_lastmod`),
  KEY `egw_links_app2_id2_lastmod` (`link_app2`,`link_id2`,`link_lastmod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_links`
--

LOCK TABLES `egw_links` WRITE;
/*!40000 ALTER TABLE `egw_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_locks`
--

DROP TABLE IF EXISTS `egw_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_locks` (
  `lock_token` varchar(255) NOT NULL,
  `lock_path` varchar(255) NOT NULL,
  `lock_expires` bigint(20) NOT NULL,
  `lock_owner` varchar(255) DEFAULT NULL,
  `lock_recursive` tinyint(4) NOT NULL DEFAULT '0',
  `lock_write` tinyint(4) NOT NULL DEFAULT '0',
  `lock_exclusive` tinyint(4) NOT NULL DEFAULT '0',
  `lock_created` bigint(20) DEFAULT '0',
  `lock_modified` bigint(20) DEFAULT '0',
  PRIMARY KEY (`lock_token`),
  KEY `egw_locks_path` (`lock_path`),
  KEY `egw_locks_expires` (`lock_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_locks`
--

LOCK TABLES `egw_locks` WRITE;
/*!40000 ALTER TABLE `egw_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_mailaccounts`
--

DROP TABLE IF EXISTS `egw_mailaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_mailaccounts` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `mail_type` tinyint(4) NOT NULL,
  `mail_value` varchar(128) NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `egw_mailaccounts_value` (`mail_value`),
  KEY `egw_mailaccounts_account_id_type` (`account_id`,`mail_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_mailaccounts`
--

LOCK TABLES `egw_mailaccounts` WRITE;
/*!40000 ALTER TABLE `egw_mailaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_mailaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_news`
--

DROP TABLE IF EXISTS `egw_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_date` bigint(20) DEFAULT NULL,
  `news_headline` varchar(128) DEFAULT NULL,
  `news_submittedby` int(11) DEFAULT NULL,
  `news_content` text,
  `news_begin` bigint(20) NOT NULL DEFAULT '0',
  `news_end` bigint(20) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `news_teaser` text,
  `news_is_html` smallint(6) NOT NULL DEFAULT '1',
  `news_source_id` int(11) DEFAULT NULL,
  `news_lang` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `egw_news_date` (`news_date`),
  KEY `egw_news_headline` (`news_headline`),
  KEY `egw_news_cat_id` (`cat_id`),
  KEY `egw_news_lang` (`news_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_news`
--

LOCK TABLES `egw_news` WRITE;
/*!40000 ALTER TABLE `egw_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_news_export`
--

DROP TABLE IF EXISTS `egw_news_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_news_export` (
  `cat_id` int(11) NOT NULL,
  `export_type` smallint(6) DEFAULT NULL,
  `export_itemsyntax` smallint(6) DEFAULT NULL,
  `export_title` varchar(255) DEFAULT NULL,
  `export_link` varchar(255) DEFAULT NULL,
  `export_description` text,
  `export_img_title` varchar(255) DEFAULT NULL,
  `export_img_url` varchar(255) DEFAULT NULL,
  `export_img_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_news_export`
--

LOCK TABLES `egw_news_export` WRITE;
/*!40000 ALTER TABLE `egw_news_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_news_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_nextid`
--

DROP TABLE IF EXISTS `egw_nextid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_nextid` (
  `id` int(11) DEFAULT NULL,
  `appname` varchar(25) NOT NULL,
  PRIMARY KEY (`appname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_nextid`
--

LOCK TABLES `egw_nextid` WRITE;
/*!40000 ALTER TABLE `egw_nextid` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_nextid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_notificationpopup`
--

DROP TABLE IF EXISTS `egw_notificationpopup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_notificationpopup` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `notify_message` text,
  `notify_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notify_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`notify_id`),
  KEY `egw_notificationpopup_account_id` (`account_id`),
  KEY `egw_notificationpopup_notify_created` (`notify_created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_notificationpopup`
--

LOCK TABLES `egw_notificationpopup` WRITE;
/*!40000 ALTER TABLE `egw_notificationpopup` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_notificationpopup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_phpfreechat`
--

DROP TABLE IF EXISTS `egw_phpfreechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_phpfreechat` (
  `server` varchar(32) NOT NULL,
  `group` varchar(64) NOT NULL,
  `subgroup` varchar(128) NOT NULL,
  `leaf` varchar(128) NOT NULL,
  `leafvalue` text,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group`,`subgroup`,`leaf`),
  KEY `egw_phpfreechat_server_group_subgroup_timestamp` (`server`,`group`,`subgroup`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_phpfreechat`
--

LOCK TABLES `egw_phpfreechat` WRITE;
/*!40000 ALTER TABLE `egw_phpfreechat` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_phpfreechat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_constraints`
--

DROP TABLE IF EXISTS `egw_pm_constraints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_constraints` (
  `pm_id` int(11) NOT NULL,
  `pe_id_end` int(11) NOT NULL,
  `pe_id_start` int(11) NOT NULL,
  `ms_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pm_id`,`pe_id_end`,`pe_id_start`,`ms_id`),
  KEY `egw_pm_constraints_id_pe_id_start` (`pm_id`,`pe_id_start`),
  KEY `egw_pm_constraints_id_ms_id` (`pm_id`,`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_constraints`
--

LOCK TABLES `egw_pm_constraints` WRITE;
/*!40000 ALTER TABLE `egw_pm_constraints` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_constraints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_elements`
--

DROP TABLE IF EXISTS `egw_pm_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_elements` (
  `pm_id` int(11) NOT NULL,
  `pe_id` int(11) NOT NULL,
  `pe_title` varchar(255) NOT NULL,
  `pe_completion` smallint(6) DEFAULT NULL,
  `pe_planned_time` int(11) DEFAULT NULL,
  `pe_replanned_time` int(11) DEFAULT NULL,
  `pe_used_time` int(11) DEFAULT NULL,
  `pe_planned_budget` decimal(20,2) DEFAULT NULL,
  `pe_used_budget` decimal(20,2) DEFAULT NULL,
  `pe_planned_start` bigint(20) DEFAULT NULL,
  `pe_real_start` bigint(20) DEFAULT NULL,
  `pe_planned_end` bigint(20) DEFAULT NULL,
  `pe_real_end` bigint(20) DEFAULT NULL,
  `pe_overwrite` int(11) NOT NULL DEFAULT '0',
  `pl_id` int(11) NOT NULL DEFAULT '0',
  `pe_synced` bigint(20) DEFAULT NULL,
  `pe_modified` bigint(20) NOT NULL,
  `pe_modifier` int(11) NOT NULL,
  `pe_status` varchar(8) NOT NULL DEFAULT 'new',
  `pe_unitprice` decimal(20,2) DEFAULT NULL,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `pe_share` int(11) DEFAULT NULL,
  `pe_health` smallint(6) DEFAULT NULL,
  `pe_resources` varchar(255) DEFAULT NULL,
  `pe_details` text,
  `pe_planned_quantity` double DEFAULT NULL,
  `pe_used_quantity` double DEFAULT NULL,
  `pe_eroles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pm_id`,`pe_id`),
  KEY `egw_pm_elements_id_pe_status` (`pm_id`,`pe_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_elements`
--

LOCK TABLES `egw_pm_elements` WRITE;
/*!40000 ALTER TABLE `egw_pm_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_eroles`
--

DROP TABLE IF EXISTS `egw_pm_eroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_eroles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_id` int(11) DEFAULT '0',
  `role_title` varchar(80) NOT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  `role_multi` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_eroles`
--

LOCK TABLES `egw_pm_eroles` WRITE;
/*!40000 ALTER TABLE `egw_pm_eroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_eroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_extra`
--

DROP TABLE IF EXISTS `egw_pm_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_extra` (
  `pm_id` int(11) NOT NULL,
  `pm_extra_name` varchar(40) NOT NULL,
  `pm_extra_value` text,
  PRIMARY KEY (`pm_id`,`pm_extra_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_extra`
--

LOCK TABLES `egw_pm_extra` WRITE;
/*!40000 ALTER TABLE `egw_pm_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_members`
--

DROP TABLE IF EXISTS `egw_pm_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_members` (
  `pm_id` int(11) NOT NULL,
  `member_uid` int(11) NOT NULL,
  `role_id` int(11) DEFAULT '0',
  `member_availibility` double DEFAULT '100',
  PRIMARY KEY (`pm_id`,`member_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_members`
--

LOCK TABLES `egw_pm_members` WRITE;
/*!40000 ALTER TABLE `egw_pm_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_milestones`
--

DROP TABLE IF EXISTS `egw_pm_milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_milestones` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_id` int(11) NOT NULL,
  `ms_date` bigint(20) NOT NULL,
  `ms_title` varchar(255) DEFAULT NULL,
  `ms_description` text,
  PRIMARY KEY (`ms_id`),
  KEY `egw_pm_milestones_id` (`pm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_milestones`
--

LOCK TABLES `egw_pm_milestones` WRITE;
/*!40000 ALTER TABLE `egw_pm_milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_pricelist`
--

DROP TABLE IF EXISTS `egw_pm_pricelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_pricelist` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_title` varchar(255) NOT NULL,
  `pl_description` text,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `pl_unit` varchar(20) NOT NULL,
  PRIMARY KEY (`pl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_pricelist`
--

LOCK TABLES `egw_pm_pricelist` WRITE;
/*!40000 ALTER TABLE `egw_pm_pricelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_pricelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_prices`
--

DROP TABLE IF EXISTS `egw_pm_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_prices` (
  `pm_id` int(11) NOT NULL DEFAULT '0',
  `pl_id` int(11) NOT NULL,
  `pl_validsince` bigint(20) NOT NULL DEFAULT '0',
  `pl_price` double DEFAULT NULL,
  `pl_modifier` int(11) NOT NULL,
  `pl_modified` bigint(20) NOT NULL,
  `pl_customertitle` varchar(255) DEFAULT NULL,
  `pl_billable` smallint(6) DEFAULT '1',
  PRIMARY KEY (`pm_id`,`pl_id`,`pl_validsince`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_prices`
--

LOCK TABLES `egw_pm_prices` WRITE;
/*!40000 ALTER TABLE `egw_pm_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_projects`
--

DROP TABLE IF EXISTS `egw_pm_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_projects` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_number` varchar(64) NOT NULL,
  `pm_title` varchar(255) NOT NULL,
  `pm_description` text,
  `pm_creator` int(11) NOT NULL,
  `pm_created` bigint(20) NOT NULL,
  `pm_modifier` int(11) DEFAULT NULL,
  `pm_modified` bigint(20) DEFAULT NULL,
  `pm_planned_start` bigint(20) DEFAULT NULL,
  `pm_planned_end` bigint(20) DEFAULT NULL,
  `pm_real_start` bigint(20) DEFAULT NULL,
  `pm_real_end` bigint(20) DEFAULT NULL,
  `cat_id` int(11) DEFAULT '0',
  `pm_access` varchar(7) DEFAULT 'public',
  `pm_priority` smallint(6) DEFAULT '1',
  `pm_status` varchar(9) DEFAULT 'active',
  `pm_completion` smallint(6) DEFAULT '0',
  `pm_used_time` int(11) DEFAULT NULL,
  `pm_planned_time` int(11) DEFAULT NULL,
  `pm_replanned_time` int(11) DEFAULT NULL,
  `pm_used_budget` decimal(20,2) DEFAULT NULL,
  `pm_planned_budget` decimal(20,2) DEFAULT NULL,
  `pm_overwrite` int(11) DEFAULT '0',
  `pm_accounting_type` varchar(10) DEFAULT 'times',
  PRIMARY KEY (`pm_id`),
  UNIQUE KEY `egw_pm_projects_number` (`pm_number`),
  KEY `egw_pm_projects_title` (`pm_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_projects`
--

LOCK TABLES `egw_pm_projects` WRITE;
/*!40000 ALTER TABLE `egw_pm_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_pm_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_pm_roles`
--

DROP TABLE IF EXISTS `egw_pm_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_pm_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_id` int(11) DEFAULT '0',
  `role_title` varchar(80) NOT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  `role_acl` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `egw_pm_roles_id` (`pm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_pm_roles`
--

LOCK TABLES `egw_pm_roles` WRITE;
/*!40000 ALTER TABLE `egw_pm_roles` DISABLE KEYS */;
INSERT INTO `egw_pm_roles` VALUES (1,0,'Coordinator','full access',65535),(2,0,'Accounting','edit access, incl. editing budget and elements',199),(3,0,'Assistant','read access, incl. budget and adding elements',67),(4,0,'Projectmember','read access, no budget',1);
/*!40000 ALTER TABLE `egw_pm_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_polls`
--

DROP TABLE IF EXISTS `egw_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_polls` (
  `poll_id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_title` varchar(100) NOT NULL DEFAULT '',
  `poll_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `poll_visible` int(11) NOT NULL DEFAULT '0',
  `poll_votable` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_polls`
--

LOCK TABLES `egw_polls` WRITE;
/*!40000 ALTER TABLE `egw_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_polls_answers`
--

DROP TABLE IF EXISTS `egw_polls_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_polls_answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `answer_text` varchar(100) NOT NULL DEFAULT '',
  `answer_votes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`answer_id`),
  KEY `egw_polls_answers_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_polls_answers`
--

LOCK TABLES `egw_polls_answers` WRITE;
/*!40000 ALTER TABLE `egw_polls_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_polls_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_polls_votes`
--

DROP TABLE IF EXISTS `egw_polls_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_polls_votes` (
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `answer_id` int(11) NOT NULL DEFAULT '0',
  `vote_uid` int(11) NOT NULL DEFAULT '0',
  `vote_ip` varchar(128) NOT NULL DEFAULT '',
  `vote_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`poll_id`,`answer_id`,`vote_uid`,`vote_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_polls_votes`
--

LOCK TABLES `egw_polls_votes` WRITE;
/*!40000 ALTER TABLE `egw_polls_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_polls_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_preferences`
--

DROP TABLE IF EXISTS `egw_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_preferences` (
  `preference_owner` int(11) NOT NULL,
  `preference_app` varchar(25) NOT NULL,
  `preference_value` text,
  PRIMARY KEY (`preference_owner`,`preference_app`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_preferences`
--

LOCK TABLES `egw_preferences` WRITE;
/*!40000 ALTER TABLE `egw_preferences` DISABLE KEYS */;
INSERT INTO `egw_preferences` VALUES (-2,'common','{\"navbar_format\":\"icons_and_text\",\"select_mode\":\"EGW_SELECTMODE_DEFAULT\",\"account_selection\":\"selectbox\",\"account_display\":\"lastname\",\"lang\":\"fr\",\"country\":\"FR\",\"tz\":\"Europe\\/Paris\",\"dateformat\":\"d.m.Y\",\"timeformat\":\"24\",\"number_format\":\".\",\"currency\":\"EUR\",\"csv_charset\":\"iso-8859-1\",\"rte_font\":\"arial, helvetica, sans-serif\",\"rte_font_unit\":\"pt\",\"rte_font_size\":\"10\",\"spellchecker_lang\":\"fr\",\"rte_features\":\"extended\",\"default_app\":\"\",\"auto_hide_sidebox\":\"1\"}'),(-1,'common','{\"maxmatchs\":\"20\",\"template_set\":\"pixelegg\",\"theme\":\"pixelegg\",\"link_list_format\":\"icons\",\"show_currentusers\":\"1\",\"tz_selection\":\"Europe\\/Paris\",\"rte_enter_mode\":\"br\",\"rte_skin\":\"moono\",\"show_general_menu\":\"topmenu\",\"start_and_logout_icons\":\"yes\",\"max_icons\":\"12\",\"click_or_onmouseover\":\"click\",\"disable_slider_effects\":\"\",\"disable_pngfix\":\"\",\"show_generation_time\":\"\"}'),(-2,'groupdav','{\"infolog-types\":\"task\",\"infolog-cat-action\":\"none\",\"debug_level\":\"0\"}'),(-2,'addressbook','{\"document_dir\":\"\\/templates\\/addressbook\",\"link_title\":\"org_name: n_family, n_given\",\"addr_format\":\"postcode_city\",\"fileas_default\":\"org_name: n_family, n_given\",\"crm_list\":\"infolog\"}'),(-2,'calendar','{\"document_dir\":\"\\/templates\\/calendar\",\"days_in_weekview\":\"7\",\"workdaystarts\":\"9\",\"workdayends\":\"18\",\"interval\":\"30\",\"display_holidays_event\":\"0\",\"defaultlength\":\"60\",\"default-alarm\":\"\",\"default-alarm-wholeday\":\"\",\"reset_stati\":\"no\",\"receive_updates\":\"time_change\",\"receive_own_updates\":\"false\",\"notify_externals\":\"no\",\"notifyAdded\":\"\",\"notifyCanceled\":\"\",\"notifyModified\":\"\",\"export_timezone\":\"0\"}'),(-2,'infolog','{\"document_dir\":\"\\/templates\\/infolog\",\"defaultFilter\":\"\",\"set_start\":\"date\",\"show_id\":\"1\",\"listNoSubs\":\"0\",\"show_links\":\"all\",\"show_percent\":\"1\",\"limit_des_lines\":\"5\",\"notify_creator\":\"1\",\"notify_assigned\":\"1\",\"notify_due_delegated\":\"0\",\"notify_due_responsible\":\"0d\",\"notify_start_delegated\":\"0\",\"notify_start_responsible\":\"0d\",\"notify_owner_group_member\":\"0\"}'),(-2,'tracker','{\"document_dir\":\"\\/templates\\/tracker\",\"default_version\":\"\",\"limit_des_lines\":\"5\",\"notify_creator\":\"1\",\"notify_assigned\":\"1\",\"notify_own_modification\":\"\",\"notify_start\":\"0d\",\"notify_due\":\"0d\"}'),(-2,'timesheet','{\"document_dir\":\"\\/templates\\/timesheet\"}'),(-2,'projectmanager','{\"document_dir\":\"\\/templates\\/projectmanager\",\"show_custom_app_icons\":\"1\",\"show_links\":\"\",\"show_projectselection\":\"tree_with_title\",\"duration_1\":\"480\",\"start_1\":\"540\",\"duration_2\":\"480\",\"start_2\":\"540\",\"duration_3\":\"480\",\"start_3\":\"540\",\"duration_4\":\"480\",\"start_4\":\"540\",\"duration_5\":\"360\",\"start_5\":\"540\",\"duration_6\":\"0\",\"start_6\":\"0\",\"duration_0\":\"0\",\"start_0\":\"0\"}'),(-2,'filemanager','{\"document_dir\":\"\\/templates\\/filemanager\",\"folderlink1\":\"\",\"showbase\":\"no\"}'),(-2,'activesync','{\"addressbook-all-in-user\":\"0\",\"addressbook-force-fileas\":\"0\",\"mail-ActiveSyncProfileID\":\"G\",\"mail-allowSendingInvitations\":\"sendifnocalnotif\",\"infolog-types\":\"task\"}'),(-1,'addressbook','{\"private_addressbook\":\"\"}'),(-1,'calendar','{\"multiple_weeks\":\"3\",\"weekdaystarts\":\"Monday\",\"planner_show_empty_rows\":\"user\",\"use_time_grid\":\"all\",\"defaultresource_sel\":\"addressbook\",\"default_private\":\"0\",\"update_format\":\"ical\",\"freebusy\":\"0\",\"freebusy_pw\":\"\"}'),(-1,'filemanager','{\"showhome\":\"yes\",\"showusers\":\"yes\"}'),(-2,'news_admin','{\"limit_des_lines\":\"5\"}'),(-2,'notifications','{\"notification_chain\":\"popup_and_email\",\"egwpopup_verbosity\":\"medium\"}'),(-2,'phpbrain','{\"show_tree\":\"all\",\"num_lines\":\"\",\"num_comments\":\"\"}'),(-1,'projectmanager','{\"show_infolog_type_icon\":\"\",\"gantt_element_title_length\":\"0\",\"gantt_pm_elementbars_order\":\"pe_start,pe_end\",\"duration_6\":\"0\",\"start_6\":\"0\",\"duration_0\":\"0\",\"start_0\":\"0\"}'),(-2,'mail','{\"message_forwarding\":\"asmail\",\"composeOptions\":\"html\",\"replyOptions\":\"none\",\"disableRulerForSignatureSeparation\":\"0\",\"insertSignatureAtTopOfMessage\":\"0\",\"deleteOptions\":\"move_to_trash\",\"sendOptions\":\"move_to_sent\",\"trustServersUnseenInfo\":\"2\",\"showAllFoldersInFolderPane\":\"0\",\"prefaskformove\":\"2\",\"saveAsOptions\":\"text\"}'),(-1,'mail','{\"htmlOptions\":\"always_display\",\"allowExternalIMGs\":\"1\",\"prefaskformove\":\"1\"}'),(-1,'tracker','{\"allow_defaultproject\":\"1\"}');
/*!40000 ALTER TABLE `egw_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_registration`
--

DROP TABLE IF EXISTS `egw_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_registration` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `register_code` varchar(40) DEFAULT NULL,
  `post_confirm_hook` varchar(255) DEFAULT NULL,
  `sitemgr_version` int(11) DEFAULT NULL,
  `account_lid` varchar(64) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_registration`
--

LOCK TABLES `egw_registration` WRITE;
/*!40000 ALTER TABLE `egw_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_resources`
--

DROP TABLE IF EXISTS `egw_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_resources` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_description` varchar(100) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '1',
  `useable` int(11) DEFAULT '1',
  `location` varchar(100) DEFAULT NULL,
  `bookable` varchar(1) DEFAULT NULL,
  `buyable` varchar(1) DEFAULT NULL,
  `prize` varchar(200) DEFAULT NULL,
  `long_description` longtext,
  `picture_src` varchar(20) DEFAULT NULL,
  `accessory_of` int(11) DEFAULT '-1',
  `storage_info` varchar(200) DEFAULT NULL,
  `inventory_number` varchar(20) DEFAULT NULL,
  `deleted` bigint(20) DEFAULT NULL,
  `res_creator` int(11) DEFAULT NULL,
  `res_created` bigint(20) DEFAULT NULL,
  `res_modifier` int(11) DEFAULT NULL,
  `res_modified` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_resources`
--

LOCK TABLES `egw_resources` WRITE;
/*!40000 ALTER TABLE `egw_resources` DISABLE KEYS */;
INSERT INTO `egw_resources` VALUES (1,'Meeting room 1',NULL,5,1,1,NULL,'1',NULL,NULL,NULL,'cat_src',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Meeting room 2',NULL,5,1,1,NULL,'1',NULL,NULL,NULL,'cat_src',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Fixed Beamer',NULL,4,1,1,NULL,'0',NULL,NULL,NULL,'cat_src',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `egw_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_resources_extra`
--

DROP TABLE IF EXISTS `egw_resources_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_resources_extra` (
  `extra_id` int(11) NOT NULL,
  `extra_name` varchar(40) NOT NULL,
  `extra_owner` int(11) NOT NULL DEFAULT '-1',
  `extra_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`extra_id`,`extra_name`,`extra_owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_resources_extra`
--

LOCK TABLES `egw_resources_extra` WRITE;
/*!40000 ALTER TABLE `egw_resources_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_resources_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_active_modules`
--

DROP TABLE IF EXISTS `egw_sitemgr_active_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_active_modules` (
  `area` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`area`,`cat_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_active_modules`
--

LOCK TABLES `egw_sitemgr_active_modules` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_active_modules` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_active_modules` VALUES ('__PAGE__',6,1),('__PAGE__',6,2),('__PAGE__',6,3),('__PAGE__',6,4),('__PAGE__',6,5),('__PAGE__',6,6),('__PAGE__',6,7),('__PAGE__',6,8),('__PAGE__',6,9),('__PAGE__',6,10),('__PAGE__',6,11),('__PAGE__',6,12),('__PAGE__',6,13),('__PAGE__',6,14),('__PAGE__',6,15),('__PAGE__',6,16),('__PAGE__',6,17),('__PAGE__',6,18),('__PAGE__',6,19),('__PAGE__',6,20),('__PAGE__',6,21),('__PAGE__',6,22),('__PAGE__',6,23),('__PAGE__',6,24),('__PAGE__',6,25),('__PAGE__',6,26),('__PAGE__',6,27),('__PAGE__',6,28),('__PAGE__',6,29),('__PAGE__',6,30),('__PAGE__',6,31),('__PAGE__',6,32),('__PAGE__',6,33),('__PAGE__',6,34),('__PAGE__',6,35),('__PAGE__',6,36),('__PAGE__',6,37),('__PAGE__',6,38),('__PAGE__',6,39),('__PAGE__',6,40),('__PAGE__',6,41),('__PAGE__',6,42),('__PAGE__',6,43),('__PAGE__',6,44);
/*!40000 ALTER TABLE `egw_sitemgr_active_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_blocks`
--

DROP TABLE IF EXISTS `egw_sitemgr_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_blocks` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(50) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `viewable` int(11) DEFAULT NULL,
  PRIMARY KEY (`block_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_blocks`
--

LOCK TABLES `egw_sitemgr_blocks` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_blocks` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_blocks` VALUES (1,'center',7,1,7,0,0),(2,'center',7,1,7,0,0),(3,'center',7,1,44,3,0),(4,'center',9,2,7,0,0),(5,'center',9,2,18,0,0),(6,'center',9,3,7,-1,0),(7,'center',9,4,7,0,0),(8,'center',9,5,7,0,0),(9,'center',9,6,7,-1,0),(10,'center',9,6,41,0,0),(11,'center',9,7,7,-1,0),(12,'center',9,7,7,0,0),(13,'center',9,7,44,0,0),(14,'center',9,8,7,-1,0),(15,'center',9,8,8,0,0),(16,'center',9,9,7,-1,0),(17,'center',9,9,24,0,0),(18,'center',9,9,7,0,0),(19,'center',8,10,7,0,0),(20,'center',10,11,7,-2,0),(21,'center',10,11,7,0,0),(22,'center',10,11,7,4,0),(23,'center',10,11,22,5,0),(24,'center',10,12,17,0,0),(25,'center',10,12,7,0,0),(26,'center',10,13,7,0,0),(27,'center',10,14,7,0,0),(28,'center',10,15,7,0,0),(29,'center',11,16,7,0,0),(30,'center',11,17,7,0,0),(31,'center',12,18,7,-1,0),(32,'center',12,19,7,0,0),(33,'center',12,20,7,0,0),(34,'center',12,21,7,0,0),(35,'left',6,0,24,0,0),(36,'left',6,0,22,0,0),(37,'right',6,0,7,0,0),(38,'user1',6,0,7,0,0),(39,'breadcrumb',6,0,24,0,0),(40,'left',6,0,25,0,0),(41,'left',6,0,23,5,1),(42,'header',6,0,7,9,0),(43,'footer',6,0,7,10,0),(44,'left',6,0,5,99,3),(45,'center',6,0,24,100,2);
/*!40000 ALTER TABLE `egw_sitemgr_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_blocks_lang`
--

DROP TABLE IF EXISTS `egw_sitemgr_blocks_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_blocks_lang` (
  `block_id` int(11) NOT NULL,
  `lang` varchar(5) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`block_id`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_blocks_lang`
--

LOCK TABLES `egw_sitemgr_blocks_lang` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_blocks_lang` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_blocks_lang` VALUES (1,'de','Was kann man mit eGroupware machen?'),(1,'en','What can I do with SiteManager?'),(2,'de','Templates'),(2,'en','Templates'),(3,'de','Nachrichten Module'),(3,'en','News Module'),(4,'de','Seiteninhalte'),(4,'en','Page Contents'),(6,'de','Blöcke'),(6,'en','Blocks'),(7,'de','HTML Block'),(7,'en','HTML module'),(8,'de','Kalender-Blöcke'),(8,'en','Calendar Blocks'),(9,'de','Kontakt-Formular'),(9,'en','Contact Form'),(10,'en',''),(11,'de','Nachrichten-Modul'),(11,'en','News Module'),(13,'de','News Admin module'),(13,'en','News Admin module'),(14,'de','Ordner und Dateien'),(14,'en','Folders and Files'),(15,'de','Datei download'),(15,'en','File download'),(16,'de','Navigation und Gesamtindex'),(16,'en','Navigation and Site Index'),(17,'en','Navigation element'),(19,'de','Kategorien und Seiten'),(19,'en','Categories and Pages'),(20,'de','Templateauswahl'),(20,'en','Template Selection'),(21,'de','Template Galerie'),(21,'en','Template Gallery'),(22,'de','Alle Templates'),(22,'en','All Templates'),(23,'de','Template auswählen'),(23,'en','Choose template'),(24,'de','Weiterleitung zu template'),(24,'en','Redirect to template'),(25,'de','Redirect Erläuterung'),(25,'en','Redirect Explanation'),(26,'de','Konfiguration'),(26,'en','Configuration'),(27,'de','Definition'),(27,'en','Definition'),(28,'de','FAQ'),(28,'en','FAQ'),(29,'de','Stylite Support'),(29,'en','Stylite Support'),(30,'de','Community Support'),(30,'en','Community Support'),(31,'de','Impressum'),(31,'en','Imprint'),(32,'de','Datenschutzerklärung'),(32,'en','Privacy policy'),(33,'de','Nutzungsbedingungen'),(33,'en','Site terms'),(34,'de','404NotFound'),(34,'en','404NotFound'),(35,'de','Navigation element'),(35,'en','Navigation'),(36,'en','Choose template'),(37,'de','EGroupware Testen'),(37,'en','Test EGroupware'),(39,'de','Navigations-Element'),(39,'en','Navigation element'),(40,'de','Sprache'),(40,'en','Choose language'),(41,'en','Administration'),(42,'en','HTML Module'),(43,'en',' '),(44,'de','Login'),(44,'en','Login'),(45,'en','Navigation element');
/*!40000 ALTER TABLE `egw_sitemgr_blocks_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_categories_lang`
--

DROP TABLE IF EXISTS `egw_sitemgr_categories_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_categories_lang` (
  `cat_id` int(11) NOT NULL,
  `lang` varchar(5) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_categories_lang`
--

LOCK TABLES `egw_sitemgr_categories_lang` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_categories_lang` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_categories_lang` VALUES (6,'en',NULL,NULL),(6,'de',NULL,NULL),(7,'en','Home','Home'),(8,'de','Inhalte Bearbeiten','EGroupware Sitemanager Inhalt'),(8,'en','Edit Contents','EGroupware Sitemanager content'),(9,'de','Blöcke','Blöcke hinzufügen oder bearbeiten'),(9,'en','Blocks','Adding and editing blocks'),(10,'de','Konfiguration','Sitemanager konfigurieren'),(10,'en','Configuration','Sitemanager configuration'),(11,'de','Support','Support anfordern'),(11,'en','Support','Get support'),(12,'de','Kontakt','Kontakt Stylite'),(12,'en','Contact','Contact Stylite');
/*!40000 ALTER TABLE `egw_sitemgr_categories_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_categories_state`
--

DROP TABLE IF EXISTS `egw_sitemgr_categories_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_categories_state` (
  `cat_id` int(11) NOT NULL,
  `state` smallint(6) DEFAULT NULL,
  `index_page_id` int(11) DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `egw_sitemgr_categories_state_cat_id_state` (`cat_id`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_categories_state`
--

LOCK TABLES `egw_sitemgr_categories_state` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_categories_state` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_categories_state` VALUES (7,2,1),(8,2,10),(9,2,2),(10,2,11),(11,2,16),(12,2,18);
/*!40000 ALTER TABLE `egw_sitemgr_categories_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_content`
--

DROP TABLE IF EXISTS `egw_sitemgr_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_content` (
  `version_id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `arguments` text,
  `state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`version_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_content`
--

LOCK TABLES `egw_sitemgr_content` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_content` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_content` VALUES (1,1,'N;',2),(2,2,'N;',2),(3,3,'a:3:{s:4:\"show\";a:3:{i:0;s:8:\"datetime\";i:1;s:5:\"title\";i:2;s:6:\"teaser\";}s:5:\"limit\";s:1:\"5\";s:8:\"linkpage\";s:0:\"\";}',2),(4,4,'N;',2),(5,5,'N;',0),(6,6,'N;',2),(7,7,'N;',2),(8,8,'N;',2),(9,9,'N;',2),(10,10,'a:6:{s:4:\"arg1\";s:2:\"-1\";s:4:\"arg4\";s:0:\"\";s:4:\"arg6\";s:11:\"Contactform\";s:4:\"arg2\";a:3:{i:0;s:4:\"n_fn\";i:1;s:5:\"email\";i:2;s:4:\"note\";}s:4:\"arg3\";s:28:\"Thank you for contacting us.\";s:4:\"arg5\";s:23:\"addressbook.contactform\";}',2),(11,11,'N;',2),(12,12,'N;',0),(13,13,'a:3:{s:4:\"show\";a:4:{i:0;s:8:\"datetime\";i:1;s:5:\"title\";i:2;s:6:\"teaser\";i:3;s:4:\"more\";}s:5:\"limit\";s:1:\"5\";s:8:\"linkpage\";s:0:\"\";}',2),(14,14,'N;',2),(15,15,'a:6:{s:6:\"format\";s:3:\"dir\";s:4:\"path\";s:8:\"/uploads\";s:5:\"order\";s:8:\"name asc\";s:4:\"file\";s:0:\"\";s:4:\"text\";s:0:\"\";s:12:\"confirmation\";s:0:\"\";}',2),(16,16,'N;',2),(17,17,'a:1:{s:8:\"nav_type\";s:1:\"2\";}',2),(18,18,'N;',0),(19,19,'N;',2),(20,20,'N;',2),(21,21,'N;',2),(22,22,'N;',2),(23,23,'a:3:{s:7:\"allowed\";a:94:{i:0;s:10:\"3D-Fantasy\";i:1;s:5:\"idots\";i:2;s:9:\"ja_altair\";i:3;s:10:\"ja_antares\";i:4;s:11:\"ja_archenar\";i:5;s:13:\"ja_avian_ii_d\";i:6;s:13:\"ja_avian_ii_l\";i:7;s:8:\"ja_avior\";i:8;s:9:\"ja_barite\";i:9;s:12:\"ja_bellatrix\";i:10;s:8:\"ja_beryl\";i:11;s:18:\"ja_cooper_business\";i:12;s:9:\"ja_corona\";i:13;s:10:\"ja_dravity\";i:14;s:9:\"ja_drimia\";i:15;s:10:\"ja_edenite\";i:16;s:8:\"ja_erica\";i:17;s:8:\"ja_fagus\";i:18;s:9:\"ja_fedora\";i:19;s:9:\"ja_galena\";i:20;s:10:\"ja_genista\";i:21;s:15:\"ja_genista_xmas\";i:22;s:8:\"ja_hadar\";i:23;s:9:\"ja_halite\";i:24;s:9:\"ja_hedera\";i:25;s:8:\"ja_helio\";i:26;s:9:\"ja_iolite\";i:27;s:7:\"ja_iris\";i:28;s:11:\"ja_justicia\";i:29;s:9:\"ja_koniga\";i:30;s:9:\"ja_kruger\";i:31;s:11:\"ja_kulanite\";i:32;s:10:\"ja_kyanite\";i:33;s:8:\"ja_labra\";i:34;s:8:\"ja_larix\";i:35;s:7:\"ja_lead\";i:36;s:7:\"ja_lime\";i:37;s:9:\"ja_mageia\";i:38;s:11:\"ja_mesolite\";i:39;s:14:\"ja_mesolite_ii\";i:40;s:7:\"ja_mica\";i:41;s:7:\"ja_mona\";i:42;s:8:\"ja_nagya\";i:43;s:9:\"ja_nerine\";i:44;s:9:\"ja_nickel\";i:45;s:9:\"ja_norite\";i:46;s:10:\"ja_olivine\";i:47;s:8:\"ja_olyra\";i:48;s:7:\"ja_opal\";i:49;s:7:\"ja_ores\";i:50;s:10:\"ja_pariiti\";i:51;s:8:\"ja_pluto\";i:52;s:10:\"ja_polaris\";i:53;s:9:\"ja_pollux\";i:54;s:9:\"ja_purity\";i:55;s:9:\"ja_pyrite\";i:56;s:7:\"ja_pyro\";i:57;s:9:\"ja_quartz\";i:58;s:11:\"ja_quillaja\";i:59;s:8:\"ja_raite\";i:60;s:9:\"ja_rasite\";i:61;s:13:\"ja_regulus_ex\";i:62;s:9:\"ja_rochea\";i:63;s:7:\"ja_ruby\";i:64;s:9:\"ja_rutile\";i:65;s:11:\"ja_sanidine\";i:66;s:19:\"ja_sanidineii_light\";i:67;s:9:\"ja_sargas\";i:68;s:9:\"ja_seleni\";i:69;s:10:\"ja_senecio\";i:70;s:14:\"ja_shopping_ii\";i:71;s:8:\"ja_spica\";i:72;s:9:\"ja_sulfur\";i:73;s:9:\"ja_teline\";i:74;s:12:\"ja_teline_ii\";i:75;s:8:\"ja_topaz\";i:76;s:8:\"ja_trona\";i:77;s:7:\"ja_tube\";i:78;s:8:\"ja_urani\";i:79;s:12:\"ja_utahia_ii\";i:80;s:8:\"ja_uvite\";i:81;s:10:\"ja_vauxite\";i:82;s:10:\"ja_villadi\";i:83;s:10:\"ja_wistery\";i:84;s:11:\"ja_xenia_ii\";i:85;s:10:\"ja_zebrina\";i:86;s:10:\"ja_zeolite\";i:87;s:13:\"ja_zeolite_ii\";i:88;s:8:\"ja_zibal\";i:89;s:7:\"ja_zinc\";i:90;s:8:\"NukeNews\";i:91;s:6:\"realss\";i:92;s:20:\"rhuk_orange_smoothie\";i:93;s:12:\"simple_plain\";}s:4:\"show\";s:1:\"3\";s:3:\"zip\";s:3:\"zip\";}',2),(24,24,'a:2:{s:3:\"URL\";s:8:\"template\";s:7:\"timeout\";s:1:\"0\";}',2),(25,25,'N;',2),(26,26,'N;',2),(27,27,'N;',2),(28,28,'N;',2),(29,29,'N;',2),(30,30,'N;',2),(31,31,'N;',2),(32,32,'N;',2),(33,33,'N;',2),(34,34,'N;',2),(35,35,'a:6:{s:8:\"nav_type\";s:1:\"3\";s:8:\"sub_cats\";s:2:\"on\";s:13:\"no_full_index\";s:2:\"on\";s:6:\"expand\";s:2:\"on\";s:14:\"page_link_text\";s:1:\"0\";s:20:\"main_cats_to_include\";s:0:\"\";}',2),(36,36,'a:3:{s:7:\"allowed\";a:96:{i:0;s:10:\"3D-Fantasy\";i:1;s:4:\"beez\";i:2;s:5:\"idots\";i:3;s:9:\"ja_altair\";i:4;s:10:\"ja_antares\";i:5;s:11:\"ja_archenar\";i:6;s:13:\"ja_avian_ii_d\";i:7;s:13:\"ja_avian_ii_l\";i:8;s:8:\"ja_avior\";i:9;s:9:\"ja_barite\";i:10;s:12:\"ja_bellatrix\";i:11;s:8:\"ja_beryl\";i:12;s:18:\"ja_cooper_business\";i:13;s:9:\"ja_corona\";i:14;s:10:\"ja_dravity\";i:15;s:9:\"ja_drimia\";i:16;s:10:\"ja_edenite\";i:17;s:8:\"ja_erica\";i:18;s:8:\"ja_fagus\";i:19;s:9:\"ja_fedora\";i:20;s:9:\"ja_galena\";i:21;s:10:\"ja_genista\";i:22;s:15:\"ja_genista_xmas\";i:23;s:8:\"ja_hadar\";i:24;s:9:\"ja_halite\";i:25;s:9:\"ja_hedera\";i:26;s:8:\"ja_helio\";i:27;s:9:\"ja_iolite\";i:28;s:7:\"ja_iris\";i:29;s:11:\"ja_justicia\";i:30;s:9:\"ja_koniga\";i:31;s:9:\"ja_kruger\";i:32;s:11:\"ja_kulanite\";i:33;s:10:\"ja_kyanite\";i:34;s:8:\"ja_labra\";i:35;s:8:\"ja_larix\";i:36;s:7:\"ja_lead\";i:37;s:7:\"ja_lime\";i:38;s:9:\"ja_mageia\";i:39;s:11:\"ja_mesolite\";i:40;s:14:\"ja_mesolite_ii\";i:41;s:7:\"ja_mica\";i:42;s:7:\"ja_mona\";i:43;s:8:\"ja_nagya\";i:44;s:9:\"ja_nerine\";i:45;s:9:\"ja_nickel\";i:46;s:9:\"ja_norite\";i:47;s:10:\"ja_olivine\";i:48;s:8:\"ja_olyra\";i:49;s:7:\"ja_opal\";i:50;s:7:\"ja_ores\";i:51;s:10:\"ja_pariiti\";i:52;s:8:\"ja_pluto\";i:53;s:10:\"ja_polaris\";i:54;s:9:\"ja_pollux\";i:55;s:9:\"ja_purity\";i:56;s:9:\"ja_pyrite\";i:57;s:7:\"ja_pyro\";i:58;s:9:\"ja_quartz\";i:59;s:11:\"ja_quillaja\";i:60;s:8:\"ja_raite\";i:61;s:9:\"ja_rasite\";i:62;s:13:\"ja_regulus_ex\";i:63;s:9:\"ja_rochea\";i:64;s:7:\"ja_ruby\";i:65;s:9:\"ja_rutile\";i:66;s:11:\"ja_sanidine\";i:67;s:19:\"ja_sanidineii_light\";i:68;s:9:\"ja_sargas\";i:69;s:9:\"ja_seleni\";i:70;s:10:\"ja_senecio\";i:71;s:14:\"ja_shopping_ii\";i:72;s:8:\"ja_spica\";i:73;s:9:\"ja_sulfur\";i:74;s:9:\"ja_teline\";i:75;s:12:\"ja_teline_ii\";i:76;s:8:\"ja_topaz\";i:77;s:8:\"ja_trona\";i:78;s:7:\"ja_tube\";i:79;s:8:\"ja_urani\";i:80;s:12:\"ja_utahia_ii\";i:81;s:8:\"ja_uvite\";i:82;s:10:\"ja_vauxite\";i:83;s:10:\"ja_villadi\";i:84;s:10:\"ja_wistery\";i:85;s:11:\"ja_xenia_ii\";i:86;s:10:\"ja_zebrina\";i:87;s:10:\"ja_zeolite\";i:88;s:13:\"ja_zeolite_ii\";i:89;s:8:\"ja_zibal\";i:90;s:7:\"ja_zinc\";i:91;s:8:\"NukeNews\";i:92;s:6:\"realss\";i:93;s:13:\"rhuk_milkyway\";i:94;s:20:\"rhuk_orange_smoothie\";i:95;s:12:\"simple_plain\";}s:4:\"show\";s:1:\"8\";s:3:\"zip\";s:3:\"zip\";}',2),(37,37,'N;',2),(38,38,'N;',0),(39,39,'a:1:{s:8:\"nav_type\";s:1:\"8\";}',0),(40,40,'a:1:{s:6:\"layout\";s:5:\"plain\";}',2),(41,41,'N;',2),(42,42,'N;',2),(43,43,'N;',2),(44,44,'a:3:{s:17:\"security_redirect\";s:0:\"\";s:10:\"login_dest\";s:7:\"sitemgr\";s:2:\"go\";s:0:\"\";}',2),(45,45,'a:1:{s:8:\"nav_type\";s:1:\"2\";}',0);
/*!40000 ALTER TABLE `egw_sitemgr_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_content_lang`
--

DROP TABLE IF EXISTS `egw_sitemgr_content_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_content_lang` (
  `version_id` int(11) NOT NULL,
  `lang` varchar(5) NOT NULL,
  `arguments_lang` text,
  PRIMARY KEY (`version_id`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_content_lang`
--

LOCK TABLES `egw_sitemgr_content_lang` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_content_lang` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_content_lang` VALUES (1,'de','<h3>\r\n	Welche Funktionen bietet der&nbsp;SiteManager?</h3>\r\n	<ul>\r\n		<li>\r\n			Erstellen und Ver&ouml;ffentlichen von Webseiten direkt in&nbsp;EGroupware</li>\r\n		<li>\r\n			Verwalten von Zugriffsrechten f&uuml;r Webseiten-Editoren</li>\r\n		<li>\r\n			Zugriffeinschränkungen von bestimmten Teilen einer Webseite auf registrierte Benutzer</li>\r\n		<li>\r\n			Inhalte unabh&auml;ngig vom Design verwalten</li>\r\n		<li>\r\n			Ver&ouml;ffentlichen von Inhalten anderer EGroupware Anwendungen wie z.B. Nachrichten, Dateien und Ordner aus dem Dateimanager, Kalender, Kontaktdaten aus dem Adressbuch ...</li>\r\n		<li>\r\n			Erstellen von Kontaktformularen und direktes Einf&uuml;gen von erhaltenen Kontaktdaten in das EGroupware Adressbuch</li>\r\n	</ul>\r\n'),(1,'en','<h3>\r\n	What can I do with SiteManager?</h3>\r\n<ul>\r\n	<li>\r\n		Create and publish websites directly in your EGroupware</li>\r\n	<li>\r\n		Manage access rights for website editors</li>\r\n	<li>\r\n		Limit / restrict parts of the website for registered users only</li>\r\n	<li>\r\n		Manage the content independently of the design</li>\r\n	<li>\r\n		Publish content of other EGroupware applications e.g. News, files and folders from FileManager, Calendar, Addressbook contact data...</li>\r\n	<li>\r\n		Create contact forms and receive data directly into EGroupware&#39;s address book</li>\r\n</ul>\r\n'),(2,'de','<h3>\r\n	Die Ansicht verf&uuml;gbarer Designvorlagen&nbsp;(Templates)</h3>\r\n<p>\r\n	Der SiteManager erzeugt Webseiten auf der Basis von Templates. Die meisten Templates bieten eine Vielzahl an M&ouml;glichkeiten, Bl&ouml;cke und Links zu anderen Seiten zu erstellen. Die hier gezeigten Beispiele stellen lediglich eine Auswahl dar. Alle verf&uuml;gbaren Templates werden in &quot;Konfiguration - Template ausw&auml;hlen&quot; angezeigt.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<h2>\r\n	EGroupware News</h2>\r\n'),(2,'en','<h3>\r\n	Preview available templates</h3>\r\n<p>\r\n	Most of the templates have much more options to create blocks and links to different places. This content is available for all templates, so there is only a minimum amount of content blocks as example. Preview available templates by selecting templates from the &quot;Choose Template&quot; block.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<h2>\r\n	EGroupware News</h2>\r\n'),(4,'de','<p>\r\n	Der Inhalt von Seiten kann hinzugef&uuml;gt oder bearbeitet werden, in dem entweder der Inhaltsmanager (Interface innerhalb von&nbsp;EGroupware) oder der Bearbeitungsmodus (&uuml;ber die definierte Webseite zug&auml;nglich) genutzt wird. Die Benutzeroberfl&auml;che ist in beiden F&auml;llen identisch. Die folgenden Punkte sind in den meisten Bl&ouml;cken verf&uuml;gbar:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Titel:</strong> Jeder Block definiert automatisch einen Default Titel (z.B. HTM Modul f&uuml;r einen HTML Block). Der Titel wird nicht zwangsl&auml;ufig in allen&nbsp;Inhaltsbereichen angezeigt, die Anzeige kann &uuml;ber CSS gesteuert werden - zum Beispiel durch das ausgew&auml;hlte Template. Wenn ein anderer Titel angegeben wird, wird dieser f&uuml;r den bearbeiteten Block genutzt. Der&nbsp;Titel darf nicht leer sein, daher im Zweifelsfall ein Leerzeichen eingeben.</li>\r\n	<li>\r\n		<strong>Sichtbar f&uuml;r:</strong> Der Default ist &quot;Jedermann&quot;. Die Sichtbarkeit der Bl&ouml;cke kann &uuml;ber die unterschiedlichen Benutzer&nbsp;-&quot;Rollen&quot; des Sitemanagers gesteuert werden: &quot;Webseiten Administratoren&quot;, &quot;EGroupware Benutzer&quot; (inklusive Administratoren) und der Benutzer &quot;anonymous&quot;.</li>\r\n	<li>\r\n		<strong>Sortierreihenfolge:</strong> Definiert die Reihenfolge der Bl&ouml;cke &uuml;ber die eingegebene Zahl (je gr&ouml;&szlig;er desto weiter unten).</li>\r\n	<li>\r\n		<strong>Anwendungsbereich:</strong> Zeigt alle Kategorien und Webseiten sowie webseitenweit an.</li>\r\n	<li>\r\n		<strong>Version und Status:</strong> Zeigt die aktuelle Version und den Status bezogen auf den Ver&ouml;ffentlichungs-Prozess an.</li>\r\n</ul>\r\n<p>\r\n	Beim Erstellen eines Inhaltsblocks generiert der SiteManager automatisch eine neue Versionsnummer f&uuml;r diesen Block. Es wird pro Block immer die h&ouml;chste Versionsnummer angezeigt. Jede Version kann unterschiedliche Block-Spezifikationen enthalten. Die Block-Spezifikationen k&ouml;nnen ganz verschiedene Informationen enthalten bzw. abfragen: Markierungsfelder, Auswahlboxen, URLs oder Textfelder.<br />\r\n	<br />\r\n	<strong>Vorhandene Bl&ouml;cke</strong><br />\r\n	Eine Liste aller verf&uuml;gbaren Bl&ouml;cke und Detail-Beschreibungen der am h&auml;ufigsten gebrauchten Bl&ouml;cke sind auf den folgenden Seiten beschrieben.</p>\r\n'),(4,'en','<p>\r\n	Page contents can be edited in using the content manager or the editing window that opens in editing mode. The opening interfaces for both options are identical. There are some standard interface elements editable for the most blocks:<br />\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<strong>Title:</strong> Each module defines a default title for the blocks it generates. The block title is not necessarily displayed in each content area. It depends on the block transformer defined for the content area by the site template you use. You can override the default title with a customized title that will be used only by the block you are editing. To have no title displayed insert a space.</li>\r\n	<li>\r\n		<strong>Seen by:</strong> The default is &quot;everybody&quot;. You can control the visibilities of each block for the different user roles defined by SiteManager<br />\r\n		(site &quot;administrators&quot;, &quot;EGroupware users&quot; (including site administrators) and the &quot;anonymous&quot; users.</li>\r\n	<li>\r\n		<strong>Sort Order:</strong> Change the order in which the blocks are displayed by defining a different integer for each block.</li>\r\n	<li>\r\n		<strong>Scope:</strong> shows all corresponding categories and pages or &quot;Site wide&quot;</li>\r\n	<li>\r\n		<strong>Version and state:</strong> shows the version number and the state belonging to the publishing work flow.</li>\r\n</ul>\r\n<p>\r\n	<strong>Creating a content block</strong><br />\n	SiteManager automatically generates a new&nbsp;version for the block. A block always shows the highest version. For each version you can edit all block specific arguments. Block specific arguments can be of different types e.g. check boxes, select boxes, URLs or text fields.<br />\r\n	<br />\r\n	<strong>Using different blocks</strong><br />\r\n	A list of all available blocks and the most common ones are described in detail on the next pages.</p>\r\n'),(6,'de','<p>\r\n	Der Inhaltsmanager macht keine Einschr&auml;nkungen, welche Bl&ouml;cke f&uuml;r welche Bereiche geeignet oder zul&auml;ssig sind. SiteManager Administratoren k&ouml;nnen die Verf&uuml;gbarkeit von Bl&ouml;cken in den einzelnen Bereichen (z.B. Inhaltsblock &quot;center&quot;) vorgeben bzw. einschr&auml;nken. So macht es zum Beispiel Sinn, dass f&uuml;r die Anzeige von Seiten-Bereichen optimierte Bl&ouml;cke (wie z.B. ein Navigationsblock) in den Seiten (links oder rechts) genutzt werden, w&auml;hrend der mittlere Bereich (Center) HTML-Bl&ouml;cke nutzen kann. Die folgenden Bl&ouml;cke werden mit dem EGroupware SiteManager ausgeliefert:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Addressbook_contactform:</strong> Erstellt ein Kontaktformular, das Kontakte in ein vorgegebenes EGroupware Adressbuch hinzuf&uuml;gt. Zus&auml;tzlich kann eine&nbsp;Mail-Benachrichtigung an die eingetragenen Email-Adressen erfolgen.</li>\r\n	<li>\r\n		<strong>Addressbook_display:</strong> Zeigt die Kontakte des ausgew&auml;hlten Adressbuchs an, zum Beispiel um Referenzen oder Mitgliederlisten anzuzeigen.</li>\r\n	<li>\r\n		<strong>Administration:</strong> Erstellt einen Link zum Inhaltsmanager und zum Abmelden an EGroupware. Zus&auml;tzlich wird eine Auswahlbox zum&nbsp;Umschalten zwischen Produktionsmodus, Entwurfsmodus und Bearbeitungsmodus angezeigt. Dieser Block sollte webseitenweit eingef&uuml;gt werden und nur sichtbar f&uuml;r Administratoren oder angemeldete Benutzer sein.</li>\r\n	<li>\r\n		<strong>Amazon:</strong> Zeigt B&uuml;cher-Anzeigen von der Amazon-Webseite an. Die Einstellungen sind im Block selbst beschrieben.</li>\r\n	<li>\r\n		<strong>Bookmarks:</strong> Zeigt den Inhalt (oder Teile) der Lesezeichen-Anwendung von EGroupware an.</li>\r\n	<li>\r\n		<strong>Calendar:</strong> Erzeugt den kleinen Navigations-Kalender, wobei Tage oder Wochen mit den anderen Kalender-Bl&ouml;cken (Listen, Planer oder Wochenansicht) verkn&uuml;pft werden k&ouml;nnen an.</li>\r\n	<li>\r\n		<strong>Calendar_list:</strong> Zeigt die Listen-Ansicht des Kalenders entsprechend den Vorgaben von Benutzer, Gruppen, Status-Filter und Kategorien an.</li>\r\n	<li>\r\n		<strong>Calendar_month:</strong> Zeigt die Mehrwochen- oder Monats-Ansicht des&nbsp;Kalenders entsprechend den Vorgaben von&nbsp;Benutzer, Gruppen, Status-Filter und&nbsp;Kategorien an.</li>\r\n	<li>\r\n		<strong>Calendar_planner:</strong> Zeigt die Planer-Ansicht des&nbsp;Kalenders entsprechend den Vorgaben von&nbsp;Benutzer, Gruppen, Status-Filter und&nbsp;Kategorien an. Hier stehen verschiedene Ansichtsm&ouml;glichkeiten zur Verf&uuml;gung: Jahresplaner, Planer nach Kategorien oder Planer nach Benutzer.</li>\r\n	<li>\r\n		<strong>Download:</strong> Zeigt Dateien und Verzeichnissen, die im EGroupware Dateimanager gespeichert sind, zum Download an. Zur Anzeige eines Verzeichnisses sieht der Pfad folgenderma&szlig;en aus: &quot;/home/meinVerzeichnis/&quot;. Der Webseiten-Leser kann dann im Download-Block zu allen Unterverzeichnissen browsen, wenn die Option in der Konfiguration des Blocks markiert ist.</li>\r\n	<li>\r\n		<strong>File contents:</strong> Bindet den Inhalt einer Datei entsprechend der eingegebenen URL (Webadresse) in die&nbsp;Webseite ein.</li>\r\n	<li>\r\n		<strong>Frame:</strong> Zeigt die angegebene Webadresse (URL) in einem sogenannten iframe mit der vorgegebenen H&ouml;he und Breite an.</li>\r\n	<li>\r\n		<strong>Gallery or gallery_image block:</strong> Zeigt Bilder oder unterschiedliche Bilder-Verzeichnisse der Gallery an. Dieser Block ben&ouml;tigt zwangsl&auml;ufig die Installation der Gallery-Anwendung.</li>\r\n	<li>\r\n		<strong>Google:</strong> Erzeugt ein&nbsp;Google-Suchfenster, das entweder auf der vorgegebenen Webseite oder im gesamten Internet sucht.</li>\r\n	<li>\r\n		<strong>HTML:</strong> Ein sehr wichtiger (und wohl am h&auml;ufigsten genutzter) Block, um neben Text und Bildern auch Tabellen, Aufz&auml;hlungen oder Numerierungen in eine&nbsp;Webseite einzustellen. Des Weiteren erm&ouml;glicht der HTML-Block das Hinzuf&uuml;gen von&nbsp;Links (Verkn&uuml;pfungen) zu anderen Webseiten oder Seiten innerhalb des SiteManagers.</li>\r\n	<li>\r\n		<strong>Lang_block:</strong> Zeigt entweder eine Auswahlbox der vorhanden Sprachen oder die zugeh&ouml;rigen Flaggen an.</li>\r\n	<li>\r\n		<strong>Login:</strong> Erzeugt einen&nbsp;Login-Block f&uuml;r&nbsp;EGroupware.</li>\r\n	<li>\r\n		<strong>Navigation:</strong> Erlaubt das Hinzuf&uuml;gen unterschiedlicher Navigationselemente, wie z.B. &quot;currentsection&quot; (Inhaltsverzeichnis der aktuellen Kategorie<i>)</i>, index_block, index oder sitetree (Javascript basierende Baumansicht). Eine Detail-Beschreibung befindet sich im zugeh&ouml;rigen Men&uuml;punkt.</li>\r\n	<li>\r\n		<strong>News_admin:</strong> Ver&ouml;ffentlicht Nachrichten, die mit der News-Anwendung von EGroupware verfasst wurden. Die anzuzeigenden Kategorien k&ouml;nnen ebenso wie der&nbsp;Inhalt konfiguriert werden.</li>\r\n	<li>\r\n		<strong>Phpbrain:</strong> Der neue Name der Anwendung ist im Englischen Knowledge Base - zu Deutsch Wissensdatenbank. Hiermit k&ouml;nnen Artikel der Wissensdatenbank auf der Webseite ver&ouml;ffentlicht werden.</li>\r\n	<li>\r\n		<strong>Redirect:</strong> Erzeugt eine&nbsp;&quot;Umleitung&quot; (redirection) zu einer anderen Webseite per vorgegebener URL. N&uuml;tzlich, um zum Beispiel eine externe Webseite in die Egroupware SiteManager Webseite einzubinden. Bei Nutzung dieses Blocks sollte kein weiterer Block auf dieser Seite eingebunden werden!</li>\r\n	<li>\r\n		<strong>Template:</strong> Erm&ouml;glicht &uuml;ber die Template-Gallery das&nbsp;Ver&auml;ndern des Layouts der erstellten Webseite. Gut geeignet f&uuml;r die Erstellung von&nbsp;Webseiten in Zusammenarbeit mit dem entsprechenden&nbsp;Kunden.</li>\r\n	<li>\r\n		<strong>Wiki:</strong> Zeigt mit EGroupware erstellte Wiki Artikel an. Der Block erlaubt den Webseiten-Lesern innerhalb der Artikel bzw. Wiki-Seiten &uuml;ber die Wiki-Links (Verkn&uuml;pfungen der Seiten untereinander) und die&nbsp;Wiki-Suche zu navigieren. Um Falsch-Interpretationen der&nbsp;URLs (mit Gro&szlig;- und Kleinschreibung) zu vermeiden, sollte in der Wiki-Konfiguration das&nbsp;Erzeugen von Wiki-Links &uuml;ber &quot;PrettyPrint&quot;-Schreibweise verhindert werden (Wiki Konfiguration, &quot;Wiki Links erlauben: Nein&quot;).</li>\r\n</ul>\r\n<p>\r\n	Dar&uuml;ber hinaus gibt es weitere Bl&ouml;cke, die speziell zum Testen oder f&uuml;r Entwickler vorhanden sind - hier aber nicht n&auml;her beschrieben werden.</p>\r\n'),(6,'en','<p>\r\n	The content manager does not impose any constraints which modules to be used for which area. Administrators can restrict the available modules for categories and content areas. For example use modules that are optimized for side block areas in the side areas and use a simple HTML content block on the central area. The following modules are shipped with SiteManager:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Addressbook_contactform:</strong> Creates a contact form which adds contacts directly into the selected EGroupware&nbsp;Addressbook and sends a notification via email to the given email addresses.</li>\r\n	<li>\r\n		<strong>Addressbook_display:</strong> Shows the contacts of the selected Addressbook, e.g for references or subscribed members.</li>\r\n	<li>\r\n		<strong>Administration:</strong> Creates a link to SiteManager&#39;s administration interface - a useful link for EGroupware users or administrators.</li>\r\n	<li>\r\n		<strong>Amazon:</strong> Shows ads for books on the Amazon website. Look at the modules source file for more details.</li>\r\n	<li>\r\n		<strong>Bookmarks:</strong> Shows contents of&nbsp;EGroupware&#39;s bookmark application.</li>\r\n	<li>\r\n		<strong>Calendar:</strong> Produces the small navigation calendar with each days linked to EGroupware&#39;s&nbsp;Calendar application (list, month or planner view).</li>\r\n	<li>\r\n		<strong>Calendar_list:</strong> Shows the list view of the Calendar of the selected users or groups and categories.</li>\r\n	<li>\r\n		<strong>Calendar_month:</strong> Shows the month or several weeks of the selected users or groups and categories.</li>\r\n	<li>\r\n		<strong>Calendar_planner:</strong> Shows the planner of the selected users or groups and categories. There are different modes possible for yearly planner, planner by category or planner by user.</li>\r\n	<li>\r\n		<strong>Download:</strong> Create links to files and directories stored in EGroupware&#39;s&nbsp;Filemanager with the <strong>download block</strong>. To display a folder the used path should be &quot;/home/yourfolder/&quot;. The user will be able to navigate all&nbsp;sub-folders as well if this is selected.</li>\r\n	<li>\r\n		<strong>File contents:</strong> Includes the content of a file on the web server into the website.</li>\r\n	<li>\r\n		<strong>Frame</strong>: Shows the given URL in an iFrame with the given width and height.</li>\r\n	<li>\r\n		<strong>Gallery or gallery_image block:</strong> Shows images or different image folders. To use this module the installation of the gallery application is needed.</li>\r\n	<li>\r\n		<strong>Google:</strong> Displays a form for querying the Google web site.</li>\r\n	<li>\r\n		<strong>HTML:</strong> An important module to add text and images as simply as tables, listings, numerations or links to other pages (in the SiteManager or to other websites).</li>\r\n	<li>\r\n		<strong>Lang_block:</strong> Displays a select box for changing the user&#39;s site language.</li>\r\n	<li>\r\n		<strong>Login:</strong> Displays a login block for log in to your EGroupware.</li>\r\n	<li>\r\n		<strong>Navigation:</strong> Allows to add different modes of navigation like current section, site index, index or side tree. Look at the corresponding menu items for more details.</li>\r\n	<li>\r\n		<strong>News_admin:</strong> Publishes news coming from EGroupware&#39;s&nbsp;News Admin application. The categories to be displayed can be configured as well as the content.</li>\r\n	<li>\r\n		<strong>Phpbrain:</strong> The newer name for phpbrain is Knowledge Base, so its possible to show there articles from Egroupware&#39;s Knowledge Base.</li>\r\n	<li>\r\n		<strong>Redirect:</strong> Creates a redirection&nbsp;to another URL, useful to link an entry in your menus to a page outside your SiteManager site. Using this module you should not put any other blocks on the same page.</li>\r\n	<li>\r\n		<strong>Template:</strong> Enables website visitors to change the layout-template, great for designing websites together with the customer.</li>\r\n	<li>\r\n		<strong>Wiki:</strong> Displays Wiki articles. It allows the website reader to navigate all articles using the links and provides a Wiki search. To avoid a misinterpretation of URLs containing capital letters please disable Wiki links (Wiki site configuration, &quot;enable Wiki links: no&quot;).</li>\r\n</ul>\r\n<p>\r\n	More modules useful for development or testing issues are available.</p>\r\n'),(7,'de','<p>\r\n	Der HTML-Block ist sehr wichtiger und wahrscheinlich der am h&auml;ufigsten genutzte Block, um neben Text und Bildern auch Tabellen, Aufz&auml;hlungen oder Numerierungen in eine&nbsp;Webseite einzuf&uuml;gen. Des Weiteren erm&ouml;glicht der HTML-Block das Erstellen von Links (Verkn&uuml;pfungen) zu anderen Webseiten oder Seiten innerhalb des SiteManagers.</p>\r\n<h3>\r\n	Text und Bilder&nbsp;hinzuf&uuml;gen</h3>\r\n<p>\r\n	<img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/ralfbecker.jpeg\" style=\"width: 133px; height: 200px;\" /><br />\r\n	&nbsp;</p>\r\n<p>\r\n	Ralf Becker<br />\r\n	Gesch&auml;ftsf&uuml;hrer Software Entwicklung<br />\r\n	Stylite AG</p>\r\n<br />\r\n<h3>\r\n	Tabelle hinzuf&uuml;gen</h3>\r\n<table align=\"left\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 400px;\">\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"row\">\r\n				&nbsp;</th>\r\n			<th scope=\"col\">\r\n				&nbsp;</th>\r\n			<th scope=\"col\">\r\n				&nbsp;</th>\r\n			<th scope=\"col\">\r\n				&nbsp;</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">\r\n				&nbsp;</th>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">\r\n				&nbsp;</th>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n<br />\r\n<h3>\r\n	<br />\r\n	Link (Verkn&uuml;pfung) hinzuf&uuml;gen</h3>\r\n<p>\r\n	<a href=\"http://www.egroupware.org\" target=\"_blank\">www.egroupware.org</a><br />\r\n	&nbsp;</p>\r\n<h3>\r\n	Aufz&auml;hlung oder Nummerierung hinzuf&uuml;gen</h3>\r\n<ul>\r\n	<li>\r\n		Addressbook</li>\r\n	<li>\r\n		InfoLog</li>\r\n	<li>\r\n		Calendar</li>\r\n</ul>\r\n<ol>\r\n	<li>\r\n		Day view</li>\r\n	<li>\r\n		Week view</li>\r\n	<li>\r\n		Month view</li>\r\n</ol>\r\n'),(7,'en','<p>\r\n	The HTML-block is an important module to add text and images as simply as tables, listings, numerations or links to other pages (in the&nbsp;SiteManager or to other websites).</p>\r\n<h3>\r\n	Add text and images</h3>\r\n<p>\r\n	<img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/ralfbecker.jpeg\" style=\"width: 133px; height: 200px;\" /><br />\r\n	&nbsp;</p>\r\n<p>\r\n	Ralf Becker<br />\r\n	Manager of software development<br />\r\n	Stylite AG</p>\r\n<br />\r\n<h3>\r\n	Add tables</h3>\r\n<table align=\"left\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 400px;\">\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"row\">\r\n				&nbsp;</th>\r\n			<th scope=\"col\">\r\n				&nbsp;</th>\r\n			<th scope=\"col\">\r\n				&nbsp;</th>\r\n			<th scope=\"col\">\r\n				&nbsp;</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">\r\n				&nbsp;</th>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">\r\n				&nbsp;</th>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />\r\n<br />\r\n<h3>\r\n	<br />\r\n	Add links</h3>\r\n<p>\r\n	<a href=\"http://www.egroupware.org\" target=\"_blank\">www.egroupware.org</a><br />\r\n	&nbsp;</p>\r\n<h3>\r\n	Add lists</h3>\r\n<ul>\r\n	<li>\r\n		Addressbook</li>\r\n	<li>\r\n		InfoLog</li>\r\n	<li>\r\n		Calendar</li>\r\n</ul>\r\n<ol>\r\n	<li>\r\n		Day view</li>\r\n	<li>\r\n		Week view</li>\r\n	<li>\r\n		Month view</li>\r\n</ol>\r\n<br />\r\n<br />\r\n<br />\r\n'),(8,'de','<p>\r\n	Nutzen Sie die <strong>Kalender Bl&ouml;cke</strong>, um einen EGroupware Kalender auf der Webseite anzuzeigen. Der Block kann zum Beispiel hilfreich sein, wenn man die Verf&uuml;gbarkeit von Ressourcen oder die Jahresplanung eines Vereins (wie im Bild unten gezeigt)ufzeigen m&ouml;chte.</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/calendar_year.png\" style=\"width: 705px; height: 464px; \" /><br />\r\n	&nbsp;</p>\r\n'),(8,'en','<p>\r\n	Use the <strong>calendar blocks</strong> to display the Calendar of EGroupware on the website. This block is helpful to e.g. show the availability of resources or the yearly planner of a club (image below).</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/calendar_year.png\" style=\"width: 100%; \" /><br />\r\n	&nbsp;</p>\r\n'),(9,'de','<p>\r\n	Das <strong>Adressbuch Kontaktformular</strong> erstellt ein Kontaktformular, das Kontakte in ein vorgegebenes EGroupware Adressbuch hinzuf&uuml;gt. Im Beispiel unterhalb werden die Adressen in das Adressbuch der Default-Gruppe hinzugef&uuml;gt. Zus&auml;tzlich kann eine&nbsp;Mail-Benachrichtigung an die eingetragenen Email-Adressen erfolgen. Im Block wird ausgew&auml;hlt, welche Felder vom Webseiten-Leser ausgef&uuml;llt werden sollen bzw. m&uuml;ssen. Im Beispiel unten sind nur Name und Email-Adresse von Interesse, eine abweichende Konfiguration ist im Block selbst m&ouml;glich.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Der zweite Adressbuch Block (addressbook_display) zeigt die Kontakte eines vorgegebenen Adressbuchs, z.B. um Referenzen oder Mitgliederlisten zu ver&ouml;ffentlichen.</p>\r\n'),(9,'en','<p>\r\n	The <strong>Addressbook contact form</strong> creates a contact form, which adds contacts directly into the selected EGroupware Addressbook (done below for the Default group) and sends a notification via email to the given email addresses.<br />\r\n	Choose which fields to be filled out by the website reader. In the example of the contact form below just the name and the email address are of interest, different configurations are available in the block.<br />\r\n	<br />\r\n	The second Adressbook block (addressbook_display) shows the contacts of a given Addressbook, e.g for references or subscribed members.</p>\r\n'),(11,'de','<p>\r\n	Ver&ouml;ffentlichung von News aus der Nachrichten-Anwendung von&nbsp;EGroupware auf der Webseite. Sowohl die Kategorie als auch der Inhalt (z.B. Headline mit Link, Anrei&szlig;er und Inhalt) k&ouml;nnen im Block eingestellt werden.&nbsp;</p>\r\n<p>\r\n	Das Beispiel unterhalb zeigt die Nachrichten von www.egroupware.org</p>\r\n<p>\r\n	&nbsp;</p>\r\n<h2>\r\n	EGroupware News</h2>\r\n'),(11,'en','<p>\r\n	Publish the news of&nbsp;EGroupware&#39;s&nbsp;News Admin application on your website. The categories to be displayed can be configured as well as the content. .</p>\r\n<p>\r\n	The Examples below are news of www.egroupware.org</p>\r\n<p>\r\n	&nbsp;</p>\r\n<h2>\r\n	EGroupware News</h2>\r\n'),(14,'de','<p>\r\n	Erstellen von Links zu Dateien und Verzeichnissen, die im EGroupware Dateimanager gespeichert sind. Zur Anzeige eines Verzeichnisses sieht der Pfad folgenderma&szlig;en aus: &quot;/home/meinVerzeichnis/&quot;. Der Webseiten-Leser kann dann im Download-Block zu allen Unterverzeichnissen browsen, wenn dieses in der Konfiguration des Blocks als Option markiert ist. Es ist sicherzustellen, dass der Benutzer &quot;anonymous&quot; Zugriff auf die Anwendung des Dateimanagers und mindestens Leserecht auf die entsprechenden Verzeichnisse hat. F&uuml;r nicht-&ouml;ffentliche Webseiten (z.B. eine Intranet-Seite) ist es nicht notwendig, Berechtigungen f&uuml;r den Benutzer &quot;anonymous&quot; zu vergeben.</p>\r\n<p>\r\n	<a href=\"http://sitemgr.egroupware.de/?page_name=add_file_manager\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/downloads.png\" style=\"width: 561px; height: 396px; \" /></a></p>\r\n<p>\r\n	&nbsp;</p>\r\n'),(14,'en','<p>\r\n	Create&nbsp;links to files&nbsp;and&nbsp;directories stored in&nbsp;EGroupware&#39;s&nbsp;Filemanager with the <strong>download block</strong>. To display a folder the used path should be &quot;/home/yourfolder/&quot;. The user will be able to navigate all sub-folders as well if this is selected. Make sure the Filemanager application is activated for the anonymous user and that the anonymous user has the needed Filemanager (read) permissions for the folders which should be displayed. For non-public web sites, there is no need to give permissions to the anonymous user.</p>\r\n<p>\r\n	<a href=\"http://sitemgr.egroupware.de/?page_name=add_file_manager\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/downloads.png\" style=\"width: 561px; height: 396px; \" /></a></p>\r\n'),(16,'de','<h3>\r\n	Die am h&auml;ufigsten genutzten Navigationselemente sind</h3>\r\n<ul>\r\n	<li>\r\n		<strong>Current section:</strong> Zeigt das Inhaltsverzeichnis der aktuellen Kategorie an, z.B. alle enthaltenen Seiten und Unterkategorien.</li>\r\n	<li>\r\n		<strong>Index_block:</strong> Zeigt das Inhaltsverzeichnis der kompletten Webseite an, optimiert f&uuml;r die Seitenbereiche (links oder rechts).</li>\r\n	<li>\r\n		<strong>Index:</strong> Wird automatisch mit dem &quot;index GET parameter&quot; genutzt, ben&ouml;tigt daher keine weiteren Parameter. Kann gut als&nbsp;Gesamtindex&nbsp;der&nbsp;Webseite in den mittleren Block (Center) eingebaut werden.</li>\r\n	<li>\r\n		<strong>Site Tree:</strong> Javascript basierende Baumansicht, die sich als Navigationsmen&uuml; in den Seitenbereichen der Webseite eignet.</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Inhaltsverzeichnis der kompletten&nbsp;Webseite / Gesamtindex:</h3>\r\n'),(16,'en','<h3>\r\n	The most common navigation elements are</h3>\r\n<ul>\r\n	<li>\r\n		<strong>Current section:</strong> Produces an index of the pages in the current section.</li>\r\n	<li>\r\n		<strong>Index_block:</strong> An index of the entire site, formatted for peripheral areas of your website.</li>\r\n	<li>\r\n		<strong>Index:</strong> Is automatically used with the index GET parameter. You probably would not have to use this block otherwise.</li>\r\n	<li>\r\n		<strong>Site Tree:</strong> Displays an arboreal menu to the website.</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Index block:</h3>\r\n'),(19,'de','<p>\r\n	Der SiteManager organisiert die Inhalte einer Webseite mit Hilfe von Kategorien und Seiten.</p>\r\n	<p>\r\n		Die Kategorien k&ouml;nnen andere Unterkategorien beinhalten, wobei die Unterkategorien der Hauptkategorie hierarchisch untergeordnet werden. Jede Kategorie kann au&szlig;erdem Seiten beinhalten. Lediglich auf dem h&ouml;chsten&nbsp;Level k&ouml;nnen keine Seiten erstellt werden, dort muss zun&auml;chst mindestens eine&nbsp;Kategorie angelegt werden.</p>\r\n	<p>\r\n		Die Seiten zeigen mit Hilfe von Bl&ouml;cken den Inhalt der&nbsp;Webseite. Die Bl&ouml;cke k&ouml;nnen auf lediglich dieser&nbsp;Seite, in der ganzen Kategorie oder auf der gesamten Internetseite sichtbar sein.<br />\r\n		<br />\r\n		Die folgenden Punkte beschreiben das&nbsp;Erstellen, Hinzuf&uuml;gen und Bearbeiten von Kategorien und Seiten:</p>\r\n	<ul>\r\n		<li>\r\n			<strong>Erstellen einer neuen&nbsp;Kategorie:</strong> Nutzen Sie den Inhaltsmanager oder den Bearbeitungsmodus, um eine neue Kategorie zu erstellen. In den Bearbeitungsmodus gelangen Sie &uuml;ber &quot;Webseite bearbeiten&quot; im Hauptmen&uuml; des SiteManagers oder wenn f&uuml;r Sie verf&uuml;gbar durch Auswahl des Bearbeitungsmodus direkt im Administrationsblock. Zum Erstellen einer neuen Kategorie zuerst im Navigationsblock auf &quot;Gesamtindex&quot; klicken. Dort f&uuml;hrt Sie der Klick auf den Icon neben dem Text &quot;Seite: Website Inhaltsverzeichnis&quot; zum Erstellen bzw. Bearbeiten der Kategorie (yourdomain//index.php?menuaction=sitemgr.Categories_UI.edit).</li>\r\n		<li>\r\n			<strong>Bearbeiten einer Kategorie:</strong> Gehen Sie in den Bearbeitungsmodus (siehe oben) und klicken Sie auf &quot;Kategorie bearbeiten&quot; neben dem&nbsp;Kategorienamen. Hier k&ouml;nnen Sie folgende Parameter bearbeiten:\r\n			<ul>\r\n				<li>\r\n					Kategoriename: Wird in der Navigation&nbsp;angezeigt.</li>\r\n				<li>\r\n					Sortierreihenfolge: Wird von der Navigation zur Sortierung der Kategorien genutzt.</li>\r\n				<li>\r\n					&Uuml;bergeordnet: Eine leere &uuml;bergeordnete Kategorie bedeutet es handelt sich um eine Hauptkategorie. Zum Umwandeln einer&nbsp;Kategorie in eine Unterkategorie wird die &uuml;bergeordnete Kategorie (auch Elternkategorie genannt) hier ausgew&auml;hlt.</li>\r\n				<li>\r\n					Kategoriebeschreibung: Wird in der Navigation als zus&auml;tzliche Information (Tooltip) genutzt, sobald sich der Mauszeiger &uuml;ber der Kategorie befindet.</li>\r\n				<li>\r\n					Inhaltsverzeichnis: Welche Seite soll als Inhaltsverzeichnis der Kategorie angezeigt werden?<br />\r\n					Die Default Einstellung ist ein &quot;automatisches Inhaltsverzeichnis&quot;, d.h. es werden alle Unterkategorien und Seiten als Inhalt angezeigt. Alternativ kann eine einzelne Seite als Inhaltsverzeichnis ausgew&auml;hlt werden, d.h. beim Klicken auf die Kategorie wird die Seite direkt angezeigt.</li>\r\n				<li>\r\n					Status: Kategorien sind Teil des&nbsp;Ver&ouml;ffentlichungs-Prozesses, d.h. Sie k&ouml;nnen eine Kategorie mit Seiten und Bl&ouml;cken erstellen und&nbsp;&uuml;ber die Kategorie steuern, ab wann die Kategorie produktiv bzw. sichtbar sein soll.</li>\r\n				<li>\r\n					Zugriffsrechte: Setzen Sie die Zugriffsrechte (lesen/schreiben) auf Gruppen- und Benutzerebene (f&uuml;r &ouml;ffentliche Seiten benutzen Sie den Benutzer &quot;anonymous&quot;).</li>\r\n			</ul>\r\n		</li>\r\n		<li>\r\n			<strong>L&ouml;schen einer Kategorie:</strong> Klicken Sie auf den L&ouml;schen Button neben der Kategorie. Stellen Sie sicher, dass Sie keine der zugeordneten Seiten mehr ben&ouml;tigen.</li>\r\n		<li>\r\n			<strong>Hinzuf&uuml;gen einer neuen Seite:</strong> Klicken Sie auf den &quot;Seite zur Kategorie hinzuf&uuml;gen&quot; Icon neben der&nbsp;Kategorie im Gesamtindex des Bearbeitungsmodus (siehe oben).</li>\r\n		<li>\r\n			<strong>Bearbeiten einer Seite:</strong> Klicken Sie im Bearbeitungsmodus (siehe oben) auf &quot;Seite bearbeiten&quot; neben dem Seitennamen. Hier k&ouml;nnen Sie folgende Parameter bearbeiten:\r\n			<ul>\r\n				<li>\r\n					Name: Wird als ID f&uuml;r die URL (?page_name=...) genutzt.</li>\r\n				<li>\r\n					Titel: Wird in der Navigation und im Block angezeigt.</li>\r\n				<li>\r\n					Untertitel: Wird im Block angezeigt.</li>\r\n				<li>\r\n					Sortierreihenfolge: Definiert die Reihenfolge der Bl&ouml;cke.</li>\r\n				<li>\r\n					Kategorie: Wo soll die Seite sichtbar sein und welche Zugriffsrechte sollen angewendet werden?</li>\r\n				<li>\r\n					Status: Betrifft den Ver&ouml;ffentlichungs-Prozess.</li>\r\n				<li>\r\n					Markierungsfeld: &quot;Hier ausw&auml;hlen, um eine Seite im Inhaltsverzeichnis nicht anzuzeigen.&quot; Wenn markiert, wird die Seite in der Navgation unterdr&uuml;ckt.</li>\r\n			</ul>\r\n		</li>\r\n		<li>\r\n			<strong>Bearbeiten des Seiteninhalts:</strong> Es gibt zwei Oberfl&auml;chen zum Erstellen und Bearbeiten von Inhaltsbl&ouml;cken: den Inhaltsmanager, welcher im Interface von&nbsp;EGroupware arbeitet, sowie den Bearbeitungsmodus, welcher in Interaktion mit der generierten Webseite arbeitet.\r\n			<ul>\r\n				<li>\r\n					<strong>Inhaltsmanager:</strong> Die Benutzeroberfl&auml;che zum Erstellen eines Blocks ist immer gleich, egal ob ein Block nur auf einer Seite, einer Kategorie oder webseitenweit sichtbar ist. Sichtbar sind immer alle Bl&ouml;cke des aktuellen Bereichs (z.B. der aktuellen Seite) und die Bl&ouml;cke der &uuml;bergeordneten Ebenen (z.B. der zugeh&ouml;rigen Kategorie bzw. webseitenweit).<br />\r\n					Im Inhaltsmanager gibt es unterschiedliche Bereiche, in denen Bl&ouml;cke hinzugef&uuml;gt werden k&ouml;nnen. Die Bl&ouml;cke k&ouml;nnen aus einer Liste der verf&uuml;gbaren Bl&ouml;cke ausgew&auml;hlt werden, welche von der Administration konfiguriert werden kann. Sobald ein neuer Block erstellt wird, wird er zusammen mit den anderen bereits angelegten Bl&ouml;cken angezeigt. Bl&ouml;cke des aktuellen Bereichs (Seite, Kategorie oder webseitenweit) sind durch Anklicken des Bearbeiten-Icons bearbeitbar. Bl&ouml;cke, die zu einer &uuml;bergeordneten Ebene (z.B. Kategorie) geh&ouml;ren, k&ouml;nnen nur auf der entsprechenden Ebene bearbeitet werden (d.h. beim Anzeigen der entsprechenden Kategorie).</li>\r\n				<li>\r\n					<strong>Bearbeitungsmodus:</strong> Um den Bearbeitungsmodus nutzen zu k&ouml;nnen, muss ein Administrations-Block hinzugef&uuml;gt werden - am Besten webseitenweit und nur sichtbar f&uuml;r angemeldete Benutzer oder Administratoren. Der Block stellt eine Auswahlbox zur Verf&uuml;gung, mit der zwischen Produktionsmodus (zeigt die produktive&nbsp;Webseite an), Entwurfsmodus und Bearbeitungsmodus umgeschaltet werden kann. Im Bearbeitungsmodus sind die identischen Bl&ouml;cke vorhanden wie im Entwurfsmodus, es wird aber zus&auml;tzlich am Kopf der Icon zum Bearbeiten des Blocks angezeigt. Das Bearbeiten-Fenster wird immer als Popup ge&ouml;ffnet, egal ob es sich um Kategorien, Seiten oder Bl&ouml;cke handelt.</li>\r\n			</ul>\r\n		</li>\r\n	</ul>\r\n'),(19,'en','<p>\r\n	The content inside a SiteManager&nbsp;website is organised using categories and pages. Categories may contain other categories, creating a hierarchical category-tree. Each category may contain pages, too. At the top-level (the site) you cannot create pages, you have to create at least one category first. Pages themselves contain the content, provided by the blocks, which may be visible for the page only, for the category or for the entire site (site-wide).<br />\r\n	<br />\r\n	<br />\r\n	To structure a website the SiteManager uses categories and pages. The content itself is regularly added using blocks. The following points show how to create, add and edit categories or pages:</p>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<strong>Create a new category:</strong> In order to create a new category use the content manager, respectively edit mode. Access this mode using &quot;edit site&quot; from the general menu or switching to edit mode if you have an administration module available in your website. To create a new category click &quot;view full index&quot; inside the navigation module first and then click the small icon next to &quot;site index&quot; to get to yourdomain//index.php?menuaction=sitemgr.Categories_UI.edit.</li>\r\n	<li>\r\n		<strong>Edit a category:</strong> Access the edit mode (see above) and click on &quot;edit category&quot; next to the category name. Edit:\r\n		<ul>\r\n			<li>\r\n				Category Name: Shown in navigation elements.</li>\r\n			<li>\r\n				Sort order: Relevant for navigation elements.</li>\r\n			<li>\r\n				Parent: Use to change this category into a subcategory of the chosen parent-category.</li>\r\n			<li>\r\n				Category description: Used in navigation elements as additional information.</li>\r\n			<li>\r\n				Index: Which page should be displayed as the index of the category? Default is an &quot;automatic index&quot;.</li>\r\n			<li>\r\n				State: Categories are part of the publishing work flow.</li>\r\n			<li>\r\n				Permissions: Set the permissions (read/write) on group- and user-level (for a public site use anonymous).</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<strong>Delete a category:</strong> Press the delete button next to the category. Make sure you don&#39;t need any of the associated pages anymore.</li>\r\n	<li>\r\n		<strong>Create a new page:</strong> Looking on the full index in edit mode (see above) click the &quot;add page to category&quot; icon next to the category.</li>\r\n	<li>\r\n		<strong>Edit a page:</strong> Access the edit mode (see above) and click on &quot;edit page&quot; next to the page name. Edit:\r\n		<ul>\r\n			<li>\r\n				Name: Used as an ID and for the URL (?page_name=...).</li>\r\n			<li>\r\n				Title: Displayed in navigation modules and in the block.</li>\r\n			<li>\r\n				Subtitle: Displayed in the block.</li>\r\n			<li>\r\n				Sort order: Define the order of the blocks.</li>\r\n			<li>\r\n				Category: Where should this page be visible and which access permissions should be applied?</li>\r\n			<li>\r\n				State: Concerning the publishing work flow.</li>\r\n			<li>\r\n				Check box to hide from condensed site index: The site is hidden in all navigation elements if checked.</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<strong>Editing page content:</strong> There are two interfaces for creating and editing content blocks. The first one is called &ldquo;content manager&rdquo; and works inside the EGroupware interface, the second works in interaction with the generated website and is called &ldquo;editing mode&rdquo;.\r\n		<ul>\r\n			<li>\r\n				<strong>The content manager:</strong> The interface for creating content blocks is the same on each level of scope, besides that when editing blocks on a lower level you can see all the blocks that have been defined on a higher level. They will be displayed on the website together with the blocks you are editing.<br />\r\n				In each content manager, there is a section for each content area to add blocks selected from a menu of all available blocks. Once a new block is added it appears amidst all other blocks of the content area.&nbsp;Those pertaining to the scope (site-wide, category or page) you are managing are editable. Those defined on higher level scopes are only displayed (viewed).</li>\r\n			<li>\r\n				<strong>Editing mode:</strong> In order to use editing mode add a site-wide administration block to your website (viewable only by registered users). This block has a drop down menu to switch between &quot;production mode&quot; (viewing the web site in its public state), &quot;draft mode&quot; (viewing the web site in the prepublished state - means you only see prepublished elements, no draft-status or archived) and &quot;edit mode&quot;. In edit mode the same contents as in draft mode and draft-status elements are displayed, but in front of each content block you find a link &ldquo;edit block&rdquo; to pop up a new window for editing the content (category, page or block).</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n'),(20,'de','<h3>\r\n	Auswahl eines Templates zur &Auml;nderung des Layout der Webseite &uuml;ber die Template Gallerie</h3>\r\n<ul>\r\n	<li>\r\n		Zur Auswahl und Beschaffung eines Templates (Installation auf eigenem Server) nutzen Sie den folgenden Link auf http://www.egroupware.org/sitemgr.</li>\r\n	<li>\r\n		Alle Templates sind in den Stylite&nbsp;EGroupware Hosting Paketen bereits enthalten:\r\n		<ul>\r\n			<li>\r\n				<a href=\"http://www.stylite.de/egroupware_hosting\" target=\"_blank\">EGroupware Hosting</a></li>\r\n			<li>\r\n				<a href=\"http://www.stylite.de/egroupware_hosting_plus_email\" target=\"_blank\">EGroupware Hosting + email</a></li>\r\n			<li>\r\n				<a href=\"http://www.stylite.de/egroupware_special_offers\" target=\"_blank\">Special offers: eFAMILY&nbsp;and&nbsp;FLAT|RATE for schools, universities, NGOs...</a></li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n'),(20,'en','<h3>\r\n	Selecting templates from the template gallery</h3>\r\n<ul>\r\n	<li>\r\n		To purchase templates (own installation) follow the link at http://www.egroupware.org/sitemgr.</li>\r\n	<li>\r\n		All templates are included to Stylite EGroupware Hosting packages:\r\n		<ul>\r\n			<li>\r\n				<a href=\"http://www.stylite.de/egroupware_hosting\" target=\"_blank\">EGroupware Hosting</a></li>\r\n			<li>\r\n				<a href=\"http://www.stylite.de/egroupware_hosting_plus_email\" target=\"_blank\">EGroupware Hosting + email</a></li>\r\n			<li>\r\n				<a href=\"http://www.stylite.de/egroupware_special_offers\" target=\"_blank\">Special offers: eFAMILY&nbsp;and&nbsp;FLAT|RATE for schools, universities, NGOs...</a></li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n'),(21,'de','<p>\r\n	Die neue Template Gallery im EGroupware&nbsp;SiteManager erlaubt die Nutzung von vielen Joomla&nbsp;Templates. Die folgenden Templates empfehlen wir f&uuml;r die Nutzung in den Bereichen</p>\r\n<h3>\r\n	Unternehmens Darstellung (z.B. Intranet oder Internet)</h3>\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_zibal\"><strong>JA&nbsp;Zibal</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_zibal\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Zibal.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_lolite\"><strong>JA&nbsp;Iolite</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_iolite\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Iolite.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_mageia\"><strong>JA&nbsp;Mageia</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_mageia\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Mageia.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_sulfur\"><strong>JA&nbsp;Sulfur</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_sulfur\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Sulfur.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Webseite eines Vereins oder von sozialen Einrichtungen</h3>\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_halite\"><strong>JA&nbsp;Halite</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_halite\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Halite.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_purity\"><strong>JA&nbsp;Purity</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_purity\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Purity.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Pers&ouml;nliche Webseite (z.B.&nbsp;blog)</h3>\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_zinc\"><strong>JA&nbsp;Zinc</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_zinc\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Zinc.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_olyra\"><strong>JA&nbsp;Olyra</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_olyra\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Olyra.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>'),(21,'en','<p>\r\n	The new template engine within EGroupware allows to use several Joomla templates. The following templates are recommended to use for the purpose of</p>\r\n<h3>\r\n	Company website (e.g. Intranet or Internet)</h3>\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_zibal\"><strong>JA&nbsp;Zibal</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_zibal\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Zibal.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_lolite\"><strong>JA&nbsp;Iolite</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_iolite\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Iolite.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_mageia\"><strong>JA&nbsp;Mageia</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_mageia\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Mageia.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_sulfur\"><strong>JA&nbsp;Sulfur</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_sulfur\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Sulfur.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Club or Society website</h3>\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_halite\"><strong>JA&nbsp;Halite</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_halite\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Halite.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_purity\"><strong>JA&nbsp;Purity</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_purity\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Purity.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Personal website (e.g.&nbsp;blog)</h3>\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_zinc\"><strong>JA&nbsp;Zinc</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_zinc\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Zinc.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_olyra\"><strong>JA&nbsp;Olyra</strong></a></p>\r\n				<p>\r\n					<a href=\"http://sitemgr.egroupware.de/?page_name=template&amp;themesel=ja_olyra\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/JA_Olyra.jpg\" style=\"width: 200px; height: 130px;\" /></a></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>'),(22,'de','<h3>\r\n	Template Gallery mit allen installierten Templates</h3>\r\n'),(22,'en','<h3>\r\n	Other installed templates:</h3>\r\n'),(25,'de','Umleitung zur Seite &quot;template&quot;. Die Seite &quot;templates&quot; kann in Umgebungen, in denen suchmaschinen-freundliche URLs verwendet werden zu dem Problem f&uuml;hren, dass stattdessen der Ordner &quot;sitemgr/sitemgr-site/templates&quot; angezeigt wird.'),(25,'en','Redirect to page &quot;template&quot;. The page &quot;templates&quot; could lead to the directory &quot;sitemgr/sitemgr-site/templates&quot; being displayed insted of the page in environments which make use of search engine friendly URLS are used.'),(26,'de','<h3>\r\n	Konfiguration des&nbsp;SiteManagers</h3>\r\n	<p>\r\n		Melden Sie sich als einer der Benutzer mit Administrationsrecht f&uuml;r die Webseite an. Gehen Sie dann auf den SiteManager und w&auml;hlen Sie &quot;SiteManager konfigurieren&quot;. Sie k&ouml;nnen nun folgende Parameter bez&uuml;glich der Pr&auml;sentation der Seite bearbeiten:<br />\r\n		&nbsp;</p>\r\n	<ul>\r\n		<li>\r\n			<strong>Webseiten Name (Mehrsprachig):</strong> Wird haupts&auml;chlich f&uuml;r Metadaten genutzt.</li>\r\n		<li>\r\n			<strong>Beschreibung der Webseite (Mehrsprachig):</strong> Wird haupts&auml;chlich f&uuml;r Metadaten genutzt.</li>\r\n		<li>\r\n			<strong>Standard Home Page (ID oder Name der Seite):</strong> Durch Auswahl einer Default Homepage wird die Seite ausgew&auml;hlt, mit der die Webseite sich &ouml;ffnet. Erst nach dem Erstellen mehrerer Seiten gibt es eine Auswahlm&ouml;glichkeit.</li>\r\n		<li>\r\n			<strong>Designvorlage ausw&auml;hlen:</strong> Auswahl der vom SiteManager angebotenen Designvorlagen f&uuml;r Webseiten.</li>\r\n		<li>\r\n			<strong>Sprachen, die der Benutzer ausw&auml;hlen kann:</strong> Sprachauswahl f&uuml;r multilinguale Webseiten, die das &Uuml;bersetzungs-Interface zum &Uuml;bersetzen des Seiteninhalts nutzen. Durch Einf&uuml;gen eines Auswahl-Men&uuml;s k&ouml;nnen Besucher Ihrer Webseite zwischen den verschiedenen Sprachen w&auml;hlen.</li>\r\n	</ul>\r\n'),(26,'en','<h3>\r\n	SiteManager configuration</h3>\r\n<p>\r\n	Log in as one of the users you gave administrator rights for the website. Go to the&nbsp;SiteManager&nbsp;application and select &quot;configure SiteManager&quot;. Set different values that affect how the&nbsp;site will be presented.<br />\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<strong>Site_name:</strong> Is used mainly for metadata.</li>\r\n	<li>\r\n		<strong>Site_description:</strong> Is used mainly for metadata.</li>\r\n	<li>\r\n		<strong>Default_home_page:</strong> Select the page that will show up first on your website. Evidently there won&#39;t be any choice until some pages have been created.</li>\r\n	<li>\r\n		<strong>Template_select:</strong> Choose between the different site designs that come with SiteManager.</li>\r\n	<li>\r\n		<strong>Site_languages:</strong> Select languages for a multilingual site to use the translation interface for translating the content. Insert a selection box on your website for visitors to choose between different languages.</li>\r\n</ul>\r\n'),(27,'de','<p>\r\n	Mit dem EGroupware SiteManager k&ouml;nnen mehrere Webseiten verwaltet und gestaltet werden. Der <a href=\"http://www.egroupware.org/egroupware/index.php?menuaction=wiki.wiki_ui.view&amp;page=SiteMgr\">SiteManager</a> erstellt w&auml;hrend der EGroupware Installation eine Default Webseite, aber Sie m&uuml;ssen diese wahrscheinlich f&uuml;r die eigenen Belange umdefinieren bzw. eine neue Webseite anlegen. Die Default Webseite enth&auml;lt die Inhalte (Kategorien, Seiten und Bl&ouml;cke), die Sie gerade sehen. Zum Anlegen einer neuen Webseite m&uuml;ssen Sie sich als Administrator in EGroupware anmelden. Dann gehen Sie in die Administration des SiteManagers und klicken den Link &quot;Webseite definieren&quot; an. Sie erhalten eine Auflistung aller vorhandenen Webseiten (wahrscheinlich nur die Default Webseite), die Sie bearbeiten k&ouml;nnen oder Sie f&uuml;gen eine neue Webseite hinzu.</p>\r\n<p>\r\n	Eine Webseite wird &uuml;ber die folgenden Parameter definiert:</p>\r\n<div>\r\n	<ul>\r\n		<li>\r\n			<strong>Webseiten Name:</strong> Der Name wird nicht in der Webseite selbst genutzt, sondern hilft, die Webseite in der Administrations-Oberfl&auml;che zu identifizieren.</li>\r\n		<li>\r\n			<strong>Dateisystem Pfad zum sitemgr-site Ordner:</strong> Wenn das sitemgr-site-Verzeichnis nicht verschoben wurde, erhalten Sie die korrekte Vorgabe automatisch.</li>\r\n		<li>\r\n			<strong>Webadresse zur sitemgr-site:</strong> Diese URL kann auch unver&auml;ndert bleiben, wenn die Webseite unter der vorgegeben<br />\r\n			URL angesprochen werden kann: <a href=\"http://www.egroupware.org/your.eGW.url/sitemgr/sitemgr-site\" target=\"_blank\">http:/your.eGW.url/sitemgr/sitemgr-site</a>. Wenn Sie eine andere (allgemein &uuml;blichere) Webseiten-Adresse nutzen wollen, m&uuml;ssen Sie entweder das sitemgr-site-Verzeichnis verschieben, einen Alias nutzen oder einen virtuellen Server in der Konfiguration Ihres Webservers eintragen.</li>\r\n		<li>\r\n			<strong>Anonymer Benutzer Username:</strong> Falls es nicht schon bei der Installation erfolgt ist legen Sie bitte im Administrationsmen&uuml; einen Benutzer an, der als Benutzer f&uuml;r den &ouml;ffentlichen Teil der Seite genutzt wird. Empfohlener Benutzername: &quot;anonymous&quot;</li>\r\n		<li>\r\n			<strong>Anonymer Benutzer Password:</strong> Das zugeh&ouml;rige Password f&uuml;r den Benutzer &quot;anonymous&quot;.</li>\r\n		<li>\r\n			<strong>Webseiten Administratoren:</strong> W&auml;hlen Sie Benutzer und/oder Gruppen aus, die Administrationsrechte f&uuml;r die<br />\r\n			Webseite haben sollen. Diese m&uuml;ssen nicht zwangsweise auch EGroupware Administratoren sein.</li>\r\n	</ul>\r\n</div>\r\n'),(27,'en','<p>\r\n	You can manage different websites with the SiteManager. The first thing to do is to define the new website. <a href=\"http://www.egroupware.org/egroupware/index.php?menuaction=wiki.wiki_ui.view&amp;page=SiteMgr\">SiteManager</a> defines a default website upon installation, but you will probably have to redefine it or add a new&nbsp;website. Log in as&nbsp;Egroupware&nbsp;administrator, go into EGroupware&#39;s admin application and choose &ldquo;define websites&rdquo; in the SiteManager&nbsp;section. In the now listed default website choose to edit it or add a new website.<br />\r\n	A website is defined by the following values:</p>\r\n<div>\r\n	<ul>\r\n		<li>\r\n			<strong>Site_name:</strong> This is not used on the website. The site name just helps identify a website inside the administration interface.</li>\r\n		<li>\r\n			<strong>Filesystem_path_to_sitemgr-site_directory:</strong> If the sitemgr-site-directory has not been moved this path can be left unchanged.</li>\r\n		<li>\r\n			<strong>URL_to_sitemgr-site:</strong> This URL can also be left unchanged if you want to access your public website with a URL that looks like <a href=\"http://www.egroupware.org/your.eGW.url/sitemgr/sitemgr-site\" target=\"_blank\">http:/your.eGW.url/sitemgr/sitemgr-site</a>. For a different URL either move the sitemgr-site- directory or use an alias or a virtual server in the&nbsp;webserver&#39;s configuration.</li>\r\n		<li>\r\n			<strong>Anonymous_user&#39;s_username:</strong> The account name you created above.</li>\r\n		<li>\r\n			<strong>Anonymous_user&#39;s_password:</strong> The corresponding password for the anonymous user.</li>\r\n		<li>\r\n			<strong>Site_administrators:</strong> Choose the users and/or groups that should have administrator rights for the website. They do not have to be adminstrators in EGroupware&#39;s sense.</li>\r\n	</ul>\r\n</div>\r\n'),(28,'de','<h3>\r\n	H&auml;ufige Fragen zum&nbsp;SiteManager</h3>\r\n<ul>\r\n	<li>\r\n		<strong>Wie verschiebt man die erzeugte Webseite in das Wurzelverzeichnis (docroot) des Webservers?</strong>\r\n		<ul>\r\n			<li>\r\n				Kopieren Sie das &#39;sitemgr-site&#39;-Verzeichnis in die docroot, z.B.<br />\r\n				cd egroupware/sitemgr/sitemgr-site; cp -r * ../../..</li>\r\n			<li>\r\n				Bearbeiten Sie die (in das&nbsp;docroot) kopierte &#39;config.inc.php&#39; Datei und &auml;ndern Sie den &#39;phpgw_path&#39;&nbsp;(Pfad), sodass er auf das EGroupware-Installations-Verzeichnis (z.B. &#39;egroupware&#39;) verweist.</li>\r\n			<li>\r\n				Gehen Sie in die&nbsp;SiteManager Administration -&gt; Webseite definieren und bearbeiten Sie die bestehende Webseite (oder erstellen ein neue), sodass&nbsp;&#39;/&#39; oder &#39;<a href=\"http://mydomain/\" target=\"_blank\">http://mydomain/</a>&#39; genutzt wird. Als Pfad setzen Sie den Pfad zum docroot ein.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>Wie erh&auml;lt man Benutzer freundliche URLs, die nur den Seitennamen enthalten, anstatt index.php?pagename=XYZ?</strong>\r\n		<ul>\r\n			<li>\r\n				Bearbeiten Sie die &#39;config.inc.php&#39; Datei im&nbsp;sitemgr-site-Verzeichnis (oder dem verschobenen Verzeichnis) und setzen Sie &#39;htaccess_rewrite&#39; auf &#39;True&#39;.</li>\r\n			<li>\r\n				Benennen Sie die &#39;htaccess&#39; Datei im gleichen Verzeichnis um in &#39;.htaccess&#39;.</li>\r\n			<li>\r\n				Konfigurieren Sie den Webserver so, dass die &#39;.htaccess&#39; Datei gelesen wird und &#39;AllowOverride<strong> </strong>FileInfo&#39; f&uuml;r dieses Verzeichnis gegeben ist.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>SiteManager&nbsp;Startseite oder wie erh&auml;lt man eine Startseite ohne automatisches Inhaltsverzeichnis (Home)?</strong>\r\n		<ul>\r\n			<li>\r\n				Gehen Sie in die Webseiten Konfiguration (nur f&uuml;r Webseiten Administratoren zug&auml;nglich) und erstellen Sie eine Seite (egal in welcher Kategorie). Danach setzen Sie diese Seite beim Webseite definieren als Startseite (Seite, die angezeigt wird, wenn keine Seite explizit ausgew&auml;hlt wurde).</li>\r\n			<li>\r\n				Diese Seite kann nur HTML-Bl&ouml;cke enthalten und kein automatisches Inhaltsverzeichnis. Zus&auml;tzlich werden aber alle webseitenweiten Bl&ouml;cke angezeigt, ebenso wie die Bl&ouml;cke der zugeh&ouml;rigen Kategorie (und ggf. der Elternkategorien).</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>Kann man mehre Seiten in Unterverzeichnissen verwalten?<br />\r\n		Zum Beispiel: <a href=\"http://domain.com/\" target=\"_blank\">http://domain.com</a>, <a href=\"http://domain.com/site-A/\" target=\"_blank\">http://domain.com/site-A/</a> and <a href=\"http://domain.com/site-B/\" target=\"_blank\">http://domain.com/site-B/</a>?</strong>\r\n		<ul>\r\n			<li>\r\n				Es ist prinzipiell m&ouml;glich, aber: die Webseite mit dem Wurzelverzeichnis (<strong><a href=\"http://domain.com/\" target=\"_blank\">http://domain.com</a>) </strong>muss zuletzt erstellt werden, da die dortigen URLs auch den URLs der anderen beiden Webseiten entsprechen. Aktuell gibt es keinen Weg, die Suche anders zu beeinflussen.</li>\r\n			<li>\r\n				Eine weitere M&ouml;glichkeit der Handhabung w&auml;re es, f&uuml;r jede Unterseite eine andere Kategorie mit entsprechenden Zugriffsrechten zu erstellen.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>Wie erstellt man anonymen Zugriff auf eine SiteManager Webseite?</strong>\r\n		<ul>\r\n			<li>\r\n				Erstellen Sie einen Benutzer MIT einem Password (ohne geht nicht!) und tragen Sie Benutzername und Password beim&nbsp;Webseite definieren bzw. bearbeiten ein. Das Setup erstellt hierf&uuml;r diesen Benutzer automatisch bei der Installation von Egroupware: Benutzername &#39;anonymous&#39; in der Gruppe &#39;No Group&#39;.</li>\r\n			<li>\r\n				Der Benutzer &#39;anonymous&#39; ben&ouml;tigt Zugriff zur Anwendung &#39;Website&#39;, NICHT dagegen zum SiteManager selbst.</li>\r\n			<li>\r\n				Der Benutzer &#39;anonymous&#39; ben&ouml;tigt Lese-Zugriff auf die Bereiche (Kategorien), die der Webseiten-Leser sehen k&ouml;nnen soll!</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>Wie kann man einen EGroupware Kalender im SiteManager verf&uuml;gbar machen?</strong>\r\n		<ul>\r\n			<li>\r\n				Der Benutzer &#39;anonymous&#39; ben&ouml;tigt Lese-Zugriff auf den Kalender des entsprechenden Benutzers bzw. der dargestellten Gruppe. Geben Sie KEINEN Zugriff auf die Anwendung Kalender, da sonst jeder von au&szlig;en beliebig Kalendereintr&auml;ge erstellen bzw. im Kalender selbst anzeigen k&ouml;nnte.</li>\r\n			<li>\r\n				Erstellen Sie einen Kalender-Block (z.B. calendar_list f&uuml;r die Listen-Ansicht, calendar_month f&uuml;r eine Mehrwochen- oder Monatsansicht oder calendar_planner f&uuml;r eine Planer-Ansicht). Falls die Bl&ouml;cke nicht direkt verf&uuml;gbar sind, m&uuml;ssen Sie die SiteManager Module (Bl&ouml;cke) f&uuml;r die Benutzung registrieren.</li>\r\n			<li>\r\n				Konfigurieren Sie den ausgew&auml;hlten Block entsprechend Ihren Bed&uuml;rfnissen, z.B. indem Sie Benutzer/Gruppe, Status-Filter und Kategorie ausw&auml;hlen.</li>\r\n			<li>\r\n				F&uuml;r die Listenansicht des Kalenders sollten Sie das Stylesheet Ihrer Webseite anpassen. Ein Beispiel finden Sie hier: &#39;calendar/sitemgr/class.module_calendar_list.inc.php&#39;.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n'),(28,'en','<h3>\r\n	Frequently asked questions about SiteManager</h3>\r\n<ul>\r\n	<li>\r\n		<strong>How&nbsp;to move the generated website in the docroot?</strong>\r\n		<ul>\r\n			<li>\r\n				Copy the sitemgr-site directory to the&nbsp;docroot, e.g. cd egroupware/sitemgr/sitemgr-site; cp -r * ../../..</li>\r\n			<li>\r\n				Edit the copied config.inc.php file in the docroot and change phpgw_path to point to the&nbsp;eGW install dir, e.g. &#39;egroupware&#39;.</li>\r\n			<li>\r\n				Go to SiteManager -&gt; define website and edit the existing website (or create a new one) to use the URL &#39;/&#39; or &#39;<a href=\"http://mydomain/\" target=\"_blank\">http://mydomain/</a>&#39; and as path use the path to the docroot.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>How&nbsp;to&nbsp;have the nice URLs with only the page-names instead of index.php?pagename=XYZ?</strong>\r\n		<ul>\r\n			<li>\r\n				Edit the config.inc.php file in the sitemgr-site directory (or whereever copied from) and set htaccess_rewrite to True,</li>\r\n			<li>\r\n				Rename the &#39;htaccess&#39; file in the same dir to &#39;.htaccess&#39; and</li>\r\n			<li>\r\n				Configure the webserver to read .htaccess files and AllowOverride<strong> </strong>FileInfo for that directory.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>SiteManager first page or I don&#39;t want to have an automatic site index on my startpage / homepage</strong>\r\n		<ul>\r\n			<li>\r\n				Go to the site-configuration (admin only) and create a page (in whatever category) and assign it as start page (page to use if no page is requested).</li>\r\n			<li>\r\n				That page can have only a HTML module, with not automatic index. But it will have all site-wide modules which can&#39;t be suppressed. Each page has the site-wide module, the modules of its category&nbsp;&nbsp;(and all its parent categories) plus the modules of the page.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>Can I have multiple sites in Sub-directories, e.g. <a href=\"http://domain.com/\" target=\"_blank\">http://domain.com</a>, <a href=\"http://domain.com/site-A/\" target=\"_blank\">http://domain.com/site-A/</a> and <a href=\"http://domain.com/site-B/\" target=\"_blank\">http://domain.com/site-B/</a>?</strong>\r\n		<ul>\r\n			<li>\r\n				It is possible: The site handling the root-dir has to be the last one created, as it&#39;s URL would also match the URL&#39;s of the other sites. Atm. there is no other way to influence the searching.</li>\r\n			<li>\r\n				An other way to handle that situation is assigning each of the sub-sites an own category and giving that user / group&nbsp;read- or&nbsp;edit rights only for that category.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>How to create anonymous access to a SiteManager site?</strong>\r\n		<ul>\r\n			<li>\r\n				Create a user WITH a password (it does NOT work without) and enter that user&#39;s name &amp; password when you define or edit the website. Setup creates a user named &#39;anonymous&#39; in group &#39;NoGroup<a href=\"http://www.egroupware.org/egroupware/index.php?menuaction=wiki.wiki_ui.edit&amp;page=NoGroup\">?</a>&#39; for that purpose.</li>\r\n			<li>\r\n				The anonymous&nbsp;user needs to have access to &#39;sitemgr-link&#39; application (NOT sitemgr).</li>\r\n			<li>\r\n				The anonymous&nbsp;user needs to have read-access to the parts of the site he should be able to see!!!</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n<br />\r\n<ul>\r\n	<li>\r\n		<strong>How is it possible to share an user calendar on the SiteManager?</strong>\r\n		<ul>\r\n			<li>\r\n				Give the anonymous&nbsp;user read access to the user&#39;s (or group&#39;s) calendar. Do NOT give access to the calendar application to the anonymous&nbsp;user (or else, everyone will be able to file events).</li>\r\n			<li>\r\n				Within the web site, add a block calendar_list for a calendar list or calendar_month for a grid (register the modules in SiteManager, they are not selectable)</li>\r\n			<li>\r\n				Configure the new module to your needs, e.g. by selecting the user (or group) whose calendar should be shown.</li>\r\n			<li>\r\n				For calendar_list, adapt your website&#39;s stylesheet. Refer to file calendar/sitemgr/class.module_calendar_list.inc.php which includes an example style sheet.</li>\r\n		</ul>\r\n	</li>\r\n</ul>\r\n'),(29,'de','<p>\r\n	&nbsp;</p>\r\n<div style=\"font-family: Arial, Verdana, sans-serif; font-size: 12px; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255); \">\r\n	<p>\r\n		<img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/support_stylite.jpg\" style=\"cursor: default; width: 647px; \" /></p>\r\n	<h3>\r\n		Support nach Wunsch</h3>\r\n	<ul>\r\n		<li>\r\n			<strong>Training, Consulting und Support</strong> f&uuml;r EGroupware&nbsp;Benutzer und Installationen erh&auml;ltlich in&nbsp;Prepaid-Paketen</li>\r\n		<li>\r\n			System-Support f&uuml;r EGroupware&nbsp;Neueinsteiger, Updating, Finden und Beseitigen von Problemen sowie Ver&auml;nderungsprozessen</li>\r\n		<li>\r\n			Beratung bez&uuml;glich Sicherheit, Linux und allgemeinen Systemfragen</li>\r\n		<li>\r\n			Support durch Stylite&#39;s&nbsp;EGroupware&nbsp;Entwickler, Berater und Linux&nbsp;Systemexperten</li>\r\n		<li>\r\n			Service per <strong>Telefon, Bildschirm-&Uuml;bertragung oder Remote-Zugriff</strong></li>\r\n		<li>\r\n			<a href=\"http://www.stylite.de/egroupware_consulting_and_support\" target=\"_blank\">Mehr Informationen</a></li>\r\n	</ul>\r\n	<br />\r\n	<h3>\r\n		Schulungen</h3>\r\n	<ul>\r\n		<li>\r\n			Praktische Schulungen vor Ort</li>\r\n		<li>\r\n			Individuelle Abstimmung von&nbsp;Schulungsinhalten: Einf&uuml;hrung und &Uuml;berblick, Anpassung von Modulen an individuelle Kundenw&uuml;nsche, Administration</li>\r\n		<li>\r\n			max 8 Personen</li>\r\n		<li>\r\n			8 Stunden pro Tag</li>\r\n		<li>\r\n			<a href=\"http://www.stylite.de/egroupware_consulting_and_support\" target=\"_blank\">Mehr Informationen</a></li>\r\n	</ul>\r\n	<br />\r\n	<h3>\r\n		Starter Workshop</h3>\r\n	<ul>\r\n		<li>\r\n			<a href=\"http://www.stylite.de/egroupware_special_offers\" target=\"_blank\" title=\"Spezial Angebot für einen EGroupware Starter Workshop\">Starter Workshop</a> f&uuml;r neue&nbsp;EGroupware&nbsp;Premium Line Kunden</li>\r\n		<li>\r\n			<a href=\"http://www.stylite.de/implementation_guideline\" target=\"_blank\" title=\"Implementations Leitfaden für einen EGroupware Starter Workshop\">L&ouml;sungskonzepte f&uuml;r&nbsp;Stylite&nbsp;Workshops</a></li>\r\n	</ul>\r\n	<br />\r\n	<h3>\r\n		Kontakt&nbsp;zu&nbsp;Stylite</h3>\r\n	<ul>\r\n		<li>\r\n			Tel: +49 (0) 63 52 706 29 0</li>\r\n		<li>\r\n			Fax: +49 (0) 63 52 706 29 30</li>\r\n	</ul>\r\n</div>\r\n'),(29,'en','<p>\r\n	&nbsp;</p>\r\n<div style=\"font-family: Arial, Verdana, sans-serif; font-size: 12px; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255); \">\r\n	<p>\r\n		<img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/support_stylite.jpg\" style=\"width: 100%;\" /></p>\r\n	<h3>\r\n		On Demand Support</h3>\r\n	<ul>\r\n		<li>\r\n			<strong>Training, consulting and support</strong> for EGroupware users and installations on base of prepaid packages</li>\r\n		<li>\r\n			Systems support for EGroupware migration, updating, troubleshooting and change management</li>\r\n		<li>\r\n			Linux, security and general systems consulting</li>\r\n		<li>\r\n			Support given by Stylite&#39;s EGroupware developers, consultants and Linux system experts</li>\r\n		<li>\r\n			Services via <strong>telephone, desktop sharing or remote access</strong></li>\r\n		<li>\r\n			<a href=\"http://www.stylite.de/egroupware_consulting_and_support\" target=\"_blank\">Read more</a></li>\r\n	</ul>\r\n	<br />\r\n	<h3>\r\n		Classroom Training</h3>\r\n	<ul>\r\n		<li>\r\n			Face-to-face training</li>\r\n		<li>\r\n			Individual agreement about training subjects: general overview, customising of modules, administration</li>\r\n		<li>\r\n			max 8 persons</li>\r\n		<li>\r\n			8 hours a day</li>\r\n		<li>\r\n			<a href=\"http://www.stylite.de/egroupware_consulting_and_support\" target=\"_blank\">Read more</a></li>\r\n	</ul>\r\n	<br />\r\n	<h3>\r\n		Starter Workshop</h3>\r\n	<ul>\r\n		<li>\r\n			<a href=\"http://www.stylite.de/egroupware_special_offers\" target=\"_blank\" title=\"Special offer for EGroupware Starter workshop\"> Starter workshop</a> for new EGroupware Premium Line customers</li>\r\n		<li>\r\n			<a href=\"http://www.stylite.de/implementation_guideline\" target=\"_blank\" title=\"Implementation guideline for EGroupware starter workshops\">Implementation guideline</a> for Stylite workshops</li>\r\n	</ul>\r\n	<br />\r\n	<h3>\r\n		Contact Stylite</h3>\r\n	<ul>\r\n		<li>\r\n			Tel: +49 (0) 63 52 706 29 0</li>\r\n		<li>\r\n			Fax: +49 (0) 63 52 706 29 30</li>\r\n	</ul>\r\n</div>\r\n'),(30,'de','<p>\r\n	EGroupware ist ein weltweites Projekt. Viele Menschen weltweit unterst&uuml;tzen die Community durch Diskussion verschiedenster Fragen bez&uuml;glich EGroupware, Anwendung der Software und Anpassung der Software an den individuellen Gebrauch.</p>\r\n<div style=\"font-family: Arial, Verdana, sans-serif; font-size: 12px; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255); \">\r\n	<p>\r\n		<strong>Bei Nutzung des Community Support im Benutzer-Forum beachten Sie bitte, dass Sie f&uuml;r diesen Support nicht bezahlen. Die dort gegebene Unterst&uuml;tzung erfolgt auf freiwilliger Basis und wird nicht verg&uuml;tet. Es lohnt sich, f&uuml;r eine sinnvolle Nutzung des Community Supports einen Blick in die unten aufgef&uuml;hrte Konvention zu werfen:</strong></p>\r\n	<ul>\r\n		<li>\r\n			Schauen Sie zun&auml;chst in den momentan verf&uuml;gbaren Informationsquellen nach der Antwort zu Ihren Fragen:\r\n			<ul>\r\n				<li>\r\n					Lesen Sie das Handbuch und suchen Sie in den anderen Beitr&auml;gen im Wiki.</li>\r\n				<li>\r\n					Durchsuchen Sie das&nbsp;<a href=\"http://www.egroupware.org/forum\" target=\"_blank\">Forum</a> zu Ihrer Frage, vielleicht gibt es dort bereits eine Antwort.</li>\r\n			</ul>\r\n		</li>\r\n		<li>\r\n			Keine private Kontaktaufnahme zu Community Mitgliedern oder Entwicklern.</li>\r\n		<li>\r\n			Ver&ouml;ffentlichen Sie Ihre Fragen <strong>nicht</strong> auf mehreren Listen.</li>\r\n	</ul>\r\n	<p>\r\n		<strong>Die Verbindung zwischen dem Benutzer-Forum und dem kommerziellen Support der&nbsp;Stylite EGroupware Entwickler</strong></p>\r\n	<ul>\r\n		<li>\r\n			Die Stylite&nbsp;EGroupware&nbsp;Entwickler sind Mitglieder der&nbsp;Projekt-Community und beteiligen sich im Benutzerforum. Sie analysieren Probleme und Anfragen der&nbsp;Nutzer weltweit, um L&ouml;sungen in die aktuelle Version von EGroupware einzubinden.</li>\r\n		<li>\r\n			Das Stylite Entwicklerteam arbeitet professionell an EGroupware. <strong>Stylite beantwortet normalerweise keine Support-Anfragen aus dem Benutzer-Forum</strong>, bietet jedoch Informationen und Feedback bez&uuml;glich tats&auml;chlichen EGroupware spezifischen Fragen und bez&uuml;glich der Software-Entwicklung.</li>\r\n		<li>\r\n			Stylite bietet <a href=\"http://www.stylite.de/EGroupware_consulting_and_support\" target=\"_blank\">Support-Service</a> f&uuml;r&nbsp;Kunden weltweit bez&uuml;glich der Nutzung von EGroupware, Linuxfragen, Schulung und individueller Nutzung der Software. Stylite Kunden stehen in direktem Kontakt mit den Stylite&nbsp;EGroupware Entwicklern und Systemexperten.</li>\r\n		<li>\r\n			Diskussion und Austausch mit anderen EGroupware Entwicklern findet im&nbsp;Entwickler-Forum statt.</li>\r\n	</ul>\r\n</div>\r\n'),(30,'en','<p>\r\n	EGroupware is a global project. Many people all over the world helping others, discussing any kind of questions regarding EGroupware, software operation and customisation.</p>\r\n<div style=\"font-family: Arial, Verdana, sans-serif; font-size: 12px; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255); \">\r\n	<p>\r\n		<strong>By asking for community support in the user forum, please keep in mind that you are not paying for this support. The people helping you are spending their free time. You&#39;ll increase your chance of getting support by taking notice of the below mentioned conventions:</strong></p>\r\n	<ul>\r\n		<li>\r\n			First have a look into the currently existing resources:\r\n			<ul>\r\n				<li>\r\n					Read the <a href=\"http://www.stylite.de/egroupware_manuals\" target=\"_blank\">manual</a> and search the other articles in the <a href=\"http://www.egroupware.org/wiki\" target=\"_blank\">Wiki.</a></li>\r\n				<li>\r\n					Search the <a href=\"http://www.egroupware.org/forum\" target=\"_blank\">Forum</a> for your topic, maybe it&#39;s already answered.</li>\r\n			</ul>\r\n		</li>\r\n		<li>\r\n			Do not contact community members or developers privately.</li>\r\n		<li>\r\n			Do <strong>not</strong> crosspost your issue to multiple lists.</li>\r\n	</ul>\r\n	<p>\r\n		<strong>The relation of the user forum and the commercial support of Stylite&#39;s EGroupware Developers</strong></p>\r\n	<ul>\r\n		<li>\r\n			The Stylite EGroupware developers are members of the project community and involved in the user forum. They analyse problems and requests from users worldwide, comitting solutions to the current code base.</li>\r\n		<li>\r\n			Stylite&#39;s development team works professionally full-time on EGroupware. <strong>Stylite usually does not reply to support requests in the user forum</strong>, but provides information and gives feedback to actual EGroupware issues and software development.</li>\r\n		<li>\r\n			Stylite offers <a href=\"http://www.stylite.de/EGroupware_consulting_and_support\" target=\"_blank\">support services for customers worldwide</a>, regarding EGroupware operation, Linux engineering, training and customisation. Customers are in direct touch with Stylite&#39;s EGroupware developers and system experts.</li>\r\n		<li>\r\n			Discussion and exchange with other EGroupware developers takes place in the developer forum.</li>\r\n	</ul>\r\n</div>\r\n'),(31,'de','<p>\r\n	Diese Webseite dient Pr&auml;sentationszwecken des Content Management Systems (Sitemanager) von EGroupware.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>Stylite&nbsp;AG&nbsp;</strong>|&nbsp;Morschheimer&nbsp;Strasse&nbsp;15&nbsp;|&nbsp;67292&nbsp;Kirchheimbolanden&nbsp;|&nbsp; GERMANY<br />\r\n	<br />\r\n	Tel. +49 (0)63 52 706 29 0<br />\r\n	Fax. +49 (0)63 52 706 29 30<br />\r\n	Email&nbsp;info(at)stylite.de<br />\r\n	www.stylite.de<br />\r\n	www.egroupware.org<br />\r\n	<br />\r\n	Amtsgericht Kaiserslautern<br />\r\n	HRB 30575<br />\r\n	UST ID Nr: DE 214280951<br />\r\n	<br />\r\n	Gesch&auml;ftsf&uuml;hrer: Andr&eacute; Keller, Gudrun M&uuml;ller, Ralf Becker<br />\r\n	V.i.S.d.P.: Andr&eacute; Keller<br />\r\n	<br />\r\n	<a href=\"?page_name=site_terms\">Nutzungsbedingungen</a><br />\r\n	<a href=\"?page_name=privacy_policy\">Datenschutzerkl&auml;rung</a></p>\r\n'),(31,'en','<p>\r\n	This web site is for presentation purpose regarding EGroupware&#39;s Content Management System, SiteManager.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>Stylite&nbsp;AG</strong>&nbsp;|&nbsp;Morschheimer&nbsp;Strasse&nbsp;15&nbsp;|&nbsp;67292&nbsp;Kirchheimbolanden&nbsp;|&nbsp;GERMANY<br />\r\n	<br />\r\n	Tel. +49 (0)63 52 706 29 0<br />\r\n	Fax. +49 (0)63 52 706 29 30<br />\r\n	Email&nbsp;info(at)stylite.de<br />\r\n	www.stylite.de<br />\r\n	www.egroupware.org<br />\r\n	<br />\r\n	Registered Jurisdiction: Kaiserslautern<br />\r\n	Trade Register Number: HRB 30575<br />\r\n	VAT Number: DE 214280951<br />\r\n	<br />\r\n	Directors: Andr&eacute; Keller,<font size=\"2\"> Gudrun M&uuml;ller, Ralf Becker<br />\r\n	V.i.S.d.P.: Andr&eacute; Keller<br />\r\n	<br />\r\n	<a href=\"?page_name=site_terms\">Site terms</a><br />\r\n	<a href=\"?page_name=privacy_policy\">Privacy policy</a><br />\r\n	&nbsp;</font></p>\r\n'),(32,'de','Stylite ist dem Schutz personenbezogener Daten in besonderer Weise verpflichtet.<br />\r\n				<br />\r\n				Bei der Benutzung der Stylite Webseiten, Internetshops und sonstiger internetbasierter Dienstleistungen werden Zugriffsdaten gespeichert. Diese sind insbesondere:\r\n				<ul>\r\n					<li>\r\n						Name der verwendeten Datei</li>\r\n					<li>\r\n						Zeitstempel des Zugriffs</li>\r\n					<li>\r\n						&Uuml;bertragenes Datenvolumen</li>\r\n					<li>\r\n						Informationen &uuml;ber durchgef&uuml;hrte Downloads</li>\r\n				</ul>\r\n				Die gespeicherten Daten dienen ausschliesslich statistischen Zwecken und werden nicht an Dritte weitergegeben. Weitergehende Informationen (Adressdaten, IP-Adressen u.a.) speichert Stylite ausschliesslich zu technischen Zwecken, um mit Kontaktpersonen zu korrespondieren.<br />\r\n				Jegliche Information, die Stylite &uuml;ber das Internet oder auf anderem Wege erreicht, insbesondere personenbezogene Daten werden unter Beachtung der geltenden Datenschutzbestimmungen vertraulich behandelt und sind nur legitimierten Personen zug&auml;nglich.'),(32,'en','<p>\r\n	Whenever a user accesses a page from our website or downloads a file, information regarding this activity is saved in a log file. Specifically, the following information is stored for each download:</p>\r\n<ul>\r\n	<li>\r\n		Name of the file accessed</li>\r\n	<li>\r\n		Date and time of the access</li>\r\n	<li>\r\n		Transferred data volume</li>\r\n	<li>\r\n		Information whether the download was successful</li>\r\n</ul>\r\n<p>\r\n	The saved data is only used for statistical purposes. This information is not provided to any third parties. In addition, information about the IP-address and the e-mail address (when recommending the site), are temporarily stored for technical reasons; an analysis of user information is not performed. When you send us an e-mail, the mail and your e-mail address are used exclusively for corresponding with you. All information or requests that reach us through the internet, as well as all other personal information, are treated with the strictest confidence. Laws regarding privacy and confidentiality are strictly observed.</p>\r\n'),(33,'de','<p>\r\n	<strong>HAFTUNGSHINWEISE</strong></p>\r\n<p>\r\n	Trotz sorgf&auml;ltiger inhaltlicher Kontrolle &uuml;bernehmen wir keine Haftung f&uuml;r die Inhalte externer Links. F&uuml;r den Inhalt der verlinkten Seiten sind ausschlie&szlig;lich deren Betreiber verantwortlich.</p>\r\n'),(33,'en','<p>\r\n	<strong>LIABILITY WAIWER</strong></p>\r\n<p>\r\n	Despite careful monitoring and controlling, we cannot accept any responsibility for the contents of external links. The owner of the linked pages maintains full responsibility for their contents.</p>\r\n'),(34,'de','<h2>\r\n	Die Seite, die sie angefordert haben existiert nicht oder steht nicht mehr zur Verf&uuml;gung</h2>\r\n<p>\r\n	Wenn Sie die URL per Hand eingegeben haben &uuml;berpr&uuml;fen Sie sie bitte auf eventuelle Schreibfehler.</p>\r\n<p>\r\n	Wenn Sie auf einen Link innerhalb der Website geklickt haben und zu dieser Seite gef&uuml;hrt wurden, benachrichtigen Sie uns bitte &uuml;ber das&nbsp;Kontaktformular. Wir werden das Problem so schnell wie m&ouml;glich l&ouml;sen.</p>\r\n'),(34,'en','<h2>\r\n	The page you have requested does not exists or is no longer available</h2>\r\n<p>\r\n	If you have typed the URL in by hand, please make sure you have entered it correctly.</p>\r\n<p>\r\n	Alternatively, if you have clicked on a link on our website and found this page, please report the problem via our contact form. We will correct it as soon as possible.</p>\r\n'),(37,'de','<p style=\"text-align: center;\">\r\n	<br />\r\n	<a href=\"http://www.stylite.de/egroupware_hosting_trial\" target=\"_blank\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/banner_egroupware_trial_de.jpg\" style=\"width: 100%;\" /></a><br />\r\n	<br />\r\n	<a href=\"http://www.stylite.de\" target=\"_blank\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/logo_stylite.png\" style=\"width: 100%;\" /></a></p>\r\n'),(37,'en','<p style=\"text-align: center;\">\r\n	<br />\r\n	<a href=\"http://www.stylite.de/egroupware_hosting_trial\" target=\"_blank\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/banner_egroupware_trial_en.jpg\" style=\"width: 100%;\" /></a><br />\r\n	<br />\r\n	<a href=\"http://www.stylite.de\" target=\"_blank\"><img alt=\"\" src=\"http://sitemgr.egroupware.de/uploads/logo_stylite.png\" style=\"width: 100%;\" /></a></p>\r\n'),(42,'en','<h1>SiteMgr Demo</h1>'),(43,'en','<p>\r\n	Powered by Stylite&#39;s EGroupware&nbsp;<b>SiteManager</b>. Please visit our Homepage <a href=\"http://www.egroupware.org\" target=\"_blank\">www.EGroupware.org</a> and <a href=\"http://www.stylite.de\" target=\"_blank\">www.stylite.de</a></p>\r\n');
/*!40000 ALTER TABLE `egw_sitemgr_content_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_modules`
--

DROP TABLE IF EXISTS `egw_sitemgr_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(25) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_modules`
--

LOCK TABLES `egw_sitemgr_modules` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_modules` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_modules` VALUES (1,'appdir','This module demonstrates how handling data stored in XML and building an interacvite interface from it'),(2,'hello','This is a simple sample module'),(3,'paypal','Paypal pay now button'),(4,'version','Module returns API version or an arbitrary string.'),(5,'login','This module displays a login form'),(6,'frame','This module lets you show a given URL inside an IFRAME in the page.'),(7,'html','This module is a simple HTML editor'),(8,'download','This module create a link for downloading a file(s) from the VFS'),(9,'amazon','Use this module for displaying book ads for the amazon web site'),(10,'google','Interface to Google website'),(11,'filecontents','This module includes the contents of an URL or file (readable by the webserver and in its docroot !)'),(12,'slideshow','This module lets you create a slideshow.'),(13,'galerie','A simple picture galery'),(14,'xml','This module permits browsing through XML files stored in a directory, and transformed by XSLT'),(15,'expires','Sets a from global value different time of Expires and Cache-Control header for all pages it is contained in.'),(16,'accordion','This module shows an accordion: clickable headers show otherwise hidden content.'),(17,'redirect','This module lets you define pages that redirect to another URL, if you use it, there should be no other block defined for the page'),(18,'search','This module search throw the content (Page title/description and html content)'),(19,'validator','Helps you respect HTML/XHTML standards.'),(20,'video','This module lets you playback videos.'),(21,'notify','Enter the email to be notified about changes of the website.'),(22,'template','This module lets the users choose a template or shows a template gallery'),(23,'administration','This module is a selectbox to change the mode (production, draft or edit) plus a link back to SiteMgr and to log out. It is meant for registered users only'),(24,'navigation','This module displays any kind of navigation element.'),(25,'lang_block','This module lets users choose language'),(26,'translation_status','This module show the status / percentage of the translation of eGW'),(27,'applet','This module lets you include an applet into the page.'),(28,'gallery_imageblock','Imageblock of the Gallery'),(29,'gallery','Use this module to display the embeded Gallery'),(30,'bookmarks','This module displays bookmarks in a javascript based tree'),(31,'resources_reservation','Simple reservation of a single item'),(32,'resources','This module displays the resources app'),(33,'wiki','Use this module for displaying wiki-pages'),(34,'tracker_add','This module allows to add a ticket.'),(35,'tracker','This module displays information from the Tracker.'),(36,'registration_form','This module displays a registration form, and sends a confirmation email.'),(37,'calendar_month','This module displays a user\'s calendar as multiple weeks. Don\'t give calendar application access to the anon user!'),(38,'calendar_list','This module displays calendar events as a list.'),(39,'calendar','This module displays the current month'),(40,'calendar_planner','This module displays a planner calendar.'),(41,'addressbook_contactform','This module displays a contactform, that stores direct into the addressbook.'),(42,'addressbook_display','This module displays Block from a Adddressbook Group.'),(43,'phpbrain','Enterprise Knowledge articles repository'),(44,'news_admin','This module publishes news from the news_admin application on your website. Be aware of news_admin\'s ACL restrictions.');
/*!40000 ALTER TABLE `egw_sitemgr_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_notifications`
--

DROP TABLE IF EXISTS `egw_sitemgr_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `site_language` varchar(5) NOT NULL DEFAULT 'all',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `egw_sitemgr_notifications_email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_notifications`
--

LOCK TABLES `egw_sitemgr_notifications` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_sitemgr_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_notify_messages`
--

DROP TABLE IF EXISTS `egw_sitemgr_notify_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_notify_messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `language` varchar(5) DEFAULT NULL,
  `message` text,
  `subject` text,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `egw_sitemgr_notify_messages_id_language` (`site_id`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_notify_messages`
--

LOCK TABLES `egw_sitemgr_notify_messages` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_notify_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_sitemgr_notify_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_pages`
--

DROP TABLE IF EXISTS `egw_sitemgr_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `hide_page` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `egw_sitemgr_pages_cat_id` (`cat_id`),
  KEY `egw_sitemgr_pages_state_cat_id_sort_order` (`state`,`cat_id`,`sort_order`),
  KEY `egw_sitemgr_pages_name_cat_id` (`name`,`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_pages`
--

LOCK TABLES `egw_sitemgr_pages` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_pages` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_pages` VALUES (1,7,1,1,'Home',2),(2,9,0,0,'blocks',2),(3,9,0,0,'available_blocks',2),(4,9,0,0,'html_block',2),(5,9,1,0,'calendar',2),(6,9,4,0,'contact_form',2),(7,9,5,0,'news',2),(8,9,5,0,'add_file_manager',2),(9,9,6,0,'siteindex',2),(10,8,1,0,'categories_and_pages',2),(11,10,0,0,'template',2),(12,10,0,1,'templates',2),(13,10,1,0,'site_configuration',2),(14,10,3,0,'egroupware_sitemanager',2),(15,10,4,0,'faq',2),(16,11,0,0,'stylite_support',2),(17,11,3,0,'community_support',2),(18,12,1,0,'impressum',2),(19,12,1,1,'privacy_policy',2),(20,12,3,1,'site_terms',2),(21,12,100,1,'404NotFound',2);
/*!40000 ALTER TABLE `egw_sitemgr_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_pages_lang`
--

DROP TABLE IF EXISTS `egw_sitemgr_pages_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_pages_lang` (
  `page_id` int(11) NOT NULL,
  `lang` varchar(5) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`page_id`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_pages_lang`
--

LOCK TABLES `egw_sitemgr_pages_lang` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_pages_lang` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_pages_lang` VALUES (1,'de','Webseite erstellen mit EGroupware',''),(1,'en','Create a website with EGroupware',''),(2,'de','Blöcke hinzufügen oder bearbeiten',''),(2,'en','Create, add and edit blocks',''),(3,'de','Vorhandene Blöcke',''),(3,'en','Available blocks',''),(4,'de','Text und Bilder',''),(4,'en','Add text and images',''),(5,'de','Kalender',''),(5,'en','Add calendar',''),(6,'de','Kontakt Formular',''),(6,'en','Add contact form',''),(7,'de','Nachrichten',''),(7,'en','Add news',''),(8,'de','Ordner und Dateien',''),(8,'en','Add folders and files',''),(9,'de','Navigation und Gesamtindex',''),(9,'en','Add navigation and site index',''),(10,'de','Kategorien und Seiten',''),(10,'en','Categories and pages',''),(11,'de','Template auswählen',''),(11,'en','Select template',''),(12,'de','Template Umleitung','Umleitung zur Seite template'),(12,'en','Templates-Redirect','Redirect to the template page'),(13,'de','Webseite konfigurieren',''),(13,'en','Configure website',''),(14,'de','Webseite definieren',''),(14,'en','Manage websites',''),(15,'de','FAQ',''),(15,'en','FAQ',''),(16,'de','Stylite Support',''),(16,'en','Stylite support',''),(17,'de','Community Support',''),(17,'en','Community support',''),(18,'de','Impressum',''),(18,'en','Imprint',''),(19,'de','Datenschutzerklärung',''),(19,'en','Privacy policy',''),(20,'de','Nutzungsbedingungen',''),(20,'en','Site terms',''),(21,'de','Seite oder Kategorie nicht gefunden!',''),(21,'en','Page or category not found!','');
/*!40000 ALTER TABLE `egw_sitemgr_pages_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_properties`
--

DROP TABLE IF EXISTS `egw_sitemgr_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_properties` (
  `area` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `properties` text,
  PRIMARY KEY (`area`,`cat_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_properties`
--

LOCK TABLES `egw_sitemgr_properties` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_sitemgr_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sitemgr_sites`
--

DROP TABLE IF EXISTS `egw_sitemgr_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sitemgr_sites` (
  `site_id` int(11) NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `site_url` varchar(255) DEFAULT NULL,
  `site_dir` varchar(255) DEFAULT NULL,
  `themesel` varchar(255) DEFAULT NULL,
  `site_languages` varchar(50) DEFAULT NULL,
  `home_page_id` int(11) DEFAULT NULL,
  `anonymous_user` varchar(50) DEFAULT NULL,
  `anonymous_passwd` varchar(50) DEFAULT NULL,
  `upload_dir` varchar(255) DEFAULT NULL,
  `htaccess_rewrite` tinyint(4) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `params_ini` text,
  `custom_css` text,
  `favicon_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`),
  KEY `egw_sitemgr_sites_url` (`site_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sitemgr_sites`
--

LOCK TABLES `egw_sitemgr_sites` WRITE;
/*!40000 ALTER TABLE `egw_sitemgr_sites` DISABLE KEYS */;
INSERT INTO `egw_sitemgr_sites` VALUES (6,'Default Website','/egroupware/sitemgr/sitemgr-site/','sitemgr/sitemgr-site','ja_purity','en,de',1,'anonymous','QrkxVEkZ1z5dda3x',NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `egw_sitemgr_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sqlfs`
--

DROP TABLE IF EXISTS `egw_sqlfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sqlfs` (
  `fs_id` int(11) NOT NULL AUTO_INCREMENT,
  `fs_dir` int(11) NOT NULL,
  `fs_name` varchar(200) NOT NULL,
  `fs_mode` smallint(6) NOT NULL,
  `fs_uid` int(11) NOT NULL DEFAULT '0',
  `fs_gid` int(11) NOT NULL DEFAULT '0',
  `fs_created` datetime NOT NULL,
  `fs_modified` datetime NOT NULL,
  `fs_mime` varchar(96) NOT NULL,
  `fs_size` bigint(20) NOT NULL,
  `fs_creator` int(11) NOT NULL,
  `fs_modifier` int(11) DEFAULT NULL,
  `fs_active` tinyint(4) NOT NULL DEFAULT '1',
  `fs_content` longblob,
  `fs_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fs_id`),
  KEY `egw_sqlfs_fs_dir_fs_active_fs_name` (`fs_dir`,`fs_active`,`fs_name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sqlfs`
--

LOCK TABLES `egw_sqlfs` WRITE;
/*!40000 ALTER TABLE `egw_sqlfs` DISABLE KEYS */;
INSERT INTO `egw_sqlfs` VALUES (1,0,'',5,0,0,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,0,1,NULL,NULL),(2,1,'home',5,0,0,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,0,1,NULL,NULL),(3,1,'apps',5,0,0,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,0,1,NULL,NULL),(4,2,'Default',56,0,1,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(5,2,'Admins',56,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(6,1,'templates',61,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(7,6,'addressbook',61,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(8,6,'calendar',61,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(9,6,'infolog',61,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(10,6,'tracker',61,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(11,6,'timesheet',61,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(12,6,'projectmanager',61,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(13,6,'filemanager',61,0,2,'2014-09-06 18:46:43','2014-09-06 18:46:43','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(14,2,'NoGroup',56,0,3,'2014-09-06 18:46:49','2014-09-06 18:46:49','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(15,2,'anonymous',448,4,0,'2014-09-06 18:46:49','2014-09-06 18:46:49','httpd/unix-directory',0,0,NULL,1,NULL,NULL),(16,2,'admin',448,5,0,'2014-09-06 18:53:30','2014-09-06 18:53:30','httpd/unix-directory',0,0,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `egw_sqlfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_sqlfs_props`
--

DROP TABLE IF EXISTS `egw_sqlfs_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_sqlfs_props` (
  `fs_id` int(11) NOT NULL,
  `prop_namespace` varchar(64) NOT NULL,
  `prop_name` varchar(64) NOT NULL,
  `prop_value` text,
  PRIMARY KEY (`fs_id`,`prop_namespace`,`prop_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_sqlfs_props`
--

LOCK TABLES `egw_sqlfs_props` WRITE;
/*!40000 ALTER TABLE `egw_sqlfs_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_sqlfs_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_syncmldeviceowner`
--

DROP TABLE IF EXISTS `egw_syncmldeviceowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_syncmldeviceowner` (
  `owner_locname` varchar(200) NOT NULL DEFAULT '',
  `owner_devid` int(11) NOT NULL DEFAULT '0',
  `owner_deviceid` varchar(100) NOT NULL DEFAULT '',
  UNIQUE KEY `egw_syncmldeviceowner_owner_locname_owner_devid_owner_deviceid` (`owner_locname`,`owner_devid`,`owner_deviceid`),
  KEY `egw_syncmldeviceowner_owner_deviceid` (`owner_deviceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_syncmldeviceowner`
--

LOCK TABLES `egw_syncmldeviceowner` WRITE;
/*!40000 ALTER TABLE `egw_syncmldeviceowner` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_syncmldeviceowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_syncmldevinfo`
--

DROP TABLE IF EXISTS `egw_syncmldevinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_syncmldevinfo` (
  `dev_dtdversion` varchar(10) NOT NULL DEFAULT '',
  `dev_numberofchanges` tinyint(4) NOT NULL DEFAULT '0',
  `dev_largeobjs` tinyint(4) NOT NULL DEFAULT '0',
  `dev_swversion` varchar(100) DEFAULT NULL,
  `dev_oem` varchar(100) DEFAULT NULL,
  `dev_model` varchar(100) NOT NULL DEFAULT '',
  `dev_manufacturer` varchar(100) NOT NULL DEFAULT '',
  `dev_devicetype` varchar(100) NOT NULL DEFAULT '',
  `dev_datastore` text,
  `dev_id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_fwversion` varchar(100) DEFAULT NULL,
  `dev_hwversion` varchar(100) DEFAULT NULL,
  `dev_utc` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dev_id`),
  KEY `egw_syncmldevinfo_dev_model_dev_manufacturer` (`dev_model`,`dev_manufacturer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_syncmldevinfo`
--

LOCK TABLES `egw_syncmldevinfo` WRITE;
/*!40000 ALTER TABLE `egw_syncmldevinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_syncmldevinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_syncmlsummary`
--

DROP TABLE IF EXISTS `egw_syncmlsummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_syncmlsummary` (
  `dev_id` varchar(255) NOT NULL DEFAULT '',
  `sync_path` varchar(100) NOT NULL DEFAULT '',
  `sync_serverts` varchar(20) NOT NULL DEFAULT '',
  `sync_clientts` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_syncmlsummary`
--

LOCK TABLES `egw_syncmlsummary` WRITE;
/*!40000 ALTER TABLE `egw_syncmlsummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_syncmlsummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_timesheet`
--

DROP TABLE IF EXISTS `egw_timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_timesheet` (
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_project` varchar(255) DEFAULT NULL,
  `ts_title` varchar(255) NOT NULL,
  `ts_description` varchar(16384) DEFAULT NULL,
  `ts_start` bigint(20) NOT NULL,
  `ts_duration` bigint(20) NOT NULL DEFAULT '0',
  `ts_quantity` double NOT NULL,
  `ts_unitprice` double DEFAULT NULL,
  `cat_id` int(11) DEFAULT '0',
  `ts_owner` int(11) NOT NULL,
  `ts_modified` bigint(20) NOT NULL,
  `ts_modifier` int(11) NOT NULL,
  `pl_id` int(11) DEFAULT '0',
  `ts_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ts_id`),
  KEY `egw_timesheet_ts_project` (`ts_project`),
  KEY `egw_timesheet_ts_owner` (`ts_owner`),
  KEY `egw_timesheet_ts_status` (`ts_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_timesheet`
--

LOCK TABLES `egw_timesheet` WRITE;
/*!40000 ALTER TABLE `egw_timesheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_timesheet_extra`
--

DROP TABLE IF EXISTS `egw_timesheet_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_timesheet_extra` (
  `ts_id` int(11) NOT NULL,
  `ts_extra_name` varchar(32) NOT NULL,
  `ts_extra_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ts_id`,`ts_extra_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_timesheet_extra`
--

LOCK TABLES `egw_timesheet_extra` WRITE;
/*!40000 ALTER TABLE `egw_timesheet_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_timesheet_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_tracker`
--

DROP TABLE IF EXISTS `egw_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_tracker` (
  `tr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_summary` varchar(80) NOT NULL,
  `tr_tracker` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `tr_version` int(11) DEFAULT NULL,
  `tr_status` int(11) DEFAULT '-100',
  `tr_description` text,
  `tr_private` smallint(6) DEFAULT '0',
  `tr_budget` decimal(20,2) DEFAULT NULL,
  `tr_completion` smallint(6) DEFAULT '0',
  `tr_creator` int(11) NOT NULL,
  `tr_created` bigint(20) NOT NULL,
  `tr_modifier` int(11) DEFAULT NULL,
  `tr_modified` bigint(20) DEFAULT NULL,
  `tr_closed` bigint(20) DEFAULT NULL,
  `tr_priority` smallint(6) DEFAULT '5',
  `tr_resolution` int(11) DEFAULT NULL,
  `tr_cc` text,
  `tr_group` int(11) DEFAULT NULL,
  `tr_edit_mode` varchar(5) DEFAULT 'ascii',
  `tr_seen` text,
  `tr_startdate` bigint(20) DEFAULT NULL,
  `tr_duedate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tr_id`),
  KEY `egw_tracker_tr_summary` (`tr_summary`),
  KEY `egw_tracker_tr_tracker` (`tr_tracker`),
  KEY `egw_tracker_tr_version` (`tr_version`),
  KEY `egw_tracker_tr_status` (`tr_status`),
  KEY `egw_tracker_tr_resolution` (`tr_resolution`),
  KEY `egw_tracker_tr_group` (`tr_group`),
  KEY `egw_tracker_cat_id_tr_status` (`cat_id`,`tr_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_tracker`
--

LOCK TABLES `egw_tracker` WRITE;
/*!40000 ALTER TABLE `egw_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_tracker_assignee`
--

DROP TABLE IF EXISTS `egw_tracker_assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_tracker_assignee` (
  `tr_id` int(11) NOT NULL,
  `tr_assigned` int(11) NOT NULL,
  PRIMARY KEY (`tr_id`,`tr_assigned`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_tracker_assignee`
--

LOCK TABLES `egw_tracker_assignee` WRITE;
/*!40000 ALTER TABLE `egw_tracker_assignee` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_tracker_assignee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_tracker_bounties`
--

DROP TABLE IF EXISTS `egw_tracker_bounties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_tracker_bounties` (
  `bounty_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_id` int(11) NOT NULL,
  `bounty_creator` int(11) NOT NULL,
  `bounty_created` bigint(20) NOT NULL,
  `bounty_amount` decimal(20,2) NOT NULL,
  `bounty_name` varchar(64) DEFAULT NULL,
  `bounty_email` varchar(128) DEFAULT NULL,
  `bounty_confirmer` int(11) DEFAULT NULL,
  `bounty_confirmed` bigint(20) DEFAULT NULL,
  `bounty_payedto` varchar(128) DEFAULT NULL,
  `bounty_payed` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bounty_id`),
  KEY `egw_tracker_bounties_tr_id` (`tr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_tracker_bounties`
--

LOCK TABLES `egw_tracker_bounties` WRITE;
/*!40000 ALTER TABLE `egw_tracker_bounties` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_tracker_bounties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_tracker_escalated`
--

DROP TABLE IF EXISTS `egw_tracker_escalated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_tracker_escalated` (
  `tr_id` int(11) NOT NULL,
  `esc_id` int(11) NOT NULL,
  `esc_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `match_count` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tr_id`,`esc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_tracker_escalated`
--

LOCK TABLES `egw_tracker_escalated` WRITE;
/*!40000 ALTER TABLE `egw_tracker_escalated` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_tracker_escalated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_tracker_escalations`
--

DROP TABLE IF EXISTS `egw_tracker_escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_tracker_escalations` (
  `esc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_tracker` varchar(55) NOT NULL DEFAULT '0',
  `cat_id` varchar(55) NOT NULL DEFAULT '0',
  `tr_version` varchar(55) NOT NULL DEFAULT '0',
  `tr_status` varchar(255) NOT NULL DEFAULT '0',
  `tr_priority` varchar(55) NOT NULL DEFAULT '0',
  `esc_title` varchar(128) NOT NULL,
  `esc_time` int(11) NOT NULL,
  `esc_type` tinyint(4) NOT NULL DEFAULT '0',
  `esc_tr_assigned` varchar(255) DEFAULT NULL,
  `esc_add_assigned` tinyint(4) DEFAULT NULL,
  `esc_tr_tracker` int(11) DEFAULT NULL,
  `esc_cat_id` int(11) DEFAULT NULL,
  `esc_tr_version` int(11) DEFAULT NULL,
  `esc_tr_status` int(11) DEFAULT NULL,
  `esc_tr_priority` int(11) DEFAULT NULL,
  `esc_reply_message` text,
  `esc_reply_visible` tinyint(4) DEFAULT NULL,
  `esc_match_repeat` int(11) DEFAULT '0',
  `esc_notify` varchar(15) DEFAULT NULL,
  `esc_limit` tinyint(4) DEFAULT NULL,
  `tr_resolution` varchar(55) NOT NULL,
  `esc_run_on_existing` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`esc_id`),
  UNIQUE KEY `egw_tracker_escalations_esc_time_esc_type` (`esc_time`,`esc_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_tracker_escalations`
--

LOCK TABLES `egw_tracker_escalations` WRITE;
/*!40000 ALTER TABLE `egw_tracker_escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_tracker_escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_tracker_extra`
--

DROP TABLE IF EXISTS `egw_tracker_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_tracker_extra` (
  `tr_id` int(11) NOT NULL,
  `tr_extra_name` varchar(64) NOT NULL,
  `tr_extra_value` text,
  PRIMARY KEY (`tr_id`,`tr_extra_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_tracker_extra`
--

LOCK TABLES `egw_tracker_extra` WRITE;
/*!40000 ALTER TABLE `egw_tracker_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_tracker_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_tracker_replies`
--

DROP TABLE IF EXISTS `egw_tracker_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_tracker_replies` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_id` int(11) NOT NULL,
  `reply_creator` int(11) NOT NULL,
  `reply_created` bigint(20) NOT NULL,
  `reply_message` text,
  `reply_visible` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reply_id`),
  KEY `egw_tracker_replies_reply_visible` (`reply_visible`),
  KEY `egw_tracker_replies_tr_id_reply_created` (`tr_id`,`reply_created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_tracker_replies`
--

LOCK TABLES `egw_tracker_replies` WRITE;
/*!40000 ALTER TABLE `egw_tracker_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_tracker_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_tracker_votes`
--

DROP TABLE IF EXISTS `egw_tracker_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_tracker_votes` (
  `tr_id` int(11) NOT NULL,
  `vote_uid` int(11) NOT NULL,
  `vote_ip` varchar(128) NOT NULL,
  `vote_time` bigint(20) NOT NULL,
  PRIMARY KEY (`tr_id`,`vote_uid`,`vote_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_tracker_votes`
--

LOCK TABLES `egw_tracker_votes` WRITE;
/*!40000 ALTER TABLE `egw_tracker_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_tracker_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_wiki_interwiki`
--

DROP TABLE IF EXISTS `egw_wiki_interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_wiki_interwiki` (
  `wiki_id` int(11) NOT NULL DEFAULT '0',
  `interwiki_prefix` varchar(80) NOT NULL DEFAULT '',
  `wiki_name` varchar(80) NOT NULL DEFAULT '',
  `wiki_lang` varchar(5) NOT NULL DEFAULT '',
  `interwiki_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`wiki_id`,`interwiki_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_wiki_interwiki`
--

LOCK TABLES `egw_wiki_interwiki` WRITE;
/*!40000 ALTER TABLE `egw_wiki_interwiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_wiki_interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_wiki_links`
--

DROP TABLE IF EXISTS `egw_wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_wiki_links` (
  `wiki_id` smallint(6) NOT NULL DEFAULT '0',
  `wiki_name` varchar(80) NOT NULL DEFAULT '',
  `wiki_lang` varchar(5) NOT NULL DEFAULT '',
  `wiki_link` varchar(80) NOT NULL DEFAULT '',
  `wiki_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wiki_id`,`wiki_name`,`wiki_lang`,`wiki_link`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_wiki_links`
--

LOCK TABLES `egw_wiki_links` WRITE;
/*!40000 ALTER TABLE `egw_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_wiki_pages`
--

DROP TABLE IF EXISTS `egw_wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_wiki_pages` (
  `wiki_id` smallint(6) NOT NULL DEFAULT '0',
  `wiki_name` varchar(80) NOT NULL DEFAULT '',
  `wiki_lang` varchar(5) NOT NULL DEFAULT '',
  `wiki_version` int(11) NOT NULL DEFAULT '1',
  `wiki_time` int(11) DEFAULT NULL,
  `wiki_supercede` int(11) DEFAULT NULL,
  `wiki_readable` varchar(255) NOT NULL DEFAULT ',_0',
  `wiki_writable` varchar(255) NOT NULL DEFAULT ',_0',
  `wiki_username` varchar(80) DEFAULT NULL,
  `wiki_hostname` varchar(80) NOT NULL DEFAULT '',
  `wiki_comment` varchar(80) NOT NULL DEFAULT '',
  `wiki_title` varchar(80) DEFAULT NULL,
  `wiki_body` longtext,
  PRIMARY KEY (`wiki_id`,`wiki_name`,`wiki_lang`,`wiki_version`),
  KEY `egw_wiki_pages_title` (`wiki_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_wiki_pages`
--

LOCK TABLES `egw_wiki_pages` WRITE;
/*!40000 ALTER TABLE `egw_wiki_pages` DISABLE KEYS */;
INSERT INTO `egw_wiki_pages` VALUES (0,'RecentChanges','en',1,1410022014,1410022014,',_0,',',_0,','setup','localhost','added by setup','RecentChanges','[[! *]]'),(0,'eGroupWare','en',1,1410022014,1410022014,',_0,',',_0,','setup','localhost','added by setup','eGroupWare','Welcome to \'\'\'Wiki\'\'\' - the eGroupWare Version of \'\'\'WikkiTikkiTavi\'\'\'. Wikis are a revolutionary new form of collaboration and online community.\n\n\'\'\'eGroupWare\'\'\' is the groupware suite you are useing right now. For further information see http://www.eGroupWare.org'),(0,'WikkiTikkiTavi','en',1,1410022014,1410022014,',_0,',',_0,','setup','localhost','added by setup','WikkiTikkiTavi','= WikkiTikkiTavi =\n\nWikkiTikkiTavi is the original version of this documentation system. Their [http://tavi.sourceforge.net documentation] is usable for the eGroupWare \'\'\'Wiki\'\'\' too.\n\n\'\'\'Learn about Wiki formatting:\'\'\'\n----\nSmashWordsTogether to create a page link.  Click on the ? to edit the new page.\n\nYou can also create ((free links)) that aren\'t WordsSmashedTogether.  Type them like this: {{```((free links))```}}.\n----\n{{```\'\'italic text\'\'```}} becomes \'\'italic text\'\'\n----\n{{```\'\'\'bold text\'\'\'```}} becomes \'\'\'bold text\'\'\'\n----\n{{```{{monospace text}}```}} becomes {{monospace text}}\n----\n{{```----```}} becomes a horizontal rule:\n----\nCreate a remote link simply by typing its URL: http://www.egroupware.org\n\nIf you like, enclose it in brackets to create a numbered reference and avoid cluttering the page; {{```[http://www.php.net]```}} becomes [http://www.php.net].\n\nOr you can have a description instead of a numbered reference; {{```[http://www.php.net/manual/en/ PHP Manual]```}} becomes [http://www.php.net/manual/en/ PHP Manual]\n----\nYou can put a picture in a page by typing the URL to the picture (it must end in gif, jpg, or png).  For example, {{```http://www.egroupware.org/egroupware/phpgwapi/templates/default/images/logo.png```}} becomes\nhttp://www.egroupware.org/egroupware/phpgwapi/templates/default/images/logo.png\n----\nThere are 2 possibilities for \'\'\'code formatting\'\'\':\n{{\'\'\'{{$is_admin = $GLOBALS[\'egw_info\'][\'user\'][\'apps\'][\'admin\'];}}\'\'\'}}\nor\n{{<code>}}\nif ($_POST[\'add\'])\n{\n   do_something();\n}\n{{</code>}}\nbecomes\n\n{{$GLOBALS[\'egw_info\'][\'user\'][\'apps\'][\'admin\']}}\nor\n<code>\nif ($_POST[\'add\'])\n{\n   do_something();\n}\n</code>\n----\nYou can indent by starting a paragraph with one or more colons.\n\n{{```:Indent me!```}}\n{{```::Me too!```}}\nbecomes\n\n:Indent me\n::Me too!\n----\nYou can create bullet lists by starting a paragraph with one or more asterisks.\n\n{{```*Bullet one```}}\n{{```**Sub-bullet```}}\nbecomes\n\n*Bullet one\n**Sub-bullet\n----\nYou can create a description list by starting a paragraph with the following syntax\n\n{{```*;Item 1: Something```}}\n{{```*;Item 2: Something else```}}\n\nwhich gives\n\n*;Item 1: Something\n*;Item 2: Something else\n----\nSimilarly, you can create numbered lists by starting a paragraph with one or more hashes.\n\n{{```#Numero uno```}}\n{{```#Number two```}}\n{{```##Sub-item```}}\nbecomes\n\n#Numero uno\n#Number two\n##Sub-item\n----\nYou can mix and match list types:\n\n<code>\n#Number one\n#*Bullet\n#Number two\n</code>\n#Number one\n#*Bullet\n#Number two\n----\nYou can make various levels of heading by putting = signs before and after the text =\n= Level 1 heading =\n== Level 2 heading ==\n=== Level 3 heading ===\n==== Level 4 heading ====\n===== Level 5 heading =====\n====== Level 6 heading ======\n<code>\n= Level 1 heading =\n== Level 2 heading ==\n=== Level 3 heading ===\n==== Level 4 heading ====\n===== Level 5 heading =====\n====== Level 6 heading ======\n</code>\n----\nYou can create tables using pairs of vertical bars:\n\n||cell one || cell two ||\n|||| big ol\' line ||\n|| cell four || cell five ||\n|| cell six || here\'s a very long cell ||\n\n<code>\n||cell one || cell two ||\n|||| big ol\' line ||\n|| cell four || cell five ||\n|| cell six || here\'s a very long cell ||\n</code>\n----\nYou can create anchors with the Macro:\n<code>\n[[Anchor ANCHORNAME]]\n</code>\nYou can jump to that Anchor with:\n<code>\n((PageName|Jump to Anchor #ANCHORNAME))\n</code>\n----\n=== Curly Options ===\nonly supported with tables right now\n<code>\n||{s=background:red}  CurlyOptions ||{s=color:blue;font-variant:small-caps;font-size:large} some text||\n</code>\n||{s=background:red}  CurlyOptions ||{s=color:blue;font-variant:small-caps;font-size:large} some text||\n<code>\n||{Tb=0,s=background:red;color:blue;font-variant:small-caps;font-size:large} some blue text on red ground||\n</code>\n||{Tb=0,s=background:red;color:blue;font-variant:small-caps;font-size:large} some blue text on red ground||\n<code>\n||{Tb=0,s=color:red;font-variant:small-caps;font-size:large} some red text||\n</code>\n||{Tb=0,s=color:red;font-variant:small-caps;font-size:large} some red text||\n----\n=== HTML Formatting ===\n<code>\n<html>\n<b> more </b> <font color=\"red\">to</font> <b>come</b>\n</html>\n</code>\ndisplays as:\n<html>\n<b> more </b> <font color=\"red\">to</font> <b>come</b>\n</html>\n----\n=== Macros ===\n<code>\n[[PageSize]]\n</code>\nDisplays the size of each page in bytes.\n[[PageSize]]\n<code>\n[[LinkTable]]\n</code>\nDisplays all of the pages that each page links to\n[[LinkTable]]\n<code>\n[[PageLinks]]\n</code>\nIndicates how many links to other pages each page contains. Multiple links to the same page count multiple times\n[[PageLinks]]\n<code>\n[[PageRefs]]\n</code>\nDisplays how many links there are to each page. Multiple links on a page increase the count. A page that links to itself also counts.\n[[PageRefs]]\n<code>\n[[OrphanedPages]]\n</code>\nDisplays all of the pages that no other page links to\n[[OrphanedPages]]\n<code>\n[[WantedPages]]\n</code>\nDisplays all pages that are linked to but do not yet exist\n[[WantedPages]]\n<code>\n[[Transclude eGroupWare]]\n</code>\nInclude the text of an other wikipage:\n[[Transclude eGroupWare]]\n');
/*!40000 ALTER TABLE `egw_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_wiki_rate`
--

DROP TABLE IF EXISTS `egw_wiki_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_wiki_rate` (
  `wiki_rate_ip` varchar(20) NOT NULL DEFAULT '',
  `wiki_rate_time` int(11) DEFAULT NULL,
  `wiki_rate_viewLimit` smallint(6) DEFAULT NULL,
  `wiki_rate_searchLimit` smallint(6) DEFAULT NULL,
  `wiki_rate_editLimit` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`wiki_rate_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_wiki_rate`
--

LOCK TABLES `egw_wiki_rate` WRITE;
/*!40000 ALTER TABLE `egw_wiki_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_wiki_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_wiki_remote_pages`
--

DROP TABLE IF EXISTS `egw_wiki_remote_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_wiki_remote_pages` (
  `wiki_remote_page` varchar(80) NOT NULL DEFAULT '',
  `wiki_remote_site` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`wiki_remote_page`,`wiki_remote_site`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_wiki_remote_pages`
--

LOCK TABLES `egw_wiki_remote_pages` WRITE;
/*!40000 ALTER TABLE `egw_wiki_remote_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_wiki_remote_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egw_wiki_sisterwiki`
--

DROP TABLE IF EXISTS `egw_wiki_sisterwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egw_wiki_sisterwiki` (
  `wiki_id` int(11) NOT NULL DEFAULT '0',
  `sisterwiki_prefix` varchar(80) NOT NULL DEFAULT '',
  `wiki_name` varchar(80) NOT NULL DEFAULT '',
  `wiki_lang` varchar(5) NOT NULL DEFAULT '',
  `sisterwiki_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`wiki_id`,`sisterwiki_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egw_wiki_sisterwiki`
--

LOCK TABLES `egw_wiki_sisterwiki` WRITE;
/*!40000 ALTER TABLE `egw_wiki_sisterwiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `egw_wiki_sisterwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_ACLs`
--

DROP TABLE IF EXISTS `phpgw_mydms_ACLs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_ACLs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` int(11) NOT NULL DEFAULT '0',
  `targetType` smallint(6) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '-1',
  `groupID` int(11) NOT NULL DEFAULT '-1',
  `mode` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_ACLs`
--

LOCK TABLES `phpgw_mydms_ACLs` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_ACLs` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_ACLs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_DocumentContent`
--

DROP TABLE IF EXISTS `phpgw_mydms_DocumentContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_DocumentContent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` int(11) DEFAULT '0',
  `version` smallint(6) DEFAULT '0',
  `comment` text,
  `date` bigint(20) DEFAULT '0',
  `createdBy` int(11) DEFAULT '0',
  `dir` varchar(10) NOT NULL DEFAULT '',
  `orgFileName` varchar(150) NOT NULL DEFAULT '',
  `fileType` varchar(10) NOT NULL DEFAULT '',
  `mimeType` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_DocumentContent`
--

LOCK TABLES `phpgw_mydms_DocumentContent` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_DocumentContent` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_DocumentContent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_DocumentLinks`
--

DROP TABLE IF EXISTS `phpgw_mydms_DocumentLinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_DocumentLinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` int(11) NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `public` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_DocumentLinks`
--

LOCK TABLES `phpgw_mydms_DocumentLinks` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_DocumentLinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_DocumentLinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_Documents`
--

DROP TABLE IF EXISTS `phpgw_mydms_Documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_Documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `comment` text,
  `date` bigint(20) DEFAULT '0',
  `expires` bigint(20) DEFAULT '0',
  `owner` int(11) DEFAULT '0',
  `folder` int(11) DEFAULT '0',
  `inheritAccess` tinyint(4) NOT NULL DEFAULT '1',
  `defaultAccess` smallint(6) NOT NULL DEFAULT '0',
  `locked` int(11) NOT NULL DEFAULT '-1',
  `keywords` text,
  `sequence` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_Documents`
--

LOCK TABLES `phpgw_mydms_Documents` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_Documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_Documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_Folders`
--

DROP TABLE IF EXISTS `phpgw_mydms_Folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_Folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  `comment` text,
  `owner` int(11) DEFAULT '0',
  `inheritAccess` tinyint(4) NOT NULL DEFAULT '1',
  `defaultAccess` smallint(6) NOT NULL DEFAULT '0',
  `sequence` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_Folders`
--

LOCK TABLES `phpgw_mydms_Folders` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_Folders` DISABLE KEYS */;
INSERT INTO `phpgw_mydms_Folders` VALUES (1,'Root-Folder',0,'no comment',1,0,2,0);
/*!40000 ALTER TABLE `phpgw_mydms_Folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_GroupMembers`
--

DROP TABLE IF EXISTS `phpgw_mydms_GroupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_GroupMembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_GroupMembers`
--

LOCK TABLES `phpgw_mydms_GroupMembers` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_GroupMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_GroupMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_Groups`
--

DROP TABLE IF EXISTS `phpgw_mydms_Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_Groups`
--

LOCK TABLES `phpgw_mydms_Groups` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_Groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_KeywordCategories`
--

DROP TABLE IF EXISTS `phpgw_mydms_KeywordCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_KeywordCategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_KeywordCategories`
--

LOCK TABLES `phpgw_mydms_KeywordCategories` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_KeywordCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_KeywordCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_Keywords`
--

DROP TABLE IF EXISTS `phpgw_mydms_Keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_Keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '0',
  `keywords` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_Keywords`
--

LOCK TABLES `phpgw_mydms_Keywords` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_Keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_Keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_Notify`
--

DROP TABLE IF EXISTS `phpgw_mydms_Notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_Notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` int(11) NOT NULL DEFAULT '0',
  `targetType` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '-1',
  `groupID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_Notify`
--

LOCK TABLES `phpgw_mydms_Notify` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_Notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_Notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_Sessions`
--

DROP TABLE IF EXISTS `phpgw_mydms_Sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_Sessions` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `userID` int(11) NOT NULL DEFAULT '0',
  `lastAccess` int(11) NOT NULL DEFAULT '0',
  `theme` varchar(30) NOT NULL DEFAULT '',
  `language` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_Sessions`
--

LOCK TABLES `phpgw_mydms_Sessions` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_Sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_Sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_UserImages`
--

DROP TABLE IF EXISTS `phpgw_mydms_UserImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_UserImages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `image` longblob,
  `mimeType` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_UserImages`
--

LOCK TABLES `phpgw_mydms_UserImages` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_UserImages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_UserImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpgw_mydms_Users`
--

DROP TABLE IF EXISTS `phpgw_mydms_Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phpgw_mydms_Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `comment` text,
  `isAdmin` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phpgw_mydms_Users`
--

LOCK TABLES `phpgw_mydms_Users` WRITE;
/*!40000 ALTER TABLE `phpgw_mydms_Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpgw_mydms_Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-06 23:24:10
