<main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ps ps--active-y">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	<script type="text/javascript">
	$(function() {
	    $('#created_at').val(new Date().toDateInputValue());
	});
	
	Date.prototype.toDateInputValue = (function() {
	    var local = new Date(this);
	    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
	    return local.toJSON().slice(0,10);
	});
	</script>
	
	
	<!-- Navbar -->
	<nav
		class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
		id="navbarBlur" navbar-scroll="true">
		<div class="container-fluid py-1 px-3">
			<nav aria-label="breadcrumb">
				<h6 class="font-weight-bolder mb-0">お知らせ</h6>
			</nav>
			<div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4"
				id="navbar">
				<div class="ms-md-auto pe-md-3 d-flex align-items-center">
					<div class="input-group"></div>
				</div>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	<form action="addNoticeProcess" method="post">
		<div class="container-fluid py-4">
		<div class="col-lg-12">
			<div class="card h-100">
				<div class="card-header pb-0 p-3">
					<div class="row">
						<div class="col-6 d-flex align-items-center">
							<h6 class="mb-0">新規作成</h6>
						</div>
						<div class="col-6 text-end">
							<button class="btn btn-outline-primary btn-sm mb-0">作成</button>
						</div>
					</div>
				</div>
				<div class="card-body p-3 pb-0">
					<ul class="list-group">
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">題目</h6>
								<input type="text" name="title" style="width:15vw;" placeholder="題目">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">作成日</h6>
								<input type="date" name="created_at" id="created_at" readonly>
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">建物番号</h6>
								<input type="number" name="build_code" value="7" readonly>
							</div>
						</li>
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">内容</h6>
								<textarea rows="20vh" cols="90vw" name="contents"></textarea>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		</div>
	</form>
</main>