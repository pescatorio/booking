
<main
	class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ps ps--active-y">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Navbar -->
	<nav
		class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
		id="navbarBlur" navbar-scroll="true">
		<div class="container-fluid py-1 px-3">
			<nav aria-label="breadcrumb">
				<h6 class="font-weight-bolder mb-0">予約</h6>
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
	<div class="container-fluid py-4">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-xl-12 mb-xl-0 mb-4">
						<div class="card bg-transparent shadow-xl">
							<div class="overflow-hidden position-relative border-radius-xl">
								<span class="mask bg-gradient-dark"></span>
								<div class="card-body position-relative z-index-1 p-3">
									<i class="fas fa-wifi text-white p-2" aria-hidden="true"></i>
									<h5 class="text-white mt-4 mb-5 pb-2">相談内容1</h5>
								</div>
								<div class="card-body position-relative z-index-1 p-3">
									<i class="fas fa-wifi text-white p-2" aria-hidden="true"></i>
									<h5 class="text-white mt-4 mb-5 pb-2">相談内容2</h5>
									<div class="d-flex">
										<div class="d-flex">
											<div class="me-4"></div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	<div class="col-lg-12">
		<div class="card h-100">
			<div class="card-header pb-0 p-3">
				<div class="row">
					<div class="col-6 d-flex align-items-center">
						<h6 class="mb-0">予約</h6>
					</div>
					<div class="col-6 text-end">
						<button class="btn btn-outline-primary btn-sm mb-0">予約処理</button>
					</div>
				</div>
			</div>
			<div class="card-body p-3 pb-0">
				<ul class="list-group">
					<li
						class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
						<h6 class="text-dark mb-1 font-weight-bold text-sm">no</h6>
						<div class="d-flex flex-column">
							<h6 class="mb-1 text-dark font-weight-bold text-sm">Room</h6>
							<select name="room_no">
								<option value="701">701</option>
								<option value="702">702</option>
								<option value="703">703</option>
								<option value="704">704</option>
								<option value="705">705</option>
								<option value="706">706</option>
							</select>
						</div>

					</li>
					<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">name</h6>
							<input type="text" name="name" style="width:15vw;" placeholder="name">
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">phone</h6>
							<input type="tel" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
							<small>Format: 123-456-7890</small>
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">成人</h6>
							<input type="number" name="adult">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">子供</h6>
							<input type="number" name="child">
						</div>
					</li>
					<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">Check-In</h6>
							<input type="date" name="start_date" >
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">Check-Out</h6>
							<input type="date" name="end_date" >
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">Options</h6>
							<select name="options">
								<option value="1">1</option>
							</select>
							<h6 class="text-dark mb-1 font-weight-bold text-sm">総額</h6>
							<input type="number" name="total_cost" readonly>
						</div>
					</li>
					<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">銀行名</h6>
							<input type="text" name="bank_name" style="width:15vw;" placeholder="銀行名">
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">支店番号</h6>
							<input type="text" name="bank_branch_code" placeholder="支店番号">
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">口座番号</h6>
							<input type="text" name="bank_account_number" placeholer="口座番号">
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</div>
</main>