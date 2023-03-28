package kh.com.nr.model.service;

import java.util.List;

import kh.com.nr.model.dto.ChatDto;
import kh.com.nr.model.dto.RoomDto;

public interface ChatService {
	public List<ChatDto> getChatListByID(ChatDto dto); //채팅목록 조회
	public int submit(ChatDto dto); //메시지 전송
	public List<ChatDto> chatLoadNewMessage(ChatDto dto); //새로운 메시지 조회
	
	
	public List<RoomDto> getRoomList(); //전체 채팅방 목록 출력
	public int makeRoom(String userID); //채팅방생성
	public List<RoomDto> chatLoadNewRoom(int roomID); //새로운 채팅방 조회

}
