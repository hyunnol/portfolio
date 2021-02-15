<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Movie Is Life::</title>

<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/main/widget.css">

<style>
#container{
	position: absolute;
	left:650px;
	top:200px;
	font-size:1.2em;
	background-color:whitesmoke;
	padding:20px;
	border-radius:7px;
	
}

.form{
 margin:7px;
 
}
label{
color:black;



}
.inputbox {
	width:250px;
	height:35px;
	
	
}

.label1 {
padding-right:34px;
}

.label2 {
padding-right:17px;
}
.label3 {
padding-right:50px;
}
.btn {
width:350px;
background-color:darkgray;
color:white;
}
.btn:hover {
color:white;

}

.cancel_btn {
width:350px;
margin-left:8px;
background-color:darkgray;
color:white;
border-radius:5px;
font-size:0.85em;
height:35px;
border:none;
}

</style>
</head>
<body>
${sessionScope.member}
<!-- Navigation -->
	<nav class="navbar">
		<div class="container">
			<a class="navbar-logo" href="/board/list">Movie is LIFE</a>

			<div class="navbar-collapse">
				<ul class="navbar-sort">
					<li class="item"><a class="link" href="/board/list">Home </a></li>
					
					
					
					<c:if test="${sessionScope.member != null }">
						<li class="item"><a class="link" href="/member/logout">Logout</a></li>
					</c:if>
					<li class="item"><a class="link" href="#">My Page</a></li>

				</ul>
			</div>
		</div>
	</nav>
	
<div id="container">
			<form action="/member/memberUpdate" method="post">
			
				<div class="form">
					<label class="label1" for="userId">아이디</label>
					<input  class="inputbox" type="text" id="userid" name="userid" value="${member.userid}" readonly />
				</div>
				<div class="form">
					<label class="label2" for="userPass">패스워드</label>
					<input class="inputbox" type="password" id="userpass" name="userpass" value="${member.userpass}"  />
				</div>
				<div class="form">
					<label class="label3" for="userName">성명</label>
					<input class="inputbox" type="text" id="username" name="username" value="${member.username}" />
				</div>
				<div class="form">
					<button class="btn" type="submit" id="submit">회원정보수정</button>
					
				</div>
				
				<div id="form">
				<button class="cancel_btn" type="button">취소</button>
				</div>
			</form>
		</section>
		


<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel_btn").on("click", function(){
				
				location.href = "/login";
						    
			})
		
		
			
				
			
		})
		</script>
</body>
</html>