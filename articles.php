<?php
//Marcos Lopez Medina
require_once 'model/db.php'; // Assegura't que estàs incloent la connexió a la base de dades
function mostrarArticulos() {
    global $conn; // Asegúrate de que $conn esté disponible aquí

    // Número de artículos por página
    $articulos_por_pagina = 5;

    // Obtener el número total de artículos
    $consultaTotal = $conn->query("SELECT COUNT(*) AS total FROM articulos");
    $total_articulos = $consultaTotal->fetch_assoc()['total'];

    // Calcular el número total de páginas
    $total_paginas = ceil($total_articulos / $articulos_por_pagina);

    // Obtener la página actual desde la URL o establecer 1 como valor por defecto
    $pagina_actual = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
    $pagina_actual = max(1, min($pagina_actual, $total_paginas)); // Asegúrate de que la página actual sea válida

    // Calcular el índice del primer artículo de la página actual
    $inicio = ($pagina_actual - 1) * $articulos_por_pagina;

    // Preparar la consulta para obtener los artículos de la página actual
    $consultaArticulos = $conn->prepare("SELECT id, nombre, cuerpo FROM articulos LIMIT ?, ?");
    $consultaArticulos->bind_param("ii", $inicio, $articulos_por_pagina);
    $consultaArticulos->execute();
    $resultados = $consultaArticulos->get_result();

    // Generar la lista de artículos
    $html = '<ul>';
    while ($articulo = $resultados->fetch_assoc()) {
        $html .= '<li>';
        $html .= '<h3>' . htmlspecialchars($articulo['nombre']) . '</h3>';
        $html .= '<p>' . htmlspecialchars($articulo['cuerpo']) . '</p>';
        $html .= '</li>';
    }
    $html .= '</ul>';

    // Generar los enlaces de paginación
    $html .= '<div class="pagination">';
    if ($pagina_actual > 1) {
        $html .= '<a href="?pagina=' . ($pagina_actual - 1) . '">« Anterior</a>';
    }
    for ($i = 1; $i <= $total_paginas; $i++) {
        if ($i == $pagina_actual) {
            $html .= '<span>' . $i . '</span>'; // Página actual
        } else {
            $html .= '<a href="?pagina=' . $i . '">' . $i . '</a>';
        }
    }
    if ($pagina_actual < $total_paginas) {
        $html .= '<a href="?pagina=' . ($pagina_actual + 1) . '">Siguiente »</a>';
    }
    $html .= '</div>';

    return $html;
}
?>