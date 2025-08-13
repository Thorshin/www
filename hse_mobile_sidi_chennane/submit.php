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
$db = 'sidi_chennane_db';
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
    $allowedTypes = ['image/jpeg', 'image/png', 'image/jpg'];
    $maxSize = 2 * 1024 * 1024;

    if (!in_array($originalType, $allowedTypes)) {
        // Format non supporté (ex: HEIC) → on stocke brut sans traitement
        if (move_uploaded_file($_FILES["photo"]["tmp_name"], $targetFile)) {
            $photoPath = $targetFile;
        }
    } else {
        // Format JPEG/PNG → compresser si nécessaire
        if ($_FILES["photo"]["size"] > $maxSize) {
            if (redimensionner_image($_FILES["photo"]["tmp_name"], $targetFile)) {
                $photoPath = $targetFile;
            }
        } else {
            if (move_uploaded_file($_FILES["photo"]["tmp_name"], $targetFile)) {
                $photoPath = $targetFile;
            }
        }
    }
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

echo "<h3>✅ Anomalie enregistrée avec succès !</h3><a href='formulaire.php'>↩ Retour</a>";
?>