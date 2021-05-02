<%@ page session = "true" %>  
<%@ page import = "java.util.*" %> 
<%@ page errorPage="error.jsp" %> 
<%@ page import="java.sql.*" %>

<%

			

			String buyerId = "2";

			

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
	