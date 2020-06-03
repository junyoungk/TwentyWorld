SELECT * FROM board;



SELECT * FROM users;

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '�Խ��� ����', '�Խ����� ���� �Ǿ����ϴ�! �����Ӱ� �̿��ϼ���~', '', 1, 0, 3000, '����');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '�����Խ��� ����', '�����Խ����� ���� �Ǿ����ϴ�! �����Ӱ� �̿��ϼ���~', '', 1, 0, 3000, '����');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '���Խ��� ����', '���Խ����� ���� �Ǿ����ϴ�! �����Ӱ� �̿��ϼ���~', '', 1, 0, 3000, '����');

SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate 
FROM board b, users u
WHERE b.board_writeuid = u.user_uid 
ORDER BY b.board_id DESC;

SELECT b.board_subject, u.user_name, b.board_regdate, b.board_content, b.board_category, b.board_img, b.board_viewcnt
FROM board b , users u
WHERE b.board_writeuid = u.user_uid AND b.board_id = 2;

UPDATE board SET board_viewcnt = board_viewcnt + 1 WHERE board_id = 2;

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, ?, ?, ?, ?, 0, ?, ?);

DELETE FROM board WHERE board_id BETWEEN 21 AND 22;

UPDATE board SET board_img = 132 WHERE board_id = 25;

SELECT * FROM board;

/* 2020-06-03 테이블 구조 변경 */

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



