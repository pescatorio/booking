<main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ps ps--active-y">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">
$(function() {
	$("#selboxDirect").hide();
	$("#roomNum").change(function() {
		if($("#roomNum").val() == "direct") {
			$("#selboxDirect").show();
			$("#updateRoomBtn").attr("readonly",true);
			$("#addRoomBtn").attr("readonly",false);
		}  else {
			$("#selboxDirect").hide();
			$("#updateRoomBtn").attr("readonly",false);
			$("#addRoomBtn").attr("readonly",true);
		}

	}) 
	
	
});

//파일 업로드
$("#uploadBtn").on("click", function(){
	if($('#fileUpload').val()==""){
		alert("파일을 선택하세요.");
		$('#fileUpload').click();
		return false;
	}
	let reader = new FileReader();
	let formData = new FormData(document.uploadForm);
	console.log(reader.readAsText(formData));
	
	
	//파일업로드 컨트롤러 -> 서버에 저장
	$.ajax({
		url : '/fileUploadAjax',
		method : 'POST',
		dataType : 'json',
		processData : false,
		contentType : false,
		data : formData,
		success : function(datas){
			console.log("success");
			console.log(datas);
			alert(datas.count+"개가 업로드 되었습니다.");
			let images = "";
			//$('#attachNo').val(datas.attachNo);
			/* $("") 태그 $("#") id $(".") class */
			$('input[name=images]').val(datas.images);
			document.uploadForm.uploadFile.value="";
			$('#fileupload').val("");
			viewFile(datas.images);
		},
		error : function(errorThrown){
			//console.log(errorThrown);
		}
	});
});


//파일view
function viewFile(images){
$.ajax({
	url:'/fileUploadAjax/'+images+'/'+no,
	method : 'get',
	dataType : 'json',
	success : function(datas){
		let result ="";
		$.each(datas, function(i, data){
			console.log(data);
			//이미지 썸네일의 경로를 인코딩 처리해서 서버에 보냄
			
			var file_savePath = "C:\\upload\\temp\\";
			console.log(file_savePath);
			
			//console.log("인코딩 후 : "+file_savePath);
			let fName = data.images;
			//만약 이미지면 이미지 보여줌
			if(data.file_type=='Y'){
				result += "<li><div class='img_wrapper' style='position: relative;'>"
							+"<img src=/fileDisplay?file_name="+file_savePath+" style=' width: 100%; height: 100%; object-fit: cover;'><br>"
							+data.images
							/* +"<span onclick=attachFileDelete('"+data.images"'); data-type='image' style='cursor: pointer; position: absolute; right: 20px; top: 15px; font-size:20px;'>❌</span>" */
							+"<p class='arrow_box'>close</p></div></li>";
			} 
			
		});
		if(datas.length == 0){
			$('#fileUpload').val("");
			$('#fileUpload').click();
		}
		$('#fileList').html(result);
		if($(location).attr('pathname').match('/board/get')){
			$('span[data-type=image]').remove();
		}
	},
	error : function(){
		
	}
});
}//

//file 삭제
function attachFileDelete(images){
$.ajax({
	url:'/fileDelete/'+images,
	method:'get',
	success: function(datas){
		console.log(datas);
		viewFile(images);
	},
	error : function(errorThrown){
		console.log(errorThrown);
	}
})
}//





//switching process
function addRoomBtn(){
/* 			if(${vo.delete_flag }==0){
				if(window.confirm("本当に削除しますか")){
					document.updateForm.action="/admin/adminDeleteNotice";
					document.updateForm.submit();
				}
			}else if(${vo.delete_flag }==1){
				if(window.confirm("本当に活性化しますか")){
					document.updateForm.action="/admin/adminDeleteNotice";
					document.updateForm.submit();
			}
		}
 */	} 


</script>
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
						<input type="button" class="btn btn-outline-primary btn-sm mb-0" onclick="addRoomBtn()" value="新宿泊施設作成">
						<input type="button" class="btn btn-outline-secondary btn-sm mb-0" onclick="deleteRoomBtn()" value="宿泊施設削除">
						<input type="button" class="btn btn-outline-info btn-sm mb-0" onclick="updateRoomBtn()" value="宿泊施設変更">
					</div>
				</div>
			</div>
			<div class="card-body p-3 pb-0">
			
				<!-- fileupload -->
				<form name="uploadForm" action="/uploadFile" method="post" enctype="multipart/form-data">
						<input type="hidden" class="form_file" name="images" id="images">
						<input type="hidden" name="no">
						<input type="file" name="uploadFile" id="fileUpload" multiple="multiple" accept="image/*">
						<br>
						<br>
						<button type="button" id="uploadBtn" style="border: 1px solid black; border-radius: 3px;">upload</button>
					</form>
						<br>
						<br>
		    		<div id="upload_view" style="border: 1px solid black; border-radius: 3px; min-height: 50px; width: 700px;">
						<ul id="fileList">
							
						</ul>
					</div>
				
				<form name="roomInfoForm" action="adminRoomInfoProcess" method="post">
					<ul class="list-group">
						<li	class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
							<div class="d-flex flex-column">
								<h6 class="mb-1 text-dark font-weight-bold text-sm">Room</h6>
									<select id="roomNum" name="room_num">
										<option></option>
										<c:forEach var="roomList" items="${list}">
											<option value="${roomList.room_num}">${roomList.room_num}</option>
										</c:forEach>
										<option value="direct">直接入力</option>
									</select>
									<input type="text" id="selboxDirect" name="selboxDirect"/>
							</div>
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