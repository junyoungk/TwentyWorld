/* test */

/* 관리차 추가 */

I
NSERT INTO USERS VALUES
(user_SEQ.nextval, '관리자','1234','관리자','','1111111111111',100,3000,'관리자@관리자.com','-');

/* 테이블 확인 */
SELECT * FROM USERS ORDER BY USER_UID DESC ;
DELETE FROM USERS WHERE USER_ID = 'kimjinyoung';
SELECT * FROM BOARD;

SELECT user_id FROM USERS WHERE user_name = '관리자' AND user_jumin = '1111111111111';
SELECT * FROM TICKET;
INSERT INTO TICKET VALUES (1,'자유이용권',20000,'이미지');
INSERT INTO TICKET VALUES (2,'입장권',5000,'이미지');
INSERT INTO TICKET VALUES (3,'빅3',10000,'이미지');
INSERT INTO TICKET VALUES (4,'야간권',15000,'이미지');
INSERT INTO TICKET VALUES (5,'빅5',15000,'이미지');

SELECT BOARD_SUBJECT FROM BOARD WHERE BOARD_WRITEUID = 4;
SELECT * FROM BOARD;

SELECT * FROM USERS;
SELECT * FROM REPLY;
SELECT * FROM TICKET;
SELECT * FROM TICKETBUY;
SELECT REPLY_BOARDERID FROM REPLY WHERE REPLY_USERUID = 1 ORDER BY REPLY_REGDATE DESC

SELECT t.TICKET_NAME, tb.TICKETBUY_ID FROM TICKET t , USERS u ,TICKETBUY tb WHERE tb.USER_UID = u.USER_UID AND tb.TICKET_ID  = t.TICKET_ID AND u.USER_UID = 1 ORDER BY tb.TICKETBUY_ID DESC;


