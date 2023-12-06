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
<body style="background-color:#7a9c30;">

<div class="container mt-5">
    <div class="card text-center" style="background-color:#7a9c30; color: #fff;"> <!-- text-center 클래스 추가 -->
        <div class="card-header">
            <h2 class="card-title">${vo.title}</h2>
            <p class="card-subtitle text-muted">
                ${vo.name}   ${vo.writedate}
            </p>
        </div>
        <div class="card-body my-3">
            <!-- 이미지를 보여주는 부분 -->
            <p class="card-text my-5">${fn:replace(vo.content, crlf, "<br>")}</p>
            <c:if test="${not empty vo.filepath}">
                <img src="${vo.filepath}" class="img-fluid my-3" alt="첨부 이미지" style="width: 50% !important;" onclick="openModal('${vo.filepath}')">
            </c:if>
        </div>
    </div>

<c:set var="params" value="curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}"/>
    
    <div class="btn-toolbar gap-2 justify-content-center my-3">
	<button class="btn btn-success" 
			onclick="location='<c:url value="/notice/list?${params}"/>'">돌아가기</button>
	<!-- 로그인한 사용자가 작성한 경우만 수정/삭제 가능 -->
	<c:if test="${loginInfo.role eq 'ADMIN' or loginInfo.role eq 'MANAGER'}">
	<button class="btn btn-success" 
			onclick="location='modify?id=${vo.id}&${params}'">수정</button>
	<button class="btn btn-success"
	  		onclick="if( confirm('내용을 삭제 하시겠습니까?') ){ location='delete?id=${vo.id}&${params}' }" >삭제</button>
	</c:if>
	
</div>
</div>


<jsp:include page="/WEB-INF/views/include/modal_image.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>