<%@ page errorPage="error.jsp" %> 
<html>  
<body>  
	<%@ page session = "true" %>
	<%   
	  
	session.invalidate(); 
	response.sendRedirect("index.jsp");

	%>   

  

</body>  
</html>  