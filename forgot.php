<?php
$mail = $_POST["username"];
$npswd = $_POST["new-password"];
$cpswd = $_POST["confirm-password"];

if ($npswd === $cpswd) {
    try {
        $conn = new mysqli("localhost", "root", "manoj", "manoj");
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $stmt = $conn->prepare("UPDATE car SET password=? WHERE email=?");
        $stmt->bind_param("ss", $npswd, $mail);
        
        if ($stmt->execute()) {
            header("Location: login.html");
            exit();
        } else {
            echo "<h1>Error updating password.</h1>";
        }

        $stmt->close();
        $conn->close();
    } catch (Exception $e) {
        echo $e->getMessage();
    }
} else {
    echo "<h1>New password and current password are not the same.</h1>";
}
?>
