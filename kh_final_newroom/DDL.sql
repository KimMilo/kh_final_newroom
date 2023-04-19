--DDL

DROP TABLE CHAT;
CREATE TABLE CHAT(
    chatID NUMBER PRIMARY KEY
  , fromID VARCHAR2(20) REFERENCES USERINFO(userid)
  , toID VARCHAR2(20) REFERENCES USERINFO(userid)
  , chatContent VARCHAR2(2000)
  , chatTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


------------------------------------------------------------------------------
DROP TABLE CHAT_ROOM;
CREATE TABLE CHAT_ROOM(
    roomID NUMBER PRIMARY KEY
  , userID VARCHAR2(20)
);

-------------------------------------------------------------------------------
DROP TABLE HOSPITAL;
CREATE TABLE HOSPITAL(
    no NUMBER PRIMARY KEY
  , city VARCHAR2(20)
  , gugun VARCHAR2(20)
  , dong VARCHAR2(20)
  , hospitalName VARCHAR2(30)
  , address VARCHAR2(200)
  , diagnosisType VARCHAR2(200)
  , phone VARCHAR2(30)
);

-----------------------------------------------------------------------------------
DROP TABLE BASEADDRESS;
CREATE TABLE BASEADDRESS(
    city VARCHAR2(20)
  , gugun VARCHAR2(20)
  , dong VARCHAR2(20)
  , dongcode VARCHAR2(4)
);

--------------------------------------------------------------------------------

DROP TABLE SIDOCODE;
CREATE TABLE SIDOCODE(
    sido_code VARCHAR2(1)
  , sido_name VARCHAR2(20)
);

------------------------------------------------------------------------------------

DROP TABLE GUGUNCODE;
CREATE TABLE GUGUNCODE(
    gugun_code VARCHAR2(4)
  , gugun_name VARCHAR2(20)
);

-----------------------------------------------------------------------------------------------
DROP TABLE HOUSEINFO;
CREATE TABLE HOUSEINFO(
    no NUMBER PRIMARY KEY
  , dong VARCHAR2(20)
  , aptName VARCHAR2(50)
  , code VARCHAR2(10)
  , buildYear VARCHAR2(20)
  , jibun VARCHAR2(30)
  , lat VARCHAR2(30)
  , lng VARCHAR2(30)
  , img VARCHAR2(100)
);

------------------------------------------------------------------------------------

DROP TABLE HOUSEDEAL;
CREATE TABLE HOUSEDEAL(
    dealId NUMBER PRIMARY KEY
  , no NUMBER --REFERENCES HOUSEINFO(no)
  , dealAmount VARCHAR2(20)
  , dealYear VARCHAR2(10)
  , dealMonth VARCHAR2(5)
  , dealDay VARCHAR2(10)
  , area VARCHAR2(20)
  , floor VARCHAR2(10)
  , dtype VARCHAR2(10)
  , rentMoney VARCHAR2(20)
  , img VARCHAR2(100)
);

--------------------------------------------------------------------------------

DROP TABLE INTEREST;
CREATE TABLE INTEREST(
    userid VARCHAR2(20)
  , dealId NUMBER REFERENCES HOUSEDEAL(dealId)
);

--------------------------------------------------------------------------------

DROP TABLE USERINFO;
CREATE TABLE USERINFO(
    no NUMBER PRIMARY KEY
  , userId VARCHAR2(20) UNIQUE
  , userPw VARCHAR2(150)
  , userName VARCHAR2(15)
  , userEmail VARCHAR2(30)
  , userPhone VARCHAR2(30)
  , mRole VARCHAR2(20) DEFAULT 'ROLE_MEMBER' CHECK (mRole IN('ROLE_MEMBER','ROLE_ADMIN'))
  , enabled NUMBER DEFAULT 1
  , img VARCHAR2(100)
);

SELECT * FROM USERINFO;
-------------------------------------------------------------------------------

DROP TABLE NOTICE;
CREATE TABLE NOTICE(
    bnum NUMBER PRIMARY KEY
  , btitle VARCHAR2(100)
  , userid VARCHAR2(20) REFERENCES USERINFO(userid)
  , breadcnt NUMBER DEFAULT 0
  , bwritedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  , bcontent VARCHAR2(2000)
  , cmtcnt NUMBER DEFAULT 0
);

-----------------------------------------------------------------------------------------------
DROP TABLE COMMENT_T;
CREATE TABLE COMMENT_T(
    cnum NUMBER PRIMARY KEY
  , bnum NUMBER
  , cwriter VARCHAR2(20)
  , ccontent VARCHAR2(2000)
  , cwritedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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
