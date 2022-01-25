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
function listBtn(url) {
	document.detailForm.action = url;
	document.detailForm.submit();
}

</script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<section class="section__content">
${vo}
	<div id="nboard_upper"></div>
	<div id="nboard-wrapper">
		<h2 class="page_title">お知らせ</h2>
		<div class="contents">
			<div class="default_cell">
				<div class="table_data">
					<table class="view">
						<colgroup>
							<col style="width: 25vw;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<c:choose>
								<c:when
									test="${vo.delete_flag=='1'}">
									<tr>
										<th class="nboardGet_th">No</th>
										<td>${vo.no}</td>
									</tr>
									<tr>
										<th class="nboardGet_th">題目</th>
										<td>非公開</td>
									</tr>
									<tr>
										<th class="nboardGet_th">作成日/修正日</th>
										<td>${vo.created_at}/${vo.updated_at}</td>
									</tr>
									<tr style="min-height: 40vw;">
										<th class="nboardGet_th">内容</th>
										<td>非公開</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th class="nboardGet_th">No</th>
										<td>${vo.no}</td>
									</tr>
									<tr>
										<th class="nboardGet_th">題目</th>
										<td>${vo.title}</td>
									</tr>
									<tr>
										<th class="nboardGet_th">作成日/修正日</th>
										<td>${vo.created_at} / ${vo.updated_at}</td>
									</tr>
									<tr style="min-height: 40vw;">
										<th class="vertical_t">내용
											<p id="content_wordcount">(0 / 500자)</p>
										</th>
										<td colspan="3">
											<div class="request_data" style="white-space:pre;line-height: 32px;"><c:out value="${vo.contents}"/></div>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<p class="btn_pop_page">
						<button class="notice_button_gray"
							onClick="listBtn('/notice/list')">目次</button>
					</p>
					<form method="get" name="detailForm">
						<input type="hidden" name="no" value="${vo.no}">
						<input type="hidden" name="pageNo" value="${criteria.pageNo}">
						<input　type="hidden" name="keyword" value="${criteria.keyword}">
					</form>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- col-lg-12 -->
	</div>
	<!-- row -->
	<!-- Heading -->

	</div>
	<!-- nboard-wrapper -->

</section>