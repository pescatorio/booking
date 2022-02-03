<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" %>


<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- scroll box -->
<main>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<c:forEach var='imageVo2' items='${imageList }' varStatus="status">
				<li data-target="#carouselExampleIndicators" data-slide-to="${status.count }"></li>
			</c:forEach>
		</ol>
		<div class="carousel-inner"
			style="width: 100%; height: 500px !important;">
			<div class="carousel-item active">
				<img src='../resources/image/image1200X700/4a90f371d000ea46901dfb2633ddd3fb066fb4621134f1486c192f432361efdb.jpg' class="d-block w-100">
			</div>
			<c:forEach var='imageVo' items='${imageList }'>
				<div class="carousel-item ">
					<img src='../resources/image/image1200X700/<c:out value="${imageVo.file_name}"></c:out>' class="d-block w-100">
				</div>
			</c:forEach>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- end of carousal -->


	<div class="b-example-divider"></div>


		<div class="b-example-divider"></div>

		<div class="container col-xl-10 col-xxl-8 px-4 py-5">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			<c:forEach var="rVo" items="${rList}">
        <div class="col">
          <div class="card shadow-sm">
			<img src="../resources/image/image500X500/<c:out value='${rVo.images }'></c:out>" height="150vh" align="middle">			
            <div class="card-body">
            	<i><small style="color: <c:out value='${rVo.color_code }'></c:out>;">部屋番号&nbsp&nbsp&nbsp</small><small><c:out value="${rVo.room_num }">号室</c:out></small></i><br>
            	<small>人数&nbsp&nbsp&nbsp <c:out value='${rVo.max }'></c:out>&nbsp&nbsp&nbsp&nbsp&nbsp
            	成人価格&nbsp&nbsp&nbsp<c:out value='${rVo.adult_cost}'></c:out>&nbsp&nbsp&nbsp&nbsp&nbsp
            	子供価格&nbsp&nbsp&nbsp<c:out value='${rVo.child_cost}'></c:out>
            	</small>　
              <p class="card-text"><c:out value="${rVo.explanation }"></c:out></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="roomInfo/page?"<c:out value="rVo.room_num"></c:out>><button type="button" class="btn btn-sm btn-outline-secondary">要約</button></a>
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
        
      
      
    </div>
  </div>

		<div class="b-example-divider"></div>

		<div class="bg-dark text-secondary px-4 py-5 text-center">
			<div class="py-5">
				<h1 class="display-5 fw-bold text-white">Notices</h1>
				<div class="col-lg-6 mx-auto">
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
								<th>番号</th>
								<th>題目</th>
								<th>内容</th>
								<th>生成日</th>
								<th>修正日</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${nList}">
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
										</tr>
									</c:when>
									<c:when test="${vo.delete_flag == '0'}">
										<tr>
											<td><c:out value="${vo.no}"/></td>
											<td onClick=detail("${vo.no}")><a href="#"><c:out value="${vo.title}"/>
											<c:if test="${today <= vo.created_at}"><i class="fas fa-plus-square" style="color:#272b2b;"></i></c:if>
											</a><p style="font-weight:bold;"><i class="fas fa-lock" style="color:#272b2b;"></i></p></td>
											<td><c:out value="${vo.contents}"/></td>
											<td><c:out value="${vo.created_at}"/></td>
											<td><c:out value="${vo.updated_at}"/></td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<form method=get action=/notice/list name=listForm hidden="true">
				<input type=hidden name=no> <input type=hidden
					name=pageNo value="1">
				<div class="form-inline">
					<select class="form-control" name=type>
						<option value='title'>title</option>
						<option value='contents'>contents</option>
					</select> 
					<input class="form-control" list="searchList" name=keyword value=${pageNavi.cri.keyword }>
					<button type="submit" onClick="page(1)">search</button>
				</div>
			</form>
		<div class="b-example-divider mb-0"></div>
		
		
		<script type="text/javascript">
if('${resMsg}' != ''){
	alert('${resMsg}');	
}
function detail(no){
	document.listForm.action="/notice/detail";
	document.listForm.no.value=no;
	document.listForm.submit();
}
</script>