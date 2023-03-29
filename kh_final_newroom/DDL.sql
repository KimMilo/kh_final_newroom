--DDL
-- 일단 테스트용으로만 생성 하는거고 생성 대충 마무리 되면 ERD 그려가면서 구조 짜야되고
-- insert 등 짤 때도 서브쿼리 어떻게 진행할 것인지 같이 고민해봐야 할 것 같다.

DROP TABLE CHAT;
CREATE TABLE CHAT(
    chatID NUMBER PRIMARY KEY
  , fromID VARCHAR2(20)
  , toID VARCHAR2(20)
  , chatContext VARCHAR2(2000)
  , chatTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
------------------------------------------------------------------------------
INSERT INTO CHAT VALUES(1, 'aaa', 'bbb', '안녕', DEFAULT);
INSERT INTO CHAT VALUES(2, 'bbb', 'bbb', '안녕', DEFAULT);
INSERT INTO CHAT VALUES(3, 'aaa', 'bbb', '안녕', DEFAULT);


SELECT * FROM CHAT;
SELECT chatID, fromID, toID, chatContext, chatTime 
  FROM CHAT 
 WHERE (fromID = 'aaa' AND toID = 'bbb')
		OR (fromID = 'bbb' AND toID = 'aaa') ORDER BY chatTime;
------------------------------------------------------------------------------
DROP TABLE CHAT_ROOM;
CREATE TABLE CHAT_ROOM(
    roomID NUMBER PRIMARY KEY
  , userID VARCHAR2(20)
);
INSERT INTO CHAT_ROOM VALUES(1, 'aaa');
INSERT INTO CHAT_ROOM VALUES(2, 'bbb');
INSERT INTO CHAT_ROOM VALUES(3, 'ccc');

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

DROP TABLE BASEADDRESS;
CREATE TABLE BASEADDRESS(
    no NUMBER PRIMARY KEY
  , city VARCHAR2(20)
  , gugun VARCHAR2(20)
  , dong VARCHAR2(20)
  , jibun VARCHAR2(30)
  , dongcode VARCHAR2(10)
);

INSERT INTO BASEADDRESS VALUES(1, '서울시', '강남구', '논현동', '001-01', '001');
INSERT INTO BASEADDRESS VALUES(2, '서울시', '강남구', '논현동', '001-02', '001');
INSERT INTO BASEADDRESS VALUES(3, '서울시', '강남구', '논현동', '001-03', '002');

SELECT * FROM BASEADDRESS;

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

INSERT INTO HOUSEINFO VALUES(1, '논현동', '논현아파트', '001', '2000', '100-01', null, null, null);
INSERT INTO HOUSEINFO VALUES(2, '논현동', '현대아파트', '001', '2001', '200-01', null, null, null);
INSERT INTO HOUSEINFO VALUES(3, '논현동', '아이파크아파트', '001', '2010', '300-01', null, null, null);

SELECT * FROM HOUSEINFO;


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

DROP TABLE SIDOCODE;
CREATE TABLE SIDOCODE(

);

DROP TABLE GUGUNCODE;
CREATE TABLE GUGUNCODE(

);

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

INSERT INTO HOUSEDEAL VALUES(1, 1, '논현동', '롯데캐슬', '101-01', null, null, '11억', '2023', '03', '22', '59', '11', '매매', null, null);
INSERT INTO HOUSEDEAL VALUES(2, 2, '논현동', '롯데캐슬', '101-01', null, null, '9억', '2023', '03', '22', '59', '11', '매매', null, '10.jpg');
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

SELECT * FROM USERINFO;

select i.userid, i.inum, d.area, d.floor, d.dealAmount, f.AptName, f.img
	from housedeal d JOIN interest i on d.hdnum = i.inum JOIN houseinfo f on d.hdnum = f.hsnum
	where i.userid = #{userid}

-------------------------------------------------------------------------------

DROP TABLE NOTICE;
CREATE TABLE NOTICE(

);

DROP TABLE COMMENT_T;
CREATE TABLE COMMENT_T(

);
-----------------------------------------------------------------------------------
DROP TABLE QNA;
CREATE TABLE QNA(
    bnum NUMBER
  , btitle VARCHAR2(100)
  , userid VARCHAR2(20)
  , breadcnt NUMBER DEFAULT 0
  , bwritedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , bcontent VARCHAR2(2000)
  , questionnum NUMBER
  , isFAQ CHAR(1) DEFAULT 'F' CHECK(isFAQ IN('T','F'))
);

INSERT INTO QNA VALUES(1, '질문테스트1', 'abc', default, default, '테스트입니다.', null, default);
INSERT INTO QNA VALUES(2, '질문테스트2', 'abc', default, default, '테스트입니다.2', null, default);
INSERT INTO QNA VALUES(3, '질문테스트3', 'abc', default, default, '테스트입니다.3', null, default);
INSERT INTO QNA VALUES(4, '질문테스트4', 'abc', default, default, '테스트입니다.4', null, default);
INSERT INTO QNA VALUES(5, '질문테스트5', 'abc', default, default, '테스트입니다.5', null, default);

SELECT * FROM QNA;
SELECT bnum, userid, breadcnt, TO_CHAR(bwritedate, 'YYYY-MM-DD HH24:MI') bwritedate, bcontent, questionnum, isFAQ FROM qna WHERE questionnum is null ORDER BY bnum DESC;
SELECT * FROM qna WHERE BNUM=5;
UPDATE qna SET BREADCNT = BREADCNT+1 WHERE BNUM=5 AND userid != 'abc';