<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<body>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-primary">
				<div class="card-text">
					<h4 class="card-title">
						${boardType}
						<c:if test="${boardType == '0'}">
								공지사항
							</c:if>
						<c:if test="${boardType == '1'}">
								사내게시판
							</c:if>
					</h4>
				</div>
			</div>
			<form name="searchForm">
				<select name="searchCondition">
					<option value="">선택
					<option value="TITLE">제목
					<option value="BOARD_CONTENTS">내용
				</select>
				<script>
					searchForm.searchCondition.value = '${boardVO.searchCondition}';
				</script>
				<input name="searchKeyword" value="${boardVO.searchKeyword}" />
				<button type="submit" class="btn btn-primary btn-sm"
					onclick="location.href='boardList?boardType=${boardType}'">검색</button>
			</form>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table">
						<thead class=" text-primary">
							<tr>
								<th>No</th>
								<th>작성자</th>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="board">
								<tr>
									<td>${board.boardId}</td>
									<td>${board.empName}</td>
									<td><a
										href="${pageContext.request.contextPath}/boardOne/${board.boardId}">${board.title}</a></td>
									<td>${board.time}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<my:paging paging="${paging}" jsFunc="boardList" />
				</div>
				<button type="button" class="btn btn-primary btn-sm"
					onclick="location.href='boardList?boardType=${boardType}'">목록</button>
				<button type="button" class="btn btn-primary btn-sm"
					onclick="location.href='boardInsertForm'">글쓰기</button>
			</div>
		</div>
	</div>

</body>
</html>