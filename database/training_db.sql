/*

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-08 10:44:16
*/

SET FOREIGN_KEY_CHECKS=0;



-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_id` bigint(20) unsigned DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_place_id_places_id` (`place_id`),
  CONSTRAINT `orders_place_id_places_id` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- ----------------------------
-- Table structure for places
-- ----------------------------
DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of places
-- ----------------------------
INSERT INTO `places` VALUES ('1', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 1', 'far');
INSERT INTO `places` VALUES ('2', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 2', 'far');
INSERT INTO `places` VALUES ('3', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 3', 'far');
INSERT INTO `places` VALUES ('4', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 4', 'far');
INSERT INTO `places` VALUES ('5', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 5', 'far');
INSERT INTO `places` VALUES ('6', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 6', 'far');
INSERT INTO `places` VALUES ('7', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 7', 'far');
INSERT INTO `places` VALUES ('8', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 8', 'far');
INSERT INTO `places` VALUES ('9', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 9', 'far');
INSERT INTO `places` VALUES ('10', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 10', 'far');
INSERT INTO `places` VALUES ('11', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 11', 'far');
INSERT INTO `places` VALUES ('12', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 12', 'far');
INSERT INTO `places` VALUES ('13', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 13', 'far');
INSERT INTO `places` VALUES ('14', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 14', 'far');
INSERT INTO `places` VALUES ('15', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 15', 'far');
INSERT INTO `places` VALUES ('16', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 16', 'far');
INSERT INTO `places` VALUES ('17', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 17', 'near');
INSERT INTO `places` VALUES ('18', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 18', 'near');
INSERT INTO `places` VALUES ('19', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 19', 'near');
INSERT INTO `places` VALUES ('20', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 20', 'far');
INSERT INTO `places` VALUES ('21', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 21', 'far');
INSERT INTO `places` VALUES ('22', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 22', 'far');
INSERT INTO `places` VALUES ('23', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 23', 'far');
INSERT INTO `places` VALUES ('24', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 24', 'near');
INSERT INTO `places` VALUES ('25', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'ведущий', 'coach');
INSERT INTO `places` VALUES ('26', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 26', 'near');
INSERT INTO `places` VALUES ('27', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 27', 'far');
INSERT INTO `places` VALUES ('28', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 28', 'far');
INSERT INTO `places` VALUES ('29', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 29', 'far');
INSERT INTO `places` VALUES ('30', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 30', 'far');
INSERT INTO `places` VALUES ('31', '2019-03-30 12:25:44', '2019-03-30 12:25:44', 'место 31', 'near');
INSERT INTO `places` VALUES ('32', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 32', 'near');
INSERT INTO `places` VALUES ('33', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 33', 'near');
INSERT INTO `places` VALUES ('34', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 34', 'far');
INSERT INTO `places` VALUES ('35', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 35', 'far');
INSERT INTO `places` VALUES ('36', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 36', 'far');
INSERT INTO `places` VALUES ('37', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 37', 'far');
INSERT INTO `places` VALUES ('38', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 38', 'far');
INSERT INTO `places` VALUES ('39', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 39', 'far');
INSERT INTO `places` VALUES ('40', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 40', 'far');
INSERT INTO `places` VALUES ('41', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 41', 'far');
INSERT INTO `places` VALUES ('42', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 42', 'far');
INSERT INTO `places` VALUES ('43', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 43', 'far');
INSERT INTO `places` VALUES ('44', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 44', 'far');
INSERT INTO `places` VALUES ('45', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 45', 'far');
INSERT INTO `places` VALUES ('46', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 46', 'far');
INSERT INTO `places` VALUES ('47', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 47', 'far');
INSERT INTO `places` VALUES ('48', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 48', 'far');
INSERT INTO `places` VALUES ('49', '2019-03-30 12:25:45', '2019-03-30 12:25:45', 'место 49', 'far');


SET FOREIGN_KEY_CHECKS=1;
