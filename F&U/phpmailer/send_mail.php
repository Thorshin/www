<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'src/Exception.php';
require 'src/PHPMailer.php';
require 'src/SMTP.php';

// Création de l'objet PHPMailer
$mail = new PHPMailer(true);
$mail->SMTPDebug = 2; // Affiche les détails de la connexion

try {
    // Paramètres serveur
    $mail->isSMTP();
    $mail->Host = 'smtp.office365.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'anomalie.hse@outlook.com';     // TON adresse
    $mail->Password = '272YP-ZATCT-F6CGG-BJ27L-GRZU6';         // Ton mot de passe Outlook
    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;

    // Expéditeur et destinataire
    $mail->setFrom('anomalie.hse@outlook.com', 'Application HSE');
    $mail->addAddress('anomalie.hse@outlook.com');  // Test vers toi-même

    // Contenu du message
    $mail->isHTML(true);
    $mail->Subject = 'Notification HSE : Nouvelle anomalie saisie';
    $mail->Body    = 'Une anomalie a été saisie dans l’application mobile HSE.';

    $mail->send();
    echo '<p style="color:green">✅ Message envoyé avec succès</p>';
} catch (Exception $e) {
    echo '<p style="color:red">❌ Échec de l’envoi du message. Erreur : ', $mail->ErrorInfo, '</p>';
}
?>
