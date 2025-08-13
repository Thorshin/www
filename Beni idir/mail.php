<?php
$to = "A.ELGHAZI@ocpgroup.ma";
$subject = "Test mail depuis Wamp";
$message = "Ce message est envoyé depuis mon serveur local.";
$headers = "From: A.ELGHAZI@ocpgroup.ma";

if (mail($to, $subject, $message, $headers)) {
    echo "✅ Mail envoyé avec succès.";
} else {
    echo "❌ Échec de l’envoi du mail.";
}
?>
