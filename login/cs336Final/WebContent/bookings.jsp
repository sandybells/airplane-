<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Bookings</title>
</head>
<body>


<% 

	try{
		//Create a connection string
		String url = "jdbc:mysql://my336project.cwlmgkt91d9b.us-east-2.rds.amazonaws.com:3306/cs336";
		//Load JDBC driver

		Class.forName("com.mysql.jdbc.Driver");
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "celine","Anni*2020*");
		//Create a SQL statement
		
		Statement stm = con.createStatement();
		String username = request.getParameter("username");
		
		
		//show waitlist
		
		%>
		<input type="hidden" name="hidden" value=<%= username %>>
		<H3>Here are the flights you are on the waitlist for</H3>
		<%
		ResultSet rs = stm.executeQuery("select * from ticket where ticket.username = '"+username+"' and ticket.waitlist = 'Y'");
		ResultSetMetaData metaData = rs.getMetaData();
				
				%>
				<pre class="tabs"><H4>TID |Username|Class|Seat|SPMeal|Flight|Waitlist|Price|Fly Date</H4></pre>
	            <%
				
				while(rs.next()){
			
				    for(int i = 1; i < metaData.getColumnCount(); i++){
					    out.print(" | ");
						%>
							<td><%=rs.getString(i)%></td>
	                	<%			
					}
				   
						%>
						<br>
							
						<%	
						
				}
				
		
		
		//show past bookings
		
		%>
		
		<H3>Here are your past bookings</H3>
		
	
				<pre class="tabs"><H4>TID |Username|Class|Seat|SPMeal|Flight|Waitlist|Price|Fly Date</H4></pre>
	            <%
	            
	           	rs = stm.executeQuery("select * from ticket where ticket.username = '"+username+"' and ticket.flyday < '08/09/2019' and ticket.waitlist = 'N'");
	    		metaData = rs.getMetaData();
				
				while(rs.next()){
			
				    for(int i = 1; i < metaData.getColumnCount(); i++){
					    out.print(" | ");
						%>
							<td><%=rs.getString(i)%></td>
	                	<%			
					}
				   
						%>
						<br>
							
						<%	
						
				}
				
		
		
		
		//show future bookings
		
		%>
		
		<H3>Here are your upcoming bookings</H3>
		
	
		
		
		<pre class="tabs"><H4>TID |Username|Class|Seat|SPMeal|Flight|Waitlist|Price|Fly Date</H4></pre>
   	<%
        
       	rs = stm.executeQuery("select * from ticket where ticket.username = '"+username+"' and ticket.flyday >= '08/09/2019' and ticket.waitlist = 'N'");
		metaData = rs.getMetaData();
		
		while(rs.next()){
	
		    for(int i = 1; i < metaData.getColumnCount(); i++){
			    out.print(" | ");
				%>
					<td><%=rs.getString(i)%></td>
            	<%			
			}
		   
				%>
				<br>
					
				<%	
				
		}
		%>
		<br> Would you like to cancel your bookings?<br>
		<form action="changebook.jsp">
		Please enter the ticket number of the flight you would like to cancel(NOTE: you can only cancel bookings if you are in first class or business class):
		<input type="text" placeholder="ticket ID" name="tid"required> <br>
		<button type="submit">Change</button>
		<br>
		<%
		con.close();
    } catch (Exception e){System.out.println(e);}
%>

</body>
</html>