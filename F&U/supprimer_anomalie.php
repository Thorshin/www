<?php
session_start();

// VÃ©rifier que l'utilisateur est connectÃ© et est admin
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true || $_SESSION['role'] !== 'admin') {
    http_response_code(403);
    echo json_encode(['success' => false, 'message' => 'AccÃ¨s refusÃ©']);
    exit();
}

// VÃ©rifier que la requÃªte est en POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'MÃ©thode non autorisÃ©e']);
    exit();
}

// VÃ©rifier que l'ID est fourni
if (!isset($_POST['id']) || !is_numeric($_POST['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID invalide']);
    exit();
}

$id = (int)$_POST['id'];

// Connexion Ã  la base de donnÃ©es
$host = 'localhost';
$db = 'f&u_db';
$user = 'root';
$pass = '';
$charset = 'utf8';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erreur de connexion Ã  la base de donnÃ©es']);
    exit();
}

try {
    // RÃ©cupÃ©rer les informations de l'anomalie pour supprimer la photo
    $stmt = $pdo->prepare("SELECT photo FROM saisie_travaux WHERE id = ?");
    $stmt->execute([$id]);
    $anomalie = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$anomalie) {
        echo json_encode(['success' => false, 'message' => 'Anomalie non trouvÃ©e']);
        exit();
    }
    
    // Supprimer la photo si elle existe
    if ($anomalie['photo'] && file_exists($anomalie['photo'])) {
        unlink($anomalie['photo']);
    }
    
    // Supprimer l'enregistrement de la base de donnÃ©es
    $stmt = $pdo->prepare("DELETE FROM saisie_travaux WHERE id = ?");
    $stmt->execute([$id]);
    
    if ($stmt->rowCount() > 0) {
        echo json_encode(['success' => true, 'message' => 'Anomalie supprimÃ©e avec succÃ¨s']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Aucune anomalie supprimÃ©e']);
    }
    
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erreur lors de la suppression : ' . $e->getMessage()]);
}
?>
