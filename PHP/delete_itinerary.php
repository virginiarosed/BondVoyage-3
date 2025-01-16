<?php
include('../PHP/db_connection.php');

// Check if 'id' is provided in the query string
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Begin a transaction to delete the itinerary and its related days
    try {
        // Delete related activities first
        $stmt = $pdo->prepare("DELETE FROM itinerary_days WHERE itinerary_id = :id");
        $stmt->execute([':id' => $id]);

        // Now delete the itinerary
        $stmt = $pdo->prepare("DELETE FROM itineraries WHERE id = :id");
        $stmt->execute([':id' => $id]);

        // Respond with a success message
        echo json_encode(['success' => true]);
    } catch (PDOException $e) {
        // If an error occurs, respond with an error message
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'No itinerary ID provided']);
}
?>
