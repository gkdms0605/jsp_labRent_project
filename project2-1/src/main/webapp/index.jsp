<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경북소프트웨어고등학교 실습실 대여 프로그램</title>
</head>
<style>
	p{
		font-size:20px;
		font-weight:300;
	}
	.motive{
		margin-bottom:50px;
	}
	.introduct li{
		margin-left:20px;
	}
	ol li h3{
		font-size:23px;
		font-weight:400;
		margin-bottom:10px;
	}
	
	ol li{
		margin-top:15px;
		margin-bottom:15px;
	}
</style>
<body>
	<%@include file="header.jsp" %>
	<section>
		<div class="motive">
			<h2 class="content-title">개발동기</h2>
			<p>교내 실습실을 빌리기 위해선 학생이 직접 선생님을 찾아가 사용할 실과 사용 인원, 대여 사유를 말씀드려야 합니다.</p>
			<p>이를 시스템화 하여 학생들과 선생님들이 보다 편리하게 실습실 관리를 한다면 좋을 것 같아 이번 프로젝트를 계획하게 되었습니다.</p>
		</div>
		<div class="introduct">
			<h2 class="content-title">프로그램 소개</h2>
			<ol>
				<li>
					<h3>실습실 목록</h3>
					<p>교내 실습실 목록을 확인할 수 있습니다.</p>
				</li>
				<li>
					<h3>대여 신청</h3>
					<p>학생들이 실습실 대여를 신청할 수 있습니다.</p>
				</li>
				<li>
					<h3>대여 조회</h3>
					<p>대여된 실습실 목록을 조회할 수 있습니다.</p>
					<p>또한 검색 기능을 활용하여 특정 정보만 조회할 수 있습니다.</p>
				</li>
				<li>
					<h3>학생 등록</h3>
					<p>회원가입을 통해 학생 정보를 가져올 수 있습니다.</p>
					<p>가져온 정보는 실습실 대여 신청에 사용됩니다.</p>
				</li>
				<li>
					<h3>마이페이지</h3>
					<p>내 계정 정보를 수정할 수 있습니다.</p>
				</li>
				
			</ol>
		</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>