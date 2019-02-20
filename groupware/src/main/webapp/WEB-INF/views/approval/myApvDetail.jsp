<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.body{
margin: 50px;
}

</style>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</head>
<body id="body" class="body">


<div class="container">


	<h1>일반결제</h1>

	<div class="text-right">
		<table border="1" style="display: inline-block">
		
		<tr>
		<td class="tt" rowspan='3'>결재</td>
		<td class="aa">
			<c:choose>
			
				<c:when test="${ apvDto.rank_name == null }">입사대기</c:when>
				<c:otherwise>${ apvDto.rank_name }</c:otherwise>
				
			</c:choose>
		</td>
		
		<td class="aa">
			<c:choose>
			
				<c:when test="${ apvDto.rank_name1 == null }"><c:if test="${ not empty apvDto.member_name1 }">입사대기</c:if></c:when>
				<c:otherwise>${ apvDto.rank_name1 }</c:otherwise>
				
			</c:choose>
		</td>
		<td class="aa">
			<c:choose>
			
				<c:when test="${ apvDto.rank_name2 == null }"><c:if test="${ not empty apvDto.member_name2 }">입사대기</c:if></c:when>
				<c:otherwise>${ apvDto.rank_name2 }</c:otherwise>
				
			</c:choose>
		</td>
				<td class="aa">
			<c:choose>
			
				<c:when test="${ apvDto.rank_name3 == null }"><c:if test="${ not empty apvDto.member_name3 }">입사대기</c:if></c:when>
				<c:otherwise>${ apvDto.rank_name3 }</c:otherwise>
				
			</c:choose>
		</td>
		</tr>
		
		
		
		<tr>
		
		<td>${ apvDto.member_name }</td>
		<td id="authName1">${ apvDto.member_name1 }</td>
		<td id="authName2">${ apvDto.member_name2 }</td>
		<td id="authName3">${ apvDto.member_name3 }</td>
		
		</tr>
		
				<tr>
		
		<td>제출</td>
		<td id="authName1">${ apvDto.apv_auth_name1 }</td>
		<td id="authName2">${ apvDto.apv_auth_name2 }</td>
		<td id="authName3">${ apvDto.apv_auth_name3 }</td>
		
		</tr>
		
		</table>
	</div>
	
	
	<div>
	<table border="1">
	
	<tr>
	<th>문서상태</th>
	
			<c:choose>
				<c:when test="${ empty apvDto.apv_auth_name3 }">
					<c:choose>
						<c:when test="${ empty apvDto.apv_auth_name2 }">
							<td>${ apvDto.apv_auth_name1 }</td>
						</c:when>
						<c:when test="${ apvDto.approval_auth1 == 2 }">
							<td>${ apvDto.apv_auth_name1 }</td>
						</c:when>
						<c:otherwise>
							<td>${ apvDto.apv_auth_name2 }</td>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${ apvDto.approval_auth2 == 2 }">
					<td>${ apvDto.apv_auth_name2 }</td>
				</c:when>
				<c:otherwise>
					<td>${ apvDto.apv_auth_name3 }</td>
				</c:otherwise>
			</c:choose>
	
	<th>문서번호</th>
	<td>${ apvDto.approval_cate }_${ apvDto.approval_id }</td>
	</tr>
	
	<tr>
	<th>기안일자</th>
	<td colspan="3"><fmt:formatDate value="${ apvDto.approval_indate }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	
	<tr>
	<th>결재구분</th>
	<td colspan="3">${ apvDto.apv_cate_name }</td>
	</tr>
	
	<tr>
	<th>기안부서</th>
	<td colspan="3">
		<c:choose>
			
			<c:when test="${ apvDto.department_name == null }">발령대기</c:when>
			<c:otherwise>${ apvDto.department_name }</c:otherwise>
				
		</c:choose>
	</td>
	</tr>
	
	<tr>
	<th>기안담당</th>
	<td colspan="3">${ apvDto.member_name }&nbsp;&nbsp;${ apvDto.rank_name }</td>
	</tr>
	
	<tr>
	<th>제목</th>
	<td colspan="3">${ apvDto.approval_title }</td>
	</tr>
	
	<tr>
	<td colspan="4">${ apvDto.approval_content }</td>
	</tr>
	
	</table>
	</div>
	<div>
	
	<!-- 파일 다운로드 -->
	<a href="${pageContext.request.contextPath }/approval/down?path=${ apvDto.approval_filepath }">${ apvDto.approval_filename }</a>
	
	</div>
	
	<div class="text-right">
		<p style="font-weight: bold;">(주)그룹웨어</p>
	</div>

	<table border="1" >
	
	<tr>
	<th rowspan="3">결재기록</th>
	<td style="height: 30px;"><c:if test="${ not empty apvDto.approval_auth_date1 }">[<fmt:formatDate value="${ apvDto.approval_auth_date1 }"  pattern="yyyy-MM-dd HH:mm:ss"/>]&nbsp;&nbsp;${ apvDto.department_name1 }&nbsp;${ apvDto.member_name1 }&nbsp;${ apvDto.rank_name1 }&nbsp;<Strong>${ apvDto.apv_auth_name1 }</Strong></c:if></td>
	</tr>
	<tr>
	<td style="height: 30px;"><c:if test="${ not empty apvDto.approval_auth_date2 }">[<fmt:formatDate value="${ apvDto.approval_auth_date2 }"  pattern="yyyy-MM-dd HH:mm:ss"/>]&nbsp;&nbsp;${ apvDto.department_name2 }&nbsp;${ apvDto.member_name2 }&nbsp;${ apvDto.rank_name2 }&nbsp;<Strong>${ apvDto.apv_auth_name2 }</Strong></c:if></td>
	</tr>
	<tr>
	<td style="height: 30px;"><c:if test="${ not empty apvDto.approval_auth_date3 }">[<fmt:formatDate value="${ apvDto.approval_auth_date3 }"  pattern="yyyy-MM-dd HH:mm:ss"/>]&nbsp;&nbsp;${ apvDto.department_name3 }&nbsp;${ apvDto.member_name3 }&nbsp;${ apvDto.rank_name3 }&nbsp;<Strong>${ apvDto.apv_auth_name3 }</Strong></c:if></td>
	</tr>
	
	<c:if test="${ not empty apvDto.approval_return }">
	<th>반려사유</th>
	<td>${ apvDto.approval_return }</td>
	</c:if>

	<c:if test="${ not empty apvDto.approval_cc }">
	<th>임시저장 태그</th>
	<td>${ apvDto.approval_cc }</td>
	</c:if>

	</table>
	
</div>

<div class="float-left">
	<button onclick="history.back()">뒤로</button>
	<input type="button" value="인쇄" onclick="window.print()" />

</div>


<c:if test="${ auth == 2 }">
	<div class="float-right">
		<button onclick="reWrite()">재작성</button>
		<button onclick="deleteApv()">삭제</button>
	</div>
</c:if>

<c:if test="${ not empty auth }">
	<div class="float-right" id="authDiv">
		
	</div>
</c:if>

<form id="approve" action="${ pageContext.request.contextPath }/approval/approve" method="POST">
	<input type="hidden" id="where" name="where"> 
	<input type="hidden" id="what" name="what"> 
	<input type="hidden" id="why" name="why">
	<input type="hidden" id="approval_id" name="approval_id" value="${ apvDto.approval_id }">
</form>



	<!-- 반려 사유 -->
	<div class="modal" id="returning">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">반려</h4>
					<button type="button" class="close float-right" data-dismiss="modal">&times;</button>
				</div>

					<div class="form-group">
						<div class="modal-body">
							<h5>
								<label>반려 사유를 입력해주세요.</label>
							</h5>
							<input class="form-control" name="approval_return" type="text" id="approval_return" />
						</div>
						<div class="modal-footer">
							<button class="btn btn-dark" type="submit" onclick="returning()" >제출</button>
						</div>
					</div>
			</div>
		</div>
	</div>



<script>

var where;
if(${ apvDto.approval_mem1 == sessionScope.member.member_id }){
	where = 1;
}
if(${ apvDto.approval_mem2 == sessionScope.member.member_id }){
	where = 2;
}
if(${ apvDto.approval_mem3 == sessionScope.member.member_id }){
	where = 3;
}

console.log(${ apvDto.approval_id })
console.log(${ sessionScope.member.member_id })
console.log(where)
	$('#where').val(where);

if(${ auth } == 1){
if( where == 1 ){
	$('<button></button>').text('승인').attr('onclick','auth()').appendTo('#authDiv');
	$('<button></button>').text('반려').attr('data-toggle','modal').attr('data-target','#returning').appendTo('#authDiv');
}else if( where == 2 ){
	if(${ apvDto.approval_auth1 != 2 }){
		if(${ apvDto.approval_auth1 == 0 }){
			console.log('예결가능')
			$('<button></button>').text('예결').attr('onclick','preAuth()').appendTo('#authDiv');
		}else{
			$('<button></button>').text('승인').attr('onclick','auth()').appendTo('#authDiv');
			$('<button></button>').text('반려').attr('data-toggle','modal').attr('data-target','#returning').appendTo('#authDiv');
		}
	}
}else if( where == 3 ){
	if(${ apvDto.approval_auth2 != 2 }){
		if(${ apvDto.approval_auth2 == 0 }){
			console.log('예결가능')
			$('<button></button>').text('예결').attr('onclick','preAuth()').appendTo('#authDiv');
		}else{
			$('<button></button>').text('승인').attr('onclick','auth()').appendTo('#authDiv');
			$('<button></button>').text('반려').attr('data-toggle','modal').attr('data-target','#returning').appendTo('#authDiv');
		}
	}
}
}

var doubleSubmitFlag = true;

if(doubleSubmitFlag){
	function auth(){
		if(confirm('정말 승인 하시겠습니까?')){
			$('#what').val(1);
			$('#approve').submit();
			doubleSubmitFlag = false;
		}
	}
	function returning(){
			$('#what').val(2);
			$('#why').val($('#approval_return').val());
			$('#approve').submit();
			doubleSubmitFlag = false;
	}
	function preAuth(){
		if(confirm('정말 예결 하시겠습니까?')){
			$('#what').val(3);
			$('#approve').submit();
			doubleSubmitFlag = false;
		}
	}
}

function reWrite(){
	console.log("reWrite()");
	console.log(${ apvDto.approval_id })
	
	$('<form></form>').attr('id','reWriteGo').attr('action','${ pageContext.request.contextPath }/approval/reWrite').attr('method','POST').appendTo('#body');
	$('<input>').attr('type', 'hidden').attr('value','${ apvDto.approval_id }').attr('name','approval_id').appendTo('#reWriteGo');
	$('#reWriteGo').submit();
	
}

function deleteApv(){
	if(confirm('정말 삭제하시겠습니까?')){
	$('<form></form>').attr('id','deletetemp').attr('action','${ pageContext.request.contextPath }/approval/deleteTemp').attr('method','POST').appendTo('#body');
	$('<input>').attr('type', 'hidden').attr('value','${ apvDto.approval_id }').attr('name','approval_id').appendTo('#deletetemp');
	$('#deletetemp').submit();
	}
}

</script>

</body>
</html>