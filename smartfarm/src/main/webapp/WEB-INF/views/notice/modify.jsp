<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%-- <link href="<c:url value='/css/styles.css'/>?<%=new java.util.Date()%>" rel="stylesheet" /> --%>
<link href="<c:url value='/css/common.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="my-4 text-center">공지사항 수정</h3>
<div class="container mt-5">
<form method="post" enctype="multipart/form-data" action="update">
<table class="table tb-row">
<colgroup><col width="180px"><col></colgroup>
<tr><th>제목</th>
	<td><input type="text" value="${fn: escapeXml(vo.title) }"  autofocus class="form-control check-empty" name="title" title="제목"></td>
</tr>
<tr><th>내용</th>
	<td><textarea name="content" 
			class="form-control check-empty" title="내용">${vo.content}</textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td><div>
			<label>
				<input type="file" name="file" id="file-multiple" multiple accept=".png, .jpg, .webp">
				<i role="button" class="fs-3 fa-solid fa-file-circle-plus"></i>
			</label>
		</div>
		
		<div class="form-control py-2 mt-2 file-drag">
			<!-- 첨부파일이 없는 경우 -->
			<c:if test="${empty vo.files}">
				<div class="py-3 text-center">첨부할 파일을 마우스로 끌어 오세요</div>
			</c:if>
			<!-- 첨부된 파일들 --> 
			<c:forEach items="${vo.files}" var="file" varStatus="s">
				<div class="d-flex gap-3 align-items-center file-item my-1" >
					<button class="btn-close small" data-seq="${s.index}"></button>
					<span class="file-name">${file.filename}</span>
				</div>
			</c:forEach>
		</div>
	</td>
</tr>
<tr>
    <th>체험프로그램 여부</th>
    <td id="plan_yn" style="height: 62px;">
              <div class="form-check form-check-inline mt-2 me-5">
		  <label>
			  <input class="form-check-input" type="radio" name="plan" value="0" <c:if test="${empty vo.program}">checked</c:if> >아니오
		  </label>
		</div>
              <div class="form-check form-check-inline mt-2">
		  <label>
			  <input class="form-check-input" type="radio" name="plan" value="1" <c:if test="${not empty vo.program}">checked</c:if> >예
		  </label>
		</div>
    </td>
</tr>  
</table>
<input type="hidden" name="remove" >
<input type="hidden" name="id" value="${vo.id}">
<input type="hidden" name="curPage" value="${page.curPage}">
<input type="hidden" name="search" value="${page.search}">
<input type="hidden" name="keyword" value="${page.keyword}">
<input type="hidden" name="plan_id" value="0" >
</form>

<div class="btn-toolbar gap-2 justify-content-center my-3">
	<button class="btn btn-success" id="btn-save">저장</button>
	<button class="btn btn-success" id="btn-cancel">취소</button>
</div>
</div>
<script>
var fileList = new FileList();

// 이전에 첨부된 파일목록을 fileList에 담기
<c:forEach items="${vo.files}" var="file">
	fileList.setFile( urlToFile( "${file.filepath}", "${file.filename}" ), ${file.id} )
</c:forEach>
console.log( "files> ", fileList )

$('#btn-cancel').on('click', function(){
	history.go(-1)	
})

$('#btn-save').click(function(){
	if( emptyCheck() ){
		$('[name=remove]').val( fileList.info.removeId )
		//console.log( 'remove> ', $('[name=remove]').val()  )
		multipleFileUpload();
		
        if( $("[name=plan]:checked").val()==1 ){
        	$("[name=plan_id]").val(  $("select#plan option:selected").val()  )
        }
		
		$('form').submit()
	}
})

$(function(){
	
	/* 체험프로그램 연결하기 */
	if( $("[name=plan]:checked").val()==1 ){
    	load_plan()
    }
	
	$("[name=plan]").change(function(){
		if( $(this).val() == 0 ){
			$("#plan_yn").children("div.form-check:last").remove()
		}else{
			 load_plan()
		}
	})	


	
})

function load_plan(){
	$.ajax({
		url: "<c:url value='/program/plan_list'/>",
		data : { option: "${empty vo.program ? 0 : vo.program.id}" }
	}).done(function( response ){
		var tag = 
			`<div class="form-check form-check-inline">
				<select id="plan" class="form-select">`;
		$(response).each(function(){
			tag += `<option value="\${this.id}">\${this.plan_name} [ \${this.plan_start_date}~\${this.plan_end_date} ]</option>`;
		})
		tag += `	</select>					
				</div>
				`
		$("#plan_yn").append(tag)
		$("select#plan").val(${vo.program.id}).prop("selected",true);
	})
}

</script>

</body>
</html>

