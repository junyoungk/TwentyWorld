

SELECT * FROM users;
INSERT INTO users VALUES (board_SEQ.nextval, 'jun', '1019', 'tester', '남', '111111', '27', '1', 'goldrex1@naver.com', '');

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '占쌉쏙옙占쏙옙 占쏙옙占쏙옙', '占쌉쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占실억옙占쏙옙占싹댐옙! 占쏙옙占쏙옙占쌈곤옙 占싱울옙占싹쇽옙占쏙옙~', '', 1, 0, 3000, '占쏙옙占쏙옙');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '占쏙옙占쏙옙占쌉쏙옙占쏙옙 占쏙옙占쏙옙', '占쏙옙占쏙옙占쌉쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占실억옙占쏙옙占싹댐옙! 占쏙옙占쏙옙占쌈곤옙 占싱울옙占싹쇽옙占쏙옙~', '', 1, 0, 3000, '占쏙옙占쏙옙');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '占쏙옙占쌉쏙옙占쏙옙 占쏙옙占쏙옙', '占쏙옙占쌉쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占실억옙占쏙옙占싹댐옙! 占쏙옙占쏙옙占쌈곤옙 占싱울옙占싹쇽옙占쏙옙~', '', 1, 0, 3000, '占쏙옙占쏙옙');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '행사 게시판 인서트' , '이곳은 행사 게시판입니다 진행되는 행사에 대해 알려드려요', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 인서트' , '이곳은 기타 게시판입니다 진행되는 기타에 대해 알려드려요', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '공지 게시판 인서트' , '이곳은 공지 게시판입니다 진행되는 공지에 대해 알려드려요', 1, 0, 3000, '공지');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '자유 게시판 인서트' , '이곳은 자유 게시판입니다 진행되는 자유에 대해 알려드려요', 1, 0, 1, '자유');

UPDATE board SET BOARD_CATEGORY = '자유' WHERE board_id = 2;
UPDATE board SET BOARD_CATEGORY = '행사' WHERE board_id = 3;
UPDATE board SET BOARD_AUTHORIZE = 1 WHERE board_id = 2;

SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate 
FROM board b, users u
WHERE b.board_writeuid = u.user_uid 
ORDER BY b.board_id DESC;



SELECT b.board_subject, u.user_name, b.board_regdate, b.board_content, b.board_category, b.board_viewcnt
FROM board b , users u
WHERE b.board_writeuid = u.user_uid AND b.board_category = '자유';

UPDATE board SET board_viewcnt = board_viewcnt + 1 WHERE board_id = 2;

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, ?, ?, ?, ?, 0, ?, ?);

DELETE FROM board WHERE board_id BETWEEN 21 AND 22;

UPDATE board SET board_img = 132 WHERE board_id = 25;

SELECT * FROM board ORDER BY board_id desc;
SELECT * FROM BOARDIMG;

/* 2020-06-03 �뀒�씠釉� 援ъ“ 蹂�寃� */

alter table board drop column board_img;

CREATE TABLE boardImg
(
	bi_uid number NOT NULL,
	bi_source varchar2(200) NOT NULL,
	bi_file varchar2(200) NOT NULL,
	board_id number NOT NULL,
	PRIMARY KEY (bi_uid)
);

ALTER TABLE boardImg
	ADD FOREIGN KEY (board_id)
	REFERENCES board (board_id)
;

CREATE SEQUENCE boardImg_SEQ;

alter table attraction modify(attr_img varchar2(200));
alter table attraction modify(attr_cardimg varchar2(200));
alter table attraction modify(attr_name varchar2(30));

alter table board modify(board_subject varchar2(50));

alter table users modify(user_email varchar2(100));

alter table ticket modify(ticket_img varchar2(200));
alter table ticket modify(ticket_name varchar2(50));

SELECT * FROM boardImg ORDER BY BI_UID DESC;
SELECT * FROM board ORDER BY board_id DESC;

SELECT bi_uid, bi_source, bi_file FROM boardImg WHERE BOARD_ID = 43 ORDER BY bi_uid DESC;
DELETE FROM board WHERE board_id = 8;

SELECT board_subject FROM board WHERE board_id = 42;
SELECT * FROM ATTRACTION;
SELECT * FROM TICKET;
SELECT * FROM users;
SELECT * FROM TICKETBUY;
SELECT board_id, board_subject 
FROM board 
WHERE board_id = (SELECT max(board_id) FROM board WHERE board_id < 9) ;

SELECT board_id, board_subject 
FROM board 
WHERE board_id = (SELECT min(board_id) FROM board WHERE board_id > 10) ;

SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate 
FROM board b, users u 
WHERE b.board_writeuid = u.user_uid 
ORDER BY b.board_id DESC;z


SELECT * FROM boardImg;
SELECT * FROM board WHERE board_category = '기타';

UPDATE board SET BOARD_AUTHORIZE = '1' WHERE BOARD_CATEGORY = '기타';


SELECT rownum , b.* FROM (SELECT * FROM board ORDER BY board_id DESC) b;

/* rownum 활용한 게시판 출력 */
SELECT rownum, b.*
FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate 
FROM board b, users u
WHERE b.board_writeuid = u.user_uid 
ORDER BY b.board_id ASC) b
ORDER BY ROWNUM desc; 

SELECT rownum, b.* FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate 
FROM board b, users u
WHERE b.board_writeuid = u.user_uid 
ORDER BY b.board_id ASC) b
WHERE board_subject LIKE '%이미지%' OR user_name LIKE '%김%'
ORDER BY ROWNUM desc; 

SELECT rownum, b.* FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate 
FROM board b, users u
WHERE b.board_writeuid = u.user_uid 
ORDER BY b.board_id ASC) b
WHERE board_category = '기타'
ORDER BY ROWNUM desc; 

UPDATE board SET BOARD_AUTHORIZE = 1 WHERE BOARD_CATEGORY ='자유';

SELECT * FROM board ORDER BY board_id desc;


/* 페이징 처리 rownum */
SELECT * FROM (
	SELECT rownum AS rnum , b.* 
	FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate FROM board b, users u WHERE b.board_writeuid = u.user_uid ORDER BY board_id DESC) b
)
WHERE rnum >= 1 AND rnum < 1+10;

SELECT * FROM board ORDER BY board_id desc;

INSERT INTO board (board_id, board_regdate, board_subject, BOARD_CONTENT , board_writeuid, board_viewcnt, BOARD_AUTHORIZE , BOARD_CATEGORY) 
	SELECT board_SEQ.nextval, sysdate, BOARD_SUBJECT , BOARD_CONTENT , BOARD_WRITEUID , BOARD_VIEWCNT , BOARD_AUTHORIZE , BOARD_CATEGORY FROM board;

DELETE FROM board WHERE board_id = 9 AND board_writeuid = 1;
UPDATE board SET board_subject = '테스트 됫냐', board_content = '테스트 됫지?' WHERE board_id = 7 AND BOARD_WRITEUID = 1;

SELECT * FROM LIKES ;

SELECT * FROM ATTRACTION ;

SELECT * FROM users;


SELECT * FROM BOARD ORDER BY board_id desc; 
SELECT count(*) FROM board WHERE BOARD_CATEGORY = '공지';

SELECT * FROM (
	SELECT rownum AS rnum , b.* 
	FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate FROM board b, users u WHERE b.board_writeuid = u.user_uid AND BOARD_CATEGORY = '자유' ORDER BY board_id DESC) b
)
WHERE rnum >= 1 AND rnum < 1+10;

SELECT * FROM (
	SELECT rownum AS rnum , b.* 
	FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate FROM board b, users u WHERE b.board_writeuid = u.user_uid AND (board_subject LIKE '%이미지%' OR user_name LIKE '%김%') ORDER BY board_id DESC) b
)
WHERE rnum >= 11 AND rnum < 11+10;

SELECT count(*) FROM board b , users u WHERE b.board_writeuid = u.user_uid AND (board_subject LIKE '%이미지%' OR user_name LIKE '%김%');

SELECT rownum, r.* FROM reply r WHERE REPLY_BOARDERID = 5 ORDER BY REPLY_ID DESC;

SELECT count(*) FROM reply WHERE REPLY_BOARDERID = 61;


SELECT * FROM (
	SELECT rownum AS rnum , b.* 
	FROM (SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate, r.replyCnt
			FROM board b, users u, (SELECT count(*) replyCnt FROM reply WHERE REPLY_BOARDERID = ?) r
			WHERE b.board_writeuid = u.user_uid 
			ORDER BY board_id DESC
			) b
)
WHERE rnum >= ? AND rnum < ?;

SELECT * FROM board ORDER BY board_id DESC;
UPDATE board SET BOARD_SUBJECT = '날짜까지 수정', BOARD_CONTENT = '내용수정 하면 날짜 까지?', BOARD_REGDATE = sysdate WHERE board_id = 61;

DELETE FROM board;
SELECT * FROM USERS ;
UPDATE users SET user_id = 'admin' WHERE user_uid = 1;
UPDATE users SET user_name = '운영자' WHERE user_uid = 1;
SELECT * FROM board ORDER BY board_id desc;
SELECT * FROM boardImg;


/*2020-06-11 초기 DB INSERT, CREATE 설정*/

INSERT INTO users VALUES (user_SEQ.nextval, 'junyoung', 1019, '김준영', '남자', '1234561111111', 27, 3000, '123@gmail.com', ''); /*내 계정*/

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '자유 게시판 인서트' , '이곳은 자유 게시판입니다 자유롭게 이용하세요!!', 1, 0, 1, '자유');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '와! 자유게시판이다!1' , '자유 게시판이네 1', 1, 0, 1, '자유');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '와! 자유게시판이다!2' , '자유 게시판이네 2', 1, 0, 1, '자유');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '와! 자유게시판이다!3' , '자유 게시판이네 3', 1, 0, 1, '자유');

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 인서트' , '이곳은 기타사항에 대한 게시판입니다. 자유롭게 이용하세요!!', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 1' , '기타 게시판에는 뭘 쓰지1', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 2' , '기타 게시판에는 뭘 쓰지2', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 3' , '기타 게시판에는 뭘 쓰지3', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 4' , '기타 게시판에는 뭘 쓰지4', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 5' , '기타 게시판에는 뭘 쓰지5', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 6' , '기타 게시판에는 뭘 쓰지6', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 7' , '기타 게시판에는 뭘 쓰지7', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 8' , '기타 게시판에는 뭘 쓰지8', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 9' , '기타 게시판에는 뭘 쓰지9', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 10' , '기타 게시판에는 뭘 쓰지10', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 11' , '기타 게시판에는 뭘 쓰지11', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 12' , '기타 게시판에는 뭘 쓰지12', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 13' , '기타 게시판에는 뭘 쓰지13', 1, 0, 1, '기타');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '기타 게시판 14' , '기타 게시판에는 뭘 쓰지14', 1, 0, 1, '기타');

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '공지 게시판 인서트' , '이곳은 공지게시판 입니다, 20대월드 관련 공지사항에 대해 알려드립니다', 1, 0, 3000, '공지');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '공지 게시판 이용사항' , '공지 게시판은 관리자만이 생성 가능합니다.', 1, 0, 3000, '공지');

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '행사 게시판 인서트' , '이곳은 행사 게시판입니다, 현 시간 20대 월드에서 진행중이거나 진행할 행사에 대해 알려 드립니다!', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '퍼레이드 행사' , '잠시후 15:00시 부터 퍼레이드가 있을 예정입니다', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '삼성페이 할인 행사' , '삼성페이로 이용권을 구매하시는 고객께는 10% 추가할인이 적용됩니다.', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '20대 할인 행사' , '20대월드에 오신 20대 이용고객님은 자유 이용권이 반값!', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '코로나 할인 행사' , '모두가 불편하고 힘든 코로나 20대 월드 로고가 들어간 마스크가 공짜입니다!', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '전 기구 20% 세일' , '8월4일까지 전 기구 이용요금이 20% 세일 적용', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '연간이용안내' , '8월4일까지 전 기구 이용요금이 20% 세일 적용', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '프리미엄투어' , '프리미엄투어를 이용하세요!', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '공연참여 프로그램' , '진행되는 공연에 참여하세요!', 1, 0, 3000, '행사');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '단체 프로그램' , '단체로 함께 해요!', 1, 0, 3000, '행사');

INSERT INTO board VALUES (board_seq.nextval, sysdate, '코로나 관련 공지사항', '코로나 관련 서울시청에서 내려온 공지사항 입니다. 20대월드 이용고객께서는 관련 사항을 필독하시고 숙지해주시기 바랍니다. 
1. 마스크를 착용해주세요.
2. 월드내에 비치된 손 세정제를 사용해주세요. 
3. 2m 거리를 두고 줄을 서세요
4. 코로나 관련 증상이 있으신 분은 방문을 삼가해 주시기 바랍니다.', 1, 0, 3000, '공지');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '코로나 확진자 발생!!' , '롯데월드에 코로나 확진자가 발생하였습니다. 모두 20대월드로 오새요!!! 롯데월드 가지마세요', 1, 0, 3000, '공지');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '5MEN 사이트 제휴 안내' , '5MEN 사이트에서 20대월드 이용 서적을 판매하고 있습니다.
5MEN 사이트를 적극 이용해 주세요!', 1, 0, 3000, '공지');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '오늘의 집 사이트 제휴 안내' , '오늘의 집 사이트가 개설되었습니다,
각자의 집을 예쁘게 꾸며 보세요!!', 1, 0, 3000, '공지');


DELETE FROM board WHERE BOARD_CATEGORY = '기타';







