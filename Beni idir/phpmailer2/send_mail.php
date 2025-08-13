<?php
require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$mail = new PHPMailer(true);

try {
    // Paramètres serveur SMTP Outlook
    $mail->isSMTP();
    $mail->Host       = 'smtp.office365.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'anomalie.hse@outlook.com'; // Adresse Outlook
    $mail->Password   = 'HSE12345678';        // À remplacer par votre mot de passe
    $mail->SMTPSecure = 'tls';
    $mail->Port       = 587;

    // Destinataire
    $mail->setFrom('anomalie.hse@outlook.com', 'App HSE');
    $mail->addAddress('A.ELGHAZI@ocpgroup.ma', 'Responsable HSE');

    // Contenu de l'email
    $mail->isHTML(true);
    $mail->Subject = '📢 Nouvelle anomalie HSE';
    $mail->Body    = 'Une anomalie a été signalée depuis l’application HSE.';

    $mail->send();
    echo '✅ Email envoyé avec succès.';
} catch (Exception $e) {
    echo "❌ L’envoi a échoué : {$mail->ErrorInfo}";
}
?>
