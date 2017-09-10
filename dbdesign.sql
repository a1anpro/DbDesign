/*
 Navicat MySQL Data Transfer

 Source Server         : yanhui
 Source Server Type    : MySQL
 Source Server Version : 50523
 Source Host           : localhost:3306
 Source Schema         : dbdesign

 Target Server Type    : MySQL
 Target Server Version : 50523
 File Encoding         : 65001

 Date: 10/09/2017 12:04:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for booktab
-- ----------------------------
DROP TABLE IF EXISTS `booktab`;
CREATE TABLE `booktab`  (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(6, 2) NOT NULL,
  `isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `picture` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`bookid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of booktab
-- ----------------------------
INSERT INTO `booktab` VALUES (2, '知行合一', '在蛮荒的龙场，王阳明悟出了“圣人之道，吾性自足”，即人人皆有良知。而在血腥的沙场和险恶的朝堂，让龙场悟道实际发挥作用的，是“知行合一”，即遵循内心的良知，便能达到宁静于内、无敌于外的境界。 如果心学是圣贤功夫，那么知行合一则是俗世智慧。知行合一并非得自顿悟，而是在磨难中不断反思、修练，最终砥砺出的生命境界。', '度阴山', 96.80, '9789900051916', 86, 'img/picture/zhixingheyi.jpg');
INSERT INTO `booktab` VALUES (6, '硅谷钢铁侠:埃隆·马斯克的冒险人生', '硅谷钢铁侠：埃隆·马斯克的冒险人生》是一本关于埃隆·马斯克的经典著作。埃隆·马斯克是风格独具的梦想家、创业家与工业家，也是眼光独到、一再开创新商业模式的企业家。从PayPal，到特斯拉、Space X、太阳城，他的创业历程中遭遇了无数棘手的事件，但是每一次突破都令全球惊艳。无论钟情于什么领域，他都可以展现出惊人的专注力。44岁的马斯克已经涉足颠覆互联网、金融、汽车、航空以及能源业。他近乎疯狂的对科', '阿什利·万斯 (Ashlee Vance) ', 43.00, '9787505732193', 116, 'img/picture/guigugangtiexia.jpg');
INSERT INTO `booktab` VALUES (7, '囚徒健身:用失传的技艺练就强大的生存实力', '这不是一本教你练出“可爱肌肉”的书，而是一本教你练出能用的力量、极限的力量、生存的力量的书。作者保罗•威德在美国最严酷的监狱中度过了19年，在其中逐渐挖掘出了一套最古老的健身法，在商业社会中早已失传的力量哲学，并凭此成为了地球上最强壮的人之一——这让他得以有尊严地生存下来。出狱之后，他把这套失传的技艺整理并公之于世——这是他带给我们的最珍贵礼物。', '保罗·威德', 47.30, '7530467557', 52, 'img/picture/jiutujianshen.jpg');
INSERT INTO `booktab` VALUES (8, '富兰克林自传', '《富兰克林自传》是富兰克林晚年根据自己的经历写成的自传。这位饱经风霜的老人，以拉家常的方式，把自己成功的经验和失败的教训娓娓道来，在通俗易懂的叙述中不仅有睿智和哲理的火花，且全书文字朴素幽默，使人备感亲切。它包含了人生奋斗与成功的真知灼见，以及诸种善与美的道德真谛，被公认为是改变了无数人命运的美国精神读本。《富兰克林自传》历经两百余年畅 销不衰，影响了几代美国人，是世界出版史上的优秀畅 销书。世界', '本杰明·富兰克林 (Benjamin Franklin)', 15.60, '9787505732193', 129, 'img/picture/fulankelin.jpg');
INSERT INTO `booktab` VALUES (10, '牛津英汉双解小词典(第9版)', '《牛津英汉双解小词典(第9版)》对词条作了修订，更新了内容，并进行了重新设计，适合初中到大学得英语学习者使用。本词典全面明晰地收录了当代英语的核心词汇，反映了英语的真实用法。为使释义更加明白易懂，本词典的释义词汇格外注意使用日常英语词汇，避免难词或术语化的词汇。 《牛津英汉双解小词典(第9版)》还为容易出现拼写、语法或发音问题的词汇提供了更多帮助信息。', '英国牛津大学出版社', 21.60, '9787560076195', 107, 'img/picture/yinghancidian.jpg');
INSERT INTO `booktab` VALUES (11, '联考与经济类联考同步复习指导系列:写作分册(第16版)', '本书按照最新的管理类联考与经济类联考考试大纲的要求编写而成。管理类联考包括工商管理硕士（MBA）、公共管理硕士(MPA)、会计硕士(MPAcc)、审计硕士、工程管理硕士、旅游管理硕士及图书情报硕士7个专业。经济类联考包括金融硕士、应用统计硕士、税务硕士、国际商务硕士、保险硕士及资产评估硕士6个专业', '赵鑫全', 42.10, '7111561007', 14, 'img/picture/xiezuofence.jpg');
INSERT INTO `booktab` VALUES (12, '新东方·剑桥雅思官方真题集12:学术类', '《新东方•剑桥雅思官方真题集12：学术类》由以下内容构成： ● 4套完整的学术类雅思全真试题 ● 各种题型的全面介绍以及剑桥大学考试委员会采用的评分系统解析 ● 习题答案和听力录音文本 ● 可供下载的听力录音材料', '剑桥大学考试委员会', 92.40, '9781108409636', 19, 'img/picture/xindongfang.jpg');
INSERT INTO `booktab` VALUES (13, '红宝书·(2018)考研英语词汇:必考词+基础词+超纲词', '《红宝书·(2018)考研英语词汇:必考词+基础词+超纲词》包括《考研英语词汇：必考词+基础词+超纲词》、《考研英语词汇必考词+基础词+超纲词：配套练习题及答案解析》、《考研英语词汇必考词+基础词+超纲词：精缩版》、《考研英语词汇必考词+基础词+超纲词：串记手册》共4册。', '考研英语命题研究组 ', 35.70, '9787560422862', 50, 'img/picture/hongbaoshu.jpg');
INSERT INTO `booktab` VALUES (14, '新版中日交流标准日本语初级(第2版)', '《新版中日交流标准日本语 初级》上、下（第二版）依据新日本语能力测试出题基准编写了N5、N4水平的模拟试题，并做少量修订。为了丰富学习资源，提高学习效率，本书增加了配套电子书，内容包括五十音图、各单元会话、课文、生词、重点语法讲解和练习等文字资料及所有音频资源。', '人民教育出版社', 54.60, '9787107278303', 27, 'img/picture/biaozhunriyu.jpg');
INSERT INTO `booktab` VALUES (15, '朗文•外研社•新概念英语1:英语初阶', '《朗文•外研社•新概念英语1:英语初阶(新版)》是该教材出版以来首次推出的新版本。这套经典教材一如既往地向读者提供一个完整的、经过实践检验的英语学习体系，使学生有可能在英语的四项基本技能——理解、口语、阅读和写作——方面限度地发挥自己的潜能。 ', '亚历山大 (L.G. Alexander) ', 20.10, '978756001346601', 50, 'img/picture/xingainian.jpg');
INSERT INTO `booktab` VALUES (16, '了不起的盖茨比:英汉对照', '《了不起的盖茨比：英汉对照》内容简介：一次偶然的机会，穷职员尼克闯入了富豪盖茨比的世界，他与盖茨比结识，故事也这样开始。在盖茨比的豪华宅邸里夜夜笙歌，尼克也对盖茨比充满探究和兴趣。随着认识的加深，尼克了解到盖茨比年轻时并不富有，并且深爱着一个姑娘黛西。后来二战爆发，盖茨比被调往欧洲，黛西也与她分手，嫁给了一个纨绔的富豪子弟', '菲茨杰拉德 (F.Scott Fitzgerald)', 27.40, '9787543073432', 50, 'img/picture/liaobuqidegaicibi.jpg');
INSERT INTO `booktab` VALUES (17, '自然光人像摄影指南', '《自然光人像摄影指南》介绍了在没有复杂和昂贵设备的条件下，如何驾驭强大的自然光源或现场已有的光源环境来创作优秀的人像摄影作品。面对平淡的甚至恶劣的天气条件，作者唐•马提供了宝贵的专业建议，分享了如何利用各种光线条件来解决拍摄问题。通过阅读《自然光人像摄影指南》的用光技巧，读者在面对任何光线条件拍摄人像时都能充满自信和乐趣。', '唐•马 (Don Marr)', 39.60, '9787115245083', 50, 'img/picture/ziranguag.jpg');
INSERT INTO `booktab` VALUES (18, '摄影入门：拍出美照超简单 ', '我们教大家拍摄的是生活、旅行中最常见的场景，比如如何拍夜景，如何拍全家福，如何拍小宝宝，如何拍出大长腿等。全书共有34讲内容，其中基础知识7讲，帮助大家了解摄影中最基本的几个参数；场景拍摄方法27讲，涉及了生活中的各种场景。由于用手机拍照越来越多，我们也根据不同的场景教大家如何用手机拍出好照片，比如如何用手机拍美食，如何用手机自拍等，从而让这本书的实用性变得更强。', '乔旭亮', 36.60, '7122260593', 20, 'img/picture/sheyingrumen.jpg');
INSERT INTO `booktab` VALUES (19, '摄影的艺术', '《摄影的艺术》的作者是国际公认的顶级风光与建筑大师与摄影教育家。《摄影的艺术》全方位地向读者讲解摄影的创作技巧与艺术思想。巴恩博编著的《摄影的艺术》是经典之作《摄影的艺术》的最新修订版（原版于1994年出版），这部著作被认为是最具可读性、最易理解和最全面的摄影教科书，35年畅销世界，为全球摄影师奉为圭皋的经典之作；', 'Bruce Barnbaum', 98.00, '7115265305', 14, 'img/picture/sheying.jpg');
INSERT INTO `booktab` VALUES (20, '美食摄影圣经(全新升级版) ', '《美食摄影圣经(全新升级版)》由知名美食摄影师倾情打造，精选美食摄影中的诸多关键技巧，将拍摄过程化整为零、化繁为简。除了讲解用光、构图、镜头运用等知识，还对美食摄影所特有的布局、道具、色彩搭配、角度选取、拍摄时机等方面进行了有针对性的介绍。作者将多年积累的经验和拍摄心得贯穿《美食摄影圣经(全新升级版)》始末，指导读者轻松拍出令人垂涎欲滴的美食摄影作品。', '海伦妮·迪雅尔丹', 54.50, '7115418136', 25, 'img/picture/meishisheying.jpg');
INSERT INTO `booktab` VALUES (21, '蔡澜美食地图', '《蔡澜美食地图》主要内容：世界上的美食数之不尽，任何一个国家的佳?名菜都要原汁原味在当地享用，而其中许多将成为您毕生难忘的心头之好。《蔡澜美食地图》尽数蔡澜先生周游列国时品尝到的美味佳肴，将最值得推荐的美食一一为人们道来。', '蔡澜', 28.00, '9787807662624', 55, 'img/picture/meishiditu.jpg');
INSERT INTO `booktab` VALUES (22, '深夜食堂美食特辑', '《深夜食堂美食特辑》是根据日本超人气漫画《深夜食堂》为灵感，以其中美食为主题，并携手日本最畅销的大众美食杂志《dancyu》而精心策划的美食揭秘。其中既有对《深夜食堂》中料理具体做法的演示、菜谱公开，也有对美食背后的故事渊源做探讨，让粉丝们耳熟能详的食物一一实体化。', '安倍夜郎 ', 19.20, '9787540467852', 30, 'img/picture/shenyeshitang.jpg');
INSERT INTO `booktab` VALUES (23, '唯爱与美食不可辜负', '《唯爱与美食不可辜负》讲述了二十五个关于各类美食的故事。穿插于蛋糕、甜点、意面、咖喱酱肉、鱼子酱、螃蟹浓汤、鲜蚝之间的，是女性对于生活、情感、人生的领悟和面对世界的勇气和执着。', '山亭夜宴', 32.80, '7514322272', 30, 'img/picture/aihemeishi.jpg');
INSERT INTO `booktab` VALUES (24, '人一生要去的100个地方•世界篇', '《人一生要去的100个地方•世界篇》向心怀远方的人们提供了100处世界值得远游、值得驻足的风景。这些文字或许不是最美丽的，最美丽的文字存乎突然涌上人们心头的感动；这些图片或许也不是美丽的，最美丽的图片存乎人们面对着风景时候的眼睛。书籍仅仅如同一粒种子，从它的胚芽上就可以看见旺盛的绿色；仅仅是一张车票，从这一刻你要踏上新一站的旅程；', '《图说天下•国家地理系列》编委会', 12.40, '9787550207523', 55, 'img/picture/100ge.jpg');
INSERT INTO `booktab` VALUES (25, '中国最美的100个地方', '《中国最美的100个地方》是一部人文地理巨著，编制出一次穿越时空的梦幻之旅。《中国最美的100个地方》主要内容：我们有一个梦想，徒步穿越地与天齐高的珠穆朗玛，在雅鲁藏布江把心洗净，在雪山之巅把魂唤醒；我们有一个梦想，轻舟独泛于宁静的淡水河，在暗香与残阳交织的光影中沉醉；我们有一个梦想，光着脚走在凤凰古城满是刻痕的青石板路上，倾听《边城》中梦里的歌声；', '《图说天下•国家地理系列》编委会', 11.30, '9787550207479', 50, 'img/picture/zhongguozuimei.jpg');
INSERT INTO `booktab` VALUES (26, '中国自助游(2017全新彩色升级版)', '《中国自助游》无疑是你的贴身小助手，满足你一切旅途需求。 《中国自助游》每年都会不断更新升级，加入更多新鲜有趣的资讯，“游探”实地游带来的生动感受以及旅游地第一手权威资讯，我们以专业旅行者的角度进行剖析，为你精选独特美食、经济舒适的住宿环境、充满乐趣的游玩圣地。', '《中国自助游》编辑部 ', 41.20, '9787116099968', 20, 'img/picture/zizhuyou.jpg');
INSERT INTO `booktab` VALUES (27, '马克吐温', '测试', '测试', 123.00, '333', 9, 'img/picture/maketuwen.jpg');

-- ----------------------------
-- Table structure for boughtordertab
-- ----------------------------
DROP TABLE IF EXISTS `boughtordertab`;
CREATE TABLE `boughtordertab`  (
  `boughtid` int(11) NOT NULL AUTO_INCREMENT,
  `order_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_id` int(11) NOT NULL,
  `bought_num` int(11) NOT NULL,
  `bought_cost` double(7, 2) NOT NULL,
  PRIMARY KEY (`boughtid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of boughtordertab
-- ----------------------------
INSERT INTO `boughtordertab` VALUES (13, '1495269935984', 2, 4, 387.20);
INSERT INTO `boughtordertab` VALUES (14, '1495272379731', 7, 2, 94.60);
INSERT INTO `boughtordertab` VALUES (15, '1495272379731', 8, 1, 15.60);
INSERT INTO `boughtordertab` VALUES (16, '1495272379731', 6, 1, 43.00);
INSERT INTO `boughtordertab` VALUES (17, '1495585437914', 2, 1, 96.80);
INSERT INTO `boughtordertab` VALUES (18, '1495585437914', 6, 2, 86.00);
INSERT INTO `boughtordertab` VALUES (19, '1495585693182', 2, 1, 96.80);
INSERT INTO `boughtordertab` VALUES (20, '1495585693182', 7, 1, 47.30);
INSERT INTO `boughtordertab` VALUES (21, '1495614925955', 27, 3, 369.00);
INSERT INTO `boughtordertab` VALUES (22, '1495614925955', 14, 3, 163.80);
INSERT INTO `boughtordertab` VALUES (23, '1495615035266', 2, 1, 96.80);
INSERT INTO `boughtordertab` VALUES (24, '1495615035266', 11, 1, 42.10);
INSERT INTO `boughtordertab` VALUES (25, '1497059684668', 2, 1, 96.80);
INSERT INTO `boughtordertab` VALUES (26, '1497061398369', 10, 2, 43.20);
INSERT INTO `boughtordertab` VALUES (27, '1497061398369', 2, 1, 96.80);
INSERT INTO `boughtordertab` VALUES (28, '1497061892213', 12, 1, 92.40);
INSERT INTO `boughtordertab` VALUES (29, '1497061892213', 10, 1, 21.60);
INSERT INTO `boughtordertab` VALUES (30, '1497061954977', 2, 1, 96.80);
INSERT INTO `boughtordertab` VALUES (31, '1497061967920', 6, 1, 43.00);
INSERT INTO `boughtordertab` VALUES (32, '1497064898818', 19, 1, 98.00);

-- ----------------------------
-- Table structure for customertab
-- ----------------------------
DROP TABLE IF EXISTS `customertab`;
CREATE TABLE `customertab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `picture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `account` double(7, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customertab
-- ----------------------------
INSERT INTO `customertab` VALUES (15, '严辉', '328213h', '湖北宜昌', 'img/', -152.90);
INSERT INTO `customertab` VALUES (16, '周静', '123', '湖北荆州', 'img/', 861.10);
INSERT INTO `customertab` VALUES (17, '王帅', '123', '湖北襄阳', 'img/', 551.40);

-- ----------------------------
-- Table structure for ordertab
-- ----------------------------
DROP TABLE IF EXISTS `ordertab`;
CREATE TABLE `ordertab`  (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `ordername` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ordertab
-- ----------------------------
INSERT INTO `ordertab` VALUES (11, '1495272379731', 15);
INSERT INTO `ordertab` VALUES (12, '1495585437914', 15);
INSERT INTO `ordertab` VALUES (13, '1495585693182', 15);
INSERT INTO `ordertab` VALUES (14, '1495614925955', 15);
INSERT INTO `ordertab` VALUES (15, '1495615035266', 16);
INSERT INTO `ordertab` VALUES (16, '1497059684668', 15);
INSERT INTO `ordertab` VALUES (17, '1497061398369', 15);
INSERT INTO `ordertab` VALUES (18, '1497061892213', 17);
INSERT INTO `ordertab` VALUES (19, '1497061954977', 17);
INSERT INTO `ordertab` VALUES (20, '1497061967920', 17);
INSERT INTO `ordertab` VALUES (21, '1497064898818', 17);

-- ----------------------------
-- Table structure for sorttab
-- ----------------------------
DROP TABLE IF EXISTS `sorttab`;
CREATE TABLE `sorttab`  (
  `book_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sorttab
-- ----------------------------
INSERT INTO `sorttab` VALUES (2, 5);
INSERT INTO `sorttab` VALUES (6, 6);
INSERT INTO `sorttab` VALUES (7, 4);
INSERT INTO `sorttab` VALUES (7, 11);
INSERT INTO `sorttab` VALUES (8, 5);
INSERT INTO `sorttab` VALUES (8, 6);
INSERT INTO `sorttab` VALUES (10, 2);
INSERT INTO `sorttab` VALUES (10, 4);
INSERT INTO `sorttab` VALUES (11, 2);
INSERT INTO `sorttab` VALUES (11, 3);
INSERT INTO `sorttab` VALUES (12, 1);
INSERT INTO `sorttab` VALUES (12, 2);
INSERT INTO `sorttab` VALUES (12, 3);
INSERT INTO `sorttab` VALUES (13, 2);
INSERT INTO `sorttab` VALUES (13, 3);
INSERT INTO `sorttab` VALUES (14, 1);
INSERT INTO `sorttab` VALUES (14, 2);
INSERT INTO `sorttab` VALUES (15, 1);
INSERT INTO `sorttab` VALUES (15, 2);
INSERT INTO `sorttab` VALUES (15, 4);
INSERT INTO `sorttab` VALUES (16, 2);
INSERT INTO `sorttab` VALUES (16, 5);
INSERT INTO `sorttab` VALUES (17, 7);
INSERT INTO `sorttab` VALUES (17, 8);
INSERT INTO `sorttab` VALUES (18, 7);
INSERT INTO `sorttab` VALUES (19, 7);
INSERT INTO `sorttab` VALUES (19, 8);
INSERT INTO `sorttab` VALUES (20, 7);
INSERT INTO `sorttab` VALUES (20, 9);
INSERT INTO `sorttab` VALUES (21, 9);
INSERT INTO `sorttab` VALUES (22, 9);
INSERT INTO `sorttab` VALUES (23, 5);
INSERT INTO `sorttab` VALUES (23, 9);
INSERT INTO `sorttab` VALUES (24, 10);
INSERT INTO `sorttab` VALUES (25, 10);
INSERT INTO `sorttab` VALUES (26, 10);
INSERT INTO `sorttab` VALUES (27, 1);
INSERT INTO `sorttab` VALUES (27, 2);
INSERT INTO `sorttab` VALUES (27, 4);

-- ----------------------------
-- Table structure for tempcarttab
-- ----------------------------
DROP TABLE IF EXISTS `tempcarttab`;
CREATE TABLE `tempcarttab`  (
  `custid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tempcarttab
-- ----------------------------
INSERT INTO `tempcarttab` VALUES (15, 2, 1, 96.8, 96.8);
INSERT INTO `tempcarttab` VALUES (15, 12, 1, 92.4, 92.4);

-- ----------------------------
-- Table structure for typetab
-- ----------------------------
DROP TABLE IF EXISTS `typetab`;
CREATE TABLE `typetab`  (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`typeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of typetab
-- ----------------------------
INSERT INTO `typetab` VALUES (1, 'textbook');
INSERT INTO `typetab` VALUES (2, 'foreign');
INSERT INTO `typetab` VALUES (3, 'exam');
INSERT INTO `typetab` VALUES (4, 'reference');
INSERT INTO `typetab` VALUES (5, 'literature');
INSERT INTO `typetab` VALUES (6, 'biography');
INSERT INTO `typetab` VALUES (7, 'photo');
INSERT INTO `typetab` VALUES (8, 'art');
INSERT INTO `typetab` VALUES (9, 'food');
INSERT INTO `typetab` VALUES (10, 'travel');
INSERT INTO `typetab` VALUES (11, 'sport');

SET FOREIGN_KEY_CHECKS = 1;
