<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>Login Page</title>
	</head>
	<body>
		  <h1>Welcome, login to your account.</h1> <!-- the usual HTML way -->
		<%-- <% out.println("Hello World2"); %> <!-- output the same thing, but using 
		                                      jsp programming -->
		 --%>
		 
											  
		
		
		 <!-- Show html form to i) display something, ii) choose an action via a 
		  | radio button -->
		  
		  
		<!-- forms are used to collect user input 
			The default method when submitting form data is GET.
			However, when GET is used, the submitted form data will be visible in the page address field-->
<!--		<br>
	
 		<form method="post" action="show.jsp">
		    note the show.jsp will be invoked when the choice is made
			The next lines give HTML for radio buttons being displayed
		  <input type="radio" name="command" value="beers"/>Let's have a beer!
		  <br>
		  <input type="radio" name="command" value="bars"/>Let's go to a bar!
		    when the radio for bars is chosen, then 'command' will have value 
		     | 'bars', in the show.jsp file, when you access request.parameters
		  <br>
		  <input type="submit" value="submit" />
		</form>
	<br> -->
		
<!-- 		A bar wants to sell a beer! Type the bar, the beer and the price of the beer:
 -->	
		 <form method="post" action="login.jsp"> 
				<table>
					<tr>    
						<td>Username: </td><td><input type="text" placeholder="Enter username" name="username" required></td>
						<td>Password: </td><td><input type="password" placeholder="Enter Password" name = "password" required></td>
						 <td>
        	  <input type="checkbox" name="myCheck" value="checked" > I'm a customer representative<br>
        </td>
        
						
					
					</tr>
				
					<tr>
		<td style="padding:0 15px 0 15px;"> <input type="submit" value="Login" /> </td>
						
					</tr>
				</table>
			</form>	
		
		
		<br>
		
		 
				 <table>
					<tr>
						<td>Don't have an account? <a href="register.jsp">Register</a></td>	
						
					</tr>
				</table>
			
			
	</body>
</html>