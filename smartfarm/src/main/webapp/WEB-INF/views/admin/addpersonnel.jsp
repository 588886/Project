<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 추가</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
</head>
<body>
	<div class="contaner">
		<form method="post" action="programinsert">
			<table>
				<colgroup><col width="200px"><col>
				</colgroup>
				<tr><th>프로그램명</th>
					<td><div>
							<select  class='state_option'>
							<c:forEach items="${ program_list}" var="vo2">
								<option value='${vo2.id }' >${vo2.plan_name }</option>
							</c:forEach>
						</select>
						</div>
					</td>
				</tr>
				<tr><th>성명</th>
					<td><div>
							<div class="col-auto">
								<input type="text" name="name" class="form-control" autofocus >
							</div>
						</div>
					</td>
				</tr>
				<tr><th>이메일</th>
					<td><div>
							<div class="col-auto">
								<input type="text" name="email" class="form-control check-item" title="이메일">
							</div>
						</div>
					</td>
				</tr>
				<tr><th>신청일자</th>
					<td><div>
							<div class="col-auto">
								<input type="date" name="application_date" class="date form-control" >
							</div>
						</div>
					</td>
				</tr>
				<tr><th>2부타임</th>
					<td><div>
							<div class="col-auto">
								<input type="text"  placeholder="00:00" name="plan_time_pm" title="2부 시간" autofocus >
							</div>
						</div>
					</td>
				</tr>
			</table>
		<div class="addback">
			<button id="program_add">추가하기</button>
			<button onclick=history.go(-1)>돌아가기</button>
		</div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="<c:url value='/js/member.js'/>?<%=new java.util.Date() %>"></script>
	<script>
		$('#program_add').click(function(){
			if( $('[name=plan_name]').val()=='' ){
				alert('프로그램명을 입력하세요!');
				$('[name=plan_name]').focus()
			}
			if( $('[name=plan_start_date]').val()=='' ){
				alert('시작일을 입력하세요!');
				$('[name=plan_start_date]').focus()
			}
			if( $('[name=plan_end_date]').val()=='' ){
				alert('종료일을 입력하세요!');
				$('[name=plan_end_date]').focus()
			}
			if( $('[name=plan_time_am]').val()=='' ){
				alert('종료일을 입력하세요!');
				$('[name=plan_time_am]').focus()
			}
		})
		
	</script>
</body>
</html>