<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="empInfo" value="${emp}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Insert title here</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- ckeditor 스크립트 -->
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
<style>
#approval-table th{
	background-color: #f9f9f9;
	height: 40px;
	width: 116px;
	vertical-align: middle; 
	text-align: center;
}

#approval-table .stamp{
	display: table-cell;
	height:80px;
	width: 116px;
	vertical-align: middle; 
	text-align: center;	
}
</style>
<script>
//jquery작업
$(function(){
	/*
	userList();
	userSelect();
	userDelete();
	userUpdate();
	userInsert();	
	
	loadDocs();
	selectDoc();

	



	loadDocs();
	init();
	*/
	selectDocForm();
	selectSecureLevel();
	toLeftMove();
	toRightMove();
	makeApprovalListTable();
	
	docInsert();
	
	init();
});

function init() {
$("input[name=empNo]").val('${empInfo.empNo}');
console.log("cc");

console.log(${empInfo.empNo});
}

function docInsert() {
	/*
	$("#").on('click', function() {
		
	});
	*/
}

function selectDocForm() {
	$('.dropdown1').on('click', '.dropdown-menu button', function (e) {
		var formTagClass = $(this).attr('id');
		var $formTag = $('.'+formTagClass).clone();
		$('#write-select').text($(this).text());
		CKEDITOR.instances.docContents.setData($formTag.html());
		$('input[name=docType]').val($(this).text());
		$formTag.show();
	});
}
 
function selectSecureLevel() {
	$('.dropdown2').on('click','.dropdown-menu button', function(e) {
		$('#dropdownMenu2').text($(this).text());
		$('input[name=secureLevel]').val($(this).text().split('등급')[0]);
	});
}


function makeApprovalListTable() {
	$('.modal-footer').on('click', '#rs-approval-list', function() {
		
		var approvalEmp = $('#approvalList option');
		var empCnt = approvalEmp.length;
		var tb = "";
		
		var DataArray = new Array();
		
		if (empCnt > 0) {	
			$('.approval-line').empty();
			
			var tb = "<table id='approval-table' border='1' bordercolor='#cdcdcd'>"+
						"<tr>" +
							"<th rowspan='2' scope='col'>"+
								"<div style='height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;'>"+
									"결재"+
								"</div>"+
							"</th>"+
							"<th scope='col' class='team name' data-order='1' data-empNo='${position}'>${empName}</td>";
			var writerData = {
					'empNo' : '${empInfo.empNo}',
					'approvalOrder' : '1',
					'status': 'DONE'
			};								

			DataArray.push(writerData);
			for (var i = 0; i < empCnt; i++) {
				var ApprovalData = {};
				var str = approvalEmp[i].text.split('(');
				
				tb +="<th scope='col' class='team name' data-order='" + (i + 2) + "' data-empNo='"+approvalEmp[i].value+"'>"+str[0]+"</th>";
				console.log(approvalEmp[i].value);
				ApprovalData['empNo'] = approvalEmp[i].value;
				ApprovalData['approvalOrder'] = ''+(i + 2)+'';
				ApprovalData['status'] = 'wait';
				
				DataArray.push(ApprovalData);
			}
			
			
			tb += "</tr>"+
				  "<tr>" +
				  	"<td class='stamp'>승인</td>";
			for (var i = 0; i < empCnt; i++) {
				tb += "<td class='stamp'></td>";
			}
			tb +="</tr>"+
				 "</table>";
			$('.approval-line').append(tb);
		
			var jsonString = JSON.stringify(DataArray);
		    var jsonData = JSON.parse(jsonString);
		    //var jsonData = JSON.parse(DataArray);
		    //console.log(DataArray); 
		   $("input[name=approvalList]").val(jsonString);
		}
		
		
    	$('#approvalLineModel').modal('hide');
	});

	
}

function toLeftMove() {
	$('table').on('click', '#toLeft', function() {
		//empList, approvalList
		var index = $('#approvalList option').index($('#approvalList option:selected'));
		var chooseEmp = $('#approvalList option:selected');
		
		if (chooseEmp.length == 0) {
			alert("직원을 선택하세요");
		} else {
			chooseEmp.remove();	
			$('#empList').append(chooseEmp);
		}
	});
}

function toRightMove() {
	$('table').on('click', '#toRight', function() {
		//empList, approvalList
		var index = $('#empList option').index($('#empList option:selected'));
		var chooseEmp = $('#empList option:selected');
		
		if (chooseEmp.length == 0) {
			alert("직원을 선택하세요");
		} else {
			chooseEmp.remove();	
			$('#approvalList').append(chooseEmp);
		}
	});
}
/*
	//결재폼 호출
	function loadDocs() {
		$.ajax({
			url:'users/'+id,  
			type:'DELETE',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr, status, msg){
				console.log("상태값 :" + status + " Http에러메시지 :"+msg);
			}, success:function(xhr) {
				console.log(xhr.result);
				//userList();
			}
		});  		
	}//loadDocs
	
$("#dropdownMenuButton")
*/
	//문서 선택 요청 삭제 요청
	/*
	function selectDoc() {
		//삭제 버튼 클릭

		$('body').on('click','#btnDelete',function(){
			var id = $(this).closest('tr').find('#hidden_id').val();
			var result = confirm(id +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'users/'+id,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						userList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	*/
</script> 
</head>
<body>
${empInfo.empNo} : ${empName}
<div class="col-md-12">
	<div class="card">
	    <div class="card-header card-header-text card-header-primary">
	      <div class="card-text">
	        <h4 class="card-title">문서 작성하기</h4>
	      </div>
	    </div>
	    

	    <div class="card-body">
			<h3><small class="text-muted">기본 설정</small></h3>
				    			
			<table class="table">
			    <tbody>
			        <tr>
			            <td class="text-center">기안자</td>
			            <td colspan="3">${empName}</td>
			        </tr>
			        <tr>
			            <td class="text-center">문서종류</td>
			            <td>
							<div class="dropdown1">
								<button class="btn btn-secondary dropdown-toggle" type="button" id="write-select" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							      	선택
								</button>
								
								<div class="dropdown-menu" aria-labelledby="write-select">
									<c:forEach items="${list}" var="formList" >
										<button class="dropdown-item" id="docForm${formList.formId}" type="button">${formList.formName}</button>
						  				<div class="docForm${formList.formId}" style="display:none;">
						  					${formList.formContents}
								  		</div>										
    								</c:forEach>																	
								</div>
								<!-- Button trigger modal -->
								<small><a href="#0" class="card-link" data-toggle="modal" data-target="#exampleModalLong">미리보기</a></small>
							</div>
										            
							<!-- Modal -->
							<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							        <button type="button" class="btn btn-primary">Save changes</button>
							      </div>
							    </div>
							  </div>
							</div>							
							
									
			            </td>
			        	<td class="text-center">보안등급</td>
			        	<td>
							<div class="dropdown2">
								<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							      	보안등급
								</button>
								
								<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
									<button class="dropdown-item" type="button">S등급</button>
									<button class="dropdown-item" type="button">A등급</button>
									<button class="dropdown-item" type="button">B등급</button>
									<button class="dropdown-item" type="button">C등급</button>
								</div>
							</div>	
			        	</td>			            
			        </tr>			        
			    </tbody>
			</table>
			<div class="approval-line-title">
				<h3 style="display:inline;"><small class="text-muted">결재선</small></h3>
				<small><a href="#0" class="card-link" data-toggle="modal" data-target="#approvalLineModel">결제선설정</a></small>
    		</div>
			<div class="approval-line">결재선 설정되면 노출됩니다.
			</div>	    
			<!-- modal 페이지 -->
			<div class="modal fade bd-example-modal-lg" id="approvalLineModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h5 class="modal-title card-title">결제자 설정</h5>
			      </div>
			      <div class="modal-body">
					<table class="table" border="0">
					    <thead>
							<tr>
					            <th>직원 목록</th>
					            <th></th>
					            <th>결재자</th>
					        </tr>
					    </thead>
					    <tbody>
					        <tr>
					            <td rowspan="2">
									<select id="empList" size="7" style="width:200px;">
										<c:forEach items="${empList}" var="empList">
									    	<a class="dropdown-item" href="#">${formList.formName}</a>
									    	<option class="order${orderNo}" value="${empList.empNo}">${empList.empName}(${empList.deptName})
									    </c:forEach>					
									</select>					            
					            </td>
					            <td style="border:none;"><button type="button" id="toRight" class="btn btn-default .btn-sm"> >> </button></td>
					            <td rowspan="2">
									<select id="approvalList" size="7" style="width:200px;">
									</select>					            
					            </td>
					        </tr>
					        <tr>
					            <td style="border:none;"><button type="button" id="toLeft" class="btn btn-default .btn-sm"> << </button></td>
					        </tr>					        
					    </tbody>
					</table>			      
			      </div>
			      <div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        			<button type="button" id="rs-approval-list" class="btn btn-primary">Save changes</button>			      
			      </div>
			    </div>
			  </div>
			</div>		
		
			<h3><small class="text-muted">상세 입력</small></h3>
			<form action="${pageContext.request.contextPath}/docInsert" method="post">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<label>제목</label>
						</span>
					</div>
					<input type="text" name="docTitle" class="form-control" placeholder="제목을 입력하세요" style="margin-bottom:8px;">
				</div>
				
				<div class="approval-form">
					<textarea name="docContents" id="docContents" rows="10" cols="200">
					</textarea>
					<script>
					    // Replace the <textarea id="editor1"> with a CKEditor
					    // instance, using default configuration.
					    CKEDITOR.replace( 'docContents' );
					</script>
					<input name="docType" type="hidden" value="">				
					<input name="empNo" type="hidden" value="${empInfo.empNo}">
					<input name="secureLevel" type="hidden" value="">
					<input name="approvalList" type="hidden" value="">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>			
	    </div>
	</div>















<div class="docu-detail" id="templateApprovalForm" >
	<div class="print-wrap">
		<h1>샘플</h1>
		<div class="docu-info">
			<div class="after">
				<div class="list">
					<dl>
						<dt>문서 번호</dt>
						<dd></dd>
						<dt>기안 부서</dt>
						<dd>yedam</dd>
						<dt>기안자</dt>
						<dd>이학영</dd>
						<dt>기안 일자</dt>
						<dd>2019-05-23</dd>
						<dt>보존 연한/보안 등급</dt>
						<dd>5년 / C등급</dd>
					</dl>
				</div>
				<div class="approval">
					<h2>결재</h2>
					<table>
						<colgroup><col><col><col><col><col></colgroup>
						<tbody>
							<tr>
								<th scope="col">
								</th>
								<th scope="col">
								</th>
								<th scope="col">
								</th>
								<th scope="col">
								</th>
								<th scope="col">
								</th>
							</tr>
							<tr>
								<td class="stamp">
								</td>
								<td class="stamp">
								</td>
								<td class="stamp">
								</td>
								<td class="stamp">
								</td>
								<td class="stamp">
								</td>
								</tr>
								<tr>
								<td>
								</td>
								<td>
								</td>
								<td>
								</td>
								<td>
								</td>
								<td>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="after second-line">
				<div class="agree no-finance">
					<h2>합의</h2>
					<table>
						<tbody>
							<tr>
								<td>
								</td>
								<td>
								</td>
								<td>
								</td>
								<td>
								</td>
								<td>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="refer">
				<h2>참조</h2>
				<table>
					<caption>참조</caption>
					<tbody>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="docu-contents">
			<h2>샘플</h2>
			<div class="text">
				<p>샘플입니다</p>
			</div>
		</div>
	</div>
</div>















</div>
</body>
</html>