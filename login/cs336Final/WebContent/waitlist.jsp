<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waitlist Result</title>
</head>
<body>

<H1>Waitlist Form</H1>

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
		String willwait = request.getParameter("wait");
		String upgraded = "-";
		String meal = "-";
		String fnum = request.getParameter("fnumber");

		Random rand = new Random();
		int tid = rand.nextInt(90000) + 10000;
		String seat = "-";
		String wait = "Y";
		int price = 0;
		
			
		String purchased = "08/09/2019";
		ResultSet rs = stm.executeQuery("select * from Users where Users.username = '"+user+"'");
		
		if(rs.next() == false){
			%>
			
			<H2>You have put down an incorrect username!</H2>
			
			<%
		} else {

			rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.fnum = '"+fnum+"'");
			if(rs.next()){
			
				if(willwait.equals("wyes")){
			

					String i = ("insert into ticket(ticketid, username, class, seat, spmeal, flightnum, waitlist, price, purchasedate) values ('"+tid+"','"+user+"','"+upgraded+"','"+seat+"','"+meal+"','"+fnum+"', '"+wait+"','"+price+"', '"+purchased+"');");
					stm.executeUpdate(i);
				}	
					
			} else {
				
			
				%>
				
				<H2>You have listed to wrong flight number!</H2>
				
				<%
				
			}
		}
		
			%>
	
	<H2>You have been put on the waitlist!</H2>
	<br>	
	
		<p>
			Go back to search <a href="customersucesslogin_oneway.jsp">one-way</a>
			tickets?
		</p>
		<p>
			Go back to search <a href="customersuccesslogin_roundtrip.jsp">round-trip</a>
			tickets?
		</p>
				
				<%
				
		
		con.close();
} catch (Exception e){System.out.println(e);}
%>

</body>
</html>