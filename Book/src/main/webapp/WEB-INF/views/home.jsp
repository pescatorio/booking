<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" %>
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
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner"
			style="width: 100%; height: 500px !important;">
			<div class="carousel-item active">
				<img src="../resources/image/image1200X700/image1.jpg" class="d-block w-100"
					alt="image1">
			</div>
			<div class="carousel-item">
				<img src="../resources/image/image1200X700/image2.jpg" class="d-block w-100 "
					alt="image2">
			</div>
			<div class="carousel-item">
				<img src="../resources/image/image1200X700/image3.jpg" class="d-block w-100"
					alt="image3">
			</div>
			<div class="carousel-item">
				<img src="../resources/image/image1200X700/image4.jpg" class="d-block w-100"
					alt="image4">
			</div>
			<div class="carousel-item">
				<img src="../resources/image/image1200X700/image5.jpg" class="d-block w-100"
					alt="image5">
			</div>
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
        <div class="col">
          <div class="card shadow-sm">
			<img src="../resources/image/image500X500/room1.jpg" height="150vh" align="middle">			
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="roomInfo/page?room_no=701"><button type="button" class="btn btn-sm btn-outline-secondary">詳細</button></a>
                   <a href="consultation/page?room_no=701"><button type="button" class="btn btn-sm btn-outline-secondary">相談</button></a>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img src="../resources/image/image500X500/room2.jpg" height="150vh" align="middle">	            
			<div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="roomInfo/page?room_no=702"><button type="button" class="btn btn-sm btn-outline-secondary">詳細</button></a>
                   <a href="consultation/page?room_no=702"><button type="button" class="btn btn-sm btn-outline-secondary">相談</button></a>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img src="../resources/image/image500X500/room3.jpg" height="150vh" align="middle">	            
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="roomInfo/page?room_no=703"><button type="button" class="btn btn-sm btn-outline-secondary">詳細</button></a>
                   <a href="consultation/page?room_no=702"><button type="button" class="btn btn-sm btn-outline-secondary">相談</button></a>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
			<img src="../resources/image/image500X500/room4.jpg" height="150vh" align="middle">	            
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="roomInfo/page?room_no=704"><button type="button" class="btn btn-sm btn-outline-secondary">詳細</button></a>
                  <a href="consultation/page?room_no=704"><button type="button" class="btn btn-sm btn-outline-secondary">相談</button></a>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img src="../resources/image/image500X500/room5.jpg" height="150vh" align="middle">	            
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="roomInfo/page?room_no=705"><button type="button" class="btn btn-sm btn-outline-secondary">詳細</button></a>
                   <a href="consultation/page?room_no=705"><button type="button" class="btn btn-sm btn-outline-secondary">相談</button></a>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img src="../resources/image/image500X500/room6.jpg" height="150vh" align="middle">	            

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="roomInfo/page?room_no=706"><button type="button" class="btn btn-sm btn-outline-secondary">詳細</button></a>
                   <a href="consultation/page?room_no=706"><button type="button" class="btn btn-sm btn-outline-secondary">相談</button></a>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
        </div>
      </div>
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
											<td><c:out value="${vo.contents}"/></td>
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
		</div>

		<div class="b-example-divider mb-0"></div>