<jsp:useBean id="now" class="java.util.Date" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<section class="section__content">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
	<div id="wrapper">
		<h2 class="page_title">お知らせ</h2>
		<div id="upper"></div>
		<div id="contents">	
			<div class="default_cell">
				<div class="table_data">
					<table class="list">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 15%;">
							<col style="width: 30%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
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
											<td colspan='7' align="center" style="width:80vw;">notice is empty</td>
										</tr>
									</c:when>
									<c:when test="${vo.delete_flag == '1'}">
										<tr>
											<td><c:out value="${vo.no}"/></td>
											<td>deleted</td> 
											<td>deleted</td>
											<td><c:out value="${vo.created_at}"/></td>
											<td><c:out value="${vo.updated_at}"/></td>
											<td><c:out value="${vo.build_code}"/></td>
										</tr>
									</c:when>
									<c:when test="${vo.delete_flag == '0'}">
										<tr>
											<td><c:out value="${vo.no}"/></td>
											<td onClick=detail("${vo.no}")><a href="#"><c:out value="${vo.title}"/>
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
		</div>
	</div>
	
<script type="text/javascript">
if('${resMsg}' != ''){
	alert('${resMsg}');	
}
function page(page){
	document.listForm.action="/notice/list";
	document.listForm.pageNo.value=page;
	document.listForm.submit();
	
}
function detail(no){
	document.listForm.action="/notice/detail";
	document.listForm.no.value=no;
	document.listForm.submit();
}
</script>