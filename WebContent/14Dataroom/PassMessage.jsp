<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%-- PassMessage.jsp --%>
<%--
	패스워드 검증을 마친 후 결과에 따라 alert() 메시지를 띄워주고 
	mode 값에 따라서 수정 혹은 삭제 페이지로 이동한다. 
		-> edit : 수정 페이지로 이동한다. 
		-> delete  : 이 경우에는 즉시 삭제처리한다. 삭제는 이미 앞에서 
			패스워드 검증을 마친 훈련현재 페이지로 진입하므로 추가적인 확인은 필요없다. 
 --%>
<c:choose>
	<c:when test="${param.mode=='edit' }">
		<c:set var="moveUrl" value="/DataRoom/DataEdit?idx=${param.idx 
		}&nowPage=${requestScope.nowPage }" />
	</c:when>
	<c:otherwise>
		<c:set var="moveUrl" value="/DataRoom/DataDelete?idx=${param.idx 
		}&nowPage=${nowPage }" />
	</c:otherwise>
</c:choose>
<script>
<c:choose>
	<c:when test="${PASS_CORRECT }">
		alert("패스워드 검증완료");
		location.href="<c:url value='${moveUrl}' />";
	</c:when>
	<c:otherwise>
		alert("패스워드 검증 실패. 뒤로 이동");
		history.back();
	</c:otherwise>
</c:choose>

</script>