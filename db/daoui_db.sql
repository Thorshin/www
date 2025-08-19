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
-- Base de données :  `sidi_daoui_db`
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
(131, 'AIT HADOU MILOUD', 'utilisateur', 'Khouribga', '426', '123'),
(130, 'FAIZ', 'utilisateur', 'Khouribga', '426', '123'),
(129, 'BEN ELKARDADI ABDELALI', 'utilisateur', 'Khouribga', '426', '123'),
(128, 'LAGLITI JAWAD', 'utilisateur', 'Khouribga', '426', '123'),
(127, 'SAAIDI MAROUAN', 'utilisateur', 'Khouribga', '426', '123'),
(126, 'MANQORI SAID', 'utilisateur', 'Khouribga', '426', '123'),
(125, 'BATOULI', 'utilisateur', 'Khouribga', '426', '123'),
(124, 'MENIT HICHAM', 'utilisateur', 'Khouribga', '426', '123'),
(123, 'TEMMAR BADR EDDINE', 'utilisateur', 'Khouribga', '426', '123'),
(122, 'MOUSSAOUI RACHID', 'utilisateur', 'Khouribga', '426', '123'),
(121, 'TYAR ABDESSAMAD', 'utilisateur', 'Khouribga', '426', '123'),
(120, 'EL AMRAOUI AHMED', 'utilisateur', 'Khouribga', '426', '123'),
(119, 'RAQI Jawad', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(118, 'ACHLIH ABDELJAOUAD', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(117, 'JEBLI Abdessalam', 'utilisateur', 'Khouribga', 'ELECTRIQUE', '123'),
(116, 'FOUZIR Mustapha', 'utilisateur', 'Khouribga', 'INSTUMENTATION', '123'),
(115, 'BOUELGHELLAT Hicham', 'utilisateur', 'Khouribga', 'INSTUMENTATION', '123'),
(114, 'ASSOUGGANE Muastapha', 'utilisateur', 'Khouribga', 'INSTUMENTATION', '123'),
(113, 'ZNAIDI', 'utilisateur', 'Khouribga', 'manutention', '123'),
(112, 'AZAMI', 'utilisateur', 'Khouribga', 'manutention', '123'),
(111, 'NAOUI', 'utilisateur', 'Khouribga', 'manutention', '123'),
(110, 'KHARMOUD', 'utilisateur', 'Khouribga', 'laverie', '123'),
(109, 'KABAB', 'utilisateur', 'Khouribga', 'laverie', '123'),
(108, 'BOUGHAW', 'utilisateur', 'Khouribga', 'laverie', '123'),
(107, 'BOUKLATA Driss', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(106, 'HADIL Ahmed', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(105, 'LARHCHAOUI Hamid', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(104, 'BAKHAKH Abdellatif', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(103, 'KBOUYER Abdelmoula', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(102, 'EL YAAKOUBI Youssef', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(101, 'HASNAOUI Abdelghani', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(100, 'TAROUT Samir', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(99, 'BENLALOU Atif', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(98, 'ALLALI Rachid', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(97, 'ET-TIFAFI Redouane', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(96, 'ELMOUSTAFID Abdelillah', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(95, 'ZARADA Abdelhak', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(94, 'RACHYQ Driss', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(93, 'SABIRH Aziz', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(92, 'AZROUR Mohammed', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(91, 'EL ATAOUI Mounir', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(90, 'EL JOMARI Abdellah', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(89, 'MOUNCHAYANE Mustapha', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(88, 'AMALOU Hassan', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(87, 'QASMAOUI Salah', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(86, 'GAROUACHE Mhamed', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(85, 'BOUSMARA Hamid', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(84, 'ADDANI Mohammed', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(83, 'EL ACHCHACHI Nourddine', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(82, 'LAHSSINI Youssef', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(81, 'EL BOUAZZAOUI Mohammed', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(80, 'LEGMIRI Radouane', 'utilisateur', 'Khouribga', 'Laverie Daoui', '123'),
(132, 'EZIATI ABDELLAH', 'utilisateur', 'Khouribga', '426', '123'),
(133, 'EL RHAZZAY MOHAMMED', 'utilisateur', 'Khouribga', '426', '123'),
(134, 'BOUCETTA RACHID', 'utilisateur', 'Khouribga', '426', '123'),
(135, 'KADDACH YOUNESS', 'utilisateur', 'Khouribga', '426', '123'),
(136, 'BOUSDARINE AISSAM', 'utilisateur', 'Khouribga', '426', '123'),
(137, 'NAGRAOUI AZEDDINE', 'utilisateur', 'Khouribga', '426', '123'),
(138, 'AKCHOUCH MHAMMED', 'utilisateur', 'Khouribga', '426', '123'),
(139, 'SADIR SOUFYANE', 'utilisateur', 'Khouribga', '426', '123'),
(140, 'KARDOUDA ADIL', 'utilisateur', 'Khouribga', '426', '123'),
(141, 'EL MOUSSAOUI AZEDDINE', 'utilisateur', 'Khouribga', '426', '123'),
(142, 'ASMODI MOHAMMED', 'utilisateur', 'Khouribga', '426', '123'),
(143, 'GHORBAL JAMAL', 'utilisateur', 'Khouribga', '426', '123'),
(144, 'LOUADI DRISS', 'utilisateur', 'Khouribga', '426', '123'),
(145, 'FEKRI MOHAMMED', 'utilisateur', 'Khouribga', '426', '123'),
(146, 'ALOUANE RIDOUAN', 'utilisateur', 'Khouribga', '426', '123'),
(147, 'HAJJAJI ABDERAZAQ', 'utilisateur', 'Khouribga', '426', '123'),
(148, 'ICHI ELAID', 'utilisateur', 'Khouribga', '426', '123'),
(149, 'TOUMI YOUSSEF', 'utilisateur', 'Khouribga', '426', '123'),
(150, 'KAMAL', 'utilisateur', 'Khouribga', '426', '123'),
(151, 'GHETTARA ABDELGHANI', 'utilisateur', 'Khouribga', '426', '123'),
(152, 'EL ORBABI SAID', 'utilisateur', 'Khouribga', '426', '123'),
(153, 'ZEROUALI REDOUAN', 'utilisateur', 'Khouribga', '426', '123'),
(154, 'HAJJAJI MOHAMMED', 'utilisateur', 'Khouribga', '426', '123'),
(155, 'KOTMANI TARIQ', 'utilisateur', 'Khouribga', '426', '123'),
(156, 'OUGHILASS MBAREK', 'utilisateur', 'Khouribga', '426', '123'),
(157, 'GHANOUCHIM', 'utilisateur', 'Khouribga', '426', '123'),
(158, 'EL AZZOUZI ABDELILAH', 'utilisateur', 'Khouribga', '426', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
