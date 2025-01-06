-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 06 jan. 2025 à 14:34
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `HIRABIO`
--

-- --------------------------------------------------------

--
-- Structure de la table `Biocontrôle_Culture`
--

CREATE TABLE `Biocontrôle_Culture` (
  `id_biocontrôle` int(11) NOT NULL,
  `id_methode` int(11) DEFAULT NULL,
  `id_culture` int(11) DEFAULT NULL,
  `pourcentage_satisfaction` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Biocontrôle_Culture`
--

INSERT INTO `Biocontrôle_Culture` (`id_biocontrôle`, `id_methode`, `id_culture`, `pourcentage_satisfaction`) VALUES
(1, 1, 1, 80.00),
(2, 2, 1, 90.00),
(3, 3, 1, 85.00),
(4, 4, 2, 76.00),
(5, 5, 2, 70.00),
(6, 6, 2, 78.00),
(7, 7, 3, 60.00),
(8, 8, 3, 65.00),
(9, 9, 3, 70.00),
(10, 10, 4, 85.00),
(11, 11, 4, 78.00);

-- --------------------------------------------------------

--
-- Structure de la table `Cultures`
--

CREATE TABLE `Cultures` (
  `id_culture` int(11) NOT NULL,
  `nom_culture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Cultures`
--

INSERT INTO `Cultures` (`id_culture`, `nom_culture`) VALUES
(1, 'Tomates'),
(2, 'Betteraves'),
(3, 'Courgettes'),
(4, 'Epinards');

-- --------------------------------------------------------

--
-- Structure de la table `Cultures_Methodes`
--

CREATE TABLE `Cultures_Methodes` (
  `id_association` int(11) NOT NULL,
  `id_culture` int(11) DEFAULT NULL,
  `id_methode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Cultures_Methodes`
--

INSERT INTO `Cultures_Methodes` (`id_association`, `id_culture`, `id_methode`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 4, 10),
(11, 4, 11);

-- --------------------------------------------------------

--
-- Structure de la table `Filieres`
--

CREATE TABLE `Filieres` (
  `id_filiere` int(11) NOT NULL,
  `nom_filiere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Filieres`
--

INSERT INTO `Filieres` (`id_filiere`, `nom_filiere`) VALUES
(1, 'Légumes'),
(2, 'Arboriculture'),
(3, 'Horticulture');

-- --------------------------------------------------------

--
-- Structure de la table `Methodes`
--

CREATE TABLE `Methodes` (
  `id_methode` int(11) NOT NULL,
  `nom_methode` varchar(255) NOT NULL,
  `niveau_satisfaction` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Methodes`
--

INSERT INTO `Methodes` (`id_methode`, `nom_methode`, `niveau_satisfaction`) VALUES
(1, 'Bacillus thuringiensis', 'Bon'),
(2, 'Lecanicillium muscarium', 'Bon'),
(3, 'Phéromone lépidoptères', 'Bon'),
(4, 'Acide pélargoniqu', 'Bon'),
(5, 'Coniothyrium minitan', 'Bon'),
(6, 'Phosphate ferrique', 'Bon'),
(7, 'Moutarde anti-nématode', 'Aucun avis émis'),
(8, 'Aphidius sp.', 'Bon'),
(9, 'Phosphonates de potassium', 'Aucun avis émis'),
(10, 'Sorgho anti nématodes', 'Mitigé'),
(11, 'Soufre', 'Aucun avis émis'),
(12, 'Bacillus subtilis', 'Bon'),
(13, 'Coniothyrium minitans', 'Mitigé'),
(14, 'Phosphate ferrique', 'Insatisfaisant');

-- --------------------------------------------------------

--
-- Structure de la table `Projets`
--

CREATE TABLE `Projets` (
  `id_projet` int(11) NOT NULL,
  `nom_projet` varchar(255) NOT NULL,
  `pourcentage_satisfaction` decimal(5,2) DEFAULT NULL,
  `id_filiere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Projets`
--

INSERT INTO `Projets` (`id_projet`, `nom_projet`, `pourcentage_satisfaction`, `id_filiere`) VALUES
(1, 'BioREco', 84.33, 1),
(2, 'CAP ReD', 80.33, 1),
(3, 'EcoPêche', 95.00, 1),
(4, 'EXPE Ecophyto Pomme', 66.67, 1),
(5, 'HORTIFLOR', 87.33, 2),
(6, 'HORTIPEPI', 94.33, 2),
(7, 'HORTIPOT', 88.67, 2),
(8, 'Otelho', 84.33, 2),
(9, '4SYSLEG', 78.67, 3),
(10, 'BREIZLEG', 66.67, 3),
(11, 'DEPHY Carotte', 62.67, 3),
(12, 'DEPHY EXP NPDC', 100.00, 3),
(13, 'DEPHY Fraise', 76.00, 3),
(14, 'DEPHY Serre', 77.33, 3),
(15, 'ECOLEG', 100.00, 3),
(16, 'GEDUBAT', 64.00, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Biocontrôle_Culture`
--
ALTER TABLE `Biocontrôle_Culture`
  ADD PRIMARY KEY (`id_biocontrôle`),
  ADD KEY `id_methode` (`id_methode`),
  ADD KEY `id_culture` (`id_culture`);

--
-- Index pour la table `Cultures`
--
ALTER TABLE `Cultures`
  ADD PRIMARY KEY (`id_culture`);

--
-- Index pour la table `Cultures_Methodes`
--
ALTER TABLE `Cultures_Methodes`
  ADD PRIMARY KEY (`id_association`),
  ADD KEY `id_culture` (`id_culture`),
  ADD KEY `id_methode` (`id_methode`);

--
-- Index pour la table `Filieres`
--
ALTER TABLE `Filieres`
  ADD PRIMARY KEY (`id_filiere`);

--
-- Index pour la table `Methodes`
--
ALTER TABLE `Methodes`
  ADD PRIMARY KEY (`id_methode`);

--
-- Index pour la table `Projets`
--
ALTER TABLE `Projets`
  ADD PRIMARY KEY (`id_projet`),
  ADD KEY `id_filiere` (`id_filiere`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Biocontrôle_Culture`
--
ALTER TABLE `Biocontrôle_Culture`
  MODIFY `id_biocontrôle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `Cultures`
--
ALTER TABLE `Cultures`
  MODIFY `id_culture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Cultures_Methodes`
--
ALTER TABLE `Cultures_Methodes`
  MODIFY `id_association` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `Filieres`
--
ALTER TABLE `Filieres`
  MODIFY `id_filiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Methodes`
--
ALTER TABLE `Methodes`
  MODIFY `id_methode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `Projets`
--
ALTER TABLE `Projets`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Biocontrôle_Culture`
--
ALTER TABLE `Biocontrôle_Culture`
  ADD CONSTRAINT `biocontrôle_culture_ibfk_1` FOREIGN KEY (`id_methode`) REFERENCES `Methodes` (`id_methode`),
  ADD CONSTRAINT `biocontrôle_culture_ibfk_2` FOREIGN KEY (`id_culture`) REFERENCES `Cultures` (`id_culture`);

--
-- Contraintes pour la table `Cultures_Methodes`
--
ALTER TABLE `Cultures_Methodes`
  ADD CONSTRAINT `cultures_methodes_ibfk_1` FOREIGN KEY (`id_culture`) REFERENCES `Cultures` (`id_culture`),
  ADD CONSTRAINT `cultures_methodes_ibfk_2` FOREIGN KEY (`id_methode`) REFERENCES `Methodes` (`id_methode`);

--
-- Contraintes pour la table `Projets`
--
ALTER TABLE `Projets`
  ADD CONSTRAINT `projets_ibfk_1` FOREIGN KEY (`id_filiere`) REFERENCES `Filieres` (`id_filiere`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
