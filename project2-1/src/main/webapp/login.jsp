<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경북소프트웨어고등학교 실습실 대여 프로그램</title>
</head>
<style>
	.inputbox{
		display:flex;
		flex-direction:column;
		font-size:16px;
		font-weight:500;
		width:300px;
		margin-bottom:20px;
	}
	.input{
		padding:10px;
		margin-right:20px;
		border:0;
		background-color:#f3f5f9;
		margin-top:3px;
		border-radius:5px;
	}
	.input::placeholder{
		font-size:16px;
		font-weight:400;
	}
	.input:focus{
		outline: 2px solid #21cb91;
	}
	.form-submit-button{
		padding:10px;
		border:0;
		background-color:#3b3944;
		color:white;
		font-size:16px;
		font-weight:300;
		border-radius:3px;
		transition: 0.1s;
		margin-top:5px;
	}
	.form-submit-button:hover{
		background-color: #21cb91;
		color:white;
	}
</style>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<h2 class="content-title">로그인</h2>
		<form name="form" method="post" action="login_ok.jsp">
					<div class="inputbox">
						아이디
						<input type="text" name="id" placeholder="이름" class="input">
					</div>
					<div class="inputbox">
						비밀번호
						<input type="password" name="passwd" placeholder="학번" class="input">
					</div>
			
				
			<input type="button" value="로그인" class="form-submit-button" onclick="valid_check()">
				
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
	<script type="text/javascript">
		function valid_check(){
			const login = document.form;
			if(login.id.value==""){
				alert("아이디를 입력해주세요.");
				login.id.focus();
				return false;
			} else if(login.passwd.value==""){
				alert("비밀번호를 입력해주세요.");
				login.passwd.focus();
				return false;
			} else{
				login.submit();
			}
		}
	</script>
</html>