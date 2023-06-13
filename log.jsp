<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("mail");
String password = request.getParameter("pass");

try
{
	
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/manoj", "root", "");
	PreparedStatement pst = con.prepareStatement("select fname from car where email='"+email+"' and password='"+password+"'");
    ResultSet rs= pst.executeQuery();
    if(rs.next())
	{
		response.sendRedirect("index.html");
	}
    else
	{
		out.print("<BR><BR><BR><center> <p style='color: red;'>INCORRECT EMAIL/PASSWORD</p> </center>");
		
	}
	
}
catch(Exception e)
	{
		out.println(e);
	
	}
	
	session.setAttribute("email", email);
	
%>

