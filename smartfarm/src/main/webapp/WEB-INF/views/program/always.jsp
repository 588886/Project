<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="<c:url value='/css/common.css'/>?<%=new java.util.Date()%>"
	rel="stylesheet" />
</head>
<body id="back">
	<h3 class="my-3 text-center mt-5" style="font-size: 50px; color:#000;"><strong>상시체험 프로그램</strong></h3>
    
	<div class="container mt-5">

		<h4 class="my-3 text-left mt-5"  ><strong>${always.plan_name}</strong></h4>
	    <table class="table mx-auto text-center" style=" background-color:#95d595;">
            <thead>
                <tr>
                    <th>프로그램명</th>
                    <th>입장료</th>
                    <th>무료제공</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>스마트팜 견학+ 씨앗뿌리기 + 바질 수확하기 + 샌드위치만들기</td>
                    <td>15,000원</td>
                    <td>바질수확 10~20g</td>
                </tr>
            </tbody>
        </table>	

		<h4 class="my-3 text-left mt-5"  ><strong>세부 내용</strong></h4>
	    <table class="table mx-auto text-center" style=" background-color:#95d595;">
            <thead>
                <tr>
                    <th>기본 프로그램 소개</th>
                    <th>내용</th>
                    <th>소요시간</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>스마트팜 견학 및 영상 교육</td>
                    <td>
                    	<ul style="list-style-type: disc; text-align:left">
                    		<li>스마트팜의 의미와 필요성 배우기</li>
                    		<li>수경재배시설의 원리와 특징 파악하기 ​</li>
                    		<li>바질의 생장과 특징에 대한 설명​</li>
                    		<li>농장 견학 하기</li>
                    	</ul>
                    </td>
                    <td rowspan="4" style="border-left:1px solid #dee2e6; ">60분</td>
                </tr>
                <tr>
                    <td>씨앗뿌리기 및 스마트팜이식​</td>
                    <td>
                    	<ul style="list-style-type: disc; text-align:left">
                    		<li>스폰지에 발아된 씨앗 심어 보기</li>
                    	</ul>
                    </td>
                </tr>
                <tr>
                    <td>바질 수확하기​</td>
                    <td>
                    	<ul style="list-style-type: disc; text-align:left">
                    		<li>신선한 바질을 수확해서 전용팩에 담기</li>
                    	</ul>
                    </td>
                </tr>
                <tr>
                    <td>음식 만들기</td>
                    <td>
                    	<ul style="list-style-type: disc; text-align:left">
                    		<li>바질을 이용한 샌드위치 만들기</li>
                    	</ul>
                    </td>
                </tr>
            </tbody>
        </table>	
		<div class="text-center">
			<a class="btn btn-primary" href="apply?id=${always.id}" >체험 신청하기</a>
		</div>
		<div class="text-end">
			<a class="btn btn-success" href="list" >체험 프로그램 더보기 +</a>
		</div>
	</div>

</body>
</html>