<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운영자 정보 수정</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<script src="<c:url value='/js/common.js'/>?<%=new java.util.Date()%>"></script>
</head>
<body>
	<div class="contaner">
		<form method="post" action="adminmodify">
			<input type="hidden" name ='userid' value="${vo.userid }">
			<table>
				<colgroup><col width="200px"><col width="650px">
				</colgroup>
				<tr><th>이름</th>
					<td><div>
							<input type="text" name="name" class="modify-form" title="이름" value="${vo.name }">
						</div>
					</td>
				</tr>
				<tr><th>아이디</th>
					<td><div>
							<p class="">${vo.userid }</p>
						</div>
					</td>
				</tr>
				<tr><th>비밀번호</th>
					<td><div>
							<div class="col-auto">
								<input type="text" name="userpw" class="modify-form" title="비밀번호" value='${vo.userpw }'>
							</div>
						</div>
					</td>
				</tr>
			</table>
		
		</form>
		<div class="addback">
			<button id="btn-save">수정하기</button>
			<button onclick=history.go(-1)>돌아가기</button>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script>

		$('#btn-save').click(function(){
			if( $('[name=name]').val()=='' ){
				alert('이름을 입력하세요!');
				$('[name=name]').focus()
			}else if( $('[name=userpw]').val()=='' ){
				alert('비밀번호를 입력하세요!');
				$('[name=userpw]').focus()
			}else{
				$('form').submit()
			}
		})
	
	</script>
</body>
</html>