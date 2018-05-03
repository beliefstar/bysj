-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: bysj
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `adjustment`
--

DROP TABLE IF EXISTS `adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustment` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(11) DEFAULT NULL COMMENT '员工ID',
  `origin` bigint(20) DEFAULT NULL COMMENT '原部门',
  `arrive` bigint(20) DEFAULT NULL COMMENT '转到部门',
  `comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustment`
--

LOCK TABLES `adjustment` WRITE;
/*!40000 ALTER TABLE `adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjustment_apply`
--

DROP TABLE IF EXISTS `adjustment_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustment_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `text` varchar(500) DEFAULT NULL COMMENT '申请原因',
  `origin` bigint(20) DEFAULT NULL COMMENT '源部门ID',
  `arrive` bigint(20) DEFAULT NULL COMMENT '到达部门ID',
  `status` char(2) DEFAULT NULL COMMENT '申请状态',
  `origin_deal_time` datetime DEFAULT NULL COMMENT '原部门主管处理时间',
  `origin_approve` bigint(20) DEFAULT NULL COMMENT '原部门审批人',
  `origin_comment` varchar(200) DEFAULT NULL COMMENT '原部门备注',
  `arrive_deal_time` datetime DEFAULT NULL COMMENT '到达部门审批时间',
  `arrive_approve` bigint(20) DEFAULT NULL COMMENT '到达部门审批人',
  `arrive_comment` varchar(200) DEFAULT NULL COMMENT '到达部门备注',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位调整申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustment_apply`
--

LOCK TABLES `adjustment_apply` WRITE;
/*!40000 ALTER TABLE `adjustment_apply` DISABLE KEYS */;
INSERT INTO `adjustment_apply` VALUES (4,3,'2018-04-28 22:17:52','这个人嘴皮子好，去干销售',12,11,'0',NULL,NULL,'你拿走吧，我不要他了',NULL,NULL,NULL,'2018-04-28 22:17:52','王宏','2018-04-28 22:17:52','王宏');
/*!40000 ALTER TABLE `adjustment_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(11) DEFAULT NULL COMMENT '员工ID',
  `start_time` datetime DEFAULT NULL COMMENT '上班时间',
  `end_time` datetime DEFAULT NULL COMMENT '下班时间',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(30) DEFAULT NULL COMMENT '部门名称',
  `master` bigint(20) DEFAULT NULL COMMENT '部门经理ID',
  `introduce` varchar(1000) DEFAULT NULL COMMENT '部门简介',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (9,'市场部',9,'市场部是一个企业中营销组织架构的重要组成部分，通常包含产品市场部、市场开发部、市场宣传部和销售支持部，在企业中具有巨大的作用。','2018-04-04 23:45:30','1001','2018-04-04 23:45:34','1001'),(11,'客服部',11,'主要体现了一种以客户为导向的价值观，它整合及管理在预先设定的最优成本——服务组合中的客户界面的所有要素。广义而言，任何能提高客户满意度的内容都属于客户服务的范围。','2018-04-04 23:47:38','1001','2018-04-04 23:47:42','1001'),(12,'生产部',12,'负责对各种设备事故、工伤、伤亡事故、急性中毒事故以及环境污染事故的调查处理，并制订改进措施计划','2018-04-04 23:49:01','1001','2018-04-04 23:49:06','1001'),(13,'采购部',13,'公司中生产中负责生产物资采购的部门。','2018-04-04 23:49:48','1001','2018-04-04 23:49:53','1001'),(16,'车间生产',16,'五金制品，出现在经济生活、政治生活以及军事活动的各个角落。五金类产品种类繁多，规格各异，但是五金类产品在现代生活中又起着不可替代的作用，选择好的五金配件可以使很多结构件使用起来更安全、便捷。','2018-04-04 23:53:08','1001','2018-04-04 23:53:12','1001'),(19,'物流中心',19,'物流中心是物流系统中的基础设施。它的规划、筹建、运行与完善，涉及交通、物资、商业、外贸、工业、建筑、农业、金融等多个部门、多个行业的企业。不同部门及企业对其内涵及外延的理解不尽一致。','2018-04-04 23:57:55','1001','2018-04-04 23:57:59','1001'),(20,'仓库',20,'存储成品与物料','2018-04-04 23:58:38','1001','2018-04-04 23:58:53','1001'),(23,'人事部',23,'人事部是一个企业或者团体的人力资源和企业公共事务的管理部门 。现在为强化人的重要性，分离出人力资源部门。一般意义上人力资源部门应该是人事部的发展，但不能说人事部本身具有缺陷，只是一般意义上的解说歪曲了人事部的意义。人力资源的意义发展是其本身职能的发展而非部门名称的原因，因此人事部并没有过时之说。其本身职能的变化和发展应该具有时代意义。','2018-04-05 00:01:36','1001','2018-04-05 00:01:40','1001'),(24,'后勤部',24,'后勤部就是以后勤保障为主要工作的部门。该部门直接作用于团体内部其它部门，对其它部门的正常运作具有至关重要的作用，对实现团体目标任务起间接作用；简言之，后勤部是为其它各部门职能能够顺利实现提供物质服务的一个部门。在中国人民解放军队伍里，后勤部是师以上单位后勤机关部门，是主管部队后勤工作的机构。当前军队后勤保障主要有“指挥、保障合一型”与“指挥、保障分离”型两种。前者指的是后勤领导机关与后勤部队合而为一，后者则是后勤领导机关与后勤部队相互分离。','2018-04-05 00:02:23','1001','2018-04-05 00:02:27','1001'),(25,'培训部',25,'根据公司业务发展节奏完成启动培训和项目培训以及新员工岗前培训，根据公司领导要求制定培训计划，编制培训资料，包括课件以及文档资料','2018-04-05 00:03:51','1001','2018-04-05 00:03:55','1001'),(26,'财务部',26,'财务部门是利用会计部门收集的信息进行再加工、分析和决策支持,它主要是为企业内部经营者服务的部门。财务部门负责人务必将财务部门塑造成企业的核心部门，无论是集团公司财务部，还是生产型企业财务部。因为财务部门是企业资金控制的最后环节，一旦现金流出，发生的损失要挽回就相当的困难了。','2018-04-05 00:04:46','1001','2018-04-05 00:04:51','1001'),(28,'董事会',29,'董事会，是由董事组成的、对内掌管公司事务、对外代表公司的经营决策和业务执行机构，公司设董事会，由股东（大）会选举。董事会设董事长一人，副董事长，董事长、副董事长的产生办法由公司章程规定，一般由董事会选举产生。董事任期三年，任期届满，可连选连任，董事在任期届满前，股东会不得无故解除其职务。','2018-04-05 00:06:49','1001','2018-04-05 00:06:53','1001');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '工号',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `join_time` datetime DEFAULT NULL COMMENT '入职时间',
  `nation` varchar(10) DEFAULT NULL COMMENT '民族',
  `politics` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `address` varchar(50) DEFAULT NULL COMMENT '家庭住址',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话1',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业院校',
  `education` varchar(20) DEFAULT NULL COMMENT '学历',
  `last_login` datetime DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL COMMENT '头像',
  `department_id` bigint(20) DEFAULT NULL COMMENT '部门',
  `post` varchar(255) DEFAULT NULL COMMENT '职位',
  `ready` char(1) DEFAULT NULL COMMENT '是否正式员工',
  `del_flg` char(1) DEFAULT '0' COMMENT '删除标志',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1,'王辉',28,'50a4ba9facde4f69bf6c573fd77dd788','男','2018-04-27 16:13:09','汉','党员','重庆市渝北区大竹林街道斑竹路12号','1990-08-17','13345671234','wanghui@depth.com','西南大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 10:02:34','1001','2018-04-27 16:13:09','王宏'),(2,'李勤',27,'98e41bf5b03b5855c06b7899e8a30dfb','男','2018-04-27 16:13:12','汉','党员','重庆市渝中区瑞泰路10号','1991-07-10','18112345678','liqin@depth.com','西南大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:05:49','1001','2018-04-27 16:13:12','王宏'),(3,'赵力',27,'e79ee87f6b5524c5be7a17ed4268ef4b','男','2018-04-27 16:13:06','汉','团员','重庆市沙坪坝区小龙坎街道156号','1991-06-05','15578945623','zhaoli@depth.com','重庆大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:08:11','1001','2018-04-27 16:13:06','王宏'),(4,'陈宇涵',28,NULL,'男','2018-04-06 11:08:55','汉','团员','重庆市沙坪坝区小龙坎街道189号','1990-04-07','18822224545','chenyuhan@depth.com','重庆交通大学','本科',NULL,NULL,12,'普通职员','0','0','2018-04-07 11:10:23','1001','2018-04-07 11:10:32','1001'),(5,'程晨',27,NULL,'女','2018-04-07 11:11:11','汉','团员','重庆市南岸区镇西街道45号','1991-03-14','15688887474','chengchen@depth.com','重庆文理学院','本科',NULL,NULL,12,'普通职员','0','0','2018-04-07 11:12:32','1001','2018-04-07 11:12:38','1001'),(6,'王华',28,'1961799428c5c46f2b3d75df06cdd92e','男','2018-04-27 16:13:18','汉','团员','重庆市江北区盘溪街道78号','1991-07-10','16678784545','wanghua@depth.com','华南大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:18:06','1001','2018-04-27 16:13:18','王宏'),(7,'张珊',28,NULL,'女','2018-04-05 11:03:23','汉','团员','重庆市江北区盘溪街道178号','1991-07-10','16678784545','wanghua@depth.com','华南大学','本科',NULL,NULL,12,'普通职员','0','0','2018-04-07 11:20:13','1001','2018-04-07 11:20:13','1001'),(8,'张静',28,'1961799428c5c46f2b3d75df06cdd92e','女','2018-04-27 16:13:21','汉','团员','重庆市江南区高昂街道17号','1991-07-10','16678784545','zhangjing@depth.com','华南大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:23:00','1001','2018-04-27 16:13:21','王宏'),(9,'张云',28,'1961799428c5c46f2b3d75df06cdd92e','男','2018-04-05 11:03:23','汉','团员','重庆市江南区高昂街道147号','1991-07-10','16678784545','zhangyun@depth.com','华南大学','本科',NULL,NULL,9,'经理','1','0','2018-04-07 11:23:32','1001','2018-04-07 11:23:32','1001'),(10,'张宇',28,'1961799428c5c46f2b3d75df06cdd92e','男','2018-04-26 21:18:27','汉','团员','重庆市江南区高昂街道14号','1991-07-10','16678784545','zhangyu@depth.com','华东大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:24:10','1001','2018-04-26 21:18:27','王宏'),(11,'王立',28,'1961799428c5c46f2b3d75df06cdd92e','男','2018-04-05 11:03:23','汉','团员','重庆市江南区高昂街道104号','1991-07-10','16678784545','wangli@depth.com','华东大学','本科',NULL,NULL,11,'经理','1','0','2018-04-07 11:24:39','1001','2018-04-07 11:24:39','1001'),(12,'王宏',28,'1961799428c5c46f2b3d75df06cdd92e','男','2018-04-05 11:03:23','汉','汉','重庆市渝北区高斯街道4号','1991-07-10','16678784545','wanghong@depth.com','华东大学','本科',NULL,NULL,12,'经理','1','0','2018-04-07 11:25:25','1001','2018-04-27 16:06:46','王宏'),(13,'李林',28,'','女','2018-04-05 11:03:23','汉','党员','重庆市渝北区高斯街道40号','1991-07-10','16678784545','lilin@depth.com','西南大学','本科',NULL,NULL,13,'经理','1','0','2018-04-07 11:26:02','1001','2018-04-07 11:26:02','1001'),(14,'胡丽',28,'1961799428c5c46f2b3d75df06cdd92e','女','2018-04-27 16:13:25','汉','党员','重庆市渝南区高斯街道40号','1991-07-10','16678784545','huli@depth.com','西南大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:26:42','1001','2018-04-27 16:13:25','王宏'),(15,'胡户',28,'dbcfabaa2ef238bb3bea1b0cb0628ef8','女','2018-04-27 16:13:27','汉','党员','重庆市渝南区高斯街道40号','1991-07-10','15978004545','huhu@depth.com','成都大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:33:41','1001','2018-04-27 16:13:27','王宏'),(16,'胡旺',28,'','女','2018-03-05 11:03:23','汉','党员','重庆市江北区阿斯街道4号','1991-07-10','15978004545','huwang@depth.com','成都大学','本科',NULL,NULL,16,'经理','1','0','2018-04-07 11:33:41','1001','2018-04-07 11:33:41','1001'),(17,'柳云龙',28,'dbcfabaa2ef238bb3bea1b0cb0628ef8','男','2018-04-27 16:12:50','汉','党员','重庆市渝南区高斯街道40号','1992-07-10','15978004545','liuyunlong@depth.com','四川师范大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:33:41','1001','2018-04-27 16:12:50','王宏'),(18,'王妮',28,'','女','2018-05-15 11:03:23','汉','党员','重庆市沙坪坝小龙坎街道40号','1991-07-10','18978004545','wangni@depth.com','重庆大学','本科',NULL,NULL,12,'普通职员','0','0','2018-04-07 11:33:41','1001','2018-04-07 11:33:41','1001'),(19,'张兰',28,'','女','2018-02-05 11:03:23','汉','党员','重庆市沙坪坝区高斯街道40号','1990-07-10','15978004545','zhanglan@depth.com','西南大学','本科',NULL,NULL,19,'经理','1','0','2018-04-07 11:33:41','1001','2018-04-07 11:33:41','1001'),(20,'杨云',28,'','女','2018-03-05 11:03:23','汉','党员','重庆市江南区高斯街道40号','1992-07-10','18778004545','yangyun@depth.com','复旦大学','本科',NULL,NULL,20,'经理','1','0','2018-04-07 11:33:41','1001','2018-04-07 11:33:41','1001'),(21,'杨和兰',28,'dbcfabaa2ef238bb3bea1b0cb0628ef8','女','2018-04-27 16:12:46','汉','党员','重庆市沙坪坝区高斯街道40号','1991-07-10','15978004545','huhu@depth.com','复旦大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:33:41','1001','2018-04-27 16:12:46','王宏'),(22,'马思怡',28,'','女','2018-03-05 11:03:23','汉','党员','重庆市荣昌区昌源街道40号','1991-07-10','13358004545','masiyi@depth.com','成都大学','本科',NULL,NULL,12,'普通职员','0','0','2018-04-07 11:39:27','1001','2018-04-07 11:39:27','1001'),(23,'胡宇',28,'d651075d95b0fa4e3344cfa884fc0082','女','2018-03-05 11:03:23','汉','党员','重庆市荣昌区惠民街道4号','1991-06-12','15978004545','huyu@depth.com','成都大学','本科',NULL,NULL,23,'经理','1','0','2018-04-20 13:58:40','1001','2018-04-24 19:42:01','胡宇'),(24,'马沂峰',28,NULL,'男','2018-05-05 11:03:23','汉','党员','重庆市荣昌区高斯街道40号','1992-07-18','15978004545','mayufeng@depth.com','四川师范大学','本科',NULL,NULL,24,'经理','1','0','2018-04-07 11:39:27','1001','2018-04-07 11:39:27','1001'),(25,'王器',28,NULL,'女','2018-05-15 11:03:23','汉','党员','重庆市荣昌区昌源街道40号','1991-07-19','18978004545','wangqi@depth.com','重庆大学','本科',NULL,NULL,25,'经理','1','0','2018-04-07 11:39:27','1001','2018-04-07 11:39:27','1001'),(26,'吴宇',28,NULL,'女','2018-02-05 11:03:23','汉','党员','重庆市荣昌区黄金港40号','1990-02-10','15878004545','wuyu@depth.com','西南大学','本科',NULL,NULL,26,'经理','1','0','2018-04-07 11:39:27','1001','2018-04-07 11:39:27','1001'),(27,'杨辉',28,'ee6cb383bb8816b7792d673182d6ee1d','女','2018-04-27 16:12:44','汉','党员','重庆市荣昌区打勾街道40号','1992-01-10','17578004545','yanghui@depth.com','复旦大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-07 11:39:27','1001','2018-04-27 16:12:44','王宏'),(28,'马易',28,NULL,'男','2018-03-05 11:03:23','汉','党员','重庆市荣昌区水口街道40号','1991-11-10','15378004545','mayi@depth.com','复旦大学','本科',NULL,NULL,12,'普通职员','0','0','2018-04-07 11:39:27','1001','2018-04-07 11:39:27','1001'),(29,'甄鑫',22,NULL,'男',NULL,'汉','团员','重庆市綦江区虹桥路32号','1995-07-12','15956568888','zhenxin@depth.com','西南大学','本科',NULL,NULL,12,'普通职员','0','0','2018-04-21 00:51:27','胡宇','2018-04-21 00:51:27','胡宇'),(30,'王远',30,NULL,'男',NULL,'汉','团员','重庆市渝中区人和路22号','1988-02-03','13156568989','wangyuan@depth.com','华北大学','本科',NULL,NULL,12,'普通职员','0','0','2018-04-23 10:38:04','胡宇','2018-04-23 10:38:04','胡宇'),(31,'张三风',32,'1ecabe6d32a1247afe024d3ee0da2719','男','2018-04-26 21:18:35','汉','汉','重庆市章叁区刘家路19号','1994-02-10','13123562356','zhangsanfeng@depth.com','加里敦大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-23 14:27:01','胡宇','2018-04-27 16:11:52','王宏'),(32,'约翰',25,NULL,'男',NULL,'汉','团员','重庆市南岸区步行街32号','1994-02-11','15589892323','yuehan@depth.com','新疆大学','本科',NULL,NULL,13,'普通职员','0','0','2018-04-23 14:35:49','胡宇','2018-04-23 14:35:49','胡宇'),(33,'王大锤',35,'a8b6cdcb8d2fb22d3bbf4a1b0943cd17','男','2018-04-24 22:54:03','汉','团员','重庆市浦江区天桥路32号','1989-02-08','13156238989','wangdachui@depth.com','某某大学','本科',NULL,NULL,12,'普通职员','1','0','2018-04-23 21:24:08','胡宇','2018-04-24 22:54:03','王宏'),(34,'李想',22,NULL,'男',NULL,'汉','党员','重庆市綦江区虹桥路32号','1990-06-12','13156562323','lixiang@depth.com','四川大学','本科',NULL,NULL,9,'普通职员','0','0','2018-04-23 22:53:55','胡宇','2018-04-23 22:53:55','胡宇');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_post`
--

DROP TABLE IF EXISTS `invite_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `emp_name` varchar(50) DEFAULT NULL,
  `status` char(2) DEFAULT NULL COMMENT '处理结果',
  `department_id` bigint(11) DEFAULT NULL,
  `department_name` varchar(50) DEFAULT NULL,
  `approver` bigint(20) DEFAULT NULL COMMENT '审批人',
  `entry_time` datetime DEFAULT NULL COMMENT '入职时间',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='招聘表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_post`
--

LOCK TABLES `invite_post` WRITE;
/*!40000 ALTER TABLE `invite_post` DISABLE KEYS */;
INSERT INTO `invite_post` VALUES (1,32,'约翰','0',13,'采购部',23,'2018-04-23 14:35:49','2018-04-23 14:35:49','胡宇','2018-04-23 14:35:49','胡宇'),(2,33,'王大锤','1',12,'生产部',12,'2018-04-23 21:24:08','2018-04-23 21:24:08','胡宇','2018-04-24 22:54:03','王宏'),(3,34,'李想','0',9,'市场部',23,'2018-04-23 22:53:55','2018-04-23 22:53:55','胡宇','2018-04-23 22:53:55','胡宇'),(4,1,'王辉','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:09','王宏'),(5,2,'李勤','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:11','王宏'),(6,3,'赵力','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:06','王宏'),(7,4,'陈宇涵','2',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:14','王宏'),(8,5,'程晨','2',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-26 09:50:45','王宏'),(9,6,'王华','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:17','王宏'),(10,7,'张珊','2',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:19','王宏'),(11,8,'张静','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:21','王宏'),(12,10,'张宇','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-26 21:18:28','王宏'),(13,14,'胡丽','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:24','王宏'),(14,15,'胡户','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:13:26','王宏'),(15,17,'柳云龙','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:12:50','王宏'),(16,18,'王妮','0',12,'生产部',23,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-24 21:49:13','胡宇'),(17,21,'杨和兰','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:12:46','王宏'),(18,22,'马思怡','0',12,'生产部',23,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-24 21:49:13','胡宇'),(19,27,'杨辉','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-27 16:12:43','王宏'),(21,30,'王远','0',12,'生产部',23,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-24 21:49:13','胡宇'),(22,31,'张三丰','1',12,'生产部',12,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-26 21:18:36','王宏'),(23,28,'马易','0',12,'生产部',23,'2018-04-24 21:49:13','2018-04-24 21:49:13','胡宇','2018-04-24 21:49:13','胡宇');
/*!40000 ALTER TABLE `invite_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(11) DEFAULT NULL COMMENT '员工ID',
  `base` int(11) DEFAULT NULL COMMENT '基本工资',
  `bonus` int(11) DEFAULT NULL COMMENT '奖金',
  `subsidy` int(11) DEFAULT NULL COMMENT '补贴',
  `comment` varchar(300) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='薪资表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_history`
--

DROP TABLE IF EXISTS `salary_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `salary` decimal(10,0) DEFAULT NULL COMMENT '薪资',
  `comment` varchar(300) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史薪资表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_history`
--

LOCK TABLES `salary_history` WRITE;
/*!40000 ALTER TABLE `salary_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父级ID',
  `name` varchar(30) DEFAULT NULL COMMENT '权限名',
  `url` varchar(255) DEFAULT NULL COMMENT '权限URL',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `permission` varchar(30) DEFAULT NULL COMMENT '权限字符',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (1,0,'招聘管理',NULL,1,'invitepost','2018-04-07 12:36:36','1001','2018-04-07 12:36:41','1001'),(2,1,'入职申请','/invitePost/newApply',2,'invitepost:newapply','2018-04-07 13:12:51','1001','2018-04-07 13:12:57','1001'),(3,1,'面试管理','/invitePost/interview',3,'invitepost:interview','2018-04-07 20:21:03','1001','2018-04-07 20:21:07','1001'),(4,1,'职位分配','/invitePost/allot',4,'invitepost:allot','2018-04-07 20:23:09','1001','2018-04-07 20:23:13','1001'),(5,0,'员工管理',NULL,1,'empmanage','2018-04-07 20:24:01','1001','2018-04-07 20:24:04','1001'),(6,5,'员工信息管理','/emp/detail',1,'empmanage:detail','2018-04-07 20:25:38','1001','2018-04-07 20:25:42','1001'),(7,5,'请假管理','/emp/holiday',1,'empmanage:holiday','2018-04-07 20:27:46','1001','2018-04-07 20:27:50','1001'),(8,0,'请假申请','/emp/holidayApply',1,'empmanage:holiday:apply','2018-04-07 20:30:06','1001','2018-04-07 20:30:10','1001'),(9,5,'岗位调度','/emp/adjustment',1,'empmanage:adjustment','2018-04-07 20:31:14','1001','2018-04-07 20:31:18','1001'),(10,5,'培训管理','/emp/train',1,'empmanage:train','2018-04-07 20:32:01','1001','2018-04-07 20:32:05','1001'),(11,0,'工资管理',NULL,1,'salary','2018-04-07 20:32:52','1001','2018-04-07 20:32:55','1001'),(12,11,'基本工资','/salary/base',1,'salary:base','2018-04-07 20:33:40','1001','2018-04-07 20:33:44','1001'),(13,11,'奖金','/salary/bonus',1,'salary:bonus','2018-04-07 20:34:23','1001','2018-04-07 20:34:27','1001'),(14,11,'考勤','/salary/attendance',1,'salary:attendance','2018-04-07 20:35:29','1001','2018-04-07 20:35:33','1001'),(15,0,'数据分析',NULL,0,'analyze','2018-04-07 20:36:28','1001','2018-04-07 20:36:32','1001'),(16,15,'入职率、离职率','/analyze/probability',1,'analyze:probability','2018-04-07 20:37:28','1001','2018-04-07 20:37:31','1001'),(17,15,'平均值','/analyze/average',1,'analyze:average','2018-04-07 20:38:19','1001','2018-04-07 20:38:23','1001'),(18,0,'部门管理',NULL,2,'department','2018-04-07 20:39:10','1001','2018-04-07 20:39:13','1001'),(19,18,'部门信息','/department/detail',2,'department:detail','2018-04-07 20:39:57','1001','2018-04-07 20:40:01','1001'),(20,18,'部门调整','/department/adjustment',2,'department:adjustment','2018-04-07 20:41:13','1001','2018-04-07 20:41:16','1001'),(21,0,'考勤查看','/salary/attendance/view',1,'salary:attendance:view','2018-04-07 20:42:34','1001','2018-04-07 20:42:38','1001'),(22,0,'工资查看','/salary/view',1,'salary:view','2018-04-07 20:43:50','1001','2018-04-07 20:43:53','1001'),(23,0,'信息查看','/emp/view',1,'empmanage:view','2018-04-07 20:45:21','1001','2018-04-07 20:45:25','1001');
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','2018-04-07 20:47:50','1001','2018-04-07 20:47:54','1001'),(2,'员工','2018-04-07 20:48:13','1001','2018-04-07 20:48:17','1001'),(3,'经理','2018-04-07 20:48:28','1001','2018-04-07 20:48:32','1001'),(4,'人事部','2018-04-24 21:33:47','1001','2018-04-24 21:33:38','1001');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_emp`
--

DROP TABLE IF EXISTS `sys_role_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_emp`
--

LOCK TABLES `sys_role_emp` WRITE;
/*!40000 ALTER TABLE `sys_role_emp` DISABLE KEYS */;
INSERT INTO `sys_role_emp` VALUES (1,1,2,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(2,2,2,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(3,3,2,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(4,4,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(5,5,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(6,6,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(7,7,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(8,8,2,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(9,9,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(10,10,2,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(11,11,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(12,12,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(13,13,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(14,14,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(15,15,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(16,16,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(17,17,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(18,18,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(19,19,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(20,20,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(21,21,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(22,22,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(23,23,4,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(24,24,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(25,25,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(26,26,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(27,27,1,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001'),(28,28,3,'2018-04-07 21:09:37','1001','2018-04-07 21:09:37','1001');
/*!40000 ALTER TABLE `sys_role_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限ID',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='角色-权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` VALUES (1,1,1,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(2,1,2,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(3,1,3,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(4,1,4,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(5,1,5,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(6,1,6,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(7,1,7,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(8,1,9,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(9,1,10,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(10,1,11,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(11,1,12,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(12,1,13,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(13,1,14,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(14,1,15,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(15,1,16,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(16,1,17,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(17,1,18,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(18,1,19,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(19,1,20,'2018-04-07 20:56:08','1001','2018-04-07 20:56:08','1001'),(20,2,8,'2018-04-07 20:58:27','1001','2018-04-07 20:58:35','1001'),(21,2,21,'2018-04-07 20:58:30','1001','2018-04-07 20:58:40','1001'),(22,2,22,'2018-04-07 20:58:44','1001','2018-04-07 20:58:49','1001'),(23,2,23,'2018-04-07 20:58:47','1001','2018-04-07 20:58:52','1001'),(24,3,1,'2018-04-24 21:35:48','111','2018-04-24 21:35:53','111'),(25,3,3,'2018-04-24 21:36:17','111','2018-04-24 21:36:20','111'),(26,3,5,'2018-04-24 21:38:54','333','2018-04-24 21:38:57','333'),(27,3,6,'2018-04-24 21:39:06','333','2018-04-24 21:39:09','333'),(28,3,7,'2018-04-24 21:39:16','555','2018-04-24 21:39:19','555'),(30,3,9,'2018-04-24 21:39:36','777','2018-04-24 21:39:39','666'),(31,3,10,'2018-04-24 21:39:48','666','2018-04-24 21:39:52','666'),(32,3,11,NULL,NULL,NULL,NULL),(33,3,12,NULL,NULL,NULL,NULL),(34,3,13,NULL,NULL,NULL,NULL),(35,3,14,NULL,NULL,NULL,NULL),(36,3,15,NULL,NULL,NULL,NULL),(37,3,16,NULL,NULL,NULL,NULL),(38,3,17,NULL,NULL,NULL,NULL),(39,3,18,NULL,NULL,NULL,NULL),(40,3,19,NULL,NULL,NULL,NULL),(41,3,20,NULL,NULL,NULL,NULL),(42,4,1,NULL,NULL,NULL,NULL),(43,4,2,NULL,NULL,NULL,NULL),(44,4,3,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(45,4,4,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(46,4,5,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(47,4,6,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(48,4,7,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(50,4,9,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(51,4,10,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(52,4,11,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(53,4,12,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(54,4,13,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(55,4,14,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(56,4,15,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(57,4,16,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(58,4,17,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(59,4,18,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(60,4,19,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111'),(61,4,20,'2018-04-24 21:55:02','111','2018-04-24 21:55:02','111');
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `text` varchar(255) DEFAULT NULL COMMENT '内容',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `publisher` bigint(20) DEFAULT NULL COMMENT '发布者',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='培训表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_emp`
--

DROP TABLE IF EXISTS `train_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train_emp` (
  `emp_id` bigint(20) NOT NULL COMMENT '员工ID',
  `train_id` bigint(20) NOT NULL COMMENT '培训ID',
  `status` char(2) DEFAULT NULL COMMENT '状态',
  `text` varchar(255) DEFAULT NULL COMMENT '备注',
  `approver` bigint(20) DEFAULT NULL COMMENT '审批人',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`emp_id`,`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='培训--员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_emp`
--

LOCK TABLES `train_emp` WRITE;
/*!40000 ALTER TABLE `train_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `train_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacate`
--

DROP TABLE IF EXISTS `vacate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacate` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(300) DEFAULT NULL COMMENT '请假内容',
  `emp_id` bigint(11) DEFAULT NULL COMMENT '请假者',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `up_time` datetime DEFAULT NULL COMMENT '提交时间',
  `deal_time` datetime DEFAULT NULL COMMENT '处理时间',
  `status` char(2) DEFAULT NULL COMMENT '申请状态',
  `department_id` bigint(20) DEFAULT NULL,
  `approve_id` bigint(11) DEFAULT NULL COMMENT '审批人',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='请假表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacate`
--

LOCK TABLES `vacate` WRITE;
/*!40000 ALTER TABLE `vacate` DISABLE KEYS */;
INSERT INTO `vacate` VALUES (1,'生病了，我要请假！！！',8,'2018-04-27 00:00:00','2018-04-30 00:00:00','2018-04-27 21:55:05',NULL,'0',12,NULL,'2018-04-27 21:55:05','张静','2018-04-27 21:55:05','张静'),(2,'我就是要请假！！！',3,'2018-04-27 00:00:00','2018-04-30 00:00:00','2018-04-27 22:01:21','2018-04-28 14:37:59','2',12,12,'2018-04-27 22:01:21','赵力','2018-04-28 14:37:59','王宏'),(3,'我也要请假！！！',2,'2018-04-27 00:00:00','2018-04-30 00:00:00','2018-04-27 22:04:35','2018-04-28 14:37:54','1',12,12,'2018-04-27 22:04:35','李勤','2018-04-28 14:37:54','王宏'),(4,'我又生病了，给我请假吧',8,'2018-04-28 00:00:00','2018-05-01 00:00:00','2018-04-28 15:14:44','2018-04-28 15:15:40','1',12,12,'2018-04-28 15:14:44','张静','2018-04-28 15:15:40','王宏');
/*!40000 ALTER TABLE `vacate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-30 23:32:46
