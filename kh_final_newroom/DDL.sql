--DDL
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
    hostpitalNo NUMBER PRIMARY KEY
  , city VARCHAR2(20)
  , gugun VARCHAR2(20)
  , hospitalName VARCHAR2(30)
  , address VARCHAR2(200)
  , diagnosisType VARCHAR2(200)
  , phone VARCHAR2(30)
);

INSERT INTO HOSPITAL VALUES(1, '서울시', '강남구', '강남내과의원', '서울시 강남구 논현동 111-1', '내과', '02-1234-5678');
INSERT INTO HOSPITAL VALUES(2, '서울시', '강남구', '강남외과의원', '서울시 강남구 논현동 111-2', '외과', '02-1234-7777');
INSERT INTO HOSPITAL VALUES(3, '서울시', '강남구', '강남소아과의원', '서울시 강남구 논현동 111-3', '소아과', '02-1234-8888');

-----------------------------------------------------------------------------------


SELECT hospitalNo, city, gugun, hospitalName, address, diagnosisType, phone
  FROM HOSTPITAL
 WHERE (city, gugun) IN (SELECT DISTINCT LEFT(city, 2), gugun
                              FROM BASEADDRESS b
                             WHERE b.dongcode = (SELECT DISTINCT code 
                                                   FROM HOUSEINFO
                                                  WHERE hospitalNo = #{no})	
                            );
            
