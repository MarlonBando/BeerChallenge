-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 26, 2022 alle 13:53
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
(1, 'Rebe', 5, 1, 2);

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
(4, 'Birrificio Lambrate', 'Via benedetto 22 Lambrate', 'birrificiolambrate@gmail.com', 'birrificiolambrate', 'https://www.lenius.it/birra-artigianale-a-milano-top-5/%27');

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
(1, 1, 1, '2016-01-10');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `beertype`
--
ALTER TABLE `beertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `brewery`
--
ALTER TABLE `brewery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `competition`
--
ALTER TABLE `competition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
