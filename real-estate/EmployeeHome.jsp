<%@ page errorPage="error.jsp" %> 
<%
			// redirection goes here.
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			String agentId = (String)session.getAttribute("agentId");
			String sellerId = (String)session.getAttribute("sellerId");
			String buyerId = (String)session.getAttribute("buyerId");
			String employeeId = (String)session.getAttribute("employeeId");
			

			if(sellerId!=null)
			{
				response.sendRedirect("SellerHome.jsp");
			}
			else if(buyerId!=null)
			{
				response.sendRedirect("BuyerHome.jsp");
			}
			else if(agentId!=null)
			{
				response.sendRedirect("AgentHome.jsp");
			}
			else if(employeeId==null)
			{
				response.sendRedirect("index.jsp");
			}
			


 %>


<html>
	<head>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	</head>

	<style>
		.q
		{
			margin-top: 90px;
		}
		li.item
		{
			font-size: 34px;
			border: 2px solid black;
			width: 400px;
			background-color: #8fb8d9;
			margin:3px;
			display:inline-block;
			margin-top:10px;
		}
		a:link{
			color:black;
			text-decoration: none;
		}
		
	</style>
        <body> 
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
				    <div class="navbar-header">
				      <a class="navbar-brand" href="">Real-Estate</a>
				    </div>
					    <ul class="nav navbar-nav">
					        <li><a href="index.jsp">Home</a></li>
					        <li><a href="#">Buyer</a></li>
					        <li><a href="#">Agent</a></li>
					        <li><a href="#">Seller</a></li>
					        <li class="active"><a href="EmployeeLogin.jsp">Employee</a></li>

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
		
			<div class="row">
				<div class="col-sm-3">
					<div class="q">
						<ul  type="none">
							<li class="item"><a href="HouseDetails.jsp">Retrieve house details</a></li><br>
							<li class="item"><a href="SellerDetails.jsp">Retrieve Seller details</a></li><br>
							<li class="item"><a href="BuyerDetails.jsp">Retrieve Buyer details</a></li><br>
							<li class="item"><a href="AgentDetails.jsp">Retrieve Agent details</a></li><br>
							<li class="item"><a href="PurchaseHistory.jsp">Retrieve Purchase history</a></li><br>
							<li class="item"><a href="Querry1.jsp">Query 1</a></li><br>
							<li class="item"><a href="Querry2.jsp">Query 2</a><br></li>
						</ul>
					</div>
				</div>
			</div>
		

        </body>
</html>