/**
 * 회원관련 함수
 */

var member = {
	//태그별로 상태확인
	tagStatus: function( tag, input ){
		if( tag.is('[name=userpw]') )			return this.userpwStatus( tag.val(), input );
		else if( tag.is('[name=userpw_ck]'))	return this.userpwCheckStatus( tag.val() );
		else if( tag.is('[name=userid]'))		return this.useridStatus( tag.val() );
		else if( tag.is('[name=email]') )		return this.emailStatus( tag.val() );
	},
	
	
	
	//아이디관련 상태확인: 영문소문자,숫자 5~10
	useridStatus: function( id ){
		var reg = /[^a-z0-9]/g
		if( id=='' )						return this.common.empty;
		else if( id.match(this.space) )		return this.common.space;
		else if( reg.test(id) )				return this.userid.invalid;
		else								return this.userid.valid;
	},
	
	//아이디적용 상태값
	userid: {
		invalid: { is: false, desc: '영문 소문자, 숫자만 입력하세요' },
		valid:   { is: true,  desc: '중복확인하세요' },
		usable:  { is: true,  desc: '사용가능합니다' },
		unusable:{ is: false, desc: '이미 사용중입니다' },
	},
	
	//공통적용 상태값
	common: {
		empty: 	{ is: false, desc: '입력하세요' },
		space: 	{ is: false, desc: '공백없이 입력하세요' },
	},
	
	
	space: /\s/g,
	
	//입력한 비밀번호 상태확인: 영문 대/소문자, 숫자 모두 포함
	userpwStatus: function( pw, input ){
		if( input ){
			$('[name=userpw_ck]').val('')
			$('[name=userpw_ck]').closest('.input-check').find('.desc')
								.removeClass('text-success text-danger').text('')
		}
		
		var reg = /[^A-Za-z0-9]/g, upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g
		if( pw=='' )						return this.common.empty;
		else if( pw.match(this.space) )		return this.common.space;
		else if( reg.test(pw) )				return this.userpw.invalid;
		else if( pw.length<5 )				return this.common.min;
		else if( pw.length>10 )				return this.common.max;
		else if( !upper.test(pw) || !lower.test(pw) || !digit.test(pw) )			
											return this.userpw.lack;
		else								return this.userpw.valid;		
	},
	
	
	//상태를 화면에 출력
	showStatus: function( tag ){
		var status = this.tagStatus( tag, true )
		this.descStatus( tag, status )
	},
	
	descStatus: function(tag, status){
		tag.closest('.input-check').find('.desc')
									.text( tag.attr('title') + '가 ' + status.desc )
									.removeClass('text-danger text-success')
									.addClass( status.is ? 'text-success' : 'text-danger')
	}
	
		
} 