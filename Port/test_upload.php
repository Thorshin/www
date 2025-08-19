<?php
session_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Test Upload Photo</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Test Upload Photo</h4>
                    </div>
                    <div class="card-body">
                        <form action="submit.php" method="POST" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="photo" class="form-label">Sélectionner une photo</label>
                                <input type="file" class="form-control" id="photo" name="photo" accept="image/*" required>
                                <div class="form-text">Formats acceptés: JPG, JPEG, PNG. Taille max: 10MB</div>
                            </div>
                            
                            <!-- Champs obligatoires pour le formulaire -->
                            <input type="hidden" name="service_concerne" value="TEST">
                            <input type="hidden" name="nature" value="TEST">
                            <input type="hidden" name="travail" value="Test d'upload">
                            
                            <button type="submit" class="btn btn-primary">Tester l'upload</button>
                        </form>
                    </div>
                </div>
                
                <div class="card mt-3">
                    <div class="card-header">
                        <h5>Informations de session</h5>
                    </div>
                    <div class="card-body">
                        <?php if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true): ?>
                            <p><strong>Connecté:</strong> ✅</p>
                            <p><strong>Nom:</strong> <?php echo htmlspecialchars(isset($_SESSION['nom']) ? $_SESSION['nom'] : 'Non défini'); ?></p>
                            <p><strong>Service:</strong> <?php echo htmlspecialchars(isset($_SESSION['service']) ? $_SESSION['service'] : 'Non défini'); ?></p>
                            <p><strong>Site:</strong> <?php echo htmlspecialchars(isset($_SESSION['site']) ? $_SESSION['site'] : 'Non défini'); ?></p>
                        <?php else: ?>
                            <p><strong>Connecté:</strong> ❌</p>
                            <p class="text-danger">Vous devez être connecté pour tester l'upload</p>
                            <a href="login.php" class="btn btn-warning">Se connecter</a>
                        <?php endif; ?>
                    </div>
                </div>
                
                <div class="card mt-3">
                    <div class="card-header">
                        <h5>Dernières photos uploadées</h5>
                    </div>
                    <div class="card-body">
                        <?php
                        $uploadDir = "uploads/";
                        if (is_dir($uploadDir)) {
                            $files = glob($uploadDir . "*.jpg");
                            if (empty($files)) {
                                echo "<p class='text-muted'>Aucune photo trouvée</p>";
                            } else {
                                echo "<div class='row'>";
                                foreach (array_slice($files, -6) as $file) {
                                    $filename = basename($file);
                                    $filesize = filesize($file);
                                    echo "<div class='col-md-4 mb-2'>";
                                    echo "<div class='card'>";
                                    echo "<img src='$file' class='card-img-top' style='height: 100px; object-fit: cover;' alt='$filename'>";
                                    echo "<div class='card-body p-2'>";
                                    echo "<small class='text-muted'>$filename</small><br>";
                                    echo "<small class='text-muted'>" . round($filesize/1024, 1) . " KB</small>";
                                    echo "</div></div></div>";
                                }
                                echo "</div>";
                            }
                        } else {
                            echo "<p class='text-danger'>Le dossier uploads n'existe pas</p>";
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
