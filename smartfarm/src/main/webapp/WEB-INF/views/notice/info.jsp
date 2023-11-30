<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항</title>
    <link href="<c:url value='/css/styles.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    <link href="<c:url value='/css/common.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>

<div class="container mt-5">
    <div class="card text-center"> <!-- text-center 클래스 추가 -->
        <div class="card-header">
            <h2 class="card-title">${vo.title}</h2>
            <p class="card-subtitle text-muted">
                ${vo.name}   ${vo.writedate}
            </p>
        </div>
        <div class="card-body">
            <!-- 이미지를 보여주는 부분 -->
            <p class="card-text">${fn:replace(vo.content, crlf, "<br>")}</p>
            <img src="${vo.filepath}" class="img-fluid" alt="첨부 이미지" style="max-width: 100%;">
        </div>
    </div>

    <div class="btn-toolbar gap-2 justify-content-center my-3">
        <button class="btn btn-primary" onclick="location='<c:url value="/notice/list?${params}"/>'">목록으로</button>
    </div>
</div>



<jsp:include page="/WEB-INF/views/include/modal_image.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
//첨부파일 다운로드
$('.file-download').click(function(){
	location = "download?id=${vo.id}";
})

$(function(){
    if( isImage("${vo.filename}") ){
        $('.file-name').after("<span class='file-preview'><img src='${vo.filepath}'></span>")
    }

    $('.file-preview img').click(function(){
        if( $('#modal-image').length==1 ){
            $('#modal-image .modal-body').html( $(this).clone() )
            new bootstrap.Modal( $('#modal-image') ).show()
        }
    })
    
})

//모달이미지 배경클릭시 이미지 삭제
$('#modal-image').click(function(){
	if( ! $(this).hasClass("show") ) 
		$('#modal-image .modal-body').empty()
})
</script>


</body>
</html>