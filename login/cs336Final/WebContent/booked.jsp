<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Congratulations-Flight Booked</title>
</head>
<body>

<H1>Thank you for booking your flight!</H1><br>
<H3>Here is your confirmation</H3>

<br>

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
		
		String user = request.getParameter("username");
		String upgraded = request.getParameter("upgrade");
		String meal = request.getParameter("mealup");
		String fnum = request.getParameter("hidden");
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year"); 
		
		ResultSet rs = stm.executeQuery("select * from Users where Users.username = '"+user+"'");
		Random rand = new Random();
		int tid = rand.nextInt(90000) + 10000;
		int seat = rand.nextInt(100);
		String wait = "N";
		int price;
		
		if(rs.next() == false) {
			//username did NOT match
			out.print("your username did NOT match one in our record, please go back and try again");
			
		} else {
			//username matched
			String date = month + "/" + day + "/" + year;
			
			String purchased = "08/09/2019";
			rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.fnum = '"+fnum+"'");
			if(rs.next()){
				price = rs.getInt(5);
				
				if (upgraded.equals("yfc")){
					upgraded = "fc";
					price = price + 500;
					
				} else if (upgraded.equals("yb")){
					upgraded = "b";
					price = price + 250;
				} else {
					upgraded = "e";
				}
				String i = ("insert into ticket(ticketid, username, class, seat, spmeal, flightnum, waitlist, price, flydate, purchasedate) values ('"+tid+"','"+user+"','"+upgraded+"','"+seat+"','"+meal+"','"+fnum+"', '"+wait+"','"+price+"','"+date+"', '"+purchased+"');");
				stm.executeUpdate(i);
				%>
				
				<b>Your ticket number is: <%=tid %></b><br>
				<b>The total price is: <%=price %></b><br><br>
				<a href="pre_booking.jsp">Click here to view all your bookings</a><br>
				
		<p>
			Go back to search <a href="customersucesslogin_oneway.jsp">one-way</a>
			tickets?
		</p>
		<p>
			Go back to search <a href="customersuccesslogin_roundtrip.jsp">round-trip</a>
			tickets?
		</p>
				
				<%
				
			}
		
			
		}
		con.close();
    } catch (Exception e){System.out.println(e);}
%>

</body>
</html>