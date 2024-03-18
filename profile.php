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
<?php
session_start();
$email = $_SESSION["email"];

try {
    $conn = new mysqli("localhost", "root", "manoj", "manoj");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $stmt = $conn->prepare("SELECT * FROM car WHERE email=?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    while ($row = $result->fetch_assoc()) {
?>
    <div class="profile">
        <h1>User Profile</h1>
        <img src="<?php echo $row['profile']; ?>" alt="Profile Picture">
        <div class="info">
            <h2><?php echo $row['fname']; ?></h2>
            <p><span>Email:</span> <?php echo $row['email']; ?></p>
            <p><span>Phone No:</span> <?php echo $row['mno']; ?></p>
            <p><span>Age:</span> 20</p>
        </div>
        <div class="actions">
        <a href="register.php">Edit Profile</a>
        </div>
    </div>
<?php
    }
    $conn->close();
} catch(Exception $e) {
    echo $e->getMessage();
}
?>
</body>
</html>
