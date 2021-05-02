<%@ page errorPage="error.jsp" %> 
<html>
<head>
	

	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>  
<body>  
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="">Real-Estate</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li><a href="index.jsp">Home</a></li>
		      <li><a href="BuyerLR.jsp">Buyer</a></li>
		      <li><a href="AgentLogin.jsp">Agent</a></li>
		      <li><a href="SellerLR.jsp">Seller</a></li>
		      <li><a href="EmployeeLogin.jsp">Employee</a></li>

		      <%
		      		if(session.getAttribute("buyerId")!=null || session.getAttribute("sellerId")!=null || session.getAttribute("employeeId")!=null || session.getAttribute("agentId")!=null )
		      		{
		      			%>
		      			<li><a href="Logout.jsp">Logout</a></li>
		      			<%
		      		}
		      %>

		         
		    </ul>
		  </div>
		</nav>

		<br><br><br>

		      
					<h2>Working Fine(Test Page) .</h2>
				 



	<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			

    %>
 
</body>  
</html>  