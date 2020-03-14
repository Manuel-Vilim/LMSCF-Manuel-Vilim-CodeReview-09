-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Mrz 2020 um 12:35
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `delivery_service_company`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `delivery_address` varchar(200) DEFAULT NULL,
  `target_country` varchar(200) DEFAULT NULL,
  `tagret_location` varchar(100) DEFAULT NULL,
  `target_first_name` varchar(100) DEFAULT NULL,
  `target_last_name` varchar(100) DEFAULT NULL,
  `credit_card_info` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_ID`, `first_name`, `last_name`, `delivery_address`, `target_country`, `tagret_location`, `target_first_name`, `target_last_name`, `credit_card_info`) VALUES
(1, 'Patrick', 'Mayer', 'Mayergasse5', 'Austria', 'Vienna', 'Traude', 'Happel', 'MasterCard10025484544'),
(2, 'Walter', 'Huber', 'Steigergasse12', 'Austria', 'Vienna', 'Mira', 'Lubic', 'Visa100558945'),
(3, 'Martina', 'Rut', 'Waldheimweg', 'Germany', 'Bayern', 'Peter', 'Welt', 'AmericanExpress10058994');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_ID` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `receiving_date` date NOT NULL,
  `receiving_time` time DEFAULT NULL,
  `forwarding_date` date NOT NULL,
  `forwarding_time` time DEFAULT NULL,
  `fk_payment_ID` int(11) DEFAULT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL,
  `fk_product_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_ID`, `first_name`, `last_name`, `receiving_date`, `receiving_time`, `forwarding_date`, `forwarding_time`, `fk_payment_ID`, `fk_customer_ID`, `fk_product_ID`) VALUES
(1, 'Max', 'Mustermann', '2020-03-26', '11:12:13', '2020-03-26', '13:14:15', 1, 1, 1),
(2, 'Olaf', 'Lind', '2020-03-02', '23:12:13', '2020-03-03', '02:14:15', 2, 2, 2),
(3, 'Lisa', 'Wald', '2020-03-01', '21:12:13', '2020-03-01', '23:14:15', 3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `payment_ID` int(11) NOT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL,
  `fk_employee_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`payment_ID`, `fk_customer_ID`, `fk_employee_ID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `product_ID` int(11) NOT NULL,
  `weight_in_g` int(11) DEFAULT NULL,
  `type_of_sending` varchar(100) DEFAULT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `product`
--

INSERT INTO `product` (`product_ID`, `weight_in_g`, `type_of_sending`, `fk_customer_ID`) VALUES
(1, 50, 'Mail', 1),
(2, 60, 'Mail', 1),
(3, 10000, 'package', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `storage`
--

CREATE TABLE `storage` (
  `storage_ID` int(11) NOT NULL,
  `receiving_date` date NOT NULL,
  `receiving_time` time DEFAULT NULL,
  `forwarding_date` date NOT NULL,
  `forwarding_time` time DEFAULT NULL,
  `fk_employee_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `storage`
--

INSERT INTO `storage` (`storage_ID`, `receiving_date`, `receiving_time`, `forwarding_date`, `forwarding_time`, `fk_employee_ID`) VALUES
(1, '2020-03-27', '22:23:24', '2020-03-27', '23:24:25', 1),
(2, '2020-03-04', '14:23:24', '2020-03-04', '15:24:25', 2),
(3, '2020-03-02', '20:23:24', '2020-03-02', '23:24:25', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transport`
--

CREATE TABLE `transport` (
  `transport_ID` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `delivery_time` time DEFAULT NULL,
  `fk_storage_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `transport`
--

INSERT INTO `transport` (`transport_ID`, `type`, `delivery_date`, `delivery_time`, `fk_storage_ID`) VALUES
(1, 'Truck', '2020-03-28', '13:14:15', 1),
(2, 'Moped', '2020-03-05', '12:14:15', 2),
(3, 'E-Scooter', '2020-03-03', '13:00:15', 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_ID`),
  ADD KEY `fk_payment_ID` (`fk_payment_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_product_ID` (`fk_product_ID`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`);

--
-- Indizes für die Tabelle `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`storage_ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`);

--
-- Indizes für die Tabelle `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_ID`),
  ADD KEY `fk_storage_ID` (`fk_storage_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_payment_ID`) REFERENCES `payment` (`payment_ID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`fk_product_ID`) REFERENCES `product` (`product_ID`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`employee_ID`);

--
-- Constraints der Tabelle `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints der Tabelle `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`employee_ID`);

--
-- Constraints der Tabelle `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`fk_storage_ID`) REFERENCES `storage` (`storage_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
