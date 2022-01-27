<jsp:useBean id="now" class="java.util.Date" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<section class="section__content">
	<form action="modifyConsultationProcess" method="post" name="updateForm">
		<div class="container-fluid py-4">
		<div class="col-lg-12">
			<div class="card h-100">
				<div class="card-header pb-0 p-3">
					<div class="row">
						<div class="col-10 d-flex align-items-center">
							<h6 class="mb-0">新規作成</h6>
						</div>
						<div class="col-2 align-items-right">
							<input type="submit" class="btn btn-outline-info btn-sm mb-0" value="修正">
							<input type="hidden" name="lock_flag">
							<c:choose>
							<c:when test="${vo.lock_flag == '0'}">
								<input type="button" class="btn btn-outline-secondary btn-sm mb-0" onclick="lockConsultationBtn(${vo.no})" value="ロックする">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-outline-secondary btn-sm mb-0" onclick="lockConsultationBtn(${vo.no})" value="ロックしない">
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
								<input type="text" name="title" style="width:15vw;" placeholder="題目" value="${vo.title }">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 text-sm">作成者</h6>
								<input type="text" name="name" style="width:15vw;" placeholder="作成者" value="${vo.name }" readonly>
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 text-sm">作成日/修正日</h6>
								<input type="text" name="passwd" style="width:15vw;" value="${vo.created_at}/${vo.updated_at}">
							</div>
						</li>
						<li	class="list-group-item border-0  justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark font-weight-bold text-sm">内容</h6>
								<input type="hidden" name="grgrod" value="0">
								<input type="hidden" name="depth" value="0">
								<textarea rows="20vh" cols="90vw" name="contents">${vo.contents}</textarea>
								
								<input type="hidden" name="no" value="${vo.no}" />
								<input type="hidden" name="pageNo" value="${criteria.pageNo}" />
								<input type="hidden" name="keyword" value="${criteria.keyword}" />
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

function lockConsultationBtn(no){
	if(${vo.lock_flag } == '0'){
		if(window.confirm("本当にロックしますか")){
			document.updateForm.action="/consultation/lockFlagConsultationProcess";
			document.updateForm.lock_flag.value='1';
			document.updateForm.submit();
		}
	}else{
		if(window.confirm("本当に活性化しますか")){
			document.updateForm.action="/consultation/lockFlagConsultationProcess";
			document.updateForm.lock_flag.value='0';
			document.updateForm.submit();
		}
	}
}
</script>