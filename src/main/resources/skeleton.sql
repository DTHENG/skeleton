SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

USE `skeleton`;

DROP TABLE IF EXISTS `instagram`;

CREATE TABLE IF NOT EXISTS `instagram` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `type` varchar(2) NOT NULL,
  `filter` varchar(100) DEFAULT NULL,
  `createdTime` int(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `userHasLiked` int(2) NOT NULL,
  `instagramId` varchar(255) NOT NULL UNIQUE,
  `latitude` double DEFAULT 0.0,
  `longitude` double DEFAULT 0.0,
  `locationName` varchar(255) DEFAULT NULL,
  `locationId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2;

INSERT INTO `instagram` (`type`,`filter`,`createdTime`,`link`,`caption`,`userHasLiked`,`instagramId`,`latitude`,`longitude`,`locationName`,`locationId`) VALUES
(0, 'Hudson', 1389471401, 'http://instagram.com/p/jCqna0ImNS/', NULL, 0, '631254324590306130_19082199', 37.788039, -122.405880349, 'Xanadu Gallery', 387254),
(0, 'X-Pro II', 1387998591, 'http://instagram.com/p/iWxdHcImEG/', 'Dad browning the prime rib', 0, '618899503942099206_19082199', 37.324416667, -120.456078333, NULL, NULL),
(0, 'Normal', 1378453033, 'http://instagram.com/p/d6Sv0OomC6/', NULL, 0, '538825556156899514_19082199', 37.778150479, -122.405719941, '1015 Folsom', 87148),
(0, 'Amaro', 1378455656, 'http://instagram.com/p/d6XwAoomFo/', NULL, 0, '538847559710564712_19082199', 37.778150479, -122.405719941, '1015 Folsom', 87148),
(0, 'Rise', 1380224915, 'http://instagram.com/p/evGV9SImO0/', NULL, 0, '553689176380433332_19082199', 37.782523314, -122.410392165, 'The Warfield Theatre', 1647);

DROP TABLE IF EXISTS `instagramLike`;

CREATE TABLE IF NOT EXISTS `instagramLike` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `instagramId` BIGINT NOT NULL,
  `username` varchar(255) NOT NULL,
  `profilePicture` varchar(255) NOT NULL,
  `likeId` varchar(50) NOT NULL UNIQUE,
  `fullName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=2;

INSERT INTO `instagramLike` (`instagramId`,`username`,`profilePicture`,`likeId`,`fullName`) VALUES
(2, 'sfscout', 'http://images.ak.instagram.com/profiles/profile_8103016_75sq_1382838761.jpg', '8103016_68', 'sfscout'),
(3, 'victoriascherpel', 'http://images.ak.instagram.com/profiles/profile_54714013_75sq_1381719511.jpg', '54714013_67', 'Victoria Grace'),
(3, 'ryanrotman', 'http://images.ak.instagram.com/profiles/profile_30899022_75sq_1333784780.jpg', '30899022_67', 'Ryan Rotman'),
(3, 'kaciw326', 'http://images.ak.instagram.com/profiles/profile_196971485_75sq_1342840570.jpg', '196971485_67', 'kaciw326'),
(5, 'ehooves', 'http://images.ak.instagram.com/profiles/profile_329381929_75sq_1368480487.jpg', '329381929_65', 'Emily'),
(6, 'rockinhair7', 'http://images.ak.instagram.com/profiles/profile_924753_75sq_1383457490.jpg', '924753_64', 'Arias/Alcala'),
(6, 'candidcrafts', 'http://images.ak.instagram.com/profiles/profile_47595058_75sq_1360182397.jpg', '47595058_64', 'Mary Thengvall');

DROP TABLE IF EXISTS `instagramContent`;

CREATE TABLE IF NOT EXISTS `instagramContent` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `instagramId` BIGINT NOT NULL,
  `size` int(2) NOT NULL,
  `type` int(2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `contentId` varchar(50) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=2;

INSERT INTO `instagramContent` (`instagramId`,`size`,`type`,`url`,`contentId`) VALUES
(2, 0, 0, 'http://distilleryimage1.s3.amazonaws.com/42c5d04c7afd11e38c200e1bc264082d_6.jpg', '200'),
(2, 2, 0, 'http://distilleryimage1.s3.amazonaws.com/42c5d04c7afd11e38c200e1bc264082d_5.jpg', '202'),
(2, 1, 0, 'http://distilleryimage1.s3.amazonaws.com/42c5d04c7afd11e38c200e1bc264082d_8.jpg', '201'),
(3, 0, 0, 'http://distilleryimage9.s3.amazonaws.com/0a5705546d9811e39b620ee008643df5_6.jpg', '300'),
(3, 2, 0, 'http://distilleryimage9.s3.amazonaws.com/0a5705546d9811e39b620ee008643df5_5.jpg', '302'),
(3, 1, 0, 'http://distilleryimage9.s3.amazonaws.com/0a5705546d9811e39b620ee008643df5_8.jpg', '301'),
(4, 0, 0, 'http://distilleryimage2.s3.amazonaws.com/257f2b7c16c711e39b8d22000aaa0a64_6.jpg', '400'),
(4, 2, 0, 'http://distilleryimage2.s3.amazonaws.com/257f2b7c16c711e39b8d22000aaa0a64_5.jpg', '402'),
(4, 1, 0, 'http://distilleryimage2.s3.amazonaws.com/257f2b7c16c711e39b8d22000aaa0a64_7.jpg', '401'),
(5, 0, 0, 'http://distilleryimage0.s3.amazonaws.com/40f0f04216cd11e3919022000a1f8daa_6.jpg', '500'),
(5, 2, 0, 'http://distilleryimage0.s3.amazonaws.com/40f0f04216cd11e3919022000a1f8daa_5.jpg', '502'),
(5, 1, 0, 'http://distilleryimage0.s3.amazonaws.com/40f0f04216cd11e3919022000a1f8daa_7.jpg', '501'),
(6, 0, 0, 'http://distilleryimage4.s3.amazonaws.com/a13ad1f826e411e3933022000aa8032d_6.jpg', '600'),
(6, 2, 0, 'http://distilleryimage4.s3.amazonaws.com/a13ad1f826e411e3933022000aa8032d_5.jpg', '602'),
(6, 1, 0, 'http://distilleryimage4.s3.amazonaws.com/a13ad1f826e411e3933022000aa8032d_7.jpg', '601');