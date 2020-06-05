SELECT * FROM board;



SELECT * FROM users;

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '占쌉쏙옙占쏙옙 占쏙옙占쏙옙', '占쌉쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占실억옙占쏙옙占싹댐옙! 占쏙옙占쏙옙占쌈곤옙 占싱울옙占싹쇽옙占쏙옙~', '', 1, 0, 3000, '占쏙옙占쏙옙');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '占쏙옙占쏙옙占쌉쏙옙占쏙옙 占쏙옙占쏙옙', '占쏙옙占쏙옙占쌉쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占실억옙占쏙옙占싹댐옙! 占쏙옙占쏙옙占쌈곤옙 占싱울옙占싹쇽옙占쏙옙~', '', 1, 0, 3000, '占쏙옙占쏙옙');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '占쏙옙占쌉쏙옙占쏙옙 占쏙옙占쏙옙', '占쏙옙占쌉쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占실억옙占쏙옙占싹댐옙! 占쏙옙占쏙옙占쌈곤옙 占싱울옙占싹쇽옙占쏙옙~', '', 1, 0, 3000, '占쏙옙占쏙옙');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '행사 게시판 인서트' , '이곳은 행사 게시판입니다 진행되는 행사에 대해 알려드려요', 1, 0, 3000, '행사');

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

SELECT * FROM board;
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
ORDER BY b.board_id DESC;


SELECT * FROM boardImg;
SELECT * FROM board WHERE board_category = '기타';

UPDATE board SET BOARD_AUTHORIZE = '1' WHERE BOARD_CATEGORY = '기타';


SELECT rownum , b.* FROM (SELECT * FROM board ORDER BY board_id DESC) b;

/* 페이징 처리 rownum */
SELECT * FROM (
	SELECT rownum AS rnum , b.* 
	FROM (SELECT * FROM board ORDER BY board_id DESC) b
)
WHERE rnum >= 21 AND rnum < (21+10); 

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
WHERE board_subject LIKE '%이미지%' OR user_name LIKE '%관리자%'
ORDER BY ROWNUM desc; 


