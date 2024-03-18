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

        .box {
            position: relative;
            top: 20px;
            padding: 2px;
            background-color: lightblue;
            width: 350px;
            height: 430px;
            padding-left: 40px;
            border: 1px solid #e2e2e2;
            transition: transform .2s;
            display: inline-block; /* Display as inline-block for horizontal arrangement */
            margin: 10px; /* Add some margin between boxes */
        }

        .box img {
            height: 100px;
            width: 150px;
            position: relative;
            left: 20%;
            top: 10%;
        }

        .box:hover {
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

        .mode {
            font-size: 21px;
            font-weight: bolder;
            letter-spacing: 1px;
            position: relative;
            text-transform: uppercase;
            text-align: center;
            top: -5px;
        }

        .model {
            font-size: 21px;
            font-weight: 100;
            letter-spacing: 1px;
            position: relative;
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
</head>
<body>
    <center>
        <h1>AVAILABLE CARS</h1>
    </center>
    <div class="maingallery">
        <div class="gallery">
            <?php
            $did = $_REQUEST["but"];

            try {
                $conn = new mysqli("localhost", "root", "manoj", "manoj");
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $stmt = $conn->prepare("SELECT * FROM available WHERE Did=?");
                $stmt->bind_param("s", $did);
                $stmt->execute();
                $result = $stmt->get_result();

                while ($row = $result->fetch_assoc()) {
            ?>
                <!--1st box-->
                <div class="box">
                    <img src="<?php echo $row['img']; ?>" alt="">
                    <div class="info">
                        <p class="mode"><?php echo $row['name']; ?></p>
                        <p class="miniprice">$ <?php echo $row['miniprice']; ?> as shown <sup style="color: #ff4040">1</sup> </p>
                        <p class="year"><?php echo $row['year']; ?></p>
                        <p class="model"><?php echo $row['model']; ?></p>
                        <div class="price">
                            <div class="subcol">
                                <p style="font-weight: 500;">$<?php echo $row['msrp']; ?></p>
                                <p style="font-size: 12px; color: #929292;">Starting MSRP <sup style="color: #ff4040">1</sup> </p>
                            </div>
                            <div class="subcol1">
                                <p style="font-weight: 500;"><?php echo $row['mpg']; ?></p>
                                <p style="font-size: 12px; color: #929292;">Est. MPG <sup style="color: #ff4040">46</sup> </p>
                            </div>
                        </div>
                        <a href="https://www.cardekho.com/mostpopularcars" target="blank" class="explore">Explore</a>
                    </div>
                </div>
            <?php
                }
                $conn->close();
            } catch (Exception $e) {
                echo $e->getMessage();
            }
            ?>
        </div>
    </div>
</body>
</html>
