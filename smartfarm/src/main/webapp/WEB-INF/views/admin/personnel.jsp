<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청자 관리</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>
<div class="contaner list">
<!-- 	<button class='addbtn'onclick="location='/smartfarm/admin/plus'">추가하기</button> -->
	<table>
		<colgroup><col width="110px"><col width="170px"><col width="220px"><col width="80px"><col width="270px">
				  <col width="120px"><col width="80px"><col width="100px">
		</colgroup>
		<thead><tr><th>이름</th><th>전화번호</th><th>이메일</th><th>인원</th><th>프로그램명</th>
				   <th>신청일</th><th>시간</th><th>상태</th></tr></thead>
		<tbody>
			<c:if test="${empty personnellist}">
				<tr><td colspan="5">프로그램 신청인원이 존재하지 않습니다.</td></tr>
			</c:if>
			<c:forEach var="vo" items="${personnellist}">
				<tr><td>${vo.name}</td>
					<td>${vo.phone }</td>
					<td>${vo.email }</td>
					<td>${vo.headcount }</td>
					<td>${vo.plan_name }</td>
					<td>${vo.application_date}</td>
					<td>${vo.plan_time }</td>
					<td data-code='${vo.state_code }'>
						<select  data-id='${vo.id }' class='state_option
						<c:if test="${vo.state_code eq 0}">state_ready</c:if>
						<c:if test="${vo.state_code eq 1}">state_check</c:if>
						<c:if test="${vo.state_code eq 2}">state_finish</c:if>
						<c:if test="${vo.state_code eq 3}">state_cancell</c:if>
						'>
							<c:forEach items="${ state_list}" var="vo2">
								<option value='${vo2.code }' ${vo.state_code eq vo2.code ? 'selected' : ''}>${vo2.state }</option>
							</c:forEach>
						</select></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<script>
		var previous,previousid;
		
		$('.state_option').focus(function(){
			previous=this.value;
			previousid=$(this).data('id');
		}).change(function(){
			$.ajax({
				url:'state_check',
				data:{id:$(this).data('id') ,state_code:$(this).val()}
			}).done(function( response ){
				if(response ==-1) {
					$(`.state_option[data-id=\${previousid}]`).val(previous).prop("selected", true);
					alert('변경처리가 제대로 이루어지지 않았습니다. \n잠시 후 다시 처리해주시기 바랍니다.')
				}
			})
		})
// 		$('.state_option').change(function(){
// 			$.ajax({
// 				url:'state_check',
// 				data:{id:$(this).closest('td').data('id') ,state_code:$(this).val()}
// 			}).done(function( response ){
// 				if(response ==-1) {
// 					 $(".state_option").val(previous).prop("selected", true);
// 					alert('변경처리가 제대로 이루어지지 않았습니다. \n잠시 후 다시 처리해주시기 바랍니다.')
// 				}
// 			})
		
// 		})
	</script>
</body>
</html>