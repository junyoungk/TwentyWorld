/* test */

/* 包府磊 持扁 */
INSERT INTO USERS VALUES
(user_SEQ.nextval, '包府磊','1234','包府磊','','1111111111111',100,3000,'包府磊@包府磊.com','-');

SELECT * FROM USERS;
SELECT user_pw FROM users WHERE USER_ID = '包府磊';