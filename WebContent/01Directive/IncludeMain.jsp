<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
	include 지시어 : 공통으로 사용할 jsp파일을 생성한 후
		현재 문서에 포함시킬 때 사용한다. 
		각각의 jsp파일 상단에는 반드시  page 지시어(Directive)가 
		삽입되어야 한다.
		※단, 하나의 jsp파일에는 page 지시어가 중복되어서는 안 된다.  
--%>

<%@ include file = "IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain.jsp</title>
<!-- CSS코드는 양이 많으므로 외부파일로 선언하여 현재 문서에 링크시킨다.  -->
<link rel="stylesheet" href="./css/div_layout.css" />
</head>


<body>
	<div class="Allwrap">
		<div class="header">
			<!--  GNB(Global Navigation Bar)영역 전체 공통 메뉴-->
			<%@ include file="../common/Top.jsp" %>
		</div>
		<div class="body">
			<div class="left_menu">
				<!-- LNB영역(Local Navigation Bar) 로컬 메뉴-->
				<%@ include file="../common/Left.jsp" %>
			</div>
			<div class="contents">
				<!-- Contents 영역 -->
				<%--
					해당 변수는 외부파일에 선언하여 본 문서에 include처리되었다. 
					include는 문서 자체를 포함시키는 개념이므로 에러 없이  사용할 수 있다. 
				 --%>
				<h2>오늘의 날짜 : <%=todayStr %></h2>
				<br/><br/>
				서울시는 27일 오전 10시 기준 누적 확진자는 전날과 같은 629명이라고 밝혔다. 전일 0시 기준 대비 추가 확진자는 나오지 않았다.

퇴원 수는 393명이다. 누적 확진자의 62.4%를 차지한다. 격리자는 234명이다. 검사자는 11만1108명이다. 5589명이 검사 결과를 기다리고 있다.

주요 발생 원인은 해외 접촉 관련이 250명으로 가장 많다. 전체 누계 확진자의 39.7%를 차지한다. 이는 해외입국자 본인만 취합한 숫자로, 이들의 가족과 지인 등 접촉 확진자는 기타로 분류돼 있다.

이 밖에 구로구 콜센터 관련 98명, 구로구 만민중앙교회 41명, 동대문 교회·PC방 20명, 동대문구 요양보호사 관련 8명, 은평성모병원 관련 14명, 성동구 주상복합아파트 관련 13명, 종로구 명륜교회·노인복지회관 10명, 대구 방문 11명, 신천지 교회 3명, 타시도 확진자 접촉자 28명, 기타 133명 등이다.

자치구별로 보면 강남구가 62명으로 가장 많고, 관악구 42명, 송파구 37명, 서초구 37명, 구로구 35명, 동대문구 31명, 동작구 31명 순으로 30명 선을 넘겼다.

강남구 논현동 안다즈서울강남호텔 직원 발병과 관련해 서울시는 직원 등 호텔 관련 접촉자 146명 가운데 현재 110명에 대해 검사한 결과, 모두 음성이라고 밝혔다.
				<br/><br/>
			</div>
		</div>
		<div class="copyright">
		<!-- Copyright -->
			<%@ include file="../common/Copyright.jsp" %>
		</div>
	</div>
</body>
</html>











