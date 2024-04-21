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
		PreparedStatement pstmt = null;
		
		String sql = "insert into tbl_member values(?,?,?,?)";
		
		pstmt = con.prepareStatement(sql);
		
		String num = request.getParameter("stu_num");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd1");
		
		pstmt.setString(1, num);
		pstmt.setString(2, name);
		pstmt.setString(3, id);
		pstmt.setString(4, passwd);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	%>
</body>
<script type="text/javascript">
	alert("회원가입이 완료되었습니다.");
	window.location.href="regist.jsp";
</script>
</html>