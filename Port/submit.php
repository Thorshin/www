<?php

session_start();
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit();
}
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: login.php');
    exit();
}

$host = 'localhost';
$db = 'casa_port_db';
$user = 'root';
$pass = '';
$charset = 'utf8';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

$date_saisie = date('Y-m-d H:i:s');
$nom = $_SESSION['nom'];
$service = $_SESSION['service'];
$site = $_SESSION['site'];
$service_concerne = $_POST['service_concerne'];
$nature = $_POST['nature'];
$ligne_rouge = isset($_POST['ligne_rouge']) ? 1 : 0;
$anomalie = $_POST['travail'];
$observations = "RAS";

$photoPath = NULL;

// Fonction de redimensionnement JPG/PNG
function redimensionner_image($source, $destination, $largeur_max = 1024, $qualite = 80) {
    $info = getimagesize($source);
    if (!$info) return false;

    list($largeur, $hauteur) = $info;
    $ratio = $largeur / $hauteur;
    if ($largeur > $largeur_max) {
        $largeur = $largeur_max;
        $hauteur = $largeur / $ratio;
    }

    $image_p = imagecreatetruecolor($largeur, $hauteur);
    switch ($info['mime']) {
        case 'image/jpeg':
            $image = imagecreatefromjpeg($source);
            break;
        case 'image/png':
            $image = imagecreatefrompng($source);
            break;
        default:
            return false;
    }

    imagecopyresampled($image_p, $image, 0, 0, 0, 0, $largeur, $hauteur, $info[0], $info[1]);
    imagejpeg($image_p, $destination, $qualite);
    return true;
}

if (isset($_FILES['photo']) && $_FILES['photo']['error'] === 0) {
    $originalType = $_FILES["photo"]["type"];
    $photoName = time() . ".jpg";
    $targetFile = "uploads/" . $photoName;
    $allowedTypes = ['image/jpeg', 'image/jpg', 'image/png'];
    $maxSize = 10 * 1024 * 1024; // 10MB pour les photos Android
    
    // Debug: afficher les informations du fichier
    error_log("=== DEBUG UPLOAD PHOTO ===");
    error_log("Type de fichier: " . $originalType);
    error_log("Taille du fichier: " . $_FILES["photo"]["size"] . " bytes");
    error_log("Nom du fichier: " . $_FILES["photo"]["name"]);
    error_log("Erreur: " . $_FILES["photo"]["error"]);
    error_log("Fichier temporaire: " . $_FILES["photo"]["tmp_name"]);
    
    // Vérifier si le fichier temporaire existe
    if (!file_exists($_FILES["photo"]["tmp_name"])) {
        error_log("ERREUR: Le fichier temporaire n'existe pas!");
        $photoPath = NULL;
    } else {
        // Vérifier la taille du fichier temporaire
        $tempSize = filesize($_FILES["photo"]["tmp_name"]);
        error_log("Taille du fichier temporaire: " . $tempSize . " bytes");
        
        // Gérer les différents cas
        if (in_array($originalType, $allowedTypes)) {
            // Format JPEG/PNG standard
            error_log("Format standard détecté: " . $originalType);
            if ($_FILES["photo"]["size"] > $maxSize) {
                error_log("Fichier trop volumineux, tentative de redimensionnement...");
                if (redimensionner_image($_FILES["photo"]["tmp_name"], $targetFile)) {
                    $photoPath = $targetFile;
                    error_log("Image redimensionnée avec succès: " . $targetFile);
                } else {
                    error_log("Échec du redimensionnement, tentative de copie directe...");
                    if (move_uploaded_file($_FILES["photo"]["tmp_name"], $targetFile)) {
                        $photoPath = $targetFile;
                        error_log("Image copiée directement après échec du redimensionnement: " . $targetFile);
                    } else {
                        error_log("Échec de la copie directe");
                    }
                }
            } else {
                error_log("Fichier dans la limite de taille, copie directe...");
                if (move_uploaded_file($_FILES["photo"]["tmp_name"], $targetFile)) {
                    $photoPath = $targetFile;
                    error_log("Image copiée avec succès: " . $targetFile);
                } else {
                    error_log("Échec de la copie du fichier");
                }
            }
        } else {
            // Format non standard - essayer de le traiter
            error_log("Format non standard détecté: " . $originalType);
            
            // Essayer de copier le fichier tel quel d'abord
            if (move_uploaded_file($_FILES["photo"]["tmp_name"], $targetFile)) {
                $photoPath = $targetFile;
                error_log("Fichier non standard copié avec succès: " . $targetFile);
            } else {
                error_log("Échec de la copie du fichier non standard");
            }
        }
        
        // Vérifier que le fichier existe après traitement
        if ($photoPath && !file_exists($photoPath)) {
            error_log("ERREUR: Le fichier n'existe pas après traitement: " . $photoPath);
            $photoPath = NULL;
        } else if ($photoPath) {
            error_log("Vérification finale: fichier existe et fait " . filesize($photoPath) . " bytes");
        }
    }
    
    // Debug: afficher le chemin final
    error_log("Chemin final de la photo: " . ($photoPath ?: "NULL"));
    error_log("=== FIN DEBUG UPLOAD ===");
}

$sql = "INSERT INTO saisie_travaux (
    date_saisie, nom, site, service, service_concerne, nature, ligne_rouge, anomalie, photo, observations
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    $date_saisie,
    $nom,
    $site,
    $service,
    $service_concerne,
    $nature,
    $ligne_rouge,
    $anomalie,
    $photoPath,
    $observations
]);

echo '<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Succès</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <meta http-equiv="refresh" content="2;url=formulaire.php">
</head>
<body class="bg-light">
  <div class="container mt-5" style="max-width: 520px;">
    <div class="card shadow-sm border-success">
      <div class="card-body text-center">
        <div class="display-6 mb-2">✅</div>
        <h5 class="card-title text-success mb-2">Anomalie enregistrée avec succès</h5>
        <p class="text-muted mb-3">Vous allez être redirigé vers le formulaire dans quelques secondes.</p>
        <a href="formulaire.php" class="btn btn-success">↩ Retour au formulaire</a>
      </div>
    </div>
  </div>
  <script>
    setTimeout(function(){ window.location.href = "formulaire.php"; }, 2000);
  </script>
</body>
</html>';
?>