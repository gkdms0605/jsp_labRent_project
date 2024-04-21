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
		
		String sql = "insert into tbl_reserve values(?,?,?,?)";
		
		pstmt = con.prepareStatement(sql);
		
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String num = request.getParameter("num");
		String lab = request.getParameter("lab");
		
		pstmt.setString(1, id);
		pstmt.setString(2, date);
		pstmt.setString(3, num);
		pstmt.setString(4, lab);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	%>
</body>
<script type="text/javascript">
	alert("실습실 대여가 완료되었습니다.");
	window.location.href="booking.jsp";
</script>
</html>