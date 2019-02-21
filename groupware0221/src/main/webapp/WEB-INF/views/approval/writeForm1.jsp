<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.aa {
width:100px;
}
.tt{
height: 60px;
}

</style>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- jQuery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	
	  $('#summernote').summernote({
		  lang: 'ko-KR',
	      height: 400,
	      popover: {
	    	  image:[],
	    	  link:[],
	    	  air:[]
	      } ,
	      toolbar: [
	    	    // [groupName, [list of button]]
	    	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    	    ['fontsize', ['fontsize']],
	    	    ['color', ['color']],
	    	    ['para', ['ul', 'ol', 'paragraph']],
	    	    ['table', ['table']],
	    	    ['insert', ['link', 'picture', 'hr']],
	    	    ['height', ['height']]
	    	  ],
	    	  focus: true,
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
	  });
	  
}) // ready end


function sendFile(file, el) {
	var form_data = new FormData();
  	form_data.append('file', file);
  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: '${ pageContext.request.contextPath}/approval/apv_textImg',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/form-data',
    	processData: false,
    	success: function(img_name) {
      		$(el).summernote('editor.insertImage', img_name);
    	}
  	});
}


var doubleSubmitFlag = true;


function sendApv(){
	if(confirm('제출 이후에는 삭제하실 수 없습니다.\n정말 제출 하시겠습니까?')){
		if(doubleSubmitFlag){
			
			$('#approval_cc').val('');
			
			for(var i = 1 ; i <=3 ; i++){
		
				$('#authId'+i+'').val($('#authId'+i+'').text())
				
			}
			
			if($('#authId1').val() == ''){
				alert('결재라인을 선택해주세요')
				return;
			}
			if(($('#approval_title').val()).trim() == ''){
				alert('제목을 입력해주세요')
				return;
			}
			if(($('#summernote').val()).trim() == ''){
				alert('내용을 입력해주세요')
				return;
			}
		
			//console.log($(':radio[name="formList"]:checked').val());
			
			if('${ apvReWrite.approval_cate }' == '' || '${ apvReWrite.approval_cate }' == null){
				$('#apvCateGo').val(1);
			}else{
				$('<input></input>').attr('type','hidden').attr('value',${ apvReWrite.approval_id }).attr('name','approval_id').appendTo('#sendApv');
			}
			
			
			$('#sendApv').submit();
			doubleSubmitFlag = false;
		
		}else{
			return;
		}
	}else{
		return;
	}
}// sendApv end

</script>

</head>
<body>


<div class="container">

	<h2>일반결재 작성</h2>

<%-- 	<div>
	<span>결재 문서</span>
	<span>
	
	${ apvReWrite.apv_cate_name }
	
	<c:if test="${ not empty apvCateList }">
	<c:forEach var="item" items="${ apvCateList }" varStatus="stat">
	
	<c:choose>
	
	<c:when test="${ stat.first }">
		<input type="radio" name="formList" value="${ item.apv_cate_id }" checked="checked"/>${ item.apv_cate_name } &nbsp;&nbsp;
		<input id="apv_cate" type="hidden" value="${ item.apv_cate_id }">
	</c:when>
	<c:otherwise>
		<input type="radio" name="formList" value="${ item.apv_cate_id }" />${ item.apv_cate_name } &nbsp;&nbsp;
	</c:otherwise>
	
	</c:choose>
	
	</c:forEach>
	</c:if>
	
	</span>
	
	</div> --%>
	
	<div class="text-right">
	<table border="1" style="display: inline-block">
	
	<tr>
	<td class="tt" rowspan='3'>결재</td>
	<td class="aa">작성자</td>
	
	<td id="authRank1" class="aa">
	<c:choose>
		<c:when test="${ empty apvReWrite.rank_name1 }"><c:if test="${ not empty apvReWrite.member_name1 }">입사대기</c:if></c:when>
		<c:otherwise>${ apvReWrite.rank_name1 }</c:otherwise>
	</c:choose>
	</td>
	
	<td id="authRank2" class="aa">
	<c:choose>
		<c:when test="${ empty apvReWrite.rank_name2 }"><c:if test="${ not empty apvReWrite.member_name2 }">입사대기</c:if></c:when>
		<c:otherwise>${ apvReWrite.rank_name2 }</c:otherwise>
	</c:choose>
	</td>
	
	<td id="authRank3" class="aa">
	<c:choose>
		<c:when test="${ empty apvReWrite.rank_name3 }"><c:if test="${ not empty apvReWrite.member_name3 }">입사대기</c:if></c:when>
		<c:otherwise>${ apvReWrite.rank_name3 }</c:otherwise>
	</c:choose>
	</td>
	
	<%-- <td id="authRank1" class="aa">${ apvReWrite.rank_name1 }</td>
	<td id="authRank2" class="aa">${ apvReWrite.rank_name2 }</td>
	<td id="authRank3" class="aa">${ apvReWrite.rank_name3 }</td> --%>
	</tr>
	
	
	<tr>
	
	<td>${ sessionScope.member.member_name }</td>
	<td id="authName1">${ apvReWrite.member_name1 }</td>
	<td id="authName2">${ apvReWrite.member_name2 }</td>
	<td id="authName3">${ apvReWrite.member_name3 }</td>
	
	</tr>
	
	<tr>
	
	<td>${ sessionScope.member.member_id }</td>
	<td id="apv_mem1">${ apvReWrite.approval_mem1 }</td>
	<td id="apv_mem2">${ apvReWrite.approval_mem2 }</td>
	<td id="apv_mem3">${ apvReWrite.approval_mem3 }</td>
	
	</tr>
	
	</table>
	</div>
	

	
	<button onclick="selectMem()">결재라인 추가</button>

	<div>
	
	기안일자 ${ now } <br>
	기안부서
	
	<c:choose>
	
	<c:when test="${ sessionScope.member.department_name == null }">발령대기</c:when>
	<c:otherwise>${ sessionScope.member.department_name }</c:otherwise>
	
	</c:choose>
	 <br>
	
	기안담당
	${ sessionScope.member.member_name }
	<c:choose>
	
	<c:when test="${ empty sessionScope.member.rank_name }">입사대기</c:when>
	<c:otherwise>${ sessionScope.member.rank_name }</c:otherwise>
	
	</c:choose>
	 <br>
	
	<input type="hidden" id="authDept1" name="authDept1" value="${ apvReWrite.department_name1 }">
	<input type="hidden" id="authDept2" name="authDept2" value="${ apvReWrite.department_name2 }">
	<input type="hidden" id="authDept3" name="authDept3" value="${ apvReWrite.department_name3 }">
	
	${ apvReWrite }
	
<form id="sendApv" action="${ pageContext.request.contextPath }/approval" method="POST" enctype="multipart/form-data"> <!-- ============================================================================================================================================================= -->
	

	<input type="hidden" id="authId1" name="approval_mem1" value="${ apvReWrite.approval_mem1 }">
	<input type="hidden" id="authId2" name="approval_mem2" value="${ apvReWrite.approval_mem2 }">
	<input type="hidden" id="authId3" name="approval_mem3" value="${ apvReWrite.approval_mem3 }">
	
	<input type="hidden" id="apvCateGo" name="approval_cate" value="1">
	
	<input type="hidden" id="approval_cc" name="approval_cc" value="${ apvReWrite.approval_cc }">
	
	제목<input id="approval_title" type="text" name="approval_title" value="${ apvReWrite.approval_title }"> <br>
	
	<div>
		<textarea id="summernote" name="approval_content" >${ apvReWrite.approval_content }</textarea> <br>
	</div>
	
	<div class="row">
		<div class="float-left">
			<input type="file" name="file" value="${ apvReWrite.approval_filepath }"/>
		</div>
	</div>
	
	
	
</form> <!-- ============================================================================================================================================================= -->

		<div class="text-right">
			<button onclick="sendApv()">제출하기</button>
			<button data-toggle="modal" data-target="#comment" >저장하기</button>
		</div>
		
	
	</div>
</div>


	<!-- 임시저장 코멘트 -->
	<div class="modal" id="comment">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">임시저장</h4>
					<button type="button" class="close float-right" data-dismiss="modal">&times;</button>
				</div>

					<div class="form-group">
						<div class="modal-body">
							<h5>
								<label>임시저장 태그를 달아주세요.</label>
							</h5>
							<input class="form-control" name="apv_comment" type="text" id="apv_comment" value="${ apvReWrite.approval_cc }"/>
						</div>
						<div class="modal-footer float-right">
							<button class="btn btn-dark float-right" type="submit" onclick="tempStore()" >저장</button>
						</div>
						<div class="float-left" style="padding: 0 0 0 20px">
							<label>임시저장의 경우 파일은 저장되지 않습니다.</label><br>
							<label>최종 제출시 파일을 입력해주세요.</label>
						</div>
					</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	function selectMem(){
		window.open('${pageContext.request.contextPath}/approval/pikAuthMem','결제자선택','width=800 , height=500 ,resizable = no, scrollbars = no');
	}
	
	function tempStore(){

		for(var i = 1 ; i <=3 ; i++){
			
			$('#authId'+i+'').val($('#authId'+i+'').text())
			
		}
		
		$('<input></input>').attr('type','hidden').attr('value',${ apvReWrite.approval_id }).attr('name','approval_id').appendTo('#sendApv');
		
		
		if(($('#approval_title').val()).trim() == ''){
			alert('제목을 입력해주세요')
			return;
		}
		if(($('#summernote').val()).trim() == ''){
			alert('내용을 입력해주세요')
			return;
		}
	
		console.log($(':radio[name="formList"]:checked').val());
		
		$('#apvCateGo').val($(':radio[name="formList"]:checked').val());
		if($('#apvCateGo').val() == ''){
		$('#apvCateGo').val(${ apvReWrite.approval_cate });
		}
		
		$('#approval_cc').val($('#apv_comment').val());
		
		
		if($('#apv_comment').val().trim() != ''){
			$('#sendApv').submit();
			
			console.log($('#authId1').val());
			console.log($('#authId2').val());
			console.log($('#authId3').val());
			console.log($('#approval_title').val());
			console.log($('#summernote').val());
			console.log($('#apvCateGo').val());
			console.log($('#apv_comment').val());
			
		}else{
			alert('태그 내용을 입력해주세요')
			return;
		}
		
	}
	
	</script>

</body>
</html>