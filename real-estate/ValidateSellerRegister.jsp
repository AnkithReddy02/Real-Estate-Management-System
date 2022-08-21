<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>
<%@ include file = "connection.jsp" %>
<%

			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");

			String sellerName = (String)request.getParameter("sellerName");
			String sellerContact = (String)request.getParameter("sellerContact");
			String sellerPassword = (String)request.getParameter("sellerPassword");

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

			if(sellerName==null )
			{
				response.sendRedirect("SellerLogin.jsp");
			}

			// java code for checking already user present.

			// out.println(sellerName + " " + sellerContact);
			

			
			 
			Connection conn = null;
			PreparedStatement stmt = null;
			try
			{
				conn = DriverManager.getConnection(url,user,pass);
				

				// for succesful connection.
				
				
				
				conn.setAutoCommit(false);
				
				
				String q = "select * from seller where seller_name = ? and contact_number = ?";

				stmt = conn.prepareStatement(q);

				stmt.setString(1,sellerName);
				stmt.setString(2,sellerContact);

				
				
				ResultSet rset = stmt.executeQuery();

				// to check is there are results.
				if(rset.isBeforeFirst())
				{

									conn.close();
									stmt.close();
									rset.close();
					
				
					session.setAttribute("userexists","* User already exists");
					response.sendRedirect("SellerRegister.jsp");
					
				}
				else
				{
					
					

					String registerNew = "insert into seller values(null,?,?,SHA(?))";

					stmt = conn.prepareStatement(registerNew);

					stmt.setString(1,sellerName);
					stmt.setString(2,sellerContact);
					stmt.setString(3,sellerPassword);

					int rows = stmt.executeUpdate();

					if(rows==0)
					{
						conn.rollback();
						response.sendRedirect("SellerRegister.jsp");
						return;
					}

					
					

					q = "select seller_id from seller where seller_name = ? and contact_number = ?";

					stmt = conn.prepareStatement(q);

					stmt.setString(1,sellerName);
					stmt.setString(2,sellerContact);

					rset = stmt.executeQuery();

					 sellerId = "" ;

					while(rset.next())
					{
						sellerId = rset.getString(1);
					}

					out.println("You are successfully registered!!, your Id : " + sellerId);

					// commit.
					conn.commit();

									conn.close();
									stmt.close();
									rset.close();

					session.setAttribute("id",sellerId);



					response.sendRedirect("SellerRegister.jsp");

					return;
				}

				
				





			}
			catch(Exception e)
			{
				conn.rollback();
				response.sendRedirect("SellerRegister.jsp");

				// must show error in transaction.
				out.println(e);
				return;
			}

		

		

		
%>
	