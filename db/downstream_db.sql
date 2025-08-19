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
-- Base de données :  `downstream_db`
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
(94, 'BOUZAR Abdelkébir', 'utilisateur', 'Khouribga', 'HSE', '123'),
(93, 'MAKHLOUF Jihad', 'utilisateur', 'Khouribga', 'BDM', '123'),
(92, 'HAMDANI Adnane', 'utilisateur', 'Khouribga', 'EXP', '123'),
(91, 'LAGHOUISSA Abdellatif', 'utilisateur', 'Khouribga', 'EXP', '123'),
(90, 'BALLAOUI Tarik', 'utilisateur', 'Khouribga', 'EXP', '123'),
(89, 'HAJEB Abderahman', 'utilisateur', 'Khouribga', 'MEC', '123'),
(88, 'OTHMANI Fouad', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(87, 'EL ALAOUI Hodaifa', 'utilisateur', 'Khouribga', 'EXP', '123'),
(86, 'ZENOUAKI ADILE', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(85, 'RAHNAOUI Redouane', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(84, 'MASTOUR OMAR', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(83, 'IBNAS OTMANE', 'utilisateur', 'Khouribga', 'ELEC', '123'),
(82, 'MANDOUR MHAMED', 'utilisateur', 'Khouribga', 'BDM', '123'),
(81, 'YAZZO IMAD', 'admin', 'Khouribga', 'BDM', '123'),
(80, 'JANANE MOHAMMED', 'admin', 'Khouribga', 'BDM', '123'),
(79, 'EL HAMMADI', 'admin', 'Khouribga', 'ELEC', '123'),
(78, 'MAACHOUR', 'admin', 'Khouribga', 'ELEC', '123'),
(77, 'MJID RACHID', 'admin', 'Khouribga', 'MEC', '123'),
(76, 'MAAFER taoufik', 'utilisateur', 'Khouribga', 'MEC', '123'),
(75, 'FATHI REDOUANE', 'utilisateur', 'Khouribga', 'MEC', '123'),
(74, 'EL KENDAOUI RACHID', 'admin', 'Khouribga', 'MEC', '123'),
(73, 'ASSAOUY HICHAM', 'admin', 'Khouribga', 'MEC', '123'),
(72, 'AARAFA EL MAHDI', 'utilisateur', 'Khouribga', 'MEC', '123'),
(71, 'LAFOUI Najib', 'utilisateur', 'Khouribga', 'EXP', '123'),
(70, 'HMIMAS ABDEHAKIM', 'utilisateur', 'Khouribga', 'EXP', '123'),
(69, 'MOTTAKI Redouane', 'utilisateur', 'Khouribga', 'EXP', '123'),
(68, 'EDDIB RACHID', 'utilisateur', 'Khouribga', 'EXP', '123'),
(67, 'SERHANI SOUFIANE', 'admin', 'Khouribga', 'EXP', '123'),
(66, 'SAIFI ABDELALI', 'admin', 'Khouribga', 'EXP', '123'),
(65, 'ELABBASSIA AZZEDDINE', 'admin', 'Khouribga', 'EXP', '123'),
(64, 'EL FRIHI ABDERRAHIM', 'utilisateur', 'Khouribga', 'EXP', '123'),
(63, 'CHABLAOUI ABDELOUAHED', 'utilisateur', 'Khouribga', 'EXP', '123'),
(62, 'ZAROUAL Jillali', 'utilisateur', 'Khouribga', 'EXP', '123'),
(61, 'NADRAM ADIL', 'utilisateur', 'Khouribga', 'EXP', '123'),
(60, 'BETTIOUI Omar', 'utilisateur', 'Khouribga', 'EXP', '123'),
(59, 'BENJAMIA AZIZ', 'utilisateur', 'Khouribga', 'EXP', '123'),
(58, 'MOUSSAOUY Ahmed', 'utilisateur', 'Khouribga', 'EXP', '123'),
(57, 'HRAGUA SAID', 'admin', 'Khouribga', 'EXP', '123'),
(56, 'HAIDA HICHAM', 'admin', 'Khouribga', 'EXP', '123'),
(55, 'WAOUA FOUAD', 'admin', 'Khouribga', 'ELEC', '123'),
(54, 'EL HAJJOUJI MOHAMED', 'admin', 'Khouribga', 'HSE', '123'),
(53, 'NAOUM RACHID', 'admin', 'Khouribga', 'HSE', '123'),
(52, 'OUKKACHA MOHAMMED', 'admin', 'Khouribga', 'HSE', '123'),
(95, 'AMCHOUCHAD Sara', 'utilisateur', 'Khouribga', 'BDM', '123'),
(96, 'ELGRAIMY Houcine', 'utilisateur', 'Khouribga', 'MEC', '123'),
(97, 'CHENFTI Fouad', 'utilisateur', 'Khouribga', 'EXP', '123'),
(98, 'BERRAHAL Oumayma', 'utilisateur', 'Khouribga', 'EXP', '123'),
(99, 'AHMAMSI Maryame', 'utilisateur', 'Khouribga', 'MEC', '123'),
(100, 'KHECHAB Meryem', 'utilisateur', 'Khouribga', 'MEC', '123'),
(101, 'OUTKARDI Issam', 'utilisateur', 'Khouribga', 'EXP', '123'),
(102, 'MALYADI Akram', 'utilisateur', 'Khouribga', 'EXP', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
