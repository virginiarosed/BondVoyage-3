<?php
$host = 'localhost';
$dbname = 'bondvoyage_db';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    try {
        // Start a transaction
        $pdo->beginTransaction();

        // Collect form data
        $clientName = $_POST['client-name'];
        $destination = $_POST['destination'];
        $startDate = $_POST['start_date'];
        $endDate = $_POST['end_date'];

        // Insert itinerary data into the database
        $stmt = $pdo->prepare("INSERT INTO customized_itineraries (client_name, destination, start_date, end_date) VALUES (?, ?, ?, ?)");
        $stmt->execute([$clientName, $destination, $startDate, $endDate]);
        
        // Get the last inserted itinerary ID
        $itineraryId = $pdo->lastInsertId();

        // Insert day data
        $dayNumbers = $_POST['day_number'] ?? [];
        $dates = $_POST['date'] ?? [];
        $days = $_POST['day'] ?? [];
        $startTimes = $_POST['start_time'] ?? [];
        $endTimes = $_POST['end_time'] ?? [];
        $activities = $_POST['activity'] ?? [];

        if (count($dayNumbers) > 0 && count($dates) > 0 && count($days) > 0) {
            for ($i = 0; $i < count($dayNumbers); $i++) {
                // If activity is empty, set a default value
                $activity = isset($activities[$i]) && !empty($activities[$i]) ? $activities[$i] : 'No activity specified';

                // Check if all required fields are set
                if (isset($dayNumbers[$i], $dates[$i], $days[$i], $startTimes[$i], $endTimes[$i], $activity)) {
                    $stmt = $pdo->prepare("INSERT INTO customized_itinerary_days (itinerary_id, day_number, date, day_of_week, start_time, end_time, activity) VALUES (?, ?, ?, ?, ?, ?, ?)");
                    $stmt->execute([$itineraryId, $dayNumbers[$i], $dates[$i], $days[$i], $startTimes[$i], $endTimes[$i], $activity]);
                }
            }
        } else {
            throw new Exception("Missing day data.");
        }

        // Commit the transaction
        $pdo->commit();
        
        echo "Itinerary has been successfully added";
    } catch (Exception $e) {
        // Rollback transaction in case of error
        $pdo->rollBack();
        echo "Error: " . $e->getMessage();
    }
} else {
    echo "Invalid request method";
}
?>
