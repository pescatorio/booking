<jsp:useBean id="now" class="java.util.Date" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#contents').on(
	'keyup',
	function() {
		$('#content_wordcount').html(
				"(" + $(this).val().length + " / 500자)");
		if ($(this).val().length > 500) {
			$(this).val($(this).val().substring(0, 500));
			$('#content_wordcount').html(
					"(500 / 500자)");
			alert("글자수가 초과했습니다.");
		}
	});
});

if('${resMsg}' != ''){
	alert('${resMsg}');	
}

</script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<section class="section__content">
	<form action="addConsultationProcess" method="post">
		<div class="container-fluid py-4">
		<div class="col-lg-12">
			<div class="card h-100">
				<div class="card-header pb-0 p-3">
					<div class="row">
						<div class="col-10 d-flex align-items-center">
							<h6 class="mb-0">新規作成</h6>
						</div>
						<div class="col-2 align-items-right">
							<input type="submit" class="btn btn-outline-info btn-sm mb-0" value="作成">
						</div>
					</div>
				</div>
				<div class="card-body p-3 pb-0">
					<ul class="list-group">
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 text-sm">題目</h6>
								<input type="text" name="title" style="width:15vw;" placeholder="題目">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 text-sm">作成者</h6>
								<input type="text" name="name" style="width:15vw;" placeholder="作成者">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 text-sm">暗証番号</h6>
								<input type="password" name="passwd" style="width:15vw;" placeholder="暗証番号">
							</div>
						</li>
						<li	class="list-group-item border-0  justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark font-weight-bold text-sm">内容</h6>
								<input type="hidden" name="grgrod" value="0">
								<input type="hidden" name="depth" value="0">
								<textarea rows="20vh" cols="90vw" name="contents"></textarea>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		</div>
	</form>

</section>