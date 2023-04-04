--DDL
-- �ϴ� �׽�Ʈ�����θ� ���� �ϴ°Ű� ���� ���� ������ �Ǹ� ERD �׷����鼭 ���� ¥�ߵǰ�
-- insert �� © ���� �������� ��� ������ ������ ���� ����غ��� �� �� ����.

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

INSERT INTO HOSPITAL VALUES(1, '�����', '������', '���������ǿ�', '����� ������ ������ 111-1', '����', '02-1234-5678');
INSERT INTO HOSPITAL VALUES(1, '�����', '������', '�����ܰ��ǿ�', '����� ������ ������ 111-2', '�ܰ�', '02-1234-7777');
INSERT INTO HOSPITAL VALUES(1, '�����', '������', '�����Ҿư��ǿ�', '����� ������ ������ 111-3', '�Ҿư�', '02-1234-8888');
INSERT INTO HOSPITAL VALUES(1, '�����', '������', '�����Ҿư��ǿ�', '����� ������ ������ 111-3', '�Ҿư�', '02-1234-8888');
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

INSERT INTO BASEADDRESS VALUES(1, '�����', '������', '������', '001-01', '001');
INSERT INTO BASEADDRESS VALUES(2, '�����', '������', '������', '001-02', '001');
INSERT INTO BASEADDRESS VALUES(3, '�����', '������', '������', '001-03', '002');

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

INSERT INTO HOUSEINFO VALUES(1, '������', '��������Ʈ', '001', '2000', '100-01', null, null, null);
INSERT INTO HOUSEINFO VALUES(2, '������', '�������Ʈ', '001', '2001', '200-01', null, null, null);
INSERT INTO HOUSEINFO VALUES(3, '������', '������ũ����Ʈ', '001', '2010', '300-01', null, null, null);

SELECT * FROM HOUSEINFO;


SELECT hnum, city, gugun, hospitalName, address, diagnosisType, phone
  FROM HOSPITAL
 WHERE (city, gugun) IN (SELECT DISTINCT city, gugun
                              FROM BASEADDRESS b
                             WHERE b.dongcode = (SELECT DISTINCT code 
                                                   FROM HOUSEINFO
                                                  WHERE housenum = 2)	
                            );
--TODO �Ͽ콺 �ѹ��� ���� �ѹ��� ��� ��������� �����ؾ���.
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

INSERT INTO HOUSEDEAL VALUES(1, 1, '������', '�Ե�ĳ��', '101-01', null, null, '11��', '2023', '03', '22', '59', '11', '�Ÿ�', null, null);
INSERT INTO HOUSEDEAL VALUES(2, 2, '������', '�Ե�ĳ��', '101-01', null, null, '9��', '2023', '03', '22', '59', '11', '�Ÿ�', null, '10.jpg');
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

INSERT INTO INTEREST VALUES('abc', 1, '�����', '����', '11��', '�Ե�ĳ��', null);
INSERT INTO INTEREST VALUES('abc', 2, '�����', '����', '9��', '����', null);
INSERT INTO INTEREST VALUES('abc', 3, '�����', '����', '10��5õ', '������ũ', null);
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

INSERT INTO USERINFO VALUES('abc', 1, 'abc', '�ƹ���', 'abcd666@naver.com', '010-123-4567', 0, null);
INSERT INTO USERINFO VALUES('admin', 2, 'admin777', '������', 'admin@naver.com', '010-777-7777', 1, null);
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
	 WHERE N BETWEEN 1 AND 5
       AND username LIKE '%1%';

SELECT COUNT(*) FROM USERINFO;
SELECT COUNT(*) FROM USERINFO WHERE username LIKE '%1%';

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

INSERT INTO NOTICE VALUES(1, '�����׽�Ʈ1', 'admin', default, default, '�׽�Ʈ�Դϴ�1.', default);
INSERT INTO NOTICE VALUES(2, '�����׽�Ʈ2', 'admin', default, default, '�׽�Ʈ�Դϴ�2.', default);
INSERT INTO NOTICE VALUES(3, '�����׽�Ʈ3', 'admin', default, default, '�׽�Ʈ�Դϴ�3.', default);
INSERT INTO NOTICE VALUES(4, '�����׽�Ʈ4', 'admin', default, default, '�׽�Ʈ�Դϴ�4.', default);

SELECT * FROM NOTICE;
SELECT bnum, btitle, userid, breadcnt, TO_CHAR(bwritedate,'YYYY-DD-MM HH24:MM'),bcontent,cmtcnt FROM notice ORDER BY bnum DESC;
-----------------------------------------------------------------------------------------------
DROP TABLE COMMENT_T;
CREATE TABLE COMMENT_T(
    cnum NUMBER
  , bnum NUMBER
  , cwriter VARCHAR2(20)
  , ccontent VARCHAR2(2000)
  , cwritedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO COMMENT_T VALUES(1, 1, 'admin', 'comment�׽�Ʈ�Դϴ�1.', default);
INSERT INTO COMMENT_T VALUES(2, 1, 'admin', 'comment�׽�Ʈ�Դϴ�2.', default);
INSERT INTO COMMENT_T VALUES(3, 1, 'admin', 'comment�׽�Ʈ�Դϴ�3.', default);

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

INSERT INTO QNA VALUES(1, '�����׽�Ʈ1', 'abc', default, default, '�׽�Ʈ�Դϴ�.', 1, default, default);
INSERT INTO QNA VALUES(2, '�����׽�Ʈ2', 'abc', default, default, '�׽�Ʈ�Դϴ�.2', 2, default, default);
INSERT INTO QNA VALUES(3, '�����׽�Ʈ3', 'abc', default, default, '�׽�Ʈ�Դϴ�.3', 3, default, default);
INSERT INTO QNA VALUES(4, '�����׽�Ʈ4', 'abc', default, default, '�׽�Ʈ�Դϴ�.4', 4, default, default);
INSERT INTO QNA VALUES(5, '�����׽�Ʈ5', 'abc', default, default, '�׽�Ʈ�Դϴ�.5', 5, default, default);

SELECT * FROM QNA;
SELECT bnum, userid, breadcnt, TO_CHAR(bwritedate, 'YYYY-MM-DD HH24:MI') bwritedate, bcontent, questionnum, isFAQ FROM qna WHERE questionnum is null ORDER BY bnum DESC;
SELECT * FROM qna WHERE BNUM=5;
UPDATE qna SET BREADCNT = BREADCNT+1 WHERE BNUM=5 AND userid != 'abc';