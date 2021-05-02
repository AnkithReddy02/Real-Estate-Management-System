<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>

<%

			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			response.setHeader("Pragma","no-cache");
			response.setHeader("Expires","0");

			String employeeId = (String)request.getParameter("employeeId");

			if(employeeId==null )
			{
				response.sendRedirect("EmployeeLogin.jsp");
			}

			// java code for checking already user present.

			String url = "jdbc:mysql://sql6.freesqldatabase.com:3306/sql6400218";
			String user = "sql6400218";
			String pass = "q9aqHxGZtw";

			Class.forName("com.mysql.jdbc.Driver").newInstance(); 

			 

			try(

					Connection conn = DriverManager.getConnection(url,user,pass);
					Statement stmt = conn.createStatement();
				)
			{
				
				
				
				
				DatabaseMetaData dbmd = conn.getMetaData();
				

				ResultSet rset = stmt.executeQuery("select * from employee where employee_id = " + employeeId);
				

				
				// to check is there are results.
				if(rset.isBeforeFirst())
				{
					conn.close();
					stmt.close();
					rset.close();
					session.setAttribute("employeeId",employeeId);
				

					response.sendRedirect("EmployeeHome.jsp");
				}
				else
				{
					conn.close();
					stmt.close();
					rset.close();
					response.sendRedirect("EmployeeLogin.jsp");
				}





			}
			catch(Exception e)
			{
				out.println(e);
			}

			

		

		
%>
	