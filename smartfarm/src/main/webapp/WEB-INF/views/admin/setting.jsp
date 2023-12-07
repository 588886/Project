<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사정보 수정</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>

	<c:if test="${empty loginInfo}">
		<div class="noadmin">
			<img alt="notEnter" src="/smartfarm/img/notenter.jpg">
			<a style="display: none;" href="https://kr.freepik.com/free-vector/flat-design-do-not-enter-sign_23101533.htm#query=%EA%B8%88%EC%A7%80%20%ED%91%9C%EC%A7%80%ED%8C%90&position=5&from_view=keyword&track=ais&uuid=4dba9b05-3ffb-440c-bd3e-6cc3be8272b8">Freepik</a>
			<p >접근할 수 없는 페이지입니다.</p>
		</div>
	</c:if>
	<div class="contaner">
		<c:if test="${not empty loginInfo}">

		<form method="post" action="campanyModify">
			<table id="settingtable">
				<colgroup><col width="200px"><col width="650px">
				</colgroup>
				<tr><th>회사명</th>
					<td><div>
							<input type="text" name="name" title="이름" value="${vo.name }">
						</div>
					</td>
				</tr>
				<tr><th>주소</th>
					<td><div class="inputid">

							<input type="text"  id="addr" name="adress" onclick="openZipSearch();" readonly="readonly"  value="${vo.adress }">
						</div>
					</td>
				</tr>
				<tr><th>상세주소</th>
					<td><div>
							<input type="text"  id="addr_dtl" name="detailadress" value="${vo.detailadress }">

						</div>
					</td>
				</tr>
				
			</table>

			<div class="addback">
				<button>수정하기</button>
				<button type="button" onclick=history.go(-1)>돌아가기</button>
			</div>
		
		</form>
		</c:if>
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function openZipSearch() {
	    new daum.Postcode({
	    	oncomplete: function(data) {     
			var addr = ''; 
			if (data.userSelectedType === 'R') { 
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}
	
			$("#zip_code").val(data.zonecode);
			$("#addr").val(addr);
			$("#addr_dtl").val("");
			$("#addr_dtl").focus();
	        }
	    }).open();
	}
	</script>

</body>
</html>