<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 관리</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>
	<c:if test="${empty loginInfo}">
		<div class="noadmin">
			<img alt="notEnter" src="/smartfarm/img/notenter.jpg">
			<a style="display: none;" href="https://kr.freepik.com/free-vector/flat-design-do-not-enter-sign_23101533.htm#query=%EA%B8%88%EC%A7%80%20%ED%91%9C%EC%A7%80%ED%8C%90&position=5&from_view=keyword&track=ais&uuid=4dba9b05-3ffb-440c-bd3e-6cc3be8272b8">Freepik</a>
			<p >접근할 수 없는 페이지입니다.</p>
		</div>
	</c:if>
	<div class="contaner">
		<c:if test="${not empty loginInfo}">
		<table>
			<colgroup><col width="150px"><col width="130px"><col width="370px"><col width="100px"><col width="100px">
			</colgroup>
			<thead><tr><th>이름</th><th>아이디</th><th>비밀번호</th><th>수정</th><th>삭제</th></tr></thead>
			<tbody>
				<c:if test="${empty adminList}">
					<tr><td colspan="5">다른 운영자가 존재하지 않습니다.</td></tr>
				</c:if>
				<c:forEach var="vo" items="${adminList}">
					<tr><td>${vo.name}</td>
						<td>${vo.userid }</td>
						<td>${vo.userpw }</td>
						<td><button onclick="location='/smartfarm/admin/modify?userid=${vo.userid}'">click</button></td>
						<td><button onclick="if(confirm('정말 삭제하시겠습니까?')){location='/smartfarm/admin/delete?userid=${vo.userid}'}">click</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="addback">
			<button onclick="location='/smartfarm/admin/plus'">추가하기</button>
			<button onclick="location='/smartfarm'">돌아가기</button>
		</div>
		</c:if>
	</div>
	
</body>
</html>