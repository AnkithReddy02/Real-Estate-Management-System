<!DOCTYPE html>
<html>
<head>
	<title>
		House Details
	</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
 <!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="styling.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ page import = "java.util.*" %>  
	<%@ page import="java.sql.*" %>
	<%@ page errorPage="error.jsp" %> 
    <%@ page session = "true" %>
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
	<%
         String url = "jdbc:mysql://sql5.freesqldatabase.com:3306/sql5436331";
			String user = "sql5436331";
			String pass = "ETEv6wqUqe";
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			try(
					Connection conn = DriverManager.getConnection(url,user,pass);
					Statement stmt = conn.createStatement();
				)
			{
				
               ResultSet rset = stmt.executeQuery("select agent_id,agent_name,house_id,city,street_name,rent_price,purchase_date from agents natural join house natural join purchase where rent_status='Y' order by agent_id");


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





			}
			catch(Exception e)
			{
				out.println(e);
			}
	%>

</body>
</html>