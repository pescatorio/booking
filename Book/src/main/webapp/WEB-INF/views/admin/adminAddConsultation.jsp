<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ps ps--active-y">
	<!-- Navbar -->
	<nav
		class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
		id="navbarBlur" navbar-scroll="true">
		<div class="container-fluid py-1 px-3">
			<nav aria-label="breadcrumb">
				<h6 class="font-weight-bolder mb-0">相談</h6>
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
	<form action="adminAddConsultationProcess" name="insertForm" id="insertForm"method="post">
		<div class="container-fluid py-4">
			<div class="col-lg-12">
				<div class="card h-100">
					<div class="card-header pb-0 p-3">
						<div class="row">
							<div class="col-6 d-flex align-items-center">
								<h6 class="mb-0">新規作成</h6>
							</div>
							<div class="col-3 text-end">
								<c:choose>
									<c:when test="${empty vo}">
										<input type="submit" class="btn btn-outline-info btn-sm mb-0" value="作成">
									</c:when>
									<c:otherwise>
										<input type="button" class="btn btn-outline-info btn-sm mb-0" onClick="replyBtn('/admin/replyAdminConsultationProgress')" value="返信">
									</c:otherwise>
								</c:choose>
								<a href="adminConsultation"><input type="button" class="btn btn-outline-primary btn-sm mb-0"  value="目次"></a>
								
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
												<th >題目</th>
												<td>
												<c:choose>
													
													<c:when test="${empty vo.title }">
														<input type="text" name="title" style="width:50vw" placeholder="題目">
													</c:when>
													<c:otherwise>
														<input type="text" name="title" style="width:50vw" value="${vo.title }">
													</c:otherwise>
												</c:choose>
												<input type="hidden" name="name" value="admin" style="width:50vw;">
												<input type="hidden" name="passwd" value="1234" style="width:50vw;"></td>
											</tr>
											
											<tr style="min-height: 40vw;">
												<th class="vertical_t">内容
													<c:if test="${!empty vo.grno }">
														<input type="hidden" name="grno" value="${vo.grno}">
														<input type="hidden" name="grgrod" value="${vo.grgrod}">
														<input type="hidden" name="depth" value="${vo.depth }">
													</c:if>
													<p id="content_wordcount">(0 / 500자)</p>
												</th>
												<td colspan="3">
													<textarea name="contents" id="contents" style="width:50vw;height:40vh;"></textarea>	
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

$("#addBtn").click(function(){
	if(nullEmptyCheck("題目",$("[name=title]").val())==false){return false;};
	if(nullEmptyCheck("内容",$("[name=contents]").val())==false){return false;};
	$("#insertForm").submit();
});
function replyBtn(url) {
	if(nullEmptyCheck("題目",$("[name=title]").val())==false){return false;};
	if(nullEmptyCheck("内容",$("[name=contents]").val())==false){return false;};
	document.insertForm.action = url;
	document.insertForm.submit();
}
function nullEmptyCheck(id,value){ 
	if( value == "" || value == null || value == undefined ){
		alert(id+"を入力してください");
		return false;
	}else{
		return true;
	}
};
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>