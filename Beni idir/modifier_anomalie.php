<?php
session_start();

// VÃ©rifier que l'utilisateur est connectÃ© et est admin
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true || $_SESSION['role'] !== 'admin') {
    header('Location: login.php');
    exit();
}

$host = 'localhost';
$db = 'beni_idir_db';
$user = 'root';
$pass = '';
$charset = 'utf8';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$message = '';
$error = '';

// Traitement du formulaire de modification
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $service_concerne = $_POST['service_concerne'];
    $nature = $_POST['nature'];
    $anomalie = $_POST['travail'];
    $ligne_rouge = isset($_POST['ligne_rouge']) ? 1 : 0;
    $observations = isset($_POST['observations']) ? $_POST['observations'] : 'RAS';
    
    try {
        $stmt = $pdo->prepare("UPDATE saisie_travaux SET service_concerne = ?, nature = ?, anomalie = ?, ligne_rouge = ?, observations = ? WHERE id = ?");
        $stmt->execute([$service_concerne, $nature, $anomalie, $ligne_rouge, $observations, $id]);
        
        if ($stmt->rowCount() > 0) {
            $message = "Anomalie modifiÃ©e avec succÃ¨s !";
        } else {
            $error = "Aucune modification effectuÃ©e";
        }
    } catch (PDOException $e) {
        $error = "Erreur lors de la modification : " . $e->getMessage();
    }
}

// RÃ©cupÃ©rer les donnÃ©es de l'anomalie
try {
    $stmt = $pdo->prepare("SELECT * FROM saisie_travaux WHERE id = ?");
    $stmt->execute([$id]);
    $anomalie_data = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$anomalie_data) {
        die("Anomalie non trouvÃ©e");
    }
} catch (PDOException $e) {
    die("Erreur lors de la rÃ©cupÃ©ration : " . $e->getMessage());
}

// Services disponibles pour Beni idir
$services = ['Ã©lectrique', 'instrumentation', 'bande', 'mÃ©canique', 'BDM', 'HSE', 'exploitation', 'autres'];
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Modifier Anomalie</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4>âœï¸ Modifier l'Anomalie #<?php echo $id; ?></h4>
                    </div>
                    <div class="card-body">
                        <?php if ($message): ?>
                            <div class="alert alert-success"><?php echo htmlspecialchars($message); ?></div>
                        <?php endif; ?>
                        
                        <?php if ($error): ?>
                            <div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div>
                        <?php endif; ?>
                        
                        <form method="POST">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Service concernÃ©</label>
                                        <select name="service_concerne" class="form-select" required>
                                            <?php foreach ($services as $service): ?>
                                                <option value="<?php echo $service; ?>" <?php echo ($anomalie_data['service_concerne'] === $service) ? 'selected' : ''; ?>>
                                                    <?php echo ucfirst(strtolower($service)); ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Nature</label>
                                        <input type="text" name="nature" class="form-control" value="<?php echo htmlspecialchars($anomalie_data['nature']); ?>" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Anomalie</label>
                                <textarea name="travail" class="form-control" rows="3" required><?php echo htmlspecialchars($anomalie_data['anomalie']); ?></textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Observations</label>
                                <textarea name="observations" class="form-control" rows="2"><?php echo htmlspecialchars($anomalie_data['observations']); ?></textarea>
                            </div>
                            
                            <div class="mb-3">
                                <div class="form-check">
                                    <input type="checkbox" name="ligne_rouge" class="form-check-input" id="ligne_rouge" <?php echo ($anomalie_data['ligne_rouge'] == 1) ? 'checked' : ''; ?>>
                                    <label class="form-check-label" for="ligne_rouge">
                                        Ligne Rouge (Critique)
                                    </label>
                                </div>
                            </div>
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-warning">💾 Enregistrer les modifications</button>
                                <a href="historique.php" class="btn btn-secondary">↩ Retour Ã  l'historique</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
