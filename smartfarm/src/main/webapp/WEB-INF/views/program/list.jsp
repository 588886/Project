<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Core theme CSS (includes Bootstrap) -->
    <link href="<c:url value='/css/styles.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    <link href="<c:url value='/css/common.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" /> -->
    <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> -->
    <!-- <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> -->
    <!-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
    <script src="<c:url value='/js/common.js'/>?<%=new java.util.Date()%>"></script>
</head>

<body id="back">
    <h3 class="my-3 text-center mt-5" style="font-size: 50px; color:#000;"><strong>체험 프로그램</strong></h3>
    <div class="container mt-5">
        <form method="post" action="list" class="mb-3">
            <input type="hidden" name="curPage" value="1">
        </form>

        <c:set var="params" value="curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}" />

        <table class="table mx-auto text-center" style="max-width: 900px; background-color:#95d595;">
            <thead>
                <tr>
                    <th>프로그램명</th>
                    <th>시작 일자</th>
                    <th>종료 일자</th>
                    <th>신청</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${list}">
                    <tr>
                        <td>${vo.plan_name}</td>
                        <td>${vo.plan_start_date}</td>
                        <td>${vo.plan_end_date}</td>
                        <td><a class="btn btn-primary" href="apply?id=${vo.id}">체험신청</a></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
      </div>
    <jsp:include page="/WEB-INF/views/include/page.jsp" />
</body>
</html>
