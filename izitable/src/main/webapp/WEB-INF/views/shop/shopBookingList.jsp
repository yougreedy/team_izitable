<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px; margin-top: 50px;}
/* body {margin: 0; padding: 0; margin-top: 50px;} */
</style>
</head>

<body>
<jsp:include page="../nav2.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	
	
	<div style="/*border: 2px solid black;*/ text-align: center;">
		
			<button class="btn btn-lg" style="margin-right: 30px;"><a href="/shop/booking/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
			<button class="btn" style="margin-right: 30px;"><a href="/shop/setting/${sessionScope.shop.shopNo}"><h3>매장 설정</h3></a></button>
			<button class="btn"><a href="/shop/update/${sessionScope.shop.shopNo}"><h3>정보 변경</h3></a></button>

	</div>
	
	<br>
		
		<div>
			총 예약 수 <fmt:formatNumber value="${pager.total}" pattern="#"></fmt:formatNumber> 건
		</div>
		
		<div>
			<table class="list_table">
				<thead>
					<tr>
						<th width="60">예약번호</th>
						<th>회원이름</th>
						<th>회원이메일</th>
						<th>연락처</th>
						<th>예약날짜</th>
						<th width="60">예약시간</th>
						<th width="60">예약인원</th>
						<th width="60">수용인원</th>
						<th>테이블이름</th>	
						<th>요청사항</th>	
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일" var="today" />
					
					<c:forEach var="item" items="${list}">
					<fmt:formatDate value="${item.bookingDate}" pattern="yyyy년 MM월 dd일" var="bookingDate" />
						<tr <c:if test="${bookingDate < today}">class="table-danger"</c:if>>
							<td>${item.bookingNo}</td>
							<td>${item.userName}</td>
							<td>${item.userEmail}</td>
							<td>${item.userPhone}</td>
							<td>${bookingDate}</td>
							<td>${item.bookingTime}:00</td>
							<td>${item.bookingMemNum}</td>
							<td>${item.tableNumber}</td>
							<td>${item.tableName}</td>
							<td>${item.message}</td>
							<td>
								<button><a href="/shop/booking/${item.shopNo}/delete/${item.bookingNo}" class="btn btn-warning btn-sm btn-del">삭제</a></button>
							</td>
						</tr>
					</c:forEach>	
					
					<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="11">검색 된 예약이 없습니다</td>
					</tr>
					</c:if>
				</tbody>
				
			<tfoot>
				<tr>
					<td colspan="11">
						<ul class="pagination justify-content-center mt-3">
							<li class="page-item"><a class="page-link" href="?page=1${pager.query}">처음</a></li>
							<li class="page-item"><a class="page-link" href="?page=${pager.prev}${pager.query}">이전</a></li>
							<c:forEach var="page" items="${pager.list}">
								<li class="page-item"><a class="page-link ${page == pager.page ? 'active' : ''}" href="?page=${page}&offset=${pager.offset}">${page}</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link" href="?page=${pager.next}${pager.query}">다음</a></li>
							<li class="page-item"><a class="page-link" href="?page=${pager.last}${pager.query}">마지막</a></li>
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

<!-- 로그인 성공 메세지 -->   
<script>
	const msg = "${msg}"; //따옴표가 있어야 작동함, 없으면 변수이름으로 인식함
	if(msg) {
		alert(msg);
	}
</script>

<!-- 삭제 확인 알람창 -->
<script>
$(document).ready(function(){
	//삭제
	$(".btn-del").click(function(){
		if(!confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까?')){
	        return false;
	    }
	});
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
