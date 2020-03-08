<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flights-Round Trip</title>
</head>
<body>

 <P ALIGN=Center><a href="index.jsp">sign out</a> </P>
<b><H1>Search for a Flight</H1></b>
<br>
<br>
	<form action="flightresult.jsp">
		<label for="origin"><b>Airport of Origin  </b></label><select name="d_airport" size=1>
			<option value="EWR">EWR, Newark NJ</option>
			<option value="ATL">ATL, Atlanta GA</option>
			<option value="DEN">DEN, Denver CO</option>
			<option value="HBE">HBE, Alexandria Egypt</option>
			<option value="JFK">JFK, Queens NY</option>
			<option value="LAX">LAX, Los Angeles CA</option>
			<option value="LPL">LPL, Liverpool England</option>
			<option value="NKG">NKG, Nanjing China</option>
			<option value="ORD">ORD, Chicago IL</option>
			<option value="SEA">SEA, Seattle WA</option>
			<option value="TSA">TSA, Taipe Taiwan</option>
		</select>

	<br>
	<label for="origin"><b>Airport of Arrival  </b></label><select name="a_airport" size=1>
			<option value="EWR">EWR, Newark NJ</option>
			<option value="ATL">ATL, Atlanta GA</option>
			<option value="DEN">DEN, Denver CO</option>
			<option value="HBE">HBE, Alexandria Egypt</option>
			<option value="JFK">JFK, Queens NY</option>
			<option value="LAX">LAX, Los Angeles CA</option>
			<option value="LPL">LPL, Liverpool England</option>
			<option value="NKG">NKG, Nanjing China</option>
			<option value="ORD">ORD, Chicago IL</option>
			<option value="SEA">SEA, Seattle WA</option>
			<option value="TSA">TSA, Taipe Taiwan</option>
		</select>
	<br>
	<label for="departuredate"><b>Departure Date</b></label>
	<input type="date" placeholder="DD/MM/YYYY" name="from" required>
	<br>
	<label for="returndate"><b>Return Date</b></label>
	<input type="date" placeholder="DD/MM/YYYY" name="until" required>
	
	<br>
	<button type="submit">Search</button>
	
	</form>
<br>
<br>
<p>Want to look at <a href="customersuccesslogin_oneway.jsp">one-way</a> tickets?</p>

<br>
<br>
<br>

</body>
</html>