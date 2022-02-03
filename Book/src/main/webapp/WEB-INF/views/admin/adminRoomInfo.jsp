<main class="main-content mt-1 border-radius-lg ps ps--active-y">
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
			
				<form name="roomInfoForm" id="roomInfoForm" method="post">
					<ul class="list-group">
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="mb-1 text-dark font-weight-bold text-sm">Room</h6>
									<input type="text" name="no" id="no" readonly placeholder="no">
									<h6 class="mb-1 text-dark font-weight-bold text-sm">Room_no</h6>
									<select id="room_num" name="room_num">
										<option>選択してください</option>
										<c:forEach var="roomNoList" items="${rList}">
											<option value="${roomNoList.room_num}" data-no="${roomNoList.no}">${roomNoList.room_num}</option>
										</c:forEach>
										<option value="direct" >直接入力</option>
									</select>
									<input type="text" id="selboxDirect" name="selboxDirect"/>
							</div>
							
							<!-- fileupload -->
						</li>
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">室名</h6>
								<input type="text" id="room_title" name="room_title" style="width:15vw;" placeholder="室名">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">max</h6>
								<input type="number" id="max" name="max">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">成人価格</h6>
								<input type="number" id="adult_cost" name="adult_cost">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">子供価格</h6>
								<input type="number" id="child_cost" name="child_cost">
							</div>
						</li>
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">詳細節税</h6>
								<textarea id="explanation" name="explanation" style="width:70vw; height:15vw;">詳細節税</textarea>
							</div>
						</li>
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">テーマ色</h6>
								<input id="color_code" type="color" name="color_code">
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">作成日</h6>
								<input id="created_at" type="date" name="created_at" readonly>
							</div>
							<div class="d-flex flex-column">
								<h6 class="text-dark mb-1 font-weight-bold text-sm">修正日</h6>
								<input id="updated_at" type="date" name="updated_at" readonly>
								<input type="hidden" name="delete_flag" id="delete_flag">
								<input type="hidden" name="build_code" id="build_code">
							</div>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	</div>
	
	<footer class="footer pt-3  ">
		<div class="container-fluid">
			<div class="row align-items-center justify-content-lg-between">
				<div class="col-lg-6 mb-lg-0 mb-4">
					<div class="copyright text-center text-sm text-muted text-lg-start">
						©
						<script>
							document.write(new Date().getFullYear())
						</script>
						2022, made with <i class="fa fa-heart" aria-hidden="true"></i> by
						<a href="https://www.creative-tim.com" class="font-weight-bold"
							target="_blank">Creative Tim</a> for a better web.
					</div>
				</div>
				<div class="col-lg-6">
					<ul
						class="nav nav-footer justify-content-center justify-content-lg-end">
						<li class="nav-item"><a href="https://www.creative-tim.com"
							class="nav-link text-muted" target="_blank">Creative Tim</a></li>
						<li class="nav-item"><a
							href="https://www.creative-tim.com/presentation"
							class="nav-link text-muted" target="_blank">About Us</a></li>
						<li class="nav-item"><a href="https://creative-tim.com/blog"
							class="nav-link text-muted" target="_blank">Blog</a></li>
						<li class="nav-item"><a
							href="https://www.creative-tim.com/license"
							class="nav-link pe-0 text-muted" target="_blank">License</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	
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
	
	
});

$("#room_num").change(function() {
	if($("#room_num").val() == "direct") {
		$("#selboxDirect").show();
		$("#updateRoomBtn").attr("hidden",true);
		$("#deleteRoomBtn").attr("hidden",true);
		$("#addRoomBtn").attr("hidden",false);
		
		$("#roomInfoForm")[0].reset();
		$("#no").val('');
		$("#created_at").val("2022-01-01");
		$("#updated_at").val("2022-01-01");
		
	}  else {
		$("#selboxDirect").hide();
		$("#updateRoomBtn").attr("hidden",false);
		$("#deleteRoomBtn").attr("hidden",false);
		$("#addRoomBtn").attr("hidden",true);
		
		if($("#delete_flag")=='0'){
			$("#deleteRoomBtn").val('宿泊施設削除');
		}else{
			$("#deleteRoomBtn").val('宿泊施設活性化');
		}
		
		let sendData={
				"no"  :   $('#room_num option:selected').attr('data-no'),
				"room_num" :   $('#room_num option:selected').val(),
		};
		
		console.log(sendData);
		
		$.ajax({
			url : '/admin/switchingRoomInfo',
			data : JSON.stringify(sendData),
			type : 'POST',
			dataType : 'json',
			processData : false,
			contentType : 'application/json; charset=UTF-8;',
			success : function(data) {
				console.log("switchingRoomInfo ajax.........");
				console.log(data);
					console.log("data........."+data);
					$("#no").val(data["no"]);
					$("#room_title").val(data["room_title"]);
					$("#max").val(data["max"]);
					$("#adult_cost").val(data["adult_cost"]);
					$("#child_cost").val(data["child_cost"]);
					$("#explanation").val(data["explanation"]);
					$("#color_code").val(data["color_code"]);
					$("#created_at").val(data["created_at"]);
					$("#updated_at").val(data["updated_at"]);
					$("#delete_flag").val(data["delete_flag"]);
					$("#build_code").val(data["build_code"]);
			}
		});
		
	}

}) 



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


//addRoominfo progress
function addRoomBtn(){
	$("#no").val(0);
	$("#roomInfoForm").attr("action", "addRoomInfoProgress");
	$("#roomInfoForm").submit();
} 

//modifyRoominfo progress
function updateRoomBtn(){
	$("#roomInfoForm").attr("action", "modifyRoomInfoProgress");
	$("#roomInfoForm").submit();
}
//deleteRoomInfo progress
function deleteRoomBtn(){
	console.log("delete_flag........"+$("#delete_flag").val());
	if($("#delete_flag").val()==0){
		if(window.confirm("本当に削除しますか")){
			$("#roomInfoForm").attr("action", "deleteRoomInfoProgress");
			$("#roomInfoForm").submit();
		}
	}else if($("#delete_flag").val()==1){
		if(window.confirm("本当に活性化しますか")){
			$("#roomInfoForm").attr("action", "deleteRoomInfoProgress");
			$("#roomInfoForm").submit();
		}
	}
}
</script>