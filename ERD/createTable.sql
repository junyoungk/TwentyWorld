
/* Drop Tables */
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE likes CASCADE CONSTRAINTS;
DROP TABLE attraction CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE ticketbuy CASCADE CONSTRAINTS;
DROP TABLE ticket CASCADE CONSTRAINTS;
DROP TABLE BOARDIMG CASCADE CONSTRAINTS;

DROP SEQUENCE user_SEQ;
DROP SEQUENCE reply_SEQ;
DROP SEQUENCE board_SEQ;
DROP SEQUENCE ticketbuy_SEQ;
DROP SEQUENCE ATTRACTION_WRITE_SEQ;
DROP SEQUENCE boardImg_SEQ;



/* Create Tables */
CREATE TABLE users
(
	user_uid number NOT NULL,
	user_id varchar2(20) NOT NULL,
	user_pw varchar2(20) NOT NULL,
	user_name varchar2(10) NOT NULL,
	user_gender varchar2(10),
	user_jumin varchar2(13) NOT NULL,
	user_age number NOT NULL,
	user_authorize number NOT NULL,
	user_email varchar2(50) NOT NULL,
	user_cardnum varchar2(20),
	PRIMARY KEY (user_uid)
);


CREATE TABLE attraction
(
attr_id number NOT NULL,
attr_max number NOT NULL, --탑승최대인원
attr_time number NOT NULL,
attr_price number NOT NULL,
attr_content clob NOT NULL, --NN추가
attr_name varchar2(50) NOT NULL, --50으로 바꿈
attr_location number NOT NULL, --넘버로 바꿈
attr_min_age NUMBER  NOT NULL, --NN추가
attr_max_age NUMBER  NOT NULL, --NN추가
attr_min_height number NOT NULL, --NN추가
attr_max_height number NOT NULL, --NN추가
attr_authorize number NOT NULL,
attr_regDate date,
attr_cardimg varchar2(300) NOT NULL, --NN추가
attr_img varchar2(300) NOT NULL, --NN추가
PRIMARY KEY (attr_id)
);


CREATE TABLE board
(
	board_id number NOT NULL,
	board_regdate date NOT NULL,
	board_subject varchar2(200) NOT NULL,
	board_content clob,	
	board_writeuid number NOT NULL,
	board_viewcnt number NOT NULL,
	board_authorize number NOT NULL,
	board_category varchar2(20) NOT NULL,
	PRIMARY KEY (board_id)
);


CREATE TABLE likes
(
	user_uid number NOT NULL,
	attr_id number NOT NULL,
	PRIMARY KEY (user_uid, attr_id)
);


CREATE TABLE reply
(
	reply_id number NOT NULL,
	reply_boarderid number NOT NULL,
	reply_useruid number NOT NULL,
	reply_comment clob,
	reply_regdate date NOT NULL,
	PRIMARY KEY (reply_id)
);


CREATE TABLE ticket
(
	ticket_id number NOT NULL,
	ticket_name varchar2(60) NOT NULL,
	ticket_price number NOT NULL,
	ticket_img varchar2(500) NOT NULL,
	PRIMARY KEY (ticket_id)
);


CREATE TABLE ticketbuy
(
	ticketbuy_id number NOT NULL,
	user_uid number NOT NULL,
	ticket_id number NOT NULL,
	PRIMARY KEY (ticketbuy_id)
);


CREATE TABLE boardImg
(
	bi_uid number NOT NULL,
	bi_source varchar2(200) NOT NULL,
	bi_file varchar2(200) NOT NULL,
	board_id number NOT NULL,
	PRIMARY KEY (bi_uid)
);

/* create sequence */
CREATE SEQUENCE user_SEQ;
CREATE SEQUENCE reply_SEQ;
CREATE SEQUENCE board_SEQ;
CREATE SEQUENCE ticketbuy_SEQ;
CREATE SEQUENCE ATTRACTION_WRITE_SEQ;
CREATE SEQUENCE boardImg_SEQ;




/* Create Foreign Keys */

ALTER TABLE likes
	ADD FOREIGN KEY (attr_id)
	REFERENCES attraction (attr_id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (reply_boarderid)
	REFERENCES board (board_id) ON DELETE CASCADE
;


ALTER TABLE ticketbuy
	ADD FOREIGN KEY (ticket_id)
	REFERENCES ticket (ticket_id) ON DELETE CASCADE
;

ALTER TABLE boardImg
	ADD FOREIGN KEY (board_id)
	REFERENCES board (board_id) ON DELETE CASCADE
;



ALTER TABLE BOARD ADD CONSTRAINT board_writeuid FOREIGN KEY(BOARD_WRITEUID) REFERENCES users(user_uid) ON DELETE CASCADE;


ALTER TABLE likes ADD FOREIGN KEY (user_uid) REFERENCES users (user_uid)
;


ALTER TABLE reply ADD FOREIGN KEY (reply_useruid) REFERENCES users (user_uid) ON DELETE CASCADE
;


ALTER TABLE ticketbuy ADD FOREIGN KEY (user_uid) REFERENCES users (user_uid) ON DELETE CASCADE
;


/* 넣어야할 값들 */



INSERT INTO USERS VALUES
(user_SEQ.nextval, 'ADMIN','1234','ADMIN','','111111111111',100,3000,'admin@admin.com','-');

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '행사 게시판 인서트' , '이곳은 행사 게시판입니다 진행되는 행사에 대해 알려드려요', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 인서트' , '이곳은 기타 게시판입니다 진행되는 기타에 대해 알려드려요', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '공지 게시판 인서트' , '이곳은 공지 게시판입니다 진행되는 공지에 대해 알려드려요', 1, 0, 3000, '공지');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '자유 게시판 인서트' , '이곳은 자유 게시판입니다 진행되는 자유에 대해 알려드려요', 1, 0, 1, '자유');







/* 밑에는 그냥 확인용 */

SELECT * FROM USERS;

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '게시물', '내용', '', 1, 0, 3000, '자유');
SELECT * FROM board;

select * from reply r;

INSERT INTO reply VALUES(reply_SEQ.nextval,)

SELECT * FROM BOARDIMG;

SELECT * FROM USERS;

SELECT  r.reply_id, r.reply_boarderid, u.user_name, r.reply_comment, r.reply_regdate FROM reply r,board b, users u 
				  WHERE u.USER_UID = r.REPLY_USERUID AND r.REPLY_BOARDERID = 5 ;
SELECT b.board_id, b.board_category, u.user_name, b.board_subject,b.board_viewcnt, b.board_regdate FROM board b, users u "
						+ "WHERE b.board_writeuid = u.user_uid ORDER BY b.board_id DESC
						
						
SELECT r.reply_id,r.reply_boarderid, u.user_name, r.reply_comment, r.reply_regdate FROM reply r,board b, users u 
WHERE b.board_id = r.reply_boarderid AND u.USER_UID = r.REPLY_USERUID					
												
SELECT r.reply_id,r.reply_boarderid, u.user_name, r.reply_comment, r.reply_regdate FROM reply r,board b, users u WHERE b.board_id = r.reply_boarderid AND u.USER_UID = r.REPLY_USERUID					
						
						
SELECT r.reply_id, r.reply_boarderid, u.USER_UID ,u.user_name, r.reply_comment, r.reply_regdate 
FROM reply r,board b, users u WHERE r.reply_boarderid = 5 AND u.USER_UID = r.REPLY_USERUID AND 
b.BOARD_ID = r.REPLY_BOARDERID ; 
								
DELETE FROM reply WHERE REPLY_ID = 62 AND REPLY_BOARDERID = 21;				
						
SELECT rownum , b.BOARD_ID , b.BOARD_SUBJECT, b.BOARD_REGDATE FROM board b WHERE BOARD_CATEGORY = '공지' AND rownum <= 5 ORDER BY board_id DESC
						