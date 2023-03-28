package kh.com.nr.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.nr.model.dto.ChatDto;
import kh.com.nr.model.dto.RoomDto;

@Repository
public class ChatDao {

	@Autowired
	private SqlSession sqlSession;

	public List<ChatDto> getChatListByID(ChatDto dto) {
		return sqlSession.selectList("chat.getChatListByID", dto);
	}

	public int submit(ChatDto dto) {
		return sqlSession.insert("chat.submit", dto);
	}

	public List<ChatDto> chatLoadNewMessage(ChatDto dto) {
		return sqlSession.selectList("chat.chatLoadNewMessage", dto);
	}

	public List<RoomDto> getRoomList() {
		return sqlSession.selectList("chat.getRoomList");
	}

	public String isRoom(String userID) {
		return sqlSession.selectOne("chat.isRoom", userID);
	}

	public int makeRoom(String userID) {
		return sqlSession.insert("chat.makeRoom", userID);
	}

	public List<RoomDto> chatLoadNewRoom(int roomID) {
		return sqlSession.selectList("chat.chatLoadNewRoom", roomID);
	}
	
}
