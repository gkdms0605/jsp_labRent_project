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
		width:300px;
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
		
		<h2 class="content-title">실습실 목록</h2>
		<table>
		<tr>
			<th>번호</th>
			<th>실습실명</th>
		</tr>
		<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = "select lab_id, lab_name from tbl_lab";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String name = rs.getString(1);
			String id = rs.getString(2);
			%>
				<tr>
					<td><%= id%></td>
					<td><%= name%></td>
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