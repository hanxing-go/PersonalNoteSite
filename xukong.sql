/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : xukong

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2024-01-04 23:37:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_note
-- ----------------------------
DROP TABLE IF EXISTS `tb_note`;
CREATE TABLE `tb_note` (
  `noteId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `typeId` int(11) DEFAULT NULL COMMENT '外键，从属tb_note_type',
  `pubTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`noteId`),
  KEY `fk_note_ref_type` (`typeId`),
  CONSTRAINT `fk_note_ref_type` FOREIGN KEY (`typeId`) REFERENCES `tb_note_type` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_note
-- ----------------------------
INSERT INTO `tb_note` VALUES ('1', '上海一日游', '<p><strong>这是测试内容</strong></p>', '2', '2023-12-25 05:10:35');
INSERT INTO `tb_note` VALUES ('2', '第一次测试', '<p>测试</p>', '4', '2023-12-25 05:05:54');
INSERT INTO `tb_note` VALUES ('3', '今日工作安排', '<p>测试</p>', '1', '2023-12-25 05:05:51');
INSERT INTO `tb_note` VALUES ('5', '第三次测试', '<p>测试</p>', '1', '2023-12-25 05:05:47');
INSERT INTO `tb_note` VALUES ('6', '第四次测试', '<p>测试</p>', '1', '2023-12-25 05:02:21');
INSERT INTO `tb_note` VALUES ('7', '出行计划', '<p>出行计划</p>', '2', '2023-12-25 05:02:24');
INSERT INTO `tb_note` VALUES ('9', '测试002', '<p>测试002</p>', '4', '2023-12-25 05:02:28');
INSERT INTO `tb_note` VALUES ('13', '测试003', '<p>测试003</p>', '1', '2023-12-25 03:45:32');
INSERT INTO `tb_note` VALUES ('14', '测试004', '<p>测试004</p>', '1', '2023-12-25 03:52:25');
INSERT INTO `tb_note` VALUES ('35', '这是测试', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">你好<br/></h1>', '10', '2023-12-19 22:24:02');
INSERT INTO `tb_note` VALUES ('58', '祝大家新年快乐', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">新年祝福<br/></h1><p>1. <img src=\"http://img.baidu.com/hi/jx2/j_0078.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/>采一朵天山雪莲，掬一把彭蠡烟水，握一捧长白灵芝，抱一捆<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E8%93%AC%E8%8E%B1%E4%BB%99%E8%8D%89&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">蓬莱仙草</a>，端一盘瑶池仙桃，通通送给你，祝你新的一年<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E5%B9%B3%E5%AE%89%E5%96%9C%E4%B9%90&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">平安喜乐</a>，万事胜意，回望无悔，不辜前程！</p><p>2. 虎年就要来到，信息不能迟到，好友前来报到，祝福提前送到：爱情浪漫美好，友情温暖笼罩，亲情时刻围绕，<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E5%B7%A5%E4%BD%9C%E4%B8%9A%E7%BB%A9&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">工作业绩</a>攀高，生活幸福欢笑，来年更美好。</p><p>3. 新年的祝福用思念起草，用快乐编辑，用幸福传递。虎年钟声响起的那一刻，焰火燃起的那一刹那，把祝福送到你身边。祝你在新的一年里平安喜乐，万事胜意，回望无悔，不辜前程！</p><p>4. <a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E6%99%BA%E8%80%85%E8%AF%B4&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">智者说</a>：朋友不单是谈笑风生，还会分担烦恼，不能与你常见面，但对这友情始终不变，没有经常联络你，而是将你藏在心里，祝你虎年快乐！</p><p>5. 我们一起经历过昨天，共享今天，期待明天。新的一年，愿在我的声声祝福里，你能天天精彩，步步平安，时时开心，分分如意，秒秒幸福，虎年快乐。</p><p>6. 虎年就要到了，愿您腰包圆圆鼓鼓，好运源源不绝，人生福缘广阔，生活团圆幸福，健康元气十足，美好心愿如意，预祝虎年快乐，万事顺心！</p><p>7. 一夜春风到，<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E5%85%83%E6%97%A6&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">元旦</a>花枝俏。俏也不争春，只报福来报。冬雪静静飘，祝福悄悄到。快乐在你身边绕，好运相伴不会少，<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E5%B9%B8%E7%A6%8F%E5%90%89%E7%A5%A5&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">幸福吉祥</a>把你抱。除夕快乐！</p><p>8. <a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E8%BE%9E%E6%97%A7%E8%BF%8E%E6%96%B0&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">辞旧迎新</a>元旦到，祝福赶忙报个到，快乐进入人生道，幸福惬意心里倒，事业登上好运岛，生活舞出吉祥蹈，虎年到，愿你福到、运到、开心到，虎年快乐！</p><p>9. 快乐连成串，笑声永不断；幸福排成排，如意绕身边；问候声声到，心意时时传；虎年喜相逢，友谊花开一片片。祝你虎年快乐，生活美满！</p><p>10. 虎年来临之际，提前送上虎年祝福，祝你在新的一年里：事业正当午，身体壮如虎，金钱不胜数，干活不辛苦，快乐幸福浪漫非你莫属！</p><p>11. 虎年即将来到，愿你的霉运全滚蛋，烦恼统统都完蛋，开心天天来捣蛋，步调从来不扯蛋，养个<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E7%99%BD%E7%99%BD%E7%9A%84&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">白白的</a>脸蛋，砸个富贵的金蛋，做个幸福糊涂蛋。祝你：虎年快乐，笑口常开！</p><p>12. 点点心意点点情，条条信息传真情，祝福问候送不停，愿你天天好心情，亲情爱情样样行，工作顺心事业成，钞票天天赚不停，一生幸福笑盈盈！祝你：虎年快乐，幸福安康！</p><p>13. 虎年就要到了，美妙的钟声又要敲响，让它敲响你虎年的幸运之门，带给你一整年的健康平安、幸福快乐、<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E5%A6%82%E6%84%8F%E5%90%89%E7%A5%A5&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">如意吉祥</a>。提前祝你虎年快乐！</p><p>14. 陈年钟声，敲醒吉祥画面；爆竹炸响，新岁快乐平添；<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E6%96%97%E8%BD%AC%E6%98%9F%E7%A7%BB&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">斗转星移</a>，幸福轮流变换；欢天喜地，平安又是一年；风调雨顺，五洲飞腾看遍，华夏抖擞，旧貌再添新颜；祝福送到，好运朝朝相伴！虎年快乐！</p><p>15. 一年有一春，春春你顺心；一年有一夏，夏夏你发达；一年有一秋，秋秋你丰收；一年有一冬，冬冬你成功；年年有节日，日日都吉祥！虎年快乐！</p><p>16. <a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E6%96%B0%E5%B9%B4&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">新年</a>要有新意，朋友对你表示敬意，亲人对你充满爱意，快乐为你频添暖意，<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E5%A5%BD%E8%BF%90&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">好运</a>对你全心全意，短短祝福是份心意，绵绵不断这份情意。祝你虎年快乐！</p><p>17. 太阳给你温暖，月亮给你温馨，我给你祝福。祝你的运气像雨点一样密集，烦恼像流云一样飞去，幸福像<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E8%9C%82%E8%9C%9C&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">蜂蜜</a>一样甜美。祝你虎年快乐！</p><p>18. 匆匆，太匆匆，时间如水无影踪。花开花谢又一年，转眼白雪飘飘覆万物。除夕佳节倍思亲，愿你<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E5%90%89%E6%98%9F%E9%AB%98%E7%85%A7&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">吉星高照</a>幸福临。祝你健康快乐永相随！</p><p>19. 没有永远的顺境，也没有永远的逆境，不管什么样的环境，只要保持好的心境，就能抵达快乐的仙境。又到除夕，愿你穿过甜美梦境，拥抱幸福胜境！</p><p>20. 迈街相约看花市，却倚骑楼似画廊；束立盆栽成列队，草株木本斗芬芳。通宵灯火人如织，一派歌声喜欲狂，正是今年风景美，千红万紫报春光。</p><p>21. 心在哪里，哪里就有宝藏；志在哪里，哪里就有时间；爱在哪里，哪里就有感动；梦在哪里，哪里就有未来；你在哪里，哪里就有我的真诚祝福。</p><p>22. 新年伊始，祝大家好运连连，四季如春，生活色彩丰富，多姿多彩，偶有一笔不小的财富，烦恼小云扔掉了！请接受我衷心的祝福。祝您春节快乐！</p><p>23. 奔流的岁月长河，在你我心里冲积出友情的平原。肥沃的土地上，盛开出两朵美丽的花，一朵是你，一朵是我，互相陪伴着迎接新年灿烂的黎明：虎年快乐！</p><p>24. 泛舟岁月长河，向又一个起点进发。生活再琐碎，步履再匆忙，不忘记相互关爱，不放弃坚守良知。卸下满身的疲惫，继续保持行动的姿态。带上希望，走过凛冬，迎接新年第一缕阳光。</p><p>25. 走过了山山水水，脚下是高高低低；经历了风风雨雨，还是要寻寻觅觅；获得了多多少少，失去了点点滴滴，重要是开开心心！祝虎年万事顺意！</p><p>26. 拂去岁月浮尘，让欢乐永恒；追忆甜美往事，让感动永恒；燃放灿烂烟花，让美丽永恒；写下温馨祝福，让真诚永恒；新的一年，放飞梦想，收获成功。</p><p>27. 茶，用情感去品，越品越浓；酒，用坦诚去喝，越喝越香；情，用真诚去感，越感越深；友，用理解去交，越交越好；祝您新年快乐！</p><p>28. 新年佳节到，向你问个好，身体倍健康，心情特别好；好运天天交，口味顿顿妙。最后祝您及您的家人：虎年好运挡不住，虎年财源滚滚来！</p><p>29. 时间从指间溜走，默默无闻中，又一个新的年头。寒来暑去，春夏冬秋，别在匆匆的奔走。新年将近，<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E6%AD%A4%E6%83%85%E6%82%A0%E6%82%A0&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">此情悠悠</a>。愿你虎年争上游，幸福长长久！</p><p>30. 鞭炮噼啪，打破昔日的烦恼；焰火升空，迎来今日的美好；灯笼高挂，把快乐喜庆映照；喜气盈门，短信来凑热闹，愿您：新年吉星高照，快乐没有烦恼，日子越过越好，幸福自在逍遥！</p><p>31. 惟愿兄值此新年之际于公于私皆能更上一层楼，高堂康健，手足和睦，娇妻爱子皆能如意，兄亦能心想事成，方显吾对兄之殷切祝福也。</p><p>32. 门开燃爆接财神，户纳祥风满目春。互賀拜年吟吉语，新装靓影悦心人。</p><p>33. 风柔雨润好月圆，<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E8%89%AF%E8%BE%B0%E7%BE%8E%E6%99%AF&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">良辰美景</a>年年盼，幸福生活天天随！冬去春来<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E4%BC%BC%E6%B0%B4%E5%A6%82%E7%83%9F&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">似水如烟</a>，流年不复返，人生需尽欢！说一声珍重道一声平安，祝您<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E6%96%B0%E5%B9%B4%E5%BF%AB%E4%B9%90&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">新年快乐</a>！</p><p>34. 我们虽不常拥有新的一年，但却常拥有新的一天，在新的一年与新的一天共同来临之际，祝你在新的一年新气象，新的一天新收获，新春快乐。</p><p>35. 阳光，送给你温暖；星星，许给你温馨；祝福语，传给你祝福；新春，送给你祝愿。愿你在新的一年里快乐连连，笑容甜甜，钱包鼓鼓！</p><p>36. 阳光暖照，风景美妙，愿轻松和你紧相抱；纵情欢笑，烦恼丢掉，愿快乐在你身边绕；睡个懒觉，疲倦甩掉，愿悠闲与你共奔跑。新年到，愿你<a class=\"RichContent-EntityWord css-1qap1n7\" href=\"https://www.zhihu.com/search?q=%E4%BB%BB%E9%80%8D%E9%81%A5&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A2325623137%7D\" target=\"_blank\">任逍遥</a>！</p><p><br/></p>', '1', '2023-12-26 11:23:59');
INSERT INTO `tb_note` VALUES ('60', '祝大家新年快乐', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">快乐</h1><p><img src=\"http://img.baidu.com/hi/jx2/j_0015.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0017.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p>', '29', '2023-12-27 09:08:50');
INSERT INTO `tb_note` VALUES ('61', '12321321', '<p>213213</p>', '1', '2024-01-02 11:36:14');
INSERT INTO `tb_note` VALUES ('62', '123213123213', '<p>12312312312</p>', '1', '2024-01-02 11:36:27');

-- ----------------------------
-- Table structure for tb_note_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_note_type`;
CREATE TABLE `tb_note_type` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长',
  `typeName` varchar(50) NOT NULL COMMENT '类别名，在同一个用户下唯一',
  `userId` int(11) DEFAULT NULL COMMENT '从属用户',
  PRIMARY KEY (`typeId`),
  KEY `fk_type_ref_user` (`userId`),
  CONSTRAINT `fk_type_ref_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_note_type
-- ----------------------------
INSERT INTO `tb_note_type` VALUES ('1', '私人', '1');
INSERT INTO `tb_note_type` VALUES ('2', '旅游', '1');
INSERT INTO `tb_note_type` VALUES ('3', '美食', '1');
INSERT INTO `tb_note_type` VALUES ('4', '测试', '1');
INSERT INTO `tb_note_type` VALUES ('10', 'test3', '2');
INSERT INTO `tb_note_type` VALUES ('11', 'test1', '2');
INSERT INTO `tb_note_type` VALUES ('12', '明天', '1');
INSERT INTO `tb_note_type` VALUES ('13', '你好', '1');
INSERT INTO `tb_note_type` VALUES ('28', '测试', '7');
INSERT INTO `tb_note_type` VALUES ('29', '新年快乐', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `head` varchar(100) DEFAULT NULL COMMENT '头像',
  `moto` varchar(500) DEFAULT NULL COMMENT '心情',
  PRIMARY KEY (`userID`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '张旭', 'head1.jpg', 'hello,world');
INSERT INTO `user` VALUES ('2', 'zhangsan', '123456', 'zhangsan', 'head.jpg', 'Hello');
INSERT INTO `user` VALUES ('3', '测试', '123456', '张三', null, null);
INSERT INTO `user` VALUES ('4', 'ceshi', '123456', null, null, null);
INSERT INTO `user` VALUES ('5', 'admin1', '123456', null, null, null);
INSERT INTO `user` VALUES ('6', 'admin2', '123456', null, null, null);
INSERT INTO `user` VALUES ('7', 'admin3', '123456', null, null, null);
INSERT INTO `user` VALUES ('8', 'admin5', '123456', null, null, null);
INSERT INTO `user` VALUES ('9', 'admin6', '1234567', null, null, null);
INSERT INTO `user` VALUES ('10', 'zhangxu', 'zhangxu', null, null, null);
INSERT INTO `user` VALUES ('11', '田所浩二', '123456', 'admin1', null, 'test');
INSERT INTO `user` VALUES ('12', 'admin23123', '123456', null, null, null);
INSERT INTO `user` VALUES ('13', 'admin33', '123456', null, null, null);
INSERT INTO `user` VALUES ('14', 'admin123', '123456', null, null, null);
INSERT INTO `user` VALUES ('15', '测试用户', '123456', null, null, null);
INSERT INTO `user` VALUES ('16', 'hehe', '123456', null, null, null);
