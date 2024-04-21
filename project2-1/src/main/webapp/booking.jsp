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
	<%@include file="header.jsp" %>
		<section>
			<h2 class="content-title">실습실 대여 신청</h2>
			<form name="form" method="post" action="booking_ok.jsp">
				<div class="inputbox">
				<%
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
				Statement stmt = con.createStatement();
				String sql = "select MAX(reserve_id)+1 from tbl_reserve";
				ResultSet rs = stmt.executeQuery(sql);
				String id = null;
				while(rs.next()){
					id = rs.getString(1);
				}
				rs.close();
				stmt.close();
				con.close();
				%>
				
					예약번호 (자동생성)
					<input type="text" name="id" class="input" readonly value="<%=id%>">
				</div>
				<div class="inputbox">
					예약일자
					<input type="date" name="date" class="input">
				</div>
				<div class="inputbox">
					학번
					<input type="text" name="num" class="input" maxlength="4">
				</div>
				<div class="inputbox">
					실습실
					<select name="lab" class="input">
						<option value="">==실습실을 선택해주세요==</option>
						<option value="0001">lab1</option>
						<option value="0002">lab2</option>
						<option value="0003">lab3</option>
						<option value="0004">lab4</option>
						<option value="0005">lab5</option>
						<option value="0006">lab6</option>
						<option value="0007">lab7</option>
						<option value="0008">lab8</option>
					</select>
				</div>
				
				<input type="button" value="예약하기" class="form-submit-button" onclick="valid_check()">
			</form>
		</section>
	<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	function valid_check(){
		const book = document.form;
		if(book.date.value==""){
			alert("예약일자를 선택해주세요.");
			book.date.focus();
			return false;
		} else if(book.num.value==""){
			alert("학번을 입력해주세요.");
			book.num.focus();
			return false;
		} else if(book.lab.value==""){
			alert("예약할 실습실을 선택해주세요.");
			book.lab.focus();
			return false;
		} else {
			book.submit();
		}
	}
</script>
</html>