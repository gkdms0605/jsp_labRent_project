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
</style>
<body>
	<%@ include file="header.jsp" %>
	<section>
		
		<h2 class="content-title">실습실 대여 조회</h2>
		<table>
		<tr>
			<th>예약번호</th>
			<th>학번</th>
			<th>이름</th>
			<th>실습실</th>
			<th>대여일자</th>
		</tr>
		<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = "select re.reserve_id, me.stu_num, me.name, la.lab_name, re.reserve_date from tbl_reserve re join tbl_member me on re.stu_num = me.stu_num join tbl_lab la on re.lab_id = la.lab_id order by re.reserve_id";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String num = rs.getString(1);
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
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>