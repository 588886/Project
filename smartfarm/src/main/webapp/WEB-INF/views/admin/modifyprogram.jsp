<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 정보 수정</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<script src="<c:url value='/js/common.js'/>?<%=new java.util.Date()%>"></script>
</head>
<body>
	<div class="contaner">
		<form method="post" action="programModifyAction">
			<input value="${vo.id }" name="id" type="hidden">
			<table id="registertable">
				<colgroup><col width="200px"><col width="950px">
				</colgroup>
				<tr><th>프로그램명</th>
					<td><div>
							<div class="col-auto">
								<input type="text" value="${vo.plan_name }" name="plan_name"title="이름" autofocus required="required">
							</div>
						</div>
					</td>
				</tr>
				<tr><th>시작일</th>
					<td><div>
							<div class="col-auto">
								<input type="date" value="${vo.plan_start_date }" name="plan_start_date"  title="시작일"  required>
							</div>
						</div>
					</td>
				</tr>
				<tr><th>종료일</th>
					<td><div>
							<div class="col-auto">
								<input type="date"  value="${vo.plan_end_date }" name="plan_end_date" title="종료일" required>
							</div>
						</div>
					</td>
				</tr>
				<tr><th>1부타임</th>
					<td><div>
							<div class="col-auto">
								<input type="text" value="${vo.plan_time_am }" name="plan_time_am" title="1부 시간" autofocus required="required">
							</div>
						</div>
					</td>
				</tr>
				<tr><th>2부타임</th>
					<td><div>
							<div class="col-auto">
								<input type="text"  value="${vo.plan_time_pm }" name="plan_time_pm" title="2부 시간" autofocus >
							</div>
						</div>
					</td>
				</tr>
			</table>
		<div class="addback">
			<button id="program_add">수정하기</button>
			<button onclick=history.go(-1)>돌아가기</button>
		</div>
		</form>
	</div>
</body>
</html>