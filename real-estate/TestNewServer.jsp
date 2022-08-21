<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>
<%@ include file = "connection.jsp" %>
<%

			

			String buyerId = "2";

			

			// java code for checking already user present.

			 

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
				
				
				
				DatabaseMetaData dbmd = conn.getMetaData();
				

				ResultSet rset = stmt.executeQuery("select * from buyer where buyer_id = " +"\'" + buyerId + "\'");
				

				ResultSetMetaData rsmd = rset.getMetaData();

				int columnCount = rsmd.getColumnCount();
				/*
				while(rset.next())
				{
					for(int i=1;i<=columnCount;i++)
					{
						System.out.print(rset.getString(i) + " ");
					}
					System.out.println();
				}
				*/
				out.println(buyerId);





			}
			catch(Exception e)
			{
				out.println(e);
			}

			

		

		
%>
	