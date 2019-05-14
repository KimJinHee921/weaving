<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			aria-controls="navigation-index" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="sr-only">Toggle navigation</span> <span
				class="navbar-toggler-icon icon-bar"></span> <span
				class="navbar-toggler-icon icon-bar"></span> <span
				class="navbar-toggler-icon icon-bar"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end">
			<form class="navbar-form">
				<div class="input-group no-border">
					<input type="text" value="" class="form-control"
						placeholder="Search...">
					<button type="submit" class="btn btn-white btn-round btn-just-icon">
						<i class="material-icons">search</i>
						<div class="ripple-container"></div>
					</button>
				</div>
			</form>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#pablo"> <i
						class="material-icons">dashboard</i>
						<p class="d-lg-none d-md-block">Stats</p>
				</a></li>
				<li class="nav-item dropdown"><a class="nav-link"
					href="http://example.com" id="navbarDropdownMenuLink"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="material-icons">notifications</i> <span
						class="notification">5</span>
						<p class="d-lg-none d-md-block">Some Actions</p>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Mike John responded to your
							email</a> <a class="dropdown-item" href="#">You have 5 new tasks</a>
						<a class="dropdown-item" href="#">You're now friend with
							Andrew</a> <a class="dropdown-item" href="#">Another Notification</a>
						<a class="dropdown-item" href="#">Another One</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link" href="#pablo"
					id="navbarDropdownProfile" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <i
						class="material-icons">person</i>
						<p class="d-lg-none d-md-block">Account</p>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownProfile">
						<a class="dropdown-item" href="#">Profile</a> <a
							class="dropdown-item" href="#">Settings</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Log out</a>
					</div></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- End Navbar -->
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header card-header-primary">
							<h4 class="card-title ">게시판</h4>
							<p class="card-category">Here is a subtitle for this table</p>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
										<th>게시글ID</th>
										<th>작성자ID</th>
										<th>제목</th>
										<th>내용</th>
										<th>작성시간</th>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Dakota Rice</td>
											<td>Niger</td>
											<td>Oud-Turnhout</td>
											<td class="text-primary">$36,738</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Minerva Hooper</td>
											<td>CuraÃ§ao</td>
											<td>Sinaai-Waas</td>
											<td class="text-primary">$23,789</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Sage Rodriguez</td>
											<td>Netherlands</td>
											<td>Baileux</td>
											<td class="text-primary">$56,142</td>
										</tr>
										<tr>
											<td>4</td>
											<td>Philip Chaney</td>
											<td>Korea, South</td>
											<td>Overland Park</td>
											<td class="text-primary">$38,735</td>
										</tr>
										<tr>
											<td>5</td>
											<td>Doris Greene</td>
											<td>Malawi</td>
											<td>Feldkirchen in KÃ¤rnten</td>
											<td class="text-primary">$63,542</td>
										</tr>
										<tr>
											<td>6</td>
											<td>Mason Porter</td>
											<td>Chile</td>
											<td>Gloucester</td>
											<td class="text-primary">$78,615</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
</body>
</html>