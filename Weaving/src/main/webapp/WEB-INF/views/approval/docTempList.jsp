<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header card-header-primary">
					<h4 class="card-title ">임시 저장 문서</h4>
					<p class="card-category">임시 저장한 문서를 조회할 수 있습니다</p>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>문서 번호</th>
									<th>문서 제목</th>
									<th>문서 작성자</th>
									<th>문서 작성 날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${docList}" var="doc">
									<tr>
										<td>${doc.docNo}</td>
										<td><a id="btnSelect" href="${pageContext.request.contextPath}/docUpdateView?docId=${doc.docId}">${doc.docTitle}</a></td>
										<td>${doc.writerEmpName}</td>
										<td>${doc.regDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>