<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항</title>

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<c:url value='/css/styles.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    <link href="<c:url value='/css/common.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="<c:url value='/js/common.js'/>?<%=new java.util.Date()%>"></script>
</head>
<body style="background-color:#19c274;">

<div class="container mt-5">
    <form method="post" action="list" class="mb-3">
        <input type="hidden" name="curPage" value="1">
    </form>

    <c:set var="params" value="curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}"/>

    <c:forEach var="vo" items="${page.list}" varStatus="loop">
        <div class="card mb-3 mx-auto" style="max-width: 900px; background-color:#19c274;">
            <div class="row g-0">
                <c:if test="${not empty vo.filepath and not vo.filepath.endsWith('.pdf')}">
                    <div class="col-md-4">
                        <a class="text-link" href="<c:if test="${vo.indent > 0}">reply/</c:if>info?id=${vo.id }&${params}">
                            <img src="${vo.filepath}" class="img-fluid rounded-start" alt="공지 이미지" style="width: 100%;">
                        </a>
                    </div>
                </c:if>
                <div class="col-md-8">
                    <div class="card-body">
                        <a class="text-link" href="<c:if test="${vo.indent > 0}">reply/</c:if>info?id=${vo.id }&${params}" style="text-decoration:none; color: #000">
                            <h4 class="card-title" style="color: #fff;">${vo.title}</h4>
                            <p class="card-text my-5" style="color: #fff;">${vo.content}</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


<jsp:include page="/WEB-INF/views/include/page.jsp"/>
  
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<c:url value='/js/scripts.js'/>"></script>
</body>
</html>



















