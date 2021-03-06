<main class="main-content mt-1 border-radius-lg ps ps--active-y">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!-- Navbar -->
	<nav
		class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
		id="navbarBlur" navbar-scroll="true">
		<div class="container-fluid py-1 px-3">
			<nav aria-label="breadcrumb">
				<h6 class="font-weight-bolder mb-0">Main</h6>
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
							<h6 class="mb-0">MainPage Image List</h6>
						</div>
						<!-- fileupload -->
						<div class="col-6 text-end">
							<div class='uploadDiv'>
								<input type='file' name='uploadFile' id="uploadFile"
									accept="image/*">
								<button id='uploadBtn'>Upload image</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body px-0 pt-0 pb-6">
					<div class="table-responsive">
						<table class="table align-items-center mb-0">
							<thead>
								<tr>
									<th
										class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">イメージ</th>
									<th
										class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">イメージ名</th>
									<th
										class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">活性/削除</th>
									<th
										class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">作成日/修正日</th>
									<th class="text-secondary opacity-7"></th>
								</tr>
							</thead>
							<tbody id="imageList">
							</tbody>
						</table>
					</div>
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
	fileListReload();
	let uploadResult = $("#imageList");
	
	let cloneObj = $(".uploadDiv").clone();
	//////////////////////////////////////ajax
	function fileListReload(){
		let formData = new FormData();
		
		$.ajax({
			url : '/getImageAjax',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				showUploadedFile(result);
			}
		})//total list reload
	}

	$(function() {
		let cloneObj = $(".uploadDiv").clone();
		let formData = new FormData();
		

		//fileupload function
		$("#uploadBtn").on("click", function(e) {
			let inputFile = $('#uploadFile');
			let files = inputFile[0].files;
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
				url : '/uploadAjaxAction',
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

		/* $('#created_at').val(new Date().toDateInputValue()); */
	});//$(function()

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
	function showUploadedFile(uploadResultArr) {
		let btnStr = "";
		$(uploadResultArr)
			.each(function(i, obj) {
				btnStr += "<tr><td><div class='d-flex px-2 py-1'><div></div>"
					+ "<div class=''><img src='/resources/image/image500X500/"
					+ obj.file_name+"' class='img-thumbnail rounded w-50' >"
					+ "</div></div></td><td><p class='text-xs font-weight-bold mb-0'><h6 class='mb-0 text-sm'>"
					+ obj.no
					+ "</h6>"
					+ obj.file_name
					+ "</p></td><td class='align-middle text-center text-sm'>";
					if (obj.activity == 0) {
						btnStr += "<input type='button' class='btn btn-success activityBtn' value='"+obj.activity+"' onclick='activityBtn("+obj.no+ "," + obj.activity+")'>";
					} else if (obj.activity == 1) {
						btnStr += "<input type='button' class='btn btn-warning activityBtn' value='"+obj.activity+"' onclick='activityBtn("+obj.no+ "," + obj.activity+")'>";
					}if (obj.delete_flag == 0) {
						btnStr += "<input type='button' class='btn btn-info deleteBtn' value='"+obj.delete_flag+"' name='deleteBtn' onclick='deleteBtn("+obj.no+ "," + obj.delete_flag+")'>";
					} else if (obj.delete_flag == 1) {
						btnStr += "<input type='button' class='btn btn-warning deleteBtn' value='"+obj.delete_flag+"' name='deleteBtn' onclick='deleteBtn("+obj.no+ "," + obj.delete_flag+")'>";
					} btnStr += "</span> </td><td class='align-middle text-center'>"
						+ "<p>"
						+ obj.created_at
						+ "</p>"
						+ "<p>"
						+ obj.created_at
						+ "</p>"
						+ "</td></tr>";
					}
			);//end each
		uploadResult.html(btnStr);
	}

	
	////////////////////file locking
	function activityBtn(no,activity){
		console.log("activating btn.........");
		//////////sending data
		sendData={
				"no"  :  no,
				"activity"  :  activity
		};
		/////////////////////////////////locking process	
		if(activity == '0'){
			////////confirm
			if(window.confirm("本当にロックしますか")){
				$.ajax({
					url : '/admin/activityImageProgress',
					data : sendData,
					type : 'POST',
					dataType : 'html',
					success : function(data) {
						fileListReload();
					}
				});
			}
		///////////////////////////////unlocking process
		}else{
			/////////confirm
			if(window.confirm("本当に活性化しますか")){
				$.ajax({
					url : '/admin/activityImageProgress',
					data : sendData,
					type : 'POST',
					dataType : 'html',
					success : function(data) {
						fileListReload();
					}
				})
			}
		}
	}//activityBtn close
	
	
	function deleteBtn(no,delete_flag){
		console.log("deleting btn.........");
		//////////sending data
		sendData={
				"no"  :  no,
				"delete_flag"  :  delete_flag
		};
		/////////////////////////////////locking process	
		if(delete_flag == '0'){
			////////confirm
			if(window.confirm("本当に削除しますか")){
				$.ajax({
					url : '/admin/deleteImageProgress',
					data : sendData,
					type : 'POST',
					dataType : 'html',
					success : function(data) {
						fileListReload();
					}
				});
			}
		///////////////////////////////unlocking process
		}else{
			/////////confirm
			if(window.confirm("本当に活性化しますか")){
				$.ajax({
					url : '/admin/deleteImageProgress',
					data : sendData,
					type : 'POST',
					dataType : 'html',
					success : function(data) {
						fileListReload();
					}
				})
			}
		}
	}//activityBtn close
	
</script>