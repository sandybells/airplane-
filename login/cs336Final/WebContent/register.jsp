<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create a new account</title>

	<!-- <script>
	function check() {
	  document.getElementById("myCheck").checked = true;
	}
	
	function uncheck() {
	  document.getElementById("myCheck").checked = false;
	}
	</script> -->

</head>
<body>

<!-- <form method= "post" action="thanks.jsp"> -->
<form method= "post" action="reg.jsp">


  

  <div class="container">
    <h1>Register for a new account</h1>
    
    <hr>
    
    <table>
    
    <tr>
	   <td>   <b>Username:</b></td>
	    <td>	<input type="text" placeholder="Enter username" name="email" required> </td>
    
    </tr>
    
    
   <tr>
        <td>	 <b>Password:</b> </td>
   		<td>	 <input type="password" placeholder="Enter Password" name="pass" required> </td> 
   </tr>
   


   <tr>
        
   <td> <b>Repeat Password:</b> </td>
 <td>   <input type="password" placeholder="Repeat Password" name="pass-repeat" required> </td>
        <td>
        	  <input type="checkbox" name="myCheck" value="checked" > I'm a customer representative<br>
        </td>
        
        </tr>
       
    
    </table>

 
    <hr>
    
    
    
  <br>

    <button type="submit" class="registerbtn">Register</button>
  </div>
  </form>
  

  <div class="container signin">
    <p>Already have an account? <a href="index.jsp">Sign in</a>.</p>
  </div>

		


</body>
</html>