-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 28, 2022 alle 21:45
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beerchallenge`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `beer`
--

CREATE TABLE `beer` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `alcoholContent` float NOT NULL,
  `idType` int(11) NOT NULL,
  `idBrewery` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `beer`
--

INSERT INTO `beer` (`id`, `name`, `alcoholContent`, `idType`, `idBrewery`) VALUES
(1, 'Rebe', 5, 1, 2),
(2, 'la bionda', 3.2, 1, 2),
(3, 'dragone biondo', 4.1, 2, 2),
(4, 'Inferno rosso', 5.6, 8, 1),
(5, 'Marylin Morrow', 3.2, 4, 2),
(6, 'Paint it Black', 5.6, 10, 2),
(7, 'Blody Mery', 7, 8, 2),
(8, 'I 5 Luppoli', 4.5, 3, 1),
(9, 'Nastro Azzurro', 4, 2, 1),
(10, 'La castagna', 7, 10, 1),
(11, 'Guinness', 6, 11, 1),
(12, 'L ambrata', 5, 7, 1),
(13, 'Il baffo rosso', 6, 8, 1),
(14, 'Sole', 3.2, 1, 3),
(15, 'Home', 4.1, 2, 3),
(16, 'Alice in the wonderland', 5.6, 8, 3),
(17, 'Banana soul', 3.2, 4, 3),
(18, 'Coffe paradise', 5.6, 10, 3),
(19, 'Sium', 7, 8, 3),
(22, 'Señoripa', 6, 6, 5),
(27, 'Pilotta', 8.5, 10, 5),
(28, 'Red Blues', 6.5, 8, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `beertype`
--

CREATE TABLE `beertype` (
  `id` int(11) NOT NULL,
  `color` varchar(6) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `beertype`
--

INSERT INTO `beertype` (`id`, `color`, `name`) VALUES
(1, 'blonde', 'blanche'),
(2, 'blonde', 'Weiss'),
(3, 'blonde', 'Golden Ale'),
(4, 'blonde', 'Lager'),
(5, 'blonde', 'Genesis'),
(6, 'blonde', 'Ipa'),
(7, 'red', 'Marzen'),
(8, 'red', 'Red Ale'),
(9, 'dark', 'Stout'),
(10, 'dark', 'Imperial'),
(11, 'dark', 'Porter');

-- --------------------------------------------------------

--
-- Struttura della tabella `brewery`
--

CREATE TABLE `brewery` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(320) NOT NULL,
  `password` varchar(30) NOT NULL,
  `link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `brewery`
--

INSERT INTO `brewery` (`id`, `name`, `address`, `email`, `password`, `link`) VALUES
(1, 'a', 'via garibaldi 21', 'a@a.a', 'a', 'a.it'),
(2, 'Mosto Dolce', 'Via Nazionale 114/R Firenze', 'mostodolce@gmail.com', 'mostodolce', 'https://www.mostodolce.it/%27'),
(3, 'MadOne', 'Via Beduschi 45 Casalmaggiore', 'madone@gmail.com', 'madone', 'https://mad-one.it/%27'),
(4, 'Birrificio Lambrate', 'Via benedetto 22 Lambrate', 'birrificiolambrate@gmail.com', 'birrificiolambrate', 'https://www.lenius.it/birra-artigianale-a-milano-top-5/%27'),
(5, 'Birrificio Gregorio', 'Via Reggio 14 Parma PR', 'birrificio.gregorio@gmail.com', 'birrificiogregorio', 'https://www.birrificiogregorio.it/'),
(9, 'Birrificio Argo', 'Via Giuseppe di Vittorio  78/a Lemignano PR', 'birrificioargo@gmail.com', 'birrificioargo', 'https://birrificioargo.com/');

-- --------------------------------------------------------

--
-- Struttura della tabella `competition`
--

CREATE TABLE `competition` (
  `id` int(11) NOT NULL,
  `name` varchar(21) NOT NULL,
  `year` int(11) NOT NULL,
  `deadline` date NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `competition`
--

INSERT INTO `competition` (`id`, `name`, `year`, `deadline`, `date`) VALUES
(1, 'Beer Challenge', 2016, '2016-03-20', '2016-06-15'),
(2, 'Beer Challenge', 2017, '2017-03-20', '2017-06-15'),
(3, 'Beer Challenge', 2018, '2018-03-20', '2018-06-15'),
(4, 'Beer Challenge', 2019, '2019-03-20', '2019-06-15'),
(5, 'Beer Challenge', 2020, '2020-03-20', '2020-06-15'),
(6, 'Beer Challenge', 2021, '2021-03-20', '2021-06-15'),
(7, 'Beer Challenge', 2022, '2022-03-20', '2022-06-15');

-- --------------------------------------------------------

--
-- Struttura della tabella `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `idCompetition` int(11) NOT NULL,
  `idBeer` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `registration`
--

INSERT INTO `registration` (`id`, `idCompetition`, `idBeer`, `date`) VALUES
(1, 1, 1, '2016-01-10'),
(2, 1, 1, '2016-01-01'),
(3, 1, 4, '2016-01-01'),
(4, 1, 8, '2016-01-01'),
(5, 2, 2, '2017-01-01'),
(6, 2, 19, '2017-01-01'),
(7, 2, 12, '2017-01-01'),
(8, 3, 5, '2018-01-01'),
(9, 3, 17, '2018-01-01'),
(10, 3, 11, '2018-01-01'),
(11, 4, 3, '2019-01-01'),
(12, 4, 9, '2019-01-01'),
(13, 4, 16, '2019-01-01'),
(14, 5, 6, '2020-01-01'),
(15, 5, 7, '2020-01-01'),
(16, 5, 14, '2020-01-01'),
(17, 6, 10, '2021-01-01'),
(18, 6, 13, '2021-01-01'),
(19, 6, 18, '2021-01-01'),
(20, 7, 22, '2022-02-28'),
(26, 7, 28, '2022-02-28');

-- --------------------------------------------------------

--
-- Struttura della tabella `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `idRegistration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `result`
--

INSERT INTO `result` (`id`, `position`, `idRegistration`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 3, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 3, 9),
(10, 1, 10),
(11, 3, 11),
(12, 1, 12),
(13, 2, 13),
(14, 1, 14),
(15, 3, 15),
(16, 1, 16),
(17, 2, 17),
(18, 3, 18),
(19, 1, 19);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `beer`
--
ALTER TABLE `beer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_brewery` (`idBrewery`),
  ADD KEY `fk_type` (`idType`);

--
-- Indici per le tabelle `beertype`
--
ALTER TABLE `beertype`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `brewery`
--
ALTER TABLE `brewery`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_competition` (`idCompetition`),
  ADD KEY `fk_beer` (`idBeer`);

--
-- Indici per le tabelle `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_registration` (`idRegistration`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `beer`
--
ALTER TABLE `beer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la tabella `beertype`
--
ALTER TABLE `beertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `brewery`
--
ALTER TABLE `brewery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `competition`
--
ALTER TABLE `competition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT per la tabella `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `beer`
--
ALTER TABLE `beer`
  ADD CONSTRAINT `fk_brewery` FOREIGN KEY (`idBrewery`) REFERENCES `brewery` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_type` FOREIGN KEY (`idType`) REFERENCES `beertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `fk_beer` FOREIGN KEY (`idBeer`) REFERENCES `beer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_competition` FOREIGN KEY (`idCompetition`) REFERENCES `competition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `fk_registration` FOREIGN KEY (`idRegistration`) REFERENCES `registration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
