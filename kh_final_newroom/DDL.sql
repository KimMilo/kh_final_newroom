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