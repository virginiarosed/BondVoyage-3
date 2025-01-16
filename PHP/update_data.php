<?php
session_start();

// Include the database connection file
include('../PHP/db_connection.php');

// Check if the request is a POST request and the data exists
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $itineraryId = $_POST['itinerary_id'] ?? '';
    $startDate = $_POST['startDate'] ?? '';
    $endDate = $_POST['endDate'] ?? '';
    $lodging = $_POST['lodging'] ?? '';

    // Ensure the itinerary_id exists in the database
    $sql = "SELECT * FROM create_travel WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $itineraryId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        if (!empty($startDate)) {
            $startDate .= " 00:00:00";  // Add time component to startDate if it's not provided
        }
        if (!empty($endDate)) {
            $endDate .= " 23:59:59";  // Add time component to endDate if it's not provided
        }
        // Update the data if itinerary exists
        $updateSql = "UPDATE create_travel SET      
                        start_date = ?, 
                        end_date = ?, 
                        lodging = ?, 
                        change_flag = ? 
                      WHERE id = ?";
        $updateStmt = $conn->prepare($updateSql);
        $changeFlag = 1;  // Constant value
        $updateStmt->bind_param("ssssi", $startDate, $endDate, $lodging, $changeFlag, $itineraryId);

        if ($updateStmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Data updated successfully"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Error updating data"]);
        }

        $updateStmt->close();
    } else {
        echo json_encode(["status" => "error", "message" => "Itinerary not found"]);
    }

    $stmt->close();
}

$conn->close();
?>
