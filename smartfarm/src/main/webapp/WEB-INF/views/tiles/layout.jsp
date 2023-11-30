<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<c:choose>
	<c:when test="${category eq 'cu'}"><c:set var="title" value="- 고객관리"/></c:when>
	<c:when test="${category eq 'hr'}"><c:set var="title" value="- 사원관리"/></c:when>
	<c:when test="${category eq 'no'}"><c:set var="title" value="- 공지사항"/></c:when>
	<c:when test="${category eq 'bo'}"><c:set var="title" value="- 방명록"/></c:when>
	<c:when test="${category eq 'da'}"><c:set var="title" value="- 공공데이터"/></c:when>
	<c:when test="${category eq 'vi'}"><c:set var="title" value="- 시각화"/></c:when>
	<c:when test="${category eq 'change'}"><c:set var="title" value="- 비밀번호변경"/></c:when>
	<c:when test="${category eq 'join'}"><c:set var="title" value="- 회원가입"/></c:when>
</c:choose>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>한울스마트팜 ${title}</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
    <!-- Css reset-->
    <link href="<c:url value='/css/reset.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    
    <!-- footerCss -->
    <link href="<c:url value='/css/home.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="<c:url value='/js/common.js'/>?<%=new java.util.Date()%>"></script>
</head>
<body>
    <div class="d-flex" id="wrapper">
    	<header>
    		<div >
            	<a href="<c:url value='/'/>">
	            	<img src="<c:url value='/img/hanul.logo.png'/>">
            	</a>
			</div>
			<div class="list-group">
                <a href="<c:url value='/main/show'/>" class="${category eq 'ma' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3 ps-4">HOME</a>
                <a href="<c:url value='/aboutUs/list'/>" class="${category eq 'ab' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3 ps-4">ABOUT US</a>
                <a href="<c:url value='/program'/>" class="${category eq 'se' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3 ps-4">PROGRAM</a>
                <a href="<c:url value='/notice/list'/>" class="${category eq 'no' ? 'active' : ''} list-group-item list-group-item-action list-group-item-light p-3 ps-4">BOARD</a>
            </div>
    	</header>
        
        <!-- Page content wrapper-->
        <div >
            
               <tiles:insertAttribute name="container"/>
            
        </div>
        <!-- footer -->
        <footer>
			<div class="footer_main">
				<div class="footer_main_logo">
					<img alt="logo" src="<c:url value='/img/hanul.logo.png'/>">
				</div>
				<div class="footer_main_text">
					<h2>Address</h2>
					<p>광주광역시 서구 경열로 3 302호</p>
					<h2>Email</h2>
					<p>ex@hmail.net</p>
					<h2>Phone</h2>
					<p>010-2869-4100</p> 
				</div>
			</div>
			<div class=footer_bottom>
				<p>&copy; 2023 by HANULSMARTFARM</p>
			</div>
		</footer>
    </div>
    


    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<c:url value='/js/scripts.js'/>"></script>
</body>
</html>
