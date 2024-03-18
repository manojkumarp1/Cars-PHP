<?php
$email = $_REQUEST["mail"];
$password = $_REQUEST["pass"];

// Database connection parameters
$servername = "localhost";
$username = "root";
$password_db = "manoj";
$database = "manoj";

// Create connection
$conn = new mysqli($servername, $username, $password_db, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare SQL statement with placeholders to prevent SQL injection
$stmt = $conn->prepare("SELECT fname FROM car WHERE email=? AND password=?");
$stmt->bind_param("ss", $email, $password);
$stmt->execute();
$stmt->store_result();
session_start();
$_SESSION["email"] = $email;

if ($stmt->num_rows > 0) {
    header("Location: index.html");
    exit();
} else {
    echo "<br><br><br><center><p style='color: red;'>INCORRECT EMAIL/PASSWORD</p></center>";
}

// Close statement and connection
$stmt->close();
$conn->close();


?>
