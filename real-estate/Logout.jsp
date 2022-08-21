<%@ page errorPage="error.jsp" %> 
<%@ include file = "connection.jsp" %>
<html>  
<body>  
	<%@ page session = "true" %>
	<%   
	  
	session.invalidate(); 
	response.sendRedirect("index.jsp");

	%>   

  

</body>  
</html>  