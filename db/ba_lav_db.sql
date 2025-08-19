-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 15 Août 2025 à 09:40
-- Version du serveur :  5.7.14-log
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ba_lav_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents`
--

CREATE TABLE `agents` (
  `id` int(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `Role` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `agents`
--

INSERT INTO `agents` (`id`, `nom`, `Role`, `site`, `service`, `mot_de_passe`) VALUES
(33, 'EL BOUSTANI NAOUFAL', 'utilisateur', 'Khouribga', 'INSTRUMENTATION', '123'),
(32, 'BELFARDI HOUDA', 'utilisateur', 'Khouribga', 'INSTRUMENTATION', '123'),
(31, 'HASNIOUI RACHID', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(30, 'ISLAHI YOUSSEF', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(29, 'LAMGHARI HASSAN', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(28, 'DIANI CHAFIK', 'utilisateur', 'Khouribga', 'MECANIQUE', '123'),
(27, 'KAIKAT FATIMAEZZAHRA', 'utilisateur', 'Khouribga', 'MECANIQUE', '123'),
(26, 'BENJEDDI HAMZA', 'utilisateur', 'Khouribga', 'MECANIQUE', '123'),
(25, 'MANTOURANE KHALID', 'utilisateur', 'Khouribga', 'MAINTENANCE', '123'),
(24, 'ELARICHE EL MUSTAFA', 'admin', 'Khouribga', 'EXPLOITATION', '123'),
(23, 'ESSOUIDI ADIL', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123'),
(22, 'ETTABTI SAFAA', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123'),
(21, 'ALLAM ANASS', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123'),
(20, 'CHAHID MOURAD', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123'),
(34, 'DAHHOU IMANE', 'utilisateur', 'Khouribga', 'BDM LAVERIE', '123'),
(35, 'BENELKERDADI ABDELHADI', 'utilisateur', 'Khouribga', 'BDM LAVERIE', '123'),
(36, 'MRIBAT JAOUAD', 'utilisateur', 'Khouribga', 'CM', '123'),
(37, 'KHARBOUT YOUSSEF', 'utilisateur', 'Khouribga', 'CM', '123'),
(38, 'MAROUZI JAOUAD', 'utilisateur', 'Khouribga', 'CM', '123'),
(39, 'HAZMI ASMAA', 'utilisateur', 'Khouribga', 'MP', '123'),
(40, 'BOUKHRAISSA IKRAM', 'utilisateur', 'Khouribga', 'MP', '123'),
(41, 'AAFANE BRAHIM', 'utilisateur', 'Khouribga', 'MP', '123'),
(42, 'JNIYEH ABDELILLAH', 'admin', 'Khouribga', 'HSE', '123'),
(43, 'KHATORY YASSINE', 'utilisateur', 'Khouribga', 'HSE-MINE', '123'),
(44, 'EL AMIRI SAMIR', 'utilisateur', 'Khouribga', 'HSE-LAVERIE', '123'),
(45, 'LAARACH YOUSSEF', 'utilisateur', 'Khouribga', 'HSE-MINE', '123'),
(46, 'CHMICHI MOHAMED', 'utilisateur', 'Khouribga', 'HSE-LAVERIE', '123');

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
