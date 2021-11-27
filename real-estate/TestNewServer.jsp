<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>

<%

			

			String buyerId = "2";

			Class.forName("com.mysql.jdbc.Driver").newInstance(); 


			

			// java code for checking already user present.

		String url = "jdbc:mysql://sql5.freesqldatabase.com:3306/sql5436331";
			String user = "sql5436331";
			String pass = "ETEv6wqUqe";


			 

			try(

					Connection conn = DriverManager.getConnection(url,user,pass);
					Statement stmt = conn.createStatement();
				)
			{
				// for succesful connection.
				if(conn!=null)
				{
					out.println("Connected succesfully\n");
				}
				else
				{
					out.println("error in connection\n");
					return;
				}







			}
			catch(Exception e)
			{
				out.println("ok");
				out.println(e);
			}

			

		

		
%>
	