`<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>
<%@ include file = "connection.jsp" %>
<%

			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");

			String buyerName = (String)request.getParameter("buyerName");
			String buyerContact = (String)request.getParameter("buyerContact");
			String buyerPassword = (String)request.getParameter("buyerPassword");

			String agentId = (String)session.getAttribute("agentId");
			String sellerId = (String)session.getAttribute("sellerId");
			String buyerId = (String)session.getAttribute("buyerId");
			//String employeeId = (String)session.getAttribute("employeeId");
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

			if(buyerName==null )
			{
				response.sendRedirect("BuyerLogin.jsp");
			}

			// java code for checking already user present.

			//out.println(buyerName + " " + buyerContact);
			

			 
			Connection conn = null;
			PreparedStatement stmt = null;
			try
			{
				conn = DriverManager.getConnection(url,user,pass);
				

				// for succesful connection.
				
				
				
				conn.setAutoCommit(false);
				
				
				String query = "select * from buyer where buyer_name = ? and contact_number = ?";

				stmt = conn.prepareStatement(query);

				stmt.setString(1,buyerName);
				stmt.setString(2,buyerContact);

				
				
				ResultSet rset = stmt.executeQuery();


				
				// to check is there are results.
				if(rset.isBeforeFirst())
				{

					conn.close();
					stmt.close();
					rset.close();
					
				
					session.setAttribute("userexists","* User already exists");					
					response.sendRedirect("BuyerRegister.jsp");
					
				}
				else
				{
					
					

					String registerNew = "insert into buyer values(null,?,?,?)";

					stmt = conn.prepareStatement(registerNew);

					stmt.setString(1,buyerName);
					stmt.setString(2,buyerContact);
					stmt.setString(3,buyerPassword);


					int rows = stmt.executeUpdate();

					if(rows==0)
					{
						conn.rollback();
						response.sendRedirect("SellerRegister.jsp");
						return;
					}




					String q = "select buyer_id from buyer where buyer_name = ? and contact_number = ?";

					stmt = conn.prepareStatement(q);

					stmt.setString(1,buyerName);
					stmt.setString(2,buyerContact);

					rset = stmt.executeQuery();

					 buyerId = "" ;

					while(rset.next())
					{
						buyerId = rset.getString(1);
					}

					out.println("You are successfully registered!!, your Id : " + buyerId);





					
					conn.commit();

					conn.close();
					stmt.close();
					rset.close();


					session.setAttribute("id",buyerId);



					response.sendRedirect("BuyerRegister.jsp");

					

					//response.sendRedirect("Test.jsp");
				}

				
				





			}
			catch(Exception e)
			{
				conn.rollback();
				response.sendRedirect("BuyerRegister.jsp");

				// must show error in transaction.
				out.println(e);
				return;
			}

		

		

		
%>
	