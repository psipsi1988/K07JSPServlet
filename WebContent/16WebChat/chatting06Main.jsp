<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting06Main.jsp</title>
</head>
<body>
	<script>
	function chatWin06(){
		var id = document.getElementById("chat_id");
		var room = document.getElementById("chat_room");
		if(id.value==""){
			alert("닉네임을 입력후 채팅창을 열어주세요");
			id.focus();
			return; 
		}
		window.open('chatting06.jsp?chat_id='+id.value+"&chat_room="+room.value, 
				"",
				"width=600,height=800");
		id.value="";
	}
	</script>
	<h2>웹소켓06 - 아이디 + 채팅방UI + 채팅방 적용</h2>
	채팅방 : 
		<select id="chat_room">
			<option value="1번방">1번방</option>
			<option value="2번방">2번방</option>
			<option value="3번방">3번방</option>
			<option value="4번방">4번방</option>
			<option value="5번방">5번방</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	아이디 : <input type="text" id="chat_id" />
	<button type="button" onclick="chatWin06();">채팅창열기</button>
</body>

</html>