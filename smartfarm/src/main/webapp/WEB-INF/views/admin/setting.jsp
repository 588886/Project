<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사정보 수정</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>
	<div class="contaner">
		<form method="post" action="campanyModify">
			<table id="settingtable">
				<colgroup><col width="200px"><col width="650px">
				</colgroup>
				<tr><th>회사명</th>
					<td><div>
							<input type="text" name="name" title="이름" value="${vo.name }">
						</div>
					</td>
				</tr>
				<tr><th>주소</th>
					<td><div class="inputid">
							<input type="text" name="name" title="이름" value="${vo.adress }">
							<button type="button" id="btn-adress">
								주소찾기
							</button>
						</div>
					</td>
				</tr>
				
			</table>
		
		</form>
		<div class="addback">
			<button id="btn-save">수정하기</button>
			<button onclick="location='/smartfarm'">돌아가기</button>
		</div>
	</div>
</body>
</html>