-- TODO : 
-- 수정중 ㅠㅠ!!

-- 테이블 삭제
DROP TABLE attraction CASCADE CONSTRAINT;
-- 시퀀스 삭제
DROP SEQUENCE ATTRACTION_WRITE_SEQ;

CREATE TABLE attraction
(
attr_id number NOT NULL,
attr_max number NOT NULL, --탑승최대인원
attr_time number NOT NULL,
attr_price number NOT NULL,
attr_content clob NOT NULL, --NN추가
attr_name varchar2(50) NOT NULL, --50으로 바꿈
attr_location number NOT NULL, --넘버로 바꿈
attr_min_age NUMBER  NOT NULL, --NN추가
attr_max_age NUMBER  NOT NULL, --NN추가
attr_min_height number NOT NULL, --NN추가
attr_max_height number NOT NULL, --NN추가
attr_authorize number NOT NULL,
attr_regDate date,
attr_cardimg varchar2(300) NOT NULL, --NN추가
attr_img varchar2(300) NOT NULL, --NN추가
PRIMARY KEY (attr_id)
);

--시퀀스 생성
CREATE SEQUENCE ATTRACTION_WRITE_SEQ;

-- 테이블 확인
SELECT  * FROM ATTRACTION;

-- 메모용 : 1~6실내,11~16실외/ _1어린이만,_2_3키중간만,_3~_6상관없음
-- 제가 테이블 값 넣을때 편하도록 이렇게 생각한 것 뿐이지 attr_id 값은 시퀀스로 들어갑니다!!! 

-- 전체 선택 후 alt + x
-- 기구번호/ 최대탑승인원/소요시간/기구가격/기구설명/
-- 기구이름/ 기구위치/ 최소나이/ 최대나이/ 최소키/ 최대키/ 권한/ 기구등록일/ -- 이미지/ 카드이미지

--1
INSERT
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 13, 10, 3000, 
	'호랑이를 피해 햇님달님 오누이와 하늘 위로 점프! 스릴 만점의 신나는 개구쟁이 탑승물!',
	'어린이번지', 0, 0, 7, 50, 110, 1, sysdate, 
	'attr_img/attr_cardimg_childbunge.jpg', 'attr_img/attr_img_childbunge.jpg');
--2	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 4, 10, 8000, 
	'숨이 멈출 것 같은 롤러코스터의 매력! 물줄기도 이 짜릿함을 벗어날 수 없다!',
	'실내롤러코스터', 0, 10, 64, 120, 180, 1, sysdate, 
	'attr_img/attr_cardimg_insidecoster.jpg', 'attr_img/attr_img_insidecoster.jpg');
--3	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 56, 15, 8000, 
	'위 아래로 왔다갔다~! 바람을 느끼며 신나는 놀이기구!',
	'바이킹', 0, 10, 80, 110, 180, 1, sysdate, 
	'attr_img/attr_cardimg_biking.jpg', 'attr_img/attr_img_biking.jpg');
---4	 
INSERT 
	INTO ATTRACTION
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 4, 30, 5000, 
	'그럴싸~한 셀프 포토 스튜디오 20여 개의 다양한 테마 포토존에서 인생사진 찍어가세요!',
	'사진관', 0, 0, 100, 0, 250, 1,sysdate, 
	'attr_img/attr_cardimg_pic.jpg', 'attr_img/attr_img_pic.jpg');
--5	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 6, 20, 5000, 
	'하늘 꼭대기에서 내려다본 작은 세계, 풍선을 타고 떠나 보십시오~ 20대 월드 최고의 전망코스~',
	'풍선비행', 0, 0, 100, 30, 220, 1,sysdate, 
	'attr_img/attr_cardimg_ballon.jpg', 'attr_img/attr_img_ballon.jpg');
--6	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 64, 15, 5000, 
	'백마를 타고 떠나는 로맨틱한 여행! 연인, 가족과 함께하면 즐거움이 배로 들어와요~',
	'회전목마', 0, 0, 100, 0, 220, 1,sysdate, 
	'attr_img/attr_cardimg_merrygoround.jpg', 'attr_img/attr_img_merrygoround.jpg');
--17 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 4, 60, 5000, 
	'친구들 기다리면서 빠르게 한판~ 시간이 순식간에 사라지는 게임존!', 
	'게임존', 0, 8, 100, 0, 220, 1,sysdate,
	'attr_img/attr_cardimg_game.jpg', 'attr_img/attr_img_game.jpg');

--11	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 2, 10, 3000, 
	'슝슝~ 안전띠만 매면 어린아이라도 운전할 수 있어! <br>이곳은 꼬마 운전사들에게 그야말로 천국!', 
	'어린이범퍼카', 1, 0, 6, 80,125, 1,sysdate, 
	'attr_img/attr_cardimg_childbump.jpg', 'attr_img/attr_img_childbump.jpg');
--12	 
INSERT 
	INTO ATTRACTION
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 20, 15, 8000, 
	'높이 38m의 짜릿함과 시속 90km로 추락 할 때의 스릴! 끝났구나 하고 안심하는 순간 한번 더~ 30초간 반복되는 번지드롭!', 
	'번지드롭', 1, 5, 100, 110, 180, 1,sysdate, 
	'attr_img/attr_cardimg_adultbunge.jpg', 'attr_img/attr_img_adultbunge.jpg');
--13	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 8, 12, 8000, 
	'최고 스릴 어트랙션! 20대월드 최고의 속도로 출발하는 보트를 타고 미스터리 신전 속으로 여행을 떠나보세요!', 
	'롤러코스터', 1, 10, 60, 110, 180, 1,sysdate, 
	'attr_img/attr_cardimg_rollercoster.jpg', 'attr_img/attr_img_rollercoster.jpg');
--14	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 10, 60, 5000, 
	'좀비가 득실대는 무덤다리, 철창, 어두운 미로 등을 통과하면서 오싹한 공포를 즐겨보세요.', 
	'유령의집', 1, 0, 100, 0, 220, 1,sysdate, 
	'attr_img/attr_cardimg_horror.jpg', 'attr_img/attr_img_horror.jpg');
--15	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 40, 20, 8000, 
	'아시아 최초 저소음 무진동 회전 어트랙션! 입이 쩍~ 벌어지는 놀라운 스피드를 경험해 보세요!', 
	'자이로스핀', 1, 10, 60, 100, 180, 1,sysdate, 
	'attr_img/attr_cardimg_spin.jpg', 'attr_img/attr_img_spin2.jpg');
--16	 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 32, 15, 5000, 
	'나뭇잎 의자에 앉아 빠른 속도로 빙글빙글 도는 느낌이 금방이라도 하늘로 튕겨져 오르는 기분을 느낄 수 있습니다. 호흡을 가다듬고 하늘로 출발!', 
	'회전그네', 1, 10, 100, 0, 200, 1,sysdate,
	'attr_img/attr_cardimg_seatroll.jpg', 'attr_img/attr_img_seatroll.jpg');
 
--17 
INSERT 
	INTO ATTRACTION 
	VALUES (ATTRACTION_WRITE_SEQ.nextval, 10, 20, 5000, 
	'미로속에서 빙글빙글 돌면서 만나는 또 다른 나! 진짜 나는 누구?', 
	'거울미로', 1, 10, 100, 50, 230, 1,sysdate,
	'attr_img/attr_cardimg_maze.jpg', 'attr_img/attr_img_maze.jpg');

-- 입력을 받지 않았을 때 기본 설정은?
-- attr_location, attr_min_age, attr_max_age, attr_min_height, attr_max_height
-- 위치a : 실내 : 0/ 실외 : 1// 전체는 어떻게 설정하나? 따로 해야 하나
-- 키b : 최소키 < 입력받은값 && 입력받은 값 < 최대값
-- 나이c : 최소나이 < 입력받은값 && 입력받은 값 < 최대나이

--SELECT  * FROM ATTRACTION 
--WHERE attr_min_age < 5 AND 5 <= attr_max_age 
--AND attr_min_height < 140 AND 140 <= attr_max_height
--ORDER BY attr_id DESC;
--
--SELECT  * FROM ATTRACTION 
--WHERE attr_min_age < 5 AND 5 <= attr_max_age 
--AND attr_min_height < attr_height AND attr_height <= attr_max_height
--ORDER BY attr_id DESC;

--AND attr_min_age < 5 AND 5 <= attr_max_age 
--AND attr_min_height < attr_height AND attr_height <= attr_max_height



-- 좋아요 확인용 -- 아래는 실행 x
SELECT count(*) FROM likes GROUP BY user_uid;


SELECT count(*) FROM likes WHERE user_uid = 1 GROUP BY user_uid ;	

INSERT INTO likes VALUES (USER_UID , ATTR_ID);	

SELECT * FROM 






