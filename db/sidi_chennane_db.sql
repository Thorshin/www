-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 15 Août 2025 à 09:44
-- Version du serveur :  5.7.14-log
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sidi_chennane_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Role` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mot_de_passe` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `agents`
--

INSERT INTO `agents` (`id`, `nom`, `Role`, `site`, `service`, `mot_de_passe`) VALUES
(1, 'HARFI Imane', 'admin', 'Khouribga', 'EXPLOITATION', '123'),
(2, 'HAFDOUNE Hassane', 'admin', 'Khouribga', 'INSTALLATION T1-T2', '123'),
(3, 'BENOMAR HICHAM', 'admin', 'Khouribga', 'AT MECANIQUE', '123'),
(4, 'FAHLI NAJIB', 'admin', 'Khouribga', 'AT MECANIQUE', '123'),
(5, 'SAHIR Mohammed Adnane', 'admin', 'Khouribga', 'AT ELECTRIQUE', '123'),
(6, 'BELLAR Abderrahim', 'admin', 'Khouribga', 'AT ELECTRIQUE', '123'),
(7, 'EL BARAKA YASSINE', 'admin', 'Khouribga', 'AT DRAGLINE', '123'),
(8, 'LACHGUER SAID', 'admin', 'Khouribga', 'AT DRAGLINE', '123'),
(9, 'Mohammed JIYA', 'utilisateur', 'Khouribga', 'INSTALLATION T2', '123'),
(10, 'MAKROUD Mohammed', 'utilisateur', 'Khouribga', 'INSTALLATION T2', '123'),
(11, 'Youness KOTARI', 'utilisateur', 'Khouribga', 'INSTALLATION T2', '123'),
(12, 'BOUHALI SAAD', 'utilisateur', 'Khouribga', 'INSTALLATION T1', '123'),
(13, 'EL AMRAOUI Youssef', 'utilisateur', 'Khouribga', 'INSTALLATION T1', '123'),
(14, 'IMANI Nour Eddine', 'utilisateur', 'Khouribga', 'INSTALLATION T1', '123'),
(15, 'TAOUFIQI ADIL', 'utilisateur', 'Khouribga', 'AT MECANIQUE', '123'),
(16, 'BEGGAR ABDELGHANI', 'utilisateur', 'Khouribga', 'AT MECANIQUE', '123'),
(17, 'ROUDANE MUSTAPHA', 'utilisateur', 'Khouribga', 'AT MECANIQUE', '123'),
(18, 'MOUTIME Ahmed', 'utilisateur', 'Khouribga', 'AT MECANIQUE', '123'),
(19, 'BOURAS EL MEHDI', 'utilisateur', 'Khouribga', 'AT ELECTRIQUE', '123'),
(20, 'LAHLOU Mohamed El Mokhtar', 'utilisateur', 'Khouribga', 'AT ELECTRIQUE', '123'),
(21, 'KARKOURI Abdellah', 'utilisateur', 'Khouribga', 'AT ELECTRIQUE', '123'),
(22, 'OUSHAK MOHAMED', 'utilisateur', 'Khouribga', 'AT ELECTRIQUE', '123'),
(23, 'ZIDANI SAID', 'utilisateur', 'Khouribga', 'AT ELECTRIQUE', '123'),
(24, 'TRAIBI El Mostafa', 'utilisateur', 'Khouribga', 'AT DRAGLINE', '123'),
(25, 'OULDDAOUIA El Mahdi', 'utilisateur', 'Khouribga', 'AT DRAGLINE', '123'),
(26, 'OUALLA Iliass', 'utilisateur', 'Khouribga', 'AT DRAGLINE', '123'),
(27, 'SELLOUM MOHAMED', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
