<main
	class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ps ps--active-y">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://code.jquery.com/jquery-latest.js"></script>

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
	<div class="container-fluid py-4">
		<div class="col-lg-12">
			<div class="card h-100">
				<div class="card-header pb-0 p-3">
					<div class="row">
						<div class="col-6 d-flex align-items-center">
							<h6 class="mb-0">相談</h6>
						</div>
						<div class="col-6 text-end">
							<a href="/admin/adminAddConsultation"><button
									class="btn btn-outline-primary btn-sm mb-0">新規作成</button></a>
						</div>
					</div>
				</div>
				<div class="card-body p-3 pb-0">
					<div class="row">
						<form name="roomInfoForm" action=>
							<ul class="list-group">
								<li class="list-group-item border-0 border-radius-lg">
									<div class="d-flex flex-column">
										<table class="list">
											<colgroup>
												<col style="width: 30%;">
												<col style="width: 15%;">
												<col style="width: 35%;">
												<col style="width: 15%;">
												<col style="width: auto;">
											</colgroup>
											<thead>
												<tr>
													<th>title</th>
													<th>writer</th>
													<th>contents</th>
													<th>created_at</th>
													<th>updated_at</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="vo" items="${list}">
													<c:choose>
														<c:when test="${vo.delete_flag == '1'}">
															<tr class="odd gradeX">
																<td colspan='7' align="center" style="width: 80vw;"></td>
															</tr>
															<tr>
																<td onClick=detail("${vo.no}")>
																	<c:if test="${vo.depth>0 }">
																		<c:forEach var="i" begin="0" end="${vo.depth-1 }">
																			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
																			  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
																			  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
																			</svg>
																		</c:forEach>
																	</c:if>
																	<a href="#">
																		<c:out value="${vo.title}"/>
																		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
																		  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
																		  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
																		</svg>
																	</a>
																</td>
																<td><c:out value="${vo.name }"/></td>
																<td><c:out value="${fn:substring(vo.contents, 0, 100)}"/></td>
																<td><c:out value="${vo.created_at}"/></td>
																<td><c:out value="${vo.updated_at}"/></td>
															</tr>
														</c:when>
														<c:when test="${vo.lock_flag == '1'}">
															<tr>
																<td onClick=detail("${vo.no}")>
																	<c:if test="${vo.depth>0 }">
																		<c:forEach var='i' begin='0' end='${vo.depth-1 }'>
																			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
																			  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
																			</svg>
																		</c:forEach>
																	</c:if>
																	<a href="#">
																	<c:out value="${vo.title}"/>
																		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
																		  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
																		</svg>
																	</a></td>
																<td><c:out value="${vo.name}"/>
																<c:if test="${today <= vo.created_at}"><i class="fas fa-plus-square" style="color:#272b2b;"></i></c:if>
																</td>
																<td><c:out value="${fn:substring(vo.contents, 0, 100)}"/></td>
																<td><c:out value="${vo.created_at}"/></td>
																<td><c:out value="${vo.updated_at}"/></td>
															</tr>
														</c:when>
														<c:when test="${vo.delete_flag == '0' && vo.lock_flag == '0'}">
															<tr>
																<td onClick=detail("${vo.no}")>
																<c:if test="${vo.depth>0 }">
																	<c:forEach var='i' begin='0' end='${vo.depth-1 }'>
																		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
																		  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
																		</svg>
																	</c:forEach>
																</c:if>
																<a href="#"><c:out value="${vo.title}"/>
																<td><c:out value="${vo.name}"/></td>
																<c:if test="${today <= vo.created_at}"><i class="fas fa-plus-square" style="color:#272b2b;"></i></c:if>
																</a></td>
																<td><c:out value="${fn:substring(vo.contents, 0, 100)}"/></td>
																<td><c:out value="${vo.created_at}"/></td>
																<td><c:out value="${vo.updated_at}"/></td>
															</tr>
														</c:when>			
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
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<script type="text/javascript">
if('${resMsg}' != ''){
	alert('${resMsg}');	
}
function page(page){
	document.listForm.action="/admin/adminConsultation";
	document.listForm.pageNo.value=page;
	document.listForm.submit();
	
}
function detail(no){
	document.listForm.action="/admin/adminConsultationDetail";
	document.listForm.no.value=no;
	document.listForm.submit();
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