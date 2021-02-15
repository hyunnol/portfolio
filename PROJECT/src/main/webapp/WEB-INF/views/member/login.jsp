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

<style>
#container {
	position: absolute;
	left: 650px;
	top: 200px;
	font-size: 1.2em;
	background-color: whitesmoke;
	padding: 20px;
	border-radius: 7px;
}

.form {
	margin: 9px;
}

label {
	color: black;
}

.inputbox {
	width: 340px;
	height: 35px;
}

.btn {
	width: 350px;
	background-color: black;
	color: white;
	border: none;
}

.btn:hover {
	color: white;
}

.login_btn {
	width: 350px;
	margin-left: 1px;
	background-color: black;
	color: white;
	border-radius: 5px;
	font-size: 0.85em;
	height: 35px;
	border: none;
	margin-top: 5px;
}
</style>
</head>
<body>

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutBtn").on("click", function() {
				location.href = "member/logout";
			})

		})
	</script>
</body>



<!-- Navigation -->
<nav class="navbar">
	<div class="container">
		<a class="navbar-logo" href="/board/list">Movie is LIFE</a>

		<div class="navbar-collapse">
			<ul class="navbar-sort">
				<li class="item"><a class="link" href="/board/list">Home </a></li>

				
					<li class="item"><a class="link" href="/member/login">Login</a></li>
				

				

				<li class="item"><a class="link" href="#">My Page</a></li>

			</ul>
		</div>
	</div>
</nav>
<form name='homeForm' method="post" autocomplete="off" action="/member/login">
	<section id="container">
		
			<div class="form">
				<label class="label1" for="userid"></label> <input class="inputbox"
					type="text" id="userid" name="userid" placeholder="아이디">
			</div>
			<div class="form">
				<label class="label2" for="userpass"></label> <input
					class="inputbox" type="password" id="userpass" name="userpass"
					placeholder="비밀번호">
			</div>
			<div class="form">
				<button class="login_btn" type="submit" id="login_btn">로그인</button>

			</div>
			<div class="form">

				<button class="btn" type="button"
					onclick="location.href = '/member/register' ">회원가입</button>
			</div>
		
		<div>
		${msg}
		</div>


	</section>
</form>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	
		
		$("#login_btn").on("click",function(){
			
			if($("#userid").val() == "") {
				alert("아이디를 입력해주세요");
				$("#userid").focus();
				return false;
				
			}
			if($("#userpass").val() == ""){
				alert("비밀번호를 입력해주세요");
				$("#userpass").focus();
				return false;
				
			}
		
		
		})
		

	})
</script>
</html>