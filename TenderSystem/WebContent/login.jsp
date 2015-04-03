<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

	<script type="text/javascript">
		function validate(){
			
			var mail=document.form1.uname.value;
			var atpos=mail.indexOf("@");
			var dotpos=mail.lastIndexOf(".");
			
			if(atpos < 1 || dotpos<atpos+2 || dotpos + 2 >= mail.length && mail.length==0){
				alert("Not a valid email address");
				document.form1.uname.focus();
				return false;			
			}
			
			var pass=document.form1.upass.value;
			
			if(pass.length==0){
				alert("Please provide your password.");
				document.form1.upass.focus();
				return false;
			}
			
		}
	</script>

</head>
<body>
<%@include file="header.html" %>
<br/>
	<h1 style="color: blue;" align="center">Admin Login Form!</h1>
	<hr/>
	
	<form action="loginlogic.jsp" name="form1" onsubmit="return validate();">
		<table align="center" bgcolor="lightblue" cellpadding="8" cellspacing="8" width="60%">
			<tr>
				<td>Email Address</td>
				<td><input type="text" name="uname" size="40"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="upass" size="40"></td>
			</tr>
			<tr>
				<td><a href="forgot.jsp">Are you forgot the password?</a></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="submit" value="Sign in"></td>
				<td><input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>
	<br/>
	<br/>
	<%@include file="footer.html" %>
</body>
</html>