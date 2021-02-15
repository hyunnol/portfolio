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

<!-- Navigation -->
	<nav class="navbar">
		<div class="container">
			<a class="navbar-logo" href="board/list">Movie is LIFE</a>

			<div class="navbar-collapse">
				<ul class="navbar-sort">
					<li class="item"><a class="link"
						href="/board/list">Home </a></li>
					
						<li class="item"><a class="link" href="/member/login">Login</a></li>
					
					
					<li class="item"><a class="link" href="#">My Page</a></li>

				</ul>
			</div>
		</div>
	</nav>
	
<div id="container">
			<form action="/member/register" method="post" id="regForm">
			
				<div class="form">
					<label class="label1" for="userid">아이디</label>
					<input  class="inputbox" type="text" id="userid" name="userid" />
					
					<div id="id_chk" value="N"></div>
					
				</div>
				<div class="form">
					<label class="label2" for="userpass">패스워드</label>
					<input class="inputbox" type="password" id="userpass" name="userpass" />
				</div>
				<div class="form">
					<label class="label3" for="username">성명</label>
					<input class="inputbox" type="text" id="username" name="username" />
				</div>
				<div class="form">
					<button class="btn" type="submit" id="submit">회원가입</button>
					
				</div>
				
				<div id="form">
				<button class="cancel_btn" type="button">취소</button>
				</div>
			</form>



<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel").on("click", function(){
				location.href = "/member/login";
			})
			
			$("#submit").on("click", function(){
				if($("#userid").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				if($("#userpass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userpass").focus();
					return false;
				}
				if($("#username").val()==""){
					alert("성명을 입력해주세요.");
					$("#username").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복인 아이디 입니다. 다시 입력해주세요");
				}else if(idChkVal == "Y"){
					alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다");
					$("#regForm").submit();
					
					
				} 
			});
		})
		
		$("#userid").blur(function(){
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"userid" : $("#userid").val()},
				success : function(data){
					if(data == 1 && $("#userid") != ""){
						$("#id_chk").text("이미 사용중인 아이디입니다");
						$("#id_chk").css("color","red");
					}else if(data == 0){	
						$("#id_chk").text("사용가능한 아이디입니다 ");
						$("#id_chk").css("color","red");
						$("#id_chk").attr("value"," Y");
						
						
						
					}
				}
			})
		})
		</script>
</body>
</html>