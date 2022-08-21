<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>
<%@ include file = "connection.jsp" %>
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

			 sellerId = (String)request.getParameter("sellerId");
			String sellerPassword = (String)request.getParameter("sellerPassword");

			if(sellerId==null )
			{
				response.sendRedirect("SellerLogin.jsp");
			}

			// java code for checking already user present.

			String query = "select * from seller where seller_id = ? and seller_password = ?";

			 

			try(

					Connection conn = DriverManager.getConnection(url,user,pass);
					PreparedStatement stmt = conn.prepareStatement(query);
				)
			{
				
				
				
				
				stmt.setString(1,sellerId);
				stmt.setString(2,sellerPassword);
				

				ResultSet rset = stmt.executeQuery();
				

				
				// to check is there are results.
				if(rset.isBeforeFirst())
				{
									conn.close();
									stmt.close();
									rset.close();

					session.setAttribute("sellerId",sellerId);
				

					response.sendRedirect("SellerHome.jsp");
				}
				else
				{
									conn.close();
									stmt.close();
									rset.close();
					session.setAttribute("error","* invalid id or password");
					response.sendRedirect("SellerLogin.jsp");
				}





			}
			catch(Exception e)
			{
				out.println(e);
			}

			

		

		
%>
	