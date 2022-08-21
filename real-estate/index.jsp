<%@ page errorPage="error.jsp" %> 
<%@ include file = "connection.jsp" %>
<html>
<head>
	<!-- https://www.w3schools.com/icons/icons_reference.asp
 -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <link rel="stylesheet" href="b.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>  
<body>  
	   <nav id="Navbar">
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">

		      <a class="navbar-brand" href="#"><i class="glyphicon glyphicon-home"></i>  Real-Estate</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="#">Home</a></li>
		      <li><a href="BuyerLR.jsp">Buyer</a></li>
		      <li><a href="AgentLogin.jsp">Agent</a></li>
		      <li><a href="SellerLR.jsp">Seller</a></li>
		      <!-- <li><a href="EmployeeLogin.jsp">Employee</a></li> -->

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
		</nav>
		<br><br><br>
		
		<section id="real">
			<marquee> 
			<h2 >Welcome to Real-Estate Management Website </h2>
		   </marquee>
	    </section>

		<footer>
			<div class="center" style="text-align: center;background: black;
			color: white;">
				Copyright &copy; www.RealStateWebsite.com  All rights reserved!
			</div>
		</footer>
		      





	<%
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");
			

    %>

 
</body>  
</html>  