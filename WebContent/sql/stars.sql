/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : stars

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-10-12 17:06:38
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
INSERT INTO `admin` VALUES ('1234', '123');
INSERT INTO `admin` VALUES ('12345', '123');
INSERT INTO `admin` VALUES ('admin', 'admin');
INSERT INTO `admin` VALUES ('admin2', '123');

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
INSERT INTO `forum` VALUES ('1', '科普讨论', '一个很厉害的版块', '1222344', '/view/science', '/after/science');
INSERT INTO `forum` VALUES ('2', '摄影天地', '一个很漂亮的版块', '3212111', '/view/photograph', '/after/photograph');
INSERT INTO `forum` VALUES ('3', '电影宇宙', '一个很好看的版块', '11112225', '/view/movie', '/after/movie');

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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thread
-- ----------------------------
INSERT INTO `thread` VALUES ('2', '6', '1', '霍金在物理学科学家中到底有多高的地位？可以和爱因斯坦，牛顿这些人相提并论吗？', '<div>作者：蚕茧123<br>链接：https://www.zhihu.com/question/28271703/answer/294818051<br>来源：知乎<br><span style=\"background-color: rgb(249, 150, 59);\">著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</span><br><br><div>物理学是这样的。<br>阿基米德开凿了一个山洞，可以住人。<br>伽利略觉得山洞太简陋了，他挖了一个坑，想盖房子。<br>牛顿包工头，带着开普勒，胡克，笛卡尔等一群小弟打下了地基。<br>后面几百年，包括法拉第在内的一群物理学家盖了一座看起来漂亮而完美的房子。<br>然后开尔文说房子盖完了，大家都去住吧，已经完美了，物理学家没事干了，就是天怎么不晴啊，头上还有两片乌云？<br>结果乌云的制造者麦克斯韦劈下两道闪电，房子塌了。麦克斯韦说，盖尼玛的房子，眼光能长远点吗？「其实乌云不是麦克斯韦制造的，但是麦克斯韦方程组预言了光速不变，作为物理学的老四，必须给他个霸气的工作，也就是拆房子」<br>于是包工头爱因斯坦出现了，他先带领洛伦兹等小弟，盖了一层楼「狭义相对论」，后来他小弟都不用了，自己往上一个人盖了一整栋楼！这栋楼盖好了没装修，后面的科学家，什么史瓦西啊，霍金啊，都是在爱因斯坦这栋楼上搞装修的，霍金大概装了一面墙。<br>与爱因斯坦同时代，普朗克，波尔，海森堡等人，哦，还有爱因斯坦，他们盖了另一栋楼，也就是量子力学，这些人合力盖的，没有包工头，这栋楼现在看起来似乎更牛逼，而杨振宁，在这栋楼里打了一个电梯井，用标准模型贯通了这栋楼。<br>所以杨振宁跟霍金就好判断谁高谁低了，一个装修了墙，一个打了电梯井，至于跟盖楼的爱因斯坦和打地基的牛顿，就别提了吧。<br>后来人们发现两栋楼连不起来，威滕这些人就用弦在那里搭桥，目前看来只是一道彩虹桥，不能走人，未来就不一定了，也许彩虹桥就是真理呢<br>______<br>缅怀霍金大师，没想到以前的一个回答忽然就火了，收到很多私信举报抄袭我回答的，也有编辑问是否可以转载的，感谢知乎的知识产权氛围。答主其实一个小说作者，对有正版意识的人总是怀着敬畏和感恩之心的。<br>如果转载的话，请注明作者:蚕茧里的牛，好吧，这是我写小说的笔名，有点傻。<br>----<br>写这个回答的时候没有想到霍金大师突然就会离世了，印象里他虽然很不健康，但总觉的他会活得跟温伯格，甚至杨振宁一样久，霍金先生创造了物理学的一个奇迹，把艰涩的科普时间简史写成了哈利波特，让很多人进入了物理的殿堂。</div></div><p><br></p>', '1111', '3127', '2018-10-12 11:06:40');
INSERT INTO `thread` VALUES ('76', '6', '1', '宇宙中细思恐极的事', '<br><br><br><br><br><div><p>关于宇宙的最终结局有很多假说，比如被不断增强的暗能量撕成亚原子碎片的大撕裂，熵增到最高陷入热寂的大冰冻，还有重新收缩到奇点的大反弹。哪一种假说会最后成为现实，现在还不得而知。然而，即使这些假说都没有最终实现，宇宙也将在漫长的岁月中，慢慢陷入无边的黑暗和死寂。 </p><p><span style=\"font-weight: bold; background-color: rgb(249, 150, 59);\">***</span></p><p><i>下文的主要内容来自Crash Course频道的视频《Deep Time》（<a href=\"https://link.zhihu.com/?target=https%3A//youtu.be/jDF-N3A60DE\" target=\"_blank\" rel=\"nofollow noreferrer\">https://youtu.be/jDF-N3A60DE</a>）</i></p><p>天体物理学家弗莱德·亚当斯和格里高利·拉夫林在《宇宙的五个年代》(The Five Ages of The Universe)中，把宇宙的生命分为五个纪元。我们可以沿用这五个纪元的划分，来看看宇宙的最终结局。<br></p><figure><noscript><img src=\"https://pic2.zhimg.com/86a232212dda515568b9dadd58c460d5_b.png\" width=\"811\"></noscript><img src=\"https://pic2.zhimg.com/80/86a232212dda515568b9dadd58c460d5_hd.png\" width=\"811\"></figure><br>图片来自<a href=\"https://link.zhihu.com/?target=https%3A//en.wikipedia.org/wiki/Future_of_an_expanding_universe\" target=\"_blank\" rel=\"nofollow noreferrer\">Future of an expanding universe</a><p></p><p><b>1. 原初纪元（Primordial Era)</b></p><p></p><figure><noscript><img src=\"https://pic1.zhimg.com/5d67cc0b0ac314420015a9cc59f7cbe4_b.png\" width=\"91\"></noscript><img src=\"https://pic1.zhimg.com/80/5d67cc0b0ac314420015a9cc59f7cbe4_hd.png\" width=\"91\"></figure>原初纪元的范围是从宇宙大爆炸到4亿年后，第一颗恒星诞生。这个纪元已经过去了。<br><figure><noscript><img src=\"https://pic4.zhimg.com/a118d85d424e16a780d87bae8bef4313_b.png\" width=\"450\"></noscript><img src=\"https://pic4.zhimg.com/80/a118d85d424e16a780d87bae8bef4313_hd.png\" width=\"450\"></figure>图片来自<a href=\"https://link.zhihu.com/?target=https%3A//en.wikipedia.org/wiki/Big_Bang\" target=\"_blank\" rel=\"nofollow noreferrer\">Big Bang</a><p></p><p><b>2. 恒星纪元（Stelliferous Era）</b></p><p></p><figure><noscript><img src=\"https://pic1.zhimg.com/81bd5ccdedf34055d6694dd9fdf55be0_b.png\" width=\"110\"></noscript><img src=\"https://pic1.zhimg.com/80/81bd5ccdedf34055d6694dd9fdf55be0_hd.png\" width=\"110\"></figure>恒星主宰宇宙，繁星布满夜空。生活在这个时代，无疑是我们的幸运。<br><figure><noscript><img src=\"https://pic3.zhimg.com/0dd47d80f59f9e9888fddf83f795fb6a_b.png\" width=\"685\"></noscript><img src=\"https://pic3.zhimg.com/80/0dd47d80f59f9e9888fddf83f795fb6a_hd.png\" width=\"685\"></figure>图片来自<a href=\"https://link.zhihu.com/?target=https%3A//en.wikipedia.org/wiki/The_Starry_Night\" target=\"_blank\" rel=\"nofollow noreferrer\">The Starry Night</a><p></p><p>恒星纪元什么时候结束呢？或者说，最后一颗恒星什么时候会熄灭呢？质量越小的恒星，寿命越长，因为它们在核聚变中把氢转化为氦的速度越慢。最小的红矮星可以持续1万亿年。在宇宙幼年时形成的红矮星到现在只用了1%的氢。从人类的角度来看，它们还是婴儿。<br></p><figure><br></figure><br>现在，星系还在搅拌着星云，用星云气体创造新的恒星。但是，气体终有耗尽的一天。据估计，数十亿年后星云气体的供给将会后继乏力，新生的恒星越来越少，而已经诞生的恒星会用尽燃料，一个接着一个逐一熄灭。在这以后，诸如星系碰撞之类的事件会创造一些新恒星，延长恒星创生的年代。但是，和红矮星万亿年的寿命想比，延长500亿年甚至1000亿年都没有太大的区别。<p></p><p>当大量恒星熄灭的时候，星系将改变颜色。现在，多数星系都表现出耀眼的蓝白色，体积庞大的明亮恒星是星系内的主要光源。当这些恒星死去，质量较低的暗恒星成为主角，星系的颜色也会随之变暗变红。<br></p><figure><noscript><img src=\"https://pic3.zhimg.com/1d5ad7e4893ac5e7129be86af42ba252_b.png\" width=\"1084\"></noscript><img src=\"https://pic3.zhimg.com/80/1d5ad7e4893ac5e7129be86af42ba252_hd.png\" width=\"1084\"></figure><br>星云气体耗尽后几十亿年，星系中只有长命的红矮星还在发光。这种情况将持续1万亿年，也许更长。可能质量最低的红矮星能持续10万亿年，但是在这里10倍并不是一个太重要的数字。在宇宙悠长的生命历程中，它们只是一些统计上的小小起伏。<p></p><p><b>3. 简并纪元</b></p><p></p><figure><noscript><img src=\"https://pic3.zhimg.com/12038e1f2efb0393806cd3687c4d4fa2_b.png\" width=\"85\"></noscript><img src=\"https://pic3.zhimg.com/80/12038e1f2efb0393806cd3687c4d4fa2_hd.png\" width=\"85\"></figure>当最后一颗恒星熄灭，宇宙中释放能量的就只有恒星的遗骸：白矮星，中子星和黑洞。另外，还有一些棕矮星，它们的质量在恒星和行星之间。除了黑洞，白矮星和中子星都是由各种简并压力支撑，也就是说，在几万亿年以后，恒星纪元将会结束。简并纪元来临了。<br><figure><noscript><img src=\"https://pic1.zhimg.com/40147aa82ccaf355a566f5c82aad8a50_b.png\" width=\"720\"></noscript><img src=\"https://pic1.zhimg.com/80/40147aa82ccaf355a566f5c82aad8a50_hd.png\" width=\"720\"></figure><br>宇宙将会变得十分黑暗，至少对人类的眼睛是如此，如果那时候还有人类的话。如果我们可以看到红外线，宇宙会明亮一些。这些天体还是比较温暖的，所以会有多多少少的红外辐射。中子星和白矮星诞生时非常热，然后慢慢冷却。冷却的速度和它们的大小有关，但是在几万亿年后，它们应该都会降到室温。所以，在简并纪元里，随着时间的流逝，宇宙慢慢变冷。<p></p><p>但是，这个纪元中也会有昙花一现的光明。在孤寂的宇宙中联袂起舞的白矮双星最终会走到一起。经过数万亿年，白矮双星的轨道将会由于引力波能量辐射而衰减（<a href=\"https://www.zhihu.com/question/39442703/answer/82388868\">引力波的「直接」观测为什么很难？ - Mandelbrot 的回答</a>），双星在合并的刹那爆发出夺目的光彩，成为超新星。同样，中子双星也会合并，爆发，形成伽马射线暴，它们的亮度将超过1000个星系。但是，这只是短暂的事件，宇宙很快回归黑暗。<br></p><figure><noscript><img src=\"https://pic1.zhimg.com/e6d4ad453d0b534177fa3a07375619f4_b.png\" width=\"840\"></noscript><img src=\"https://pic1.zhimg.com/80/e6d4ad453d0b534177fa3a07375619f4_hd.png\" width=\"840\"></figure><br>有趣的是，棕矮星是更好地能量来源。棕矮双星会合并形成低质量的恒星，然后在几百亿年中为黑暗的宇宙带来一点光明。<p></p><p>但是，在时间面前，没有任何东西可以保持到永恒。不但对于宇宙和恒星是如此，对于微观世界中的质子也是如此。质子的半衰期是10^34年，也许更长。当质子开始衰变，物质将会分解，白矮星，中子星，棕矮星，行星，都会消融在空间中。不过，值得欣慰的是，这个过程有一个亮点。白矮星分解的时候会释放能量，功率可达400瓦（微波炉功率的一小半）。</p><p><i>注：白矮星此时应该已经完全冷却，成为黑矮星了</i></p><p><b>4. 黑洞纪元</b></p><p></p><figure><noscript><img src=\"https://pic1.zhimg.com/650ba6463fc816a622f710e8da3e38a4_b.png\" width=\"91\"></noscript><img src=\"https://pic1.zhimg.com/80/650ba6463fc816a622f710e8da3e38a4_hd.png\" width=\"91\"></figure>在10^40年以后，最后一颗简并天体也消失了，宇宙中只剩下了黑洞这一种天体。<p></p><p>宇宙进入了黑洞纪元。</p><p>在我们的印象中，黑洞是吞噬一切的无底洞。然而，黑洞可以同过一种方式产生能量 ——蒸发。20世纪70年代，史蒂芬 霍金用量子力学研究黑洞，发现黑洞确实会向外辐射能量，从而损失质量。越大的黑洞损失质量越慢。一个3倍太阳质量的黑洞（通过超新星诞生的最小黑洞），完全蒸发需要10^68年。这是一个长得近乎荒谬的时间，但是宇宙可以等待。而星系中心的黑洞要完全蒸发，需要10^92年。1后面92个0，就是下面这个数字。<br></p><figure><noscript><img src=\"https://pic4.zhimg.com/dc006e9e1d1060f30c12f921ce4a0737_b.png\" width=\"555\"></noscript><img src=\"https://pic4.zhimg.com/80/dc006e9e1d1060f30c12f921ce4a0737_hd.png\" width=\"555\"></figure><br>这个数字如此之大，我们甚至无法找到一个东西来进行类比，因为它甚至大于已知宇宙中的基本粒子的个数（10^85）。<p></p><p>当黑洞质量变小，它的蒸发速度就会加快。最后，黑洞会在一道闪光之后消失的无影无踪。这是黑洞纪元唯一的光。</p><p><b>5. 黑暗纪元</b></p><p></p><figure><noscript><img src=\"https://pic4.zhimg.com/aeeec54b0018442ba87aa1a97ec37093_b.png\" width=\"79\"></noscript><img src=\"https://pic4.zhimg.com/80/aeeec54b0018442ba87aa1a97ec37093_hd.png\" width=\"79\"></figure>最后，一切的消失了。宇宙中只剩小了能量极低的亚原子粒子和光子。这是10^92到10^93年以后。这是，我们可以有把握地说，宇宙已经死了。<p></p><p>宇宙进入了黑暗纪元。如果时间还有意义的话，这个纪元将会延续到无穷。</p><p><b>6. 其他可能的结局</b></p><p>如果暗能量按照现在推测的那样持续增强，宇宙将走向另一个结局：大撕裂。在这个结局中，没有任何力量可以对抗空间膨胀，所有的物质都会瓦解，连原子都会被撕成碎片。大撕裂将会在黑暗纪元以前发生，但是这个结局并不比黑暗纪元更加光明。</p><p>最后，我们还有一个非常微小的希望可以得到一个光明的新宇宙。量子物理中有一个猜想，也许我们的真空并不是一个最低能量状态。就像你站在一个台阶上，而你下面还有一级台阶。</p><p></p><figure><noscript><img src=\"https://pic3.zhimg.com/8ca6290ce51e0f5ca0b758a7ee8cdfb6_b.png\" width=\"1062\"></noscript><img src=\"https://pic3.zhimg.com/80/8ca6290ce51e0f5ca0b758a7ee8cdfb6_hd.png\" width=\"1062\"></figure><br>当宇宙在黑暗纪元中沉睡无数年以后，也许一小片空间因为不管什么原因，跌落到下一个能级——真正的真空。它会带动周围的空间纷纷跌落。这时，奇怪的事情发生了，在这些跌落的空间中，物理定律将被重写，时间和空间将被抹去。这个区域迅速扩展，留下的地方是一个新的宇宙。也许这也是我们的宇宙的来源。<p></p>这个猜想给了我们一个新宇宙的希望。这个希望虽然渺茫，但是有一丝希望，也好过在黑暗和寒冷中沉睡到无穷。</div><p><br></p>', '0', '5', '2018-10-12 16:27:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '用户01', '用户01昵称', '123', '123@qq.com', '男', '/photo_test01.jpg', '2018-09-10 11:26:59');
INSERT INTO `user` VALUES ('4', '佣金01', '佣金01', '123', '12301@213', '男', '\\佣金01/slide04.jpg', '2018-09-17 14:45:21');
INSERT INTO `user` VALUES ('6', '天上星河', '天上星河', '123', '12301@213', '女', '\\天上星河/slide04.jpg', '2018-09-18 10:54:36');
INSERT INTO `user` VALUES ('14', '佣金02', '用户1111297', '123', '1@123', '男', 'photo_test01.jpg', '2018-10-09 09:07:13');
INSERT INTO `user` VALUES ('15', '天上星河01', '用户117358', '123', '12301@213', '男', '\\天上星河01/v2-03e002bf0c8ece525294a75d3680770c_hd.jpg', '2018-10-09 09:09:12');
