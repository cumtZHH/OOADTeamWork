/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : 172.20.3.92:3306
Source Database       : pols

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-09-12 14:24:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `receiverName` varchar(50) NOT NULL,
  `receiverTel` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `addressInfo` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `addressState` int(11) NOT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '宋大宝', '17799887689', '1', '湖南长沙市天心区', '', '0');
INSERT INTO `address` VALUES ('2', '阮仁照', '18895627238', '2', '安徽合肥市长丰县岗集镇龙岗村', '231137', '1');
INSERT INTO `address` VALUES ('3', '二狗子', '13813813838', '2', '四川攀枝花市仁和区随了个便', '000000', '0');
INSERT INTO `address` VALUES ('4', '张全蛋', '13815817838', '2', '广西梧州市长洲区起个啥呢', '000000', '0');
INSERT INTO `address` VALUES ('5', '杨小伟', '13813813838', '2', '云南丽江市玉龙纳西族自治县玉龙雪山附近', '000000', '1');
INSERT INTO `address` VALUES ('6', '葫芦娃', '13813813898', '2', '安徽合肥市庐阳区德园', '000000', '0');
INSERT INTO `address` VALUES ('7', '吾名美女', '15915915959', '3', '西藏拉萨市当雄县给力哇', '000000', '0');
INSERT INTO `address` VALUES ('8', '宋大宝', '17799887689', '1', '安徽合肥北城世纪城', '231134', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `phoneId` int(11) NOT NULL,
  `commentContent` varchar(500) NOT NULL,
  `commentTime` datetime NOT NULL,
  `commentState` int(11) DEFAULT '0',
  `commentLevel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `fk_comment_userId` (`userId`),
  KEY `fk_comment_phoneId` (`phoneId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2', '4', '手机真心不错，满意，五星好评呀\r\n						      	', '2017-02-19 15:15:25', '0', '五星');
INSERT INTO `comment` VALUES ('2', '3', '54', '说好的假一赔十，我竟然真的收到了11个假手机，一星都不想给了\r\n						      	', '2017-02-19 16:08:19', '0', '一星');
INSERT INTO `comment` VALUES ('3', '1', '16', '总体还是很满意的，给好评喔    	', '2017-02-19 16:11:52', '0', '五星');

-- ----------------------------
-- Table structure for level
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `levelId` int(11) NOT NULL AUTO_INCREMENT,
  `levelName` varchar(20) NOT NULL,
  `levelDesc` varchar(20) DEFAULT NULL,
  `discount` double NOT NULL,
  `levelState` int(11) DEFAULT NULL,
  PRIMARY KEY (`levelId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES ('1', '英勇黄铜', '英勇黄铜', '1', '0');
INSERT INTO `level` VALUES ('2', '不屈白银', '不屈白银', '0.98', '0');
INSERT INTO `level` VALUES ('3', '荣耀黄金', '荣耀黄金', '0.88', '0');
INSERT INTO `level` VALUES ('4', '华贵铂金', '华贵铂金', '0.86', '0');
INSERT INTO `level` VALUES ('5', '璀璨钻石', '璀璨钻石', '0.84', '0');
INSERT INTO `level` VALUES ('6', '超凡大师', '超凡大师', '0.82', '0');
INSERT INTO `level` VALUES ('7', '最强王者', '最强王者', '0.8', '0');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `managerId` int(11) NOT NULL,
  `ipAddress` varchar(20) NOT NULL,
  `message` varchar(20) NOT NULL,
  `logTime` datetime NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1', '61.177.151.70', 'rrz登入系统', '2017-02-19 14:30:37');
INSERT INTO `log` VALUES ('2', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-02-19 15:31:00');
INSERT INTO `log` VALUES ('3', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-02-19 16:25:53');
INSERT INTO `log` VALUES ('4', '1', '0:0:0:0:0:0:0:1', 'rrz退出系统', '2017-02-19 16:31:06');
INSERT INTO `log` VALUES ('5', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-09-07 09:20:13');
INSERT INTO `log` VALUES ('6', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-09-07 11:41:05');
INSERT INTO `log` VALUES ('7', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-09-07 12:27:24');
INSERT INTO `log` VALUES ('8', '1', '0:0:0:0:0:0:0:1', 'rrz退出系统', '2017-09-07 12:28:45');
INSERT INTO `log` VALUES ('9', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-09-07 12:30:36');
INSERT INTO `log` VALUES ('10', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-09-07 14:56:06');
INSERT INTO `log` VALUES ('11', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-09-07 15:06:19');
INSERT INTO `log` VALUES ('12', '1', '0:0:0:0:0:0:0:1', 'rrz登入系统', '2017-09-12 13:10:36');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) NOT NULL,
  `loginPass` varchar(32) NOT NULL,
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'rrz', 'C4CA4238A0B923820DCC509A6F75849B');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `newsContent` varchar(500) NOT NULL,
  `newsTime` datetime NOT NULL,
  `newsState` int(11) NOT NULL,
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '华为Mate 9深度拆解', '从华为的产品线来看，在高端市场一直秉持着双旗舰策略，Mate系列和P系列，而Mate系列更是旗舰中的旗舰。11月14日，华为在上海举行盛大的新品发布会，正式面向国内市场发布旗下大屏旗舰产品华为Mate 9、Mate 9 Pro以及Mate 9 Porsche Design。其中Mate 9 Pro和Mate 9 Porsche Design采用正反双曲面设计，屏幕为5.5英寸+2K，指纹键配备在正面，Mate 9则为5.9英寸，取消了曲面设计，指纹仍在背部。', '2016-10-12 12:21:23', '0');
INSERT INTO `news` VALUES ('2', '华为Nova高配版全网通评测', '华为nova采用了弧形、曲面设计，开创了弧形时尚的全新风格。华为nova搭载14nm工艺的高通骁龙625处理器，4GB+64GB存储器，标配3020mAh高密度电池，1080P高清LTPS屏，支持双卡双待全网通，配备前置500万像素+后置1200万像素摄像头，支持美妆2.0和美颜3.0，堪称新一代自拍神器。', '2016-10-20 12:21:23', '0');
INSERT INTO `news` VALUES ('3', '魅族PRO 6 Plus发布', '魅族科技今日在北京演艺中心召开又一次的新品发布会，推出魅蓝X以及Flyme 6新系统，并且终于在年底之前推出此前呼声一直很高、众望所归的搭载Exynos 8890处理器的魅族PRO 6 Plus，定位“为人们带来需要手机性能与颜值俱佳的高性能高颜值大屏产品”。', '2016-11-03 12:21:23', '0');
INSERT INTO `news` VALUES ('4', '2017年智能手机十大趋势', '智能手机用户在2017年有很多值得期待的东西，新的设备不仅更薄、更快，甚至会比你想象的更加智能。\r\n虚拟现实功能将走进低价智能手机，它们将配备更好的画质、分辨率更高的屏幕和更大的存储空间。在购买商品和登录网站时，你将比以往更多地用到自己的智能手机。\r\n深度学习可以帮助智能手机了解用户行为，改进使用体验。我们甚至会看到智能手机的设计领域出现一场“文艺复兴”，越来越多的手机将用无线耳机取代耳机插口。USB-C将取代传统的连接器和充电线。', '2016-11-27 12:21:23', '0');
INSERT INTO `news` VALUES ('5', '小米Note 2 双曲面商务旗舰', '这依然是小米最快的安卓旗舰*！骁龙821 性能版，高性能下再提速 10%。可选 6GB +128GB 高速内存、闪存，进一步提升性能。4070mAh 电池、高精度定位、HD 高清音质，小米Note 2 不仅更快，更是方方面面全高端配置。', '2017-12-08 12:21:23', '0');
INSERT INTO `news` VALUES ('6', '三星C9 Pro手机墨玉黑版本曝光', ' 自9月iPhone7发售以来，新增加的亮黑配色可以说是备受广大消费者青睐，在这股消费欲望的刺激下，手机行业可以说是掀起了一股黑色潮流。而现在，根据微博上的曝光显示，三星C9 Pro的黑色版墨玉黑版本首次现身。', '2017-12-25 12:21:23', '0');
INSERT INTO `news` VALUES ('7', 'iPhone8必换OLED屏', ' 尽管目前来说，iPhone的屏幕仍是这个世界上最为出色的手机屏幕之一，但是苹果已经将液晶屏得优势发挥到了极致，下一代iPhone将采用OLED屏幕也几乎成为了不争的事实。目前，包括三星、谷歌等厂商已经开始逐渐将OLED屏的优势体现出来，根据一家外媒的评论，苹果要想在这个行业不掉队，OLED屏是别无选择的必经之路。', '2017-01-02 12:21:23', '0');
INSERT INTO `news` VALUES ('8', '​小米MIX\r\n\r\n​小米MIX全面屏概念手机', '全面屏，这是一项不可思议的黑科技。为了实现正面几乎只有屏幕的设想，我们去掉了表面传统的听筒、红外距离感应器，设计了一个仅为普通相机 50% 体积的微型前置相机。深度定制了一块 17：9 的超大圆角屏幕，这不仅保持了全面屏最佳的视觉比例，还可以顺畅地使用虚拟按键进行系统操作。', '2017-01-20 12:21:23', '0');
INSERT INTO `news` VALUES ('9', '无Home键三星S8再曝光', ' 尽管距离发布还有半年时间，关于三星Galaxy S8的信息还是不断被曝光。与前代相比，三星Galaxy S8势必要在外观和配置上更惊艳才行，此前三星高管透露其屏占比将在90%以上，预计会取消正面Home键，设计极为颠覆惊艳。', '2017-01-25 12:21:23', '0');
INSERT INTO `news` VALUES ('10', '超高颜值前置2000万双摄vivo X9', '16日晚vivo正式在水立方发布了全新一代X系列手机X9&X9Plus,搭载了前置2000万像素主摄像头。这颗主摄像头采用了和索尼联合研发的IMX376传感器。这颗传感器不仅仅高达2000万像素，而且感光面积达到了1/2.8英寸。搭配800万像素的副摄像头，在自拍的时候能够生成像单反一样的背景虚化效果。X9相比起之前的X7，采用了一块更大的5.5英寸SUPERAMOLED屏幕。由于边框仅有1.59mm，5.5英寸的X9手握起来也不会费劲。而最新的COS超窄边技术和康宁五代玻璃，让X9在保持超窄边框的同时更加耐摔和耐磨。', '2017-02-03 12:21:23', '0');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `orderDeatilId` int(11) NOT NULL AUTO_INCREMENT,
  `orderFormId` varchar(50) NOT NULL,
  `phoneId` int(11) NOT NULL,
  PRIMARY KEY (`orderDeatilId`),
  KEY `fl_orderDetail_orderFormId` (`orderFormId`),
  KEY `fl_Phone_phoneId` (`phoneId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('1', '20170219145225', '16');
INSERT INTO `orderdetail` VALUES ('2', '20170219145642', '66');
INSERT INTO `orderdetail` VALUES ('3', '20170219145936', '116');
INSERT INTO `orderdetail` VALUES ('4', '20170219151243', '4');
INSERT INTO `orderdetail` VALUES ('5', '20170219152130', '9');
INSERT INTO `orderdetail` VALUES ('6', '20170219152130', '59');
INSERT INTO `orderdetail` VALUES ('7', '20170219152352', '33');
INSERT INTO `orderdetail` VALUES ('8', '20170219160245', '1');
INSERT INTO `orderdetail` VALUES ('9', '20170219160333', '30');
INSERT INTO `orderdetail` VALUES ('10', '20170219160654', '54');
INSERT INTO `orderdetail` VALUES ('11', '20170219161001', '45');
INSERT INTO `orderdetail` VALUES ('12', '20170907122557', '13');
INSERT INTO `orderdetail` VALUES ('13', '20170907122557', '63');
INSERT INTO `orderdetail` VALUES ('14', '20170907122557', '113');
INSERT INTO `orderdetail` VALUES ('15', '20170907122557', '163');
INSERT INTO `orderdetail` VALUES ('16', '20170907122557', '213');

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `orderFormId` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `orderFormState` int(11) NOT NULL DEFAULT '0',
  `orderFormPrice` double DEFAULT NULL,
  PRIMARY KEY (`orderFormId`),
  KEY `fk_orderForm_userId` (`userId`),
  KEY `fk_orderForm_addressId` (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES ('20170219145225', '1', '1', '', '0', '4988');
INSERT INTO `orderform` VALUES ('20170219145642', '1', '8', '', '0', '4988');
INSERT INTO `orderform` VALUES ('20170219145936', '1', '1', '', '0', '4988');
INSERT INTO `orderform` VALUES ('20170219151243', '2', '2', '亲，包装好一点', '0', '849');
INSERT INTO `orderform` VALUES ('20170219152130', '2', '2', '', '0', '1998');
INSERT INTO `orderform` VALUES ('20170219152352', '2', '2', '', '0', '3499');
INSERT INTO `orderform` VALUES ('20170219160245', '2', '6', '给葫芦娃买的', '0', '849');
INSERT INTO `orderform` VALUES ('20170219160333', '2', '3', '赶紧滴发货', '0', '499');
INSERT INTO `orderform` VALUES ('20170219160654', '3', '7', '', '0', '849');
INSERT INTO `orderform` VALUES ('20170219161001', '3', '7', '', '0', '3199');
INSERT INTO `orderform` VALUES ('20170907122557', '2', '4', '', '0', '25240');

-- ----------------------------
-- Table structure for orderstate
-- ----------------------------
DROP TABLE IF EXISTS `orderstate`;
CREATE TABLE `orderstate` (
  `orderStateId` int(11) NOT NULL AUTO_INCREMENT,
  `orderFormId` varchar(50) NOT NULL,
  `orderStateDesc` varchar(20) NOT NULL,
  `orderStateTime` datetime NOT NULL,
  PRIMARY KEY (`orderStateId`),
  KEY `fk_orderState_orderFormId` (`orderFormId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderstate
-- ----------------------------
INSERT INTO `orderstate` VALUES ('1', '20170219145225', '待付款', '2017-02-19 14:52:25');
INSERT INTO `orderstate` VALUES ('2', '20170219145642', '待付款', '2017-02-19 14:56:42');
INSERT INTO `orderstate` VALUES ('3', '20170219145936', '待付款', '2017-02-19 14:59:36');
INSERT INTO `orderstate` VALUES ('4', '20170219151243', '待付款', '2017-02-19 15:12:43');
INSERT INTO `orderstate` VALUES ('5', '20170219151243', '待发货', '2017-02-19 15:13:41');
INSERT INTO `orderstate` VALUES ('6', '20170219151243', '待收获', '2017-02-19 15:14:10');
INSERT INTO `orderstate` VALUES ('7', '20170219151243', '待评价', '2017-02-19 15:14:39');
INSERT INTO `orderstate` VALUES ('8', '20170219151243', '交易成功', '2017-02-19 15:15:25');
INSERT INTO `orderstate` VALUES ('9', '20170219152130', '待付款', '2017-02-19 15:21:30');
INSERT INTO `orderstate` VALUES ('10', '20170219145225', '待发货', '2017-02-19 15:21:56');
INSERT INTO `orderstate` VALUES ('13', '20170219152352', '待付款', '2017-02-19 15:23:52');
INSERT INTO `orderstate` VALUES ('14', '20170219152352', '待发货', '2017-02-19 15:24:06');
INSERT INTO `orderstate` VALUES ('15', '20170219152352', '申请退款中', '2017-02-19 15:24:10');
INSERT INTO `orderstate` VALUES ('16', '20170219152352', '交易失败', '2017-02-19 15:25:13');
INSERT INTO `orderstate` VALUES ('17', '20170219160245', '待付款', '2017-02-19 16:02:45');
INSERT INTO `orderstate` VALUES ('18', '20170219160245', '待发货', '2017-02-19 16:02:52');
INSERT INTO `orderstate` VALUES ('19', '20170219160333', '待付款', '2017-02-19 16:03:33');
INSERT INTO `orderstate` VALUES ('20', '20170219160333', '待发货', '2017-02-19 16:03:50');
INSERT INTO `orderstate` VALUES ('21', '20170219160333', '申请退款中', '2017-02-19 16:04:00');
INSERT INTO `orderstate` VALUES ('22', '20170219160654', '待付款', '2017-02-19 16:06:54');
INSERT INTO `orderstate` VALUES ('23', '20170219160654', '待发货', '2017-02-19 16:06:57');
INSERT INTO `orderstate` VALUES ('24', '20170219160654', '待收获', '2017-02-19 16:07:10');
INSERT INTO `orderstate` VALUES ('25', '20170219160654', '待评价', '2017-02-19 16:07:15');
INSERT INTO `orderstate` VALUES ('26', '20170219160654', '交易成功', '2017-02-19 16:08:20');
INSERT INTO `orderstate` VALUES ('27', '20170219161001', '待付款', '2017-02-19 16:10:01');
INSERT INTO `orderstate` VALUES ('28', '20170219161001', '待发货', '2017-02-19 16:10:06');
INSERT INTO `orderstate` VALUES ('29', '20170219145936', '待发货', '2017-02-19 16:11:18');
INSERT INTO `orderstate` VALUES ('30', '20170219145936', '申请退款中', '2017-02-19 16:11:29');
INSERT INTO `orderstate` VALUES ('31', '20170219145225', '待评价', '2017-02-19 16:11:33');
INSERT INTO `orderstate` VALUES ('32', '20170219145225', '交易成功', '2017-02-19 16:11:53');
INSERT INTO `orderstate` VALUES ('33', '20170907122557', '待付款', '2017-09-07 12:25:57');

-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `phoneId` int(11) NOT NULL AUTO_INCREMENT,
  `phoneTypeId` int(11) NOT NULL,
  `phonePrice` double NOT NULL,
  `color` varchar(20) NOT NULL,
  `capacity` varchar(20) NOT NULL,
  `picture` varchar(50) NOT NULL,
  `phoneDesc` varchar(500) NOT NULL,
  `phoneState` int(11) NOT NULL,
  PRIMARY KEY (`phoneId`),
  KEY `fk_phone_phoneTypeId` (`phoneTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone
-- ----------------------------
INSERT INTO `phone` VALUES ('1', '1', '1049', '幽蓝', '32G', 'images/小米NOTE4幽蓝.jpg', '挺好用的呀', '1');
INSERT INTO `phone` VALUES ('2', '1', '1199', '幽蓝', '64G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('3', '1', '999', '金色', '16G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('4', '1', '1049', '金色', '32G', 'images/小米NOTE4金色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('5', '1', '1199', '金色', '64G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('6', '2', '3488', '黑色', '32G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('7', '2', '3588', '黑色', '64G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('8', '2', '3688', '黑色', '128G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('9', '3', '1099', '金色', '32G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('10', '3', '1159', '金色', '64G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('11', '3', '1199', '金色', '128G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('12', '3', '1199', '白色', '128G', 'images/三星GALAXYA7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('13', '4', '5088', '银色', '32G', 'images/苹果IPhone7银色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('14', '4', '5188', '银色', '64G', 'images/苹果IPhone7银色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('15', '4', '5088', '黑色', '32G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('16', '4', '5188', '黑色', '64G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('17', '4', '5288', '黑色', '128G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('18', '4', '5088', '白色', '32G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('19', '4', '5188', '白色', '64G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('20', '4', '5288', '白色', '128G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('21', '5', '1299', '白色', '16G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('22', '5', '1399', '白色', '32G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('23', '5', '1399', '月光银', '32G', 'images/苹果IPhone5s月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('24', '6', '1599', '月光银', '32G', 'images/魅族MX6月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('25', '6', '1599', '优雅灰', '32G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('26', '6', '1699', '优雅灰', '64G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('27', '6', '1599', '香槟金', '32G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('28', '6', '1699', '香槟金', '64G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('29', '7', '599', '玫瑰金', '16G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('30', '7', '699', '玫瑰金', '32G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('31', '7', '599', '白色', '16G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('32', '7', '699', '白色', '32G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('33', '8', '3699', '香槟金', '32G', 'images/华为Mata9香槟金.jpg', '手机很好用,大家都很喜欢', '1');
INSERT INTO `phone` VALUES ('34', '8', '3799', '香槟金', '64G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('35', '8', '3699', '陶瓷白', '32G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('36', '8', '3799', '陶瓷白', '64G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('37', '8', '3699', '摩卡金', '32G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('38', '8', '3799', '摩卡金', '64G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('39', '8', '3899', '摩卡金', '128G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('40', '9', '3299', '陶瓷白', '32G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('41', '9', '3399', '陶瓷白', '64G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('42', '9', '3299', '玫瑰金', '32G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('43', '9', '3399', '玫瑰金', '64G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('44', '9', '3299', '琥珀灰', '32G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('45', '9', '3399', '琥珀灰', '64G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('46', '10', '1150', '月光银', '32G', 'images/红米Note3月光银.jpg', '手机很好用啊撒', '0');
INSERT INTO `phone` VALUES ('47', '10', '1150', '金色', '32G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('48', '10', '1199', '金色', '64G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('49', '10', '1150', '灰锡色', '32G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('50', '10', '1199', '灰锡色', '64G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('51', '1', '1049', '幽蓝', '32G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('52', '1', '1199', '幽蓝', '64G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('53', '1', '999', '金色', '16G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('54', '1', '1049', '金色', '32G', 'images/小米NOTE4金色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('55', '1', '1199', '金色', '64G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('56', '2', '3488', '黑色', '32G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('57', '2', '3588', '黑色', '64G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('58', '2', '3688', '黑色', '128G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('59', '3', '1099', '金色', '32G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('60', '3', '1159', '金色', '64G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('61', '3', '1199', '金色', '128G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('62', '3', '1199', '白色', '128G', 'images/三星GALAXYA7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('63', '4', '5088', '银色', '32G', 'images/苹果IPhone7银色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('64', '4', '5188', '银色', '64G', 'images/苹果IPhone7银色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('65', '4', '5088', '黑色', '32G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('66', '4', '5188', '黑色', '64G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('67', '4', '5288', '黑色', '128G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('68', '4', '5088', '白色', '32G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('69', '4', '5188', '白色', '64G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('70', '4', '5288', '白色', '128G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('71', '5', '1299', '白色', '16G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('72', '5', '1399', '白色', '32G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('73', '5', '1399', '月光银', '32G', 'images/苹果IPhone5s月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('74', '6', '1599', '月光银', '32G', 'images/魅族MX6月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('75', '6', '1599', '优雅灰', '32G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('76', '6', '1699', '优雅灰', '64G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('77', '6', '1599', '香槟金', '32G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('78', '6', '1699', '香槟金', '64G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('79', '7', '599', '玫瑰金', '16G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('80', '7', '699', '玫瑰金', '32G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('81', '7', '599', '白色', '16G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('82', '7', '699', '白色', '32G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('83', '8', '3699', '香槟金', '32G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('84', '8', '3799', '香槟金', '64G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('85', '8', '3699', '陶瓷白', '32G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('86', '8', '3799', '陶瓷白', '64G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('87', '8', '3699', '摩卡金', '32G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('88', '8', '3799', '摩卡金', '64G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('89', '8', '3899', '摩卡金', '128G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('90', '9', '3299', '陶瓷白', '32G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('91', '9', '3399', '陶瓷白', '64G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('92', '9', '3299', '玫瑰金', '32G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('93', '9', '3399', '玫瑰金', '64G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('94', '9', '3299', '琥珀灰', '32G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('95', '9', '3399', '琥珀灰', '64G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('96', '10', '1150', '月光银', '32G', 'images/红米Note3月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('97', '10', '1150', '金色', '32G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('98', '10', '1199', '金色', '64G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('99', '10', '1150', '灰锡色', '32G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('100', '10', '1199', '灰锡色', '64G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('101', '1', '1049', '幽蓝', '32G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('102', '1', '1199', '幽蓝', '64G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('103', '1', '999', '金色', '16G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('104', '1', '1049', '金色', '32G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('105', '1', '1199', '金色', '64G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('106', '2', '3488', '黑色', '32G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('107', '2', '3588', '黑色', '64G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('108', '2', '3688', '黑色', '128G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('109', '3', '1099', '金色', '32G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('110', '3', '1159', '金色', '64G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('111', '3', '1199', '金色', '128G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('112', '3', '1199', '白色', '128G', 'images/三星GALAXYA7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('113', '4', '5088', '银色', '32G', 'images/苹果IPhone7银色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('114', '4', '5188', '银色', '64G', 'images/苹果IPhone7银色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('115', '4', '5088', '黑色', '32G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('116', '4', '5188', '黑色', '64G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('117', '4', '5288', '黑色', '128G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('118', '4', '5088', '白色', '32G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('119', '4', '5188', '白色', '64G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('120', '4', '5288', '白色', '128G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('121', '5', '1299', '白色', '16G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('122', '5', '1399', '白色', '32G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('123', '5', '1399', '月光银', '32G', 'images/苹果IPhone5s月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('124', '6', '1599', '月光银', '32G', 'images/魅族MX6月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('125', '6', '1599', '优雅灰', '32G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('126', '6', '1699', '优雅灰', '64G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('127', '6', '1599', '香槟金', '32G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('128', '6', '1699', '香槟金', '64G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('129', '7', '599', '玫瑰金', '16G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('130', '7', '699', '玫瑰金', '32G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('131', '7', '599', '白色', '16G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('132', '7', '699', '白色', '32G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('133', '8', '3699', '香槟金', '32G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('134', '8', '3799', '香槟金', '64G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('135', '8', '3699', '陶瓷白', '32G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('136', '8', '3799', '陶瓷白', '64G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('137', '8', '3699', '摩卡金', '32G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('138', '8', '3799', '摩卡金', '64G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('139', '8', '3899', '摩卡金', '128G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('140', '9', '3299', '陶瓷白', '32G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('141', '9', '3399', '陶瓷白', '64G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('142', '9', '3299', '玫瑰金', '32G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('143', '9', '3399', '玫瑰金', '64G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('144', '9', '3299', '琥珀灰', '32G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('145', '9', '3399', '琥珀灰', '64G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('146', '10', '1150', '月光银', '32G', 'images/红米Note3月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('147', '10', '1150', '金色', '32G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('148', '10', '1199', '金色', '64G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('149', '10', '1150', '灰锡色', '32G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('150', '10', '1199', '灰锡色', '64G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('151', '1', '1049', '幽蓝', '32G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('152', '1', '1199', '幽蓝', '64G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('153', '1', '999', '金色', '16G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('154', '1', '1049', '金色', '32G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('155', '1', '1199', '金色', '64G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('156', '2', '3488', '黑色', '32G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('157', '2', '3588', '黑色', '64G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('158', '2', '3688', '黑色', '128G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('159', '3', '1099', '金色', '32G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('160', '3', '1159', '金色', '64G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('161', '3', '1199', '金色', '128G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('162', '3', '1199', '白色', '128G', 'images/三星GALAXYA7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('163', '4', '5088', '银色', '32G', 'images/苹果IPhone7银色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('164', '4', '5188', '银色', '64G', 'images/苹果IPhone7银色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('165', '4', '5088', '黑色', '32G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('166', '4', '5188', '黑色', '64G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('167', '4', '5288', '黑色', '128G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('168', '4', '5088', '白色', '32G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('169', '4', '5188', '白色', '64G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('170', '4', '5288', '白色', '128G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('171', '5', '1299', '白色', '16G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('172', '5', '1399', '白色', '32G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('173', '5', '1399', '月光银', '32G', 'images/苹果IPhone5s月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('174', '6', '1599', '月光银', '32G', 'images/魅族MX6月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('175', '6', '1599', '优雅灰', '32G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('176', '6', '1699', '优雅灰', '64G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('177', '6', '1599', '香槟金', '32G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('178', '6', '1699', '香槟金', '64G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('179', '7', '599', '玫瑰金', '16G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('180', '7', '699', '玫瑰金', '32G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('181', '7', '599', '白色', '16G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('182', '7', '699', '白色', '32G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('183', '8', '3699', '香槟金', '32G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('184', '8', '3799', '香槟金', '64G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('185', '8', '3699', '陶瓷白', '32G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('186', '8', '3799', '陶瓷白', '64G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('187', '8', '3699', '摩卡金', '32G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('188', '8', '3799', '摩卡金', '64G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('189', '8', '3899', '摩卡金', '128G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('190', '9', '3299', '陶瓷白', '32G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('191', '9', '3399', '陶瓷白', '64G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('192', '9', '3299', '玫瑰金', '32G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('193', '9', '3399', '玫瑰金', '64G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('194', '9', '3299', '琥珀灰', '32G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('195', '9', '3399', '琥珀灰', '64G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('196', '10', '1150', '月光银', '32G', 'images/红米Note3月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('197', '10', '1150', '金色', '32G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('198', '10', '1199', '金色', '64G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('199', '10', '1150', '灰锡色', '32G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('200', '10', '1199', '灰锡色', '64G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('201', '1', '1049', '幽蓝', '32G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('202', '1', '1199', '幽蓝', '64G', 'images/小米NOTE4幽蓝.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('203', '1', '999', '金色', '16G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('204', '1', '1049', '金色', '32G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('205', '1', '1199', '金色', '64G', 'images/小米NOTE4金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('206', '2', '3488', '黑色', '32G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('207', '2', '3588', '黑色', '64G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('208', '2', '3688', '黑色', '128G', 'images/三星GALAXYS6黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('209', '3', '1099', '金色', '32G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('210', '3', '1159', '金色', '64G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('211', '3', '1199', '金色', '128G', 'images/三星GALAXYA7金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('212', '3', '1199', '白色', '128G', 'images/三星GALAXYA7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('213', '4', '5088', '银色', '32G', 'images/苹果IPhone7银色.jpg', '手机很好用', '1');
INSERT INTO `phone` VALUES ('214', '4', '5188', '银色', '64G', 'images/苹果IPhone7银色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('215', '4', '5088', '黑色', '32G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('216', '4', '5188', '黑色', '64G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('217', '4', '5288', '黑色', '128G', 'images/苹果IPhone7黑色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('218', '4', '5088', '白色', '32G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('219', '4', '5188', '白色', '64G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('220', '4', '5288', '白色', '128G', 'images/苹果IPhone7白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('221', '5', '1299', '白色', '16G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('222', '5', '1399', '白色', '32G', 'images/苹果IPhone5s白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('223', '5', '1399', '月光银', '32G', 'images/苹果IPhone5s月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('224', '6', '1599', '月光银', '32G', 'images/魅族MX6月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('225', '6', '1599', '优雅灰', '32G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('226', '6', '1699', '优雅灰', '64G', 'images/魅族MX6优雅灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('227', '6', '1599', '香槟金', '32G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('228', '6', '1699', '香槟金', '64G', 'images/魅族MX6香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('229', '7', '599', '玫瑰金', '16G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('230', '7', '699', '玫瑰金', '32G', 'images/魅蓝3玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('231', '7', '599', '白色', '16G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('232', '7', '699', '白色', '32G', 'images/魅蓝3白色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('233', '8', '3699', '香槟金', '32G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('234', '8', '3799', '香槟金', '64G', 'images/华为Mata9香槟金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('235', '8', '3699', '陶瓷白', '32G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('236', '8', '3799', '陶瓷白', '64G', 'images/华为Mata9陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('237', '8', '3699', '摩卡金', '32G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('238', '8', '3799', '摩卡金', '64G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('239', '8', '3899', '摩卡金', '128G', 'images/华为Mata9摩卡金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('240', '9', '3299', '陶瓷白', '32G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('241', '9', '3399', '陶瓷白', '64G', 'images/华为G9Plus陶瓷白.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('242', '9', '3299', '玫瑰金', '32G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('243', '9', '3399', '玫瑰金', '64G', 'images/华为G9Plus玫瑰金.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('244', '9', '3299', '琥珀灰', '32G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('245', '9', '3399', '琥珀灰', '64G', 'images/华为G9Plus琥珀灰.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('246', '10', '1180', '月光银', '32G', 'images/红米Note3月光银.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('247', '10', '1150', '金色', '32G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('248', '10', '1199', '金色', '64G', 'images/红米Note3金色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('249', '10', '1150', '灰锡色', '32G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');
INSERT INTO `phone` VALUES ('250', '10', '2599', '灰锡色', '32G', 'images/红米Note3灰锡色.jpg', '手机很好用', '0');

-- ----------------------------
-- Table structure for phonetype
-- ----------------------------
DROP TABLE IF EXISTS `phonetype`;
CREATE TABLE `phonetype` (
  `phoneTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `phoneTypeName` varchar(20) NOT NULL,
  `size` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `callTime` varchar(20) NOT NULL,
  `liveTime` varchar(20) NOT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `pixel` varchar(50) DEFAULT NULL,
  `system` varchar(50) DEFAULT NULL,
  `phoneTypeTime` varchar(50) DEFAULT NULL,
  `phoneTypeState` int(11) NOT NULL,
  `mainPicture` varchar(50) DEFAULT NULL,
  `net` varchar(50) DEFAULT NULL,
  `phoneTypePrice` double DEFAULT NULL,
  PRIMARY KEY (`phoneTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phonetype
-- ----------------------------
INSERT INTO `phonetype` VALUES ('1', '小米NOTE4', '4.7寸', '175g', '4100mAh', '24h', '十核', '1300万像素', 'MIUI', '2016年08月', '0', 'images/小米NOTE4金色.jpg', '全网通', '1199');
INSERT INTO `phonetype` VALUES ('2', '三星GALAXYS6', '5.1寸', '138g', '2550mAh', '18h', '八核', '1600万像素', '三星SYSOL', '2015年04月', '0', 'images/三星GALAXYS6黑色.jpg', '移动4G', '3488');
INSERT INTO `phonetype` VALUES ('3', '三星GALAXYA7', '5.5寸', '175g', '2600mAh', '18.5h', '八核', '1300万像素', '三星SYSOL', '2015年01月', '0', 'images/三星GALAXYA7金色.jpg', '移动4G联通4G', '1009');
INSERT INTO `phonetype` VALUES ('4', '苹果IPhone7', '4.7寸', '138g', '1960mAh', '10h', '四核', '1200万像素', 'IOS', '2016年09月', '0', 'images/苹果IPhone7银色.jpg', '全网通', '5088');
INSERT INTO `phonetype` VALUES ('5', '苹果IPhone5s', '4.0寸', '112g', '1560mAh', '8h', '双核', '800万像素', 'IOS', '2013年09月', '0', 'images/苹果IPhone5s白色.jpg', '全网通', '1299');
INSERT INTO `phonetype` VALUES ('6', '魅族MX6', '5.5寸', '155g', '3600mAh', '20h', '十核', '1200万像素', '安卓', '2016年07月', '0', 'images/魅族MX6月光银.jpg', '移动4G电信4G', '1599');
INSERT INTO `phonetype` VALUES ('7', '魅蓝3', '5.0寸', '175g', '2870mAh', '12h', '双核', '1300万像素', '安卓', '2016年04月', '0', 'images/魅蓝3玫瑰金.jpg', '联通4G电信4G', '599');
INSERT INTO `phonetype` VALUES ('8', '华为Mata9', '5.9寸', '190g', '4000mAh', '23h', '八核', '1300万像素', '安卓', '2016年11月', '0', 'images/华为Mata9香槟金.jpg', '全网通', '3699');
INSERT INTO `phonetype` VALUES ('9', '华为G9Plus', '5.5寸', '162g', '3400mAh', '18h', '八核', '1200万像素', '安卓', '2016年04月', '0', 'images/华为G9Plus陶瓷白.jpg', '全网通', '3270');
INSERT INTO `phonetype` VALUES ('10', '红米NOTE3', '5.5寸', '164g', '4050mAh', '23.5h', '四核', '1300万像素', 'MIUI', '2016年01月', '0', 'images/红米Note3金色.jpg', '全网通', '1150');

-- ----------------------------
-- Table structure for shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar` (
  `shoppingCarId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `phoneId` int(11) NOT NULL,
  `shoppingCarTime` datetime NOT NULL,
  `shoppingCarState` int(11) DEFAULT NULL,
  PRIMARY KEY (`shoppingCarId`),
  KEY `fk_shoppingCar_userId` (`userId`),
  KEY `fk_shoppingCar_phoneId` (`phoneId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES ('1', '1', '16', '2017-02-19 14:43:31', '0');
INSERT INTO `shoppingcar` VALUES ('2', '2', '1', '2017-02-19 14:51:40', '0');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) NOT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `passQuestion` varchar(30) DEFAULT NULL,
  `passAnswer` varchar(30) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `IDCard` varchar(20) DEFAULT NULL,
  `money` double NOT NULL,
  `consume` double NOT NULL,
  `registerTime` datetime NOT NULL,
  `levelId` int(11) NOT NULL,
  `userState` int(11) NOT NULL,
  `personPicture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `fk_userInfo_levelId` (`levelId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '阳光', '宋大宝', '202CB962AC59075B964B07152D234B70', '1', null, null, '', '17799887689', null, '0', '0', '2017-02-19 14:30:18', '1', '0', 'images/person.png');
INSERT INTO `userinfo` VALUES ('2', 'rrz', '阮仁照', '202CB962AC59075B964B07152D234B70', '0', null, null, '1571902315@qq.com', '12345678989', null, '0', '0', '2017-02-19 14:32:07', '1', '0', 'images/person.png');
INSERT INTO `userinfo` VALUES ('3', '张小花', '张小花', '202CB962AC59075B964B07152D234B70', '1', '', '', '', '', '', '0', '0', '2017-02-19 16:05:09', '1', '0', 'images/person.png');

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `voucherId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `voucherPrice` double NOT NULL,
  `voucherTime` datetime NOT NULL,
  `voucherDesc` varchar(50) DEFAULT NULL,
  `voucherState` int(11) NOT NULL,
  PRIMARY KEY (`voucherId`),
  KEY `fk_voucher_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher
-- ----------------------------
