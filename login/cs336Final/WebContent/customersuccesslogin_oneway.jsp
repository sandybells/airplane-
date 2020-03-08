<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flights-One Way</title>
</head>
<body>
<a href="prebooking.jsp">View Bookings</a> </P> <a href="index.jsp">Sign Out</a> </P>

<b><H1>Search for a Flight</H1></b>
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
			<option value="DFW">DFW, Dallas/Fort Worth Texas</option>
		</select>

	<br>
	<label for="arrival"><b>Airport of Arrival  </b></label><select name="a_airport" size=1>
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
			<option value="DFW">DFW, Dallas/Fort Worth Texas</option>
		</select>
	<br>
	<label for="departuredate"><b>Departure Date </b></label><select name="month" size=1>
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
	
	<br>
	<label for="flex"><b>Are these dates flexible?</b></label><select name="flexible" size=1>
		<option value="yes">Yes</option>
		<option value="no">No</option>
	</select>
	<br>
	
	<H3>Please choose whether you would like to sort of filter your result(One or the other!)</H3>
	
	<H4>To sort your result, please choose so now!</H4>
	
	<label for="sort"><b>Sort By (descending order) </b></label><select name="sorting">
		<option value="noneso">No Sort</option>
		<option value="sprice">Price</option>
		<option value="depttime">Departure Time</option>
		<option value="arrtime">Arrival Time</option>
	</select>
	
	<H4>To filter your result, please choose so now!</H4>
	<label for="fiprice"><b>Filter Price </b></label><select name="fprice">
		<option value="nonepr">None</option>
		<option value="250">less than $250</option>
		<option value="800">Between $250 and $800</option>
		<option value="800">Greater than $800</option>
	</select>
	<label for="fialine"><b>Filter Airline </b></label><select name="faline">
		<option value="nonear">None</option>
		<option value="AF">Air France</option>
		<option value="BA">British Airways</option>
		<option value="CA">Air China</option>
		<option value="CX">Cathay Pacific</option>
		<option value="DL">Delta Airlines</option>
		<option value="OH">PSA Ailrines</option>
		<option value="UA">United Airlines</option>
	</select>
	<label for="nostops"><b>Filter No of Stops </b></label><select name="fnostops">
		<option value="nonest">None</option>
		<option value="0">No Stops</option>
		<option value="1">One Stop</option>
		<option value="2">Two Stops</option>
	</select>
	
		
	<br>	

	<button type="submit">Search</button>
	
	</form>
<br>
<br>
<p>Want to look at <a href="customersuccesslogin_roundtrip.jsp">round-trip</a> tickets?</p>


</body>
</html>