<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table th span { color:#dc3545; margin-right: 5px }
</style>
</head>
<body id="back">
<h3 class="my-3 text-center mt-5" style="font-size: 50px; color:#000;"><strong>체험 신청하기</strong></h3>
<form method="post" action="register" enctype="multipart/form-data">
<table class="table tb-row">
<colgroup><col width="160px"><col></colgroup>
<tr><th>성명</th>
	<td><div class="row">
			<div class="col-auto">
				<input type="text" name="name" class="form-control" autofocus >
			</div>
		</div>
	</td>
</tr>
<tr><th>이메일</th>
	<td><div class="row input-check">
			<div class="col-auto">
				<input type="text" name="email" class="form-control check-item" title="이메일">
			</div>
			<div class="desc"></div>
		</div>
	</td>
</tr>
<tr><th>신청일자</th>
	<td><div class="row">
			<div class="col-auto d-flex align-items-center">
                <input type="date" name="birth" class="date form-control">
            </div>
		</div>
	</td>
</tr>
<tr><th>연락처</th>
	<td><div class="row">
			<div class="col-auto">
				<input type="text" name="phone" class="form-control">
			</div>
		</div>
	</td>
</tr>
</table>
</form>

<div class="btn-toolbar gap-2 justify-content-center my-3">
	<button class="btn btn-success">신청하기</button>
	<button class="px-4 btn btn-success" onclick="history.go(-1)" >취소</button>
</div>

<script>
    $(document).ready(function () {
        // 현재 날짜 가져오기
        var today = new Date();
        var todayString = today.toISOString().split('T')[0];
        
        // 최소 날짜를 오늘 이후로 설정
        $('input[name="birth"]').attr('min', todayString);
        
        // 최대 날짜를 오늘로부터 10년 후로 설정
        var maxDate = new Date(today.getFullYear() + 10, today.getMonth(), today.getDate());
        var maxDateString = maxDate.toISOString().split('T')[0];
        $('input[name="birth"]').attr('max', maxDateString);
        
        // 날짜 변경 이벤트 처리
        $('input[name="birth"]').on('change', function () {
            var selectedDate = $(this).val();
            
            // 선택한 날짜가 오늘 날짜와 이전인지 확인
            if (selectedDate <= todayString) {
                alert('오늘 날짜와 이전 날짜는 선택할 수 없습니다. 다음 날짜부터 선택해 주세요.');
                $(this).val(''); // 날짜 초기화
            }
        });
    });
</script>
</body>
</html>