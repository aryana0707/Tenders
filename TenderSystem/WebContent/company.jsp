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
		try{
			Connection conn=JavaToOracle.getCon();
			String sql="insert into COMPANY values(?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			
			pst.setInt(1, Integer.parseInt(request.getParameter("ccode")));
			pst.setString(2, request.getParameter("cname"));
			pst.setString(3, request.getParameter("cat"));
			pst.setDouble(4, Double.parseDouble(request.getParameter("tover")));
			pst.setInt(5, Integer.parseInt(request.getParameter("emNumber")));
			pst.setString(6, request.getParameter("ho"));
			pst.setString(7, request.getParameter("types"));
			
			int x=pst.executeUpdate();
			if(x>0){
				%>
					<h1>Company registered.</h1>
				<%
			}else{
				%>
				<h1>Company NOT registered.</h1>
				<%
			}
		}catch(Exception e){
			System.out.println(e);
			%>
			<h1>Company NOT registered.</h1>
			<%
		}
	
	%>
</body>
</html>