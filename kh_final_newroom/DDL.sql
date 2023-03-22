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