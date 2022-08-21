 <%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ include file = "connection.jsp" %>
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
			else if(agentId==null)
			{
				response.sendRedirect("AgentLogin.jsp");
			}


			

			

 %>
 <%
	    	           
	    	        	
	    	        	{

				           
							Connection conn= null;
							try
							{
								conn = DriverManager.getConnection(url,user,pass);
								String houseId = request.getParameter("houseId");
								String transactionId  = request.getParameter("transactionId");
								

								// to be changed whole below.........

								String query;
								
								ResultSet rset ;
								PreparedStatement stmt;

								conn.setAutoCommit(false);

								query = "update house set rent_status = \'N\' where house_id = ? and rent_status  = \'Y\' ";

								stmt = conn.prepareStatement(query);

								stmt.setString(1,houseId);

							    int rows = stmt.executeUpdate();

							    if(rows==0)
							    {
							    	session.setAttribute("transactionFailed","true");
							    	response.sendRedirect("UpdateLeavingStatus.jsp");
							    }


							    query = "update purchase set leaving_date = ? where leaving_date is null and transaction_id = ?";

							    stmt = conn.prepareStatement(query);

							    stmt.setString(1,date);
							    stmt.setString(2,transactionId);

							    rows = stmt.executeUpdate();

							    if(rows==0)
							    {
							    	conn.rollback();
							    	session.setAttribute("transactionFailed","true");
							    	response.sendRedirect("UpdateLeavingStatus.jsp");
							    	return;

							    }

							    conn.commit();

							   		conn.close();
									stmt.close();
									//rset.close();

							    session.setAttribute("transactionFailed","false");

							    response.sendRedirect("UpdateLeavingStatus.jsp");

							    return;



							}
							catch(Exception e)
							{
								session.setAttribute("transactionFailed","true");
								conn.rollback();
							    response.sendRedirect("UpdateLeavingStatus.jsp");
								out.println(e);
								return;
							}
					
	    	        	}
	    	        %>