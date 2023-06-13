<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Dealers</title>
  <style>
    .container {
  display: flex;
}



.box:first-child {
  margin-right: 80px; 
}

    .box {
      width: 300px;
      padding: 20px;
      border: 1px solid #ccc;
      background-color:white;
      margin-left: 100px;
      transition: transform .2s; 
    }
        .box:hover {
            transform: scale(1.05);
        }

    .details {
      margin-top: 20px;
    }

    .details h4 {
      margin-top: 0;
      font-size: 18px;
    }

    .details p {
      margin: 0;
    }

    .details .name {
      font-weight: bold;
    }

    .details .email {
      color: #333;
    }
    .dynamic-button {
  padding: 10px 20px;
  background-color: #4287f5;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.dynamic-button:hover {
  background-color:maroon;
}

.dynamic-button:active {
  background-color:green;
}



  </style>
</head>
<main>
<body bgcolor="grey">
    <center>
        <h1>DEALER'S DETAILS</h1>
        </center>
        <br><br>
    
    
    <%
    String cid = request.getParameter("butt");
    


    try
    {
      
      Class.forName("com.mysql.jdbc.Driver");
    
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/manoj", "root", "");
      PreparedStatement pst = con.prepareStatement("select * from dealer where Did in (select Did from available where cid='"+cid+"')");
        ResultSet rs= pst.executeQuery();
       while(rs.next())
       {
        %>
        <div class="container">
            <div class="box">
        <div class="details">
           <h4 class="name"><tt><%= rs.getString(3) %></tt></h4>
            <p class="email">Email: <%= rs.getString(5) %></p>
            <p>Phone: <%= rs.getString(4) %></p>
            <p>Address: <%= rs.getString(6) %></p><br><br>
            <form action="cdet.jsp" method="post" >
            <button class="dynamic-button" name="but" value=<%= rs.getString(2) %>>available cars</button>
            <form>
          </div>
        </div>

      <% }
      
    }
    catch(Exception e)
      {
        out.println(e);
      
      }
    %>
    </div>
    </main>
</body>
</main>
</html>
