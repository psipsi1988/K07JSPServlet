<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting06.jsp</title>
<link rel="stylesheet" href="css/wordPingpong.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


window.onload = function(){
    document.getElementById("me").focus();
}

$(document).ready(function(){
	
    
    $("#me").keyup(function(){// 1. #data 공간에서 keyup이라는 이벤트가 발생했을 때
    	
        
        $("#you").text($("#me").val());// 2. #out 공간에 #data의 내용이 출력된다.
        
        // #out의 위치에 text로 데이터를 받는다.(setter)
        // 들어가는 데이터는 #data의 값(.val())이다. (getter)
        // 메서드 괄호 안에 아무것도 없으면 getter, 파라미터가 있으면 setter이다.
    });
});





		document.onkeydown=keycheck; //keycheck 함수 실행
		
		function keycheck(){
        switch(event.keyCode){ //키값에 따라
            // case 13:event.keyCode=''; 
            // alert('다음텍으로이동'); return false; break; //Enter
            // case 27:event.keyCode=''; 
            // alert('닫기함수호출'); return false; break; //ESC
            case 112:event.keyCode='';
                document.getElementById("head").innerHTML = "F1";
                return false; break; //F1

            case 113:event.keyCode='';
                document.getElementById("head").innerHTML = "F2";
                return false; break; //F2

            case 114:event.keyCode='';
                document.getElementById("head").innerHTML = "F3 상용구 출력키";
                return false; break; //F3
            
            case 115:event.keyCode=''; 
                document.getElementById("me").focus();
                document.getElementById("head").innerHTML = "F4";
                F4();
                return false; break; //F4

            case 116:event.keyCode=''; //alert('F5 사용 금지');
                document.getElementById("head").innerHTML = "F5 사용금지";
                return false; break; //F5

            case 117:event.keyCode='';
                document.getElementById("head").innerHTML = "F6";
                return false; break; //F6

            case 118:event.keyCode='';
                document.getElementById("head").innerHTML = "F7";
                return false; break; //F7

            case 119:event.keyCode='';
                document.getElementById("head").innerHTML = "F8 상대방 앞 단어 지우기";
                return false; break; //F8

            case 120:event.keyCode='';
                document.getElementById("head").innerHTML = "F9";
                return false; break; //F9

            case 121:event.keyCode='';
                document.getElementById("head").innerHTML = "F10 상용구 저장키";
                return false; break; //F10
                
            case 122:event.keyCode=''; 
                document.getElementById("head").innerHTML = "F11 풀화면 사용금지";
                return false; break; //11
            

           // case 123:event.keyCode='';
	        //    document.getElementById("head").innerHTML = "F12 사용금지";
	         //   return false; break; //12

            // case 93:event.keyCode='';
            //     return false; break;//메뉴키

            // case 16:event.keyCode='';keydownShift=1;
            //     return false; break;//쉬프트키

            // case 17:event.keyCode='';keydownCtrl=1;
            //     return false; break;//컨트롤키

            // case 8:event.keyCode='';
            //     return false; break;//백스페이스

            case 45:event.keyCode=''; insert(); me.value = "";
           		document.getElementById("head").innerHTML = "인서트";
                return false; break;// 인서트
	      }
        	//you.scrollTop = you.scrollHeight; //스크롤 하단 고정
	      if(keydownCtrl) return false;
		}//function keycheck()

		
        function F4(){ 
            var text1 = me.value;
            var text2 = text1.replace(/ +/g, " ");//여러 개 공백 하나로 
            console.log("text2="+text2)
            //var i = document.getElementById("me");
            var text3=text2.replace(/\s$/gi, "");//문자열 맨 뒤의 공백만 제거
            var text = text3.split(" ");
            var str = "";
            console.log(text.length);
            for(var i= 0; i<(text.length-1); i++){
                console.log(text[i]);
                    str+=text[i] + " ";
            }
            me.value = str;
        
        }
        function F8(){

        }

        function insert(){
            show.value = show.value + me.value.replace(/ +/g, " ");//띄어쓰기는 1번으로
        }

var messageWindow;
var inputMessage;
var chat_id, chat_room;//채팅아이디, 채팅방 전역변수 선언
var webSocket;

var meWindow;
var youWindow;







window.onload = function(){
	messageWindow = document.getElementById("chat-container");

	messageWindow.scrollTop = messageWindow.scrollHeight;

	inputMessage = document.getElementById('inputMessage');

	chat_id = document.getElementById('chat_id').value;
	chat_room = document.getElementById('chat_room').value;

	
	webSocket = new WebSocket("ws://localhost:8282/K07JSPServlet/WPServer");

	webSocket.onopen = function(event){
		wsOpen(event);
	};

	//메시지가 전송될 때 
	webSocket.onmessage = function(event){
		wsMessage(event);
	};


	//웹소켓이 닫혔을 때 
	webSocket.onclose = function(event){
		wsClose(event);
	};
	
	//에러가 발생했을 때 
	webSocket.onerror = function(event){
		wsError(event);
	};
	
	
	//실시간 전송하기 
	webSocket.livemessage = function(event){
		wsMessage(event);
	};
	
	
	
	
	
	
	
}//window.onload = function()





	function wsOpen(event){
		messageWindow.value += "연결성공\n";
	}


	//서버로부터 Echo된 메시지를 클라이언트에서 출력
	function wsMessage(event){
		
		//메시지 내용을 파이프로 split해서 배열로 만든다. 
		var message = event.data.split("|");
		
		var room = message[0];//0번방 : 룸정보
		var sender = message[1];//1번방 : 아이디(대화명)
		var content = message[2];//2번방 : 메시지
		var msg;

		if (content ==""){
			//날아온 내용이 없으므로 아무것도 하지 않는다. 
		}
		else{
			//같은 룸에 있는 클라이언트에게만 메시지를 디스플레이한다
			if(chat_room==room){
				//내용에 /가 있다면 귓속말이므로 
				if(content.match("/")){
					
					//해당 아이디(닉네임)에게만 디스플레이한다. 
					if(content.match(("/"+chat_id))){
						var temp = content.replace(("/"+chat_id), "[귓속말]:");
						msg = makeBalloon(sender, temp);
						messageWindow.innerHTML += msg;
						messageWindow.scrollTop = messageWindow.scrollHeight;
					}
				}
				else{
					//귓속말이 아니면 모두에게 디스플레이한다. 
					msg = makeBalloon(sender, content);
					messageWindow.innerHTML += msg;
					messageWindow.scrollTop = messageWindow.scrollHeight;
				}
			}
		}
	}
	
	
/* 	//실시간 ////////서버로부터 Echo된 메시지를 클라이언트에서 출력
	function liveMessage(event){
		
		//메시지 내용을 파이프로 split해서 배열로 만든다. 
		var message = event.data.split("|");
		
		var room = message[0];//0번방 : 룸정보
		var sender = message[1];//1번방 : 아이디(대화명)
		var content = message[2];//2번방 : 메시지
		var msg;

		if (content ==""){
			//날아온 내용이 없으므로 아무것도 하지 않는다. 
		}
		else{
			//같은 룸에 있는 클라이언트에게만 메시지를 디스플레이한다
			if(chat_room==room){
					msg = makeBalloon(sender, content);
					messageWindow.innerHTML += msg;
					messageWindow.scrollTop = messageWindow.scrollHeight;
				
			}
		}
	}
	 */
	
	
	
	function makeBalloon(id, cont){
		

		
		var msg = '';
		msg += '<div class="chat chat-left">';
		msg += 		'<!-- 프로필 이미지-->';
		msg += 		'<span class="profile profile-img-b"></span>';
		msg += 		'<div class="chat-box">';
		msg += 	'		<p style="font-weight: bold; font-size: 1.1em; margin-bottom: 5px;">'+id+'</p>';
		msg += 			'<p class="bubble">'+cont+ '</p>';
		msg += '		<span class="bubble-tail"></span>';
		msg += '	</div>';
		msg += '</div>';
		return msg;
	}



	function wsClose(event){
		messageWindow.value += "연결끊기성공\n";
	}
	
	
	function wsError(event){
		alert(event.data);
	}

	
	
	
	
	
	//웹소켓서버에 메시지를 보낸다. 
	function sendMessage(){
		
	
		
		//메시지 입력 후 전송할 때 '채팅방+아이디+메시지" 형태로 조립해서 보낸다. 
		webSocket.send(chat_room+'|'+chat_id+'|'+inputMessage.value);

		var msg = '';
		msg += '<div class="chat chat-right">';
		msg += '	<!-- 프로필 이미지-->';
		msg += '	<span class="profile profile-img-a"></span>';
		msg += '	<div class="chat-box">';
		msg += '	<p class="bubble-me">'+inputMessage.value+ '</p>';
		msg += '		<span class="bubble-tail"></span>';
		msg += '	</div>';
		msg += '</div>';

		messageWindow.innerHTML += msg; //msg 합친 값을 innerHTML 값으로 설정. (+=으로 기존 메시지 유지)
		inputMessage.value = ""; //인풋메시지 값 없애기

		messageWindow.scrollTop = messageWindow.scrollHeight; //스크롤 하단 유지
	}
	
</script>

</head>




<body>


<div id="chat-wrapper">
	<header id="chat-header">
		<h1>WordPingpong</h1> <span id="head"> 알림창 </span>
		
	</header>		
	<input type="hid-den" id="chat_room" value="${param.chat_room }" style="border:1px dotted red;" />
	<input type="hid-den" id="chat_id" value="${param.chat_id }" style="border:1px dotted red;" />
	
	
	
 <table class = "box" border="1" >
    <tr>
        <td> 
            <textarea id="me" cols="50"  rows="10" 
            ></textarea>
            
            <br/>
            <span id="keySpan" style="color: blue; font-size: 1.5em;"></span>
        </td>
        <td rowspan="2" >
            <textarea name="show" id="show" rowspan="2" cols="30" rows="10"></textarea>
            </td>
    </tr>
    <tr>
        <td>
            <textarea id="you" ></textarea>

         </td>
    </tr>
</table>
	
	
	
	
	<div id="chat-container" class="chat-area" style="height:300px;overflow:auto;">
	
	<!-- 
	<div id="me-chat-container" class="me-chat-container" >
	<div id="you-chat-container" class="me-chat-container" >
	 -->
	</div>
	<footer id="chat-footer">		
		<p class="text-area">
			<input type="text" id="inputMessage" 
				style="width:450px; height:60px; font-size:1.5em; border:0px; 
				  "onkeydown="javascript: if (event.keyCode == 13) {sendMessage();}"/>
			<button type="button" onclick="sendMessage();">보내기</button>
		</p>
	</footer>
</div>
</body>

</html>