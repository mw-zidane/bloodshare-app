-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 01 juin 2025 à 18:31
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bloodlink_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `groupe_sanguin` varchar(10) DEFAULT NULL,
  `localisation` varchar(100) DEFAULT NULL,
  `nombre_poches` int(11) DEFAULT NULL,
  `date_limite` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `telephone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `requests`
--

INSERT INTO `requests` (`id`, `groupe_sanguin`, `localisation`, `nombre_poches`, `date_limite`, `created_at`, `telephone`) VALUES
(1, 'A+', 'douala', 3, '2025-05-26', '2025-05-26 14:37:13', NULL),
(2, 'A', 'douala', 2, '2025-05-27', '2025-05-27 17:45:00', '659336392'),
(3, 'B', 'yaoundé', 4, '2025-05-28', '2025-05-28 15:13:28', '657432136'),
(4, 'A', 'douala', 2, '2025-05-30', '2025-05-30 16:10:55', '658445532');

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mot_de_passe` varchar(100) DEFAULT NULL,
  `groupe_sanguin` varchar(10) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `email`, `mot_de_passe`, `groupe_sanguin`, `role`, `created_at`) VALUES
(1, 'freeky', 'freekydan2003@gmail.com', 'root', 'A', 'donneur', '2025-05-26 17:40:43'),
(2, 'rem', 'freekydan052003@gmail.com', 'rootroot', 'o', 'donneur', '2025-05-27 20:19:16'),
(5, 'arthur', 'esther1234@gmail.com', '&é\"\'', 'B', 'hopital', '2025-05-27 21:27:13'),
(6, 'lol', 'fall456@gmail.com', '&é\"\'(-', 'A', 'donneur', '2025-05-28 13:32:47');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
