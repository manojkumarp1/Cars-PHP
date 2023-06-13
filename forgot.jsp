<%@ page import="java.sql.*"%>
<%
    String mail = request.getParameter("username");
    String npswd = request.getParameter("new-password");
    String cpswd = request.getParameter("confirm-password");

    if(npswd.equals(cpswd)) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/manoj", "root", "");
            PreparedStatement pst = con.prepareStatement("update car set password=? where email=?");
    
            pst.setString(1, npswd);
            pst.setString(2, mail);
    
            if(pst.executeUpdate()>0){
                response.sendRedirect("login.html");
            }
    
            pst.close();
            con.close();
    
        } catch(Exception e) {
            out.print(e);
        }
    }
    else {
        out.print("<h1>New password and current password are not same....</h1>");
    }
%>