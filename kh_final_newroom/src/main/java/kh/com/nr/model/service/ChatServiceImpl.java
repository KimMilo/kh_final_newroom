package kh.com.nr.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.nr.model.dao.ChatDao;
import kh.com.nr.model.dto.ChatDto;
import kh.com.nr.model.dto.RoomDto;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDao dao;

	public List<ChatDto> getChatListByID(ChatDto dto) { //채팅 목록 조회
		return dao.getChatListByID(dto);
	}

	public int submit(ChatDto dto) { //채팅 전송
		return dao.submit(dto);

	}

	public List<ChatDto> chatLoadNewMessage(ChatDto dto) { //새로운 메시지 조회
		return dao.chatLoadNewMessage(dto);
	}

	public List<RoomDto> getRoomList() { //전체 채팅방 목록 출력
		return dao.getRoomList();
	}

	public int makeRoom(String userID) { //채팅방 생성
		int result = 0;
		
		//일단, 이 아이디로 만들어진 채팅방 이미 생성됐는지 검사
		if(!userID.equals(dao.isRoom(userID))) {
			result = dao.makeRoom(userID); //채팅방 생성
			System.out.println("=============관리자모드:    "+userID+"님과 채팅방 생성");

		}else {
			result = 0;
		}
		return result;
	}

	public List<RoomDto> chatLoadNewRoom(int roomID) {
		return dao.chatLoadNewRoom(roomID); //채팅방 생성
	}
}
