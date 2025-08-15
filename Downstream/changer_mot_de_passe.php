<?php
session_start();

// Redirect if not logged in
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit();
}

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $new_password = isset($_POST['new_password']) ? $_POST['new_password'] : '';
    $confirm_password = isset($_POST['confirm_password']) ? $_POST['confirm_password'] : '';

    if ($new_password !== $confirm_password) {
        $error = 'Les mots de passe ne correspondent pas.';
    } elseif (empty($new_password)) {
        $error = 'Le nouveau mot de passe ne peut pas être vide.';
    } else {
        $host = 'localhost';
        $db = 'downstream_db';
        $user = 'root';
        $pass = '';
        $charset = 'utf8';

        try {
            $pdo = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Erreur de connexion : " . $e->getMessage());
        }

        $nom = $_SESSION['nom'];
        $stmt = $pdo->prepare("UPDATE agents SET mot_de_passe = ? WHERE LOWER(nom) = ?");
        $stmt->execute([$new_password, strtolower($nom)]);

        $success = 'Mot de passe changé avec succès.';
        // Optionally, redirect to formulaire.php after a short delay
        header('Refresh:2; url=formulaire.php');
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Changer le mot de passe</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <h4 class="text-center mb-3">Changer le mot de passe</h4>
                <?php if ($error): ?>
                    <div class="alert alert-danger"><?php echo $error; ?></div>
                <?php endif; ?>
                <?php if ($success): ?>
                    <div class="alert alert-success"><?php echo $success; ?></div>
                <?php endif; ?>
                <form method="POST">
                    <div class="mb-3">
                        <label class="form-label">Nouveau mot de passe</label>
                        <input type="password" name="new_password" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Confirmer le nouveau mot de passe</label>
                        <input type="password" name="confirm_password" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Changer le mot de passe</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
