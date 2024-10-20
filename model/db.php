<?php
// Marcos Lopez Medina
$servername = "localhost";
$username = "root"; // Canvia segons la teva configuració
$password = ""; // Canvia segons la teva configuració
$dbname = "pt4_Marcos_Lopez"; // Canvia segons la teva base de dades

// Crear connexió
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la connexió
if ($conn->connect_error) { // Canvia $mysqli per $conn
    die("Connexió fallida: " . $conn->connect_error);
}
?>