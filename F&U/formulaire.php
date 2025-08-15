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
    <option value="Sol glissant, huileux, ou humide">Sol glissant, huileux, ou humide</option>
    <option value="Encombrement des zones de passage et des postes de travail">Encombrement des zones de passage et des postes de travail</option>
    <option value="Éclairage insuffisant ou éblouissant">Éclairage insuffisant ou éblouissant</option>
    <option value="Zone de circulation piétons/engins non délimitée ou non respectée">Zone de circulation piétons/engins non délimitée ou non respectée</option>
    <option value="Absence ou non-conformité de protection collective (garde-corps, etc.)">Absence ou non-conformité de protection collective (garde-corps, etc.)</option>
    <option value="Échafaudage non conforme ou non réceptionné">Échafaudage non conforme ou non réceptionné</option>
    <option value="Utilisation d'un moyen d'accès inadapté">Utilisation d'un moyen d'accès inadapté</option>
    <option value="Plateforme de travail (PEMP/Nacelle) défectueuse ou utilisée sans autorisation">Plateforme de travail (PEMP/Nacelle) défectueuse ou utilisée sans autorisation</option>
    <option value="Port du harnais non assuré ou point d'ancrage non conforme">Port du harnais non assuré ou point d'ancrage non conforme</option>
    <option value="Protecteur ou dispositif de sécurité de machine manquant, shunté ou défectueux">Protecteur ou dispositif de sécurité de machine manquant, shunté ou défectueux</option>
    <option value="Machine ou équipement en mauvais état (fuites, bruits anormaux)">Machine ou équipement en mauvais état (fuites, bruits anormaux)</option>
    <option value="Outil à main défectueux ou inadapté à la tâche">Outil à main défectueux ou inadapté à la tâche</option>
    <option value="Absence de système d'arrêt d'urgence ou inaccessible">Absence de système d'arrêt d'urgence ou inaccessible</option>
    <option value="Câble électrique dénudé, endommagé ou immergé">Câble électrique dénudé, endommagé ou immergé</option>
    <option value="Armoire ou boîtier électrique ouvert ou non condamné">Armoire ou boîtier électrique ouvert ou non condamné</option>
    <option value="Rallonge "bricolée" ou utilisation de multiprises en cascade">Rallonge "bricolée" ou utilisation de multiprises en cascade</option>
    <option value="Absence de mise à la terre">Absence de mise à la terre</option>
    <option value="Non-respect des distances de sécurité avec les lignes électriques">Non-respect des distances de sécurité avec les lignes électriques</option>
    <option value="Appareil ou accessoire de levage (élingue, manille) défectueux ou non vérifié">Appareil ou accessoire de levage (élingue, manille) défectueux ou non vérifié</option>
    <option value="Surcharge d'un équipement de levage ou de stockage">Surcharge d'un équipement de levage ou de stockage</option>
    <option value="Mauvais élingage d'une charge">Mauvais élingage d'une charge</option>
    <option value="Zone de balancement de la charge non sécurisée">Zone de balancement de la charge non sécurisée</option>
    <option value="Non-port des Équipements de Protection Individuelle (EPI) obligatoires">Non-port des Équipements de Protection Individuelle (EPI) obligatoires</option>
    <option value="Utilisation d'un téléphone en conduisant un engin ou en travaillant">Utilisation d'un téléphone en conduisant un engin ou en travaillant</option>
    <option value="Source d'ignition (point chaud, flamme, étincelle) en zone à risque">Source d'ignition (point chaud, flamme, étincelle) en zone à risque</option>
    <option value="Stockage de produits inflammables non conforme">Stockage de produits inflammables non conforme</option>
    <option value="Extincteur ou RIA (Robinet d'Incendie Armé) non accessible, non signalé ou périmé">Extincteur ou RIA (Robinet d'Incendie Armé) non accessible, non signalé ou périmé</option>
    <option value="Matériel non conforme pour une utilisation en zone ATEX">Matériel non conforme pour une utilisation en zone ATEX</option>
    <option value="Accumulation de poussières combustibles">Accumulation de poussières combustibles</option>
    <option value="Produit chimique sans étiquette ou avec étiquetage illisible">Produit chimique sans étiquette ou avec étiquetage illisible</option>
    <option value="Absence de Fiche de Données de Sécurité (FDS) à proximité">Absence de Fiche de Données de Sécurité (FDS) à proximité</option>
    <option value="Fuite ou déversement de produit chimique">Fuite ou déversement de produit chimique</option>
    <option value="Stockage incompatible de produits chimiques">Stockage incompatible de produits chimiques</option>
    <option value="Manutention manuelle de charges lourdes avec mauvaise posture">Manutention manuelle de charges lourdes avec mauvaise posture</option>
    <option value="Niveau de bruit excessif sans protection auditive">Niveau de bruit excessif sans protection auditive</option>
    <option value="Exposition à des vibrations (outils, véhicules)">Exposition à des vibrations (outils, véhicules)</option>
    <option value="Ambiance thermique extrême (trop chaud / trop froid)">Ambiance thermique extrême (trop chaud / trop froid)</option>
    <option value="Isolement d'un travailleur sans moyen d'alerte">Isolement d'un travailleur sans moyen d'alerte</option>
    <option value="Installations sanitaires (toilettes, douches) sales ou défectueuses">Installations sanitaires (toilettes, douches) sales ou défectueuses</option>
    <option value="Présence de nuisibles (rongeurs, insectes)">Présence de nuisibles (rongeurs, insectes)</option>
    <option value="Non-respect du tri sélectif des déchets">Non-respect du tri sélectif des déchets</option>
    <option value="Benne ou conteneur à déchets qui déborde">Benne ou conteneur à déchets qui déborde</option>
    <option value="Stockage des déchets dangereux non conforme (à l'air libre, sans rétention)">Stockage des déchets dangereux non conforme (à l'air libre, sans rétention)</option>
    <option value="Absence d'identification des contenants de déchets">Absence d'identification des contenants de déchets</option>
    <option value="Absence ou défaut d'un bac de rétention sous un produit polluant">Absence ou défaut d'un bac de rétention sous un produit polluant</option>
    <option value="Fuite d'huile ou d'hydrocarbures (sur véhicule, machine, transformateur)">Fuite d'huile ou d'hydrocarbures (sur véhicule, machine, transformateur)</option>
    <option value="Fuite d'eau">Fuite d'eau</option>
    <option value="Éclairage ou équipement laissé en marche inutilement">Éclairage ou équipement laissé en marche inutilement</option>
    <option value="Émission de bruit dépassant les limites réglementaires">Émission de bruit dépassant les limites réglementaires</option>
    <option value="Dégagement d'odeurs">Dégagement d'odeurs</option>
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
            <option value="HSEE">HSEE</option>
            <option value="Génie Civil">Génie Civil</option>
            <option value="Atelier centraux">Atelier centraux</option>
            <option value="GARAGE">GARAGE</option>
            <option value="Laboratoires d'Analyses">Laboratoires d'Analyses</option>
            <option value="Maintenance S/E Hydraulique">Maintenance S/E Hydraulique</option>
            <option value="Maintenance Moteur Thermique">Maintenance Moteur Thermique</option>
            <option value="S/E Electriques & Bobinages">S/E Electriques & Bobinages</option>
            <option value="S/E Traitement R6">S/E Traitement R6</option>
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
