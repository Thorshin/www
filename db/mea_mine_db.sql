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
-- Base de données :  `mea_mine_db`
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
(3, 'AQID Youssef', 'utilisateur', 'Khouribga', 'N-2', '123'),
(4, 'BOUSAREHANE Ilyas', 'utilisateur', 'Khouribga', 'N-3', '123'),
(5, 'CHAHID Abderrahman', 'utilisateur', 'Khouribga', 'Dragline', '123'),
(6, 'DANI Yassine', 'utilisateur', 'Khouribga', 'Exploitation', '123'),
(7, 'ED-DINIAOUI Abderrahim', 'utilisateur', 'Khouribga', 'BDM', '123'),
(8, 'FARIS Moulay Brahim', 'utilisateur', 'Khouribga', 'Exploitation', '123'),
(9, 'HOUIRI Abdelilah', 'utilisateur', 'Khouribga', 'IF', '123'),
(10, 'IKHRICHI Aissam', 'utilisateur', 'Khouribga', 'N-3', '123'),
(11, 'MAOUD Mourad', 'utilisateur', 'Khouribga', 'Exploitation', '123'),
(12, 'RKIZAT MOHAMMED', 'utilisateur', 'Khouribga', 'Electrique', '123'),
(13, 'BAGHAD Ayyoub', 'utilisateur', 'Khouribga', 'Mécanique', '123'),
(14, 'BELKADY Ismail', 'utilisateur', 'Khouribga', 'Mécanique', '123'),
(15, 'AJJEMAI Hassan', 'utilisateur', 'Khouribga', 'Dragline', '123'),
(16, 'EL OUAFI Abdessamad', 'utilisateur', 'Khouribga', 'Dragline', '123'),
(17, 'KASRI Jaouad', 'utilisateur', 'Khouribga', 'Dragline', '123'),
(18, 'MOKRINI Jaouad', 'utilisateur', 'Khouribga', 'Exploitation', '123'),
(19, 'ECHCHAHLAOUY Hicham', 'utilisateur', 'Khouribga', 'Exploitation', '123'),
(20, 'ENNAIR Ahmed', 'utilisateur', 'Khouribga', 'Exploitation', '123'),
(21, 'EL BOUZIDI Abdeladim', 'utilisateur', 'Khouribga', 'BDM', '123'),
(22, 'NASIR Khalid', 'utilisateur', 'Khouribga', 'BDM', '123'),
(23, 'CHAOUI Ismail', 'utilisateur', 'Khouribga', 'IF', '123'),
(24, 'HASHAS Massir', 'utilisateur', 'Khouribga', 'IF', '123'),
(25, 'KENOUANE', 'utilisateur', 'Khouribga', 'IF', '123'),
(26, 'EJJEBLI Mohamed', 'utilisateur', 'Khouribga', 'Mécanique', '123'),
(27, 'MASRAF Mohamed', 'utilisateur', 'Khouribga', 'Mécanique', '123'),
(28, 'EL MAZOURI Abderrahim', 'utilisateur', 'Khouribga', 'Electrique', '123'),
(29, 'NEDDAH Mohamed', 'utilisateur', 'Khouribga', 'Electrique', '123'),
(30, 'LAGHRIB Youness', 'utilisateur', 'Khouribga', 'Electrique', '123'),
(31, 'IFKIRNE Mourad', 'utilisateur', 'Khouribga', 'HSE', '123'),
(32, 'ALAEDDINE Younes', 'utilisateur', 'Khouribga', 'HSE', '123'),
(33, 'KARIM Otman', 'utilisateur', 'Khouribga', 'HSE', '123'),
(34, 'QANI abderrazak', 'utilisateur', 'Khouribga', 'HSE', '123'),
(35, 'BESSI Zakaria', 'utilisateur', 'Khouribga', 'HSE', '123'),
(36, 'JADANI smail', 'utilisateur', 'Khouribga', 'HSE', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
