<?php
// Afficher les informations PHP importantes pour l'upload
echo "<h2>Configuration PHP pour l'upload</h2>";

echo "<h3>Paramètres d'upload:</h3>";
echo "<strong>upload_max_filesize:</strong> " . ini_get('upload_max_filesize') . "<br>";
echo "<strong>post_max_size:</strong> " . ini_get('post_max_size') . "<br>";
echo "<strong>max_file_uploads:</strong> " . ini_get('max_file_uploads') . "<br>";
echo "<strong>max_execution_time:</strong> " . ini_get('max_execution_time') . " secondes<br>";
echo "<strong>memory_limit:</strong> " . ini_get('memory_limit') . "<br>";

echo "<h3>Dossier temporaire:</h3>";
echo "<strong>upload_tmp_dir:</strong> " . (ini_get('upload_tmp_dir') ? ini_get('upload_tmp_dir') : 'Défaut du système') . "<br>";
echo "<strong>sys_get_temp_dir():</strong> " . (function_exists('sys_get_temp_dir') ? sys_get_temp_dir() : 'Fonction non disponible') . "<br>";

echo "<h3>Extensions disponibles:</h3>";
$extensions = ['gd', 'imagick', 'exif', 'fileinfo'];
foreach ($extensions as $ext) {
    if (extension_loaded($ext)) {
        echo "✅ $ext est disponible<br>";
    } else {
        echo "❌ $ext n'est pas disponible<br>";
    }
}

echo "<h3>Test de création de fichier temporaire:</h3>";
$tempDir = function_exists('sys_get_temp_dir') ? sys_get_temp_dir() : '/tmp';
$tempFile = $tempDir . '/test_' . time() . '.tmp';
if (is_writable($tempDir)) {
    echo "✅ Dossier temporaire accessible: $tempDir<br>";
    if (file_put_contents($tempFile, "Test")) {
        echo "✅ Fichier temporaire créé: $tempFile<br>";
        echo "✅ Écriture dans le fichier temporaire réussie<br>";
        echo "Taille: " . filesize($tempFile) . " bytes<br>";
        unlink($tempFile);
        echo "✅ Fichier temporaire supprimé<br>";
    } else {
        echo "❌ Échec de l'écriture dans le fichier temporaire<br>";
    }
} else {
    echo "❌ Dossier temporaire non accessible en écriture: $tempDir<br>";
}

echo "<h3>Permissions du dossier uploads:</h3>";
$uploadDir = "uploads/";
if (is_dir($uploadDir)) {
    echo "✅ Dossier uploads existe<br>";
    echo "Permissions: " . substr(sprintf('%o', fileperms($uploadDir)), -4) . "<br>";
    
    // Vérifier si les fonctions posix sont disponibles
    if (function_exists('posix_getpwuid')) {
        echo "Propriétaire: " . posix_getpwuid(fileowner($uploadDir))['name'] . "<br>";
        echo "Groupe: " . posix_getgrgid(filegroup($uploadDir))['name'] . "<br>";
    } else {
        echo "Propriétaire: " . fileowner($uploadDir) . " (ID)<br>";
        echo "Groupe: " . filegroup($uploadDir) . " (ID)<br>";
    }
    
    echo "Accessible en écriture: " . (is_writable($uploadDir) ? "✅" : "❌") . "<br>";
} else {
    echo "❌ Dossier uploads n'existe pas<br>";
}

echo "<h3>Version PHP:</h3>";
echo "Version PHP: " . phpversion() . "<br>";
echo "Système d'exploitation: " . PHP_OS . "<br>";
?>
