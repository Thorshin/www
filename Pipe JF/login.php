<?php
session_start();
$error = '';
// Afficher le lieu s'il est fourni en paramètre
$locationParam = isset($_GET['location']) ? trim($_GET['location']) : '';
// Persister le lieu dans la session pour y revenir après déconnexion
if ($locationParam !== '') {
  $_SESSION['last_location'] = $locationParam;
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $nom = isset($_POST['username']) ? trim($_POST['username']) : '';
  $mot_de_passe = isset($_POST['password']) ? $_POST['password'] : '';

  $host = 'localhost';
  $db = 'pipe_jf_db';
  $user = 'root';
  $pass = '';
  $charset = 'utf8';

  try {
      $pdo = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass);
      $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e) {
      die("Erreur de connexion : " . $e->getMessage());
  }

  $stmt = $pdo->prepare("SELECT service, site, role FROM agents WHERE LOWER(nom) = ? AND mot_de_passe = ?");
  $stmt->execute([strtolower($nom), $mot_de_passe]);
  $row = $stmt->fetch(PDO::FETCH_ASSOC);

  if ($row) {
    $_SESSION['logged_in'] = true;
    $_SESSION['nom'] = $nom;
    $_SESSION['service'] = $row['service'];
    $_SESSION['site'] = $row['site'];
    $_SESSION['role'] = $row['role'];

    header('Location: formulaire.php');
    exit();
    
  } else {
    $error = "Nom d'utilisateur ou mot de passe incorrect.";
  }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Connexion</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div style="position: fixed; top: 8px; left: 8px; z-index: 1000;">
    <a href="../PageGarde.html" class="btn btn-outline-secondary btn-sm">← Choisir une entité</a>
  </div>
  <?php if ($locationParam): ?>
    <div style="position: fixed; top: 8px; right: 8px; z-index: 1000;">
      <span class="badge bg-success" style="font-size: 0.85rem;">Lieu: <?php echo htmlspecialchars($locationParam); ?></span>
    </div>
  <?php endif; ?>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-4">
        <h4 class="text-center mb-3">Connexion</h4>
        <?php if ($error): ?>
          <div class="alert alert-danger"><?php echo $error; ?></div>
        <?php endif; ?>
        <form method="POST">
          <div class="mb-3">
            <label class="form-label">Nom d'utilisateur</label>
            <input type="text" name="username" class="form-control" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Mot de passe</label>
            <input type="password" name="password" class="form-control" required>
          </div>
          <button type="submit" class="btn btn-primary w-100">Se connecter</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>