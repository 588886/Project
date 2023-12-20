<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- Core theme CSS (includes Bootstrap)-->
<%--     <link href="<c:url value='/css/styles.css'/>?<%=new java.util.Date()%>" rel="stylesheet" /> --%>
    <link href="<c:url value='/css/common.css'/>?<%=new java.util.Date()%>" rel="stylesheet" />
</head>
<body>
    <h3 class="my-4 text-center">공지사항 작성</h3>
	<div class="container mt-5">
    <form method="post" enctype="multipart/form-data" action="register">
        <table class="table tb-row">
            <colgroup><col width="180px"><col></colgroup>
            <tr>
                <th>제목</th>
                <td><input type="text" autofocus class="form-control check-empty" name="title" title="제목"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" class="form-control check-empty" title="내용"></textarea></td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td>
                    <div>
                        <label>
                            <input type="file" name="file" id="file-multiple" multiple accept=".png, .jpg, .webp">
                            <i role="button" class="fs-3 fa-solid fa-file-circle-plus"></i>
                        </label>
                    </div>

                    <div class="form-control py-2 mt-2 file-drag">
                        <div class="py-3 text-center">첨부할 파일을 마우스로 끌어 오세요</div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>체험프로그램 여부</th>
                <td id="plan_yn" style="height: 62px;">
	                <div class="form-check form-check-inline mt-2 me-5">
					  <label>
						  <input class="form-check-input" type="radio" name="plan" value="0" checked>아니오
					  </label>
					</div>
	                <div class="form-check form-check-inline mt-2">
					  <label>
						  <input class="form-check-input" type="radio" name="plan" value="1" >예
					  </label>
					</div>
                </td>
			</tr>                
        </table>
        <input type="hidden" name="writer" value="${loginInfo.userid}">
        <input type="hidden" name="plan_id" value="0" >
    </form>

    <div class="btn-toolbar gap-2 justify-content-center my-3">
        <button class="btn btn-success" id="btn-save">저장</button>
        <button class="btn btn-success" id="btn-cancel">취소</button>
    </div>
</div>
    <script>
        var fileList = new FileList();

        $(function () {
        	
        	/* 체험프로그램 연결하기 */
			$("[name=plan]").change(function(){
				if( $(this).val() == 0 ){
					$("#plan_yn").children("div.form-check:last").remove()
				}else{
					$.ajax({
						url: "<c:url value='/program/plan_list'/>",
						data: { option: 0 }
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
					})
				}
			})	
        		
        })
        			

        $('#btn-cancel').on('click', function () {
            history.go(-1)
        })

        $('#btn-save').click(function () {
            if (emptyCheck()) {
                multipleFileUpload();
                if( $("[name=plan]:checked").val()==1 ){
                	$("[name=plan_id]").val(  $("select#plan option:selected").val()  )
                }
                $('form').submit()
            }
        })

    </script>
</body>
</html>
