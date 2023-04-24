package kh.com.nr.controller;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.com.nr.model.dto.ChatDto;
import kh.com.nr.model.dto.RoomDto;
import kh.com.nr.model.service.ChatService;

@Controller
@RequestMapping("/chat")
@CrossOrigin(origins = "*")
public class ChatController {
	@Autowired
	private ChatService cservice;
	
	// 채팅 목록 조회
	@GetMapping("/{fromID}/{toID}")
	@ResponseBody
	public List<ChatDto> getChatListByID(ModelAndView mv, @PathVariable("fromID") String fromID, @PathVariable("toID") String toID){
		ChatDto dto = new ChatDto();
		dto.setFromID(fromID);
		dto.setToID(toID);
		List<ChatDto> cList = cservice.getChatListByID(dto);
		return cList;
	}
	
	// 새로운 메시지 조회
	@GetMapping("/{lastID}/{fromID}/{toID}")
	@ResponseBody
	public List<ChatDto>chatLoadNewMessage(@PathVariable("lastID") int chatID, @PathVariable("fromID") String fromID, @PathVariable("toID") String toID){
		List<ChatDto> newList = new ArrayList<ChatDto>();
		
		ChatDto dto = new ChatDto();
		dto.setChatID(chatID);
		dto.setFromID(fromID);
		dto.setToID(toID);
		newList = cservice.chatLoadNewMessage(dto);
		return newList;
	}
		
	// 채팅 전송
	@PostMapping("")
	@ResponseBody
	public int submit(@RequestBody ChatDto dto){
		int result = cservice.submit(dto);
		
		//관리자 채팅방 생성
		if(!(dto.getFromID().equals("admin"))) { //관리자(admin)가 보내는 메시지는 채팅방 생성x
			cservice.makeRoom(dto.getFromID());
		}
		return result;
	}
	
	// <------------------------------------관리자용-------------------------------------->
	//전체 채팅방 리스트 조회
	@GetMapping("")
	@ResponseBody
	public List<RoomDto> getRoomList(){
		System.out.println("=============전체 채팅방 조회");
		List<RoomDto> rList = cservice.getRoomList();
		return rList;
	}
	
	
	// 새로운 채팅방 조회
	@GetMapping("/{lastRoomID}")
	@ResponseBody
	public List<RoomDto> chatLoadNewRoom(@PathVariable("lastRoomID") int lastRoomID){
		List<RoomDto> newRoomList = new ArrayList<RoomDto>();
		newRoomList = cservice.chatLoadNewRoom(lastRoomID);
		return newRoomList;
	}
}
