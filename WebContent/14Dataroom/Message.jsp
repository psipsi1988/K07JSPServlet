<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- Message.jsp --%>
<c:choose>
	<c:when test="${WHEREIS=='UPDATE' }">
		<c:set var="sucmsg" value="수정 성공함" />
		<c:set var="failmsg" value="수정 실패함" />
		<c:set var="sucurl" 
		value="/DataRoom/DataView?idx=${idx}&nowPage=${nowPage}" />
	</c:when>
	<c:otherwise>
		<c:set var="sucmsg" value="삭제 성공함" />
		<c:set var="failmsg" value="삭제 실패함" />
		<c:set var="sucurl" 
			value="/DataRoom/DataList?nowPage=${nowPage }" />	
	</c:otherwise>
</c:choose>

<%--
	수정을 성공하는 경우 상세보기 페이지로 돌아가고 
	삭제를 성공하는 경우에는 리스트 페이지로 로케이션된다. 
 --%>
<script>
<c:choose>
	<c:when test="${SUC_FAIL==1 }">
		alert("${sucmsg }");
		location.href="<c:url value='${sucurl }' />";
	</c:when>
	<c:when test="${SUC_FAIL==0 }">
		alert("${failmsg }");
		history.back();
	</c:when>
	<c:otherwise>
		alert('파일용량을 초과했습니다');
		history.back();
	</c:otherwise>
</c:choose>
</script>
