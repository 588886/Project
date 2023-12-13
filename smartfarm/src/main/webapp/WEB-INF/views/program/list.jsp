<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="my-4">스마트팜 체험하기</h3>

<form method="post" action="list">
<input type="hidden" name="curPage" value="1">
</form>

<c:set var="params" value="curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}"/>
<table class="table tb-list text-center">
<colgroup><col width="120px"><col><col width="200px"><col width="120px"><col width="100px">
</colgroup>
<thead><tr><th>프로그램 소개</th><th>내용</th><th>소요시간</th></tr></thead>
<tbody>
	<!-- 각각의 프로그램에 대한 정보를 추가해주세요 -->
  <tr>
    <th>스마트팜 견학 및 영상 교육</th>
    <td><ul>
    	<li>스마트팜의 의미와 필요성 배우기</li>
    	<li>수경재배시설의 원리와 특징 파악하기</li>
    	<li>생장과 특징에 대한 설명</li>
    	<li>농장 견학하기</li>
    </ul>
    </td>
    <td rowspan="5">60분</td>
  </tr>
	<tr>
		<td></td>
	</tr>
  <!-- 필요한 만큼 계속해서 추가할 수 있습니다 -->
</tbody>
</table>

<jsp:include page="/WEB-INF/views/include/page.jsp"/>

</body>
</html>
