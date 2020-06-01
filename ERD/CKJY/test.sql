/* test */

/* 관리차 추가 */

I
NSERT INTO USERS VALUES
(user_SEQ.nextval, '관리자','1234','관리자','','1111111111111',100,3000,'관리자@관리자.com','-');

/* 테이블 확인 */
SELECT * FROM USERS;
DELETE FROM USERS WHERE USER_ID = 'kimjinyoung';
SELECT * FROM BOARD;

SELECT user_id FROM USERS WHERE user_name = '관리자' AND user_jumin = '1111111111111'