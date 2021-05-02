<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>

<%

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
			else if(sellerId!=null)
			{
				response.sendRedirect("SellerHome.jsp");
			}
			else if(agentId!=null)
			{
				response.sendRedirect("AgentHome.jsp");
			}

			agentId = (String)request.getParameter("agentId");
			String agentPassword = (String)request.getParameter("agentPassword");

			if(agentId==null )
			{
				response.sendRedirect("AgentLogin.jsp");
			}

			// java code for checking already user present.

			String url = "jdbc:mysql://sql6.freesqldatabase.com:3306/sql6400218";
			String user = "sql6400218";
			String pass = "q9aqHxGZtw";

			Class.forName("com.mysql.jdbc.Driver").newInstance(); 

			 String query = "select * from agents where agent_id = ? and binary agent_password = ?";

			try(

					Connection conn = DriverManager.getConnection(url,user,pass);
					PreparedStatement stmt = conn.prepareStatement(query);
					
				)
			{
				// for succesful connection.
				
				
				
				
				

				stmt.setString(1,agentId);
				stmt.setString(2,agentPassword);

				
				
				
				ResultSet rset = stmt.executeQuery();


				

				
				// to check is there are results.
				if(rset.isBeforeFirst())
				{
					conn.close();
									stmt.close();
									rset.close();
					session.setAttribute("agentId",agentId);
				
					
					response.sendRedirect("AgentHome.jsp");
				}
				else
				{
					conn.close();
									stmt.close();
									rset.close();
					session.setAttribute("error","* invalid id or password");
					response.sendRedirect("AgentLogin.jsp");
				}





			}
			catch(Exception e)
			{
				out.println(agentPassword);

				out.println(e);
			}

			

		

		
%>
	