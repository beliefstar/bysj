/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : bysj

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-04-15 22:19:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `username` varchar(20) DEFAULT NULL COMMENT '账户名',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `last_login` datetime DEFAULT NULL COMMENT '上次登录',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('10002', '23', 'huyu', 'Qy6+Kw==', '1989c1a317441b5cd024dd70864a978c', null, '2018-04-07 12:08:43', '1001', '2018-04-07 12:08:43', '1001');
INSERT INTO `account` VALUES ('10003', '28', 'mayi', 'phCzHQ==', 'd47eea8123890b19e5cd287f3951eb4b', null, '2018-04-07 12:13:11', '1001', '2018-04-07 12:13:11', '1001');

-- ----------------------------
-- Table structure for adjustment
-- ----------------------------
DROP TABLE IF EXISTS `adjustment`;
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

-- ----------------------------
-- Records of adjustment
-- ----------------------------

-- ----------------------------
-- Table structure for adjustment_apply
-- ----------------------------
DROP TABLE IF EXISTS `adjustment_apply`;
CREATE TABLE `adjustment_apply` (
  `id` bigint(20) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位调整申请表';

-- ----------------------------
-- Records of adjustment_apply
-- ----------------------------

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
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

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级菜单',
  `name` varchar(30) DEFAULT NULL COMMENT '部门名称',
  `master` bigint(20) DEFAULT NULL COMMENT '部门经理ID',
  `introduce` varchar(1000) DEFAULT NULL COMMENT '部门简介',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '0', '营销中心', '1', '负责产品营销工作的部门或组织，负责管理发现消费需求、产品定位、主导产品开发、价格策略与竞争、通路管理、推广、组织和部门日常管理、营销战略规划和策略执行等系列工作', '2018-04-04 23:34:20', '1001', '2018-04-04 23:34:41', '1001');
INSERT INTO `department` VALUES ('2', '0', '制造中心', '2', '负责生产、设备、安全、环保等制度拟订、检查、监督、控制及执行', '2018-04-04 23:37:04', '1001', '2018-04-04 23:37:09', '1001');
INSERT INTO `department` VALUES ('3', '0', '研发中心', '3', '从事新产品的研发和管理工作；根据市场的情况、制定公司不同阶段的技术策略及发展目标；研究行业技术发展趋势，探索新项目、新产品的可能性', '2018-04-04 23:37:57', '1001', '2018-04-04 23:38:01', '1001');
INSERT INTO `department` VALUES ('4', '0', '人力资源中心', '4', '企业中各类人员形成的资源（即把人作为资源）进行管理的部门。', '2018-04-04 23:39:13', '1001', '2018-04-04 23:39:18', '1001');
INSERT INTO `department` VALUES ('5', '0', '财务中心', '5', '财务部门是利用会计部门收集的信息进行再加工、分析和决策支持,它主要是为企业内部经营者服务的部门。财务部门负责人务必将财务部门塑造成企业的核心部门，无论是集团公司财务部，还是生产型企业财务部。因为财务部门是企业资金控制的最后环节，一旦现金流出，发生的损失要挽回就相当的困难了。', '2018-04-04 23:40:11', '1001', '2018-04-04 23:40:15', '1001');
INSERT INTO `department` VALUES ('6', '1', '大陆营销中心', '6', '是本企业主要营销区域，主要分布在西南地区。', '2018-04-04 23:41:51', '1001', '2018-04-04 23:41:55', '1001');
INSERT INTO `department` VALUES ('7', '1', '香港营销中心', '7', '是本企业新建立的营销部门，主要负责香港片区营销工作', '2018-04-04 23:43:04', '1001', '2018-04-04 23:43:09', '1001');
INSERT INTO `department` VALUES ('8', '6', '商务部', '8', '负责公司业务拓展的规划及可行性方案的制定及执行、负责公司的卖区规划、品类分布、品牌结构规划及执行、负责公司经营指标的分解及坪效的分析', '2018-04-04 23:44:36', '1001', '2018-04-04 23:44:40', '1001');
INSERT INTO `department` VALUES ('9', '6', '市场部', '9', '市场部是一个企业中营销组织架构的重要组成部分，通常包含产品市场部、市场开发部、市场宣传部和销售支持部，在企业中具有巨大的作用。', '2018-04-04 23:45:30', '1001', '2018-04-04 23:45:34', '1001');
INSERT INTO `department` VALUES ('10', '6', '卖场部', '10', '是一个企业的经济命脉，营销部业绩的好坏直接影响到企业的收入。一般来说，营销部负责人的要求比较高，要有较好的沟通能力，市场开发和分析能力，管理能力，应变能力，责任心强，有号召力，熟悉营销模式，具有业务开拓渠道，有良好的营销管理策略及经验', '2018-04-04 23:46:45', '1001', '2018-04-04 23:46:49', '1001');
INSERT INTO `department` VALUES ('11', '6', '客服部', '11', '主要体现了一种以客户为导向的价值观，它整合及管理在预先设定的最优成本——服务组合中的客户界面的所有要素。广义而言，任何能提高客户满意度的内容都属于客户服务的范围。', '2018-04-04 23:47:38', '1001', '2018-04-04 23:47:42', '1001');
INSERT INTO `department` VALUES ('12', '2', '生产部', '12', '负责对各种设备事故、工伤、伤亡事故、急性中毒事故以及环境污染事故的调查处理，并制订改进措施计划', '2018-04-04 23:49:01', '1001', '2018-04-04 23:49:06', '1001');
INSERT INTO `department` VALUES ('13', '2', '采购部', '13', '公司中生产中负责生产物资采购的部门。', '2018-04-04 23:49:48', '1001', '2018-04-04 23:49:53', '1001');
INSERT INTO `department` VALUES ('14', '2', '品质部', '14', '品质管理（Quality Control）指以质量为中心，以全员参与为基础，目的在于通过让客户满意而达到长期成功的管理途径。\r\n企业只有得到买方的同意，才能获得一定的利益。为此不能欠缺，必不可少的生产、销售的技术，确保产品质量的技术等，正确经济的制造出满足顾客产品质量要求的管理体系。所以如前所述，追求所有工作的效率提高和具有改进效果的工作方法，因此解决工作中发生的各种各样问题，常常探索更有效的新方法是必要的。这样的活动称为品质管理.并且将\"关于制造的品质管理\"作为重点叙述。事务工作如前所述也有很多共同点。', '2018-04-04 23:50:39', '1001', '2018-04-04 23:50:43', '1001');
INSERT INTO `department` VALUES ('15', '2', '物控部', '15', '物控部门的职能是计划协调，仓储部门是执行物控部门的指令', '2018-04-04 23:51:28', '1001', '2018-04-04 23:51:32', '1001');
INSERT INTO `department` VALUES ('16', '12', '五金车间', '16', '五金制品，出现在经济生活、政治生活以及军事活动的各个角落。五金类产品种类繁多，规格各异，但是五金类产品在现代生活中又起着不可替代的作用，选择好的五金配件可以使很多结构件使用起来更安全、便捷。', '2018-04-04 23:53:08', '1001', '2018-04-04 23:53:12', '1001');
INSERT INTO `department` VALUES ('17', '12', '超滤车间', '17', '超滤(Ultra-filtration, UF)是一种能将溶液进行净化和分离的膜分离技术。超滤膜系统是以超滤膜丝为过滤介质，膜两侧的压力差为驱动力的溶液分离装置。超滤膜只允许溶液中的溶剂（如水分子）、无机盐及小分子有机物透过，而将溶液中的悬浮物、胶体、蛋白质和微生物等大分子物质截留，从而达到净化或分离的目的。', '2018-04-04 23:54:47', '1001', '2018-04-04 23:54:52', '1001');
INSERT INTO `department` VALUES ('18', '12', '组装车间', '18', '最终组装成成品，出厂销售。', '2018-04-04 23:56:52', '1001', '2018-04-04 23:56:57', '1001');
INSERT INTO `department` VALUES ('19', '15', '物流中心', '19', '物流中心是物流系统中的基础设施。它的规划、筹建、运行与完善，涉及交通、物资、商业、外贸、工业、建筑、农业、金融等多个部门、多个行业的企业。不同部门及企业对其内涵及外延的理解不尽一致。', '2018-04-04 23:57:55', '1001', '2018-04-04 23:57:59', '1001');
INSERT INTO `department` VALUES ('20', '15', '仓库', '20', '存储成品与物料', '2018-04-04 23:58:38', '1001', '2018-04-04 23:58:53', '1001');
INSERT INTO `department` VALUES ('21', '3', '技术部', '21', '负责对新产品的设计和开发的控制及编制各类技术文件；参与产品实现的策划；参与合同评审和对供方的评价。', '2018-04-04 23:59:52', '1001', '2018-04-04 23:59:56', '1001');
INSERT INTO `department` VALUES ('22', '3', '化工部', '22', '化工是“化学工艺”、“化学工业”、“化学工程”等的简称。凡运用化学方法改变物质组成、结构或合成新物质的技术，都属于化学生产技术，也就是化学工艺，所得产品被称为化学品或化工产品。起初，生产这类产品的是手工作坊，后来演变为工厂，并逐渐形成了一个特定的生产行业即化学工业。', '2018-04-05 00:00:45', '1001', '2018-04-05 00:00:49', '1001');
INSERT INTO `department` VALUES ('23', '4', '人事部', '23', '人事部是一个企业或者团体的人力资源和企业公共事务的管理部门 。现在为强化人的重要性，分离出人力资源部门。一般意义上人力资源部门应该是人事部的发展，但不能说人事部本身具有缺陷，只是一般意义上的解说歪曲了人事部的意义。人力资源的意义发展是其本身职能的发展而非部门名称的原因，因此人事部并没有过时之说。其本身职能的变化和发展应该具有时代意义。', '2018-04-05 00:01:36', '1001', '2018-04-05 00:01:40', '1001');
INSERT INTO `department` VALUES ('24', '4', '后勤部', '24', '后勤部就是以后勤保障为主要工作的部门。该部门直接作用于团体内部其它部门，对其它部门的正常运作具有至关重要的作用，对实现团体目标任务起间接作用；简言之，后勤部是为其它各部门职能能够顺利实现提供物质服务的一个部门。在中国人民解放军队伍里，后勤部是师以上单位后勤机关部门，是主管部队后勤工作的机构。当前军队后勤保障主要有“指挥、保障合一型”与“指挥、保障分离”型两种。前者指的是后勤领导机关与后勤部队合而为一，后者则是后勤领导机关与后勤部队相互分离。', '2018-04-05 00:02:23', '1001', '2018-04-05 00:02:27', '1001');
INSERT INTO `department` VALUES ('25', '4', '培训部', '25', '根据公司业务发展节奏完成启动培训和项目培训以及新员工岗前培训，根据公司领导要求制定培训计划，编制培训资料，包括课件以及文档资料', '2018-04-05 00:03:51', '1001', '2018-04-05 00:03:55', '1001');
INSERT INTO `department` VALUES ('26', '5', '财务部', '26', '财务部门是利用会计部门收集的信息进行再加工、分析和决策支持,它主要是为企业内部经营者服务的部门。财务部门负责人务必将财务部门塑造成企业的核心部门，无论是集团公司财务部，还是生产型企业财务部。因为财务部门是企业资金控制的最后环节，一旦现金流出，发生的损失要挽回就相当的困难了。', '2018-04-05 00:04:46', '1001', '2018-04-05 00:04:51', '1001');
INSERT INTO `department` VALUES ('27', '5', '经管部', '27', '经济管理机构是指为了实现经济活动的目标，在人员分工及功能分化的基础上，使管理者群体中的各个成员担任不同的职务，承担不同的责任，赋予不同的权力，共同协作，为实现共同目标而组织起来的系统或形式。经济管理机构从宏观上看，是各级政府机构及其设置的综合和专业经济管理部门；从微观上看，主要是企业内部管理机构。它们的共同特征是由一批在社会分工中从事经济管理工作，具有一定管理技能，按照一定方式组织起来的人员集合体。这些人员(即管理者)在管理机构中，根据分工都有一定的职位、权力、责任和义务，代表管理机构行使管理的职能。', '2018-04-05 00:05:34', '1001', '2018-04-05 00:05:37', '1001');
INSERT INTO `department` VALUES ('28', '0', '董事会', '28', '董事会，是由董事组成的、对内掌管公司事务、对外代表公司的经营决策和业务执行机构，公司设董事会，由股东（大）会选举。董事会设董事长一人，副董事长，董事长、副董事长的产生办法由公司章程规定，一般由董事会选举产生。董事任期三年，任期届满，可连选连任，董事在任期届满前，股东会不得无故解除其职务。', '2018-04-05 00:06:49', '1001', '2018-04-05 00:06:53', '1001');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '工号',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `age` int(11) NOT NULL COMMENT '年龄',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `join_time` datetime NOT NULL COMMENT '入职时间',
  `nation` varchar(10) DEFAULT NULL COMMENT '民族',
  `politics` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `address` varchar(50) DEFAULT NULL COMMENT '家庭住址',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone1` varchar(20) DEFAULT NULL COMMENT '电话1',
  `phone2` varchar(20) DEFAULT NULL COMMENT '电话2',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业院校',
  `education` varchar(20) DEFAULT NULL COMMENT '学历',
  `del_flg` char(1) DEFAULT NULL COMMENT '删除标志',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '王辉', '28', '男', '2018-04-07 09:58:24', '汉', '党员', '重庆市渝北区大竹林街道斑竹路12号', '1990-08-17', '13345671234', null, 'wanghui@depth.com', '西南大学', '本科', '0', '2018-04-07 10:02:34', '1001', '2018-04-07 10:02:38', '1001');
INSERT INTO `emp` VALUES ('2', '李勤', '27', '男', '2018-04-05 11:03:23', '汉', '党员', '重庆市渝中区瑞泰路10号', '1991-07-10', '18112345678', '48445656', 'liqin@depth.com', '西南大学', '本科', '0', '2018-04-07 11:05:49', '1001', '2018-04-07 11:05:54', '1001');
INSERT INTO `emp` VALUES ('3', '赵力', '27', '男', '2018-04-09 11:06:51', '汉', '团员', '重庆市沙坪坝区小龙坎街道156号', '1991-06-05', '15578945623', null, 'zhaoli@depth.com', '重庆大学', '本科', '0', '2018-04-07 11:08:11', '1001', '2018-04-07 11:08:17', '1001');
INSERT INTO `emp` VALUES ('4', '陈宇涵', '28', '男', '2018-04-06 11:08:55', '汉', '团员', '重庆市沙坪坝区小龙坎街道189号', '1990-04-07', '18822224545', null, 'chenyuhan@depth.com', '重庆交通大学', '本科', '0', '2018-04-07 11:10:23', '1001', '2018-04-07 11:10:32', '1001');
INSERT INTO `emp` VALUES ('5', '程晨', '27', '女', '2018-04-07 11:11:11', '汉', '团员', '重庆市南岸区镇西街道45号', '1991-03-14', '15688887474', null, 'chengchen@depth.com', '重庆文理学院', '本科', '0', '2018-04-07 11:12:32', '1001', '2018-04-07 11:12:38', '1001');
INSERT INTO `emp` VALUES ('6', '王华', '28', '男', '2018-04-05 11:03:23', '汉', '团员', '重庆市江北区盘溪街道78号', '1991-07-10', '16678784545', '', 'wanghua@depth.com', '华南大学', '本科', '0', '2018-04-07 11:18:06', '1001', '2018-04-07 11:18:06', '1001');
INSERT INTO `emp` VALUES ('7', '张珊', '28', '女', '2018-04-05 11:03:23', '汉', '团员', '重庆市江北区盘溪街道178号', '1991-07-10', '16678784545', '', 'wanghua@depth.com', '华南大学', '本科', '0', '2018-04-07 11:20:13', '1001', '2018-04-07 11:20:13', '1001');
INSERT INTO `emp` VALUES ('8', '张静', '28', '女', '2018-04-05 11:03:23', '汉', '团员', '重庆市江南区高昂街道17号', '1991-07-10', '16678784545', '', 'zhangjing@depth.com', '华南大学', '本科', '0', '2018-04-07 11:23:00', '1001', '2018-04-07 11:23:00', '1001');
INSERT INTO `emp` VALUES ('9', '张云', '28', '男', '2018-04-05 11:03:23', '汉', '团员', '重庆市江南区高昂街道147号', '1991-07-10', '16678784545', '', 'zhangyun@depth.com', '华南大学', '本科', '0', '2018-04-07 11:23:32', '1001', '2018-04-07 11:23:32', '1001');
INSERT INTO `emp` VALUES ('10', '张宇', '28', '男', '2018-04-05 11:03:23', '汉', '团员', '重庆市江南区高昂街道14号', '1991-07-10', '16678784545', '', 'zhangyu@depth.com', '华东大学', '本科', '0', '2018-04-07 11:24:10', '1001', '2018-04-07 11:24:10', '1001');
INSERT INTO `emp` VALUES ('11', '王立', '28', '男', '2018-04-05 11:03:23', '汉', '团员', '重庆市江南区高昂街道104号', '1991-07-10', '16678784545', '', 'wangli@depth.com', '华东大学', '本科', '0', '2018-04-07 11:24:39', '1001', '2018-04-07 11:24:39', '1001');
INSERT INTO `emp` VALUES ('12', '王宏', '28', '男', '2018-04-05 11:03:23', '汉', '团员', '重庆市渝北区高斯街道4号', '1991-07-10', '16678784545', '', 'wanghong@depth.com', '华东大学', '本科', '0', '2018-04-07 11:25:25', '1001', '2018-04-07 11:25:25', '1001');
INSERT INTO `emp` VALUES ('13', '李林', '28', '女', '2018-04-05 11:03:23', '汉', '党员', '重庆市渝北区高斯街道40号', '1991-07-10', '16678784545', '', 'lilin@depth.com', '西南大学', '本科', '0', '2018-04-07 11:26:02', '1001', '2018-04-07 11:26:02', '1001');
INSERT INTO `emp` VALUES ('14', '胡丽', '28', '女', '2018-04-05 11:03:23', '汉', '党员', '重庆市渝南区高斯街道40号', '1991-07-10', '16678784545', '', 'huli@depth.com', '西南大学', '本科', '0', '2018-04-07 11:26:42', '1001', '2018-04-07 11:26:42', '1001');
INSERT INTO `emp` VALUES ('15', '胡户', '28', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市渝南区高斯街道40号', '1991-07-10', '15978004545', '', 'huhu@depth.com', '成都大学', '本科', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES ('16', '胡旺', '28', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市江北区阿斯街道4号', '1991-07-10', '15978004545', '', 'huwang@depth.com', '成都大学', '本科', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES ('17', '柳云龙', '28', '男', '2018-05-05 11:03:23', '汉', '党员', '重庆市渝南区高斯街道40号', '1992-07-10', '15978004545', '', 'liuyunlong@depth.com', '四川师范大学', '本科', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES ('18', '王妮', '28', '女', '2018-05-15 11:03:23', '汉', '党员', '重庆市沙坪坝小龙坎街道40号', '1991-07-10', '18978004545', '', 'wangni@depth.com', '重庆大学', '本科', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES ('19', '张兰', '28', '女', '2018-02-05 11:03:23', '汉', '党员', '重庆市沙坪坝区高斯街道40号', '1990-07-10', '15978004545', '', 'zhanglan@depth.com', '西南大学', '本科', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES ('20', '杨云', '28', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市江南区高斯街道40号', '1992-07-10', '18778004545', '', 'yangyun@depth.com', '复旦大学', '本科', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES ('21', '杨和兰', '28', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市沙坪坝区高斯街道40号', '1991-07-10', '15978004545', '', 'huhu@depth.com', '复旦大学', '本科', '0', '2018-04-07 11:33:41', '1001', '2018-04-07 11:33:41', '1001');
INSERT INTO `emp` VALUES ('22', '马思怡', '28', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市荣昌区昌源街道40号', '1991-07-10', '13358004545', '', 'masiyi@depth.com', '成都大学', '本科', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES ('23', '胡宇', '28', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市荣昌区惠民街道4号', '1991-06-12', '15978004545', '', 'huyu@depth.com', '成都大学', '本科', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES ('24', '马沂峰', '28', '男', '2018-05-05 11:03:23', '汉', '党员', '重庆市荣昌区高斯街道40号', '1992-07-18', '15978004545', '', 'mayufeng@depth.com', '四川师范大学', '本科', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES ('25', '王器', '28', '女', '2018-05-15 11:03:23', '汉', '党员', '重庆市荣昌区昌源街道40号', '1991-07-19', '18978004545', '', 'wangqi@depth.com', '重庆大学', '本科', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES ('26', '吴宇', '28', '女', '2018-02-05 11:03:23', '汉', '党员', '重庆市荣昌区黄金港40号', '1990-02-10', '15878004545', '', 'wuyu@depth.com', '西南大学', '本科', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES ('27', '杨辉', '28', '女', '2018-03-05 11:03:23', '汉', '党员', '重庆市荣昌区打勾街道40号', '1992-01-10', '17578004545', '', 'yanghui@depth.com', '复旦大学', '本科', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');
INSERT INTO `emp` VALUES ('28', '马易', '28', '男', '2018-03-05 11:03:23', '汉', '党员', '重庆市荣昌区水口街道40号', '1991-11-10', '15378004545', '', 'mayi@depth.com', '复旦大学', '本科', '0', '2018-04-07 11:39:27', '1001', '2018-04-07 11:39:27', '1001');

-- ----------------------------
-- Table structure for emp_department
-- ----------------------------
DROP TABLE IF EXISTS `emp_department`;
CREATE TABLE `emp_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `department_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `post` varchar(30) DEFAULT NULL COMMENT '职位',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工-职位表';

-- ----------------------------
-- Records of emp_department
-- ----------------------------

-- ----------------------------
-- Table structure for invite_post
-- ----------------------------
DROP TABLE IF EXISTS `invite_post`;
CREATE TABLE `invite_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `status` char(2) DEFAULT NULL COMMENT '处理结果',
  `approver` bigint(20) DEFAULT NULL COMMENT '审批人',
  `entry_time` datetime DEFAULT NULL COMMENT '入职时间',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招聘表';

-- ----------------------------
-- Records of invite_post
-- ----------------------------

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
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

-- ----------------------------
-- Records of salary
-- ----------------------------

-- ----------------------------
-- Table structure for salary_history
-- ----------------------------
DROP TABLE IF EXISTS `salary_history`;
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

-- ----------------------------
-- Records of salary_history
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
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

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', '招聘管理', null, '1', 'invitepost', '2018-04-07 12:36:36', '1001', '2018-04-07 12:36:41', '1001');
INSERT INTO `sys_permission` VALUES ('2', '1', '入职申请', '/invitePost/newApply', '2', 'invitepost:newapply', '2018-04-07 13:12:51', '1001', '2018-04-07 13:12:57', '1001');
INSERT INTO `sys_permission` VALUES ('3', '1', '面试管理', '/invitePost/interview', '3', 'invitepost:interview', '2018-04-07 20:21:03', '1001', '2018-04-07 20:21:07', '1001');
INSERT INTO `sys_permission` VALUES ('4', '1', '职位分配', '/invitePost/allot', '4', 'invitepost:allot', '2018-04-07 20:23:09', '1001', '2018-04-07 20:23:13', '1001');
INSERT INTO `sys_permission` VALUES ('5', '0', '员工管理', null, '1', 'empmanage', '2018-04-07 20:24:01', '1001', '2018-04-07 20:24:04', '1001');
INSERT INTO `sys_permission` VALUES ('6', '5', '员工信息管理', '/emp/detail', '1', 'empmanage:detail', '2018-04-07 20:25:38', '1001', '2018-04-07 20:25:42', '1001');
INSERT INTO `sys_permission` VALUES ('7', '5', '请假管理', '/emp/holiday', '1', 'empmanage:holiday', '2018-04-07 20:27:46', '1001', '2018-04-07 20:27:50', '1001');
INSERT INTO `sys_permission` VALUES ('8', '0', '请假申请', '/emp/holidayApply', '1', 'empmanage:holiday:apply', '2018-04-07 20:30:06', '1001', '2018-04-07 20:30:10', '1001');
INSERT INTO `sys_permission` VALUES ('9', '5', '岗位调度', '/emp/adjustment', '1', 'empmanage:adjustment', '2018-04-07 20:31:14', '1001', '2018-04-07 20:31:18', '1001');
INSERT INTO `sys_permission` VALUES ('10', '5', '培训管理', '/emp/train', '1', 'empmanage:train', '2018-04-07 20:32:01', '1001', '2018-04-07 20:32:05', '1001');
INSERT INTO `sys_permission` VALUES ('11', '0', '工资管理', null, '1', 'salary', '2018-04-07 20:32:52', '1001', '2018-04-07 20:32:55', '1001');
INSERT INTO `sys_permission` VALUES ('12', '11', '基本工资', '/salary/base', '1', 'salary:base', '2018-04-07 20:33:40', '1001', '2018-04-07 20:33:44', '1001');
INSERT INTO `sys_permission` VALUES ('13', '11', '奖金', '/salary/bonus', '1', 'salary:bonus', '2018-04-07 20:34:23', '1001', '2018-04-07 20:34:27', '1001');
INSERT INTO `sys_permission` VALUES ('14', '11', '考勤', '/salary/attendance', '1', 'salary:attendance', '2018-04-07 20:35:29', '1001', '2018-04-07 20:35:33', '1001');
INSERT INTO `sys_permission` VALUES ('15', '0', '数据分析', null, '0', 'analyze', '2018-04-07 20:36:28', '1001', '2018-04-07 20:36:32', '1001');
INSERT INTO `sys_permission` VALUES ('16', '15', '入职率、离职率', '/analyze/probability', '1', 'analyze:probability', '2018-04-07 20:37:28', '1001', '2018-04-07 20:37:31', '1001');
INSERT INTO `sys_permission` VALUES ('17', '15', '平均值', '/analyze/average', '1', 'analyze:average', '2018-04-07 20:38:19', '1001', '2018-04-07 20:38:23', '1001');
INSERT INTO `sys_permission` VALUES ('18', '0', '部门管理', null, '2', 'department', '2018-04-07 20:39:10', '1001', '2018-04-07 20:39:13', '1001');
INSERT INTO `sys_permission` VALUES ('19', '18', '部门信息', '/department/detail', '2', 'department:detail', '2018-04-07 20:39:57', '1001', '2018-04-07 20:40:01', '1001');
INSERT INTO `sys_permission` VALUES ('20', '18', '部门调整', '/department/adjustment', '2', 'department:adjustment', '2018-04-07 20:41:13', '1001', '2018-04-07 20:41:16', '1001');
INSERT INTO `sys_permission` VALUES ('21', '0', '考勤查看', '/salary/attendance/view', '1', 'salary:attendance:view', '2018-04-07 20:42:34', '1001', '2018-04-07 20:42:38', '1001');
INSERT INTO `sys_permission` VALUES ('22', '0', '工资查看', '/salary/view', '1', 'salary:view', '2018-04-07 20:43:50', '1001', '2018-04-07 20:43:53', '1001');
INSERT INTO `sys_permission` VALUES ('23', '0', '信息查看', '/emp/view', '1', 'empmanage:view', '2018-04-07 20:45:21', '1001', '2018-04-07 20:45:25', '1001');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '2018-04-07 20:47:50', '1001', '2018-04-07 20:47:54', '1001');
INSERT INTO `sys_role` VALUES ('2', '员工', '2018-04-07 20:48:13', '1001', '2018-04-07 20:48:17', '1001');
INSERT INTO `sys_role` VALUES ('3', '经理', '2018-04-07 20:48:28', '1001', '2018-04-07 20:48:32', '1001');

-- ----------------------------
-- Table structure for sys_role_emp
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_emp`;
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

-- ----------------------------
-- Records of sys_role_emp
-- ----------------------------
INSERT INTO `sys_role_emp` VALUES ('1', '1', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('2', '2', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('3', '3', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('4', '4', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('5', '5', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('6', '6', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('7', '7', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('8', '8', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('9', '9', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('10', '10', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('11', '11', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('12', '12', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('13', '13', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('14', '14', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('15', '15', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('16', '16', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('17', '17', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('18', '18', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('19', '19', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('20', '20', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('21', '21', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('22', '22', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('23', '23', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('24', '24', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('25', '25', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('26', '26', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('27', '27', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');
INSERT INTO `sys_role_emp` VALUES ('28', '28', '1', '2018-04-07 21:09:37', '1001', '2018-04-07 21:09:37', '1001');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限ID',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='角色-权限表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('2', '1', '2', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('3', '1', '3', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('4', '1', '4', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('5', '1', '5', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('6', '1', '6', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('7', '1', '7', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('8', '1', '9', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('9', '1', '10', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('10', '1', '11', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('11', '1', '12', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('12', '1', '13', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('13', '1', '14', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('14', '1', '15', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('15', '1', '16', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('16', '1', '17', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('17', '1', '18', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('18', '1', '19', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('19', '1', '20', '2018-04-07 20:56:08', '1001', '2018-04-07 20:56:08', '1001');
INSERT INTO `sys_role_permission` VALUES ('20', '2', '8', '2018-04-07 20:58:27', '1001', '2018-04-07 20:58:35', '1001');
INSERT INTO `sys_role_permission` VALUES ('21', '2', '21', '2018-04-07 20:58:30', '1001', '2018-04-07 20:58:40', '1001');
INSERT INTO `sys_role_permission` VALUES ('22', '2', '22', '2018-04-07 20:58:44', '1001', '2018-04-07 20:58:49', '1001');
INSERT INTO `sys_role_permission` VALUES ('23', '2', '23', '2018-04-07 20:58:47', '1001', '2018-04-07 20:58:52', '1001');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
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

-- ----------------------------
-- Records of train
-- ----------------------------

-- ----------------------------
-- Table structure for train_emp
-- ----------------------------
DROP TABLE IF EXISTS `train_emp`;
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

-- ----------------------------
-- Records of train_emp
-- ----------------------------

-- ----------------------------
-- Table structure for vacate
-- ----------------------------
DROP TABLE IF EXISTS `vacate`;
CREATE TABLE `vacate` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(300) DEFAULT NULL COMMENT '请假内容',
  `emp_id` bigint(11) DEFAULT NULL COMMENT '请假者',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `up_time` datetime DEFAULT NULL COMMENT '提交时间',
  `deal_time` datetime DEFAULT NULL COMMENT '处理时间',
  `status` char(2) DEFAULT NULL COMMENT '申请状态',
  `approve_id` bigint(11) DEFAULT NULL COMMENT '审批人',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假表';

-- ----------------------------
-- Records of vacate
-- ----------------------------
