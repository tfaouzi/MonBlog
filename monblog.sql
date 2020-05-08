-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 18 Février 2016 à 14:47
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `monblog`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_billet`
--

CREATE TABLE IF NOT EXISTS `t_billet` (
  `BIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BIL_DATE` datetime NOT NULL,
  `BIL_TITRE` varchar(100) NOT NULL,
  `BIL_CONTENU` varchar(400) NOT NULL,
  PRIMARY KEY (`BIL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_billet`
--

INSERT INTO `t_billet` (`BIL_ID`, `BIL_DATE`, `BIL_TITRE`, `BIL_CONTENU`) VALUES
(1, '2015-02-04 14:16:02', 'Premier billet', 'Bonjour monde ! Ceci est le premier billet sur mon blog.'),
(2, '2015-02-04 14:16:02', 'Au travail', 'Il faut enrichir ce blog dès maintenant.'),
(3, '2015-03-05 13:47:48', 'Météo', 'meteo jeudi'),
(4, '0000-00-00 00:00:00', 'Wamp : Accès à son site en local sur tous supports ', 'Il serait très utile, pendant le développement de votre site en local, que vous puissiez avoir une idée du rendu sur votre smartphone, votre tablette...\r\n\r\nCela permettra d''avoir une idée en temps réel\r\n\r\nAlors comment faire, pour avoir accès au site, en local, sur ces différents supports.\r\n\r\nPas de grande configuration, ni de paramétrage difficile pour mettre cela en place. Il suffit, pour commen'),
(5, '2016-02-17 00:00:00', 'Wamp : Accès à son site en local sur tous supports', 'Il serait très utile, pendant le développement de votre site en local, que vous puissiez avoir une idée du rendu sur votre smartphone, votre tablette...\r\n\r\nCela permettra d''avoir une idée en temps réel\r\n\r\nAlors comment faire, pour avoir accès au site, en local, sur ces différents supports.\r\n\r\nPas de grande configuration, ni de paramétrage difficile pour mettre cela en place. Il suffit, pour commen'),
(6, '2016-02-16 14:15:00', 'Wamp : Accès à son site en local sur tous supports ', 'Il serait très utile, pendant le développement de votre site en local, que vous puissiez avoir une idée du rendu sur votre smartphone, votre tablette...\r\n\r\nCela permettra d''avoir une idée en temps réel\r\n\r\nAlors comment faire, pour avoir accès au site, en local, sur ces différents supports.');

-- --------------------------------------------------------

--
-- Structure de la table `t_commentaire`
--

CREATE TABLE IF NOT EXISTS `t_commentaire` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_DATE` datetime NOT NULL,
  `COM_AUTEUR` varchar(100) NOT NULL,
  `COM_CONTENU` varchar(200) NOT NULL,
  `BIL_ID` int(11) NOT NULL,
  PRIMARY KEY (`COM_ID`),
  KEY `fk_com_bil` (`BIL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_commentaire`
--

INSERT INTO `t_commentaire` (`COM_ID`, `COM_DATE`, `COM_AUTEUR`, `COM_CONTENU`, `BIL_ID`) VALUES
(1, '2015-02-04 14:16:02', 'A. Nonyme', 'Bravo pour ce début', 1),
(2, '2015-02-04 14:16:02', 'Moi', 'Merci ! Je vais continuer sur ma lancée', 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_commentaire`
--
ALTER TABLE `t_commentaire`
  ADD CONSTRAINT `fk_com_bil` FOREIGN KEY (`BIL_ID`) REFERENCES `t_billet` (`BIL_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
