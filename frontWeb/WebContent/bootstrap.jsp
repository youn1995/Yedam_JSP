<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 화면크기별 넓이를 조절함 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<title>bootstrap.jsp</title>
<style type="text/css">
.container {
	min-height: 500px;
}

div {
	border: 1px solid blue;
}

.card {
	display: inline-block;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<a href="#" class="btn btn-outline-danger">링크 <span
				class="badge badge-light">4</span></a> <span
				class="btn btn-outline-danger">스펜 <span
				class="badge badge-info">4</span></span>
			<button class="btn btn-outline-danger">
				버튼 <span class="badge badge-warning">4</span>
			</button>
		</div>
		<div>
			<div class="card" style="width: 13rem;">
				<img src="images/Koala.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
			<div class="card" style="width: 13rem;">
				<img src="images/Police_Car_-_Fast.jpg" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
			<div class="card" style="width: 13rem;">
				<img src="images/Desert.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		</div>
		<div class="alert alert-primary" role="alert">
			A simple primary alert—check it out! <a href="#" class="alert-link">an
				example link</a>
		</div>
		<div class="row no-gutters">
			<div class="col-2">로고</div>
			<div class="col-8">메뉴</div>
		</div>
		<div class="row row justify-content-center">
			<div class="col-xl-4 col-md-6 col-sm-12">

				<table class="table table-striped table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-xl-4 col-md-6 col-sm-12">
				<form>
					<div class="form-group row">
						<label class="col-3">아이디</label><div class="col-6"><input class="form-control"></div>
					</div>
					<div class="form-group row">
						<label class="col-3">비번+</label><div class="col-6"><input class="form-control"></div>
					</div>
					<div class="form-group row">
						<button class="btn btn-info">등록</button>
					</div>

				</form>
			</div>
		</div>
		<div class="col-xl-4 col-md-12 col-sm-12">
			<button type="button" class="btn btn-primary">
				Notifications <span class="badge badge-light">4</span>
			</button>
		</div>

	</div>

	</div>
</body>
</html>