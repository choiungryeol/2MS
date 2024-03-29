<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="common.Paging" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	Paging paging = (Paging)request.getAttribute("paging");
	
	int startPage = paging.getStartPage();
	int endPage = paging.getEndPage();
	int maxPage = paging.getMaxPage();
	int currentPage = paging.getCurrentPage();
	int limit = paging.getLimit();
	
	String urlMapping = paging.getUrlMapping();
	
	String action = (String)request.getAttribute("action");
	String keyword = null, begin = null, end = null;

	if(action != null){
		if(action.equals("date")) {
			begin = (String)request.getAttribute("begin");
			end = (String)request.getAttribute("end");
		}else {
			keyword = (String)request.getAttribute("keyword");
		}
	}
%>     --%>
<%-- 페이지 표시에 사용될 값들을 변수 선언 --%>
<c:set var="currentPage" value="${ requestScope.paging.currentPage }"/>
<c:set var="urlMapping" value="${ requestScope.paging.urlMapping }" />
<c:set var="startPage" value="${ requestScope.paging.startPage}" />
<c:set var="endPage" value="${ requestScope.paging.endPage}" />
<c:set var="maxPage" value="${ requestScope.paging.maxPage}" />
<c:set var="action" value="${ requestScope.action }"/>
<c:set var="keyword" value="${ requestScope.keyword }"/>
<c:set var="keyword2" value="${ requestScope.keyword2 }"/>
<c:set var="begin" value="${ requestScope.begin }"/>
<c:set var="end" value="${ requestScope.end }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%-- 목록 페이징 처리 --%>
<%-- <% if(action == null){ %> --%>

<c:if test="${ empty action }">
<div style="text-align:center;">
	<%-- <% if(currentPage <= 1){ %> --%>
	<c:if test="${ currentPage eq 1 }">
		[맨처음] &nbsp;
	</c:if>
	<c:if test="${currentPage gt 1 }">
	<%-- <% }else{ //currentPage > 1 %> --%>
		<a href="/lms/${urlMapping }?page=1">[맨처음]</a> &nbsp;
	</c:if>
	<%-- <% } %> --%>
	<%-- 이전 페이지 그룹으로 이동 --%>
	<%-- <% if((currentPage - 10) < startPage && (currentPage - 10) > 1){  //이전그룹이 있다면 %> --%>
	<c:if test="${(currentPage - 10) < startPage and (currentPage - 10) gt 1 }">
		<a href="/lms/${urlMapping }?page=${startPage -10}">[이전그룹]</a> &nbsp;
	</c:if>
	<%-- <% }else{ //이전그룹이 없다면 %> --%>
	<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) gt 1)}">	
		[이전그룹] &nbsp;
	</c:if>
	<%-- <% } %> --%>
	<%-- 현재 페이지가 속한 페이지그룹 숫자 출력 --%>
	<%-- <% for(int p = startPage; p <= endPage; p++){  --%>
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
			<c:if test="${ p eq currentPage }">
					<font color="blue" size="4"><b>${p}</b></font>
			</c:if>
	<!-- %> -->
			<c:if test="${ p ne currentPage }">
						<a href="/lms/${urlMapping }?page=${p}">${p}</a>
			</c:if>
	<%-- <%     }else{ %> --%>
	<%--<% }} %> --%>
	</c:forEach>
	<%-- 다음 페이지 그룹으로 이동 --%>
	<%-- <% if((currentPage + 10) > endPage && (currentPage + 10) < maxPage){  //다음그룹이 있다면 %> --%>
	<c:if test="${(currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
		<a href="/lms/${urlMapping }?page=${startPage + 10}">[다음그룹]</a> &nbsp;
	</c:if>
	<%-- <% }else{ //다음그룹이 없다면 %> --%>
	<c:if test="${!((currentPage + 10) > endPage && (currentPage + 10) < maxPage)}">
		[다음그룹] &nbsp;
	</c:if>
	<%-- <% } %> --%>
	
	<%-- <% if(currentPage >= maxPage){ %> --%>
	<c:if test="${currentPage >= maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<%-- <% }else{ //currentPage < maxPage  %> --%>
	<c:if test="${ currentPage < maxPage }">
	
		<a href="/lms/${urlMapping }?page=${maxPage}">[맨끝]</a> &nbsp;
	</c:if>
	<%-- <% } %> --%>
</div>
</c:if>
<%-- <% } %> --%>

<%-- 검색(제목, 작성자, 내용) 페이징 처리 --%>
<%-- <% if(action != null && keyword != null){ %> --%>
<c:if test="${!empty action and !empty keyword}">
<div style="text-align:center;">
	<%-- <% if(currentPage <= 1){ %> --%>
	<c:if test="${ currentPage eq 1 }">
		[맨처음] &nbsp;
	</c:if>
	<c:if test="${currentPage gt 1 }">
	<%-- <% }else{ //currentPage > 1 %> --%>
		<a href="/lms/${urlMapping }?page=1">[맨처음]</a> &nbsp;
	</c:if>
	<%-- <% } %> --%>
	<%-- 이전 페이지 그룹으로 이동 --%>
	<%-- <% if((currentPage - 10) < startPage && (currentPage - 10) > 1){  //이전그룹이 있다면 %> --%>
	<c:if test="${(currentPage - 10) < startPage and (currentPage - 10) gt 1 }">
		<c:url var="um1" value="${urlMapping }">
			<c:param name="page" value="${startPage - 10 }" />
			<c:param name="action" value="${action}" />
			<c:param name="keyword" value="${keyword}" />
		</c:url>
		<a href="${um1}">[이전그룹]</a> &nbsp;
	</c:if>
	<%-- <% }else{ //이전그룹이 없다면 %> --%>
	<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) gt 1)}">	
		[이전그룹] &nbsp;
	</c:if>
	<%-- <% } %> --%>
	<%-- 현재 페이지가 속한 페이지그룹 숫자 출력 --%>
	<%-- <% for(int p = startPage; p <= endPage; p++){  --%>
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
			<c:if test="${ p eq currentPage }">
					<font color="blue" size="4"><b>${p}</b></font>
			</c:if>
	<!-- %> -->
			<c:if test="${ p ne currentPage }">
						<a href="/lms/${urlMapping }?page=${p}">${p}</a>
			</c:if>
	<%-- <%     }else{ %> --%>
	<%--<% }} %> --%>
	</c:forEach>
	<%-- 다음 페이지 그룹으로 이동 --%>
	<%-- <% if((currentPage + 10) > endPage && (currentPage + 10) < maxPage){  //다음그룹이 있다면 %> --%>
	<c:if test="${(currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
		<a href="/lms/${urlMapping }?page=${startPage + 10}">[다음그룹]</a> &nbsp;
	</c:if>
	<%-- <% }else{ //다음그룹이 없다면 %> --%>
	<c:if test="${!((currentPage + 10) > endPage && (currentPage + 10) < maxPage)}">
		[다음그룹] &nbsp;
	</c:if>
	<%-- <% } %> --%>
	
	<%-- <% if(currentPage >= maxPage){ %> --%>
	<c:if test="${currentPage >= maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<%-- <% }else{ //currentPage < maxPage  %> --%>
	<c:if test="${ currentPage < maxPage }">
	
		<a href="/lms/${urlMapping }?page=${maxPage}">[맨끝]</a> &nbsp;
	</c:if>
	<%-- <% } %> --%>
</div>
<%-- <% } %> --%>
</c:if>



<c:if test="${!empty action and !empty keyword2}">
<div style="text-align:center;">	
	<c:if test="${ currentPage eq 1 }">
		[맨처음] &nbsp;
	</c:if>
	<c:if test="${currentPage > 1 }">
		<c:url var="um1" value="${urlMapping }">
			<c:param name="action" value="${action}" />
			<c:param name="selectData" value="${keyword2}" />
		</c:url>
		<a href="/lms/${um1}">[맨처음]</a> &nbsp;
	</c:if>
	<c:if test="${(currentPage - 10) < startPage and (currentPage - 10) > 1 }">
		
		<a href="${um1}"></a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1)}">	
		[이전그룹] &nbsp;
	</c:if>
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
			<c:if test="${ p eq currentPage }">
					<font color="blue" size="4"><b>${p}</b></font>
			</c:if>
			<c:if test="${ p ne currentPage }">
					<c:url var="um1" value="${urlMapping }">
						<c:param name="page" value="${p}" />
						<c:param name="action" value="${action}" />
						<c:param name="selectData" value="${keyword2}" />
					</c:url>
				<a href="/lms/${um1}">${p}</a>
			</c:if>
	</c:forEach>
	<c:if test="${(currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
		<c:url var="um1" value="${urlMapping }">
						<c:param name="page" value="${startPage + 10}" />
						<c:param name="action" value="${action}" />
						<c:param name="selectData" value="${keyword2}" />
		</c:url>
		<a href="/lms/${um1}">[다음그룹]</a> &nbsp;
	</c:if>
	<c:if test="${!((currentPage + 10) > endPage && (currentPage + 10) < maxPage)}">
		[다음그룹] &nbsp;
	</c:if>
	
	<c:if test="${currentPage >= maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<c:url var="um1" value="${urlMapping }">
						<c:param name="page" value="${maxPage}" />
						<c:param name="action" value="${action}" />
						<c:param name="selectData" value="${keyword2}" />
		</c:url>
		<a href="/lms/${um1 }">[맨끝]</a> &nbsp;
	</c:if>
</div>
</c:if>


</body>
</html>