-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 15 Août 2025 à 09:42
-- Version du serveur :  5.7.14-log
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mea_lav_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
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
(1, 'MHADER Mohamed', 'admin', 'Khouribga', 'HSE', '123'),
(2, 'OUAHMANE Youness', 'admin', 'Khouribga', 'HSE', '123'),
(3, 'QODSI Samir', 'admin', 'Khouribga', '', '123'),
(4, 'QACIMI Diyae', 'admin', 'Khouribga', '', '123'),
(5, 'LEMRABET HICHAM', 'utilisateur', 'Khouribga', 'MEC', '123'),
(6, 'ALOUANI MOUAAD', 'utilisateur', 'Khouribga', 'INST', '123'),
(7, 'ELMOUDDEN Mohammed', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(8, 'SAMARI Abdeljalil', 'utilisateur', 'Khouribga', 'REG', '123'),
(9, 'FOUAD Hamza', 'utilisateur', 'Khouribga', 'EXPOILATATION', '123'),
(10, 'BOUGARN Fatima zahra', 'utilisateur', 'Khouribga', 'EXPOILATATION', '123'),
(11, 'MAZOUZI Abderrazak', 'utilisateur', 'Khouribga', 'MEC', '123'),
(12, 'BENGUAGUA AYA', 'utilisateur', 'Khouribga', 'EXPOILATATION', '123'),
(13, 'MORJANI Khawla', 'utilisateur', 'Khouribga', 'EXPOILATATION', '123'),
(14, 'EL ARFAOUI Nouri', 'utilisateur', 'Khouribga', 'BDM', '123'),
(15, 'NAHIRI Salma', 'utilisateur', 'Khouribga', 'BDM', '123'),
(16, 'MOUNSSI Youness', 'utilisateur', 'Khouribga', 'EXPOILATATION', '123'),
(17, 'GUENNANI Yassine', 'utilisateur', 'Khouribga', 'MEC', '123'),
(18, 'ERRAIMACH Nabil', 'utilisateur', 'Khouribga', 'INST', '123'),
(19, 'NOUSSI Mouncef', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(20, 'NACIRI Abderrahmane', 'utilisateur', 'Khouribga', 'REG', '123'),
(21, 'HARIT Abdelouafi', 'utilisateur', 'Khouribga', 'MEC', '123'),
(22, 'FADILI Youness', 'utilisateur', 'Khouribga', 'EXPOILATATION', '123'),
(23, 'EL ASSOULI Younes', 'utilisateur', 'Khouribga', 'EXPOILATATION', '123'),
(24, 'HAOUA Mohamed', 'utilisateur', 'Khouribga', 'BDM', '123'),
(25, 'BOUKAYOUA Abderrahim', 'utilisateur', 'Khouribga', 'EXPOILATATION', '123'),
(26, 'JAFOUR Dris', 'utilisateur', 'Khouribga', 'HSE', '123'),
(27, 'BOUKHARSA Said', 'utilisateur', 'Khouribga', 'HSE', '123'),
(28, 'EL ASSOULI Youness', 'utilisateur', 'Khouribga', 'HSE', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
