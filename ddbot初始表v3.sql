-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2024-07-01 07:02:45
-- 服务器版本： 8.0.31
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ddbot`
--

-- --------------------------------------------------------

--
-- 表的结构 `activetimestamp`
--

DROP TABLE IF EXISTS `activetimestamp`;
CREATE TABLE IF NOT EXISTS `activetimestamp` (
  `uid` bigint NOT NULL COMMENT '用户ID',
  `timestamp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上次推送的时间戳（字符串格式）',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户上次推送时间戳表';

-- --------------------------------------------------------

--
-- 表的结构 `concernconfig`
--

DROP TABLE IF EXISTS `concernconfig`;
CREATE TABLE IF NOT EXISTS `concernconfig` (
  `group_id` bigint NOT NULL COMMENT '群号',
  `uid` bigint NOT NULL COMMENT 'B站UP主的UID',
  `config` json NOT NULL COMMENT 'JSON配置信息',
  PRIMARY KEY (`group_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Q群关注动态推送配置表';

-- --------------------------------------------------------

--
-- 表的结构 `concernstate`
--

DROP TABLE IF EXISTS `concernstate`;
CREATE TABLE IF NOT EXISTS `concernstate` (
  `group_id` bigint NOT NULL COMMENT '群号',
  `uid` bigint NOT NULL COMMENT '用户ID',
  `push_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推送模式',
  `group_concern_at_all` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '开播@全体开关',
  `group_concern_at_someone` json DEFAULT NULL COMMENT '开播@群员开关（存储为JSON格式的列表）',
  `group_concern_filter_not_type` json DEFAULT NULL COMMENT '动态不推送过滤类型',
  `group_concern_offline_notify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '下播通知开关',
  `group_concern_title_change_notify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主播修改标题通知开关',
  PRIMARY KEY (`group_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Q群关注对照表';

-- --------------------------------------------------------

--
-- 表的结构 `concernstate.old`
--

DROP TABLE IF EXISTS `concernstate.old`;
CREATE TABLE IF NOT EXISTS `concernstate.old` (
  `group_id` bigint NOT NULL COMMENT '群号',
  `uid` bigint NOT NULL COMMENT '用户ID',
  `push_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推送模式',
  PRIMARY KEY (`group_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Q群关注对照表';

-- --------------------------------------------------------

--
-- 表的结构 `concernstatev2`
--

DROP TABLE IF EXISTS `concernstatev2`;
CREATE TABLE IF NOT EXISTS `concernstatev2` (
  `group_id` bigint NOT NULL COMMENT '群号',
  `uid` bigint NOT NULL COMMENT '用户ID',
  `push_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推送模式',
  `at_all` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '开播@全体开关',
  `at_someone` json DEFAULT NULL COMMENT '开播@群员开关（存储为JSON格式的列表）',
  `filter_not_type` json DEFAULT NULL COMMENT '动态不推送过滤类型',
  `offline_notify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '下播通知开关',
  `title_change_notify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主播修改标题通知开关',
  PRIMARY KEY (`group_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Q群关注对照表';

-- --------------------------------------------------------

--
-- 表的结构 `groupenable`
--

DROP TABLE IF EXISTS `groupenable`;
CREATE TABLE IF NOT EXISTS `groupenable` (
  `group_id` bigint NOT NULL COMMENT '群号',
  `command` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '命令',
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '启用（enable）或者禁用（disable）',
  PRIMARY KEY (`group_id`,`command`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存放该群的某些命令的启用与禁用';

-- --------------------------------------------------------

--
-- 表的结构 `groupmute`
--

DROP TABLE IF EXISTS `groupmute`;
CREATE TABLE IF NOT EXISTS `groupmute` (
  `group_id` bigint NOT NULL COMMENT '群号',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='记录处于mute状态下的群';

-- --------------------------------------------------------

--
-- 表的结构 `grouppermission`
--

DROP TABLE IF EXISTS `grouppermission`;
CREATE TABLE IF NOT EXISTS `grouppermission` (
  `group_id` bigint NOT NULL COMMENT '群号',
  `qq_id` bigint NOT NULL COMMENT 'QQ号',
  PRIMARY KEY (`group_id`,`qq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='赋予群成员本群机器人管理员权限表';

-- --------------------------------------------------------

--
-- 表的结构 `groupsilence`
--

DROP TABLE IF EXISTS `groupsilence`;
CREATE TABLE IF NOT EXISTS `groupsilence` (
  `group_id` bigint NOT NULL COMMENT '群号',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='记录处于silence状态下的群';

--
-- 表的结构 `livetimestamp`
--

DROP TABLE IF EXISTS `livetimestamp`;
CREATE TABLE IF NOT EXISTS `livetimestamp` (
  `uid` bigint NOT NULL COMMENT '主播UID',
  `room_id` bigint NOT NULL COMMENT '直播间的房间号',
  `live_status` enum('live','offline','banned','error','others') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播状态',
  `last_live_timestamp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上一次开播的时间戳',
  `last_offline_timestamp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上一次下播的时间戳',
  `cover_image_url` text COLLATE utf8mb4_unicode_ci COMMENT '直播封面的图片URL',
  `cover_image_base64` longtext COLLATE utf8mb4_unicode_ci COMMENT 'base64格式编码的直播封面',
  `remarks` text COLLATE utf8mb4_unicode_ci COMMENT '备注信息，比如某主播直播间被封到什么时候',
  PRIMARY KEY (`uid`,`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存放主播的直播状态';

-- --------------------------------------------------------

--
-- 表的结构 `mode`
--

DROP TABLE IF EXISTS `mode`;
CREATE TABLE IF NOT EXISTS `mode` (
  `mode` enum('public','private','audit','protect') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机器人模式',
  PRIMARY KEY (`mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='机器人模式表';

--
-- 转存表中的数据 `mode`
--

INSERT INTO `mode` (`mode`) VALUES
('protect');

-- --------------------------------------------------------

--
-- 表的结构 `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `qq_id` bigint NOT NULL COMMENT 'QQ号',
  `group_id` bigint DEFAULT NULL COMMENT '群号',
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '赋予的命令或者权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限和命令赋予表';

-- --------------------------------------------------------

--
-- 表的结构 `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `group_id` bigint NOT NULL COMMENT '群号',
  `qq_id` bigint NOT NULL COMMENT 'QQ号',
  `points` bigint NOT NULL COMMENT '积分',
  PRIMARY KEY (`group_id`,`qq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='群成员签到积分表';

-- --------------------------------------------------------

--
-- 表的结构 `uidfirsttimestamp`
--

DROP TABLE IF EXISTS `uidfirsttimestamp`;
CREATE TABLE IF NOT EXISTS `uidfirsttimestamp` (
  `uid` bigint NOT NULL COMMENT '用户ID',
  `timestamp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '首次推送的时间戳（字符串格式）',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户首次推送时间戳表';

-- --------------------------------------------------------

--
-- 表的结构 `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE IF NOT EXISTS `userinfo` (
  `uid` bigint NOT NULL COMMENT '机器人内部ID',
  `mid` bigint NOT NULL COMMENT '主站ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'UP名称',
  `room_id` bigint NOT NULL COMMENT '直播间房号',
  `room_url` text COLLATE utf8mb4_unicode_ci COMMENT '直播间URL',
  PRIMARY KEY (`uid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关注的主播信息表';

-- --------------------------------------------------------

--
-- 表的结构 `userinfo.bk`
--

DROP TABLE IF EXISTS `userinfo.bk`;
CREATE TABLE IF NOT EXISTS `userinfo.bk` (
  `uid` bigint NOT NULL COMMENT '机器人内部ID',
  `mid` bigint NOT NULL COMMENT '主站ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'UP名称',
  `room_id` bigint NOT NULL COMMENT '直播间房号',
  `room_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '直播间URL',
  PRIMARY KEY (`uid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关注的主播信息表';

-- --------------------------------------------------------

--
-- 表的结构 `userinfo.old`
--

DROP TABLE IF EXISTS `userinfo.old`;
CREATE TABLE IF NOT EXISTS `userinfo.old` (
  `uid` bigint NOT NULL COMMENT '用户ID',
  `data` json NOT NULL COMMENT '关注的主播信息（JSON格式）',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关注的主播信息表';

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
