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
    hnum NUMBER REFERENCES HOUSEINFO(housenum)
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
    bnum NUMBER PRIMARY KEY
  , city VARCHAR2(20)
  , gugun VARCHAR2(20)
  , dong VARCHAR2(20)
  , jibun VARCHAR2(30)
  , dongcode VARCHAR2(10)
);

INSERT INTO BASEADDRESS VALUES(1, '서울시', '강남구', '001');
INSERT INTO BASEADDRESS VALUES(2, '서울시', '강남구', '001');
INSERT INTO BASEADDRESS VALUES(3, '서울시', '강남구', '002');

SELECT * FROM BASEADDRESS;

DROP TABLE HOUSEINFO;
CREATE TABLE HOUSEINFO(
    housenum NUMBER PRIMARY KEY
  , dong VARCHAR2(20)
  , aptName VARCHAR2(50)
  , code VARCHAR2(10) REFERENCES BASEADDRESS(dongcode)
  , buildYear VARCHAR2(20)
  , jibun VARCHAR2(30)
  , lat VARCHAR2(50)
  , lng VARCHAR2(50)
  , img VARCHAR2(4000)
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

);

--------------------------------------------------------------------------------

DROP TABLE INTEREST;
CREATE TABLE INTEREST(

);

--------------------------------------------------------------------------------

DROP TABLE USERINFO;
CREATE TABLE USERINFO(

);

-------------------------------------------------------------------------------



------------------------------------------------------------------------------

