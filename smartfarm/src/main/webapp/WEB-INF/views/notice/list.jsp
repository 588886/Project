<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<c:url value='/css/styles.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    <link href="<c:url value='/css/common.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="<c:url value='/js/common.js'/>?<%=new java.util.Date()%>"></script>
</head>
<body id="back">
<h3 class="my-3 text-center mt-5" style="font-size: 50px; color:#000;" ><strong>공지사항</strong></h3>
<div class="container mt-5">
    <form method="post" action="list" class="mb-3">
        <input type="hidden" name="curPage" value="1">
    </form>

    <c:set var="params" value="curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}"/>

    <c:forEach var="vo" items="${page.list}">
    <div class="card mb-3 mx-auto" style="max-width: 900px; background-color:#95d595;">
        <div class="row g-0">
            <c:set var="imageDisplayed" value="false" />
            <c:forEach var="file" items="${vo.files}">
                <c:if test="${not empty file.filepath and not imageDisplayed}">
                    <div class="col-md-4">
                        <a class="text-link" href="<c:if test="${vo.indent > 0}"></c:if>info?id=${vo.id }&${params}">
                            <img src="${file.filepath}" class="img-fluid rounded-start custom-img d-block" alt="공지 이미지" style="width: 100%;">
                        </a>
                        <c:set var="imageDisplayed" value="true" />
                    </div>
                </c:if>
            </c:forEach>
            <div class="col-md-8">
                <div class="card-body">
                    <a class="text-link" href="<c:if test="${vo.indent > 0}"></c:if>info?id=${vo.id }&${params}" style="text-decoration:none; color: #000">
                        <strong class="card-title" style="font-size:30px;">${vo.title}</strong>
                        <p class="card-text my-5">${vo.content}</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

    <!-- 관리자로 로그인되어 있는 경우만 새글쓰기 가능 -->
	<c:if test="${loginInfo.role eq 'ADMIN' or loginInfo.role eq 'MANAGER'}">
		<div class="col-auto text-center">
			<a class="btn btn-success" href="new">새글쓰기</a>
		</div>
	</c:if>
</div>
<jsp:include page="/WEB-INF/views/include/page.jsp"/>


</body>
</html>



















