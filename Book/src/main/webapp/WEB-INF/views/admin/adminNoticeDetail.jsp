<main
	class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ps ps--active-y">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#contents').on(
					'keyup',
					function() {
						$('#content_wordcount').html(
								"(" + $(this).val().length + " / 500자)");
						if ($(this).val().length > 500) {
							$(this).val($(this).val().substring(0, 500));
							$('#content_wordcount').html("(500 / 500자)");
							alert("글자수가 초과했습니다.");
						}
					});
			if ('${resMsg}' != '') {
				alert('${resMsg}');
			}
		});

		
		function deleteBtn(no){
			if(${vo.delete_flag }==0){
				if(window.confirm("本当に削除しますか")){
					document.updateForm.action="/admin/adminDeleteNotice";
					document.updateForm.submit();
				}
			}else if(${vo.delete_flag }==1){
				if(window.confirm("本当に活性化しますか")){
					document.updateForm.action="/admin/adminDeleteNotice";
					document.updateForm.submit();
			}
		}
	}
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
	<form action="adminUpdateNoticeProcess" name="updateForm" method="post">
		<div class="container-fluid py-4">
			<div class="col-lg-12">
				<div class="card h-100">
					<div class="card-header pb-0 p-3">
						<div class="row">
							<div class="col-6 d-flex align-items-center">
								<h6 class="mb-0">修正</h6>
								
							</div>
							<div class="col-3 text-end">
								<a href="adminNotice"><input type="button" class="btn btn-outline-primary btn-sm mb-0"  value="目次"></a>
								<c:if test="${vo.delete_flag=='0' }">
								<input type="button" class="btn btn-outline-secondary btn-sm mb-0" onclick="deleteBtn(${vo.no})" value="削除"></c:if>
								<c:if test="${vo.delete_flag=='1' }">
								<input type="button" class="btn btn-outline-secondary btn-sm mb-0" onclick="deleteBtn(${vo.no})" value="活性化"></c:if>
								<input type="submit" class="btn btn-outline-info btn-sm mb-0" value="修正">
							</div>
						</div>
					</div>
					<div class="card-body p-3 pb-0">
						<ul class="list-group">
							<li
								class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
								<div class="d-flex flex-column">
									<table class="view">
										<colgroup>
											<col style="width: 25vw;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th class="nboardGet_th">No</th>
												<td><input type="text" name="no" value="${vo.no}"style="width:50vw;" readonly>
												<input type="hidden" name="delete_flag" value="${vo.delete_flag }"></td>
											</tr>
											<tr>
												<th class="nboardGet_th">題目</th>
												<td><input type="text" name="title" value="${vo.title}" style="width:50vw;"></td>
											</tr>
											<tr>
												<th class="nboardGet_th">作成日/修正日</th>
												<td><input type="text" value="${vo.created_at}/${vo.updated_at}" style="width:50vw" readonly>
												<input type="hidden" name="created_at" value="${vo.created_at}">
												<input type="hidden" name="updated_at" value="${vo.created_at}"></td>
											</tr>
											<tr style="min-height: 40vw;">
												<th class="vertical_t">内容
													<p id="content_wordcount">(0 / 500자)</p>
												</th>
												<td colspan="3">
													<textarea name="contents" id="contents" style="width:50vw;height:40vh;"><c:out value="${vo.contents}" /></textarea>	
												</td>
											</tr>
										</tbody>
									</table>
								</div> <!-- /.panel-body -->
							</li>
						</ul>
					</div>
					<!-- /.panel -->
				</div>
				<!-- col-lg-12 -->
			</div>
			<!-- row -->
			<!-- Heading -->

		</div>
		<!-- nboard-wrapper -->
	</form>
	
	<form method="get" name="detailForm">
		<input type="hidden" name="no" value="${vo.no}"> 
		<input	type="hidden" name="pageNo" value="${criteria.pageNo}"> 
		<input　type="hidden" name="keyword" value="${criteria.keyword}">
	</form>
</main>