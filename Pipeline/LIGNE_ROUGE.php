<?php

$host = 'localhost';
$db = 'pipeline_db';
$user = 'root';
$pass = '';
$charset = 'utf8';

try {
	$conn = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	

    $sql = "ALTER TABLE saisie_travaux ADD ligne_rouge1 INT(1) DEFAULT 0 AFTER nature";
    $conn->exec($sql);
    echo "✅ Colonne `ligne_rouge1` ajoutée avec succès.";
} catch (PDOException $e) {
    echo "❌ Erreur : " . $e->getMessage();
}

?>