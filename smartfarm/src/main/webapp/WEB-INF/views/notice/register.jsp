<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/css/styles.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<link href="<c:url value='/css/common.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />


</head>
<body>
<h3 class="my-4 text-center">공지사항 작성</h3>

<form method="post" enctype="multipart/form-data" action="register">
<table class="table tb-row">
<colgroup><col width="180px"><col></colgroup>
<tr><th>제목</th>
	<td><input type="text" autofocus class="form-control check-empty" name="title" title="제목"></td>
</tr>
<tr><th>내용</th>
	<td><textarea name="content" class="form-control check-empty" title="내용"></textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td><div>
			<label>
				<input type="file" name="file" id="file-multiple" multiple>
				<i role="button" class="fs-3 fa-solid fa-file-circle-plus"></i>
			</label>
		</div>
		
		<div class="form-control py-2 mt-2 file-drag">
			<div class="py-3 text-center">첨부할 파일을 마우스로 끌어 오세요</div>
		</div>
	</td>
</tr>
</table>
<input type="hidden" name="writer" value="${loginInfo.userid}">
</form>

<div class="btn-toolbar gap-2 justify-content-center my-3">
	<button class="btn btn-success" id="btn-save">저장</button>
	<button class="btn btn-success" id="btn-cancel">취소</button>
</div>

<script>
var fileList = new FileList();

$(function(){

})





$('#btn-cancel').on('click', function(){
	history.go(-1)	
})

$('#btn-save').click(function(){
	if( emptyCheck() ){
		multipleFileUpload();
		$('form').submit()
	}
})

</script>
</body>
</html>