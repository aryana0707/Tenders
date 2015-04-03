<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="p1.JavaToOracle"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	//scriptlet
	String name=request.getParameter("uname");
	String pass=request.getParameter("upass");
	
	try{
		Connection conn=JavaToOracle.getCon();
		String sql="select * from adminlog where username=? AND password=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setString(1, name);
		pst.setString(2, pass);
		
		ResultSet rs=pst.executeQuery();
		
		if(rs.next()){
			%>
				<jsp:forward page="adminMain.jsp"></jsp:forward>
			<%
		}else
		{
			%>
			<jsp:forward page="error.jsp"></jsp:forward>
			<%
		}
		
		
		
		
		
	}catch(Exception e){
		System.out.println(e);
		%>
		<jsp:forward page="error.jsp"></jsp:forward>
		<%
	}
%>
</body>
</html>