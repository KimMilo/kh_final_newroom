--DDL
-- �ϴ� �׽�Ʈ�����θ� ���� �ϴ°Ű� ���� ���� ������ �Ǹ� ERD �׷����鼭 ���� ¥�ߵǰ�
-- insert �� © ���� �������� ��� ������ ������ ���� ����غ��� �� �� ����.

DROP TABLE CHAT;
CREATE TABLE CHAT(
    chatID NUMBER PRIMARY KEY
  , fromID VARCHAR2(20)
  , toID VARCHAR2(20)
  , chatContext VARCHAR2(2000)
  , chatTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
------------------------------------------------------------------------------
INSERT INTO CHAT VALUES(1, 'aaa', 'bbb', '�ȳ�', DEFAULT);
INSERT INTO CHAT VALUES(2, 'bbb', 'bbb', '�ȳ�', DEFAULT);
INSERT INTO CHAT VALUES(3, 'aaa', 'bbb', '�ȳ�', DEFAULT);


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

INSERT INTO HOSPITAL VALUES(1, '�����', '������', '���������ǿ�', '����� ������ ������ 111-1', '����', '02-1234-5678');
INSERT INTO HOSPITAL VALUES(1, '�����', '������', '�����ܰ��ǿ�', '����� ������ ������ 111-2', '�ܰ�', '02-1234-7777');
INSERT INTO HOSPITAL VALUES(1, '�����', '������', '�����Ҿư��ǿ�', '����� ������ ������ 111-3', '�Ҿư�', '02-1234-8888');
INSERT INTO HOSPITAL VALUES(1, '�����', '������', '�����Ҿư��ǿ�', '����� ������ ������ 111-3', '�Ҿư�', '02-1234-8888');
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

INSERT INTO BASEADDRESS VALUES(1, '�����', '������', '������', '001-01', '001');
INSERT INTO BASEADDRESS VALUES(2, '�����', '������', '������', '001-02', '001');
INSERT INTO BASEADDRESS VALUES(3, '�����', '������', '������', '001-03', '002');

SELECT * FROM BASEADDRESS;

DROP TABLE HOUSEINFO;
CREATE TABLE HOUSEINFO(
    housenum NUMBER PRIMARY KEY
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

);

--------------------------------------------------------------------------------

DROP TABLE INTEREST;
CREATE TABLE INTEREST(

);

--------------------------------------------------------------------------------

DROP TABLE USERINFO;
CREATE TABLE USERINFO(
    userId VARCHAR2(20) 
  , userPw VARCHAR2(20)
  , userName VARCHAR2(15)
  , userEmail VARCHAR2(30)
  , userPhone VARCHAR2(30)
  , mRole NUMBER DEFAULT 0 CHECK (mRole IN(0,1))
  , img VARCHAR2(500)
);

INSERT INTO USERINFO VALUES('abcd', 'abcd666', '�ƹ���', 'abcd666@naver.com', '010-123-4567', 0, null);
INSERT INTO USERINFO VALUES('admin', 'admin777', '������', 'admin@naver.com', '010-777-7777', 1, null);

SELECT * FROM USERINFO;
-------------------------------------------------------------------------------

DROP TABLE NOTICE;
CREATE TABLE NOTICE(

);

DROP TABLE COMMENT_T;
CREATE TABLE COMMENT_T(

)
