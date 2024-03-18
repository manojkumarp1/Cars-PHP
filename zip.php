<!DOCTYPE html>
<html>
<head>
  <title>Dealers</title>
  <style>
    .box:first-child {
            margin-right: 80px;
        }

        .container {
    display: flex;
    flex-wrap: wrap; /* Allow wrapping to new line */
    justify-content: space-around; /* Distribute items evenly */
}

.box {
    width: 300px;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: white;
    margin: 10px; /* Adjust margin as needed */
    transition: transform .2s;
    display: inline-block; /* Display inline-block for horizontal arrangement */
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
            background-color: maroon;
        }

        .dynamic-button:active {
            background-color: green;
        }
  </style>
</head>
<body bgcolor="grey">
<main>
    <center>
        <h1>DEALER'S DETAILS</h1>
    </center>
    <br><br>

    <?php
    $zip = $_REQUEST["zipcode"];

    try {
      $conn = new mysqli("localhost", "root", "manoj", "manoj");
      if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
      }

      $stmt = $conn->prepare("SELECT * FROM dealer WHERE zip=?");
      $stmt->bind_param("s", $zip);   
      $stmt->execute();
      $result = $stmt->get_result();

      while ($row = $result->fetch_assoc()) {
    ?>
    <div class="container">
        <div class="box">
            <div class="details">
                <h4 class="name"><tt><?php echo $row['fname']; ?></tt></h4>
                <p class="email">Email: <?php echo $row['email']; ?></p>
                <p>Phone: <?php echo $row['Did']; ?></p>
                <p>Address: <?php echo $row['address']; ?></p><br><br>
                <form action="cdet.php" method="post">
                    <button class="dynamic-button" name="but" value="<?php echo $row['Did']; ?>">available cars</button>
                </form>
            </div>
        </div>
      </div>
    <?php
      }
      $conn->close();
    } catch (Exception $e) {
        echo $e->getMessage();
    }
    ?>
</main>
</body>
</html>
