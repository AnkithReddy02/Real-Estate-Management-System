
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.*" %> 
<% 

	String type = "rent";
	if(type.equals("sale"))
	{
		%>
		 <h1>This is sale.</h1>
		<%
	}
	else
	{
		%>
		<h2>This is rent.</h2>
		<%
	}


	



%>