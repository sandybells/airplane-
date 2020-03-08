<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Bookings</title>
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
		String tid = request.getParameter("tid");
		
		ResultSet rs = stm.executeQuery("select * from ticket where ticket.ticketid = '"+tid+"' and (ticket.class = 'b' or ticket.class = 'fc')");

		if(rs.next() == false){
			out.print("Sorry, you are not allowed to cancel this ticket");
		} else {
		
			String i = ("delete from ticket where ticketid = '"+tid+"';");
			PreparedStatement ps = con.prepareStatement(i);
			ps.executeUpdate(i);
			
			%>
			<H2>Your booking has been canceled!</H2>
			<%
			
		}
		
		
		con.close();
} catch (Exception e){System.out.println(e);}
%>
			<br>
		<br>

		<p>
			Go back to search <a href="customersucesslogin_oneway.jsp">one-way</a>
			tickets?
		</p>
		<p>
			Go back to search <a href="customersuccesslogin_roundtrip.jsp">round-trip</a>
			tickets?
		</p>
</body>
</html>