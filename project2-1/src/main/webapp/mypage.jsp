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
	.mypage-text{
		font-size: 25px;
		font-weight:400;
		padding-bottom:40px
	}
	.mypage-title{
		font-size:25px;
		font-weight:400;
		padding-bottom:15px;
	}
	table{
		width:auto;
		text-align:left;
		border:0px;
	}	
	th{
		padding:10px;
		background-color:#3b3944;
		color:white;
		font-weight:300;
	}
	td{
		padding:10px;
		background-color: #f5f5f5;
	}
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
	.my-reserve{
		margin-top:40px;
	}
</style>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<%
			String id = request.getParameter("id");
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			Statement stmt = con.createStatement();
			String sql = null;
		%>
		<h2 class="content-title">마이페이지</h2>
		
		<h3 class="mypage-text">환영합니다, <%=id %>님</h3>
		
		<div class="info">
		<p class="mypage-title">내 회원 정보</p>
		<form name="form" method="post" action="update_ok.jsp">
		<%
			sql = "select * from tbl_member where id = '"+id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			String name = "";
			String num = "";
			String passwd = "";
			while(rs.next()){
				num = rs.getString(1);
				name = rs.getString(2);
				id = rs.getString(3);
				passwd = rs.getString(4);
			}
		%>
			<div class="inputbox">
				이름
				<input type="text" name="name" placeholder="이름" class="input" value="<%=name%>">
			</div>
			<div class="inputbox">
				학번
				<input type="text" name="stu_num" placeholder="학번" class="input" maxlength="4" readonly value="<%=num%>">
			</div>
			<div class="inputbox">
				아이디
				<input type="text" name="id" placeholder="아이디" class="input" value="<%=id%>">
			</div>
			<div class="inputbox">
				비밀번호
				<input type="password" name="passwd1" placeholder="비밀번호" class="input" value="<%=passwd%>">
			</div>
			<input type="button" value="수정하기" class="form-submit-button" onclick="valid_check()">	
		</form>
		</div>
		
		<div class="my-reserve">
			<p class="mypage-title">내 예약 정보</p>
			<table>
			<tr>
				<th>예약번호</th>
				<th>학번</th>
				<th>이름</th>
				<th>실습실</th>
				<th>대여일자</th>
			</tr>
			<%
			sql = "select re.reserve_id, me.stu_num, me.name, la.lab_name, re.reserve_date from tbl_reserve re join tbl_member me on re.stu_num = me.stu_num join tbl_lab la on re.lab_id = la.lab_id where me.id = '"+id+"'";
			rs = stmt.executeQuery(sql);
			
			if(!rs.next()){
				%>
				<tr>
					<td colspan="5" align="center">정보가 존재하지 않습니다.</td>
				</tr>
				<%
			}
			
			else{
				num = rs.getString(1);
				String stuNum = rs.getString(2);
				String stuName = rs.getString(3);
				String labName = rs.getString(4);
				String date = rs.getString(5).substring(0,10);
			%>
				<tr>
					<td><%= num%></td>
					<td><%= stuNum%></td>
					<td><%= stuName%></td>
					<td><%= labName%></td>
					<td><%= date%></td>
				</tr>
			<%
		}
		rs.close();
		stmt.close();
		con.close();
		%>
			</table>
		</div>
	</section>
	
	<%@ include file="footer.jsp" %>
</body>
	<script>
		function valid_check(){
			const register = document.form;
			if(register.name.value==""){
				alert("이름을 입력해주세요.");
				register.name.focus();
				return false;
			} else if(register.stu_num.value==""){
				alert("학번을 입력해주세요.");
				register.stu_num.focus();
				return false;
			} else if(register.id.value==""){
				alert("아이디를 입력해주세요.");
				register.id.focus();
				return false;
			} else if(register.passwd1.value==""){
				alert("비밀번호를 입력해주세요.");
				register.passwd1.focus();
				return false;
			}else{
				register.submit();
			}
		}
	</script>
</html>