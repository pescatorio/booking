<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="container marketing">
	<!--                    modal for addOption                             -->
				<div class="modal">
					<div class="modal_content" title="決済ページ">
						<label>決済ページ</label><br> 
						<input type="hidden" name="bank_branch_code_modal" id="bank_branch_code_modal" class="bank_branch_code_modal">
						<select name="bank_modal" id="bank_modal">
							<option value="">-------------</option>
							<option value="一番銀行">一番銀行</option>
							<option value="二番銀行">二番銀行</option>
							<option value="三番銀行">三番銀行</option>
						</select>
						<select name="bank_account_number_modal" id="bank_account_number_modal">
							<option value="">-------------</option>
							<option value="111-1111-1111" class="firstBank" hidden="true">111-1111-1111</option>
							<option value="111-2222-2222" class="firstBank" hidden="true">111-2222-2222</option>
							<option value="111-2222-3333" class="firstBank" hidden="true">111-2222-3333</option>
							<option value="222-1111-1111" class="secondBank" hidden="true">222-1111-1111</option>
							<option value="222-2222-2222" class="secondBank" hidden="true">222-2222-2222</option>
							<option value="333-3333-3333" class="thirdBank" hidden="true">333-3333-3333</option>
						</select>
						<br><label>名前</label><input type="text" name="name_modal" id="name_modal">
						<br><label>電話番号</label><input type="tel" name="phone_modal" id="phone_modal">
						<br><label>価格</label><input type="number" name="tmpTotalCost" readonly><br>
						<input type="button" class="btn btn-info" id="payBtn" value="決済" data-status>
						<input type="button" class="btn btn-warning"
							name="escapeFromModalBtn" value="取り消し">
					</div>
				</div>

    <!-- START THE FEATURETTES -->
    <script type="text/javascript">
    	let temp=new Array();
    </script>
	<c:forEach var="roomList" items="${rList}" varStatus="status">
    <script type="text/javascript">
		temp[${status.count}-1] = ${roomList.startToEnd};
    </script>
		<c:choose>
			<c:when test="${status.count%2==1}">
				 <hr class="featurette-divider">
			    <div class="row featurette">
			      <div class="col-md-7">
			      <h2 class="featurette-heading" style="color:${roomList.color_code};">${roomList.room_title }<span class="text-muted">&nbsp&nbsp <small>人数： ${roomList.max}</small></span></h2>
			        <p class="lead">${roomList.explanation } </p>
			        <form id="bookingForm" name="bookingForm" data-status="${status.count }" method="post" action="/roomInfo/insertBookingProgress">
			        	<input type="hidden" name="startToEnd" value="${roomList.startToEnd}" data-status="${status.count }">
				        <input type="hidden" class="no" name="no" id="no" value="0">
				        <input type="hidden" class="room_no" name="room_no" id="room_no" value="${roomList.no }">
				        <input type="hidden" class="room_title"name="room_title" id="room_title" value="${roomList.room_title }">
				        <input type="hidden" class="max" name="max" id="max" value="${roomList.max }" data-status="${status.count }">
				        <small>成人価格:${roomList.adult_cost }<input type="hidden" class="adult_cost" name="adult_cost" id="adult_cost" value="${roomList.adult_cost }"></small>
				        <input type="number" class="adult"name="adult" id="adult" placeholder="成人" min="0" max="${roomList.max}"  data-status="${status.count }">
				        <small>子供価格:${roomList.child_cost }<input type="hidden" class="child_cost" name="child_cost" id="child_cost" value="${roomList.child_cost }"></small>
				        <input type="number" class="child" name="child" id="child" placeholder="子供" min="0" max="${roomList.max}" data-status="${status.count }"><br>
				        <input type="text" class="start_date" name="start_date" id="start_date${status.count }" data-status="${status.count }" readonly >~
				        <input type="text" class="end_date" name="end_date" id="end_date${status.count }" data-status="${status.count }" readonly>
				        <select name="options" class="options" id="options" data-status="${status.count }">
			        		<option value="0" data-options=0 data-optionsCost=0>無</option>
				        	<c:forEach var="optionsList" items="${oList}">
				        		<option value="${optionsList.no}" data-optionsCost="${optionsList.cost }">${optionsList.item} &nbsp&nbsp&nbsp${optionsList.cost}</option>
				        	</c:forEach>
				        </select>
				        <input type="hidden" class="name" name="name" data-status="${status.count}">
			        	<input type="hidden" class="phone" name="phone" data-status="${status.count }"> 
			        	<input type="hidden" class="bank_name" name="bank_name" data-status="${status.count }"> 
			        	<input type="hidden" class="bank_branch_code" name="bank_branch_code" data-status="${status.count }"> 
			        	<input type="hidden" class="bank_account_number" name="bank_account_number" data-status="${status.count }"> 
				        <input type="text" class="total_cost" name="total_cost" id="total_cost" placeholder="総額" data-status="${status.count }" readonly>
				        <br><button type="button" class="btn btn-sm btn-outline-secondary"  name="addModalBtn" data-status="${status.count }">予約</button>
			        </form>
			        
			        
			      </div>
			      <div class="col-md-5">
					
					<div id="carouselExampleIndicators${status.count }" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<c:forEach var='imageVo' items='${roomList.tmpImages }' varStatus="status2">
								<li data-target="#carouselExampleIndicators${status.count }" data-slide-to="${status2.count-1}"<c:if test="${status2.count==0}">class="active"</c:if>></li>
							</c:forEach>
						</ol>
						<div class="carousel-inner"
							style="width: 100%; height: 200px !important;">
							<div class="carousel-item active">
								<img src='../resources/image/image500X500/${roomList.tmpImages[0]}' class="d-block w-100" >
							</div>
							<c:forEach var = "i" begin = "1" end = "${roomList.tmpImages.size()-1}" step = "1">
								<div class="carousel-item ">
									<img src='../resources/image/image500X500/<c:out value="${roomList.tmpImages[i]}"></c:out>' class="d-block w-100">
								</div>
							</c:forEach>
						</div>
					</div>
					
			      </div>
			    </div>
	   		 </c:when>
	   		 <c:when test="${status.count%2==0}">
	   		 	<hr class="featurette-divider">
			    <div class="row featurette">
			      <div class="col-md-7 order-md-2">
			        <h2 class="featurette-heading" style="color:${roomList.color_code};">${roomList.room_title } <span class="text-muted">人数： ${roomList.max}</span></h2>
			        <p class="lead">${roomList.explanation }</p>
			         <form id="bookingForm" name="bookingForm" data-status="${status.count }" method="post" action="/roomInfo/insertBookingProgress">
			         	<input type="hidden" name="startToEnd" value="${roomList.startToEnd}" data-status="${status.count }">
			         	<input type="hidden" class="no" name="no" id="no" value="0">
				        <input type="hidden" class="room_no" name="room_no" id="room_no" value="${roomList.no }">
				        <input type="hidden" class="room_title"name="room_title" id="room_title" value="${roomList.room_title }">
				        <input type="hidden" class="max" name="max" id="max" value="${roomList.max }" data-status="${status.count }">
				        <small>成人価格:${roomList.adult_cost }<input type="hidden" class="adult_cost" name="adult_cost" id="adult_cost" value="${roomList.adult_cost }"></small>
				        <input type="number" class="adult"name="adult" id="adult" placeholder="成人" min="0" max="${roomList.max}"  data-status="${status.count }">
				        <small>子供価格:${roomList.child_cost }<input type="hidden" class="child_cost" name="child_cost" id="child_cost" value="${roomList.child_cost }"></small>
				        <input type="number" class="child" name="child" id="child" placeholder="子供" min="0" max="${roomList.max}" data-status="${status.count }"><br>
				        <input type="text" class="start_date" name="start_date" id="start_date${status.count }" data-status="${status.count }" readonly >~
				        <input type="text" class="end_date" name="end_date" id="end_date${status.count }" data-status="${status.count }" readonly>
				        <select name="options" class="options" id="options" data-status="${status.count }">
			        		<option value="0" data-options=0 data-optionsCost=0>無</option>
				        	<c:forEach var="optionsList" items="${oList}">
				        		<option value="${optionsList.no}" data-optionsCost="${optionsList.cost }">${optionsList.item} &nbsp&nbsp&nbsp${optionsList.cost}</option>
				        	</c:forEach>
				        </select>
				        <input type="hidden" class="name" name="name" data-status="${status.count}">
			        	<input type="hidden" class="phone" name="phone" data-status="${status.count }"> 
			        	<input type="hidden" class="bank_name" name="bank_name" data-status="${status.count }"> 
			        	<input type="hidden" class="bank_branch_code" name="bank_branch_code" data-status="${status.count }"> 
			        	<input type="hidden" class="bank_account_number" name="bank_account_number" data-status="${status.count }"> 
				        <input type="text" class="total_cost" name="total_cost" id="total_cost" placeholder="総額" data-status="${status.count }" readonly>
				        <br><button type="button" class="btn btn-sm btn-outline-secondary"  name="addModalBtn" data-status="${status.count }">予約</button>
			        </form>



			        
			      </div>
			      <div class="col-md-5 order-md-1">
					<div id="carouselExampleIndicators${status.count }" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<c:forEach var='imageVo' items='${roomList.tmpImages }' varStatus="status2">
								<li data-target="#carouselExampleIndicators${status.count }" data-slide-to="${status2.count-1}" <c:if test="${status2.count==0}">class="active"</c:if> ></li>
							</c:forEach>
						</ol>
						<div class="carousel-inner"
							style="width: 100%; height: 200px !important;">
							<div class="carousel-item active">
								<img src='../resources/image/image500X500/${roomList.tmpImages[0]}' class="d-block w-100" >
							</div>
							<c:forEach var = "i" begin = "1" end = "${roomList.tmpImages.size()-1}" step = "1">
								<div class="carousel-item ">
									<img src='../resources/image/image500X500/<c:out value="${roomList.tmpImages[i]}"></c:out>' class="d-block w-100">
								</div>
							</c:forEach>
						</div>
					</div>
			      </div>
			    </div>
	   		 </c:when>
	    </c:choose>
	</c:forEach>
   
  </div>
  
<script type="text/javascript">
$(function(){
	$('.start_date').each(function(index,item){
	    let disabledDays = new Array();
		let temp2= new Array();
		temp2=String(temp[index]).split(',');
		disabledDays[index]=temp2;
		
		let tmpIndex=index+1;
		let tmpString="start_date"+tmpIndex+","+"#end_date"+tmpIndex;
		let dates = $("#"+"start_date"+tmpIndex+","+"#end_date"+tmpIndex).datepicker({
			changeMonth:true,
			changeYear:true,
			dayNames:['月','火','水','木','金','土','日'],
			dayNamesMin:['月','火','水','木','金','土','日'],
			monthNames:['1','2','3','4','5','6','7','8','9','10','11','12'],
			monthNamesShort:['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			dateFormat: 'yymmdd',
			minDate:0,
			beforeShowDay: disableAllTheseDays,
			onSelect: function( selectedDate ) {
			    let option = this.id == "start_date"+tmpIndex+"" ? "minDate" : "maxDate",
			      instance = $( this ).data( "datepicker" ),
			      date = $.datepicker.parseDate(
			        instance.settings.dateFormat ||
			        $.datepicker._defaults.dateFormat,
			        selectedDate, instance.settings );
			    dates.not( this ).datepicker( "option", option, date );
			  }
		}); //dates
		

		function disableAllTheseDays(date) {
		    let m = String(date.getMonth()+1);
		    if(date.getMonth()<9){m="0"+m};
		    d = date.getDate();
		    if(date.getDate()<10){d="0"+d};
		    y = date.getFullYear();
		    let tmpDisabledDay=y+m+d;
		    for (i = 0; i < disabledDays[index].length; i++) {
		        if($.inArray(y + m + d,disabledDays[index]) != -1) {
		            return [false];
		        }
		    }
		    return [true];
		}
		
	});
	
	
});
  
document.addEventListener("DOMContentLoaded", function(){
	let getRoomNo=getParameterByName('room_no');
	let rNo= document.getElementsByName('room_no');
	console.log("getRoomNo...."+getRoomNo);
	console.log("rNo...."+rNo);
	if(getRoomNo!=null){
		for(var i=0; i<rNo.length; i++){
		    if(rNo[i].value == getRoomNo){
		      rNo[i].focus();       //Js
		      break;
		    }
		}
	}
});
	

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
};

$("[name=adult]").change(function(){
	let dStatus=$(this).attr("data-status");
	let tmpChild=Number($("[name=child]")[dStatus-1].value);
	let tmpAdult=Number($("[name=adult]")[dStatus-1].value);
	let tmpMax=Number($("[name=max]")[dStatus-1].value);
	let tmp=0;
	if(tmpAdult+tmpChild>tmpMax){
		tmp=tmpMax-tmpAdult;
		$("[name=child]")[dStatus-1].value=tmp;
	}
	tmpChild=Number($("[name=child]")[dStatus-1].value);
	tmpAdult=Number($("[name=adult]")[dStatus-1].value);
	let tCost=Number($("[name=adult_cost]")[dStatus-1].value)*tmpAdult+Number($("[name=child_cost]")[dStatus-1].value)*tmpChild+Number($("[name=options][data-status="+dStatus+"] option:selected").data("optionscost"));
	$("[name=total_cost]")[dStatus-1].value=tCost;
	
});
$("[name=child]").change(function(){
	let dStatus=$(this).attr("data-status");
	let tmpChild=Number($("[name=child]")[dStatus-1].value);
	let tmpAdult=Number($("[name=adult]")[dStatus-1].value);
	let tmpMax=Number($("[name=max]")[dStatus-1].value);
	
	let tmp=0;
	if(tmpAdult+tmpChild>tmpMax){
		tmp=tmpMax-tmpChild;
		$("[name=adult]")[dStatus-1].value=tmp;
	}
	tmpChild=Number($("[name=child]")[dStatus-1].value);
	tmpAdult=Number($("[name=adult]")[dStatus-1].value);
	let tCost=Number($("[name=adult_cost]")[dStatus-1].value)*tmpAdult+Number($("[name=child_cost]")[dStatus-1].value)*tmpChild+Number($("[name=options][data-status="+dStatus+"] option:selected").data("optionscost"));
	$("[name=total_cost]")[dStatus-1].value=tCost;
});


$("[name=options]").change(function(){
	let dStatus=$(this).attr("data-status");
	let tmpChild=Number($("[name=child]")[dStatus-1].value);
	let tmpAdult=Number($("[name=adult]")[dStatus-1].value);
	let tmpMax=Number($("[name=max]")[dStatus-1].value);
	let tCost=Number($("[name=adult_cost]")[dStatus-1].value)*tmpAdult+Number($("[name=child_cost]")[dStatus-1].value)*tmpChild+Number($("[name=options][data-status="+dStatus+"] option:selected").data("optionscost"));
	$("[name=total_cost]")[dStatus-1].value=tCost;
});

$("[name=addModalBtn]").click(function() {
	let dStatus=$(this).attr("data-status");
 	$("[name=tmpTotalCost]").val($("[name=total_cost]")[dStatus-1].value);
 	$("#payBtn").attr("data-status",dStatus);
	$(".modal").fadeIn();
});

$("[name=escapeFromModalBtn]").click(function() {
	$(".modal").fadeOut();
});

$("[name=bank_modal]").change(function(){
	if($("[name=bank_modal] option:selected").val()=='一番銀行'){
		$(".firstBank").attr("hidden",false);
		$(".secondBank").attr("hidden",true);
		$(".thirdBank").attr("hidden",true);
		$(".bank_branch_code_modal").val("701");
		$("[name=bank_account_number_modal]").val("");
	}
	else if($("[name=bank_modal] option:selected").val()=='二番銀行'){
		$(".firstBank").attr("hidden",true);
		$(".secondBank").attr("hidden",false);
		$(".thirdBank").attr("hidden",true);
		$(".bank_branch_code_modal").val("702");
		$("[name=bank_account_number_modal]").val("");
	}
	else if($("[name=bank_modal] option:selected").val()=='三番銀行'){
		$(".firstBank").attr("hidden",true);
		$(".secondBank").attr("hidden",true);
		$(".thirdBank").attr("hidden",false);
		$(".bank_branch_code_modal").val("703");
		$("[name=bank_account_number_modal]").val("");
	}else{
		$(".firstBank").attr("hidden",true);
		$(".secondBank").attr("hidden",true);
		$(".thirdBank").attr("hidden",true);
		$("[name=bank_branch_code_modal]").val("");
		$("[name=bank_account_number_modal]").val("");
		$("[name=bank_modal]").val("");
	}
});

$("#payBtn").click(function(){
	let dStatus=$('#payBtn').attr("data-status");
	$('[name=name][data-status='+dStatus+']').val($("#name_modal").val());
	$('[name=phone][data-status='+dStatus+']').val($("#phone_modal").val());
	$('[name=bank_name][data-status='+dStatus+']').val($("#bank_modal").val());
	$('[name=bank_branch_code][data-status='+dStatus+']').val($("#bank_branch_code_modal").val());
	$('[name=bank_account_number][data-status='+dStatus+']').val($("#bank_account_number_modal").val());
	if($('[name=child][data-status'+dStatus+']').val()==''){$('[name=child][data-status'+dStatus+']').val('0')};
	
	///////////////////validation at bookingForm
	if(nullEmptyCheck('電話番号',$('[name=phone][data-status='+dStatus+']').val())==false){return false; };
	if(nullEmptyCheck('名前',$('[name=name][data-status='+dStatus+']').val())==false){return false;};
	if(nullEmptyCheck('成人',$('[name=adult][data-status='+dStatus+']').val())==false){$(".modal").fadeOut();return false; };
	if(nullEmptyCheck('予約日',$('[name=start_date][data-status='+dStatus+']').val())==false){$(".modal").fadeOut();return false; };
	if(nullEmptyCheck('予約終了日',$('[name=end_date][data-status='+dStatus+']').val())==false){$(".modal").fadeOut();return false; };
	if(nullEmptyCheck('総額',$('[name=total_cost][data-status='+dStatus+']').val())==false){$(".modal").fadeOut();return false; };
	if(nullEmptyCheck('銀行',$('[name=bank_name][data-status='+dStatus+']').val())==false){return false; };
	if(nullEmptyCheck('銀行支店コード',$('[name=bank_branch_code][data-status='+dStatus+']').val())==false){return false; };
	if(nullEmptyCheck('口座番号',$('[name=bank_account_number][data-status='+dStatus+']').val())==false){return false; };
	
	alert("予約しました。");
	$("[name=bookingForm][data-status="+dStatus+"]").submit();
	
});

function nullEmptyCheck(id,value){ 
	if( value == "" || value == null || value == undefined ){
		alert(id+"に"+id+"を入力してください");
		return false;
	}else{
		return true;
	}
}


</script>
<style>
.modal {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}

.modal_content {
	width: 80%;
	height: 60%;
	background: #fff;
	border-radius: 10px;
	position: relative;
	top: 10%;
	left: 10%;
	text-align: center;
	box-sizing: border-box;
	padding: 74px 0;
	line-height: 23px;
}
</style>