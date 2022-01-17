<jsp:useBean id="now" class="java.util.Date" />
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
<section class="section__content">
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
	<div id="nboard-wrapper">
		<h2 class="page_title">NOTICE</h2>
		<div id="nboard_upper"></div>
		<div id="contents">
			<div class="default_cell">
				<div class="">
					<button type="button" class="registerBtn"
						onclick="location.href='/notice/register'">register</button>
				</div>
				<div class="table_data">
					<table class="list">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 15%;">
							<col style="width: 30%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th>title</th>
								<th>contents</th>
								<th>build_code</th>
								<th>created_at</th>
								<th>updated_at</th>
								<th>build_code</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
								<c:choose>
									<c:when test='${vo.size() == 0 }'>
										<tr class="odd gradeX">
											<td colspan='7' align="center" style="width:80vw;">notice is empty</td>
										</tr>
									</c:when>
									<c:when test="${vo.deleteFlag=='1'}">
										<tr>
											<td><c:out value='${vo.title}'/></td>
											<td>deleted</td> 
											<td>deleted</td>
											<td><c:out value="${vo.buildCode}"/></td>
											<td><c:out value="${vo.createdAt}"/></td>
											<td><c:out value="${vo.updatedAt}"/></td>
										</tr>
									</c:when>
									<c:when test="${vo.deleteFlag == '0'}">
										<tr>
											<td><c:out value="${vo.title}"/></td>
											<td onClick=detail("${vo.no}")><a href="#"><c:out value="${vo.title}"/>
											<c:if test="${today <= vo.createdAt}"><i class="fas fa-plus-square" style="color:#272b2b;"></i></c:if>
											</a><p style="font-weight:bold;"><i class="fas fa-lock" style="color:#272b2b;"></i></p></td>
											<td><c:out value="${vo.contents}"/></td>
											<td><c:out value="${vo.buildCode}"/></td>
											<td><c:out value="${vo.createdAt}"/></td>
											<td><c:out value="${vo.updatedAt}"/></td>
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

			<form method=get action=/notice/list name=listForm>
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
				</div>
			</form>
		</div>
	</div>