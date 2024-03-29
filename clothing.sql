/*
 Navicat Premium Data Transfer

 Source Server         : haijiang.li
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : clothing

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 12/07/2020 02:22:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_attention
-- ----------------------------
DROP TABLE IF EXISTS `act_attention`;
CREATE TABLE `act_attention` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `organize_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_attention
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_banner
-- ----------------------------
DROP TABLE IF EXISTS `act_banner`;
CREATE TABLE `act_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `img` varchar(500) DEFAULT NULL COMMENT '图片',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（0：启用，1、禁用）',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- ----------------------------
-- Records of act_banner
-- ----------------------------
BEGIN;
INSERT INTO `act_banner` VALUES (1, '图片1', '/uploads/20200520/feab2eab700ccd8645ee125e7290889a.jpg', '35', 1, 1);
INSERT INTO `act_banner` VALUES (2, '图片2', '/uploads/20200520/2dc4535902a34ab685673a4d9e2137b4.png', '36', 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for act_city
-- ----------------------------
DROP TABLE IF EXISTS `act_city`;
CREATE TABLE `act_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父id',
  `name` varchar(255) DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_city
-- ----------------------------
BEGIN;
INSERT INTO `act_city` VALUES (1, 1, '北京市');
INSERT INTO `act_city` VALUES (2, 347, '石家庄市');
INSERT INTO `act_city` VALUES (3, 347, '唐山市');
INSERT INTO `act_city` VALUES (4, 347, '秦皇岛市');
INSERT INTO `act_city` VALUES (5, 347, '邯郸市');
INSERT INTO `act_city` VALUES (6, 347, '邢台市');
INSERT INTO `act_city` VALUES (7, 347, '保定市');
INSERT INTO `act_city` VALUES (8, 347, '张家口市');
INSERT INTO `act_city` VALUES (9, 347, '承德市');
INSERT INTO `act_city` VALUES (10, 347, '沧州市');
INSERT INTO `act_city` VALUES (11, 347, '廊坊市');
INSERT INTO `act_city` VALUES (12, 347, '衡水市');
INSERT INTO `act_city` VALUES (13, 348, '太原市');
INSERT INTO `act_city` VALUES (14, 348, '大同市');
INSERT INTO `act_city` VALUES (15, 348, '阳泉市');
INSERT INTO `act_city` VALUES (16, 348, '长治市');
INSERT INTO `act_city` VALUES (17, 348, '晋城市');
INSERT INTO `act_city` VALUES (18, 348, '朔州市');
INSERT INTO `act_city` VALUES (19, 348, '晋中市');
INSERT INTO `act_city` VALUES (20, 348, '运城市');
INSERT INTO `act_city` VALUES (21, 348, '忻州市');
INSERT INTO `act_city` VALUES (22, 348, '临汾市');
INSERT INTO `act_city` VALUES (23, 348, '吕梁市');
INSERT INTO `act_city` VALUES (24, 349, '呼和浩特市');
INSERT INTO `act_city` VALUES (25, 349, '包头市');
INSERT INTO `act_city` VALUES (26, 349, '乌海市');
INSERT INTO `act_city` VALUES (27, 349, '赤峰市');
INSERT INTO `act_city` VALUES (28, 349, '通辽市');
INSERT INTO `act_city` VALUES (29, 349, '鄂尔多斯市');
INSERT INTO `act_city` VALUES (30, 349, '呼伦贝尔市');
INSERT INTO `act_city` VALUES (31, 349, '巴彦淖尔市');
INSERT INTO `act_city` VALUES (32, 349, '乌兰察布市');
INSERT INTO `act_city` VALUES (33, 349, '兴安盟');
INSERT INTO `act_city` VALUES (34, 349, '锡林郭勒盟');
INSERT INTO `act_city` VALUES (35, 349, '阿拉善盟');
INSERT INTO `act_city` VALUES (36, 350, '沈阳市');
INSERT INTO `act_city` VALUES (37, 350, '大连市');
INSERT INTO `act_city` VALUES (38, 350, '鞍山市');
INSERT INTO `act_city` VALUES (39, 350, '抚顺市');
INSERT INTO `act_city` VALUES (40, 350, '本溪市');
INSERT INTO `act_city` VALUES (41, 350, '丹东市');
INSERT INTO `act_city` VALUES (42, 350, '锦州市');
INSERT INTO `act_city` VALUES (43, 350, '营口市');
INSERT INTO `act_city` VALUES (44, 350, '阜新市');
INSERT INTO `act_city` VALUES (45, 350, '辽阳市');
INSERT INTO `act_city` VALUES (46, 350, '盘锦市');
INSERT INTO `act_city` VALUES (47, 350, '铁岭市');
INSERT INTO `act_city` VALUES (48, 350, '朝阳市');
INSERT INTO `act_city` VALUES (49, 350, '葫芦岛市');
INSERT INTO `act_city` VALUES (50, 351, '长春市');
INSERT INTO `act_city` VALUES (51, 351, '吉林市');
INSERT INTO `act_city` VALUES (52, 351, '四平市');
INSERT INTO `act_city` VALUES (53, 351, '辽源市');
INSERT INTO `act_city` VALUES (54, 351, '通化市');
INSERT INTO `act_city` VALUES (55, 351, '白山市');
INSERT INTO `act_city` VALUES (56, 351, '松原市');
INSERT INTO `act_city` VALUES (57, 351, '白城市');
INSERT INTO `act_city` VALUES (58, 351, '延边朝鲜族自治州');
INSERT INTO `act_city` VALUES (59, 352, '哈尔滨市');
INSERT INTO `act_city` VALUES (60, 352, '齐齐哈尔市');
INSERT INTO `act_city` VALUES (61, 352, '鸡西市');
INSERT INTO `act_city` VALUES (62, 352, '鹤岗市');
INSERT INTO `act_city` VALUES (63, 352, '双鸭山市');
INSERT INTO `act_city` VALUES (64, 352, '大庆市');
INSERT INTO `act_city` VALUES (65, 352, '伊春市');
INSERT INTO `act_city` VALUES (66, 352, '佳木斯市');
INSERT INTO `act_city` VALUES (67, 352, '七台河市');
INSERT INTO `act_city` VALUES (68, 352, '牡丹江市');
INSERT INTO `act_city` VALUES (69, 352, '黑河市');
INSERT INTO `act_city` VALUES (70, 352, '绥化市');
INSERT INTO `act_city` VALUES (71, 352, '大兴安岭地区');
INSERT INTO `act_city` VALUES (74, 354, '南京市');
INSERT INTO `act_city` VALUES (75, 354, '无锡市');
INSERT INTO `act_city` VALUES (76, 354, '徐州市');
INSERT INTO `act_city` VALUES (77, 354, '常州市');
INSERT INTO `act_city` VALUES (78, 354, '苏州市');
INSERT INTO `act_city` VALUES (79, 354, '南通市');
INSERT INTO `act_city` VALUES (80, 354, '连云港市');
INSERT INTO `act_city` VALUES (81, 354, '淮安市');
INSERT INTO `act_city` VALUES (82, 354, '盐城市');
INSERT INTO `act_city` VALUES (83, 354, '扬州市');
INSERT INTO `act_city` VALUES (84, 354, '镇江市');
INSERT INTO `act_city` VALUES (85, 354, '泰州市');
INSERT INTO `act_city` VALUES (86, 354, '宿迁市');
INSERT INTO `act_city` VALUES (87, 355, '杭州市');
INSERT INTO `act_city` VALUES (88, 355, '宁波市');
INSERT INTO `act_city` VALUES (89, 355, '温州市');
INSERT INTO `act_city` VALUES (90, 355, '嘉兴市');
INSERT INTO `act_city` VALUES (91, 355, '湖州市');
INSERT INTO `act_city` VALUES (92, 355, '绍兴市');
INSERT INTO `act_city` VALUES (93, 355, '金华市');
INSERT INTO `act_city` VALUES (94, 355, '衢州市');
INSERT INTO `act_city` VALUES (95, 355, '舟山市');
INSERT INTO `act_city` VALUES (96, 355, '台州市');
INSERT INTO `act_city` VALUES (97, 355, '丽水市');
INSERT INTO `act_city` VALUES (98, 356, '合肥市');
INSERT INTO `act_city` VALUES (99, 356, '芜湖市');
INSERT INTO `act_city` VALUES (100, 356, '蚌埠市');
INSERT INTO `act_city` VALUES (101, 356, '淮南市');
INSERT INTO `act_city` VALUES (102, 356, '马鞍山市');
INSERT INTO `act_city` VALUES (103, 356, '淮北市');
INSERT INTO `act_city` VALUES (104, 356, '铜陵市');
INSERT INTO `act_city` VALUES (105, 356, '安庆市');
INSERT INTO `act_city` VALUES (106, 356, '黄山市');
INSERT INTO `act_city` VALUES (107, 356, '滁州市');
INSERT INTO `act_city` VALUES (108, 356, '阜阳市');
INSERT INTO `act_city` VALUES (109, 356, '宿州市');
INSERT INTO `act_city` VALUES (110, 356, '巢湖市');
INSERT INTO `act_city` VALUES (111, 356, '六安市');
INSERT INTO `act_city` VALUES (112, 356, '亳州市');
INSERT INTO `act_city` VALUES (113, 356, '池州市');
INSERT INTO `act_city` VALUES (114, 356, '宣城市');
INSERT INTO `act_city` VALUES (115, 357, '福州市');
INSERT INTO `act_city` VALUES (116, 357, '厦门市');
INSERT INTO `act_city` VALUES (117, 357, '莆田市');
INSERT INTO `act_city` VALUES (118, 357, '三明市');
INSERT INTO `act_city` VALUES (119, 357, '泉州市');
INSERT INTO `act_city` VALUES (120, 357, '漳州市');
INSERT INTO `act_city` VALUES (121, 357, '南平市');
INSERT INTO `act_city` VALUES (122, 357, '龙岩市');
INSERT INTO `act_city` VALUES (123, 357, '宁德市');
INSERT INTO `act_city` VALUES (124, 358, '南昌市');
INSERT INTO `act_city` VALUES (125, 358, '景德镇市');
INSERT INTO `act_city` VALUES (126, 358, '萍乡市');
INSERT INTO `act_city` VALUES (127, 358, '九江市');
INSERT INTO `act_city` VALUES (128, 358, '新余市');
INSERT INTO `act_city` VALUES (129, 358, '鹰潭市');
INSERT INTO `act_city` VALUES (130, 358, '赣州市');
INSERT INTO `act_city` VALUES (131, 358, '吉安市');
INSERT INTO `act_city` VALUES (132, 358, '宜春市');
INSERT INTO `act_city` VALUES (133, 358, '抚州市');
INSERT INTO `act_city` VALUES (134, 358, '上饶市');
INSERT INTO `act_city` VALUES (135, 359, '济南市');
INSERT INTO `act_city` VALUES (136, 359, '青岛市');
INSERT INTO `act_city` VALUES (137, 359, '淄博市');
INSERT INTO `act_city` VALUES (138, 359, '枣庄市');
INSERT INTO `act_city` VALUES (139, 359, '东营市');
INSERT INTO `act_city` VALUES (140, 359, '烟台市');
INSERT INTO `act_city` VALUES (141, 359, '潍坊市');
INSERT INTO `act_city` VALUES (142, 359, '济宁市');
INSERT INTO `act_city` VALUES (143, 359, '泰安市');
INSERT INTO `act_city` VALUES (144, 359, '威海市');
INSERT INTO `act_city` VALUES (145, 359, '日照市');
INSERT INTO `act_city` VALUES (146, 359, '莱芜市');
INSERT INTO `act_city` VALUES (147, 359, '临沂市');
INSERT INTO `act_city` VALUES (148, 359, '德州市');
INSERT INTO `act_city` VALUES (149, 359, '聊城市');
INSERT INTO `act_city` VALUES (150, 359, '滨州市');
INSERT INTO `act_city` VALUES (151, 359, '菏泽市');
INSERT INTO `act_city` VALUES (152, 360, '郑州市');
INSERT INTO `act_city` VALUES (153, 360, '开封市');
INSERT INTO `act_city` VALUES (154, 360, '洛阳市');
INSERT INTO `act_city` VALUES (155, 360, '平顶山市');
INSERT INTO `act_city` VALUES (156, 360, '安阳市');
INSERT INTO `act_city` VALUES (157, 360, '鹤壁市');
INSERT INTO `act_city` VALUES (158, 360, '新乡市');
INSERT INTO `act_city` VALUES (159, 360, '焦作市');
INSERT INTO `act_city` VALUES (160, 360, '濮阳市');
INSERT INTO `act_city` VALUES (161, 360, '许昌市');
INSERT INTO `act_city` VALUES (162, 360, '漯河市');
INSERT INTO `act_city` VALUES (163, 360, '三门峡市');
INSERT INTO `act_city` VALUES (164, 360, '南阳市');
INSERT INTO `act_city` VALUES (165, 360, '商丘市');
INSERT INTO `act_city` VALUES (166, 360, '信阳市');
INSERT INTO `act_city` VALUES (167, 360, '周口市');
INSERT INTO `act_city` VALUES (168, 360, '驻马店市');
INSERT INTO `act_city` VALUES (169, 361, '武汉市');
INSERT INTO `act_city` VALUES (170, 361, '黄石市');
INSERT INTO `act_city` VALUES (171, 361, '十堰市');
INSERT INTO `act_city` VALUES (172, 361, '宜昌市');
INSERT INTO `act_city` VALUES (173, 361, '襄樊市');
INSERT INTO `act_city` VALUES (174, 361, '鄂州市');
INSERT INTO `act_city` VALUES (175, 361, '荆门市');
INSERT INTO `act_city` VALUES (176, 361, '孝感市');
INSERT INTO `act_city` VALUES (177, 361, '荆州市');
INSERT INTO `act_city` VALUES (178, 361, '黄冈市');
INSERT INTO `act_city` VALUES (179, 361, '咸宁市');
INSERT INTO `act_city` VALUES (180, 361, '随州市');
INSERT INTO `act_city` VALUES (181, 361, '恩施土家族苗族自治州');
INSERT INTO `act_city` VALUES (183, 362, '长沙市');
INSERT INTO `act_city` VALUES (184, 362, '株洲市');
INSERT INTO `act_city` VALUES (185, 362, '湘潭市');
INSERT INTO `act_city` VALUES (186, 362, '衡阳市');
INSERT INTO `act_city` VALUES (187, 362, '邵阳市');
INSERT INTO `act_city` VALUES (188, 362, '岳阳市');
INSERT INTO `act_city` VALUES (189, 362, '常德市');
INSERT INTO `act_city` VALUES (190, 362, '张家界市');
INSERT INTO `act_city` VALUES (191, 362, '益阳市');
INSERT INTO `act_city` VALUES (192, 362, '郴州市');
INSERT INTO `act_city` VALUES (193, 362, '永州市');
INSERT INTO `act_city` VALUES (194, 362, '怀化市');
INSERT INTO `act_city` VALUES (195, 362, '娄底市');
INSERT INTO `act_city` VALUES (196, 362, '湘西土家族苗族自治州');
INSERT INTO `act_city` VALUES (197, 363, '广州市');
INSERT INTO `act_city` VALUES (198, 363, '韶关市');
INSERT INTO `act_city` VALUES (199, 363, '深圳市');
INSERT INTO `act_city` VALUES (200, 363, '珠海市');
INSERT INTO `act_city` VALUES (201, 363, '汕头市');
INSERT INTO `act_city` VALUES (202, 363, '佛山市');
INSERT INTO `act_city` VALUES (203, 363, '江门市');
INSERT INTO `act_city` VALUES (204, 363, '湛江市');
INSERT INTO `act_city` VALUES (205, 363, '茂名市');
INSERT INTO `act_city` VALUES (206, 363, '肇庆市');
INSERT INTO `act_city` VALUES (207, 363, '惠州市');
INSERT INTO `act_city` VALUES (208, 363, '梅州市');
INSERT INTO `act_city` VALUES (209, 363, '汕尾市');
INSERT INTO `act_city` VALUES (210, 363, '河源市');
INSERT INTO `act_city` VALUES (211, 363, '阳江市');
INSERT INTO `act_city` VALUES (212, 363, '清远市');
INSERT INTO `act_city` VALUES (213, 363, '东莞市');
INSERT INTO `act_city` VALUES (214, 363, '中山市');
INSERT INTO `act_city` VALUES (215, 363, '潮州市');
INSERT INTO `act_city` VALUES (216, 363, '揭阳市');
INSERT INTO `act_city` VALUES (217, 363, '云浮市');
INSERT INTO `act_city` VALUES (218, 364, '南宁市');
INSERT INTO `act_city` VALUES (219, 364, '柳州市');
INSERT INTO `act_city` VALUES (220, 364, '桂林市');
INSERT INTO `act_city` VALUES (221, 364, '梧州市');
INSERT INTO `act_city` VALUES (222, 364, '北海市');
INSERT INTO `act_city` VALUES (223, 364, '防城港市');
INSERT INTO `act_city` VALUES (224, 364, '钦州市');
INSERT INTO `act_city` VALUES (225, 364, '贵港市');
INSERT INTO `act_city` VALUES (226, 364, '玉林市');
INSERT INTO `act_city` VALUES (227, 364, '百色市');
INSERT INTO `act_city` VALUES (228, 364, '贺州市');
INSERT INTO `act_city` VALUES (229, 364, '河池市');
INSERT INTO `act_city` VALUES (230, 364, '来宾市');
INSERT INTO `act_city` VALUES (231, 364, '崇左市');
INSERT INTO `act_city` VALUES (232, 365, '海口市');
INSERT INTO `act_city` VALUES (233, 365, '三亚市');
INSERT INTO `act_city` VALUES (237, 237, '重庆市');
INSERT INTO `act_city` VALUES (238, 367, '成都市');
INSERT INTO `act_city` VALUES (239, 367, '自贡市');
INSERT INTO `act_city` VALUES (240, 367, '攀枝花市');
INSERT INTO `act_city` VALUES (241, 367, '泸州市');
INSERT INTO `act_city` VALUES (242, 367, '德阳市');
INSERT INTO `act_city` VALUES (243, 367, '绵阳市');
INSERT INTO `act_city` VALUES (244, 367, '广元市');
INSERT INTO `act_city` VALUES (245, 367, '遂宁市');
INSERT INTO `act_city` VALUES (246, 367, '内江市');
INSERT INTO `act_city` VALUES (247, 367, '乐山市');
INSERT INTO `act_city` VALUES (248, 367, '南充市');
INSERT INTO `act_city` VALUES (249, 367, '眉山市');
INSERT INTO `act_city` VALUES (250, 367, '宜宾市');
INSERT INTO `act_city` VALUES (251, 367, '广安市');
INSERT INTO `act_city` VALUES (252, 367, '达州市');
INSERT INTO `act_city` VALUES (253, 367, '雅安市');
INSERT INTO `act_city` VALUES (254, 367, '巴中市');
INSERT INTO `act_city` VALUES (255, 367, '资阳市');
INSERT INTO `act_city` VALUES (256, 367, '阿坝藏族羌族自治州');
INSERT INTO `act_city` VALUES (257, 367, '甘孜藏族自治州');
INSERT INTO `act_city` VALUES (258, 367, '凉山彝族自治州');
INSERT INTO `act_city` VALUES (259, 368, '贵阳市');
INSERT INTO `act_city` VALUES (260, 368, '六盘水市');
INSERT INTO `act_city` VALUES (261, 368, '遵义市');
INSERT INTO `act_city` VALUES (262, 368, '安顺市');
INSERT INTO `act_city` VALUES (263, 368, '铜仁地区');
INSERT INTO `act_city` VALUES (264, 368, '黔西南布依族苗族自治州');
INSERT INTO `act_city` VALUES (265, 368, '毕节地区');
INSERT INTO `act_city` VALUES (266, 368, '黔东南苗族侗族自治州');
INSERT INTO `act_city` VALUES (267, 368, '黔南布依族苗族自治州');
INSERT INTO `act_city` VALUES (268, 369, '昆明市');
INSERT INTO `act_city` VALUES (269, 369, '曲靖市');
INSERT INTO `act_city` VALUES (270, 369, '玉溪市');
INSERT INTO `act_city` VALUES (271, 369, '保山市');
INSERT INTO `act_city` VALUES (272, 369, '昭通市');
INSERT INTO `act_city` VALUES (273, 369, '丽江市');
INSERT INTO `act_city` VALUES (274, 369, '普洱市');
INSERT INTO `act_city` VALUES (275, 369, '临沧市');
INSERT INTO `act_city` VALUES (276, 369, '楚雄彝族自治州');
INSERT INTO `act_city` VALUES (277, 369, '红河哈尼族彝族自治州');
INSERT INTO `act_city` VALUES (278, 369, '文山壮族苗族自治州');
INSERT INTO `act_city` VALUES (279, 369, '西双版纳傣族自治州');
INSERT INTO `act_city` VALUES (280, 369, '大理白族自治州');
INSERT INTO `act_city` VALUES (281, 369, '德宏傣族景颇族自治州');
INSERT INTO `act_city` VALUES (282, 369, '怒江傈僳族自治州');
INSERT INTO `act_city` VALUES (283, 369, '迪庆藏族自治州');
INSERT INTO `act_city` VALUES (284, 370, '拉萨市');
INSERT INTO `act_city` VALUES (285, 370, '昌都地区');
INSERT INTO `act_city` VALUES (286, 370, '山南地区');
INSERT INTO `act_city` VALUES (287, 370, '日喀则地区');
INSERT INTO `act_city` VALUES (288, 370, '那曲地区');
INSERT INTO `act_city` VALUES (289, 370, '阿里地区');
INSERT INTO `act_city` VALUES (290, 370, '林芝地区');
INSERT INTO `act_city` VALUES (291, 371, '西安市');
INSERT INTO `act_city` VALUES (292, 371, '铜川市');
INSERT INTO `act_city` VALUES (293, 371, '宝鸡市');
INSERT INTO `act_city` VALUES (294, 371, '咸阳市');
INSERT INTO `act_city` VALUES (295, 371, '渭南市');
INSERT INTO `act_city` VALUES (296, 371, '延安市');
INSERT INTO `act_city` VALUES (297, 371, '汉中市');
INSERT INTO `act_city` VALUES (298, 371, '榆林市');
INSERT INTO `act_city` VALUES (299, 371, '安康市');
INSERT INTO `act_city` VALUES (300, 371, '商洛市');
INSERT INTO `act_city` VALUES (301, 372, '兰州市');
INSERT INTO `act_city` VALUES (302, 372, '嘉峪关市');
INSERT INTO `act_city` VALUES (303, 372, '金昌市');
INSERT INTO `act_city` VALUES (304, 372, '白银市');
INSERT INTO `act_city` VALUES (305, 372, '天水市');
INSERT INTO `act_city` VALUES (306, 372, '武威市');
INSERT INTO `act_city` VALUES (307, 372, '张掖市');
INSERT INTO `act_city` VALUES (308, 372, '平凉市');
INSERT INTO `act_city` VALUES (309, 372, '酒泉市');
INSERT INTO `act_city` VALUES (310, 372, '庆阳市');
INSERT INTO `act_city` VALUES (311, 372, '定西市');
INSERT INTO `act_city` VALUES (312, 372, '陇南市');
INSERT INTO `act_city` VALUES (313, 372, '临夏回族自治州');
INSERT INTO `act_city` VALUES (314, 372, '甘南藏族自治州');
INSERT INTO `act_city` VALUES (315, 373, '西宁市');
INSERT INTO `act_city` VALUES (316, 373, '海东地区');
INSERT INTO `act_city` VALUES (317, 373, '海北藏族自治州');
INSERT INTO `act_city` VALUES (318, 373, '黄南藏族自治州');
INSERT INTO `act_city` VALUES (319, 373, '海南藏族自治州');
INSERT INTO `act_city` VALUES (320, 373, '果洛藏族自治州');
INSERT INTO `act_city` VALUES (321, 373, '玉树藏族自治州');
INSERT INTO `act_city` VALUES (322, 373, '海西蒙古族藏族自治州');
INSERT INTO `act_city` VALUES (323, 374, '银川市');
INSERT INTO `act_city` VALUES (324, 374, '石嘴山市');
INSERT INTO `act_city` VALUES (325, 374, '吴忠市');
INSERT INTO `act_city` VALUES (326, 374, '固原市');
INSERT INTO `act_city` VALUES (327, 374, '中卫市');
INSERT INTO `act_city` VALUES (328, 375, '乌鲁木齐市');
INSERT INTO `act_city` VALUES (329, 375, '克拉玛依市');
INSERT INTO `act_city` VALUES (330, 375, '吐鲁番地区');
INSERT INTO `act_city` VALUES (331, 375, '哈密地区');
INSERT INTO `act_city` VALUES (332, 375, '昌吉回族自治州');
INSERT INTO `act_city` VALUES (333, 375, '博尔塔拉蒙古自治州');
INSERT INTO `act_city` VALUES (334, 375, '巴音郭楞蒙古自治州');
INSERT INTO `act_city` VALUES (335, 375, '阿克苏地区');
INSERT INTO `act_city` VALUES (336, 375, '克孜勒苏柯尔克孜自治州');
INSERT INTO `act_city` VALUES (337, 375, '喀什地区');
INSERT INTO `act_city` VALUES (338, 375, '和田地区');
INSERT INTO `act_city` VALUES (339, 375, '伊犁哈萨克自治州');
INSERT INTO `act_city` VALUES (340, 375, '塔城地区');
INSERT INTO `act_city` VALUES (341, 375, '阿勒泰地区');
INSERT INTO `act_city` VALUES (343, 343, '天津市');
INSERT INTO `act_city` VALUES (344, 344, '上海市');
INSERT INTO `act_city` VALUES (347, 347, '河北省');
INSERT INTO `act_city` VALUES (348, 348, '山西省');
INSERT INTO `act_city` VALUES (349, 349, '内蒙古自治区');
INSERT INTO `act_city` VALUES (350, 350, '辽宁省');
INSERT INTO `act_city` VALUES (351, 351, '吉林省');
INSERT INTO `act_city` VALUES (352, 352, '黑龙江省');
INSERT INTO `act_city` VALUES (354, 354, '江苏省');
INSERT INTO `act_city` VALUES (355, 355, '浙江省');
INSERT INTO `act_city` VALUES (356, 356, '安徽省');
INSERT INTO `act_city` VALUES (357, 357, '福建省');
INSERT INTO `act_city` VALUES (358, 358, '江西省');
INSERT INTO `act_city` VALUES (359, 359, '山东省');
INSERT INTO `act_city` VALUES (360, 360, '河南省');
INSERT INTO `act_city` VALUES (361, 361, '湖北省');
INSERT INTO `act_city` VALUES (362, 362, '湖南省');
INSERT INTO `act_city` VALUES (363, 363, '广东省');
INSERT INTO `act_city` VALUES (364, 364, '广西壮族自治区');
INSERT INTO `act_city` VALUES (365, 365, '海南省');
INSERT INTO `act_city` VALUES (367, 367, '四川省');
INSERT INTO `act_city` VALUES (368, 368, '贵州省');
INSERT INTO `act_city` VALUES (369, 369, '云南省');
INSERT INTO `act_city` VALUES (370, 370, '西藏自治区');
INSERT INTO `act_city` VALUES (371, 371, '陕西省');
INSERT INTO `act_city` VALUES (372, 372, '甘肃省');
INSERT INTO `act_city` VALUES (373, 373, '青海省');
INSERT INTO `act_city` VALUES (374, 374, '宁夏回族自治区');
INSERT INTO `act_city` VALUES (375, 375, '新疆维吾尔自治区');
COMMIT;

-- ----------------------------
-- Table structure for act_collection
-- ----------------------------
DROP TABLE IF EXISTS `act_collection`;
CREATE TABLE `act_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `serve_id` int(11) DEFAULT NULL COMMENT '服务id',
  `create_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of act_collection
-- ----------------------------
BEGIN;
INSERT INTO `act_collection` VALUES (1, 24, 4, 1594089632);
COMMIT;

-- ----------------------------
-- Table structure for act_feedback
-- ----------------------------
DROP TABLE IF EXISTS `act_feedback`;
CREATE TABLE `act_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT 'uid',
  `content` varchar(255) DEFAULT NULL COMMENT '反馈内容',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='建议与反馈';

-- ----------------------------
-- Records of act_feedback
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_hot_country
-- ----------------------------
DROP TABLE IF EXISTS `act_hot_country`;
CREATE TABLE `act_hot_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityCode` varchar(255) DEFAULT NULL COMMENT '城市编码',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `sort` int(255) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_hot_country
-- ----------------------------
BEGIN;
INSERT INTO `act_hot_country` VALUES (1, '100000001', '美国', 0);
INSERT INTO `act_hot_country` VALUES (2, '100000002', '马来西亚', 0);
INSERT INTO `act_hot_country` VALUES (3, '100000003', '印度', 0);
INSERT INTO `act_hot_country` VALUES (4, '100000004', '泰国', 0);
INSERT INTO `act_hot_country` VALUES (5, '100000005', '缅甸', 0);
INSERT INTO `act_hot_country` VALUES (6, '100000006', '巴塞尔', 3);
INSERT INTO `act_hot_country` VALUES (7, '100000007', '罗马', 0);
INSERT INTO `act_hot_country` VALUES (8, '100000008', '悉尼', 2);
INSERT INTO `act_hot_country` VALUES (10, '10000010', '罗马尼西亚啊', 0);
COMMIT;

-- ----------------------------
-- Table structure for act_industry
-- ----------------------------
DROP TABLE IF EXISTS `act_industry`;
CREATE TABLE `act_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `sort` int(255) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_industry
-- ----------------------------
BEGIN;
INSERT INTO `act_industry` VALUES (1, '工人', 5);
INSERT INTO `act_industry` VALUES (2, '销售', 0);
INSERT INTO `act_industry` VALUES (3, 'SEO', 0);
INSERT INTO `act_industry` VALUES (4, 'UI', 0);
INSERT INTO `act_industry` VALUES (5, 'SEM', 10);
INSERT INTO `act_industry` VALUES (6, 'Ruby', 0);
INSERT INTO `act_industry` VALUES (7, '测试', 100);
COMMIT;

-- ----------------------------
-- Table structure for act_info
-- ----------------------------
DROP TABLE IF EXISTS `act_info`;
CREATE TABLE `act_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号',
  `email` varchar(255) DEFAULT NULL COMMENT 'E-mail',
  `industry` varchar(255) DEFAULT NULL COMMENT '行业',
  `position` varchar(255) DEFAULT NULL COMMENT '职务',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL COMMENT 'user Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_info
-- ----------------------------
BEGIN;
INSERT INTO `act_info` VALUES (1, '铝合金', '17777777777', 'li@qq.com', '工人', '', '', 24);
COMMIT;

-- ----------------------------
-- Table structure for act_join
-- ----------------------------
DROP TABLE IF EXISTS `act_join`;
CREATE TABLE `act_join` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `serve_id` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_join
-- ----------------------------
BEGIN;
INSERT INTO `act_join` VALUES (1, 24, 55, 1594485805);
COMMIT;

-- ----------------------------
-- Table structure for act_organize
-- ----------------------------
DROP TABLE IF EXISTS `act_organize`;
CREATE TABLE `act_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `desc` text,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_organize
-- ----------------------------
BEGIN;
INSERT INTO `act_organize` VALUES (1, '海天黄豆酱', '/uploads/20200621/635c9853040f571b919e28f0be4ace4b.jpg', '1.首先我们来思考下,如果判断数组是一维数组: if(count($array) == count($array, 1)){ echo \'我是一维数组\'; }else{ echo \'我不是一维数组\'; }\n2.然后,我们可以想到使用foreach循环的方式来判断: (1)全部子元素是一维数组,则该数组为二维数组; (2)有一个子元素不是一维数组,那该数组机是多为数组;', '<p style=\"box-sizing: border-box; outline: 0px; margin-top: 0px; margin-bottom: 16px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; color: rgb(77, 77, 77); line-height: 26px; overflow-x: auto; overflow-wrap: break-word; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; outline: 0px; margin: 0px; padding: 0px; font-weight: 700; overflow-wrap: break-word;\">int count ( mixed $var [, int $mode ] )&nbsp; -- &nbsp;</span>计算数组中的单元数目或对象中的属性个数<span style=\"box-sizing: border-box; outline: 0px; margin: 0px; padding: 0px; font-weight: 700; overflow-wrap: break-word;\">&nbsp;</span></p><p style=\"box-sizing: border-box; outline: 0px; margin-top: 0px; margin-bottom: 16px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; color: rgb(77, 77, 77); line-height: 26px; overflow-x: auto; overflow-wrap: break-word; white-space: normal; background-color: rgb(255, 255, 255);\">如果可选的 mode 参数设为 COUNT_RECURSIVE（或 1），count() 将递归地对数组计数。对计算多维数组的所有单元尤其有用。mode 的默认值是 0。count() 识别不了无限递归。</p><p style=\"box-sizing: border-box; outline: 0px; margin-top: 0px; margin-bottom: 16px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;, &quot;SF Pro Display&quot;, Roboto, Noto, Arial, &quot;PingFang SC&quot;, sans-serif; color: rgb(77, 77, 77); line-height: 26px; overflow-x: auto; overflow-wrap: break-word; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p><br/></p>', '2020-06-27 11:06:45');
INSERT INTO `act_organize` VALUES (2, '虎威俱乐部', '/uploads/20200627/56c719428d3e1cd2c11dfdf89cca8ce0.jpg', '第一打造大平台', '<table class=\"layui-table\" width=\"1394\" style=\"width: 568px;\"><colgroup><col width=\"40%\"/><col/></colgroup><thead><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242);\" class=\"firstRow\"><th class=\"text-center\" colspan=\"2\" style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: left; font-weight: 400; border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">系统信息</th></tr></thead><tbody><tr style=\"transition: all 0.3s ease 0s;\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">网站域名</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">relclothing.fuyouhome.top</td></tr><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242);\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">网站目录</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">/Users/lihaijiang/Documents/gao/3sworld/public</td></tr><tr style=\"transition: all 0.3s ease 0s;\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">服务器操作系统</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">Darwin</td></tr><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242);\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">服务器端口</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">80</td></tr><tr style=\"transition: all 0.3s ease 0s;\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">服务器IP</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">127.0.0.1</td></tr><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242);\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">WEB运行环境</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">nginx/1.13.2</td></tr><tr style=\"transition: all 0.3s ease 0s;\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">MySQL数据库版本</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">5.7.26</td></tr><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242);\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">运行PHP版本</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">5.6.40</td></tr><tr style=\"transition: all 0.3s ease 0s;\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">最大上传限制</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">32M</td></tr><tr style=\"transition: all 0.3s ease 0s; background-color: rgb(242, 242, 242);\"><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">CLTPHP版本</td><td style=\"margin: 0px; padding: 9px 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-color: rgb(230, 230, 230); position: relative; min-height: 20px; line-height: 20px;\">6.0</td></tr></tbody></table><p><img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0069.gif\"/></p>', NULL);
INSERT INTO `act_organize` VALUES (3, '铁锹集团', '/uploads/20200627/8cb8cbb548369d38d59dc5c7388ea51a.jpg', '二嘎子摘要', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\"><span class=\"bjh-strong\" style=\"font-size: 18px; font-weight: 700;\">越来越多的学术研究和新冠患者的临床证据表明，新冠病毒病毒会破坏人体产生胰岛素的细胞，从而令健康人患上糖尿病。</span>为此，科学家已经开始行动起来，建立数据库，收集没有糖尿病病史或血糖控制问题的COVID-19和高血糖患者的信息。</span></p><p><img class=\"large\" src=\"https://pics7.baidu.com/feed/9a504fc2d5628535742c48bff60a97c0a5ef6348.jpeg?token=951e6df6966a71b6500aa74eb2be80e0\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\">资料图 刘平/摄 图文无关</p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">对于大多数1型糖尿病患者来说，身体的免疫细胞开始破坏胰腺中的细胞，也就是负责产生激素胰岛素的细胞，这个过程通常是突然的。<span class=\"bjh-strong\" style=\"font-size: 18px; font-weight: 700;\">糖尿病已经被认为是导致新冠感染重症的一个关键风险因素，糖尿病患者更有可能死亡。</span>《自然》援引澳大利亚墨尔本莫纳什大学研究代谢性疾病学者Paul Zimmet称，“如果你感染了COVID-19，糖尿病就是致命的。”</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">现在，包括Zimmet在内的越来越多的研究人员认为，糖尿病不仅使人们更容易感染冠状病毒，而且这种病毒还可能引发某些人的糖尿病。</span></p><p><br/></p>', NULL);
COMMIT;

-- ----------------------------
-- Table structure for act_serve
-- ----------------------------
DROP TABLE IF EXISTS `act_serve`;
CREATE TABLE `act_serve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serve_type_id` varchar(255) DEFAULT NULL COMMENT '所属服务',
  `organize_id` int(11) DEFAULT '0' COMMENT '主办方id',
  `title` varchar(50) DEFAULT '' COMMENT '服务标题',
  `pic` varchar(255) DEFAULT '' COMMENT '活动图片',
  `begin_time` int(10) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(10) DEFAULT NULL COMMENT '结束时间',
  `create_time` int(10) DEFAULT NULL COMMENT '发布时间',
  `close_time` int(10) DEFAULT NULL COMMENT '截止时间',
  `see_num` int(10) DEFAULT '0' COMMENT '浏览量',
  `cang_num` int(10) DEFAULT '0' COMMENT '收藏量',
  `price` int(11) DEFAULT '0' COMMENT '价格',
  `currency` varchar(10) CHARACTER SET utf8mb4 DEFAULT '¥' COMMENT '货币',
  `hold_mode` tinyint(1) DEFAULT '2' COMMENT '举办方式（2、线下，1、线上）',
  `content` text COMMENT '活动内容',
  `organizer` varchar(50) DEFAULT NULL COMMENT '举办方',
  `sort` int(10) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '2' COMMENT '是否是热门：1、是，2、否',
  `search_serve_type` varchar(255) DEFAULT NULL COMMENT '用于搜索的服务类型',
  `status` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `search_city` varchar(255) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL COMMENT '网址',
  `organ_infor` varchar(500) DEFAULT NULL COMMENT '组织信息',
  `serve_category_id` int(11) DEFAULT NULL COMMENT '类别id',
  `share_img` varchar(255) DEFAULT NULL COMMENT '分享的图片',
  `join_num` int(10) NOT NULL DEFAULT '0' COMMENT '想参加人数',
  `instructions` varchar(255) NOT NULL DEFAULT '活动内容最终解释权归主办方所有' COMMENT '底部说明',
  `country` int(1) NOT NULL DEFAULT '1' COMMENT '国际类型(1. 国内 2.国外)',
  `start` varchar(255) DEFAULT NULL COMMENT '活动发起人',
  `live` text COMMENT '直播信息',
  `charge` text COMMENT '收费信息',
  PRIMARY KEY (`id`),
  KEY `search_serve_type` (`search_serve_type`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='服务表';

-- ----------------------------
-- Records of act_serve
-- ----------------------------
BEGIN;
INSERT INTO `act_serve` VALUES (1, '2', 1, '2019 GIS 软件技术大会1', '/uploads/20200511/d55e841a1a32ec7b069842d3b66246b1.jpg', 1572397200, 1667295000, NULL, 0, 230, 13, 100, '¥', 2, '<p><span style=\"font-family: &quot;sim sun&quot;; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">2019年10月30日-11月1日，2019 GIS 软件技术大会将于北京国际会议中心召开。 大会以“地理智慧，深度进化”为主题，将聚焦新技术、新思想、新模式“进化”，与全球多个国家和地区的政府机构、科研院所、高校及企业的领导和专家，分享GIS国际最新技术研究成果与创新应用案例，展开巅峰对话，共同探讨产业发展新趋势。</span></p>', '举办方', 0, 1, 'GIS', 1, '1', '国际会议中心', '北京市', 'http://www.gistc.com/', '组织信息后台编辑展示', 4, '/uploads/20200511/d55e841a1a32ec7b069842d3b66246b1.jpg', 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (4, '1,2,3,4', 1, '直播预告 | 地信大讲堂第十四期：从BIM 到数字孪生：实景三维在城市级基础设施管理中的应用', '/uploads/20200511/394b0d71d08ac61def28db04450144bc.png', 1589954400, 1621499400, NULL, 0, 160, 7, 200, '¥', 1, '<p style=\"text-align: center;\"><img src=\"https://clothing.fuyouhome.top/uploads/ueditor/image/20200511/1589158922793752.jpg\" title=\"1589158922793752.jpg\" alt=\"微信图片_20200511090141.jpg\"/></p>', NULL, 1, 1, '线上,GIS,测绘,遥感', 1, '', '', NULL, 'http://www.test.com', '主办单位：中国地理信息产业协会', 4, '/uploads/20200511/394b0d71d08ac61def28db04450144bc.png', 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (5, '1,3', 3, '直播预告 | 地信大讲堂第十三期：新一代的实景三维建模技术整体解决方案', '/uploads/20200511/394b0d71d08ac61def28db04450144bc.png', 1589868000, 1625624341, NULL, 0, 78, 3, 300, '¥', 1, '<p>为助力疫情防控、促进产业平稳发展，满足广大会员和地信工作者需要，协会自3月起正式开启 “地信大讲堂”，充分发挥协会引领产业发展优势，集聚业内外优质资源，为广大地信工作者提供地理信息技术、成果、案例、企业管理经验等优质课程。协会热诚地欢迎您走进“地信大讲堂”！\n地信大讲堂第十三期为大家带来<strong>“新一代的实景三维建模技术整体解决方案”</strong></p><p style=\"text-align: center;\"><strong><img src=\"https://clothing.fuyouhome.top/uploads/ueditor/image/20200511/1589159270168609.png\" title=\"1589159270168609.png\" alt=\"111.png\"/></strong></p>', NULL, 0, 1, '线上,测绘', 1, '', 'aaaa', NULL, 'http://11.com', '主办单位：中国地理信息产业协会，本期支持单位：瞰景科技发展（上海）有限公司', 4, '/uploads/20200511/394b0d71d08ac61def28db04450144bc.png', 1, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (33, '2', 1, '2019年易智瑞用户大会2019年易智瑞用户大会', '/uploads/20200520/2763eb85e1f558f4d1d43aaef590a7a3.png', 1571533200, 1760954400, NULL, 0, 175, 3, 400, '¥', 2, '<p style=\"text-align: center;\">飞速发展的数字技术正在改变着世界<br/>改变着沟通和思考的方式<br/>每一次大的技术变革都是一次挑战<br/>而地理信息行业的变革才刚刚开始<br/>2019年10月<br/>我们用汇聚全球地理信息领域新思想、新技术、新成果的盛会<br/>与你来一场激情的碰撞<br/>2019年易智瑞用户大会，见人所未见！</p>', NULL, 0, 1, 'GIS', 1, '1', '北京国际会议中心', '北京市', 'http://uc2019.esrichina.com.cn/index.html', '', 4, '/uploads/20200520/2763eb85e1f558f4d1d43aaef590a7a3.png', 1, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (34, '2,3', 1, 'GIS数据处理、制图、空间分析技术', '/uploads/20200520/e00892742bde0c888806a1632700d0e7.png', 1590076800, 1590336000, NULL, 0, 26, 1, 500, '¥', 2, '<p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">一、培训对象：</span><br/>（一）各省(自治区、直辖市)的测绘、规划、林业、水利、地矿、农业、交通、环境监测、气象、海洋、国土管理及信息服务等行业的主管领导和技术骨干。<br/>（二）企事业研究院（所）、大专院校及勘察、勘探、勘测院、所、队的领导与技术骨干。<br/><br/><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">二、培训时间、地点：</span><br/><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">2020年05月22日—05月25日（22号全天报到） 河 南 * 郑 州</span></p><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\"><br/><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">三、培训收益:</span><br/>快速熟练掌握地理信息系统的各种基本操作、新功能、新技术；<br/>了解空间数据库的有关理论、技术与应用；<br/>提高空间数据库的数据处理、数据建模和数据分析综合运用能力；<br/>提升<a href=\"https://www.huodongjia.com/tag/8505/\" style=\"box-sizing: border-box; padding: 0px; margin: 0px; background-color: transparent; color: rgb(51, 122, 183); text-decoration-line: none;\">GIS</a>系统的设计和应用能力、应用水平和工作效率。<br/><br/><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">四、课程大纲：</span><br/>第一章、ArcGIS10.5应用基础<br/>第二章、数据检查和拓扑处理<br/>第三章、空间数据交换与格式转换<br/>第四章、影像处理和分析<br/>第五章、专题图快速制作和 打印输出<br/>第六章、数据处理和分析应用<br/>第七章、数据建模<br/>第八章、数字高程、三维制作和应用<br/>第九章、综合分析和应用<br/><br/><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">五、主讲专家：&nbsp;</span><br/>来自中科院等<a href=\"https://www.huodongjia.com/tag/1304/\" style=\"box-sizing: border-box; padding: 0px; margin: 0px; background-color: transparent; color: rgb(51, 122, 183); text-decoration-line: none;\">科研</a>机构、行业领域内权威专家，参与地理信息系统相关国家“863”“973”重大专项研究，拥有丰富的科研及工程技术经验，具有资深的技术底蕴和专业背景。<br/><br/><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">六、教学模式</span>：技巧讲解 + 案例演示 + 上机操作 + 疑难解答 + 达标测评。</p><p><br/></p>', NULL, 0, 1, 'GIS,测绘', 1, '1', '中原区', '北京市', '', '', 4, NULL, 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (35, '6,2', 1, '2020无人机+GIS技术在林业生产中的应用培训班（2月西安班）', '/uploads/20200520/ffcd0fda68a0abca196be8720a519f3e.png', 1582678800, 1583056800, NULL, 0, 61, 2, 0, '¥', 2, '<p><strong>培训对象：</strong></p><p>各林业局资源股、营林股、生态、天保、森防站、防火办及森林公安等领导及技术骨干；各林场、自然保护区、林业调查规划院(队、公司)、林业工作站等领导及技术骨干。</p><p>&nbsp;</p><p><strong>培训时间、地点：</strong></p><p>2020年02月26日—03月01日（26号全天报到） 陕 西 * 西 安</p><p>&nbsp;</p><p><strong>培训收益：</strong></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>掌握轻小型无人机在林业行业的应用技术；</p></li><li><p>学会林业应用中所需的正射影像、采样点、倾斜摄影采集方法；</p></li><li><p>明晰栅格数据预处理及空间变换和编辑技术；</p></li><li><p>可独立系统化完成林业专题地图制作；</p></li><li><p>了解林业图斑采集流程与方法。</p></li></ul><p>&nbsp;</p><p><strong>主讲专家：</strong></p><p>来自国家林业系统科研机构和获得GIS软件应用国家精品课程的相关林业院校专家以专题讲座、应用演练、案例演示、现场答疑相结合的方式进行授课。</p><p>&nbsp;</p><p><strong>教学模式：</strong></p><p>技巧讲解 + 案例演示 + 上机操作 + 疑难解答 + 达标测评</p><p>&nbsp;</p><p>&nbsp;<strong>增值服务：</strong></p><p>（一）拷贝培训课程数据资料，提高应用练习条件和工作效率；</p><p>（二）加入无人机应用专属交流群，课后与老师，同学在线交流、答疑；</p><p>（三）根据学员需要，可开具培训学时证明或继续教育证盖章；</p><p>请参会学员提前整理好工作中遇到的问题，在上机练习过程中予以解决。</p><h3>（最终日程以会议现场为准）</h3><hr/><p>课程大纲：</p><p>第一部分：轻小型无人机在林业行业的应用&nbsp;</p><p>第二部分：林业应用中所需正射影像、采样点、倾斜摄影采集方法；林业图斑采集流程与方法&nbsp;</p><p>第三部分：无人机正射影像、倾斜摄影采集演示；林业图斑采集流程与方法演示&nbsp;</p><p>第四部分：ArcGIS软件基本操作&nbsp;</p><p>第五部分：无人机影像数据预处理&nbsp;</p><p>第六部分：无人机影像数据地物斑块提取&nbsp;</p><p>第七部分：ArcGIS空间分析&nbsp;</p><p>第八部分：无人机影像数据分类。</p><p>第九部分：无人机监测技术在森林病虫害防治中的应用</p><p><br/></p>', NULL, 0, 1, '无人机,GIS', 1, '1', '雁塔区', '北京市', NULL, NULL, NULL, NULL, 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (36, '2', 2, '“双评价”GIS技术实战训练营', '/uploads/20200520/c33eefb263195f64f1407099b8e5dbb8.jpg', 1589904000, 1589904000, NULL, 0, 43, 3, 0, '¥', 2, '<p><img src=\"https://clothing.fuyouhome.top/uploads/ueditor/image/20200520/1589962715314757.png\" title=\"1589962715314757.png\" alt=\"1565943384.68.png\"/></p>', NULL, 0, 2, 'GIS', 1, '1', '上海交通大学咖啡博物馆', '北京市', NULL, NULL, NULL, NULL, 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (45, '6,3', 3, '20201全球无人机应用及防控大会暨第五届无人机产业博览会', '/uploads/20200521/840b9b77ea9e025791bce8ea22c02f4b.png', 1595984400, 1596189600, NULL, 0, 31, 1, 0, '¥', 2, '<p>我国无人机系统经过近50余年的发展取得了诸多重大成果，工业无人机研发与产业化不断取得突破，将迎来爆发式发展。全球范围内，工业级无人机需求持续增长，在众多行业中得到了广泛应用，未来，无人机拥有广阔的应用前景，显示出巨大的市场潜力，同时也面临着风险和挑战。无人机系统是高度科学化、高度社会化、高度战略化的高端制造装备，必将引起新一轮工业社会变革。</p><p>近期习主席多次视察无人机企业，对无人机系统展高度重视、寄予厚望，国家工程院 科技部、工信部等有关部门将无人机系统发发展列为“中国制造2025”的重点，开展战 略研究和重点部署，提出发展规划和指导意见，着力整合社会资源，推动我国无人机系 统及相关产业健康有序发展。无人机系统的研制与应用已成为我国经济创新发展的新亮 点和增长点，我国无人机系统正逐渐走上国际舞台，将成为“中国制造”又一张名片。</p><p>在此背景下，中国无人机产业创新联盟将于2020年7月29-31日在北京举办“全球无人机应用及防控大会”。组委会致力于将会、展、赛相结合，打造一场高规格、高水平的无人机产业应用国际盛会，助推国内无人机产业健康、有效发展，加强无人机区域国际交流合作，探索国际无人机产业创新发展之路。</p><p><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p><strong>主办单位：</strong></p><p>中国光学工程学会</p><p><br/></p></li><li><p><strong>承办单位：</strong></p><p>中国无人机产业创新联盟，中国质量认证中心</p><p><br/></p></li><li><p><strong>会议主席：</strong></p><p>龚惠兴院士，姜景山院士，樊邦奎院士，陈志杰院士，刘永坚院士</p></li></ul><p><br/></p>', NULL, 0, 1, '无人机1,测绘', 1, '1', '亦创国际会展中心', '北京市', 'http://www.baidu.com', '', 4, NULL, 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (46, '2,4', 1, '2020年生态文明新时代下遥感及GIS技术在水资源和水环境领域中的应用实战班', '/uploads/20200521/b7e6a9c2fb303ffbbf2f8a58bc1a295b.png', 1582160400, 1582452000, NULL, 0, 7, 0, 0, '¥', 2, '<p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">培训对象：</span></p><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">政府环保系统、高校<a href=\"https://www.huodongjia.com/tag/1304/\" style=\"box-sizing: border-box; padding: 0px; margin: 0px; background-color: transparent; color: rgb(51, 122, 183); text-decoration-line: none;\">科研</a>院所、监测设备商、代理商，环境检测监测机构、运营机构、污染源排污企业、工业园区、相关环保公司、水利水文部门等相关企事业单位领导及技术人员。</p><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">培训时间、地点：</span></p><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">2020年02月20日—02月23日（20日全天报到） 广 东 * 广 州</p><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">培训收益:</span></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; 掌握水体及其污染要素（水体、水草、水华、绿潮、溢油）提取方法；</p></li><li><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; 学习水质参数反演技术方法；</p></li><li><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; 明晰我国高分系列卫星在水环境<a href=\"https://www.huodongjia.com/tag/7715/\" style=\"box-sizing: border-box; padding: 0px; margin: 0px; background-color: transparent; color: rgb(51, 122, 183); text-decoration-line: none;\">遥感</a>中的应用；</p></li><li><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; 掌握<a href=\"https://www.huodongjia.com/tag/8505/\" style=\"box-sizing: border-box; padding: 0px; margin: 0px; background-color: transparent; color: rgb(51, 122, 183); text-decoration-line: none;\">GIS</a>河道划界分析及数据采集方法；</p></li><li><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; 把握GIS专题图制作及发布方法。</p></li></ol><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">教学模式：技巧讲解 + 案例演示 + 疑难解答 + 达标测评。&nbsp;</p><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 700;\">增值服务：</span></p><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">（一）凡参会单位，可免费获得 51GIS 学院最新推出的《ArcGIS 全系统应用（整套工具）》网课一套，共计75课时800分钟。</p><p style=\"box-sizing: border-box; padding: 0px; margin-top: 0px; margin-bottom: 10px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5B8B体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 30px; color: rgb(51, 51, 51); word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);\">（二）参会学员培训后每人可获得300元现金券一张，用于后续课程使用。</p><p><br/></p>', NULL, 0, 1, 'GIS,遥感', 1, '1', '', '北京市', NULL, NULL, NULL, NULL, 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (47, '4', 1, '2019四维图新用户大会2019四维图新用户大会', '/uploads/20200521/e6e52e7daf9982d8d3a6e5cfb3c2e2cb.png', 1568682000, 1600336800, NULL, 0, 149, 0, 0, '¥', 1, '<p>我们诚挚邀请您一起以新致远，共创机遇空间！<br/></p><p><br/></p>', NULL, 0, 1, '遥感', 1, '1', '上海中心大厦二楼大宴会厅', '北京市', 'http://www.siwen.com/', '后台填写组织信息', 8, '/uploads/20200521/e6e52e7daf9982d8d3a6e5cfb3c2e2cb.png', 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (55, '1,2', 2, '放飞孩子音乐梦想 Hello主播与“禾唱团”唱响六一音乐会', '/uploads/20200602/c581eb282dc6ff1aafcfb1c0e05329f8.png', 2419220, 2147483647, NULL, 0, 187, 0, 0, '¥', 1, '<p>锄禾日当午</p><p>汗滴禾下土</p><p>谁知盘中餐</p><p>粒粒皆辛苦</p>', NULL, 0, 1, '线上,GIS', 1, '1', 'bbb', '北京市', 'http://www.baidu.com', '组织信息 j江', 4, '/uploads/20200602/c581eb282dc6ff1aafcfb1c0e05329f8.png', 2, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (56, '2,6,3,4,5', 3, 'WGDC 2020', '/uploads/20200602/a4f72f048fdeaef5e17c336aed7511fa.png', 1590163200, 1590163200, NULL, 0, 14, 0, 0, '¥', 2, '<p>在过去，我们曾见证了人类文明一波又一波的辉煌，而每一次科技革命都对人类的生活方式、生产方式和思维方式产生了变革。“共振”寓意着很小的周期振动便可产生巨大的能量。当下，新一轮科技革命正在带动产业变革与创新，并已进一步延展至社会变革的广阔领域。</p><p>WGDC 从2012年举办至如今，从时空大数据领域出发，到引领云计算、人工智能和万物互联等新技术跨界创新，事实上已成为具有全球影响力的科技产业跨界盛会，每年参会现场数万人次，线上影响力覆盖超过1000万人，被业界誉为科技创新领域的风向标。</p><p>2020年是新十年的开始，WGDC 2020将开启全新时代，我们诚邀您一起探寻科技与产业的共振！</p><p><br/></p>', NULL, 0, 1, 'GIS,无人机,测绘,遥感,导航定位', 1, '1', '国际会议中心', '北京市', 'http://wgdc.taibo.cn/', '泰伯网', 4, '/uploads/20200602/e768d68123c045cf816ddf0f10936cf4.jpg', 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (57, '1,5', 3, '“小”有可为，112020华信天线新品发布会巴拉啦,橘子汽水小可爱妈妈烤山药吃大块的', '/uploads/20200621/f5b631b6f73362ec8796dbe81f407704.jpg', 1591200000, 1591200001, NULL, 0, 26, 1, 0, '¥', 1, '<p style=\"text-align: center;\"><img src=\"https://relclothing.fuyouhome.top/uploads/ueditor/image/20200529/1590761927160836.jpg\" title=\"1590761927160836.jpg\" alt=\"发布会.jpg\"/></p><p><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">每一次前行</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">都需要创新的力量</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">每一次创新</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">都是技术的引领</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">我们积极探索，不断尝试，力求改变<br/>一次又一次，一次又一次</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">终于</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">又迎来了我们的新产品</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><strong style=\"margin: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box;\">“小”有可为</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">2020华信天线新品发布会</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">全新突破</p><p style=\"margin-top: 0px; margin-bottom: 0px; border: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(51, 51, 51); font-family: -apple-system, PingFangSC-Regular, PingFangHK-Regular, PingFangTC-Regular, 微软雅黑, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">期待与您共同见证</p>', NULL, 1, 1, '线上,导航定位', 1, '', '', NULL, 'http://appz6fabfop8798.h5.xiaoeknow.com/v1/course/alive/l_5ec494dd425fd_M3cFB0yo?app_id=appz6fAbFoP8798&entry=2&entry_type=2001&is_redirect=1&scene=%E5%88%86%E4%BA%AB&share_type=100&share_user_id=u_5ec67604bb5d2_kHuW9rjO0R&type=2', '深圳市华信天线技术有限公司', 4, '/uploads/20200621/f5b631b6f73362ec8796dbe81f407704.jpg', 0, '活动内容最终解释权归主办方所有', 1, 'admin', NULL, NULL);
INSERT INTO `act_serve` VALUES (58, '1,2,6', 1, 'Hello语音捐赠万份健康包 为广州儿童构筑防护墙的盒饭都开始老师', '/uploads/20200602/13c1ab18ca9701b551bcfe40c83ed6d6.jpg', 1594042469, 1599399271, NULL, 1594489624, 56, -6, 15, '¥', 2, '<p><img src=\"https://relclothing.fuyouhome.top/uploads/ueditor/image/20200603/1591176281597336.png\" title=\"1591176281597336.png\" alt=\"WX20200603-172223@2x.png\"/></p>', NULL, 0, 1, '线上,GIS,无人机', 1, '100000001', '', '美国', 'http://www.apifd.com', '我是组织', 4, '/uploads/20200602/13c1ab18ca9701b551bcfe40c83ed6d6.jpg', 1, '活动内容最终解释权归主办方所有', 2, 'admin', '<p>zhobo</p>', '<p>收费</p>');
COMMIT;

-- ----------------------------
-- Table structure for act_serve_category
-- ----------------------------
DROP TABLE IF EXISTS `act_serve_category`;
CREATE TABLE `act_serve_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='服务类别表';

-- ----------------------------
-- Records of act_serve_category
-- ----------------------------
BEGIN;
INSERT INTO `act_serve_category` VALUES (1, '产品大会', 1, 0);
INSERT INTO `act_serve_category` VALUES (2, '用户大会', 1, 0);
INSERT INTO `act_serve_category` VALUES (3, '发布会', 1, 0);
INSERT INTO `act_serve_category` VALUES (4, '培训会', 1, 1);
INSERT INTO `act_serve_category` VALUES (8, '技术大会', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for act_serve_type
-- ----------------------------
DROP TABLE IF EXISTS `act_serve_type`;
CREATE TABLE `act_serve_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='服务类型表';

-- ----------------------------
-- Records of act_serve_type
-- ----------------------------
BEGIN;
INSERT INTO `act_serve_type` VALUES (1, '线上', 1, 7);
INSERT INTO `act_serve_type` VALUES (2, 'GIS', 1, 6);
INSERT INTO `act_serve_type` VALUES (3, '测绘', 1, 1);
INSERT INTO `act_serve_type` VALUES (4, '遥感', 1, 1);
INSERT INTO `act_serve_type` VALUES (5, '导航定位', 1, 1);
INSERT INTO `act_serve_type` VALUES (6, '无人机', 1, 5);
COMMIT;

-- ----------------------------
-- Table structure for act_share
-- ----------------------------
DROP TABLE IF EXISTS `act_share`;
CREATE TABLE `act_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `serve_id` int(11) DEFAULT NULL COMMENT '服务id',
  `create_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分享表';

-- ----------------------------
-- Records of act_share
-- ----------------------------
BEGIN;
INSERT INTO `act_share` VALUES (1, 24, 4, 1594089630);
COMMIT;

-- ----------------------------
-- Table structure for act_sign
-- ----------------------------
DROP TABLE IF EXISTS `act_sign`;
CREATE TABLE `act_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serve_id` int(11) NOT NULL COMMENT '活动id',
  `name` varchar(255) DEFAULT NULL COMMENT '报名姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `industry` varchar(255) DEFAULT NULL COMMENT '行业',
  `position` varchar(255) DEFAULT NULL COMMENT '职务',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT NULL COMMENT '报名时间',
  `uid` int(11) NOT NULL COMMENT 'uid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='报名信息表';

-- ----------------------------
-- Records of act_sign
-- ----------------------------
BEGIN;
INSERT INTO `act_sign` VALUES (2, 55, '铝合金', '17777777777', 'li@qq.com', '工人', '', '', 1594487161, 24);
COMMIT;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(20) NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(70) NOT NULL COMMENT '管理员密码',
  `group_id` mediumint(8) DEFAULT NULL COMMENT '分组ID',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `mdemail` varchar(50) DEFAULT '0' COMMENT '传递修改密码参数加密',
  `is_open` tinyint(2) DEFAULT '0' COMMENT '审核状态',
  `avatar` varchar(120) DEFAULT '' COMMENT '头像',
  `uid` varchar(120) DEFAULT NULL COMMENT '微信openid',
  PRIMARY KEY (`admin_id`) USING BTREE,
  KEY `admin_username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '1109305454@qq.com', '', '18792402229', '127.0.0.1', 1482132862, '0', 1, '/uploads/20200601/582a7020e18be61d0fb583830fe3d6ef.png', NULL);
COMMIT;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '全新ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `rules` longtext COMMENT '规则',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员分组';

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
INSERT INTO `auth_group` VALUES (1, '超级管理员', 1, '0,1,2,270,15,16,119,120,121,145,17,149,116,117,118,181,151,18,108,114,112,109,110,111,3,5,128,127,126,4,230,232,129,189,190,193,192,240,239,241,243,244,245,242,246,447,449,459,457,461,646,', 1465114224);
INSERT INTO `auth_group` VALUES (2, '老师主管', 1, '0,417,418,', 1465114224);
INSERT INTO `auth_group` VALUES (3, '商品管理员', 1, '27,29,161,163,164,162,38,167,182,169,166,', 1465114224);
INSERT INTO `auth_group` VALUES (4, '安大花', 0, NULL, 1590027533);
COMMIT;

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `authopen` tinyint(2) NOT NULL DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL COMMENT '样式',
  `condition` char(100) DEFAULT '',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zt` int(1) DEFAULT NULL,
  `menustatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=655 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限节点';

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
BEGIN;
INSERT INTO `auth_rule` VALUES (1, 'System', '系统设置', 1, 1, 0, 'icon-cogs', '', 0, 0, 1446535750, 1, 1);
INSERT INTO `auth_rule` VALUES (2, 'System/system', '系统设置', 1, 1, 0, '', '', 1, 1, 1446535789, 1, 1);
INSERT INTO `auth_rule` VALUES (3, 'Database/database', '数据库管理', 1, 1, 0, 'icon-database', '', 0, 3, 1446535805, 1, 0);
INSERT INTO `auth_rule` VALUES (4, 'Database/restore', '还原数据库', 1, 1, 0, '', '', 3, 10, 1446535750, 1, 1);
INSERT INTO `auth_rule` VALUES (5, 'Database/database', '数据库备份', 1, 1, 0, '', '', 3, 1, 1446535834, 1, 1);
INSERT INTO `auth_rule` VALUES (15, 'Auth/adminList', '权限管理', 1, 1, 0, 'icon-lifebuoy', '', 0, 0, 1446535750, 1, 1);
INSERT INTO `auth_rule` VALUES (16, 'Auth/adminList', '管理员列表', 1, 1, 0, '', '', 15, 0, 1446535750, 1, 1);
INSERT INTO `auth_rule` VALUES (17, 'Auth/adminGroup', '用户组列表', 1, 1, 0, '', '', 15, 1, 1446535750, 1, 1);
INSERT INTO `auth_rule` VALUES (18, 'Auth/adminRule', '权限管理', 1, 1, 0, '', '', 15, 2, 1446535750, 1, 1);
INSERT INTO `auth_rule` VALUES (108, 'Auth/ruleAdd', '操作-添加', 1, 1, 0, '', '', 18, 0, 1461550835, 1, 0);
INSERT INTO `auth_rule` VALUES (109, 'Auth/ruleState', '操作-状态', 1, 1, 0, '', '', 18, 5, 1461550949, 1, 0);
INSERT INTO `auth_rule` VALUES (110, 'Auth/ruleTz', '操作-验证', 1, 1, 0, '', '', 18, 6, 1461551129, 1, 0);
INSERT INTO `auth_rule` VALUES (111, 'Auth/ruleorder', '操作-排序', 1, 1, 0, '', '', 18, 7, 1461551263, 1, 0);
INSERT INTO `auth_rule` VALUES (112, 'Auth/ruleDel', '操作-删除', 1, 1, 0, '', '', 18, 4, 1461551536, 1, 0);
INSERT INTO `auth_rule` VALUES (114, 'Auth/ruleEdit', '操作-修改', 1, 1, 0, '', '', 18, 2, 1461551913, 1, 0);
INSERT INTO `auth_rule` VALUES (116, 'Auth/groupEdit', '操作-修改', 1, 1, 0, '', '', 17, 3, 1461552326, 1, 0);
INSERT INTO `auth_rule` VALUES (117, 'Auth/groupDel', '操作-删除', 1, 1, 0, '', '', 17, 30, 1461552349, 1, 0);
INSERT INTO `auth_rule` VALUES (118, 'Auth/groupAccess', '操作-权限', 1, 1, 0, '', '', 17, 40, 1461552404, 1, 0);
INSERT INTO `auth_rule` VALUES (119, 'Auth/adminAdd', '操作-添加', 1, 1, 0, '', '', 16, 0, 1461553162, 1, 0);
INSERT INTO `auth_rule` VALUES (120, 'Auth/adminEdit', '操作-修改', 1, 1, 0, '', '', 16, 2, 1461554130, 1, 0);
INSERT INTO `auth_rule` VALUES (121, 'Auth/adminDel', '操作-删除', 1, 1, 0, '', '', 16, 4, 1461554152, 1, 0);
INSERT INTO `auth_rule` VALUES (126, 'Database/export', '操作-备份', 1, 1, 0, '', '', 5, 1, 1461550835, 1, 0);
INSERT INTO `auth_rule` VALUES (127, 'Database/optimize', '操作-优化', 1, 1, 0, '', '', 5, 1, 1461550835, 1, 0);
INSERT INTO `auth_rule` VALUES (128, 'Database/repair', '操作-修复', 1, 1, 0, '', '', 5, 1, 1461550835, 1, 0);
INSERT INTO `auth_rule` VALUES (129, 'Database/delSqlFiles', '操作-删除', 1, 1, 0, '', '', 4, 3, 1461550835, 1, 0);
INSERT INTO `auth_rule` VALUES (230, 'Database/import', '操作-还原', 1, 1, 0, '', '', 4, 1, 1497423595, 0, 0);
INSERT INTO `auth_rule` VALUES (145, 'Auth/adminState', '操作-状态', 1, 1, 0, '', '', 16, 5, 1461550835, 1, 0);
INSERT INTO `auth_rule` VALUES (149, 'Auth/groupAdd', '操作-添加', 1, 1, 0, '', '', 17, 1, 1461550835, 1, 0);
INSERT INTO `auth_rule` VALUES (151, 'Auth/groupRunaccess', '操作-权存', 1, 1, 0, '', '', 17, 50, 1461550835, 1, 0);
INSERT INTO `auth_rule` VALUES (240, 'Module/del', '操作-删除', 1, 1, 0, '', '', 190, 4, 1497425850, 0, 0);
INSERT INTO `auth_rule` VALUES (239, 'Module/moduleState', '操作-状态', 1, 1, 0, '', '', 190, 5, 1497425764, 0, 0);
INSERT INTO `auth_rule` VALUES (181, 'Auth/groupState', '操作-状态', 1, 1, 0, '', '', 17, 50, 1461834340, 1, 0);
INSERT INTO `auth_rule` VALUES (189, 'Module', '模型管理', 1, 1, 0, 'icon-ungroup', '', 0, 4, 1466825363, 0, 0);
INSERT INTO `auth_rule` VALUES (190, 'Module/index', '模型列表', 1, 1, 0, '', '', 189, 1, 1466826681, 0, 1);
INSERT INTO `auth_rule` VALUES (192, 'Module/edit', '操作-修改', 1, 1, 0, '', '', 190, 2, 1467007920, 0, 0);
INSERT INTO `auth_rule` VALUES (193, 'Module/add', '操作-添加', 1, 1, 0, '', '', 190, 1, 1467007955, 0, 0);
INSERT INTO `auth_rule` VALUES (232, 'Database/downFile', '操作-下载', 1, 1, 0, '', '', 4, 2, 1497423744, 0, 0);
INSERT INTO `auth_rule` VALUES (241, 'Module/field', '模型字段', 1, 1, 0, '', '', 190, 6, 1497425972, 0, 0);
INSERT INTO `auth_rule` VALUES (242, 'Module/fieldStatus', '操作-状态', 1, 1, 0, '', '', 241, 4, 1497426044, 0, 0);
INSERT INTO `auth_rule` VALUES (243, 'Module/fieldAdd', '操作-添加', 1, 1, 0, '', '', 241, 1, 1497426089, 0, 0);
INSERT INTO `auth_rule` VALUES (244, 'Module/fieldEdit', '操作-修改', 1, 1, 0, '', '', 241, 2, 1497426134, 0, 0);
INSERT INTO `auth_rule` VALUES (245, 'Module/listOrder', '操作-排序', 1, 1, 0, '', '', 241, 3, 1497426179, 0, 0);
INSERT INTO `auth_rule` VALUES (246, 'Module/fieldDel', '操作-删除', 1, 1, 0, '', '', 241, 5, 1497426241, 0, 0);
INSERT INTO `auth_rule` VALUES (270, 'System/email', '邮箱配置', 1, 1, 0, '', '', 1, 2, 1502331829, 0, 1);
INSERT INTO `auth_rule` VALUES (287, 'Crud/index', '增删改查', 1, 1, 0, '', '', 189, 50, 1573280987, NULL, 1);
INSERT INTO `auth_rule` VALUES (333, 'Test', '系统模块管理', 1, 1, 0, '', '', 0, 4, 1577762471, NULL, 0);
INSERT INTO `auth_rule` VALUES (334, 'Test/index', '系统模块列表', 1, 1, 0, '', '', 333, 50, 1577762507, NULL, 0);
INSERT INTO `auth_rule` VALUES (346, 'Sysmodule/index', '系统权限2.0列表', 1, 1, 0, '', '', 345, 50, 1578382768, NULL, 1);
INSERT INTO `auth_rule` VALUES (347, 'Sysmodule/add', 'sysmodule添加', 1, 1, 0, '', '', 345, 50, 1578382768, NULL, 0);
INSERT INTO `auth_rule` VALUES (348, 'Sysmodule/edit', 'sysmodule编辑', 1, 1, 0, '', '', 345, 50, 1578382768, NULL, 0);
INSERT INTO `auth_rule` VALUES (345, 'Sysmodule', '系统权限2.0', 1, 1, 0, '', '', 0, 2, 1578382768, NULL, 0);
INSERT INTO `auth_rule` VALUES (380, 'Sysview/edit', 'Sysview编辑', 1, 1, 1, '', '', 377, 50, 1578994607, NULL, 0);
INSERT INTO `auth_rule` VALUES (379, 'Sysview/add', 'Sysview添加', 1, 1, 1, '', '', 377, 50, 1578994607, NULL, 0);
INSERT INTO `auth_rule` VALUES (378, 'Sysview/index', '关联列表', 1, 1, 1, '', '', 377, 50, 1578994607, NULL, 1);
INSERT INTO `auth_rule` VALUES (377, 'Sysview', '关联管理', 1, 1, 0, '', '', 0, 1, 1578994607, NULL, 0);
INSERT INTO `auth_rule` VALUES (447, 'Users', '用户管理', 1, 1, 0, '', '', 0, 9, 1586589537, NULL, 1);
INSERT INTO `auth_rule` VALUES (449, 'Users/index', ' 用户表列表', 1, 1, 0, '', '', 447, 50, 1586589566, NULL, 1);
INSERT INTO `auth_rule` VALUES (459, 'Users/edit', '  用户表编辑', 1, 1, 0, '', '', 447, 50, 1586589685, NULL, 0);
INSERT INTO `auth_rule` VALUES (457, 'Users/add', '  用户表添加', 1, 1, 0, '', '', 447, 50, 1586589666, NULL, 0);
INSERT INTO `auth_rule` VALUES (461, 'Users/del', '用户表删除', 1, 1, 0, '', '', 447, 50, 1586589714, NULL, 0);
INSERT INTO `auth_rule` VALUES (637, 'Banner', '轮播图管理', 1, 1, 0, '', '', 0, 50, 1588747370, NULL, 1);
INSERT INTO `auth_rule` VALUES (626, 'ServeType/del', '活动类型管理删除', 1, 1, 0, '', '', 622, 50, 1588745688, NULL, 0);
INSERT INTO `auth_rule` VALUES (625, 'ServeType/edit', '活动类型管理编辑', 1, 1, 0, '', '', 622, 50, 1588745688, NULL, 0);
INSERT INTO `auth_rule` VALUES (624, 'ServeType/add', '活动类型管理添加', 1, 1, 0, '', '', 622, 50, 1588745688, NULL, 0);
INSERT INTO `auth_rule` VALUES (622, 'ServeType', '活动类型管理', 1, 1, 0, '', '', 0, 50, 1588745688, NULL, 1);
INSERT INTO `auth_rule` VALUES (623, 'ServeType/index', '活动类型管理列表', 1, 1, 0, '', '', 622, 50, 1588745688, NULL, 1);
INSERT INTO `auth_rule` VALUES (644, 'ServeCategory/index', '活动类别管理列表', 1, 1, 1, '', '', 643, 50, 1590052903, NULL, 1);
INSERT INTO `auth_rule` VALUES (643, 'ServeCategory', '活动类别管理', 1, 1, 1, '', '', 0, 50, 1590052845, NULL, 1);
INSERT INTO `auth_rule` VALUES (641, 'Banner/del', '轮播图管理删除', 1, 1, 0, '', '', 637, 50, 1588747370, NULL, 0);
INSERT INTO `auth_rule` VALUES (640, 'Banner/edit', '轮播图管理编辑', 1, 1, 0, '', '', 637, 50, 1588747370, NULL, 0);
INSERT INTO `auth_rule` VALUES (639, 'Banner/add', '轮播图管理添加', 1, 1, 0, '', '', 637, 50, 1588747370, NULL, 0);
INSERT INTO `auth_rule` VALUES (638, 'Banner/index', '轮播图管理列表', 1, 1, 0, '', '', 637, 50, 1588747370, NULL, 1);
INSERT INTO `auth_rule` VALUES (636, 'serve/del', '活动管理删除', 1, 1, 0, '', '', 632, 50, 1588746588, NULL, 0);
INSERT INTO `auth_rule` VALUES (635, 'serve/edit', '活动管理编辑', 1, 1, 0, '', '', 632, 50, 1588746588, NULL, 0);
INSERT INTO `auth_rule` VALUES (634, 'serve/add', '活动管理添加', 1, 1, 0, '', '', 632, 50, 1588746588, NULL, 0);
INSERT INTO `auth_rule` VALUES (632, 'serve', '活动管理', 1, 1, 0, '', '', 0, 4, 1588746588, NULL, 1);
INSERT INTO `auth_rule` VALUES (633, 'serve/index', '活动管理列表', 1, 1, 0, '', '', 632, 50, 1588746588, NULL, 1);
INSERT INTO `auth_rule` VALUES (646, 'Help', '客服与帮助', 1, 1, 0, '', '', 0, 50, 1591181032, NULL, 1);
INSERT INTO `auth_rule` VALUES (647, 'Help/index', '小程序帮助页面显示', 1, 1, 1, '', '', 646, 50, 1591181406, NULL, 1);
INSERT INTO `auth_rule` VALUES (648, 'organize', '主办方管理', 1, 1, 1, '', '', 0, 2, 1593221926, NULL, 1);
INSERT INTO `auth_rule` VALUES (649, 'organize/index', '主办方列表', 1, 1, 1, '', '', 648, 50, 1593221985, NULL, 1);
INSERT INTO `auth_rule` VALUES (650, 'country', '热门国家', 1, 1, 1, '', '', 0, 50, 1594021444, NULL, 1);
INSERT INTO `auth_rule` VALUES (651, 'country/index', '热门国家列表', 1, 1, 1, '', '', 650, 50, 1594021485, NULL, 1);
INSERT INTO `auth_rule` VALUES (652, 'help/feedback', '建议与反馈', 1, 1, 1, '', '', 646, 50, 1594023090, NULL, 1);
INSERT INTO `auth_rule` VALUES (653, 'industry', '行业管理', 1, 1, 1, '', '', 0, 50, 1594490761, NULL, 1);
INSERT INTO `auth_rule` VALUES (654, 'industry/index', '行业列表', 1, 1, 1, '', '', 653, 50, 1594490813, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) NOT NULL DEFAULT '',
  `catdir` varchar(30) NOT NULL DEFAULT '',
  `parentdir` varchar(50) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `module` char(24) NOT NULL DEFAULT '',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `arrchildid` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `template_list` varchar(20) NOT NULL DEFAULT '',
  `template_show` varchar(20) NOT NULL DEFAULT '',
  `pagesize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `listtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否预览',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `listorder` (`sort`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='栏目';

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, '最新动态', 'news', '', 0, 2, 'article', '0', '1,5,6,14,3', 0, '最新动态', '最新动态', '最新动态', 4, 0, 1, 0, '', 1, '', 'article_list', 'article_show', 0, '1,2,3', 0, 0, 0);
INSERT INTO `category` VALUES (2, '关于我们', 'about', '', 0, 1, 'page', '0', '2', 0, '关于我们', 'CLTPHP内容管理系统，微信公众平台、APP移动应用设计、HTML5网站API定制开发。大型企业网站、个人博客论坛、手机网站定制开发。更高效、更快捷的进行定制开发。', 'CLTPHP内容管理系统，微信公众平台、APP移动应用设计、HTML5网站API定制开发。大型企业网站、个人博客论坛、手机网站定制开发。更高效、更快捷的进行定制开发。', 0, 0, 1, 0, '', 0, '', '', '', 0, '1', 0, 0, 0);
INSERT INTO `category` VALUES (4, '系统操作', 'system', '', 0, 3, 'picture', '0', '4', 0, 'CLTPHP系统操作', 'CLTPHP系统操作,CLTPHP,CLTPHP内容管理系统', 'CLTPHP系统操作,CLTPHP,CLTPHP内容管理系统', 2, 0, 1, 0, '', 0, '', '', '', 0, '1,2', 0, 0, 0);
INSERT INTO `category` VALUES (3, 'CLTPHP服务', 'news', 'news/', 1, 2, 'article', '0,1', '3', 0, '产品服务-CLTPHP', '产品服务,CLTPHP,CLTPHP内容管理系统', '产品服务', 1, 0, 1, 0, '', 0, '', '', '', 0, '1,2,3', 0, 0, 1);
INSERT INTO `category` VALUES (8, '联系我们', 'contact', '', 0, 1, 'page', '0', '8', 0, '联系我们', '联系我们', '联系我们', 7, 0, 1, 0, '', 0, '', 'page_show_contace', 'page_show_contace', 0, '1,2', 0, 0, 0);
INSERT INTO `category` VALUES (7, '精英团队', 'team', '', 0, 6, 'team', '0', '7', 0, '精英团队', '精英团队', '精英团队', 5, 0, 1, 0, '', 0, '', '', '', 0, '1,2', 0, 0, 0);
INSERT INTO `category` VALUES (5, 'CLTPHP动态', 'news', 'news/', 1, 2, 'article', '0,1', '5', 0, 'CLTPHP动态', 'CLTPHP动态', 'CLTPHP动态', 0, 0, 1, 0, '', 0, '', 'article_list', '', 0, '1,2,3', 0, 0, 1);
INSERT INTO `category` VALUES (6, '相关知识 ', 'news', 'news/', 1, 2, 'article', '0,1', '6', 0, 'CLTPHP相关知识', 'CLTPHP相关知识', 'CLTPHP相关知识', 0, 0, 1, 0, '', 0, '', '', '', 0, '1,2,3', 0, 0, 1);
INSERT INTO `category` VALUES (14, '文件下载', 'news', 'news/', 1, 5, 'download', '0,1', '14', 0, '测试下载', '测试下载', '测试下载', 0, 0, 1, 0, '', 0, '', '', '', 0, '1,2,3', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
BEGIN;
INSERT INTO `config` VALUES (16, 'is_mark', '0', 'water', '0');
INSERT INTO `config` VALUES (17, 'mark_txt', '', 'water', '0');
INSERT INTO `config` VALUES (18, 'mark_img', '/public/upload/public/2017/01-20/10cd966bd5f3549833c09a5c9700a9b8.jpg', 'water', '0');
INSERT INTO `config` VALUES (19, 'mark_width', '', 'water', '0');
INSERT INTO `config` VALUES (20, 'mark_height', '', 'water', '0');
INSERT INTO `config` VALUES (21, 'mark_degree', '54', 'water', '0');
INSERT INTO `config` VALUES (22, 'mark_quality', '56', 'water', '0');
INSERT INTO `config` VALUES (23, 'sel', '9', 'water', '0');
INSERT INTO `config` VALUES (24, 'sms_url', 'https://yunpan.cn/OcRgiKWxZFmjSJ', 'sms', '0');
INSERT INTO `config` VALUES (25, 'sms_user', '', 'sms', '0');
INSERT INTO `config` VALUES (26, 'sms_pwd', '访问密码 080e', 'sms', '0');
INSERT INTO `config` VALUES (27, 'regis_sms_enable', '1', 'sms', '0');
INSERT INTO `config` VALUES (28, 'sms_time_out', '1200', 'sms', '0');
INSERT INTO `config` VALUES (38, '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', '0');
INSERT INTO `config` VALUES (39, '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', '0');
INSERT INTO `config` VALUES (56, 'sms_appkey', '123456789', 'sms', '0');
INSERT INTO `config` VALUES (57, 'sms_secretKey', '123456789', 'sms', '0');
INSERT INTO `config` VALUES (58, 'sms_product', 'CLTPHP', 'sms', '0');
INSERT INTO `config` VALUES (59, 'sms_templateCode', 'SMS_101234567890', 'sms', '0');
INSERT INTO `config` VALUES (60, 'smtp_server', '1', 'smtp', '0');
INSERT INTO `config` VALUES (61, 'smtp_port', '1', 'smtp', '0');
INSERT INTO `config` VALUES (62, 'smtp_user', '1', 'smtp', '0');
INSERT INTO `config` VALUES (63, 'smtp_pwd', '1', 'smtp', '0');
INSERT INTO `config` VALUES (64, 'regis_smtp_enable', '1', 'smtp', '0');
INSERT INTO `config` VALUES (65, 'test_eamil', '1', 'smtp', '0');
INSERT INTO `config` VALUES (70, 'forget_pwd_sms_enable', '1', 'sms', '0');
INSERT INTO `config` VALUES (71, 'bind_mobile_sms_enable', '1', 'sms', '0');
INSERT INTO `config` VALUES (72, 'order_add_sms_enable', '1', 'sms', '0');
INSERT INTO `config` VALUES (73, 'order_pay_sms_enable', '1', 'sms', '0');
INSERT INTO `config` VALUES (74, 'order_shipping_sms_enable', '1', 'sms', '0');
INSERT INTO `config` VALUES (88, 'email_id', '1', 'smtp', '0');
INSERT INTO `config` VALUES (89, 'test_eamil_info', ' 您好！这是一封来自CLTPHP的测试邮件！', 'smtp', '0');
COMMIT;

-- ----------------------------
-- Table structure for field
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(150) NOT NULL DEFAULT '',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `errormsg` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `setup` text,
  `ispost` tinyint(1) NOT NULL DEFAULT '0',
  `unpostgroup` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of field
-- ----------------------------
BEGIN;
INSERT INTO `field` VALUES (1, 1, 'title', '标题', '', 1, 1, 80, 'defaul', '标题必须为1-80个字符', 'title', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n)', 1, '', 1, 1, 1);
INSERT INTO `field` VALUES (2, 1, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 8, 0, 0);
INSERT INTO `field` VALUES (3, 1, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 97, 1, 1);
INSERT INTO `field` VALUES (4, 1, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 99, 1, 1);
INSERT INTO `field` VALUES (5, 1, 'status', '状态', '', 0, 0, 0, 'defaul', '', 'status', 'radio', 'array (\n  \'options\' => \'发布|1\n定时发布|0\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'1\',\n)', 0, '', 98, 1, 1);
INSERT INTO `field` VALUES (6, 1, 'content', '内容', '', 1, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'wangEditor\',\n)', 0, '', 3, 1, 0);
INSERT INTO `field` VALUES (7, 2, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `field` VALUES (8, 2, 'title', '标题', '', 1, 1, 80, 'defaul', '标题必须为1-80个字符', 'title', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n)', 1, '', 2, 1, 1);
INSERT INTO `field` VALUES (9, 2, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 3, 1, 1);
INSERT INTO `field` VALUES (10, 2, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', 1, '', 4, 1, 1);
INSERT INTO `field` VALUES (11, 2, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'UEditor\',\n)', 1, '', 6, 1, 1);
INSERT INTO `field` VALUES (12, 2, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 6, 1, 1);
INSERT INTO `field` VALUES (13, 2, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', 1, '', 10, 0, 0);
INSERT INTO `field` VALUES (14, 2, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 11, 0, 0);
INSERT INTO `field` VALUES (15, 2, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 12, 1, 0);
INSERT INTO `field` VALUES (16, 2, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', 1, '', 13, 1, 1);
INSERT INTO `field` VALUES (17, 2, 'posid', '推荐位', '', 0, 0, 0, 'defaul', '', 'posid', 'posid', '', 1, '', 14, 1, 1);
INSERT INTO `field` VALUES (18, 2, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 15, 1, 1);
INSERT INTO `field` VALUES (19, 2, 'status', '状态', '', 0, 0, 0, 'defaul', '', 'status', 'radio', 'array (\n  \'options\' => \'发布|1\n定时发布|2\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'1\',\n)', 1, '', 7, 1, 1);
INSERT INTO `field` VALUES (20, 3, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `field` VALUES (21, 3, 'title', '标题', '', 1, 1, 80, 'defaul', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'0\',\n  \'style\' => \'0\',\n)', 1, '', 2, 1, 1);
INSERT INTO `field` VALUES (22, 3, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 3, 1, 1);
INSERT INTO `field` VALUES (23, 3, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', 1, '', 4, 1, 1);
INSERT INTO `field` VALUES (24, 3, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', 1, '', 7, 1, 1);
INSERT INTO `field` VALUES (25, 3, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 8, 1, 1);
INSERT INTO `field` VALUES (26, 3, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', 1, '', 10, 0, 0);
INSERT INTO `field` VALUES (27, 3, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 11, 0, 0);
INSERT INTO `field` VALUES (28, 3, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 12, 0, 0);
INSERT INTO `field` VALUES (29, 3, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', 1, '', 13, 0, 1);
INSERT INTO `field` VALUES (30, 3, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 14, 1, 1);
INSERT INTO `field` VALUES (31, 3, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 15, 1, 1);
INSERT INTO `field` VALUES (32, 3, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 9, 1, 1);
INSERT INTO `field` VALUES (33, 3, 'pic', '图片', '', 1, 0, 0, 'defaul', '', 'pic', 'image', '', 0, '', 5, 1, 0);
INSERT INTO `field` VALUES (34, 3, 'group', '类型', '', 1, 0, 0, 'defaul', '', 'group', 'select', 'array (\n  \'options\' => \'模型管理|1\n分类管理|2\n内容管理|3\',\n  \'multiple\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'size\' => \'\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0);
INSERT INTO `field` VALUES (35, 4, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `field` VALUES (36, 4, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', 1, '', 2, 1, 1);
INSERT INTO `field` VALUES (37, 4, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 3, 1, 1);
INSERT INTO `field` VALUES (38, 4, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', 1, '', 4, 1, 1);
INSERT INTO `field` VALUES (39, 4, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', 1, '', 8, 1, 1);
INSERT INTO `field` VALUES (40, 4, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 9, 1, 1);
INSERT INTO `field` VALUES (41, 4, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 10, 1, 1);
INSERT INTO `field` VALUES (42, 4, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', 1, '', 11, 0, 0);
INSERT INTO `field` VALUES (43, 4, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 12, 0, 0);
INSERT INTO `field` VALUES (44, 4, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 13, 0, 0);
INSERT INTO `field` VALUES (45, 4, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', 1, '', 14, 0, 1);
INSERT INTO `field` VALUES (46, 4, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 15, 1, 1);
INSERT INTO `field` VALUES (47, 4, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 16, 1, 1);
INSERT INTO `field` VALUES (48, 4, 'price', '价格', '', 1, 0, 0, 'defaul', '', 'price', 'number', 'array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'2\',\n  \'default\' => \'0.00\',\n)', 0, '', 5, 1, 0);
INSERT INTO `field` VALUES (49, 4, 'xinghao', '型号', '', 0, 0, 0, 'defaul', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 6, 1, 0);
INSERT INTO `field` VALUES (50, 4, 'pics', '图组', '', 0, 0, 0, 'defaul', '', 'pics', 'images', '', 0, '', 7, 1, 0);
INSERT INTO `field` VALUES (51, 5, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1);
INSERT INTO `field` VALUES (52, 5, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', 1, '', 2, 1, 1);
INSERT INTO `field` VALUES (53, 5, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 3, 1, 1);
INSERT INTO `field` VALUES (54, 5, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)', 1, '', 4, 1, 1);
INSERT INTO `field` VALUES (55, 5, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', 1, '', 9, 1, 1);
INSERT INTO `field` VALUES (56, 5, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1);
INSERT INTO `field` VALUES (57, 5, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1);
INSERT INTO `field` VALUES (58, 5, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)', 1, '', 12, 0, 0);
INSERT INTO `field` VALUES (59, 5, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 13, 0, 0);
INSERT INTO `field` VALUES (60, 5, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 14, 0, 0);
INSERT INTO `field` VALUES (61, 5, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)', 1, '', 15, 0, 1);
INSERT INTO `field` VALUES (62, 5, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 16, 1, 1);
INSERT INTO `field` VALUES (63, 5, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 17, 1, 1);
INSERT INTO `field` VALUES (64, 5, 'files', '上传文件', '', 0, 0, 0, 'defaul', '', 'files', 'file', 'array (\n  \'upload_allowext\' => \'zip,rar,doc,ppt\',\n)', 0, '', 5, 1, 0);
INSERT INTO `field` VALUES (65, 5, 'ext', '文档类型', '', 0, 0, 0, 'defaul', '', 'ext', 'text', 'array (\n  \'default\' => \'zip\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 6, 1, 0);
INSERT INTO `field` VALUES (66, 5, 'size', '文档大小', '', 0, 0, 0, 'defaul', '', 'size', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 7, 1, 0);
INSERT INTO `field` VALUES (67, 5, 'downs', '下载次数', '', 0, 0, 0, 'defaul', '', '', 'number', 'array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 0, '', 8, 1, 0);
INSERT INTO `field` VALUES (68, 6, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)', 1, '', 2, 1, 1);
INSERT INTO `field` VALUES (69, 6, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)', 1, '', 6, 0, 0);
INSERT INTO `field` VALUES (70, 6, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 4, 1, 1);
INSERT INTO `field` VALUES (71, 6, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 7, 1, 1);
INSERT INTO `field` VALUES (72, 6, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 5, 1, 1);
INSERT INTO `field` VALUES (73, 6, 'catid', '分类', '', 1, 0, 0, 'defaul', '', 'catid', 'catid', '', 0, '', 1, 1, 0);
INSERT INTO `field` VALUES (74, 6, 'info', '简介', '', 1, 0, 0, 'defaul', '', 'info', 'editor', 'array (\n  \'edittype\' => \'layedit\',\n)', 0, '', 3, 1, 0);
INSERT INTO `field` VALUES (75, 2, 'copyfrom', '来源', '', 0, 0, 0, 'defaul', '', 'copyfrom', 'text', 'array (\n  \'default\' => \'CLTPHP\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 8, 1, 0);
INSERT INTO `field` VALUES (76, 2, 'fromlink', '来源网址', '', 0, 0, 0, 'defaul', '', 'fromlink', 'text', 'array (\n  \'default\' => \'http://www.cltphp.com/\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 9, 1, 0);
INSERT INTO `field` VALUES (160, 2, 'tags', '标签', '', 1, 0, 0, 'defaul', '', 'tags', 'text', 'array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 5, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for front_config
-- ----------------------------
DROP TABLE IF EXISTS `front_config`;
CREATE TABLE `front_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台小程序配置';

-- ----------------------------
-- Records of front_config
-- ----------------------------
BEGIN;
INSERT INTO `front_config` VALUES (1, 'help', '<p><img src=\"http://relclothing.fuyouhome.top/uploads/ueditor/image/20200603/1591183642921266.png\" title=\"1591183642921266.png\" alt=\"WX20200601-175035.png\"/></p><p>欢迎访问@@</p>', 2147483647);
COMMIT;

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listfields` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of module
-- ----------------------------
BEGIN;
INSERT INTO `module` VALUES (1, '单页模型', 'page', '单页面', 1, 0, '*', 0, 1);
INSERT INTO `module` VALUES (2, '文章模型', 'article', '新闻文章', 1, 0, '*', 0, 1);
INSERT INTO `module` VALUES (3, '图片模型', 'picture', '图片展示', 1, 0, '*', 0, 1);
INSERT INTO `module` VALUES (4, '产品模型', 'product', '产品展示', 1, 0, '*', 0, 1);
INSERT INTO `module` VALUES (5, '下载模型', 'download', '文件下载', 1, 0, '*', 0, 1);
INSERT INTO `module` VALUES (6, '团队模型', 'team', '员工展示', 1, 0, '*', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for posid
-- ----------------------------
DROP TABLE IF EXISTS `posid`;
CREATE TABLE `posid` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `sort` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of posid
-- ----------------------------
BEGIN;
INSERT INTO `posid` VALUES (1, '首页推荐', 0);
INSERT INTO `posid` VALUES (2, '当前分类推荐', 0);
COMMIT;

-- ----------------------------
-- Table structure for siging_users
-- ----------------------------
DROP TABLE IF EXISTS `siging_users`;
CREATE TABLE `siging_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `pic` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `status` int(11) DEFAULT '1' COMMENT '状态： 1k开启/2关闭',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `openid` varchar(255) DEFAULT NULL COMMENT 'openid',
  `session_key` varchar(255) DEFAULT NULL COMMENT 'session_key',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of siging_users
-- ----------------------------
BEGIN;
INSERT INTO `siging_users` VALUES (24, 'haijiang.', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKzeMZtrTVx6dncL7wXkzack5LTDkAzzeAgf6fUo9T6f3tE1BFw88uqwau85qbEAIbCDpNkpFOJCg/132', 1, 1591002329, 'oXt3N4ly9BfLuv_CiWQExAEmXdQ8', NULL);
INSERT INTO `siging_users` VALUES (5, 'ukadmin', '', 1, 1588252553, NULL, NULL);
INSERT INTO `siging_users` VALUES (7, 'usaadmin', '', 1, 1588252593, NULL, NULL);
INSERT INTO `siging_users` VALUES (19, 'print( `对方正在讲话...`);', 'https://wx.qlogo.cn/mmopen/vi_32/aEe6usCKSYahmgK7sOZuYrcsXEH5ejCfCibBCQl4AjV5IrBruojQBHycu6NvfMMr4CRuAYdEAxGVhl7fZib3iaCYQ/132', 1, 1589975928, 'oXt3N4kcER3zEjMvbxdCkZstiRL4', NULL);
INSERT INTO `siging_users` VALUES (23, '米五的大长腿', 'https://wx.qlogo.cn/mmopen/vi_32/Za4Pewc9Ek44SkxvricYVCdiawhWC1ZbOyOwSwrCFHCzhEt2DssialWPJk1deCyIFm1uJibyYq3wcspJjsdJh7iaEow/132', 1, 1590068633, 'oXt3N4m9tDnSXn6VQ_zfUC5UtOzs', NULL);
INSERT INTO `siging_users` VALUES (17, '有个天想和你聊', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIbFFwlKCGmZRtoUlS0rnzrIfK0WdTzmicYmG96PL3Z3CSTThicaROZIlYcdibIM5mPhuNvv55Z3TJQg/132', 1, 1589884643, 'oXt3N4jVm_BEiB3xcA9JshkR1FA4', NULL);
INSERT INTO `siging_users` VALUES (20, NULL, NULL, 1, 1589978611, 'oXt3N4nf6f8R-Otc-VOaVamCTJt0', NULL);
INSERT INTO `siging_users` VALUES (21, NULL, NULL, 1, 1589978636, 'oXt3N4kd0UmAzUruDUfO1I6ULAO8', NULL);
INSERT INTO `siging_users` VALUES (22, '余青', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLx0mHmJrQnExdKCGjaYQCHQzUibgibS3eNO7vJanUznbCfNJ0aXGJRKuARic9ROEAYzuPYe7GWmR11A/132', 1, 1590059240, 'oXt3N4gUVO26Tvb_S3y4fgA2xocQ', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `sys_module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块id',
  `sys_module_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '模块名',
  `sys_module_table` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '模块表',
  `sys_module_detail` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '模块应用描述简介',
  `sys_module_add` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `sys_module_uid` int(10) unsigned DEFAULT NULL COMMENT '创建人',
  `sys_module_update` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改时间',
  `sys_module_upuid` int(10) unsigned DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`sys_module_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统模块表';

-- ----------------------------
-- Records of sys_module
-- ----------------------------
BEGIN;
INSERT INTO `sys_module` VALUES (1, 'Users', 'siging_users', '用户管理', '1586574198', 1, NULL, NULL);
INSERT INTO `sys_module` VALUES (5, 'Member', 'member', '会员管理', '1586574771', 1, NULL, NULL);
INSERT INTO `sys_module` VALUES (11, 'ServeType', 'ServeType', '服务类型管理', '1588745688', 1, NULL, NULL);
INSERT INTO `sys_module` VALUES (13, 'serve', 'serve', '服务管理', '1588746588', 1, NULL, NULL);
INSERT INTO `sys_module` VALUES (14, 'Banner', 'banner', '轮播图管理', '1588747369', 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_view
-- ----------------------------
DROP TABLE IF EXISTS `sys_view`;
CREATE TABLE `sys_view` (
  `Sysview_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '默认' COMMENT '系统视图名称',
  `detail` varchar(255) DEFAULT NULL COMMENT '备注',
  `include_code` varchar(500) DEFAULT NULL COMMENT '引入代码',
  PRIMARY KEY (`Sysview_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统视图代码生成表';

-- ----------------------------
-- Records of sys_view
-- ----------------------------
BEGIN;
INSERT INTO `sys_view` VALUES (2, '1579423132', '老师主视图引入学生视图', '<iframe src=\"/admin/Student/index_student_teacher_id_1579423132?student_teacher_id={$info_array.引入模块id}\" width=\"100%\" height=\"500px\" frameborder=\"0\"></iframe>');
COMMIT;

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(36) unsigned NOT NULL,
  `name` char(36) NOT NULL DEFAULT '' COMMENT '网站名称',
  `domain` varchar(36) NOT NULL DEFAULT '' COMMENT '网址',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `key` varchar(200) NOT NULL COMMENT '关键字',
  `des` varchar(200) NOT NULL COMMENT '描述',
  `bah` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(30) DEFAULT NULL COMMENT 'copyright',
  `ads` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(15) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `logo` varchar(120) DEFAULT NULL COMMENT 'logo',
  `mobile` varchar(10) DEFAULT 'open' COMMENT '是否开启手机端 open 开启 close 关闭',
  `code` varchar(10) DEFAULT 'close' COMMENT '是否开启验证码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system
-- ----------------------------
BEGIN;
INSERT INTO `system` VALUES (1, '活动管理', 'http://www.3sworld.com', '活动管理', '活动管理', '活动管理', '', '', '', '', '', '/uploads/20190305/0f33002431b9c35ad0c8f6be8834c064.png', 'open', 'open');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
