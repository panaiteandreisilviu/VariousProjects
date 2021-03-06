-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 15, 2016 at 10:07 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proiectbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `Animal_ID` int(11) NOT NULL,
  `AnimalName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`Animal_ID`, `AnimalName`) VALUES
(1, 'Dog'),
(2, 'Cat'),
(3, 'Hamster'),
(4, 'GuineaPig'),
(5, 'Parrot'),
(6, 'Snake'),
(7, 'Turtle'),
(8, 'Iguana'),
(9, 'Ferret');

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `ConsultationID` int(11) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  `PetID` int(11) NOT NULL,
  `ConsultationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`ConsultationID`, `DoctorID`, `PetID`, `ConsultationDate`) VALUES
(45, 8, 4, '2016-01-30'),
(46, 8, 4, '2015-12-08'),
(47, 8, 3, '2015-12-30'),
(49, 7, 4, '2016-02-26'),
(50, 7, 4, '2015-11-09'),
(51, 8, 3, '2015-12-23'),
(52, 7, 4, '2016-01-18'),
(54, 8, 4, '2016-01-11'),
(55, 8, 4, '2016-01-11'),
(56, 8, 4, '2016-01-31'),
(57, 8, 4, '2015-11-09'),
(58, 8, 4, '2015-11-19'),
(59, 8, 3, '2015-11-25'),
(60, 8, 3, '2015-12-22'),
(61, 7, 3, '2016-01-20'),
(62, 7, 3, '2016-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `consultation_details`
--

CREATE TABLE `consultation_details` (
  `ConsultationID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consultation_type`
--

CREATE TABLE `consultation_type` (
  `TypeID` int(11) NOT NULL,
  `ConsulationName` varchar(30) NOT NULL,
  `ConsulationDuration` int(11) NOT NULL DEFAULT '30',
  `ConsulationCost` int(11) NOT NULL DEFAULT '50'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultation_type`
--

INSERT INTO `consultation_type` (`TypeID`, `ConsulationName`, `ConsulationDuration`, `ConsulationCost`) VALUES
(1, 'General Care', 30, 50),
(2, 'Deinfenstation', 30, 50),
(3, 'Dental Procedures', 30, 50),
(4, 'Neuter', 30, 50),
(5, 'Ophthalmology', 30, 50),
(6, 'Rehabilitation and Fitness', 30, 50),
(7, 'Growth Removal', 30, 50);

-- --------------------------------------------------------

--
-- Table structure for table `detalii_programare`
--

CREATE TABLE `detalii_programare` (
  `ID_DETALII_PROGRAMARE` int(11) NOT NULL,
  `ID_PROGRAMARE` int(11) NOT NULL,
  `ID_ANGAJAT` int(11) NOT NULL,
  `ID_SERVICIU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalii_programare`
--

INSERT INTO `detalii_programare` (`ID_DETALII_PROGRAMARE`, `ID_PROGRAMARE`, `ID_ANGAJAT`, `ID_SERVICIU`) VALUES
(1, 1, 4, 2),
(2, 1, 3, 12),
(3, 2, 7, 4),
(4, 9, 5, 5),
(5, 9, 6, 9),
(6, 10, 5, 23),
(7, 11, 4, 3),
(8, 11, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `DoctorID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`DoctorID`, `UserID`) VALUES
(7, 5),
(8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `PetID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `Animal_ID` int(11) NOT NULL,
  `PetName` varchar(30) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `YearOfBirth` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`PetID`, `OwnerID`, `Animal_ID`, `PetName`, `Color`, `YearOfBirth`) VALUES
(3, 1, 2, 'Toto', 'Black', 2010),
(4, 1, 1, 'Kitty', 'Green', 2012),
(5, 3, 7, 'Rex', 'Blue', 1957);

-- --------------------------------------------------------

--
-- Table structure for table `pet_owners`
--

CREATE TABLE `pet_owners` (
  `OwnerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pet_owners`
--

INSERT INTO `pet_owners` (`OwnerID`, `UserID`) VALUES
(2, 5),
(1, 7),
(3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `usercredentials`
--

CREATE TABLE `usercredentials` (
  `UserID` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` char(64) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `userType` tinyint(1) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usercredentials`
--

INSERT INTO `usercredentials` (`UserID`, `username`, `password`, `first_name`, `last_name`, `userType`) VALUES
(0, 'root', 'a80b568a237f50391d2f1f97beaf99564e33d2e1c8a2e5cac21ceda701570312', 'yyyy', 'yyyy', 0),
(5, 'ionica1000', 'ace76ee561f1facd93f7297df599dbe76bfd7840ea5233b82b9c861f22b03236', 'Ionescu', 'Gheorghe', 1),
(6, 'petrica1000', '77f22ac008288a4dfb40f0e5093993db48e468ddd6d8a710e029ebbdb77c84c9', 'Florescu', 'Petrica', 2),
(7, 'ilie1000', '65bb1cc2fd5feddea98e1d9e3ec89fae2a3f50ed42d6fb96962ef8cd0e2cfcb7', 'Popescu', 'Ilie', 2),
(9, 'user', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 'Panaite', 'Andrei', 2),
(10, 'doctor', '72f4be89d6ebab1496e21e38bcd7c8ca0a68928af3081ad7dff87e772eb350c2', 'Florinescu', 'Andrei', 1),
(11, 'florin1000', '65bb1cc2fd5feddea98e1d9e3ec89fae2a3f50ed42d6fb96962ef8cd0e2cfcb7', 'Calinescu', 'Florin', 2),
(12, 'iliescu1000', 'a80b568a237f50391d2f1f97beaf99564e33d2e1c8a2e5cac21ceda701570312', 'Iliescu', 'Alexandru', 2),
(13, 'xxxx', 'b7fb217694ae2d305e766608d250f797daa984e4ac4b5fa638a729be352f2fcd', 'xxxx', 'xxxx', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE `usertypes` (
  `userType` tinyint(1) NOT NULL,
  `Type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`userType`, `Type`) VALUES
(0, 'Admin'),
(1, 'Doctor'),
(2, 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`Animal_ID`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`ConsultationID`),
  ADD KEY `DoctorID` (`DoctorID`),
  ADD KEY `PetID` (`PetID`);

--
-- Indexes for table `consultation_details`
--
ALTER TABLE `consultation_details`
  ADD PRIMARY KEY (`ConsultationID`,`TypeID`),
  ADD KEY `ConsultationID` (`ConsultationID`),
  ADD KEY `TypeID` (`TypeID`);

--
-- Indexes for table `consultation_type`
--
ALTER TABLE `consultation_type`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `detalii_programare`
--
ALTER TABLE `detalii_programare`
  ADD PRIMARY KEY (`ID_DETALII_PROGRAMARE`),
  ADD KEY `ID_PROGRAMARE` (`ID_PROGRAMARE`),
  ADD KEY `ID_ANGAJAT` (`ID_ANGAJAT`),
  ADD KEY `ID_SERVICIU` (`ID_SERVICIU`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`PetID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `Animal_ID` (`Animal_ID`);

--
-- Indexes for table `pet_owners`
--
ALTER TABLE `pet_owners`
  ADD PRIMARY KEY (`OwnerID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `usercredentials`
--
ALTER TABLE `usercredentials`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `userType` (`userType`);

--
-- Indexes for table `usertypes`
--
ALTER TABLE `usertypes`
  ADD PRIMARY KEY (`userType`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `Animal_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `ConsultationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `consultation_type`
--
ALTER TABLE `consultation_type`
  MODIFY `TypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `detalii_programare`
--
ALTER TABLE `detalii_programare`
  MODIFY `ID_DETALII_PROGRAMARE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `PetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pet_owners`
--
ALTER TABLE `pet_owners`
  MODIFY `OwnerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `usercredentials`
--
ALTER TABLE `usercredentials`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `ConsultationDoctorID_FK` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  ADD CONSTRAINT `ConsultationPetID_FK` FOREIGN KEY (`PetID`) REFERENCES `pets` (`PetID`);

--
-- Constraints for table `consultation_details`
--
ALTER TABLE `consultation_details`
  ADD CONSTRAINT `ConsultationDetID` FOREIGN KEY (`ConsultationID`) REFERENCES `consultation` (`ConsultationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ConsultationTypeID` FOREIGN KEY (`TypeID`) REFERENCES `consultation_type` (`TypeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `UserIDDoctor_FK` FOREIGN KEY (`UserID`) REFERENCES `usercredentials` (`UserID`);

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `AnimalID_FK` FOREIGN KEY (`Animal_ID`) REFERENCES `animals` (`Animal_ID`),
  ADD CONSTRAINT `PetOwnerID_FK` FOREIGN KEY (`OwnerID`) REFERENCES `pet_owners` (`OwnerID`);

--
-- Constraints for table `pet_owners`
--
ALTER TABLE `pet_owners`
  ADD CONSTRAINT `UserIDPetOwner_FK` FOREIGN KEY (`UserID`) REFERENCES `usercredentials` (`UserID`);

--
-- Constraints for table `usercredentials`
--
ALTER TABLE `usercredentials`
  ADD CONSTRAINT `usercredentials_ibfk_1` FOREIGN KEY (`userType`) REFERENCES `usertypes` (`userType`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
