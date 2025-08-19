<?php
// Fichier de diagnostic pour vérifier les permissions du dossier uploads
echo "<h2>Diagnostic du dossier uploads</h2>";

$uploadDir = "uploads/";

// Vérifier si le dossier existe
if (is_dir($uploadDir)) {
    echo "✅ Le dossier uploads existe<br>";
} else {
    echo "❌ Le dossier uploads n'existe pas<br>";
    // Essayer de le créer
    if (mkdir($uploadDir, 0755, true)) {
        echo "✅ Dossier uploads créé avec succès<br>";
    } else {
        echo "❌ Impossible de créer le dossier uploads<br>";
    }
}

// Vérifier les permissions
if (is_writable($uploadDir)) {
    echo "✅ Le dossier uploads est accessible en écriture<br>";
} else {
    echo "❌ Le dossier uploads n'est pas accessible en écriture<br>";
    echo "Permissions actuelles: " . substr(sprintf('%o', fileperms($uploadDir)), -4) . "<br>";
}

// Vérifier l'espace disque
$freeSpace = disk_free_space($uploadDir);
$totalSpace = disk_total_space($uploadDir);
echo "Espace libre: " . round($freeSpace / 1024 / 1024, 2) . " MB<br>";
echo "Espace total: " . round($totalSpace / 1024 / 1024, 2) . " MB<br>";

// Vérifier les extensions PHP disponibles
echo "<h3>Extensions PHP disponibles:</h3>";
$extensions = ['gd', 'imagick', 'exif'];
foreach ($extensions as $ext) {
    if (extension_loaded($ext)) {
        echo "✅ $ext est disponible<br>";
    } else {
        echo "❌ $ext n'est pas disponible<br>";
    }
}

// Tester la création d'un fichier
echo "<h3>Test d'écriture:</h3>";
$testFile = $uploadDir . "test_" . time() . ".txt";
if (file_put_contents($testFile, "Test d'écriture")) {
    echo "✅ Test d'écriture réussi: $testFile<br>";
    unlink($testFile); // Supprimer le fichier de test
} else {
    echo "❌ Test d'écriture échoué<br>";
}

// Afficher les informations du serveur
echo "<h3>Informations du serveur:</h3>";
echo "PHP version: " . phpversion() . "<br>";
echo "Système d'exploitation: " . PHP_OS . "<br>";
echo "User du serveur web: " . get_current_user() . "<br>";
?>
