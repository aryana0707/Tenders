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
<%@include file="header.html" %>

<br/>
	<form action="company.jsp" method="post">
		<h1 style="color: red;" align="center">Company or Supplier Registration!</h1>
		<table align="center" cellpadding="8" cellspacing="8" bgcolor="lightblue">
			<tr>
				<td>Company Code or Registration Number</td>
				<td>
					<input type="text" name="ccode" size="35">
				</td>
			</tr>
			
			<tr>
				<td>Company Name</td>
				<td><input type="text" name="cname" size="35"></td>
			</tr>
			
			<tr>
				<td>Category</td>
				<td>
				<select name="cat">
					<%
					
						try{
							Connection con=JavaToOracle.getCon();
							String sql="select * from COMPANYCATEGORY";
							PreparedStatement pst=con.prepareStatement(sql);
							ResultSet rs=pst.executeQuery();
							
							while(rs.next()){
								String names=rs.getString("CNAME");
								%>
								<option value="<%=names%>"><%=names%></option>
								<%
								
							}
						}catch(Exception e){
							
						}
					%>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>Type</td>
				<td>
					<select name="types">
					<%
					
						try{
							Connection con=JavaToOracle.getCon();
							String sql="select * from COMPANYTYPE";
							PreparedStatement pst=con.prepareStatement(sql);
							ResultSet rs=pst.executeQuery();
							
							while(rs.next()){
								String names=rs.getString("TYPENAME");
								%>
								<option value="<%=names%>"><%=names%></option>
								<%
								
							}
						}catch(Exception e){
							
						}
					%>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>Turnover (in Million $)</td>
				<td>
					<input type="text" name="tover"> 
				</td>
			</tr>
			
			<tr>
				<td>Number of Employees</td>
				<td>
					<input type="text" name="emNumber"> 
				</td>
			</tr>
			
			<tr>
				<td>Head Office</td>
				<td><input type="text" name="ho"> </td>
			</tr>
			
			<tr>
				<td><input type="submit" name="Submit"> </td>
				<td><input type="reset" name="Reset"></td>
			</tr>
		</table>
	</form>
<br/>
<br/>
<%@include file="footer.html" %>

</body>
</html>