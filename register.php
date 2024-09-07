<?php
// register.php

// Configuration
$db_host = 'localhost';
$db_username = 'root';
$db_password = '';
$db_name = 'p2p_marketplace';

// Connect to database
$conn = new mysqli($db_host, $db_username, $db_password, $db_name);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Register user
if (isset($_POST['register'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $viewkey = $_POST['viewkey'];

    // Hash password
    $password_hash = password_hash($password, PASSWORD_BCRYPT);

    // Insert user into database
    $query = "INSERT INTO users (username, password, viewkey) VALUES ('$username', '$password_hash', '$viewkey')";
    $result = $conn->query($query);

    if ($result) {
        echo "User registered successfully!";
    } else {
        echo "Error registering user: " . $conn->error;
    }
}

// Close connection
$conn->close();
?>
