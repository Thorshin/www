<?php
session_start();
// Conserver temporairement le dernier lieu si présent
$lastLocation = isset($_SESSION['last_location']) ? $_SESSION['last_location'] : '';

// Nettoyer la session
session_unset();
session_destroy();

// Rediriger vers le login avec le lieu si disponible
if ($lastLocation !== '') {
    header('Location: login.php?location=' . urlencode($lastLocation));
} else {
    header('Location: login.php');
}
exit();
?>
