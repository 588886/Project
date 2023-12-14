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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>한울스마트팜 ${title}</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
    <!-- Css reset-->
    <link href="<c:url value='/css/reset.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
   	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Customized Bootstrap Stylesheet 추가됨 -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	
    <!-- Template Stylesheet -->
    <link href="<c:url value='/css/style.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="<c:url value='/js/common.js'/>?<%=new java.util.Date()%>"></script>
    
    <!-- header,footerCss -->
    <link href="<c:url value='/css/home.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>

<body>
 <div class="l-d-flex" id="wrapper">	
    <!-- Navbar Start -->
    <!-- <header class="navbar navbar-expand-lg navbar-light sticky-top p-0"> -->
    <header class="sticky-top">
        <a href="<c:url value='/'/>" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
          	<img src="<c:url value='/img/hanul.logo.png'/>">
        </a>
        <div class="list-grouping p-2 p-lg-0" id="navbarCollapse">
	        <a href="<c:url value='/'/>" class="${category eq 'ma' ? 'active' : ''} nav-item nav-link">HOME</a>
	        <a href="<c:url value='/about'/>" class="${category eq 'ab' ? 'active' : ''} nav-item nav-link">ABOUT US</a>
	        <a href="<c:url value='/program/list'/>" class="${category eq 'pr' ? 'active' : ''} nav-item nav-link">PROGRAM</a>
	        <a href="<c:url value='/notice/list'/>" class="${category eq 'no' ? 'active' : ''} nav-item nav-link">BOARD</a>
	    
        </div>
    </header>
    <!-- Navbar End -->

    <div>
		<tiles:insertAttribute name="container"/>
    </div>

    <!-- Footer Start -->
    <footer class="mt-5">
    <div class="container-fluid text-light bg-dark py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6 md-none">
                    <h4 class="text-white mb-4"><img alt="logo" src="<c:url value='/img/hanul.logo.png'/>"></h4>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Address</h4>
                    <p><i class="fa fa-map-marker-alt me-3"></i>광주광역시 서구 경열로 3 302호</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Email</h4>
                    <p><i class="fa fa-envelope me-3"></i>hanulsmart0302@gmail.com</p>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Phone</h4>
                    <p><i class="fa-solid fa-phone me-3"></i>010-2869-4100</p>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid copyright py-3">
        <div class="container">
            <div class="row">
                <div class="text-center mb-3 mb-md-0">
					<p>&copy; 2023 by HANULSMARTFARM
					<c:if test="${empty loginInfo}">
						<a href="<c:url value='/admin/login'/>"><img class="admin" alt="admin" src="/smartfarm/img/admin.png"></a>
					</c:if>
					<c:if test="${not empty loginInfo}">
						<c:if test="${loginInfo.role eq 'ADMIN'}">
<%-- 							<a href="<c:url value='/admin/add'/>"><img class="admin" alt="add" src="/smartfarm/img/addAdmin.png"></a> --%>
						</c:if>
<%-- 						<a href="<c:url value='/admin/program'/>"><img class="admin" alt="program" src="/smartfarm/img/memo.png"></a> --%>
						<a href="<c:url value='/admin/admin'/>"><img class="admin" alt="program" src="/smartfarm/img/setting.png"></a>
						<c:if test="${loginInfo.role eq 'ADMIN'}">
<%-- 							<a href="<c:url value='/admin/setting'/>"><img class="admin" alt="setting" src="/smartfarm/img/setting.png"></a> --%>
						</c:if>
						<a href="<c:url value='/admin/logout'/>"><img class="admin" alt="logout" src="/smartfarm/img/logout.png"></a>
					</c:if>
					</p>
                </div>
            </div>
        </div>
    </div>
    </footer>
    
    <!-- Footer End -->
</div>
</body>
</html>
