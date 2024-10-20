<?php
//Marcos Lopez Medina
require_once 'model/db.php'; // Assegura't que estàs incloent la connexió a la base de dades

function mostrarArticulos() {
    global $conn; // Utilitzar la variable de connexió global
    $articulos_html = ''; // Inicialitzar variable per emmagatzemar el HTML

    // Consulta per obtenir tots els articles
    $query = "SELECT id, nombre, cuerpo, fecha_creacion, fecha_modificacion FROM articulos";
    $result = mysqli_query($conn, $query);

    // Comprovar si hi ha articles
    if ($result && mysqli_num_rows($result) > 0) {
        // Sortida de les dades de cada fila
        while ($row = mysqli_fetch_assoc($result)) {
            $articulos_html .= "<div class='articulo'>";
            $articulos_html .= "<h1>" . htmlspecialchars($row['id']) . "</h1>";
            $articulos_html .= "<h2>" . htmlspecialchars($row['nombre']) . "</h2>"; // Mostrar el nom de l'article
            $articulos_html .= "<p>" . htmlspecialchars($row['cuerpo']) . "</p>"; // Mostrar el contingut de l'article
            $articulos_html .= "<small>Creat: " . htmlspecialchars($row['fecha_creacion']) . "</small>"; // Mostrar data de creació
            $articulos_html .= "<small>Modificat: " . htmlspecialchars($row['fecha_modificacion']) . "</small>"; // Mostrar data de modificació
            $articulos_html .= "</div>";
        }
    } else {
        $articulos_html .= "<p>No hi ha articles disponibles.</p>";
    }

    return $articulos_html; // Retornar el HTML generat
}
?>