
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
<div class="col-xl-4 col-lg-5 col-md-6 d-flex flex-column mx-auto">
	<div class="card card-plain mt-8">
		<div class="card-header pb-0 text-left bg-transparent">
			<h3 class="font-weight-bolder text-info text-gradient">Login</h3>
		</div>
		<div class="card-body">
			<form role="form" action="/login/loginProcess" method="post">
				<label>id</label>
				<div class="mb-3">
					<input type="text" class="form-control" placeholder="id" name="id"
						aria-label="id" aria-describedby="id-addon">
				</div>
				<label>Password</label>
				<div class="mb-3">
					<input type="password" class="form-control" placeholder="Password" name="password"
						aria-label="Password" aria-describedby="password-addon">
				</div>
				<div class="text-center">
					<button type="submit" class="btn bg-gradient-info w-100 mt-4 mb-0">Sign
						in</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>