<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
</head>

<body>

<jsp:include page="../nav.jsp"></jsp:include>

	<div>
	   <jsp:include page="../header.jsp"></jsp:include>
	</div>

    <!-- ***** Reservation Us Area Starts ***** -->
    <section class="section" id="reservation" >
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center">
                    <div class="left-text-content">
                        <div class="section-heading">
                            <h6>Restaurant Info</h6><br>
                            <!-- <div style="border: 2px solid white; padding-bottom: 10px;"> -->
	                        	<div style="display: inline-block;">
	                        		<img src="/upload/${shop.imgFilename}" width="200" height="200">
	                        	</div>
	                        	<div style="display: inline-block; width:350px; height:250px; vertical-align: middle; margin-left: 10px; /*border: 2px solid black*/">
		                            <h2>${shop.compName}</h2>
		                            <ul style="color: white">
		                        		<li>${shop.compIntro}</li>
		                        		<li>사업자 번호 : ${shop.compNum}</li>
		                        		<li>대표 : ${shop.compCeo}</li>
		                        		<li>주소 : ${shop.compAddr2}</li>
		                        		<li>영업시간 : ${shop.compHour}</li>
		                        		<li>주차 : ${shop.parking}</li>
		                        	</ul>
	                        	</div>
	                        <!-- </div> -->
                        </div>
                        <p>이벤트 및 인원수 등 추가적인 문의 필요시 매장 또는 이지테이블(IZITabe)로 직접 연락 부탁드립니다.</p>
                        <!-- <p>If you need additional inquiries such as events and number of people, please contact the IZITABLE or the store directly.</p> -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="phone">
                                    <i class="fa fa-phone"></i>
                                    <h4>전화번호</h4>
                                    <span><a href="#">${shop.compName}</a> : <a href="#">${shop.compCall}</a><br><a href="#">이지테이블 : 123-4567-8901</a></span>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="message">
                                    <i class="fa fa-envelope"></i>
                                    <h4>이메일</h4>
                                    <span><a href="#">${shop.compName}</a> : <a href="#">${shop.shopEmail}</a><br><a href="#">이지테이블 : admin@izitable.com</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="contact-form">
                        <form id="contact" action="/booking/add" method="post">
                        <input type="hidden" name="shopNo" id="shopNo" value="${shop.shopNo}">
                        <input type="hidden" name="userNo" id="userNo" value="${sessionScope.user.userNo}">
                        
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>테이블 예약</h4>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div id="filterDate2" style="margin-left:15px; width: 480px;">
                                       
                                       <c:set var="ymd" value="<%=new java.util.Date()%>" />
                                       <%-- <c:set var="maxymd" value="${ymd}+30" /> --%> 
                                       <c:set var="maxymd" value="<%=new java.util.Date(new java.util.Date().getTime() + 60*60*24*1000*20)%>"/>
                                       <%-- <fmt:formatDate value="${maxymd}" pattern="yyyy-MM-dd" /> --%>
                                       <input type="date" name="bookingDate" id="bookingDate" min="<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />" max="<fmt:formatDate value="${maxymd}" pattern="yyyy-MM-dd" />" placeholder="예약 가능 날짜" required="required">
                                       <!-- <input type="date" id="myDate" max="2023-10-25" placeholder="예약 가능 날짜"> -->
                             
                                            <div class="input-group-addon">
                                                <span class="glyphicon glyphicon-th"></span>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <select value="bookingTime" name="bookingTime" id="bookingTime">
                                            <option value="bookingTime">예약 가능 시간</option>
                                        </select>
                                    </fieldset>
                                </div>
                                
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <select value="bookingMemNum" name="bookingMemNum" id="bookingMemNum">
                                            <option value="bookingMemNum">인원수</option>
                                        </select>
                                    </fieldset>
                                </div>
                                
                                
                                <div class="col-lg-12">
                                    <fieldset>
                                        <textarea name="message" rows="6" id="message" placeholder="요청사항을 입력해주세요"></textarea>
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                    <button type="submit" id="form-submit" class="main-button-icon">예약완료하기</button>
                                    
                                    <!-- 
                                    <c:if test="${sessionScope.user.userNo != null}">
                                        <button type="submit" id="form-submit" class="main-button-icon">예약완료하기</button>
                                    </c:if>
                                    <c:if test="${sessionScope.user.userNo == null}">
                                        <button type="button" id="form-submit" class="main-button-icon btn-login">예약완료하기</button>
                                    </c:if>
                                     -->
                                    
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Reservation Area Ends ***** -->
    
    <!-- 날짜 선택시(날짜 input 변경) ajax 발생 -->
    <script>
	//document.addEventListener('DOMContentLoaded', function() {
                	   
	//~ fetch api 방식 ~
    var sInp = document.querySelector('#shopNo');
    var dInp = document.querySelector('#bookingDate');
    var tInp = document.querySelector('#bookingTime');
                  
	dInp.onchange = function() {
		//alert('test');
		console.log(sInp.value, dInp.value);
		
		//select box option 초기화
		//optElm.innerHTML = '';
		if(document.querySelectorAll('.timeOption').length > 1) {
			let toList = document.querySelectorAll('.timeOption');
			for (var i = 0; i < toList.length; i++) {
				toList[i].remove();
			}
		}
		
		fetch('/booking/time', {
			method: 'POST',
		body: new URLSearchParams({shopNo: sInp.value, bookingDate: dInp.value})
	}).then(function(response) {
		//let data = response.json();
		return response.json();
		}).then(function(data){ //response.json()의 결과가 인자로 전달
			console.dir(data);
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				//tInp.createElement('option');
				let optElm = document.createElement('option');
				optElm.innerHTML = d.timeHour;
				//optElm.innerHTML = d.timeHour; + ':00';
				//console.log(d.timeHour; + ':00');
				//optElm.setAttribute('value', d.timeHour);
				optElm.classList.add('timeOption');
				tInp.append(optElm);
				
				//tInp.innerHTML = d.bookingTime;
			}
		}).catch(function(error){
			console.log(error);
			//alert(error);
		});
	};              		
	//}
</script>

	<!-- 시간 선택시(시간 input 변경) ajax 발생 -->
    <script>
	//document.addEventListener('DOMContentLoaded', function() {
                	   
	//~ fetch api 방식 ~
    var sInp = document.querySelector('#shopNo');
    var dInp = document.querySelector('#bookingDate');
    var tInp = document.querySelector('#bookingTime');
    var nInp = document.querySelector('#bookingMemNum');
                  
    tInp.onchange = function() {
		//alert('test');
		console.log(sInp.value, dInp.value, tInp.value);
		
		//select box option 초기화
		//optElm.innerHTML = '';
		let mnoList = document.querySelectorAll('.memNumOption');
		for (var i = 0; i < mnoList.length; i++) {
			mnoList[i].remove();
		}
		
		fetch('/booking/memNum', {
			method: 'POST',
		body: new URLSearchParams({shopNo: sInp.value, bookingDate: dInp.value, bookingTime: tInp.value})
	}).then(function(response) {
		//let data = response.json();
		return response.json();
		}).then(function(data){ //response.json()의 결과가 인자로 전달
			console.dir(data);
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				//tInp.createElement('option');
				let optElm = document.createElement('option');
				optElm.innerHTML = d.tableNumber-1;
				optElm.classList.add('memNumOption');
				nInp.append(optElm);
				
				optElm = document.createElement('option');
				optElm.innerHTML = d.tableNumber;
				optElm.classList.add('memNumOption');
				nInp.append(optElm);
				
				//tInp.innerHTML = d.bookingTime;
			}
		}).catch(function(error){
			console.log(error);
			//alert(error);
		});
	};              		
	//}
</script>


    <!-- jQuery -->
    <script src="resources/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="resources/assets/js/popper.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
   
    <script src="resources/assets/js/datepicker.js"></script>
    

    <!-- Global Init -->
    <script src="resources/assets/js/custom.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <script>
// JavaScript를 사용하여 현재 날짜를 가져오는 함수
function getCurrentDate() {
    var today = new Date();
    var year = today.getFullYear();
    var month = (today.getMonth() + 1).toString().padStart(2, '0');
    var day = today.getDate().toString().padStart(2, '0');
    return year + '-' + month + '-' + day;
}

// JavaScript를 사용하여 특정 날짜에 월을 더하는 함수
function addMonths(date, months) {
    var d = new Date(date);
    d.setMonth(d.getMonth() + months);
    return d;
}

// <input> 요소와 min, max를 업데이트
var myDateInput = document.getElementById('myDate');
var currentDate = getCurrentDate();
var oneMonthLater = addMonths(currentDate, 1);

myDateInput.value = currentDate; // 현재 날짜로 <input>의 value 업데이트
myDateInput.min = currentDate; // 최소 날짜 업데이트
myDateInput.max = oneMonthLater.toISOString().slice(0, 10); // 1개월 후의 날짜로 최대 날짜 업데이트
</script>
    
    
    <script>

        $(function () {
            var selectedClass = "";
            $("p").click(function () {
                selectedClass = $(this).attr("data-rel");
                $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("." + selectedClass).fadeOut();
                setTimeout(function () {
                    $("." + selectedClass).fadeIn();
                    $("#portfolio").fadeTo(50, 1);
                }, 500);

            });
        });

        
    </script>

<!--     
<script>
$(document).ready(function(){
	//로그인
	$(".btn-login").click(function(){
		alert('회원 로그인이 필요합니다.');
		location.href = '/login';
	});
});
</script>
 --> 

<jsp:include page="../footer.jsp"></jsp:include>

</body>

</html>