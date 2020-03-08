<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<P ALIGN=Center>
	<a href="index.jsp">sign out</a>
</P>
<title>Flight Results</title>
<b><H1>Flight Results</H1></b>
</head>
<body>

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
		String dept = request.getParameter("d_airport");
		String arr = request.getParameter("a_airport");
		
		if(dept.equals(arr)){
			
			%>

	<H2>ERROR:</H2>
	<b>DEPARTURE AND ARRIVAL AIRPORTS CANNOT BE THE SAME</b>

	<%		
		} else {
			boolean flightexist = true;
			String until = request.getParameter("until");
			String sort = request.getParameter("sorting");
			String fprice = request.getParameter("fprice");
			String fairline = request.getParameter("faline");
			String fstops = request.getParameter("fnostops");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String year = request.getParameter("year");
			String flex = request.getParameter("flexible");

			
			if(until == null){
				//one way flight
			
				ResultSet rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"'");
				
				//check if the two airports are the same

                if(rs.next() == false){
					
					flightexist = false;
					out.print("Sorry, there are no flights from '"+dept+"' to '"+arr+"'");
					
				}
				
				
				if(!sort.equals("noneso") && (!fprice.equals("nonepr")|| !fairline.equals("nonear") || !fstops.equals("nonest"))){
					out.print("error sorting and filtering");
					%>

	                <H2>Please make sure you are only sorting or filtering, not both!</H2>

	                <%
					
				} else {
					
					if(flex.equals("no")){				    
					    %><b>Date:</b> <%		out.print(month +"/" +day+"/"+year);
				
					    
					} else {
						%> <b>Date: </b> <%		out.print(month +"/" +day+"/"+year + " (+/-) 3 days, flights fly at the same time every day!");
					}
					
                    if(sort.equals("noneso") && fprice.equals("nonepr") && fairline.equals("nonear") && fstops.equals("nonest")){
                      
						rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"'");
					
                    } else 	if(sort.equals("noneso")){
						//filtering
					
						
						if(!fprice.equals("nonepr") && fairline.equals("nonear") && fstops.equals("nonest")){
							out.print("filtering1");
							if(fprice.equals("250")){
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price < '"+fprice+"'");
								
							} else if (fprice.equals("800")){
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price < '"+fprice+"' and pos_flights_oneway.price >= 250 ");
						
								
							} else {
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price >= '"+fprice+"'");
								
							}
							
						} else if (fprice.equals("nonepr") && !fairline.equals("nonear") && fstops.equals("nonest")){
						
							rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.airline = '"+fairline+"'");
							
						} else if (fprice.equals("nonepr") && fairline.equals("nonear") && !fstops.equals("nonest")) {
						
							rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.owstops = '"+fstops+"'");							
						} else if (!fprice.equals("nonepr") && !fairline.equals("nonear") && fstops.equals("nonest")){
						
							if(fprice.equals("250")){
								out.print("im in here");
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price < '"+fprice+"' and pos_flights_oneway.airline = '"+fairline+"'");
								
							} else if (fprice.equals("800")){
								
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price < '"+fprice+"' and pos_flights_oneway.price >= 250 and pos_flights_oneway.airline = '"+fairline+"'");
						
								
							} else {
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price >= '"+fprice+"'and pos_flights_oneway.airline = '"+fairline+"'");
								
							}
						} else if (!fprice.equals("nonepr") && fairline.equals("nonear") && !fstops.equals("nonest")){
						
							if(fprice.equals("250")){
								out.print("im in here");
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price < '"+fprice+"' and pos_flights_oneway.owstops = '"+fstops+"'");
								
							} else if (fprice.equals("800")){
								out.print("in here");
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price < '"+fprice+"' and pos_flights_oneway.price >= 250 and pos_flights_oneway.owstops = '"+fstops+"'");
						
								
							} else {
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price >= '"+fprice+"' and pos_flights_oneway.owstops = '"+fstops+"'");
								
							}
						} else if (fprice.equals("nonepr") && !fairline.equals("nonear") && !fstops.equals("nonest")){
							
							rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price >= '"+fprice+"'and pos_flights_oneway.airline = '"+fairline+"'and pos_flights_oneway.owstops = '"+fstops+"'");

						} else if (!fprice.equals("nonepr") && !fairline.equals("nonear") && !fstops.equals("nonest")){
							
							if(fprice.equals("250")){
								out.print("im in here");
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price < '"+fprice+"' and pos_flights_oneway.airline = '"+fairline+"' and pos_flights_oneway.owstops = '"+fstops+"'");
								
							} else if (fprice.equals("800")){
								out.print("in here");
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price < '"+fprice+"' and pos_flights_oneway.price >= 250 and pos_flights_oneway.airline = '"+fairline+"' and pos_flights_oneway.owstops = '"+fstops+"'");
						
								
							} else {
								
								rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' and pos_flights_oneway.price >= '"+fprice+"'and pos_flights_oneway.airline = '"+fairline+"' and pos_flights_oneway.owstops = '"+fstops+"'");
								
							}
						}
						
					} else if (!sort.equals("noneso")) {
						//sorting
						out.print("sorting");
						
						if(sort.equals("sprice")){
							
							rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' order by pos_flights_oneway.price;");
							
						} else if (sort.equals("depttime")){
							
							rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' order by pos_flights_oneway.dept_time;");

						} else if (sort.equals("arrtime")){
						
							rs = stm.executeQuery("select * from pos_flights_oneway where pos_flights_oneway.dept_airport = '"+dept+"' and pos_flights_oneway.arr_airport = '"+arr+"' order by pos_flights_oneway.arr_time;");
							
						}
										
					} 
                }
							
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
				<br>
		<br> Type out the number of the flight you would like to book!

		<form action="Booking.jsp">
			<input type="text" placeholder="flight number" name="flightnum"
				required> <br>
			<button type="submit">Book</button>

		</form>

		<%
			
	        } else {
			    //round trip flight
			    out.print("not empty!");  
		    }
					
			
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