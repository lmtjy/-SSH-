/*
SQLyog Ultimate v8.32 
MySQL - 5.5.48 : Database - hotel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hotel`;

/*Table structure for table `hotel_cart` */

DROP TABLE IF EXISTS `hotel_cart`;

CREATE TABLE `hotel_cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_hotel_cart` (`uid`),
  CONSTRAINT `FK_hotel_cart` FOREIGN KEY (`uid`) REFERENCES `hotel_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_cart` */

insert  into `hotel_cart`(`cid`,`uid`) values (1,1);

/*Table structure for table `hotel_cart_details` */

DROP TABLE IF EXISTS `hotel_cart_details`;

CREATE TABLE `hotel_cart_details` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `FK_hotel_cart_details` (`cid`),
  CONSTRAINT `FK_hotel_cart_details` FOREIGN KEY (`cid`) REFERENCES `hotel_cart` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_cart_details` */

/*Table structure for table `hotel_foods` */

DROP TABLE IF EXISTS `hotel_foods`;

CREATE TABLE `hotel_foods` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) DEFAULT NULL,
  `fintr` varchar(300) DEFAULT NULL,
  `fprice` int(10) DEFAULT NULL,
  `fimg` varchar(128) DEFAULT NULL,
  `fcount` int(11) DEFAULT NULL,
  `type` varchar(30) NOT NULL COMMENT '类型',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_foods` */

insert  into `hotel_foods`(`fid`,`fname`,`fintr`,`fprice`,`fimg`,`fcount`,`type`) values (1,'遨游地中海','东坡腊香肠、比萨酱、马苏里拉芝士\n\n四川东坡腊肠又麻又辣与马苏里拉碰撞，中西合璧，出神入化的味道',92,'images\\meal\\food\\piz_01.jpg',100,'002'),(2,'番茄公主','意大利香肠、比萨酱、马苏里拉芝士\n\n风味浓郁的传统意大利香肠辅以特制比萨酱，独具意式风味，美味难挡！',86,'images\\meal\\food\\piz_02.jpg',96,'001'),(3,'遨游地中海','马苏里拉芝士、意式香肠、火腿、牛肉粒、培根、比萨酱\n\n美味的火腿、牛肉粒、培根等丰富馅料融入浓浓芝士，为肉食爱好者送上了一份无比美味的饕餮享受。',92,'images\\meal\\food\\piz_03.jpg',100,'002'),(4,'紐奧良沙朗牛排','炭烤至七分熟的6OZ.沙朗牛排，搭配烘烤蘑菇、洋蔥，佐以新鮮墨西哥蕃茄醬與法式紅酒牛肉汁',86,'images\\meal\\food\\steak03.jpg',96,'003'),(5,'浪漫佩鲁','马苏里拉芝士、口蘑、洋葱、青椒、红椒、玉米粒、黑水榄、比萨酱\n\n香浓芝士佐以青红椒等色彩鲜明的时令鲜蔬，健康美味，一尝难忘！',92,'images\\meal\\food\\piz_05.jpg',100,'002'),(6,'蜜豆狂欢','马苏里拉芝士、烤鸡肉、青椒、红椒、洋葱、菠萝\n\n烤鸡肉、青红椒和洋葱的组合在香甜BBQ酱的配衬下更浓郁诱人，美味无法抵抗！',86,'images\\meal\\food\\piz_06.jpg',96,'002'),(7,'翩翩舞者','猪肉碎、西兰花、番茄丁、玉米',92,'images\\meal\\food\\piz_07.jpg',100,'001'),(8,'青介鳗鱼',' 鳗鱼、青椒、洋葱、番茄丁、芝士、黑胡椒酱',86,'images\\meal\\food\\piz_08.jpg',96,'002'),(9,'神秘诱惑','BBQ酱、烟熏鸡肉丁、玉米、洋葱、美乃滋',92,'images\\meal\\food\\piz_09.jpg',100,'002'),(10,'希腊女神','美式香肠片、火腿、意式香肠丁、玉米',86,'images\\meal\\food\\piz_10.jpg',96,'002'),(11,'夏威夷','火腿、美式香肠片、意式香肠丁、洋葱、培根、番茄丁',92,'images\\meal\\food\\piz_11.jpg',100,'002'),(12,'意大利','鱿鱼花、虾仁、洋葱、青椒、玉米、番茄丁、法式美乃滋',92,'images\\meal\\food\\piz_13.jpg',100,'002'),(13,'印第安风情','嫩汁鸡块、火腿、青椒、菠萝丁',86,'images\\meal\\food\\piz_14.jpg',96,'002'),(14,'酷涼一夏','亨利爵士琴酒搭配清爽的大黃瓜與新鮮檸檬萊姆汁，絕對讓您意猶未盡',48,'images\\meal\\food\\d_01.jpg',100,'007'),(15,'黑莓情人','以傑克丹尼爾®威士忌為基底，加入水蜜桃香甜酒、香格里拉糖漿、新鮮薄荷和黑莓',50,'images\\meal\\food\\d_02.jpg',96,'007'),(16,'奶昔','香草/巧克力/巧克力脆片/Oreo®/草莓/香蕉/椰子',36,'images\\meal\\food\\d_03.jpg',96,'007'),(17,'柑橘紅酒香格里拉','以紅酒與法國干邑柑橘酒為基底,新鮮檸檬萊姆汁與龍舌蘭蜜，散發濃郁的水果香甜滋味',33,'images\\meal\\food\\d_04.jpg',100,'007'),(18,'黑莓長島冰茶','頂級琴酒、蘭姆酒、伏特加、覆盆莓香甜酒、柑橘香甜酒與黑莓，散發濃郁莓果香氣',45,'images\\meal\\food\\d_05.jpg',96,'007'),(19,'骨叉','使用',92,'images\\meal\\food\\x_01.jpg',100,'006'),(20,'番茄公主',NULL,86,'images\\meal\\food\\x_02.jpg',96,'006'),(21,'遨游地中海','使用',92,'images\\meal\\food\\x_03.jpg',100,'006'),(22,'浪漫佩鲁','使用',92,'images\\meal\\food\\x_05.jpg',100,'006'),(23,'蜜豆狂欢',NULL,86,'images\\meal\\food\\x_06.jpg',96,'006'),(24,'翩翩舞者','使用',92,'images\\meal\\food\\x_07.jpg',100,'006'),(25,'青介鳗鱼',NULL,86,'images\\meal\\food\\x_08.jpg',96,'006'),(26,'神秘诱惑','使用',92,'images\\meal\\food\\x_09.jpg',100,'006'),(27,'希腊女神',NULL,86,'images\\meal\\food\\x_10.jpg',96,'006'),(28,'金牌辣雞翅','創新口味雞翅，綜合蘋果烤肉醬與傑克丹尼爾®威士忌甜酒醬，加上新鮮檸檬汁，搭配新鮮美國芹菜與奶油藍起司醬',92,'images\\meal\\food\\x_04.jpg',100,'006'),(29,'草莓園鮮蔬沙拉 ','冰脆的羅美生菜與新鮮綜合生菜、帕米森起司、新鮮草莓切片，搭配FRIDAYS™特製葡萄酒醋醬與糖霜核桃',92,'images\\meal\\food\\s_01.jpg',100,'008'),(30,'科莉布索鱿鱼圈沙拉\n','脆炸鱿鱼圈、混合蔬菜、薄荷叶，搭配莱姆角、新鲜番茄、菠萝和烤',86,'images\\meal\\food\\s_02.jpg',96,'008'),(31,'彩虹沙拉','新鲜生菜配上炭烤鸡胸、寇比芝士、黑橄榄、西红柿、蓝芝士, 配蜂蜜芥末酱。',92,'images\\meal\\food\\s_03.jpg',100,'008'),(32,'凱撒沙拉','美式經典代表。使用新鮮羅美生菜、香蒜奶油麵包丁以及帕米森起司',92,'images\\meal\\food\\s_04.jpg',100,'008'),(33,'纽奥良鸡肉沙拉','纽奥良风味酥炸鸡肉、新鲜生菜、小番茄、鸡蛋及杰克芝士，配蜂蜜芥末酱',86,'images\\meal\\food\\s_05.jpg',96,'008'),(34,'義式油醋雞肉沙拉','爽口羅美生菜拌上凱撒油醋醬，加上香蒜奶油麵包丁、帕米森起司、新鮮蕃茄，最後舖上炭烤酒醋雞肉',92,'images\\meal\\food\\s_06.jpg',100,'008'),(35,'繽紛莓果摩西多','頂級蘭姆酒搭配新鮮薄荷葉、多種莓果、石榴與新鮮檸檬萊姆汁，讓您感受新鮮暢快',92,'images\\meal\\food\\d_06.jpg',100,'007'),(36,'三式組合','FRIDAYS™最經典的開胃菜拼盤，包含馬鈴薯皮、經典紐約辣雞翅，以及香酥馬芝拉條， 適合多人一同享用',86,'images\\meal\\food\\t_01.jpg',96,'009'),(37,'通心麵起司磚','以帕米森起司、傑克起司加上濃郁的奶油燉飯手工製成，裹上特製調味粉炸至金褐色，適合搭配酸甜茄汁醬一起享用。',92,'images\\meal\\food\\t_02.jpg',100,'009'),(38,'遨游地中海','使用',92,'images\\meal\\food\\t_03.jpg',100,'009'),(39,'肋眼牛排','饱含大理石般的花纹，最容易烹调入味，肉间的油脂让口感更添滑顺。',86,'images\\meal\\food\\steak01.jpg',96,'003'),(40,'沙朗牛排','精選沙朗牛排，精心炭烤到您喜愛的熟度。可挑選任兩道主廚精選配菜與您自選的醬料一同享用。\n*醬料可選擇：野菇醬/黑胡椒醬',86,'images\\meal\\food\\steak02.jpg',96,'003');

/*Table structure for table `hotel_minute` */

DROP TABLE IF EXISTS `hotel_minute`;

CREATE TABLE `hotel_minute` (
  `mid` int(11) NOT NULL,
  `mtitle` varchar(5000) DEFAULT NULL,
  `mdetails` varchar(5000) DEFAULT NULL,
  `stime` varchar(255) DEFAULT NULL,
  `otime` varchar(255) DEFAULT NULL,
  KEY `FK14064EFF49A2F066` (`mid`),
  CONSTRAINT `FK14064EFF49A2F066` FOREIGN KEY (`mid`) REFERENCES `hotel_news` (`newId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hotel_minute` */

insert  into `hotel_minute`(`mid`,`mtitle`,`mdetails`,`stime`,`otime`) values (16,NULL,NULL,NULL,NULL),(2,' 即日起，关注大利来官方微博/微信并参与互动，送新加坡豆花一份。','','2018-12-03','2018-12-08'),(3,'农历过年连假出游计划好了吗？不论是春节旅游或是返乡探亲，及早规划行程，享受国际五星尊荣礼遇让您与家人共度最温馨团聚时光。\r\n\r\n订房专线123456 或在线订房\r\n\r\n入住享有 \r\n\r\n    免费使用客房有线及Wi-Fi无线网络\r\n\r\n    免费使用饭店健康俱乐部、三温暖与户外游泳池\r\n\r\n    免费停车、迎宾礼品和矿泉水\r\n\r\n    初次体验Qi Spa指定疗程可享9折优惠\r\n\r\n    预约免费搭乘台南市区定点巡回观光巴士「幸福列车」以及租借自行车(需事先与服务中心预约)','1.  上述项目费用皆需外加10%服务费和5%税金。\r\n2.  住房优惠不得与其他促销方案同时使用。\r\n3.  2月4日至2月9日入住时间为下午4时;退房时间为中午12时。','2019-02-04','2019-02-09'),(4,'体验大利来大酒店，通过提前预订优惠，节省高达10%。享受“提前预订”优惠价的房间预订，须在预订时通过信用卡全额预付房费。','1.  “提前预订”优惠价不适用于团体预订。\r\n2.  房价需加收10%服务费及6%税费。\r\n3.  须在预订时通过信用卡预付入住期间的全部房费。\r\n4.  预订取消、缩短入住天数或更改房间价格等预订更改，全额预付款不予退还。\r\n5.  办理登记入住手续时须出示预付款时使用的信用卡。\r\n6.  预订需视客房的预订及入住情况而定，需提前7天进行预订。\r\n7.  此优惠不可与其他优惠及推广活动同时使用。','2019-01-01','2019-04-04'),(5,'于跨年夜入住大利来大酒店，体验令人难以忘怀的盛大庆典。','1.  预订时需预付全额房费，该预付费用不予退款，预订不可更改至其他日期、宾客姓名或转为酒店消费额。\r\n2.  以上价格为每间夜房价，包含增值税。\r\n3.  上述价格仅适用于2018年12月31日晚。\r\n4.  该优惠设有最低入住天数要求。2018年12月31日前后间夜可享优享价。\r\n5.  含早餐房价须加收每人每晚GBP 27的附加费。\r\n6.  大利来大酒店有权根据房型及抵达日期分配客房及楼层。\r\n7.  大利来大酒店恕不担保烟花表演观赏体验。','2018-12-21','2019-01-06'),(6,'当时针指向午夜，让我们在壮观的烟花美景中拥抱新年。\r\n\r\n优惠包括：\r\n\r\n    至少入住3晚\r\n\r\n    免费高速无线及宽带上网\r\n\r\n入住豪华阁客房及套房的宾客可享豪华阁贵宾廊使用权及以下礼遇：\r\n\r\n    每日06:30至10:30及周末06:30至11:00供应轻食自助早餐\r\n\r\n    全日供应咖啡、茗茶、果汁及软饮\r\n\r\n    14:00至17:00供应下午茶\r\n\r\n    18:00至20:00供应傍晚饮品及小食\r\n\r\n    免费使用豪华阁会议室一小时\r\n\r\n    入住期间免费熨衣一件\r\n\r\n    客房内赠送矿泉水及时令鲜果\r\n\r\n    免费擦鞋服务\r\n\r\n    接待服务','1.  该预订需预付费用。更改入住日期或姓名，则预付费用不予退款、转让或兑换消费额。建议购买旅行保险以防不可预知情况。\r\n2.  悉尼香格里拉大酒店有权根据供应情况、房型及抵达日期分配客房及楼层。所有要求均需视供应情况而定，恕不保证。\r\n3.  豪华客房及行政客房可加配折叠床，每间夜价格 AUD $160。豪华阁客房及套房加配折叠床价格为每间夜 AUD 250。办理入住时恕不提供加床服务，敬请提前预订并预付费用。每间客房入住人数视床型配置而定，酒店将于预订时告知。请注意，观赏烟花期间，每间客房限四（4）位宾客使用。\r\n4.  跨年当晚，豪华阁贵宾廊仅限豪华阁宾客入住，恕不接待房客。为保证宾客人身安全，请勿携带玻璃制品进入豪华阁贵宾廊上方室内阳台。16岁以下儿童宾客仅限于19:00前使用豪华阁贵宾廊。\r\n5.  根据“酒精责任服务”相关规定，严禁宾客携带酒精饮品进入酒店范围。宾客如有需要，可前往大堂酒廊购买瓶装酒精饮品。\r\n酒店车位数量有限，以先到先得原则供酒店宾客使用。','2018-12-20','2019-01-10'),(7,'由2018年12月8日起至2019年2月28日，连续入住大利来大酒店套房三晚，享连续第四晚下榻礼遇。用多余的一天与您的挚爱亲朋在豪华阁感受迷人风光及特色住宿礼遇，充分享受沪上欢乐时光。\r\n\r\n优惠包括：\r\n\r\n \r\n    豪华阁尊崇礼遇：双人自助早餐、下午茶、傍晚免费鸡尾酒及小食、全天免费饮品，每天使用会议室设施2小时以及熨衣服务\r\n\r\n    套房尊享：首晚入住免费使用迷你吧\r\n\r\n    每日报纸及杂志\r\n\r\n    客房高速互联网服务及无线网络服务\r\n\r\n    入住期间免费使用酒店健身中心及游泳池','','2018-12-08','2019-02-28'),(8,'没有什么节日能够像圣诞节一样特别，也没有什么地方比大利来更适合庆祝圣诞。入住景色宜人的客房，欣赏窗外的迷人风光，再来一瓶香槟，向您的美好时光致敬，尽情享受美妙的大利来之旅。我们还精心挑选了各种礼品，如大利来特色迷你室内喷雾、自制圣诞面包及厨师圣诞礼品等，为您锦上添花。此外，还有感恩节日回馈。本着分享和传播节日欢乐的精神，为有需要的儿童送去圣诞礼物的宾客可获得用于下一次入住且适用于Piacere的价值JPY10,000餐饮消费额。这才是圣诞节该有的样子，礼物不断送，美妙的感动无休止%……\r\n\r\n日期：12月1日至25日\r\n价格：每晚JPY 65,000起\r\n\r\n该优惠包括：\r\n\r\n    优雅客房住宿一晚\r\n\r\n    Piacere每日双人美味早餐\r\n\r\n    抵达当日获香槟一瓶\r\n\r\n    尊享节日盛宴；大厨白色圣诞巧克力数，圣诞树干蛋糕以及自制圣诞面包\r\n\r\n    特色畅销香格里拉香氛精华迷你版一瓶\r\n\r\n    为有需要的儿童送去礼物的宾客还可获得Piacere价值JPY 10,000的餐饮消费额，可用于您的下一次入住（有效期六个月）\r\n\r\n    客房内有线及无线高速网络服务\r\n\r\n    使用健身中心设施及室外恒温泳池','1.  价格需加收15%服务费，8%政府税费及适用住宿税。\r\n2.  客房需视供应情况而定，敬请至少提前七天预订。\r\n3.  预订时需以信用卡担保或其他方式预付入住期间全额费用。\r\n4.  于抵达日期当日16:00（酒店所在地时间）前14日以内取消已经担保的预订将收取全额房费作为取消费用。','2018-12-01','2018-12-25'),(9,'新春将至，来大利来酒店，享受舒适入住体验的同时，还有美味新年糕点礼盒可与亲朋好友分享。\r\n\r\n优惠包含：\r\n\r\n    新年糕点礼盒一份（每间房每次入住）\r\n\r\n    宽带及无线上网\r\n\r\n    使用健体中心及游泳池 ','1.  以上价格均为人民币，并需加收10%的服务费及在上述价格与服务费总额上计征的政府税及增值税。\r\n2.  此优惠不可与其他活动或优惠同时使用。\r\n3.  此优惠的预订确认视预订情况为准。\r\n4.  此优惠仅适用于当次入住，有效期不会延长。','2018-12-01','2019-02-28'),(10,'喜迎新春，大利来酒店诚邀您与亲友共庆佳节，感受舒适悠闲的入住体验，享受丰盛营养早餐的同时，更有精美新年好礼为您送上节日的美好祝福。\r\n\r\n特惠包含：\r\n\r\n    新年糕点礼盒一份（每间房每次入住）\r\n\r\n    入住期间可享用次日自助早餐（最多两人）\r\n\r\n    宽带及无线上网\r\n\r\n    使用健体中心及游泳池\r\n\r\n    入住新阁超豪华客房及套房的宾客，可享受新阁贵宾廊各项礼遇','1.  以上价格均为人民币，并需加收10%的服务费及在上述价格与服务费总额上计征的政府税及增值税。\r\n2.  此优惠不可与其他活动或优惠同时使用。\r\n3.  此优惠的预订确认视预订情况为准。\r\n4.  此优惠仅适用于当次入住，有效期不会延长。','2018-12-01','2019-02-28'),(1,'提前14天预订客房，即可以“提前预订价格”节省15%优惠。\r\n\r\n提前预订需于预订时以信用卡预付入住期间的全额房费。','1.  提前预订价格不适用于团体预订。\r\n2.  价格需加收服务费及商业税。\r\n3.  敬请提前预订，需视供应情况而定。\r\n4.  该优惠不可与其他推广活动同时使用。\r\n5.  预订时需以信用卡预付入住期间全额房费。\r\n6.  取消预订、缩短入住天数或价格调整，则预付费用不予退款。\r\n7.  入住时需出示预订时所使用的信用卡。\r\n8.  修改入住日期需收取相当于首晚房费加适用税费和其他费用。该费用可用于支付非客房相关费用的消费额，如餐厅消费、客房服务或电话费。消费额不适用于房费或现金支出。\r\n9.  修改入住日期需视修改当日价格调整情况而定。','2018-12-17','2018-12-29'),(17,'厦门兴南洋信息技术有限公司成立于2000年1月，注册资本金6050万元，位于厦门软件园二期，自有产权研发办公楼2300平方米，公司具有资质19项，软件著作权6项，实用新型专利5项。通过了GB/T19001-2008/ISO9001：2008标准质量管理体系认证、GB/28001-2001标准职业健康安全管理体系认证、GB/T204001/ISO14001:2004标准管理体系认证。公司员工大专以上学历达到90%以上，专业涵盖交通工程、自动化、电子、计算机、电气等。拥有数十名高级工程师、一级建造师、计算机系统集成高级项目经理等高级专业资格人员。    公司前身为南洋信息技术开发服务有限公司系统集成部，是福建省邮电管理局、厦门邮电局、邮电部数据通信技术研究所、厦门建发集团、新海兴（香港）有限公司投资组建的高新技术企业，是福建邮电系统第一家中外合资企业。    厦门兴南洋信息技术有限公司成立以来，秉承“百年大计、质量为本”的企业方针，在交通、建筑、电子信息等领域均取得了一定成绩。 ',NULL,NULL,NULL);

/*Table structure for table `hotel_news` */

DROP TABLE IF EXISTS `hotel_news`;

CREATE TABLE `hotel_news` (
  `newId` int(11) NOT NULL AUTO_INCREMENT,
  `newTitle` varchar(200) DEFAULT NULL,
  `details` varchar(300) DEFAULT NULL,
  `relTime` date DEFAULT NULL,
  `newImg` varchar(128) DEFAULT NULL,
  `newType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`newId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_news` */

insert  into `hotel_news`(`newId`,`newTitle`,`details`,`relTime`,`newImg`,`newType`) values (1,'提前14天预订','提前14天预订客房，即可以“提前预订价格”节省15%优惠。','2018-11-21','images/about01.jpg','店面活动'),(2,'关注微博微信并互动送新加坡豆花...',' 即日起，关注大利来官方微博/微信并参与互动，送新加坡豆花一份。','2018-11-21','images/act_02.jpg','店面活动'),(3,'农历新年住房专案','与家人一同度过难忘的农历新年假期','2018-11-22','images/index.jpg','店面活动'),(4,'提前预订，尊享九折优惠','提前7天预订大利来大酒店，尊享酒店房价九折优惠。','2018-11-22','images/tupian4.jpg','店面活动'),(5,'2018跨年夜','于跨年夜入住大利来大酒店，体验令人难以忘怀的盛大庆典。','2018-11-23','images/tupian5.jpg','店面活动'),(6,'跨年庆典','跨年之夜，让壮观的烟花美景陪您度过！','2018-11-23','images/tupian6.jpg','店面活动'),(7,'相约在冬季','连续入住套房三晚即享第四晚下榻礼遇','2018-11-24','images/tupian7.jpg','店面活动'),(8,'大利来 – 欢庆节日','分享圣诞节日季的灿烂与欢乐，更有感恩礼品相赠','2018-11-24','images/tupian8.jpg','店面活动'),(9,'享特惠入住，获新春好礼','新春将至，享舒适入住体验的同时，与亲朋好友分享美味新年糕点礼盒。','2018-11-25','images/tupian9.jpg','店面活动'),(10,'相聚新春，阖家团圆','喜迎新春，与亲友共庆佳节，感受舒适悠闲入住体验，享丰盛营养早餐的同时，更有精美新年好礼为您送上节日的美好祝福。','2018-11-25','images/tupian10.jpg','店面活动'),(16,'店面活动','选择酒店与度假酒店的限时优惠，悦享舒适住宿体验。','2018-11-26','images/suoyou.png','主题'),(17,'招聘活动','招聘活动','2018-11-29','images/zhaopin.jpg','招聘');

/*Table structure for table `hotel_order` */

DROP TABLE IF EXISTS `hotel_order`;

CREATE TABLE `hotel_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `orderName` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `ltime` date DEFAULT NULL,
  `massage` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `orderTime` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `orderNum` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_hotel_order` (`uid`),
  CONSTRAINT `FK_hotel_order` FOREIGN KEY (`uid`) REFERENCES `hotel_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_order` */

/*Table structure for table `hotel_order_detail` */

DROP TABLE IF EXISTS `hotel_order_detail`;

CREATE TABLE `hotel_order_detail` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `FK_hotel_order_detail` (`oid`),
  CONSTRAINT `FK_hotel_order_detail` FOREIGN KEY (`oid`) REFERENCES `hotel_order` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_order_detail` */

/*Table structure for table `hotel_recruit` */

DROP TABLE IF EXISTS `hotel_recruit`;

CREATE TABLE `hotel_recruit` (
  `new_rid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(255) DEFAULT NULL,
  `rnumber` varchar(255) DEFAULT NULL,
  `smoney` varchar(255) DEFAULT NULL,
  `omoney` varchar(255) DEFAULT NULL,
  `requiren` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`new_rid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_recruit` */

insert  into `hotel_recruit`(`new_rid`,`rname`,`rnumber`,`smoney`,`omoney`,`requiren`) values (1,'java','5','100','200','1、作为企业管培生培养对象，在用人机制上采取定期轮岗的方式，熟悉各部门工作，后定岗。\r\n2、通过培养，达到能独立承担相关岗位职责的基本任职要求，通过培训匹配公司管理人员任职要求。\r\n3、对通过考核的管理培训生，公司将会安排其到最适合的岗位从事管理岗。'),(2,'Java','5','200','300','1、协助主管市场领导开拓市场，建立与外部的联络，持续优化市场营销网络；\r\n2、在市场营销过程广泛建立社会关系，构建并维护、更新公司的公共关系资源库；\r\n3、负责所在区域市场营销工作，并做好业主考察接待的各项准备工作。');

/*Table structure for table `hotel_room_order_detail` */

DROP TABLE IF EXISTS `hotel_room_order_detail`;

CREATE TABLE `hotel_room_order_detail` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `stime` date DEFAULT NULL,
  `ltime` date DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `rid` int(30) DEFAULT NULL,
  `tname` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `tprice` int(11) DEFAULT NULL,
  `orderNum` bigint(20) DEFAULT NULL,
  `ordertime` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_hotel_room_order_detail` (`rid`),
  CONSTRAINT `FK_hotel_room_order_detail` FOREIGN KEY (`rid`) REFERENCES `hotel_rooms` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_room_order_detail` */

insert  into `hotel_room_order_detail`(`oid`,`stime`,`ltime`,`num`,`rid`,`tname`,`mobile`,`pay`,`tprice`,`orderNum`,`ordertime`,`remark`) values (7,'2016-11-23','2016-11-23',2,1,'11','18246521345',2,480,1380020181129,'2018-11-29 13:41:06','11\r\n                         '),(8,'2016-11-23','2016-11-23',1,1,'11','18246521345',2,0,1380020181129,'2018-11-29 13:41:06','11\r\n                         '),(9,'2016-11-23','2016-11-23',1,1,'11','18246521345',2,0,1380020181129,'2018-11-29 13:41:06','11\r\n                         '),(10,'2016-11-23','2016-11-23',2,1,'11','18245612365',2,480,1380020181129,'2018-11-29 13:41:06','11\r\n                         '),(11,'2016-11-23','2016-11-23',1,2,'张三','18245654789',2,0,1380020181129,'2018-11-29 13:41:06','1111\r\n                         '),(12,'2016-11-23','2016-11-23',2,3,'张三','18245632145',2,500,5394620181129,'2018-11-29 16:28:22','1111\r\n                         ');

/*Table structure for table `hotel_rooms` */

DROP TABLE IF EXISTS `hotel_rooms`;

CREATE TABLE `hotel_rooms` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `roomNum` int(11) DEFAULT NULL,
  `proPrice` int(11) DEFAULT NULL,
  `RegPrice` int(11) DEFAULT NULL,
  `houseType` varchar(11) DEFAULT NULL,
  `bedType` int(11) DEFAULT NULL,
  `rPic` varchar(128) DEFAULT NULL,
  `lpic` varchar(128) DEFAULT NULL,
  `mating` int(11) DEFAULT NULL,
  `bookNum` int(11) DEFAULT NULL,
  `cancel` int(8) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_rooms` */

insert  into `hotel_rooms`(`rid`,`roomNum`,`proPrice`,`RegPrice`,`houseType`,`bedType`,`rPic`,`lpic`,`mating`,`bookNum`,`cancel`) values (1,16,240,244,'标准单人间',1,'images/hotel/room_list_01.jpg','images/hotel/room_10.jpg',1,10,1),(2,7,245,250,'温馨单人房',2,'images/hotel/room_list_02.jpg','images/hotel/room_02.jpg',1,5,1),(3,5,250,260,'标准双人房',1,'images/hotel/room_list_03.jpg','images/hotel/room_03.jpg',1,4,1),(4,20,320,356,'温馨大床房',3,'images/hotel/room_list_04.jpg','images/hotel/room_04.jpg',1,3,2),(5,10,260,276,'温馨经济房',2,'images/hotel/room_list_05.jpg','images/hotel/room_05.jpg',1,4,1),(6,15,350,360,'豪华大床房',2,'images/hotel/room_list_06.jpg','images/hotel/room_06.jpg',1,7,2),(7,8,268,282,'商务套房',3,'images/hotel/room_list_07.jpg','images/hotel/room_07.jpg',1,6,1),(8,12,280,300,'经济双人间',3,'images/hotel/room_list_08.jpg','images/hotel/room_08.jpg',1,9,2),(9,10,300,325,'豪华单人间',2,'images/hotel/room_list_09.jpg','images/hotel/room_09.jpg',1,2,1);

/*Table structure for table `hotel_user` */

DROP TABLE IF EXISTS `hotel_user`;

CREATE TABLE `hotel_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) NOT NULL,
  `upwd` varchar(32) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `verifyCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_user` */

insert  into `hotel_user`(`uid`,`uname`,`upwd`,`uphone`,`email`,`verifyCode`) values (1,'LQH','123456','18877826750','562553897@qq.com',NULL),(2,'admin','111','13457744151','1439246244@qq.com',NULL),(3,'wwww','111111','1@qq.com','1111111',NULL),(4,'rrrr','111111','111@qq.com','2222',NULL);

/*Table structure for table `hotel_user_views` */

DROP TABLE IF EXISTS `hotel_user_views`;

CREATE TABLE `hotel_user_views` (
  `vId` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) DEFAULT NULL,
  `vdetail` varchar(600) DEFAULT NULL,
  `reply` varchar(600) DEFAULT NULL,
  `grade` float DEFAULT NULL,
  `postTime` date DEFAULT NULL,
  PRIMARY KEY (`vId`),
  KEY `FK_uid` (`uId`),
  CONSTRAINT `FK_uid` FOREIGN KEY (`uId`) REFERENCES `hotel_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `hotel_user_views` */

insert  into `hotel_user_views`(`vId`,`uId`,`vdetail`,`reply`,`grade`,`postTime`) values (1,1,'房间非常好，服务特别细致，很满意。但是餐厅服务有下降，菜品也不如以前了','亲爱的宾客，非常感谢您选择大利来酒店作为您的下榻之所并为我们提出宝贵意见，我们会针对您提出的宝贵意见及时反馈相关部门整改，相信您下次入住时一定会有更好的入住用餐体验。我们一直致力于为顾客打造优质的产品和服务，以满足顾客需求为己任。真诚期待您再次体验我们的产品、品鉴我们的服务！',5,'2016-10-05'),(2,2,'酒店房间宽敞明亮，可观到大海，环境景观都较好，房间设施卫生整洁，服务周到热情，早餐和零点也很丰富，非常满意','尊敬的贵宾：您好，非常感谢您对我们的支持与厚爱，您给予我们如此高的评价让我们倍感荣耀。我们非常期待您能再次光临我们酒店、品鉴我们的服务！“您的需求，我的责任”一直是我们奉行的服务理念，希望您能多关注我们酒店，为我们提供宝贵建议，帮助我们提升！祝您工作愉快！',4,'2016-10-05');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
