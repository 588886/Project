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
<body style="background-color:#19c274;">

<div class="container mt-5">
    <div class="card text-center" style="background-color:#19c274; color: #fff;"> <!-- text-center 클래스 추가 -->
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
        <button class="btn btn-success" onclick="location='<c:url value="/notice/list?${params}"/>'">목록으로</button>
    </div>
</div>



<jsp:include page="/WEB-INF/views/include/modal_image.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- 모달 스크립트 추가 -->
<script>
    function openModal(imagePath) {
        // 모달 열기
        var myModal = new bootstrap.Modal(document.getElementById('modal-image'));
        myModal.show();

        // 모달 내부 이미지 설정
        var modalBody = document.querySelector('#modal-image .modal-body');
        modalBody.innerHTML = '<img src="' + imagePath + '" class="img-fluid" alt="모달 이미지" style="width: 100%;">';
    }
</script>


</body>
</html>