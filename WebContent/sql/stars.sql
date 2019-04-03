/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : stars

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-10-19 17:02:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('123', '213');
INSERT INTO `admin` VALUES ('123456', '123');
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `introduction` text,
  `views` int(15) DEFAULT NULL,
  `url_view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url_after` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES ('1', '科普讨论', '一个很厉害的版块', '1222352', '/view/science', '/after/science');
INSERT INTO `forum` VALUES ('2', '摄影天地', '一个很漂亮的版块', '3212112', '/view/photograph', '/after/photograph');
INSERT INTO `forum` VALUES ('3', '电影宇宙', '一个很好看的版块', '11112226', '/view/movie', '/after/movie');

-- ----------------------------
-- Table structure for imginfo
-- ----------------------------
DROP TABLE IF EXISTS `imginfo`;
CREATE TABLE `imginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) NOT NULL COMMENT '本地存放的URL地址',
  `remark` varchar(40) DEFAULT NULL COMMENT '备注',
  `state` int(11) DEFAULT NULL COMMENT '0:使用,1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imginfo
-- ----------------------------

-- ----------------------------
-- Table structure for reply_thread
-- ----------------------------
DROP TABLE IF EXISTS `reply_thread`;
CREATE TABLE `reply_thread` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from_uid` int(6) DEFAULT NULL,
  `to_uid` int(6) DEFAULT NULL,
  `tid` int(9) DEFAULT NULL,
  `content` text,
  `num` int(9) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`from_uid`),
  KEY `tid` (`tid`),
  KEY `reply_thread_ibfk_13` (`to_uid`),
  CONSTRAINT `reply_thread_ibfk_1` FOREIGN KEY (`from_uid`) REFERENCES `user` (`id`),
  CONSTRAINT `reply_thread_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `thread` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply_thread
-- ----------------------------

-- ----------------------------
-- Table structure for thread
-- ----------------------------
DROP TABLE IF EXISTS `thread`;
CREATE TABLE `thread` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uid` int(6) DEFAULT NULL,
  `fid` int(2) DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `content` text,
  `reply_num` int(10) DEFAULT NULL,
  `views` int(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `fid` (`fid`),
  CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `thread_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `forum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thread
-- ----------------------------
INSERT INTO `thread` VALUES ('2', '6', '1', '霍金在物理学科学家中到底有多高的地位？可以和爱因斯坦，牛顿这些人相提并论吗？', '<div>作者：蚕茧123<br>链接：https://www.zhihu.com/question/28271703/answer/294818051<br>来源：知乎<br><span style=\"background-color: rgb(249, 150, 59);\">著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</span><br><br><div>物理学是这样的。<br>阿基米德开凿了一个山洞，可以住人。<br>伽利略觉得山洞太简陋了，他挖了一个坑，想盖房子。<br>牛顿包工头，带着开普勒，胡克，笛卡尔等一群小弟打下了地基。<br>后面几百年，包括法拉第在内的一群物理学家盖了一座看起来漂亮而完美的房子。<br>然后开尔文说房子盖完了，大家都去住吧，已经完美了，物理学家没事干了，就是天怎么不晴啊，头上还有两片乌云？<br>结果乌云的制造者麦克斯韦劈下两道闪电，房子塌了。麦克斯韦说，盖尼玛的房子，眼光能长远点吗？「其实乌云不是麦克斯韦制造的，但是麦克斯韦方程组预言了光速不变，作为物理学的老四，必须给他个霸气的工作，也就是拆房子」<br>于是包工头爱因斯坦出现了，他先带领洛伦兹等小弟，盖了一层楼「狭义相对论」，后来他小弟都不用了，自己往上一个人盖了一整栋楼！这栋楼盖好了没装修，后面的科学家，什么史瓦西啊，霍金啊，都是在爱因斯坦这栋楼上搞装修的，霍金大概装了一面墙。<br>与爱因斯坦同时代，普朗克，波尔，海森堡等人，哦，还有爱因斯坦，他们盖了另一栋楼，也就是量子力学，这些人合力盖的，没有包工头，这栋楼现在看起来似乎更牛逼，而杨振宁，在这栋楼里打了一个电梯井，用标准模型贯通了这栋楼。<br>所以杨振宁跟霍金就好判断谁高谁低了，一个装修了墙，一个打了电梯井，至于跟盖楼的爱因斯坦和打地基的牛顿，就别提了吧。<br>后来人们发现两栋楼连不起来，威滕这些人就用弦在那里搭桥，目前看来只是一道彩虹桥，不能走人，未来就不一定了，也许彩虹桥就是真理呢<br>______<br>缅怀霍金大师，没想到以前的一个回答忽然就火了，收到很多私信举报抄袭我回答的，也有编辑问是否可以转载的，感谢知乎的知识产权氛围。答主其实一个小说作者，对有正版意识的人总是怀着敬畏和感恩之心的。<br>如果转载的话，请注明作者:蚕茧里的牛，好吧，这是我写小说的笔名，有点傻。<br>----<br>写这个回答的时候没有想到霍金大师突然就会离世了，印象里他虽然很不健康，但总觉的他会活得跟温伯格，甚至杨振宁一样久，霍金先生创造了物理学的一个奇迹，把艰涩的科普时间简史写成了哈利波特，让很多人进入了物理的殿堂。</div></div><p><br></p>', '1111', '3131', '2018-10-12 11:06:40');
INSERT INTO `thread` VALUES ('89', '6', '1', '修改tid=8', '<p>12****>', '0', '3', '2018-10-19 15:35:31');

-- ----------------------------
-- Table structure for thumb
-- ----------------------------
DROP TABLE IF EXISTS `thumb`;
CREATE TABLE `thumb` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `rid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  CONSTRAINT `thumb_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `thumb_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `reply_thread` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thumb
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `src` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '用户01', '用户01昵称', '123', '123@qq.com', '男', '/photo_test01.jpg', '2018-09-10 11:26:59');
INSERT INTO `user` VALUES ('4', '佣金01', '佣金01', '123', '12301@213', '男', '\\佣金01/slide04.jpg', '2018-09-17 14:45:21');
INSERT INTO `user` VALUES ('6', '天上星河', '天上星河', '123', '12301@213', '男', '\\天上星河/slide02.jpg', '2018-09-18 10:54:36');
INSERT INTO `user` VALUES ('14', '佣金02', '用户1111297', '123', '1@123', '男', '\\佣金02/slide01.jpg', '2018-10-09 09:07:13');
INSERT INTO `user` VALUES ('15', '天上星河01', '用户117358', '123', '12301@213', '男', '\\天上星河01/v2-03e002bf0c8ece525294a75d3680770c_hd.jpg', '2018-10-09 09:09:12');
INSERT INTO `user` VALUES ('20', '天上星河1', '天上星河哈', '123', '33@11', '女', '\\天上星河1/slide01.jpg', '2018-10-16 17:46:35');
