<?php
session_start();
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    // Redirection vers la page de connexion si non connecté
    header('Location: login.php');
    exit();
}

// Sinon, accès au formulaire
header('Location: formulaire.php');
exit();
?>
