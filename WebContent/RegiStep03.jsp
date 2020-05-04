<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegiStep03.jsp</title>
    <style>

        .button{
            border-color: black; background-color: white;
     
        }
        .button:hover{
            background-color: #e5e5e5;
        }
    </style>
</head>
<body>
 <%
    //한글 깨짐 방지
    request.setCharacterEncoding("UTF-8");
 
 
 String id = request.getParameter("id");
 String pwd = request.getParameter("pwd");
 String email = request.getParameter("email");
 String gender = request.getParameter("gender");
 
 %>
 <script>
	 function finish(){
	 	alert("<%=id %>님 가입이 완료되었습니다.");
	 	window.location = 'http://www.ikosmo.co.kr/';
	 	return;
	 }
 </script>

 	
 	        <table border="1" cellspacing="0" cellpadding="5">
 	         <tr>
                <td colspan="2"  >3단계 : 회원가입 완료</td>
            </tr>
            <tr>
                <td>아이디</td>
                <td>
                    <%=id %>
                </td>
            </tr>
            <tr>
                <td>패스워드</td>
                <td>
                    <%=pwd %>
                </td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                   <%=email %>
                </td>
            </tr>
            
            <tr>
                <td>성별</td>
                <td>
                    <%=gender %>
                </td>
            </tr>

            <tr>
                <td>

                </td>
                <td >
                    <input type="button" class="button" onclick="history.back();" value="이전"/>
                    &nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="확인" onclick="finish();"/>
                </td>
                
            </tr>
            </table>
</body>
</html>