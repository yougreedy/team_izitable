<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
img {
	margin:0;
	border:none;
	padding-bottom: 20px;
}
</style>

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky" style="position: fixed; background-color: white">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="${pageContext.request.contextPath}/" class="iz_logo3">
                        <img src="/resources/assets/images/IZITABLE_logo2.png">
                    </a>
                    <!-- ***** Logo End ***** -->
                    
     <!-- ***** search box start ***** -->
                    
					<form name="form1" method="get" action="/list" style="width: 350px">
					    <div class="search">
					        <input type="text" name="keyword" value="${pager.keyword}" placeholder="지역, 음식, 매장명 검색">
					    </div>
					</form>
					
	<!-- ***** search box End *****-->

                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="/list">음식점</a></li>
                        
                        <c:if test="${sessionScope.user == null and sessionScope.shop == null}"> <!-- session에 있는 정보 꺼내옴 -->
                        	<li class="scroll-to-section"><a href="/login" id="loginalert">예약관리</a></li>
                        	<script>
                        	document.querySelector('#loginalert').addEventListener('click', function(){
                        		alert('로그인 후 이용 가능합니다');
                        	});
                        	</script>
                        </c:if>
                        
                        <c:if test="${sessionScope.user != null or sessionScope.shop != null}">
							<c:if test="${sessionScope.user != null}">
								<c:choose>
									<c:when test="${sessionScope.user.userNo <= 0}">
										<li class="scroll-to-section"><a href="/admin/userlist">예약관리</a></li>
									</c:when>
									<c:otherwise>
										<li class="scroll-to-section"><a href="/user/booking/${sessionScope.user.userNo}">예약관리</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${sessionScope.shop != null}">
								<li class="scroll-to-section"><a href="/shop/booking/${sessionScope.shop.shopNo}">예약관리</a></li>
							</c:if>
						</c:if>
						
                        <!-- <li class="scroll-to-section"><a href="#"> </a></li> -->
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <c:if test="${sessionScope.user == null and sessionScope.shop == null}"> <!-- session에 있는 정보 꺼내옴 -->
                        	<li class="scroll-to-section"><a href="/login" class="active">로그인/회원가입</a></li>
                        </c:if>
                        
                        <c:if test="${sessionScope.user != null or sessionScope.shop != null}">
                        	<li class="scroll-to-section"><a href="/logout" class="active">로그아웃</a></li>
							<c:if test="${sessionScope.user != null}">
								<c:choose>
									<c:when test="${sessionScope.user.userNo <= 0}">
										<li class="scroll-to-section"><a href="/admin/userlist"><img src="/resources/image/normal2.png" style="height: 20px; width: 20px; margin-right: 5px; padding-bottom: 0px;" >${sessionScope.user.userName}님</a></li>
									</c:when>
									<c:otherwise>
										<li class="scroll-to-section"><a href="/user/booking/${sessionScope.user.userNo}"><img src="/resources/image/normal.png" style="height: 30px; width: 30px; margin-right: 5px; padding-bottom: 0px;">${sessionScope.user.userName}님</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${sessionScope.shop != null}">
								<li class="scroll-to-section"><a href="/shop/booking/${sessionScope.shop.shopNo}"><img src="/resources/image/shop.png" style="height: 30px; width: 30px; margin-right: 5px; padding-bottom: 0px;">${sessionScope.shop.compName}님</a></li>
							</c:if>
						</c:if>
                        
                        <!-- 
                        <li class="submenu">
                            <a href="javascript:;">Drop Down</a>
                            <ul>
                                <li><a href="#">Drop Down Page 1</a></li>
                                <li><a href="#">Drop Down Page 2</a></li>
                                <li><a href="#">Drop Down Page 3</a></li>
                            </ul>
                        </li>
                    -->


                        <!-- <li class=""><a rel="sponsored" href="https://templatemo.com" target="_blank">External URL</a></li> -->

                    </ul>
                    
                    <!-- <a class='menu-trigger'>
                        <span>Menu</span>
                    </a> -->
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->