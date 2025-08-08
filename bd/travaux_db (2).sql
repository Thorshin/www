-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 04 Juin 2025 à 16:56
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `travaux_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `service` varchar(50) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `agents`
--

INSERT INTO `agents` (`id`, `nom`, `service`, `mot_de_passe`) VALUES
(1, 'EL GHAZI', 'électrique', '123'),
(2, 'BERGHALOUT', 'mécanique', ''),
(3, 'BOUNACER', 'HSE', ''),
(4, 'ZYAD', 'instrumentation', ''),
(5, 'EL HAIMER', 'BANDE', '');

-- --------------------------------------------------------

--
-- Structure de la table `saisie_travaux`
--

CREATE TABLE `saisie_travaux` (
  `id` int(11) NOT NULL,
  `date_saisie` datetime NOT NULL,
  `poste` enum('P1','P2','P3','Normal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_concerne` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anomalie` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observations` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `saisie_travaux`
--

INSERT INTO `saisie_travaux` (`id`, `date_saisie`, `poste`, `nom`, `service`, `service_concerne`, `nature`, `anomalie`, `photo`, `observations`) VALUES
(21, '2025-06-04 12:34:21', 'P1', NULL, 'électrique', NULL, NULL, 'd', NULL, 'dd'),
(22, '2025-06-04 12:35:43', 'P1', NULL, 'électrique', NULL, NULL, 'f', 'uploads/1749040543_sign.JPG', 'sr'),
(23, '2025-06-04 13:34:13', 'P2', NULL, 'électrique', NULL, NULL, 'jjjjj', 'uploads/1749044053_ocp.png', 'hhh'),
(24, '2025-06-04 15:52:20', 'P1', '123', 'électrique', 'électrique', 'boite', 'boite electrique ouverte', 'uploads/1749052340_sign.JPG', 'ligne rouge'),
(25, '2025-06-04 15:53:32', 'Normal', '123', 'électrique', 'instrumentation', 'arret d urgence', 'arret d urgence non operationnel', 'uploads/1749052412_dscf1597_0.jpg', 'ligne '),
(26, '2025-06-04 16:26:15', 'P2', '123', 'électrique', 'instrumentation', 'boite', 'HHHH', 'uploads/1749054375_dscf1597_0.jpg', 'LLLL');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
