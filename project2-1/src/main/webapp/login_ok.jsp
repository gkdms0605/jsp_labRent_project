<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경북소프트웨어고등학교 실습실 대여 프로그램</title>
</head>
<body>
	<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		Statement stmt = con.createStatement();
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String sql = "select * from tbl_member where id = '" + id + "' and passwd = '" + passwd +"'";
		ResultSet rs = stmt.executeQuery(sql);
		if(!rs.next()){
			%>	
			<script type="text/javascript">
				alert("아이디/비밀번호가 일치하지 않습니다.");
				window.location.href="login.jsp"
			</script>
			<%
		} else {
			%>	
			<script type="text/javascript">
				const id = "<%= id %>";
				window.location.href="mypage.jsp?id="+id;
			</script>
			<%
		}
	%>
</body>
</html>