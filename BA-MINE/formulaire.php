<?php
session_start();
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
  header('Location: login.php');
  exit();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<style>
.ligne-critique-container {
  display: flex;
  width: 100%;
  gap: 8px;
  align-items: center;
}
.ligne-critique-container select {
  flex: 4;
}
.ligne-critique-container .ligne-rouge-wrapper {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 4px;
}
.ligne-rouge-wrapper input[type="checkbox"] {
  width: 24px;
  height: 24px;
  accent-color: yellow;
  cursor: pointer;
}
.indicateur-couleur {
  width: 90%;
  height: 6px;
  background-color: yellow;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}
</style>
<style>
.ligne-critique-container {
    display: flex;
    width: 100%;
    gap: 8px;
    align-items: center;
}
.ligne-critique-container select {
    flex: 4;
}
.ligne-rouge-wrapper {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.ligne-rouge-wrapper input[type="checkbox"] {
    width: 24px;
    height: 24px;
    accent-color: yellow;
    cursor: pointer;
}
.indicateur-couleur {
    width: 90%;
    height: 6px;
    background-color: yellow;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}
</style>
  <meta charset="UTF-8">
  <title>Relevé Anomalies HSE</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  
<!-- Icône -->
<link rel="icon" href="icon.png" type="image/png">
<link rel="apple-touch-icon" href="icon.png">

  <link rel="manifest" href="manifest.json">
  <meta name="theme-color" content="#006e2e">
  <link rel="icon" href="icon.png" type="image/png">
  <link rel="apple-touch-icon" href="icon.png">
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-capable" content="yes">



</head>
<body class="bg-light">

<div class="container mt-0 mb-3" style="max-width: 480px;">
  <div class="card border-danger shadow-sm">
    <div class="card-body p-2">

      <div class="d-flex align-items-center mb-2">
        <img src="images/ocp.png" alt="Logo OCP" style="width: 70px; height: auto;">
        <div class="ms-3" style="font-size: 0.7rem; line-height: 1.2;">
          <div>SBU MINING</div>
          <div>Khouribga Integrated Platform</div>
          <div>Direction flux planification et performance</div>
          <div>Direction port Casa</div>
        </div>
      </div>

      
<div class="d-flex justify-content-between align-items-center mb-2">
  <h5 class="mb-0 mx-auto text-success">Relevé d'Anomalies HSE</h5>
</div>
      <form action="submit.php" method="POST" enctype="multipart/form-data">

<div id="loadingSpinner" class="text-center my-3" style="display:none;">
  <div class="spinner-border text-primary" role="status"></div>
  <p class="mt-2">Envoi en cours...</p>
</div>


        <div class="mb-3">
          <label class="form-label" style="font-weight: bold; color: blue;">Photo</label>
          <input type="file" name="photo" accept="image/*" class="form-control" id="photoInput" style="display:none;">
          <div class="d-grid gap-2">
            <button type="button" class="btn btn-outline-primary" onclick="openCamera()">📷 Prendre une photo</button>
            <button type="button" class="btn btn-outline-secondary" onclick="openGallery()">🖼️ Choisir depuis la galerie</button>
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label">Anomalie / SD</label>
          <textarea name="travail" class="form-control" rows="1" required></textarea>
        </div>

        <div class="mb-3">
<!-- 🔁 À insérer à la place du champ <select name="nature"> actuel -->
<label for="nature"><b>Nature</b></label>
<div class="ligne-critique-container">
  <select name="nature" class="form-select" required>
    <option value="Fuite d'huile">Fuite d'huile</option>
    <option value="Engins et équipements de levage">Engins et équipements de levage</option>
    <option value="Equipements sous pression et compresseur">Equipements sous pression et compresseur</option>
    <option value="Equipements électrique & Eclairage">Equipements électrique & Eclairage</option>
    <option value="Equipements Mécanique">Equipements Mécanique</option>
    <option value="Equipements DCI">Equipements DCI</option>
    <option value="Organes de sécurité électrique">Organes de sécurité électrique</option>
    <option value="Caillebotis et moyen d’accès">Caillebotis et moyen d’accès</option>
    <option value="Génie civil et structure métallique">Génie civil et structure métallique</option>
    <option value="Moyen de protection mécanique">Moyen de protection mécanique</option>
    <option value="Fuite de produit">Fuite de produit</option>
    <option value="Housekeeping">Housekeeping</option>
    <option value="circulation">circulation</option>
    <option value="Autre">Autre</option>
  </select>

<div class="ligne-rouge-wrapper" style="display: flex; align-items: center; gap: 8px;">
  <label for="ligne_rouge" style="display: flex; align-items: center; gap: 6px; font-size: 10px; font-weight: bold;">
    <input type="checkbox" name="ligne_rouge" id="ligne_rouge"
           onchange="document.getElementById('barre_ligne_rouge').style.backgroundColor = this.checked ? 'red' : 'yellow';">
    Ligne Rouge
  </label>
  <div id="barre_ligne_rouge" class="indicateur-couleur" style="width: 30px; height: 10px; background-color: yellow;"></div>
</div>



</div>


        </div>

        <div class="mb-3">
          <label class="form-label">Installation</label>
          <input type="text" name="installation" class="form-control" placeholder="Installation" required>
        </div>

        

        <div class="mb-3">
          <label class="form-label" style="font-weight: bold; color: blue;">Service concerné</label>
          <select name="service_concerne" class="form-select" required>
            <option value="">-- Choisir --</option>
            <option value="Exploitation">Exploitation</option>
            <option value="INSTALLATION FIXE">INSTALLATION FIXE</option>
            <option value="mécanique">mécanique</option>
            <option value="électrique">électrique</option>
            <option value="Machine">Machine</option>
            <option value="BDM">BDM</option>
            <option value="Digue">Digue</option>
            <option value="CM">CM</option>
            <option value="HSE">HSE</option>
          </select>
        </div>


        <div class="d-grid">
          <button type="submit" class="btn btn-warning btn-lg">✅ Enregistrer</button>
        </div>
		<div id="loadingSpinner" style="display: none;" class="text-center mt-2">
  <div class="spinner-border text-primary" role="status">
    <span class="visually-hidden">Envoi en cours...</span>
  </div>
  <p class="mt-2">Envoi en cours...</p>
</div>

      </form>

<div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1rem;">
  <a href="logout.php" class="btn btn-outline-secondary btn-sm">⏹ Se déconnecter</a>
  <a href="changer_mot_de_passe.php" class="btn btn-outline-primary btn-sm" style="margin: 0 8px;">🔑 Changer mot de passe</a>
  <a href="historique.php" class="btn btn-outline-secondary btn-sm" title="Voir l'historique">📋Enregistrement</a>
</div>
     
    </div>
  </div>
</div>

<script>
function openCamera() {
  const input = document.getElementById('photoInput');
  input.removeAttribute('capture');
  input.setAttribute('capture', 'environment');
  input.click();
}

function openGallery() {
  const input = document.getElementById('photoInput');
  input.removeAttribute('capture');
  input.click();
}
</script>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('sw.js').then(() => {
    console.log('✅ Service worker actif');
  });
}
</script>
<script>
  const form = document.querySelector("form");
  const spinner = document.getElementById("loading-spinner");

  form.addEventListener("submit", function () {
    spinner.style.display = "block";  // Affiche le spinner
  });
</script>

<div id="loading-spinner" style="
    display: none;
    position: fixed;
    z-index: 9999;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    background-color: rgba(255,255,255,0.9);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.3);">
  ⏳ Envoi en cours...
</div>



<script>
document.querySelector('form').addEventListener('submit', function() {
  document.getElementById('loadingSpinner').style.display = 'block';
});
</script>

</body>
</html>
