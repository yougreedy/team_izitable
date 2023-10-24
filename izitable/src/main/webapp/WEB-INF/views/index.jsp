<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="/a" method="post" enctype="multipart/form-data">
    		<!-- 회원사진 등록 -->
				<div class="join_photo">
						<div>
							<label>제목:</label>
							<input name="title" type="text">
						</div>
						
						<div>
							<label>파일:</label>
							<input name="uploadFile" type="file">
						</div>
						
						<div>
							<button type="submit">파일등록</button>
						</div>
				</div>
				
				<hr>
				
				<div>
					<c:if test="${list.size() <1}">
						<ul>
							<li>등록된 이미지가 없습니다</li>
						</ul>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<ul>
							<li>
								<div${item.title}></div>
								<div><img alt="${item.title}" src="/upload/${item.filename}"></div>
							</li>
						</ul>
					</c:forEach>
					
				</div>
    </form>
</body>
</html>