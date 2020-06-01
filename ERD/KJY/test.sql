SELECT * FROM board;


SELECT * FROM users;

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '게시판 개설', '게시판이 개설 되었습니다! 자유롭게 이용하세요~', '', 1, 0, 3000, '공지');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '자유게시판 개설', '자유게시판이 개설 되었습니다! 자유롭게 이용하세요~', '', 1, 0, 3000, '공지');
INSERT INTO board VALUES (board_SEQ.nextval, sysdate, '행사게시판 개설', '행사게시판이 개설 되었습니다! 자유롭게 이용하세요~', '', 1, 0, 3000, '공지');

SELECT b.board_id, b.board_category, u.user_name, b.board_subject, b.board_viewcnt, b.board_regdate 
FROM board b, users u
WHERE b.board_writeuid = u.user_uid 
ORDER BY b.board_id DESC;

SELECT b.board_subject, u.user_name, b.board_regdate, b.board_content, b.board_category, b.board_img, b.board_viewcnt
FROM board b , users u
WHERE b.board_writeuid = u.user_uid AND b.board_id = 2;

UPDATE board SET board_viewcnt = board_viewcnt + 1 WHERE board_id = 2;

INSERT INTO board VALUES (board_SEQ.nextval, sysdate, ?, ?, ?, ?, 0, ?, ?);

