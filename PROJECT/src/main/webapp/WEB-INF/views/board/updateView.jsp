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
textarea {
	vertical-align: top;
}

label[for="content"] {
	position: relative;
	top: 13px;
}

#title {
	margin: 5px;
	height: 40px;
	width: 700px;
	margin-left: 37px;
}

#writer {
	height: 40px;
	width: 700px;
	margin-left: 23px;
}

#content {
	margin: 5px;
	width: 700px;
	margin-left: 34px;
	height: 400px;
}

#reg {
	
	padding-right: 8px;
}

#list_btn a {
background-color: black;
	color: white;
	padding: 8px;
	border-radius: 5px;
	
	text-decoration:none
}

#btn_under{
	background-color: black;
	color: white;
	padding: 7.5px;
	position: relative;
	top:25px;
	left: 780px;
	border-radius: 5px;
	border:none;

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
					<li class="item"><a class="link"
						href="/board/list">Home </a></li>
					<c:if test="${sessionScope.member == null }">
						<li class="item"><a class="link" href="/member/login">Login</a></li>
					</c:if>
					
					<c:if test="${sessionScope.member != null }">
						<li class="item"><a class="link_out" href="/member/logout">Logout</a></li>
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

	<!-- Content -->
	<div id="root">
		
			

		<section id="container">
			<form name="updateForm" role="form" method="post"
				action="/board/update">
				<input type="hidden" name="bno" value="${update.bno}"
					readonly="readonly" />
				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요"/></td>
						</tr>
						<tr>
							<td><label for="writer">작성자</label><input type="text"
								id="writer" name="writer" value="${update.writer}"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label>
							<textarea id="content" name="content" class="chk" title="내용을 입력하세요"><c:out
										 value="${update.content}" /></textarea></td>
						</tr>
						<tr>
							<td><label for="regdate" id="reg">작성날짜</label> <fmt:formatDate
									value="${update.regdate}" pattern="yyyy-MM-dd"  /></td>
						</tr>
					</tbody>
				</table>
				<div>
					<button id="btn_under" type="submit" class="update_btn">저장</button>
					<button id="btn_under" type="submit" class="cancel_btn">취소</button>
				</div>
				
				<div id="list_btn">
					<a href="/board/list">목록</a>

				</div>
			</form>
		</section>
		
	</div>


		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			
			
				var session = "${sessionScope.member}";
			var formObj = $("form[name='updateForm']");
			
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			$(".link").on("click", function() {

				var deleteYN = confirm("정말 로그아웃하시겠습니까?");
				if (deleteYN == true) {

					location.href = '/member/logout';
				}

			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		</script>
</body>
</html>