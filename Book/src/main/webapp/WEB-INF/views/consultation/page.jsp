<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="section__content">
	<div id="wrapper">
		<h2 class="page_title">相談</h2>
		<div id="upper"></div>
		<div id="contents">
			<div class="cell">
				<div class="data">
					<table class="list" style="width:90vw;">
						<colgroup>
							<col style="width: 20%;">
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<th>title</th>
								<th>writer</th>
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
											<td colspan='7' align="center" style="width:80vw;">consultation is empty</td>
										</tr>
									</c:when>
									<c:when test="${vo.delete_flag == '1'}">
										<tr>
											<td>
											
											<c:if test="${vo.depth>0 }">
												<c:forEach var='i' begin='0' end='${vo.depth-1 }'>
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
													  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
													</svg>
												</c:forEach>
											</c:if>
											deleted</td> 
											<td><c:out value="${vo.name}"/></td>
											<td>deleted</td>
											<td><c:out value="${vo.created_at}"/></td>
											<td><c:out value="${vo.updated_at}"/></td>
											<td><c:out value="${vo.build_code}"/></td>
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
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
												  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
												</svg>
											</a></td>
											<td><c:out value="${vo.name}"/>
											<c:if test="${today <= vo.created_at}"><i class="fas fa-plus-square" style="color:#272b2b;"></i></c:if>
											<p style="font-weight:bold;"><i class="fas fa-lock" style="color:#272b2b;"></i></p></td>
											<td><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
												  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
												</svg></td>
											<td><c:out value="${vo.created_at}"/></td>
											<td><c:out value="${vo.updated_at}"/></td>
											<td><c:out value="${vo.build_code}"/></td>
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
											</a><p style="font-weight:bold;"><i class="fas fa-lock" style="color:#272b2b;"></i></p></td>
											<td><c:out value="${fn:substring(vo.contents, 0, 100)}"/></td>
											<td><c:out value="${vo.created_at}"/></td>
											<td><c:out value="${vo.updated_at}"/></td>
											<td><c:out value="${vo.build_code}"/></td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div id="paginationbox">
				<nav style="display: table-cell; vertical-align:middle;">
					<ul class="pagination centered">
						<c:if test="${pageNavi.prev}">
							<li onClick="javascript:page(${pageNavi.startPage-1});"><a
								href="#" tabindex="-1">&lt;</a></li>
						</c:if>
						<c:forEach begin="${pageNavi.startPage }"
							end="${pageNavi.endPage }" var="page">
							<c:choose>
								<c:when test="${page eq pageNavi.cri.pageNo }">
									<li onClick="page(${page })"><a href="#" style="background-color: #A19AFD;">${page }</a></li> 
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

			<form method=get action=/consultation/page name=listForm>
				<input type=hidden name=no> <input type=hidden
					name=pageNo value=${pageNavi.cri.pageNo }>
				<div class="form-inline">
					<select class="form-control" name=type>
						<option value='title'	<c:if test="${pageNavi.cri.type == 'title'}">selected</c:if>>title</option>
						<option value='contents' <c:if test="${pageNavi.cri.type == 'contents'}">selected</c:if>>contents</option>
					</select> 
					<input class="form-control" list="searchList" name=keyword value=${pageNavi.cri.keyword }>
						<datalist id="searchList">
						  <option value="room" label="room">
						  <option value="event" label="event">
						  <option value="travel info" label="travel info">
						</datalist>
					<button type="submit" onClick="page(1)">search</button>
					<a href="./addConsultation"><input type="button" value="新規作成"></a>
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
if('${resMsg}' != ''){
	alert('${resMsg}');	
}
function page(page){
	document.listForm.action="/consultation/page";
	document.listForm.pageNo.value=page;
	document.listForm.submit();
	
}
function detail(no){
	document.listForm.action="/consultation/detail";
	document.listForm.no.value=no;
	document.listForm.submit();
}
</script>