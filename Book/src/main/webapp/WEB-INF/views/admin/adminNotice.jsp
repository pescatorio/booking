<main
	class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ps ps--active-y">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
if('${resMsg}' != ''){
	alert('${resMsg}');	
}
function page(page){
	document.listForm.action="/admin/adminNotice";
	document.listForm.pageNo.value=page;
	document.listForm.submit();
	
}
function detail(no){
	document.listForm.action="/admin/adminNoticeDetail";
	document.listForm.no.value=no;
	document.listForm.submit();
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
	<div class="container-fluid py-4">
		<div class="col-lg-12">
			<div class="card h-100">
				<div class="card-header pb-0 p-3">
					<div class="row">
						<div class="col-6 d-flex align-items-center">
							<h6 class="mb-0">お知らせ</h6>
						</div>
						<div class="col-6 text-end">
							<a href="adminAddNotice"><button
									class="btn btn-outline-primary btn-sm mb-0">新規作成</button></a>
						</div>
					</div>
				</div>
				<div class="card-body p-3 pb-0">
					<div class="row">
						<form name="roomInfoForm" action=>
							<ul class="list-group">
								<li	class="list-group-item border-0 d-flex border-radius-lg">
									<div class="d-flex flex-column">
										<table class="list">
											<colgroup>
												<col style="width: 15%;">
												<col style="width: 20%;">
												<col style="width: 35%;">
												<col style="width: 15%;">
												<col style="width: 15%;">
												<col style="width: auto;">
											</colgroup>
											<thead>
												<tr>
													<th>no</th>
													<th>title</th>
													<th>contents</th>
													<th>created_at</th>
													<th>updated_at</th>
													<th>build_code</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="vo" items="${list}">
													<c:choose>
														<c:when test="${empty vo}">
															<tr class="odd gradeX">
																<td colspan='7' align="center" style="width: 80vw;">notice
																	is empty</td>
															</tr>
														</c:when>
														<c:otherwise>
															<tr>
																<td><c:out value="${vo.no}" /></td>
																<td onClick=detail('${vo.no}')><a href="#"><c:out value="${vo.title}" /> 
																	<c:if test="${today <= vo.created_at}">
																			<i class="fas fa-plus-square" style="color: #272b2b;"></i>
																		</c:if> </a>
																	<p style="font-weight: bold;">
																		<i class="fas fa-lock" style="color: #272b2b;"></i>
																	</p></td>
																<td><c:choose>
																		<c:when test="${fn:length(vo.contents) gt 101}">
																			<c:out value="${fn:substring(vo.contents, 0, 100)}">
																			</c:out>
																		</c:when>
																		<c:otherwise>
																			<c:out value="${vo.contents}">
																			</c:out>
																		</c:otherwise>
																	</c:choose></td>
																<td><c:out value="${vo.created_at}" /></td>
																<td><c:out value="${vo.updated_at}" /></td>
																<td style="text-align:center;"><i><c:out value="${vo.build_code}" /></i>
																<input type="hidden" name="delete_flag" value="${vo.delete_flag }"></td>
															</tr>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</li>
							</ul>
						</form>
						<div class="card-body p-3 pb-0">
							<div class="row">
								<div id="pagination-box">
									<nav style="display: table-cell; vertical-align: middle;">
										<ul class="pagination centered">
											<c:if test="${pageNavi.prev}">
												<li onClick="javascript:page(${pageNavi.startPage-1});"><a
													href="#" tabindex="-1">&lt;</a></li>
											</c:if>
											<c:forEach begin="${pageNavi.startPage }"
												end="${pageNavi.endPage }" var="page">
												<c:choose>
													<c:when test="${page eq pageNavi.cri.pageNo }">
														<li onClick="page(${page })"><a href="#"
															style="background-color: antiquewhite;">${page }</a></li>
													</c:when>
													<c:otherwise>
														<li onClick="page(${page })"><a href="#">${page }</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${pageNavi.next}">
												<li onClick="page(${pageNavi.endPage+1});"><a href="#">&gt;</a></li>
											</c:if>
										</ul>
									</nav>
								</div>

								<form method=get action=/admin/adminNotice name=listForm>
									<input type=hidden name=no> <input type=hidden
										name=pageNo value=${pageNavi.cri.pageNo }>
									<div class="form-inline">
										<select class="form-control" name=type>
											<option value='title'
												<c:if test="${pageNavi.cri.type == 'title'}">selected</c:if>>title</option>
											<option value='contents'
												<c:if test="${pageNavi.cri.type == 'contents'}">selected</c:if>>contents</option>
										</select> <input class="form-control" list="searchList" name=keyword
											value=${pageNavi.cri.keyword }>
										<datalist id="searchList">
											<option value="room" label="room">
											<option value="event" label="event">
											<option value="travel info" label="travel info">
										</datalist>
										<button type="submit" onClick="page(1)">search</button>
									</div>
								</form>
							</div>
						</div>
						<div class="card-body p-3 pb-0">
							<div class="row">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>