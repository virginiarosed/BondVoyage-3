<?php
// Start session
session_start();

// Include the database connection file
include('../PHP/db_connection.php');

// Fetch user ID from session
$itinerary_id = $_GET['itinerary_id'];

// Query to fetch user details
$sql = "SELECT T1.id, concat(first_name,' ',last_name) FullName, travel_name, share_code, T1.created_at FROM create_travel T1 LEFT JOIN users T2 on T1.user_id = T2.id WHERE T1.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $itinerary_id);
$stmt->execute();
$result = $stmt->get_result();

// Fetch user details and return as JSONs
if ($data = $result->fetch_assoc()) {
    echo json_encode($data);
} else {
    echo json_encode(['error' => 'Itinerary not found']);
}

// Close the database connection
$stmt->close();
$conn->close();
?>
