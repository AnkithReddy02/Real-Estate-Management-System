<%@ page errorPage="error.jsp" %> 
<%@ page session = "true" %>  
<%@ page import="java.sql.*" %>
<%
			// for revalidation after logout.
			response.setHeader("Cache-Control","no-cache,no-store");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");



			String agentId = (String)session.getAttribute("agentId");
			String sellerId = (String)session.getAttribute("sellerId");
			String buyerId = (String)session.getAttribute("buyerId");
			String employeeId = (String)session.getAttribute("employeeId");
			// Boolean show = false;
			

			if(agentId!=null)
			{
				response.sendRedirect("AgentHome.jsp");
			}
			else if(sellerId!=null)
			{
				response.sendRedirect("SellerHome.jsp");
			}
			else if(employeeId!=null)
			{
				response.sendRedirect("EmployeeHome.jsp");
			}
			else if(buyerId==null)
			{
				response.sendRedirect("BuyerLR.jsp");
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
		      <li class="active"><a href="BuyerLR.jsp">Buyer</a></li>
		      <li ><a href="AgentLogin.jsp">Agent</a></li>
		      <li><a href="SellerLR.jsp">Seller</a></li>
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
	    				<h3><b>TRANSACTION DETAILS</b></h3>
	    			    <hr>
	    			</div>
	    		</div>
	    		<div class="row">
	    		
	    			<div class="col-sm-4">
	    				
	    				<form action="#" method="post">
							 
							<input type="radio" name="type" value="sale" required=""> <span style="font-size:20px">Bought</span>
							<input type="radio" name="type" value="rent" required="" style="margin-left: 10px;"> <span style="font-size:20px">Rent</span>
							<br><br>
							<input type="submit" name="">
				        </form>
	    			</div>
	    		
	    	    </div>
	    	        <%
	    	            // if(request.getParameter("type")!=null)
	    	            // {
	    	            // 	show = true;
	    	            // }
	    	        	if(request.getParameter("type")!=null)
	    	        	{

				            String url = "jdbc:mysql://sql6.freesqldatabase.com:3306/sql6400218";
							String user = "sql6400218";
							String pass = "q9aqHxGZtw";
							Class.forName("com.mysql.jdbc.Driver").newInstance(); 
							try(
									Connection conn = DriverManager.getConnection(url,user,pass);
									
								)
							{
								String type = request.getParameter("type");

								String query ;
								// result set.
								ResultSet rset ;
								PreparedStatement stmt;
								if(type.equals("sale"))
								{
									query = "select transaction_id,house_id,agent_name,agents.contact_number as agent_contact,city,street_name,apt_no,sale_price,purchase_date from house natural join purchase natural join agents where sale_status = \'Y\' and buyer_id = ? ";

									stmt = conn.prepareStatement(query);

									stmt.setString(1,buyerId);
									


								}
								else
								{
									query = "select transaction_id,house_id,agent_name,agents.contact_number as agent_contact,city,street_name,apt_no,rent_price,purchase_date,leaving_date from house natural join purchase natural join agents where (leaving_date is null or leaving_date > '0000-00-00') and buyer_id = ?";

									stmt = conn.prepareStatement(query);

									stmt.setString(1,buyerId);
									
								}

								
							    rset = stmt.executeQuery();

				               


								ResultSetMetaData rsmd = rset.getMetaData();

								int columnCount = rsmd.getColumnCount();

								     %>
									<br><br><br>
									<%
					            out.println("<div class=\"table-responsive\">");
								
								out.println("<table class = \"table-bordered table table-striped table-hover \"");
								out.println("<thead>");
								for(int i=1;i<=columnCount;i++)
								{
									out.print("<th scope=\"col\">"+rsmd.getColumnName(i).toUpperCase() + "</th>");
								}
								    out.println("</thead>");
								int counter = 0;
								out.println("<tbody>");
								while(rset.next())
								{
									
									out.println("<tr>");
								 	

									for(int i=1;i<=columnCount;i++)
									{
										
										out.print("<td>"+rset.getString(i) + "</td>");
										
									}
									counter++;
								    out.println("</tr>");
									
								}
								out.println("</tbody>");

									out.println("</table>");

									conn.close();
									stmt.close();
									rset.close();





								}
								catch(Exception e)
								{
									out.println(e);
								}
					
	    	        	}
	    	        %>
	    	    
	    	</div>
    	
        </div>

       
		



	
 
</body>  
</html>  