/* test *//* test */
-- 수정중 ㅠㅠ!!

DROP TABLE attraction CASCADE CONSTRAINT;

CREATE TABLE attraction
(
attr_id number NOT NULL,
att_max number NOT NULL,
attr_time number NOT NULL,
attr_price number NOT NULL,
attr_content clob,
attr_name varchar2(50) NOT NULL, --50으로 바꿈
attr_location number NOT NULL, --넘버로 바꿈
attr_min_age number,
attr_max_age number,
attr_min_height number,
attr_max_height number,
attr_authorize number NOT NULL,
attr_regDate date NOT NULL,
attr_img varchar2(300),
attr_cardimg varchar2(300),
PRIMARY KEY (attr_id)
);

SELECT  * FROM ATTRACTION;



-- 기구번호/ 최대탑승인원/소요시간/기구가격/기구설명/기구이름/기구위치
-- 최소나이/ 최대나이/ 최소키/ 최대키/ 권한/ 기구등록일/ 이미지/카드이미지
INSERT ALL
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (1, 13, 10, 3000, '호랑이를 피해 햇님달님 오누이와 하늘 위로 점프! 스릴 만점의 신나는 개구쟁이 탑승물! 90cm이상 ~ 140cm이하 탑승 가능 ※ 13좌석 중 1석 어른탑승 가능', '어린이번지', 0, 0, 10, 0, 100, 1, sysdate, 
	'http://adventure.lotteworld.com/image/2018/6/20180620073834101_275.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180620073834101_275.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (2, 28, 10, 8000, '숨이 멈출 것 같은 롤러코스터의 매력! 120cm이상 탑승 가능 65세 이하 탑승 가능', '실내롤러코스터', 0, 0, 100, 110, 180, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/6/20180619103158398_275.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180619103212992_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (3, 56, 20, 8000, '위 아래로 왔다갔다~! 바람을 느끼며 신나는 놀이기구! 110cm이상 65세 이하', '바이킹', 0, 0, 100, 110, 180, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/7/201807251058248710_275.jpg', 'http://adventure.lotteworld.com/image/2018/7/201807251058185011_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (4, 4, 60, 5000, '그럴싸~한 셀프 포토 스튜디오 20여 개의 다양한 테마 포토존에서 인생사진 찍어가세요!', '사진관', 0, 0, 100, 0, 250, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2019/9/201909061114206600_275.jpg', 'http://adventure.lotteworld.com/image/2019/9/201909061114121230_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (5, 6, 30, 5000, '하늘 꼭대기에서 내려다본 작은 세계, 풍선을 타고 떠나 보십시오~ 롯데월드 최고의 전망코스~5세 이하 보호자 동반 시 탑승 가능', '풍선비행', 0, 0, 100, 0, 250, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/6/20180620074206373_275.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180620074210951_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (6, 30, 15, 5000, '백마를 타고 떠나는 로맨틱한 여행! 99cm 이하 보호자 동반 시 탑승가능', '회전목마', 0, 0, 100, 0, 250, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/6/20180619090610881_275.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180619090616170_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (11, 8, 10, 3000, '110cm이상 ~ 140cm이하 탑승가능 109cm이하 보호자 동반 시 탑승 가능', '어린이범퍼카', 1, 0, 10, 0, 100, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/6/20180620074631202_275.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180620074653878_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (12, 20, 15, 8000, '높이 38m의 짜릿함과 시속 90km로 추락 할 때의 스릴! 끝났구나 하고 안심하는 순간 한번 더~ 30초간 반복되는 번지드롭!', '번지드롭', 1, 0, 100, 110, 180, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/6/20180620074032868_1350.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180620074032946_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (13, 8, 12, 8000, '최고 스릴 어트랙션! 시속 72km로 출발하는 보트를 타고 미스터리 신전 속으로 여행을 떠나보세요!허리 38인치 이하 탑승 가능', '롤러코스터', 1, 0, 100, 110, 180, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/6/20180614033556306_275.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180608062908467_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (14, 80, 60, 3000, '좀비가 득실대는 무덤다리, 철창, 어두운 미로 등을 통과하면서 오싹한 공포를 즐겨보세요.종합이용권/파크이용권 사용 불가', '유령의집', 1, 0, 100, 0, 250, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/8/201808090426146850_275.jpg', 'http://adventure.lotteworld.com/image/2018/8/201808160418490581_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location,attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (15, 6, 20, 5000, '빙글~ 빙글~ 위로! 아래로! 한쪽으로 돌고~ 반대쪽으로 돌고~ 돌면서 즐기는 짜릿한 즐거움! 둥근 손잡이를 돌리면 회전속도가 더 빨라집니다', '회전바구니', 1, 0, 100, 0, 250, 1,sysdate, 
	'http://adventure.lotteworld.com/image/2018/6/20180608082450762_275.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180608082443979_1350.jpg')
	INTO ATTRACTION (attr_id, att_max, attr_time, attr_price, attr_content, attr_name, attr_location, attr_min_age, attr_max_age, attr_min_height, attr_max_height, attr_authorize, attr_regDate, attr_img, attr_cardimg)
	VALUES (16, 32, 15, 5000, '나뭇잎 의자에 앉아 빠른 속도로 빙글빙글 도는 느낌이 금방이라도 하늘로 튕겨져 오르는 기분을 느낄 수 있습니다. 호흡을 가다듬고 하늘로 출발!', '회전그네', 1, 0, 100, 0, 250, 1,sysdate,
	 'http://adventure.lotteworld.com/image/2018/6/20180620073640138_275.jpg', 'http://adventure.lotteworld.com/image/2018/6/20180620073652436_1350.jpg')
SELECT * FROM DUAL;





















