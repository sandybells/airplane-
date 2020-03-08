<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import= "javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

 <style>
h3.hidden {
  display: none;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you </title>
</head>
<body>


    
  
 
  
<!--   document.getElementById("error").style.display = "none"; -->
  
  
	<%
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String repeat = request.getParameter("pass-repeat");
	String Rep = request.getParameter("myCheck");
	    
		try {
	
			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://my336project.cwlmgkt91d9b.us-east-2.rds.amazonaws.com:3306/cs336";
				
			java.sql.Connection con = DriverManager.getConnection(url, "cs336", "mypassword");
			

			//Create a SQL statement
			Statement stmt = con.createStatement();
			ResultSet result;
		//	out.println(Rep);
			
			if(pass.equals(repeat)){
				
				
				
				if(Rep !=null){
					
					int i = stmt.executeUpdate("insert into Customer_Reps values('"+email+"','"+pass+"') ");
				}
				else{
					int i = stmt.executeUpdate("insert into Users values('"+email+"','"+pass+"') ");

				}

			}
			else{ 
				response.sendRedirect("register.jsp");
			}
			
			
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
		
	

	%>
		<b> Thank you for registering </b>
		<br>
		<a href="index.jsp">Back to login</a>


</body>
</html>