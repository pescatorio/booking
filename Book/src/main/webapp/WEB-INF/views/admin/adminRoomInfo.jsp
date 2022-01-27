<main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ps ps--active-y">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<h6 class="font-weight-bolder mb-0">宿泊施設</h6>
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
						<h6 class="mb-0">宿泊施設</h6>
					</div>
					<div class="col-6 text-end">
						<input type="button" class="btn btn-outline-primary btn-sm mb-0" id="addRoomBtn" onclick="addRoomBtn()" value="新宿泊施設作成" hidden="true">
						<input type="button" class="btn btn-outline-secondary btn-sm mb-0" id="deleteRoomBtn"onclick="deleteRoomBtn()" value="宿泊施設削除" hidden="true">
						<input type="button" class="btn btn-outline-info btn-sm mb-0" id="updateRoomBtn" onclick="updateRoomBtn()" value="宿泊施設変更" hidden="true">
					</div>
				</div>
			</div>
			<div class="card-body p-3 pb-0">
			
				<form name="roomInfoForm" action="adminRoomInfoProcess" method="post">
					<ul class="list-group">
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="mb-1 text-dark font-weight-bold text-sm">Room</h6>
									<input type="text" name="no" id="no" readonly placeholder="no">
									<h6 class="mb-1 text-dark font-weight-bold text-sm">Room_no</h6>
									<select id="roomNum" name="room_num">
										<option></option>
										<c:forEach var="roomList" items="${list}">
											<option value="${roomList.room_num}">${roomList.room_num}</option>
										</c:forEach>
										<option value="direct">直接入力</option>
									</select>
									<input type="text" id="selboxDirect" name="selboxDirect"/>
							</div>
							
							<!-- fileupload -->
						</li>
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">室名</h6>
								<input type="text" name="room_title" style="width:15vw;" placeholder="室名">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">max</h6>
								<input type="number" name="max">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">成人価格</h6>
								<input type="number" name="adult_cost">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">子供価格</h6>
								<input type="number" name="child_cost">
							</div>
						</li>
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">詳細節税</h6>
								<textarea style="width:70vw; height:15vw;">詳細節税</textarea>
							</div>
						</li>
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<input type="text" name="no" placeholder="no" value="${no}"readonly>
								<input type="text" name="build_code" placeholder="build_code" value="7" readonly>
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">テーマ色</h6>
								<input type="color" name="color_code">
							</div>
							<div class="d-flex flex-column">
								
							</div>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	</div>
</main>



<script type="text/javascript">
$(function() {
	let cloneObj = $(".uploadDiv").clone();
	let formData = new FormData();

	//fileupload function
	$("#uploadBtn").on("click", function(e) {
		let inputFile = $('#uploadFile');
		let files = inputFile[0].files;
		var param = {"no":$("#no").val};
		console.log("files......" + files);
		let checkFile = $("#uploadFile").val();

		if (!checkFile) {
			alert("file null");
			return false;
		}

		for (let i = 0; i < files.length; i++) {
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		$.ajax({
			url : '/uploadRoomAjaxAction'+'?'+no,
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			}

		})//ajax
	});//uploadBtn
	
	
	
	$("#selboxDirect").hide();
	$("#roomNum").change(function() {
		if($("#roomNum").val() == "direct") {
			$("#selboxDirect").show();
			$("#updateRoomBtn").attr("hidden",true);
			$("#deleteRoomBtn").attr("hidden",true);
			$("#addRoomBtn").attr("hidden",false);
		}  else {
			$("#selboxDirect").hide();
			$("#updateRoomBtn").attr("hidden",false);
			$("#deleteRoomBtn").attr("hidden",false);
			$("#addRoomBtn").attr("hidden",true);
		}

	}) 
	
	
});


//uploadAjax format check
let regex = new RegExp("(.*?)\.(bmp|gif|jpg|jpeg|png)$");
let maxSize = 5242880; //5MB

function checkExtension(fileName, fileSize) {
	if (!regex.test(fileName)) {
		alert("イメージファイルだけアプロード出来ません");
		return false;
	} else if (fileSize >= maxSize) {
		alert("ファイルのサイズを確認してください");
		return false;
	} else {
		return true;
	}
}

//imagelist div  function
let uploadResult = $("#imageList");
function showUploadedFile(uploadResultArr) {
	let str = "";
	$(uploadResultArr)
			.each(
					function(i, obj) {

					});
	uploadResult.append(str);
}


//switching process
function addRoomBtn(){
	
} 

</script>