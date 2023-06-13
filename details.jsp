<%@ page import="java.sql.*" %>
<%
String mno =request.getParameter("mob");
String fname = request.getParameter("firstName");
String lname = request.getParameter("lastName");
String email = request.getParameter("email");
String password = request.getParameter("pass");
try
{
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/manoj", "root", "");
	PreparedStatement pst = con.prepareStatement("insert into car values(?,?,?,?,?,?)");
	
	pst.setString(1,fname);
	pst.setString(2,lname);
    pst.setString(3,mno);
	pst.setString(4,email);
	pst.setString(5,password);
	pst.setString(6,"Devloper.jpg");
	int x = pst.executeUpdate();
	if(x>0)
	{
		
	}
	else
	{
		out.println("registration fail");
	}
	if(pst!=null)
	{
		out.print("<h1> one record inserted </h1>");
		%>
		 <a href="login.html" ><button type="button">Log in</button></a>
		 <%
		con.close();
	}
}
catch(Exception e)
	{
		out.println(e);
	
	}
	
%>