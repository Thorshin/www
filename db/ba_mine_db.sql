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
-- Base de données :  `ba_mine_db`
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
(46, 'SABIRI HICHAM', 'utilisateur', 'Khouribga', 'BDM MINE', '123'),
(45, 'BENZAHRA ABDELKARIM', 'utilisateur', 'Khouribga', 'BDM MINE', '123'),
(44, 'BEKKAL EL HABIB', 'utilisateur', 'Khouribga', 'MACHINE', '123'),
(43, 'HAYANI MECHKOURI JIHAD', 'utilisateur', 'Khouribga', 'MACHINE', '123'),
(42, 'EL ALAOUI KAMAL', 'utilisateur', 'Khouribga', 'MECANIQUE', '123'),
(41, 'BOUHFAS CHARAF EDDINE', 'utilisateur', 'Khouribga', 'MECANIQUE', '123'),
(40, 'FARROUJ YOUSSEF', 'utilisateur', 'Khouribga', 'MECANIQUE', '123'),
(39, 'TAYAA HICHAM', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(38, 'SAJID HICHAM', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(37, 'ELFATEHY IKRAME', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(36, 'BOUSSETTA YOUSSEF', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(35, 'BENHASSOUN LAILA', 'admin', 'Khouribga', 'MAINTENANCE', '123'),
(34, 'ANTIFI YASSINE', 'utilisateur', 'Khouribga', 'MAINTENANCE', '123'),
(33, 'AMZIL Rachid', 'utilisateur', 'Khouribga', 'INSTALLATION FIXE', '123'),
(32, 'HAFDAOUI Abdelmouttalib', 'utilisateur', 'Khouribga', 'INSTALLATION FIXE', '123'),
(31, 'SAADAOUI ABDELGHANI', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123'),
(30, 'MAAROUF MOHAMED', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123'),
(29, 'NASSIRI TAHA', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123'),
(28, 'ABBOUD ABDELJALIL', 'utilisateur', 'Khouribga', 'EXPLOITATION', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
