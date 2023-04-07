--DDL
-- 일단 테스트용으로만 생성 하는거고 생성 대충 마무리 되면 ERD 그려가면서 구조 짜야되고
-- insert 등 짤 때도 서브쿼리 어떻게 진행할 것인지 같이 고민해봐야 할 것 같다.

DROP TABLE CHAT;
CREATE TABLE CHAT(
    chatID NUMBER PRIMARY KEY
  , fromID VARCHAR2(20)
  , toID VARCHAR2(20)
  , chatContent VARCHAR2(2000)
  , chatTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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
------------------------------------------------------------------------------
DROP TABLE CHAT_ROOM;
CREATE TABLE CHAT_ROOM(
    roomID NUMBER PRIMARY KEY
  , userID VARCHAR2(20)
);


SELECT * FROM CHAT_ROOM;

-------------------------------------------------------------------------------
DROP TABLE HOSPITAL;
CREATE TABLE HOSPITAL(
    no NUMBER --REFERENCES HOUSEINFO(no)
  , city VARCHAR2(20)
  , gugun VARCHAR2(20)
  , hospitalName VARCHAR2(30)
  , address VARCHAR2(200)
  , diagnosisType VARCHAR2(200)
  , phone VARCHAR2(30)
);

INSERT INTO HOSPITAL VALUES(1, '서울시', '강남구', '강남내과의원', '서울시 강남구 논현동 111-1', '내과', '02-1234-5678');
INSERT INTO HOSPITAL VALUES(1, '서울시', '강남구', '강남외과의원', '서울시 강남구 논현동 111-2', '외과', '02-1234-7777');
INSERT INTO HOSPITAL VALUES(1, '서울시', '강남구', '강남소아과의원', '서울시 강남구 논현동 111-3', '소아과', '02-1234-8888');
INSERT INTO HOSPITAL VALUES(1, '서울시', '강남구', '강남소아과의원', '서울시 강남구 논현동 111-3', '소아과', '02-1234-8888');
-----------------------------------------------------------------------------------

SELECT hnum, city, gugun, hospitalName, address, diagnosisType, phone
  FROM HOSPITAL
 WHERE (city, gugun) IN (SELECT DISTINCT city, gugun
                              FROM BASEADDRESS b
                             WHERE b.dongcode = (SELECT DISTINCT code 
                                                   FROM HOUSEINFO
                                                  WHERE housenum = 2)	
                            );
--TODO 하우스 넘버와 병원 넘버를 어떻게 맞출것인지 생각해야함.
 --------------------------------------------------------------------------------------------

DROP TABLE BASEADDRESS;
CREATE TABLE BASEADDRESS(
    city VARCHAR2(20)
  , gugun VARCHAR2(20)
  , dong VARCHAR2(20)
  , dongcode VARCHAR2(10)
);

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
INSERT INTO BASEADDRESS VALUES('경기도', '부천시', '오장동', 'B052');
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

DROP TABLE SIDOCODE;
CREATE TABLE SIDOCODE(
    sido_code VARCHAR2(20)
  , sido_name VARCHAR2(20)
);

INSERT INTO SIDOCODE VALUES('A', '서울특별시');
INSERT INTO SIDOCODE VALUES('B', '경기도');

SELECT sido_code, sido_name FROM sidocode;

DROP TABLE GUGUNCODE;
CREATE TABLE GUGUNCODE(
    gugun_code VARCHAR2(20)
  , gugun_name VARCHAR2(30)
);

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
-----------------------------------------------------------------------------------------------
DROP TABLE HOUSEINFO;
CREATE TABLE HOUSEINFO(
    no NUMBER PRIMARY KEY
  , dong VARCHAR2(20)
  , aptName VARCHAR2(50)
  , code VARCHAR2(10)
  , buildYear VARCHAR2(20)
  , jibun VARCHAR2(30)
  , lat VARCHAR2(50)
  , lng VARCHAR2(50)
  , img VARCHAR2(500)
);

INSERT INTO HOUSEINFO VALUES(1, '개포동', '더샵트리에', 'A011', '2021', '651-1', null, null, '1.jpg');
INSERT INTO HOUSEINFO VALUES(2, '논현동', '논현e-편한세상', 'A012', '2005', '195-1', null, null, '2.jpg');

INSERT INTO HOUSEINFO VALUES(3, '개봉동', '신개봉삼환', 'A021', '2001', '170-30', null, null, '3.jpg');
INSERT INTO HOUSEINFO VALUES(4, '고척동', '청솔우성', 'A022', '2000', '329', null, null, '4.jpg');
INSERT INTO HOUSEINFO VALUES(5, '노량진동', '쌍용예가', 'A031', '2010', '332', null, null, '5.jpg');
INSERT INTO HOUSEINFO VALUES(6, '대방동', '대방경남아너스빌', 'A032', '2006', '512', null, null, '6.jpg');
INSERT INTO HOUSEINFO VALUES(7, '마포동', '경남한신코아', 'A041', '1992', '350', null, null, '7.jpg');
INSERT INTO HOUSEINFO VALUES(8, '망원동', '마포영화블렌하임', 'A042', '2009', '517', null, null, '8.jpg');
INSERT INTO HOUSEINFO VALUES(9, '반포동', '반포푸르지오', 'A051', '2000', '10', null, null, '9.jpg');
INSERT INTO HOUSEINFO VALUES(10, '방배동', '방배한진로즈힐', 'A052', '2005', '3276', null, null, '10.jpg');
INSERT INTO HOUSEINFO VALUES(11, '가평읍', '우림필유2단지', 'B011', '2006', '대곡리 366-8', null, null, '11.jpg');
INSERT INTO HOUSEINFO VALUES(12, '가평읍', '가평센트럴파크더스카이', 'B012', '2022', '읍내리 457-5', null, null, '12.jpg');
INSERT INTO HOUSEINFO VALUES(13, '대화동', '성저7단지건영', 'B021', '1996', '2081', null, null, '13.jpg');
INSERT INTO HOUSEINFO VALUES(14, '대화동', '성저3단지풍림', 'B022', '1996', '2215', null, null, '14.jpg');
INSERT INTO HOUSEINFO VALUES(15, '고촌읍', '김포고촌우방아이유쉘', 'B031', '2014', '신곡리 1284', null, null, '15.jpg');
INSERT INTO HOUSEINFO VALUES(16, '구래동', '한강신도시반도유보라5차', 'B032', '2018', '6873-19', null, null, '16.jpg');
INSERT INTO HOUSEINFO VALUES(17, '금곡동', '금곡역디에브스', 'B041', '2020', '777', null, null, '17.jpg');
INSERT INTO HOUSEINFO VALUES(18, '별내동', '남양주별내아이파크', 'B042', '2012', '854', null, null, '18.jpg');
INSERT INTO HOUSEINFO VALUES(19, '고강동', '동문미도', 'B051', '1989', '327-7', null, null, '19.jpg');
INSERT INTO HOUSEINFO VALUES(20, '오정동', '오정휴먼시아3단지', 'B052', '2006', '732', null, null, '20.jpg');





SELECT * FROM HOUSEINFO;

DROP TABLE HOUSEDEAL;
CREATE TABLE HOUSEDEAL(
    dealId NUMBER
  , no NUMBER
  , dong VARCHAR2(20)
  , aptName VARCHAR2(50)
  , jibun VARCHAR2(30)
  , lat VARCHAR2(50)
  , lng VARCHAR2(50)
  , dealAmount VARCHAR2(50)
  , dealYear VARCHAR2(10)
  , dealMonth VARCHAR2(5)
  , dealDay VARCHAR2(10)
  , area VARCHAR2(100)
  , floor VARCHAR2(50)
  , dtype VARCHAR2(10)
  , rentMoney VARCHAR2(50)
  , img VARCHAR2(500)
);

INSERT INTO HOUSEDEAL VALUES(1, 1, '개포동', '더샵트리에', '651-1', null, null, '24억', '2023', '03', '01', '135C', '15', '매매', null, '1.jpg');
INSERT INTO HOUSEDEAL VALUES(2, 2, '논현동', '논현e-편한세상', '195-1', null, null, '18억', '2023', '03', '22', '109B', '11', '매매', null, '2.jpg');

INSERT INTO HOUSEDEAL VALUES(3, 3, '개봉동', '신개봉삼환', '170-30', null, null, '6억', '2023', '04', '30', '84', '1', '매매', null, '3.jpg');
INSERT INTO HOUSEDEAL VALUES(4, 4, '고척동', '청솔우성', '329', null, null, '4억', '2023', '05', '15', '84', '6', '전세', null, '4.jpg');
INSERT INTO HOUSEDEAL VALUES(5, 5, '노량진동', '쌍용예가', '332', null, null, '13.6억', '2023', '05', '30', '84', '11', '매매', null, '5.jpg');
INSERT INTO HOUSEDEAL VALUES(6, 6, '대방동', '대방경남아너스빌', '512', null, null, '6.5억', '2023', '06', '01', '84', '3', '전세', null, '6.jpg');
INSERT INTO HOUSEDEAL VALUES(7, 7, '마포동', '강변한신코아', '350', null, null, '1억/200', '2023', '06', '10', '83', '6', '월세', null, '7.jpg');
INSERT INTO HOUSEDEAL VALUES(8, 8, '망원동', '마포영화블렌하임', '517', null, null, '10억', '2023', '06', '15', '103', '저', '매매', null, '8.jpg');
INSERT INTO HOUSEDEAL VALUES(9, 9, '반포동', '반포푸르지오', '10', null, null, '8억/120', '2023', '06', '22', '84', '중', '월세', null, '9.jpg');
INSERT INTO HOUSEDEAL VALUES(10, 10, '방배동', '방배한진로즈힐', '3276', null, null, '11억', '2023', '07', '02', '97', '13', '전세', null, '10.jpg');
INSERT INTO HOUSEDEAL VALUES(11, 11, '가평읍', '우림필유2단지', '대곡리 366-8', null, null, '4억', '2023', '07', '12', '122', '고층', '매매', null, '11.jpg');
INSERT INTO HOUSEDEAL VALUES(12, 12, '가평읍', '가평센트럴파크더스카이', '읍내리 457-5', null, null, '2.2억', '2023', '07', '22', '59', '28', '전세', null, '12.jpg');
INSERT INTO HOUSEDEAL VALUES(13, 13, '대화동', '성저7단지건영', '2081', null, null, '4.5억', '2023', '08', '01', '84', '3', '매매', null, '13.jpg');
INSERT INTO HOUSEDEAL VALUES(14, 14, '대화동', '성저3단지풍림', '2215', null, null, '2억', '2023', '08', '22', '45', '14', '전세', null, '14.jpg');
INSERT INTO HOUSEDEAL VALUES(15, 15, '고촌읍', '김포고촌우방아이유쉘', '신곡리 1284', null, null, '6.7억', '2023', '09', '15', '84', '5', '매매', null, '15.jpg');
INSERT INTO HOUSEDEAL VALUES(16, 16, '구래동', '한강신도시반도유보라5차', '6873-19', null, null, '5.1억', '2023', '09', '30', '96', '9', '매매', null, '16.jpg');
INSERT INTO HOUSEDEAL VALUES(17, 17, '금곡동', '금곡역디에브스', '777', null, null, '2.7억', '2023', '10', '15', '84', '3', '전세', null, '17.jpg');
INSERT INTO HOUSEDEAL VALUES(18, 18, '별내동', '남양주별내아이파크', '854', null, null, '1.7억/120', '2023', '10', '30', '124', '5', '월세', null, '18.jpg');
INSERT INTO HOUSEDEAL VALUES(19, 19, '고강동', '동문미도', '327-7', null, null, '2.5억', '2023', '11', '31', '59', '1', '매매', null, '19.jpg');
INSERT INTO HOUSEDEAL VALUES(20, 20, '오정동', '오정휴먼시아3단지', '732', null, null, '4.5억', '2023', '12', '31', '59', '2', '매매', null, '20.jpg');

SELECT * FROM HOUSEDEAL;
SELECT d.no, d.dealAmount, d.dealYear, d.dealMonth, d.dealDay, 
	d.area, d.floor, d.dtype, d.rentMoney,
	i.dong, i.aptName, i.jibun, i.lat, i.lng, i.img
	FROM housedeal d, houseinfo i
	WHERE d.no=i.no AND i.aptName like CONCAT('%',aptName,'%');

--------------------------------------------------------------------------------

DROP TABLE INTEREST;
CREATE TABLE INTEREST(
    userid VARCHAR2(20)
  , no NUMBER
  , area VARCHAR2(100)
  , floor VARCHAR2(50)
  , dealAmount VARCHAR2(50)
  , aptName VARCHAR2(30)
  , img VARCHAR2(100)
);

INSERT INTO INTEREST VALUES('abc', 1, '서울시', '고층', '11억', '롯데캐슬', null);
INSERT INTO INTEREST VALUES('abc', 2, '서울시', '고층', '9억', '자이', null);
INSERT INTO INTEREST VALUES('abc', 3, '서울시', '고층', '10억5천', '아이파크', null);
--------------------------------------------------------------------------------

DROP TABLE USERINFO;
CREATE TABLE USERINFO(
    userId VARCHAR2(20)
  , no NUMBER
  , userPw VARCHAR2(20)
  , userName VARCHAR2(15)
  , userEmail VARCHAR2(30)
  , userPhone VARCHAR2(30)
  , mRole NUMBER DEFAULT 0 CHECK (mRole IN(0,1))
  , img VARCHAR2(500)
);

INSERT INTO USERINFO VALUES('abc', 1, 'abc', '아무개', 'abcd666@naver.com', '010-123-4567', 0, null);
INSERT INTO USERINFO VALUES('admin', 2, 'admin777', '관리자', 'admin@naver.com', '010-777-7777', 1, null);
INSERT INTO USERINFO VALUES('111', 3, '111', '111', '111', '111', 0, null);

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
-------------------------------------------------------------------------------

DROP TABLE NOTICE;
CREATE TABLE NOTICE(
    bnum NUMBER
  , btitle VARCHAR2(100)
  , userid VARCHAR2(20)
  , breadcnt NUMBER DEFAULT 0
  , bwritedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , bcontent VARCHAR2(2000)
  , cmtcnt NUMBER DEFAULT 0
);

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
-----------------------------------------------------------------------------------------------
DROP TABLE COMMENT_T;
CREATE TABLE COMMENT_T(
    cnum NUMBER
  , bnum NUMBER
  , cwriter VARCHAR2(20)
  , ccontent VARCHAR2(2000)
  , cwritedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO COMMENT_T VALUES(1, 1, 'admin', 'comment테스트입니다1.', default);
INSERT INTO COMMENT_T VALUES(2, 1, 'admin', 'comment테스트입니다2.', default);
INSERT INTO COMMENT_T VALUES(3, 1, 'admin', 'comment테스트입니다3.', default);

SELECT * FROM COMMENT_T;


-----------------------------------------------------------------------------------
DROP TABLE QNA;
CREATE TABLE QNA(
    bnum NUMBER PRIMARY KEY
  , btitle VARCHAR2(100)
  , userid VARCHAR2(20)
  , breadcnt NUMBER DEFAULT 0
  , bwritedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , bcontent VARCHAR2(2000)
  , blevel NUMBER REFERENCES qna(bnum)
  , questionnum NUMBER DEFAULT 0
  , isFAQ CHAR(1) DEFAULT 'F' CHECK(isFAQ IN('T','F'))
);

INSERT INTO QNA VALUES(1, '질문테스트1', 'abc', default, default, '테스트입니다.', 1, default, default);
INSERT INTO QNA VALUES(2, '질문테스트2', 'abc', default, default, '테스트입니다.2', 2, default, default);
INSERT INTO QNA VALUES(3, '질문테스트3', 'abc', default, default, '테스트입니다.3', 3, default, default);
INSERT INTO QNA VALUES(4, '질문테스트4', 'abc', default, default, '테스트입니다.4', 4, default, default);
INSERT INTO QNA VALUES(5, '질문테스트5', 'abc', default, default, '테스트입니다.5', 5, default, default);

SELECT * FROM QNA;
SELECT bnum, userid, breadcnt, TO_CHAR(bwritedate, 'YYYY-MM-DD HH24:MI') bwritedate, bcontent, questionnum, isFAQ FROM qna WHERE questionnum is null ORDER BY bnum DESC;
SELECT * FROM qna WHERE BNUM=5;
UPDATE qna SET BREADCNT = BREADCNT+1 WHERE BNUM=5 AND userid != 'abc';

