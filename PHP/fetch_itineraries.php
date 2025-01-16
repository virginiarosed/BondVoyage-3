<?php

include('../PHP/db_connection.php');

// Fetch itineraries
$sql = "SELECT id, destination, duration_days, duration_nights FROM itineraries";
$stmt = $pdo->query($sql);
$itineraries = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Return JSON response
header('Content-Type: application/json');
echo json_encode($itineraries);
?>
