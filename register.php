<?php
session_start();

$firstName = '';
$lastName = '';
$mobile = '';
$email = '';

if ( isset($_SESSION["email"])) {
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

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $firstName = $row['fname'];
            $lastName = $row['lname'];
            $mobile = $row['mno'];
            // Email field is readonly to prevent changes
        }

        $conn->close();
    } catch(Exception $e) {
        echo $e->getMessage();
    }
}
?>

<html>
<head>
    <meta charset="UTF-8">
    <title>SIGNUP</title>
    <script type="text/javascript" src="script.js"></script>
    <link rel="stylesheet" href="registrationstyle.css">
</head>
<body>
    <div class="form">
        <form action="editProfile.php" method="post" name="registration" onsubmit="return validateForm();">
            <h1><center>EDIT HERE!</center></h1><br>
            
            <div class="content">
                <p>FirstName</p>
                <input type="text" name="firstName" value="<?php echo $firstName; ?>">
            </div>
            <div class="content">
                <p>LastName</p>
                <input type="text" name="lastName" value="<?php echo $lastName; ?>">
            </div>
            <div class="content">
                <p>Mobile</p>
                <input type="text" name="mob" value="<?php echo $mobile; ?>">
            </div>
            <div class="content">
                <p>Email-ID</p>
                <input type="text" name="email" value="<?php echo $email; ?>" readonly>
            </div>
            <div class="content">
                     
            </div>
            <br>
            <center><input type="submit" value="update" /> </center><br><br>
            
           
        </form>
    </div>  
</body>
</html>
