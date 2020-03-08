<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import= "javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		String Rep = request.getParameter("myCheck");
		
		
		//try {
			
			//Get the database connection
			//ApplicationDB db = new ApplicationDB();	
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://my336project.cwlmgkt91d9b.us-east-2.rds.amazonaws.com:3306/cs336";
		
			java.sql.Connection con = DriverManager.getConnection(url, "cs336", "mypassword");
			

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Statement stmt2 = con.createStatement();
			ResultSet result;
				if(Rep != null){ //rep
					result = stmt.executeQuery("select * from Customer_Reps where eid='"+user+"'");
				}
				else{
					result = stmt.executeQuery("select * from Users where username='"+user+"'");
				}
				
			

			
			
			if(result.next()){
		if(result.getString(2).equals(pass)){
			
			
			//HttpSession session = request.getSession();
			if(Rep != null){ //rep
				response.sendRedirect("Replogin.jsp");
			}
			else{
				response.sendRedirect("customersuccesslogin_oneway.jsp");
			}
			
			
			//redirect to a page here 
		}
		
		else{
				out.println("Wrong password, "); %>
				<a href = "index.jsp">Retry.</a>
				<%
				
				
			//	response.sendRedirect("index.jsp");
					
				//request.setAttribute("errorMessage", "Invalid user or password");

			}
		

		}

		//con.close();
		//} 

		//catch (Exception e) {
		//out.print(e);
			
		else {
			out.println("Invalid login, ");
	%>
					<a href = "index.jsp"> Retry</a>
					<%
		}
		//}
		%>	
	
	
		

</body>
</html>