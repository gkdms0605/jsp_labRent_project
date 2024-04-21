<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
<style>
	*{
		margin:0;
		padding:0;
		font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	}
	header{
		display: flex;
    	justify-content: space-between;
    	align-items: center;
   		border-bottom: 1px solid #f5f5f5;
    	padding:20px;
    	margin-bottom:20px;
	}
	.header-logo{
		display:flex;
		align-items:center;
	}
		
	.header-logo h1{
		font-weight: 500;
    	color: #00437c;
    	font-size: 28px;
	}
	.logo-image{
		width:45px;
		margin-right:10px;
	}
	a{
		all:unset;
	}
	a:hover{
		cursor: pointer;
		font-weight:400;
	}
	nav a {
		font-size:20px;
		padding-left:20px;
		font-weight: 300;
	}
	section{
		padding:20px;
		padding-bottom:50px;
	}
	.content-title {
    font-weight: 400;
    font-size: 30px;
    margin-bottom: 10px;
}
</style>
<body>
	<header>
		<a href="index.jsp" class="header-logo">
			<image class="logo-image" src="https://i.namu.wiki/i/MKVzEoiy3x8LPP3132QfrsQVfgiJ6RSMI9ao7roOGUVceD9h0IP46FHXgrpyScLpsVjxLJtnRPjrVsGLN_MS_258AiSk91f4CN0dzkhXKmCctRG31jAuKjureQo_z6LsIF6z7pl88ixbf6ASetMkYA.webp">
			<h1>실습실 대여 프로그램</h1>
		</a>

		<nav>
			<a href="list.jsp">실습실 목록</a>
			<a href="booking.jsp">대여 신청</a>
			<a href="inquiry.jsp">대여 조회</a>
			<a href="regist.jsp">학생 등록</a>
			<a href="login.jsp">마이페이지</a>
		</nav>
	</header>
</body>
</html>

