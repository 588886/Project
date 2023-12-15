<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사정보 수정</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
</head>
<body>
	<div class="contaner list">
		<button class='addbtn'>수정하기</button>
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

		
		</form>
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