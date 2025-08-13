<?php
require_once 'fpdf/fpdf.php';

session_start();

$export_mode = isset($_GET['export']) && in_array($_GET['export'], ['pdf', 'csv']);

if (!$export_mode) {
    if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
        header('Location: login.php');
        exit();
    }
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


$recherche = isset($_GET['recherche']) ? $_GET['recherche'] : '';
$debut = isset($_GET['date_debut']) ? $_GET['date_debut'] : '';
$fin = isset($_GET['date_fin']) ? $_GET['date_fin'] : '';
$service_concerne = isset($_GET['service_concerne']) ? $_GET['service_concerne'] : '';
$site_filter = isset($_GET['site']) ? $_GET['site'] : '';
$ligne_rouge_filter = isset($_GET['ligne_rouge']) ? $_GET['ligne_rouge'] : '';

$where = [];
$params = [];

if ($service_concerne) {
    $where[] = "service_concerne = ?";
    $params[] = $service_concerne;
}
if ($site_filter) {
    $where[] = "site = ?";
    $params[] = $site_filter;
}
if ($recherche) {
    $where[] = "(nom LIKE ? OR nature LIKE ? OR anomalie LIKE ? OR observations LIKE ?)";
    $params[] = "%$recherche%";
    $params[] = "%$recherche%";
    $params[] = "%$recherche%";
    $params[] = "%$recherche%";
}
if ($debut && $fin) {
    $where[] = "DATE(date_saisie) BETWEEN ? AND ?";
    $params[] = $debut;
    $params[] = $fin;
}

$sql = "SELECT * FROM saisie_travaux";
if ($ligne_rouge_filter !== '') {
    $where[] = "ligne_rouge = ?";
    $params[] = $ligne_rouge_filter;
}

if ($where) {
	$sql .= " WHERE " . implode(" AND ", $where);

}
$sql .= " ORDER BY date_saisie DESC";

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$donnees = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (isset($_GET['export']) && $_GET['export'] === 'csv') {
    header('Content-Type: text/csv; charset=utf-8');
    header('Content-Disposition: attachment; filename=export.csv');
	echo "\xEF\xBB\xBF"; // UTF-8 BOM
    $output = fopen('php://output', 'w');
    fputcsv($output, ['Date', 'Nom', 'Site', 'Concerné', 'Nature', 'Anomalie', 'Photo',  'Observation', 'Critique'], ';');
    foreach ($donnees as $row) {
        fputcsv($output, [
            $row['date_saisie'],
            $row['nom'],
            $row['site'],
            $row['service_concerne'],
            $row['nature'],
            $row['anomalie'],
			'http://localhost:8080/HSE_Mobile/' . $row['photo'], // lien cliquable vers photo
            $row['observations'],
            $row['ligne_rouge'] ? '❗ Critique' : ''
        ], ';');
    }
    fclose($output);
    exit;
}



if (isset($_GET['export']) && $_GET['export'] === 'pdf') {
    require_once __DIR__ . '/fpdf/fpdf.php';

    class PDF extends FPDF {
        function Row($data, $ligneRouge = false, $colWidths = []) {
            $nb = 0;
            for ($i = 0; $i < count($data); $i++) {
                $nb = max($nb, $this->NbLines($colWidths[$i], $data[$i]));
            }
            $h = 6 * $nb;
            $this->CheckPageBreak($h);

            if ($ligneRouge) {
                $this->SetFillColor(255, 200, 200);
            } else {
                $this->SetFillColor(255, 255, 255);
            }

            for ($i = 0; $i < count($data); $i++) {
                $w = $colWidths[$i];
                $x = $this->GetX();
                $y = $this->GetY();
                $this->Rect($x, $y, $w, $h);
                $this->MultiCell($w, 6, utf8_decode($data[$i]), 0, 'L', true);
                $this->SetXY($x + $w, $y);
            }
            $this->Ln($h);
        }

        function CheckPageBreak($h) {
            if ($this->GetY() + $h > $this->PageBreakTrigger)
                $this->AddPage($this->CurOrientation);
        }

        function NbLines($w, $txt) {
            $cw = &$this->CurrentFont['cw'];
            if ($w == 0)
                $w = $this->w - $this->rMargin - $this->x;
            $wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
            $s = str_replace("
", '', $txt);
            $nb = strlen($s);
            if ($nb > 0 && $s[$nb - 1] == "
")
                $nb--;
            $sep = -1;
            $i = 0;
            $j = 0;
            $l = 0;
            $nl = 1;
            while ($i < $nb) {
                $c = $s[$i];
                if ($c == '
') {
                    $i++;
                    $sep = -1;
                    $j = $i;
                    $l = 0;
                    $nl++;
                    continue;
                }
                if ($c == ' ')
                    $sep = $i;
                $l += $cw[$c];
                if ($l > $wmax) {
                    if ($sep == -1) {
                        if ($i == $j)
                            $i++;
                    } else
                        $i = $sep + 1;
                    $sep = -1;
                    $j = $i;
                    $l = 0;
                    $nl++;
                } else
                    $i++;
            }
            return $nl;
        }
    }

    $pdf = new PDF('L', 'mm', 'A4');
    $pdf->SetMargins(0, 10, 0); // Marges gauche/droite = 0
    $pdf->AddPage();
    $pdf->SetFont('Arial', 'B', 11);

    $headers = ['Date', 'Nom', 'Site', 'Service', 'Concerné', 'Nature', 'Anomalie', 'Observation', 'Critique'];
    $widths = [26, 26, 26, 26, 26, 26, 70, 26, 26];

    foreach ($headers as $i => $col) {
        $pdf->Cell($widths[$i], 10, utf8_decode($col), 1, 0, 'C');
    }
    $pdf->Ln();

    $pdf->SetFont('Arial', '', 9);
    foreach ($donnees as $row) {
        $ligneRouge = ($row['ligne_rouge'] == 1);
        $pdf->Row([
            $row['date_saisie'],
            $row['nom'],
            $row['site'],
            $row['service'],
            $row['service_concerne'],
            $row['nature'],
            $row['anomalie'],
            $row['observations'],
            $ligneRouge ? '⚠ Critique' : ''
        ], $ligneRouge, $widths);
    }

    $pdf->Output('I', 'export.pdf');
    exit;
}

?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="UTF-8">
  <title>Historique Anomalies HSE</title>
    <style>
@media (max-width: 768px) {
  /* Garder uniquement colonnes : 1 = Date, 3 = Site, 7 = Anomalie, 8 = Photo */
  td:not(:nth-child(1)):not(:nth-child(3)):not(:nth-child(7)):not(:nth-child(8)),
  th:not(:nth-child(1)):not(:nth-child(3)):not(:nth-child(7)):not(:nth-child(8)) {
    display: none;
  }

  /* Réduire taille de texte si besoin */
  table {
    font-size: 13px;
  }
}
</style>
<style>
@media (max-width: 768px) {
  .export-buttons {
    display: flex;
    flex-direction: column;
    gap: 10px;
    align-items: stretch;
  }

  .export-buttons button,
  .export-buttons a {
    width: 100%;
    font-size: 16px;
    padding: 10px;
  }
}
</style>



  <link href="css/bootstrap.min.css" rel="stylesheet">

<style>
table tbody tr.ligne-rose > td {
  background-color: #ffe6f0 !important;
}
</style>




<style>
.form-control-sm, .form-select-sm {
  padding: 0.15rem 0.25rem;
  font-size: 0.7rem;
}
label.form-label {
  font-size: 0.65rem;
  margin-bottom: 2px;
}
</style>


<style>
button.btn-sm, a.btn-sm {
  font-size: 0.7rem !important;
  padding: 0.2rem 0.5rem !important;
}
</style>

<style>
@media (max-width: 480px) {
  img {
    max-width: 100%;
    height: auto;
  }
}
</style>



</head>
<body class="bg-light">
<div class="container mt-4">
  
<div class="d-flex justify-content-between align-items-center mb-4">
  <div class="d-flex align-items-center">
    <img src="images/ocp.png" alt="Logo OCP" style="width: 40px; height: auto;">
<div class="ms-3" style="font-size: 0.75rem; line-height: 1.1; font-weight: 500; color: #333;">
  <div><strong>SBU MINING</strong></div>
  <div>Khouribga Integrated Platform</div>
  <div>Direction flux planification et performance</div>
  <div>Direction port Casa</div>
</div>
 </div>
<h1 class="fw-bold text-primary" style="text-align: center; font-size: 0.75rem; margin-bottom: 0.5rem;">
  📂 Historique des Anomalies HSE
</h1>


</div>


  <form class="row g-3 mb-4" method="get">
    
    
    
    <div class="col-md-2">
      <div class="row">
        <div class="col-6">
          <div class="">
      <label class="form-label">Date début</label>
      <input type="date" name="date_debut" value="<?php echo htmlspecialchars($debut); ?>" class="form-control form-control-sm">
    </div>
        </div>
        <div class="col-6">
          <div class="">
      <label class="form-label">Date fin</label>
      <input type="date" name="date_fin" value="<?php echo htmlspecialchars($fin); ?>" class="form-control form-control-sm">
    </div>
        </div>
      </div>
    </div>
    
	<div class="col-6 col-md-4">
  <label class="form-label">Service concerné</label>
  <select name="service_concerne" class="form-select form-select-sm">
       <option value="">-- Tous --</option>
      <?php
      $services = ['électrique', 'instrumentation', 'bande', 'mécanique', 'BDM', 'HSE', 'exploitation', 'autres'];
      foreach ($services as $s) {
        $selected = ($s === $service_concerne) ? 'selected' : '';
        echo "<option value='$s' $selected>" . ucfirst($s) . "</option>";
      }
      ?>
  </select>
</div>

 

    <div class="col-md-2">
      <div class="row">
        <div class="col-6">
          <div class="">
      <label class="form-label">Ligne rouge</label>
      <select name="ligne_rouge" class="form-select form-select-sm">
        <option value="">-- Toutes --</option>
        <option value="1" <?php if (isset($_GET['ligne_rouge']) && $_GET['ligne_rouge'] === '1') echo 'selected'; ?>>Oui</option>
        <option value="0" <?php if (isset($_GET['ligne_rouge']) && $_GET['ligne_rouge'] === '0') echo 'selected'; ?>>Non</option>
      </select>
    </div>
        </div>
        <div class="col-6">
          <div class="">
      <label class="form-label">Recherche</label>
      <input type="text" name="recherche" value="<?php echo htmlspecialchars($recherche); ?>" class="form-control form-control-sm" placeholder="Texte libre...">
    </div>
        </div>
      </div>
    </div>
    
<div class="d-flex justify-content-between align-items-center mb-3">
  <div>
    <button type="submit" class="btn btn-primary btn-sm">🔍 Filtrer</button>
  </div>
  <div class="d-flex gap-2">

<a href="historique.php?export=pdf" class="btn btn-success btn-sm">Export PDF</a>
<a href="historique.php?export=csv" class="btn btn-success btn-sm">Export CSV</a>

  </div>
  <div>
    <a href="formulaire.php" class="btn btn-secondary btn-sm">↩ Retour</a>
  </div>
</div>

</form>
    </div>


  <div class="table-responsive">
    <table class="table table-bordered table-sm table-striped">
      <thead class="table-light">
        <tr>
          <th>Date</th>
          <th>Nom</th>
          <th>Site</th>
          
          <th>Service</th>
          <th>Concerné</th>
          <th>Nature</th>
          <th>Anomalie</th>
          <th>Photo</th>
          <th>Critique</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($donnees as $row): ?>
  <?php $class = (!empty($row['ligne_rouge']) && $row['ligne_rouge'] == 1) ? 'ligne-rose' : ''; ?>
  <tr class="<?php echo $class; ?>">
            <td><?php echo $row['date_saisie']; ?></td>
            <td><?php echo $row['nom']; ?></td>
            <td><?php echo $row['site']; ?></td>
            <td><?php echo $row['service']; ?></td>
            <td><?php echo $row['service_concerne']; ?></td>
            <td><?php echo $row['nature']; ?></td>
            <td><?php echo $row['anomalie']; ?></td>
            <td>
              <?php if ($row['photo']): ?>
			  				
				<a href="affiche_photo.php?src=<?php echo urlencode($row['photo']); ?>" target="_blank">
                <img src="<?php echo $row['photo']; ?>" style="height:40px;">
                </a>		
				
              <?php endif; ?>
            </td>
            <td>
<?php if (!empty($row['ligne_rouge']) && $row['ligne_rouge'] == 1): ?>
  ❗ Critique
<?php endif; ?>
</td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>


<script>
  document.addEventListener("DOMContentLoaded", function() {
    const largeur = window.innerWidth;
    const hauteur = window.innerHeight;
    console.log("📱 Taille écran : " + largeur + " x " + hauteur);

    const info = document.createElement("div");
    info.style.position = "fixed";
    info.style.bottom = "5px";
    info.style.right = "5px";
    info.style.background = "#eee";
    info.style.padding = "4px 6px";
    info.style.fontSize = "10px";
    info.innerText = `📱 ${largeur} x ${hauteur}`;
    document.body.appendChild(info);
  });
</script>

</body>
</html>




