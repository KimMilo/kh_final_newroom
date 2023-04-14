--DML

SELECT * FROM CHAT;
SELECT chatID, fromID, toID, chatContent, chatTime 
  FROM CHAT 
 WHERE (fromID = 'abc' AND toID = 'admin')
		OR (fromID = 'admin' AND toID = 'abc') ORDER BY chatTime;
        
SELECT chatID, fromID, toID, chatContent, chatTime 
  FROM CHAT 
 WHERE (fromID = 'abc' AND toID = 'admin')
    OR (fromID = 'admin' AND toID = 'abc')
   AND chatID > 0 
 ORDER BY chatTime;
 
-------------------------------------------------------------------------------
SELECT * FROM CHAT_ROOM;

-------------------------------------------------------------------------------

INSERT INTO HOSPITAL VALUES(1, '서울시', '강남구', '개포동', '서울미치과의원', '서울시 강남구 개포동 652', '치과', '02-576-2828');
INSERT INTO HOSPITAL VALUES(2, '서울시', '강남구', '개포동', '이원경내과의원', '서울시 강남구 개포동 653', '내과', '02-575-0441');
INSERT INTO HOSPITAL VALUES(3, '서울시', '강남구', '개포동', '송영명소아과의원', '서울시 강남구 개포동 169-12', '소아과', '02-573-6227');
INSERT INTO HOSPITAL VALUES(4, '서울시', '강남구', '개포동', '유대상정형외과의원', '서울시 강남구 개포동 168-5', '정형외과', '02-575-9811');
INSERT INTO HOSPITAL VALUES(5, '서울시', '강남구', '개포동', '행복한이야기한의원', '서울시 강남구 개포동 655-4', '한의원', '02-3463-1079');

INSERT INTO HOSPITAL VALUES(6, '서울시', '강남구', '논현동', '강남차병원', '서울시 강남구 역삼동 605', '여성병원', '02-1577-4488');
INSERT INTO HOSPITAL VALUES(7, '서울시', '강남구', '논현동', '라이브치과병원', '서울시 강남구 역삼동 604-1', '치과', '1599-2275');
INSERT INTO HOSPITAL VALUES(8, '서울시', '강남구', '논현동', '비에비스나무병원', '서울시 강남구 논현동 175-10', '내과', '1577-7502');
INSERT INTO HOSPITAL VALUES(9, '서울시', '강남구', '논현동', '김성민이비인후과의원', '서울시 강남구 논현동 234-26', '이비인후과', '02-541-5252');

INSERT INTO HOSPITAL VALUES(10, '서울시', '구로구', '개봉동', '구로다나병원', '서울시 구로구 개봉동 353-2', '정신건강의학과', '0507-1361-8001');
INSERT INTO HOSPITAL VALUES(11, '서울시', '구로구', '개봉동', '민전산부인과의원', '서울시 구로구 개봉동 161-25', '산부인과', '02-2685-3388');
INSERT INTO HOSPITAL VALUES(12, '서울시', '구로구', '개봉동', '이기현안과의원', '서울시 구로구 개봉동 156-5', '안과', '02-2612-0110');
INSERT INTO HOSPITAL VALUES(13, '서울시', '구로구', '개봉동', '명손한의원', '서울시 구로구 개봉동 178-13', '한의원', '02-6949-6019');
INSERT INTO HOSPITAL VALUES(14, '서울시', '구로구', '개봉동', '탑비뇨기과의원', '서울시 구로구 개봉동 173-1', '비뇨의학과', '02-2687-9575');

INSERT INTO HOSPITAL VALUES(15, '서울시', '구로구', '고척동', '하얀미소치과의원', '서울시 구로구 고척동 189', '치과', '02-2671-2875');
INSERT INTO HOSPITAL VALUES(16, '서울시', '구로구', '고척동', '목동현대요양병원', '서울시 구로구 고척동 176-3', '요양병원', '02-3666-1122');
INSERT INTO HOSPITAL VALUES(17, '서울시', '구로구', '고척동', '신목제일의원', '서울시 구로구 고척동 41-2', '내과', '02-2615-7010');
INSERT INTO HOSPITAL VALUES(18, '서울시', '구로구', '고척동', '동명한의원', '서울시 구로구 고척동 195-13', '한의원', '02-2618-9975');
INSERT INTO HOSPITAL VALUES(19, '서울시', '구로구', '고척동', '서울드림정형외과의원', '서울시 구로구 고척동 189', '정형외과', '02-2066-3060');

INSERT INTO HOSPITAL VALUES(20, '서울시', '동작구', '노량진동', '노량진튼튼의원', '서울시 동작구 노량진동 330', '정형외과', '02-822-7582');
INSERT INTO HOSPITAL VALUES(21, '서울시', '동작구', '노량진동', '척척박사한의원', '서울시 동작구 노량진동 119-143', '한의원', '0507-1331-7797안내');
INSERT INTO HOSPITAL VALUES(22, '서울시', '동작구', '노량진동', '기쁨준내과의원', '서울시 동작구 노량진동 54-11', '내과', '0507-1420-7576');
INSERT INTO HOSPITAL VALUES(23, '서울시', '동작구', '노량진동', '홍정신건강의학과의원', '서울시 동작구 노량진동 236-4', '정신건강의학과', '02-815-8383');
INSERT INTO HOSPITAL VALUES(24, '서울시', '동작구', '노량진동', '청화병원', '서울시 동작구 노량진동 311-8', '산부인과', '02-815-3788');

INSERT INTO HOSPITAL VALUES(25, '서울시', '동작구', '대방동', '성애병원', '서울시 영등포구 신길동 451-5', '종합병원', '02-840-7114');
INSERT INTO HOSPITAL VALUES(26, '서울시', '동작구', '대방동', '송가정의학과의원', '서울시 동작구 대방동 503', '가정의학과', '02-817-1655');
INSERT INTO HOSPITAL VALUES(27, '서울시', '동작구', '대방동', '서울해치과', '서울시 동작구 대방동 37-2', '치과', '02-817-8228');
INSERT INTO HOSPITAL VALUES(28, '서울시', '동작구', '대방동', '고이비인후과의원', '서울시 동작구 대방동 501', '이비인후과', '02-814-3777');
INSERT INTO HOSPITAL VALUES(29, '서울시', '동작구', '대방동', '이영록내과의원', '서울시 동작구 대방동 502', '내과', '02-825-7525');

INSERT INTO HOSPITAL VALUES(30, '서울시', '마포구', '마포동', '옵티마성형외과', '서울시 마포구 마포동 386-4', '성형외과', '02-555-5566');
INSERT INTO HOSPITAL VALUES(31, '서울시', '마포구', '마포동', '첨단과학의원', '서울시 마포구 마포동 136-1', '내과', '02-701-5047');
INSERT INTO HOSPITAL VALUES(32, '서울시', '마포구', '마포동', '최소아과', '서울시 마포구 도화동 83', '소아청소년과', null);
INSERT INTO HOSPITAL VALUES(33, '서울시', '마포구', '마포동', '박재필치과의원', '서울시 마포구 도화동 290-1', '치과', '02-713-2853');
INSERT INTO HOSPITAL VALUES(34, '서울시', '마포구', '마포동', '제일한의원', '서울시 마포구 도화동 205-16', '한의원', '02-312-2323');

INSERT INTO HOSPITAL VALUES(35, '서울시', '마포구', '망원동', '본항외과의원', '서울시 마포구 망원동 478-11', '외과', '02-332-9774');
INSERT INTO HOSPITAL VALUES(36, '서울시', '마포구', '망원동', '정내과의원', '서울시 마포구 망원동 486-39', '내과', '02-336-7570');
INSERT INTO HOSPITAL VALUES(37, '서울시', '마포구', '망원동', '이승호이비인후과의원', '서울시 마포구 망원동 482-9', '이비인후과', '02-334-7582');
INSERT INTO HOSPITAL VALUES(38, '서울시', '마포구', '망원동', '포근담산부인과의원', '서울시 마포구 서교동 441-3', '산부인과', '02-324-9966');
INSERT INTO HOSPITAL VALUES(39, '서울시', '마포구', '망원동', '이가인의원', '서울시 마포구 망원동 378-2', '피부과', '02-3143-6590');

INSERT INTO HOSPITAL VALUES(40, '서울시', '서초구', '반포동', '정다운내과의원', '서울시 서초구 반포동 2-8', '내과', '02-3476-1571');
INSERT INTO HOSPITAL VALUES(41, '서울시', '서초구', '반포동', '예원이비인후과의원', '서울시 서초구 반포동 18-4', '이비인후과', '02-595-0075');
INSERT INTO HOSPITAL VALUES(42, '서울시', '서초구', '반포동', '예지원피부과', '서울시 서초구 반포동 18-3', '피부과', '02-536-8275');
INSERT INTO HOSPITAL VALUES(43, '서울시', '서초구', '반포동', '반포한의원', '서울시 서초구 잠원동 75-13', '한의원', '0507-1404-1275');
INSERT INTO HOSPITAL VALUES(44, '서울시', '서초구', '반포동', '서울성모병원', '서울시 서초구 반포동 505', '종합병원', '02-1588-1511');

INSERT INTO HOSPITAL VALUES(45, '서울시', '서초구', '방배동', '서울마더스성형외과', '서울시 서초구 방배동 1970', '성형외과', '02-525-2375');
INSERT INTO HOSPITAL VALUES(46, '서울시', '서초구', '방배동', '포에버의원', '서울시 서초구 방배동 1751', '피부과', '02-1577-8346');
INSERT INTO HOSPITAL VALUES(47, '서울시', '서초구', '방배동', '시원하이신경외과의원', '서울시 서초구 방배동 1923', '정형외과', '0507-1375-4153');
INSERT INTO HOSPITAL VALUES(48, '서울시', '서초구', '방배동', '이수리더스내과의원', '서울시 서초구 방배동 3160', '내과', '02-599-8288');
INSERT INTO HOSPITAL VALUES(49, '서울시', '서초구', '방배동', '골든시니어치과의원', '서울시 서초구 방배동 952-4', '치과', '0507-1431-2805');

INSERT INTO HOSPITAL VALUES(50, '경기도', '가평군', '가평읍', '성모의원', '경기도 가평군 가평읍 대곡리 232', '병원', '031-582-1833');
INSERT INTO HOSPITAL VALUES(51, '경기도', '가평군', '가평읍', '임내과의원', '경기도 가평군 가평읍 읍내리 476-7', '내과', '031-581-0675');
INSERT INTO HOSPITAL VALUES(52, '경기도', '가평군', '가평읍', '가평삼성의원', '경기도 가평군 가평읍 읍내리 615-5', '가정의학과', '031-585-3658');
INSERT INTO HOSPITAL VALUES(53, '경기도', '가평군', '가평읍', '서울수치과의원', '경기도 가평군 가평읍 대곡리 239-16', '치과', '031-582-2842');
INSERT INTO HOSPITAL VALUES(54, '경기도', '가평군', '가평읍', '송정한의원', '경기도 가평군 가평읍 읍내리 474-3', '한의원', '031-582-0812');

INSERT INTO HOSPITAL VALUES(55, '경기도', '고양시', '대화동', '세종치과의원', '경기도 고양시 일산서구 대화동 2033', '치과', '031-911-1222');
INSERT INTO HOSPITAL VALUES(56, '경기도', '고양시', '대화동', '하나로솔한의원', '경기도 고양시 일산서구 대화동 2324', '한의원', '031-923-1022');
INSERT INTO HOSPITAL VALUES(57, '경기도', '고양시', '대화동', '건누리병원', '경기도 고양시 일산서구 주엽동 5', '가정의학과', '031-913-6113');
INSERT INTO HOSPITAL VALUES(58, '경기도', '고양시', '대화동', '정미성소아과의원', '경기도 고양시 일산서구 일산동 1065', '소아청소년과', '031-917-8275');
INSERT INTO HOSPITAL VALUES(59, '경기도', '고양시', '대화동', '하나정형외과의원', '경기도 고양시 일산서구 대화동 2127', '정형외과', '031-918-5252');

INSERT INTO HOSPITAL VALUES(60, '경기도', '김포시', '고촌읍', '김포365한의원', '경기도 김포시 고촌읍 신곡리 532-70', '한의원', '0507-1433-2399');
INSERT INTO HOSPITAL VALUES(61, '경기도', '김포시', '고촌읍', '애플소아청소년과의원', '경기도 김포시 고촌읍 신곡리 610-4', '소아청소년과', '031-985-8275');
INSERT INTO HOSPITAL VALUES(62, '경기도', '김포시', '고촌읍', '경희한의원', '경기도 김포시 고촌읍 신곡리 539-8', '한의원', '031-985-1025');
INSERT INTO HOSPITAL VALUES(63, '경기도', '김포시', '고촌읍', '배원엽내과의원', '경기도 김포시 고촌읍 신곡리 533-30', '내과', '031-986-7512');
INSERT INTO HOSPITAL VALUES(64, '경기도', '김포시', '고촌읍', '소나무치과의원', '경기도 김포시 고촌읍 신곡리 573-5', '치과', '031-985-2252');

INSERT INTO HOSPITAL VALUES(65, '경기도', '김포시', '구래동', '김포밝은안과의원', '경기도 김포시 구래동 6880-2', '안과', '0507-1433-0091');
INSERT INTO HOSPITAL VALUES(66, '경기도', '김포시', '구래동', '연세비케이의원', '경기도 김포시 구래동 6881-9', '피부과', '031-996-9904');
INSERT INTO HOSPITAL VALUES(67, '경기도', '김포시', '구래동', '든든한치과의원', '경기도 김포시 구래동 6885-1', '치과', '031-988-2872');
INSERT INTO HOSPITAL VALUES(68, '경기도', '김포시', '구래동', '구래한의원', '경기도 김포시 구래동 6886-6', '한의원', '0507-1330-1275');
INSERT INTO HOSPITAL VALUES(69, '경기도', '김포시', '구래동', '더좋은성형외과의원', '경기도 김포시 구래동 6917-2', '성형외과', '0507-1480-3533');

INSERT INTO HOSPITAL VALUES(70, '경기도', '남양주시', '금곡동', '동의당한의원', '경기도 남양주시 금곡동 185-21', '한의원', '031-595-8275');
INSERT INTO HOSPITAL VALUES(71, '경기도', '남양주시', '금곡동', '소망의원', '경기도 남양주시 금곡동 153-1', '병원', '031-559-1798');
INSERT INTO HOSPITAL VALUES(72, '경기도', '남양주시', '금곡동', '양병원', '경기도 남양주시 금곡동 433-5', '병원', '031-590-9000');
INSERT INTO HOSPITAL VALUES(73, '경기도', '남양주시', '금곡동', '동서울의원', '경기도 남양주시 금곡동 427-19', '내과', '031-592-5155');

INSERT INTO HOSPITAL VALUES(74, '경기도', '남양주시', '별내동', '임내과의원', '경기도 남양주시 별내동 930', '내과', '031-573-8272');
INSERT INTO HOSPITAL VALUES(75, '경기도', '남양주시', '별내동', '별가람소아치과의원', '경기도 남양주시 별내동 824', '치과', '031-569-2275');
INSERT INTO HOSPITAL VALUES(76, '경기도', '남양주시', '별내동', '별내박내과의원', '경기도 남양주시 별내동 826-5', '내과', '0507-1377-8876');
INSERT INTO HOSPITAL VALUES(77, '경기도', '남양주시', '별내동', '별내굿타임의원', '경기도 남양주시 별내동 826', '정형외과', '0507-1366-8385');
INSERT INTO HOSPITAL VALUES(78, '경기도', '남양주시', '별내동', '별내참사랑의원', '경기도 남양주시 별내동 826-10', '가정의학과', '031-528-0175');

INSERT INTO HOSPITAL VALUES(79, '경기도', '부천시', '고강동', '영제한의원', '경기도 부천시 고강동 393', '한의원', '032-681-3548');
INSERT INTO HOSPITAL VALUES(80, '경기도', '부천시', '고강동', '다솜가정의원', '경기도 부천시 고강동 395', '내과', '032-682-9400');
INSERT INTO HOSPITAL VALUES(81, '경기도', '부천시', '고강동', '한사랑가정의원', '경기도 부천시 고강동 558-1', '가정의학과', '032-676-6548');
INSERT INTO HOSPITAL VALUES(82, '경기도', '부천시', '고강동', '미소안치과의원', '서울시 양천구 신월동 928-1', '치과', '02-2695-2080');
INSERT INTO HOSPITAL VALUES(83, '경기도', '부천시', '고강동', '신월맥한의원', '서울시 양천구 신월동 225-17', '한의원', '0507-1492-1210');

INSERT INTO HOSPITAL VALUES(84, '경기도', '부천시', '오정동', '코코이비인후과의원', '서울시 부천시 오정동 725', '이비인후과', '032-676-7585');
INSERT INTO HOSPITAL VALUES(85, '경기도', '부천시', '오정동', '튼튼신경외과의원', '서울시 부천시 오정동 576-2', '신경외과', '032-678-0005');
INSERT INTO HOSPITAL VALUES(86, '경기도', '부천시', '오정동', '상록한의원', '서울시 부천시 오정동 555', '한의원', '032-681-9955');
INSERT INTO HOSPITAL VALUES(87, '경기도', '부천시', '오정동', '참사랑의원', '서울시 부천시 오정동 577-3', '병원', '032-672-7174');
INSERT INTO HOSPITAL VALUES(88, '경기도', '부천시', '오정동', '태소아과의원', '서울시 부천시 오정동 543', '소아청소년과', '032-682-6072');

SELECT * FROM HOSPITAL;
---------------------------------------------------------------------------------------

SELECT no, city, gugun, dong, hospitalName, address, diagnosisType, phone
  FROM HOSPITAL
 WHERE (city, gugun, dong) IN (SELECT DISTINCT city, gugun, dong
                              FROM BASEADDRESS b
                             WHERE b.dongcode = (SELECT DISTINCT code 
                                                   FROM HOUSEINFO
                                                  WHERE no = 2)	
                            );

SELECT no, city, gugun, dong, hospitalName, address, diagnosisType, phone
  FROM HOSPITAL
 WHERE (city, gugun, dong) IN (SELECT DISTINCT city, gugun, dong
                              FROM BASEADDRESS b
                             WHERE b.dongcode = (SELECT DISTINCT code 
                                                   FROM HOUSEINFO
                                                  WHERE no = (SELECT DISTINCT no FROM HOUSEDEAL WHERE dealId = 22))	
                            );

------------------------------------------------------------------------------------------

INSERT INTO BASEADDRESS VALUES('서울시', '강남구', '개포동', 'A011');
INSERT INTO BASEADDRESS VALUES('서울시', '강남구', '논현동', 'A012');
--INSERT INTO BASEADDRESS VALUES('서울시', '강남구', '대치동', 'A013');
--INSERT INTO BASEADDRESS VALUES('서울시', '강남구', '도곡동', 'A014');
--INSERT INTO BASEADDRESS VALUES('서울시', '강남구', '압구정동', 'A015');

INSERT INTO BASEADDRESS VALUES('서울시', '구로구', '개봉동', 'A021');
INSERT INTO BASEADDRESS VALUES('서울시', '구로구', '고척동', 'A022');
--INSERT INTO BASEADDRESS VALUES('서울시', '구로구', '구로동', 'A023');
--INSERT INTO BASEADDRESS VALUES('서울시', '구로구', '신도림동', 'A024');
--INSERT INTO BASEADDRESS VALUES('서울시', '구로구', '오류동', 'A025');

INSERT INTO BASEADDRESS VALUES('서울시', '동작구', '노량진동', 'A031');
INSERT INTO BASEADDRESS VALUES('서울시', '동작구', '대방동', 'A032');
--INSERT INTO BASEADDRESS VALUES('서울시', '동작구', '상도동', 'A033');
--INSERT INTO BASEADDRESS VALUES('서울시', '동작구', '사당동', 'A034');
--INSERT INTO BASEADDRESS VALUES('서울시', '동작구', '흑석동', 'A035');

INSERT INTO BASEADDRESS VALUES('서울시', '마포구', '마포동', 'A041');
INSERT INTO BASEADDRESS VALUES('서울시', '마포구', '망원동', 'A042');
--INSERT INTO BASEADDRESS VALUES('서울시', '마포구', '서교동', 'A043');
--INSERT INTO BASEADDRESS VALUES('서울시', '마포구', '연남동', 'A044');
--INSERT INTO BASEADDRESS VALUES('서울시', '마포구', '합정동', 'A045');

INSERT INTO BASEADDRESS VALUES('서울시', '서초구', '반포동', 'A051');
INSERT INTO BASEADDRESS VALUES('서울시', '서초구', '방배동', 'A052');
--INSERT INTO BASEADDRESS VALUES('서울시', '서초구', '서초동', 'A053');
--INSERT INTO BASEADDRESS VALUES('서울시', '서초구', '양재동', 'A054');
--INSERT INTO BASEADDRESS VALUES('서울시', '서초구', '잠원동', 'A055');

--INSERT INTO BASEADDRESS VALUES('서울시', '성동구', '마장동', 'A061');
--INSERT INTO BASEADDRESS VALUES('서울시', '성동구', '상왕십리동', 'A062');
--INSERT INTO BASEADDRESS VALUES('서울시', '성동구', '성수동1가', 'A063');
--INSERT INTO BASEADDRESS VALUES('서울시', '성동구', '성수동2가', 'A064');
--INSERT INTO BASEADDRESS VALUES('서울시', '성동구', '옥수동', 'A065');

--INSERT INTO BASEADDRESS VALUES('서울시', '송파구', '마천동', 'A071');
--INSERT INTO BASEADDRESS VALUES('서울시', '송파구', '방이동', 'A072');
--INSERT INTO BASEADDRESS VALUES('서울시', '송파구', '송파동', 'A073');
--INSERT INTO BASEADDRESS VALUES('서울시', '송파구', '잠실동', 'A074');
--INSERT INTO BASEADDRESS VALUES('서울시', '송파구', '장지동', 'A075');

--INSERT INTO BASEADDRESS VALUES('서울시', '영등포구', '당산동', 'A081');
--INSERT INTO BASEADDRESS VALUES('서울시', '영등포구', '대림동', 'A082');
--INSERT INTO BASEADDRESS VALUES('서울시', '영등포구', '문래동', 'A083');
--INSERT INTO BASEADDRESS VALUES('서울시', '영등포구', '신길동', 'A084');
--INSERT INTO BASEADDRESS VALUES('서울시', '영등포구', '영등포동', 'A085');

--INSERT INTO BASEADDRESS VALUES('서울시', '용산구', '남영동', 'A091');
--INSERT INTO BASEADDRESS VALUES('서울시', '용산구', '이촌동', 'A092');
--INSERT INTO BASEADDRESS VALUES('서울시', '용산구', '이태원동', 'A093');
--INSERT INTO BASEADDRESS VALUES('서울시', '용산구', '한담동', 'A094');
--INSERT INTO BASEADDRESS VALUES('서울시', '용산구', '후암동', 'A095');

--INSERT INTO BASEADDRESS VALUES('서울시', '종로구', '남영동', 'A101');
--INSERT INTO BASEADDRESS VALUES('서울시', '종로구', '이촌동', 'A102');
--INSERT INTO BASEADDRESS VALUES('서울시', '종로구', '이태원동', 'A103');
--INSERT INTO BASEADDRESS VALUES('서울시', '종로구', '한담동', 'A104');
--INSERT INTO BASEADDRESS VALUES('서울시', '종로구', '후암동', 'A105');

INSERT INTO BASEADDRESS VALUES('경기도', '가평군', '가평읍', 'B011');
INSERT INTO BASEADDRESS VALUES('경기도', '가평군', '북면', 'B012');
UPDATE BASEADDRESS set dong='가평읍' where dongcode = 'B012';
--INSERT INTO BASEADDRESS VALUES('경기도', '가평군', '상면', 'B013');
--INSERT INTO BASEADDRESS VALUES('경기도', '가평군', '설악면', 'B014');
--INSERT INTO BASEADDRESS VALUES('경기도', '가평군', '청평면', 'B015');

INSERT INTO BASEADDRESS VALUES('경기도', '고양시', '구산동', 'B021');
INSERT INTO BASEADDRESS VALUES('경기도', '고양시', '대화동', 'B022');
--INSERT INTO BASEADDRESS VALUES('경기도', '고양시', '백석동', 'B023');
--INSERT INTO BASEADDRESS VALUES('경기도', '고양시', '일산동', 'B024');
--INSERT INTO BASEADDRESS VALUES('경기도', '고양시', '풍동', 'B025');

INSERT INTO BASEADDRESS VALUES('경기도', '김포시', '고촌읍', 'B031');
INSERT INTO BASEADDRESS VALUES('경기도', '김포시', '구래동', 'B032');
--INSERT INTO BASEADDRESS VALUES('경기도', '김포시', '마산동', 'B033');
--INSERT INTO BASEADDRESS VALUES('경기도', '김포시', '월곶면', 'B034');
--INSERT INTO BASEADDRESS VALUES('경기도', '김포시', '통진읍', 'B035');

INSERT INTO BASEADDRESS VALUES('경기도', '남양주시', '금곡동', 'B041');
INSERT INTO BASEADDRESS VALUES('경기도', '남양주시', '별내동', 'B042');
--INSERT INTO BASEADDRESS VALUES('경기도', '남양주시', '와부읍', 'B043');
--INSERT INTO BASEADDRESS VALUES('경기도', '남양주시', '진건읍', 'B044');
--INSERT INTO BASEADDRESS VALUES('경기도', '남양주시', '화도읍', 'B045');

INSERT INTO BASEADDRESS VALUES('경기도', '부천시', '고강동', 'B051');
INSERT INTO BASEADDRESS VALUES('경기도', '부천시', '오정동', 'B052');
--INSERT INTO BASEADDRESS VALUES('경기도', '부천시', '소사본동', 'B053');
--INSERT INTO BASEADDRESS VALUES('경기도', '부천시', '역곡동', 'B054');
--INSERT INTO BASEADDRESS VALUES('경기도', '부천시', '중동', 'B055');

--INSERT INTO BASEADDRESS VALUES('경기도', '성남시', '분당동', 'B061');
--INSERT INTO BASEADDRESS VALUES('경기도', '성남시', '서현동', 'B062');
--INSERT INTO BASEADDRESS VALUES('경기도', '성남시', '야탑동', 'B063');
--INSERT INTO BASEADDRESS VALUES('경기도', '성남시', '저장동', 'B064');
--INSERT INTO BASEADDRESS VALUES('경기도', '성남시', '판교동', 'B065');

--INSERT INTO BASEADDRESS VALUES('경기도', '수원시', '구운동', 'B071');
--INSERT INTO BASEADDRESS VALUES('경기도', '수원시', '권선동', 'B072');
--INSERT INTO BASEADDRESS VALUES('경기도', '수원시', '매탄동', 'B073');
--INSERT INTO BASEADDRESS VALUES('경기도', '수원시', '세류동', 'B074');
--INSERT INTO BASEADDRESS VALUES('경기도', '수원시', '영통동', 'B075');

--INSERT INTO BASEADDRESS VALUES('경기도', '안양시', '박달동', 'B081');
--INSERT INTO BASEADDRESS VALUES('경기도', '안양시', '석수동', 'B082');
--INSERT INTO BASEADDRESS VALUES('경기도', '안양시', '안양동', 'B083');
--INSERT INTO BASEADDRESS VALUES('경기도', '안양시', '평촌동', 'B084');
--INSERT INTO BASEADDRESS VALUES('경기도', '안양시', '호계동', 'B085');

--INSERT INTO BASEADDRESS VALUES('경기도', '용인시', '고기동', 'B091');
--INSERT INTO BASEADDRESS VALUES('경기도', '용인시', '상현동', 'B092');
--INSERT INTO BASEADDRESS VALUES('경기도', '용인시', '죽전동', 'B093');
--INSERT INTO BASEADDRESS VALUES('경기도', '용인시', '청덕동', 'B094');
--INSERT INTO BASEADDRESS VALUES('경기도', '용인시', '하갈동', 'B095');

--INSERT INTO BASEADDRESS VALUES('경기도', '평택시', '가재동', 'B101');
--INSERT INTO BASEADDRESS VALUES('경기도', '평택시', '비전동', 'B102');
--INSERT INTO BASEADDRESS VALUES('경기도', '평택시', '신대동', 'B103');
--INSERT INTO BASEADDRESS VALUES('경기도', '평택시', '신장동', 'B104');
--INSERT INTO BASEADDRESS VALUES('경기도', '평택시', '평택동', 'B105');

SELECT * FROM BASEADDRESS;

----------------------------------------------------------------------------------------------

INSERT INTO SIDOCODE VALUES('A', '서울특별시');
INSERT INTO SIDOCODE VALUES('B', '경기도');

SELECT sido_code, sido_name FROM sidocode;
---------------------------------------------------------------------------------------------------

INSERT INTO GUGUNCODE VALUES('A01', '강남구');
INSERT INTO GUGUNCODE VALUES('A02', '구로구');
INSERT INTO GUGUNCODE VALUES('A03', '동작구');
INSERT INTO GUGUNCODE VALUES('A04', '마포구');
INSERT INTO GUGUNCODE VALUES('A05', '서초구');
--INSERT INTO GUGUNCODE VALUES('A06', '성동구');
--INSERT INTO GUGUNCODE VALUES('A07', '송파구');
--INSERT INTO GUGUNCODE VALUES('A08', '영등포구');
--INSERT INTO GUGUNCODE VALUES('A09', '용산구');
--INSERT INTO GUGUNCODE VALUES('A10', '종로구');

INSERT INTO GUGUNCODE VALUES('B01', '가평군');
INSERT INTO GUGUNCODE VALUES('B02', '고양시');
INSERT INTO GUGUNCODE VALUES('B03', '김포시');
INSERT INTO GUGUNCODE VALUES('B04', '남양주시');
INSERT INTO GUGUNCODE VALUES('B05', '부천시');
--INSERT INTO GUGUNCODE VALUES('B06', '성남시');
--INSERT INTO GUGUNCODE VALUES('B07', '수원시');
--INSERT INTO GUGUNCODE VALUES('B08', '안양시');
--INSERT INTO GUGUNCODE VALUES('B09', '용인시');
--INSERT INTO GUGUNCODE VALUES('B10', '평택시');

SELECT * FROM GUGUNCODE;

SELECT SUBSTR(gugun_code,3,1) gugun_code, gugun_name FROM guguncode
	where gugun_code = '001' ORDER BY gugun_code;

--------------------------------------------------------------------------------------------------
INSERT INTO HOUSEINFO VALUES(1, '개포동', '더샵트리에', 'A011', '2021', '651-1', '37.484836', '127.057225', '1.jpg');
update houseinfo set lat='37.46',lng='127.015' where no=1;
INSERT INTO HOUSEINFO VALUES(2, '논현동', '논현e-편한세상', 'A012', '2005', '195-1', '37.506678', '127.028966', '2.jpg');
INSERT INTO HOUSEINFO VALUES(3, '개봉동', '신개봉삼환', 'A021', '2001', '170-30', '37.494657', '126.854609', '3.jpg');
INSERT INTO HOUSEINFO VALUES(4, '고척동', '청솔우성', 'A022', '2000', '329', '37.506295', '126.859759', '4.jpg');
INSERT INTO HOUSEINFO VALUES(5, '노량진동', '쌍용예가', 'A031', '2010', '332', '37.509926', '126.943578', '5.jpg');
INSERT INTO HOUSEINFO VALUES(6, '대방동', '대방경남아너스빌', 'A032', '2006', '여의대방로54길 6', '37.511430', '126.925611', '6.jpg');
INSERT INTO HOUSEINFO VALUES(7, '마포동', '경남한신코아', 'A041', '1992', '350', '37.536270', '126.943937', '7.jpg');
INSERT INTO HOUSEINFO VALUES(8, '망원동', '마포영화블렌하임', 'A042', '2009', '517', '37.558483', '126.906273', '8.jpg');
INSERT INTO HOUSEINFO VALUES(9, '반포동', '반포푸르지오', 'A051', '2000', '10', '37.503884', '126.996434', '9.jpg');
INSERT INTO HOUSEINFO VALUES(10, '방배동', '방배한진로즈힐', 'A052', '2005', '3276', '37.486801', '126.983479', '10.jpg');
INSERT INTO HOUSEINFO VALUES(11, '가평읍', '태광', 'B011', '2006', '대곡리 285-6', '37.828281', '127.509511', '11.jpg');
INSERT INTO HOUSEINFO VALUES(12, '가평읍', '가평센트럴파크더스카이', 'B012', '2022', '읍내리 457-5', '37.831323', '127.512106', '12.jpg');
INSERT INTO HOUSEINFO VALUES(13, '대화동', '성저7단지건영', 'B021', '1996', '2081', '37.684164', '126.751997', '13.jpg');
INSERT INTO HOUSEINFO VALUES(14, '대화동', '성저3단지풍림', 'B022', '1996', '2215', '37.678180', '126.747934', '14.jpg');
INSERT INTO HOUSEINFO VALUES(15, '고촌읍', '김포고촌우방아이유쉘', 'B031', '2014', '신곡리 1284', '37.604503', '126.766739', '15.jpg');
INSERT INTO HOUSEINFO VALUES(16, '구래동', '한강신도시반도유보라5차', 'B032', '2018', '117-3', '37.647286', '126.626571', '16.jpg');
INSERT INTO HOUSEINFO VALUES(17, '금곡동', '금곡역디에브스', 'B041', '2020', '777', '37.636580', '127.207571', '17.jpg');
INSERT INTO HOUSEINFO VALUES(18, '별내동', '남양주별내아이파크', 'B042', '2012', '854', '37.662043', '127.117898', '18.jpg');
INSERT INTO HOUSEINFO VALUES(19, '고강동', '동문미도', 'B051', '1989', '327-7', '37.525164', '126.825966', '19.jpg');
INSERT INTO HOUSEINFO VALUES(20, '오정동', '오정휴먼시아3단지', 'B052', '2006', '732', '37.532837', '126.787682', '20.jpg');

SELECT * FROM HOUSEINFO;

---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO HOUSEDEAL VALUES(1, 1, '24억', '2023', '03', '01', '135', '15', '매매', null);
INSERT INTO HOUSEDEAL VALUES(2, 1, '25억', '2023', '03', '02', '108', '17', '매매', null);
INSERT INTO HOUSEDEAL VALUES(3, 1, '22억', '2023', '03', '03', '84', '1', '매매', null);
INSERT INTO HOUSEDEAL VALUES(4, 2, '18억', '2023', '03', '22', '109B', '11', '매매', null);
INSERT INTO HOUSEDEAL VALUES(5, 3, '6억', '2023', '04', '30', '84', '1', '매매', null);
INSERT INTO HOUSEDEAL VALUES(6, 4, '4억', '2023', '05', '15', '84', '6', '전세', null);
INSERT INTO HOUSEDEAL VALUES(7, 5, '14억', '2023', '05', '30', '84', '11', '매매', null);
INSERT INTO HOUSEDEAL VALUES(8, 6, '6.5억', '2023', '06', '01', '84', '3', '전세', null);
INSERT INTO HOUSEDEAL VALUES(9, 7, '1억/200', '2023', '06', '10', '83', '6', '월세', 200);
INSERT INTO HOUSEDEAL VALUES(10, 8, '10억', '2023', '06', '15', '103', '저', '매매', null);
INSERT INTO HOUSEDEAL VALUES(11, 9, '8억/120', '2023', '06', '22', '84', '중', '월세', 120);
INSERT INTO HOUSEDEAL VALUES(12, 10, '11억', '2023', '07', '02', '97', '13', '전세', null);
INSERT INTO HOUSEDEAL VALUES(13, 11, '4억', '2023', '07', '12', '122', '고층', '매매', null);
INSERT INTO HOUSEDEAL VALUES(14, 12, '2.2억', '2023', '07', '22', '59', '28', '전세', null);
INSERT INTO HOUSEDEAL VALUES(15, 13, '4.5억', '2023', '08', '01', '84', '3', '매매', null);
INSERT INTO HOUSEDEAL VALUES(16, 14, '2억', '2023', '08', '22', '45', '14', '전세', null);
INSERT INTO HOUSEDEAL VALUES(17, 15, '6.7억', '2023', '09', '15', '84', '5', '매매', null);
INSERT INTO HOUSEDEAL VALUES(18, 16, '5.1억', '2023', '09', '30', '96', '9', '매매', null);
INSERT INTO HOUSEDEAL VALUES(19, 17, '2.7억', '2023', '10', '15', '84', '3', '전세', null);
INSERT INTO HOUSEDEAL VALUES(20, 18, '1.7억/120', '2023', '10', '30', '124', '5', '월세', 120);
INSERT INTO HOUSEDEAL VALUES(21, 19, '2.5억', '2023', '11', '31', '59', '1', '매매', null);
INSERT INTO HOUSEDEAL VALUES(22, 20, '4.5억', '2023', '12', '31', '59', '2', '매매', null);

SELECT * FROM HOUSEDEAL;
SELECT d.no, d.dealAmount, d.dealYear, d.dealMonth, d.dealDay, 
	d.area, d.floor, d.dtype, d.rentMoney,
	i.dong, i.aptName, i.jibun, i.lat, i.lng, i.img
	FROM housedeal d, houseinfo i
	WHERE d.no=i.no AND i.aptName like CONCAT('%',aptName,'%');
    
SELECT d.no, d.dealId, d.dealAmount, d.dealYear, d.dealMonth, d.dealDay, 
	d.area, d.floor, d.dtype, d.rentMoney, b.city, b.gugun, b.dong,
	i.dong, i.aptName, i.jibun, i.lat, i.lng, i.img
	FROM housedeal d, houseinfo i, baseaddress b
	WHERE d.no = i.no and d.dealId = 1 and i.code = b.dongcode;
    
SELECT d.no, d.dealId, d.dealAmount, d.dealYear, d.dealMonth, d.dealDay, 
	d.area, d.floor, d.dtype, d.rentMoney, b.city, b.gugun,
	i.dong, i.aptName, i.jibun, i.lat, i.lng, i.img
	FROM housedeal d, houseinfo i, baseaddress b
	WHERE d.no = i.no and i.code = b.dongcode;
    
------------------------------------------------------------------------------------------

SELECT * FROM INTEREST;
select i.userid, i.dealId, d.area, d.floor, d.dealAmount, f.AptName, f.img
	from housedeal d JOIN interest i on d.dealId = i.dealId JOIN houseinfo f on d.no = f.no
	where i.userid = 'sample';

------------------------------------------------------------------------------------------------

INSERT INTO USERINFO VALUES(1, 'abc', 'abc', '아무개', 'abcd666@naver.com', '010-123-4567', 0, null);
INSERT INTO USERINFO VALUES(2, 'admin', 'admin777', '관리자', 'admin@naver.com', '010-777-7777', 1, null);
INSERT INTO USERINFO VALUES(3, '111', '111', '111', '111', '111', 0, null);

SELECT * FROM USERINFO;

select i.userid, i.inum, d.area, d.floor, d.dealAmount, f.AptName, f.img
	from housedeal d JOIN interest i on d.hdnum = i.inum JOIN houseinfo f on d.hdnum = f.hsnum
	where i.userid = 'abc';
    
SELECT *
	  FROM (SELECT ROWNUM AS N
	   			 , no
	   			 , userid
	   			 , userpw
	   			 , username
	   			 , useremail
	   			 , userphone
	   			 , mrole
	   			 , img
	   		  FROM (SELECT * FROM USERINFO ORDER BY no ASC))
	 WHERE N BETWEEN 1 AND 5;

SELECT COUNT(*) FROM USERINFO;
SELECT COUNT(*) FROM USERINFO WHERE username LIKE '%1%';
SELECT * 
FROM (SELECT ROWNUM AS N
	   			 , no
 	   			 , userid 
 	   			 , userpw
 	   			 , username 
 	   			 , useremail 
 	   			 , userphone 
 	   			 , mrole 
 	   			 , img 
 	   		  FROM (SELECT * FROM USERINFO ORDER BY no ASC)) 
 	 WHERE N BETWEEN 1 AND 10 
 	   AND username like '%1%'; 
       
SELECT * FROM USERINFO WHERE username like '%1%';

---------------------------------------------------------------------------------------

INSERT INTO NOTICE VALUES(1, '공지테스트1', 'admin', default, default, '테스트입니다1.', default);
INSERT INTO NOTICE VALUES(2, '공지테스트2', 'admin', default, default, '테스트입니다2.', default);
INSERT INTO NOTICE VALUES(3, '공지테스트3', 'admin', default, default, '테스트입니다3.', default);
INSERT INTO NOTICE VALUES(4, '공지테스트4', 'admin', default, default, '테스트입니다4.', default);

SELECT * FROM NOTICE;
SELECT bnum, btitle, userid, breadcnt, TO_CHAR(bwritedate,'YYYY-DD-MM HH24:MM'),bcontent,cmtcnt FROM notice ORDER BY bnum DESC;

SELECT * FROM NOTICE WHERE btitle LIKE '%1%' OR userid LIKE '%1%' OR bcontent LIKE '%1%';

SELECT bnum, btitle, userid, breadcnt, TO_CHAR(bwritedate,'YYYY-DD-MM HH24:MM') bwritedate,bcontent,cmtcnt
	  FROM (SELECT ROWNUM AS N
	   			 , bnum
	   			 , btitle
	   			 , userid
	   			 , breadcnt
	   			 , bwritedate
	   			 , bcontent
	   			 , cmtcnt
	   		  FROM (SELECT * FROM NOTICE 
	   		  		 WHERE btitle like '%1%'))
	WHERE N BETWEEN 1 AND 10;
    
----------------------------------------------------------------------------------------

INSERT INTO COMMENT_T VALUES(1, 1, 'admin', 'comment테스트입니다1.', default);
INSERT INTO COMMENT_T VALUES(2, 1, 'admin', 'comment테스트입니다2.', default);
INSERT INTO COMMENT_T VALUES(3, 1, 'admin', 'comment테스트입니다3.', default);

SELECT * FROM COMMENT_T;

-------------------------------------------------------------------------------------------

INSERT INTO QNA VALUES(1, '질문테스트1', 'abc', default, default, '테스트입니다.', 1, default, default);
INSERT INTO QNA VALUES(2, '질문테스트2', 'abc', default, default, '테스트입니다.2', 2, default, default);
INSERT INTO QNA VALUES(3, '질문테스트3', 'abc', default, default, '테스트입니다.3', 3, default, default);
INSERT INTO QNA VALUES(4, '질문테스트4', 'abc', default, default, '테스트입니다.4', 4, default, default);
INSERT INTO QNA VALUES(5, '질문테스트5', 'abc', default, default, '테스트입니다.5', 5, default, default);

INSERT INTO QNA VALUES(100, '로그인이 되지 않아요.', 'abc', default, default, '로그인이 되지 않는 경우 비밀번호 찾기를 통해 신규 비밀번호를 등록하여 로그인 해주세요!', 100, default, 'T');
INSERT INTO QNA VALUES(101, '매물을 찜하는건 어떻게 하나요?', 'abc', default, default, '매물검색 후 조회되는 리스트의 빈하트를 클릭하시면 빨간하트로 변경되며 찜한 매물에 추가됩니다. 로그인 시 메인페이지 하단에 찜한 매물이 보여집니다!', 101, default, 'T');
INSERT INTO QNA VALUES(102, '공인중개사 상담은 못하나요?', 'abc', default, default, '저희 사이트는 아직 공인중개사 상담은 어렵고 매물검색 시 주변 부동산조회를 통해 연락을 취해보세요!!', 102, default, 'T');


SELECT * FROM QNA;
SELECT bnum, userid, breadcnt, TO_CHAR(bwritedate, 'YYYY-MM-DD HH24:MI') bwritedate, bcontent, questionnum, isFAQ FROM qna WHERE questionnum is null ORDER BY bnum DESC;
SELECT * FROM qna WHERE BNUM=5;
UPDATE qna SET BREADCNT = BREADCNT+1 WHERE BNUM=5 AND userid != 'abc';

----------------------------------------------------------------------------------------------















