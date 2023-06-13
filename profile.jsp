<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <title>User Profile</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f1f1f1;
    }

    h1 {
      text-align: center;
      color: #333333;
    }

    .profile {
      max-width: 600px;
      margin: 0 auto;
      background-color: lightblue;
      border-radius: 5px;
      padding: 20px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .profile h2 {
      color: #333333;
    }

    .profile img {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      display: block;
      margin: 0 auto 20px;
    }

    .profile p {
      line-height: 1.5;
    }

    .profile .info {
      margin-bottom: 20px;
    }

    .profile .info span {
      font-weight: bold;
    }

    .profile .actions {
      text-align: center;
    }

    .profile .actions a {
      display: inline-block;
      padding: 10px 20px;
      background-color: #333333;
      color: #ffffff;
      text-decoration: none;
      border-radius: 5px;
    }

    .profile .actions a:hover {
      background-color: #555555;
    }
  </style>
</head>
<body bgcolor="red">
    <%
        String email = (String)session.getAttribute("email");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/manoj", "root", "");

        
            
            PreparedStatement pst1 = con.prepareStatement("select * from car where email='"+email+"'");
            ResultSet rs1 = pst1.executeQuery();
            while(rs1.next()) {
                %>
                <div class="profile">
                    <h1>User Profile</h1>
                    <img src=<%= rs1.getString(6) %> alt="Profile Picture">
                    <div class="info">
                      <h2><%= rs1.getString(1) %></h2>
                      <p><span>Email:</span> <%= rs1.getString(4) %></p>
                      <p><span>Phone No:</span><%= rs1.getString(3) %></p>
                      <p><span>Age:</span> 20</p>
                    </div>
                    <div class="actions">
                      <a href="register.html">Edit Profile</a>
                    </div>
                  </div>
          <%  }

            

    
        } catch(Exception e) {
            out.print(e);
        }
    %>
</body>
</html>