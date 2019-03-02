<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
<table class="table table-hover text-center">
	<thead>
	<tr class="text-center">
		<th>사번</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>성별</th>
		<th>메일</th>
		<th>휴대폰번호</th>
		<th>부서</th>
		<th>직책</th>
		<th>입사일</th>
		<th>수정일</th>
		<th class="text-right">
			<!-- <a class="btn btn-outline-secondary btn-sm">삭제</a> -->
		</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="member" begin="${page.startNum}" end="${page.endNum}">
		<tr>
			<td>${member.member_id}</td>
			<td>${member.member_name}</td>
			<td>${member.member_birth}</td>
			<td>${member.member_gender}</td>
			<td>${member.member_email}</td>
			<td>${member.member_phone}</td>
			<td>${member.department_name}</td>
			<td>${member.rank_name}</td>
			<td>${member.member_indate}</td>
			<td>${member.member_modidate}</td>
			<td class="text-right">
				<c:if test="${address eq 'unauthorized'}">
					<a id="authorization" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/authorization?member_id=${member.member_id}">승인</a>
					<a id="refuse" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/refuse?member_id=${member.member_id}">거절</a>
				</c:if>
				<c:if test="${address eq 'member'}">
					<a id="memberView" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/memberView?member_id=${member.member_id}">상세보기</a>
					<%-- <a id="deleteMember" class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/manager/deleteMember?member_id=${member.member_id}">삭제</a> --%>
				</c:if>				
			</td>
		</tr>
	</c:forEach>
	</table>
	
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${page.page != 1}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/${address}?page=1">[처음]</a></li>
			</c:if>
			<c:if test="${page.page >=11}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/${address}?page=${page.page-1}">[이전]</a></li>
			</c:if>

			<c:forEach var="pagenum" begin="${page.startPage}" end="${page.endPage}">
				<c:if test="${pagenum == page.page}">
					<li class="page-item active"><a class="page-link" href='#'>${pagenum}&nbsp;</a></li>
				</c:if>
				<c:if test="${pagenum != page.page}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/${address}?page=${pagenum}">${pagenum}&nbsp;</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${page.endPage != page.totalPage}">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/${address}?page=${page.endPage+1}">[다음]</a></li>
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manager/${address}?page=${page.totalPage}">[끝]</a></li>
			</c:if>
		</ul>
	</div>
	<br>
	<div id="searchForm" align="center">
		<form>
			<select name="opt" class="custom-select-sm">
				<option value="0">사번</option>
				<option value="1">이름</option>
				<option value="2">생년월일</option>
				<option value="3">이메일</option>
				<option value="4">휴대폰번호</option>
				<option value="5">부서</option>
				<option value="6">직급</option>
				<option value="7">입사일</option>
			</select>
			<input type="text" size="20" name="condition" />&nbsp;
			<input type="hidden" name="page" value="${page.page}"/>
			<input type="submit" class="btn btn-primary btn-sm" value="검색" />
		</form>
		<select name="opt" class="btn btn-primary dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<option value="0">사번</option>
				<option value="1">이름</option>
				<option value="2">생년월일</option>
				<option value="3">이메일</option>
				<option value="4">휴대폰번호</option>
				<option value="5">부서</option>
				<option value="6">직급</option>
				<option value="7">입사일</option>>
	</select>


<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small"  placeholder="검색어 입력" aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>
	</div>
</div>
</body>
</html>