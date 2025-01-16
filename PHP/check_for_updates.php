<?php
// Start session
session_start();

// Include the database connection file
include('../PHP/db_connection.php');

$itinerary_id = $_GET['itinerary_id'];

if ($itinerary_id > 0) {
    // Query to check if change_flag is set to 1 for the specific itinerary
    $sql = "SELECT change_flag FROM itineraryupdate WHERE id = $itinerary_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Fetch the data
        $row = $result->fetch_assoc();

        // Check if the change_flag is 1 (indicating data was changed)
        if ($row['change_flag'] == 1) {
            // Reset the change_flag back to 0 after detecting the change
            $update_flag_sql = "UPDATE itineraryupdate SET change_flag = 0 WHERE id = $itinerary_id";
            $conn->query($update_flag_sql);

            // Send success response with 'changed' status
            echo json_encode(['status' => 'changed']);                                                              
        } else {
            // No changes detected
            echo json_encode(['status' => 'no_change']);
        }
    } else {
        // Handle case if no itinerary found
        echo json_encode(['error' => 'Itinerary not found']);
    }
} else {
    echo json_encode(['error' => 'Invalid itinerary ID']);
}

$conn->close();

?>