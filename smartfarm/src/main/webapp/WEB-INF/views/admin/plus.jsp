<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 추가</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>
	<div class="contaner">
		<table>
			<colgroup><col width="150px"><col width="130px"><col width="370px">
			</colgroup>
			<thead><tr><th>이름</th><th>아이디</th><th>비밀번호</th></thead>
			<tbody>
				
				<tr><td>이름?</td>
					<td>아이디?</td>
					<td>비밀번호?</td>
				</tr>
				
			</tbody>
		</table>
		
		<div class="addback">
			<button onclick="location='/smartfarm/admin/plus'">추가하기</button>
			<button onclick="location='/smartfarm'">돌아가기</button>
		</div>
		
	</div>
</body>
</html>