<%@ page import="java.sql.*" %>



 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>available</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .shortnote {
            text-align: center;
        }

        .shortnote img {
            position: relative;
            
        }

        .maingallery {
            background-color: #F6F6F6;
            height: 500px;
        }

        .gallery {
            display: flex;
            justify-content: space-evenly;
        }

        .box,
        .box1,
        .box2 {
            position: relative;
            top: 20px;
            padding: 2px;
            background-color: lightblue;
            width: 350px;
            height: 430px;
            padding-left: 40px;
            border: 1px solid #e2e2e2;
    transition: transform .2s; 
  
        }

        .box img,
        .box1 img,
        .box2 img {
            height: 100px;
            width: 150px;
            position: relative;
            left: 20%;
            top: 10%;
        }

        .box:hover,
        .box1:hover,
        .box2:hover {
            transform: scale(1.05);
        }

        .price {
            display: flex;

        }

        .info {
            position: relative;
            top: 10%;
        }

        .miniprice {
            position: relative;
            left: 80px;
            font-size: 12px;
            color: #929292;
        }

        .year {
            color: #505050;
            font-size: 14px;
        }

        .model {
            font-size: 21px;
            font-weight: 100;
            letter-spacing: 1px;
            position: relative;
            top: -5px;
        }
        .mode {
            font-size: 21px;
            font-weight: bolder;
            letter-spacing: 1px;
            position: relative;
            text-transform: uppercase;
            text-align: center;
            top: -5px;
        }

        .subcol {
            font-size: 16px;
            line-height: 0.5;
            position: relative;
            top: -15px;
            color: #505050;
        }

        .subcol1 {
            font-size: 16px;
            line-height: 0.5;
            position: relative;
            top: -19px;
            color: #505050;
            left: 70px;
        }

        .explore {
            color: #E10A1D;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
        }

        .explore:hover {
            text-decoration: underline;
        }
  
  
</style>
<body>
    <CENTER>
    <h1>AVAILABLE CARS</h1>
    </CENTER>
    <div class="maingallery">
        <div class="gallery">
    <%
       String did = request.getParameter("but");



    try
    {
      
      Class.forName("com.mysql.jdbc.Driver");
    
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/manoj", "root", "");
      PreparedStatement pst = con.prepareStatement("select * from available where Did='"+did+"'");
        ResultSet rs= pst.executeQuery();
       while(rs.next())
       {
        
        %>
  
                <!--1st box-->
                <div class="box">
                    <img src= <%= rs.getString(8) %> alt="">
                    <div class="info">
                        <p class="mode"><%= rs.getString(2) %></p>
                        <p class="miniprice">$ <%= rs.getString(3) %> as shown <sup style="color: #ff4040">1</sup> </p>
                        <p class="year"><%= rs.getString(4) %></p>
                        <p class="model"><%= rs.getString(5) %></p>
                        <div class="price">
                            <div class="subcol">
                                <p style="font-weight: 500;">$<%= rs.getString(6) %></p>
                                <p style="font-size: 12px; color: #929292;">Starting MSRP <sup
                                        style="color: #ff4040">1</sup> </p>
                            </div>
                            <div class="subcol1">
                                <p style="font-weight: 500;"><%= rs.getString(9) %></p>
                                <p style="font-size: 12px; color: #929292;">Est. MPG <sup
                                        style="color: #ff4040">46</sup> </p>
                            </div>
                        </div>
                        <a href="https://www.cardekho.com/mostpopularcars" target="blank" class="explore">Explore</a>
                    </div>
                </div>
                <% 
               
            
        }
            }
            catch(Exception e)
              {
                out.println(e);
              
              }
            %>
  </body>