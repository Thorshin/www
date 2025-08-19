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
-- Base de données :  `f&u_db`
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
(1, 'AMRAUNE Salim', 'utilisateur', 'Khouribga', 'HSEE', '123'),
(2, 'ACHABI Anass', 'admin', 'Khouribga', 'HSEE', '123'),
(3, 'EL KEHLAOUI Abdelaziz', 'utilisateur', 'Khouribga', 'HSEE', '123'),
(4, 'EL MOUHSINE Khalid', 'admin', 'Khouribga', 'HSEE', '123'),
(5, 'HIKIOUI Aziz', 'admin', 'Khouribga', 'HSEE', '123'),
(6, 'JALAL Abdelhadi', 'utilisateur', 'Khouribga', 'HSEE', '123'),
(7, 'LAHRICH Yassine', 'utilisateur', 'Khouribga', 'HSEE', '123'),
(8, 'NIJJAME Rachid', 'utilisateur', 'Khouribga', 'HSEE', '123'),
(9, 'TAJAOUI EL MOSTAFA', 'utilisateur', 'Khouribga', 'HSEE', '123'),
(10, 'HOUMMADA Taha', 'utilisateur', 'Khouribga', 'HSEE', '123'),
(11, 'GHAZZOU Chaffai', 'utilisateur', 'Khouribga', 'HSEE', '123'),
(12, 'BAKIA ABDESSAMAD', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(13, 'BERAICH ABDELALI', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(14, 'ENNADIR ABDELJALIL', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(15, 'HAMMI ABDELKADER', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(16, 'BENKRIKCH AYMEN', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(17, 'SADOUK DRISS', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(18, 'SALHI DRISS', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(19, 'EL MALKI ALAOUI ELGHALI', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(20, 'FADIL MOHAMMED', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(21, 'MOUDNI MOHAMMED', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(22, 'SERHANE YACINE', 'utilisateur', 'Khouribga', 'Génie Civil', '123'),
(23, 'El Mostafa NAJRI', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(24, 'ANNAIM CHAHMAT', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(25, 'Anouar EL MOUHTASSIB', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(26, 'Benhaddou Aziz', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(27, 'Elmatri Elmostafa', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(28, 'HAMID LAGHRIB', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(29, 'HASSAN KHAMACH', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(30, 'Hicham BARBISS', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(31, 'KALI Mourad', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(32, 'Laanaya Abdelkrim', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(33, 'MOHAMED BENMOUSSA', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(34, 'MOHAMED BOUJNAH', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(35, 'MOHAMED EL HACHIMI', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(36, 'Mohamed FAROUKI', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(37, 'Mustapha TAOUIL', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(38, 'Rachid ETTALBI', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(39, 'RACHID BRIDI', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(40, 'Salaheddine EL BAZ', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(41, 'sidi mohamd KABIRI', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(42, 'Zizi Abdelillah', 'utilisateur', 'Khouribga', 'Atelier centraux', '123'),
(43, 'ABOUZID Mostafa', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(44, 'AIT ALI OULHOCINE Abdelilah', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(45, 'AMOUCHAL Hicham', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(46, 'BADI Aziz', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(47, 'BAINE Hassan', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(48, 'BOUGARZANE Said', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(49, 'DOUHAJ Mohamed', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(50, 'EL BOUAMRI Rachid', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(51, 'MOUBARIKI Kamal', 'utilisateur', 'Khouribga', 'GARAGE', '123'),
(52, 'Abdellah BAZAOUI', 'utilisateur', 'Khouribga', 'Laboratoires d\'Analyses', '123'),
(53, 'Abdellatif EL GHARROUBI', 'utilisateur', 'Khouribga', 'Laboratoires d\'Analyses', '123'),
(54, 'Lhoucine NAJIMI', 'utilisateur', 'Khouribga', 'Laboratoires d\'Analyses', '123'),
(55, 'Mouhcine RAFAI', 'utilisateur', 'Khouribga', 'Laboratoires d\'Analyses', '123'),
(56, 'Touria BAYD', 'utilisateur', 'Khouribga', 'Laboratoires d\'Analyses', '123'),
(57, 'Youssef DOUK', 'utilisateur', 'Khouribga', 'Laboratoires d\'Analyses', '123'),
(58, 'Youssef EL FAQAR', 'utilisateur', 'Khouribga', 'Laboratoires d\'Analyses', '123'),
(59, 'ABDERRAHIM BANNOUR', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(60, 'DRISS IBNOU EL MOUBARAK', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(61, 'HASSAN ALAOUI M\'HAMMEDI', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(62, 'MOHAMMED SAID', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(63, 'MOHAMMED MOSTAPHI', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(64, 'MOSTAFA ZEROUAL', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(65, 'MOUHCINE IBENLHAJ', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(66, 'RAHHALI LAMCHAOURI', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(67, 'SAID CHAHED', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(68, 'YOUSSEF BEDDACHI', 'utilisateur', 'Khouribga', 'Maintenance S/E Hydraulique', '123'),
(69, 'CHICHI YOUSSEF', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(70, 'DRIF AMINE', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(71, 'EL KHETTAB HASSAN', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(72, 'EL MOUMNY MOHAMMED', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(73, 'FARIHI REDOUANE', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(74, 'HASSANI Otman', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(75, 'KHADRAOUI Mohammed', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(76, 'MOUJJANI MOHAMED', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(77, 'OUARRAQ ISSAM', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(78, 'SAM HASSAN', 'utilisateur', 'Khouribga', 'Maintenance Moteur Thermique', '123'),
(79, 'Youssef EL KHAZRI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(80, 'Abdelhak RACHIQ', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(81, 'Abdelilah KHAITI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(82, 'Abdellah BEN WAKKAS', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(83, 'Abdellatif ESSADSSI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(84, 'Abdessamad NAIMI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(85, 'Fouad FAIZ', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(86, 'Hicham ESSAHM', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(87, 'Mourad ER RAMI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(88, 'Nabil KHLIL', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(89, 'Noureddine MRABET KANDRI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(90, 'Saad SALAOU', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(91, 'SAID EL HARDI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(92, 'Youssef KETATNI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(93, 'Traik CHLIHI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(94, 'Driss SLLAOUI', 'utilisateur', 'Khouribga', 'S/E Electriques & Bobinages', '123'),
(95, 'ABRHORA SAID', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(96, 'BOUSMARA RACHID', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(97, 'EL ALAOUI YOUNESS', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(98, 'ELASSALI ABDERRAZAK', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(99, 'ELGAOUNI ABDELILAH', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(100, 'ELHADINE SALAH EDDINE', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(101, 'ELOMRANI ELIDRISSI HASSAN', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(102, 'FAKDAMI ABDESLEM', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(103, 'FALA HICHAM', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(104, 'HELLAOUI ABDELFETAH', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(105, 'JABBOUJA AHMED', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(106, 'KHARBOUT JAMAL', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(107, 'KHECHANE ZAKARIA', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(108, 'MAHMANI ABDELKEBIR', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(109, 'MARZOUQ BOUABID', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(110, 'MEKKAOUI RADOUANE', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(111, 'MOHSSINE REDA', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(112, 'RIDDAHI ZOUHAIR', 'utilisateur', 'Khouribga', 'S/E Traitement R6', '123'),
(113, 'Abdelkarim MOHTADI', 'utilisateur', 'Khouribga', 'STEP', '123'),
(114, 'Abdellah LOUTFI', 'utilisateur', 'Khouribga', 'STEP', '123'),
(115, 'DRISS LAGHZAOUI', 'utilisateur', 'Khouribga', 'STEP', '123'),
(116, 'Falah chouaib HAMDAOUI', 'utilisateur', 'Khouribga', 'STEP', '123'),
(117, 'Lahcen RAJJOU', 'utilisateur', 'Khouribga', 'STEP', '123'),
(118, 'Najib ELMOUTTAKI', 'utilisateur', 'Khouribga', 'STEP', '123'),
(119, 'Tariq EZZANDAOUY', 'utilisateur', 'Khouribga', 'STEP', '123'),
(120, 'HOUBBADI Abdelali', 'utilisateur', 'Khouribga', 'STEP', '123'),
(121, 'Youssef NADIF', 'utilisateur', 'Khouribga', 'TELECOM', '123'),
(122, 'Allal DADOUCH', 'utilisateur', 'Khouribga', 'TELECOM', '123'),
(123, 'Mohammed SERRAR', 'utilisateur', 'Khouribga', 'TELECOM', '123'),
(124, 'Karim BENKABBOUR', 'utilisateur', 'Khouribga', 'TELECOM', '123'),
(125, 'Rachid KABBORI', 'utilisateur', 'Khouribga', 'TELECOM', '123'),
(126, 'Hamid ER-RAJY', 'utilisateur', 'Khouribga', 'TELECOM', '123'),
(127, 'ZAHAR Yassine', 'utilisateur', 'Khouribga', 'TELECOM', '123'),
(128, 'ABDELHALIM FALAHI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(129, 'ABDELILAH GHAMRAOUI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(130, 'ABDELKRIM ATMANE', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(131, 'Achraf TOUAM', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(132, 'KAMAL EL ANI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(133, 'LEKBIR EL BATOULI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(134, 'Mourad SRIJA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(135, 'Radouane EL MARZOUKI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(136, 'YASSINE NAANANI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(137, 'SBAII Abderrazzak', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(138, 'RATTAL Abdelghani', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(139, 'RAZINE Mohamed', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(140, 'OUTOULOUT Jalal', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(141, 'DAKANI Youness', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(142, 'LABHAJI ECHARQI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(143, 'FETHRAHIM ABDELMOUNIM', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(144, 'BENDAM MOHAMED', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(145, 'LOUIHI BOUCHTA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(146, 'ZIT MOHAMED', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(147, 'ATANI BILAL', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(148, 'MANSOUR ABDELILAH', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(149, 'JAIL KHALID', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(150, 'BARROUG Abdelaziz', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(151, 'ZOUHIR Adnane', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(152, 'EL GOURAINI Redouane', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(153, 'MOULOUK Redouane', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(154, 'SAJID Abdelfattah', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(155, 'BOUBRAK Abdelilah', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(156, 'ES-SOUFI EL Mehdi', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(157, 'ITRBI HICHAM', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(158, 'MOUKRIM Hicham', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(159, 'HABCHI Khalid', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(160, 'IDOUBELLA Mohamed', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(161, 'BOUR Abdelkrim', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(162, 'ELMAFTOUH Ahmed', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(163, 'GHARBAOUI Noureddine', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(164, 'KARYM Hassan', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(165, 'Abderrezzak SIDKI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(166, 'Salah EL QEMMAHE', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(167, 'ABDELHAK AAIYAR', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(168, 'Abdellah BEJIJOU', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(169, 'ABDELLAH LAHMAMI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(170, 'ADIL NEFLA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(171, 'AZIZ BHAIRI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(172, 'BRAHIM DRAOUI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(173, 'EL MOSTAFA MADI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(174, 'FARID OUAMALICH', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(175, 'Hamid ADSAOUI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(176, 'HAMZA MOULOUA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(177, 'JAOUAD MOULOUA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(178, 'Jaouad MAHDOUFI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(179, 'MOHAMED ANESRAH', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(180, 'MOHAMED KHALIS', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(181, 'Mohammed BENSAMALI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(182, 'Mohammed FARHAT', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(183, 'Mohammed EL AICHORI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(184, 'Mohammed MINAOUI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(185, 'Mohammed ZARNAOUI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(186, 'Mouhsine ABDIA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(187, 'OTMANE ABDOUH', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(188, 'RADOUANE KHALOUA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(189, 'Said LOUBANI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(190, 'SAID YASSINE', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(191, 'Said BAQLOUL', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(192, 'SAMIR OUARKIA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(193, 'Tarik CHTIOUI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(194, 'Tarik OUADOUDI', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(195, 'YOUNES HACHAD', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(196, 'Youssef BAZZA', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(197, 'BENHOUMIT ADIL', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(198, 'Mohamed EL HAIMEUR', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(199, 'ESSALOUA Brahim', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(200, 'EL FARSI Youness', 'utilisateur', 'Khouribga', 'Sce eaux', '123'),
(201, 'IGGUIZ Jawad', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(202, 'ADNANE ZAKARIA', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(203, 'AFAR HAMID', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(204, 'ALLOU MOURAD', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(205, 'AMINE JALAL', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(206, 'BELLOUZI HAMID', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(207, 'BENDOUKALI MOURAD', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(208, 'BETTACHE ABDELLAH', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(209, 'BOUGHRELEB MOHAMMED', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(210, 'BOULAAICHI KHALID', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(211, 'BOUQFA YASSINE', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(212, 'CHARBI HICHAM', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(213, 'DIAMI HICHAM', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(214, 'DIB MOHAMMED', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(215, 'DIDI LAID', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(216, 'EL ASSRI HASSAN', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(217, 'EL BOUKRI ABDESALAM', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(218, 'EL FANTANI AHMED', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(219, 'EL GARRAS MOHAMED', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(220, 'EL KHAZFI BOUABID', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(221, 'EL OUARGUA KAMAL', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(222, 'EL-LAHQI YASSINE', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(223, 'ELMELENY MOURAD', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(224, 'EN-NAQADI YOUSSEF', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(225, 'ERRKAIBI AZEDDINE', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(226, 'EZ-ZAHRI Kacem', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(227, 'FARAHAT AHMED', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(228, 'FARNANE BADR', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(229, 'FATOUI KHALID', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(230, 'FOUZBI Hicham', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(231, 'HABBA Lahcen', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(232, 'JAMROUDI YOUSSEF', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(233, 'KARFAOUI Lhoussaine', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(234, 'KHALIL AZIZ', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(235, 'KOUIF MOHAMMED', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(236, 'LABHIRA Abdelhadi', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(237, 'LACHGAR ZOUHAIR', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(238, 'LKSNI EL MUSTAPHA', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(239, 'MORSSI JAWAD', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(240, 'MOUBACHAR MAROUANE', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(241, 'MOUSTANSIR MUSTAPHA', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(242, 'NAJMAOUI NOUREDDINE', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(243, 'OUBAHA MOHAMED', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(244, 'OUGHBAL SOUFIAN', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(245, 'OUHAHOU NOUREDDINE', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(246, 'SAHLI BADR', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(247, 'SAMRAOUI ELMOSTAFA', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(248, 'SELLAMI YASSINE', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(249, 'SFAIHI ABDELGHANI', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(250, 'YAZIDI MOULAY OMAR', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(251, 'YSTAM MOULAY TAKI', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(252, 'ZENNANE AHMED', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(253, 'ZROURI ABDELLAH', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(254, 'OUAZAR SOUFIANE', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(255, 'LAHRECH ILYAS', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(256, 'JOUHIRI LAHCEN', 'utilisateur', 'Khouribga', 'Sce Electrique', '123'),
(257, 'ZNIBER Mohammed', 'utilisateur', 'Khouribga', 'Sce Electrique', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT pour la table `saisie_travaux`
--
ALTER TABLE `saisie_travaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
