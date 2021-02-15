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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Cute+Font&family=Jua&family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
/* 게시판 목록 */
#table tr:first-child th {
	font-family: 'Nanum Gothic', sans-serif;
	background-color: black;
	color: white;
	padding: 15px;
	width: 700px;
	text-align: center;
}

#table tr td {
	font-family: 'Nanum Gothic', sans-serif;
	padding: 20px;
	width: 700px;
	border-bottom: 1px solid gray;
	text-align: center;
}

#top_btn a {
	background-color: black;
	color: white;
	padding: 10px;
	position: relative;
	left: 930px;
	border-radius: 5px;
	text-decoration: none;
}

#top_btn {
	margin-bottom: 13px;
}

.hide{
background-color:black;
color:white;
}


</style>
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar">
		<div class="container">
			<a class="navbar-logo" href="/board/list">Movie
				is LIFE</a>

			<div class="navbar-collapse">
				<ul class="navbar-sort">
					<li class="item"><a class="link" href="/board/list">Home </a></li>
					<c:if test="${sessionScope.member == null }">
						<li class="item"><a class="link" href="/member/login">Login</a></li>
						<li class="item"><a class="link" href="/member/login">MyPage</a></li>
					</c:if>

					<c:if test="${sessionScope.member != null }">
						<li class="item"><a class="link_out" href='#'>Logout</a></li>
						
								<li class="item"><a id="sm" class="link" href="/member/logout">My Page</a></li>
							<div class="topmenu">
								<ul class="submenu">
									<a href="/member/memberUpdateView">회원정보수정</a></br>
									<a href="/member/memberDeleteView">회원탈퇴</a>
								</ul>
							</div>
						
					</c:if>

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
							<li><a href="./cate?cate=로맨스/멜로" />로맨스/멜로</a></li>
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


		<div id="top_btn">

			<a id="a" href='#''>글 작성</a>
		</div>


		<section id="container">
			<table id="table">
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>

				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.bno}" /></td>
						<td><a href="/board/readView?bno=${list.bno}"><c:out
									value="${list.title}" /></a></td>
						<td><c:out value="${list.writer}" /></td>
						<td><fmt:formatDate value="${list.regdate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>

			</table>
			</form>
		</section>
		<hr />
	</div>

	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var session = "${sessionScope.member}";

			$(".link_out").on("click", function() {
				var deleteYN = confirm("정말 로그아웃하시겠습니까?");
				if (deleteYN == true) {

					location.href = '/member/logout';
				}

			})
			$("#a").on("click", function() {
				if (session == "" || session == null) {
					alert("로그인 후 작성하실 수 있습니다");
					location.href = "/member/login";

				} else {
					location.href = "/board/writeView";

				}

			})
			
	
		});
	</script>
</body>
</html>