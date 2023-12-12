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
<body id="back">

<div class="container mt-5">
    <div class="card text-center" style="background-color:#95d595; color: #60635a;">
        <div class="card-header">
            <strong class="card-title" style="font-size:30px; color:#000;">${vo.title}</strong>
            <p class="card-subtitle" style="color:#000;">
                <br>${vo.name}   ${vo.writedate}
            </p>
        </div>
        <div class="card-body my-3">
            <!-- 내용을 먼저 표시 -->
            <p class="card-text my-5" id="text-page" style="color:#000;">${fn:replace(vo.content, crlf, "<br>")}</p>
            <!-- 이미지를 보여주는 부분 -->
            <c:forEach var="file" items="${vo.files}">
                <c:if test="${not empty file.filepath}">
                    <img src="${file.filepath}" class="img-fluid my-3 custom-img2 mt-5" alt="첨부 이미지">
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<c:set var="params" value="curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}"/>
    
    <div class="btn-toolbar gap-2 justify-content-center my-3">
	<!-- 로그인한 사용자가 작성한 경우만 수정/삭제 가능 -->
	<c:if test="${loginInfo.role eq 'ADMIN' or loginInfo.role eq 'MANAGER'}">
	<button class="btn btn-success" 
			onclick="location='modify?id=${vo.id}&${params}'">수정</button>
	<button class="btn btn-success"
	  		onclick="if( confirm('내용을 삭제 하시겠습니까?') ){ location='delete?id=${vo.id}&${params}' }" >삭제</button>
	</c:if>
	<button class="btn btn-success" 
			onclick="location='<c:url value="/notice/list?${params}"/>'">목록으로</button>
	
</div>



<jsp:include page="/WEB-INF/views/include/modal_image.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // vo.content에서 http 또는 https를 찾아서 링크로 변환
        var contentElement = document.getElementById("text-page"); // yourContentId를 실제로 사용하는 ID로 변경
        var content = contentElement.innerHTML;

        // 정규식을 사용하여 http 또는 https를 찾아서 링크로 변환
        var convertedContent = content.replace(/(https?:\/\/\S+)/g, '<a href="$1">$1</a>');

        // 변환된 내용을 적용
        contentElement.innerHTML = convertedContent;
    });
</script>
</body>
</html>