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
		
		String num = request.getParameter("stu_num");
		
		String sql = "update tbl_member set name = ?, id = ?, passwd = ? where stu_num = '"+num+"'";
		
		pstmt = con.prepareStatement(sql);
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd1");
		
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, passwd);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	%>
</body>
<script type="text/javascript">
	alert("회원 정보 수정이 완료되었습니다.");
	const id = "<%=id%>";
	window.location.href="mypage.jsp?id="+id;
</script>
</html>