<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px; margin-top: 50px;}
</style>
</head>

<body>
<jsp:include page="../nav2.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	
	
	<div style="/*border: 2px solid black;*/ text-align: center;">
		
			<button class="btn" style="margin-right: 30px;"><a href="/shop/booking/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
			<button class="btn btn-lg" style="margin-right: 30px;"><a href="/shop/setting/${sessionScope.shop.shopNo}"><h3>매장 설정</h3></a></button>
			<button class="btn"><a href="/shop/update/${sessionScope.shop.shopNo}"><h3>정보 변경</h3></a></button>

	</div>
	
	<br>
	
	<h3>테이블 등록</h3>
		
		<div>
			<form method="post" action="/shop/setting/${sessionScope.shop.shopNo}/addtable">
				
				<span>
					<label>인용:</label>
					<span>
						<select name="tableNumber">
							<option value="2">2인용</option>
							<option value="4">4인용</option>
							<option value="6">6인용</option>

						</select>
					</span>
				</span>
				
				<span>
					<label>테이블 이름:</label>
					<span>
						<input type="text" name="tableName">
					</span>
				</span>
				
				<span>
					<span></span>
					<span>
						<button type="submit" class="btn">등록</button>
					</span>
					<span></span>
					<span></span>
				</span>			
			</form>
		</div>
		
		<br>
		
		<h3 class="mt-2">테이블 목록</h3>
		<div class="mb-2 px-3">
			<table class="list_table">
				<thead class="table-dark">
					<tr>
						<th class="col">구분번호</th>
						<th class="col">테이블 이름</th>
						<th class="col">수용인원</th>
						<th class="col">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${tablelist.size() < 1}">
						<tr>
							<td colspan="4">등록 된 영업시간이 없습니다</td>					
						</tr>
					</c:if>
					<c:forEach var="item" items="${tablelist}">
						<tr>
							<td>${item.tableNo}</td>
							<td>${item.tableName}</td>
							<td>${item.tableNumber}</td>
							<td><a href="/shop/setting/${item.shopNo}/deleteTable/${item.tableNo}" class="btn btn-outline-danger btn-sm">삭제</a>							
						</tr>
					</c:forEach>					
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="4">
							<ul class="pagination justify-content-center mt-3">
								<li class="page-item"><a class="page-link" href="?page=1${pager.query}">처음</a></li>
								<li class="page-item"><a class="page-link" href="?page=${pager.prev}${pager.query}">이전</a></li>
								<c:forEach var="page" items="${pager.list}">
									<li class="page-item"><a class="page-link ${page == pager.page ? 'active' : ''}" href="?page=${page}${pager.query}">${page}</a></li>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="?page=${pager.next}${pager.query}">다음</a></li>
								<li class="page-item"><a class="page-link" href="?page=${pager.last}${pager.query}">마지막</a></li>
							</ul>
						</td>
					</tr>
				</tfoot>
				
			</table>
		</div>
		
		<br>
	
	<h3>시간대 등록</h3>
		
			<form method="post" action="/shop/setting/${sessionScope.shop.shopNo}/addtime">
				
				<span>
					<label>요일:</label>
					
						<select name="timeDay" id="timeDay">
							<option value="2">월요일</option>
							<option value="3">화요일</option>
							<option value="4">수요일</option>
							<option value="5">목요일</option>
							<option value="6">금요일</option>
							<option value="7">토요일</option>
							<option value="1">일요일</option>
						</select>
						
				</span>
				
				<script>
					if('${sessionScope.shopTm.timeDay}' != "") { document.querySelector('[name="timeDay"]').value = '${sessionScope.shopTm.timeDay}'; }
				</script>
				
				<span>
					<label>영업 시간대:</label>
					
					<!-- 
					<span>
						<input type="number" name="timeHour" min="0" max="23"> 시
					</span>
					 -->
					 
					 <span>
						시작시간 : <input type="number" name="startTime" min="0" max="23" style="width:50px;"> 시
					</span>
					~
					<span>
						끝시간 : <input type="number" name="endTime" min="" max="23" style="width:50px;"> 시
					</span>
					
				</span>
				
				<span>
					<span></span>
					<span>
						<button type="submit" class="btn">등록</button>
					</span>
					<span></span>
					<span></span>
				</span>			
			</form>
		
		<br><br>

	<h3 class="mt-2">시간대 목록</h3>
		<div class="mb-2 px-3">
			<table class="list_table">
				<thead class="table-dark">
					<tr>
						<th class="col">구분번호</th>
						<th class="col">요일</th>
						<th class="col">시간대</th>
						<th class="col">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${timelist.size() < 1}">
						<tr>
							<td colspan="4">등록 된 영업시간이 없습니다</td>					
						</tr>
					</c:if>
					<c:forEach var="item" items="${timelist}">
						<tr>
							<td>${item.timeNo}</td>
							<td>
							<c:choose>
								<c:when test="${item.timeDay eq 1}">일요일</c:when>
								<c:when test="${item.timeDay eq 2}">월요일</c:when>
								<c:when test="${item.timeDay eq 3}">화요일</c:when>
								<c:when test="${item.timeDay eq 4}">수요일</c:when>
								<c:when test="${item.timeDay eq 5}">목요일</c:when>
								<c:when test="${item.timeDay eq 6}">금요일</c:when>
								<c:when test="${item.timeDay eq 7}">토요일</c:when>
							</c:choose>
							
							</td>
							<td>${item.timeHour}:00</td>
							<td><a href="/shop/setting/${item.shopNo}/deleteTime/${item.timeNo}" class="btn btn-outline-danger btn-sm">삭제</a>							
						</tr>
					</c:forEach>					
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="4">
							<ul class="pagination justify-content-center mt-3" >
								<li class="page-item"><a href="?timeDay=2" class="page-link ${timeDay == 2 ? 'active' : ''}">월</a></li>
								<li class="page-item"><a href="?timeDay=3" class="page-link ${timeDay == 3 ? 'active' : ''}">화</a></li>
								<li class="page-item"><a href="?timeDay=4" class="page-link ${timeDay == 4 ? 'active' : ''}">수</a></li>
								<li class="page-item"><a href="?timeDay=5" class="page-link ${timeDay == 5 ? 'active' : ''}">목</a></li>
								<li class="page-item"><a href="?timeDay=6" class="page-link ${timeDay == 6 ? 'active' : ''}">금</a></li>
								<li class="page-item"><a href="?timeDay=7" class="page-link ${timeDay == 7 ? 'active' : ''}">토</a></li>
								<li class="page-item"><a href="?timeDay=1" class="page-link ${timeDay == 1 ? 'active' : ''}">일</a></li>
							</ul>
						</td>
					</tr>
				</tfoot>
				
			</table>
		</div>
	</div>
</div>
</div>
</div>

<!-- 영업 시간 등록 : 끝시간의 min 설정  -->
<script>
document.addEventListener('DOMContentLoaded', function() {
	let $sInp = $('[name="startTime"]')
	$sInp.on('change', function(){
		let sVal = parseInt($sInp.val());
		console.log(sVal);
		$('[name="endTime"]').attr('min', sVal);
	});
});
</script>
<!-- 영업 시간 등록 : 끝시간의 min 설정  -->

<!-- 로그인 실패 메세지 -->   
 <script>
	const msg = "${msg}"; //따옴표가 있어야 작동함, 없으면 변수이름으로 인식함
	if(msg)
		alert(msg);
</script>
<!-- 로그인 실패 메세지 -->  
	
<jsp:include page="../footer.jsp"></jsp:include>	
	
</body>
</html>
