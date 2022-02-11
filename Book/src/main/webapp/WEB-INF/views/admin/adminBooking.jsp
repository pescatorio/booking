<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="cosmo.book.vo.BookingVO" %>
<main
	class="main-content mt-1 border-radius-lg ps ps--active-y">
	<!-- Navbar -->
	<nav
		class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
		id="navbarBlur" navbar-scroll="true">
		<div class="container-fluid py-1 px-3">
			<nav aria-label="breadcrumb">
				<h6 class="font-weight-bolder mb-0">予約</h6>
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
	<div class="container-fluid py-2">
		<div class="col-lg-12">
			<div class="row">
				<div class="col-xl-12 mb-3">
					<div class="card bg-transparent shadow-xl">
						<div class="overflow-hidden position-relative border-radius-xl">
						
							<div class="card-header pb-0 p-3" id='calendar'>
							
							</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="col-lg-12">
		<div class="card h-100">
			<div class="card-header pb-0 p-3">
				<div class="row">
					<div class="col-6 d-flex align-items-center">
						<h6 class="mb-0">予約</h6>
					</div>
					<div class="col-6 text-end">
						<input type="button" id="payment_flag" class="btn btn-outline-info btn-sm mb-0"  value="入金処理" data-value="">
						<input type="button" id="delete_flag" class="btn btn-outline-secondary btn-sm mb-0" value="削除" data-value="">
						<input type="button" id="cancel_flag" class="btn btn-outline-primary btn-sm mb-0" value="予約キャンセル" data-value="">
					</div>
				</div>
			</div>
			<div class="card-body p-3 pb-0">
				<ul class="list-group">
					<li
						class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
						<div class="d-flex flex-column">
							<h6 class="mb-1 text-dark font-weight-bold text-sm">予約番号</h6>
							<input type="text" id="no" readonly>
						</div>
						<div class="d-flex flex-column">
							<h6 class="mb-1 text-dark font-weight-bold text-sm">作成日/修正日</h6>
							<input type="date" id="created_at" readonly>
							<input type="date" id="updated_at" readonly>
						</div>
						<div class="d-flex flex-column">
							<h6 class="mb-1 text-dark font-weight-bold text-sm">部屋</h6>
							<select name="room_no" id="room_no">
								<c:forEach var="roomList" items="${rList }">
									<option value="${roomList.no}"  disabled="disabled">${roomList.room_num }</option>
								</c:forEach>
							</select>
						</div>
					</li>
					<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">名前</h6>
							<input type="text" name="name" id="name" placeholder="名前" readonly>
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">電話番号</h6>
							<input type="tel" name="phone" id="phone" placeholder="電話番号"readonly >
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">Options</h6>
							<select name="options" id="options" >
								<c:forEach var="optionsList" items="${oList}">
									<option value="${optionsList.no}" disabled="disabled" >${optionsList.item }</option>
								</c:forEach>
							</select>
						</div>
					</li>
					<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">成人</h6>
							<input type="number" name="adult" id="adult" placeholder="成人"readonly>
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">子供</h6>
							<input type="number" name="child" id="child" placeholder="子供"readonly>
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">総額</h6>
							<input type="number" name="total_cost" id="total_cost" placeholder="総額"readonly>
						</div>
					</li>
					<li	class="list-group-item border-0 d-flex justify-content-between ps-0 border-radius-lg">
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">銀行名</h6>
							<input type="text" name="bank_name" id="bank_name" placeholder="銀行名" readonly>
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">支店番号</h6>
							<input type="text" name="bank_branch_code" id="bank_branch_code" placeholder="支店番号" readonly>
						</div>
						<div class="d-flex flex-column">
							<h6 class="text-dark mb-1 font-weight-bold text-sm">口座番号</h6>
							<input type="text" name="bank_account_number" id="bank_account_number" placeholder="口座番号" readonly>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</div>
</main>
<link href='/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar/main.js'></script>
<script type="text/javascript">
$(function(){
	getFullcalendarAjax();
});
$("#room_no").change(function(){
	getFullcalendarAjax();
	
});

function getFullcalendarAjax(){
	$.ajax({
		url:'/admin/getFullcalendar',
		type:'POST',
		dataType:'json',
		processData : false,
		contentType : 'application/json; charset=UTF-8;',
		success:function(res){
			let fList=res;
			console.log(fList);
			let calendarEl=document.getElementById('calendar');
			let events=fList.map(function(item){
				return{
					title: item.no,
					start: item.start_date,
					end:  String(moment(moment(item.end_date,"YYYY-MM-DD").add('days', 1)).format("YYYY-MM-DD")),
					borderColor:item.tmpColor,
					textColor:item.tmpColor
				}
			});//events
			
			
			let calendar = new FullCalendar.Calendar(calendarEl, {
				timeZone: 'local',
				events: events,
				initialView:'dayGridMonth',
				eventClick:function(info) {
	                if(info.event.title) {
	                    getBookingAjax(info.event.title);
	                }
				}
			});
			calendar.render();
		}//success
	});//ajax
}//getFullcalendarAjax

function getBookingAjax(bookingNo){
	$.ajax({
		url:'/admin/getBookingAjax',
		type:'POST',
		data: {"no" : bookingNo},
		dataType:'json',
		success:function(data){
			console.log(data["delete_flag"]);
			$("#no").val(data["no"]);
			$("#room_no").val(data["room_no"]);
			$("#name").val(data["name"]);
			$("#phone").val(data["phone"]);
			$("#adult").val(data["adult"]);
			$("#child").val(data["child"]);
			$("#options").val(data["options"]);
			if(data["payment_flag"]=='0'){
				$("#payment_flag").val("入金処理");
				$("#payment_flag").attr("data-value",data["payment_flag"]);
			}
			else if(data["payment_flag"]=='1'){
				$("#payment_flag").val("入金取り消し");
				$("#payment_flag").attr("data-value",data["payment_flag"]);
			}
			$("#total_cost").val(data["total_cost"]);
			if(data["cancel_flag"]=='0'){
				$("#cancel_flag").val("予約キャンセル");
				$("#cancel_flag").attr("data-value",data["cancel_flag"]);
			}
			else if(data["cancel_flag"]=='1'){
				$("#cancel_flag").val("予約キャンセル　取り消し");
				$("#cancel_flag").attr("data-value",data["cancel_flag"]);
			}
			$("#calcel_flag").val(data["cancel_flag"]);
			$("#bank_name").val(data["bank_name"]);
			$("#bank_branch_code").val(data["bank_branch_code"]);
			$("#bank_account_number").val(data["bank_account_number"]);
			if(data["delete_flag"]=='0'){
				$("#delete_flag").attr("data-value",data["delete_flag"]);
			}
			else if(data["delete_flag"]=='1'){
				$("#delete_flag").attr("data-value",data["delete_flag"]);
				$("#delete_flag").attr('type',"hidden");
			}
			$("#created_at").val(moment(data["created_at"]).format("YYYY-MM-DD"));
			$("#updated_at").val(moment(data["updated"]).format("YYYY-MM-DD"));
		}
	});
}
$("#payment_flag").click(function(){
	if($("#payment_flag").attr("data-value")=='0'){
		$("#payment_flag").attr("data-value",'1');
		
	}else{
		$("#payment_flag").attr("data-value",'0');
	}
	let sendData= {
			no : $("#no").val(),
			payment_flag : $("#payment_flag").attr("data-value")
	}
	console.log(sendData);
	$.ajax({
		url:'/admin/paymentFlagAjax',
		type:'POST',
		data:sendData,
		dataType:'JSON',
		success:function(data){
			console.log(data);
			getBookingAjax(data);
		}
	});
	
});//payment_flag

$("#delete_flag").click(function(){
	if($("#delete_flag").attr("data-value")=='0'){
		$("#delete_flag").attr("data-value",'1');
		
	}else{
		$("#delete_flag").attr("data-value",'0');
	}
	let sendData= {
			no : $("#no").val(),
			delete_flag : $("#delete_flag").attr("data-value")
	}
	console.log(sendData);
	$.ajax({
		url:'/admin/deleteFlagAjax',
		type:'POST',
		data:sendData,
		dataType:'JSON',
		success:function(data){
			getBookingAjax(data);
		}
	});
	
});//delete_flag

$("#cancel_flag").click(function(){
	if($("#cancel_flag").attr("data-value")=='0'){
		$("#cancel_flag").attr("data-value",'1');
		
	}else{
		$("#cancel_flag").attr("data-value",'0');
	}
	let sendData= {
			no : $("#no").val(),
			cancel_flag : $("#cancel_flag").attr("data-value")
	}
	console.log(sendData);
	$.ajax({
		url:'/admin/cancelFlagAjax',
		type:'POST',
		data:sendData,
		dataType:'JSON',
		success:function(data){
			getBookingAjax(data);
			console.log(data);
		}
	});
	
});//payment_flag


</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
