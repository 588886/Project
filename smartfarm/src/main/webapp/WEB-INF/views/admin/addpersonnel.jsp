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
		<form method="post" action="aplly_insert">
			<table>
				<colgroup><col width="200px"><col width="950px">
				</colgroup>
				<tr><th>프로그램명</th>
					<td><div>
							<select name='plan_id' class='program_option state_option'>
							<option value='-1' >프로그램을 선택해주세요.</option>
							<c:forEach items="${ program_list}" var="vo2">
								<option value='${vo2.id }' >${vo2.plan_name }</option>
							</c:forEach>
						</select>
						</div>
					</td>
				</tr>
				<tr class="display_none input"><th>성명</th>
					<td><div>
							<input type="text" name="name" required>
						</div>
					</td>
				</tr>
				<tr class="display_none input"><th>전화번호</th>
					<td><div>
							<div class="col-auto">
								<input type="text" name="phone" >
							</div>
						</div>
					</td>
				</tr>
				<tr class="display_none input"><th>이메일</th>
					<td><div>
							<div class="col-auto">
								<input type="text" name="email" >
							</div>
						</div>
					</td>
				</tr>
				<tr class="display_none input"><th>신청일자</th>
					<td><div>
							<div class="col-auto">
								<input type="date" name="application_date" id="date" >
							</div>
						</div>
					</td>
				</tr>
				<tr class="display_none"><th>신청시간</th>
					<td><div>
							<div class="applyTime">
							</div>
						</div>
					</td>
				</tr>
				<tr class="display_none input"><th>신청인원</th>
					<td><div>
							<div class="col-auto">
								<select name="headcount" id="headcounts" >
									<option value="0">인원 선택</option>
									<c:forEach begin="1" end="15" var="i">
										<option value=${i }>${i }명</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</td>
				</tr>
			</table>
		<div class="addback">
			<button id="apply_add">추가하기</button>
			<button onclick=history.go(-1)>돌아가기</button>
		</div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="<c:url value='/js/member.js'/>?<%=new java.util.Date() %>"></script>
	<script>
		
		$('.program_option').change(function(){
			var state=$(this).closest('table').find('tr')
			$.ajax({
				url:'program_check',
				data:{id:$(this).val()}
			}).done(function( response ){
				console.log( response)
				var startDate=new Date(response.plan_start_date);
				var endDate=new Date(response.plan_end_date);
				
				startDate.setDate(startDate.getDate()+1);
				startDate=dateFormat(startDate);
				console.log( startDate)
				endDate.setDate(endDate.getDate()+1);
				endDate=dateFormat(endDate);
				
				$('#date').prop("min", startDate);
				$('#date').prop("max", endDate);
				
				var apply = 
					`<input class="form-check-input" type="radio" name="plan_time" checked 
					value=\${response.plan_time_am }>\${response.plan_time_am }
					`;
				if(response.plan_time_pm != null){
					apply+=
						`<input class="form-check-input" type="radio" name="plan_time" 
						value=\${response.plan_time_pm }>\${response.plan_time_pm }
						`;
				}
				
				$('.applyTime').html(apply);
				
				state.removeClass('display_none')
			})
		})
		
		function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day;
		}
		$('#apply_add').click(function(){
			if( $('[name=plan_id]').val()==-1 ){
				alert('프로그램을 선택하세요!');
				$('[name=plan_id]').focus()
				return;
			}
			if( $('[name=name]').val()=='' ){
				alert('이름을 입력하세요!');
				$('[name=name]').focus()
				return;
			}
			if( $('[name=phone]').val()=='' ){
				alert('전화번호를 입력하세요!');
				$('[name=phone]').focus()
				return;
			}
			if( $('[name=email]').val()=='' ){
				alert('이메일을 입력하세요!');
				$('[name=email]').focus()
				return;
			}
			if( $('[name=application_date]').val()=='' ){
				alert('날짜를 선택하세요!');
				$('[name=application_date]').focus()
				return;
			}
			if( $('[name=headcount]').val()==0 ){
				alert('인원을 입력하세요!');
				$('[name=headcount]').focus()
				return;
			}
		})
		
	</script>
</body>
</html>