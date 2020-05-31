/* test */

/* 관리차 추가 */
INSERT INTO USERS VALUES
(user_SEQ.nextval, '관리자','1234','관리자','','1111111111111',100,3000,'관리자@관리자.com','-');

/* 테이블 확인 */
SELECT * FROM USERS;