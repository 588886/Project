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
	<div class="contaner">
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
		
	</div>
	
</body>
</html>