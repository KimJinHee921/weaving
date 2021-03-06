<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<script src="http://malsup.github.com/jquery.form.js"></script> 
<script type="text/javascript">
	$(document).ready(function() {
	});

	function checkFileType(filePath) {
		var fileFormat = filePath.split(".");
		if (fileFormat.indexOf("xls") > -1) {
			return true;
		} else if (fileFormat.indexOf("xlsx") > -1) {
			return true;
		} else {
			return false;
		}
	}

	function check() {
		var file = $("#excel").val();
		if (file == "" || file == null) {
			alert("파일을 선택");
			return false;
		} else if (!checkFileType(file)) {
			alert("엑셀 파일만 업로드");
			return false;
		}
		var fileFormat = file.split(".");
		var fileType = fileFormat[1];

		if (confirm("업로드 하시겠습니까?")) {
			$("#excelUpForm").attr("action", "${pageContext.request.contextPath}/compExcelUpload");
			var options = {
				success : function(data) {
					alert("업로드 완료");
					/* for(i=0; i<data.length;i++)
					$("#ajax-content").append(data[i].name); */
				},
				
				type : "POST",
				data : {
					"excelType" : fileType
				},
				dataType : 'JSON'
			};
			$("form").ajaxSubmit(options);
		}
	}
</script>

</head>
<body>
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<div class="page-head">
				<!-- BEGIN PAGE TITLE -->
				<div class="page-title">
					<h1>
						<span id="title"></span><small id="titleSmall"></small>
					</h1>
				</div>
				<!-- END PAGE TITLE -->
			</div>
			<div class="col-md-12" align="center">
				<div class=card >
				<div class="card-header card-header-text card-header-primary">
					<div class="card-text">
						<h4 class="card-title">엑셀 파일 등록</h4>
					</div>
				</div>
					<form id="excelUpForm" method="post" action="" role="form" enctype="multipart/form-data">
							<div class="row" id="regGoodsImgArea">
								<div class ="card-body">
								<br>
									<p>확장자명 : xlsx,joindata 입력시 날짜 앞에 `넣어서 텍스트 형식으로 입력해야함. <br>
									숫자입력시 숫자를 텍스트로 저장해야함.
									empNo,password,gmailAppKey 필수 입력
									
									<br>
									엑셀업로드 (업로드하고 디비에 INSERT)</p>
									<input id="excel" name="excel" class="file" type="file" multiple data-show-upload="false" data-show-caption="true">
								</div>
							</div>
						<button type="button" id="excelUp" onclick="check()" class="btn btn-primary">등록</button>
					</form>
				</div>
			</div>
			<!-- END container -->
		</div>
		<!-- END CONTENT BODY -->
	</div>
	<!-- END CONTENT -->
	<div id="ajax-content"></div>
</body>
</html>