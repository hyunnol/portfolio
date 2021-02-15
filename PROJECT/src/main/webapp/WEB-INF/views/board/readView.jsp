<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Movie Is Life::</title>

<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/main/widget.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>

<style>
table {
	width: 1000px;
}

#table1 tr th, #table1 tr td {
	padding: 25px;
	border-bottom: 1px solid gray;
}

#table2 tr th, #table2 tr td {
	border-bottom: 1px solid gray;
}

button {
	float: right;
	margin: 7px;
}

.update_btn, .delete_btn{
background-color:black;
color:white;
border:none;
border-radius:5px;
padding:7px;
}
</style>
</head>
<body>
${sessionScope.member} 
	<!-- Navigation -->
	<nav class="navbar">
		<div class="container">
			<a class="navbar-logo" href="/board/list">Movie
				is LIFE</a>

			<div class="navbar-collapse">
				<ul class="navbar-sort">
					<li class="item"><a class="link"
						href="/board/list" >Home </a></li>
					<c:if test="${sessionScope.member == null }">
						<li class="item"><a class="link" href="/member/login">Login</a></li>
					</c:if>

					<c:if test="${sessionScope.member != null }">
						<li class="item"><a class="link_out" href='/member/logout'/>Logout</a></li>
					</c:if>
					<li class="item"><a class="link" href="#">My Page</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Sidebar Widgets Column -->
	<div class="side-bar">


		<!-- Search Widget -->
		<div class="widget1">
			<h5 class="card1-header">Search</h5>
			<div class="card1-body">
				<div class="input">
					<input type="text" class="form-input" placeholder="Search for...">
					<span class="button">
						<button class="btn" type="button">검색</button>
					</span>
				</div>
			</div>
		</div>

		<!-- Categories Widget -->
		<div class="widget2">
			<h5 class="card2-header">Categories</h5>
			<div class="card2-body">
				<div class="sel">
					<div class="row1">
						<ul class="list-theme1">
							<li><a href="#">로맨스/멜로</a></li>
							<li><a href="#">스릴러/공포/느와르</a></li>
							<li><a href="#">가족/코미디</a></li>
						</ul>
					</div>
					<div class="row2">
						<ul class="list-theme2">
							<li><a href="#">액션/SF</a></li>
							<li><a href="#">애니메이션</a></li>
							<li><a href="#">역사/다큐</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>



	</div>

	</div>

	<div id="root">

		<div>
			<%@include file="nav.jsp"%>
		</div>

		<section id="container">
			<form name="readForm" role="form" method="get">
				<input type="hidden" id="bno" name="bno" value="${read.bno} " />
				<table id="table1">
					<colgroup>
						<col style="width: 15%; background-color: black;" />
						<col style="width: 35%;" />
						<col style="width: 15%; background-color: black;" />
						<col style="width: 35%;" />


					</colgroup>

					<tr>

						<th style="color: white; text-align: center;">No.</th>
						<td>${read.bno}</td>

						<th style="color: white; text-align: center;">작성날짜</th>
						<td><fmt:formatDate value="${read.regdate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<th style="color: white; text-align: center;">제목</th>
						<td>${read.title}</td>

						<th style="color: white; text-align: center;">작성자</th>
						<td>${read.writer}</td>

					</tr>
				</table>

				<table id="table2" style="height: 400px;">

					<colgroup>
						<col style="width: 15%; background-color: black;" />
						<col style="width: 85%;" />
					</colgroup>
					<tr>
						<th style="color: white; text-align: center;">내용</th>
						<td style="padding: 10px;">${read.content}</td>
					</tr>
				</table>
				<c:if test="${sessionScope.userid eq read.writer}">
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					
				</div>
				</c:if>



			</form>
		</section>
		<hr />
	</div>

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	
		$(document).ready(function() {
			var formObj = $("form[name='readForm']");
			var session = "${sessionScope.member}";
			
			$(".link").on("click", function() {

				
				var deleteYN = confirm("정말 로그아웃하시겠습니까?");
				if (deleteYN == true) {

					location.href = '/member/logout';
				}

			})
			
			// 수정 
			$(".update_btn").on("click", function() {
			if(session == "" || session == null){
				alert("로그인 후 이용하실 수 있습니다");
				
				document.location.href ='/member/login';
			
			}else if(session != "" || session != null){
			
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();
			}
			
			})

			// 삭제

			$(".delete_btn").on("click", function() {
				if(session == "" || session == null){
				    alert("로그인 후 이용하실 수 있습니다");
				    location.href="/member/login";
				
				}else if(session != "" || session != null){
					
				var deleteYN = confirm("정말 삭제하시겠습니까?");
				if (deleteYN == true) {

					formObj.attr("action", "/board/delete");
					formObj.attr("method", "post");
					formObj.submit();

				}
			}
				
		})
			
			

			// 취소
			$(".list_btn").on("click", function() {

				location.href = "/board/list";
			})
		})
	</script>
</body>
</html>