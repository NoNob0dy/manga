CREATE TABLE `user` (
  `account` varchar(32) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `place` varchar(6) NOT NULL,
  `email` varchar(32) NOT NULL,
  `type` varchar(6) NOT NULL,
  `age` int NOT NULL,
  `wallet` float NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`account`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);
CREATE TABLE `manga_data` (
  `owner` varchar(32) NOT NULL,
  `mname` varchar(32) NOT NULL,
  `mauthor` varchar(32) NOT NULL,
  `mpublish` varchar(32) NOT NULL,
  `mdate` date NOT NULL,
  `mtype` varchar(32) NOT NULL,
  `mstate` varchar(6) NOT NULL DEFAULT '在售',
  `mpicname` varchar(32) NOT NULL,
  `mnum` int NOT NULL,
  `mprice` float NOT NULL,
  PRIMARY KEY (`owner`, `mname`),
  FOREIGN KEY (`owner`) REFERENCES `user` (`account`)
);
CREATE TABLE `indent` (
  `buyer` varchar(32) NOT NULL,
  `saler` varchar(32) NOT NULL,
  `mname` varchar(32) NOT NULL,
  `mprice` float NOT NULL,
  `otime` date NOT NULL,
  PRIMARY KEY (`buyer`, `saler`, `mname`),
  FOREIGN KEY (`buyer`) REFERENCES `user` (`account`),
  FOREIGN KEY (`saler`, `mname`) REFERENCES `manga_data` (`owner`, `mname`)
);