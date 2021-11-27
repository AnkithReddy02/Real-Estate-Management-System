<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.util.*" %>

<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String date = sdf.format(new Date());

%>


<%
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			String agentId = (String)session.getAttribute("agentId");
			String sellerId = (String)session.getAttribute("sellerId");
			String buyerId = (String)session.getAttribute("buyerId");
			String employeeId = (String)session.getAttribute("employeeId");
			// Boolean show = false;
			

			if(buyerId!=null)
			{
				response.sendRedirect("BuyerHome.jsp");
			}
			else if(agentId!=null)
			{
				response.sendRedirect("AgentHome.jsp");
			}
			else if(sellerId==null)
			{
				response.sendRedirect("SellerLR.jsp");
			}


			

			

 %>

<html>
<head>
	

	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	  <!-- <a class="navbar-brand" href=""><i class="glyphicon glyphicon-home"></i>  Real-Estate</a> -->

</head>  
<body>  


		

		
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <!-- <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script> -->
	  <a class="navbar-brand" href="index.jsp"><i class="glyphicon glyphicon-home"></i>  Real-Estate</a>

		    </div>
		    <ul class="nav navbar-nav">


		      <li ><a href="index.jsp">Home</a></li>
		      <li><a href="BuyerLR.jsp">Buyer</a></li>
		      <li  ><a href="AgentLogin.jsp">Agent</a></li>
		      <li class="active"><a href="SellerLR.jsp">Seller</a></li>
		      <!-- <li><a href="EmployeeLogin.jsp">Employee</a></li> -->
		      <li><a href="Logout.jsp">Logout</a></li>
		      

		      
		    </ul>
		  </div>
		</nav>
		<br><br>
		<br><br>

		<div class="container">

	    	<div class="d-flex justify-content-center align-items-center ">
	    		<div class="row">
	    			<div class="col-sm-4">
	    				<h3><b>UPLOAD NEW HOUSE</b></h3>
	    			    <hr>
	    			</div>
	    		</div>
	    		<div class="row">
	    		
	    			<div class="col-sm-4">
	    				<%
	    					if(session.getAttribute("transactionFailed")!=null)
	    					{
	    						String failed = (String)session.getAttribute("transactionFailed");

	    						session.removeAttribute("transactionFailed");

	    						if(failed.equals("true"))
	    						{
	    							%>
	    							<div class="alert alert-danger" role="alert">
									  Uploading Failed!!
									</div>
									<%
	    						}
	    						else
	    						{
	    							%>
	    							<div class="alert alert-success" role="alert">
									  Uploaded Successfully...
									</div>
									<%
	    						}
	    						
	    						
	    						
	    					}
	    					
	    				%>
	    				
	    				<form action="ValidateUNH.jsp" >
							 
							 City : 
							 <input type="text" name="city" maxlength="39" class="form-control" required="" placeholder="City name..">
							 <br><br>
							 Street :
							 <input type="text" name="street" maxlength="39" class="form-control" required="" placeholder="Street name..">
							 <br><br>
							 House Number :
							 <input type="text" name="houseNumber" maxlength="39" class="form-control" required="" placeholder="House number..">
							 <br><br>
							 Sale Price : 
							 <input type="number" name="salePrice" min="0" class="form-control" required="" placeholder="Sale Price if any..">
							 
							 <br><br>
							 Rent Price :
							 <input type="number" name="rentPrice" class="form-control" min="0" required="" placeholder="Rent Price if any..">

							 <br><br>
							 Number of BedRooms :
							 <input type="number" name="numBedrooms" class="form-control" min="0" required="" placeholder="Number of bedrooms..">
							 
							 <br><br>
							 Specifications : 
							 <input type="text" name="specifications" maxlength="100" class="form-control" required="" placeholder="other specifications if any..">
							 <br><br>
							 <label style="font-size:17px">Type : </label>
							 <select name="type">
							 	<option value="sale">Sale</option>
							 	<option value="rent">Rent</option>
							 	<option value="saleandrent">Sale and Rent</option>
							 </select>
							<br><br><br>
							<input type="submit" name="">
							<br><br><br>
				        </form>
	    			</div>
	    		
	    	    </div>
	    	       
	    	    
	    	</div>
    	
        </div>

       
		



	
 
</body>  
</html>  

