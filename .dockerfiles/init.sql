CREATE DATABASE  IF NOT EXISTS `osticket` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `osticket`;
-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: osticket
-- ------------------------------------------------------
-- Server version	5.7.35

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
-- Table structure for table `ost__search`
--

DROP TABLE IF EXISTS `ost__search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`object_type`,`object_id`),
  FULLTEXT KEY `search` (`title`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost__search`
--

LOCK TABLES `ost__search` WRITE;
/*!40000 ALTER TABLE `ost__search` DISABLE KEYS */;
INSERT INTO `ost__search` VALUES ('H',2,'','Verify that inti.sql has been run successfully.'),('O',1,'osTicket','1120 5th Street Alexandria, LA 71301\n(318) 290-3674\nhttps://osticket.com\nNot only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.'),('U',1,'osTicket Support','support@osticket.com');
/*!40000 ALTER TABLE `ost__search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_api_key`
--

DROP TABLE IF EXISTS `ost_api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apikey` (`apikey`),
  KEY `ipaddr` (`ipaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_api_key`
--

LOCK TABLES `ost_api_key` WRITE;
/*!40000 ALTER TABLE `ost_api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_attachment`
--

DROP TABLE IF EXISTS `ost_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  UNIQUE KEY `file_object` (`file_id`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_attachment`
--

LOCK TABLES `ost_attachment` WRITE;
/*!40000 ALTER TABLE `ost_attachment` DISABLE KEYS */;
INSERT INTO `ost_attachment` VALUES (1,1,'C',2,NULL,0,NULL),(2,8,'T',1,NULL,1,NULL),(3,9,'T',1,NULL,1,NULL),(4,10,'T',1,NULL,1,NULL),(5,11,'T',1,NULL,1,NULL),(6,12,'T',1,NULL,1,NULL),(7,13,'T',1,NULL,1,NULL),(8,14,'T',1,NULL,1,NULL),(9,16,'T',1,NULL,1,NULL),(10,17,'T',1,NULL,1,NULL),(11,18,'T',1,NULL,1,NULL),(12,19,'T',1,NULL,1,NULL);
/*!40000 ALTER TABLE `ost_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_canned_response`
--

DROP TABLE IF EXISTS `ost_canned_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_canned_response` (
  `canned_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`canned_id`),
  UNIQUE KEY `title` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_canned_response`
--

LOCK TABLES `ost_canned_response` WRITE;
/*!40000 ALTER TABLE `ost_canned_response` DISABLE KEYS */;
INSERT INTO `ost_canned_response` VALUES (1,0,1,'What is osTicket (sample)?','osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.','en_US',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(2,0,1,'Sample (with variables)','Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.','en_US',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19');
/*!40000 ALTER TABLE `ost_canned_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_config`
--

DROP TABLE IF EXISTS `ost_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_config`
--

LOCK TABLES `ost_config` WRITE;
/*!40000 ALTER TABLE `ost_config` DISABLE KEYS */;
INSERT INTO `ost_config` VALUES (1,'core','admin_email','admin@example.com','2021-11-05 11:13:21'),(2,'core','helpdesk_url','http://loclahost:8080/','2021-11-05 11:13:21'),(3,'core','helpdesk_title','SBDI Support','2021-11-05 11:13:21'),(4,'core','schema_signature','add628927ee030469f5d3272ebda1e16','2021-11-05 11:13:21'),(5,'schedule.1','configuration','{\"holidays\":[4]}','2021-11-05 11:13:17'),(6,'core','time_format','hh:mm a','2021-11-05 11:13:18'),(7,'core','date_format','MM/dd/y','2021-11-05 11:13:18'),(8,'core','datetime_format','MM/dd/y h:mm a','2021-11-05 11:13:18'),(9,'core','daydatetime_format','EEE, MMM d y h:mm a','2021-11-05 11:13:18'),(10,'core','default_priority_id','2','2021-11-05 11:13:18'),(11,'core','enable_daylight_saving','','2021-11-05 11:13:18'),(12,'core','reply_separator','-- reply above this line --','2021-11-05 11:13:18'),(13,'core','isonline','1','2021-11-05 11:13:18'),(14,'core','staff_ip_binding','','2021-11-05 11:13:18'),(15,'core','staff_max_logins','4','2021-11-05 11:13:18'),(16,'core','staff_login_timeout','2','2021-11-05 11:13:18'),(17,'core','staff_session_timeout','30','2021-11-05 11:13:18'),(18,'core','passwd_reset_period','','2021-11-05 11:13:18'),(19,'core','client_max_logins','4','2021-11-05 11:13:18'),(20,'core','client_login_timeout','2','2021-11-05 11:13:18'),(21,'core','client_session_timeout','30','2021-11-05 11:13:18'),(22,'core','max_page_size','25','2021-11-05 11:13:18'),(23,'core','max_open_tickets','','2021-11-05 11:13:18'),(24,'core','autolock_minutes','3','2021-11-05 11:13:18'),(25,'core','default_smtp_id','','2021-11-05 11:13:18'),(26,'core','use_email_priority','','2021-11-05 11:13:18'),(27,'core','enable_kb','','2021-11-05 11:13:18'),(28,'core','enable_premade','1','2021-11-05 11:13:18'),(29,'core','enable_captcha','','2021-11-05 11:13:18'),(30,'core','enable_auto_cron','','2021-11-05 11:13:18'),(31,'core','enable_mail_polling','','2021-11-05 11:13:18'),(32,'core','send_sys_errors','1','2021-11-05 11:13:18'),(33,'core','send_sql_errors','1','2021-11-05 11:13:18'),(34,'core','send_login_errors','1','2021-11-05 11:13:18'),(35,'core','save_email_headers','1','2021-11-05 11:13:18'),(36,'core','strip_quoted_reply','1','2021-11-05 11:13:18'),(37,'core','ticket_autoresponder','','2021-11-05 11:13:18'),(38,'core','message_autoresponder','','2021-11-05 11:13:18'),(39,'core','ticket_notice_active','1','2021-11-05 11:13:18'),(40,'core','ticket_alert_active','1','2021-11-05 11:13:18'),(41,'core','ticket_alert_admin','1','2021-11-05 11:13:18'),(42,'core','ticket_alert_dept_manager','1','2021-11-05 11:13:18'),(43,'core','ticket_alert_dept_members','','2021-11-05 11:13:18'),(44,'core','message_alert_active','1','2021-11-05 11:13:18'),(45,'core','message_alert_laststaff','1','2021-11-05 11:13:18'),(46,'core','message_alert_assigned','1','2021-11-05 11:13:18'),(47,'core','message_alert_dept_manager','','2021-11-05 11:13:18'),(48,'core','note_alert_active','','2021-11-05 11:13:18'),(49,'core','note_alert_laststaff','1','2021-11-05 11:13:18'),(50,'core','note_alert_assigned','1','2021-11-05 11:13:18'),(51,'core','note_alert_dept_manager','','2021-11-05 11:13:18'),(52,'core','transfer_alert_active','','2021-11-05 11:13:18'),(53,'core','transfer_alert_assigned','','2021-11-05 11:13:18'),(54,'core','transfer_alert_dept_manager','1','2021-11-05 11:13:18'),(55,'core','transfer_alert_dept_members','','2021-11-05 11:13:18'),(56,'core','overdue_alert_active','1','2021-11-05 11:13:18'),(57,'core','overdue_alert_assigned','1','2021-11-05 11:13:18'),(58,'core','overdue_alert_dept_manager','1','2021-11-05 11:13:18'),(59,'core','overdue_alert_dept_members','','2021-11-05 11:13:18'),(60,'core','assigned_alert_active','1','2021-11-05 11:13:18'),(61,'core','assigned_alert_staff','1','2021-11-05 11:13:18'),(62,'core','assigned_alert_team_lead','','2021-11-05 11:13:18'),(63,'core','assigned_alert_team_members','','2021-11-05 11:13:18'),(64,'core','auto_claim_tickets','1','2021-11-05 11:13:18'),(65,'core','auto_refer_closed','1','2021-11-05 11:13:18'),(66,'core','collaborator_ticket_visibility','1','2021-11-05 11:13:18'),(67,'core','require_topic_to_close','','2021-11-05 11:13:18'),(68,'core','show_related_tickets','1','2021-11-05 11:13:18'),(69,'core','show_assigned_tickets','1','2021-11-05 11:13:19'),(70,'core','show_answered_tickets','','2021-11-05 11:13:19'),(71,'core','hide_staff_name','','2021-11-05 11:13:19'),(72,'core','disable_agent_collabs','','2021-11-05 11:13:19'),(73,'core','overlimit_notice_active','','2021-11-05 11:13:19'),(74,'core','email_attachments','1','2021-11-05 11:13:19'),(75,'core','ticket_number_format','######','2021-11-05 11:13:19'),(76,'core','ticket_sequence_id','','2021-11-05 11:13:19'),(77,'core','queue_bucket_counts','','2021-11-05 11:13:19'),(78,'core','allow_external_images','','2021-11-05 11:13:19'),(79,'core','task_number_format','#','2021-11-05 11:13:19'),(80,'core','task_sequence_id','2','2021-11-05 11:13:19'),(81,'core','log_level','2','2021-11-05 11:13:19'),(82,'core','log_graceperiod','12','2021-11-05 11:13:19'),(83,'core','client_registration','public','2021-11-05 11:13:19'),(84,'core','default_ticket_queue','1','2021-11-05 11:13:19'),(85,'core','embedded_domain_whitelist','youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com','2021-11-05 11:13:19'),(86,'core','max_file_size','67108864','2021-11-05 11:13:19'),(87,'core','landing_page_id','1','2021-11-05 11:13:19'),(88,'core','thank-you_page_id','2','2021-11-05 11:13:19'),(89,'core','offline_page_id','3','2021-11-05 11:13:19'),(90,'core','system_language','en_US','2021-11-05 11:13:19'),(91,'mysqlsearch','reindex','0','2021-11-05 11:15:01'),(92,'core','default_email_id','1','2021-11-05 11:13:21'),(93,'core','alert_email_id','2','2021-11-05 11:13:21'),(94,'core','default_dept_id','1','2021-11-05 11:13:21'),(95,'core','default_sla_id','1','2021-11-05 11:13:21'),(96,'core','schedule_id','1','2021-11-05 11:13:21'),(97,'core','default_template_id','1','2021-11-05 11:13:21'),(98,'core','default_timezone','UTC','2021-11-05 11:13:21');
/*!40000 ALTER TABLE `ost_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_content`
--

DROP TABLE IF EXISTS `ost_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_content`
--

LOCK TABLES `ost_content` WRITE;
/*!40000 ALTER TABLE `ost_content` DISABLE KEYS */;
INSERT INTO `ost_content` VALUES (1,1,'landing','Landing','<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>','The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(2,1,'thank-you','Thank You','<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>','This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(3,1,'offline','Offline','<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>','The Offline Page appears in the Customer Portal when the Help Desk is offline.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(4,1,'registration-staff','Welcome to osTicket','<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>','This template defines the initial email (optional) sent to Agents when an account is created on their behalf.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(5,1,'pwreset-staff','osTicket Staff Password Reset','<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>','This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(6,1,'banner-staff','Authentication Required','','This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(7,1,'registration-client','Welcome to %{company.name}','<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>','This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(8,1,'pwreset-client','%{company.name} Help Desk Access','<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>','This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(9,1,'banner-client','Sign in to %{company.name}','To better serve you, we encourage our Clients to register for an account.','This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(10,1,'registration-confirm','Account registration','<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>','This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(11,1,'registration-thanks','Account Confirmed!','<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>','This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(12,1,'access-link','Ticket [#%{ticket.number}] Access Link','<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>','This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.','2021-11-05 11:13:19','2021-11-05 11:13:19'),(13,1,'email2fa-staff','osTicket Two Factor Authentication','<h3><strong>Hi %{staff.name.first},</strong></h3> <div> You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>','This template defines the email sent to Staff who use Email for Two Factor Authentication','2021-11-05 11:13:19','2021-11-05 11:13:19');
/*!40000 ALTER TABLE `ost_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_department`
--

DROP TABLE IF EXISTS `ost_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT NULL,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `schedule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`pid`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`),
  KEY `flags` (`flags`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_department`
--

LOCK TABLES `ost_department` WRITE;
/*!40000 ALTER TABLE `ost_department` DISABLE KEYS */;
INSERT INTO `ost_department` VALUES (1,NULL,0,0,0,0,0,0,4,'Support','Support Department',1,1,1,1,'/1/','2021-11-05 11:13:10','2021-11-05 11:13:10'),(3,NULL,0,0,0,0,0,0,4,'Maintenance','Maintenance Department',1,0,1,1,'/3/','2021-11-05 11:13:10','2021-11-05 11:13:10');
/*!40000 ALTER TABLE `ost_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_draft`
--

DROP TABLE IF EXISTS `ost_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_draft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) unsigned NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `namespace` (`namespace`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_draft`
--

LOCK TABLES `ost_draft` WRITE;
/*!40000 ALTER TABLE `ost_draft` DISABLE KEYS */;
INSERT INTO `ost_draft` VALUES (1,1,'task.add','<p>Verify that inti.sql has been run successfully.</p>',NULL,'2021-11-05 11:14:53',NULL);
/*!40000 ALTER TABLE `ost_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email`
--

DROP TABLE IF EXISTS `ost_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(11) unsigned NOT NULL DEFAULT '2',
  `dept_id` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_folder` varchar(255) DEFAULT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth_creds` int(11) DEFAULT '0',
  `smtp_userid` varchar(255) NOT NULL,
  `smtp_userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `smtp_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email`
--

LOCK TABLES `ost_email` WRITE;
/*!40000 ALTER TABLE `ost_email` DISABLE KEYS */;
INSERT INTO `ost_email` VALUES (1,0,2,1,0,'helpdesk@example.com','Support','','',0,'','POP','NONE',NULL,NULL,5,30,NULL,0,0,NULL,NULL,0,'',NULL,1,1,0,'','',0,NULL,'2021-11-05 11:13:21','2021-11-05 11:13:21'),(2,0,2,1,0,'alerts@example.com','osTicket Alerts','','',0,'','POP','NONE',NULL,NULL,5,30,NULL,0,0,NULL,NULL,0,'',NULL,1,1,0,'','',0,NULL,'2021-11-05 11:13:21','2021-11-05 11:13:21'),(3,0,2,1,0,'noreply@example.com','','','',0,'','POP','NONE',NULL,NULL,5,30,NULL,0,0,NULL,NULL,0,'',NULL,1,1,0,'','',0,NULL,'2021-11-05 11:13:21','2021-11-05 11:13:21');
/*!40000 ALTER TABLE `ost_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email_account`
--

DROP TABLE IF EXISTS `ost_email_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `protocol` varchar(64) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `options` varchar(512) DEFAULT NULL,
  `errors` int(11) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastconnect` timestamp NULL DEFAULT NULL,
  `lasterror` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email_account`
--

LOCK TABLES `ost_email_account` WRITE;
/*!40000 ALTER TABLE `ost_email_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_email_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email_template`
--

DROP TABLE IF EXISTS `ost_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(11) unsigned NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email_template`
--

LOCK TABLES `ost_email_template` WRITE;
/*!40000 ALTER TABLE `ost_email_template` DISABLE KEYS */;
INSERT INTO `ost_email_template` VALUES (1,1,'ticket.autoresp','Support Ticket Opened [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(2,1,'ticket.autoreply','Re: %{ticket.subject} [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(3,1,'message.autoresp','Message Confirmation','<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(4,1,'ticket.notice','%{ticket.subject} [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(5,1,'ticket.overlimit','Open Tickets Limit Reached','<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(6,1,'ticket.reply','Re: %{ticket.subject} [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(7,1,'ticket.activity.notice','Re: %{ticket.subject} [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(8,1,'ticket.alert','New Ticket Alert','<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(9,1,'message.alert','New Message Alert','<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(10,1,'note.alert','New Internal Activity Alert','<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr> <tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(11,1,'assigned.alert','Ticket Assigned to you','<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr> <tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(12,1,'transfer.alert','Ticket #%{ticket.number} transfer - %{ticket.dept.name}','<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>',NULL,'2021-11-05 11:13:19','2021-11-05 11:13:19'),(13,1,'ticket.overdue','Stale Ticket Alert','<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />',NULL,'2021-11-05 11:13:20','2021-11-05 11:13:20'),(14,1,'task.alert','New Task Alert','<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> <table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr> </tbody> </table> <br /> %{task.description} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>',NULL,'2021-11-05 11:13:20','2021-11-05 11:13:20'),(15,1,'task.activity.notice','Re: %{task.title} [#%{task.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>',NULL,'2021-11-05 11:13:20','2021-11-05 11:13:20'),(16,1,'task.activity.alert','Task Activity [#%{task.number}] - %{activity.title}','<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />',NULL,'2021-11-05 11:13:20','2021-11-05 11:13:20'),(17,1,'task.assignment.alert','Task Assigned to you','<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />',NULL,'2021-11-05 11:13:20','2021-11-05 11:13:20'),(18,1,'task.transfer.alert','Task #%{task.number} transfer - %{task.dept.name}','<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>',NULL,'2021-11-05 11:13:20','2021-11-05 11:13:20'),(19,1,'task.overdue.alert','Stale Task Alert','<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />',NULL,'2021-11-05 11:13:20','2021-11-05 11:13:20');
/*!40000 ALTER TABLE `ost_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email_template_group`
--

DROP TABLE IF EXISTS `ost_email_template_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email_template_group` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tpl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email_template_group`
--

LOCK TABLES `ost_email_template_group` WRITE;
/*!40000 ALTER TABLE `ost_email_template_group` DISABLE KEYS */;
INSERT INTO `ost_email_template_group` VALUES (1,1,'osTicket Default Template (HTML)','en_US','Default osTicket templates','2021-11-05 11:13:19','2021-11-05 11:13:19');
/*!40000 ALTER TABLE `ost_email_template_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_event`
--

DROP TABLE IF EXISTS `ost_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_event`
--

LOCK TABLES `ost_event` WRITE;
/*!40000 ALTER TABLE `ost_event` DISABLE KEYS */;
INSERT INTO `ost_event` VALUES (1,'created',NULL),(2,'closed',NULL),(3,'reopened',NULL),(4,'assigned',NULL),(5,'released',NULL),(6,'transferred',NULL),(7,'referred',NULL),(8,'overdue',NULL),(9,'edited',NULL),(10,'viewed',NULL),(11,'error',NULL),(12,'collab',NULL),(13,'resent',NULL),(14,'deleted',NULL),(15,'merged',NULL),(16,'unlinked',NULL),(17,'linked',NULL),(18,'login',NULL),(19,'logout',NULL),(20,'message',NULL),(21,'note',NULL);
/*!40000 ALTER TABLE `ost_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq`
--

DROP TABLE IF EXISTS `ost_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq` (
  `faq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`faq_id`),
  UNIQUE KEY `question` (`question`),
  KEY `category_id` (`category_id`),
  KEY `ispublished` (`ispublished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq`
--

LOCK TABLES `ost_faq` WRITE;
/*!40000 ALTER TABLE `ost_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq_category`
--

DROP TABLE IF EXISTS `ost_faq_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_pid` int(10) unsigned DEFAULT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `ispublic` (`ispublic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq_category`
--

LOCK TABLES `ost_faq_category` WRITE;
/*!40000 ALTER TABLE `ost_faq_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq_topic`
--

DROP TABLE IF EXISTS `ost_faq_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq_topic` (
  `faq_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`faq_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq_topic`
--

LOCK TABLES `ost_faq_topic` WRITE;
/*!40000 ALTER TABLE `ost_faq_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_file`
--

DROP TABLE IF EXISTS `ost_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ft` (`ft`),
  KEY `key` (`key`),
  KEY `signature` (`signature`),
  KEY `type` (`type`),
  KEY `created` (`created`),
  KEY `size` (`size`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_file`
--

LOCK TABLES `ost_file` WRITE;
/*!40000 ALTER TABLE `ost_file` DISABLE KEYS */;
INSERT INTO `ost_file` VALUES (1,'T','D','image/png',9452,'b56944cb4722cc5cda9d1e23a3ea7fbc','gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz','powered-by-osticket.png',NULL,'2021-11-05 11:13:14'),(2,'T','D','text/plain',24,'l8VqOMWtx86n3ccfeGGNagoRoTDtol7o','MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls','osTicket.txt',NULL,'2021-11-05 11:13:19');
/*!40000 ALTER TABLE `ost_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_file_chunk`
--

DROP TABLE IF EXISTS `ost_file_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL,
  PRIMARY KEY (`file_id`,`chunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_file_chunk`
--

LOCK TABLES `ost_file_chunk` WRITE;
/*!40000 ALTER TABLE `ost_file_chunk` DISABLE KEYS */;
INSERT INTO `ost_file_chunk` VALUES (1,0,_binary 'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\⁄\0\0\0(\0\0\0òG\‰\…\0\0\nCiCCPICC profile\0\0x⁄ùSwXì˜>\ﬂ˜eVB\ÿ±ólÅ\0\"#¨\»Y¢í\0aÑ@≈Öà\nVúHUƒÇ\’\nHùà\‚†(∏gAäàZãU\\8\Ó‹ßµ}z\Ô\Ì\Ì˚\◊˚º\Áú\Á¸\Œy\œÄ&ë\Ê¢j\09RÖ<:\ÿèOH\ƒ…ΩÄH\‡ \Ê\À\¬g\≈\0\0yx~t∞?¸Øo\0\0p\’.$\«\·ˇÉ∫P&W\0 ë\0\‡\"\ÁêR\0\».T\»\0\»\0∞S≥d\n\0î\0\0ly|B\"\0™\r\0\ÏÙI>\0ÿ©ì\‹\0ÿ¢©\0ç\0ô(G$@ª\0`UÅR,¿\¬\0†¨@\".¿ÆÄY∂2GÄΩ\0véXê@`\0ÄôB,\Ã\0 8\0C\Õ L†0“ø\‡©_pÖ∏H\0¿ÀïÕóK\“3∏ï\–\ZwÚ\‡\‚!\‚\¬l±Ba)f	\‰\"úóõ#H\ÁL\Œ\0\0\Z˘\—¡˛8?ê\Á\Ê\‰\·\Êf\Ál\ÔÙ≈¢˛ko\">!Ò\ﬂ˛ºå\0N\œ\Ô\⁄_\Â\Â\÷p\«∞uøk©[\0\⁄V\0h\ﬂ˘]3\€	†Z\n\–z˘ãy8¸@û°P\»<\n\Ì%b°Ω0\„ã>ˇ3\·o\‡ã~ˆ¸@˛\€z\0qö@ô≠¿£É˝qanvÆRé\Á\ÀB1n˜\Á#˛«Ö˝é)\—\‚4±\\,äÒXâ∏P\"M\«yπRëD!…ï\‚\È2Òñ˝	ìw\r\0¨ÜO¿N∂µ\Àl¿~\ÓãX\“v\0@~Û-å\Zë\0g42y˜\0\0ìø˘è@+\0Õó§\„\0\0º\Ë\\®îL\∆\0\0D†Å*∞A¡¨¿ú¡º¿aD@$¿<B\‰Ä\n°ñAT¿:\ÿµ∞\Z†ö\·¥¡18\r\Á\‡\\Å\Îp`û\¬ºÜ	A\»a!:àbé\ÿ\"\Œôé\"aH4íÄ§ \ÈàQ\"\≈\»r§©Bjë]H#Ú-r9ç\\@˙ê\€\» 2ä¸äºG1îÅ≤Q\‘u@π®\Zä∆†s\—t4]Äñ¢k\—\Z¥=Ä∂¢ß\—K\Ëut\0}äécÄ\—1få\Ÿa\\åáE`âX\Z&\«c\ÂX5Vè5cX7v¿ûa\Ô$ãÄ\Ï^Ñ\¬lÇêêGXLXC®%\Ï#¥∫W	ÉÑ1\¬\'\"ì®O¥%z˘\ƒxb:±êXF¨&\Ó!!û%^\'_ìH$…í\‰N\n!%ê2IIkH\€H-§S§>\“iúL&\Îêm\…\ﬁ\‰≤Ä¨ óë∑êêOí˚\…\√\‰∑:≈à\‚L	¢$R§îJ5e?\Â•ü2Bô†™QÕ©û\‘™à:üZIm†vP/Sá©4uö%ÕõCÀ§-£\’–öigi˜h/\Èt∫	›ÉEó–ó\“k\Ë\È\Á\ÈÉÙw\rÜ\rÉ\«Hb(k{ß∑/ôL¶”óô\»T0\◊2ôgòòoUX*ˆ*|ë\ ï:ïVï~ï\Á™TUsU?\’y™T´U´^V}¶FU≥P\„©	\‘´’©Uª©6Æ\ŒRwRèP\œQ_£æ_˝Ç˙c\r≤ÜÖF†ÜH£Tc∑\∆ç!\∆2eÒXB\÷rV\Î,kòMb[≤˘\ÏLv˚v/{LSCs™f¨fëfù\Êq\Õ∆±\‡9ŸúJ\Œ!\Œ\r\Œ{--?-±\÷j≠f≠~≠7\⁄z⁄æ\⁄b\Ìr\Ì\Ì\Î\⁄\Ôupù@ù,ùı:m:˜u	∫6∫Q∫Ö∫\€u\œ\Í>\”c\Îy\È	ı\ ı\È\›\—GımÙ£ı\Í\Ô\÷\Ô\—7046êl18cÃêc\Ëkòi∏\—Ñ\·®\Àh∫ë\ƒh£\—I£\'∏&\Óág\„5x>f¨ob¨4\ﬁe\‹k<abi2€§ƒ§\≈\‰æ)Õîköf∫—¥\”t\Ã\Ã\»,‹¨ÿ¨\…\Ïé9’úkûaæŸº\€¸çÖ•Eú\≈Jã6ã«ñ⁄ñ|\ÀñMñ˜¨òV>VyVıV◊¨I\÷\\\Î,\Îm\÷WlPWõõ:õÀ∂®≠õ≠\ƒvõm\ﬂ\‚è)\“)ıSn\⁄1\Ï¸\Ï\n\Ïö\Ï\Ì9ˆaˆ%ˆmˆ\œ\Ã\÷;t;|rtu\Ãvlpº\Î§\·4√©ƒ©\√\ÈWgg°sùÛ5¶Kê\ÀóvóSmßäßnüzÀï\Â\Z\Ó∫“µ\”ı£õªõ‹≠\Ÿm\‘\›\Ã=\≈}´˚M.õ\…]\√=\ÔAÙ˜X\‚q\Ã„ùßõß\¬Ûê\Á/^v^Y^˚ΩO≥ú&û\÷0m\»\€\ƒ[\‡Ω\À{`:>=e˙\Œ\È>\∆>üzüáæ¶æ\"\ﬂ=æ#~\÷~ô~¸û˚;˙\À˝è¯ø\·yÚÒN`¡\ÂΩÅ\ZÅ≥kô•5çª/>B	\rYrìo¿Ú˘c3\‹g,ö\—\ ùZ˙0\Ã&L\÷éÜ\œ\ﬂ~o¶˘L\ÈÃ∂à\‡Glà∏iô˘})*2™.\ÍQ¥Stqt˜,÷¨\‰Y˚gΩéÒè©åπ;\€j∂rvg¨jlRlcÏõ∏Ä∏™∏Åxá¯EÒót$	\Ìâ\‰\ƒ\ÿ\ƒ=â\„s\Álö3ú\‰öTñtcÆ\Â‹¢π\Ê\È\ŒÀûw<Y5Yê|8Öòó≤?\ÂÉ BP/O\ÂßnMÚÑõÖOEæ¢ç¢Q±∑∏J<í\ÊùVïˆ8\›;}C˙hÜOFu\∆3	OR+yëíπ#ÛMVD\÷ﬁ¨\œ\Ÿq\Ÿ-9îúîú£R\riñ¥+\◊0∑(∑Of++ì\r\‰y\Êm\ ìá\ ˜\‰#˘sÛ\€lÖL—£¥RÆPL/®+x[[x∏HΩHZ\‘3\ﬂf˛\Í˘#Ç|Ωê∞P∏∞≥ÿ∏xYÒ\‡\"øEª#ãSw.1]R∫dxi\“}\ÀhÀ≤ñ˝P\‚XRUÚjy\‹ÚéRÉ“••C+ÇW4ï©î\…\ÀnÆÙZπcaïdU\Ôjó\’[V*ï_¨p¨®Æ¯∞F∏\Ê\‚WN_\’|ıym\⁄\⁄\ﬁJ∑\ \Ì\ÎH\Î§\În¨˜YøØJΩjA\’–Ü\r≠Òç\Â_mJ\ﬁt°zjıéÕ¥\Õ\ \Õ5a5\Ì[Ã∂¨\€Ú°6£ˆzù]\ÀV˝≠´∑æ\Ÿ&\⁄÷ø\›w{ÛÉ;\ﬁ\ÔîÏºµ+xWkΩE}ın\“\ÓÇ›è\Zb∫ø\Ê~›∏GwO≈ûè{•{ˆE\Ô\Îjtol‹Øøø≤	mR6çH:pÂõÄo⁄õ\ÌöwµpZ*\¬A\Â¡\'ﬂ¶|{\„P\Ë°\Œ\√\‹\√\Õﬂô∑ı\ÎHy+\“:øu¨-£m†=°Ω\ÔËå£ù^Gæ∑ˇ~\Ô1\„cu\«5èWû†ù(=Ò˘‰Çì\„ßdßûùN?=‘ô\‹y˜L¸ôk]Q]ΩgCœû?t\ÓL∑_˜\…Û\ﬁ\Áè]ºpÙ\"˜b\€%∑K≠=Æ=G~p˝\·HØ[o\Îe˜\À\ÌW<ÆtÙM\Î;\—\Ô\”˙j¿\’s\◊¯\◊.]üyΩ\Ô\∆\Ï∑n&\›∏%∫ı¯vˆ\Ìw\n\ÓL\‹]zèxØ¸æ\⁄˝\Í˙\Í¥˛±e¿m\‡¯`¿`\œ\√Y\Ô	áû˛îˇ”á\·\“G\ÃG\’#F#çèù\r\ZΩÚdŒì·ß≤ß\œ\ ~Vˇy\Îs´\Á\ﬂ˝\‚˚K\œX¸\ÿ˘ãœøÆy©ÛrÔ´©Ø:\«#\«º\Œy=Ò¶¸≠\Œ\€}\Ô∏\Ô∫\ﬂ«Ωô(¸@˛PÛ\—˙c«ß\–O˜>\Á|˛¸/˜ÑÛ˚Ä9%\0\0\0tEXtSoftware\0Adobe ImageReadyq\…e<\0\0(iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"Ôªø\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.6-c014 79.156797, 2014/08/20-09:53:02        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CC 2014 (Macintosh)\" xmpMM:InstanceID=\"xmp.iid:6E2C95DEA67311E4BDCDDF91FAF94DA5\" xmpMM:DocumentID=\"xmp.did:6E2C95DFA67311E4BDCDDF91FAF94DA5\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:CFA74E4FA67111E4BDCDDF91FAF94DA5\" stRef:documentID=\"xmp.did:CFA74E50A67111E4BDCDDF91FAF94DA5\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>ã˛ˆ\ \0\0IDATx\⁄\Ï]	úS\’\’?/{2\…dfÄaqê]67\–œ≠(*®-\nˆÛ≥∂.ı+\÷÷Ö∫ nµJ¡≠ˆSãR¥\’:VDT§,e\—2®lÇ†¨Ç\Ïã3\Ã\¬Líó˜›õ¸os\ÊNí\…Pq\Ã˘˝$ìó˜\Óª˜¸\œ˘üs\Ôª1ÜNY96§\⁄t\“\ÿ\Ó\ÔS±/Q\ƒ˝]k~K°ìÖ\Ózõ\–\Ìç>É%4ﬂ§\“5∫˙≠<≤\Ÿ,≤\ÕclmYÛ\Œ\ íÑû\'Ù\«BØhÙ∑£BÛLZ∏\ﬁM?õ§∞\0]sôG\÷>æ\◊\‚Z(4W®]h\r\"“æ&F4ô]ç˛∂?JKD$˙F>Yd-}QäZY†e\Âª)≠Ñû*tÄ\–”Ñ∂\Í\‡$ªâ\r	=(tï\–\ÈBg	=ê¡π\Ì¯_Ç¥¢—îQ\0m\∆V\Ì+≥SèvaäDõW\«gÅˆ˝êéBØ˙øBªe¯ù\ﬁBØ∫L\ËH°\“õ#tÛªB\«	˝mFWí\0;t\» _é\Ÿ\Ï@ñ\Õ—öøxÑ\ﬁ.t!ø[\Œ!#\‡\\°˜\„|\…\‰Wàí:˜\ÿ\rG≥†I≥∑9\Èâ\“* ç6ÀÅ\»≠˘Jk°SÖ˛A\ËqG¿Nçº\09ù§õEB\ÔMπ~-4?Ìôù\’~\„†Iã}\‘&∑y\ÂeY\Í\ÿ¸\Â°o\n\ÌuÑ\œ{.rªΩBk∏\÷iv?äó˙LG∑¥—îµj\»-+\ﬂëQÊï£\02%>\‰|ô\ \Ô(^\Õõí\ﬂ\n\ÍX\Ëè\∆r≥\ÊT\“\œR\«\Ê-í*ˆˇñÆ-\„\—R°ÀÖV±ø\ÀBI\À:G\ T\Ã#˛\…5i˛\ZE\"FÛîlD;\Ê\\_\‰pæ˝sj\ dÒëìıB\"tá\–B)Ù2\‰w\ﬂ\ƒ\Ôœäª˜`î\Ê≠Ù–§ï^ö∂\—MnA!ç\Ê<¨Y\À>Üºû•íÌßêˆ\n´ktıM\ÊJw%˘ªú<.ˇ\›\¬\√BøU\\GÒBI?Á¶ì]\0\Ão\∆\–Ù\Â^˝Ù•∫eFê&.˜ë\◊aë\«a5\Ô±Õö˜±#“£o>§ê=L^´\—˛]Féû\⁄\ﬂJÖN\0ÉGπ˘„ÖæVá\Z˙¢!q#!\≈ñ\€\È¿6=X\Íß9õ\\T2\»Ô≤®{´ôc\—Êç≥,–é)zak≥l¥˙@1ı\œ\ﬂ{ù°Ñ^£˝MFî°_b\’\Ê(7˝9°£≠ë+\'J´\÷{hÒón\Íê°[\\ÙhiµÛGc41\'\'±M\Î˚1∂é≥\œ>;k\·«êLõøå\ﬁ\‹›ã˙∑\ÿ$\‹|\∆~,äó›ïîx\ﬂ ∂l\⁄\‚(4W.\”\ZAj’à\¬rù\‚\„sr\…Wùµ\…M\–Wîr\›\"zµhû´>≤\Ì;ôßYîÁ™äE,è0ﬁå\\æ\\1\Ôb\Ô∫Ø\Â\"\·\'Ñæë¡x\À¸\Íu\–LY\Ã»£x9\ﬂ)¥˘^[\0õPÙXV\ÁÇNX\·•ÕªùT(\"Yè∂âuã\ﬂWêeÅvä›àRU\ÿC55AÚ\ÿCô\–GY6?ëΩˇ@\Ë´\⁄1kÑVS|Ç9ù\»I\ÓX\ \Ë£\ƒ*êrD\ \"ÄˆL°ÉÑŒé=*@4\È´=N\ wZjâ9æ%p\…ˆ\ %a\ÌÒ~è\–yBeÅñïò¯Ìµ¥¢¢\rï\Ï\ÏK\√;HT\Îo\Ë+É)æQ\…_≈∏t°\‘\ÎâcI\ÏUû»±B\"îV⁄™\»Vg>L\ vW¶S\‚1õ|ÚXª∂\Óp—∞\…y¥Ì†ùZx£rR≠\≈\'∑#†∞)˝\≈WöH™[ ‘çˆ\ ∫±	\›(#Ú=B2ä˚C°€≤@\ÀJL,H$\À›µ(ÒüN)2ö©∞\'øõ‰òÆ\Zµ\‘/*\œ\'rZüKD\‹˚Vù((\ﬂ\’g	å≤≈õ{Ä\∆Pì]aY\« πjﬂä=B≥ù\n\"4~nÄVnwR˜∂ëXéFÒUˇrQsŒêJd\‰\‹\ZzæÙ7\"\‡y°7e©cVéä∏™\È˝Ω\›\Ë\‰\‡\Í%îB˛T`\ÀÖSÚO\–;]NNy±X\ﬁz7\‚∂s¥\—}ÛÙ\‰á~j/®ﬂ¨\rn™¥∑\“F\√z\◊\–\»*à\ƒfñ€âÊ¥å5)\◊\‹Eû\Ë°EK|Ù\÷j∑4\»˘4\rI.Ú¬ñîx∂\Õ\€\ƒ.åj¿6à®GJéG_˜Ü”òëZz1`Nx\„Pä\„<8¶^˛\»$6ìv\‘hUYı\n\ÏçG∂\‰Ûjrﬁ¨/^\ÔDé•ã§a\›Sö£€öIm¬∑Lúï\Z˚^ fùùZ\ÀÜA36∫ck†\Â{,\Z9†R‹±@WµQ%†∞Z\‰dÛ∑\◊\„WmˆÜoûñ\'rKä\«JˆäˆU0\√7YﬁßD~&*Ø\ÿÚ\—ˇïá1~ˇ\ÈÖ&=PH:	\Ô\«eÅ÷∞»Å~πè|\‘d4≈ü:\Ê“á\‚\Î\n\€\„ò{é\‘≈£T«π+h≤,Ûãà\÷9ww™\Õz\‰¸X\0Øø˝\“\Â-áKÄ\ÃN/R\€\Õ\œ\Ã\Ã\r\›3-HÖÅh+üapymv+\“\ g…ß•7∑ÚE#Û∂:\È\Íí*πÚÄ\€\ÍZ;x˘\◊ŒÅw\…*âØKq®8W\‡QÄ\ÃÄ»∂<{Xû&ù“£îxPTR\œ;Pƒë ¸#úóõö≤%¬∑\'\Ì\»H/ºdÅñ¢&AÒy©¯?ôï†≤\ÂLj»á6\·ê=\"≤9°t9\Z_®ª2I$\€ı\0\ÈK\Ì,\⁄-\"\Ÿh≤û˘g.\›˛v∞∞8ﬂº\…aã=®Ÿû]MV*D-z≤c0:Úz7y\ﬂ…£GœØ(/y=ø|“ß^[π”∫∂ca\‰qÅ>—∫Qjã\–\«)æbDóØ\ŸkyÉüJ@\„˝\÷cò\Â§Kñ∑°†£leh\rKÑ\—\≈)®\„Axn˝vçF8\rìJ∂ùBww*%Gl^ÕñÃã*˘D˚LV\‹˛Ü™ ó)Q\”x¿\Ê1\◊NTÒ7o\Êù\—.\ﬂ|\ŒeßS¢V\Ï>^Ñ\—\»¸\ËB/ë\Zé“Ω\«\ÕqSE\ﬁˆ\≈>;-\ﬁ\Ó41˙tØˆ°¶iD\≈Áìç8Uî}\'\—\"ÙOB\œzùñ#Òú\Õ\≈\ﬁw¢¯ñv8;πÑ\ÏI∫F>\»:‘π≥„∞Ä\‚O4D\Â\Â≥róÇ\÷\·å\∆S\›mÚ.¶¯F!%¶8‰äõI¨Çy\"˙∫ìÜßã\·Ñe\€*H\‡NE\√f£t5\≈\ÁK#¡ÆLíõB\‚\Á\≈E¡3\„\Ÿ6Pï†\À˝$äV72ˆ\„;\‹\ËP\"1˙√ì»π†˘\‡Ú\ƒ°⁄πÉ\‘\\y®\’ \‰(™rˇ\"™W≤>ùïÉ™\›z˙SÒ}ã\Í|?Aü\»6N£¯äyŒãp9H´í\0¢≠ä\ƒ6\¬1ã6 ßP\‘Z}i\Õ\"ßç≤R7\≈%í\ﬁO\ﬁ\Ëƒç˚\Ì—ãkCU!j/@61\‡≤z	\ \'Ûâ[Ñ~•\Âw◊£˙7V\0q_Æ+ˆ}\Íòo^e4\"6∂âéΩ¬®ÙsÑ˛∂Ù!\≈\◊\\r\‚\ kûJN≠TÚó$@ìQ˜N™øÆS\…˘†•\È\Ê\Ã$yZ(_ı:\Î{\È¿\‰W,î§\r∑/Éπuπ\Zs\÷xÜ\Á—∞qh\Ë\ÿ\ÊÇ\Á´\–.ü\ﬁ}	ûäã\Ïg(æb[\Z\÷sL7\„¸RF°\‰+Ø%°(¡\ﬂG\√8\"4§rÅ\Í)\⁄5V\¬Ç6Iè\ŸFı\r:\Ô XR>9±\⁄Q;G)⁄¥\Ô\Ô¶¯¿^ñ\”L»∞R\∆#ã\Ã\”.c\‡/¬†ı¿5/d\‘Izf9π,\Áõ\Ê}Og+>{8æ≤æxq\Ô*\Í\Ó¿kπÇ^\ﬂZ`5¢\ rπu¿\‹u˙∫ †æ\Ë\"íIê\ÕE[uTã\\µ\n\—qå\»\ﬂf\Â∫-\Èœµ\‚Õ∫/I4%8¥{0\∆7\"W+k†´ºTÖåGa_\ÈdC:∂ˆ®2\Ÿ\∆\·∏\ﬂv\0\›Y\ÏÛµ\»-ª£\ﬂ{¿∂˙0«üN\Ï6V˝Ò\¬\‡˚!1˝öyàö\0@ÅLFôy\Ë@:ˆ:x\Ê:¨/+Eü√Æu.^f=0	≤W\»V\"bÖ¶K\–5¨3G†\ÌÑht∏#¿+¡ı>?˜\‡«Ω=Çˆò0é}0û\Œt†…º\◊¥u\r˛Và∂\ 9¨)åft—º~;ºûWü9Xt\»t∆ä#)\n6Ex˝9r¢Û\·8∏º\Î_KÄ\Ã•g\Ëëó\ÊD˚äú\Ï¨öø+	»∏º\nê\Ï\·Z≠Ù˛uö\Ô-@\ﬂG\›L\ Ú©¢\›M\Z\»\¬`\“Ò^NÒ\rÇ^F•»´	\«\›\»\ﬁ\œ` #∏\ŒbL\ÂFD\⁄~îx÷é@7üÑ\”:\…\€˛!lÚ1¿l\Zóï\'˛9@p)ãb\·PbN\ÊUPÆÛq¨\‚¨˜Ò˛tÄ\Ë8ùí\"ñ\'™\r\\&!¬™≤∑\„&OGG◊Çb\ﬁnf`]\ 0\Á\ËN=m?ë\œkı\¬\Î\€X\ÔF$?µ±2¸bP\n±¡ÿïp∂0ò\Î{ıEAohøå|Æ\Íd˘Y\Î∑E,\«qjQeò0\◊\ÌT`\“\ÀK|4bf.\‰D\…fãıáå\⁄o≥\ËûN\‘D¯√Å™\“˝=l,uŸÅ1π\\£§çïv\ﬂUããº\ÓP∞öw¿BÆG_˚)1ß\0ªNüo©∞Å°ñ•C\ÿ\Á\ƒ\∆\Á&“Å˚\ÿÁóÅ\Õ<Pq~ˇ6™Æ≤ùcmZòû¿\Êb>\∆	î\\£UÜÒ£ˇÇ\' ¯y¯>!‹∂Fæ\‰G¥,\ÕG\‰≤\ MO\…f \ uQ\Á\Ï¿\’\‡˝nx™©àä™HrL<\‹4ä?f/\Â†qR¶É\ÍJ øç…§%e\"£â\»2és!÷ßå!®Ø\'Û~\À\Îp\r#Je\Âπ+R=uù\À˙m£^JæÇUí|®≤\ F\ÔopìCºˆ˙(h_oI3ô\Ã]puB4˚+Æq.¢\÷Cóç∂I[\ŸIMõgTm(ã¸FÚáFúg/\"\ÍXñ∑ÆAˇ]ôØ\03#∞®)I\Œ5\„≠r\ÿ¨¿c”®} ™\„G\⁄˚Ö@©@Qæ|\0∫\¬E(àNëû\Âwî\ÿÃ•˛uD\ŒK\0ñ˛h\‘*\‰Y™C•.É1\€\‡UrX4<ûy¢\≈Ãê;≤\»˘_Bø@áD1p~mx\ﬁV\ÀﬁØ\Ëªg¥5ZeÚ+x\–\„\‡H∂\Ã\'\√P\rDÈæ¨ü\ÎÄlw≠ü˙ˆP\Õ\Ãd˘x\Ï>]h˜¸≠Bã∞õ\’Gºæ\‘GØ≠R∑¬à|\»\“`˝ú\ÈèQ\ÏÅ\Ív¢\€”†¿BøÜC,EÓ∂àRO¯g*µ˜/6Ú˚9†p™8!ƒ≠å\ÊÏîØ†q\"BZ45xH2≈¢-G:†ôI83%©æ\’$ÒÇ|ôãaY\€\0<‹¥§ZΩ\»W≥õ\ÿ0\Ï&™\—\Ê\œaTn\Õ\‡Uπ\ÿ√¢\”Ztöù¶ep™\Z\ÿ\‘i#EøôåF®6\Œ˝\È*\€\Ì\\\ÁÛoæ≠&H\'	ê=\–c6πm\"ƒ∂6®W\È\∆\‹JVQSq*Í≤®bßì¶,ÛQõ†©ûd∂±{\Œ4\“{r≤±\ u!∆≤\Ë\◊F°n£¶-Ëµí\Ãñ7aÆ\ÌL≠∏ëÉ\Í7i@\„{PûLÈñÆ%$ê\¬(\–Ù\'q˚∞c∂Ä\√w`ûî`@˘à5	¥eˆ¿∞\‘\„\Zó≤\»Ú9¿f’£°öóV%ıÆØ¢ìùM(ñ√´˙q\Œa˙\Ísæ\ﬂ˜QÄ\Ë®w^\Àìw\“\nRZ0«≤ãE\ÕO\‡tn`≈á\≈Ëó∏eY=\ﬁm.˘˜í\'2_™˝CN`∆Æä(!ñk\«˚M\–ƒç˚4uùõ∫%º4)±èH¶[¯\–/™;ı˝}\\å˛8õ*\‰X¸å\‘=Mwh\r\Zt\n\—\\\'\"\‹\n∆Ñ\ÏZ~M3µÅ-9\Ÿ8\⁄R8â§gÜ_@uWN¿\Ê4∫≤Íìöœπõ5b5\ÀÛT^RcSVhßb\‡>b\0#\‰è\ÿ5:°,˚w\ÃcTß®Pmaù\◊˘¢˙º\'¶ ˛E	e0\√X‘éBIãFx\\yæï¿U\Ïı\"≠8°ré\„ı[¸ÑE\ﬁr:!5àdIAñ\«h\Ì\'Z4Wt∞∂Å∂Øg\Œ4ÈÜ≤ˆv\‰<\«Q˝]à-Ùˇ\\\‚\ÿA(5`m,Ø	Áöå¬âíV®\Z˙XdØ\—*¶\ÁPbéı<¶B%+˚#c.V*†\È\ÌPéîò,V’ôy(:å\0∞F#\"|Fu7Üô¡™l+\0(øñ¥\Ô≈ÄÙbÛü≤Ç\Ã`x⁄óPR˝7’ù*)˘.^U(\Ë\\éŒúä˜;Ü∂ËÑ´P–ô\0Éyó\Z¿ô\Í\«Ò\Ë¸\0àj\À\Ï8ôß˝\Z\«\–Ûì\ﬁ\›y\ŸdÖQ\Êe©üÆZÛ	\∆EO¿∑˝\€h\¬u)à\–\–Óµ¥hª3∂!õ[SU\ƒ\'®\·_åàq¸¢ı\«(.˝îROØB\—bÚ∫Wõ—∂h\ÔØ‘ãG\r\»N´\÷¿)û\Œ\Ó\È|V¶F¸hˇ¡&D]\ÓÙ\ÍE4 kèy6hw\‚ı†=\ﬂ\‡\ƒ?D©Ω\'õ≥πïu¸b-\·Ts˚òGï≤îy≠yà¨`8ó¢\ﬂ\«<Ö\na+V\¬\rh˜2	Ûxö´1\◊—ñMAºÅyó)l\ﬁk$∏¸≥¨Hë\√yô7¸˝t\r¢ïj\ÀHÙ/6-\”J¿u&<}\"¢Qƒïn@{≥jK\Zµ.`-N±B⁄Ü\Èö”´hµM/^ïÇù\\ﬂÄ1vS\√/GJPî!Ω6#¢Ω£9∂:Cb˝±ˆÄ\ÊDƒçR\›_\Ã9ç¯ÜC\rã˛SU]SE4;ºÚ\–B™oØ\"¢(˘¯˜Px)\'å\ÂÃµp ≤\‘	ﬁù”ú{àP\Ô4	˛\Â0,@:\—LïçÅ\\j\’_˘g˘08Ç0\Ócã\"!\‹\Î,x77ÆÒ\Z\nùùd˚\"~Åh\‡É\Áì\Á∫˘\ﬁ~Pï9I∏˝,FS\Á\‘;km@F2?\n%˚5z|:˙∏5h\–D\Ì\€C\ÿtG\¬TETì\Â}-˛\Àqz\Á{\n•˚iI\Ó≥Qø3˛#\Ê\Ãdt˛-\∆!\ŸDWD\“#w#e&∞ö\ZÒ¿QND˚wÅïÄ›îj\Ìq≤¢\‘{p§£kõß£+‹è{gZ«´r–•l´¡\"¸lém$l\€p$I?Ä1ª`<\…¯\À:$ì\Í\ÏBi\ÊbñBìùc]ö\Œ›Äk8qç∞vçCîdíWì\ËxU\ﬁ\'πyûø¿°¨†Qí\È.à=oÖÅ3µÅVÖò %ñ˛|Fı\◊=äV\ +≠û$ãE\'^9Oı7K\Ì\œLıÉËΩ≤ZÖ\‰»´≥I\Œ4x¯áa∞\œ\¬Aï\·>\Œ\ƒgù–è∑≥≥æ\0`_c:\Z¡ò\rF¥(D\‰ù~@3—∑3)±æS:∏\ﬂ _?µÄì\\®M)\Ë¥\Ó8\÷~x/\∆\Ô¡\∆F!\’Pn\Èp/ÿΩ\Â\ÿ%h[p›ãXes,⁄æƒë¢\nieêL\”ò\…D˜ÅJKKrè\÷uîAò)J¿w\"ˆd¥±˛Ú•x^∂\Ã\‚W\»˚\np\”\…\Ê$π\∆\0D˜(¢-ã]ù]¢\”:Ühkπù\ÁiÑ¸d3˛ø™èÒ+\Ó;\ÿ\ﬂUn˛4\nK…∂P(P\«h˝\Î\◊\n;^ª∆≤î,]|ûÑXæÀ´±Tw	Vû\∆\ﬁv\0ºu™øè‡æûbS(¡\’ŸñZ?=g`xí\⁄—°5¿MY9\ZíÉ\\SÅl3®e:Y	j\ÊBn©v°J5ós˚z\“ùS\–\∆.\'\‘\“%õjhÃúÄ\0Z=_\Z¢Û•òˆh`oe[ö\‚∫\À)Ò#Ò2ßi∞\ÏùüM\…7◊ôébV˜ı´ÑN@tÚS˝_]ä\Î˝ˇwfHuÕôHe¶\„m\–\Èˇ\€Hk ZµD€Ω¯\Ó\'(òùÉäπNTª\Á|_;\Á\"¥\ÎVJLç…îiæÒÚ\À/˜Bhå†ë≥∏8\‚\"©\∆/\·!w\¬˚ö\Ï¿\Î\ F5\Â¸vT!+Q¡≠/AìFO“ò\“\Í4õCü\Zp0jCï\nJ\Ã\'6∏£Qö~\‘7vD3/\ÿB5®™\’@\€Z p\…\„\À˛_Ä\0≥‡Øòs]J˝\0\0\0\0IENDÆB`Ç'),(2,0,_binary 'Canned Attachments Rock!');
/*!40000 ALTER TABLE `ost_file_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_filter`
--

DROP TABLE IF EXISTS `ost_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `execorder` int(10) unsigned NOT NULL DEFAULT '99',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `flags` int(10) unsigned DEFAULT '0',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_filter`
--

LOCK TABLES `ost_filter` WRITE;
/*!40000 ALTER TABLE `ost_filter` DISABLE KEYS */;
INSERT INTO `ost_filter` VALUES (1,99,1,0,0,0,0,'Email',0,'SYSTEM BAN LIST','Internal list for email banning. Do not remove','2021-11-05 11:13:13','2021-11-05 11:13:13');
/*!40000 ALTER TABLE `ost_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_filter_action`
--

DROP TABLE IF EXISTS `ost_filter_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_filter_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL,
  `configuration` text,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_filter_action`
--

LOCK TABLES `ost_filter_action` WRITE;
/*!40000 ALTER TABLE `ost_filter_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_filter_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_filter_rule`
--

DROP TABLE IF EXISTS `ost_filter_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_filter_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  KEY `filter_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_filter_rule`
--

LOCK TABLES `ost_filter_rule` WRITE;
/*!40000 ALTER TABLE `ost_filter_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_filter_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_form`
--

DROP TABLE IF EXISTS `ost_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_form`
--

LOCK TABLES `ost_form` WRITE;
/*!40000 ALTER TABLE `ost_form` DISABLE KEYS */;
INSERT INTO `ost_form` VALUES (1,NULL,'U',1,'Contact Information',NULL,'',NULL,'2021-11-05 11:13:10','2021-11-05 11:13:10'),(2,NULL,'T',1,'Ticket Details','Please Describe Your Issue','','This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.','2021-11-05 11:13:11','2021-11-05 11:13:11'),(3,NULL,'C',1,'Company Information','Details available in email templates','',NULL,'2021-11-05 11:13:11','2021-11-05 11:13:11'),(4,NULL,'O',1,'Organization Information','Details on user organization','',NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(5,NULL,'A',1,'Task Details','Please Describe The Issue','','This form is used to create a task.','2021-11-05 11:13:12','2021-11-05 11:13:12'),(6,NULL,'L1',0,'Ticket Status Properties','Properties that can be set on a ticket status.','',NULL,'2021-11-05 11:13:13','2021-11-05 11:13:13');
/*!40000 ALTER TABLE `ost_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_form_entry`
--

DROP TABLE IF EXISTS `ost_form_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_form_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) unsigned NOT NULL DEFAULT '1',
  `extra` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_lookup` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_form_entry`
--

LOCK TABLES `ost_form_entry` WRITE;
/*!40000 ALTER TABLE `ost_form_entry` DISABLE KEYS */;
INSERT INTO `ost_form_entry` VALUES (1,4,1,'O',1,NULL,'2021-11-05 11:13:13','2021-11-05 11:13:13'),(2,3,NULL,'C',1,NULL,'2021-11-05 11:13:21','2021-11-05 11:13:21'),(3,1,1,'U',1,NULL,'2021-11-05 11:13:21','2021-11-05 11:13:21'),(5,5,1,'A',1,NULL,'2021-11-05 11:14:49','2021-11-05 11:14:49');
/*!40000 ALTER TABLE `ost_form_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_form_entry_values`
--

DROP TABLE IF EXISTS `ost_form_entry_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_form_entry_values` (
  `entry_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_form_entry_values`
--

LOCK TABLES `ost_form_entry_values` WRITE;
/*!40000 ALTER TABLE `ost_form_entry_values` DISABLE KEYS */;
INSERT INTO `ost_form_entry_values` VALUES (1,28,'1120 5th Street\nAlexandria, LA 71301',NULL),(1,29,'3182903674',NULL),(1,30,'https://osticket.com',NULL),(1,31,'Not only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.',NULL),(2,23,'SBDI Support',NULL),(2,24,NULL,NULL),(2,25,NULL,NULL),(2,26,NULL,NULL),(3,3,NULL,NULL),(3,4,NULL,NULL),(5,32,'Check db initiailized',NULL);
/*!40000 ALTER TABLE `ost_form_entry_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_form_field`
--

DROP TABLE IF EXISTS `ost_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_form_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `flags` int(10) unsigned DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) unsigned NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_form_field`
--

LOCK TABLES `ost_form_field` WRITE;
/*!40000 ALTER TABLE `ost_form_field` DISABLE KEYS */;
INSERT INTO `ost_form_field` VALUES (1,1,489395,'text','Email Address','email','{\"size\":40,\"length\":64,\"validator\":\"email\"}',1,NULL,'2021-11-05 11:13:10','2021-11-05 11:13:10'),(2,1,489395,'text','Full Name','name','{\"size\":40,\"length\":64}',2,NULL,'2021-11-05 11:13:10','2021-11-05 11:13:10'),(3,1,13057,'phone','Phone Number','phone',NULL,3,NULL,'2021-11-05 11:13:10','2021-11-05 11:13:10'),(4,1,12289,'memo','Internal Notes','notes','{\"rows\":4,\"cols\":40}',4,NULL,'2021-11-05 11:13:11','2021-11-05 11:13:11'),(20,2,489265,'text','Issue Summary','subject','{\"size\":40,\"length\":50}',1,NULL,'2021-11-05 11:13:11','2021-11-05 11:13:11'),(21,2,480547,'thread','Issue Details','message',NULL,2,'Details on the reason(s) for opening the ticket.','2021-11-05 11:13:11','2021-11-05 11:13:11'),(22,2,274609,'priority','Priority Level','priority',NULL,3,NULL,'2021-11-05 11:13:11','2021-11-05 11:13:11'),(23,3,291249,'text','Company Name','name','{\"size\":40,\"length\":64}',1,NULL,'2021-11-05 11:13:11','2021-11-05 11:13:11'),(24,3,274705,'text','Website','website','{\"size\":40,\"length\":64}',2,NULL,'2021-11-05 11:13:11','2021-11-05 11:13:11'),(25,3,274705,'phone','Phone Number','phone','{\"ext\":false}',3,NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(26,3,12545,'memo','Address','address','{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}',4,NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(27,4,489395,'text','Name','name','{\"size\":40,\"length\":64}',1,NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(28,4,13057,'memo','Address','address','{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}',2,NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(29,4,13057,'phone','Phone','phone',NULL,3,NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(30,4,13057,'text','Website','website','{\"size\":40,\"length\":0}',4,NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(31,4,12289,'memo','Internal Notes','notes','{\"rows\":4,\"cols\":40}',5,NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(32,5,487601,'text','Title','title','{\"size\":40,\"length\":50}',1,NULL,'2021-11-05 11:13:12','2021-11-05 11:13:12'),(33,5,413939,'thread','Description','description',NULL,2,'Details on the reason(s) for creating the task.','2021-11-05 11:13:13','2021-11-05 11:13:13'),(34,6,487665,'state','State','state','{\"prompt\":\"State of a ticket\"}',1,NULL,'2021-11-05 11:13:13','2021-11-05 11:13:13'),(35,6,471073,'memo','Description','description','{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}',3,NULL,'2021-11-05 11:13:13','2021-11-05 11:13:13');
/*!40000 ALTER TABLE `ost_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_group`
--

DROP TABLE IF EXISTS `ost_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `flags` int(11) unsigned NOT NULL DEFAULT '1',
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_group`
--

LOCK TABLES `ost_group` WRITE;
/*!40000 ALTER TABLE `ost_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_help_topic`
--

DROP TABLE IF EXISTS `ost_help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned DEFAULT '0',
  `status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `page_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_pid`),
  KEY `topic_pid` (`topic_pid`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`,`team_id`),
  KEY `sla_id` (`sla_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_help_topic`
--

LOCK TABLES `ost_help_topic` WRITE;
/*!40000 ALTER TABLE `ost_help_topic` DISABLE KEYS */;
INSERT INTO `ost_help_topic` VALUES (1,0,1,0,2,0,2,0,0,0,0,0,0,1,'General Inquiry',NULL,'Questions about products or services','2021-11-05 11:13:13','2021-11-05 11:13:13'),(2,0,1,0,2,0,1,0,0,0,0,0,0,0,'Feedback',NULL,'Tickets that primarily concern the sales and billing departments','2021-11-05 11:13:13','2021-11-05 11:13:13'),(10,0,1,0,2,0,2,3,0,0,0,0,0,0,'Report a Problem',NULL,'Product, service, or equipment related issues','2021-11-05 11:13:13','2021-11-05 11:13:13'),(11,10,1,0,2,0,3,0,0,0,1,0,0,1,'Access Issue',NULL,'Report an inability access a physical or virtual asset','2021-11-05 11:13:13','2021-11-05 11:13:13');
/*!40000 ALTER TABLE `ost_help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_help_topic_form`
--

DROP TABLE IF EXISTS `ost_help_topic_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_help_topic_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '1',
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `topic-form` (`topic_id`,`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_help_topic_form`
--

LOCK TABLES `ost_help_topic_form` WRITE;
/*!40000 ALTER TABLE `ost_help_topic_form` DISABLE KEYS */;
INSERT INTO `ost_help_topic_form` VALUES (1,1,2,1,'{\"disable\":[]}'),(2,2,2,1,'{\"disable\":[]}'),(3,10,2,1,'{\"disable\":[]}'),(4,11,2,1,'{\"disable\":[]}');
/*!40000 ALTER TABLE `ost_help_topic_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_list`
--

DROP TABLE IF EXISTS `ost_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_list`
--

LOCK TABLES `ost_list` WRITE;
/*!40000 ALTER TABLE `ost_list` DISABLE KEYS */;
INSERT INTO `ost_list` VALUES (1,'Ticket Status','Ticket Statuses','SortCol',13,'ticket-status','{\"handler\":\"TicketStatusList\"}','Ticket statuses','2021-11-05 11:13:13','2021-11-05 11:13:13');
/*!40000 ALTER TABLE `ost_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_list_items`
--

DROP TABLE IF EXISTS `ost_list_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_list_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text,
  PRIMARY KEY (`id`),
  KEY `list_item_lookup` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_list_items`
--

LOCK TABLES `ost_list_items` WRITE;
/*!40000 ALTER TABLE `ost_list_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_list_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_lock`
--

DROP TABLE IF EXISTS `ost_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_lock` (
  `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`lock_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_lock`
--

LOCK TABLES `ost_lock` WRITE;
/*!40000 ALTER TABLE `ost_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_note`
--

DROP TABLE IF EXISTS `ost_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT NULL,
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ext_id` (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_note`
--

LOCK TABLES `ost_note` WRITE;
/*!40000 ALTER TABLE `ost_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_organization`
--

DROP TABLE IF EXISTS `ost_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_organization` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_organization`
--

LOCK TABLES `ost_organization` WRITE;
/*!40000 ALTER TABLE `ost_organization` DISABLE KEYS */;
INSERT INTO `ost_organization` VALUES (1,'osTicket','',8,'',NULL,'2021-11-05 11:13:13',NULL);
/*!40000 ALTER TABLE `ost_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_organization__cdata`
--

DROP TABLE IF EXISTS `ost_organization__cdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_organization__cdata` (
  `org_id` int(11) unsigned NOT NULL,
  `name` mediumtext,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_organization__cdata`
--

LOCK TABLES `ost_organization__cdata` WRITE;
/*!40000 ALTER TABLE `ost_organization__cdata` DISABLE KEYS */;
INSERT INTO `ost_organization__cdata` VALUES (1,NULL);
/*!40000 ALTER TABLE `ost_organization__cdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_plugin`
--

DROP TABLE IF EXISTS `ost_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `installed` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_plugin`
--

LOCK TABLES `ost_plugin` WRITE;
/*!40000 ALTER TABLE `ost_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_queue`
--

DROP TABLE IF EXISTS `ost_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `columns_id` int(11) unsigned DEFAULT NULL,
  `sort_id` int(11) unsigned DEFAULT NULL,
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(60) DEFAULT NULL,
  `config` text,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_queue`
--

LOCK TABLES `ost_queue` WRITE;
/*!40000 ALTER TABLE `ost_queue` DISABLE KEYS */;
INSERT INTO `ost_queue` VALUES (1,0,NULL,1,3,0,1,'Open','[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]',NULL,'T','/','2021-11-05 11:13:14','0000-00-00 00:00:00'),(2,1,NULL,4,43,0,1,'Open','{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:14','0000-00-00 00:00:00'),(3,1,NULL,4,43,0,2,'Answered','{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:15','0000-00-00 00:00:00'),(4,1,NULL,4,43,0,3,'Overdue','{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:15','0000-00-00 00:00:00'),(5,0,NULL,3,3,0,3,'My Tickets','{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:15','0000-00-00 00:00:00'),(6,5,NULL,NULL,43,0,1,'Assigned to Me','{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:15','0000-00-00 00:00:00'),(7,5,NULL,NULL,43,0,2,'Assigned to Teams','{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:16','0000-00-00 00:00:00'),(8,0,NULL,5,3,0,4,'Closed','{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:16','0000-00-00 00:00:00'),(9,8,NULL,5,43,0,1,'Today','{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:16','0000-00-00 00:00:00'),(10,8,NULL,5,43,0,2,'Yesterday','{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:16','0000-00-00 00:00:00'),(11,8,NULL,5,43,0,3,'This Week','{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:16','0000-00-00 00:00:00'),(12,8,NULL,5,43,0,4,'This Month','{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:17','0000-00-00 00:00:00'),(13,8,NULL,6,43,0,5,'This Quarter','{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:17','0000-00-00 00:00:00'),(14,8,NULL,7,43,0,6,'This Year','{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}',NULL,'T','/','2021-11-05 11:13:17','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_queue_column`
--

DROP TABLE IF EXISTS `ost_queue_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_queue_column` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text,
  `conditions` text,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_queue_column`
--

LOCK TABLES `ost_queue_column` WRITE;
/*!40000 ALTER TABLE `ost_queue_column` DISABLE KEYS */;
INSERT INTO `ost_queue_column` VALUES (1,0,'Ticket #','number',NULL,'link:ticketP','wrap','[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]','[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]',NULL),(2,0,'Date Created','created',NULL,'date:full','wrap','[]','[]',NULL),(3,0,'Subject','cdata__subject',NULL,'link:ticket','ellipsis','[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]','[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]',NULL),(4,0,'User Name','user__name',NULL,NULL,'wrap','[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]','[]',NULL),(5,0,'Priority','cdata__priority',NULL,NULL,'wrap','[]','[]',NULL),(6,0,'Status','status__id',NULL,NULL,'wrap','[]','[]',NULL),(7,0,'Close Date','closed',NULL,'date:full','wrap','[]','[]',NULL),(8,0,'Assignee','assignee',NULL,NULL,'wrap','[]','[]',NULL),(9,0,'Due Date','duedate','est_duedate','date:human','wrap','[]','[]',NULL),(10,0,'Last Updated','lastupdate',NULL,'date:full','wrap','[]','[]',NULL),(11,0,'Department','dept_id',NULL,NULL,'wrap','[]','[]',NULL),(12,0,'Last Message','thread__lastmessage',NULL,'date:human','wrap','[]','[]',NULL),(13,0,'Last Response','thread__lastresponse',NULL,'date:human','wrap','[]','[]',NULL),(14,0,'Team','team_id',NULL,NULL,'wrap','[]','[]',NULL);
/*!40000 ALTER TABLE `ost_queue_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_queue_columns`
--

DROP TABLE IF EXISTS `ost_queue_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_queue_columns` (
  `queue_id` int(11) unsigned NOT NULL,
  `column_id` int(11) unsigned NOT NULL,
  `staff_id` int(11) unsigned NOT NULL,
  `bits` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '1',
  `heading` varchar(64) DEFAULT NULL,
  `width` int(10) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`queue_id`,`column_id`,`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_queue_columns`
--

LOCK TABLES `ost_queue_columns` WRITE;
/*!40000 ALTER TABLE `ost_queue_columns` DISABLE KEYS */;
INSERT INTO `ost_queue_columns` VALUES (1,1,0,1,1,'Ticket',100),(1,3,0,1,3,'Subject',300),(1,4,0,1,4,'From',185),(1,5,0,1,5,'Priority',85),(1,8,0,1,6,'Assigned To',160),(1,10,0,1,2,'Last Updated',150),(2,1,0,1,1,'Ticket',100),(2,3,0,1,3,'Subject',300),(2,4,0,1,4,'From',185),(2,5,0,1,5,'Priority',85),(2,8,0,1,6,'Assigned To',160),(2,10,0,1,2,'Last Updated',150),(3,1,0,1,1,'Ticket',100),(3,3,0,1,3,'Subject',300),(3,4,0,1,4,'From',185),(3,5,0,1,5,'Priority',85),(3,8,0,1,6,'Assigned To',160),(3,10,0,1,2,'Last Updated',150),(4,1,0,1,1,'Ticket',100),(4,3,0,1,3,'Subject',300),(4,4,0,1,4,'From',185),(4,5,0,1,5,'Priority',85),(4,8,0,1,6,'Assigned To',160),(4,9,0,1,9,'Due Date',150),(5,1,0,1,1,'Ticket',100),(5,3,0,1,3,'Subject',300),(5,4,0,1,4,'From',185),(5,5,0,1,5,'Priority',85),(5,10,0,1,2,'Last Update',150),(5,11,0,1,6,'Department',160),(6,1,0,1,1,'Ticket',100),(6,3,0,1,3,'Subject',300),(6,4,0,1,4,'From',185),(6,5,0,1,5,'Priority',85),(6,10,0,1,2,'Last Update',150),(6,11,0,1,6,'Department',160),(7,1,0,1,1,'Ticket',100),(7,3,0,1,3,'Subject',300),(7,4,0,1,4,'From',185),(7,5,0,1,5,'Priority',85),(7,10,0,1,2,'Last Update',150),(7,14,0,1,6,'Team',160),(8,1,0,1,1,'Ticket',100),(8,3,0,1,3,'Subject',300),(8,4,0,1,4,'From',185),(8,7,0,1,2,'Date Closed',150),(8,8,0,1,6,'Closed By',160),(9,1,0,1,1,'Ticket',100),(9,3,0,1,3,'Subject',300),(9,4,0,1,4,'From',185),(9,7,0,1,2,'Date Closed',150),(9,8,0,1,6,'Closed By',160),(10,1,0,1,1,'Ticket',100),(10,3,0,1,3,'Subject',300),(10,4,0,1,4,'From',185),(10,7,0,1,2,'Date Closed',150),(10,8,0,1,6,'Closed By',160),(11,1,0,1,1,'Ticket',100),(11,3,0,1,3,'Subject',300),(11,4,0,1,4,'From',185),(11,7,0,1,2,'Date Closed',150),(11,8,0,1,6,'Closed By',160),(12,1,0,1,1,'Ticket',100),(12,3,0,1,3,'Subject',300),(12,4,0,1,4,'From',185),(12,7,0,1,2,'Date Closed',150),(12,8,0,1,6,'Closed By',160),(13,1,0,1,1,'Ticket',100),(13,3,0,1,3,'Subject',300),(13,4,0,1,4,'From',185),(13,7,0,1,2,'Date Closed',150),(13,8,0,1,6,'Closed By',160),(14,1,0,1,1,'Ticket',100),(14,3,0,1,3,'Subject',300),(14,4,0,1,4,'From',185),(14,7,0,1,2,'Date Closed',150),(14,8,0,1,6,'Closed By',160);
/*!40000 ALTER TABLE `ost_queue_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_queue_config`
--

DROP TABLE IF EXISTS `ost_queue_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_queue_config` (
  `queue_id` int(11) unsigned NOT NULL,
  `staff_id` int(11) unsigned NOT NULL,
  `setting` text,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`queue_id`,`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_queue_config`
--

LOCK TABLES `ost_queue_config` WRITE;
/*!40000 ALTER TABLE `ost_queue_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_queue_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_queue_export`
--

DROP TABLE IF EXISTS `ost_queue_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_queue_export` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) unsigned NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `queue_id` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_queue_export`
--

LOCK TABLES `ost_queue_export` WRITE;
/*!40000 ALTER TABLE `ost_queue_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_queue_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_queue_sort`
--

DROP TABLE IF EXISTS `ost_queue_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_queue_sort` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_queue_sort`
--

LOCK TABLES `ost_queue_sort` WRITE;
/*!40000 ALTER TABLE `ost_queue_sort` DISABLE KEYS */;
INSERT INTO `ost_queue_sort` VALUES (1,NULL,'Priority + Most Recently Updated','[\"-cdata__priority\",\"-lastupdate\"]','2021-11-05 11:13:14'),(2,NULL,'Priority + Most Recently Created','[\"-cdata__priority\",\"-created\"]','2021-11-05 11:13:14'),(3,NULL,'Priority + Due Date','[\"-cdata__priority\",\"-est_duedate\"]','2021-11-05 11:13:14'),(4,NULL,'Due Date','[\"-est_duedate\"]','2021-11-05 11:13:14'),(5,NULL,'Closed Date','[\"-closed\"]','2021-11-05 11:13:14'),(6,NULL,'Create Date','[\"-created\"]','2021-11-05 11:13:14'),(7,NULL,'Update Date','[\"-lastupdate\"]','2021-11-05 11:13:14');
/*!40000 ALTER TABLE `ost_queue_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_queue_sorts`
--

DROP TABLE IF EXISTS `ost_queue_sorts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_queue_sorts` (
  `queue_id` int(11) unsigned NOT NULL,
  `sort_id` int(11) unsigned NOT NULL,
  `bits` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`queue_id`,`sort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_queue_sorts`
--

LOCK TABLES `ost_queue_sorts` WRITE;
/*!40000 ALTER TABLE `ost_queue_sorts` DISABLE KEYS */;
INSERT INTO `ost_queue_sorts` VALUES (1,1,0,0),(1,2,0,0),(1,3,0,0),(1,4,0,0),(1,6,0,0),(1,7,0,0),(5,1,0,0),(5,2,0,0),(5,3,0,0),(5,4,0,0),(5,6,0,0),(5,7,0,0),(6,1,0,0),(6,2,0,0),(6,3,0,0),(6,4,0,0),(6,6,0,0),(6,7,0,0),(7,1,0,0),(7,2,0,0),(7,3,0,0),(7,4,0,0),(7,6,0,0),(7,7,0,0),(8,1,0,0),(8,2,0,0),(8,3,0,0),(8,4,0,0),(8,5,0,0),(8,6,0,0),(8,7,0,0),(9,1,0,0),(9,2,0,0),(9,3,0,0),(9,4,0,0),(9,5,0,0),(9,6,0,0),(9,7,0,0),(10,1,0,0),(10,2,0,0),(10,3,0,0),(10,4,0,0),(10,5,0,0),(10,6,0,0),(10,7,0,0),(11,1,0,0),(11,2,0,0),(11,3,0,0),(11,4,0,0),(11,5,0,0),(11,6,0,0),(11,7,0,0),(12,1,0,0),(12,2,0,0),(12,3,0,0),(12,4,0,0),(12,5,0,0),(12,6,0,0),(12,7,0,0),(13,1,0,0),(13,2,0,0),(13,3,0,0),(13,4,0,0),(13,5,0,0),(13,6,0,0),(13,7,0,0),(14,1,0,0),(14,2,0,0),(14,3,0,0),(14,4,0,0),(14,5,0,0),(14,6,0,0),(14,7,0,0);
/*!40000 ALTER TABLE `ost_queue_sorts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_role`
--

DROP TABLE IF EXISTS `ost_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `flags` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `permissions` text,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_role`
--

LOCK TABLES `ost_role` WRITE;
/*!40000 ALTER TABLE `ost_role` DISABLE KEYS */;
INSERT INTO `ost_role` VALUES (1,1,'All Access','{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}','Role with unlimited access','2021-11-05 11:13:13','2021-11-05 11:13:13'),(2,1,'Expanded Access','{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}','Role with expanded access','2021-11-05 11:13:13','2021-11-05 11:13:13'),(3,1,'Limited Access','{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}','Role with limited access','2021-11-05 11:13:13','2021-11-05 11:13:13'),(4,1,'View only',NULL,'Simple role with no permissions','2021-11-05 11:13:13','2021-11-05 11:13:13');
/*!40000 ALTER TABLE `ost_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_schedule`
--

DROP TABLE IF EXISTS `ost_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_schedule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_schedule`
--

LOCK TABLES `ost_schedule` WRITE;
/*!40000 ALTER TABLE `ost_schedule` DISABLE KEYS */;
INSERT INTO `ost_schedule` VALUES (1,1,'Monday - Friday 8am - 5pm with U.S. Holidays',NULL,'','2021-11-05 11:13:17','2021-11-05 11:13:17'),(2,1,'24/7',NULL,'','2021-11-05 11:13:17','2021-11-05 11:13:17'),(3,1,'24/5',NULL,'','2021-11-05 11:13:17','2021-11-05 11:13:17'),(4,0,'U.S. Holidays',NULL,'','2021-11-05 11:13:17','2021-11-05 11:13:17');
/*!40000 ALTER TABLE `ost_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_schedule_entry`
--

DROP TABLE IF EXISTS `ost_schedule_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_schedule_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `repeats` (`repeats`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_schedule_entry`
--

LOCK TABLES `ost_schedule_entry` WRITE;
/*!40000 ALTER TABLE `ost_schedule_entry` DISABLE KEYS */;
INSERT INTO `ost_schedule_entry` VALUES (1,1,0,0,'Monday','weekly','2019-01-07','08:00:00','2019-01-07','17:00:00',NULL,1,NULL,NULL,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(2,1,0,0,'Tuesday','weekly','2019-01-08','08:00:00','2019-01-08','17:00:00',NULL,2,NULL,NULL,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(3,1,0,0,'Wednesday','weekly','2019-01-09','08:00:00','2019-01-09','17:00:00',NULL,3,NULL,NULL,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(4,1,0,0,'Thursday','weekly','2019-01-10','08:00:00','2019-01-10','17:00:00',NULL,4,NULL,NULL,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(5,1,0,0,'Friday','weekly','2019-01-11','08:00:00','2019-01-11','17:00:00',NULL,5,NULL,NULL,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(6,2,0,0,'Daily','daily','2019-01-01','00:00:00','2019-01-01','23:59:59',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(7,3,0,0,'Weekdays','weekdays','2019-01-01','00:00:00','2019-01-01','23:59:59',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(8,4,0,0,'New Year\'s Day','yearly','2019-01-01','00:00:00','2019-01-01','23:59:59',NULL,1,NULL,1,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(9,4,0,0,'MLK Day','yearly','2019-01-21','00:00:00','2019-01-21','23:59:59',NULL,1,3,1,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(10,4,0,0,'Memorial Day','yearly','2019-05-27','00:00:00','2019-05-27','23:59:59',NULL,1,-1,5,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(11,4,0,0,'Independence Day (4th of July)','yearly','2019-07-04','00:00:00','2019-07-04','23:59:59',NULL,4,NULL,7,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(12,4,0,0,'Labor Day','yearly','2019-09-02','00:00:00','2019-09-02','23:59:59',NULL,1,1,9,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(13,4,0,0,'Indigenous Peoples\' Day (Whodat Columbus)','yearly','2019-10-14','00:00:00','2019-10-14','23:59:59',NULL,1,2,10,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(14,4,0,0,'Veterans Day','yearly','2019-11-11','00:00:00','2019-11-11','23:59:59',NULL,11,NULL,11,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(15,4,0,0,'Thanksgiving Day','yearly','2019-11-28','00:00:00','2019-11-28','23:59:59',NULL,4,4,11,'0000-00-00 00:00:00','2021-11-05 11:13:17'),(16,4,0,0,'Christmas Day','yearly','2019-11-25','00:00:00','2019-11-25','23:59:59',NULL,25,NULL,12,'0000-00-00 00:00:00','2021-11-05 11:13:17');
/*!40000 ALTER TABLE `ost_schedule_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_sequence`
--

DROP TABLE IF EXISTS `ost_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_sequence` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `flags` int(10) unsigned DEFAULT NULL,
  `next` bigint(20) unsigned NOT NULL DEFAULT '1',
  `increment` int(11) DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_sequence`
--

LOCK TABLES `ost_sequence` WRITE;
/*!40000 ALTER TABLE `ost_sequence` DISABLE KEYS */;
INSERT INTO `ost_sequence` VALUES (1,'General Tickets',1,1,1,'0','0000-00-00 00:00:00'),(2,'Tasks Sequence',1,2,1,'0','2021-11-05 11:14:49');
/*!40000 ALTER TABLE `ost_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_session`
--

DROP TABLE IF EXISTS `ost_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `updated` (`session_updated`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_session`
--

LOCK TABLES `ost_session` WRITE;
/*!40000 ALTER TABLE `ost_session` DISABLE KEYS */;
INSERT INTO `ost_session` VALUES ('00rmnvincr0ijqiulj4ug54a8t',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"cce0659f35804096c50eb119bf86ab6e9f6af417\";s:4:\"time\";i:1636111355;}','2021-11-06 11:22:35',NULL,'0','127.0.0.1','curl/7.78.0'),('01q1kivvua1e1omruo4osgqkc3',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"c3039f568cf2ad6766b62ac18e75f23c1e81f6fb\";s:4:\"time\";i:1636110962;}','2021-11-06 11:16:02',NULL,'0','127.0.0.1','curl/7.78.0'),('09qlsdlibu1rj1svs26gvpb76f',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"90d6c3966a29299cf2737356a10cdfd053fcf775\";s:4:\"time\";i:1636112899;}','2021-11-06 11:48:19',NULL,'0','127.0.0.1','curl/7.78.0'),('0i3e0nbh3pjmlh6cm7nmcf1d7k',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"b20841578edeeafe0ca332b6849dbf0e142a5b73\";s:4:\"time\";i:1636113050;}','2021-11-06 11:50:50',NULL,'0','127.0.0.1','curl/7.78.0'),('0p4mem318rphb1t6e8pg185sku',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"7a8ae6693683d545f6ab7de37c764295fa3d51cc\";s:4:\"time\";i:1636112202;}','2021-11-06 11:36:42',NULL,'0','127.0.0.1','curl/7.78.0'),('0uv8u7h2i3krhebkjtqo2pc0qu',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"162e4a0b3366dc212cd7565555d2cabd7b67a544\";s:4:\"time\";i:1636111960;}','2021-11-06 11:32:40',NULL,'0','127.0.0.1','curl/7.78.0'),('195nttnbr0e5u00mrfeinvrbsf',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"f4f59fa194d27e4f5d786d277583b7f811f16a98\";s:4:\"time\";i:1636111597;}','2021-11-06 11:26:37',NULL,'0','127.0.0.1','curl/7.78.0'),('1luihdqen1kbrpuvu29pc0nuiu',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"f92558d05ae82c61efe662e6a51f5d5e09161a87\";s:4:\"time\";i:1636110841;}','2021-11-06 11:14:01',NULL,'0','127.0.0.1','curl/7.78.0'),('20dhtjvbgr6835vgeihnq8lnsi',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"73a2ad606c3e5b63d25aa90a7bd1d594e5d737de\";s:4:\"time\";i:1636112536;}','2021-11-06 11:42:16',NULL,'0','127.0.0.1','curl/7.78.0'),('3chlnep4b43lrp0bncuak9tmqe',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"b76bcf8cfe3a411192773700676b8b7b498a9f95\";s:4:\"time\";i:1636112415;}','2021-11-06 11:40:15',NULL,'0','127.0.0.1','curl/7.78.0'),('6gcsq7m3l3dhma74re54rnvkck',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"06247e3d3e0784e6ca091d6a60f523ed9849edc8\";s:4:\"time\";i:1636110932;}','2021-11-06 11:15:32',NULL,'0','127.0.0.1','curl/7.78.0'),('73r9a1jtidql80210rqpcrt9vu',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"fcf1c436211e56b106dd4fdace6addf90ed1d771\";s:4:\"time\";i:1636111779;}','2021-11-06 11:29:39',NULL,'0','127.0.0.1','curl/7.78.0'),('7edsummoel0abt6jlhlf26ob1r',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"51ae8d556eb72646b01e28e0916128333280aaf1\";s:4:\"time\";i:1636111537;}','2021-11-06 11:25:37',NULL,'0','127.0.0.1','curl/7.78.0'),('7hmnhq9g9d3kqshfde7mdi3n75',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"f9144dd6c755d3d8dcb655599e6a7ae862625d52\";s:4:\"time\";i:1636113020;}','2021-11-06 11:50:20',NULL,'0','127.0.0.1','curl/7.78.0'),('8fggkrqeg4nm4gcormp9u9fg0a',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"388d01d336efafe3a90ac1038b3331b47f3b3405\";s:4:\"time\";i:1636112596;}','2021-11-06 11:43:16',NULL,'0','127.0.0.1','curl/7.78.0'),('8mddfoson7ug6bsoomag704d8o',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"c5def27adaa82a9b2b1524033221d93808515d6a\";s:4:\"time\";i:1636111295;}','2021-11-06 11:21:35',NULL,'0','127.0.0.1','curl/7.78.0'),('915llt9jlsoironhh9scoehrln',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"88a5f2aaf7c4d77554d8459ea3e233883b09d99d\";s:4:\"time\";i:1636110893;}_staff|a:1:{s:4:\"auth\";a:2:{s:4:\"dest\";s:16:\"/scp/tickets.php\";s:3:\"msg\";s:23:\"Authentication Required\";}}_auth|a:1:{s:5:\"staff\";a:3:{s:2:\"id\";i:1;s:3:\"key\";s:14:\"local:ostadmin\";s:3:\"2fa\";N;}}:token|a:1:{s:5:\"staff\";s:76:\"65462f638fe9776d445eae3150b0184e:1636110889:a799bfa76e49bb0e43190454ff941710\";}::Q:T|i:1;sort|a:1:{i:1;a:2:{s:9:\"queuesort\";O:9:\"QueueSort\":7:{s:8:\"_columns\";a:2:{s:15:\"cdata__priority\";b:1;s:10:\"lastupdate\";b:1;}s:6:\"_extra\";N;s:2:\"ht\";a:5:{s:2:\"id\";i:1;s:4:\"root\";N;s:4:\"name\";s:32:\"Priority + Most Recently Updated\";s:7:\"columns\";s:34:\"[\"-cdata__priority\",\"-lastupdate\"]\";s:7:\"updated\";s:19:\"2021-11-05 11:13:14\";}s:5:\"dirty\";a:0:{}s:7:\"__new__\";b:0;s:11:\"__deleted__\";b:0;s:12:\"__deferred__\";a:0:{}}s:3:\"dir\";i:0;}}cfg:core|a:1:{s:11:\"db_timezone\";s:3:\"UTC\";}lastcroncall|i:1636110823;::Q:A|s:0:\"\";:QA::sort|a:2:{i:0;s:7:\"created\";i:1;i:0;}:Q:tasks|C:8:\"QuerySet\":2559:{a:16:{s:5:\"model\";s:4:\"Task\";s:11:\"constraints\";a:2:{i:0;C:1:\"Q\":106:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{i:0;C:1:\"Q\":57:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{s:13:\"flags__hasbit\";i:1;}}}}}}i:1;C:1:\"Q\":383:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{i:0;C:1:\"Q\":333:{a:3:{i:0;i:0;i:1;i:2;i:2;a:3:{i:0;C:1:\"Q\":76:{a:3:{i:0;i:0;i:1;i:0;i:2;a:2:{s:13:\"flags__hasbit\";i:1;s:8:\"staff_id\";i:1;}}}i:1;C:1:\"Q\":100:{a:3:{i:0;i:0;i:1;i:0;i:2;a:2:{s:16:\"ticket__staff_id\";i:1;s:21:\"ticket__status__state\";s:4:\"open\";}}}i:2;C:1:\"Q\":73:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{s:11:\"dept_id__in\";a:2:{i:0;i:1;i:1;i:3;}}}}}}}}}}}s:16:\"path_constraints\";a:0:{}s:8:\"ordering\";a:1:{i:0;s:8:\"-created\";}s:7:\"related\";b:0;s:6:\"values\";a:13:{s:2:\"id\";s:2:\"id\";s:6:\"number\";s:6:\"number\";s:7:\"created\";s:7:\"created\";s:8:\"staff_id\";s:8:\"staff_id\";s:7:\"team_id\";s:7:\"team_id\";s:16:\"staff__firstname\";s:16:\"staff__firstname\";s:15:\"staff__lastname\";s:15:\"staff__lastname\";s:10:\"team__name\";s:10:\"team__name\";s:10:\"dept__name\";s:10:\"dept__name\";s:12:\"cdata__title\";s:12:\"cdata__title\";s:5:\"flags\";s:5:\"flags\";s:14:\"ticket__number\";s:14:\"ticket__number\";s:17:\"ticket__ticket_id\";s:17:\"ticket__ticket_id\";}s:5:\"defer\";a:0:{}s:10:\"aggregated\";b:0;s:11:\"annotations\";a:3:{s:12:\"collab_count\";O:12:\"SqlAggregate\":5:{s:4:\"func\";s:5:\"COUNT\";s:4:\"expr\";s:21:\"thread__collaborators\";s:8:\"distinct\";b:1;s:10:\"constraint\";b:0;s:5:\"alias\";s:12:\"collab_count\";}s:16:\"attachment_count\";O:12:\"SqlAggregate\":5:{s:4:\"func\";s:5:\"COUNT\";s:4:\"expr\";O:7:\"SqlCase\":5:{s:5:\"cases\";a:1:{i:0;a:2:{i:0;O:8:\"SqlField\":5:{s:5:\"level\";i:0;s:8:\"operator\";N;s:8:\"operands\";N;s:5:\"alias\";N;s:5:\"field\";s:36:\"thread__entries__attachments__inline\";}i:1;N;}}s:4:\"else\";O:8:\"SqlField\":5:{s:5:\"level\";i:0;s:8:\"operator\";N;s:8:\"operands\";N;s:5:\"alias\";N;s:5:\"field\";s:28:\"thread__entries__attachments\";}s:5:\"alias\";N;s:4:\"func\";s:4:\"CASE\";s:4:\"args\";a:0:{}}s:8:\"distinct\";b:1;s:10:\"constraint\";b:0;s:5:\"alias\";s:16:\"attachment_count\";}s:12:\"thread_count\";O:12:\"SqlAggregate\":5:{s:4:\"func\";s:5:\"COUNT\";s:4:\"expr\";O:7:\"SqlCase\":5:{s:5:\"cases\";a:1:{i:0;a:2:{i:0;C:1:\"Q\":74:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{s:30:\"thread__entries__flags__hasbit\";i:4;}}}i:1;N;}}s:4:\"else\";O:8:\"SqlField\":5:{s:5:\"level\";i:0;s:8:\"operator\";N;s:8:\"operands\";N;s:5:\"alias\";N;s:5:\"field\";s:19:\"thread__entries__id\";}s:5:\"alias\";N;s:4:\"func\";s:4:\"CASE\";s:4:\"args\";a:0:{}}s:8:\"distinct\";b:1;s:10:\"constraint\";b:0;s:5:\"alias\";s:12:\"thread_count\";}}s:5:\"extra\";a:0:{}s:8:\"distinct\";a:0:{}s:4:\"lock\";b:0;s:5:\"chain\";a:0:{}s:7:\"options\";a:0:{}s:4:\"iter\";i:2;s:8:\"compiler\";s:13:\"MySqlCompiler\";}}','2021-11-06 11:14:53',NULL,'1','172.24.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0'),('96nkh3qa0cgtp4o7r9mga12k1n',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"eae75cb3cef9d2f4f33eb6a3f6967bd0a8e2a4f5\";s:4:\"time\";i:1636112838;}','2021-11-06 11:47:18',NULL,'0','127.0.0.1','curl/7.78.0'),('9g01aq29dlde3q9ii6g2bj3opt',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"5cd79fb8c7aa7813d9a6911e35468768b0e83244\";s:4:\"time\";i:1636111506;}','2021-11-06 11:25:06',NULL,'0','127.0.0.1','curl/7.78.0'),('a0t72mflhq8nuea9qapgkuln64',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"2f8c6225106d3adfc582b118bc956708fbb28419\";s:4:\"time\";i:1636112717;}','2021-11-06 11:45:17',NULL,'0','127.0.0.1','curl/7.78.0'),('a80n7u67f3gjuvbgid0npfo9l0',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"46c2b84eaa3ee25079e0f1325c3403952f97aea6\";s:4:\"time\";i:1636111416;}','2021-11-06 11:23:36',NULL,'0','127.0.0.1','curl/7.78.0'),('aiutajk973rn50q8qgrs26hnhl',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"ef52dda222ca339d2675650d192fd75f05db36e0\";s:4:\"time\";i:1636111264;}','2021-11-06 11:21:04',NULL,'0','127.0.0.1','curl/7.78.0'),('aub1llpgvbg9ntkbophe4lom2j',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"a5ee82f393c3b67f9de6a3ba4e89609a8a4e41b8\";s:4:\"time\";i:1636111869;}','2021-11-06 11:31:09',NULL,'0','127.0.0.1','curl/7.78.0'),('b3hq42tkqu9forun7q58r7aeac',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"63bab9d46f70b213cc3f596215f1bba90a90159d\";s:4:\"time\";i:1636111144;}','2021-11-06 11:19:04',NULL,'0','127.0.0.1','curl/7.78.0'),('c2vsf9omf6nggnru67gpfkbovg',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"cff79464848eb2aec4ff285a238ba6bf47cf0020\";s:4:\"time\";i:1636110992;}','2021-11-06 11:16:32',NULL,'0','127.0.0.1','curl/7.78.0'),('ci269ub0rhcn55170mg946vgmp',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"7a131a5b46b7f883141ea37af8bd3b256be3d163\";s:4:\"time\";i:1636111234;}','2021-11-06 11:20:34',NULL,'0','127.0.0.1','curl/7.78.0'),('dc9nfj8jkonttl5rg9eqif247a',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"a5b5938c4ffb0f4ccac029f209ab964bdf431fa5\";s:4:\"time\";i:1636111022;}','2021-11-06 11:17:02',NULL,'0','127.0.0.1','curl/7.78.0'),('dch3p1t247idpat6bsdgonuotb',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"ba1af8ed4f1bc1713297b4fa1175761cfe2ac2dd\";s:4:\"time\";i:1636112233;}','2021-11-06 11:37:13',NULL,'0','127.0.0.1','curl/7.78.0'),('dprphe6841u4rfgvp15or9vv0g',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"7b64e5b87e4fc29bc43cccfa61013e1101a865d3\";s:4:\"time\";i:1636112384;}','2021-11-06 11:39:44',NULL,'0','127.0.0.1','curl/7.78.0'),('ef1tnm3ljifj9p4m4596j1fasm',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"80faf55e212ee69de08c6b32d47b070c4d67e527\";s:4:\"time\";i:1636112021;}','2021-11-06 11:33:41',NULL,'0','127.0.0.1','curl/7.78.0'),('epjo14m1l2mor63f4k28dtktp1',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"089edc47a02ba1d8a7e479f1208ae8c345e812c2\";s:4:\"time\";i:1636112868;}','2021-11-06 11:47:48',NULL,'0','127.0.0.1','curl/7.78.0'),('fckc4n0i631qga13j803gapr1p',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"fe7b7caa51c31b563a82c12ebeb8c21c62af447c\";s:4:\"time\";i:1636112566;}','2021-11-06 11:42:46',NULL,'0','127.0.0.1','curl/7.78.0'),('fo59n7gjktt9clcubg35n34p02',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"1b850a7e77591b74e57b6deb3d2b10d8c5410eba\";s:4:\"time\";i:1636113111;}','2021-11-06 11:51:51',NULL,'0','127.0.0.1','curl/7.78.0'),('g1dsc2jtvls6aoeq1a7d37lj86',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"f14ba9a6231b4666dd61e60a43a530131e144e30\";s:4:\"time\";i:1636111083;}','2021-11-06 11:18:03',NULL,'0','127.0.0.1','curl/7.78.0'),('g39hrrpo2npnudvkn7c602t6uo',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"5924ce78066e74504156fe82ae71080ea426693f\";s:4:\"time\";i:1636110811;}','2021-11-06 11:13:31',NULL,'0','127.0.0.1','curl/7.78.0'),('g7pb5n9g4t809g927cjd6dtiah',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"8735dbda9173750eb4ca6e99555b2489d15161d8\";s:4:\"time\";i:1636112051;}','2021-11-06 11:34:11',NULL,'0','127.0.0.1','curl/7.78.0'),('gs42iu87l2tfrdku3louqe8mrv',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"de727244c5d7fb5f38858734363be64ee6939e83\";s:4:\"time\";i:1636111839;}','2021-11-06 11:30:39',NULL,'0','127.0.0.1','curl/7.78.0'),('gtdp2jg0006ns6r7k81lsdcutv',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"96eac7f9f2b52fda62da2804a3df31ccac566185\";s:4:\"time\";i:1636113141;}','2021-11-06 11:52:21',NULL,'0','127.0.0.1','curl/7.78.0'),('hfdpdgra8i2tvd3snmq8p1s699',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"f8b63ee8d7f538977573f5a39f88239a80f89ed4\";s:4:\"time\";i:1636112354;}','2021-11-06 11:39:14',NULL,'0','127.0.0.1','curl/7.78.0'),('hmt36d74ot2jfkfcej9u6g2350',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"b2d6cff4a3e04e74005a3623d269526550711a3d\";s:4:\"time\";i:1636111053;}','2021-11-06 11:17:33',NULL,'0','127.0.0.1','curl/7.78.0'),('htgum16jk4qtn5p8sdfmqdq41k',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"a109503a1ac0cb631d3f1a29a8ddad82d96ce3be\";s:4:\"time\";i:1636111930;}','2021-11-06 11:32:10',NULL,'0','127.0.0.1','curl/7.78.0'),('ja349abnqujhl8b3dp9nbdnn4v',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"5507884f05d9aa973b6db99ef47e2b35b00036fb\";s:4:\"time\";i:1636112626;}','2021-11-06 11:43:46',NULL,'0','127.0.0.1','curl/7.78.0'),('jd05e6155ufhskffn6m4oqe34l',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"5d3a9f71b9b845bdf9c370873b45b9866d5123b8\";s:4:\"time\";i:1636111900;}','2021-11-06 11:31:40',NULL,'0','127.0.0.1','curl/7.78.0'),('jeebmd5mrmf803utc1uhr5dopv',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"57ce86cef3219f111e00747ef77b326b77a166bc\";s:4:\"time\";i:1636111386;}','2021-11-06 11:23:06',NULL,'0','127.0.0.1','curl/7.78.0'),('jg5o99bf49fisgskem42thrqtj',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"cf17ddb22be0bca9d263fc7ce364746711113642\";s:4:\"time\";i:1636112989;}','2021-11-06 11:49:50',NULL,'0','127.0.0.1','curl/7.78.0'),('k6fkcdd50b6acb8d80u1jbuqk5',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"a2bb7e490e4e1ef1bed2ef5bf7b849211c724d83\";s:4:\"time\";i:1636111567;}','2021-11-06 11:26:07',NULL,'0','127.0.0.1','curl/7.78.0'),('kbo1j13he0v0907koj4fvqc9kv',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"c7d400ec330dae718fcf0f2db758769de5e8bfca\";s:4:\"time\";i:1636112955;}_staff|a:1:{s:4:\"auth\";a:2:{s:4:\"dest\";s:14:\"/scp/tasks.php\";s:3:\"msg\";s:23:\"Authentication Required\";}}_auth|a:1:{s:5:\"staff\";a:3:{s:2:\"id\";i:1;s:3:\"key\";s:14:\"local:ostadmin\";s:3:\"2fa\";N;}}:token|a:1:{s:5:\"staff\";s:76:\"6abfe018b7b1319df21dee20c934fc13:1636112952:a799bfa76e49bb0e43190454ff941710\";}::Q:A|s:0:\"\";:QA::sort|a:2:{i:0;s:7:\"created\";i:1;i:0;}:Q:tasks|C:8:\"QuerySet\":2559:{a:16:{s:5:\"model\";s:4:\"Task\";s:11:\"constraints\";a:2:{i:0;C:1:\"Q\":106:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{i:0;C:1:\"Q\":57:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{s:13:\"flags__hasbit\";i:1;}}}}}}i:1;C:1:\"Q\":383:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{i:0;C:1:\"Q\":333:{a:3:{i:0;i:0;i:1;i:2;i:2;a:3:{i:0;C:1:\"Q\":76:{a:3:{i:0;i:0;i:1;i:0;i:2;a:2:{s:13:\"flags__hasbit\";i:1;s:8:\"staff_id\";i:1;}}}i:1;C:1:\"Q\":100:{a:3:{i:0;i:0;i:1;i:0;i:2;a:2:{s:16:\"ticket__staff_id\";i:1;s:21:\"ticket__status__state\";s:4:\"open\";}}}i:2;C:1:\"Q\":73:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{s:11:\"dept_id__in\";a:2:{i:0;i:1;i:1;i:3;}}}}}}}}}}}s:16:\"path_constraints\";a:0:{}s:8:\"ordering\";a:1:{i:0;s:8:\"-created\";}s:7:\"related\";b:0;s:6:\"values\";a:13:{s:2:\"id\";s:2:\"id\";s:6:\"number\";s:6:\"number\";s:7:\"created\";s:7:\"created\";s:8:\"staff_id\";s:8:\"staff_id\";s:7:\"team_id\";s:7:\"team_id\";s:16:\"staff__firstname\";s:16:\"staff__firstname\";s:15:\"staff__lastname\";s:15:\"staff__lastname\";s:10:\"team__name\";s:10:\"team__name\";s:10:\"dept__name\";s:10:\"dept__name\";s:12:\"cdata__title\";s:12:\"cdata__title\";s:5:\"flags\";s:5:\"flags\";s:14:\"ticket__number\";s:14:\"ticket__number\";s:17:\"ticket__ticket_id\";s:17:\"ticket__ticket_id\";}s:5:\"defer\";a:0:{}s:10:\"aggregated\";b:0;s:11:\"annotations\";a:3:{s:12:\"collab_count\";O:12:\"SqlAggregate\":5:{s:4:\"func\";s:5:\"COUNT\";s:4:\"expr\";s:21:\"thread__collaborators\";s:8:\"distinct\";b:1;s:10:\"constraint\";b:0;s:5:\"alias\";s:12:\"collab_count\";}s:16:\"attachment_count\";O:12:\"SqlAggregate\":5:{s:4:\"func\";s:5:\"COUNT\";s:4:\"expr\";O:7:\"SqlCase\":5:{s:5:\"cases\";a:1:{i:0;a:2:{i:0;O:8:\"SqlField\":5:{s:5:\"level\";i:0;s:8:\"operator\";N;s:8:\"operands\";N;s:5:\"alias\";N;s:5:\"field\";s:36:\"thread__entries__attachments__inline\";}i:1;N;}}s:4:\"else\";O:8:\"SqlField\":5:{s:5:\"level\";i:0;s:8:\"operator\";N;s:8:\"operands\";N;s:5:\"alias\";N;s:5:\"field\";s:28:\"thread__entries__attachments\";}s:5:\"alias\";N;s:4:\"func\";s:4:\"CASE\";s:4:\"args\";a:0:{}}s:8:\"distinct\";b:1;s:10:\"constraint\";b:0;s:5:\"alias\";s:16:\"attachment_count\";}s:12:\"thread_count\";O:12:\"SqlAggregate\":5:{s:4:\"func\";s:5:\"COUNT\";s:4:\"expr\";O:7:\"SqlCase\":5:{s:5:\"cases\";a:1:{i:0;a:2:{i:0;C:1:\"Q\":74:{a:3:{i:0;i:0;i:1;i:0;i:2;a:1:{s:30:\"thread__entries__flags__hasbit\";i:4;}}}i:1;N;}}s:4:\"else\";O:8:\"SqlField\":5:{s:5:\"level\";i:0;s:8:\"operator\";N;s:8:\"operands\";N;s:5:\"alias\";N;s:5:\"field\";s:19:\"thread__entries__id\";}s:5:\"alias\";N;s:4:\"func\";s:4:\"CASE\";s:4:\"args\";a:0:{}}s:8:\"distinct\";b:1;s:10:\"constraint\";b:0;s:5:\"alias\";s:12:\"thread_count\";}}s:5:\"extra\";a:0:{}s:8:\"distinct\";a:0:{}s:4:\"lock\";b:0;s:5:\"chain\";a:0:{}s:7:\"options\";a:0:{}s:4:\"iter\";i:2;s:8:\"compiler\";s:13:\"MySqlCompiler\";}}cfg:core|a:1:{s:11:\"db_timezone\";s:3:\"UTC\";}lastcroncall|i:1636112952;::Q:T|i:1;sort|a:1:{i:1;a:2:{s:9:\"queuesort\";O:9:\"QueueSort\":7:{s:8:\"_columns\";a:2:{s:15:\"cdata__priority\";b:1;s:10:\"lastupdate\";b:1;}s:6:\"_extra\";N;s:2:\"ht\";a:5:{s:2:\"id\";i:1;s:4:\"root\";N;s:4:\"name\";s:32:\"Priority + Most Recently Updated\";s:7:\"columns\";s:34:\"[\"-cdata__priority\",\"-lastupdate\"]\";s:7:\"updated\";s:19:\"2021-11-05 11:13:14\";}s:5:\"dirty\";a:0:{}s:7:\"__new__\";b:0;s:11:\"__deleted__\";b:0;s:12:\"__deferred__\";a:0:{}}s:3:\"dir\";i:0;}}','2021-11-06 11:49:15',NULL,'1','172.24.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:94.0) Gecko/20100101 Firefox/94.0'),('kil47dp1r3k71cdg8bi0jfvrtb',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"49e83992940b7904f7d4bee9132df4ce46d7a664\";s:4:\"time\";i:1636111627;}','2021-11-06 11:27:07',NULL,'0','127.0.0.1','curl/7.78.0'),('konbq04oh6p5cb5kl9dgdlit3r',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"88a20b97e2d54f6c187c131eeeda3010551939d3\";s:4:\"time\";i:1636112081;}','2021-11-06 11:34:41',NULL,'0','127.0.0.1','curl/7.78.0'),('l92akl9vgki1t2h4pag61fvk56',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"c2222d9130fe3a4b878cd8fd91d5cdb74e510d84\";s:4:\"time\";i:1636112747;}','2021-11-06 11:45:47',NULL,'0','127.0.0.1','curl/7.78.0'),('lhtnpgiqhvhm4865n55b3aitvb',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"aa1ee078f8aab43fab8d4322442fbe3d1b2bebda\";s:4:\"time\";i:1636112172;}','2021-11-06 11:36:12',NULL,'0','127.0.0.1','curl/7.78.0'),('lu4pke20jvtlh8s416tourb5ku',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"b2b5734e1db59f2754c365ea60b22bb633df1fc2\";s:4:\"time\";i:1636112808;}','2021-11-06 11:46:48',NULL,'0','127.0.0.1','curl/7.78.0'),('lu9maj4pf92eibq654suhofpke',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"8c01352ce0a277ca93512686a3728e2d62bceca6\";s:4:\"time\";i:1636111113;}','2021-11-06 11:18:33',NULL,'0','127.0.0.1','curl/7.78.0'),('lv3k0t9p29s885eeb3gc9qupt0',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"8f6ea845cac6c472e9d956dcf0410c862b96fa6b\";s:4:\"time\";i:1636110871;}','2021-11-06 11:14:31',NULL,'0','127.0.0.1','curl/7.78.0'),('m3d8bljro96pq3usvtjq70pu71',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"903deda2cdc1716b26ba2e5a6d92bf1bf279894a\";s:4:\"time\";i:1636112778;}','2021-11-06 11:46:18',NULL,'0','127.0.0.1','curl/7.78.0'),('ma076f2nnjn049vlu05jhu70tu',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"0d679836a798fa06f781284307e8594e6410d412\";s:4:\"time\";i:1636111204;}','2021-11-06 11:20:04',NULL,'0','127.0.0.1','curl/7.78.0'),('mju4nap24kir5vvv600v7jtjj3',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"aef0e1980b5798eff784cf0b2db8cf7e0d77f4eb\";s:4:\"time\";i:1636111748;}','2021-11-06 11:29:08',NULL,'0','127.0.0.1','curl/7.78.0'),('mkkcsv9e8kt3u8ch4bbjqjrgvt',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"a4f65a7e30d89350e7bd38e2b0b56b6d97556147\";s:4:\"time\";i:1636113081;}','2021-11-06 11:51:21',NULL,'0','127.0.0.1','curl/7.78.0'),('neti9891oi4m1lgf24gj07tp04',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"c1dfedb229d1730d708fb4bb1471684225c20815\";s:4:\"time\";i:1636112475;}','2021-11-06 11:41:15',NULL,'0','127.0.0.1','curl/7.78.0'),('o5bp0e919ponrfut7hbssepf4a',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"7f1b5049a3af74f66abef5627a238ebb268fb580\";s:4:\"time\";i:1636111476;}','2021-11-06 11:24:36',NULL,'0','127.0.0.1','curl/7.78.0'),('o7u3ukgooi1ormri4n74a0nqt6',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"469f2b2be43628ab340308d8a02c659a33f1de9c\";s:4:\"time\";i:1636112505;}','2021-11-06 11:41:45',NULL,'0','127.0.0.1','curl/7.78.0'),('oe8ckmr5lp1n15lp92l2gb5hvq',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"67625524123b88878e596dbd3121f62d4684ffff\";s:4:\"time\";i:1636112929;}','2021-11-06 11:48:49',NULL,'0','127.0.0.1','curl/7.78.0'),('oq9sh2r5c00ma2fe4ehst2c6m8',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"fddbf2bcb1806b32c571d1c2c47aa62819eb9f18\";s:4:\"time\";i:1636111325;}','2021-11-06 11:22:05',NULL,'0','127.0.0.1','curl/7.78.0'),('p9run9jkdum9tol1cffthh7pqi',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"652a31dea4e50d13685314b4bbf62aa110d3213c\";s:4:\"time\";i:1636112687;}','2021-11-06 11:44:47',NULL,'0','127.0.0.1','curl/7.78.0'),('pahci6540io0nt9l5qvofraual',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"1258e7df87947cdc60f62fd9167c8a5a457a652a\";s:4:\"time\";i:1636111991;}','2021-11-06 11:33:11',NULL,'0','127.0.0.1','curl/7.78.0'),('pdn3rh4efcnuei3197r5nqcdeh',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"e2145861f3d5b040a8aa15138c3851cb264c0d2d\";s:4:\"time\";i:1636112263;}','2021-11-06 11:37:43',NULL,'0','127.0.0.1','curl/7.78.0'),('pjqnfpvhs8f183mj154lck808u',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"72570a153c399b105b59a0532573218bc0dc6ebb\";s:4:\"time\";i:1636112657;}','2021-11-06 11:44:17',NULL,'0','127.0.0.1','curl/7.78.0'),('prpao1vba0ur8o38tfmo1uf280',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"ad7e702d45fff4fdbfa622a6a5c323c0665fd842\";s:4:\"time\";i:1636112112;}','2021-11-06 11:35:12',NULL,'0','127.0.0.1','curl/7.78.0'),('qig5go38nocermgtjq4k7e6p3k',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"e3a80ad54ba40b2545174da5fbd90dac2b96d45f\";s:4:\"time\";i:1636110901;}','2021-11-06 11:15:01',NULL,'0','127.0.0.1','curl/7.78.0'),('ronknupmfuqoetbjdi4rs5uee9',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"17428e4c2d78e5d977e9362aa39699bd601bf76a\";s:4:\"time\";i:1636112324;}','2021-11-06 11:38:44',NULL,'0','127.0.0.1','curl/7.78.0'),('sjh5ndsvr1a8449v9eg56bjkkt',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"0bb054d2d6ed2323000ac2fd88693dec9e200fe4\";s:4:\"time\";i:1636111718;}','2021-11-06 11:28:38',NULL,'0','127.0.0.1','curl/7.78.0'),('tc3p1vhlses9ic1iqmp3skquem',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"ba387edbfaf33da43c0a195009da44126e527378\";s:4:\"time\";i:1636111174;}','2021-11-06 11:19:34',NULL,'0','127.0.0.1','curl/7.78.0'),('tp26j89snhohnh95a57b6a9rqj',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"1a49a64bd0a90c23d166b62ce8a58043af259315\";s:4:\"time\";i:1636111446;}','2021-11-06 11:24:06',NULL,'0','127.0.0.1','curl/7.78.0'),('u7q2qcgnblhiqhpm3v4gb3tmqm',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"b116f31ee85ca779088ac5f97a4d2e2c07bbfba8\";s:4:\"time\";i:1636112293;}','2021-11-06 11:38:13',NULL,'0','127.0.0.1','curl/7.78.0'),('ubui6svjbath637e3bg81ngpqj',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"9dcd3c02886c3956c47f214ab0cc9b0629f8051c\";s:4:\"time\";i:1636112142;}','2021-11-06 11:35:42',NULL,'0','127.0.0.1','curl/7.78.0'),('ueie1qrlssf4g4rphm3baf1e6u',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"2e25dce46a13b3b29fa1abf2aae5e9cb8b9ea3b5\";s:4:\"time\";i:1636112445;}','2021-11-06 11:40:45',NULL,'0','127.0.0.1','curl/7.78.0'),('vcjjam2faa6shrmetr9dhvjv7k',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"1ce10fe07018939e5adaa53685c2af63b1fdfe66\";s:4:\"time\";i:1636111809;}','2021-11-06 11:30:09',NULL,'0','127.0.0.1','curl/7.78.0'),('vrubteapjj1r8nctd59imr6j8u',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"12423b65c2bc90de2a130153a04520d17894093e\";s:4:\"time\";i:1636111657;}','2021-11-06 11:27:38',NULL,'0','127.0.0.1','curl/7.78.0'),('vu2c1jbuufcc4n7kjv1ctai6s8',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"8f99315764d8d8ddeaa3effc2c4b8f80a6f161f0\";s:4:\"time\";i:1636111688;}','2021-11-06 11:28:08',NULL,'0','127.0.0.1','curl/7.78.0'),('vvddn0df0vb21h37qmg1mfbov9',_binary 'csrf|a:2:{s:5:\"token\";s:40:\"49f727d94d7cc6fa376581c40a548cb6a27bcd95\";s:4:\"time\";i:1636112959;}','2021-11-06 11:49:19',NULL,'0','127.0.0.1','curl/7.78.0');
/*!40000 ALTER TABLE `ost_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_sla`
--

DROP TABLE IF EXISTS `ost_sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_sla` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '3',
  `grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_sla`
--

LOCK TABLES `ost_sla` WRITE;
/*!40000 ALTER TABLE `ost_sla` DISABLE KEYS */;
INSERT INTO `ost_sla` VALUES (1,0,3,18,'Default SLA',NULL,'2021-11-05 11:13:10','2021-11-05 11:13:10');
/*!40000 ALTER TABLE `ost_sla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_staff`
--

DROP TABLE IF EXISTS `ost_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text,
  `permissions` text,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `isactive` (`isactive`),
  KEY `onvacation` (`onvacation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_staff`
--

LOCK TABLES `ost_staff` WRITE;
/*!40000 ALTER TABLE `ost_staff` DISABLE KEYS */;
INSERT INTO `ost_staff` VALUES (1,1,1,'ostadmin','Admin','User','$2a$08$kgSydLESfBON72BSoe8Q2.Ph8jVQbv455FzIR84UrHUr0zsqbY47q',NULL,'admin@example.com','',NULL,'','',NULL,NULL,NULL,NULL,1,1,1,0,0,0,0,25,0,'none','Letter','{\"browser_lang\":\"en_US\"}','{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}','2021-11-05 11:13:21','2021-11-05 11:49:12','2021-11-05 11:13:21','2021-11-05 11:49:12');
/*!40000 ALTER TABLE `ost_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_staff_dept_access`
--

DROP TABLE IF EXISTS `ost_staff_dept_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_staff_dept_access` (
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`staff_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_staff_dept_access`
--

LOCK TABLES `ost_staff_dept_access` WRITE;
/*!40000 ALTER TABLE `ost_staff_dept_access` DISABLE KEYS */;
INSERT INTO `ost_staff_dept_access` VALUES (1,3,1,1);
/*!40000 ALTER TABLE `ost_staff_dept_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_syslog`
--

DROP TABLE IF EXISTS `ost_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_syslog` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_syslog`
--

LOCK TABLES `ost_syslog` WRITE;
/*!40000 ALTER TABLE `ost_syslog` DISABLE KEYS */;
INSERT INTO `ost_syslog` VALUES (1,'Debug','osTicket installed!','Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!','','','2021-11-05 11:13:22','2021-11-05 11:13:22');
/*!40000 ALTER TABLE `ost_syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_task`
--

DROP TABLE IF EXISTS `ost_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lock_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`team_id`),
  KEY `created` (`created`),
  KEY `object` (`object_id`,`object_type`),
  KEY `flags` (`flags`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_task`
--

LOCK TABLES `ost_task` WRITE;
/*!40000 ALTER TABLE `ost_task` DISABLE KEYS */;
INSERT INTO `ost_task` VALUES (1,0,'','1',3,1,0,0,1,NULL,NULL,'2021-11-05 11:14:49','2021-11-05 11:14:49');
/*!40000 ALTER TABLE `ost_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_task__cdata`
--

DROP TABLE IF EXISTS `ost_task__cdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_task__cdata` (
  `task_id` int(11) unsigned NOT NULL,
  `title` mediumtext,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_task__cdata`
--

LOCK TABLES `ost_task__cdata` WRITE;
/*!40000 ALTER TABLE `ost_task__cdata` DISABLE KEYS */;
INSERT INTO `ost_task__cdata` VALUES (1,'Check db initiailized');
/*!40000 ALTER TABLE `ost_task__cdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_team`
--

DROP TABLE IF EXISTS `ost_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_team` (
  `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `name` (`name`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_team`
--

LOCK TABLES `ost_team` WRITE;
/*!40000 ALTER TABLE `ost_team` DISABLE KEYS */;
INSERT INTO `ost_team` VALUES (1,0,1,'Level I Support','Tier 1 support, responsible for the initial iteraction with customers','2021-11-05 11:13:13','2021-11-05 11:13:13');
/*!40000 ALTER TABLE `ost_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_team_member`
--

DROP TABLE IF EXISTS `ost_team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_team_member` (
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`team_id`,`staff_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_team_member`
--

LOCK TABLES `ost_team_member` WRITE;
/*!40000 ALTER TABLE `ost_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_thread`
--

DROP TABLE IF EXISTS `ost_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_thread` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `object_type` (`object_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_thread`
--

LOCK TABLES `ost_thread` WRITE;
/*!40000 ALTER TABLE `ost_thread` DISABLE KEYS */;
INSERT INTO `ost_thread` VALUES (2,1,'A',NULL,NULL,NULL,'2021-11-05 11:14:49');
/*!40000 ALTER TABLE `ost_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_thread_collaborator`
--

DROP TABLE IF EXISTS `ost_thread_collaborator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_thread_collaborator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `flags` int(10) unsigned NOT NULL DEFAULT '1',
  `thread_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collab` (`thread_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_thread_collaborator`
--

LOCK TABLES `ost_thread_collaborator` WRITE;
/*!40000 ALTER TABLE `ost_thread_collaborator` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_thread_collaborator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_thread_entry`
--

DROP TABLE IF EXISTS `ost_thread_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_thread_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int(10) unsigned DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text,
  `recipients` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `thread_id` (`thread_id`),
  KEY `staff_id` (`staff_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_thread_entry`
--

LOCK TABLES `ost_thread_entry` WRITE;
/*!40000 ALTER TABLE `ost_thread_entry` DISABLE KEYS */;
INSERT INTO `ost_thread_entry` VALUES (2,0,2,1,0,'M',65,'Admin User',NULL,NULL,'',NULL,'<p>Verify that inti.sql has been run successfully.</p>','html','172.24.0.1',NULL,NULL,'2021-11-05 11:14:49','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_thread_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_thread_entry_email`
--

DROP TABLE IF EXISTS `ost_thread_entry_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_thread_entry_email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thread_entry_id` int(11) unsigned NOT NULL,
  `email_id` int(11) unsigned DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text,
  PRIMARY KEY (`id`),
  KEY `thread_entry_id` (`thread_entry_id`),
  KEY `mid` (`mid`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_thread_entry_email`
--

LOCK TABLES `ost_thread_entry_email` WRITE;
/*!40000 ALTER TABLE `ost_thread_entry_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_thread_entry_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_thread_entry_merge`
--

DROP TABLE IF EXISTS `ost_thread_entry_merge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_thread_entry_merge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thread_entry_id` int(11) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `thread_entry_id` (`thread_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_thread_entry_merge`
--

LOCK TABLES `ost_thread_entry_merge` WRITE;
/*!40000 ALTER TABLE `ost_thread_entry_merge` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_thread_entry_merge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_thread_event`
--

DROP TABLE IF EXISTS `ost_thread_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_thread_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int(11) unsigned DEFAULT NULL,
  `staff_id` int(11) unsigned NOT NULL,
  `team_id` int(11) unsigned NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int(11) unsigned DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  KEY `ticket_stats` (`timestamp`,`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_thread_event`
--

LOCK TABLES `ost_thread_event` WRITE;
/*!40000 ALTER TABLE `ost_thread_event` DISABLE KEYS */;
INSERT INTO `ost_thread_event` VALUES (1,0,'T',1,0,0,1,1,NULL,'SYSTEM',1,'U',0,'2021-11-05 11:13:21'),(2,1,'T',14,1,0,1,1,NULL,'ostadmin',1,'S',0,'2021-11-05 11:14:07'),(3,2,'A',1,0,0,3,0,NULL,'ostadmin',1,'S',0,'2021-11-05 11:14:49'),(4,2,'A',4,1,0,3,0,'{\"claim\":true}','ostadmin',1,'S',0,'2021-11-05 11:14:49');
/*!40000 ALTER TABLE `ost_thread_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_thread_referral`
--

DROP TABLE IF EXISTS `ost_thread_referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_thread_referral` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_thread_referral`
--

LOCK TABLES `ost_thread_referral` WRITE;
/*!40000 ALTER TABLE `ost_thread_referral` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_thread_referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket`
--

DROP TABLE IF EXISTS `ost_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_pid` int(11) unsigned DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `lock_id` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`team_id`),
  KEY `status_id` (`status_id`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`),
  KEY `sla_id` (`sla_id`),
  KEY `ticket_pid` (`ticket_pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket`
--

LOCK TABLES `ost_ticket` WRITE;
/*!40000 ALTER TABLE `ost_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket__cdata`
--

DROP TABLE IF EXISTS `ost_ticket__cdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket__cdata` (
  `ticket_id` int(11) unsigned NOT NULL,
  `subject` mediumtext,
  `priority` mediumtext,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket__cdata`
--

LOCK TABLES `ost_ticket__cdata` WRITE;
/*!40000 ALTER TABLE `ost_ticket__cdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket__cdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_priority`
--

DROP TABLE IF EXISTS `ost_ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_priority`
--

LOCK TABLES `ost_ticket_priority` WRITE;
/*!40000 ALTER TABLE `ost_ticket_priority` DISABLE KEYS */;
INSERT INTO `ost_ticket_priority` VALUES (1,'low','Low','#DDFFDD',4,1),(2,'normal','Normal','#FFFFF0',3,1),(3,'high','High','#FEE7E7',2,1),(4,'emergency','Emergency','#FEE7E7',1,1);
/*!40000 ALTER TABLE `ost_ticket_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_status`
--

DROP TABLE IF EXISTS `ost_ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_status`
--

LOCK TABLES `ost_ticket_status` WRITE;
/*!40000 ALTER TABLE `ost_ticket_status` DISABLE KEYS */;
INSERT INTO `ost_ticket_status` VALUES (1,'Open','open',3,0,1,'{\"description\":\"Open tickets.\"}','2021-11-05 11:13:13','0000-00-00 00:00:00'),(2,'Resolved','closed',1,0,2,'{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}','2021-11-05 11:13:13','0000-00-00 00:00:00'),(3,'Closed','closed',3,0,3,'{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}','2021-11-05 11:13:13','0000-00-00 00:00:00'),(4,'Archived','archived',3,0,4,'{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}','2021-11-05 11:13:13','0000-00-00 00:00:00'),(5,'Deleted','deleted',3,0,5,'{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}','2021-11-05 11:13:13','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_translation`
--

DROP TABLE IF EXISTS `ost_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_translation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_hash` char(16) CHARACTER SET ascii DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `revision` int(11) unsigned DEFAULT NULL,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`lang`),
  KEY `object_hash` (`object_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_translation`
--

LOCK TABLES `ost_translation` WRITE;
/*!40000 ALTER TABLE `ost_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_user`
--

DROP TABLE IF EXISTS `ost_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_id` int(10) unsigned NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `default_email_id` (`default_email_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_user`
--

LOCK TABLES `ost_user` WRITE;
/*!40000 ALTER TABLE `ost_user` DISABLE KEYS */;
INSERT INTO `ost_user` VALUES (1,1,1,0,'osTicket Support','2021-11-05 11:13:21','2021-11-05 11:13:21');
/*!40000 ALTER TABLE `ost_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_user__cdata`
--

DROP TABLE IF EXISTS `ost_user__cdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_user__cdata` (
  `user_id` int(11) unsigned NOT NULL,
  `email` mediumtext,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_user__cdata`
--

LOCK TABLES `ost_user__cdata` WRITE;
/*!40000 ALTER TABLE `ost_user__cdata` DISABLE KEYS */;
INSERT INTO `ost_user__cdata` VALUES (1,NULL);
/*!40000 ALTER TABLE `ost_user__cdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_user_account`
--

DROP TABLE IF EXISTS `ost_user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_user_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_user_account`
--

LOCK TABLES `ost_user_account` WRITE;
/*!40000 ALTER TABLE `ost_user_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_user_email`
--

DROP TABLE IF EXISTS `ost_user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_user_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `user_email_lookup` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_user_email`
--

LOCK TABLES `ost_user_email` WRITE;
/*!40000 ALTER TABLE `ost_user_email` DISABLE KEYS */;
INSERT INTO `ost_user_email` VALUES (1,1,0,'support@osticket.com');
/*!40000 ALTER TABLE `ost_user_email` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-05 12:52:51
