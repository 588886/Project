<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="<c:url value='/css/reset.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
<c:if test="${empty loginInfo}">
	<div class="noadmin">
		<img alt="notEnter" src="/smartfarm/img/notenter.jpg">
		<a style="display: none;" href="https://kr.freepik.com/free-vector/flat-design-do-not-enter-sign_23101533.htm#query=%EA%B8%88%EC%A7%80%20%ED%91%9C%EC%A7%80%ED%8C%90&position=5&from_view=keyword&track=ais&uuid=4dba9b05-3ffb-440c-bd3e-6cc3be8272b8">Freepik</a>
		<p >접근할 수 없는 페이지입니다.</p>
	</div>
</c:if>
<c:if test="${not empty loginInfo}">
	<div class="admin-contaner">
		<div class='menu'>
			<div class='profile'>
				<div class='content'>
					<c:if test="${loginInfo.role eq 'ADMIN'}">
						<img alt="boss" src="/smartfarm/img/boss.png">
					</c:if>
					<c:if test="${loginInfo.role eq 'MANAGER'}">
						<img alt="manager" src="/smartfarm/img/manager.png">
					</c:if>
					<p>${loginInfo.name} 님</p>
				</div>
			</div>
			<a href="<c:url value='/admin/admin'/>">
				<div class='slot <c:if test="${programname eq '프로그램 관리'}"> select</c:if>
								 <c:if test="${programname eq '프로그램 정보 수정'}"> select</c:if>
								 <c:if test="${programname eq '프로그램 추가'}"> select</c:if>	'>
					<div class='content'>
						<img alt="manager" src="/smartfarm/img/memo.png">
						<p>프로그램관리</p>
					</div>
				</div>
			</a>
			<a href="<c:url value='/admin/personnel'/>">
				<div class='slot <c:if test="${programname eq '신청인원 관리'}"> select</c:if>
									<c:if test="${programname eq '신청인원 추가'}"> select</c:if>'>
					<div class='content'>
						<img alt="manager" src="/smartfarm/img/guide.png">
						<p>신청인원 관리</p>
					</div>
				</div>
			</a>
			<c:if test="${loginInfo.role eq 'ADMIN'}">
				<a href="<c:url value='/admin/add'/>">
					<div class='slot <c:if test="${programname eq '운영자 관리'}"> select</c:if>
									 <c:if test="${programname eq '운영자 추가'}"> select</c:if>
									 <c:if test="${programname eq '운영자 정보 수정'}"> select</c:if>'>
						<div class='content'>
							<img alt="add" src="/smartfarm/img/addAdmin.png">
							<p>운영자 관리</p>
						</div>
					</div>
				</a>
				<a href="<c:url value='/admin/setting'/>">
					<div class='slot <c:if test="${programname eq '주소변경'}"> select</c:if>'>
						<div class='content'>
							<img alt="address" src="/smartfarm/img/address.png">
							<p>주소변경</p>
						</div>
					</div>
				</a>
			</c:if>
		</div>
		<div class='workpage'>
			<div class='head'>
					<p>${programname }</p>
				<div>
					<img class='gohome'alt="logout" src="/smartfarm/img/home.png">
					<a href="<c:url value='/admin/logout'/>"><img alt="logout" src="/smartfarm/img/logout.png"></a>
				</div>
			</div>
			<div class='data'>
				<tiles:insertAttribute name="container"/>
			</div>
		</div>
	</div>
</c:if>
<script>
	$('.noadmin').click(function(){
		location = "/smartfarm/";
	})
	$('.gohome').click(function(){
		location = "/smartfarm/";
	})
</script>
</body>
</html>