<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 관리</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>
	<div class="contaner list">
		<button  class='addbtn' onclick="location='/smartfarm/admin/addprogram'">추가하기</button>
		<table>
			<colgroup><col width="370px"><col width="130px"><col width="130px"><col width="300px"><col width="100px"><col width="100px">
			</colgroup>
			<thead><tr><th>프로그램명</th><th>시작</th><th>종료</th><th>시간</th><th>수정</th><th>삭제</th></tr></thead>
			<tbody>
				<c:if test="${empty programlist}">
					<tr><td colspan="5">상시프로그램 외 다른 프로그램이 존재하지 않습니다.</td></tr>
				</c:if>
				<c:if test="${not empty programlist}">
					<c:forEach var="vo" items="${programlist}">
						<c:if test="${vo.id != 1}">
						<tr><td>${vo.plan_name}</td>
							<td>${vo.plan_start_date }</td>
							<td>${vo.plan_end_date }</td>
							<td>${vo.plan_time_am }<c:if test="${ not empty vo.plan_time_pm}">, ${vo.plan_time_pm }</c:if></td>
							<td><button 
							onclick="location='/smartfarm/admin/programmodify?id=${vo.id}'"
							>click</button></td>
							<td><button 
							onclick="if(confirm('정말 삭제하시겠습니까?')){location='/smartfarm/admin/deleteprogram?id=${vo.id}&adminid=${loginInfo.userid}'}"
							>click</button></td>
						</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		
	</div>
</body>
</html>