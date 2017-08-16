--
﻿PRAGMA foreign_keys = ON;


-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;


-- ---
-- Table 'countries'
--
-- ---


DROP TABLE IF EXISTS 'country';

CREATE TABLE 'country' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'name' VARCHAR NULL DEFAULT NULL,
  'code' INTEGER NULL DEFAULT NULL
);






-- ---
-- Table 'state'
--
-- ---


DROP TABLE IF EXISTS 'state';

CREATE TABLE 'state' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'name' VARCHAR,
  'code' INTEGER,
  'countryid' INTEGER,
   FOREIGN KEY (countryid) REFERENCES 'country' ('id')
);






-- ---
-- Table 'color'
--
-- ---


DROP TABLE IF EXISTS 'color';

CREATE TABLE 'color' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'name' VARCHAR NULL DEFAULT NULL,
  'colorfamily' INTEGER NULL DEFAULT NULL
);


-- ---
-- Table 'yarn'
--
-- ---


DROP TABLE IF EXISTS 'yarn';

CREATE TABLE 'yarn' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'name' VARCHAR(200) NULL DEFAULT NULL,
  'brand' INTEGER NULL DEFAULT NULL,
  'weight' INTEGER NULL DEFAULT NULL,
  'yardage' INTEGER NULL DEFAULT NULL,
  'colorways' INTEGER NULL DEFAULT NULL,
  'price' INTEGER NULL DEFAULT NULL,
  'fiber' VARCHAR NULL DEFAULT NULL,
  'desc' INTEGER NULL DEFAULT NULL,
  FOREIGN KEY (colorways) REFERENCES 'color' ('id')
);


-- ---
-- Table 'raveler'
--
-- ---


DROP TABLE IF EXISTS 'raveler';

CREATE TABLE 'raveler' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'firstname' VARCHAR(100) NULL DEFAULT NULL,
  'ravelname' VARCHAR(100) NULL DEFAULT NULL,
  'website' VARCHAR(200) NULL DEFAULT NULL,
  'country' INTEGER NULL DEFAULT NULL,
  'state' INTEGER NULL DEFAULT NULL,
  'city' VARCHAR(200) NULL DEFAULT NULL,
  'favcolor' VARCHAR(200) NULL DEFAULT NULL,
  'desc' INTEGER NULL DEFAULT NULL
);


-- ---
-- Table 'pattern'
--
-- ---


DROP TABLE IF EXISTS 'pattern';

CREATE TABLE 'pattern' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'name' VARCHAR(200) NULL DEFAULT NULL,
  'craft' INTEGER NULL DEFAULT NULL,
  'category' INTEGER NULL DEFAULT NULL,
  'suggestedyarn' INTEGER NULL DEFAULT NULL,
  'yarnweight' INTEGER NULL DEFAULT NULL,
  'gauge' VARCHAR(200) NULL DEFAULT NULL,
  'needle' INTEGER NULL DEFAULT NULL,
  'yardage' VARCHAR(200) NULL DEFAULT NULL,
  'desc' INTEGER NULL DEFAULT NULL,
  FOREIGN KEY (suggestedyarn) REFERENCES 'yarn' ('id')
);




-- ---
-- Table 'project'
--
-- ---


DROP TABLE IF EXISTS 'project';

CREATE TABLE 'project' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'raveler' INTEGER NULL DEFAULT NULL,
  'name' VARCHAR(200) NULL DEFAULT NULL,
  'craft' INTEGER NULL DEFAULT NULL,
  'startdate' DATE NULL DEFAULT NULL,
  'enddate' DATE NULL DEFAULT NULL,
  'pattern' INTEGER NULL DEFAULT NULL,
  'yarn' INTEGER NULL DEFAULT NULL,
  'colorway' INTEGER NULL DEFAULT NULL,
  'needles' INTEGER NULL DEFAULT NULL,
  'desc' INTEGER NULL DEFAULT NULL,
   FOREIGN KEY (colorway) REFERENCES 'color' ('id'),
FOREIGN KEY (raveler) REFERENCES 'raveler' ('id'),
FOREIGN KEY (pattern) REFERENCES 'pattern' ('id'),
FOREIGN KEY (yarn) REFERENCES 'yarn' ('id')
);




-- ---
-- Test Data
-- ---
 INSERT INTO 'country' ('name','code') VALUES
 ('United State of America','USA');


-- INSERT INTO 'project' ('id','raveler','name','craft','startdate','enddate','pattern','yarn','colorway','needles','desc') VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO 'raveler' ('id','firstname','ravelname','website','country','state','city','favcolor','desc') VALUES
-- ('','','','','','','','','');
-- INSERT INTO 'pattern' ('id','name','craft','category','suggestedyarn','yarnweight','gauge','needle','yardage','desc') VALUES
-- ('','','','','','','','','','');
-- INSERT INTO 'yarn' ('id','name','brand','weight','yardage','colorways','desc') VALUES
-- ('','','','','','','');
-- INSERT INTO 'color' ('id','name','colorfamily') VALUES
-- ('','','');
