

CREATE TABLE pet_member(
	userId		CHAR(20)		NOT NULL		COMMENT'사용자아이디',
	userPwd	CHAR(20)		NOT NULL		COMMENT'사용자비밀번호',
	name		VARCHAR(20)		NOT NULL		COMMENT'이름',
  gender  char(1)     not null    comment'성별',
	birth		CHAR(10)		NOT NULL		COMMENT'생년월일',
	zipcode		CHAR(7)			NOT NULL		COMMENT'우편번호',
	addr		VARCHAR(50)		NOT NULL		COMMENT'주소',
	email		VARCHAR(50)		NOT NULL		COMMENT'이메일주소',
	mobile1		CHAR(3)			NOT NULL		COMMENT'앞번호',
	mobile2		CHAR(9)			NOT NULL		COMMENT'뒷번호',
	findPwdQuest	VARCHAR(150)		NOT NULL		COMMENT'비번질문',
	findPwdAnswer	VARCHAR(150)		NOT NULL		COMMENT'비번답변',
	dogSize	  CHAR(6)   COMMENT'견종크기',
	ownCar		CHAR(6)   COMMENT'차량소유',
	wantPackage	CHAR(6)     COMMENT'선호패키지',
	PRIMARY KEY(userId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원관리';

CREATE TABLE pet_reservation(
	num		INT			NOT NULL	AUTO_INCREMENT	COMMENT'번호',
	userId		CHAR(20)		NOT NULL		COMMENT'아이디',
	name		VARCHAR(20)		NOT NULL		COMMENT'이름',
	point_addr	VARCHAR(50)		NOT NULL		COMMENT'픽업주소',
	pickUp		CHAR(6)			NOT NULL		COMMENT'픽업여부',
	dateStart	CHAR(10)		NOT NULL		COMMENT'시작일자',
	dateEnd 	CHAR(10)		NOT NULL		COMMENT'마지막일자',
	package		CHAR(15)		NOT NULL		COMMENT'패키지',
	dogSize		CHAR(12)		NOT NULL		COMMENT'견종크기',
	memo		TEXT,
	PRIMARY KEY(num),
	FOREIGN KEY (userid) REFERENCES pet_member(userid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='예약관리';

CREATE TABLE pet_board (
num			int(11)			NOT NULL  	auto_increment COMMENT '번호',
	userId		CHAR(20)		NOT NULL		COMMENT'아이디',
name			varchar(20)		NOT NULL 			COMMENT '이름',
subject			varchar(50)		NOT NULL 			COMMENT '제목',
content			text 							COMMENT '본문',
pos			smallint(7) 		unsigned 			COMMENT '게시물번호',
ref			smallint(7) 						COMMENT '게시물그룹번호',
depth			smallint(7) 		unsigned 			COMMENT '게시물깊이',
regdate			date 							COMMENT '작성일',
pass			varchar(15) 						COMMENT '게시물 비번',
ip			varchar(15) 						COMMENT 'IP주소',
count			smallint(7) 		unsigned 			COMMENT '조회수',
filename		varchar(30) 						COMMENT '파일이름',
filesize			int(11) 							COMMENT '파일크기',
PRIMARY KEY (num),
FOREIGN KEY (userid) REFERENCES pet_member(userid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판';

CREATE TABLE pet_qAnda (
num			int(11)			NOT NULL  	auto_increment COMMENT '번호',
userId		CHAR(20)		NOT NULL		COMMENT'아이디',
name			varchar(20)		NOT NULL 			COMMENT '이름',
subject			varchar(50)		NOT NULL 			COMMENT '제목',
content			text 							COMMENT '본문',
pos			smallint(7) 		unsigned 			COMMENT '게시물번호',
ref			smallint(7) 						COMMENT '게시물그룹번호',
depth			smallint(7) 		unsigned 			COMMENT '게시물깊이',
regdate			date 							COMMENT '작성일',
pass			varchar(15) 						COMMENT '게시물 비번',
ip			varchar(15) 						COMMENT 'IP주소',
count			smallint(7) 		unsigned 			COMMENT '조회수',
filename		varchar(30) 						COMMENT '파일이름',
filesize			int(11) 							COMMENT '파일크기',
PRIMARY KEY (num),
FOREIGN KEY (userid) REFERENCES pet_member(userid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Q&A';


CREATE TABLE petZipcode(select* from java.tblzipcode);


drop table pet_member;
drop table pet_board;
drop table pet_reservation;