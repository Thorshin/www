-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 15 Août 2025 à 09:41
-- Version du serveur :  5.7.14-log
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `beni_idir_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Role` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mot_de_passe` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `agents`
--

INSERT INTO `agents` (`id`, `nom`, `Role`, `site`, `service`, `mot_de_passe`) VALUES
(1, 'Radwa', '', 'beni idir', 'service1', '612'),
(2, 'Yahya', '', 'Beni idir', 'electrique', '123'),
(3, 'MAZZAL HAMID', 'admin', 'Khouribga', 'SECHAGE', '123'),
(4, 'RHAMATI EL BACHIR', 'admin', 'Khouribga', 'SECHAGE', '123'),
(5, 'TOUBAGHI HAKIM', 'admin', 'Khouribga', 'REGULATION', '123'),
(6, 'ECHAOUI HICHME', 'admin', 'Khouribga', 'REGULATION', '123'),
(7, 'BOUABIDI CHARAF', 'admin', 'Khouribga', 'AT MECANIQUE', '123'),
(8, 'HAYI MAROINE', 'admin', 'Khouribga', 'AT MECANIQUE', '123'),
(9, 'RHAMATI BACHIR', 'admin', 'Khouribga', 'PARC HUMIDE', '123'),
(10, 'AIT MOUHA MOHAMED', 'admin', 'Khouribga', 'PARC HUMIDE', '123'),
(11, 'NADDARI MOHAMED', 'admin', 'Khouribga', 'PARC HUMIDE', '123'),
(12, 'DEAI MOHAMED', 'admin', 'Khouribga', 'STATION SERVICE', '123'),
(13, 'ABIDI MOULAY HAFID', 'admin', 'Khouribga', 'STATION SERVICE', '123'),
(14, 'AMRAOUI YOUSSEF', 'admin', 'Khouribga', 'AT ELECTRIQUE', '123'),
(15, 'EL ARJ HICHAM', 'admin', 'Khouribga', 'AT ELECTRIQUE', '123'),
(16, 'RHAMATI EL BACHIR', 'admin', 'Khouribga', 'CHARGEMENT', '123'),
(17, 'SAHHA KARIM', 'admin', 'Khouribga', 'CHARGEMENT', '123'),
(18, 'EDDAHMI HAMID', 'admin', 'Khouribga', 'EQUIPE VOLENTE', '123'),
(19, 'EL MIMOUNI YOUSSEF', 'utilisateur', 'Khouribga', 'SECHAGE', '123'),
(20, 'OUAKRIME SOUFIANE', 'utilisateur', 'Khouribga', 'SECHAGE', '123'),
(21, 'AIT NASSER ALI', 'utilisateur', 'Khouribga', 'REGULATION', '123'),
(22, 'EL MOURABIT AMGHAR MOHAMED', 'utilisateur', 'Khouribga', 'REGULATION', '123'),
(23, 'ESSORDI MOHAMED', 'utilisateur', 'Khouribga', 'AT mécanique', '123'),
(24, 'SEDRAOUI KHALID', 'utilisateur', 'Khouribga', 'AT mécanique', '123'),
(25, 'KHALIL ABDERRAHMANE', 'utilisateur', 'Khouribga', 'Parc humide', '123'),
(26, 'BERKIOULI MOURAD', 'utilisateur', 'Khouribga', 'Parc humide', '123'),
(27, 'HAMMAL OMAR', 'utilisateur', 'Khouribga', 'STATION SERVICE', '123'),
(28, 'MANNANI FOUAD', 'utilisateur', 'Khouribga', 'ELECTRAUQUE', '123'),
(29, 'EL HADIME REDOUANE', 'utilisateur', 'Khouribga', 'ELECTRAUQUE', '123'),
(30, 'YASSIRI MAROUNE', 'utilisateur', 'Khouribga', 'CHARGEMENT', '123'),
(31, 'FASSERAOUI MOHAMED', 'utilisateur', 'Khouribga', 'CHARGEMENT', '123'),
(32, 'LAAGAL EL BELGHITI ALI', 'utilisateur', 'Khouribga', 'EDUIPE VOLENTE', '123');

-- --------------------------------------------------------

--
-- Structure de la table `saisie_travaux`
--

CREATE TABLE `saisie_travaux` (
  `id` int(11) NOT NULL,
  `date_saisie` datetime NOT NULL,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_concerne` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ligne_rouge` int(1) DEFAULT '0',
  `anomalie` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observations` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `saisie_travaux`
--

INSERT INTO `saisie_travaux` (`id`, `date_saisie`, `nom`, `site`, `service`, `service_concerne`, `nature`, `ligne_rouge`, `anomalie`, `photo`, `observations`) VALUES
(1, '2025-08-12 09:46:45', 'Nom1', 'site1', 'service1', 'électrique', 'Engins et équipements de levage', 0, 'AZE', 'uploads/1754992005.jpg', 'RAS'),
(2, '2025-08-12 09:50:27', 'Yahya', 'Beni idir', 'electrique', 'BDM', 'Génie civil et structure métallique', 0, 'Test', 'uploads/1754992227.jpg', 'RAS');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
