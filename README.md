# Plateforme de Signalement d'Anomalies HSE - OCP

## Description du Projet

Cette application web mobile est conçue pour le signalement et la gestion des anomalies HSE (Hygiène, Sécurité, Environnement) au sein des différentes entités de l'OCP (Office Chérifien des Phosphates). Elle permet aux agents de terrain de signaler rapidement des anomalies observées sur leurs sites de travail.

## Captures d'Écran

### 1. Page de Sélection d'Entité
![Page de Garde](/captures/photo1.png)
*Interface principale permettant de choisir l'entité de travail parmi les différentes installations OCP*

### 2. Sélection de Sous-Entité (Pipe - Headstation)
![Sélection Pipe Headstation](/captures/photo2.png)
*Sélection de la sous-entité "Headstation" après avoir choisi l'entité "Pipe"*

### 3. Page de Connexion
![Page de Connexion](/captures/photo3.png)
*Interface d'authentification pour accéder au système de signalement*

### 4. Formulaire de Signalement d'Anomalie
![Formulaire d'Anomalie](/captures/photo4.png)
*Formulaire complet pour saisir les détails d'une anomalie HSE observée*

### 5. Historique des Anomalies
![Historique des Anomalies](/captures/photo5.png)
*Vue d'ensemble des anomalies enregistrées avec possibilité de filtrage et d'export*

### 6. Structure de la Base de Données
![Structure Base de Données](/captures/photo6.png)
*Schéma de la base de données MySQL dans phpMyAdmin montrant les tables et relations*

## Fonctionnalités Principales

### 🏢 Gestion Multi-Entités
- **Port Casa** : Port de Casablanca
- **Sidi Chennane** : Site minier
- **Beni Idir** : Site minier
- **Daoui** : Site minier
- **Downstream** : Site de traitement
- **Pipeline** : Infrastructure de transport (Headstation et JF)
- **Merah** : Site minier (MINE et LAV)
- **BA** : Site minier (MINE et LAV)
- **F&U** : Formation et Utilisation

### 📱 Interface Mobile Optimisée
- Design responsive adapté aux smartphones
- Navigation intuitive par cartes d'entités
- Sélection de sous-entités avec overlays
- Interface tactile optimisée

### 📝 Formulaire de Signalement
- **Champs obligatoires** :
  - Date et heure de saisie
  - Nom de l'agent
  - Site et service
  - Nature de l'anomalie
  - Description détaillée
  - Installation concernée
  - Service concerné
  - Observations complémentaires

### 🔍 Gestion des Données
- Base de données MySQL/MariaDB
- Historique des anomalies signalées
- Export PDF et CSV
- Filtres par date, service, nature
- Recherche et tri des données

### 🔐 Système d'Authentification
- Connexion sécurisée par nom/mot de passe
- Sessions utilisateur
- Gestion des droits d'accès
- Changement de mot de passe

## Architecture Technique

### Frontend
- **HTML5** : Structure sémantique
- **CSS3** : Styles responsifs avec Flexbox et Grid
- **JavaScript** : Interactions dynamiques et routage
- **Bootstrap** : Composants UI pré-stylés

### Backend
- **PHP** : Scripts côté serveur
- **PDO** : Accès sécurisé à la base de données
- **Sessions** : Gestion de l'état utilisateur
- **Upload de fichiers** : Gestion des photos

### Base de Données
- **MySQL/MariaDB** : SGBD relationnel
- **Tables principales** :
  - `agents` : Informations des utilisateurs
  - `saisie_travaux` : Anomalies signalées

### Sécurité
- Validation des entrées utilisateur
- Protection contre les injections SQL
- Gestion sécurisée des sessions
- Échappement des données affichées

## Structure des Dossiers

```
/
├── PageGarde.html          # Page de sélection d'entité
├── index.php               # Point d'entrée (redirection)
├── images/                 # Images des entités
├── Port/                   # Application Port Casa
├── Sidi chennane/          # Application Sidi Chennane
├── Beni idir/              # Application Beni Idir
├── Daoui/                  # Application Daoui
├── Downstream/             # Application Downstream
├── Pipeline/               # Application Pipeline (Headstation)
├── Pipe JF/                # Application Pipe JF
├── MEA-MINE/               # Application Merah Mine
├── MEA-LAV/                # Application Merah Lavage
├── BA-MINE/                # Application BA Mine
├── BA-LAV/                 # Application BA Lavage
└── F&U/                    # Application Formation & Utilisation
```

Chaque dossier d'entité contient :
- `login.php` : Page de connexion
- `formulaire.php` : Formulaire de signalement
- `submit.php` : Traitement des soumissions
- `historique.php` : Consultation des données
- `logout.php` : Déconnexion
- `changer_mot_de_passe.php` : Changement de mot de passe

## Installation et Configuration

### Prérequis
- Serveur web (Apache/Nginx)
- PHP 7.4+
- MySQL/MariaDB 5.7+
- WAMP/XAMPP (Windows) ou équivalent

### Configuration de la Base de Données
1. Créer les bases de données pour chaque entité :
   - `casa_port_db` pour Port Casa
   - `beni_idir_db` pour Beni Idir
   - `sidi_chennane_db` pour Sidi Chennane
   - `pipeline_db` pour Pipeline
   - etc.

2. Importer la structure des tables :
   ```sql
   CREATE TABLE agents (
       id INT AUTO_INCREMENT PRIMARY KEY,
       nom VARCHAR(100) NOT NULL,
       mot_de_passe VARCHAR(255) NOT NULL,
       service VARCHAR(100),
       site VARCHAR(100)
   );

   CREATE TABLE saisie_travaux (
       id INT AUTO_INCREMENT PRIMARY KEY,
       date_saisie DATETIME,
       nom VARCHAR(100),
       site VARCHAR(100),
       service VARCHAR(100),
       service_concerne VARCHAR(100),
       nature VARCHAR(255),
       ligne_rouge VARCHAR(10),
       anomalie TEXT,
       photo VARCHAR(255),
       observations TEXT
   );
   ```

### Déploiement
1. Copier les fichiers dans le répertoire web
2. Configurer les connexions de base de données dans chaque dossier
3. Créer le dossier `uploads/` avec permissions d'écriture
4. Tester l'accès à l'application

## Utilisation

### Pour les Agents
1. Accéder à la page d'accueil
2. Sélectionner son entité de travail
3. Se connecter avec ses identifiants
4. Remplir le formulaire d'anomalie
5. Capturer une photo si nécessaire
6. Soumettre le signalement

### Pour les Superviseurs
1. Consulter l'historique des anomalies
2. Filtrer par critères (date, service, nature)
3. Exporter les données (PDF/CSV)
4. Suivre l'évolution des signalements

## Maintenance

### Sauvegarde
- Sauvegarder régulièrement les bases de données
- Conserver les photos uploadées
- Maintenir les logs d'erreur

### Mises à Jour
- Vérifier la compatibilité PHP/MySQL
- Tester les nouvelles fonctionnalités
- Maintenir la sécurité des composants

## Support et Contact

Pour toute question ou assistance technique, contacter l'équipe IT de l'OCP.

---

**Version** : 1.0  
**Dernière mise à jour** : 2025  
**Développé pour** : OCP - SBU MINING  
**Plateforme** : Web Mobile Responsive
