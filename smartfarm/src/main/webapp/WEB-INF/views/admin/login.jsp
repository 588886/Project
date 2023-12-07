<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>
	<div class="contaner">
	    <form method="post" action="smartfarmLogin">
	    	<div class="inputID">
	        	<div>
	            	<label for="inputUserid">아이디</label>
	        	</div>
	        	<div>
	            	<input class="form-control" name="userid" required type="text" placeholder="아이디">
	        	</div>
	        </div>
	        <div class="inputPW">
	        	<div>
	            	<label for="inputPassword">비밀번호</label>
	        	</div>
	        	<div>
	            	<input class="form-control" name="userpw" required type="password" placeholder="비밀번호">
	        	</div>
	        </div>
	        <div class="loginButton">
		        <button>로그인</button>
		        <button onclick=history.go(-1)>돌아가기</button>
	        </div>
	    </form>
	</div>
	
</body>
</html>