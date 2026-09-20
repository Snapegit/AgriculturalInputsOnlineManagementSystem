-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl84235399
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `cl84235399`
--

/*!40000 DROP DATABASE IF EXISTS `cl84235399`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl84235399` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl84235399`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `name` varchar(200) DEFAULT NULL COMMENT '收货人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `isdefault` varchar(200) DEFAULT NULL COMMENT '是否默认地址',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'2024-04-26 14:38:15','地址1','张三','19819881111','是',11),(2,'2024-04-26 14:38:15','地址2','李四','19819882222','是',12),(3,'2024-04-26 14:38:15','地址3','王五','19819883333','是',13),(4,'2024-04-26 14:38:15','地址4','赵六','19819884444','是',14),(5,'2024-04-26 14:38:15','地址5','孙七','19819885555','是',15),(6,'2024-04-26 14:38:15','地址6','周八','19819886666','是',16);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) DEFAULT NULL COMMENT '商品表名',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `buynumber` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `discountprice` double DEFAULT NULL COMMENT '折扣价',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `qiyezhanghao` varchar(200) DEFAULT NULL COMMENT '商户名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussnongyezixun`
--

DROP TABLE IF EXISTS `discussnongyezixun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussnongyezixun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='农业资讯评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussnongyezixun`
--

LOCK TABLES `discussnongyezixun` WRITE;
/*!40000 ALTER TABLE `discussnongyezixun` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussnongyezixun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussnongziqiye`
--

DROP TABLE IF EXISTS `discussnongziqiye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussnongziqiye` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='农资企业评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussnongziqiye`
--

LOCK TABLES `discussnongziqiye` WRITE;
/*!40000 ALTER TABLE `discussnongziqiye` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussnongziqiye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussshengzishangpin`
--

DROP TABLE IF EXISTS `discussshengzishangpin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussshengzishangpin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生资商品评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussshengzishangpin`
--

LOCK TABLES `discussshengzishangpin` WRITE;
/*!40000 ALTER TABLE `discussshengzishangpin` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussshengzishangpin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fapiaoxinxi`
--

DROP TABLE IF EXISTS `fapiaoxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fapiaoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fapiaohaoma` varchar(200) DEFAULT NULL COMMENT '发票号码',
  `kaipiaoriqi` date DEFAULT NULL COMMENT '开票日期',
  `nongminzhanghao` varchar(200) DEFAULT NULL COMMENT '购买账号',
  `nongminxingming` varchar(200) DEFAULT NULL COMMENT '开票名称',
  `shangpinmingcheng` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `hanshuidanjia` double DEFAULT NULL COMMENT '含税单价',
  `shuilv` varchar(200) DEFAULT NULL COMMENT '税率',
  `kaipiaojine` double DEFAULT NULL COMMENT '开票金额',
  `qiyezhanghao` varchar(200) DEFAULT NULL COMMENT '企业账号',
  `kaipiaoqiyemingcheng` varchar(200) DEFAULT NULL COMMENT '开票企业名称',
  `beizhu` longtext COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fapiaohaoma` (`fapiaohaoma`)
) ENGINE=InnoDB AUTO_INCREMENT=1714143654085 DEFAULT CHARSET=utf8 COMMENT='发票信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fapiaoxinxi`
--

LOCK TABLES `fapiaoxinxi` WRITE;
/*!40000 ALTER TABLE `fapiaoxinxi` DISABLE KEYS */;
INSERT INTO `fapiaoxinxi` VALUES (91,'2024-04-26 14:38:15','1111111111','2024-04-26','购买账号1','开票名称1','商品名称1',1,1,'税率1',1,'企业账号1','开票企业名称1','备注1'),(92,'2024-04-26 14:38:15','2222222222','2024-04-26','购买账号2','开票名称2','商品名称2',2,2,'税率2',2,'企业账号2','开票企业名称2','备注2'),(93,'2024-04-26 14:38:15','3333333333','2024-04-26','购买账号3','开票名称3','商品名称3',3,3,'税率3',3,'企业账号3','开票企业名称3','备注3'),(94,'2024-04-26 14:38:15','4444444444','2024-04-26','购买账号4','开票名称4','商品名称4',4,4,'税率4',4,'企业账号4','开票企业名称4','备注4'),(95,'2024-04-26 14:38:15','5555555555','2024-04-26','购买账号5','开票名称5','商品名称5',5,5,'税率5',5,'企业账号5','开票企业名称5','备注5'),(96,'2024-04-26 14:38:15','6666666666','2024-04-26','购买账号6','开票名称6','商品名称6',6,6,'税率6',6,'企业账号6','开票企业名称6','备注6'),(1714143654084,'2024-04-26 15:00:53','1714143567591','2024-04-26','农民账号1','农民姓名1','111',1,36,'3%',36,'企业账号1','企业名称1','111111');
/*!40000 ALTER TABLE `fapiaoxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fenlei`
--

DROP TABLE IF EXISTS `fenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fenlei` varchar(200) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fenlei`
--

LOCK TABLES `fenlei` WRITE;
/*!40000 ALTER TABLE `fenlei` DISABLE KEYS */;
INSERT INTO `fenlei` VALUES (51,'2024-04-26 14:38:14','分类1'),(52,'2024-04-26 14:38:14','分类2'),(53,'2024-04-26 14:38:14','分类3'),(54,'2024-04-26 14:38:14','分类4'),(55,'2024-04-26 14:38:14','分类5'),(56,'2024-04-26 14:38:14','分类6');
/*!40000 ALTER TABLE `fenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-04-26 14:38:15','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common25\",\"menu\":\"轮播图管理\",\"unicode\":\"&#xee09;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"}],\"fontClass\":\"icon-common19\",\"menu\":\"管理员管理\",\"unicode\":\"&#xee00;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"农民\",\"menuJump\":\"列表\",\"tableName\":\"nongmin\"}],\"fontClass\":\"icon-user4\",\"menu\":\"农民管理\",\"unicode\":\"&#xef9a;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"查看评论\"],\"menu\":\"农资企业\",\"menuJump\":\"列表\",\"tableName\":\"nongziqiye\"}],\"fontClass\":\"icon-common2\",\"menu\":\"农资企业\",\"unicode\":\"&#xeda4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"农业资讯\",\"menuJump\":\"列表\",\"tableName\":\"nongyezixun\"}],\"fontClass\":\"icon-common20\",\"menu\":\"农业资讯管理\",\"unicode\":\"&#xee02;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"回复\",\"删除\"],\"menu\":\"留言板\",\"menuJump\":\"列表\",\"tableName\":\"messages\"}],\"fontClass\":\"icon-common14\",\"menu\":\"留言板管理\",\"unicode\":\"&#xedfb;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"用户反馈\",\"menuJump\":\"列表\",\"tableName\":\"yonghufankui\"}],\"fontClass\":\"icon-common33\",\"menu\":\"用户反馈管理\",\"unicode\":\"&#xee6a;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common1\",\"menu\":\"农资企业\",\"menuJump\":\"列表\",\"tableName\":\"nongziqiye\",\"unicode\":\"&#xeda3;\"}],\"fontClass\":\"icon-common1\",\"menu\":\"农资企业\",\"unicode\":\"&#xeda3;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common44\",\"menu\":\"生资商品\",\"menuJump\":\"列表\",\"tableName\":\"shengzishangpin\",\"unicode\":\"&#xef28;\"}],\"fontClass\":\"icon-common44\",\"menu\":\"生资商品\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-chat--fill2\",\"menu\":\"农业资讯\",\"menuJump\":\"列表\",\"tableName\":\"nongyezixun\",\"unicode\":\"&#xedde;\"}],\"fontClass\":\"icon-chat--fill2\",\"menu\":\"生态农业资讯\",\"unicode\":\"&#xedde;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"留言板\",\"menuJump\":\"列表\",\"tableName\":\"messages\"}],\"menu\":\"留言板管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"购物车\",\"menuJump\":\"列表\",\"tableName\":\"cart\"}],\"menu\":\"购物车管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\"],\"menu\":\"发票信息\",\"menuJump\":\"列表\",\"tableName\":\"fapiaoxinxi\"}],\"fontClass\":\"icon-common4\",\"menu\":\"发票信息管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-vipcard\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户反馈\",\"menuJump\":\"列表\",\"tableName\":\"yonghufankui\"}],\"fontClass\":\"icon-common33\",\"menu\":\"用户反馈管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"确认收货\",\"物流\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"物流\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\"],\"menu\":\"商品订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"}],\"menu\":\"订单管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common11\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xeded;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"地址\",\"menuJump\":\"列表\",\"tableName\":\"address\"}],\"fontClass\":\"icon-common41\",\"menu\":\"地址管理\",\"unicode\":\"&#xeede;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common1\",\"menu\":\"农资企业\",\"menuJump\":\"列表\",\"tableName\":\"nongziqiye\",\"unicode\":\"&#xeda3;\"}],\"fontClass\":\"icon-common1\",\"menu\":\"农资企业\",\"unicode\":\"&#xeda3;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common44\",\"menu\":\"生资商品\",\"menuJump\":\"列表\",\"tableName\":\"shengzishangpin\",\"unicode\":\"&#xef28;\"}],\"fontClass\":\"icon-common44\",\"menu\":\"生资商品\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-chat--fill2\",\"menu\":\"农业资讯\",\"menuJump\":\"列表\",\"tableName\":\"nongyezixun\",\"unicode\":\"&#xedde;\"}],\"fontClass\":\"icon-chat--fill2\",\"menu\":\"生态农业资讯\",\"unicode\":\"&#xedde;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"留言板\",\"menuJump\":\"列表\",\"tableName\":\"messages\"}],\"menu\":\"留言板管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"购物车\",\"menuJump\":\"列表\",\"tableName\":\"cart\"}],\"menu\":\"购物车管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"农民\",\"tableName\":\"nongmin\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"查看\",\"修改\",\"查看评论\"],\"menu\":\"农资企业\",\"menuJump\":\"列表\",\"tableName\":\"nongziqiye\"}],\"fontClass\":\"icon-common2\",\"menu\":\"农资企业\",\"unicode\":\"&#xeda4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"分类\",\"menuJump\":\"列表\",\"tableName\":\"fenlei\"}],\"fontClass\":\"icon-common26\",\"menu\":\"分类管理\",\"unicode\":\"&#xee2b;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"生资商品\",\"menuJump\":\"列表\",\"tableName\":\"shengzishangpin\"}],\"fontClass\":\"icon-common27\",\"menu\":\"生资商品管理\",\"unicode\":\"&#xee2c;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"发票信息\",\"menuJump\":\"列表\",\"tableName\":\"fapiaoxinxi\"}],\"fontClass\":\"icon-common4\",\"menu\":\"发票信息管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"月营业额\",\"商品销量\",\"首页总数\",\"首页统计\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"月营业额\",\"商品销量\",\"首页总数\",\"首页统计\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"月营业额\",\"商品销量\",\"首页总数\",\"首页统计\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"月营业额\",\"商品销量\",\"首页总数\",\"首页统计\",\"发货\",\"物流\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"月营业额\",\"商品销量\",\"首页总数\",\"首页统计\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"月营业额\",\"商品销量\",\"首页总数\",\"首页统计\"],\"menu\":\"商品订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"月营业额\",\"商品销量\",\"首页总数\",\"首页统计\",\"物流\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"}],\"menu\":\"订单管理\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common1\",\"menu\":\"农资企业\",\"menuJump\":\"列表\",\"tableName\":\"nongziqiye\",\"unicode\":\"&#xeda3;\"}],\"fontClass\":\"icon-common1\",\"menu\":\"农资企业\",\"unicode\":\"&#xeda3;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-common44\",\"menu\":\"生资商品\",\"menuJump\":\"列表\",\"tableName\":\"shengzishangpin\",\"unicode\":\"&#xef28;\"}],\"fontClass\":\"icon-common44\",\"menu\":\"生资商品\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"查看评论\"],\"fontClass\":\"icon-chat--fill2\",\"menu\":\"农业资讯\",\"menuJump\":\"列表\",\"tableName\":\"nongyezixun\",\"unicode\":\"&#xedde;\"}],\"fontClass\":\"icon-chat--fill2\",\"menu\":\"生态农业资讯\",\"unicode\":\"&#xedde;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"留言板\",\"menuJump\":\"列表\",\"tableName\":\"messages\"}],\"menu\":\"留言板管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"购物车\",\"menuJump\":\"列表\",\"tableName\":\"cart\"}],\"menu\":\"购物车管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"农资企业\",\"tableName\":\"nongziqiye\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '留言人id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext COMMENT '头像',
  `content` longtext NOT NULL COMMENT '留言内容',
  `cpicture` longtext COMMENT '留言图片',
  `reply` longtext COMMENT '回复内容',
  `rpicture` longtext COMMENT '回复图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='留言板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (101,'2024-04-26 14:38:15',1,'用户名1','file/messagesAvatarurl1.jpg','留言内容1','file/messagesCpicture1.jpg','回复内容1','file/messagesRpicture1.jpg'),(102,'2024-04-26 14:38:15',2,'用户名2','file/messagesAvatarurl2.jpg','留言内容2','file/messagesCpicture2.jpg','回复内容2','file/messagesRpicture2.jpg'),(103,'2024-04-26 14:38:15',3,'用户名3','file/messagesAvatarurl3.jpg','留言内容3','file/messagesCpicture3.jpg','回复内容3','file/messagesRpicture3.jpg'),(104,'2024-04-26 14:38:15',4,'用户名4','file/messagesAvatarurl4.jpg','留言内容4','file/messagesCpicture4.jpg','回复内容4','file/messagesRpicture4.jpg'),(105,'2024-04-26 14:38:15',5,'用户名5','file/messagesAvatarurl5.jpg','留言内容5','file/messagesCpicture5.jpg','回复内容5','file/messagesRpicture5.jpg'),(106,'2024-04-26 14:38:15',6,'用户名6','file/messagesAvatarurl6.jpg','留言内容6','file/messagesCpicture6.jpg','回复内容6','file/messagesRpicture6.jpg');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nongmin`
--

DROP TABLE IF EXISTS `nongmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nongmin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `nongminzhanghao` varchar(200) DEFAULT NULL COMMENT '农民账号',
  `mima` varchar(200) DEFAULT NULL COMMENT '密码',
  `nongminxingming` varchar(200) DEFAULT NULL COMMENT '农民姓名',
  `jiatingzhuzhi` varchar(200) DEFAULT NULL COMMENT '家庭住址',
  `lianxifangshi` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `dikuaimingcheng` varchar(200) DEFAULT NULL COMMENT '地块名称',
  `dikuaileixing` varchar(200) DEFAULT NULL COMMENT '地块类型',
  `tudimianji` varchar(200) DEFAULT NULL COMMENT '土地面积',
  `touxiang` longtext COMMENT '头像',
  `money` double DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nongminzhanghao` (`nongminzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='农民';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nongmin`
--

LOCK TABLES `nongmin` WRITE;
/*!40000 ALTER TABLE `nongmin` DISABLE KEYS */;
INSERT INTO `nongmin` VALUES (11,'2024-04-26 14:38:14','农民账号1','e10adc3949ba59abbe56e057f20f883e','农民姓名1','家庭住址1','联系方式1','地块名称1','大田','土地面积1','file/nongminTouxiang1.jpg',200),(12,'2024-04-26 14:38:14','农民账号2','e10adc3949ba59abbe56e057f20f883e','农民姓名2','家庭住址2','联系方式2','地块名称2','大田','土地面积2','file/nongminTouxiang2.jpg',200),(13,'2024-04-26 14:38:14','农民账号3','e10adc3949ba59abbe56e057f20f883e','农民姓名3','家庭住址3','联系方式3','地块名称3','大田','土地面积3','file/nongminTouxiang3.jpg',200),(14,'2024-04-26 14:38:14','农民账号4','e10adc3949ba59abbe56e057f20f883e','农民姓名4','家庭住址4','联系方式4','地块名称4','大田','土地面积4','file/nongminTouxiang4.jpg',200),(15,'2024-04-26 14:38:14','农民账号5','e10adc3949ba59abbe56e057f20f883e','农民姓名5','家庭住址5','联系方式5','地块名称5','大田','土地面积5','file/nongminTouxiang5.jpg',200),(16,'2024-04-26 14:38:14','农民账号6','e10adc3949ba59abbe56e057f20f883e','农民姓名6','家庭住址6','联系方式6','地块名称6','大田','土地面积6','file/nongminTouxiang6.jpg',200);
/*!40000 ALTER TABLE `nongmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nongyezixun`
--

DROP TABLE IF EXISTS `nongyezixun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nongyezixun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `wenzhangbiaoti` varchar(200) NOT NULL COMMENT '文章标题',
  `wenzhangjianjie` longtext COMMENT '文章简介',
  `tupian` longtext NOT NULL COMMENT '图片',
  `wenzhangneirong` longtext NOT NULL COMMENT '文章内容',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='农业资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nongyezixun`
--

LOCK TABLES `nongyezixun` WRITE;
/*!40000 ALTER TABLE `nongyezixun` DISABLE KEYS */;
INSERT INTO `nongyezixun` VALUES (71,'2024-04-26 14:38:15','文章标题1','文章简介1','file/nongyezixunTupian1.jpg,file/nongyezixunTupian2.jpg,file/nongyezixunTupian3.jpg','文章内容1',1),(72,'2024-04-26 14:38:15','文章标题2','文章简介2','file/nongyezixunTupian2.jpg,file/nongyezixunTupian3.jpg,file/nongyezixunTupian4.jpg','文章内容2',2),(73,'2024-04-26 14:38:15','文章标题3','文章简介3','file/nongyezixunTupian3.jpg,file/nongyezixunTupian4.jpg,file/nongyezixunTupian5.jpg','文章内容3',3),(74,'2024-04-26 14:38:15','文章标题4','文章简介4','file/nongyezixunTupian4.jpg,file/nongyezixunTupian5.jpg,file/nongyezixunTupian6.jpg','文章内容4',4),(75,'2024-04-26 14:38:15','文章标题5','文章简介5','file/nongyezixunTupian5.jpg,file/nongyezixunTupian6.jpg,file/nongyezixunTupian7.jpg','文章内容5',5),(76,'2024-04-26 14:38:15','文章标题6','文章简介6','file/nongyezixunTupian6.jpg,file/nongyezixunTupian7.jpg,file/nongyezixunTupian8.jpg','文章内容6',6);
/*!40000 ALTER TABLE `nongyezixun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nongziqiye`
--

DROP TABLE IF EXISTS `nongziqiye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nongziqiye` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qiyezhanghao` varchar(200) NOT NULL COMMENT '企业账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `qiyemingcheng` varchar(200) NOT NULL COMMENT '企业名称',
  `qiyezhaopian` longtext COMMENT '企业照片',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `zhizhaojingyingxukezheng` longtext COMMENT '执照经营许可证',
  `lianxifangshi` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `qiyejianjie` longtext COMMENT '企业简介',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qiyezhanghao` (`qiyezhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='农资企业';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nongziqiye`
--

LOCK TABLES `nongziqiye` WRITE;
/*!40000 ALTER TABLE `nongziqiye` DISABLE KEYS */;
INSERT INTO `nongziqiye` VALUES (21,'2024-04-26 14:38:14','企业账号1','e10adc3949ba59abbe56e057f20f883e','企业名称1','file/nongziqiyeQiyezhaopian1.jpg','地址1','','19819881111','企业简介1','是',''),(22,'2024-04-26 14:38:14','企业账号2','e10adc3949ba59abbe56e057f20f883e','企业名称2','file/nongziqiyeQiyezhaopian2.jpg','地址2','','19819881112','企业简介2','是',''),(23,'2024-04-26 14:38:14','企业账号3','e10adc3949ba59abbe56e057f20f883e','企业名称3','file/nongziqiyeQiyezhaopian3.jpg','地址3','','19819881113','企业简介3','是',''),(24,'2024-04-26 14:38:14','企业账号4','e10adc3949ba59abbe56e057f20f883e','企业名称4','file/nongziqiyeQiyezhaopian4.jpg','地址4','','19819881114','企业简介4','是',''),(25,'2024-04-26 14:38:14','企业账号5','e10adc3949ba59abbe56e057f20f883e','企业名称5','file/nongziqiyeQiyezhaopian5.jpg','地址5','','19819881115','企业简介5','是',''),(26,'2024-04-26 14:38:14','企业账号6','e10adc3949ba59abbe56e057f20f883e','企业名称6','file/nongziqiyeQiyezhaopian6.jpg','地址6','','19819881116','企业简介6','是','');
/*!40000 ALTER TABLE `nongziqiye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) DEFAULT NULL COMMENT '商品表名',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `buynumber` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `discountprice` double DEFAULT NULL COMMENT '折扣价',
  `total` double DEFAULT NULL COMMENT '总价',
  `discounttotal` double DEFAULT NULL COMMENT '折扣总价格',
  `type` varchar(200) DEFAULT NULL COMMENT '支付类型',
  `status` varchar(200) DEFAULT NULL COMMENT '订单状态',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) DEFAULT NULL COMMENT '收货人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `logistics` longtext COMMENT '物流',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `qiyezhanghao` varchar(200) DEFAULT NULL COMMENT '商户名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shengzishangpin`
--

DROP TABLE IF EXISTS `shengzishangpin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shengzishangpin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinmingcheng` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `tupian` longtext COMMENT '图片',
  `fenlei` varchar(200) DEFAULT NULL COMMENT '分类',
  `guige` varchar(200) DEFAULT NULL COMMENT '规格',
  `canshu` longtext COMMENT '参数',
  `shangpinxiangqing` longtext COMMENT '商品详情',
  `qiyezhanghao` varchar(200) DEFAULT NULL COMMENT '企业账号',
  `qiyemingcheng` varchar(200) DEFAULT NULL COMMENT '企业名称',
  `onelimittimes` int(11) DEFAULT NULL COMMENT '单限',
  `alllimittimes` int(11) DEFAULT NULL COMMENT '库存',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  `price` double DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='生资商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shengzishangpin`
--

LOCK TABLES `shengzishangpin` WRITE;
/*!40000 ALTER TABLE `shengzishangpin` DISABLE KEYS */;
INSERT INTO `shengzishangpin` VALUES (61,'2024-04-26 14:38:14','商品名称1','file/shengzishangpinTupian1.jpg,file/shengzishangpinTupian2.jpg,file/shengzishangpinTupian3.jpg','分类1','规格1','参数1','商品详情1','企业账号1','企业名称1',1,99,1,99.9),(62,'2024-04-26 14:38:14','商品名称2','file/shengzishangpinTupian2.jpg,file/shengzishangpinTupian3.jpg,file/shengzishangpinTupian4.jpg','分类2','规格2','参数2','商品详情2','企业账号2','企业名称2',2,99,2,99.9),(63,'2024-04-26 14:38:14','商品名称3','file/shengzishangpinTupian3.jpg,file/shengzishangpinTupian4.jpg,file/shengzishangpinTupian5.jpg','分类3','规格3','参数3','商品详情3','企业账号3','企业名称3',3,99,3,99.9),(64,'2024-04-26 14:38:14','商品名称4','file/shengzishangpinTupian4.jpg,file/shengzishangpinTupian5.jpg,file/shengzishangpinTupian6.jpg','分类4','规格4','参数4','商品详情4','企业账号4','企业名称4',4,99,4,99.9),(65,'2024-04-26 14:38:14','商品名称5','file/shengzishangpinTupian5.jpg,file/shengzishangpinTupian6.jpg,file/shengzishangpinTupian7.jpg','分类5','规格5','参数5','商品详情5','企业账号5','企业名称5',5,99,5,99.9),(66,'2024-04-26 14:38:14','商品名称6','file/shengzishangpinTupian6.jpg,file/shengzishangpinTupian7.jpg,file/shengzishangpinTupian8.jpg','分类6','规格6','参数6','商品详情6','企业账号6','企业名称6',6,99,6,99.9);
/*!40000 ALTER TABLE `shengzishangpin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT NULL COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,21,'企业账号1','nongziqiye','农资企业','bducxsb36ein5r2uljnbq9igpvbmldhq','2024-04-26 15:00:30','2024-04-26 16:00:31'),(2,11,'农民账号1','nongmin','农民','84er2rej04z4yfeajucqkp020dkm9c56','2024-04-26 15:01:14','2024-04-26 16:01:14');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-04-26 14:38:15','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghufankui`
--

DROP TABLE IF EXISTS `yonghufankui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghufankui` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `fankuineirong` longtext COMMENT '反馈内容',
  `fankuishijian` date DEFAULT NULL COMMENT '反馈时间',
  `nongminzhanghao` varchar(200) DEFAULT NULL COMMENT '农民账号',
  `nongminxingming` varchar(200) DEFAULT NULL COMMENT '农民姓名',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='用户反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghufankui`
--

LOCK TABLES `yonghufankui` WRITE;
/*!40000 ALTER TABLE `yonghufankui` DISABLE KEYS */;
INSERT INTO `yonghufankui` VALUES (111,'2024-04-26 14:38:15','标题1','反馈内容1','2024-04-26','农民账号1','农民姓名1',''),(112,'2024-04-26 14:38:15','标题2','反馈内容2','2024-04-26','农民账号2','农民姓名2',''),(113,'2024-04-26 14:38:15','标题3','反馈内容3','2024-04-26','农民账号3','农民姓名3',''),(114,'2024-04-26 14:38:15','标题4','反馈内容4','2024-04-26','农民账号4','农民姓名4',''),(115,'2024-04-26 14:38:15','标题5','反馈内容5','2024-04-26','农民账号5','农民姓名5',''),(116,'2024-04-26 14:38:15','标题6','反馈内容6','2024-04-26','农民账号6','农民姓名6','');
/*!40000 ALTER TABLE `yonghufankui` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-27 18:45:10
