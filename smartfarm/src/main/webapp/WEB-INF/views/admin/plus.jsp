<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 추가</title>
<link href="<c:url value='/css/admin.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="<c:url value='/img/hanul.ico'/>" />
</head>
<body>
	<div class="contaner">
		<form method="post" action="register">
			<table id="registertable">
				<colgroup><col width="200px"><col width="650px">
				</colgroup>
				<tr><th>성명</th>
					<td><div>
							<div class="col-auto">
								<input type="text" name="name"title="이름" autofocus >
							</div>
						</div>
					</td>
				</tr>
				<tr><th>아이디</th>
					<td><div class="row input-check">
							<div class="inputid">
								<input type="text" name="userid"  title="아이디">
								<button type="button" id="btn-userid">
									중복확인
								</button>
							</div>
							<div class="desc"/>
						</div>
					</td>
				</tr>
				<tr><th>비밀번호</th>
					<td><div>
							<div class="col-auto">
								<input type="text" name="userpw" title="비밀번호">
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<div class="addback">
			<button id="admin_add">추가하기</button>
			<button onclick=history.go(-1)>돌아가기</button>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="<c:url value='/js/member.js'/>?<%=new java.util.Date() %>"></script>
	<script>
		$('#admin_add').click(function(){
			if( $('[name=name]').val()=='' ){
				alert('성명을 입력하세요!');
				$('[name=name]').focus()
			}
			
			//아이디 중복확인
			var _id = $('[name=userid]') 
			//중복확인 한 경우: 이미 사용중이면 회원가입불가
			if( _id.hasClass('checked-item') ){
				if( _id.closest('.input-check').find('.desc').hasClass('text-danger')  ){
					alert("아이디가 " + member.userid.unusable.desc )
					_id.focus()
					return
				}
			}else{
			//중복확인 하지 않은 경우: 입력이 유효한지 확인
				if( invalidStatus( _id ) ) return;
				else{
					alert("아이디가 " + member.userid.valid.desc )
					_id.focus()
					return;
				}
			}
			
			if( $('[name=userpw]').val()=='' ){
				alert('비밀번호를 입력하세요!');
				$('[name=userpw]').focus()
			}
			
			if( _id.closest('.input-check').find('.desc').hasClass('text-success')  ){
				$('form').submit()
			}else{
				alert('아이디를 확인하세요');
			}
		})
		
		//아이디중복확인
		$('#btn-userid').on('click', function(){
			useridCheck()
		})
		function useridCheck(){
			var _id = $('[name=userid]');
			
			//유효한 입력이 아니면 유효성 확인
			var status = member.tagStatus( _id );
			if( status.is ){
				//DB에 해당 아이디 존재여부 확인
				$.ajax({
					url: 'useridCheck',
					data: { userid: _id.val() }
				}).done(function( response ){
					console.log(response)
					status = response ? member.userid.usable : member.userid.unusable;
					member.descStatus( _id, status )
					_id.addClass('checked-item') //중복확인함 지정
				})
				
			}else{
				alert("아이디를" + status.desc)
				_id.focus()
			}
		}
		
		//각 태그의 유효성확인
		function invalidStatus( tag ){
			var status = member.tagStatus( tag );
			if( status.is )	return false;
			else{
				alert("운영자 추가 불가\n" + tag.attr('title') + ' '+ status.desc)
				tag.focus()
				return true;
			}
		}
		
		$('.check-item').keyup(function(e){
			if( $(this).attr('name')=="userid"  && e.keyCode==13 ) //아이디입력후 엔터시 중복확인하기
				useridCheck()
			else{
				$(this).removeClass('checked-item') //중복확인함 제거
				member.showStatus( $(this) )  //키보드입력상태를 화면에 출력
			}
		})
	</script>
</body>
</html>