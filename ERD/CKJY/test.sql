/* test */

/* ������ �ֱ� */
INSERT INTO USERS VALUES
(user_SEQ.nextval, '������','1234','������','','1111111111111',100,3000,'������@������.com','-');

SELECT * FROM USERS;
SELECT user_pw FROM users WHERE USER_ID = '������';