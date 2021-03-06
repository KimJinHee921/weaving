<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.weaving.biz.common.Paging"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

.pagination a.active {
	background-color: #ab47bc;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not (.active ) {
	background-color: #ddd;
}
</style>

<c:set var="pre" value="${paging.page-1}"/>
<c:set var="next" value="${paging.page+1}"/>

<div class="pagination">
	<c:if test="${empty jsFunc}">
		<c:set var="jsFunc" value="go_page"></c:set>
	</c:if>
	
	<c:if test="${pre == 0 }">
		<c:set var="pre" value="${1}" />
	</c:if>
	<a href="javascript:${jsFunc}(${pre})">이전</a>
	
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<c:if test="${i != paging.page}">
			<a href="javascript:${jsFunc}(${i})">${i}</a>
		</c:if>
		<c:if test="${i == paging.page}">
			<a class="active">${i}</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${next > paging.endPage}">
		<c:set var="next" value="${paging.endPage}" />
	</c:if>
	<a href="javascript:${jsFunc}(${next})">다음</a>
</div>