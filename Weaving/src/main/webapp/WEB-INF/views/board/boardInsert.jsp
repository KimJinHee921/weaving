<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
</head>

<script>

function writeCheck()
  {
   var form = document.writeform;
   
  if( !form.title.value )
   {
    alert( "제목을 입력해주세요" );
    form.title.focus();
    return;
   }
	var data = CKEDITOR.instances.editor.getData();
  if( !data )
   {
    alert( "내용을 입력해주세요" );
    return;
   }
 
  form.submit();
  }
  
 </script>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">게시글 등록</h4>
						</div>
					</div>
					<br> <br>
					<div class="card-body">
						<form name="writeform" action="boardInsert" method="post">
							<div class="form-group">
								<label for="usr">제목</label> <input type="text"
									class="form-control" id="title" name="title">
							</div>
							<br>
							<textarea name="boardContents" id="editor" rows="100" cols="80"></textarea>
							<script>
								CKEDITOR.replace('editor');
							</script>
							<br>
							<div style="float: right">
							<button type="button" class="btn btn-primary btn-sm"
								onclick="writeCheck();">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>