-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 15 Août 2025 à 11:30
-- Version du serveur :  5.7.14-log
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pipe_jf_db`
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
(1, 'MAKHTOUT MUSTAPHA', 'utilisateur', 'Khouribga', 'HEAD PIPELINE JF', '123'),
(2, 'EL HALOUI Hajar', 'admin', 'Khouribga', 'EXP/HSE', '123'),
(3, 'CHARJAOUI Mohammed', 'utilisateur', 'Khouribga', 'MEC/BDM', '123'),
(4, 'LEMTOUKI Sara', 'utilisateur', 'Khouribga', 'ELEC/INSTRUM', '123'),
(5, 'SIARI KHALIL', 'admin ', 'Khouribga', 'HSE', '123'),
(6, 'KACHACH TARIK', ' admin', 'Khouribga', 'HSE', '123'),
(7, 'FRAIHI BOUCHAIB', 'utilisateur', 'Khouribga', 'EXP', '123'),
(8, 'EL KHBIZI ABDESSAMAD', 'utilisateur', 'Khouribga', 'EXP', '123'),
(9, 'GADIR ABDELILAH', 'utilisateur', 'Khouribga', 'EXP', '123'),
(10, 'KHARBOUCH MOURAD', 'utilisateur', 'Khouribga', 'EXP', '123'),
(11, 'NAFIZI MOHAMMED', 'utilisateur', 'Khouribga', 'EXP', '123'),
(12, 'CHABA ISMAIL', 'utilisateur', 'Khouribga', 'EXP', '123'),
(13, 'FENNANE IMAD', 'utilisateur', 'Khouribga', 'EXP', '123'),
(14, 'OUADOUD KAMAL', 'utilisateur', 'Khouribga', 'EXP', '123'),
(15, 'JAADI IMAD', 'utilisateur', 'Khouribga', 'EXP', '123'),
(16, 'DAIF ZOUHIR', 'utilisateur', 'Khouribga', 'EXP', '123'),
(17, 'TAIMA MOURAD', 'utilisateur', 'Khouribga', 'EXP', '123'),
(18, 'BARKA ABDELOUAHED', 'utilisateur', 'Khouribga', 'EXP', '123'),
(19, 'BELGHAIB ABDELLAH', 'utilisateur', 'Khouribga', 'EXP', '123'),
(20, 'EL HILALI ABDELAZIZ', 'utilisateur', 'Khouribga', 'EXP', '123'),
(21, 'EL FRAME ADIL', 'utilisateur', 'Khouribga', 'EXP', '123'),
(22, 'JABIRI MOHAMMED', 'utilisateur', 'Khouribga', 'EXP', '123'),
(23, 'ROUMLI ISMAIL', 'utilisateur', 'Khouribga', 'EXP', '123'),
(24, 'ZAANAN YOUSSEF', 'utilisateur', 'Khouribga', 'EXP', '123'),
(25, 'BENMOUIDA ABDERRAHIM', 'utilisateur', 'Khouribga', 'EXP', '123'),
(26, 'TAMIMI CHOUAIB', 'utilisateur', 'Khouribga', 'EXP', '123'),
(27, 'ZINABIDIN BADREDDINE', 'utilisateur', 'Khouribga', 'EXP', '123'),
(28, 'BENHADOU SOUFIAN', 'utilisateur', 'Khouribga', 'EXP', '123'),
(29, 'BOUNANI Ibrahim', 'utilisateur', 'Khouribga', 'EXP', '123'),
(30, 'RAFIKI NOURDINE', 'utilisateur', 'Khouribga', 'MEC', '123'),
(31, 'HAJJI YASSINE', 'utilisateur', 'Khouribga', 'MEC', '123'),
(32, 'KABLY ADIL', 'utilisateur', 'Khouribga', 'MEC', '123'),
(33, 'AS-SALOUANY EL KAMEL', 'utilisateur', 'Khouribga', 'MEC', '123'),
(34, 'TABIT EL ARBI', 'utilisateur', 'Khouribga', 'MEC', '123'),
(35, 'AZZAM ZAKARIYA', 'utilisateur', 'Khouribga', 'MEC', '123'),
(36, 'HEJAJI ADIL', 'utilisateur', 'Khouribga', 'MEC', '123'),
(37, 'MACHKOUR ELKHALIFA', 'utilisateur', 'Khouribga', 'INSTRUM', '123'),
(38, 'TAMA ABDELMJID', 'utilisateur', 'Khouribga', 'INSTRUM', '123'),
(39, 'ELGOUBI ABDELGHANI', 'utilisateur', 'Khouribga', 'INSTRUM', '123'),
(40, 'BOUASRA YASSINE', 'utilisateur', 'Khouribga', 'INSTRUM', '123'),
(41, 'ELHARDI MOHSSINE', 'utilisateur', 'Khouribga', 'INSTRUM', '123'),
(42, 'NEJJAI MAROUANE', 'utilisateur', 'Khouribga', 'INSTRUM', '123'),
(43, 'BOULLAIL HICHAM', 'utilisateur', 'Khouribga', 'INSTRUM', '123'),
(44, 'MESBAH OMAR', 'utilisateur', 'Khouribga', 'INSTRUM', '123'),
(45, 'ERRAKIK KHALIL', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(46, 'LAHLOU Mohamed', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(47, 'KHOUBANE SALAH', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(48, 'BOURHELLA ADIL', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(49, 'HASBI ZAKARIYA', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(50, 'MAHBOUB Yassine', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(51, 'MEDERKI YOUSSEF', 'utilisateur', 'Khouribga', 'BDM', '123'),
(52, 'ZEGOUDI NAOUAL', 'utilisateur', 'Khouribga', 'MAG/CM', '123'),
(53, 'MOUSSAOUI MOHAMED', 'utilisateur', 'Khouribga', 'APPRO', '123'),
(54, 'MOHSINE YOUNESS', 'utilisateur', 'Khouribga', 'APPRO', '123'),
(55, 'BOUHAMDI SAID', 'utilisateur', 'Khouribga', 'BDM', '123'),
(56, 'BELHRECH AZIZ', 'utilisateur', 'Khouribga', 'MAG/CM', '123'),
(57, 'MOUTTARAZOUK AMINE', 'utilisateur', 'Khouribga', 'BDM', '123'),
(58, 'RAHMANI NOUREDDINE', 'utilisateur', 'Khouribga', 'BDM', '123'),
(59, 'LAMGALESS JAMAL', 'utilisateur', 'Khouribga', 'BDM', '123'),
(60, 'RAKIQ Hicham', 'utilisateur', 'Khouribga', 'BDM', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
