/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 8.0.18 : Database - seata_order
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`seata_order` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `seata_order`;

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户id',
  `product_id` bigint(11) DEFAULT NULL COMMENT '产品id',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `money` decimal(11,0) DEFAULT NULL COMMENT '金额',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0：创建中; 1：已完结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`user_id`,`product_id`,`count`,`money`,`status`) values 
(9,11,22,1,100,0),
(12,11,22,1,100,0),
(14,11,22,1,100,0),
(15,11,22,1,100,0);

/*Table structure for table `undo_log` */

DROP TABLE IF EXISTS `undo_log`;

CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `undo_log` */

insert  into `undo_log`(`id`,`branch_id`,`xid`,`context`,`rollback_info`,`log_status`,`log_created`,`log_modified`,`ext`) values 
(10,46617241568944129,'192.168.178.2:8091:46617240876883968','serializer=jackson','{\"@class\":\"io.seata.rm.datasource.undo.BranchUndoLog\",\"xid\":\"192.168.178.2:8091:46617240876883968\",\"branchId\":46617241568944129,\"sqlUndoLogs\":[\"java.util.ArrayList\",[{\"@class\":\"io.seata.rm.datasource.undo.SQLUndoLog\",\"sqlType\":\"INSERT\",\"tableName\":\"t_order\",\"beforeImage\":{\"@class\":\"io.seata.rm.datasource.sql.struct.TableRecords$EmptyTableRecords\",\"tableName\":\"t_order\",\"rows\":[\"java.util.ArrayList\",[]]},\"afterImage\":{\"@class\":\"io.seata.rm.datasource.sql.struct.TableRecords\",\"tableName\":\"t_order\",\"rows\":[\"java.util.ArrayList\",[{\"@class\":\"io.seata.rm.datasource.sql.struct.Row\",\"fields\":[\"java.util.ArrayList\",[{\"@class\":\"io.seata.rm.datasource.sql.struct.Field\",\"name\":\"id\",\"keyType\":\"PRIMARY_KEY\",\"type\":-5,\"value\":[\"java.lang.Long\",15]},{\"@class\":\"io.seata.rm.datasource.sql.struct.Field\",\"name\":\"user_id\",\"keyType\":\"NULL\",\"type\":-5,\"value\":[\"java.lang.Long\",11]},{\"@class\":\"io.seata.rm.datasource.sql.struct.Field\",\"name\":\"product_id\",\"keyType\":\"NULL\",\"type\":-5,\"value\":[\"java.lang.Long\",22]},{\"@class\":\"io.seata.rm.datasource.sql.struct.Field\",\"name\":\"count\",\"keyType\":\"NULL\",\"type\":4,\"value\":1},{\"@class\":\"io.seata.rm.datasource.sql.struct.Field\",\"name\":\"money\",\"keyType\":\"NULL\",\"type\":3,\"value\":[\"java.math.BigDecimal\",100]},{\"@class\":\"io.seata.rm.datasource.sql.struct.Field\",\"name\":\"status\",\"keyType\":\"NULL\",\"type\":4,\"value\":0}]]}]]}}]]}',0,'2020-09-08 15:20:17','2020-09-08 15:20:17',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
