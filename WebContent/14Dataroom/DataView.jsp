<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기 - 파라미터로 전달된 게시물의 일련번호
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);

//게시물의 조회수 +1 증가
dao.updateVisitCount(num);

//게시물을 가져와서 DTO객체로 반환
BbsDTO dto = dao.selectView(num);

dao.close();
%>    
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp" />
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>자료실 - <small>View(상세보기)</small></h3>
						
			<div class="row mt-3 mr-1">
				<table class="table table-bordered" border=1 width=800>
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center table-active align-middle">작성자</th>
						<td>${dto.name }</td>
						<th class="text-center table-active align-middle">작성일</th>
						<td>${dto.postdate }</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">다운로드수</th>
						<td>${dto.downcount }</td>
						<th class="text-center table-active align-middle">조회수</th>
						<td>${dto.visitcount }</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">제목</th>
						<td colspan="3">
							${dto.title }
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">내용</th>
						<td colspan="3" class="align-middle" style="height:200px;">
							${dto.content }
						</td>
					</tr>
					 <tr>
						<th class="text-center table-active align-middle">첨부파일</th>
						<td colspan="3">
						
							<!-- 첨부파일이 있는 경우에만 디스플레이 함 -->
							<c:if test="${not empty dto.attachedfile }">
								${dto.attachedfile }
								<a href="./Download?filename=${dto.attachedfile
								 }&idx=${dto.idx}">
								 	[다운로드]
								 </a>
							</c:if>
						</td>
					</tr> 
				</tbody>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col-6">
				
					<!-- 수정, 삭제의 경우 특정 게시물에 대해 수행하는 작업이므로 반드시 
					게시물의 일련번호(PK)가 파라미터로 전달되어야 한다.  -->
					<button type="button" class="btn btn-secondary"
						onclick="location.href='./DataPassword?idx=${param.idx}&mode=edit&nowPage=${param.nowPage }';">수정하기</button>
					<!-- 회원제 게시판에서 삭제 처리는 별도의 폼이 필요없이 사용자에 대한 
					인증처리만 되면 즉시 삭제처리한다.  -->
					<button type="button" class="btn btn-success"
						onclick="location.href='../DataRoom/DataPassword?idx=${dto.idx}&mode=delete&nowPage=${param.nowPage }';">삭제하기</button>
		
				</div>
				<div class="col-6 text-right pr-5">
					<button type="button" class="btn btn-warning" onclick="location.href='./DataList?nowPage=${param.nowPage }';">리스트보기</button>
				</div>
				
				<!-- 
				게시물 삭제의 경우 로그인된 상태이므로 해당 게시물의 일련번호만 서버로 
				전송하면 된다. 이때 hidden폼을 사용하고, JS의 submit()함수를 이용해서 
				폼값을 전송한다. 해당 form태그는 HTML문서 어디든지 위치할 수 있다. 
				 -->
				<form name="deleteFrm">
					<input type="hidden" name="num" value="" />
				</form>

			</div>
		</div>
	</div>
	<jsp:include page="../common/boardBottom.jsp" />
</div>
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>

 -->