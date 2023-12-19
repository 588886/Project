<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table th span { color:#dc3545; margin-right: 5px }
</style>
</head>
<body id="back">
<div class="container mt-5">
<h3 class="my-3 text-center mt-5" style="font-size: 50px; color:#000;"><strong>체험 신청하기</strong></h3>
<form method="post" action="register" enctype="multipart/form-data">
<table class="table tb-row">
<colgroup><col width="160px"><col></colgroup>

<tr><th>프로그램명</th>
	<td>${info.plan_name}</td>
</tr>
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
                 <input type="date" name="application_date" class="date form-control" value="${info.id} " min="${info.plan_start_date }" max="${info.plan_end_date }">
            </div>
		</div>
	</td>
</tr>
<tr><th>신청시각</th>
	<td><div class="row">
			<div class="col-auto d-flex align-items-center">
               <div class="form-check form-check-inline">
			  <label>
				  <input class="form-check-input" type="radio" name="plan_time" checked value="${info.plan_time_am }">${info.plan_time_am }
			  </label>
			</div>
			<div class="form-check form-check-inline">
			  <label>
			  	<c:if test="${not empty info.plan_time_pm }">
				  <input class="form-check-input" type="radio" name="plan_time" value="${info.plan_time_pm }">${info.plan_time_pm }
				  </c:if>
			  </label>
			</div>
			  <div class="text-danger">※시각이 안보이는 경우에는 다른 날짜를 선택 해주세요.</div>
            </div>
		</div>
	</td>
</tr>
<tr><th>신청인원</th>
	<td><div class="row">
			<div class="col-auto d-flex align-items-center">
                
                <select class="form-select w-px160" name="headcount" id="headcounts" >
					<option value="0">인원 선택</option>
				</select>
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
<input type="hidden" name="plan_id" value="${info.id }">
</form>

<div class="btn-toolbar gap-2 justify-content-center my-3">
	<button class="btn btn-success" id="btn-save">신청하기</button>
	<button class="px-4 btn btn-success" onclick="history.go(-1)" >취소</button>
</div>
</div>
<script>
    $(document).ready(function () {
    	// 현재 날짜 가져오기
    	var today = new Date();
    	var todayString = today.toISOString().split('T')[0];
    	var currentHour = today.getHours();

    	// info.plan_time_am에는 오전 시각이, info.plan_time_pm에는 오후 시각이 들어있다고 가정
    	var planTimeAm = parseInt('${info.plan_time_am}', 10);
    	var planTimePm = parseInt('${info.plan_time_pm}', 10);

    	// 만약 현재 시간이 오전 시각을 지났다면 오전 시각 input을 숨깁니다.
    	if (currentHour >= planTimeAm) {
    	    $('input[value="${info.plan_time_am}"]').closest('.form-check').hide();
    	}

    	// 만약 현재 시간이 오후 시각을 지났다면 오후 시각 input을 숨깁니다.
    	if (currentHour >= planTimePm) {
    	    $('input[value="${info.plan_time_pm}"]').closest('.form-check').hide();
    	}

    	// 최소 날짜를 오늘부터로 설정
    	 $('input[name="application_date"]').attr('min', todayString);

    	// 날짜 변경 이벤트 처리
    	$('input[name="application_date"]').on('change', function () {
    	    var selectedDate = $(this).val();

    	    // 선택한 날짜가 오늘이 아니면 모든 시간대의 input을 보이게 설정
    	    if (selectedDate !== todayString) {
    	        $('input[value="${info.plan_time_am}"]').closest('.form-check').show();
    	        $('input[value="${info.plan_time_pm}"]').closest('.form-check').show();
    	    } else {
    	        // 선택한 날짜가 오늘이면 현재 시간 이후의 시간대만 보이게 설정
    	        if (currentHour >= planTimeAm) {
    	            $('input[value="${info.plan_time_am}"]').closest('.form-check').hide();
    	        }

    	        if (currentHour >= planTimePm) {
    	            $('input[value="${info.plan_time_pm}"]').closest('.form-check').hide();
    	        }
    	    }
    	});
        
        $('[name=application_date]').val(todayString)
        console.log("11", $("[name=application_date]").val())
        headcount()
        
    });
    
    function headcount(){
        $.ajax({
            url: "headcount",
            data: {
                plan_time: $("[name=plan_time]:checked").val(),
                plan_id: $("[name=plan_id]").val(),
                application_date: $("[name=application_date]").val()
            }
        }).done(function(response){
            console.log(response)
            var select = $('#headcounts');
            
            // 기존의 옵션들을 삭제
            select.empty();
            
            // Add options based on the response
            for (var i = 1; i <= response; i++) {
                var option = $('<option>', { value: i, text: i });
                select.append(option);
            }
        });
    }

    $("[name=application_date], [name=plan_time]").change(function(){
    	headcount()
    })
    var select = document.getElementById("headcounts");

    // "인원 선택"을 제외한 1부터 5까지의 옵션 추가
    for (var i = 1; i <= 10; i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = i;
        select.appendChild(option);
    }
    
    $('#btn-save').click(function(){
    	if( emptyCheck() )
    		$('form').submit()
    })
</script>

</body>
</html>