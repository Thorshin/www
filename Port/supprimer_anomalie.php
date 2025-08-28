<?php
session_start();

// Vérifier que l'utilisateur est connecté et est admin
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true || $_SESSION['role'] !== 'admin') {
    http_response_code(403);
    echo json_encode(['success' => false, 'message' => 'Accès refusé']);
    exit();
}

// Vérifier que la requête est en POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Méthode non autorisée']);
    exit();
}

// Vérifier que l'ID est fourni
if (!isset($_POST['id']) || !is_numeric($_POST['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID invalide']);
    exit();
}

$id = (int)$_POST['id'];

$host = 'localhost';
$db = 'casa_port_db';
$user = 'root';
$pass = '';
$charset = 'utf8';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erreur de connexion à la base de données']);
    exit();
}

try {
    // Récupérer les informations de l'anomalie pour supprimer la photo
    $stmt = $pdo->prepare("SELECT photo FROM saisie_travaux WHERE id = ?");
    $stmt->execute([$id]);
    $anomalie = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$anomalie) {
        echo json_encode(['success' => false, 'message' => 'Anomalie non trouvée']);
        exit();
    }
    
    // Supprimer la photo si elle existe
    if ($anomalie['photo'] && file_exists($anomalie['photo'])) {
        unlink($anomalie['photo']);
    }
    
    // Supprimer l'enregistrement de la base de données
    $stmt = $pdo->prepare("DELETE FROM saisie_travaux WHERE id = ?");
    $stmt->execute([$id]);
    
    if ($stmt->rowCount() > 0) {
        echo json_encode(['success' => true, 'message' => 'Anomalie supprimée avec succès']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Aucune anomalie supprimée']);
    }
    
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erreur lors de la suppression : ' . $e->getMessage()]);
}
?>
