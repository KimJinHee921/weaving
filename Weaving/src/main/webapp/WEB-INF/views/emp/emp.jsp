<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div class="col-md-12">
    <div class="card">
      <div class="card-header">
        <h4 class="card-title">사용자 정보 수정</h4>
      </div>
      <div class="card-body">
      	<form action="normalempinsert" method="post" id="insertForm" name="insertForm" >
			<div class="form-group">
			<label for="empNo"><b>사번</b></label> 
			<input class="form-control" type="text" name="empNo" id="empNo" readonly value="${emp.empNo}"> 
			</div>
			
			<div class="form-group">
			<label for="empName"><b>이름</b></label> 
			<input class="form-control" type="text" name="empName" id="empName" value="${emp.empName}">
			</div> 
			
			<div class="form-group">
			<label for="password"><b>비밀번호</b></label>
			<input class="form-control" type="password" name="password" id="password"  readonly value="${emp.password}">
			</div>

			<div class="form-group">
			<select class="form-control" name="deptId" size="1" id="deptId" style="display:none">
				<option value="7">회사</option>
				<option value="1">경영지원팀</option>
				<option value="2">회계</option>
				<option value="3">인사</option>
				<option value="4">연구관리팀</option>
				<option value="5">개발</option>
				<option value="6">테스트</option>
			</select>
			</div>
			
			<div class="form-group">
			<select class="form-control" name="position" size="1" id="position" style="display:none">
				<option value="">선택</option>
				<option value="0">사원</option>
				<option value="1">대리</option>
				<option value="2">과장</option>
				<option value="3">차장</option>
				<option value="4">부장</option>
				<option value="5">대표</option>
			</select>
			</div>
			<script>insertForm.position.value="${emp.position}";
					insertForm.deptId.value="${emp.deptId}";
			</script>
			
			<div class="form-group">
			<label for="email"><b>이메일</b></label> 
			<input class="form-control" type="text" name="email" id="email" value="${emp.email}"> 
			</div>
			
			<div class="form-group">
			<label for="phone"><b>휴대 전화</b></label> 
			<input class="form-control" type="text" name="phone" id="phone" value="${emp.phone}"> 
			</div> 
			
			<div class="form-group">
			<label for="address"><b>자택주소</b></label>
			<input class="form-control" type="text" size="20" id="address" name="address" value="${emp.address}"> 
			</div>
			
			<div class="form-group">
			<label for="gmailAppKey"><b>GMAILAPPKEY</b></label> 
			<input class="form-control" type="text" size="20" id="gmailAppKey" name="gmailAppKey" value="${emp.gmailAppKey}"> 
			</div>
			<div style="float: right;">
				<button type ="submit"  class="btn btn-primary btn-sm">수정</button>
				<button type ="button" onclick="location='${pageContext.request.contextPath}/home'" class="btn btn-default btn-sm">돌아가기</button>
			</div>
		</form>
      </div>
     </div>
</div>
</body>
</html>