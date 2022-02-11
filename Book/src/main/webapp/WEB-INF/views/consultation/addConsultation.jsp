<jsp:useBean id="now" class="java.util.Date" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<section class="section__content">
	<form action="addConsultationProcess" method="post" name="addConsultationForm">
		<div class="container-fluid py-4">
		<div class="col-lg-12">
			<div class="card h-100">
				<div class="card-header pb-0 p-3">
					<div class="row">
						<div class="col-10 d-flex align-items-center">
							<h6 class="mb-0">新規作成</h6>
						</div>
						<div class="col-2 align-items-right">
							<c:choose>
								<c:when test="${empty vo}">
									<input type="button" class="btn btn-outline-info btn-sm mb-0" id="addBtn" value="作成">
								</c:when>
								<c:otherwise>
									<input type="button" class="btn btn-outline-info btn-sm mb-0" onClick="replyBtn('/consultation/replyConsultationProgress')" value="返信">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="card-body p-3 pb-0">
					<ul class="list-group">
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 text-sm">題目</h6>
								<c:choose>
									<c:when test="${empty vo.title }">
										<input type="text" name="title" style="width:15vw;" placeholder="題目">
									</c:when>
									<c:otherwise>
										<input type="text" name="title" style="width:15vw;" value="${vo.title }">
									</c:otherwise>
								</c:choose>
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
								<c:if test="${!empty vo.grno }">
									<input type="hidden" name="grno" value="${vo.grno}">
									<input type="hidden" name="grgrod" value="${vo.grgrod}">
									<input type="hidden" name="depth" value="${vo.depth }">
								</c:if>
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

$("#addBtn").click(function(){
	if(nullEmptyCheck("題目",$("[name=title]").val())==false){return false;};
	if(nullEmptyCheck("内容",$("[name=contents]").val())==false){return false;};
	document.addConsultationForm.submit();
});

function replyBtn(url) {
	if(nullEmptyCheck("題目",$("[name=title]").val())==false){return false;};
	if(nullEmptyCheck("内容",$("[name=contents]").val())==false){return false;};
	document.addConsultationForm.action = url;
	document.addConsultationForm.submit();
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