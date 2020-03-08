<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Your Ticket</title>
</head>
<body>
<H1>Book Your Ticket</H1>

<%

//name, last name, login username, fill in with information, would you like business or first class upgrade?
//

try{
		//Create a connection string
		String url = "jdbc:mysql://my336project.cwlmgkt91d9b.us-east-2.rds.amazonaws.com:3306/cs336";
		//Load JDBC driver

		Class.forName("com.mysql.jdbc.Driver");
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "celine","Anni*2020*");
		//Create a SQL statement
		
		Statement stm = con.createStatement();
		
		String flightnum = request.getParameter("flightnum");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String year = request.getParameter("year");
		String flex = request.getParameter("flex");
		
		ResultSet rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.fnum = '"+flightnum+"'");
	
		if(rs.next()== false){
			out.print("You did not enter the correct flight number!");
		} else {
%>

	<H3>Please fill out all the information below to book your ticket</H3>
	
	<form action="booked.jsp">
	
	<input type="text" placeholder= "user name" name="username" required> <br><br>
	<input type="text" placeholder= "first name" name="fname" required> 
	<input type="text" placeholder= "last name" name="lname" required> <br><br>
	<input type="text" placeholder= "passport/ID number" name="idnum" required><br><br>
	
	Would you like to upgrade your ticket to either business or first class? <br>
	Business upgrade fee - $250
	First Class upgrade fee - $500
	
	<br><br>
	<select name="upgrade" size=1>
			<option value="no_upgrade">No</option>
			<option value="yb">Yes, I want to upgrade to Business</option>
			<option value="ycl">Yes, I want to upgrade to First Class</option>
	</select><br><br>
	
	Would you like to receive special meals ?
	<select name="upgrade" size=1>
			<option value="no_meal">No</option>
			<option value="yes_mean">Yes</option>
	</select><br><br>
	
	<input type="text" placeholder= "card number" name="cnum" required><br><br>
	
	<% 
	
			
			out.print("Please confirm that you are purchasing a ticket for this flight:");
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			%>
			<pre class="tabs"><H4>From | To |   Flight Time    |Price|AL|Flight| No. Stops</H4></pre>
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
	        
	        %>
	        <br><br>
	        Please confirm the day you will be flying:
	        
	        
	     </b></label><select name="month" size=1>
			<option value="Jan">Jan</option>
			<option value="Feb">Feb</option>
			<option value="Mar">Mar</option>
			<option value="Apr">Apr</option>
			<option value="May">May</option>
			<option value="Jun">Jun</option>
			<option value="Jul">Jul</option>
			<option value="Aug">Aug</option>
			<option value="Sep">Sep</option>
			<option value="Oct">Oct</option>
			<option value="Nov">Nov</option>
			<option value="Dec">Dec</option>
		</select>
		<select name="day" size=1>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			<option value="25">25</option>
			<option value="26">26</option>
			<option value="27">27</option>
			<option value="28">28</option>
			<option value="29">29</option>
			<option value="30">30</option>
			<option value="31">31</option>
		</select>
		<select name="year" size 1>
			<option value="2019">2019</option>
			<option value="2020">2020</option>
		</select>
	      <% 
		}
			con.close();
		} catch (Exception e){System.out.println(e);}
			
	%>
	
	<button type="submit">Purchase</button>
	</form>




</body>
</html>