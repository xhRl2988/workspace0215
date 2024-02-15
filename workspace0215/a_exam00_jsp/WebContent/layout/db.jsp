<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>홈쇼핑 회원관리</title>
</head>
<body>
<%
		Connection conn = null;
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String id="system";
		String pw="1234";
		
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			conn=DriverManager.getConnection(url,id,pw);
			
			System.out.println("DB 접속");
		}catch(Exception e){
			e.printStackTrace();
		}





%>
</body>
</html>