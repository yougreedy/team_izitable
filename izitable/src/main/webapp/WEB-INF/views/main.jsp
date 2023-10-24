<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<jsp:include page="header.jsp"></jsp:include>

<body>

<jsp:include page="nav.jsp"></jsp:include>

    <!-- ***** Main Banner Area Start ***** -->
    <div id="top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="left-content">
                        <div class="inner-content">
                            <h4>IZITable</h4>
                            <h6>ENJOY YOUR MEAL :p</h6>
                            
                            <div class="main-white-button scroll-to-section">
                                <a href="/list?keyword=">예약하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="main-banner header-text">
                        <div class="Modern-Slider">
                            <!-- Item -->
                            <div class="item">
                                <div class="img-fill">
                                    <img src="/resources/assets/images/slide-01.jpg" alt="">
                                </div>
                            </div>
                            <!-- // Item -->
                            <!-- Item -->
                            <div class="item">
                                <div class="img-fill">
                                    <img src="/resources/assets/images/slide-02.jpg" alt="">
                                </div>
                            </div>
                            <!-- // Item -->
                            <!-- Item -->
                            <div class="item">
                                <div class="img-fill">
                                    <img src="/resources/assets/images/slide-03.jpg" alt="">
                                </div>
                            </div>
                            <!-- // Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->


    <!-- ***** Menu Area Starts ***** -->
    <section class="section" id="menu">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="section-heading">
                        <h6>Popular Restaurant</h6>
                        <h2>인기 음식점</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu-item-carousel">
            <div class="col-lg-12">
                <div class="owl-menu-item owl-carousel">
                
                <c:forEach var="item" items="${list}">
                	<div class="item">
                		<c:choose>
							<c:when test="${item.imgFilename == null || item.imgFilename == \"\"}">
								<div class='card' style="background-image: url(/resources/image/shop.png);">
							</c:when>
							<c:otherwise> 
								<div class='card' style="background-image: url(/upload/${item.imgFilename});">
							</c:otherwise>
						</c:choose>
                		
                		<!-- 
                		<c:if test="${item.imgFilename != null}">
                        	<div class='card' style="background-image: url(/upload/${item.imgFilename});">
                        </c:if>
                        <c:if test="${item.imgFilename == null}">
                        	<div class='card' style="background-image: url(/resources/image/shop.png);">
                        </c:if>
                         -->
                        
                            <div class='info'>
                                <h1 class='title'>${item.compName}</h1>
                                <p class='description'>${item.compIntro}</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="/booking/shop/${item.shopNo}">예약하기<i
                                                class="fa fa-angle-down"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                
                
                    <!-- 원본 템플릿 -->
                    <!-- 
                    <div class="item">
                        <div class='card card1'>
                            <div class='info'>
                                <h1 class='title'>Chocolate Cake</h1>
                                <p class='description'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedii do
                                    eiusmod teme.</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="#reservation">Make Reservation <i
                                                class="fa fa-angle-down"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <div class='card card2'>
                            <div class='info'>
                                <h1 class='title'>Klassy Pancake</h1>
                                <p class='description'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedii do
                                    eiusmod teme.</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="#reservation">Make Reservation <i
                                                class="fa fa-angle-down"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <div class='card card3'>
                            <div class='info'>
                                <h1 class='title'>Tall Klassy Bread</h1>
                                <p class='description'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedii do
                                    eiusmod teme.</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="#reservation">Make Reservation <i
                                                class="fa fa-angle-down"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <div class='card card4'>
                            <div class='info'>
                                <h1 class='title'>Blueberry CheeseCake</h1>
                                <p class='description'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedii do
                                    eiusmod teme.</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="#reservation">Make Reservation <i
                                                class="fa fa-angle-down"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <div class='card card4'>
                            <div class='info'>
                                <h1 class='title'>Blueberry CheeseCake</h1>
                                <p class='description'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedii do
                                    eiusmod teme.</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="#reservation">Make Reservation <i
                                                class="fa fa-angle-down"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <div class='card card5'>
                            <div class='info'>
                                <h1 class='title'>Klassy Cup Cake</h1>
                                <p class='description'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedii do
                                    eiusmod teme.</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="#reservation">Make Reservation <i
                                                class="fa fa-angle-down"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <div class='card card3'>
                            <div class='info'>
                                <h1 class='title'>Klassic Cake</h1>
                                <p class='description'>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedii do
                                    eiusmod teme.</p>
                                <div class="main-text-button">
                                    <div class="scroll-to-section"><a href="#reservation">Make Reservation <i
                                                class="fa fa-angle-down"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                     -->
                    
                    
                    
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Menu Area Ends ***** -->

    <!-- jQuery -->
    <script src="/resources/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="/resources/assets/js/popper.js"></script>
    <script src="/resources/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/resources/assets/js/owl-carousel.js"></script>
    <script src="/resources/assets/js/accordions.js"></script>
    <script src="/resources/assets/js/datepicker.js"></script>
    <script src="/resources/assets/js/scrollreveal.min.js"></script>
    <script src="/resources/assets/js/waypoints.min.js"></script>
    <script src="/resources/assets/js/jquery.counterup.min.js"></script>
    <script src="/resources/assets/js/imgfix.min.js"></script>
    <script src="/resources/assets/js/slick.js"></script>
    <script src="/resources/assets/js/lightbox.js"></script>
    <script src="/resources/assets/js/isotope.js"></script>

    <!-- Global Init -->
    <script src="/resources/assets/js/custom.js"></script>
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

<!-- 로그인 성공 메세지 -->   
<script>
	const msg = "${msg}"; //따옴표가 있어야 작동함, 없으면 변수이름으로 인식함
	if(msg)
		alert(msg);
</script>

<jsp:include page="footer.jsp"></jsp:include>    
    
</body>

</html>