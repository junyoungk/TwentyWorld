
/* Drop Tables */
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE likes CASCADE CONSTRAINTS;
DROP TABLE attraction CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE ticketbuy CASCADE CONSTRAINTS;
DROP TABLE ticket CASCADE CONSTRAINTS;





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
	user_email varchar2(30) NOT NULL,
	user_cardnum varchar2(20),
	PRIMARY KEY (user_uid)
);


CREATE TABLE attraction
(
	attr_id number NOT NULL,
	att_max number NOT NULL,
	attr_time number NOT NULL,
	attr_price number NOT NULL,
	attr_content clob,
	attr_name varchar2(20) NOT NULL,
	attr_location varchar2(5) NOT NULL,
	attr_min_age number,
	attr_max_age number,
	attr_min_height number,
	attr_max_height number,
	attr_authorize number NOT NULL,
	attr_regDate date NOT NULL,
	attr_img varchar2(30),
	attr_cardimg varchar2(30),
	PRIMARY KEY (attr_id)
);


CREATE TABLE board
(
	board_id number NOT NULL,
	board_regdate date NOT NULL,
	board_subject varchar2(30) NOT NULL,
	board_content clob,
	board_img varchar2(30),
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
	ticket_name varchar2(20) NOT NULL,
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
	REFERENCES ticket (ticket_id)
;




ALTER TABLE BOARD 
	ADD CONSTRAINT board_writeuid FOREIGN KEY(BOARD_WRITEUID) REFERENCES users(user_uid) ON DELETE CASCADE;


ALTER TABLE likes
	ADD FOREIGN KEY (user_uid)
	REFERENCES users (user_uid)
;


ALTER TABLE reply
	ADD FOREIGN KEY (reply_useruid)
	REFERENCES users (user_uid) ON DELETE CASCADE
;


ALTER TABLE ticketbuy
	ADD FOREIGN KEY (user_uid)
	REFERENCES users (user_uid) ON DELETE CASCADE
;

CREATE SEQUENCE attraction_SEQ;
CREATE SEQUENCE user_SEQ;
CREATE SEQUENCE reply_SEQ;
CREATE SEQUENCE board_SEQ;
CREATE SEQUENCE ticketbuy_SEQ;

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
						
						