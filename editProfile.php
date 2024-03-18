<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $mobile = $_POST['mob'];
    $email = $_POST['email'];

    try {
        $conn = new mysqli("localhost", "root", "manoj", "manoj");
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $stmt = $conn->prepare("UPDATE car SET fname=?, lname=?, mno=? WHERE email=?");
        $stmt->bind_param("ssss", $firstName, $lastName, $mobile, $email);

        if ($stmt->execute()) {
            header("Location: profile.php");
        } else {
            echo "Error updating user details: " . $conn->error;
        }

        $conn->close();
    } catch(Exception $e) {
        echo $e->getMessage();
    }
}
?>
