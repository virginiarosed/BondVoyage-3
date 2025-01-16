<?php
// Start session
session_start();

// Include the database connection file
include('../PHP/db_connection.php');

// Check if the request is a POST request and if the 'action' is 'reset'
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action']) && $_POST['action'] == 'reset') {
    // Reset the change flag in the database
    $sql = "UPDATE create_travel SET change_flag = 0 WHERE id = 1";  // Example query
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["status" => "success", "message" => "Change flag reset"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error resetting change flag"]);
    }
}

$conn->close();
?>
