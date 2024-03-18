<?php
$mno = $_POST["mob"];
$fname = $_POST["firstName"];
$lname = $_POST["lastName"];
$email = $_POST["email"];
$password = $_POST["pass"];

try {
    $conn = new mysqli("localhost", "root", "manoj", "manoj");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $stmt = $conn->prepare("INSERT INTO car (fname, lname, mno, email, password, profile) VALUES (?, ?, ?, ?, ?, ?)");
    $profile_picture_url = "Devloper.jpg";
    $stmt->bind_param("ssssss", $fname, $lname, $mno, $email, $password, $profile_picture_url);

    // Default profile picture
    

    if ($stmt->execute()) {
        echo "<h1>One record inserted</h1>";
        echo '<a href="login.html"><button type="button">Log in</button></a>';
    } else {
        echo "Registration failed";
    }

    $conn->close();
} catch(Exception $e) {
    echo $e->getMessage();
}
?>
